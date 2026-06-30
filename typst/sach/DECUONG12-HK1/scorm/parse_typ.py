#!/usr/bin/env python3
"""
parse_typ.py — Parser trích xuất câu hỏi từ file .typ
Hỗ trợ: #tn (trắc nghiệm 4 đáp án), #ds (đúng/sai), #tln (trả lời ngắn)
"""

import re
from dataclasses import dataclass


@dataclass
class Question:
    q_type: str        # "tn", "ds", "tln"
    number: int
    stem: str
    options: list      # list[str] — text các đáp án
    correct: list      # list[int] — index đúng (0-based)
    answer_short: str  # cho tln
    solution: str


def _balance(text: str, start: int, open_c: str, close_c: str) -> int:
    """Tìm vị trí close khớp với open tại start, bỏ qua nội dung $...$."""
    stack = []
    pairs = {'(': ')', '[': ']', '{': '}'}
    openers = pairs.keys()
    closers = pairs.values()
    in_math = False
    
    i = start
    while i < len(text):
        ch = text[i]
        if ch == '$':
            in_math = not in_math
            i += 1
            continue
        if in_math:
            i += 1
            continue
            
        if ch in openers:
            stack.append(ch)
        elif ch in closers:
            if not stack:
                return -1 
            top = stack[-1]
            if pairs.get(top) == ch:
                stack.pop()
                if not stack:
                    return i
        i += 1
    return -1


def _strip_block_macros(text: str) -> str:
    """
    Loại bỏ các macro block của Typst, giữ lại nội dung bên trong [...].
    """
    # Các macro đơn giản (không có block nội dung)
    text = re.sub(r'#resetstep\(\)', '', text)
    text = re.sub(r'#resetcau\(\)', '', text)
    text = re.sub(r'#reset-step\(\)', '', text)
    text = re.sub(r'#pagebreak\([^)]*\)', '', text)
    text = re.sub(r'#colbreak\([^)]*\)', '', text)
    text = re.sub(r'#linebreak\(\)', '', text)
    text = re.sub(r'#v\s*\([^)]*\)', '', text)
    text = re.sub(r'#h\s*\([^)]*\)', ' ', text)
    text = re.sub(r'//[^\n]*', '', text)  # Typst comments

    # Macro có argument + block: #name(...)[content] hoặc #name[content] → content
    block_macros = [
        'step', 'align', 'text', 'par', 'block', 'box',
        'grid', 'stack', 'pad', 'place', 'move', 'rotate',
        'scale', 'hide', 'strong', 'emph', 'figure',
    ]

    for _ in range(200):
        changed = False
        for macro in block_macros:
            idx_paren = text.find('#' + macro + '(')
            idx_bracket = text.find('#' + macro + '[')

            if idx_paren != -1 and (idx_bracket == -1 or idx_paren <= idx_bracket):
                # #macro(args)[content] hoặc #macro(args)
                paren_start = idx_paren + len(macro) + 1
                paren_end = _balance(text, paren_start, '(', ')')
                if paren_end == -1:
                    text = text[:idx_paren] + text[idx_paren + len('#' + macro):]
                    changed = True
                    continue
                # Kiểm tra có [content] sau không
                after = text[paren_end + 1:]
                stripped = after.lstrip()
                offset = len(after) - len(stripped)
                if stripped.startswith('['):
                    brk_start = paren_end + 1 + offset
                    brk_end = _balance(text, brk_start, '[', ']')
                    if brk_end != -1:
                        inner = text[brk_start + 1:brk_end]
                        text = text[:idx_paren] + inner + text[brk_end + 1:]
                        changed = True
                        continue
                text = text[:idx_paren] + text[paren_end + 1:]
                changed = True

            elif idx_bracket != -1:
                # #macro[content]
                brk_start = idx_bracket + len(macro) + 1
                brk_end = _balance(text, brk_start, '[', ']')
                if brk_end != -1:
                    inner = text[brk_start + 1:brk_end]
                    text = text[:idx_bracket] + inner + text[brk_end + 1:]
                    changed = True
                else:
                    text = text[:idx_bracket] + text[idx_bracket + len('#' + macro + '['):]
                    changed = True

        if not changed:
            break

    return text


def _clean(text: str) -> str:
    """Chuyển Typst macros sang text thuần / KaTeX-friendly."""
    text = _strip_block_macros(text)
    text = re.sub(r'\n{3,}', '\n\n', text)
    text = re.sub(r'  +', ' ', text)
    text = text.strip()
    while text.endswith(']'):
        text = text[:-1].strip()
    return text.strip()


def _get_loigiai(body: str) -> str:
    m = re.search(r'loigiai\s*:\s*\[', body)
    if not m:
        return ''
    start = m.end() - 1
    end = _balance(body, start, '[', ']')
    if end < 0:
        return ''
    raw = body[start+1:end].strip()
    return _clean(raw)


def _parse_options(paren_body: str) -> tuple:
    """Parse nội dung (...) của options, trả về (options, correct_indices)."""
    options, correct = [], []
    idx = 0
    pos = 0
    text = paren_body.strip()

    while pos < len(text):
        while pos < len(text) and text[pos] in ' \t\n\r,':
            pos += 1
        if pos >= len(text):
            break

        if text[pos:pos+5] == 'True(':
            paren_s = pos + 4
            paren_e = _balance(text, paren_s, '(', ')')
            inner = text[paren_s+1:paren_e].strip()
            if inner.startswith('['):
                brk_e = _balance(inner, 0, '[', ']')
                opt = inner[1:brk_e].strip()
            else:
                opt = inner
            options.append(opt)
            correct.append(idx)
            idx += 1
            pos = paren_e + 1
        elif text[pos] == '[':
            brk_e = _balance(text, pos, '[', ']')
            opt = text[pos+1:brk_e].strip()
            options.append(opt)
            idx += 1
            pos = brk_e + 1
        else:
            pos += 1

    return options, correct


def _extract_stem_and_opts(body: str, q_type: str):
    """Trích stem, options, correct, answer_short từ body của block."""
    stem = ''
    options, correct = [], []
    answer_short = ''

    first_bracket = -1
    i = 0
    while i < len(body):
        if body[i] == '[':
            line_before = body[max(0, i-40):i]
            if re.search(r'\b(dir|lines|loigiai|w1|w2):\s*$', line_before):
                e = _balance(body, i, '[', ']')
                i = e + 1 if e > 0 else i + 1
                continue
            first_bracket = i
            break
        elif body[i] == '$':
            j = body.index('$', i+1) if '$' in body[i+1:] else len(body)
            i = j + 1
            continue
        i += 1

    if first_bracket >= 0:
        stem_end = _balance(body, first_bracket, '[', ']')
        stem = body[first_bracket+1:stem_end].strip()

        if q_type in ('tn', 'ds'):
            rest = body[stem_end+1:]
            paren_m = re.search(r',\s*\(', rest)
            if paren_m:
                ps = paren_m.end() - 1
                pe = _balance(rest, ps, '(', ')')
                if pe > 0:
                    options, correct = _parse_options(rest[ps+1:pe])

        elif q_type == 'tln':
            rest = body[stem_end+1:]
            j = 0
            while j < len(rest):
                if rest[j] == '[':
                    lb = rest[max(0, j-30):j]
                    if not re.search(r'\b(loigiai)\s*:\s*$', lb):
                        ae = _balance(rest, j, '[', ']')
                        answer_short = rest[j+1:ae].strip()
                        break
                    else:
                        e = _balance(rest, j, '[', ']')
                        j = e + 1 if e > 0 else j + 1
                        continue
                j += 1

    return stem, options, correct, answer_short


def parse_file(filepath: str) -> list:
    text = open(filepath, encoding='utf-8').read()
    questions = []
    cau_num = 0

    pattern = re.compile(r'#(tn|ds|tln)\s*\(')
    for m in pattern.finditer(text):
        q_type = m.group(1)
        body_start = m.end() - 1
        body_end = _balance(text, body_start, '(', ')')
        if body_end < 0:
            continue
        body = text[body_start+1:body_end]
        cau_num += 1

        stem, options, correct, answer_short = _extract_stem_and_opts(body, q_type)
        solution = _get_loigiai(body)

        if stem:
            questions.append(Question(
                q_type=q_type,
                number=cau_num,
                stem=stem,
                options=options,
                correct=correct,
                answer_short=answer_short,
                solution=solution,
            ))

    return questions


if __name__ == '__main__':
    import sys
    if len(sys.argv) < 2:
        print("Usage: python3 parse_typ.py <file.typ>")
        sys.exit(1)
    qs = parse_file(sys.argv[1])
    print(f"Tổng: {len(qs)} câu\n")
    for q in qs:
        print(f"[{q.q_type.upper()}] Câu {q.number}: {q.stem[:70].replace(chr(10),' ')}...")
        if q.options:
            for j, o in enumerate(q.options):
                mark = '✓' if j in q.correct else ' '
                print(f"  [{mark}] {chr(65+j)}. {o[:60]}")
        if q.answer_short:
            print(f"  → Đáp án: {q.answer_short}")
        print()
