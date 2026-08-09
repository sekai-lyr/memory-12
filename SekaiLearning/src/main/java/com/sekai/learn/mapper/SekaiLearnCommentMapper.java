package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnCommentDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnCommentMapper {
    List<SekaiLearnCommentDO> findByCreationId(@Param("creationId") Long creationId);
    int insert(SekaiLearnCommentDO comment);
    int deleteById(@Param("id") Long id);
}
