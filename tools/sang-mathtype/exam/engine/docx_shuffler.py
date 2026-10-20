# ==============================================================================
# DOCX SHUFFLER - PYTHON SCRIPT (PHIÊN BẢN HOÀN CHỈNH 100%)
# ==============================================================================

import io, zipfile, random, re, json
from copy import deepcopy
import xml.etree.ElementTree as ET
from xml.etree.ElementTree import Element, SubElement
import micropip

# --- 1. CORE UTILITIES & CONSTANTS ---
ns = {
    'w': 'http://schemas.openxmlformats.org/wordprocessingml/2006/main',
    'r': 'http://schemas.openxmlformats.org/officeDocument/2006/relationships'
}
rels_ns = {'rel': 'http://schemas.openxmlformats.org/package/2006/relationships'}
types_ns = {'ct': 'http://schemas.openxmlformats.org/package/2006/content-types'}

PALETTES = {
    'mac_dinh': dict(title='0000FF', qnum='800080', label='0000FF', hl='2E86C1', hr='6C3483', frame='7D3C98'),
    'xanh':     dict(title='1F4E79', qnum='1F4E79', label='2E75B6', hl='1F4E79', hr='2E75B6', frame='2E75B6'),
    'den':      dict(title='000000', qnum='000000', label='000000', hl='000000', hr='000000', frame='000000'),
    'do':       dict(title='C00000', qnum='C00000', label='1F3864', hl='1F3864', hr='C00000', frame='C00000'),
    'xanh_la':  dict(title='1E8449', qnum='145A32', label='1E8449', hl='145A32', hr='1E8449', frame='1E8449'),
}
STYLE = {}

def _hex(v, default):
    v = str(v or '').strip().lstrip('#').upper()
    return v if re.fullmatch(r'[0-9A-F]{6}', v) else default

def _num(v, default, lo=None, hi=None):
    try: x = float(v)
    except (TypeError, ValueError): return default
    if lo is not None: x = max(lo, x)
    if hi is not None: x = min(hi, x)
    return x

def _flag(v, default):
    if v is None or v == '': return default
    if isinstance(v, str): return v.strip().lower() in ('1', 'true', 'yes', 'on')
    return bool(v)

def configure_style(o):
    """Đọc các tùy chọn làm đẹp từ giao diện; mọi khóa đều có mặc định nên đề cũ vẫn chạy."""
    pal = dict(PALETTES.get(o.get('palette') or 'mac_dinh', PALETTES['mac_dinh']))
    for key, opt in (('title', 'title_color'), ('qnum', 'qnum_color'), ('label', 'label_color'), ('frame', 'frame_color')):
        if o.get(opt): pal[key] = _hex(o.get(opt), pal[key])
    size = int(_num(o.get('font_size'), 12, 9, 16) * 2)
    margin_lr = _num(o.get('margin_lr_cm'), 1.75, 0.8, 4)
    margin_tb = _num(o.get('margin_tb_cm'), 1.5, 0.8, 4)
    cols = 2 if str(o.get('columns', '1')) == '2' else 1
    page_w = 11906
    printable = int(page_w - margin_lr * 2 * 567)
    STYLE.clear()
    STYLE.update(
        pal, font=(o.get('font_name') or 'Times New Roman'), size=size, title_size=size + 4, head_size=max(16, size - 4),
        line=int(_num(o.get('line_spacing'), 1.0, 1.0, 1.6) * 240),
        gap=int({'sat': 0, 'vua': 120, 'rong': 240}.get(o.get('question_gap') or 'vua', 120)),
        margin_lr=int(margin_lr * 567), margin_tb=int(margin_tb * 567), cols=cols,
        printable=(printable - 400) // cols,           # trừ phần lề trong của khung câu hỏi
        choices_layout=o.get('choices_layout') or 'auto',
        frame_style=o.get('frame_style') or 'none', tf_style=o.get('tf_style') or 'list',
        sa_lines=int(_num(o.get('sa_lines'), 0, 0, 12)), tl_lines=int(_num(o.get('tl_lines'), 0, 0, 40)),
        sa_answer_line=_flag(o.get('sa_answer_line'), False),
        show_titles=_flag(o.get('show_titles'), True), title_line=_flag(o.get('title_line'), True),
        title_align=o.get('title_align') or 'center', hints=_flag(o.get('section_hints'), True),
        bold_choices=_flag(o.get('bold_labels'), True),
        de_chinh_thuc=o.get('de_chinh_thuc_text', 'ĐỀ CHÍNH THỨC'), show_student=_flag(o.get('show_student'), True),
        show_ender=_flag(o.get('show_ender'), True), ender_note=o.get('ender_note', 'Thí Sinh Không Được Sử Dụng Tài Liệu - Cán Bộ Coi Thi Không Giải Thích Gì Thêm.'),
        show_footer=_flag(o.get('show_footer'), True), header_box=_flag(o.get('header_box'), False),
        variant=o.get('variant') or 'de',
    )

def set_run_font_properties(run, font_name=None, font_size=None, bold=False, italic=False, color=None):
    font_name = font_name or STYLE.get('font', 'Times New Roman'); font_size = font_size or STYLE.get('size', 24)
    rPr = run.find('w:rPr', namespaces=ns) or SubElement(run, f'{{{ns["w"]}}}rPr')
    rFonts = rPr.find('w:rFonts', namespaces=ns) or SubElement(rPr, f'{{{ns["w"]}}}rFonts')
    rFonts.set(f'{{{ns["w"]}}}ascii', font_name); rFonts.set(f'{{{ns["w"]}}}hAnsi', font_name)
    sz = rPr.find('w:sz', namespaces=ns) or SubElement(rPr, f'{{{ns["w"]}}}sz')
    sz.set(f'{{{ns["w"]}}}val', str(font_size))
    if bold: SubElement(rPr, f'{{{ns["w"]}}}b')
    if italic: SubElement(rPr, f'{{{ns["w"]}}}i')
    if color: SubElement(rPr, f'{{{ns["w"]}}}color').set(f'{{{ns["w"]}}}val', color)

def set_global_font_style(body_element, font_name=None, font_size=None):
    font_name = font_name or STYLE.get('font', 'Times New Roman'); font_size = font_size or STYLE.get('size', 24)
    for run in body_element.findall('.//w:r', ns):
        rPr = run.find('w:rPr', namespaces=ns) or SubElement(run, f'{{{ns["w"]}}}rPr')
        old_fonts = rPr.find('w:rFonts', namespaces=ns)
        if old_fonts is not None: rPr.remove(old_fonts)
        old_sz = rPr.find('w:sz', namespaces=ns)
        if old_sz is not None: rPr.remove(old_sz)
        old_rstyle = rPr.find('w:rStyle', namespaces=ns)
        if old_rstyle is not None: rPr.remove(old_rstyle)
        
        new_fonts = SubElement(rPr, f'{{{ns["w"]}}}rFonts')
        new_fonts.set(f'{{{ns["w"]}}}ascii', font_name); new_fonts.set(f'{{{ns["w"]}}}hAnsi', font_name); new_fonts.set(f'{{{ns["w"]}}}eastAsia', font_name)
        SubElement(rPr, f'{{{ns["w"]}}}sz').set(f'{{{ns["w"]}}}val', str(font_size))

def normalize_paragraph_spacing(body_element, after="0", before="0", line=None, line_rule="auto"):
    line = line or STYLE.get('line', 240)
    for p in body_element.findall('.//w:p', ns):
        pPr = p.find('w:pPr', ns) or SubElement(p, f'{{{ns["w"]}}}pPr')
        spacing = pPr.find('w:spacing', ns) or SubElement(pPr, f'{{{ns["w"]}}}spacing')
        spacing.set(f'{{{ns["w"]}}}after', str(after)); spacing.set(f'{{{ns["w"]}}}before', str(before))
        spacing.set(f'{{{ns["w"]}}}line', str(line)); spacing.set(f'{{{ns["w"]}}}lineRule', line_rule)
        snap_to_grid = pPr.find('w:snapToGrid', ns)
        if snap_to_grid is not None: pPr.remove(snap_to_grid)

def add_spacing_after_paragraph(p, space_after="120"): # 120 twips = 6pt
    pPr = p.find('w:pPr', ns) or SubElement(p, f'{{{ns["w"]}}}pPr')
    spacing = pPr.find('w:spacing', ns) or SubElement(pPr, f'{{{ns["w"]}}}spacing')
    spacing.set(f'{{{ns["w"]}}}after', str(space_after))

# --- 2. DOCUMENT STRUCTURE GENERATION ---
# --- THAY THẾ TOÀN BỘ HÀM NÀY ---

def add_document_header(body, h_info, n1, n2, n3, n4):
    left_color = STYLE.get('hl', "2E86C1"); right_color = STYLE.get('hr', "6C3483")
    tbl = Element(f'{{{ns["w"]}}}tbl'); tblPr = SubElement(tbl, f'{{{ns["w"]}}}tblPr')
    tblW = SubElement(tblPr, f'{{{ns["w"]}}}tblW'); tblW.set(f'{{{ns["w"]}}}type', 'pct'); tblW.set(f'{{{ns["w"]}}}w', '5300')
    SubElement(tblPr, f'{{{ns["w"]}}}jc').set(f'{{{ns["w"]}}}val', 'center')
    tr = SubElement(tbl, f'{{{ns["w"]}}}tr')
    
    parts = [f"{n} {t}" for n, t in [(n1, "TN"), (n2, "ĐS"), (n3, "TL Ngắn"), (n4, "Tự Luận")] if n > 0]
    question_counts_str = f"(Đề có {', '.join(parts)})" if parts else "(Đề không có câu hỏi)"
    
    left_headers = [t for t in (h_info.get("so_giao_duc", "").upper(), h_info.get("truong", "").upper(), STYLE.get('de_chinh_thuc', 'ĐỀ CHÍNH THỨC')) if t]
    right_headers = [t for t in (h_info.get("ten_ky_thi", ""), f"Môn thi: {h_info.get('mon_thi', '')}" if h_info.get('mon_thi') else '', f"Thời gian: {h_info.get('thoi_gian', '')}" if h_info.get('thoi_gian') else '', question_counts_str) if t]
    if STYLE.get('header_box'):
        tblB = SubElement(tblPr, f'{{{ns["w"]}}}tblBorders')
        for b in ['top', 'left', 'bottom', 'right', 'insideV']:
            SubElement(tblB, f'{{{ns["w"]}}}{b}', {f'{{{ns["w"]}}}val': 'single', f'{{{ns["w"]}}}sz': '6', f'{{{ns["w"]}}}color': STYLE.get('frame', '000000')})
    
    for headers, color in [(left_headers, left_color), (right_headers, right_color)]:
        tc = SubElement(tr, f'{{{ns["w"]}}}tc')
        for text in headers:
            p = SubElement(tc, f'{{{ns["w"]}}}p'); pPr = SubElement(p, f'{{{ns["w"]}}}pPr')
            SubElement(pPr, f'{{{ns["w"]}}}jc').set(f'{{{ns["w"]}}}val', 'center')
            SubElement(pPr, f'{{{ns["w"]}}}spacing', {f'{{{ns["w"]}}}after': '0'})
            r = SubElement(p, f'{{{ns["w"]}}}r'); set_run_font_properties(r, bold=True, color=color, font_size=STYLE.get('head_size', 20)); SubElement(r, f'{{{ns["w"]}}}t').text = text
    body.append(tbl)
    body.append(Element(f'{{{ns["w"]}}}p'))
    if STYLE.get('variant') == 'dap_an':
        pb = Element(f'{{{ns["w"]}}}p'); SubElement(SubElement(pb, f'{{{ns["w"]}}}pPr'), f'{{{ns["w"]}}}jc').set(f'{{{ns["w"]}}}val', 'center')
        rb = SubElement(pb, f'{{{ns["w"]}}}r'); set_run_font_properties(rb, bold=True, color='C00000', font_size=STYLE.get('title_size', 28))
        SubElement(rb, f'{{{ns["w"]}}}t').text = f"ĐÁP ÁN VÀ LỜI GIẢI - MÃ ĐỀ {h_info.get('ma_de', '')}"
        body.append(pb)
    if not STYLE.get('show_student', True): return
    
    # Tạo bảng thứ hai như bình thường
    tbl2 = Element(f'{{{ns["w"]}}}tbl'); tblPr2 = SubElement(tbl2, f'{{{ns["w"]}}}tblPr')
    tblW2 = SubElement(tblPr2, f'{{{ns["w"]}}}tblW'); tblW2.set(f'{{{ns["w"]}}}type', 'pct'); tblW2.set(f'{{{ns["w"]}}}w', '5300')
    SubElement(tblPr2, f'{{{ns["w"]}}}jc').set(f'{{{ns["w"]}}}val', 'center')
    
    tr2 = SubElement(tbl2, f'{{{ns["w"]}}}tr')
    student_info = [("Họ tên học sinh: .....................................", "left"), (f"Số báo danh: ............................ Mã đề: {h_info.get('ma_de') or '........'}", "right")]
    for info_text, align in student_info:
        tc = SubElement(tr2, f'{{{ns["w"]}}}tc')
        p = SubElement(tc, f'{{{ns["w"]}}}p'); pPr = SubElement(p, f'{{{ns["w"]}}}pPr')
        SubElement(pPr, f'{{{ns["w"]}}}spacing', {f'{{{ns["w"]}}}after': '60'}); SubElement(pPr, f'{{{ns["w"]}}}jc').set(f'{{{ns["w"]}}}val', align)
        r = SubElement(p, f'{{{ns["w"]}}}r'); set_run_font_properties(r, bold=True, font_size=STYLE.get('head_size', 20)); SubElement(r, f'{{{ns["w"]}}}t').text = info_text
    body.append(tbl2); body.append(Element(f'{{{ns["w"]}}}p'))
def add_document_headerGGG(body, h_info, n1, n2, n3, n4):
    left_color = "2E86C1"; right_color = "6C3483"
    tbl = Element(f'{{{ns["w"]}}}tbl'); tblPr = SubElement(tbl, f'{{{ns["w"]}}}tblPr')
    tblW = SubElement(tblPr, f'{{{ns["w"]}}}tblW'); tblW.set(f'{{{ns["w"]}}}type', 'pct'); tblW.set(f'{{{ns["w"]}}}w', '5300')
    SubElement(tblPr, f'{{{ns["w"]}}}jc').set(f'{{{ns["w"]}}}val', 'center')
    tr = SubElement(tbl, f'{{{ns["w"]}}}tr')
    
    parts = [f"{n} {t}" for n, t in [(n1, "TN"), (n2, "ĐS"), (n3, "TL Ngắn"), (n4, "Tự Luận")] if n > 0]
    question_counts_str = f"(Đề có {', '.join(parts)})" if parts else "(Đề không có câu hỏi)"
    
    left_headers = [h_info.get("so_giao_duc", "").upper(), h_info.get("truong", "").upper(), "ĐỀ CHÍNH THỨC"]
    right_headers = [h_info.get("ten_ky_thi", ""), f"Môn thi: {h_info.get('mon_thi', '')}", f"Thời gian: {h_info.get('thoi_gian', '')}", question_counts_str]
    
    for headers, color in [(left_headers, left_color), (right_headers, right_color)]:
        tc = SubElement(tr, f'{{{ns["w"]}}}tc')
        for text in headers:
            p = SubElement(tc, f'{{{ns["w"]}}}p'); pPr = SubElement(p, f'{{{ns["w"]}}}pPr')
            SubElement(pPr, f'{{{ns["w"]}}}jc').set(f'{{{ns["w"]}}}val', 'center')
            SubElement(pPr, f'{{{ns["w"]}}}spacing', {f'{{{ns["w"]}}}after': '0'})
            r = SubElement(p, f'{{{ns["w"]}}}r'); set_run_font_properties(r, bold=True, color=color, font_size=20); SubElement(r, f'{{{ns["w"]}}}t').text = text
    body.append(tbl); body.append(Element(f'{{{ns["w"]}}}p'))

    tbl2 = Element(f'{{{ns["w"]}}}tbl'); tblPr2 = SubElement(tbl2, f'{{{ns["w"]}}}tblPr')
    tblW2 = SubElement(tblPr2, f'{{{ns["w"]}}}tblW'); tblW2.set(f'{{{ns["w"]}}}type', 'pct'); tblW2.set(f'{{{ns["w"]}}}w', '5300')
    SubElement(tblPr2, f'{{{ns["w"]}}}jc').set(f'{{{ns["w"]}}}val', 'center')
    tr2 = SubElement(tbl2, f'{{{ns["w"]}}}tr')
    student_info = [("Họ tên học sinh: .....................................", "left"), (f"Số báo danh: ............................ Mã đề: {h_info.get('ma_de') or '........'}", "right")]
    for info_text, align in student_info:
        tc = SubElement(tr2, f'{{{ns["w"]}}}tc')
        p = SubElement(tc, f'{{{ns["w"]}}}p'); pPr = SubElement(p, f'{{{ns["w"]}}}pPr')
        SubElement(pPr, f'{{{ns["w"]}}}spacing', {f'{{{ns["w"]}}}after': '60'}); SubElement(pPr, f'{{{ns["w"]}}}jc').set(f'{{{ns["w"]}}}val', align)
        r = SubElement(p, f'{{{ns["w"]}}}r'); set_run_font_properties(r, bold=True, font_size=20); SubElement(r, f'{{{ns["w"]}}}t').text = info_text
    body.append(tbl2); body.append(Element(f'{{{ns["w"]}}}p'))

def create_footer_xml(ma_de):
    footer = Element(f'{{{ns["w"]}}}ftr'); p = SubElement(footer, f'{{{ns["w"]}}}p'); pPr = SubElement(p, f'{{{ns["w"]}}}pPr')
    SubElement(pPr, f'{{{ns["w"]}}}jc', {f'{{{ns["w"]}}}val': 'right'})

    def add_run(text):
        r = SubElement(p, f'{{{ns["w"]}}}r'); set_run_font_properties(r, bold=True, font_size=18)
        t = SubElement(r, f'{{{ns["w"]}}}t'); t.text = text; t.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')

    def add_field(instr_text, result_text):
        r_begin = SubElement(p, f'{{{ns["w"]}}}r'); set_run_font_properties(r_begin, bold=True, font_size=18)
        SubElement(r_begin, f'{{{ns["w"]}}}fldChar', {f'{{{ns["w"]}}}fldCharType': 'begin'})
        r_instr = SubElement(p, f'{{{ns["w"]}}}r'); set_run_font_properties(r_instr, bold=True, font_size=18)
        instr = SubElement(r_instr, f'{{{ns["w"]}}}instrText'); instr.text = instr_text; instr.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')
        r_sep = SubElement(p, f'{{{ns["w"]}}}r'); set_run_font_properties(r_sep, bold=True, font_size=18)
        SubElement(r_sep, f'{{{ns["w"]}}}fldChar', {f'{{{ns["w"]}}}fldCharType': 'separate'})
        r_res = SubElement(p, f'{{{ns["w"]}}}r'); set_run_font_properties(r_res, bold=True, font_size=18)
        SubElement(r_res, f'{{{ns["w"]}}}t').text = result_text
        r_end = SubElement(p, f'{{{ns["w"]}}}r'); set_run_font_properties(r_end, bold=True, font_size=18)
        SubElement(r_end, f'{{{ns["w"]}}}fldChar', {f'{{{ns["w"]}}}fldCharType': 'end'})
    
    add_run("Trang "); add_field("PAGE", "1"); add_run(" / "); add_field("NUMPAGES", "1"); add_run((f" - Mã đề: {ma_de}" if ma_de else ""))
    return ET.tostring(footer, encoding='UTF-8', xml_declaration=True)

def add_section_title(body, title_text, hint=None):
    if not STYLE.get('show_titles', True): return
    p = Element(f'{{{ns["w"]}}}p'); pPr = SubElement(p, f'{{{ns["w"]}}}pPr')
    SubElement(pPr, f'{{{ns["w"]}}}keepNext')
    if STYLE.get('title_line', True):
        pb = SubElement(pPr, f'{{{ns["w"]}}}pBdr')
        SubElement(pb, f'{{{ns["w"]}}}bottom', {f'{{{ns["w"]}}}val': 'single', f'{{{ns["w"]}}}sz': '8', f'{{{ns["w"]}}}space': '1', f'{{{ns["w"]}}}color': STYLE.get('title', '0000FF')})
    SubElement(pPr, f'{{{ns["w"]}}}spacing', {f'{{{ns["w"]}}}before': '120', f'{{{ns["w"]}}}after': '60'})
    SubElement(pPr, f'{{{ns["w"]}}}jc').set(f'{{{ns["w"]}}}val', STYLE.get('title_align', 'center') if STYLE.get('title_align') in ('left', 'center') else 'center')
    r = SubElement(p, f'{{{ns["w"]}}}r'); set_run_font_properties(r, bold=True, color=STYLE.get('title', '0000FF'), font_size=STYLE.get('title_size', 28))
    SubElement(r, f'{{{ns["w"]}}}t').text = title_text; body.append(p)
    if hint and STYLE.get('hints', True):
        h = Element(f'{{{ns["w"]}}}p'); hp = SubElement(h, f'{{{ns["w"]}}}pPr')
        SubElement(hp, f'{{{ns["w"]}}}keepNext'); SubElement(hp, f'{{{ns["w"]}}}spacing', {f'{{{ns["w"]}}}after': '60'})
        hr = SubElement(h, f'{{{ns["w"]}}}r'); set_run_font_properties(hr, italic=True, font_size=max(18, STYLE.get('size', 24) - 2))
        SubElement(hr, f'{{{ns["w"]}}}t').text = hint; body.append(h)

def add_exam_ender(body):
    if not STYLE.get('show_ender', True): return
    body.append(Element(f'{{{ns["w"]}}}p'))
    p1 = Element(f'{{{ns["w"]}}}p'); pPr1 = SubElement(p1, f'{{{ns["w"]}}}pPr')
    SubElement(pPr1, f'{{{ns["w"]}}}jc').set(f'{{{ns["w"]}}}val', 'center')
    r1 = SubElement(p1, f'{{{ns["w"]}}}r'); set_run_font_properties(r1, bold=True, italic=True)
    SubElement(r1, f'{{{ns["w"]}}}t').text = '---Hết---'
    body.append(p1)
    note = STYLE.get('ender_note', '')
    if note:
        p2 = Element(f'{{{ns["w"]}}}p'); pPr2 = SubElement(p2, f'{{{ns["w"]}}}pPr')
        SubElement(pPr2, f'{{{ns["w"]}}}jc').set(f'{{{ns["w"]}}}val', 'center')
        r2 = SubElement(p2, f'{{{ns["w"]}}}r'); set_run_font_properties(r2, bold=True)
        t2 = SubElement(r2, f'{{{ns["w"]}}}t'); t2.text = note
        t2.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')
        body.append(p2)

W = lambda tag: f'{{{ns["w"]}}}{tag}'
def _text(p): return ''.join(p.itertext()).strip()

# --- CHUẨN HOÁ ĐỀ NGUỒN (làm đẹp) ---
# Đề thực tế rất đa dạng: "Câu 1)", phương án "A)" hoặc "(A)", cả 4 phương án nằm chung một dòng ngăn bằng Tab, đáp án đánh dấu bằng màu đỏ...
# Đưa hết về dạng chuẩn một lần trước khi phân loại, để trộn/làm đẹp/đọc đáp án đều dùng chung kết quả.
_LABEL_AT = {
    'ABCD': re.compile(r'(?:(?<=^)|(?<=[\s\t ]))\(?([A-D])[.):]\s*'),
    'abcd': re.compile(r'(?:(?<=^)|(?<=[\s\t ]))\(?([a-d])[.):]\s*'),
}

def _para_pieces(p):
    """Danh sách (phần tử con trực tiếp của đoạn, vị trí w:t/tab trong run nếu có, văn bản). Chỉ run đơn giản mới tách được."""
    pieces = []
    for child in list(p):
        if child.tag == W('r'):
            texts = ''
            for sub in child:
                if sub.tag == W('t'): texts += sub.text or ''
                elif sub.tag == W('tab'): texts += '\t'
            pieces.append((child, texts))
        else:
            pieces.append((child, ''))
    return pieces

def _split_inline_choices(p, parent, kind):
    """Tách "A. ... B. ... C. ... D. ..." nằm chung một đoạn thành các đoạn riêng. Trả về True nếu đã tách."""
    pieces = _para_pieces(p)
    text = ''.join(t for _, t in pieces)
    letters = 'ABCD' if kind == 'ABCD' else 'abcd'
    positions, want = [], 0
    for m in _LABEL_AT[kind].finditer(text):
        if m.group(1) == letters[want]:
            positions.append(m.start()); want += 1
            if want == 4: break
    if want < 2 or text[:positions[0]].strip() and want < 4:
        # đã có nội dung câu hỏi trước phương án A: vẫn tách nếu thấy đủ 4 phương án
        if want < 4: return False
    # ranh giới cắt: bỏ khoảng trắng/tab ngay trước nhãn
    cuts = []
    for pos in positions:
        q = pos
        while q > 0 and text[q - 1] in ' \t ': q -= 1
        cuts.append(q)
    # chỉ tách khi từ phương án 2 trở đi mới cắt; phương án A giữ nguyên chỗ (phần trước A, nếu có, là đề bài)
    cut_points = cuts[1:] if text[:positions[0]].strip() == '' else cuts
    if not cut_points: return False
    # dựng các đoạn mới
    segments, cur_children, offset, ci = [], [], 0, 0
    def new_para():
        np_ = Element(W('p'))
        ppr = p.find(W('pPr'))
        if ppr is not None: np_.append(deepcopy(ppr))
        return np_
    cur = new_para()
    for child, t in pieces:
        if child.tag != W('r') or not t:
            cur.append(child); continue
        start, end = offset, offset + len(t)
        # run chỉ chứa một w:t / tab: có thể cắt giữa chừng
        local = [c for c in cut_points[ci:] if start < c < end]
        subs = [c for c in child if c.tag in (W('t'), W('tab'))]
        if local and len(subs) == 1 and subs[0].tag == W('t'):
            base = subs[0].text or ''
            last = 0
            for c in local:
                rel = c - start
                part = deepcopy(child); part.find(W('t')).text = base[last:rel]
                part.find(W('t')).set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')
                cur.append(part); segments.append(cur); cur = new_para(); last = rel; ci += 1
            tail = deepcopy(child); tail.find(W('t')).text = base[last:]
            tail.find(W('t')).set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')
            cur.append(tail)
        else:
            # cắt tại ranh giới run (c == start) hoặc không cắt được giữa run
            while ci < len(cut_points) and cut_points[ci] <= start:
                if cur is not None and len(cur): segments.append(cur); cur = new_para()
                ci += 1
            cur.append(child)
        offset = end
    segments.append(cur)
    segments = [sg for sg in segments if len(sg) > (1 if sg.find(W('pPr')) is not None else 0)]
    if len(segments) < 2: return False
    # bỏ Tab/khoảng trắng thừa ở đầu và cuối mỗi đoạn mới
    for sg in segments:
        for r in sg.findall(W('r')):
            for sub in list(r):
                if sub.tag == W('tab'): r.remove(sub)
            t = r.find(W('t'))
            if t is not None and t.text:
                t.text = t.text.strip('\t  ') if False else t.text
        # cắt khoảng trắng đầu đoạn
        for r in sg.findall(W('r')):
            t = r.find(W('t'))
            if t is not None and t.text and t.text.strip():
                t.text = t.text.lstrip(' \t '); break
    idx = list(parent).index(p)
    parent.remove(p)
    for k, sg in enumerate(segments): parent.insert(idx + k, sg)
    return True

def _fix_label_style(p):
    """"A)" / "(A)" / "A:" ở đầu đoạn  ->  "A."  ;  "a." / "(a)" -> "a)"."""
    runs = [r for r in p.iter(W('r')) if r.find(W('t')) is not None and (r.find(W('t')).text or '').strip()]
    if not runs: return
    r = runs[0]; t = r.find(W('t'))
    mm = re.match(r'^(\s*)(\(?)([A-Da-d])([.):])(\s*)', t.text)
    if mm:
        lead, op, letter, sep, sp = mm.groups()
        want = '.' if letter.isupper() else ')'
        t.text = f"{lead}{letter}{want}{sp or ' '}" + t.text[mm.end():]
        t.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')
        return
    lone = re.match(r'^(\s*)\(?([A-Da-d])\)?\s*$', t.text)   # nhãn tách làm 2 run: "A" rồi ". "
    if lone and len(runs) > 1:
        nt = runs[1].find(W('t'))
        if nt.text and re.match(r'^[.):]\s*', nt.text):
            want = '.' if lone.group(2).isupper() else ')'
            nt.text = want + re.sub(r'^[.):]', '', nt.text, count=1)
            nt.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')

def _ptext(p):
    out = ''
    for r in p.iter(W('r')):
        for sub in r:
            if sub.tag == W('t'): out += sub.text or ''
            elif sub.tag == W('tab'): out += '\t'
    return out

def normalize_source_body(body):
    parents = {c: pr for pr in body.iter() for c in pr}
    for p in list(body.iter(W('p'))):
        text = _ptext(p).strip()
        parent = parents.get(p)
        if parent is None: continue
        if re.match(r'^\(?[A-D][.):]', text) or re.match(r'^(?:Câu\s*\d+\s*[:.)]\s*)?.*?(?:^|\s)\(?A[.):]\s', text):
            if len(_LABEL_AT['ABCD'].findall(text)) >= 2 and _split_inline_choices(p, parent, 'ABCD'): continue
        if re.match(r'^\(?[a-d][.):]', text) and len(_LABEL_AT['abcd'].findall(text)) >= 2:
            if _split_inline_choices(p, parent, 'abcd'): continue
    for p in body.iter(W('p')): _fix_label_style(p)

def has_mark(choice):
    """Phương án được đánh dấu là đáp án đúng: gạch chân, hoặc nhãn/chữ tô đỏ / tô nền vàng."""
    if any(u.get(W('val')) != 'none' for u in choice.findall(f'.//{W("u")}')): return True
    for r in choice.findall(f'.//{W("r")}'):
        rpr = r.find(W('rPr'))
        if rpr is None: continue
        col = rpr.find(W('color'))
        if col is not None and (col.get(W('val')) or '').upper() in ('FF0000', 'C00000', 'E00000', 'FF0033'):
            if ''.join(r.itertext()).strip(): return True
        hl = rpr.find(W('highlight'))
        if hl is not None and hl.get(W('val')) in ('yellow', 'green', 'cyan'):
            if ''.join(r.itertext()).strip(): return True
    return False

# --- 3. QUESTION PARSING & CLASSIFICATION ---
def classify_questions_from_body(body):
    p1, p2, p3, p4, current_block = [], [], [], [], []
    def classify_and_add(block):
        if not block: return
        has_ABCD = any(''.join(p.itertext()).strip().startswith(("A.", "B.", "C.", "D.")) for p in block)
        has_abcd = any(''.join(p.itertext()).strip().startswith(("a)", "b)", "c)", "d)")) for p in block)
        has_answer_key = any(re.search(r'^\s*Đáp án\s*[:\.]', ''.join(p.itertext()), re.IGNORECASE) for p in block)
        if has_ABCD: p1.append(block)
        elif has_abcd: p2.append(block)
        elif has_answer_key: p3.append(block)
        else: p4.append(block)
    
    normalize_source_body(body)
    found_first_question = False
    for para in body.findall('.//w:p', ns):
        para_text = ''.join(para.itertext()).strip()
        if para_text.lower().startswith("câu"):
            if found_first_question: classify_and_add(current_block)
            found_first_question = True
            current_block = [para]
        elif found_first_question:
            current_block.append(para)
    classify_and_add(current_block)
    return p1, p2, p3, p4

# --- 4. QUESTION PROCESSING & ANSWER EXTRACTION ---
def create_choices_with_tabs(choices_runs):
    printable_width = STYLE.get('printable', 9900)
    lengths = [len(''.join(text for run in choice for text in run.itertext())) for choice in choices_runs]
    total_length, max_length = sum(lengths), max(lengths) if lengths else 0
    layout = '2x2'
    scale = 1 if STYLE.get('cols', 1) == 1 else 0.5   # khổ 2 cột: ngưỡng ký tự giảm một nửa
    if total_length < 80 * scale and max_length < 20 * scale: layout = '1x4'
    elif max_length > 35 * scale: layout = '4x1'
    forced = STYLE.get('choices_layout', 'auto')
    if forced in ('1x4', '2x2', '4x1'): layout = forced
    
    paragraphs, base_p = [], Element(f'{{{ns["w"]}}}p')
    pPr = SubElement(base_p, f'{{{ns["w"]}}}pPr'); SubElement(pPr, f'{{{ns["w"]}}}spacing', {f'{{{ns["w"]}}}after': '0'})
    
    if layout == '1x4':
        p = deepcopy(base_p); tabs = SubElement(p.find(f'.//w:pPr', ns), f'{{{ns["w"]}}}tabs')
        col_width = printable_width // 4
        for i in range(1, 4): SubElement(tabs, f'{{{ns["w"]}}}tab', {f'{{{ns["w"]}}}val': 'left', f'{{{ns["w"]}}}pos': str(i * col_width)})
        for i, run_list in enumerate(choices_runs):
            if i > 0: SubElement(p, f'{{{ns["w"]}}}r').append(Element(f'{{{ns["w"]}}}tab'))
            p.extend(deepcopy(run) for run in run_list)
        paragraphs.append(p)
    elif layout == '4x1':
        for run_list in choices_runs:
            p = deepcopy(base_p); p.extend(deepcopy(run) for run in run_list); paragraphs.append(p)
    else: # '2x2' is default
        col_width = printable_width // 2
        for i in range(0, 4, 2):
            if i < len(choices_runs):
                p = deepcopy(base_p); tabs = SubElement(p.find(f'.//w:pPr', ns), f'{{{ns["w"]}}}tabs')
                SubElement(tabs, f'{{{ns["w"]}}}tab', {f'{{{ns["w"]}}}val': 'left', f'{{{ns["w"]}}}pos': str(col_width)})
                p.extend(deepcopy(run) for run in choices_runs[i])
                if i + 1 < len(choices_runs):
                    SubElement(p, f'{{{ns["w"]}}}r').append(Element(f'{{{ns["w"]}}}tab'))
                    p.extend(deepcopy(run) for run in choices_runs[i+1])
                paragraphs.append(p)
    return paragraphs

# --- THAY THẾ HÀM NÀY ---

def shuffle_choices_and_relabel(question_block, choice_labels, part, shuffle_choices, mark=False):
    choices, other_paras = [], []
    choice_prefixes = ('A.', 'B.', 'C.', 'D.', 'a)', 'b)', 'c)', 'd)')
    for para in question_block:
        if isinstance(para, ET.Element) and ''.join(para.itertext()).strip().startswith(choice_prefixes): choices.append(para)
        else: other_paras.append(para)
    
    if len(choices) != len(choice_labels):
        question_text = ""
        for p in other_paras:
            text = ''.join(p.itertext()).strip()
            if text:
                question_text = text[:50] + "..." if len(text) > 50 else text
                break
        raise ValueError(f"Câu hỏi '{question_text}' có {len(choices)} đáp án, nhưng yêu cầu chính xác {len(choice_labels)} đáp án (hoặc tùy thuộc vào cấu hình).")

    original_correct_index = -1
    for i, choice in enumerate(choices):
        if has_mark(choice):
            original_correct_index = i; break
    indices = list(range(len(choices)))
    if shuffle_choices: random.shuffle(indices)
    
    display_choices, new_correct_label = [], ""
    for i, original_idx in enumerate(indices):
        choice_para = deepcopy(choices[original_idx])
        
        # --- XÓA CÁC TAB DƯ Ở CUỐI PHƯƠNG ÁN ---
        all_runs = choice_para.findall('.//w:r', ns)
        for run in reversed(all_runs):
            changed = True
            while changed:
                changed = False
                run_children = list(run)
                for child in reversed(run_children):
                    if child.tag == f'{{{ns["w"]}}}tab':
                        run.remove(child)
                        changed = True
                        break
                    elif child.tag == f'{{{ns["w"]}}}t':
                        if child.text:
                            stripped = child.text.rstrip('\t ')
                            if stripped != child.text:
                                child.text = stripped
                                changed = True
                        break
                    else:
                        break
            run_text = ''.join(run.itertext())
            if run_text.strip():
                break
        # --- KẾT THÚC XÓA TAB ---
        
        # Determine the new label dynamically if `i` exceeds `choice_labels`
        new_label = choice_labels[i]
        
        if original_idx == original_correct_index: new_correct_label = new_label.rstrip('.')
        is_correct = has_mark(choices[original_idx])
        
        if not mark:
            for u_tag in choice_para.findall('.//w:u', ns): u_tag.set(f'{{{ns["w"]}}}val', 'none')
        
        full_text = ''.join(choice_para.itertext())
        match = re.match(r'^\s*([A-Da-d][.)])\s*', full_text)
        if match:
            prefix_to_remove = match.group(0); len_to_remove = len(prefix_to_remove); chars_removed = 0
            for run in list(choice_para.findall('.//w:r', ns)):
                if chars_removed >= len_to_remove: break
                t_elem = run.find('w:t', ns)
                if t_elem is not None and t_elem.text is not None:
                    run_len = len(t_elem.text)
                    if chars_removed + run_len <= len_to_remove: chars_removed += run_len; t_elem.text = ''
                    else: remaining = len_to_remove - chars_removed; t_elem.text = t_elem.text[remaining:]; break
        
        new_run = Element(f'{{{ns["w"]}}}r'); set_run_font_properties(new_run, bold=STYLE.get('bold_choices', True), color=('FF0000' if (mark and is_correct) else STYLE.get('label', '0000FF')))
        t = SubElement(new_run, f'{{{ns["w"]}}}t'); t.text = new_label + " "; t.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')
        choice_para.insert(0, new_run)
        display_choices.append(choice_para)

    processed_runs = [[run for run in choice.findall('.//w:r', ns)] for choice in display_choices]
    
    # Sửa đổi ở dòng dưới: thêm 'or part == 'part2''
    if part == 'part1' or part == 'part2': 
        return other_paras + create_choices_with_tabs(processed_runs), new_correct_label
    
    final_choices = []
    for choice_runs in processed_runs:
        p = Element(f'{{{ns["w"]}}}p')
        pPr = SubElement(p, f'{{{ns["w"]}}}pPr'); SubElement(pPr, f'{{{ns["w"]}}}spacing', {f'{{{ns["w"]}}}after': '0'})
        p.extend(deepcopy(run) for run in choice_runs)
        final_choices.append(p)
    return other_paras + final_choices, new_correct_label

def add_question_number(question_block, question_number):
    if not question_block: return question_block
    first_para = question_block[0]
    pPr = first_para.find('w:pPr', ns) or SubElement(first_para, f'{{{ns["w"]}}}pPr')
    
    numPr = pPr.find('w:numPr', ns)
    if numPr is not None: pPr.remove(numPr)
    
    ind = pPr.find('w:ind', ns) or SubElement(pPr, f'{{{ns["w"]}}}ind')
    ind.set(f'{{{ns["w"]}}}firstLine', "0"); ind.set(f'{{{ns["w"]}}}firstLineChars', "0")

    full_text_start = ''.join(r.findtext(f'{{{ns["w"]}}}t', '', ns) for r in first_para.findall('.//w:r', ns)[:5])
    match = re.match(r'^\s*(Câu\s*\d+\s*[:.)]?\s*)+', full_text_start, re.IGNORECASE)
    if match:
        prefix_to_remove = match.group(0); len_to_remove = len(prefix_to_remove); chars_removed = 0
        for run in list(first_para.findall('.//w:r', ns)):
            if chars_removed >= len_to_remove: break
            t_elem = run.find('w:t', ns)
            if t_elem is not None and t_elem.text is not None:
                run_len = len(t_elem.text)
                if chars_removed + run_len <= len_to_remove: chars_removed += run_len; t_elem.text = ''
                else: remaining = len_to_remove - chars_removed; t_elem.text = t_elem.text[remaining:]; break
    
    new_run = Element(f'{{{ns["w"]}}}r'); set_run_font_properties(new_run, bold=True, color=STYLE.get('qnum', '800080'))
    t = SubElement(new_run, f'{{{ns["w"]}}}t'); t.text = f"Câu {question_number}: "; t.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')
    first_para.insert(0, new_run)
    all_runs = first_para.findall('.//w:r', ns)
    if len(all_runs) > 1:
        next_t_elem = all_runs[1].find('w:t', ns)
        if next_t_elem is not None and next_t_elem.text is not None:
            next_t_elem.text = " " + next_t_elem.text.lstrip()
        else:
            space_run = Element(f'{{{ns["w"]}}}r'); space_t = SubElement(space_run, f'{{{ns["w"]}}}t'); space_t.text = " "; space_t.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve'); first_para.insert(1, space_run)
    return question_block

def extract_answer_part2(choices):
    return "".join(['D' if has_mark(c) else 'S' for c in choices])

def extract_answer_part3(question_block):
    for para in question_block:
        text = ''.join(para.itertext()).strip()
        match = re.search(r'Đáp án\s*[:\.]\s*(.*)', text, re.IGNORECASE)
        if match: return match.group(1).strip()
    return ''

# --- 5. MAIN WORKFLOW FUNCTION ---
# --- THAY THẾ TOÀN BỘ HÀM NÀY ---


# --- GIỮ NGUYÊN TIỀN TỐ XML GỐC ---
# ElementTree tự đổi w:, mc:, w14: thành ns0:, ns1:... khiến thuộc tính mc:Ignorable="w14 w15…" trỏ tới tiền tố không còn khai báo:
# Word coi tệp là hỏng ("không thể mở"/GeneralException). Đăng ký lại đúng tiền tố gốc rồi chép nguyên thẻ gốc về.
_START_TAG = re.compile(r'<(?![?!])[\w:.-]+(?:\s[^>]*)?>', re.S)
_XMLNS = re.compile(r'xmlns:([A-Za-z_][\w.-]*)="([^"]+)"')

def _register_prefixes(xml_text):
    m = _START_TAG.search(xml_text)
    if not m: return None
    for prefix, uri in _XMLNS.findall(m.group(0)):
        try: ET.register_namespace(prefix, uri)
        except ValueError: pass
    return m.group(0)

def _serialize_document(root, original_root_tag):
    text = ET.tostring(root, encoding='unicode')
    m = _START_TAG.search(text)
    if m and original_root_tag:
        have = {prefix for prefix, _ in _XMLNS.findall(original_root_tag)}
        extra = ''.join(f' xmlns:{prefix}="{uri}"' for prefix, uri in _XMLNS.findall(m.group(0)) if prefix not in have)
        tag = original_root_tag[:-1] + extra + '>'
        text = text[:m.start()] + tag + text[m.end():]
    return ('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>\n' + text).encode('utf-8')

FOOTER_CT = 'application/vnd.openxmlformats-officedocument.wordprocessingml.footer+xml'
FOOTER_REL = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/footer'

def _content_types_text(xml_text, with_footer):
    xml_text = re.sub(r'<Override\b[^>]*wordprocessingml\.footer\+xml[^>]*/>', '', xml_text)
    if with_footer: xml_text = xml_text.replace('</Types>', f'<Override PartName="/word/footer1.xml" ContentType="{FOOTER_CT}"/></Types>')
    return xml_text

def _rels_text(xml_text, with_footer):
    xml_text = re.sub(r'<Relationship\b[^>]*relationships/footer"[^>]*/>', '', xml_text)
    footer_id = None
    if with_footer:
        ids = [int(x) for x in re.findall(r'Id="rId(\d+)"', xml_text)]
        footer_id = f'rId{max(ids + [0]) + 1}'
        xml_text = xml_text.replace('</Relationships>', f'<Relationship Id="{footer_id}" Type="{FOOTER_REL}" Target="footer1.xml"/></Relationships>')
    return xml_text, footer_id

W = lambda tag: f'{{{ns["w"]}}}{tag}'
SOLUTION_RE = re.compile(r'^\s*(Lời giải|Lời Giải|LỜI GIẢI|Hướng dẫn|Giải|Phương pháp|Áp dụng|Đáp số)\b', re.IGNORECASE)
ANSWER_LINE_RE = re.compile(r'^\s*Đáp án\s*[:\.]', re.IGNORECASE)
CHOICE_PREFIXES = ('A.', 'B.', 'C.', 'D.', 'a)', 'b)', 'c)', 'd)')

def _text(p): return ''.join(p.itertext()).strip()

def split_head_tail(block, kind):
    """Tách khối câu hỏi thành phần đề (đến hết các phương án) và phần đáp án/lời giải theo sau.
    Trước đây lời giải bị gom lên TRƯỚC các phương án sau khi trộn; tách ra thì đề sạch và bản lời giải đúng thứ tự."""
    if kind in ('p1', 'p2'):
        last = max([i for i, p in enumerate(block) if _text(p).startswith(CHOICE_PREFIXES)] or [-1])
        return block[:last + 1], block[last + 1:]
    cut = len(block)
    for i, p in enumerate(block):
        if i == 0: continue
        t = _text(p)
        if SOLUTION_RE.match(t) or ANSWER_LINE_RE.match(t): cut = i; break
    return block[:cut], block[cut:]

def _fmt(elements):
    """Áp phông, cỡ chữ, giãn dòng cho nội dung gốc (không đụng tới tiêu đề/đầu đề vốn có cỡ riêng)."""
    wrap = Element('x'); wrap.extend(elements)
    set_global_font_style(wrap); normalize_paragraph_spacing(wrap)
    return list(wrap)

def _gap_para(twips):
    p = Element(W('p')); pPr = SubElement(p, W('pPr'))
    SubElement(pPr, W('spacing'), {W('before'): '0', W('after'): '0', W('line'): str(max(20, twips)), W('lineRule'): 'exact'})
    r = SubElement(p, W('r')); SubElement(SubElement(r, W('rPr')), W('sz')).set(W('val'), '2')
    return p

def _borders(tblPr, spec, color):
    tb = SubElement(tblPr, W('tblBorders'))
    for side in ['top', 'left', 'bottom', 'right', 'insideH', 'insideV']:
        val, sz = spec.get(side, ('nil', '0'))
        SubElement(tb, W(side), {W('val'): val, W('sz'): sz, W('space'): '0', W('color'): color})

def _frame(elements, style):
    color = STYLE.get('frame', '000000')
    S = ('single', '6'); spec = {}
    fill = None
    if style == 'simple': spec = {k: S for k in ['top', 'left', 'bottom', 'right']}
    elif style == 'shadow': spec = {'top': ('single', '4'), 'left': ('single', '4'), 'bottom': ('single', '18'), 'right': ('single', '18')}
    elif style == 'dotted': spec = {k: ('dotted', '8') for k in ['top', 'left', 'bottom', 'right']}
    elif style == 'double': spec = {k: ('double', '6') for k in ['top', 'left', 'bottom', 'right']}
    elif style == 'left_bar': spec = {'left': ('single', '36')}
    elif style == 'fill': spec = {k: ('single', '4') for k in ['top', 'left', 'bottom', 'right']}; fill = 'F2F6FC'
    else: return elements
    tbl = Element(W('tbl')); tblPr = SubElement(tbl, W('tblPr'))
    SubElement(tblPr, W('tblW'), {W('w'): '5000', W('type'): 'pct'})
    _borders(tblPr, spec, color)
    SubElement(tblPr, W('tblLayout'), {W('type'): 'fixed'})
    mar = SubElement(tblPr, W('tblCellMar'))
    for side in ['top', 'left', 'bottom', 'right']:
        SubElement(mar, W(side), {W('w'): '80' if side in ('top', 'bottom') else '140', W('type'): 'dxa'})
    grid = SubElement(tbl, W('tblGrid')); SubElement(grid, W('gridCol'), {W('w'): str(STYLE.get('printable', 9900) + 400)})
    tr = SubElement(tbl, W('tr')); tc = SubElement(tr, W('tc')); tcPr = SubElement(tc, W('tcPr'))
    SubElement(tcPr, W('tcW'), {W('w'): '5000', W('type'): 'pct'})
    if fill: SubElement(tcPr, W('shd'), {W('val'): 'clear', W('color'): 'auto', W('fill'): fill})
    for e in elements: tc.append(deepcopy(e))
    SubElement(tc, W('p')) if elements and elements[-1].tag != W('p') else None
    return [tbl]

def _lines_table(n):
    tbl = Element(W('tbl')); tblPr = SubElement(tbl, W('tblPr'))
    SubElement(tblPr, W('tblW'), {W('w'): '5000', W('type'): 'pct'}); _borders(tblPr, {}, 'auto')
    grid = SubElement(tbl, W('tblGrid')); SubElement(grid, W('gridCol'), {W('w'): str(STYLE.get('printable', 9900) + 400)})
    for _ in range(n):
        tr = SubElement(tbl, W('tr')); SubElement(SubElement(tr, W('trPr')), W('trHeight'), {W('val'): '400'})
        tc = SubElement(tr, W('tc')); tcPr = SubElement(tc, W('tcPr'))
        tcb = SubElement(tcPr, W('tcBorders')); SubElement(tcb, W('bottom'), {W('val'): 'dotted', W('sz'): '4', W('color'): '808080'})
        SubElement(tc, W('p'))
    return tbl

def _tf_table(stem_free_choices):
    """Bảng Mệnh đề | Đúng | Sai cho phần II."""
    total = STYLE.get('printable', 9900) + 400
    widths = [600, total - 600 - 1100 - 1100, 1100, 1100]
    color = STYLE.get('label', '0000FF'); frame = STYLE.get('frame', '000000')
    tbl = Element(W('tbl')); tblPr = SubElement(tbl, W('tblPr'))
    SubElement(tblPr, W('tblW'), {W('w'): str(total), W('type'): 'dxa'}); SubElement(tblPr, W('jc'), {W('val'): 'center'})
    _borders(tblPr, {k: ('single', '4') for k in ['top', 'left', 'bottom', 'right', 'insideH', 'insideV']}, frame if frame != '000000' else '404040')
    SubElement(tblPr, W('tblLayout'), {W('type'): 'fixed'})
    grid = SubElement(tbl, W('tblGrid'))
    for w_ in widths: SubElement(grid, W('gridCol'), {W('w'): str(w_)})
    def cell(tr, w_, fill=None):
        tc = SubElement(tr, W('tc')); tcPr = SubElement(tc, W('tcPr'))
        SubElement(tcPr, W('tcW'), {W('w'): str(w_), W('type'): 'dxa'})
        if fill: SubElement(tcPr, W('shd'), {W('val'): 'clear', W('color'): 'auto', W('fill'): fill})
        SubElement(tcPr, W('vAlign'), {W('val'): 'center'})
        return tc
    tr = SubElement(tbl, W('tr')); SubElement(SubElement(tr, W('trPr')), W('tblHeader'))
    for w_, t in zip(widths, ['Ý', 'Mệnh đề', 'Đúng', 'Sai']):
        tc = cell(tr, w_, 'E8EEF9'); p = SubElement(tc, W('p')); SubElement(SubElement(p, W('pPr')), W('jc')).set(W('val'), 'center')
        r = SubElement(p, W('r')); set_run_font_properties(r, bold=True, color=color); SubElement(r, W('t')).text = t
    for choice in stem_free_choices:
        tr = SubElement(tbl, W('tr')); SubElement(SubElement(tr, W('trPr')), W('cantSplit'))
        c1 = cell(tr, widths[0]); p1 = SubElement(c1, W('p')); SubElement(SubElement(p1, W('pPr')), W('jc')).set(W('val'), 'center')
        label = re.match(r'^\s*([a-d])[)]', _text(choice)); r = SubElement(p1, W('r'))
        set_run_font_properties(r, bold=True, color=color); SubElement(r, W('t')).text = (label.group(1) + ')') if label else ''
        c2 = cell(tr, widths[1]); p2 = SubElement(c2, W('p'))
        runs = [deepcopy(r_) for r_ in choice.findall(f'.//{W("r")}')]
        # bỏ nhãn a) b)… ở đầu nội dung vì đã có cột Ý
        removed, to_remove = 0, len(label.group(0)) if label else 0
        for r_ in runs:
            t_ = r_.find(W('t'))
            if t_ is not None and t_.text and removed < to_remove:
                cut = min(len(t_.text), to_remove - removed); t_.text = t_.text[cut:]; removed += cut
        # chuyển đoạn OMML/ảnh (con trực tiếp của đoạn gốc không phải w:r) sang ô nội dung theo đúng thứ tự
        for child in list(choice):
            if child.tag == W('pPr'): continue
            if child.tag == W('r'): p2.append(runs.pop(0)) if runs else None
            else: p2.append(deepcopy(child))
        for w_ in widths[2:]:
            c = cell(tr, w_); SubElement(c, W('p'))
    return tbl

def _wrap_question(elements, kind, tail=None):
    """Khối câu hỏi hoàn chỉnh: định dạng chữ -> thêm phần lời giải (nếu có) -> khung -> dòng kẻ trả lời -> khoảng cách."""
    out = _fmt(elements)
    if tail: out += _fmt([deepcopy(t) for t in tail])
    gap = STYLE.get('gap', 120)
    framed = STYLE.get('frame_style', 'none') != 'none'
    if framed: out = _frame(out, STYLE['frame_style'])
    if STYLE.get('variant') != 'dap_an':
        if kind == 'p3' and STYLE.get('sa_answer_line'):
            ans = Element(W('p')); r = SubElement(ans, W('r')); set_run_font_properties(r, italic=True)
            SubElement(r, W('t')).text = 'Trả lời: ......................................'
            out.append(ans)
        n = STYLE.get('sa_lines', 0) if kind == 'p3' else STYLE.get('tl_lines', 0) if kind == 'p4' else 0
        if n: out += [_gap_para(60), _lines_table(n)]
    if framed or out and out[-1].tag != W('p'): out.append(_gap_para(gap if gap else 60))
    elif out and gap:
        pPr = out[-1].find(W('pPr'))
        if pPr is None: pPr = Element(W('pPr')); out[-1].insert(0, pPr)
        sp = pPr.find(W('spacing'))
        if sp is None: sp = SubElement(pPr, W('spacing'))
        sp.set(W('after'), str(gap))
    return out

def shuffle_questions_in_docx(file_stream, header_info, keep_original=False):
    configure_style(header_info)
    mark = STYLE.get('variant') == 'dap_an'
    output_stream = io.BytesIO()
    show_footer = STYLE.get('show_footer', True)
    with zipfile.ZipFile(output_stream, 'w', zipfile.ZIP_DEFLATED) as new_docx_zip:
        with zipfile.ZipFile(file_stream, 'r') as original_docx_zip:
            names = original_docx_zip.namelist()
            xml_text = original_docx_zip.read('word/document.xml').decode('utf-8')
            rels_text = original_docx_zip.read('word/_rels/document.xml.rels').decode('utf-8') if 'word/_rels/document.xml.rels' in names else \
                '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"></Relationships>'
            types_text = original_docx_zip.read('[Content_Types].xml').decode('utf-8') if '[Content_Types].xml' in names else None
            for item in original_docx_zip.infolist():
                if item.filename not in ['word/document.xml', 'word/_rels/document.xml.rels', '[Content_Types].xml'] and 'word/footer' not in item.filename:
                    new_docx_zip.writestr(item, original_docx_zip.read(item.filename))

        if types_text is not None:
            new_docx_zip.writestr('[Content_Types].xml', _content_types_text(types_text, show_footer).encode('utf-8'))
        rels_text, footer_rid = _rels_text(rels_text, show_footer)
        new_docx_zip.writestr('word/_rels/document.xml.rels', rels_text.encode('utf-8'))
        if show_footer:
            new_docx_zip.writestr('word/footer1.xml', create_footer_xml(header_info.get('ma_de')))

        root_tag = _register_prefixes(xml_text)
        root = ET.fromstring(xml_text.encode('utf-8')); body = root.find('w:body', ns)
        old_sectPr = body.find('w:sectPr', ns)
        if old_sectPr is not None: body.remove(old_sectPr)

        p1, p2, p3, p4 = classify_questions_from_body(body)
        if not keep_original: random.shuffle(p1); random.shuffle(p2); random.shuffle(p3); random.shuffle(p4)
        
        new_body = Element(f'{{{ns["w"]}}}body')
        add_document_header(new_body, header_info, len(p1), len(p2), len(p3), len(p4))
        ans1, ans2, ans3 = [], [], []
        n = 1
        
        if p1:
            add_section_title(new_body, f"PHẦN I. TRẮC NGHIỆM ({len(p1)} câu)", f"Thí sinh trả lời từ câu {n} đến câu {n + len(p1) - 1}. Mỗi câu hỏi thí sinh chỉ chọn một phương án.")
            for qb in p1:
                head, tail = split_head_tail(qb, 'p1')
                proc_b, new_correct_ans = shuffle_choices_and_relabel(head, ['A.', 'B.', 'C.', 'D.'], 'part1', not keep_original, mark)
                ans1.append(new_correct_ans)
                for elem in _wrap_question(add_question_number(proc_b, n), 'p1', tail if mark else None): new_body.append(elem)
                n += 1
        
        if p2:
            add_section_title(new_body, f"PHẦN II. ĐÚNG/SAI ({len(p2)} câu)", f"Thí sinh trả lời từ câu {n} đến câu {n + len(p2) - 1}. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.")
            as_table = STYLE.get('tf_style') == 'table'
            for qb in p2:
                head, tail = split_head_tail(qb, 'p2')
                choices_p2 = [c for c in head if _text(c).startswith(('a)', 'b)', 'c)', 'd)'))]
                ans2.append(extract_answer_part2(choices_p2))
                proc_b, _ = shuffle_choices_and_relabel(head, ['a)', 'b)', 'c)', 'd)'], 'part2t' if as_table else 'part2', not keep_original, mark)
                numbered = add_question_number(proc_b, n)
                if as_table:
                    stem = [e for e in numbered if not _text(e).startswith(('a)', 'b)', 'c)', 'd)'))]
                    choices = [e for e in numbered if _text(e).startswith(('a)', 'b)', 'c)', 'd)'))]
                    stem_fmt = _fmt(stem); choices_fmt = _fmt(choices)
                    # các nhãn đã tô màu; đáp án đúng trong bản lời giải vẫn đỏ
                    block = stem_fmt + [_tf_table(choices_fmt)]
                    block = _frame(block, STYLE['frame_style']) if STYLE.get('frame_style', 'none') != 'none' else block
                    if mark and tail: block += _fmt([deepcopy(t) for t in tail])
                    block.append(_gap_para(STYLE.get('gap', 120) or 60))
                    for elem in block: new_body.append(elem)
                else:
                    for elem in _wrap_question(numbered, 'p2', tail if mark else None): new_body.append(elem)
                n += 1
        
        if p3:
            add_section_title(new_body, f"PHẦN III. TRẢ LỜI NGẮN ({len(p3)} câu)", f"Thí sinh trả lời từ câu {n} đến câu {n + len(p3) - 1}.")
            for qb in p3:
                ans3.append(extract_answer_part3(qb))
                head, tail = split_head_tail(qb, 'p3')
                for elem in _wrap_question(add_question_number(head, n), 'p3', tail if mark else None): new_body.append(elem)
                n += 1

        if p4:
            add_section_title(new_body, f"PHẦN IV. TỰ LUẬN ({len(p4)} câu)")
            for qb in p4:
                head, tail = split_head_tail(qb, 'p4')
                for elem in _wrap_question(add_question_number(head, n), 'p4', tail if mark else None): new_body.append(elem)
                n += 1

        add_exam_ender(new_body)
        
        cols = f'<w:cols w:num="2" w:space="567"/>' if STYLE.get('cols') == 2 else '<w:cols w:space="708"/>'
        footer_ref = f'<w:footerReference w:type="default" r:id="{footer_rid}"/>' if footer_rid else ''
        sect_pr_xml_string = f'''<w:sectPr xmlns:w="{ns['w']}" xmlns:r="{ns['r']}">
          {footer_ref}
          <w:pgSz w:w="11906" w:h="16838"/><w:pgMar w:top="{STYLE['margin_tb']}" w:right="{STYLE['margin_lr']}" w:bottom="{STYLE['margin_tb']}" w:left="{STYLE['margin_lr']}" w:header="360" w:footer="360" w:gutter="0"/>
          {cols}<w:docGrid w:linePitch="360"/></w:sectPr>'''
        new_body.append(ET.fromstring(sect_pr_xml_string))
        
        root.remove(body); root.append(new_body)
        new_docx_zip.writestr('word/document.xml', _serialize_document(root, root_tag))
    output_stream.seek(0)
    return output_stream, ans1, ans2, ans3

def build_answer_table_docx(base_docx, madelist, answers):
    """Tệp BangDapAn.docx: mỗi mã đề một bảng đáp án (Phần I theo hàng 10 câu, Phần II dạng Đ/S, Phần III)."""
    color = STYLE.get('label', '0000FF')
    def para(text, bold=False, size=None, center=False, col=None):
        p = Element(W('p'))
        if center: SubElement(SubElement(p, W('pPr')), W('jc')).set(W('val'), 'center')
        r = SubElement(p, W('r')); set_run_font_properties(r, bold=bold, font_size=size, color=col); SubElement(r, W('t')).text = text
        return p
    def table(rows, widths_each):
        tbl = Element(W('tbl')); tblPr = SubElement(tbl, W('tblPr'))
        SubElement(tblPr, W('tblW'), {W('w'): '5000', W('type'): 'pct'})
        _borders(tblPr, {k: ('single', '4') for k in ['top', 'left', 'bottom', 'right', 'insideH', 'insideV']}, '404040')
        grid = SubElement(tbl, W('tblGrid'))
        for _ in rows[0]: SubElement(grid, W('gridCol'), {W('w'): str(widths_each)})
        for ri, row in enumerate(rows):
            tr = SubElement(tbl, W('tr'))
            for cell_text in row:
                tc = SubElement(tr, W('tc')); tcPr = SubElement(tc, W('tcPr'))
                if ri % 2 == 0: SubElement(tcPr, W('shd'), {W('val'): 'clear', W('color'): 'auto', W('fill'): 'E8EEF9'})
                tc.append(para(str(cell_text), bold=(ri % 2 == 0), center=True, col=color if ri % 2 == 0 else None))
        return tbl
    body = Element(W('body'))
    body.append(para('BẢNG ĐÁP ÁN', bold=True, size=32, center=True, col=color))
    for i, ma in enumerate(madelist):
        body.append(para(f'Mã đề {ma}', bold=True, size=26, col=STYLE.get('qnum')))
        a1, a2, a3 = answers['ans1'][i], answers['ans2'][i], answers['ans3'][i]
        q = 1
        if a1:
            body.append(para('Phần I', bold=True))
            for k in range(0, len(a1), 10):
                chunk = a1[k:k + 10]
                body.append(table([[f'{q + k + j}' for j in range(len(chunk))] + [''] * (10 - len(chunk)), [(c[0] if c else '') for c in chunk] + [''] * (10 - len(chunk))], 900)); body.append(_gap_para(80))
            q += len(a1)
        if a2:
            body.append(para('Phần II', bold=True))
            rows = [['Câu', 'a', 'b', 'c', 'd']] + [[str(q + j)] + list(x.replace('D', 'Đ')) for j, x in enumerate(a2)]
            body.append(table_rows_tf(rows)); body.append(_gap_para(80)); q += len(a2)
        if a3:
            body.append(para('Phần III', bold=True))
            for k in range(0, len(a3), 6):
                chunk = a3[k:k + 6]
                body.append(table([[f'{q + k + j}' for j in range(len(chunk))] + [''] * (6 - len(chunk)), list(chunk) + [''] * (6 - len(chunk))], 1500)); body.append(_gap_para(80))
        body.append(para(''))
    body.append(ET.fromstring(f'<w:sectPr xmlns:w="{ns["w"]}"><w:pgSz w:w="11906" w:h="16838"/><w:pgMar w:top="851" w:right="992" w:bottom="851" w:left="992" w:header="360" w:footer="360" w:gutter="0"/></w:sectPr>'))
    set_global_font_style(body)
    out = io.BytesIO()
    with zipfile.ZipFile(io.BytesIO(base_docx)) as src, zipfile.ZipFile(out, 'w', zipfile.ZIP_DEFLATED) as dst:
        for item in src.infolist():
            data = src.read(item.filename)
            if item.filename == 'word/document.xml':
                text = data.decode('utf-8'); tag = _register_prefixes(text)
                root = ET.fromstring(data); root.remove(root.find('w:body', ns)); root.append(body)
                dst.writestr(item.filename, _serialize_document(root, tag))
            elif item.filename.startswith('word/footer'): continue
            elif item.filename == 'word/_rels/document.xml.rels':
                dst.writestr(item.filename, _rels_text(data.decode('utf-8'), False)[0].encode('utf-8'))
            elif item.filename == '[Content_Types].xml':
                dst.writestr(item.filename, _content_types_text(data.decode('utf-8'), False).encode('utf-8'))
            else: dst.writestr(item, data)
    return out.getvalue()

def table_rows_tf(rows):
    tbl = Element(W('tbl')); tblPr = SubElement(tbl, W('tblPr'))
    SubElement(tblPr, W('tblW'), {W('w'): '3000', W('type'): 'pct'})
    _borders(tblPr, {k: ('single', '4') for k in ['top', 'left', 'bottom', 'right', 'insideH', 'insideV']}, '404040')
    grid = SubElement(tbl, W('tblGrid'))
    for _ in rows[0]: SubElement(grid, W('gridCol'), {W('w'): '900'})
    for ri, row in enumerate(rows):
        tr = SubElement(tbl, W('tr'))
        for cell_text in row:
            tc = SubElement(tr, W('tc')); tcPr = SubElement(tc, W('tcPr'))
            if ri == 0: SubElement(tcPr, W('shd'), {W('val'): 'clear', W('color'): 'auto', W('fill'): 'E8EEF9'})
            p = SubElement(tc, W('p')); SubElement(SubElement(p, W('pPr')), W('jc')).set(W('val'), 'center')
            r = SubElement(p, W('r')); set_run_font_properties(r, bold=(ri == 0)); SubElement(r, W('t')).text = str(cell_text)
    return tbl

# --- 6. PYODIDE EXPORTED FUNCTIONS ---
async def count_questions(file_content_js):
    file_content = file_content_js.to_py(); file_stream = io.BytesIO(file_content)
    try:
        with zipfile.ZipFile(file_stream, 'r') as docx_zip:
            if 'word/document.xml' not in docx_zip.namelist(): return json.dumps({'error': 'File DOCX không hợp lệ hoặc bị lỗi.'})
            xml_content = docx_zip.read('word/document.xml')
        root = ET.fromstring(xml_content); body = root.find('.//w:body', ns)
        if body is None: return json.dumps({'error': 'Cấu trúc file DOCX không hợp lệ.'})
        p1, p2, p3, p4 = classify_questions_from_body(body)
        err1, err3 = [], []
        for idx, q in enumerate(p1):
            choices = [p for p in q if ''.join(p.itertext()).strip().startswith(("A.", "B.", "C.", "D."))]
            if len(choices) != 4: err1.append(f"Câu {idx+1}: Phải có đúng 4 phương án A, B, C, D.")
            corrects = sum(1 for c in choices if has_mark(c))
            if corrects == 0: err1.append(f"Câu {idx+1}: Phải có 1 đáp án được gạch chân.")
            if corrects > 1: err1.append(f"Câu {idx+1}: Chỉ được có 1 đáp án gạch chân.")
        for idx, q in enumerate(p3):
             if not any('đáp án:' in ''.join(p.itertext()).lower() for p in q):
                err3.append(f"Câu {idx+1}: Thiếu từ khóa 'Đáp án:'.")
        return json.dumps({'num_questions_part1': len(p1), 'num_questions_part2': len(p2), 'num_questions_part3': len(p3), 'num_questions_part4': len(p4), 'part1_errors': err1, 'part3_errors': err3})
    except Exception as e:
        return json.dumps({'error': f'Lỗi hệ thống khi phân tích file: {str(e)}'})

async def process_file(file_content_js, options_js):
    await micropip.install(['openpyxl'])
    from openpyxl import Workbook
    from openpyxl.utils import column_index_from_string
    
    file_content = file_content_js.to_py(); options = options_js.to_py()
    zip_buffer = io.BytesIO()

    with zipfile.ZipFile(zip_buffer, 'w', zipfile.ZIP_DEFLATED) as zip_file:
        madelist = [code.strip() for code in options.get('madelist', '').split(',') if code.strip()]
        keep_original = options.get('keep_original', False)
        all_answers = {'ans1': [], 'ans2': [], 'ans3': []}
        
        is_first_run = True
        want_solution = _flag(options.get('xuat_loigiai'), True)
        want_table = _flag(options.get('xuat_bangdapan'), True)
        if _flag(options.get('lam_dep'), False) and not options.get('ten_tep'): options = {**options, 'ten_tep': 'LamDep'}
        stem_name = re.sub(r'[\\/:*?"<>|]+', '_', str(options.get('ten_tep') or 'TronDe').strip()) or 'TronDe'
        first_docx = None
        lam_dep = _flag(options.get('lam_dep'), False)
        if lam_dep: madelist = ['']
        for ma_de in madelist:
            file_data = io.BytesIO(file_content)
            header_info = { "ma_de": ma_de, **options, "variant": "de" }
            should_shuffle = not (keep_original and is_first_run)
            is_first_run = False
            seed = random.getrandbits(48)
            
            try:
                random.seed(seed)
                shuffled_stream, ans1, ans2, ans3 = shuffle_questions_in_docx(file_data, header_info, not should_shuffle)
                data = shuffled_stream.read()
                zip_file.writestr(f"{stem_name}_De.docx" if lam_dep else f"{stem_name}_{ma_de}.docx", data)
                first_docx = first_docx or data
                if want_solution:
                    random.seed(seed)   # cùng hạt giống => cùng thứ tự trộn, chỉ khác phần đánh dấu đáp án
                    sol_stream, *_ = shuffle_questions_in_docx(io.BytesIO(file_content), {**header_info, "variant": "dap_an"}, not should_shuffle)
                    zip_file.writestr(f"{stem_name}_LoiGiai.docx" if lam_dep else f"{stem_name}_{ma_de}_LoiGiai.docx", sol_stream.read())
                all_answers['ans1'].append(ans1)
                all_answers['ans2'].append(ans2)
                all_answers['ans3'].append(ans3)
            except Exception as e:
                error_message = f"Lỗi xử lý mã đề {ma_de}: {type(e).__name__}: {str(e)}"
                zip_file.writestr(f"ERROR_{stem_name}_{ma_de}.txt", error_message)
                continue
        
        successful_madelist = madelist[:len(all_answers['ans1'])]
        if lam_dep: successful_madelist = ['Đề']
        # Removed premature return here to allow zip directory to write correctly

        num_q1 = len(all_answers['ans1'][0]) if all_answers['ans1'] else 0
        num_q2 = len(all_answers['ans2'][0]) if all_answers['ans2'] else 0
        num_q3 = len(all_answers['ans3'][0]) if all_answers['ans3'] else 0

        # --- Generate ChamThi.xlsx ---
        wb_chamthi = Workbook(); ws_chamthi = wb_chamthi.active; ws_chamthi.title = "Đáp án tổng hợp"
        headers_chamthi = ['Mã đề'] 
        q_num = 1
        if num_q1 > 0: headers_chamthi += [f'C{i+q_num}' for i in range(num_q1)]
        q_num += num_q1
        if num_q2 > 0: headers_chamthi += [f'C{i+q_num}' for i in range(num_q2)]
        q_num += num_q2
        if num_q3 > 0: headers_chamthi += [f'C{i+q_num}' for i in range(num_q3)]
        ws_chamthi.append(headers_chamthi)

        for i, ma_de in enumerate(successful_madelist):
            row = [ma_de]
            if num_q1 > 0: row += [a[0] if a else '' for a in all_answers['ans1'][i]]
            if num_q2 > 0: row += all_answers['ans2'][i]
            if num_q3 > 0: row += all_answers['ans3'][i]
            ws_chamthi.append(row)
        
        stream_chamthi = io.BytesIO(); wb_chamthi.save(stream_chamthi); stream_chamthi.seek(0)
        if not lam_dep: zip_file.writestr("ChamThi.xlsx", stream_chamthi.read())

        # --- Generate UnTLap.xlsx ---
        wb_untlap = Workbook(); ws_untlap = wb_untlap.active; ws_untlap.title = "UnTLap"
        ws_untlap.append(['Phần', 'Câu'] + [f"Mã đề {code}" for code in successful_madelist])
        q_global = 1
        if num_q1 > 0:
            for i in range(num_q1):
                row = ['1', q_global] + [all_answers['ans1'][r][i][0] if all_answers['ans1'][r][i] else '' for r in range(len(successful_madelist))]
                ws_untlap.append(row)
                q_global +=1
        if num_q2 > 0:
            for i in range(num_q2):
                for choice_idx, choice_label in enumerate(['a', 'b', 'c', 'd']):
                    ans_str_list = [all_answers['ans2'][r][i] for r in range(len(successful_madelist))]
                    row = ['2', f"{q_global}{choice_label}"] + [s[choice_idx] if s and len(s)==4 else '' for s in ans_str_list]
                    ws_untlap.append(row)
                q_global += 1
        if num_q3 > 0:
            for i in range(num_q3):
                row = ['3', q_global] + [all_answers['ans3'][r][i] for r in range(len(successful_madelist))]
                ws_untlap.append(row)
                q_global +=1

        stream_untlap = io.BytesIO(); wb_untlap.save(stream_untlap); stream_untlap.seek(0)
        if not lam_dep: zip_file.writestr("UnTLap.xlsx", stream_untlap.read())
        
        # --- Generate nhc.xlsx ---
        wb_nhc = Workbook(); ws_nhc = wb_nhc.active; ws_nhc.title = "nhc"
        ws_nhc.append(['Phần', 'I', 'II', 'III'])
        ws_nhc.append(['Số câu', num_q1, num_q2, num_q3])
        ws_nhc.append(['Câu\\Mã đề'] + successful_madelist)

        if num_q1 > 0:
            for i in range(num_q1): ws_nhc.append([i + 1] + [all_answers['ans1'][r][i][0] if all_answers['ans1'][r][i] else '' for r in range(len(successful_madelist))])
        if num_q2 > 0:
            for i in range(num_q2): ws_nhc.append([i + 1] + [all_answers['ans2'][r][i] for r in range(len(successful_madelist))])
        if num_q3 > 0:
            for i in range(num_q3): ws_nhc.append([i + 1] + [all_answers['ans3'][r][i] for r in range(len(successful_madelist))])

        stream_nhc = io.BytesIO(); wb_nhc.save(stream_nhc); stream_nhc.seek(0)
        if not lam_dep: zip_file.writestr("nhc.xlsx", stream_nhc.read())

        if want_table and first_docx and successful_madelist:
            try:
                zip_file.writestr("BangDapAn.docx", build_answer_table_docx(first_docx, successful_madelist, all_answers))
            except Exception as e:
                zip_file.writestr("ERROR_BangDapAn.txt", f"{type(e).__name__}: {e}")

    zip_buffer.seek(0)
    return zip_buffer.getvalue()
# Thêm hàm này vào cuối file /public/python/docx_shuffler.py

def parse_docx_to_slides_json(docx_content_bytes):
    """
    Hàm này chỉ làm một việc: đọc file DOCX và trả về JSON chứa các slide.
    Nó không liên quan gì đến việc trộn đề.
    """
    ns = {'w': 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'}
    slides_html_content = []
    
    try:
        file_stream = io.BytesIO(docx_content_bytes.to_py())
        with zipfile.ZipFile(file_stream, 'r') as docx_zip:
            xml_content = docx_zip.read('word/document.xml')
        
        root = ET.fromstring(xml_content)
        body = root.find('w:body', ns)

        # Sử dụng lại logic phân tích câu hỏi chính xác từ file này
        p1, p2, p3, p4 = classify_questions_from_body(body)
        all_question_blocks = p1 + p2 + p3 + p4

        # Xử lý từng khối câu hỏi để tạo nội dung HTML
        question_number = 1
        for block in all_question_blocks:
            question_text_parts = []
            choices_text_parts = []
            
            for para in block:
                para_text = ''.join(para.itertext()).strip()
                if re.match(r'^[A-D]\.', para_text) or re.match(r'^[a-d]\)', para_text):
                    choices_text_parts.append(para_text)
                elif not para_text.lower().startswith('đáp án:'):
                    question_text_parts.append(para_text)

            full_question_text = ' '.join(question_text_parts)
            full_question_text = re.sub(r'^câu\s*\d+\s*[:.]?\s*', '', full_question_text, re.IGNORECASE).strip()

            slide_content = f"<h2>Câu {question_number}</h2><p>{full_question_text}</p>"
            if choices_text_parts:
                slide_content += "<ul>"
                for choice in choices_text_parts:
                    slide_content += f'<li class="fragment">{choice}</li>'
                slide_content += "</ul>"
            
            slides_html_content.append(slide_content)
            question_number += 1
            
        return json.dumps(slides_html_content)
        
    except Exception as e:
        return json.dumps({"error": f"Lỗi phía Python: {str(e)}"})