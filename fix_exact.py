with open('sang-math-omr/index.html', 'r') as f:
    html = f.read()

import re

# Fix exportExcel duplication
# The first one is at 16523: function exportExcel()
# The second one is at 17287: function exportExcel()
# Let's remove the first one which is an old version probably.
start_idx = html.find('function exportExcel() {')
if start_idx != -1:
    end_idx = html.find('        // ======= START NEW CODE FOR MULTIPLE SHEETS =======', start_idx)
    if end_idx != -1:
        # We replace the first exportExcel function entirely
        html = html[:start_idx] + html[end_idx:]

# 1. UI Options
html = html.replace('<option value="ds-20-ngang">ĐS-20</option>', '')
html = html.replace('<option value="tln-10-ngang">TLN-10</option>', '')
html = html.replace('<option value="ds20-tln10-ngang">ĐS20+TLN10 (A5 Ngang)</option>', '')

# 2. UI cards
card1_start = html.find('<div class="tmpl-card" data-type="ds-20-ngang"')
if card1_start != -1:
    card1_end = html.find('</div>', card1_start)
    card1_end = html.find('</div>', card1_end + 1)
    card1_end = html.find('</div>', card1_end + 1)
    card1_end = html.find('</div>', card1_end + 1) + 6
    html = html[:card1_start] + html[card1_end:]

card2_start = html.find('<div class="tmpl-card" data-type="tln-10-ngang"')
if card2_start != -1:
    card2_end = html.find('</div>', card2_start)
    card2_end = html.find('</div>', card2_end + 1)
    card2_end = html.find('</div>', card2_end + 1)
    card2_end = html.find('</div>', card2_end + 1) + 6
    html = html[:card2_start] + html[card2_end:]

card3_start = html.find('<div class="tmpl-card" data-type="ds20-tln10-ngang"')
if card3_start != -1:
    card3_end = html.find('</div>', card3_start)
    card3_end = html.find('</div>', card3_end + 1)
    card3_end = html.find('</div>', card3_end + 1)
    card3_end = html.find('</div>', card3_end + 1) + 6
    html = html[:card3_start] + html[card3_end:]


# 3. Expected Inputs
input_start = html.find('<div class="form-group" style="flex:1;margin:0">')
input_text = """<div class="form-group" style="flex:1;margin:0">
                                <label>Mã đề kỳ vọng</label>
                                <input class="form-input" id="expectedMade" placeholder="VD: 001" maxlength="3">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>SBD kỳ vọng (tuỳ chọn)</label>
                            <input class="form-input" id="expectedSbd" placeholder="VD: 0025" maxlength="4">
                        </div>"""
html = html.replace(input_text, "</div>")

resMatch = """<div>SBD/Mã đề: <span id="resMatch" style="font-weight:bold;color:var(--green)">✅ Khớp hoàn toàn</span></div>"""
html = html.replace(resMatch, "")

# 4. Remove JS expected logic
js_logic = """const expSbd = document.getElementById('expectedSbd').value;
            const expMade = document.getElementById('expectedMade').value;
            let matchTxt = '✅ Khớp hoàn toàn', matchClr = 'var(--green)';
            if (expSbd && result.sbd !== expSbd) { matchTxt = `⚠️ Lệch SBD (${result.sbd})`; matchClr = 'var(--orange)'; }
            else if (expMade && result.made !== expMade) { matchTxt = `⚠️ Lệch Mã đề (${result.made})`; matchClr = 'var(--orange)'; }
            document.getElementById('resMatch').textContent = matchTxt;
            document.getElementById('resMatch').style.color = matchClr;"""
html = html.replace(js_logic, "")


# 5. Add UI selector above answers grid
made_selector_html = """                    <div class="row-between mb-3" style="background:#f8fafc; padding:10px; border-radius:8px; border:1px solid #e2e8f0;">
                        <div class="row" style="gap:10px; align-items:center;">
                            <label style="font-weight:600; color:#334155;">Mã đề đang chọn:</label>
                            <select id="activeMadeKey" class="form-input" style="width:140px; padding:4px 8px; font-weight:bold;" onchange="switchAnswerKey(this.value)">
                                <option value="default">Mặc định (Chung)</option>
                            </select>
                        </div>
                        <div class="row" style="gap:6px;">
                            <button class="btn btn-outline btn-sm" onclick="addAnswerKey()" style="padding:4px 10px; border-color:#3b82f6; color:#3b82f6;">➕ Thêm mã</button>
                            <button class="btn btn-outline btn-sm" onclick="removeAnswerKey()" style="padding:4px 10px; border-color:#ef4444; color:#ef4444;" title="Xoá mã đề đang chọn">🗑️</button>
                        </div>
                    </div>"""
html = html.replace('<div class="answer-grid" id="answersGrid"></div>', made_selector_html + '\n                    <div class="answer-grid" id="answersGrid"></div>')


# 6. Change State
old_state = """        // ---- STATE ----
        const correctAnswers = {};
        const OPTIONS = ["A", "B", "C", "D"];"""

new_state = """        // ---- STATE ----
        window.masterAnswerKeys = { 'default': { mcq: {}, tf: {}, tln: {} } };
        window.currentMadeKey = 'default';
        
        function saveMasterAnswerKeys() {
            localStorage.setItem('omr_answerKeys_v2', JSON.stringify(window.masterAnswerKeys));
        }
        function loadMasterAnswerKeys() {
            try {
                const stored = localStorage.getItem('omr_answerKeys_v2');
                if (stored) {
                    window.masterAnswerKeys = JSON.parse(stored);
                    const sel = document.getElementById('activeMadeKey');
                    if (sel) {
                        for (let made in window.masterAnswerKeys) {
                            if (made !== 'default') {
                                const opt = document.createElement('option');
                                opt.value = made;
                                opt.textContent = `Mã đề: ${made}`;
                                sel.appendChild(opt);
                            }
                        }
                    }
                }
            } catch(e) {}
        }
        // Load keys on startup
        loadMasterAnswerKeys();

        const OPTIONS = ["A", "B", "C", "D"];
        const LBLS = ["a", "b", "c", "d"];

        // Getter helpers for backwards compatibility in UI rendering
        const correctAnswers = new Proxy({}, {
            get: (t, p) => window.masterAnswerKeys[window.currentMadeKey].mcq[p],
            set: (t, p, v) => { window.masterAnswerKeys[window.currentMadeKey].mcq[p] = v; saveMasterAnswerKeys(); return true; }
        });
        const tfAnswerKey = new Proxy({}, {
            get: (t, p) => {
                if (!window.masterAnswerKeys[window.currentMadeKey].tf[p]) {
                    window.masterAnswerKeys[window.currentMadeKey].tf[p] = { a: '', b: '', c: '', d: '' };
                }
                return window.masterAnswerKeys[window.currentMadeKey].tf[p];
            },
            set: (t, p, v) => { window.masterAnswerKeys[window.currentMadeKey].tf[p] = v; saveMasterAnswerKeys(); return true; }
        });
        const tlnAnswerKey = new Proxy({}, {
            get: (t, p) => window.masterAnswerKeys[window.currentMadeKey].tln[p] || '',
            set: (t, p, v) => { window.masterAnswerKeys[window.currentMadeKey].tln[p] = v; saveMasterAnswerKeys(); return true; }
        });

        function switchAnswerKey(made) {
            window.currentMadeKey = made;
            document.getElementById('activeMadeKey').value = made;
            // Re-render UI
            const sheetType = document.getElementById('sheetTypeGrade').value;
            onSheetTypeChange();
        }

        function addAnswerKey() {
            const m = prompt("Nhập mã đề mới (VD: 101, 102...):");
            if (!m || !m.trim()) return;
            const made = m.trim();
            if (!window.masterAnswerKeys[made]) {
                window.masterAnswerKeys[made] = { mcq: {}, tf: {}, tln: {} };
                const opt = document.createElement('option');
                opt.value = made;
                opt.textContent = `Mã đề: ${made}`;
                document.getElementById('activeMadeKey').appendChild(opt);
            }
            saveMasterAnswerKeys();
            switchAnswerKey(made);
        }

        function removeAnswerKey() {
            if (window.currentMadeKey === 'default') {
                alert("Không thể xoá mã đề mặc định!");
                return;
            }
            if (confirm(`Bạn có chắc muốn xoá đáp án của mã đề ${window.currentMadeKey}?`)) {
                delete window.masterAnswerKeys[window.currentMadeKey];
                const sel = document.getElementById('activeMadeKey');
                for (let i = 0; i < sel.options.length; i++) {
                    if (sel.options[i].value === window.currentMadeKey) {
                        sel.remove(i);
                        break;
                    }
                }
                saveMasterAnswerKeys();
                switchAnswerKey('default');
            }
        }
        """

html = html.replace(old_state, new_state)

# Remove the old tfAnswerKey and tlnAnswerKey constants completely
old_tf = "const tfAnswerKey = {};   // { \"13\": {a:'Đ',b:'S',c:'Đ',d:'Đ'}, ... }"
old_tln = "const tlnAnswerKey = {};  // { \"17\": \"2.5\", ... }"
html = html.replace(old_tf, "")
html = html.replace(old_tln, "")


# 7. Update callers
html = html.replace(
    """const result = await window.OmrEngine.gradeImage(fc, template, fullAnswers, apiKey, templateName, 'gemini');""",
    """const result = await window.OmrEngine.gradeImage(fc, template, window.masterAnswerKeys, apiKey, templateName, 'gemini');"""
)
html = html.replace(
    """const result = await window.OmrEngine.gradeImage(fullCanvas, template, fullAnswers, apiKey, templateName, engine);""",
    """const result = await window.OmrEngine.gradeImage(fullCanvas, template, window.masterAnswerKeys, apiKey, templateName, engine);"""
)
html = html.replace(
    """const result = await window.OmrEngine.gradeImage(entry.imgEl, template, fullAnswers, apiKey, sheetType, engine);""",
    """const result = await window.OmrEngine.gradeImage(entry.imgEl, template, window.masterAnswerKeys, apiKey, sheetType, engine);"""
)

# 8. update export/import JSON
json_exp_old = """            const data = {
                studentList: studentList,
                gradeResults: gradeResults,
                examSessions: examSessions
            };"""
json_exp_new = """            const data = {
                studentList: studentList,
                gradeResults: gradeResults,
                examSessions: examSessions,
                masterAnswerKeys: window.masterAnswerKeys
            };"""
html = html.replace(json_exp_old, json_exp_new)

json_imp_old = """                    if (data.studentList) studentList = data.studentList;
                    if (data.gradeResults) gradeResults = data.gradeResults;
                    if (data.examSessions) examSessions = data.examSessions;
                    saveToStorage();
                    updateStudentTable();
                    updateResultsUI();"""
json_imp_new = """                    if (data.studentList) studentList = data.studentList;
                    if (data.gradeResults) gradeResults = data.gradeResults;
                    if (data.examSessions) examSessions = data.examSessions;
                    if (data.masterAnswerKeys) window.masterAnswerKeys = data.masterAnswerKeys;

                    saveToStorage();
                    if (typeof saveMasterAnswerKeys === 'function') saveMasterAnswerKeys();
                    
                    updateStudentTable();
                    updateResultsUI();
                    
                    const sel = document.getElementById('activeMadeKey');
                    if (sel) {
                        sel.innerHTML = '<option value="default">Mặc định (Chung)</option>';
                        for (let made in window.masterAnswerKeys) {
                            if (made !== 'default') {
                                const opt = document.createElement('option');
                                opt.value = made;
                                opt.textContent = `Mã đề: ${made}`;
                                sel.appendChild(opt);
                            }
                        }
                    }
                    if (typeof switchAnswerKey === 'function') switchAnswerKey('default');"""
html = html.replace(json_imp_old, json_imp_new)

with open('sang-math-omr/index.html', 'w') as f:
    f.write(html)
