import re

with open('js/omr_engine.js', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Patch SBD
sbd_old = r"const counts = window\.OmrEngine\.readBubbleCol\(threshWarped, template\.sbd\[col\], 9\);"
sbd_new = r"""
            let pts = template.sbd[col].map(p => [...p]);
            if (col === 0) {
                window._sbdOff = getLocalOffset(pts[0][0] - 12, pts[0][1] - 49);
            }
            if (window._sbdOff) pts = pts.map(p => [p[0] + window._sbdOff.dx, p[1] + window._sbdOff.dy]);
            const counts = window.OmrEngine.readBubbleCol(threshWarped, pts, 9);
"""
content = re.sub(sbd_old, sbd_new, content)

# 2. Patch MaDe
made_old = r"const counts = window\.OmrEngine\.readBubbleCol\(threshWarped, template\.made\[col\], 9\);"
made_new = r"""
            let pts = template.made[col].map(p => [...p]);
            if (col === 0) {
                window._madeOff = getLocalOffset(pts[0][0] - 12, pts[0][1] - 49);
            }
            if (window._madeOff) pts = pts.map(p => [p[0] + window._madeOff.dx, p[1] + window._madeOff.dy]);
            const counts = window.OmrEngine.readBubbleCol(threshWarped, pts, 9);
"""
content = re.sub(made_old, made_new, content)

# 3. Patch MCQ
mcq_old = r"const counts = window\.OmrEngine\.readBubbleCol\(threshWarped, pts, 9\);"
mcq_new = r"""
            let currentPts = pts.map(p => [...p]);
            // If it's the first question of a column (e.g. Q1, Q11, Q21)
            // Wait, we can just detect if it's the start of a column by looking at Y coordinate!
            if (q === 1 || (pts[0][1] < 300 && template.mcq[(q - 1).toString()] && template.mcq[(q - 1).toString()][0][1] > pts[0][1])) {
                window._mcqOff = getLocalOffset(pts[0][0] - 21, pts[0][1] - 20);
            } else if (q === 1 && !window._mcqOff) {
                window._mcqOff = getLocalOffset(pts[0][0] - 21, pts[0][1] - 20);
            }
            if (window._mcqOff) currentPts = currentPts.map(p => [p[0] + window._mcqOff.dx, p[1] + window._mcqOff.dy]);
            const counts = window.OmrEngine.readBubbleCol(threshWarped, currentPts, 9);
            // Replace pts with currentPts for AI fallback
            const originalPts = pts;
            pts = currentPts;
"""
content = re.sub(mcq_old, mcq_new, content)

# 4. Patch TF
tf_old = r"const counts = window\.OmrEngine\.readBubbleCol\(threshWarped, pts, 9\);"
tf_new = r"""
              let currentPts = pts.map(p => [...p]);
              if (q === 1 || (pts[0][1] < 300 && template.tf[(q - 1).toString()] && template.tf[(q - 1).toString()]['a'][0][1] > pts[0][1])) {
                  // For TF, pts[0] is option 'a' bubble (Đ). Tracking marker is above it?
                  // Wait, tf layout: Đ S are options.
                  // `pts[0]` is 'a_Đ'. Tracking marker is at the top left of the block.
                  // For TF, we can just search near the top-left of the first bubble
                  window._tfOff = getLocalOffset(pts[0][0] - 30, pts[0][1] - 30);
              } else if (q === 1 && !window._tfOff) {
                  window._tfOff = getLocalOffset(pts[0][0] - 30, pts[0][1] - 30);
              }
              if (window._tfOff) currentPts = currentPts.map(p => [p[0] + window._tfOff.dx, p[1] + window._tfOff.dy]);
              const counts = window.OmrEngine.readBubbleCol(threshWarped, currentPts, 9);
"""
content = re.sub(tf_old, tf_new, content)


with open('js/omr_engine.js', 'w', encoding='utf-8') as f:
    f.write(content)
print("js/omr_engine.js patched with local offset usage.")
