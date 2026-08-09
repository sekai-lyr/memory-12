package com.sekai.learn.dataobject;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class SekaiLearnUserDO {
    private Long id;
    private String username;
    private String password;
    private String nickname;
    private String avatar;
    private Integer expPoints;
    private Integer level;
    private Integer coins;
    private Integer streakDays;
    private LocalDate lastCheckinDate;
    private String favoritesJson;
    private String settingsJson;
    private LocalDateTime lastLoginAt;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

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
    public LocalDate getLastCheckinDate() { return lastCheckinDate; }
    public void setLastCheckinDate(LocalDate lastCheckinDate) { this.lastCheckinDate = lastCheckinDate; }
    public String getFavoritesJson() { return favoritesJson; }
    public void setFavoritesJson(String favoritesJson) { this.favoritesJson = favoritesJson; }
    public String getSettingsJson() { return settingsJson; }
    public void setSettingsJson(String settingsJson) { this.settingsJson = settingsJson; }
    public LocalDateTime getLastLoginAt() { return lastLoginAt; }
    public void setLastLoginAt(LocalDateTime lastLoginAt) { this.lastLoginAt = lastLoginAt; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
}
