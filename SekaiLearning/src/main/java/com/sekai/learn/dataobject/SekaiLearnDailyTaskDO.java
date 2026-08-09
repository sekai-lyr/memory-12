package com.sekai.learn.dataobject;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class SekaiLearnDailyTaskDO {
    private Long id;
    private Long userId;
    private LocalDate taskDate;
    private String tasksJson;
    private Integer completedCount;
    private Integer totalCount;
    private Boolean bonusClaimed;
    private LocalDateTime createdAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public LocalDate getTaskDate() { return taskDate; }
    public void setTaskDate(LocalDate taskDate) { this.taskDate = taskDate; }
    public String getTasksJson() { return tasksJson; }
    public void setTasksJson(String tasksJson) { this.tasksJson = tasksJson; }
    public Integer getCompletedCount() { return completedCount; }
    public void setCompletedCount(Integer completedCount) { this.completedCount = completedCount; }
    public Integer getTotalCount() { return totalCount; }
    public void setTotalCount(Integer totalCount) { this.totalCount = totalCount; }
    public Boolean getBonusClaimed() { return bonusClaimed; }
    public void setBonusClaimed(Boolean bonusClaimed) { this.bonusClaimed = bonusClaimed; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
