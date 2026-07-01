with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "r", encoding="utf-8") as f:
    lines = f.readlines()

new_lines = []
for line in lines:
    if line.strip().endswith("thí sinh chọn đúng hoặc sai.],"): continue
    if line.strip().endswith("Mỗi câu hỏi thí sinh chỉ chọn một phương án.],"): continue
    if line.strip().endswith("Thí sinh trả lời từ câu 1 đến câu 6.],"): continue
    if line.strip() == ")":
        # Check if the previous line was also removed
        pass
    
    new_lines.append(line)

# Let's use regex on the whole content to cleanly wipe any exam-part remnants
content = "".join(lines)
import re
content = re.sub(r'#exam-part\([^)]+\)[^)]+\)', '', content) # doesn't work well
# Actually we know exactly the strings left behind.
content = content.replace(", b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],", "")
content = content.replace("Mỗi câu hỏi thí sinh chỉ chọn một phương án.],", "")
content = content.replace("Thí sinh trả lời từ câu 1 đến câu 6.],", "")
# Wait, some lines might just have `  ),` or similar right after.
# A better way is to re-extract from original files, safely ignoring exam-parts.
