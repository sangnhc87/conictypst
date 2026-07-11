with open("omr_grader.py", "r") as f:
    text = f.read()

target = """        tln[num] = sorted(tln_b, key=lambda p: (p[0], p[1]))
    
    print(f"[{template_name}] Found {len(sbd)} SBD, {len(made)} Mã đề, {len(mcq)} MCQ, {len(tf)} TF, {len(tln)} TLN")
    
    result = {
        "numQ": len(mcq),
        "sbd": sbd,
        "made": made,
        "mcq": mcq,
        "tf": tf,
        "tln": tln
    }"""

replacement = """        tln[num] = sorted(tln_b, key=lambda p: (p[0], p[1]))
    
    # Extract Local Anchors
    _, thresh_w = cv2.threshold(warped_gray, 200, 255, cv2.THRESH_BINARY_INV)
    cnts, _ = cv2.findContours(thresh_w, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

    anchors = []
    for c in cnts:
        x, y, bw, bh = cv2.boundingRect(c)
        area = cv2.contourArea(c)
        if area > 80 and area < 500:
            ar = bw / float(bh)
            extent = area / float(bw*bh)
            if extent > 0.8:
                anchors.append((int(x + bw/2), int(y + bh/2)))
    
    unique_anchors = []
    for a in anchors:
        found = False
        for u in unique_anchors:
            if abs(a[0]-u[0]) < 10 and abs(a[1]-u[1]) < 10:
                found = True
                break
        if not found:
            unique_anchors.append(a)
    unique_anchors = sorted(unique_anchors, key=lambda p: (p[1], p[0]))
    
    print(f"[{template_name}] Found {len(sbd)} SBD, {len(made)} Mã đề, {len(mcq)} MCQ, {len(tf)} TF, {len(tln)} TLN, {len(unique_anchors)} Anchors")
    
    result = {
        "numQ": len(mcq),
        "sbd": sbd,
        "made": made,
        "mcq": mcq,
        "tf": tf,
        "tln": tln,
        "anchors": unique_anchors
    }"""

if target in text:
    text = text.replace(target, replacement)
    with open("omr_grader.py", "w") as f:
        f.write(text)
    print("Success")
else:
    print("Target not found")
