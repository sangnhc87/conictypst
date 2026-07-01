import re
import glob
import subprocess

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
    "OB": "O B",
    "OC": "O C",
    "OD": "O D",
    "AB": "A B",
    "AC": "A C",
    "AD": "A D",
    "BC": "B C",
    "BD": "B D",
    "CD": "C D",
    "IA": "I A",
    "IB": "I B",
    "IC": "I C",
    "ID": "I D",
    "SA": "S A",
    "SB": "S B",
    "SC": "S C",
    "SD": "S D",
    "pH": "p H",
    "mn": "m n",
    "kt": "k t",
    "tb": "t b",
    "SN": "S N",
    "cm": "c m",
    "pr": "p r",
    "dot0": "degree",
    "k2π": "k 2 pi",
    "chop": "chóp"
}

def fix_file(f):
    if "modules" in f:
        return True
    
    # Read original
    with open(f, 'r') as file:
        content = file.read()
    
    # Fix the #mt-hd inside #hd(
    content = content.replace("  #mt-hd", "  mt-hd")
    content = content.replace("  #nd-hd", "  nd-hd")
    content = content.replace("  #sp-hd", "  sp-hd")
    content = content.replace("  #tc-hd", "  tc-hd")
    
    with open(f, 'w') as file:
        file.write(content)
        
    loop_count = 0
    while True:
        loop_count += 1
        if loop_count > 15:
            print(f"❌ {f} aborted due to infinite loop.")
            return False
            
        res = subprocess.run(['typst', 'compile', '--root', '.', f], capture_output=True, text=True)
        if res.returncode == 0:
            print(f"✅ {f} compiled successfully.")
            return True
            
        err = res.stderr
        fixed = False
        
        # unclosed delimiter
        m = re.search(r'error: unclosed delimiter\s*.*?┌─ .*?:(\d+):', err, re.DOTALL)
        if m:
            line_num = int(m.group(1))
            with open(f, 'r') as file:
                lines = file.readlines()
            
            line = lines[line_num - 1]
            if "]" not in line and ")" not in line and "}" not in line:
                lines[line_num - 1] = line.rstrip() + " ]\n"
            else:
                lines[line_num - 1] = line.rstrip() + " ]\n" # just add a bracket anyway
            
            with open(f, 'w') as file:
                file.writelines(lines)
            fixed = True
            
        # unexpected closing bracket
        m = re.search(r'error: unexpected closing bracket\s*.*?┌─ .*?:(\d+):(\d+)', err, re.DOTALL)
        if m:
            line_num = int(m.group(1))
            col_num = int(m.group(2))
            with open(f, 'r') as file:
                lines = file.readlines()
            line = lines[line_num - 1]
            if col_num - 1 < len(line):
                lines[line_num - 1] = line[:col_num - 1] + line[col_num:]
                with open(f, 'w') as file:
                    file.writelines(lines)
                fixed = True
                
        # expected semicolon or line break
        m = re.search(r'error: expected semicolon or line break\s*.*?┌─ .*?:(\d+):', err, re.DOTALL)
        if m:
            line_num = int(m.group(1))
            with open(f, 'r') as file:
                lines = file.readlines()
            line = lines[line_num - 1]
            if "\\n" in line:
                lines[line_num - 1] = line.replace("\\n", " \\n ")
            else:
                lines[line_num - 1] = line.rstrip() + "\n"
            with open(f, 'w') as file:
                file.writelines(lines)
            fixed = True
            
        # missing argument: denom
        m_denom = re.search(r'error: missing argument: denom\s*.*?┌─ .*?:(\d+):', err, re.DOTALL)
        if m_denom and not fixed:
            line_num = int(m_denom.group(1))
            with open(f, 'r') as file:
                lines = file.readlines()
            
            line = lines[line_num - 1]
            if 'frac' in line:
                if ')(' in line:
                    lines[line_num - 1] = line.replace(')(', ', ')
                elif 'frac(' in line and ',' not in line[line.find('frac('):line.find('frac(')+15]:
                    lines[line_num - 1] = line.replace('frac(', 'frac(1,')
                with open(f, 'w') as file:
                    file.writelines(lines)
                fixed = True
                
        # unexpected argument
        m = re.search(r'error: unexpected argument\s*.*?┌─ .*?:(\d+):', err, re.DOTALL)
        if m and not fixed:
            line_num = int(m.group(1))
            with open(f, 'r') as file:
                lines = file.readlines()
            line = lines[line_num - 1]
            lines[line_num - 1] = line.replace('overline(', 'overline( ')
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
                new_line = line.replace(var, replacements[var])
            else:
                if len(var) >= 2 and var.isalpha():
                    spaced = " ".join(list(var))
                    new_line = line.replace(var, spaced)
                else:
                    print(f"Cannot fix unknown variable {var} at {f}:{line_num}")
                    break
                    
            if new_line != line:
                lines[line_num - 1] = new_line
                with open(f, 'w') as file:
                    file.writelines(lines)
                fixed = True
            else:
                print(f"Could not change line for variable {var} at {f}:{line_num}")
                break
            
        if not fixed:
            print(f"❌ {f} failed with other error.")
            print(err)
            break

for f in files:
    fix_file(f)
