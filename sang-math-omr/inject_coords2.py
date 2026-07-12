import sys, json

template = sys.argv[1]
coords_file = sys.argv[2]

with open(coords_file, 'r') as f:
    coords = json.load(f)
coords_str = json.dumps(coords, indent=4)

with open('index.html', 'r') as f:
    html = f.read()

# find where TEMPLATES = { is
start_idx = html.find("const TEMPLATES = {")
if start_idx == -1:
    print("Cannot find TEMPLATES")
    sys.exit(1)

# we just search for f"'{template}': {{"
search_str = f"'{template}': {{"
if search_str in html:
    # replace existing
    start = html.find(search_str)
    # find matching brace for template
    depth = 0
    end = -1
    for i in range(start + len(f"'{template}': "), len(html)):
        if html[i] == '{': depth += 1
        elif html[i] == '}':
            depth -= 1
            if depth == 0:
                end = i + 1
                break
    
    html = html[:start] + f"'{template}': " + coords_str + html[end:]
    with open('index.html', 'w') as f:
        f.write(html)
    print(f"Replaced {template} in index.html!")
else:
    # insert at beginning
    insert_pos = html.find("{", start_idx) + 1
    html = html[:insert_pos] + f"\n    '{template}': {coords_str}," + html[insert_pos:]
    with open('index.html', 'w') as f:
        f.write(html)
    print(f"Inserted {template} into index.html!")
