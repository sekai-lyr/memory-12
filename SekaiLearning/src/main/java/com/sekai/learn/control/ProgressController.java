package com.sekai.learn.control;

import com.sekai.learn.model.Result;
import com.sekai.learn.service.ProgressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/progress")
public class ProgressController {

    @Autowired
    private ProgressService progressService;

    @PostMapping("/lesson/{lessonId}/start")
    public Result<?> startLesson(@PathVariable Long lessonId, @RequestBody Map<String, Object> body) {
        try {
            Long userId = Long.valueOf(body.get("userId").toString());
            progressService.startLesson(userId, lessonId);
            return Result.ok("开始学习");
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }

    @PostMapping("/lesson/{lessonId}/complete")
    public Result<?> completeLesson(@PathVariable Long lessonId, @RequestBody Map<String, Object> body) {
        try {
            Long userId = Long.valueOf(body.get("userId").toString());
            progressService.completeLesson(userId, lessonId);
            return Result.ok("完成学习");
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }

    @SuppressWarnings("unchecked")
    @PostMapping("/lesson/{lessonId}/quiz")
    public Result<?> submitQuiz(@PathVariable Long lessonId, @RequestBody Map<String, Object> body) {
        try {
            Long userId = Long.valueOf(body.get("userId").toString());
            Map<String, Object> answersRaw = (Map<String, Object>) body.get("answers");
            Map<Long, String> answers = new java.util.HashMap<>();
            if (answersRaw != null) {
                for (Map.Entry<String, Object> entry : answersRaw.entrySet()) {
                    answers.put(Long.valueOf(entry.getKey()), entry.getValue().toString());
                }
            }
            return Result.ok(progressService.submitQuiz(userId, lessonId, answers));
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }
}
