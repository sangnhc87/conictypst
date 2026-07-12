const fs = require('fs');
let html = fs.readFileSync('sang-math-omr/index.html', 'utf8');

// 1. Add Visual Debug Modal HTML
if (!html.includes('id="visualDebugModal"')) {
    html = html.replace('</body>', `
<!-- Visual Debug Modal -->
<div class="modal" id="visualDebugModal" style="display:none; align-items:center; justify-content:center;">
  <div class="modal-content" style="max-width:800px; width: 90%; padding:15px; position:relative; background:#fff; border-radius:12px; max-height: 90vh; overflow-y: auto;">
    <button onclick="document.getElementById('visualDebugModal').style.display='none'" style="position:absolute;top:10px;right:10px;background:#f44336;color:white;border:none;border-radius:5px;padding:5px 12px;font-weight:bold;cursor:pointer;">Đóng ✕</button>
    <h3 style="margin-top:0; color:#333;">Ảnh Chấm Visual Debug</h3>
    <p style="font-size: 13px; color: #666; margin-bottom: 10px;">Các dấu <span style="color:#00cc66; font-weight:bold;">Tick xanh (V)</span> là câu đúng, <span style="color:#ff3333; font-weight:bold;">Chéo đỏ (X)</span> là câu sai. Ô tô mờ/nhiều ô sẽ bị gạch chân.</p>
    <img id="visualDebugImg" src="" style="width:100%; height:auto; border:1px solid #ddd; border-radius:8px; display:block;">
  </div>
</div>
</body>`);
}

// 2. Add Export/Import JSON UI
const uiSearch = `<button class="btn btn-secondary btn-sm" onclick="exportExcel()">📗 Xuất Excel</button>`;
const uiReplace = `<button class="btn btn-secondary btn-sm" onclick="exportExcel()">📗 Xuất Excel</button>
                        <button class="btn btn-secondary btn-sm" onclick="exportJSON()" style="background: #8e44ad; border-color: #8e44ad; color: white;">💾 Xuất JSON</button>
                        <button class="btn btn-secondary btn-sm" onclick="document.getElementById('importJsonFile').click()" style="background: #2c3e50; border-color: #2c3e50; color: white;">📂 Nhập JSON</button>
                        <input type="file" id="importJsonFile" accept=".json" style="display:none" onchange="importJSON(event)">`;
if (html.includes(uiSearch) && !html.includes('exportJSON()')) {
    html = html.replace(uiSearch, uiReplace);
}

// 3. Update renderStats button
const tableBtnSearch = `<td><button onclick="deleteResult(\${i})" style="background:rgba(239,68,68,0.2);color:#f87171;border:1px solid rgba(239,68,68,0.3);border-radius:5px;padding:2px 8px;cursor:pointer;font-size:11px;" title="Xoá bài này">🗑️</button></td>`;
const tableBtnReplace = `<td>
        <button onclick="showVisualDebug(\${i})" style="background:rgba(59,130,246,0.2);color:#3b82f6;border:1px solid rgba(59,130,246,0.3);border-radius:5px;padding:2px 8px;cursor:pointer;font-size:11px;margin-right:5px;" title="Xem ảnh chấm">👁️</button>
        <button onclick="deleteResult(\${i})" style="background:rgba(239,68,68,0.2);color:#f87171;border:1px solid rgba(239,68,68,0.3);border-radius:5px;padding:2px 8px;cursor:pointer;font-size:11px;" title="Xoá bài này">🗑️</button>
      </td>`;
if (html.includes(tableBtnSearch)) {
    // using split join to replace all occurrences if there are multiple, though in map it is a template literal
    html = html.split(tableBtnSearch).join(tableBtnReplace);
}

// 4. Add JavaScript Logic
const jsLogicStr = `
        function showVisualDebug(idx) {
            const res = gradeResults[idx];
            if (res && res.imageDataURL) {
                document.getElementById('visualDebugImg').src = res.imageDataURL;
                document.getElementById('visualDebugModal').style.display = 'flex';
            } else {
                alert("Bài này chưa được lưu ảnh chấm debug. Vui lòng chấm lại bằng camera hoặc PDF batch!");
            }
        }

        function exportJSON() {
            const data = {
                studentList: studentList,
                gradeResults: gradeResults,
                examSessions: examSessions
            };
            const jsonStr = JSON.stringify(data);
            const blob = new Blob([jsonStr], { type: "application/json" });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = \`OMR_Backup_\${new Date().toISOString().slice(0,10)}.json\`;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            URL.revokeObjectURL(url);
        }

        async function importJSON(event) {
            const file = event.target.files[0];
            if (!file) return;
            const reader = new FileReader();
            reader.onload = async (e) => {
                try {
                    const data = JSON.parse(e.target.result);
                    if (data.studentList) studentList = data.studentList;
                    if (data.gradeResults) gradeResults = data.gradeResults;
                    if (data.examSessions) examSessions = data.examSessions;
                    
                    if (window.OMRDB) {
                        await window.OMRDB.set('omr_studentList', JSON.stringify(studentList));
                        await window.OMRDB.set(STORAGE_KEY, JSON.stringify(gradeResults));
                    }
                    localStorage.setItem('omr_sessions_v1', JSON.stringify(examSessions));
                    updateSessionSelects();
                    renderStats();
                    renderClassTable();
                    alert("Đã khôi phục dữ liệu từ JSON thành công!");
                } catch (err) {
                    alert("File JSON không hợp lệ: " + err.message);
                }
                event.target.value = '';
            };
            reader.readAsText(file);
        }
`;

if (!html.includes('function showVisualDebug(')) {
    html = html.replace('// ---- CLASS MANAGEMENT ----', jsLogicStr + '\n        // ---- CLASS MANAGEMENT ----');
}

fs.writeFileSync('sang-math-omr/index.html', html, 'utf8');
console.log('Phase 4 Patch Complete!');
