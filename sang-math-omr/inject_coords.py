import json

with open('ds-20-ngang_coords.json', 'r') as f:
    coords = json.load(f)
coords_str = json.dumps(coords, indent=4)

with open('index.html', 'r') as f:
    html = f.read()

search_str = "'tln-10': {"
insert_str = f"'ds-20-ngang': {coords_str},\n    'tln-10': {{"

if search_str in html:
    if "'ds-20-ngang':" not in html:
        html = html.replace(search_str, insert_str)
        with open('index.html', 'w') as f:
            f.write(html)
        print("Injected ds-20-ngang into index.html!")
    else:
        start = html.find("'ds-20-ngang': {")
        end = html.find("'tln-10': {")
        html = html[:start] + f"'ds-20-ngang': {coords_str},\n    " + html[end:]
        with open('index.html', 'w') as f:
            f.write(html)
        print("Replaced ds-20-ngang in index.html!")
else:
    print("Could not find tln-10 in index.html to inject.")
