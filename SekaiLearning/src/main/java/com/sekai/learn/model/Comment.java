package com.sekai.learn.model;

public class Comment {
    private Long id;
    private Long creationId;
    private Long userId;
    private String content;
    private Long parentId;
    private String createdAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getCreationId() { return creationId; }
    public void setCreationId(Long creationId) { this.creationId = creationId; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public Long getParentId() { return parentId; }
    public void setParentId(Long parentId) { this.parentId = parentId; }
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}
