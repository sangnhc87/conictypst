import re

with open("/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ", "r", encoding="utf-8") as f:
    content = f.read()

# Regular expression to find all math blocks delimited by $...$
# We need to handle blocks that might span multiple lines, but standard inline is $...$
# and block is $...$ on separate lines.
# Let's find matches of $...$ (non-greedy)
math_blocks = re.finditer(r'\$([^$]+)\$', content)

vietnamese_chars = "áàảãạăắằẳẵặâấầẩẫậéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵđĐ"

for m in math_blocks:
    math_text = m.group(1)
    # Check if there is any Vietnamese character in math_text
    has_vn = any(c in vietnamese_chars for c in math_text)
    if has_vn:
        # Find line number
        start_pos = m.start()
        line_num = content[:start_pos].count('\n') + 1
        print(f"Line {line_num:4d}: ${math_text}$")
