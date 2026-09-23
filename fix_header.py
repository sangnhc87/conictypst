import re

for i in range(1, 6):
    path = f"typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-kiem-tra-chuong-1-de-{i}.typ"
    with open(path, "r") as f:
        text = f.read()
    
    # regex to match the old header
    pattern = r'#show:\s*doc\s*=>\s*sang-math-theme\(\s*doc,\s*title:\s*"ĐỀ KIỂM TRA 45 PHÚT - CHƯƠNG 1 \(ĐỀ (\d+)\)",\s*author:\s*"Admin",\s*paper-size:\s*"a4",\s*watermark:\s*true,\s*\)'
    
    def replacer(match):
        idx = match.group(1)
        return f"""#let mode = "loigiai"
#let accent = rgb("d97706")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12",
  school: "CHƯƠNG I: ỨNG DỤNG ĐẠO HÀM",
  exam-title: "ĐỀ KIỂM TRA 45 PHÚT - ĐỀ {idx}",
  subject: "TOÁN",
  duration: "45 phút",
)"""
        
    text = re.sub(pattern, replacer, text)
    
    with open(path, "w") as f:
        f.write(text)
