package com.sekai.learn.mapper;

import com.sekai.learn.dataobject.SekaiLearnQuizQuestionDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface SekaiLearnQuizQuestionMapper {
    List<SekaiLearnQuizQuestionDO> findByLessonId(@Param("lessonId") Long lessonId);
    int countByLessonId(@Param("lessonId") Long lessonId);
}
