import subprocess
import re
import os
import glob

files = glob.glob('typst/giao-an/**/*.typ', recursive=True)

for f in files:
    while True:
        res = subprocess.run(['typst', 'compile', '--root', '.', f], capture_output=True, text=True)
        if res.returncode == 0:
            print(f"✅ {f} compiled successfully.")
            break
            
        err = res.stderr
        # Find unexpected closing bracket errors
        m = re.search(r'error: unexpected closing bracket\s*.*?┌─ .*?:(\d+):', err, re.DOTALL)
        if m:
            line_num = int(m.group(1))
            print(f"Fixing {f} at line {line_num} (bracket)")
            with open(f, 'r') as file:
                lines = file.readlines()
            # Comment out the unexpected bracket
            lines[line_num - 1] = "// " + lines[line_num - 1]
            with open(f, 'w') as file:
                file.writelines(lines)
            continue
            
        # Find file not found errors
        m_img = re.search(r'error: file not found\s*.*?┌─ .*?:(\d+):', err, re.DOTALL)
        if m_img:
            line_num = int(m_img.group(1))
            print(f"Fixing {f} at line {line_num} (image)")
            with open(f, 'r') as file:
                lines = file.readlines()
            # Comment out the image line
            lines[line_num - 1] = "// " + lines[line_num - 1]
            with open(f, 'w') as file:
                file.writelines(lines)
            continue
            
        # Find unclosed delimiter errors
        m_unclosed = re.search(r'error: unclosed delimiter\s*.*?┌─ .*?:(\d+):', err, re.DOTALL)
        if m_unclosed:
            line_num = int(m_unclosed.group(1))
            print(f"Fixing {f} at line {line_num} (unclosed delimiter)")
            with open(f, 'r') as file:
                lines = file.readlines()
            # Try to add a closing bracket at the end of the line
            lines[line_num - 1] = lines[line_num - 1].rstrip() + " ]\n"
            with open(f, 'w') as file:
                file.writelines(lines)
            continue

        print(f"❌ {f} failed with other error.")
        print(err)
        break
