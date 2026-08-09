package com.sekai.learn.model;

public class QuizQuestion {
    private Long id;
    private Long lessonId;
    private String question;
    private String questionType;
    private String options;
    private String correctAnswer;
    private String explanation;
    private Integer sortOrder;
    private String createdAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getLessonId() { return lessonId; }
    public void setLessonId(Long lessonId) { this.lessonId = lessonId; }
    public String getQuestion() { return question; }
    public void setQuestion(String question) { this.question = question; }
    public String getQuestionType() { return questionType; }
    public void setQuestionType(String questionType) { this.questionType = questionType; }
    public String getOptions() { return options; }
    public void setOptions(String options) { this.options = options; }
    public String getCorrectAnswer() { return correctAnswer; }
    public void setCorrectAnswer(String correctAnswer) { this.correctAnswer = correctAnswer; }
    public String getExplanation() { return explanation; }
    public void setExplanation(String explanation) { this.explanation = explanation; }
    public Integer getSortOrder() { return sortOrder; }
    public void setSortOrder(Integer sortOrder) { this.sortOrder = sortOrder; }
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}
