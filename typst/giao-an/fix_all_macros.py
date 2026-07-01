import os
import glob
import re

directories = ['khoi-10', 'khoi-11', 'khoi-12']
files = []
for d in directories:
    files.extend(glob.glob(f'/Users/admin/conictypst/typst/giao-an/{d}/*.typ'))

print(f"Found {len(files)} typst files to process.")

pattern = re.compile(r'#(mt|nd|sp|tc)-hd:\s*\[')

for file in files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace "#mt-hd: [" with "#mt-hd[" and so on.
    new_content = pattern.sub(r'#\1-hd[', content)
    
    # Also fix some cases where it might just be '#mt-hd :['
    new_content = re.sub(r'#(mt|nd|sp|tc)-hd\s*:\s*\[', r'#\1-hd[', new_content)
    
    if new_content != content:
        with open(file, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Fixed macros in {file}")
    else:
        print(f"No changes needed for {file}")
