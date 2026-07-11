import re

with open('js/omr_engine.js', 'r') as f:
    content = f.read()

# Replace the method signature
content = content.replace(
    "async gradeImage(imgEl, template, fullAnswers, apiKey, templateName) {",
    "async gradeImage(imgEl, template, fullAnswers, apiKey, templateName, engine='opencv') {"
)

# After getting warped image
# We need to branch
branch_start_old = """      // Convert drawMat to base64
      const tmpCanvas = document.createElement('canvas');
      cv.imshow(tmpCanvas, drawMat);
      
      // Resize to max 1000px height for Gemini to save tokens/time
      const scale = Math.min(1.0, 1000 / tmpCanvas.height);
      const rCanvas = document.createElement('canvas');
      rCanvas.width = tmpCanvas.width * scale;
      rCanvas.height = tmpCanvas.height * scale;
      const rctx2 = rCanvas.getContext('2d');
      rctx2.drawImage(tmpCanvas, 0, 0, rCanvas.width, rCanvas.height);
      const base64Image = rCanvas.toDataURL("image/jpeg", 0.7);

      // Call Gemini API
      let geminiAns;
      try {
        geminiAns = await window.GeminiGrader.extractAnswers(base64Image, templateName, apiKey);
      } catch (err) {
        throw new Error("Gemini AI lỗi: " + err.message);
      }"""

branch_new = """
      let geminiAns = { mcq: {}, tf: {}, tln: {}, sbd: '?', made: '?' };
      if (engine === 'gemini') {
        const tmpCanvas = document.createElement('canvas');
        cv.imshow(tmpCanvas, drawMat);
        const scale = Math.min(1.0, 1000 / tmpCanvas.height);
        const rCanvas = document.createElement('canvas');
        rCanvas.width = tmpCanvas.width * scale;
        rCanvas.height = tmpCanvas.height * scale;
        const rctx2 = rCanvas.getContext('2d');
        rctx2.drawImage(tmpCanvas, 0, 0, rCanvas.width, rCanvas.height);
        const base64Image = rCanvas.toDataURL("image/jpeg", 0.7);

        try {
          geminiAns = await window.GeminiGrader.extractAnswers(base64Image, templateName, apiKey);
        } catch (err) {
          throw new Error("Gemini AI lỗi: " + err.message);
        }
      } else {
        // Pure OpenCV logic
        if (!isWarped) {
          throw new Error("Không thể căn chỉnh góc ảnh, vui lòng chụp rõ 4 góc hoặc chuyển sang chế độ AI Gemini.");
        }
        
        let threshWarped = new cv.Mat();
        let grayWarped = new cv.Mat();
        cv.cvtColor(warped, grayWarped, cv.COLOR_RGBA2GRAY);
        cv.threshold(grayWarped, threshWarped, 140, 255, cv.THRESH_BINARY_INV);
        
        const OPTIONS = ['A','B','C','D'];
        
        // MCQ OpenCV
        for (let q = 1; q <= template.numQ; q++) {
          const pts = template.mcq[q.toString()];
          if (pts) {
             const counts = window.OmrEngine.readBubbleCol(threshWarped, pts, 7);
             const maxCount = Math.max(...counts);
             if (maxCount > 30) { // Threshold for a filled bubble
                 const idx = counts.indexOf(maxCount);
                 geminiAns.mcq[q.toString()] = OPTIONS[idx];
             }
          }
        }
        
        // TF OpenCV
        if (template.tf) {
           ['13','14','15','16'].forEach(q => {
               const pts = template.tf[q];
               if (pts) {
                   geminiAns.tf[q] = {};
                   const LBLS = ['a','b','c','d'];
                   LBLS.forEach((lbl, idx) => {
                       const pair = pts[idx]; // [point_Đ, point_S]
                       const cD = window.OmrEngine.readBubbleCol(threshWarped, [pair[0]], 7)[0];
                       const cS = window.OmrEngine.readBubbleCol(threshWarped, [pair[1]], 7)[0];
                       if (cD > 30 || cS > 30) {
                           geminiAns.tf[q][lbl] = cD > cS ? 'Đ' : 'S';
                       }
                   });
               }
           });
        }
        
        // TLN OpenCV
        if (template.tln) {
           for (let q = 17; q <= 22; q++) {
               const tinfo = template.tln[q.toString()];
               if (tinfo) {
                   let ansStr = "";
                   const DIGITS = ['0','1','2','3','4','5','6','7','8','9'];
                   
                   if (tinfo.sign) {
                      const counts = window.OmrEngine.readBubbleCol(threshWarped, tinfo.sign, 7);
                      if (counts[0] > 30) ansStr += "-";
                   }
                   if (tinfo.int) {
                      tinfo.int.forEach(colPts => {
                          const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 7);
                          const maxCount = Math.max(...counts);
                          if (maxCount > 30) ansStr += DIGITS[counts.indexOf(maxCount)];
                      });
                   }
                   if (tinfo.frac) {
                      let fracStr = "";
                      tinfo.frac.forEach(colPts => {
                          const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 7);
                          const maxCount = Math.max(...counts);
                          if (maxCount > 30) fracStr += DIGITS[counts.indexOf(maxCount)];
                      });
                      if (fracStr.length > 0) ansStr += "," + fracStr;
                   }
                   if (ansStr !== "" && ansStr !== "-") {
                       geminiAns.tln[q.toString()] = ansStr;
                   }
               }
           }
        }

        threshWarped.delete();
        grayWarped.delete();
      }
"""

content = content.replace(branch_start_old, branch_new)

with open('js/omr_engine.js', 'w') as f:
    f.write(content)

print("omr_engine.js patched with OpenCV branch")
