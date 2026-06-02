import os
import re
import json

exams_dir = "/Users/admin/conictypst/typst/exams"
files = [f for f in os.listdir(exams_dir) if f.endswith(".typ")]

results = []

# Title clean up patterns
title_cleanup = [
    r"Chuyên\s+Đề:\s*",
    r"Chủ\s+Đề:\s*",
    r"Title:\s*",
    r'^["\']|["\']$',
    r'"',
    r"'"
]

def clean_title(title):
    for pat in title_cleanup:
        title = re.sub(pat, "", title, flags=re.IGNORECASE)
    return title.strip()

for filename in sorted(files):
    filepath = os.path.join(exams_dir, filename)
    with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()
        
    title = ""
    # Look for Chuyên Đề: ...
    m = re.search(r"Chuyên\s+Đề:\s*([^\n\]#\)]+)", content, re.IGNORECASE)
    if m:
        title = m.group(1).strip()
    else:
        m = re.search(r"Chủ\s+Đề:\s*([^\n\]#\)]+)", content, re.IGNORECASE)
        if m:
            title = m.group(1).strip()
        else:
            m = re.search(r"title:\s*\[?([^\n\]#\)]+)\]?", content, re.IGNORECASE)
            if m:
                title = m.group(1).strip()
                
    if not title:
        # Try to find first heading = ...
        m = re.search(r"^=\s*([^\n]+)", content, re.MULTILINE)
        if m:
            title = m.group(1).strip()
        else:
            title = filename.replace(".typ", "")
            
    title = clean_title(title)
    
    # Extract first problem
    # Look for #tln(..., #tn(..., #ds(...
    prob = ""
    m_prob = re.search(r"#(tln|tn|ds)\(\s*(\[([\s\S]*?)\]|([^,]*))", content)
    if m_prob:
        if m_prob.group(3):
            prob = m_prob.group(3).strip()
        else:
            prob = m_prob.group(4).strip()
            
    # Clean up problem text (remove comments, excessive spaces)
    prob = re.sub(r"//.*", "", prob)
    prob = re.sub(r"\s+", " ", prob).strip()
    if len(prob) > 250:
        prob = prob[:247] + "..."
        
    # Grouping logic based on file name or title
    category = "Khác"
    fn = filename.lower()
    t = title.lower()
    
    if "markov" in fn or "markov" in t or "trangthai" in fn or "trạng thái" in t or "fsm" in fn:
        category = "Mô hình Trạng thái & Chuỗi Markov"
    elif "hamsinh" in fn or "hàm sinh" in t or "generating" in fn:
        category = "Hàm sinh (Generating Functions)"
    elif "euler" in fn or "chia-keo" in fn or "chia kẹo" in t or "sao và vạch" in t:
        category = "Bài toán Chia kẹo Euler (Stars & Bars)"
    elif "xacsuat" in fn or "xác suất" in t or "sodocay" in fn or "sơ đồ cây" in t or "bayes" in fn or "đối kháng" in t or "bốc-bi" in fn or "bốc bi" in t:
        category = "Xác suất & Sơ đồ cây (Probability)"
    elif "tohop" in fn or "tổ hợp" in t or "đếm" in fn or "to-mau" in fn or "tô màu" in t or "dac-biet" in fn or "đếm nâng cao" in t:
        category = "Tổ hợp & Đếm nâng cao"
    elif "conic" in fn or "parabol" in fn or "ellip" in fn or "hyperbol" in fn or "tiếp xúc" in t or "tiepxuc" in fn:
        category = "Đường Conic & Sự tiếp xúc đường cong"
    elif "oxyz" in fn or "không gian" in t or "hhkg" in fn or "matcau" in fn or "mặt cầu" in t or "đường thẳng" in t or "duongthang" in fn:
        category = "Hình học Oxyz & Không gian"
    elif "kinh-te" in fn or "tichphan" in fn or "tích phân" in t or "doanh thu" in t or "chi phí" in t or "chiphi" in fn or "năng suất" in t or "nangsuat" in fn or "tối ưu" in t or "toiuu" in fn:
        category = "Tích phân & Tối ưu hóa Kinh tế - Kỹ thuật"
    elif "vật" in t or "vật" in fn or "chuyển động" in t or "robot" in fn or "trượt" in t or "bay" in t or "chim" in fn or "cầu" in fn or "mục tiêu" in t or "trận" in t or "gió" in fn or "treo" in fn:
        category = "Mô hình hóa Vật lý & Cơ học"
        
    results.append({
        "file": filename,
        "title": title,
        "raw_prob": prob,
        "category": category
    })

# Write sorted output by category
output_path = "/Users/admin/conictypst/scratch/classified_exams.json"
with open(output_path, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2, ensure_ascii=False)

print(f"Scanned {len(files)} files. Data written to {output_path}")

# Print categories count
counts = {}
for r in results:
    counts[r["category"]] = counts.get(r["category"], 0) + 1
for cat, count in sorted(counts.items()):
    print(f"- {cat}: {count} files")
