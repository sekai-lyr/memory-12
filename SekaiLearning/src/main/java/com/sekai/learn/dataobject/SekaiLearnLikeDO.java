package com.sekai.learn.dataobject;

import java.time.LocalDateTime;

public class SekaiLearnLikeDO {
    private Long id;
    private Long userId;
    private Long creationId;
    private LocalDateTime createdAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public Long getCreationId() { return creationId; }
    public void setCreationId(Long creationId) { this.creationId = creationId; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
