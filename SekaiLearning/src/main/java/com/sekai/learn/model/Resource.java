package com.sekai.learn.model;

public class Resource {
    private Long id;
    private Long courseId;
    private String title;
    private String url;
    private String coverUrl;
    private String author;
    private String authorUrl;
    private Long playCount;
    private String duration;
    private String description;
    private String sourceType;
    private Integer sortOrder;
    private Boolean enabled;
    private String createdAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getCourseId() { return courseId; }
    public void setCourseId(Long courseId) { this.courseId = courseId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getUrl() { return url; }
    public void setUrl(String url) { this.url = url; }
    public String getCoverUrl() { return coverUrl; }
    public void setCoverUrl(String coverUrl) { this.coverUrl = coverUrl; }
    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }
    public String getAuthorUrl() { return authorUrl; }
    public void setAuthorUrl(String authorUrl) { this.authorUrl = authorUrl; }
    public Long getPlayCount() { return playCount; }
    public void setPlayCount(Long playCount) { this.playCount = playCount; }
    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getSourceType() { return sourceType; }
    public void setSourceType(String sourceType) { this.sourceType = sourceType; }
    public Integer getSortOrder() { return sortOrder; }
    public void setSortOrder(Integer sortOrder) { this.sortOrder = sortOrder; }
    public Boolean getEnabled() { return enabled; }
    public void setEnabled(Boolean enabled) { this.enabled = enabled; }
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}
