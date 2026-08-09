package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnQuizAttemptDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnQuizAttemptMapper {
    int insert(SekaiLearnQuizAttemptDO attempt);
    List<SekaiLearnQuizAttemptDO> findByUserId(@Param("userId") Long userId);
    List<SekaiLearnQuizAttemptDO> findByUserAndLesson(@Param("userId") Long userId, @Param("lessonId") Long lessonId);
}
