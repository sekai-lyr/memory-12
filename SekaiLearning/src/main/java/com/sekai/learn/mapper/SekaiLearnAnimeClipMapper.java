package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnAnimeClipDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnAnimeClipMapper {
    SekaiLearnAnimeClipDO findById(@Param("id") Long id);
    List<SekaiLearnAnimeClipDO> findAllEnabled();
    List<SekaiLearnAnimeClipDO> findByDifficulty(@Param("difficulty") String difficulty);
    int insert(SekaiLearnAnimeClipDO clip);
    int updateViewCount(@Param("id") Long id);
}
