
        // ---- STATE ----
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
        
        let uploadedFiles = [];      // Batch: list of {file, imgEl}
        // Quản lý lớp/kỳ thi
let examSessions = ['Mặc định'];

function loadSessions() {
    const saved = localStorage.getItem('omr_sessions_v1');
    if (saved) {
        try {
            examSessions = JSON.parse(saved);
        } catch(e) {}
    }
    updateSessionSelects();
}

function saveSessions() {
    localStorage.setItem('omr_sessions_v1', JSON.stringify(examSessions));
    updateSessionSelects();
}

function updateSessionSelects() {
    const sel1 = document.getElementById('sessionNameSelect');
    const sel2 = document.getElementById('statsSessionSelect');
    if(!sel1 || !sel2) return;
    
    const curr1 = sel1.value;
    const curr2 = sel2.value;
    
    let html1 = '';
    let html2 = '<option value="All">-- Tất cả --</option>';
    examSessions.forEach(s => {
        const opt = `<option value="${s}">${s}</option>`;
        html1 += opt;
        html2 += opt;
    });
    
    sel1.innerHTML = html1;
    sel2.innerHTML = html2;
    
    if(examSessions.includes(curr1)) sel1.value = curr1;
    if(curr2 === 'All' || examSessions.includes(curr2)) sel2.value = curr2;
}

window.promptAddSession = function() {
    const name = prompt("Nhập tên Lớp / Kỳ thi mới (VD: Kiểm tra 15p Lớp 12A1):");
    if (name && name.trim()) {
        const t = name.trim();
        if (!examSessions.includes(t)) {
            examSessions.push(t);
            saveSessions();
            document.getElementById('sessionNameSelect').value = t;
        }
    }
};

window.onSessionChange = function() {
    // Không cần xử lý logic gì đặc biệt vì khi chấm tự lấy value này
};


// Chèn gọi loadSessions vào window.onload
const oldOnload = window.onload;
window.onload = function() {
    if(oldOnload) oldOnload();
    currentTemplate = window.TEMPLATES ? window.TEMPLATES["12-4-6ngang"] : null;
    loadSessions();
};

let gradeResults = [];       // All grading results (localStorage-backed)
        let studentList = [];        // Imported class list
        let selectedTemplate = "12-4-6ngang";
        let currentTemplate = null;
        let currentNumQ = 50;

        // ─── localStorage helpers ────────────────────────────────────────────
        const STORAGE_KEY = 'omr_grade_results_v2';
        function saveToStorage() {
            try {
                // Store without imageDataURL to keep localStorage small
                const slim = gradeResults.map(r => ({
                    ...r, imageDataURL: r.imageDataURL ? '__img__' : null
                }));
                localStorage.setItem(STORAGE_KEY, JSON.stringify(slim));
            } catch(e) { /* ignore QuotaExceeded */ }
        }
        function loadFromStorage() {
            try {
                const raw = localStorage.getItem(STORAGE_KEY);
                if (raw) {
                    const data = JSON.parse(raw);
                    gradeResults = data.map(r => ({ ...r, imageDataURL: null }));
                    if (gradeResults.length > 0) {
                        document.getElementById('resultsCard').style.display = 'flex';
                        document.getElementById('resultsCard').style.flexDirection = 'column';
                        renderStats();
                        // Show last result info
                        const last = gradeResults[gradeResults.length - 1];
                        document.getElementById('scoreVal').textContent = last.score;
                        document.getElementById('resSbd').textContent = last.sbd;
                        document.getElementById('resMade').textContent = last.made;
                        document.getElementById('resCorrect').textContent = `${last.correct}/${last.total}`;
                        document.getElementById('noDataMsg').style.display = 'none';
                    }
                }
            } catch(e) {}
        }
        function deleteResult(idx) {
            if (!confirm(`Xoá kết quả bài SBD: ${gradeResults[idx]?.sbd || idx + 1}?`)) return;
            gradeResults.splice(idx, 1);
            saveToStorage();
            renderStats();
            if (gradeResults.length === 0) {
                document.getElementById('resultsCard').style.display = 'none';
                document.getElementById('noDataMsg').style.display = 'flex';
            }
        }
        // Load saved results on page start
        window.addEventListener('DOMContentLoaded', () => {
            loadFromStorage();
            if (window.TFGraderInstance) {
                window.TFGraderInstance.loadModel('tfjs_model/model.json');
            }
        });




        // ---- TABS ----
        function switchTab(id) {
            document.querySelectorAll('.tab-panel').forEach(p => p.classList.remove('active'));
            document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
            document.getElementById(id).classList.add('active');
            document.getElementById('btn-' + id).classList.add('active');
            if (id === 'tab-stats') renderStats();
        }

        // ---- ANSWER GRID ----
        function buildAnswerGrid(numQ) {
            const grid = document.getElementById('answersGrid');
            grid.innerHTML = '';
            currentNumQ = numQ;
            for (let i = 1; i <= numQ; i++) {
                const row = document.createElement('div');
                row.className = 'q-row';
                const num = document.createElement('span');
                num.className = 'q-num'; num.innerText = `${i}.`;
                row.appendChild(num);
                const opts = document.createElement('div');
                opts.className = 'q-options';
                OPTIONS.forEach(opt => {
                    const btn = document.createElement('button');
                    btn.className = 'opt-btn';
                    btn.innerText = opt;
                    btn.id = `q-${i}-${opt}`;
                    btn.onclick = () => selectAnswer(i, opt);
                    opts.appendChild(btn);
                });
                row.appendChild(opts);
                grid.appendChild(row);
                correctAnswers[i.toString()] = 'A';
                document.getElementById(`q-${i}-A`).classList.add('active');
            }
        }

        function selectAnswer(q, opt) {
            OPTIONS.forEach(o => document.getElementById(`q-${q}-${o}`)?.classList.remove('active'));
            document.getElementById(`q-${q}-${opt}`)?.classList.add('active');
            correctAnswers[q.toString()] = opt;
        }

        function generateRandomKeys() {
            for (let i = 1; i <= currentNumQ; i++) {
                selectAnswer(i, OPTIONS[Math.floor(Math.random() * 4)]);
            }
            if (currentTemplate === TEMPLATES['thptqg-toan'] || currentTemplate === TEMPLATES['12-4-6ngang']) {
                ['13', '14', '15', '16'].forEach(q => {
                    ['a', 'b', 'c', 'd'].forEach(lbl => {
                        const val = Math.random() > 0.5 ? 'Đ' : 'S';
                        const btn = document.getElementById(`tf-${q}-${lbl}-${val}`);
                        if (btn) btn.click();
                    });
                });
                for (let q = 17; q <= 22; q++) {
                    const isNegative = Math.random() > 0.8;
                    const isDecimal = Math.random() > 0.5;
                    let valStr = "";
                    if (isNegative) valStr += "-";
                    valStr += Math.floor(Math.random() * 9) + 1; // 1-9
                    if (isDecimal) {
                        valStr += "." + Math.floor(Math.random() * 9);
                    } else {
                        valStr += Math.floor(Math.random() * 9);
                    }
                    const inp = document.getElementById(`tln-${q}`);
                    if (inp) {
                        inp.value = valStr;
                        tlnAnswerKey[q] = valStr;
                    }
                }
            }
        }

        function clearKeys() {
            for (let i = 1; i <= currentNumQ; i++) {
                OPTIONS.forEach(o => document.getElementById(`q-${i}-${o}`)?.classList.remove('active'));
                correctAnswers[i.toString()] = '';
            }
            if (currentTemplate === TEMPLATES['thptqg-toan'] || currentTemplate === TEMPLATES['12-4-6ngang']) {
                ['13', '14', '15', '16'].forEach(q => {
                    ['a', 'b', 'c', 'd'].forEach(lbl => {
                        ['Đ', 'S'].forEach(v => document.getElementById(`tf-${q}-${lbl}-${v}`)?.classList.remove('active'));
                        if (tfAnswerKey[q]) tfAnswerKey[q][lbl] = '';
                    });
                });
                for (let q = 17; q <= 22; q++) {
                    const inp = document.getElementById(`tln-${q}`);
                    if (inp) inp.value = '';
                    tlnAnswerKey[q] = '';
                }
            }
        }

        function importCSVKey() {
            const input = document.createElement('input');
            input.type = 'file'; input.accept = '.csv,.txt';
            input.onchange = e => {
                const f = e.target.files[0];
                if (!f) return;
                const reader = new FileReader();
                reader.onload = ev => {
                    const lines = ev.target.result.trim().split('\n');
                    lines.forEach((line, idx) => {
                        const parts = line.trim().split(/[,;\t]/);
                        const q = parseInt(parts[0]);
                        const ans = (parts[1] || '').trim().toUpperCase();
                        if (q >= 1 && q <= currentNumQ && OPTIONS.includes(ans)) {
                            selectAnswer(q, ans);
                        }
                    });
                };
                reader.readAsText(f);
            };
            input.click();
        }

        function buildCustomTLNAnswerGrid(start, end) {
            const container = document.getElementById('answersGrid').parentNode;
            const div = document.createElement('div');
            div.id = 'tlnAnswerSection';
            div.style.marginTop = '14px';
            div.innerHTML = `<div style="font-size:12px;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:.5px;margin-bottom:8px;">
                🔢 Đáp án Điền Số / Tự Luận Ngắn (Câu ${start}–${end})
            </div>`;
            for (let q = start; q <= end; q++) {
                tlnAnswerKey[q] = '';
                const row = document.createElement('div');
                row.style.cssText = 'display:flex;align-items:center;gap:8px;margin-bottom:6px;';
                row.innerHTML = `<span style="font-size:12px;font-weight:700;color:var(--muted);width:28px">C${q}:</span>
                <input class="form-input" style="flex:1;padding:6px 10px;font-size:12px" id="tln-${q}" placeholder="VD: 1,25 hoặc 5" oninput="tlnAnswerKey[${q}]=this.value">`;
                div.appendChild(row);
            }
            container.appendChild(div);
        }

        function onSheetTypeChange() {
            const type = document.getElementById('sheetTypeGrade').value;
            const numMap = {
                'tn-50': 50,
                '12-4-6ngang': 12,
                'thptqg-toan': 12,
                'tn-40': 40,
                'tn-60': 60,
                'ds-12': 0,
                'tln-10': 0
            };
            buildAnswerGrid(numMap[type] ?? 50);
            currentTemplate = TEMPLATES[type] || TEMPLATES['12-4-6ngang'];
            currentNumQ = numMap[type] ?? 50;
            // Show/hide TF and TLN sections based on template type
            const isMixed = (type === 'thptqg-toan' || type === '12-4-6ngang');
            document.getElementById('tfAnswerSection')?.remove();
            if (isMixed) buildTFAnswerGrid();
            document.getElementById('tlnAnswerSection')?.remove();
            if (isMixed) {
                buildTLNAnswerGrid();
            } else if (type === 'ds-12') {
                buildCustomTFAnswerGrid(1, 12);
            } else if (type === 'tln-10') {
                buildCustomTLNAnswerGrid(1, 10);
            }
        }

        // ---- UPLOAD & BATCH ----
        function setupUpload() {
            const zone = document.getElementById('uploadZoneSingle');
            const fileInput = document.getElementById('fileInputSingle');

            zone.addEventListener('dragover', e => { e.preventDefault(); zone.classList.add('drag-over'); });
            zone.addEventListener('dragleave', () => zone.classList.remove('drag-over'));
            zone.addEventListener('drop', e => {
                e.preventDefault(); zone.classList.remove('drag-over');
                handleFiles(e.dataTransfer.files);
            });
            fileInput.addEventListener('change', () => handleFiles(fileInput.files));
        }

        function handleFiles(files) {
            uploadedFiles = [];
            const batchList = document.getElementById('batchList');
            batchList.innerHTML = '';
            document.getElementById('previewContainer').style.display = 'none';

            const arr = Array.from(files);
            arr.forEach((file, idx) => {
                const reader = new FileReader();
                reader.onload = e => {
                    const imgEl = new Image();
                    imgEl.onload = () => {
                        uploadedFiles.push({ file, imgEl, name: file.name, status: 'pending' });
                        // Show preview of first image
                        if (idx === 0) {
                            document.getElementById('imagePreview').src = e.target.result;
                            document.getElementById('previewContainer').style.display = 'block';
                        }
                        // Batch item
                        if (arr.length > 1) {
                            const item = document.createElement('div');
                            item.className = 'batch-item'; item.id = `batch-${idx}`;
                            item.innerHTML = `<span>${file.name}</span><span class="status status-pending" id="bstatus-${idx}">Chờ</span>`;
                            batchList.appendChild(item);
                        }
                        if (uploadedFiles.length === arr.length) {
                            document.getElementById('gradeBtn').disabled = false;
                        }
                    };
                    imgEl.src = e.target.result;
                };
                reader.readAsDataURL(file);
            });
        }




        // ---- TF ANSWER KEY BUILDER ----
        
        

        function buildCustomTFAnswerGrid(start, end) {
            const container = document.getElementById('answersGrid').parentNode;
            const div = document.createElement('div');
            div.id = 'tfAnswerSection';
            div.style.marginTop = '14px';
            div.innerHTML = `<div style="font-size:12px;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:.5px;margin-bottom:8px;">
                📋 Đáp án Đúng/Sai (Câu ${start}–${end})
            </div>`;
            for (let q = start; q <= end; q++) {
                const qStr = q.toString();
                tfAnswerKey[qStr] = { a: '', b: '', c: '', d: '' };
                const row = document.createElement('div');
                row.style.cssText = 'display:flex;align-items:center;gap:6px;margin-bottom:6px;';
                row.innerHTML = `<span style="font-size:12px;font-weight:700;color:var(--muted);width:28px">C${q}:</span>`;
                ['a', 'b', 'c', 'd'].forEach(lbl => {
                    const wrap = document.createElement('span');
                    wrap.style.cssText = 'display:flex;align-items:center;gap:3px;font-size:11px;';
                    wrap.innerHTML = `(${lbl})`;
                    ['Đ', 'S'].forEach(val => {
                        const btn = document.createElement('button');
                        btn.className = 'opt-btn'; btn.style.width = '28px'; btn.style.height = '26px'; btn.style.fontSize = '10px';
                        btn.textContent = val; btn.id = `tf-${q}-${lbl}-${val}`;
                        btn.onclick = () => {
                            ['Đ', 'S'].forEach(v => document.getElementById(`tf-${q}-${lbl}-${v}`)?.classList.remove('active'));
                            btn.classList.add('active');
                            tfAnswerKey[qStr][lbl] = val;
                        };
                        wrap.appendChild(btn);
                    });
                    row.appendChild(wrap);
                });
                div.appendChild(row);
            }
            div.appendChild(row);
        }

        function buildTFAnswerGrid() {
            buildCustomTFAnswerGrid(13, 16);
        }

        function buildTLNAnswerGrid() {
            const container = document.getElementById('answersGrid').parentNode;
            const div = document.createElement('div');
            div.id = 'tlnAnswerSection';
            div.style.marginTop = '14px';
            div.innerHTML = `<div style="font-size:12px;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:.5px;margin-bottom:8px;">
    🔢 Phần III – Đáp án Trả Lời Ngắn (Câu 17–22)
  </div>`;
            for (let q = 17; q <= 22; q++) {
                tlnAnswerKey[q] = '';
                const row = document.createElement('div');
                row.style.cssText = 'display:flex;align-items:center;gap:8px;margin-bottom:6px;';
                row.innerHTML = `<span style="font-size:12px;font-weight:700;color:var(--muted);width:28px">C${q}:</span>
    <input class="form-input" style="flex:1;padding:6px 10px;font-size:12px" id="tln-${q}" placeholder="VD: 1,25 hoặc 5" oninput="tlnAnswerKey[${q}]=this.value">`;
                div.appendChild(row);
            }
            container.appendChild(div);
        }

        // ---- GRADE BUTTON HANDLER (OPENCV) ----
        const gradeBtn = document.getElementById('gradeBtn');
        gradeBtn.addEventListener('click', function () {
            if (!window.OmrEngine.isOpenCvLoaded || uploadedFiles.length === 0) return;
            const btn = this;
            btn.disabled = true;
            const spinner = document.getElementById('gradeSpinner');
            spinner.style.display = 'block';

            // Show and reset progress bar
            const batchProgress = document.getElementById('batchProgress');
            const progressFill = document.getElementById('progressFill');
            const progressLabel = document.getElementById('progressLabel');
            if (batchProgress) batchProgress.style.display = 'block';
            if (progressFill) progressFill.style.width = '0%';
            if (progressLabel) progressLabel.textContent = `0 / ${uploadedFiles.length} bài`;

            setTimeout(() => {
                try {
                    const sheetType = document.getElementById('sheetTypeGrade').value;
                    const template = TEMPLATES[sheetType] || TEMPLATES['12-4-6ngang'];

                    let idx = 0;
                    const apiKey = document.getElementById('geminiApiKey').value.trim();

                    async function gradeNext() {
                        if (idx >= uploadedFiles.length) {
                            btn.disabled = false;
                            spinner.style.display = 'none';
                            renderStats();
                            if (uploadedFiles.length > 1) {
                                document.getElementById('btnExportPDF').style.display = 'none';
                                alert(`Đã chấm xong ${uploadedFiles.length} bài!`);
                            }
                            return;
                        }

                        const entry = uploadedFiles[idx];
                        const bstatus = document.getElementById(`bstatus-${idx}`);

                        try {
                            if (bstatus) { bstatus.textContent = 'Đang chấm...'; bstatus.className = 'status status-pending'; }

                             const fullAnswers = {
                                 mcq: correctAnswers,
                                 tf: tfAnswerKey,
                                 tln: tlnAnswerKey
                             };
                            const engine = document.getElementById('gradeEngine').value;
                            const result = await window.OmrEngine.gradeImage(entry.imgEl, template, window.masterAnswerKeys, apiKey, sheetType, engine);
                            result.filename = entry.name;
                            result.timestamp = new Date().toLocaleString('vi-VN');
                            gradeResults.push(result);
                            saveToStorage();

                            if (result.warnings && result.warnings.length > 0) {
                                const ctx = new (window.AudioContext || window.webkitAudioContext)();
                                const osc = ctx.createOscillator();
                                osc.type = 'sine'; osc.frequency.setValueAtTime(440, ctx.currentTime);
                                osc.connect(ctx.destination); osc.start(); osc.stop(ctx.currentTime + 0.3);

                                const confirmMsg = `CẢNH BÁO TỪ BÀI [${entry.name}]:\n- ${result.warnings.join('\n- ')}\n\nGiáo viên có muốn tiếp tục chấm không? Bấm OK để tiếp tục, hoặc Cancel để xem lại chi tiết bài này.`;
                                if (!confirm(confirmMsg)) {
                                    btn.disabled = false;
                                    spinner.style.display = 'none';
                                    if (bstatus) { bstatus.textContent = 'Dừng'; bstatus.className = 'status status-err'; }
                                    showSingleResult(result);
                                    return;
                                }
                            }

                            if (bstatus) { bstatus.textContent = result.score; bstatus.className = 'status status-ok'; }

                            // Update progress bar
                            const pct = Math.round((idx + 1) / uploadedFiles.length * 100);
                            const pFill = document.getElementById('progressFill');
                            const pLabel = document.getElementById('progressLabel');
                            if (pFill) { pFill.style.width = pct + '%'; }
                            if (pLabel) { pLabel.textContent = `${idx + 1} / ${uploadedFiles.length} bài · ${pct}%`; }

                            if (uploadedFiles.length === 1) {
                                showSingleResult(result);
                                document.getElementById('btnExportPDF').style.display = 'inline-block';
                            }
                        } catch (e) {
                            if (bstatus) { bstatus.textContent = 'Lỗi'; bstatus.className = 'status status-err'; }
                            console.error(`Lỗi chấm ${entry.name}:`, e);
                            if (uploadedFiles.length === 1) alert("Lỗi khi chấm: \n" + e.message);
                        }

                        idx++;
                        if (idx >= uploadedFiles.length) {
                            // All done
                            btn.disabled = false;
                            spinner.style.display = 'none';
                            const pLabel = document.getElementById('progressLabel');
                            if (pLabel) pLabel.textContent = `✅ Hoàn tất ${uploadedFiles.length} bài!`;
                            if (uploadedFiles.length > 1) {
                                updateStats();
                                switchTab('tab-stats');
                            }
                            return;
                        }
                        setTimeout(gradeNext, 50);
                    }

                    gradeNext();
                } catch (err) {
                    alert('Lỗi chung: ' + err.message);
                    btn.disabled = false;
                    spinner.style.display = 'none';
                }
            }, 100);
        });

        function showSingleResult(result) {
            document.getElementById('noDataMsg').style.display = 'none';
            const c = document.getElementById('canvasOutput');
            c.style.display = 'block';
            document.getElementById('scoreVal').textContent = result.score;
            document.getElementById('resSbd').textContent = result.sbd;
            document.getElementById('resMade').textContent = result.made;

            // Support both MCQ-only and THPTQG mixed format
            const isThptqg = result.mcqTotal !== undefined;
            if (isThptqg) {
                document.getElementById('resCorrect').textContent =
                    `TN:${result.mcqCorrect}/${result.mcqTotal} · ĐS:${result.tfPoints}đ · TLN:${result.tlnCorrect}/${result.tlnTotal}`;
            } else {
                document.getElementById('resCorrect').textContent = `${result.correct}/${result.total}`;
            }

            

            const sc = parseFloat(result.score);
            const circle = document.getElementById('scoreCircle');
            circle.style.display = 'flex';

            // Score color classes by band
            let scoreColor, scoreGlow;
            if (sc >= 9.0) { scoreColor = '#00b87a'; scoreGlow = 'rgba(0,184,122,.35)'; }
            else if (sc >= 7.0) { scoreColor = '#2196f3'; scoreGlow = 'rgba(33,150,243,.35)'; }
            else if (sc >= 5.0) { scoreColor = '#ff9800'; scoreGlow = 'rgba(255,152,0,.35)'; }
            else { scoreColor = '#f44336'; scoreGlow = 'rgba(244,67,54,.35)'; }

            circle.style.boxShadow = `0 0 40px ${scoreGlow}, inset 0 0 20px rgba(0,0,0,.2)`;
            circle.style.background = `conic-gradient(${scoreColor} 0%, rgba(20,35,65,1) 0%)`;
            document.getElementById('scoreVal').style.color = scoreColor;
            // Force animation restart
            circle.className = 'score-circle';
            void circle.offsetWidth; // reflow
            circle.className = 'score-circle' + (sc >= 8 ? ' success' : '');

            // Animated progress bar
            const bar = document.getElementById('scoreProgressBar');
            if (bar) {
                bar.style.width = '0%';
                setTimeout(() => { bar.style.width = Math.min(100, sc * 10) + '%'; }, 80);
            }

            // Verdict badge
            const verdictBadge = document.getElementById('verdictBadge');
            if (verdictBadge && result.verdict) {
                verdictBadge.textContent = result.verdict;
                verdictBadge.style.display = 'block';
                verdictBadge.style.color = scoreColor;
                verdictBadge.style.borderColor = scoreColor;
                verdictBadge.style.background = scoreColor + '18';
            }

            // Auto comment
            const commentBox = document.getElementById('autoCommentBox');
            if (commentBox && result.autoComment) {
                commentBox.textContent = '💬 ' + result.autoComment;
                commentBox.style.display = 'block';
                commentBox.style.borderLeftColor = scoreColor;
            }

            // Wrong details pills
            const wrongPanel = document.getElementById('wrongDetailsPanel');
            const wrongList = document.getElementById('wrongDetailsList');
            if (wrongPanel && wrongList && result.wrongDetails && result.wrongDetails.length > 0) {
                wrongList.innerHTML = result.wrongDetails.map(d =>
                    `<span style="background:rgba(244,67,54,0.15);color:#f87171;border:1px solid rgba(244,67,54,0.3);border-radius:5px;padding:2px 7px;font-size:11px;font-family:monospace;">${d}</span>`
                ).join('');
                wrongPanel.style.display = 'block';
            } else if (wrongPanel) {
                wrongPanel.style.display = 'none';
            }

            // Show premium export button
            const btnAnnotated = document.getElementById('btnExportAnnotated');
            if (btnAnnotated) btnAnnotated.style.display = 'inline-flex';

            document.getElementById('resultsCard').style.display = 'flex';
            document.getElementById('resultsCard').style.flexDirection = 'column';
        }


        function exportSingleResult() {
            if (gradeResults.length === 0) return;
            const r = gradeResults[gradeResults.length - 1];
            const text = `SBD: ${r.sbd}\nMã đề: ${r.made}\nĐiểm: ${r.score}\nĐúng: ${r.correct || r.mcqCorrect}/${r.total || r.mcqTotal}`;
            const blob = new Blob([text], { type: 'text/plain' });
            const a = document.createElement('a');
            a.href = URL.createObjectURL(blob);
            a.download = `ket-qua-${r.sbd || 'unknown'}.txt`;
            a.click();
        }

        function exportResultImage() {
            if (gradeResults.length === 0) return alert('Chưa có bài chấm nào!');
            const result = gradeResults[gradeResults.length - 1];

            if (!result.imageDataURL) {
                return alert('Chưa có ảnh kết quả!');
            }

            const a = document.createElement('a');
            a.href = result.imageDataURL;
            a.download = "ChamDiem_" + (result.filename || "KetQua").replace(/\.[^/.]+$/, "") + ".png";
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
        }

        function exportAnnotatedReport() {
            if (gradeResults.length === 0) return alert('Chưa có bài chấm nào!');
            const result = gradeResults[gradeResults.length - 1];
            if (!result.imageDataURL) return alert('Chưa có ảnh kết quả!');

            // Build a premium A4-style report canvas
            const reportW = 900;
            const imgEl = new Image();
            imgEl.src = result.imageDataURL;
            imgEl.onload = () => {
                const imgScale = Math.min(1, (reportW - 40) / imgEl.width);
                const imgH = imgEl.height * imgScale;
                const reportH = 120 + imgH + 40;

                const canvas = document.createElement('canvas');
                canvas.width = reportW;
                canvas.height = reportH;
                const ctx = canvas.getContext('2d');

                // Background
                ctx.fillStyle = '#0d1b35';
                ctx.fillRect(0, 0, reportW, reportH);

                // Header gradient bar
                const hGrad = ctx.createLinearGradient(0, 0, reportW, 0);
                hGrad.addColorStop(0, '#1a3a6a');
                hGrad.addColorStop(1, '#0d1b35');
                ctx.fillStyle = hGrad;
                ctx.fillRect(0, 0, reportW, 110);

                // Accent line
                ctx.fillStyle = '#3b82f6';
                ctx.fillRect(0, 108, reportW, 3);

                // Header text
                ctx.fillStyle = '#e2e8f0';
                ctx.font = 'bold 26px "Segoe UI", Arial, sans-serif';
                ctx.textAlign = 'left';
                ctx.fillText('PHIẾU KẾT QUẢ CHẤM THI', 24, 42);

                ctx.fillStyle = '#94a3b8';
                ctx.font = '13px "Segoe UI", Arial, sans-serif';
                ctx.fillText(`SBD: ${result.sbd || '?'}  ·  Mã đề: ${result.made || '?'}  ·  Ngày: ${new Date().toLocaleDateString('vi-VN')}`, 24, 66);
                ctx.fillText(`Câu đúng: ${result.correct || result.mcqCorrect || '?'}/${result.total || result.mcqTotal || '?'}`, 24, 88);

                // Score badge on header right
                const sc2 = parseFloat(result.score);
                let sColor2 = sc2 >= 9 ? '#00b87a' : sc2 >= 7 ? '#2196f3' : sc2 >= 5 ? '#ff9800' : '#f44336';
                ctx.fillStyle = sColor2;
                ctx.font = 'bold 64px "Segoe UI", Arial, sans-serif';
                ctx.textAlign = 'right';
                ctx.fillText(result.score, reportW - 24, 90);
                ctx.fillStyle = '#94a3b8';
                ctx.font = '13px "Segoe UI", sans-serif';
                ctx.fillText('ĐIỂM', reportW - 24, 108);

                ctx.textAlign = 'left';

                // Graded image
                ctx.drawImage(imgEl, 20, 120, imgEl.width * imgScale, imgH);

                // Watermark
                ctx.save();
                ctx.globalAlpha = 0.1;
                ctx.fillStyle = '#fff';
                ctx.font = 'bold 16px "Segoe UI", sans-serif';
                ctx.textAlign = 'right';
                ctx.fillText('SANG MATH OMR · sangmath.com', reportW - 14, reportH - 10);
                ctx.restore();

                const a = document.createElement('a');
                a.href = canvas.toDataURL('image/png');
                a.download = `BaoCao_${result.sbd || 'hs'}_${result.score}d.png`;
                document.body.appendChild(a);
                a.click();
                document.body.removeChild(a);
            };
        }


        // ---- STATS ----
        function renderStats() {
            const total = gradeResults.length;
            document.getElementById('statTotal').textContent = total;
            if (total === 0) return;

            const scores = gradeResults.map(r => parseFloat(r.score));
            const avg = (scores.reduce((a, b) => a + b, 0) / total).toFixed(2);
            const pass = ((scores.filter(s => s >= 5).length / total) * 100).toFixed(0);
            document.getElementById('statAvg').textContent = avg;
            document.getElementById('statPass').textContent = pass + '%';

            // Distribution chart
            const buckets = Array(10).fill(0);
            scores.forEach(s => { const b = Math.min(9, Math.floor(s)); buckets[b]++; });
            const maxB = Math.max(...buckets, 1);
            const colors = ['#c0392b', '#c0392b', '#e67e22', '#e67e22', '#f1c40f', '#27ae60', '#27ae60', '#3498db', '#3498db', '#9b59b6'];
            const labels = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9-10'];
            const chartHtml = buckets.map((cnt, i) => `
    <div class="chart-row">
      <div class="chart-label">${labels[i]}</div>
      <div class="chart-bar-bg">
        <div class="chart-bar" style="width:${(cnt / maxB * 100).toFixed(0)}%;background:${colors[i]}">
          ${cnt > 0 ? cnt : ''}
        </div>
      </div>
    </div>
  `).join('');
            document.getElementById('scoreDistChart').innerHTML = chartHtml;

            // Results table
            const tbody = document.getElementById('resultsBody');
            tbody.innerHTML = gradeResults.map((r, i) => {
                const sc = parseFloat(r.score);
                const grade = sc >= 8 ? '<span class="grade-a">Giỏi</span>' :
                    sc >= 6.5 ? '<span class="grade-b">Khá</span>' :
                        sc >= 5 ? '<span class="grade-c">TB</span>' :
                            '<span class="grade-d">Yếu</span>';
                const student = studentList.find(s => s.sbd === r.sbd);
                const name = student ? student.name : '—';
                const ts = r.timestamp ? `<br><span style="font-size:10px;color:#64748b;">${typeof r.timestamp === 'number' ? new Date(r.timestamp).toLocaleTimeString('vi-VN') : r.timestamp}</span>` : '';
                return `<tr>
      <td>${i + 1}</td>
      <td><strong>${r.sbd}</strong>${ts}</td>
      <td>${name}</td>
      <td>${r.made}</td>
      <td><strong>${r.score}</strong></td>
      <td>${r.correct}/${r.total}</td>
      <td>${grade}</td>
      <td><button onclick="deleteResult(${i})" style="background:rgba(239,68,68,0.2);color:#f87171;border:1px solid rgba(239,68,68,0.3);border-radius:5px;padding:2px 8px;cursor:pointer;font-size:11px;" title="Xoá bài này">🗑️</button></td>
    </tr>`;
            }).join('');
        }

        function clearAllResults() {
            if (!confirm('Xoá toàn bộ kết quả chấm bài?')) return;
            gradeResults = [];
            localStorage.removeItem(STORAGE_KEY);
            renderStats();
            document.getElementById('resultsCard').style.display = 'none';
            document.getElementById('noDataMsg').style.display = 'flex';
        }

        // ---- EXPORT CSV ----
        function exportCSV() {
            if (gradeResults.length === 0) return alert('Chưa có kết quả để xuất.');
            const header = 'STT,SBD,Họ tên,Mã đề,Điểm,Đúng,Tổng câu,Thời gian\n';
            const rows = gradeResults.map((r, i) => {
                const student = studentList.find(s => s.sbd === r.sbd);
                const name = student ? student.name : '';
                return `${i + 1},${r.sbd},${name},${r.made},${r.score},${r.correct},${r.total},${r.timestamp}`;
            }).join('\n');
            const blob = new Blob(['\uFEFF' + header + rows], { type: 'text/csv' });
            const a = document.createElement('a');
            a.href = URL.createObjectURL(blob);
            a.download = `bang-diem-${new Date().toLocaleDateString('vi-VN').replace(/\//g, '-')}.csv`;
            a.click();
        }

        function exportExcel() {
            exportCSV(); // CSV opens in Excel by default
        }

        // ---- CLASS MANAGEMENT ----
        function importStudents() {
            const text = document.getElementById('manualStudents').value.trim();
            if (!text) return;
            studentList = text.split('\n').map(line => {
                const parts = line.trim().split(/[,;\t]/);
                return { sbd: (parts[0] || '').trim(), name: (parts[1] || '').trim(), cls: (parts[2] || '').trim() };
            }).filter(s => s.sbd);
            renderClassTable();
        }

        document.getElementById('csvInput').addEventListener('change', function () {
            const f = this.files[0]; if (!f) return;
            const reader = new FileReader();
            reader.onload = e => {
                document.getElementById('manualStudents').value = e.target.result;
                importStudents();
            };
            reader.readAsText(f, 'utf-8');
        });

        function clearStudents() {
            studentList = [];
            document.getElementById('manualStudents').value = '';
            renderClassTable();
        }

        function mergeResults() {
            renderStats();
            switchTab('tab-stats');
        }

        function renderClassTable() {
            const wrap = document.getElementById('classTableWrap');
            if (studentList.length === 0) {
                wrap.innerHTML = '<div class="text-muted" style="text-align:center;padding:40px">Chưa có danh sách.</div>';
                return;
            }
            const rows = studentList.map((s, i) => {
                const result = gradeResults.find(r => r.sbd === s.sbd);
                const scoreCell = result ? `<strong>${result.score}</strong>` : '<span style="color:var(--muted)">Chưa chấm</span>';
                return `<tr><td>${i + 1}</td><td>${s.sbd}</td><td>${s.name}</td><td>${s.cls}</td><td>${scoreCell}</td></tr>`;
            }).join('');
            wrap.innerHTML = `<table class="class-table">
    <thead><tr><th>#</th><th>SBD</th><th>Họ tên</th><th>Lớp</th><th>Điểm</th></tr></thead>
    <tbody>${rows}</tbody>
  </table>`;
        }

        // ══════════════════════════════════════════════════════════════
        // TYPST WASM LIVE ENGINE
        // Uses @myriaddreamin/typst.ts — compiles .typ source in-browser
        // ══════════════════════════════════════════════════════════════

        const TYPST_VERSION = '0.7.0-rc2';
        const CDN = 'https://cdn.jsdelivr.net/npm/@myriaddreamin';
        const COMPILER_WASM = `${CDN}/typst-ts-web-compiler@${TYPST_VERSION}/pkg/typst_ts_web_compiler_bg.wasm`;
        const RENDERER_WASM = `${CDN}/typst-ts-renderer@${TYPST_VERSION}/pkg/typst_ts_renderer_bg.wasm`;
        const TYPST_TS_ESM = `${CDN}/typst.ts@${TYPST_VERSION}/dist/esm/main.mjs`;
        const TYPST_INIT_ESM = `${CDN}/typst.ts@${TYPST_VERSION}/dist/esm/options.init.mjs`;
        const TYPST_MEMORY_ESM = `${CDN}/typst.ts@${TYPST_VERSION}/dist/esm/fs/memory.mjs`;

        let typstState = 'idle';   // idle | loading | ready | error
        let _compiler = null;
        let _renderer = null;
        let activePreviewMode = 'wasm';

        const getVal = (id, def) => {
            const el = document.getElementById(id);
            if (!el) return def;
            const v = parseInt(el.value);
            return isNaN(v) ? def : v;
        };

        // ── Mode switcher ─────────────────────────────────────────────
        function setPreviewMode(mode) {
            activePreviewMode = mode;
            const isCanvas = mode === 'canvas';
            document.getElementById('panelCanvas').style.display = isCanvas ? '' : 'none';
            document.getElementById('panelWasm').style.display = isCanvas ? 'none' : '';
            document.getElementById('tabCanvas').style.cssText =
                `flex:1;padding:8px;font-size:12px;font-weight:700;border:none;cursor:pointer;transition:.15s;
     background:${isCanvas ? 'rgba(51,153,255,.18)' : 'rgba(255,255,255,.04)'};
     color:${isCanvas ? '#5bc8ff' : 'var(--muted)'};border-right:1px solid var(--border)`;
            document.getElementById('tabWasm').style.cssText =
                `flex:1;padding:8px;font-size:12px;font-weight:700;border:none;cursor:pointer;transition:.15s;
     background:${!isCanvas ? 'rgba(167,139,250,.18)' : 'rgba(255,255,255,.04)'};
     color:${!isCanvas ? '#a78bfa' : 'var(--muted)'}`;
            const badge = document.getElementById('wasmStatusBadge');
            if (badge) {
                badge.textContent = isCanvas ? 'CANVAS' : (typstState === 'ready' ? 'WASM ⚡' : 'WASM');
                badge.style.background = isCanvas ? 'rgba(51,153,255,.12)' : 'rgba(167,139,250,.15)';
                badge.style.color = isCanvas ? '#5bc8ff' : '#a78bfa';
            }
            refreshPreview();
        }

        // ── WASM loader ───────────────────────────────────────────────
        function wasmUI(msg, color, spin) {
            const el = document.getElementById('wasmStatusMsg');
            if (el) { el.textContent = msg; el.style.color = color || 'var(--muted)'; }
            const sp = document.getElementById('wasmSpinner');
            if (sp) sp.style.display = spin ? 'block' : 'none';
        }

        async function activateTypstWasm() {
            setPreviewMode('wasm');

            if (typstState === 'ready') { renderTypstLive(); return; }
            if (typstState === 'loading') { wasmUI('⏳ Đang tải...', '#f8c471', true); return; }
            if (typstState === 'error') { wasmUI('❌ Lỗi – thử lại?', '#f87171', false); return; }

            typstState = 'loading';
            wasmUI('⏳ Đang tải Typst WASM (~6MB)…', '#f8c471', true);
            document.getElementById('tabWasm').textContent = '⏳ Đang tải…';

            try {
                // Tải ESM module wrappers từ CDN
                wasmUI('⏳ Tải ESM modules từ CDN…', '#f8c471', true);
                const COMPILER_MJS = `${CDN}/typst-ts-web-compiler@${TYPST_VERSION}/pkg/typst_ts_web_compiler.mjs`;
                const RENDERER_MJS = `${CDN}/typst-ts-renderer@${TYPST_VERSION}/pkg/typst_ts_renderer.mjs`;

                const [compilerWrapper, rendererWrapper] = await Promise.all([
                    import(/* @vite-ignore */ COMPILER_MJS),
                    import(/* @vite-ignore */ RENDERER_MJS),
                ]);

                const { createTypstCompiler, createTypstRenderer, FetchPackageRegistry, loadFonts } = 
                    await import(/* @vite-ignore */ TYPST_TS_ESM);
                const { withAccessModel, withPackageRegistry } = await import(/* @vite-ignore */ TYPST_INIT_ESM);
                const { MemoryAccessModel } = await import(/* @vite-ignore */ TYPST_MEMORY_ESM);

                const accessModel = new MemoryAccessModel();
                const packageRegistry = new FetchPackageRegistry(accessModel);

                wasmUI('⏳ Khởi tạo compiler (~20MB)…', '#f8c471', true);
                _compiler = createTypstCompiler();
                await _compiler.init({
                    getModule: () => COMPILER_WASM,
                    getWrapper: () => compilerWrapper,
                    beforeBuild: [
                        withAccessModel(accessModel),
                        withPackageRegistry(packageRegistry),
                        loadFonts([], { assets: ['text'] }),
                    ],
                });

                wasmUI('⏳ Khởi tạo renderer…', '#f8c471', true);
                _renderer = createTypstRenderer();
                await _renderer.init({
                    getModule: () => RENDERER_WASM,
                    getWrapper: () => rendererWrapper,
                });

                typstState = 'ready';
                wasmUI('✅ Typst WASM sẵn sàng', '#4ade80', false);
                document.getElementById('tabWasm').textContent = '⚡ Typst WASM';
                document.getElementById('wasmVersion').textContent = 'v' + TYPST_VERSION;
                renderTypstLive();

            } catch (e) {
                typstState = 'error';
                wasmUI('❌ ' + e.message, '#f87171', false);
                document.getElementById('tabWasm').textContent = '⚠️ Typst WASM';
                const errEl = document.getElementById('wasmErrorDetail');
                if (errEl) { errEl.style.display = ''; errEl.textContent = String(e); }
                console.error('[Typst WASM]', e);
            }
        }

        // ── Renderer ──────────────────────────────────────────────────
        let typstRenderTimer = null;

        async function renderTypstLive() {
            if (typstState !== 'ready' || !_compiler || !_renderer) return;

            // Debounce 300ms to avoid recompiling on every keystroke
            clearTimeout(typstRenderTimer);
            typstRenderTimer = setTimeout(async () => {
                const container = document.getElementById('svgPreviewContainer');
                if (!container) return;

                container.innerHTML = `<div style="text-align:center;padding:40px;color:#aaa;font-size:12px">
      <div style="width:20px;height:20px;border:2px solid rgba(255,255,255,.15);border-top-color:#a78bfa;
        border-radius:50%;animation:spin .6s linear infinite;margin:0 auto 10px"></div>
      ⏳ Đang biên dịch Typst…
    </div>`;

                try {
                    const src = buildWasmPreviewTypst();
                    
                    // Thêm source vào bộ nhớ ảo của compiler
                    _compiler.addSource('/main.typ', src);

                    // Compile sang module
                    const compileResult = await _compiler.compile({
                        mainFilePath: '/main.typ',
                        format: 0, // svg
                    });

                    if (!compileResult || !compileResult.result) {
                        console.error('Compile Diagnostics:', compileResult?.diagnostics);
                        let msg = 'Biên dịch thất bại.';
                        if (compileResult?.diagnostics?.length) {
                            msg = compileResult.diagnostics
                                .map(d => `[${d.severity ?? 'error'}] ${d.message}` + (d.span ? ` (line ${(d.span.start?.line ?? 0) + 1})` : ''))
                                .join('\n');
                        }
                        throw new Error(msg);
                    }

                    // Render SVG từ module
                    const session = await _renderer.createModule(compileResult.result);
                    const svgString = await _renderer.renderSvg({ renderSession: session });

                    container.innerHTML = svgString;
                    // Make SVG fill width and be responsive
                    const svgEl = container.querySelector('svg');
                    if (svgEl) {
                        svgEl.style.width = '100%';
                        svgEl.style.height = 'auto';
                        svgEl.style.display = 'block';
                        svgEl.style.borderRadius = '6px';
                        svgEl.style.boxShadow = '0 4px 20px rgba(0,0,0,.3)';
                    }
                    document.getElementById('wasmErrorDetail').style.display = 'none';
                } catch (e) {
                    container.innerHTML = `<div style="color:#f87171;padding:14px;font-size:12px;background:rgba(248,113,113,.08);border-radius:8px">
        ❌ Lỗi compile: ${e.message}
      </div>`;
                    const errEl = document.getElementById('wasmErrorDetail');
                    if (errEl) { errEl.style.display = ''; errEl.textContent = String(e); }
                    console.error('[Typst compile]', e);
                }
            }, 300);
        }

        // ── Typst source generator (preview-safe: no external packages) ─
        function getWasmTypstSource(type, school, subtitle, hasEssay = true) {
            const presets = {
                '12-4-6ngang': { mcq: 12, tf: 4, tln: 6, paper: 'a5' },
                'thptqg-toan': { mcq: 12, tf: 4, tln: 6, paper: 'a4' },
                'tn-40': { mcq: 40, tf: 0, tln: 0, paper: 'a4' },
                'tn-60': { mcq: 60, tf: 0, tln: 0, paper: 'a4' },
                'ds-12': { mcq: 0, tf: 12, tln: 0, paper: 'a4' },
                'ds-20-ngang': {
    "numQ": 20,
    "numSbd": 6,
    "numMade": 4,
    "scoring": {
        "mcq": {
            "points": 0.25
        },
        "tf": {
            "points": [
                0.1,
                0.25,
                0.5,
                1
            ]
        },
        "tln": {
            "points": 0.5
        }
    },
    "warp": {
        "width": 1500,
        "height": 1060
    },
    "bounds": {
        "sbd": [
            [
                [
                    117,
                    186
                ],
                [
                    148,
                    186
                ],
                [
                    179,
                    186
                ],
                [
                    210,
                    186
                ],
                [
                    241,
                    186
                ],
                [
                    273,
                    186
                ]
            ],
            [
                [
                    117,
                    209
                ],
                [
                    148,
                    209
                ],
                [
                    179,
                    209
                ],
                [
                    210,
                    209
                ],
                [
                    241,
                    209
                ],
                [
                    273,
                    209
                ]
            ],
            [
                [
                    117,
                    232
                ],
                [
                    148,
                    232
                ],
                [
                    179,
                    232
                ],
                [
                    210,
                    232
                ],
                [
                    241,
                    232
                ],
                [
                    273,
                    232
                ]
            ],
            [
                [
                    117,
                    255
                ],
                [
                    148,
                    255
                ],
                [
                    179,
                    255
                ],
                [
                    210,
                    255
                ],
                [
                    241,
                    255
                ],
                [
                    273,
                    255
                ]
            ],
            [
                [
                    117,
                    279
                ],
                [
                    148,
                    279
                ],
                [
                    179,
                    279
                ],
                [
                    210,
                    279
                ],
                [
                    241,
                    279
                ],
                [
                    273,
                    279
                ]
            ],
            [
                [
                    117,
                    302
                ],
                [
                    148,
                    302
                ],
                [
                    179,
                    302
                ],
                [
                    210,
                    302
                ],
                [
                    241,
                    302
                ],
                [
                    273,
                    302
                ]
            ],
            [
                [
                    117,
                    325
                ],
                [
                    148,
                    325
                ],
                [
                    179,
                    325
                ],
                [
                    210,
                    325
                ],
                [
                    241,
                    325
                ],
                [
                    273,
                    325
                ]
            ],
            [
                [
                    117,
                    349
                ],
                [
                    148,
                    349
                ],
                [
                    179,
                    349
                ],
                [
                    210,
                    349
                ],
                [
                    241,
                    349
                ],
                [
                    273,
                    349
                ]
            ],
            [
                [
                    117,
                    372
                ],
                [
                    148,
                    372
                ],
                [
                    179,
                    372
                ],
                [
                    210,
                    372
                ],
                [
                    241,
                    372
                ],
                [
                    273,
                    372
                ]
            ],
            [
                [
                    117,
                    395
                ],
                [
                    148,
                    395
                ],
                [
                    179,
                    395
                ],
                [
                    210,
                    395
                ],
                [
                    241,
                    395
                ],
                [
                    273,
                    395
                ]
            ]
        ],
        "made": [
            [
                [
                    305,
                    186
                ],
                [
                    336,
                    186
                ],
                [
                    367,
                    186
                ],
                [
                    398,
                    186
                ]
            ],
            [
                [
                    305,
                    209
                ],
                [
                    336,
                    209
                ],
                [
                    367,
                    209
                ],
                [
                    398,
                    209
                ]
            ],
            [
                [
                    305,
                    232
                ],
                [
                    336,
                    232
                ],
                [
                    367,
                    232
                ],
                [
                    398,
                    232
                ]
            ],
            [
                [
                    305,
                    255
                ],
                [
                    336,
                    255
                ],
                [
                    367,
                    255
                ],
                [
                    398,
                    255
                ]
            ],
            [
                [
                    305,
                    279
                ],
                [
                    336,
                    279
                ],
                [
                    367,
                    279
                ],
                [
                    398,
                    279
                ]
            ],
            [
                [
                    305,
                    302
                ],
                [
                    336,
                    302
                ],
                [
                    367,
                    302
                ],
                [
                    398,
                    302
                ]
            ],
            [
                [
                    305,
                    325
                ],
                [
                    336,
                    325
                ],
                [
                    367,
                    325
                ],
                [
                    398,
                    325
                ]
            ],
            [
                [
                    305,
                    349
                ],
                [
                    336,
                    349
                ],
                [
                    367,
                    349
                ],
                [
                    398,
                    349
                ]
            ],
            [
                [
                    305,
                    372
                ],
                [
                    336,
                    372
                ],
                [
                    367,
                    372
                ],
                [
                    398,
                    372
                ]
            ],
            [
                [
                    305,
                    395
                ],
                [
                    336,
                    395
                ],
                [
                    367,
                    395
                ],
                [
                    398,
                    395
                ]
            ]
        ],
        "tf": [
            [
                [
                    293,
                    501
                ],
                [
                    333,
                    501
                ],
                [
                    293,
                    525
                ],
                [
                    333,
                    525
                ],
                [
                    293,
                    550
                ],
                [
                    333,
                    550
                ],
                [
                    293,
                    574
                ],
                [
                    333,
                    574
                ]
            ],
            [
                [
                    521,
                    501
                ],
                [
                    560,
                    501
                ],
                [
                    521,
                    525
                ],
                [
                    560,
                    525
                ],
                [
                    521,
                    550
                ],
                [
                    560,
                    550
                ],
                [
                    521,
                    574
                ],
                [
                    560,
                    574
                ]
            ],
            [
                [
                    749,
                    501
                ],
                [
                    788,
                    501
                ],
                [
                    749,
                    525
                ],
                [
                    788,
                    525
                ],
                [
                    749,
                    550
                ],
                [
                    788,
                    550
                ],
                [
                    749,
                    574
                ],
                [
                    788,
                    574
                ]
            ],
            [
                [
                    976,
                    501
                ],
                [
                    1016,
                    501
                ],
                [
                    976,
                    525
                ],
                [
                    1016,
                    525
                ],
                [
                    976,
                    550
                ],
                [
                    1016,
                    550
                ],
                [
                    976,
                    574
                ],
                [
                    1016,
                    574
                ]
            ],
            [
                [
                    1204,
                    501
                ],
                [
                    1243,
                    501
                ],
                [
                    1204,
                    525
                ],
                [
                    1243,
                    525
                ],
                [
                    1204,
                    550
                ],
                [
                    1243,
                    550
                ],
                [
                    1204,
                    574
                ],
                [
                    1243,
                    574
                ]
            ],
            [
                [
                    293,
                    643
                ],
                [
                    333,
                    643
                ],
                [
                    293,
                    667
                ],
                [
                    333,
                    667
                ],
                [
                    293,
                    691
                ],
                [
                    333,
                    691
                ],
                [
                    293,
                    715
                ],
                [
                    333,
                    715
                ]
            ],
            [
                [
                    521,
                    643
                ],
                [
                    560,
                    643
                ],
                [
                    521,
                    667
                ],
                [
                    560,
                    667
                ],
                [
                    521,
                    691
                ],
                [
                    560,
                    691
                ],
                [
                    521,
                    715
                ],
                [
                    560,
                    715
                ]
            ],
            [
                [
                    749,
                    643
                ],
                [
                    788,
                    643
                ],
                [
                    749,
                    667
                ],
                [
                    788,
                    667
                ],
                [
                    749,
                    691
                ],
                [
                    788,
                    691
                ],
                [
                    749,
                    715
                ],
                [
                    788,
                    715
                ]
            ],
            [
                [
                    976,
                    643
                ],
                [
                    1016,
                    643
                ],
                [
                    976,
                    667
                ],
                [
                    1016,
                    667
                ],
                [
                    976,
                    691
                ],
                [
                    1016,
                    691
                ],
                [
                    976,
                    715
                ],
                [
                    1016,
                    715
                ]
            ],
            [
                [
                    1204,
                    643
                ],
                [
                    1243,
                    643
                ],
                [
                    1204,
                    667
                ],
                [
                    1243,
                    667
                ],
                [
                    1204,
                    691
                ],
                [
                    1243,
                    691
                ],
                [
                    1204,
                    715
                ],
                [
                    1243,
                    715
                ]
            ],
            [
                [
                    293,
                    785
                ],
                [
                    333,
                    785
                ],
                [
                    293,
                    809
                ],
                [
                    333,
                    809
                ],
                [
                    293,
                    833
                ],
                [
                    333,
                    833
                ],
                [
                    293,
                    857
                ],
                [
                    333,
                    857
                ]
            ],
            [
                [
                    521,
                    785
                ],
                [
                    560,
                    785
                ],
                [
                    521,
                    809
                ],
                [
                    560,
                    809
                ],
                [
                    521,
                    833
                ],
                [
                    560,
                    833
                ],
                [
                    521,
                    857
                ],
                [
                    560,
                    857
                ]
            ],
            [
                [
                    749,
                    785
                ],
                [
                    788,
                    785
                ],
                [
                    749,
                    809
                ],
                [
                    788,
                    809
                ],
                [
                    749,
                    833
                ],
                [
                    788,
                    833
                ],
                [
                    749,
                    857
                ],
                [
                    788,
                    857
                ]
            ],
            [
                [
                    976,
                    785
                ],
                [
                    1016,
                    785
                ],
                [
                    976,
                    809
                ],
                [
                    1016,
                    809
                ],
                [
                    976,
                    833
                ],
                [
                    1016,
                    833
                ],
                [
                    976,
                    857
                ],
                [
                    1016,
                    857
                ]
            ],
            [
                [
                    1204,
                    785
                ],
                [
                    1243,
                    785
                ],
                [
                    1204,
                    809
                ],
                [
                    1243,
                    809
                ],
                [
                    1204,
                    833
                ],
                [
                    1243,
                    833
                ],
                [
                    1204,
                    857
                ],
                [
                    1243,
                    857
                ]
            ],
            [
                [
                    293,
                    926
                ],
                [
                    333,
                    926
                ],
                [
                    293,
                    951
                ],
                [
                    333,
                    951
                ],
                [
                    293,
                    975
                ],
                [
                    333,
                    975
                ],
                [
                    293,
                    999
                ],
                [
                    333,
                    999
                ]
            ],
            [
                [
                    521,
                    926
                ],
                [
                    560,
                    926
                ],
                [
                    521,
                    951
                ],
                [
                    560,
                    951
                ],
                [
                    521,
                    975
                ],
                [
                    560,
                    975
                ],
                [
                    521,
                    999
                ],
                [
                    560,
                    999
                ]
            ],
            [
                [
                    749,
                    926
                ],
                [
                    788,
                    926
                ],
                [
                    749,
                    951
                ],
                [
                    788,
                    951
                ],
                [
                    749,
                    975
                ],
                [
                    788,
                    975
                ],
                [
                    749,
                    999
                ],
                [
                    788,
                    999
                ]
            ],
            [
                [
                    976,
                    926
                ],
                [
                    1016,
                    926
                ],
                [
                    976,
                    951
                ],
                [
                    1016,
                    951
                ],
                [
                    976,
                    975
                ],
                [
                    1016,
                    975
                ],
                [
                    976,
                    999
                ],
                [
                    1016,
                    999
                ]
            ],
            [
                [
                    1204,
                    926
                ],
                [
                    1243,
                    926
                ],
                [
                    1204,
                    951
                ],
                [
                    1243,
                    951
                ],
                [
                    1204,
                    975
                ],
                [
                    1243,
                    975
                ],
                [
                    1204,
                    999
                ],
                [
                    1243,
                    999
                ]
            ]
        ]
    }
},
'ds20-tln10-ngang': {
    "numQ": 20,
    "numSbd": 6,
    "numMade": 4,
    "scoring": {
        "mcq": {
            "points": 0.25
        },
        "tf": {
            "points": [
                0.1,
                0.25,
                0.5,
                1
            ]
        },
        "tln": {
            "points": 0.5
        }
    },
    "warp": {
        "width": 1500,
        "height": 1060
    },
    "bounds": {
        "sbd": [
            [
                [
                    117,
                    186
                ],
                [
                    148,
                    186
                ],
                [
                    179,
                    186
                ],
                [
                    210,
                    186
                ],
                [
                    241,
                    186
                ],
                [
                    273,
                    186
                ]
            ],
            [
                [
                    117,
                    209
                ],
                [
                    148,
                    209
                ],
                [
                    179,
                    209
                ],
                [
                    210,
                    209
                ],
                [
                    241,
                    209
                ],
                [
                    273,
                    209
                ]
            ],
            [
                [
                    117,
                    232
                ],
                [
                    148,
                    232
                ],
                [
                    179,
                    232
                ],
                [
                    210,
                    232
                ],
                [
                    241,
                    232
                ],
                [
                    273,
                    232
                ]
            ],
            [
                [
                    117,
                    255
                ],
                [
                    148,
                    255
                ],
                [
                    179,
                    255
                ],
                [
                    210,
                    255
                ],
                [
                    241,
                    255
                ],
                [
                    273,
                    255
                ]
            ],
            [
                [
                    117,
                    279
                ],
                [
                    148,
                    279
                ],
                [
                    179,
                    279
                ],
                [
                    210,
                    279
                ],
                [
                    241,
                    279
                ],
                [
                    273,
                    279
                ]
            ],
            [
                [
                    117,
                    302
                ],
                [
                    148,
                    302
                ],
                [
                    179,
                    302
                ],
                [
                    210,
                    302
                ],
                [
                    241,
                    302
                ],
                [
                    273,
                    302
                ]
            ],
            [
                [
                    117,
                    325
                ],
                [
                    148,
                    325
                ],
                [
                    179,
                    325
                ],
                [
                    210,
                    325
                ],
                [
                    241,
                    325
                ],
                [
                    273,
                    325
                ]
            ],
            [
                [
                    117,
                    349
                ],
                [
                    148,
                    349
                ],
                [
                    179,
                    349
                ],
                [
                    210,
                    349
                ],
                [
                    241,
                    349
                ],
                [
                    273,
                    349
                ]
            ],
            [
                [
                    117,
                    372
                ],
                [
                    148,
                    372
                ],
                [
                    179,
                    372
                ],
                [
                    210,
                    372
                ],
                [
                    241,
                    372
                ],
                [
                    273,
                    372
                ]
            ],
            [
                [
                    117,
                    395
                ],
                [
                    148,
                    395
                ],
                [
                    179,
                    395
                ],
                [
                    210,
                    395
                ],
                [
                    241,
                    395
                ],
                [
                    273,
                    395
                ]
            ]
        ],
        "made": [
            [
                [
                    305,
                    186
                ],
                [
                    336,
                    186
                ],
                [
                    367,
                    186
                ],
                [
                    398,
                    186
                ]
            ],
            [
                [
                    305,
                    209
                ],
                [
                    336,
                    209
                ],
                [
                    367,
                    209
                ],
                [
                    398,
                    209
                ]
            ],
            [
                [
                    305,
                    232
                ],
                [
                    336,
                    232
                ],
                [
                    367,
                    232
                ],
                [
                    398,
                    232
                ]
            ],
            [
                [
                    305,
                    255
                ],
                [
                    336,
                    255
                ],
                [
                    367,
                    255
                ],
                [
                    398,
                    255
                ]
            ],
            [
                [
                    305,
                    279
                ],
                [
                    336,
                    279
                ],
                [
                    367,
                    279
                ],
                [
                    398,
                    279
                ]
            ],
            [
                [
                    305,
                    302
                ],
                [
                    336,
                    302
                ],
                [
                    367,
                    302
                ],
                [
                    398,
                    302
                ]
            ],
            [
                [
                    305,
                    325
                ],
                [
                    336,
                    325
                ],
                [
                    367,
                    325
                ],
                [
                    398,
                    325
                ]
            ],
            [
                [
                    305,
                    349
                ],
                [
                    336,
                    349
                ],
                [
                    367,
                    349
                ],
                [
                    398,
                    349
                ]
            ],
            [
                [
                    305,
                    372
                ],
                [
                    336,
                    372
                ],
                [
                    367,
                    372
                ],
                [
                    398,
                    372
                ]
            ],
            [
                [
                    305,
                    395
                ],
                [
                    336,
                    395
                ],
                [
                    367,
                    395
                ],
                [
                    398,
                    395
                ]
            ]
        ],
        "tf": [
            [
                [
                    293,
                    501
                ],
                [
                    333,
                    501
                ],
                [
                    293,
                    525
                ],
                [
                    333,
                    525
                ],
                [
                    293,
                    550
                ],
                [
                    333,
                    550
                ],
                [
                    293,
                    574
                ],
                [
                    333,
                    574
                ]
            ],
            [
                [
                    521,
                    501
                ],
                [
                    560,
                    501
                ],
                [
                    521,
                    525
                ],
                [
                    560,
                    525
                ],
                [
                    521,
                    550
                ],
                [
                    560,
                    550
                ],
                [
                    521,
                    574
                ],
                [
                    560,
                    574
                ]
            ],
            [
                [
                    749,
                    501
                ],
                [
                    788,
                    501
                ],
                [
                    749,
                    525
                ],
                [
                    788,
                    525
                ],
                [
                    749,
                    550
                ],
                [
                    788,
                    550
                ],
                [
                    749,
                    574
                ],
                [
                    788,
                    574
                ]
            ],
            [
                [
                    976,
                    501
                ],
                [
                    1016,
                    501
                ],
                [
                    976,
                    525
                ],
                [
                    1016,
                    525
                ],
                [
                    976,
                    550
                ],
                [
                    1016,
                    550
                ],
                [
                    976,
                    574
                ],
                [
                    1016,
                    574
                ]
            ],
            [
                [
                    1204,
                    501
                ],
                [
                    1243,
                    501
                ],
                [
                    1204,
                    525
                ],
                [
                    1243,
                    525
                ],
                [
                    1204,
                    550
                ],
                [
                    1243,
                    550
                ],
                [
                    1204,
                    574
                ],
                [
                    1243,
                    574
                ]
            ],
            [
                [
                    293,
                    643
                ],
                [
                    333,
                    643
                ],
                [
                    293,
                    667
                ],
                [
                    333,
                    667
                ],
                [
                    293,
                    691
                ],
                [
                    333,
                    691
                ],
                [
                    293,
                    715
                ],
                [
                    333,
                    715
                ]
            ],
            [
                [
                    521,
                    643
                ],
                [
                    560,
                    643
                ],
                [
                    521,
                    667
                ],
                [
                    560,
                    667
                ],
                [
                    521,
                    691
                ],
                [
                    560,
                    691
                ],
                [
                    521,
                    715
                ],
                [
                    560,
                    715
                ]
            ],
            [
                [
                    749,
                    643
                ],
                [
                    788,
                    643
                ],
                [
                    749,
                    667
                ],
                [
                    788,
                    667
                ],
                [
                    749,
                    691
                ],
                [
                    788,
                    691
                ],
                [
                    749,
                    715
                ],
                [
                    788,
                    715
                ]
            ],
            [
                [
                    976,
                    643
                ],
                [
                    1016,
                    643
                ],
                [
                    976,
                    667
                ],
                [
                    1016,
                    667
                ],
                [
                    976,
                    691
                ],
                [
                    1016,
                    691
                ],
                [
                    976,
                    715
                ],
                [
                    1016,
                    715
                ]
            ],
            [
                [
                    1204,
                    643
                ],
                [
                    1243,
                    643
                ],
                [
                    1204,
                    667
                ],
                [
                    1243,
                    667
                ],
                [
                    1204,
                    691
                ],
                [
                    1243,
                    691
                ],
                [
                    1204,
                    715
                ],
                [
                    1243,
                    715
                ]
            ],
            [
                [
                    293,
                    785
                ],
                [
                    333,
                    785
                ],
                [
                    293,
                    809
                ],
                [
                    333,
                    809
                ],
                [
                    293,
                    833
                ],
                [
                    333,
                    833
                ],
                [
                    293,
                    857
                ],
                [
                    333,
                    857
                ]
            ],
            [
                [
                    521,
                    785
                ],
                [
                    560,
                    785
                ],
                [
                    521,
                    809
                ],
                [
                    560,
                    809
                ],
                [
                    521,
                    833
                ],
                [
                    560,
                    833
                ],
                [
                    521,
                    857
                ],
                [
                    560,
                    857
                ]
            ],
            [
                [
                    749,
                    785
                ],
                [
                    788,
                    785
                ],
                [
                    749,
                    809
                ],
                [
                    788,
                    809
                ],
                [
                    749,
                    833
                ],
                [
                    788,
                    833
                ],
                [
                    749,
                    857
                ],
                [
                    788,
                    857
                ]
            ],
            [
                [
                    976,
                    785
                ],
                [
                    1016,
                    785
                ],
                [
                    976,
                    809
                ],
                [
                    1016,
                    809
                ],
                [
                    976,
                    833
                ],
                [
                    1016,
                    833
                ],
                [
                    976,
                    857
                ],
                [
                    1016,
                    857
                ]
            ],
            [
                [
                    1204,
                    785
                ],
                [
                    1243,
                    785
                ],
                [
                    1204,
                    809
                ],
                [
                    1243,
                    809
                ],
                [
                    1204,
                    833
                ],
                [
                    1243,
                    833
                ],
                [
                    1204,
                    857
                ],
                [
                    1243,
                    857
                ]
            ],
            [
                [
                    293,
                    926
                ],
                [
                    333,
                    926
                ],
                [
                    293,
                    951
                ],
                [
                    333,
                    951
                ],
                [
                    293,
                    975
                ],
                [
                    333,
                    975
                ],
                [
                    293,
                    999
                ],
                [
                    333,
                    999
                ]
            ],
            [
                [
                    521,
                    926
                ],
                [
                    560,
                    926
                ],
                [
                    521,
                    951
                ],
                [
                    560,
                    951
                ],
                [
                    521,
                    975
                ],
                [
                    560,
                    975
                ],
                [
                    521,
                    999
                ],
                [
                    560,
                    999
                ]
            ],
            [
                [
                    749,
                    926
                ],
                [
                    788,
                    926
                ],
                [
                    749,
                    951
                ],
                [
                    788,
                    951
                ],
                [
                    749,
                    975
                ],
                [
                    788,
                    975
                ],
                [
                    749,
                    999
                ],
                [
                    788,
                    999
                ]
            ],
            [
                [
                    976,
                    926
                ],
                [
                    1016,
                    926
                ],
                [
                    976,
                    951
                ],
                [
                    1016,
                    951
                ],
                [
                    976,
                    975
                ],
                [
                    1016,
                    975
                ],
                [
                    976,
                    999
                ],
                [
                    1016,
                    999
                ]
            ],
            [
                [
                    1204,
                    926
                ],
                [
                    1243,
                    926
                ],
                [
                    1204,
                    951
                ],
                [
                    1243,
                    951
                ],
                [
                    1204,
                    975
                ],
                [
                    1243,
                    975
                ],
                [
                    1204,
                    999
                ],
                [
                    1243,
                    999
                ]
            ]
        ]
    }
},
    'tln-10': { mcq: 0, tf: 0, tln: 10, paper: 'a4' },
            };
            let cfg = presets[type];
            if (!cfg) {
                // Custom template from Smart Builder
                cfg = {
                    mcq: getVal('bldMcq', 12),
                    tf: getVal('bldTf', 4),
                    tln: getVal('bldTln', 6),
                    paper: document.querySelector('input[name="bldPaper"]:checked')?.value || 'a4',
                };
            }
            return genWasmTypst({ ...cfg, school, subtitle, hasEssay });
        }

        function buildWasmPreviewTypst() {
            const presets = {
                '12-4-6ngang': { mcq: 12, tf: 4, tln: 6, paper: 'a5' },
                'thptqg-toan': { mcq: 12, tf: 4, tln: 6, paper: 'a4' },
                'tn-40': { mcq: 40, tf: 0, tln: 0, paper: 'a4' },
                'tn-60': { mcq: 60, tf: 0, tln: 0, paper: 'a4' },
                'ds-12': { mcq: 0, tf: 12, tln: 0, paper: 'a4' },
                'ds-20-ngang': {
    "numQ": 20,
    "numSbd": 6,
    "numMade": 4,
    "scoring": {
        "mcq": {
            "points": 0.25
        },
        "tf": {
            "points": [
                0.1,
                0.25,
                0.5,
                1
            ]
        },
        "tln": {
            "points": 0.5
        }
    },
    "warp": {
        "width": 1500,
        "height": 1060
    },
    "bounds": {
        "sbd": [
            [
                [
                    117,
                    186
                ],
                [
                    148,
                    186
                ],
                [
                    179,
                    186
                ],
                [
                    210,
                    186
                ],
                [
                    241,
                    186
                ],
                [
                    273,
                    186
                ]
            ],
            [
                [
                    117,
                    209
                ],
                [
                    148,
                    209
                ],
                [
                    179,
                    209
                ],
                [
                    210,
                    209
                ],
                [
                    241,
                    209
                ],
                [
                    273,
                    209
                ]
            ],
            [
                [
                    117,
                    232
                ],
                [
                    148,
                    232
                ],
                [
                    179,
                    232
                ],
                [
                    210,
                    232
                ],
                [
                    241,
                    232
                ],
                [
                    273,
                    232
                ]
            ],
            [
                [
                    117,
                    255
                ],
                [
                    148,
                    255
                ],
                [
                    179,
                    255
                ],
                [
                    210,
                    255
                ],
                [
                    241,
                    255
                ],
                [
                    273,
                    255
                ]
            ],
            [
                [
                    117,
                    279
                ],
                [
                    148,
                    279
                ],
                [
                    179,
                    279
                ],
                [
                    210,
                    279
                ],
                [
                    241,
                    279
                ],
                [
                    273,
                    279
                ]
            ],
            [
                [
                    117,
                    302
                ],
                [
                    148,
                    302
                ],
                [
                    179,
                    302
                ],
                [
                    210,
                    302
                ],
                [
                    241,
                    302
                ],
                [
                    273,
                    302
                ]
            ],
            [
                [
                    117,
                    325
                ],
                [
                    148,
                    325
                ],
                [
                    179,
                    325
                ],
                [
                    210,
                    325
                ],
                [
                    241,
                    325
                ],
                [
                    273,
                    325
                ]
            ],
            [
                [
                    117,
                    349
                ],
                [
                    148,
                    349
                ],
                [
                    179,
                    349
                ],
                [
                    210,
                    349
                ],
                [
                    241,
                    349
                ],
                [
                    273,
                    349
                ]
            ],
            [
                [
                    117,
                    372
                ],
                [
                    148,
                    372
                ],
                [
                    179,
                    372
                ],
                [
                    210,
                    372
                ],
                [
                    241,
                    372
                ],
                [
                    273,
                    372
                ]
            ],
            [
                [
                    117,
                    395
                ],
                [
                    148,
                    395
                ],
                [
                    179,
                    395
                ],
                [
                    210,
                    395
                ],
                [
                    241,
                    395
                ],
                [
                    273,
                    395
                ]
            ]
        ],
        "made": [
            [
                [
                    305,
                    186
                ],
                [
                    336,
                    186
                ],
                [
                    367,
                    186
                ],
                [
                    398,
                    186
                ]
            ],
            [
                [
                    305,
                    209
                ],
                [
                    336,
                    209
                ],
                [
                    367,
                    209
                ],
                [
                    398,
                    209
                ]
            ],
            [
                [
                    305,
                    232
                ],
                [
                    336,
                    232
                ],
                [
                    367,
                    232
                ],
                [
                    398,
                    232
                ]
            ],
            [
                [
                    305,
                    255
                ],
                [
                    336,
                    255
                ],
                [
                    367,
                    255
                ],
                [
                    398,
                    255
                ]
            ],
            [
                [
                    305,
                    279
                ],
                [
                    336,
                    279
                ],
                [
                    367,
                    279
                ],
                [
                    398,
                    279
                ]
            ],
            [
                [
                    305,
                    302
                ],
                [
                    336,
                    302
                ],
                [
                    367,
                    302
                ],
                [
                    398,
                    302
                ]
            ],
            [
                [
                    305,
                    325
                ],
                [
                    336,
                    325
                ],
                [
                    367,
                    325
                ],
                [
                    398,
                    325
                ]
            ],
            [
                [
                    305,
                    349
                ],
                [
                    336,
                    349
                ],
                [
                    367,
                    349
                ],
                [
                    398,
                    349
                ]
            ],
            [
                [
                    305,
                    372
                ],
                [
                    336,
                    372
                ],
                [
                    367,
                    372
                ],
                [
                    398,
                    372
                ]
            ],
            [
                [
                    305,
                    395
                ],
                [
                    336,
                    395
                ],
                [
                    367,
                    395
                ],
                [
                    398,
                    395
                ]
            ]
        ],
        "tf": [
            [
                [
                    293,
                    501
                ],
                [
                    333,
                    501
                ],
                [
                    293,
                    525
                ],
                [
                    333,
                    525
                ],
                [
                    293,
                    550
                ],
                [
                    333,
                    550
                ],
                [
                    293,
                    574
                ],
                [
                    333,
                    574
                ]
            ],
            [
                [
                    521,
                    501
                ],
                [
                    560,
                    501
                ],
                [
                    521,
                    525
                ],
                [
                    560,
                    525
                ],
                [
                    521,
                    550
                ],
                [
                    560,
                    550
                ],
                [
                    521,
                    574
                ],
                [
                    560,
                    574
                ]
            ],
            [
                [
                    749,
                    501
                ],
                [
                    788,
                    501
                ],
                [
                    749,
                    525
                ],
                [
                    788,
                    525
                ],
                [
                    749,
                    550
                ],
                [
                    788,
                    550
                ],
                [
                    749,
                    574
                ],
                [
                    788,
                    574
                ]
            ],
            [
                [
                    976,
                    501
                ],
                [
                    1016,
                    501
                ],
                [
                    976,
                    525
                ],
                [
                    1016,
                    525
                ],
                [
                    976,
                    550
                ],
                [
                    1016,
                    550
                ],
                [
                    976,
                    574
                ],
                [
                    1016,
                    574
                ]
            ],
            [
                [
                    1204,
                    501
                ],
                [
                    1243,
                    501
                ],
                [
                    1204,
                    525
                ],
                [
                    1243,
                    525
                ],
                [
                    1204,
                    550
                ],
                [
                    1243,
                    550
                ],
                [
                    1204,
                    574
                ],
                [
                    1243,
                    574
                ]
            ],
            [
                [
                    293,
                    643
                ],
                [
                    333,
                    643
                ],
                [
                    293,
                    667
                ],
                [
                    333,
                    667
                ],
                [
                    293,
                    691
                ],
                [
                    333,
                    691
                ],
                [
                    293,
                    715
                ],
                [
                    333,
                    715
                ]
            ],
            [
                [
                    521,
                    643
                ],
                [
                    560,
                    643
                ],
                [
                    521,
                    667
                ],
                [
                    560,
                    667
                ],
                [
                    521,
                    691
                ],
                [
                    560,
                    691
                ],
                [
                    521,
                    715
                ],
                [
                    560,
                    715
                ]
            ],
            [
                [
                    749,
                    643
                ],
                [
                    788,
                    643
                ],
                [
                    749,
                    667
                ],
                [
                    788,
                    667
                ],
                [
                    749,
                    691
                ],
                [
                    788,
                    691
                ],
                [
                    749,
                    715
                ],
                [
                    788,
                    715
                ]
            ],
            [
                [
                    976,
                    643
                ],
                [
                    1016,
                    643
                ],
                [
                    976,
                    667
                ],
                [
                    1016,
                    667
                ],
                [
                    976,
                    691
                ],
                [
                    1016,
                    691
                ],
                [
                    976,
                    715
                ],
                [
                    1016,
                    715
                ]
            ],
            [
                [
                    1204,
                    643
                ],
                [
                    1243,
                    643
                ],
                [
                    1204,
                    667
                ],
                [
                    1243,
                    667
                ],
                [
                    1204,
                    691
                ],
                [
                    1243,
                    691
                ],
                [
                    1204,
                    715
                ],
                [
                    1243,
                    715
                ]
            ],
            [
                [
                    293,
                    785
                ],
                [
                    333,
                    785
                ],
                [
                    293,
                    809
                ],
                [
                    333,
                    809
                ],
                [
                    293,
                    833
                ],
                [
                    333,
                    833
                ],
                [
                    293,
                    857
                ],
                [
                    333,
                    857
                ]
            ],
            [
                [
                    521,
                    785
                ],
                [
                    560,
                    785
                ],
                [
                    521,
                    809
                ],
                [
                    560,
                    809
                ],
                [
                    521,
                    833
                ],
                [
                    560,
                    833
                ],
                [
                    521,
                    857
                ],
                [
                    560,
                    857
                ]
            ],
            [
                [
                    749,
                    785
                ],
                [
                    788,
                    785
                ],
                [
                    749,
                    809
                ],
                [
                    788,
                    809
                ],
                [
                    749,
                    833
                ],
                [
                    788,
                    833
                ],
                [
                    749,
                    857
                ],
                [
                    788,
                    857
                ]
            ],
            [
                [
                    976,
                    785
                ],
                [
                    1016,
                    785
                ],
                [
                    976,
                    809
                ],
                [
                    1016,
                    809
                ],
                [
                    976,
                    833
                ],
                [
                    1016,
                    833
                ],
                [
                    976,
                    857
                ],
                [
                    1016,
                    857
                ]
            ],
            [
                [
                    1204,
                    785
                ],
                [
                    1243,
                    785
                ],
                [
                    1204,
                    809
                ],
                [
                    1243,
                    809
                ],
                [
                    1204,
                    833
                ],
                [
                    1243,
                    833
                ],
                [
                    1204,
                    857
                ],
                [
                    1243,
                    857
                ]
            ],
            [
                [
                    293,
                    926
                ],
                [
                    333,
                    926
                ],
                [
                    293,
                    951
                ],
                [
                    333,
                    951
                ],
                [
                    293,
                    975
                ],
                [
                    333,
                    975
                ],
                [
                    293,
                    999
                ],
                [
                    333,
                    999
                ]
            ],
            [
                [
                    521,
                    926
                ],
                [
                    560,
                    926
                ],
                [
                    521,
                    951
                ],
                [
                    560,
                    951
                ],
                [
                    521,
                    975
                ],
                [
                    560,
                    975
                ],
                [
                    521,
                    999
                ],
                [
                    560,
                    999
                ]
            ],
            [
                [
                    749,
                    926
                ],
                [
                    788,
                    926
                ],
                [
                    749,
                    951
                ],
                [
                    788,
                    951
                ],
                [
                    749,
                    975
                ],
                [
                    788,
                    975
                ],
                [
                    749,
                    999
                ],
                [
                    788,
                    999
                ]
            ],
            [
                [
                    976,
                    926
                ],
                [
                    1016,
                    926
                ],
                [
                    976,
                    951
                ],
                [
                    1016,
                    951
                ],
                [
                    976,
                    975
                ],
                [
                    1016,
                    975
                ],
                [
                    976,
                    999
                ],
                [
                    1016,
                    999
                ]
            ],
            [
                [
                    1204,
                    926
                ],
                [
                    1243,
                    926
                ],
                [
                    1204,
                    951
                ],
                [
                    1243,
                    951
                ],
                [
                    1204,
                    975
                ],
                [
                    1243,
                    975
                ],
                [
                    1204,
                    999
                ],
                [
                    1243,
                    999
                ]
            ]
        ]
    }
},
    'tln-10': { mcq: 0, tf: 0, tln: 10, paper: 'a4' },
            };

            let cfg = presets[selectedTemplateType] || {
                mcq: getVal('bldMcq', 12),
                tf: getVal('bldTf', 4),
                tln: getVal('bldTln', 6),
                paper: document.querySelector('input[name="bldPaper"]:checked')?.value || 'a4',
            };

            const school = document.getElementById('genSchool')?.value || 'SANG MATH OMR';
            const subtitle = document.getElementById('genSubtitle')?.value || 'Kiểm tra – Môn Toán';
            let hasEssay = document.getElementById('genHasEssay')?.checked;

            return genWasmTypst({ ...cfg, school, subtitle, hasEssay });
        }

        function genMathStandardTypst({ paper, school, subtitle, hasEssay, qrCodeStr }) {
            const isA5 = paper === 'a5';
            return `// Preview-safe Typst – math standard layout
#set page(
  paper: "${paper}",
  flipped: ${isA5},
  fill: white,
  margin: (top: 5mm, bottom: 5mm, left: 6mm, right: 6mm),
)
#set text(size: 8pt, font: "Times New Roman")

#let marker = box(fill: black, width: 12pt, height: 12pt)
#let tracking-marker = box(fill: black, width: 10pt, height: 10pt)

#let bubble(label) = {
  circle(
    radius: if ${isA5} { 4.3pt } else { 5pt },
    stroke: 0.5pt + rgb("#333333"),
    fill: white,
    align(center + horizon)[#text(size: if ${isA5} { 6.0pt } else { 7pt }, weight: "regular", fill: rgb("#888888"))[#label]],
  )
}

#align(top + center)[
  #scale(x: if ${isA5} { 88% } else { 95% }, y: if ${isA5} { 88% } else { 95% }, origin: top)[
    #block(width: 100%, height: 0pt)[
      #place(left, dx: -5mm, dy: -5mm, marker)
      #place(right, dx: 5mm, dy: -5mm, marker)
    ]
    
    #v(if ${isA5} { 1pt } else { 2pt })
    
    #let sbd-box = block(
      inset: (left: if ${isA5} { 6pt } else { 4pt }, right: if ${isA5} { 3pt } else { 2pt }, top: if ${isA5} { 1pt } else { 2pt }, bottom: if ${isA5} { 1pt } else { 2pt }),
      [
        #place(top + left, dx: -2pt, dy: -2pt)[#tracking-marker]
        #align(center)[#text(weight: "bold", size: 8pt)[SBD]]
        #v(if ${isA5} { 1pt } else { 2pt })
        #grid(
          columns: (12pt,) * 6, gutter: if ${isA5} { 1.2pt } else { 1.5pt },
          ..range(6).map(i => align(center, box(stroke: 0.8pt + black, width: if ${isA5} { 10pt } else { 11pt }, height: if ${isA5} { 10pt } else { 11pt })))
        )
        #v(if ${isA5} { 1pt } else { 2pt })
        #grid(
          columns: (12pt,) * 6, row-gutter: if ${isA5} { 0.8pt } else { 1.5pt }, column-gutter: 1.5pt,
          ..range(10).map(r => range(6).map(c => align(center, bubble(str(r))))).flatten()
        )
      ],
    )
    
    #let made-box = block(
      inset: (left: if ${isA5} { 3pt } else { 2pt }, right: if ${isA5} { 3pt } else { 2pt }, top: if ${isA5} { 1pt } else { 2pt }, bottom: if ${isA5} { 1pt } else { 2pt }),
      [
        #place(top + left, dx: -2pt, dy: -2pt)[#tracking-marker]
        #align(center)[#text(weight: "bold", size: 8pt)[Mã đề]]
        #v(if ${isA5} { 1pt } else { 2pt })
        #grid(
          columns: (12pt,) * 4,
          gutter: if ${isA5} { 1.2pt } else { 1.5pt },
          align(center, box(stroke: 0.8pt + black, width: if ${isA5} { 10pt } else { 11pt }, height: if ${isA5} { 10pt } else { 11pt })),
          align(center, box(stroke: 0.8pt + black, width: if ${isA5} { 10pt } else { 11pt }, height: if ${isA5} { 10pt } else { 11pt })),
          align(center, box(stroke: 0.8pt + black, width: if ${isA5} { 10pt } else { 11pt }, height: if ${isA5} { 10pt } else { 11pt })),
          align(center, box(stroke: 0.8pt + black, width: if ${isA5} { 10pt } else { 11pt }, height: if ${isA5} { 10pt } else { 11pt })),
        )
        #v(if ${isA5} { 1pt } else { 2pt })
        #grid(
          columns: (12pt,) * 4, row-gutter: if ${isA5} { 0.8pt } else { 1.5pt }, column-gutter: 1.5pt,
          ..range(10).map(r => range(4).map(c => align(center, bubble(str(r))))).flatten()
        )
      ],
    )
    
    #let mcq-row(num) = {
      grid(
        columns: (13pt, 12pt, 12pt, 12pt, 12pt),
        align(center + horizon)[*#num*],
        align(center + horizon, bubble("")),
        align(center + horizon, bubble("")),
        align(center + horizon, bubble("")),
        align(center + horizon, bubble("")),
      )
    }
    
    #let info-phan1-box = block(
      [
        #block(
          inset: (left: 4pt, right: 4pt, top: 2pt, bottom: 2pt),
          [
            #place(top + right, dx: 0pt, dy: -2pt)[#box(width: 1cm, height: 1cm, stroke: 0.5pt)]
            #align(left)[#text(size: 10pt, weight: "bold")[PHIẾU TRẢ LỜI TRẮC NGHIỆM]]
            #v(2pt)
            #text(size: 7.5pt)[*${school}*]
            #v(2pt)
            Họ và tên: ..............................................................
            #v(4pt)
            Lớp: .................... Môn: ${subtitle} .................... Điểm: .......
          ],
        )
        #line(length: 100%, stroke: (paint: rgb("#666666"), thickness: 0.8pt, dash: "dashed"))
        #block(
          inset: (left: 4pt, right: 4pt, top: 2pt, bottom: 2pt),
          [ *PHẦN I – TRẮC NGHIỆM (Chọn 1 đáp án)* ],
        )
        #line(length: 100%, stroke: (paint: rgb("#666666"), thickness: 0.8pt, dash: "dashed"))
        #grid(
          columns: (1fr, 1fr, 1fr),
          // Col 1
          block(
            stroke: (right: (paint: rgb("#666666"), thickness: 0.5pt, dash: "dashed")),
            inset: 2pt,
            [
              #grid(
                columns: (13pt, 12pt, 12pt, 12pt, 12pt),
                align(center)[#tracking-marker], align(center)[*A*], align(center)[*B*], align(center)[*C*], align(center)[*D*],
              )
              #v(2pt)
              #grid(columns: 1, row-gutter: if ${isA5} { 0.8pt } else { 1.5pt }, ..range(1, 5).map(i => mcq-row(i)))
            ]
          ),
          // Col 2
          block(
            stroke: (right: (paint: rgb("#666666"), thickness: 0.5pt, dash: "dashed")),
            inset: 2pt,
            [
              #grid(
                columns: (13pt, 12pt, 12pt, 12pt, 12pt),
                align(center)[#tracking-marker], align(center)[*A*], align(center)[*B*], align(center)[*C*], align(center)[*D*],
              )
              #v(2pt)
              #grid(columns: 1, row-gutter: if ${isA5} { 0.8pt } else { 1.5pt }, ..range(5, 9).map(i => mcq-row(i)))
            ]
          ),
          // Col 3
          block(
            inset: 2pt,
            [
              #grid(
                columns: (13pt, 12pt, 12pt, 12pt, 12pt),
                align(center)[#tracking-marker], align(center)[*A*], align(center)[*B*], align(center)[*C*], align(center)[*D*],
              )
              #v(2pt)
              #grid(columns: 1, row-gutter: if ${isA5} { 0.8pt } else { 1.5pt }, ..range(9, 13).map(i => mcq-row(i)))
            ]
          )
        )
      ]
    )
    
    #let tf-q(num) = {
      grid(
        columns: (12pt, 14pt, 14pt),
        row-gutter: if ${isA5} { 0.8pt } else { 1.5pt },
        grid.cell(rowspan: 2, align: center + horizon)[#tracking-marker],
        grid.cell(colspan: 2, align: center + bottom)[#text(size: 7pt, weight: "bold")[Câu #num]],
        align(center)[#text(size: 7pt, weight: "bold")[Đ]], align(center)[#text(size: 7pt, weight: "bold")[S]],
        [a)], bubble(""), bubble(""),
        [b)], bubble(""), bubble(""),
        [c)], bubble(""), bubble(""),
        [d)], bubble(""), bubble(""),
      )
    }
    
    #let phan2-box = block(
      [
        #block(inset: (left: 4pt, top: 2pt, bottom: 2pt), [ *PHẦN II – ĐÚNG / SAI* ])
        #line(length: 100%, stroke: (paint: rgb("#666666"), thickness: 0.8pt, dash: "dashed"))
        #block(
          inset: (top: 2pt, bottom: 2pt, left: 4pt, right: if ${isA5} { 6pt } else { 2pt }),
          grid(
            columns: (1fr, 1fr),
            gutter: 4pt,
            tf-q(1), tf-q(2),
          ),
        )
        #line(length: 100%, stroke: (paint: rgb("#666666"), thickness: 0.5pt, dash: "dashed"))
        #block(
          inset: (top: 2pt, bottom: 2pt, left: 4pt, right: if ${isA5} { 6pt } else { 2pt }),
          grid(
            columns: (1fr, 1fr),
            gutter: 4pt,
            tf-q(3), tf-q(4),
          ),
        )
      ]
    )
    
    // TOP BLOCK (SBD, Mã đề, Phần I, Phần II)
    #block(
      width: 100%,
      stroke: (paint: rgb("#666666"), thickness: 0.8pt, dash: "dashed"),
      radius: 4pt,
      clip: true,
      grid(
        columns: (auto, auto, 2.2fr, 1.2fr),
        sbd-box,
        block(stroke: (left: (paint: rgb("#666666"), thickness: 0.8pt, dash: "dashed"), right: (paint: rgb("#666666"), thickness: 0.8pt, dash: "dashed")), made-box),
        info-phan1-box,
        block(stroke: (left: (paint: rgb("#666666"), thickness: 0.8pt, dash: "dashed")), phan2-box)
      )
    )
    
    #v(if ${isA5} { -2pt } else { 4pt })
    
    // BOTTOM BLOCK (Phần III)
    #let tln-col(num) = {
      block(
        stroke: (right: if num < 6 { (paint: rgb("#666666"), thickness: 0.5pt, dash: "dashed") } else { 0pt }),
        width: 100%,
        inset: (bottom: if ${isA5} { 2pt } else { 4pt }),
        [
          #align(left)[#text(size:8pt)[*Câu #num*]]
          #v(if ${isA5} { 1pt } else { 2pt })
          #grid(
            columns: (12pt, 12pt, 12pt, 12pt, 12pt),
            align: center + horizon,
            tracking-marker,
            box(stroke: 0.5pt, width: if ${isA5} { 10pt } else { 11pt }, height: if ${isA5} { 10pt } else { 11pt }),
            box(stroke: 0.5pt, width: if ${isA5} { 10pt } else { 11pt }, height: if ${isA5} { 10pt } else { 11pt }),
            box(stroke: 0.5pt, width: if ${isA5} { 10pt } else { 11pt }, height: if ${isA5} { 10pt } else { 11pt }),
            box(stroke: 0.5pt, width: if ${isA5} { 10pt } else { 11pt }, height: if ${isA5} { 10pt } else { 11pt }),
          )
          #v(if ${isA5} { 1pt } else { 2pt })
          #grid(
            columns: (12pt, 12pt, 12pt, 12pt, 12pt),
            rows: (if ${isA5} { 9.8pt } else { 12.5pt },) * 13,
            align: center + horizon,
            [#text(size: 6.5pt, fill: rgb("#666666"))[-]], bubble(""), [], [], [],
            [#text(size: 6.5pt, fill: rgb("#666666"))[,]], [], bubble(""), bubble(""), [],
            [#text(size: 6.5pt, fill: rgb("#666666"))[0]], [], bubble(""), bubble(""), bubble(""),
            ..range(1, 10).map(r => (
              [#text(size: 6.5pt, fill: rgb("#666666"))[#r]],
              bubble(""),
              bubble(""),
              bubble(""),
              bubble("")
            )).flatten(),
          )
        ],
      )
    }
    
    #block(
      stroke: (paint: rgb("#666666"), thickness: 0.8pt, dash: "dashed"),
      radius: 4pt,
      clip: true,
      width: 100%,
      [
        #block(inset: 3pt, [*PHẦN III – TỰ LUẬN NGẮN*])
        #line(length: 100%, stroke: (paint: rgb("#666666"), thickness: 0.8pt, dash: "dashed"))
        #block(
          inset: (left: 10pt, right: 10pt, top: if ${isA5} { 3pt } else { 0pt }, bottom: if ${isA5} { 5pt } else { 6pt }),
          grid(
            columns: (1fr,) * 6,
            ..range(1, 7).map(i => tln-col(i))
          )
        )
      ],
    )

    #if "${paper}" == "a4" and ${hasEssay} [
      #v(6pt)
      #block(width: 100%, stroke: 0.8pt, radius: 4pt, clip: true, [
        #rect(width: 100%, height: 16pt, [#align(center+horizon)[#text(8pt, weight: "bold")[✍ PHẦN TỰ LUẬN – Viết bên dưới]]])
        #v(4pt)
        #for _ in range(12) [
          #line(length: 100%, stroke: (thickness: 0.3pt, dash: "dashed", paint: luma(200)))
          #v(14pt)
        ]
      ])
    ]
    #block(width: 100%, height: 0pt)[
      #place(left, dx: -5mm, dy: 5mm, marker)
      #place(right, dx: 5mm, dy: 5mm, marker)
    ]
  ]
]

#if "${paper}" == "a5" and ${hasEssay} [
  #pagebreak()
  #align(center + horizon)[
    #scale(x: 95%, y: 95%, origin: center)[
      #block(width: 100%, stroke: 0.8pt, radius: 4pt, clip: true, [
        #rect(width: 100%, height: 16pt, [#align(center+horizon)[#text(8pt, weight: "bold")[✍ PHẦN TỰ LUẬN – Viết bên dưới]]])
        #v(4pt)
        #for _ in range(8) [
          #line(length: 100%, stroke: (thickness: 0.3pt, dash: "dashed", paint: luma(200)))
          #v(14pt)
        ]
      ])
    ]
  ]
]
`;
        }

        function genWasmTypst({ mcq, tf, tln, paper, school, subtitle, hasEssay, qrCodeStr }) {
            if (mcq === 12 && tf === 4 && tln === 6) {
                return genMathStandardTypst({ paper, school, subtitle, hasEssay, qrCodeStr });
            }
            const isA5 = paper === 'a5';
            const cols = mcq <= 20 ? 2 : mcq <= 40 ? 3 : 4;
            const perCol = mcq > 0 ? Math.ceil(mcq / cols) : 0;

            let mcqSection = '';
            if (mcq > 0) {
                let colBlocks = [];
                for (let c = 0; c < cols; c++) {
                    const start = c * perCol + 1;
                    const end = Math.min((c + 1) * perCol, mcq);
                    if (start > end) continue;
                    colBlocks.push(`
          block(
            stroke: (right: 0.5pt),
            inset: 2pt,
            [
              #grid(
                columns: (16pt, 12pt, 12pt, 12pt, 12pt),
                align(center)[#tracking-marker], align(center)[*A*], align(center)[*B*], align(center)[*C*], align(center)[*D*],
              )
              #v(2pt)
              #grid(columns: 1, row-gutter: 1.5pt, ..range(${start}, ${end + 1}).map(i => grid(
                columns: (16pt, 12pt, 12pt, 12pt, 12pt),
                align(center + horizon)[*#i*],
                bubble(""), bubble(""), bubble(""), bubble(""),
              )))
            ]
          )`);
                }
                mcqSection = `
#v(4pt)
#block(width:100%, stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"), radius:4pt, clip:true, [
  #rect(width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN I – TRẮC NGHIỆM (${mcq} câu, chọn 1 đáp án)]]])
  #grid(columns: (1fr,) * ${colBlocks.length}, stroke: (x,y) => if x==0 { none } else { 0.5pt }, ${colBlocks.join(',\n')} )
])`;
            }

            let tfSection = '';
            if (tf > 0) {
                let tfQs = [];
                let cols = (isA5 && tf === 20) ? 4 : Math.min(5, tf);
                let sortedIs = [];
                let rows = Math.ceil(tf / cols);
                for (let r = 0; r < rows; r++) {
                    for (let c = 0; c < cols; c++) {
                        let i = c * rows + r + 1;
                        if (i <= tf) sortedIs.push(i);
                    }
                }
                for (let i of sortedIs) {
                    tfQs.push(`grid(
        columns: (15pt, 16pt, 16pt),
        row-gutter: 2.5pt,
        column-gutter: 3pt,
        align: center + horizon,
        grid.cell(colspan: 3, align: left + horizon)[
          #stack(dir: ltr, spacing: 4pt,
            tracking-marker,
            text(size: 8pt, weight: "bold")[Câu ${i}]
          )
        ],
        none, text(size: 7.5pt, weight: "bold")[Đ], text(size: 7.5pt, weight: "bold")[S],
        [a)], bubble(""), bubble(""),
        [b)], bubble(""), bubble(""),
        [c)], bubble(""), bubble(""),
        [d)], bubble(""), bubble(""),
      )`);
                }
                const tfCols = (isA5 && tf === 20) ? 5 : Math.min(5, tf);
                tfSection = `
#v(4pt)
#block(width:100%, stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"), radius:4pt, clip:true, [
  #rect(width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN II – ĐÚNG / SAI (${tf} câu, mỗi câu 4 ý a/b/c/d)]]])
  ${isA5 ? '#scale(x: 88%, y: 88%, origin: top)[\\n' : ''}  #block(
    inset: (top: 8pt, bottom: 8pt, left: 10pt, right: 10pt),
    grid(
      columns: (1fr,) * ${tfCols},
      row-gutter: ${isA5 ? '4pt' : '12pt'},
      column-gutter: 8pt,
      ${tfQs.join(',\n      ')}
    )
  )
  ${isA5 ? ']\\n' : ''}])`;
            }

            let tlnSection = '';
            if (tln > 0) {
                const tlnCols = Math.min(tln, tln <= 6 ? tln : Math.ceil(tln / 2));
                const rows = Math.ceil(tln / tlnCols);
                let parts = [];
                for (let r = 0; r < rows; r++) {
                    const start = r * tlnCols + 1;
                    const end = Math.min(start + tlnCols - 1, tln);
                    const cnt = end - start + 1;
                    let tlnQs = [];
                    for(let num = start; num <= end; num++) {
                        tlnQs.push(`block(
        stroke: (right: 0.5pt),
        width: 100%,
        inset: (bottom: if ${isA5} { 2pt } else { 4pt }),
        [
          #align(left)[#text(size:8pt)[*Câu ${num}*]]
          #v(if ${isA5} { 1pt } else { 2pt })
          #grid(
            columns: (12pt, 12pt, 12pt, 12pt, 12pt),
            align: center + horizon,
            tracking-marker,
            empty-box, empty-box, empty-box, empty-box,
          )
          #v(if ${isA5} { 1pt } else { 2pt })
          #grid(
            columns: (12pt, 12pt, 12pt, 12pt, 12pt),
            rows: (if ${isA5} { 9.8pt } else { 12.5pt },) * 13,
            align: center + horizon,
            [#text(size: 6.5pt, fill: rgb("#666666"))[-]], bubble(""), [], [], [],
            [#text(size: 6.5pt, fill: rgb("#666666"))[,]], [], bubble(""), bubble(""), [],
            [#text(size: 6.5pt, fill: rgb("#666666"))[0]], [], bubble(""), bubble(""), bubble(""),
            ..range(1, 10).map(r => (
              [#text(size: 6.5pt, fill: rgb("#666666"))[#r]], bubble(""), bubble(""), bubble(""), bubble("")
            )).flatten(),
          )
        ]
      )`);
                    }
                    parts.push(`
#v(if ${isA5} { -2pt } else { 4pt })
#block(width:100%, stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"), radius:4pt, clip:true, [
  #rect(width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN ${r === 0 ? 'III' : 'IV'} – TỰ LUẬN NGẮN (Câu ${start}-${end})]]])
  #block(
    inset: (left: 10pt, right: 10pt, top: if ${isA5} { 3pt } else { 0pt }, bottom: if ${isA5} { 5pt } else { 6pt }),
    grid(
      columns: (1fr,) * ${cnt},
      row-gutter: ${isA5 ? '4pt' : '12pt'},
      ${tlnQs.join(', ')}
    )
  )
])`);
                }
                tlnSection = parts.join('\n');
                if (isA5) {
                    tlnSection = `#scale(x: 75%, y: 75%, origin: top + left)[\n${tlnSection}\n]`;
                }
            }

            let paperSpec = isA5 ? `"a5"` : `"a4"`;

            return `// Preview-safe Typst – no external packages
// Generated by Sang Math OMR

#set page(
  paper: ${paperSpec},
  flipped: ${isA5},
  fill: white,
  margin: (top: 5mm, bottom: 5mm, left: 6mm, right: 6mm),
)
#set text(size: 8pt, font: "Times New Roman")

#let marker = box(fill: black, width: 12pt, height: 12pt)
#let tracking-marker = box(fill: black, width: 10pt, height: 10pt)

#let bubble(label) = {
  align(center + horizon)[
    #circle(
      radius: 4.5pt,
      stroke: 0.5pt + rgb("#333333"),
      fill: white,
      align(center + horizon)[#text(size: 6.5pt, weight: "regular", fill: rgb("#888888"))[#label]],
    )
  ]
}
#let empty-box = box(stroke: 0.8pt + black, width: if ${isA5} { 10pt } else { 11pt }, height: if ${isA5} { 10pt } else { 11pt })
#let qb = box(width: 1.8pt, height: 1.8pt, fill: black)
#let qw = box(width: 1.8pt, height: 1.8pt, fill: white)

#place(top + left, dx: -2mm, dy: -2mm, marker)
#place(top + right, dx: 2mm, dy: -2mm, marker)
#place(bottom + left, dx: -2mm, dy: 2mm, marker)
#place(bottom + right, dx: 2mm, dy: 2mm, marker)
#align(top + center)[
  #scale(x: if ${isA5} { 88% } else { 95% }, y: if ${isA5} { 88% } else { 95% }, origin: top)[
    #block(width: 100%, height: 0pt)[
      #place(left, dx: if ${isA5} { 35mm } else { 43mm }, dy: 15mm)[
        ${qrCodeStr || ''}
      ]
    ]
    

// ── HEADER ──────────────────────────────────────────────────
#let sbd-box = block(
  inset: (left: if ${isA5} { 6pt } else { 4pt }, right: if ${isA5} { 3pt } else { 2pt }, top: if ${isA5} { 1pt } else { 2pt }, bottom: if ${isA5} { 1pt } else { 2pt }),
  [
    #place(top + left, dx: -2pt, dy: -2pt)[#tracking-marker]
        #align(center)[#text(weight: "bold", size: 8pt)[SỐ BÁO DANH]]
    #v(if ${isA5} { 1pt } else { 2pt })
    #grid(
      columns: (12pt,) * 6, gutter: if ${isA5} { 1.2pt } else { 1.5pt },
      ..range(6).map(i => align(center, empty-box))
    )
    #v(if ${isA5} { 1pt } else { 2pt })
    #grid(
      columns: (12pt,) * 6, row-gutter: if ${isA5} { 0.8pt } else { 1.5pt }, column-gutter: 1.5pt,
      ..range(10).map(r => range(6).map(c => bubble(str(r)))).flatten()
    )
  ],
)

#let made-box = block(
  inset: (left: if ${isA5} { 3pt } else { 2pt }, right: if ${isA5} { 3pt } else { 2pt }, top: if ${isA5} { 1pt } else { 2pt }, bottom: if ${isA5} { 1pt } else { 2pt }),
  [
    #place(top + left, dx: -2pt, dy: -2pt)[#tracking-marker]
        #align(center)[#text(weight: "bold", size: 8pt)[MÃ ĐỀ THI]]
    #v(if ${isA5} { 1pt } else { 2pt })
    #grid(
      columns: (12pt,) * 4,
      gutter: if ${isA5} { 1.2pt } else { 1.5pt },
      align(center, empty-box), align(center, empty-box), align(center, empty-box), align(center, empty-box),
    )
    #v(if ${isA5} { 1pt } else { 2pt })
    #grid(
      columns: (12pt,) * 4, row-gutter: if ${isA5} { 0.8pt } else { 1.5pt }, column-gutter: 1.5pt,
      ..range(10).map(r => range(4).map(c => bubble(str(r)))).flatten()
    )
  ],
)

#block(width:100%, stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"), radius:4pt, clip:true, [
  #grid(columns:(82pt, 60pt, 1fr, 28pt), gutter:0pt, stroke:(paint:rgb("#666666"),thickness:0.5pt,dash:"dashed"),
    grid.cell(stroke:(paint:rgb("#666666"),thickness:0.5pt,dash:"dashed"), sbd-box),
    grid.cell(stroke:(paint:rgb("#666666"),thickness:0.5pt,dash:"dashed"), made-box),
    grid.cell(stroke:(paint:rgb("#666666"),thickness:0.5pt,dash:"dashed"), [
      #pad(x:4pt)[
        #text(10pt, weight:"bold", fill:rgb("#c0392b"))[PHIẾU TRẢ LỜI TRẮC NGHIỆM]
        #v(2pt)
        #text(7pt)[${school}]
        #v(4pt)
        #text(7pt)[Họ và tên: .....................................................]
        #v(4pt)
        #text(7pt)[Lớp: ............ Môn: ............... Điểm: ...............]
      ]
    ]),
    grid.cell(stroke:(paint:rgb("#666666"),thickness:0.5pt,dash:"dashed"), [
      #align(center+horizon)[
        #rect(width:24pt, height:24pt, stroke:.5pt)[
          #align(center+horizon)[#text(6pt, fill:gray)[QR]]
        ]
      ]
    ]),
  )
])

${mcqSection}
${tfSection}
${tlnSection}

// ── TỰ LUẬN VIẾT TAY ────────────────────────────────────────
${hasEssay ? `
#v(4pt)
#block(width:100%, stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"), radius:4pt, clip:true, [
  #rect(width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[✍ PHẦN TỰ LUẬN – Viết bên dưới]]])
  #v(4pt)
  #set par(leading: 14pt)
  #for _ in range(${Math.floor(isA5 ? 4 : 8)}) [
    #line(length:100%, stroke:(thickness:.3pt, dash:"dashed", paint:luma(200)))
    #v(14pt)
  ]
  #v(4pt)
])` : ''}

  ]
]
`;
        }

        // ── Zoom SVG ──────────────────────────────────────────────────
        function zoomSvgPreview() {
            const src = document.getElementById('svgPreviewContainer').innerHTML;
            const modal = document.getElementById('svgZoomModal');
            const content = document.getElementById('svgZoomContent');
            content.innerHTML = src;
            const svgEl = content.querySelector('svg');
            if (svgEl) { svgEl.style.width = '100%'; svgEl.style.height = 'auto'; }
            modal.style.display = 'flex';
        }
        function closeSvgZoom() {
            document.getElementById('svgZoomModal').style.display = 'none';
        }

        // ── Download active preview ───────────────────────────────────
        function downloadActivePreview() {
            const svgEl = document.querySelector('#svgPreviewContainer svg');
            if (!svgEl) return alert('Chưa có preview WASM!');
            
            const svgString = new XMLSerializer().serializeToString(svgEl);
            const svgBlob = new Blob([svgString], { type: 'image/svg+xml;charset=utf-8' });
            const URL = window.URL || window.webkitURL || window;
            const blobURL = URL.createObjectURL(svgBlob);
            
            const image = new Image();
            image.onload = () => {
                const canvas = document.createElement('canvas');
                const scale = 2; // High resolution scale
                const width = (svgEl.viewBox?.baseVal?.width || 800) * scale;
                const height = (svgEl.viewBox?.baseVal?.height || 1100) * scale;
                canvas.width = width;
                canvas.height = height;
                
                const context = canvas.getContext('2d');
                context.fillStyle = '#ffffff';
                context.fillRect(0, 0, width, height);
                context.drawImage(image, 0, 0, width, height);
                
                const pngURL = canvas.toDataURL('image/png');
                const a = document.createElement('a');
                a.href = pngURL;
                a.download = `preview_typst_${Date.now()}.png`;
                a.click();
                URL.revokeObjectURL(blobURL);
            };
            image.src = blobURL;
        }

        // ============================================================
        // CANVAS LIVE PREVIEW RENDERER
        // ============================================================
        const PV = {
            // Draws a complete sheet preview onto a canvas
            draw(canvas, cfg) {
                const { type, mcq, tf, tln, paper, school, subtitle, hasEssay } = cfg;
                const isLandscape = paper === 'a5' || (!hasEssay && mcq === 12 && tf === 4 && tln === 6);
                const W = isLandscape ? 1050 : 744;
                const H = isLandscape ? 744 : 1052;

                // ── Fix HiDPI/Retina blurriness ──
                const dpr = window.devicePixelRatio || 1;
                canvas.width = W * dpr;
                canvas.height = H * dpr;
                canvas.style.width = W + 'px';
                canvas.style.height = H + 'px';
                const g = canvas.getContext('2d');
                g.scale(dpr, dpr);

                // Background
                g.fillStyle = '#ffffff';
                g.fillRect(0, 0, W, H);

                // Paper border
                g.strokeStyle = '#d0d0d0';
                g.lineWidth = 0.5;
                g.strokeRect(0.5, 0.5, W - 1, H - 1);

                // Corner markers
                const mk = 14;
                g.fillStyle = '#111';
                [[16, 16], [W - 16 - mk, 16], [16, H - 16 - mk], [W - 16 - mk, H - 16 - mk]].forEach(([x, y]) => {
                    g.fillRect(x, y, mk, mk);
                });

                const pad = 36;
                let y = pad + mk + 8;
                const cw = W - pad * 2;

                // ── HEADER BOX ──────────────────────────────────────────
                const headerH = 72;
                g.strokeStyle = '#222'; g.lineWidth = 1.5;
                g.strokeRect(pad, y, cw, headerH);

                // SBD block
                const sbdW = 86;
                g.strokeStyle = '#555'; g.lineWidth = 0.5;
                g.strokeRect(pad + sbdW, y, 0, headerH);
                this._label(g, 'SBD', pad + sbdW / 2, y + 10, 8, 'bold', '#222');
                // SBD digit boxes
                for (let i = 0; i < 6; i++) {
                    const bx = pad + 4 + i * 12;
                    g.strokeStyle = '#333'; g.lineWidth = 0.7;
                    g.strokeRect(bx, y + 14, 10, 10);
                }
                // SBD bubbles
                for (let r = 0; r < 10; r++) {
                    for (let c = 0; c < 6; c++) {
                        const cx2 = pad + 9 + c * 12, cy = y + 30 + r * 4;
                        g.strokeStyle = '#777'; g.lineWidth = 0.4;
                        g.beginPath(); g.arc(cx2, cy, 1.5, 0, 2 * Math.PI); g.stroke();
                    }
                }

                // MADE block
                const madeW = 54;
                const mx = pad + sbdW;
                g.strokeStyle = '#555'; g.lineWidth = 0.5;
                g.strokeRect(mx + madeW, y, 0, headerH);
                this._label(g, 'Mã đề', mx + madeW / 2, y + 10, 7, 'bold', '#222');
                for (let i = 0; i < 3; i++) {
                    const bx = mx + 6 + i * 13;
                    g.strokeStyle = '#333'; g.lineWidth = 0.7;
                    g.strokeRect(bx, y + 14, 10, 10);
                }
                for (let r = 0; r < 10; r++) {
                    for (let c = 0; c < 3; c++) {
                        const cx2 = mx + 12 + c * 13, cy = y + 30 + r * 4;
                        g.strokeStyle = '#777'; g.lineWidth = 0.4;
                        g.beginPath(); g.arc(cx2, cy, 1.5, 0, 2 * Math.PI); g.stroke();
                    }
                }

                // Info block
                const ix = mx + madeW;
                const infoW = cw - sbdW - madeW;
                g.font = 'bold 10px "Times New Roman"'; g.fillStyle = '#c0392b'; g.textAlign = 'left';
                g.fillText('PHIẾU TRẢ LỜI TRẮC NGHIỆM', ix + 8, y + 16);
                g.font = '7.5px "Times New Roman"'; g.fillStyle = '#333';
                g.fillText(school || 'SANG MATH OMR', ix + 8, y + 26);
                g.fillText('Họ và tên: .................................', ix + 8, y + 40);
                g.fillText(`Lớp: ........... Môn: ........... Điểm: .....`, ix + 8, y + 52);
                // Mini QR stub
                g.strokeStyle = '#999'; g.lineWidth = 0.5; g.strokeRect(ix + infoW - 30, y + 4, 24, 24);
                g.font = '5px "Times New Roman"'; g.fillStyle = '#999'; g.textAlign = 'center';
                g.fillText('QR', ix + infoW - 18, y + 18);

                y += headerH + 6;

                // ── PHẦN I: TN ──────────────────────────────────────────
                if (mcq > 0) {
                    const cols = mcq <= 20 ? 2 : mcq <= 40 ? 3 : 4;
                    const per = Math.ceil(mcq / cols);
                    const rowH = per * 10 + 24;
                    g.strokeStyle = '#222'; g.lineWidth = 1.2;
                    g.strokeRect(pad, y, cw, rowH);
                    this._label(g, `PHẦN I – TRẮC NGHIỆM (${mcq} câu)`, pad + cw / 2, y + 10, 7.5, 'bold', '#222');
                    g.strokeStyle = '#aaa'; g.lineWidth = 0.5;
                    g.beginPath(); g.moveTo(pad, y + 14); g.lineTo(pad + cw, y + 14); g.stroke();

                    const colW = cw / cols;
                    for (let ci = 0; ci < cols; ci++) {
                        const xs = pad + ci * colW + 4;
                        if (ci > 0) { g.strokeStyle = '#ccc'; g.lineWidth = 0.5; g.beginPath(); g.moveTo(pad + ci * colW, y + 14); g.lineTo(pad + ci * colW, y + rowH); g.stroke(); }
                        // Header row A B C D
                        ['A', 'B', 'C', 'D'].forEach((l, li) => {
                            g.font = '6px "Times New Roman"'; g.fillStyle = '#555'; g.textAlign = 'center';
                            g.fillText(l, xs + 14 + li * 7, y + 22);
                        });
                        for (let qi = 0; qi < per; qi++) {
                            const qnum = ci * per + qi + 1;
                            if (qnum > mcq) break;
                            const qy = y + 26 + qi * 10;
                            g.font = '6px "Times New Roman"'; g.fillStyle = '#222'; g.textAlign = 'right';
                            g.fillText(qnum + '.', xs + 10, qy + 5);
                            for (let oi = 0; oi < 4; oi++) {
                                g.strokeStyle = '#777'; g.lineWidth = 0.4;
                                g.beginPath(); g.arc(xs + 14 + oi * 7 + 2.5, qy + 3, 2.5, 0, 2 * Math.PI); g.stroke();
                            }
                        }
                    }
                    y += rowH + 5;
                }

                // ── PHẦN II: TF ─────────────────────────────────────────
                if (tf > 0) {
                    const tfCols = Math.min(tf, 4);
                    const tfH = 70;
                    g.strokeStyle = '#222'; g.lineWidth = 1.2;
                    g.strokeRect(pad, y, cw, tfH);
                    this._label(g, `PHẦN II – ĐÚNG / SAI (${tf} câu)`, pad + cw / 2, y + 10, 7.5, 'bold', '#222');
                    g.strokeStyle = '#aaa'; g.lineWidth = 0.5;
                    g.beginPath(); g.moveTo(pad, y + 14); g.lineTo(pad + cw, y + 14); g.stroke();

                    const tfW = cw / tfCols;
                    for (let ci = 0; ci < tfCols; ci++) {
                        if (ci >= tf) break;
                        const xs = pad + ci * tfW;
                        if (ci > 0) { g.strokeStyle = '#ccc'; g.lineWidth = 0.5; g.beginPath(); g.moveTo(xs, y + 14); g.lineTo(xs, y + tfH); g.stroke(); }
                        this._label(g, `Câu ${ci + 1}`, xs + tfW / 2, y + 22, 7, 'bold', '#333');
                        // Đ S header
                        ['Đ', 'S'].forEach((l, li) => {
                            g.font = '6px "Times New Roman"'; g.fillStyle = '#555'; g.textAlign = 'center';
                            g.fillText(l, xs + tfW / 2 + (li === 0 ? -8 : 8), y + 30);
                        });
                        // a b c d rows
                        ['a)', 'b)', 'c)', 'd)'].forEach((l, ri) => {
                            const ry = y + 36 + ri * 8;
                            g.font = '6px "Times New Roman"'; g.fillStyle = '#666'; g.textAlign = 'right';
                            g.fillText(l, xs + tfW / 2 - 14, ry + 4);
                            [0, 1].forEach(oi => {
                                g.strokeStyle = '#777'; g.lineWidth = 0.4;
                                g.beginPath(); g.arc(xs + tfW / 2 + (oi === 0 ? -8 : 8), ry + 2, 2.5, 0, 2 * Math.PI); g.stroke();
                            });
                        });
                    }
                    y += tfH + 5;
                }

                // ── PHẦN III: TLN ───────────────────────────────────────
                if (tln > 0) {
                    const tlnCols = Math.min(tln, tln <= 6 ? tln : Math.ceil(tln / 2));
                    const rows = Math.ceil(tln / tlnCols);
                    for (let ri = 0; ri < rows; ri++) {
                        const start = ri * tlnCols;
                        const end = Math.min(start + tlnCols, tln);
                        const count = end - start;
                        const tlnH = 75;
                        g.strokeStyle = '#222'; g.lineWidth = 1.2;
                        g.strokeRect(pad, y, cw, tlnH);
                        this._label(g, `PHẦN ${ri === 0 ? 'III' : 'IV'} – TỰ LUẬN NGẮN (Câu ${start + 1}–${end})`, pad + cw / 2, y + 10, 7.5, 'bold', '#222');
                        g.strokeStyle = '#aaa'; g.lineWidth = 0.5;
                        g.beginPath(); g.moveTo(pad, y + 14); g.lineTo(pad + cw, y + 14); g.stroke();

                        const tlnW = cw / count;
                        for (let ci = 0; ci < count; ci++) {
                            const xs = pad + ci * tlnW;
                            if (ci > 0) { g.strokeStyle = '#ccc'; g.lineWidth = 0.5; g.beginPath(); g.moveTo(xs, y + 14); g.lineTo(xs, y + tlnH); g.stroke(); }
                            this._label(g, `Câu ${start + ci + 1}`, xs + tlnW / 2, y + 23, 7, 'bold', '#333');
                            // Tracking + 4 boxes
                            g.fillStyle = '#111'; g.fillRect(xs + 4, y + 26, 6, 6);
                            for (let bi = 0; bi < 4; bi++) {
                                g.strokeStyle = '#444'; g.lineWidth = 0.6;
                                g.strokeRect(xs + 12 + bi * 9, y + 26, 7, 7);
                            }
                            // Bubbles 0-9 for 4 cols
                            for (let r = 0; r < 12; r++) {
                                const label = r === 0 ? '-' : r === 1 ? ',' : String(r - 2);
                                g.font = '4.5px "Times New Roman"'; g.fillStyle = '#666'; g.textAlign = 'right';
                                g.fillText(label, xs + 10, y + 36 + r * 3.3);
                                for (let c = 0; c < 4; c++) {
                                    g.strokeStyle = '#999'; g.lineWidth = 0.3;
                                    g.beginPath(); g.arc(xs + 13 + c * 9, y + 35 + r * 3.3, 1.4, 0, 2 * Math.PI); g.stroke();
                                }
                            }
                        }
                        y += tlnH + 5;
                    }
                }

                // ── TỰ LUẬN ─────────────────────────────────────────────
                if (hasEssay && (type === 'tln-10' || type === 'a4' || (type === 'custom' && H > 800))) {
                    const remaining = H - y - pad - mk - 8;
                    if (remaining > 40) {
                        g.strokeStyle = '#222'; g.lineWidth = 1;
                        g.setLineDash([]);
                        g.strokeRect(pad, y, cw, remaining);
                        this._label(g, 'PHẦN TỰ LUẬN', pad + cw / 2, y + 10, 7.5, 'bold', '#888');
                        g.strokeStyle = '#aaa'; g.lineWidth = 0.4;
                        g.beginPath(); g.moveTo(pad, y + 14); g.lineTo(pad + cw, y + 14); g.stroke();
                        // Dashed lines
                        g.setLineDash([4, 4]);
                        g.strokeStyle = '#ccc'; g.lineWidth = 0.5;
                        const lineCount = Math.floor((remaining - 18) / 14);
                        for (let li = 0; li < lineCount; li++) {
                            const ly = y + 18 + li * 14;
                            g.beginPath(); g.moveTo(pad + 10, ly); g.lineTo(pad + cw - 10, ly); g.stroke();
                        }
                        g.setLineDash([]);
                    }
                }

                // Update info bar
                const paperLabel = isLandscape ? 'A5 Ngang' : 'A4 Đứng';
                const totalQ = (mcq || 0) + (tf || 0) * 4 + (tln || 0);
                document.getElementById('prevInfoLeft').textContent = `${paperLabel} · ${totalQ} câu`;
                document.getElementById('prevInfoRight').textContent =
                    `${mcq || 0} TN · ${tf || 0} Đ/S · ${tln || 0} TLN`;
            },

            _label(g, text, x, y, size, weight, color) {
                g.font = `${weight} ${size}px "Times New Roman"`;
                g.fillStyle = color;
                g.textAlign = 'center';
                g.fillText(text, x, y);
            }
        };

        async function renderSheetPreview() {
            renderTypstLive();
        }

        function refreshPreview() {
            if (activePreviewMode === 'wasm') {
                renderTypstLive();
            } else {
                renderSheetPreview();
            }
        }

        function togglePreviewZoom(srcCanvas) {
            const modal = document.getElementById('previewModal');
            const zoomCanvas = document.getElementById('sheetCanvasZoom');
            // Copy at native resolution (DPR already baked into srcCanvas)
            zoomCanvas.width = srcCanvas.width;
            zoomCanvas.height = srcCanvas.height;
            zoomCanvas.style.width = '';
            zoomCanvas.style.height = '';
            zoomCanvas.style.maxWidth = '90vw';
            zoomCanvas.style.maxHeight = '90vh';
            zoomCanvas.getContext('2d').drawImage(srcCanvas, 0, 0);
            modal.style.display = 'flex';
        }

        function closePreviewModal() {
            document.getElementById('previewModal').style.display = 'none';
        }

        function downloadPreviewPNG() {
            const canvas = document.getElementById('sheetCanvas');
            const a = document.createElement('a');
            a.href = canvas.toDataURL('image/png');
            a.download = `preview_${selectedTemplateType}_${Date.now()}.png`;
            a.click();
        }

        // ---- SHEET GENERATOR TAB ----
        let selectedTemplateType = '12-4-6ngang';

        function selectTemplate(type, el) {
            document.querySelectorAll('.tmpl-card').forEach(c => c.classList.remove('selected'));
            el.classList.add('selected');
            selectedTemplateType = type;
            updateSheetPreview();
            renderSheetPreview();
        }

        function scrollToBuilder() {
            document.querySelector('#smartBuilder').scrollIntoView({ behavior: 'smooth', block: 'start' });
        }

        function updateSheetPreview() {
            const school = document.getElementById('genSchool').value;
            const subtitle = document.getElementById('genSubtitle').value;
            document.getElementById('prevSchool').textContent = school;
            document.getElementById('prevSubtitle').textContent = subtitle;

            const qGrid = document.getElementById('prevQGrid');
            const note = document.getElementById('prevNote');
            const map = {
                '12-4-6ngang': '12TN + 4ĐS + 6TLN (A5 Ngang)',
                'thptqg-toan': '12TN + 4ĐS + 6TLN (THPTQG 2025)',
                'tn-40': '40 câu ABCD',
                'tn-60': '60 câu ABCD (THPTQG)',
                'ds-12': '12 câu Điền Số',
                'tln-10': '10 câu Tự Luận Ngắn (A4)',
                'custom': 'Tuỳ Chỉnh (Smart Builder ↓)'
            };
            note.textContent = '📋 ' + (map[selectedTemplateType] || '') + ' — SBD 6 chữ số';

            // Simple preview dots
            const numQ = {
                '12-4-6ngang': 22, 'tn-40': 40, 'tn-60': 60, 'ds-12': 12,
                'thptqg-toan': 22, 'tln-10': 10, 'custom': 0
            }[selectedTemplateType] || 50;

            if (selectedTemplateType === 'custom') {
                const mcq = getVal('bldMcq', 12);
                const tf = getVal('bldTf', 4);
                const tln = getVal('bldTln', 6);
                
                let html = '';
                if (mcq > 0) {
                    html += `<div style="font-weight:bold;font-size:9px;margin-top:6px;color:var(--muted)">Phần I: Trắc nghiệm (${mcq} câu)</div>`;
                    html += Array.from({ length: Math.min(mcq, 12) }, (_, i) => `
                        <div style="display:flex;align-items:center;gap:2px;margin:1px 0;">
                          <span style="font-size:8px;width:14px;text-align:right">${i + 1}.</span>
                          ${['A', 'B', 'C', 'D'].map(o => `<div style="width:10px;height:10px;border:0.5px solid #888;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:6px;color:#666">${o}</div>`).join('')}
                        </div>
                    `).join('');
                    if (mcq > 12) html += `<div style="font-size:8px;color:#aaa;padding-left:14px">... và ${mcq - 12} câu khác</div>`;
                }
                if (tf > 0) {
                    html += `<div style="font-weight:bold;font-size:9px;margin-top:6px;color:var(--muted)">Phần II: Đúng/Sai (${tf} câu)</div>`;
                    html += Array.from({ length: Math.min(tf, 4) }, (_, i) => `
                        <div style="display:flex;flex-direction:column;gap:2px;margin:4px 0;border-bottom:1px dashed #eee;padding-bottom:4px;width:100%">
                          <span style="font-size:8px;font-weight:bold;color:var(--muted)">Câu ${i + 1}:</span>
                          <div style="display:flex;gap:6px;flex-wrap:wrap">
                            ${['a', 'b', 'c', 'd'].map(lbl => `
                              <div style="display:flex;align-items:center;gap:2px">
                                <span style="font-size:7px;color:#aaa">${lbl}:</span>
                                <div style="width:10px;height:10px;border:0.5px solid #888;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:5px;color:#666">Đ</div>
                                <div style="width:10px;height:10px;border:0.5px solid #888;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:5px;color:#666">S</div>
                              </div>
                            `).join('')}
                          </div>
                        </div>
                    `).join('');
                    if (tf > 4) html += `<div style="font-size:8px;color:#aaa;padding-left:14px">... và ${tf - 4} câu khác</div>`;
                }
                if (tln > 0) {
                    html += `<div style="font-weight:bold;font-size:9px;margin-top:6px;color:var(--muted)">Phần III: TL Ngắn (${tln} câu)</div>`;
                    html += Array.from({ length: Math.min(tln, 4) }, (_, i) => `
                        <div style="display:flex;align-items:center;gap:3px;margin:1px 0;">
                          <span style="font-size:8px;width:20px;text-align:right;color:var(--muted)">Câu ${i + 1}:</span>
                          ${[0, 1, 2, 3].map(j => `<div style="width:12px;height:12px;border:0.5px solid #888;border-radius:2px;"></div>`).join('')}
                        </div>
                    `).join('');
                    if (tln > 4) html += `<div style="font-size:8px;color:#aaa;padding-left:14px">... và ${tln - 4} câu khác</div>`;
                }
                qGrid.innerHTML = html;
                return;
            }
            if (selectedTemplateType === 'ds-12') {
                qGrid.innerHTML = Array.from({ length: 12 }, (_, i) => `
      <div style="display:flex;flex-direction:column;gap:2px;margin:4px 0;border-bottom:1px dashed #eee;padding-bottom:4px;width:100%">
        <span style="font-size:8px;font-weight:bold;color:var(--muted)">Câu ${i + 1}:</span>
        <div style="display:flex;gap:6px;flex-wrap:wrap">
          ${['a', 'b', 'c', 'd'].map(lbl => `
            <div style="display:flex;align-items:center;gap:2px">
              <span style="font-size:7px;color:#aaa">${lbl}:</span>
              <div style="width:10px;height:10px;border:0.5px solid #888;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:5px;color:#666">Đ</div>
              <div style="width:10px;height:10px;border:0.5px solid #888;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:5px;color:#666">S</div>
            </div>
          `).join('')}
        </div>
      </div>
    `).join('');
                return;
            }
            if (selectedTemplateType === 'tln-10') {
                qGrid.innerHTML = Array.from({ length: 10 }, (_, i) => `
      <div style="display:flex;align-items:center;gap:3px;margin:1px 0;">
        <span style="font-size:8px;width:20px;text-align:right;color:var(--muted)">Câu ${i + 1}:</span>
        ${[0, 1, 2, 3].map(j => `<div style="width:12px;height:12px;border:0.5px solid #888;border-radius:2px;"></div>`).join('')}
      </div>
    `).join('');
                return;
            }
            qGrid.innerHTML = Array.from({ length: Math.min(numQ, 20) }, (_, i) => `
    <div style="display:flex;align-items:center;gap:2px;margin:1px 0;">
      <span style="font-size:8px;width:14px;text-align:right">${i + 1}.</span>
      ${['A', 'B', 'C', 'D'].map(o => `<div style="width:10px;height:10px;border:0.5px solid #888;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:6px">${o}</div>`).join('')}
    </div>
  `).join('') + (numQ > 20 ? `<div style="font-size:9px;color:#999;padding:4px">... và ${numQ - 20} câu nữa</div>` : '');
        }

        function generateSheetCmd() {
            const school = document.getElementById('genSchool').value;
            const subtitle = document.getElementById('genSubtitle').value;
            const madeRaw = document.getElementById('genMade').value;
            const copies = parseInt(document.getElementById('genCopies').value) || 1;
            const madeList = madeRaw.split(',').map(s => s.trim()).filter(Boolean);

            const templateFile = {
                'thptqg-toan': 'templates/thptqg-toan-2025.typ',
                '12-4-6ngang': 'templates/12-4-6ngang.typ', 'tn-40': 'templates/tn-40.typ',
                'tn-60': 'templates/tn-60.typ', 'ds-12': 'templates/ds-12.typ',
                'tln-10': 'templates/tln-10.typ',
                'hybrid': 'templates/hybrid-28tn-12ds.typ'
            }[selectedTemplateType] || 'templates/tn-50.typ';

            const cmds = madeList.map(made => {
                return `typst compile ${templateFile} output_sheets/phieu-made${made}.pdf --input school="${school}" --input subtitle="${subtitle}" --input made="${made}"`;
            }).join('\n');

            const pythonCmd = `# Hoặc dùng script tổng hợp:\npython3 generate_sheets.py --type ${selectedTemplateType} --school "${school}" --subtitle "${subtitle}" --made "${madeList.join(',')}"`;

            document.getElementById('genCmdText').value = cmds + '\n\n' + pythonCmd;
            document.getElementById('genOutput').style.display = 'block';
        }

        function copyCmds() {
            const text = document.getElementById('genCmdText').value;
            navigator.clipboard.writeText(text).then(() => alert('✅ Đã copy lệnh vào clipboard!'));
        }

        function downloadGenScript() {
            const text = '#!/bin/bash\n# SANG MATH OMR – Auto Generated Sheet Script\nmkdir -p output_sheets\n' + document.getElementById('genCmdText').value;
            const blob = new Blob([text], { type: 'text/plain' });
            const a = document.createElement('a');
            a.href = URL.createObjectURL(blob);
            a.download = 'generate_omr_sheets.sh';
            a.click();
        }

        function downloadTypFile() {
            const school = document.getElementById('genSchool').value;
            const subtitle = document.getElementById('genSubtitle').value;
            const hasEssay = document.getElementById('genHasEssay')?.checked;
            const code = getWasmTypstSource(selectedTemplateType, school, subtitle, hasEssay);
            const blob = new Blob([code], { type: 'text/plain' });
            const a = document.createElement('a');
            a.href = URL.createObjectURL(blob);
            a.download = `phieu_omr_${selectedTemplateType}.typ`;
            a.click();
        }

        // ---- SMART BUILDER ----
        let _builderCode = '';

        function setBuilderVal(inputId, val, pill) {
            document.getElementById(inputId).value = val;
            // highlight active pill in same group
            const group = pill.parentElement;
            group.querySelectorAll('.preset-pill').forEach(p => p.classList.remove('active-preset'));
            pill.classList.add('active-preset');
            updateBuilder();
        }

        function updateBuilder() {
            selectedTemplateType = 'custom';
            document.querySelectorAll('.tmpl-card').forEach(c => {
                if (c.getAttribute('data-type') === 'custom') c.classList.add('selected');
                else c.classList.remove('selected');
            });

            const mcq = parseInt(document.getElementById('bldMcq').value) || 0;
            const tf = parseInt(document.getElementById('bldTf').value) || 0;
            const tln = parseInt(document.getElementById('bldTln').value) || 0;
            const paper = document.querySelector('input[name="bldPaper"]:checked')?.value || 'a4';

            const total = mcq + tf * 4 + tln; // approximate items
            const maxBar = Math.max(mcq, tf, tln, 1);

            // Update preview bars
            const barMcq = document.getElementById('barMcq');
            const barTf = document.getElementById('barTf');
            const barTln = document.getElementById('barTln');
            const maxW = 85; // percent

            barMcq.style.width = mcq > 0 ? Math.max(8, (mcq / 100) * maxW) + '%' : '8%';
            barMcq.textContent = mcq + ' TN';
            barMcq.style.opacity = mcq > 0 ? '1' : '.3';

            barTf.style.width = tf > 0 ? Math.max(8, (tf / 12) * maxW) + '%' : '8%';
            barTf.textContent = tf + ' Đ/S';
            barTf.style.opacity = tf > 0 ? '1' : '.3';

            barTln.style.width = tln > 0 ? Math.max(8, (tln / 20) * maxW) + '%' : '8%';
            barTln.textContent = tln + ' TLN';
            barTln.style.opacity = tln > 0 ? '1' : '.3';

            // Estimate pages
            let pages = 1;
            if (mcq > 50 || tln > 12) pages = 2;

            const paperLabel = paper === 'a4' ? 'A4 Đứng' : 'A5 Ngang';
            document.getElementById('bldSummary').textContent =
                `Tổng: ${mcq} TN + ${tf} Đ/S + ${tln} TLN · ${paperLabel} · Ước tính ${pages} trang`;
            _builderCode = '';
            updateSheetPreview();
            // Update live preview from builder
            renderSheetPreview();
        }

        function generateBuilderCode() {
            const mcq = parseInt(document.getElementById('bldMcq').value) || 0;
            const tf = parseInt(document.getElementById('bldTf').value) || 0;
            const tln = parseInt(document.getElementById('bldTln').value) || 0;
            const paper = document.querySelector('input[name="bldPaper"]:checked')?.value || 'a4';

            _builderCode = buildTypstCode(mcq, tf, tln, paper);
            document.getElementById('builderCode').textContent = _builderCode;
            document.getElementById('builderOutput').style.display = 'block';
            document.getElementById('builderOutput').scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        }

        function copyBuilderCode() {
            navigator.clipboard.writeText(_builderCode).then(() => alert('✅ Đã copy code Typst vào clipboard!'));
        }

        function downloadBuilderTyp() {
            if (!_builderCode) generateBuilderCode();
            const blob = new Blob([_builderCode], { type: 'text/plain' });
            const a = document.createElement('a');
            a.href = URL.createObjectURL(blob);
            const mcq = document.getElementById('bldMcq').value;
            const tf = document.getElementById('bldTf').value;
            const tln = document.getElementById('bldTln').value;
            a.download = `phieu_custom_${mcq}tn_${tf}ds_${tln}tln.typ`;
            a.click();
        }

        function buildTypstCode(mcq, tf, tln, paper) {
            const school = document.getElementById('genSchool')?.value || 'SANG MATH OMR';
            const subtitle = document.getElementById('genSubtitle')?.value || 'Kiểm tra – Môn Toán';
            const hasEssay = document.getElementById('genHasEssay')?.checked;
            return genWasmTypst({ mcq, tf, tln, paper, school, subtitle, hasEssay });

            const isA5 = paper === 'a5';
            let paperStr = '';
            if (isA5) {
                paperStr = `paper: "a5",\n  flipped: true,`;
            } else {
                let contentHeightPt = 120;
                if (mcq > 0) {
                    const mcqCols = mcq <= 20 ? 2 : mcq <= 40 ? 3 : 4;
                    const perCol = Math.ceil(mcq / mcqCols);
                    contentHeightPt += perCol * 10.5 + 28;
                }
                if (tf > 0) {
                    const tfCols = Math.min(tf, 4);
                    const tfRows = Math.ceil(tf / tfCols);
                    contentHeightPt += tfRows * 72 + 15;
                }
                if (tln > 0) {
                    const tlnCols = Math.min(tln, tln <= 6 ? tln : Math.ceil(tln / 2));
                    const tlnRows = Math.ceil(tln / tlnCols);
                    contentHeightPt += tlnRows * 78 + 20;
                }
                const calculatedHeight = Math.ceil(contentHeightPt * 0.3528 + 15);
                const height = Math.min(297, Math.max(120, calculatedHeight));
                if (height < 290) {
                    paperStr = `paper: (width: 210mm, height: ${height}mm),\n  flipped: false,`;
                } else {
                    paperStr = `paper: "a4",\n  flipped: false,`;
                }
            }
            const mcqCols = mcq <= 30 ? 3 : mcq <= 50 ? 4 : 5;
            const mcqPerCol = Math.ceil(mcq / mcqCols);

            let parts = [];

            // PHẦN I – TN
            if (mcq > 0) {
                const colCode = Array.from({ length: mcqCols }, (_, ci) => {
                    const start = ci * mcqPerCol + 1;
                    const end = Math.min(start + mcqPerCol - 1, mcq);
                    if (start > mcq) return null;
                    return `    block(
      stroke: (right: if ${ci < mcqCols - 1} { 0.5pt } else { 0pt }),
      inset: 2pt,
      [
        #grid(columns: (13pt,12pt,12pt,12pt,12pt), align: center+horizon,
          tracking-marker, [*A*], [*B*], [*C*], [*D*],)
        #v(2pt)
        #grid(columns: 1, row-gutter: 1.5pt,
          ..range(${start}, ${end + 1}).map(i => mcq-row(i)))
      ]
    )`;
                }).filter(Boolean).join(',\n');

                parts.push(`    // ── PHẦN I: Trắc Nghiệm (${mcq} câu) ─────────────
    #let phan1-box = block([
      #block(inset:2pt,[*PHẦN I – TRẮC NGHIỆM (${mcq} câu)*])
      #line(length:100%, stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"))
      #grid(columns:(${Array(mcqCols).fill('1fr').join(',')}),
${colCode}
      )
    ])
    #block(stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"),radius:4pt,clip:true,width:100%,phan1-box)`);
            }

            // PHẦN II – TF
            if (tf > 0) {
                const tfCols = tf <= 2 ? tf : Math.min(4, tf);
                const tfRows = Math.ceil(tf / tfCols);
                parts.push(`
    // ── PHẦN II: Đúng/Sai (${tf} câu) ──────────────
    #block(stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"),radius:4pt,clip:true,width:100%,[
      #block(inset:(left: 4pt, top: 2pt, bottom: 2pt),[*PHẦN II – ĐÚNG / SAI (${tf} câu)*])
      #line(length:100%, stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"))
      #block(inset:(top: 2pt, bottom: 2pt, left: 4pt, right: if isA5 { 6pt } else { 2pt }), grid(columns:(${Array(Math.min(tf, 4)).fill('1fr').join(',')}), gutter:4pt,
        ..range(1,${tf + 1}).map(i => tf-q(i))
      ))
    ])`);
            }

            // PHẦN III – TLN
            if (tln > 0) {
                const tlnCols = Math.min(tln, tln <= 6 ? tln : Math.ceil(tln / 2));
                const tlnRows = Math.ceil(tln / tlnCols);
                const rowsCode = Array.from({ length: tlnRows }, (_, ri) => {
                    const start = ri * tlnCols + 1;
                    const end = Math.min(start + tlnCols - 1, tln);
                    if (start > tln) return null;
                    return `    #block(stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"),radius:4pt,clip:true,width:100%,[
      #block(inset:2pt,[*PHẦN ${ri === 0 ? 'III' : 'IV'} – TỰ LUẬN NGẮN (Câu ${start}–${end})*])
      #line(length:100%,stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"))
      #block(inset:(left:10pt,right:10pt),
        grid(columns:(${Array(end - start + 1).fill('1fr').join(',')}),
          ..range(${start},${end + 1}).map(i => tln-col(i, last-in-row: i == ${end}))
        ))
    ])`;
                }).filter(Boolean).join('\n    #v(5pt)\n');
                parts.push(`\n    // ── PHẦN III: Tự Luận Ngắn (${tln} câu) ─────────\n${rowsCode}`);
            }

            return `// SANG MATH OMR – no external imports
// ════════════════════════════════════════
// SANG MATH OMR – Custom Template
// ${mcq} TN + ${tf} Đ/S + ${tln} TLN · ${paper.toUpperCase()}
// Sinh tự động bởi Smart Builder
// ════════════════════════════════════════

#let isA5 = ${paper === 'a5'}
#let bubble-rad = if isA5 { 4.3pt } else { 5pt }
#let bubble-txt = if isA5 { 6.0pt } else { 7pt }
#let box-dim = if isA5 { 10pt } else { 11pt }
#let row-gut = if isA5 { 0.6pt } else { 1.0pt }
#let tln-inset = if isA5 { 1.2pt } else { 2.0pt }

#set page(${paperStr}
  margin: (top:5mm, bottom:5mm, left:6mm, right:6mm),)
#set text(size:8pt, font:"Times New Roman")

#let marker = box(fill:black, width:12pt, height:12pt)
#let tracking-marker = box(fill:black, width:10pt, height:10pt)
#let bubble(label) = circle(radius: bubble-rad, stroke:0.5pt+rgb("#333"), fill:white,
  align(center+horizon)[#text(size: bubble-txt, weight:"bold", fill:rgb("#444"))[#label]])

#let mcq-row(num) = grid(columns:(13pt,12pt,12pt,12pt,12pt),
  align(center+horizon)[*#num*], bubble(""), bubble(""), bubble(""), bubble(""))

#let tf-q(num) = grid(columns:(12pt,14pt,14pt), row-gutter: row-gut,
  grid.cell(rowspan:2,align:center+horizon)[#tracking-marker],
  grid.cell(colspan:2,align:center+bottom)[#text(size:7pt,weight:"bold")[Câu #num]],
  align(center)[#text(size:7pt,weight:"bold")[Đ]], align(center)[#text(size:7pt,weight:"bold")[S]],
  [a)],bubble(""),bubble(""), [b)],bubble(""),bubble(""),
  [c)],bubble(""),bubble(""), [d)],bubble(""),bubble(""),)

#let tln-col(num, last-in-row: false) = block(
  stroke:(right: if last-in-row {0pt} else {0.5pt}), width:100%,
  [#block(inset:(top: tln-inset, bottom: tln-inset, left:4pt), align(left)[#text(size:8pt)[*Câu #num*]])
   #block(inset: tln-inset, grid(columns:(12pt,)*5,
     align(center,tracking-marker),
     align(center,box(stroke:0.5pt,width: box-dim, height: box-dim)), align(center,box(stroke:0.5pt,width: box-dim, height: box-dim)),
     align(center,box(stroke:0.5pt,width: box-dim, height: box-dim)), align(center,box(stroke:0.5pt,width: box-dim, height: box-dim)),))
   #block(inset:(top: tln-inset, bottom: tln-inset, left:1pt, right:1pt),
     grid(columns:(12pt,)*5, row-gutter: row-gut,
       align(center)[-],bubble(""),[],[],[],
       align(center)[,],[],bubble(""),bubble(""),[],
       align(center)[*0*],[],bubble(""),bubble(""),bubble(""),
       ..range(1,10).map(r=>(align(center)[*#r*],bubble(""),bubble(""),bubble(""),bubble(""))).flatten(),))]
)

#let sbd-box = block(inset:(left: if isA5 { 6pt } else { 4pt }, right: if isA5 { 3pt } else { 2pt }, top: if isA5 { 1pt } else { 2pt }, bottom: if isA5 { 1pt } else { 2pt }),[
  #place(top + left, dx: -2pt, dy: -2pt)[#tracking-marker]
        #align(center)[#text(weight: "bold", size: 8pt)[SBD]]
  #v(if isA5 { 1pt } else { 2pt })
  #grid(columns:(12pt,)*6,gutter: if isA5 { 1.2pt } else { 1.5pt },
    ..range(6).map(i=>align(center,box(stroke:0.8pt+black,width:if isA5 { 10pt } else { 11pt },height:if isA5 { 10pt } else { 11pt }))))
  #v(if isA5 { 1pt } else { 2pt })
  #grid(columns:(12pt,)*6,row-gutter:if isA5 { 0.8pt } else { 1.5pt },column-gutter:1.5pt,
    ..range(10).map(r=>range(6).map(c=>align(center,bubble(str(r))))).flatten())
])
#let made-box = block(inset:(left: if isA5 { 3pt } else { 2pt }, right: if isA5 { 3pt } else { 2pt }, top: if isA5 { 1pt } else { 2pt }, bottom: if isA5 { 1pt } else { 2pt }),[
  #place(top + left, dx: -2pt, dy: -2pt)[#tracking-marker]
        #align(center)[#text(weight: "bold", size: 8pt)[Mã đề]]
  #v(if isA5 { 1pt } else { 2pt })
  #grid(columns:(12pt,)*4,gutter: if isA5 { 1.2pt } else { 1.5pt },
    align(center,box(stroke:0.8pt+black,width:if isA5 { 10pt } else { 11pt },height:if isA5 { 10pt } else { 11pt })),
    align(center,box(stroke:0.8pt+black,width:if isA5 { 10pt } else { 11pt },height:if isA5 { 10pt } else { 11pt })),
    align(center,box(stroke:0.8pt+black,width:if isA5 { 10pt } else { 11pt },height:if isA5 { 10pt } else { 11pt })),
    align(center,box(stroke:0.8pt+black,width:if isA5 { 10pt } else { 11pt },height:if isA5 { 10pt } else { 11pt })))
  #v(if isA5 { 1pt } else { 2pt })
  #grid(columns:(12pt,)*4,row-gutter:if isA5 { 0.8pt } else { 1.5pt },column-gutter:1.5pt,
    ..range(10).map(r=>range(4).map(c=>align(center,bubble(str(r))))).flatten())
])

#align(if isA5 { center + horizon } else { top + center })[
  #scale(x: if isA5 { 88% } else { 95% }, y: if isA5 { 88% } else { 95% }, origin: if isA5 { center } else { top })[
    #place(top+left,dx:-5mm,dy:-5mm,marker)
    #place(top+right,dx:5mm,dy:-5mm,marker)
    #place(bottom+left,dx:-5mm,dy:5mm,marker)
    #place(bottom+right,dx:5mm,dy:5mm,marker)
    #v(2pt)

    // Header
    #block(width:100%,stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"),radius:4pt,clip:true,
      grid(columns:(auto,auto,1fr),
        sbd-box,
        block(stroke:(left:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"),right:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed")),made-box),
        block(inset:(left:4pt,right:4pt,top:2pt,bottom:2pt),[
          #place(top+right,dx:0pt,dy:-2pt)[#box(width:1cm,height:1cm,stroke:0.5pt)]
          #align(left)[#text(size:10pt,weight:"bold")[PHIẾU TRẢ LỜI TRẮC NGHIỆM]]
          #v(2pt)
          Họ và tên: .............................................#v(2pt)
          Lớp: .............. Môn: .............. Điểm: ......
        ])
      )
    )
    #v(if isA5 { -2pt } else { 5pt })

${parts.join('\n    #v(if isA5 { -2pt } else { 5pt })\n')}
  ]
]
`;
        }

        // ---- INIT ----
        const savedKey = localStorage.getItem('geminiApiKey');
        if (savedKey) document.getElementById('geminiApiKey').value = savedKey;
        document.getElementById('geminiApiKey').addEventListener('change', function () {
            localStorage.setItem('geminiApiKey', this.value.trim());
        });

        // Render initial preview on load
        document.addEventListener('DOMContentLoaded', () => {
            activateTypstWasm();
        });
        // Also fire immediately in case DOM is already loaded
        try { activateTypstWasm(); } catch (e) { }

        function exportGradedPDF() {
            const canvas = document.getElementById('canvasOutput');
            if (!canvas || canvas.width === 0) return alert('Chưa có ảnh kết quả!');

            const { jsPDF } = window.jspdf;
            const pdf = new jsPDF({
                orientation: 'portrait',
                unit: 'mm',
                format: 'a4'
            });

            // A4 size: 210 x 297 mm
            const pdfW = 210;
            const pdfH = 297;

            const imgData = canvas.toDataURL('image/jpeg', 0.9);
            pdf.addImage(imgData, 'JPEG', 0, 0, pdfW, pdfH);
            pdf.save(`Ket_Qua_Cham_${new Date().getTime()}.pdf`);
        }

        buildAnswerGrid(50);
        setupUpload();
        updateSheetPreview();

        document.getElementById('genSchool').addEventListener('input', () => { updateSheetPreview(); refreshPreview(); });
        document.getElementById('genSubtitle').addEventListener('input', () => { updateSheetPreview(); refreshPreview(); });
        document.getElementById('genHasEssay').addEventListener('change', refreshPreview);

        document.getElementById('bldMcq').addEventListener('input', updateBuilder);
        document.getElementById('bldTf').addEventListener('input', updateBuilder);
        document.getElementById('bldTln').addEventListener('input', updateBuilder);
        document.querySelectorAll('input[name="bldPaper"]').forEach(r => r.addEventListener('change', updateBuilder));

        // Pure JS Engine: removed
    