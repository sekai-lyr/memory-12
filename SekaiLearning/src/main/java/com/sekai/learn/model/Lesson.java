package com.sekai.learn.model;

import java.util.List;

public class Lesson {
    private Long id;
    private Long courseId;
    private String title;
    private String content;
    private String summary;
    private String keyPoints;
    private String difficulty;
    private Integer estimatedMinutes;
    private Integer sortOrder;
    private String status;
    private String createdAt;
    private String progressStatus;
    private List<QuizQuestion> questions;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getCourseId() { return courseId; }
    public void setCourseId(Long courseId) { this.courseId = courseId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public String getSummary() { return summary; }
    public void setSummary(String summary) { this.summary = summary; }
    public String getKeyPoints() { return keyPoints; }
    public void setKeyPoints(String keyPoints) { this.keyPoints = keyPoints; }
    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }
    public Integer getEstimatedMinutes() { return estimatedMinutes; }
    public void setEstimatedMinutes(Integer estimatedMinutes) { this.estimatedMinutes = estimatedMinutes; }
    public Integer getSortOrder() { return sortOrder; }
    public void setSortOrder(Integer sortOrder) { this.sortOrder = sortOrder; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
    public String getProgressStatus() { return progressStatus; }
    public void setProgressStatus(String progressStatus) { this.progressStatus = progressStatus; }
    public List<QuizQuestion> getQuestions() { return questions; }
    public void setQuestions(List<QuizQuestion> questions) { this.questions = questions; }
}
