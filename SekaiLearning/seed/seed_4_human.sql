-- =============================================
-- 知识库大扩充 Part4: 人文社科
-- courses 53-64, lessons 178-237, quiz 355-474
-- =============================================

INSERT IGNORE INTO sekai_learning_courses (id, subject_id, name, description, difficulty, estimated_hours, lesson_count, sort_order) VALUES
(53, 4, '世界文明史扩展', '古代文明与世界帝国', 'beginner', 3, 5, 1),
(54, 5, '社会心理学', '从众、偏见与群体行为', 'intermediate', 3, 5, 2),
(55, 9, '微观经济学', '消费者与厂商行为', 'intermediate', 3, 5, 3),
(56, 9, '宏观经济学', 'GDP、通胀与货币政策', 'intermediate', 4, 5, 4),
(57, 10, '哲学导论', '形而上学、认识论与伦理', 'intermediate', 3, 5, 5),
(58, 12, '文学名著精读', '中外经典文本赏析', 'beginner', 3, 5, 6),
(59, 13, '音乐欣赏', '古典、流行与电子音乐', 'beginner', 3, 5, 7),
(60, 14, '世界地理', '气候、地形与区域', 'intermediate', 4, 5, 8),
(61, 17, '运动与健康', '训练、恢复与营养', 'beginner', 3, 5, 9),
(62, 18, '法律基础', '宪法、民法与刑法', 'beginner', 3, 5, 10),
(63, 19, '国际关系', '权力、秩序与全球化', 'intermediate', 4, 5, 11),
(64, 8, '日语进阶', '语法、敬语与文化', 'intermediate', 4, 5, 12);

INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(178, 53, '四大古代文明',
'人类文明四大发源地：两河流域、尼罗河流域、印度河流域、黄河长江流域。农业革命（约一万年前）让定居与城市成为可能。

<b>四大文明对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">文明</th><th style="border:1px solid #999;padding:6px">流域</th><th style="border:1px solid #999;padding:6px">文字</th><th style="border:1px solid #999;padding:6px">标志性成就</th></tr>
<tr><td style="border:1px solid #999;padding:6px">美索不达米亚</td><td style="border:1px solid #999;padding:6px">两河</td><td style="border:1px solid #999;padding:6px">楔形文字</td><td style="border:1px solid #999;padding:6px">汉谟拉比法典</td></tr>
<tr><td style="border:1px solid #999;padding:6px">古埃及</td><td style="border:1px solid #999;padding:6px">尼罗河</td><td style="border:1px solid #999;padding:6px">象形文字</td><td style="border:1px solid #999;padding:6px">金字塔与木乃伊</td></tr>
<tr><td style="border:1px solid #999;padding:6px">古印度</td><td style="border:1px solid #999;padding:6px">印度河</td><td style="border:1px solid #999;padding:6px">印章文字</td><td style="border:1px solid #999;padding:6px">种姓制度与佛教</td></tr>
<tr><td style="border:1px solid #999;padding:6px">古中国</td><td style="border:1px solid #999;padding:6px">黄河长江</td><td style="border:1px solid #999;padding:6px">甲骨文</td><td style="border:1px solid #999;padding:6px">青铜器与汉字</td></tr>
</table>

文明的共同特征：城市、文字、社会分层、大型公共建筑、农业剩余。大河文明因灌溉协作产生组织化权力。

文字的意义：记录、行政、知识传承。楔形文字与甲骨文都是最早的成熟文字系统。埃及象形文字（罗塞塔石碑破解）。

汉谟拉比法典：迄今最完整的古代法典，"以眼还眼"同态复仇原则，体现"法律面前一定程度平等"。法典石碑现存卢浮宫。',
'掌握四大文明与共同特征',
'["四大文明发源地","文明五特征","楔形与象形文字","汉谟拉比法典"]',
'beginner', 12, 1),
(179, 53, '古希腊与罗马',
'古希腊是西方文明的摇篮：哲学、民主、科学。古罗马继承希腊文化，建立横跨三洲的帝国与法律体系。

<b>希腊罗马对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">项目</th><th style="border:1px solid #999;padding:6px">古希腊</th><th style="border:1px solid #999;padding:6px">古罗马</th></tr>
<tr><td style="border:1px solid #999;padding:6px">政治</td><td style="border:1px solid #999;padding:6px">城邦民主</td><td style="border:1px solid #999;padding:6px">共和与帝国</td></tr>
<tr><td style="border:1px solid #999;padding:6px">哲学</td><td style="border:1px solid #999;padding:6px">苏格拉底/柏拉图/亚里士多德</td><td style="border:1px solid #999;padding:6px">斯多葛主义</td></tr>
<tr><td style="border:1px solid #999;padding:6px">贡献</td><td style="border:1px solid #999;padding:6px">逻辑学、几何、民主</td><td style="border:1px solid #999;padding:6px">罗马法、工程、历法</td></tr>
<tr><td style="border:1px solid #999;padding:6px">建筑</td><td style="border:1px solid #999;padding:6px">帕特农神庙</td><td style="border:1px solid #999;padding:6px">斗兽场、高架水渠</td></tr>
</table>

雅典民主：公民大会直接民主（仅限成年男性公民），伯里克利时代鼎盛。僭主政治与寡头政治是反面参照。

罗马法发展：十二铜表法→万民法→查士丁尼法典（民法大全）。原则：人人生而平等、契约自由。罗马法影响现代大陆法系。

亚历山大大帝东征：希腊化时代，希腊文化传播到埃及、波斯、印度。亚历山大图书馆是古代知识中心。罗马帝国 476 年西罗马灭亡，东罗马（拜占庭）延续千年。',
'掌握希腊罗马文明',
'["雅典公民民主","罗马法影响现代法律","希腊化时代","查士丁尼法典"]',
'beginner', 12, 2),
(180, 53, '中世纪的帝国',
'中世纪（约 500-1500 年）三大文明圈：欧洲基督教世界、伊斯兰世界、东亚帝国。丝绸之路连接东西方。

<b>中世纪主要帝国对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">帝国</th><th style="border:1px solid #999;padding:6px">时间</th><th style="border:1px solid #999;padding:6px">贡献</th></tr>
<tr><td style="border:1px solid #999;padding:6px">拜占庭</td><td style="border:1px solid #999;padding:6px">395-1453</td><td style="border:1px solid #999;padding:6px">保存古典典籍</td></tr>
<tr><td style="border:1px solid #999;padding:6px">阿拉伯帝国</td><td style="border:1px solid #999;padding:6px">632-1258</td><td style="border:1px solid #999;padding:6px">数学/医学/翻译</td></tr>
<tr><td style="border:1px solid #999;padding:6px">查理曼帝国</td><td style="border:1px solid #999;padding:6px">800-843</td><td style="border:1px solid #999;padding:6px">欧洲封建基础</td></tr>
<tr><td style="border:1px solid #999;padding:6px">蒙古帝国</td><td style="border:1px solid #999;padding:6px">1206-1368</td><td style="border:1px solid #999;padding:6px">重开丝绸之路</td></tr>
<tr><td style="border:1px solid #999;padding:6px">唐/宋</td><td style="border:1px solid #999;padding:6px">618-1279</td><td style="border:1px solid #999;padding:6px">科举/四大发明</td></tr>
</table>

阿拉伯百年翻译运动：保存并发展希腊科学，代数（al-jabr）与数字系统经阿拉伯传入欧洲，图书馆与大学兴起。

欧洲封建制度：领主-封臣关系、庄园经济、骑士文化。教会是统一精神力量，大学（博洛尼亚、巴黎）从中世纪诞生。

十字军东征（1096-1291）：宗教战争也是东西交流，带回阿拉伯学术与东方商品。黑死病（1347-1353）夺走欧洲三分之一人口，改变劳动力格局。

蒙古帝国：成吉思汗统一草原，蒙古和平保障欧亚商路安全，马可波罗东游的记载激发欧洲东方想象。',
'掌握中世纪文明格局',
'["三大文明圈并存","阿拉伯保存科学","封建庄园与大学兴起","蒙古和平重开丝路"]',
'beginner', 12, 3),
(181, 53, '大航海与殖民',
'15 世纪欧洲人开启大航海：航海技术（罗盘、星盘、帆船）与寻找东方贸易路线的冲动。迪亚士、达伽马、哥伦布、麦哲伦是代表人物。

<b>大航海关键航线表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">航海家</th><th style="border:1px solid #999;padding:6px">时间</th><th style="border:1px solid #999;padding:6px">航线</th><th style="border:1px solid #999;padding:6px">意义</th></tr>
<tr><td style="border:1px solid #999;padding:6px">哥伦布</td><td style="border:1px solid #999;padding:6px">1492</td><td style="border:1px solid #999;padding:6px">横渡大西洋</td><td style="border:1px solid #999;padding:6px">发现美洲</td></tr>
<tr><td style="border:1px solid #999;padding:6px">达伽马</td><td style="border:1px solid #999;padding:6px">1498</td><td style="border:1px solid #999;padding:6px">绕好望角到印度</td><td style="border:1px solid #999;padding:6px">开通欧印航线</td></tr>
<tr><td style="border:1px solid #999;padding:6px">麦哲伦</td><td style="border:1px solid #999;padding:6px">1519-1522</td><td style="border:1px solid #999;padding:6px">环球航行</td><td style="border:1px solid #999;padding:6px">证明地球是圆的</td></tr>
</table>

"地理大发现"的连锁反应：全球贸易网络形成（三角贸易）、物种大交换（哥伦布大交换：土豆玉米传欧，马牛羊传美）、殖民体系建立（西班牙葡萄牙分天下）。

罪恶的三角贸易：欧洲枪支→非洲奴隶→美洲糖棉→欧洲。黑奴贸易持续数百年，上千万非洲人被迫离乡。

殖民影响：欧洲资本原始积累、美洲文明遭破坏、世界市场雏形形成。葡萄牙巴西、西班牙拉丁美洲、英国北美与印度、荷兰东南亚。

殖民时代开启近代全球化：白银流向东方（中国明朝吸收世界白银）、全球作物传播改变各地饮食结构。',
'掌握大航海与殖民',
'["哥伦布发现美洲","麦哲伦环球证明地球圆","哥伦布大交换","三角贸易与殖民体系"]',
'beginner', 12, 4),
(182, 53, '工业革命与近代转型',
'工业革命（1760 年代起）以英国为起点：蒸汽机、纺织机、铁路，人类进入机器生产时代。三次工业革命重塑世界。

<b>三次工业革命对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">次别</th><th style="border:1px solid #999;padding:6px">时间</th><th style="border:1px solid #999;padding:6px">核心技术</th><th style="border:1px solid #999;padding:6px">标志</th></tr>
<tr><td style="border:1px solid #999;padding:6px">第一次</td><td style="border:1px solid #999;padding:6px">1760-1840</td><td style="border:1px solid #999;padding:6px">蒸汽动力</td><td style="border:1px solid #999;padding:6px">蒸汽机/铁路</td></tr>
<tr><td style="border:1px solid #999;padding:6px">第二次</td><td style="border:1px solid #999;padding:6px">1870-1914</td><td style="border:1px solid #999;padding:6px">电力与内燃机</td><td style="border:1px solid #999;padding:6px">电灯/汽车/电话</td></tr>
<tr><td style="border:1px solid #999;padding:6px">第三次</td><td style="border:1px solid #999;padding:6px">1970s-</td><td style="border:1px solid #999;padding:6px">计算机与互联网</td><td style="border:1px solid #999;padding:6px">PC/万维网</td></tr>
</table>

工业革命前提：圈地运动（劳动力）、殖民掠夺（资本）、科学进步（技术）、国内市场（需求）。瓦特改良蒸汽机是关键突破。

社会变革：城市化加速、工人阶级形成、劳资矛盾（空想社会主义与马克思主义回应）、妇女进入工厂。

第二次工业革命：爱迪生电灯、贝尔电话、福特流水线（T 型车 1913）、石油工业。美国与德国崛起，电气时代。

工业革命影响深远：生产力飞跃、全球财富增长，也带来污染、剥削与殖民扩张。现代福利制度与劳工法是对早期工业苦难的修正。',
'掌握工业革命进程',
'["第一次蒸汽第二次电力","瓦特改良蒸汽机","福特流水线","工业革命重塑社会"]',
'beginner', 12, 5),

(183, 54, '从众与服从',
'社会心理学研究人与人的相互影响。从众：改变行为与群体一致。阿希线段实验：多数人故意答错，约三分之一被试跟随错误。

<b>经典社会心理实验表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">实验</th><th style="border:1px solid #999;padding:6px">研究者</th><th style="border:1px solid #999;padding:6px">发现</th></tr>
<tr><td style="border:1px solid #999;padding:6px">阿希从众</td><td style="border:1px solid #999;padding:6px">阿希(1951)</td><td style="border:1px solid #999;padding:6px">群体压力改变判断</td></tr>
<tr><td style="border:1px solid #999;padding:6px">米尔格拉姆电击</td><td style="border:1px solid #999;padding:6px">米尔格拉姆(1961)</td><td style="border:1px solid #999;padding:6px">65%服从权威</td></tr>
<tr><td style="border:1px solid #999;padding:6px">斯坦福监狱</td><td style="border:1px solid #999;padding:6px">津巴多(1971)</td><td style="border:1px solid #999;padding:6px">情境塑造角色行为</td></tr>
<tr><td style="border:1px solid #999;padding:6px">旁观者效应</td><td style="border:1px solid #999;padding:6px">达利/拉塔内</td><td style="border:1px solid #999;padding:6px">人越多施救越少</td></tr>
</table>

从众原因：信息性影响（别人可能知道得更多）与规范性影响（想被群体接受）。从众影响因素：群体规模、一致性、匿名性、自信程度。

服从权威实验的教训：情境压力可让普通人做出残酷行为。关键变量：权威合法性、责任转移（我只是执行命令）、渐进承诺。

米尔格拉姆的伦理争议推动了实验伦理规范（知情同意、退出自由、事后说明）。斯坦福监狱实验 6 天后被叫停。

现实应用：营销（从众购买）、团队（群体决策的从众风险）、防止盲从权威（批判性思维）。',
'掌握从众与服从机制',
'["阿希实验从众率","米尔格拉姆65%服从","情境塑造行为","旁观者效应"]',
'intermediate', 12, 1),
(184, 54, '偏见与刻板印象',
'刻板印象：对群体的概括认知（认知层面）。偏见：带情感的态度（情感层面）。歧视：付诸行动（行为层面）。

<b>偏见类型与减少策略表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类型</th><th style="border:1px solid #999;padding:6px">定义</th><th style="border:1px solid #999;padding:6px">例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">内群体偏私</td><td style="border:1px solid #999;padding:6px">偏向自己群体</td><td style="border:1px solid #999;padding:6px">球迷偏向本队</td></tr>
<tr><td style="border:1px solid #999;padding:6px">外群体同质性</td><td style="border:1px solid #999;padding:6px">认为外群体都一样</td><td style="border:1px solid #999;padding:6px">他们都很刻板</td></tr>
<tr><td style="border:1px solid #999;padding:6px">基本归因错误</td><td style="border:1px solid #999;padding:6px">归因他人行为于性格</td><td style="border:1px solid #999;padding:6px">迟到的同事=懒惰</td></tr>
<tr><td style="border:1px solid #999;padding:6px">自利偏差</td><td style="border:1px solid #999;padding:6px">成功归己失败归外</td><td style="border:1px solid #999;padding:6px">考好是聪明考差是题难</td></tr>
</table>

偏见来源：社会学习（家庭文化传递）、现实冲突（资源竞争）、社会认同（抬高自己群体）。内隐偏见：无意识自动激活的关联。

减少偏见的接触假说：群体间平等地位、共同目标、制度支持、个人接触——罗伯斯洞穴实验证明共同目标化解冲突。

刻板印象威胁：担心验证负面刻板印象导致表现下降（如性别数学差距）。应对：肯定自我价值、榜样示范、成长型思维。

日常反思：注意语言（标签 vs 人）、审视假设、寻求反例。偏见可被意识与训练改变。',
'掌握偏见形成与消除',
'["偏见三层面认知情感行为","基本归因错误","接触假说减少偏见","刻板印象威胁"]',
'intermediate', 12, 2),
(185, 54, '群体与决策',
'群体决策常优于个人，但也可能犯错：群体极化（讨论后立场更极端）、从众压力、社会惰化（责任分散）。

<b>群体现象对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">现象</th><th style="border:1px solid #999;padding:6px">定义</th><th style="border:1px solid #999;padding:6px">对策</th></tr>
<tr><td style="border:1px solid #999;padding:6px">群体极化</td><td style="border:1px solid #999;padding:6px">讨论让立场更极端</td><td style="border:1px solid #999;padding:6px">安排反对者角色</td></tr>
<tr><td style="border:1px solid #999;padding:6px">群体思维</td><td style="border:1px solid #999;padding:6px">求和谐牺牲正确</td><td style="border:1px solid #999;padding:6px">头脑风暴分离评价</td></tr>
<tr><td style="border:1px solid #999;padding:6px">社会惰化</td><td style="border:1px solid #999;padding:6px">人多出力变少</td><td style="border:1px solid #999;padding:6px">明确个人责任</td></tr>
<tr><td style="border:1px solid #999;padding:6px">集体智慧</td><td style="border:1px solid #999;padding:6px">平均估计很准</td><td style="border:1px solid #999;padding:6px">独立判断再汇总</td></tr>
</table>

群体思维典型失败案例：猪湾入侵、挑战者号、珍珠港。症状：压制异议、道德错觉、统一性幻觉。预防：指定批评者、小团体分组讨论。

群体决策优势：信息更全、视角多样（多样性红利）。劣势：过程损耗、社会比较。德尔菲法：匿名多轮问卷收敛专家意见。

社交媒体放大群体效应：回声室（算法投喂同质内容）、信息茧房、网络群体极化。数字时代的群体心理是新课题。

团队管理启示：目标明确、角色清晰、心理安全（敢提反对意见）、建设性冲突与任务冲突区别。',
'掌握群体决策陷阱',
'["群体极化与群体思维","社会惰化责任分散","群体思维三症状","心理安全鼓励异议"]',
'intermediate', 12, 3),
(186, 54, '亲密关系与吸引',
'人际吸引的规律：邻近性、相似性、互惠性、外表吸引。亲密关系是幸福感最重要的来源之一（哈佛成人发展研究 85 年追踪）。

<b>爱情三角理论（斯滕伯格）表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">成分</th><th style="border:1px solid #999;padding:6px">含义</th><th style="border:1px solid #999;padding:6px">缺一</th></tr>
<tr><td style="border:1px solid #999;padding:6px">激情</td><td style="border:1px solid #999;padding:6px">强烈情感吸引</td><td style="border:1px solid #999;padding:6px">浪漫爱情缺激情</td></tr>
<tr><td style="border:1px solid #999;padding:6px">亲密</td><td style="border:1px solid #999;padding:6px">了解信任扶持</td><td style="border:1px solid #999;padding:6px">空洞爱情缺亲密</td></tr>
<tr><td style="border:1px solid #999;padding:6px">承诺</td><td style="border:1px solid #999;padding:6px">维持关系的决定</td><td style="border:1px solid #999;padding:6px">迷恋缺承诺</td></tr>
</table>

依恋理论（鲍尔比、安斯沃思）：安全型、焦虑型、回避型。儿童期依恋模式影响成人亲密关系。安全型沟通更健康。

斯腾伯格爱情类型：完美爱情=激情+亲密+承诺；伴侣之爱=亲密+承诺；浪漫之爱=激情+亲密；空洞之爱=只有承诺。

关系维持技巧：积极沟通（我信息）、感恩表达、共同活动、冲突管理（避免批评-蔑视-防御-筑墙四骑士，戈特曼研究）。

破坏性沟通 vs 建设性沟通：指责 vs 表达感受、冷战 vs 冷静期后沟通、翻旧账 vs 聚焦当下问题。修复尝试是婚姻预测指标。',
'掌握吸引与亲密关系',
'["邻近相似互惠吸引","爱情三角激情亲密承诺","依恋类型影响关系","沟通四骑士"]',
'intermediate', 12, 4),
(187, 54, '说服与影响力',
'说服研究两大路径（佩蒂与卡乔波）：中央路径（仔细思考论证）与边缘路径（依赖线索如专家、数量）。信息、来源、情境三要素。

<b>西奥迪尼影响力六原则表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">原则</th><th style="border:1px solid #999;padding:6px">含义</th><th style="border:1px solid #999;padding:6px">防御</th></tr>
<tr><td style="border:1px solid #999;padding:6px">互惠</td><td style="border:1px solid #999;padding:6px">受人好处想回报</td><td style="border:1px solid #999;padding:6px">区分善意与策略</td></tr>
<tr><td style="border:1px solid #999;padding:6px">承诺一致</td><td style="border:1px solid #999;padding:6px">言行一致倾向</td><td style="border:1px solid #999;padding:6px">小步承诺陷阱</td></tr>
<tr><td style="border:1px solid #999;padding:6px">社会认同</td><td style="border:1px solid #999;padding:6px">跟从多数行为</td><td style="border:1px solid #999;padding:6px">质疑虚假数据</td></tr>
<tr><td style="border:1px solid #999;padding:6px">权威</td><td style="border:1px solid #999;padding:6px">信任权威专家</td><td style="border:1px solid #999;padding:6px">核实资历</td></tr>
<tr><td style="border:1px solid #999;padding:6px">稀缺</td><td style="border:1px solid #999;padding:6px">越少越想要</td><td style="border:1px solid #999;padding:6px">限时抢购冷静</td></tr>
<tr><td style="border:1px solid #999;padding:6px">喜好</td><td style="border:1px solid #999;padding:6px">喜欢的人影响大</td><td style="border:1px solid #999;padding:6px">好感与建议分离</td></tr>
</table>

中央路径说服更持久（态度内化），边缘路径短暂（浅层接受）。高卷入度产品（房子）用中央路径，低卷入度（口香糖）用边缘路径。

认知失调理论（费斯廷格）：态度与行为矛盾时产生不适，人会改变态度。应用：登门槛效应（先小请求再大请求，一致性）。

说服者的可信度：专家性+可信赖性。睡眠者效应：来源信息随记忆衰减，信息本身影响上升。两面论证（先提反方再反驳）对受教育者更有效。

信息时代防误导：查来源、看证据、注意情感操控（恐惧诉求需配方案）、核实数字。批判性思维是影响力的免疫系统。',
'掌握说服与影响力原则',
'["中央边缘双路径","互惠承诺社会认同","认知失调理论","登门槛效应"]',
'intermediate', 12, 5),

(188, 55, '供求与市场均衡',
'微观经济学研究个体决策。需求定律：价格上升需求下降。供给定律：价格上升供给上升。均衡价格由供求交点决定。

<b>需求弹性分类表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">弹性类型</th><th style="border:1px solid #999;padding:6px">|弹性值|</th><th style="border:1px solid #999;padding:6px">含义</th><th style="border:1px solid #999;padding:6px">例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">完全无弹性</td><td style="border:1px solid #999;padding:6px">0</td><td style="border:1px solid #999;padding:6px">价格变需求不变</td><td style="border:1px solid #999;padding:6px">急救药</td></tr>
<tr><td style="border:1px solid #999;padding:6px">缺乏弹性</td><td style="border:1px solid #999;padding:6px">0-1</td><td style="border:1px solid #999;padding:6px">变化幅度小</td><td style="border:1px solid #999;padding:6px">食盐粮食</td></tr>
<tr><td style="border:1px solid #999;padding:6px">单位弹性</td><td style="border:1px solid #999;padding:6px">1</td><td style="border:1px solid #999;padding:6px">同比例变化</td><td style="border:1px solid #999;padding:6px">理论情形</td></tr>
<tr><td style="border:1px solid #999;padding:6px">富有弹性</td><td style="border:1px solid #999;padding:6px">>1</td><td style="border:1px solid #999;padding:6px">变化幅度大</td><td style="border:1px solid #999;padding:6px">奢侈品</td></tr>
</table>

需求弹性影响因素：替代品多少（多则弹性大）、必需品 vs 奢侈品、时间长短（长期弹性大）、支出占比。

市场均衡变动：需求增加→价格上升数量增加；供给增加→价格下降数量增加。蛛网模型解释农产品价格波动。

支持价格（最低限价，如粮食保护价）导致过剩；限制价格（最高限价，如房租管制）导致短缺。税收归宿：取决于弹性，弹性小的一方负担多。

吉芬商品与凡勃伦商品：价格上升需求反而上升的特殊情形（劣质主食/炫耀性消费），挑战需求定律的边界。',
'掌握供求与弹性',
'["需求定律价格反向","均衡由供求决定","弹性决定税收归宿","价格管制导致短缺过剩"]',
'intermediate', 12, 1),
(189, 55, '消费者行为',
'消费者选择基于偏好与预算。无差异曲线表示效用相同的组合，预算线表示消费约束。最优选择在相切点。

<b>消费者理论概念表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">概念</th><th style="border:1px solid #999;padding:6px">含义</th><th style="border:1px solid #999;padding:6px">性质</th></tr>
<tr><td style="border:1px solid #999;padding:6px">效用</td><td style="border:1px solid #999;padding:6px">满足程度</td><td style="border:1px solid #999;padding:6px">主观可比较</td></tr>
<tr><td style="border:1px solid #999;padding:6px">边际效用</td><td style="border:1px solid #999;padding:6px">多消费一个的额外效用</td><td style="border:1px solid #999;padding:6px">递减规律</td></tr>
<tr><td style="border:1px solid #999;padding:6px">无差异曲线</td><td style="border:1px solid #999;padding:6px">效用相等组合</td><td style="border:1px solid #999;padding:6px">凸向原点</td></tr>
<tr><td style="border:1px solid #999;padding:6px">边际替代率</td><td style="border:1px solid #999;padding:6px">保持效用替换比例</td><td style="border:1px solid #999;padding:6px">递减</td></tr>
</table>

边际效用递减：吃第一个包子最满足，越吃越腻。消费者均衡：各种商品边际效用与价格比相等（花在每元钱上的边际效用相同）。

消费者剩余：愿意支付与实付之差。价格变化效应分解：替代效应（相对价格变化）与收入效应（购买力变化）。

预算约束移动：收入增加预算线外移；价格变化绕轴旋转。正常品 vs 劣等品：收入增加需求减少的是劣等品。

行为经济学修正：损失厌恶（损失痛苦大于等额收益快乐）、心理账户、锚定效应、现状偏差——理性人假设的现实偏离。',
'掌握消费者理论',
'["边际效用递减","无差异曲线凸向原点","消费者均衡等边际原则","损失厌恶与锚定"]',
'intermediate', 12, 2),
(190, 55, '厂商与市场结构',
'厂商目标利润最大化：MR=MC。成本概念：固定成本、可变成本、边际成本、平均成本。短期与长期决策不同。

<b>四种市场结构对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">结构</th><th style="border:1px solid #999;padding:6px">厂商数</th><th style="border:1px solid #999;padding:6px">产品</th><th style="border:1px solid #999;padding:6px">壁垒</th><th style="border:1px solid #999;padding:6px">例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">完全竞争</td><td style="border:1px solid #999;padding:6px">极多</td><td style="border:1px solid #999;padding:6px">同质</td><td style="border:1px solid #999;padding:6px">无</td><td style="border:1px solid #999;padding:6px">农产品</td></tr>
<tr><td style="border:1px solid #999;padding:6px">垄断竞争</td><td style="border:1px solid #999;padding:6px">很多</td><td style="border:1px solid #999;padding:6px">有差异</td><td style="border:1px solid #999;padding:6px">低</td><td style="border:1px solid #999;padding:6px">餐饮/服装</td></tr>
<tr><td style="border:1px solid #999;padding:6px">寡头垄断</td><td style="border:1px solid #999;padding:6px">少数</td><td style="border:1px solid #999;padding:6px">可同质可差异</td><td style="border:1px solid #999;padding:6px">高</td><td style="border:1px solid #999;padding:6px">航空/电信</td></tr>
<tr><td style="border:1px solid #999;padding:6px">完全垄断</td><td style="border:1px solid #999;padding:6px">一家</td><td style="border:1px solid #999;padding:6px">无替代</td><td style="border:1px solid #999;padding:6px">极高</td><td style="border:1px solid #999;padding:6px">专利药</td></tr>
</table>

完全竞争：价格接受者，长期利润为零（自由进入挤出利润），效率最高（P=MC）。完全垄断：价格制定者，产量少价格高，效率损失。

寡头博弈：纳什均衡（囚徒困境）、价格战与合谋、博弈论（田忌赛马/石油卡特尔）。弯折需求曲线解释寡头价格刚性。

规模经济：产量扩大平均成本下降（固定成本摊薄、专业化、谈判力）。自然垄断：规模经济极大（电网、自来水），政府监管定价。

市场失灵：垄断、外部性（污染）、公共品（国防路灯）、信息不对称（二手车市场柠檬问题）。政府干预：反垄断、税收补贴、监管。',
'掌握市场结构与博弈',
'["完全竞争长期零利润","垄断效率损失","囚徒困境纳什均衡","市场失灵四类"]',
'intermediate', 12, 3),
(191, 55, '外部性与公共品',
'外部性：一方的行为影响他人却未通过价格补偿。负外部性（污染）产量过多，正外部性（教育）产量不足。

<b>外部性与对策表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">外部性</th><th style="border:1px solid #999;padding:6px">例子</th><th style="border:1px solid #999;padding:6px">问题</th><th style="border:1px solid #999;padding:6px">对策</th></tr>
<tr><td style="border:1px solid #999;padding:6px">负外部性</td><td style="border:1px solid #999;padding:6px">工厂排污</td><td style="border:1px solid #999;padding:6px">产量过多</td><td style="border:1px solid #999;padding:6px">庇古税/碳税</td></tr>
<tr><td style="border:1px solid #999;padding:6px">正外部性</td><td style="border:1px solid #999;padding:6px">教育/疫苗</td><td style="border:1px solid #999;padding:6px">供给不足</td><td style="border:1px solid #999;padding:6px">补贴/公共提供</td></tr>
</table>

科斯定理：产权明确且交易成本低时，私人谈判可解决外部性（无论产权归谁）。实践困难：交易成本、产权界定难。

公共品两特征：非排他性（无法排除他人使用）与竞用性（我的使用不影响他人）。纯公共品：国防、灯塔、知识。搭便车问题导致市场供给不足。

公共资源：竞用但非排他（渔场、公地），公地悲剧——过度使用。对策：配额、产权化、社区治理。

政府治理工具对比：命令控制（标准）vs 市场激励（税收、可交易排放权）。碳市场：总量控制+交易，中国碳市场 2021 年启动。',
'掌握外部性与公共品',
'["负外部性产量过多","庇古税矫正","公共品非排他非竞用","公地悲剧"]',
'intermediate', 12, 4),
(192, 55, '劳动力市场',
'劳动经济学研究工资与就业。劳动需求是派生需求（由产品需求派生）。工资由劳动供求决定。人力资本：教育投资的回报。

<b>工资差异来源表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">来源</th><th style="border:1px solid #999;padding:6px">机制</th><th style="border:1px solid #999;padding:6px">例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">人力资本</td><td style="border:1px solid #999;padding:6px">教育技能提高生产率</td><td style="border:1px solid #999;padding:6px">学历溢价</td></tr>
<tr><td style="border:1px solid #999;padding:6px">补偿性差异</td><td style="border:1px solid #999;padding:6px">工作条件差需补偿</td><td style="border:1px solid #999;padding:6px">夜班/高危行业</td></tr>
<tr><td style="border:1px solid #999;padding:6px">天赋才能</td><td style="border:1px solid #999;padding:6px">稀缺能力租金</td><td style="border:1px solid #999;padding:6px">顶尖运动员</td></tr>
<tr><td style="border:1px solid #999;padding:6px">歧视</td><td style="border:1px solid #999;padding:6px">非生产率因素</td><td style="border:1px solid #999;padding:6px">性别工资差</td></tr>
</table>

最低工资：提高低收入者工资但可能减少就业（若高于均衡）。中国最低工资标准由省级制定，2024 年多地调整。

工会作用：集体谈判提高工资福利，可能造成工会内外工资差。效率工资：支付高于市场工资激励员工（减少怠工、降低离职）。

失业类型：摩擦性（换工作间隙）、结构性（技能错配）、周期性（经济衰退）。自然失业率=摩擦+结构。奥肯定律：GDP 增长放缓失业率上升。

人力资本投资回报：教育收益率普遍为正（中国城镇约 8-10% 每多一年教育）。信号理论：文凭也是筛选信号。',
'掌握劳动市场原理',
'["工资由供求决定","人力资本与补偿差异","失业三类型","最低工资权衡"]',
'intermediate', 12, 5),

(193, 56, 'GDP与国民收入',
'GDP 是衡量经济活动的核心指标：一定时期内一国境内生产的全部最终产品与劳务市场价值。三种核算方法应得同一结果。

<b>GDP 三种核算方法表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">方法</th><th style="border:1px solid #999;padding:6px">公式</th><th style="border:1px solid #999;padding:6px">角度</th></tr>
<tr><td style="border:1px solid #999;padding:6px">支出法</td><td style="border:1px solid #999;padding:6px">Y=C+I+G+NX</td><td style="border:1px solid #999;padding:6px">需求</td></tr>
<tr><td style="border:1px solid #999;padding:6px">收入法</td><td style="border:1px solid #999;padding:6px">工资+利息+利润+租金</td><td style="border:1px solid #999;padding:6px">分配</td></tr>
<tr><td style="border:1px solid #999;padding:6px">生产法</td><td style="border:1px solid #999;padding:6px">各部门增加值之和</td><td style="border:1px solid #999;padding:6px">生产</td></tr>
</table>

支出法构成：C 消费、I 投资（含存货与住宅）、G 政府购买（不含转移支付）、NX 净出口（出口-进口）。

名义 GDP vs 实际 GDP：名义用当期价格，实际用基期价格。GDP 平减指数=名义/实际×100。实际增长衡量真实产出变化。

GDP 局限：不反映分配（收入差距）、未计非市场活动（家务）、未扣环境代价（绿色 GDP）、休闲价值。幸福经济学：GDP 增长≠幸福增长（伊斯特林悖论）。

世界 GDP 概览（IMF 2023）：美国、中国、德国、日本、印度居前五。人均 GDP：卢森堡、瑞士、挪威领先；中国约 1.2 万美元。',
'掌握GDP核算',
'["支出法Y=C+I+G+NX","实际GDP消除通胀","GDP三局限","伊斯特林幸福悖论"]',
'intermediate', 12, 1),
(194, 56, '通货膨胀',
'通货膨胀：一般价格水平持续上涨。通货紧缩相反。CPI 是衡量通胀的常用指标（一篮子消费品加权）。

<b>通胀类型与影响表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类型</th><th style="border:1px solid #999;padding:6px">成因</th><th style="border:1px solid #999;padding:6px">典型时期</th></tr>
<tr><td style="border:1px solid #999;padding:6px">需求拉动</td><td style="border:1px solid #999;padding:6px">总需求过热</td><td style="border:1px solid #999;padding:6px">1970s 滞胀</td></tr>
<tr><td style="border:1px solid #999;padding:6px">成本推动</td><td style="border:1px solid #999;padding:6px">成本上升（油价）</td><td style="border:1px solid #999;padding:6px">2008 油价</td></tr>
<tr><td style="border:1px solid #999;padding:6px">货币超发</td><td style="border:1px solid #999;padding:6px">货币增长过快</td><td style="border:1px solid #999;padding:6px">德国1923</td></tr>
<tr><td style="border:1px solid #999;padding:6px">预期推动</td><td style="border:1px solid #999;padding:6px">通胀预期自我实现</td><td style="border:1px solid #999;padding:6px">工资-价格螺旋</td></tr>
</table>

费雪方程：MV=PY，货币量×流通速度=价格×产出。通胀本质是货币现象（弗里德曼）。

通胀成本：皮鞋成本（频繁跑银行）、菜单成本（改价）、税制扭曲、财富再分配（债务人受益、固定收入者受损）。预期通胀影响小，未预期通胀影响大。

菲利普斯曲线：通胀与失业短期负相关，长期无关系（垂直）。治理通胀：紧缩货币财政，代价是失业上升（牺牲率）。

中国 CPI 2024 年低通胀运行，PPI 相对偏弱；央行货币政策目标：物价稳定+经济增长。恶性通胀（津巴布韦、委内瑞拉）摧毁货币信用。',
'掌握通胀成因与成本',
'["CPI衡量通胀","费雪方程MV=PY","菲利普斯曲线","未预期通胀再分配"]',
'intermediate', 12, 2),
(195, 56, '货币政策与央行',
'中央银行：发行货币、制定货币政策、最后贷款人。中国央行（中国人民银行）、美联储、欧洲央行。政策目标：物价稳定、充分就业、增长、金融稳定。

<b>三大政策工具对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">工具</th><th style="border:1px solid #999;padding:6px">机制</th><th style="border:1px solid #999;padding:6px">方向</th></tr>
<tr><td style="border:1px solid #999;padding:6px">公开市场操作</td><td style="border:1px solid #999;padding:6px">买卖国债调节流动性</td><td style="border:1px solid #999;padding:6px">日常微调</td></tr>
<tr><td style="border:1px solid #999;padding:6px">存款准备金率</td><td style="border:1px solid #999;padding:6px">银行缴存比例</td><td style="border:1px solid #999;padding:6px">强力工具</td></tr>
<tr><td style="border:1px solid #999;padding:6px">利率（MLF/LPR）</td><td style="border:1px solid #999;padding:6px">贷款基准利率</td><td style="border:1px solid #999;padding:6px">价格工具</td></tr>
</table>

货币传导机制：降息→借贷成本降→投资消费增→总需求增。宽松（降息降准）刺激经济，紧缩（加息）抑制通胀。

美联储 2022-2023 激进加息（联邦基金利率至 5.25-5.5%）抗击通胀，2024 年转向。中国 LPR 2024 年多次下调支持房地产与经济。

货币创造：银行体系存款派生（存款准备金率 r，货币乘数 1/r）。货币供应层次 M0/M1/M2（M2 含存款）。

量化宽松 QE：利率近零后大规模购债。非常规工具的边境外溢（美元加息→新兴市场资本外流）。中央银行独立性：抑制通胀效果更好。',
'掌握货币政策工具',
'["三大工具公开市场/准备金/利率","货币乘数1/r","美联储加息周期","央行独立性"]',
'intermediate', 12, 3),
(196, 56, '财政政策与债务',
'财政政策：政府通过税收与支出调节经济。扩张（减税增支）刺激，紧缩（增税减支）降温。自动稳定器：税收与失业救济随周期自动调节。

<b>财政乘数效应表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">政策</th><th style="border:1px solid #999;padding:6px">乘数</th><th style="border:1px solid #999;padding:6px">说明</th></tr>
<tr><td style="border:1px solid #999;padding:6px">政府购买</td><td style="border:1px solid #999;padding:6px">1/(1-MPC)</td><td style="border:1px solid #999;padding:6px">乘数效应</td></tr>
<tr><td style="border:1px solid #999;padding:6px">减税</td><td style="border:1px solid #999;padding:6px">MPC/(1-MPC)</td><td style="border:1px solid #999;padding:6px">比购买小</td></tr>
<tr><td style="border:1px solid #999;padding:6px">转移支付</td><td style="border:1px solid #999;padding:6px">MPC/(1-MPC)</td><td style="border:1px solid #999;padding:6px">同减税</td></tr>
</table>

挤出效应：政府借债推高利率挤出私人投资，抵消部分扩张效果。李嘉图等价：理性预期下减税被未来增税预期抵消。

财政赤字与国债：赤字=支出>收入，累积成国债。中国财政赤字率目标约 3%，国债规模约 30 万亿元（2023），债务率可控但地方债需关注。

地方债风险：土地财政转型、隐性债务。化债方案：置换、展期、削减。日本债务率超 200% 仍能运行（内债为主、低利率）。

财政与货币配合：宽财政+宽货币（中国 2024）、财政货币政策协调委员会机制。积极的财政政策工具：专项债、超长期特别国债（2024 发行 1 万亿）。',
'掌握财政政策工具',
'["乘数1/(1-MPC)","挤出效应","赤字与国债累积","财政货币配合"]',
'intermediate', 12, 4),
(197, 56, '经济增长与周期',
'经济增长=产出长期增长。增长源泉：资本积累、劳动投入、技术进步。索洛模型：长期增长靠技术进步。全要素生产率（TFP）衡量效率。

<b>经济增长要素分解表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">要素</th><th style="border:1px solid #999;padding:6px">贡献</th><th style="border:1px solid #999;padding:6px">例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">资本深化</td><td style="border:1px solid #999;padding:6px">人均资本增加</td><td style="border:1px solid #999;padding:6px">基建投资</td></tr>
<tr><td style="border:1px solid #999;padding:6px">人力资本</td><td style="border:1px solid #999;padding:6px">技能教育</td><td style="border:1px solid #999;padding:6px">工程师红利</td></tr>
<tr><td style="border:1px solid #999;padding:6px">技术进步</td><td style="border:1px solid #999;padding:6px">TFP 提升</td><td style="border:1px solid #999;padding:6px">AI/数字化</td></tr>
<tr><td style="border:1px solid #999;padding:6px">制度红利</td><td style="border:1px solid #999;padding:6px">市场化改革</td><td style="border:1px solid #999;padding:6px">营商环境</td></tr>
</table>

追赶效应：穷国资本边际产出高，增长快于富国（条件收敛）。中等收入陷阱：拉美东南亚经验，跨越靠转型创新。

中国增长奇迹：1978 改革开放年均近 10%，2023 年 GDP 126 万亿元（约 17.8 万亿美元）。新常态：从高速转高质量，新质生产力。

经济周期四阶段：繁荣、衰退、萧条、复苏。周期类型：基钦（库存 40 月）、朱格拉（设备 10 年）、库兹涅茨（房地产 20 年）、康德拉季耶夫（50-60 年）。

衰退的预警指标：PMI 荣枯线（50）、收益率曲线倒挂（美国 2022-2023）、消费信心。日本失去的三十年：泡沫破裂后的长期通缩教训。',
'掌握增长源泉与周期',
'["增长靠资本人力技术","追赶效应收敛","中等收入陷阱","经济周期四阶段"]',
'intermediate', 12, 5),

(198, 57, '形而上学与本体论',
'形而上学追问"存在本身是什么"。本体论研究"什么是真实"。核心问题：心物关系、自由意志、时间本质。

<b>形而上学经典问题表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">问题</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">主要立场</th></tr>
<tr><td style="border:1px solid #999;padding:6px">心物关系</td><td style="border:1px solid #999;padding:6px">心灵与物质的关系</td><td style="border:1px solid #999;padding:6px">二元论/物理主义</td></tr>
<tr><td style="border:1px solid #999;padding:6px">自由意志</td><td style="border:1px solid #999;padding:6px">决定论与自由相容吗</td><td style="border:1px solid #999;padding:6px">相容论/硬决定论</td></tr>
<tr><td style="border:1px solid #999;padding:6px">时间</td><td style="border:1px solid #999;padding:6px">时间真实存在吗</td><td style="border:1px solid #999;padding:6px">A理论/B理论</td></tr>
<tr><td style="border:1px solid #999;padding:6px">共相</td><td style="border:1px solid #999;padding:6px">抽象概念是否真实</td><td style="border:1px solid #999;padding:6px">实在论/唯名论</td></tr>
</table>

笛卡尔身心二元论：我思故我在（怀疑一切后唯一确定的是思考）。身心交互问题：非物质的心灵如何影响物质身体？

物理主义：一切都物理，意识是大脑状态（同一论、功能主义）。意识的难题：物理状态如何产生主观体验（感质）？查默斯"困难问题"。

自由意志辩论：决定论（拉普拉斯妖）vs 自由意志。相容论：即使决定论为真，行为仍是自由的（没有强迫）。不相容论：自由需要真正的其他可能。

时间哲学：B 理论（时间如空间，过去现在未来同样真实）vs A 理论（只有现在真实，时间流动）。热力学时间箭头关联熵增。',
'掌握形而上学核心问题',
'["本体论追问真实","心物二元论与物理主义","自由意志相容论","意识困难问题"]',
'intermediate', 12, 1),
(199, 57, '认识论',
'认识论研究知识与信念。知识的定义：确证的真信念（JTB）。核心问题：我们能知道什么？如何知道？

<b>认识论主要立场表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">立场</th><th style="border:1px solid #999;padding:6px">主张</th><th style="border:1px solid #999;padding:6px">代表</th></tr>
<tr><td style="border:1px solid #999;padding:6px">理性主义</td><td style="border:1px solid #999;padding:6px">理性是知识来源</td><td style="border:1px solid #999;padding:6px">笛卡尔/斯宾诺莎</td></tr>
<tr><td style="border:1px solid #999;padding:6px">经验主义</td><td style="border:1px solid #999;padding:6px">经验是知识来源</td><td style="border:1px solid #999;padding:6px">洛克/休谟</td></tr>
<tr><td style="border:1px solid #999;padding:6px">先验综合</td><td style="border:1px solid #999;padding:6px">先天形式组织经验</td><td style="border:1px solid #999;padding:6px">康德</td></tr>
<tr><td style="border:1px solid #999;padding:6px">怀疑论</td><td style="border:1px solid #999;padding:6px">知识不可能</td><td style="border:1px solid #999;padding:6px">皮浪/笛卡尔怀疑</td></tr>
</table>

笛卡尔式怀疑：恶魔论证、梦中论证。回应：即便被欺骗，思考存在（我思故我在）。洛克白板说：心灵如白板，经验书写。

休谟问题：归纳问题——从有限经验到普遍规律缺乏逻辑保证（明天太阳照常升起只是习惯）。因果是否只是恒常联结？

康德哥白尼式革命：不是认识符合对象，而是对象符合认识形式（时间空间是直观形式，因果范畴是知性形式）。现象与物自体之分。

盖梯尔问题：JTB 定义被反例击破（偶然正确的信念）。知识的确证理论：可靠主义（可靠过程产生信念）、德性认识论（认知德性）。',
'掌握认识论立场',
'["理性vs经验","归纳问题","康德先验综合","盖梯尔反例"]',
'intermediate', 12, 2),
(200, 57, '伦理学',
'伦理学问"什么是对的"。三大家：功利主义（后果）、义务论（规则）、德性伦理（品格）。决策时常三者冲突。

<b>伦理学理论对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">理论</th><th style="border:1px solid #999;padding:6px">判断标准</th><th style="border:1px solid #999;padding:6px">代表</th><th style="border:1px solid #999;padding:6px">弱点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">功利主义</td><td style="border:1px solid #999;padding:6px">最大幸福</td><td style="border:1px solid #999;padding:6px">边沁/密尔</td><td style="border:1px solid #999;padding:6px">牺牲少数</td></tr>
<tr><td style="border:1px solid #999;padding:6px">义务论</td><td style="border:1px solid #999;padding:6px">遵守道德法则</td><td style="border:1px solid #999;padding:6px">康德</td><td style="border:1px solid #999;padding:6px">僵化</td></tr>
<tr><td style="border:1px solid #999;padding:6px">德性伦理</td><td style="border:1px solid #999;padding:6px">品格与美德</td><td style="border:1px solid #999;padding:6px">亚里士多德</td><td style="border:1px solid #999;padding:6px">指导不具体</td></tr>
</table>

功利主义：电车难题——多数功利主义会拉杆救五人。行动功利 vs 规则功利：规则功利主义考虑遵守规则的长远效用。

康德义务论：绝对命令（只按照同时能成为普遍法则的准则行动）与人是目的（永远不把人只当手段）。说谎问题：是否该对追凶者撒谎？

亚里士多德德性论：幸福（eudaimonia）是最高善，美德是中道（勇敢是鲁莽与怯懦的中道）。实践智慧在具体情境中抉择。

应用伦理：AI 伦理（算法偏见、责任归属、杀手机器人）、医学伦理（知情同意、安乐死）、环境伦理、商业伦理。电车难题现实版：自动驾驶的碰撞决策。',
'掌握三大伦理理论',
'["功利主义最大幸福","康德拉杆与目的","中道是美德","AI伦理新问题"]',
'intermediate', 12, 3),
(201, 57, '逻辑与批判思维',
'逻辑学是正确推理的规则。演绎（前提真结论必真）与归纳（前提支持结论）。谬误是推理中的常见错误。

<b>逻辑谬误类型表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">谬误</th><th style="border:1px solid #999;padding:6px">结构</th><th style="border:1px solid #999;padding:6px">例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">人身攻击</td><td style="border:1px solid #999;padding:6px">攻击人而非论证</td><td style="border:1px solid #999;padding:6px">他是骗子所以论点错</td></tr>
<tr><td style="border:1px solid #999;padding:6px">稻草人</td><td style="border:1px solid #999;padding:6px">歪曲对方观点再驳</td><td style="border:1px solid #999;padding:6px">你要涨价就是抢劫</td></tr>
<tr><td style="border:1px solid #999;padding:6px">滑坡谬误</td><td style="border:1px solid #999;padding:6px">第一步必然导致灾难</td><td style="border:1px solid #999;padding:6px">开此先例后患无穷</td></tr>
<tr><td style="border:1px solid #999;padding:6px">诉诸权威</td><td style="border:1px solid #999;padding:6px">权威与论证无关</td><td style="border:1px solid #999;padding:6px">明星代言保健品</td></tr>
<tr><td style="border:1px solid #999;padding:6px">后此谬误</td><td style="border:1px solid #999;padding:6px">先后当因果</td><td style="border:1px solid #999;padding:6px">鸡叫后日出</td></tr>
<tr><td style="border:1px solid #999;padding:6px">诉诸情感</td><td style="border:1px solid #999;padding:6px">用情绪代替证据</td><td style="border:1px solid #999;padding:6px">你忍心拒绝吗</td></tr>
</table>

三段论结构：大前提+小前提→结论。有效性的判断与内容真伪分开：推理形式决定有效性。

批判思维五问：论点是什么？理由是什么？理由支持论点吗？隐藏假设是什么？有没有反例？证伪思维（波普尔）：科学理论必须可被证伪。

推理实践：识别论证（寻找因为/所以）、评估证据（样本、来源、相关性）、识别情感操控（恐惧、同情）。双盲实验与随机对照是证据金标准。

信息素养：事实与观点区分、核实信源（交叉验证）、警惕标题党与 AI 生成内容。认知偏差清单：确认偏误（只找支持自己的证据）最难克服。',
'掌握逻辑与批判思维',
'["演绎与归纳","常见六类谬误","证伪主义","确认偏误"]',
'intermediate', 12, 4),
(202, 57, '哲学史简览',
'哲学史是思想的地图：从古希腊到现代，主题从自然到人再到语言。每个时代回应前代的问题。

<b>哲学史分期与代表表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">时期</th><th style="border:1px solid #999;padding:6px">主题</th><th style="border:1px solid #999;padding:6px">代表</th></tr>
<tr><td style="border:1px solid #999;padding:6px">古希腊</td><td style="border:1px solid #999;padding:6px">万物的本原</td><td style="border:1px solid #999;padding:6px">泰勒斯/赫拉克利特</td></tr>
<tr><td style="border:1px solid #999;padding:6px">苏格拉底时代</td><td style="border:1px solid #999;padding:6px">人如何生活</td><td style="border:1px solid #999;padding:6px">苏格拉底/柏拉图</td></tr>
<tr><td style="border:1px solid #999;padding:6px">近代</td><td style="border:1px solid #999;padding:6px">知识的确定性</td><td style="border:1px solid #999;padding:6px">笛卡尔/休谟/康德</td></tr>
<tr><td style="border:1px solid #999;padding:6px">19世纪</td><td style="border:1px solid #999;padding:6px">历史与社会</td><td style="border:1px solid #999;padding:6px">黑格尔/马克思</td></tr>
<tr><td style="border:1px solid #999;padding:6px">20世纪</td><td style="border:1px solid #999;padding:6px">语言与存在</td><td style="border:1px solid #999;padding:6px">维特根斯坦/海德格尔</td></tr>
</table>

古希腊自然哲学：泰勒斯"水是万物的本原"，从神话转向理性解释。赫拉克利特"人不能两次踏入同一条河流"（万物流变）。

柏拉图理念论：可见世界是理念的摹本，洞穴比喻（哲学启蒙）。亚里士多德：实体、四因说（质料因/形式因/动力因/目的因），经验主义源头。

近代哲学：笛卡尔奠基、休谟经验主义与怀疑、康德综合（先验哲学）。康德"敢于运用自己的理性"是启蒙口号。

现代哲学转向：分析哲学（语言分析，罗素、维特根斯坦）、大陆哲学（现象学、存在主义：萨特"存在先于本质"）。中国哲学：儒道释与马克思主义中国化。',
'掌握哲学史脉络',
'["古希腊追问本原","柏拉图洞穴比喻","康德先验综合","存在主义与语言转向"]',
'intermediate', 12, 5),

(203, 58, '古典小说四大名著',
'中国四大名著：《红楼梦》《三国演义》《水浒传》《西游记》。古典小说的巅峰是《红楼梦》。

<b>四大名著概览表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">作品</th><th style="border:1px solid #999;padding:6px">作者</th><th style="border:1px solid #999;padding:6px">题材</th><th style="border:1px solid #999;padding:6px">主题</th></tr>
<tr><td style="border:1px solid #999;padding:6px">红楼梦</td><td style="border:1px solid #999;padding:6px">曹雪芹</td><td style="border:1px solid #999;padding:6px">世情家族</td><td style="border:1px solid #999;padding:6px">盛衰与情</td></tr>
<tr><td style="border:1px solid #999;padding:6px">三国演义</td><td style="border:1px solid #999;padding:6px">罗贯中</td><td style="border:1px solid #999;padding:6px">历史演义</td><td style="border:1px solid #999;padding:6px">合久必分</td></tr>
<tr><td style="border:1px solid #999;padding:6px">水浒传</td><td style="border:1px solid #999;padding:6px">施耐庵</td><td style="border:1px solid #999;padding:6px">英雄传奇</td><td style="border:1px solid #999;padding:6px">官逼民反</td></tr>
<tr><td style="border:1px solid #999;padding:6px">西游记</td><td style="border:1px solid #999;padding:6px">吴承恩</td><td style="border:1px solid #999;padding:6px">神魔幻想</td><td style="border:1px solid #999;padding:6px">修心历难</td></tr>
</table>

《红楼梦》的艺术：草蛇灰线的伏笔、诗词暗喻人物命运、刘姥姥三进荣国府见证兴衰。贾宝玉-林黛玉-薛宝钗的情感悲剧。判词预示金陵十二钗命运。

《三国演义》：七实三虚的演义笔法，诸葛亮智慧化身（空城计、草船借箭）、关羽忠义（千里走单骑）、桃园三结义。

《水浒传》：一百单八将逼上梁山，林冲的隐忍与爆发（风雪山神庙）、武松打虎、宋江招安悲剧。

《西游记》：唐僧师徒四人，九九八十一难，孙悟空从大闹天宫到斗战胜佛的成长。妖怪有背景的讽刺（有背景的被救走）。',
'掌握四大名著',
'["红楼梦曹雪芹","三国七实三虚","水浒官逼民反","西游记修心主题"]',
'beginner', 12, 1),
(204, 58, '现当代文学',
'中国现当代文学：鲁迅的批判、沈从文的乡土、张爱玲的都市、莫言的高密东北乡。从白话文运动到诺贝尔奖。

<b>现代文学代表作表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">作家</th><th style="border:1px solid #999;padding:6px">代表作</th><th style="border:1px solid #999;padding:6px">风格</th></tr>
<tr><td style="border:1px solid #999;padding:6px">鲁迅</td><td style="border:1px solid #999;padding:6px">呐喊/彷徨</td><td style="border:1px solid #999;padding:6px">冷峻批判</td></tr>
<tr><td style="border:1px solid #999;padding:6px">老舍</td><td style="border:1px solid #999;padding:6px">骆驼祥子</td><td style="border:1px solid #999;padding:6px">京味市井</td></tr>
<tr><td style="border:1px solid #999;padding:6px">张爱玲</td><td style="border:1px solid #999;padding:6px">倾城之恋</td><td style="border:1px solid #999;padding:6px">苍凉都市</td></tr>
<tr><td style="border:1px solid #999;padding:6px">沈从文</td><td style="border:1px solid #999;padding:6px">边城</td><td style="border:1px solid #999;padding:6px">田园诗意</td></tr>
<tr><td style="border:1px solid #999;padding:6px">莫言</td><td style="border:1px solid #999;padding:6px">红高粱</td><td style="border:1px solid #999;padding:6px">魔幻乡土</td></tr>
</table>

鲁迅《狂人日记》：第一篇现代白话小说，"吃人"的隐喻批判封建礼教。《阿Q正传》：精神胜利法，国民性批判。

《边城》：湘西田园牧歌，翠翠的爱情悲剧，美与悲的交织。沈从文说"我建构的是一座希腊小庙，里面供奉的是人性"。

莫言 2012 年诺贝尔文学奖（中国籍首位获奖者）：魔幻现实主义，《蛙》写计划生育、《红高粱》写抗战与生命力。

阅读方法：关注叙事视角（第一人称限知）、意象与象征（故乡、围城）、语言风格与时代背景。文学评论从文本细读开始。',
'掌握现当代文学',
'["鲁迅批判国民性","边城田园悲剧","莫言魔幻现实主义","文本细读方法"]',
'beginner', 12, 2),
(205, 58, '外国文学经典',
'世界文学宝库：托尔斯泰的人道、卡夫卡的荒诞、马尔克斯的魔幻、村上春树的孤独。主题是人的处境。

<b>世界文学经典对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">作品</th><th style="border:1px solid #999;padding:6px">作者</th><th style="border:1px solid #999;padding:6px">国别</th><th style="border:1px solid #999;padding:6px">主题</th></tr>
<tr><td style="border:1px solid #999;padding:6px">战争与和平</td><td style="border:1px solid #999;padding:6px">托尔斯泰</td><td style="border:1px solid #999;padding:6px">俄国</td><td style="border:1px solid #999;padding:6px">历史与人性</td></tr>
<tr><td style="border:1px solid #999;padding:6px">变形记</td><td style="border:1px solid #999;padding:6px">卡夫卡</td><td style="border:1px solid #999;padding:6px">奥匈</td><td style="border:1px solid #999;padding:6px">异化荒诞</td></tr>
<tr><td style="border:1px solid #999;padding:6px">百年孤独</td><td style="border:1px solid #999;padding:6px">马尔克斯</td><td style="border:1px solid #999;padding:6px">哥伦比亚</td><td style="border:1px solid #999;padding:6px">命运循环</td></tr>
<tr><td style="border:1px solid #999;padding:6px">老人与海</td><td style="border:1px solid #999;padding:6px">海明威</td><td style="border:1px solid #999;padding:6px">美国</td><td style="border:1px solid #999;padding:6px">硬汉精神</td></tr>
<tr><td style="border:1px solid #999;padding:6px">挪威的森林</td><td style="border:1px solid #999;padding:6px">村上春树</td><td style="border:1px solid #999;padding:6px">日本</td><td style="border:1px solid #999;padding:6px">丧失与疗愈</td></tr>
</table>

《变形记》：格里高尔变成甲虫，家人从关心到厌弃——现代人的异化，亲情在功利面前的脆弱。"人要生活得幸福"的荒诞对照。

《百年孤独》：布恩迪亚家族七代人兴衰，马孔多小镇，魔幻现实主义（冰块、飞毯、失眠症）。"多年以后"开篇句式影响无数作家。

《老人与海》：圣地亚哥与大海搏斗，"一个人可以被毁灭，但不能被打败"，冰山理论（海明威文风）。

《悲惨世界》（雨果）：冉阿让的救赎之路，"法律与仁爱"。陀思妥耶夫斯基《罪与罚》：罪与救赎的心理剖析。阅读建议：先看导读把握时代背景再细读。',
'掌握世界文学经典',
'["变形记异化主题","百年孤独魔幻现实","老人与海硬汉","悲惨世界救赎"]',
'beginner', 12, 3),
(206, 58, '诗歌鉴赏',
'诗歌是凝练的语言艺术。意象是诗的灵魂，节奏与韵律是诗的骨架。中西诗歌风格迥异。

<b>中西诗歌对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">维度</th><th style="border:1px solid #999;padding:6px">中国古典诗</th><th style="border:1px solid #999;padding:6px">西方现代诗</th></tr>
<tr><td style="border:1px solid #999;padding:6px">形式</td><td style="border:1px solid #999;padding:6px">格律对仗</td><td style="border:1px solid #999;padding:6px">自由体</td></tr>
<tr><td style="border:1px solid #999;padding:6px">语言</td><td style="border:1px solid #999;padding:6px">凝练含蓄</td><td style="border:1px solid #999;padding:6px">意象跳跃</td></tr>
<tr><td style="border:1px solid #999;padding:6px">情感</td><td style="border:1px solid #999;padding:6px">情景交融</td><td style="border:1px solid #999;padding:6px">哲思内省</td></tr>
<tr><td style="border:1px solid #999;padding:6px">代表</td><td style="border:1px solid #999;padding:6px">李白/杜甫/苏轼</td><td style="border:1px solid #999;padding:6px">艾略特/里尔克</td></tr>
</table>

意象赏析方法：找出意象（月亮、流水、孤舟）→分析象征（月亮=思乡）→联系情感。李白"举头望明月，低头思故乡"，月是乡愁的符号。

中国诗歌脉络：诗经（风雅颂）→楚辞（屈原）→汉乐府→唐诗（盛唐气象）→宋词（婉约豪放）→元曲。李白豪放飘逸、杜甫沉郁顿挫。

现代诗：徐志摩《再别康桥》的音乐美（轻轻的我走了）、北岛"卑鄙是卑鄙者的通行证"、顾城"黑夜给了我黑色的眼睛"。

诗歌朗读技巧：停连、重音、语调。创作入门：抓住一个意象，用具体事物表达抽象情感，避免空洞抒情。',
'掌握诗歌鉴赏方法',
'["意象是诗的灵魂","月亮象征思乡","唐诗宋词脉络","现代诗意象跳跃"]',
'beginner', 12, 4),
(207, 58, '小说创作技法',
'小说三要素：人物、情节、环境。创作的核心是塑造可信的人物与动人的冲突。

<b>小说创作要素表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">要素</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">技巧</th></tr>
<tr><td style="border:1px solid #999;padding:6px">人物</td><td style="border:1px solid #999;padding:6px">性格动机成长</td><td style="border:1px solid #999;padding:6px">行动展示勿直说</td></tr>
<tr><td style="border:1px solid #999;padding:6px">情节</td><td style="border:1px solid #999;padding:6px">因果推进</td><td style="border:1px solid #999;padding:6px">冲突+悬念</td></tr>
<tr><td style="border:1px solid #999;padding:6px">环境</td><td style="border:1px solid #999;padding:6px">时代地点氛围</td><td style="border:1px solid #999;padding:6px">环境衬托心境</td></tr>
<tr><td style="border:1px solid #999;padding:6px">视角</td><td style="border:1px solid #999;padding:6px">叙事角度</td><td style="border:1px solid #999;padding:6px">限知/全知</td></tr>
</table>

人物塑造：外在特征+言行+内心+他人评价。记住"展示而非告知"：不说他很愤怒，写他摔门踢椅子。

情节结构：开端→发展→高潮→结局（传统）或非线性（倒叙、插叙、多线）。冲突类型：人与他人、人与社会、人与自我。

叙事视角：第一人称（代入感强）、第三人称限知（跟随主角）、全知视角（俯瞰全局）。视角转换是文学技巧的试金石。

创作练习：观察练习（写一个陌生人的五分钟）、对话练习（只用对话暗示性格）、改编练习（把新闻改成小说）。好故事=熟悉+意外。',
'掌握小说创作技法',
'["三要素人物情节环境","展示而非告知","四段式情节结构","叙事视角选择"]',
'beginner', 12, 5),

(208, 59, '古典音乐概览',
'古典音乐从巴洛克到现代：巴赫、莫扎特、贝多芬是里程碑。管弦乐队分四组：弦乐、木管、铜管、打击乐。

<b>音乐时期与代表作曲家表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">时期</th><th style="border:1px solid #999;padding:6px">时间</th><th style="border:1px solid #999;padding:6px">代表</th><th style="border:1px solid #999;padding:6px">风格</th></tr>
<tr><td style="border:1px solid #999;padding:6px">巴洛克</td><td style="border:1px solid #999;padding:6px">1600-1750</td><td style="border:1px solid #999;padding:6px">巴赫/维瓦尔第</td><td style="border:1px solid #999;padding:6px">复调华丽</td></tr>
<tr><td style="border:1px solid #999;padding:6px">古典主义</td><td style="border:1px solid #999;padding:6px">1750-1820</td><td style="border:1px solid #999;padding:6px">海顿/莫扎特</td><td style="border:1px solid #999;padding:6px">均衡优雅</td></tr>
<tr><td style="border:1px solid #999;padding:6px">浪漫主义</td><td style="border:1px solid #999;padding:6px">1820-1900</td><td style="border:1px solid #999;padding:6px">贝多芬/肖邦</td><td style="border:1px solid #999;padding:6px">情感强烈</td></tr>
<tr><td style="border:1px solid #999;padding:6px">现代</td><td style="border:1px solid #999;padding:6px">1900-</td><td style="border:1px solid #999;padding:6px">德彪西/斯特拉文斯基</td><td style="border:1px solid #999;padding:6px">突破传统</td></tr>
</table>

贝多芬九部交响曲：《第五交响曲》"命运在敲门"、《第九交响曲》"欢乐颂"（合唱）。贝多芬失聪后创作《第九交响曲》，音乐超越苦难。

管弦乐队编制：弦乐（小提琴中提琴大提琴低音提琴）、木管（长笛双簧管单簧管巴松）、铜管（小号圆号长号大号）、打击乐（定音鼓钹）。

交响曲结构：四乐章（快-慢-舞曲-快）。奏鸣曲式：呈示部-展开部-再现部。协奏曲：独奏与乐队对话。

入门聆听：维瓦尔第《四季》、莫扎特《小夜曲》、贝多芬《月光奏鸣曲》、柴可夫斯基《天鹅湖》。建议：先听旋律跟着哼，再听和声配器层次。',
'掌握古典音乐时期',
'["巴赫到贝多芬","管弦四组编制","奏鸣曲式结构","入门聆听清单"]',
'beginner', 12, 1),
(209, 59, '流行音乐与摇滚',
'流行音乐 20 世纪兴起：爵士、布鲁斯、摇滚、R&B、嘻哈、电子。流行音乐是社会文化的镜子。

<b>流行音乐流派表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">流派</th><th style="border:1px solid #999;padding:6px">起源</th><th style="border:1px solid #999;padding:6px">特征</th><th style="border:1px solid #999;padding:6px">代表</th></tr>
<tr><td style="border:1px solid #999;padding:6px">爵士</td><td style="border:1px solid #999;padding:6px">新奥尔良</td><td style="border:1px solid #999;padding:6px">即兴摇摆</td><td style="border:1px solid #999;padding:6px">阿姆斯特朗</td></tr>
<tr><td style="border:1px solid #999;padding:6px">摇滚</td><td style="border:1px solid #999;padding:6px">美国1950s</td><td style="border:1px solid #999;padding:6px">电吉他失真</td><td style="border:1px solid #999;padding:6px">披头士/皇后</td></tr>
<tr><td style="border:1px solid #999;padding:6px">R&B</td><td style="border:1px solid #999;padding:6px">黑人音乐</td><td style="border:1px solid #999;padding:6px">律动转音</td><td style="border:1px solid #999;padding:6px">迈克尔杰克逊</td></tr>
<tr><td style="border:1px solid #999;padding:6px">嘻哈</td><td style="border:1px solid #999;padding:6px">纽约布朗克斯</td><td style="border:1px solid #999;padding:6px">说唱+采样</td><td style="border:1px solid #999;padding:6px">埃米纳姆</td></tr>
<tr><td style="border:1px solid #999;padding:6px">电子</td><td style="border:1px solid #999;padding:6px">德国合成器</td><td style="border:1px solid #999;padding:6px">电子音色</td><td style="border:1px solid #999;padding:6px">Daft Punk</td></tr>
</table>

摇滚乐结构：主歌（Verse）+副歌（Chorus）+桥段（Bridge）。披头士《Hey Jude》的呐喊式副歌、波西米亚狂想曲的组曲式结构。

华语流行：邓丽君、周杰伦、林俊杰。周杰伦融合 R&B、中国风（东风破、青花瓷）与说唱，影响一代华语听众。

VOCALOID 与初音未来：虚拟歌手（语音合成技术），甩葱歌、千本樱等名曲，创作者生态（P主）开创 UGC 音乐时代。技术让音乐创作门槛降低。

流行音乐欣赏：关注词曲契合、编曲层次（配器进出）、混音空间感。演唱会文化：现场氛围与互动是流行音乐的魅力核心。',
'掌握流行音乐流派',
'["爵士摇滚嘻哈起源","主歌副歌结构","周杰伦中国风","初音未来VOCALOID"]',
'beginner', 12, 2),
(210, 59, '配乐与影视音乐',
'配乐是电影的隐形情感层。功能：建立氛围、暗示情绪、推动叙事。主题曲与背景音乐分工不同。

<b>影视配乐功能表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">功能</th><th style="border:1px solid #999;padding:6px">手法</th><th style="border:1px solid #999;padding:6px">例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">建立氛围</td><td style="border:1px solid #999;padding:6px">音色与速度</td><td style="border:1px solid #999;padding:6px">惊悚片低音弦乐</td></tr>
<tr><td style="border:1px solid #999;padding:6px">暗示情绪</td><td style="border:1px solid #999;padding:6px">大小调切换</td><td style="border:1px solid #999;padding:6px">悲剧小调</td></tr>
<tr><td style="border:1px solid #999;padding:6px">角色主题</td><td style="border:1px solid #999;padding:6px">主导动机</td><td style="border:1px solid #999;padding:6px">星球大战黑武士</td></tr>
<tr><td style="border:1px solid #999;padding:6px">叙事节奏</td><td style="border:1px solid #999;padding:6px">节拍同步剪辑</td><td style="border:1px solid #999;padding:6px">追车戏</td></tr>
</table>

主导动机（瓦格纳创造）：角色或主题专属旋律，出现即暗示。约翰威廉姆斯《星球大战》原力主题、汉斯季默《星际穿越》风琴。

动画与游戏配乐：宫崎骏×久石让（千与千寻、龙猫），游戏音乐（塞尔达、原神）用动态配乐系统（战斗切换）。

配乐工作流：看样片→定基调（音色风格）→主题创作→分场景配乐→混音。现代配乐大量使用电子合成器与管弦混合。

动漫音乐：热血番（进击的巨人）、治愈系（夏目友人帐）、催泪（未闻花名）。"神曲"的共同点：记忆点旋律+情绪积累+高潮释放。',
'掌握配乐知识',
'["配乐四功能","主导动机","久石让与宫崎骏","动态配乐系统"]',
'beginner', 12, 3),
(211, 59, '和声与编曲',
'和声是多个音同时发声的纵向结构，编曲是配器组织。三和弦（大三/小三/减三/增三）是基础。

<b>常用和弦进行表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">进行</th><th style="border:1px solid #999;padding:6px">和弦级数</th><th style="border:1px solid #999;padding:6px">听感</th><th style="border:1px solid #999;padding:6px">代表曲</th></tr>
<tr><td style="border:1px solid #999;padding:6px">四和弦循环</td><td style="border:1px solid #999;padding:6px">I-V-vi-IV</td><td style="border:1px solid #999;padding:6px">流行标配</td><td style="border:1px solid #999;padding:6px">无数流行歌</td></tr>
<tr><td style="border:1px solid #999;padding:6px">卡农进行</td><td style="border:1px solid #999;padding:6px">I-V-vi-III-IV-I-IV-V</td><td style="border:1px solid #999;padding:6px">经典抒情</td><td style="border:1px solid #999;padding:6px">卡农/很多歌</td></tr>
<tr><td style="border:1px solid #999;padding:6px">爵士进行</td><td style="border:1px solid #999;padding:6px">ii-V-I</td><td style="border:1px solid #999;padding:6px">爵士核心</td><td style="border:1px solid #999;padding:6px">爵士标准曲</td></tr>
<tr><td style="border:1px solid #999;padding:6px">终止式</td><td style="border:1px solid #999;padding:6px">V-I</td><td style="border:1px solid #999;padding:6px">收束感</td><td style="border:1px solid #999;padding:6px">结尾常用</td></tr>
</table>

编曲层次：旋律（主音色）+和声（伴奏织体）+贝斯（低音根基）+鼓（节奏骨架）+氛围（铺底音色）。音色频段分配：低中高不打架。

编曲软件（DAW）：FL Studio、Cubase、Ableton Live。基础操作：录音/钢琴卷帘/MIDI 编辑/混音导出。AI 音乐工具（Suno、Udio）2024 年爆发。

混音基础：音量平衡、声像（左右）、均衡（EQ 频段）、压缩（动态）、混响（空间感）。监听与参考曲目对比是进步捷径。

制作入门路线：先扒带（模仿喜欢的歌）→学合成器与音色设计→完成 10 首小样→混音母带。音乐制作是"做中学"的技能。',
'掌握和声与编曲',
'["四和弦循环","卡农进行","编曲五层结构","DAW入门"]',
'intermediate', 12, 4),
(212, 59, '音乐产业与版权',
'音乐产业从唱片到流媒体：黑胶→CD→数字下载→流媒体（Spotify、网易云）。商业模式持续变革。

<b>音乐商业模式演变表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">时代</th><th style="border:1px solid #999;padding:6px">载体</th><th style="border:1px solid #999;padding:6px">收入模式</th></tr>
<tr><td style="border:1px solid #999;padding:6px">唱片时代</td><td style="border:1px solid #999;padding:6px">黑胶/CD</td><td style="border:1px solid #999;padding:6px">实体销售</td></tr>
<tr><td style="border:1px solid #999;padding:6px">数字下载</td><td style="border:1px solid #999;padding:6px">MP3/Apple</td><td style="border:1px solid #999;padding:6px">单曲付费</td></tr>
<tr><td style="border:1px solid #999;padding:6px">流媒体</td><td style="border:1px solid #999;padding:6px">Spotify/网易</td><td style="border:1px solid #999;padding:6px">订阅+广告</td></tr>
<tr><td style="border:1px solid #999;padding:6px">粉丝经济</td><td style="border:1px solid #999;padding:6px">打投/周边</td><td style="border:1px solid #999;padding:6px">情感消费</td></tr>
</table>

版权构成：词曲版权（著作权人）+录音版权（唱片公司）+表演者权。版权收入：流媒体播放分成、商用授权、翻唱许可。

流媒体分成问题：单次播放分成极低（约 0.003-0.01 美元），艺术家收入主要靠巡演与周边。Spotify 版权费分配争议持续。

中国音乐市场：网易云音乐与腾讯音乐双巨头，版权大战后进入正版时代。独立音乐人（indie）通过平台直达听众。

AI 与音乐版权：AI 生成音乐（Suno 2024）引发"AI 歌手"与著作权争议——训练数据版权、声音肖像权。未来方向：人机协作创作+新的分成机制。',
'掌握音乐产业知识',
'["流媒体取代唱片","版权三层次","播放分成极低","AI音乐版权争议"]',
'intermediate', 12, 5),

(213, 60, '地球与经纬网',
'地理是认识世界的科学。地球形状：两极稍扁赤道略鼓的椭球体。经纬网是定位系统：经线南北、纬线东西。

<b>经纬网基础表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">项目</th><th style="border:1px solid #999;padding:6px">经线</th><th style="border:1px solid #999;padding:6px">纬线</th></tr>
<tr><td style="border:1px solid #999;padding:6px">方向</td><td style="border:1px solid #999;padding:6px">南北向</td><td style="border:1px solid #999;padding:6px">东西向</td></tr>
<tr><td style="border:1px solid #999;padding:6px">长度</td><td style="border:1px solid #999;padding:6px">等长约2万km</td><td style="border:1px solid #999;padding:6px">赤道最长递减</td></tr>
<tr><td style="border:1px solid #999;padding:6px">度数</td><td style="border:1px solid #999;padding:6px">0-180°</td><td style="border:1px solid #999;padding:6px">0-90°</td></tr>
<tr><td style="border:1px solid #999;padding:6px">划分</td><td style="border:1px solid #999;padding:6px">本初子午线</td><td style="border:1px solid #999;padding:6px">赤道</td></tr>
</table>

时区：全球 24 个时区，每 15° 一小时。北京在东八区（UTC+8）。国际日期变更线：180° 经线附近，向西越线加一天。

地图三要素：比例尺、方向、图例。比例尺=图上距离/实地距离。等高线地形图：密集陡峭、稀疏平缓、山峰鞍部判读。

地球运动：自转（昼夜更替、时差、地转偏向力）与公转（四季、五带、昼夜长短变化）。地转偏向力：北半球向右偏（台风旋向、河流右岸侵蚀）。

五带划分：热带（南北回归线间）、南北温带、南北寒带。太阳直射点回归运动产生四季。',
'掌握经纬网与时区',
'["经纬线方向长度","时区UTC+8","等高线判读地形","地转偏向力北右偏"]',
'intermediate', 12, 1),
(214, 60, '气候类型',
'气候是长期大气状态。两大因素：气温与降水。气候带与行星风带、海陆位置、地形密切相关。

<b>主要气候类型特征表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">气候</th><th style="border:1px solid #999;padding:6px">分布</th><th style="border:1px solid #999;padding:6px">特征</th><th style="border:1px solid #999;padding:6px">植被</th></tr>
<tr><td style="border:1px solid #999;padding:6px">热带雨林</td><td style="border:1px solid #999;padding:6px">赤道附近</td><td style="border:1px solid #999;padding:6px">全年高温多雨</td><td style="border:1px solid #999;padding:6px">雨林</td></tr>
<tr><td style="border:1px solid #999;padding:6px">热带沙漠</td><td style="border:1px solid #999;padding:6px">副热带</td><td style="border:1px solid #999;padding:6px">高温干旱</td><td style="border:1px solid #999;padding:6px">荒漠</td></tr>
<tr><td style="border:1px solid #999;padding:6px">地中海</td><td style="border:1px solid #999;padding:6px">30-40°大陆西岸</td><td style="border:1px solid #999;padding:6px">夏干冬雨</td><td style="border:1px solid #999;padding:6px">常绿硬叶</td></tr>
<tr><td style="border:1px solid #999;padding:6px">温带海洋</td><td style="border:1px solid #999;padding:6px">40-60°西岸</td><td style="border:1px solid #999;padding:6px">全年温和湿润</td><td style="border:1px solid #999;padding:6px">落叶阔叶</td></tr>
<tr><td style="border:1px solid #999;padding:6px">温带季风</td><td style="border:1px solid #999;padding:6px">东亚</td><td style="border:1px solid #999;padding:6px">夏雨冬干</td><td style="border:1px solid #999;padding:6px">温带阔叶</td></tr>
<tr><td style="border:1px solid #999;padding:6px">亚寒带针叶</td><td style="border:1px solid #999;padding:6px">高纬内陆</td><td style="border:1px solid #999;padding:6px">冬季严寒</td><td style="border:1px solid #999;padding:6px">针叶林</td></tr>
</table>

影响气候的因素：纬度（太阳辐射）、海陆位置（大陆性/海洋性）、地形（迎风坡多雨）、洋流（暖流增温增湿）、大气环流。

气候与农业：雨热同期（季风区水稻）、光热充足（新疆瓜果甜）、地中海（橄榄葡萄）。气候灾害：干旱、洪涝、寒潮、台风。

中国气候：季风气候显著（东部）、大陆性强、类型多样。秦岭-淮河线：亚热带与暖温带分界、800mm 年降水量线、水田旱地分界。

全球气候变化：温室气体排放致全球变暖，IPCC 报告：升温 1.1℃（2023 比工业化前）。应对：碳中和目标（中国 2060）、新能源转型、碳交易。',
'掌握气候类型与成因',
'["气候五因素","地中海夏干冬雨","秦岭淮河分界线","全球变暖与碳中和"]',
'intermediate', 12, 2),
(215, 60, '地形地貌',
'地形类型：平原、高原、山地、丘陵、盆地。内力作用（板块运动、地震火山）造格局，外力作用（流水、风力、冰川）塑细节。

<b>典型地貌成因表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">地貌</th><th style="border:1px solid #999;padding:6px">成因</th><th style="border:1px solid #999;padding:6px">典型地点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">喀斯特</td><td style="border:1px solid #999;padding:6px">流水溶蚀石灰岩</td><td style="border:1px solid #999;padding:6px">桂林山水</td></tr>
<tr><td style="border:1px solid #999;padding:6px">雅丹</td><td style="border:1px solid #999;padding:6px">风力侵蚀</td><td style="border:1px solid #999;padding:6px">敦煌魔鬼城</td></tr>
<tr><td style="border:1px solid #999;padding:6px">丹霞</td><td style="border:1px solid #999;padding:6px">红色砂砾岩侵蚀</td><td style="border:1px solid #999;padding:6px">张掖</td></tr>
<tr><td style="border:1px solid #999;padding:6px">冰川</td><td style="border:1px solid #999;padding:6px">冰川侵蚀堆积</td><td style="border:1px solid #999;padding:6px">瑞士/青藏</td></tr>
<tr><td style="border:1px solid #999;padding:6px">冲积平原</td><td style="border:1px solid #999;padding:6px">河流沉积</td><td style="border:1px solid #999;padding:6px">华北平原</td></tr>
</table>

板块构造：六大板块（亚欧、太平洋、印度洋、非洲、美洲、南极洲）。板块边界：生长边界（裂谷海岭）与消亡边界（山脉海沟）。喜马拉雅山是印度板块与亚欧板块碰撞产物。

地震：震源、震中、震级（释放能量）与烈度（破坏程度）。环太平洋地震带与地中海-喜马拉雅带是两大地震带。火山：环太平洋"火环"。

河流地貌：上游侵蚀（V 形谷）、中游搬运、下游沉积（三角洲、冲积扇）。黄河"地上河"：泥沙淤积河床抬高。

中国地形阶梯：第一级青藏高原（4000m+）、第二级高原盆地（1000-2000m）、第三级平原丘陵（500m 以下）。三级阶梯分界线：昆仑-祁连-横断、大兴安岭-太行-巫山-雪峰山。',
'掌握地形地貌成因',
'["内力造格局外力塑细节","喀斯特溶蚀雅丹风蚀","板块碰撞造山","中国三级阶梯"]',
'intermediate', 12, 3),
(216, 60, '洋流与海洋',
'洋流是海洋水的定向流动。成因：风（风海流）、密度差（密度流）、补偿（补偿流）。暖流从低纬流向高纬，寒流相反。

<b>世界主要洋流表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">洋流</th><th style="border:1px solid #999;padding:6px">位置</th><th style="border:1px solid #999;padding:6px">性质</th><th style="border:1px solid #999;padding:6px">影响</th></tr>
<tr><td style="border:1px solid #999;padding:6px">日本暖流</td><td style="border:1px solid #999;padding:6px">太平洋西岸</td><td style="border:1px solid #999;padding:6px">暖流</td><td style="border:1px solid #999;padding:6px">增温增湿</td></tr>
<tr><td style="border:1px solid #999;padding:6px">加利福尼亚寒流</td><td style="border:1px solid #999;padding:6px">太平洋东岸</td><td style="border:1px solid #999;padding:6px">寒流</td><td style="border:1px solid #999;padding:6px">降温减湿</td></tr>
<tr><td style="border:1px solid #999;padding:6px">墨西哥湾暖流</td><td style="border:1px solid #999;padding:6px">大西洋西岸</td><td style="border:1px solid #999;padding:6px">暖流</td><td style="border:1px solid #999;padding:6px">西欧温和</td></tr>
<tr><td style="border:1px solid #999;padding:6px">秘鲁寒流</td><td style="border:1px solid #999;padding:6px">南美西岸</td><td style="border:1px solid #999;padding:6px">寒流</td><td style="border:1px solid #999;padding:6px">渔场形成</td></tr>
</table>

洋流对气候：暖流增温增湿（西欧温带海洋性气候受益于北大西洋暖流），寒流降温减湿（秘鲁沿岸沙漠）。对海洋生物：寒暖流交汇处渔场（北海道、纽芬兰、北海、秘鲁上升流）。

厄尔尼诺与拉尼娜：赤道中东太平洋海温异常。厄尔尼诺：东太平洋增温，全球气候异常（我国暖冬、南美暴雨）。拉尼娜相反。

海洋资源：渔业（四大渔场）、矿产（海底锰结核、石油）、能源（潮汐、波浪、温差）。海洋权益：领海 12 海里、专属经济区 200 海里。

海洋保护：过度捕捞、塑料污染（太平洋垃圾带）、珊瑚白化（全球变暖）。蓝色经济与海洋碳汇（红树林、海草床）受关注。',
'掌握洋流与海洋',
'["暖流增温寒流降温","寒暖流交汇渔场","厄尔尼诺现象","专属经济区200海里"]',
'intermediate', 12, 4),
(217, 60, '区域地理与人文',
'人文地理研究人地关系：人口、聚落、产业、交通。区域差异塑造不同发展路径。

<b>世界人口分布表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">人口稠密区</th><th style="border:1px solid #999;padding:6px">原因</th><th style="border:1px solid #999;padding:6px">人口稀疏区</th></tr>
<tr><td style="border:1px solid #999;padding:6px">东亚（中国东部）</td><td style="border:1px solid #999;padding:6px">季风平原农业</td><td style="border:1px solid #999;padding:6px">撒哈拉沙漠</td></tr>
<tr><td style="border:1px solid #999;padding:6px">南亚（恒河平原）</td><td style="border:1px solid #999;padding:6px">冲积平原水源</td><td style="border:1px solid #999;padding:6px">西伯利亚</td></tr>
<tr><td style="border:1px solid #999;padding:6px">西欧</td><td style="border:1px solid #999;padding:6px">温和气候工业化</td><td style="border:1px solid #999;padding:6px">青藏高原</td></tr>
<tr><td style="border:1px solid #999;padding:6px">北美东部</td><td style="border:1px solid #999;padding:6px">经济发达</td><td style="border:1px solid #999;padding:6px">亚马孙雨林</td></tr>
</table>

人口问题：发展中国家增长快（就业教育压力），发达国家老龄化（劳动力短缺、养老负担）。中国人口 2022 年负增长，老龄化加速。

城市化：城市人口占比超 56%（世界），超大城市群（长三角、珠三角、东京圈）。城市化问题：交通拥堵、住房、环境。智慧城市与城市更新。

农业地域类型：季风水田（东亚）、商品谷物（美国大平原）、大牧场（阿根廷）、混合农业（澳大利亚）。工业区位：原料、市场、劳动力、技术、交通、政策。

交通运输：铁路（中欧班列）、海运（马六甲海峡）、航空。全球化分工：价值链（微笑曲线：研发品牌利润高，制造组装低）。',
'掌握人地关系',
'["人口分布四大区","老龄化挑战","微笑曲线价值链","城市化与都市圈"]',
'intermediate', 12, 5),

(218, 61, '运动训练原理',
'运动训练科学化：超负荷原则、循序渐进、专项化、个体化。FITT 原则：频率、强度、时间、类型。

<b>训练变量与原则表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">原则</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">应用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">超负荷</td><td style="border:1px solid #999;padding:6px">刺激超过适应水平</td><td style="border:1px solid #999;padding:6px">渐进加重</td></tr>
<tr><td style="border:1px solid #999;padding:6px">渐进性</td><td style="border:1px solid #999;padding:6px">逐步提高强度</td><td style="border:1px solid #999;padding:6px">每周+5%</td></tr>
<tr><td style="border:1px solid #999;padding:6px">专项性</td><td style="border:1px solid #999;padding:6px">训练接近比赛</td><td style="border:1px solid #999;padding:6px">跑者练跑</td></tr>
<tr><td style="border:1px solid #999;padding:6px">恢复</td><td style="border:1px solid #999;padding:6px">适应发生在休息</td><td style="border:1px solid #999;padding:6px">48h间隔</td></tr>
<tr><td style="border:1px solid #999;padding:6px">可逆性</td><td style="border:1px solid #999;padding:6px">停训体能下降</td><td style="border:1px solid #999;padding:6px">2周明显</td></tr>
</table>

能量系统三大供能：磷酸原（0-10秒，冲刺）、糖酵解（10秒-2分钟，无氧）、有氧氧化（>2分钟，耐力）。训练针对性：短跑练无氧，马拉松练有氧。

心率分区：最大心率约 220-年龄。燃脂区 60-70% 最大心率，有氧耐力区 70-80%，无氧区 80-90%。心率带训练法控制强度。

训练计划周期化：大周期（赛季）-中周期（月）-小周期（周）。基础期-强化期-巅峰期-调整期。新手建议每周 3 次有氧+2 次力量。

热身与整理：热身 5-10 分钟（动态拉伸提高核心温度），整理 5 分钟（慢跑+静态拉伸），预防损伤。RPE 主观强度感受作为自评工具。',
'掌握训练原则与心率',
'["FITT四要素","超负荷与渐进","三大供能系统","最大心率220-年龄"]',
'beginner', 12, 1),
(219, 61, '力量训练',
'力量训练提高肌肉力量与体态。器械、自由重量、自重三大类。核心动作模式：蹲、推、拉、铰链、核心。

<b>力量训练动作分类表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">模式</th><th style="border:1px solid #999;padding:6px">动作</th><th style="border:1px solid #999;padding:6px">目标肌群</th></tr>
<tr><td style="border:1px solid #999;padding:6px">蹲</td><td style="border:1px solid #999;padding:6px">深蹲/弓步</td><td style="border:1px solid #999;padding:6px">股四头臀大肌</td></tr>
<tr><td style="border:1px solid #999;padding:6px">推</td><td style="border:1px solid #999;padding:6px">卧推/俯卧撑</td><td style="border:1px solid #999;padding:6px">胸肩三头</td></tr>
<tr><td style="border:1px solid #999;padding:6px">拉</td><td style="border:1px solid #999;padding:6px">划船/引体</td><td style="border:1px solid #999;padding:6px">背二头</td></tr>
<tr><td style="border:1px solid #999;padding:6px">铰链</td><td style="border:1px solid #999;padding:6px">硬拉/臀桥</td><td style="border:1px solid #999;padding:6px">腘绳臀</td></tr>
<tr><td style="border:1px solid #999;padding:6px">核心</td><td style="border:1px solid #999;padding:6px">平板支撑</td><td style="border:1px solid #999;padding:6px">腹背稳定</td></tr>
</table>

训练参数：重量（RM 概念：8RM 是能做 8 次的重量）、组数（3-5 组）、次数（力量 1-5 次、增肌 8-12 次、耐力 15+）、组间休息（力量 2-3 分钟、增肌 1 分钟）。

动作技术要点：深蹲膝盖朝脚尖方向、腰背中立位；卧推肩胛收紧；硬拉杠铃贴腿。宁轻勿重，先学动作模式再上重量。

渐进超负荷：每周加 2.5-5% 重量或次数。训练分化：全身（新手）、上下肢分化、推拉腿分化（进阶）。

常见错误与防护：弯腰圆背（腰部受伤）、膝盖内扣、借力甩动（动量代偿）。护具：腰带（大重量）、护腕、训练鞋。女性力量训练不会"练成金刚芭比"（睾酮水平限制）。',
'掌握力量训练基础',
'["五大动作模式","RM与组次安排","渐进超负荷","先模式后重量"]',
'beginner', 12, 2),
(220, 61, '有氧与心肺',
'有氧运动提高心肺耐力（VO2max 最大摄氧量）。心肺功能是健康的核心指标（心肺耐力低下是全因死亡最大风险因素之一）。

<b>有氧运动类型表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类型</th><th style="border:1px solid #999;padding:6px">特点</th><th style="border:1px solid #999;padding:6px">适合</th></tr>
<tr><td style="border:1px solid #999;padding:6px">持续匀速</td><td style="border:1px solid #999;padding:6px">稳定心率长时间</td><td style="border:1px solid #999;padding:6px">基础耐力</td></tr>
<tr><td style="border:1px solid #999;padding:6px">间歇 HIIT</td><td style="border:1px solid #999;padding:6px">高低强度交替</td><td style="border:1px solid #999;padding:6px">时间少燃脂高</td></tr>
<tr><td style="border:1px solid #999;padding:6px">LSD 长距离</td><td style="border:1px solid #999;padding:6px">低强度长时间</td><td style="border:1px solid #999;padding:6px">马拉松备战</td></tr>
<tr><td style="border:1px solid #999;padding:6px">法特莱克</td><td style="border:1px solid #999;padding:6px">即兴变速跑</td><td style="border:1px solid #999;padding:6px">趣味提升</td></tr>
</table>

跑步技巧：步频 170-180 步/分、落地中前掌、躯干直立微前倾、摆臂前后不交叉。跑鞋选择：缓震型（大体重）、稳定型（扁平足）。

HIIT 示例：30 秒全力冲刺+90 秒慢走，重复 8 轮，总时长 20 分钟。EPOC（运动后过量氧耗）让燃脂持续数小时。

乳酸阈值：有氧转无氧的临界强度，训练可提高阈值（延长高速耐力）。谈乳酸色变是误解：乳酸也是燃料。

常见损伤与防护：跑者膝（髌骨软化）、胫骨骨膜炎（过度训练）、足底筋膜炎。预防：循序渐进（每周跑量+10% 以内）、交叉训练、力量补充、装备更换周期（500-800km）。',
'掌握有氧训练',
'["VO2max心肺指标","HIIT高效燃脂","步频170-180","跑量每周+10%"]',
'beginner', 12, 3),
(221, 61, '运动营养',
'运动营养：吃对食物支持训练与恢复。三大营养素供能分工，宏量营养素比例因人而异。

<b>运动营养要点表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">营养素</th><th style="border:1px solid #999;padding:6px">供能</th><th style="border:1px solid #999;padding:6px">推荐比例</th><th style="border:1px solid #999;padding:6px">来源</th></tr>
<tr><td style="border:1px solid #999;padding:6px">碳水化合物</td><td style="border:1px solid #999;padding:6px">4kcal/g</td><td style="border:1px solid #999;padding:6px">45-65%</td><td style="border:1px solid #999;padding:6px">全谷物水果</td></tr>
<tr><td style="border:1px solid #999;padding:6px">蛋白质</td><td style="border:1px solid #999;padding:6px">4kcal/g</td><td style="border:1px solid #999;padding:6px">15-25%</td><td style="border:1px solid #999;padding:6px">肉蛋奶豆</td></tr>
<tr><td style="border:1px solid #999;padding:6px">脂肪</td><td style="border:1px solid #999;padding:6px">9kcal/g</td><td style="border:1px solid #999;padding:6px">20-35%</td><td style="border:1px solid #999;padding:6px">坚果橄榄油</td></tr>
</table>

蛋白质摄入：普通成人 0.8-1.2g/kg/天，增肌训练 1.6-2.2g/kg/天，分 3-4 餐（每餐 20-40g）。乳清蛋白吸收快、酪蛋白慢释放。

碳水策略：训练前 1-2 小时补碳水（全麦面包、香蕉）、训练后 30-60 分钟补碳水+蛋白（恢复窗口），长距离前碳水负荷（糖原储备）。

补水：运动前 500ml、运动中每 15-20 分钟 150-300ml、出汗多补电解质（钠钾）。脱水 2% 就明显影响表现。别等口渴再喝。

补剂盘点：蛋白粉（方便补充蛋白质，非必需）、肌酸（提升爆发力，有研究支持）、咖啡因（提神）、BCAA（作用有限）、维生素 D（缺乏者补充）。警惕"智商税"补剂。',
'掌握运动营养',
'["三大营养素比例","增肌蛋白1.6-2.2g/kg","碳水恢复窗口","肌酸有效咖啡因有用"]',
'beginner', 12, 4),
(222, 61, '运动损伤与恢复',
'运动损伤预防大于治疗。损伤分类：急性（扭伤拉伤骨折）与慢性（过劳损伤）。RICE 原则处理急性损伤。

<b>常见运动损伤处理表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">损伤</th><th style="border:1px solid #999;padding:6px">症状</th><th style="border:1px solid #999;padding:6px">处理</th></tr>
<tr><td style="border:1px solid #999;padding:6px">踝关节扭伤</td><td style="border:1px solid #999;padding:6px">肿胀淤青疼痛</td><td style="border:1px solid #999;padding:6px">RICE+支具</td></tr>
<tr><td style="border:1px solid #999;padding:6px">肌肉拉伤</td><td style="border:1px solid #999;padding:6px">撕裂痛无力</td><td style="border:1px solid #999;padding:6px">冰敷制动</td></tr>
<tr><td style="border:1px solid #999;padding:6px">肌腱炎</td><td style="border:1px solid #999;padding:6px">慢性酸痛</td><td style="border:1px solid #999;padding:6px">离心训练</td></tr>
<tr><td style="border:1px solid #999;padding:6px">骨折</td><td style="border:1px solid #999;padding:6px">畸形异常活动</td><td style="border:1px solid #999;padding:6px">固定送医</td></tr>
</table>

RICE 四步：Rest 休息、Ice 冰敷（15-20 分钟/次）、Compression 加压、Elevation 抬高。48 小时后视情况热敷促进循环。

恢复三要素：睡眠（生长激素分泌）、营养（蛋白质碳水）、主动恢复（低强度活动促进血流）。深度睡眠是最好的恢复剂。

过度训练综合征：持续疲劳、静息心率升高、情绪低落、免疫下降（反复感冒）。预防：周期化安排、监测静息心率与主观感受。

回归训练原则：症状消失→无痛活动范围→力量恢复→渐进专项。急于回归导致二次损伤（再伤率更高）。倾听身体信号，专业运动员也重视"小伤大养"。',
'掌握损伤处理与恢复',
'["RICE四步处理","睡眠是最好恢复","过度训练三信号","渐进回归训练"]',
'beginner', 12, 5),

(223, 62, '宪法与法治',
'宪法是国家的根本大法。中国宪法 1982 年通过，历经五次修正。法治：法律面前人人平等，公权力受约束。

<b>宪法知识要点表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">概念</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">说明</th></tr>
<tr><td style="border:1px solid #999;padding:6px">国家性质</td><td style="border:1px solid #999;padding:6px">人民民主专政</td><td style="border:1px solid #999;padding:6px">国体</td></tr>
<tr><td style="border:1px solid #999;padding:6px">政体</td><td style="border:1px solid #999;padding:6px">人民代表大会制度</td><td style="border:1px solid #999;padding:6px">根本政治制度</td></tr>
<tr><td style="border:1px solid #999;padding:6px">公民权利</td><td style="border:1px solid #999;padding:6px">人身财产言论自由</td><td style="border:1px solid #999;padding:6px">宪法第二章</td></tr>
<tr><td style="border:1px solid #999;padding:6px">国家机构</td><td style="border:1px solid #999;padding:6px">人大/政府/监委/法检</td><td style="border:1px solid #999;padding:6px">分工监督</td></tr>
</table>

宪法地位：根本法，其他法律不得抵触。宪法监督：合宪性审查。宪法宣誓：国家工作人员就职时向宪法宣誓。

公民基本权利：平等权、人身自由、宗教信仰自由、监督权。义务：纳税、服兵役、受教育。权利与义务统一。

法治理念：科学立法、严格执法、公正司法、全民守法。法治政府：依法行政、权责清单。司法独立：法院检察院依法独立行使职权。

法律体系：宪法为统帅，法律（全国人大及其常委会制定）、行政法规、地方性法规、规章多层次。民法典、刑法、行政法等各部门法。',
'掌握宪法与法治',
'["宪法是根本大法","人民代表大会制度","公民权利义务统一","法律体系层次"]',
'beginner', 12, 1),
(224, 62, '民法总则',
'民法典 2021 年施行，共 7 编 1260 条。调整平等主体之间的人身与财产关系。基本原则：平等、自愿、公平、诚信、公序良俗。

<b>民法典分编结构表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">编</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">生活例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">总则编</td><td style="border:1px solid #999;padding:6px">主体权利能力</td><td style="border:1px solid #999;padding:6px">民事行为能力</td></tr>
<tr><td style="border:1px solid #999;padding:6px">物权编</td><td style="border:1px solid #999;padding:6px">所有权用益担保</td><td style="border:1px solid #999;padding:6px">房产所有权</td></tr>
<tr><td style="border:1px solid #999;padding:6px">合同编</td><td style="border:1px solid #999;padding:6px">合同订立履行</td><td style="border:1px solid #999;padding:6px">网购退款</td></tr>
<tr><td style="border:1px solid #999;padding:6px">人格权编</td><td style="border:1px solid #999;padding:6px">生命健康名誉</td><td style="border:1px solid #999;padding:6px">肖像权</td></tr>
<tr><td style="border:1px solid #999;padding:6px">婚姻家庭编</td><td style="border:1px solid #999;padding:6px">结婚离婚抚养</td><td style="border:1px solid #999;padding:6px">离婚冷静期</td></tr>
<tr><td style="border:1px solid #999;padding:6px">继承编</td><td style="border:1px solid #999;padding:6px">遗嘱法定继承</td><td style="border:1px solid #999;padding:6px">遗嘱效力</td></tr>
<tr><td style="border:1px solid #999;padding:6px">侵权责任编</td><td style="border:1px solid #999;padding:6px">损害赔偿</td><td style="border:1px solid #999;padding:6px">交通事故</td></tr>
</table>

民事行为能力三档：不满 8 周岁无民事行为能力、8-18 周岁限制民事行为能力（与年龄智力相适应有效）、18 周岁以上完全。

自然人权利：生命权、健康权、姓名权、肖像权、名誉权、隐私权。网络侵权：AI 换脸侵犯肖像权、人肉搜索侵犯隐私权。

诉讼时效：一般 3 年，自知道权利受侵害起算。超过时效丧失胜诉权（实体权利仍在）。诉讼时效中止中断规则。

自然人个人信息保护：收集处理需合法正当必要，敏感信息（生物识别、医疗健康）需单独同意。个人信息保护法（2021）专门立法。',
'掌握民法基础',
'["民法典七编结构","三档民事行为能力","人格权独立成编","诉讼时效3年"]',
'beginner', 12, 2),
(225, 62, '刑法常识',
'刑法规定犯罪与刑罚。罪刑法定：法无明文规定不为罪。犯罪构成四要件：主体、主观、客体、客观。

<b>犯罪构成要件表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">要件</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">问题</th></tr>
<tr><td style="border:1px solid #999;padding:6px">主体</td><td style="border:1px solid #999;padding:6px">刑事责任年龄</td><td style="border:1px solid #999;padding:6px">16岁全责</td></tr>
<tr><td style="border:1px solid #999;padding:6px">主观</td><td style="border:1px solid #999;padding:6px">故意/过失</td><td style="border:1px solid #999;padding:6px">直接间接故意</td></tr>
<tr><td style="border:1px solid #999;padding:6px">客体</td><td style="border:1px solid #999;padding:6px">受保护的法益</td><td style="border:1px solid #999;padding:6px">人身/财产</td></tr>
<tr><td style="border:1px solid #999;padding:6px">客观</td><td style="border:1px solid #999;padding:6px">危害行为结果</td><td style="border:1px solid #999;padding:6px">因果关系</td></tr>
</table>

刑事责任年龄：14-16 周岁对八类重罪（故意杀人、抢劫、强奸等）负责；12-14 周岁特定情形（故意杀人致死、情节恶劣经最高检核准追诉）。

正当防卫：对正在进行的不法侵害采取制止行为，不负责任。特殊防卫：针对行凶杀人等严重暴力可致伤亡。防卫过当负刑责但应减轻。

刑罚种类：主刑（管制、拘役、有期徒刑、无期徒刑、死刑）、附加刑（罚金、剥夺政治权利、没收财产）。缓刑减刑假释制度。

常见罪名：危险驾驶（醉驾入刑）、诈骗罪（电信诈骗）、帮信罪（出借银行卡涉诈）、侮辱诽谤。AI 犯罪新形态：AI 换脸诈骗、深度伪造。',
'掌握刑法基础',
'["罪刑法定原则","四要件犯罪构成","正当防卫成立条件","醉驾入刑"]',
'beginner', 12, 3),
(226, 62, '消费者权益保护',
'消费者权益保护法保障九项权利。网购七日无理由退货是消费者最常用的权利。

<b>消费者九项权利表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">权利</th><th style="border:1px solid #999;padding:6px">含义</th><th style="border:1px solid #999;padding:6px">实例</th></tr>
<tr><td style="border:1px solid #999;padding:6px">安全保障</td><td style="border:1px solid #999;padding:6px">人身财产不受害</td><td style="border:1px solid #999;padding:6px">食品质量</td></tr>
<tr><td style="border:1px solid #999;padding:6px">知情权</td><td style="border:1px solid #999;padding:6px">真实全面信息</td><td style="border:1px solid #999;padding:6px">成分标注</td></tr>
<tr><td style="border:1px solid #999;padding:6px">自主选择</td><td style="border:1px solid #999;padding:6px">自愿选择商品</td><td style="border:1px solid #999;padding:6px">拒绝强卖</td></tr>
<tr><td style="border:1px solid #999;padding:6px">公平交易</td><td style="border:1px solid #999;padding:6px">质量价格合理</td><td style="border:1px solid #999;padding:6px">缺斤短两</td></tr>
<tr><td style="border:1px solid #999;padding:6px">求偿权</td><td style="border:1px solid #999;padding:6px">损害获赔偿</td><td style="border:1px solid #999;padding:6px">三倍赔偿</td></tr>
</table>

七日无理由退货：网购商品收到 7 天内可无理由退（法定例外：定制商品、鲜活易腐、拆封音像软件等）。退货运费由消费者承担（另有约定除外）。

惩罚性赔偿：经营者欺诈（虚假宣传）可要求三倍赔偿（不足 500 按 500）；食品药品质量问题可要求十倍赔偿（不足 1000 按 1000）。

维权途径：与商家协商→平台投诉→12315 投诉→市场监管部门→法院诉讼。证据保存：订单截图、聊天记录、发票、开箱视频。

直播带货责任：主播是经营者则承担经营者责任，平台要公示主播身份信息（"网红带货"纳入监管）。预付卡消费风险：卷款跑路维权难，尽量小额。',
'掌握消费者权益',
'["九项权利核心","七日无理由退货","三倍赔偿规则","维权五途径"]',
'beginner', 12, 4),
(227, 62, '劳动法与职场权利',
'劳动法保护劳动者：劳动合同、工时工资、社保、离职保障。劳动仲裁是解决劳动争议的主要途径。

<b>劳动权益要点表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">事项</th><th style="border:1px solid #999;padding:6px">规定</th><th style="border:1px solid #999;padding:6px">注意</th></tr>
<tr><td style="border:1px solid #999;padding:6px">试用期</td><td style="border:1px solid #999;padding:6px">最长6个月</td><td style="border:1px solid #999;padding:6px">与合同期挂钩</td></tr>
<tr><td style="border:1px solid #999;padding:6px">加班费</td><td style="border:1px solid #999;padding:6px">平日150%周末200%节日300%</td><td style="border:1px solid #999;padding:6px">综合工时例外</td></tr>
<tr><td style="border:1px solid #999;padding:6px">年假</td><td style="border:1px solid #999;padding:6px">满1年5天起</td><td style="border:1px solid #999;padding:6px">10年10天20年15天</td></tr>
<tr><td style="border:1px solid #999;padding:6px">解除</td><td style="border:1px solid #999;padding:6px">N+1补偿</td><td style="border:1px solid #999;padding:6px">N=工龄月薪</td></tr>
</table>

劳动合同必备条款：期限、工作内容地点、工时休息、报酬、社保。试用期工资不低于转正 80% 且不低于最低工资。一个月内签合同（超一个月双倍工资）。

解除补偿：公司无过错裁员 N+1（N 为工作年限月薪，+1 代通知金）；违法解除 2N。经济性裁员（公司经营困难）走特别程序。竞业限制补偿每月不低于工资 30%。

社保五险：养老、医疗、失业、工伤、生育。医保断缴影响待遇。公积金非社保但强制。灵活就业可自缴养老医疗。

加班 996 的法律边界：协商自愿+支付加班费；违法强制加班可举报。职场性骚扰：用人单位负防治义务。劳动仲裁时效 1 年，不收费。',
'掌握劳动权益',
'["试用期6个月上限","加班费150/200/300%","N+1补偿规则","劳动仲裁时效1年"]',
'beginner', 12, 5),

(228, 63, '国际体系与主权',
'国际关系研究国家间互动。主权是国际体系基石：领土、人口、政府、主权四要素。联合国是最大国际组织。

<b>国际行为体对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">行为体</th><th style="border:1px solid #999;padding:6px">类型</th><th style="border:1px solid #999;padding:6px">影响力</th></tr>
<tr><td style="border:1px solid #999;padding:6px">主权国家</td><td style="border:1px solid #999;padding:6px">传统行为体</td><td style="border:1px solid #999;padding:6px">核心</td></tr>
<tr><td style="border:1px solid #999;padding:6px">国际组织</td><td style="border:1px solid #999;padding:6px">政府间/非政府</td><td style="border:1px solid #999;padding:6px">联合国/WHO/WTO</td></tr>
<tr><td style="border:1px solid #999;padding:6px">跨国公司</td><td style="border:1px solid #999;padding:6px">经济行为体</td><td style="border:1px solid #999;padding:6px">苹果/三星</td></tr>
<tr><td style="border:1px solid #999;padding:6px">非政府组织</td><td style="border:1px solid #999;padding:6px">公民社会</td><td style="border:1px solid #999;padding:6px">红十字/绿色和平</td></tr>
</table>

联合国：1945 年成立，安理会五常（中美俄英法）拥有否决权。联合国职能：和平与安全、发展、人权。改革呼声（五常扩容、否决权限制）。

国际法：条约、习惯国际法、一般法律原则。维也纳外交关系公约（外交豁免）。国际法院（海牙）与战争罪法庭。

国际体系理论三大流派：现实主义（权力争夺）、自由主义（制度合作）、建构主义（观念身份）。霸权稳定论：霸权国提供秩序公共品。

金砖国家（BRICS）：中国、印度、巴西、俄罗斯、南非+新成员（2024 扩容）。二十国集团（G20）危机协调平台。',
'掌握国际体系',
'["主权四要素","联合国五常否决权","三大理论流派","金砖与G20"]',
'intermediate', 12, 1),
(229, 63, '大国关系',
'大国关系是国际格局主轴。中美、中俄、美欧关系牵动全球。修昔底德陷阱：守成国与崛起国冲突的历史规律（但非必然）。

<b>大国关系图景表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">关系</th><th style="border:1px solid #999;padding:6px">现状</th><th style="border:1px solid #999;padding:6px">焦点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">中美</td><td style="border:1px solid #999;padding:6px">竞争合作并存</td><td style="border:1px solid #999;padding:6px">科技/台湾/贸易</td></tr>
<tr><td style="border:1px solid #999;padding:6px">中俄</td><td style="border:1px solid #999;padding:6px">全面战略协作</td><td style="border:1px solid #999;padding:6px">能源/安全</td></tr>
<tr><td style="border:1px solid #999;padding:6px">美欧</td><td style="border:1px solid #999;padding:6px">盟友但有摩擦</td><td style="border:1px solid #999;padding:6px">贸易/数字税</td></tr>
<tr><td style="border:1px solid #999;padding:6px">中日</td><td style="border:1px solid #999;padding:6px">复交50年</td><td style="border:1px solid #999;padding:6px">历史/海洋</td></tr>
</table>

中美关系：1979 年建交，三个联合公报（上海公报、建交公报、八一七公报）是政治基础。竞争维度：技术（芯片管制 2022 出口限制）、军事（南海台海）、制度竞争（民主 vs 威权叙事）。

修昔底德陷阱概念（格雷厄姆艾利森）：雅典 vs 斯巴达。历史上 16 例守成-崛起冲突中 12 例战争。出路：管控竞争+利益捆绑+第三方缓冲。

战略概念：印太战略（美）、一带一路（中）、全球南方。中间地带国家（东盟、中东）在大国间寻求平衡，争取自主外交。

管控机制：元首会晤（2023 旧金山）、热线、危机沟通渠道。竞争时代的稳定器：经贸相互依赖、核威慑、多边框架。',
'掌握大国博弈逻辑',
'["中美三个联合公报","修昔底德陷阱","一带一路与印太","管控竞争机制"]',
'intermediate', 12, 2),
(230, 63, '地缘政治',
'地缘政治研究地理对国际关系的影响：位置、资源、咽喉要道。马汉海权论、麦金德陆权论是经典理论。

<b>关键地缘区域表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">区域</th><th style="border:1px solid #999;padding:6px">地位</th><th style="border:1px solid #999;padding:6px">博弈点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">马六甲海峡</td><td style="border:1px solid #999;padding:6px">能源咽喉</td><td style="border:1px solid #999;padding:6px">中日韩油运</td></tr>
<tr><td style="border:1px solid #999;padding:6px">霍尔木兹海峡</td><td style="border:1px solid #999;padding:6px">石油阀门</td><td style="border:1px solid #999;padding:6px">世界1/5石油</td></tr>
<tr><td style="border:1px solid #999;padding:6px">苏伊士运河</td><td style="border:1px solid #999;padding:6px">欧亚捷径</td><td style="border:1px solid #999;padding:6px">2021堵船事件</td></tr>
<tr><td style="border:1px solid #999;padding:6px">台湾海峡</td><td style="border:1px solid #999;padding:6px">西太航道</td><td style="border:1px solid #999;padding:6px">中美敏感点</td></tr>
<tr><td style="border:1px solid #999;padding:6px">南海</td><td style="border:1px solid #999;padding:6px">资源与航道</td><td style="border:1px solid #999;padding:6px">岛礁争端</td></tr>
</table>

陆权 vs 海权：麦金德"心脏地带"（欧亚内陆控制者主导世界岛）、马汉"谁控制海洋谁控制世界"。现实中陆海并重，中国"一带一路"同时经营陆上与海上通道。

资源地缘：石油（中东储量占比高）、稀土（中国产量占全球约 60%，2023 年出口管制反制）、锂（新能源）、粮食（俄乌黑海粮道）。

北极博弈：全球变暖打通北极航道，俄罗斯北方航道、美国破冰船、资源争夺。太空地缘：轨道资源、星链（Starlink 通信主导）、空间碎片治理。

印太地区：东盟中心地位、四国机制（美日印澳）、RCEP 经济圈。威慑与平衡：岛链与自由航行、军事基地网络（关岛、冲绳、迪戈加西亚）。',
'掌握地缘政治',
'["马六甲霍尔木兹咽喉","陆权海权理论","稀土锂战略资源","北极与太空新前沿"]',
'intermediate', 12, 3),
(231, 63, '全球治理',
'全球治理应对跨国问题：气候变化、公共卫生、金融风险。机制网络化：联合国+专门机构+区域组织+非官方平台。

<b>全球治理机制表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">领域</th><th style="border:1px solid #999;padding:6px">机制</th><th style="border:1px solid #999;padding:6px">现状</th></tr>
<tr><td style="border:1px solid #999;padding:6px">气候</td><td style="border:1px solid #999;padding:6px">巴黎协定</td><td style="border:1px solid #999;padding:6px">温控1.5℃</td></tr>
<tr><td style="border:1px solid #999;padding:6px">贸易</td><td style="border:1px solid #999;padding:6px">WTO</td><td style="border:1px solid #999;padding:6px">争端机制停摆</td></tr>
<tr><td style="border:1px solid #999;padding:6px">金融</td><td style="border:1px solid #999;padding:6px">IMF/世界银行</td><td style="border:1px solid #999;padding:6px">份额改革</td></tr>
<tr><td style="border:1px solid #999;padding:6px">健康</td><td style="border:1px solid #999;padding:6px">WHO</td><td style="border:1px solid #999;padding:6px">疫苗公平</td></tr>
<tr><td style="border:1px solid #999;padding:6px">数字</td><td style="border:1px solid #999;padding:6px">全球数字契约</td><td style="border:1px solid #999;padding:6px">AI治理探索</td></tr>
</table>

气候变化治理：IPCC 科学报告→COP 谈判→国家自主贡献（NDC）。中国"双碳"承诺：2030 碳达峰、2060 碳中和。碳边境调节机制（欧盟 CBAM）。

全球卫生：新冠暴露治理短板——疫苗民族主义、大流行病条约谈判（2024 未果）。加强 WHO 资金与能力是改革方向。

贸易治理困境：WTO 上诉机构瘫痪（美国阻挠）、区域协定兴起（RCEP、CPTPP、印太经济框架）。贸易碎片化风险（友岸外包）。

数字治理：AI 安全（布切雷特峰会 2024、全球 AI 治理共识）、数据跨境、网络空间主权（中国主张）。人类命运共同体理念提供中国方案。',
'掌握全球治理',
'["巴黎协定温控","WHO疫情短板","WTO困境区域化","AI全球治理"]',
'intermediate', 12, 4),
(232, 63, '中国外交',
'中国外交原则：独立自主、和平共处五项原则（1954 提出：互相尊重主权领土完整、互不侵犯、互不干涉内政、平等互利、和平共处）。

<b>中国外交布局表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">方向</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">平台</th></tr>
<tr><td style="border:1px solid #999;padding:6px">大国外交</td><td style="border:1px solid #999;padding:6px">稳定中美新型大国关系</td><td style="border:1px solid #999;padding:6px">G20/APEC</td></tr>
<tr><td style="border:1px solid #999;padding:6px">周边外交</td><td style="border:1px solid #999;padding:6px">亲诚惠容</td><td style="border:1px solid #999;padding:6px">东盟+RCEP</td></tr>
<tr><td style="border:1px solid #999;padding:6px">发展中国家</td><td style="border:1px solid #999;padding:6px">南南合作</td><td style="border:1px solid #999;padding:6px">金砖/中非论坛</td></tr>
<tr><td style="border:1px solid #999;padding:6px">多边外交</td><td style="border:1px solid #999;padding:6px">全球治理贡献</td><td style="border:1px solid #999;padding:6px">联合国/气候大会</td></tr>
</table>

一带一路：2013 年提出，设施联通、贸易畅通、资金融通、民心相通、政策沟通五通。十年成果：150+ 国家参与、中欧班列累计开行超 10 万列（2024）。

台湾问题：一个中国原则，反对台独，和平统一方针。中美关系三条底线（台湾问题、民主人权、发展权利）。

人类命运共同体：构建相互尊重、公平正义、合作共赢的新型国际关系。全球发展倡议、全球安全倡议、全球文明倡议"三大倡议"。

主场外交：进博会、一带一路峰会、中非合作论坛。公共外交：熊猫外交、孔子学院与中文国际传播。中国式现代化为发展中国家提供新选择。',
'掌握中国外交',
'["和平共处五项原则","一带一路五通","一个中国原则","三大倡议"]',
'intermediate', 12, 5),

(233, 64, '助词系统深化',
'日语助词是句子的"骨架"，决定成分关系。核心助词：はがをにでと。每个助词有多个用法，是日语学习的重点难点。

<b>核心助词用法表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">助词</th><th style="border:1px solid #999;padding:6px">主要用法</th><th style="border:1px solid #999;padding:6px">例句</th></tr>
<tr><td style="border:1px solid #999;padding:6px">は</td><td style="border:1px solid #999;padding:6px">主题/对比</td><td style="border:1px solid #999;padding:6px">私は学生です</td></tr>
<tr><td style="border:1px solid #999;padding:6px">が</td><td style="border:1px solid #999;padding:6px">主语/对象</td><td style="border:1px solid #999;padding:6px">雨が降る</td></tr>
<tr><td style="border:1px solid #999;padding:6px">を</td><td style="border:1px solid #999;padding:6px">宾语</td><td style="border:1px solid #999;padding:6px">本を読む</td></tr>
<tr><td style="border:1px solid #999;padding:6px">に</td><td style="border:1px solid #999;padding:6px">时间/方向/目的</td><td style="border:1px solid #999;padding:6px">学校に行く</td></tr>
<tr><td style="border:1px solid #999;padding:6px">で</td><td style="border:1px solid #999;padding:6px">场所/手段</td><td style="border:1px solid #999;padding:6px">電車で行く</td></tr>
<tr><td style="border:1px solid #999;padding:6px">と</td><td style="border:1px solid #999;padding:6px">共同/引用</td><td style="border:1px solid #999;padding:6px">友達と話す</td></tr>
</table>

は vs が：は提示主题（已知信息），が标记主语（新信息/强调）。"私は日本人です"（主题是我）vs "私が日本人です"（强调的是我）。

に vs で：に表示存在地点（います/あります）与动作方向；で表示动作发生的场所。"教室にいます"（在教室，存在）vs "教室で勉強します"（在教室学习，动作）。

助词省略与会话：口语常省略助词，但书面语必须完整。格助词与副助词（も、だけ、しか）区别：格助词定成分，副助词加语气。

助词组合：にでと 连用（東京で友達に会う）。学习建议：每个助词整理一个"用法卡片"，用例句记忆而不是背规则。',
'掌握核心助词用法',
'["は主题が主语","を宾语に方向で场所","に表示存在地点","助词卡片学习法"]',
'intermediate', 12, 1),
(234, 64, '动词活用体系',
'日语动词按活用分三类：一类（五段）、二类（一段）、三类（不规则）。动词活用是日语句子的核心。

<b>日语动词分类表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类别</th><th style="border:1px solid #999;padding:6px">特点</th><th style="border:1px solid #999;padding:6px">例词</th><th style="border:1px solid #999;padding:6px">判断</th></tr>
<tr><td style="border:1px solid #999;padding:6px">一类动词</td><td style="border:1px solid #999;padding:6px">五段活用</td><td style="border:1px solid #999;padding:6px">書く/話す</td><td style="border:1px solid #999;padding:6px">え段+る以外</td></tr>
<tr><td style="border:1px solid #999;padding:6px">二类动词</td><td style="border:1px solid #999;padding:6px">一段活用</td><td style="border:1px solid #999;padding:6px">食べる/見る</td><td style="border:1px solid #999;padding:6px">え段+る</td></tr>
<tr><td style="border:1px solid #999;padding:6px">三类动词</td><td style="border:1px solid #999;padding:6px">不规则</td><td style="border:1px solid #999;padding:6px">する/来る</td><td style="border:1px solid #999;padding:6px">记住即可</td></tr>
</table>

动词变形六种：ます形（礼貌）、て形（连接）、ない形（否定）、た形（过去）、可能形（能）、意向形（想要/提议）。

て形变换口诀：く→いて、ぐ→いで、す→して、むぶぬ→んで、つうる→って。書く→書いて、飲む→飲んで、待つ→待って。

可能形：一类う段→え段+る（書く→書ける）、二类去掉る+られる（食べる→食べられる）、三类（できる/来られる）。

礼貌体 vs 简体：与上级用ますです形，与朋友用简体（だ/る/た）。混合使用是常见错误。动词活用是"把骨架装进句子"的关键。',
'掌握动词活用',
'["三类动词分类","六种基本变形","て形变换口诀","可能形构成"]',
'intermediate', 12, 2),
(235, 64, '敬语体系',
'敬语是日语社会性的体现：尊重对方与话题中的人。三大类：尊敬语、谦让语、礼貌语。用错比不用更失礼。

<b>敬语三分类表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类型</th><th style="border:1px solid #999;padding:6px">用法</th><th style="border:1px solid #999;padding:6px">例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">尊敬语</td><td style="border:1px solid #999;padding:6px">抬高对方动作</td><td style="border:1px solid #999;padding:6px">いらっしゃる</td></tr>
<tr><td style="border:1px solid #999;padding:6px">谦让语</td><td style="border:1px solid #999;padding:6px">压低自己动作</td><td style="border:1px solid #999;padding:6px">いただく</td></tr>
<tr><td style="border:1px solid #999;padding:6px">礼貌语</td><td style="border:1px solid #999;padding:6px">整体礼貌表达</td><td style="border:1px solid #999;padding:6px">ございます</td></tr>
</table>

特殊敬语动词对照：行く/来る→いらっしゃる（尊敬）、参る（谦让）；食べる/飲む→召し上がる（尊敬）、いただく（谦让）；言う→おっしゃる（尊敬）、申す（谦让）。

敬语构成：お+ます形+になる（尊敬，お読みになる）、お+ます形+する（谦让，お待ちする）。被动形作敬语（先生が読まれる）。

商务敬语场景：初次见面（初めまして、よろしくお願いいたします）、请求（お願い申し上げます）、感谢（誠にありがとうございます）。

职场规则：对客户用敬语、对同事用礼貌体、对下级可用简体。电话应对固定用语（もしもし→お電話ありがとうございます）。敬语不是"讨好"而是"距离感"的表达。',
'掌握敬语体系',
'["尊敬谦让礼貌三类","特殊敬语动词","お+ます形+になる","商务敬语场景"]',
'intermediate', 12, 3),
(236, 64, '复合句与长句',
'日语长句由从句与连体修饰构成。接续助词连接从句：て、から、ので、けど。关系从句修饰名词。

<b>接续助词用法表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">助词</th><th style="border:1px solid #999;padding:6px">用法</th><th style="border:1px solid #999;padding:6px">例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">から</td><td style="border:1px solid #999;padding:6px">原因（主观）</td><td style="border:1px solid #999;padding:6px">寒いから行かない</td></tr>
<tr><td style="border:1px solid #999;padding:6px">ので</td><td style="border:1px solid #999;padding:6px">原因（客观）</td><td style="border:1px solid #999;padding:6px">雨なので中止</td></tr>
<tr><td style="border:1px solid #999;padding:6px">けど/が</td><td style="border:1px solid #999;padding:6px">转折/铺垫</td><td style="border:1px solid #999;padding:6px">高いけど買う</td></tr>
<tr><td style="border:1px solid #999;padding:6px">たら/ば</td><td style="border:1px solid #999;padding:6px">条件</td><td style="border:1px solid #999;padding:6px">行ったら電話</td></tr>
</table>

连体修饰：动词简体形直接修饰名词（読む本）、い形容词（面白い映画）、な形容词+な（きれいな花）。

长句拆解方法：先找主谓语（は...だ/ます）、再剥从句（修饰语）、最后看助词关系。新闻标题是长句训练好材料。

「という」引用与定义：私は彼が来ると思っています（引用）。「こと/の」名词化：日本に行くことが夢です。

综合练习：読解长句结构=主语+对象+时间地点+动作+态度。逐步加修饰，先写短句再合并成复合句。',
'掌握复合句结构',
'["から主观ので客观","连体修饰规则","という引用","长句拆解方法"]',
'intermediate', 12, 4),
(237, 64, '文化礼仪与表达',
'日语表达反映文化：暧昧表达、间接拒绝、场合用语。理解文化才能用对日语。

<b>日本文化表达表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">场景</th><th style="border:1px solid #999;padding:6px">日语表达</th><th style="border:1px solid #999;padding:6px">文化内涵</th></tr>
<tr><td style="border:1px solid #999;padding:6px">感谢</td><td style="border:1px solid #999;padding:6px">ありがとうございます</td><td style="border:1px solid #999;padding:6px">反复道谢</td></tr>
<tr><td style="border:1px solid #999;padding:6px">道歉</td><td style="border:1px solid #999;padding:6px">すみません</td><td style="border:1px solid #999;padding:6px">万能开场</td></tr>
<tr><td style="border:1px solid #999;padding:6px">拒绝</td><td style="border:1px solid #999;padding:6px">ちょっと…</td><td style="border:1px solid #999;padding:6px">暧昧婉拒</td></tr>
<tr><td style="border:1px solid #999;padding:6px">进门</td><td style="border:1px solid #999;padding:6px">お邪魔します</td><td style="border:1px solid #999;padding:6px">打扰礼貌</td></tr>
<tr><td style="border:1px solid #999;padding:6px">开饭</td><td style="border:1px solid #999;padding:6px">いただきます</td><td style="border:1px solid #999;padding:6px">感恩食物</td></tr>
</table>

すみません的多义：道歉、感谢（劳驾）、搭话开场。以心伝心（默契沟通）：日本人不喜欢明确拒绝，用"考えさせてください"（让我考虑一下）婉拒。

场合用语：进门お邪魔します、告辞お先に失礼します（我先走了）、回寝おやすみなさい。公司用语与朋友用语分开。

数字与称呼礼仪：人数（一人/二人/三人...）、年纪敬称（様、さん）。名片交换礼仪：双手递接、正面朝向对方、认真阅读。

动漫与生活日语差异：动漫用简体与夸张（やばい、マジ）、现实更礼貌。通过动漫学口语是好途径，但要学会切换礼貌度。',
'掌握文化表达',
'["すみません多义","暧昧拒绝文化","场合固定用语","动漫日语与现实的差异"]',
'intermediate', 12, 5);

INSERT IGNORE INTO sekai_learning_quiz_questions (id, lesson_id, question, question_type, options, correct_answer, explanation, sort_order) VALUES
(355, 178, '楔形文字属于哪个文明？', 'single', '[{"label":"A","text":"美索不达米亚"},{"label":"B","text":"古埃及"},{"label":"C","text":"古印度"},{"label":"D","text":"古中国"}]', 'A', '两河流域苏美尔人发明楔形文字', 1),
(356, 178, '罗塞塔石碑破解了哪种文字？', 'single', '[{"label":"A","text":"埃及象形文字"},{"label":"B","text":"楔形文字"},{"label":"C","text":"甲骨文"},{"label":"D","text":"玛雅文字"}]', 'A', '罗塞塔石碑三语对照破解象形文字', 2),
(357, 179, '雅典民主制度的特点？', 'single', '[{"label":"A","text":"公民直接参与"},{"label":"B","text":"人人可当国王"},{"label":"C","text":"贵族世袭"},{"label":"D","text":"宗教统治"}]', 'A', '雅典公民大会直接民主', 1),
(358, 179, '十二铜表法是哪国的法典？', 'single', '[{"label":"A","text":"古罗马"},{"label":"B","text":"古希腊"},{"label":"C","text":"古巴比伦"},{"label":"D","text":"古埃及"}]', 'A', '罗马最早成文法', 2),
(359, 180, '保存希腊古典典籍的帝国是？', 'single', '[{"label":"A","text":"拜占庭"},{"label":"B","text":"蒙古"},{"label":"C","text":"查理曼"},{"label":"D","text":"奥斯曼"}]', 'A', '拜占庭保存古希腊罗马文化', 1),
(360, 180, '黑死病发生在哪个世纪？', 'single', '[{"label":"A","text":"14世纪"},{"label":"B","text":"12世纪"},{"label":"C","text":"16世纪"},{"label":"D","text":"18世纪"}]', 'A', '1347-1353 黑死病', 2),
(361, 181, '哥伦布 1492 年到达？', 'single', '[{"label":"A","text":"美洲"},{"label":"B","text":"印度"},{"label":"C","text":"日本"},{"label":"D","text":"非洲"}]', 'A', '哥伦布误以为到印度实际是美洲', 1),
(362, 181, '麦哲伦航行的历史意义？', 'single', '[{"label":"A","text":"首次环球航行"},{"label":"B","text":"发现好望角"},{"label":"C","text":"开通苏伊士"},{"label":"D","text":"发现南极"}]', 'A', '1519-1522 首次环球证明地球是圆', 2),
(363, 182, '第一次工业革命的动力是？', 'single', '[{"label":"A","text":"蒸汽机"},{"label":"B","text":"电力"},{"label":"C","text":"内燃机"},{"label":"D","text":"核能"}]', 'A', '蒸汽动力标志第一次工业革命', 1),
(364, 182, '福特流水线属于？', 'single', '[{"label":"A","text":"第二次工业革命"},{"label":"B","text":"第一次工业革命"},{"label":"C","text":"第三次工业革命"},{"label":"D","text":"数字革命"}]', 'A', '1913 年 T 型车流水线，电气时代', 2),
(365, 183, '阿希实验研究的是？', 'single', '[{"label":"A","text":"从众行为"},{"label":"B","text":"服从权威"},{"label":"C","text":"偏见"},{"label":"D","text":"记忆"}]', 'A', '线段判断实验揭示从众', 1),
(366, 183, '米尔格拉姆实验发现多少人服从权威？', 'single', '[{"label":"A","text":"约65%"},{"label":"B","text":"约15%"},{"label":"C","text":"约95%"},{"label":"D","text":"约35%"}]', 'A', '约65%被试施加到最高电击', 2),
(367, 184, '把他人迟到归因于懒惰是？', 'single', '[{"label":"A","text":"基本归因错误"},{"label":"B","text":"自利偏差"},{"label":"C","text":"从众"},{"label":"D","text":"认知失调"}]', 'A', '忽视情境因素归因于性格', 1),
(368, 184, '减少群体偏见最有效的接触条件是？', 'single', '[{"label":"A","text":"平等地位共同目标"},{"label":"B","text":"强制接触"},{"label":"C","text":"保持距离"},{"label":"D","text":"互相竞争"}]', 'A', '接触假说: 平等+共同目标+制度支持', 2),
(369, 185, '群体讨论后立场更极端叫？', 'single', '[{"label":"A","text":"群体极化"},{"label":"B","text":"社会惰化"},{"label":"C","text":"去个性化"},{"label":"D","text":"群体思维"}]', 'A', '讨论放大初始倾向', 1),
(370, 185, '防止群体思维的方法是？', 'single', '[{"label":"A","text":"指定反对者角色"},{"label":"B","text":"强调团结"},{"label":"C","text":"快速表决"},{"label":"D","text":"领导先说观点"}]', 'A', '鼓励异议与独立判断', 2),
(371, 186, '斯滕伯格爱情三角不包括？', 'single', '[{"label":"A","text":"承诺"},{"label":"B","text":"亲密"},{"label":"C","text":"激情"},{"label":"D","text":"依赖"}]', 'D', '激情亲密承诺三成分', 1),
(372, 186, '安斯沃思陌生情境实验分出几种依恋？', 'single', '[{"label":"A","text":"3种"},{"label":"B","text":"2种"},{"label":"C","text":"4种"},{"label":"D","text":"5种"}]', 'A', '安全型回避型矛盾型(混乱型)', 2),
(373, 187, '西奥迪尼影响力原则不包括？', 'single', '[{"label":"A","text":"互惠"},{"label":"B","text":"权威"},{"label":"C","text":"稀缺"},{"label":"D","text":"模仿"}]', 'D', '六原则: 互惠承诺社会认同权威稀缺喜好', 1),
(374, 187, '先小请求再大请求是？', 'single', '[{"label":"A","text":"登门槛效应"},{"label":"B","text":"留面子效应"},{"label":"C","text":"锚定效应"},{"label":"D","text":"睡眠者效应"}]', 'A', '小请求答应后大请求更容易接受', 2),
(375, 188, '需求价格弹性大于1称为？', 'single', '[{"label":"A","text":"富有弹性"},{"label":"B","text":"缺乏弹性"},{"label":"C","text":"单位弹性"},{"label":"D","text":"零弹性"}]', 'A', '奢侈品多富有弹性', 1),
(376, 188, '最低限价通常导致？', 'single', '[{"label":"A","text":"过剩"},{"label":"B","text":"短缺"},{"label":"C","text":"均衡"},{"label":"D","text":"通胀"}]', 'A', '价格高于均衡产生过剩', 2),
(377, 189, '边际效用递减意味着？', 'single', '[{"label":"A","text":"越多越满足递减"},{"label":"B","text":"效用固定"},{"label":"C","text":"价格递减"},{"label":"D","text":"收入递减"}]', 'A', '每多消费一个效用增量减少', 1),
(378, 189, '损失厌恶指？', 'single', '[{"label":"A","text":"损失痛苦大于等额收益"},{"label":"B","text":"偏爱损失"},{"label":"C","text":"追求风险"},{"label":"D","text":"风险中性"}]', 'A', '行为经济学核心发现', 2),
(379, 190, '完全竞争市场长期利润？', 'single', '[{"label":"A","text":"为零"},{"label":"B","text":"很高"},{"label":"C","text":"为负"},{"label":"D","text":"不确定"}]', 'A', '自由进入挤出利润', 1),
(380, 190, '囚徒困境揭示的是？', 'single', '[{"label":"A","text":"个体理性集体非理性"},{"label":"B","text":"集体最优"},{"label":"C","text":"市场有效"},{"label":"D","text":"信息完全"}]', 'A', '纳什均衡未必帕累托最优', 2),
(381, 191, '矫正污染外部性的税收叫？', 'single', '[{"label":"A","text":"庇古税"},{"label":"B","text":"增值税"},{"label":"C","text":"消费税"},{"label":"D","text":"关税"}]', 'A', '庇古税使外部成本内部化', 1),
(382, 191, '公地悲剧的根本原因是？', 'single', '[{"label":"A","text":"产权不明"},{"label":"B","text":"需求过剩"},{"label":"C","text":"技术落后"},{"label":"D","text":"人口过多"}]', 'A', '公共资源无排他导致过度使用', 2),
(383, 192, '学历高收入高的经济学解释？', 'single', '[{"label":"A","text":"人力资本"},{"label":"B","text":"补偿差异"},{"label":"C","text":"天赋租金"},{"label":"D","text":"市场垄断"}]', 'A', '教育投资提高生产率', 1),
(384, 192, '经济衰退造成的失业是？', 'single', '[{"label":"A","text":"周期性失业"},{"label":"B","text":"摩擦性失业"},{"label":"C","text":"结构性失业"},{"label":"D","text":"季节性失业"}]', 'A', '总需求不足导致的失业', 2),
(385, 193, 'GDP 支出法公式是？', 'single', '[{"label":"A","text":"Y=C+I+G+NX"},{"label":"B","text":"Y=C+S+T"},{"label":"C","text":"Y=C+I+T"},{"label":"D","text":"Y=G+I+X"}]', 'A', '消费投资政府购买净出口', 1),
(386, 193, '名义GDP与实际GDP的区别？', 'single', '[{"label":"A","text":"价格是否调整"},{"label":"B","text":"时间范围"},{"label":"C","text":"统计口径"},{"label":"D","text":"地区范围"}]', 'A', '实际GDP用基期价格', 2),
(387, 194, 'CPI 衡量的是？', 'single', '[{"label":"A","text":"消费品价格"},{"label":"B","text":"股票价格"},{"label":"C","text":"房价"},{"label":"D","text":"工资水平"}]', 'A', '消费者价格指数', 1),
(388, 194, '费雪方程是？', 'single', '[{"label":"A","text":"MV=PY"},{"label":"B","text":"M=P/Y"},{"label":"C","text":"V=MY"},{"label":"D","text":"P=MV/Y²"}]', 'A', '货币量×流通速度=价格×产出', 2),
(389, 195, '央行买卖国债调节流动性是？', 'single', '[{"label":"A","text":"公开市场操作"},{"label":"B","text":"降准"},{"label":"C","text":"加息"},{"label":"D","text":"窗口指导"}]', 'A', 'OMO 日常微调', 1),
(390, 195, '存款准备金率上升会？', 'single', '[{"label":"A","text":"减少货币供给"},{"label":"B","text":"增加货币供给"},{"label":"C","text":"不影响"},{"label":"D","text":"降低利率"}]', 'A', '准备金率高银行放贷少', 2),
(391, 196, '政府购买乘数是？', 'single', '[{"label":"A","text":"1/(1-MPC)"},{"label":"B","text":"MPC/(1-MPC)"},{"label":"C","text":"1/MPC"},{"label":"D","text":"1+MPC"}]', 'A', '边际消费倾向决定乘数', 1),
(392, 196, '政府借债推高利率挤出私人投资是？', 'single', '[{"label":"A","text":"挤出效应"},{"label":"B","text":"乘数效应"},{"label":"C","text":"财富效应"},{"label":"D","text":"棘轮效应"}]', 'A', '挤出效应抵消扩张', 2),
(393, 197, '长期经济增长主要靠？', 'single', '[{"label":"A","text":"技术进步"},{"label":"B","text":"人口增长"},{"label":"C","text":"货币发行"},{"label":"D","text":"库存增加"}]', 'A', '索洛模型: 长期增长靠技术', 1),
(394, 197, 'PMI 荣枯线是？', 'single', '[{"label":"A","text":"50"},{"label":"B","text":"100"},{"label":"C","text":"30"},{"label":"D","text":"80"}]', 'A', '高于50扩张低于50收缩', 2),
(395, 198, '笛卡尔我思故我在属于？', 'single', '[{"label":"A","text":"理性主义"},{"label":"B","text":"经验主义"},{"label":"C","text":"功利主义"},{"label":"D","text":"虚无主义"}]', 'A', '从怀疑出发理性奠基', 1),
(396, 198, '意识的困难问题研究的是？', 'single', '[{"label":"A","text":"主观体验如何产生"},{"label":"B","text":"大脑结构"},{"label":"C","text":"行为模式"},{"label":"D","text":"语言能力"}]', 'A', '感质与主观经验之难', 2),
(397, 199, '归纳问题的提出者是？', 'single', '[{"label":"A","text":"休谟"},{"label":"B","text":"笛卡尔"},{"label":"C","text":"康德"},{"label":"D","text":"亚里士多德"}]', 'A', '休谟怀疑归纳的必然性', 1),
(398, 199, '康德认为知识如何可能？', 'single', '[{"label":"A","text":"先天形式+经验材料"},{"label":"B","text":"全靠经验"},{"label":"C","text":"全靠理性"},{"label":"D","text":"来自直觉"}]', 'A', '先验综合判断', 2),
(399, 200, '功利主义判断标准是？', 'single', '[{"label":"A","text":"最大幸福"},{"label":"B","text":"普遍法则"},{"label":"C","text":"中道"},{"label":"D","text":"天赋权利"}]', 'A', '边沁密尔的后果主义', 1),
(400, 200, '康德认为人应被当作？', 'single', '[{"label":"A","text":"目的本身"},{"label":"B","text":"工具"},{"label":"C","text":"手段"},{"label":"D","text":"资源"}]', 'A', '人是目的不是手段', 2),
(401, 201, '攻击人而非论证是？', 'single', '[{"label":"A","text":"人身攻击谬误"},{"label":"B","text":"稻草人"},{"label":"C","text":"滑坡谬误"},{"label":"D","text":"诉诸权威"}]', 'A', 'ad hominem', 1),
(402, 201, '科学理论必须可被？', 'single', '[{"label":"A","text":"证伪"},{"label":"B","text":"证实"},{"label":"C","text":"宣传"},{"label":"D","text":"投票"}]', 'A', '波普尔证伪主义', 2),
(403, 202, '洞穴比喻出自？', 'single', '[{"label":"A","text":"柏拉图"},{"label":"B","text":"亚里士多德"},{"label":"C","text":"康德"},{"label":"D","text":"尼采"}]', 'A', '理念论的启蒙比喻', 1),
(404, 202, '存在先于本质是谁的口号？', 'single', '[{"label":"A","text":"萨特"},{"label":"B","text":"笛卡尔"},{"label":"C","text":"休谟"},{"label":"D","text":"孔子"}]', 'A', '存在主义核心命题', 2),
(405, 203, '红楼梦的作者是？', 'single', '[{"label":"A","text":"曹雪芹"},{"label":"B","text":"罗贯中"},{"label":"C","text":"施耐庵"},{"label":"D","text":"吴承恩"}]', 'A', '红楼梦曹雪芹著', 1),
(406, 203, '三国演义中智慧化身是？', 'single', '[{"label":"A","text":"诸葛亮"},{"label":"B","text":"关羽"},{"label":"C","text":"曹操"},{"label":"D","text":"张飞"}]', 'A', '空城计草船借箭', 2),
(407, 204, '第一篇现代白话小说是？', 'single', '[{"label":"A","text":"狂人日记"},{"label":"B","text":"阿Q正传"},{"label":"C","text":"呐喊"},{"label":"D","text":"彷徨"}]', 'A', '鲁迅1918年狂人日记', 1),
(408, 204, '莫言获诺贝尔文学奖的年份？', 'single', '[{"label":"A","text":"2012"},{"label":"B","text":"2008"},{"label":"C","text":"2015"},{"label":"D","text":"2019"}]', 'A', '中国籍首位诺贝尔文学奖', 2),
(409, 205, '变形记的作者是？', 'single', '[{"label":"A","text":"卡夫卡"},{"label":"B","text":"托尔斯泰"},{"label":"C","text":"海明威"},{"label":"D","text":"马尔克斯"}]', 'A', '卡夫卡奥匈作家', 1),
(410, 205, '百年孤独属于什么流派？', 'single', '[{"label":"A","text":"魔幻现实主义"},{"label":"B","text":"批判现实主义"},{"label":"C","text":"浪漫主义"},{"label":"D","text":"意识流"}]', 'A', '马尔克斯代表作', 2),
(411, 206, '举头望明月寄托的是？', 'single', '[{"label":"A","text":"思乡之情"},{"label":"B","text":"壮志豪情"},{"label":"C","text":"离愁别绪"},{"label":"D","text":"田园之乐"}]', 'A', '月亮意象=乡愁', 1),
(412, 206, '诗经风雅颂中风指？', 'single', '[{"label":"A","text":"民间歌谣"},{"label":"B","text":"宫廷乐歌"},{"label":"C","text":"祭祀乐歌"},{"label":"D","text":"军队歌曲"}]', 'A', '风是各地民歌', 2),
(413, 207, '小说创作的核心冲突是？', 'single', '[{"label":"A","text":"人与他人社会自我"},{"label":"B","text":"人与金钱"},{"label":"C","text":"人与自然"},{"label":"D","text":"人与时间"}]', 'A', '三类冲突推动情节', 1),
(414, 207, 'show don''t tell 指？', 'single', '[{"label":"A","text":"用行动展示性格"},{"label":"B","text":"直接说明"},{"label":"C","text":"旁白解说"},{"label":"D","text":"心理独白"}]', 'A', '动作细节代替概括描述', 2),
(415, 208, '贝多芬第九交响曲结尾是？', 'single', '[{"label":"A","text":"欢乐颂"},{"label":"B","text":"命运"},{"label":"C","text":"英雄"},{"label":"D","text":"田园"}]', 'A', '席勒诗作合唱', 1),
(416, 208, '管弦乐队中不属于弦乐组的是？', 'single', '[{"label":"A","text":"长笛"},{"label":"B","text":"小提琴"},{"label":"C","text":"大提琴"},{"label":"D","text":"低音提琴"}]', 'A', '长笛属木管组', 2),
(417, 209, '披头士属于哪个流派？', 'single', '[{"label":"A","text":"摇滚"},{"label":"B","text":"爵士"},{"label":"C","text":"嘻哈"},{"label":"D","text":"电子"}]', 'A', '英国摇滚乐队', 1),
(418, 209, '初音未来是什么类型的歌手？', 'single', '[{"label":"A","text":"虚拟歌手"},{"label":"B","text":"童声歌手"},{"label":"C","text":"美声歌手"},{"label":"D","text":"民谣歌手"}]', 'A', 'VOCALOID 语音合成', 2),
(419, 210, '星球大战黑武士的专属旋律是？', 'single', '[{"label":"A","text":"主导动机"},{"label":"B","text":"副歌"},{"label":"C","text":"前奏"},{"label":"D","text":"间奏"}]', 'A', '瓦格纳创立的动机手法', 1),
(420, 210, '宫崎骏电影的御用配乐师是？', 'single', '[{"label":"A","text":"久石让"},{"label":"B","text":"坂本龙一"},{"label":"C","text":"喜多郎"},{"label":"D","text":"梅林茂"}]', 'A', '千与千寻等配乐', 2),
(421, 211, '流行音乐最常见的和弦进行？', 'single', '[{"label":"A","text":"I-V-vi-IV"},{"label":"B","text":"ii-V-I"},{"label":"C","text":"V-vi-IV"},{"label":"D","text":"I-vi-V"}]', 'A', '四和弦循环', 1),
(422, 211, 'DAW 指的是？', 'single', '[{"label":"A","text":"数字音频工作站"},{"label":"B","text":"合成器"},{"label":"C","text":"混音台"},{"label":"D","text":"效果器"}]', 'A', 'FL Studio/Cubase等', 2),
(423, 212, '流媒体平台单次播放分成约？', 'single', '[{"label":"A","text":"0.003-0.01美元"},{"label":"B","text":"1美元"},{"label":"C","text":"0.5美元"},{"label":"D","text":"10美分"}]', 'A', '艺术家主要靠巡演', 1),
(424, 212, 'AI 生成音乐带来的核心问题是？', 'single', '[{"label":"A","text":"版权与肖像权"},{"label":"B","text":"音质"},{"label":"C","text":"设备"},{"label":"D","text":"网络"}]', 'A', '训练数据与声音权', 2),
(425, 213, '北京位于哪个时区？', 'single', '[{"label":"A","text":"东八区"},{"label":"B","text":"东九区"},{"label":"C","text":"东七区"},{"label":"D","text":"零时区"}]', 'A', 'UTC+8', 1),
(426, 213, '北半球地转偏向力偏转方向？', 'single', '[{"label":"A","text":"向右偏"},{"label":"B","text":"向左偏"},{"label":"C","text":"不偏转"},{"label":"D","text":"向上偏"}]', 'A', '影响河流台风', 2),
(427, 214, '地中海气候的特征是？', 'single', '[{"label":"A","text":"夏干冬雨"},{"label":"B","text":"全年多雨"},{"label":"C","text":"全年干旱"},{"label":"D","text":"冬干夏雨"}]', 'A', '30-40度大陆西岸', 1),
(428, 214, '秦岭-淮河线大致是？', 'single', '[{"label":"A","text":"800mm降水线"},{"label":"B","text":"400mm降水线"},{"label":"C","text":"200mm降水线"},{"label":"D","text":"1000mm降水线"}]', 'A', '亚热带暖温带分界', 2),
(429, 215, '桂林山水的喀斯特地貌成因是？', 'single', '[{"label":"A","text":"流水溶蚀"},{"label":"B","text":"风力侵蚀"},{"label":"C","text":"冰川作用"},{"label":"D","text":"海浪侵蚀"}]', 'A', '石灰岩被水溶蚀', 1),
(430, 215, '喜马拉雅山的成因是？', 'single', '[{"label":"A","text":"板块碰撞"},{"label":"B","text":"火山喷发"},{"label":"C","text":"风力堆积"},{"label":"D","text":"冰川搬运"}]', 'A', '印度板块与亚欧板块碰撞', 2),
(431, 216, '寒暖流交汇处易形成？', 'single', '[{"label":"A","text":"渔场"},{"label":"B","text":"沙漠"},{"label":"C","text":"绿洲"},{"label":"D","text":"冰原"}]', 'A', '养分上泛浮游生物多', 1),
(432, 216, '专属经济区是领海基线外多少海里？', 'single', '[{"label":"A","text":"200海里"},{"label":"B","text":"12海里"},{"label":"C","text":"50海里"},{"label":"D","text":"100海里"}]', 'A', '领海12海里专属经济区200', 2),
(433, 217, '世界人口最稠密的大洲？', 'single', '[{"label":"A","text":"亚洲"},{"label":"B","text":"欧洲"},{"label":"C","text":"非洲"},{"label":"D","text":"大洋洲"}]', 'A', '东亚南亚人口密集', 1),
(434, 217, '微笑曲线利润最高的是？', 'single', '[{"label":"A","text":"研发与品牌"},{"label":"B","text":"组装制造"},{"label":"C","text":"物流运输"},{"label":"D","text":"原料供应"}]', 'A', '价值链两端利润高', 2),
(435, 218, '最大心率粗略估算公式是？', 'single', '[{"label":"A","text":"220-年龄"},{"label":"B","text":"180-年龄"},{"label":"C","text":"200-年龄"},{"label":"D","text":"250-年龄"}]', 'A', '基础公式', 1),
(436, 218, '磷酸原系统主要供能时间？', 'single', '[{"label":"A","text":"0-10秒"},{"label":"B","text":"1-2分钟"},{"label":"C","text">2分钟"},{"label":"D","text":"10-20秒"}]', 'A', '短跑冲刺用磷酸原', 2),
(437, 219, '增肌训练的推荐次数范围？', 'single', '[{"label":"A","text":"8-12次"},{"label":"B","text":"1-5次"},{"label":"C","text":"15-20次"},{"label":"D","text":"20+次"}]', 'A', '增肌中等次数', 1),
(438, 219, '深蹲动作的关键要点？', 'single', '[{"label":"A","text":"膝盖朝脚尖"},{"label":"B","text":"膝盖内扣"},{"label":"C","text":"弯腰驼背"},{"label":"D","text":"脚尖并拢"}]', 'A', '下肢稳定发力', 2),
(439, 220, 'HIIT 训练的特点是？', 'single', '[{"label":"A","text":"高低强度交替"},{"label":"B","text":"匀速慢跑"},{"label":"C","text":"长时间静止"},{"label":"D","text":"低强度持续"}]', 'A', '高效燃脂', 1),
(440, 220, '跑者每周跑量增幅建议？', 'single', '[{"label":"A","text":"不超过10%"},{"label":"B","text":"30%以上"},{"label":"C","text":"50%"},{"label":"D","text">翻倍"}]', 'A', '预防过劳损伤', 2),
(441, 221, '增肌训练蛋白质推荐摄入量？', 'single', '[{"label":"A","text":"1.6-2.2g/kg"},{"label":"B","text":"0.3g/kg"},{"label":"C","text":"5g/kg"},{"label":"D","text":"0.5g/kg"}]', 'A', '每公斤体重', 1),
(442, 221, '有研究支持的提升爆发力补剂？', 'single', '[{"label":"A","text":"肌酸"},{"label":"B","text":"BCAA"},{"label":"C","text":"左旋肉碱"},{"label":"D","text":"谷氨酰胺"}]', 'A', '肌酸证据充分', 2),
(443, 222, '急性扭伤处理首选？', 'single', '[{"label":"A","text":"冰敷"},{"label":"B","text":"热敷"},{"label":"C","text":"按摩"},{"label":"D","text":"跑步"}]', 'A', 'RICE原则', 1),
(444, 222, '最好的恢复手段是？', 'single', '[{"label":"A","text":"充足睡眠"},{"label":"B","text":"连续训练"},{"label":"C","text":"空腹"},{"label":"D","text":"熬夜"}]', 'A', '生长激素恢复', 2),
(445, 223, '中国的根本政治制度是？', 'single', '[{"label":"A","text":"人民代表大会制度"},{"label":"B","text":"多党制"},{"label":"C","text":"君主立宪"},{"label":"D","text":"三权分立"}]', 'A', '宪法规定的根本政治制度', 1),
(446, 223, '我国现行宪法通过年份？', 'single', '[{"label":"A","text":"1982"},{"label":"B","text":"1954"},{"label":"C","text":"1975"},{"label":"D","text":"1999"}]', 'A', '1982年宪法经五次修正', 2),
(447, 224, '民法典施行年份？', 'single', '[{"label":"A","text":"2021"},{"label":"B","text":"2020"},{"label":"C","text":"2019"},{"label":"D","text":"2022"}]', 'A', '2021年1月1日施行', 1),
(448, 224, '民事一般诉讼时效是？', 'single', '[{"label":"A","text":"3年"},{"label":"B","text":"1年"},{"label":"C","text":"5年"},{"label":"D","text":"10年"}]', 'A', '民法典规定3年', 2),
(449, 225, '14-16周岁对哪些犯罪负责？', 'single', '[{"label":"A","text":"八类重罪"},{"label":"B","text":"所有犯罪"},{"label":"C","text":"过失犯罪"},{"label":"D","text":"经济犯罪"}]', 'A', '故意杀人抢劫强奸等', 1),
(450, 225, '醉驾入刑涉及的罪名是？', 'single', '[{"label":"A","text":"危险驾驶罪"},{"label":"B","text":"交通肇事罪"},{"label":"C","text":"故意伤害罪"},{"label":"D","text":"过失致人死亡"}]', 'A', '2011年醉驾入刑', 2),
(451, 226, '网购七日无理由退货的例外是？', 'single', '[{"label":"A","text":"定制商品"},{"label":"B","text":"普通服装"},{"label":"C","text":"标准数码"},{"label":"D","text":"家居用品"}]', 'A', '定做鲜活音像等例外', 1),
(452, 226, '经营者欺诈的三倍赔偿下限是？', 'single', '[{"label":"A","text":"500元"},{"label":"B","text":"100元"},{"label":"C","text":"1000元"},{"label":"D","text":"50元"}]', 'A', '不足500按500', 2),
(453, 227, '试用期工资不低于转正工资的？', 'single', '[{"label":"A","text":"80%"},{"label":"B","text":"50%"},{"label":"C","text":"60%"},{"label":"D","text":"90%"}]', 'A', '且不低于最低工资', 1),
(454, 227, '劳动仲裁时效是？', 'single', '[{"label":"A","text":"1年"},{"label":"B","text":"3年"},{"label":"C","text":"6个月"},{"label":"D","text":"2年"}]', 'A', '自知道权利被侵害起算', 2),
(455, 228, '联合国安理会常任理事国有？', 'single', '[{"label":"A","text":"5个"},{"label":"B","text":"10个"},{"label":"C","text":"15个"},{"label":"D","text":"3个"}]', 'A', '中美俄英法', 1),
(456, 228, '现实主义国际关系理论强调？', 'single', '[{"label":"A","text":"权力争夺"},{"label":"B","text":"制度合作"},{"label":"C","text":"观念认同"},{"label":"D","text":"文化交流"}]', 'A', '无政府状态下自保', 2),
(457, 229, '中美建交基础是？', 'single', '[{"label":"A","text":"三个联合公报"},{"label":"B","text":"联合国决议"},{"label":"C","text":"贸易协定"},{"label":"D","text":"文化协议"}]', 'A', '上海公报建交公报八一七公报', 1),
(458, 229, '修昔底德陷阱描述的是？', 'single', '[{"label":"A","text":"守成与崛起国冲突"},{"label":"B","text":"经济危机"},{"label":"C","text":"文明冲突"},{"label":"D","text":"气候战争"}]', 'A', '雅典vs斯巴达比喻', 2),
(459, 230, '世界石油运输的咽喉要道是？', 'single', '[{"label":"A","text":"霍尔木兹海峡"},{"label":"B","text":"直布罗陀"},{"label":"C","text":"白令海峡"},{"label":"D","text":"德雷克海峡"}]', 'A', '世界约1/5石油过境', 1),
(460, 230, '中国稀土出口管制的动因是？', 'single', '[{"label":"A","text":"维护战略资源安全"},{"label":"B","text":"赚取外汇"},{"label":"C","text":"环境破坏"},{"label":"D","text":"产能过剩"}]', 'A', '2023年出口管制', 2),
(461, 231, '巴黎协定的目标是？', 'single', '[{"label":"A","text":"温控1.5-2℃"},{"label":"B","text":"减排50%"},{"label":"C","text":"终止化石能源"},{"label":"D","text":"碳交易全球化"}]', 'A', '全球温控目标', 1),
(462, 231, '中国双碳目标中碳中和年份是？', 'single', '[{"label":"A","text":"2060"},{"label":"B","text":"2050"},{"label":"C","text":"2030"},{"label":"D","text":"2070"}]', 'A', '2030碳达峰2060碳中和', 2),
(463, 232, '一带一路倡议提出的年份？', 'single', '[{"label":"A","text":"2013"},{"label":"B","text":"2010"},{"label":"C","text":"2015"},{"label":"D","text":"2018"}]', 'A', '习近平主席提出', 1),
(464, 232, '和平共处五项原则提出年份？', 'single', '[{"label":"A","text":"1954"},{"label":"B","text":"1949"},{"label":"C","text":"1971"},{"label":"D","text":"1960"}]', 'A', '与印度缅甸共同倡导', 2),
(465, 233, '表示动作场所的助词是？', 'single', '[{"label":"A","text":"で"},{"label":"B","text":"に"},{"label":"C","text":"を"},{"label":"D","text":"と"}]', 'A', 'で表动作发生场所', 1),
(466, 233, '表示存在地点的助词是？', 'single', '[{"label":"A","text":"に"},{"label":"B","text":"で"},{"label":"C","text":"を"},{"label":"D","text":"も"}]', 'A', '教室にいます', 2),
(467, 234, '食べる属于哪类动词？', 'single', '[{"label":"A","text":"二类动词"},{"label":"B","text":"一类动词"},{"label":"C","text":"三类动词"},{"label":"D","text":"四类动词"}]', 'A', 'え段+る', 1),
(468, 234, '書く的て形是？', 'single', '[{"label":"A","text":"書いて"},{"label":"B","text":"書って"},{"label":"C","text":"書いてる"},{"label":"D","text":"書くて"}]', 'A', 'く→いて', 2),
(469, 235, 'いただく属于？', 'single', '[{"label":"A","text":"谦让语"},{"label":"B","text":"尊敬语"},{"label":"C","text":"礼貌语"},{"label":"D","text":"简体"}]', 'A', '压低自己动作', 1),
(470, 235, '食べる的尊敬语是？', 'single', '[{"label":"A","text":"召し上がる"},{"label":"B","text":"いただく"},{"label":"C","text":"食べるです"},{"label":"D","text":"食べられる"}]', 'A', '尊敬对方动作', 2),
(471, 236, '表示客观原因的接续助词？', 'single', '[{"label":"A","text":"ので"},{"label":"B","text":"から"},{"label":"C","text":"けど"},{"label":"D","text":"ば"}]', 'A', 'ので客观理由', 1),
(472, 236, '动词名词化的形式是？', 'single', '[{"label":"A","text":"こと/の"},{"label":"B","text":"に/で"},{"label":"C","text":"は/が"},{"label":"D","text":"も/だけ"}]', 'A', '行くことが夢です', 2),
(473, 237, 'すみません没有哪个含义？', 'single', '[{"label":"A","text":"再见"},{"label":"B","text":"道歉"},{"label":"C","text":"感谢"},{"label":"D","text":"搭话"}]', 'A', 'すみません三义', 1),
(474, 237, '开饭前的固定用语是？', 'single', '[{"label":"A","text":"いただきます"},{"label":"B","text":"ごちそうさま"},{"label":"C","text":"おやすみなさい"},{"label":"D","text":"いってきます"}]', 'A', '感恩食物的开场', 2);