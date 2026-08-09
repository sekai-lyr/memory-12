-- =============================================
-- 知识库大扩充 Part1: 数学 + 数据科学
-- courses 27-35, lessons 66-101, quiz 131-202
-- =============================================

INSERT IGNORE INTO sekai_learning_courses (id, subject_id, name, description, difficulty, estimated_hours, lesson_count, sort_order) VALUES
(27, 2, '代数基础', '多项式、方程与不等式的系统性训练', 'beginner', 2, 4, 1),
(28, 2, '平面几何', '三角形、圆与几何证明，培养空间推理能力', 'beginner', 2, 4, 2),
(29, 2, '三角函数与向量', '三角恒等变换、解三角形与空间向量', 'intermediate', 3, 4, 3),
(30, 2, '数列与级数', '等差等比数列、递推与无穷级数', 'intermediate', 3, 4, 4),
(31, 2, '概率论基础', '古典概型、随机变量与大数定律', 'intermediate', 3, 4, 5),
(32, 2, '离散数学与图论', '集合、图、树与算法归约', 'advanced', 4, 4, 6),
(33, 2, '数学建模与编程', '用 Python 把现实问题转成数学模型', 'advanced', 4, 4, 7),
(34, 20, '数据可视化', '用图表讲清数据，掌握常见视觉编码', 'beginner', 2, 4, 8),
(35, 20, '大数据与统计分析', 'MapReduce、SQL 与统计描述实战', 'advanced', 4, 4, 9);

INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(66, 27, '多项式与因式分解',
'多项式是代数的心脏。形如 ax²+bx+c 的式子叫二次三项式，a 称为二次项系数。因式分解就是把多项式拆成乘积，最常用三种方法：提取公因式、公式法、十字相乘。

<b>乘法公式对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">公式</th><th style="border:1px solid #999;padding:6px">展开结果</th><th style="border:1px solid #999;padding:6px">记忆口诀</th></tr>
<tr><td style="border:1px solid #999;padding:6px">(a+b)²</td><td style="border:1px solid #999;padding:6px">a²+2ab+b²</td><td style="border:1px solid #999;padding:6px">首平方，尾平方，二倍乘积放中央</td></tr>
<tr><td style="border:1px solid #999;padding:6px">(a-b)²</td><td style="border:1px solid #999;padding:6px">a²-2ab+b²</td><td style="border:1px solid #999;padding:6px">中间符号要变号</td></tr>
<tr><td style="border:1px solid #999;padding:6px">(a+b)(a-b)</td><td style="border:1px solid #999;padding:6px">a²-b²</td><td style="border:1px solid #999;padding:6px">平方差，没有中间项</td></tr>
<tr><td style="border:1px solid #999;padding:6px">(a+b)³</td><td style="border:1px solid #999;padding:6px">a³+3a²b+3ab²+b³</td><td style="border:1px solid #999;padding:6px">系数 1,3,3,1 用杨辉三角</td></tr>
</table>

十字相乘分解 x²+5x+6：找两个数乘积 6、和 5，即 2 和 3，得 (x+2)(x+3)。分步口诀：首尾相乘、交叉相乘、验证一次项。

判别式 Δ=b²-4ac 决定一元二次方程根的情况：Δ>0 两个实根，Δ=0 一个重根，Δ<0 无实根。韦达定理给出根与系数的关系：x₁+x₂=-b/a，x₁x₂=c/a。',
'掌握乘法公式、十字相乘与韦达定理',
'["因式分解三法: 提公因式/公式/十字相乘","完全平方与平方差公式","判别式Δ决定根的个数","韦达定理: 和与积的对称式"]',
'beginner', 12, 1),
(67, 27, '一元二次方程与函数',
'一元二次方程 ax²+bx+c=0 的解就是二次函数 y=ax²+bx+c 与 x 轴交点的横坐标。求根公式 x=(-b±√(b²-4ac))/(2a) 是初中最重要的公式。

<b>二次函数 y=ax²+bx+c 性质总表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">项目</th><th style="border:1px solid #999;padding:6px">a>0</th><th style="border:1px solid #999;padding:6px">a<0</th></tr>
<tr><td style="border:1px solid #999;padding:6px">开口</td><td style="border:1px solid #999;padding:6px">向上</td><td style="border:1px solid #999;padding:6px">向下</td></tr>
<tr><td style="border:1px solid #999;padding:6px">顶点</td><td style="border:1px solid #999;padding:6px">最小值点</td><td style="border:1px solid #999;padding:6px">最大值点</td></tr>
<tr><td style="border:1px solid #999;padding:6px">对称轴</td><td style="border:1px solid #999;padding:6px" colspan="2">x=-b/(2a)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">值域</td><td style="border:1px solid #999;padding:6px">[顶点纵坐标, +∞)</td><td style="border:1px solid #999;padding:6px">(-∞, 顶点纵坐标]</td></tr>
</table>

配方法把一般式化为顶点式：y=a(x-h)²+k，顶点 (h,k)。求根公式的推导正是配方的结果。

二次不等式 ax²+bx+c>0 的解法：先求对应方程的根，再结合开口方向判断区间——口诀"大于取两边，小于取中间"（仅限 a>0 时）。',
'掌握求根公式、顶点式与二次不等式',
'["求根公式与判别式","顶点式 y=a(x-h)²+k","开口方向决定最值","二次不等式: 大于取两边小于取中间"]',
'beginner', 12, 2),
(68, 27, '不等式与最值',
'不等式解决"最大最小"问题。基本不等式：对任意正数 a、b，有 (a+b)/2 ≥ √(ab)，当且仅当 a=b 时取等。它也叫均值不等式。

<b>常用不等式对照：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">名称</th><th style="border:1px solid #999;padding:6px">表达式</th><th style="border:1px solid #999;padding:6px">取等条件</th></tr>
<tr><td style="border:1px solid #999;padding:6px">均值不等式</td><td style="border:1px solid #999;padding:6px">(a+b)/2 ≥ √(ab)</td><td style="border:1px solid #999;padding:6px">a=b</td></tr>
<tr><td style="border:1px solid #999;padding:6px">平方均值</td><td style="border:1px solid #999;padding:6px">√((a²+b²)/2) ≥ (a+b)/2</td><td style="border:1px solid #999;padding:6px">a=b</td></tr>
<tr><td style="border:1px solid #999;padding:6px">绝对值三角不等式</td><td style="border:1px solid #999;padding:6px">|a+b| ≤ |a|+|b|</td><td style="border:1px solid #999;padding:6px">同号</td></tr>
<tr><td style="border:1px solid #999;padding:6px">排序不等式</td><td style="border:1px solid #999;padding:6px">逆序和 ≤ 乱序和 ≤ 顺序和</td><td style="border:1px solid #999;padding:6px">全等</td></tr>
</table>

经典应用："一正二定三相等"。求 xy 的最大值：若 x+y 为定值，则 x=y 时 xy 最大；求 x+1/x 的最小值（x>0），x=1 时取 2。

分式不等式 (x-1)/(x-2)>0 的解法：转化为整式 (x-1)(x-2)>0，注意分母不为零 x≠2。',
'掌握均值不等式与应用条件',
'["均值不等式: 和定积最大，积定和最小","一正二定三相等","分式不等式要化整式","绝对值不等式三性质"]',
'intermediate', 12, 3),
(69, 27, '函数概念与性质',
'函数是"输入-规则-输出"的机器：f(x) 表示对 x 施加规则 f。定义域是合法输入集合，值域是输出集合。

<b>基本初等函数性质表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">函数</th><th style="border:1px solid #999;padding:6px">定义域</th><th style="border:1px solid #999;padding:6px">单调性</th><th style="border:1px solid #999;padding:6px">奇偶性</th></tr>
<tr><td style="border:1px solid #999;padding:6px">y=kx+b</td><td style="border:1px solid #999;padding:6px">R</td><td style="border:1px solid #999;padding:6px">k>0 增，k<0 减</td><td style="border:1px solid #999;padding:6px">b=0 时为奇</td></tr>
<tr><td style="border:1px solid #999;padding:6px">y=1/x</td><td style="border:1px solid #999;padding:6px">x≠0</td><td style="border:1px solid #999;padding:6px">每个区间减</td><td style="border:1px solid #999;padding:6px">奇函数</td></tr>
<tr><td style="border:1px solid #999;padding:6px">y=x²</td><td style="border:1px solid #999;padding:6px">R</td><td style="border:1px solid #999;padding:6px">x<0 减，x>0 增</td><td style="border:1px solid #999;padding:6px">偶函数</td></tr>
<tr><td style="border:1px solid #999;padding:6px">y=2ˣ</td><td style="border:1px solid #999;padding:6px">R</td><td style="border:1px solid #999;padding:6px">恒增</td><td style="border:1px solid #999;padding:6px">非奇非偶</td></tr>
<tr><td style="border:1px solid #999;padding:6px">y=log₂x</td><td style="border:1px solid #999;padding:6px">x>0</td><td style="border:1px solid #999;padding:6px">恒增</td><td style="border:1px solid #999;padding:6px">非奇非偶</td></tr>
</table>

奇偶性判断：f(-x)=f(x) 偶函数，图像关于 y 轴对称；f(-x)=-f(x) 奇函数，图像关于原点对称。单调性判断：x₁<x₂ 时恒有 f(x₁)<f(x₂) 则增函数。

复合函数单调性"同增异减"：内外函数单调性相同则复合增，相异则复合减。',
'掌握函数三要素与奇偶性单调性',
'["函数: 定义域-对应法则-值域","奇函数原点对称，偶函数y轴对称","同增异减判断复合单调性","指数对数互为反函数"]',
'intermediate', 12, 4),

(70, 28, '三角形与全等',
'三角形的内角和恒为 180°，外角等于不相邻两内角之和。按边分类：不等边、等腰、等边；按角分类：锐角、直角、钝角。

<b>三角形重要线段与性质：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">线段</th><th style="border:1px solid #999;padding:6px">定义</th><th style="border:1px solid #999;padding:6px">关键性质</th></tr>
<tr><td style="border:1px solid #999;padding:6px">中线</td><td style="border:1px solid #999;padding:6px">顶点到对边中点</td><td style="border:1px solid #999;padding:6px">三条交于重心(2:1)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">高线</td><td style="border:1px solid #999;padding:6px">顶点垂直对边</td><td style="border:1px solid #999;padding:6px">三条交于垂心</td></tr>
<tr><td style="border:1px solid #999;padding:6px">角平分线</td><td style="border:1px solid #999;padding:6px">平分内角</td><td style="border:1px solid #999;padding:6px">三条交于内心(内切圆圆心)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">中垂线</td><td style="border:1px solid #999;padding:6px">垂直平分边</td><td style="border:1px solid #999;padding:6px">三条交于外心(外接圆圆心)</td></tr>
</table>

全等三角形判定五法：SSS、SAS、ASA、AAS、HL（直角三角形专用）。注意 SSA 不能判定全等，但 HL 本质是直角下的 SSA 特例。

三角形不等式：任意两边之和大于第三边。等腰三角形三线合一：顶角平分线、底边中线、底边高线重合。',
'掌握全等判定与三角形五心',
'["全等判定: SSS/SAS/ASA/AAS/HL","任意两边之和大于第三边","三线合一是等腰三角形王牌性质","重心分中线2:1"]',
'beginner', 12, 1),
(71, 28, '相似三角形',
'相似三角形对应角相等、对应边成比例。相似比 k，面积比=k²，周长比=k。判定三法：两角相等（AA）、两边成比例且夹角相等（SAS 相似）、三边成比例（SSS 相似）。

<b>常见相似模型：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">模型</th><th style="border:1px solid #999;padding:6px">图形特征</th><th style="border:1px solid #999;padding:6px">关键结论</th></tr>
<tr><td style="border:1px solid #999;padding:6px">A 字形</td><td style="border:1px solid #999;padding:6px">DE∥BC 且 D 在 AB 上</td><td style="border:1px solid #999;padding:6px">AD/AB=AE/AC=DE/BC</td></tr>
<tr><td style="border:1px solid #999;padding:6px">8 字形</td><td style="border:1px solid #999;padding:6px">AB∥CD 相交于 O</td><td style="border:1px solid #999;padding:6px">AO/OC=BO/OD</td></tr>
<tr><td style="border:1px solid #999;padding:6px">射影定理</td><td style="border:1px solid #999;padding:6px">直角三角形斜边上的高</td><td style="border:1px solid #999;padding:6px">CD²=AD×BD</td></tr>
<tr><td style="border:1px solid #999;padding:6px">一线三等角</td><td style="border:1px solid #999;padding:6px">同一直线上三个等角</td><td style="border:1px solid #999;padding:6px">左右两三角形相似</td></tr>
</table>

平行线分线段成比例定理：三条平行线截两条直线，所得对应线段成比例。这是相似三角形证明的基石。

黄金分割：把线段分为两部分，使长段与全段之比等于短段与长段之比，比值 φ=(1+√5)/2≈1.618。',
'掌握相似判定与成比例线段',
'["相似判定: AA/SAS/SSS","面积比等于相似比平方","射影定理: CD²=AD×BD","黄金比例约1.618"]',
'beginner', 12, 2),
(72, 28, '圆的性质',
'圆是到定点距离等于定长的点的集合。圆心角、弧、弦、弦心距四组量中有一组相等，其余三组也相等——"等对等定理"。

<b>圆的重要定理：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">定理</th><th style="border:1px solid #999;padding:6px">内容</th></tr>
<tr><td style="border:1px solid #999;padding:6px">垂径定理</td><td style="border:1px solid #999;padding:6px">垂直于弦的直径平分弦及对应两条弧</td></tr>
<tr><td style="border:1px solid #999;padding:6px">圆周角定理</td><td style="border:1px solid #999;padding:6px">同弧圆周角=圆心角一半</td></tr>
<tr><td style="border:1px solid #999;padding:6px">直径推论</td><td style="border:1px solid #999;padding:6px">直径所对圆周角是直角(90°)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">切线判定</td><td style="border:1px solid #999;padding:6px">过半径外端且垂直半径的直线是切线</td></tr>
<tr><td style="border:1px solid #999;padding:6px">切割线定理</td><td style="border:1px solid #999;padding:6px">切线长²=割线两段之积</td></tr>
<tr><td style="border:1px solid #999;padding:6px">四点共圆</td><td style="border:1px solid #999;padding:6px">对角互补则四点共圆</td></tr>
</table>

弧长公式：l=nπr/180；扇形面积：S=nπr²/360 或 S=(1/2)lr。正多边形内切圆半径 r=边心距，外接圆半径 R=中心到顶点距离。

圆与直线的位置关系：相离(d>r)、相切(d=r)、相交(d<r)，d 为圆心到直线距离。',
'掌握圆中定理与弧长面积',
'["垂径定理: 垂直于弦的直径平分弦","圆周角=圆心角的一半","直径所对圆周角为90°","弧长公式与扇形面积"]',
'beginner', 12, 3),
(73, 28, '立体几何入门',
'立体几何研究三维图形。常见几何体：棱柱、棱锥、圆柱、圆锥、球。欧拉公式：顶点数 V-棱数 E+面数 F=2。

<b>常见几何体公式表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">几何体</th><th style="border:1px solid #999;padding:6px">体积</th><th style="border:1px solid #999;padding:6px">表面积</th></tr>
<tr><td style="border:1px solid #999;padding:6px">长方体</td><td style="border:1px solid #999;padding:6px">abc</td><td style="border:1px solid #999;padding:6px">2(ab+bc+ac)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">圆柱</td><td style="border:1px solid #999;padding:6px">πr²h</td><td style="border:1px solid #999;padding:6px">2πr(r+h)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">圆锥</td><td style="border:1px solid #999;padding:6px">(1/3)πr²h</td><td style="border:1px solid #999;padding:6px">πr(l+r)，l 为母线</td></tr>
<tr><td style="border:1px solid #999;padding:6px">球</td><td style="border:1px solid #999;padding:6px">(4/3)πR³</td><td style="border:1px solid #999;padding:6px">4πR²</td></tr>
<tr><td style="border:1px solid #999;padding:6px">棱锥</td><td style="border:1px solid #999;padding:6px">(1/3)×底面积×高</td><td style="border:1px solid #999;padding:6px">各面面积之和</td></tr>
</table>

三视图：主视图、俯视图、左视图，长对正、高平齐、宽相等。由三视图还原几何体是高考重点。

空间位置关系：线线平行/相交/异面；线面平行/垂直；面面平行/垂直。判定线面垂直：直线垂直平面内两条相交直线，则线面垂直。

长方体对角线长 d=√(a²+b²+c²)。球的截面：截面是圆，半径 r=√(R²-d²)，d 为球心到截面距离。',
'掌握几何体体积表面积与三视图',
'["欧拉公式: V-E+F=2","球的体积 (4/3)πR³","线面垂直判定: 垂直两相交直线","三视图长对正高平齐宽相等"]',
'intermediate', 12, 4),

(74, 29, '三角函数定义与图像',
'三角函数的单位圆定义：设角 θ 终边上一点 P(x,y)，则 sinθ=y，cosθ=x，tanθ=y/x。弧度制：π=180°，1 弧度约为 57.3°。

<b>特殊角三角函数值表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">角度</th><th style="border:1px solid #999;padding:6px">0°</th><th style="border:1px solid #999;padding:6px">30°</th><th style="border:1px solid #999;padding:6px">45°</th><th style="border:1px solid #999;padding:6px">60°</th><th style="border:1px solid #999;padding:6px">90°</th></tr>
<tr><td style="border:1px solid #999;padding:6px">sin</td><td style="border:1px solid #999;padding:6px">0</td><td style="border:1px solid #999;padding:6px">1/2</td><td style="border:1px solid #999;padding:6px">√2/2</td><td style="border:1px solid #999;padding:6px">√3/2</td><td style="border:1px solid #999;padding:6px">1</td></tr>
<tr><td style="border:1px solid #999;padding:6px">cos</td><td style="border:1px solid #999;padding:6px">1</td><td style="border:1px solid #999;padding:6px">√3/2</td><td style="border:1px solid #999;padding:6px">√2/2</td><td style="border:1px solid #999;padding:6px">1/2</td><td style="border:1px solid #999;padding:6px">0</td></tr>
<tr><td style="border:1px solid #999;padding:6px">tan</td><td style="border:1px solid #999;padding:6px">0</td><td style="border:1px solid #999;padding:6px">√3/3</td><td style="border:1px solid #999;padding:6px">1</td><td style="border:1px solid #999;padding:6px">√3</td><td style="border:1px solid #999;padding:6px">不存在</td></tr>
</table>

记忆法：sin 值 0,1/2,√2/2,√3/2,1 对应角度 0,30,45,60,90。

y=sinx 的图像是波浪线，周期 2π，值域 [-1,1]，奇函数；y=cosx 是偶函数。五点作图法：最高点、最低点、三个平衡点。

图像变换口诀："左加右减"（平移 x），“上加下减”（平移 y），“横缩纵伸”（伸缩）。y=Asin(ωx+φ) 中 A 是振幅，ω 决定周期 T=2π/ω，φ 决定相位。',
'掌握三角函数值、图像与变换',
'["特殊角函数值表","sin周期2π，值域[-1,1]","五点作图法","y=Asin(ωx+φ)三参数意义"]',
'intermediate', 12, 1),
(75, 29, '三角恒等变换',
'三角恒等式是"化繁为简"的工具。核心公式组：

<b>常用恒等式总表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类别</th><th style="border:1px solid #999;padding:6px">公式</th></tr>
<tr><td style="border:1px solid #999;padding:6px">基本关系</td><td style="border:1px solid #999;padding:6px">sin²θ+cos²θ=1，tanθ=sinθ/cosθ</td></tr>
<tr><td style="border:1px solid #999;padding:6px">两角和差</td><td style="border:1px solid #999;padding:6px">sin(α±β)=sinαcosβ±cosαsinβ</td></tr>
<tr><td style="border:1px solid #999;padding:6px">两角和差</td><td style="border:1px solid #999;padding:6px">cos(α±β)=cosαcosβ∓sinαsinβ</td></tr>
<tr><td style="border:1px solid #999;padding:6px">二倍角</td><td style="border:1px solid #999;padding:6px">sin2α=2sinαcosα</td></tr>
<tr><td style="border:1px solid #999;padding:6px">二倍角</td><td style="border:1px solid #999;padding:6px">cos2α=cos²α-sin²α=2cos²α-1=1-2sin²α</td></tr>
<tr><td style="border:1px solid #999;padding:6px">降幂</td><td style="border:1px solid #999;padding:6px">sin²α=(1-cos2α)/2</td></tr>
<tr><td style="border:1px solid #999;padding:6px">辅助角</td><td style="border:1px solid #999;padding:6px">asinθ+bcosθ=√(a²+b²)sin(θ+φ)</td></tr>
</table>

辅助角公式 φ 的求法：tanφ=b/a，符号由 a、b 所在象限决定。它把"两个三角"合成"一个三角"，是求最值的利器。

万能公式与和差化积在竞赛常用，教材重点掌握：两角和差、二倍角、降幂、辅助角。例题：sin15°=sin(45°-30°)=(√6-√2)/4。',
'掌握和差角与二倍角公式',
'["基本关系: sin²+cos²=1","和差角公式","二倍角公式三形式","辅助角公式求最值"]',
'intermediate', 12, 2),
(76, 29, '解三角形',
'正弦定理与余弦定理是解三角形两大工具。正弦定理：a/sinA=b/sinB=c/sinC=2R，R 为外接圆半径。余弦定理：a²=b²+c²-2bc·cosA。

<b>三角形面积公式汇总：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">公式</th><th style="border:1px solid #999;padding:6px">适用条件</th></tr>
<tr><td style="border:1px solid #999;padding:6px">S=(1/2)ab·sinC</td><td style="border:1px solid #999;padding:6px">已知两边及夹角</td></tr>
<tr><td style="border:1px solid #999;padding:6px">S=√(p(p-a)(p-b)(p-c))</td><td style="border:1px solid #999;padding:6px">海伦公式，p 为半周长</td></tr>
<tr><td style="border:1px solid #999;padding:6px">S=abc/(4R)</td><td style="border:1px solid #999;padding:6px">已知三边与外接圆半径</td></tr>
<tr><td style="border:1px solid #999;padding:6px">S=(1/2)r(a+b+c)</td><td style="border:1px solid #999;padding:6px">r 为内切圆半径</td></tr>
</table>

正弦定理适用：两角一边、两边一对角（注意可能出现两解，用"大边对大角"判断）。余弦定理适用：三边、两边一夹角。

判断三角形形状：最大角 cosA>0 锐角，=0 直角，<0 钝角。边角互化：a=2RsinA 等。

实际应用：测量高度（仰角俯角）、距离（方位角）、航海（方向角）。',
'掌握正余弦定理与面积公式',
'["正弦定理 a/sinA=2R","余弦定理三边夹一角","海伦公式求面积","两边一对角注意两解"]',
'intermediate', 12, 3),
(77, 29, '平面向量',
'向量是既有大小又有方向的量。坐标表示：向量 a=(x,y)。模长 |a|=√(x²+y²)。零向量、单位向量、共线向量是基本概念。

<b>向量运算对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">运算</th><th style="border:1px solid #999;padding:6px">几何意义</th><th style="border:1px solid #999;padding:6px">坐标表示</th></tr>
<tr><td style="border:1px solid #999;padding:6px">加法</td><td style="border:1px solid #999;padding:6px">平行四边形法则</td><td style="border:1px solid #999;padding:6px">(x₁+x₂, y₁+y₂)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">减法</td><td style="border:1px solid #999;padding:6px">三角形法则</td><td style="border:1px solid #999;padding:6px">(x₁-x₂, y₁-y₂)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">数乘</td><td style="border:1px solid #999;padding:6px">伸缩向量</td><td style="border:1px solid #999;padding:6px">(λx, λy)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">数量积</td><td style="border:1px solid #999;padding:6px">投影的乘积</td><td style="border:1px solid #999;padding:6px">x₁x₂+y₁y₂</td></tr>
</table>

数量积公式：a·b=|a||b|cosθ。垂直判据 a·b=0（非零向量）；共线判据 x₁y₂-x₂y₁=0。

向量求最值、证垂直、求夹角三大应用。夹角 cosθ=(a·b)/(|a||b|)。

向量的投影：a 在 b 方向上的投影为 (a·b)/|b|。三角形重心向量：GA+GB+GC=0。',
'掌握向量运算与数量积应用',
'["数量积: 模长乘夹角余弦","垂直: 数量积为零","共线: 坐标成比例","投影公式"]',
'intermediate', 12, 4),

(78, 30, '等差数列',
'等差数列：从第二项起，每项与前一项差相等，这个差叫公差 d。通项公式 aₙ=a₁+(n-1)d，前 n 项和 Sₙ=n(a₁+aₙ)/2。

<b>等差数列核心公式：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">公式</th><th style="border:1px solid #999;padding:6px">表达式</th><th style="border:1px solid #999;padding:6px">记忆提示</th></tr>
<tr><td style="border:1px solid #999;padding:6px">通项</td><td style="border:1px solid #999;padding:6px">aₙ=a₁+(n-1)d</td><td style="border:1px solid #999;padding:6px">一次函数模型</td></tr>
<tr><td style="border:1px solid #999;padding:6px">前n项和</td><td style="border:1px solid #999;padding:6px">Sₙ=na₁+n(n-1)d/2</td><td style="border:1px solid #999;padding:6px">二次函数且常数项为0</td></tr>
<tr><td style="border:1px solid #999;padding:6px">等差中项</td><td style="border:1px solid #999;padding:6px">2aₙ=aₙ₋₁+aₙ₊₁</td><td style="border:1px solid #999;padding:6px">中间项是两端平均</td></tr>
<tr><td style="border:1px solid #999;padding:6px">间隔性质</td><td style="border:1px solid #999;padding:6px">aₙ+aₘ=aₚ+a_q 当 n+m=p+q</td><td style="border:1px solid #999;padding:6px">下标和相等</td></tr>
</table>

Sₙ 最大(小)值的求法：二次函数配方法，或找到变号项。经典题：1+2+...+100=(1+100)×100/2=5050，高斯公式。

三个数成等差可设为 a-d, a, a+d；四个数成等差设 a-3d, a-d, a+d, a+3d，简化运算。',
'掌握等差数列通项与求和',
'["通项: aₙ=a₁+(n-1)d","求和: 首尾相加乘项数除2","等差中项性质","下标和相等性质"]',
'intermediate', 12, 1),
(79, 30, '等比数列',
'等比数列：每项与前一项比值相等，公比 q。通项 aₙ=a₁·q^(n-1)。求和公式要分 q=1 与 q≠1 讨论。

<b>等差 vs 等比对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">项目</th><th style="border:1px solid #999;padding:6px">等差数列</th><th style="border:1px solid #999;padding:6px">等比数列</th></tr>
<tr><td style="border:1px solid #999;padding:6px">定义</td><td style="border:1px solid #999;padding:6px">差为常数 d</td><td style="border:1px solid #999;padding:6px">比为常数 q</td></tr>
<tr><td style="border:1px solid #999;padding:6px">通项</td><td style="border:1px solid #999;padding:6px">a₁+(n-1)d</td><td style="border:1px solid #999;padding:6px">a₁q^(n-1)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">求和</td><td style="border:1px solid #999;padding:6px">n(a₁+aₙ)/2</td><td style="border:1px solid #999;padding:6px">a₁(1-qⁿ)/(1-q)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">中项</td><td style="border:1px solid #999;padding:6px">等差中项 2b=a+c</td><td style="border:1px solid #999;padding:6px">等比中项 b²=ac</td></tr>
<tr><td style="border:1px solid #999;padding:6px">单调性</td><td style="border:1px solid #999;padding:6px">d>0 增，d<0 减</td><td style="border:1px solid #999;padding:6px">q>1 且 a₁>0 增</td></tr>
</table>

无穷等比求和（|q|<1）：S=a₁/(1-q)。例：0.999...=0.9/(1-0.1)=1，这就是 0.999...=1 的级数证明。

等比数列求和证明方法"错位相减法"是经典技巧：Sₙ-qSₙ 相减消除中间项。',
'掌握等比数列与无穷级数',
'["通项: a₁q^(n-1)","q≠1时求和公式","等比中项 b²=ac","无穷等比: a₁/(1-q)"]',
'intermediate', 12, 2),
(80, 30, '递推数列',
'递推数列由初始项与递推关系定义。常见类型与解法：

<b>递推类型解法对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">递推形式</th><th style="border:1px solid #999;padding:6px">解法</th><th style="border:1px solid #999;padding:6px">示例</th></tr>
<tr><td style="border:1px solid #999;padding:6px">aₙ₊₁=aₙ+d</td><td style="border:1px solid #999;padding:6px">等差数列直接代公式</td><td style="border:1px solid #999;padding:6px">aₙ=3n-1</td></tr>
<tr><td style="border:1px solid #999;padding:6px">aₙ₊₁=qaₙ</td><td style="border:1px solid #999;padding:6px">等比数列直接代公式</td><td style="border:1px solid #999;padding:6px">aₙ=2ⁿ</td></tr>
<tr><td style="border:1px solid #999;padding:6px">aₙ₊₁=paₙ+q</td><td style="border:1px solid #999;padding:6px">构造等比: 设aₙ₊₁-k=p(aₙ-k)</td><td style="border:1px solid #999;padding:6px">k=q/(1-p)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">aₙ₊₁/aₙ=f(n)</td><td style="border:1px solid #999;padding:6px">累乘法</td><td style="border:1px solid #999;padding:6px">连乘约分</td></tr>
<tr><td style="border:1px solid #999;padding:6px">aₙ₊₁-aₙ=f(n)</td><td style="border:1px solid #999;padding:6px">累加法</td><td style="border:1px solid #999;padding:6px">逐项相加</td></tr>
<tr><td style="border:1px solid #999;padding:6px">aₙ₊₁=aₙ+aₙ₋₁</td><td style="border:1px solid #999;padding:6px">特征方程</td><td style="border:1px solid #999;padding:6px">斐波那契</td></tr>
</table>

斐波那契数列 1,1,2,3,5,8...：后项是前两项之和，通项含黄金比例 φ。它在植物生长、黄金分割、算法复杂度中无处不在。

错位相减法求 aₙ=(2n-1)·3ⁿ 类数列和：先写出 Sₙ，再乘以公比相减。裂项相消法：1/(n(n+1))=1/n-1/(n+1)，逐项抵消。',
'掌握递推数列常见解法',
'["构造等比法解线性递推","累加累乘法","特征方程解斐波那契","裂项相消与错位相减"]',
'intermediate', 12, 3),
(81, 30, '级数与收敛',
'无穷级数是无穷数列的求和。部分和 Sₙ 有极限则级数收敛，否则发散。判断收敛是级数论的核心。

<b>常见级数收敛性表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">级数类型</th><th style="border:1px solid #999;padding:6px">形式</th><th style="border:1px solid #999;padding:6px">收敛条件</th><th style="border:1px solid #999;padding:6px">和</th></tr>
<tr><td style="border:1px solid #999;padding:6px">几何级数</td><td style="border:1px solid #999;padding:6px">Σaqⁿ</td><td style="border:1px solid #999;padding:6px">|q|<1</td><td style="border:1px solid #999;padding:6px">a/(1-q)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">调和级数</td><td style="border:1px solid #999;padding:6px">Σ1/n</td><td style="border:1px solid #999;padding:6px">永远发散</td><td style="border:1px solid #999;padding:6px">无</td></tr>
<tr><td style="border:1px solid #999;padding:6px">p-级数</td><td style="border:1px solid #999;padding:6px">Σ1/nᵖ</td><td style="border:1px solid #999;padding:6px">p>1</td><td style="border:1px solid #999;padding:6px">ζ(p) 黎曼zeta</td></tr>
<tr><td style="border:1px solid #999;padding:6px">交错级数</td><td style="border:1px solid #999;padding:6px">Σ(-1)ⁿaₙ</td><td style="border:1px solid #999;padding:6px">aₙ递减趋于0</td><td style="border:1px solid #999;padding:6px">莱布尼茨判别</td></tr>
</table>

必要条件：若级数收敛则通项趋于 0。注意通项趋于 0 只是必要不充分（调和级数反例）。

泰勒级数把函数展开成幂级数：eˣ=1+x+x²/2!+x³/3!+... 对一切 x 收敛。sinx=x-x³/3!+x⁵/5!-... 交错收敛。

芝诺悖论：兔子追乌龟 0.9+0.09+0.009+...=1，有限时间里追上——几何级数收敛的哲学意义。',
'掌握级数收敛判据',
'["几何级数|q|<1收敛","调和级数发散","p级数p>1收敛","泰勒展开eˣ与sinx"]',
'advanced', 12, 4),

(82, 31, '古典概型与条件概率',
'古典概型：样本空间有限且等可能，P(A)=有利结果数/总数。掷骰子、抽卡片都是古典概型。组合数 C(n,k) 计算有利情况。

<b>概率模型对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">模型</th><th style="border:1px solid #999;padding:6px">特征</th><th style="border:1px solid #999;padding:6px">示例</th></tr>
<tr><td style="border:1px solid #999;padding:6px">古典概型</td><td style="border:1px solid #999;padding:6px">有限等可能</td><td style="border:1px solid #999;padding:6px">掷骰子</td></tr>
<tr><td style="border:1px solid #999;padding:6px">几何概型</td><td style="border:1px solid #999;padding:6px">测度(长度/面积)比</td><td style="border:1px solid #999;padding:6px">飞镖中靶</td></tr>
<tr><td style="border:1px solid #999;padding:6px">条件概率</td><td style="border:1px solid #999;padding:6px">P(B|A)=P(AB)/P(A)</td><td style="border:1px solid #999;padding:6px">已知发烧查感冒</td></tr>
<tr><td style="border:1px solid #999;padding:6px">独立事件</td><td style="border:1px solid #999;padding:6px">P(AB)=P(A)P(B)</td><td style="border:1px solid #999;padding:6px">两次抛硬币</td></tr>
</table>

条件概率是贝叶斯的基础。乘法公式：P(AB)=P(A)P(B|A)。全概率公式：P(B)=ΣP(Aᵢ)P(B|Aᵢ)，用于分情况讨论。

经典例题：两枚骰子点数之和为 7 的概率。总数 36，和为 7 的组合 (1,6),(2,5),(3,4),(4,3),(5,2),(6,1) 共 6 种，P=6/36=1/6。',
'掌握古典概型与条件概率',
'["古典概型: 有利/总数","条件概率公式","独立事件概率相乘","全概率公式分情况"]',
'intermediate', 12, 1),
(83, 31, '随机变量与分布',
'随机变量把试验结果映射为数字。离散型取值可列，连续型取值连续。分布列/概率密度描述取值规律。

<b>常用分布对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">分布</th><th style="border:1px solid #999;padding:6px">适用场景</th><th style="border:1px solid #999;padding:6px">期望</th><th style="border:1px solid #999;padding:6px">方差</th></tr>
<tr><td style="border:1px solid #999;padding:6px">两点分布</td><td style="border:1px solid #999;padding:6px">一次成功/失败</td><td style="border:1px solid #999;padding:6px">p</td><td style="border:1px solid #999;padding:6px">p(1-p)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">二项分布 B(n,p)</td><td style="border:1px solid #999;padding:6px">n次独立试验成功次数</td><td style="border:1px solid #999;padding:6px">np</td><td style="border:1px solid #999;padding:6px">np(1-p)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">泊松分布</td><td style="border:1px solid #999;padding:6px">稀有事件计数</td><td style="border:1px solid #999;padding:6px">λ</td><td style="border:1px solid #999;padding:6px">λ</td></tr>
<tr><td style="border:1px solid #999;padding:6px">均匀分布</td><td style="border:1px solid #999;padding:6px">区间内等可能</td><td style="border:1px solid #999;padding:6px">(a+b)/2</td><td style="border:1px solid #999;padding:6px">(b-a)²/12</td></tr>
<tr><td style="border:1px solid #999;padding:6px">正态分布</td><td style="border:1px solid #999;padding:6px">大量自然现象</td><td style="border:1px solid #999;padding:6px">μ</td><td style="border:1px solid #999;padding:6px">σ²</td></tr>
</table>

期望 E(X)=Σx·P(x) 是加权平均；方差 D(X)=E(X²)-E(X)² 衡量波动。性质：E(aX+b)=aE(X)+b，D(aX+b)=a²D(X)。

正态分布 68-95-99.7 法则：μ±σ 内 68%，μ±2σ 内 95%，μ±3σ 内 99.7%。标准化：Z=(X-μ)/σ。

中心极限定理：大量独立同分布随机变量之和近似正态——它是统计推断的理论基石。',
'掌握分布列、期望方差与正态分布',
'["二项分布B(n,p): 期望np","泊松分布期望=方差=λ","期望线性性质","68-95-99.7法则"]',
'intermediate', 12, 2),
(84, 31, '贝叶斯定理',
'贝叶斯定理是在已知结果时反推原因：P(A|B)=P(B|A)P(A)/P(B)。先验概率 P(A)，后验概率 P(A|B)。

<b>贝叶斯应用场景表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">场景</th><th style="border:1px solid #999;padding:6px">先验</th><th style="border:1px solid #999;padding:6px">似然</th><th style="border:1px solid #999;padding:6px">后验</th></tr>
<tr><td style="border:1px solid #999;padding:6px">医学检测</td><td style="border:1px solid #999;padding:6px">患病率 1%</td><td style="border:1px solid #999;padding:6px">检出率 99%</td><td style="border:1px solid #999;padding:6px">阳性者真患病概率</td></tr>
<tr><td style="border:1px solid #999;padding:6px">垃圾邮件</td><td style="border:1px solid #999;padding:6px">垃圾邮件比例</td><td style="border:1px solid #999;padding:6px">单词出现频率</td><td style="border:1px solid #999;padding:6px">含"中奖"词的垃圾概率</td></tr>
<tr><td style="border:1px solid #999;padding:6px">AI推荐</td><td style="border:1px solid #999;padding:6px">历史行为分布</td><td style="border:1px solid #999;padding:6px">特征条件概率</td><td style="border:1px solid #999;padding:6px">点击概率估计</td></tr>
</table>

经典医学题：患病率 1%，检测敏感度 99%，假阳性率 5%。检测阳性，真实患病概率 P(病|阳)=0.99×0.01/(0.99×0.01+0.05×0.99)≈16.7%。直觉远低于 99%！

这个例子揭示：低先验概率下，阳性结果大多来自假阳性。贝叶斯强调用先验修正直觉。

朴素贝叶斯分类器假设特征条件独立，是垃圾邮件过滤、情感分析的主力算法，训练快、效果稳定。',
'掌握贝叶斯公式与反直觉结论',
'["后验=先验×似然/证据","低患病率下阳性多为假阳性","先验概率决定结果","朴素贝叶斯用于文本分类"]',
'intermediate', 12, 3),
(85, 31, '大数定律与中心极限定理',
'大数定律说"频率稳定于概率"，是统计学的第一块基石。中心极限定理说"均值分布趋于正态"，是第二块基石。

<b>四大经典极限定理对比：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">定理</th><th style="border:1px solid #999;padding:6px">结论</th><th style="border:1px solid #999;padding:6px">直观理解</th></tr>
<tr><td style="border:1px solid #999;padding:6px">伯努利大数定律</td><td style="border:1px solid #999;padding:6px">频率依概率收敛于概率</td><td style="border:1px solid #999;padding:6px">抛硬币次数多则正面率近1/2</td></tr>
<tr><td style="border:1px solid #999;padding:6px">切比雪夫大数定律</td><td style="border:1px solid #999;padding:6px">均值依概率收敛于期望</td><td style="border:1px solid #999;padding:6px">样本均值接近总体均值</td></tr>
<tr><td style="border:1px solid #999;padding:6px">辛钦大数定律</td><td style="border:1px solid #999;padding:6px">独立同分布均值收敛</td><td style="border:1px solid #999;padding:6px">测量多次取平均更准</td></tr>
<tr><td style="border:1px solid #999;padding:6px">中心极限定理</td><td style="border:1px solid #999;padding:6px">均值分布近似正态</td><td style="border:1px solid #999;padding:6px">n≥30 即可用正态近似</td></tr>
</table>

大数定律的意义：赌博长期必输（赌场稳赚的数学原理）、保险定价、民意调查样本推断总体。

切比雪夫不等式：P(|X-μ|≥ε) ≤ σ²/ε²，无需知道分布就能界住概率。用它可估计任何分布的尾部概率。

蒙特卡洛方法：用随机数模拟求数值解。π 的估算：随机撒点落入单位圆的比例×4。大数定律保证随点数增加越来越准。',
'掌握两大定理与蒙特卡洛',
'["频率收敛于概率","样本均值近似正态(n≥30)","切比雪夫不等式","蒙特卡洛模拟原理"]',
'intermediate', 12, 4),

(86, 32, '集合论基础',
'集合是数学的语言基础。元素与集合属于关系 ∈；集合间包含 ⊆。空集是任何集合的子集。

<b>集合运算对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">运算</th><th style="border:1px solid #999;padding:6px">符号</th><th style="border:1px solid #999;padding:6px">含义</th><th style="border:1px solid #999;padding:6px">性质</th></tr>
<tr><td style="border:1px solid #999;padding:6px">并集</td><td style="border:1px solid #999;padding:6px">A∪B</td><td style="border:1px solid #999;padding:6px">至少属于一个</td><td style="border:1px solid #999;padding:6px">|A∪B|=|A|+|B|-|A∩B|</td></tr>
<tr><td style="border:1px solid #999;padding:6px">交集</td><td style="border:1px solid #999;padding:6px">A∩B</td><td style="border:1px solid #999;padding:6px">同时属于两个</td><td style="border:1px solid #999;padding:6px">交换律结合律</td></tr>
<tr><td style="border:1px solid #999;padding:6px">差集</td><td style="border:1px solid #999;padding:6px">A-B</td><td style="border:1px solid #999;padding:6px">属于A不属于B</td><td style="border:1px solid #999;padding:6px">A-B=A∩Bᶜ</td></tr>
<tr><td style="border:1px solid #999;padding:6px">补集</td><td style="border:1px solid #999;padding:6px">Aᶜ</td><td style="border:1px solid #999;padding:6px">全集中不含A的</td><td style="border:1px solid #999;padding:6px">(Aᶜ)ᶜ=A</td></tr>
<tr><td style="border:1px solid #999;padding:6px">笛卡尔积</td><td style="border:1px solid #999;padding:6px">A×B</td><td style="border:1px solid #999;padding:6px">有序对集合</td><td style="border:1px solid #999;padding:6px">|A×B|=|A||B|</td></tr>
</table>

德摩根律：¬(A∪B)=¬A∩¬B，¬(A∩B)=¬A∪¬B。补集思想常用来"正难则反"。

关系是子集：A 上的二元关系 R⊆A×A。等价关系（自反、对称、传递）把集合划分成等价类。偏序关系（自反、反对称、传递）形成偏序集。

子集个数：n 元集合有 2ⁿ 个子集，2ⁿ-1 个非空子集。',
'掌握集合运算与关系',
'["容斥原理: |A∪B|=|A|+|B|-|A∩B|","德摩根律","等价关系三分性","n元集合2ⁿ个子集"]',
'intermediate', 12, 1),
(87, 32, '图论入门',
'图 G=(V,E) 由顶点集 V 和边集 E 组成。有向图边有方向，无向图没有。度：顶点连的边数，握手定理 Σdeg(v)=2|E|。

<b>图论基础概念表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">概念</th><th style="border:1px solid #999;padding:6px">定义</th><th style="border:1px solid #999;padding:6px">典型应用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">路径/回路</td><td style="border:1px solid #999;padding:6px">顶点序列，边首尾相接</td><td style="border:1px solid #999;padding:6px">导航路线</td></tr>
<tr><td style="border:1px solid #999;padding:6px">连通性</td><td style="border:1px solid #999;padding:6px">任意两点有路径</td><td style="border:1px solid #999;padding:6px">网络连通检查</td></tr>
<tr><td style="border:1px solid #999;padding:6px">树</td><td style="border:1px solid #999;padding:6px">连通无回路图</td><td style="border:1px solid #999;padding:6px">文件系统、DOM</td></tr>
<tr><td style="border:1px solid #999;padding:6px">生成树</td><td style="border:1px solid #999;padding:6px">包含所有顶点的树</td><td style="border:1px solid #999;padding:6px">网络布线</td></tr>
<tr><td style="border:1px solid #999;padding:6px">二分图</td><td style="border:1px solid #999;padding:6px">顶点分两族，边跨族</td><td style="border:1px solid #999;padding:6px">匹配问题</td></tr>
</table>

欧拉回路：一笔画问题。无向图有欧拉回路的充要条件：连通且所有顶点度为偶数。七桥问题因此无解。

树的性质：n 个顶点恰有 n-1 条边；任意两顶点唯一路径；叶结点是度 1 的顶点。

最短路径算法：Dijkstra（非负权）、Bellman-Ford（含负权）、Floyd（全源）。Dijkstra 用贪心思想，每步选最近未访问顶点。',
'掌握图的基本概念与欧拉回路',
'["握手定理: 度之和=2倍边数","欧拉回路: 所有顶点偶度","树: n-1条边","Dijkstra最短路径"]',
'intermediate', 12, 2),
(88, 32, '数理逻辑',
'数理逻辑用符号化语言研究推理。命题是可判真假的陈述句。逻辑联结词：¬非，∧且，∨或，→蕴含，↔等价。

<b>真值表（p→q 蕴含）：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">p</th><th style="border:1px solid #999;padding:6px">q</th><th style="border:1px solid #999;padding:6px">p→q</th><th style="border:1px solid #999;padding:6px">解释</th></tr>
<tr><td style="border:1px solid #999;padding:6px">真</td><td style="border:1px solid #999;padding:6px">真</td><td style="border:1px solid #999;padding:6px">真</td><td style="border:1px solid #999;padding:6px">前提真结论真，合理</td></tr>
<tr><td style="border:1px solid #999;padding:6px">真</td><td style="border:1px solid #999;padding:6px">假</td><td style="border:1px solid #999;padding:6px">假</td><td style="border:1px solid #999;padding:6px">前提真结论假，命题为假</td></tr>
<tr><td style="border:1px solid #999;padding:6px">假</td><td style="border:1px solid #999;padding:6px">真</td><td style="border:1px solid #999;padding:6px">真</td><td style="border:1px solid #999;padding:6px">前提假结论任意</td></tr>
<tr><td style="border:1px solid #999;padding:6px">假</td><td style="border:1px solid #999;padding:6px">假</td><td style="border:1px solid #999;padding:6px">真</td><td style="border:1px solid #999;padding:6px">空真(vacuous truth)</td></tr>
</table>

蕴含"假前提推出一切"是初学难点："如果1+1=3，那么月亮是奶酪做的"为真命题。

推理规则：假言推理（MP）p→q 且 p，则 q；拒取式（MT）p→q 且 ¬q，则 ¬p；三段论。

量化词：∀任意，∃存在。∀xP(x) 的否定是 ∃x¬P(x)。量词否定口诀："任意变存在，存在变任意，谓词取反"。',
'掌握命题逻辑与推理规则',
'["蕴含真值表: 假前提空真","假言推理MP与拒取式MT","量词否定变号","三段论推理"]',
'intermediate', 12, 3),
(89, 32, '图与网络算法',
'图算法解决现实网络问题：路径规划、社交网络、任务调度。邻接矩阵与邻接表是两种存储方式，邻接表省空间。

<b>图遍历与搜索算法表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">算法</th><th style="border:1px solid #999;padding:6px">思想</th><th style="border:1px solid #999;padding:6px">复杂度</th><th style="border:1px solid #999;padding:6px">应用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">BFS 广度优先</td><td style="border:1px solid #999;padding:6px">队列逐层扩展</td><td style="border:1px solid #999;padding:6px">O(V+E)</td><td style="border:1px solid #999;padding:6px">最短路径(无权)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">DFS 深度优先</td><td style="border:1px solid #999;padding:6px">栈递归深入</td><td style="border:1px solid #999;padding:6px">O(V+E)</td><td style="border:1px solid #999;padding:6px">连通分量、拓扑排序</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Dijkstra</td><td style="border:1px solid #999;padding:6px">贪心+优先队列</td><td style="border:1px solid #999;padding:6px">O(E log V)</td><td style="border:1px solid #999;padding:6px">非负权最短路径</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Prim/Kruskal</td><td style="border:1px solid #999;padding:6px">最小生成树</td><td style="border:1px solid #999;padding:6px">O(E log V)</td><td style="border:1px solid #999;padding:6px">网络最低成本布线</td></tr>
<tr><td style="border:1px solid #999;padding:6px">拓扑排序</td><td style="border:1px solid #999;padding:6px">DAG 线性序</td><td style="border:1px solid #999;padding:6px">O(V+E)</td><td style="border:1px solid #999;padding:6px">课程依赖安排</td></tr>
</table>

Dijkstra 不能处理负权边，Bellman-Ford 可以，代价是 O(VE)。Floyd 算法 O(V³) 求所有点对最短距离，实现极简三重循环。

最小生成树两种算法：Prim 从点出发贪心，Kruskal 从边出发并查集。都基于"安全边"定理。

实际案例：地图导航用 Dijkstra+A*启发式；社交网络六度分隔用 BFS；依赖管理用拓扑排序。',
'掌握图算法与复杂度',
'["BFS/DFS复杂度O(V+E)","Dijkstra不能处理负权","Prim/Kruskal最小生成树","拓扑排序处理依赖"]',
'advanced', 12, 4),

(90, 33, '建模流程与线性规划',
'数学建模四步：提出问题→建立模型→求解→验证。线性规划是建模入门，目标函数与约束均为线性。

<b>建模七步流程表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">步骤</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">常见陷阱</th></tr>
<tr><td style="border:1px solid #999;padding:6px">1 问题理解</td><td style="border:1px solid #999;padding:6px">明确目标与约束</td><td style="border:1px solid #999;padding:6px">目标含糊</td></tr>
<tr><td style="border:1px solid #999;padding:6px">2 变量定义</td><td style="border:1px solid #999;padding:6px">设决策变量</td><td style="border:1px solid #999;padding:6px">变量过多过少</td></tr>
<tr><td style="border:1px solid #999;padding:6px">3 建立目标函数</td><td style="border:1px solid #999;padding:6px">最大化或最小化</td><td style="border:1px solid #999;padding:6px">量纲不一致</td></tr>
<tr><td style="border:1px solid #999;padding:6px">4 列出约束</td><td style="border:1px solid #999;padding:6px">资源限制不等式</td><td style="border:1px solid #999;padding:6px">漏掉非负约束</td></tr>
<tr><td style="border:1px solid #999;padding:6px">5 求解</td><td style="border:1px solid #999;padding:6px">图解法/单纯形/软件</td><td style="border:1px solid #999;padding:6px">数值不稳定</td></tr>
<tr><td style="border:1px solid #999;padding:6px">6 验证</td><td style="border:1px solid #999;padding:6px">代回检验合理性</td><td style="border:1px solid #999;padding:6px">边界情形</td></tr>
<tr><td style="border:1px solid #999;padding:6px">7 应用迭代</td><td style="border:1px solid #999;padding:6px">部署与调参</td><td style="border:1px solid #999;padding:6px">过拟合数据</td></tr>
</table>

线性规划图解法：约束画可行域，目标函数平移找最优顶点。最优解必在顶点取得（线性函数在凸集上极值在端点）。

典型问题：运输问题（最小运费）、生产计划（最大利润）、配餐问题（最低成本营养达标）。

Python 实现用 scipy.optimize.linprog 或 pulp，几行代码求解大型线性规划。',
'掌握建模流程与线性规划',
'["建模七步流程","可行域顶点取最优","单纯形法思想","scipy求解线性规划"]',
'advanced', 12, 1),
(91, 33, '微分方程建模',
'微分方程描述"变化率"与"状态"的关系，是物理学、经济学、生物学的共同语言。一阶线性微分方程 dy/dx+py=q 用积分因子法解。

<b>经典微分方程模型表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">模型</th><th style="border:1px solid #999;padding:6px">方程</th><th style="border:1px solid #999;padding:6px">解的形式</th><th style="border:1px solid #999;padding:6px">应用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">指数增长</td><td style="border:1px solid #999;padding:6px">dN/dt=kN</td><td style="border:1px solid #999;padding:6px">N=N₀eᵏᵗ</td><td style="border:1px solid #999;padding:6px">复利、细菌</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Logistic</td><td style="border:1px solid #999;padding:6px">dN/dt=kN(1-N/K)</td><td style="border:1px solid #999;padding:6px">S形曲线</td><td style="border:1px solid #999;padding:6px">人口、传播</td></tr>
<tr><td style="border:1px solid #999;padding:6px">牛顿冷却</td><td style="border:1px solid #999;padding:6px">dT/dt=-k(T-Tₐ)</td><td style="border:1px solid #999;padding:6px">指数逼近室温</td><td style="border:1px solid #999;padding:6px">法医定死亡时间</td></tr>
<tr><td style="border:1px solid #999;padding:6px">SIR 传染病</td><td style="border:1px solid #999;padding:6px">dI/dt=βSI-γI</td><td style="border:1px solid #999;padding:6px">数值解</td><td style="border:1px solid #999;padding:6px">疫情预测</td></tr>
<tr><td style="border:1px solid #999;padding:6px">调和振动</td><td style="border:1px solid #999;padding:6px">d²x/dt²+ω²x=0</td><td style="border:1px solid #999;padding:6px">x=A sin(ωt+φ)</td><td style="border:1px solid #999;padding:6px">弹簧、电路</td></tr>
</table>

分离变量法解可分离方程：把 y 与 dy 放一边，x 与 dx 放一边，两边积分。e.g. dN/dt=kN → dN/N=kdt → lnN=kt+C。

Logistic 模型解释"先快后慢"的增长：初期近似指数，接近环境容量 K 时趋缓。SIR 模型预测疫情峰值时间。

欧拉方法数值解：yₙ₊₁=yₙ+h·f(xₙ,yₙ)，步长 h 越小越准。Python 用 scipy.integrate.odeint 一行求解。',
'掌握微分方程建模与经典模型',
'["指数增长与Logistic模型","分离变量法","牛顿冷却定律","SIR传染病模型"]',
'advanced', 12, 2),
(92, 33, '优化与算法思维',
'优化问题：在可行域中找目标函数最优值。局部最优 vs 全局最优是核心难点，凸优化保证两者一致。

<b>优化方法分类表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">方法</th><th style="border:1px solid #999;padding:6px">适用</th><th style="border:1px solid #999;padding:6px">思想</th><th style="border:1px solid #999;padding:6px">缺点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">梯度下降</td><td style="border:1px solid #999;padding:6px">可微函数</td><td style="border:1px solid #999;padding:6px">沿负梯度走</td><td style="border:1px solid #999;padding:6px">易陷局部最优</td></tr>
<tr><td style="border:1px solid #999;padding:6px">牛顿法</td><td style="border:1px solid #999;padding:6px">二阶光滑</td><td style="border:1px solid #999;padding:6px">用Hessian加速</td><td style="border:1px solid #999;padding:6px">Hessian难算</td></tr>
<tr><td style="border:1px solid #999;padding:6px">模拟退火</td><td style="border:1px solid #999;padding:6px">离散组合</td><td style="border:1px solid #999;padding:6px">概率接受劣解跳出</td><td style="border:1px solid #999;padding:6px">参数敏感</td></tr>
<tr><td style="border:1px solid #999;padding:6px">遗传算法</td><td style="border:1px solid #999;padding:6px">多峰搜索</td><td style="border:1px solid #999;padding:6px">种群进化选择交叉</td><td style="border:1px solid #999;padding:6px">收敛慢</td></tr>
<tr><td style="border:1px solid #999;padding:6px">动态规划</td><td style="border:1px solid #999;padding:6px">最优子结构</td><td style="border:1px solid #999;padding:6px">备忘录+递推</td><td style="border:1px solid #999;padding:6px">状态爆炸</td></tr>
</table>

贪心 vs 动态规划：贪心每步局部最优（适合活动选择、哈夫曼编码）；DP 考虑全局状态转移（背包、编辑距离）。

背包问题 DP：dp[i][w]=max(dp[i-1][w], dp[i-1][w-wi]+vi)。状态定义、转移方程、初始化、边界是 DP 四件套。

复杂度思维：O(1)<O(log n)<O(n)<O(n log n)<O(n²)<O(2ⁿ)。百万级数据用 O(n log n)，亿级用 O(n log n) 或 O(n)。',
'掌握优化方法分类与DP',
'["凸问题局部=全局最优","梯度下降与模拟退火","DP状态转移四件套","复杂度量级排序"]',
'advanced', 12, 3),
(93, 33, 'Python数学实战',
'用 Python 解决数学问题，从数值计算到符号运算。NumPy 做数组运算，SciPy 做科学计算，SymPy 做符号推导，matplotlib 画图。

<b>Python 数学库速查表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">库</th><th style="border:1px solid #999;padding:6px">用途</th><th style="border:1px solid #999;padding:6px">常用函数</th></tr>
<tr><td style="border:1px solid #999;padding:6px">numpy</td><td style="border:1px solid #999;padding:6px">数组与向量化</td><td style="border:1px solid #999;padding:6px">np.array, np.dot, np.linalg</td></tr>
<tr><td style="border:1px solid #999;padding:6px">scipy</td><td style="border:1px solid #999;padding:6px">积分/优化/ODE</td><td style="border:1px solid #999;padding:6px">quad, optimize, odeint</td></tr>
<tr><td style="border:1px solid #999;padding:6px">sympy</td><td style="border:1px solid #999;padding:6px">符号运算</td><td style="border:1px solid #999;padding:6px">simplify, solve, diff, integrate</td></tr>
<tr><td style="border:1px solid #999;padding:6px">matplotlib</td><td style="border:1px solid #999;padding:6px">可视化</td><td style="border:1px solid #999;padding:6px">plt.plot, scatter, subplots</td></tr>
</table>

例：用 sympy 解方程 x²-5x+6=0：sympy.solve 返回 [2, 3]。用 scipy.integrate.quad 计算 ∫₀¹ x²dx=1/3。

蒙特卡洛估算 π 的代码：随机撒 N 点，统计落单位圆内比例乘 4，N 越大越接近 3.14159。

实战项目建议：用 NumPy 实现线性回归最小二乘、用 scipy 解 Logistic 人口模型、用 matplotlib 画函数图像研究单调性。',
'掌握Python数学三件套',
'["NumPy向量化计算","SciPy积分与优化","SymPy符号推导","蒙特卡洛模拟"]',
'advanced', 12, 4),

(94, 34, '图表类型与视觉编码',
'数据可视化是用图形讲数据。选对图表类型是第一步，视觉编码是核心理论。

<b>图表选型对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">数据关系</th><th style="border:1px solid #999;padding:6px">推荐图表</th><th style="border:1px solid #999;padding:6px">示例场景</th></tr>
<tr><td style="border:1px solid #999;padding:6px">趋势变化</td><td style="border:1px solid #999;padding:6px">折线图</td><td style="border:1px solid #999;padding:6px">股价、气温</td></tr>
<tr><td style="border:1px solid #999;padding:6px">类别比较</td><td style="border:1px solid #999;padding:6px">柱状图</td><td style="border:1px solid #999;padding:6px">各省GDP</td></tr>
<tr><td style="border:1px solid #999;padding:6px">占比构成</td><td style="border:1px solid #999;padding:6px">饼图/环形图</td><td style="border:1px solid #999;padding:6px">预算分配</td></tr>
<tr><td style="border:1px solid #999;padding:6px">分布形态</td><td style="border:1px solid #999;padding:6px">直方图/箱线图</td><td style="border:1px solid #999;padding:6px">成绩分布</td></tr>
<tr><td style="border:1px solid #999;padding:6px">两变量关系</td><td style="border:1px solid #999;padding:6px">散点图</td><td style="border:1px solid #999;padding:6px">身高体重</td></tr>
<tr><td style="border:1px solid #999;padding:6px">地理分布</td><td style="border:1px solid #999;padding:6px">地图/热力图</td><td style="border:1px solid #999;padding:6px">疫情分布</td></tr>
</table>

视觉编码原则：位置>长度>面积>颜色。人眼对位置最敏感，对面积最迟钝——所以柱状图优于饼图传达精确值。

配色原则：离散用不同色相，连续用渐变色；红绿色盲友好建议用蓝橙；避免彩虹色。

常见坑：3D 图表扭曲感知、截断坐标轴夸大差异、双轴误导对比、饼图超过 6 类难读。',
'掌握图表选型与视觉编码',
'["位置是最强视觉编码","折线看趋势柱状比大小","避免3D与截断轴","连续数据用渐变配色"]',
'beginner', 12, 1),
(95, 34, 'Python绘图实战',
'Python 三剑客画图：matplotlib 基础、seaborn 统计美化、plotly 交互。基础语法 plt.plot(x, y) 即可出图。

<b>matplotlib 核心 API 表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">函数</th><th style="border:1px solid #999;padding:6px">作用</th><th style="border:1px solid #999;padding:6px">参数</th></tr>
<tr><td style="border:1px solid #999;padding:6px">plt.plot</td><td style="border:1px solid #999;padding:6px">折线图</td><td style="border:1px solid #999;padding:6px">label, color, linestyle</td></tr>
<tr><td style="border:1px solid #999;padding:6px">plt.bar</td><td style="border:1px solid #999;padding:6px">柱状图</td><td style="border:1px solid #999;padding:6px">width, color, bottom</td></tr>
<tr><td style="border:1px solid #999;padding:6px">plt.scatter</td><td style="border:1px solid #999;padding:6px">散点图</td><td style="border:1px solid #999;padding:6px">s 点大小, c 颜色</td></tr>
<tr><td style="border:1px solid #999;padding:6px">plt.hist</td><td style="border:1px solid #999;padding:6px">直方图</td><td style="border:1px solid #999;padding:6px">bins 分箱</td></tr>
<tr><td style="border:1px solid #999;padding:6px">plt.title/xlabel</td><td style="border:1px solid #999;padding:6px">标题坐标轴</td><td style="border:1px solid #999;padding:6px">fontsize</td></tr>
<tr><td style="border:1px solid #999;padding:6px">plt.legend</td><td style="border:1px solid #999;padding:6px">图例</td><td style="border:1px solid #999;padding:6px">loc 位置</td></tr>
<tr><td style="border:1px solid #999;padding:6px">plt.savefig</td><td style="border:1px solid #999;padding:6px">保存图片</td><td style="border:1px solid #999;padding:6px">dpi 清晰度</td></tr>
</table>

中文字体问题：plt.rcParams[font.sans-serif] 设 SimHei 等字体，否则中文显示方框。设置 axes.unicode_minus=False 解决负号。

seaborn 一行出统计图：sns.histplot 带密度曲线，sns.boxplot 看离群点，sns.heatmap 画相关性矩阵。

实战：读 CSV 数据→pandas 清洗→matplotlib 出图→保存 PNG。代码风格用 pyplot 函数式还是面向对象（fig, ax）均可。',
'掌握matplotlib与seaborn',
'["plt.plot/bar/scatter/hist","中文字体配置","seaborn统计图","savefig保存"]',
'beginner', 12, 2),
(96, 34, '数据分析与报告',
'数据报告流程：明确问题→收集→清洗→分析→可视化→结论。每一步都有方法论。

<b>数据分析流程表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">阶段</th><th style="border:1px solid #999;padding:6px">任务</th><th style="border:1px solid #999;padding:6px">工具/方法</th></tr>
<tr><td style="border:1px solid #999;padding:6px">清洗</td><td style="border:1px solid #999;padding:6px">缺失值/重复/异常</td><td style="border:1px solid #999;padding:6px">pandas dropna/fillna</td></tr>
<tr><td style="border:1px solid #999;padding:6px">描述统计</td><td style="border:1px solid #999;padding:6px">均值中位数方差</td><td style="border:1px solid #999;padding:6px">describe()</td></tr>
<tr><td style="border:1px solid #999;padding:6px">探索分析</td><td style="border:1px solid #999;padding:6px">找关系与模式</td><td style="border:1px solid #999;padding:6px">相关矩阵、分组对比</td></tr>
<tr><td style="border:1px solid #999;padding:6px">推断</td><td style="border:1px solid #999;padding:6px">样本推断总体</td><td style="border:1px solid #999;padding:6px">置信区间、假设检验</td></tr>
<tr><td style="border:1px solid #999;padding:6px">呈现</td><td style="border:1px solid #999;padding:6px">讲清结论</td><td style="border:1px solid #999;padding:6px">图表+摘要+建议</td></tr>
</table>

缺失值处理三策略：删除（缺失多）、填充（均值/中位数/前后值）、插值。异常值：3σ 原则、箱线图 1.5IQR 规则。

讲故事结构：背景→问题→数据→分析→发现→建议。每个结论必须配证据（图表或统计量），避免"我觉得"。

对比分析常用：同比环比、分组对比、基准对比。多维度：时间×地区×品类钻取（上卷下钻）。',
'掌握数据分析全流程',
'["清洗三策略: 删/填/插","描述统计四件套","讲故事六段式","3σ与箱线图找异常"]',
'intermediate', 12, 3),
(97, 34, 'BI工具与仪表盘',
'BI（商业智能）工具把数据变成决策仪表盘。主流工具：Power BI、Tableau、ECharts（前端）、Grafana（运维监控）。

<b>BI 工具对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">工具</th><th style="border:1px solid #999;padding:6px">定位</th><th style="border:1px solid #999;padding:6px">优点</th><th style="border:1px solid #999;padding:6px">适用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">Power BI</td><td style="border:1px solid #999;padding:6px">微软生态 BI</td><td style="border:1px solid #999;padding:6px">Excel 无缝集成</td><td style="border:1px solid #999;padding:6px">企业报表</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Tableau</td><td style="border:1px solid #999;padding:6px">可视化优先</td><td style="border:1px solid #999;padding:6px">拖拽即分析</td><td style="border:1px solid #999;padding:6px">探索分析</td></tr>
<tr><td style="border:1px solid #999;padding:6px">ECharts</td><td style="border:1px solid #999;padding:6px">前端图表库</td><td style="border:1px solid #999;padding:6px">免费可定制交互</td><td style="border:1px solid #999;padding:6px">Web 应用</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Grafana</td><td style="border:1px solid #999;padding:6px">监控可视化</td><td style="border:1px solid #999;padding:6px">实时刷新告警</td><td style="border:1px solid #999;padding:6px">运维监控</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Superset</td><td style="border:1px solid #999;padding:6px">开源 BI</td><td style="border:1px solid #999;padding:6px">SQL 驱动免费</td><td style="border:1px solid #999;padding:6px">数据团队</td></tr>
</table>

仪表盘设计四原则：最重要的放左上、一屏讲一个故事、KPI 数字放顶部、图表保持自解释（标题即结论）。

ECharts 五分钟上手：引入 echarts.min.js，init 容器，setOption 配置 series 数据。折线+柱状组合图覆盖多数报表场景。

KPI 指标体系：北极星指标（如 DAU）、过程指标（转化率）、结果指标（营收）。仪表盘要区分监控型与决策型。',
'掌握BI工具与仪表盘设计',
'["Power BI/Tableau/ECharts对比","左上角放最重要信息","图表标题即结论","北极星指标体系"]',
'intermediate', 12, 4),

(98, 35, '大数据技术栈',
'大数据处理"存不下、算不动、传不快"三大问题。Hadoop 生态是事实标准：HDFS 存储、MapReduce 计算、YARN 调度。

<b>大数据组件对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">组件</th><th style="border:1px solid #999;padding:6px">功能</th><th style="border:1px solid #999;padding:6px">替代/升级</th></tr>
<tr><td style="border:1px solid #999;padding:6px">HDFS</td><td style="border:1px solid #999;padding:6px">分布式文件系统</td><td style="border:1px solid #999;padding:6px">对象存储 OSS/S3</td></tr>
<tr><td style="border:1px solid #999;padding:6px">MapReduce</td><td style="border:1px solid #999;padding:6px">批处理计算</td><td style="border:1px solid #999;padding:6px">Spark(快100倍)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Hive</td><td style="border:1px solid #999;padding:6px">SQL 查 HDFS</td><td style="border:1px solid #999;padding:6px">SparkSQL、Presto</td></tr>
<tr><td style="border:1px solid #999;padding:6px">HBase</td><td style="border:1px solid #999;padding:6px">列式 NoSQL</td><td style="border:1px solid #999;padding:6px">Cassandra</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Kafka</td><td style="border:1px solid #999;padding:6px">消息队列/流</td><td style="border:1px solid #999;padding:6px">Pulsar、RocketMQ</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Flink</td><td style="border:1px solid #999;padding:6px">实时流计算</td><td style="border:1px solid #999;padding:6px">Storm</td></tr>
</table>

MapReduce 思想：Map 阶段并行处理每份数据输出键值对，Shuffle 按 key 分组，Reduce 汇总。WordCount 是 Hello World。

数据仓库分层：ODS 原始层、DWD 明细层、DWS 汇总层、ADS 应用层。维度建模用星型模型：事实表+维度表。

离线 vs 实时：T+1 报表用 Hive/Spark 批处理；风控/推荐用 Flink 流处理。Lambda 架构=离线+实时两条链路。',
'掌握大数据生态组件',
'["HDFS+MapReduce+Hive三件套","Map阶段并行Reduce汇总","数仓四层架构","Flink实时 vs Spark离线"]',
'advanced', 12, 1),
(99, 35, 'SQL分析与窗口函数',
'数据分析 SQL 核心：SELECT 投影、WHERE 过滤、GROUP BY 聚合、JOIN 关联、窗口函数分析。窗口函数是进阶利器。

<b>常用聚合与窗口函数表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">函数</th><th style="border:1px solid #999;padding:6px">用途</th><th style="border:1px solid #999;padding:6px">示例</th></tr>
<tr><td style="border:1px solid #999;padding:6px">SUM/AVG/COUNT</td><td style="border:1px solid #999;padding:6px">基础聚合</td><td style="border:1px solid #999;padding:6px">SUM(sales) GROUP BY</td></tr>
<tr><td style="border:1px solid #999;padding:6px">ROW_NUMBER()</td><td style="border:1px solid #999;padding:6px">分组内排名编号</td><td style="border:1px solid #999;padding:6px">每组取Top1</td></tr>
<tr><td style="border:1px solid #999;padding:6px">RANK/DENSE_RANK</td><td style="border:1px solid #999;padding:6px">并列排名</td><td style="border:1px solid #999;padding:6px">成绩排名</td></tr>
<tr><td style="border:1px solid #999;padding:6px">LAG/LEAD</td><td style="border:1px solid #999;padding:6px">前后行取值</td><td style="border:1px solid #999;padding:6px">环比计算</td></tr>
<tr><td style="border:1px solid #999;padding:6px">SUM() OVER</td><td style="border:1px solid #999;padding:6px">累计求和</td><td style="border:1px solid #999;padding:6px">GMV 累计</td></tr>
<tr><td style="border:1px solid #999;padding:6px">NTILE(n)</td><td style="border:1px solid #999;padding:6px">分桶分位</td><td style="border:1px solid #999;padding:6px">用户分层</td></tr>
</table>

窗口函数语法：函数 OVER(PARTITION BY 分组 ORDER BY 排序)。与 GROUP BY 区别：窗口函数不合并行，每行保留。

经典面试题：连续登录 3 天用户、每组 TopN、留存率、复购率。解法都依赖窗口函数+日期处理。

SQL 优化三板斧：WHERE 过滤前置、避免 SELECT *、合理索引。慢查询先 EXPLAIN 看执行计划。',
'掌握窗口函数与SQL优化',
'["窗口函数不合并行","ROW_NUMBER取每组TopN","LAG算环比","EXPLAIN看执行计划"]',
'intermediate', 12, 2),
(100, 35, '统计学与大数推断',
'大数据时代"样本"常等于"总体"（全量数据），但推断方法仍不可少：相关性、显著性、抽样误差。

<b>统计推断核心概念表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">概念</th><th style="border:1px solid #999;padding:6px">定义</th><th style="border:1px solid #999;padding:6px">注意</th></tr>
<tr><td style="border:1px solid #999;padding:6px">总体/样本</td><td style="border:1px solid #999;padding:6px">全体 vs 抽出的部分</td><td style="border:1px solid #999;padding:6px">抽样需随机</td></tr>
<tr><td style="border:1px solid #999;padding:6px">置信区间</td><td style="border:1px solid #999;padding:6px">参数估计区间</td><td style="border:1px solid #999;padding:6px">95% 常用</td></tr>
<tr><td style="border:1px solid #999;padding:6px">p值</td><td style="border:1px solid #999;padding:6px">原假设成立的概率</td><td style="border:1px solid #999;padding:6px">不是效应大小</td></tr>
<tr><td style="border:1px solid #999;padding:6px">第一类错误</td><td style="border:1px solid #999;padding:6px">真拒绝了原假设</td><td style="border:1px solid #999;padding:6px">α=0.05</td></tr>
<tr><td style="border:1px solid #999;padding:6px">第二类错误</td><td style="border:1px solid #999;padding:6px">假接受了原假设</td><td style="border:1px solid #999;padding:6px">β 与样本量有关</td></tr>
<tr><td style="border:1px solid #999;padding:6px">相关 vs 因果</td><td style="border:1px solid #999;padding:6px">相关不等于因果</td><td style="border:1px solid #999;padding:6px">混杂变量</td></tr>
</table>

A/B 测试流程：提出假设→确定指标→算样本量→随机分流→跑周期→显著性检验（t 检验/Z 检验）。样本量公式 n=2σ²(z_α/2+z_β)²/δ²。

p 值滥用警告：p<0.05 只是门槛，还要看效应量（Cohen d）。多重比较要校正（Bonferroni、FDR）。

辛普森悖论：分组看 A 好，合起来看 B 好——混淆变量（如时段、渠道）导致。大数据分析必须警惕。',
'掌握推断统计与A/B测试',
'["置信区间与p值","A/B测试完整流程","相关不等于因果","辛普森悖论"]',
'advanced', 12, 3),
(101, 35, '数据科学实战项目',
'完整数据项目：业务理解→数据获取→清洗→EDA→建模→评估→部署。以电商用户流失预测为例。

<b>项目各阶段交付物表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">阶段</th><th style="border:1px solid #999;padding:6px">工作</th><th style="border:1px solid #999;padding:6px">交付</th></tr>
<tr><td style="border:1px solid #999;padding:6px">业务理解</td><td style="border:1px solid #999;padding:6px">定义流失(90天未购)</td><td style="border:1px solid #999;padding:6px">目标定义文档</td></tr>
<tr><td style="border:1px solid #999;padding:6px">数据获取</td><td style="border:1px solid #999;padding:6px">取用户/订单/行为表</td><td style="border:1px solid #999;padding:6px">宽表 feature_table</td></tr>
<tr><td style="border:1px solid #999;padding:6px">特征工程</td><td style="border:1px solid #999;padding:6px">RFM、频次、间隔</td><td style="border:1px solid #999;padding:6px">特征说明文档</td></tr>
<tr><td style="border:1px solid #999;padding:6px">建模</td><td style="border:1px solid #999;padding:6px">逻辑回归/XGBoost</td><td style="border:1px solid #999;padding:6px">模型文件</td></tr>
<tr><td style="border:1px solid #999;padding:6px">评估</td><td style="border:1px solid #999;padding:6px">AUC/召回率</td><td style="border:1px solid #999;padding:6px">评估报告</td></tr>
<tr><td style="border:1px solid #999;padding:6px">落地</td><td style="border:1px solid #999;padding:6px">打标签+运营策略</td><td style="border:1px solid #999;padding:6px">流失名单+优惠策略</td></tr>
</table>

RFM 模型：Recency 最近购买间隔、Frequency 购买频次、Monetary 金额。三类指标分层组合出 8 类用户。

模型评估指标：准确率（类别平衡时）、精确率/召回率（不平衡用）、F1 调和平均、AUC 曲线下面积。流失预测重召回率。

业务闭环：模型输出流失概率高的用户名单→运营发优惠券→A/B 测试验证召回效果→持续迭代。数据科学是"业务-数据-反馈"循环。',
'掌握完整数据项目流程',
'["RFM用户分层模型","类别不平衡用召回率","AUC评估模型","业务闭环迭代"]',
'advanced', 12, 4);

INSERT IGNORE INTO sekai_learning_quiz_questions (id, lesson_id, question, question_type, options, correct_answer, explanation, sort_order) VALUES
(131, 66, '(a+b)² 展开等于？', 'single', '[{"label":"A","text":"a²+b²"},{"label":"B","text":"a²+2ab+b²"},{"label":"C","text":"a²-2ab+b²"},{"label":"D","text":"a²+ab+b²"}]', 'B', '完全平方公式: 首平方加尾平方加二倍乘积', 1),
(132, 66, '方程 x²+5x+6=0 的两个根是？', 'single', '[{"label":"A","text":"2和3"},{"label":"B","text":"-2和-3"},{"label":"C","text":"1和6"},{"label":"D","text":"-1和6"}]', 'B', '十字相乘分解为 (x+2)(x+3)，根为 -2 和 -3', 2),
(133, 67, '一元二次方程 ax²+bx+c=0 的判别式是？', 'single', '[{"label":"A","text":"b²-4ac"},{"label":"B","text":"b²+4ac"},{"label":"C","text":"2ab"},{"label":"D","text":"4ac-b²"}]', 'A', '判别式 Δ=b²-4ac 决定根的情况', 1),
(134, 67, '二次函数 y=x² 的对称轴是？', 'single', '[{"label":"A","text":"x=1"},{"label":"B","text":"x=0"},{"label":"C","text":"y=1"},{"label":"D","text":"x=-1"}]', 'B', '顶点式 y=(x-0)²+0，对称轴 x=0 即 y 轴', 2),
(135, 68, '对正数 a、b，均值不等式取等条件是？', 'single', '[{"label":"A","text":"a=2b"},{"label":"B","text":"a=b"},{"label":"C","text":"a+b=1"},{"label":"D","text":"ab=1"}]', 'B', '(a+b)/2≥√(ab)，当且仅当 a=b 时取等', 1),
(136, 68, 'x>0 时，x+1/x 的最小值是？', 'single', '[{"label":"A","text":"0"},{"label":"B","text":"1"},{"label":"C","text":"2"},{"label":"D","text":"4"}]', 'C', 'x=1/x 即 x=1 时取最小值 2', 2),
(137, 69, '下列函数中为偶函数的是？', 'single', '[{"label":"A","text":"y=x³"},{"label":"B","text":"y=x²"},{"label":"C","text":"y=2ˣ"},{"label":"D","text":"y=log₂x"}]', 'B', 'f(-x)=x²=f(x)，关于 y 轴对称', 1),
(138, 69, 'y=2ˣ 的单调性是？', 'single', '[{"label":"A","text":"恒减"},{"label":"B","text":"恒增"},{"label":"C","text":"先增后减"},{"label":"D","text":"非单调"}]', 'B', '底数大于1的指数函数在 R 上单调递增', 2),
(139, 70, '全等三角形判定中，直角三角形专属的是？', 'single', '[{"label":"A","text":"SSS"},{"label":"B","text":"SAS"},{"label":"C","text":"ASA"},{"label":"D","text":"HL"}]', 'D', 'HL 斜边直角边定理仅用于直角三角形', 1),
(140, 70, '三角形三边为 2、3、x，则 x 的范围是？', 'single', '[{"label":"A","text":"1<x<5"},{"label":"B","text":"1<x<3"},{"label":"C","text":"2<x<5"},{"label":"D","text":"x>1"}]', 'A', '两边之差<第三边<两边之和: 3-2<x<3+2', 2),
(141, 71, '相似三角形面积比等于？', 'single', '[{"label":"A","text":"相似比"},{"label":"B","text":"相似比的平方"},{"label":"C","text":"相似比立方"},{"label":"D","text":"相似比的一半"}]', 'B', '面积比=相似比²，周长比=相似比', 1),
(142, 71, '黄金分割比 φ 的近似值是？', 'single', '[{"label":"A","text":"0.618"},{"label":"B","text":"1.618"},{"label":"C","text":"2.718"},{"label":"D","text":"3.141"}]', 'B', 'φ=(1+√5)/2≈1.618，其倒数为0.618', 2),
(143, 72, '垂直于弦的直径有什么性质？', 'single', '[{"label":"A","text":"平分弦及弧"},{"label":"B","text":"等于弦长"},{"label":"C","text":"垂直于切线"},{"label":"D","text":"平分圆周角"}]', 'A', '垂径定理: 垂直于弦的直径平分弦和对应的两条弧', 1),
(144, 72, '直径所对的圆周角是？', 'single', '[{"label":"A","text":"45°"},{"label":"B","text":"60°"},{"label":"C","text":"90°"},{"label":"D","text":"120°"}]', 'C', '直径所对圆周角为直角 90°', 2),
(145, 73, '球的体积公式是？', 'single', '[{"label":"A","text":"4πR²"},{"label":"B","text":"(4/3)πR³"},{"label":"C","text":"πR³"},{"label":"D","text":"2πR³"}]', 'B', '球体积 V=(4/3)πR³，表面积 4πR²', 1),
(146, 73, '欧拉公式 V-E+F=2 中 E 表示？', 'single', '[{"label":"A","text":"顶点数"},{"label":"B","text":"棱数"},{"label":"C","text":"面数"},{"label":"D","text":"边长"}]', 'B', 'V 顶点、E 棱、F 面，V-E+F=2', 2),
(147, 74, 'sin30° 的值是？', 'single', '[{"label":"A","text":"0"},{"label":"B","text":"1/2"},{"label":"C","text":"√2/2"},{"label":"D","text":"√3/2"}]', 'B', '30° 的 sin 值为 1/2', 1),
(148, 74, 'y=sinx 的周期是？', 'single', '[{"label":"A","text":"π"},{"label":"B","text":"2π"},{"label":"C","text":"4π"},{"label":"D","text":"1"}]', 'B', '正弦函数最小正周期 2π', 2),
(149, 75, 'sin(α+β) 展开为？', 'single', '[{"label":"A","text":"sinαcosβ+cosαsinβ"},{"label":"B","text":"sinαcosβ-cosαsinβ"},{"label":"C","text":"cosαcosβ+sinαsinβ"},{"label":"D","text":"cosαsinβ-sinαcosβ"}]', 'A', '两角和正弦公式', 1),
(150, 75, 'sin2α 等于？', 'single', '[{"label":"A","text":"2sinα"},{"label":"B","text":"2sinαcosα"},{"label":"C","text":"sin²α"},{"label":"D","text":"cos2α"}]', 'B', '二倍角公式 sin2α=2sinαcosα', 2),
(151, 76, '已知 a=3, b=4, C=90°，则 c=？', 'single', '[{"label":"A","text":"5"},{"label":"B","text":"6"},{"label":"C","text":"7"},{"label":"D","text":"√7"}]', 'A', '余弦定理: c=√(9+16)=5 勾股数', 1),
(152, 76, '海伦公式中 p 表示？', 'single', '[{"label":"A","text":"周长"},{"label":"B","text":"半周长"},{"label":"C","text":"面积"},{"label":"D","text":"外接圆半径"}]', 'B', 'p=(a+b+c)/2 半周长', 2),
(153, 77, '两向量垂直的充要条件是？', 'single', '[{"label":"A","text":"数量积为0"},{"label":"B","text":"模长相乘为0"},{"label":"C","text":"方向相同"},{"label":"D","text":"坐标相同"}]', 'A', 'a·b=0 且非零向量则垂直', 1),
(154, 77, '向量 a=(1,2), b=(3,4)，则 a·b=？', 'single', '[{"label":"A","text":"10"},{"label":"B","text":"11"},{"label":"C","text":"12"},{"label":"D","text":"7"}]', 'B', '1×3+2×4=11', 2),
(155, 78, '等差数列 2,5,8,... 的通项是？', 'single', '[{"label":"A","text":"3n-1"},{"label":"B","text":"3n+2"},{"label":"C","text":"2n+3"},{"label":"D","text":"n+2"}]', 'A', 'aₙ=2+(n-1)×3=3n-1', 1),
(156, 78, '1+2+...+100=？', 'single', '[{"label":"A","text":"4950"},{"label":"B","text":"5000"},{"label":"C","text":"5050"},{"label":"D","text":"10100"}]', 'C', '高斯公式 (1+100)×100/2=5050', 2),
(157, 79, '等比数列 2,4,8,... 的公比是？', 'single', '[{"label":"A","text":"1/2"},{"label":"B","text":"2"},{"label":"C","text":"4"},{"label":"D","text":"8"}]', 'B', '后项除以前项等于 2', 1),
(158, 79, '无穷等比 0.5+0.25+0.125+... 的和是？', 'single', '[{"label":"A","text":"0.9"},{"label":"B","text":"1"},{"label":"C","text":"0.5"},{"label":"D","text":"1.5"}]', 'B', 'S=a₁/(1-q)=0.5/0.5=1', 2),
(159, 80, '斐波那契数列 1,1,2,3,5 的下一项是？', 'single', '[{"label":"A","text":"7"},{"label":"B","text":"8"},{"label":"C","text":"9"},{"label":"D","text":"10"}]', 'B', '后项为前两项之和: 3+5=8', 1),
(160, 80, '裂项公式 1/(n(n+1))=？', 'single', '[{"label":"A","text":"1/n+1/(n+1)"},{"label":"B","text":"1/n-1/(n+1)"},{"label":"C","text":"n/(n+1)"},{"label":"D","text":"1/(n-1)"}]', 'B', '裂项相消: 1/n-1/(n+1)', 2),
(161, 81, '调和级数 Σ1/n 的敛散性是？', 'single', '[{"label":"A","text":"收敛"},{"label":"B","text":"发散"},{"label":"C","text":"条件收敛"},{"label":"D","text":"不确定"}]', 'B', '调和级数永远发散', 1),
(162, 81, '几何级数 Σ(1/2)ⁿ 的和是？', 'single', '[{"label":"A","text":"0.5"},{"label":"B","text":"1"},{"label":"C","text":"2"},{"label":"D","text":"∞"}]', 'C', 'a/(1-q)=1/(1-1/2)=2', 2),
(163, 82, '掷一枚骰子出现偶数的概率是？', 'single', '[{"label":"A","text":"1/6"},{"label":"B","text":"1/3"},{"label":"C","text":"1/2"},{"label":"D","text":"2/3"}]', 'C', '2,4,6 三个偶数面占 6 面的 1/2', 1),
(164, 82, 'P(B|A) 的定义是？', 'single', '[{"label":"A","text":"P(AB)/P(A)"},{"label":"B","text":"P(A)/P(B)"},{"label":"C","text":"P(A)+P(B)"},{"label":"D","text":"P(AB)"}]', 'A', '条件概率公式 P(B|A)=P(AB)/P(A)', 2),
(165, 83, '二项分布 B(n,p) 的期望是？', 'single', '[{"label":"A","text":"p"},{"label":"B","text":"np"},{"label":"C","text":"np(1-p)"},{"label":"D","text":"n²p"}]', 'B', 'E(X)=np，方差 np(1-p)', 1),
(166, 83, '正态分布 μ±2σ 覆盖约？', 'single', '[{"label":"A","text":"68%"},{"label":"B","text":"95%"},{"label":"C","text":"99.7%"},{"label":"D","text":"50%"}]', 'B', '68-95-99.7 法则', 2),
(167, 84, '贝叶斯公式 P(A|B)=？', 'single', '[{"label":"A","text":"P(B|A)P(A)/P(B)"},{"label":"B","text":"P(A)P(B)"},{"label":"C","text":"P(A)+P(B)"},{"label":"D","text":"P(B)/P(A)"}]', 'A', '后验概率=先验×似然/证据', 1),
(168, 84, '患病率1%、检出率99%时，阳性者真患病概率约？', 'single', '[{"label":"A","text":"99%"},{"label":"B","text":"50%"},{"label":"C","text":"约17%"},{"label":"D","text":"约1%"}]', 'C', '考虑假阳性后后验约16.7%，远低于99%', 2),
(169, 85, '大数定律的核心结论是？', 'single', '[{"label":"A","text":"频率收敛于概率"},{"label":"B","text":"概率收敛于频率"},{"label":"C","text":"均值恒等"},{"label":"D","text":"方差为零"}]', 'A', '试验次数足够多时频率趋近概率', 1),
(170, 85, '蒙特卡洛方法的核心思想是？', 'single', '[{"label":"A","text":"随机模拟"},{"label":"B","text":"穷举"},{"label":"C","text":"贪心"},{"label":"D","text":"动态规划"}]', 'A', '用随机数模拟大规模试验求数值解', 2),
(171, 86, 'n 元集合的子集个数是？', 'single', '[{"label":"A","text":"n²"},{"label":"B","text":"2ⁿ"},{"label":"C","text":"n!"},{"label":"D","text":"n(n-1)"}]', 'B', '每个元素可选可不选，共 2ⁿ 个子集', 1),
(172, 86, '德摩根律 ¬(A∩B)=？', 'single', '[{"label":"A","text":"¬A∩¬B"},{"label":"B","text":"¬A∪¬B"},{"label":"C","text":"A∪B"},{"label":"D","text":"A∩B"}]', 'B', '交的否定=否定的并', 2),
(173, 87, '无向图握手定理是？', 'single', '[{"label":"A","text":"Σdeg=2|E|"},{"label":"B","text":"Σdeg=|E|"},{"label":"C","text":"Σdeg=2|V|"},{"label":"D","text":"deg=|V|-1"}]', 'A', '所有顶点度之和等于边数的两倍', 1),
(174, 87, 'n 个顶点的树有几条边？', 'single', '[{"label":"A","text":"n"},{"label":"B","text":"n-1"},{"label":"C","text":"n+1"},{"label":"D","text":"n/2"}]', 'B', '连通无回路的树恰有 n-1 条边', 2),
(175, 88, 'p→q 中 p 假 q 假时命题值为？', 'single', '[{"label":"A","text":"真"},{"label":"B","text":"假"},{"label":"C","text":"不确定"},{"label":"D","text":"无法判断"}]', 'A', '蕴含命题仅在前真后假时为假，其余为真', 1),
(176, 88, '¬∀xP(x) 等价于？', 'single', '[{"label":"A","text":"∃x¬P(x)"},{"label":"B","text":"∀x¬P(x)"},{"label":"C","text":"∃xP(x)"},{"label":"D","text":"¬∃x¬P(x)"}]', 'A', '任意变存在，谓词取反', 2),
(177, 89, '无权图最短路径用哪个算法？', 'single', '[{"label":"A","text":"BFS"},{"label":"B","text":"DFS"},{"label":"C","text":"快排"},{"label":"D","text":"二分"}]', 'A', 'BFS 按层扩展，天然最短', 1),
(178, 89, 'Dijkstra 算法不能处理？', 'single', '[{"label":"A","text":"正权边"},{"label":"B","text":"负权边"},{"label":"C","text":"无向图"},{"label":"D","text":"稠密图"}]', 'B', '负权边需用 Bellman-Ford', 2),
(179, 90, '线性规划最优解一定出现在？', 'single', '[{"label":"A","text":"可行域内部"},{"label":"B","text":"可行域顶点"},{"label":"C","text":"原点"},{"label":"D","text":"坐标轴交点"}]', 'B', '线性函数在凸多边形上的极值在顶点取得', 1),
(180, 90, '建模第一步是？', 'single', '[{"label":"A","text":"求解"},{"label":"B","text":"问题理解"},{"label":"C","text":"写报告"},{"label":"D","text":"调参"}]', 'B', '先理解目标与约束再建模', 2),
(181, 91, '指数增长模型 dN/dt=kN 的解是？', 'single', '[{"label":"A","text":"N=N₀eᵏᵗ"},{"label":"B","text":"N=N₀kt"},{"label":"C","text":"N=kt²"},{"label":"D","text":"N=kN₀"}]', 'A', '分离变量积分得指数解', 1),
(182, 91, 'Logistic 模型描述了？', 'single', '[{"label":"A","text":"无限增长"},{"label":"B","text":"有限增长趋近容量"},{"label":"C","text":"周期波动"},{"label":"D","text":"线性变化"}]', 'B', '接近环境容量 K 时增长趋缓', 2),
(183, 92, '凸优化问题的性质是？', 'single', '[{"label":"A","text":"局部最优即全局最优"},{"label":"B","text":"无最优解"},{"label":"C","text":"最优解在边界"},{"label":"D","text":"必有多解"}]', 'A', '凸函数局部极小值就是全局极小值', 1),
(184, 92, '动态规划适用条件是？', 'single', '[{"label":"A","text":"最优子结构"},{"label":"B","text":"数据有序"},{"label":"C","text":"图无环"},{"label":"D","text":"随机分布"}]', 'A', 'DP 要求最优子结构与重叠子问题', 2),
(185, 93, 'Python 符号运算库是？', 'single', '[{"label":"A","text":"numpy"},{"label":"B","text":"sympy"},{"label":"C","text":"matplotlib"},{"label":"D","text":"pandas"}]', 'B', 'SymPy 做符号推导求解', 1),
(186, 93, '求定积分 ∫₀¹x²dx 用 scipy 的哪个函数？', 'single', '[{"label":"A","text":"integrate.quad"},{"label":"B","text":"optimize.minimize"},{"label":"C","text":"fft.fft"},{"label":"D","text":"linalg.solve"}]', 'A', 'scipy.integrate.quad 数值积分', 2),
(187, 94, '展示占比构成最适合？', 'single', '[{"label":"A","text":"饼图"},{"label":"B","text":"折线图"},{"label":"C","text":"散点图"},{"label":"D","text":"箱线图"}]', 'A', '饼图直观展示部分占整体比例', 1),
(188, 94, '人眼最敏感的视觉编码是？', 'single', '[{"label":"A","text":"面积"},{"label":"B","text":"位置"},{"label":"C","text":"颜色"},{"label":"D","text":"纹理"}]', 'B', '视觉编码排序: 位置最强，面积最弱', 2),
(189, 95, 'matplotlib 画折线图用？', 'single', '[{"label":"A","text":"plt.plot"},{"label":"B","text":"plt.bar"},{"label":"C","text":"plt.hist"},{"label":"D","text":"plt.pie"}]', 'A', 'plot 画折线，bar 柱状', 1),
(190, 95, '解决 matplotlib 中文乱码需要？', 'single', '[{"label":"A","text":"设置中文字体"},{"label":"B","text":"设置英文"},{"label":"C","text":"改用png"},{"label":"D","text":"无法解决"}]', 'A', 'rcParams 设置 SimHei 等中文字体', 2),
(191, 96, '缺失值占比较高的列优先策略？', 'single', '[{"label":"A","text":"删除该列"},{"label":"B","text":"填0"},{"label":"C","text":"填最大值"},{"label":"D","text":"忽略"}]', 'A', '缺失比例过高时整列删除更稳妥', 1),
(192, 96, '箱线图识别异常值用哪个规则？', 'single', '[{"label":"A","text":"1.5倍IQR"},{"label":"B","text":"2倍均值"},{"label":"C","text":"3σ"},{"label":"D","text":"中位数"}]', 'A', '超出 Q3+1.5IQR 或 Q1-1.5IQR 为异常', 2),
(193, 97, '以下哪个是开源 BI 工具？', 'single', '[{"label":"A","text":"Superset"},{"label":"B","text":"Excel"},{"label":"C","text":"PPT"},{"label":"D","text":"Word"}]', 'A', 'Apache Superset 开源免费', 1),
(194, 97, '仪表盘最重要的信息放哪里？', 'single', '[{"label":"A","text":"左上角"},{"label":"B","text":"右下角"},{"label":"C","text":"正中间"},{"label":"D","text":"随机"}]', 'A', '人眼从左上开始阅读', 2),
(195, 98, 'HDFS 的用途是？', 'single', '[{"label":"A","text":"分布式存储"},{"label":"B","text":"消息队列"},{"label":"C","text":"内存计算"},{"label":"D","text":"任务调度"}]', 'A', 'HDFS 分布式文件系统存储海量数据', 1),
(196, 98, '流计算引擎代表是？', 'single', '[{"label":"A","text":"Flink"},{"label":"B","text":"HDFS"},{"label":"C","text":"HBase"},{"label":"D","text":"MapReduce"}]', 'A', 'Flink 实时流处理', 2),
(197, 99, '取分组内排名编号的窗口函数是？', 'single', '[{"label":"A","text":"ROW_NUMBER()"},{"label":"B","text":"COUNT()"},{"label":"C","text":"SUM()"},{"label":"D","text":"MAX()"}]', 'A', 'ROW_NUMBER 分组编号，常用每组TopN', 1),
(198, 99, '计算环比需要哪个窗口函数？', 'single', '[{"label":"A","text":"LAG()"},{"label":"B","text":"NTILE()"},{"label":"C","text":"RANK()"},{"label":"D","text":"COUNT()"}]', 'A', 'LAG 取前一行值用于环比', 2),
(199, 100, 'p<0.05 表示？', 'single', '[{"label":"A","text":"结果显著"},{"label":"B","text":"效应很大"},{"label":"C","text":"数据无偏"},{"label":"D","text":"样本足够"}]', 'A', 'p 值小说明原假设下概率低，通常视为显著', 1),
(200, 100, '分组看A更好合计看B更好是？', 'single', '[{"label":"A","text":"辛普森悖论"},{"label":"B","text":"中心极限"},{"label":"C","text":"大数定律"},{"label":"D","text":"蒙特卡洛"}]', 'A', '混淆变量导致的分组与总体结论相反', 2),
(201, 101, 'RFM 模型中的 R 指？', 'single', '[{"label":"A","text":"最近购买间隔"},{"label":"B","text":"购买频次"},{"label":"C","text":"消费金额"},{"label":"D","text":"会员等级"}]', 'A', 'Recency 最近一次购买距离现在的时间', 1),
(202, 101, '类别不平衡问题优先看哪个指标？', 'single', '[{"label":"A","text":"召回率"},{"label":"B","text":"准确率"},{"label":"C","text":"样本量"},{"label":"D","text":"均值"}]', 'A', '不平衡时准确率失真，召回率更关键', 2);