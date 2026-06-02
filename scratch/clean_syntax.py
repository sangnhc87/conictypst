import re
import os

dir_path = "/Users/admin/conictypst/typst/sach/duong-mat-tham-so-conicoid-3d/parts"
files = [f for f in os.listdir(dir_path) if f.endswith(".typ")]

# We want to replace stroke patterns like:
# stroke: 0.5pt + gray + "dashed" -> stroke: (paint: gray, thickness: 0.5pt, dash: "dashed")
# stroke: 0.6pt + rgb("#64748B") + "dashed" -> stroke: (paint: rgb("#64748B"), thickness: 0.6pt, dash: "dashed")
# stroke: 1.0pt + rgb("#BE123C") + "dashed" -> stroke: (paint: rgb("#BE123C"), thickness: 1.0pt, dash: "dashed")

def fix_dashed_strokes(content):
    # Match pattern: stroke: (thickness) + (paint) + "dashed"
    # thickness can be something like 0.5pt, 0.6pt, 1.0pt, etc.
    # paint can be gray, rgb("...")
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
    
    # Save back
    if new_content != content:
        print(f"Writing changes to {fname}")
        with open(fpath, "w", encoding="utf-8") as f:
            f.write(new_content)
