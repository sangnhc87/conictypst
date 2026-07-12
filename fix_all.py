import re

with open('sang-math-omr/index.html', 'r') as f:
    html = f.read()

# 1. fix_ui_gentle
html = re.sub(r'\s*<option value="ds-20-ngang">.*?</option>', '', html)
html = re.sub(r'\s*<option value="tln-10-ngang">.*?</option>', '', html)

card_ds20 = """                        <div class="tmpl-card" data-type="ds-20-ngang" onclick="selectTemplate('ds-20-ngang', this)">
                            <div class="tmpl-icon">✅</div>
                            <div class="tmpl-name">ĐS-20</div>
                            <div class="tmpl-desc">20 câu Đúng/Sai<br>Luyện tập chuyên sâu</div>
                            <span class="tmpl-badge" style="background: #e0f2fe; color: #0284c7; border-color: #bae6fd;">A5 Ngang</span>
                        </div>"""

card_tln10 = """                        <div class="tmpl-card" data-type="tln-10-ngang" onclick="selectTemplate('tln-10-ngang', this)">
                            <div class="tmpl-icon">✏️</div>
                            <div class="tmpl-name">TLN-10</div>
                            <div class="tmpl-desc">10 câu Tự Luận Ngắn<br>Form điền đáp án</div>
                            <span class="tmpl-badge" style="background: #e0f2fe; color: #0284c7; border-color: #bae6fd;">A5 Ngang</span>
                        </div>"""

html = html.replace(card_ds20, "")
html = html.replace(card_tln10, "")

expected_inputs = """                            <div class="form-group" style="flex:1;margin:0">
                                <label>Mã đề kỳ vọng</label>
                                <input class="form-input" id="expectedMade" placeholder="VD: 001" maxlength="3">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>SBD kỳ vọng (tuỳ chọn)</label>
                            <input class="form-input" id="expectedSbd" placeholder="VD: 0025" maxlength="4">
                        </div>"""

html = html.replace(expected_inputs, "                        </div>")

resMatch = """                        <div>SBD/Mã đề: <span id="resMatch" style="font-weight:bold;color:var(--green)">✅ Khớp hoàn toàn</span></div>"""
html = html.replace(resMatch, "")

js_remove = """            const expSbd = document.getElementById('expectedSbd').value;
            const expMade = document.getElementById('expectedMade').value;
            let matchTxt = '✅ Khớp hoàn toàn', matchClr = 'var(--green)';
            if (expSbd && result.sbd !== expSbd) { matchTxt = `⚠️ Lệch SBD (${result.sbd})`; matchClr = 'var(--orange)'; }
            else if (expMade && result.made !== expMade) { matchTxt = `⚠️ Lệch Mã đề (${result.made})`; matchClr = 'var(--orange)'; }
            document.getElementById('resMatch').textContent = matchTxt;
            document.getElementById('resMatch').style.color = matchClr;"""
html = html.replace(js_remove, "")

# 2. patch_ui_made
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


# 3. fix_state + fix_storage (COMBINED)
state_repl = """        // ---- STATE ----
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

# The problem in previous fix was that `re.sub(r"// ---- STATE ----...", state_repl)` matched multiple times
# because the old html had `// ---- STATE ----` inside multiple places or somehow the regex matched loosely.
# Wait! In my previous run, I used `html = re.sub(..., state_repl, html, flags=re.DOTALL)`.
# But `re.sub` replaces ALL matches by default unless `count=1` is passed.
# Let's pass `count=1`!

html = re.sub(
    r"// ---- STATE ----\s*const correctAnswers = \{\};\s*const OPTIONS = \[\"A\", \"B\", \"C\", \"D\"\];",
    state_repl,
    html,
    count=1,
    flags=re.DOTALL
)

# Remove the old tfAnswerKey and tlnAnswerKey constants
html = re.sub(
    r"const tfAnswerKey = \{\};\s*// \{ \"13\": \{a:'Đ',b:'S',c:'Đ',d:'Đ'\}, ... \}\s*const tlnAnswerKey = \{\};\s*// \{ \"17\": \"2.5\", ... \}",
    "// tfAnswerKey and tlnAnswerKey are proxies now",
    html,
    count=1
)

# Now fix the gradeImage callers in index.html to pass window.masterAnswerKeys
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


# 4. fix_json
html = html.replace(
"""            const data = {
                studentList: studentList,
                gradeResults: gradeResults,
                examSessions: examSessions
            };""",
"""            const data = {
                studentList: studentList,
                gradeResults: gradeResults,
                examSessions: examSessions,
                masterAnswerKeys: window.masterAnswerKeys
            };"""
)

import_logic = """
                    if (data.studentList) studentList = data.studentList;
                    if (data.gradeResults) gradeResults = data.gradeResults;
                    if (data.examSessions) examSessions = data.examSessions;
                    if (data.masterAnswerKeys) window.masterAnswerKeys = data.masterAnswerKeys;

                    saveToStorage();
                    if (typeof saveMasterAnswerKeys === 'function') saveMasterAnswerKeys();
                    
                    // Rebuild UI
                    updateStudentTable();
                    updateResultsUI();
                    
                    // Rebuild activeMadeKey options
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
                    if (typeof switchAnswerKey === 'function') switchAnswerKey('default');
"""

html = re.sub(
    r"if \(data\.studentList\).*?updateResultsUI\(\);",
    import_logic.strip(),
    html,
    count=1,
    flags=re.DOTALL
)

with open('sang-math-omr/index.html', 'w') as f:
    f.write(html)
