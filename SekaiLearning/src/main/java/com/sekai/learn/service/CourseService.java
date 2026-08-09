package com.sekai.learn.service;

import com.sekai.learn.model.*;
import java.util.List;

public interface CourseService {
    List<Subject> getSubjects();
    Subject getSubjectById(Long id);
    List<Course> getCoursesBySubjectId(Long subjectId, Long userId);
    Course getCourseById(Long id, Long userId);
    List<Lesson> getLessonsByCourseId(Long courseId, Long userId);
    Lesson getLessonById(Long id, Long userId);
}
