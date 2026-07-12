import os

with open('index.html', 'r') as f:
    html = f.read()

search = "tlnSection = parts.join('\\n');"
replace = """tlnSection = parts.join('\\n');
                if (isA5) {
                    tlnSection = `#scale(x: 85%, y: 85%, origin: top-left)[\\n${tlnSection}\\n]`;
                }"""

if search in html and "scale(x: 85%" not in html:
    html = html.replace(search, replace)
    with open('index.html', 'w') as f:
        f.write(html)
    print("Patched tlnSection with scale for A5!")
else:
    print("Already patched or not found.")
