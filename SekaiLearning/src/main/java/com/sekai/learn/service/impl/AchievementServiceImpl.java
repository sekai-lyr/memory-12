package com.sekai.learn.service.impl;

import com.sekai.learn.dataobject.SekaiLearnUserAchievementDO;
import com.sekai.learn.dataobject.SekaiLearnUserDO;
import com.sekai.learn.mapper.SekaiLearnAchievementMapper;
import com.sekai.learn.mapper.SekaiLearnStudyRecordMapper;
import com.sekai.learn.mapper.SekaiLearnUserMapper;
import com.sekai.learn.model.Achievement;
import com.sekai.learn.service.AchievementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class AchievementServiceImpl implements AchievementService {

    @Autowired
    private SekaiLearnAchievementMapper achievementMapper;

    @Autowired
    private SekaiLearnStudyRecordMapper studyRecordMapper;

    @Autowired
    private SekaiLearnUserMapper userMapper;

    @Override
    public List<Achievement> getAllAchievements() {
        return achievementMapper.findAllEnabled();
    }

    @Override
    public List<Map<String, Object>> getUserAchievements(Long userId) {
        List<Achievement> allAchievements = achievementMapper.findAllEnabled();
        List<SekaiLearnUserAchievementDO> userAchievements = achievementMapper.findByUserId(userId);

        Set<String> unlockedIds = userAchievements.stream()
            .map(SekaiLearnUserAchievementDO::getAchievementId)
            .collect(Collectors.toSet());

        return allAchievements.stream().map(ach -> {
            Map<String, Object> map = new HashMap<>();
            map.put("id", ach.getId());
            map.put("name", ach.getName());
            map.put("description", ach.getDescription());
            map.put("icon", ach.getIcon());
            map.put("category", ach.getCategory());
            map.put("rewardCoins", ach.getRewardCoins());
            map.put("unlocked", unlockedIds.contains(ach.getId()));
            return map;
        }).collect(Collectors.toList());
    }

    @Override
    @Transactional
    public void checkAndUnlock(Long userId) {
        List<Achievement> allAchievements = achievementMapper.findAllEnabled();

        for (Achievement ach : allAchievements) {
            if (achievementMapper.existsByUserIdAndAchievementId(userId, ach.getId()) > 0) {
                continue;
            }

            boolean shouldUnlock = false;
            switch (ach.getCategory()) {
                case "reading":
                    int readCount = studyRecordMapper.countByUserIdAndType(userId, "paper_read");
                    shouldUnlock = readCount >= ach.getRequiredValue();
                    break;
                case "streak":
                    SekaiLearnUserDO user = userMapper.findById(userId);
                    if (user != null) {
                        shouldUnlock = user.getStreakDays() >= ach.getRequiredValue();
                    }
                    break;
                default:
                    break;
            }

            if (shouldUnlock) {
                SekaiLearnUserAchievementDO uaDO = new SekaiLearnUserAchievementDO();
                uaDO.setUserId(userId);
                uaDO.setAchievementId(ach.getId());
                achievementMapper.insertUserAchievement(uaDO);
            }
        }
    }
}
