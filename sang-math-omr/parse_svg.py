import xml.etree.ElementTree as ET
import re

tree = ET.parse('test.svg')
root = tree.getroot()
ns = {'svg': 'http://www.w3.org/2000/svg'}

# Find all paths or circles
shapes = []
for elem in root.iter():
    if elem.tag.endswith('circle'):
        shapes.append(elem.attrib)
    elif elem.tag.endswith('path'):
        shapes.append(elem.attrib)

# Look for circles
circles = []
for s in shapes:
    if 'cx' in s and 'cy' in s and 'r' in s:
        circles.append(s)
    elif 'd' in s:
        # A circle path typically looks like:
        # M x y A r r 0 1 1 x y A r r 0 1 1 x y Z
        d = s['d']
        if 'a' in d.lower() or 'c' in d.lower():
            if 'fill' in s and s.get('fill', '') == 'none':
                circles.append(s)
            elif 'stroke' in s:
                circles.append(s)

print(f"Found {len(circles)} possible circles")
if circles:
    print(circles[:5])
