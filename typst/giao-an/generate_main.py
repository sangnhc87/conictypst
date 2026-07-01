import os, glob, unicodedata

base_dir = '/Users/admin/conictypst/typst/giao-an'

CHUONG_MAP = {
    '10': [
        ('Chương 1. Mệnh đề và tập hợp', list(range(1, 3))),
        ('Chương 2. Bất phương trình bậc nhất hai ẩn', [3, 4]),
        ('Chương 3. Hệ thức lượng trong tam giác và vectơ', list(range(5, 12))),
        ('Chương 4. Thống kê', [12, 13, 14]),
        ('Chương 5. Hàm số và đồ thị', [15, 16, 17, 18]),
        ('Chương 6. Hình học trong mặt phẳng tọa độ', list(range(19, 23))),
        ('Chương 7. Tổ hợp và xác suất', list(range(23, 28))),
    ],
    '11': [
        ('Chương 1. Hàm số lượng giác và phương trình lượng giác', list(range(1, 5))),
        ('Chương 2. Dãy số và cấp số', list(range(5, 9))),
        ('Chương 3. Thống kê', [9]),
        ('Chương 4. Giới hạn và hàm số liên tục', list(range(15, 18))),
        ('Chương 5. Hàm số mũ và lôgarit', [18, 19, 20, 21]),
        ('Chương 6. Đạo hàm', list(range(31, 34))),
        ('Chương 7. Hình học không gian', list(range(10, 16)) + list(range(22, 28))),
        ('Chương 8. Xác suất', list(range(28, 32))),
    ],
    '12': [
        ('Chương 1. Ứng dụng đạo hàm vào khảo sát hàm số', list(range(1, 6))),
        ('Chương 2. Thống kê', list(range(8, 11))),
        ('Chương 3. Nguyên hàm và tích phân', list(range(11, 14))),
        ('Chương 4. Hình học không gian', list(range(14, 18))),
        ('Chương 5. Xác suất', list(range(18, 20))),
    ],
}

def nfc(s): return unicodedata.normalize('NFC', s)
BAI_MARKER  = nfc('bài ')
CHUONG_MARKER = nfc('chương ')

def get_ten_bai(filepath):
    try:
        for line in open(filepath, encoding='utf-8'):
            if 'ten-bai:' in line and '"' in line:
                parts = line.split('"')
                if len(parts) >= 2:
                    return nfc(parts[1])
    except: pass
    return os.path.basename(filepath).replace('.typ', '')

def get_bai_so(ten_bai):
    lower = nfc(ten_bai).lower()
    for marker in [BAI_MARKER, 'bai ']:
        idx = lower.find(marker)
        if idx >= 0:
            rest = nfc(ten_bai)[idx + len(marker):].strip().lstrip('.')
            num_str = ''
            for ch in rest:
                if ch.isdigit(): num_str += ch
                else: break
            if num_str: return int(num_str)
    return 9999

def get_on_tap_chuong(ten_bai):
    """Return chapter number if this is an 'Ôn tập chương X' file, else None."""
    lower = nfc(ten_bai).lower()
    for prefix in [nfc('ôn tập chương '), 'on tap chuong ']:
        if lower.startswith(prefix):
            rest = lower[len(prefix):].strip()
            num_str = ''
            for ch in rest:
                if ch.isdigit(): num_str += ch
                else: break
            if num_str: return int(num_str)
    return None


for grade, khoi in [('khoi-10','10'),('khoi-11','11'),('khoi-12','12')]:
    grade_dir = os.path.join(base_dir, grade)

    # Use unified template
    bia_content = f'#import "../modules/bia.typ": render-bia\n#render-bia("Khối {khoi}")\n'
    open(os.path.join(grade_dir, 'bia.typ'), 'w', encoding='utf-8').write(bia_content)

    all_files = sorted(glob.glob(f"{grade_dir}/*.typ"))
    math_files = [
        f for f in all_files
        if os.path.basename(f) not in ('bia.typ', 'main.typ')
        and '-tn-' not in os.path.basename(f)
        and '-hdthtn-' not in os.path.basename(f)
    ]

    bai_map    = {}   # bai_so -> [(fp, ten)]
    on_tap_map = {}   # chuong_so -> [(fp, ten)]
    misc_list  = []   # (fp, ten) for files that don't fit either

    for fp in math_files:
        ten = get_ten_bai(fp)
        bai_so = get_bai_so(ten)
        ct_so  = get_on_tap_chuong(ten)

        if bai_so != 9999:
            bai_map.setdefault(bai_so, []).append((fp, ten))
        elif ct_so is not None:
            on_tap_map.setdefault(ct_so, []).append((fp, ten))
        else:
            misc_list.append((fp, ten))

    header = f"""#set document(title: "Giáo án Toán Khối {khoi}")
#include "bia.typ"

#set page(numbering: "– 1 –", number-align: center)
#set text(font: "Times New Roman", lang: "vi")

#show outline.entry.where(level: 1): it => {{
  v(10pt, weak: true)
  text(size: 12pt, weight: "bold", fill: rgb("0a2342"))[#it]
}}
#show outline.entry.where(level: 2): it => {{
  h(12pt)
  text(size: 11pt)[#it]
}}

#outline(
  title: align(center)[
    #v(4mm)
    #text(size: 16pt, weight: "bold")[MỤC LỤC]
    #v(6mm)
  ],
  depth: 2,
)
#pagebreak()
"""
    lines = [header]
    used_bai = set()
    used_ct  = set()

    for idx, (chuong_name, bai_list) in enumerate(CHUONG_MAP.get(khoi, []), start=1):
        bais = []
        for bai_so in sorted(bai_list):
            if bai_so in bai_map:
                for fp, ten in bai_map[bai_so]:
                    bais.append((os.path.basename(fp), ten))
                used_bai.add(bai_so)
        if idx in on_tap_map:
            for fp, ten in on_tap_map[idx]:
                bais.append((os.path.basename(fp), ten))
            used_ct.add(idx)

        if bais:
            lines.append('#pagebreak(weak: true)')
            lines.append('#align(center + horizon)[')
            lines.append(f'  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[{chuong_name}]')
            lines.append(']')
            lines.append(f'#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[{chuong_name}])')
            for fname, ten in bais:
                lines.append(f'#include "{fname}"')
                lines.append('')

    leftover = (
        [(fp, ten) for so, items in sorted(bai_map.items()) if so not in used_bai for fp, ten in items] +
        [(fp, ten) for so, items in sorted(on_tap_map.items()) if so not in used_ct for fp, ten in items] +
        misc_list
    )
    if leftover:
        lines.append('#pagebreak(weak: true)')
        lines.append('#align(center + horizon)[')
        lines.append('  #text(size: 22pt, weight: "bold", fill: rgb("#0F4C81"))[Bài bổ sung và ôn tập cuối kỳ]')
        lines.append(']')
        lines.append('#box(width: 0pt, height: 0pt, clip: true, heading(level: 1, outlined: true)[Bài bổ sung và ôn tập cuối kỳ])')
        for fp, ten in leftover:
            lines.append(f'#include "{os.path.basename(fp)}"')
            lines.append('')

    open(os.path.join(grade_dir, 'main.typ'), 'w', encoding='utf-8').write('\n'.join(lines))
    nc = len([l for l in lines if l.startswith('= ')])
    tot = len(math_files)
    print(f"✅ {grade}: {tot} bài → {nc} chương trong mục lục")

print("Done!")
