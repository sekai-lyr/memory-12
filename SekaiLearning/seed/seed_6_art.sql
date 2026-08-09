-- =============================================
-- 知识库扩充 Part6: 艺术与设计
-- course 71, lessons 262-265, quiz 523-530
-- =============================================

INSERT IGNORE INTO sekai_learning_courses (id, subject_id, name, description, difficulty, estimated_hours, lesson_count, sort_order) VALUES
(71, 16, '美术与设计基础', '素描、色彩与设计原理', 'beginner', 3, 4, 1);

INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(262, 71, '素描基础',
'素描是美术的基石：用单色表现明暗与形体。三大面五大调子是写实素描的核心。线条训练培养观察力。

<b>素描五大调子表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">调子</th><th style="border:1px solid #999;padding:6px">位置</th><th style="border:1px solid #999;padding:6px">明暗</th></tr>
<tr><td style="border:1px solid #999;padding:6px">亮面</td><td style="border:1px solid #999;padding:6px">受光直接照射</td><td style="border:1px solid #999;padding:6px">最亮</td></tr>
<tr><td style="border:1px solid #999;padding:6px">灰面</td><td style="border:1px solid #999;padding:6px">侧光过渡区</td><td style="border:1px solid #999;padding:6px">中间调</td></tr>
<tr><td style="border:1px solid #999;padding:6px">明暗交界线</td><td style="border:1px solid #999;padding:6px">亮暗分界</td><td style="border:1px solid #999;padding:6px">最重</td></tr>
<tr><td style="border:1px solid #999;padding:6px">反光</td><td style="border:1px solid #999;padding:6px">暗部受环境光</td><td style="border:1px solid #999;padding:6px">暗部中的亮</td></tr>
<tr><td style="border:1px solid #999;padding:6px">投影</td><td style="border:1px solid #999;padding:6px">物体遮挡光</td><td style="border:1px solid #999;padding:6px">边缘虚</td></tr>
</table>

三大面：亮面、灰面、暗面。球体、圆柱、立方体是基础几何体，练习透视：一点透视、两点透视、三点透视。

排线技巧：平行排线、交叉排线、渐变排线。握笔远端（画大形用长线）、近端（细节用短线）。起形用几何概括（先方后圆）。

构图原则：黄金分割（约 1:1.618）、三分法、留白、主体突出。静物写生组合：主次分明、聚散有序。

练习路线：几何体→静物→石膏像→人像。每天 30 分钟排线+几何体练习，3 个月可见明显进步。观察力训练：眯眼看大关系、退远看整体。',
'掌握素描明暗体系',
'["三大面五大调子","透视三种类型","排线与握笔","黄金分割构图"]',
'beginner', 12, 1),
(263, 71, '色彩基础',
'色彩三属性：色相（颜色种类）、明度（明暗）、纯度（鲜艳度）。色环是色彩关系的地图。

<b>色彩搭配方式表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">搭配</th><th style="border:1px solid #999;padding:6px">关系</th><th style="border:1px solid #999;padding:6px">效果</th><th style="border:1px solid #999;padding:6px">例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">同类色</td><td style="border:1px solid #999;padding:6px">同色相不同明度</td><td style="border:1px solid #999;padding:6px">柔和统一</td><td style="border:1px solid #999;padding:6px">浅蓝深蓝</td></tr>
<tr><td style="border:1px solid #999;padding:6px">邻近色</td><td style="border:1px solid #999;padding:6px">色环相邻</td><td style="border:1px solid #999;padding:6px">和谐自然</td><td style="border:1px solid #999;padding:6px">黄橙</td></tr>
<tr><td style="border:1px solid #999;padding:6px">互补色</td><td style="border:1px solid #999;padding:6px">色环相对</td><td style="border:1px solid #999;padding:6px">强烈醒目</td><td style="border:1px solid #999;padding:6px">红绿/蓝橙</td></tr>
<tr><td style="border:1px solid #999;padding:6px">对比色</td><td style="border:1px solid #999;padding:6px">色环相隔120°</td><td style="border:1px solid #999;padding:6px">活泼鲜明</td><td style="border:1px solid #999;padding:6px">红蓝</td></tr>
</table>

三原色（颜料）：红黄蓝，混合出其他色；三原色（光）：红绿蓝 RGB。印刷用 CMYK（青品黄黑）。

色彩心理：红色热情警示、蓝色冷静科技、黄色活力、绿色自然、紫色神秘。品牌色即心理暗示（可口可乐红、星巴克绿）。

色彩三要素关系：明度变化最大影响画面层次；纯度高的色前进感强；冷暖对比（暖色前进冷色后退）营造空间。

练习：色环制作、明度渐变条、补色对训练。观察大师作品的色彩倾向（莫奈暖、莫兰迪灰）。数字绘画注意色域与显示器校准。',
'掌握色彩原理',
'["色相明度纯度三属性","互补色搭配","RGB与CMYK","色彩心理暗示"]',
'beginner', 12, 2),
(264, 71, '设计原理',
'设计是"解决问题+传达美感"。平面设计要素：版式、字体、图形、色彩。设计原则是组织这些要素的规则。

<b>设计原则对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">原则</th><th style="border:1px solid #999;padding:6px">含义</th><th style="border:1px solid #999;padding:6px">应用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">对齐</td><td style="border:1px solid #999;padding:6px">元素有秩序排列</td><td style="border:1px solid #999;padding:6px">左对齐基线</td></tr>
<tr><td style="border:1px solid #999;padding:6px">对比</td><td style="border:1px solid #999;padding:6px">差异突出重点</td><td style="border:1px solid #999;padding:6px">标题字大色重</td></tr>
<tr><td style="border:1px solid #999;padding:6px">重复</td><td style="border:1px solid #999;padding:6px">一致强化统一</td><td style="border:1px solid #999;padding:6px">统一图标风格</td></tr>
<tr><td style="border:1px solid #999;padding:6px">亲密性</td><td style="border:1px solid #999;padding:6px">相关元素靠近</td><td style="border:1px solid #999;padding:6px">标题贴正文</td></tr>
<tr><td style="border:1px solid #999;padding:6px">留白</td><td style="border:1px solid #999;padding:6px">负空间呼吸感</td><td style="border:1px solid #999;padding:6px">版式透气</td></tr>
</table>

版式栅格系统：12 栏栅格是网页与海报标准，保证对齐与响应式。字体搭配：衬线（serif）与无衬线（sans-serif）各一。

信息层级：视觉权重排序（标题>副标题>正文），用大小、粗细、颜色区分。阅读顺序：Z 型（横幅海报）与 F 型（网页）。

UI/UX 基础：用户第一、简洁优先、反馈及时。按钮状态（默认悬停按下禁用）、无障碍设计（对比度、字体大小）。

设计工具：Figma（协作 UI）、Photoshop（位图）、Illustrator（矢量）、Canva（模板快速出图）。AI 设计工具（Midjourney 2022 爆发）辅助创意。',
'掌握设计原则',
'["四大原则对齐对比重复亲密","栅格系统","信息层级","UI/UX用户体验"]',
'intermediate', 12, 3),
(265, 71, '数字艺术与AI创作',
'数字艺术=传统美术+数字工具。CG 流程：概念设计→建模/绘制→渲染→后期。数字绘画让创作门槛大幅降低。

<b>数字艺术工具对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">工具</th><th style="border:1px solid #999;padding:6px">用途</th><th style="border:1px solid #999;padding:6px">适合</th></tr>
<tr><td style="border:1px solid #999;padding:6px">Photoshop</td><td style="border:1px solid #999;padding:6px">位图修图绘画</td><td style="border:1px solid #999;padding:6px">照片合成</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Procreate</td><td style="border:1px solid #999;padding:6px">iPad绘画</td><td style="border:1px solid #999;padding:6px">插画速写</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Blender</td><td style="border:1px solid #999;padding:6px">3D建模免费</td><td style="border:1px solid #999;padding:6px">3D入门</td></tr>
<tr><td style="border:1px solid #999;padding:6px">AI绘画</td><td style="border:1px solid #999;padding:6px">文本生成图</td><td style="border:1px solid #999;padding:6px">概念灵感</td></tr>
</table>

AI 绘画提示词结构：主体+风格+构图+光线+细节（a red fox, anime style, golden hour, high detail）。负面提示词排除缺陷（bad hands, blurry）。

AI 与版权：Midjourney/Stable Diffusion 训练数据争议、生成图著作权（中国 2023 首例判决认可一定版权）、AI 版权登记新规（2025 中国首发）。

数字绘画流程：草稿（松）→线稿（准）→铺色（整体）→光影（体积）→细化（重点）。图层管理：线稿层、底色层、光影层分离。

创作伦理：AI 辅助定位（灵感参考、效率提升）、真实人类创作保护、署名规范。技术与艺术结合：AI 生成+人工精修是主流工作流。',
'掌握数字艺术与AI',
'["CG制作流程","AI提示词结构","AI版权争议","人机协作工作流"]',
'intermediate', 12, 4);

INSERT IGNORE INTO sekai_learning_quiz_questions (id, lesson_id, question, question_type, options, correct_answer, explanation, sort_order) VALUES
(523, 262, '素描中最重的调子是？', 'single', '[{"label":"A","text":"明暗交界线"},{"label":"B","text":"亮面"},{"label":"C","text":"反光"},{"label":"D","text":"投影"}]', 'A', '明暗交界线最重，反光其次', 1),
(524, 262, '两点透视常用于？', 'single', '[{"label":"A","text":"建筑转角"},{"label":"B","text":"正面平视"},{"label":"C","text":"仰视高楼"},{"label":"D","text":"俯视地面"}]', 'A', '两点透视表现建筑物转角', 2),
(525, 263, '色环上相对的颜色是？', 'single', '[{"label":"A","text":"互补色"},{"label":"B","text":"邻近色"},{"label":"C","text":"同类色"},{"label":"D","text":"间色"}]', 'A', '互补色对比最强', 1),
(526, 263, '印刷色彩模式是？', 'single', '[{"label":"A","text":"CMYK"},{"label":"B","text":"RGB"},{"label":"C","text":"HSV"},{"label":"D","text":"LAB"}]', 'A', '印刷四色青品黄黑', 2),
(527, 264, '设计四原则不包括？', 'single', '[{"label":"A","text":"渐变"},{"label":"B","text":"对齐"},{"label":"C","text":"对比"},{"label":"D","text":"重复"}]', 'A', '对齐对比重复亲密', 1),
(528, 264, '网页版式常用的栅格栏数是？', 'single', '[{"label":"A","text":"12栏"},{"label":"B","text":"3栏"},{"label":"C","text":"24栏"},{"label":"D","text":"6栏"}]', 'A', '12 栏栅格最通用', 2),
(529, 265, 'AI绘画提示词中 golden hour 表示？', 'single', '[{"label":"A","text":"黄金时刻光线"},{"label":"B","text":"金色物体"},{"label":"C","text":"夜晚场景"},{"label":"D","text":"速度效果"}]', 'A', '日出日落柔和光线', 1),
(530, 265, '免费开源 3D 建模软件是？', 'single', '[{"label":"A","text":"Blender"},{"label":"B","text":"Photoshop"},{"label":"C","text":"Figma"},{"label":"D","text":"Word"}]', 'A', 'Blender 开源免费', 2);