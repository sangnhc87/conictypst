import os
import glob
import shutil
import json
import re

pdf_files = glob.glob("typst/beamer/**/*.pdf", recursive=True)

data = []
os.makedirs("web-app/public/pdfs", exist_ok=True)

# Helper function to generate clean title
def clean_title(basename):
    name = basename.replace(".pdf", "")
    # Remove prefix like beamer-11-bai-1-
    m = re.match(r"beamer-\d+-(?:bai|c\d+-bai|mu-bai|udh-phan\d+)-?(\d+)?-(.*)", name)
    if m:
        num = m.group(1)
        text = m.group(2).replace("-", " ").title()
        if num:
            return f"Bài {num}: {text}"
        else:
            return text
    # Fallback
    m2 = re.match(r"beamer-\d+-(.*)", name)
    if m2:
        return m2.group(1).replace("-", " ").title()
    return name.replace("-", " ").title()

chapter_map = {
    "chuong1-luong-giac": (1, "Chương 1: Hàm số lượng giác & Phương trình lượng giác"),
    "chuong3-day-so": (3, "Chương 3: Dãy số - Cấp số cộng - Cấp số nhân"),
    "mu-logarit": (6, "Chương 6: Hàm số mũ và Hàm số logarit"),
    "ung-dung-dao-ham": (1, "Chương 1: Ứng dụng của đạo hàm"),
    "khoi-12": (1, "Chương 1: Ứng dụng của đạo hàm (Khảo sát hàm số)")
}

for idx, path in enumerate(pdf_files):
    # ignore debug or test
    if "debug" in path.lower() or "test" in path.lower():
        continue
        
    basename = os.path.basename(path)
    dirname = os.path.basename(os.path.dirname(path))
    
    # Determine grade
    grade = 12
    if "beamer-11" in basename:
        grade = 11
    elif "beamer-10" in basename:
        grade = 10
        
    # Determine chapter
    chapter_num = 1
    chapter_title = "Chương 1: Tổng hợp"
    if dirname in chapter_map:
        chapter_num, chapter_title = chapter_map[dirname]
    elif "chuong" in dirname:
        m = re.search(r"chuong(\d+)", dirname)
        if m:
            chapter_num = int(m.group(1))
            chapter_title = f"Chương {chapter_num}: {dirname.replace('chuong'+str(chapter_num)+'-', '').replace('-', ' ').title()}"
            
    # if it's in the root typst/beamer
    if dirname == "beamer":
        if grade == 12:
            chapter_num = 1
            chapter_title = "Chương 1: Ứng dụng của đạo hàm (Tổng hợp)"
            
    # Copy file
    dest_path = f"web-app/public/pdfs/{basename}"
    shutil.copy(path, dest_path)
    
    title = clean_title(basename)
    
    data.append({
        "id": f"{grade}-{chapter_num}-{idx}",
        "title": title,
        "grade": grade,
        "chapter": chapter_num,
        "chapterTitle": chapter_title,
        "file": f"/pdfs/{basename}"
    })

# Sort data
data.sort(key=lambda x: (x["grade"], x["chapter"], x["title"]))

with open("web-app/public/data.json", "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=2)

print(f"Processed {len(data)} PDFs!")
