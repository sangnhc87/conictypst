import subprocess
import re
import glob

files = glob.glob('typst/giao-an/**/*.typ', recursive=True)

replacements = {
    "cup": "union",
    "cap": "sect",
    "setdiff": "setminus",
    "emptyset": "empty",
    "varnothing": "empty",
    "cdot": "dot",
    "circ": "degree",
    "iff": "arrow.l.r.double",
    "ne": "!=",
    "verline": "|",
    "k2pi": "k 2 pi",
    "Ox": "O x",
    "Oy": "O y",
    "Oz": "O z",
    "Oxy": "O x y",
    "Oxyz": "O x y z",
    "ax": "a x",
    "ab": "a b",
    "ightarrow": "rightarrow",
    "irc": "degree",
    "ge": ">=",
    "le": "<=",
    "setminus": "setminus",
    "rac": "frac",
    "os": "cos",
    "ABCD": "A B C D",
    "OA": "O A",
    "pH": "p H",
    "mn": "m n",
    "kt": "k t",
    "tb": "t b",
    "AB": "A B",
    "SN": "S N",
    "cm": "c m",
}

for f in files:
    if "modules" in f:
        continue
        
    with open(f, 'r') as file:
        content = file.read()
    orig = content
    
    if '#show: giao-an.with' in content and '#import' not in content[:150]:
        depth = f.count('/') - 2
        if depth <= 0:
            import_path = "./modules/giao-an.typ"
        else:
            import_path = "../" * depth + "modules/giao-an.typ"
        content = f"""#import "{import_path}": *
#import "@preview/cetz:0.3.3"

""" + content
        with open(f, 'w') as file:
            file.write(content)

    loop_count = 0
    while True:
        loop_count += 1
        if loop_count > 10:
            print(f"❌ {f} aborted due to infinite loop.")
            break
            
        res = subprocess.run(['typst', 'compile', '--root', '.', f], capture_output=True, text=True)
        if res.returncode == 0:
            print(f"✅ {f} compiled successfully.")
            break
            
        err = res.stderr
        fixed = False
        
        # unclosed delimiter
        m = re.search(r'error: unclosed delimiter\s*.*?┌─ .*?:(\d+):', err, re.DOTALL)
        if m:
            line_num = int(m.group(1))
            with open(f, 'r') as file:
                lines = file.readlines()
            lines[line_num - 1] = lines[line_num - 1].rstrip() + " ]\n"
            with open(f, 'w') as file:
                file.writelines(lines)
            fixed = True
            
        # unknown variable
        m_var = re.search(r'error: unknown variable: (.*?)\s*┌─ .*?:(\d+):', err, re.DOTALL)
        if m_var and not fixed:
            var = m_var.group(1).strip()
            line_num = int(m_var.group(2))
            with open(f, 'r') as file:
                lines = file.readlines()
            
            line = lines[line_num - 1]
            if var in replacements:
                lines[line_num - 1] = line.replace(var, replacements[var])
            else:
                if len(var) >= 2 and var.isalpha():
                    spaced = " ".join(list(var))
                    lines[line_num - 1] = line.replace(var, spaced)
                else:
                    print(f"Cannot fix unknown variable {var} at {f}:{line_num}")
                    break
            
            with open(f, 'w') as file:
                file.writelines(lines)
            fixed = True
            
        # missing argument
        m_denom = re.search(r'error: missing argument: denom\s*.*?┌─ .*?:(\d+):', err, re.DOTALL)
        if m_denom and not fixed:
            line_num = int(m_denom.group(1))
            with open(f, 'r') as file:
                lines = file.readlines()
            
            line = lines[line_num - 1]
            if 'frac' in line:
                lines[line_num - 1] = line.replace(')(', ', ')
                with open(f, 'w') as file:
                    file.writelines(lines)
                fixed = True
            
        if not fixed:
            print(f"❌ {f} failed with other error.")
            print(err)
            break
