import cv2, json, numpy as np, os, subprocess, random

# Set a fixed seed for reproducible mock generation (so we can predict answers if needed, though not strictly required)
random.seed(42)

with open('/Users/admin/conictypst/sang-math-omr/templates.json') as f:
    t = json.load(f)

mapping = {
    'thptqg-toan': 'thptqg-toan-2025'
}

for k, v in t.items():
    print(f"Generating mock for {k}...")
    typ_name = mapping.get(k, k)
    typ_path = f"/Users/admin/conictypst/sang-math-omr/templates/{typ_name}.typ"
    
    if not os.path.exists(typ_path):
        continue
        
    subprocess.run(["typst", "compile", "--ppi", "144", "--root", "/Users/admin/conictypst", typ_path, "empty_{p}.png"], check=True)
    img = cv2.imread("empty_1.png")
    
    filled_warped = []
    
    # SBD: Pick a random digit for each column
    if 'sbd' in v and v['sbd']:
        for col in v['sbd']:
            filled_warped.append(random.choice(col))
            
    # Mã đề: Pick a random digit for each column
    if 'made' in v and v['made']:
        for col in v['made']:
            filled_warped.append(random.choice(col))
            
    # MCQ: Pick a random option (A, B, C, or D)
    if 'mcq' in v and v['mcq']:
        for q, pts in v['mcq'].items():
            filled_warped.append(random.choice(pts))
            
    # TF: Pick a random option (True or False) for each sub-question
    if 'tf' in v and v['tf']:
        for q, subqs in v['tf'].items():
            for sq_name, pts in subqs.items():
                filled_warped.append(random.choice(pts))
                
    # TLN: Valid answers
    # Col 2 (0): -, 1..9
    # Col 3 (1): ',', 0..9
    # Col 4 (2): ',', 0..9
    # Col 5 (3): 0..9
    # Let's just pick a random digit for each column to form a 4-digit number (e.g. 1234)
    if 'tln' in v and v['tln']:
        for q, cols in v['tln'].items():
            # Col 2: digit 1-9 (index 1 to 9)
            if len(cols) > 0 and len(cols[0]) >= 10:
                filled_warped.append(random.choice(cols[0][1:]))
            # Col 3: digit 0-9 (index 1 to 10)
            if len(cols) > 1 and len(cols[1]) >= 11:
                filled_warped.append(random.choice(cols[1][1:]))
            # Col 4: digit 0-9 (index 1 to 10)
            if len(cols) > 2 and len(cols[2]) >= 11:
                filled_warped.append(random.choice(cols[2][1:]))
            # Col 5: digit 0-9 (index 0 to 9)
            if len(cols) > 3 and len(cols[3]) >= 10:
                filled_warped.append(random.choice(cols[3]))
                
    # Scale from 72 ppi (SVG pt space) to 144 ppi (PNG pixel space)
    scale = 144.0 / 72.0
    radius = int(3.8 * scale)
    if k == 'ds-12':
        radius = int(3.5 * scale)
        
    for p in filled_warped:
        px, py = int(p[0] * scale), int(p[1] * scale)
        # Fill circle
        cv2.circle(img, (px, py), radius, (0, 0, 0), -1)
        
    out_path = f"mock_new_{k}.png"
    cv2.imwrite(out_path, img)
    print(f"Saved {out_path} with {len(filled_warped)} filled bubbles.")

    # cleanup empty images
    if os.path.exists("empty_1.png"): os.remove("empty_1.png")
    if os.path.exists("empty_2.png"): os.remove("empty_2.png")
