import re

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "r", encoding="utf-8") as f:
    content = f.read()

repl = """#show: lecture-theme.with(
  title:       "Bài 1: Tính Đơn Điệu và Cực Trị",
  subtitle:    "TOÁN 12 — Chương I: Ứng dụng của đạo hàm",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   24pt,                                // Size chữ cơ bản (phóng to để dễ nhìn)
  math-color:  rgb("#d81b60"),                      // Màu toán (Magenta)
  math-size:   1.05em,                              // Tỷ lệ size Toán so với chữ (1.05 lần)
  body-font:   ("Roboto", "Arial", "sans-serif"),   // Font chữ (Sans-serif hiện đại, đẳng cấp)
)"""

content = re.sub(r'#show: lecture-theme\.with\((.*?)\)', repl, content, flags=re.DOTALL)

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "w", encoding="utf-8") as f:
    f.write(content)
print("Updated beamer file")
