import re
import glob

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")
for path in files:
    with open(path, "r") as f:
        content = f.read()
    
    questions = re.findall(r'#(?:tn|tln|ds)\(\[.*?\].*?(?:loigiai:\s*\[.*?\]\s*\)?)', content, re.DOTALL)
    for q in questions:
        if re.search(r'\btham số\b', q) or re.search(r'\bm\b', q):
            # Exclude false positives like "m" as meters or "cm"
            if not re.search(r'\btham số m\b|tìm m|m thuộc|m =|giá trị của m|với mọi m|đường thẳng y = m', q, re.IGNORECASE):
                continue
            print(f"--- Found in {path} ---")
            print(q[:200] + "...")

