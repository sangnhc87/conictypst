with open("/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ", "r", encoding="utf-8") as f:
    content = f.read()

import re
for m in re.finditer(r'#prob\s*\(', content):
    print("Match:", repr(m.group()), "at index:", m.start())
    # print surrounding 50 chars
    print("Around:", repr(content[m.start():m.start()+100]))
