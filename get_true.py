import sys
import os

os.chdir("public/hdsd/typst")
try:
    with open("conic-toan/baigiang.typ", "r") as f:
        content = f.read()
    import re
    # Find definition of True
    for m in re.finditer(r'(let\s+True\s*\([^)]*\)\s*=.*)', content):
        print(m.group(1))
except Exception as e:
    print(e)
