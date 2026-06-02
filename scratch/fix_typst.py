import re
import subprocess

filepath = "/Users/admin/conictypst/typst/exams/CD-ToiUu-KinhTe-DaDieuKien.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# 1. Replace Markdown bold **text** with Typst *text*
# Note: we need to handle case where they are nested or have spaces, but a simple regex works well
content = re.sub(r'\*\*(.*?)\*\*', r'*\1*', content)

# 2. Fix subscripts: T_(cb) -> T_("cb")
content = content.replace("T_(cb)", 'T_("cb")')
content = content.replace("T_(cb)", 'T_("cb")')
content = content.replace("P'_(trái)", "P'_(\"trái\")")
content = content.replace("P'_(phải)", "P'_(\"phải\")")

# 3. Replace dot.c with dot
content = content.replace("dot.c", "dot")

# Write it back
with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)

print("Replacement complete. Compiling...")

# Run compile command
res = subprocess.run(
    ["typst", "compile", "--root", "typst", "typst/exams/CD-ToiUu-KinhTe-DaDieuKien.typ", "typst/exams/CD-ToiUu-KinhTe-DaDieuKien.pdf"],
    capture_output=True,
    text=True
)

print("STDOUT:")
print(res.stdout)
print("STDERR:")
print(res.stderr)
print("Exit code:", res.returncode)
