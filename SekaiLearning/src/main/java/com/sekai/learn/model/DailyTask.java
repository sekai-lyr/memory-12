package com.sekai.learn.model;

public class DailyTask {
    private Long id;
    private Long userId;
    private String taskDate;
    private String tasksJson;
    private Integer completedCount;
    private Integer totalCount;
    private Boolean bonusClaimed;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public String getTaskDate() { return taskDate; }
    public void setTaskDate(String taskDate) { this.taskDate = taskDate; }
    public String getTasksJson() { return tasksJson; }
    public void setTasksJson(String tasksJson) { this.tasksJson = tasksJson; }
    public Integer getCompletedCount() { return completedCount; }
    public void setCompletedCount(Integer completedCount) { this.completedCount = completedCount; }
    public Integer getTotalCount() { return totalCount; }
    public void setTotalCount(Integer totalCount) { this.totalCount = totalCount; }
    public Boolean getBonusClaimed() { return bonusClaimed; }
    public void setBonusClaimed(Boolean bonusClaimed) { this.bonusClaimed = bonusClaimed; }
}
