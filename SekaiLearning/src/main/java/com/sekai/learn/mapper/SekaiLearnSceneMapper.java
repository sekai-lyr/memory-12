package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnSceneDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnSceneMapper {
    List<SekaiLearnSceneDO> findByPaperId(@Param("paperId") Long paperId);
    SekaiLearnSceneDO findById(@Param("id") Long id);
    int insert(SekaiLearnSceneDO scene);
    int insertBatch(@Param("scenes") List<SekaiLearnSceneDO> scenes);
    int deleteByPaperId(@Param("paperId") Long paperId);
}
