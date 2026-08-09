package com.sekai.learn.model;

public class Paper {
    private Long id;
    private Long userId;
    private String title;
    private String originalFilename;
    private String filePath;
    private String fileType;
    private String contentText;
    private String summary;
    private String chaptersJson;
    private String characterId;
    private String status;
    private String createdAt;
    private String updatedAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getOriginalFilename() { return originalFilename; }
    public void setOriginalFilename(String originalFilename) { this.originalFilename = originalFilename; }
    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }
    public String getFileType() { return fileType; }
    public void setFileType(String fileType) { this.fileType = fileType; }
    public String getContentText() { return contentText; }
    public void setContentText(String contentText) { this.contentText = contentText; }
    public String getSummary() { return summary; }
    public void setSummary(String summary) { this.summary = summary; }
    public String getChaptersJson() { return chaptersJson; }
    public void setChaptersJson(String chaptersJson) { this.chaptersJson = chaptersJson; }
    public String getCharacterId() { return characterId; }
    public void setCharacterId(String characterId) { this.characterId = characterId; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
    public String getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(String updatedAt) { this.updatedAt = updatedAt; }
}
