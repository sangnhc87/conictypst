import json

with open("template.json", "r") as f:
    tmpl = json.load(f)

# we want to reconstruct the '12-4-6ngang' object payload.
# we don't want to lose numQ, numSbd, numMade, scoring.
# they are at the top.

with open("index.html", "r") as f:
    html = f.read()

start_key = "'12-4-6ngang': {"
start_idx = html.find(start_key)
if start_idx == -1:
    print("start not found")
    exit(1)

warp_idx = html.find('"warp":', start_idx)
tn50_idx = html.find("'tn-50':", warp_idx)

# the string to replace is from warp_idx to just before tn50_idx (actually before `\n  'tn-50':`)
# Let's find the `},` before `'tn-50':`
end_idx = html.rfind("},", warp_idx, tn50_idx) + 1

payload_str = json.dumps(tmpl, indent=2)
# payload_str is {\n  "warp": ..., \n  "mcq": ... \n}
# we want everything inside the outer brackets.
inner_str = payload_str.strip()[1:-1].strip()

new_html = html[:warp_idx] + inner_str + "\n  " + html[end_idx:]

with open("index.html", "w") as f:
    f.write(new_html)

print("done patching 12-4-6ngang")
