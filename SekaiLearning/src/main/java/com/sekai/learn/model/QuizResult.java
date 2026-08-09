package com.sekai.learn.model;

import java.util.List;

public class QuizResult {
    private boolean success;
    private double score;
    private int totalQuestions;
    private int correctCount;
    private List<String> wrongExplanations;
    private int expEarned;
    private String levelUp;

    public boolean isSuccess() { return success; }
    public void setSuccess(boolean success) { this.success = success; }
    public double getScore() { return score; }
    public void setScore(double score) { this.score = score; }
    public int getTotalQuestions() { return totalQuestions; }
    public void setTotalQuestions(int totalQuestions) { this.totalQuestions = totalQuestions; }
    public int getCorrectCount() { return correctCount; }
    public void setCorrectCount(int correctCount) { this.correctCount = correctCount; }
    public List<String> getWrongExplanations() { return wrongExplanations; }
    public void setWrongExplanations(List<String> wrongExplanations) { this.wrongExplanations = wrongExplanations; }
    public int getExpEarned() { return expEarned; }
    public void setExpEarned(int expEarned) { this.expEarned = expEarned; }
    public String getLevelUp() { return levelUp; }
    public void setLevelUp(String levelUp) { this.levelUp = levelUp; }
}
