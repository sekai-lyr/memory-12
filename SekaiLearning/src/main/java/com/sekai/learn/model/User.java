package com.sekai.learn.model;

public class User {
    private Long id;
    private String username;
    private String password;
    private String nickname;
    private String avatar;
    private Integer expPoints;
    private Integer level;
    private Integer coins;
    private Integer streakDays;
    private String lastCheckinDate;
    private String favoritesJson;
    private String settingsJson;
    private String lastLoginAt;
    private String createdAt;
    private String updatedAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getNickname() { return nickname; }
    public void setNickname(String nickname) { this.nickname = nickname; }
    public String getAvatar() { return avatar; }
    public void setAvatar(String avatar) { this.avatar = avatar; }
    public Integer getExpPoints() { return expPoints; }
    public void setExpPoints(Integer expPoints) { this.expPoints = expPoints; }
    public Integer getLevel() { return level; }
    public void setLevel(Integer level) { this.level = level; }
    public Integer getCoins() { return coins; }
    public void setCoins(Integer coins) { this.coins = coins; }
    public Integer getStreakDays() { return streakDays; }
    public void setStreakDays(Integer streakDays) { this.streakDays = streakDays; }
    public String getLastCheckinDate() { return lastCheckinDate; }
    public void setLastCheckinDate(String lastCheckinDate) { this.lastCheckinDate = lastCheckinDate; }
    public String getFavoritesJson() { return favoritesJson; }
    public void setFavoritesJson(String favoritesJson) { this.favoritesJson = favoritesJson; }
    public String getSettingsJson() { return settingsJson; }
    public void setSettingsJson(String settingsJson) { this.settingsJson = settingsJson; }
    public String getLastLoginAt() { return lastLoginAt; }
    public void setLastLoginAt(String lastLoginAt) { this.lastLoginAt = lastLoginAt; }
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
    public String getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(String updatedAt) { this.updatedAt = updatedAt; }
}
