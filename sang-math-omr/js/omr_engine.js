window.OmrEngine = {
  isOpenCvLoaded: false,

  // Called when opencv.js is loaded
  init() {
    this.isOpenCvLoaded = true;
    document.getElementById('statusDot').classList.add('ready');
    document.getElementById('statusText').textContent = 'Hệ thống sẵn sàng (Gemini 3.5 Flash + OpenCV)';
    // Trigger an event so the module script can enable the button
    window.dispatchEvent(new Event('opencvLoaded'));
  },

  detectMarkers(src) {
    let gray = new cv.Mat();
    cv.cvtColor(src, gray, cv.COLOR_RGBA2GRAY);
    let threshMarker = new cv.Mat();
    cv.adaptiveThreshold(gray, threshMarker, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY_INV, 51, 15);

    let contours = new cv.MatVector();
    let hierarchy = new cv.Mat();
    cv.findContours(threshMarker, contours, hierarchy, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE);

    let candidates = [];
    for (let i = 0; i < contours.size(); ++i) {
      const c = contours.get(i);
      const area = cv.contourArea(c);
      if (area > 300) { 
        const M2 = cv.moments(c);
        if (M2.m00 !== 0) {
          const cx = Math.round(M2.m10 / M2.m00), cy = Math.round(M2.m01 / M2.m00);
          candidates.push({ cx, cy, area });
        }
      }
    }

    // Clean up memory
    gray.delete();
    threshMarker.delete();
    contours.delete();
    hierarchy.delete();

    if (candidates.length >= 4) {
      // Sort corners
      candidates.sort((a, b) => (a.cx + a.cy) - (b.cx + b.cy));
      let tl = [candidates[0].cx, candidates[0].cy];
      let br = [candidates[candidates.length - 1].cx, candidates[candidates.length - 1].cy];

      candidates.sort((a, b) => (a.cx - a.cy) - (b.cx - b.cy));
      let bl = [candidates[0].cx, candidates[0].cy];
      let tr = [candidates[candidates.length - 1].cx, candidates[candidates.length - 1].cy];
      
      return { tl, tr, bl, br };
    }
    return null;
  },

  readBubbleCol(thresh_img, coords, radius = 6) {
    const results = [];
    for (let row = 0; row < 10; row++) {
      const pt = coords[row];
      if (!pt) continue;
      const cx = pt[0], cy = pt[1];
      const x = Math.max(0, cx - radius), y = Math.max(0, cy - radius);
      const w = radius * 2, h = radius * 2;
      if (x + w > thresh_img.cols || y + h > thresh_img.rows) { results.push(0); continue; }
      const rect = new cv.Rect(x, y, w, h);
      const roi = thresh_img.roi(rect);
      const count = cv.countNonZero(roi);
      roi.delete();
      results.push(count);
    }
    return results;
  },

  async gradeImage(imgEl, template, fullAnswers, apiKey, templateName, engine = 'opencv') {
    if (!template) template = TEMPLATES['tn-50'];
    let src = null, gray = null, threshMarker = null, contours = null,
      hierarchy = null, pts_src = null, pts_dst = null, M = null,
      warped = null;

    try {
      const canvas = document.createElement('canvas');
      canvas.width = imgEl.naturalWidth; canvas.height = imgEl.naturalHeight;
      const ctx2d = canvas.getContext('2d');
      ctx2d.drawImage(imgEl, 0, 0);

      // 1. Detect QR code for auto-template
      if (typeof jsQR !== 'undefined') {
        const imageData = ctx2d.getImageData(0, 0, canvas.width, canvas.height);
        const code = jsQR(imageData.data, imageData.width, imageData.height, {
          inversionAttempts: "dontInvert"
        });
        if (code && code.data.startsWith("TEMPLATE:")) {
          const detectedTemplate = code.data.split(":")[1];
          if (window.TEMPLATES && window.TEMPLATES[detectedTemplate]) {
            template = window.TEMPLATES[detectedTemplate];
            templateName = detectedTemplate;
            console.log("Found QR Code! Auto-selected template:", templateName);
            if (window.app) window.app.selectedTemplate = templateName;
          }
        }
      }

      src = cv.imread(canvas);

      let isWarped = false;
      try {
        gray = new cv.Mat();
        cv.cvtColor(src, gray, cv.COLOR_RGBA2GRAY);
        threshMarker = new cv.Mat();
        cv.adaptiveThreshold(gray, threshMarker, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY_INV, 51, 15);

        contours = new cv.MatVector(); hierarchy = new cv.Mat();
        cv.findContours(threshMarker, contours, hierarchy, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE);

        let candidates = [];
        for (let i = 0; i < contours.size(); ++i) {
          const c = contours.get(i);
          const area = cv.contourArea(c);
          if (area > 300) { // Lọc các đốm nhỏ, marker đen ở góc thường khá to
            const M2 = cv.moments(c);
            if (M2.m00 !== 0) {
              const cx = Math.round(M2.m10 / M2.m00), cy = Math.round(M2.m01 / M2.m00);
              candidates.push({ cx, cy, area });
            }
          }
        }

        let tl = null, tr = null, bl = null, br = null;
        if (candidates.length >= 4) {
          // Sắp xếp để tìm 4 góc dựa trên phép toán toạ độ (chống méo, xoay nghiêng)
          candidates.sort((a, b) => (a.cx + a.cy) - (b.cx + b.cy));
          tl = [candidates[0].cx, candidates[0].cy];
          br = [candidates[candidates.length - 1].cx, candidates[candidates.length - 1].cy];

          candidates.sort((a, b) => (a.cx - a.cy) - (b.cx - b.cy));
          bl = [candidates[0].cx, candidates[0].cy];
          tr = [candidates[candidates.length - 1].cx, candidates[candidates.length - 1].cy];
        }

        if (tl && tr && bl && br) {
          let TL = [96, 102], TR = [904, 102], BR = [904, 1398], BL = [96, 1398];
          let warpW = 1000, warpH = 1500;
          if (template.warp) {
            warpW = template.warp.width;
            warpH = template.warp.height;
            TL = template.warp.TL;
            TR = template.warp.TR;
            BR = template.warp.BR;
            BL = template.warp.BL;
          }
          pts_src = cv.matFromArray(4, 1, cv.CV_32FC2, [tl[0], tl[1], tr[0], tr[1], br[0], br[1], bl[0], bl[1]]);
          pts_dst = cv.matFromArray(4, 1, cv.CV_32FC2, [TL[0], TL[1], TR[0], TR[1], BR[0], BR[1], BL[0], BL[1]]);
          M = cv.getPerspectiveTransform(pts_src, pts_dst);
          warped = new cv.Mat();
          cv.warpPerspective(src, warped, M, new cv.Size(warpW, warpH));
          isWarped = true;
        }
      } catch (e) {
        console.warn("Warping failed, falling back to raw image for Gemini", e);
      }

      const drawMat = isWarped ? warped : src;


      let geminiAns = { mcq: {}, tf: {}, tln: {}, sbd: '?', made: '?' };
      let warnings = [];
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
        window._sbdOff = null;
        window._madeOff = null;
        window._mcqOff = null;
        window._tfOff = null;
        window._tlnOff = null;

        if (!isWarped) {
          throw new Error("Không thể căn chỉnh góc ảnh, vui lòng chụp rõ 4 góc hoặc chuyển sang chế độ AI Gemini.");
        }

        let threshWarped = new cv.Mat();
        let grayWarped = new cv.Mat();
        cv.cvtColor(warped, grayWarped, cv.COLOR_RGBA2GRAY);
        cv.adaptiveThreshold(grayWarped, threshWarped, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY_INV, 31, 15);

        const OPTIONS = ['A', 'B', 'C', 'D'];


        // SBD
        if (template.sbd) {
          let str = "";
          for (let col = 0; col < template.sbd.length; col++) {
            
            let pts = template.sbd[col].map(p => [...p]);
            if (col === 0) {
                window._sbdOff = getLocalOffset(pts[0][0] - 12, pts[0][1] - 49);
            }
            if (window._sbdOff) pts = pts.map(p => [p[0] + window._sbdOff.dx, p[1] + window._sbdOff.dy]);
            
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


            const maxCount = Math.max(...counts);
            const filled = counts.filter(c => c > 30).length;
            if (filled > 1) warnings.push(`SBD cột ${col + 1} tô nhiều ô`);
            else if (maxCount > 30 && maxCount < 100) warnings.push(`SBD cột ${col + 1} tô mờ/tẩy xóa`);
            str += maxCount > 30 ? counts.indexOf(maxCount).toString() : "?";
          }
          geminiAns.sbd = str;
        }

        // MADE
        if (template.made) {
          let str = "";
          for (let col = 0; col < template.made.length; col++) {
            
            let pts = template.made[col].map(p => [...p]);
            if (col === 0) {
                window._madeOff = getLocalOffset(pts[0][0] - 12, pts[0][1] - 49);
            }
            if (window._madeOff) pts = pts.map(p => [p[0] + window._madeOff.dx, p[1] + window._madeOff.dy]);
            
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


            const maxCount = Math.max(...counts);
            const filled = counts.filter(c => c > 30).length;
            if (filled > 1) warnings.push(`Mã đề cột ${col + 1} tô nhiều ô`);
            else if (maxCount > 30 && maxCount < 100) warnings.push(`Mã đề cột ${col + 1} tô mờ/tẩy xóa`);
            str += maxCount > 30 ? counts.indexOf(maxCount).toString() : "?";
          }
          geminiAns.made = str;
        }


        // MCQ OpenCV
        for (let q = 1; q <= template.numQ; q++) {
          const pts = template.mcq[q.toString()];
          if (pts) {
            
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

            const maxCount = Math.max(...counts);
            const filled = counts.filter(c => c > 30).length;
            
            let finalIdx = -1;
            
            if (filled > 1) {
                warnings.push(`Câu ${q} tô nhiều ô`);
            } else if (maxCount > 30 && maxCount < 120 && window.TFGraderInstance && window.TFGraderInstance.model) {
                // AI Verification for suspicious bubbles
                const idx = counts.indexOf(maxCount);
                const [cx, cy] = pts[idx];
                
                // Crop 32x32 around cx, cy from original warped image
                let rx = Math.max(0, cx - 16);
                let ry = Math.max(0, cy - 16);
                let rw = Math.min(32, warped.cols - rx);
                let rh = Math.min(32, warped.rows - ry);
                
                if (rw === 32 && rh === 32) {
                    let rect = new cv.Rect(rx, ry, 32, 32);
                    let roi = warped.roi(rect);
                    
                    // Create an ImageData object
                    let imgData = new ImageData(new Uint8ClampedArray(roi.data), 32, 32);
                    
                    // predict: 0=Empty, 1=Filled, 2=Invalid
                    const pred = window.TFGraderInstance.predictBubble(imgData);
                    roi.delete();
                    
                    if (pred === 1) {
                        finalIdx = idx; // Confirmed as filled
                    } else {
                        warnings.push(`Câu ${q} AI xác nhận nét vẽ lỗi (gạch xóa/chưa tô kín)`);
                    }
                } else {
                    finalIdx = idx;
                }
            } else if (maxCount >= 120) {
                finalIdx = counts.indexOf(maxCount);
            }

            if (finalIdx !== -1) {
              geminiAns.mcq[q.toString()] = OPTIONS[finalIdx];
            }
          }
        }

        // TF OpenCV
        if (template.tf) {
          ['13', '14', '15', '16'].forEach(q => {
            const pts = template.tf[q];
            if (pts) {
              geminiAns.tf[q] = {};
              const LBLS = ['a', 'b', 'c', 'd'];
              LBLS.forEach((lbl, idx) => {
                const pair = pts[idx]; // [point_Đ, point_S]
                const cD = window.OmrEngine.readBubbleCol(threshWarped, [pair[0]], 9)[0];
                const cS = window.OmrEngine.readBubbleCol(threshWarped, [pair[1]], 9)[0];
                if (cD > 30 && cS > 30) warnings.push(`Câu ${q} ý ${lbl} tô nhiều ô`);
                else if (Math.max(cD, cS) > 30 && Math.max(cD, cS) < 100) warnings.push(`Câu ${q} ý ${lbl} tô mờ/tẩy xóa`);
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
              const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

              if (Array.isArray(tinfo)) {
                for (let colIdx = 0; colIdx < tinfo.length; colIdx++) {
                  const colPts = tinfo[colIdx];
                  const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 9);
                  const maxCount = Math.max(...counts);
                  const filled = counts.filter(c => c > 30).length;
                  if (filled > 1) warnings.push(`Câu ${q} tô nhiều ô`);
                  else if (maxCount > 30 && maxCount < 100) warnings.push(`Câu ${q} tô mờ`);
                  if (maxCount > 30) {
                    const maxIdx = counts.indexOf(maxCount);
                    if (colIdx === 0) {
                      if (maxIdx === 0) ansStr += "-";
                      else ansStr += maxIdx.toString();
                    } else if (colIdx === 1 || colIdx === 2) {
                      if (maxIdx === 0) ansStr += ",";
                      else ansStr += (maxIdx - 1).toString();
                    } else if (colIdx === 3) {
                      ansStr += maxIdx.toString();
                    }
                  }
                }
              } else {
                if (tinfo.sign) {
                  const counts = window.OmrEngine.readBubbleCol(threshWarped, tinfo.sign, 9);
                  if (counts[0] > 30) ansStr += "-";
                }
                if (tinfo.int) {
                  tinfo.int.forEach(colPts => {
                    const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 9);
                    const maxCount = Math.max(...counts);
                    const filled = counts.filter(c => c > 30).length;
                    if (filled > 1) warnings.push(`Câu ${q} tô nhiều ô`);
                    else if (maxCount > 30 && maxCount < 100) warnings.push(`Câu ${q} tô mờ`);
                    if (maxCount > 30) ansStr += DIGITS[counts.indexOf(maxCount)];
                  });
                }
                if (tinfo.frac) {
                  let fracStr = "";
                  tinfo.frac.forEach(colPts => {
                    const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 9);
                    const maxCount = Math.max(...counts);
                    const filled = counts.filter(c => c > 30).length;
                    if (filled > 1) warnings.push(`Câu ${q} tô nhiều ô`);
                    else if (maxCount > 30 && maxCount < 100) warnings.push(`Câu ${q} tô mờ`);
                    if (maxCount > 30) fracStr += DIGITS[counts.indexOf(maxCount)];
                  });
                  if (fracStr.length > 0) ansStr += "," + fracStr;
                }
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


      // Display original/warped image on output canvas to draw on it
      cv.imshow('canvasOutput', drawMat);
      const resultCanvas = document.getElementById('canvasOutput');
      const rctx = resultCanvas.getContext('2d');

      const drawTick = (x, y) => {
        rctx.beginPath(); rctx.moveTo(x - 6, y); rctx.lineTo(x - 2, y + 6); rctx.lineTo(x + 8, y - 8); rctx.stroke();
      };
      const drawCross = (x, y) => {
        rctx.beginPath(); rctx.moveTo(x - 6, y - 6); rctx.lineTo(x + 6, y + 6); rctx.moveTo(x + 6, y - 6); rctx.lineTo(x - 6, y + 6); rctx.stroke();
      };
      const drawCircle = (x, y) => {
        rctx.beginPath(); rctx.arc(x, y, 8, 0, 2 * Math.PI); rctx.stroke();
      }

      let totalScore = 0;
      let totalCorrectMCQ = 0;
      const answerMap = {};
      const OPTIONS = ['A', 'B', 'C', 'D'];
      const LBLS = ['a', 'b', 'c', 'd'];

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
          if (template.scoring && template.scoring.mcq) totalScore += template.scoring.mcq.points;
          else totalScore += 10.0 / template.numQ;
          if (isWarped) {
            const pts = template.mcq[q.toString()];
            const idx = OPTIONS.indexOf(studentAns);
            if (pts && idx >= 0) {
              rctx.strokeStyle = '#00cc66'; rctx.lineWidth = 3;
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
              rctx.strokeStyle = '#ff3333'; rctx.lineWidth = 3;
              drawCross(pts[sIdx][0], pts[sIdx][1]);
            }
            if (pts && eIdx >= 0) {
              rctx.strokeStyle = '#3399ff'; rctx.lineWidth = 2;
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
        ['13', '14', '15', '16'].forEach(q => {
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
                rctx.strokeStyle = '#00cc66'; rctx.lineWidth = 3;
                drawTick(pt[0], pt[1]);
              }
            } else {
              wrongs.push(`${lbl}.${stAns || '_'}(Đ.Án:${exAns})`);
              if (isWarped) {
                const pair = template.tf[q][idx];
                const ptS = (stAns === 'Đ') ? pair[0] : pair[1]; // student point
                const ptE = (exAns === 'Đ') ? pair[0] : pair[1]; // correct point
                if (stAns === 'Đ' || stAns === 'S') {
                  rctx.strokeStyle = '#ff3333'; rctx.lineWidth = 3;
                  drawCross(ptS[0], ptS[1]);
                }
                rctx.strokeStyle = '#3399ff'; rctx.lineWidth = 2;
                drawCircle(ptE[0], ptE[1]);
              }
            }
          });
          if (wrongs.length > 0) wrongDetails.push(`C${q}: ${wrongs.join(', ')}`);
          if (correctClauses > 0 && template.scoring && template.scoring.tf) {
            totalScore += template.scoring.tf.points[correctClauses - 1];
          } else {
            if (correctClauses === 1) totalScore += 0.1;
            else if (correctClauses === 2) totalScore += 0.25;
            else if (correctClauses === 3) if (template.scoring && template.scoring.tln) totalScore += template.scoring.tln.points;
            else totalScore += 0.5;
            else if (correctClauses === 4) totalScore += 1.0;
          }
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
            if (template.scoring && template.scoring.tln) totalScore += template.scoring.tln.points;
            else totalScore += 0.5;
            if (isWarped) {
              const tinfo = template.tln[q.toString()];
              if (tinfo) {
                let drawX = 0, drawY = 0;
                if (Array.isArray(tinfo) && tinfo.length > 0 && tinfo[0].length > 0) {
                  drawX = tinfo[0][0][0] - 15; drawY = tinfo[0][0][1];
                } else if (tinfo.int && tinfo.int.length > 0) {
                  drawX = tinfo.int[0][0][0] - 15; drawY = tinfo.int[0][0][1];
                }
                if (drawX > 0) {
                  rctx.strokeStyle = '#00cc66'; rctx.lineWidth = 3;
                  drawTick(drawX, drawY);
                }
              }
            }
          } else {
            wrongDetails.push(`C${q}: ${stuAns || '_'} (Đ.Án: ${expAns})`);
            if (isWarped) {
              const tinfo = template.tln[q.toString()];
              if (tinfo) {
                let drawX = 0, drawY = 0;
                if (Array.isArray(tinfo) && tinfo.length > 0 && tinfo[0].length > 0) {
                  drawX = tinfo[0][0][0] - 15; drawY = tinfo[0][0][1];
                } else if (tinfo.int && tinfo.int.length > 0) {
                  drawX = tinfo.int[0][0][0] - 15; drawY = tinfo.int[0][0][1];
                }
                if (drawX > 0) {
                  rctx.strokeStyle = '#ff3333'; rctx.lineWidth = 3;
                  drawCross(drawX, drawY);
                }
              }
            }
          }
        }
      }

      let finalScoreStr = totalScore.toFixed(2);
      if (finalScoreStr.endsWith('0')) finalScoreStr = parseFloat(finalScoreStr).toString();

      // ── Smart comment by score band ──────────────────────────────────────────
      const sc = parseFloat(finalScoreStr);
      let verdict, verdictColor, autoComment;
      if (sc >= 9.0) {
        verdict = '🏆 Xuất Sắc'; verdictColor = '#00b87a';
        autoComment = 'Em đã trả lời xuất sắc! Tiếp tục phát huy nhé 🌟';
      } else if (sc >= 7.0) {
        verdict = '⭐ Khá';    verdictColor = '#2196f3';
        autoComment = 'Kết quả tốt! Xem lại các câu còn sai để hoàn thiện hơn 👍';
      } else if (sc >= 5.0) {
        verdict = '📖 Trung Bình'; verdictColor = '#ff9800';
        autoComment = 'Cần ôn tập thêm các phần còn yếu, em nhé 📚';
      } else {
        verdict = '💪 Cần Cố Gắng'; verdictColor = '#f44336';
        autoComment = 'Gặp thầy/cô để được hỗ trợ thêm. Em đừng nản nhé! 💪';
      }

      // ── Wrong-answer panel (bottom-left) ────────────────────────────────────
      if (wrongDetails.length > 0) {
        const panelW = Math.min(400, drawMat.cols - 20);
        const rowH = 22;
        const panelH = 44 + wrongDetails.length * rowH;
        const panelX = 14;
        const panelY = drawMat.rows - panelH - 14;

        // Panel background
        rctx.save();
        rctx.shadowColor = 'rgba(0,0,0,0.35)';
        rctx.shadowBlur = 12;
        rctx.fillStyle = 'rgba(255,255,255,0.94)';
        rctx.beginPath();
        if (rctx.roundRect) rctx.roundRect(panelX, panelY, panelW, panelH, 10);
        else rctx.rect(panelX, panelY, panelW, panelH);
        rctx.fill();
        rctx.restore();

        // Red top bar
        rctx.fillStyle = '#e53935';
        rctx.beginPath();
        if (rctx.roundRect) rctx.roundRect(panelX, panelY, panelW, 24, [10, 10, 0, 0]);
        else rctx.rect(panelX, panelY, panelW, 24);
        rctx.fill();

        rctx.fillStyle = '#fff';
        rctx.font = 'bold 12px "Segoe UI", sans-serif';
        rctx.textAlign = 'left';
        rctx.fillText(`❌  ${wrongDetails.length} CÂU SAI – CẦN XEM LẠI`, panelX + 10, panelY + 16);

        wrongDetails.forEach((line, i) => {
          const rowY = panelY + 24 + i * rowH;
          rctx.fillStyle = i % 2 === 0 ? 'rgba(229,57,53,0.07)' : 'transparent';
          rctx.fillRect(panelX, rowY, panelW, rowH);
          rctx.fillStyle = '#1a1a2e';
          rctx.font = `${rowH - 6}px "Courier New", monospace`;
          rctx.fillText(line, panelX + 10, rowY + rowH - 6);
        });
        rctx.textAlign = 'left';
      }

      // ── Premium Score Badge (top-right) ─────────────────────────────────────
      const badgeW = 300;
      const badgeH = 158;
      const badgeX = Math.max(10, drawMat.cols - badgeW - 14);
      const badgeY = 14;
      const radius = 14;

      // Shadow + white card
      rctx.save();
      rctx.shadowColor = 'rgba(0,0,0,0.35)';
      rctx.shadowBlur = 18;
      rctx.fillStyle = 'rgba(255,255,255,0.97)';
      rctx.beginPath();
      if (rctx.roundRect) rctx.roundRect(badgeX, badgeY, badgeW, badgeH, radius);
      else rctx.rect(badgeX, badgeY, badgeW, badgeH);
      rctx.fill();
      rctx.restore();

      // Colored top banner
      const grad = rctx.createLinearGradient(badgeX, badgeY, badgeX + badgeW, badgeY);
      grad.addColorStop(0, verdictColor);
      grad.addColorStop(1, verdictColor + 'aa');
      rctx.fillStyle = grad;
      rctx.beginPath();
      if (rctx.roundRect) rctx.roundRect(badgeX, badgeY, badgeW, 34, [radius, radius, 0, 0]);
      else rctx.rect(badgeX, badgeY, badgeW, 34);
      rctx.fill();

      // "KẾT QUẢ CHẤM" label
      rctx.fillStyle = '#fff';
      rctx.font = 'bold 13px "Segoe UI", sans-serif';
      rctx.textAlign = 'center';
      rctx.fillText('KẾT QUẢ CHẤM THI  ·  SANG MATH OMR', badgeX + badgeW / 2, badgeY + 22);

      // Big score number
      rctx.fillStyle = verdictColor;
      rctx.font = 'bold 58px "Segoe UI", Arial, sans-serif';
      rctx.textAlign = 'center';
      rctx.fillText(finalScoreStr, badgeX + 80, badgeY + 104);

      // Divider
      rctx.strokeStyle = '#eee';
      rctx.lineWidth = 1;
      rctx.beginPath();
      rctx.moveTo(badgeX + 130, badgeY + 44);
      rctx.lineTo(badgeX + 130, badgeY + 148);
      rctx.stroke();

      // Right panel: verdict + detail + comment
      rctx.textAlign = 'left';
      rctx.fillStyle = verdictColor;
      rctx.font = 'bold 14px "Segoe UI", sans-serif';
      rctx.fillText(verdict, badgeX + 142, badgeY + 60);

      rctx.fillStyle = '#555';
      rctx.font = '12px "Segoe UI", sans-serif';
      rctx.fillText(`TN: ${totalCorrectMCQ}/${template.numQ} câu đúng`, badgeX + 142, badgeY + 80);
      if (wrongDetails.length > 0) {
        rctx.fillStyle = '#e53935';
        rctx.fillText(`Sai: ${wrongDetails.length} câu`, badgeX + 142, badgeY + 98);
      } else {
        rctx.fillStyle = '#00b87a';
        rctx.fillText('Không có câu sai! 🎉', badgeX + 142, badgeY + 98);
      }

      // Auto-comment (word-wrap simple)
      rctx.fillStyle = '#777';
      rctx.font = 'italic 10.5px "Segoe UI", sans-serif';
      const words = autoComment.split(' ');
      let line = '', lineY = badgeY + 118, maxLineW = badgeW - 148;
      words.forEach(word => {
        const test = line + (line ? ' ' : '') + word;
        if (rctx.measureText(test).width > maxLineW && line) {
          rctx.fillText(line, badgeX + 142, lineY);
          line = word; lineY += 14;
        } else { line = test; }
      });
      if (line) rctx.fillText(line, badgeX + 142, lineY);

      // Bottom thin bar – score arc indicator
      const arcW = badgeW;
      const arcH = 6;
      rctx.fillStyle = '#eee';
      rctx.fillRect(badgeX, badgeY + badgeH - arcH, arcW, arcH);
      const fillW = Math.round((sc / 10) * arcW);
      const arcGrad = rctx.createLinearGradient(badgeX, 0, badgeX + arcW, 0);
      arcGrad.addColorStop(0, '#f44336');
      arcGrad.addColorStop(0.5, '#ff9800');
      arcGrad.addColorStop(0.7, '#2196f3');
      arcGrad.addColorStop(1.0, '#00b87a');
      rctx.fillStyle = arcGrad;
      rctx.fillRect(badgeX, badgeY + badgeH - arcH, fillW, arcH);

      rctx.textAlign = 'left';

      // ── Watermark ────────────────────────────────────────────────────────────
      rctx.save();
      rctx.globalAlpha = 0.12;
      rctx.fillStyle = '#333';
      rctx.font = 'bold 14px "Segoe UI", sans-serif';
      rctx.textAlign = 'right';
      rctx.fillText('SANG MATH OMR', drawMat.cols - 10, drawMat.rows - 8);
      rctx.restore();

      return {
        sbd: geminiAns.sbd || '?',
        warnings: warnings,
        made: geminiAns.made || '?',
        correct: totalCorrectMCQ, total: template.numQ,
        score: finalScoreStr,
        verdict: verdict,
        autoComment: autoComment,
        wrongDetails: wrongDetails,
        answers: answerMap,
        imageDataURL: resultCanvas.toDataURL('image/png')
      };

    } finally {
      [src, gray, threshMarker, contours, hierarchy, pts_src, pts_dst, M, warped]
        .forEach(m => m?.delete?.());
    }
  }
};

function onOpenCvReady() {
  if (cv instanceof Promise) {
    cv.then((target) => {
      window.cv = target;
      window.OmrEngine.init();
    });
  } else if (cv.onRuntimeInitialized !== undefined) {
    cv.onRuntimeInitialized = () => {
      window.OmrEngine.init();
    };
  } else {
    // If it's already initialized or uses a different pattern
    const checkReady = setInterval(() => {
      if (typeof cv.imread === 'function') {
        clearInterval(checkReady);
        window.OmrEngine.init();
      }
    }, 100);
  }
}
