USE sekai_friend;

-- 用户表
CREATE TABLE IF NOT EXISTS sekai_learning_users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nickname VARCHAR(100),
    avatar VARCHAR(255),
    exp_points INT DEFAULT 0,
    level INT DEFAULT 1,
    coins INT DEFAULT 500,
    streak_days INT DEFAULT 0,
    last_checkin_date DATE,
    favorites_json TEXT NULL,
    settings_json TEXT,
    last_login_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 角色表（用于Paper2Gal的可选角色）
CREATE TABLE IF NOT EXISTS sekai_learning_characters (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    series VARCHAR(100),
    personality TEXT,
    avatar VARCHAR(255),
    voice_style TEXT,
    greeting TEXT,
    enabled BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 论文/教材表（Paper2Gal）
CREATE TABLE IF NOT EXISTS sekai_learning_papers (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    title VARCHAR(200) NOT NULL,
    original_filename VARCHAR(255),
    file_path VARCHAR(500),
    file_type VARCHAR(20) COMMENT 'pdf, txt, md',
    content_text TEXT,
    summary TEXT,
    chapters_json TEXT,
    character_id VARCHAR(50),
    status VARCHAR(20) DEFAULT 'uploaded' COMMENT 'uploaded, processing, ready, error',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES sekai_learning_users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 对话场景表（Paper2Gal对话）
CREATE TABLE IF NOT EXISTS sekai_learning_scenes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    paper_id BIGINT NOT NULL,
    scene_index INT NOT NULL,
    chapter_title VARCHAR(200),
    dialogue_json TEXT NOT NULL COMMENT '[{speaker, text, emotion, choices}]',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (paper_id) REFERENCES sekai_learning_papers(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 动漫片段表（沉浸式语言学习）
CREATE TABLE IF NOT EXISTS sekai_learning_anime_clips (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    anime_name VARCHAR(100),
    episode INT,
    video_url VARCHAR(500),
    subtitle_json TEXT COMMENT '[{start_ms, end_ms, jp, cn, keywords}]',
    difficulty VARCHAR(20) DEFAULT 'N5' COMMENT 'N5,N4,N3,N2,N1',
    tags_json TEXT NULL,
    view_count INT DEFAULT 0,
    enabled BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 用户学习记录
CREATE TABLE IF NOT EXISTS sekai_learning_study_records (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    study_type VARCHAR(30) NOT NULL COMMENT 'paper_read, shadow_read, daily_task',
    target_id BIGINT,
    duration_sec INT DEFAULT 0,
    progress_pct INT DEFAULT 0,
    exp_earned INT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES sekai_learning_users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 每日任务表
CREATE TABLE IF NOT EXISTS sekai_learning_daily_tasks (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    task_date DATE NOT NULL,
    tasks_json TEXT NOT NULL COMMENT '[{type, title, done, exp}]',
    completed_count INT DEFAULT 0,
    total_count INT DEFAULT 0,
    bonus_claimed BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uk_user_date (user_id, task_date),
    FOREIGN KEY (user_id) REFERENCES sekai_learning_users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 成就/徽章表
CREATE TABLE IF NOT EXISTS sekai_learning_achievements (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    icon VARCHAR(255),
    category VARCHAR(30) COMMENT 'reading, streak, social, creation',
    required_value INT DEFAULT 0,
    reward_coins INT DEFAULT 0,
    enabled BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 用户成就表
CREATE TABLE IF NOT EXISTS sekai_learning_user_achievements (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    achievement_id VARCHAR(50) NOT NULL,
    unlocked_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uk_user_achievement (user_id, achievement_id),
    FOREIGN KEY (user_id) REFERENCES sekai_learning_users(id) ON DELETE CASCADE,
    FOREIGN KEY (achievement_id) REFERENCES sekai_learning_achievements(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 用户创作/同人作品表
CREATE TABLE IF NOT EXISTS sekai_learning_creations (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    cover_url VARCHAR(500),
    creation_type VARCHAR(30) COMMENT 'note, artwork, voice, other',
    tags_json TEXT NULL,
    likes_count INT DEFAULT 0,
    comments_count INT DEFAULT 0,
    status VARCHAR(20) DEFAULT 'published',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES sekai_learning_users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 评论表
CREATE TABLE IF NOT EXISTS sekai_learning_comments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    creation_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    content TEXT NOT NULL,
    parent_id BIGINT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (creation_id) REFERENCES sekai_learning_creations(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES sekai_learning_users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 点赞表
CREATE TABLE IF NOT EXISTS sekai_learning_likes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    creation_id BIGINT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uk_user_creation_like (user_id, creation_id),
    FOREIGN KEY (user_id) REFERENCES sekai_learning_users(id) ON DELETE CASCADE,
    FOREIGN KEY (creation_id) REFERENCES sekai_learning_creations(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 积分兑换记录
CREATE TABLE IF NOT EXISTS sekai_learning_coin_logs (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    amount INT NOT NULL,
    reason VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES sekai_learning_users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 插入示例角色
INSERT IGNORE INTO sekai_learning_characters (id, name, series, personality, avatar, voice_style, greeting, enabled) VALUES
('char-miku', '初音未来', 'VOCALOID', '活泼开朗，喜欢用音乐比喻来解释复杂概念', '/img/char/miku.png', '元气满满', 'こんにちは！让初音用歌声带你学知识吧！', TRUE),
('char-reimu', '博丽灵梦', '东方Project', '慵懒但洞察力惊人，用反问引导思维', '/img/char/reimu.png', '淡定吐槽', '哼，这种程度的问题，稍微动动脑子不就好了嘛？', TRUE),
('char-rin', '铃仙·优昙华院', '东方Project', '温柔耐心，擅长将复杂理论分解为小步骤', '/img/char/rin.png', '温柔解说', '让我来慢慢为你讲解吧，不用着急哦。', TRUE),
('char-rem', '蕾姆', 'Re:Zero', '认真负责，用比喻和日常例子解释概念', '/img/char/rem.png', '认真讲解', '蕾姆会用最简单的方式让你理解的！', TRUE),
('char-kurisu', '牧濑红莉栖', 'Steins;Gate', '学霸属性，严谨但不失幽默，喜欢用实验比喻', '/img/char/kurisu.png', '学术吐槽', '哼，这种程度的问题，称不上疯狂scientist的我来教你吧。', TRUE);

-- 插入成就
INSERT IGNORE INTO sekai_learning_achievements (id, name, description, icon, category, required_value, reward_coins) VALUES
('ach-first-read', '初学者', '完成第一篇论文阅读', '/img/ach/book.png', 'reading', 1, 50),
('ach-10-reads', '求知若渴', '阅读10篇论文', '/img/ach/library.png', 'reading', 10, 200),
('ach-streak-3', '三日坚持', '连续学习3天', '/img/ach/flame.png', 'streak', 3, 100),
('ach-streak-7', '一周达人', '连续学习7天', '/img/ach/star.png', 'streak', 7, 300),
('ach-first-post', '创作者', '发布第一篇同人作品', '/img/ach/pen.png', 'creation', 1, 100),
('ach-10-likes', '人气之星', '获得10个点赞', '/img/ach/heart.png', 'social', 10, 150),
('ach-first-lesson', '学海启航', '完成第一节课', '/img/ach/book.png', 'reading', 1, 50),
('ach-5-lessons', '勤学不辍', '完成5节课', '/img/ach/library.png', 'reading', 5, 150),
('ach-20-lessons', '学霸之路', '完成20节课', '/img/ach/star.png', 'reading', 20, 500),
('ach-perfect-quiz', '满分达人', '一次测验全部正确', '/img/ach/star.png', 'reading', 1, 200);

-- =============================================
-- 综合知识库 - 课程系统
-- =============================================

CREATE TABLE IF NOT EXISTS sekai_learning_subjects (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    icon VARCHAR(50),
    sort_order INT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS sekai_learning_courses (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    subject_id BIGINT NOT NULL,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    difficulty VARCHAR(20),
    estimated_hours INT DEFAULT 1,
    lesson_count INT DEFAULT 0,
    sort_order INT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (subject_id) REFERENCES sekai_learning_subjects(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS sekai_learning_lessons (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    course_id BIGINT NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    summary TEXT,
    key_points TEXT,
    difficulty VARCHAR(20),
    estimated_minutes INT DEFAULT 10,
    sort_order INT DEFAULT 0,
    status VARCHAR(20) DEFAULT 'published',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES sekai_learning_courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS sekai_learning_quiz_questions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    lesson_id BIGINT NOT NULL,
    question TEXT NOT NULL,
    question_type VARCHAR(20) DEFAULT 'single',
    options TEXT,
    correct_answer VARCHAR(500) NOT NULL,
    explanation TEXT,
    sort_order INT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (lesson_id) REFERENCES sekai_learning_lessons(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS sekai_learning_user_progress (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    lesson_id BIGINT NOT NULL,
    status VARCHAR(20) DEFAULT 'not_started',
    read_count INT DEFAULT 0,
    time_spent_seconds INT DEFAULT 0,
    completed_at DATETIME,
    started_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_user_lesson (user_id, lesson_id),
    FOREIGN KEY (user_id) REFERENCES sekai_learning_users(id) ON DELETE CASCADE,
    FOREIGN KEY (lesson_id) REFERENCES sekai_learning_lessons(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS sekai_learning_quiz_attempts (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    lesson_id BIGINT NOT NULL,
    score DECIMAL(5,1),
    total_questions INT,
    correct_count INT,
    completed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES sekai_learning_users(id) ON DELETE CASCADE,
    FOREIGN KEY (lesson_id) REFERENCES sekai_learning_lessons(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 外部学习资源表（B站精选视频 / 文章 / 网站）
CREATE TABLE IF NOT EXISTS sekai_learning_resources (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    course_id BIGINT NOT NULL,
    title VARCHAR(300) NOT NULL,
    url VARCHAR(500),
    cover_url VARCHAR(500),
    author VARCHAR(100),
    author_url VARCHAR(500),
    play_count BIGINT DEFAULT 0,
    duration VARCHAR(50),
    description TEXT,
    source_type VARCHAR(20) DEFAULT 'bilibili' COMMENT 'bilibili, article, website',
    sort_order INT DEFAULT 0,
    enabled BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES sekai_learning_courses(id) ON DELETE CASCADE,
    KEY idx_course (course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 种子数据: 学科与课程
-- =============================================

INSERT IGNORE INTO sekai_learning_subjects (id, name, description, icon, sort_order) VALUES
(1, '计算机科学', '从编程入门到算法设计，构建计算机科学知识体系', '💻', 1),
(2, '数学', '线性代数、微积分、概率论等基础数学知识', '📐', 2),
(3, '物理学', '经典力学与电磁学，探索自然世界的基本规律', '⚛️', 3),
(4, '世界历史', '从古代文明到工业革命，回顾人类历史的伟大进程', '🏛️', 4),
(5, '心理学', '认知心理学基础，了解人类心智的运作机制', '🧠', 5);

INSERT IGNORE INTO sekai_learning_courses (id, subject_id, name, description, difficulty, estimated_hours, lesson_count, sort_order) VALUES
-- 计算机科学
(1, 1, 'Python编程入门', '从零开始学习Python编程语言，掌握变量、条件判断、循环和函数', 'beginner', 4, 4, 1),
(2, 1, 'Web开发基础', '学习HTML、CSS和JavaScript，构建你的第一个网站', 'beginner', 3, 3, 2),
-- 数学
(3, 2, '线性代数入门', '向量、矩阵、行列式——机器学习不可或缺的数学基础', 'intermediate', 4, 3, 1),
(4, 2, '微积分入门', '极限、导数、积分——理解变化的数学语言', 'intermediate', 4, 3, 2),
-- 物理学
(5, 3, '经典力学', '牛顿力学、功与能量，理解物体运动的基本规律', 'beginner', 3, 3, 1),
(6, 3, '电磁学基础', '电场、磁场与电磁感应，探索电磁世界的奥秘', 'intermediate', 3, 2, 2),
-- 历史
(7, 4, '世界文明史', '从四大古文明到工业革命，回顾人类文明的辉煌历程', 'beginner', 4, 4, 1),
-- 心理学
(8, 5, '认知心理学入门', '记忆、注意与学习——探索人类心智的基本运作', 'intermediate', 3, 3, 1);

-- =============================================
-- 种子数据: 课程内容 (lessons)
-- =============================================

-- Python编程入门 (course_id=1)
INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(1, 1, '什么是编程与Python',
'编程，简单来说，就是告诉计算机做什么、怎么做。就像你给朋友写一份详细的菜谱一样，编程就是给计算机写一份详细的指令集。
Python是一种高级编程语言，由Guido van Rossum于1991年创建。它之所以叫Python，不是因为蟒蛇，而是因为Guido是英国喜剧团体Monty Python的粉丝。
为什么选择Python？
1. 语法简洁：Python的代码读起来像英语，非常容易上手
2. 用途广泛：数据分析、人工智能、Web开发、自动化脚本，Python都能胜任
3. 社区活跃：全球数百万开发者使用Python，遇到问题总能找到答案
4. 跨平台：Windows、Mac、Linux都能运行

Python是一种解释型语言，这意味着代码不需要编译，可以直接运行。这对初学者非常友好，因为你可以写完一行就立刻看到结果。
在开始编程之前，理解几个核心概念很重要：
- 代码：你写给计算机的指令
- 解释器：将你的代码翻译成计算机能理解的语言
- 变量：存储数据的容器
- 函数：一段可重复使用的代码块

记住：编程不是记忆语法，而是培养解决问题的思维方式。每个人都能学会编程。',
'编程入门指南，介绍Python语言的特点和基本编程概念',
'["编程是给计算机写指令","Python是简洁易学的编程语言","Python是解释型语言，无需编译即可运行","编程的核心是培养解决问题的思维方式"]',
'beginner', 10, 1),

(2, 1, '变量与数据类型',
'变量就像一个带标签的盒子，你可以把各种数据放进去，需要的时候再取出来。
在Python中，创建变量非常简单：
```python
name = "小明"      # 字符串类型
age = 18           # 整数类型
height = 1.75      # 浮点数（小数）类型
is_student = True  # 布尔类型
```

Python有四种基本数据类型：
1. 整数(int)：如 0, 42, -10, 1000000
2. 浮点数(float)：如 3.14, -0.5, 1.0
3. 字符串(str)：如 "Hello", ''你好''，用引号包裹的文本
4. 布尔型(bool)：只有 True 和 False 两个值
变量命名规则：
- 只能包含字母、数字和下划线
- 不能以数字开头
- 区分大小写（name 和 Name 是不同的变量）
- 不能使用 Python 的关键字（如 if, for, class 等）

类型转换是常见操作：
```python
score = "95"
int_score = int(score)  # 字符串转整数
```

理解变量和数据类型是编程的基石。就像盖房子需要砖块一样，写程序需要变量来存储和处理数据。',
'学习Python中的变量概念和四种基本数据类型',
'["变量是存储数据的容器","Python四种基本类型: int, float, str, bool","变量命名不能用数字开头","类型转换函数: int(), str(), float()"]',
'beginner', 12, 2),

(3, 1, '条件判断',
'生活中我们每天都在做判断：如果下雨，就带伞；否则，就不带。编程中的条件判断也是这个逻辑。
Python使用 if-elif-else 结构来做判断。
```python
score = 85

if score >= 90:
    print("优秀")
elif score >= 80:
    print("良好")
elif score >= 60:
    print("及格")
else:
    print("需要加油")
```

比较运算符：
- == 等于（两个等号！一个等号是赋值）
- != 不等于
- >  大于
- <  小于
- >= 大于等于
- <= 小于等于

逻辑运算符用于组合多个条件：
- and：两个条件都满足才为真
- or：任一条件满足即为真
- not：反转条件
```python
age = 20
has_ticket = True

if age >= 18 and has_ticket:
    print("可以入场")
else:
    print("不能入场")
```

注意缩进！Python使用缩进来表示代码块。同一层级的代码必须对齐，这是Python最独特的语法规则。
条件判断使程序具备了"决策能力"，能够根据不同情况执行不同的代码。这是实现智能程序的基础。',
'掌握Python中的if-elif-else条件判断结构',
'["if-elif-else 条件判断结构","比较运算符: ==, !=, >, <, >=, <=","逻辑运算符: and, or, not","Python使用缩进表示代码块"]',
'beginner', 12, 3),

(4, 1, '循环语句',
'如果需要打印1到100的数字，你当然不想写100行print。循环就是用来解决这种重复任务的。
Python有两种主要的循环：
1. for循环——遍历序列
```python
fruits = ["苹果", "香蕉", "橙子"]
for fruit in fruits:
    print(fruit)

# range() 生成数字序列
for i in range(5):
    print(i)  # 输出 0, 1, 2, 3, 4
```

2. while循环——条件为真时持续执行
```python
count = 1
while count <= 5:
    print(count)
    count = count + 1
```

循环控制语句：
- break：立即跳出循环
- continue：跳过当前迭代，继续下一次
```python
# 找到第一个偶数
for num in [1, 3, 5, 6, 7, 8]:
    if num % 2 == 0:
        print(f"找到了: {num}")
        break
```

常见陷阱：避免无限循环！
```python
# 错误示例——永远停不下来
# while True:
#     print("停不下来！")
```

嵌套循环也很常用，比如打印乘法表。
```python
for i in range(1, 10):
    for j in range(1, i+1):
        print(f"{j}x{i}={i*j}", end=" ")
    print()
```

循环是编程中最强大的工具之一，它让你能用几行代码处理成千上万的数据。',
'掌握Python的for循环和while循环，以及break和continue的使用',
'["for循环用于遍历序列","while循环在条件为真时持续执行","break跳出循环，continue跳过当前迭代","range()函数生成数字序列","避免无限循环"]',
'beginner', 15, 4);

-- Web开发基础 (course_id=2)
INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(5, 2, 'HTML基础结构',
'HTML（超文本标记语言）是网页的骨骼。每个网页都是由HTML标签构成的。
一个标准的HTML文档结构：
```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>我的第一个网页</title>
</head>
<body>
    <h1>欢迎来到我的网站</h1>
    <p>这是一个段落。</p>
</body>
</html>
```

核心HTML标签：
- 标题标签：h1到h6，h1最大
- 段落标签：p
- 链接标签：a  href="" 定义链接地址
- 图片标签：img  src="" alt=""
- 列表：ul（无序列表）、ol（有序列表）、li（列表项）
- 容器：div（块级容器）、span（行内容器）

标签属性提供了额外信息：
```html
<a href="https://www.example.com" target="_blank">新窗口打开</a>
<img src="photo.jpg" alt="一张照片" width="300">
```

HTML5新增的语义化标签使网页结构更清晰：
- header：页眉
- nav：导航栏
- main：主要内容
- article：文章
- section：区域
- footer：页脚
记住HTML的核心原则：用正确的标签表达正确的内容意义。这不仅让代码更易读，也对搜索引擎优化(SEO)有帮助。',
'学习HTML的基本结构和常用标签',
'["HTML是网页的结构语言","基本标签: h1-h6, p, a, img, div, span","标签属性提供额外信息","语义化标签: header, nav, main, footer"]',
'beginner', 10, 1),

(6, 2, 'CSS样式入门',
'CSS（层叠样式表）是网页的"衣服"，负责控制网页的外观。
CSS有三种使用方式：
1. 内联样式：style="color: red" 直接写在标签上
2. 内部样式表：写在style标签里
3. 外部样式表（推荐）：独立.css文件

选择器是CSS的核心概念——它决定了样式应用到哪里。
```css
/* 标签选择器 */
p { color: #333; }

/* 类选择器（最常用） */
.highlight { background: yellow; }

/* ID选择器 */
#header { font-size: 24px; }

/* 后代选择器 */
nav a { text-decoration: none; }
```

盒模型是CSS的基石——每个元素都是一个矩形盒子：
- content：内容区域
- padding：内边距（内容到边框的距离）
- border：边框
- margin：外边距（元素之间的距离）
```css
.box {
    width: 300px;
    padding: 20px;
    border: 2px solid #ccc;
    margin: 10px auto;
}
```

布局方式：
- Flexbox：一维布局的利器，适合导航栏、卡片排列
- Grid：二维布局，适合复杂的页面结构
CSS的核心哲学是"分离内容和样式"——HTML负责结构，CSS负责外观。这样修改样式时不需要改动HTML。',
'掌握CSS选择器、盒模型和基本布局方式',
'["CSS控制网页的外观和样式","三种使用方式: 内联、内部、外部","常用选择器: 标签、类、ID","盒模型: content-padding-border-margin","Flexbox和Grid是现代化布局方式"]',
'beginner', 12, 2),

(7, 2, 'JavaScript入门',
'JavaScript让网页"活"起来——它负责网页的交互和动态行为。
变量声明：
```javascript
let name = "小明";     // 可修改的变量
const PI = 3.14159;    // 不可修改的常量
// var name = "小明";  // 旧式写法，不推荐
```

数据类型：
- Number：数字（整数和小数不区分）
- String：字符串
- Boolean：true / false
- Array：数组 [1, 2, 3]
- Object：对象 {name: "小明", age: 18}

函数是JavaScript的核心：
```javascript
function greet(name) {
    return "你好, " + name + "!";
}

// 箭头函数（现代写法）
const add = (a, b) => a + b;
```

DOM操作——修改网页内容：
```javascript
// 获取元素
const title = document.querySelector("h1");
// 修改内容
title.textContent = "新标题";
// 修改样式
title.style.color = "blue";
```

事件处理——响应用户操作：
```javascript
const button = document.querySelector("button");
button.addEventListener("click", () => {
    alert("你点击了按钮!");
});
```

JavaScript与HTML/CSS的关系：
- HTML：结构（骨架）
- CSS：样式（衣服）
- JavaScript：行为（动作）
三者配合才能构建完整的现代网页。',
'学习JavaScript基本语法、DOM操作和事件处理',
'["JavaScript负责网页交互","let/const声明变量","函数是JavaScript的核心","DOM操作修改网页内容","事件处理响应用户操作"]',
'beginner', 15, 3);

-- 线性代数入门 (course_id=3)
INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(8, 3, '向量与向量运算',
'向量是线性代数中最基本的概念。直观地说，向量是一个有方向的量——既有大小，又有方向。
在数学中，一个n维向量可以表示为：
v = (v1, v2, ..., vn)

例如：v = (3, 4) 是一个二维向量。
向量的基本运算：

1. 向量加法：对应分量相加
(1, 2) + (3, 4) = (4, 6)

2. 标量乘法：每个分量乘以一个数
2 × (3, 4) = (6, 8)

3. 点积（内积）：
(1, 2)·(3, 4) = 1×3 + 2×4 = 11

点积的几何意义：a·b = |a||b|cosθ
当点积为0时，两个向量垂直。
4. 向量的长度（模）：
|v| = sqrt(v1² + v2² + ...)

在机器学习中，向量无处不在：
- 数据点 = 特征向量
- 词嵌入 = 词向量
- 图像 = 像素值的向量

理解向量是理解更高维空间的第一步。虽然我们只能看到三维世界，但数学可以处理任意维度的向量空间。',
'学习向量的基本概念和运算：加法、标量乘法、点积',
'["向量是有方向的量","向量加法是对应分量相加","点积的几何意义与垂直判断","向量在机器学习中的应用广泛"]',
'intermediate', 12, 1),

(9, 3, '矩阵基础',
'矩阵是数字的矩形排列表。如果说向量是一条线，矩阵就是一个面。
一个 m×n 矩阵有 m 行 n 列：
```
A = [ 1  2  3 ]
    [ 4  5  6 ]   (2×3矩阵)
```

矩阵运算：
1. 矩阵加法：对应位置相加（要求同维度）
2. 标量乘法：每个元素乘以该数
3. 矩阵乘法：A(m×n) × B(n×p) = C(m×p)
   Cij = Ai1×B1j + Ai2×B2j + ...

矩阵乘法不满足交换律！A×B ≠ B×A

特殊矩阵：
- 单位矩阵I：对角线为1，其余为0（矩阵乘法中的"1"）
- 转置矩阵A^T：行列互换
- 逆矩阵A^(-1)：满足 A×A^(-1) = I

矩阵在实践中的应用：
- 图像处理：每个像素是一个矩阵元素
- 3D图形：旋转变换用矩阵表示
- 线性回归：用矩阵求解最优参数
- 神经网络：每一层的计算就是矩阵乘法

矩阵之所以重要，是因为它能高效地表示和处理批量数据。一次性处理1000个方程和逐个处理是不可同日而语的。',
'掌握矩阵的基本概念、运算和实际应用',
'["矩阵是数字的矩形排列","矩阵乘法 A(m×n)×B(n×p)=C(m×p)","矩阵乘法不满足交换律","单位矩阵、转置、逆矩阵","矩阵在图像处理、AI中的应用"]',
'intermediate', 15, 2),

(10, 3, '行列式',
'行列式是一个将方阵映射到一个数的函数，记为 det(A) 或 |A|。
2×2矩阵的行列式：
| a  b |
| c  d |  = ad - bc

3×3矩阵的行列式：用对角线法则计算。
行列式的几何意义：
- 对于2×2矩阵，行列式的绝对值等于其列向量张成的平行四边形的面积
- 对于3×3矩阵，等于平行六面体的体积
- 如果行列式为0，说明向量线性相关（退化）

行列式的重要性质：
1. det(I) = 1
2. det(AB) = det(A) × det(B)
3. 如果det(A) = 0，则A不可逆
4. 交换两行，行列式变号

特征值和特征向量：
如果 Av = λv（λ是标量，v是非零向量），则λ是特征值，v是特征向量。
特征值分解的应用场景：
- 主成分分析(PCA)：降维
- PageRank：搜索引擎的核心算法
- 振动分析：工程结构设计
- 人脸识别：特征脸方法

行列式揭示了矩阵的"本质属性"——它可以告诉我们线性变换是放大还是缩小了空间，是否可逆，以及有多"接近"退化。',
'理解行列式的概念、几何意义和特征值分解的应用',
'["行列式将方阵映射为一个数","2×2行列式= ad-bc","行列式为0意味着矩阵不可逆","特征值分解用于降维和推荐系统"]',
'intermediate', 15, 3);

-- 微积分入门 (course_id=4)
INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(11, 4, '极限的概念',
'极限是微积分的基础。它回答的问题是：当自变量无限接近某个值时，函数值会趋近于什么？

直观理解：函数 f(x) = (x^2 - 1)/(x - 1)，当x接近于1时，f(x)接近于2（虽然f(1)本身没有定义）。
极限的符号表示：
lim(x→a) f(x) = L
读作：当x趋近于a时，f(x)的极限是L。
极限的性质：
1. 和的极限 = 极限的和
2. 积的极限 = 极限的积
3. 商的极限 = 极限的商（分母极限不为0）
重要的极限：
- lim(x→0) sin(x)/x = 1
- lim(x→∞) (1 + 1/x)^x = e ≈ 2.718

无穷小的概念：当x→0时，sin(x) ~ x,  tan(x) ~ x,  ln(1+x) ~ x
这些等价无穷小在简化计算中非常有用。
连续函数的定义：
函数f(x)在点a连续，当且仅当：
lim(x→a) f(x) = f(a)

直观地说，连续函数的图像可以"一笔画出"。
极限思想突破了"静止"的数学观，引入了"逼近"和"无穷"的概念。这是从初等数学到高等数学的关键一步。',
'学习极限的基本概念、性质和重要极限公式',
'["极限描述函数的趋近行为","极限的四则运算法则","重要极限: sin(x)/x→1","连续函数定义","极限是微积分的基础"]',
'intermediate', 12, 1),

(12, 4, '导数与微分',
'导数描述函数的变化率。如果你在开车，速度表上的读数就是位置函数对时间的导数。
导数的定义：
f''(x) = lim(h→0) [f(x+h) - f(x)] / h

几何意义：导数等于函数曲线在这一点处切线的斜率。
基本导数公式：
- (x^n)'' = n·x^(n-1)
- (sin x)'' = cos x
- (cos x)'' = -sin x
- (e^x)'' = e^x
- (ln x)'' = 1/x

导数的运算法则：
- 和的导数 = 导数的和
- 积的导数：(fg)'' = f''g + fg''
- 商的导数：(f/g)'' = (f''g - fg'')/g^2
- 链式法则：(f(g(x)))'' = f''(g(x))·g''(x)

微分：dy = f''(x)dx
微分是函数增量的线性近似。
微分的实际应用：
- 求最大值/最小值（令导数为0）
- 经济学中的边际分析
- 物理学中的瞬时速度
- 机器学习中的梯度下降
梯度下降的思想：沿着导数的反方向移动，就能找到函数的最小值。这是目前训练几乎所有的神经网络的核心方法。',
'掌握导数的概念、基本公式及其在优化中的实际应用',
'["导数 = 函数的变化率","基本导数公式","链式法则: (f(g))'' = f''(g)·g''","梯度下降与最小值求解","导数在AI优化中至关重要"]',
'intermediate', 15, 2),

(13, 4, '积分入门',
'积分是微分的逆运算，解决的是"累积"问题：面积、体积、总量等。
不定积分（反导数）：
∫f(x) dx = F(x) + C  其中 F''(x) = f(x)

基本积分公式：
- ∫x^n dx = x^(n+1)/(n+1) + C
- ∫1/x dx = ln|x| + C
- ∫e^x dx = e^x + C
- ∫sin x dx = -cos x + C
- ∫cos x dx = sin x + C

定积分——求曲线下的面积：
∫[a,b] f(x) dx = F(b) - F(a)

几何意义：定积分等于f(x)在区间[a,b]上与x轴围成的（带符号）面积。
牛顿-莱布尼茨公式：
∫[a,b] f(x) dx = F(b) - F(a)
这是连接微分和积分的桥梁。
微积分基本定理：
微分和积分互为逆运算——这就是为什么它们被称为微积分学。
积分应用场景：
- 计算不规则图形的面积
- 概率论：连续分布的概率密度函数的积分
- 物理学：位移 = 速度的积分
- 信号处理：傅里叶变换的基础

微积分之所以伟大，在于它将"变化"本身变成了一个可以精确计算的对象。',
'掌握积分的基本概念、基本公式和牛顿-莱布尼茨公式',
'["积分是微分的逆运算","不定积分: 求原函数","定积分: 求曲线下面积","牛顿-莱布尼茨公式","微积分基本定理"]',
'intermediate', 15, 3);

-- 经典力学 (course_id=5)
INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(14, 5, '牛顿运动定律',
'牛顿三大运动定律是经典力学的基石。1687年发表在《自然哲学的数学原理》中。
第一定律（惯性定律）：
"物体将保持静止或匀速直线运动状态，除非有外力迫使它改变。"——这就是为什么急刹车时你会向前倾。
第二定律（加速度定律）：
F = ma
力 = 质量 × 加速度
这是物理学中最著名的方程之一。它告诉我们：同样的力作用于更重的物体，产生的加速度更小。
第三定律（作用力与反作用力）：
"每一个作用力都有一个大小相等、方向相反的反作用力。"——你推墙，墙也在推你，只是墙太坚固了。
力的合成与分解：
多个力作用于同一物体时，可以合成为一个合力。一个力也可以分解为水平和垂直两个分量。
常见的力：
- 重力：G = mg（g 约 9.8 m/s^2）
- 摩擦力：f = μN（μ是摩擦系数，N是正压力）
- 弹力：F = -kx（胡克定律，k是弹性系数）
- 张力：绳索中的力

自由体图（受力分析图）是解决力学问题的利器。画出所有作用力，然后分别列出水平和垂直方向的方程。
牛顿力学虽然被相对论修正，但在日常生活中依然极其精确。它帮我们理解了从苹果落地到火箭升空的一切。',
'学习牛顿三大运动定律及其应用',
'["牛顿第一定律: 惯性定律","牛顿第二定律: F = ma","牛顿第三定律: 作用力与反作用力","力的合成与分解","重力、摩擦力、弹力、张力"]',
'beginner', 12, 1),

(15, 5, '功与能量',
'能量是物理学中最重要的概念之一。能量不能凭空产生或消失，只能转换形式。
功的定义：
W = F × s × cosθ
功 = 力 × 位移 × 力与位移夹角的余弦
注意：如果你举着重物站着不动，没有位移，所以做功为0。
动能：
Ek = 1/2 mv^2
动能与质量成正比，与速度的平方成正比。速度翻倍，动能变为4倍。
重力势能：
Ep = mgh
势能与高度成正比。
机械能守恒定律：
在没有非保守力（如摩擦力）做功的情况下：
Ek1 + Ep1 = Ek2 + Ep2
动能和势能的总和保持不变。
例如：自由落体中，高度减小 → 势能减小，但速度增加 → 动能增加。总和不变。
功率：
P = W / t
功率衡量做功的快慢，单位是瓦特(W)。
能量守恒是宇宙最基本的法则之一。从机械能到电能、热能、核能，所有形式的能量都可以互相转换，但总能量不变。',
'学习功、动能、势能的概念和能量守恒定律',
'["功 = 力×位移×cosθ","动能: Ek = 1/2 mv²","重力势能: Ep = mgh","机械能守恒: Ek+Ep=常数","功率 = 做功/时间"]',
'beginner', 12, 2),

(16, 5, '动量与碰撞',
'动量是描述物体运动量的物理量。
动量定义：
p = mv
动量 = 质量 × 速度

动量是矢量，方向与速度方向相同。
动量守恒定律：
在不受外力（或外力之和为零）的系统内，总动量保持不变：
m1v1 + m2v2 = m1v1'' + m2v2''

冲量——力在时间上的积累：
I = F × Δt = Δp
冲量 = 力的变化 × 时间 = 动量的变化
这就是为什么安全气囊能救人命：它延长了碰撞时间Δt，从而减小了作用力F。
碰撞类型：
1. 完全弹性碰撞：动能守恒（理想情况）
2. 完全非弹性碰撞：碰后合为一体
3. 非完全弹性碰撞：介于两者之间
碰撞实例分析：
- 台球碰撞：接近完全弹性
- 子弹嵌入木块：完全非弹性
- 车祸碰撞：需要分析恢复系数
动量守恒是比牛顿定律更基本的物理定律，在相对论和量子力学中同样成立。它源于空间的平移对称性——一个深刻的物理原理。',
'学习动量、冲量的概念和动量守恒定律',
'["动量: p = mv","动量守恒: 无外力时总动量不变","冲量: I = F·Δt = Δp","弹性碰撞与完全非弹性碰撞","安全气囊通过延长碰撞时间减小力"]',
'beginner', 12, 3);

-- 电磁学基础 (course_id=6)
INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(17, 6, '电场与库仑定律',
'电现象无处不在——从闪电到手机屏幕，都是电荷相互作用的结果。
电荷是物质的基本属性，有两种：正电荷和负电荷。
- 同种电荷相互排斥
- 异种电荷相互吸引
- 电荷守恒：电荷不能创造或消失，只能转移
库仑定律：
F = k × q1q2 / r^2
两个点电荷之间的力与电量的乘积成正比，与距离的平方成反比。k = 8.99 × 10^9 N·m^2/C^2

注意库仑定律与万有引力定律F = Gm1m2/r^2的相似性！都是平方反比律。
电场强度：
E = F / q（单位电荷受到的力）
电场是描述空间中每一点受到电力作用的概念。
电场线的性质：
- 从正电荷出发，终止于负电荷
- 电场线越密，电场越强
- 电场线永不相交
电场叠加原理：多个电荷在某点的总电场等于各电荷单独产生的电场之和。
电势能——电荷在电场中具有的能量。
静电应用：激光打印机、静电喷涂、除尘器都利用了静电原理。',
'学习电荷、库仑定律和电场的基本概念',
'["电荷分正负，同性排斥异性吸引","库仑定律: F = k·q1q2/r²","电场强度: E = F/q","电场线从正到负","平方反比律与万有引力相似"]',
'intermediate', 12, 1),

(18, 6, '磁场与电磁感应',
'磁场和电一样是自然的基本力场。地球本身就是一个巨大的磁体。
磁现象的基本事实：
- 磁铁有N极和S极
- 同名磁极排斥，异名磁极吸引
- 磁单极子尚未被发现（总是N和S成对出现）
电流产生磁场（奥斯特发现）：
通电导线周围存在磁场。右手定则：拇指指向电流方向，四指弯曲方向即为磁场方向。
磁场对运动电荷的力（洛伦兹力）：
F = qvB sinθ
磁场只改变电荷运动的方向（垂直于速度），不做功。
电磁感应（法拉第定律）：
变化的磁场会产生电动势（电压）。这就是发电机的工作原理：机械能 → 旋转线圈在磁场中 → 产生电流 → 电能

感应电动势的大小与磁通量的变化率成正比。
楞次定律：感应电流的方向总是阻碍引起感应的磁通量变化。——大自然不喜欢改变！

应用：
- 发电机：机械能→电能
- 电动机：电能→机械能
- 变压器：改变交流电压
- 电磁炉：涡流加热
- 无线充电：互感原理
麦克斯韦方程组统一了电和磁，预言了电磁波的存在——光就是电磁波。这是19世纪物理学最伟大的成就之一。',
'学习磁场、洛伦兹力和电磁感应原理',
'["电流产生磁场（奥斯特发现）","洛伦兹力: F = qvB·sinθ","电磁感应: 变化的磁场产生电流","楞次定律: 感应电流阻碍变化","麦克斯韦统一了电和磁"]',
'intermediate', 15, 2);

-- 世界文明史 (course_id=7)
INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(19, 7, '四大文明古国',
'人类最早的文明起源于大河流域。四大文明古国分别是：
1. 古埃及文明（尼罗河流域，约公元前3100年）
   - 金字塔是古埃及最伟大的建筑成就
   - 象形文字是最早的文字系统之一
   - 发明了365天的太阳历
2. 美索不达米亚文明（两河流域，约公元前3500年）
   - 苏美尔人发明了楔形文字
   - 汉谟拉比法典是最早的成文法典之一
   - 发明了车轮和60进制

3. 古印度文明（印度河流域，约公元前2500年）
   - 哈拉帕和摩亨佐-达罗是精心规划的城市
   - 发明了"0"和十进制
   - 佛教和印度教起源于印度
4. 古中国文明（黄河流域，约公元前2070年）
   - 夏、商、周三代奠定了中华文明基础
   - 甲骨文是已知最早的汉字
   - 四大发明深远影响了世界历史
文明的共同特征：
- 城市定居生活
- 文字的出现
- 社会分层和复杂组织
- 大型公共建筑
- 农业剩余支撑非农业人口
为什么文明诞生在大河流域？因为河流提供灌溉水源、肥沃的冲积土和交通便利。水是文明之母。',
'了解四大文明古国及其核心成就',
'["四大文明: 埃及、两河、印度、中国","文明特征: 城市、文字、分层、建筑","河流孕育了最早的文明","各文明的独特发明和贡献"]',
'beginner', 10, 1),

(20, 7, '古希腊与罗马文明',
'古希腊和古罗马是西方文明的两大源头，深刻塑造了后世的政治、哲学和艺术。
古希腊文明（约公元前800-前146年）：
- 城邦制度：雅典民主制是直接民主的雏形
- 哲学三杰：苏格拉底（质疑一切）、柏拉图（理念论）、亚里士多德（百科全书式学者）
- 科学成就：毕达哥拉斯定理、阿基米德浮力定律、欧几里得几何原理
- 奥林匹克运动会起源于公元前776年
- 文学：荷马史诗《伊利亚特》《奥德赛》
亚历山大帝国：马其顿国王亚历山大大帝征服了从希腊到印度的广阔领土，促进了东西方文化的交流（希腊化时代）。
古罗马文明（约公元前753-公元476年）：
- 从王政到共和再到帝国
- 十二铜表法是罗马法的起源
- 罗马法是现代大陆法系的基础
- 建设了庞大的道路网和引水渠系统
- 公元313年米兰敕令使基督教合法化

希腊vs罗马：
- 希腊贡献了思想（哲学、民主、科学）
- 罗马贡献了制度（法律、工程、行政管理）

后人说："罗马人征服了希腊，但希腊文化征服了罗马。"古希腊罗马文明至今仍在影响着我们的思维方式。',
'了解古希腊和古罗马文明的成就及其对现代西方文明的影响',
'["雅典民主制是最早的民主","希腊哲学三杰: 苏格拉底、柏拉图、亚里士多德","亚历山大帝国与希腊化时代","罗马法与道路工程","希腊贡献思想，罗马贡献制度"]',
'beginner', 12, 2),

(21, 7, '文艺复兴',
'文艺复兴（约14-17世纪）是欧洲从中世纪走向近代的思想文化运动。它的核心精神是"人文主义"——将关注从神转向人。
文艺复兴始于意大利佛罗伦萨，有三个主要原因：
1. 意大利是古罗马的故土，古典文化遗产丰富
2. 地中海贸易使意大利城邦积累了大量财富
3. 美第奇家族等赞助人支持艺术家和学者
艺术三杰：
- 达·芬奇：《蒙娜丽莎》《最后的晚餐》，集艺术家与科学家于一身
- 米开朗基罗：西斯廷教堂天顶画、雕塑《大卫》
- 拉斐尔：《雅典学院》，体现了古典与和谐之美

科学革命：
- 哥白尼提出日心说，挑战了地心说
- 伽利略用望远镜观测天体，支持日心说
- 牛顿《自然哲学的数学原理》，统一了天体和地上的物理学

文学：
- 但丁《神曲》：从中世纪到文艺复兴的过渡
- 薄伽丘《十日谈》：揭露教会的虚伪
- 莎士比亚：将人性刻画推向巅峰
古腾堡印刷术（约1440年）是知识传播的革命——知识不再被教会垄断。一本书的成本从手工抄写降到可以大规模生产。
文艺复兴实际上是"人的发现"——从以神为中心到以人为中心，开启了现代世界的序幕。',
'了解文艺复兴的核心精神、主要人物及其历史意义',
'["文艺复兴核心: 人文主义","始于佛罗伦萨（财富、古典遗产、赞助人）","艺术三杰: 达·芬奇、米开朗基罗、拉斐尔","科学革命: 哥白尼、伽利略、牛顿","古腾堡印刷术使知识大众化"]',
'beginner', 12, 3),

(22, 7, '工业革命',
'工业革命（约1760-1840年）是人类历史上最重要的转折点之一。它始于英国，改变了世界的每一个角落。
为什么英国率先发生工业革命？
- 煤炭资源丰富
- 资本主义制度成熟
- 殖民地提供原材料和市场
- 政治相对稳定
- 科技创新文化

第一工业革命（18世纪60年代起）：
- 瓦特改良蒸汽机（1769年）：提供了可靠的动力
- 珍妮纺纱机：纺织业机械化
- 铁路和蒸汽机车：交通运输革命
- 从手工业到机器大工业的转变
第二工业革命（19世纪末）：
- 电力的广泛应用
- 内燃机的发明
- 石油成为主要能源
- 钢铁工业大发展
深远影响（积极方面）：
- 生产力空前提高
- 城市化进程加快
- 生活水平整体提升
- 科技以前所未有的速度发展

消极方面：
- 工人阶级受到严重剥削（童工、超长工时）
- 环境污染严重
- 殖民扩张加剧
- 社会矛盾激化（马克思《资本论》应运而生）
工业革命给我们最大的启示：技术变革会同时带来机遇和挑战。如何让技术成果惠及所有人，至今仍是我们需要回答的问题。',
'了解工业革命的原因、过程及其对人类社会的深远影响',
'["工业革命始于18世纪英国","蒸汽机取代人力/水力","第一工业革命: 纺织/铁路/蒸汽","第二工业革命: 电力/内燃机/石油","技术变革的双刃剑效应"]',
'beginner', 12, 4);

-- 认知心理学入门 (course_id=8)
INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(23, 8, '记忆的原理',
'记忆不是录像机，而是一个主动重建的过程。认知心理学将记忆分为三个阶段：

1. 编码——将信息转化为记忆
   - 深加工比浅加工效果好（理解含义 > 死记硬背）
   - 自我参照效应：与自己相关的信息记得更好
   - 间隔效应：分散学习比集中学习效果好得多
2. 存储——保持记忆
   记忆的三种类型：
   - 感觉记忆：持续不足1秒（视觉残像）
   - 短期记忆/工作记忆：保持15-30秒，容量为7±2个组块
   - 长期记忆：理论上无限容量，可保持一生
3. 提取——从记忆中检索信息
   - 提取练习效应：主动回忆比被动复习更有效
   - 编码特异性：学习环境与考试环境越相似，回忆越好
   - 系列位置效应：首因效应（记得开头）和近因效应（记得结尾）
遗忘曲线（艾宾浩斯）：遗忘在学习后立即发生，然后逐渐减缓。这就是为什么要间隔复习。
实际应用建议：
- 使用间隔重复（如闪卡系统：1天→3天→7天→30天）
- 主动回忆（合上书回忆，而不是反复阅读）
- 费曼学习法：用简单的话解释给别人听
- 多感官学习（视觉+听觉+动觉）
- 睡眠对记忆巩固至关重要
理解记忆的原理，你就能更聪明地学习，而不是更努力地学习。',
'学习记忆的三个阶段和科学有效的记忆方法',
'["记忆三阶段: 编码-存储-提取","工作记忆容量: 7±2个组块","提取练习比重复阅读更有效","艾宾浩斯遗忘曲线","间隔重复和主动回忆是最佳学习方法"]',
'intermediate', 12, 1),

(24, 8, '注意与知觉',
'注意是我们从海量信息中选择性地处理一部分的能力。没有注意，就没有学习。
注意的类型：
- 选择性注意：在噪音中听一个人说话（鸡尾酒会效应）
- 分配性注意：同时做两件事（开车听广播）
- 持续性注意：长时间保持专注（考试/哨兵值班）
注意的局限性：
- 变化盲视：如果不注意，即使场景发生显著变化也察觉不到
- 注意瞬脱：在一个刺激之后短暂的时间内，很难注意到第二个刺激
- 多任务处理的迷思：人脑实际上是在快速切换而非真正并行处理

知觉——我们如何解释感官信息：
知觉不是感觉的被动接收，而是主动构建的过程。
格式塔原则（组织视觉信息的方式）：
- 接近原则：靠近的物体被视为一组
- 相似原则：相似的物体被归为一组
- 连续性原则：倾向于看到连续的线条
- 闭合原则：大脑会自动填补缺口

知觉的两种加工：
- 自底向上：由感觉数据驱动（数据驱动加工）
- 自顶向下：由预期和知识驱动（概念驱动加工）
错觉揭示了知觉的"建构"本质——我们看到的不是世界本身，而是大脑对感觉信息的"最佳猜测"。',
'了解注意的类型与局限，以及知觉的主动构建过程',
'["注意类型: 选择性/分配性/持续性","变化盲视和多任务处理的局限","知觉是主动构建，不是被动接收","格式塔原则: 接近/相似/连续性/闭合","自底向上 vs 自顶向下加工"]',
'intermediate', 12, 2),

(25, 8, '学习理论',
'学习是行为或认知的持久改变，由经验引起。三大经典学习理论分别是：
1. 经典条件反射（巴甫洛夫）
   无条件刺激（食物）→ 无条件反应（流口水）
   中性刺激（铃声）+ 无条件刺激 → 条件反应（听到铃声流口水）
   应用：
   - 恐惧症的形成（小阿尔伯特实验）
   - 广告中的积极联想
   - 味觉厌恶（一次吃坏就再也不吃）
2. 操作性条件反射（斯金纳）
   行为由其结果决定：
   - 正强化：给奖励 → 行为增加
   - 负强化：移除不愉快 → 行为增加
   - 正惩罚：给不愉快 → 行为减少
   - 负惩罚：移除愉快 → 行为减少
   
   强化计划：
   - 连续强化：每次都奖励（学习快但消退也快）
   - 间隔强化：不每次都奖励（学习慢但效果持久）
3. 社会学习理论（班杜拉）
   观察学习：通过观察他人来学习
   - 注意 → 保持 → 再现 → 动机
   
   波波娃娃实验表明：儿童通过观察成人的行为来学习（包括攻击行为）。
现代学习原则：
- 将大任务分解为小步骤
- 即时反馈是关键
- 建立新旧知识的连接
- 动机和情绪显著影响学习效果
- 元认知：了解自己的学习过程，主动调整策略

有效的学习者是那些理解"如何学习"的人，而不仅仅是记住了"学了什么"。',
'掌握三大经典学习理论：经典条件反射、操作性条件反射和社会学习理论',
'["经典条件反射: 巴甫洛夫的狗","操作性条件反射: 强化与惩罚","正强化和间隔强化最有效","社会学习: 通过观察学习","元认知: 了解如何学习比记住内容更重要"]',
'intermediate', 15, 3);

-- =============================================
-- 种子数据: 测验题目
-- =============================================

INSERT IGNORE INTO sekai_learning_quiz_questions (id, lesson_id, question, question_type, options, correct_answer, explanation, sort_order) VALUES
(1, 1, 'Python是由谁创建的？', 'single', '[{"label":"A","text":"Linus Torvalds"},{"label":"B","text":"Guido van Rossum"},{"label":"C","text":"Dennis Ritchie"},{"label":"D","text":"James Gosling"}]', 'B', 'Python由Guido van Rossum于1991年创建', 1),
(2, 1, 'Python是一种什么类型的语言？', 'single', '[{"label":"A","text":"编译型语言"},{"label":"B","text":"解释型语言"},{"label":"C","text":"汇编语言"},{"label":"D","text":"机器语言"}]', 'B', 'Python是解释型语言，代码不需要编译，可以直接运行', 2),
(3, 2, '以下哪个不是Python的基本数据类型？', 'single', '[{"label":"A","text":"int"},{"label":"B","text":"float"},{"label":"C","text":"str"},{"label":"D","text":"array"}]', 'D', 'Python四种基本数据类型是int、float、str、bool', 1),
(4, 2, '以下哪个变量名是合法的？', 'single', '[{"label":"A","text":"2name"},{"label":"B","text":"my-name"},{"label":"C","text":"user_name"},{"label":"D","text":"class"}]', 'C', '变量名只能包含字母数字下划线，不能以数字开头，不能用关键字', 2),
(5, 3, '以下代码输出什么？\\nscore = 75\\nif score >= 90:\\n    print("A")\\nelif score >= 80:\\n    print("B")\\nelif score >= 70:\\n    print("C")\\nelse:\\n    print("D")', 'single', '[{"label":"A","text":"A"},{"label":"B","text":"B"},{"label":"C","text":"C"},{"label":"D","text":"D"}]', 'C', 'score=75满足 score>=70 的条件，输出C', 1),
(6, 3, 'Python中判断相等使用哪个运算符？', 'single', '[{"label":"A","text":"="},{"label":"B","text":"=="},{"label":"C","text":"!="},{"label":"D","text":">="}]', 'B', '=是赋值，==是比较是否相等，!=是不等于', 2),
(7, 4, 'range(5) 生成哪些数字？', 'single', '[{"label":"A","text":"1,2,3,4,5"},{"label":"B","text":"0,1,2,3,4"},{"label":"C","text":"0,1,2,3,4,5"},{"label":"D","text":"1,2,3,4"}]', 'B', 'range(5)生成0到4共5个数字，不包括5', 1),
(8, 4, 'break语句在循环中的作用是什么？', 'single', '[{"label":"A","text":"跳过当前迭代继续下一次"},{"label":"B","text":"立即退出整个循环"},{"label":"C","text":"重新开始循环"},{"label":"D","text":"暂停循环"}]', 'B', 'break立即跳出整个循环，continue跳过当前迭代继续下一次', 2),
(9, 5, 'HTML中最大的标题标签是？', 'single', '[{"label":"A","text":"h6"},{"label":"B","text":"h1"},{"label":"C","text":"title"},{"label":"D","text":"head"}]', 'B', 'h1是最大标题，h6是最小标题', 1),
(10, 5, '<a>标签的哪个属性定义链接地址？', 'single', '[{"label":"A","text":"src"},{"label":"B","text":"link"},{"label":"C","text":"href"},{"label":"D","text":"url"}]', 'C', 'href属性定义超链接的目标地址', 2),
(11, 6, 'CSS的盒模型中，从内到外的顺序是？', 'single', '[{"label":"A","text":"margin-border-padding-content"},{"label":"B","text":"content-padding-border-margin"},{"label":"C","text":"padding-content-margin-border"},{"label":"D","text":"border-margin-content-padding"}]', 'B', '盒模型从内到外：content内容-padding内边距-border边框-margin外边距', 1),
(12, 6, 'CSS类选择器使用什么符号？', 'single', '[{"label":"A","text":"#"},{"label":"B","text":"."},{"label":"C","text":"*"},{"label":"D","text":"@"}]', 'B', '类选择器用"."，ID选择器用"#"，标签选择器直接用标签名', 2),
(13, 7, '现代JavaScript中声明变量的推荐关键字是？', 'single', '[{"label":"A","text":"var"},{"label":"B","text":"let 和 const"},{"label":"C","text":"int"},{"label":"D","text":"define"}]', 'B', '现代推荐使用let(可变)和const(不可变)，避免使用var', 1),
(14, 7, '如何获取id为title的HTML元素？', 'single', '[{"label":"A","text":"document.query(\"title\")"},{"label":"B","text":"document.getElementById(\"title\")"},{"label":"C","text":"document.getElement(\"title\")"},{"label":"D","text":"document.query(\"#title\")"}]', 'B', 'document.getElementById是获取元素的标准方法', 2),
(15, 8, '向量(3,4)的长度是多少？', 'single', '[{"label":"A","text":"7"},{"label":"B","text":"12"},{"label":"C","text":"5"},{"label":"D","text":"25"}]', 'C', '|v|=sqrt(3^2+4^2)=sqrt(9+16)=5', 1),
(16, 8, '(1,2)和(3,4)的点积是？', 'single', '[{"label":"A","text":"(4,6)"},{"label":"B","text":"11"},{"label":"C","text":"(3,8)"},{"label":"D","text":"10"}]', 'B', '点积=1x3+2x4=3+8=11', 2),
(17, 9, '2x3矩阵和3x2矩阵相乘的结果是？', 'single', '[{"label":"A","text":"2x2矩阵"},{"label":"B","text":"3x3矩阵"},{"label":"C","text":"2x3矩阵"},{"label":"D","text":"无法相乘"}]', 'A', '2x3乘以3x2，结果维度是2x2', 1),
(18, 9, '对角线为1其余为0的矩阵叫什么？', 'single', '[{"label":"A","text":"零矩阵"},{"label":"B","text":"逆矩阵"},{"label":"C","text":"转置矩阵"},{"label":"D","text":"单位矩阵"}]', 'D', '单位矩阵I在矩阵乘法中相当于数字1', 2),
(19, 10, '2x2矩阵[[2,1],[3,4]]的行列式是？', 'single', '[{"label":"A","text":"5"},{"label":"B","text":"11"},{"label":"C","text":"8"},{"label":"D","text":"14"}]', 'A', 'ad-bc=2x4-1x3=8-3=5', 1),
(20, 10, '行列式为0说明什么？', 'single', '[{"label":"A","text":"矩阵可逆"},{"label":"B","text":"矩阵不可逆"},{"label":"C","text":"矩阵是单位矩阵"},{"label":"D","text":"矩阵是零矩阵"}]', 'B', 'det(A)=0时矩阵不可逆，称为奇异矩阵', 2),
(21, 11, 'lim(x→0) sin(x)/x 等于？', 'single', '[{"label":"A","text":"0"},{"label":"B","text":"1"},{"label":"C","text":"无穷大"},{"label":"D","text":"不存在"}]', 'B', '这是一个重要的极限公式，结果为1', 1),
(22, 11, '连续函数f(x)在点a连续的条件是？', 'single', '[{"label":"A","text":"f(a)存在"},{"label":"B","text":"极限等于函数值"},{"label":"C","text":"极限存在"},{"label":"D","text":"函数有定义"}]', 'B', '连续函数定义：lim(x->a)f(x)=f(a)，极限存在且等于函数值', 2),
(23, 12, 'x^3的导数是？', 'single', '[{"label":"A","text":"3x"},{"label":"B","text":"x^2"},{"label":"C","text":"3x^2"},{"label":"D","text":"3x^3"}]', 'C', '(x^n)=n·x^(n-1)，所以(x^3)=3x^2', 1),
(24, 12, 'e^x的导数是？', 'single', '[{"label":"A","text":"xe^x"},{"label":"B","text":"e^x"},{"label":"C","text":"1/x"},{"label":"D","text":"ln x"}]', 'B', 'e^x的导数等于它自己，这是e的独特性质', 2),
(25, 13, '∫x^2 dx 等于？', 'single', '[{"label":"A","text":"x^3 + C"},{"label":"B","text":"x^3/3 + C"},{"label":"C","text":"2x + C"},{"label":"D","text":"x^3/2 + C"}]', 'B', '∫x^n dx = x^(n+1)/(n+1) + C，所以∫x^2 dx = x^3/3 + C', 1),
(26, 13, '微分和积分的关系是？', 'single', '[{"label":"A","text":"完全相同"},{"label":"B","text":"互不相干"},{"label":"C","text":"互为逆运算"},{"label":"D","text":"积分是微分的特例"}]', 'C', '微积分基本定理：微分和积分互为逆运算', 2),
(27, 14, '牛顿第二定律的公式是？', 'single', '[{"label":"A","text":"F = mv"},{"label":"B","text":"F = ma"},{"label":"C","text":"F = mg"},{"label":"D","text":"F = ks"}]', 'B', '牛顿第二定律F=ma，力=质量x加速度', 1),
(28, 14, '急刹车时身体前倾体现了哪个定律？', 'single', '[{"label":"A","text":"牛顿第一定律"},{"label":"B","text":"牛顿第二定律"},{"label":"C","text":"牛顿第三定律"},{"label":"D","text":"胡克定律"}]', 'A', '惯性定律：物体保持原有运动状态，身体向前是因惯性', 2),
(29, 15, '以下哪种情况下做功为零？', 'single', '[{"label":"A","text":"推箱子向前移动"},{"label":"B","text":"举着重物站着不动"},{"label":"C","text":"向上举起重物"},{"label":"D","text":"拖着箱子前进"}]', 'B', 'W = F·s，没有位移(s=0)则做功为零', 1),
(30, 15, '物体速度变为2倍，动能变为？', 'single', '[{"label":"A","text":"2倍"},{"label":"B","text":"不变"},{"label":"C","text":"4倍"},{"label":"D","text":"8倍"}]', 'C', 'Ek = 1/2 mv^2，速度翻倍，动能变为4倍', 2),
(31, 16, '以下哪个不是碰撞类型？', 'single', '[{"label":"A","text":"完全弹性碰撞"},{"label":"B","text":"完全非弹性碰撞"},{"label":"C","text":"部分弹性碰撞"},{"label":"D","text":"完全刚性碰撞"}]', 'D', '三种碰撞类型：完全弹性、完全非弹性、非完全弹性', 1),
(32, 16, '安全气囊的原理是？', 'single', '[{"label":"A","text":"减小冲量"},{"label":"B","text":"延长碰撞时间减小力"},{"label":"C","text":"减小动量变化"},{"label":"D","text":"增加摩擦力"}]', 'B', '冲量I=F·Δt固定，Δt增大使F减小，从而减少伤害', 2),
(33, 17, '库仑定律和哪个定律形式最相似？', 'single', '[{"label":"A","text":"胡克定律"},{"label":"B","text":"万有引力定律"},{"label":"C","text":"牛顿第二定律"},{"label":"D","text":"欧姆定律"}]', 'B', '库仑力F=kq1q2/r^2和万有引力F=Gm1m2/r^2都是平方反比律', 1),
(34, 17, '电场线从哪里出发？', 'single', '[{"label":"A","text":"从负电荷出发"},{"label":"B","text":"从正电荷出发"},{"label":"C","text":"从任意电荷出发"},{"label":"D","text":"闭合曲线"}]', 'B', '电场线从正电荷出发，终止于负电荷（或无穷远处）', 2),
(35, 18, '电磁感应定律是谁发现的？', 'single', '[{"label":"A","text":"牛顿"},{"label":"B","text":"奥斯特"},{"label":"C","text":"法拉第"},{"label":"D","text":"麦克斯韦"}]', 'C', '法拉第电磁感应定律：变化的磁场产生电压。奥斯特发现了电流的磁效应', 1),
(36, 18, '以下哪个不属于电磁感应的应用？', 'single', '[{"label":"A","text":"发电机"},{"label":"B","text":"变压器"},{"label":"C","text":"电磁炉"},{"label":"D","text":"电池"}]', 'D', '电池是化学能转化为电能，不依赖电磁感应', 2),
(37, 19, '楔形文字是哪个文明发明的？', 'single', '[{"label":"A","text":"古埃及"},{"label":"B","text":"美索不达米亚"},{"label":"C","text":"古印度"},{"label":"D","text":"古中国"}]', 'B', '苏美尔人在美索不达米亚（两河流域）发明了楔形文字', 1),
(38, 19, '以下哪个不是文明的共同特征？', 'single', '[{"label":"A","text":"城市定居"},{"label":"B","text":"文字出现"},{"label":"C","text":"使用货币"},{"label":"D","text":"大型公共建筑"}]', 'C', '文明的共同特征包括城市、文字、社会分层和公共建筑', 2),
(39, 20, '雅典最著名的政治制度是？', 'single', '[{"label":"A","text":"君主制"},{"label":"B","text":"民主制"},{"label":"C","text":"寡头制"},{"label":"D","text":"共和制"}]', 'B', '雅典是古希腊民主制度的代表，实行公民直接民主', 1),
(40, 20, '罗马文明对后世最主要的影响是？', 'single', '[{"label":"A","text":"哲学思想"},{"label":"B","text":"法律制度"},{"label":"C","text":"戏剧文学"},{"label":"D","text":"奥林匹克"}]', 'B', '罗马法奠定了现代大陆法系的基础', 2),
(41, 21, '文艺复兴的核心精神是？', 'single', '[{"label":"A","text":"神权至上"},{"label":"B","text":"人文主义"},{"label":"C","text":"集体主义"},{"label":"D","text":"禁欲主义"}]', 'B', '文艺复兴核心是人文主义——将关注从神转向人', 1),
(42, 21, '以下哪位不是文艺复兴三杰？', 'single', '[{"label":"A","text":"达·芬奇"},{"label":"B","text":"米开朗基罗"},{"label":"C","text":"毕加索"},{"label":"D","text":"拉斐尔"}]', 'C', '文艺复兴三杰：达·芬奇、米开朗基罗、拉斐尔。毕加索是20世纪艺术家', 2),
(43, 22, '工业革命最先始于哪个国家？', 'single', '[{"label":"A","text":"法国"},{"label":"B","text":"德国"},{"label":"C","text":"英国"},{"label":"D","text":"美国"}]', 'C', '工业革命始于18世纪60年代的英国', 1),
(44, 22, '第二次工业革命的核心能源是？', 'single', '[{"label":"A","text":"煤炭和蒸汽"},{"label":"B","text":"电力和石油"},{"label":"C","text":"核能"},{"label":"D","text":"水力"}]', 'B', '第二次工业革命以电力的广泛应用和石油为特征', 2),
(45, 23, '工作记忆的容量大约是多少？', 'single', '[{"label":"A","text":"3±1个组块"},{"label":"B","text":"7±2个组块"},{"label":"C","text":"15±2个组块"},{"label":"D","text":"无限个组块"}]', 'B', '短期记忆/工作记忆的容量约为7±2个组块', 1),
(46, 23, '以下哪种学习方法最有效？', 'single', '[{"label":"A","text":"反复阅读"},{"label":"B","text":"荧光笔标记"},{"label":"C","text":"主动回忆（合上书回忆）"},{"label":"D","text":"一次性集中学习"}]', 'C', '提取练习效应：主动回忆比被动复习更有效', 2),
(47, 24, '"鸡尾酒会效应"属于哪种注意？', 'single', '[{"label":"A","text":"分配性注意"},{"label":"B","text":"选择性注意"},{"label":"C","text":"持续性注意"},{"label":"D","text":"自动注意"}]', 'B', '鸡尾酒会效应是在噪音中选择性地听一个人说话，属于选择性注意', 1),
(48, 24, '格式塔原则中，大脑自动填补缺口的倾向叫？', 'single', '[{"label":"A","text":"接近原则"},{"label":"B","text":"相似原则"},{"label":"C","text":"闭合原则"},{"label":"D","text":"连续性原则"}]', 'C', '闭合原则：大脑会自动填补图形中的缺口以形成完整的知觉', 2),
(49, 25, '巴甫洛夫的狗流口水实验属于？', 'single', '[{"label":"A","text":"操作性条件反射"},{"label":"B","text":"经典条件反射"},{"label":"C","text":"社会学习"},{"label":"D","text":"观察学习"}]', 'B', '铃声（中性刺激）与食物配对后引起反应，是经典条件反射', 1),
(50, 25, '哪种强化方式效果最持久？', 'single', '[{"label":"A","text":"连续强化"},{"label":"B","text":"间隔强化"},{"label":"C","text":"不强化"},{"label":"D","text":"两者效果相同"}]', 'B', '间隔强化虽然学习较慢，但一旦建立就比连续强化更持久', 2);

-- =============================================
-- 知识库扩充: 新增学科
-- =============================================

INSERT IGNORE INTO sekai_learning_subjects (id, name, description, icon, sort_order) VALUES
(6, '化学', '从原子结构到化学反应，认识物质世界的基本规律', '🧪', 6),
(7, '生物学', '从细胞到生态系统，探索生命的奥秘', '🧬', 7),
(8, '日语', '从五十音到动漫口语，开启日语学习之旅', '🗾', 8),
(9, '经济学', '理解供需与市场，看懂经济世界如何运转', '📈', 9),
(10, '哲学', '追问存在的意义，训练批判性思维', '🦉', 10),
(11, '天文学', '从太阳系到银河系，仰望星空的科学', '🔭', 11),
(12, '文学', '品读经典名著，感受文字的力量', '📚', 12),
(13, '音乐', '从乐理到和声，理解音乐的语言', '🎵', 13),
(14, '地理', '认识地球的圈层与气候，理解我们生存的环境', '🌍', 14),
(15, '英语', '语法、词汇、口语与写作，掌握世界通用语言', '🔤', 15),
(16, '艺术与设计', '美术、设计与审美，培养创造力', '🎨', 16),
(17, '体育与健康', '运动科学、营养与身心调节', '🏋️', 17),
(18, '法学', '法律常识、民刑基础与法治理念', '⚖️', 18),
(19, '政治与国际关系', '政治制度、地缘格局与全球治理', '🌐', 19),
(20, '数据科学', '统计思维、数据可视化与机器学习实践', '📊', 20);

-- =============================================
-- 知识库扩充: 新增课程
-- =============================================

INSERT IGNORE INTO sekai_learning_courses (id, subject_id, name, description, difficulty, estimated_hours, lesson_count, sort_order) VALUES
-- 化学
(9, 6, '化学基础', '原子结构、化学键与化学反应，构建化学知识框架', 'beginner', 3, 3, 1),
-- 生物学
(10, 7, '生命科学入门', '细胞、遗传与进化，理解生命的基本原理', 'beginner', 3, 3, 1),
-- 日语
(11, 8, '日语入门', '从五十音图开始，掌握基础词汇与句型', 'beginner', 4, 3, 1),
(12, 8, '动漫日语口语', '掌握助词与动漫高频口语，轻松看懂生肉', 'intermediate', 3, 2, 2),
-- 经济学
(13, 9, '经济学原理', '供需、价格与市场结构，理解经济运行的逻辑', 'intermediate', 3, 2, 1),
-- 哲学
(14, 10, '哲学导论', '古希腊哲学与东方哲学，开启思辨之旅', 'intermediate', 3, 2, 1),
-- 天文学
(15, 11, '宇宙探索', '从太阳系到恒星演化，探索宇宙的奥秘', 'intermediate', 3, 2, 1),
-- 文学
(16, 12, '文学名著赏析', '中国古典文学与世界名著，感受经典之美', 'intermediate', 3, 2, 1),
-- 音乐
(17, 13, '音乐基础理论', '乐理、节奏与和声，理解音乐的语言', 'beginner', 3, 2, 1),
-- 地理
(18, 14, '自然地理', '地球圈层与气候，认识我们的家园', 'beginner', 3, 2, 1),
-- 计算机科学
(19, 1, '算法与数据结构', '数组、链表、排序与查找，打好编程内功', 'advanced', 5, 3, 3),
(20, 1, '数据库基础', 'SQL与表设计，学会与数据对话', 'intermediate', 3, 2, 4),
(25, 1, '人工智能导论', '机器学习与神经网络，迈入AI时代', 'advanced', 3, 2, 5),
-- 数学
(21, 2, '概率与统计', '概率、随机变量与统计推断，用数据看世界', 'intermediate', 4, 2, 3),
-- 物理学
(22, 3, '热力学与波动', '热力学定律、波动与声学，理解能量的流动', 'intermediate', 3, 2, 3),
(26, 3, '现代物理', '相对论与量子力学，颠覆常识的物理世界', 'advanced', 3, 2, 4),
-- 历史
(23, 4, '两次世界大战', '一战与二战，理解二十世纪的世界格局', 'beginner', 3, 2, 2),
-- 心理学
(24, 5, '发展心理学', '从婴幼儿到青春期，理解人的成长轨迹', 'intermediate', 3, 2, 2);

-- =============================================
-- 知识库扩充: 课程内容 (lessons)
-- =============================================

-- 化学基础 (course_id=9)
INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(26, 9, '原子结构',
'原子是化学变化中的最小微粒，直径约为十亿分之一米（0.1纳米）。要理解化学，必须先认识原子的结构：
1. 原子核——位于原子中心，带正电
   - 质子：带1个单位正电荷，质子数决定了元素种类（原子序数）
   - 中子：不带电，与质子共同决定原子质量
2. 电子——带负电，质量极轻（约为质子的1/1836），在原子核外高速运动
原子核外的电子按照能量高低分层排布，由内向外依次为K、L、M、N……层，每层最多容纳2n²个电子。最外层电子数决定了元素的化学性质——这就是"8电子稳定结构"规则的由来（稀有气体最外层有8个电子，所以性质稳定）。
两个重要概念：
- 原子序数 = 质子数 = 核电荷数
- 质量数 = 质子数 + 中子数
同位素：质子数相同而中子数不同的原子。例如氢有三种同位素：氕（¹H）、氘（²H）、氚（³H）。同位素化学性质几乎相同，但质量不同。
电子云模型：电子在核外的运动不是固定轨道，而是像"云"一样概率分布。泡利不相容原理规定：同一个原子中不可能有两个状态完全相同的电子。
记住：原子很小，但原子核更小——如果把原子比作一座足球场，原子核只有场地中央的一粒沙子那么大。',
'认识原子的构成：质子、中子、电子与电子层排布',
'["原子由原子核和电子构成","质子数决定元素种类","质量数=质子数+中子数","同位素: 质子数相同中子数不同","电子分层排布，最外层电子决定化学性质"]',
'beginner', 12, 1),

(27, 9, '化学键',
'原子之间靠什么力结合在一起？答案是化学键——它是原子间强烈的相互作用力。化学键主要分为三类：
1. 离子键——正负离子间的静电引力
   金属原子容易失去电子变成阳离子，非金属原子容易得到电子变成阴离子。阴阳离子通过静电引力结合。例如NaCl（食盐）：钠失去1个电子变成Na⁺，氯得到1个电子变成Cl⁻，二者相互吸引形成离子晶体。
   离子化合物的特征：熔点高、熔融或溶于水后能导电。
2. 共价键——原子间共用电子对
   两个非金属原子都不愿失去电子，于是共用电子对。例如H₂O中，氧和两个氢各共用一对电子。共价键分为：
   - 极性键：共用电子对偏向电负性大的一方（如H-O键）
   - 非极性键：共用电子对不偏向任何一方（如H-H键、O=O键）
   共价化合物的特征：熔沸点通常较低，多为气体或液体（如水、二氧化碳）。
3. 金属键——金属阳离子与自由电子之间的作用力
   金属原子的外层电子"脱离"原子成为自由电子，在整个金属中流动。这解释了金属为什么导电、导热、有延展性。
电负性：衡量原子吸引电子的能力。电负性差值越大，键的离子性越强；差值越小，键的共价性越强。
判断口诀：活泼金属 + 活泼非金属 → 离子键；非金属 + 非金属 → 共价键。',
'掌握离子键、共价键和金属键的本质与判断方法',
'["化学键是原子间的强烈相互作用","离子键: 阴阳离子静电引力","共价键: 共用电子对","金属键: 自由电子气模型","电负性差值决定键的类型"]',
'beginner', 12, 2),

(28, 9, '化学反应与方程式',
'化学反应的本质：分子分裂成原子，原子重新组合成新的分子。整个过程中原子种类和数目不变——这就是质量守恒定律：参加反应的各物质质量总和等于反应生成的各物质质量总和。
化学方程式的意义：
- 表示反应物、生成物和反应条件
- 表示各物质的计量关系（系数比）
- 系数之比 = 物质的量之比
四大基本反应类型：
1. 化合反应：A + B → AB（多变一），如 C + O₂ → CO₂
2. 分解反应：AB → A + B（一变多），如 2H₂O₂ → 2H₂O + O₂↑
3. 置换反应：A + BC → AC + B，如 Zn + 2HCl → ZnCl₂ + H₂↑
4. 复分解反应：AB + CD → AD + CB，如 HCl + NaOH → NaCl + H₂O
配平技巧：用"最小公倍数法"或"奇数配偶法"，先配平最复杂物质，再配平单质。
氧化还原反应：物质得失电子的反应。
- 氧化剂：得到电子，被还原
- 还原剂：失去电子，被氧化
- 口诀："升失氧化还原剂，降得还原氧化剂"（化合价升高、失电子、被氧化、作还原剂）
催化剂：能改变化学反应速率，但自身质量和化学性质在反应前后不变。
化学反应伴随现象：放热/吸热、发光、变色、产生气体、生成沉淀。',
'掌握化学反应四大类型、质量守恒与氧化还原反应',
'["化学反应本质: 原子重新组合","质量守恒定律","四大反应类型: 化合/分解/置换/复分解","氧化还原: 得失电子","催化剂不改变化学性质"]',
'beginner', 15, 3),

-- 生命科学入门 (course_id=10)
(29, 10, '细胞的结构',
'细胞是生物体结构和功能的基本单位。1665年，罗伯特·胡克用显微镜观察软木塞时首次发现了细胞。
细胞分为两大类：
1. 原核细胞（无细胞核）：细菌、蓝藻等。遗传物质集中在拟核区域。
2. 真核细胞（有细胞核）：动物、植物、真菌的细胞。
真核细胞的基本结构：
- 细胞膜：磷脂双分子层，具有选择透过性，控制物质进出，是细胞的"边防检查站"
- 细胞质：细胞膜以内、细胞核以外的部分，含有多种细胞器
- 细胞核：储存遗传信息，是细胞的控制中心
主要细胞器及其功能：
- 线粒体：有氧呼吸的主要场所，细胞的"动力工厂"，为生命活动提供能量
- 叶绿体（仅植物）：光合作用场所，细胞的"养料制造车间"
- 核糖体：蛋白质合成的场所，遍布细胞质（有的附着在内质网上）
- 内质网：蛋白质加工和脂质合成，有粗面（附核糖体）和滑面之分
- 高尔基体：蛋白质的加工、分类和包装，"物流中心"
- 溶酶体：细胞内的"消化车间"，分解衰老细胞器和外来物质
- 液泡（植物）：储存水分和色素
- 中心体（动物和低等植物）：参与细胞分裂
植物细胞与动物细胞的区别：植物细胞有细胞壁（主要成分纤维素）、叶绿体和大液泡，动物细胞没有。
细胞是生命的微观宇宙——一个成年人体内约有37万亿个细胞。',
'认识真核细胞的三大结构和主要细胞器的功能',
'["细胞是生命的基本单位","原核vs真核: 有无细胞核","线粒体是动力工厂","叶绿体进行光合作用","植物细胞特有: 细胞壁/叶绿体/液泡"]',
'beginner', 12, 1),

(30, 10, '遗传与DNA',
'为什么孩子长得像父母？答案藏在DNA里。DNA（脱氧核糖核酸）是绝大多数生物的遗传物质。
DNA的结构（沃森和克里克，1953年）：
- 双螺旋结构：两条脱氧核苷酸链盘旋而成
- 基本单位：脱氧核苷酸（磷酸 + 脱氧核糖 + 碱基）
- 四种碱基：A腺嘌呤、T胸腺嘧啶、G鸟嘌呤、C胞嘧啶
- 碱基配对原则：A-T配对，G-C配对（两条链互补）
基因：DNA上具有遗传效应的片段，是控制性状的基本单位。人类约有2万多个基因，分布在23对染色体上。
遗传信息的流动（中心法则）：
DNA →（转录）→ mRNA →（翻译）→ 蛋白质
- 转录：以DNA一条链为模板合成mRNA
- 翻译：核糖体读取mRNA上的三个碱基（密码子），合成氨基酸链
孟德尔遗传定律（豌豆实验）：
1. 分离定律：一对等位基因在形成配子时分离，各自进入不同的配子
2. 自由组合定律：位于不同染色体上的非等位基因自由组合
显性性状与隐性性状：显性基因（大写）只要有就表现，隐性基因（小写）必须成对才表现。例如高茎（T）对矮茎（t）为显性，Tt表现为高茎。
遗传病：由基因突变引起，如镰刀型细胞贫血症、色盲（X染色体隐性遗传，男性患者更多）。
现代应用：基因测序、基因治疗、CRISPR基因编辑、亲子鉴定（STR位点比对）。',
'理解DNA双螺旋结构、中心法则与孟德尔遗传定律',
'["DNA双螺旋: A-T, G-C配对","基因是遗传的功能单位","中心法则: DNA→RNA→蛋白质","孟德尔分离定律与自由组合","显隐性基因的表达规律"]',
'beginner', 15, 2),

(31, 10, '进化论',
'1859年，达尔文出版《物种起源》，提出了震惊世界的进化论：生物是由共同的祖先经过漫长岁月演化而来的，自然选择是进化的主要机制。
自然选择的核心思想：
1. 过度繁殖：生物都有很强的繁殖能力，后代数量远超环境承载力
2. 生存斗争：有限的食物和空间导致个体间竞争
3. 遗传变异：个体间存在可遗传的差异（变异的原材料）
4. 适者生存：有利变异的个体更易存活并繁殖，把有利基因传递给后代
实例：桦尺蛾的颜色变化——工业革命时期，树皮被煤烟熏黑，深色蛾因不易被鸟发现而数量大增，浅色蛾锐减。这是自然选择的经典案例。
进化的证据：
- 化石记录：从简单到复杂、从水生到陆生的过渡类型（如始祖鸟）
- 比较解剖学：不同脊椎动物的前肢结构同源（鲸的鳍、蝙蝠的翅膀、人的手臂）
- 分子生物学：DNA序列差异度反映亲缘关系远近
现代综合进化论要点：
- 种群是进化的基本单位
- 进化的实质：种群基因频率的改变
- 突变和基因重组为进化提供原材料
- 自然选择决定进化的方向
- 隔离（地理隔离、生殖隔离）是新物种形成的必要条件
误区澄清：进化不是"从低级到高级"的直线，而是适应环境的分支过程；个体不能进化，进化发生在种群层面；"用进废退"（拉马克）不是自然选择。',
'理解自然选择机制与现代综合进化论',
'["自然选择: 过度繁殖/生存斗争/遗传变异/适者生存","进化实质是种群基因频率改变","桦尺蛾是经典案例","隔离导致新物种形成","进化单位是种群而非个体"]',
'intermediate', 15, 3),

-- 日语入门 (course_id=11)
(32, 11, '平假名',
'日语文字由假名、汉字和罗马字组成。假名分为平假名和片假名，平假名由汉字草书演变而来，用于书写日语固有词汇和语法助词。
五十音图：日语的基础语音系统，共46个基本假名（实际行与段）。
先记5个元音（最重要！）：
- あ a：口型大张，像"啊"
- い i：嘴角向两边咧开，像微笑
- う u：嘴唇微圆，不突出，发音短而轻
- え e：介于"诶"和"哎"之间
- お o：嘴唇圆拢，像"哦"
行与段：五十音按"行"（辅音相同）和"段"（元音相同）排列。例如か行：かka きki くku けke こko；さ行：さsa しshi すsu せse そso。
浊音与半浊音：
- 浊音（加两点"）：がga ざza だda ばba 等
- 半浊音（加圆圈"゜"）：ぱpa ぴpi ぷpu ぺpe ぽpo
拗音：い段假名 + 小写的ゃゅょ，读作一个音节。如きゃkya、しゃsha、じゅju。
长音与促音：
- 长音：拉长一拍（あ段+あ、い段+い、え段+え/い、お段+お/う）
- 促音：小写的っ，停顿一拍（如 きって 切手）
记忆方法：用谐音编故事、每天写一遍五十音表、用假名给动漫台词注音。记住：平假名是日语的地基，熟练程度直接影响听说读写。',
'掌握平假名五十音图：元音、清音、浊音、拗音与长促音',
'["五个元音: あいうえお","五十音按行和段排列","浊音加两点，半浊音加圆圈","拗音: い段+小ゃゅょ","长音拉一拍，促音停一拍"]',
'beginner', 15, 1),

(33, 11, '片假名',
'片假名由汉字的偏旁部首简化而来，形状方正、棱角分明。它和平假名读音一一对应，但用途完全不同。
片假名主要用于：
1. 外来语（来自英语等外语的词）
   コーヒー（咖啡，coffee）、コンピューター（电脑，computer）、アニメ（动画，animation）
2. 拟声拟态词
   ワンワン（汪汪）、キラキラ（闪闪发光）、ドキドキ（心跳加速）
3. 强调、强调固有词汇或外国人名地名
   日本人的名字在正式场合常用汉字，外国人名地名必须用片假名
常见外来语规律：
- 英语的"er"常变成长音：player → プレイヤー
- 英语的"tion"常变成"ション"：animation → アニメーション
- 小写的ぁぃぅぇぉ、ァィゥェォ表示特殊发音：ファ(fa)、ティ(ti)、チェ(che)
容易混淆的片假名：
- シ（shi）和 ツ（tsu）：シ上面两点竖排，ツ下面两点横排（"眯眼笑"与"横排眼"）
- ソ（so）和 ン（n）：ソ的起笔在上，ン的起笔在下
- ク（ku）和 ケ（ke）：ケ更像汉字"个"
记忆技巧：和五十音图对照着记；看日剧/动漫时留意字幕里的外来语；用片假名拼写自己的名字。
アニメ好きなら、片仮名を覚えるのは必須です！（喜欢动漫的话，学片假名是必须的！）',
'掌握片假名的写法、用途与外来语规律',
'["片假名用于外来语/拟声词/强调","外来语多来自英语","注意区分シツソン等形近假名","小写假名构成特殊发音","アニメ就是animation的外来语"]',
'beginner', 15, 2),

(34, 11, '基础句型与自我介绍',
'学会五十音后，就可以开始造句子了。日语的基本语序是"主-宾-谓"，动词放在句末——这和中文的"主-谓-宾"不同。
核心句型：
1. 判断句：AはBです（A是B）
   わたしは学生です。（我是学生。）
2. 否定句：AはBではありません（A不是B）
   わたしは日本人ではありません。（我不是日本人。）
3. 疑问句：句末加"か"
   あなたは学生ですか？（你是学生吗？）
4. 动词句：主语 + 宾语 + 动词
   朝ご飯を食べます。（吃早饭。）
5. 存在句：場所に物があります/人がいます
   机の上に本があります。（桌子上有书。）
自我介绍模板（必背！）：
はじめまして。（初次见面。）
わたしは〇〇と申します。（我叫〇〇。）
〇〇大学の学生です。（我是〇〇大学的学生。）
趣味はアニメと音楽です。（爱好是动漫和音乐。）
どうぞよろしくお願いします。（请多关照。）
常用疑问词：
- 何（なに）：什么
- 誰（だれ）：谁
- どこ：哪里
- いつ：什么时候
- どうして：为什么
数字入门：いち(1)、に(2)、さん(3)、よん/し(4)、ご(5)、ろく(6)、なな/しち(7)、はち(8)、きゅう(9)、じゅう(10)。
小提示："です"在口语中常弱读为"desu"的"su"几乎不发音，听起来像"des"。',
'掌握日语判断句、疑问句和自我介绍表达',
'["日语语序: 主-宾-谓","AはBです/ではありません/ですか","自我介绍模板必背","常用疑问词: 何/誰/どこ/いつ","数字1-10: いちにさんよんご…"]',
'beginner', 15, 3),

-- 动漫日语口语 (course_id=12)
(35, 12, '常见助词用法',
'助词是日语语法的"胶水"，贴在名词后面表示它和句子其他成分的关系。掌握了核心助词，看动漫就能听懂七八成。
1. は（wa）：提示主题
   私はアニメが好きです。（我，喜欢动漫。）——"は"把"我"设为话题
2. が（ga）：提示主语 / 强调
   猫がいます。（有猫。）——表示存在的主体
   对比：私がやります！（我来做！）——强调"是我"
3. を（o）：提示宾语（动作对象）
   本を読みます。（读书。）ラーメンを食べます。（吃拉面。）
4. に（ni）：表示时间/地点/方向/对象
   学校に行きます。（去学校。）9時に起きます。（9点起床。）
5. で（de）：表示动作发生的场所 / 手段
   教室で勉強します。（在教室学习。）電車で行きます。（坐电车去。）
6. と（to）：和……一起 / 引语
   友達と遊びます。（和朋友玩。）
7. の（no）：的（所有/所属）
   私の本。（我的书。）日本の文化。（日本的文化。）
8. も（mo）：也
   私も行きます。（我也去。）
9. から（kara）/ まで（made）：从……到……
   朝から夜まで働きます。（从早工作到晚。）
10. へ（e）：方向（和に类似）
   東京へ行きます。（去东京。）
记忆技巧：把助词和动词搭配成"套餐"来记，比如「を食べる」「に乗る」「で遊ぶ」。
听动漫时留意：助词经常被省略（口语中），尤其是を、は。例如「ご飯食べた？」=「ご飯を食べた？」。',
'掌握はがをにでと等核心助词的用法',
'["は提示主题，が提示主语","を表示动作对象","に表示时间/方向，で表示场所/手段","と表示一起，も表示也","口语中助词常省略"]',
'intermediate', 15, 1),

(36, 12, '动漫常用口语',
'想在追番时秒懂台词？这些动漫高频口语一定要熟记：
日常问候：
- おはよう（ございます）：早上好
- こんにちは：你好（白天）
- こんばんは：晚上好
- おやすみ（なさい）：晚安
- ありがとう（ございます）：谢谢
- ごめんなさい / ごめんね：对不起
- さようなら / じゃあね：再见
感叹词（动漫灵魂！）：
- すごい！：好厉害！
- かっこいい！：好帅！
- かわいい！：好可爱！
- やばい！：糟糕！/ 好厉害！（根据语境）
- うわあ / まじで？：哇 / 真的假的？
- なるほど：原来如此
- ええっ！：诶？！（惊讶）
战斗与热血场景：
- 負けない！：不会输的！
- 守ってみせる！：我会守护给你看！
- お前はもう死んでいる：你已经死了（名场面）
- 俺が最強だ！：我最强！
安慰与鼓励：
- 大丈夫だよ：没关系哦
- 頑張って！：加油！
- 諦めないで：不要放弃
- 信じてる：我相信你
请求与命令：
- ちょっと待って：等一下
- 手伝ってくれ：帮帮我
- 静かにして：安静点
- 見て見て！：快看快看！
礼貌收尾（万能）：よろしくお願いします——拜托了/请多关照。
学习建议：看番时开日文字幕，遇到高频词按暂停、跟读三遍；用角色名造例句加深记忆。',
'掌握动漫中最高频的问候、感叹与热血台词',
'["日常问候: おはよう/こんにちは/おやすみ","感叹词: すごい/かっこいい/やばい","热血台词: 負けない/守ってみせる","鼓励: 頑張って/大丈夫","よろしくお願いします是万能收尾"]',
'intermediate', 15, 2),

-- 经济学原理 (course_id=13)
(37, 13, '供需与价格',
'经济学研究的起点是稀缺性：资源有限，欲望无限。因此社会必须回答三个问题：生产什么？如何生产？为谁生产？
需求（Demand）：
- 需求定律：在其他条件不变时，价格上升，需求量减少；价格下降，需求量增加（需求曲线向右下方倾斜）
- 需求量的变动 vs 需求的变动：前者沿曲线移动（价格引起），后者曲线整体平移（收入、偏好、替代品价格等引起）
供给（Supply）：
- 供给定律：价格上升，供给量增加（供给曲线向右上方倾斜）
- 影响供给的因素：生产成本、技术水平、预期、税收补贴
均衡价格：
- 需求曲线与供给曲线的交点决定了均衡价格和均衡数量
- 价格高于均衡价 → 供过于求 → 价格下跌
- 价格低于均衡价 → 供不应求 → 价格上涨
- 市场像一只"看不见的手"（亚当·斯密）自动调节
弹性（Elasticity）：
- 需求价格弹性 = 需求量变动百分比 / 价格变动百分比
- 弹性大（|E|>1）：奢侈品、有替代品的商品（价格变动影响大）
- 弹性小（|E|<1）：必需品（盐、大米），提价收入反而可能增加
现实案例：演唱会门票被炒高、蔬菜暴雨后涨价、"双十一"降价促销——都是供需规律在起作用。',
'理解需求定律、供给定律与均衡价格的形成',
'["需求定律: 价升量减","供给定律: 价升量增","均衡价是供需相等的价格","看不见的手: 市场自动调节","弹性决定价格变动的影响"]',
'intermediate', 15, 1),

(38, 13, '市场结构',
'市场结构决定了企业的定价权。按竞争程度从强到弱，市场分为四种类型：
1. 完全竞争：无数小厂商 + 同质产品 + 自由进出 + 完全信息
   - 价格由市场决定，单个厂商是"价格接受者"，没有定价权
   - 现实中接近的例子：农产品市场、股票市场（近似）
2. 垄断竞争：许多厂商 + 差异化产品 + 自由进出
   - 厂商有少量定价权，靠品牌、广告、设计差异化竞争
   - 例子：奶茶店、服装品牌、餐饮连锁
3. 寡头垄断：少数几家大厂商控制市场
   - 相互依存：一家降价，其他必须回应（价格战）
   - 博弈论：囚徒困境解释了为什么寡头容易合谋抬价又互相背叛
   - 例子：通信运营商、航空业、石油行业
4. 完全垄断：只有一家厂商，无近似替代品
   - 进入壁垒极高（专利、政府特许、自然垄断如供水电网）
   - 垄断者通过限产抬价获取超额利润，损害消费者福利
   现实例子：Windows操作系统（曾接近垄断）、地方自来水公司
政府的对策：
- 反垄断法（如拆分标准石油、对微软的审查）
- 价格管制（公用事业定价）
- 引入竞争（放开市场准入）
思考题：为什么很多游戏公司宁可免费也要抢用户？——因为网络效应和用户粘性会带来垄断地位。',
'掌握四种市场结构及其定价权特征',
'["完全竞争: 价格接受者","垄断竞争: 产品差异化","寡头: 少数大厂博弈","完全垄断: 独家定价","反垄断法保护消费者"]',
'intermediate', 15, 2),

-- 哲学导论 (course_id=14)
(39, 14, '古希腊哲学',
'哲学（Philosophia）一词源自希腊语，意为"爱智慧"。古希腊哲学是西方哲学乃至西方科学的源头。
早期自然哲学（米利都学派）：
- 泰勒斯：第一个提出"世界本原"的哲学家，认为万物本原是水。他还成功预言了日食
- 阿那克西曼德：提出"无定"（apeiron）为本原
- 赫拉克利特："万物皆流"，认为火是本原，"人不能两次踏进同一条河流"
- 德谟克利特：原子论——万物由不可分割的原子组成（2000多年后被科学证实！）
智者派与苏格拉底：
- 智者派教授辩论术，"人是万物的尺度"（普罗泰戈拉）
- 苏格拉底：不做"自然研究"，转向"认识你自己"；用"苏格拉底诘问法"（产婆术）通过不断提问引导对方思考；最后因"腐蚀青年"被雅典判处死刑，从容饮鸩而亡
柏拉图：
- 理念论：现实世界是理念世界的"影子"，我们看到的桌子只是"桌子的理念"的摹本
- 洞穴比喻：囚徒在洞穴中只能看到火光投下的影子，哲学家的使命是走出洞穴看到真实
- 政治理想：《理想国》中哲学家王
亚里士多德（百科全书式学者）：
- 告别老师的理念论：实体论——个别事物才是第一实体，形式赋予质料以意义
- 逻辑学：创立三段论（所有人都会死；苏格拉底是人；所以苏格拉底会死）
- 伦理学：中道学说——德性是两极端之间的黄金中道（勇敢是怯懦与鲁莽的中点）
- "吾爱吾师，吾更爱真理"
古希腊哲学奠定了西方追问"本原、真理、德性"的基本范式，至今仍在塑造我们的思维方式。',
'认识从泰勒斯到亚里士多德的古希腊哲学脉络',
'["哲学=爱智慧","泰勒斯: 水是万物本原","苏格拉底: 认识你自己","柏拉图: 理念论与洞穴比喻","亚里士多德: 实体论与三段论"]',
'intermediate', 15, 1),

(40, 14, '东方哲学思想',
'与西方哲学"向外求知"不同，东方哲学更关注"如何安顿生命"。儒、道、佛共同塑造了东亚人的精神世界。
儒家（孔子、孟子、荀子）：
- 核心概念：仁（爱人）、义、礼、智、信
- "己所不欲，勿施于人"——儒家的金规则
- 中庸：不偏不倚、恰到好处
- 修身齐家治国平天下：由内而外的修养路径
- 孟子的性善论："人之初，性本善"，恻隐之心人皆有之
- 荀子性恶论：强调后天教化（"化性起伪"）
道家（老子、庄子）：
- 道：宇宙万物的本源和法则，"道生一，一生二，二生三，三生万物"
- 无为：不妄为，顺应自然规律，"无为而无不为"
- 老子《道德经》：辩证思维，"祸兮福之所倚，福兮祸之所伏"
- 庄子：齐物论——万物齐一，不必执着于是非；逍遥游——精神的绝对自由
- "道法自然""上善若水"
佛家（佛教，传入中国后与本土文化融合）：
- 四圣谛：苦、集、灭、道
- 缘起性空：诸法因缘而生，本性是空
- 禅宗六祖慧能："菩提本无树，明镜亦非台，本来无一物，何处惹尘埃"
- 禅宗的"明心见性"深刻影响了宋明理学（王阳明心学："知行合一""致良知"）
东方哲学的三个共性：重实践轻思辨、重整体轻分析、重体悟轻论证。它们不是书斋里的学问，而是"活出来的智慧"。',
'理解儒家、道家和佛家的核心思想',
'["儒家: 仁与中庸","道家: 道法自然与无为","佛家: 四圣谛与缘起性空","己所不欲勿施于人","王阳明: 知行合一"]',
'intermediate', 15, 2),

-- 宇宙探索 (course_id=15)
(41, 15, '太阳系',
'太阳系位于银河系的猎户座旋臂上，直径约120亿公里。它以太阳为中心，包含八大行星、矮行星（冥王星）、小行星带、彗星和无数小天体。
太阳：
- 占太阳系总质量的99.86%，是太阳系的绝对中心
- 核心温度约1500万℃，通过氢核聚变（氢→氦）释放能量
- 太阳活动：黑子、耀斑、日冕物质抛射，会引发地球极光和通信干扰
八大行星（由近及远）：
1. 水星：离太阳最近，温差极大（白天427℃，夜晚-173℃），几乎没有大气
2. 金星：最亮的行星，表面温度约465℃（失控温室效应），自转方向与其他行星相反（太阳西升东落）
3. 地球：唯一已知存在生命的行星，70%被水覆盖，有大气和磁场保护
4. 火星：红色星球（氧化铁），有太阳系最高的火山奥林帕斯山（高约21公里），科学家正在寻找火星生命痕迹
5. 木星：最大的行星（能装下1300个地球），著名的大红斑是持续几百年的风暴
6. 土星：以壮观的光环闻名（由冰和岩石颗粒组成），密度比水还小（理论上能浮在水上）
7. 天王星：躺着公转（自转轴倾斜98°），呈现淡蓝色（甲烷）
8. 海王星：最远的行星，风速可达2100km/h，太阳系最狂暴的风
其他成员：
- 小行星带：位于火星和木星之间，由无数岩石块组成
- 柯伊伯带：海王星轨道外，冥王星、妊神星等矮行星的家
- 奥尔特云：包裹太阳系的彗星仓库，哈雷彗星就来自那里
思考：为什么冥王星2006年被降级为矮行星？——因为它没能"清空轨道周围的邻居"。',
'认识太阳及八大行星的主要特征',
'["太阳占太阳系99.86%质量","八大行星由近及远排序","木星最大，土星有光环","金星逆向自转且最热","冥王星因未清空轨道被降级"]',
'intermediate', 15, 1),

(42, 15, '恒星与星系',
'夜空中的每一颗星星，都是一个太阳。恒星是自身能发光发热的巨大等离子体球。
恒星的诞生与演化：
- 诞生：巨大的分子云在引力作用下坍缩，核心温度和压力升高，点燃氢聚变 → 恒星诞生
- 主序星阶段：恒星一生中90%的时间稳定燃烧氢。质量越大，寿命越短（大质量恒星几百万年，太阳约100亿年）
- 晚年演化（取决于质量）：
  * 小质量（如太阳）→ 红巨星 → 行星状星云 → 白矮星（体积如地球，密度极高，一茶匙重达数吨）
  * 大质量 → 红超巨星 → 超新星爆发（亮度可超过整个星系！）→ 中子星（脉冲星）或黑洞
- 黑洞：引力强到连光都无法逃逸的天体。2019年人类拍到了第一张黑洞照片（M87*）
我们的银河系：
- 直径约10万光年，包含2000-4000亿颗恒星
- 中心是超大质量黑洞"人马座A*"，银盘是旋涡状，太阳位于距离中心约2.6万光年的猎户座旋臂
- 银河系正以每秒约600公里的速度运动，并将在约40亿年后与仙女座星系碰撞合并
星系分类（哈勃分类）：
- 旋涡星系（银河系）、椭圆星系、不规则星系
宇宙尺度：
- 1光年 = 94607亿公里（光走一年的距离）
- 可观测宇宙直径约930亿光年，包含约2万亿个星系
一句话总结：我们身上的碳、铁等重元素，都来自远古超新星爆发——我们是星尘之子。',
'理解恒星的一生、黑洞与星系的尺度',
'["恒星靠氢聚变发光","太阳将走: 红巨星→白矮星","大质量恒星结局: 中子星或黑洞","银河系有2000亿+恒星","重元素来自超新星爆发"]',
'intermediate', 15, 2),

-- 文学名著赏析 (course_id=16)
(43, 16, '中国古典文学',
'中国古典文学从《诗经》到明清小说，绵延三千年，是世界文学宝库中最璀璨的篇章之一。
先秦：
- 《诗经》：中国第一部诗歌总集，收录西周至春秋诗歌305篇，分风、雅、颂，"关关雎鸠，在河之洲"
- 《楚辞》：屈原开创的浪漫主义诗体，《离骚》"路漫漫其修远兮，吾将上下而求索"
- 诸子散文：《论语》《孟子》《庄子》《韩非子》——思想与文学的双重高峰
汉魏六朝：
- 《史记》（司马迁）："史家之绝唱，无韵之离骚"，第一部纪传体通史
- 汉乐府《孔雀东南飞》、古诗十九首
- 建安七子与曹操、曹植；陶渊明"采菊东篱下，悠然见南山"
唐诗（中国诗歌的黄金时代）：
- 李白（诗仙）：浪漫飘逸，"天生我材必有用，千金散尽还复来"
- 杜甫（诗圣）：沉郁顿挫，"安得广厦千万间，大庇天下寒士俱欢颜"
- 白居易：通俗平实，《长恨歌》《琵琶行》
- 边塞诗：王维、孟浩然（山水田园）、高适、岑参（边塞）
宋词：
- 豪放派：苏轼"大江东去，浪淘尽"，辛弃疾"醉里挑灯看剑"
- 婉约派：柳永、李清照"知否知否，应是绿肥红瘦"
元曲与明清小说：
- 元曲四大家：关汉卿《窦娥冤》、马致远《天净沙·秋思》
- 四大名著：《三国演义》（罗贯中）《水浒传》（施耐庵）《西游记》（吴承恩）《红楼梦》（曹雪芹）
- 《红楼梦》：中国古典小说的巅峰，一部封建社会的百科全书
阅读建议：先读选篇和译本注释，再背名句——"腹有诗书气自华"。',
'梳理从诗经到四大名著的中国文学脉络',
'["诗经是第一部诗歌总集","史记: 史家之绝唱","唐诗: 李白的豪放与杜甫的沉郁","宋词分豪放与婉约","红楼梦是古典小说巅峰"]',
'intermediate', 15, 1),

(44, 16, '世界文学名著',
'世界文学名著是人类共同的精神遗产。它们跨越语言与国界，讲述着关于人性和命运的故事。
古希腊与中世纪：
- 荷马史诗《伊利亚特》《奥德赛》：西方文学的源头
- 但丁《神曲》：从地狱到天堂的灵魂之旅，中世纪文学的巅峰
文艺复兴：
- 莎士比亚：英国最伟大的剧作家。四大悲剧《哈姆雷特》《奥赛罗》《李尔王》《麦克白》
  "生存还是毁灭，这是一个问题。"（《哈姆雷特》）
- 塞万提斯《堂吉诃德》：西班牙文学之巅，骑士理想的悲喜剧，现代小说的先驱
19世纪现实主义：
- 巴尔扎克《人间喜剧》：法国社会的"百科全书"，《欧也妮·葛朗台》
- 托尔斯泰《战争与和平》《安娜·卡列尼娜》：俄国文学的高峰，"幸福的家庭都是相似的，不幸的家庭各有各的不幸"
- 陀思妥耶夫斯基《罪与罚》《卡拉马佐夫兄弟》：对人性的极致拷问
- 雨果《巴黎圣母院》《悲惨世界》：人道主义的光辉
- 狄更斯《双城记》："这是最好的时代，也是最坏的时代"
20世纪现代主义：
- 卡夫卡《变形记》：人被异化为甲虫的荒诞寓言
- 加缪《局外人》：存在主义与荒诞哲学
- 马尔克斯《百年孤独》：魔幻现实主义代表作，"多年以后，面对行刑队……"
- 乔治·奥威尔《1984》：反乌托邦经典，"老大哥在看着你"
阅读的意义：名著之所以成为名著，是因为它们在回答"人该如何活着"这个问题上，比我们多思考了几百年。',
'认识从荷马史诗到魔幻现实主义的经典作品',
'["荷马史诗是西方文学源头","莎士比亚四大悲剧","托尔斯泰: 俄国文学高峰","卡夫卡: 人被异化的寓言","百年孤独: 魔幻现实主义"]',
'intermediate', 15, 2),

-- 音乐基础理论 (course_id=17)
(45, 17, '乐理入门',
'乐理是音乐的语言，掌握了它，你就能看懂谱子、听懂音乐的结构。
音的基本属性：
- 音高：声音的高低，由振动频率决定（频率越高音越高）
- 音长：声音持续的时间
- 音量：声音的强弱，由振幅决定
- 音色：由发声体的材质和泛音决定（吉他和钢琴弹同一个音，听感不同）
音名与唱名：
- 音名：C D E F G A B（对应钢琴白键）
- 唱名：do re mi fa sol la si
- 标准音：A4 = 440Hz（调音基准）
音阶（自然大调）：
全音-全音-半音-全音-全音-全音-半音
C大调音阶：C-D-E-F-G-A-B-C（E-F和B-C之间是半音）
音符与时值：
- 全音符（4拍）→ 二分音符（2拍）→ 四分音符（1拍）→ 八分音符（1/2拍）→ 十六分音符（1/4拍）
- 附点音符：时值延长一半
节拍：
- 拍号：4/4拍（每小节4拍，以四分音符为一拍）、3/4拍（圆舞曲）、6/8拍
- 小节线与终止线划分乐句
五线谱与简谱：
- 五线谱：从下往上五条线，高音谱号（G谱号）确定G音位置；"下加一线do，上加一线高音do"（C调）
- 简谱：用数字1234567表示音阶，0表示休止
- 升降号：#（升半音）、b（降半音）、还原号♮
节奏感训练：数拍子（1-2-3-4）、打拍子（手或脚）、跟唱儿歌分辨强弱拍（强-弱-次强-弱）。
VOCALOID小知识：初音未来的歌声是语音合成（调声），但旋律和编曲依然要遵循乐理——想调出好听的歌，乐理是基础。',
'掌握音名、音阶、时值与节拍等乐理基础',
'["音高由频率决定","音名CDEFGAB对应唱名do re mi…","大调音阶: 全全半全全全半","全音符=4拍，四分音符=1拍","标准音A4=440Hz"]',
'beginner', 15, 1),

(46, 17, '和声与旋律',
'单旋律好听，但加上和声（和弦）才能真正打动人心。流行音乐、动漫OST的编曲核心就是和声进行。
和弦（Chord）：三个或三个以上音按三度关系叠置。
- 三和弦：根音-三音-五音
  * 大三和弦：大三度+小三度（明亮、稳定），如C-E-G
  * 小三和弦：小三度+大三度（柔和、忧伤），如A-C-E
  * 减三和弦、增三和弦（紧张、悬疑）
- 七和弦：三和弦+七音（如属七和弦G7，流行音乐标配）
和弦级数（大调中）：I ii iii IV V vi vii°
- I级（主和弦）：最稳定，音乐"回家"的感觉
- IV级（下属和弦）：展开
- V级（属和弦）：强烈倾向回到I（"解决"）
- 经典进行：I-V-vi-IV（无数流行歌都用它！）、ii-V-I（爵士）、卡农进行I-V-vi-III-IV-I-IV-V
旋律（Melody）：
- 旋律 = 音高变化 + 节奏 + 结构（乐句/乐段）
- 旋律进行方式：级进（相邻音）、跳进（三度以上）、同音反复
- 好的旋律特点：有"动机"（能记住的小片段）、有高潮（最高音常出现在黄金分割点附近）
调式与调性：
- 大调：明亮欢快；小调：暗淡忧伤
- 转调：中途换调（动漫插曲常用）
配器常识（动漫音乐）：
- 弦乐：铺底与情绪烘托
- 钢琴：抒情主奏
- 电吉他/架子鼓：热血战斗曲
- 人声吟唱：插入"神曲"高潮（如《unravel》《打上花火》）
练习建议：用钢琴/键盘弹奏C大调三和弦C-F-G-C，感受"解决"；听歌时试着辨认伴奏里的和弦进行。',
'理解三和弦结构与经典和声进行',
'["三和弦: 根音三音五音","大三和弦明亮，小三和弦忧伤","I-IV-V是最基础进行","I-V-vi-IV是流行歌万能进行","旋律=音高+节奏+结构"]',
'intermediate', 15, 2),

-- 自然地理 (course_id=18)
(47, 18, '地球圈层',
'地球半径约6371公里，像一个巨大的"洋葱"，由内到外分为多个圈层。
地球内部圈层（地震波探测）：
1. 地壳：最外层，平均厚度17公里（大陆厚、海洋薄）。主要成分：氧、硅、铝
2. 地幔：厚约2900公里，占地球体积的84%。上部有软流层（岩浆的发源地，板块在它上面漂移）
3. 地核：半径约3500公里，外核为液态（产生地球磁场！），内核为固态铁镍，温度高达5500℃
地球外部圈层：
- 大气圈：最外层的气体圈，分为对流层、平流层（臭氧层在这里）、中间层、热层、散逸层
- 水圈：海洋、河流、湖泊、地下水、冰川。海洋占地球表面的71%
- 生物圈：生命存在的圈层，渗透于大气圈底部、水圈和岩石圈上部
- 岩石圈：地壳+上地幔顶部（软流层以上），是板块构造的舞台
板块构造学说：
- 地球岩石圈分为六大板块：亚欧板块、太平洋板块、印度洋板块、非洲板块、美洲板块、南极洲板块
- 板块边界类型：张裂（生长边界，形成裂谷、海洋，如东非大裂谷）和挤压（消亡边界，形成山脉、岛弧、海沟，如喜马拉雅山、日本海沟）
- 地震和火山主要分布在板块边界（环太平洋地震带、地中海-喜马拉雅地震带）
相关现象：喜马拉雅山是印度板块与亚欧板块碰撞的产物，至今仍在升高！用GPS测量，珠穆朗玛峰每年约上升4毫米。',
'认识地球内部与外部圈层及板块构造',
'["地球内部: 地壳-地幔-地核","软流层是岩浆发源地","六大板块决定地震火山分布","喜马拉雅山是板块碰撞产物","地球磁场来自液态外核"]',
'beginner', 12, 1),

(48, 18, '气候与大气',
'气候是长时间（通常30年）的平均天气状况，它决定了我们穿什么衣服、种什么庄稼、住在哪里。
大气分层（自下而上）：
- 对流层（0-12km）：天气现象（云雨雪）都发生在这里，气温随高度降低
- 平流层（12-50km）：臭氧层吸收紫外线，气温随高度升高，是民航客机巡航层
- 中间层、热层（电离层反射无线电）、散逸层
大气受热过程：
太阳短波辐射 → 地面吸收增温 → 地面长波辐射 → 大气吸收 → 大气逆辐射（保温）
温室效应：CO₂、甲烷等温室气体增多，大气逆辐射增强，全球气温上升
主要气候类型：
- 热带雨林气候：全年高温多雨（赤道附近，亚马逊、刚果盆地）
- 热带沙漠气候：全年高温干燥（撒哈拉，副热带高压控制）
- 地中海气候：夏季炎热干燥，冬季温和多雨（地中海沿岸，"夏季抗旱"）
- 温带季风气候：夏季高温多雨，冬季寒冷干燥（中国北方，"雨热同期"利于农业）
- 温带海洋性气候：全年温和湿润（西欧）
- 亚热带季风气候（中国南方）
中国的气候特征：季风气候显著（冬冷夏热、雨热同期）、气候类型多样、大陆性较强
重要概念：
- 季风：海陆热力性质差异引起的大范围风向季节性变化（冬季西北风、夏季东南风）
- 厄尔尼诺：赤道中东太平洋海温异常增暖，影响全球气候
- 全球变暖对策：碳中和（减排+植树+碳捕集）
气象谚语科学版："朝霞不出门，晚霞行千里"——早晨云层发展，午后易降雨。',
'理解大气分层、气候类型与温室效应',
'["对流层是天气剧场","CO2增强温室效应","六大气候类型特征","中国季风气候显著","厄尔尼诺影响全球"]',
'beginner', 15, 2),

-- 算法与数据结构 (course_id=19)
(49, 19, '数组与链表',
'数据结构是计算机存储、组织数据的方式。数组和链表是两种最基础、最常用的线性数据结构。
数组（Array）：
- 特点：内存中连续存储，每个元素大小相同
- 随机访问：通过下标直接定位，时间复杂度O(1)——数组最大的优势
- 插入/删除：需要移动大量元素，平均O(n)——数组最大的劣势
- 适用场景：频繁读取、固定大小、缓存友好
- 例子：排行榜（按名次直接取）、像素数组、邻接矩阵
链表（Linked List）：
- 特点：节点（数据+指针）分散存储，用指针连接
- 单链表：每个节点只有next指针，只能从头遍历
- 双链表：prev+next，可双向遍历（Java的LinkedList）
- 插入/删除：已知节点位置时只需改指针，O(1)
- 随机访问：必须从头遍历，O(n)——链表的劣势
- 适用场景：频繁插入删除、长度不确定、内存碎片化场景
时间复杂度速记：
- O(1)：常数时间（数组下标访问）
- O(n)：线性时间（遍历链表）
- O(log n)：对数时间（二分查找）
对比总结：
- 数组"读快写慢"，链表"写快读慢"
- 数组省内存（无指针开销），链表每节点多一个指针
- 实际工程中常"组合拳"：哈希表+链表（如LRU缓存）、数组+链表（HashMap的拉链法）！
练习：用Java实现单链表的反转（经典面试题）。',
'掌握数组与链表的特性、复杂度与适用场景',
'["数组连续存储，随机访问O(1)","链表节点用指针连接","数组插入删除O(n)","链表已知位置插入O(1)","HashMap用数组+链表实现"]',
'advanced', 15, 1),

(50, 19, '排序算法',
'排序是计算机科学最经典的问题。优秀的排序算法是很多系统（数据库、搜索引擎）性能的基石。
三大O(n²)基础排序：
1. 冒泡排序：相邻元素两两比较，大数"冒泡"到末尾。n个元素需要n-1轮
2. 选择排序：每轮从未排序区选出最小值放到已排序区末尾。无论数据如何都做满n²/2次比较
3. 插入排序：像打扑克牌，把新元素插入到已排好序列的正确位置。对近乎有序的数据极快（O(n)）！
三大高效排序：
4. 快速排序（快排）：
   - 分治思想：选一个"基准"，把小于它的放左边、大于它的放右边，递归处理
   - 平均O(n log n)，最坏O(n²)（数据已有序且基准选得差）
   - 实际工程最常用（C语言qsort、Java的DualPivotQuicksort）
5. 归并排序：
   - 分治：把数组对半拆分到最小，再两两合并（合并时比较大小）
   - 稳定、严格O(n log n)，但需要额外O(n)空间
   - 适合外部排序（数据太大装不进内存，如磁盘归并）
6. 堆排序：利用二叉堆（最大堆/最小堆），O(n log n)，原地排序
复杂度总结（n个元素）：
- 冒泡/选择/插入：O(n²)
- 快排/归并/堆排：O(n log n)
- 计数/基数排序（特殊场景）：O(n+k)
稳定性：值相等的元素排序后相对顺序不变 → 稳定（冒泡、插入、归并）；不稳定（选择、快排、堆排）
选择建议：
- 数据量小或近乎有序：插入排序
- 一般场景：快排
- 要求稳定：归并
- 不要求稳定且内存受限：堆排
趣味知识：Java的Arrays.sort()对基本类型用双轴快排，对对象用TimSort（合并了插入排序的归并变体）。',
'掌握六大排序算法思想与复杂度',
'["冒泡/选择/插入: O(n²)","快排: 分治+基准，平均O(n log n)","归并: 稳定但需额外空间","堆排: O(n log n)原地","插入排序对近有序数据最快"]',
'advanced', 15, 2),

(51, 19, '二分查找与递归',
'二分查找（Binary Search）是面试和工程中最高频的查找算法，没有之一。
二分查找：
- 前提：数组必须有序
- 思路：每次与中间元素比较，大于则去右半，小于则去左半，每次排除一半
- 时间复杂度：O(log n)！100万个数最多只需20次比较（2^20 ≈ 100万）
- 空间复杂度：迭代版O(1)，递归版O(log n)（栈空间）
经典模板（迭代）：
int left = 0, right = n - 1;
while (left <= right) {
    int mid = left + (right - left) / 2;  // 防溢出！
    if (nums[mid] == target) return mid;
    else if (nums[mid] < target) left = mid + 1;
    else right = mid - 1;
}
return -1;
细节陷阱：
- mid 计算用 left + (right-left)/2 防止 left+right 溢出
- 边界条件 left <= right vs left < right 要仔细
- 找"第一个/最后一个等于target"要用变体
递归（Recursion）：
- 本质：函数调用自己，把大问题拆成同类小问题
- 三要素：1) 终止条件（base case）2) 递归调用（缩小问题规模）3) 处理当前层逻辑
经典递归：
- 阶乘：f(n) = n * f(n-1)，f(0)=1
- 斐波那契：f(n) = f(n-1)+f(n-2)，f(0)=0,f(1)=1（注意指数级重复计算，用记忆化或迭代优化）
- 二叉树遍历、快速排序、归并排序都是递归的经典应用
递归 vs 迭代：
- 递归代码简洁、符合直觉，但栈深度有限（Java默认栈深约1万层），过深会StackOverflow
- 迭代性能更好、无栈溢出风险
记忆要点：递归是"把问题交给更小的自己"，二分是"每次都砍掉一半"。',
'掌握二分查找模板与递归三要素',
'["二分前提: 有序数组","二分查找O(log n)","mid防溢出: left+(right-left)/2","递归三要素: 终止条件/递推/当前层","递归过深会栈溢出"]',
'advanced', 15, 3),

-- 数据库基础 (course_id=20)
(52, 20, 'SQL入门',
'SQL（结构化查询语言）是与数据库对话的通用语言。无论MySQL、PostgreSQL还是SQLite，核心语法一致。
四大类语句：
- DDL（定义）：CREATE、ALTER、DROP（建表、改表、删表）
- DML（操作）：SELECT、INSERT、UPDATE、DELETE（增删改查）
- DCL（控制）：GRANT、REVOKE（权限）
- TCL（事务）：COMMIT、ROLLBACK
最核心的查询语法：
SELECT 列名 FROM 表名 WHERE 条件 ORDER BY 列名 LIMIT 数量;
示例：
-- 查询所有用户
SELECT * FROM sekai_learning_users;
-- 按用户名精确查找
SELECT * FROM sekai_learning_users WHERE username = ''miku'';
-- 按经验值降序取前10
SELECT * FROM sekai_learning_users ORDER BY exp_points DESC LIMIT 10;
WHERE 常用条件：
- 比较：=, !=, >, <, >=, <=
- 逻辑：AND, OR, NOT
- 模糊：LIKE ''miku%''（%匹配任意字符，_匹配单个字符）
- 范围：BETWEEN 100 AND 500, IN (1,2,3)
- 空值：IS NULL, IS NOT NULL
聚合函数：
- COUNT(*)：行数   SUM(col)：求和
- AVG(col)：平均   MAX/MIN：最大/最小
- GROUP BY 分组 + HAVING 过滤分组
SELECT level, COUNT(*) FROM users GROUP BY level HAVING COUNT(*) > 5;
JOIN 连接：
- INNER JOIN：两表都匹配的行
- LEFT JOIN：左表全部 + 右表匹配部分（没有则NULL）
- RIGHT JOIN、FULL JOIN
SELECT u.username, p.title FROM users u JOIN papers p ON u.id = p.user_id;
UPDATE 与 DELETE 的警告：永远先写WHERE！UPDATE users SET coins = 0; 会把所有人的金币清零。开发规范：UPDATE/DELETE 前先用SELECT确认影响行数。
运行环境建议：用Navicat或MySQL Workbench边练边学，本项目的SQL文件就是最好的练习素材。',
'掌握SELECT查询、WHERE过滤与JOIN连接',
'["SQL四大类: DDL/DML/DCL/TCL","查询骨架: SELECT-FROM-WHERE-ORDER BY-LIMIT","LIKE模糊查询用%和_","聚合函数配GROUP BY/HAVING","JOIN连接多表数据"]',
'intermediate', 15, 1),

(53, 20, '数据库表设计',
'好的表结构是系统性能与可维护性的地基。设计原则一句话：先想清楚"实体"和"实体之间的关系"，再建表。
设计流程：
1. 需求分析：列出所有实体（用户、课程、订单……）和属性
2. 概念设计：画ER图，确定实体关系（一对一/一对多/多对多）
3. 逻辑设计：转成表结构，应用范式
4. 物理设计：选类型、建索引、定编码
三大范式（减少冗余、保证一致性）：
- 第一范式（1NF）：每列不可再分（原子性）。例如"地址"列拆成省/市/区
- 第二范式（2NF）：满足1NF + 非主键列完全依赖主键（消除部分依赖）
- 第三范式（3NF）：满足2NF + 非主键列之间无传递依赖
- 反范式化：查询极频繁时，故意冗余一列（如"点赞数"），以空间换性能
主键与外键：
- 主键（PRIMARY KEY）：唯一标识一行，NOT NULL + UNIQUE。推荐自增BIGINT（如本项目的id）或UUID
- 外键（FOREIGN KEY）：引用其他表的主键，保证引用完整性（如 papers.user_id → users.id）
- 注意：高频大表谨慎使用外键（影响写入性能），可用应用层保证
一对多 vs 多对多：
- 一对多：在"多"的一方加外键（一篇论文有多个场景 → scenes.paper_id）
- 多对多：建中间表（用户-课程收藏 → 表里放user_id + course_id两个外键）
字段类型选择：
- 整数：TINYINT/INT/BIGINT
- 小数：DECIMAL（钱！不要用FLOAT）
- 字符串：VARCHAR(长度) / TEXT（长文本）
- 时间：DATETIME（含时区用TIMESTAMP）
索引：
- 原理：类似书目录（B+树），加速查询
- 适用：WHERE、JOIN、ORDER BY 频繁使用的列
- 代价：占用空间、减慢写入
- 本项目例子：uk_user_date (user_id, task_date) 唯一索引防止重复打卡
实战检验：看本项目的 init.sql，你能说出每张表的设计意图吗？',
'掌握范式理论、主外键与索引设计',
'["1NF原子性/2NF消除部分依赖/3NF消除传递依赖","主键: 唯一非空","外键保证引用完整性","多对多用中间表","索引加速查询但拖慢写入"]',
'intermediate', 15, 2),

-- 概率与统计 (course_id=21)
(54, 21, '概率基础',
'概率论研究"不确定性"。抛硬币、抽卡、天气预测——概率无处不在（抽卡游戏就是概率论的实战！）。
基本概念：
- 随机试验：结果不止一个且无法预知（掷骰子）
- 样本空间：所有可能结果的集合
- 事件：样本空间的子集（掷出偶数点）
- 概率：事件发生的可能性，范围[0,1]
古典概型：P(A) = 有利结果数 / 总结果数
- 掷一枚公平骰子，掷出3的概率 = 1/6
- 抽卡出SSR概率5%，即每20抽平均出1个（但"保底"改变了分布）
概率运算法则：
- 加法法则：P(A∪B) = P(A) + P(B) - P(A∩B)（互斥时 P(A∩B)=0）
- 乘法法则：P(A∩B) = P(A) × P(B|A)（独立事件时 P(A∩B) = P(A)×P(B)）
独立事件：一个事件发生不影响另一个。连续两次掷硬币都正面 = 1/2 × 1/2 = 1/4
条件概率：P(B|A) = 在A发生条件下B发生的概率
贝叶斯定理：
P(A|B) = P(B|A) × P(A) / P(B)
应用：垃圾邮件过滤、医学检验、AI推荐系统都用它。
随机变量与期望：
- 随机变量：把随机试验结果映射为数值
- 期望E(X) = Σ x·P(x)：长期平均结果
  * 掷骰子的期望 = (1+2+3+4+5+6)/6 = 3.5
  * 抽卡期望：如果SSR概率5%，期望抽数 = 1/0.05 = 20抽
大数定律：试验次数足够多时，频率趋近概率（赌场长期稳赚的数学原理）。
直觉陷阱："赌徒谬误"——连续10次出"小"，第11次出"大"的概率依然是50%（如果公平）。独立事件没有记忆！',
'掌握概率、条件概率、贝叶斯定理与期望',
'["概率范围[0,1]","古典概型: 有利/总数","独立事件概率相乘","贝叶斯: 由果推因","期望是长期平均","赌徒谬误: 独立事件无记忆"]',
'intermediate', 15, 1),

(55, 21, '统计与分布',
'统计学帮助我们从数据中提取信息。数据科学、机器学习的基础就是统计。
数据的描述：
- 集中趋势：均值（易受极端值影响）、中位数（稳健）、众数
  * 举例：公司平均工资被老板年薪拉高，用中位数更真实
- 离散程度：极差、方差、标准差（衡量数据波动）
  * 方差 Var = Σ(x-μ)² / n，标准差是其平方根
- 百分位数：第50百分位数=中位数
常用分布：
1. 正态分布（高斯分布，最重要的分布！）：
   - 钟形曲线，对称于均值μ，标准差σ决定胖瘦
   - 68-95-99.7法则：μ±σ包含68%数据，μ±2σ包含95%，μ±3σ包含99.7%
   - 实例：身高、考试成绩、测量误差都近似正态
2. 二项分布：n次独立试验，成功k次的概率
   - 例：连掷10次硬币，恰好6次正面
3. 泊松分布：单位时间/空间内事件发生的次数（商店每小时客流量、服务器请求数）
中心极限定理（统计学的"镇宅之宝"）：
样本均值无论来自什么分布，当样本量足够大（n≥30）时都近似服从正态分布。这就是为什么正态分布无处不在。
抽样与推断：
- 总体 vs 样本：用样本估计总体（民意调查）
- 置信区间：有95%把握认为真实值落在区间内
- 显著性检验：p值 < 0.05 认为结果显著（注意：p值不等于效应大小）
相关与回归：
- 相关系数r：范围[-1,1]，|r|接近1相关性强
- 相关 ≠ 因果！（冰淇淋销量与溺水人数正相关，真正原因是夏天）
- 线性回归：y = ax + b，用最小二乘法拟合
实用建议：做数据分析先画图（直方图、箱线图），再算统计量，最后建模。',
'掌握正态分布、中心极限定理与基本统计量',
'["均值易受极端值影响，中位数稳健","正态分布: 68-95-99.7法则","中心极限定理: 大样本均值正态","置信区间与p值","相关不等于因果"]',
'intermediate', 15, 2),

-- 热力学与波动 (course_id=22)
(56, 22, '热力学定律',
'热力学研究热与功的转化，是蒸汽机、内燃机、冰箱和宇宙演化背后的物理。
基本概念：
- 温度：分子平均动能的量度（开尔文K，绝对零度-273.15℃）
- 热量：由于温差传递的能量
- 内能：分子动能与势能的总和
- 热平衡：两物体温度相同、无净热传递
热力学四大定律：
第零定律：如果A与B热平衡、B与C热平衡，则A与C也热平衡。——"温度"概念成立的基础
第一定律（能量守恒）：ΔU = Q + W
系统内能变化 = 吸收热量 + 外界做功
- 气球被压缩（W>0）温度升高（打气筒变热！）
- 气体膨胀对外做功，内能降低（喷出喷雾罐变凉）
- 结论：能量不能凭空产生或消灭，只可转化或转移
第二定律（熵增原理）：热量不能自发地从低温物体传到高温物体
- 熵（S）：系统的混乱度/不可利用能量
- 孤立系统的熵永不减少：ΔS ≥ 0
- 为什么牛奶不会自动"凝回"原状？为什么时间有方向？——熵增！
- 开尔文表述：不可能从单一热源吸热全部转化为功（效率100%的永动机不存在）
第三定律：绝对零度不可达到（只能无限逼近）
热机与效率：
- 卡诺效率 η = 1 - T冷/T热，永远小于100%
- 汽车发动机效率约25-40%，电厂约40-50%
应用与思考：
- 冰箱：靠外界做功把热从低温搬到高温，不违反第二定律
- 温室效应：大气阻止热辐射散失
- 宇宙的终极命运：热寂——熵达到最大，一切趋于均匀
一句话总结：能量守恒管"多少"，熵增管"方向"。',
'掌握热力学三大定律与熵的概念',
'["第一定律: ΔU=Q+W能量守恒","第二定律: 热量不能自发低温传高温","熵增: 孤立系统ΔS≥0","永动机不可能","卡诺效率永远小于100%"]',
'intermediate', 15, 1),

(57, 22, '波动与声学',
'波动是能量传递的一种形式，水波、声波、地震波、光都是波。
波的分类：
- 横波：质点振动方向垂直于传播方向（绳波、电磁波、光波）
- 纵波：质点振动方向平行于传播方向（声波、地震P波）
- 声波是纵波！所以声音在固体中传播最快（固体>液体>气体）
描述波的物理量：
- 波长λ：一个完整波的长度
- 频率f：每秒振动次数（Hz），声波的频率决定音调（高音=高频率）
- 波速v = λ × f（波速由介质决定，频率由振源决定）
声学常识：
- 空气中声速约340m/s（0℃），温度升高声速加快
- 人能听到20Hz~20000Hz；低于20Hz为次声波（地震、鲸鱼交流），高于20000Hz为超声波（B超、倒车雷达、清洗）
- 音调：频率决定；响度：振幅决定；音色：波形/泛音决定（区分不同乐器和人声）
波的叠加与干涉：
- 叠加原理：两波相遇，位移相加
- 干涉：频率相同、相位差恒定的两列波，形成加强区与减弱区（双缝干涉、降噪耳机原理）
- 驻波：两列相向传播的同频波叠加成"静止"波形（吉他弦振动）
多普勒效应：波源与观察者相对运动时，观察到的频率改变
- 声源靠近 → 音调变高（救护车驶近"呜~~"变尖）
- 声源远离 → 音调变低
- 应用：测速雷达、B超血流测速、天文学测恒星远离速度（红移）
共鸣与共振：
- 共鸣：固有频率相同的物体相互传递振动（歌唱家震碎酒杯！）
- 共振：驱动力频率接近固有频率时振幅剧增（荡秋千、桥共振坍塌案例）
- 应用：乐器共鸣箱、微波炉加热、超声波碎结石
趣味：小提琴的声音为什么比吉他"亮"？——泛音成分不同，这就是音色。',
'掌握波的分类、声学知识与多普勒效应',
'["声波是纵波","波速=波长×频率","人能听到20Hz-2万Hz","多普勒效应: 靠近音调变高","共振: 频率匹配振幅剧增"]',
'intermediate', 15, 2),

-- 两次世界大战 (course_id=23)
(58, 23, '第一次世界大战',
'第一次世界大战（1914-1918）被称为"结束一切战争的战争"，但它实际上为更大规模的战争埋下了伏笔。
背景：
- 帝国主义矛盾：英德海军竞赛、殖民地争夺
- 两大军事集团形成：三国同盟（德、奥匈、意大利）vs 三国协约（英、法、俄）
- 民族主义情绪高涨，巴尔干被称为"欧洲的火药桶"
导火索：1914年6月28日，奥匈帝国皇储斐迪南大公在萨拉热窝被塞尔维亚青年普林西普刺杀，一战爆发。
战争进程：
- 1914年：马恩河战役粉碎德国"速决战"（施里芬计划）幻想
- 1915-1916年：堑壕战泥潭，凡尔登战役（"绞肉机"，死伤超70万）、索姆河战役（一天阵亡6万英军，首次使用坦克）
- 1917年：俄国爆发二月革命和十月革命，退出一战；美国参战打破平衡
- 1918年：德国十一月革命，11月11日停战
新式武器：机枪、毒气（伊普尔战役）、坦克、飞机、潜艇（无限制潜艇战）、燃烧弹
后果：
- 约1000万人死亡、2000万人受伤，欧洲一片废墟
- 四大帝国崩溃：德意志、奥匈、奥斯曼、沙俄
- 巴黎和会与《凡尔赛条约》：德国承担全部战争罪责，赔款1320亿金马克，割地、裁军
- 战后成立国际联盟（美国未加入，形同虚设）
深刻教训：《凡尔赛条约》的"以战败国为代价"埋下复仇种子，德国人民普遍感到屈辱——20年后，希特勒正是利用这份屈辱上台。一战止于战争，却开启了二战。',
'了解一战的背景、进程与凡尔赛条约',
'["两大同盟: 三国同盟vs三国协约","导火索: 萨拉热窝事件","凡尔登是绞肉机","凡尔赛条约惩罚德国","一战止于战争却开启二战"]',
'beginner', 15, 1),

(59, 23, '第二次世界大战',
'第二次世界大战（1939-1945）是人类历史上规模最大的战争，波及全球80多个国家和地区，约7000万人丧生。
背景：
- 1929年经济大危机，各国转嫁危机
- 德国纳粹上台（希特勒1933），撕毁凡尔赛条约，扩军备战
- 日本军国主义扩张（1931九一八，1937全面侵华）；意大利法西斯（1935入侵埃塞俄比亚）
- 绥靖政策：英法对德让步（慕尼黑协定，1938年牺牲捷克斯洛伐克）——"对野兽让步只会引来更大的胃口"
战争进程：
- 1939年9月1日：德国闪击波兰，二战爆发（"闪电战"：坦克+飞机协同）
- 1940年：法国沦陷；不列颠空战（英国坚持抵抗，"从未有这么多人对这么少人欠下这么多情"）
- 1941年6月：德国入侵苏联（巴巴罗萨计划）；12月7日日本偷袭珍珠港，美国参战
- 1942-1943年：转折点——斯大林格勒保卫战（苏德战场转折）、中途岛海战（太平洋转折）、北非阿拉曼战役
- 1944年6月：诺曼底登陆（D-Day），开辟第二战场
- 1945年：5月8日德国投降；8月美国在广岛、长崎投下原子弹；9月2日日本投降
暴行与教训：纳粹屠杀600万犹太人（奥斯维辛）、南京大屠杀、日军731部队细菌战
战后世界：
- 雅尔塔体系确立美苏两极格局
- 1945年10月联合国成立（中英美苏法为常任理事国），"让后世免遭战祸"
- 纽伦堡审判与东京审判：战犯受审
- 民族独立浪潮：印度、东南亚等殖民地纷纷独立
启示：和平不是理所当然的，它建立在强大的共识与制度之上。',
'了解二战的背景、转折点与战后秩序',
'["二战起点: 1939闪击波兰","珍珠港事件后美国参战","转折点: 斯大林格勒与中途岛","1945: 原子弹终结战争","联合国成立于1945年"]',
'beginner', 15, 2),

-- 发展心理学 (course_id=24)
(60, 24, '婴幼儿发展',
'发展心理学研究人从出生到衰老的全程变化。0-2岁是大脑发育最迅猛的时期——婴儿每秒产生超过100万个新突触！
身体与动作发展：
- 发展顺序（头尾原则、近远原则）：抬头 → 翻身 → 坐 → 爬 → 站 → 走
- "爬"很重要：爬行训练协调性和空间感知（不提倡跳过低谷）
认知发展：皮亚杰的认知发展阶段论
第一阶段：感知运动期（0-2岁）
- 通过感觉和动作认识世界（抓、咬、看、听）
- 重要里程碑：客体永久性（约8-12个月）——即使玩具被藏起来，也知道它依然存在！这是"我"与"世界"分离认知的开端
- 延迟模仿：过一会儿还能模仿看到的行为
语言发展里程碑：
- 0-3个月：哭、咕咕声
- 6个月：牙牙学语（baba、mama），全球婴儿相同
- 1岁：第一个词（多为"妈妈""爸爸"）
- 1.5-2岁：词汇爆发期（两词句："妈妈抱"）
- 3岁：基本语法（电报式语言）
依恋理论（鲍尔比、安斯沃思）：
- 依恋是婴儿与主要照顾者形成的情感纽带，影响一生的人际模式
- 安斯沃思"陌生情境"实验分出四种依恋类型：
  * 安全型依恋（约65%）：妈妈离开会不安，回来能安抚——最健康
  * 回避型：妈妈离开回来都漠不关心
  * 矛盾型/焦虑型：紧紧黏着，妈妈离开大哭，回来却生气
  * 混乱型（最不健康，多与忽视虐待相关）
关键期与敏感期：
- 语言敏感期：1-3岁是第二语言习得的最佳窗口
- 视觉发育关键期：出生后头几年
养育建议：
- 及时回应（回应式喂养/安抚）
- 多说话多互动（"话多"的父母，孩子词汇量大）
- 安全依恋 = 稳定的爱与回应，而不是溺爱
给游戏化学习的启示：把这个阶段看作"系统的初始化"——打好硬件，装好基础软件。',
'了解婴幼儿动作、认知、语言发展与依恋理论',
'["感知运动期: 靠感觉动作认识世界","客体永久性是重要里程碑","牙牙学语: 约6个月","安全型依恋最健康","语言敏感期: 1-3岁"]',
'intermediate', 15, 1),

(61, 24, '青少年期',
'青春期（约10-19岁）是人一生中变化最剧烈、最矛盾的阶段。身体在长，大脑在重构，身份在寻找。
身体变化：
- 生长突增：身高体重快速增长（女孩10-14岁，男孩12-16岁）
- 第二性征发育：性激素分泌（雌激素/睾酮）驱动
- 大脑发育：前额叶皮层（负责理性决策）要到25岁左右才成熟——这就是"明知故犯"的生理原因！
- 多巴胺系统敏感：青少年对奖励（游戏、社交）的反应比成人更强烈，对风险的评估却更弱
认知发展：皮亚杰的"形式运算阶段"（11岁后）
- 抽象思维：能处理假设和理论（"如果……会怎样"）
- 理想主义：批判现实，追求完美（"愤青"式的理想主义）
- 元认知：开始反思自己的思考过程
埃里克森的社会心理发展理论：
青少年期的主要危机：同一性 vs 角色混乱
- 自我同一性：回答"我是谁？我想成为什么样的人？"
- 四种状态：
  * 同一性达成：经过探索后坚定选择
  * 延期偿付：还在探索中（大学阶段常见）
  * 早闭：未经探索就接受父母安排
  * 同一性扩散：既不探索也不承诺（迷茫躺平）
社会性发展：
- 同伴影响超过父母（同伴是镜子）
- 对亲密关系与恋爱的探索
- 逆反心理：争夺自主权（"我要自己做主"），本质是成长需求
常见心理挑战：学业压力、网络成瘾、容貌焦虑、抑郁情绪（全球青少年抑郁检出率持续上升）
给学习者的话：
- 情绪不是敌人：愤怒、焦虑都是信号，学会命名情绪
- 多巴胺管理：游戏/短视频即时奖励 vs 学习的延迟奖励——训练"延迟满足"就是训练前额叶
- 找到"我是谁"：通过尝试不同兴趣、参加社团、阅读来探索自我
你的青春期不是问题，而是系统在升级。',
'理解青少年期的生理、认知与社会性发展',
'["前额叶25岁才成熟","形式运算: 抽象思维能力","同一性vs角色混乱是核心课题","同伴影响超过父母","训练延迟满足=训练前额叶"]',
'intermediate', 15, 2),

-- 人工智能导论 (course_id=25)
(62, 25, '机器学习基础',
'机器学习是让计算机从数据中自动学习规律，而不是被显式编程。今天AI的爆火（ChatGPT、Midjourney）都建立在机器学习之上。
核心范式：
- 传统编程：人写规则 → 计算机执行
- 机器学习：数据 + 答案 → 计算机学出规则
三大学习类型：
1. 监督学习：数据带标签（答案）
   - 分类：邮件是垃圾邮件吗？（离散输出）
   - 回归：预测房价、气温（连续输出）
   - 代表算法：线性回归、逻辑回归、KNN、决策树、随机森林、SVM
2. 无监督学习：数据无标签，找结构
   - 聚类：用户分群（K-Means）
   - 降维：PCA（压缩特征）
3. 强化学习：智能体与环境互动，靠奖励学习
   - 围棋AlphaGo、自动驾驶、游戏AI
关键概念：
- 训练集/验证集/测试集：训练集学参数，测试集验证泛化能力（绝不看测试集调参！）
- 特征工程：特征的质量决定模型上限（"垃圾进，垃圾出"）
- 过拟合：在训练集上100分，测试集不及格——模型背答案而不是学规律
  应对：更多数据、正则化、交叉验证、简化模型
- 欠拟合：训练集都学不好，模型太简单
- 评估指标：准确率（Accuracy）、精确率、召回率、F1、AUC
工作流程（以预测房价为例）：
1. 收集数据（面积、地段、房龄） 2. 清洗数据 3. 划分训练/测试 4. 选模型 5. 训练 6. 评估调优 7. 部署上线
经典名言：模型不是被"写"出来的，而是被"训"出来的——训练AI就像训练宠物，需要好的数据（食物）和评估（奖励）。',
'理解机器学习类型、过拟合与完整流程',
'["监督/无监督/强化三大类型","分类输出离散，回归输出连续","过拟合=背答案不学规律","数据质量决定模型上限","训练/验证/测试集必须分离"]',
'advanced', 15, 1),

(63, 25, '神经网络与深度学习',
'深度学习 = 深层的神经网络。它是当前AI（图像识别、语音、大语言模型）的技术核心。
从神经元到网络：
- 人工神经元：输入 × 权重 → 求和 → 激活函数 → 输出
- 感知机：单层神经元，只能解决线性可分问题（如AND逻辑）
- 多层感知机（MLP）：输入层 + 隐藏层 + 输出层，可以逼近任意函数（万能逼近定理）
激活函数（引入非线性，否则多少层都等价于一层）：
- Sigmoid：0~1输出（早期常用）
- ReLU：max(0, x)（现在最常用，解决梯度消失）
- Softmax：多分类输出概率
训练的核心：反向传播（Backpropagation）
1. 前向传播：计算输出
2. 损失函数：衡量预测与真实的差距（MSE、交叉熵）
3. 反向传播：用链式法则求梯度，从后往前更新权重
4. 梯度下降：w = w - 学习率 × 梯度（找损失函数的最低点）
- 学习率太大：震荡不收敛；太小：训练极慢
常见网络结构：
- CNN（卷积神经网络）：卷积核提取局部特征，用于图像识别（人脸识别、自动驾驶）
- RNN/LSTM：处理序列数据（语音、翻译）
- Transformer：注意力机制（Attention），"看所有位置并加权"，是大语言模型的基石
大语言模型（LLM）：
- GPT：预训练（海量文本预测下一个词）+ 微调 + RLHF（人类反馈强化学习）
- 参数量：GPT-3有1750亿参数，训练一次耗电数百万度
- 涌现能力：参数规模突破后，出现推理、编程、对话等能力
局限与风险：
- 幻觉：一本正经地胡说八道
- 偏见：训练数据里的歧视会被放大
- 成本：推理（生成）也需要大量算力
给学习者的路径：Python基础 → 线性代数/概率 → PyTorch实战 → 卷积/Transformer → 项目（用本项目的数据集练手：让AI根据学习记录预测你的学习进度！）。',
'理解神经网络结构、反向传播与LLM原理',
'["神经元=加权求和+激活","激活函数引入非线性","反向传播+梯度下降训练","CNN用于图像，Transformer用于语言","LLM靠预测下一个词预训练"]',
'advanced', 15, 2),

-- 现代物理 (course_id=26)
(64, 26, '狭义与广义相对论',
'1905年，26岁的爱因斯坦发表狭义相对论，颠覆了牛顿的绝对时空观；1915年又提出广义相对论，把引力解释为时空的弯曲。
为什么需要相对论？
- 麦克斯韦方程组预言光速恒定为c（约30万km/s），但牛顿力学里速度是相对的——矛盾！
- 迈克耳孙-莫雷实验：没测到"以太风"，光速真的不变
狭义相对论的两条公设：
1. 光速不变原理：任何惯性系中，真空光速恒为c
2. 相对性原理：物理定律在所有惯性系中形式相同
惊人推论：
- 时间膨胀：运动时钟变慢！飞船以0.9c飞行，船上过1年，地球过约2.3年
  （双生子佯谬：地球上的兄弟更老）
- 长度收缩：运动方向上的长度变短
- 同时的相对性：一个参考系同时发生的事，另一个参考系未必同时
- 质能方程：E = mc²！1克物质完全转化 = 9×10¹³焦耳 ≈ 2.5万吨TNT
  ——核电站、原子弹的原理
广义相对论：
- 等效原理：引力场与加速参考系不可区分（电梯加速上升=引力增强）
- 时空弯曲：质量使时空弯曲，物体沿测地线（"最直的曲线"）运动——这就是引力！
  * 光经过太阳会被弯曲（1919年日食观测证实，爱因斯坦一夜成名）
  * 水星近日点进动：牛顿理论解释不了的43角秒/世纪，广义相对论完美解释
现代验证与应用：
- GPS导航：卫星上的原子钟必须考虑相对论修正（每天约38微秒，不修正会偏7公里！）
- 引力波：2015年LIGO首次探测到（两个黑洞合并），2017年诺贝尔奖
- 黑洞照片（2019）：黑洞就是时空弯曲到连光都逃不出的区域
一句话总结：牛顿说"引力是力"，爱因斯坦说"引力是时空的弯曲"——都正确，但爱因斯坦的适用范围更广。',
'理解狭义相对论的推论与广义相对论的时空弯曲',
'["光速不变是核心公设","时间膨胀: 运动时钟变慢","E=mc²: 质能等价","引力=时空弯曲","GPS必须做相对论修正"]',
'advanced', 15, 1),

(65, 26, '量子力学入门',
'量子力学描述微观世界（原子、电子、光子）的规律。它反直觉，但被实验反复验证——现代芯片、激光、核磁共振、手机都靠它。
量子力学的起源：
- 1900年普朗克：能量量子化——能量不是连续的，而是一份一份的（量子）
- 1905年爱因斯坦：光量子（光子）——光的能量 = h×f（光电效应）
- 1913年玻尔：电子只能在特定轨道（能级）上运动，跃迁时吸收/发射光子
- 1920年代：海森堡（矩阵力学）、薛定谔（波动力学）建立完整理论
核心概念：
1. 波粒二象性：微观粒子既是波又是粒子
   - 电子双缝实验：单个电子也会形成干涉条纹！"观测"行为改变结果
2. 不确定性原理（海森堡）：无法同时精确测量位置和动量（Δx·Δp ≥ ħ/2）
   ——不是仪器不够好，而是世界的本质
3. 波函数与概率：薛定谔方程描述粒子的波函数，|波函数|² = 概率密度
   量子力学只预言"概率"，不预言确定结果（爱因斯坦："上帝不掷骰子"——但实验表明上帝确实掷）
4. 量子叠加：粒子同时处于多种状态（薛定谔的猫：既死又活，直到观测坍缩）
5. 量子纠缠：两个粒子即使相隔光年，测量一个立即确定另一个的状态
   （爱因斯坦称之为"鬼魅般的超距作用"；2022年诺贝尔奖验证了它）
量子技术的现实应用：
- 半导体与芯片：能带理论是晶体管的基础
- 激光、LED、太阳能电池
- 核磁共振成像（MRI）
- 量子计算：利用叠加和纠缠并行计算，谷歌"悬铃木"（2019）宣称量子霸权
  * 量子比特（qubit）：一个qubit同时是0和1
  * 应用前景：破解加密、药物分子模拟、优化问题
- 量子通信：量子密钥分发，理论上绝对安全
如何理解微观世界？忘掉经典直觉，把量子力学当作"计算规则"来用——它极其精确地预言了微观现象，这就是科学的力量。',
'理解波粒二象性、不确定性原理与量子技术',
'["能量是量子的: E=hf","波粒二象性与双缝实验","不确定性原理限制同时测量","量子叠加与薛定谔的猫","量子纠缠被2022诺奖验证"]',
'advanced', 15, 2);

-- =============================================
-- 知识库扩充: 新增测验题目
-- =============================================

INSERT IGNORE INTO sekai_learning_quiz_questions (id, lesson_id, question, question_type, options, correct_answer, explanation, sort_order) VALUES
(51, 26, '原子中带正电荷的粒子是？', 'single', '[{"label":"A","text":"质子"},{"label":"B","text":"电子"},{"label":"C","text":"中子"},{"label":"D","text":"光子"}]', 'A', '质子带正电荷，电子带负电荷，中子不带电', 1),
(52, 26, '氧原子有8个质子和8个中子，它的质量数是？', 'single', '[{"label":"A","text":"8"},{"label":"B","text":"16"},{"label":"C","text":"24"},{"label":"D","text":"32"}]', 'B', '质量数=质子数+中子数=8+8=16', 2),
(53, 27, 'NaCl（食盐）中的化学键类型是？', 'single', '[{"label":"A","text":"共价键"},{"label":"B","text":"离子键"},{"label":"C","text":"金属键"},{"label":"D","text":"氢键"}]', 'B', '钠是活泼金属、氯是活泼非金属，形成离子键', 1),
(54, 27, '水分子H2O中氧和氢之间是什么键？', 'single', '[{"label":"A","text":"离子键"},{"label":"B","text":"共价键"},{"label":"C","text":"金属键"},{"label":"D","text":"范德华力"}]', 'B', '两个非金属原子之间共用电子对，形成共价键', 2),
(55, 28, '质量守恒定律说明了什么？', 'single', '[{"label":"A","text":"反应前后元素种类不变"},{"label":"B","text":"反应前后原子数目不变"},{"label":"C","text":"反应前后质量总和不变"},{"label":"D","text":"以上都对"}]', 'D', '化学反应前后原子种类、数目和质量总和都不变', 1),
(56, 28, '在反应 2H2 + O2 → 2H2O 中，氢气和氧气的系数比是？', 'single', '[{"label":"A","text":"1:1"},{"label":"B","text":"2:1"},{"label":"C","text":"1:2"},{"label":"D","text":"2:2"}]', 'B', '系数之比即化学计量数之比，2:1', 2),
(57, 29, '被称为细胞"动力工厂"的细胞器是？', 'single', '[{"label":"A","text":"核糖体"},{"label":"B","text":"线粒体"},{"label":"C","text":"叶绿体"},{"label":"D","text":"高尔基体"}]', 'B', '线粒体是有氧呼吸的主要场所，提供能量', 1),
(58, 29, '植物细胞有而动物细胞没有的结构是？', 'single', '[{"label":"A","text":"细胞膜"},{"label":"B","text":"细胞核"},{"label":"C","text":"细胞壁"},{"label":"D","text":"线粒体"}]', 'C', '细胞壁、叶绿体和大液泡是植物细胞特有结构', 2),
(59, 30, 'DNA双螺旋中，腺嘌呤A与谁配对？', 'single', '[{"label":"A","text":"T胸腺嘧啶"},{"label":"B","text":"G鸟嘌呤"},{"label":"C","text":"C胞嘧啶"},{"label":"D","text":"U尿嘧啶"}]', 'A', '碱基配对原则: A-T, G-C', 1),
(60, 30, '孟德尔通过豌豆实验发现了什么定律？', 'single', '[{"label":"A","text":"分离定律"},{"label":"B","text":"万有引力定律"},{"label":"C","text":"能量守恒定律"},{"label":"D","text":"热力学定律"}]', 'A', '孟德尔发现分离定律和自由组合定律', 2),
(61, 31, '自然选择的核心观点是？', 'single', '[{"label":"A","text":"用进废退"},{"label":"B","text":"适者生存"},{"label":"C","text":"物种不变"},{"label":"D","text":"人工选择"}]', 'B', '自然选择使适应环境的个体存活并繁衍', 1),
(62, 31, '进化的原材料（变异来源）是？', 'single', '[{"label":"A","text":"基因突变与基因重组"},{"label":"B","text":"自然选择"},{"label":"C","text":"地理隔离"},{"label":"D","text":"人工驯化"}]', 'A', '突变和基因重组为进化提供原材料', 2),
(63, 32, '日语五十音图中五个元音是？', 'single', '[{"label":"A","text":"a i u e o"},{"label":"B","text":"a e i o u"},{"label":"C","text":"a u i e o"},{"label":"D","text":"o i a e u"}]', 'A', '五个元音: あa いi うu えe おo', 1),
(64, 32, '假名"あ"的读音是？', 'single', '[{"label":"A","text":"i"},{"label":"B","text":"a"},{"label":"C","text":"u"},{"label":"D","text":"e"}]', 'B', 'あ读作a，是五十音图第一个假名', 2),
(65, 33, '片假名主要用于书写什么？', 'single', '[{"label":"A","text":"动词变形"},{"label":"B","text":"外来语"},{"label":"C","text":"汉字注音"},{"label":"D","text":"古典日语"}]', 'B', '片假名主要书写外来语、拟声词等', 1),
(66, 33, '"コーヒー"的意思是？', 'single', '[{"label":"A","text":"咖啡"},{"label":"B","text":"茶"},{"label":"C","text":"牛奶"},{"label":"D","text":"水"}]', 'A', 'コーヒー是coffee的外来语', 2),
(67, 34, '"わたしは学生です"的意思是？', 'single', '[{"label":"A","text":"我是老师"},{"label":"B","text":"我是学生"},{"label":"C","text":"你是学生"},{"label":"D","text":"这是我的学校"}]', 'B', 'わたし=我，学生=学生，です=是', 1),
(68, 34, '日语疑问句通常在句末加哪个助词？', 'single', '[{"label":"A","text":"は"},{"label":"B","text":"の"},{"label":"C","text":"か"},{"label":"D","text":"ね"}]', 'C', '句末加か构成疑问句: 学生ですか？', 2),
(69, 35, '表示"在某地做动作"的助词是？', 'single', '[{"label":"A","text":"で"},{"label":"B","text":"に"},{"label":"C","text":"を"},{"label":"D","text":"と"}]', 'A', 'で表示动作发生的场所或手段', 1),
(70, 35, '"本を読みます"中"を"表示什么？', 'single', '[{"label":"A","text":"主语"},{"label":"B","text":"宾语"},{"label":"C","text":"时间"},{"label":"D","text":"地点"}]', 'B', 'を表示动作的对象（宾语）', 2),
(71, 36, '"やばい"在动漫中最常见的含义是？', 'single', '[{"label":"A","text":"厉害/糟糕"},{"label":"B","text":"你好"},{"label":"C","text":"再见"},{"label":"D","text":"谢谢"}]', 'A', 'やばい根据语境可表示"糟糕"或"好厉害"', 1),
(72, 36, '"ありがとう"的意思是？', 'single', '[{"label":"A","text":"对不起"},{"label":"B","text":"谢谢"},{"label":"C","text":"加油"},{"label":"D","text":"晚安"}]', 'B', 'ありがとう是"谢谢"，郑重说法加ございます', 2),
(73, 37, '其他条件不变，价格上升时需求量通常会？', 'single', '[{"label":"A","text":"增加"},{"label":"B","text":"减少"},{"label":"C","text":"不变"},{"label":"D","text":"无法判断"}]', 'B', '需求定律: 价格与需求量反向变动', 1),
(74, 37, '均衡价格是指？', 'single', '[{"label":"A","text":"政府定价"},{"label":"B","text":"供需相等时的价格"},{"label":"C","text":"生产成本"},{"label":"D","text":"最高限价"}]', 'B', '需求曲线与供给曲线的交点对应均衡价格', 2),
(75, 38, '只有一家厂商的市场结构是？', 'single', '[{"label":"A","text":"完全竞争"},{"label":"B","text":"垄断竞争"},{"label":"C","text":"寡头垄断"},{"label":"D","text":"完全垄断"}]', 'D', '完全垄断: 唯一厂商、无替代品、壁垒高', 1),
(76, 38, '农产品市场最接近哪种市场结构？', 'single', '[{"label":"A","text":"完全竞争"},{"label":"B","text":"完全垄断"},{"label":"C","text":"寡头垄断"},{"label":"D","text":"双头垄断"}]', 'A', '农产品同质化高、厂商众多，接近完全竞争', 2),
(77, 39, '"认识你自己"是哪位哲学家的名言？', 'single', '[{"label":"A","text":"泰勒斯"},{"label":"B","text":"苏格拉底"},{"label":"C","text":"柏拉图"},{"label":"D","text":"亚里士多德"}]', 'B', '苏格拉底把哲学从自然转向人的内心', 1),
(78, 39, '柏拉图著名的"洞穴比喻"说明了什么？', 'single', '[{"label":"A","text":"现实世界是理念的影子"},{"label":"B","text":"万物由水构成"},{"label":"C","text":"人是万物的尺度"},{"label":"D","text":"原子不可分割"}]', 'A', '洞穴比喻: 感官世界只是理念世界的摹本', 2),
(79, 40, '儒家思想的核心概念是？', 'single', '[{"label":"A","text":"仁"},{"label":"B","text":"无为"},{"label":"C","text":"空"},{"label":"D","text":"兼爱"}]', 'A', '仁是儒家核心，爱人也包括己所不欲勿施于人', 1),
(80, 40, '"道法自然"是哪家思想的核心命题？', 'single', '[{"label":"A","text":"儒家"},{"label":"B","text":"道家"},{"label":"C","text":"法家"},{"label":"D","text":"墨家"}]', 'B', '道家主张顺应自然规律，道法自然', 2),
(81, 41, '太阳系中体积最大的行星是？', 'single', '[{"label":"A","text":"地球"},{"label":"B","text":"木星"},{"label":"C","text":"土星"},{"label":"D","text":"海王星"}]', 'B', '木星能容纳约1300个地球，是最大行星', 1),
(82, 41, '火星和木星之间分布着什么？', 'single', '[{"label":"A","text":"小行星带"},{"label":"B","text":"柯伊伯带"},{"label":"C","text":"奥尔特云"},{"label":"D","text":"行星环"}]', 'A', '小行星带位于火星与木星轨道之间', 2),
(83, 42, '太阳目前正处于恒星演化的哪个阶段？', 'single', '[{"label":"A","text":"原恒星"},{"label":"B","text":"主序星"},{"label":"C","text":"红巨星"},{"label":"D","text":"白矮星"}]', 'B', '太阳正稳定燃烧氢，处于主序星阶段', 1),
(84, 42, '大质量恒星晚年爆发后可能形成什么天体？', 'single', '[{"label":"A","text":"中子星"},{"label":"B","text":"黑洞"},{"label":"C","text":"超新星残骸"},{"label":"D","text":"以上都可能"}]', 'D', '超新星爆发后依质量形成中子星或黑洞', 2),
(85, 43, '中国第一部诗歌总集是？', 'single', '[{"label":"A","text":"楚辞"},{"label":"B","text":"诗经"},{"label":"C","text":"乐府诗集"},{"label":"D","text":"唐诗三百首"}]', 'B', '诗经收录西周至春秋诗歌305篇', 1),
(86, 43, '《红楼梦》的作者是？', 'single', '[{"label":"A","text":"罗贯中"},{"label":"B","text":"施耐庵"},{"label":"C","text":"曹雪芹"},{"label":"D","text":"吴承恩"}]', 'C', '曹雪芹著《红楼梦》，古典小说巅峰', 2),
(87, 44, '《战争与和平》的作者是？', 'single', '[{"label":"A","text":"莎士比亚"},{"label":"B","text":"托尔斯泰"},{"label":"C","text":"雨果"},{"label":"D","text":"卡夫卡"}]', 'B', '托尔斯泰是俄国文学的高峰', 1),
(88, 44, '《堂吉诃德》是哪个国家的作品？', 'single', '[{"label":"A","text":"英国"},{"label":"B","text":"法国"},{"label":"C","text":"西班牙"},{"label":"D","text":"意大利"}]', 'C', '塞万提斯是西班牙作家，作品是现代小说先驱', 2),
(89, 45, '标准音A4的频率是？', 'single', '[{"label":"A","text":"220Hz"},{"label":"B","text":"440Hz"},{"label":"C","text":"880Hz"},{"label":"D","text":"110Hz"}]', 'B', 'A4=440Hz是国际调音标准', 1),
(90, 45, '一个全音符等于几个四分音符？', 'single', '[{"label":"A","text":"2个"},{"label":"B","text":"4个"},{"label":"C","text":"8个"},{"label":"D","text":"16个"}]', 'B', '全音符4拍=4个四分音符', 2),
(91, 46, '大三和弦的音程结构是？', 'single', '[{"label":"A","text":"大三度+小三度"},{"label":"B","text":"小三度+大三度"},{"label":"C","text":"大三度+大三度"},{"label":"D","text":"小三度+小三度"}]', 'A', '大三和弦: 根音到三音大三度，三音到五音小三度', 1),
(92, 46, '调式中最稳定、给人"回家"感觉的音是？', 'single', '[{"label":"A","text":"属音"},{"label":"B","text":"主音"},{"label":"C","text":"中音"},{"label":"D","text":"导音"}]', 'B', '主音（I级）是最稳定的音', 2),
(93, 47, '地球内部结构中，最外层的是？', 'single', '[{"label":"A","text":"地核"},{"label":"B","text":"地幔"},{"label":"C","text":"地壳"},{"label":"D","text":"软流层"}]', 'C', '地球由外到内: 地壳-地幔-地核', 1),
(94, 47, '板块构造学说中，板块在哪个圈层上漂移？', 'single', '[{"label":"A","text":"地壳"},{"label":"B","text":"软流层"},{"label":"C","text":"地核"},{"label":"D","text":"大气圈"}]', 'B', '软流层是岩浆发源地，板块在其上漂移', 2),
(95, 48, '温室效应主要由哪种气体增强导致？', 'single', '[{"label":"A","text":"氧气"},{"label":"B","text":"氮气"},{"label":"C","text":"二氧化碳"},{"label":"D","text":"氢气"}]', 'C', 'CO2等温室气体增强大气逆辐射', 1),
(96, 48, '热带雨林气候的主要特征是？', 'single', '[{"label":"A","text":"全年高温多雨"},{"label":"B","text":"四季分明"},{"label":"C","text":"全年干燥"},{"label":"D","text":"冬季严寒"}]', 'A', '赤道附近全年高温多雨', 2),
(97, 49, '数组随机访问的时间复杂度是？', 'single', '[{"label":"A","text":"O(1)"},{"label":"B","text":"O(n)"},{"label":"C","text":"O(log n)"},{"label":"D","text":"O(n²)"}]', 'A', '数组连续存储，按下标直接定位O(1)', 1),
(98, 49, '链表在已知节点位置时插入的时间复杂度是？', 'single', '[{"label":"A","text":"O(1)"},{"label":"B","text":"O(n)"},{"label":"C","text":"O(log n)"},{"label":"D","text":"O(n²)"}]', 'A', '链表插入只需修改指针，O(1)', 2),
(99, 50, '快速排序的平均时间复杂度是？', 'single', '[{"label":"A","text":"O(n²)"},{"label":"B","text":"O(n log n)"},{"label":"C","text":"O(n)"},{"label":"D","text":"O(log n)"}]', 'B', '快排平均O(n log n)，最坏O(n²)', 1),
(100, 50, '冒泡排序的时间复杂度是？', 'single', '[{"label":"A","text":"O(n log n)"},{"label":"B","text":"O(n)"},{"label":"C","text":"O(n²)"},{"label":"D","text":"O(1)"}]', 'C', '冒泡排序是O(n²)的基础排序', 2),
(101, 51, '二分查找的前提条件是？', 'single', '[{"label":"A","text":"数组无序"},{"label":"B","text":"数组有序"},{"label":"C","text":"数据为链表"},{"label":"D","text":"数据为树"}]', 'B', '二分查找要求数据有序', 1),
(102, 51, '二分查找的时间复杂度是？', 'single', '[{"label":"A","text":"O(1)"},{"label":"B","text":"O(n)"},{"label":"C","text":"O(log n)"},{"label":"D","text":"O(n²)"}]', 'C', '每次排除一半数据，复杂度O(log n)', 2),
(103, 52, '查询数据库中所有数据使用的语句是？', 'single', '[{"label":"A","text":"INSERT"},{"label":"B","text":"SELECT"},{"label":"C","text":"UPDATE"},{"label":"D","text":"DELETE"}]', 'B', 'SELECT用于查询数据', 1),
(104, 52, 'SQL中WHERE子句后不能直接使用什么？', 'single', '[{"label":"A","text":"比较运算符"},{"label":"B","text":"聚合函数"},{"label":"C","text":"AND"},{"label":"D","text":"LIKE"}]', 'B', '聚合函数用于SELECT或HAVING，不能直接在WHERE中', 2),
(105, 53, '主键（PRIMARY KEY）的特性是？', 'single', '[{"label":"A","text":"允许为空"},{"label":"B","text":"唯一且非空"},{"label":"C","text":"可以有多个值重复"},{"label":"D","text":"只能是数字"}]', 'B', '主键唯一标识一行，NOT NULL + UNIQUE', 1),
(106, 53, '消除数据冗余、保证一致性的设计方法是？', 'single', '[{"label":"A","text":"反范式化"},{"label":"B","text":"范式化"},{"label":"C","text":"增加冗余列"},{"label":"D","text":"不设主键"}]', 'B', '范式化（1NF/2NF/3NF）消除冗余', 2),
(107, 54, '掷一枚公平硬币，正面朝上的概率是？', 'single', '[{"label":"A","text":"1"},{"label":"B","text":"1/2"},{"label":"C","text":"1/3"},{"label":"D","text":"0"}]', 'B', '两个等可能结果，正面概率1/2', 1),
(108, 54, '两个独立事件同时发生的概率如何计算？', 'single', '[{"label":"A","text":"相加"},{"label":"B","text":"相乘"},{"label":"C","text":"相减"},{"label":"D","text":"相除"}]', 'B', '独立事件: P(A∩B)=P(A)×P(B)', 2),
(109, 55, '衡量数据集中趋势最常用的指标是？', 'single', '[{"label":"A","text":"方差"},{"label":"B","text":"均值"},{"label":"C","text":"标准差"},{"label":"D","text":"极差"}]', 'B', '均值是集中趋势的常用度量', 1),
(110, 55, '标准正态分布的曲线形状是？', 'single', '[{"label":"A","text":"直线"},{"label":"B","text":"钟形"},{"label":"C","text":"U形"},{"label":"D","text":"锯齿形"}]', 'B', '正态分布呈对称的钟形曲线', 2),
(111, 56, '热力学第一定律的本质是？', 'single', '[{"label":"A","text":"能量守恒"},{"label":"B","text":"熵增"},{"label":"C","text":"温度定义"},{"label":"D","text":"热量定义"}]', 'A', '第一定律ΔU=Q+W是能量守恒定律', 1),
(112, 56, '热力学第二定律表明孤立系统的熵会？', 'single', '[{"label":"A","text":"减少"},{"label":"B","text":"保持不变"},{"label":"C","text":"增加"},{"label":"D","text":"先减后增"}]', 'C', '孤立系统的熵永不减少，即熵增原理', 2),
(113, 57, '声音在空气中传播属于哪种波？', 'single', '[{"label":"A","text":"横波"},{"label":"B","text":"纵波"},{"label":"C","text":"电磁波"},{"label":"D","text":"表面波"}]', 'B', '声波是纵波（质点平行于传播方向振动）', 1),
(114, 57, '救护车驶近时鸣笛声调变高，这是？', 'single', '[{"label":"A","text":"多普勒效应"},{"label":"B","text":"共振"},{"label":"C","text":"干涉"},{"label":"D","text":"衍射"}]', 'A', '声源靠近观察者时频率升高，多普勒效应', 2),
(115, 58, '第一次世界大战的导火索是？', 'single', '[{"label":"A","text":"凡尔赛条约签订"},{"label":"B","text":"萨拉热窝事件"},{"label":"C","text":"珍珠港事件"},{"label":"D","text":"柏林墙建立"}]', 'B', '1914年斐迪南大公在萨拉热窝遇刺', 1),
(116, 58, '一战中与三国同盟对抗的集团是？', 'single', '[{"label":"A","text":"轴心国"},{"label":"B","text":"协约国"},{"label":"C","text":"北约"},{"label":"D","text":"华约"}]', 'B', '三国协约（英法俄）对抗三国同盟', 2),
(117, 59, '第二次世界大战苏德战场的转折点是？', 'single', '[{"label":"A","text":"诺曼底登陆"},{"label":"B","text":"斯大林格勒保卫战"},{"label":"C","text":"珍珠港事件"},{"label":"D","text":"中途岛海战"}]', 'B', '斯大林格勒保卫战是二战的根本转折点之一', 1),
(118, 59, '1945年8月美国在哪两个城市投下原子弹？', 'single', '[{"label":"A","text":"广岛和长崎"},{"label":"B","text":"东京和大阪"},{"label":"C","text":"大阪和横滨"},{"label":"D","text":"名古屋和福冈"}]', 'A', '广岛（8月6日）和长崎（8月9日）', 2),
(119, 60, '皮亚杰认为0-2岁处于认知发展的哪个阶段？', 'single', '[{"label":"A","text":"前运算阶段"},{"label":"B","text":"感知运动阶段"},{"label":"C","text":"具体运算阶段"},{"label":"D","text":"形式运算阶段"}]', 'B', '0-2岁是感知运动期，靠感觉和动作认识世界', 1),
(120, 60, '婴儿知道被藏起来的玩具依然存在，这是获得了？', 'single', '[{"label":"A","text":"客体永久性"},{"label":"B","text":"守恒概念"},{"label":"C","text":"自我意识"},{"label":"D","text":"延迟满足"}]', 'A', '客体永久性约在8-12个月出现', 2),
(121, 61, '埃里克森认为青少年期的主要发展任务是？', 'single', '[{"label":"A","text":"信任对不信任"},{"label":"B","text":"同一性对角色混乱"},{"label":"C","text":"勤奋对自卑"},{"label":"D","text":"亲密对孤独"}]', 'B', '青少年期核心课题是建立自我同一性', 1),
(122, 61, '青春期身体迅速发育主要由什么驱动？', 'single', '[{"label":"A","text":"性激素分泌"},{"label":"B","text":"神经反射"},{"label":"C","text":"骨骼生长"},{"label":"D","text":"肌肉锻炼"}]', 'A', '雌激素/睾酮等性激素驱动青春期发育', 2),
(123, 62, '监督学习的训练数据必须包含什么？', 'single', '[{"label":"A","text":"标签（答案）"},{"label":"B","text":"只有特征"},{"label":"C","text":"只有结果"},{"label":"D","text":"随机噪声"}]', 'A', '监督学习用带标签的数据学习映射', 1),
(124, 62, '模型在训练集表现好但测试集差，这是？', 'single', '[{"label":"A","text":"欠拟合"},{"label":"B","text":"过拟合"},{"label":"C","text":"正常现象"},{"label":"D","text":"数据泄露"}]', 'B', '过拟合: 记住了训练数据而非学规律', 2),
(125, 63, '神经网络中激活函数的作用是？', 'single', '[{"label":"A","text":"引入非线性"},{"label":"B","text":"降低维度"},{"label":"C","text":"加速训练"},{"label":"D","text":"归一化"}]', 'A', '没有非线性激活函数，多层等价于单层', 1),
(126, 63, 'GPT等大语言模型的预训练任务是？', 'single', '[{"label":"A","text":"预测下一个词"},{"label":"B","text":"图像分类"},{"label":"C","text":"语音识别"},{"label":"D","text":"推荐排序"}]', 'A', 'LLM通过海量文本预测下一个词进行预训练', 2),
(127, 64, '爱因斯坦的质能方程是？', 'single', '[{"label":"A","text":"E=mc"},{"label":"B","text":"E=mc²"},{"label":"C","text":"E=mv"},{"label":"D","text":"E=1/2mv²"}]', 'B', 'E=mc²，c为光速', 1),
(128, 64, '狭义相对论的两个公设之一是？', 'single', '[{"label":"A","text":"绝对时间"},{"label":"B","text":"光速不变"},{"label":"C","text":"以太存在"},{"label":"D","text":"绝对空间"}]', 'B', '光速不变原理是狭义相对论的基石', 2),
(129, 65, '微观粒子同时处于多种状态的特性叫？', 'single', '[{"label":"A","text":"量子叠加"},{"label":"B","text":"量子纠缠"},{"label":"C","text":"量子隧穿"},{"label":"D","text":"量子退火"}]', 'A', '薛定谔的猫体现量子叠加态', 1),
(130, 65, '海森堡不确定性原理限制了什么？', 'single', '[{"label":"A","text":"同时精确测量位置和动量"},{"label":"B","text":"测量温度"},{"label":"C","text":"测量电荷"},{"label":"D","text":"测量质量"}]', 'A', 'Δx·Δp≥ħ/2，位置与动量不能同时精确确定', 2);
