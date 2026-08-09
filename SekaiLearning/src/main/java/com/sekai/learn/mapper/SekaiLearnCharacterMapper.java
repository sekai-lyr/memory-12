package com.sekai.learn.mapper;

import com.sekai.learn.model.Character;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnCharacterMapper {
    Character findById(@Param("id") String id);
    List<Character> findAllEnabled();
    int insert(Character character);
    int update(Character character);
}
