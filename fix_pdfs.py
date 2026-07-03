import os
import glob
import json
import re

pdf_files = glob.glob("typst/beamer/**/*.pdf", recursive=True)

data = []

# Helper function to generate clean title and extract lesson number
def parse_info(basename, dirname, grade):
    # Default values
    lesson_num = 999
    
    # Try to extract bai-X or cX
    m_bai = re.search(r"-bai-(\d+)-", basename)
    if m_bai:
        lesson_num = int(m_bai.group(1))
    else:
        m_c = re.search(r"-c(\d+)\.pdf", basename)
        if m_c:
            lesson_num = int(m_c.group(1))
            
    # Clean title
    name = basename.replace(".pdf", "")
    m = re.match(r"beamer-\d+-(?:bai|c\d+-bai|mu-bai|udh-phan\d+)-?(\d+)?-(.*)", name)
    if m:
        num = m.group(1)
        text = m.group(2).replace("-", " ").title()
        if num:
            title = f"Bài {num}: {text}"
        else:
            title = text
    else:
        m2 = re.match(r"beamer-\d+-(.*)", name)
        if m2:
            title = m2.group(1).replace("-", " ").title()
        else:
            title = name.replace("-", " ").title()
            
    # Determine chapter
    chapter_num = 1
    chapter_title = "Chương 1: Tổng hợp"
    
    if grade == 12:
        if "udh-phan1" in basename:
            chapter_num = 1
            chapter_title = "Chương 1: Ứng dụng đạo hàm (Phần 1)"
        elif "udh-phan2" in basename:
            chapter_num = 2
            chapter_title = "Chương 1: Ứng dụng đạo hàm (Phần 2)"
        elif "udh-phan3" in basename:
            chapter_num = 3
            chapter_title = "Chương 1: Ứng dụng đạo hàm (Phần 3)"
        else:
            # Based on lesson num
            if lesson_num <= 6:
                chapter_num = 1
                chapter_title = "Chương 1: Ứng dụng của đạo hàm"
            elif 7 <= lesson_num <= 9:
                chapter_num = 2
                chapter_title = "Chương 2: Vectơ trong không gian"
            elif lesson_num >= 10:
                chapter_num = 3
                chapter_title = "Chương 3: Thống kê"
                
    elif grade == 11:
        if "luong-giac" in dirname or "luong-giac" in basename:
            chapter_num = 1
            chapter_title = "Chương 1: Lượng giác"
        elif "day-so" in dirname:
            chapter_num = 3
            chapter_title = "Chương 3: Dãy số - Cấp số"
        elif "mu-logarit" in dirname or "mu" in basename:
            chapter_num = 6
            chapter_title = "Chương 6: Mũ và Logarit"
            
    return title, lesson_num, chapter_num, chapter_title

for idx, path in enumerate(pdf_files):
    if "debug" in path.lower() or "test" in path.lower():
        continue
        
    basename = os.path.basename(path)
    dirname = os.path.basename(os.path.dirname(path))
    
    grade = 12
    if "beamer-11" in basename:
        grade = 11
    elif "beamer-10" in basename:
        grade = 10
        
    title, lesson_num, chapter_num, chapter_title = parse_info(basename, dirname, grade)
    
    data.append({
        "id": f"{grade}-{chapter_num}-{lesson_num}-{idx}",
        "title": title,
        "grade": grade,
        "chapter": chapter_num,
        "chapterTitle": chapter_title,
        "lesson_num": lesson_num, # for sorting
        "file": f"/pdfs/{basename}"
    })

# Sort by Grade, then Chapter, then Lesson Number (integer sort!)
data.sort(key=lambda x: (x["grade"], x["chapter"], x["lesson_num"], x["title"]))

with open("web-app/public/data.json", "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=2)

print("Fixed sorting and chapter mapping!")
