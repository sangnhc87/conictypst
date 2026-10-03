import sys
from pathlib import Path
from parse_typ import parse_file
from build_scorm import make_zip

def export_file(filepath_str, title, filename_base):
    filepath = Path(filepath_str)
    if not filepath.exists():
        print(f"File not found: {filepath}")
        return
    
    print(f"Parsing {filepath.name}...")
    questions = parse_file(filepath)
    if not questions:
        print(f"No questions found in {filepath.name}!")
        return
    
    print(f"Found {len(questions)} questions. Building SCORM...")
    make_zip("10", "1", filename_base, title, questions)

file1 = "/Users/admin/conictypst/typst/beamer/khoi-10/beamer-10-c2-bai-1-bpt-bac-nhat-hai-an.typ"
title1 = "Bài 1: Bất Phương Trình Bậc Nhất Hai Ẩn"
export_file(file1, title1, "bpt")

file2 = "/Users/admin/conictypst/typst/beamer/khoi-10/beamer-10-c2-bai-2-he-bpt-bac-nhat-hai-an.typ"
title2 = "Bài 2: Hệ Bất Phương Trình Bậc Nhất Hai Ẩn"
export_file(file2, title2, "he-bpt")

