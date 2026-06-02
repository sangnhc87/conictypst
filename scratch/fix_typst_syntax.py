import re

with open('typst/exams/Brahmagupta-Oxyz.typ', 'r') as f:
    text = f.read()

text = re.sub(r', \$([a-zA-Z0-9_]+)\$, text\(weight: "bold"\)', r', text(weight: "bold")[${\1}$]', text)

with open('typst/exams/Brahmagupta-Oxyz.typ', 'w') as f:
    f.write(text)

