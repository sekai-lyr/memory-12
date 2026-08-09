package com.sekai.learn.model;

import java.util.List;

public class Subject {
    private Long id;
    private String name;
    private String description;
    private String icon;
    private Integer sortOrder;
    private String createdAt;
    private List<Course> courses;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getIcon() { return icon; }
    public void setIcon(String icon) { this.icon = icon; }
    public Integer getSortOrder() { return sortOrder; }
    public void setSortOrder(Integer sortOrder) { this.sortOrder = sortOrder; }
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
    public List<Course> getCourses() { return courses; }
    public void setCourses(List<Course> courses) { this.courses = courses; }
}
