# -*- coding: utf-8 -*-
"""
SekaiLearning 知识图解生成器 (gen_diagrams.py)
为课时生成与主题对应的说明性 SVG 示意图, 以 data URI 形式嵌入课时内容。
- 主题: 奶油纸感暖色调, 与应用配色一致 (bg #F7F1E5, 焦糖橙 #B85E24, 柔粉 #A85A50, 淡紫 #7A5C96)
- 每个学科提供多类图解(函数图像/图表/结构图/时间轴/示意图等), 标注本章与本节主题
"""
import base64, math, re

# ---------- 基础工具 ----------
W, H = 640, 360
BG = '#F7F1E5'
PANEL = '#FFFDF7'
GRID = '#EADFC9'
TXT = '#4A4038'
DIM = '#6E6250'
CYAN = '#B85E24'
PINK = '#A85A50'
PURPLE = '#7A5C96'
AMBER = '#A87A2E'
GREEN = '#46703D'
RED = '#B84040'

def esc(s):
    return (str(s).replace('&', '&amp;').replace('<', '&lt;').replace('>', '&gt;'))

def T(x, y, s, size=15, fill=TXT, anchor='middle', weight='normal', family='Microsoft YaHei, PingFang SC, sans-serif'):
    return ('<text x="%d" y="%d" font-size="%d" fill="%s" text-anchor="%s" font-weight="%s" '
            'font-family="%s">%s</text>' % (x, y, size, fill, anchor, weight, family, esc(s)))

def L(x1, y1, x2, y2, color=CYAN, width=2, dash=''):
    d = ' stroke-dasharray="%s"' % dash if dash else ''
    return '<line x1="%d" y1="%d" x2="%d" y2="%d" stroke="%s" stroke-width="%d"%s/>' % (x1, y1, x2, y2, color, width, d)

def R(x, y, w, h, fill=PANEL, stroke=CYAN, sw=1.5, rx=8):
    return '<rect x="%d" y="%d" width="%d" height="%d" rx="%d" fill="%s" stroke="%s" stroke-width="%s"/>' % (x, y, w, h, rx, fill, stroke, sw)

def C(cx, cy, r, fill='none', stroke=CYAN, sw=2, dash=''):
    d = ' stroke-dasharray="%s"' % dash if dash else ''
    return '<circle cx="%d" cy="%d" r="%d" fill="%s" stroke="%s" stroke-width="%d"%s/>' % (cx, cy, r, fill, stroke, sw, d)

def P(pts, fill='none', stroke=CYAN, sw=2):
    return '<polygon points="%s" fill="%s" stroke="%s" stroke-width="%d"/>' % (pts, fill, stroke, sw)

def ARR(x1, y1, x2, y2, color=CYAN, sw=2):
    """带箭头的线 (箭头在 x2,y2 端)"""
    import math as _m
    ang = _m.atan2(y2 - y1, x2 - x1)
    s = 10
    ax = x2 - s * _m.cos(ang - 0.42)
    ay = y2 - s * _m.sin(ang - 0.42)
    bx = x2 - s * _m.cos(ang + 0.42)
    by = y2 - s * _m.sin(ang + 0.42)
    return (L(x1, y1, x2, y2, color, sw) +
            P('%d,%d %d,%d %d,%d' % (x2, y2, int(ax), int(ay), int(bx), int(by)), fill=color, stroke=color, sw=1))

def header(title, sub, color=CYAN):
    return ('<rect x="0" y="0" width="%d" height="%d" fill="%s"/>' % (W, H, BG) +
            '<rect x="12" y="12" width="%d" height="%d" rx="10" fill="%s" stroke="%s" stroke-width="1"/>' % (W - 24, H - 24, PANEL, color) +
            T(W // 2, 40, title, 19, TXT, 'middle', 'bold') +
            T(W // 2, 62, sub, 13, DIM))

def frame(title, sub, body, color=CYAN):
    return ('<svg xmlns="http://www.w3.org/2000/svg" width="%d" height="%d" viewBox="0 0 %d %d">' % (W, H, W, H) +
            header(title, sub, color) + body + '</svg>')

def axes(x0, y0, x1, y1, xtitle='', ytitle='', grid=True):
    out = ''
    if grid:
        for gx in range(x0, x1 + 1, 80):
            out += L(gx, y0, gx, y1, GRID, 1)
        for gy in range(y1, y0 - 1, 60):
            out += L(x0, gy, x1, gy, GRID, 1)
    out += L(x0, y0, x1, y0, TXT, 2)          # x 轴
    out += L(x0, y0, x0, y1, TXT, 2)          # y 轴
    if xtitle: out += T((x0 + x1) // 2, y0 + 26, xtitle, 13, DIM)
    if ytitle: out += T(x0 - 42, (y0 + y1) // 2, ytitle, 13, DIM)
    return out

# ---------- 数学表达式安全求值 (绘制函数图像) ----------
import ast as _ast
_NAMES = {'x': 0.0, 'sin': math.sin, 'cos': math.cos, 'tan': math.tan,
          'exp': math.exp, 'log': math.log, 'sqrt': math.sqrt, 'abs': abs,
          'pi': math.pi, 'e': math.e, 'ln': math.log}
def _eval_expr(expr, x):
    tree = _ast.parse(expr, mode='eval')
    return eval(compile(tree, '<expr>', 'eval'), {'__builtins__': {}}, dict(_NAMES, x=x))

def plot(expr, x0, x1, n=120):
    """采样生成折线 path, 返回 (path_d, 有效点计数)"""
    pts = []
    ok = 0
    for i in range(n + 1):
        x = x0 + (x1 - x0) * i / n
        try:
            y = _eval_expr(expr, x)
            if y is None or not math.isfinite(y):
                y = None
        except Exception:
            y = None
        pts.append((x, y))
    d = ''
    pen = False
    for (x, y) in pts:
        if y is None:
            pen = False
            continue
        if -1e6 < y < 1e6:
            d += ('M' if not pen else 'L') + '%.1f %.1f ' % (x, y)
            pen = True
            ok += 1
    return d, ok

# =============================================================
# 通用图解构件
# =============================================================

def diagram_chart(title, sub, kind='bar', labels=None, values=None, color=CYAN):
    """柱状图 / 折线图 / 散点图"""
    if labels is None:
        labels = ['A', 'B', 'C', 'D']
    if values is None:
        values = [60, 75, 55, 90]
    x0, y0, x1, y1 = 70, 280, 600, 90
    body = axes(x0, y0, x1, y1, '序列/类别', '数值')
    n = max(len(values), 1)
    xmax, vmax = 1, max([v for v in values] + [1])
    bw = (x1 - x0 - 40) / n
    if kind == 'bar':
        for i, (lb, v) in enumerate(zip(labels, values)):
            bx = x0 + 20 + i * bw
            bh = (y0 - y1 - 10) * v / vmax
            body += '<rect x="%.1f" y="%.1f" width="%.1f" height="%.1f" rx="4" fill="%s" opacity="0.9"/>' % (bx, y0 - bh, bw * 0.55, bh, color)
            body += T(bx + bw * 0.27, y0 - bh - 8, '%.1f' % v, 11, TXT)
            body += T(bx + bw * 0.27, y0 + 18, esc(str(lb))[:6], 11, DIM)
    elif kind == 'line':
        px = [x0 + 20 + i * bw for i in range(n)]
        py = [y0 - (y0 - y1 - 10) * v / vmax for v in values]
        pts = ' '.join('%.1f,%.1f' % (a, b) for a, b in zip(px, py))
        body += '<polyline points="%s" fill="none" stroke="%s" stroke-width="2.5"/>' % (pts, color)
        for (a, b, v, lb) in zip(px, py, values, labels):
            body += C(a, b, 4, fill=color, stroke=color, sw=1)
            body += T(a, b - 12, '%.1f' % v, 11, TXT)
            body += T(a, y0 + 18, esc(str(lb))[:6], 11, DIM)
    else:  # scatter
        import random as _r
        rng = _r.Random(42)
        for i in range(14):
            sx = x0 + 20 + rng.random() * (x1 - x0 - 40)
            sy = y0 - 20 - rng.random() * (y0 - y1 - 30)
            body += C(sx, sy, 4.5, fill=color, stroke=color, sw=1)
        body += T(x0 + (x1 - x0) * 0.6, y0 - (y0 - y1) * 0.65, '分布趋势示意图', 13, DIM)
    return frame(title, sub, body, color)

def diagram_plot(title, sub, expr='x*x/4', x0=-4, x1=4, extra='', color=CYAN):
    """函数图像"""
    x0p, y0p, x1p, y1p = 70, 285, 600, 75
    body = axes(x0p, y0p, x1p, y1p, 'x', 'y')
    d, ok = plot(expr, x0, x1)
    if ok > 2:
        # 缩放到绘图区
        raw = []
        for i in range(0, 160):
            x = x0 + (x1 - x0) * i / 160
            try:
                y = _eval_expr(expr, x)
                if y is not None and math.isfinite(y):
                    raw.append((x, y))
            except Exception:
                pass
        if raw:
            ys = [y for _, y in raw]
            ymin, ymax = min(ys), max(ys)
            if ymax - ymin < 1e-9:
                ymax = ymin + 1
            dd = ''
            pen = False
            for (x, y) in raw:
                px = x0p + (x - x0) / (x1 - x0) * (x1p - x0p)
                py = y0p - (y - ymin) / (ymax - ymin) * (y0p - y1p)
                dd += ('M' if not pen else 'L') + '%.1f %.1f ' % (px, py)
                pen = True
            body += '<path d="%s" fill="none" stroke="%s" stroke-width="3" stroke-linecap="round"/>' % (dd, color)
            body += T((x0p + x1p) / 2, y0p + 26, 'y = %s' % esc(expr), 14, AMBER, 'middle', 'bold')
    body += extra
    return frame(title, sub, body, color)

def diagram_normal(title, sub, color=CYAN):
    """正态分布曲线 (带 μ±σ 区间)"""
    x0, y0, x1, y1 = 70, 285, 600, 75
    body = axes(x0, y0, x1, y1, 'x', '概率密度')
    import math as m
    path = ''
    for i in range(200):
        x = -4 + 8 * i / 200
        y = m.exp(-x * x / 2) / m.sqrt(2 * m.pi)
        px = x0 + (x + 4) / 8 * (x1 - x0)
        py = y0 - (y / 0.42) * (y0 - y1)
        path += ('M' if i == 0 else 'L') + '%.1f %.1f ' % (px, py)
    body += '<path d="%s" fill="none" stroke="%s" stroke-width="3"/>' % (path, color)
    body += '<path d="%s L%d,%d L%d,%d Z" fill="%s" opacity="0.18"/>' % (path, x0 + (x1 - x0) // 2 - 110, y0, x0 + (x1 - x0) // 2 + 110, y0, color)
    body += L(x0 + (x1 - x0) // 2, y1, x0 + (x1 - x0) // 2, y0, DIM, 1, '6,4')
    body += T(x0 + (x1 - x0) // 2, y1 + 22, 'μ', 14, AMBER)
    body += T(x0 + (x1 - x0) // 2 - 110, y1 + 22, 'μ−σ', 13, DIM)
    body += T(x0 + (x1 - x0) // 2 + 110, y1 + 22, 'μ+σ', 13, DIM)
    body += T(x0 + (x1 - x0) // 2, y0 - 70, '约 68% 落在 μ±σ', 14, TXT)
    return frame(title, sub, body, color)

def diagram_boxes(title, sub, items=None, vertical=False, color=CYAN):
    """盒子+箭头流程图 (items: (文本, 颜色) 或 文本)"""
    if items is None:
        items = ['起点', '过程', '终点']
    n = len(items)
    if vertical:
        bw, bh, gap = 300, 52, 34
        x = (W - bw) // 2
        y0 = 92
        body = ''
        for i, it in enumerate(items):
            lab, col = (it if isinstance(it, tuple) else (it, color))
            yy = y0 + i * (bh + gap)
            body += R(x, yy, bw, bh, PANEL, col, 2)
            body += T(x + bw // 2, yy + bh // 2 + 5, lab, 15, TXT)
            if i < n - 1:
                body += ARR(x + bw // 2, yy + bh + 2, x + bw // 2, yy + bh + gap - 2, DIM, 2)
    else:
        bw, bh, gap = 150, 58, 40
        y = 120
        total = n * bw + (n - 1) * gap
        x0 = (W - total) // 2
        body = ''
        for i, it in enumerate(items):
            lab, col = (it if isinstance(it, tuple) else (it, color))
            xx = x0 + i * (bw + gap)
            body += R(xx, y, bw, bh, PANEL, col, 2)
            body += T(xx + bw // 2, y + bh // 2 + 5, lab, 14, TXT)
            if i < n - 1:
                body += ARR(xx + bw + 4, y + bh // 2, xx + bw + gap - 4, y + bh // 2, DIM, 2)
    return frame(title, sub, body, color)

def diagram_tree(title, sub, root=None, children=None, color=CYAN):
    """树形结构"""
    if root is None:
        root = '根节点'
    if children is None:
        children = ['子节点 1', '子节点 2', '子节点 3']
    body = ''
    cx, cy = W // 2, 95
    body += C(cx, cy, 26, PANEL, color, 2)
    body += T(cx, cy + 5, root, 14, TXT)
    n = len(children)
    if n:
        spacing = 150
        y2 = 215
        for i, ch in enumerate(children):
            x2 = W // 2 + (i - (n - 1) / 2) * spacing
            body += L(cx, cy + 26, x2, y2 - 30, color, 1.5)
            body += C(x2, y2, 24, PANEL, color, 2)
            body += T(x2, y2 + 5, ch, 12, TXT)
    return frame(title, sub, body, color)

def diagram_timeline(title, sub, events=None, color=CYAN):
    """时间轴"""
    if events is None:
        events = ['第一阶段', '第二阶段', '第三阶段', '第四阶段']
    x0, x1, y = 70, 600, 190
    body = L(x0, y, x1, y, TXT, 3)
    n = len(events)
    for i, ev in enumerate(events):
        ex = x0 + (x1 - x0) * (i + 0.5) / max(n, 1)
        body += C(ex, y, 6, fill=color, stroke=color, sw=1)
        up = i % 2 == 0
        body += L(ex, y, ex, y + (12 if up else -12), DIM, 1)
        body += T(ex, y - 14 if up else y + 30, ev, 12, TXT)
    return frame(title, sub, body, color)

def diagram_pyramid(title, sub, layers=None, color=CYAN):
    """金字塔分层 (layers: 自底向上的标签列表)"""
    if layers is None:
        layers = ['基础层', '中层', '顶层']
    body = ''
    n = len(layers)
    base_w, top_w, h = 420, 120, 52
    cx = W // 2
    for i in range(n):
        w_bottom = base_w - (base_w - top_w) * i / n
        w_top = base_w - (base_w - top_w) * (i + 1) / n
        yb = 300 - i * h
        yt = yb - h
        xb0, xb1 = cx - w_bottom / 2, cx + w_bottom / 2
        xt0, xt1 = cx - w_top / 2, cx + w_top / 2
        body += P('%d,%d %d,%d %d,%d %d,%d' % (xb0, yb, xb1, yb, xt1, yt, xt0, yt), fill=PANEL, stroke=color, sw=1.5)
        body += T(cx, (yt + yb) // 2 + 5, layers[i], 14, TXT)
    return frame(title, sub, body, color)

def diagram_grid(title, sub, rows=4, cols=4, cells=None, cell_w=64, cell_h=34, color=CYAN):
    """表格/网格 (cells: 行主序标签列表)"""
    if cells is None:
        cells = []
    total_w = cols * cell_w
    x0 = (W - total_w) // 2
    y0 = 120
    body = ''
    for r in range(rows):
        for c in range(cols):
            lab = cells[r * cols + c] if r * cols + c < len(cells) else ''
            body += R(x0 + c * cell_w, y0 + r * cell_h, cell_w, cell_h, PANEL, color, 1, 4)
            body += T(x0 + c * cell_w + cell_w // 2, y0 + r * cell_h + cell_h // 2 + 4, lab, 13, TXT)
    return frame(title, sub, body, color)

def diagram_concentric(title, sub, layers, color=CYAN):
    """同心圆分层 (layers: 由外到内标签)"""
    body = ''
    r0 = 150
    n = len(layers)
    for i, lab in enumerate(layers):
        r = r0 - i * (r0 // max(n, 1))
        body += C(W // 2, 200, max(r, 12), PANEL, color, 1.5)
        body += T(W // 2, 200, lab, 13, TXT)
    return frame(title, sub, body, color)

def diagram_forces(title, sub, color=CYAN):
    """受力分析: 质点 + 各方向力箭头"""
    cx, cy = 320, 185
    body = C(cx, cy, 14, PANEL, color, 2.5)
    forces = [('F_重力 mg', 0, 1, RED), ('F_支持力 N', 0, -1, GREEN),
              ('F_拉力 F', 1, 0, CYAN), ('f_摩擦力', -1, 0, AMBER)]
    for lab, dx, dy, col in forces:
        ex = cx + dx * 130
        ey = cy + dy * 110
        body += ARR(cx, cy, ex, ey, col, 3)
        body += T(ex + dx * 18, ey + dy * 18 + 4, lab, 13, col)
    return frame(title, sub, body, color)

def diagram_wave(title, sub, color=CYAN):
    """正弦波: 标注波长与振幅"""
    x0, y0, x1, y1 = 60, 255, 600, 80
    body = axes(x0, y0, x1, y1, 'x', 'y', grid=False)
    path = ''
    for i in range(240):
        x = i / 239
        y = math.sin(x * 4 * math.pi)
        px = x0 + x * (x1 - x0)
        py = y0 - 80 - y * 70
        path += ('M' if i == 0 else 'L') + '%.1f %.1f ' % (px, py)
    body += '<path d="%s" fill="none" stroke="%s" stroke-width="3"/>' % (path, color)
    lam = (x1 - x0) / 2
    body += ARR(x0 + 30, y0 - 80, x0 + 30 + lam, y0 - 80, AMBER, 2)
    body += T(x0 + 30 + lam / 2, y0 - 90, '波长 λ', 13, AMBER)
    body += ARR(x1 - 40, y0 - 80, x1 - 40, y0 - 150, PINK, 2)
    body += T(x1 - 28, y0 - 122, '振幅 A', 13, PINK)
    return frame(title, sub, body, color)

def diagram_circuit(title, sub, color=CYAN):
    """简单串联电路: 电池 + 开关 + 灯泡 + 电阻"""
    body = ''
    x0, y0 = 150, 90
    x1, y1 = 490, 270
    body += L(x0, y0, x1, y0, color, 3)
    body += L(x1, y0, x1, y1, color, 3)
    body += L(x1, y1, x0, y1, color, 3)
    body += L(x0, y1, x0, y0 + 60, color, 3)
    # 电池
    body += R(x0 - 14, y0 + 8, 28, 44, PANEL, GREEN, 2, 4)
    body += T(x0, y0 + 40, '电池', 12, GREEN)
    # 灯泡
    body += C(x0, y1 - 40, 22, PANEL, AMBER, 2.5)
    body += T(x0, y1 - 40, '💡', 16, AMBER)
    body += T(x0, y1 - 12, '灯泡', 12, AMBER)
    # 电阻 (锯齿)
    rx, ry = 320, 180
    body += L(x0, y1, rx - 30, y1, color, 3)
    zig = ''
    for i in range(6):
        zig += '%d,%d ' % (rx - 30 + i * 10, y1 - (12 if i % 2 == 0 else 12))
    body += '<polyline points="%s" fill="none" stroke="%s" stroke-width="3"/>' % (zig, color)
    body += L(rx + 30, y1, x1, y1, color, 3)
    body += T(rx, y1 + 22, '电阻 R', 13, PINK)
    body += T(W // 2, 330, '电流方向: 电池正极 → 导线 → 元件', 13, DIM)
    return frame(title, sub, body, color)

def diagram_supply_demand(title, sub, color=CYAN):
    """供求曲线"""
    x0, y0, x1, y1 = 80, 275, 580, 90
    body = axes(x0, y0, x1, y1, '数量 Q', '价格 P')
    body += L(x0 + 40, y0 - 30, x1 - 40, y1 + 40, GREEN, 3.5)   # 需求曲线 (右下)
    body += L(x0 + 40, y1 + 40, x1 - 40, y0 - 30, AMBER, 3.5)   # 供给曲线 (右上)
    # 均衡点
    ex = x0 + 130
    ey = y0 - 95
    body += C(ex, ey, 6, fill=PINK, stroke=PINK, sw=1)
    body += L(ex, y0 + 10, ex, ey, DIM, 1, '5,4')
    body += T(ex, y0 + 28, 'Q*', 13, PINK)
    body += L(x0 - 30, ey, ex, ey, DIM, 1, '5,4')
    body += T(x0 - 46, ey + 5, 'P*', 13, PINK)
    body += T(x1 - 60, y1 + 55, 'D 需求', 14, GREEN)
    body += T(x1 - 60, y0 - 42, 'S 供给', 14, AMBER)
    return frame(title, sub, body, color)

def diagram_venn(title, sub, labels=('A', 'B'), color=CYAN):
    """文氏图 (两个集合)"""
    body = ''
    body += C(255, 195, 78, 'none', CYAN, 2.5)
    body += C(385, 195, 78, 'none', PINK, 2.5)
    body += T(205, 180, labels[0], 18, CYAN, 'middle', 'bold')
    body += T(435, 180, labels[1], 18, PINK, 'middle', 'bold')
    body += T(320, 195, 'A∩B', 15, AMBER)
    return frame(title, sub, body, color)

def diagram_formula_card(title, sub, formulas, color=CYAN):
    """公式卡片"""
    body = ''
    y = 115
    for i, f in enumerate(formulas[:4]):
        body += R(90, y, W - 180, 48, PANEL, color, 1.5)
        body += T(W // 2, y + 30, f, 16, AMBER if i % 2 == 0 else TXT, 'middle', 'bold')
        y += 60
    return frame(title, sub, body, color)

def diagram_concept_card(title, sub, concepts, color=CYAN):
    """概念卡片"""
    body = ''
    y = 105
    for i, c in enumerate(concepts[:5]):
        body += R(70, y, W - 140, 40, PANEL, color if i % 2 == 0 else PURPLE, 1.2)
        body += T(W // 2, y + 25, c, 14, TXT)
        y += 48
    return frame(title, sub, body, color)

def diagram_bubbles(title, sub, texts, color=CYAN):
    """对话气泡"""
    body = ''
    y = 110
    for i, t in enumerate(texts[:3]):
        side = i % 2
        x = 70 if side == 0 else 230
        bw = 340
        body += R(x, y, bw, 58, PANEL, color if side == 0 else PINK, 1.5)
        tail = '%d,%d %d,%d %d,%d' % (x + (30 if side == 0 else bw - 30), y + 58, x + (46 if side == 0 else bw - 46), y + 58, x + (38 if side == 0 else bw - 38), y + 72)
        body += P(tail, fill=PANEL, stroke=PANEL, sw=1)
        body += T(x + bw // 2, y + 34, t, 14, TXT)
        y += 88
    return frame(title, sub, body, color)

def diagram_staff(title, sub, color=CYAN):
    """五线谱 + 音符"""
    body = ''
    x0, x1 = 90, 560
    y0 = 150
    for i in range(5):
        body += L(x0, y0 + i * 14, x1, y0 + i * 14, DIM, 1.2)
    notes = [(1, 0.5), (3, 1), (4, 1.5), (2, 2), (4, 2.5), (1, 3)]
    for i, (line, beat) in enumerate(notes):
        nx = x0 + 60 + i * 78
        ny = y0 + line * 14
        body += C(nx, ny, 8, fill=PINK, stroke=PINK, sw=1)
        body += L(nx + 8, ny, nx + 8, ny - 34, PINK, 2)
        body += T(nx, ny + 30, '拍 %d' % int(beat + 1), 11, DIM)
    body += T(W // 2, 300, '音高越高, 音符在五线谱上的位置越高', 13, DIM)
    return frame(title, sub, body, color)

def diagram_piano(title, sub, color=CYAN):
    """钢琴键盘 (C 大调音阶)"""
    body = ''
    x0, y0 = 80, 200
    white, black = 44, 26
    notes = ['C', 'D', 'E', 'F', 'G', 'A', 'B', 'C2']
    for i, n in enumerate(notes):
        body += R(x0 + i * white, y0, white, 90, '#FFFDF7', '#D9CBB2', 1, 0)
        body += T(x0 + i * white + white // 2, y0 + 112, n, 13, TXT)
    blacks = [0, 1, 3, 4, 5]
    for i in blacks:
        body += R(x0 + (i + 1) * white - black // 2, y0, black, 56, '#4A4038', TXT, 1, 0)
    body += T(W // 2, 320, '黑键为升/降半音 (如 C#/Db)', 13, DIM)
    return frame(title, sub, body, color)

def diagram_note_values(title, sub, color=CYAN):
    """音符时值对比"""
    body = ''
    items = [('全音符', '4 拍', 200), ('二分音符', '2 拍', 160), ('四分音符', '1 拍', 120), ('八分音符', '1/2 拍', 80)]
    y = 110
    for name, beats, w in items:
        body += R(120, y, w, 40, PANEL, color, 1.5)
        body += T(120 + w // 2, y + 26, name, 13, TXT)
        body += T(120 + w + 24, y + 26, beats, 13, AMBER)
        y += 58
    return frame(title, sub, body, color)

def diagram_colorwheel(title, sub, color=CYAN):
    """色轮 12 色相"""
    body = ''
    cx, cy, r = W // 2, 190, 120
    cols = ['#ff5b5b', '#ff8b4d', '#ffd166', '#a8e063', '#5ee08c', '#41d8c8',
            '#41b8e8', '#5b7cff', '#8b5bff', '#c45bff', '#ff5bc8', '#ff5b8b']
    for i, c in enumerate(cols):
        a0 = math.radians(i * 30)
        a1 = math.radians((i + 1) * 30)
        body += '<path d="M%d,%d L%d,%d A%d,%d 0 0 1 %d,%d Z" fill="%s" stroke="%s" stroke-width="1"/>' % (
            cx, cy, cx + r * math.cos(a0), cy + r * math.sin(a0),
            r, r, cx + r * math.cos(a1), cy + r * math.sin(a1), c, BG)
    body += C(cx, cy, r, 'none', TXT, 2)
    body += T(cx, cy, '色相环', 14, TXT)
    return frame(title, sub, body, color)

def diagram_value_scale(title, sub, color=CYAN):
    """明度阶梯"""
    body = ''
    x0, y0 = 90, 180
    n = 9
    bw = (W - 180) // n
    for i in range(n):
        v = 255 * i // (n - 1)
        body += R(x0 + i * bw, y0, bw, 70, '#%02x%02x%02x' % (v, v, v), DIM, 1, 0)
    body += T(x0, y0 + 100, '暗 ← 明度阶梯 → 亮', 13, DIM)
    return frame(title, sub, body, color)

def diagram_rule_thirds(title, sub, color=CYAN):
    """三分法构图"""
    body = ''
    body += R(90, 80, W - 180, 220, PANEL, color, 1.5)
    for i in (1, 2):
        body += L(90 + (W - 180) * i / 3, 80, 90 + (W - 180) * i / 3, 300, DIM, 1, '6,4')
        body += L(90, 80 + 220 * i / 3, W - 90, 80 + 220 * i / 3, DIM, 1, '6,4')
    body += C(90 + (W - 180) * 2 / 3, 80 + 220 / 3, 8, fill=PINK, stroke=PINK, sw=1)
    body += T(W // 2, 330, '把主体放在 4 个交叉点上, 画面更平衡', 13, DIM)
    return frame(title, sub, body, color)

def diagram_dna(title, sub, color=CYAN):
    """DNA 双螺旋示意"""
    body = ''
    x0, x1 = 90, 570
    y0 = 100
    s1, s2 = '', ''
    for i in range(160):
        x = i / 159
        px = x0 + x * (x1 - x0)
        py1 = y0 + math.sin(x * 4 * math.pi) * 40
        py2 = y0 + 160 - math.sin(x * 4 * math.pi) * 40
        s1 += ('M' if i == 0 else 'L') + '%.1f %.1f ' % (px, py1)
        s2 += ('M' if i == 0 else 'L') + '%.1f %.1f ' % (px, py2)
    body += '<path d="%s" fill="none" stroke="%s" stroke-width="3"/>' % (s1, color)
    body += '<path d="%s" fill="none" stroke="%s" stroke-width="3"/>' % (s2, PINK)
    for i in range(9):
        x = x0 + (x1 - x0) * (i + 0.5) / 9
        y1 = y0 + math.sin((i + 0.5) / 9 * 4 * math.pi) * 40
        y2 = y0 + 160 - math.sin((i + 0.5) / 9 * 4 * math.pi) * 40
        body += L(x, y1, x, y2, AMBER, 1.5)
    body += T(W // 2, 300, '两条链反向平行, 碱基互补配对 (A-T, G-C)', 13, DIM)
    return frame(title, sub, body, color)

def diagram_cell(title, sub, color=CYAN):
    """细胞结构示意"""
    body = ''
    cx, cy, r = W // 2, 190, 110
    body += C(cx, cy, r, 'none', color, 3)
    body += C(cx, cy, r - 14, PANEL, DIM, 1)
    body += C(cx, cy, 34, PANEL, PINK, 2)
    body += T(cx, cy + 5, '细胞核', 13, TXT)
    org = [('线粒体', cx - 70, cy - 55), ('内质网', cx + 65, cy - 60), ('高尔基体', cx + 60, cy + 60), ('核糖体', cx - 65, cy + 55)]
    for lab, ox, oy in org:
        body += C(ox, oy, 16, PANEL, AMBER, 1.5)
        body += T(ox, oy + 4, lab, 11, DIM)
    body += T(W // 2, 330, '细胞是生命活动的基本单位', 13, DIM)
    return frame(title, sub, body, color)

def diagram_molecule(title, sub, color=CYAN):
    """分子结构示意 (通用)"""
    body = ''
    cx, cy = W // 2, 190
    atoms = [('A', cx, cy - 90, CYAN), ('B', cx - 95, cy + 45, PINK), ('C', cx + 95, cy + 45, AMBER)]
    for lab, ax, ay, col in atoms:
        body += C(ax, ay, 30, PANEL, col, 2.5)
        body += T(ax, ay + 5, lab, 16, col, 'middle', 'bold')
    body += L(cx, cy - 60, cx - 70, cy + 32, DIM, 3)
    body += L(cx, cy - 60, cx + 70, cy + 32, DIM, 3)
    body += L(cx - 70, cy + 32, cx + 70, cy + 32, DIM, 3)
    body += T(cx, 320, '中心原子与配位原子通过化学键连接', 13, DIM)
    return frame(title, sub, body, color)

def diagram_ph(title, sub, val=7, color=CYAN):
    """pH 标尺"""
    body = ''
    x0, x1, y = 90, 570, 200
    body += R(x0, y, x1 - x0, 26, '#333', DIM, 1, 0)
    seg = (x1 - x0) / 14
    for i in range(14):
        col = '%s' % ('#e05b5b' if i < 7 else '#5b8be0' if i == 7 else '#5be0a0')
        body += R(x0 + i * seg, y, seg + 1, 26, col, 'none', 0, 0)
    body += L(x0 + val * seg, y - 14, x0 + val * seg, y + 40, TXT, 2.5)
    body += T(x0 + val * seg, y - 24, 'pH = %d' % val, 14, AMBER)
    for i in range(0, 15, 1):
        if i % 2 == 0:
            body += T(x0 + i * seg, y + 44, str(i), 11, DIM)
    body += T(x0, y + 76, '酸性', 13, RED)
    body += T(x1, y + 76, '碱性', 13, GREEN)
    return frame(title, sub, body, color)

def diagram_solar(title, sub, color=CYAN):
    """太阳系示意"""
    body = ''
    cx, cy = W // 2, 190
    body += C(cx, cy, 26, AMBER, AMBER, 2)
    body += T(cx, cy + 5, '☀', 16, TXT)
    for i, r in enumerate(range(55, 175, 24)):
        body += C(cx, cy, r, 'none', DIM, 1, '4,4')
        ang = math.radians(i * 47)
        body += C(cx + r * math.cos(ang), cy + r * math.sin(ang), 6, color, color, 1)
    body += T(W // 2, 330, '行星沿椭圆轨道绕太阳公转 (示意)', 13, DIM)
    return frame(title, sub, body, color)

def diagram_hr(title, sub, color=CYAN):
    """赫罗图 (恒星)"""
    x0, y0, x1, y1 = 80, 270, 580, 95
    body = axes(x0, y0, x1, y1, '表面温度 (高 → 低)', '光度 (高 → 低)')
    import random as _r
    rng = _r.Random(7)
    for i in range(40):
        # 主序带
        t = rng.random()
        sx = x0 + t * (x1 - x0)
        sy = y0 - t * (y0 - y1) * 0.8 - 15
        body += C(sx, sy, 3.5, fill=color, stroke=color, sw=0.5)
    body += L(x0 + 30, y0 - 40, x1 - 30, y1 + 30, PINK, 2, '8,5')
    body += T(x0 + (x1 - x0) * 0.55, y0 - (y0 - y1) * 0.55, '主序星', 13, PINK)
    return frame(title, sub, body, color)

def diagram_globe(title, sub, nodes=6, color=CYAN):
    """世界网络示意 (地球节点连线)"""
    body = ''
    cx, cy, r = W // 2, 195, 120
    body += C(cx, cy, r, 'none', color, 2)
    body += C(cx, cy, r, 'none', DIM, 1, '6,4')
    pts = []
    for i in range(nodes):
        ang = math.radians(90 + i * 360 / nodes)
        pts.append((cx + r * 0.88 * math.cos(ang), cy + r * 0.88 * math.sin(ang)))
    for i in range(nodes):
        for j in range(i + 1, nodes):
            body += L(pts[i][0], pts[i][1], pts[j][0], pts[j][1], DIM, 1)
    for (px, py) in pts:
        body += C(px, py, 8, PINK, PINK, 1.5)
    body += T(W // 2, 330, '全球节点互联 (示意)', 13, DIM)
    return frame(title, sub, body, color)

def diagram_earth_layers(title, sub, color=CYAN):
    """地球圈层结构"""
    body = ''
    cx, cy = W // 2, 195
    layers = [('地壳', 150, CYAN), ('地幔', 105, AMBER), ('外核', 62, PINK), ('内核', 28, RED)]
    for lab, r, col in layers:
        body += C(cx, cy, r, 'none', col, 2)
        body += T(cx, cy, '', 0, TXT)
    body += T(cx, cy - 8, '内核', 12, TXT)
    body += T(cx - 92, cy - 118, '地壳', 12, CYAN)
    body += T(cx + 66, cy - 60, '地幔', 12, AMBER)
    body += T(cx - 52, cy + 8, '外核', 12, PINK)
    return frame(title, sub, body, color)

def diagram_pipeline(title, sub, steps=None, color=CYAN):
    """流水线流程 (数据分析/项目流程)"""
    if steps is None:
        steps = ['获取', '清洗', '分析', '呈现']
    return diagram_boxes(title, sub, steps, color=color)

def diagram_screenshot(title, sub, steps=None, color=CYAN):
    """步骤截图风格: 窗口框架 + 编号步骤面板"""
    if steps is None:
        steps = ['第一步：明确目标', '第二步：准备材料', '第三步：执行操作', '第四步：检查结果']
    body = ''
    # 窗口标题栏
    body += R(50, 66, W - 100, 34, '#EFE6D2', '#D9CBB2', 1, 6)
    for i, c in enumerate((RED, AMBER, GREEN)):
        body += C(72 + i * 22, 83, 5, fill=c, stroke='none', sw=0)
    body += T(W // 2, 88, '操作步骤示例', 12, DIM)
    y = 116
    for i, s in enumerate(steps[:4]):
        col = [CYAN, AMBER, PINK, GREEN][i % 4]
        body += R(70, y, W - 140, 44, PANEL, col, 1.2)
        body += C(102, y + 22, 12, fill=col, stroke='none', sw=0)
        body += T(102, y + 27, str(i + 1), 12, '#FFFDF7', 'middle', 'bold')
        body += T(132, y + 27, s, 14, TXT)
        y += 52
    return frame(title, sub, body, color)

def diagram_brain(title, sub, color=CYAN):
    """大脑功能分区示意 (简化)"""
    body = ''
    cx, cy = W // 2, 190
    body += C(cx, cy, 100, 'none', color, 2.5)
    body += L(cx - 100, cy, cx + 100, cy, DIM, 1, '6,4')
    body += L(cx, cy - 100, cx, cy + 100, DIM, 1, '6,4')
    zones = [('额叶·思维', cx - 50, cy - 50, CYAN), ('顶叶·感觉', cx + 50, cy - 50, PINK),
             ('颞叶·语言', cx - 50, cy + 50, AMBER), ('枕叶·视觉', cx + 50, cy + 50, GREEN)]
    for lab, zx, zy, col in zones:
        body += C(zx, zy, 38, PANEL, col, 1.5)
        body += T(zx, zy + 4, lab, 12, TXT)
    return frame(title, sub, body, color)

def diagram_conditioning(title, sub, color=CYAN):
    """经典条件反射示意"""
    items = [('US 食物 → UR 分泌唾液', CYAN), ('CS 铃声 + US 食物 → 唾液', AMBER), ('CS 铃声 → 条件反应', PINK)]
    return diagram_boxes(title, sub, items, vertical=True, color=color)

def diagram_narrative(title, sub, color=CYAN):
    """情节发展曲线"""
    x0, y0, x1, y1 = 70, 260, 600, 100
    body = axes(x0, y0, x1, y1, '情节推进', '张力', grid=False)
    path = ''
    pts = [(0, 0.25), (0.28, 0.35), (0.5, 0.95), (0.72, 0.75), (1, 0.15)]
    for i, (t, v) in enumerate(pts):
        px = x0 + t * (x1 - x0)
        py = y0 - v * (y0 - y1)
        path += ('M' if i == 0 else 'L') + '%.1f %.1f ' % (px, py)
    body += '<path d="%s" fill="none" stroke="%s" stroke-width="3"/>' % (path, color)
    labels = [('开端', 0.05), ('发展', 0.28), ('高潮', 0.5), ('结局', 0.95)]
    for lab, t in labels:
        body += T(x0 + t * (x1 - x0), y0 + 22, lab, 12, DIM)
    body += T(x0 + 0.5 * (x1 - x0), y0 - 0.95 * (y0 - y1) - 14, '高潮', 13, PINK)
    return frame(title, sub, body, color)

def diagram_intensity(title, sub, color=CYAN):
    """训练强度曲线"""
    labels = ['热身', '主练', '强度峰', '放松']
    values = [40, 80, 100, 30]
    return diagram_chart(title, sub, 'line', labels, values, color)

def diagram_growth(title, sub, color=CYAN):
    """增长柱状图"""
    labels = ['1', '2', '3', '4', '5']
    values = [55, 72, 68, 90, 105]
    return diagram_chart(title, sub, 'bar', labels, values, color)

def diagram_law_flow(title, sub, color=CYAN):
    """案件流程"""
    return diagram_boxes(title, sub, [('立案', CYAN), ('审理', AMBER), ('判决', PINK), ('执行', GREEN)], color=color)

def diagram_argument(title, sub, color=CYAN):
    """论证结构"""
    return diagram_boxes(title, sub, [('前提 1', CYAN), ('前提 2', CYAN), ('推理', AMBER), ('结论', PINK)], color=color)

def diagram_sentence(title, sub, color=CYAN):
    """句子结构 (S+V+O)"""
    return diagram_boxes(title, sub, [('主语 S', CYAN), ('谓语 V', AMBER), ('宾语 O', PINK)], color=color)

def diagram_tense(title, sub, color=CYAN):
    """时态时间轴"""
    return diagram_timeline(title, sub, ['过去', '现在', '将来'], color)

def diagram_sequence(title, sub, color=CYAN):
    """数列散点"""
    import random as _r
    rng = _r.Random(11)
    vals = [2, 4, 6, 8, 10, 12, 14, 16]
    return diagram_chart(title, sub, 'line', [str(i) for i in range(1, 9)], vals, color)

# =============================================================
# 学科分派: subject -> [(builder, 说明词), ...] 按 tag 1..3 使用
# =============================================================

def _kw(ch, words):
    return any(w in ch for w in words)

def _plot_expr(ch):
    if _kw(ch, ['sin', '三角', '波', '振动', '交流', '声', '光', '周期']):
        return 'sin(x)'
    if _kw(ch, ['指数', '对数', 'exp', 'log']):
        return 'exp(x/3)'
    if _kw(ch, ['轨道', '距离', '行星']):
        return '2*cos(x)'
    return 'x*x/4'

def _boxes_steps(ch):
    """按章节关键词给出合适的流程图步骤"""
    if _kw(ch, ['需求', '设计', '测试', '项目', '软件', '开发', '工程']):
        return ['需求分析', '方案设计', '开发实现', '测试验收']
    if _kw(ch, ['排序', '查找', '算法', '递归', '动态规划', '贪心', '复杂度']):
        return ['问题拆解', '选择方法', '逐步执行', '验证结果']
    if _kw(ch, ['网络', '协议', 'HTTP', 'TCP', 'DNS', 'IP', '通信', '路由']):
        return ['应用层', '传输层', '网络层', '链路层']
    if _kw(ch, ['进程', '线程', '调度', '内存', '文件', '操作系统', '死锁', '并发']):
        return ['创建', '就绪/运行', '等待', '终止']
    if _kw(ch, ['数据库', 'SQL', '事务', '索引', '查询']):
        return ['解析语句', '优化计划', '执行查询', '返回结果']
    if _kw(ch, ['安全', '密码', '认证', '授权', '攻击', '防护']):
        return ['身份识别', '认证校验', '授权访问', '审计记录']
    if _kw(ch, ['记忆', '学习', '认知', '注意', '思维', '知觉']):
        return ['编码', '存储', '提取']
    if _kw(ch, ['反应', '催化', '平衡', '化合', '分解', '合成']):
        return ['反应物', '反应条件', '生成物', '能量变化']
    if _kw(ch, ['诉讼', '案件', '审理', '执行', '仲裁', '合同', '侵权']):
        return ['立案', '审理', '判决', '执行']
    if _kw(ch, ['供需', '市场', '决策', '调控', '消费', '生产']):
        return ['观察现状', '分析数据', '制定方案', '评估效果']
    if _kw(ch, ['战争', '革命', '事件', '改革', '运动', '文明']):
        return ['背景', '导火索', '经过', '影响']
    if _kw(ch, ['细胞', '代谢', '分裂', '信号', '周期', '生理']):
        return ['信号接收', '内部响应', '执行过程', '结果反馈']
    if _kw(ch, ['进化', '演替', '循环', '阶段']):
        return ['起始状态', '中间阶段', '稳定阶段']
    return ['起点', '过程一', '过程二', '终点']

def _tree_root(ch):
    if _kw(ch, ['图', '树', '网络', '哈希']):
        return '根/源节点'
    if _kw(ch, ['演化', '进化', '分类']):
        return '共同祖先'
    if _kw(ch, ['人物', '关系', '角色']):
        return '核心人物'
    if _kw(ch, ['体系', '知识', '框架']):
        return '知识体系'
    return '主节点'

def make_svg(subject, chapter, aspect, tag, formulas=None):
    """返回 (svg字符串, 图解说明词)"""
    ch = chapter
    formulas = formulas or []
    if subject == 2:  # 数学
        if _kw(ch, ['矩阵', '行列式', '线性', '特征', '向量', '二次型', '内积', '正交']):
            pool = [(diagram_grid, '矩阵网格示意'), (diagram_forces, '向量与运算示意'), (diagram_formula_card, '核心公式卡片')]
        elif _kw(ch, ['微积分', '极限', '导数', '积分', '函数']):
            pool = [(diagram_plot, '函数图像'), (diagram_normal, '变化率/累积量示意'), (diagram_formula_card, '核心公式卡片')]
        elif _kw(ch, ['三角']):
            pool = [(diagram_wave, '三角函数波形'), (diagram_plot, '函数图像'), (diagram_formula_card, '核心公式卡片')]
        elif _kw(ch, ['数列', '级数']):
            pool = [(diagram_sequence, '数列变化示意'), (diagram_chart, '数值对比图'), (diagram_formula_card, '核心公式卡片')]
        elif _kw(ch, ['概率', '统计', '分布']):
            pool = [(diagram_normal, '正态分布曲线'), (diagram_chart, '数据分布图'), (diagram_formula_card, '核心公式卡片')]
        elif _kw(ch, ['集合', '逻辑', '关系']):
            pool = [(diagram_venn, '集合关系示意'), (diagram_boxes, '逻辑推理流程'), (diagram_formula_card, '核心公式卡片')]
        elif _kw(ch, ['图', '树']):
            pool = [(diagram_tree, '图/树结构示意'), (diagram_boxes, '算法流程'), (diagram_formula_card, '核心公式卡片')]
        elif _kw(ch, ['几何']):
            pool = [(diagram_plot, '几何图形坐标示意'), (diagram_boxes, '几何证明步骤'), (diagram_formula_card, '核心公式卡片')]
        else:
            pool = [(diagram_plot, '函数图像'), (diagram_normal, '概率分布示意'), (diagram_formula_card, '核心公式卡片')]
    elif subject == 1:  # 计算机
        if _kw(ch, ['算法', '排序', '查找', '数组', '链表', '栈', '队列', '哈希', '树', '图']):
            pool = [(diagram_tree, '数据结构示意'), (diagram_screenshot, '操作步骤截图'), (diagram_boxes, '算法执行流程')]
        elif _kw(ch, ['网络', 'HTTP', 'DNS', 'TCP', 'IP']):
            pool = [(diagram_boxes, '协议分层结构'), (diagram_globe, '网络互联示意'), (diagram_screenshot, '配置步骤截图')]
        elif _kw(ch, ['操作系统', '进程', '内存', '文件', '调度']):
            pool = [(diagram_boxes, '系统资源管理流程'), (diagram_pyramid, '系统层次结构'), (diagram_screenshot, '操作步骤截图')]
        elif _kw(ch, ['数据库', 'SQL', '事务', '索引']):
            pool = [(diagram_grid, '数据表结构'), (diagram_boxes, '查询执行流程'), (diagram_screenshot, '建表步骤截图')]
        elif _kw(ch, ['安全', '密码', '攻击', '认证']):
            pool = [(diagram_boxes, '安全防护流程'), (diagram_screenshot, '安全配置步骤'), (diagram_chart, '安全威胁统计图')]
        elif _kw(ch, ['软件', '需求', '设计', '测试', '项目']):
            pool = [(diagram_boxes, '软件工程流程'), (diagram_screenshot, '开发流程步骤'), (diagram_chart, '项目进度图')]
        else:
            pool = [(diagram_boxes, '程序执行流程'), (diagram_tree, '程序结构示意'), (diagram_screenshot, '操作步骤截图')]
    elif subject == 3:  # 物理
        if _kw(ch, ['力', '牛顿', '运动', '动量', '能量', '功', '平衡', '转动', '流体', '振动']):
            pool = [(diagram_forces, '受力分析图'), (diagram_wave, '运动/波动示意'), (diagram_chart, '物理量关系图')]
        elif _kw(ch, ['电', '磁', '感应', '电路', '电容', '交流']):
            pool = [(diagram_circuit, '电路示意图'), (diagram_wave, '交流电波形'), (diagram_boxes, '电磁过程流程')]
        elif _kw(ch, ['波', '声', '光', '干涉', '衍射', '偏振', '激光']):
            pool = [(diagram_wave, '波动示意图'), (diagram_plot, '波动函数图像'), (diagram_boxes, '光学过程流程')]
        elif _kw(ch, ['热', '温', '熵', '相变', '气体']):
            pool = [(diagram_boxes, '热力学过程流程'), (diagram_chart, '热学量变化图'), (diagram_screenshot, '实验步骤截图')]
        elif _kw(ch, ['量子', '原子', '核', '粒子', '相对论']):
            pool = [(diagram_molecule, '微观粒子结构示意'), (diagram_plot, '物理量关系图像'), (diagram_screenshot, '实验步骤截图')]
        else:
            pool = [(diagram_wave, '波动示意图'), (diagram_forces, '受力分析图'), (diagram_chart, '物理量关系图')]
    elif subject == 4:  # 历史
        pool = [(diagram_timeline, '历史时间轴'), (diagram_boxes, '历史事件因果链'), (diagram_screenshot, '史实梳理步骤')]
    elif subject == 5:  # 心理学
        if _kw(ch, ['记忆', '学习', '注意', '知觉', '意识', '思维']):
            pool = [(diagram_brain, '大脑功能分区示意'), (diagram_conditioning, '条件反射示意'), (diagram_screenshot, '学习步骤截图')]
        else:
            pool = [(diagram_brain, '大脑功能分区示意'), (diagram_boxes, '心理过程模型'), (diagram_normal, '个体差异分布')]
    elif subject == 6:  # 化学
        if _kw(ch, ['周期', '元素']):
            pool = [(diagram_grid, '元素周期表示意'), (diagram_molecule, '分子结构示意'), (diagram_ph, 'pH 标尺')]
        elif _kw(ch, ['键', '分子', '结构']):
            pool = [(diagram_molecule, '分子结构示意'), (diagram_grid, '物质性质对比表'), (diagram_boxes, '反应过程流程')]
        elif _kw(ch, ['酸碱', '溶液', '浓度', 'pH']):
            pool = [(diagram_ph, 'pH 标尺'), (diagram_chart, '浓度变化图'), (diagram_molecule, '分子结构示意')]
        else:
            pool = [(diagram_molecule, '分子结构示意'), (diagram_boxes, '化学反应流程'), (diagram_screenshot, '实验步骤截图')]
    elif subject == 7:  # 生物
        if _kw(ch, ['细胞', '膜', '器']):
            pool = [(diagram_cell, '细胞结构示意'), (diagram_boxes, '细胞过程流程'), (diagram_grid, '结构功能对比表')]
        elif _kw(ch, ['基因', 'DNA', '遗传', '表达', '分子']):
            pool = [(diagram_dna, 'DNA 双螺旋示意'), (diagram_boxes, '中心法则流程'), (diagram_tree, '遗传关系树')]
        elif _kw(ch, ['进化', '多样性', '生态']):
            pool = [(diagram_tree, '演化关系树'), (diagram_pyramid, '生态能量金字塔'), (diagram_globe, '生态分布示意')]
        else:
            pool = [(diagram_cell, '细胞结构示意'), (diagram_dna, 'DNA 双螺旋示意'), (diagram_screenshot, '实验操作步骤')]
    elif subject in (8, 15):  # 日语/英语
        pool = [(diagram_grid, '五十音/字母表示意'), (diagram_sentence, '句子结构示意'), (diagram_screenshot, '学习步骤截图')]
    elif subject == 9:  # 经济学
        pool = [(diagram_supply_demand, '供求曲线'), (diagram_growth, '经济指标变化图'), (diagram_screenshot, '分析决策步骤')]
    elif subject == 10:  # 哲学
        pool = [(diagram_argument, '论证结构图'), (diagram_venn, '概念关系示意'), (diagram_screenshot, '思辨步骤截图')]
    elif subject == 11:  # 天文
        if _kw(ch, ['太阳', '行星', '系外']):
            pool = [(diagram_solar, '太阳系示意图'), (diagram_plot, '轨道/距离关系图'), (diagram_grid, '天体数据对比表')]
        elif _kw(ch, ['恒星', '黑洞', '天体', '致密']):
            pool = [(diagram_hr, '赫罗图'), (diagram_solar, '天体系统示意'), (diagram_boxes, '恒星演化流程')]
        else:
            pool = [(diagram_solar, '太阳系示意图'), (diagram_hr, '赫罗图'), (diagram_boxes, '天文过程流程')]
    elif subject == 12:  # 文学
        pool = [(diagram_narrative, '情节发展曲线'), (diagram_tree, '人物关系图'), (diagram_screenshot, '阅读分析步骤')]
    elif subject == 13:  # 音乐
        if _kw(ch, ['音', '乐理', '音程', '音阶', '调']):
            pool = [(diagram_piano, '钢琴键盘与音阶'), (diagram_staff, '五线谱示例'), (diagram_note_values, '音符时值对比')]
        else:
            pool = [(diagram_staff, '五线谱示例'), (diagram_piano, '钢琴键盘示意'), (diagram_note_values, '音符时值对比')]
    elif subject == 14:  # 地理
        if _kw(ch, ['地球', '圈层', '大气', '气候', '天气']):
            pool = [(diagram_earth_layers, '地球圈层结构'), (diagram_chart, '气候要素变化图'), (diagram_globe, '地理分布示意')]
        elif _kw(ch, ['地图', '区域', '地形']):
            pool = [(diagram_globe, '地理分布示意'), (diagram_earth_layers, '地球圈层结构'), (diagram_grid, '区域特征对比表')]
        else:
            pool = [(diagram_earth_layers, '地球圈层结构'), (diagram_chart, '自然要素变化图'), (diagram_globe, '地理分布示意')]
    elif subject == 16:  # 艺术
        if _kw(ch, ['色彩', '颜色', '配色']):
            pool = [(diagram_colorwheel, '色轮'), (diagram_value_scale, '明度阶梯'), (diagram_rule_thirds, '构图三分法')]
        elif _kw(ch, ['构图', '透视', '素描']):
            pool = [(diagram_rule_thirds, '构图三分法'), (diagram_value_scale, '明度阶梯'), (diagram_colorwheel, '色轮')]
        else:
            pool = [(diagram_colorwheel, '色轮'), (diagram_rule_thirds, '构图三分法'), (diagram_value_scale, '明度阶梯')]
    elif subject == 17:  # 体育
        pool = [(diagram_intensity, '训练强度曲线'), (diagram_pyramid, '运动营养结构'), (diagram_screenshot, '训练计划步骤')]
    elif subject == 18:  # 法律
        pool = [(diagram_pyramid, '法律体系层级'), (diagram_law_flow, '案件处理流程'), (diagram_screenshot, '办案步骤截图')]
    elif subject == 19:  # 国际关系
        pool = [(diagram_globe, '全球格局示意'), (diagram_boxes, '国际机制流程'), (diagram_screenshot, '外交步骤截图')]
    elif subject == 20:  # 数据科学
        if _kw(ch, ['可视化', '图表', '视觉']):
            pool = [(diagram_chart, '数据图表示例'), (diagram_grid, '数据表结构'), (diagram_screenshot, '出图步骤截图')]
        else:
            pool = [(diagram_chart, '数据分布图'), (diagram_normal, '统计分布曲线'), (diagram_screenshot, '分析步骤截图')]
    else:
        pool = [(diagram_boxes, '知识结构图'), (diagram_chart, '数据对比图'), (diagram_tree, '知识体系树')]

    builder, desc = pool[(tag - 1) % len(pool)]
    title = '本章主题：%s' % chapter
    sub = '本节角度：%s' % aspect
    colors = [CYAN, PINK, PURPLE, AMBER, GREEN]
    color = colors[(tag - 1) % len(colors)]
    try:
        if builder is diagram_formula_card:
            svg = builder(title, sub, formulas, color=color)
        elif builder is diagram_plot:
            svg = builder(title, sub, _plot_expr(ch), color=color)
        elif builder is diagram_grid:
            cells = None
            if '矩阵' in ch or '行列式' in ch:
                cells = ['2', '3', '1', '4', '-1', '0', '5', '2', '0', '2', '3', '-2', '1', '1', '0', '4']
            elif '表' in ch or subject in (8, 15):
                cells = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'] if subject == 15 else ['あ', 'い', 'う', 'え', 'お', 'か', 'き', 'く', 'け', 'こ']
            svg = diagram_grid(title, sub, 4, 4, cells, color=color)
        elif builder in (diagram_boxes, diagram_screenshot):
            svg = builder(title, sub, _boxes_steps(ch), color=color)
        elif builder is diagram_tree:
            svg = builder(title, sub, _tree_root(ch), ['子节点 1', '子节点 2', '子节点 3'], color=color)
        else:
            svg = builder(title, sub, color=color)
    except Exception:
        svg = diagram_boxes('知识图解', '本节：%s' % aspect, ['概念 1', '概念 2', '概念 3'], color=color)
        desc = '知识结构图'
    return svg, desc

def data_uri(svg):
    return 'data:image/svg+xml;base64,' + base64.b64encode(svg.encode('utf-8')).decode('ascii')
