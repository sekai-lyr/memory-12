package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnStudyRecordDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnStudyRecordMapper {
    List<SekaiLearnStudyRecordDO> findByUserId(@Param("userId") Long userId);
    List<SekaiLearnStudyRecordDO> findByUserIdAndType(@Param("userId") Long userId, @Param("studyType") String studyType);
    int insert(SekaiLearnStudyRecordDO record);
    int countByUserIdAndType(@Param("userId") Long userId, @Param("studyType") String studyType);
    int sumDurationByUserId(@Param("userId") Long userId);
}
