package com.sekai.learn.model;

public class Character {
    private String id;
    private String name;
    private String series;
    private String personality;
    private String avatar;
    private String voiceStyle;
    private String greeting;
    private Boolean enabled;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getSeries() { return series; }
    public void setSeries(String series) { this.series = series; }
    public String getPersonality() { return personality; }
    public void setPersonality(String personality) { this.personality = personality; }
    public String getAvatar() { return avatar; }
    public void setAvatar(String avatar) { this.avatar = avatar; }
    public String getVoiceStyle() { return voiceStyle; }
    public void setVoiceStyle(String voiceStyle) { this.voiceStyle = voiceStyle; }
    public String getGreeting() { return greeting; }
    public void setGreeting(String greeting) { this.greeting = greeting; }
    public Boolean getEnabled() { return enabled; }
    public void setEnabled(Boolean enabled) { this.enabled = enabled; }
}
