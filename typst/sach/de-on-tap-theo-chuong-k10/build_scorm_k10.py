#!/usr/bin/env python3
"""
build_scorm_k10.py — Chuyển đổi toàn bộ đề Toán Khối 10 sang chuẩn SCORM 1.2 cho K12Online.
Tối ưu hóa đặc thù Khối 10:
- Tự động nhận diện màu chủ đạo `accent` của từng đề thi để render SVG CeTZ & Table chuẩn 100%.
- Cơ chế SVG Cache theo MD5 hash để tăng tốc độ build tối đa.
- Xử lý KaTeX math toàn diện: ký hiệu vectơ, góc, phân số, tập hợp, số thập phân Typst "0","05".
- Tạo gói SCORM chuẩn 1.2 với imsmanifest.xml và index.html tương tác, gửi điểm về LMS K12Online.
"""

import os
import sys
import re
import json
import glob
import time
import uuid
import hashlib
import zipfile
import argparse
import subprocess
from pathlib import Path
from concurrent.futures import ProcessPoolExecutor, as_completed

# Thêm đường dẫn tới parse_typ của DECUONG12-HK1
SCORM_TOOL_DIR = Path(__file__).resolve().parent.parent / "DECUONG12-HK1" / "scorm"
if str(SCORM_TOOL_DIR) not in sys.path:
    sys.path.insert(0, str(SCORM_TOOL_DIR))
from parse_typ import parse_file, Question  # type: ignore

# Cấu hình đường dẫn Khối 10
K10_ROOT = Path('/Users/admin/conictypst/typst/sach/de-on-tap-theo-chuong-k10')
OUTPUT_DIR = K10_ROOT / "scorm_output"
TMP_SVG_DIR = K10_ROOT / ".tmp_svg"
SVG_CACHE_DIR = K10_ROOT / ".svg_cache"

OUTPUT_DIR.mkdir(exist_ok=True)
TMP_SVG_DIR.mkdir(exist_ok=True)
SVG_CACHE_DIR.mkdir(exist_ok=True)

# Thông tin môn học & Trường
TRUONG = "TRƯỜNG THPT NGUYỄN HỮU CẢNH"
TO_BOMON = "TỔ TOÁN"
NAM_HOC = "2026–2027"
MON = "TOÁN 10"

# ─── SCORM 1.2 MANIFEST TEMPLATE ─────────────────────────────────────────────
MANIFEST_TPL = """<?xml version="1.0" encoding="UTF-8"?>
<manifest identifier="{identifier}" version="1.2"
  xmlns="http://www.imsproject.org/xsd/imscp_rootv1p1p2"
  xmlns:adlcp="http://www.adlnet.org/xsd/adlcp_rootv1p2"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.imsproject.org/xsd/imscp_rootv1p1p2 imscp_rootv1p1p2.xsd
    http://www.adlnet.org/xsd/adlcp_rootv1p2 adlcp_rootv1p2.xsd">
  <metadata><schema>ADL SCORM</schema><schemaversion>1.2</schemaversion></metadata>
  <organizations default="org1">
    <organization identifier="org1">
      <title>{title}</title>
      <item identifier="item1" identifierref="res1"><title>{title}</title></item>
    </organization>
  </organizations>
  <resources>
    <resource identifier="res1" type="webcontent" adlcp:scormtype="sco" href="index.html">
      <file href="index.html"/>
    </resource>
  </resources>
</manifest>"""


# ─── BỘ RENDER SVG VỚI ACCENT & CACHE ─────────────────────────────────────────
def _get_svg_cache(code_hash: str) -> str:
    cache_file = SVG_CACHE_DIR / f"{code_hash}.svg"
    if cache_file.exists():
        try:
            return cache_file.read_text(encoding="utf-8")
        except Exception:
            return ""
    return ""

def _save_svg_cache(code_hash: str, svg_content: str):
    cache_file = SVG_CACHE_DIR / f"{code_hash}.svg"
    try:
        cache_file.write_text(svg_content, encoding="utf-8")
    except Exception:
        pass

def render_typst_to_svg(code_body: str, accent: str, is_canvas: bool = True) -> str:
    """Biên dịch đoạn mã CeTZ/Table Typst sang chuỗi SVG inline có cache."""
    code_hash = hashlib.md5((code_body + "_" + accent).encode('utf-8')).hexdigest()
    cached = _get_svg_cache(code_hash)
    if cached:
        return cached

    tmp_id = f"svg_{uuid.uuid4().hex[:8]}"
    tmp_typ = TMP_SVG_DIR / f"{tmp_id}.typ"
    tmp_svg = TMP_SVG_DIR / f"{tmp_id}.svg"

    if is_canvas:
        typst_code = f"""
#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"
#import "/bbt.typ": *
#set page(width: auto, height: auto, margin: 5pt, fill: none)
#let accent = {accent}

#cetz.canvas({code_body})
"""
    else:
        typst_code = f"""
#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"
#import "/bbt.typ": *
#set page(width: auto, height: auto, margin: 2pt, fill: none)
#let accent = {accent}

{code_body}
"""

    try:
        tmp_typ.write_text(typst_code, encoding="utf-8")
        res = subprocess.run(
            ['typst', 'compile', '--root', '/Users/admin/conictypst/typst', str(tmp_typ), str(tmp_svg)],
            check=True, capture_output=True, text=True
        )
        if tmp_svg.exists():
            svg = tmp_svg.read_text(encoding="utf-8")
            if svg.startswith('<?xml'):
                svg = svg.split('?>', 1)[-1]
            _save_svg_cache(code_hash, svg)
            return svg
    except Exception as e:
        pass
    finally:
        if tmp_typ.exists():
            try: tmp_typ.unlink()
            except: pass
        if tmp_svg.exists():
            try: tmp_svg.unlink()
            except: pass

    return ""


# ─── BỘ CHUYỂN ĐỔI TYPST → KaTeX (TOÀN DIỆN CHO KHỐI 10) ────────────────────
def typst_to_katex(text: str, accent: str = 'rgb("1e40af")') -> str:
    """Chuyển đổi văn bản Typst sang HTML + KaTeX."""
    html_blocks = {}

    def _balance(t: str, start: int, open_c: str, close_c: str) -> int:
        stack = []
        i = start
        while i < len(t):
            if t[i] == '$':
                i += 1
                while i < len(t) and t[i] != '$':
                    if t[i] == '\\': i += 2
                    else: i += 1
            elif t[i] == '"':
                i += 1
                while i < len(t) and t[i] != '"':
                    if t[i] == '\\': i += 2
                    else: i += 1
            elif t[i] in '([{':
                stack.append(t[i])
            elif t[i] in ')]}':
                if stack:
                    top = stack[-1]
                    if (top == '(' and t[i] == ')') or \
                       (top == '[' and t[i] == ']') or \
                       (top == '{' and t[i] == '}'):
                        stack.pop()
                        if not stack: return i
            i += 1
        return -1

    def strip_wrapper(t, prefix):
        while True:
            idx = t.find(prefix + '[')
            if idx == -1: break
            end = _balance(t, idx + len(prefix), '[', ']')
            if end != -1:
                t = t[:idx] + t[idx+len(prefix)+1:end] + t[end+1:]
            else:
                t = t.replace(prefix + '[', '')
        return t

    def strip_paren_block(t, prefix):
        while True:
            idx = t.find('#' + prefix + '(')
            if idx == -1: break
            paren_start = idx + len('#' + prefix)
            paren_end = _balance(t, paren_start, '(', ')')
            if paren_end == -1:
                t = t[:idx] + t[idx+len('#'+prefix)+1:]
                continue
            after = t[paren_end+1:].lstrip()
            offset = len(t[paren_end+1:]) - len(after)
            if after.startswith('['):
                brk_start = paren_end + 1 + offset
                brk_end = _balance(t, brk_start, '[', ']')
                if brk_end != -1:
                    t = t[:idx] + t[brk_start+1:brk_end] + t[brk_end+1:]
                    continue
            t = t[:idx] + t[paren_end+1:]
        return t

    # 1. Bóc các macro Typst ngoài math
    text = strip_wrapper(text, '#step')
    text = strip_wrapper(text, '#True')
    text = strip_wrapper(text, '#False')
    text = text.replace('#resetstep()', '')
    text = text.replace('#resetcau()', '')
    text = text.replace('#reset-step()', '')
    text = re.sub(r'#v\s*\([^)]*\)', '', text)
    text = re.sub(r'#h\s*\([^)]*\)', ' ', text)
    text = re.sub(r'#pagebreak\([^)]*\)', '', text)
    text = re.sub(r'#linebreak\(\)', '', text)
    text = re.sub(r'//[^\n]*', '', text)

    for _mac in ['align', 'text', 'par', 'pad', 'box', 'block', 'grid', 'stack', 'place', 'emph', 'strong', 'figure']:
        text = strip_paren_block(text, _mac)
        text = strip_wrapper(text, '#' + _mac)

    # 2. Xử lý đồ thị CeTZ & Bảng Table → SVG
    for macro in ['cetz.canvas', 'canvas', 'table', 'my-bxd', 'my-bbbt', 'bbt-opt', 'bbtv2', 'bbt']:
        while True:
            kw = '#' + macro + '('
            idx = text.find(kw)
            if idx == -1: break
            end = _balance(text, idx + len(kw) - 1, '(', ')')
            if end == -1: break

            inner = text[idx + len(kw) : end]
            is_canvas = macro in ['cetz.canvas', 'canvas']
            if is_canvas:
                svg = render_typst_to_svg(inner, accent, is_canvas=True)
                if svg:
                    html_repl = f'<div style="text-align:center; margin: 12px 0;">{svg}</div>'
                else:
                    html_repl = '<div style="color:gray; font-style:italic;">[Hình vẽ minh họa CeTZ]</div>'
            else:
                full_table_code = f"#{macro}({inner})"
                svg = render_typst_to_svg(full_table_code, accent, is_canvas=False)
                if svg:
                    html_repl = f'<div style="text-align:center; overflow-x:auto; margin: 12px 0;">{svg}</div>'
                else:
                    html_repl = '<div style="color:gray; font-style:italic;">[Bảng dữ liệu]</div>'

            html_key = f'%%HTML_{len(html_blocks)}%%'
            html_blocks[html_key] = html_repl
            text = text[:idx] + html_key + text[end+1:]

    # 3. Bold/Italic ngoài math
    parts = re.split(r'(\$[^$]+\$)', text)
    res_parts = []
    for p in parts:
        if p.startswith('$') and p.endswith('$'):
            res_parts.append(p)
        else:
            p = re.sub(r'\*\*?([^*\n]+?)\*\*?', r'<strong>\1</strong>', p)
            p = re.sub(r'(?<!\w)_([^_\n]+)_(?!\w)', r'<em>\1</em>', p)
            res_parts.append(p)
    text = ''.join(res_parts)

    # 4. Chuyển đổi công thức toán trong $...$
    def convert_math(m):
        inner = m.group(1)

        # Set difference \\ -> \setminus
        inner = inner.replace(r'\\', r'\setminus')

        # Dấu ngoặc nhọn trong tập hợp Typst {a, b} -> \{a, b\} trong KaTeX
        inner = re.sub(r'(?<!\\)\{', r'\\{', inner)
        inner = re.sub(r'(?<!\\)\}', r'\\}', inner)

        # Chuẩn số thập phân Typst "0","05" -> 0{,}05 (KaTeX chuẩn Việt Nam)
        inner = re.sub(r'(\d+)\s*"\s*,\s*"\s*(\d+)', r'\1{,}\2', inner)

        # "text" -> \text{text}
        inner = re.sub(r'"([^"]*)"', lambda x: r'\text{' + x.group(1) + '}', inner)

        def balance_paren_args(s, func_name):
            idx = s.find(func_name + '(')
            if idx == -1: return None, -1, -1
            start = idx + len(func_name)
            depth = 0
            end = -1
            for i in range(start, len(s)):
                if s[i] == '(': depth += 1
                elif s[i] == ')':
                    depth -= 1
                    if depth == 0:
                        end = i
                        break
            if end == -1: return None, -1, -1
            args_str = s[start+1:end]
            args, cur, d = [], [], 0
            for c in args_str:
                if c == '(': d += 1
                elif c == ')': d -= 1
                elif c == ',' and d == 0:
                    args.append(''.join(cur).strip())
                    cur = []
                    continue
                cur.append(c)
            if cur: args.append(''.join(cur).strip())
            return args, idx, end

        # Hàm toán học Typst
        while True:
            changed = False

            # Vectơ: vec(AB) / arrow(AB) -> \overrightarrow{AB}
            for fn in ['vec', 'arrow', 'vect', 'overrightarrow']:
                args, start, end = balance_paren_args(inner, fn)
                if args is not None and len(args) >= 1:
                    inner = inner[:start] + r'\overrightarrow{' + args[0] + '}' + inner[end+1:]
                    changed = True; break
            if changed: continue

            # Góc: hat(ABC) -> \widehat{ABC} (>=2 ký tự) hoặc \hat{A} (1 ký tự)
            args, start, end = balance_paren_args(inner, 'hat')
            if args is not None and len(args) >= 1:
                content = args[0]
                cmd = r'\widehat' if len(content.replace(' ','')) >= 2 else r'\hat'
                inner = inner[:start] + cmd + '{' + content + '}' + inner[end+1:]
                changed = True; continue

            # Căn bậc hai & căn bậc n
            args, start, end = balance_paren_args(inner, 'root')
            if args is not None and len(args) == 2:
                inner = inner[:start] + r'\sqrt[' + args[0] + ']{' + args[1] + '}' + inner[end+1:]
                changed = True; continue
            args, start, end = balance_paren_args(inner, 'sqrt')
            if args is not None and len(args) == 1:
                inner = inner[:start] + r'\sqrt{' + args[0] + '}' + inner[end+1:]
                changed = True; continue

            # Phân số: frac(a, b) / dfrac(a, b)
            for fn in ['frac', 'dfrac', 'tfrac']:
                args, start, end = balance_paren_args(inner, fn)
                if args is not None and len(args) == 2:
                    repl = r'\dfrac{' + args[0] + '}{' + args[1] + '}'
                    if inner[end+1:end+2] == '^': repl = '{' + repl + '}'
                    inner = inner[:start] + repl + inner[end+1:]
                    changed = True; break
            if changed: continue

            # Trị tuyệt đối abs(x) & chuẩn norm(x)
            args, start, end = balance_paren_args(inner, 'abs')
            if args is not None and len(args) == 1:
                inner = inner[:start] + r'\left|' + args[0] + r'\right|' + inner[end+1:]
                changed = True; continue
            args, start, end = balance_paren_args(inner, 'norm')
            if args is not None and len(args) == 1:
                inner = inner[:start] + r'\left\|' + args[0] + r'\right\|' + inner[end+1:]
                changed = True; continue

            # Tổ hợp, chỉnh hợp
            args, start, end = balance_paren_args(inner, 'C')
            if args is not None and len(args) == 2:
                inner = inner[:start] + 'C_{' + args[0] + '}^{' + args[1] + '}' + inner[end+1:]
                changed = True; continue
            args, start, end = balance_paren_args(inner, 'A')
            if args is not None and len(args) == 2:
                inner = inner[:start] + 'A_{' + args[0] + '}^{' + args[1] + '}' + inner[end+1:]
                changed = True; continue

            # Hệ phương trình cases/heva
            for fn in ['cases', 'heva']:
                args, start, end = balance_paren_args(inner, fn)
                if args is not None:
                    inner = inner[:start] + r'\begin{cases} ' + r' \\ '.join(args) + r' \end{cases}' + inner[end+1:]
                    changed = True; break
            if changed: continue

            # Ngoặc vuông hoặc hoac(a, b)
            args, start, end = balance_paren_args(inner, 'hoac')
            if args is not None:
                inner = inner[:start] + r'\left[\begin{array}{l} ' + r' \\ '.join(args) + r' \end{array}\right.' + inner[end+1:]
                changed = True; continue

            # Ma trận mat(a,b; c,d)
            args, start, end = balance_paren_args(inner, 'mat')
            if args is not None:
                rows_raw = ' '.join(args).split(';')
                latex_rows = []
                for row in rows_raw:
                    cols = [c.strip() for c in row.split(',') if c.strip()]
                    latex_rows.append(' & '.join(cols))
                inner = inner[:start] + r'\begin{pmatrix}' + r' \\ '.join(latex_rows) + r'\end{pmatrix}' + inner[end+1:]
                changed = True; continue

            break

        # _(...) -> _{...} and ^(...) -> ^{...}
        for prefix in ['_', '^']:
            while True:
                idx = inner.find(prefix + '(')
                if idx == -1: break
                depth = 0
                end = -1
                for i in range(idx + 1, len(inner)):
                    if inner[i] == '(': depth += 1
                    elif inner[i] == ')':
                        depth -= 1
                        if depth == 0: end = i; break
                if end == -1: break
                inner = inner[:idx] + prefix + '{' + inner[idx+2:end] + '}' + inner[end+1:]

        # Ký hiệu suy luận và so sánh cơ bản
        literals = [
            ('<=>', r'\Leftrightarrow'), ('==>', r'\Rightarrow'), ('=>', r'\Rightarrow'),
            ('<==', r'\Leftarrow'), ('->', r'\to'), ('<-', r'\leftarrow'),
            ('<=', r'\le'), ('>=', r'\ge'), ('!=', r'\ne'),
            ('+oo', r'+\infty'), ('-oo', r'-\infty'),
        ]
        for lit, repl in literals:
            inner = inner.replace(lit, repl)

        # Word-boundary replacements
        word_syms = [
            (r'\bapprox\b', r'\approx'), (r'\bdot\b', r'\cdot'), (r'\btimes\b', r'\times'),
            (r'\bin\b', r'\in'), (r'\bnotin\b', r'\notin'),
            (r'\bsubset\b', r'\subset'), (r'\bsupset\b', r'\supset'),
            (r'\bunion\b', r'\cup'), (r'\bcup\b', r'\cup'),
            (r'\bsect\b', r'\cap'), (r'\bcap\b', r'\cap'),
            (r'\bempty\b', r'\emptyset'), (r'\bemptyset\b', r'\emptyset'),
            (r'\bperp\b', r'\perp'), (r'\bparallel\b', r'\parallel'),
            (r'\bangle\b', r'\angle'), (r'\btriangle\b', r'\triangle'),
            (r'\bdegree\b', r'^\circ'), (r'\boo\b', r'\infty'), (r'\binfty\b', r'\infty'),
            (r'\bforall\b', r'\forall'), (r'\bexists\b', r'\exists'),
            (r'\bRR\b', r'\mathbb{R}'), (r'\bZZ\b', r'\mathbb{Z}'),
            (r'\bNN\b', r'\mathbb{N}'), (r'\bQQ\b', r'\mathbb{Q}'), (r'\bCC\b', r'\mathbb{C}'),
            (r'\bsum\b', r'\sum'), (r'\bint\b', r'\int'),
        ]
        for pat, repl in word_syms:
            inner = re.sub(pat, lambda m, r=repl: r, inner)

        # Thêm backslash cho các hàm toán và chữ Hy Lạp
        funcs = ['sin', 'cos', 'tan', 'cot', 'arcsin', 'arccos', 'arctan', 'log', 'ln', 'lim', 'exp', 'max', 'min']
        greeks = ['alpha', 'beta', 'gamma', 'Delta', 'delta', 'epsilon', 'theta', 'lambda', 'mu', 'pi', 'sigma', 'omega']
        for kw in funcs + greeks:
            inner = re.sub(r'(?<![a-zA-Z\\])' + kw + r'(?![a-zA-Z])', lambda m, kw=kw: '\\' + kw, inner)

        # Phân số dạng a / b đơn giản
        inner = re.sub(r'([a-zA-Z0-9_]+)\s*/\s*([a-zA-Z0-9_]+)', lambda m: r'\dfrac{' + m.group(1) + '}{' + m.group(2) + '}', inner)

        return f'${inner}$'

    text = re.sub(r'\$([^$]+)\$', convert_math, text)

    # Phục hồi các khối HTML/SVG
    for k, v in html_blocks.items():
        text = text.replace(k, v)

    return text


# ─── BUILD QUIZ HTML ─────────────────────────────────────────────────────────
def build_quiz_html(title: str, questions: list, accent: str = 'rgb("1e40af")') -> str:
    """Sinh mã HTML interactive Quiz kèm SCORM 1.2 API."""
    q_data = []
    for q in questions:
        entry = {
            "type": q.q_type,
            "number": q.number,
            "stem": typst_to_katex(q.stem, accent),
            "solution": typst_to_katex(q.solution, accent) if q.solution else "",
        }
        if q.q_type == "tn":
            entry["options"] = [typst_to_katex(o, accent) for o in q.options]
            entry["correct"] = q.correct
        elif q.q_type == "ds":
            entry["options"] = [typst_to_katex(o, accent) for o in q.options]
            entry["correct"] = q.correct
        elif q.q_type == "tln":
            entry["answer"] = q.answer_short.replace('$', '').strip()
        q_data.append(entry)

    q_json = json.dumps(q_data, ensure_ascii=False)

    return f"""<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{title}</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.css">
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.js"></script>
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/contrib/auto-render.min.js"
  onload="renderMathInElement(document.body,{{delimiters:[
    {{left:'$$',right:'$$',display:true}},
    {{left:'$',right:'$',display:false}}
  ]}})"></script>
<style>
:root {{
  --bg: #f8fafc; --card: #ffffff; --border: #e2e8f0;
  --primary: #1e40af; --primary-dim: #eff6ff;
  --green: #16a34a; --green-dim: #f0fdf4;
  --red: #dc2626; --red-dim: #fef2f2;
  --text: #0f172a; --muted: #475569;
  --radius: 10px;
}}
* {{ margin:0; padding:0; box-sizing:border-box; }}
body {{
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
  background: var(--bg); color: var(--text);
  min-height: 100vh; display: flex; flex-direction: column;
}}
.header {{
  background: linear-gradient(135deg, #1e3a8a 0%, #1e40af 100%);
  padding: 12px 24px; display: flex; align-items: center; justify-content: space-between;
  box-shadow: 0 2px 10px rgba(0,0,0,0.15); flex-shrink: 0; color: #fff;
}}
.header-info .school {{ font-size: 11px; color: #bfdbfe; font-weight: 600; text-transform: uppercase; }}
.header-info .title  {{ font-size: 16px; font-weight: 700; margin: 3px 0; }}
.header-info .sub    {{ font-size: 12px; color: #93c5fd; }}
.progress-wrap {{ display: flex; align-items: center; gap: 12px; }}
.score-badge {{
  background: rgba(255,255,255,0.15); border: 1px solid rgba(255,255,255,0.3);
  padding: 5px 14px; border-radius: 20px; font-size: 13px; font-weight: 700;
}}
.main {{ flex: 1; padding: 20px; max-width: 900px; margin: 0 auto; width: 100%; }}
.section-title {{
  font-size: 12px; font-weight: 800; color: var(--primary);
  letter-spacing: 1px; text-transform: uppercase; margin: 24px 0 12px;
  padding-bottom: 6px; border-bottom: 2px solid var(--border);
}}
.card {{
  background: var(--card); border: 1px solid var(--border);
  border-radius: var(--radius); padding: 18px; margin-bottom: 16px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.05); transition: border-color 0.2s;
}}
.q-header {{ display: flex; gap: 10px; align-items: flex-start; margin-bottom: 14px; }}
.q-num {{
  background: var(--primary); color: #fff; border-radius: 6px;
  padding: 3px 9px; font-size: 12px; font-weight: 700; flex-shrink: 0; margin-top: 2px;
}}
.q-num.ds-num {{ background: #7c3aed; }}
.q-num.tln-num {{ background: #0891b2; }}
.q-stem {{ font-size: 15px; line-height: 1.65; flex: 1; }}
.options {{ display: flex; flex-direction: column; gap: 8px; margin-top: 12px; }}
.opt {{
  display: flex; align-items: center; gap: 12px; padding: 10px 14px;
  border-radius: 8px; border: 1px solid var(--border); cursor: pointer;
  background: #fafafa; font-size: 14px; line-height: 1.5; transition: all 0.15s;
}}
.opt:hover:not(.disabled) {{ border-color: var(--primary); background: var(--primary-dim); }}
.opt .label {{
  min-width: 26px; height: 26px; border: 2px solid var(--muted); border-radius: 50%;
  display: flex; align-items: center; justify-content: center;
  font-size: 12px; font-weight: 700; flex-shrink: 0;
}}
.opt.selected .label {{ border-color: var(--primary); background: var(--primary); color: #fff; }}
.opt.show-correct {{ border-color: var(--green); background: var(--green-dim); font-weight: 600; }}
.opt.show-correct .label {{ border-color: var(--green); background: var(--green); color: #fff; }}
.opt.show-wrong {{ border-color: var(--red); background: var(--red-dim); }}
.opt.show-wrong .label {{ border-color: var(--red); background: var(--red); color: #fff; }}

/* Đúng / Sai */
.ds-item {{
  display: flex; align-items: flex-start; gap: 12px; padding: 10px 14px;
  border-radius: 8px; border: 1px solid var(--border); background: #fafafa;
  margin-bottom: 8px; font-size: 14px; line-height: 1.5;
}}
.ds-actions {{ display: flex; gap: 6px; margin-left: auto; flex-shrink: 0; }}
.ds-btn {{
  padding: 4px 10px; border-radius: 6px; border: 1px solid var(--border);
  background: #fff; font-size: 12px; font-weight: 700; cursor: pointer;
}}
.ds-btn.active-dung {{ background: var(--green); color: #fff; border-color: var(--green); }}
.ds-btn.active-sai {{ background: var(--red); color: #fff; border-color: var(--red); }}

/* Trả lời ngắn */
.tln-wrap {{ display: flex; gap: 10px; margin-top: 14px; align-items: center; }}
.tln-input {{
  flex: 1; max-width: 260px; padding: 10px 14px; border-radius: 8px;
  border: 1px solid var(--border); font-size: 15px; outline: none;
}}
.tln-input:focus {{ border-color: #0891b2; }}
.tln-input.correct-ans {{ border-color: var(--green); background: var(--green-dim); }}
.tln-input.wrong-ans {{ border-color: var(--red); background: var(--red-dim); }}

.btn-check {{
  background: var(--primary); color: #fff; border: none; padding: 9px 18px;
  border-radius: 8px; cursor: pointer; font-size: 13px; font-weight: 600;
}}
.btn-check:hover {{ opacity: 0.9; }}

.solution {{
  margin-top: 14px; padding: 14px 18px; background: #f8fafc;
  border-left: 4px solid var(--primary); border-radius: 0 8px 8px 0;
  font-size: 14px; line-height: 1.7; display: none;
}}
.solution.show {{ display: block; }}
.solution-title {{ font-size: 12px; font-weight: 800; color: var(--primary); margin-bottom: 6px; text-transform: uppercase; }}

.footer-bar {{
  background: #0f172a; color: #94a3b8; padding: 14px 24px;
  display: flex; align-items: center; justify-content: space-between;
  border-top: 1px solid var(--border); font-size: 12px;
}}
.btn-submit {{
  background: #16a34a; color: #fff; border: none; padding: 10px 24px;
  border-radius: 8px; cursor: pointer; font-size: 14px; font-weight: 700;
}}
.btn-submit:hover {{ background: #15803d; }}
</style>
</head>
<body>

<header class="header">
  <div class="header-info">
    <div class="school">{TRUONG} • {TO_BOMON}</div>
    <div class="title">{title}</div>
    <div class="sub">Chương trình GDPT 2018 — Định dạng ma trận đề thi 2025</div>
  </div>
  <div class="progress-wrap">
    <div class="score-badge" id="score-display">Điểm: 0 / 10</div>
  </div>
</header>

<main class="main" id="quiz-container">
  <!-- Rendered by JS -->
</main>

<footer class="footer-bar">
  <div>Hệ thống thi trắc nghiệm Toán học trực tuyến • SCORM 1.2</div>
  <button class="btn-submit" onclick="submitExam()">Nộp Bài & Kết Thúc</button>
</footer>

<script>
// SCORM 1.2 API Wrapper
var scorm = {{
  api: null,
  findAPI: function(win) {{
    var findAttempts = 0;
    while (win.API == null && win.parent != null && win.parent != win) {{
      findAttempts++;
      if (findAttempts > 7) return null;
      win = win.parent;
    }}
    return win.API;
  }},
  init: function() {{
    this.api = this.findAPI(window);
    if (!this.api && window.opener) this.api = this.findAPI(window.opener);
    if (this.api) {{
      this.api.LMSInitialize("");
      this.api.LMSSetValue("cmi.core.lesson_status", "incomplete");
      this.api.LMSCommit("");
    }}
  }},
  sendScore: function(score, maxScore) {{
    if (this.api) {{
      var scaled = (score / maxScore) * 10;
      this.api.LMSSetValue("cmi.core.score.raw", scaled.toFixed(1));
      this.api.LMSSetValue("cmi.core.score.min", "0");
      this.api.LMSSetValue("cmi.core.score.max", "10");
      this.api.LMSSetValue("cmi.core.lesson_status", scaled >= 5.0 ? "passed" : "completed");
      this.api.LMSCommit("");
      this.api.LMSFinish("");
    }}
  }}
}};

window.onload = function() {{
  scorm.init();
  renderQuiz();
}};

var questions = {q_json};
var userAnswers = {{}};

function renderQuiz() {{
  var container = document.getElementById("quiz-container");
  var html = "";

  var tnQuestions = questions.filter(q => q.type === "tn");
  var dsQuestions = questions.filter(q => q.type === "ds");
  var tlnQuestions = questions.filter(q => q.type === "tln");

  if (tnQuestions.length > 0) {{
    html += '<div class="section-title">PHẦN I. CÂU TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN (12 CÂU)</div>';
    tnQuestions.forEach(q => {{
      html += renderCard(q);
    }});
  }}

  if (dsQuestions.length > 0) {{
    html += '<div class="section-title">PHẦN II. CÂU TRẮC NGHIỆM ĐÚNG / SAI (4 CÂU - 16 Ý)</div>';
    dsQuestions.forEach(q => {{
      html += renderCard(q);
    }});
  }}

  if (tlnQuestions.length > 0) {{
    html += '<div class="section-title">PHẦN III. CÂU TRẮC NGHIỆM TRẢ LỜI NGẮN (6 CÂU)</div>';
    tlnQuestions.forEach(q => {{
      html += renderCard(q);
    }});
  }}

  container.innerHTML = html;
}}

function renderCard(q) {{
  var numClass = q.type === "ds" ? "ds-num" : (q.type === "tln" ? "tln-num" : "");
  var h = '<div class="card" id="card-' + q.number + '">';
  h += '<div class="q-header">';
  h += '<span class="q-num ' + numClass + '">Câu ' + q.number + '</span>';
  h += '<div class="q-stem">' + q.stem + '</div>';
  h += '</div>';

  if (q.type === "tn") {{
    h += '<div class="options">';
    var labels = ['A', 'B', 'C', 'D'];
    q.options.forEach((opt, idx) => {{
      h += '<div class="opt" id="opt-' + q.number + '-' + idx + '" onclick="selectTN(' + q.number + ',' + idx + ')">';
      h += '<span class="label">' + labels[idx] + '</span>';
      h += '<div>' + opt + '</div>';
      h += '</div>';
    }});
    h += '</div>';
  }} else if (q.type === "ds") {{
    var labels = ['a', 'b', 'c', 'd'];
    h += '<div class="options">';
    q.options.forEach((opt, idx) => {{
      h += '<div class="ds-item" id="ds-item-' + q.number + '-' + idx + '">';
      h += '<div><strong>' + labels[idx] + ')</strong> ' + opt + '</div>';
      h += '<div class="ds-actions">';
      h += '<button class="ds-btn" id="ds-btn-d-' + q.number + '-' + idx + '" onclick="setDS(' + q.number + ',' + idx + ',true)">Đúng</button>';
      h += '<button class="ds-btn" id="ds-btn-s-' + q.number + '-' + idx + '" onclick="setDS(' + q.number + ',' + idx + ',false)">Sai</button>';
      h += '</div>';
      h += '</div>';
    }});
    h += '</div>';
  }} else if (q.type === "tln") {{
    h += '<div class="tln-wrap">';
    h += '<input type="text" class="tln-input" id="tln-' + q.number + '" placeholder="Nhập đáp số..." oninput="setTLN(' + q.number + ', this.value)">';
    h += '</div>';
  }}

  if (q.solution) {{
    h += '<div class="solution" id="sol-' + q.number + '">';
    h += '<div class="solution-title">Lời giải chi tiết:</div>';
    h += q.solution;
    h += '</div>';
  }}

  h += '</div>';
  return h;
}}

function selectTN(qNum, optIdx) {{
  userAnswers[qNum] = optIdx;
  for (var i = 0; i < 4; i++) {{
    var el = document.getElementById('opt-' + qNum + '-' + i);
    if (el) el.classList.remove('selected');
  }}
  var cur = document.getElementById('opt-' + qNum + '-' + optIdx);
  if (cur) cur.classList.add('selected');
}}

function setDS(qNum, optIdx, val) {{
  if (!userAnswers[qNum]) userAnswers[qNum] = {{}};
  userAnswers[qNum][optIdx] = val;
  var btnD = document.getElementById('ds-btn-d-' + qNum + '-' + optIdx);
  var btnS = document.getElementById('ds-btn-s-' + qNum + '-' + optIdx);
  if (val) {{
    btnD.classList.add('active-dung');
    btnS.classList.remove('active-sai');
  }} else {{
    btnS.classList.add('active-sai');
    btnD.classList.remove('active-dung');
  }}
}}

function setTLN(qNum, val) {{
  userAnswers[qNum] = val.trim();
}}

function submitExam() {{
  if (!confirm("Bạn có chắc chắn muốn nộp bài thi không?")) return;

  var totalScore = 0;
  var maxScore = 10;

  // Tính điểm theo ma trận chuẩn 2025:
  // Phần I: 12 câu, mỗi câu 0.25 điểm = 3.0 điểm
  // Phần II: 4 câu, mỗi câu tối đa 1.0 điểm = 4.0 điểm
  //   (1 ý đúng: 0.1đ, 2 ý: 0.25đ, 3 ý: 0.5đ, 4 ý: 1.0đ)
  // Phần III: 6 câu, mỗi câu 0.5 điểm = 3.0 điểm

  questions.forEach(q => {{
    var solEl = document.getElementById('sol-' + q.number);
    if (solEl) solEl.classList.add('show');

    if (q.type === "tn") {{
      var corr = q.correct[0];
      var user = userAnswers[q.number];
      for (var i = 0; i < 4; i++) {{
        var el = document.getElementById('opt-' + q.number + '-' + i);
        if (!el) continue;
        el.classList.add('disabled');
        if (i === corr) el.classList.add('show-correct');
        else if (i === user && user !== corr) el.classList.add('show-wrong');
      }}
      if (user === corr) totalScore += 0.25;
    }} else if (q.type === "ds") {{
      var subCorrectCount = 0;
      var userObj = userAnswers[q.number] || {{}};
      q.options.forEach((opt, idx) => {{
        var isTrue = q.correct.includes(idx);
        var uVal = userObj[idx];
        var itemEl = document.getElementById('ds-item-' + q.number + '-' + idx);
        if (uVal === isTrue) {{
          subCorrectCount++;
          if (itemEl) itemEl.style.borderColor = "var(--green)";
        }} else {{
          if (itemEl) itemEl.style.borderColor = "var(--red)";
        }}
      }});
      if (subCorrectCount === 1) totalScore += 0.1;
      else if (subCorrectCount === 2) totalScore += 0.25;
      else if (subCorrectCount === 3) totalScore += 0.5;
      else if (subCorrectCount === 4) totalScore += 1.0;
    }} else if (q.type === "tln") {{
      var inputEl = document.getElementById('tln-' + q.number);
      var uAns = (userAnswers[q.number] || "").replace(',', '.');
      var cAns = (q.answer || "").replace(',', '.');
      if (inputEl) {{
        inputEl.disabled = true;
        if (uAns && (uAns === cAns || Math.abs(parseFloat(uAns) - parseFloat(cAns)) < 1e-4)) {{
          inputEl.classList.add('correct-ans');
          totalScore += 0.5;
        }} else {{
          inputEl.classList.add('wrong-ans');
          inputEl.value = (userAnswers[q.number] || "") + " (Đ/A đúng: " + q.answer + ")";
        }}
      }}
    }}
  }});

  document.getElementById("score-display").innerText = "Điểm: " + totalScore.toFixed(2) + " / 10";
  scorm.sendScore(totalScore, maxScore);
  alert("Bạn đã hoàn thành bài thi! Điểm số: " + totalScore.toFixed(2) + " / 10");
}}
</script>
</body>
</html>"""


# ─── XỬ LÝ 1 ĐỀ THI ─────────────────────────────────────────────────────────
def process_single_exam(typ_file_path: str) -> dict:
    src_file = Path(typ_file_path)
    folder_name = src_file.parent.name
    filename = src_file.name
    de_id = filename.replace(".typ", "")

    content = src_file.read_text(encoding="utf-8")

    # Lấy accent
    m_acc = re.search(r'#let\s+accent\s*=\s*([^\n]+)', content)
    accent = m_acc.group(1).split('//')[0].strip() if m_acc else 'rgb("1e40af")'

    # Lấy tiêu đề
    m_title = re.search(r'exam-title:\s*"([^"]+)"', content)
    if m_title:
        title = m_title.group(1).strip()
    else:
        title = f"Toán 10 - {folder_name.replace('-', ' ').title()} - {de_id.upper()}"

    # Parse câu hỏi
    questions = parse_file(str(src_file))
    if not questions:
        return {"file": filename, "status": "empty", "count": 0}

    # Sinh HTML
    html_content = build_quiz_html(title, questions, accent)

    # Sinh Manifest
    identifier = f"TOAN10-{folder_name.upper()}-{de_id.upper()}"
    manifest_content = MANIFEST_TPL.format(identifier=identifier, title=title)

    # Đóng gói ZIP
    zip_name = f"scorm-k10-{folder_name}-{de_id}.zip"
    zip_path = OUTPUT_DIR / zip_name

    with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zf:
        zf.writestr("imsmanifest.xml", manifest_content)
        zf.writestr("index.html", html_content)

    size_kb = zip_path.stat().st_size // 1024
    return {
        "file": filename,
        "folder": folder_name,
        "zip": zip_name,
        "questions": len(questions),
        "size_kb": size_kb,
        "status": "success"
    }


# ─── MAIN RUNNER ─────────────────────────────────────────────────────────────
def main():
    parser = argparse.ArgumentParser(description="Build SCORM 1.2 packages for K10")
    parser.add_argument("--chuong", type=str, default="", help="Lọc theo tên thư mục chương")
    parser.add_argument("--de", type=str, default="", help="Lọc theo tên đề (vd: de01A)")
    parser.add_argument("--limit", type=int, default=0, help="Giới hạn số lượng đề xử lý")
    parser.add_argument("--workers", type=int, default=4, help="Số worker song song")
    args = parser.parse_args()

    # Quét tất cả file .typ (bỏ qua symlinks để không trùng lặp)
    all_typ = sorted(glob.glob(str(K10_ROOT / "**" / "*.typ"), recursive=True))
    real_files = []
    seen = set()

    for p in all_typ:
        real_p = os.path.realpath(p)
        if real_p in seen:
            continue
        seen.add(real_p)

        # Kiểm tra điều kiện lọc
        if args.chuong and args.chuong.lower() not in p.lower():
            continue
        if args.de and args.de.lower() not in Path(p).name.lower():
            continue

        real_files.append(real_p)

    if args.limit > 0:
        real_files = real_files[:args.limit]

    print(f"🚀 Bắt đầu chuyển đổi SCORM Khối 10: {len(real_files)} đề thi...")
    start_total = time.time()
    success_count = 0

    if args.workers > 1 and len(real_files) > 1:
        with ProcessPoolExecutor(max_workers=args.workers) as executor:
            futures = {executor.submit(process_single_exam, fp): fp for fp in real_files}
            for fut in as_completed(futures):
                res = fut.result()
                if res.get("status") == "success":
                    success_count += 1
                    print(f"   ✅ [{success_count}/{len(real_files)}] {res['folder']}/{res['file']} -> {res['zip']} ({res['size_kb']} KB, {res['questions']} câu)")
                else:
                    print(f"   ⚠️ Lỗi hoặc rỗng: {res['file']}")
    else:
        for idx, fp in enumerate(real_files, 1):
            res = process_single_exam(fp)
            if res.get("status") == "success":
                success_count += 1
                print(f"   ✅ [{idx}/{len(real_files)}] {res['folder']}/{res['file']} -> {res['zip']} ({res['size_kb']} KB, {res['questions']} câu)")
            else:
                print(f"   ⚠️ Lỗi hoặc rỗng: {res['file']}")

    duration = time.time() - start_total
    print(f"\n🎉 HOÀN TẤT CHUYỂN ĐỔI SCORM KHỐI 10!")
    print(f"   - Tổng số gói SCORM đã tạo: {success_count}/{len(real_files)}")
    print(f"   - Thư mục xuất bản: {OUTPUT_DIR}")
    print(f"   - Thời gian thực hiện: {duration:.2f} giây")


if __name__ == "__main__":
    main()
