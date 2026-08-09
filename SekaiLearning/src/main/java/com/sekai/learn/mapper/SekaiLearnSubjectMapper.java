package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnSubjectDO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface SekaiLearnSubjectMapper {
    List<SekaiLearnSubjectDO> findAll();
    SekaiLearnSubjectDO findById(Long id);
}
