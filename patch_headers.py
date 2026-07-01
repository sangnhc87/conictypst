import re

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "r", encoding="utf-8") as f:
    content = f.read()

# Match `#show: thpt-school-exam.with( ... )`
content = re.sub(r'#show:\s*thpt-school-exam\.with\([\s\S]*?\)', '', content)

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "w", encoding="utf-8") as f:
    f.write(content)
