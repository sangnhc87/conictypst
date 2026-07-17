import json, cv2, numpy as np, os, subprocess

with open("templates.json", "r") as f:
    t = json.load(f)

for k, v in t.items():
    if k != '12-4-6ngang': continue
    subprocess.run(["typst", "compile", "--ppi", "144", "--root", "/Users/admin/conictypst", f"templates/{k}.typ", f"empty_{k}.png"], check=True)
    img = cv2.imread(f"empty_{k}.png")
    scale = 144.0 / 72.0
    
    # We must use unwarped coords from old_templates.json?
    # NO! templates.json HAS unwarped coords?
    # Wait, earlier I found templates.json HAS warped coords (1500x1116) because fix_templates_final.py overwrote it?
    # Let me check templates.json mcq 1!
