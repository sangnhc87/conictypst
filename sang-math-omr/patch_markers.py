import os

files = ['templates/ds-12.typ', 'templates/tln-10.typ']

for f in files:
    with open(f, 'r') as file:
        content = file.read()
    
    # Remove markers outside scale block
    content = content.replace('#place(top + left, dx: -2mm, dy: -2mm, marker)\n', '')
    content = content.replace('#place(top + right, dx: 2mm, dy: -2mm, marker)\n', '')
    content = content.replace('#place(bottom + left, dx: -2mm, dy: 2mm, marker)\n', '')
    content = content.replace('#place(bottom + right, dx: 2mm, dy: 2mm, marker)\n', '')
    content = content.replace('#align(top + center)[\n  #scale(x: if false { 88% } else { 95% }, y: if false { 88% } else { 95% }, origin: top)[\n    #block(width: 100%, height: 0pt)[', '#align(if false { center + horizon } else { top + center })[\n  #scale(x: if false { 88% } else { 95% }, y: if false { 88% } else { 95% }, origin: if false { center } else { top })[\n    #block(width: 100%, height: 0pt)[\n      #place(left, dx: -5mm, dy: -5mm, marker)\n      #place(right, dx: 5mm, dy: -5mm, marker)\n    ]')
    
    # Put bottom markers back
    content = content.replace('])\n\n\n// ── TỰ LUẬN VIẾT TAY ────────────────────────────────────────\n\n\n  ]\n]', '])\n\n\n// ── TỰ LUẬN VIẾT TAY ────────────────────────────────────────\n\n\n    #block(width: 100%, height: 0pt)[\n      #place(left, dx: -5mm, dy: 5mm, marker)\n      #place(right, dx: 5mm, dy: 5mm, marker)\n    ]\n  ]\n]')
    content = content.replace('  ])\n\n\n// ── TỰ LUẬN VIẾT TAY ────────────────────────────────────────\n\n\n  ]\n]', '  ])\n\n\n// ── TỰ LUẬN VIẾT TAY ────────────────────────────────────────\n\n\n    #block(width: 100%, height: 0pt)[\n      #place(left, dx: -5mm, dy: 5mm, marker)\n      #place(right, dx: 5mm, dy: 5mm, marker)\n    ]\n  ]\n]')
    
    with open(f, 'w') as file:
        file.write(content)

print("Patched.")
