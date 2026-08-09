package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnCoinLogDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnCoinLogMapper {
    List<SekaiLearnCoinLogDO> findByUserId(@Param("userId") Long userId);
    int insert(SekaiLearnCoinLogDO log);
}
