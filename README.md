# 🎓 SekaiLearning · 二次元游戏化学习平台

> **Spring Boot + Thymeleaf + MyBatis · 游戏化机制 · 积分 · 社群**
> Gamified learning platform with points & community

[![Java](https://img.shields.io/badge/Java-17-orange)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.x-brightgreen)](https://spring.io/projects/spring-boot)
[![Thymeleaf](https://img.shields.io/badge/Thymeleaf-3-005F0F)](https://www.thymeleaf.org/)
[![MyBatis](https://img.shields.io/badge/MyBatis-3-lightgrey)](https://mybatis.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8-4479A1)](https://www.mysql.com/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

基于 **Spring Boot + Thymeleaf + MyBatis** 的二次元风格学习平台，通过游戏化机制提升学习兴趣。

An anime-styled gamified learning platform built with Spring Boot + Thymeleaf + MyBatis.

## ✨ 功能 Features

- 二次元风格界面 Anime-style UI
- 背单词等学习功能 Vocabulary learning
- **游戏化学习与积分机制** Gamified learning & points
- **兴趣社群** Interest community

## 📐 项目结构 Project Structure

```text
SekaiLearning/
├── seed/        # 种子数据
├── src/         # 源码
└── init.sql     # 数据库初始化脚本
```

## ▶️ 运行 Run

```powershell
cd SekaiLearning
mvn spring-boot:run
```

数据库密码通过环境变量 `DB_PASSWORD` 注入。

## 📝 Notes / 说明

- 数据库表使用 `sekai_learning_` 前缀（数据库 `sekai_friend`）
- 初始化脚本：`SekaiLearning/init.sql`

## 📄 License

[MIT](LICENSE) © 2026 [sekai-lyr](https://github.com/sekai-lyr)

---

**⭐ If this project helped you, star it! 如果这个项目对你有帮助，欢迎 Star！**
