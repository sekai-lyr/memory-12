package com.sekai.learn.control;

import com.sekai.learn.model.Result;
import com.sekai.learn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/{userId}/checkin")
    public Result<?> checkin(@PathVariable Long userId) {
        try {
            return Result.ok(userService.checkin(userId));
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }

    @PostMapping("/{userId}/exp")
    public Result<?> addExp(@PathVariable Long userId, @RequestBody Map<String, Integer> body) {
        try {
            int exp = body.getOrDefault("exp", 10);
            return Result.ok(userService.addExp(userId, exp));
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }

    @PutMapping("/{userId}")
    public Result<?> updateUser(@PathVariable Long userId, @RequestBody Map<String, Object> updates) {
        try {
            return Result.ok(userService.updateUser(userId, updates));
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }
}
