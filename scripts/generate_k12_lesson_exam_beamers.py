#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Master Generator & Compiler for Grade 12 Lesson Exam Beamers (33 Exams for 11 Core Lessons).
Converts high-quality question files from typst/sach/DECUONG12-HK1/ into interactive Touying Beamer presentations.
Outputs:
  - typst/beamer/khoi-12/de-thi/beamer-12-c*-b*-de*.typ
  - web-app/public/pdfs/beamer-12-c*-b*-de*.pdf
"""

import os
import re
import sys
import json
import subprocess
from concurrent.futures import ProcessPoolExecutor, as_completed
import fitz  # PyMuPDF

OUTPUT_BEAMER_DIR = "typst/beamer/khoi-12/de-thi"
OUTPUT_PDF_DIR = "web-app/public/pdfs"

# 11 lessons x 3 exams = 33 exams
K12_LESSON_EXAMS = [
    # ── CHƯƠNG 1: ỨNG DỤNG ĐẠO HÀM (6 bài x 3 đề = 18 đề) ──
    {
        "lesson_id": "12-1-1",
        "chapter": 1,
        "chapter_title": "Chương 1: Ứng dụng đạo hàm để khảo sát và vẽ đồ thị hàm số",
        "lesson_num": 1,
        "lesson_title": "Bài 1: Tính đơn điệu và cực trị của hàm số",
        "lecture_pdf": "/pdfs/beamer-12-bai-1-tinh-on-dieu-cuc-tri.pdf",
        "exams": [
            ("12-1-1-de1", 1, "501", "Đề 1 — Nhận biết & Thông hiểu", "typst/sach/DECUONG12-HK1/chuong-01/bai01-de2.typ"),
            ("12-1-1-de2", 2, "502", "Đề 2 — Vận dụng & Đồ thị hàm số", "typst/sach/DECUONG12-HK1/chuong-01/bai01-de3.typ"),
            ("12-1-1-de3", 3, "503", "Đề 3 — Nâng cao & Phân hóa", "typst/sach/DECUONG12-HK1/chuong-01/bai01-de4.typ"),
        ]
    },
    {
        "lesson_id": "12-1-2",
        "chapter": 1,
        "chapter_title": "Chương 1: Ứng dụng đạo hàm để khảo sát và vẽ đồ thị hàm số",
        "lesson_num": 2,
        "lesson_title": "Bài 2: Giá trị lớn nhất và giá trị nhỏ nhất của hàm số",
        "lecture_pdf": "/pdfs/beamer-12-bai-2-gtln-gtnn-cua-ham-so.pdf",
        "exams": [
            ("12-1-2-de1", 1, "504", "Đề 1 — Khảo sát GTLN, GTNN trên đoạn", "typst/sach/DECUONG12-HK1/chuong-01/bai02-de3.typ"),
            ("12-1-2-de2", 2, "505", "Đề 2 — GTLN, GTNN trên khoảng và nửa khoảng", "typst/sach/DECUONG12-HK1/chuong-01/bai02-de5.typ"),
            ("12-1-2-de3", 3, "506", "Đề 3 — Bài toán chứa tham số m & Tối ưu hóa", "typst/sach/DECUONG12-HK1/chuong-01/bai02-de6.typ"),
        ]
    },
    {
        "lesson_id": "12-1-3",
        "chapter": 1,
        "chapter_title": "Chương 1: Ứng dụng đạo hàm để khảo sát và vẽ đồ thị hàm số",
        "lesson_num": 3,
        "lesson_title": "Bài 3: Đường tiệm cận của đồ thị hàm số",
        "lecture_pdf": "/pdfs/beamer-12-bai-3-duong-tiem-can.pdf",
        "exams": [
            ("12-1-3-de1", 1, "507", "Đề 1 — Tiệm cận đứng và tiệm cận ngang", "typst/sach/DECUONG12-HK1/chuong-01/bai03-de1.typ"),
            ("12-1-3-de2", 2, "508", "Đề 2 — Tiệm cận xiên & Nhận diện đồ thị", "typst/sach/DECUONG12-HK1/chuong-01/bai03-de2.typ"),
            ("12-1-3-de3", 3, "509", "Đề 3 — Tổng hợp tiệm cận & Bài toán thực tế", "typst/sach/DECUONG12-HK1/chuong-01/bai03-de3.typ"),
        ]
    },
    {
        "lesson_id": "12-1-4",
        "chapter": 1,
        "chapter_title": "Chương 1: Ứng dụng đạo hàm để khảo sát và vẽ đồ thị hàm số",
        "lesson_num": 4,
        "lesson_title": "Bài 4: Khảo sát sự biến thiên và vẽ đồ thị hàm số",
        "lecture_pdf": "/pdfs/beamer-12-bai-4-khao-sat-ve-dothi.pdf",
        "exams": [
            ("12-1-4-de1", 1, "510", "Đề 1 — Khảo sát hàm bậc ba & Nhận diện hệ số", "typst/sach/DECUONG12-HK1/chuong-01/bai04-de1.typ"),
            ("12-1-4-de2", 2, "511", "Đề 2 — Khảo sát hàm phân thức hữu tỉ", "typst/sach/DECUONG12-HK1/chuong-01/bai04-de2.typ"),
            ("12-1-4-de3", 3, "512", "Đề 3 — Tâm đối xứng, trục đối xứng & Đồ thị f'(x)", "typst/sach/DECUONG12-HK1/chuong-01/bai04-de3.typ"),
        ]
    },
    {
        "lesson_id": "12-1-5",
        "chapter": 1,
        "chapter_title": "Chương 1: Ứng dụng đạo hàm để khảo sát và vẽ đồ thị hàm số",
        "lesson_num": 5,
        "lesson_title": "Bài 5: Ứng dụng đạo hàm giải quyết bài toán thực tiễn",
        "lecture_pdf": "/pdfs/beamer-12-bai-5-ung-dung-thuc-tien.pdf",
        "exams": [
            ("12-1-5-de1", 1, "513", "Đề 1 — Bài toán tối ưu kinh tế, chi phí & lợi nhuận", "typst/sach/DECUONG12-HK1/chuong-01/bai05-de1.typ"),
            ("12-1-5-de2", 2, "514", "Đề 2 — Bài toán tối ưu hình học & thiết kế kỹ thuật", "typst/sach/DECUONG12-HK1/chuong-01/bai02-de-thucte.typ"),
            ("12-1-5-de3", 3, "515", "Đề 3 — Chuyển động, vi tích phân và liên môn", "typst/sach/DECUONG12-HK1/chuong-01/bai04-de-thucte.typ"),
        ]
    },
    {
        "lesson_id": "12-1-6",
        "chapter": 1,
        "chapter_title": "Chương 1: Ứng dụng đạo hàm để khảo sát và vẽ đồ thị hàm số",
        "lesson_num": 6,
        "lesson_title": "Bài 6: Tiếp tuyến và sự tương giao của đồ thị hàm số",
        "lecture_pdf": "/pdfs/beamer-12-bai-6-tiep-tuyen-tuong-giao.pdf",
        "exams": [
            ("12-1-6-de1", 1, "516", "Đề 1 — Phương trình tiếp tuyến tại điểm & Đi qua điểm", "typst/sach/DECUONG12-HK1/chuong-01/chuyen-de-tiep-tuyen-tuong-giao.typ"),
            ("12-1-6-de2", 2, "517", "Đề 2 — Biện luận số nghiệm phương trình theo tham số", "typst/sach/ham-so-chuong1/c1-b6-de1.typ"),
            ("12-1-6-de3", 3, "518", "Đề 3 — Tương giao đồ thị bậc ba và phân thức", "typst/sach/ham-so-chuong1/c1-b6-de2.typ"),
        ]
    },

    # ── CHƯƠNG 2: VECTƠ VÀ HỆ TỌA ĐỘ KHÔNG GIAN (3 bài x 3 đề = 9 đề) ──
    {
        "lesson_id": "12-2-1",
        "chapter": 2,
        "chapter_title": "Chương 2: Vectơ và hệ tọa độ trong không gian",
        "lesson_num": 7,
        "lesson_title": "Bài 7: Vectơ và các phép toán trong không gian",
        "lecture_pdf": "/pdfs/beamer-12-bai-7-vecto-trong-khong-gian.pdf",
        "exams": [
            ("12-2-1-de1", 1, "519", "Đề 1 — Quy tắc hình hộp & Phép toán vectơ", "typst/sach/DECUONG12-HK1/chuong-02/bai01-de1.typ"),
            ("12-2-1-de2", 2, "520", "Đề 2 — Phân tích vectơ & Đồng phẳng trong không gian", "typst/sach/DECUONG12-HK1/chuong-02/bai01-de2.typ"),
            ("12-2-1-de3", 3, "521", "Đề 3 — Tích vô hướng & Góc giữa hai vectơ", "typst/sach/vecto-3d-chuong2/c2-b1-de1.typ"),
        ]
    },
    {
        "lesson_id": "12-2-2",
        "chapter": 2,
        "chapter_title": "Chương 2: Vectơ và hệ tọa độ trong không gian",
        "lesson_num": 8,
        "lesson_title": "Bài 8: Hệ trục tọa độ trong không gian",
        "lecture_pdf": "/pdfs/beamer-12-bai-8-toa-do-vecto.pdf",
        "exams": [
            ("12-2-2-de1", 1, "522", "Đề 1 — Tọa độ của điểm và tọa độ vectơ", "typst/sach/DECUONG12-HK1/chuong-02/bai02-de1.typ"),
            ("12-2-2-de2", 2, "523", "Đề 2 — Tọa độ trung điểm, trọng tâm & Độ dài đoạn thẳng", "typst/sach/vecto-3d-chuong2/c2-b2-de1.typ"),
            ("12-2-2-de3", 3, "524", "Đề 3 — Ứng dụng tọa độ giải bài toán hình không gian", "typst/sach/vecto-3d-chuong2/c2-b4-de1.typ"),
        ]
    },
    {
        "lesson_id": "12-2-3",
        "chapter": 2,
        "chapter_title": "Chương 2: Vectơ và hệ tọa độ trong không gian",
        "lesson_num": 9,
        "lesson_title": "Bài 9: Biểu thức tọa độ của các phép toán vectơ",
        "lecture_pdf": "/pdfs/beamer-12-bai-9-phep-toan-vecto.pdf",
        "exams": [
            ("12-2-3-de1", 1, "525", "Đề 1 — Biểu thức tọa độ cộng, trừ, nhân vô hướng", "typst/sach/DECUONG12-HK1/chuong-02/bai03-de1.typ"),
            ("12-2-3-de2", 2, "526", "Đề 2 — Tính góc, độ dài & Chứng minh vuông góc", "typst/sach/DECUONG12-HK1/chuong-02/bai03-de2.typ"),
            ("12-2-3-de3", 3, "527", "Đề 3 — Tích có hướng & Ứng dụng tính diện tích, thể tích", "typst/sach/vecto-3d-chuong2/c2-b3-de1.typ"),
        ]
    },

    # ── CHƯƠNG 3: CÁC SỐ ĐẶC TRƯNG MẪU SỐ LIỆU GHÉP NHÓM (2 bài x 3 đề = 6 đề) ──
    {
        "lesson_id": "12-3-1",
        "chapter": 3,
        "chapter_title": "Chương 3: Các số đặc trưng đo mức độ phân tán cho mẫu số liệu ghép nhóm",
        "lesson_num": 10,
        "lesson_title": "Bài 10: Khoảng biến thiên và khoảng tứ phân vị",
        "lecture_pdf": "/pdfs/beamer-12-bai-10-khoang-bien-thien-tu-phan-vi.pdf",
        "exams": [
            ("12-3-1-de1", 1, "528", "Đề 1 — Ghép nhóm số liệu & Khoảng biến thiên", "typst/sach/DECUONG12-HK1/chuong-03/bai01-de1.typ"),
            ("12-3-1-de2", 2, "529", "Đề 2 — Xác định tứ phân vị & Khoảng tứ phân vị", "typst/sach/DECUONG12-HK1/chuong-03/bai01-de2.typ"),
            ("12-3-1-de3", 3, "530", "Đề 3 — Phân tích ý nghĩa thực tế & Giá trị ngoại lệ", "typst/sach/thong-ke-chuong3/c3-b1-de1.typ"),
        ]
    },
    {
        "lesson_id": "12-3-2",
        "chapter": 3,
        "chapter_title": "Chương 3: Các số đặc trưng đo mức độ phân tán cho mẫu số liệu ghép nhóm",
        "lesson_num": 11,
        "lesson_title": "Bài 11: Phương sai và độ lệch chuẩn của mẫu số liệu ghép nhóm",
        "lecture_pdf": "/pdfs/beamer-12-bai-11-phuong-sai-do-lech-chuan.pdf",
        "exams": [
            ("12-3-2-de1", 1, "531", "Đề 1 — Công thức tính phương sai và độ lệch chuẩn", "typst/sach/DECUONG12-HK1/chuong-03/bai02-de3.typ"),
            ("12-3-2-de2", 2, "532", "Đề 2 — So sánh mức độ phân tán giữa hai mẫu số liệu", "typst/sach/DECUONG12-HK1/chuong-03/bai02-de4-nangcao.typ"),
            ("12-3-2-de3", 3, "533", "Đề 3 — Bài toán thống kê thực tiễn & Kiểm định chất lượng", "typst/sach/thong-ke-chuong3/c3-b2-de1.typ"),
        ]
    },
]

PREAMBLE_TEMPLATE = """#import "/typst/math-sym.typ": *
#import "/typst/bbt.typ": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let notin = sym.in.not
#let cap = math.inter
#let cup = math.union
#let setminus = math.without
#let subset = math.subset
#let emptyset = math.emptyset
#let True(body) = ("true": true, body: body)
#let vect = vec
#let tfrac(num, den) = {
  show math.frac: f => f
  scale(x: 72%, y: 72%, origin: center + horizon, reflow: true, math.inline(math.frac(num, den)))
}
#let nhap(n) = []
#let c-book = rgb("#0057b8")
#let q-wrap(q, ..args) = q

#let draw-ellipse(cx, cy, rx, ry, stroke: 1pt, style: "solid") = {
  let stroke-val = stroke
  import cetz.draw: *
  if style == "dashed" {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  } else if style == "dashed-back" {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  } else {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: stroke-val)
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  }
}

#let my-bxd = bxd
#let my-bbbt = bbbt
#let step(body) = body
#let resetstep() = []
#let resetexamstate() = []
#let resetcau() = []
#let exam-part(..args) = []
#let tn(..args) = lt-tn(..args)
#let ds(..args) = lt-ds(..args)
#let tln(..args) = lt-tln(..args)

#show: lecture-theme.with(
  title: "__EXAM_TITLE__",
  subtitle: "__EXAM_SUBTITLE__",
  author: "Tổ Toán — THPT",
  institution: "TOÁN 12",
  base-size: 20pt,
)

#lec-reset()
#lt-toc()

"""

def transform_exam(src_path, exam_id, code, de_title, lesson_title):
    with open(src_path, "r", encoding="utf-8") as f:
        src = f.read()

    # Find where questions start
    pos = re.search(r"#(exam-part|resetexamstate|tn|ds|tln|q-wrap)", src)
    body = src[pos.start():] if pos else src

    # Strip imports that conflict
    body = re.sub(r'#import\s+"[^"]+_config\.typ":\s*\*?\n?', '', body)
    body = re.sub(r'#import\s+"[^"]+preamble\.typ":\s*\*?\n?', '', body)

    title_main = lesson_title.upper()
    sub_title = f"{de_title.upper()} — MÃ ĐỀ: {code}"

    full_typ = PREAMBLE_TEMPLATE.replace("__EXAM_TITLE__", title_main).replace("__EXAM_SUBTITLE__", sub_title) + body
    return full_typ

def compile_single(task):
    typ_path, pdf_path = task
    res = subprocess.run(["typst", "compile", "--root", ".", typ_path, pdf_path], capture_output=True, text=True)
    if res.returncode == 0:
        doc = fitz.open(pdf_path)
        pages = len(doc)
        links = sum(len(p.get_links()) for p in doc)
        doc.close()
        return {"path": typ_path, "pdf": pdf_path, "success": True, "pages": pages, "links": links}
    else:
        return {"path": typ_path, "pdf": pdf_path, "success": False, "error": res.stderr}

def main():
    os.makedirs(OUTPUT_BEAMER_DIR, exist_ok=True)
    os.makedirs(OUTPUT_PDF_DIR, exist_ok=True)

    print("══════════════════════════════════════════════════════════════")
    print("🚀 BẮT ĐẦU TẠO VÀ BIÊN DỊCH 33 BEAMER ĐỀ THI KHỐI 12 THEO BÀI")
    print("══════════════════════════════════════════════════════════════")

    compile_tasks = []

    for item in K12_LESSON_EXAMS:
        l_title = item["lesson_title"]
        for ex_id, de_idx, code, de_title, src_file in item["exams"]:
            typ_filename = f"beamer-12-{ex_id}.typ"
            pdf_filename = f"beamer-12-{ex_id}.pdf"
            typ_path = os.path.join(OUTPUT_BEAMER_DIR, typ_filename)
            pdf_path = os.path.join(OUTPUT_PDF_DIR, pdf_filename)

            typ_content = transform_exam(src_file, ex_id, code, de_title, l_title)
            with open(typ_path, "w", encoding="utf-8") as f:
                f.write(typ_content)

            compile_tasks.append((typ_path, pdf_path))

    print(f"✅ Đã tạo {len(compile_tasks)} file Typst trong {OUTPUT_BEAMER_DIR}")
    print(f"⚡ Đang biên dịch song song với ProcessPoolExecutor (max_workers=8)...")

    success_count = 0
    fail_count = 0

    with ProcessPoolExecutor(max_workers=8) as executor:
        futures = {executor.submit(compile_single, t): t for t in compile_tasks}
        for future in as_completed(futures):
            res = future.result()
            base = os.path.basename(res["path"])
            if res["success"]:
                success_count += 1
                print(f"  [✓ {success_count:2d}/{len(compile_tasks)}] {base:25} -> {res['pages']:3d} trang, {res['links']:3d} liên kết")
            else:
                fail_count += 1
                print(f"  [✗ THẤT BẠI] {base:25}:\n{res['error'][:300]}")

    print("\n══════════════════════════════════════════════════════════════")
    print(f"📊 KẾT QUẢ BIÊN DỊCH: {success_count} THÀNH CÔNG, {fail_count} THẤT BẠI / Tổng {len(compile_tasks)}")
    print("══════════════════════════════════════════════════════════════")

    if fail_count > 0:
        sys.exit(1)

if __name__ == "__main__":
    main()
