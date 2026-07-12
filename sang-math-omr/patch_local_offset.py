import re

with open('js/omr_engine.js', 'r', encoding='utf-8') as f:
    content = f.read()

# Add getLocalOffset function
func = """
        function getLocalOffset(expectedX, expectedY) {
          let rx = Math.max(0, Math.floor(expectedX - 50));
          let ry = Math.max(0, Math.floor(expectedY - 50));
          let rw = Math.min(100, warped.cols - rx);
          let rh = Math.min(100, warped.rows - ry);
          if (rw <= 0 || rh <= 0) return {dx: 0, dy: 0};
          
          let roi = warped.roi(new cv.Rect(rx, ry, rw, rh));
          let gray = new cv.Mat();
          cv.cvtColor(roi, gray, cv.COLOR_RGBA2GRAY);
          let thresh = new cv.Mat();
          cv.adaptiveThreshold(gray, thresh, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY_INV, 31, 10);
          
          let contours = new cv.MatVector();
          let hierarchy = new cv.Mat();
          cv.findContours(thresh, contours, hierarchy, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE);
          
          let bestCx = expectedX, bestCy = expectedY, minDist = Infinity;
          for (let i = 0; i < contours.size(); ++i) {
            let c = contours.get(i);
            let area = cv.contourArea(c);
            let rect = cv.boundingRect(c);
            let aspect = rect.width / rect.height;
            // 10x10pt black square -> ~15-20px width -> area 200-400
            if (area >= 150 && area <= 800 && aspect >= 0.6 && aspect <= 1.4) {
              let M2 = cv.moments(c);
              if (M2.m00 !== 0) {
                let lcx = M2.m10 / M2.m00;
                let lcy = M2.m01 / M2.m00;
                let dist = Math.hypot((rx + lcx) - expectedX, (ry + lcy) - expectedY);
                if (dist < minDist) {
                  minDist = dist;
                  bestCx = rx + lcx;
                  bestCy = ry + lcy;
                }
              }
            }
          }
          
          roi.delete(); gray.delete(); thresh.delete(); contours.delete(); hierarchy.delete();
          
          if (minDist < 45) {
            return { dx: bestCx - expectedX, dy: bestCy - expectedY };
          }
          return { dx: 0, dy: 0 };
        }
"""

if "function getLocalOffset" not in content:
    content = content.replace("geminiAns.sbd = \"\";", func + "\n        geminiAns.sbd = \"\";")

# Patch SBD
sbd_loop = r"const counts = window\.OmrEngine\.readBubbleCol\(threshWarped, template\.sbd\[col\], 9\);"
new_sbd_loop = r"""
            let pts = template.sbd[col].map(p => [...p]);
            if (col === 0) {
                const off = getLocalOffset(pts[0][0] - 15, pts[0][0] - 50); // SBD offset
                window._sbdOffset = off;
            }
            if (window._sbdOffset) {
                pts = pts.map(p => [p[0] + window._sbdOffset.dx, p[1] + window._sbdOffset.dx]); // wait, dy!
            }
            // let's do it right
"""
# actually, it's easier to patch the point directly in python.
