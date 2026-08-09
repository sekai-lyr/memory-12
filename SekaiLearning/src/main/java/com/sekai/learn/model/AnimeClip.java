package com.sekai.learn.model;

public class AnimeClip {
    private Long id;
    private String title;
    private String animeName;
    private Integer episode;
    private String videoUrl;
    private String subtitleJson;
    private String difficulty;
    private String tagsJson;
    private Integer viewCount;
    private Boolean enabled;
    private String createdAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getAnimeName() { return animeName; }
    public void setAnimeName(String animeName) { this.animeName = animeName; }
    public Integer getEpisode() { return episode; }
    public void setEpisode(Integer episode) { this.episode = episode; }
    public String getVideoUrl() { return videoUrl; }
    public void setVideoUrl(String videoUrl) { this.videoUrl = videoUrl; }
    public String getSubtitleJson() { return subtitleJson; }
    public void setSubtitleJson(String subtitleJson) { this.subtitleJson = subtitleJson; }
    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }
    public String getTagsJson() { return tagsJson; }
    public void setTagsJson(String tagsJson) { this.tagsJson = tagsJson; }
    public Integer getViewCount() { return viewCount; }
    public void setViewCount(Integer viewCount) { this.viewCount = viewCount; }
    public Boolean getEnabled() { return enabled; }
    public void setEnabled(Boolean enabled) { this.enabled = enabled; }
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}
