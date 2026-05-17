#!/usr/bin/env python3
"""
typ2docx — SMART Typst → DOCX với Word equations thực sự (OMML)
Pipeline: .typ → preprocess → clean.typ → pandoc → .docx
"""
import re, subprocess, tempfile, shutil, threading, webbrowser, zipfile
from pathlib import Path
from flask import Flask, request, send_file, render_template_string, jsonify

WORKSPACE  = Path(__file__).parent.resolve()
FONT_PATHS = [WORKSPACE / "src/assets/fonts", WORKSPACE / "fonts"]
TYPST_BIN  = shutil.which("typst") or "typst"
PANDOC_BIN = shutil.which("pandoc") or "pandoc"
app = Flask(__name__)

# ── Typst parser ──────────────────────────────────────────────────────────────
class TP:
    def __init__(self, text): self.t = text; self.i = 0
    @property
    def rest(self): return self.t[self.i:]
    @property
    def cur(self): return self.t[self.i] if self.i < len(self.t) else ''
    def skip(self, chars=' \t\n,'):
        while self.i < len(self.t) and self.t[self.i] in chars: self.i += 1
    def read_str(self):
        if self.cur != '"': return
        self.i += 1
        while self.i < len(self.t) and self.t[self.i] != '"':
            if self.t[self.i] == '\\': self.i += 1
            self.i += 1
        if self.cur == '"': self.i += 1
    def read_enc(self, op, cl):
        if self.cur != op: return ''
        depth = 0; start = self.i + 1
        math = 0        # inside $...$
        cdepth = 0      # content-block depth: inside [...], () are text for rp()
        while self.i < len(self.t):
            c = self.t[self.i]
            if c == '"' and not math and not cdepth: self.read_str(); continue
            if c == '$': math = 1 - math; self.i += 1; continue
            if math: self.i += 1; continue   # inside $...$: skip all
            # Skip // line comments (commented code has unbalanced brackets)
            if c == '/' and self.i + 1 < len(self.t) and self.t[self.i+1] == '/':
                while self.i < len(self.t) and self.t[self.i] != '\n': self.i += 1
                continue
            # For rp(): track [] content-block depth. Inside [], () are text.
            if op == '(':
                if c == '[': cdepth += 1; self.i += 1; continue
                elif c == ']':
                    if cdepth > 0: cdepth -= 1
                    self.i += 1; continue
            if cdepth > 0: self.i += 1; continue   # inside []: skip () counting
            if c == op: depth += 1
            elif c == cl:
                depth -= 1
                if depth == 0:
                    s = self.t[start:self.i]; self.i += 1; return s
            self.i += 1
        return self.t[start:]
    def rb(self): return self.read_enc('[', ']')
    def rp(self): return self.read_enc('(', ')')
    def skip_val(self):
        self.skip(' \t')
        if   self.cur == '[': self.rb()
        elif self.cur == '"': self.read_str()
        elif self.cur == '(': self.rp()
        else:
            # Skip identifier chain (e.g. cetz.canvas) then eat (args) or [args]
            while self.i < len(self.t) and self.cur not in '([),\n': self.i += 1
            if   self.cur == '(': self.rp()
            elif self.cur == '[': self.rb()
    def parse_opts(self):
        """Return list of (content, correct, is_raw_expr) tuples.
        is_raw_expr=True when option is a Typst expression (variable/function),
        is_raw_expr=False when it's a [content] block."""
        opts = []
        while self.i < len(self.t):
            self.skip()
            if self.cur in (')', ''): break
            m = re.match(r'(True|False)\s*\(', self.rest)
            if m:
                correct = m.group(1) == 'True'; self.i += m.end() - 1
                inner = self.rp()
                sp = TP(inner.strip()); sp.skip()
                if sp.cur == '[':
                    opts.append((sp.rb(), correct, False))
                else:
                    opts.append((inner.strip(), correct, True))
            elif self.cur == '[':
                opts.append((self.rb(), False, False))
            elif self.cur == ',':
                self.i += 1
            else:
                # Raw expression: identifier/dotted-name with optional (args)[content]
                start = self.i
                while self.i < len(self.t) and self.cur not in '([),\n':
                    self.i += 1
                self.skip(' \t')
                if self.cur == '(': self.rp()
                self.skip(' \t')
                if self.cur == '[': self.rb()
                expr = self.t[start:self.i].strip()
                if expr:
                    opts.append((expr, False, True))
        return opts
    def parse_qargs(self, qtype):
        stem = ''; opts = []; ans = ''; fig = ''; fig_width = ''; loigiai = ''
        while self.i < len(self.t):
            self.skip()
            if self.cur in (')', ''): break
            nm = re.match(r'([a-zA-Z_][a-zA-Z0-9_-]*)\s*:', self.rest)
            if nm and nm.group(1) not in ('True', 'False'):
                key = nm.group(1); self.i += nm.end()
                if key == 'fig':
                    # Capture full figure expression: func(args)[content]
                    self.skip(' \t')
                    start = self.i
                    fn = re.match(r'[a-zA-Z_][a-zA-Z0-9_.-]*', self.rest)
                    if fn: self.i += fn.end()
                    self.skip(' \t')
                    if self.cur == '(': self.rp()
                    self.skip(' \t')
                    if self.cur == '[': self.rb()
                    fig = self.t[start:self.i].strip()
                elif key in ('fig-width', 'fig_width'):
                    self.skip(' \t')
                    start_w = self.i
                    while self.i < len(self.t) and self.cur not in ',)\n': self.i += 1
                    fig_width = self.t[start_w:self.i].strip()
                elif key == 'loigiai':
                    self.skip(' \t')
                    if self.cur == '[': loigiai = self.rb()
                    else: self.skip_val()
                else:
                    self.skip_val()
                continue
            if not stem and self.cur == '[': stem = self.rb(); continue
            if stem and not opts and self.cur == '(' and qtype in ('tn', 'ds'):
                opts = TP(self.rp()).parse_opts(); continue
            if stem and not ans and self.cur == '[' and qtype in ('tln', 'tl'):
                ans = self.rb(); continue
            if   self.cur == '[': self.rb()
            elif self.cur == '(': self.rp()
            elif self.cur == '"': self.read_str()
            else: self.i += 1
        return stem, opts, ans, fig, fig_width, loigiai

# ── Preprocessor ─────────────────────────────────────────────────────────────
def _extract_main_content(content):
    """For make-questions files: extract just the function body [...].
    For direct files: return as-is."""
    m = re.search(r'#let\s+make-questions\s*\(', content)
    if m:
        p = TP(content)
        p.i = content.index('(', m.start())
        p.rp()                              # skip (tn: tn, ds: ds, ...)
        while p.i < len(p.t) and p.cur in ' \t\n=': p.i += 1
        if p.cur == '[':
            return p.rb()
    return content

def _skip_directive(p):
    """After matching #name, eat the full directive including args, = value, etc."""
    # method chains: #func.with(...)
    while p.cur == '.':
        p.i += 1
        fn = re.match(r'[a-zA-Z_][a-zA-Z0-9_-]*', p.rest)
        if fn: p.i += fn.end()
    p.skip(' \t')

    if p.cur == ':':
        # #show: func.with(...)
        p.i += 1; p.skip(' \t\n')
        while True:
            fn = re.match(r'[a-zA-Z_][a-zA-Z0-9_.-]*', p.rest)
            if fn: p.i += fn.end()
            if p.cur == '.': p.i += 1; continue
            break
        p.skip(' \t')
        if p.cur == '(': p.rp()
        elif p.cur == '[': p.rb()
        return

    if p.cur == '(':
        p.rp()
        # might be destructuring: #let (a,b) = expr
        p.skip(' \t')
        if p.cur == '=':
            p.i += 1; _skip_value(p)
        return

    if p.cur == '"':
        # #import "file": * or #import "file": item
        p.read_str(); p.skip(' \t')
        if p.cur == ':':
            while p.i < len(p.t) and p.cur != '\n': p.i += 1
        return

    if p.cur == '[':
        p.rb(); return

    if p.cur == '=':
        p.i += 1; _skip_value(p); return

    # Identifier follows: #let varname = ..., #set text(...), etc.
    m = re.match(r'[a-zA-Z_][a-zA-Z0-9_.-]*', p.rest)
    if m:
        p.i += m.end(); p.skip(' \t')
        # Now handle: (args), [content], = expr, or end of line
        if p.cur == '(':
            p.rp()                 # eat function args: text(fill: ...)
            p.skip(' \t')
            if p.cur == '=':       # #let name(args) = expr
                p.i += 1; _skip_value(p)
            elif p.cur == ':':     # #show name(args): it => transform
                p.i += 1; p.skip(' \t\n')
                arrow = re.match(r'[a-zA-Z_][a-zA-Z0-9_]*\s*=>', p.rest)
                if arrow: p.i += arrow.end(); p.skip(' \t\n')
                _skip_value(p)
            return
        elif p.cur == '[': p.rb(); return
        elif p.cur == '=':
            p.i += 1; _skip_value(p); return
        else:
            while p.i < len(p.t) and p.cur != '\n': p.i += 1

def _skip_value(p):
    """Skip a value expression that may span multiple lines (e.g. cetz.canvas({...}))."""
    p.skip(' \t')
    if p.cur == '(':   p.rp(); return
    if p.cur == '[':   p.rb(); return
    if p.cur == '"':   p.read_str(); return
    if p.cur == '{':   p.read_enc('{', '}'); return  # code blocks: #let f() = {...}
    # identifier possibly followed by (args) or [content], e.g. cetz.canvas({...})
    while True:
        m = re.match(r'[a-zA-Z_][a-zA-Z0-9_.-]*', p.rest)
        if m: p.i += m.end()
        p.skip(' \t')
        if p.cur == '(': p.rp(); return
        if p.cur == '[': p.rb(); return
        if p.cur == '{': p.read_enc('{', '}'); return
        break
    # fallback: skip to end of line
    while p.i < len(p.t) and p.cur != '\n': p.i += 1

def _clean_stem(text):
    """Strip #func(...)[...] directives from stem/option content, keep text + math."""
    out = []; p = TP(text)
    while p.i < len(p.t):
        if p.cur == '#':
            dm = re.match(r'#[a-zA-Z_][a-zA-Z0-9_.-]*', p.rest)
            if dm:
                p.i += dm.end(); p.skip(' \t')
                if p.cur == '(': p.rp()
                if p.cur == '[': p.rb(); continue
                # #set text(...), #show text.with(...) — eat the following identifier + args
                m2 = re.match(r'[a-zA-Z_][a-zA-Z0-9_.-]*', p.rest)
                if m2: p.i += m2.end(); p.skip(' \t')
                if p.cur == '(': p.rp()
                if p.cur == '[': p.rb()
                continue
        out.append(p.cur); p.i += 1
    return ''.join(out)

def _extract_preamble(src):
    """Extract imports/setup/lets before the first question macro.
    For make-questions wrapper files uses that as boundary.
    Strips #show: document-level rules so they don't override the standalone figure page."""
    # make-questions wrapper (most exam files): use as boundary
    m_mq = re.search(r'#let\s+make-questions\s*\(', src)
    if m_mq:
        preamble = src[:m_mq.start()].strip()
    else:
        # Fallback: first unindented question macro
        m_q = re.search(r'\n#(?:tn|tln|ds|tl|mcq|tf|short)\s*\(', src)
        if m_q:
            preamble = src[:m_q.start()].strip()
        else:
            m_head = re.search(r'\n= ', src)
            preamble = src[:m_head.start()].strip() if m_head else src.strip()
    # Replace page setup with auto-size for standalone figure rendering
    preamble = re.sub(
        r'#set\s+page\s*\([^()]*(?:\([^()]*\)[^()]*)*\)',
        '#set page(width: auto, height: auto, margin: 6pt, fill: white)',
        preamble
    )
    # Strip #show: whole-document rules (exam template sets A4 page, overriding our auto)
    out = []; pp = TP(preamble)
    while pp.i < len(pp.t):
        sm = re.match(r'#show\s*:', pp.rest)
        if sm:
            pp.i += sm.end(); pp.skip(' \t\n')
            fn = re.match(r'[a-zA-Z_][a-zA-Z0-9_.-]*', pp.rest)
            if fn: pp.i += fn.end()
            pp.skip(' \t')
            if pp.cur == '(': pp.rp()
            while pp.i < len(pp.t) and pp.cur != '\n': pp.i += 1
            continue
        out.append(pp.cur); pp.i += 1
    return ''.join(out)

def _compile_fig(fig_expr, typ_path, tmpdir, qnum):
    """Compile a Typst figure expression to PNG. Returns Path or None."""
    import uuid
    fig_id = f'_typ2docx_{qnum}_{uuid.uuid4().hex[:8]}'
    # Write alongside the original file so relative imports resolve correctly
    fig_typ = typ_path.parent / f'{fig_id}.typ'
    fig_png_tmpl = str(typ_path.parent / f'{fig_id}-{{p}}.png')
    try:
        src = typ_path.read_text(encoding='utf-8')
        preamble = _extract_preamble(src)
        fig_src = preamble + f'\n\n#{{{fig_expr}}}\n'
        fig_typ.write_text(fig_src, encoding='utf-8')
        font_args = []
        for fp in FONT_PATHS:
            if fp.exists(): font_args += ['--font-path', str(fp)]
        r = subprocess.run(
            [TYPST_BIN, 'compile', '--root', str(WORKSPACE)] + font_args +
            ['--format', 'png', '--ppi', '300', str(fig_typ), fig_png_tmpl],
            capture_output=True, text=True, cwd=str(WORKSPACE)
        )
        fig_out = typ_path.parent / f'{fig_id}-1.png'
        if r.returncode == 0 and fig_out.exists():
            dst = tmpdir / f'fig_{qnum}.png'
            if dst.exists(): return dst  # already compiled (reuse across modes)
            shutil.copy2(str(fig_out), str(dst))
            return dst
    except Exception:
        pass
    finally:
        # Clean up temp files from source directory
        for pat in [fig_typ] + list(typ_path.parent.glob(f'{fig_id}-*.png')):
            try: pat.unlink()
            except: pass
    return None

def _compile_opt_figs(opts_raw, typ_path, tmpdir, qnum):
    """Compile 4 figure options (cetz canvas / variable refs) as a 2×2 grid PNG."""
    import uuid
    fig_id = f'_typ2docx_opts_{qnum}_{uuid.uuid4().hex[:8]}'
    fig_typ = typ_path.parent / f'{fig_id}.typ'
    fig_png_tmpl = str(typ_path.parent / f'{fig_id}-{{p}}.png')
    try:
        src = typ_path.read_text(encoding='utf-8')
        preamble = _extract_preamble(src)
        labels = ('A', 'B', 'C', 'D')
        cells = []
        for i, opt in enumerate(opts_raw[:4]):
            content, _correct, is_raw = opt
            lbl = labels[i]
            if is_raw:
                inner = f'#({content})'
            else:
                inner = f'[{content}]'
            cells.append(
                f'  block(stroke: 0.7pt + luma(180), radius: 5pt,'
                f' inset: (x: 8pt, top: 6pt, bottom: 8pt))['
                f'*{lbl}.* #v(0.3em) #align(center){inner}],'
            )
        fig_src = (
            preamble + '\n\n'
            '#grid(columns: 2, column-gutter: 12pt, row-gutter: 8pt,\n'
            + '\n'.join(cells) + '\n)\n'
        )
        fig_typ.write_text(fig_src, encoding='utf-8')
        font_args = []
        for fp in FONT_PATHS:
            if fp.exists(): font_args += ['--font-path', str(fp)]
        r = subprocess.run(
            [TYPST_BIN, 'compile', '--root', str(WORKSPACE)] + font_args +
            ['--format', 'png', '--ppi', '300', str(fig_typ), fig_png_tmpl],
            capture_output=True, text=True, cwd=str(WORKSPACE)
        )
        fig_out = typ_path.parent / f'{fig_id}-1.png'
        if r.returncode == 0 and fig_out.exists():
            dst = tmpdir / f'fig_opts_{qnum}.png'
            if dst.exists(): return dst  # reuse
            shutil.copy2(str(fig_out), str(dst))
            return dst
    except Exception:
        pass
    finally:
        for pat in [fig_typ] + list(typ_path.parent.glob(f'{fig_id}-*.png')):
            try: pat.unlink()
            except: pass
    return None

def _tlen(s):
    """Estimate rendered text length: $...$ scaled at half source-length, min 4."""
    return len(re.sub(r'\$([^$]+)\$', lambda m: 'X' * max(4, len(m.group(1)) // 2), s))

def _clean_loigiai(text):
    """Strip #func directives but keep [content] text recursively. Preserves math."""
    out = []; p = TP(text)
    while p.i < len(p.t):
        if p.cur == '#':
            dm = re.match(r'#[a-zA-Z_][a-zA-Z0-9_.-]*', p.rest)
            if dm:
                p.i += dm.end(); p.skip(' \t')
                if p.cur == '(': p.rp(); p.skip(' \t')
                if p.cur == '[': out.append(_clean_loigiai(p.rb()))
                continue
        out.append(p.cur); p.i += 1
    return ''.join(out)

def _parse_call_meta(src, pattern):
    """Find pattern in src, parse named args as dict. Returns (match, meta_dict) or (None, {})."""
    m = re.search(pattern, src)
    if not m: return None, {}
    p = TP(src); p.i = src.index('(', m.start())
    args_str = p.rp()
    meta = {}; ap = TP(args_str.strip())
    while ap.i < len(ap.t):
        ap.skip()
        nm = re.match(r'([a-zA-Z_-][a-zA-Z0-9_-]*)\s*:', ap.rest)
        if nm:
            key = nm.group(1); ap.i += nm.end(); ap.skip()
            if ap.cur == '"':
                s = ap.i + 1; ap.read_str(); meta[key] = ap.t[s:ap.i-1]
            elif ap.cur == '[': meta[key] = _clean_stem(ap.rb()).strip()
            else: ap.skip_val()
        else: ap.i += 1
    return m, meta

def _extract_exam_header(src):
    """Extract thpt-school-exam / stexgv-doc metadata, return formatted Typst header block."""
    m, meta = _parse_call_meta(src, r'#show\s*:\s*thpt-school-exam\.with\s*\(')
    if m:
        lines = []
        dept  = meta.get('department', '').strip()
        sch   = meta.get('school', '').strip()
        title = meta.get('exam-title', '').strip()
        subj  = meta.get('subject', '').strip()
        dur   = meta.get('duration', '').strip()
        code  = meta.get('code', '').strip()
        yr    = meta.get('academic-year', '').strip()
        if dept: lines.append(f'*{dept}*\n\n')
        if sch:  lines.append(f'*{sch}*\n\n')
        if title: lines.append(f'= {title}\n\n')
        info = []
        if subj: info.append(f'Môn: *{subj}*')
        if dur:  info.append(f'Thời gian: {dur}')
        if code: info.append(f'Mã đề: *{code}*')
        if yr:   info.append(f'Năm học: {yr}')
        if info: lines.append(' \u00b7 '.join(info) + '\n\n')
        return ''.join(lines)
    m, meta = _parse_call_meta(src, r'#show\s*:\s*stexgv-doc\.with\s*\(')
    if m:
        lines = []
        title  = meta.get('title', '').strip()
        author = meta.get('author', '').strip()
        if title:  lines.append(f'= {title}\n\n')
        if author: lines.append(f'*{author}*\n\n')
        return ''.join(lines)
    return ''

def _format_tn_opts(txts):
    """Smart 2-column table or per-line layout for 4 multiple-choice options."""
    if len(txts) != 4:
        return [f'*{"ABCD"[j]}.* {t}\n\n' for j, t in enumerate(txts)]
    ml = max(_tlen(t) for t in txts)
    if ml <= 8:
        # Very short: 4 on one line
        return ['   '.join(f'*{"ABCD"[j]}.* {txts[j]}' for j in range(4)) + '\n\n']
    elif ml <= 50:
        # Medium: 2×2 table (Pandoc converts to DOCX table)
        return [
            '#table(columns: (1fr, 1fr), stroke: none, align: left,'
            ' inset: (x: 8pt, y: 5pt),\n'
            f'  [*A.* {txts[0]}], [*B.* {txts[1]}],\n'
            f'  [*C.* {txts[2]}], [*D.* {txts[3]}])\n\n'
        ]
    else:
        # Long: one per line
        return [f'*{"ABCD"[j]}.* {txts[j]}\n\n' for j in range(4)]

def preprocess(content, typ_path=None, tmpdir=None, include_solutions=False):
    """Extract questions + headings, keep Typst math intact, strip macros.
    Figures compiled in parallel; options laid out by measured text length.
    include_solutions=True: append lời giải after each question."""
    body = _extract_main_content(content)
    header = _extract_exam_header(content)  # use original src for show: directives
    out = [header]; p = TP(body); q = 0
    pending_figs = {}      # q_num -> (fig_expr, fig_width_pct)
    pending_opt_figs = {}  # q_num -> list of (content, correct, is_raw) for 4 options

    while p.i < len(p.t):
        # ── Skip // line comments ─────────────────────────────────────────────
        if p.cur == '/' and p.i + 1 < len(p.t) and p.t[p.i+1] == '/':
            while p.i < len(p.t) and p.cur != '\n': p.i += 1
            continue

        # ── Question macros ───────────────────────────────────────────────────
        m = re.match(r'#(tn|ds|tln|tl)\b\s*\(', p.rest)
        if m:
            qtype = m.group(1); p.i += m.end() - 1
            stem, opts, ans, fig, fig_width, loigiai = TP(p.rp()).parse_qargs(qtype)
            q += 1
            out.append(f'\n*Câu {q}.* {_clean_stem(stem).strip()}\n\n')
            if fig:
                try:    w_pct = float(fig_width.strip().rstrip('%'))
                except: w_pct = 55.0
                out.append(f'%%FIG_{q}%%\n\n')
                pending_figs[q] = (fig, w_pct)
            if qtype == 'tn' and opts:
                if any(is_raw for _, _, is_raw in opts[:4]):
                    # Options are figures (cetz canvas / variable refs) → compile 2×2 grid
                    out.append(f'%%OPTFIG_{q}%%\n\n')
                    pending_opt_figs[q] = opts[:4]
                else:
                    txts = [_clean_stem(t).strip() for t, _, _ in opts[:4]]
                    out.extend(_format_tn_opts(txts))
            elif qtype == 'ds' and opts:
                for j, (txt, cor, _) in enumerate(opts):
                    mark = ' *(Đúng)*' if cor else ' *(Sai)*'
                    out.append(f'*{"abcd"[j]})* {_clean_stem(txt).strip()}{mark}\n\n')
            if include_solutions and loigiai:
                cleaned_lg = _clean_loigiai(loigiai).strip()
                if cleaned_lg:
                    out.append(f'\n*Lời giải:* {cleaned_lg}\n\n')
            continue

        # ── exam-part → heading ───────────────────────────────────────────────
        ep = re.match(r'#exam-part\s*\(', p.rest)
        if ep:
            p.i += ep.end() - 1; args = p.rp()
            ap = TP(args); ap.skip()
            if ap.cur == '[':
                text = _clean_stem(ap.rb())
                text = re.sub(r'\s+', ' ', text).strip()
                title = re.split(r'\.', text)[0].strip()
                out.append(f'\n== {title}\n\n')
            continue

        # ── Typst headings ────────────────────────────────────────────────────
        hm = re.match(r'(=+)\s+([^\n]+)', p.rest)
        if p.cur == '=' and hm:
            lvl = len(hm.group(1)); title = hm.group(2).strip()
            out.append(f'\n{"="*lvl} {title}\n'); p.i += hm.end(); continue

        # ── Skip ALL other # directives ───────────────────────────────────────
        if p.cur == '#':
            dm = re.match(r'#[a-zA-Z_][a-zA-Z0-9_.-]*', p.rest)
            if dm:
                p.i += dm.end(); _skip_directive(p); continue

        # ── Keep everything else (math, text, newlines) ───────────────────────
        out.append(p.cur); p.i += 1

    result = ''.join(out)

    # ── Compile & embed figures + opt-figs (parallel) ──────────────────────
    all_tasks = (  # (kind, q_num, payload, w_pct)
        [('fig',  q, (expr, wpct), wpct)  for q, (expr, wpct) in pending_figs.items()] +
        [('opts', q, raw4, 92.0)          for q, raw4 in pending_opt_figs.items()]
    )
    if all_tasks and typ_path and tmpdir:
        from concurrent.futures import ThreadPoolExecutor
        def _do_task(task):
            kind, q_num, payload, w_pct = task
            if kind == 'fig':
                png = _compile_fig(payload[0], typ_path, tmpdir, q_num)
            else:
                png = _compile_opt_figs(payload, typ_path, tmpdir, q_num)
            return kind, q_num, png, w_pct
        with ThreadPoolExecutor(max_workers=min(4, len(all_tasks))) as ex:
            compiled = list(ex.map(_do_task, all_tasks))
        for kind, q_num, png, w_pct in compiled:
            if kind == 'fig':
                marker = f'%%FIG_{q_num}%%'
                img = (f'#align(center)[#image("{png.name}", width: {w_pct:.0f}%)]'
                       if png else '_[Xem hình vẽ]_')
            else:
                marker = f'%%OPTFIG_{q_num}%%'
                img = (f'#align(center)[#image("{png.name}", width: {w_pct:.0f}%)]'
                       if png else '_[4 phương án hình — xem bản PDF]_')
            result = result.replace(marker, img)
    # Clean up any unresolved markers (e.g. when typ_path/tmpdir not provided)
    result = re.sub(r'%%FIG_(\d+)%%',    r'_[Hình câu \1 — xem bản PDF]_', result)
    result = re.sub(r'%%OPTFIG_(\d+)%%', r'_[4 phương án hình câu \1 — xem bản PDF]_', result)

    return result

# ── Converters ────────────────────────────────────────────────────────────────
def _run_pandoc_to_docx(clean_text, out_stem, tmpdir):
    """Write clean_text to tmpdir/clean_{out_stem}.typ, run pandoc, return docx path.
    Uses cwd=tmpdir so relative image paths in #image() resolve correctly."""
    clean_name = f'clean_{out_stem}.typ'
    docx_name  = f'{out_stem}.docx'
    (tmpdir / clean_name).write_text(clean_text, encoding='utf-8')
    r = subprocess.run(
        [PANDOC_BIN, '--from', 'typst', '--to', 'docx',
         '-o', docx_name, clean_name],
        capture_output=True, text=True, cwd=str(tmpdir)
    )
    if r.returncode != 0:
        raise RuntimeError(r.stderr or r.stdout)
    return tmpdir / docx_name

def convert_smart(typ_path: Path, include_solutions=False):
    content  = typ_path.read_text(encoding='utf-8')
    tmpdir   = Path(tempfile.mkdtemp())
    clean    = preprocess(content, typ_path=typ_path, tmpdir=tmpdir,
                          include_solutions=include_solutions)
    suffix   = '_lg' if include_solutions else '_de'
    try:
        docx_out = _run_pandoc_to_docx(clean, f'{typ_path.stem}{suffix}', tmpdir)
    except RuntimeError:
        shutil.rmtree(tmpdir, ignore_errors=True); raise
    return docx_out, tmpdir, clean

def convert_quick(typ_path: Path):
    tmpdir = Path(tempfile.mkdtemp())
    pdf  = tmpdir / f'{typ_path.stem}.pdf'
    docx = tmpdir / f'{typ_path.stem}.docx'
    font_args = []
    for fp in FONT_PATHS:
        if fp.exists(): font_args += ['--font-path', str(fp)]
    r = subprocess.run(
        [TYPST_BIN, 'compile', '--root', str(WORKSPACE)] + font_args + [str(typ_path), str(pdf)],
        capture_output=True, text=True, cwd=str(WORKSPACE)
    )
    if r.returncode != 0:
        shutil.rmtree(tmpdir, ignore_errors=True)
        raise RuntimeError((r.stderr or r.stdout)[:3000])
    from pdf2docx import Converter
    cv = Converter(str(pdf)); cv.convert(str(docx), multi_processing=False); cv.close()
    if not docx.exists():
        shutil.rmtree(tmpdir, ignore_errors=True)
        raise RuntimeError('pdf2docx thất bại.')
    return docx, tmpdir, ''

def convert_zip(typ_path: Path):
    """Produce ZIP with 3 files: *_De.docx (OMML), *_LoiGiai.docx (OMML+solutions), *.pdf."""
    stem    = typ_path.stem
    content = typ_path.read_text(encoding='utf-8')
    tmpdir  = Path(tempfile.mkdtemp())
    errors  = []

    # 1. De.docx — questions only (no lời giải)
    clean_de = preprocess(content, typ_path=typ_path, tmpdir=tmpdir, include_solutions=False)
    try:
        _run_pandoc_to_docx(clean_de, f'{stem}_De', tmpdir)
    except RuntimeError as e:
        errors.append(f'De.docx: {e}')

    # 2. LoiGiai.docx — questions + lời giải (reuses compiled figures from step 1)
    clean_lg = preprocess(content, typ_path=typ_path, tmpdir=tmpdir, include_solutions=True)
    try:
        _run_pandoc_to_docx(clean_lg, f'{stem}_LoiGiai', tmpdir)
    except RuntimeError as e:
        errors.append(f'LoiGiai.docx: {e}')

    # 3. PDF from Typst (layout completă)
    pdf_out = tmpdir / f'{stem}.pdf'
    font_args = []
    for fp in FONT_PATHS:
        if fp.exists(): font_args += ['--font-path', str(fp)]
    subprocess.run(
        [TYPST_BIN, 'compile', '--root', str(WORKSPACE)] + font_args + [str(typ_path), str(pdf_out)],
        capture_output=True, text=True, cwd=str(WORKSPACE)
    )  # PDF failure is non-fatal; just won't be in ZIP

    # Package ZIP
    zip_path = tmpdir / f'{stem}_Export.zip'
    with zipfile.ZipFile(str(zip_path), 'w', zipfile.ZIP_DEFLATED) as zf:
        for fname in [f'{stem}_De.docx', f'{stem}_LoiGiai.docx', f'{stem}.pdf']:
            fp = tmpdir / fname
            if fp.exists(): zf.write(str(fp), fname)

    if not zip_path.exists() or zip_path.stat().st_size < 100:
        shutil.rmtree(tmpdir, ignore_errors=True)
        raise RuntimeError('Không tạo được file ZIP. ' + '; '.join(errors))

    return zip_path, tmpdir, clean_de  # return De clean for debug preview

# ── File listing ──────────────────────────────────────────────────────────────
def find_typ_files():
    skip_dirs = {"node_modules", ".git", "__pycache__"}
    skip_prefix = str(Path.home() / "Library/Caches")
    results = []
    for p in sorted(WORKSPACE.rglob("*.typ")):
        if any(d in p.parts for d in skip_dirs): continue
        if str(p).startswith(skip_prefix): continue
        results.append(p.relative_to(WORKSPACE))
    return results

# ── HTML ──────────────────────────────────────────────────────────────────────
HTML = """<!DOCTYPE html><html lang="vi"><head>
<meta charset="UTF-8"><title>Typst → DOCX / ZIP</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>
*{box-sizing:border-box;margin:0;padding:0}
body{font-family:system-ui,sans-serif;background:#f0f4f8;min-height:100vh;display:flex;align-items:flex-start;justify-content:center;padding:32px 16px}
.card{background:#fff;border-radius:16px;padding:32px;max-width:720px;width:100%;box-shadow:0 4px 24px rgba(0,0,0,.08)}
h1{font-size:1.35rem;color:#1a365d;margin-bottom:4px}
.sub{color:#718096;font-size:.85rem;margin-bottom:20px}
.search-wrap{position:relative;margin-bottom:10px}
.search-wrap input{width:100%;padding:9px 13px 9px 36px;border:1.5px solid #e2e8f0;border-radius:8px;font-size:.92rem;outline:none}
.search-wrap input:focus{border-color:#3182ce}
.si{position:absolute;left:11px;top:50%;transform:translateY(-50%);color:#a0aec0;pointer-events:none}
.list{max-height:340px;overflow-y:auto;border:1.5px solid #e2e8f0;border-radius:10px}
.item{display:flex;align-items:center;gap:9px;padding:10px 13px;cursor:pointer;border-bottom:1px solid #f7fafc;font-size:.85rem}
.item:last-child{border-bottom:none}.item:hover{background:#ebf8ff}.item.sel{background:#bee3f8;font-weight:600}
.dir{color:#a0aec0}.fname{color:#2d3748}
.modes{display:flex;gap:10px;margin-top:16px}
.mode-btn{flex:1;padding:11px 8px;border:2px solid #e2e8f0;border-radius:10px;background:#fff;cursor:pointer;text-align:center;transition:all .15s}
.mode-btn:hover{border-color:#90cdf4}.mode-btn.active{border-color:#3182ce;background:#ebf8ff}
.ml{font-weight:700;font-size:.88rem;color:#2d3748}.md{font-size:.73rem;color:#718096;margin-top:3px}
.badge{display:inline-block;padding:1px 7px;border-radius:20px;font-size:.68rem;font-weight:700;margin-bottom:4px}
.bs{background:#c6f6d5;color:#276749}.bq{background:#fed7d7;color:#9b2c2c}
.btn{width:100%;padding:13px;border:none;border-radius:10px;background:#3182ce;color:#fff;font-size:.95rem;font-weight:600;cursor:pointer;margin-top:14px}
.btn:hover{background:#2b6cb0}.btn:disabled{background:#90cdf4;cursor:not-allowed}
.st{margin-top:14px;padding:12px 16px;border-radius:8px;font-size:.87rem;display:none}
.st.load{background:#ebf8ff;color:#2b6cb0;display:flex;align-items:center;gap:10px}
.st.err{background:#fff5f5;color:#c53030;border:1px solid #fc8181;display:block;white-space:pre-wrap;word-break:break-all}
.st.ok{background:#f0fff4;color:#276749;border:1px solid #9ae6b4;display:block}
details{margin-top:12px;border:1.5px solid #e2e8f0;border-radius:8px;overflow:hidden}
details summary{padding:9px 13px;cursor:pointer;background:#f7fafc;font-size:.82rem;color:#4a5568;font-weight:600;user-select:none}
details pre{padding:13px;font-size:.76rem;max-height:280px;overflow:auto;white-space:pre-wrap;color:#2d3748;margin:0}
@keyframes spin{to{transform:rotate(360deg)}}
.sp{width:16px;height:16px;border:2.5px solid #bee3f8;border-top-color:#3182ce;border-radius:50%;animation:spin .7s linear infinite;flex-shrink:0}
.tabs{display:flex;gap:0;border:1.5px solid #e2e8f0;border-radius:10px;overflow:hidden;margin-bottom:14px}
.tab{flex:1;padding:9px 12px;background:#f7fafc;border:none;cursor:pointer;font-size:.85rem;font-weight:600;color:#718096;transition:all .15s;border-right:1px solid #e2e8f0}
.tab:last-child{border-right:none}.tab.active{background:#ebf8ff;color:#2b6cb0}
.tab-panel{display:none}.tab-panel.active{display:block}
.upload-area{border:2px dashed #bee3f8;border-radius:10px;padding:28px 20px;text-align:center;cursor:pointer;transition:all .15s;background:#f7fafc}
.upload-area:hover,.upload-area.drag{border-color:#3182ce;background:#ebf8ff}
.upload-area input[type=file]{display:none}
.upload-name{margin-top:10px;font-size:.85rem;color:#2d3748;font-weight:600}
</style></head><body>
<div class="card">
<h1>📄 Typst → DOCX <span style="font-size:.72rem;background:#c6f6d5;color:#276749;padding:2px 8px;border-radius:20px;font-weight:700;vertical-align:middle">OMML equations ✓</span></h1>
<p class="sub">Workspace: <code>{{ workspace }}</code></p>
<div class="tabs">
  <button class="tab active" onclick="switchTab('workspace')">📋 Workspace</button>
  <button class="tab" onclick="switchTab('upload')">📂 Upload file .typ</button>
</div>
<div class="tab-panel active" id="panel-workspace">
  <div class="search-wrap">
    <span class="si">🔍</span>
    <input type="text" id="q" placeholder="Tìm file .typ..." oninput="filter()">
  </div>
  <div class="list" id="list">
  {% for f in files %}
  <div class="item" data-path="{{ f }}" onclick="sel(this)">📝
    <span><span class="dir">{{ f.parent }}/</span><span class="fname">{{ f.name }}</span></span>
  </div>
  {% else %}<div style="padding:20px;text-align:center;color:#a0aec0">Không có file .typ</div>
  {% endfor %}
  </div>
</div>
<div class="tab-panel" id="panel-upload">
  <div class="upload-area" id="drop-zone" onclick="document.getElementById('file-input').click()"
    ondragover="event.preventDefault();this.classList.add('drag')"
    ondragleave="this.classList.remove('drag')"
    ondrop="handleDrop(event)">
    <div style="font-size:2rem">📁</div>
    <div style="margin-top:8px;font-weight:600;color:#4a5568">Kéo thả hoặc click để chọn file .typ</div>
    <div style="font-size:.78rem;color:#a0aec0;margin-top:4px">File cần dùng sang-exam.typ chuẩn</div>
    <input type="file" id="file-input" accept=".typ" onchange="handleFileSelect(this)">
  </div>
  <div class="upload-name" id="upload-name" style="display:none"></div>
</div>
<div class="modes">
  <div class="mode-btn active" id="m-smart" onclick="setMode('smart')">
    <div class="badge bs">KHUYẾN DÙNG</div>
    <div class="ml">⚡ Smart — OMML</div>
    <div class="md">Trích câu hỏi + toán → Word Equation chỉnh sửa được</div>
  </div>
  <div class="mode-btn" id="m-quick" onclick="setMode('quick')">
    <div class="badge bq">FALLBACK</div>
    <div class="ml">🖼 Quick — PDF raster</div>
    <div class="md">Layout đầy đủ + hình vẽ, toán là ảnh</div>
  </div>
</div>
<button class="btn" id="btn" disabled onclick="goZip()" style="background:#276749">📦 Tải ZIP (Đề + Lời giải + PDF)</button>
<button class="btn" id="btn-single" disabled onclick="go()" style="background:#3182ce;margin-top:8px;font-size:.82rem;padding:9px">⚡ Tải DOCX đơn (Smart/Quick)</button>
<button class="btn" id="btn-upload" style="display:none" disabled onclick="goUploadZip()" style="background:#276749">📦 Upload → ZIP (Đề + Lời giải + PDF)</button>
<div class="st" id="st"></div>
<details id="prev" style="display:none">
  <summary>Xem nội dung clean Typst gửi Pandoc</summary>
  <pre id="prev-txt"></pre>
</details>
</div>
<script>
let chosen=null,mode='smart',uploadedFile=null,currentTab='workspace';
const btn=document.getElementById('btn'),btnSingle=document.getElementById('btn-single'),btnUp=document.getElementById('btn-upload'),st=document.getElementById('st'),prev=document.getElementById('prev');
function switchTab(tab){
  currentTab=tab;
  document.querySelectorAll('.tab').forEach((t,i)=>t.classList.toggle('active',['workspace','upload'][i]===tab));
  document.getElementById('panel-workspace').classList.toggle('active',tab==='workspace');
  document.getElementById('panel-upload').classList.toggle('active',tab==='upload');
  btn.style.display=tab==='workspace'?'':'none';
  btnSingle.style.display=tab==='workspace'?'':'none';
  btnUp.style.display=tab==='upload'?'':'none';
  st.className='st';st.style.display='none';
}
function sel(el){document.querySelectorAll('.item').forEach(e=>e.classList.remove('sel'));el.classList.add('sel');chosen=el.dataset.path;btn.disabled=false;btnSingle.disabled=false;}
function filter(){const q=document.getElementById('q').value.toLowerCase();document.querySelectorAll('.item').forEach(e=>{e.style.display=e.dataset.path.toLowerCase().includes(q)?'':'none';});}
function setMode(m){mode=m;['smart','quick'].forEach(x=>document.getElementById('m-'+x).classList.toggle('active',x===m));}
function handleFileSelect(input){if(input.files[0])setUploadFile(input.files[0]);}
function handleDrop(e){e.preventDefault();document.getElementById('drop-zone').classList.remove('drag');const f=e.dataTransfer.files[0];if(f&&f.name.endsWith('.typ'))setUploadFile(f);}
function setUploadFile(f){
  uploadedFile=f;
  const nm=document.getElementById('upload-name');
  nm.textContent='📝 '+f.name+' ('+Math.round(f.size/1024)+'KB)';
  nm.style.display='block';
  btnUp.disabled=false;
}
async function _download(fetchPromise, name, successMsg){
  prev.style.display='none';
  st.className='st load';st.innerHTML='<div class="sp"></div>Đang xử lý...';
  try{
    const r=await fetchPromise;
    const ct=r.headers.get('content-type')||'';
    if(!r.ok||ct.includes('json')){
      const j=await r.json().catch(async()=>({error:await r.text()}));
      st.className='st err';st.textContent='❌ '+j.error;
      if(j.preview){document.getElementById('prev-txt').textContent=j.preview;prev.style.display='block';}
      return false;
    }
    const blob=await r.blob(),url=URL.createObjectURL(blob),a=document.createElement('a');
    a.href=url;a.download=name;a.click();URL.revokeObjectURL(url);
    st.className='st ok';st.textContent='✅ '+successMsg;
    return true;
  }catch(e){st.className='st err';st.textContent='❌ '+e.message;return false;}
}
async function goZip(){
  if(!chosen)return;
  btn.disabled=true;btnSingle.disabled=true;
  const stem=chosen.split('/').pop().replace('.typ','');
  await _download(
    fetch('/convert-zip',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({path:chosen})}),
    stem+'_Export.zip',
    'Đã tải '+stem+'_Export.zip — gồm De.docx (OMML) + LoiGiai.docx + PDF!'
  );
  btn.disabled=false;btnSingle.disabled=false;
}
async function go(){
  if(!chosen)return;
  btn.disabled=true;btnSingle.disabled=true;
  const ok=await _download(
    fetch('/convert',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({path:chosen,mode})}),
    chosen.split('/').pop().replace('.typ','.docx'),
    'Đã tải DOCX'+(mode==='smart'?' — OMML chỉnh sửa được':' — PDF raster')+'!'
  );
  btn.disabled=false;btnSingle.disabled=false;
  if(ok){
    fetch('/preview',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({path:chosen})})
      .then(r=>r.ok?r.json():null).then(j=>{if(j&&j.preview){document.getElementById('prev-txt').textContent=j.preview;prev.style.display='block';}});
  }
}
async function goUploadZip(){
  if(!uploadedFile)return;
  btnUp.disabled=true;
  const stem=uploadedFile.name.replace('.typ','');
  const fd=new FormData();fd.append('file',uploadedFile);
  await _download(
    fetch('/upload-convert-zip',{method:'POST',body:fd}),
    stem+'_Export.zip',
    'Đã tải '+stem+'_Export.zip — gồm De.docx + LoiGiai.docx + PDF!'
  );
  btnUp.disabled=false;
}
</script></body></html>
"""

# ── Routes ────────────────────────────────────────────────────────────────────
@app.route("/")
def index():
    return render_template_string(HTML, files=find_typ_files(), workspace=str(WORKSPACE))

@app.route("/preview", methods=["POST"])
def preview():
    data = request.get_json()
    rel  = (data or {}).get("path", "").strip()
    typ_path = (WORKSPACE / rel).resolve()
    try:
        typ_path.relative_to(WORKSPACE)
        clean = preprocess(typ_path.read_text(encoding='utf-8'))
        return jsonify({"preview": clean[:5000]})
    except Exception as e:
        return jsonify({"preview": str(e)}), 400

@app.route("/upload-convert", methods=["POST"])
def upload_convert_route():
    f = request.files.get("file")
    mode = request.form.get("mode", "smart")
    if not f or not f.filename.endswith(".typ"):
        return jsonify({"error": "Cần upload file .typ hợp lệ."}), 400
    # Save alongside workspace typst files so #import "../sang-exam.typ" resolves
    upload_dir = WORKSPACE / "typst" / "_upload_temp"
    upload_dir.mkdir(parents=True, exist_ok=True)
    import uuid
    safe_name = f"_up_{uuid.uuid4().hex[:12]}.typ"
    typ_path = upload_dir / safe_name
    try:
        f.save(str(typ_path))
        fn = convert_smart if mode == "smart" else convert_quick
        docx, tmpdir, _clean = fn(typ_path)
        import atexit
        atexit.register(lambda: shutil.rmtree(tmpdir, ignore_errors=True))
        stem = Path(f.filename).stem
        return send_file(str(docx), as_attachment=True,
            download_name=f"{stem}.docx",
            mimetype="application/vnd.openxmlformats-officedocument.wordprocessingml.document")
    except RuntimeError as e:
        try:
            clean = preprocess(typ_path.read_text(encoding='utf-8'))
        except Exception:
            clean = ''
        return jsonify({"error": str(e), "preview": clean[:3000]}), 500
    except Exception as e:
        return jsonify({"error": f"Lỗi: {e}"}), 500
    finally:
        try: typ_path.unlink()
        except: pass

@app.route("/convert", methods=["POST"])
def convert_route():
    data = request.get_json()
    rel  = (data or {}).get("path", "").strip()
    mode = (data or {}).get("mode", "smart")
    if not rel.endswith(".typ"):
        return jsonify({"error": "Đường dẫn không hợp lệ."}), 400
    typ_path = (WORKSPACE / rel).resolve()
    try:
        typ_path.relative_to(WORKSPACE)
    except ValueError:
        return jsonify({"error": "Không được truy cập ngoài workspace."}), 403
    if not typ_path.exists():
        return jsonify({"error": f"Không tìm thấy: {rel}"}), 404
    try:
        fn = convert_smart if mode == "smart" else convert_quick
        docx, tmpdir, clean = fn(typ_path)
        import atexit
        atexit.register(lambda: shutil.rmtree(tmpdir, ignore_errors=True))
        return send_file(str(docx), as_attachment=True,
            download_name=f"{typ_path.stem}.docx",
            mimetype="application/vnd.openxmlformats-officedocument.wordprocessingml.document")
    except RuntimeError as e:
        try:
            clean = preprocess(typ_path.read_text(encoding='utf-8'))
        except Exception:
            clean = ''
        return jsonify({"error": str(e), "preview": clean[:3000]}), 500
    except Exception as e:
        return jsonify({"error": f"Lỗi: {e}"}), 500

@app.route("/convert-zip", methods=["POST"])
def convert_zip_route():
    data = request.get_json()
    rel  = (data or {}).get("path", "").strip()
    if not rel.endswith(".typ"):
        return jsonify({"error": "Đường dẫn không hợp lệ."}), 400
    typ_path = (WORKSPACE / rel).resolve()
    try:
        typ_path.relative_to(WORKSPACE)
    except ValueError:
        return jsonify({"error": "Không được truy cập ngoài workspace."}), 403
    if not typ_path.exists():
        return jsonify({"error": f"Không tìm thấy: {rel}"}), 404
    try:
        zip_path, tmpdir, clean = convert_zip(typ_path)
        import atexit
        atexit.register(lambda: shutil.rmtree(tmpdir, ignore_errors=True))
        return send_file(str(zip_path), as_attachment=True,
            download_name=f"{typ_path.stem}_Export.zip",
            mimetype="application/zip")
    except RuntimeError as e:
        try:
            clean = preprocess(typ_path.read_text(encoding='utf-8'))
        except Exception:
            clean = ''
        return jsonify({"error": str(e), "preview": clean[:3000]}), 500
    except Exception as e:
        return jsonify({"error": f"Lỗi: {e}"}), 500

@app.route("/upload-convert-zip", methods=["POST"])
def upload_convert_zip_route():
    f = request.files.get("file")
    if not f or not f.filename.endswith(".typ"):
        return jsonify({"error": "Cần upload file .typ hợp lệ."}), 400
    upload_dir = WORKSPACE / "typst" / "_upload_temp"
    upload_dir.mkdir(parents=True, exist_ok=True)
    import uuid
    safe_name = f"_up_{uuid.uuid4().hex[:12]}.typ"
    typ_path = upload_dir / safe_name
    try:
        f.save(str(typ_path))
        zip_path, tmpdir, _clean = convert_zip(typ_path)
        import atexit
        atexit.register(lambda: shutil.rmtree(tmpdir, ignore_errors=True))
        stem = Path(f.filename).stem
        return send_file(str(zip_path), as_attachment=True,
            download_name=f"{stem}_Export.zip",
            mimetype="application/zip")
    except RuntimeError as e:
        try:
            clean = preprocess(typ_path.read_text(encoding='utf-8'))
        except Exception:
            clean = ''
        return jsonify({"error": str(e), "preview": clean[:3000]}), 500
    except Exception as e:
        return jsonify({"error": f"Lỗi: {e}"}), 500
    finally:
        try: typ_path.unlink()
        except: pass

if __name__ == "__main__":
    port = 5050
    print(f"\n  ✅ typ2docx SMART tại  http://localhost:{port}")
    print(f"  📁 Workspace: {WORKSPACE}\n")
    threading.Timer(1.2, lambda: webbrowser.open(f"http://localhost:{port}")).start()
    app.run(host="0.0.0.0", port=port, debug=False)

    port = 5050
    print(f"\n  ✅ typ2docx SMART tại  http://localhost:{port}")
    print(f"  📁 Workspace: {WORKSPACE}\n")
    threading.Timer(1.2, lambda: webbrowser.open(f"http://localhost:{port}")).start()
    app.run(host="0.0.0.0", port=port, debug=False)
