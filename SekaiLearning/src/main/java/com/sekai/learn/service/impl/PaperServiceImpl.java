package com.sekai.learn.service.impl;

import com.sekai.learn.dataobject.SekaiLearnPaperDO;
import com.sekai.learn.dataobject.SekaiLearnSceneDO;
import com.sekai.learn.mapper.SekaiLearnPaperMapper;
import com.sekai.learn.mapper.SekaiLearnSceneMapper;
import com.sekai.learn.model.Paper;
import com.sekai.learn.model.Scene;
import com.sekai.learn.service.PaperService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class PaperServiceImpl implements PaperService {

    @Autowired
    private SekaiLearnPaperMapper paperMapper;

    @Autowired
    private SekaiLearnSceneMapper sceneMapper;

    @Override
    @Transactional
    public Paper uploadPaper(Long userId, String title, String contentText, String fileType, String characterId) {
        SekaiLearnPaperDO paperDO = new SekaiLearnPaperDO();
        paperDO.setUserId(userId);
        paperDO.setTitle(title);
        paperDO.setFileType(fileType);
        paperDO.setContentText(contentText);
        paperDO.setCharacterId(characterId);
        paperDO.setStatus("uploaded");
        paperMapper.insert(paperDO);
        return toModel(paperDO);
    }

    @Override
    public Optional<Paper> getPaperById(Long id) {
        SekaiLearnPaperDO paperDO = paperMapper.findById(id);
        return Optional.ofNullable(paperDO).map(this::toModel);
    }

    @Override
    public List<Paper> getPapersByUserId(Long userId) {
        return paperMapper.findByUserId(userId).stream()
            .map(this::toModel)
            .collect(Collectors.toList());
    }

    @Override
    public List<Scene> getScenesByPaperId(Long paperId) {
        return sceneMapper.findByPaperId(paperId).stream()
            .map(sceneDO -> {
                Scene scene = new Scene();
                BeanUtils.copyProperties(sceneDO, scene);
                if (sceneDO.getCreatedAt() != null) scene.setCreatedAt(sceneDO.getCreatedAt().toString());
                return scene;
            })
            .collect(Collectors.toList());
    }

    @Override
    @Transactional
    public Paper generateScenes(Long paperId) {
        SekaiLearnPaperDO paperDO = paperMapper.findById(paperId);
        if (paperDO == null) {
            throw new RuntimeException("论文不存在");
        }

        String content = paperDO.getContentText();
        if (content == null || content.isEmpty()) {
            throw new RuntimeException("论文内容为空，无法生成对话");
        }

        // 分割内容为章节（简单按段落分割）
        String[] paragraphs = content.split("\\n\\n+");
        List<SekaiLearnSceneDO> scenes = new ArrayList<>();

        for (int i = 0; i < Math.min(paragraphs.length, 20); i++) {
            String para = paragraphs[i].trim();
            if (para.isEmpty()) continue;

            SekaiLearnSceneDO sceneDO = new SekaiLearnSceneDO();
            sceneDO.setPaperId(paperId);
            sceneDO.setSceneIndex(i);
            sceneDO.setChapterTitle("第" + (i + 1) + "部分");

            // 生成对话JSON - 角色讲解 + 用户互动
            String dialogue = generateDialogue(para, paperDO.getCharacterId());
            sceneDO.setDialogueJson(dialogue);
            scenes.add(sceneDO);
        }

        if (!scenes.isEmpty()) {
            sceneMapper.deleteByPaperId(paperId);
            sceneMapper.insertBatch(scenes);
        }

        paperDO.setStatus("ready");
        paperMapper.update(paperDO);
        return toModel(paperDO);
    }

    private String generateDialogue(String content, String characterId) {
        String charName = getCharacterName(characterId);
        // 简单的对话模板生成
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append("{\"speaker\":\"").append(charName).append("\",\"text\":\"让我来为你讲解这部分内容吧！\",\"emotion\":\"happy\",\"type\":\"dialogue\"}");
        sb.append(",{\"speaker\":\"").append(charName).append("\",\"text\":\"").append(escapeJson(content.length() > 200 ? content.substring(0, 200) + "..." : content)).append("\",\"emotion\":\"thinking\",\"type\":\"dialogue\"}");
        sb.append(",{\"speaker\":\"system\",\"text\":\"理解了吗？可以点击继续学习下一部分~\",\"type\":\"hint\"}");
        sb.append("]");
        return sb.toString();
    }

    private String getCharacterName(String characterId) {
        if (characterId == null) return "讲解员";
        switch (characterId) {
            case "char-miku": return "初音未来";
            case "char-reimu": return "博丽灵梦";
            case "char-rin": return "铃仙";
            case "char-rem": return "蕾姆";
            case "char-kurisu": return "牧濑红莉栖";
            default: return "讲解员";
        }
    }

    private String escapeJson(String s) {
        return s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "");
    }

    @Override
    @Transactional
    public void deletePaper(Long paperId, Long userId) {
        SekaiLearnPaperDO paperDO = paperMapper.findById(paperId);
        if (paperDO == null || !paperDO.getUserId().equals(userId)) {
            throw new RuntimeException("无权删除");
        }
        sceneMapper.deleteByPaperId(paperId);
        paperMapper.deleteById(paperId);
    }

    private Paper toModel(SekaiLearnPaperDO paperDO) {
        Paper paper = new Paper();
        BeanUtils.copyProperties(paperDO, paper);
        if (paperDO.getCreatedAt() != null) paper.setCreatedAt(paperDO.getCreatedAt().toString());
        if (paperDO.getUpdatedAt() != null) paper.setUpdatedAt(paperDO.getUpdatedAt().toString());
        return paper;
    }
}
