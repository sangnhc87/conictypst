import json
import re

with open('templates_warped.json', 'r') as f:
    t = json.load(f)

for k, v in t.items():
    H = v['warp']['height']
    v['warp']['TL'] = [0, 0]
    v['warp']['TR'] = [1500, 0]
    v['warp']['BR'] = [1500, H]
    v['warp']['BL'] = [0, H]

with open('templates_warped.json', 'w') as f:
    json.dump(t, f)

with open("index.html", "r") as f:
    content = f.read()

new_js = "window.TEMPLATES = " + json.dumps(t) + ";"
content = re.sub(r"window\.TEMPLATES\s*=\s*\{.*?\};", new_js, content, flags=re.DOTALL)

with open("index.html", "w") as f:
    f.write(content)
print("Updated index.html with correct warp corners!")
