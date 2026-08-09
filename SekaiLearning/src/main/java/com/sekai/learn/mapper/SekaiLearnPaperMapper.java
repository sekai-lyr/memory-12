package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnPaperDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnPaperMapper {
    SekaiLearnPaperDO findById(@Param("id") Long id);
    List<SekaiLearnPaperDO> findByUserId(@Param("userId") Long userId);
    int insert(SekaiLearnPaperDO paper);
    int update(SekaiLearnPaperDO paper);
    int deleteById(@Param("id") Long id);
    int countByUserId(@Param("userId") Long userId);
}
