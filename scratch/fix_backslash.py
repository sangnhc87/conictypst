import os

dir_path = "/Users/admin/conictypst/typst/sach/duong-mat-tham-so-conicoid-3d/parts"
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

for fname in files:
    fpath = os.path.join(dir_path, fname)
    with open(fpath, "r", encoding="utf-8") as f:
        content = f.read()
    
    new_content = content
    for pattern, repl in replacements.items():
        if pattern in new_content:
            print(f"Replacing {pattern} in {fname}")
            new_content = new_content.replace(pattern, repl)
            
    if new_content != content:
        with open(fpath, "w", encoding="utf-8") as f:
            f.write(new_content)
