package com.sekai.learn.model;

import java.util.List;

public class Course {
    private Long id;
    private Long subjectId;
    private String name;
    private String description;
    private String difficulty;
    private Integer estimatedHours;
    private Integer lessonCount;
    private Integer sortOrder;
    private String createdAt;
    private String subjectName;
    private Integer completedLessons;
    private List<Lesson> lessons;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getSubjectId() { return subjectId; }
    public void setSubjectId(Long subjectId) { this.subjectId = subjectId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }
    public Integer getEstimatedHours() { return estimatedHours; }
    public void setEstimatedHours(Integer estimatedHours) { this.estimatedHours = estimatedHours; }
    public Integer getLessonCount() { return lessonCount; }
    public void setLessonCount(Integer lessonCount) { this.lessonCount = lessonCount; }
    public Integer getSortOrder() { return sortOrder; }
    public void setSortOrder(Integer sortOrder) { this.sortOrder = sortOrder; }
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
    public String getSubjectName() { return subjectName; }
    public void setSubjectName(String subjectName) { this.subjectName = subjectName; }
    public Integer getCompletedLessons() { return completedLessons; }
    public void setCompletedLessons(Integer completedLessons) { this.completedLessons = completedLessons; }
    public List<Lesson> getLessons() { return lessons; }
    public void setLessons(List<Lesson> lessons) { this.lessons = lessons; }
}
