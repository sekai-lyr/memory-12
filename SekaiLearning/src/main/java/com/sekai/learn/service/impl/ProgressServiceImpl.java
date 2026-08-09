package com.sekai.learn.service.impl;

import com.sekai.learn.dataobject.*;
import com.sekai.learn.mapper.*;
import com.sekai.learn.model.*;
import com.sekai.learn.service.ProgressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class ProgressServiceImpl implements ProgressService {

    @Autowired
    private SekaiLearnUserProgressMapper progressMapper;

    @Autowired
    private SekaiLearnQuizAttemptMapper quizAttemptMapper;

    @Autowired
    private SekaiLearnQuizQuestionMapper quizQuestionMapper;

    @Autowired
    private SekaiLearnUserMapper userMapper;

    @Override
    @Transactional
    public void startLesson(Long userId, Long lessonId) {
        SekaiLearnUserProgressDO progress = progressMapper.findByUserAndLesson(userId, lessonId);
        if (progress == null) {
            progress = new SekaiLearnUserProgressDO();
            progress.setUserId(userId);
            progress.setLessonId(lessonId);
            progress.setStatus("in_progress");
            progress.setReadCount(1);
            progress.setTimeSpentSeconds(0);
            progress.setStartedAt(LocalDateTime.now());
            progressMapper.insert(progress);
        } else {
            if (!"completed".equals(progress.getStatus())) {
                progress.setStatus("in_progress");
            }
            progress.setReadCount(progress.getReadCount() != null ? progress.getReadCount() + 1 : 1);
            progressMapper.update(progress);
        }
    }

    @Override
    @Transactional
    public void completeLesson(Long userId, Long lessonId) {
        SekaiLearnUserProgressDO progress = progressMapper.findByUserAndLesson(userId, lessonId);
        if (progress == null) {
            progress = new SekaiLearnUserProgressDO();
            progress.setUserId(userId);
            progress.setLessonId(lessonId);
            progress.setReadCount(1);
            progress.setStartedAt(LocalDateTime.now());
            progressMapper.insert(progress);
        }
        progress.setStatus("completed");
        progress.setCompletedAt(LocalDateTime.now());
        progressMapper.update(progress);
    }

    @Override
    @Transactional
    public QuizResult submitQuiz(Long userId, Long lessonId, Map<Long, String> answers) {
        List<SekaiLearnQuizQuestionDO> questions = quizQuestionMapper.findByLessonId(lessonId);
        if (questions.isEmpty()) {
            throw new RuntimeException("该课程没有测验题目");
        }

        int correctCount = 0;
        List<String> wrongExplanations = new ArrayList<>();

        for (SekaiLearnQuizQuestionDO q : questions) {
            String userAnswer = answers.get(q.getId());
            if (userAnswer != null && userAnswer.trim().equalsIgnoreCase(q.getCorrectAnswer().trim())) {
                correctCount++;
            } else {
                wrongExplanations.add(q.getQuestion() + " - 正确答案: " + q.getCorrectAnswer() +
                    (q.getExplanation() != null ? " (" + q.getExplanation() + ")" : ""));
            }
        }

        int totalQuestions = questions.size();
        double score = totalQuestions > 0 ? (double) correctCount / totalQuestions * 100 : 0;
        BigDecimal scoreDecimal = BigDecimal.valueOf(score).setScale(1, RoundingMode.HALF_UP);

        SekaiLearnQuizAttemptDO attempt = new SekaiLearnQuizAttemptDO();
        attempt.setUserId(userId);
        attempt.setLessonId(lessonId);
        attempt.setScore(scoreDecimal);
        attempt.setTotalQuestions(totalQuestions);
        attempt.setCorrectCount(correctCount);
        quizAttemptMapper.insert(attempt);

        int expEarned = 0;
        String levelUp = null;
        if (correctCount == totalQuestions) {
            expEarned = 30;
        } else if (score >= 60) {
            expEarned = 15;
        } else {
            expEarned = 5;
        }

        if (expEarned > 0) {
            SekaiLearnUserDO user = userMapper.findById(userId);
            if (user != null) {
                int newExp = user.getExpPoints() + expEarned;
                int newLevel = 1;
                int tempExp = newExp;
                while (tempExp >= newLevel * 100) {
                    tempExp -= newLevel * 100;
                    newLevel++;
                }
                int oldLevel = user.getLevel();
                userMapper.updateExpAndLevel(userId, newExp, newLevel);
                if (newLevel > oldLevel) {
                    levelUp = "恭喜！升级到 Lv." + newLevel + "！";
                }
            }
        }

        QuizResult result = new QuizResult();
        result.setSuccess(score >= 60);
        result.setScore(scoreDecimal.doubleValue());
        result.setTotalQuestions(totalQuestions);
        result.setCorrectCount(correctCount);
        result.setWrongExplanations(wrongExplanations);
        result.setExpEarned(expEarned);
        result.setLevelUp(levelUp);
        return result;
    }
}
