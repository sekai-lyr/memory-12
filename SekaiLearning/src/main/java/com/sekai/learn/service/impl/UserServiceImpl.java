package com.sekai.learn.service.impl;

import com.sekai.learn.dataobject.SekaiLearnUserDO;
import com.sekai.learn.mapper.SekaiLearnUserMapper;
import com.sekai.learn.model.User;
import com.sekai.learn.service.UserService;
import com.sekai.learn.util.PasswordHashUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private SekaiLearnUserMapper userMapper;

    @Override
    @Transactional
    public User register(String username, String password, String nickname) {
        username = username == null ? null : username.trim();
        nickname = nickname == null ? null : nickname.trim();
        if (username == null || username.length() < 3 || username.length() > 50) {
            throw new RuntimeException("用户名长度需为 3-50 个字符");
        }
        if (!username.matches("[A-Za-z0-9_]+")) {
            throw new RuntimeException("用户名只能包含字母、数字和下划线");
        }
        if (password == null || password.length() < 6 || password.length() > 72) {
            throw new RuntimeException("密码长度需为 6-72 个字符");
        }
        if (nickname != null && nickname.length() > 100) {
            throw new RuntimeException("昵称不能超过 100 个字符");
        }
        if (userMapper.existsByUsername(username) > 0) {
            throw new RuntimeException("用户名已存在");
        }
        SekaiLearnUserDO userDO = new SekaiLearnUserDO();
        userDO.setUsername(username);
        userDO.setPassword(PasswordHashUtil.hash(password));
        userDO.setNickname(nickname != null && !nickname.isEmpty() ? nickname : username);
        userDO.setExpPoints(0);
        userDO.setLevel(1);
        userDO.setCoins(500);
        userDO.setStreakDays(0);
        userDO.setFavoritesJson("[]");
        userMapper.insert(userDO);
        return toModel(userDO);
    }

    @Override
    public Optional<User> login(String username, String password) {
        if (username == null || username.isBlank() || password == null || password.isEmpty()) {
            return Optional.empty();
        }
        SekaiLearnUserDO userDO = userMapper.findByUsername(username);
        if (userDO != null && PasswordHashUtil.verify(password, userDO.getPassword())) {
            userDO.setLastLoginAt(LocalDateTime.now());
            userMapper.update(userDO);
            return Optional.of(toModel(userDO));
        }
        return Optional.empty();
    }

    @Override
    public Optional<User> getUserById(Long id) {
        SekaiLearnUserDO userDO = userMapper.findById(id);
        return Optional.ofNullable(userDO).map(this::toModel);
    }

    @Override
    @Transactional
    public User updateUser(Long userId, Map<String, Object> updates) {
        SekaiLearnUserDO userDO = userMapper.findById(userId);
        if (userDO == null) {
            throw new RuntimeException("用户不存在");
        }
        if (updates.containsKey("nickname")) userDO.setNickname((String) updates.get("nickname"));
        if (updates.containsKey("avatar")) userDO.setAvatar((String) updates.get("avatar"));
        if (updates.containsKey("favoritesJson")) userDO.setFavoritesJson((String) updates.get("favoritesJson"));
        if (updates.containsKey("settingsJson")) userDO.setSettingsJson((String) updates.get("settingsJson"));
        userMapper.update(userDO);
        return toModel(userDO);
    }

    @Override
    public Map<String, Object> getUserStats(Long userId) {
        SekaiLearnUserDO userDO = userMapper.findById(userId);
        if (userDO == null) {
            throw new RuntimeException("用户不存在");
        }
        Map<String, Object> stats = new HashMap<>();
        stats.put("expPoints", userDO.getExpPoints());
        stats.put("level", userDO.getLevel());
        stats.put("coins", userDO.getCoins());
        stats.put("streakDays", userDO.getStreakDays());
        stats.put("lastCheckinDate", userDO.getLastCheckinDate());
        // 下一级所需经验
        int nextLevelExp = userDO.getLevel() * 100;
        stats.put("nextLevelExp", nextLevelExp);
        return stats;
    }

    @Override
    @Transactional
    public Map<String, Object> checkin(Long userId) {
        SekaiLearnUserDO userDO = userMapper.findById(userId);
        if (userDO == null) {
            throw new RuntimeException("用户不存在");
        }

        LocalDate today = LocalDate.now();
        LocalDate lastCheckin = userDO.getLastCheckinDate();
        Map<String, Object> result = new HashMap<>();

        if (lastCheckin != null && lastCheckin.equals(today)) {
            result.put("success", false);
            result.put("message", "今天已经签到过了");
            result.put("streakDays", userDO.getStreakDays());
            return result;
        }

        int newStreak = 1;
        if (lastCheckin != null && lastCheckin.plusDays(1).equals(today)) {
            newStreak = userDO.getStreakDays() + 1;
        }

        int coinReward = 10 + (newStreak >= 7 ? 20 : newStreak >= 3 ? 10 : 0);
        int newCoins = userDO.getCoins() + coinReward;

        userMapper.updateCheckin(userId, newStreak, today.toString());
        userMapper.updateCoins(userId, newCoins);

        result.put("success", true);
        result.put("message", "签到成功！");
        result.put("streakDays", newStreak);
        result.put("coinReward", coinReward);
        result.put("totalCoins", newCoins);
        return result;
    }

    @Override
    @Transactional
    public User addExp(Long userId, int exp) {
        SekaiLearnUserDO userDO = userMapper.findById(userId);
        if (userDO == null) {
            throw new RuntimeException("用户不存在");
        }
        int newExp = userDO.getExpPoints() + exp;
        int newLevel = 1;
        int tempExp = newExp;
        while (tempExp >= newLevel * 100) {
            tempExp -= newLevel * 100;
            newLevel++;
        }
        userMapper.updateExpAndLevel(userId, newExp, newLevel);
        userDO.setExpPoints(newExp);
        userDO.setLevel(newLevel);
        return toModel(userDO);
    }

    private User toModel(SekaiLearnUserDO userDO) {
        User user = new User();
        BeanUtils.copyProperties(userDO, user, "password");
        if (userDO.getLastCheckinDate() != null) user.setLastCheckinDate(userDO.getLastCheckinDate().toString());
        if (userDO.getLastLoginAt() != null) user.setLastLoginAt(userDO.getLastLoginAt().toString());
        if (userDO.getCreatedAt() != null) user.setCreatedAt(userDO.getCreatedAt().toString());
        if (userDO.getUpdatedAt() != null) user.setUpdatedAt(userDO.getUpdatedAt().toString());
        return user;
    }
}
