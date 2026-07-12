with open("typst-pkg-sang-math/sang-exam.typ", "r", encoding="utf-8") as f:
    lines = f.readlines()

for i, line in enumerate(lines):
    if "let exam-mode" in line:
        start = i
        break

print("".join(lines[start:start+40]))
