with open("typst-pkg-sang-math/sang-exam.typ", "r", encoding="utf-8") as f:
    lines = f.readlines()

for i, line in enumerate(lines):
    if line.startswith("#let mcq("):
        start = i
        break

end = start
brace_count = 0
for i in range(start, len(lines)):
    line = lines[i]
    if "{" in line:
        brace_count += line.count("{")
    if "}" in line:
        brace_count -= line.count("}")
    if brace_count == 0 and i > start + 20:
        end = i
        break

print("".join(lines[start:start+100]))
