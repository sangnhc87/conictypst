import xml.etree.ElementTree as ET
import json

def get_transform(transform_str):
    if transform_str.startswith('matrix(') and transform_str.endswith(')'):
        parts = transform_str[7:-1].split()
        return float(parts[4]), float(parts[5])
    elif transform_str.startswith('translate(') and transform_str.endswith(')'):
        parts = transform_str[10:-1].split()
        if ',' in parts[0]: parts = transform_str[10:-1].split(',')
        return float(parts[0]), float(parts[1] if len(parts)>1 else 0)
    return 0, 0

tree = ET.parse('a3_test.svg')
root = tree.getroot()

bubbles = []
markers = []

def traverse(node, current_transform):
    cx, cy = current_transform
    trans = node.get('transform', '')
    if trans:
        dx, dy = get_transform(trans)
        cx += dx
        cy += dy
        
    if node.tag.endswith('path') or node.tag.endswith('rect'):
        stroke = node.get('stroke', '')
        fill = node.get('fill', '')
        d = node.get('d', '')
        if stroke == '#666666' or stroke == '#333333':
            # Check if it's a circle
            if 'c' in d or 'a' in d:
                bubbles.append({'x': cx, 'y': cy})
        elif fill == '#000000':
            markers.append({'x': cx, 'y': cy})
            
    for child in node:
        traverse(child, (cx, cy))

traverse(root, (0, 0))

print(f"Found {len(bubbles)} bubbles and {len(markers)} black objects.")

bubbles.sort(key=lambda b: (b['y'], b['x']))

with open('a3_bubbles_raw.json', 'w') as f:
    json.dump({'markers': markers, 'bubbles': bubbles}, f, indent=2)
