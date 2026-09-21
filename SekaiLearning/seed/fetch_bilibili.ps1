# =============================================================
# SekaiLearning - B站学习视频抓取 v3 (全量 7000+ 条)
# 每门课程: 多关键词 + 多分页搜索 -> 同课程内去重 -> 按播放量取 Top 110
# 目标: 每门课程 >= 100 个可播放(enabled)视频
# 要点:
#   - 复用 WebSession(先访问 bilibili.com 拿 buvid cookie), 规避 412
#   - 保留已抓取的 seed_7_bilibili.sql 中的原行(原 id), 新行 id 从 1066 起
#   - 断点续跑: fetch_state_v3.json 保存每课进度
# 用法: pwsh -File fetch_bilibili.ps1 [-Limit N] [-TargetPerCourse 110]
# =============================================================
param(
    [int]$Limit = 0,
    [int]$TargetPerCourse = 110
)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$repo = Split-Path -Parent $root

$headers = @{
    'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0 Safari/537.36'
    'Referer'    = 'https://www.bilibili.com/'
    'Accept'     = 'application/json, text/plain, */*'
}

# 单会话复用, 先访问主页拿 buvid cookie, 规避搜索接口 412
$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
try {
    $null = Invoke-WebRequest -Uri 'https://www.bilibili.com/' -Headers $headers -WebSession $session -TimeoutSec 25 -UseBasicParsing
} catch {
    Write-Host "  [warn] 主页预热失败: $($_.Exception.Message)"
}

$rand = New-Object System.Random
function Sleep-Jitter([int]$minMs, [int]$maxMs) {
    Start-Sleep -Milliseconds $rand.Next($minMs, $maxMs)
}

function Clean-Html([string]$s) {
    if ([string]::IsNullOrEmpty($s)) { return '' }
    $s = $s -replace '<[^>]+>', ''
    $s = $s -replace '&amp;', '&'
    $s = $s -replace '&quot;', '"'
    $s = $s -replace '&lt;', '<'
    $s = $s -replace '&gt;', '>'
    $s = $s -replace '&#39;', "'"
    $s = $s -replace '&nbsp;', ' '
    $s = $s -replace '\s+', ' '
    return $s.Trim()
}

function Sql-Escape([string]$s) {
    if ([string]::IsNullOrEmpty($s)) { return "''" }
    $s = $s -replace '\\', '\\\\'
    $s = $s -replace "'", "''"
    $s = $s -replace "`r", ' '
    $s = $s -replace "`n", ' '
    return "'" + $s + "'"
}

$global:consecutiveFails = 0
function Search-Videos([string]$keyword, [int]$page) {
    $uri = 'https://api.bilibili.com/x/web-interface/search/type?search_type=video&page=' + $page + '&keyword=' + [uri]::EscapeDataString($keyword)
    for ($i = 0; $i -lt 3; $i++) {
        try {
            $r = Invoke-RestMethod -Uri $uri -Headers $headers -WebSession $session -TimeoutSec 25
            $global:consecutiveFails = 0
            if ($r.code -eq 0 -and $r.data.result) {
                return @($r.data.result | Where-Object { $_.type -eq 'video' -and -not [string]::IsNullOrEmpty($_.bvid) })
            }
            return @()
        } catch {
            $global:consecutiveFails++
            $status = $null
            try { $status = $_.Exception.Response.StatusCode.value__ } catch {}
            if ($status -eq 412 -and $global:consecutiveFails -ge 2) {
                Write-Host "  [风控冷却] 等待 90s ..."
                Start-Sleep -Seconds 90
                $global:consecutiveFails = 0
            } else {
                Start-Sleep -Seconds 4
            }
        }
    }
    return @()
}

# 把 API 返回对象规范化为与存量行一致的结构
function Normalize-Video($v) {
    $url = 'https://www.bilibili.com/video/' + $v.bvid
    $cover = $v.pic
    if ($cover -match '^//') { $cover = 'https:' + $cover }
    return [pscustomobject]@{
        RowId = $null; CourseId = $null; Bvid = $v.bvid
        Title = $v.title; Url = $url; Cover = $cover
        Author = $v.author; AuthorUrl = 'https://space.bilibili.com/' + $v.mid
        Play = [long]$v.play; Duration = $v.duration
        Desc = $v.description; Source = 'bilibili'
        Sort = 0; Enabled = $true
    }
}

# 每学科补充关键词, 提升窄课程命中率
$subjectKeywords = @{
    1  = @('编程 入门','程序员','开发 教程','算法','力扣','Python 基础','Java 教程','代码')
    2  = @('高数','线代','微积分','概率论','矩阵','数学竞赛','考研数学','数学 公式')
    3  = @('力学','电磁学','热学','光学','物理 竞赛','大学物理','量子力学','相对论')
    4  = @('历史','世界史','中国史','文明','近代史','一战','二战','历史 纪录片')
    5  = @('心理学','认知','记忆','情绪','人格','心理 学 入门','发展心理学','社会心理学')
    6  = @('化学','无机化学','有机化学','化学实验','元素周期表','化学 竞赛','高中化学','大学化学')
    7  = @('生物学','细胞','基因','遗传','进化','生物 竞赛','人体','生态')
    8  = @('日语','五十音','N1','N2','N3','日语 语法','日本语','日语 听力','日语 单词')
    9  = @('经济学','微观经济学','宏观经济学','曼昆','经济学原理','金融','理财','市场')
    10 = @('哲学','西方哲学','中国哲学','逻辑','苏格拉底','尼采','哲学 入门','思辨')
    11 = @('天文','宇宙','黑洞','星系','行星','航天','星空','天文学')
    12 = @('文学','名著','小说','诗词','散文','文学 鉴赏','写作','红楼梦','鲁迅')
    13 = @('乐理','和声','节奏','钢琴','吉他','音乐 入门','视唱练耳','作曲')
    14 = @('地理','气候','地球','地图','自然地理','地质','气象','地理 知识')
    15 = @('英语','英语 语法','英语 单词','四六级','雅思','托福','口语','听力','英语 写作')
    16 = @('美术','素描','色彩','设计','插画','绘画','艺术','平面设计','PS 教程')
    17 = @('健身','运动','营养','健康','跑步','力量训练','瑜伽','体育')
    18 = @('法律','法学','民法','刑法','宪法','法考','法律 常识','律师')
    19 = @('国际关系','政治','外交','地缘','全球','联合国','国际 政治','时事')
    20 = @('数据分析','数据科学','Python 数据分析','机器学习','统计','Excel','SQL','可视化')
}

# ---- 读取全部课程 ----
$courses = New-Object System.Collections.Generic.List[object]
foreach ($f in @('init.sql','seed\seed_1_math.sql','seed\seed_2_cs.sql','seed\seed_3_science.sql','seed\seed_4_human.sql','seed\seed_5_lang.sql','seed\seed_6_art.sql')) {
    $path = Join-Path $repo $f
    if (-not (Test-Path $path)) { continue }
    $text = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    foreach ($m in [regex]::Matches($text, "INSERT IGNORE INTO sekai_learning_courses \(id, subject_id, name, description, difficulty, estimated_hours, lesson_count, sort_order\) VALUES([\s\S]*?);")) {
        if ($m.Success) {
            foreach ($row in [regex]::Matches($m.Groups[1].Value, "\((\d+),\s*(\d+),\s*'((?:[^']|'')*)',")) {
                $courses.Add([pscustomobject]@{ Id = [int]$row.Groups[1].Value; Subject = [int]$row.Groups[2].Value; Name = ($row.Groups[3].Value -replace "''", "'") })
            }
        }
    }
}
$courses = @($courses | Sort-Object Id)
if ($Limit -gt 0) { $courses = @($courses | Select-Object -First $Limit) }
Write-Host "共 $($courses.Count) 门课程(本次), 目标每课 $TargetPerCourse 条"

# ---- 读取已抓取的 seed_7_bilibili.sql 原行, 保留原 id ----
$baseRows = @{}   # courseId -> List<hashtable>
$baseBvids = @{}  # courseId -> set of bvid
$maxBaseId = 0
$seedFile = Join-Path $root 'seed_7_bilibili.sql'
if (Test-Path $seedFile) {
    $rowRe = [regex]"^\((\d+),\s*(\d+),\s*'((?:[^']|'')*)',\s*'((?:[^']|'')*)',\s*'((?:[^']|'')*)',\s*'((?:[^']|'')*)',\s*'((?:[^']|'')*)',\s*(\d+),\s*'((?:[^']|'')*)',\s*'((?:[^']|'')*)',\s*'([^']*)',\s*(\d+),\s*(TRUE|FALSE)\)"
    foreach ($line in [System.IO.File]::ReadAllLines($seedFile, [System.Text.Encoding]::UTF8)) {
        $m = $rowRe.Match($line)
        if (-not $m.Success) { continue }
        $id = [int]$m.Groups[1].Value
        $cid = [int]$m.Groups[2].Value
        $bvid = ''
        $url = $m.Groups[4].Value
        $bm = [regex]::Match($url, 'BV[0-9A-Za-z]+')
        if ($bm.Success) { $bvid = $bm.Value }
        if (-not $baseRows.ContainsKey($cid)) { $baseRows[$cid] = New-Object System.Collections.Generic.List[object]; $baseBvids[$cid] = @{} }
        $baseRows[$cid].Add([pscustomobject]@{
            RowId = $id; CourseId = $cid; Bvid = $bvid
            Title = $m.Groups[3].Value; Url = $url; Cover = $m.Groups[5].Value
            Author = $m.Groups[6].Value; AuthorUrl = $m.Groups[7].Value
            Play = [long]$m.Groups[8].Value; Duration = $m.Groups[9].Value
            Desc = $m.Groups[10].Value; Source = $m.Groups[11].Value
            Sort = [int]$m.Groups[12].Value; Enabled = ($m.Groups[13].Value -eq 'TRUE')
        })
        if ($bvid) { $baseBvids[$cid][$bvid] = $true }
        if ($id -gt $maxBaseId) { $maxBaseId = $id }
    }
}
Write-Host "已加载原资源行: $((@($baseRows.Values | ForEach-Object { $_.Count }) | Measure-Object -Sum).Sum) 条, 最大原 id=$maxBaseId"
$nextId = $maxBaseId + 1

# ---- 状态(断点续跑) ----
$stateFile = Join-Path $root 'fetch_state_v3.json'
$state = @{}
if (Test-Path $stateFile) {
    try { $state = (Get-Content $stateFile -Raw -Encoding UTF8 | ConvertFrom-Json -AsHashtable) } catch { $state = @{} }
}

# 候选: courseId -> hashtable(bvid -> video object)
$candidates = @{}
foreach ($cid in $baseRows.Keys) {
    $candidates[$cid] = @{}
    foreach ($row in $baseRows[$cid]) {
        if ($row.Bvid) { $candidates[$cid][$row.Bvid] = $row }
    }
}
# 恢复断点: 加载已保存的候选 (无 candidates 的旧式 done 标记视为未完成)
foreach ($cidKey in @($state.Keys)) {
    if ($state[$cidKey].done -and -not $state[$cidKey].candidates) {
        $state.Remove($cidKey)
        continue
    }
    if ($state[$cidKey].candidates) {
        $cId = [int]$cidKey
        if (-not $candidates.ContainsKey($cId)) { $candidates[$cId] = @{} }
        foreach ($cv in @($state[$cidKey].candidates)) {
            if ($cv.Bvid) { $candidates[$cId][$cv.Bvid] = $cv }
        }
    }
}

# ---- 抓取 ----
$log = New-Object System.Collections.Generic.List[string]
$fetchedThisRun = 0
foreach ($c in $courses) {
    $cid = [int]$c.Id
    if ($state.ContainsKey("$cid") -and $state["$cid"].done) {
        Write-Host "course=$cid [$($c.Name)] 已抓取, 跳过"
        continue
    }
    if (-not $candidates.ContainsKey($cid)) { $candidates[$cid] = @{} }
    $cand = $candidates[$cid]
    $kwBase = @($c.Name, ($c.Name + ' 入门'), ($c.Name + ' 基础'), ($c.Name + ' 教程'), ($c.Name + ' 进阶'), ($c.Name + ' 速成'), ($c.Name + ' 复习'), ($c.Name + ' 考点'), ($c.Name + ' 精讲'), ($c.Name + ' 期末'), ($c.Name + ' 考研'))
    $extra = @()
    if ($subjectKeywords.ContainsKey([int]$c.Subject)) { $extra = $subjectKeywords[[int]$c.Subject] }
    $keywords = @($kwBase + $extra)
    $keywords = @($keywords | Select-Object -Unique)
    $need = $TargetPerCourse + 20
    foreach ($kw in $keywords) {
        if ($cand.Count -ge $need) { break }
        for ($pg = 1; $pg -le 5; $pg++) {
            if ($cand.Count -ge $need) { break }
            $videos = Search-Videos $kw $pg
            foreach ($v in $videos) {
                if ($cand.Count -ge $need) { break }
                if ($v.play -lt 300) { continue }
                if (-not $cand.ContainsKey($v.bvid)) {
                    $cand[$v.bvid] = Normalize-Video $v
                }
            }
            Sleep-Jitter 1200 2400
        }
        Sleep-Jitter 1000 2000
    }
    $fetchedThisRun++
    $state["$cid"] = @{ done = $true; candidates = @($cand.Values) }
    $state | ConvertTo-Json -Depth 6 | Set-Content -Path $stateFile -Encoding UTF8
    $line = "course=$cid [$($c.Name)] -> 候选 $($cand.Count) 条"
    $log.Add($line)
    Write-Host $line
    if ($fetchedThisRun % 10 -eq 0) {
        Write-Host "  已抓 $fetchedThisRun 课, 休息 8s ..."
        Start-Sleep -Seconds 8
    }
    Sleep-Jitter 1200 2400
}

# ---- 学科池补足: 同课程不足 target 时, 从同学科其他课程候选里补 ----
$subjectPool = @{}
foreach ($c in $courses) {
    $cid = [int]$c.Id
    if (-not $candidates.ContainsKey($cid)) { continue }
    foreach ($bvid in $candidates[$cid].Keys) {
        if (-not $subjectPool.ContainsKey([int]$c.Subject)) { $subjectPool[[int]$c.Subject] = New-Object System.Collections.Generic.List[object] }
        $subjectPool[[int]$c.Subject].Add($candidates[$cid][$bvid])
    }
}
foreach ($c in $courses) {
    $cid = [int]$c.Id
    $cand = $candidates[$cid]
    $pool = @()
    if ($subjectPool.ContainsKey([int]$c.Subject)) { $pool = @($subjectPool[[int]$c.Subject] | Sort-Object { [long]$_.Play } -Descending) }
    foreach ($v in $pool) {
        if ($cand.Count -ge $TargetPerCourse) { break }
        if (-not $cand.ContainsKey($v.bvid)) { $cand[$v.bvid] = $v }
    }
}

# ---- 生成最终行: 每课按播放量取前 TargetPerCourse, 原行保留原 id ----
$rows = New-Object System.Collections.Generic.List[string]
$totalRows = 0
foreach ($c in $courses) {
    $cid = [int]$c.Id
    $cand = @($candidates[$cid].Values | Sort-Object { [long]$_.Play } -Descending | Select-Object -First $TargetPerCourse)
    # 确保 enabled 数 >= 100 (原行中可能有关闭的; 新抓取的行默认启用)
    $enabledCount = @($cand | Where-Object { $_.Enabled -ne $false }).Count
    if ($enabledCount -lt 100) {
        $pool = @()
        if ($subjectPool.ContainsKey([int]$c.Subject)) { $pool = @($subjectPool[[int]$c.Subject] | Sort-Object { [long]$_.Play } -Descending) }
        foreach ($v in $pool) {
            if ($enabledCount -ge 100) { break }
            if (-not $cand.Contains($v) -and $v.Enabled -ne $false) { $cand = @($cand) + $v; $enabledCount++ }
        }
    }
    $sortIdx = 0
    foreach ($v in $cand) {
        $sortIdx++
        if ($v.RowId) {
            $rid = [int]$v.RowId
            $enabled = $v.Enabled
        } else {
            $rid = $nextId; $nextId++
            $enabled = $true
        }
        $title = Clean-Html $v.Title
        $desc = Clean-Html $v.Desc
        if ($desc.Length -gt 160) { $desc = $desc.Substring(0, 160) }
        $cover = $v.Cover
        if ($cover -match '^//') { $cover = 'https:' + $cover }
        $url = $v.Url
        $author = $v.Author
        $authorUrl = $v.AuthorUrl
        $play = [long]$v.Play
        $dur = $v.Duration
        if (-not $dur) { $dur = '' }
        $rows.Add("($rid, $cid, $(Sql-Escape $title), $(Sql-Escape $url), $(Sql-Escape $cover), $(Sql-Escape $author), $(Sql-Escape $authorUrl), $play, $(Sql-Escape $dur), $(Sql-Escape $desc), 'bilibili', $sortIdx, $(if ($enabled) {'TRUE'} else {'FALSE'}))")
        $totalRows++
    }
    $line = "final course=$cid [$($c.Name)] -> $($cand.Count) 条 (enabled=$enabledCount)"
    $log.Add($line)
    Write-Host $line
}

Write-Host "抓取完成: 共 $totalRows 条资源"

# ---- 生成 SQL (全量重建) ----
$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine('-- =============================================================')
[void]$sb.AppendLine('-- 知识库扩充 Part7: B站精选学习视频资源 (sekai_learning_resources) 全量版')
[void]$sb.AppendLine("-- 共 $totalRows 条, 抓取时间 $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")
[void]$sb.AppendLine('-- 数据来源: B站公开搜索接口, 仅收录站内公开视频链接与元信息')
[void]$sb.AppendLine('-- =============================================================')
[void]$sb.AppendLine('')
[void]$sb.AppendLine('CREATE TABLE IF NOT EXISTS sekai_learning_resources (')
[void]$sb.AppendLine('    id BIGINT AUTO_INCREMENT PRIMARY KEY,')
[void]$sb.AppendLine('    course_id BIGINT NOT NULL,')
[void]$sb.AppendLine('    title VARCHAR(300) NOT NULL,')
[void]$sb.AppendLine('    url VARCHAR(500),')
[void]$sb.AppendLine('    cover_url VARCHAR(500),')
[void]$sb.AppendLine('    author VARCHAR(100),')
[void]$sb.AppendLine('    author_url VARCHAR(500),')
[void]$sb.AppendLine('    play_count BIGINT DEFAULT 0,')
[void]$sb.AppendLine('    duration VARCHAR(50),')
[void]$sb.AppendLine('    description TEXT,')
[void]$sb.AppendLine("    source_type VARCHAR(20) DEFAULT 'bilibili' COMMENT 'bilibili, article, website',")
[void]$sb.AppendLine('    sort_order INT DEFAULT 0,')
[void]$sb.AppendLine('    enabled BOOLEAN DEFAULT TRUE,')
[void]$sb.AppendLine('    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,')
[void]$sb.AppendLine('    FOREIGN KEY (course_id) REFERENCES sekai_learning_courses(id) ON DELETE CASCADE,')
[void]$sb.AppendLine('    KEY idx_course (course_id)')
[void]$sb.AppendLine(') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;')
[void]$sb.AppendLine('')
[void]$sb.AppendLine('-- 全量重建: 先清空旧数据再插入')
[void]$sb.AppendLine('TRUNCATE TABLE sekai_learning_resources;')
[void]$sb.AppendLine('')
[void]$sb.AppendLine('INSERT IGNORE INTO sekai_learning_resources (id, course_id, title, url, cover_url, author, author_url, play_count, duration, description, source_type, sort_order, enabled) VALUES')
for ($i = 0; $i -lt $rows.Count; $i++) {
    $end = if ($i -eq $rows.Count - 1) { ';' } else { ',' }
    [void]$sb.AppendLine($rows[$i] + $end)
}
[void]$sb.AppendLine('')

[System.IO.File]::WriteAllText($seedFile, $sb.ToString(), [System.Text.Encoding]::UTF8)
$logPath = Join-Path $root 'bilibili_fetch_log.txt'
[System.IO.File]::WriteAllLines($logPath, $log, [System.Text.Encoding]::UTF8)
Write-Host "已生成: $seedFile ($totalRows 条)"
