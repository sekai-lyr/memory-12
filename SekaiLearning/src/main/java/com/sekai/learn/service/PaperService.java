package com.sekai.learn.service;

import com.sekai.learn.model.Paper;
import com.sekai.learn.model.Scene;
import java.util.List;
import java.util.Optional;

public interface PaperService {
    Paper uploadPaper(Long userId, String title, String contentText, String fileType, String characterId);
    Optional<Paper> getPaperById(Long id);
    List<Paper> getPapersByUserId(Long userId);
    List<Scene> getScenesByPaperId(Long paperId);
    Paper generateScenes(Long paperId);
    void deletePaper(Long paperId, Long userId);
}
