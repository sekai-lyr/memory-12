package com.sekai.learn.service;

import com.sekai.learn.model.Creation;
import com.sekai.learn.model.Comment;
import java.util.List;
import java.util.Map;

public interface CreationService {
    Creation createCreation(Long userId, String title, String content, String coverUrl, String creationType, String tagsJson);
    List<Creation> getRecentCreations(int limit);
    List<Creation> getUserCreations(Long userId);
    Creation getCreationById(Long id);
    void deleteCreation(Long id, Long userId);
    Map<String, Object> toggleLike(Long userId, Long creationId);
    List<Comment> getComments(Long creationId);
    Comment addComment(Long userId, Long creationId, String content, Long parentId);
}
