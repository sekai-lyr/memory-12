# Design — Sekai Learning（奶油纸感 · 暖学社）

<!-- impeccable:design-schema 1 -->

2026-08 整站视觉世界替换：从"科技感霓虹深色"改为"有学习感觉的舒适温柔风格"。本文件记录建成后的系统，源码为 ground truth。

## 世界（World）

一本温暖的活页笔记本：奶油纸底、纸面卡片、暖墨文字。二次元角色以柔和贴纸感存在，无发光、无扫描线、无故障动效。方向合同位于 `templates/learn/index.html` 的 body 首条注释（THESIS/OWN-WORLD/STORY/FIRST VIEWPORT/FORM）。

## 色彩（Tokens）

`learn.css` 与 `auth.css` 的 `:root` 定义全局 token；旧霓虹变量名（`--neon-*`、`--bg-*`、`--border-neon`、`--text-*`、`--glow-*`）保留为别名指向新值，旧引用自动生效。

| 角色 | 值 | 用途 |
|---|---|---|
| `--paper` | `#F7F1E5` | 页面纸底 |
| `--paper-deep` | `#F1E8D8` | 进度条轨道/更深纸底 |
| `--card` | `#FFFDF7` | 卡片纸面 |
| `--card-hover` | `#FBF4E6` | 卡片悬停 |
| `--card-tint` | `#FAF4E8` | 输入/列表项浅底 |
| `--ink` | `#4A4038` | 正文暖墨 |
| `--ink-soft` | `#5F5547` | 次级正文（课时内容等） |
| `--ink-dim` | `#6E6250` | 弱化文字/元信息（对纸底对比 ≥4.5:1） |
| `--line` / `--line-soft` | `#E9DEC9` / `#F0E7D5` | 描边 |
| `--accent` | `#E08A4A` | 焦糖橙（装饰/强调底） |
| `--accent-deep` | `#B85E24` | 焦糖橙深（文字/按钮底，白字对比 ≈4.5:1） |
| `--accent-soft` | `#F9E8D7` | 焦糖橙浅底 |
| `--sage` / `--sage-deep` | `#7E9B76` / `#46703D` | 豆沙绿（成功/辅助） |
| `--pink` / `--pink-deep` | `#E3A9A4` / `#A85A50` | 柔粉（二次元点缀） |
| `--lavender` / `--lavender-deep` | `#B49BC8` / `#7A5C96` | 淡紫（角色/对话） |
| `--blue` / `--blue-deep` | `#7BA7C9` / `#52799B` | 柔雾蓝（视频/链接点缀） |
| `--yellow` / `--yellow-deep` | `#D9A83D` / `#A87A2E` | 暖黄（进行中） |
| `--green` / `--green-deep` | `#6FA56F` / `#467A46` | 成功 |
| `--red` / `--red-deep` | `#C96A5F` / `#B84040` | 错误/危险 |

阴影（暖调、带偏移与模糊）：
- `--shadow-card`: `0 2px 4px rgba(176,138,92,.06), 0 10px 24px rgba(176,138,92,.10)`
- `--shadow-pop`: `0 18px 44px rgba(150,110,70,.18)`
- `--shadow-accent`: `0 6px 18px rgba(216,138,74,.28)`

## 字体（Type）

- 正文/UI：`--font-main` = PingFang SC / Microsoft YaHei / Noto Sans SC（系统栈，学习场景可读优先）
- 标题点缀：`--font-display` = Kaiti SC / STKaiti（楷体，hero 大标题、页面 H1、galgame 章节标题）
- 等宽：`--font-mono` 仅用于代码与数据

层级：页面 H1 28–36px（楷体、加粗）→ 区块标题 18–20px（700）→ 卡片标题 15–17px（700）→ 正文 14–15px / 1.7–1.9 行高 → 元信息 11–13px（`--ink-dim`）。

## 组件（Components）

- **卡片**：`--card` 纸面、`--line` 描边、圆角 14–18px、`--shadow-card`；悬停上浮 3–6px + 焦糖橙描边 + 阴影加深。
- **主按钮**：焦糖橙渐变（`--accent → --accent-deep`）白字、胶囊/圆角、`--shadow-accent`；悬停上浮 2px。
- **次按钮/标签**：`--card-tint` 底 + `--line` 边，悬停转对应柔色底。
- **输入框**：纸面底、`--line` 描边，聚焦焦糖橙描边 + 3px 柔光环（`rgba(224,138,74,.14)`）。
- **进度条**：`--paper-deep` 轨道，焦糖橙→豆沙绿渐变填充（保留 `transition: width`，进度填充的标准实现）。
- **状态徽章**：难度/状态用柔色底 + 深色文字（beginner=豆沙绿、intermediate=焦糖橙、advanced=柔粉；完成=豆沙绿、进行中=暖黄）。
- **弹窗**：纸面卡片 + `--shadow-pop`，柔和淡入（scale .94→1 + translateY 18→0，0.35s）。
- **导航**：暖白毛玻璃（`rgba(255,253,247,.92)` + blur 18px）+ 暖色细描边；激活项为焦糖橙浅底胶囊。
- **角色卡**：柔粉径向光晕 hover 暗示（贴纸感），无发光阴影。

## 表面（Surfaces）

- 登录/注册（auth.css）：奶油纸底 + 三团柔和暖色径向晕染 + 稀疏暖色小点；纸面卡片。
- 学习中心首页（learn.css）：暖白导航 + 纸感欢迎卡（楷体标题）+ 数据卡 + 任务/角色区。
- 课程中心（courses.css）：学科/课程卡片、课时列表、图文长文阅读卡、测验、B 站视频卡与播放弹窗。
- 论文对话（paper.css）：上传侧栏 + 角色对话区（柔紫角色气泡）。
- 动漫语感（anime.css）：片段卡 + 字幕/影子跟读区。
- 创作社群（community.css）：发布卡 + 动态流 + 详情/评论弹窗。
- 个人中心（profile.css）：资料卡 + 数据卡 + 成就 + 金币流水。

## 知识图解（Lesson Diagrams）

`seed/gen_diagrams.py` 生成暖色纸感 SVG（bg `#F7F1E5`、panel `#FFFDF7`、线条 `#EADFC9`、文字 `#4A4038`/`#6E6250`，主色 `#B85E24`，辅色柔粉/淡紫/暖黄/豆沙绿深），按学科与章节生成函数图像、流程图、结构图、时间轴、步骤截图等，data URI 内嵌于课时内容。

## 动效（Motion）

- 动效强度保持中等，服务于层级、反馈与状态切换：导航与页面标题入场、内容卡片滚动揭示、点击 ripple、指针位置光斑、顶部阅读进度线、模态淡入、进度条填充、签到按钮状态与 toast 反馈。
- 动态插入的课程、作品、成就和字幕内容由共享 `motion.js` 自动接入；仅使用 transform/opacity 与原生 WAAPI，避免布局抖动。
- 所有自动动效遵循 `prefers-reduced-motion`，减少动效时直接呈现内容。
- 已移除：扫描线、网格滚动、霓虹扫光、故障文字、发光呼吸、星级闪烁等炫技动效。

## 浏览器表面

暖色滚动条（`rgba(176,138,92,.35)` 圆角滑块）、选区（`--accent-soft` 底 + `--accent-deep` 字）、`:focus-visible` 焦糖橙焦点环。
