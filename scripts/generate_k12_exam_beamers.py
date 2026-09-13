#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Master Generator & Compiler for Grade 12 Exam Beamers (27 Chuyên Đề Exams).
Converts all 27 exam files in typst/sach/de-on-tap-theo-chuong-k12/ into interactive Beamer presentations.
Outputs:
  - typst/beamer/khoi-12/de-thi/*.typ
  - web-app/public/pdfs/*.pdf
  - web-app/public/data.json (updated with full K12 exam metadata)
"""

import os
import re
import sys
import json
import subprocess
from concurrent.futures import ProcessPoolExecutor, as_completed
import fitz  # PyMuPDF

BASE_EXAM_DIR = "typst/sach/de-on-tap-theo-chuong-k12"
OUTPUT_BEAMER_DIR = "typst/beamer/khoi-12/de-thi"
OUTPUT_PDF_DIR = "web-app/public/pdfs"
DATA_JSON_PATH = "web-app/public/data.json"

K12_LESSON_MAPPING = [
    # Chuyên đề 1: Bài toán tối ưu hóa trong thực tiễn (9 đề)
    ("12-cd1-1", 5, 1, "Chủ đề 1A-1C: Tối ưu hóa hình học, thể tích & uốn dây", "Chuyên đề 1: Bài toán tối ưu hóa trong thực tiễn", "chuyen-de-1-bai-toan-toi-uu", ["cd01A.typ", "cd01B.typ", "cd01C.typ"]),
    ("12-cd1-2", 5, 2, "Chủ đề 1D-1F: Tối ưu hóa chuyển động, năng lượng & kinh tế", "Chuyên đề 1: Bài toán tối ưu hóa trong thực tiễn", "chuyen-de-1-bai-toan-toi-uu", ["cd01D.typ", "cd01E.typ", "cd01F.typ"]),
    ("12-cd1-3", 5, 3, "Chủ đề 1G-1I: Tối ưu hóa vận tải, kết cấu & liên môn thực tế", "Chuyên đề 1: Bài toán tối ưu hóa trong thực tiễn", "chuyen-de-1-bai-toan-toi-uu", ["cd01G.typ", "cd01H.typ", "cd01I.typ"]),

    # Chuyên đề 2: Ứng dụng toán học trong tài chính (9 đề)
    ("12-cd2-1", 6, 1, "Chủ đề 2A-2C: Lãi đơn, lãi kép, niên kim & trả góp", "Chuyên đề 2: Toán tài chính", "chuyen-de-2-toan-tai-chinh", ["cd02A.typ", "cd02B.typ", "cd02C.typ"]),
    ("12-cd2-2", 6, 2, "Chủ đề 2D-2F: Kế hoạch hưu trí, NPV, IRR & đầu tư", "Chuyên đề 2: Toán tài chính", "chuyen-de-2-toan-tai-chinh", ["cd02D.typ", "cd02E.typ", "cd02F.typ"]),
    ("12-cd2-3", 6, 3, "Chủ đề 2G-2I: Lạm phát, rủi ro danh mục & tình huống doanh nghiệp", "Chuyên đề 2: Toán tài chính", "chuyen-de-2-toan-tai-chinh", ["cd02G.typ", "cd02H.typ", "cd02I.typ"]),

    # Chuyên đề 3: Biến ngẫu nhiên rời rạc & phân phối (9 đề)
    ("12-cd3-1", 7, 1, "Chủ đề 3A-3C: Biến ngẫu nhiên rời rạc, kỳ vọng & phương sai", "Chuyên đề 3: Biến ngẫu nhiên rời rạc", "chuyen-de-3-bien-ngau-nhien-roi-rac", ["cd03A.typ", "cd03B.typ", "cd03C.typ"]),
    ("12-cd3-2", 7, 2, "Chủ đề 3D-3F: Phân phối nhị thức, kiểm định & chẩn đoán y học", "Chuyên đề 3: Biến ngẫu nhiên rời rạc", "chuyen-de-3-bien-ngau-nhien-roi-rac", ["cd03D.typ", "cd03E.typ", "cd03F.typ"]),
    ("12-cd3-3", 7, 3, "Chủ đề 3G-3I: Trò chơi may rủi, kinh doanh & ra quyết định", "Chuyên đề 3: Biến ngẫu nhiên rời rạc", "chuyen-de-3-bien-ngau-nhien-roi-rac", ["cd03G.typ", "cd03H.typ", "cd03I.typ"]),
]

def clean_preamble(content):
    """Extract metadata and custom helper functions from exam preamble."""
    idx_make = content.find("#let make-questions")
    if idx_make == -1:
        return "ĐỀ THI ÔN TẬP TOÁN 12", "TOÁN 12", "501", ""
    preamble = content[:idx_make]

    # Metadata extraction
    m_title = re.search(r'exam-title:\s*"([^"]+)"', preamble)
    title = m_title.group(1) if m_title else "ĐỀ THI ÔN TẬP TOÁN 12"

    m_school = re.search(r'school:\s*"([^"]+)"', preamble)
    school = m_school.group(1) if m_school else "TOÁN 12"

    m_code = re.search(r'code:\s*"([^"]+)"', preamble)
    code = m_code.group(1) if m_code else "501"

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

    body = content[body_start:end_idx].strip()

    stem_name = os.path.splitext(os.path.basename(src_path))[0]
    de_label = f"Đề {stem_name} — Mã {code}"

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
// Lớp: Khối 12  ·  Mã đề: {code}  ·  GV: Nguyễn Văn Sang
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
    out_typ_name = f"beamer-12-c{chapter_num}-b{lesson_num}-{stem_name}.typ"
    out_typ_path = os.path.join(OUTPUT_BEAMER_DIR, out_typ_name)
    out_pdf_name = f"beamer-12-c{chapter_num}-b{lesson_num}-{stem_name}.pdf"
    out_pdf_path = os.path.join(OUTPUT_PDF_DIR, out_pdf_name)

    with open(out_typ_path, "w", encoding="utf-8") as f:
        f.write(beamer_src)

    display_title = f"{main_title} — Đề {stem_name[-1]} (Mã {code})"

    meta_entry = {
        "id": f"{lesson_id}-de{de_index}",
        "title": display_title,
        "grade": 12,
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
    print("🚀 BẮT ĐẦU TẠO 27 BEAMER ĐỀ THI KHỐI 12 CHUYÊN ĐỀ (22 CÂU/ĐỀ)")
    print("══════════════════════════════════════════════════════════════")

    tasks_to_compile = []
    all_exam_metadata = []

    for lid, ch, les, main_t, ch_t, folder, de_files in K12_LESSON_MAPPING:
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
                if success_count % 5 == 0 or success_count == len(tasks_to_compile):
                    print(f"  [✓ {success_count:2d}/{len(tasks_to_compile)}] {base_typ} -> {res['pages']} trang, {res['links']} liên kết")
            else:
                fail_count += 1
                print(f"  [✗ THẤT BẠI] {base_typ}:\n{res['error'][:400]}")

    print("\n══════════════════════════════════════════════════════════════")
    print(f"📊 KẾT QUẢ BIÊN DỊCH K12: {success_count} THÀNH CÔNG, {fail_count} THẤT BẠI / Tổng {len(tasks_to_compile)}")
    print("══════════════════════════════════════════════════════════════")

    if fail_count > 0:
        print("Có lỗi xảy ra trong quá trình biên dịch! Dừng cập nhật data.json.")
        sys.exit(1)

    # Update web-app/public/data.json
    print(f"📝 Đang cập nhật {DATA_JSON_PATH}...")
    with open(DATA_JSON_PATH, "r", encoding="utf-8") as f:
        existing_data = json.load(f)

    # Filter out any old k12 exam entries if present
    cleaned_data = [item for item in existing_data if not (item.get("grade") == 12 and item.get("type") == "exam")]
    cleaned_data.extend(all_exam_metadata)

    with open(DATA_JSON_PATH, "w", encoding="utf-8") as f:
        json.dump(cleaned_data, f, ensure_ascii=False, indent=2)

    print(f"🎉 HOÀN TẤT! Đã bổ sung {len(all_exam_metadata)} đề thi Khối 12 vào {DATA_JSON_PATH}")

if __name__ == "__main__":
    main()
