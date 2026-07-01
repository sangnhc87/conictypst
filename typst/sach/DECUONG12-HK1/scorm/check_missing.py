import os
import sys
import glob

# Add the scorm directory to the path so we can import parse_typ
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import parse_typ

base_dir = "/Users/admin/conictypst/typst/sach/DECUONG12-HK1"
chapters = ["chuong-01", "chuong-02", "chuong-03"]

missing_count = 0

for chapter in chapters:
    chap_dir = os.path.join(base_dir, chapter)
    typ_files = glob.glob(os.path.join(chap_dir, "bai*.typ"))
    
    for filepath in typ_files:
        if "khoang-bien-thien-tu-phan-vi.typ" in filepath or "phuong-sai-do-lech-chuan.typ" in filepath:
            # Skip theory files that just contain theory
            continue
        if "toa-do-vecto.typ" in filepath or "vecto-khong-gian.typ" in filepath or "phep-toan-vecto.typ" in filepath:
            # Skip theory files
            continue
            
        questions = parse_typ.parse_file(filepath)
        for i, q in enumerate(questions):
            issues = []
            
            # Check solution
            if not q.solution or q.solution.strip() == "":
                issues.append("Missing 'loigiai' (solution)")
                
            # Check correct answer
            if q.q_type == "tn":
                if not q.correct:
                    issues.append("No True() option found")
            elif q.q_type == "ds":
                if len(q.correct) < 4:
                    # sometimes true/false has fewer than 4? But usually exactly 4
                    if not q.correct:
                        issues.append("No True()/False() labels found in options")
            elif q.q_type == "tln":
                if not q.answer_short or q.answer_short.strip() == "":
                    issues.append("Missing answer string")
            
            if issues:
                missing_count += 1
                print(f"File: {os.path.basename(filepath)} | {q.q_type.upper()} Question {q.number}:")
                for issue in issues:
                    print(f"  - {issue}")
                print(f"  Snippet: {q.stem[:100]}...\n")

if missing_count == 0:
    print("All questions have answers and solutions!")
else:
    print(f"Total issues found: {missing_count}")
