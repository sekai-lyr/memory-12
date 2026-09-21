package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnResourceDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnResourceMapper {
    List<SekaiLearnResourceDO> findByCourseId(@Param("courseId") Long courseId);
    SekaiLearnResourceDO findById(@Param("id") Long id);
}
