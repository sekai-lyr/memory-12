package com.sekai.learn.dataobject;

import java.time.LocalDateTime;

public class SekaiLearnStudyRecordDO {
    private Long id;
    private Long userId;
    private String studyType;
    private Long targetId;
    private Integer durationSec;
    private Integer progressPct;
    private Integer expEarned;
    private LocalDateTime createdAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public String getStudyType() { return studyType; }
    public void setStudyType(String studyType) { this.studyType = studyType; }
    public Long getTargetId() { return targetId; }
    public void setTargetId(Long targetId) { this.targetId = targetId; }
    public Integer getDurationSec() { return durationSec; }
    public void setDurationSec(Integer durationSec) { this.durationSec = durationSec; }
    public Integer getProgressPct() { return progressPct; }
    public void setProgressPct(Integer progressPct) { this.progressPct = progressPct; }
    public Integer getExpEarned() { return expEarned; }
    public void setExpEarned(Integer expEarned) { this.expEarned = expEarned; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
