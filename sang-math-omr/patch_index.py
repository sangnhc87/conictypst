import json

with open("index.html", "r") as f:
    html = f.read()

with open("template.json", "r") as f:
    tmpl = json.load(f)

tmpl_str = json.dumps(tmpl, indent=2)

start_idx = html.find("const TEMPLATES = {")
end_idx = html.find("</script>", start_idx)

new_templates = f"const TEMPLATES = {{\n  '12-4-6ngang': {tmpl_str}\n}};\n"
new_html = html[:start_idx] + new_templates + html[end_idx:]

with open("index.html", "w") as f:
    f.write(new_html)

print("Updated index.html with new coordinates")
