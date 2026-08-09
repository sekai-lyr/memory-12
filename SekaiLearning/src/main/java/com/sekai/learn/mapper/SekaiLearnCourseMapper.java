package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnCourseDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnCourseMapper {
    List<SekaiLearnCourseDO> findBySubjectId(@Param("subjectId") Long subjectId);
    SekaiLearnCourseDO findById(@Param("id") Long id);
    List<SekaiLearnCourseDO> findAll();
}
