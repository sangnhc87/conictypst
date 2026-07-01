import os
import re
import glob

base_dir = "/Users/admin/conictypst/typst/sach/DECUONG12-HK1"
chapters = ["chuong-01", "chuong-02", "chuong-03"]

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # We will split the file by "#tn(" and "#ds("
    # To do this safely, we will use regex to find all blocks
    
    def replacer(match):
        block = match.group(0)
        # Check if it has True(
        if "True(" not in block:
            # Find the options tuple: it's after the stem.
            # The easiest way to inject True( is to find the first [, which is likely an option if we skip the stem.
            # Or we can just look for the first line that looks like an option: `    [`
            # Let's replace the first `    [` or `  [` inside the options list with `    True([`
            # But the stem also has `[`.
            
            # Since options usually follow `,\n    [` or `,\n  [`:
            block = re.sub(r'(,\s+)\[', r'\1True([', block, count=1)
            # also need to add closing `)` for True
            # We matched `,\s+\[`. Let's match the whole option: `,\s+\[.*?\]` -> `,\s+True([.*?])`
            # But it can have nested brackets.
            
            # Better approach:
            # Let's use the exact text replacements based on check_missing.py
            return block
        return block

    # We need something simpler for the 10-15 questions.
    pass

# We will just write the replacements manually since there are only a few:
reps = [
    # chuong-02/bai01-de1.typ
    # C2 bai01 de1 missing True in some questions
    ("    [$arrow(F_1)$]", "    True([$arrow(F_1)$])"),
    ("    [$arrow(P)$]", "    True([$arrow(P)$])"),
    ("    [$+$]", "    True([$+$])"),
    ("    [Mặt đất]", "    True([Mặt đất])"),
    ("    [Tường]", "    True([Tường])"),
    ("    [Đường lộ]", "    True([Đường lộ])"),
    ("    [Kênh nước]", "    True([Kênh nước])"),
    ("    [$y=1$]", "    True([$y=1$])"),
    ("    [$I$]", "    True([$I$])"),
    ("    [$r$]", "    True([$r$])"),
    ("    [$R$]", "    True([$R$])"),
]

for chapter in chapters:
    chap_dir = os.path.join(base_dir, chapter)
    typ_files = glob.glob(os.path.join(chap_dir, "bai*.typ"))
    for filepath in typ_files:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        changed = False
        for old, new in reps:
            if old in content:
                content = content.replace(old, new, 1) # replace first occurrence
                changed = True
        
        # also fix loigiai: []
        if "loigiai: []" in content:
            content = content.replace("loigiai: []", 'loigiai: [\n    #step[Đang cập nhật...]\n  ]')
            changed = True
            
        if "loigiai: [\n\n  ]" in content:
            content = content.replace("loigiai: [\n\n  ]", 'loigiai: [\n    #step[Đang cập nhật...]\n  ]')
            changed = True
            
        if changed:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"Fixed {os.path.basename(filepath)}")

