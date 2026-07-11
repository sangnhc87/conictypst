import re

with open('js/omr_engine.js', 'r') as f:
    content = f.read()

start_marker = "gradeImage(imgEl, template, fullAnswers) {"
end_marker = "function onOpenCvReady() {"

start_idx = content.find(start_marker)
end_idx = content.find(end_marker)

new_gradeImage = """async gradeImage(imgEl, template, fullAnswers, apiKey, templateName) {
    if (!template) template = TEMPLATES['tn-50'];
    let src = null, gray = null, threshMarker = null, contours = null,
        hierarchy = null, pts_src = null, pts_dst = null, M = null,
        warped = null;

    try {
      const canvas = document.createElement('canvas');
      canvas.width = imgEl.naturalWidth; canvas.height = imgEl.naturalHeight;
      const ctx2d = canvas.getContext('2d');
      ctx2d.drawImage(imgEl, 0, 0);
      src = cv.imread(canvas);

      let isWarped = false;
      try {
        gray = new cv.Mat();
        cv.cvtColor(src, gray, cv.COLOR_RGBA2GRAY);
        threshMarker = new cv.Mat();
        cv.threshold(gray, threshMarker, 100, 255, cv.THRESH_BINARY_INV);

        contours = new cv.MatVector(); hierarchy = new cv.Mat();
        cv.findContours(threshMarker, contours, hierarchy, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE);

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

        if (tl && tr && bl && br) {
          const TL=[96,102], TR=[904,102], BR=[904,1398], BL=[96,1398];
          pts_src = cv.matFromArray(4,1,cv.CV_32FC2,[tl[0],tl[1],tr[0],tr[1],br[0],br[1],bl[0],bl[1]]);
          pts_dst = cv.matFromArray(4,1,cv.CV_32FC2,[TL[0],TL[1],TR[0],TR[1],BR[0],BR[1],BL[0],BL[1]]);
          M = cv.getPerspectiveTransform(pts_src, pts_dst);
          warped = new cv.Mat();
          cv.warpPerspective(src, warped, M, new cv.Size(1000, 1500));
          isWarped = true;
        }
      } catch(e) {
        console.warn("Warping failed, falling back to raw image for Gemini", e);
      }

      const drawMat = isWarped ? warped : src;
      
      // Convert drawMat to base64
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
      }

      // Display original/warped image on output canvas to draw on it
      cv.imshow('canvasOutput', drawMat);
      const resultCanvas = document.getElementById('canvasOutput');
      const rctx = resultCanvas.getContext('2d');
      
      const drawTick = (x, y) => {
        rctx.beginPath(); rctx.moveTo(x-6,y); rctx.lineTo(x-2,y+6); rctx.lineTo(x+8,y-8); rctx.stroke();
      };
      const drawCross = (x, y) => {
        rctx.beginPath(); rctx.moveTo(x-6,y-6); rctx.lineTo(x+6,y+6); rctx.moveTo(x+6,y-6); rctx.lineTo(x-6,y+6); rctx.stroke();
      };
      const drawCircle = (x, y) => {
        rctx.beginPath(); rctx.arc(x,y,8,0,2*Math.PI); rctx.stroke();
      }

      let totalScore = 0;
      let totalCorrectMCQ = 0;
      const answerMap = {};
      const OPTIONS = ['A','B','C','D'];
      const LBLS = ['a','b','c','d'];

      const expectedMCQ = fullAnswers.mcq || {};
      const expectedTF = fullAnswers.tf || {};
      const expectedTLN = fullAnswers.tln || {};
      
      const wrongDetails = [];

      // GRADE MCQ
      for (let q = 1; q <= template.numQ; q++) {
        const expectedAns = expectedMCQ[q.toString()] || '';
        const studentAns = (geminiAns.mcq && geminiAns.mcq[q.toString()]) || '';
        answerMap[`mcq-${q}`] = studentAns;

        if (studentAns === expectedAns && expectedAns !== '') {
          totalCorrectMCQ++;
          if (template.tf) totalScore += 0.25;
          if (isWarped) {
             const pts = template.mcq[q.toString()];
             const idx = OPTIONS.indexOf(studentAns);
             if (pts && idx >= 0) {
                 rctx.strokeStyle='#00cc66'; rctx.lineWidth=3;
                 drawTick(pts[idx][0], pts[idx][1]);
             }
          }
        } else if (expectedAns !== '') {
          wrongDetails.push(`C${q}: ${studentAns || '_'} (Đ.Án: ${expectedAns})`);
          if (isWarped) {
             const pts = template.mcq[q.toString()];
             const sIdx = OPTIONS.indexOf(studentAns);
             const eIdx = OPTIONS.indexOf(expectedAns);
             if (pts && sIdx >= 0) {
                 rctx.strokeStyle='#ff3333'; rctx.lineWidth=3;
                 drawCross(pts[sIdx][0], pts[sIdx][1]);
             }
             if (pts && eIdx >= 0) {
                 rctx.strokeStyle='#3399ff'; rctx.lineWidth=2;
                 drawCircle(pts[eIdx][0], pts[eIdx][1]);
             }
          }
        }
      }

      if (!template.tf) {
        totalScore = (totalCorrectMCQ * 10.0 / template.numQ);
      }

      // GRADE TF
      if (template.tf && geminiAns.tf) {
        ['13','14','15','16'].forEach(q => {
          const exp = expectedTF[q] || {};
          const stu = geminiAns.tf[q] || {};
          answerMap[`tf-${q}`] = stu;
          let correctClauses = 0;
          let wrongs = [];

          LBLS.forEach((lbl, idx) => {
             const exAns = exp[lbl];
             const stAns = stu[lbl];
             if (!exAns) return;
             if (stAns === exAns) {
                 correctClauses++;
                 if (isWarped) {
                     const pair = template.tf[q][idx];
                     const pt = (stAns === 'Đ') ? pair[0] : pair[1];
                     rctx.strokeStyle='#00cc66'; rctx.lineWidth=3;
                     drawTick(pt[0], pt[1]);
                 }
             } else {
                 wrongs.push(`${lbl}.${stAns || '_'}(Đ.Án:${exAns})`);
                 if (isWarped) {
                     const pair = template.tf[q][idx];
                     const ptS = (stAns === 'Đ') ? pair[0] : pair[1]; // student point
                     const ptE = (exAns === 'Đ') ? pair[0] : pair[1]; // correct point
                     if (stAns === 'Đ' || stAns === 'S') {
                         rctx.strokeStyle='#ff3333'; rctx.lineWidth=3;
                         drawCross(ptS[0], ptS[1]);
                     }
                     rctx.strokeStyle='#3399ff'; rctx.lineWidth=2;
                     drawCircle(ptE[0], ptE[1]);
                 }
             }
          });
          if (wrongs.length > 0) wrongDetails.push(`C${q}: ${wrongs.join(', ')}`);
          if (correctClauses === 1) totalScore += 0.1;
          else if (correctClauses === 2) totalScore += 0.25;
          else if (correctClauses === 3) totalScore += 0.5;
          else if (correctClauses === 4) totalScore += 1.0;
        });
      }

      // GRADE TLN
      if (template.tln && geminiAns.tln) {
        for (let q = 17; q <= 22; q++) {
           const expAns = (expectedTLN[q] || '').toString().trim();
           const stuAns = (geminiAns.tln[q.toString()] || '').toString().trim();
           answerMap[`tln-${q}`] = stuAns;

           if (!expAns) continue;

           if (stuAns === expAns) {
               totalScore += 0.5;
               if (isWarped) {
                   const tinfo = template.tln[q.toString()];
                   if (tinfo && tinfo.int && tinfo.int.length>0) {
                      rctx.strokeStyle='#00cc66'; rctx.lineWidth=3;
                      drawTick(tinfo.int[0][0][0] - 15, tinfo.int[0][0][1]);
                   }
               }
           } else {
               wrongDetails.push(`C${q}: ${stuAns || '_'} (Đ.Án: ${expAns})`);
               if (isWarped) {
                   const tinfo = template.tln[q.toString()];
                   if (tinfo && tinfo.int && tinfo.int.length>0) {
                      rctx.strokeStyle='#ff3333'; rctx.lineWidth=3;
                      drawCross(tinfo.int[0][0][0] - 15, tinfo.int[0][0][1]);
                   }
               }
           }
        }
      }

      let finalScoreStr = totalScore.toFixed(2);
      if (finalScoreStr.endsWith('0')) finalScoreStr = parseFloat(finalScoreStr).toString();

      // If not warped, draw result table on the image
      if (!isWarped && wrongDetails.length > 0) {
         rctx.fillStyle = "rgba(255, 255, 255, 0.9)";
         rctx.fillRect(20, 150, 300, 30 + wrongDetails.length * 20);
         rctx.fillStyle = "#d32f2f";
         rctx.font = "bold 18px sans-serif";
         rctx.fillText("BẢNG CÁC CÂU SAI:", 30, 175);
         rctx.fillStyle = "#333";
         rctx.font = "14px monospace";
         wrongDetails.forEach((line, i) => {
             rctx.fillText(line, 30, 200 + i*20);
         });
      }

      // Draw final badge
      const badgeW = 320;
      const badgeH = 120; 
      const badgeX = Math.max(0, drawMat.cols - badgeW - 20);
      const badgeY = 20;
      
      rctx.fillStyle = "rgba(255, 255, 255, 0.95)";
      rctx.beginPath();
      rctx.roundRect(badgeX, badgeY, badgeW, badgeH, 15);
      rctx.fill();
      rctx.lineWidth = 4;
      rctx.strokeStyle = totalScore >= 8 ? "#2e7d32" : (totalScore >= 5 ? "#1565c0" : "#d32f2f");
      rctx.stroke();

      rctx.fillStyle = rctx.strokeStyle;
      rctx.font = "bold 24px sans-serif";
      rctx.textAlign = "center";
      rctx.fillText("KẾT QUẢ CHẤM", badgeX + badgeW/2, badgeY + 35);
      
      rctx.font = "bold 48px sans-serif";
      rctx.fillText(finalScoreStr, badgeX + badgeW/2, badgeY + 85);
      
      rctx.fillStyle = "#333";
      rctx.font = "18px sans-serif";
      rctx.fillText(`Trắc nghiệm: ${totalCorrectMCQ}/${template.numQ}`, badgeX + badgeW/2, badgeY + 110);
      rctx.textAlign = "left"; 

      return {
        sbd: geminiAns.sbd || '?',
        made: geminiAns.made || '?',
        correct: totalCorrectMCQ, total: template.numQ,
        score: finalScoreStr,
        answers: answerMap,
        imageDataURL: resultCanvas.toDataURL("image/jpeg", 0.8)
      };

    } finally {
      [src,gray,threshMarker,contours,hierarchy,pts_src,pts_dst,M,warped]
        .forEach(m => m?.delete?.());
    }
  }
};
"""

new_content = content[:start_idx] + new_gradeImage + "\n" + content[end_idx:]

with open('js/omr_engine.js', 'w') as f:
    f.write(new_content)

print("Engine patched successfully")
