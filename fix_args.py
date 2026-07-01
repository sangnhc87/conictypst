import re
import glob

files = glob.glob('typst/giao-an/**/*.typ', recursive=True)

for f in files:
    if "modules" in f: continue
    
    with open(f, 'r') as file:
        content = file.read()
        
    # Add colons
    content = re.sub(r'\b(mt-hd)\s*\[', r'\1: [', content)
    content = re.sub(r'\b(nd-hd)\s*\[', r'\1: [', content)
    content = re.sub(r'\b(sp-hd)\s*\[', r'\1: [', content)
    content = re.sub(r'\b(tc-hd)\s*\[', r'\1: [', content)
    
    # Add commas after closing brackets of these arguments if followed by another argument
    content = re.sub(r'\]\s*(nd-hd:)', r'],\n  \1', content)
    content = re.sub(r'\]\s*(sp-hd:)', r'],\n  \1', content)
    content = re.sub(r'\]\s*(tc-hd:)', r'],\n  \1', content)
    
    with open(f, 'w') as file:
        file.write(content)
