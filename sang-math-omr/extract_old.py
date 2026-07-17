import re, json

with open('old_index.html', 'r') as f:
    content = f.read()
    
m = re.search(r'window\.TEMPLATES\s*=\s*(\{.*?\});', content, re.DOTALL)
if m:
    with open('old_templates.json', 'w') as out:
        # In JS, the keys might not be strictly quoted, but wait, I injected it with json.dumps(..., indent=2) before.
        # BUT what if the ORIGINAL index.html had non-strict JSON?
        # Let's just try to parse it. If it was hand-written, we might need a regex fix.
        # Actually, let's just write the string to a .js file and evaluate it using Node!
        pass

