-- =============================================
-- 知识库大扩充 Part3: 自然科学
-- courses 45-52, lessons 138-177, quiz 275-354
-- =============================================

INSERT IGNORE INTO sekai_learning_courses (id, subject_id, name, description, difficulty, estimated_hours, lesson_count, sort_order) VALUES
(45, 3, '光学与波', '干涉、衍射与成像原理', 'intermediate', 3, 5, 1),
(46, 3, '热学与热力学', '温度、熵与能量守恒', 'intermediate', 3, 5, 2),
(47, 3, '电磁学', '场、电势与麦克斯韦方程', 'advanced', 4, 5, 3),
(48, 6, '无机化学', '周期表、氧化还原与配位', 'beginner', 3, 5, 4),
(49, 6, '有机化学', '官能团体系与命名法', 'advanced', 4, 5, 5),
(50, 7, '细胞与分子生物', '细胞结构、DNA复制与基因表达', 'beginner', 3, 5, 6),
(51, 7, '生物化学与代谢', '酶动力学、糖酵解与光合作用', 'advanced', 4, 5, 7),
(52, 11, '宇宙与行星', '恒星演化、黑洞与系外行星', 'advanced', 4, 5, 8);

INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(138, 45, '光的本质与传播',
'光是电磁波，也是光子流——波粒二象性。真空光速 c=299792458 m/s，约 30 万公里每秒。光速不变原理是相对论基石。

<b>光速与介质数据表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">介质</th><th style="border:1px solid #999;padding:6px">折射率</th><th style="border:1px solid #999;padding:6px">光速(万km/s)</th></tr>
<tr><td style="border:1px solid #999;padding:6px">真空</td><td style="border:1px solid #999;padding:6px">1.0000</td><td style="border:1px solid #999;padding:6px">29.98</td></tr>
<tr><td style="border:1px solid #999;padding:6px">空气</td><td style="border:1px solid #999;padding:6px">1.0003</td><td style="border:1px solid #999;padding:6px">29.97</td></tr>
<tr><td style="border:1px solid #999;padding:6px">水</td><td style="border:1px solid #999;padding:6px">1.333</td><td style="border:1px solid #999;padding:6px">22.5</td></tr>
<tr><td style="border:1px solid #999;padding:6px">玻璃</td><td style="border:1px solid #999;padding:6px">约1.5</td><td style="border:1px solid #999;padding:6px">约20</td></tr>
<tr><td style="border:1px solid #999;padding:6px">钻石</td><td style="border:1px solid #999;padding:6px">2.417</td><td style="border:1px solid #999;padding:6px">12.4</td></tr>
</table>

折射定律（斯涅尔定律）：n₁sinθ₁=n₂sinθ₂。光从光密介质进入光疏介质，入射角大于临界角时发生全反射——光纤通信的原理。

色散：白光通过棱镜分成七色，因为不同波长折射率不同。天空为什么蓝：瑞利散射对短波散射强。

几何光学三定律：光沿直线传播、反射定律（入射角=反射角）、折射定律。成像问题用光路图与透镜公式 1/u+1/v=1/f 求解。',
'掌握光速、折射与色散',
'["真空光速299792458m/s","折射定律n₁sinθ₁=n₂sinθ₂","全反射是光纤原理","瑞利散射让天空变蓝"]',
'intermediate', 12, 1),
(139, 45, '干涉与衍射',
'干涉是波的叠加：两列相干波相遇，振动加强区与减弱区稳定分布。杨氏双缝实验证明光的波动性。

<b>干涉与衍射对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">现象</th><th style="border:1px solid #999;padding:6px">条件</th><th style="border:1px solid #999;padding:6px">图样</th><th style="border:1px solid #999;padding:6px">应用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">双缝干涉</td><td style="border:1px solid #999;padding:6px">频率相同相位差恒定</td><td style="border:1px solid #999;padding:6px">明暗条纹等宽</td><td style="border:1px solid #999;padding:6px">测波长</td></tr>
<tr><td style="border:1px solid #999;padding:6px">薄膜干涉</td><td style="border:1px solid #999;padding:6px">膜厚与波长可比</td><td style="border:1px solid #999;padding:6px">彩色条纹</td><td style="border:1px solid #999;padding:6px">增透膜</td></tr>
<tr><td style="border:1px solid #999;padding:6px">单缝衍射</td><td style="border:1px solid #999;padding:6px">缝宽与波长相近</td><td style="border:1px solid #999;padding:6px">中央亮纹宽</td><td style="border:1px solid #999;padding:6px">分辨率极限</td></tr>
<tr><td style="border:1px solid #999;padding:6px">光栅衍射</td><td style="border:1px solid #999;padding:6px">多缝周期结构</td><td style="border:1px solid #999;padding:6px">明亮锐利谱线</td><td style="border:1px solid #999;padding:6px">光谱仪</td></tr>
</table>

双缝条纹间距公式：Δx=λL/d。L 屏距、d 缝距。测出条纹间距就能算波长——干涉的计量价值。

衍射限制分辨率：光学显微镜极限约 200nm，受波长限制。电子波长远小于光，所以电子显微镜分辨率可达 0.1nm。

增透膜与增反膜：膜厚取四分之一波长，反射光干涉相消（增透）或相长（增反），眼镜镀膜即此原理。',
'掌握干涉衍射与应用',
'["双缝条纹Δx=λL/d","干涉需相干光源","衍射限制分辨率","四分之一波长增透膜"]',
'intermediate', 12, 2),
(140, 45, '透镜与成像',
'透镜分凸透镜（会聚）与凹透镜（发散）。凸透镜成像规律是光学核心。透镜公式 1/u+1/v=1/f，u 物距 v 像距 f 焦距。

<b>凸透镜成像规律表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">物距</th><th style="border:1px solid #999;padding:6px">像的性质</th><th style="border:1px solid #999;padding:6px">像距</th><th style="border:1px solid #999;padding:6px">应用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">u>2f</td><td style="border:1px solid #999;padding:6px">倒立缩小实像</td><td style="border:1px solid #999;padding:6px">f<v<2f</td><td style="border:1px solid #999;padding:6px">照相机</td></tr>
<tr><td style="border:1px solid #999;padding:6px">u=2f</td><td style="border:1px solid #999;padding:6px">倒立等大实像</td><td style="border:1px solid #999;padding:6px">v=2f</td><td style="border:1px solid #999;padding:6px">测焦距</td></tr>
<tr><td style="border:1px solid #999;padding:6px">f<u<2f</td><td style="border:1px solid #999;padding:6px">倒立放大实像</td><td style="border:1px solid #999;padding:6px">v>2f</td><td style="border:1px solid #999;padding:6px">投影仪</td></tr>
<tr><td style="border:1px solid #999;padding:6px">u=f</td><td style="border:1px solid #999;padding:6px">不成像</td><td style="border:1px solid #999;padding:6px">平行光</td><td style="border:1px solid #999;padding:6px">平行光源</td></tr>
<tr><td style="border:1px solid #999;padding:6px">u<f</td><td style="border:1px solid #999;padding:6px">正立放大虚像</td><td style="border:1px solid #999;padding:6px">同侧</td><td style="border:1px solid #999;padding:6px">放大镜</td></tr>
</table>

口诀："一倍焦距分虚实，二倍焦距分大小"。物近像远像变大（实像情形）。

人眼成像：晶状体相当于凸透镜，视网膜是光屏。近视眼晶状体过厚像成在视网膜前，凹透镜矫正；远视相反用凸透镜。

显微镜：物镜成倒立放大实像+目镜成放大虚像；望远镜：物镜成缩小实像+目镜放大。天文望远镜口径越大分辨越高。',
'掌握透镜成像规律',
'["透镜公式1/u+1/v=1/f","一倍焦距分虚实","近视凹透镜远视凸透镜","显微镜两级放大"]',
'intermediate', 12, 3),
(141, 45, '光的量子性',
'1905 年爱因斯坦用光量子解释光电效应，获诺贝尔奖。光能量 E=hf，h 普朗克常量 6.626×10⁻³⁴ J·s。

<b>光子能量与颜色对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">光色</th><th style="border:1px solid #999;padding:6px">波长(nm)</th><th style="border:1px solid #999;padding:6px">频率(10¹⁴Hz)</th><th style="border:1px solid #999;padding:6px">光子能量(eV)</th></tr>
<tr><td style="border:1px solid #999;padding:6px">红光</td><td style="border:1px solid #999;padding:6px">约700</td><td style="border:1px solid #999;padding:6px">4.3</td><td style="border:1px solid #999;padding:6px">约1.8</td></tr>
<tr><td style="border:1px solid #999;padding:6px">黄绿光</td><td style="border:1px solid #999;padding:6px">约550</td><td style="border:1px solid #999;padding:6px">5.5</td><td style="border:1px solid #999;padding:6px">约2.3</td></tr>
<tr><td style="border:1px solid #999;padding:6px">蓝紫光</td><td style="border:1px solid #999;padding:6px">约400</td><td style="border:1px solid #999;padding:6px">7.5</td><td style="border:1px solid #999;padding:6px">约3.1</td></tr>
</table>

光电效应：光照射金属表面逸出电子。三个实验规律：存在极限频率（低于它无光电效应）、光电效应瞬时发生、饱和电流与光强成正比。

光电效应方程：E_kmax=hf-W₀，W₀ 逸出功。最大初动能与频率成正比，与光强无关——波动说无法解释，量子说完美解释。

光电效应的应用：光电管（路灯自动开关）、光敏电阻、太阳能电池（光伏效应）、数码相机传感器。

康普顿效应进一步证实光子有动量 p=h/λ。光的波粒二象性：传播表现波动性，与物质作用表现粒子性。',
'掌握光电效应与光子',
'["光子能量E=hf","存在极限频率","E_kmax=hf-W₀","光既有波动性又有粒子性"]',
'intermediate', 12, 4),
(142, 45, '光学仪器与现代应用',
'光学从望远镜到光纤，改变人类认知与生活。现代光学器件：激光器、光纤、液晶屏、光纤陀螺。

<b>光学器件原理表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">器件</th><th style="border:1px solid #999;padding:6px">原理</th><th style="border:1px solid #999;padding:6px">应用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">激光</td><td style="border:1px solid #999;padding:6px">受激辐射放大</td><td style="border:1px solid #999;padding:6px">手术/刻录/测距</td></tr>
<tr><td style="border:1px solid #999;padding:6px">光纤</td><td style="border:1px solid #999;padding:6px">全反射传光</td><td style="border:1px solid #999;padding:6px">通信/内窥镜</td></tr>
<tr><td style="border:1px solid #999;padding:6px">望远镜</td><td style="border:1px solid #999;padding:6px">大口径聚光</td><td style="border:1px solid #999;padding:6px">天文观测</td></tr>
<tr><td style="border:1px solid #999;padding:6px">显微镜</td><td style="border:1px solid #999;padding:6px">两级放大</td><td style="border:1px solid #999;padding:6px">生物研究</td></tr>
<tr><td style="border:1px solid #999;padding:6px">偏振片</td><td style="border:1px solid #999;padding:6px">只让特定方向光通过</td><td style="border:1px solid #999;padding:6px">3D电影/相机滤光</td></tr>
<tr><td style="border:1px solid #999;padding:6px">全息照相</td><td style="border:1px solid #999;padding:6px">干涉记录振幅相位</td><td style="border:1px solid #999;padding:6px">防伪/艺术</td></tr>
</table>

激光三特性：方向性极好、单色性极好、相干性极好、亮度极高。激光测距用往返时间测距，月球激光测距精度厘米级。

光纤通信容量巨大：一根光纤承载数 Tbps。原理：光在纤芯与包层界面全反射，损耗低（约 0.2dB/km）。

天文望远镜分类：折射式（透镜）、反射式（凹面镜，哈勃）、射电望远镜（接收无线电波）。韦伯望远镜在拉格朗日 L2 点观测红外。',
'掌握激光光纤与现代光学',
'["激光受激辐射四特性","光纤全反射传光","望远镜口径决定分辨率","全息记录振幅与相位"]',
'intermediate', 12, 5),

(143, 46, '温度与热传递',
'温度是分子平均动能的量度。热传递三方式：传导、对流、辐射。热平衡定律：两物体接触最终温度相同。

<b>物质比热容表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">物质</th><th style="border:1px solid #999;padding:6px">比热容 J/(kg·℃)</th><th style="border:1px solid #999;padding:6px">特点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">水</td><td style="border:1px solid #999;padding:6px">4200</td><td style="border:1px solid #999;padding:6px">很大，海洋调节气候</td></tr>
<tr><td style="border:1px solid #999;padding:6px">冰</td><td style="border:1px solid #999;padding:6px">2100</td><td style="border:1px solid #999;padding:6px">比水小一半</td></tr>
<tr><td style="border:1px solid #999;padding:6px">铁</td><td style="border:1px solid #999;padding:6px">460</td><td style="border:1px solid #999;padding:6px">升温快降温快</td></tr>
<tr><td style="border:1px solid #999;padding:6px">铝</td><td style="border:1px solid #999;padding:6px">880</td><td style="border:1px solid #999;padding:6px">比铁大近2倍</td></tr>
<tr><td style="border:1px solid #999;padding:6px">铜</td><td style="border:1px solid #999;padding:6px">390</td><td style="border:1px solid #999;padding:6px">金属中偏小</td></tr>
</table>

热量公式：Q=cmΔt。水比热容大带来的自然现象：沿海昼夜温差小、海风陆风、冬暖夏凉。

热传递三方式对比：传导（固体直接接触，金属好导体）、对流（流体密度差循环）、辐射（电磁波，无需介质，黑体辐射最强）。

热膨胀：一般物质热胀冷缩，水在 4℃ 密度最大（反常膨胀）。铁路留缝、桥梁伸缩缝都是为热胀冷缩设计。

保温与散热：保温瓶真空层阻断传导对流、镀银层反射辐射；散热器用鳍片增大表面积。',
'掌握热传递三方式',
'["温度是分子平均动能","Q=cmΔt热量公式","传导对流辐射三方式","水比热容大调节气候"]',
'intermediate', 12, 1),
(144, 46, '物态变化',
'物质三态：固态、液态、气态，分子间距与相互作用决定。六种物态变化，吸热放热成对出现。

<b>物态变化汇总表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">变化</th><th style="border:1px solid #999;padding:6px">方向</th><th style="border:1px solid #999;padding:6px">吸放热</th><th style="border:1px solid #999;padding:6px">温度</th></tr>
<tr><td style="border:1px solid #999;padding:6px">熔化</td><td style="border:1px solid #999;padding:6px">固→液</td><td style="border:1px solid #999;padding:6px">吸热</td><td style="border:1px solid #999;padding:6px">熔点不变</td></tr>
<tr><td style="border:1px solid #999;padding:6px">凝固</td><td style="border:1px solid #999;padding:6px">液→固</td><td style="border:1px solid #999;padding:6px">放热</td><td style="border:1px solid #999;padding:6px">凝固点不变</td></tr>
<tr><td style="border:1px solid #999;padding:6px">汽化</td><td style="border:1px solid #999;padding:6px">液→气</td><td style="border:1px solid #999;padding:6px">吸热</td><td style="border:1px solid #999;padding:6px">蒸发沸腾</td></tr>
<tr><td style="border:1px solid #999;padding:6px">液化</td><td style="border:1px solid #999;padding:6px">气→液</td><td style="border:1px solid #999;padding:6px">放热</td><td style="border:1px solid #999;padding:6px">液化点</td></tr>
<tr><td style="border:1px solid #999;padding:6px">升华</td><td style="border:1px solid #999;padding:6px">固→气</td><td style="border:1px solid #999;padding:6px">吸热</td><td style="border:1px solid #999;padding:6px">干冰</td></tr>
<tr><td style="border:1px solid #999;padding:6px">凝华</td><td style="border:1px solid #999;padding:6px">气→固</td><td style="border:1px solid #999;padding:6px">放热</td><td style="border:1px solid #999;padding:6px">霜的形成</td></tr>
</table>

记忆口诀："固态液态气态，六变各记牢；熔化汽化升华吸，凝固液化凝华放"。

熔化热与汽化热：0℃ 冰熔化吸收约 3.34×10⁵ J/kg，100℃ 水汽化吸收 2.26×10⁶ J/kg——汽化热大得多，所以烫伤比烫伤更严重（水蒸气液化放热）。

蒸发三因素：温度、表面积、空气流速。蒸发吸热致冷：酒精擦皮肤凉、出汗散热。沸腾条件：达到沸点+持续吸热，沸点随气压升高。

晶体的熔点：晶体有固定熔点（冰 0℃、铁 1535℃），非晶体没有（玻璃、蜡）。',
'掌握六种物态变化',
'["吸热: 熔化汽化升华","放热: 凝固液化凝华","汽化热大于熔化热","晶体有固定熔点"]',
'intermediate', 12, 2),
(145, 46, '热力学定律',
'热力学研究能量转化与热现象规律。三大定律层层递进：守恒、方向、极限。

<b>热力学三大定律对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">定律</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">物理意义</th></tr>
<tr><td style="border:1px solid #999;padding:6px">第零定律</td><td style="border:1px solid #999;padding:6px">热平衡具有传递性</td><td style="border:1px solid #999;padding:6px">温度概念的基础</td></tr>
<tr><td style="border:1px solid #999;padding:6px">第一定律</td><td style="border:1px solid #999;padding:6px">ΔU=Q+W</td><td style="border:1px solid #999;padding:6px">能量守恒</td></tr>
<tr><td style="border:1px solid #999;padding:6px">第二定律</td><td style="border:1px solid #999;padding:6px">熵增ΔS≥0</td><td style="border:1px solid #999;padding:6px">自然过程有方向</td></tr>
<tr><td style="border:1px solid #999;padding:6px">第三定律</td><td style="border:1px solid #999;padding:6px">绝对零度不可达</td><td style="border:1px solid #999;padding:6px">低温极限</td></tr>
</table>

第一定律 ΔU=Q+W：内能变化=吸热+外界做功。气体膨胀对外做功 W 为负，被压缩 W 为正。绝热过程 Q=0，内能只由做功改变。

第二定律两种表述：开尔文（不能从单一热源吸热完全转化为功，效率 100% 的热机不存在）、克劳修斯（热量不能自发从低温传向高温）。熵：系统混乱度，孤立系统熵只增不减。

卡诺循环效率：η=1-T₂/T₁，实际热机效率都低于卡诺效率。汽车发动机约 25-40%，大型电站约 40-50%。

能量转化的方向性：热传递单向、功热转化单向（摩擦生热不可逆），解释了"时间箭头"。',
'掌握热力学定律',
'["第一定律ΔU=Q+W守恒","第二定律熵增有方向","卡诺效率1-T₂/T₁","绝对零度不可达"]',
'intermediate', 12, 3),
(146, 46, '热机与能量',
'热机把内能转化为机械能：内燃机、蒸汽机、喷气发动机。能量转化效率决定能源利用水平。

<b>常见热机效率对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">热机</th><th style="border:1px solid #999;padding:6px">燃料</th><th style="border:1px solid #999;padding:6px">效率</th><th style="border:1px solid #999;padding:6px">特点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">汽油机</td><td style="border:1px solid #999;padding:6px">汽油</td><td style="border:1px solid #999;padding:6px">约25-35%</td><td style="border:1px solid #999;padding:6px">小功率灵活</td></tr>
<tr><td style="border:1px solid #999;padding:6px">柴油机</td><td style="border:1px solid #999;padding:6px">柴油</td><td style="border:1px solid #999;padding:6px">约35-45%</td><td style="border:1px solid #999;padding:6px">压燃、扭矩大</td></tr>
<tr><td style="border:1px solid #999;padding:6px">燃气轮机</td><td style="border:1px solid #999;padding:6px">天然气</td><td style="border:1px solid #999;padding:6px">约40%</td><td style="border:1px solid #999;padding:6px">发电厂</td></tr>
<tr><td style="border:1px solid #999;padding:6px">喷气发动机</td><td style="border:1px solid #999;padding:6px">航空煤油</td><td style="border:1px solid #999;padding:6px">约30%</td><td style="border:1px solid #999;padding:6px">高速飞行</td></tr>
</table>

四冲程内燃机：吸气→压缩→做功→排气。做功冲程燃料燃烧内能转机械能，其他三冲程靠飞轮惯性。

能量守恒定律：能量不会凭空产生消灭，只会转化转移。永动机不可能：第一类（凭空产生能量）违反守恒，第二类（完全转化）违反第二定律。

能源分类：一次能源（煤石油天然气）与二次能源（电能）；可再生（水能风能太阳能）与不可再生（化石燃料核燃料）。

新能源趋势：光伏、风电、氢能、核聚变（ITER 目标）。能量利用效率提升是双碳目标的抓手。',
'掌握热机与能源转化',
'["内燃机四冲程","效率=有用功/总能量","两类永动机均不可能","新能源与双碳"]',
'intermediate', 12, 4),
(147, 46, '气体与分子动理论',
'分子动理论三观点：物质由大量分子组成、分子永不停息做无规则运动、分子间存在相互作用力。

<b>气体状态参量关系表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">定律</th><th style="border:1px solid #999;padding:6px">条件</th><th style="border:1px solid #999;padding:6px">公式</th></tr>
<tr><td style="border:1px solid #999;padding:6px">玻意耳定律</td><td style="border:1px solid #999;padding:6px">温度不变</td><td style="border:1px solid #999;padding:6px">p₁V₁=p₂V₂</td></tr>
<tr><td style="border:1px solid #999;padding:6px">查理定律</td><td style="border:1px solid #999;padding:6px">体积不变</td><td style="border:1px solid #999;padding:6px">p₁/T₁=p₂/T₂</td></tr>
<tr><td style="border:1px solid #999;padding:6px">盖-吕萨克定律</td><td style="border:1px solid #999;padding:6px">压强不变</td><td style="border:1px solid #999;padding:6px">V₁/T₁=V₂/T₂</td></tr>
<tr><td style="border:1px solid #999;padding:6px">理想气体方程</td><td style="border:1px solid #999;padding:6px">综合</td><td style="border:1px solid #999;padding:6px">pV=nRT</td></tr>
</table>

布朗运动：悬浮微粒的无规则运动，证明分子在运动。注意：布朗运动是分子撞击的不平衡造成的，不是分子的运动本身。

扩散现象：不同物质相互进入对方。温度越高扩散越快。分子间作用力：r<r₀ 斥力为主，r>r₀ 引力为主，r=10r₀ 可忽略。

理想气体：忽略分子体积与相互作用力，遵循 pV=nRT。R=8.314 J/(mol·K)。标况下 1mol 气体体积 22.4L。

压强微观解释：分子对器壁碰撞的宏观表现，温度升高→分子动能大→压强增大。',
'掌握分子动理论与气体定律',
'["布朗运动证明分子运动","玻意耳p₁V₁=p₂V₂","理想气体pV=nRT","压强是分子碰撞结果"]',
'intermediate', 12, 5),

(148, 47, '电场与电势',
'电场是电荷周围的空间性质。场强 E=F/q，描述力的强弱；电势 φ 描述能量高低。电场线从正电荷出发止于负电荷。

<b>电场核心概念表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">概念</th><th style="border:1px solid #999;padding:6px">公式</th><th style="border:1px solid #999;padding:6px">单位</th><th style="border:1px solid #999;padding:6px">说明</th></tr>
<tr><td style="border:1px solid #999;padding:6px">点电荷场强</td><td style="border:1px solid #999;padding:6px">E=kQ/r²</td><td style="border:1px solid #999;padding:6px">N/C</td><td style="border:1px solid #999;padding:6px">平方反比</td></tr>
<tr><td style="border:1px solid #999;padding:6px">电势能</td><td style="border:1px solid #999;padding:6px">Ep=qφ</td><td style="border:1px solid #999;padding:6px">J</td><td style="border:1px solid #999;padding:6px">与电荷有关</td></tr>
<tr><td style="border:1px solid #999;padding:6px">电势差</td><td style="border:1px solid #999;padding:6px">U=W/q</td><td style="border:1px solid #999;padding:6px">V</td><td style="border:1px solid #999;padding:6px">电场力做功</td></tr>
<tr><td style="border:1px solid #999;padding:6px">匀强电场</td><td style="border:1px solid #999;padding:6px">E=U/d</td><td style="border:1px solid #999;padding:6px">V/m</td><td style="border:1px solid #999;padding:6px">场强=电势梯度</td></tr>
<tr><td style="border:1px solid #999;padding:6px">电容</td><td style="border:1px solid #999;padding:6px">C=Q/U</td><td style="border:1px solid #999;padding:6px">F</td><td style="border:1px solid #999;padding:6px">储存电荷</td></tr>
</table>

库仑定律：F=kq₁q₂/r²，k=9×10⁹ N·m²/C²。真空中两点电荷相互作用，同性相斥异性相吸。

电场线性质：不相交、疏密表示强弱、沿电场线电势降低。等势面与电场线垂直，等势面上移动电荷不做功。

电势能变化判断：电场力做正功电势能减少，做负功电势能增加（类比重力做功）。带电粒子在电场中的偏转：类平抛运动，示波器原理。

电容器储能 W=½CU²。平行板电容 C=εS/4πkd，与正对面积成正比、板距成反比。',
'掌握电场核心概念',
'["库仑定律F=kq₁q₂/r²","E=U/d匀强电场","电场力做正功电势能减","平行板电容C=εS/4πkd"]',
'advanced', 12, 1),
(149, 47, '磁场与安培力',
'磁场是磁体与电流周围的特殊物质。磁感应强度 B=F/IL 描述强弱，单位特斯拉 T。磁感线从 N 极到 S 极（外部）。

<b>磁场重要公式表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">公式</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">方向判断</th></tr>
<tr><td style="border:1px solid #999;padding:6px">安培力</td><td style="border:1px solid #999;padding:6px">F=BILsinθ</td><td style="border:1px solid #999;padding:6px">左手定则</td></tr>
<tr><td style="border:1px solid #999;padding:6px">洛伦兹力</td><td style="border:1px solid #999;padding:6px">f=qvBsinθ</td><td style="border:1px solid #999;padding:6px">左手定则</td></tr>
<tr><td style="border:1px solid #999;padding:6px">匀速圆周</td><td style="border:1px solid #999;padding:6px">r=mv/qB</td><td style="border:1px solid #999;padding:6px">洛伦兹力向心力</td></tr>
<tr><td style="border:1px solid #999;padding:6px">周期</td><td style="border:1px solid #999;padding:6px">T=2πm/qB</td><td style="border:1px solid #999;padding:6px">与速度无关</td></tr>
</table>

安培力：通电导线在磁场中受力 F=BILsinθ，方向用左手定则（磁感线穿手心、四指电流、拇指受力）。电动机原理。

洛伦兹力：运动电荷在磁场中受力 f=qvB，永远不做功（力与速度垂直），只改变运动方向不改变速率。带电粒子垂直进入磁场做匀速圆周运动，半径 r=mv/qB。

左手定则与右手定则区分：左手力、右手电（右手定则判感应电流方向）。右手螺旋定则（安培定则）判电流磁场方向。

应用：质谱仪（测质量）、回旋加速器（加速带电粒子）、显像管/电子束偏转、磁悬浮。磁流体发电机与霍尔效应也基于洛伦兹力。',
'掌握安培力与洛伦兹力',
'["安培力F=BILsinθ","洛伦兹力不做功","r=mv/qB圆周运动","左手定则判力"]',
'advanced', 12, 2),
(150, 47, '电磁感应',
'1831 年法拉第发现电磁感应：闭合回路磁通量变化产生感应电流。楞次定律判方向，法拉第定律算大小。

<b>电磁感应定律对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">定律</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">用途</th></tr>
<tr><td style="border:1px solid #999;padding:6px">法拉第定律</td><td style="border:1px solid #999;padding:6px">E=nΔΦ/Δt</td><td style="border:1px solid #999;padding:6px">算感应电动势大小</td></tr>
<tr><td style="border:1px solid #999;padding:6px">楞次定律</td><td style="border:1px solid #999;padding:6px">感应电流阻碍磁通量变化</td><td style="border:1px solid #999;padding:6px">判感应电流方向</td></tr>
<tr><td style="border:1px solid #999;padding:6px">切割磁感线</td><td style="border:1px solid #999;padding:6px">E=BLvsinθ</td><td style="border:1px solid #999;padding:6px">导体棒切割</td></tr>
</table>

楞次定律口诀："增反减同，来拒去留，增缩减扩"。核心：感应电流的磁场阻碍引起它的磁通量变化——注意是阻碍不是阻止。

感应电动势大小只取决于磁通量变化率，与磁通量本身无关。穿过线圈的磁通量大不一定电动势大。

应用：发电机（机械能→电能）、变压器（改变电压）、电磁炉（涡流加热）、感应炉、刹车系统、无线充电、安检门。

变压器原理：原副线圈匝数比=电压比 U₁/U₂=n₁/n₂。理想变压器：功率守恒 P₁=P₂，电流与匝数成反比。涡流：导体中感应的漩涡状电流，电磁炉与淬火利用它。',
'掌握法拉第定律与楞次定律',
'["E=nΔΦ/Δt大小","楞次定律判方向","E=BLv切割电动势","变压器电压比匝数比"]',
'advanced', 12, 3),
(151, 47, '交流电',
'交流电方向周期性变化。我国市电：频率 50Hz，有效值 220V，峰值约 311V。正弦交流电是理想形式。

<b>交流电关键数值表（220V/50Hz）：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">量</th><th style="border:1px solid #999;padding:6px">数值</th><th style="border:1px solid #999;padding:6px">关系</th></tr>
<tr><td style="border:1px solid #999;padding:6px">有效值</td><td style="border:1px solid #999;padding:6px">220V</td><td style="border:1px solid #999;padding:6px">发热等效直流</td></tr>
<tr><td style="border:1px solid #999;padding:6px">峰值</td><td style="border:1px solid #999;padding:6px">约311V</td><td style="border:1px solid #999;padding:6px">Uₘ=√2×U</td></tr>
<tr><td style="border:1px solid #999;padding:6px">周期</td><td style="border:1px solid #999;padding:6px">0.02s</td><td style="border:1px solid #999;padding:6px">T=1/f</td></tr>
<tr><td style="border:1px solid #999;padding:6px">角频率</td><td style="border:1px solid #999;padding:6px">100π rad/s</td><td style="border:1px solid #999;padding:6px">ω=2πf</td></tr>
</table>

正弦交流电瞬时值：u=Uₘsin(ωt+φ₀)。有效值定义：一个周期内发热量与等效直流相同，U=Uₘ/√2。

远距离输电：P=UI，线路损耗 P损=I²R。提高电压降低电流减小损耗——这就是为什么要特高压输电（1000kV 级）。

三相交流电：三相对称相差 120°，星形连接 380V/220V 两档。照明用电 220V 相电压，动力用电 380V 线电压。

整流与逆变：二极管整流把交流变直流（充电器），逆变器把直流变交流（光伏并网、电动汽车电机驱动）。',
'掌握交流电有效值',
'["有效值U=Uₘ/√2","峰值311V","高压输电减损耗","整流与逆变"]',
'advanced', 12, 4),
(152, 47, '电磁波与麦克斯韦',
'麦克斯韦方程组统一电与磁：变化的电场产生磁场，变化的磁场产生电场。预言电磁波存在，赫兹实验证实。

<b>电磁波谱与应用表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">波段</th><th style="border:1px solid #999;padding:6px">波长范围</th><th style="border:1px solid #999;padding:6px">产生方式</th><th style="border:1px solid #999;padding:6px">应用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">无线电波</td><td style="border:1px solid #999;padding:6px">>1mm</td><td style="border:1px solid #999;padding:6px">振荡电路</td><td style="border:1px solid #999;padding:6px">广播通信</td></tr>
<tr><td style="border:1px solid #999;padding:6px">微波</td><td style="border:1px solid #999;padding:6px">1mm-1m</td><td style="border:1px solid #999;padding:6px">磁控管</td><td style="border:1px solid #999;padding:6px">微波炉/雷达</td></tr>
<tr><td style="border:1px solid #999;padding:6px">红外线</td><td style="border:1px solid #999;padding:6px">0.7μm-1mm</td><td style="border:1px solid #999;padding:6px">热辐射</td><td style="border:1px solid #999;padding:6px">遥控/夜视</td></tr>
<tr><td style="border:1px solid #999;padding:6px">可见光</td><td style="border:1px solid #999;padding:6px">400-700nm</td><td style="border:1px solid #999;padding:6px">原子跃迁</td><td style="border:1px solid #999;padding:6px">视觉</td></tr>
<tr><td style="border:1px solid #999;padding:6px">紫外线</td><td style="border:1px solid #999;padding:6px">10-400nm</td><td style="border:1px solid #999;padding:6px">原子激发</td><td style="border:1px solid #999;padding:6px">消毒/验钞</td></tr>
<tr><td style="border:1px solid #999;padding:6px">X射线</td><td style="border:1px solid #999;padding:6px">0.01-10nm</td><td style="border:1px solid #999;padding:6px">高速电子轰击</td><td style="border:1px solid #999;padding:6px">医学影像</td></tr>
<tr><td style="border:1px solid #999;padding:6px">γ射线</td><td style="border:1px solid #999;padding:6px"><0.01nm</td><td style="border:1px solid #999;padding:6px">核反应</td><td style="border:1px solid #999;padding:6px">放疗/探伤</td></tr>
</table>

电磁波都是横波，真空速度 c=3×10⁸ m/s。频率越高波长越短能量越大（E=hf）。

波长与穿透性关系：γ 射线穿透最强，X 射线次之，紫外线被臭氧层吸收。微波穿透性好但被水分子吸收（微波炉加热原理）。

麦克斯韦预言+赫兹实验+无线电报（马可尼）→现代通信。WiFi、5G、卫星通信都基于电磁波。5G 用毫米波频率更高带宽更大。',
'掌握电磁波谱',
'["电磁波是横波速度光速","频率越高能量越大","微波炉加热水分子","γ穿透最强"]',
'advanced', 12, 5),

(153, 48, '元素周期表',
'门捷列夫 1869 年提出元素周期律：元素性质随原子序数周期性变化。周期表 7 个周期、18 个族，主族 I A-VII A 与零族。

<b>短周期主族元素性质变化表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">位置</th><th style="border:1px solid #999;padding:6px">金属性</th><th style="border:1px solid #999;padding:6px">非金属性</th><th style="border:1px solid #999;padding:6px">最高价氧化物</th></tr>
<tr><td style="border:1px solid #999;padding:6px">同周期左→右</td><td style="border:1px solid #999;padding:6px">减弱</td><td style="border:1px solid #999;padding:6px">增强</td><td style="border:1px solid #999;padding:6px">酸性增强</td></tr>
<tr><td style="border:1px solid #999;padding:6px">同主族上→下</td><td style="border:1px solid #999;padding:6px">增强</td><td style="border:1px solid #999;padding:6px">减弱</td><td style="border:1px solid #999;padding:6px">碱性增强</td></tr>
</table>

周期表结构：周期数=电子层数，主族序数=最外层电子数。对角线规则：Li-Mg、Be-Al 性质相似。

主族元素典型性质：碱金属（Li Na K）活泼金属遇水反应；卤素（F Cl Br I）活泼非金属；稀有气体性质稳定。

周期表应用：位置-结构-性质三推断（位置推性质）、半导体元素（Si Ge 在金属与非金属交界处）、催化剂（过渡金属）。

原子半径变化：同周期从左到右减小（核电荷吸引），同主族从上到下增大（电子层多）。电离能、电负性同样周期性变化。',
'掌握周期表结构与规律',
'["周期数=电子层数","同周期金属性减弱","对角线规则","位置结构性质互推"]',
'beginner', 12, 1),
(154, 48, '化学键与分子结构',
'化学键是原子间强烈相互作用。三大类型：离子键、共价键、金属键。分子间还有范德华力与氢键。

<b>化学键类型对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">键型</th><th style="border:1px solid #999;padding:6px">成键微粒</th><th style="border:1px solid #999;padding:6px">典型物质</th><th style="border:1px solid #999;padding:6px">性质</th></tr>
<tr><td style="border:1px solid #999;padding:6px">离子键</td><td style="border:1px solid #999;padding:6px">阴阳离子</td><td style="border:1px solid #999;padding:6px">NaCl</td><td style="border:1px solid #999;padding:6px">熔沸点高</td></tr>
<tr><td style="border:1px solid #999;padding:6px">共价键</td><td style="border:1px solid #999;padding:6px">共用电子对</td><td style="border:1px solid #999;padding:6px">H₂O/CO₂</td><td style="border:1px solid #999;padding:6px">熔沸点较低</td></tr>
<tr><td style="border:1px solid #999;padding:6px">金属键</td><td style="border:1px solid #999;padding:6px">金属阳离子+自由电子</td><td style="border:1px solid #999;padding:6px">Fe/Cu</td><td style="border:1px solid #999;padding:6px">导电导热延展</td></tr>
</table>

共价键极性：电负性差值大→极性键（H-Cl）；相同原子→非极性键（H-H）。判断：活泼金属+活泼非金属→离子键。

VSEPR 理论判空间构型：价层电子对互斥。CO₂ 直线形、H₂O 角形（104.5°）、CH₄ 正四面体（109.5°）、NH₃ 三角锥。

氢键：N、O、F 与 H 之间的强分子间作用。水的氢键导致：沸点异常高、冰密度小于水、水表面张力大。氢键比化学键弱比范德华力强。

杂化轨道：sp（直线）、sp²（平面三角）、sp³（四面体）。共价键 σ 键与 π 键：单键一个 σ，双键 σ+π。',
'掌握化学键与空间构型',
'["离子键共价键金属键","VSEPR判空间构型","氢键使水沸点异常","sp/sp²/sp³杂化"]',
'beginner', 12, 2),
(155, 48, '氧化还原反应',
'氧化还原反应特征：化合价变化。本质：电子转移。口诀："升失氧化还原剂，降得还原氧化剂"。

<b>氧化还原核心概念表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">概念</th><th style="border:1px solid #999;padding:6px">定义</th><th style="border:1px solid #999;padding:6px">例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">氧化</td><td style="border:1px solid #999;padding:6px">失电子化合价升高</td><td style="border:1px solid #999;padding:6px">Fe→Fe²⁺</td></tr>
<tr><td style="border:1px solid #999;padding:6px">还原</td><td style="border:1px solid #999;padding:6px">得电子化合价降低</td><td style="border:1px solid #999;padding:6px">Cu²⁺→Cu</td></tr>
<tr><td style="border:1px solid #999;padding:6px">氧化剂</td><td style="border:1px solid #999;padding:6px">得电子，自身被还原</td><td style="border:1px solid #999;padding:6px">KMnO₄</td></tr>
<tr><td style="border:1px solid #999;padding:6px">还原剂</td><td style="border:1px solid #999;padding:6px">失电子，自身被氧化</td><td style="border:1px solid #999;padding:6px">Na/Fe</td></tr>
<tr><td style="border:1px solid #999;padding:6px">氧化性</td><td style="border:1px solid #999;padding:6px">得到电子的能力</td><td style="border:1px solid #999;padding:6px">F₂最强</td></tr>
</table>

氧化性强弱比较：金属活动性顺序（K Ca Na...Au 还原性递减）、元素周期表（右上非金属氧化性强）、反应方向（强氧化剂+强还原剂→弱产物）。

电子守恒：氧化还原反应中失电子总数=得电子总数。配平技巧：先标化合价、找升降、求最小公倍数、配系数。

常见氧化剂：KMnO₄（紫色褪色检验）、H₂O₂、O₂、浓 H₂SO₄、HNO₃。常见还原剂：金属、H₂、C、CO、SO₂。

应用：金属冶炼（还原剂还原氧化物）、原电池与电解（氧化还原的能量转化形式）、漂白消毒（次氯酸盐）、高铁酸钾净水。',
'掌握氧化还原规律',
'["升失氧还降得还氧","电子守恒配平","氧化性强弱比较","常见氧化剂还原剂"]',
'beginner', 12, 3),
(156, 48, '配位化合物',
'配位化合物：中心离子与配体通过配位键结合。中心离子通常是过渡金属，配体提供孤对电子。

<b>配位化合物基本概念表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">概念</th><th style="border:1px solid #999;padding:6px">说明</th><th style="border:1px solid #999;padding:6px">例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">中心离子</td><td style="border:1px solid #999;padding:6px">提供空轨道</td><td style="border:1px solid #999;padding:6px">Fe³⁺/Cu²⁺</td></tr>
<tr><td style="border:1px solid #999;padding:6px">配体</td><td style="border:1px solid #999;padding:6px">提供孤对电子</td><td style="border:1px solid #999;padding:6px">H₂O/NH₃/CN⁻</td></tr>
<tr><td style="border:1px solid #999;padding:6px">配位数</td><td style="border:1px solid #999;padding:6px">配体个数</td><td style="border:1px solid #999;padding:6px">[Cu(NH₃)₄]²⁺ 为4</td></tr>
<tr><td style="border:1px solid #999;padding:6px">配位键</td><td style="border:1px solid #999;padding:6px">共用孤对电子对</td><td style="border:1px solid #999;padding:6px">NH₃→H⁺</td></tr>
</table>

经典配离子：铜氨溶液 [Cu(NH₃)₄]²⁺ 深蓝色、[Ag(NH₃)₂]⁺ 银氨溶液（银镜反应）、[Fe(SCN)]²⁺ 血红色（检验 Fe³⁺）。

配位键的形成：配体把孤对电子"借"给中心离子空轨道。形成条件：一方有孤对电子，另一方有空轨道。

配位化合物的颜色与磁性：d 轨道分裂导致 d-d 跃迁显色（过渡金属化合物多彩）；未成对电子导致顺磁性。

应用：检验离子（Fe³⁺+SCN⁻）、湿法冶金（Au 的氰化浸出）、EDTA 螯合滴定、铂类抗癌药（顺铂）、血红蛋白含 Fe 卟啉配位。',
'掌握配位化合物',
'["配位键=孤对电子共享","中心离子+配体+配位数","铜氨溶液深蓝色","EDTA螯合滴定"]',
'intermediate', 12, 4),
(157, 48, '化学计算与配平',
'化学计算是化学的语言。核心：物质的量 n=m/M=N/N_A，n=V/22.4（标况气体）。摩尔质量 g/mol 数值等于相对分子质量。

<b>化学计算公式表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">公式</th><th style="border:1px solid #999;padding:6px">表达式</th><th style="border:1px solid #999;padding:6px">适用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">物质的量</td><td style="border:1px solid #999;padding:6px">n=m/M</td><td style="border:1px solid #999;padding:6px">质量换算</td></tr>
<tr><td style="border:1px solid #999;padding:6px">粒子数</td><td style="border:1px solid #999;padding:6px">N=n·N_A</td><td style="border:1px solid #999;padding:6px">N_A=6.02×10²³</td></tr>
<tr><td style="border:1px solid #999;padding:6px">气体体积</td><td style="border:1px solid #999;padding:6px">V=n×22.4</td><td style="border:1px solid #999;padding:6px">标况</td></tr>
<tr><td style="border:1px solid #999;padding:6px">物质的量浓度</td><td style="border:1px solid #999;padding:6px">c=n/V</td><td style="border:1px solid #999;padding:6px">mol/L</td></tr>
<tr><td style="border:1px solid #999;padding:6px">质量分数</td><td style="border:1px solid #999;padding:6px">w=m质/m液</td><td style="border:1px solid #999;padding:6px">溶液浓度</td></tr>
</table>

化学计量数之比=物质的量之比（气体还=体积比）。解题三步：写方程式→列已知量→比例求解。

过量计算：先判断哪个物质过量，用不足量计算产物。产率=实际产量/理论产量×100%。

配平口诀："先标价、找升降、电子守恒定系数，原子守恒做检查"。氧化还原配平注意介质（酸性 H⁺、碱性 OH⁻）。

阿伏伽德罗常数题型：气体体积与温度压强有关，标况 22.4L=1mol；溶液计算注意体积单位；微粒数注意化学式含几个原子。',
'掌握化学计量计算',
'["n=m/M核心换算","标况气体22.4L/mol","按计量数比例计算","过量用不足量算"]',
'intermediate', 12, 5),

(158, 49, '烷烃与命名',
'有机化学的骨架是碳链。烷烃是饱和烃，通式 CₙH₂ₙ₊₂。甲烷是最简单的烷烃，正四面体结构。

<b>常见烷烃对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">名称</th><th style="border:1px solid #999;padding:6px">分子式</th><th style="border:1px solid #999;padding:6px">沸点(℃)</th><th style="border:1px solid #999;padding:6px">状态</th></tr>
<tr><td style="border:1px solid #999;padding:6px">甲烷</td><td style="border:1px solid #999;padding:6px">CH₄</td><td style="border:1px solid #999;padding:6px">-161</td><td style="border:1px solid #999;padding:6px">气</td></tr>
<tr><td style="border:1px solid #999;padding:6px">乙烷</td><td style="border:1px solid #999;padding:6px">C₂H₆</td><td style="border:1px solid #999;padding:6px">-89</td><td style="border:1px solid #999;padding:6px">气</td></tr>
<tr><td style="border:1px solid #999;padding:6px">丙烷</td><td style="border:1px solid #999;padding:6px">C₃H₈</td><td style="border:1px solid #999;padding:6px">-42</td><td style="border:1px solid #999;padding:6px">气</td></tr>
<tr><td style="border:1px solid #999;padding:6px">丁烷</td><td style="border:1px solid #999;padding:6px">C₄H₁₀</td><td style="border:1px solid #999;padding:6px">-0.5</td><td style="border:1px solid #999;padding:6px">气</td></tr>
<tr><td style="border:1px solid #999;padding:6px">戊烷</td><td style="border:1px solid #999;padding:6px">C₅H₁₂</td><td style="border:1px solid #999;padding:6px">36</td><td style="border:1px solid #999;padding:6px">液</td></tr>
<tr><td style="border:1px solid #999;padding:6px">十六烷</td><td style="border:1px solid #999;padding:6px">C₁₆H₃₄</td><td style="border:1px solid #999;padding:6px">287</td><td style="border:1px solid #999;padding:6px">固</td></tr>
</table>

同系物：结构相似、组成差 CH₂ 整数倍。同分异构：分子式相同结构不同——碳链异构、位置异构、官能团异构。

系统命名法（IUPAC）四步：选最长碳链为主链→编号（靠近取代基）→写名称（位置-数量-名称）。如 2,2-二甲基丙烷。

烷烃化学性质稳定（饱和键）：取代反应（光照卤代）、氧化（燃烧）、裂化（高温断链）。燃烧通式：CₙH₂ₙ₊₂+(3n+1)/2 O₂→nCO₂+(n+1)H₂O。',
'掌握烷烃结构与命名',
'["烷烃通式CₙH₂ₙ₊₂","同分异构类型","IUPAC命名四步","取代氧化裂化"]',
'intermediate', 12, 1),
(159, 49, '烯烃与炔烃',
'烯烃含 C=C 双键（不饱和），炔烃含 C≡C 三键。不饱和键是反应的活性中心，易发生加成反应。

<b>烯烃炔烃性质对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">项目</th><th style="border:1px solid #999;padding:6px">烯烃</th><th style="border:1px solid #999;padding:6px">炔烃</th></tr>
<tr><td style="border:1px solid #999;padding:6px">通式</td><td style="border:1px solid #999;padding:6px">CₙH₂ₙ</td><td style="border:1px solid #999;padding:6px">CₙH₂ₙ₋₂</td></tr>
<tr><td style="border:1px solid #999;padding:6px">代表物</td><td style="border:1px solid #999;padding:6px">乙烯 CH₂=CH₂</td><td style="border:1px solid #999;padding:6px">乙炔 CH≡CH</td></tr>
<tr><td style="border:1px solid #999;padding:6px">空间结构</td><td style="border:1px solid #999;padding:6px">平面(120°)</td><td style="border:1px solid #999;padding:6px">直线(180°)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">检验</td><td style="border:1px solid #999;padding:6px">溴水褪色</td><td style="border:1px solid #999;padding:6px">溴水+Cu₂Cl₂</td></tr>
</table>

乙烯性质：加成（溴水褪色、加氢、加卤化氢）、加聚（聚乙烯塑料）、氧化（燃烧火焰明亮、被 KMnO₄ 氧化褪色）。乙烯是植物生长调节剂（催熟）。

乙炔：电石 CaC₂+2H₂O→C₂H₂↑+Ca(OH)₂。乙炔燃烧氧炔焰温度 3000℃ 以上，用于焊接切割。乙炔分子直线型，电子云含两个 π 键。

马氏规则：不对称烯烃与 HX 加成，H 加到含 H 较多的碳上。反马氏规则（过氧化物效应）仅 HBr 适用。

聚合反应：加聚（乙烯→聚乙烯，双键打开连接）+缩聚（聚酯、聚酰胺，脱小分子）。塑料、合成橡胶、合成纤维三大合成材料。',
'掌握烯烃炔烃加成反应',
'["烯烃加成溴水褪色","乙炔直线型","马氏规则","加聚与缩聚区别"]',
'intermediate', 12, 2),
(160, 49, '芳香烃',
'苯 C₆H₆ 是最简单的芳香烃，凯库勒式六边形。苯环具有特殊的芳香性：碳碳键平均化，既难加成又易取代。

<b>苯与环己烷对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">项目</th><th style="border:1px solid #999;padding:6px">苯</th><th style="border:1px solid #999;padding:6px">环己烷</th></tr>
<tr><td style="border:1px solid #999;padding:6px">分子式</td><td style="border:1px solid #999;padding:6px">C₆H₆</td><td style="border:1px solid #999;padding:6px">C₆H₁₂</td></tr>
<tr><td style="border:1px solid #999;padding:6px">碳碳键</td><td style="border:1px solid #999;padding:6px">介于单双键之间</td><td style="border:1px solid #999;padding:6px">全是单键</td></tr>
<tr><td style="border:1px solid #999;padding:6px">与溴水</td><td style="border:1px solid #999;padding:6px">萃取不反应</td><td style="border:1px solid #999;padding:6px">不反应</td></tr>
<tr><td style="border:1px solid #999;padding:6px">与KMnO₄</td><td style="border:1px solid #999;padding:6px">不褪色</td><td style="border:1px solid #999;padding:6px">不褪色</td></tr>
<tr><td style="border:1px solid #999;padding:6px">KMnO₄酸性</td><td style="border:1px solid #999;padding:6px">不反应</td><td style="border:1px solid #999;padding:6px">不反应</td></tr>
</table>

苯的取代反应三兄弟：硝化（浓硝酸+浓硫酸，硝基苯）、卤代（FeBr₃ 催化，溴苯）、磺化（浓硫酸，苯磺酸）。条件苛刻但取代是苯的主要反应。

苯的加成与氧化：加氢成环己烷（Ni 催化高温）、燃烧冒浓黑烟（含碳量高）。苯易取代难加成的"芳香性"源于大 π 键离域。

苯的同系物：甲苯（甲基苯）、二甲苯（邻间对）。侧链被氧化：甲苯被 KMnO₄ 氧化成苯甲酸——侧链烷基与苯环的性质差异。

稠环芳烃：萘（双苯环）、蒽、菲。多环芳烃致癌性（苯并芘来自不完全燃烧）。芳香化合物在染料、药物、塑料中广泛应用。',
'掌握苯的芳香性',
'["苯易取代难加成","硝化卤代磺化","甲苯侧链可氧化","大π键离域"]',
'intermediate', 12, 3),
(161, 49, '醇酚醛羧酸',
'含氧官能团家族：醇 -OH（碳链上）、酚 -OH（苯环上）、醛 -CHO、羧酸 -COOH。官能团决定化学性质。

<b>含氧官能团性质表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类别</th><th style="border:1px solid #999;padding:6px">官能团</th><th style="border:1px solid #999;padding:6px">代表物</th><th style="border:1px solid #999;padding:6px">特征反应</th></tr>
<tr><td style="border:1px solid #999;padding:6px">醇</td><td style="border:1px solid #999;padding:6px">-OH</td><td style="border:1px solid #999;padding:6px">乙醇</td><td style="border:1px solid #999;padding:6px">氧化/酯化</td></tr>
<tr><td style="border:1px solid #999;padding:6px">酚</td><td style="border:1px solid #999;padding:6px">苯环-OH</td><td style="border:1px solid #999;padding:6px">苯酚</td><td style="border:1px solid #999;padding:6px">FeCl₃显紫色</td></tr>
<tr><td style="border:1px solid #999;padding:6px">醛</td><td style="border:1px solid #999;padding:6px">-CHO</td><td style="border:1px solid #999;padding:6px">乙醛</td><td style="border:1px solid #999;padding:6px">银镜/斐林</td></tr>
<tr><td style="border:1px solid #999;padding:6px">羧酸</td><td style="border:1px solid #999;padding:6px">-COOH</td><td style="border:1px solid #999;padding:6px">乙酸</td><td style="border:1px solid #999;padding:6px">弱酸性/酯化</td></tr>
</table>

乙醇：与钠反应放氢气、催化氧化成乙醛（铜作催化剂）、酯化、消毒（75% 酒精杀菌最强）。酒驾检测原理：乙醇被重铬酸钾氧化变色。

苯酚：弱酸性（碳酸钠溶解）、与 FeCl₃ 显紫色、与浓溴水生成三溴苯酚白色沉淀。苯酚有毒，消毒剂（石炭酸）。

醛基检验：银镜反应（氨性银氨溶液，析出银镜）、斐林试剂（新制 Cu(OH)₂ 碱性悬浊液，砖红色沉淀）。注意：醛基既能被氧化也能被还原。

乙酸：弱酸（比碳酸强）、酯化反应（浓硫酸催化，乙酸乙酯有香味）。酯化机理：酸脱羟基醇脱氢。羧酸与醇缩合生成酯+水。',
'掌握含氧官能团',
'["醇羟基酚羟基区分","银镜反应检醛基","酯化酸脱羟基","FeCl₃检验苯酚"]',
'intermediate', 12, 4),
(162, 49, '有机合成与高分子',
'有机合成设计：逆合成分析（目标分子拆解为可用原料）。官能团转化是合成路线核心。

<b>官能团转化路线表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">转化</th><th style="border:1px solid #999;padding:6px">试剂条件</th><th style="border:1px solid #999;padding:6px">产物</th></tr>
<tr><td style="border:1px solid #999;padding:6px">醇→醛</td><td style="border:1px solid #999;padding:6px">Cu/Δ催化氧化</td><td style="border:1px solid #999;padding:6px">醛</td></tr>
<tr><td style="border:1px solid #999;padding:6px">醇→烯</td><td style="border:1px solid #999;padding:6px">浓硫酸/170℃</td><td style="border:1px solid #999;padding:6px">烯烃</td></tr>
<tr><td style="border:1px solid #999;padding:6px">烯→醇</td><td style="border:1px solid #999;padding:6px">水化/催化加氢</td><td style="border:1px solid #999;padding:6px">醇</td></tr>
<tr><td style="border:1px solid #999;padding:6px">醇+酸→酯</td><td style="border:1px solid #999;padding:6px">浓硫酸加热</td><td style="border:1px solid #999;padding:6px">酯</td></tr>
<tr><td style="border:1px solid #999;padding:6px">醛→酸</td><td style="border:1px solid #999;padding:6px">氧化剂</td><td style="border:1px solid #999;padding:6px">羧酸</td></tr>
</table>

高分子材料：塑料（聚乙烯、聚氯乙烯）、合成纤维（涤纶、锦纶）、合成橡胶（丁苯橡胶）。加聚 vs 缩聚判断：单体含双键→加聚，脱小分子→缩聚。

常见高分子：聚酯（PET 饮料瓶）、聚酰胺（尼龙）、聚碳酸酯（PC）。降解塑料（PLA 聚乳酸）解决白色污染。

有机合成实例：由乙烯合成乙酸乙酯：乙烯→乙醇→乙醛→乙酸→乙酸乙酯。每一步都要写清条件。

合成设计原则：步骤少、产率高、副反应少、绿色环保（原子经济性）。药物合成更注重选择性（手性药物）。',
'掌握有机合成路线',
'["逆合成分析","官能团转化条件","加聚缩聚区分","原子经济性"]',
'advanced', 12, 5),

(163, 50, '细胞结构',
'细胞是生命活动的基本单位。两类细胞：原核细胞（无核膜，细菌）与真核细胞（有核膜，动植物）。细胞学说：施莱登与施旺提出"一切动植物由细胞构成"。

<b>真核细胞主要细胞器功能表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">细胞器</th><th style="border:1px solid #999;padding:6px">结构</th><th style="border:1px solid #999;padding:6px">功能</th></tr>
<tr><td style="border:1px solid #999;padding:6px">线粒体</td><td style="border:1px solid #999;padding:6px">双层膜+嵴</td><td style="border:1px solid #999;padding:6px">有氧呼吸产能</td></tr>
<tr><td style="border:1px solid #999;padding:6px">叶绿体</td><td style="border:1px solid #999;padding:6px">双层膜+基粒</td><td style="border:1px solid #999;padding:6px">光合作用</td></tr>
<tr><td style="border:1px solid #999;padding:6px">核糖体</td><td style="border:1px solid #999;padding:6px">无膜小颗粒</td><td style="border:1px solid #999;padding:6px">蛋白质合成</td></tr>
<tr><td style="border:1px solid #999;padding:6px">内质网</td><td style="border:1px solid #999;padding:6px">膜系统</td><td style="border:1px solid #999;padding:6px">加工运输脂质</td></tr>
<tr><td style="border:1px solid #999;padding:6px">高尔基体</td><td style="border:1px solid #999;padding:6px">扁平囊堆</td><td style="border:1px solid #999;padding:6px">加工分泌</td></tr>
<tr><td style="border:1px solid #999;padding:6px">溶酶体</td><td style="border:1px solid #999;padding:6px">含水解酶</td><td style="border:1px solid #999;padding:6px">消化废物</td></tr>
<tr><td style="border:1px solid #999;padding:6px">液泡</td><td style="border:1px solid #999;padding:6px">单层膜</td><td style="border:1px solid #999;padding:6px">贮水调节渗透</td></tr>
</table>

细胞膜"流动镶嵌模型"：磷脂双分子层+镶嵌蛋白质，流动性与选择透过性。细胞骨架：微管微丝维持形态参与运输。

细胞核：核膜+核孔+染色质+核仁。染色质与染色体是同一物质不同形态（DNA+蛋白质）。核孔选择性运输大分子。

物质跨膜运输：自由扩散（不需载体不耗能）、协助扩散（需载体不耗能）、主动运输（需载体耗能，逆浓度梯度）。水分子顺浓度梯度。',
'掌握细胞器功能',
'["线粒体产能叶绿体光合","核糖体合成蛋白","流动镶嵌模型","主动运输耗能逆梯度"]',
'beginner', 12, 1),
(164, 50, 'DNA与基因表达',
'遗传物质是 DNA（少数病毒 RNA）。DNA 双螺旋：两条反向平行链，碱基互补配对 A-T、G-C。1953 年沃森与克里克提出双螺旋模型。

<b>DNA 复制与转录翻译对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">过程</th><th style="border:1px solid #999;padding:6px">场所</th><th style="border:1px solid #999;padding:6px">产物</th><th style="border:1px solid #999;padding:6px">模板</th></tr>
<tr><td style="border:1px solid #999;padding:6px">复制</td><td style="border:1px solid #999;padding:6px">细胞核</td><td style="border:1px solid #999;padding:6px">DNA</td><td style="border:1px solid #999;padding:6px">两条母链</td></tr>
<tr><td style="border:1px solid #999;padding:6px">转录</td><td style="border:1px solid #999;padding:6px">细胞核</td><td style="border:1px solid #999;padding:6px">mRNA</td><td style="border:1px solid #999;padding:6px">一条DNA链</td></tr>
<tr><td style="border:1px solid #999;padding:6px">翻译</td><td style="border:1px solid #999;padding:6px">核糖体</td><td style="border:1px solid #999;padding:6px">蛋白质</td><td style="border:1px solid #999;padding:6px">mRNA</td></tr>
</table>

DNA 复制特点：半保留复制、半不连续复制（冈崎片段）。DNA 聚合酶从 5 到 3 方向合成。复制一次，子代 DNA 各含一条母链一条新链。

中心法则：DNA→转录→RNA→翻译→蛋白质。RNA 聚合酶转录，mRNA 带密码子，tRNA 带反密码子运输氨基酸，核糖体 3 个碱基一组读码。

基因突变与表达：密码子 64 个编码 20 种氨基酸（有终止密码子）。基因是 DNA 上特定遗传效应的片段。表观遗传：DNA 甲基化影响表达不改变序列。

PCR 技术：体外 DNA 扩增，变性-退火-延伸三循环，引物介导，指数扩增。DNA 指纹（STR 短串联重复）用于亲子鉴定与刑侦。',
'掌握中心法则',
'["碱基配对A-T G-C","半保留复制","中心法则DNA→RNA→蛋白","PCR指数扩增"]',
'beginner', 12, 2),
(165, 50, '细胞分裂与细胞周期',
'细胞周期：间期（G1、S、G2）+分裂期（M）。间期完成 DNA 复制与物质准备，占周期大部分时间。

<b>细胞分裂方式对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">方式</th><th style="border:1px solid #999;padding:6px">分裂结果</th><th style="border:1px solid #999;padding:6px">染色体变化</th><th style="border:1px solid #999;padding:6px">发生场所</th></tr>
<tr><td style="border:1px solid #999;padding:6px">有丝分裂</td><td style="border:1px solid #999;padding:6px">2个子细胞</td><td style="border:1px solid #999;padding:6px">数目不变</td><td style="border:1px solid #999;padding:6px">体细胞</td></tr>
<tr><td style="border:1px solid #999;padding:6px">减数分裂</td><td style="border:1px solid #999;padding:6px">4个生殖细胞</td><td style="border:1px solid #999;padding:6px">染色体减半</td><td style="border:1px solid #999;padding:6px">性腺</td></tr>
</table>

有丝分裂分期（口诀"前中后末"）：前期染色质变染色体、中期着丝点排列赤道板（观察最佳期）、后期着丝点分裂姐妹染色单体分开、末期细胞板形成（植物）或缢裂（动物）。

减数分裂关键事件：减一前期联会（四分体交叉互换）、减一后期同源染色体分离（非同源自由组合）、减二后期着丝点分裂。减数分裂保证染色体数目稳定（2n→n→2n）。

配子形成：精原细胞→精子 4 个；卵原细胞→卵细胞 1 个+3 个极体。受精作用：精卵核融合，恢复 2n，遗传多样性来源（交叉互换+自由组合+受精随机）。

细胞分化与全能性：分化是基因选择性表达（细胞形态功能不同但基因组相同）；植物细胞全能性→组织培养；动物细胞核全能性→克隆羊多莉。',
'掌握有丝与减数分裂',
'["间期S期复制DNA","有丝分裂染色体不变","减数分裂染色体减半","分化是基因选择性表达"]',
'beginner', 12, 3),
(166, 50, '基因工程',
'基因工程：体外重组 DNA 技术。四步流程：获取目的基因→构建表达载体→导入受体细胞→检测鉴定。限制酶"分子剪刀"、DNA 连接酶"分子胶水"。

<b>基因工程工具酶表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">工具</th><th style="border:1px solid #999;padding:6px">作用</th><th style="border:1px solid #999;padding:6px">特点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">限制酶</td><td style="border:1px solid #999;padding:6px">切 DNA 特定序列</td><td style="border:1px solid #999;padding:6px">识别回文序列</td></tr>
<tr><td style="border:1px solid #999;padding:6px">DNA连接酶</td><td style="border:1px solid #999;padding:6px">连接 DNA 片段</td><td style="border:1px solid #999;padding:6px">形成磷酸二酯键</td></tr>
<tr><td style="border:1px solid #999;padding:6px">载体</td><td style="border:1px solid #999;padding:6px">携带基因进入宿主</td><td style="border:1px solid #999;padding:6px">质粒/噬菌体</td></tr>
</table>

表达载体组成：目的基因+启动子（开始转录）+终止子+标记基因（筛选，如抗性基因）。质粒是常用的环状 DNA 载体。

目的基因获取：基因组文库、cDNA 文库（逆转录）、PCR 扩增、人工合成。导入受体细胞：农杆菌转化法（植物）、显微注射（动物）、感受态细胞（细菌）。

检测：分子水平（PCR 扩增目的基因、分子杂交探针）→细胞水平（标记基因抗性筛选）→个体水平（性状表现）。

应用与伦理：转基因作物（抗虫棉）、胰岛素生产（大肠杆菌）、基因治疗、基因编辑（CRISPR/Cas9）。应用要遵循伦理规范与生物安全。',
'掌握基因工程四步',
'["限制酶连接酶载体","表达载体含标记基因","农杆菌法导入植物","CRISPR基因编辑"]',
'intermediate', 12, 4),
(167, 50, '遗传定律',
'孟德尔豌豆杂交实验奠定遗传学。分离定律（一对相对性状）、自由组合定律（两对以上）。基因型与表现型、显性与隐性。

<b>孟德尔定律要点表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">定律</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">分离比</th></tr>
<tr><td style="border:1px solid #999;padding:6px">分离定律</td><td style="border:1px solid #999;padding:6px">等位基因随配子分离</td><td style="border:1px solid #999;padding:6px">3:1</td></tr>
<tr><td style="border:1px solid #999;padding:6px">自由组合</td><td style="border:1px solid #999;padding:6px">非同源染色体上基因自由组合</td><td style="border:1px solid #999;padding:6px">9:3:3:1</td></tr>
</table>

分离定律实质：减数分裂时等位基因随同源染色体分开进入不同配子。验证：测交（与隐性纯合杂交，测交比 1:1）。

遗传题解法：先判显隐性（无中生有为隐性、有中生无为显性）、再写基因型、最后算概率。基因型概率用配子法或棋盘法。

系谱图分析：伴 X 隐性（男性患者多，交叉遗传）、伴 X 显性（女性患者多）、常染色体。判断口诀："父病女病、子病母病"倾向伴性。

人类遗传病：单基因病（白化病、色盲）、多基因病（高血压糖尿病）、染色体异常（21 三体综合征）。产前诊断与遗传咨询。',
'掌握遗传两大定律',
'["分离定律3:1","自由组合9:3:3:1","测交验证基因型","伴X隐性交叉遗传"]',
'intermediate', 12, 5),

(168, 51, '酶与生物催化',
'酶是生物催化剂，绝大多数是蛋白质（少数 RNA 核酶）。酶三特性：高效性、专一性、作用条件温和。

<b>酶与无机催化剂对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">项目</th><th style="border:1px solid #999;padding:6px">酶</th><th style="border:1px solid #999;padding:6px">无机催化剂</th></tr>
<tr><td style="border:1px solid #999;padding:6px">效率</td><td style="border:1px solid #999;padding:6px">高10⁶-10¹²倍</td><td style="border:1px solid #999;padding:6px">低</td></tr>
<tr><td style="border:1px solid #999;padding:6px">专一性</td><td style="border:1px solid #999;padding:6px">一种酶一种底物</td><td style="border:1px solid #999;padding:6px">不专一</td></tr>
<tr><td style="border:1px solid #999;padding:6px">温度</td><td style="border:1px solid #999;padding:6px">最适37℃左右</td><td style="border:1px solid #999;padding:6px">高温加速</td></tr>
<tr><td style="border:1px solid #999;padding:6px">pH</td><td style="border:1px solid #999;padding:6px">最适pH范围窄</td><td style="border:1px solid #999;padding:6px">范围宽</td></tr>
<tr><td style="border:1px solid #999;padding:6px">调节</td><td style="border:1px solid #999;padding:6px">可受调控</td><td style="border:1px solid #999;padding:6px">不可调</td></tr>
</table>

米氏方程 v=Vmax[S]/(Km+[S])：Km 是反应速率达一半时的底物浓度，Km 小亲和力大。Vmax 反映最大速率。

酶活性受温度与 pH 影响：高温变性不可逆（蛋白质结构破坏），低温活性降低可逆，过酸过碱不可逆失活。唾液淀粉酶最适 pH 约 6.8。

抑制剂：竞争性（与底物争活性位点，增大底物浓度可解除）与非竞争性（结合别位，不可解除）。药物多为酶抑制剂。

酶的应用：工业（蛋白酶洗剂、果胶酶果汁澄清）、食品（酿酒发酵）、医疗（诊断试剂盒、凝血酶）、基因工程工具酶。',
'掌握酶的特性与动力学',
'["酶高效专一温和","高温变性低温可逆","Km小亲和力大","竞争与非竞争抑制"]',
'intermediate', 12, 1),
(169, 51, '呼吸作用',
'细胞呼吸把有机物氧化分解供能。有氧呼吸是主线，无氧呼吸是补充。总反应：C₆H₁₂O₆+6O₂→6CO₂+6H₂O+能量。

<b>有氧呼吸三阶段对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">阶段</th><th style="border:1px solid #999;padding:6px">场所</th><th style="border:1px solid #999;padding:6px">底物</th><th style="border:1px solid #999;padding:6px">产物</th><th style="border:1px solid #999;padding:6px">ATP</th></tr>
<tr><td style="border:1px solid #999;padding:6px">第一阶段</td><td style="border:1px solid #999;padding:6px">细胞质基质</td><td style="border:1px solid #999;padding:6px">葡萄糖</td><td style="border:1px solid #999;padding:6px">丙酮酸+[H]</td><td style="border:1px solid #999;padding:6px">2</td></tr>
<tr><td style="border:1px solid #999;padding:6px">第二阶段</td><td style="border:1px solid #999;padding:6px">线粒体基质</td><td style="border:1px solid #999;padding:6px">丙酮酸+水</td><td style="border:1px solid #999;padding:6px">CO₂+[H]</td><td style="border:1px solid #999;padding:6px">2</td></tr>
<tr><td style="border:1px solid #999;padding:6px">第三阶段</td><td style="border:1px solid #999;padding:6px">线粒体内膜</td><td style="border:1px solid #999;padding:6px">[H]+O₂</td><td style="border:1px solid #999;padding:6px">水</td><td style="border:1px solid #999;padding:6px">34</td></tr>
</table>

无氧呼吸：葡萄糖→乳酸（动物/人肌肉，剧烈运动）或→酒精+CO₂（酵母菌/植物）。能量利用率低，大部分能量留在产物中。

呼吸作用意义：供能（ATP 直接供能）、为合成提供原料（中间产物）。ATP 是细胞的"能量货币"：ATP→ADP+Pi+能量 循环利用。

影响呼吸的因素：温度（酶活）、氧气浓度、水分、CO₂ 浓度。应用：低温低氧贮存果蔬（降低呼吸消耗）、晒干种子、水稻田晒田（防根无氧呼吸烂根）。

有氧呼吸与光合作用联系：呼吸消耗光合产物，为光合提供 CO₂。绿色植物白天光合大于呼吸，夜间只呼吸。',
'掌握有氧呼吸三阶段',
'["总反应葡萄糖+氧→CO₂水","第三阶段产ATP最多","无氧呼吸产物乳酸酒精","低温低氧储存"]',
'intermediate', 12, 2),
(170, 51, '光合作用',
'光合作用：绿色植物把光能转化学能。总反应：6CO₂+12H₂O→(光) C₆H₁₂O₆+6O₂。场所叶绿体。

<b>光反应与暗反应对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">项目</th><th style="border:1px solid #999;padding:6px">光反应</th><th style="border:1px solid #999;padding:6px">暗反应</th></tr>
<tr><td style="border:1px solid #999;padding:6px">场所</td><td style="border:1px solid #999;padding:6px">类囊体薄膜</td><td style="border:1px solid #999;padding:6px">叶绿体基质</td></tr>
<tr><td style="border:1px solid #999;padding:6px">条件</td><td style="border:1px solid #999;padding:6px">需光</td><td style="border:1px solid #999;padding:6px">不需光</td></tr>
<tr><td style="border:1px solid #999;padding:6px">原料</td><td style="border:1px solid #999;padding:6px">水</td><td style="border:1px solid #999;padding:6px">CO₂</td></tr>
<tr><td style="border:1px solid #999;padding:6px">产物</td><td style="border:1px solid #999;padding:6px">[H]+ATP+O₂</td><td style="border:1px solid #999;padding:6px">有机物</td></tr>
<tr><td style="border:1px solid #999;padding:6px">联系</td><td style="border:1px solid #999;padding:6px" colspan="2">光反应供[H]和ATP给暗反应</td></tr>
</table>

光反应：水的光解（放出 O₂）、ATP 生成。暗反应（卡尔文循环）：CO₂ 固定（C₃ 途径）→C₃ 还原→C₅ 再生。夜间暗反应不能进行（缺 ATP/[H]）。

影响光合的因素：光照强度、CO₂ 浓度、温度、水分。光饱和点与光补偿点概念：补偿点时光合=呼吸，不积累有机物。

光合与呼吸综合应用：温室大棚提高 CO₂ 浓度与光照、合理密植（充分利用光能）、轮作休耕。

光合作用的意义：制造有机物（食物与原料来源）、维持大气氧含量、固定太阳能。地球 99% 生物质能量来自光合作用。',
'掌握光合作用两阶段',
'["光反应放氧暗反应固碳","光反应供ATP给暗反应","光补偿点概念","光合意义与全球碳循环"]',
'advanced', 12, 3),
(171, 51, '糖类脂质与蛋白质',
'生物大分子三大类：糖类（主要能源）、脂质（储能与结构）、蛋白质（功能分子）。均以碳骨架为基础。

<b>三大有机物对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类别</th><th style="border:1px solid #999;padding:6px">单体</th><th style="border:1px solid #999;padding:6px">功能</th><th style="border:1px solid #999;padding:6px">代表物</th></tr>
<tr><td style="border:1px solid #999;padding:6px">糖类</td><td style="border:1px solid #999;padding:6px">单糖</td><td style="border:1px solid #999;padding:6px">主要能源</td><td style="border:1px solid #999;padding:6px">葡萄糖/淀粉</td></tr>
<tr><td style="border:1px solid #999;padding:6px">脂质</td><td style="border:1px solid #999;padding:6px">甘油+脂肪酸</td><td style="border:1px solid #999;padding:6px">储能/膜结构</td><td style="border:1px solid #999;padding:6px">脂肪/磷脂</td></tr>
<tr><td style="border:1px solid #999;padding:6px">蛋白质</td><td style="border:1px solid #999;padding:6px">氨基酸</td><td style="border:1px solid #999;padding:6px">结构/催化</td><td style="border:1px solid #999;padding:6px">酶/抗体</td></tr>
</table>

糖类分类：单糖（葡萄糖 C₆H₁₂O₆、果糖、半乳糖）、二糖（蔗糖、麦芽糖、乳糖）、多糖（淀粉、糖原、纤维素）。多糖水解成葡萄糖。

脂质分类：脂肪（储能，1g 供能约 38kJ 是糖类两倍多）、磷脂（细胞膜双层骨架）、固醇（胆固醇、性激素、维生素 D）。

蛋白质结构：氨基酸脱水缩合形成肽链。肽键 -CO-NH-。n 个氨基酸形成 m 条肽链，肽键数=n-m，至少含 m 个氨基羧基。蛋白质功能多样取决于结构（氨基酸序列与空间构象）。

蛋白质变性 vs 水解：变性破坏空间结构（盐析、加热、重金属、酒精）不改变序列；水解破坏肽键分解成氨基酸。',
'掌握生物大分子',
'["糖类主要能源","脂肪储能效率最高","肽键数=氨基酸-肽链数","蛋白质变性可逆?"]',
'advanced', 12, 4),
(172, 51, '代谢调控',
'代谢调控：酶活性调节（底物/产物反馈）与基因表达调控。内稳态是生物体的核心机制：体温、血糖、水盐、pH 恒定。

<b>人体内环境与稳态调节表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">调节系统</th><th style="border:1px solid #999;padding:6px">机制</th><th style="border:1px solid #999;padding:6px">激素/因子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">血糖</td><td style="border:1px solid #999;padding:6px">负反馈</td><td style="border:1px solid #999;padding:6px">胰岛素降/胰高血糖素升</td></tr>
<tr><td style="border:1px solid #999;padding:6px">体温</td><td style="border:1px solid #999;padding:6px">下丘脑调定点</td><td style="border:1px solid #999;padding:6px">甲状腺素+肾上腺素</td></tr>
<tr><td style="border:1px solid #999;padding:6px">水盐</td><td style="border:1px solid #999;padding:6px">抗利尿激素</td><td style="border:1px solid #999;padding:6px">ADH 保水</td></tr>
<tr><td style="border:1px solid #999;padding:6px">酸碱</td><td style="border:1px solid #999;padding:6px">缓冲对</td><td style="border:1px solid #999;padding:6px">HCO₃⁻/H₂CO₃</td></tr>
</table>

负反馈：结果抑制过程（血糖高→胰岛素升→血糖降）。正反馈少见但重要（分娩宫缩、凝血放大）。稳态是负反馈主导。

激素调节特点：微量高效、靶向特异（靶细胞受体）、作用缓慢持久。激素-受体-信号通路（第二信使）。内分泌腺与靶器官反馈轴：下丘脑-垂体-靶腺。

免疫与代谢：免疫系统三大功能（防御、监视、清除）。过敏是过度防御，自身免疫病是攻击自身。

节律与代谢：昼夜节律（生物钟基因）、季节性。能量平衡：摄入=消耗则体重稳定，代谢综合征（胰岛素抵抗）现代病。',
'掌握稳态与反馈调节',
'["负反馈维持稳态","胰岛素降血糖","下丘脑-垂体-靶腺轴","激素微量高效"]',
'advanced', 12, 5),

(173, 52, '恒星的一生',
'恒星是氢聚变的天体。恒星演化取决于质量：大质量恒星命运更壮烈。太阳约 46 亿岁，主序阶段还有约 50 亿年。

<b>恒星演化路径表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">初始质量</th><th style="border:1px solid #999;padding:6px">演化路径</th><th style="border:1px solid #999;padding:6px">终态</th></tr>
<tr><td style="border:1px solid #999;padding:6px"><8倍太阳</td><td style="border:1px solid #999;padding:6px">主序→红巨星→行星状星云</td><td style="border:1px solid #999;padding:6px">白矮星</td></tr>
<tr><td style="border:1px solid #999;padding:6px">8-20倍太阳</td><td style="border:1px solid #999;padding:6px">主序→红超巨星→超新星</td><td style="border:1px solid #999;padding:6px">中子星</td></tr>
<tr><td style="border:1px solid #999;padding:6px">>20倍太阳</td><td style="border:1px solid #999;padding:6px">主序→超新星(GRB)</td><td style="border:1px solid #999;padding:6px">黑洞</td></tr>
</table>

赫罗图：纵轴光度横轴温度，恒星分布主序带。主序星阶段氢聚变：4H→He+能量，太阳每秒转化约 4×10⁶ 吨物质为能量。

白矮星：地球大小的致密天体，电子简并压支撑，钱德拉塞卡极限 1.4 太阳质量。中子星：一茶匙重达亿吨，脉冲星是中子星。

超新星：恒星爆炸亮度超整个星系，合成重元素（金、铀）——我们都是星尘。中子星碰撞产生引力波与金元素。',
'掌握恒星演化',
'["恒星命运由质量决定","主序阶段氢聚变","白矮星中子星黑洞终态","超新星合成重元素"]',
'advanced', 12, 1),
(174, 52, '黑洞与广义相对论',
'黑洞是引力极强连光都无法逃脱的区域。边界叫事件视界。黑洞三毛定理：质量、电荷、角动量决定一切。

<b>黑洞关键概念表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">概念</th><th style="border:1px solid #999;padding:6px">含义</th><th style="border:1px solid #999;padding:6px">数据/案例</th></tr>
<tr><td style="border:1px solid #999;padding:6px">史瓦西半径</td><td style="border:1px solid #999;padding:6px">Rs=2GM/c²</td><td style="border:1px solid #999;padding:6px">太阳Rs约3km</td></tr>
<tr><td style="border:1px solid #999;padding:6px">事件视界</td><td style="border:1px solid #999;padding:6px">光不可逃逸边界</td><td style="border:1px solid #999;padding:6px">无去无回点</td></tr>
<tr><td style="border:1px solid #999;padding:6px">吸积盘</td><td style="border:1px solid #999;padding:6px">物质螺旋下落发热</td><td style="border:1px solid #999;padding:6px">X射线源</td></tr>
<tr><td style="border:1px solid #999;padding:6px">潮汐瓦解</td><td style="border:1px solid #999;padding:6px">恒星级黑洞撕碎恒星</td><td style="border:1px solid #999;padding:6px">2019事件</td></tr>
</table>

广义相对论预言引力弯曲时空：光经过大质量天体发生偏折（1919 年日食验证）、引力红移、时间膨胀（GPS 修正）、引力波（2015 年 LIGO 首次直接探测）。

银河系中心人马座 A* 是约 430 万倍太阳质量的超大质量黑洞。M87 与人马座 A* 照片由事件视界望远镜（EHT）拍摄。

黑洞观测证据：恒星快速绕转轨道、X 射线、引力透镜、引力波。信息悖论：霍金辐射表明黑洞会蒸发。',
'掌握黑洞物理',
'["史瓦西半径Rs=2GM/c²","事件视界不可逃逸","引力波2015首次探测","M87黑洞照片"]',
'advanced', 12, 2),
(175, 52, '系外行星与生命',
'系外行星是太阳系外的行星。1995 年发现第一颗（飞马座51b），至今已确认超 5000 颗。开普勒任务与 TESS 是主力发现者。

<b>系外行星探测方法对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">方法</th><th style="border:1px solid #999;padding:6px">原理</th><th style="border:1px solid #999;padding:6px">优势</th></tr>
<tr><td style="border:1px solid #999;padding:6px">凌日法</td><td style="border:1px solid #999;padding:6px">行星遮挡星光变暗</td><td style="border:1px solid #999;padding:6px">可测半径大气</td></tr>
<tr><td style="border:1px solid #999;padding:6px">径向速度</td><td style="border:1px solid #999;padding:6px">恒星摆动多普勒</td><td style="border:1px solid #999;padding:6px">可测质量</td></tr>
<tr><td style="border:1px solid #999;padding:6px">直接成像</td><td style="border:1px solid #999;padding:6px">遮挡星光拍行星</td><td style="border:1px solid #999;padding:6px">看光谱</td></tr>
<tr><td style="border:1px solid #999;padding:6px">微引力透镜</td><td style="border:1px solid #999;padding:6px">引力放大星光</td><td style="border:1px solid #999;padding:6px">远距离行星</td></tr>
</table>

宜居带（适居带）：行星距恒星距离使液态水稳定存在。地球在太阳宜居带内。超级地球与类地行星是搜索重点（开普勒-452b、TRAPPIST-1 系统）。

生命三要素：液态水、能量来源、合适化学元素（碳基）。搜索生命指标：大气生物标记（氧、甲烷、磷化氢）。

德雷克方程估算银河系文明数：N=R*×fp×ne×fl×fi×fc×L。每项都是未知数，费米悖论：银河系应该有大量文明，为什么我们没看到？

未来计划：韦伯太空望远镜（2021 发射）研究系外行星大气、宜居世界天文台（HWO）直接成像类地行星。',
'掌握系外行星探测',
'["凌日法径向速度法","宜居带液态水","德雷克方程","费米悖论"]',
'advanced', 12, 3),
(176, 52, '宇宙学与大爆炸',
'宇宙学是研究宇宙整体起源与演化的科学。大爆炸理论：宇宙从极高温高密状态膨胀至今约 138 亿年。

<b>宇宙学关键证据表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">证据</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">意义</th></tr>
<tr><td style="border:1px solid #999;padding:6px">哈勃定律</td><td style="border:1px solid #999;padding:6px">星系退行 v=H₀d</td><td style="border:1px solid #999;padding:6px">宇宙在膨胀</td></tr>
<tr><td style="border:1px solid #999;padding:6px">微波背景辐射</td><td style="border:1px solid #999;padding:6px">2.725K 各向同性</td><td style="border:1px solid #999;padding:6px">大爆炸余晖</td></tr>
<tr><td style="border:1px solid #999;padding:6px">元素丰度</td><td style="border:1px solid #999;padding:6px">H:He≈3:1</td><td style="border:1px solid #999;padding:6px">原初核合成</td></tr>
<tr><td style="border:1px solid #999;padding:6px">星系演化</td><td style="border:1px solid #999;padding:6px">远星系更年轻</td><td style="border:1px solid #999;padding:6px">演化史</td></tr>
</table>

宇宙组成（普朗克卫星 2018 数据）：普通物质 4.9%、暗物质 26.8%、暗能量 68.3%。我们了解的"正常物质"不到 5%！

暗物质：不发光但有引力效应（星系旋转曲线、引力透镜），候选者 WIMP/轴子。暗能量：驱动宇宙加速膨胀（1998 年诺奖），可能来自真空能。

宇宙时间线：大爆炸→暴涨→原初核合成→复合(CMB)→第一代恒星→星系形成→太阳系→现在。宇宙微波背景辐射的微扰揭示结构起源。

宇宙的未来：加速膨胀持续→大撕裂/大冻结/热寂。可观测宇宙半径约 460 亿光年。暗能量是最大谜团。',
'掌握宇宙学三大证据',
'["哈勃定律宇宙膨胀","CMB是宇宙余晖","暗物质26.8%暗能量68.3%","宇宙加速膨胀"]',
'advanced', 12, 4),
(177, 52, '航天探索',
'人类航天里程碑：1957 年斯普特尼克、1961 年加加林、1969 年阿波罗 11 登月、1998 年国际空间站、2021 年韦伯望远镜。

<b>深空探测任务对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">任务</th><th style="border:1px solid #999;padding:6px">目标</th><th style="border:1px solid #999;padding:6px">成就</th></tr>
<tr><td style="border:1px solid #999;padding:6px">旅行者1号</td><td style="border:1px solid #999;padding:6px">太阳系边界</td><td style="border:1px solid #999;padding:6px">已进入星际空间</td></tr>
<tr><td style="border:1px solid #999;padding:6px">好奇号/毅力号</td><td style="border:1px solid #999;padding:6px">火星</td><td style="border:1px solid #999;padding:6px">找水找生命证据</td></tr>
<tr><td style="border:1px solid #999;padding:6px">朱诺号</td><td style="border:1px solid #999;padding:6px">木星</td><td style="border:1px solid #999;padding:6px">大红斑内部结构</td></tr>
<tr><td style="border:1px solid #999;padding:6px">卡西尼号</td><td style="border:1px solid #999;padding:6px">土星</td><td style="border:1px solid #999;padding:6px">土卫二喷泉</td></tr>
<tr><td style="border:1px solid #999;padding:6px">嫦娥系列</td><td style="border:1px solid #999;padding:6px">月球背面采样</td><td style="border:1px solid #999;padding:6px">嫦娥五号月壤</td></tr>
</table>

火箭原理：动量守恒（喷出燃气获得推力）。多级火箭提高最终速度。轨道速度：环绕速度 7.9km/s、逃逸速度 11.2km/s。

国际空间站：离地约 400km，速度约 7.66km/s，90 分钟绕地球一圈，太阳帆与再补给。太空环境：微重力、辐射、真空。

火星计划：SpaceX 星舰、NASA 阿耳忒弥斯重返月球。火星车已发现古代河床与有机物。载人深空挑战：辐射防护、生命维持、心理。

中国航天：长征系列、天宫空间站（2022 建成）、嫦娥探月、天问探火（2021 祝融号着陆）。航天精神与科学普及推动全民科学素养。',
'掌握航天基本知识',
'["环绕速度7.9km/s","旅行者已入星际空间","火星寻找生命证据","中国航天三步走"]',
'beginner', 12, 5);

INSERT IGNORE INTO sekai_learning_quiz_questions (id, lesson_id, question, question_type, options, correct_answer, explanation, sort_order) VALUES
(275, 138, '真空中的光速约为？', 'single', '[{"label":"A","text":"3×10⁸ m/s"},{"label":"B","text":"3×10⁶ m/s"},{"label":"C","text":"3×10¹⁰ m/s"},{"label":"D","text":"3×10⁴ m/s"}]', 'A', '真空光速约 30 万公里每秒', 1),
(276, 138, '光纤通信利用的原理是？', 'single', '[{"label":"A","text":"全反射"},{"label":"B","text":"折射"},{"label":"C","text":"衍射"},{"label":"D","text":"色散"}]', 'A', '光在纤芯与包层界面全反射传输', 2),
(277, 139, '杨氏双缝实验证明了光的？', 'single', '[{"label":"A","text":"波动性"},{"label":"B","text":"粒子性"},{"label":"C","text":"热效应"},{"label":"D","text":"化学效应"}]', 'A', '干涉图样证明波动性', 1),
(278, 139, '光学显微镜分辨率极限约为？', 'single', '[{"label":"A","text":"200nm"},{"label":"B","text":"2mm"},{"label":"C","text":"2cm"},{"label":"D","text":"20nm"}]', 'A', '受波长限制约 200nm', 2),
(279, 140, '照相机成像原理是物距？', 'single', '[{"label":"A","text":"u>2f"},{"label":"B","text":"u<f"},{"label":"C","text":"f<u<2f"},{"label":"D","text":"u=f"}]', 'A', 'u>2f 成倒立缩小实像', 1),
(280, 140, '近视眼的矫正镜片是？', 'single', '[{"label":"A","text":"凹透镜"},{"label":"B","text":"凸透镜"},{"label":"C","text":"平面镜"},{"label":"D","text":"棱镜"}]', 'A', '近视像在视网膜前，凹透镜发散矫正', 2),
(281, 141, '光子能量公式是？', 'single', '[{"label":"A","text":"E=hf"},{"label":"B","text":"E=mc²"},{"label":"C","text":"E=1/2mv²"},{"label":"D","text":"E=mgh"}]', 'A', '普朗克关系 E=hf', 1),
(282, 141, '光电效应表明光的？', 'single', '[{"label":"A","text":"粒子性"},{"label":"B","text":"波动性"},{"label":"C","text":"干涉性"},{"label":"D","text":"衍射性"}]', 'A', '光电效应只有光子解释', 2),
(283, 142, '激光的突出特性不包括？', 'single', '[{"label":"A","text":"方向性差"},{"label":"B","text":"单色性好"},{"label":"C","text":"亮度高"},{"label":"D","text":"相干性好"}]', 'A', '激光四特性: 方向/单色/相干/亮度', 1),
(284, 142, '哈勃望远镜属于哪种望远镜？', 'single', '[{"label":"A","text":"反射式"},{"label":"B","text":"折射式"},{"label":"C","text":"射电式"},{"label":"D","text":"全息式"}]', 'A', '哈勃是反射式光学望远镜', 2),
(285, 143, '水的比热容约为？', 'single', '[{"label":"A","text":"4200 J/(kg·℃)"},{"label":"B","text":"460 J/(kg·℃)"},{"label":"C","text":"880 J/(kg·℃)"},{"label":"D","text":"2100 J/(kg·℃)"}]', 'A', '水比热容最大约4200', 1),
(286, 143, '热传递不需要介质的方式是？', 'single', '[{"label":"A","text":"辐射"},{"label":"B","text":"传导"},{"label":"C","text":"对流"},{"label":"D","text":"扩散"}]', 'A', '辐射是电磁波传播不需要介质', 2),
(287, 144, '下列吸热过程是？', 'single', '[{"label":"A","text":"熔化"},{"label":"B","text":"凝固"},{"label":"C","text":"液化"},{"label":"D","text":"凝华"}]', 'A', '熔化汽化升华吸热', 1),
(288, 144, '干冰人工降雨利用的是？', 'single', '[{"label":"A","text":"升华吸热"},{"label":"B","text":"熔化放热"},{"label":"C","text":"液化吸热"},{"label":"D","text":"凝固放热"}]', 'A', '干冰升华吸热降温水汽凝结', 2),
(289, 145, '热力学第一定律表达式是？', 'single', '[{"label":"A","text":"ΔU=Q+W"},{"label":"B","text":"ΔU=Q-W"},{"label":"C","text":"ΔU=W"},{"label":"D","text":"ΔU=Q"}]', 'A', '内能变化=吸热+外界做功', 1),
(290, 145, '卡诺热机效率公式是？', 'single', '[{"label":"A","text":"1-T₂/T₁"},{"label":"B","text":"T₂/T₁"},{"label":"C","text":"1+T₂/T₁"},{"label":"D","text":"T₁/T₂"}]', 'A', 'η=1-T冷/T热', 2),
(291, 146, '汽油机做功冲程能量转化是？', 'single', '[{"label":"A","text":"内能转机械能"},{"label":"B","text":"机械能转内能"},{"label":"C","text":"电能转光能"},{"label":"D","text":"化学能转电能"}]', 'A', '燃料燃烧内能做功', 1),
(292, 146, '第二类永动机违反的是？', 'single', '[{"label":"A","text":"热力学第二定律"},{"label":"B","text":"第一定律"},{"label":"C","text":"牛顿定律"},{"label":"D","text":"万有引力"}]', 'A', '完全转化热为功违反第二定律', 2),
(293, 147, '温度不变时气体压强与体积关系是？', 'single', '[{"label":"A","text":"p₁V₁=p₂V₂"},{"label":"B","text":"p₁/T₁=p₂/T₂"},{"label":"C","text":"V₁/T₁=V₂/T₂"},{"label":"D","text":"pV²=常数"}]', 'A', '玻意耳定律', 1),
(294, 147, '布朗运动证明的是？', 'single', '[{"label":"A","text":"分子在运动"},{"label":"B","text":"分子间有引力"},{"label":"C","text":"分子有大小"},{"label":"D","text":"气体有压强"}]', 'A', '悬浮微粒无规则运动证明分子运动', 2),
(295, 148, '库仑定律公式是？', 'single', '[{"label":"A","text":"F=kq₁q₂/r²"},{"label":"B","text":"F=GMm/r²"},{"label":"C","text":"F=ma"},{"label":"D","text":"F=qvB"}]', 'A', '点电荷间库仑力平方反比', 1),
(296, 148, '匀强电场中场强与电势差关系？', 'single', '[{"label":"A","text":"E=U/d"},{"label":"B","text":"E=Ud"},{"label":"C","text":"U=Ed²"},{"label":"D","text":"E=d/U"}]', 'A', 'E=U/d 电势梯度', 2),
(297, 149, '安培力方向用哪个定则判断？', 'single', '[{"label":"A","text":"左手定则"},{"label":"B","text":"右手定则"},{"label":"C","text":"安培定则"},{"label":"D","text":"右手螺旋"}]', 'A', '左手力右手电', 1),
(298, 149, '带电粒子垂直进入匀强磁场做？', 'single', '[{"label":"A","text":"匀速圆周运动"},{"label":"B","text":"匀加速直线"},{"label":"C","text":"平抛运动"},{"label":"D","text":"简谐运动"}]', 'A', '洛伦兹力提供向心力', 2),
(299, 150, '感应电动势大小与什么有关？', 'single', '[{"label":"A","text":"磁通量变化率"},{"label":"B","text":"磁通量大小"},{"label":"C","text":"磁场强弱"},{"label":"D","text":"线圈面积"}]', 'A', 'E=nΔΦ/Δt 与变化率有关', 1),
(300, 150, '楞次定律的实质是？', 'single', '[{"label":"A","text":"阻碍磁通量变化"},{"label":"B","text":"加快磁通量变化"},{"label":"C","text":"产生恒定电流"},{"label":"D","text":"消除磁场"}]', 'A', '感应电流阻碍引起它的磁通量变化', 2),
(301, 151, '我国市电频率是？', 'single', '[{"label":"A","text":"50Hz"},{"label":"B","text":"60Hz"},{"label":"C","text":"100Hz"},{"label":"D","text":"220Hz"}]', 'A', '中国交流电 50Hz', 1),
(302, 151, '220V 交流电的峰值是？', 'single', '[{"label":"A","text":"约311V"},{"label":"B","text":"约220V"},{"label":"C","text":"约380V"},{"label":"D","text":"约440V"}]', 'A', 'Uₘ=√2×U≈311V', 2),
(303, 152, '电磁波的传播速度是？', 'single', '[{"label":"A","text":"光速"},{"label":"B","text":"声速"},{"label":"C","text":"超音速"},{"label":"D","text":"不定"}]', 'A', '电磁波真空速度等于光速', 1),
(304, 152, '穿透能力最强的是？', 'single', '[{"label":"A","text":"γ射线"},{"label":"B","text":"红外线"},{"label":"C","text":"微波"},{"label":"D","text":"紫外线"}]', 'A', 'γ射线频率最高穿透最强', 2),
(305, 153, '周期表的周期数与什么有关？', 'single', '[{"label":"A","text":"电子层数"},{"label":"B","text":"质子数"},{"label":"C","text":"中子数"},{"label":"D","text":"电子数"}]', 'A', '周期数=电子层数', 1),
(306, 153, '同周期从左到右金属性？', 'single', '[{"label":"A","text":"减弱"},{"label":"B","text":"增强"},{"label":"C","text":"不变"},{"label":"D","text":"先强后弱"}]', 'A', '同周期左到右金属性减弱非金属增强', 2),
(307, 154, 'NaCl 中的化学键是？', 'single', '[{"label":"A","text":"离子键"},{"label":"B","text":"共价键"},{"label":"C","text":"金属键"},{"label":"D","text":"氢键"}]', 'A', '活泼金属与非金属形成离子键', 1),
(308, 154, '水的沸点异常高与什么有关？', 'single', '[{"label":"A","text":"氢键"},{"label":"B","text":"共价键"},{"label":"C","text":"离子键"},{"label":"D","text":"金属键"}]', 'A', '水分子间氢键使沸点升高', 2),
(309, 155, '还原剂在反应中？', 'single', '[{"label":"A","text":"失电子被氧化"},{"label":"B","text":"得电子被还原"},{"label":"C","text":"化合价降低"},{"label":"D","text":"被还原"}]', 'A', '还原剂失电子自身被氧化', 1),
(310, 155, '氧化还原反应的本质是？', 'single', '[{"label":"A","text":"电子转移"},{"label":"B","text":"原子重组"},{"label":"C","text":"能量吸收"},{"label":"D","text":"颜色变化"}]', 'A', '本质是电子转移', 2),
(311, 156, '[Cu(NH₃)₄]²⁺ 的配位数是？', 'single', '[{"label":"A","text":"4"},{"label":"B","text":"2"},{"label":"C","text":"6"},{"label":"D","text":"8"}]', 'A', '四个氨配体配位数4', 1),
(312, 156, '检验 Fe³⁺ 的显色反应是？', 'single', '[{"label":"A","text":"SCN⁻血红色"},{"label":"B","text":"NaOH白色沉淀"},{"label":"C","text":"AgNO₃白色"},{"label":"D","text":"淀粉变蓝"}]', 'A', '[Fe(SCN)]²⁺ 血红色', 2),
(313, 157, '标况下 1mol 气体体积是？', 'single', '[{"label":"A","text":"22.4L"},{"label":"B","text":"2.24L"},{"label":"C","text":"224L"},{"label":"D","text":"11.2L"}]', 'A', '标况 22.4L/mol', 1),
(314, 157, '物质的量浓度公式是？', 'single', '[{"label":"A","text":"c=n/V"},{"label":"B","text":"c=m/V"},{"label":"C","text":"c=n×V"},{"label":"D","text":"c=N/V"}]', 'A', 'c=n/V 单位 mol/L', 2),
(315, 158, '烷烃的通式是？', 'single', '[{"label":"A","text":"CₙH₂ₙ₊₂"},{"label":"B","text":"CₙH₂ₙ"},{"label":"C","text":"CₙH₂ₙ₋₂"},{"label":"D","text":"CₙHₙ"}]', 'A', '饱和烃 CₙH₂ₙ₊₂', 1),
(316, 158, '最简单的烷烃是？', 'single', '[{"label":"A","text":"甲烷"},{"label":"B","text":"乙烷"},{"label":"C","text":"丙烷"},{"label":"D","text":"丁烷"}]', 'A', '甲烷 CH₄', 2),
(317, 159, '乙烯使溴水褪色是？', 'single', '[{"label":"A","text":"加成反应"},{"label":"B","text":"取代反应"},{"label":"C","text":"酯化反应"},{"label":"D","text":"消去反应"}]', 'A', '双键与溴加成', 1),
(318, 159, '乙炔的分子构型是？', 'single', '[{"label":"A","text":"直线型"},{"label":"B","text":"平面型"},{"label":"C","text":"三角锥"},{"label":"D","text":"四面体"}]', 'A', '三键 sp 杂化直线型', 2),
(319, 160, '苯与溴水混合的现象是？', 'single', '[{"label":"A","text":"萃取分层不反应"},{"label":"B","text":"褪色反应"},{"label":"C","text":"生成沉淀"},{"label":"D","text":"爆炸"}]', 'A', '苯萃取溴但苯环不加成', 1),
(320, 160, '苯的硝化反应条件是？', 'single', '[{"label":"A","text":"浓硫酸浓硝酸"},{"label":"B","text":"氢氧化钠"},{"label":"C","text":"盐酸"},{"label":"D","text":"水浴即可"}]', 'A', '苯+浓HNO₃/浓H₂SO₄ 硝化', 2),
(321, 161, '检验醛基的银镜反应试剂是？', 'single', '[{"label":"A","text":"银氨溶液"},{"label":"B","text":"CuSO₄"},{"label":"C","text":"FeCl₃"},{"label":"D","text":"碘水"}]', 'A', '氨性银氨溶液生成银镜', 1),
(322, 161, '苯酚与 FeCl₃ 反应显？', 'single', '[{"label":"A","text":"紫色"},{"label":"B","text":"红色"},{"label":"C","text":"蓝色"},{"label":"D","text":"绿色"}]', 'A', '苯酚遇三氯化铁显紫色', 2),
(323, 162, '酯化反应的机理是？', 'single', '[{"label":"A","text":"酸脱羟基醇脱氢"},{"label":"B","text":"酸脱氢醇脱羟基"},{"label":"C","text":"同时脱水"},{"label":"D","text":"分子间脱水"}]', 'A', '酯化: 羧酸提供-OH', 1),
(324, 162, '塑料降解的绿色材料是？', 'single', '[{"label":"A","text":"PLA聚乳酸"},{"label":"B","text":"PVC聚氯乙烯"},{"label":"C","text":"PE聚乙烯"},{"label":"D","text":"PS聚苯乙烯"}]', 'A', 'PLA 可生物降解', 2),
(325, 163, '有氧呼吸的主要场所是？', 'single', '[{"label":"A","text":"线粒体"},{"label":"B","text":"叶绿体"},{"label":"C","text":"核糖体"},{"label":"D","text":"内质网"}]', 'A', '线粒体是有氧呼吸主要场所', 1),
(326, 163, '蛋白质合成的场所是？', 'single', '[{"label":"A","text":"核糖体"},{"label":"B","text":"线粒体"},{"label":"C","text":"高尔基体"},{"label":"D","text":"溶酶体"}]', 'A', '核糖体是蛋白质合成工厂', 2),
(327, 164, 'DNA 中与 A 配对的碱基是？', 'single', '[{"label":"A","text":"T"},{"label":"B","text":"C"},{"label":"C","text":"G"},{"label":"D","text":"U"}]', 'A', 'A-T 碱基互补', 1),
(328, 164, '翻译过程的模板是？', 'single', '[{"label":"A","text":"mRNA"},{"label":"B","text":"DNA"},{"label":"C","text":"tRNA"},{"label":"D","text":"rRNA"}]', 'A', '核糖体以 mRNA 为模板翻译', 2),
(329, 165, '有丝分裂观察染色体的最佳时期是？', 'single', '[{"label":"A","text":"中期"},{"label":"B","text":"前期"},{"label":"C","text":"后期"},{"label":"D","text":"末期"}]', 'A', '中期染色体排列赤道板最清晰', 1),
(330, 165, '减数分裂使染色体数目？', 'single', '[{"label":"A","text":"减半"},{"label":"B","text":"加倍"},{"label":"C","text":"不变"},{"label":"D","text":"不确定"}]', 'A', '减数分裂染色体减半', 2),
(331, 166, '基因工程的分子剪刀是？', 'single', '[{"label":"A","text":"限制酶"},{"label":"B","text":"DNA连接酶"},{"label":"C","text":"解旋酶"},{"label":"D","text":"聚合酶"}]', 'A', '限制酶切割特定序列', 1),
(332, 166, 'CRISPR 是什么技术？', 'single', '[{"label":"A","text":"基因编辑"},{"label":"B","text":"基因测序"},{"label":"C","text":"蛋白质工程"},{"label":"D","text":"细胞培养"}]', 'A', 'CRISPR/Cas9 基因编辑', 2),
(333, 167, '分离定律的典型性状分离比是？', 'single', '[{"label":"A","text":"3:1"},{"label":"B","text":"9:3:3:1"},{"label":"C","text":"1:1"},{"label":"D","text":"2:1"}]', 'A', '一对相对性状杂交 F₂ 3:1', 1),
(334, 167, '验证基因型的方法叫？', 'single', '[{"label":"A","text":"测交"},{"label":"B","text":"自交"},{"label":"C","text":"杂交"},{"label":"D","text":"回交"}]', 'A', '与隐性纯合子测交', 2),
(335, 168, '酶的化学本质绝大多数是？', 'single', '[{"label":"A","text":"蛋白质"},{"label":"B","text":"糖类"},{"label":"C","text":"脂质"},{"label":"D","text":"核酸"}]', 'A', '绝大多数酶是蛋白质', 1),
(336, 168, '高温使酶失活的原因是？', 'single', '[{"label":"A","text":"蛋白质变性"},{"label":"B","text":"活性位点变大"},{"label":"C","text":"底物减少"},{"label":"D","text":"pH改变"}]', 'A', '高温破坏空间结构不可逆', 2),
(337, 169, '有氧呼吸第三阶段产物是？', 'single', '[{"label":"A","text":"水"},{"label":"B","text":"CO₂"},{"label":"C","text":"酒精"},{"label":"D","text":"乳酸"}]', 'A', '[H]与O₂结合生成水', 1),
(338, 169, '剧烈运动肌肉产生的是？', 'single', '[{"label":"A","text":"乳酸"},{"label":"B","text":"酒精"},{"label":"C","text":"CO₂和水"},{"label":"D","text":"丙酮酸"}]', 'A', '动物无氧呼吸产生乳酸', 2),
(339, 170, '光反应的产物包括？', 'single', '[{"label":"A","text":"O₂和ATP"},{"label":"B","text":"CO₂"},{"label":"C","text":"葡萄糖"},{"label":"D","text":"乳酸"}]', 'A', '光反应放氧产ATP和[H]', 1),
(340, 170, '暗反应的场所是？', 'single', '[{"label":"A","text":"叶绿体基质"},{"label":"B","text":"类囊体"},{"label":"C","text":"细胞质"},{"label":"D","text":"线粒体"}]', 'A', '卡尔文循环在基质进行', 2),
(341, 171, '1g 脂肪供能约为糖类的？', 'single', '[{"label":"A","text":"2倍多"},{"label":"B","text":"相同"},{"label":"C","text":"一半"},{"label":"D","text":"10倍"}]', 'A', '脂肪约38kJ/g糖约17kJ/g', 1),
(342, 171, 'n个氨基酸形成1条肽链的肽键数是？', 'single', '[{"label":"A","text":"n-1"},{"label":"B","text":"n"},{"label":"C","text":"n+1"},{"label":"D","text":"2n"}]', 'A', '肽键数=氨基酸数-肽链数', 2),
(343, 172, '降低血糖的激素是？', 'single', '[{"label":"A","text":"胰岛素"},{"label":"B","text":"胰高血糖素"},{"label":"C","text":"甲状腺素"},{"label":"D","text":"生长激素"}]', 'A', '胰岛素降血糖', 1),
(344, 172, '维持稳态的主要方式是？', 'single', '[{"label":"A","text":"负反馈"},{"label":"B","text":"正反馈"},{"label":"C","text":"前馈"},{"label":"D","text":"开环"}]', 'A', '负反馈抑制过程维持稳定', 2),
(345, 173, '太阳目前处于哪个阶段？', 'single', '[{"label":"A","text":"主序星"},{"label":"B","text":"红巨星"},{"label":"C","text":"白矮星"},{"label":"D","text":"中子星"}]', 'A', '太阳在主序阶段燃烧氢', 1),
(346, 173, '超新星爆炸合成的主要是？', 'single', '[{"label":"A","text":"重元素"},{"label":"B","text":"氢气"},{"label":"C","text":"氦气"},{"label":"D","text":"暗物质"}]', 'A', '超新星合成金铀等重元素', 2),
(347, 174, '黑洞边界叫？', 'single', '[{"label":"A","text":"事件视界"},{"label":"B","text":"史瓦西层"},{"label":"C","text":"吸积盘"},{"label":"D","text":"奇点"}]', 'A', '事件视界内光不可逃逸', 1),
(348, 174, '2015年首次直接探测到的是？', 'single', '[{"label":"A","text":"引力波"},{"label":"B","text":"黑洞照片"},{"label":"C","text":"暗物质"},{"label":"D","text":"系外行星"}]', 'A', 'LIGO 2015 探测引力波', 2),
(349, 175, '太阳系外行星首颗发现于？', 'single', '[{"label":"A","text":"1995年"},{"label":"B","text":"1975年"},{"label":"C","text":"2005年"},{"label":"D","text":"1955年"}]', 'A', '1995 飞马座51b', 1),
(350, 175, '宜居带指行星距恒星距离使什么存在？', 'single', '[{"label":"A","text":"液态水"},{"label":"B","text":"大气层"},{"label":"C","text":"磁场"},{"label":"D","text":"卫星"}]', 'A', '液态水稳定存在的区域', 2),
(351, 176, '哈勃定律表明宇宙在？', 'single', '[{"label":"A","text":"膨胀"},{"label":"B","text":"收缩"},{"label":"C","text":"静止"},{"label":"D","text":"脉动"}]', 'A', '星系退行速度与距离成正比', 1),
(352, 176, '宇宙年龄约为？', 'single', '[{"label":"A","text":"138亿年"},{"label":"B","text":"46亿年"},{"label":"C","text":"500亿年"},{"label":"D","text":"1000亿年"}]', 'A', '大爆炸至今约138亿年', 2),
(353, 177, '第一宇宙速度是？', 'single', '[{"label":"A","text":"7.9km/s"},{"label":"B","text":"11.2km/s"},{"label":"C","text":"16.7km/s"},{"label":"D","text":"3km/s"}]', 'A', '环绕速度7.9km/s', 1),
(354, 177, '中国首辆火星车是？', 'single', '[{"label":"A","text":"祝融号"},{"label":"B","text":"玉兔号"},{"label":"C","text":"天问号"},{"label":"D","text":"嫦娥号"}]', 'A', '祝融号2021着陆火星', 2);