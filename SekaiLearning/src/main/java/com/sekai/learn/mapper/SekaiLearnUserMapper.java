package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnUserDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnUserMapper {
    SekaiLearnUserDO findById(@Param("id") Long id);
    SekaiLearnUserDO findByUsername(@Param("username") String username);
    int existsByUsername(@Param("username") String username);
    int insert(SekaiLearnUserDO user);
    int update(SekaiLearnUserDO user);
    List<SekaiLearnUserDO> findAll();
    int updateExpAndLevel(@Param("id") Long id, @Param("expPoints") Integer expPoints, @Param("level") Integer level);
    int updateCoins(@Param("id") Long id, @Param("coins") Integer coins);
    int updateCheckin(@Param("id") Long id, @Param("streakDays") Integer streakDays, @Param("lastCheckinDate") String lastCheckinDate);
}
