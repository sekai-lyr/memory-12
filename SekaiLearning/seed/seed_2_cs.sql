-- =============================================
-- 知识库大扩充 Part2: 计算机科学 + 数据科学实战
-- courses 36-44, lessons 102-137, quiz 203-274
-- =============================================

INSERT IGNORE INTO sekai_learning_courses (id, subject_id, name, description, difficulty, estimated_hours, lesson_count, sort_order) VALUES
(36, 1, '操作系统', '进程线程与内存管理', 'intermediate', 3, 4, 1),
(37, 1, '计算机网络', 'TCP/IP 协议栈与应用', 'intermediate', 3, 4, 2),
(38, 1, '数据库与SQL', '关系模型、索引与查询优化', 'advanced', 4, 4, 3),
(39, 1, '数据结构与算法', '二叉树、堆、图与复杂度分析', 'advanced', 4, 4, 4),
(40, 1, '软件工程', 'Git、单元测试与设计模式', 'beginner', 3, 4, 5),
(41, 1, 'JavaScript与前端', 'DOM、异步与框架思维', 'beginner', 3, 4, 6),
(42, 1, '网络安全', '密码学基础与Web攻防', 'advanced', 4, 4, 7),
(43, 20, 'Python数据分析', 'NumPy/Pandas与清洗实战', 'intermediate', 4, 4, 8),
(44, 20, '机器学习入门', '监督学习、特征工程与评估', 'intermediate', 4, 4, 9);

INSERT IGNORE INTO sekai_learning_lessons (id, course_id, title, content, summary, key_points, difficulty, estimated_minutes, sort_order) VALUES
(102, 36, '进程与线程',
'进程是运行中的程序，拥有独立内存空间；线程是进程内的执行单元，共享进程资源。并发与并行：并发是交替执行，并行是同时执行。

<b>进程与线程对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">维度</th><th style="border:1px solid #999;padding:6px">进程</th><th style="border:1px solid #999;padding:6px">线程</th></tr>
<tr><td style="border:1px solid #999;padding:6px">资源</td><td style="border:1px solid #999;padding:6px">独立内存空间</td><td style="border:1px solid #999;padding:6px">共享进程内存</td></tr>
<tr><td style="border:1px solid #999;padding:6px">开销</td><td style="border:1px solid #999;padding:6px">创建/切换开销大</td><td style="border:1px solid #999;padding:6px">创建/切换开销小</td></tr>
<tr><td style="border:1px solid #999;padding:6px">通信</td><td style="border:1px solid #999;padding:6px">IPC（管道/消息/共享内存）</td><td style="border:1px solid #999;padding:6px">直接读写共享变量</td></tr>
<tr><td style="border:1px solid #999;padding:6px">崩溃影响</td><td style="border:1px solid #999;padding:6px">不影响其他进程</td><td style="border:1px solid #999;padding:6px">拖垮整个进程</td></tr>
</table>

进程三态：就绪、运行、阻塞。调度算法：先来先服务、短作业优先、时间片轮转、优先级调度。

线程同步三大件：互斥锁（mutex）保证临界区互斥、信号量（semaphore）控制并发数、条件变量等待通知。经典问题：生产者-消费者、哲学家进餐。',
'掌握进程线程区别与同步',
'["进程独立内存，线程共享","IPC与线程通信对比","三态: 就绪运行阻塞","互斥锁与信号量"]',
'intermediate', 12, 1),
(103, 36, '内存管理',
'内存管理解决"怎么放、怎么换、怎么保护"。虚拟内存让程序看到连续地址空间，物理内存按页划分。

<b>内存分配方式对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">方式</th><th style="border:1px solid #999;padding:6px">特点</th><th style="border:1px solid #999;padding:6px">缺点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">连续分配</td><td style="border:1px solid #999;padding:6px">简单直观</td><td style="border:1px solid #999;padding:6px">外部碎片</td></tr>
<tr><td style="border:1px solid #999;padding:6px">分页</td><td style="border:1px solid #999;padding:6px">固定页框无外碎片</td><td style="border:1px solid #999;padding:6px">页表开销</td></tr>
<tr><td style="border:1px solid #999;padding:6px">分段</td><td style="border:1px solid #999;padding:6px">按逻辑模块划分</td><td style="border:1px solid #999;padding:6px">段长不齐</td></tr>
<tr><td style="border:1px solid #999;padding:6px">段页式</td><td style="border:1px solid #999;padding:6px">分段+分页结合</td><td style="border:1px solid #999;padding:6px">多次访问内存</td></tr>
</table>

虚拟内存与页面置换：缺页时换入换出。经典算法：FIFO、LRU（最近最久未使用）、OPT（最优但不可实现）。LRU 用链表+哈希实现 O(1)。

快表 TLB 缓存页表项加速地址转换。局部性原理：时间局部性（刚访问的还会访问）、空间局部性（邻近地址可能访问），是缓存与预取的理论基础。

典型面试：一个进程 4GB 虚拟地址空间，物理内存 1GB，如何运行？答案：虚拟内存+按需分页。',
'掌握分页与页面置换',
'["分页无外部碎片","LRU最优可实现","局部性原理","虚拟内存按需加载"]',
'intermediate', 12, 2),
(104, 36, '文件系统',
'文件系统管理磁盘上的数据。ext4、NTFS、APFS 是主流文件系统。文件由目录项管理，目录是文件索引的树。

<b>文件系统结构对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">文件系统</th><th style="border:1px solid #999;padding:6px">平台</th><th style="border:1px solid #999;padding:6px">特性</th></tr>
<tr><td style="border:1px solid #999;padding:6px">ext4</td><td style="border:1px solid #999;padding:6px">Linux</td><td style="border:1px solid #999;padding:6px">日志、大文件</td></tr>
<tr><td style="border:1px solid #999;padding:6px">NTFS</td><td style="border:1px solid #999;padding:6px">Windows</td><td style="border:1px solid #999;padding:6px">权限、压缩、加密</td></tr>
<tr><td style="border:1px solid #999;padding:6px">APFS</td><td style="border:1px solid #999;padding:6px">macOS</td><td style="border:1px solid #999;padding:6px">快照、克隆</td></tr>
<tr><td style="border:1px solid #999;padding:6px">HDFS</td><td style="border:1px solid #999;padding:6px">Hadoop</td><td style="border:1px solid #999;padding:6px">分布式、副本3份</td></tr>
</table>

文件在磁盘上的组织：连续分配（顺序读快，碎片）、链式分配（随机访问慢）、索引分配（inode 存块指针）。Linux inode 存元数据：权限、大小、时间戳、块指针。

硬链接 vs 软链接：硬链接共享 inode 计数，删除源文件链接仍有效；软链接是独立文件存目标路径，源文件删除则失效。

日志文件系统（journal）：先写日志再写数据，崩溃后通过日志恢复一致状态，ext3 引入后成为标配。',
'掌握文件系统与inode',
'["inode存元数据","硬链接共享inode","软链接依赖源路径","日志文件系统防崩溃"]',
'intermediate', 12, 3),
(105, 36, '并发与死锁',
'死锁四条件：互斥、持有并等待、不可剥夺、循环等待。破坏任一条件即可避免死锁。

<b>死锁处理策略对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">策略</th><th style="border:1px solid #999;padding:6px">做法</th><th style="border:1px solid #999;padding:6px">代价</th></tr>
<tr><td style="border:1px solid #999;padding:6px">预防</td><td style="border:1px solid #999;padding:6px">破坏四个条件之一</td><td style="border:1px solid #999;padding:6px">资源利用率低</td></tr>
<tr><td style="border:1px solid #999;padding:6px">避免</td><td style="border:1px solid #999;padding:6px">银行家算法判断安全</td><td style="border:1px solid #999;padding:6px">需要未来需求信息</td></tr>
<tr><td style="border:1px solid #999;padding:6px">检测</td><td style="border:1px solid #999;padding:6px">资源分配图找环</td><td style="border:1px solid #999;padding:6px">发现时已死锁</td></tr>
<tr><td style="border:1px solid #999;padding:6px">解除</td><td style="border:1px solid #999;padding:6px">杀死进程/回滚</td><td style="border:1px solid #999;padding:6px">部分工作丢失</td></tr>
</table>

并发编程常见坑：竞态条件（race condition）— 多个线程读写共享变量结果不确定。解决：加锁、原子操作、线程安全数据结构。

原子性、可见性、有序性三问题：volatile 保证可见性，synchronized/CAS 保证原子性，内存屏障保证有序性。

经典死锁案例：两个线程各自持有一把锁又等待对方锁。锁顺序一致（lock ordering）可避免循环等待。超时锁（tryLock 带超时）是工程常用兜底。',
'掌握死锁四条件与对策',
'["死锁四条件","银行家算法","竞态条件需加锁","锁顺序一致防死锁"]',
'intermediate', 12, 4),

(106, 37, 'TCP/IP协议栈',
'网络分层是分治思想的体现。TCP/IP 四层模型：链路层、网络层、传输层、应用层。数据逐层封装，接收逐层解封。

<b>TCP/IP 四层模型与协议表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">层次</th><th style="border:1px solid #999;padding:6px">职责</th><th style="border:1px solid #999;padding:6px">代表协议</th><th style="border:1px solid #999;padding:6px">PDU</th></tr>
<tr><td style="border:1px solid #999;padding:6px">应用层</td><td style="border:1px solid #999;padding:6px">进程间通信</td><td style="border:1px solid #999;padding:6px">HTTP, FTP, DNS, SMTP</td><td style="border:1px solid #999;padding:6px">报文</td></tr>
<tr><td style="border:1px solid #999;padding:6px">传输层</td><td style="border:1px solid #999;padding:6px">端到端可靠传输</td><td style="border:1px solid #999;padding:6px">TCP, UDP</td><td style="border:1px solid #999;padding:6px">段</td></tr>
<tr><td style="border:1px solid #999;padding:6px">网络层</td><td style="border:1px solid #999;padding:6px">寻址与路由</td><td style="border:1px solid #999;padding:6px">IP, ICMP, ARP</td><td style="border:1px solid #999;padding:6px">分组</td></tr>
<tr><td style="border:1px solid #999;padding:6px">链路层</td><td style="border:1px solid #999;padding:6px">帧传输</td><td style="border:1px solid #999;padding:6px">以太网, WiFi</td><td style="border:1px solid #999;padding:6px">帧</td></tr>
</table>

TCP 与 UDP：TCP 面向连接、可靠、有序、有流量控制；UDP 无连接、尽力而为、低延迟。视频直播用 UDP，网页用 TCP。

TCP 三次握手建立连接：SYN→SYN+ACK→ACK。四次挥手断开：FIN→ACK→FIN→ACK，等待 2MSL 关闭。可靠传输靠序列号+确认+重传。

经典题：为什么挥手要 4 次？因为半关闭，双方各自独立关闭发送方向。',
'掌握分层模型与TCP特性',
'["四层模型与协议对应","TCP可靠UDP高效","三次握手四次挥手","数据逐层封装"]',
'intermediate', 12, 1),
(107, 37, 'IP与路由',
'IP 地址是网络层的"门牌号"。IPv4 32 位，IPv6 128 位。子网掩码划分网络号与主机号。

<b>IP 地址分类表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类别</th><th style="border:1px solid #999;padding:6px">首段范围</th><th style="border:1px solid #999;padding:6px">用途</th><th style="border:1px solid #999;padding:6px">私有地址</th></tr>
<tr><td style="border:1px solid #999;padding:6px">A类</td><td style="border:1px solid #999;padding:6px">1-126</td><td style="border:1px solid #999;padding:6px">大型网络</td><td style="border:1px solid #999;padding:6px">10.0.0.0/8</td></tr>
<tr><td style="border:1px solid #999;padding:6px">B类</td><td style="border:1px solid #999;padding:6px">128-191</td><td style="border:1px solid #999;padding:6px">中型网络</td><td style="border:1px solid #999;padding:6px">172.16.0.0/12</td></tr>
<tr><td style="border:1px solid #999;padding:6px">C类</td><td style="border:1px solid #999;padding:6px">192-223</td><td style="border:1px solid #999;padding:6px">小型网络</td><td style="border:1px solid #999;padding:6px">192.168.0.0/16</td></tr>
<tr><td style="border:1px solid #999;padding:6px">特殊</td><td style="border:1px solid #999;padding:6px">127.0.0.1</td><td style="border:1px solid #999;padding:6px">本机回环</td><td style="border:1px solid #999;padding:6px">-</td></tr>
</table>

CIDR 表示：192.168.1.0/24 表示前 24 位是网络号。子网划分就是借主机位做子网位。NAT 让私有 IP 上网，缓解 IPv4 枯竭。

路由协议：RIP（跳数，小网络）、OSPF（链路状态，企业）、BGP（自治系统间，互联网骨干）。路由选择原则：最短路径优先。

DHCP 自动分配 IP：Discover→Offer→Request→ACK 四步。DNS 把域名解析成 IP：递归查询+迭代查询。',
'掌握IP分类与CIDR',
'["A/B/C类私有地址","CIDR子网划分","NAT缓解IPv4枯竭","DNS解析域名"]',
'intermediate', 12, 2),
(108, 37, 'HTTP与HTTPS',
'HTTP 是无状态应用层协议，请求-响应模型。HTTP/1.1 持久连接，HTTP/2 多路复用，HTTP/3 基于 QUIC/UDP。

<b>HTTP 方法对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">方法</th><th style="border:1px solid #999;padding:6px">语义</th><th style="border:1px solid #999;padding:6px">幂等</th><th style="border:1px solid #999;padding:6px">示例</th></tr>
<tr><td style="border:1px solid #999;padding:6px">GET</td><td style="border:1px solid #999;padding:6px">获取资源</td><td style="border:1px solid #999;padding:6px">是</td><td style="border:1px solid #999;padding:6px">打开网页</td></tr>
<tr><td style="border:1px solid #999;padding:6px">POST</td><td style="border:1px solid #999;padding:6px">提交数据创建</td><td style="border:1px solid #999;padding:6px">否</td><td style="border:1px solid #999;padding:6px">登录注册</td></tr>
<tr><td style="border:1px solid #999;padding:6px">PUT</td><td style="border:1px solid #999;padding:6px">整体更新</td><td style="border:1px solid #999;padding:6px">是</td><td style="border:1px solid #999;padding:6px">改头像</td></tr>
<tr><td style="border:1px solid #999;padding:6px">PATCH</td><td style="border:1px solid #999;padding:6px">部分更新</td><td style="border:1px solid #999;padding:6px">否</td><td style="border:1px solid #999;padding:6px">改昵称</td></tr>
<tr><td style="border:1px solid #999;padding:6px">DELETE</td><td style="border:1px solid #999;padding:6px">删除资源</td><td style="border:1px solid #999;padding:6px">是</td><td style="border:1px solid #999;padding:6px">删评论</td></tr>
</table>

状态码五类：1xx 信息、2xx 成功（200 OK）、3xx 重定向（301 永久、302 临时、304 缓存）、4xx 客户端错误（400 参数错、401 未认证、403 禁止、404 不存在）、5xx 服务端错误（500、502 网关错、503 过载）。

HTTPS = HTTP + TLS：证书验证身份、对称密钥加密数据（AES）、非对称密钥交换密钥（RSA/ECDHE）。加密过程：握手交换对称密钥→应用数据对称加密。

Cookie 与 Session：Cookie 存客户端，Session 存服务端。JWT 无状态认证：三部分 header.payload.signature，签名防篡改。',
'掌握HTTP方法与状态码',
'["GET幂等POST不幂等","4xx客户端5xx服务端","HTTPS三层安全机制","Cookie vs Session vs JWT"]',
'intermediate', 12, 3),
(109, 37, '网络诊断与工具',
'网络问题排查是工程师基本功。从底层往上查：链路→网络→传输→应用。常用工具：ping、traceroute、nslookup、curl、tcpdump。

<b>网络诊断工具表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">工具</th><th style="border:1px solid #999;padding:6px">用途</th><th style="border:1px solid #999;padding:6px">常用参数</th></tr>
<tr><td style="border:1px solid #999;padding:6px">ping</td><td style="border:1px solid #999;padding:6px">连通性与RTT</td><td style="border:1px solid #999;padding:6px">-c 次数, -t 持续</td></tr>
<tr><td style="border:1px solid #999;padding:6px">traceroute</td><td style="border:1px solid #999;padding:6px">路径追踪</td><td style="border:1px solid #999;padding:6px">每跳延迟</td></tr>
<tr><td style="border:1px solid #999;padding:6px">nslookup/dig</td><td style="border:1px solid #999;padding:6px">DNS 查询</td><td style="border:1px solid #999;padding:6px">-type=A/MX</td></tr>
<tr><td style="border:1px solid #999;padding:6px">curl</td><td style="border:1px solid #999;padding:6px">HTTP 请求调试</td><td style="border:1px solid #999;padding:6px">-v 详情, -X 方法</td></tr>
<tr><td style="border:1px solid #999;padding:6px">tcpdump</td><td style="border:1px solid #999;padding:6px">抓包分析</td><td style="border:1px solid #999;padding:6px">-i 网卡, port 端口</td></tr>
<tr><td style="border:1px solid #999;padding:6px">netstat/ss</td><td style="border:1px solid #999;padding:6px">端口与连接</td><td style="border:1px solid #999;padding:6px">-tlnp 监听列表</td></tr>
</table>

排查思路：ping 不通先查链路与防火墙；能 ping 通但网页打不开查 HTTP/代理/DNS；时快时慢查 MTU 与丢包率；tcpdump 抓包看 TCP 重传与 RST。

抓包分析经典：三次握手 SYN 回 SYN-ACK，正常；反复 SYN 重传可能是对端防火墙丢包；RST 频繁可能是端口关闭或安全软件。

HTTP 性能指标：TTFB（首字节）、DNS 解析时间、TCP 连接时间、TLS 握手时间。Chrome DevTools 的 Network 面板逐项排查。',
'掌握网络排查工具链',
'["ping查连通traceroute查路径","curl调试HTTP","tcpdump抓包分析","TTFB与各阶段耗时"]',
'intermediate', 12, 4),

(110, 38, '关系模型与SQL',
'关系模型：表=关系，行=元组，列=属性。主键唯一标识行，外键建立表间联系。SQL 分为 DDL/DML/DCL。

<b>SQL 语句分类表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类别</th><th style="border:1px solid #999;padding:6px">命令</th><th style="border:1px solid #999;padding:6px">用途</th></tr>
<tr><td style="border:1px solid #999;padding:6px">DDL</td><td style="border:1px solid #999;padding:6px">CREATE/ALTER/DROP</td><td style="border:1px solid #999;padding:6px">定义表结构</td></tr>
<tr><td style="border:1px solid #999;padding:6px">DML</td><td style="border:1px solid #999;padding:6px">SELECT/INSERT/UPDATE/DELETE</td><td style="border:1px solid #999;padding:6px">操作数据</td></tr>
<tr><td style="border:1px solid #999;padding:6px">DCL</td><td style="border:1px solid #999;padding:6px">GRANT/REVOKE</td><td style="border:1px solid #999;padding:6px">权限控制</td></tr>
<tr><td style="border:1px solid #999;padding:6px">TCL</td><td style="border:1px solid #999;padding:6px">COMMIT/ROLLBACK</td><td style="border:1px solid #999;padding:6px">事务管理</td></tr>
</table>

查询执行顺序：FROM→WHERE→GROUP BY→HAVING→SELECT→ORDER BY→LIMIT。牢记顺序才能写出正确 SQL。

JOIN 类型：INNER JOIN 两表匹配；LEFT JOIN 左表全保留；RIGHT JOIN 右表全保留；FULL OUTER JOIN 全保留（MySQL 用 UNION 模拟）。

聚合函数配 GROUP BY：SUM/AVG/COUNT/MAX/MIN。HAVING 过滤分组（作用于分组后），WHERE 过滤行（作用于分组前）。',
'掌握SQL查询执行顺序',
'["FROM→WHERE→GROUP→HAVING→SELECT→ORDER","LEFT JOIN左表全保留","HAVING过滤分组","主外键关系"]',
'intermediate', 12, 1),
(111, 38, '索引原理',
'索引是"书的目录"，加速查询但增加写入成本。MySQL InnoDB 默认 B+ 树索引，叶子节点存数据行。

<b>索引类型对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类型</th><th style="border:1px solid #999;padding:6px">特点</th><th style="border:1px solid #999;padding:6px">适用场景</th></tr>
<tr><td style="border:1px solid #999;padding:6px">主键索引</td><td style="border:1px solid #999;padding:6px">聚簇，叶子存整行</td><td style="border:1px solid #999;padding:6px">按ID查</td></tr>
<tr><td style="border:1px solid #999;padding:6px">唯一索引</td><td style="border:1px solid #999;padding:6px">值不重复</td><td style="border:1px solid #999;padding:6px">用户名等</td></tr>
<tr><td style="border:1px solid #999;padding:6px">普通索引</td><td style="border:1px solid #999;padding:6px">可重复，非聚簇</td><td style="border:1px solid #999;padding:6px">高频查询列</td></tr>
<tr><td style="border:1px solid #999;padding:6px">联合索引</td><td style="border:1px solid #999;padding:6px">多列组合</td><td style="border:1px solid #999;padding:6px">多条件过滤</td></tr>
<tr><td style="border:1px solid #999;padding:6px">覆盖索引</td><td style="border:1px solid #999;padding:6px">查询列都在索引</td><td style="border:1px solid #999;padding:6px">避免回表</td></tr>
</table>

B+ 树特点：矮胖（扇出大），层数少（千万级 3-4 层）；叶子链表连接，范围查询高效；非叶子只存键。

索引失效场景：最左前缀失效（跳过联合索引首列）、对列做函数运算、隐式类型转换、LIKE 以 % 开头、OR 连接非索引列。

explain 查看执行计划：type 从 all→index→range→ref→const 逐渐变好，key 显示使用的索引，rows 估算扫描行数。',
'掌握B+树与索引优化',
'["B+树矮胖三层查千万","最左前缀原则","覆盖索引避免回表","explain看type和rows"]',
'advanced', 12, 2),
(112, 38, '事务与隔离级别',
'事务保证 ACID：原子性、一致性、隔离性、持久性。并发事务引发三个问题：脏读、不可重复读、幻读。

<b>隔离级别与问题对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">隔离级别</th><th style="border:1px solid #999;padding:6px">脏读</th><th style="border:1px solid #999;padding:6px">不可重复读</th><th style="border:1px solid #999;padding:6px">幻读</th></tr>
<tr><td style="border:1px solid #999;padding:6px">读未提交</td><td style="border:1px solid #999;padding:6px">可能</td><td style="border:1px solid #999;padding:6px">可能</td><td style="border:1px solid #999;padding:6px">可能</td></tr>
<tr><td style="border:1px solid #999;padding:6px">读已提交</td><td style="border:1px solid #999;padding:6px">避免</td><td style="border:1px solid #999;padding:6px">可能</td><td style="border:1px solid #999;padding:6px">可能</td></tr>
<tr><td style="border:1px solid #999;padding:6px">可重复读</td><td style="border:1px solid #999;padding:6px">避免</td><td style="border:1px solid #999;padding:6px">避免</td><td style="border:1px solid #999;padding:6px">MySQL默认仍避免</td></tr>
<tr><td style="border:1px solid #999;padding:6px">串行化</td><td style="border:1px solid #999;padding:6px">避免</td><td style="border:1px solid #999;padding:6px">避免</td><td style="border:1px solid #999;padding:6px">避免</td></tr>
</table>

MySQL InnoDB 默认可重复读，靠 MVCC（多版本并发控制）+ 间隙锁解决幻读。MVCC 用隐藏列版本号实现快照读，不加锁读历史版本。

锁机制：表锁（粒度大）、行锁（粒度细）、间隙锁（锁范围防插入）、意向锁（兼容表行锁）。死锁处理：InnoDB 检测到死锁回滚其中一个事务。

redo log 保证持久性（崩溃恢复），undo log 保证原子性与回滚，binlog 做主从复制与数据恢复。三日志是 MySQL 可靠性的基石。',
'掌握ACID与隔离级别',
'["脏读/不可重复读/幻读","MVCC多版本并发控制","可重复读+间隙锁","redo/undo/binlog三日志"]',
'advanced', 12, 3),
(113, 38, '查询优化与分库分表',
'慢查询治理：定位慢 SQL→explain 分析→索引优化→改写 SQL→架构拆分。优化目标是减少扫描行数与回表次数。

<b>SQL 优化手段对照表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">手段</th><th style="border:1px solid #999;padding:6px">做法</th><th style="border:1px solid #999;padding:6px">收益</th></tr>
<tr><td style="border:1px solid #999;padding:6px">加索引</td><td style="border:1px solid #999;padding:6px">高频条件列建索引</td><td style="border:1px solid #999;padding:6px">全表扫变索引扫</td></tr>
<tr><td style="border:1px solid #999;padding:6px">覆盖索引</td><td style="border:1px solid #999;padding:6px">查询列并入索引</td><td style="border:1px solid #999;padding:6px">避免回表</td></tr>
<tr><td style="border:1px solid #999;padding:6px">避免 SELECT *</td><td style="border:1px solid #999;padding:6px">只查需要的列</td><td style="border:1px solid #999;padding:6px">减少IO</td></tr>
<tr><td style="border:1px solid #999;padding:6px">分页优化</td><td style="border:1px solid #999;padding:6px">延迟关联/游标分页</td><td style="border:1px solid #999;padding:6px">深分页不慢</td></tr>
<tr><td style="border:1px solid #999;padding:6px">批量操作</td><td style="border:1px solid #999;padding:6px">批量INSERT减少往返</td><td style="border:1px solid #999;padding:6px">吞吐提升</td></tr>
<tr><td style="border:1px solid #999;padding:6px">读写分离</td><td style="border:1px solid #999;padding:6px">主写从读</td><td style="border:1px solid #999;padding:6px">读压力分摊</td></tr>
</table>

深分页问题：LIMIT 100000,10 要扫 10 万行。优化：WHERE id>上页最大id 的游标方式，或延迟关联先取 id 再 join 回表。

分库分表：垂直拆分（按业务模块分库）、水平拆分（按 ID/时间分表）。分片键选择决定数据均匀性。取模、一致性哈希、范围分片是三种策略。

分库分表带来的问题：跨库 join 变多次查询、分布式事务、全局唯一 ID（雪花算法）、数据迁移双写。多数业务先用缓存+读写分离，最后才分库分表。',
'掌握SQL优化与分库分表',
'["慢SQL定位与explain","深分页游标优化","水平垂直拆分","雪花算法全局ID"]',
'advanced', 12, 4),

(114, 39, '复杂度分析',
'算法效率看时间复杂度和空间复杂度。大 O 表示法描述增长趋势，忽略常数与低阶项。

<b>复杂度量级对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">复杂度</th><th style="border:1px solid #999;padding:6px">名称</th><th style="border:1px solid #999;padding:6px">n=100万时</th><th style="border:1px solid #999;padding:6px">典型算法</th></tr>
<tr><td style="border:1px solid #999;padding:6px">O(1)</td><td style="border:1px solid #999;padding:6px">常数</td><td style="border:1px solid #999;padding:6px">1步</td><td style="border:1px solid #999;padding:6px">哈希查找</td></tr>
<tr><td style="border:1px solid #999;padding:6px">O(log n)</td><td style="border:1px solid #999;padding:6px">对数</td><td style="border:1px solid #999;padding:6px">约20步</td><td style="border:1px solid #999;padding:6px">二分查找</td></tr>
<tr><td style="border:1px solid #999;padding:6px">O(n)</td><td style="border:1px solid #999;padding:6px">线性</td><td style="border:1px solid #999;padding:6px">100万步</td><td style="border:1px solid #999;padding:6px">遍历数组</td></tr>
<tr><td style="border:1px solid #999;padding:6px">O(n log n)</td><td style="border:1px solid #999;padding:6px">线性对数</td><td style="border:1px solid #999;padding:6px">2000万步</td><td style="border:1px solid #999;padding:6px">快排/归并</td></tr>
<tr><td style="border:1px solid #999;padding:6px">O(n²)</td><td style="border:1px solid #999;padding:6px">平方</td><td style="border:1px solid #999;padding:6px">10¹²步</td><td style="border:1px solid #999;padding:6px">冒泡/嵌套循环</td></tr>
<tr><td style="border:1px solid #999;padding:6px">O(2ⁿ)</td><td style="border:1px solid #999;padding:6px">指数</td><td style="border:1px solid #999;padding:6px">不可行</td><td style="border:1px solid #999;padding:6px">穷举子集</td></tr>
</table>

计算技巧：循环嵌套相乘、递归用主定理（T(n)=aT(n/b)+O(nᵈ)），二分递归 O(log n)，归并递归 O(n log n)。

均摊分析：动态数组扩容，每次扩容复制一倍，均摊 O(1) 插入。摊还思想让"偶尔贵"的操作整体便宜。

空间复杂度：额外开数组 O(n)，原地算法 O(1)。工程上常牺牲空间换时间（哈希、缓存）。',
'掌握大O分析与主定理',
'["大O忽略常数低阶","主定理分析递归","均摊分析动态数组","空间换时间思想"]',
'advanced', 12, 1),
(115, 39, '树与二叉树',
'树是分层数据结构。二叉树每个节点最多两个子节点。二叉搜索树左小右大。平衡二叉树保证高度 O(log n)。

<b>树的遍历方式表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">遍历</th><th style="border:1px solid #999;padding:6px">顺序</th><th style="border:1px solid #999;padding:6px">用途</th></tr>
<tr><td style="border:1px solid #999;padding:6px">前序</td><td style="border:1px solid #999;padding:6px">根-左-右</td><td style="border:1px solid #999;padding:6px">复制树</td></tr>
<tr><td style="border:1px solid #999;padding:6px">中序</td><td style="border:1px solid #999;padding:6px">左-根-右</td><td style="border:1px solid #999;padding:6px">BST排序输出</td></tr>
<tr><td style="border:1px solid #999;padding:6px">后序</td><td style="border:1px solid #999;padding:6px">左-右-根</td><td style="border:1px solid #999;padding:6px">删除树、表达式求值</td></tr>
<tr><td style="border:1px solid #999;padding:6px">层序</td><td style="border:1px solid #999;padding:6px">逐层从左到右</td><td style="border:1px solid #999;padding:6px">BFS、最短层级</td></tr>
</table>

二叉树性质：第 k 层最多 2^(k-1) 个节点；n0=n2+1（叶节点=二度节点+1）；n 个节点完全二叉树深度 ⌊log₂n⌋+1。

平衡树家族：AVL 严格平衡（左右高差≤1，插入最多两次旋转）、红黑树弱平衡（保证最长路径不超最短 2 倍，Java TreeMap 用它）。

堆：完全二叉树，最大堆父≥子。堆排序 O(n log n)，优先队列用堆实现。堆的插入上浮、删除下沉。',
'掌握二叉树遍历与平衡',
'["中序遍历BST有序","n0=n2+1叶节点公式","AVL严格红黑弱平衡","堆上浮下沉"]',
'advanced', 12, 2),
(116, 39, '哈希与字符串',
'哈希表 O(1) 查增删。哈希函数把 key 映射到槽位，冲突用链地址法（链表）或开放寻址法。

<b>哈希冲突解决对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">方法</th><th style="border:1px solid #999;padding:6px">思路</th><th style="border:1px solid #999;padding:6px">优缺点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">链地址法</td><td style="border:1px solid #999;padding:6px">同槽位挂链表</td><td style="border:1px solid #999;padding:6px">实现简单，Java采用</td></tr>
<tr><td style="border:1px solid #999;padding:6px">线性探测</td><td style="border:1px solid #999;padding:6px">向后找空位</td><td style="border:1px solid #999;padding:6px">聚集问题</td></tr>
<tr><td style="border:1px solid #999;padding:6px">二次探测</td><td style="border:1px solid #999;padding:6px">按平方步长找</td><td style="border:1px solid #999;padding:6px">缓解聚集</td></tr>
<tr><td style="border:1px solid #999;padding:6px">双重哈希</td><td style="border:1px solid #999;padding:6px">两个哈希函数</td><td style="border:1px solid #999;padding:6px">分布更均匀</td></tr>
</table>

HashMap 原理（Java）：数组+链表+红黑树。负载因子 0.75，超过则扩容 2 倍。哈希扰动函数减少碰撞。为什么容量是 2 的幂：位运算取模更快。

字符串匹配：朴素 O(nm)、KMP 用 next 数组 O(n+m)、Boyer-Moore、Rabin-Karp 滚动哈希。KMP 核心：失配时利用已匹配信息跳转。

经典字符串题：最长回文子串（马拉车 O(n)）、Trie 字典树前缀匹配、Z 函数。海量数据处理常用：布隆过滤器（可能存在误判，绝不漏判）。',
'掌握哈希表与KMP',
'["链地址法解决冲突","HashMap负载因子0.75","KMP O(n+m)","布隆过滤器可假阳性"]',
'advanced', 12, 3),
(117, 39, '动态规划与贪心',
'动态规划解决重叠子问题+最优子结构的问题。核心四步：定义状态→转移方程→初始化→边界。记忆化搜索是递归版 DP。

<b>经典DP问题解法表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">问题</th><th style="border:1px solid #999;padding:6px">状态定义</th><th style="border:1px solid #999;padding:6px">转移方程</th><th style="border:1px solid #999;padding:6px">复杂度</th></tr>
<tr><td style="border:1px solid #999;padding:6px">斐波那契</td><td style="border:1px solid #999;padding:6px">dp[i]</td><td style="border:1px solid #999;padding:6px">dp[i]=dp[i-1]+dp[i-2]</td><td style="border:1px solid #999;padding:6px">O(n)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">爬楼梯</td><td style="border:1px solid #999;padding:6px">dp[i]</td><td style="border:1px solid #999;padding:6px">dp[i]=dp[i-1]+dp[i-2]</td><td style="border:1px solid #999;padding:6px">O(n)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">0-1背包</td><td style="border:1px solid #999;padding:6px">dp[i][w]</td><td style="border:1px solid #999;padding:6px">max(不选, 选)+价值</td><td style="border:1px solid #999;padding:6px">O(nW)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">最长公共子序列</td><td style="border:1px solid #999;padding:6px">dp[i][j]</td><td style="border:1px solid #999;padding:6px">相等+1否则取max</td><td style="border:1px solid #999;padding:6px">O(nm)</td></tr>
<tr><td style="border:1px solid #999;padding:6px">编辑距离</td><td style="border:1px solid #999;padding:6px">dp[i][j]</td><td style="border:1px solid #999;padding:6px">替换/插入/删除取min</td><td style="border:1px solid #999;padding:6px">O(nm)</td></tr>
</table>

贪心 vs DP：贪心每步选局部最优且不回退（活动选择、哈夫曼编码、找零钱特例）；DP 需要权衡全部选择。判断标准：贪心选择性质+最优子结构。

滚动数组优化：二维 DP 压成一维，背包注意倒序遍历防止重复选取。

面试黄金题：接雨水（单调栈/双指针）、股票买卖系列（状态机 DP）、打家劫舍（选与不选）。',
'掌握DP四步与贪心选择',
'["DP四步: 状态/转移/初始化/边界","0-1背包与LCS","贪心不回退","滚动数组空间优化"]',
'advanced', 12, 4),

(118, 40, 'Git版本控制',
'Git 是分布式版本控制系统，本地即完整仓库。三大区域：工作区、暂存区、本地仓库。文件三状态：modified、staged、committed。

<b>Git 常用命令速查表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">场景</th><th style="border:1px solid #999;padding:6px">命令</th><th style="border:1px solid #999;padding:6px">说明</th></tr>
<tr><td style="border:1px solid #999;padding:6px">初始化</td><td style="border:1px solid #999;padding:6px">git init / clone</td><td style="border:1px solid #999;padding:6px">建库/克隆</td></tr>
<tr><td style="border:1px solid #999;padding:6px">提交</td><td style="border:1px solid #999;padding:6px">git add && commit</td><td style="border:1px solid #999;padding:6px">暂存+提交</td></tr>
<tr><td style="border:1px solid #999;padding:6px">分支</td><td style="border:1px solid #999;padding:6px">branch/checkout/merge</td><td style="border:1px solid #999;padding:6px">分支管理</td></tr>
<tr><td style="border:1px solid #999;padding:6px">远程</td><td style="border:1px solid #999;padding:6px">push/pull/fetch</td><td style="border:1px solid #999;padding:6px">同步远端</td></tr>
<tr><td style="border:1px solid #999;padding:6px">回退</td><td style="border:1px solid #999;padding:6px">reset/revert</td><td style="border:1px solid #999;padding:6px">reset删历史，revert留记录</td></tr>
<tr><td style="border:1px solid #999;padding:6px">查看</td><td style="border:1px solid #999;padding:6px">log/status/diff</td><td style="border:1px solid #999;padding:6px">查历史状态差异</td></tr>
</table>

工作流：git pull 最新→建 feature 分支→开发提交→推送→开 PR→code review→合并。主流分支模型：Git Flow（版本发布）与 GitHub Flow（持续部署）。

冲突解决：合并时两边改同一处。解决方式：手动编辑冲突标记（======= 分隔）后 add+commit。避免冲突：小步提交、频繁同步、分工明确。

好提交规范：动词开头（feat 新功能、fix 修复、refactor 重构）、一个提交一件事、写清楚 why 而不是 what。',
'掌握Git核心工作流',
'["三区三状态","分支模型Git Flow","解决合并冲突","提交信息规范"]',
'beginner', 12, 1),
(119, 40, '单元测试',
'单元测试验证最小功能单元。测试金字塔：单元测试多且快、集成测试中、E2E 少且慢。TDD：先写测试再写实现。

<b>测试框架速查表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">语言</th><th style="border:1px solid #999;padding:6px">框架</th><th style="border:1px solid #999;padding:6px">断言风格</th></tr>
<tr><td style="border:1px solid #999;padding:6px">Java</td><td style="border:1px solid #999;padding:6px">JUnit5+Mockito</td><td style="border:1px solid #999;padding:6px">assertEquals</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Python</td><td style="border:1px solid #999;padding:6px">pytest</td><td style="border:1px solid #999;padding:6px">assert 表达式</td></tr>
<tr><td style="border:1px solid #999;padding:6px">JavaScript</td><td style="border:1px solid #999;padding:6px">Jest</td><td style="border:1px solid #999;padding:6px">expect(x).toBe</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Go</td><td style="border:1px solid #999;padding:6px">testing</td><td style="border:1px solid #999;padding:6px">t.Errorf</td></tr>
</table>

测试原则 F.I.R.S.T.：Fast 快、Independent 独立、Repeatable 可重复、Self-validating 自验证、Timely 及时。

Mock 与 Stub：Mock 验证调用行为，Stub 提供固定返回值。外部依赖（数据库、网络）用 Mock 隔离，保证测试确定性。

覆盖率不是目的：行覆盖率高≠测试好。重点测：边界条件、异常路径、核心业务逻辑。用例命名：given_when_then 三段式。',
'掌握单元测试原则',
'["测试金字塔","F.I.R.S.T原则","Mock隔离外部依赖","覆盖边界与异常"]',
'beginner', 12, 2),
(120, 40, '设计模式',
'设计模式是解决重复设计问题的成熟方案。23 种 GoF 模式分三类：创建型、结构型、行为型。核心思想：面向接口、组合优于继承。

<b>常用设计模式速查表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">模式</th><th style="border:1px solid #999;padding:6px">类别</th><th style="border:1px solid #999;padding:6px">解决什么</th><th style="border:1px solid #999;padding:6px">典型应用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">单例</td><td style="border:1px solid #999;padding:6px">创建型</td><td style="border:1px solid #999;padding:6px">全局唯一实例</td><td style="border:1px solid #999;padding:6px">配置类</td></tr>
<tr><td style="border:1px solid #999;padding:6px">工厂</td><td style="border:1px solid #999;padding:6px">创建型</td><td style="border:1px solid #999;padding:6px">解耦创建与使用</td><td style="border:1px solid #999;padding:6px">对象池</td></tr>
<tr><td style="border:1px solid #999;padding:6px">观察者</td><td style="border:1px solid #999;padding:6px">行为型</td><td style="border:1px solid #999;padding:6px">一对多通知</td><td style="border:1px solid #999;padding:6px">事件总线</td></tr>
<tr><td style="border:1px solid #999;padding:6px">策略</td><td style="border:1px solid #999;padding:6px">行为型</td><td style="border:1px solid #999;padding:6px">算法族可互换</td><td style="border:1px solid #999;padding:6px">支付渠道</td></tr>
<tr><td style="border:1px solid #999;padding:6px">装饰器</td><td style="border:1px solid #999;padding:6px">结构型</td><td style="border:1px solid #999;padding:6px">动态增强功能</td><td style="border:1px solid #999;padding:6px">IO流包装</td></tr>
<tr><td style="border:1px solid #999;padding:6px">代理</td><td style="border:1px solid #999;padding:6px">结构型</td><td style="border:1px solid #999;padding:6px">控制访问</td><td style="border:1px solid #999;padding:6px">AOP事务</td></tr>
</table>

SOLID 原则：单一职责、开闭原则（对扩展开放对修改关闭）、里氏替换、接口隔离、依赖倒置。设计模式是 SOLID 的具体实践。

组合优于继承：继承耦合强、脆弱的基类问题；组合灵活扩展。策略模式就是组合的典型。

过度设计警告：为用模式而用模式是反模式。先写简单代码，出现重复或扩展需求时再重构引入模式。KISS、YAGNI 优先。',
'掌握SOLID与常用模式',
'["23种模式三大类","SOLID五原则","组合优于继承","避免过度设计"]',
'intermediate', 12, 3),
(121, 40, '敏捷与DevOps',
'敏捷开发应对需求变化。Scrum 框架：Sprint 迭代、每日站会、产品待办列表、冲刺回顾。看板可视化工作流。

<b>开发方法对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">方法</th><th style="border:1px solid #999;padding:6px">核心</th><th style="border:1px solid #999;padding:6px">周期</th><th style="border:1px solid #999;padding:6px">适合</th></tr>
<tr><td style="border:1px solid #999;padding:6px">瀑布</td><td style="border:1px solid #999;padding:6px">阶段线性推进</td><td style="border:1px solid #999;padding:6px">数月-年</td><td style="border:1px solid #999;padding:6px">需求稳定</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Scrum</td><td style="border:1px solid #999;padding:6px">迭代增量交付</td><td style="border:1px solid #999;padding:6px">2-4周</td><td style="border:1px solid #999;padding:6px">需求变化快</td></tr>
<tr><td style="border:1px solid #999;padding:6px">看板</td><td style="border:1px solid #999;padding:6px">流程限制在制品</td><td style="border:1px solid #999;padding:6px">持续流动</td><td style="border:1px solid #999;padding:6px">运维/持续交付</td></tr>
</table>

DevOps 打通开发与运维：CI 持续集成（代码合并即构建测试）、CD 持续交付（一键发布）。流水线：build→test→package→deploy。

Docker 容器化：镜像+容器，环境一致性解决"在我机器上能跑"。Dockerfile 构建、docker compose 编排、镜像仓库分发。

Kubernetes 容器编排：Pod 最小调度单位、Deployment 无状态应用、Service 负载均衡、HPA 自动扩缩容。云原生三件套：容器、编排、微服务。

度量指标：部署频率、变更失败率、MTTR（恢复时间）、发布前置时间——DORA 四指标衡量工程效能。',
'掌握敏捷与DevOps',
'["Scrum迭代交付","CI/CD流水线","Docker容器化","K8s编排三件套"]',
'intermediate', 12, 4),

(122, 41, 'JavaScript语言基础',
'JavaScript 是网页的交互语言。ES6+ 现代语法：let/const、箭头函数、解构、模板字符串、模块化。类型：原始类型与引用类型。

<b>JavaScript 核心概念表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">概念</th><th style="border:1px solid #999;padding:6px">说明</th><th style="border:1px solid #999;padding:6px">要点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">let/const</td><td style="border:1px solid #999;padding:6px">块级作用域</td><td style="border:1px solid #999;padding:6px">const 变量不可重新赋值</td></tr>
<tr><td style="border:1px solid #999;padding:6px">箭头函数</td><td style="border:1px solid #999;padding:6px">简洁写法</td><td style="border:1px solid #999;padding:6px">this 指向定义处</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Promise</td><td style="border:1px solid #999;padding:6px">异步处理</td><td style="border:1px solid #999;padding:6px">then/catch/finally</td></tr>
<tr><td style="border:1px solid #999;padding:6px">async/await</td><td style="border:1px solid #999;padding:6px">异步同步化</td><td style="border:1px solid #999;padding:6px">await 必须在 async 内</td></tr>
<tr><td style="border:1px solid #999;padding:6px">闭包</td><td style="border:1px solid #999;padding:6px">函数记住外层变量</td><td style="border:1px solid #999;padding:6px">用于封装私有状态</td></tr>
<tr><td style="border:1px solid #999;padding:6px">原型链</td><td style="border:1px solid #999;padding:6px">继承机制</td><td style="border:1px solid #999;padding:6px">class 是语法糖</td></tr>
</table>

事件循环：同步任务→微任务（Promise）→宏任务（setTimeout）。经典题：setTimeout 和 Promise 的执行顺序。

类型转换陷阱：== 宽松相等会隐式转换，建议用 === 严格相等。NaN 不等于自身，用 isNaN 或 Number.isNaN 判断。

防抖与节流：防抖（停止触发后执行）用于搜索框，节流（固定频率执行）用于滚动监听。',
'掌握JS核心与异步',
'["let/const块级作用域","Promise异步链","事件循环微宏任务","防抖节流区别"]',
'beginner', 12, 1),
(123, 41, 'DOM与事件',
'DOM 把 HTML 文档变成树结构，JS 通过 DOM API 操作页面。查询元素、修改内容、绑定事件是三大基础。

<b>DOM 操作 API 速查表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">操作</th><th style="border:1px solid #999;padding:6px">API</th><th style="border:1px solid #999;padding:6px">说明</th></tr>
<tr><td style="border:1px solid #999;padding:6px">查询</td><td style="border:1px solid #999;padding:6px">querySelector/All</td><td style="border:1px solid #999;padding:6px">CSS选择器查找</td></tr>
<tr><td style="border:1px solid #999;padding:6px">内容</td><td style="border:1px solid #999;padding:6px">textContent/innerHTML</td><td style="border:1px solid #999;padding:6px">改文本/HTML</td></tr>
<tr><td style="border:1px solid #999;padding:6px">样式</td><td style="border:1px solid #999;padding:6px">classList</td><td style="border:1px solid #999;padding:6px">add/remove/toggle</td></tr>
<tr><td style="border:1px solid #999;padding:6px">创建</td><td style="border:1px solid #999;padding:6px">createElement</td><td style="border:1px solid #999;padding:6px">动态节点</td></tr>
<tr><td style="border:1px solid #999;padding:6px">插入</td><td style="border:1px solid #999;padding:6px">appendChild/insertBefore</td><td style="border:1px solid #999;padding:6px">挂载节点</td></tr>
<tr><td style="border:1px solid #999;padding:6px">删除</td><td style="border:1px solid #999;padding:6px">removeChild/remove</td><td style="border:1px solid #999;padding:6px">移除节点</td></tr>
</table>

事件流三阶段：捕获（从根到目标）→目标→冒泡（从目标到根）。事件委托：利用冒泡在父元素统一处理，适合动态列表。

阻止默认行为 preventDefault（如阻止表单提交），阻止冒泡 stopPropagation（防止父级触发）。

性能要点：批量操作 DOM 用 fragment 或 innerHTML；避免频繁布局抖动；事件委托减少监听器数量。虚拟 DOM 思想：先改 JS 层再批量同步真实 DOM。',
'掌握DOM操作与事件',
'["querySelector查找","事件捕获冒泡两阶段","事件委托","批量操作DOM"]',
'beginner', 12, 2),
(124, 41, '异步编程',
'JavaScript 单线程 + 事件循环，异步编程是必须掌握的能力。三件套：回调→Promise→async/await。

<b>异步方案演进表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">方案</th><th style="border:1px solid #999;padding:6px">写法</th><th style="border:1px solid #999;padding:6px">问题</th></tr>
<tr><td style="border:1px solid #999;padding:6px">回调</td><td style="border:1px solid #999;padding:6px">fn(cb)</td><td style="border:1px solid #999;padding:6px">回调地狱难维护</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Promise</td><td style="border:1px solid #999;padding:6px">fn().then()</td><td style="border:1px solid #999;padding:6px">链式较长</td></tr>
<tr><td style="border:1px solid #999;padding:6px">async/await</td><td style="border:1px solid #999;padding:6px">await fn()</td><td style="border:1px solid #999;padding:6px">注意异常处理</td></tr>
</table>

Promise 状态机：pending→fulfilled/rejected，不可逆。Promise.all 并行等全部，Promise.race 取最快，Promise.allSettled 等全部不论成败。

async/await 本质是 Promise 语法糖。错误处理：try/catch 包裹 await；unhandledrejection 监听全局未处理拒绝。

请求 API：fetch 原生、axios 常用。fetch 封装：处理 4xx/5xx、超时（AbortController）、取消请求。

并发控制：限制同时请求数（p-limit 原理：计数+队列），防止打爆服务端。防抖节流与异步结合优化搜索体验。',
'掌握Promise与async',
'["Promise三状态不可逆","Promise.all/race","async是语法糖","并发限制与超时"]',
'intermediate', 12, 3),
(125, 41, '前端框架入门',
'三大框架：React 组件化+虚拟DOM、Vue 渐进式+响应式、Angular 全家桶。核心思想一致：数据驱动视图。

<b>前端框架对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">框架</th><th style="border:1px solid #999;padding:6px">核心</th><th style="border:1px solid #999;padding:6px">学习曲线</th><th style="border:1px solid #999;padding:6px">生态</th></tr>
<tr><td style="border:1px solid #999;padding:6px">React</td><td style="border:1px solid #999;padding:6px">虚拟DOM+Hooks</td><td style="border:1px solid #999;padding:6px">中</td><td style="border:1px solid #999;padding:6px">最庞大</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Vue</td><td style="border:1px solid #999;padding:6px">响应式+模板</td><td style="border:1px solid #999;padding:6px">低</td><td style="border:1px solid #999;padding:6px">中文友好</td></tr>
<tr><td style="border:1px solid #999;padding:6px">Angular</td><td style="border:1px solid #999;padding:6px">MVC+依赖注入</td><td style="border:1px solid #999;padding:6px">高</td><td style="border:1px solid #999;padding:6px">企业级</td></tr>
</table>

组件三要素：模板（视图）、数据（状态）、事件（交互）。单向数据流让状态变化可预测。Vue 的双向绑定 v-model 是语法糖。

状态管理：组件间共享状态用 Vuex/Pinia（Vue）、Redux/Zustand（React）。原则：单一数据源、只读修改、单向流动。

构建工具：Vite（快，开发体验好）、Webpack（生态全）。包管理：npm/pnpm/yarn。脚手架：create-vite、create-react-app。

SSR/静态生成：Next.js/Nuxt 提升首屏与 SEO。HTTP 请求库：axios 拦截器统一处理 token 与错误。',
'掌握组件化与框架思想',
'["数据驱动视图","单向数据流","状态管理单一数据源","Vite构建工具"]',
'intermediate', 12, 4),

(126, 42, '密码学基础',
'密码学保证机密性、完整性、认证、不可否认。对称加密快，非对称加密安全分发密钥。

<b>加密算法对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类型</th><th style="border:1px solid #999;padding:6px">算法</th><th style="border:1px solid #999;padding:6px">密钥</th><th style="border:1px solid #999;padding:6px">特点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">对称</td><td style="border:1px solid #999;padding:6px">AES</td><td style="border:1px solid #999;padding:6px">同一密钥</td><td style="border:1px solid #999;padding:6px">快，密钥分发难</td></tr>
<tr><td style="border:1px solid #999;padding:6px">非对称</td><td style="border:1px solid #999;padding:6px">RSA</td><td style="border:1px solid #999;padding:6px">公私钥对</td><td style="border:1px solid #999;padding:6px">慢，解决分发</td></tr>
<tr><td style="border:1px solid #999;padding:6px">非对称</td><td style="border:1px solid #999;padding:6px">ECC</td><td style="border:1px solid #999;padding:6px">椭圆曲线</td><td style="border:1px solid #999;padding:6px">短密钥同强度</td></tr>
<tr><td style="border:1px solid #999;padding:6px">哈希</td><td style="border:1px solid #999;padding:6px">SHA-256</td><td style="border:1px solid #999;padding:6px">无密钥</td><td style="border:1px solid #999;padding:6px">不可逆防篡改</td></tr>
<tr><td style="border:1px solid #999;padding:6px">MAC</td><td style="border:1px solid #999;padding:6px">HMAC</td><td style="border:1px solid #999;padding:6px">共享密钥</td><td style="border:1px solid #999;padding:6px">认证消息</td></tr>
</table>

TLS 握手融合两者：非对称交换对称密钥（ECDHE），对称加密数据，哈希做完整性校验。前向保密：每次会话独立密钥，泄露一个不影响历史。

哈希特性：单向性、抗碰撞、雪崩效应。应用：密码存储（加盐 bcrypt/argon2）、文件校验、数字签名（哈希+私钥加密）。

攻击与对策：彩虹表攻击→加随机盐；暴力破解→慢哈希函数；MD5/SHA-1 已破→用 SHA-256 以上。',
'掌握对称非对称与哈希',
'["AES对称RSA非对称","TLS混合加密","哈希不可逆","密码存储加盐"]',
'advanced', 12, 1),
(127, 42, 'Web安全OWASP',
'OWASP Top 10 是 Web 安全权威榜单。注入、XSS、CSRF 是三大经典漏洞。

<b>OWASP 高危漏洞速查表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">漏洞</th><th style="border:1px solid #999;padding:6px">原理</th><th style="border:1px solid #999;padding:6px">防护</th></tr>
<tr><td style="border:1px solid #999;padding:6px">SQL注入</td><td style="border:1px solid #999;padding:6px">拼接SQL被注入</td><td style="border:1px solid #999;padding:6px">预编译参数化</td></tr>
<tr><td style="border:1px solid #999;padding:6px">XSS</td><td style="border:1px solid #999;padding:6px">注入脚本执行</td><td style="border:1px solid #999;padding:6px">输出编码/CSP</td></tr>
<tr><td style="border:1px solid #999;padding:6px">CSRF</td><td style="border:1px solid #999;padding:6px">伪造请求带cookie</td><td style="border:1px solid #999;padding:6px">CSRF Token/SameSite</td></tr>
<tr><td style="border:1px solid #999;padding:6px">越权</td><td style="border:1px solid #999;padding:6px">访问他人资源</td><td style="border:1px solid #999;padding:6px">服务端校验权限</td></tr>
<tr><td style="border:1px solid #999;padding:6px">文件上传</td><td style="border:1px solid #999;padding:6px">上传恶意文件</td><td style="border:1px solid #999;padding:6px">白名单+改文件名</td></tr>
</table>

SQL 注入示例：WHERE username = 输入拼接入语句，输入 1 or 1=1 绕过验证。防护铁律：永远参数化查询，绝不拼接。

XSS 类型：反射型（URL 带参）、存储型（存入数据库，危害最大）、DOM 型。防护：输出时 HTML 转义、CSP 内容安全策略、HttpOnly Cookie。

CSRF 原理：跨站请求伪造携带用户 Cookie。防护：双重 Cookie 校验、同源校验、CSRF Token。

认证与授权：JWT 签名防篡改、OAuth2 授权码流程、RBAC 角色权限模型。最小权限原则贯穿始终。',
'掌握OWASP三大漏洞',
'["SQL注入用参数化","XSS输出编码","CSRF用Token","越权需服务端校验"]',
'advanced', 12, 2),
(128, 42, '网络安全体系',
'纵深防御：物理→网络→主机→应用→数据多道防线。零信任：永不信任、持续验证。

<b>安全防护层次表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">层次</th><th style="border:1px solid #999;padding:6px">防护手段</th><th style="border:1px solid #999;padding:6px">工具/技术</th></tr>
<tr><td style="border:1px solid #999;padding:6px">网络</td><td style="border:1px solid #999;padding:6px">边界防护</td><td style="border:1px solid #999;padding:6px">防火墙、WAF、VPN</td></tr>
<tr><td style="border:1px solid #999;padding:6px">主机</td><td style="border:1px solid #999;padding:6px">系统加固</td><td style="border:1px solid #999;padding:6px">杀软、补丁、最小化</td></tr>
<tr><td style="border:1px solid #999;padding:6px">应用</td><td style="border:1px solid #999;padding:6px">代码安全</td><td style="border:1px solid #999;padding:6px">SAST/DAST扫描</td></tr>
<tr><td style="border:1px solid #999;padding:6px">数据</td><td style="border:1px solid #999;padding:6px">加密脱敏</td><td style="border:1px solid #999;padding:6px">TLS、KMS、脱敏</td></tr>
<tr><td style="border:1px solid #999;padding:6px">身份</td><td style="border:1px solid #999;padding:6px">认证授权</td><td style="border:1px solid #999;padding:6px">MFA、SSO、RBAC</td></tr>
</table>

DDoS 攻击与缓解：流量型（反射放大）用 CDN/清洗；连接型（SYN Flood）用连接代理；应用型（CC）限流与 WAF。

日志与溯源：SIEM 平台集中日志，异常检测告警。应急响应流程：检测→遏制→根除→恢复→复盘。

安全开发 SDL：需求阶段威胁建模、编码阶段安全规范、测试阶段渗透测试、上线前安全审查。DevSecOps 把安全嵌入 CI/CD 流水线。',
'掌握纵深防御体系',
'["纵深防御多道防线","零信任模型","DDoS三类与缓解","SDL安全开发生命周期"]',
'advanced', 12, 3),
(129, 42, '安全实践与合规',
'等保 2.0 是我国网络安全等级保护标准，分五级。GDPR 是欧盟数据保护法。合规是企业的法律底线。

<b>安全合规标准对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">标准</th><th style="border:1px solid #999;padding:6px">地区</th><th style="border:1px solid #999;padding:6px">核心要求</th></tr>
<tr><td style="border:1px solid #999;padding:6px">等保2.0</td><td style="border:1px solid #999;padding:6px">中国</td><td style="border:1px solid #999;padding:6px">定级备案、评测整改</td></tr>
<tr><td style="border:1px solid #999;padding:6px">GDPR</td><td style="border:1px solid #999;padding:6px">欧盟</td><td style="border:1px solid #999;padding:6px">数据主体权利</td></tr>
<tr><td style="border:1px solid #999;padding:6px">PCI-DSS</td><td style="border:1px solid #999;padding:6px">支付行业</td><td style="border:1px solid #999;padding:6px">卡数据保护</td></tr>
<tr><td style="border:1px solid #999;padding:6px">ISO 27001</td><td style="border:1px solid #999;padding:6px">国际</td><td style="border:1px solid #999;padding:6px">信息安全管理体系</td></tr>
</table>

数据安全全流程：采集（最小化）→存储（加密）→使用（脱敏）→共享（审批）→销毁（不可恢复）。数据分级分类是第一步。

个人隐私保护：收集前告知同意、匿名化处理、删除权（被遗忘权）。Cookie 需明确告知。

安全红线：密码明文存储、接口无鉴权、日志记录敏感信息、密钥硬编码进代码。Code Review 安全清单逐项检查。

安全测试流程：渗透测试（黑盒/白盒）、漏洞扫描、上线前红蓝对抗。报告与修复闭环：漏洞等级→修复时限→复测。',
'掌握合规与安全实践',
'["等保/GDPR核心要求","数据分级分类","密码绝不存明文","渗透测试闭环"]',
'advanced', 12, 4),

(130, 43, 'NumPy科学计算',
'NumPy 是 Python 科学计算基础。核心是 ndarray 多维数组，向量化运算比 Python 循环快百倍。

<b>NumPy 常用操作表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">操作</th><th style="border:1px solid #999;padding:6px">代码</th><th style="border:1px solid #999;padding:6px">说明</th></tr>
<tr><td style="border:1px solid #999;padding:6px">创建</td><td style="border:1px solid #999;padding:6px">np.array/np.zeros</td><td style="border:1px solid #999;padding:6px">数组/零数组</td></tr>
<tr><td style="border:1px solid #999;padding:6px">等差</td><td style="border:1px solid #999;padding:6px">np.arange(10)</td><td style="border:1px solid #999;padding:6px">0-9</td></tr>
<tr><td style="border:1px solid #999;padding:6px">随机</td><td style="border:1px solid #999;padding:6px">np.random.randn</td><td style="border:1px solid #999;padding:6px">标准正态</td></tr>
<tr><td style="border:1px solid #999;padding:6px">形状</td><td style="border:1px solid #999;padding:6px">reshape/ravel</td><td style="border:1px solid #999;padding:6px">变形/展平</td></tr>
<tr><td style="border:1px solid #999;padding:6px">聚合</td><td style="border:1px solid #999;padding:6px">sum/mean/max</td><td style="border:1px solid #999;padding:6px">统计函数</td></tr>
<tr><td style="border:1px solid #999;padding:6px">索引</td><td style="border:1px solid #999;padding:6px">布尔掩码</td><td style="border:1px solid #999;padding:6px">arr[arr>5]</td></tr>
</table>

广播机制：不同形状数组运算自动扩展对齐。规则：从尾部维度比较，相等或一方为 1 则可广播。它让向量化代码简洁高效。

线性代数：np.dot 矩阵乘法、np.linalg.inv 求逆、np.linalg.eig 特征值、np.linalg.solve 解线性方程组。

性能对比：10 万元素平方，Python 循环约 0.05 秒，NumPy 向量化约 0.0005 秒——差 100 倍。永远优先向量化。',
'掌握NumPy数组与广播',
'["ndarray多维数组","向量化比循环快百倍","广播机制规则","linalg线性代数"]',
'intermediate', 12, 1),
(131, 43, 'Pandas数据清洗',
'Pandas 是数据分析核心库。两大结构：Series 一维、DataFrame 二维表。处理真实数据的脏乱差靠它。

<b>Pandas 清洗常用方法表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">问题</th><th style="border:1px solid #999;padding:6px">方法</th><th style="border:1px solid #999;padding:6px">说明</th></tr>
<tr><td style="border:1px solid #999;padding:6px">缺失值</td><td style="border:1px solid #999;padding:6px">dropna/fillna</td><td style="border:1px solid #999;padding:6px">删除/填充</td></tr>
<tr><td style="border:1px solid #999;padding:6px">重复</td><td style="border:1px solid #999;padding:6px">drop_duplicates</td><td style="border:1px solid #999;padding:6px">去重</td></tr>
<tr><td style="border:1px solid #999;padding:6px">类型</td><td style="border:1px solid #999;padding:6px">astype/to_datetime</td><td style="border:1px solid #999;padding:6px">类型转换</td></tr>
<tr><td style="border:1px solid #999;padding:6px">异常值</td><td style="border:1px solid #999;padding:6px">clip/条件过滤</td><td style="border:1px solid #999;padding:6px">截断/剔除</td></tr>
<tr><td style="border:1px solid #999;padding:6px">文本</td><td style="border:1px solid #999;padding:6px">str.strip/contains</td><td style="border:1px solid #999;padding:6px">字符串处理</td></tr>
</table>

DataFrame 分组聚合：groupby 分组→agg 聚合（mean/sum/count）→reset_index 整理。透视表 pivot_table 多维度汇总。

数据合并：concat 纵向拼接、merge 类似 SQL join（how=left/inner/outer）。多表分析先看键的类型与唯一性。

真实数据坑：日期格式不统一、金额含逗号、编码乱码（encoding=gbk/utf-8）、空字符串 vs NaN。清洗顺序：读入→概览（info/describe）→逐列处理→验证。

管道思想：用方法链 df.groupby(...).agg(...).sort_values(...) 一步到位，清晰可读。',
'掌握Pandas清洗与聚合',
'["dropna/fillna处理缺失","groupby+agg聚合","merge多表合并","清洗后验证info/describe"]',
'intermediate', 12, 2),
(132, 43, '数据分析EDA',
'EDA 探索性数据分析：理解数据形态、发现模式、验证假设。EDA 决定建模思路与特征方向。

<b>EDA 分析维度表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">维度</th><th style="border:1px solid #999;padding:6px">方法</th><th style="border:1px solid #999;padding:6px">发现什么</th></tr>
<tr><td style="border:1px solid #999;padding:6px">单变量</td><td style="border:1px solid #999;padding:6px">describe+hist</td><td style="border:1px solid #999;padding:6px">分布、极值</td></tr>
<tr><td style="border:1px solid #999;padding:6px">双变量</td><td style="border:1px solid #999;padding:6px">散点/分组对比</td><td style="border:1px solid #999;padding:6px">关系、差异</td></tr>
<tr><td style="border:1px solid #999;padding:6px">相关性</td><td style="border:1px solid #999;padding:6px">corr+heatmap</td><td style="border:1px solid #999;padding:6px">共线特征</td></tr>
<tr><td style="border:1px solid #999;padding:6px">类别分布</td><td style="border:1px solid #999;padding:6px">value_counts</td><td style="border:1px solid #999;padding:6px">不平衡</td></tr>
<tr><td style="border:1px solid #999;padding:6px">时间趋势</td><td style="border:1px solid #999;padding:6px">resample 重采样</td><td style="border:1px solid #999;padding:6px">季节性</td></tr>
</table>

EDA 三问：数据长什么样（形状/类型/缺失）？分布如何（偏态/正态）？变量间什么关系（相关/分组差异）？

数值与类别特征分析差异：数值看直方图与箱线图，类别看柱状图与占比。目标变量与特征的分组对比揭示预测力。

结论要量化：相关性 r 值、分组均值差、占比变化。EDA 输出物：分析报告（图表+洞察+下一步建议）。

防止过拟合式 EDA：先定问题再看数据，避免"先看数据后想问题"导致的假发现。',
'掌握EDA分析套路',
'["单变量看分布双变量看关系","相关性热力图","类别不平衡检查","EDA输出报告"]',
'intermediate', 12, 3),
(133, 43, '数据采集与实战',
'数据获取三渠道：数据库导出、API 请求、爬虫抓取。Python 请求库 requests 是主力。Excel/CSV 是最常见交换格式。

<b>数据获取方式对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">方式</th><th style="border:1px solid #999;padding:6px">工具</th><th style="border:1px solid #999;padding:6px">适用</th><th style="border:1px solid #999;padding:6px">注意</th></tr>
<tr><td style="border:1px solid #999;padding:6px">文件</td><td style="border:1px solid #999;padding:6px">pd.read_csv/excel</td><td style="border:1px solid #999;padding:6px">本地数据</td><td style="border:1px solid #999;padding:6px">编码与分隔符</td></tr>
<tr><td style="border:1px solid #999;padding:6px">数据库</td><td style="border:1px solid #999;padding:6px">pymysql/SQLAlchemy</td><td style="border:1px solid #999;padding:6px">业务数据</td><td style="border:1px solid #999;padding:6px">SQL 写好条件</td></tr>
<tr><td style="border:1px solid #999;padding:6px">API</td><td style="border:1px solid #999;padding:6px">requests</td><td style="border:1px solid #999;padding:6px">开放数据</td><td style="border:1px solid #999;padding:6px">限流与鉴权</td></tr>
<tr><td style="border:1px solid #999;padding:6px">爬虫</td><td style="border:1px solid #999;padding:6px">requests+解析库</td><td style="border:1px solid #999;padding:6px">网页数据</td><td style="border:1px solid #999;padding:6px">遵守robots与法规</td></tr>
</table>

requests 三板斧：GET 拿数据、POST 提交、headers 伪装身份。响应处理：r.status_code 状态码、r.json() 解析 JSON、r.encoding 编码。

数据格式：JSON 层级结构用 jsonpath 取值；HTML 表格用 pandas.read_html 直接变 DataFrame；XML 用 xml.etree。

实战案例：分析电商订单——读出 CSV→清洗→按月份聚合销售趋势→找出 Top10 商品→输出报告图表。完整闭环是数据分析的核心竞争力。

爬虫边界：遵守 robots.txt、控制频率、只爬公开数据、尊重版权。反爬应对（验证码等）勿用于违规场景。',
'掌握数据采集闭环',
'["四种获取方式","requests基本用法","pandas.read_html读表格","完整分析闭环"]',
'intermediate', 12, 4),

(134, 44, '机器学习概览',
'机器学习让计算机从数据中学习规律。三种类型：监督学习（有标签）、无监督学习（无标签）、强化学习（奖励驱动）。

<b>学习类型对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类型</th><th style="border:1px solid #999;padding:6px">输入</th><th style="border:1px solid #999;padding:6px">任务</th><th style="border:1px solid #999;padding:6px">算法</th></tr>
<tr><td style="border:1px solid #999;padding:6px">监督学习</td><td style="border:1px solid #999;padding:6px">特征+标签</td><td style="border:1px solid #999;padding:6px">分类/回归</td><td style="border:1px solid #999;padding:6px">逻辑回归/决策树</td></tr>
<tr><td style="border:1px solid #999;padding:6px">无监督学习</td><td style="border:1px solid #999;padding:6px">只有特征</td><td style="border:1px solid #999;padding:6px">聚类/降维</td><td style="border:1px solid #999;padding:6px">K-Means/PCA</td></tr>
<tr><td style="border:1px solid #999;padding:6px">强化学习</td><td style="border:1px solid #999;padding:6px">环境状态</td><td style="border:1px solid #999;padding:6px">决策序列</td><td style="border:1px solid #999;padding:6px">DQN/PPO</td></tr>
</table>

机器学习流程：数据准备→特征工程→划分数据集→训练→评估→调优→部署。数据质量决定上限，算法逼近上限。

训练/验证/测试三集：训练学参数、验证调超参、测试最终评估。测试集泄露是严重错误——调参绝不能看测试集。

过拟合 vs 欠拟合：过拟合记住训练数据、泛化差；欠拟合模型太简单学不到规律。诊断看训练/验证误差差距。

常用指标：分类看准确率/精确率/召回率/F1/AUC，回归看 MSE/MAE。不平衡问题看 AUC 与召回率。',
'掌握ML基本流程',
'["三类学习任务","数据质量决定上限","训练验证测试三集","过拟合欠拟合诊断"]',
'intermediate', 12, 1),
(135, 44, '监督学习算法',
'监督学习两大任务：分类预测类别，回归预测数值。掌握核心算法原理与适用场景。

<b>常用监督算法对比表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">算法</th><th style="border:1px solid #999;padding:6px">任务</th><th style="border:1px solid #999;padding:6px">优点</th><th style="border:1px solid #999;padding:6px">缺点</th></tr>
<tr><td style="border:1px solid #999;padding:6px">线性回归</td><td style="border:1px solid #999;padding:6px">回归</td><td style="border:1px solid #999;padding:6px">可解释强</td><td style="border:1px solid #999;padding:6px">线性假设</td></tr>
<tr><td style="border:1px solid #999;padding:6px">逻辑回归</td><td style="border:1px solid #999;padding:6px">分类</td><td style="border:1px solid #999;padding:6px">概率输出</td><td style="border:1px solid #999;padding:6px">决策边界线性</td></tr>
<tr><td style="border:1px solid #999;padding:6px">决策树</td><td style="border:1px solid #999;padding:6px">分类回归</td><td style="border:1px solid #999;padding:6px">可解释、无缩放</td><td style="border:1px solid #999;padding:6px">易过拟合</td></tr>
<tr><td style="border:1px solid #999;padding:6px">随机森林</td><td style="border:1px solid #999;padding:6px">分类回归</td><td style="border:1px solid #999;padding:6px">稳定防过拟合</td><td style="border:1px solid #999;padding:6px">训练慢</td></tr>
<tr><td style="border:1px solid #999;padding:6px">SVM</td><td style="border:1px solid #999;padding:6px">分类</td><td style="border:1px solid #999;padding:6px">高维有效</td><td style="border:1px solid #999;padding:6px">大数据慢</td></tr>
<tr><td style="border:1px solid #999;padding:6px">XGBoost</td><td style="border:1px solid #999;padding:6px">分类回归</td><td style="border:1px solid #999;padding:6px">竞赛屠榜</td><td style="border:1px solid #999;padding:6px">调参复杂</td></tr>
</table>

线性回归最小二乘：最小化残差平方和，解正规方程或梯度下降。逻辑回归：sigmoid 压缩到 (0,1)，交叉熵损失，输出概率。

决策树分裂：信息增益（ID3）、增益率（C4.5）、基尼指数（CART）。剪枝防过拟合：预剪枝、后剪枝。

集成学习三巨头：Bagging（随机森林，并行采样投票）、Boosting（AdaBoost/XGBoost，串行纠正误差）、Stacking（多层模型融合）。

sklearn 使用范式：model.fit(X_train,y_train) 训练、model.predict 预测、cross_val_score 交叉验证。',
'掌握监督学习算法',
'["分类回归两大任务","逻辑回归输出概率","决策树基尼指数","集成学习Bagging/Boosting"]',
'intermediate', 12, 2),
(136, 44, '特征工程',
'特征工程是"给模型喂什么"。好特征让简单模型也能赢。三方向：构造、选择、变换。

<b>特征工程方法表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">类别</th><th style="border:1px solid #999;padding:6px">方法</th><th style="border:1px solid #999;padding:6px">示例</th></tr>
<tr><td style="border:1px solid #999;padding:6px">编码</td><td style="border:1px solid #999;padding:6px">类别转数值</td><td style="border:1px solid #999;padding:6px">One-Hot 独热</td></tr>
<tr><td style="border:1px solid #999;padding:6px">缩放</td><td style="border:1px solid #999;padding:6px">统一量纲</td><td style="border:1px solid #999;padding:6px">标准化/归一化</td></tr>
<tr><td style="border:1px solid #999;padding:6px">构造</td><td style="border:1px solid #999;padding:6px">领域知识造特征</td><td style="border:1px solid #999;padding:6px">RFM、比值、差</td></tr>
<tr><td style="border:1px solid #999;padding:6px">选择</td><td style="border:1px solid #999;padding:6px">去掉无关特征</td><td style="border:1px solid #999;padding:6px">相关性/方差过滤</td></tr>
<tr><td style="border:1px solid #999;padding:6px">降维</td><td style="border:1px solid #999;padding:6px">压缩维度</td><td style="border:1px solid #999;padding:6px">PCA 主成分</td></tr>
<tr><td style="border:1px solid #999;padding:6px">分箱</td><td style="border:1px solid #999;padding:6px">连续离散化</td><td style="border:1px solid #999;padding:6px">等距/等频分箱</td></tr>
</table>

数值特征处理：标准化（减去均值除标准差）适合线性模型与距离模型；缺失值填充策略随业务选择；偏态数据 log 变换拉正。

类别特征：无序用 One-Hot，有序用标签编码（教育程度）。高基数类别（用户 ID）用目标编码或 embedding。

特征选择三法：过滤式（统计检验）、包裹式（模型评价子集）、嵌入式（L1 正则/树的重要性）。

特征质量的黄金问题：这个特征和目标有关系吗？有噪声吗？新样本能取到吗（防数据泄露）？',
'掌握特征工程方法',
'["One-Hot与标准化","领域知识构造特征","PCA降维","特征选择三法"]',
'intermediate', 12, 3),
(137, 44, '模型评估与部署',
'评估是判断模型能否上线。泛化能力>训练表现。混淆矩阵是分类评估基础。

<b>评估指标速查表：</b>
<table style="border-collapse:collapse">
<tr><th style="border:1px solid #999;padding:6px">指标</th><th style="border:1px solid #999;padding:6px">公式</th><th style="border:1px solid #999;padding:6px">适用</th></tr>
<tr><td style="border:1px solid #999;padding:6px">准确率</td><td style="border:1px solid #999;padding:6px">(TP+TN)/总数</td><td style="border:1px solid #999;padding:6px">类别平衡</td></tr>
<tr><td style="border:1px solid #999;padding:6px">精确率</td><td style="border:1px solid #999;padding:6px">TP/(TP+FP)</td><td style="border:1px solid #999;padding:6px">误报代价高</td></tr>
<tr><td style="border:1px solid #999;padding:6px">召回率</td><td style="border:1px solid #999;padding:6px">TP/(TP+FN)</td><td style="border:1px solid #999;padding:6px">漏报代价高</td></tr>
<tr><td style="border:1px solid #999;padding:6px">F1</td><td style="border:1px solid #999;padding:6px">2PR/(P+R)</td><td style="border:1px solid #999;padding:6px">精确率召回率平衡</td></tr>
<tr><td style="border:1px solid #999;padding:6px">AUC</td><td style="border:1px solid #999;padding:6px">ROC下面积</td><td style="border:1px solid #999;padding:6px">排序能力</td></tr>
<tr><td style="border:1px solid #999;padding:6px">MSE</td><td style="border:1px solid #999;padding:6px">均方误差</td><td style="border:1px solid #999;padding:6px">回归</td></tr>
</table>

过拟合治理六板斧：更多数据、正则化（L1/L2）、简化模型、交叉验证、早停、Dropout（神经网络）。

交叉验证：K 折把数据分 K 份轮流验证，结果取平均，比单次划分可靠。分层 K 折保持类别比例。

调参方法：网格搜索（GridSearchCV 穷举）、随机搜索（RandomizedSearchCV）、贝叶斯优化。先粗后细，控制实验次数。

部署方式：sklearn 模型用 joblib/pickle 序列化→Flask/FastAPI 封装 API→Docker 打包→上线监控。模型监控：预测分布漂移检测、A/B 对比、定期重训。',
'掌握评估与调优',
'["混淆矩阵四象限","精确率召回率权衡","K折交叉验证","模型漂移监控"]',
'intermediate', 12, 4);

INSERT IGNORE INTO sekai_learning_quiz_questions (id, lesson_id, question, question_type, options, correct_answer, explanation, sort_order) VALUES
(203, 102, '进程与线程的本质区别是？', 'single', '[{"label":"A","text":"内存空间独立"},{"label":"B","text":"执行速度"},{"label":"C","text":"命名方式"},{"label":"D","text":"调度方式"}]', 'A', '进程拥有独立内存空间，线程共享进程内存', 1),
(204, 102, '进程三态不包括？', 'single', '[{"label":"A","text":"就绪"},{"label":"B","text":"运行"},{"label":"C","text":"阻塞"},{"label":"D","text":"死亡"}]', 'D', '经典三态: 就绪/运行/阻塞', 2),
(205, 103, '虚拟内存的核心思想是？', 'single', '[{"label":"A","text":"按需分页加载"},{"label":"B","text":"压缩内存"},{"label":"C","text":"双倍内存"},{"label":"D","text":"磁盘换缓存"}]', 'A', '虚拟内存让程序按需分页加载，物理内存不够也能运行', 1),
(206, 103, '页面置换算法中可实现的近似最优是？', 'single', '[{"label":"A","text":"FIFO"},{"label":"B","text":"LRU"},{"label":"C","text":"OPT"},{"label":"D","text":"随机"}]', 'B', 'LRU 最近最久未使用，用哈希+链表 O(1) 实现', 2),
(207, 104, 'Linux 中 inode 主要存储？', 'single', '[{"label":"A","text":"文件元数据"},{"label":"B","text":"文件内容"},{"label":"C","text":"目录名"},{"label":"D","text":"磁盘分区"}]', 'A', 'inode 存权限、大小、时间戳、块指针等元数据', 1),
(208, 104, '源文件删除后仍有效的是？', 'single', '[{"label":"A","text":"硬链接"},{"label":"B","text":"软链接"},{"label":"C","text":"两者都失效"},{"label":"D","text":"两者都有效"}]', 'A', '硬链接共享 inode，删除源文件计数减一仍有效', 2),
(209, 105, '死锁四个必要条件不包括？', 'single', '[{"label":"A","text":"互斥"},{"label":"B","text":"持有等待"},{"label":"C","text":"不可剥夺"},{"label":"D","text":"优先级反转"}]', 'D', '四条件: 互斥、持有等待、不可剥夺、循环等待', 1),
(210, 105, '多线程读写共享变量的结果不确定称为？', 'single', '[{"label":"A","text":"竞态条件"},{"label":"B","text":"死锁"},{"label":"C","text":"饥饿"},{"label":"D","text":"抖动"}]', 'A', '竞态条件 race condition', 2),
(211, 106, 'TCP 三次握手中的第三次发送的是？', 'single', '[{"label":"A","text":"SYN"},{"label":"B","text":"ACK"},{"label":"C","text":"FIN"},{"label":"D","text":"RST"}]', 'B', 'SYN→SYN+ACK→ACK 建立连接', 1),
(212, 106, '视频直播通常用哪个协议？', 'single', '[{"label":"A","text":"UDP"},{"label":"B","text":"TCP"},{"label":"C","text":"SMTP"},{"label":"D","text":"FTP"}]', 'A', 'UDP 低延迟适合实时音视频', 2),
(213, 107, '192.168.0.0/16 属于？', 'single', '[{"label":"A","text":"私有地址"},{"label":"B","text":"公网地址"},{"label":"C","text":"回环地址"},{"label":"D","text":"广播地址"}]', 'A', '192.168.0.0/16 是 C 类私有地址段', 1),
(214, 107, '把域名解析为 IP 的系统是？', 'single', '[{"label":"A","text":"DNS"},{"label":"B","text":"DHCP"},{"label":"C","text":"NAT"},{"label":"D","text":"ARP"}]', 'A', 'DNS 域名系统', 2),
(215, 108, '服务器内部错误的状态码是？', 'single', '[{"label":"A","text":"404"},{"label":"B","text":"500"},{"label":"C","text":"301"},{"label":"D","text":"200"}]', 'B', '5xx 服务端错误，500 内部错误', 1),
(216, 108, 'HTTPS 相比 HTTP 多了哪一层？', 'single', '[{"label":"A","text":"TLS"},{"label":"B","text":"IP"},{"label":"C","text":"TCP"},{"label":"D","text":"FTP"}]', 'A', 'HTTPS=HTTP+TLS 加密', 2),
(217, 109, '查看端口监听状态用？', 'single', '[{"label":"A","text":"netstat"},{"label":"B","text":"ping"},{"label":"C","text":"traceroute"},{"label":"D","text":"nslookup"}]', 'A', 'netstat/ss 查看端口与连接', 1),
(218, 109, '抓包分析工具是？', 'single', '[{"label":"A","text":"tcpdump"},{"label":"B","text":"curl"},{"label":"C","text":"dig"},{"label":"D","text":"grep"}]', 'A', 'tcpdump 抓包，wireshark 分析', 2),
(219, 110, 'SQL 查询的执行顺序，正确的是？', 'single', '[{"label":"A","text":"FROM先于SELECT"},{"label":"B","text":"SELECT先于FROM"},{"label":"C","text":"ORDER BY先于WHERE"},{"label":"D","text":"HAVING先于GROUP BY"}]', 'A', 'FROM→WHERE→GROUP BY→HAVING→SELECT→ORDER BY', 1),
(220, 110, '过滤分组后的结果用？', 'single', '[{"label":"A","text":"HAVING"},{"label":"B","text":"WHERE"},{"label":"C","text":"LIMIT"},{"label":"D","text":"DISTINCT"}]', 'A', 'HAVING 作用于分组后，WHERE 作用于分组前', 2),
(221, 111, 'InnoDB 默认索引结构是？', 'single', '[{"label":"A","text":"B+树"},{"label":"B","text":"哈希表"},{"label":"C","text":"链表"},{"label":"D","text":"二叉树"}]', 'A', 'InnoDB 聚簇索引使用 B+ 树', 1),
(222, 111, '联合索引失效的条件是？', 'single', '[{"label":"A","text":"跳过最左列"},{"label":"B","text":"查询所有列"},{"label":"C","text":"使用索引列排序"},{"label":"D","text":"等值查询"}]', 'A', '最左前缀原则，跳过首列索引失效', 2),
(223, 112, 'MySQL InnoDB 默认隔离级别是？', 'single', '[{"label":"A","text":"可重复读"},{"label":"B","text":"读未提交"},{"label":"C","text":"读已提交"},{"label":"D","text":"串行化"}]', 'A', 'InnoDB 默认 REPEATABLE READ', 1),
(224, 112, 'MVCC 的核心思想是？', 'single', '[{"label":"A","text":"多版本读不加锁"},{"label":"B","text":"全表加锁"},{"label":"C","text":"双写"},{"label":"D","text":"分区存储"}]', 'A', 'MVCC 快照读历史版本，读不加锁', 2),
(225, 113, '深分页 LIMIT 100000,10 的优化方式是？', 'single', '[{"label":"A","text":"游标方式取id"},{"label":"B","text":"加大LIMIT"},{"label":"C","text":"全表扫描"},{"label":"D","text":"去除索引"}]', 'A', '用 WHERE id>上页最大id 避免扫描大量行', 1),
(226, 113, '分库分表后生成全局唯一ID常用？', 'single', '[{"label":"A","text":"雪花算法"},{"label":"B","text":"自增ID"},{"label":"C","text":"随机数"},{"label":"D","text":"时间戳"}]', 'A', '雪花算法 snowflake 分布式唯一ID', 2),
(227, 114, '二分查找的时间复杂度是？', 'single', '[{"label":"A","text":"O(log n)"},{"label":"B","text":"O(n)"},{"label":"C","text":"O(n²)"},{"label":"D","text":"O(1)"}]', 'A', '每次排除一半，O(log n)', 1),
(228, 114, '归并排序的时间复杂度是？', 'single', '[{"label":"A","text":"O(n log n)"},{"label":"B","text":"O(n²)"},{"label":"C","text":"O(n)"},{"label":"D","text":"O(log n)"}]', 'A', '归并递归分割合并，O(n log n)', 2),
(229, 115, '二叉搜索树中序遍历的结果是？', 'single', '[{"label":"A","text":"有序序列"},{"label":"B","text":"随机序列"},{"label":"C","text":"倒序序列"},{"label":"D","text":"层序序列"}]', 'A', 'BST 中序遍历输出有序', 1),
(230, 115, '叶子节点数与二度节点数的关系是？', 'single', '[{"label":"A","text":"n0=n2+1"},{"label":"B","text":"n0=n2-1"},{"label":"C","text":"n0=2n2"},{"label":"D","text":"n0=n2"}]', 'A', '二叉树性质: 叶子节点=二度节点+1', 2),
(231, 116, 'HashMap 解决哈希冲突的方式是？', 'single', '[{"label":"A","text":"链地址法"},{"label":"B","text":"二次探测"},{"label":"C","text":"双重哈希"},{"label":"D","text":"线性探测"}]', 'A', 'Java HashMap 用链表+红黑树', 1),
(232, 116, 'KMP 算法的时间复杂度是？', 'single', '[{"label":"A","text":"O(n+m)"},{"label":"B","text":"O(nm)"},{"label":"C","text":"O(n)"},{"label":"D","text":"O(n²)"}]', 'A', 'KMP 利用 next 数组，O(n+m)', 2),
(233, 117, '动态规划的适用条件是？', 'single', '[{"label":"A","text":"最优子结构"},{"label":"B","text":"数据有序"},{"label":"C","text":"图无环"},{"label":"D","text":"样本独立"}]', 'A', 'DP 需要最优子结构+重叠子问题', 1),
(234, 117, '0-1 背包滚动数组优化时遍历顺序是？', 'single', '[{"label":"A","text":"倒序"},{"label":"B","text":"正序"},{"label":"C","text":"任意"},{"label":"D","text":"跳跃"}]', 'A', '倒序遍历防止同一个物品被重复选取', 2),
(235, 118, '回退到历史版本且不保留记录用？', 'single', '[{"label":"A","text":"git reset"},{"label":"B","text":"git revert"},{"label":"C","text":"git stash"},{"label":"D","text":"git rebase"}]', 'A', 'reset 移动指针删历史，revert 生成反向提交', 1),
(236, 118, 'Git 提交信息规范中修复 bug 用？', 'single', '[{"label":"A","text":"fix"},{"label":"B","text":"feat"},{"label":"C","text":"docs"},{"label":"D","text":"test"}]', 'A', 'fix 修复，feat 新功能', 2),
(237, 119, '测试金字塔底层（最多）的是？', 'single', '[{"label":"A","text":"单元测试"},{"label":"B","text":"E2E测试"},{"label":"C","text":"UI测试"},{"label":"D","text":"性能测试"}]', 'A', '单元测试数量最多、最快', 1),
(238, 119, 'TDD 的核心顺序是？', 'single', '[{"label":"A","text":"先写测试后实现"},{"label":"B","text":"先实现后测试"},{"label":"C","text":"同时进行"},{"label":"D","text":"只写测试"}]', 'A', '测试驱动开发: 红-绿-重构', 2),
(239, 120, '保证全局唯一实例的模式是？', 'single', '[{"label":"A","text":"单例"},{"label":"B","text":"工厂"},{"label":"C","text":"观察者"},{"label":"D","text":"策略"}]', 'A', '单例模式全局唯一实例', 1),
(240, 120, 'SOLID 中的 O 指？', 'single', '[{"label":"A","text":"开闭原则"},{"label":"B","text":"单一职责"},{"label":"C","text":"里氏替换"},{"label":"D","text":"依赖倒置"}]', 'A', 'Open-Closed 对扩展开放对修改关闭', 2),
(241, 121, 'Scrum 中迭代周期叫？', 'single', '[{"label":"A","text":"Sprint"},{"label":"B","text":"Release"},{"label":"C","text":"Milestone"},{"label":"D","text":"Epic"}]', 'A', 'Scrum 的冲刺迭代 Sprint', 1),
(242, 121, 'Docker 解决的核心问题是？', 'single', '[{"label":"A","text":"环境一致性"},{"label":"B","text":"代码安全"},{"label":"C","text":"网络加速"},{"label":"D","text":"磁盘扩容"}]', 'A', '镜像打包环境，随处运行', 2),
(243, 122, 'let 与 var 的主要区别是？', 'single', '[{"label":"A","text":"块级作用域"},{"label":"B","text":"类型不同"},{"label":"C","text":"速度不同"},{"label":"D","text":"无区别"}]', 'A', 'let 有块级作用域，var 是函数级', 1),
(244, 122, '搜索输入防抖的作用是？', 'single', '[{"label":"A","text":"停止触发后执行"},{"label":"B","text":"固定频率执行"},{"label":"C","text":"立即执行"},{"label":"D","text":"忽略输入"}]', 'A', '防抖: 连续触发后只执行最后一次', 2),
(245, 123, '利用冒泡统一处理子元素事件叫？', 'single', '[{"label":"A","text":"事件委托"},{"label":"B","text":"事件冒泡"},{"label":"C","text":"事件捕获"},{"label":"D","text":"事件循环"}]', 'A', '事件委托在父元素处理动态子元素事件', 1),
(246, 123, '阻止默认行为的方法是？', 'single', '[{"label":"A","text":"preventDefault"},{"label":"B","text":"stopPropagation"},{"label":"C","text":"stopImmediate"},{"label":"D","text":"return false"}]', 'A', 'preventDefault 阻止默认行为', 2),
(247, 124, 'Promise 的状态不包括？', 'single', '[{"label":"A","text":"idle"},{"label":"B","text":"pending"},{"label":"C","text":"fulfilled"},{"label":"D","text":"rejected"}]', 'A', '三状态: pending/fulfilled/rejected', 1),
(248, 124, '并行等所有 Promise 完成用？', 'single', '[{"label":"A","text":"Promise.all"},{"label":"B","text":"Promise.race"},{"label":"C","text":"Promise.any"},{"label":"D","text":"Promise.resolve"}]', 'A', 'Promise.all 全成功才成功', 2),
(249, 125, 'Vue 的核心特性是？', 'single', '[{"label":"A","text":"响应式"},{"label":"B","text":"编译型"},{"label":"C","text":"强类型"},{"label":"D","text":"原生DOM"}]', 'A', 'Vue 数据驱动响应式更新视图', 1),
(250, 125, 'Next.js/Nuxt 提供的主要能力是？', 'single', '[{"label":"A","text":"SSR服务端渲染"},{"label":"B","text":"数据库"},{"label":"C","text":"编译器"},{"label":"D","text":"容器编排"}]', 'A', 'SSR 提升首屏与SEO', 2),
(251, 126, '对称加密的代表算法是？', 'single', '[{"label":"A","text":"AES"},{"label":"B","text":"RSA"},{"label":"C","text":"DSA"},{"label":"D","text":"SHA"}]', 'A', 'AES 对称加密，RSA 非对称', 1),
(252, 126, '密码存储的正确姿势是？', 'single', '[{"label":"A","text":"加盐慢哈希"},{"label":"B","text":"明文存储"},{"label":"C","text":"MD5无盐"},{"label":"D","text":"BASE64"}]', 'A', 'bcrypt/argon2 加盐慢哈希', 2),
(253, 127, '防 SQL 注入的铁律是？', 'single', '[{"label":"A","text":"参数化查询"},{"label":"B","text":"字符串拼接"},{"label":"C","text":"前端校验"},{"label":"D","text":"关闭报错"}]', 'A', '预编译参数化，绝不拼接 SQL', 1),
(254, 127, '防 CSRF 的常用手段是？', 'single', '[{"label":"A","text":"CSRF Token"},{"label":"B","text":"GET请求"},{"label":"C","text":"明文密码"},{"label":"D","text":"删除Cookie"}]', 'A', 'Token 校验与 SameSite Cookie', 2),
(255, 128, '纵深防御的含义是？', 'single', '[{"label":"A","text":"多层防线"},{"label":"B","text":"单点防护"},{"label":"C","text":"加密一切"},{"label":"D","text":"拒绝服务"}]', 'A', '网络/主机/应用/数据多层防护', 1),
(256, 128, '零信任的核心思想是？', 'single', '[{"label":"A","text":"永不信任持续验证"},{"label":"B","text":"内网可信"},{"label":"C","text":"边界防御"},{"label":"D","text":"默认允许"}]', 'A', '零信任默认拒绝，持续验证', 2),
(257, 129, '等保 2.0 是什么？', 'single', '[{"label":"A","text":"网络安全等级保护"},{"label":"B","text":"密码标准"},{"label":"C","text":"编程规范"},{"label":"D","text":"ISO认证"}]', 'A', '中国网络安全等级保护标准', 1),
(258, 129, '密钥硬编码进代码属于？', 'single', '[{"label":"A","text":"安全红线"},{"label":"B","text":"最佳实践"},{"label":"C","text":"性能优化"},{"label":"D","text":"合规要求"}]', 'A', '密钥必须放配置中心或密钥管理服务', 2),
(259, 130, 'NumPy 相比 Python 循环的优势是？', 'single', '[{"label":"A","text":"向量化快百倍"},{"label":"B","text":"语法更简单"},{"label":"C","text":"支持函数式"},{"label":"D","text":"自动多线程"}]', 'A', '向量化运算利用底层 C 实现', 1),
(260, 130, 'arr[arr>5] 属于哪种索引？', 'single', '[{"label":"A","text":"布尔掩码"},{"label":"B","text":"整数索引"},{"label":"C","text":"切片"},{"label":"D","text":"花式索引"}]', 'A', '布尔数组作为掩码过滤', 2),
(261, 131, 'Pandas 中删除缺失值用？', 'single', '[{"label":"A","text":"dropna"},{"label":"B","text":"fillna"},{"label":"C","text":"astype"},{"label":"D","text":"clip"}]', 'A', 'dropna 删除，fillna 填充', 1),
(262, 131, '类似 SQL JOIN 的 Pandas 方法是？', 'single', '[{"label":"A","text":"merge"},{"label":"B","text":"concat"},{"label":"C","text":"pivot"},{"label":"D","text":"stack"}]', 'A', 'merge 按键合并，concat 纵向拼接', 2),
(263, 132, 'EDA 中的单变量分析用什么图？', 'single', '[{"label":"A","text":"直方图"},{"label":"B","text":"散点图"},{"label":"C","text":"网络图"},{"label":"D","text":"地图"}]', 'A', '直方图看单变量分布', 1),
(264, 132, '发现变量间相关性的工具是？', 'single', '[{"label":"A","text":"相关性热力图"},{"label":"B","text":"词云"},{"label":"C","text":"柱状图"},{"label":"D","text":"折线图"}]', 'A', 'corr+heatmap 看共线特征', 2),
(265, 133, '解析 HTML 表格为 DataFrame 用？', 'single', '[{"label":"A","text":"pd.read_html"},{"label":"B","text":"pd.read_sql"},{"label":"C","text":"pd.read_csv"},{"label":"D","text":"pd.to_json"}]', 'A', 'read_html 直接提取表格', 1),
(266, 133, '爬虫必须遵守的是？', 'single', '[{"label":"A","text":"robots.txt"},{"label":"B","text":"HTTP状态码"},{"label":"C","text":"SSL证书"},{"label":"D","text":"CDN策略"}]', 'A', '遵守 robots.txt 与法规', 2),
(267, 134, '无监督学习的典型任务？', 'single', '[{"label":"A","text":"聚类"},{"label":"B","text":"分类"},{"label":"C","text":"回归"},{"label":"D","text":"排序"}]', 'A', 'K-Means 聚类无标签', 1),
(268, 134, '调参时不能看哪个数据集？', 'single', '[{"label":"A","text":"测试集"},{"label":"B","text":"训练集"},{"label":"C","text":"验证集"},{"label":"D","text":"全部"}]', 'A', '测试集泄露导致评估虚高', 2),
(269, 135, '输出概率的分类模型是？', 'single', '[{"label":"A","text":"逻辑回归"},{"label":"B","text":"决策树"},{"label":"C","text":"KNN"},{"label":"D","text":"随机森林"}]', 'A', 'sigmoid 输出 (0,1) 概率', 1),
(270, 135, '随机森林属于哪种集成？', 'single', '[{"label":"A","text":"Bagging"},{"label":"B","text":"Boosting"},{"label":"C","text":"Stacking"},{"label":"D","text":"None"}]', 'A', '随机森林并行采样投票 Bagging', 2),
(271, 136, '类别特征转数值常用？', 'single', '[{"label":"A","text":"One-Hot编码"},{"label":"B","text":"log变换"},{"label":"C","text":"分箱"},{"label":"D","text":"标准化"}]', 'A', '无序类别用独热编码', 1),
(272, 136, 'PCA 属于哪种特征处理？', 'single', '[{"label":"A","text":"降维"},{"label":"B","text":"编码"},{"label":"C","text":"填充"},{"label":"D","text":"分箱"}]', 'A', '主成分分析降维', 2),
(273, 137, '精确率与召回率的调和平均是？', 'single', '[{"label":"A","text":"F1"},{"label":"B","text":"AUC"},{"label":"C","text":"MSE"},{"label":"D","text":"R²"}]', 'A', 'F1=2PR/(P+R)', 1),
(274, 137, 'K 折交叉验证的意义是？', 'single', '[{"label":"A","text":"评估更可靠"},{"label":"B","text":"训练更快"},{"label":"C","text":"特征更多"},{"label":"D","text":"数据更大"}]', 'A', '多折平均减少评估方差', 2);