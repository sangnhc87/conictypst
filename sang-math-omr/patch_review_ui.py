import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Add reviewModal HTML just before closing </body>
review_modal_html = """
<!-- Review & Edit Modal -->
<div class="modal" id="reviewModal" style="display:none; position:fixed; top:0;left:0;width:100%;height:100%;background:rgba(15,23,42,0.9);z-index:9999;align-items:center;justify-content:center;">
  <div style="background:#1e293b; padding:20px; border-radius:16px; width:90%; max-width:400px; color:white; box-shadow: 0 10px 25px rgba(0,0,0,0.5); border: 1px solid #334155;">
     <h3 style="color:#f59e0b; margin-top:0; display:flex; align-items:center; gap:8px;">
       <span>⚠️</span> Cảnh báo nét tô mờ/lỗi
     </h3>
     <p style="font-size:13px; color:#94a3b8; margin-bottom:10px;">Hệ thống phát hiện một số ô tô không rõ ràng (tẩy chưa sạch hoặc tô quá mờ):</p>
     <ul id="reviewWarningsList" style="font-size:14px; color:#cbd5e1; margin-bottom:20px; padding-left:20px;"></ul>
     
     <div style="background:rgba(0,0,0,0.2); padding:12px; border-radius:8px; margin-bottom:20px;">
        <label style="font-size:12px; color:#94a3b8;">Sửa SBD (nếu sai):</label>
        <input id="editSBD" class="form-input" style="margin-bottom:8px;">
        <label style="font-size:12px; color:#94a3b8;">Sửa Mã Đề:</label>
        <input id="editMade" class="form-input" style="margin-bottom:8px;">
        <label style="font-size:12px; color:#94a3b8;">Sửa Điểm (ghi đè):</label>
        <input id="editScore" class="form-input" style="margin-bottom:8px;">
     </div>

     <div style="display:flex; gap:10px;">
        <button class="btn btn-outline" style="flex:1" onclick="discardAndRescan()">Chụp lại</button>
        <button class="btn btn-success" style="flex:1" onclick="forceSaveResult()">Lưu kết quả</button>
     </div>
  </div>
</div>
"""
if 'id="reviewModal"' not in content:
    content = content.replace('</body>', review_modal_html + '\n</body>')

# 2. Add JS logic for Review Modal
js_logic = """
let tempReviewResult = null;

function discardAndRescan() {
  document.getElementById('reviewModal').style.display = 'none';
  resumeCamera();
}

function forceSaveResult() {
  if (!tempReviewResult) return;
  document.getElementById('reviewModal').style.display = 'none';
  
  // Apply edits
  tempReviewResult.sbd = document.getElementById('editSBD').value.trim() || tempReviewResult.sbd;
  tempReviewResult.made = document.getElementById('editMade').value.trim() || tempReviewResult.made;
  tempReviewResult.score = document.getElementById('editScore').value.trim() || tempReviewResult.score;
  
  // Save
  tempReviewResult.name = 'Live Camera';
  tempReviewResult.cls  = 'Live';
  tempReviewResult.timestamp = Date.now();
  tempReviewResult.sessionName = document.getElementById('sessionNameSelect') ? document.getElementById('sessionNameSelect').value : 'Mặc định';
  
  gradeResults.push(tempReviewResult);
  saveToStorage();
  renderStats();
  
  // Update result overlay with forced values
  const sc = parseFloat(tempReviewResult.score);
  let vColor = sc >= 9 ? '#00b87a' : sc >= 7 ? '#4ade80' : sc >= 5 ? '#f59e0b' : '#f87171';
  document.getElementById('arScore').textContent = tempReviewResult.score;
  document.getElementById('arScore').style.color = vColor;
  document.getElementById('arDetails').textContent = `SBD: ${tempReviewResult.sbd}  •  Mã Đề: ${tempReviewResult.made}`;
  
  document.getElementById('arResult').style.display = 'block';
  document.getElementById('arStatus').textContent = 'Đã lưu! Bấm tiếp tục để quét bài khác.';
  playBeep();
  showSingleResult(tempReviewResult);
}
"""
if 'let tempReviewResult = null;' not in content:
    content = content.replace('let arForceGemini = false;', 'let arForceGemini = false;\n' + js_logic)

# 3. Intercept _showArResult
old_show_ar = """function _showArResult(result, templateName) {
  const sc = parseFloat(result.score);
  let vColor = sc >= 9 ? '#00b87a' : sc >= 7 ? '#4ade80' : sc >= 5 ? '#f59e0b' : '#f87171';
  document.getElementById('arScore').textContent = result.score;
  document.getElementById('arScore').style.color = vColor;
  document.getElementById('arVerdict').textContent = result.verdict || '';
  document.getElementById('arVerdict').style.color = vColor;
  document.getElementById('arDetails').textContent =
    `SBD: ${result.sbd}  •  Mã Đề: ${result.made}  •  (${result.correct}/${result.total})`;
  const commentEl = document.getElementById('arComment');
  if (commentEl) commentEl.textContent = result.autoComment || '';
  document.getElementById('arResult').style.display = 'block';
  document.getElementById('arStatus').textContent = 'Chấm xong! Bấm tiếp tục để quét bài khác.';
  playBeep();
  result.name = 'Live Camera';
  result.cls  = 'Live';
  result.timestamp = Date.now();
  result.sessionName = document.getElementById('sessionNameSelect').value || 'Mặc định';
  gradeResults.push(result);
  saveToStorage();
  renderStats();
  showSingleResult(result);
}"""

new_show_ar = """function _showArResult(result, templateName) {
  if (result.warnings && result.warnings.length > 0) {
    // Show Review Modal
    tempReviewResult = result;
    const ul = document.getElementById('reviewWarningsList');
    ul.innerHTML = '';
    // Show max 5 warnings to save space
    const warns = result.warnings.slice(0, 5);
    warns.forEach(w => {
       const li = document.createElement('li');
       li.textContent = w;
       ul.appendChild(li);
    });
    if (result.warnings.length > 5) {
       const li = document.createElement('li');
       li.textContent = `...và ${result.warnings.length - 5} lỗi khác`;
       ul.appendChild(li);
    }
    
    document.getElementById('editSBD').value = result.sbd;
    document.getElementById('editMade').value = result.made;
    document.getElementById('editScore').value = result.score;
    
    document.getElementById('reviewModal').style.display = 'flex';
    // Bíp cảnh báo (tần số thấp)
    if (audioCtx.state === 'suspended') audioCtx.resume();
    const osc = audioCtx.createOscillator();
    osc.type = 'square'; osc.frequency.setValueAtTime(250, audioCtx.currentTime);
    osc.connect(audioCtx.destination);
    osc.start(); osc.stop(audioCtx.currentTime + 0.3);
    return;
  }

  const sc = parseFloat(result.score);
  let vColor = sc >= 9 ? '#00b87a' : sc >= 7 ? '#4ade80' : sc >= 5 ? '#f59e0b' : '#f87171';
  document.getElementById('arScore').textContent = result.score;
  document.getElementById('arScore').style.color = vColor;
  document.getElementById('arVerdict').textContent = result.verdict || '';
  document.getElementById('arVerdict').style.color = vColor;
  document.getElementById('arDetails').textContent =
    `SBD: ${result.sbd}  •  Mã Đề: ${result.made}  •  (${result.correct}/${result.total})`;
  const commentEl = document.getElementById('arComment');
  if (commentEl) commentEl.textContent = result.autoComment || '';
  document.getElementById('arResult').style.display = 'block';
  document.getElementById('arStatus').textContent = 'Chấm xong! Bấm tiếp tục để quét bài khác.';
  playBeep();
  result.name = 'Live Camera';
  result.cls  = 'Live';
  result.timestamp = Date.now();
  result.sessionName = document.getElementById('sessionNameSelect') ? document.getElementById('sessionNameSelect').value : 'Mặc định';
  gradeResults.push(result);
  saveToStorage();
  renderStats();
  showSingleResult(result);
}"""

content = content.replace(old_show_ar, new_show_ar)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
