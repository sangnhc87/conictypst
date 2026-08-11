import xml.etree.ElementTree as ET
import re

tree = ET.parse("sang-math-omr/templates/a3-cat-phach-full-1.svg")
root = tree.getroot()
ns = {'svg': 'http://www.w3.org/2000/svg'}

# Find circles
circles = root.findall('.//svg:circle', ns)
# Find paths
paths = root.findall('.//svg:path', ns)

print(f"Found {len(circles)} circles and {len(paths)} paths.")

bubbles = []
for p in paths:
    d = p.get('d', '')
    if 'A 4.3' in d or 'a 4.3' in d or 'A 4.5' in d or 'a 4.5' in d:
        bubbles.append(d)
        
print(f"Found {len(bubbles)} bubble paths.")

markers = []
tracking = []
for p in paths:
    d = p.get('d', '')
    if 'h 12 v 12 h -12 z' in d.lower() or 'v 12 h 12 v -12 z' in d.lower():
        markers.append(d)
    if 'h 10 v 10 h -10 z' in d.lower() or 'v 10 h 10 v -10 z' in d.lower():
        tracking.append(d)

print(f"Found {len(markers)} markers and {len(tracking)} tracking markers.")

# try traversing groups to compute transforms
def get_transform(transform_str):
    if transform_str.startswith('matrix(') and transform_str.endswith(')'):
        parts = transform_str[7:-1].split()
        return float(parts[4]), float(parts[5])
    return 0, 0

def traverse(node, current_transform):
    cx, cy = current_transform
    trans = node.get('transform', '')
    if trans:
        dx, dy = get_transform(trans)
        cx += dx
        cy += dy
        
    for child in node:
        traverse(child, (cx, cy))
        
