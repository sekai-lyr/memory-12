package com.sekai.learn.control;

import com.sekai.learn.model.Result;
import com.sekai.learn.model.User;
import com.sekai.learn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public Result<?> register(@RequestBody Map<String, String> body) {
        try {
            String username = body.get("username");
            String password = body.get("password");
            String nickname = body.get("nickname");
            User user = userService.register(username, password, nickname);
            return Result.ok(Map.of(
                "userId", user.getId(),
                "username", user.getUsername(),
                "nickname", user.getNickname()
            ));
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }

    @PostMapping("/login")
    public Result<?> login(@RequestBody Map<String, String> body) {
        String username = body.get("username");
        String password = body.get("password");
        return userService.login(username, password)
            .map(user -> Result.ok(Map.of(
                "userId", user.getId(),
                "username", user.getUsername(),
                "nickname", user.getNickname(),
                "coins", user.getCoins(),
                "level", user.getLevel(),
                "expPoints", user.getExpPoints()
            )))
            .orElse(Result.fail("用户名或密码错误"));
    }

    @GetMapping("/user/{userId}")
    public Result<?> getUser(@PathVariable Long userId) {
        return userService.getUserById(userId)
            .map(user -> Result.ok(user))
            .orElse(Result.fail("用户不存在"));
    }

    @GetMapping("/user/{userId}/stats")
    public Result<?> getUserStats(@PathVariable Long userId) {
        try {
            return Result.ok(userService.getUserStats(userId));
        } catch (RuntimeException e) {
            return Result.fail(e.getMessage());
        }
    }
}
