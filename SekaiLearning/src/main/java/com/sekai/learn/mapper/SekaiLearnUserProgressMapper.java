package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnUserProgressDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnUserProgressMapper {
    SekaiLearnUserProgressDO findByUserAndLesson(@Param("userId") Long userId, @Param("lessonId") Long lessonId);
    List<SekaiLearnUserProgressDO> findByUserId(@Param("userId") Long userId);
    int insert(SekaiLearnUserProgressDO progress);
    int update(SekaiLearnUserProgressDO progress);
    int countCompletedByUserId(@Param("userId") Long userId);
    int countCompletedByUserIdAndCourseIds(@Param("userId") Long userId, @Param("courseIds") List<Long> courseIds);
}
