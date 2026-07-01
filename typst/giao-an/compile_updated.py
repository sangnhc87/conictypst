import os
import glob
import subprocess

count = 0
for d in ['khoi-10', 'khoi-11', 'khoi-12']:
    for typ_file in glob.glob(f'/Users/admin/conictypst/typst/giao-an/{d}/*.typ'):
        pdf_file = typ_file.replace('.typ', '.pdf')
        docx_file = typ_file.replace('.typ', '.docx')
        
        typ_mtime = os.path.getmtime(typ_file)
        
        needs_compile = False
        if not os.path.exists(pdf_file) or os.path.getmtime(pdf_file) < typ_mtime:
            needs_compile = True
            
        if not os.path.exists(docx_file) or os.path.getmtime(docx_file) < typ_mtime:
            needs_compile = True
            
        if needs_compile:
            print(f"Compiling {typ_file}...")
            subprocess.run(['typst', 'compile', typ_file, '--root', '/Users/admin/conictypst/typst/giao-an'])
            subprocess.run(['python3', '/Users/admin/conictypst/typst/giao-an/xuat-docx.py', typ_file], cwd='/Users/admin/conictypst/typst/giao-an')
            count += 1

print(f"Finished compiling {count} updated files.")
