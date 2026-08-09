package com.sekai.learn.model;

public class Scene {
    private Long id;
    private Long paperId;
    private Integer sceneIndex;
    private String chapterTitle;
    private String dialogueJson;
    private String createdAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getPaperId() { return paperId; }
    public void setPaperId(Long paperId) { this.paperId = paperId; }
    public Integer getSceneIndex() { return sceneIndex; }
    public void setSceneIndex(Integer sceneIndex) { this.sceneIndex = sceneIndex; }
    public String getChapterTitle() { return chapterTitle; }
    public void setChapterTitle(String chapterTitle) { this.chapterTitle = chapterTitle; }
    public String getDialogueJson() { return dialogueJson; }
    public void setDialogueJson(String dialogueJson) { this.dialogueJson = dialogueJson; }
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}
