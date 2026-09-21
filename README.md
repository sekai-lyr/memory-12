# memory-12 · SekaiLearning 二次元学习平台

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
