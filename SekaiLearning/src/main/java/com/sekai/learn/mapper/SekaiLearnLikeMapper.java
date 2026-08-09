package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnLikeDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SekaiLearnLikeMapper {
    SekaiLearnLikeDO findByUserAndCreation(@Param("userId") Long userId, @Param("creationId") Long creationId);
    int insert(SekaiLearnLikeDO like);
    int deleteByUserAndCreation(@Param("userId") Long userId, @Param("creationId") Long creationId);
    int countByCreationId(@Param("creationId") Long creationId);
}
