package com.sekai.learn.model;

public class Achievement {
    private String id;
    private String name;
    private String description;
    private String icon;
    private String category;
    private Integer requiredValue;
    private Integer rewardCoins;
    private Boolean enabled;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getIcon() { return icon; }
    public void setIcon(String icon) { this.icon = icon; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public Integer getRequiredValue() { return requiredValue; }
    public void setRequiredValue(Integer requiredValue) { this.requiredValue = requiredValue; }
    public Integer getRewardCoins() { return rewardCoins; }
    public void setRewardCoins(Integer rewardCoins) { this.rewardCoins = rewardCoins; }
    public Boolean getEnabled() { return enabled; }
    public void setEnabled(Boolean enabled) { this.enabled = enabled; }
}
