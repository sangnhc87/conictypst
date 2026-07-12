import re

with open('js/omr_engine.js', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Reset variables at start of OpenCV logic
reset_code = """
        // Pure OpenCV logic
        window._sbdOff = null;
        window._madeOff = null;
        window._mcqOff = null;
        window._tfOff = null;
        window._tlnOff = null;
"""
content = content.replace("// Pure OpenCV logic", reset_code)

# 2. Patch TLN
tln_old = r"const counts = window\.OmrEngine\.readBubbleCol\(threshWarped, pts, 9\);"
tln_new = r"""
              let currentPts = pts.map(p => [...p]);
              if (q === 1 || (pts[0][1] < 300 && template.tln[(q - 1).toString()] && template.tln[(q - 1).toString()]['0'][0][1] > pts[0][1])) {
                  window._tlnOff = getLocalOffset(pts[0][0] - 30, pts[0][1] - 30);
              } else if (q === 1 && !window._tlnOff) {
                  window._tlnOff = getLocalOffset(pts[0][0] - 30, pts[0][1] - 30);
              }
              if (window._tlnOff) currentPts = currentPts.map(p => [p[0] + window._tlnOff.dx, p[1] + window._tlnOff.dy]);
              const counts = window.OmrEngine.readBubbleCol(threshWarped, currentPts, 9);
"""
# Replace ONLY the LAST occurrence (which is for TLN, but actually just replace it globally if TF is already patched)
# Wait, TF was patched, so the string `const counts = window.OmrEngine.readBubbleCol(threshWarped, pts, 9);` only remains in TLN!
content = content.replace(tln_old, tln_new)

with open('js/omr_engine.js', 'w', encoding='utf-8') as f:
    f.write(content)
print("js/omr_engine.js patched for TLN and variable reset.")
