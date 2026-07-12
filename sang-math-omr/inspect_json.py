import re
import json

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

start_idx = content.find("const TEMPLATES = {")
end_idx = content.find("};", start_idx) + 1
json_str = content[start_idx + 18:end_idx]

data = json.loads(json_str)
print("ds-12 keys:", data['ds-12'].keys())
print("tf keys:", data['ds-12']['tf'].keys())
print("tf[1]:", data['ds-12']['tf']['1'])
