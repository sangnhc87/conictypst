import os
import sys
import glob

sys.path.append("/Users/admin/conictypst/typst/sach/DECUONG12-HK1/scorm")
import parse_typ

base_dir = "/Users/admin/conictypst/typst/sach/DECUONG12-HK1"
chapters = ["chuong-01", "chuong-02", "chuong-03"]

for chapter in chapters:
    chap_dir = os.path.join(base_dir, chapter)
    typ_files = glob.glob(os.path.join(chap_dir, "bai*.typ"))
    
    for filepath in typ_files:
        try:
            questions = parse_typ.parse_file(filepath)
        except:
            continue
            
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
            
        changed = False
        for q in questions:
            # fix missing true for TN and DS
            if q.q_type == "tn" and not q.correct:
                if len(q.options) > 0:
                    opt0 = q.options[0]
                    # Attempt to replace `[$opt0$]` or `[opt0]` with `True([$opt0$])` or similar
                    # It's safest to just search for the exact option block in the text.
                    # parse_typ stripped the outer [] and any wrapper macros.
                    # Let's do a simple regex that finds the first option of this question.
                    # We will use re.sub just inside the question block.
                    pass
            elif q.q_type == "ds" and len(q.correct) < 4:
                pass
                
        # Actually it's easier to just blindly replace the known options:
        reps = [
            ("[$arrow(F_1)$]", "True([$arrow(F_1)$])"),
            ("[$arrow(P)$]", "True([$arrow(P)$])"),
            ("[$+$]", "True([$+$])"),
            ("[Mặt đất]", "True([Mặt đất])"),
            ("[Tường]", "True([Tường])"),
            ("[Đường lộ]", "True([Đường lộ])"),
            ("[Kênh nước]", "True([Kênh nước])"),
            ("[$y=1$]", "True([$y=1$])"),
            ("[$I$]", "True([$I$])"),
            ("[$r$]", "True([$r$])"),
            ("[$R$]", "True([$R$])")
        ]
        
        for old, new in reps:
            if "\n    " + old + "," in content:
                content = content.replace("\n    " + old + ",", "\n    " + new + ",")
                changed = True
            elif "\n    " + old + "\n" in content:
                content = content.replace("\n    " + old + "\n", "\n    " + new + "\n")
                changed = True
            elif "\n    " + old + ",\n" in content:
                content = content.replace("\n    " + old + ",\n", "\n    " + new + ",\n")
                changed = True

        if changed:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"Fixed missing True in {os.path.basename(filepath)}")
