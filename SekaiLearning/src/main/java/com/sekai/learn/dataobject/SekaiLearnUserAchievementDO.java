package com.sekai.learn.dataobject;

public class SekaiLearnUserAchievementDO {
    private Long id;
    private Long userId;
    private String achievementId;
    private String unlockedAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public String getAchievementId() { return achievementId; }
    public void setAchievementId(String achievementId) { this.achievementId = achievementId; }
    public String getUnlockedAt() { return unlockedAt; }
    public void setUnlockedAt(String unlockedAt) { this.unlockedAt = unlockedAt; }
}
