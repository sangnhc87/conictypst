import re

with open('CD-NhanDangTamGiac.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# We need to find:
# #tn(
#   [Question],
#   [A],
#   [B],
#   [C],
#   [D],
#   loigiai: [
# Let's use a regex to capture these parts.

pattern = re.compile(r'#tn\(\s*(\[.*?\]),\s*(\[.*?\]),\s*(\[.*?\]),\s*(\[.*?\]),\s*(\[.*?\]),\s*loigiai:\s*\[', re.DOTALL)

def replacer(match):
    q = match.group(1)
    a = match.group(2)
    b = match.group(3)
    c = match.group(4)
    d = match.group(5)
    return f'#tn(\n  {q},\n  (\n    {a},\n    {b},\n    {c},\n    {d}\n  ),\n  loigiai: ['

# The regex might fail if there are nested brackets in the question.
# Since my generated file doesn't have complex nested brackets in questions that would break a non-greedy match (well, let's just do it manually with a small script that parses commas if regex fails).
