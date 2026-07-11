import json
import re

with open("template.json", "r") as f:
    tmpl_data = json.load(f)

with open("index.html", "r") as f:
    html = f.read()

start_idx = html.find("'12-4-6ngang': {")
warp_idx = html.find('"warp":', start_idx)
match = re.search(r"\n\s*'tn-50': \{", html[warp_idx:])
end_idx = warp_idx + match.start()

json_str = json.dumps(tmpl_data, indent=2)
json_str = json_str.strip()[1:-1].strip() + "\n  },\n  "

new_html = html[:warp_idx] + json_str + html[end_idx:]

with open("index.html", "w") as f:
    f.write(new_html)
print("index.html template data patched!")
