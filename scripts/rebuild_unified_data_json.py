#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Rebuild web-app/public/data.json with a unified, pedagogical, classroom-ready structure
for Grade 10, Grade 11, and Grade 12.
"""

import json
import os
import fitz

DATA_PATH = "web-app/public/data.json"
PDF_DIR = "web-app/public/pdfs"

def check_pdf_exists(rel_path):
    if not rel_path:
        return None
    full = os.path.join("web-app/public", rel_path.lstrip("/"))
    if os.path.exists(full):
        return rel_path
    return None

with open(DATA_PATH, "r", encoding="utf-8") as f:
    old_data = json.load(f)

# 1. GRADE 10 (Keep exactly intact - 136 items)
grade10_items = [x for x in old_data if str(x.get("grade")) == "10"]
print(f"Grade 10 items preserved: {len(grade10_items)}")

# 2. GRADE 11
# Import mapping from scripts/generate_k11_exam_beamers.py
from generate_k11_exam_beamers import K11_LESSON_MAPPING

k11_lesson_pdfs = {
    "11-1-1": "/pdfs/beamer-11-bai-1-goc-luong-giac.pdf",
    "11-1-2": "/pdfs/beamer-11-bai-2-ham-so-luong-giac.pdf",
    "11-2-1": "/pdfs/beamer-11-c3-bai-1-day-so.pdf",
    "11-2-2": "/pdfs/beamer-11-c3-bai-2-cap-so-cong.pdf",
    "11-2-3": "/pdfs/beamer-11-c3-bai-3-cap-so-nhan.pdf",
    "11-6-1": "/pdfs/beamer-11-mu-bai-1-luy-thua.pdf",
    "11-6-2": "/pdfs/beamer-11-mu-bai-3-ham-so.pdf",
    "11-6-3": "/pdfs/beamer-11-mu-bai-4-pt-bpt.pdf",
}

grade11_items = []
# Group by lesson: lesson first, then its exams
for lid, ch, les, main_t, ch_t, folder, de_files in K11_LESSON_MAPPING:
    lesson_pdf = k11_lesson_pdfs.get(lid)
    if lesson_pdf and not os.path.exists(os.path.join("web-app/public", lesson_pdf.lstrip("/"))):
        lesson_pdf = None

    # Lesson entry
    grade11_items.append({
        "id": lid,
        "title": main_t,
        "grade": 11,
        "chapter": ch,
        "chapterTitle": ch_t,
        "lesson_num": les,
        "file": lesson_pdf
    })

    # Exam entries for this lesson
    for idx, de_file in enumerate(de_files, start=1):
        de_stem = os.path.splitext(de_file)[0]
        # Match compiled pdf
        pdf_name = f"beamer-11-c{ch}-b{les}-{de_stem}.pdf"
        pdf_path = f"/pdfs/{pdf_name}"
        if not os.path.exists(os.path.join(PDF_DIR, pdf_name)):
            print(f"Warning: Missing K11 exam PDF {pdf_name}")

        code = "101" # Default code or extracted
        # Extract title from existing data if possible
        existing_exam = next((x for x in old_data if x.get("id") == f"{lid}-de{idx}"), None)
        title_str = existing_exam.get("title") if existing_exam else f"{main_t} — Đề {idx} (Mã {code})"

        grade11_items.append({
            "id": f"{lid}-de{idx}",
            "lessonId": lid,
            "title": title_str,
            "grade": 11,
            "chapter": ch,
            "chapterTitle": ch_t,
            "lesson_num": les,
            "deIndex": idx,
            "type": "exam",
            "code": existing_exam.get("code", "101") if existing_exam else "101",
            "source_stem": de_stem,
            "file": pdf_path
        })

print(f"Grade 11 items structured: {len(grade11_items)} (21 lessons + 61 exams)")

# 3. GRADE 12
from generate_k12_lesson_exam_beamers import K12_LESSON_EXAMS

grade12_items = []

for item in K12_LESSON_EXAMS:
    lid = item["lesson_id"]
    ch = item["chapter"]
    ch_t = item["chapter_title"]
    les = item["lesson_num"]
    l_title = item["lesson_title"]
    lec_pdf = item["lecture_pdf"]
    if not os.path.exists(os.path.join("web-app/public", lec_pdf.lstrip("/"))):
        print(f"Warning: Missing K12 lesson PDF {lec_pdf}")

    # Lesson card
    grade12_items.append({
        "id": lid,
        "title": l_title,
        "grade": 12,
        "chapter": ch,
        "chapterTitle": ch_t,
        "lesson_num": les,
        "file": lec_pdf
    })

    # 3 Exam cards for this lesson
    for ex_id, de_idx, code, de_title, src_file in item["exams"]:
        pdf_name = f"beamer-12-{ex_id}.pdf"
        pdf_path = f"/pdfs/{pdf_name}"
        if not os.path.exists(os.path.join(PDF_DIR, pdf_name)):
            print(f"Warning: Missing K12 exam PDF {pdf_name}")

        grade12_items.append({
            "id": ex_id,
            "lessonId": lid,
            "title": f"{l_title} — {de_title} (Mã {code})",
            "grade": 12,
            "chapter": ch,
            "chapterTitle": ch_t,
            "lesson_num": les,
            "deIndex": de_idx,
            "type": "exam",
            "code": code,
            "file": pdf_path
        })

# Append Chapter 4: Ôn tập Học kỳ II & Chuyên đề nâng cao Toán 12
grade12_items.append({
    "id": "12-4-hk2",
    "title": "Tổng ôn tập kiến thức Học kỳ II: Nguyên hàm, Tích phân & Tọa độ Oxyz",
    "grade": 12,
    "chapter": 4,
    "chapterTitle": "Chương 4: Ôn tập & Chuyên đề nâng cao Toán 12",
    "lesson_num": 1,
    "file": "/pdfs/beamer-12-hkii-bo-day-du.pdf"
})

# Add the 27 Chuyên Đề exams to Chapter 4
from generate_k12_exam_beamers import K12_LESSON_MAPPING as K12_CD_MAPPING

for lid, cd_ch, cd_les, cd_title, cd_ch_title, cd_folder, de_files in K12_CD_MAPPING:
    # Chuyên đề header/lesson card
    grade12_items.append({
        "id": lid,
        "title": cd_title,
        "grade": 12,
        "chapter": 4,
        "chapterTitle": "Chương 4: Ôn tập & Chuyên đề nâng cao Toán 12",
        "lesson_num": cd_les + 1,
        "file": None
    })
    for idx, de_file in enumerate(de_files, start=1):
        de_stem = os.path.splitext(de_file)[0]
        pdf_name = f"beamer-12-c{cd_ch}-b{cd_les}-{de_stem}.pdf"
        pdf_path = f"/pdfs/{pdf_name}"
        ex_id = f"{lid}-de{idx}"
        existing_cd = next((x for x in old_data if x.get("id") == ex_id), None)
        title_str = existing_cd.get("title") if existing_cd else f"{cd_title} — Đề {idx}"
        code = existing_cd.get("code", "501") if existing_cd else "501"

        grade12_items.append({
            "id": ex_id,
            "lessonId": lid,
            "title": title_str,
            "grade": 12,
            "chapter": 4,
            "chapterTitle": "Chương 4: Ôn tập & Chuyên đề nâng cao Toán 12",
            "lesson_num": cd_les + 1,
            "deIndex": idx,
            "type": "exam",
            "code": code,
            "source_stem": de_stem,
            "file": pdf_path
        })

print(f"Grade 12 items structured: {len(grade12_items)} (11 core lessons + 33 core exams + 1 HK2 review + 9 CD lessons + 27 CD exams)")

# COMBINE ALL
full_data = []
full_data.extend(grade10_items)
full_data.extend(grade11_items)
full_data.extend(grade12_items)

print(f"\nTOTAL ALL GRADES: {len(full_data)} items")
with open(DATA_PATH, "w", encoding="utf-8") as f:
    json.dump(full_data, f, ensure_ascii=False, indent=2)

print(f"Successfully wrote clean, structured database to {DATA_PATH}!")
