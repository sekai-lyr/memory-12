package com.sekai.learn.service;

import com.sekai.learn.model.QuizResult;

public interface ProgressService {
    void startLesson(Long userId, Long lessonId);
    void completeLesson(Long userId, Long lessonId);
    QuizResult submitQuiz(Long userId, Long lessonId, java.util.Map<Long, String> answers);
}
