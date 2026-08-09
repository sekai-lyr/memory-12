package com.sekai.learn.dataobject;

import java.time.LocalDateTime;

public class SekaiLearnUserProgressDO {
    private Long id;
    private Long userId;
    private Long lessonId;
    private String status;
    private Integer readCount;
    private Integer timeSpentSeconds;
    private LocalDateTime completedAt;
    private LocalDateTime startedAt;
    private LocalDateTime updatedAt;

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
    public LocalDateTime getCompletedAt() { return completedAt; }
    public void setCompletedAt(LocalDateTime completedAt) { this.completedAt = completedAt; }
    public LocalDateTime getStartedAt() { return startedAt; }
    public void setStartedAt(LocalDateTime startedAt) { this.startedAt = startedAt; }
    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
}
