import re

with open('js/omr_engine.js', 'r') as f:
    content = f.read()

old_logic = """
        const mx = src.cols / 2, my = src.rows / 2;
        const mgx = src.cols * 0.25, mgy = src.rows * 0.20;
        let tl=null,tr=null,bl=null,br=null, tlm=0,trm=0,blm=0,brm=0;

        for (let i = 0; i < contours.size(); ++i) {
          const c = contours.get(i);
          const area = cv.contourArea(c);
          if (area > 100) {
            const M2 = cv.moments(c);
            if (M2.m00 !== 0) {
              const cx = Math.round(M2.m10 / M2.m00), cy = Math.round(M2.m01 / M2.m00);
              if (cx < mgx && cy < mgy)                     { if (area>tlm){tlm=area;tl=[cx,cy];} }
              else if (cx > src.cols-mgx && cy < mgy)       { if (area>trm){trm=area;tr=[cx,cy];} }
              else if (cx < mgx && cy > src.rows-mgy)       { if (area>blm){blm=area;bl=[cx,cy];} }
              else if (cx > src.cols-mgx && cy > src.rows-mgy){ if (area>brm){brm=area;br=[cx,cy];} }
            }
          }
        }
"""

new_logic = """
        let candidates = [];
        for (let i = 0; i < contours.size(); ++i) {
          const c = contours.get(i);
          const area = cv.contourArea(c);
          if (area > 300) { // Lọc các đốm nhỏ, marker đen ở góc thường khá to
            const M2 = cv.moments(c);
            if (M2.m00 !== 0) {
              const cx = Math.round(M2.m10 / M2.m00), cy = Math.round(M2.m01 / M2.m00);
              candidates.push({cx, cy, area});
            }
          }
        }

        let tl=null, tr=null, bl=null, br=null;
        if (candidates.length >= 4) {
           // Sắp xếp để tìm 4 góc dựa trên phép toán toạ độ (chống méo, xoay nghiêng)
           candidates.sort((a,b) => (a.cx + a.cy) - (b.cx + b.cy));
           tl = [candidates[0].cx, candidates[0].cy]; 
           br = [candidates[candidates.length-1].cx, candidates[candidates.length-1].cy];

           candidates.sort((a,b) => (a.cx - a.cy) - (b.cx - b.cy));
           bl = [candidates[0].cx, candidates[0].cy];
           tr = [candidates[candidates.length-1].cx, candidates[candidates.length-1].cy];
        }
"""

content = content.replace(old_logic.strip(), new_logic.strip())

with open('js/omr_engine.js', 'w') as f:
    f.write(content)
print("Patched corner detection")
