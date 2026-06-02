import re
import os

dir_path = "/Users/admin/conictypst/typst/sach/hinh-hoc-phang-chuong5/parts"
files = [f for f in os.listdir(dir_path) if f.endswith(".typ")]

replacements = {
    "\\Leftrightarrow": " <=> ",
    "\\Rightarrow": " => ",
    "\\leftrightarrow": " <-> ",
    "\\rightarrow": " -> ",
    "\\leftarrow": " <- ",
    "\\approx": " approx ",
    "\\pm": " +- ",
    "\\mp": " -+ ",
    "\\cdot": " dot ",
    "\\in": " in ",
    "\\le": " <= ",
    "\\ge": " >= ",
    "\\ne": " != ",
    "\\times": " times ",
    "\\infty": " infinity ",
    "\\pi": " pi ",
    "\\sin": " sin ",
    "\\cos": " cos ",
    "\\tan": " tan ",
    "\\theta": " theta ",
    "\\phi": " phi ",
    "\\omega": " omega ",
    "\\Omega": " Omega ",
    "\\lambda": " lambda ",
    "\\mu": " mu ",
    "\\tau": " tau ",
    "\\kappa": " kappa ",
}

def fix_dashed_strokes(content):
    pattern = r'stroke:\s*([\d\.]+)pt\s*\+\s*([^\+]+?)\s*\+\s*"dashed"'
    def repl(m):
        thickness = m.group(1)
        paint = m.group(2).strip()
        return f'stroke: (paint: {paint}, thickness: {thickness}pt, dash: "dashed")'
    return re.sub(pattern, repl, content)

for fname in files:
    fpath = os.path.join(dir_path, fname)
    with open(fpath, "r", encoding="utf-8") as f:
        content = f.read()
    
    new_content = content.replace("**", "*")
    new_content = fix_dashed_strokes(new_content)
    
    for pattern, repl in replacements.items():
        if pattern in new_content:
            print(f"Replacing {pattern} in {fname}")
            new_content = new_content.replace(pattern, repl)
            
    if new_content != content:
        print(f"Writing changes to {fname}")
        with open(fpath, "w", encoding="utf-8") as f:
            f.write(new_content)
