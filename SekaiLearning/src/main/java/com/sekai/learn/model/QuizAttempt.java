package com.sekai.learn.model;

public class QuizAttempt {
    private Long id;
    private Long userId;
    private Long lessonId;
    private Double score;
    private Integer totalQuestions;
    private Integer correctCount;
    private String completedAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public Long getLessonId() { return lessonId; }
    public void setLessonId(Long lessonId) { this.lessonId = lessonId; }
    public Double getScore() { return score; }
    public void setScore(Double score) { this.score = score; }
    public Integer getTotalQuestions() { return totalQuestions; }
    public void setTotalQuestions(Integer totalQuestions) { this.totalQuestions = totalQuestions; }
    public Integer getCorrectCount() { return correctCount; }
    public void setCorrectCount(Integer correctCount) { this.correctCount = correctCount; }
    public String getCompletedAt() { return completedAt; }
    public void setCompletedAt(String completedAt) { this.completedAt = completedAt; }
}
