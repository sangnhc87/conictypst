with open("js/omr_engine.js", "r") as f:
    text = f.read()

target = """            const counts = window.OmrEngine.readBubbleCol(threshWarped, pts, 9);
            const maxCount = Math.max(...counts);
            const filled = counts.filter(c => c > 30).length;
            if (filled > 1) warnings.push(`Câu ${q} tô nhiều ô`);
            else if (maxCount > 30 && maxCount < 100) warnings.push(`Câu ${q} tô mờ/tẩy xóa`);

            if (maxCount > 30) {
              const idx = counts.indexOf(maxCount);
              geminiAns.mcq[q.toString()] = OPTIONS[idx];
            }"""

replacement = """            const counts = window.OmrEngine.readBubbleCol(threshWarped, pts, 9);
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
            }"""

if target in text:
    text = text.replace(target, replacement)
    with open("js/omr_engine.js", "w") as f:
        f.write(text)
    print("Success")
else:
    print("Target not found")
