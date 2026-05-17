import re
with open('typst/exams/Cánh-Tay-Robot.typ', 'r', encoding='utf-8') as f:
    text = f.read()

before = """#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học"""

replacement = """#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill:  math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 

$C_n^k$
"""

text = re.sub(r'#let \(tn, ds, tln, tl\).*?\$#C\(6,\s*2\)', replacement, text, flags=re.DOTALL)

with open('typst/exams/Cánh-Tay-Robot.typ', 'w', encoding='utf-8') as f:
    f.write(text)

