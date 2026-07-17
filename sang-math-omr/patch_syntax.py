files = ['templates/ds-12.typ', 'templates/tln-10.typ']

for f in files:
    with open(f, 'r') as file:
        content = file.read()
    
    # Fix spacing
    content = content.replace('spacing: 0pt', 'column-gutter: 0pt, row-gutter: 0pt')
    
    with open(f, 'w') as file:
        file.write(content)

print("Patched.")
