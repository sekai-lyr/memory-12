package com.sekai.learn.service;

import com.sekai.learn.model.User;
import java.util.Map;
import java.util.Optional;

public interface UserService {
    User register(String username, String password, String nickname);
    Optional<User> login(String username, String password);
    Optional<User> getUserById(Long id);
    User updateUser(Long userId, Map<String, Object> updates);
    Map<String, Object> getUserStats(Long userId);
    Map<String, Object> checkin(Long userId);
    User addExp(Long userId, int exp);
}
