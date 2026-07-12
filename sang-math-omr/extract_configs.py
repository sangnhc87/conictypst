import re

with open('index.html', 'r') as f:
    html = f.read()

# Extract the FIRST occurrence of the OpenCV configs
match = re.search(r"'ds-20-ngang': \{.*?\"numQ\": 20,.*?\]\s*\]\s*\}\s*\},", html, re.DOTALL)
if match:
    with open('ds-20-ngang.json', 'w') as f:
        f.write("{\n" + match.group(0) + "\n}")

match2 = re.search(r"'ds20-tln10-ngang': \{.*?\"numQ\": 20,.*?\]\s*\]\s*\}\s*\},", html, re.DOTALL)
if match2:
    with open('ds20-tln10-ngang.json', 'w') as f:
        f.write("{\n" + match2.group(0) + "\n}")
