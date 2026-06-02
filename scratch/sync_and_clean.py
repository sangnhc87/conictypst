import re

ch1_path = "typst/sach/ham-so-chuong1/c1-DaiBacDietRuoi-Ch1.typ"
book_path = "typst/sach/ham-so-chuong1/DaiBacDietRuoi-Tap1-HamSo.typ"

# 1. Read Chapter 1 contents
with open(ch1_path, "r", encoding="utf-8") as f:
    ch1_content = f.read()

# Extract from first #philosophy-box to the end
idx_philosophy = ch1_content.find("#philosophy-box")
if idx_philosophy == -1:
    raise ValueError("Could not find #philosophy-box in Ch1 file")
ch1_text = ch1_content[idx_philosophy:].strip()

# 2. Read master book contents
with open(book_path, "r", encoding="utf-8") as f:
    book_content = f.read()

# Find chapter 1 start and chapter 2 start in the book
ch1_hdr = '#chapter-header("1", [Hàm Số — Ngôn Ngữ Của Sự Thay Đổi])'
ch2_hdr = '#chapter-header("2", [Tính Đơn Điệu — Dòng Chảy Của Tiếp Tuyến])'

ch1_idx = book_content.find(ch1_hdr)
ch2_idx = book_content.find(ch2_hdr)

if ch1_idx == -1 or ch2_idx == -1:
    raise ValueError("Could not find chapter headers in master book file")

# Find the pagebreak before chapter 2
pb_idx = book_content.rfind("#pagebreak()", 0, ch2_idx)
if pb_idx == -1:
    raise ValueError("Could not find #pagebreak() before Chapter 2")

# Replace Chapter 1 content in the book
new_book_content = (
    book_content[:ch1_idx + len(ch1_hdr)]
    + "\n\n"
    + ch1_text
    + "\n\n"
    + book_content[pb_idx:]
)

# 3. Clean up the rest of the chapters (Chapters 2 to 6)
# Replace example-box with explain-box
new_book_content = new_book_content.replace("#example-box", "#explain-box")

# Replace LaTeX commands with Typst native commands
new_book_content = new_book_content.replace("\\implies", "=>")
new_book_content = new_book_content.replace("\\iff", "<=>")
new_book_content = new_book_content.replace("\\sin", "sin")
new_book_content = new_book_content.replace("\\cos", "cos")
new_book_content = new_book_content.replace("\\theta", "theta")
new_book_content = new_book_content.replace("\\Delta", "Delta")
new_book_content = new_book_content.replace("\\approx", "approx")
new_book_content = new_book_content.replace("\\left[", 'cases(delim: "[", ')
new_book_content = new_book_content.replace("\\right.", ")")
new_book_content = new_book_content.replace("\\dots", "...")
new_book_content = new_book_content.replace("\\cdot", "dot.c")
new_book_content = new_book_content.replace("\\times", "times")
new_book_content = new_book_content.replace("\\cup", "union")

# Replace specific LaTeX block structures in Chapter 6 (VDC)
old_eq1 = r"    $ \begin{cases} 2x > 0 \\ f'(x^2 - 2) > 0 \end{cases} <=> \begin{cases} x > 0 \\ \left[ \begin{aligned} x^2 - 2 < -1 \\ x^2 - 2 > 4 \end{aligned} \right. \end{cases} <=> \begin{cases} x > 0 \\ \left[ \begin{aligned} x^2 < 1 \\ x^2 > 6 \end{aligned} \right. \end{cases} <=> x in (0, 1) \cup (sqrt(6), +oo). $"
new_eq1 = r"    $ cases(2x > 0, f'(x^2 - 2) > 0) <=> cases(x > 0, cases(delim: \"[\", x^2 - 2 < -1, x^2 - 2 > 4)) <=> cases(x > 0, cases(delim: \"[\", x^2 < 1, x^2 > 6)) <=> x in (0, 1) union (sqrt(6), +oo). $"

old_eq2 = r"    $ \begin{cases} 2x < 0 \\ f'(x^2 - 2) < 0 \end{cases} <=> \begin{cases} x < 0 \\ -1 < x^2 - 2 < 4 \end{cases} <=> \begin{cases} x < 0 \\ 1 < x^2 < 6 \end{cases} <=> x in (-sqrt(6), -1). $"
new_eq2 = r"    $ cases(2x < 0, f'(x^2 - 2) < 0) <=> cases(x < 0, -1 < x^2 - 2 < 4) <=> cases(x < 0, 1 < x^2 < 6) <=> x in (-sqrt(6), -1). $"

new_book_content = new_book_content.replace(old_eq1, new_eq1)
new_book_content = new_book_content.replace(old_eq2, new_eq2)

# Replace all double asterisks ** with single asterisks *
# Note: we search for **(text)** and replace with *(text)*
new_book_content = re.sub(r'\*\*(.*?)\*\*', r'*\1*', new_book_content)

# 4. Write back to the master book file
with open(book_path, "w", encoding="utf-8") as f:
    f.write(new_book_content)

print("Synchronization and cleaning completed successfully!")
