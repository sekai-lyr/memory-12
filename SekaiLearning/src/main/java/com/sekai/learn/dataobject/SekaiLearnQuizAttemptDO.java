package com.sekai.learn.dataobject;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class SekaiLearnQuizAttemptDO {
    private Long id;
    private Long userId;
    private Long lessonId;
    private BigDecimal score;
    private Integer totalQuestions;
    private Integer correctCount;
    private LocalDateTime completedAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public Long getLessonId() { return lessonId; }
    public void setLessonId(Long lessonId) { this.lessonId = lessonId; }
    public BigDecimal getScore() { return score; }
    public void setScore(BigDecimal score) { this.score = score; }
    public Integer getTotalQuestions() { return totalQuestions; }
    public void setTotalQuestions(Integer totalQuestions) { this.totalQuestions = totalQuestions; }
    public Integer getCorrectCount() { return correctCount; }
    public void setCorrectCount(Integer correctCount) { this.correctCount = correctCount; }
    public LocalDateTime getCompletedAt() { return completedAt; }
    public void setCompletedAt(LocalDateTime completedAt) { this.completedAt = completedAt; }
}
