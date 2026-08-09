package com.sekai.learn.model;

public class Result<T> {
    private boolean success;
    private String message;
    private T data;

    public Result() {}

    public Result(boolean success, String message, T data) {
        this.success = success;
        this.message = message;
        this.data = data;
    }

    public static <T> Result<T> ok(T data) {
        return new Result<>(true, "success", data);
    }

    public static <T> Result<T> ok(String message, T data) {
        return new Result<>(true, message, data);
    }

    public static <T> Result<T> fail(String message) {
        return new Result<>(false, message, null);
    }

    public boolean isSuccess() { return success; }
    public void setSuccess(boolean success) { this.success = success; }
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
    public T getData() { return data; }
    public void setData(T data) { this.data = data; }
}
