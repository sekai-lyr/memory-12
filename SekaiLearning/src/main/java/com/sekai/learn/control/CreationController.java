package com.sekai.learn.control;

import com.sekai.learn.model.Result;
import com.sekai.learn.service.CreationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/creation")
public class CreationController {

    @Autowired
    private CreationService creationService;

    @PostMapping("/create")
    public Result<?> createCreation(@RequestBody Map<String, Object> body) {
        try {
            Long userId = Long.valueOf(body.get("userId").toString());
            String title = (String) body.get("title");
            String content = (String) body.get("content");
            String coverUrl = (String) body.get("coverUrl");
            String creationType = (String) body.get("creationType");
            String tagsJson = (String) body.get("tagsJson");
            return Result.ok(creationService.createCreation(userId, title, content, coverUrl, creationType, tagsJson));
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }

    @GetMapping("/recent")
    public Result<?> getRecentCreations(@RequestParam(defaultValue = "20") int limit) {
        return Result.ok(creationService.getRecentCreations(limit));
    }

    @GetMapping("/user/{userId}")
    public Result<?> getUserCreations(@PathVariable Long userId) {
        return Result.ok(creationService.getUserCreations(userId));
    }

    @GetMapping("/{id}")
    public Result<?> getCreation(@PathVariable Long id) {
        return creationService.getCreationById(id) != null
            ? Result.ok(creationService.getCreationById(id))
            : Result.fail("作品不存在");
    }

    @DeleteMapping("/{id}")
    public Result<?> deleteCreation(@PathVariable Long id, @RequestParam Long userId) {
        try {
            creationService.deleteCreation(id, userId);
            return Result.ok("删除成功");
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }

    @PostMapping("/{id}/like")
    public Result<?> toggleLike(@PathVariable Long id, @RequestBody Map<String, Long> body) {
        try {
            Long userId = body.get("userId");
            return Result.ok(creationService.toggleLike(userId, id));
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }

    @GetMapping("/{id}/comments")
    public Result<?> getComments(@PathVariable Long id) {
        return Result.ok(creationService.getComments(id));
    }

    @PostMapping("/{id}/comment")
    public Result<?> addComment(@PathVariable Long id, @RequestBody Map<String, Object> body) {
        try {
            Long userId = Long.valueOf(body.get("userId").toString());
            String content = (String) body.get("content");
            Long parentId = body.get("parentId") != null ? Long.valueOf(body.get("parentId").toString()) : null;
            return Result.ok(creationService.addComment(userId, id, content, parentId));
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }
}
