package com.sekai.learn.service.impl;

import com.sekai.learn.dataobject.SekaiLearnCommentDO;
import com.sekai.learn.dataobject.SekaiLearnCreationDO;
import com.sekai.learn.dataobject.SekaiLearnLikeDO;
import com.sekai.learn.mapper.SekaiLearnCommentMapper;
import com.sekai.learn.mapper.SekaiLearnCreationMapper;
import com.sekai.learn.mapper.SekaiLearnLikeMapper;
import com.sekai.learn.model.Comment;
import com.sekai.learn.model.Creation;
import com.sekai.learn.service.CreationService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class CreationServiceImpl implements CreationService {

    @Autowired
    private SekaiLearnCreationMapper creationMapper;

    @Autowired
    private SekaiLearnCommentMapper commentMapper;

    @Autowired
    private SekaiLearnLikeMapper likeMapper;

    @Override
    @Transactional
    public Creation createCreation(Long userId, String title, String content, String coverUrl, String creationType, String tagsJson) {
        title = title == null ? null : title.trim();
        content = content == null ? null : content.trim();
        if (userId == null) {
            throw new RuntimeException("用户信息无效");
        }
        if (title == null || title.isEmpty() || title.length() > 200) {
            throw new RuntimeException("标题不能为空且不能超过 200 个字符");
        }
        if (content == null || content.isEmpty()) {
            throw new RuntimeException("内容不能为空");
        }
        Set<String> allowedTypes = Set.of("note", "artwork", "voice", "other");
        if (!allowedTypes.contains(creationType)) {
            throw new RuntimeException("作品类型无效");
        }
        SekaiLearnCreationDO creationDO = new SekaiLearnCreationDO();
        creationDO.setUserId(userId);
        creationDO.setTitle(title);
        creationDO.setContent(content);
        creationDO.setCoverUrl(coverUrl);
        creationDO.setCreationType(creationType);
        creationDO.setTagsJson(tagsJson != null ? tagsJson : "[]");
        creationDO.setLikesCount(0);
        creationDO.setCommentsCount(0);
        creationDO.setStatus("published");
        creationMapper.insert(creationDO);
        return toModel(creationDO);
    }

    @Override
    public List<Creation> getRecentCreations(int limit) {
        limit = Math.max(1, Math.min(limit, 100));
        return creationMapper.findRecent(limit).stream()
            .map(this::toModel)
            .collect(Collectors.toList());
    }

    @Override
    public List<Creation> getUserCreations(Long userId) {
        return creationMapper.findByUserId(userId).stream()
            .map(this::toModel)
            .collect(Collectors.toList());
    }

    @Override
    public Creation getCreationById(Long id) {
        SekaiLearnCreationDO creationDO = creationMapper.findById(id);
        return creationDO != null ? toModel(creationDO) : null;
    }

    @Override
    @Transactional
    public void deleteCreation(Long id, Long userId) {
        SekaiLearnCreationDO creationDO = creationMapper.findById(id);
        if (creationDO == null || !creationDO.getUserId().equals(userId)) {
            throw new RuntimeException("无权删除");
        }
        creationMapper.deleteById(id);
    }

    @Override
    @Transactional
    public Map<String, Object> toggleLike(Long userId, Long creationId) {
        SekaiLearnLikeDO existing = likeMapper.findByUserAndCreation(userId, creationId);
        Map<String, Object> result = new HashMap<>();

        if (existing != null) {
            likeMapper.deleteByUserAndCreation(userId, creationId);
            creationMapper.decrementLikes(creationId);
            result.put("liked", false);
        } else {
            SekaiLearnLikeDO likeDO = new SekaiLearnLikeDO();
            likeDO.setUserId(userId);
            likeDO.setCreationId(creationId);
            likeMapper.insert(likeDO);
            creationMapper.incrementLikes(creationId);
            result.put("liked", true);
        }

        result.put("likesCount", likeMapper.countByCreationId(creationId));
        return result;
    }

    @Override
    public List<Comment> getComments(Long creationId) {
        return commentMapper.findByCreationId(creationId).stream()
            .map(commentDO -> {
                Comment comment = new Comment();
                BeanUtils.copyProperties(commentDO, comment);
                if (commentDO.getCreatedAt() != null) comment.setCreatedAt(commentDO.getCreatedAt().toString());
                return comment;
            })
            .collect(Collectors.toList());
    }

    @Override
    @Transactional
    public Comment addComment(Long userId, Long creationId, String content, Long parentId) {
        content = content == null ? null : content.trim();
        if (userId == null || creationId == null) {
            throw new RuntimeException("用户或作品信息无效");
        }
        if (content == null || content.isEmpty() || content.length() > 1000) {
            throw new RuntimeException("评论不能为空且不能超过 1000 个字符");
        }
        if (creationMapper.findById(creationId) == null) {
            throw new RuntimeException("作品不存在");
        }
        SekaiLearnCommentDO commentDO = new SekaiLearnCommentDO();
        commentDO.setCreationId(creationId);
        commentDO.setUserId(userId);
        commentDO.setContent(content);
        commentDO.setParentId(parentId);
        commentMapper.insert(commentDO);
        creationMapper.incrementComments(creationId);

        Comment comment = new Comment();
        BeanUtils.copyProperties(commentDO, comment);
        if (commentDO.getCreatedAt() != null) comment.setCreatedAt(commentDO.getCreatedAt().toString());
        return comment;
    }

    private Creation toModel(SekaiLearnCreationDO creationDO) {
        Creation creation = new Creation();
        BeanUtils.copyProperties(creationDO, creation);
        if (creationDO.getCreatedAt() != null) creation.setCreatedAt(creationDO.getCreatedAt().toString());
        if (creationDO.getUpdatedAt() != null) creation.setUpdatedAt(creationDO.getUpdatedAt().toString());
        return creation;
    }
}
