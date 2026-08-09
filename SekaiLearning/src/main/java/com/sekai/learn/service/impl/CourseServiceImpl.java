package com.sekai.learn.service.impl;

import com.sekai.learn.dataobject.*;
import com.sekai.learn.mapper.*;
import com.sekai.learn.model.*;
import com.sekai.learn.service.CourseService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private SekaiLearnSubjectMapper subjectMapper;

    @Autowired
    private SekaiLearnCourseMapper courseMapper;

    @Autowired
    private SekaiLearnLessonMapper lessonMapper;

    @Autowired
    private SekaiLearnUserProgressMapper progressMapper;

    @Autowired
    private SekaiLearnQuizQuestionMapper quizQuestionMapper;

    @Override
    public List<Subject> getSubjects() {
        List<SekaiLearnSubjectDO> subjects = subjectMapper.findAll();
        return subjects.stream().map(this::toModel).collect(Collectors.toList());
    }

    @Override
    public Subject getSubjectById(Long id) {
        SekaiLearnSubjectDO subject = subjectMapper.findById(id);
        if (subject == null) return null;
        return toModel(subject);
    }

    @Override
    public List<Course> getCoursesBySubjectId(Long subjectId, Long userId) {
        List<SekaiLearnCourseDO> courses = courseMapper.findBySubjectId(subjectId);
        return courses.stream().map(c -> {
            Course course = toModel(c);
            if (userId != null) {
                fillCourseProgress(course, userId);
            }
            return course;
        }).collect(Collectors.toList());
    }

    @Override
    public Course getCourseById(Long id, Long userId) {
        SekaiLearnCourseDO course = courseMapper.findById(id);
        if (course == null) return null;
        Course model = toModel(course);
        if (userId != null) {
            fillCourseProgress(model, userId);
        }
        return model;
    }

    @Override
    public List<Lesson> getLessonsByCourseId(Long courseId, Long userId) {
        List<SekaiLearnLessonDO> lessons = lessonMapper.findByCourseId(courseId);
        return lessons.stream().map(l -> {
            Lesson lesson = toModel(l);
            if (userId != null) {
                SekaiLearnUserProgressDO progress = progressMapper.findByUserAndLesson(userId, l.getId());
                lesson.setProgressStatus(progress != null ? progress.getStatus() : "not_started");
            }
            return lesson;
        }).collect(Collectors.toList());
    }

    @Override
    public Lesson getLessonById(Long id, Long userId) {
        SekaiLearnLessonDO lesson = lessonMapper.findById(id);
        if (lesson == null) return null;
        Lesson model = toModel(lesson);
        if (userId != null) {
            SekaiLearnUserProgressDO progress = progressMapper.findByUserAndLesson(userId, id);
            model.setProgressStatus(progress != null ? progress.getStatus() : "not_started");
        }
        List<SekaiLearnQuizQuestionDO> questions = quizQuestionMapper.findByLessonId(id);
        model.setQuestions(questions.stream().map(this::toModel).collect(Collectors.toList()));
        return model;
    }

    private void fillCourseProgress(Course course, Long userId) {
        List<SekaiLearnLessonDO> lessons = lessonMapper.findByCourseId(course.getId());
        int completed = 0;
        for (SekaiLearnLessonDO lesson : lessons) {
            SekaiLearnUserProgressDO progress = progressMapper.findByUserAndLesson(userId, lesson.getId());
            if (progress != null && "completed".equals(progress.getStatus())) {
                completed++;
            }
        }
        course.setCompletedLessons(completed);
    }

    private Subject toModel(SekaiLearnSubjectDO subjectDO) {
        Subject s = new Subject();
        BeanUtils.copyProperties(subjectDO, s);
        if (subjectDO.getCreatedAt() != null) s.setCreatedAt(subjectDO.getCreatedAt().toString());
        return s;
    }

    private Course toModel(SekaiLearnCourseDO courseDO) {
        Course c = new Course();
        BeanUtils.copyProperties(courseDO, c);
        if (courseDO.getCreatedAt() != null) c.setCreatedAt(courseDO.getCreatedAt().toString());
        return c;
    }

    private Lesson toModel(SekaiLearnLessonDO lessonDO) {
        Lesson l = new Lesson();
        BeanUtils.copyProperties(lessonDO, l);
        if (lessonDO.getCreatedAt() != null) l.setCreatedAt(lessonDO.getCreatedAt().toString());
        return l;
    }

    private QuizQuestion toModel(SekaiLearnQuizQuestionDO qqDO) {
        QuizQuestion q = new QuizQuestion();
        BeanUtils.copyProperties(qqDO, q);
        if (qqDO.getCreatedAt() != null) q.setCreatedAt(qqDO.getCreatedAt().toString());
        return q;
    }
}
