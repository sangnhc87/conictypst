with open("typst/exams/CD-XepGhe-3Cot.typ", "r", encoding="utf-8") as f:
    content = f.read()

# Replace \sum with sum
content = content.replace(r'\sum', 'sum')

# Replace \approx with approx
content = content.replace(r'\approx', 'approx')

# Replace \times with times
content = content.replace(r'\times', 'times')

# Replace \dots with dots (just in case)
content = content.replace(r'\dots', 'dots')

with open("typst/exams/CD-XepGhe-3Cot.typ", "w", encoding="utf-8") as f:
    f.write(content)

print("Math cleanup complete.")
