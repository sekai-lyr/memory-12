package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnUserAchievementDO;
import com.sekai.learn.model.Achievement;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnAchievementMapper {
    List<Achievement> findAllEnabled();
    Achievement findById(@Param("id") String id);
    List<SekaiLearnUserAchievementDO> findByUserId(@Param("userId") Long userId);
    int insertUserAchievement(SekaiLearnUserAchievementDO ua);
    int existsByUserIdAndAchievementId(@Param("userId") Long userId, @Param("achievementId") String achievementId);
}
