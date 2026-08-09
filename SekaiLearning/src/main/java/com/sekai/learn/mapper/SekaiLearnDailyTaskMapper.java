package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnDailyTaskDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SekaiLearnDailyTaskMapper {
    SekaiLearnDailyTaskDO findByUserAndDate(@Param("userId") Long userId, @Param("taskDate") String taskDate);
    int insert(SekaiLearnDailyTaskDO task);
    int update(SekaiLearnDailyTaskDO task);
}
