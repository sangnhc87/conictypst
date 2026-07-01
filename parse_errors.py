import re

with open('errors5.log', 'r') as f:
    content = f.read()

files = content.split('--- ')
for file_content in files[1:]:
    lines = file_content.strip().split('\n')
    filename = lines[0].strip().rstrip(' ---')
    print(f"{filename}: {lines[1]}")

