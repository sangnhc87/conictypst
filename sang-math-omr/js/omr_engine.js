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
        cv.threshold(gray, threshMarker, 100, 255, cv.THRESH_BINARY_INV);

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
        if (!isWarped) {
          throw new Error("Không thể căn chỉnh góc ảnh, vui lòng chụp rõ 4 góc hoặc chuyển sang chế độ AI Gemini.");
        }

        let threshWarped = new cv.Mat();
        let grayWarped = new cv.Mat();
        cv.cvtColor(warped, grayWarped, cv.COLOR_RGBA2GRAY);
        cv.threshold(grayWarped, threshWarped, 140, 255, cv.THRESH_BINARY_INV);

        const OPTIONS = ['A', 'B', 'C', 'D'];


        // SBD
        if (template.sbd) {
          let str = "";
          for (let col = 0; col < template.sbd.length; col++) {
            const counts = window.OmrEngine.readBubbleCol(threshWarped, template.sbd[col], 9);
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
            const counts = window.OmrEngine.readBubbleCol(threshWarped, template.made[col], 9);
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
            const counts = window.OmrEngine.readBubbleCol(threshWarped, pts, 9);
            const maxCount = Math.max(...counts);
            const filled = counts.filter(c => c > 30).length;
            if (filled > 1) warnings.push(`Câu ${q} tô nhiều ô`);
            else if (maxCount > 30 && maxCount < 100) warnings.push(`Câu ${q} tô mờ/tẩy xóa`);

            if (maxCount > 30) {
              const idx = counts.indexOf(maxCount);
              geminiAns.mcq[q.toString()] = OPTIONS[idx];
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
                    if (maxCount > 30) ansStr += DIGITS[counts.indexOf(maxCount)];
                  });
                }
                if (tinfo.frac) {
                  let fracStr = "";
                  tinfo.frac.forEach(colPts => {
                    const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 9);
                    const maxCount = Math.max(...counts);
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
          rctx.fillText(line, 30, 200 + i * 20);
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
      rctx.fillText("KẾT QUẢ CHẤM", badgeX + badgeW / 2, badgeY + 35);

      rctx.font = "bold 48px sans-serif";
      rctx.fillText(finalScoreStr, badgeX + badgeW / 2, badgeY + 85);

      rctx.fillStyle = "#333";
      rctx.font = "18px sans-serif";
      rctx.fillText(`Trắc nghiệm: ${totalCorrectMCQ}/${template.numQ}`, badgeX + badgeW / 2, badgeY + 110);
      rctx.textAlign = "left";

      return {
        sbd: geminiAns.sbd || '?',
        warnings: warnings,
        made: geminiAns.made || '?',
        correct: totalCorrectMCQ, total: template.numQ,
        score: finalScoreStr,
        answers: answerMap,
        imageDataURL: resultCanvas.toDataURL("image/jpeg", 0.8)
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
