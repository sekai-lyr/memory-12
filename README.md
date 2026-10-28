<div align="center">

# 🎓 SekaiLearning · 游戏化学习平台

> ⭐ Sekai 系列实战项目 12 / 14 · 单项目独立仓库

![Java](https://img.shields.io/badge/Java-red?style=flat-square&logo=openjdk&logoColor=white) ![Spring Boot](https://img.shields.io/badge/Spring%20Boot-6DB33F?style=flat-square&logo=springboot&logoColor=white) ![MyBatis](https://img.shields.io/badge/MyBatis-blue?style=flat-square) ![Thymeleaf](https://img.shields.io/badge/Thymeleaf-blue?style=flat-square) ![MySQL](https://img.shields.io/badge/MySQL-blue?style=flat-square)

[![Stars](https://img.shields.io/github/stars/sekai-lyr/memory-12?style=flat-square&logo=github)](https://github.com/sekai-lyr/memory-12/stargazers) [![合集](https://img.shields.io/badge/📚_全系列合集-sekai--product-8250DF?style=flat-square)](https://github.com/sekai-lyr/sekai-product)

</div>

---

一个基于 **Spring Boot + Thymeleaf + MyBatis** 的二次元风格学习平台，通过游戏化方式提升学习兴趣。

## 功能

- 二次元风格界面（**奶油纸感暖色调**：米白纸底 + 焦糖橙主色 + 豆沙绿/柔粉点缀，柔和圆角与阴影；详见 `DESIGN.md`）
- 背单词等学习功能
- 游戏化学习与积分机制
- 兴趣社群
- **B站精选学习视频库**：为每门课程嵌入 B 站公开搜索接口抓取的优质学习视频（标题/UP主/播放量/封面/时长），课程详情页可直接内嵌播放器在线观看
- **超大知识库**：71 门课程，每门 100 节课 + 100+ 个 B 站视频，课时为图文并茂长文（内嵌 SVG 知识图解）

## 项目结构

- `SekaiLearning/`：Spring Boot 主项目
  - `seed/`：种子数据
    - `seed_1_math.sql` ~ `seed_6_art.sql`：各学科课程与课程内容（课程/课时/测验）
    - `seed_7_bilibili.sql`：B 站学习视频资源数据（每门课程 110 条，由 `fetch_bilibili.ps1` 抓取生成，全量重建）
    - `seed_7b_patch.sql`：已废弃（早期定向补充/纠偏补丁，v3 抓取后不再适用，仅保留说明占位）
    - `seed_8_lessons.sql`：课程扩充至每门 100 节课，**图文并茂长文版**（每节嵌入 2-3 张与章节主题对应的 SVG 知识图解（函数图像/流程图/结构图/时间轴/步骤截图等，data URI 内嵌）+ 1500~2500 字正文，`INSERT ... ON DUPLICATE KEY UPDATE` 分批写入可重复执行，由 `gen_lessons.py` + `gen_diagrams.py` 生成）
    - `seed_8b_original_expand.sql`：原有课时（id<100000）图文扩充（追加知识图解/拓展阅读/思考练习，可重复执行自动替换旧扩充），由 `gen_lessons.py` 生成（依赖 `original_lessons.tsv`，该文件由数据库导出）
    - `fetch_bilibili.ps1`：B 站视频抓取脚本（v3：会话复用规避 412、多关键词多分页、断点续跑、保留原行 id）
    - `gen_lessons.py`：每门课程 100 节课（图文长文）生成脚本
    - `gen_diagrams.py`：SVG 知识图解生成器（按学科与章节生成函数图像、流程图、结构图、时间轴、步骤截图等说明性示意图）
    - `original_lessons.tsv`：原有课时 id 清单（由数据库导出，供 `gen_lessons.py` 生成 `seed_8b`）
  - `src/`：源码
  - `init.sql`：数据库初始化脚本

## 运行

```powershell
cd SekaiLearning
mvn spring-boot:run
```

## 说明

- 数据库表使用 `sekai_learning_` 前缀（数据库 `sekai_friend`）。
- 初始化脚本：`SekaiLearning/init.sql`。
- 重新抓取 B 站视频资源：`pwsh -File SekaiLearning/seed/fetch_bilibili.ps1`（每门课程抓取 100+ 个视频，全量重建 `seed_7_bilibili.sql`），生成的 SQL 用 mysql 客户端导入即可；断点状态保存在 `seed/fetch_state_v3.json`。
- 重新生成 100 节/课的课程内容：`python SekaiLearning/seed/gen_lessons.py`，输出 `seed_8_lessons.sql`。
- 数据导入顺序建议：`init.sql` → `seed_1~6_*.sql` → `seed_7_bilibili.sql` → `seed_8_lessons.sql` → `seed_8b_original_expand.sql`。

---

## 🗺️ Sekai 项目全景导航

本项目是 **Sekai 系列作品集** 的一员，全部 14 个实战项目：

| 项目 | 简介 |
|------|------|
| [`memory-1`](https://github.com/sekai-lyr/memory-1) | 📊 二次元数据中心 |
| [`memory-2`](https://github.com/sekai-lyr/memory-2) | 🛒 二次元电商商城 |
| [`memory-3`](https://github.com/sekai-lyr/memory-3) | 📔 二次元回忆录 |
| [`memory-4`](https://github.com/sekai-lyr/memory-4) | 🎋 角色抽签与今日运势 |
| [`memory-5`](https://github.com/sekai-lyr/memory-5) | 🎵 歌词同步音乐播放器 |
| [`memory-6`](https://github.com/sekai-lyr/memory-6) | 🎮 原创角色合成小游戏 |
| [`memory-7`](https://github.com/sekai-lyr/memory-7) | 🖼️ 二次元壁纸图库系统 |
| [`memory-8`](https://github.com/sekai-lyr/memory-8) | 📖 英语单词学习系统 |
| [`memory-9`](https://github.com/sekai-lyr/memory-9) | 📝 表单收集与 AI 对话系统 |
| [`memory-10`](https://github.com/sekai-lyr/memory-10) | 📺 动漫视频导航站 |
| [`memory-11`](https://github.com/sekai-lyr/memory-11) | ⚔️ 游戏王规则卡牌对战 |
| [`memory-12`](https://github.com/sekai-lyr/memory-12) | 🎓 游戏化学习平台 |
| [`memory-13`](https://github.com/sekai-lyr/memory-13) | 🎭 Ren'Py 视觉小说 |
| [`memory-14`](https://github.com/sekai-lyr/memory-14) | 🤖 识番推荐与 RAG 助手平台 |

📦 **一站式浏览全部项目**：[sekai-lyr/sekai-product](https://github.com/sekai-lyr/sekai-product)（monorepo 合集）

<div align="center">

**如果这个项目对你有帮助或启发，欢迎点一个 ⭐ Star 支持一下！**

*Made with ❤️ by [sekai-lyr](https://github.com/sekai-lyr)*

</div>
