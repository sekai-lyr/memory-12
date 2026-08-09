package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnLessonDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnLessonMapper {
    List<SekaiLearnLessonDO> findByCourseId(@Param("courseId") Long courseId);
    SekaiLearnLessonDO findById(@Param("id") Long id);
}
