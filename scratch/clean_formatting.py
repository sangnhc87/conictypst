with open("typst/exams/CD-XepGhe-3Cot.typ", "r", encoding="utf-8") as f:
    content = f.read()

# Replace ** with *
import re
content = re.sub(r'\*\*(.*?)\*\*', r'*\1*', content)

# Replace \dots with dots
content = content.replace(r'\dots', 'dots')

with open("typst/exams/CD-XepGhe-3Cot.typ", "w", encoding="utf-8") as f:
    f.write(content)

print("Replacement complete.")
