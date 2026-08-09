package com.sekai.learn.model;

public class UserProgress {
    private Long id;
    private Long userId;
    private Long lessonId;
    private String status;
    private Integer readCount;
    private Integer timeSpentSeconds;
    private String completedAt;
    private String startedAt;
    private String updatedAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public Long getLessonId() { return lessonId; }
    public void setLessonId(Long lessonId) { this.lessonId = lessonId; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Integer getReadCount() { return readCount; }
    public void setReadCount(Integer readCount) { this.readCount = readCount; }
    public Integer getTimeSpentSeconds() { return timeSpentSeconds; }
    public void setTimeSpentSeconds(Integer timeSpentSeconds) { this.timeSpentSeconds = timeSpentSeconds; }
    public String getCompletedAt() { return completedAt; }
    public void setCompletedAt(String completedAt) { this.completedAt = completedAt; }
    public String getStartedAt() { return startedAt; }
    public void setStartedAt(String startedAt) { this.startedAt = startedAt; }
    public String getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(String updatedAt) { this.updatedAt = updatedAt; }
}
