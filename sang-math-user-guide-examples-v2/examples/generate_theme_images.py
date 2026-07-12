import os
import subprocess
import shutil

themes = ["classic", "navy-gold", "teal-pro", "violet"]
base_file = "/Users/admin/conictypst/sang-math-user-guide-examples-v2/examples/05_full_de_thi_mau.typ"
root_dir = "/Users/admin/conictypst"

with open(base_file, "r") as f:
    original_content = f.read()

for theme in themes:
    new_content = original_content.replace("#let preset = exam-preset(", f'#let theme = "{theme}"\n#let preset = exam-preset(')
    
    tmp_file = "/Users/admin/conictypst/sang-math-user-guide-examples-v2/examples/tmp_de_thi.typ"
    with open(tmp_file, "w") as f:
        f.write(new_content)
        
    subprocess.run(["typst", "compile", "--root", root_dir, tmp_file, "/Users/admin/conictypst/sang-math-user-guide-examples-v2/examples/tmp_out-{n}.png"], check=True)
    
    shutil.move("/Users/admin/conictypst/sang-math-user-guide-examples-v2/examples/tmp_out-1.png", f"/Users/admin/conictypst/sang-math-user-guide-examples-v2/examples/theme_{theme}.png")
    
    for i in range(2, 20):
        try:
            os.remove(f"/Users/admin/conictypst/sang-math-user-guide-examples-v2/examples/tmp_out-{i}.png")
        except:
            pass

os.remove(tmp_file)
print("Done extracting images.")
