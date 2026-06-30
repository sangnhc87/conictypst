#!/usr/bin/env python3
"""
build_scorm.py — Build SCORM 1.2 interactive quiz từ file .typ
Mỗi đề → HTML quiz tương tác với KaTeX + gửi điểm về LMS
"""

import json
import subprocess
import zipfile
from pathlib import Path
from datetime import datetime

sys_path_fix = True

import sys
sys.path.insert(0, str(Path(__file__).parent))
from parse_typ import parse_file, Question

# ─── CẤU HÌNH ────────────────────────────────────────────────────────────────
TRUONG   = "TRƯỜNG THPT NGUYỄN HỮU CẢNH"
TO_BOMON = "TỔ TOÁN"
NAM_HOC  = "2026–2027"
MON      = "TOÁN 12"

SCORM_DIR   = Path(__file__).parent
ROOT_DIR    = SCORM_DIR.parent
TYPST_ROOT  = ROOT_DIR.parent.parent
OUTPUT_DIR  = SCORM_DIR / "output"
WRAPPER_DIR = ROOT_DIR / "_scorm_wrappers"

DANH_SACH_DE = [
    ("01", "01", "1",          "Đơn Điệu & Cực Trị — Đề 1"),
    ("01", "01", "2",          "Đơn Điệu & Cực Trị — Đề 2"),
    ("01", "01", "3",          "Đơn Điệu & Cực Trị — Đề 3 (Nâng Cao)"),
    ("01", "01", "4",          "Đơn Điệu & Cực Trị — Đề 4 (Nâng Cao)"),
    ("01", "02", "1",          "GTLN & GTNN — Đề 1"),
    ("01", "02", "2",          "GTLN & GTNN — Đề 2"),
    ("01", "02", "3",          "GTLN & GTNN — Đề 3"),
    ("01", "02", "4",          "GTLN & GTNN — Đề 4"),
    ("01", "02", "5",          "GTLN & GTNN — Đề 5"),
    ("01", "02", "6",          "GTLN & GTNN — Đề 6"),
    ("01", "03", "1",          "Tiệm Cận — Đề 1"),
    ("01", "03", "2",          "Tiệm Cận — Đề 2"),
    ("01", "03", "3",          "Tiệm Cận — Đề 3"),
    ("01", "04", "1",          "Khảo Sát Hàm Số — Đề 1"),
    ("01", "04", "2",          "Khảo Sát Hàm Số — Đề 2"),
    ("01", "04", "3",          "Khảo Sát Hàm Số — Đề 3"),
    ("01", "05", "1",          "Ứng Dụng Thực Tiễn — Đề 1"),
    ("02", "01", "1",          "Vectơ Không Gian — Đề 1"),
    ("02", "01", "2",          "Vectơ Không Gian — Đề 2"),
    ("02", "02", "1",          "Tọa Độ Vectơ — Đề 1"),
    ("02", "03", "1",          "Phép Toán Vectơ — Đề 1"),
    ("02", "03", "2",          "Phép Toán Vectơ — Đề 2"),
    ("03", "01", "1",          "Thống Kê: Khoảng Biến Thiên — Đề 1"),
    ("03", "01", "2",          "Thống Kê: Khoảng Biến Thiên — Đề 2"),
    ("03", "02", "3",          "Thống Kê: Phương Sai & Độ Lệch Chuẩn — Đề 3"),
    ("03", "02", "4-nangcao",  "Thống Kê: Tổng Hợp Nâng Cao — Đề 4"),
]

# ─── SCORM MANIFEST ───────────────────────────────────────────────────────────
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

# ─── TYPST MATH → KaTeX chuyển đổi cơ bản ────────────────────────────────────
def typst_to_katex(text: str) -> str:
    """Chuyển Typst inline/display math sang KaTeX-compatible LaTeX."""
    import re
    html_blocks = {}

    # Bỏ macro Typst không cần thiết

    def _balance(text: str, start: int, open_c: str, close_c: str) -> int:
        stack = []
        i = start
        while i < len(text):
            if text[i] == '$':
                i += 1
                while i < len(text) and text[i] != '$':
                    if text[i] == '\\': i += 2
                    else: i += 1
            elif text[i] == '"':
                i += 1
                while i < len(text) and text[i] != '"':
                    if text[i] == '\\': i += 2
                    else: i += 1
            elif text[i] in '([{':
                stack.append(text[i])
            elif text[i] in ')]}':
                if stack:
                    top = stack[-1]
                    if (top == '(' and text[i] == ')') or \
                       (top == '[' and text[i] == ']') or \
                       (top == '{' and text[i] == '}'):
                        stack.pop()
                        if not stack: return i
            i += 1
        return -1

    def strip_wrapper(text, prefix):
        while True:
            idx = text.find(prefix + '[')
            if idx == -1: break
            end = _balance(text, idx + len(prefix), '[', ']')
            if end != -1:
                text = text[:idx] + text[idx+len(prefix)+1:end] + text[end+1:]
            else:
                text = text.replace(prefix + '[', '')
        return text

    # ── Bước 1: Xử lý các macro Typst block ngoài toán học ──────────────
    def _bal(t, start, op, cl):
        stk = []
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
                stk.append(t[i])
            elif t[i] in ')]}':
                if stk:
                    top = stk[-1]
                    if (top == '(' and t[i] == ')') or \
                       (top == '[' and t[i] == ']') or \
                       (top == '{' and t[i] == '}'):
                        stk.pop()
                        if not stk: return i
            i += 1
        return -1

    def strip_wrapper(text, prefix):
        while True:
            idx = text.find(prefix + '[')
            if idx == -1: break
            end = _bal(text, idx + len(prefix), '[', ']')
            if end != -1:
                text = text[:idx] + text[idx+len(prefix)+1:end] + text[end+1:]
            else:
                text = text.replace(prefix + '[', '')
        return text

    def strip_paren_block(text, prefix):
        """Strip #prefix(args)[content] → content, hoặc #prefix(args) → ''"""
        while True:
            idx = text.find('#' + prefix + '(')
            if idx == -1: break
            paren_start = idx + len('#' + prefix)
            paren_end = _bal(text, paren_start, '(', ')')
            if paren_end == -1:
                text = text[:idx] + text[idx+len('#'+prefix)+1:]
                continue
            after = text[paren_end+1:].lstrip()
            offset = len(text[paren_end+1:]) - len(after)
            if after.startswith('['):
                brk_start = paren_end + 1 + offset
                brk_end = _bal(text, brk_start, '[', ']')
                if brk_end != -1:
                    text = text[:idx] + text[brk_start+1:brk_end] + text[brk_end+1:]
                    continue
            text = text[:idx] + text[paren_end+1:]
        return text

    # Strip macro blocks Typst (giữ nội dung)
    text = strip_wrapper(text, '#step')
    text = strip_wrapper(text, '#True')
    text = strip_wrapper(text, '#False')
    text = text.replace('#resetstep()', '')
    text = text.replace('#resetcau()', '')
    text = re.sub(r'#v\s*\([^)]*\)', '', text)
    text = re.sub(r'#h\s*\([^)]*\)', ' ', text)
    text = re.sub(r'#pagebreak\([^)]*\)', '', text)
    text = re.sub(r'#linebreak\(\)', '', text)
    text = re.sub(r'//[^\n]*', '', text)
    for _mac in ['align', 'text', 'par', 'pad', 'box', 'block', 'grid', 'stack', 'place', 'emph', 'strong', 'figure']:
        text = strip_paren_block(text, _mac)
        text = strip_wrapper(text, '#' + _mac)
    # Bold/italic Typst → HTML tags will be handled after SVG extraction

    def parse_args(inner: str):
        args = {}
        inner = inner.replace('\n', ' ')
        parts, depth, curr = [], 0, []
        for char in inner:
            if char in '([{': depth += 1
            elif char in ')]}': depth -= 1
            elif char == ',' and depth == 0:
                parts.append(''.join(curr).strip())
                curr = []
                continue
            curr.append(char)
        if curr: parts.append(''.join(curr).strip())
        for p in parts:
            if ':' in p:
                k, v = p.split(':', 1)
                args[k.strip()] = v.strip()
        return args

    def extract_list(val: str):
        if not val.startswith('('): return [val.strip('"')]
        inner = val[1:-1]
        parts, depth, curr = [], 0, []
        for char in inner:
            if char in '([{': depth += 1
            elif char in ')]}': depth -= 1
            elif char == ',' and depth == 0:
                parts.append(''.join(curr).strip())
                curr = []
                continue
            curr.append(char)
        if curr: parts.append(''.join(curr).strip())
        return [p.strip('"') for p in parts]

    def render_table_svg(macro_name, inner):
        import subprocess, uuid, os
        tmp_name = f"table_{uuid.uuid4().hex[:8]}"
        tmp_typ = f"/Users/admin/conictypst/typst/sach/DECUONG12-HK1/scorm/output/{tmp_name}.typ"
        tmp_svg = f"/Users/admin/conictypst/typst/sach/DECUONG12-HK1/scorm/output/{tmp_name}.svg"
        
        typst_code = f"""
#import "/sach/DECUONG12-HK1/preamble.typ": *
#import "/bbt.typ": *
#set page(width: auto, height: auto, margin: 2pt, fill: none)
#{macro_name}({inner})
"""
        with open(tmp_typ, 'w') as f:
            f.write(typst_code)
            
        try:
            res = subprocess.run(['typst', 'compile', '--root', '/Users/admin/conictypst/typst', tmp_typ, tmp_svg], check=True, capture_output=True)
            with open(tmp_svg, 'r') as f:
                svg = f.read()
            if svg.startswith('<?xml'):
                svg = svg.split('?>', 1)[-1]
            html = f'<div style="text-align:center; overflow-x:auto; margin: 10px 0;">{svg}</div>'
            try:
                os.remove(tmp_typ)
                os.remove(tmp_svg)
            except: pass
            html_key = f'%%HTML_{len(html_blocks)}%%'
            html_blocks[html_key] = html
            return html_key
        except subprocess.CalledProcessError as e:
            print(f"Table compile error ({macro_name}): {e.stderr.decode()}")
            html = f'<div style="color:red">[Lỗi render {macro_name}]</div>'
            html_key = f'%%HTML_{len(html_blocks)}%%'
            html_blocks[html_key] = html
            return html_key

    def render_bxd(inner):
        return render_table_svg('my-bxd', inner)

    def render_bbbt(inner):
        return render_table_svg('my-bbbt', inner)

    def render_canvas(inner):
        import subprocess, uuid, os
        tmp_name = f"cetz_{uuid.uuid4().hex[:8]}"
        tmp_typ = f"/Users/admin/conictypst/typst/sach/DECUONG12-HK1/scorm/output/{tmp_name}.typ"
        tmp_svg = f"/Users/admin/conictypst/typst/sach/DECUONG12-HK1/scorm/output/{tmp_name}.svg"
        
        typst_code = f"""
#import "@preview/cetz:0.5.2"
#import "/sach/DECUONG12-HK1/preamble.typ": *
#set page(width: auto, height: auto, margin: 5pt, fill: none)
#let draw-ellipse(cx, cy, rx, ry, stroke: 1pt, style: "solid") = {{
  let stroke-val = stroke
  import draw: *
  if style == "dashed" {{
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  }} else if style == "dashed-back" {{
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  }} else {{
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: stroke-val)
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  }}
}}
#cetz.canvas({inner})
"""
        with open(tmp_typ, 'w') as f:
            f.write(typst_code)
            
        try:
            res = subprocess.run(['typst', 'compile', '--root', '/Users/admin/conictypst/typst', tmp_typ, tmp_svg], check=True, capture_output=True)
            with open(tmp_svg, 'r') as f:
                svg = f.read()
            if svg.startswith('<?xml'):
                svg = svg.split('?>', 1)[-1]
            html = f'<div style="text-align:center; margin: 10px 0;">{svg}</div>'
            try:
                os.remove(tmp_typ)
                os.remove(tmp_svg)
            except: pass
            html_key = f'%%HTML_{len(html_blocks)}%%'
            html_blocks[html_key] = html
            return html_key
        except subprocess.CalledProcessError as e:
            print(f"Canvas compile error: {e.stderr.decode()}")
            html = '<div style="color:red">[Lỗi render đồ thị]</div>'
            html_key = f'%%HTML_{len(html_blocks)}%%'
            html_blocks[html_key] = html
            return html_key


    for macro in ['my-bxd', 'my-bbbt', 'bbt-opt', 'bbtv2', 'bbt', 'canvas', 'cetz.canvas', 'table']:
        while True:
            kw = '#' + macro + '('
            idx = text.find(kw)
            if idx == -1: break
            end = _balance(text, idx + len(kw) - 1, '(', ')')
            if end == -1: break
            
            inner = text[idx + len(kw) : end]
            if macro in ['canvas', 'cetz.canvas']:
                html_key = render_canvas(inner)
            else:
                html_key = render_table_svg(macro, inner)
            text = text[:idx] + html_key + text[end+1:]

    # Bold/italic Typst → HTML tags (Chỉ áp dụng ngoài block toán)
    parts = re.split(r'(\$[^$]+\$)', text)
    result = []
    for part in parts:
        if part.startswith('$') and part.endswith('$'):
            result.append(part)
        else:
            part = re.sub(r'\*\*?([^*\n]+?)\*\*?', r'<strong>\1</strong>', part)
            part = re.sub(r'(?<!\w)_([^_\n]+)_(?!\w)', r'<em>\1</em>', part)
            result.append(part)
    text = ''.join(result)

    def process_cases(inner_str, env_type="cases"):
        # Thay thế "..." bằng 	ext{...}
        inner_str = re.sub(r'"([^"]*)"', lambda x: r'\text{' + x.group(1) + '}', inner_str)
        # Phân tách theo dấu phẩy
        parts = []
        depth = 0
        current = []
        for char in inner_str:
            if char == '(': depth += 1
            elif char == ')': depth -= 1
            elif char == ',' and depth == 0:
                parts.append(''.join(current))
                current = []
                continue
            current.append(char)
        if current:
            parts.append(''.join(current))
        
        lines = [p.strip() for p in parts]
        if env_type == "hoac":
            return r'\left[ \begin{matrix} ' + r' \\ '.join(lines) + r' \end{matrix} \right.'
        else:
            return r'\begin{cases} ' + r' \\ '.join(lines) + r' \end{cases}'

    # Xử lý từng đoạn $...$
    def convert_math(m):
        inner = m.group(1)
        
        # Typst thường dùng \\ làm phép hiệu tập hợp (setminus)
        inner = inner.replace(r'\\', r'\setminus')

        # Typst math uses {...} for literal sets, whereas KaTeX uses \{...\}.
        # Escape any unescaped braces before applying KaTeX macros.
        inner = re.sub(r'(?<!\\)\{', r'\\{', inner)
        inner = re.sub(r'(?<!\\)\}', r'\\}', inner)

        def balance_paren_args(s, func_name):
            # Tìm func_name( và trả về danh sách các args (tách bởi dấu phẩy ở top-level)
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
            
            # Phân tách args bằng dấu phẩy
            args = []
            cur = []
            d = 0
            for c in args_str:
                if c == '(': d += 1
                elif c == ')': d -= 1
                elif c == ',' and d == 0:
                    args.append(''.join(cur).strip())
                    cur = []
                    continue
                cur.append(c)
            if cur:
                args.append(''.join(cur).strip())
            return args, idx, end
            
        # Xử lý cases, heva, hoac
        for kw in ['cases', 'heva', 'hoac']:
            while True:
                cm = re.search(r'\b' + kw + r'\s*\(', inner)
                if not cm: break
                depth = 0
                start = cm.end() - 1
                end = -1
                for i in range(start, len(inner)):
                    if inner[i] == '(': depth += 1
                    elif inner[i] == ')':
                        depth -= 1
                        if depth == 0:
                            end = i
                            break
                if end < 0: break
                cases_inner = inner[start+1:end]
                env_type = "hoac" if kw == "hoac" else "cases"
                inner = inner[:cm.start()] + process_cases(cases_inner, env_type) + inner[end+1:]
                
        # "text" -> \text{text}
        inner = re.sub(r'"([^"]*)"', lambda x: r'\text{' + x.group(1) + '}', inner)

        # Xử lý các hàm phức tạp — ưu tiên theo độ phức tạp
        while True:
            changed = False

            # arrow/vect/overrightarrow → \overrightarrow{}
            for fn in ['arrow', 'vect', 'vec', 'overrightarrow']:
                args, start, end = balance_paren_args(inner, fn)
                if args is not None:
                    inner = inner[:start] + r'\overrightarrow{' + args[0] + '}' + inner[end+1:]
                    changed = True; break
            if changed: continue

            # hat → \widehat{} (góc) — nếu >= 2 ký tự thì widehat, 1 ký tự thì hat
            args, start, end = balance_paren_args(inner, 'hat')
            if args is not None:
                content = args[0]
                cmd = r'\widehat' if len(content.replace(' ','')) >= 2 else r'\hat'
                inner = inner[:start] + cmd + '{' + content + '}' + inner[end+1:]
                continue

            # tilde → \widetilde{}
            args, start, end = balance_paren_args(inner, 'tilde')
            if args is not None:
                inner = inner[:start] + r'\widetilde{' + args[0] + '}' + inner[end+1:]
                continue

            # bold → \boldsymbol{}
            for fn in ['bold', 'upright', 'cal']:
                args, start, end = balance_paren_args(inner, fn)
                if args is not None:
                    cmd = {'bold': r'\boldsymbol', 'upright': r'\mathrm', 'cal': r'\mathcal'}[fn]
                    inner = inner[:start] + cmd + '{' + args[0] + '}' + inner[end+1:]
                    changed = True; break
            if changed: continue

            # overline → \overline{}
            args, start, end = balance_paren_args(inner, 'overline')
            if args is not None:
                inner = inner[:start] + r'\overline{' + args[0] + '}' + inner[end+1:]
                continue

            # underbrace/overbrace
            for fn in ['underbrace', 'overbrace']:
                args, start, end = balance_paren_args(inner, fn)
                if args is not None:
                    cmd = '\\' + fn
                    if len(args) == 2:
                        inner = inner[:start] + cmd + '{' + args[0] + '}_{' + args[1] + '}' + inner[end+1:]
                    else:
                        inner = inner[:start] + cmd + '{' + args[0] + '}' + inner[end+1:]
                    changed = True; break
            if changed: continue

            # frac/dfrac/tfrac → \dfrac{}{}
            for fn in ['frac', 'dfrac', 'tfrac', 'tfrac-tex']:
                args, start, end = balance_paren_args(inner, fn)
                if args is not None and len(args) == 2:
                    repl = r'\dfrac{' + args[0] + '}{' + args[1] + '}'
                    # Nếu sau dfrac có ^, bọc lại thành {\dfrac{}{}}^
                    after = inner[end+1:end+2]
                    if after == '^':
                        repl = '{' + repl + '}'
                    inner = inner[:start] + repl + inner[end+1:]
                    changed = True; break
            if changed: continue

            # mat(a,b;c,d) → \begin{pmatrix}a & b \\ c & d\end{pmatrix}
            args, start, end = balance_paren_args(inner, 'mat')
            if args is not None:
                # Typst mat: , = cột, ; = hàng
                rows_raw = ' '.join(args)
                rows = rows_raw.split(';')
                latex_rows = []
                for row in rows:
                    cols = [c.strip() for c in row.split(',') if c.strip()]
                    latex_rows.append(' & '.join(cols))
                mat_inner = r' \\ '.join(latex_rows)
                inner = inner[:start] + r'\begin{pmatrix}' + mat_inner + r'\end{pmatrix}' + inner[end+1:]
                continue

            # floor/ceil
            args, start, end = balance_paren_args(inner, 'floor')
            if args is not None and len(args) == 1:
                inner = inner[:start] + r'\lfloor ' + args[0] + r' \rfloor' + inner[end+1:]
                continue
            args, start, end = balance_paren_args(inner, 'ceil')
            if args is not None and len(args) == 1:
                inner = inner[:start] + r'\lceil ' + args[0] + r' \rceil' + inner[end+1:]
                continue

            # C/A/P/binom
            args, start, end = balance_paren_args(inner, 'C')
            if args is not None and len(args) == 2:
                inner = inner[:start] + 'C_{' + args[0] + '}^{' + args[1] + '}' + inner[end+1:]
                continue
            args, start, end = balance_paren_args(inner, 'A')
            if args is not None and len(args) == 2:
                inner = inner[:start] + 'A_{' + args[0] + '}^{' + args[1] + '}' + inner[end+1:]
                continue
            args, start, end = balance_paren_args(inner, 'P')
            if args is not None and len(args) == 1:
                inner = inner[:start] + 'P_{' + args[0] + '}' + inner[end+1:]
                continue
            args, start, end = balance_paren_args(inner, 'binom')
            if args is not None and len(args) == 2:
                inner = inner[:start] + r'\binom{' + args[0] + '}{' + args[1] + '}' + inner[end+1:]
                continue

            # root/sqrt
            args, start, end = balance_paren_args(inner, 'root')
            if args is not None and len(args) == 2:
                inner = inner[:start] + r'\sqrt[' + args[0] + ']{' + args[1] + '}' + inner[end+1:]
                continue
            args, start, end = balance_paren_args(inner, 'sqrt')
            if args is not None and len(args) == 1:
                inner = inner[:start] + r'\sqrt{' + args[0] + '}' + inner[end+1:]
                continue

            # abs/norm
            args, start, end = balance_paren_args(inner, 'abs')
            if args is not None and len(args) == 1:
                inner = inner[:start] + r'\left|' + args[0] + r'\right|' + inner[end+1:]
                continue
            args, start, end = balance_paren_args(inner, 'norm')
            if args is not None and len(args) == 1:
                inner = inner[:start] + r'\left\|' + args[0] + r'\right\|' + inner[end+1:]
                continue

            args, start, end = balance_paren_args(inner, 'limits')
            if args is not None and len(args) == 1:
                inner = inner[:start] + args[0] + r'\limits' + inner[end+1:]
                continue

            break  # Không còn gì để xử lý


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
                        if depth == 0:
                            end = i
                            break
                if end == -1: break
                inner = inner[:idx] + prefix + '{' + inner[idx+2:end] + '}' + inner[end+1:]


        # Xử lý heva và hoac
        for func in ['heva', 'hoac']:
            while True:
                idx = inner.find(func + '(')
                if idx == -1:
                    break
                    
                if idx > 0 and inner[idx-1].isalpha():
                    inner = inner[:idx] + 'X' + func[1:] + inner[idx+len(func):]
                    continue
                    
                start = idx + len(func) + 1
                depth = 1
                end = -1
                for i in range(start, len(inner)):
                    if inner[i] == '(': depth += 1
                    elif inner[i] == ')': depth -= 1
                    
                    if depth == 0:
                        end = i
                        break
                        
                if end == -1:
                    inner = inner[:idx] + 'X' + func[1:] + inner[idx+len(func):]
                    continue
                    
                inner_args = inner[start:end]
                args = []
                curr = []
                d = 0
                for char in inner_args:
                    if char == '(': d += 1
                    elif char == ')': d -= 1
                    
                    if char == ',' and d == 0:
                        args.append(''.join(curr).strip())
                        curr = []
                    else:
                        curr.append(char)
                if curr:
                    args.append(''.join(curr).strip())
                    
                content = r' \\ '.join(args)
                if func == 'heva':
                    replacement = r'\begin{cases} ' + content + r' \end{cases}'
                else:
                    replacement = r'\left[\begin{array}{l} ' + content + r' \end{array}\right.'
                    
                inner = inner[:idx] + replacement + inner[end+1:]
        inner = inner.replace('Xeva', 'heva').replace('Xoac', 'hoac')

        # Ánh xạ ký hiệu toán học Typst → LaTeX (toàn diện)
        _SYM_RE = [
            (r'<=>',         r'\Leftrightarrow'),
            (r'=>',          r'\Rightarrow'),
            (r'->',          r'\to'),
            (r'<-',          r'\leftarrow'),
            (r'<=',          r'\le'),
            (r'>=',          r'\ge'),
            (r'!=',          r'\ne'),
            (r'+oo',         r'+\infty'),
            (r'-oo',         r'-\infty'),
        ]
        for lit, repl in _SYM_RE:
            inner = inner.replace(lit, repl)

        replacements_ordered = [
            # Word-bounded symbols
            (r'\bintegral(?=\b|_|\^|\s)', r'\int'),
            (r'\bsum(?=\b|_|\^|\s)',     r'\sum'),
            (r'\bproduct(?=\b|_|\^|\s)', r'\prod'),
            (r'\bqquad\b',   r'\qquad'),
            (r'\bquad\b',    r'\quad'),

            (r'\bunion\b',   r'\cup'),
            (r'\bsect\b',    r'\cap'),
            (r'\bcap\b',     r'\cap'),
            (r'\bcup\b',     r'\cup'),
            (r'\bin\b',      r'\in'),
            (r'\bnotin\b',   r'\notin'),
            (r'\bsubset\b',  r'\subset'),
            (r'\bsupset\b',  r'\supset'),
            (r'\bsubseteq\b',r'\subseteq'),
            (r'\bsupseteq\b',r'\supseteq'),
            (r'\bbackslash\b', r'\setminus'),
            (r'\bsetminus\b',  r'\setminus'),
            (r'\bempty\b',   r'\emptyset'),
            (r'\bemptyset\b',r'\emptyset'),
            (r'\bvarnothing\b', r'\varnothing'),
            (r'\bleq\b',     r'\leq'),
            (r'\bgeq\b',     r'\geq'),
            (r'\ble\b',      r'\le'),
            (r'\bge\b',      r'\ge'),
            (r'\bneq\b',     r'\neq'),
            (r'\bne\b',      r'\ne'),
            (r'\bapprox\b',  r'\approx'),
            (r'\bequiv\b',   r'\equiv'),
            (r'\bsim\b',     r'\sim'),
            (r'\bsimeq\b',   r'\simeq'),
            (r'\bcong\b',    r'\cong'),
            (r'\bpropto\b',  r'\propto'),
            (r'\brightarrow\b',    r'\rightarrow'),
            (r'\bleftarrow\b',     r'\leftarrow'),
            (r'\bleftrightarrow\b',r'\leftrightarrow'),
            (r'\bRightarrow\b',    r'\Rightarrow'),
            (r'\bLeftarrow\b',     r'\Leftarrow'),
            (r'\bLeftrightarrow\b',r'\Leftrightarrow'),
            (r'\buparrow\b',  r'\uparrow'),
            (r'\bdownarrow\b',r'\downarrow'),
            (r'\bmapsto\b',  r'\mapsto'),
            (r'\bto\b',      r'\to'),
            (r'\bdot\.op\b', r'\cdot'),
            (r'\bdot\b',     r'\cdot'),
            (r'\bplus\.minus\b', r'\pm'),
            (r'\bminus\.plus\b', r'\mp'),
            (r'\bpm\b',      r'\pm'),
            (r'\bmp\b',      r'\mp'),
            (r'\bcdot\b',    r'\cdot'),
            (r'\btimes\b',   r'\times'),
            (r'\bdiv\b',     r'\div'),
            (r'\bast\b',     r'\ast'),
            (r'\bcirc\.stroked\.tiny\b', r'^\circ'),
            (r'\bdegree\b',  r'^\circ'),
            (r'\boplus\b',   r'\oplus'),
            (r'\botimes\b',  r'\otimes'),
            (r'\bforall\b',  r'\forall'),
            (r'\bexists\b',  r'\exists'),
            (r'\bnexists\b', r'\nexists'),
            (r'\bnot\b',     r'\neg'),
            (r'\bneg\b',     r'\neg'),
            (r'\bland\b',    r'\land'),
            (r'\blor\b',     r'\lor'),
            (r'\btherefore\b', r'\therefore'),
            (r'\bbecause\b', r'\because'),
            (r'\bint\b',     r'\int'),
            (r'\biint\b',    r'\iint'),
            (r'\biiint\b',   r'\iiint'),
            (r'\boint\b',    r'\oint'),
            (r'\bpartial\b', r'\partial'),
            (r'\bnabla\b',   r'\nabla'),
            (r'\binfty\b',   r'\infty'),
            (r'\binfinity\b',r'\infty'),
            (r'\boo\b',      r'\infty'),
            (r'\bRR\b',      r'\mathbb{R}'),
            (r'\bZZ\b',      r'\mathbb{Z}'),
            (r'\bNN\b',      r'\mathbb{N}'),
            (r'\bQQ\b',      r'\mathbb{Q}'),
            (r'\bCC\b',      r'\mathbb{C}'),
            (r'\bHH\b',      r'\mathbb{H}'),
            (r'\bldots\b',   r'\ldots'),
            (r'\bcdots\b',   r'\cdots'),
            (r'\bvdots\b',   r'\vdots'),
            (r'\bddots\b',   r'\ddots'),
            (r'\bperp\b',    r'\perp'),
            (r'\bparallel\b',r'\parallel'),
            (r'\bangle\b',   r'\angle'),
            (r'\bmeasuredangle\b', r'\measuredangle'),
            (r'\btriangle\b',r'\triangle'),
            (r'\bsquare\b',  r'\square'),
            (r'\bdiamond\b', r'\diamond'),
            (r'\bhbar\b',    r'\hbar'),
            (r'\bell\b',     r'\ell'),
            (r'\bRe\b',      r'\operatorname{Re}'),
            (r'\bIm\b',      r'\operatorname{Im}'),
            (r'\baleph\b',   r'\aleph'),
            (r'\\\*',        r'\cdot'),
        ]
        for k, v in replacements_ordered:
            if k.startswith(r'\b'):
                k = r'(?<!\\)' + k
            inner = re.sub(k, lambda m, v=v: v, inner)



        # Thêm backslash cho các hàm Toán và chữ cái Hy Lạp
        math_funcs = ['sin', 'cos', 'tan', 'cot', 'arcsin', 'arccos', 'arctan', 'arccot',
                      'sinh', 'cosh', 'tanh', 'coth', 'circ',
                      'csc', 'sec', 'sgn', 'log', 'ln', 'lim', 'limsup', 'liminf',
                      'exp', 'max', 'min', 'sup', 'inf', 'det', 'deg', 'gcd', 'lcm',
                      'ker', 'rank', 'tr', 'dim', 'Pr', 'arg']
        greek_letters = [
            'alpha', 'beta', 'gamma', 'Gamma', 'Delta', 'delta', 'epsilon', 'varepsilon',
            'zeta', 'eta', 'theta', 'vartheta', 'Theta', 'iota', 'kappa',
            'lambda', 'Lambda', 'mu', 'nu', 'xi', 'Xi', 'pi', 'Pi', 'varpi',
            'rho', 'varrho', 'sigma', 'Sigma', 'varsigma', 'tau',
            'upsilon', 'Upsilon', 'phi', 'Phi', 'varphi', 'chi', 'psi', 'Psi',
            'omega', 'Omega'
        ]
        
        for kw in math_funcs + greek_letters:

            # Chỉ thay thế nếu chưa có \ ở trước và không bị dính chữ (vd: 2pi thì được, abcpi thì không)
            inner = re.sub(r'(?<![a-zA-Z\\])' + kw + r'(?![a-zA-Z])', lambda m, kw=kw: '\\' + kw, inner)

        return f'${inner}$'

    text = re.sub(r'\$([^$]+)\$', convert_math, text)

    # Escape HTML (ngoài math)
    
    def convert_fraction(s):
        # Temporarily hide \text{...} blocks
        text_blocks = []
        def hide_text(m):
            text_blocks.append(m.group(0))
            return f"[TEXT_BLOCK_{len(text_blocks)-1}]"
        
        s = re.sub(r'\\text\{[^{}]*\}', hide_text, s)

        while True:
            idx = s.find('/')
            if idx == -1: break
            
            left_end = idx - 1
            while left_end >= 0 and s[left_end].isspace(): left_end -= 1
            if left_end < 0: 
                s = s[:idx] + '[SLASH]' + s[idx+1:]
                continue
                
            left_start = left_end
            if s[left_end] == '}':
                depth = 1
                left_start -= 1
                while left_start >= 0 and depth > 0:
                    if s[left_start] == '}': depth += 1
                    elif s[left_start] == '{': depth -= 1
                    left_start -= 1
                if left_start >= 0 and s[left_start] == '}':
                    depth = 1
                    left_start -= 1
                    while left_start >= 0 and depth > 0:
                        if s[left_start] == '}': depth += 1
                        elif s[left_start] == '{': depth -= 1
                        left_start -= 1
                tmp = left_start
                while tmp >= 0 and (s[tmp].isalpha() or s[tmp] == '\\'): tmp -= 1
                left_start = tmp + 1
            elif s[left_end] == ')':
                depth = 1
                left_start -= 1
                while left_start >= 0 and depth > 0:
                    if s[left_start] == ')': depth += 1
                    elif s[left_start] == '(': depth -= 1
                    left_start -= 1
                left_start += 1
                tmp = left_start - 1
                while tmp >= 0 and s[tmp].isalpha(): tmp -= 1
                left_start = tmp + 1
            else:
                while left_start >= 0 and (s[left_start].isalnum() or s[left_start] in "_.^\\"):
                    left_start -= 1
                left_start += 1
                
            right_start = idx + 1
            while right_start < len(s) and s[right_start].isspace(): right_start += 1
            if right_start >= len(s):
                s = s[:idx] + '[SLASH]' + s[idx+1:]
                continue
                
            right_end = right_start
            if s[right_start] == '(':
                depth = 1
                right_end += 1
                while right_end < len(s) and depth > 0:
                    if s[right_end] == '(': depth += 1
                    elif s[right_end] == ')': depth -= 1
                    right_end += 1
                right_end -= 1
            else:
                if s[right_start].isalpha() or s[right_start] == '\\':
                    tmp = right_start
                    while tmp < len(s) and (s[tmp].isalpha() or s[tmp] == '\\'): tmp += 1
                    if tmp < len(s) and s[tmp] == '{':
                        depth = 1
                        tmp += 1
                        while tmp < len(s) and depth > 0:
                            if s[tmp] == '{': depth += 1
                            elif s[tmp] == '}': depth -= 1
                            tmp += 1
                        right_end = tmp - 1
                    elif tmp < len(s) and s[tmp] == '(':
                        depth = 1
                        tmp += 1
                        while tmp < len(s) and depth > 0:
                            if s[tmp] == '(': depth += 1
                            elif s[tmp] == ')': depth -= 1
                            tmp += 1
                        right_end = tmp - 1
                    else:
                        right_end = tmp - 1
                else:
                    while right_end < len(s) and (s[right_end].isalnum() or s[right_end] in "_.^\\"):
                        right_end += 1
                    right_end -= 1
                    
            A = s[left_start:left_end+1].strip()
            B = s[right_start:right_end+1].strip()
            
            if A.startswith('(') and A.endswith(')'):
                d, ok = 0, True
                for i in range(len(A)-1):
                    if A[i] == '(': d += 1
                    elif A[i] == ')': d -= 1
                    if d == 0: ok = False; break
                if ok: A = A[1:-1]
                
            if B.startswith('(') and B.endswith(')'):
                d, ok = 0, True
                for i in range(len(B)-1):
                    if B[i] == '(': d += 1
                    elif B[i] == ')': d -= 1
                    if d == 0: ok = False; break
                if ok: B = B[1:-1]
                
            s = s[:left_start] + f"\\dfrac{{{A}}}{{{B}}}" + s[right_end+1:]

        s = s.replace('[SLASH]', '/')
        # Restore text blocks
        for i, txt in enumerate(text_blocks):
            s = s.replace(f"[TEXT_BLOCK_{i}]", txt)
        return s

    parts = re.split(r'(\$[^$]+\$)', text)
    result = []
    for part in parts:
        if part.startswith('$') and part.endswith('$'):
            part = convert_fraction(part)
            result.append(part)
        else:
            part = part.replace('&', '&amp;').replace('<', '&lt;').replace('>', '&gt;')
            part = re.sub(r'\\\s+', '<br/>', part)
            part = part.replace('\n', '<br/>')
            result.append(part)
    result_str = ''.join(result)
    for k, v in html_blocks.items():
        result_str = result_str.replace(k, v)
    return result_str


# ─── BUILD HTML QUIZ ──────────────────────────────────────────────────────────
def build_quiz_html(title: str, questions: list) -> str:
    """Sinh HTML quiz tương tác với KaTeX."""

    # Chuẩn bị data JSON cho JS
    q_data = []
    for q in questions:
        entry = {
            "type": q.q_type,
            "number": q.number,
            "stem": typst_to_katex(q.stem),
            "solution": typst_to_katex(q.solution) if q.solution else "",
        }
        if q.q_type == "tn":
            entry["options"] = [typst_to_katex(o) for o in q.options]
            entry["correct"] = q.correct  # list of 0-based indices
        elif q.q_type == "ds":
            entry["options"] = [typst_to_katex(o) for o in q.options]
            entry["correct"] = q.correct  # which are True
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
  --blue: #3b82f6; --blue-dim: #eff6ff;
  --green: #16a34a; --green-dim: #f0fdf4;
  --red: #dc2626; --red-dim: #fef2f2;
  --yellow: #eab308; --yellow-dim: #fefce8;
  --text: #0f172a; --muted: #475569;
  --radius: 10px;
}}
* {{ margin:0; padding:0; box-sizing:border-box; }}
body {{
  font-family: 'Segoe UI', Arial, sans-serif;
  background: var(--bg); color: var(--text);
  min-height: 100vh; display: flex; flex-direction: column;
}}
.header {{
  background: linear-gradient(135deg,#003087 0%,#0047b3 100%);
  padding: 10px 20px;
  display: flex; align-items: center; justify-content: space-between;
  box-shadow: 0 2px 12px rgba(0,0,0,0.5); flex-shrink: 0;
}}
.header-info .school {{ font-size:10px; color:#90caf9; }}
.header-info .title  {{ font-size:15px; font-weight:700; color:#fff; margin:2px 0; }}
.header-info .sub    {{ font-size:11px; color:#bbdefb; }}
.progress-wrap {{
  display: flex; align-items: center; gap: 10px; flex-shrink: 0;
}}
.progress-ring {{
  width: 50px; height: 50px;
  border-radius: 50%;
  background: conic-gradient(var(--blue) 0%, #1e2030 0%);
  display: flex; align-items: center; justify-content: center;
  transition: background 0.4s;
}}
.progress-ring-inner {{
  width: 36px; height: 36px; background: #003087;
  border-radius: 50%; display: flex; align-items: center; justify-content: center;
  font-size: 11px; font-weight: 700; color: #fff;
}}
.score-badge {{
  background: rgba(0,0,0,0.1);
  border: 1px solid rgba(0,0,0,0.2);
  padding: 4px 12px; border-radius: 20px;
  font-size: 12px; color: #fff; font-weight: 600;
  min-width: 70px; text-align: center;
}}
.main {{ flex: 1; padding: 16px 20px; max-width: 860px; margin: 0 auto; width: 100%; }}
.section-header {{
  font-size: 11px; font-weight: 700; color: var(--blue);
  letter-spacing: 1px; text-transform: uppercase;
  margin: 20px 0 10px; padding-bottom: 6px;
  border-bottom: 1px solid var(--border);
}}
.card {{
  background: var(--card); border: 1px solid var(--border);
  border-radius: var(--radius); padding: 16px; margin-bottom: 14px;
  transition: border-color 0.2s;
}}
.card.answered {{ border-color: var(--blue-dim); }}
.card.correct  {{ border-color: var(--green); background: var(--green-dim); }}
.card.wrong    {{ border-color: var(--red);   background: var(--red-dim); }}
.q-header {{
  display: flex; gap: 10px; align-items: flex-start; margin-bottom: 12px;
}}
.q-num {{
  background: var(--blue); color: #fff;
  border-radius: 6px; padding: 2px 8px;
  font-size: 11px; font-weight: 700; flex-shrink: 0; margin-top: 2px;
}}
.q-num.ds-type {{ background: #7c3aed; }}
.q-num.tln-type {{ background: #0891b2; }}
.q-stem {{ font-size: 14px; line-height: 1.6; white-space: pre-line; }}
.options {{ display: flex; flex-direction: column; gap: 7px; margin-top: 10px; }}
.opt {{
  display: flex; align-items: center; gap: 10px;
  padding: 9px 13px; border-radius: 8px;
  border: 1px solid var(--border); cursor: pointer;
  transition: all 0.15s; font-size: 13.5px; line-height: 1.5;
  background: rgba(0,0,0,0.02);
}}
.opt:hover:not(.disabled) {{ border-color: var(--blue); background: rgba(76,142,247,0.08); }}
.opt .label {{
  min-width: 24px; height: 24px;
  border: 2px solid var(--muted); border-radius: 50%;
  display: flex; align-items: center; justify-content: center;
  font-size: 11px; font-weight: 700; flex-shrink: 0;
  transition: all 0.15s;
}}
.opt.selected .label {{ border-color: var(--blue); background: var(--blue); color: #fff; }}
.opt.show-correct  {{ border-color: var(--green); background: rgba(34,197,94,0.1); }}
.opt.show-correct .label {{ border-color: var(--green); background: var(--green); color: #fff; }}
.opt.show-wrong    {{ border-color: var(--red); background: rgba(239,68,68,0.1); }}
.opt.show-wrong .label {{ border-color: var(--red); background: var(--red); color: #fff; }}
.opt.disabled {{ cursor: default; }}

/* DS checkboxes */
.ds-opt {{ cursor: pointer; padding: 8px 13px; border-radius: 8px;
  border: 1px solid var(--border); font-size: 13.5px; margin-bottom: 6px;
  display: flex; align-items: flex-start; gap: 10px; transition: all 0.15s;
  background: rgba(0,0,0,0.02);
}}
.ds-opt:hover:not(.disabled) {{ border-color: #7c3aed; background: rgba(124,58,237,0.08); }}
.ds-check {{ width: 22px; height: 22px; border-radius: 5px;
  border: 2px solid var(--muted); flex-shrink: 0; margin-top: 2px;
  display: flex; align-items: center; justify-content: center;
  font-size: 12px; transition: all 0.15s;
}}
.ds-opt.selected .ds-check {{ border-color: #7c3aed; background: #7c3aed; color: #fff; }}
.ds-opt.show-correct {{ border-color: var(--green); background: rgba(34,197,94,0.1); }}
.ds-opt.show-correct .ds-check {{ border-color: var(--green); background: var(--green); color: #fff; }}
.ds-opt.show-wrong {{ border-color: var(--red); background: rgba(239,68,68,0.1); }}
.ds-opt.show-wrong .ds-check {{ border-color: var(--red); background: var(--red); color: #fff; }}
.ds-opt.disabled {{ cursor: default; }}

/* TLN input */
.tln-row {{ display: flex; gap: 8px; margin-top: 10px; align-items: center; }}
.tln-input {{
  flex: 1; background: rgba(0,0,0,0.05); border: 1px solid var(--border);
  border-radius: 8px; padding: 9px 13px; color: var(--text); font-size: 14px;
  outline: none; transition: border-color 0.15s;
}}
.tln-input:focus {{ border-color: #0891b2; }}
.tln-input.correct-input {{ border-color: var(--green); background: rgba(34,197,94,0.1); }}
.tln-input.wrong-input {{ border-color: var(--red); background: rgba(239,68,68,0.1); }}
.tln-input.disabled {{ cursor: default; }}

/* Buttons */
.btn-check {{
  background: var(--blue); color: #fff; border: none;
  padding: 9px 18px; border-radius: 8px; cursor: pointer;
  font-size: 13px; font-weight: 600; transition: opacity 0.15s; white-space: nowrap;
}}
.btn-check:hover {{ opacity: 0.85; }}
.btn-check:disabled {{ opacity: 0.4; cursor: default; }}
.btn-check.ds-btn {{ background: #7c3aed; }}
.btn-check.tln-btn {{ background: #0891b2; }}

/* Solution box */
.solution {{
  margin-top: 12px; padding: 12px 14px;
  background: rgba(0,0,0,0.03); border-left: 3px solid var(--blue);
  border-radius: 0 8px 8px 0; font-size: 13px; line-height: 1.7;
  display: none; white-space: pre-line;
}}
.solution.show {{ display: block; }}
.solution-label {{ font-size: 10px; font-weight: 700; color: var(--blue);
  text-transform: uppercase; letter-spacing: 0.8px; margin-bottom: 6px; }}
.feedback {{
  display: flex; align-items: center; gap: 6px;
  font-size: 12px; font-weight: 600; margin-top: 8px;
  padding: 6px 10px; border-radius: 6px;
}}
.feedback.ok {{ background: rgba(34,197,94,0.15); color: var(--green); }}
.feedback.err {{ background: rgba(239,68,68,0.15); color: var(--red); }}
.feedback.partial {{ background: rgba(250,204,21,0.15); color: var(--yellow); }}

/* Footer */
.footer-bar {{
  background: #080810; padding: 10px 20px;
  display: flex; align-items: center; justify-content: space-between;
  border-top: 1px solid var(--border); flex-shrink: 0;
  font-size: 11px; color: var(--muted);
}}
.btn-submit {{
  background: linear-gradient(135deg, #16a34a, #15803d);
  color: #fff; border: none; padding: 8px 22px; border-radius: 8px;
  cursor: pointer; font-size: 13px; font-weight: 700; transition: opacity 0.15s;
}}
.btn-submit:hover {{ opacity: 0.88; }}
.btn-submit:disabled {{ opacity: 0.4; cursor: default; }}
.result-banner {{
  display: none; text-align: center; padding: 30px 20px;
  background: var(--card); border-radius: var(--radius);
  border: 1px solid var(--border); margin: 20px 0;
}}
.result-banner.show {{ display: block; }}
.result-score {{ font-size: 52px; font-weight: 800; }}
.result-score.high {{ color: var(--green); }}
.result-score.mid  {{ color: var(--yellow); }}
.result-score.low  {{ color: var(--red); }}
.result-msg {{ font-size: 16px; margin-top: 8px; color: var(--muted); }}
</style>
</head>
<body>

<div class="header">
  <div class="header-info">
    <div class="school">{TRUONG} &nbsp;·&nbsp; {TO_BOMON} &nbsp;·&nbsp; NĂM HỌC {NAM_HOC}</div>
    <div class="title">{title}</div>
    <div class="sub">{MON} — Quiz Luyện Tập Tương Tác</div>
  </div>
  <div class="progress-wrap">
    <div>
      <div id="score-badge" class="score-badge">0 / 0</div>
      <div style="font-size:10px;color:#90caf9;text-align:center;margin-top:3px" id="done-lbl">Chưa làm</div>
    </div>
    <div class="progress-ring" id="prog-ring">
      <div class="progress-ring-inner" id="prog-pct">0%</div>
    </div>
  </div>
</div>

<div class="main" id="main-content">
  <div id="quiz-container"></div>
  <div id="result-banner" class="result-banner">
    <div class="result-score" id="result-score"></div>
    <div class="result-msg" id="result-msg"></div>
    <div style="margin-top:16px;font-size:13px;color:var(--muted)">
      Hãy xem lại lời giải các câu bên trên để hiểu rõ hơn.
    </div>
  </div>
</div>

<div class="footer-bar">
  <span>{TRUONG} — {MON} — NĂM HỌC {NAM_HOC}</span>
  <button class="btn-submit" id="btn-submit" onclick="submitAll()">Nộp bài & Xem kết quả</button>
</div>

<script>
// ─── Dữ liệu câu hỏi ─────────────────────────────────────────────────────────
const QUESTIONS = {q_json};

// ─── Trạng thái ──────────────────────────────────────────────────────────────
const state = {{
  tn:  {{}},   // câu_idx → selected option index
  ds:  {{}},   // câu_idx → Set of selected indices
  tln: {{}},   // câu_idx → string input
  checked: {{}}, // câu_idx → boolean
  points: {{}},  // câu_idx → 0/0.25/0.5/0.75/1
}};

let submitted = false;
let scormAPI = null;

// ─── SCORM 1.2 ───────────────────────────────────────────────────────────────
function findAPI(w) {{
  let n = 0;
  while (!w.API && w.parent && w.parent !== w) {{
    if (++n > 7) break;
    w = w.parent;
  }}
  return w.API;
}}
function getAPI() {{
  if (!scormAPI) scormAPI = findAPI(window) || (window.opener && findAPI(window.opener));
  return scormAPI;
}}
function lmsInit() {{
  const api = getAPI();
  if (api) {{ api.LMSInitialize(""); api.LMSSetValue("cmi.core.lesson_status","incomplete"); api.LMSCommit(""); }}
}}
function lmsFinish(score) {{
  const api = getAPI();
  if (!api) return;
  api.LMSSetValue("cmi.core.score.raw", String(Math.round(score)));
  api.LMSSetValue("cmi.core.score.min", "0");
  api.LMSSetValue("cmi.core.score.max", "10");
  api.LMSSetValue("cmi.core.lesson_status", score >= 5 ? "passed" : "failed");
  api.LMSCommit("");
  api.LMSFinish("");
}}

// ─── Render câu hỏi ──────────────────────────────────────────────────────────
function renderAll() {{
  const container = document.getElementById('quiz-container');
  let html = '';
  let curSection = '';

  QUESTIONS.forEach((q, i) => {{
    // Section header
    const sectionMap = {{ tn: 'PHẦN I — Trắc Nghiệm (ABCD)', ds: 'PHẦN II — Đúng / Sai', tln: 'PHẦN III — Trả Lời Ngắn' }};
    const sec = sectionMap[q.type];
    if (sec !== curSection) {{
      html += `<div class="section-header">${{sec}}</div>`;
      curSection = sec;
    }}

    html += `<div class="card" id="card-${{i}}">`;
    html += `<div class="q-header">`;
    html += `<span class="q-num ${{q.type}}-type">Câu ${{q.number}}</span>`;
    html += `<div class="q-stem">${{q.stem}}</div>`;
    html += `</div>`;

    if (q.type === 'tn') {{
      html += renderTN(q, i);
    }} else if (q.type === 'ds') {{
      html += renderDS(q, i);
    }} else {{
      html += renderTLN(q, i);
    }}

    // Solution
    html += `<div class="solution" id="sol-${{i}}">`;
    html += `<div class="solution-label">📝 Lời giải</div>`;
    const solText = q.solution ? q.solution.replace(/\\n/g, '<br/>') : '(Xem trong tài liệu)';
    html += `<div style="line-height: 1.6;">${{solText}}</div>`;
    html += `</div>`;

    html += `</div>`;
  }});

  container.innerHTML = html;
  // Init DS state
  QUESTIONS.forEach((q, i) => {{
    if (q.type === 'ds') state.ds[i] = new Set();
  }});
}};

function renderTN(q, i) {{
  const labels = ['A','B','C','D'];
  let html = '<div class="options">';
  q.options.forEach((opt, j) => {{
    html += `<div class="opt" id="opt-${{i}}-${{j}}" onclick="selectTN(${{i}},${{j}})">
      <div class="label">${{labels[j]}}</div>
      <div>${{opt}}</div>
    </div>`;
  }});
  html += '</div>';
  html += `<div style="text-align:right;margin-top:10px">
    <button class="btn-check" id="btn-${{i}}" onclick="checkTN(${{i}})">Kiểm tra</button>
  </div>`;
  html += `<div class="feedback" id="fb-${{i}}" style="display:none"></div>`;
  return html;
}};

function renderDS(q, i) {{
  const labels = ['a','b','c','d'];
  let html = '<div style="margin-top:8px">';
  q.options.forEach((opt, j) => {{
    html += `<div class="ds-opt" id="dsopt-${{i}}-${{j}}" onclick="toggleDS(${{i}},${{j}})">
      <div class="ds-check" id="dschk-${{i}}-${{j}}"></div>
      <div><strong>${{labels[j]}}</strong>) ${{opt}}</div>
    </div>`;
  }});
  html += '</div>';
  html += `<div style="text-align:right;margin-top:10px">
    <button class="btn-check ds-btn" id="btn-${{i}}" onclick="checkDS(${{i}})">Kiểm tra</button>
  </div>`;
  html += `<div class="feedback" id="fb-${{i}}" style="display:none"></div>`;
  return html;
}};

function renderTLN(q, i) {{
  return `<div class="tln-row">
    <input class="tln-input" id="tln-${{i}}" placeholder="Nhập đáp án..." oninput="state.tln[${{i}}]=this.value"/>
    <button class="btn-check tln-btn" id="btn-${{i}}" onclick="checkTLN(${{i}})">Kiểm tra</button>
  </div>
  <div class="feedback" id="fb-${{i}}" style="display:none"></div>`;
}};

// ─── Interaction ────────────────────────────────────────────────────────────────────────────
function selectTN(qi, oi) {{
  if (state.checked[qi] || submitted) return;
  const prev = state.tn[qi];
  if (prev !== undefined) document.getElementById(`opt-${{qi}}-${{prev}}`).classList.remove('selected');
  state.tn[qi] = oi;
  document.getElementById(`opt-${{qi}}-${{oi}}`).classList.add('selected');
}};

function toggleDS(qi, oi) {{
  if (state.checked[qi] || submitted) return;
  const s = state.ds[qi];
  const el = document.getElementById(`dsopt-${{qi}}-${{oi}}`);
  const chk = document.getElementById(`dschk-${{qi}}-${{oi}}`);
  if (s.has(oi)) {{ s.delete(oi); el.classList.remove('selected'); chk.textContent = ''; }}
  else           {{ s.add(oi);    el.classList.add('selected');    chk.textContent = '✓'; }}
}};

function checkTN(qi) {{
  if (state.checked[qi] || submitted) return;
  const q = QUESTIONS[qi];
  const sel = state.tn[qi];
  if (sel === undefined) {{ alert('Bạn chưa chọn đáp án!'); return; }}
  state.checked[qi] = true;

  const isCorrect = q.correct.includes(sel);
  state.points[qi] = isCorrect ? 1 : 0;

  q.options.forEach((_, j) => {{
    const el = document.getElementById(`opt-${{qi}}-${{j}}`);
    el.classList.add('disabled');
    if (q.correct.includes(j)) el.classList.add('show-correct');
    else if (j === sel && !isCorrect) el.classList.add('show-wrong');
  }});

  const fb = document.getElementById(`fb-${{qi}}`);
  fb.style.display = 'flex';
  fb.className = `feedback ${{isCorrect ? 'ok' : 'err'}}`;
  fb.innerHTML = isCorrect ? '✅ Chính xác!' : `❌ Sai. Đáp án đúng: ${{['A','B','C','D'][q.correct[0]]}}`;

  document.getElementById(`sol-${{qi}}`).classList.add('show');
  document.getElementById(`btn-${{qi}}`).disabled = true;
  document.getElementById(`card-${{qi}}`).classList.add(isCorrect ? 'correct' : 'wrong');
  document.getElementById(`card-${{qi}}`).classList.add('answered');
  setTimeout(() => {{ fb.scrollIntoView({{behavior:'smooth', block:'nearest'}}); }}, 100);
  updateProgress();
}};


function checkDS(qi) {{
  if (state.checked[qi] || submitted) return;
  const q = QUESTIONS[qi];
  const sel = state.ds[qi];
  if (sel.size === 0) {{ alert('Bạn chưa chọn mệnh đề nào!'); return; }}
  state.checked[qi] = true;

  const correctSet = new Set(q.correct);
  let correct_cnt = 0;
  q.options.forEach((_, j) => {{
    const el = document.getElementById(`dsopt-${{qi}}-${{j}}`);
    const chk = document.getElementById(`dschk-${{qi}}-${{j}}`);
    el.classList.add('disabled');
    const userSel = sel.has(j);
    const isCor = correctSet.has(j);
    if (isCor && userSel) {{ el.classList.add('show-correct'); correct_cnt++; }}
    else if (isCor && !userSel) {{ el.classList.add('show-correct'); chk.textContent = '✓'; }}
    else if (!isCor && userSel) {{ el.classList.add('show-wrong'); }}
  }});

  const total = q.correct.length;
  const pts = correct_cnt === total && sel.size === total ? 1
            : correct_cnt >= Math.ceil(total*0.75) ? 0.75
            : correct_cnt >= Math.ceil(total*0.5) ? 0.5
            : correct_cnt >= 1 ? 0.25 : 0;
  state.points[qi] = pts;

  const fb = document.getElementById(`fb-${{qi}}`);
  fb.style.display = 'flex';
  fb.className = `feedback ${{pts === 1 ? 'ok' : pts >= 0.5 ? 'partial' : 'err'}}`;
  fb.innerHTML = pts === 1 ? `✅ Hoàn toàn đúng! (${{correct_cnt}}/${{total}})` : `⚠️ Đúng ${{correct_cnt}}/${{total}} mệnh đề`;

  document.getElementById(`sol-${{qi}}`).classList.add('show');
  document.getElementById(`btn-${{qi}}`).disabled = true;
  document.getElementById(`card-${{qi}}`).classList.add(pts === 1 ? 'correct' : pts > 0 ? 'answered' : 'wrong');
  updateProgress();
}};

function checkTLN(qi) {{
  if (state.checked[qi] || submitted) return;
  const q = QUESTIONS[qi];
  const inp = document.getElementById(`tln-${{qi}}`);
  const userVal = (state.tln[qi] || inp.value).trim();
  if (!userVal) {{ alert('Bạn chưa nhập đáp án!'); return; }}
  state.checked[qi] = true;

  // So sánh thông minh hơn: normalize unicode, số học, phân số
  function normalizeTLN(s) {{
    return s
      .replace(/\$/g, '')           // loại bỏ $
      .replace(/\u2212/g, '-')       // unicode minus − → -
      .replace(/\u00b7/g, '.')       // · → .
      .replace(/,/g, '.')            // dấu phẩy (số thập phân Việt) → .
      .replace(/\\s+/g, '')          // bỏ whitespace
      .toLowerCase();
  }}
  function tryNumeric(s) {{
    // Cố gắng đọc dưới dạng số thập phân
    const n = parseFloat(s);
    return isNaN(n) ? null : n;
  }}
  function tryFraction(s) {{
    // Hỗ trợ dạng a/b → số
    const m = s.match(/^(-?\\d+)\\s*\/\\s*(-?\\d+)$/);
    if (m) return parseFloat(m[1]) / parseFloat(m[2]);
    return null;
  }}

  const normExpected = normalizeTLN(q.answer);
  const normActual   = normalizeTLN(userVal);

  let isCorrect = (normActual === normExpected);
  if (!isCorrect) {{
    // So sánh số học với sai số nhỏ (1e-9)
    const numE = tryFraction(normExpected) ?? tryNumeric(normExpected);
    const numA = tryFraction(normActual)   ?? tryNumeric(normActual);
    if (numE !== null && numA !== null) {{
      isCorrect = Math.abs(numE - numA) < 1e-9;
    }}
  }}
  state.points[qi] = isCorrect ? 1 : 0;

  inp.classList.add(isCorrect ? 'correct-input' : 'wrong-input');
  inp.classList.add('disabled');
  inp.readOnly = true;

  const fb = document.getElementById(`fb-${{qi}}`);
  fb.style.display = 'flex';
  fb.className = `feedback ${{isCorrect ? 'ok' : 'err'}}`;
  if (isCorrect) {{
    fb.innerHTML = '✅ Đúng rồi!';
  }} else {{
    fb.innerHTML = `❌ Chưa đúng. Đáp án: <span id="tln-ans-${{qi}}">${{q.answer}}</span>`;
    // Re-render KaTeX cho đáp án
    try {{
      const ansEl = document.getElementById(`tln-ans-${{qi}}`);
      if (ansEl && window.renderMathInElement) renderMathInElement(ansEl);
    }} catch(e) {{}}
  }}

  document.getElementById(`sol-${{qi}}`).classList.add('show');
  document.getElementById(`btn-${{qi}}`).disabled = true;
  document.getElementById(`card-${{qi}}`).classList.add(isCorrect ? 'correct' : 'wrong');
  document.getElementById(`card-${{qi}}`).classList.add('answered');
  // Auto-scroll đến feedback
  setTimeout(() => {{ fb.scrollIntoView({{behavior:'smooth', block:'nearest'}}); }}, 100);
  updateProgress();
}};


// ─── Progress ─────────────────────────────────────────────────────────────────
function updateProgress() {{
  const total = QUESTIONS.length;
  const done = Object.keys(state.checked).length;
  const pts = Object.values(state.points).reduce((a,b) => a+b, 0);
  const score10 = total > 0 ? (pts / total * 10).toFixed(1) : 0;

  document.getElementById('score-badge').textContent = `${{score10}} / 10`;
  document.getElementById('done-lbl').textContent = `${{done}}/${{total}} câu`;
  const pct = total > 0 ? Math.round(done/total*100) : 0;
  document.getElementById('prog-pct').textContent = pct + '%';
  document.getElementById('prog-ring').style.background =
    `conic-gradient(var(--blue) ${{pct}}%, #1e2030 ${{pct}}%)`;
}};

// ─── Submit ───────────────────────────────────────────────────────────────────
function submitAll() {{
  submitted = true;
  document.getElementById('btn-submit').disabled = true;

  // Tự động kiểm tra các câu chưa làm
  QUESTIONS.forEach((q, i) => {{
    if (!state.checked[i]) {{
      state.points[i] = 0;
      state.checked[i] = true;
    }}
  }});
  updateProgress();

  const total = QUESTIONS.length;
  const pts = Object.values(state.points).reduce((a,b)=>a+b,0);
  const score10 = total > 0 ? pts / total * 10 : 0;
  const pct = Math.round(score10*10);

  const banner = document.getElementById('result-banner');
  banner.classList.add('show');
  const sc = document.getElementById('result-score');
  sc.textContent = score10.toFixed(1) + ' / 10';
  sc.className = `result-score ${{score10 >= 8 ? 'high' : score10 >= 5 ? 'mid' : 'low'}}`;
  document.getElementById('result-msg').textContent =
    score10 >= 9 ? '🏆 Xuất sắc! Bạn nắm rất vững kiến thức.' :
    score10 >= 7 ? '🎉 Tốt! Cần ôn thêm vài điểm nhỏ.' :
    score10 >= 5 ? '📚 Cần ôn tập thêm một số phần.' :
    '💪 Hãy xem lại lời giải và ôn tập kỹ hơn.';

  banner.scrollIntoView({{behavior:'smooth'}});
  lmsFinish(score10);
}};

// ─── Init ─────────────────────────────────────────────────────────────────────
window.addEventListener('load', () => {{
  lmsInit();
  renderAll();
  updateProgress();
  // Re-render math after dynamic content
  if (window.renderMathInElement) {{
    setTimeout(() => renderMathInElement(document.body, {{
      delimiters:[
        {{left:'$$',right:'$$',display:true}},
        {{left:'$',right:'$',display:false}}
      ],
      throwOnError: false
    }}), 200);
  }}
}});
</script>
</body>
</html>"""


# ─── BUILD SCORM ZIP ──────────────────────────────────────────────────────────
def make_zip(chuong, bai, de_so, ten_de, questions):
    identifier = f"TOAN12-C{chuong}-B{bai}-D{de_so.upper().replace('-','_')}"
    zip_name = f"scorm-C{chuong}-bai{bai}-de{de_so}.zip"
    zip_path = OUTPUT_DIR / zip_name

    manifest = MANIFEST_TPL.format(identifier=identifier, title=ten_de)
    html = build_quiz_html(ten_de, questions)

    with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zf:
        zf.writestr("imsmanifest.xml", manifest)
        zf.writestr("index.html", html)

    kb = zip_path.stat().st_size // 1024
    print(f"    ✅ {zip_name} ({kb} KB) — {len(questions)} câu")
    return zip_path


def build_all():
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    results = []
    total = len(DANH_SACH_DE)
    print(f"\n🚀 Build {total} SCORM Quiz — Tài liệu Toán 12 HK1\n{'─'*55}")

    for i, (chuong, bai, de_so, ten_de) in enumerate(DANH_SACH_DE, 1):
        src = ROOT_DIR / f"chuong-{chuong}" / f"bai{bai}-de{de_so}.typ"
        print(f"[{i:02}/{total}] {ten_de}")
        if not src.exists():
            print(f"    ⏭️  Bỏ qua (không tìm thấy {src.name})")
            continue

        print(f"    📖 Đang parse câu hỏi...", end=" ", flush=True)
        try:
            questions = parse_file(str(src))
            print(f"{len(questions)} câu OK")
        except Exception as e:
            print(f"LỖI: {e}")
            continue

        if not questions:
            print(f"    ⚠️  Không có câu hỏi nào được parse!")
            continue

        zip_path = make_zip(chuong, bai, de_so, ten_de, questions)
        results.append({"title": ten_de, "zip": zip_path.name, "questions": len(questions)})

    (OUTPUT_DIR / "index.json").write_text(
        json.dumps({"generated": datetime.now().isoformat(), "packages": results},
                   ensure_ascii=False, indent=2), encoding="utf-8"
    )

    print(f"\n{'='*55}")
    print(f"✅ Hoàn tất: {len(results)}/{total} package(s)")
    print(f"📂 Đầu ra:   {OUTPUT_DIR}")
    print(f"{'='*55}\n")


if __name__ == "__main__":
    build_all()
