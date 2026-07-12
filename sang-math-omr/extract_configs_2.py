import re

with open('index.html', 'r') as f:
    html = f.read()

match = re.search(r"'tln-10-ngang': \{.*?\"numQ\": 10,.*?\]\s*\]\s*\}\s*\},", html, re.DOTALL)
if match:
    with open('tln-10-ngang.json', 'w') as f:
        f.write("{\n" + match.group(0) + "\n}")

