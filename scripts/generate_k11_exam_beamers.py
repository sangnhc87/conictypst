#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Master Generator & Compiler for Grade 11 Exam Beamers (61 Exams across 7 Chapters).
Converts all 61 exam files in typst/sach/de-on-tap-theo-chuong-k11/ into interactive Beamer presentations.
Outputs:
  - typst/beamer/khoi-11/de-thi/*.typ
  - web-app/public/pdfs/*.pdf
  - web-app/public/data.json (updated with full K11 exam metadata)
"""

import os
import re
import sys
import json
import subprocess
from concurrent.futures import ProcessPoolExecutor, as_completed
import fitz  # PyMuPDF

BASE_EXAM_DIR = "typst/sach/de-on-tap-theo-chuong-k11"
OUTPUT_BEAMER_DIR = "typst/beamer/khoi-11/de-thi"
OUTPUT_PDF_DIR = "web-app/public/pdfs"
DATA_JSON_PATH = "web-app/public/data.json"

K11_LESSON_MAPPING = [
    # Chapter 1: Lượng giác (6 đề: de01..de06)
    ("11-1-1", 1, 1, "Bài 1: Góc lượng giác & Công thức lượng giác", "Chương 1: Hàm số lượng giác và phương trình lượng giác", "chuong1-luong-giac", ["de01.typ", "de02.typ", "de03.typ"]),
    ("11-1-2", 1, 2, "Bài 2: Hàm số & Phương trình lượng giác", "Chương 1: Hàm số lượng giác và phương trình lượng giác", "chuong1-luong-giac", ["de04.typ", "de05.typ", "de06.typ"]),

    # Chapter 2: Dãy số - Cấp số cộng - Cấp số nhân (15 đề: de01..de15)
    ("11-2-1", 2, 1, "Bài 1: Dãy số và số hạng tổng quát", "Chương 2: Dãy số, cấp số cộng và cấp số nhân", "chuong3-day-so", ["de01.typ", "de02.typ", "de03.typ"]),
    ("11-2-2", 2, 2, "Bài 2: Cấp số cộng & Ứng dụng", "Chương 2: Dãy số, cấp số cộng và cấp số nhân", "chuong3-day-so", ["de04.typ", "de05.typ", "de06.typ"]),
    ("11-2-3", 2, 3, "Bài 3: Cấp số nhân & Cấp số nhân lùi", "Chương 2: Dãy số, cấp số cộng và cấp số nhân", "chuong3-day-so", ["de07.typ", "de08.typ", "de09.typ"]),
    ("11-2-4", 2, 4, "Bài 4: Mô hình thực tế, Chu kỳ & Fractal", "Chương 2: Dãy số, cấp số cộng và cấp số nhân", "chuong3-day-so", ["de10.typ", "de11.typ", "de12.typ"]),
    ("11-2-5", 2, 5, "Bài 5: Công nghệ, Tài chính & Tổng hợp", "Chương 2: Dãy số, cấp số cộng và cấp số nhân", "chuong3-day-so", ["de13.typ", "de14.typ", "de15.typ"]),

    # Chapter 3: Các số đặc trưng mẫu số liệu ghép nhóm (1 đề: de01)
    ("11-3-1", 3, 1, "Bài 1: Các số đặc trưng đo xu thế trung tâm", "Chương 3: Các số đặc trưng của mẫu số liệu ghép nhóm", "chuong6-thong-ke", ["de01.typ"]),

    # Chapter 4: Quan hệ song song trong không gian (10 đề: de01..de10)
    ("11-4-1", 4, 1, "Bài 1: Điểm, đường thẳng & Mặt phẳng trong không gian", "Chương 4: Quan hệ song song trong không gian", "chuong4-quan-he-song-song", ["de01.typ", "de02.typ", "de03.typ"]),
    ("11-4-2", 4, 2, "Bài 2: Hai đường thẳng song song & Đường song song mặt", "Chương 4: Quan hệ song song trong không gian", "chuong4-quan-he-song-song", ["de04.typ", "de05.typ", "de06.typ"]),
    ("11-4-3", 4, 3, "Bài 3: Hai mặt phẳng song song & Phép chiếu", "Chương 4: Quan hệ song song trong không gian", "chuong4-quan-he-song-song", ["de07.typ", "de08.typ", "de09.typ", "de10.typ"]),

    # Chapter 5: Giới hạn & Hàm số liên tục (12 đề: de01..de12)
    ("11-5-1", 5, 1, "Bài 1: Giới hạn của dãy số", "Chương 5: Giới hạn. Hàm số liên tục", "chuong5-gioi-han-ham-so-lien-tuc", ["de01.typ", "de02.typ", "de03.typ"]),
    ("11-5-2", 5, 2, "Bài 2: Giới hạn của hàm số & Dạng vô định", "Chương 5: Giới hạn. Hàm số liên tục", "chuong5-gioi-han-ham-so-lien-tuc", ["de04.typ", "de05.typ", "de06.typ"]),
    ("11-5-3", 5, 3, "Bài 3: Hàm số liên tục & Định lý giá trị trung gian", "Chương 5: Giới hạn. Hàm số liên tục", "chuong5-gioi-han-ham-so-lien-tuc", ["de07.typ", "de08.typ", "de09.typ"]),
    ("11-5-4", 5, 4, "Bài 4: Tổng hợp ôn tập giới hạn & Tổng vô hạn", "Chương 5: Giới hạn. Hàm số liên tục", "chuong5-gioi-han-ham-so-lien-tuc", ["de10.typ", "de11.typ", "de12.typ"]),

    # Chapter 6: Hàm số mũ & Logarit (10 đề: de01..de10)
    ("11-6-1", 6, 1, "Bài 1: Phép tính lũy thừa & Logarit", "Chương 6: Hàm số mũ và hàm số logarit", "chuong2-mu-logarit", ["de01.typ", "de02.typ", "de03.typ"]),
    ("11-6-2", 6, 2, "Bài 2: Hàm số mũ & Mô hình toán học", "Chương 6: Hàm số mũ và hàm số logarit", "chuong2-mu-logarit", ["de04.typ", "de05.typ", "de06.typ"]),
    ("11-6-3", 6, 3, "Bài 3: Phương trình, BPT & Ứng dụng thực tế", "Chương 6: Hàm số mũ và hàm số logarit", "chuong2-mu-logarit", ["de07.typ", "de08.typ", "de09.typ", "de10.typ"]),

    # Chapter 7: Đạo hàm (7 đề: de01..de07)
    ("11-7-1", 7, 1, "Bài 1: Định nghĩa & Quy tắc tính đạo hàm", "Chương 7: Đạo hàm", "chuong7-dao-ham", ["de01.typ", "de02.typ", "de03.typ"]),
    ("11-7-2", 7, 2, "Bài 2: Đạo hàm lượng giác & Cấp hai", "Chương 7: Đạo hàm", "chuong7-dao-ham", ["de04.typ", "de05.typ", "de06.typ"]),
    ("11-7-3", 7, 3, "Bài 3: Phương trình tiếp tuyến & Thực tế", "Chương 7: Đạo hàm", "chuong7-dao-ham", ["de07.typ"]),
]

def clean_preamble(content):
    """Extract metadata and custom helper functions from exam preamble."""
    idx_make = content.find("#let make-questions")
    if idx_make == -1:
        return "ĐỀ THI ÔN TẬP TOÁN 11", "TOÁN 11", "101", ""
    preamble = content[:idx_make]

    # Metadata extraction
    m_title = re.search(r'exam-title:\s*"([^"]+)"', preamble)
    title = m_title.group(1) if m_title else "ĐỀ THI ÔN TẬP TOÁN 11"

    m_school = re.search(r'school:\s*"([^"]+)"', preamble)
    school = m_school.group(1) if m_school else "TOÁN 11"

    m_code = re.search(r'code:\s*"([^"]+)"', preamble)
    code = m_code.group(1) if m_code else "101"

    # Remove #show: thpt-school-exam.with(...)
    pos_show = preamble.find("#show: thpt-school-exam")
    if pos_show != -1:
        p_start = preamble.find("(", pos_show)
        if p_start != -1:
            depth = 1
            i = p_start + 1
            while i < len(preamble) and depth > 0:
                if preamble[i] == "(":
                    depth += 1
                elif preamble[i] == ")":
                    depth -= 1
                i += 1
            preamble = preamble[:pos_show] + preamble[i:]

    # Remove standard boilerplate
    preamble = re.sub(r"#import\s+[^\n]+\n?", "", preamble)
    preamble = re.sub(r"#let\s+mode\s*=\s*[^\n]+\n?", "", preamble)
    preamble = re.sub(r"#let\s+accent\s*=\s*[^\n]+\n?", "", preamble)
    preamble = re.sub(r"#show\s+math\.cases:[^\n]+\n?", "", preamble)
    preamble = re.sub(r"#let\s+\(tn,\s*ds,\s*tln,\s*tl\)\s*=\s*[^\n]+\n?", "", preamble)
    preamble = re.sub(r"#show\s+math\.equation:\s*set\s+text\([^\)]+\)\n?", "", preamble)

    # Clean up empty comments lines
    preamble = re.sub(r"//\s*═{5,}[^\n]*\n?", "", preamble)
    preamble = re.sub(r"//\s*CẤU HÌNH ĐỀ THI[^\n]*\n?", "", preamble)
    preamble = re.sub(r"//\s*TIÊU ĐỀ ĐỀ THI[^\n]*\n?", "", preamble)
    preamble = re.sub(r"//\s*HÀM RENDER NỘI DUNG ĐỀ THI[^\n]*\n?", "", preamble)

    return title, school, code, preamble.strip()

def strip_draft_helpers(body):
    """Strips draft #let _ds... = [ ... ] helper blocks from question body."""
    pattern = re.compile(r"#let\s+_ds\d*\s*=\s*\[")
    while True:
        m = pattern.search(body)
        if not m:
            break
        start = m.start()
        depth = 1
        i = m.end()
        while i < len(body) and depth > 0:
            if body[i] == "[":
                depth += 1
            elif body[i] == "]":
                depth -= 1
            i += 1
        body = body[:start] + body[i:]
    return body

def transform_exam_file(src_path, lesson_id, de_index, main_title, chapter_num, lesson_num):
    """Parses a source exam file and generates a standalone interactive Beamer file."""
    with open(src_path, "r", encoding="utf-8") as f:
        content = f.read()

    title, school, code, helpers = clean_preamble(content)

    # If code is N/A or missing, generate a standard 3-digit code
    if code == "N/A" or not code:
        code = f"{chapter_num}0{de_index}" if de_index < 10 else f"{chapter_num}{de_index}"

    # Extract make-questions body
    start_idx = content.find("#let make-questions")
    if start_idx == -1:
        raise ValueError(f"Could not find #let make-questions in {src_path}")

    body_start = content.find("[", start_idx) + 1
    end_call = content.rfind("#make-questions")
    end_idx = content.rfind("]", 0, end_call)
    body = content[body_start:end_idx].strip()

    # Strip draft helper blocks
    body = strip_draft_helpers(body)

    stem_name = os.path.splitext(os.path.basename(src_path))[0]
    de_label = f"Đề {de_index} ({stem_name}) — Mã {code}"

    # Replace questions with sequential numbering 1..22
    q_counter = {"val": 1}
    def replace_q(m):
        fn = m.group(1)
        res = f'#lt-{fn}(num: {q_counter["val"]}, de: [{de_label}], back-to: "sec-exercise-hub",'
        q_counter["val"] += 1
        return res

    transformed_body = re.sub(r'#(tn|ds|tln)\s*\(', replace_q, body)
    total_q = q_counter["val"] - 1

    beamer_src = f"""// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: {title}
// Lớp: Khối 11  ·  Mã đề: {code}  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{{", ..args.named(), ..args.pos().map(math.display))
#let notin = sym.in.not
#let cap = math.inter
#let cup = math.union
#let setminus = math.without
#let subset = math.subset
#let emptyset = math.emptyset
#let True(body) = ("true": true, body: body)
#let accent = rgb("#0057b8")

{helpers}

#show: lecture-theme.with(
  title: "{title}",
  subtitle: "{school} — MÃ ĐỀ: {code}",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  base-size: 18pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#lt-toc(title: [🗺️ CẤU TRÚC ĐỀ THI & ĐIỀU HƯỚNG])

// ── BẢNG ĐIỀU HƯỚNG 22 CÂU HỎI ────────────────────────────
#slide(title: none)[
  #[#metadata(none) #label("sec-exercise-hub")]
  #context {{
    let s = _lec-style.get()
    v(-0.4em)
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      box(fill: s.accent, inset: (x: 10pt, y: 5pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 11pt)[📋 MA TRẬN ĐIỀU HƯỚNG 22 CÂU HỎI]
      ],
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: {code}]],
      lt-nav-btn("lec-toc-main", icon: "◀", txt: "Mục lục chính")
    )
    v(0.4em)

    // Phần I: 12 câu TN (Lưới 6x2)
    block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#1d4ed8"))[🎯 PHẦN I: TRẮC NGHIỆM 4 LỰA CHỌN (Câu 1 -> 12)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12).map(i => {{
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#3b82f6"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#1d4ed8"))[Câu #i]]
            )
          ]
        }})
      )
    ]

    v(0.3em)

    // Phần II: 4 câu Đúng/Sai (Lưới 4x1)
    block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#e9d5ff"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#7e22ce"))[📝 PHẦN II: TRẮC NGHIỆM ĐÚNG / SAI (Câu 13 -> 16 — Mỗi câu 4 ý a, b, c, d)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        gutter: 6pt,
        ..(13, 14, 15, 16).map(i => {{
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#a855f7"),
              inset: (y: 4.5pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#7e22ce"))[Câu #i (Đ/S)]]
            )
          ]
        }})
      )
    ]

    v(0.3em)

    // Phần III: 6 câu Trả lời ngắn (Lưới 6x1)
    block(fill: rgb("#ecfeff"), stroke: 1pt + rgb("#a5f3fc"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#0e7490"))[🔢 PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (Câu 17 -> 22)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(17, 18, 19, 20, 21, 22).map(i => {{
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#06b6d4"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#0e7490"))[Câu #i]]
            )
          ]
        }})
      )
    ]
  }}
]

#let exam-part(title, count: none) = {{
  slide(title: none)[
    #align(center + horizon)[
      #block(fill: rgb("#eff6ff"), stroke: 2pt + rgb("#2563eb"), inset: 18pt, radius: 10pt, width: 85%)[
        #text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[#title]
      ]
    ]
  ]
}}

// ── NỘI DUNG 22 CÂU HỎI THỰC CHIẾN ─────────────────────────
{transformed_body}

// ── CỘT MỐC HOÀN THÀNH ─────────────────────────────────────
#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 24pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH {title.upper()}!]\
      #v(0.6em)
      #text(fill: white, size: 14pt)[
        Bạn đã hoàn thành xuất sắc toàn bộ 22 câu hỏi của đề thi!\
        Chúc các em tự tin đạt điểm số tối đa trong kỳ thi chính thức!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 12pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
      ]
      #v(0.8em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 11pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
"""
    # Output paths
    out_typ_name = f"beamer-11-c{chapter_num}-b{lesson_num}-{stem_name}.typ"
    out_typ_path = os.path.join(OUTPUT_BEAMER_DIR, out_typ_name)
    out_pdf_name = f"beamer-11-c{chapter_num}-b{lesson_num}-{stem_name}.pdf"
    out_pdf_path = os.path.join(OUTPUT_PDF_DIR, out_pdf_name)

    with open(out_typ_path, "w", encoding="utf-8") as f:
        f.write(beamer_src)

    display_title = f"{main_title} — Đề {de_index} (Mã {code})"

    meta_entry = {
        "id": f"{lesson_id}-de{de_index}",
        "title": display_title,
        "grade": 11,
        "chapter": chapter_num,
        "chapterTitle": None,  # Set in caller
        "lesson_num": lesson_num,
        "type": "exam",
        "code": code,
        "source_stem": stem_name,
        "file": f"/pdfs/{out_pdf_name}"
    }

    return out_typ_path, out_pdf_path, total_q, meta_entry

def compile_single_beamer(item):
    """Compiles one typst beamer to PDF and audits links/pages."""
    out_typ_path, out_pdf_path, expected_q = item
    cmd = ["typst", "compile", "--root", ".", out_typ_path, out_pdf_path]
    res = subprocess.run(cmd, capture_output=True, text=True)
    if res.returncode != 0:
        return {
            "path": out_typ_path,
            "success": False,
            "error": res.stderr
        }

    # Audit with PyMuPDF
    try:
        doc = fitz.open(out_pdf_path)
        pages = len(doc)
        total_links = sum(len(p.get_links()) for p in doc)
        doc.close()
        return {
            "path": out_typ_path,
            "pdf": out_pdf_path,
            "success": True,
            "pages": pages,
            "links": total_links
        }
    except Exception as e:
        return {
            "path": out_typ_path,
            "success": False,
            "error": str(e)
        }

def main():
    os.makedirs(OUTPUT_BEAMER_DIR, exist_ok=True)
    os.makedirs(OUTPUT_PDF_DIR, exist_ok=True)

    print("══════════════════════════════════════════════════════════════")
    print("🚀 BẮT ĐẦU TẠO 61 BEAMER ĐỀ THI KHỐI 11 (22 CÂU/ĐỀ)")
    print("══════════════════════════════════════════════════════════════")

    tasks_to_compile = []
    all_exam_metadata = []

    for lid, ch, les, main_t, ch_t, folder, de_files in K11_LESSON_MAPPING:
        for idx, de_file in enumerate(de_files, start=1):
            src_path = os.path.join(BASE_EXAM_DIR, folder, de_file)
            out_typ, out_pdf, total_q, meta = transform_exam_file(
                src_path, lid, idx, main_t, ch, les
            )
            meta["chapterTitle"] = ch_t
            tasks_to_compile.append((out_typ, out_pdf, total_q))
            all_exam_metadata.append(meta)

    print(f"✅ Đã tạo {len(tasks_to_compile)} file Typst Beamer trong {OUTPUT_BEAMER_DIR}")
    print(f"⚡ Đang biên dịch song song với ProcessPoolExecutor (max_workers=8)...")

    success_count = 0
    fail_count = 0

    with ProcessPoolExecutor(max_workers=8) as executor:
        futures = {executor.submit(compile_single_beamer, task): task for task in tasks_to_compile}
        for future in as_completed(futures):
            res = future.result()
            base_typ = os.path.basename(res["path"])
            if res["success"]:
                success_count += 1
                if success_count % 10 == 0 or success_count == len(tasks_to_compile):
                    print(f"  [✓ {success_count:3d}/{len(tasks_to_compile)}] {base_typ} -> {res['pages']} trang, {res['links']} liên kết")
            else:
                fail_count += 1
                print(f"  [✗ THẤT BẠI] {base_typ}:\n{res['error'][:400]}")

    print("\n══════════════════════════════════════════════════════════════")
    print(f"📊 KẾT QUẢ BIÊN DỊCH K11: {success_count} THÀNH CÔNG, {fail_count} THẤT BẠI / Tổng {len(tasks_to_compile)}")
    print("══════════════════════════════════════════════════════════════")

    if fail_count > 0:
        print("Có lỗi xảy ra trong quá trình biên dịch! Dừng cập nhật data.json.")
        sys.exit(1)

    # Update web-app/public/data.json
    print(f"📝 Đang cập nhật {DATA_JSON_PATH}...")
    with open(DATA_JSON_PATH, "r", encoding="utf-8") as f:
        existing_data = json.load(f)

    # Filter out any old k11 exam entries if present
    cleaned_data = [item for item in existing_data if not (item.get("grade") == 11 and item.get("type") == "exam")]
    cleaned_data.extend(all_exam_metadata)

    with open(DATA_JSON_PATH, "w", encoding="utf-8") as f:
        json.dump(cleaned_data, f, ensure_ascii=False, indent=2)

    print(f"🎉 HOÀN TẤT! Đã bổ sung {len(all_exam_metadata)} đề thi Khối 11 vào {DATA_JSON_PATH}")

if __name__ == "__main__":
    main()
