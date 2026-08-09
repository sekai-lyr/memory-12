-- =============================================
-- 知识库大扩充 Part5: 英语
-- courses 65-70, lessons 238-261, quiz 475-522
-- =============================================

INSERT IGNORE INTO sekai_learning_courses (id, subject_id, name, description, difficulty, estimated_hours, lesson_count, sort_order) VALUES
(65, 15, '英语语法基础', '时态、从句与虚拟语气', 'beginner', 3, 4, 1),
(66, 15, '英语词汇与记忆', '高频词、词根词缀与记忆法', 'beginner', 3, 4, 2),
(67, 15, '英语阅读与写作', '长难句、段落结构与写作模板', 'intermediate', 4, 4, 3),
(68, 15, '英语口语与听力', '连读弱读、情景对话与发音', 'intermediate', 4, 4, 4),
(69, 15, '英语考试技巧', '四六级雅思托福备考策略', 'advanced', 4, 4, 5),
(70, 15, '商务英语', '邮件、会议与商务谈判', 'intermediate', 4, 4, 6);

INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(238, 65, '时态体系',
'英语时态=时间×状态。三种时间（现在过去将来）×四种状态（一般进行完成完成进行）=16 种时态。核心是"时间轴+动作状态"思维。

<b>核心时态对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">时态</th><th style="border:1px solid #999;padding:6px">结构</th><th style="border:1px solid #999;padding:6px">用法</th><th style="border:1px solid #999;padding:6px">标志词</th></tr>
<tr><td style="border:1px solid #999;padding:6px">一般现在</td><td style="border:1px solid #999;padding:6px">动词原形/三单</td><td style="border:1px solid #999;padding:6px">习惯事实</td><td style="border:1px solid #999;padding:6px">always, usually</td></tr>
<tr><td style="border:1px solid #999;padding:6px">一般过去</td><td style="border:1px solid #999;padding:6px">动词过去式</td><td style="border:1px solid #999;padding:6px">过去动作</td><td style="border:1px solid #999;padding:6px">yesterday, ago</td></tr>
<tr><td style="border:1px solid #999;padding:6px">现在完成</td><td style="border:1px solid #999;padding:6px">have+过去分词</td><td style="border:1px solid #999;padding:6px">影响持续</td><td style="border:1px solid #999;padding:6px">already, since</td></tr>
<tr><td style="border:1px solid #999;padding:6px">过去完成</td><td style="border:1px solid #999;padding:6px">had+过去分词</td><td style="border:1px solid #999;padding:6px">过去的过去</td><td style="border:1px solid #999;padding:6px">by the time</td></tr>
<tr><td style="border:1px solid #999;padding:6px">现在进行</td><td style="border:1px solid #999;padding:6px">be+doing</td><td style="border:1px solid #999;padding:6px">正在进行</td><td style="border:1px solid #999;padding:6px">now, at present</td></tr>
<tr><td style="border:1px solid #999;padding:6px">将来时</td><td style="border:1px solid #999;padding:6px">will/be going to</td><td style="border:1px solid #999;padding:6px">将来计划</td><td style="border:1px solid #999;padding:6px">tomorrow, soon</td></tr>
</table>

一般过去 vs 现在完成：过去时强调"过去时间点发生"，与现在无关（I saw the movie yesterday）；完成时强调"对现在的影响"（I have seen the movie，看过所以知道内容）。

完成时两大用法：持续性（since+点/for+段）与影响性（just/already/yet）。标志词判断法：看到 since/for 用完成时。

时态一致原则：主句过去时，从句相应过去（He said he was tired）。直接引语转间接引语要"时态后移"（一般现在→一般过去）。

16 种时态不都要背：先掌握 6 种核心（一般现在/过去/将来、现在完成、过去完成、现在进行），其余自然扩展。',
'掌握核心时态体系',
'["时态=时间×状态","一般过去vs现在完成","since/for用完成时","时态后移规则"]',
'beginner', 12, 1),
(239, 65, '名词从句',
'名词从句在整个句子中当名词用：主语、宾语、表语、同位语。引导词三类：that（陈述）、whether/if（疑问选择）、wh-词（特殊疑问）。

<b>名词从句类型表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类型</th><th style="border:1px solid #999;padding:6px">引导词</th><th style="border:1px solid #999;padding:6px">例句</th></tr>
<tr><td style="border:1px solid #999;padding:6px">宾语从句</td><td style="border:1px solid #999;padding:6px">that/whether/wh</td><td style="border:1px solid #999;padding:6px">I know that he is right</td></tr>
<tr><td style="border:1px solid #999;padding:6px">主语从句</td><td style="border:1px solid #999;padding:6px">that/whether/wh</td><td style="border:1px solid #999;padding:6px">What he said is true</td></tr>
<tr><td style="border:1px solid #999;padding:6px">表语从句</td><td style="border:1px solid #999;padding:6px">that/wh</td><td style="border:1px solid #999;padding:6px">The reason is that...</td></tr>
<tr><td style="border:1px solid #999;padding:6px">同位语从句</td><td style="border:1px solid #999;padding:6px">that</td><td style="border:1px solid #999;padding:6px">the news that he won</td></tr>
</table>

宾语从句三要点：引导词（陈述用 that 可省）、语序（必须陈述语序 What time it is 而不是 What time is it）、时态（主句过去从句过去）。

whether vs if：介词后只用 whether（It depends on whether）、句首只用 whether、whether or not 固定搭配。

形式主语 it：It is important that...（主语从句后置）。形式宾语：I find it necessary that...。

同位语 vs 定语从句区分：同位语从句 that 不作成分（the fact that he came），定语从句 that 作成分（the book that I read）。',
'掌握名词从句',
'["三类引导词","宾语从句陈述语序","whether与if区别","形式主语it"]',
'intermediate', 12, 2),
(240, 65, '定语从句',
'定语从句修饰名词，被修饰的词叫先行词。关系词：关系代词（who/whom/which/that/whose）与关系副词（when/where/why）。

<b>关系词选择表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">先行词</th><th style="border:1px solid #999;padding:6px">作主语</th><th style="border:1px solid #999;padding:6px">作宾语</th><th style="border:1px solid #999;padding:6px">作状语</th></tr>
<tr><td style="border:1px solid #999;padding:6px">人</td><td style="border:1px solid #999;padding:6px">who/that</td><td style="border:1px solid #999;padding:6px">whom/that</td><td style="border:1px solid #999;padding:6px">-</td></tr>
<tr><td style="border:1px solid #999;padding:6px">物</td><td style="border:1px solid #999;padding:6px">which/that</td><td style="border:1px solid #999;padding:6px">which/that</td><td style="border:1px solid #999;padding:6px">-</td></tr>
<tr><td style="border:1px solid #999;padding:6px">时间</td><td style="border:1px solid #999;padding:6px">-</td><td style="border:1px solid #999;padding:6px">-</td><td style="border:1px solid #999;padding:6px">when</td></tr>
<tr><td style="border:1px solid #999;padding:6px">地点</td><td style="border:1px solid #999;padding:6px">-</td><td style="border:1px solid #999;padding:6px">-</td><td style="border:1px solid #999;padding:6px">where</td></tr>
</table>

选择关系词的万能法：把先行词放回从句，看它在从句中做什么成分。作主语宾语用关系代词，作时间地点原因状语用关系副词。

只用 that 的情况：先行词有序数词最高级、先行词有 all/any/no 等不定代词、先行词含人+物。只用 which 的情况：介词提前（in which）、非限制性从句。

非限制性定语从句：逗号隔开，that 不能用于非限制性，which/who 指代前面整句（He failed, which surprised us）。

whose 表示所属：the boy whose father is a doctor。介词+which/whom：the house in which he lives（=where）。',
'掌握定语从句关系词',
'["关系词看成分","只用that五种情形","非限制性从句","介词+which"]',
'intermediate', 12, 3),
(241, 65, '虚拟语气',
'虚拟语气表达非真实：与事实相反、愿望、建议。三种时间反事实各有固定结构。

<b>虚拟语气结构表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">时间</th><th style="border:1px solid #999;padding:6px">if从句</th><th style="border:1px solid #999;padding:6px">主句</th><th style="border:1px solid #999;padding:6px">例句</th></tr>
<tr><td style="border:1px solid #999;padding:6px">与现在相反</td><td style="border:1px solid #999;padding:6px">过去式(be用were)</td><td style="border:1px solid #999;padding:6px">would+do</td><td style="border:1px solid #999;padding:6px">If I were you, I would go</td></tr>
<tr><td style="border:1px solid #999;padding:6px">与过去相反</td><td style="border:1px solid #999;padding:6px">had done</td><td style="border:1px solid #999;padding:6px">would+have done</td><td style="border:1px solid #999;padding:6px">If I had studied, I would have passed</td></tr>
<tr><td style="border:1px solid #999;padding:6px">与将来相反</td><td style="border:1px solid #999;padding:6px">were to/should do</td><td style="border:1px solid #999;padding:6px">would+do</td><td style="border:1px solid #999;padding:6px">If it should rain, we would stay</td></tr>
</table>

if 省略倒装：虚拟条件句有 were/had/should 时可把 if 省略提前（Were I you...，Had I known...）。

wish 用法：与现在相反过去式（I wish I were taller）、与过去相反过去完成（I wish I had known）、与将来相反 would/could（I wish you would come）。

建议类动词后用 should+动词原形（should 可省）：suggest/advise/insist/require 等。It is important/necessary that sb (should) do。

含蓄虚拟：without/but for（要不是）+would have done。as if 与事实相反用虚拟。混合条件句：从句过去+主句现在（If I had studied, I would be a doctor now）。',
'掌握虚拟语气',
'["三时间反事实结构","if省略倒装","wish三类用法","建议动词should原形"]',
'advanced', 12, 4),

(242, 66, '词根词缀记忆法',
'英语 60% 以上单词由词根词缀构成。词根表意、前缀变方向、后缀定词性。掌握 100 个词根可推断上万个单词。

<b>高频词根词缀表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">词根/缀</th><th style="border:1px solid #999;padding:6px">含义</th><th style="border:1px solid #999;padding:6px">例词</th></tr>
<tr><td style="border:1px solid #999;padding:6px">pre-</td><td style="border:1px solid #999;padding:6px">在之前</td><td style="border:1px solid #999;padding:6px">preview 预习</td></tr>
<tr><td style="border:1px solid #999;padding:6px">re-</td><td style="border:1px solid #999;padding:6px">再/回</td><td style="border:1px solid #999;padding:6px">review 复习</td></tr>
<tr><td style="border:1px solid #999;padding:6px">in-/im-/un-</td><td style="border:1px solid #999;padding:6px">否定</td><td style="border:1px solid #999;padding:6px">impossible 不可能</td></tr>
<tr><td style="border:1px solid #999;padding:6px">-tion/-sion</td><td style="border:1px solid #999;padding:6px">名词后缀</td><td style="border:1px solid #999;padding:6px">education 教育</td></tr>
<tr><td style="border:1px solid #999;padding:6px">-ful/-less</td><td style="border:1px solid #999;padding:6px">形容词后缀</td><td style="border:1px solid #999;padding:6px">hopeful/hopeless</td></tr>
<tr><td style="border:1px solid #999;padding:6px">-ly</td><td style="border:1px solid #999;padding:6px">副词后缀</td><td style="border:1px solid #999;padding:6px">quickly 快速地</td></tr>
<tr><td style="border:1px solid #999;padding:6px">spect</td><td style="border:1px solid #999;padding:6px">看</td><td style="border:1px solid #999;padding:6px">inspect 检查</td></tr>
<tr><td style="border:1px solid #999;padding:6px">port</td><td style="border:1px solid #999;padding:6px">搬运</td><td style="border:1px solid #999;padding:6px">export 出口</td></tr>
</table>

词性转换规律：动词+tion 变名词（create→creation）、+ive 变形容词（create→creative）、名词+ize 变动词（memory→memorize）。

同义替换思维：写作时 avoid 可用 steer clear of；important 可用 crucial/vital/significant——用高级词提升书面表达。

记忆时间轴：学习后 5 分钟、30 分钟、12 小时、1 天、2 天、4 天、7 天、15 天复习——艾宾浩斯遗忘曲线复习节点。

场景记忆法：把单词放进句子里记（例句记忆优于孤立记忆）。间隔重复软件（Anki）是词汇量的利器。',
'掌握词根词缀法',
'["词根表意前缀变方向","后缀定词性","艾宾浩斯复习节点","例句场景记忆"]',
'beginner', 12, 1),
(243, 66, '高频动词短语',
'动词短语=动词+介词/副词，含义常与动词原意不同。take/come/get/look 等核心动词衍生大量短语。

<b>核心动词短语表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">动词</th><th style="border:1px solid #999;padding:6px">短语</th><th style="border:1px solid #999;padding:6px">含义</th></tr>
<tr><td style="border:1px solid #999;padding:6px">take</td><td style="border:1px solid #999;padding:6px">take off</td><td style="border:1px solid #999;padding:6px">起飞/脱掉</td></tr>
<tr><td style="border:1px solid #999;padding:6px">take</td><td style="border:1px solid #999;padding:6px">take care of</td><td style="border:1px solid #999;padding:6px">照顾</td></tr>
<tr><td style="border:1px solid #999;padding:6px">look</td><td style="border:1px solid #999;padding:6px">look after</td><td style="border:1px solid #999;padding:6px">照看</td></tr>
<tr><td style="border:1px solid #999;padding:6px">look</td><td style="border:1px solid #999;padding:6px">look forward to</td><td style="border:1px solid #999;padding:6px">期待</td></tr>
<tr><td style="border:1px solid #999;padding:6px">come</td><td style="border:1px solid #999;padding:6px">come up with</td><td style="border:1px solid #999;padding:6px">想出</td></tr>
<tr><td style="border:1px solid #999;padding:6px">get</td><td style="border:1px solid #999;padding:6px">get along with</td><td style="border:1px solid #999;padding:6px">相处</td></tr>
<tr><td style="border:1px solid #999;padding:6px">give</td><td style="border:1px solid #999;padding:6px">give up</td><td style="border:1px solid #999;padding:6px">放弃</td></tr>
<tr><td style="border:1px solid #999;padding:6px">put</td><td style="border:1px solid #999;padding:6px">put off</td><td style="border:1px solid #999;padding:6px">推迟</td></tr>
</table>

look forward to 后面接 doing（to 是介词）：I look forward to hearing from you。这是高频考点。

词组词性记忆：look up 查（宾语可放中间或后面，代词只能中间：look it up）；give up 放弃（give it up）。

构词联想：take off 飞机起飞/事业腾飞/脱衣服——一词多义靠语境。up 常含"完成/上升"感（give up 彻底放下、put up 张贴举起）。

学习法：每学一个短语造 3 个自己的例句，替换主语与场景。同义短语归类：放弃=give up/quit/abandon。',
'掌握高频动词短语',
'["look forward to doing","take off三义","短语词性位置","一词多义靠语境"]',
'beginner', 12, 2),
(244, 66, '易混词辨析',
'英语易混词是失分重灾区。形近词、近义词、同根异义词三类要专项攻克。

<b>常见易混词对表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">词对</th><th style="border:1px solid #999;padding:6px">区别</th><th style="border:1px solid #999;padding:6px">例句</th></tr>
<tr><td style="border:1px solid #999;padding:6px">affect/effect</td><td style="border:1px solid #999;padding:6px">动/名</td><td style="border:1px solid #999;padding:6px">affect the result; have an effect</td></tr>
<tr><td style="border:1px solid #999;padding:6px">advice/advise</td><td style="border:1px solid #999;padding:6px">名/动</td><td style="border:1px solid #999;padding:6px">give advice; advise sb to</td></tr>
<tr><td style="border:1px solid #999;padding:6px">lie/lay</td><td style="border:1px solid #999;padding:6px">躺/放置</td><td style="border:1px solid #999;padding:6px">lie down; lay the book</td></tr>
<tr><td style="border:1px solid #999;padding:6px">rise/raise</td><td style="border:1px solid #999;padding:6px">不及物/及物</td><td style="border:1px solid #999;padding:6px">price rises; raise hands</td></tr>
<tr><td style="border:1px solid #999;padding:6px">accept/except</td><td style="border:1px solid #999;padding:6px">接受/除…外</td><td style="border:1px solid #999;padding:6px">accept the gift; all except me</td></tr>
<tr><td style="border:1px solid #999;padding:6px">economic/economical</td><td style="border:1px solid #999;padding:6px">经济上/节约的</td><td style="border:1px solid #999;padding:6px">economic growth; economical car</td></tr>
</table>

lie 与 lay 的过去式陷阱：lie-lay-lain（躺），lay-laid-laid（放置）——lie 的过去式 lay 与放置原形相同，极易混淆。

形容词尾缀辨义：-ful 充满（painful 痛苦的）、-less 没有（painless 无痛的）、-able 可被（available 可得到的）。词根相同后缀不同意义不同（industrial 工业的/industrious 勤奋的）。

动词过去式不规则记忆分组：ring-rang-rung、sing-sang-sung、bring-brought-bought（-ought 组）。三兄弟：sink-sank-sunk、drink-drank-drunk。

辨析学习方法：错题本记录+造句区分+间隔复习。字典优先看英文释义（中文翻译易混）。',
'掌握易混词辨析',
'["affect动effect名","lie与lay过去式","rise不及物raise及物","错题本+英文释义"]',
'intermediate', 12, 3),
(245, 66, '阅读高频词清单',
'阅读词汇按频次学习：核心 2000 词覆盖 80% 文本，四级核心词 4000+，学术词汇（AWL）570 词是学术阅读关键。

<b>学术高频词汇表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">单词</th><th style="border:1px solid #999;padding:6px">含义</th><th style="border:1px solid #999;padding:6px">搭配</th></tr>
<tr><td style="border:1px solid #999;padding:6px">analyze</td><td style="border:1px solid #999;padding:6px">分析</td><td style="border:1px solid #999;padding:6px">analyze the data</td></tr>
<tr><td style="border:1px solid #999;padding:6px">significant</td><td style="border:1px solid #999;padding:6px">显著的</td><td style="border:1px solid #999;padding:6px">significant difference</td></tr>
<tr><td style="border:1px solid #999;padding:6px">assume</td><td style="border:1px solid #999;padding:6px">假设</td><td style="border:1px solid #999;padding:6px">assume that</td></tr>
<tr><td style="border:1px solid #999;padding:6px">indicate</td><td style="border:1px solid #999;padding:6px">表明</td><td style="border:1px solid #999;padding:6px">indicate a trend</td></tr>
<tr><td style="border:1px solid #999;padding:6px">consequently</td><td style="border:1px solid #999;padding:6px">因此</td><td style="border:1px solid #999;padding:6px">逻辑连接词</td></tr>
<tr><td style="border:1px solid #999;padding:6px">phenomenon</td><td style="border:1px solid #999;padding:6px">现象</td><td style="border:1px solid #999;padding:6px">social phenomenon</td></tr>
</table>

阅读逻辑信号词：因果（because/therefore/consequently）、转折（however/nevertheless/despite）、举例（for instance/such as）、总结（in conclusion/to sum up）——信号词定位答案。

题干定位法：划题干关键词（专有名词、数字、大写）→原文定位→同义替换比对。出题顺序通常与原文顺序一致。

态度题词汇库：positive/negative/neutral/objective/skeptical。主旨题看首尾段与段首句。细节题警惕绝对化词（all/never/only）。

阅读速度训练：意群阅读（一次看 3-5 个词）替代逐词读；先题后文；计时训练每分钟 100-150 词。泛读积累语感与词汇。',
'掌握阅读词汇与技巧',
'["核心2000词覆盖80%","信号词定位答案","题干关键词定位","同义替换是核心"]',
'intermediate', 12, 4),

(246, 67, '长难句拆解',
'长难句=主干+修饰。拆解三步：找谓语动词定主干、剥从句与修饰、重组语义。

<b>长难句成分标识表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">成分</th><th style="border:1px solid #999;padding:6px">识别标志</th><th style="border:1px solid #999;padding:6px">作用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">主干</td><td style="border:1px solid #999;padding:6px">主谓宾完整</td><td style="border:1px solid #999;padding:6px">句子核心</td></tr>
<tr><td style="border:1px solid #999;padding:6px">从句</td><td style="border:1px solid #999;padding:6px">引导词开头</td><td style="border:1px solid #999;padding:6px">附加信息</td></tr>
<tr><td style="border:1px solid #999;padding:6px">分词短语</td><td style="border:1px solid #999;padding:6px">-ing/-ed 开头</td><td style="border:1px solid #999;padding:6px">修饰或状语</td></tr>
<tr><td style="border:1px solid #999;padding:6px">插入语</td><td style="border:1px solid #999;padding:6px">逗号/破折号</td><td style="border:1px solid #999;padding:6px">补充说明</td></tr>
<tr><td style="border:1px solid #999;padding:6px">介词短语</td><td style="border:1px solid #999;padding:6px">with/in/of 等</td><td style="border:1px solid #999;padding:6px">附加修饰</td></tr>
</table>

例：The boy standing at the door, who I met yesterday, is my cousin who studies in Beijing. 拆解：主干 The boy is my cousin；分词短语 standing at the door 修饰 boy；非限制性从句补充；定语从句修饰 cousin。

长句三步译法：顺译（按原序）→调整（中英语序差异：定语前置、状语位置）→润色（通顺自然）。

非谓语动词辨析：to do（目的将来）、doing（主动进行）、done（被动完成）。独立主格：with+名词+分词（with the door closed）。

翻译练习法：每天拆 2 个长难句，标注成分+翻译+回译对比。真题长难句收集成册反复看。',
'掌握长难句拆解',
'["找谓语定主干","剥从句与修饰","非谓语三种形式","三步译法"]',
'intermediate', 12, 1),
(247, 67, '段落与篇章结构',
'英语段落结构：主题句（Topic Sentence）→支撑句（Supporting）→结论句（Concluding）。主题句通常首句或末句。

<b>段落写作结构表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">结构</th><th style="border:1px solid #999;padding:6px">功能</th><th style="border:1px solid #999;padding:6px">常用句式</th></tr>
<tr><td style="border:1px solid #999;padding:6px">主题句</td><td style="border:1px solid #999;padding:6px">总起观点</td><td style="border:1px solid #999;padding:6px">First of all...</td></tr>
<tr><td style="border:1px solid #999;padding:6px">支撑句</td><td style="border:1px solid #999;padding:6px">论证观点</td><td style="border:1px solid #999;padding:6px">For example.../According to...</td></tr>
<tr><td style="border:1px solid #999;padding:6px">对比句</td><td style="border:1px solid #999;padding:6px">正反论证</td><td style="border:1px solid #999;padding:6px">On the contrary...</td></tr>
<tr><td style="border:1px solid #999;padding:6px">结论句</td><td style="border:1px solid #999;padding:6px">收束总结</td><td style="border:1px solid #999;padding:6px">In conclusion...</td></tr>
</table>

议论文结构：开头（背景+观点）→主体（论点1+论据+例子）→（论点2+反驳）→结尾（重申观点+升华）。四段式最稳妥。

衔接手段：逻辑连接词（however/therefore/moreover）、代词指代（this/these）、同义替换（避免重复词）。

万能写作模板（现象类）：Recently, ... has become a hot topic. There are both advantages and disadvantages. On one hand... On the other hand... From my perspective...

论据展开 SEE 结构：Statement 观点→Explanation 解释→Example 例子。每段一个观点，段落内部逻辑自洽。',
'掌握段落结构',
'["主题句支撑句结论句","四段式议论文","SEE论据结构","衔接词体系"]',
'intermediate', 12, 2),
(248, 67, '应用文写作',
'应用文有固定格式：邮件、书信、通知、申请。格式正确是底线，语言得体是加分。

<b>应用文格式要点表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类型</th><th style="border:1px solid #999;padding:6px">必备要素</th><th style="border:1px solid #999;padding:6px">套话</th></tr>
<tr><td style="border:1px solid #999;padding:6px">书信</td><td style="border:1px solid #999;padding:6px">称呼/正文/落款</td><td style="border:1px solid #999;padding:6px">Dear Sir or Madam</td></tr>
<tr><td style="border:1px solid #999;padding:6px">邮件</td><td style="border:1px solid #999;padding:6px">主题行/问候/目的</td><td style="border:1px solid #999;padding:6px">Hope this email finds you well</td></tr>
<tr><td style="border:1px solid #999;padding:6px">申请信</td><td style="border:1px solid #999;padding:6px">目的/资质/期待</td><td style="border:1px solid #999;padding:6px">I am writing to apply for</td></tr>
<tr><td style="border:1px solid #999;padding:6px">建议信</td><td style="border:1px solid #999;padding:6px">问题/建议/结语</td><td style="border:1px solid #999;padding:6px">I would like to suggest</td></tr>
</table>

邮件三步走：开头问候+说明来意（I am writing to...）、中间要点分条（First/Moreover/Finally）、结尾礼貌收尾（Looking forward to your reply）。

写信常用表达：感谢（I sincerely appreciate...）、道歉（Please accept my sincere apologies for...）、请求（Could you please...）。

雅思小作文数据描述：上升（rise/increase/climb）、下降（fall/decrease/drop）、波动（fluctuate）、平稳（remain stable），幅度用副词（significantly/steadily）。

写作自查清单：格式完整、人称一致、时态正确、连接词、拼写标点。写完通读一遍修改低级错误。',
'掌握应用文写作',
'["书信格式三要素","邮件三步走","数据描述词汇","写作自查清单"]',
'intermediate', 12, 3),
(249, 67, '学术论文写作',
'学术写作：结构规范（IMRaD）、语言客观、引用严谨。摘要与引言决定第一印象。

<b>论文结构对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">部分</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">时态</th></tr>
<tr><td style="border:1px solid #999;padding:6px">Introduction</td><td style="border:1px solid #999;padding:6px">背景问题目的</td><td style="border:1px solid #999;padding:6px">一般现在</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Method</td><td style="border:1px solid #999;padding:6px">方法步骤</td><td style="border:1px solid #999;padding:6px">一般过去</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Results</td><td style="border:1px solid #999;padding:6px">数据结果</td><td style="border:1px solid #999;padding:6px">一般过去</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Discussion</td><td style="border:1px solid #999;padding:6px">解释与对比</td><td style="border:1px solid #999;padding:6px">一般现在</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Conclusion</td><td style="border:1px solid #999;padding:6px">结论与展望</td><td style="border:1px solid #999;padding:6px">一般现在</td></tr>
</table>

学术语言特征：被动语态（was conducted）、名词化（the analysis of）、避免口语（改为 moreover/nevertheless）、客观措辞（It is argued that）。

引用格式：APA（作者-年份）、MLA、Chicago。直接引用加引号页码，间接引用注明来源。查重与学术诚信是底线。

转折与衔接：However/Therefore/In contrast/Furthermore——段落衔接词是逻辑清晰的标志。

写作流程：先列大纲→写初稿（别纠结完美）→修改结构→润色语言→检查引用。好文章是改出来的，初稿允许粗糙。',
'掌握学术写作',
'["IMRaD结构","各节时态惯例","被动与名词化","引用格式APA"]',
'advanced', 12, 4),

(250, 68, '音标与发音',
'英语发音基础：48 个音标（20 元音+28 辅音）。元音分单元音与双元音，辅音分清浊。发音准确是听力的前提。

<b>元音发音要点表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">音标</th><th style="border:1px solid #999;padding:6px">例词</th><th style="border:1px solid #999;padding:6px">要点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">/iː/</td><td style="border:1px solid #999;padding:6px">see</td><td style="border:1px solid #999;padding:6px">长音咧嘴</td></tr>
<tr><td style="border:1px solid #999;padding:6px">/ɪ/</td><td style="border:1px solid #999;padding:6px">sit</td><td style="border:1px solid #999;padding:6px">短音放松</td></tr>
<tr><td style="border:1px solid #999;padding:6px">/e/</td><td style="border:1px solid #999;padding:6px">bed</td><td style="border:1px solid #999;padding:6px">口型微张</td></tr>
<tr><td style="border:1px solid #999;padding:6px">/æ/</td><td style="border:1px solid #999;padding:6px">cat</td><td style="border:1px solid #999;padding:6px">口张大</td></tr>
<tr><td style="border:1px solid #999;padding:6px">/ə/</td><td style="border:1px solid #999;padding:6px">about</td><td style="border:1px solid #999;padding:6px">弱读音最常用</td></tr>
<tr><td style="border:1px solid #999;padding:6px">/aɪ/</td><td style="border:1px solid #999;padding:6px">my</td><td style="border:1px solid #999;padding:6px">双元音滑动</td></tr>
</table>

易错音：/θ/ /ð/（think/this，舌尖轻咬）、/v/ 与 /w/（very/well）、/l/ 与 /n/、卷舌 /r/ 与弹舌。

重音规则：双音节名词重音在前（REcord 名词），动词在后（reCORD 动词）。词缀重音：-tion 前重读（eduCAtion）。

连读弱读：辅音+元音连读（an apple）、辅音+辅音省略（good morning 的 d 弱化）、弱读虚词（and 读 /ən/）。

练习法：影子跟读（跟音频同步复述）、慢速分解再加速、录音对比（自己 vs 原声）。每日 15 分钟发音练习优于周末突击。',
'掌握音标与连读',
'["48音标体系","易错辅音θ/v","名词动词重音","影子跟读练习"]',
'beginner', 12, 1),
(251, 68, '情景对话',
'口语按场景积累模板：点餐、问路、购物、就医、旅行、职场。每个场景有固定高频句式。

<b>常用情景句型表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">场景</th><th style="border:1px solid #999;padding:6px">常用表达</th></tr>
<tr><td style="border:1px solid #999;padding:6px">点餐</td><td style="border:1px solid #999;padding:6px">Could I have...?/I would like...</td></tr>
<tr><td style="border:1px solid #999;padding:6px">问路</td><td style="border:1px solid #999;padding:6px">How can I get to...?/Is it far from here?</td></tr>
<tr><td style="border:1px solid #999;padding:6px">购物</td><td style="border:1px solid #999;padding:6px">How much is it?/Can I try it on?</td></tr>
<tr><td style="border:1px solid #999;padding:6px">就医</td><td style="border:1px solid #999;padding:6px">I have a headache./What are the symptoms?</td></tr>
<tr><td style="border:1px solid #999;padding:6px">旅行</td><td style="border:1px solid #999;padding:6px">Where is the check-in counter?</td></tr>
<tr><td style="border:1px solid #999;padding:6px">职场</td><td style="border:1px solid #999;padding:6px">Could you give me a hand?/Let me check.</td></tr>
</table>

礼貌请求三件套：Could you...?（委婉）、Would you mind...?（更委婉）、I was wondering if...（最正式）。

表达观点的模板：In my opinion.../From my perspective.../I would argue that...。赞同（That makes sense）、反对（I see your point, but...）。

电话英语：This is...speaking（自我介绍）、Hold on, please（稍等）、Sorry, wrong number（打错了）。记笔记：May I take a message?

口语提升路径：先能说（勇敢开口）→再准确（纠错）→后流利（连读弱读）。找语伴（HelloTalk/Tandem）或 AI 对话练习。',
'掌握情景对话',
'["场景模板积累","礼貌请求三件套","电话固定用语","先流利后准确"]',
'intermediate', 12, 2),
(252, 68, '听力训练',
'听力难在三处：语速快、连读多、词汇生。突破路径：精听（抠细节）+泛听（磨耳朵）。

<b>听力训练方法表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">方法</th><th style="border:1px solid #999;padding:6px">操作</th><th style="border:1px solid #999;padding:6px">频率</th></tr>
<tr><td style="border:1px solid #999;padding:6px">精听</td><td style="border:1px solid #999;padding:6px">逐句听写</td><td style="border:1px solid #999;padding:6px">每日20分钟</td></tr>
<tr><td style="border:1px solid #999;padding:6px">泛听</td><td style="border:1px solid #999;padding:6px">只听大意</td><td style="border:1px solid #999;padding:6px">每日30分钟</td></tr>
<tr><td style="border:1px solid #999;padding:6px">跟读</td><td style="border:1px solid #999;padding:6px">模仿语音语调</td><td style="border:1px solid #999;padding:6px">精听之后</td></tr>
<tr><td style="border:1px solid #999;padding:6px">倍速</td><td style="border:1px solid #999;padding:6px">0.8-1.5倍切换</td><td style="border:1px solid #999;padding:6px">适应语速</td></tr>
</table>

精听四步：盲听抓大意→逐句暂停写→对照原文改→跟读纠音。坚持 30 天见效明显。

听力预测技巧：题干圈关键词（人名地点数字）、选项差异对比、转折词后是重点（but/however 后常为答案）。

连读听辨：辅音+元音（an apple）、同化（could you 读 kju）、省音（want to 变 wanna）、弱读（and 读 n）。

听力材料分级：入门（VOA Special English）、进阶（BBC 6 Minute English）、挑战（TED/Podcast）。按水平选材，听懂 70% 是合适的材料。',
'掌握听力训练',
'["精听+泛听结合","转折词后是重点","连读同化听辨","按水平选材料"]',
'intermediate', 12, 3),
(253, 68, '发音进阶与演讲',
'口语进阶：语调节奏+演讲表达。英语是重音语言（stress-timed），重音决定节奏感。

<b>演讲表达技巧表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">要素</th><th style="border:1px solid #999;padding:6px">技巧</th><th style="border:1px solid #999;padding:6px">例子</th></tr>
<tr><td style="border:1px solid #999;padding:6px">开场</td><td style="border:1px solid #999;padding:6px">提问/故事/数据</td><td style="border:1px solid #999;padding:6px">Did you know that...</td></tr>
<tr><td style="border:1px solid #999;padding:6px">过渡</td><td style="border:1px solid #999;padding:6px">承上启下</td><td style="border:1px solid #999;padding:6px">Moving on to...</td></tr>
<tr><td style="border:1px solid #999;padding:6px">强调</td><td style="border:1px solid #999;padding:6px">重读停顿</td><td style="border:1px solid #999;padding:6px">This is CRUCIAL.</td></tr>
<tr><td style="border:1px solid #999;padding:6px">结尾</td><td style="border:1px solid #999;padding:6px">总结呼吁</td><td style="border:1px solid #999;padding:6px">Let us take action.</td></tr>
</table>

升调与降调：陈述降调、一般疑问升调、列举前升后降、反意疑问看语气。语调传递态度，比单词更重要。

英语节奏：重读音节均匀出现，弱读音节夹缝生存。一句话重读关键词（I LOVE you vs I love YOU 含义不同）。

TED 演讲学习法：先看字幕理解→关字幕盲听→模仿演讲者语气→自己复述 3 分钟。关注逻辑结构（问题-故事-数据-解决方案）。

即兴演讲模板 PREP：Point 观点→Reason 理由→Example 例子→Point 重申。职场汇报与面试自我介绍都用它。',
'掌握演讲技巧',
'["重音语言节奏","升调降调规则","TED四步学习法","PREP演讲模板"]',
'intermediate', 12, 4),

(254, 69, '四六级备考策略',
'四六级：听力、阅读、翻译、写作四部分。六级难度约四级 1.3 倍，词汇量要求 5500+。

<b>四六级题型与时间表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">题型</th><th style="border:1px solid #999;padding:6px">题量</th><th style="border:1px solid #999;padding:6px">建议时间</th><th style="border:1px solid #999;padding:6px">分值占比</th></tr>
<tr><td style="border:1px solid #999;padding:6px">写作</td><td style="border:1px solid #999;padding:6px">1篇</td><td style="border:1px solid #999;padding:6px">30分钟</td><td style="border:1px solid #999;padding:6px">15%</td></tr>
<tr><td style="border:1px solid #999;padding:6px">听力</td><td style="border:1px solid #999;padding:6px">25-30题</td><td style="border:1px solid #999;padding:6px">25-30分钟</td><td style="border:1px solid #999;padding:6px">35%</td></tr>
<tr><td style="border:1px solid #999;padding:6px">阅读</td><td style="border:1px solid #999;padding:6px">30题</td><td style="border:1px solid #999;padding:6px">40分钟</td><td style="border:1px solid #999;padding:6px">35%</td></tr>
<tr><td style="border:1px solid #999;padding:6px">翻译</td><td style="border:1px solid #999;padding:6px">1段</td><td style="border:1px solid #999;padding:6px">30分钟</td><td style="border:1px solid #999;padding:6px">15%</td></tr>
</table>

备考时间线（3 个月）：第 1 月词汇+真题摸底、第 2 月分项突破（听力精听+阅读技巧）、第 3 月真题模考+错题复盘。

听力临场策略：利用题干空隙预读选项、听到关键词立即选、转折词后改答案。阅读：先题后文，细节题定位，主旨题看首尾。

翻译技巧：中文断句→找主干→补主语（中文常省略）→时态判断。常用词汇：传统文化（dragon boat festival 等）。

写作提分：字数达标（120 词+）、结构完整（三段式）、高级句式（从句+倒装）、卷面整洁。背 5 篇范文+万能句型保底。',
'掌握四六级策略',
'["听力占35%最重","3个月备考时间线","听力预读选项","翻译先断句找主干"]',
'advanced', 12, 1),
(255, 69, '雅思备考',
'雅思四项各 9 分：听说读写，总分为平均分。学术类（A 类）用于留学，培训类（G 类）用于移民。

<b>雅思题型结构表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">科目</th><th style="border:1px solid #999;padding:6px">时间</th><th style="border:1px solid #999;padding:6px">结构</th></tr>
<tr><td style="border:1px solid #999;padding:6px">听力</td><td style="border:1px solid #999;padding:6px">30分钟</td><td style="border:1px solid #999;padding:6px">4段40题</td></tr>
<tr><td style="border:1px solid #999;padding:6px">阅读</td><td style="border:1px solid #999;padding:6px">60分钟</td><td style="border:1px solid #999;padding:6px">3篇40题</td></tr>
<tr><td style="border:1px solid #999;padding:6px">写作</td><td style="border:1px solid #999;padding:6px">60分钟</td><td style="border:1px solid #999;padding:6px">图表+议论文</td></tr>
<tr><td style="border:1px solid #999;padding:6px">口语</td><td style="border:1px solid #999;padding:6px">11-14分钟</td><td style="border:1px solid #999;padding:6px">三部分对话</td></tr>
</table>

口语三部分：自我介绍与生活话题（4-5 分钟）→卡片题独白（1-2 分钟准备+2 分钟讲）→深入讨论（4-5 分钟）。

口语评分四标准：流利与连贯（fluency）、词汇资源、语法范围与准确、发音。各占 25%。

写作小作文（Task 1）：描述图表数据，150 词+，数据对比与趋势词汇是得分点。大作文（Task 2）：议论文 250 词+，审题定立场，四段结构。

雅思 vs 托福：雅思英联邦认可广、口语真人对话；托福北美为主、全程机考。分数对标：雅思 6.5 ≈ 托福 90。',
'掌握雅思策略',
'["听说读写各9分","口语四评分标准","Task1图表Task2议论文","雅思6.5≈托福90"]',
'advanced', 12, 2),
(256, 69, 'GRE与学术英语',
'GRE 是北美研究生入学考试：语文、数学、写作。数学对中国考生简单（初中水平），语文词汇量要求极高（12000+）。

<b>GRE 考试结构表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">科目</th><th style="border:1px solid #999;padding:6px">分值</th><th style="border:1px solid #999;padding:6px">题型</th></tr>
<tr><td style="border:1px solid #999;padding:6px">语文</td><td style="border:1px solid #999;padding:6px">130-170</td><td style="border:1px solid #999;padding:6px">填空/阅读/等价</td></tr>
<tr><td style="border:1px solid #999;padding:6px">数学</td><td style="border:1px solid #999;padding:6px">130-170</td><td style="border:1px solid #999;padding:6px">选择/比较/填空</td></tr>
<tr><td style="border:1px solid #999;padding:6px">写作</td><td style="border:1px solid #999;padding:6px">0-6</td><td style="border:1px solid #999;padding:6px">Issue+Argument</td></tr>
</table>

填空技巧：找逻辑信号词（although/despite 转折、because 因果）、判断空格词性、代入验证。阅读：长文章考结构、短文章考细节。

写作：Issue 立论文（给出立场+论证）+ Argument 驳论文（找逻辑漏洞）。驳论文有模板化套路（证据不足、样本偏差、因果错误）。

背词工具：核心词汇书（要你命 3000）+ Anki 间隔复习。词根词缀记忆法在 GRE 词汇量面前是刚需。

学术英语长期价值：论文阅读写作、国际会议、科研合作。备考 GRE 顺便提升学术英语综合能力。',
'掌握GRE备考',
'["语文130-170","填空逻辑信号词","Issue与Argument","词根词缀刚需"]',
'advanced', 12, 3),
(257, 69, '考试心态与时间管理',
'备考成败一半在方法一半在心态。学习科学：间隔效应、测试效应、交错练习已被证实有效。

<b>高效学习法对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">方法</th><th style="border:1px solid #999;padding:6px">原理</th><th style="border:1px solid #999;padding:6px">应用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">间隔效应</td><td style="border:1px solid #999;padding:6px">分散复习优于集中</td><td style="border:1px solid #999;padding:6px">每日30分钟</td></tr>
<tr><td style="border:1px solid #999;padding:6px">测试效应</td><td style="border:1px solid #999;padding:6px">主动回忆强于重读</td><td style="border:1px solid #999;padding:6px">合书自测</td></tr>
<tr><td style="border:1px solid #999;padding:6px">交错练习</td><td style="border:1px solid #999;padding:6px">混合题型优于单题</td><td style="border:1px solid #999;padding:6px">真题混练</td></tr>
<tr><td style="border:1px solid #999;padding:6px">费曼技巧</td><td style="border:1px solid #999;padding:6px">教别人检验掌握</td><td style="border:1px solid #999;padding:6px">讲给同学听</td></tr>
</table>

每日计划：早晨记单词（记忆黄金期）、白天刷题（精力高峰）、晚上复盘错题。番茄工作法：25 分钟专注+5 分钟休息。

考前一周：回归真题错题、模考计时练节奏、不再学新内容（新知识增加焦虑）。考前一夜：早睡、备齐证件文具。

考场策略：先易后难、听力预读选项、阅读留检查时间、写作打草稿提纲。时间分配失衡是失分主因。

心态调节：焦虑正常化（适度焦虑提升表现）、积极自我暗示（I have prepared well）、考后不核对答案影响下一场。健康作息+运动减压是状态保障。',
'掌握备考心态',
'["间隔测试效应","番茄工作法","考前回归错题","焦虑正常化"]',
'advanced', 12, 4),

(258, 70, '商务邮件写作',
'商务邮件是职场基本功：主题明确、结构清晰、语气得体。三原则：简洁（concise）、清晰（clear）、礼貌（courteous）。

<b>商务邮件结构表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">部分</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">示例</th></tr>
<tr><td style="border:1px solid #999;padding:6px">主题行</td><td style="border:1px solid #999;padding:6px">概括要点</td><td style="border:1px solid #999;padding:6px">Meeting schedule for June</td></tr>
<tr><td style="border:1px solid #999;padding:6px">称呼</td><td style="border:1px solid #999;padding:6px">Dear + 名/姓</td><td style="border:1px solid #999;padding:6px">Dear Mr. Chen</td></tr>
<tr><td style="border:1px solid #999;padding:6px">开场</td><td style="border:1px solid #999;padding:6px">来意问候</td><td style="border:1px solid #999;padding:6px">I hope this email finds you well</td></tr>
<tr><td style="border:1px solid #999;padding:6px">正文</td><td style="border:1px solid #999;padding:6px">要点分条</td><td style="border:1px solid #999;padding:6px">First.../Also...</td></tr>
<tr><td style="border:1px solid #999;padding:6px">结尾</td><td style="border:1px solid #999;padding:6px">行动要求</td><td style="border:1px solid #999;padding:6px">Please let me know by Friday</td></tr>
<tr><td style="border:1px solid #999;padding:6px">落款</td><td style="border:1px solid #999;padding:6px">Best regards</td><td style="border:1px solid #999;padding:6px">Sincerely, Li Wei</td></tr>
</table>

常用开场：I am writing to inform/inquire/confirm...（来意）、Thank you for your email（回应）。附件：Please find attached...。

请求与催促：Could you please...?（委婉）、I would appreciate it if...（更正式）、As a reminder...（跟进）。避免命令式（You must...）。

跨文化注意：欧美直截了当、日本邮件含蓄、中东先寒暄。国际邮件避免俚语与缩写（pls 用 please）。

检查清单：收件人正确、附件确认、拼写语法、语气检查（重读一遍换位思考）。错别字毁专业形象。',
'掌握商务邮件',
'["3C原则简洁清晰礼貌","主题行概括","请求委婉句式","发送前检查清单"]',
'intermediate', 12, 1),
(259, 70, '会议英语',
'会议英语覆盖全流程：预约、开场、发言、讨论、结束。会议中用英语发言是职场必备。

<b>会议常用表达表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">环节</th><th style="border:1px solid #999;padding:6px">表达</th></tr>
<tr><td style="border:1px solid #999;padding:6px">预约</td><td style="border:1px solid #999;padding:6px">Could we schedule a meeting?</td></tr>
<tr><td style="border:1px solid #999;padding:6px">开场</td><td style="border:1px solid #999;padding:6px">Let us get started. The agenda is...</td></tr>
<tr><td style="border:1px solid #999;padding:6px">发言</td><td style="border:1px solid #999;padding:6px">I would like to add that...</td></tr>
<tr><td style="border:1px solid #999;padding:6px">打断</td><td style="border:1px solid #999;padding:6px">May I interrupt for a moment?</td></tr>
<tr><td style="border:1px solid #999;padding:6px">询问</td><td style="border:1px solid #999;padding:6px">Could you elaborate on that?</td></tr>
<tr><td style="border:1px solid #999;padding:6px">结束</td><td style="border:1px solid #999;padding:6px">Let us wrap up. Action items are...</td></tr>
</table>

主持人的衔接话术：推进议程（Let us move on to the next item）、控制时间（We have 5 minutes left）、总结（To summarize...）。

表达同意与反对：同意（I totally agree/That makes sense）、部分同意（I see your point, but...）、反对（I am afraid I disagree because...）。

会议记录（minutes）：时间地点、出席人、议题、决议、行动项（action items with owner and deadline）。会后 24 小时内发送。

视频会议（Zoom/Teams）：开场（Can you hear me?）、共享屏幕（Let me share my screen）、会议链接与静音礼仪。',
'掌握会议英语',
'["会议全流程表达","主持人衔接话术","委婉反对句式","行动项记录"]',
'intermediate', 12, 2),
(260, 70, '商务谈判',
'谈判是双赢的艺术。准备四要素：目标（BATNA 最佳替代方案）、底线、对方立场、筹码。

<b>谈判阶段与话术表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">阶段</th><th style="border:1px solid #999;padding:6px">策略</th><th style="border:1px solid #999;padding:6px">话术</th></tr>
<tr><td style="border:1px solid #999;padding:6px">开场</td><td style="border:1px solid #999;padding:6px">建立关系</td><td style="border:1px solid #999;padding:6px">We value this partnership</td></tr>
<tr><td style="border:1px solid #999;padding:6px">报价</td><td style="border:1px solid #999;padding:6px">锚定心理</td><td style="border:1px solid #999;padding:6px">Our offer is...</td></tr>
<tr><td style="border:1px solid #999;padding:6px">让步</td><td style="border:1px solid #999;padding:6px">等价交换</td><td style="border:1px solid #999;padding:6px">We can do X if you do Y</td></tr>
<tr><td style="border:1px solid #999;padding:6px">僵局</td><td style="border:1px solid #999;padding:6px">寻找新方案</td><td style="border:1px solid #999;padding:6px">Let us explore other options</td></tr>
<tr><td style="border:1px solid #999;padding:6px">成交</td><td style="border:1px solid #999;padding:6px">确认细节</td><td style="border:1px solid #999;padding:6px">Let us confirm the terms</td></tr>
</table>

报价策略：先报价设锚点（高报价留让步空间）、让步要"等价交换"（我让步价格，你增加订单量）、每次让步递减显示底线。

谈判心理：双赢思维（扩大蛋糕 vs 分蛋糕）、BATNA 越强谈判越主动、情绪管理（对手发火是策略，别上当）。

国际商务文化：美国直接高效、日本重关系与沉默、中国重关系与饭局、中东重人情。跨文化谈判先研究对方商务礼仪。

成交与合同：口头协议要落实到书面（Let us put this in writing）、逐条确认（payment terms/delivery/warranty）。谈判成功=准备×心态×技巧。',
'掌握谈判技巧',
'["BATNA谈判准备","先报价设锚点","等价交换让步","跨文化差异"]',
'advanced', 12, 3),
(261, 70, '商务演讲与汇报',
'商务汇报（Presentation）是职场影响力工具。结构：开场抓注意力→逻辑递进→数据支撑→结尾行动呼吁。

<b>商务汇报结构表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">部分</th><th style="border:1px solid #999;padding:6px">内容</th><th style="border:1px solid #999;padding:6px">时间占比</th></tr>
<tr><td style="border:1px solid #999;padding:6px">开场</td><td style="border:1px solid #999;padding:6px">hook+目的+大纲</td><td style="border:1px solid #999;padding:6px">10%</td></tr>
<tr><td style="border:1px solid #999;padding:6px">主体</td><td style="border:1px solid #999;padding:6px">3个论点+数据</td><td style="border:1px solid #999;padding:6px">75%</td></tr>
<tr><td style="border:1px solid #999;padding:6px">结尾</td><td style="border:1px solid #999;padding:6px">总结+行动</td><td style="border:1px solid #999;padding:6px">15%</td></tr>
</table>

PPT 原则：一页一个观点、图多于文字、数据可视化（图表）、字大图清（远排可见）。开场三招：数据震撼（Last year we grew 30%）、提问、故事。

数据表达句式：增长（increased by X%）、占比（accounts for X%）、对比（compared with...）、预测（is projected to reach）。

问答环节：感谢提问（That is a good question）、先复述（You are asking about...）、坦诚不会（Let me get back to you on that）。

紧张管理：充分排练（计时+录像）、开场深呼吸、看听众额头（缓解对视压力）、备好开场白（前 30 秒最难）。汇报是"做得好+讲得好"。',
'掌握商务汇报',
'["10-75-15时间分配","一页一观点","数据表达句式","排练与紧张管理"]',
'advanced', 12, 4);

INSERT IGNORE INTO sekai_learning_quiz_questions (id, lesson_id, question, question_type, options, correct_answer, explanation, sort_order) VALUES
(475, 238, 'I have lived here ___ 2018. 填什么？', 'single', '[{"label":"A","text":"since"},{"label":"B","text":"for"},{"label":"C","text":"in"},{"label":"D","text":"at"}]', 'A', 'since+时间点，for+时间段', 1),
(476, 238, 'I saw the movie yesterday 用什么时态？', 'single', '[{"label":"A","text":"一般过去时"},{"label":"B","text":"现在完成时"},{"label":"C","text":"过去完成时"},{"label":"D","text":"将来时"}]', 'A', 'yesterday 标志词用一般过去', 2),
(477, 239, 'I know ___ he is right. 填？', 'single', '[{"label":"A","text":"that"},{"label":"B","text":"which"},{"label":"C","text":"who"},{"label":"D","text":"where"}]', 'A', '陈述句宾语从句用 that', 1),
(478, 239, '宾语从句必须用？', 'single', '[{"label":"A","text":"陈述语序"},{"label":"B","text":"疑问语序"},{"label":"C","text":"倒装语序"},{"label":"D","text":"省略语序"}]', 'A', 'What time it is 而非 What time is it', 2),
(479, 240, 'The house ___ he lives is old. 填？', 'single', '[{"label":"A","text":"in which"},{"label":"B","text":"which in"},{"label":"C","text":"who"},{"label":"D","text":"whom"}]', 'A', '介词+which 引导定语从句', 1),
(480, 240, '先行词有人有物时用？', 'single', '[{"label":"A","text":"that"},{"label":"B","text":"who"},{"label":"C","text":"whom"},{"label":"D","text":"when"}]', 'A', 'that 可用于人+物混合', 2),
(481, 241, 'If I were you, I ___ study harder. 填？', 'single', '[{"label":"A","text":"would"},{"label":"B","text":"will"},{"label":"C","text":"shall"},{"label":"D","text":"may"}]', 'A', '与现在相反主句 would+do', 1),
(482, 241, 'I wish I ___ the answer yesterday. 填？', 'single', '[{"label":"A","text":"had known"},{"label":"B","text":"know"},{"label":"C","text":"have known"},{"label":"D","text":"knew"}]', 'A', '与过去相反的愿望用过去完成', 2),
(483, 242, 'preview 中的 pre- 表示？', 'single', '[{"label":"A","text":"之前"},{"label":"B","text":"之后"},{"label":"C","text":"否定"},{"label":"D","text":"重复"}]', 'A', 'pre- 在之前', 1),
(484, 242, '艾宾浩斯遗忘曲线建议？', 'single', '[{"label":"A","text":"间隔复习"},{"label":"B","text":"一次背熟"},{"label":"C","text":"只背不测"},{"label":"D","text":"睡前背"}]', 'A', '多节点间隔复习', 2),
(485, 243, 'I look forward to ___ from you. 填？', 'single', '[{"label":"A","text":"hearing"},{"label":"B","text":"hear"},{"label":"C","text":"heard"},{"label":"D","text":"hears"}]', 'A', 'to 是介词后接 doing', 1),
(486, 243, 'give up 的宾语是代词时位置？', 'single', '[{"label":"A","text":"give it up"},{"label":"B","text":"give up it"},{"label":"C","text":"up give it"},{"label":"D","text":"it up give"}]', 'A', '代词放中间', 2),
(487, 244, '吸烟 affects health. affects 是？', 'single', '[{"label":"A","text":"动词"},{"label":"B","text":"名词"},{"label":"C","text":"形容词"},{"label":"D","text":"副词"}]', 'A', 'affect 动词影响', 1),
(488, 244, 'price rises. rises 是？', 'single', '[{"label":"A","text":"不及物动词"},{"label":"B","text":"及物动词"},{"label":"C","text":"名词"},{"label":"D","text":"介词"}]', 'A', 'rise 不及物，raise 及物', 2),
(489, 245, '阅读信号词 however 表示？', 'single', '[{"label":"A","text":"转折"},{"label":"B","text":"因果"},{"label":"C","text":"举例"},{"label":"D","text":"总结"}]', 'A', 'however/but 转折后常是答案', 1),
(490, 245, '定位题干关键词的作用？', 'single', '[{"label":"A","text":"快速找到原文"},{"label":"B","text":"提高语速"},{"label":"C","text":"背诵单词"},{"label":"D","text":"检查拼写"}]', 'A', '专有名词数字定位', 2),
(491, 246, '长难句拆解第一步是？', 'single', '[{"label":"A","text":"找谓语动词"},{"label":"B","text":"查词典"},{"label":"C","text":"背模板"},{"label":"D","text":"找标点"}]', 'A', '谓语定位主干', 1),
(492, 246, '非谓语 done 表？', 'single', '[{"label":"A","text":"被动完成"},{"label":"B","text":"主动进行"},{"label":"C","text":"目的将来"},{"label":"D","text":"无意义"}]', 'A', 'done 被动完成', 2),
(493, 247, '段落结构是？', 'single', '[{"label":"A","text":"主题句-支撑-结论"},{"label":"B","text":"开头-结尾"},{"label":"C","text":"例子-例子"},{"label":"D","text":"随意"}]', 'A', '标准段落三要素', 1),
(494, 247, 'SEE 结构中 E 指？', 'single', '[{"label":"A","text":"解释和例子"},{"label":"B","text":"结尾"},{"label":"C","text":"开场"},{"label":"D","text":"转折"}]', 'A', 'Statement-Explanation-Example', 2),
(495, 248, 'I am writing to ___ for the position. 填？', 'single', '[{"label":"A","text":"apply"},{"label":"B","text":"applying"},{"label":"C","text":"applied"},{"label":"D","text":"application"}]', 'A', 'apply for 申请', 1),
(496, 248, '数据小幅下降用？', 'single', '[{"label":"A","text":"decrease slightly"},{"label":"B","text":"increase sharply"},{"label":"C","text":"remain stable"},{"label":"D","text":"fluctuate wildly"}]', 'A', '幅度副词搭配', 2),
(497, 249, '论文 Methods 部分常用时态？', 'single', '[{"label":"A","text":"一般过去时"},{"label":"B","text":"一般现在时"},{"label":"C","text":"将来时"},{"label":"D","text":"完成时"}]', 'A', '方法用过去时', 1),
(498, 249, 'APA 引用格式强调？', 'single', '[{"label":"A","text":"作者-年份"},{"label":"B","text":"页码-行数"},{"label":"C","text":"标题-出版社"},{"label":"D","text":"网址-日期"}]', 'A', 'APA 作者年份制', 2),
(499, 250, 'think 开头的辅音是？', 'single', '[{"label":"A","text":"/θ/"},{"label":"B","text":"/s/"},{"label":"C","text":"/t/"},{"label":"D","text":"/z/"}]', 'A', '舌尖轻咬送气', 1),
(500, 250, 'shadowing 跟读法指？', 'single', '[{"label":"A","text":"同步复述音频"},{"label":"B","text":"默读课文"},{"label":"C","text":"抄写单词"},{"label":"D","text":"背诵语法"}]', 'A', '影子跟读练语调', 2),
(501, 251, '点餐时说 Could I have... 是？', 'single', '[{"label":"A","text":"礼貌请求"},{"label":"B","text":"命令"},{"label":"C","text":"提问时间"},{"label":"D","text":"打招呼"}]', 'A', '委婉点餐表达', 1),
(502, 251, '电话中说 This is Li Wei speaking 是？', 'single', '[{"label":"A","text":"自我介绍"},{"label":"B","text":"告别"},{"label":"C","text":"道歉"},{"label":"D","text":"提问"}]', 'A', '电话固定用语', 2),
(503, 252, '精听的核心操作是？', 'single', '[{"label":"A","text":"逐句听写"},{"label":"B","text":"泛听背景音"},{"label":"C","text":"只看字幕"},{"label":"D","text":"倍速乱听"}]', 'A', '听写+对照+跟读', 1),
(504, 252, 'but 后面通常是？', 'single', '[{"label":"A","text":"答案重点"},{"label":"B","text":"废话"},{"label":"C","text":"问候"},{"label":"D","text":"结语"}]', 'A', '转折词后出题', 2),
(505, 253, '陈述句结尾一般用？', 'single', '[{"label":"A","text":"降调"},{"label":"B","text":"升调"},{"label":"C","text":"平调"},{"label":"D","text":"无调"}]', 'A', '陈述降调疑问升调', 1),
(506, 253, 'PREP 演讲结构 P 指？', 'single', '[{"label":"A","text":"观点"},{"label":"B","text":"停顿"},{"label":"C","text":"提问"},{"label":"D","text":"表演"}]', 'A', 'Point-Reason-Example-Point', 2),
(507, 254, '四六级听力分值占比？', 'single', '[{"label":"A","text":"35%"},{"label":"B","text":"15%"},{"label":"C","text":"25%"},{"label":"D","text":"45%"}]', 'A', '听力占比最高', 1),
(508, 254, '听力答题技巧是？', 'single', '[{"label":"A","text":"预读选项"},{"label":"B","text":"闭眼听"},{"label":"C","text":"逐词笔记"},{"label":"D","text":"最后猜"}]', 'A', '利用空隙预读', 2),
(509, 255, '雅思口语第二部分的卡片题需要？', 'single', '[{"label":"A","text":"独白1-2分钟"},{"label":"B","text":"写作文"},{"label":"C","text":"读课文"},{"label":"D","text":"听写"}]', 'A', '卡片独白', 1),
(510, 255, '雅思 6.5 分约等于托福？', 'single', '[{"label":"A","text":"90分"},{"label":"B","text":"60分"},{"label":"C","text":"110分"},{"label":"D","text":"80分"}]', 'A', '常见对标分数', 2),
(511, 256, 'GRE 语文满分是？', 'single', '[{"label":"A","text":"170"},{"label":"B","text":"160"},{"label":"C","text":"180"},{"label":"D","text":"150"}]', 'A', '语文数学各130-170', 1),
(512, 256, 'GRE 写作 Argument 是？', 'single', '[{"label":"A","text":"驳论文"},{"label":"B","text":"立论文"},{"label":"C","text":"说明文"},{"label":"D","text":"记叙文"}]', 'A', '找逻辑漏洞驳论', 2),
(513, 257, '测试效应指？', 'single', '[{"label":"A","text":"主动回忆更有效"},{"label":"B","text":"重读更有效"},{"label":"C","text":"抄写更有效"},{"label":"D","text":"听讲更有效"}]', 'A', '测试优于重读', 1),
(514, 257, '番茄工作法的节奏是？', 'single', '[{"label":"A","text":"25分钟+5分钟"},{"label":"B","text":"50分钟+10分钟"},{"label":"C","text":"90分钟+30分钟"},{"label":"D","text":"10分钟+5分钟"}]', 'A', '经典番茄钟', 2),
(515, 258, '邮件主题行应该？', 'single', '[{"label":"A","text":"概括要点"},{"label":"B","text":"写问候语"},{"label":"C","text":"留空"},{"label":"D","text":"写公司名"}]', 'A', '主题行明确', 1),
(516, 258, 'Please find attached... 用于？', 'single', '[{"label":"A","text":"提示附件"},{"label":"B","text":"道别"},{"label":"C","text":"道歉"},{"label":"D","text":"约时间"}]', 'A', '附件的固定表达', 2),
(517, 259, '会议中说 Let us move on 是？', 'single', '[{"label":"A","text":"推进议程"},{"label":"B","text":"结束会议"},{"label":"C","text":"提出问题"},{"label":"D","text":"道歉"}]', 'A', '主持人衔接语', 1),
(518, 259, '委婉反对用？', 'single', '[{"label":"A","text":"I see your point, but..."},{"label":"B","text":"You are wrong"},{"label":"C","text":"No!"},{"label":"D","text":"Impossible"}]', 'A', '先肯定再转折', 2),
(519, 260, 'BATNA 指？', 'single', '[{"label":"A","text":"最佳替代方案"},{"label":"B","text":"最低报价"},{"label":"C","text":"合同条款"},{"label":"D","text":"谈判对手"}]', 'A', '谈判筹码基础', 1),
(520, 260, '让步的原则是？', 'single', '[{"label":"A","text":"等价交换"},{"label":"B","text":"无底线"},{"label":"C","text":"先快后慢"},{"label":"D","text":"拒绝让步"}]', 'A', '我让步你要交换', 2),
(521, 261, '汇报开场时间占比约？', 'single', '[{"label":"A","text":"10%"},{"label":"B","text":"50%"},{"label":"C","text":"75%"},{"label":"D","text":"90%"}]', 'A', '10-75-15 分配', 1),
(522, 261, '数据占比表达用？', 'single', '[{"label":"A","text":"accounts for"},{"label":"B","text":"looks like"},{"label":"C","text":"talks about"},{"label":"D","text":"runs on"}]', 'A', '占比固定表达', 2);