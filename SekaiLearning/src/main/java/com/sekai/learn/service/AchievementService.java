package com.sekai.learn.service;

import com.sekai.learn.model.Achievement;
import java.util.List;
import java.util.Map;

public interface AchievementService {
    List<Achievement> getAllAchievements();
    List<Map<String, Object>> getUserAchievements(Long userId);
    void checkAndUnlock(Long userId);
}
