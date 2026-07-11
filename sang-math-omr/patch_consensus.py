import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Replace let lastScanTime = 0;
new_vars = """let lastScanTime = 0;
let arLastMarkers = null;
let arStableFrames = 0;
"""
content = content.replace('let lastScanTime = 0;', new_vars)

# Find the marker logic in arScanLoop
old_marker_logic = """    if (markers) {
      // Scale back coords to overlay sizing
      const rx = canvasOverlay.width / scanCanvas.width;
      const ry = canvasOverlay.height / scanCanvas.height;
      const pts = [markers.tl, markers.tr, markers.br, markers.bl];
      
      // Vẽ viền AR màu xanh
      ctx.beginPath();
      ctx.moveTo(pts[0][0]*rx, pts[0][1]*ry);
      ctx.lineTo(pts[1][0]*rx, pts[1][1]*ry);
      ctx.lineTo(pts[2][0]*rx, pts[2][1]*ry);
      ctx.lineTo(pts[3][0]*rx, pts[3][1]*ry);
      ctx.closePath();
      ctx.lineWidth = 4;
      ctx.strokeStyle = '#4ade80';
      ctx.fillStyle = 'rgba(74, 222, 128, 0.2)';
      ctx.fill();
      ctx.stroke();

      // KHÓA FRAME VÀ CHẤM
      isArScanning = false;
      document.getElementById('arStatus').textContent = 'Tìm thấy bài! Đang chấm điểm...';"""

new_marker_logic = """    if (markers) {
      if (arLastMarkers) {
        let maxDist = 0;
        for (const k of ['tl', 'tr', 'bl', 'br']) {
          const d = Math.hypot(markers[k][0] - arLastMarkers[k][0], markers[k][1] - arLastMarkers[k][1]);
          if (d > maxDist) maxDist = d;
        }
        if (maxDist < 15) arStableFrames++;
        else arStableFrames = 0;
      } else {
        arStableFrames = 1;
      }
      arLastMarkers = markers;

      // Scale back coords to overlay sizing
      const rx = canvasOverlay.width / scanCanvas.width;
      const ry = canvasOverlay.height / scanCanvas.height;
      const pts = [markers.tl, markers.tr, markers.br, markers.bl];
      
      // Vẽ viền AR màu xanh (chớp nếu đủ frame)
      ctx.beginPath();
      ctx.moveTo(pts[0][0]*rx, pts[0][1]*ry);
      ctx.lineTo(pts[1][0]*rx, pts[1][1]*ry);
      ctx.lineTo(pts[2][0]*rx, pts[2][1]*ry);
      ctx.lineTo(pts[3][0]*rx, pts[3][1]*ry);
      ctx.closePath();
      ctx.lineWidth = 4;
      ctx.strokeStyle = arStableFrames >= 3 ? '#4ade80' : '#f59e0b';
      ctx.fillStyle = arStableFrames >= 3 ? 'rgba(74, 222, 128, 0.2)' : 'rgba(245, 158, 11, 0.1)';
      ctx.fill();
      ctx.stroke();

      if (arStableFrames >= 3) {
        arStableFrames = 0;
        arLastMarkers = null;
        
        // KHÓA FRAME VÀ CHẤM
        isArScanning = false;
        document.getElementById('arStatus').textContent = 'Tìm thấy bài! Đang chấm điểm...';"""

content = content.replace(old_marker_logic, new_marker_logic)

# Also reset stableframes when markers not found
old_catch = """    }
  } catch(e) {
    // console error safely
  }
}"""
new_catch = """    } else {
      arStableFrames = 0;
      arLastMarkers = null;
    }
  } catch(e) {
    // console error safely
  }
}"""
content = content.replace(old_catch, new_catch)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
