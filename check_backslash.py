import glob
import re

files = glob.glob('typst/sach/day-so-chuong3/*.typ')
for f in files:
    with open(f, 'r', encoding='utf-8') as file:
        content = file.read()
    
    # Check if there are any `\` at the end of line without a preceding space
    # (ignoring lines that end with `\ ` or `\\`)
    matches = re.findall(r'([^\s\\])\\$', content, re.MULTILINE)
    if matches:
        print(f"{f}: found {len(matches)} unspaced backslashes at end of line")
