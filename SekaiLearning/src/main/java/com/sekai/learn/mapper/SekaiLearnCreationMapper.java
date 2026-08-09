package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnCreationDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnCreationMapper {
    SekaiLearnCreationDO findById(@Param("id") Long id);
    List<SekaiLearnCreationDO> findByUserId(@Param("userId") Long userId);
    List<SekaiLearnCreationDO> findRecent(@Param("limit") int limit);
    int insert(SekaiLearnCreationDO creation);
    int update(SekaiLearnCreationDO creation);
    int deleteById(@Param("id") Long id);
    int incrementLikes(@Param("id") Long id);
    int decrementLikes(@Param("id") Long id);
    int incrementComments(@Param("id") Long id);
}
