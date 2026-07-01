import re

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "r", encoding="utf-8") as f:
    content = f.read()

# Fix duplicated BBT text
content = content.replace("*Bảng biến thiên:*\n    *Bảng biến thiên:*", "*Bảng biến thiên:*")

# Remove ANY #pause inside #lt-solution
# Note: lt-solution can span multiple lines. I'll just remove ALL `#pause` from lines that are indented by 4 spaces (which is where they are inside lt-solution)
content = re.sub(r'    #pause\n', '', content)

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "w", encoding="utf-8") as f:
    f.write(content)

