package com.sekai.learn.control;

import com.sekai.learn.model.Result;
import com.sekai.learn.service.AchievementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/achievement")
public class AchievementController {

    @Autowired
    private AchievementService achievementService;

    @GetMapping("/list")
    public Result<?> getAllAchievements() {
        return Result.ok(achievementService.getAllAchievements());
    }

    @GetMapping("/user/{userId}")
    public Result<?> getUserAchievements(@PathVariable Long userId) {
        return Result.ok(achievementService.getUserAchievements(userId));
    }

    @PostMapping("/check/{userId}")
    public Result<?> checkAchievements(@PathVariable Long userId) {
        try {
            achievementService.checkAndUnlock(userId);
            return Result.ok("成就检查完成");
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }
}
