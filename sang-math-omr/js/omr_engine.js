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

  detectMarkers(src, options = {}) {
    const cameraMode = options.camera === true;
    let gray = new cv.Mat();
    cv.cvtColor(src, gray, cv.COLOR_RGBA2GRAY);
    let threshMarker = new cv.Mat();
    cv.adaptiveThreshold(gray, threshMarker, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY_INV, 51, 15);

    let contours = new cv.MatVector();
    let hierarchy = new cv.Mat();
    // Camera frames include the paper edge and background. RETR_EXTERNAL can
    // treat that edge as one enclosing contour and hide all four markers.
    // Keep the proven desktop/upload path unchanged and relax only live camera.
    const retrievalMode = cameraMode ? cv.RETR_LIST : cv.RETR_EXTERNAL;
    cv.findContours(threshMarker, contours, hierarchy, retrievalMode, cv.CHAIN_APPROX_SIMPLE);

    let candidates = [];
    const imageArea = src.cols * src.rows;
    const minArea = cameraMode
      ? Math.max(12, imageArea * 0.000015)
      : Math.max(35, imageArea * 0.00008);
    const maxArea = imageArea * 0.04;
    const collectCandidates = contourVector => {
      for (let i = 0; i < contourVector.size(); ++i) {
        const c = contourVector.get(i);
        const area = cv.contourArea(c);
        const rect = cv.boundingRect(c);
        const aspect = rect.height ? rect.width / rect.height : 0;
        const solidity = rect.width && rect.height ? area / (rect.width * rect.height) : 0;
        if (area >= minArea && area <= maxArea && aspect >= 0.55 && aspect <= 1.8 && solidity >= 0.42) {
          const M2 = cv.moments(c);
          if (M2.m00 !== 0) {
            const cx = Math.round(M2.m10 / M2.m00), cy = Math.round(M2.m01 / M2.m00);
            candidates.push({ cx, cy, area });
          }
        }
        c.delete();
      }
    };
    collectCandidates(contours);

    if (cameraMode) {
      // Corner markers sit very close to the paper edge. On a dark desk the
      // adaptive threshold can join a marker to the background. A conservative
      // fixed-dark pass recovers the printed black square without changing the
      // established upload/desktop detector.
      const darkMarker = new cv.Mat();
      const darkContours = new cv.MatVector();
      const darkHierarchy = new cv.Mat();
      cv.threshold(gray, darkMarker, 90, 255, cv.THRESH_BINARY_INV);
      cv.findContours(darkMarker, darkContours, darkHierarchy, cv.RETR_LIST, cv.CHAIN_APPROX_SIMPLE);
      collectCandidates(darkContours);
      darkMarker.delete();
      darkContours.delete();
      darkHierarchy.delete();
    }

    if (cameraMode && candidates.length > 1) {
      // RETR_LIST can return the inner and outer edge of the same printed
      // square. Keep the larger contour so a duplicate cannot become two
      // different corners during the extrema sort below.
      const deduped = [];
      candidates.sort((a, b) => b.area - a.area);
      for (const candidate of candidates) {
        const duplicate = deduped.some(existing =>
          Math.hypot(candidate.cx - existing.cx, candidate.cy - existing.cy) <= 2.5
        );
        if (!duplicate) deduped.push(candidate);
      }
      candidates = deduped;
    }

    // Clean up memory
    gray.delete();
    threshMarker.delete();
    contours.delete();
    hierarchy.delete();

    if (candidates.length >= 4) {
      const extremaQuad = pool => {
        const bySum = [...pool].sort((a, b) => (a.cx + a.cy) - (b.cx + b.cy));
        const byDiff = [...pool].sort((a, b) => (a.cx - a.cy) - (b.cx - b.cy));
        return [bySum[0], byDiff[byDiff.length - 1], byDiff[0], bySum[bySum.length - 1]];
      };

      if (!cameraMode) {
        // Preserve the proven upload/desktop path exactly: use the four
        // outermost candidates and require the sheet to fill the image.
        const [tlCandidate, trCandidate, blCandidate, brCandidate] = extremaQuad(candidates);
        const tl = [tlCandidate.cx, tlCandidate.cy];
        const tr = [trCandidate.cx, trCandidate.cy];
        const bl = [blCandidate.cx, blCandidate.cy];
        const br = [brCandidate.cx, brCandidate.cy];
        const spanW = (Math.hypot(tr[0] - tl[0], tr[1] - tl[1]) + Math.hypot(br[0] - bl[0], br[1] - bl[1])) / 2;
        const spanH = (Math.hypot(bl[0] - tl[0], bl[1] - tl[1]) + Math.hypot(br[0] - tr[0], br[1] - tr[1])) / 2;
        if (spanW >= src.cols * 0.35 && spanH >= src.rows * 0.35) return { tl, tr, bl, br };
        return null;
      }

      const expectedAspect = Number(options.expectedAspect);
      const evaluateCameraQuad = (tlCandidate, trCandidate, blCandidate, brCandidate) => {
        const uniqueCandidates = new Set([tlCandidate, trCandidate, blCandidate, brCandidate]);
        if (uniqueCandidates.size !== 4) return null;

        const tl = [tlCandidate.cx, tlCandidate.cy];
        const tr = [trCandidate.cx, trCandidate.cy];
        const bl = [blCandidate.cx, blCandidate.cy];
        const br = [brCandidate.cx, brCandidate.cy];
        if (tl[0] >= tr[0] || bl[0] >= br[0] || tl[1] >= bl[1] || tr[1] >= br[1]) return null;

        const topW = Math.hypot(tr[0] - tl[0], tr[1] - tl[1]);
        const bottomW = Math.hypot(br[0] - bl[0], br[1] - bl[1]);
        const leftH = Math.hypot(bl[0] - tl[0], bl[1] - tl[1]);
        const rightH = Math.hypot(br[0] - tr[0], br[1] - tr[1]);
        const spanW = (topW + bottomW) / 2;
        const spanH = (leftH + rightH) / 2;
        const polygon = [tl, tr, br, bl];
        let twiceQuadArea = 0;
        const crossProducts = [];
        for (let i = 0; i < polygon.length; i++) {
          const point = polygon[i];
          const next = polygon[(i + 1) % polygon.length];
          const afterNext = polygon[(i + 2) % polygon.length];
          twiceQuadArea += point[0] * next[1] - next[0] * point[1];
          crossProducts.push(
            (next[0] - point[0]) * (afterNext[1] - next[1]) -
            (next[1] - point[1]) * (afterNext[0] - next[0])
          );
        }
        const isConvex = crossProducts.every(value => value > 0) || crossProducts.every(value => value < 0);
        const quadArea = Math.abs(twiceQuadArea) / 2;
        const cornerAreas = [tlCandidate.area, trCandidate.area, blCandidate.area, brCandidate.area];
        const areaConsistency = Math.min(...cornerAreas) / Math.max(...cornerAreas);
        const quadAspect = spanW / Math.max(1, spanH);
        const aspectRatioDelta = expectedAspect > 0 ? quadAspect / expectedAspect : 1;
        const expectedAspectOk = !(expectedAspect > 0) || (aspectRatioDelta >= 0.5 && aspectRatioDelta <= 2);
        const horizontalBalance = Math.min(topW, bottomW) / Math.max(topW, bottomW);
        const verticalBalance = Math.min(leftH, rightH) / Math.max(leftH, rightH);

        const geometryOk = isConvex && expectedAspectOk &&
          spanW >= src.cols * 0.18 && spanH >= src.rows * 0.18 &&
          Math.min(topW, bottomW) >= src.cols * 0.14 &&
          Math.min(leftH, rightH) >= src.rows * 0.14 &&
          quadArea >= imageArea * 0.07 && areaConsistency >= 0.22 &&
          horizontalBalance >= 0.42 && verticalBalance >= 0.42;
        if (!geometryOk) return null;

        const coverage = quadArea / imageArea;
        const aspectPenalty = expectedAspect > 0 ? Math.abs(Math.log(aspectRatioDelta)) : 0;
        const score = coverage * 12 + areaConsistency + horizontalBalance + verticalBalance - aspectPenalty;
        return { markers: { tl, tr, bl, br }, score };
      };

      const findBestCameraQuad = pool => {
        if (pool.length < 4) return null;
        // The normal case is still the four true outermost markers. Accept it
        // immediately when its geometry and marker sizes are coherent; the
        // combinatorial fallback is only for a distracting object/background.
        const outermost = evaluateCameraQuad(...extremaQuad(pool));
        if (outermost) return outermost;
        // A background object can be more extreme than a printed corner. Keep
        // a small directional pool for each corner, then score combinations by
        // sheet geometry and by the similar printed-marker areas.
        const limit = Math.min(10, pool.length);
        const tlPool = [...pool].sort((a, b) => (a.cx + a.cy) - (b.cx + b.cy)).slice(0, limit);
        const brPool = [...pool].sort((a, b) => (b.cx + b.cy) - (a.cx + a.cy)).slice(0, limit);
        const blPool = [...pool].sort((a, b) => (a.cx - a.cy) - (b.cx - b.cy)).slice(0, limit);
        const trPool = [...pool].sort((a, b) => (b.cx - b.cy) - (a.cx - a.cy)).slice(0, limit);
        let best = null;
        for (const tlCandidate of tlPool) {
          for (const trCandidate of trPool) {
            for (const blCandidate of blPool) {
              for (const brCandidate of brPool) {
                const result = evaluateCameraQuad(tlCandidate, trCandidate, blCandidate, brCandidate);
                if (result && (!best || result.score > best.score)) best = result;
              }
            }
          }
        }
        return best;
      };

      const region = options.region;
      if (region && Number.isFinite(region.x) && Number.isFinite(region.y) &&
          Number.isFinite(region.width) && Number.isFinite(region.height)) {
        const regionCandidates = candidates.filter(candidate =>
          candidate.cx >= region.x && candidate.cx <= region.x + region.width &&
          candidate.cy >= region.y && candidate.cy <= region.y + region.height
        );
        const regionResult = findBestCameraQuad(regionCandidates);
        if (regionResult) return regionResult.markers;
      }

      const result = findBestCameraQuad(candidates);
      if (result) return result.markers;
    }
    return null;
  },

  /**
   * Lightweight live-camera marker detector.
   *
   * Unlike detectMarkers({ camera: true }), this path never thresholds or
   * contours the whole frame. The caller must pass the guide bounds in source
   * coordinates; only four bounded windows around those guide corners are
   * inspected. This keeps preview work predictable on mobile devices and also
   * prevents text/bubbles in the middle of the sheet from forming a false
   * quadrilateral.
   */
  detectMarkersFast(src, options = {}) {
    if (options.debug) this.lastFastMarkerDebug = null;
    const inputRegion = options.region;
    if (!src || !inputRegion ||
        !Number.isFinite(inputRegion.x) || !Number.isFinite(inputRegion.y) ||
        !Number.isFinite(inputRegion.width) || !Number.isFinite(inputRegion.height)) {
      return null;
    }

    const regionX = Math.max(0, Math.floor(inputRegion.x));
    const regionY = Math.max(0, Math.floor(inputRegion.y));
    const regionRight = Math.min(src.cols, Math.ceil(inputRegion.x + inputRegion.width));
    const regionBottom = Math.min(src.rows, Math.ceil(inputRegion.y + inputRegion.height));
    const regionWidth = regionRight - regionX;
    const regionHeight = regionBottom - regionY;
    if (regionWidth < 80 || regionHeight < 80) return null;

    const clampRatio = (value, fallback) => {
      const parsed = Number(value);
      return Number.isFinite(parsed) ? Math.max(0.24, Math.min(0.46, parsed)) : fallback;
    };
    const cornerWidth = Math.max(32, Math.min(regionWidth,
      Math.round(regionWidth * clampRatio(options.cornerWidthRatio, 0.36))));
    const cornerHeight = Math.max(32, Math.min(regionHeight,
      Math.round(regionHeight * clampRatio(options.cornerHeightRatio, 0.36))));

    const cornerRects = {
      tl: new cv.Rect(regionX, regionY, cornerWidth, cornerHeight),
      tr: new cv.Rect(regionRight - cornerWidth, regionY, cornerWidth, cornerHeight),
      bl: new cv.Rect(regionX, regionBottom - cornerHeight, cornerWidth, cornerHeight),
      br: new cv.Rect(regionRight - cornerWidth, regionBottom - cornerHeight, cornerWidth, cornerHeight)
    };
    const darkThreshold = Number.isFinite(Number(options.darkThreshold))
      ? Math.max(35, Math.min(180, Number(options.darkThreshold)))
      : 110;

    const findCorner = (key, rect) => {
      let roi = null;
      let gray = null;
      let paperMask = null;
      let paperSupport = null;
      let maskKernel = null;

      try {
        roi = src.roi(rect);
        gray = new cv.Mat();
        const channels = roi.channels();
        if (channels === 1) roi.copyTo(gray);
        else cv.cvtColor(roi, gray, channels === 4 ? cv.COLOR_RGBA2GRAY : cv.COLOR_RGB2GRAY);

        // Remove a dark desk/background before RETR_EXTERNAL. The closed light
        // paper mask fills small dark holes (including the printed marker), so
        // the marker remains searchable without an enclosing background contour.
        paperMask = new cv.Mat();
        cv.threshold(gray, paperMask, 0, 255, cv.THRESH_BINARY | cv.THRESH_OTSU);
        let kernelSize = Math.round(Math.min(rect.width, rect.height) * 0.06);
        kernelSize = Math.max(5, Math.min(19, kernelSize));
        if (kernelSize % 2 === 0) kernelSize += 1;
        maskKernel = cv.getStructuringElement(cv.MORPH_RECT, new cv.Size(kernelSize, kernelSize));
        cv.morphologyEx(paperMask, paperMask, cv.MORPH_CLOSE, maskKernel);

        // Fill the convex light-paper support without dilating it into a dark
        // desk. This bridges a black corner square that appears as a notch in
        // the paper edge, while keeping the enclosing background removed for
        // RETR_EXTERNAL below.
        paperSupport = cv.Mat.zeros(gray.rows, gray.cols, cv.CV_8UC1);
        const paperContours = new cv.MatVector();
        const paperHierarchy = new cv.Mat();
        try {
          cv.findContours(paperMask, paperContours, paperHierarchy, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE);
          let largestIndex = -1;
          let largestArea = 0;
          for (let i = 0; i < paperContours.size(); i++) {
            const contour = paperContours.get(i);
            const area = cv.contourArea(contour);
            if (area > largestArea) {
              largestArea = area;
              largestIndex = i;
            }
            contour.delete();
          }
          if (largestIndex >= 0) {
            const contour = paperContours.get(largestIndex);
            const hull = new cv.Mat();
            try {
              cv.convexHull(contour, hull);
              cv.fillConvexPoly(paperSupport, hull, new cv.Scalar(255));
            } finally {
              contour.delete();
              hull.delete();
            }
          } else {
            paperMask.copyTo(paperSupport);
          }
        } finally {
          paperContours.delete();
          paperHierarchy.delete();
        }

        const anchorX = key.endsWith('r') ? rect.width : 0;
        const anchorY = key.startsWith('b') ? rect.height : 0;
        const roiArea = rect.width * rect.height;
        const roiDiagonal = Math.hypot(rect.width, rect.height);
        const minArea = Math.max(6, roiArea * 0.000045);
        const maxArea = roiArea * 0.075;
        const maxSide = Math.max(12, Math.min(rect.width, rect.height) * 0.30);

        const collect = useOtsu => {
          const binary = new cv.Mat();
          const contours = new cv.MatVector();
          const hierarchy = new cv.Mat();
          const candidates = [];
          try {
            const thresholdType = cv.THRESH_BINARY_INV | (useOtsu ? cv.THRESH_OTSU : 0);
            cv.threshold(gray, binary, useOtsu ? 0 : darkThreshold, 255, thresholdType);
            cv.bitwise_and(binary, paperSupport, binary);
            cv.findContours(binary, contours, hierarchy, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE);

            for (let i = 0; i < contours.size(); i++) {
              const contour = contours.get(i);
              let hull = null;
              let approx = null;
              try {
                const area = cv.contourArea(contour);
                if (area < minArea || area > maxArea) continue;
                const bounds = cv.boundingRect(contour);
                if (bounds.width < 3 || bounds.height < 3 ||
                    bounds.width > maxSide || bounds.height > maxSide) continue;
                const aspect = bounds.width / Math.max(1, bounds.height);
                if (aspect < 0.62 || aspect > 1.62) continue;

                const extent = area / Math.max(1, bounds.width * bounds.height);
                if (extent < 0.52) continue;
                hull = new cv.Mat();
                cv.convexHull(contour, hull);
                const hullArea = cv.contourArea(hull);
                const solidity = hullArea > 0 ? area / hullArea : 0;
                // A perspective-resampled filled square can fall to ~0.78
                // solidity along a strongly slanted/bright edge.
                if (solidity < 0.76) continue;

                const perimeter = cv.arcLength(contour, true);
                approx = new cv.Mat();
                cv.approxPolyDP(contour, approx, perimeter * 0.065, true);
                if (approx.rows < 4 || approx.rows > 7) continue;

                const moments = cv.moments(contour);
                if (!moments.m00) continue;
                const cx = moments.m10 / moments.m00;
                const cy = moments.m01 / moments.m00;
                const distance = Math.hypot(cx - anchorX, cy - anchorY) / Math.max(1, roiDiagonal);
                const shapePenalty = Math.abs(Math.log(aspect)) * 0.22 +
                  (1 - extent) * 0.18 + (1 - solidity) * 0.12 +
                  Math.abs(approx.rows - 4) * 0.025;
                const sizeBonus = Math.min(0.10, Math.sqrt(area) / Math.max(1, Math.min(rect.width, rect.height)) * 2.4);
                candidates.push({
                  cx: rect.x + cx,
                  cy: rect.y + cy,
                  area,
                  score: distance + shapePenalty - sizeBonus
                });
              } finally {
                hull?.delete();
                approx?.delete();
                contour.delete();
              }
            }
          } finally {
            binary.delete();
            contours.delete();
            hierarchy.delete();
          }
          candidates.sort((a, b) => a.score - b.score);
          return candidates[0] || null;
        };

        // Compare the bounded fixed-black and Otsu passes. A fixed pass may
        // still find a small printed square after exposure changes even when
        // the real corner marker has become grey; returning it immediately
        // would make the quadrilateral jump inward.
        const fixedCandidate = collect(false);
        const otsuCandidate = collect(true);
        if (!fixedCandidate) return otsuCandidate;
        if (!otsuCandidate) return fixedCandidate;
        return fixedCandidate.score <= otsuCandidate.score ? fixedCandidate : otsuCandidate;
      } finally {
        roi?.delete();
        gray?.delete();
        paperMask?.delete();
        paperSupport?.delete();
        maskKernel?.delete();
      }
    };

    const selected = {};
    for (const key of ['tl', 'tr', 'bl', 'br']) {
      selected[key] = findCorner(key, cornerRects[key]);
      if (!selected[key]) return null;
    }

    const tl = [selected.tl.cx, selected.tl.cy];
    const tr = [selected.tr.cx, selected.tr.cy];
    const bl = [selected.bl.cx, selected.bl.cy];
    const br = [selected.br.cx, selected.br.cy];
    if (tl[0] >= tr[0] || bl[0] >= br[0] || tl[1] >= bl[1] || tr[1] >= br[1]) return null;

    const topWidth = Math.hypot(tr[0] - tl[0], tr[1] - tl[1]);
    const bottomWidth = Math.hypot(br[0] - bl[0], br[1] - bl[1]);
    const leftHeight = Math.hypot(bl[0] - tl[0], bl[1] - tl[1]);
    const rightHeight = Math.hypot(br[0] - tr[0], br[1] - tr[1]);
    const spanWidth = (topWidth + bottomWidth) / 2;
    const spanHeight = (leftHeight + rightHeight) / 2;
    const horizontalBalance = Math.min(topWidth, bottomWidth) / Math.max(topWidth, bottomWidth);
    const verticalBalance = Math.min(leftHeight, rightHeight) / Math.max(leftHeight, rightHeight);

    const polygon = [tl, tr, br, bl];
    let twiceArea = 0;
    const turns = [];
    for (let i = 0; i < polygon.length; i++) {
      const point = polygon[i];
      const next = polygon[(i + 1) % polygon.length];
      const afterNext = polygon[(i + 2) % polygon.length];
      twiceArea += point[0] * next[1] - next[0] * point[1];
      turns.push(
        (next[0] - point[0]) * (afterNext[1] - next[1]) -
        (next[1] - point[1]) * (afterNext[0] - next[0])
      );
    }
    const convex = turns.every(value => value > 0) || turns.every(value => value < 0);
    const quadArea = Math.abs(twiceArea) / 2;
    const markerAreas = Object.values(selected).map(candidate => candidate.area);
    const areaConsistency = Math.min(...markerAreas) / Math.max(...markerAreas);
    const configuredAreaConsistency = Number(options.minAreaConsistency);
    const minAreaConsistency = Number.isFinite(configuredAreaConsistency)
      ? Math.max(0.15, Math.min(0.85, configuredAreaConsistency))
      : 0.30;
    const expectedAspect = Number(options.expectedAspect);
    const measuredAspect = spanWidth / Math.max(1, spanHeight);
    const aspectDelta = expectedAspect > 0 ? measuredAspect / expectedAspect : 1;

    const valid = convex &&
      spanWidth >= regionWidth * 0.20 && spanHeight >= regionHeight * 0.20 &&
      quadArea >= regionWidth * regionHeight * 0.085 &&
      horizontalBalance >= 0.46 && verticalBalance >= 0.46 &&
      areaConsistency >= minAreaConsistency &&
      (!(expectedAspect > 0) || (aspectDelta >= 0.58 && aspectDelta <= 1.72));
    if (!valid) return null;

    if (options.debug) {
      this.lastFastMarkerDebug = {
        region: { x: regionX, y: regionY, width: regionWidth, height: regionHeight },
        areaConsistency,
        measuredAspect,
        quadCoverage: quadArea / (regionWidth * regionHeight)
      };
    }
    return { tl, tr, bl, br };
  },

  readBubbleCol(thresh_img, coords, radius = 6) {
    const results = [];
    for (let row = 0; row < coords.length; row++) {
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

  rescoreAnswers(answerMap, template, fullAnswers, madeCode = '', scoringOverride = null) {
    const answers = answerMap || {};
    const numQ = template?.numQ || 0;
    const numTf = template?.numTf || 0;
    const numTln = template?.numTln || 0;
    let keySet;
    if (fullAnswers && (fullAnswers.mcq !== undefined || fullAnswers.tf !== undefined || fullAnswers.tln !== undefined)) {
      keySet = fullAnswers;
    } else {
      const rawCode = String(madeCode ?? '').trim();
      const numericCode = /^\d+$/.test(rawCode) ? String(Number(rawCode)) : rawCode;
      const paddedCode = /^\d+$/.test(rawCode) ? rawCode.padStart(4, '0') : rawCode;
      // Accept 101 and 0101 as the same exam code. The paper has four OMR
      // columns, while teachers commonly name their variants with 3 digits.
      keySet = fullAnswers?.[rawCode] || fullAnswers?.[numericCode] || fullAnswers?.[paddedCode] || fullAnswers?.default || { mcq: {}, tf: {}, tln: {} };
    }
    const expectedMCQ = keySet.mcq || {};
    const expectedTF = keySet.tf || {};
    const expectedTLN = keySet.tln || {};
    const scoring = scoringOverride || template.scoring || window.OmrProfiles?.scoringFor({ mcq: numQ, tf: numTf, tln: numTln }) || {};
    const wrongDetails = [];
    let totalScore = 0, mcqScore = 0, mcqCorrect = 0, tfPoints = 0, tlnPoints = 0, tlnCorrect = 0, tlnTotal = 0;

    for (let q = 1; q <= numQ; q++) {
      const expected = String(expectedMCQ[q] || '');
      const actual = String(answers[`mcq-${q}`] || '');
      if (expected && actual === expected) {
        mcqCorrect++;
        const points = scoring.mcq?.points || 0;
        mcqScore += points;
        totalScore += points;
      } else if (expected) {
        wrongDetails.push(`C${q}: ${actual || '_'} (Đ.Án: ${expected})`);
      }
    }
    if (numQ > 0 && numTf === 0 && numTln === 0) {
      totalScore = mcqCorrect * 10 / numQ;
      mcqScore = totalScore;
    }

    for (let q = 1; q <= numTf; q++) {
      const uiQ = numQ + q;
      const expected = expectedTF[uiQ] || {};
      const actual = answers[`tf-${uiQ}`] || {};
      let correctClauses = 0;
      const wrongs = [];
      for (const label of ['a', 'b', 'c', 'd']) {
        if (!expected[label]) continue;
        if (actual[label] === expected[label]) correctClauses++;
        else wrongs.push(`${label}.${actual[label] || '_'}(Đ.Án:${expected[label]})`);
      }
      if (wrongs.length) wrongDetails.push(`C${uiQ}: ${wrongs.join(', ')}`);
      if (correctClauses > 0) {
        const points = scoring.tf?.points?.[correctClauses - 1] || 0;
        tfPoints += points;
        totalScore += points;
      }
    }

    for (let q = 1; q <= numTln; q++) {
      const uiQ = numQ + numTf + q;
      const expected = String(expectedTLN[uiQ] || '').trim().replace('.', ',');
      const actual = String(answers[`tln-${uiQ}`] || '').trim().replace('.', ',');
      if (!expected) continue;
      tlnTotal++;
      if (actual === expected) {
        tlnCorrect++;
        const points = scoring.tln?.points || 0;
        tlnPoints += points;
        totalScore += points;
      } else {
        wrongDetails.push(`C${uiQ}: ${actual || '_'} (Đ.Án: ${expected})`);
      }
    }

    const score = Number(totalScore.toFixed(2));
    let verdict, autoComment;
    if (score >= 9) { verdict = '🏆 Xuất Sắc'; autoComment = 'Em đã trả lời xuất sắc! Tiếp tục phát huy nhé 🌟'; }
    else if (score >= 7) { verdict = '⭐ Khá'; autoComment = 'Kết quả tốt! Xem lại các câu còn sai để hoàn thiện hơn 👍'; }
    else if (score >= 5) { verdict = '📖 Trung Bình'; autoComment = 'Cần ôn tập thêm các phần còn yếu, em nhé 📚'; }
    else { verdict = '💪 Cần Cố Gắng'; autoComment = 'Gặp thầy/cô để được hỗ trợ thêm. Em đừng nản nhé! 💪'; }
    return {
      correct: mcqCorrect, total: numQ, mcqCorrect, mcqTotal: numQ,
      mcqPoints: Number(mcqScore.toFixed(2)),
      tfPoints: tfPoints.toFixed(2).replace(/\.?0+$/, '') || '0',
      tlnPoints: Number(tlnPoints.toFixed(2)),
      tlnCorrect, tlnTotal, score: String(score), verdict, autoComment, wrongDetails
    };
  },

  async gradeImage(imgEl, template, fullAnswers, apiKey, templateName, engine = 'opencv', options = {}) {
    if (!template) template = TEMPLATES['tn-50'];
    const gradeOptions = options && typeof options === 'object' ? options : {};
    let src = null, gray = null, threshMarker = null, contours = null,
      hierarchy = null, pts_src = null, pts_dst = null, M = null,
      warped = null;

    try {
      const canvas = document.createElement('canvas');
      canvas.width = imgEl.naturalWidth || imgEl.videoWidth || imgEl.width;
      canvas.height = imgEl.naturalHeight || imgEl.videoHeight || imgEl.height;
      if (!canvas.width || !canvas.height) throw new Error('Ảnh đầu vào chưa sẵn sàng hoặc không có kích thước.');
      const ctx2d = canvas.getContext('2d', { willReadFrequently: true, alpha: false });
      ctx2d.drawImage(imgEl, 0, 0);

      // 1. Detect QR code for auto-template
      if (!gradeOptions.skipQr && typeof jsQR !== 'undefined') {
        // Scanning a 12–48 MP phone photo directly is slow and memory-heavy.
        // QR geometry survives a 1200px preview, while OMR grading below still
        // uses the full source frame.
        const qrScale = Math.min(1, 1200 / Math.max(canvas.width, canvas.height));
        let qrCanvas = canvas;
        let qrContext = ctx2d;
        if (qrScale < 1) {
          qrCanvas = document.createElement('canvas');
          qrCanvas.width = Math.max(1, Math.round(canvas.width * qrScale));
          qrCanvas.height = Math.max(1, Math.round(canvas.height * qrScale));
          qrContext = qrCanvas.getContext('2d', { willReadFrequently: true, alpha: false });
          qrContext.drawImage(canvas, 0, 0, qrCanvas.width, qrCanvas.height);
        }
        const imageData = qrContext.getImageData(0, 0, qrCanvas.width, qrCanvas.height);
        const code = jsQR(imageData.data, imageData.width, imageData.height, {
          inversionAttempts: "dontInvert"
        });
        if (code && code.data) {
          const descriptor = window.OmrProfiles?.decode(code.data);
          if (descriptor) {
            let resolved = window.TEMPLATES?.[descriptor.id];
            if (!resolved && typeof window.ensureOmrTemplateFromPayload === 'function') {
              const generated = await window.ensureOmrTemplateFromPayload(code.data);
              resolved = generated?.template;
            }
            if (resolved) {
              template = resolved;
              templateName = descriptor.id;
              console.log('QR profile selected:', templateName);
              const selector = document.getElementById('sheetTypeGrade');
              if (selector?.querySelector(`option[value="${descriptor.id}"]`)) selector.value = descriptor.id;
              if (window.app) window.app.selectedTemplate = templateName;
            }
          }
        }
      }

      src = cv.imread(canvas);

      let isWarped = false;
      try {
        // Live camera already has a stable marker quadrilateral. Reusing it
        // avoids a second, higher-resolution detection failing after the UI
        // has visibly locked green. Upload/desktop calls still detect normally.
        const markers = gradeOptions.markers || this.detectMarkers(
          src,
          gradeOptions.camera
            ? { camera: true, expectedAspect: gradeOptions.expectedAspect }
            : undefined
        );
        const tl = markers?.tl, tr = markers?.tr, bl = markers?.bl, br = markers?.br;

        if (tl && tr && bl && br) {
          let warpW = 1000, warpH = 1500;
          if (template.warp) {
            warpW = template.warp.width;
            warpH = template.warp.height;
          }
          pts_src = cv.matFromArray(4, 1, cv.CV_32FC2, [tl[0], tl[1], tr[0], tr[1], br[0], br[1], bl[0], bl[1]]);
          pts_dst = cv.matFromArray(4, 1, cv.CV_32FC2, [0, 0, warpW, 0, warpW, warpH, 0, warpH]);
          M = cv.getPerspectiveTransform(pts_src, pts_dst);
          warped = new cv.Mat();
          cv.warpPerspective(src, warped, M, new cv.Size(warpW, warpH));
          isWarped = true;
        }
      } catch (e) {
        console.warn("Warping failed, falling back to raw image for Gemini", e);
      }

      if (!isWarped && engine !== 'gemini') {
        throw new Error('Không nhận đủ 4 marker góc. Hãy đặt trọn phiếu trong khung, tránh bóng và chụp thẳng hơn.');
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

          if (minDist < 8) {
            return { dx: bestCx - expectedX, dy: bestCy - expectedY };
          }
          return { dx: 0, dy: 0 };
        }

        if (!isWarped) {
          throw new Error("Không thể căn chỉnh góc ảnh, vui lòng chụp rõ 4 góc hoặc chuyển sang chế độ AI Gemini.");
        }

        let threshWarped = new cv.Mat();
        let grayWarped = new cv.Mat();
        cv.cvtColor(warped, grayWarped, cv.COLOR_RGBA2GRAY);
        cv.adaptiveThreshold(grayWarped, threshWarped, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY_INV, 31, 15);

        const OPTIONS = ['A', 'B', 'C', 'D'];
        const THRESH_EMPTY = 60;
        const THRESH_FILLED = 110;

        // A camera frame is commonly downscaled once by the video pipeline and
        // enlarged again by the perspective warp. On a blank TLN column that
        // can thicken one side of an empty circle just enough to cross the old
        // absolute threshold (60), even though all circles in that column are
        // almost equally dark. A real mark remains clearly stronger than the
        // runner-up. Keep the established upload/scan rule unchanged and add
        // this distinction test only for live-camera TLN columns.
        const decideTlnColumn = (counts, innerCounts = counts) => {
          const maxCount = Math.max(...counts);
          const maxIdx = counts.indexOf(maxCount);
          const sorted = [...counts].sort((a, b) => b - a);
          const runnerUp = sorted[1] || 0;
          const innerMax = innerCounts[maxIdx] || 0;
          const innerRunnerUp = Math.max(0, ...innerCounts.filter((_, idx) => idx !== maxIdx));
          const filled = counts.filter(count => count > THRESH_FILLED).length;
          const outerDistinct =
            maxCount - runnerUp >= 14 &&
            (runnerUp === 0 || maxCount / runnerUp >= 1.22);
          const innerDistinct =
            innerMax >= 8 &&
            innerMax - innerRunnerUp >= 6 &&
            (innerRunnerUp === 0 || innerMax / innerRunnerUp >= 1.4);
          // A faint but real pencil mark may have little ink in the 6 px core,
          // so the core is a bonus signal, never a mandatory gate. Conversely,
          // an empty outline artifact usually peaks near 60–70 and has no core.
          const cameraDistinct = filled > 1 || (
            outerDistinct && (maxCount >= 75 || innerDistinct)
          );
          const selected = maxCount > THRESH_EMPTY && (!gradeOptions.camera || cameraDistinct);
          return { maxCount, maxIdx, filled, selected };
        };

        // SBD
        if (template.sbd) {
          let str = "";
          for (let col = 0; col < template.sbd.length; col++) {

            let pts = template.sbd[col].map(p => [...p]);
            if (col === 0) {
                window._sbdOff = getLocalOffset(pts[0][0] - 12, pts[0][1] - 49);
            }
            if (window._sbdOff) pts = pts.map(p => [p[0] + window._sbdOff.dx, p[1] + window._sbdOff.dy]);

            const counts = window.OmrEngine.readBubbleCol(threshWarped, pts, 9);

            const maxCount = Math.max(...counts);
            const filled = counts.filter(c => c > THRESH_FILLED).length;
            if (filled > 1) warnings.push(`SBD cột ${col + 1} tô nhiều ô`);
            else if (maxCount > THRESH_EMPTY && maxCount < THRESH_FILLED) warnings.push(`SBD cột ${col + 1} tô mờ/tẩy xóa`);
            str += maxCount > THRESH_EMPTY ? counts.indexOf(maxCount).toString() : "?";
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

            const counts = window.OmrEngine.readBubbleCol(threshWarped, pts, 9);

            const maxCount = Math.max(...counts);
            const filled = counts.filter(c => c > THRESH_FILLED).length;
            if (filled > 1) warnings.push(`Mã đề cột ${col + 1} tô nhiều ô`);
            else if (maxCount > THRESH_EMPTY && maxCount < THRESH_FILLED) warnings.push(`Mã đề cột ${col + 1} tô mờ/tẩy xóa`);
            str += maxCount > THRESH_EMPTY ? counts.indexOf(maxCount).toString() : "?";
          }
          geminiAns.made = str;
        }


        // MCQ OpenCV
        for (let q = 1; q <= template.numQ; q++) {
          let pts = template.mcq[q.toString()];
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
            const filled = counts.filter(c => c > THRESH_FILLED).length;

            let finalIdx = -1;

            if (filled > 1) {
                warnings.push(`Câu ${q} tô nhiều ô`);
            } else if (maxCount > THRESH_EMPTY && maxCount < THRESH_FILLED && window.TFGraderInstance && window.TFGraderInstance.model) {
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
            } else if (maxCount >= THRESH_FILLED) {
                finalIdx = counts.indexOf(maxCount);
            } else if (maxCount > THRESH_EMPTY && maxCount < THRESH_FILLED) {
                // Suspicious but no AI model loaded, accept it but warning
                warnings.push(`Câu ${q} tô mờ/tẩy xóa`);
                finalIdx = counts.indexOf(maxCount);
            }

            if (finalIdx !== -1) {
              geminiAns.mcq[q.toString()] = OPTIONS[finalIdx];
            }
          }
        }

        // TF OpenCV
        if (template.tf) {
          const tfOffset = template.numQ > 0 ? template.numQ : 0;
          Object.keys(template.tf).forEach(q => {
            const uiQ = (parseInt(q) + tfOffset).toString();
            const pts = template.tf[q];
            if (pts) {
              geminiAns.tf[uiQ] = {};

              // Calibrate local offset using first sub-question (a) Đ bubble
              let qOff = null;
              if (pts['a'] && pts['a'][0]) {
                qOff = getLocalOffset(pts['a'][0][0], pts['a'][0][1]);
              }

              const LBLS = ['a', 'b', 'c', 'd'];
              LBLS.forEach((lbl, idx) => {
                if (!pts[lbl]) return;
                let pair = pts[lbl].map(p => [...p]);
                if (qOff) {
                  pair = pair.map(p => [p[0] + qOff.dx, p[1] + qOff.dy]);
                }
                const cD = window.OmrEngine.readBubbleCol(threshWarped, [pair[0]], 9)[0];
                const cS = window.OmrEngine.readBubbleCol(threshWarped, [pair[1]], 9)[0];
                if (cD > THRESH_FILLED && cS > THRESH_FILLED) warnings.push(`Câu ${uiQ} ý ${lbl} tô nhiều ô`);
                else if (Math.max(cD, cS) > THRESH_EMPTY && Math.max(cD, cS) < THRESH_FILLED) warnings.push(`Câu ${uiQ} ý ${lbl} tô mờ/tẩy xóa`);
                if (cD > THRESH_EMPTY || cS > THRESH_EMPTY) {
                  geminiAns.tf[uiQ][lbl] = cD > cS ? 'Đ' : 'S';
                }
              });
            }
          });
        }

        // TLN OpenCV
        if (template.tln) {
          const tlnOffset = (template.numQ || 0) + (template.numTf || 0);
          Object.keys(template.tln).forEach(q => {
            const uiQ = (parseInt(q) + tlnOffset).toString();
            const tinfo = template.tln[q];
            if (tinfo) {
              let ansStr = "";
              const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

              // Calibrate local offset
              let qOff = null;
              let firstPt = null;
              if (Array.isArray(tinfo) && tinfo.length > 0 && tinfo[0].length > 0) {
                firstPt = tinfo[0][0];
              } else if (tinfo.sign && tinfo.sign.length > 0) {
                firstPt = tinfo.sign[0];
              } else if (tinfo.int && tinfo.int.length > 0 && tinfo.int[0].length > 0) {
                firstPt = tinfo.int[0][0];
              }
              if (firstPt) {
                qOff = getLocalOffset(firstPt[0], firstPt[1]);
              }

              if (Array.isArray(tinfo)) {
                for (let colIdx = 0; colIdx < tinfo.length; colIdx++) {
                  let colPts = tinfo[colIdx].map(p => [...p]);
                  if (qOff) colPts = colPts.map(p => [p[0] + qOff.dx, p[1] + qOff.dy]);
                  const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 9);
                  const innerCounts = gradeOptions.camera
                    ? window.OmrEngine.readBubbleCol(threshWarped, colPts, 6)
                    : counts;
                  const { maxCount, maxIdx, filled, selected } = decideTlnColumn(counts, innerCounts);
                  if (filled > 1) warnings.push(`Câu ${uiQ} tô nhiều ô`);
                  else if (selected && maxCount < THRESH_FILLED) warnings.push(`Câu ${uiQ} tô mờ`);
                  if (selected) {
                    const symbol = window.OmrTlnCodec.decodeBubble(maxIdx, colIdx);
                    if (symbol !== null) ansStr += symbol;
                  }
                }
              } else {
                if (tinfo.sign) {
                  let signPts = tinfo.sign.map(p => [...p]);
                  if (qOff) signPts = signPts.map(p => [p[0] + qOff.dx, p[1] + qOff.dy]);
                  const counts = window.OmrEngine.readBubbleCol(threshWarped, signPts, 9);
                  if (counts[0] > THRESH_EMPTY) ansStr += "-";
                }
                if (tinfo.int) {
                  tinfo.int.forEach(col => {
                    let colPts = col.map(p => [...p]);
                    if (qOff) colPts = colPts.map(p => [p[0] + qOff.dx, p[1] + qOff.dy]);
                    const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 9);
                    const innerCounts = gradeOptions.camera
                      ? window.OmrEngine.readBubbleCol(threshWarped, colPts, 6)
                      : counts;
                    const { maxCount, maxIdx, filled, selected } = decideTlnColumn(counts, innerCounts);
                    if (filled > 1) warnings.push(`Câu ${uiQ} tô nhiều ô`);
                    else if (selected && maxCount < THRESH_FILLED) warnings.push(`Câu ${uiQ} tô mờ`);
                    if (selected) ansStr += DIGITS[maxIdx];
                  });
                }
                if (tinfo.frac) {
                  let fracStr = "";
                  tinfo.frac.forEach(col => {
                    let colPts = col.map(p => [...p]);
                    if (qOff) colPts = colPts.map(p => [p[0] + qOff.dx, p[1] + qOff.dy]);
                    const counts = window.OmrEngine.readBubbleCol(threshWarped, colPts, 9);
                    const innerCounts = gradeOptions.camera
                      ? window.OmrEngine.readBubbleCol(threshWarped, colPts, 6)
                      : counts;
                    const { maxCount, maxIdx, filled, selected } = decideTlnColumn(counts, innerCounts);
                    if (filled > 1) warnings.push(`Câu ${uiQ} tô nhiều ô`);
                    else if (selected && maxCount < THRESH_FILLED) warnings.push(`Câu ${uiQ} tô mờ`);
                    if (selected) fracStr += DIGITS[maxIdx];
                  });
                  if (fracStr.length > 0) ansStr += "," + fracStr;
                }
              }
              if (ansStr !== "" && ansStr !== "-") {
                geminiAns.tln[uiQ] = ansStr;
              }
            }
          });
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
      let mcqScore = 0;
      let totalCorrectMCQ = 0;
      let tfPoints = 0;
      let tlnPoints = 0;
      let tlnCorrect = 0;
      let tlnTotal = 0;
      const answerMap = {};
      const OPTIONS = ['A', 'B', 'C', 'D'];
      const LBLS = ['a', 'b', 'c', 'd'];

      // Multi-key lookup: resolve answer key based on detected exam code
      // fullAnswers can be either:
      //   - old flat format: { mcq:{}, tf:{}, tln:{} }
      //   - new masterAnswerKeys format: { 'default': { mcq:{}, tf:{}, tln:{} }, '101': {...}, '102': {...} }
      let keySet;
      const madeCode = geminiAns.made || '';
      if (fullAnswers && (fullAnswers.mcq !== undefined || fullAnswers.tf !== undefined || fullAnswers.tln !== undefined)) {
        // Old flat format — backward compatible
        keySet = fullAnswers;
      } else if (fullAnswers && typeof fullAnswers === 'object') {
        // New masterAnswerKeys format — lookup by detected mã đề
        keySet = fullAnswers[madeCode] || fullAnswers['default'] || { mcq: {}, tf: {}, tln: {} };
      } else {
        keySet = { mcq: {}, tf: {}, tln: {} };
      }
      const expectedMCQ = keySet.mcq || {};
      const expectedTF = keySet.tf || {};
      const expectedTLN = keySet.tln || {};

      const wrongDetails = [];

      // DYNAMIC DEFAULT SCORING RULES
      let scoring = template.scoring;

      let numQ = template.numQ;
      let numTf = template.numTf || (template.tf ? Object.keys(template.tf).length : 0);
      let numTln = template.numTln || (template.tln ? Object.keys(template.tln).length : 0);

      if (window.customScoringConfig && window.customScoringConfig.templateId === templateName) {
        scoring = {
          mcq: { points: parseFloat(window.customScoringConfig.mcqPoints) },
          tf: { points: window.customScoringConfig.tfPoints.map(parseFloat) },
          tln: { points: parseFloat(window.customScoringConfig.tlnPoints) }
        };
        numQ = window.customScoringConfig.mcqCount;
        numTf = window.customScoringConfig.tfCount;
        numTln = window.customScoringConfig.tlnCount;
      } else if (!scoring) {
        if (template.numQ === 12 && template.numTf === 4 && template.numTln === 6) {
          // Standard mixed math exam (THPT Quốc Gia)
          scoring = {
            mcq: { points: 0.25 },
            tf: { points: [0.1, 0.25, 0.5, 1.0] },
            tln: { points: 0.5 }
          };
        } else if (template.numQ === 0 && template.numTf === 12 && template.numTln === 0) {
          // 12 TF questions (each has 4 sub-questions)
          const scale = 10.0 / 12.0;
          scoring = {
            tf: { points: [0.1 * scale, 0.25 * scale, 0.5 * scale, 1.0 * scale] }
          };
        } else if (template.numQ === 0 && template.numTf === 0 && template.numTln === 10) {
          // 10 short answer questions (TLN-10)
          scoring = {
            tln: { points: 1.0 }
          };
        } else if (template.numQ > 0 && template.numTf === 0 && template.numTln === 0) {
          // MCQ only
          scoring = {
            mcq: { points: 10.0 / template.numQ }
          };
        } else {
          // General fallback
          const mcqWeight = template.numQ > 0 ? 0.25 : 0;
          const tfWeight = template.numTf > 0 ? 1.0 : 0;
          const tlnWeight = template.numTln > 0 ? 0.5 : 0;
          scoring = {
            mcq: { points: mcqWeight },
            tf: { points: [0.1, 0.25, 0.5, 1.0] },
            tln: { points: tlnWeight }
          };
        }
      }

      // GRADE MCQ
      for (let q = 1; q <= numQ; q++) {
        const expectedAns = expectedMCQ[q.toString()] || '';
        const studentAns = (geminiAns.mcq && geminiAns.mcq[q.toString()]) || '';
        answerMap[`mcq-${q}`] = studentAns;

        if (studentAns === expectedAns && expectedAns !== '') {
          totalCorrectMCQ++;
          const points = (scoring && scoring.mcq) ? scoring.mcq.points : 10.0 / numQ;
          mcqScore += points;
          totalScore += points;
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

      // OVERWRITE MCQ SCORE FOR PURE MCQ EXAMS TO PREVENT FLOAT INACCURACY
      if (!template.tf && !template.tln && numQ > 0) {
        totalScore = (totalCorrectMCQ * 10.0 / numQ);
        mcqScore = totalScore;
      }

      // GRADE TF
      if (template.tf && geminiAns.tf) {
        const tfOffset = template.numQ > 0 ? template.numQ : 0;
        Object.keys(template.tf).forEach(q => {
          if (parseInt(q) > numTf) return;
          const uiQ = (parseInt(q) + tfOffset).toString();
          const exp = expectedTF[uiQ] || {};
          const stu = geminiAns.tf[uiQ] || {};
          answerMap[`tf-${uiQ}`] = stu;
          let correctClauses = 0;
          let wrongs = [];

          LBLS.forEach((lbl, idx) => {
            const exAns = exp[lbl];
            const stAns = stu[lbl];
            if (!exAns) return;
            if (stAns === exAns) {
              correctClauses++;
              if (isWarped) {
                const pair = template.tf[q][lbl];
                if (pair) {
                  const pt = (stAns === 'Đ') ? pair[0] : pair[1];
                  rctx.strokeStyle = '#00cc66'; rctx.lineWidth = 3;
                  drawTick(pt[0], pt[1]);
                }
              }
            } else {
              wrongs.push(`${lbl}.${stAns || '_'}(Đ.Án:${exAns})`);
              if (isWarped) {
                const pair = template.tf[q][lbl];
                if (pair) {
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
            }
          });
          if (wrongs.length > 0) wrongDetails.push(`C${uiQ}: ${wrongs.join(', ')}`);
          if (correctClauses > 0) {
            let qPoints = 0;
            if (scoring && scoring.tf && scoring.tf.points) {
              qPoints = scoring.tf.points[correctClauses - 1];
            } else {
              // fallback
              if (correctClauses === 1) qPoints = 0.1;
              else if (correctClauses === 2) qPoints = 0.25;
              else if (correctClauses === 3) qPoints = 0.5;
              else if (correctClauses === 4) qPoints = 1.0;
            }
            tfPoints += qPoints;
            totalScore += qPoints;
          }
        });
      }

      // GRADE TLN
      if (template.tln && geminiAns.tln) {
        const tlnOffset = (template.numQ || 0) + (template.numTf || 0);

        Object.keys(template.tln).forEach(q => {
          if (parseInt(q) > numTln) return;
          const uiQ = (parseInt(q) + tlnOffset).toString();
          const expAns = (expectedTLN[uiQ] || '').toString().trim();
          const stuAns = (geminiAns.tln[uiQ] || '').toString().trim();
          const expCols = window.OmrTlnCodec.align(expAns);
          const stuCols = window.OmrTlnCodec.align(stuAns);
          answerMap[`tln-${uiQ}`] = stuAns;

          if (!expAns) return;
          tlnTotal++;

          const tinfo = template.tln[q];

          if (stuAns === expAns) {
            tlnCorrect++;
            const points = (scoring && scoring.tln) ? scoring.tln.points : 0.5;
            tlnPoints += points;
            totalScore += points;

            if (isWarped && Array.isArray(tinfo)) {
              for (let colIdx = 0; colIdx < tinfo.length; colIdx++) {
                const char = stuCols[colIdx];
                const bubbleIdx = window.OmrTlnCodec.bubbleIndex(char, colIdx);
                if (bubbleIdx !== -1 && tinfo[colIdx][bubbleIdx]) {
                  const pt = tinfo[colIdx][bubbleIdx];
                  rctx.strokeStyle = '#00cc66'; rctx.lineWidth = 3;
                  drawTick(pt[0], pt[1]);
                }
              }
            }
          } else {
            wrongDetails.push(`C${uiQ}: ${stuAns || '_'} (Đ.Án: ${expAns})`);

            if (isWarped && Array.isArray(tinfo)) {
              for (let colIdx = 0; colIdx < tinfo.length; colIdx++) {
                const sChar = stuCols[colIdx];
                const eChar = expCols[colIdx];

                const sBubble = window.OmrTlnCodec.bubbleIndex(sChar, colIdx);
                const eBubble = window.OmrTlnCodec.bubbleIndex(eChar, colIdx);

                if (sBubble !== -1 && sBubble === eBubble) {
                  if (tinfo[colIdx][sBubble]) {
                    const pt = tinfo[colIdx][sBubble];
                    rctx.strokeStyle = '#00cc66'; rctx.lineWidth = 3;
                    drawTick(pt[0], pt[1]);
                  }
                } else {
                  if (sBubble !== -1 && tinfo[colIdx][sBubble]) {
                    const ptS = tinfo[colIdx][sBubble];
                    rctx.strokeStyle = '#ff3333'; rctx.lineWidth = 3;
                    drawCross(ptS[0], ptS[1]);
                  }
                  if (eBubble !== -1 && tinfo[colIdx][eBubble]) {
                    const ptE = tinfo[colIdx][eBubble];
                    rctx.strokeStyle = '#3399ff'; rctx.lineWidth = 2;
                    drawCircle(ptE[0], ptE[1]);
                  }
                }
              }
            }
          }
        });
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

      // ── Watermark ────────────────────────────────────────────────────────────
      rctx.save();
      rctx.globalAlpha = 0.12;
      rctx.fillStyle = '#333';
      rctx.font = 'bold 14px "Segoe UI", sans-serif';
      rctx.textAlign = 'right';
      rctx.fillText('SANG MATH OMR', drawMat.cols - 10, drawMat.rows - 8);
      rctx.restore();

      return {
        templateId: templateName,
        sbd: geminiAns.sbd || '?',
        warnings: warnings,
        made: geminiAns.made || '?',
        correct: totalCorrectMCQ, total: numQ,
        mcqCorrect: totalCorrectMCQ,
        mcqTotal: numQ,
        mcqPoints: Number(mcqScore.toFixed(2)),
        tfPoints: tfPoints.toFixed(2).replace(/\.?0+$/, ''),
        tlnPoints: Number(tlnPoints.toFixed(2)),
        tlnCorrect: tlnCorrect,
        tlnTotal: numTln || 0,
        score: finalScoreStr,
        verdict: verdict,
        autoComment: autoComment,
        wrongDetails: wrongDetails,
        answers: answerMap,
        // JPEG keeps a whole-class batch small enough to review/export on
        // phones. It only affects the annotated result image, never OMR input.
        imageDataURL: resultCanvas.toDataURL('image/jpeg', 0.88)
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
