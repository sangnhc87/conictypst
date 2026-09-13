#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Master Generator & Compiler for Grade 10 Exam Beamers (102 Exams across 34 Lessons).
Converts all 102 exam files in typst/sach/de-on-tap-theo-chuong-k10/ into interactive Beamer presentations.
Outputs:
  - typst/beamer/khoi-10/de-thi/*.typ
  - web-app/public/pdfs/*.pdf
  - web-app/public/data.json (updated with full exam metadata)
"""

import os
import re
import sys
import json
import subprocess
from concurrent.futures import ProcessPoolExecutor, as_completed
import fitz  # PyMuPDF

BASE_EXAM_DIR = "typst/sach/de-on-tap-theo-chuong-k10"
OUTPUT_BEAMER_DIR = "typst/beamer/khoi-10/de-thi"
OUTPUT_PDF_DIR = "web-app/public/pdfs"
DATA_JSON_PATH = "web-app/public/data.json"

LESSON_MAPPING = [
    # Chapter 1: Mệnh đề và tập hợp
    ("10-1-1", 1, 1, "Bài 1: Mệnh đề", "Chương 1: Mệnh đề và tập hợp", "chuong1-menh-de-tap-hop", ["de01A.typ", "de01B.typ", "de01C.typ"]),
    ("10-1-2", 1, 2, "Bài 2: Tập hợp và các phép toán", "Chương 1: Mệnh đề và tập hợp", "chuong1-menh-de-tap-hop", ["de02A.typ", "de02B.typ", "de02C.typ"]),
    ("10-1-3", 1, 3, "Bài tập Cuối Chương I: Mệnh đề & Tập hợp", "Chương 1: Mệnh đề và tập hợp", "chuong1-menh-de-tap-hop", ["de02D.typ", "de02E.typ", "de02F.typ"]),

    # Chapter 2: Bất phương trình và hệ bất phương trình bậc nhất hai ẩn
    ("10-2-1", 2, 1, "Bài 1: Bất phương trình bậc nhất hai ẩn", "Chương 2: Bất phương trình & hệ BPT", "chuong2-bat-phuong-trinh-he-bpt-bac-nhat-hai-an", ["de03A.typ", "de03B.typ", "de03C.typ"]),
    ("10-2-2", 2, 2, "Bài 2: Hệ bất phương trình bậc nhất hai ẩn", "Chương 2: Bất phương trình & hệ BPT", "chuong2-bat-phuong-trinh-he-bpt-bac-nhat-hai-an", ["de04A.typ", "de04B.typ", "de04C.typ"]),
    ("10-2-3", 2, 3, "Bài tập Cuối Chương II: Bất phương trình & Hệ BPT", "Chương 2: Bất phương trình & hệ BPT", "chuong2-bat-phuong-trinh-he-bpt-bac-nhat-hai-an", ["de04D.typ", "de04E.typ", "de04F.typ"]),

    # Chapter 3: Hệ thức lượng trong tam giác
    ("10-3-1", 3, 1, "Bài 1: Giá trị lượng giác của một góc từ 0° đến 180°", "Chương 3: Hệ thức lượng trong tam giác", "chuong3-he-thuc-luong-trong-tam-giac", ["de05A.typ", "de05B.typ", "de05C.typ"]),
    ("10-3-2", 3, 2, "Bài 2: Định lí côsin và định lí sin trong tam giác", "Chương 3: Hệ thức lượng trong tam giác", "chuong3-he-thuc-luong-trong-tam-giac", ["de06A.typ", "de06B.typ", "de06C.typ"]),
    ("10-3-3", 3, 3, "Bài tập Cuối Chương III: Hệ thức lượng trong tam giác", "Chương 3: Hệ thức lượng trong tam giác", "chuong3-he-thuc-luong-trong-tam-giac", ["de06D.typ", "de06E.typ", "de06F.typ"]),

    # Chapter 4: Vectơ
    ("10-4-1", 4, 1, "Bài 1: Khái niệm vectơ", "Chương 4: Vectơ", "chuong4-vecto", ["de07A.typ", "de07B.typ", "de07C.typ"]),
    ("10-4-2", 4, 2, "Bài 2: Tổng và hiệu của hai vectơ", "Chương 4: Vectơ", "chuong4-vecto", ["de08A.typ", "de08B.typ", "de08C.typ"]),
    ("10-4-3", 4, 3, "Bài 3: Tích của một số với một vectơ", "Chương 4: Vectơ", "chuong4-vecto", ["de09A.typ", "de09B.typ", "de09C.typ"]),
    ("10-4-4", 4, 4, "Bài 4: Tích vô hướng của hai vectơ", "Chương 4: Vectơ", "chuong4-vecto", ["de10A.typ", "de10B.typ", "de10C.typ"]),
    ("10-4-5", 4, 5, "Bài tập Cuối Chương IV: Vectơ", "Chương 4: Vectơ", "chuong4-vecto", ["de11A.typ", "de11B.typ", "de11C.typ"]),

    # Chapter 5: Các số đặc trưng
    ("10-5-1", 5, 1, "Bài 1: Số gần đúng, sai số và các số đặc trưng đo xu thế trung tâm", "Chương 5: Các số đặc trưng của mẫu số liệu", "chuong5-cac-so-dac-trung-do-xu-the-trung-tam-va-do-do-phan-tan", ["de13A.typ", "de13B.typ", "de13C.typ"]),
    ("10-5-2", 5, 2, "Bài 2: Các số đặc trưng đo độ phân tán của mẫu số liệu", "Chương 5: Các số đặc trưng của mẫu số liệu", "chuong5-cac-so-dac-trung-do-xu-the-trung-tam-va-do-do-phan-tan", ["de14A.typ", "de14B.typ", "de14C.typ"]),
    ("10-5-3", 5, 3, "Bài tập Cuối Chương V: Các số đặc trưng của mẫu số liệu", "Chương 5: Các số đặc trưng của mẫu số liệu", "chuong5-cac-so-dac-trung-do-xu-the-trung-tam-va-do-do-phan-tan", ["de15A.typ", "de15B.typ", "de15C.typ"]),

    # Chapter 6: Hàm số, đồ thị và ứng dụng
    ("10-6-1", 6, 1, "Bài 1: Khái niệm hàm số và đồ thị", "Chương 6: Hàm số, đồ thị và ứng dụng", "chuong6-ham-so-do-thi-va-ung-dung", ["de16A.typ", "de16B.typ", "de16C.typ"]),
    ("10-6-2", 6, 2, "Bài 2: Hàm số bậc hai", "Chương 6: Hàm số, đồ thị và ứng dụng", "chuong6-ham-so-do-thi-va-ung-dung", ["de17A.typ", "de17B.typ", "de17C.typ"]),
    ("10-6-3", 6, 3, "Bài 3: Dấu của tam thức bậc hai", "Chương 6: Hàm số, đồ thị và ứng dụng", "chuong6-ham-so-do-thi-va-ung-dung", ["de18A.typ", "de18B.typ", "de18C.typ"]),
    ("10-6-4", 6, 4, "Bài 4: Phương trình quy về phương trình bậc hai", "Chương 6: Hàm số, đồ thị và ứng dụng", "chuong6-ham-so-do-thi-va-ung-dung", ["de19A.typ", "de19B.typ", "de19C.typ"]),
    ("10-6-5", 6, 5, "Bài 5: Bài tập cuối chương VI", "Chương 6: Hàm số, đồ thị và ứng dụng", "chuong6-ham-so-do-thi-va-ung-dung", ["de20A.typ", "de20B.typ", "de20C.typ"]),

    # Chapter 7: Phương pháp tọa độ trong mặt phẳng
    ("10-7-1", 7, 1, "Bài 1: Phương trình đường thẳng", "Chương 7: Phương pháp toạ độ trong mặt phẳng", "chuong7-phuong-phap-toa-do-trong-mat-phang", ["de21A.typ", "de21B.typ", "de21C.typ"]),
    ("10-7-2", 7, 2, "Bài 2: Vị trí tương đối, góc và khoảng cách", "Chương 7: Phương pháp toạ độ trong mặt phẳng", "chuong7-phuong-phap-toa-do-trong-mat-phang", ["de22A.typ", "de22B.typ", "de22C.typ"]),
    ("10-7-3", 7, 3, "Bài 3: Đường tròn trong mặt phẳng tọa độ", "Chương 7: Phương pháp toạ độ trong mặt phẳng", "chuong7-phuong-phap-toa-do-trong-mat-phang", ["de23A.typ", "de23B.typ", "de23C.typ"]),
    ("10-7-4", 7, 4, "Bài 4: Ba đường conic trong mặt phẳng tọa độ", "Chương 7: Phương pháp toạ độ trong mặt phẳng", "chuong7-phuong-phap-toa-do-trong-mat-phang", ["de24A.typ", "de24B.typ", "de24C.typ"]),
    ("10-7-5", 7, 5, "Bài 5: Bài tập cuối chương VII", "Chương 7: Phương pháp toạ độ trong mặt phẳng", "chuong7-phuong-phap-toa-do-trong-mat-phang", ["de25A.typ", "de25B.typ", "de25C.typ"]),

    # Chapter 8: Đại số tổ hợp
    ("10-8-1", 8, 1, "Bài 1: Quy tắc đếm", "Chương 8: Đại số tổ hợp", "chuong8-dai-so-to-hop", ["de26A.typ", "de26B.typ", "de26C.typ"]),
    ("10-8-2", 8, 2, "Bài 2: Hoán vị, chỉnh hợp và tổ hợp", "Chương 8: Đại số tổ hợp", "chuong8-dai-so-to-hop", ["de27A.typ", "de27B.typ", "de27C.typ"]),
    ("10-8-3", 8, 3, "Bài 3: Nhị thức Newton", "Chương 8: Đại số tổ hợp", "chuong8-dai-so-to-hop", ["de28A.typ", "de28B.typ", "de28C.typ"]),
    ("10-8-4", 8, 4, "Bài tập cuối chương VIII", "Chương 8: Đại số tổ hợp", "chuong8-dai-so-to-hop", ["de29A.typ", "de29B.typ", "de29C.typ"]),

    # Chapter 9: Tính xác suất theo định nghĩa cổ điển
    ("10-9-1", 9, 1, "Bài 1: Biến cố và định nghĩa cổ điển của xác suất", "Chương 9: Tính xác suất theo định nghĩa cổ điển", "chuong9-tinh-xac-suat-theo-dinh-nghia-co-dien", ["de30A.typ", "de30B.typ", "de30C.typ"]),
    ("10-9-2", 9, 2, "Bài 2: Thực hành tính xác suất cổ điển", "Chương 9: Tính xác suất theo định nghĩa cổ điển", "chuong9-tinh-xac-suat-theo-dinh-nghia-co-dien", ["de31A.typ", "de31B.typ", "de31C.typ"]),
    ("10-9-3", 9, 3, "Bài tập cuối chương IX", "Chương 9: Tính xác suất theo định nghĩa cổ điển", "chuong9-tinh-xac-suat-theo-dinh-nghia-co-dien", ["de32A.typ", "de32B.typ", "de32C.typ"]),
]

def clean_preamble(content):
    """Extract metadata and custom helper functions from exam preamble."""
    idx_make = content.find("#let make-questions")
    if idx_make == -1:
        return "ĐỀ THI ÔN TẬP TOÁN 10", "TOÁN 10", "101", ""
    preamble = content[:idx_make]

    # Metadata extraction
    m_title = re.search(r'exam-title:\s*"([^"]+)"', preamble)
    title = m_title.group(1) if m_title else "ĐỀ THI ÔN TẬP TOÁN 10"

    m_school = re.search(r'school:\s*"([^"]+)"', preamble)
    school = m_school.group(1) if m_school else "TOÁN 10"

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

    # Clean up empty comments lines
    preamble = re.sub(r"//\s*═{5,}[^\n]*\n?", "", preamble)
    preamble = re.sub(r"//\s*CẤU HÌNH ĐỀ THI[^\n]*\n?", "", preamble)
    preamble = re.sub(r"//\s*TIÊU ĐỀ ĐỀ THI[^\n]*\n?", "", preamble)
    preamble = re.sub(r"//\s*HÀM RENDER NỘI DUNG ĐỀ THI[^\n]*\n?", "", preamble)

    return title, school, code, preamble.strip()

def transform_exam_file(src_path, lesson_id, de_index, main_title, chapter_num, lesson_num):
    """Parses a source exam file and generates a standalone interactive Beamer file."""
    with open(src_path, "r", encoding="utf-8") as f:
        content = f.read()

    title, school, code, helpers = clean_preamble(content)

    # Extract make-questions body
    start_idx = content.find("#let make-questions")
    if start_idx == -1:
        raise ValueError(f"Could not find #let make-questions in {src_path}")

    body_start = content.find("[", start_idx) + 1
    end_call = content.rfind("#make-questions")
    end_idx = content.rfind("]", 0, end_call)
    body = content[body_start:end_idx].strip()

    # Sanitize accidental premature tuple closure on options lines
    def fix_mismatched_paren(match):
        line = match.group(0)
        if line.count("(") < line.count(")"):
            return re.sub(r"\]\)\s*,", "],", line)
        return line

    body = re.sub(r"^[ \t]*\[.+?\]\)\s*,", fix_mismatched_paren, body, flags=re.MULTILINE)

    stem_name = os.path.splitext(os.path.basename(src_path))[0]
    de_label = f"Đề {de_index} ({stem_name[-1]}) — Mã {code}"

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
// Lớp: Khối 10  ·  Mã đề: {code}  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "../../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

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
    out_typ_name = f"beamer-10-c{chapter_num}-b{lesson_num}-{stem_name}.typ"
    out_typ_path = os.path.join(OUTPUT_BEAMER_DIR, out_typ_name)
    out_pdf_name = f"beamer-10-c{chapter_num}-b{lesson_num}-{stem_name}.pdf"
    out_pdf_path = os.path.join(OUTPUT_PDF_DIR, out_pdf_name)

    with open(out_typ_path, "w", encoding="utf-8") as f:
        f.write(beamer_src)

    display_title = f"{main_title} — Đề {de_index} (Mã {code})"

    meta_entry = {
        "id": f"{lesson_id}-de{de_index}",
        "title": display_title,
        "grade": 10,
        "chapter": chapter_num,
        "chapterTitle": LESSON_MAPPING[0][4] if False else None,  # Will be set in caller
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
    print("🚀 BẮT ĐẦU TẠO 102 BEAMER ĐỀ THI KHỐI 10 (3 ĐỀ / BÀI)")
    print("══════════════════════════════════════════════════════════════")

    tasks_to_compile = []
    all_exam_metadata = []

    for lid, ch, les, main_t, ch_t, folder, de_files in LESSON_MAPPING:
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
    print(f"📊 KẾT QUẢ BIÊN DỊCH: {success_count} THÀNH CÔNG, {fail_count} THẤT BẠI / Tổng {len(tasks_to_compile)}")
    print("══════════════════════════════════════════════════════════════")

    if fail_count > 0:
        print("Có lỗi xảy ra trong quá trình biên dịch! Dừng cập nhật data.json.")
        sys.exit(1)

    # Update web-app/public/data.json
    print(f"📝 Đang cập nhật {DATA_JSON_PATH}...")
    with open(DATA_JSON_PATH, "r", encoding="utf-8") as f:
        existing_data = json.load(f)

    # Filter out any old exam entries if present
    cleaned_data = [item for item in existing_data if not str(item.get("id", "")).endswith(("-de1", "-de2", "-de3"))]
    
    # We want to interleave or cleanly append exams right under their respective lesson
    # Let's create an ordered list:
    lesson_exam_map = {}
    for meta in all_exam_metadata:
        parent_id = meta["id"].rsplit("-de", 1)[0]
        lesson_exam_map.setdefault(parent_id, []).append(meta)

    final_data = []
    for item in cleaned_data:
        final_data.append(item)
        iid = item.get("id")
        if iid in lesson_exam_map:
            for exam_item in lesson_exam_map[iid]:
                final_data.append(exam_item)

    # Also add any exams whose parents weren't found
    existing_ids = {x["id"] for x in final_data}
    for meta in all_exam_metadata:
        if meta["id"] not in existing_ids:
            final_data.append(meta)

    with open(DATA_JSON_PATH, "w", encoding="utf-8") as f:
        json.dump(final_data, f, ensure_ascii=False, indent=2)

    print(f"✅ Hoàn tất! Tổng số mục trong data.json: {len(final_data)} (34 bài học chính + 102 đề thi)")

if __name__ == "__main__":
    main()
