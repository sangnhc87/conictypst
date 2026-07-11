
// ---- STATE ----
const correctAnswers = {};
const OPTIONS = ["A","B","C","D"];
let uploadedFiles = [];      // Batch: list of {file, imgEl}
let gradeResults = [];       // All grading results
let studentList = [];        // Imported class list
let selectedTemplate = "12-4-6ngang";
let currentTemplate = TEMPLATES["12-4-6ngang"];
let currentNumQ = 50;



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
    ['13','14','15','16'].forEach(q => {
      ['a','b','c','d'].forEach(lbl => {
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
    ['13','14','15','16'].forEach(q => {
      ['a','b','c','d'].forEach(lbl => {
        ['Đ','S'].forEach(v => document.getElementById(`tf-${q}-${lbl}-${v}`)?.classList.remove('active'));
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

function onSheetTypeChange() {
  const type = document.getElementById('sheetTypeGrade').value;
  const numMap = { '12-4-6ngang': 50, 'tn-40': 40, 'tn-60': 60, 'thptqg-toan': 12, '12-4-6ngang': 12 };
  buildAnswerGrid(numMap[type] || 50);
  currentTemplate = TEMPLATES[type] || TEMPLATES['12-4-6ngang'];
  currentNumQ = numMap[type] || 50;
  // Show/hide TF and TLN sections based on template type
  const isMixed = (type === 'thptqg-toan' || type === '12-4-6ngang');
  document.getElementById('tfAnswerSection')?.remove();
  if (isMixed) buildTFAnswerGrid();
  document.getElementById('tlnAnswerSection')?.remove();
  if (isMixed) buildTLNAnswerGrid();
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
const tfAnswerKey = {};   // { "13": {a:'Đ',b:'S',c:'Đ',d:'Đ'}, ... }
const tlnAnswerKey = {};  // { "17": "2.5", ... }

function buildTFAnswerGrid() {
  const container = document.getElementById('answersGrid').parentNode;
  const div = document.createElement('div');
  div.id = 'tfAnswerSection';
  div.style.marginTop = '14px';
  div.innerHTML = `<div style="font-size:12px;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:.5px;margin-bottom:8px;">
    📋 Phần II – Đáp án Đúng/Sai (Câu 13–16)
  </div>`;
  ['13','14','15','16'].forEach(q => {
    tfAnswerKey[q] = {a:'',b:'',c:'',d:''};
    const row = document.createElement('div');
    row.style.cssText = 'display:flex;align-items:center;gap:6px;margin-bottom:6px;';
    row.innerHTML = `<span style="font-size:12px;font-weight:700;color:var(--muted);width:28px">C${q}:</span>`;
    ['a','b','c','d'].forEach(lbl => {
      const wrap = document.createElement('span');
      wrap.style.cssText = 'display:flex;align-items:center;gap:3px;font-size:11px;';
      wrap.innerHTML = `(${lbl})`;
      ['Đ','S'].forEach(val => {
        const btn = document.createElement('button');
        btn.className = 'opt-btn'; btn.style.width='28px'; btn.style.height='26px'; btn.style.fontSize='10px';
        btn.textContent = val; btn.id = `tf-${q}-${lbl}-${val}`;
        btn.onclick = () => {
          ['Đ','S'].forEach(v => document.getElementById(`tf-${q}-${lbl}-${v}`)?.classList.remove('active'));
          btn.classList.add('active');
          tfAnswerKey[q][lbl] = val;
        };
        wrap.appendChild(btn);
      });
      row.appendChild(wrap);
    });
    div.appendChild(row);
  });
  container.appendChild(div);
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
gradeBtn.addEventListener('click', function() {
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
          if (bstatus) { bstatus.textContent = 'Đang chấm...'; bstatus.className='status status-pending'; }
          
          const fullAnswers = { 
            mcq: correctAnswers, 
            tf: (sheetType === 'thptqg-toan' || sheetType === '12-4-6ngang') ? tfAnswerKey : {}, 
            tln: (sheetType === 'thptqg-toan' || sheetType === '12-4-6ngang') ? tlnAnswerKey : {} 
          };
          const engine = document.getElementById('gradeEngine').value;
          const result = await window.OmrEngine.gradeImage(entry.imgEl, template, fullAnswers, apiKey, sheetType, engine);
          result.filename = entry.name;
          result.timestamp = new Date().toLocaleString('vi-VN');
          gradeResults.push(result);

          if (result.warnings && result.warnings.length > 0) {
             const ctx = new (window.AudioContext || window.webkitAudioContext)();
             const osc = ctx.createOscillator();
             osc.type = 'sine'; osc.frequency.setValueAtTime(440, ctx.currentTime);
             osc.connect(ctx.destination); osc.start(); osc.stop(ctx.currentTime + 0.3);
             
             const confirmMsg = `CẢNH BÁO TỪ BÀI [${entry.name}]:\n- ${result.warnings.join('\n- ')}\n\nGiáo viên có muốn tiếp tục chấm không? Bấm OK để tiếp tục, hoặc Cancel để xem lại chi tiết bài này.`;
             if (!confirm(confirmMsg)) {
                 btn.disabled = false;
                 spinner.style.display = 'none';
                 if (bstatus) { bstatus.textContent = 'Dừng'; bstatus.className='status status-err'; }
                 showSingleResult(result);
                 return;
             }
          }

          if (bstatus) { bstatus.textContent = result.score; bstatus.className='status status-ok'; }

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
          if (bstatus) { bstatus.textContent = 'Lỗi'; bstatus.className='status status-err'; }
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

  const expSbd = document.getElementById('expectedSbd').value;
  const expMade = document.getElementById('expectedMade').value;
  let matchTxt = '✅ Khớp hoàn toàn', matchClr = 'var(--green)';
  if (expSbd && result.sbd !== expSbd) { matchTxt = `⚠️ Lệch SBD (${result.sbd})`; matchClr = 'var(--orange)'; }
  else if (expMade && result.made !== expMade) { matchTxt = `⚠️ Lệch Mã đề (${result.made})`; matchClr = 'var(--orange)'; }
  document.getElementById('resMatch').textContent = matchTxt;
  document.getElementById('resMatch').style.color = matchClr;

  const sc = parseFloat(result.score);
  const circle = document.getElementById('scoreCircle');
  circle.style.display = 'flex';
  circle.className = 'score-circle' + (sc >= 8 ? ' success' : '');
  
  document.getElementById('resultsCard').style.display = 'flex';
  document.getElementById('resultsCard').style.flexDirection = 'column';
}


function exportSingleResult() {
  if (gradeResults.length === 0) return;
  const r = gradeResults[gradeResults.length - 1];
  const text = `SBD: ${r.sbd}\nMã đề: ${r.made}\nĐiểm: ${r.score}\nĐúng: ${r.correct || r.mcqCorrect}/${r.total || r.mcqTotal}`;
  const blob = new Blob([text], {type:'text/plain'});
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
  a.download = "ChamDiem_" + (result.filename || "KetQua").replace(/\.[^/.]+$/, "") + ".jpg";
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
}

// ---- STATS ----
function renderStats() {
  const total = gradeResults.length;
  document.getElementById('statTotal').textContent = total;
  if (total === 0) return;

  const scores = gradeResults.map(r => parseFloat(r.score));
  const avg = (scores.reduce((a,b)=>a+b,0) / total).toFixed(2);
  const pass = ((scores.filter(s=>s>=5).length / total) * 100).toFixed(0);
  document.getElementById('statAvg').textContent = avg;
  document.getElementById('statPass').textContent = pass + '%';

  // Distribution chart
  const buckets = Array(10).fill(0);
  scores.forEach(s => { const b = Math.min(9, Math.floor(s)); buckets[b]++; });
  const maxB = Math.max(...buckets, 1);
  const colors = ['#c0392b','#c0392b','#e67e22','#e67e22','#f1c40f','#27ae60','#27ae60','#3498db','#3498db','#9b59b6'];
  const labels = ['0','1','2','3','4','5','6','7','8','9-10'];
  const chartHtml = buckets.map((cnt, i) => `
    <div class="chart-row">
      <div class="chart-label">${labels[i]}</div>
      <div class="chart-bar-bg">
        <div class="chart-bar" style="width:${(cnt/maxB*100).toFixed(0)}%;background:${colors[i]}">
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
                  sc >= 5   ? '<span class="grade-c">TB</span>' :
                              '<span class="grade-d">Yếu</span>';
    const student = studentList.find(s => s.sbd === r.sbd);
    const name = student ? student.name : '—';
    return `<tr>
      <td>${i+1}</td>
      <td><strong>${r.sbd}</strong></td>
      <td>${name}</td>
      <td>${r.made}</td>
      <td><strong>${r.score}</strong></td>
      <td>${r.correct}/${r.total}</td>
      <td>${grade}</td>
    </tr>`;
  }).join('');
}

function clearAllResults() {
  if (!confirm('Xoá toàn bộ kết quả chấm bài?')) return;
  gradeResults = [];
  renderStats();
}

// ---- EXPORT CSV ----
function exportCSV() {
  if (gradeResults.length === 0) return alert('Chưa có kết quả để xuất.');
  const header = 'STT,SBD,Họ tên,Mã đề,Điểm,Đúng,Tổng câu,Thời gian\n';
  const rows = gradeResults.map((r, i) => {
    const student = studentList.find(s => s.sbd === r.sbd);
    const name = student ? student.name : '';
    return `${i+1},${r.sbd},${name},${r.made},${r.score},${r.correct},${r.total},${r.timestamp}`;
  }).join('\n');
  const blob = new Blob(['\uFEFF' + header + rows], {type:'text/csv'});
  const a = document.createElement('a');
  a.href = URL.createObjectURL(blob);
  a.download = `bang-diem-${new Date().toLocaleDateString('vi-VN').replace(/\//g,'-')}.csv`;
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
    return { sbd: (parts[0]||'').trim(), name: (parts[1]||'').trim(), cls: (parts[2]||'').trim() };
  }).filter(s => s.sbd);
  renderClassTable();
}

document.getElementById('csvInput').addEventListener('change', function() {
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
    return `<tr><td>${i+1}</td><td>${s.sbd}</td><td>${s.name}</td><td>${s.cls}</td><td>${scoreCell}</td></tr>`;
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

const TYPST_VER  = '0.7.0';
const TYPST_BASE = 'https://cdn.jsdelivr.net/npm/@myriaddreamin';
const TYPST_BUNDLE_URL = `${TYPST_BASE}/typst.ts@${TYPST_VER}/dist/esm/contrib/all-in-one-lite.bundle.js`;
const TYPST_COMPILER_WASM_URL = `${TYPST_BASE}/typst-ts-web-compiler@${TYPST_VER}/pkg/typst_ts_web_compiler_bg.wasm`;
const TYPST_RENDERER_WASM_URL = `${TYPST_BASE}/typst-ts-renderer@${TYPST_VER}/pkg/typst_ts_renderer_bg.wasm`;

let typstState  = 'idle';   // idle | loading | ready | error
let typstEngine = null;
let activePreviewMode = 'canvas';

// ── Mode switcher ─────────────────────────────────────────────
function setPreviewMode(mode) {
  activePreviewMode = mode;
  const isCanvas = mode === 'canvas';
  document.getElementById('panelCanvas').style.display = isCanvas ? '' : 'none';
  document.getElementById('panelWasm').style.display   = isCanvas ? 'none' : '';
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
  if (typstState === 'error')   { wasmUI('❌ Lỗi – thử lại?', '#f87171', false); return; }

  typstState = 'loading';
  wasmUI('⏳ Đang tải Typst WASM (~6MB)…', '#f8c471', true);
  document.getElementById('tabWasm').textContent = '⏳ Đang tải…';

  try {
    // Load the ESM all-in-one bundle (sets window.$typst)
    await new Promise((resolve, reject) => {
      const s = document.createElement('script');
      s.type = 'module';
      s.src = TYPST_BUNDLE_URL;
      s.onload = resolve;
      s.onerror = () => reject(new Error('Không tải được bundle từ CDN'));
      document.head.appendChild(s);
    });

    // Wait for $typst global to appear (bundle might be async)
    await new Promise((resolve, reject) => {
      const t0 = Date.now();
      const check = setInterval(() => {
        if (window.$typst) { clearInterval(check); resolve(); }
        if (Date.now() - t0 > 15000) { clearInterval(check); reject(new Error('Timeout chờ $typst')); }
      }, 100);
    });

    wasmUI('⏳ Khởi tạo compiler…', '#f8c471', true);

    // Initialize with WASM binary
    window.$typst.setCompilerInitOptions({
      getModule: () =>
        WebAssembly.compileStreaming(fetch(TYPST_COMPILER_WASM_URL, { cache: 'force-cache' }))
    });
    window.$typst.setRendererInitOptions({
      getModule: () =>
        WebAssembly.compileStreaming(fetch(TYPST_RENDERER_WASM_URL, { cache: 'force-cache' }))
    });

    typstEngine = window.$typst;
    typstState  = 'ready';
    wasmUI('✅ Typst WASM sẵn sàng', '#4ade80', false);
    document.getElementById('tabWasm').textContent = '⚡ Typst WASM';
    document.getElementById('wasmVersion').textContent = 'v' + TYPST_VER;

    // Auto render current template
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
  if (typstState !== 'ready' || !typstEngine) return;

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
      const svgString = await typstEngine.svg({ mainContent: src });

      container.innerHTML = svgString;
      // Make SVG fill width and be responsive
      const svgEl = container.querySelector('svg');
      if (svgEl) {
        svgEl.style.width  = '100%';
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
function buildWasmPreviewTypst() {
  const presets = {
    '12-4-6ngang': { mcq:12, tf:4, tln:6, paper:'a5' },
    'thptqg-toan': { mcq:12, tf:4, tln:6, paper:'a4' },
    'tn-40':  { mcq:40, tf:0, tln:0, paper:'a4' },
    'tn-60':  { mcq:60, tf:0, tln:0, paper:'a4' },
    'ds-12':  { mcq:0,  tf:0, tln:12, paper:'a4' },
    'tln-10': { mcq:0,  tf:0, tln:10, paper:'a4' },
  };

  let cfg = presets[selectedTemplateType] || {
    mcq:   parseInt(document.getElementById('bldMcq')?.value)  || 12,
    tf:    parseInt(document.getElementById('bldTf')?.value)   || 4,
    tln:   parseInt(document.getElementById('bldTln')?.value)  || 6,
    paper: document.querySelector('input[name="bldPaper"]:checked')?.value || 'a4',
    handwritten: document.getElementById('bldHandwritten')?.checked ?? true,
  };

  const school   = document.getElementById('genSchool')?.value   || 'SANG MATH OMR';
  const subtitle = document.getElementById('genSubtitle')?.value || 'Kiểm tra – Môn Toán';

  return genWasmTypst({ ...cfg, school, subtitle });
}

function genWasmTypst({ mcq, tf, tln, paper, school, subtitle, handwritten, realQr }) {
  const isA5 = paper === 'a5';
  const cols = mcq <= 20 ? 2 : mcq <= 40 ? 3 : 4;
  const perCol = mcq > 0 ? Math.ceil(mcq / cols) : 0;

  // Build TN section
  let tnSection = '';
  if (mcq > 0) {
    let tnColsArr = [];
    for (let ci = 0; ci < cols; ci++) {
      let colContent = `#align(center)[#grid(columns: (18pt, 14pt, 14pt, 14pt, 14pt), row-gutter: 4pt, align: horizon,\n`;
      colContent += `  [], [#align(center)[#text(6pt)[A]]], [#align(center)[#text(6pt)[B]]], [#align(center)[#text(6pt)[C]]], [#align(center)[#text(6pt)[D]]],\n`;
      for (let qi = 0; qi < perCol; qi++) {
        const qnum = ci * perCol + qi + 1;
        if (qnum <= mcq) {
          colContent += `  [#align(right)[#text(7pt)[${qnum}.]]], [#align(center)[#circle(radius:5pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:5pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:5pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:5pt,stroke:.4pt)[]]],\n`;
        }
      }
      colContent += `)]`;
      tnColsArr.push(`[#pad(x: 4pt, y: 6pt)[${colContent}]]`);
    }
    tnSection = `
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, [
  #rect(fill:luma(240), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN I – TRẮC NGHIỆM (${mcq} câu, chọn 1 đáp án)]]])
  #grid(columns: (1fr,) * ${cols}, stroke: (x,y) => if x > 0 { (left: 0.3pt) } else { none },
    ${tnColsArr.join(',\n    ')}
  )
])`;
  }

  // Build TF section
  let tfSection = '';
  if (tf > 0) {
    const tfCols = Math.min(tf, 4);
    const stmts = ['a)', 'b)', 'c)', 'd)'];
    let tfColsArr = [];
    for (let ci = 0; ci < tfCols; ci++) {
      let colContent = `#align(center)[#text(7pt, weight:"bold")[Câu ${ci+1}]]\n`;
      colContent += `#v(4pt)\n`;
      colContent += `#align(center)[#grid(columns: (12pt, 16pt, 16pt), row-gutter: 6pt, align: horizon,\n`;
      colContent += `  [], [#align(center)[#text(6pt)[Đ]]], [#align(center)[#text(6pt)[S]]],\n`;
      for (let si = 0; si < 4; si++) {
        colContent += `  [#align(right)[#text(6pt)[${stmts[si]}]]], [#align(center)[#circle(radius:5pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:5pt,stroke:.4pt)[]]],\n`;
      }
      colContent += `)]`;
      tfColsArr.push(`[#pad(x: 4pt, y: 6pt)[${colContent}]]`);
    }

    tfSection = `
#v(4pt)
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, [
  #rect(fill:luma(240), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN II – ĐÚNG / SAI (${tf} câu, 4 ý a/b/c/d)]]])
  #grid(columns: (1fr,) * ${tfCols}, stroke: (x,y) => if x > 0 { (left: 0.3pt) } else { none },
    ${tfColsArr.join(',\n    ')}
  )
])`;
  }

  // Build TLN section
  let tlnSection = '';
  if (tln > 0) {
    const tlnCols = Math.min(tln, tln <= 6 ? tln : Math.ceil(tln/2));
    const rows    = Math.ceil(tln / tlnCols);
    let parts = '';
    for (let r = 0; r < rows; r++) {
      const start = r * tlnCols + 1;
      const end   = Math.min(start + tlnCols - 1, tln);
      const cnt   = end - start + 1;
      
      let tlnColsArr = [];
      for (let ci = 0; ci < cnt; ci++) {
        let colContent = `#align(center)[#text(7pt,weight:"bold")[Câu ${start+ci}]]\n`;
        colContent += `#v(2pt)\n`;
        colContent += `#align(center)[#box(fill:black,width:8pt,height:8pt) #h(2pt) ${Array.from({length:4},(_,b)=>`#box(width:9pt,height:9pt,stroke:.5pt)[]`).join(' #h(1pt) ')}]\n`;
        colContent += `#v(4pt)\n`;
        colContent += `#align(center)[#grid(columns: (10pt, 13pt, 13pt, 13pt, 13pt), row-gutter: 4pt, align: horizon,\n`;
        for (let row = 0; row < 12; row++) {
          const label = row === 0 ? '-' : row === 1 ? ',' : String(row - 2);
          colContent += `  [#align(right)[#text(5.5pt, fill: rgb("#444"))[${label}]]], [#align(center)[#circle(radius:4pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:4pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:4pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:4pt,stroke:.4pt)[]]],\n`;
        }
        colContent += `)]`;
        tlnColsArr.push(`[#pad(x: 2pt, y: 4pt)[${colContent}]]`);
      }

      parts += `
  #v(4pt)
  #block(width:100%, stroke:0.8pt, radius:4pt, clip:true, [
    #rect(fill:luma(240), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN ${r===0?'III':'IV'} – TỰ LUẬN NGẮN (Câu ${start}–${end})]]])
    #grid(columns: (1fr,) * ${cnt}, stroke: (x,y) => if x > 0 { (left: 0.3pt) } else { none },
      ${tlnColsArr.join(',\n      ')}
    )
  ])`;
    }
    tlnSection = parts;
  }

  return `${realQr ? '#import "@preview/cades:0.3.1": qr-code\n' : ''}// Preview-safe Typst – no external packages
// Generated by Sang Math OMR

#set page(
  paper: "${isA5 ? 'a5' : 'a4'}",
  flipped: ${isA5},
  margin: (top:5mm, bottom:5mm, left:6mm, right:6mm),
)
#set text(size: 8pt, lang: "vi")

// Corner markers
#place(top+left,   dx:-1mm, dy:-1mm, square(size:10pt, fill:black))
#place(top+right,  dx:1mm,  dy:-1mm, square(size:10pt, fill:black))
#place(bottom+left,  dx:-1mm, dy:1mm, square(size:10pt, fill:black))
#place(bottom+right, dx:1mm,  dy:1mm, square(size:10pt, fill:black))

// ── HEADER ──────────────────────────────────────────────────
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, [
  #grid(columns:(86pt, 54pt, 1fr, 30pt), gutter:0pt, stroke: (x,y) => if x > 0 and x < 3 { (left: 0.5pt) } else { none },
    grid.cell([
      #pad(x: 2pt, y: 4pt)[
        #align(center)[#text(7pt, weight:"bold")[SỐ BÁO DANH]]
        #v(4pt)
        #align(center)[#grid(columns:(1fr,)*6, row-gutter:2pt, align:center, ..range(6).map(_=>[#rect(width:10pt,height:10pt,stroke:.6pt)]))]
        #v(4pt)
        #align(center)[#grid(columns:(1fr,)*6, row-gutter:3pt, align:center, ..range(10).map(r => range(6).map(_=>[#circle(radius:4pt,stroke:.4pt)[]])).flatten())]
      ]
    ]),
    grid.cell([
      #pad(x: 2pt, y: 4pt)[
        #align(center)[#text(7pt, weight:"bold")[MÃ ĐỀ THI]]
        #v(4pt)
        #align(center)[#grid(columns:(1fr,)*3, row-gutter:2pt, align:center, ..range(3).map(_=>[#rect(width:10pt,height:10pt,stroke:.6pt)]))]
        #v(4pt)
        #align(center)[#grid(columns:(1fr,)*3, row-gutter:3pt, align:center, ..range(10).map(r => range(3).map(_=>[#circle(radius:4pt,stroke:.4pt)[]])).flatten())]
      ]
    ]),
    grid.cell([
      #pad(x:6pt, y: 4pt)[
        #text(9pt, weight:"bold", fill:rgb("#c0392b"))[PHIẾU TRẢ LỜI TRẮC NGHIỆM]
        #v(2pt)
        #text(7pt)[${school}]\\
        #text(7pt)[Họ và tên: \\....................................................................] \\
        #text(7pt)[Lớp: ........................ Môn: ........................ Điểm: ..............]
      ]
    ]),
    grid.cell([
      #pad(x: 4pt, y: 16pt)[
        #align(center)[
          ${realQr ? `#qr-code("OMR: SANG MATH|Mã đề", width: 24pt)` : `#rect(fill: luma(220), width: 24pt, height: 24pt, stroke: none)[
            #align(center+horizon)[#text(5pt, fill: luma(100))[QR]]
          ]`}
        ]
      ]
    ])
  )
])
${tnSection}
${tfSection}
${tlnSection}

${handwritten !== false ? `
// ── TỰ LUẬN VIẾT TAY ────────────────────────────────────────
#v(4pt)
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, fill:luma(252), [
  #rect(fill:luma(238), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, fill:gray)[✍ PHẦN TỰ LUẬN – Viết bên dưới]]])
  #v(4pt)
  #set par(leading: 14pt)
  #for _ in range(${Math.floor(isA5 ? 4 : 8)}) [
    #line(length:100%, stroke:(thickness:.3pt, dash:"dashed", paint:luma(200))) \\\\
  ]
  #v(4pt)
])` : ''}
`;
}

// ── Zoom SVG ──────────────────────────────────────────────────
function zoomSvgPreview() {
  const src = document.getElementById('svgPreviewContainer').innerHTML;
  const modal = document.getElementById('svgZoomModal');
  const content = document.getElementById('svgZoomContent');
  content.innerHTML = src;
  const svgEl = content.querySelector('svg');
  if (svgEl) { svgEl.style.width='100%'; svgEl.style.height='auto'; }
  modal.style.display = 'flex';
}
function closeSvgZoom() {
  document.getElementById('svgZoomModal').style.display = 'none';
}

// ── Download active preview ───────────────────────────────────
function downloadActivePreview() {
  if (activePreviewMode === 'canvas') {
    downloadPreviewPNG();
  } else {
    // Download SVG
    const svgEl = document.querySelector('#svgPreviewContainer svg');
    if (!svgEl) return alert('Chưa có preview WASM!');
    const blob = new Blob([svgEl.outerHTML], { type:'image/svg+xml' });
    const a = document.createElement('a');
    a.href = URL.createObjectURL(blob);
    a.download = `preview_typst_${Date.now()}.svg`;
    a.click();
  }
}

// ============================================================
// CANVAS LIVE PREVIEW RENDERER
// ============================================================
const PV = {
  // Draws a complete sheet preview onto a canvas
  draw(canvas, cfg) {
    const { type, mcq, tf, tln, paper, school, subtitle } = cfg;
    const isLandscape = paper === 'a5';
    const W = isLandscape ? 1050 : 744;
    const H = isLandscape ? 744 : 1052;

    // ── Fix HiDPI/Retina blurriness ──
    const dpr = window.devicePixelRatio || 1;
    canvas.width  = W * dpr;
    canvas.height = H * dpr;
    canvas.style.width  = W + 'px';
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
    [[16,16],[W-16-mk,16],[16,H-16-mk],[W-16-mk,H-16-mk]].forEach(([x,y]) => {
      g.fillRect(x,y,mk,mk);
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
    g.fillStyle = '#f5f5f5';
    g.fillRect(pad+1, y+1, sbdW, headerH-2);
    g.strokeStyle = '#555'; g.lineWidth = 0.5;
    g.strokeRect(pad+sbdW, y, 0, headerH);
    this._label(g, 'SBD', pad + sbdW/2, y + 10, 8, 'bold', '#222');
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
        g.beginPath(); g.arc(cx2, cy, 1.5, 0, 2*Math.PI); g.stroke();
      }
    }

    // MADE block
    const madeW = 54;
    const mx = pad + sbdW;
    g.fillStyle = '#f5f5f5';
    g.fillRect(mx+1, y+1, madeW, headerH-2);
    g.strokeStyle = '#555'; g.lineWidth = 0.5;
    g.strokeRect(mx+madeW, y, 0, headerH);
    this._label(g, 'Mã đề', mx + madeW/2, y + 10, 7, 'bold', '#222');
    for (let i = 0; i < 3; i++) {
      const bx = mx + 6 + i * 13;
      g.strokeStyle = '#333'; g.lineWidth = 0.7;
      g.strokeRect(bx, y + 14, 10, 10);
    }
    for (let r = 0; r < 10; r++) {
      for (let c = 0; c < 3; c++) {
        const cx2 = mx + 12 + c * 13, cy = y + 30 + r * 4;
        g.strokeStyle = '#777'; g.lineWidth = 0.4;
        g.beginPath(); g.arc(cx2, cy, 1.5, 0, 2*Math.PI); g.stroke();
      }
    }

    // Info block
    const ix = mx + madeW;
    const infoW = cw - sbdW - madeW;
    g.font = 'bold 10px Arial'; g.fillStyle = '#c0392b'; g.textAlign = 'left';
    g.fillText('PHIẾU TRẢ LỜI TRẮC NGHIỆM', ix + 8, y + 16);
    g.font = '7.5px Arial'; g.fillStyle = '#333';
    g.fillText(school || 'SANG MATH OMR', ix + 8, y + 26);
    g.fillText('Họ và tên: .................................', ix + 8, y + 40);
    g.fillText(`Lớp: ........... Môn: ........... Điểm: .....`, ix + 8, y + 52);
    // Mini QR stub
    g.fillStyle = '#ddd'; g.fillRect(ix + infoW - 30, y + 4, 24, 24);
    g.font = '5px Arial'; g.fillStyle = '#999'; g.textAlign = 'center';
    g.fillText('QR', ix + infoW - 18, y + 18);

    y += headerH + 6;

    // ── PHẦN I: TN ──────────────────────────────────────────
    if (mcq > 0) {
      const cols = mcq <= 20 ? 2 : mcq <= 40 ? 3 : 4;
      const per = Math.ceil(mcq / cols);
      const rowH = per * 10 + 24;
      g.strokeStyle = '#222'; g.lineWidth = 1.2;
      g.strokeRect(pad, y, cw, rowH);
      g.fillStyle = '#f0f0f0'; g.fillRect(pad+1, y+1, cw-2, 14);
      this._label(g, `PHẦN I – TRẮC NGHIỆM (${mcq} câu)`, pad + cw/2, y + 10, 7.5, 'bold', '#222');
      g.strokeStyle = '#aaa'; g.lineWidth = 0.5;
      g.beginPath(); g.moveTo(pad, y+14); g.lineTo(pad+cw, y+14); g.stroke();

      const colW = cw / cols;
      for (let ci = 0; ci < cols; ci++) {
        const xs = pad + ci * colW + 4;
        if (ci > 0) { g.strokeStyle='#ccc'; g.lineWidth=0.5; g.beginPath(); g.moveTo(pad+ci*colW,y+14); g.lineTo(pad+ci*colW,y+rowH); g.stroke(); }
        // Header row A B C D
        ['A','B','C','D'].forEach((l,li) => {
          g.font='6px Arial'; g.fillStyle='#555'; g.textAlign='center';
          g.fillText(l, xs + 14 + li*7, y + 22);
        });
        for (let qi = 0; qi < per; qi++) {
          const qnum = ci * per + qi + 1;
          if (qnum > mcq) break;
          const qy = y + 26 + qi * 10;
          g.font='6px Arial'; g.fillStyle='#222'; g.textAlign='right';
          g.fillText(qnum+'.', xs + 10, qy + 5);
          for (let oi = 0; oi < 4; oi++) {
            g.strokeStyle='#777'; g.lineWidth=0.4;
            g.beginPath(); g.arc(xs + 14 + oi*7 + 2.5, qy+3, 2.5, 0, 2*Math.PI); g.stroke();
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
      g.fillStyle = '#f0f0f0'; g.fillRect(pad+1, y+1, cw-2, 14);
      this._label(g, `PHẦN II – ĐÚNG / SAI (${tf} câu)`, pad + cw/2, y + 10, 7.5, 'bold', '#222');
      g.strokeStyle = '#aaa'; g.lineWidth = 0.5;
      g.beginPath(); g.moveTo(pad, y+14); g.lineTo(pad+cw, y+14); g.stroke();

      const tfW = cw / tfCols;
      for (let ci = 0; ci < tfCols; ci++) {
        if (ci >= tf) break;
        const xs = pad + ci * tfW;
        if (ci > 0) { g.strokeStyle='#ccc'; g.lineWidth=0.5; g.beginPath(); g.moveTo(xs,y+14); g.lineTo(xs,y+tfH); g.stroke(); }
        this._label(g, `Câu ${ci+1}`, xs + tfW/2, y + 22, 7, 'bold', '#333');
        // Đ S header
        ['Đ','S'].forEach((l,li) => {
          g.font='6px Arial'; g.fillStyle='#555'; g.textAlign='center';
          g.fillText(l, xs + tfW/2 + (li===0?-8:8), y + 30);
        });
        // a b c d rows
        ['a)','b)','c)','d)'].forEach((l,ri) => {
          const ry = y + 36 + ri * 8;
          g.font='6px Arial'; g.fillStyle='#666'; g.textAlign='right';
          g.fillText(l, xs + tfW/2 - 14, ry + 4);
          [0,1].forEach(oi => {
            g.strokeStyle='#777'; g.lineWidth=0.4;
            g.beginPath(); g.arc(xs + tfW/2 + (oi===0?-8:8), ry+2, 2.5, 0, 2*Math.PI); g.stroke();
          });
        });
      }
      y += tfH + 5;
    }

    // ── PHẦN III: TLN ───────────────────────────────────────
    if (tln > 0) {
      const tlnCols = Math.min(tln, tln <= 6 ? tln : Math.ceil(tln/2));
      const rows = Math.ceil(tln / tlnCols);
      for (let ri = 0; ri < rows; ri++) {
        const start = ri * tlnCols;
        const end = Math.min(start + tlnCols, tln);
        const count = end - start;
        const tlnH = 75;
        g.strokeStyle = '#222'; g.lineWidth = 1.2;
        g.strokeRect(pad, y, cw, tlnH);
        g.fillStyle = '#f0f0f0'; g.fillRect(pad+1, y+1, cw-2, 14);
        this._label(g, `PHẦN ${ri===0?'III':'IV'} – TỰ LUẬN NGẮN (Câu ${start+1}–${end})`, pad + cw/2, y + 10, 7.5, 'bold', '#222');
        g.strokeStyle = '#aaa'; g.lineWidth = 0.5;
        g.beginPath(); g.moveTo(pad, y+14); g.lineTo(pad+cw, y+14); g.stroke();

        const tlnW = cw / count;
        for (let ci = 0; ci < count; ci++) {
          const xs = pad + ci * tlnW;
          if (ci > 0) { g.strokeStyle='#ccc'; g.lineWidth=0.5; g.beginPath(); g.moveTo(xs,y+14); g.lineTo(xs,y+tlnH); g.stroke(); }
          this._label(g, `Câu ${start+ci+1}`, xs + tlnW/2, y + 23, 7, 'bold', '#333');
          // Tracking + 4 boxes
          g.fillStyle='#111'; g.fillRect(xs+4, y+26, 6, 6);
          for (let bi = 0; bi < 4; bi++) {
            g.strokeStyle='#444'; g.lineWidth=0.6;
            g.strokeRect(xs+12+bi*9, y+26, 7, 7);
          }
          // Bubbles 0-9 for 4 cols
          for (let r = 0; r < 12; r++) {
            const label = r === 0 ? '-' : r === 1 ? ',' : String(r-2);
            g.font='4.5px Arial'; g.fillStyle='#666'; g.textAlign='right';
            g.fillText(label, xs+10, y+36+r*3.3);
            for (let c = 0; c < 4; c++) {
              g.strokeStyle='#999'; g.lineWidth=0.3;
              g.beginPath(); g.arc(xs+13+c*9, y+35+r*3.3, 1.4, 0, 2*Math.PI); g.stroke();
            }
          }
        }
        y += tlnH + 5;
      }
    }

    // ── TỰ LUẬN ─────────────────────────────────────────────
    if (document.getElementById('bldHandwritten')?.checked !== false && (type === 'tln-10' || type === 'a4' || (type === 'custom' && H > 800))) {
      const remaining = H - y - pad - mk - 8;
      if (remaining > 40) {
        g.strokeStyle = '#222'; g.lineWidth = 1;
        g.setLineDash([]);
        g.strokeRect(pad, y, cw, remaining);
        g.fillStyle = '#f9f9f9'; g.fillRect(pad+1, y+1, cw-2, 14);
        this._label(g, 'PHẦN TỰ LUẬN', pad + cw/2, y + 10, 7.5, 'bold', '#888');
        g.strokeStyle = '#aaa'; g.lineWidth = 0.4;
        g.beginPath(); g.moveTo(pad, y+14); g.lineTo(pad+cw, y+14); g.stroke();
        // Dashed lines
        g.setLineDash([4, 4]);
        g.strokeStyle = '#ccc'; g.lineWidth = 0.5;
        const lineCount = Math.floor((remaining - 18) / 14);
        for (let li = 0; li < lineCount; li++) {
          const ly = y + 18 + li * 14;
          g.beginPath(); g.moveTo(pad+10, ly); g.lineTo(pad+cw-10, ly); g.stroke();
        }
        g.setLineDash([]);
      }
    }

    // Update info bar
    const paperLabel = isLandscape ? 'A5 Ngang' : 'A4 Đứng';
    const totalQ = (mcq||0) + (tf||0) * 4 + (tln||0);
    document.getElementById('prevInfoLeft').textContent = `${paperLabel} · ${totalQ} câu`;
    document.getElementById('prevInfoRight').textContent =
      `${mcq||0} TN · ${tf||0} Đ/S · ${tln||0} TLN`;
  },

  _label(g, text, x, y, size, weight, color) {
    g.font = `${weight} ${size}px Arial`;
    g.fillStyle = color;
    g.textAlign = 'center';
    g.fillText(text, x, y);
  }
};

function renderSheetPreview() {
  if (activePreviewMode === 'wasm') renderTypstLive();
  const canvas = document.getElementById('sheetCanvas');
  if (!canvas) return;
  const school = document.getElementById('genSchool')?.value || 'SANG MATH OMR';
  const subtitle = document.getElementById('genSubtitle')?.value || '';

  // Get config from selected template or builder
  let cfg = { type: selectedTemplateType, school, subtitle, paper: 'a4' };

  const presets = {
    '12-4-6ngang': { mcq:12, tf:4, tln:6, paper:'a5' },
    'thptqg-toan': { mcq:12, tf:4, tln:6, paper:'a4' },
    'tn-40': { mcq:40, tf:0, tln:0, paper:'a4' },
    'tn-60': { mcq:60, tf:0, tln:0, paper:'a4' },
    'ds-12': { mcq:0, tf:0, tln:12, paper:'a4' },
    'tln-10': { mcq:0, tf:0, tln:10, paper:'a4' },
  };

  if (presets[selectedTemplateType]) {
    cfg = { ...cfg, ...presets[selectedTemplateType] };
  } else {
    // Use Smart Builder values
    cfg.mcq = parseInt(document.getElementById('bldMcq')?.value) || 12;
    cfg.tf  = parseInt(document.getElementById('bldTf')?.value)  || 4;
    cfg.tln = parseInt(document.getElementById('bldTln')?.value) || 6;
    cfg.paper = document.querySelector('input[name="bldPaper"]:checked')?.value || 'a4';
  }

  PV.draw(canvas, cfg);
  // Scale canvas CSS to fill container width (responsive)
  const container = canvas.parentElement;
  if (container) {
    const containerW = container.clientWidth - 16; // 8px padding each side
    canvas.style.width  = containerW + 'px';
    canvas.style.height = Math.round(containerW * (canvas.height / canvas.width)) + 'px';
  }
}

function togglePreviewZoom(srcCanvas) {
  const modal = document.getElementById('previewModal');
  const zoomCanvas = document.getElementById('sheetCanvasZoom');
  // Copy at native resolution (DPR already baked into srcCanvas)
  zoomCanvas.width = srcCanvas.width;
  zoomCanvas.height = srcCanvas.height;
  zoomCanvas.style.width  = '';
  zoomCanvas.style.height = '';
  zoomCanvas.style.maxWidth  = '90vw';
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
  document.querySelector('#smartBuilder').scrollIntoView({behavior:'smooth', block:'start'});
}

function updateSheetPreview() {
  const school = document.getElementById('genSchool').value;
  const subtitle = document.getElementById('genSubtitle').value;
  document.getElementById('prevSchool').textContent = school;
  document.getElementById('prevSubtitle').textContent = subtitle;

  const qGrid = document.getElementById('prevQGrid');
  const note = document.getElementById('prevNote');
  const map = {
    '12-4-6ngang':'50 câu ABCD (A5 Ngang)',
    'thptqg-toan':'12TN + 4ĐS + 6TLN (THPTQG 2025)',
    'tn-40':'40 câu ABCD',
    'tn-60':'60 câu ABCD (THPTQG)',
    'ds-12':'12 câu Điền Số',
    'tln-10':'10 câu Tự Luận Ngắn (A4)',
    'custom':'Tuỳ Chỉnh (Smart Builder ↓)'
  };
  note.textContent = '📋 ' + (map[selectedTemplateType] || '') + ' — SBD 6 chữ số';

  // Simple preview dots
  const numQ = {
    '12-4-6ngang':50,'tn-40':40,'tn-60':60,'ds-12':12,
    'thptqg-toan':22,'tln-10':10,'custom':0
  }[selectedTemplateType] || 50;

  if (selectedTemplateType === 'custom') {
    qGrid.innerHTML = '<div style="font-size:11px;color:#999;padding:8px">👇 Tuỳ chỉnh số câu ở mục Smart Builder bên dưới</div>';
    return;
  }
  if (selectedTemplateType === 'tln-10') {
    qGrid.innerHTML = Array.from({length:10}, (_,i) => `
      <div style="display:flex;align-items:center;gap:3px;margin:1px 0;">
        <span style="font-size:8px;width:20px;text-align:right">Câu ${i+1}:</span>
        ${[0,1,2,3].map(j=>`<div style="width:12px;height:12px;border:0.5px solid #888;border-radius:2px;"></div>`).join('')}
      </div>
    `).join('');
    return;
  }
  qGrid.innerHTML = Array.from({length:Math.min(numQ,20)}, (_,i) => `
    <div style="display:flex;align-items:center;gap:2px;margin:1px 0;">
      <span style="font-size:8px;width:14px;text-align:right">${i+1}.</span>
      ${['A','B','C','D'].map(o=>`<div style="width:10px;height:10px;border:0.5px solid #888;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:6px">${o}</div>`).join('')}
    </div>
  `).join('') + (numQ > 20 ? `<div style="font-size:9px;color:#999;padding:4px">... và ${numQ-20} câu nữa</div>` : '');
}

function generateSheetCmd() {
  const school = document.getElementById('genSchool').value;
  const subtitle = document.getElementById('genSubtitle').value;
  const madeRaw = document.getElementById('genMade').value;
  const copies = parseInt(document.getElementById('genCopies').value) || 1;
  const madeList = madeRaw.split(',').map(s => s.trim()).filter(Boolean);

  const templateFile = {
    'thptqg-toan':'templates/thptqg-toan-2025.typ',
    '12-4-6ngang':'templates/tn-50.typ', 'tn-40':'templates/tn-40.typ',
    'tn-60':'templates/tn-60.typ', 'ds-12':'templates/ds-12.typ',
    'hybrid':'templates/hybrid-28tn-12ds.typ'
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
  const blob = new Blob([text], {type:'text/plain'});
  const a = document.createElement('a');
  a.href = URL.createObjectURL(blob);
  a.download = 'generate_omr_sheets.sh';
  a.click();
}

function downloadTypFile() {
  const conf = TEMPLATES[selectedTemplateType];
  if (!conf) return alert("Vui lòng chọn mẫu phiếu!");
  
  const school = document.getElementById('genSchool')?.value || 'SANG MATH OMR';
  const subtitle = document.getElementById('genSubtitle')?.value || 'Custom Template';
  const handwritten = document.getElementById('genHandwritten')?.checked ?? true;
  
  const code = genWasmTypst({ mcq: conf.mcq, tf: conf.tf, tln: conf.tln, paper: conf.paper, school, subtitle, handwritten, realQr: true });
  const blob = new Blob([code], {type:'text/plain'});
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
  const mcq = parseInt(document.getElementById('bldMcq').value) || 0;
  const tf  = parseInt(document.getElementById('bldTf').value)  || 0;
  const tln = parseInt(document.getElementById('bldTln').value) || 0;
  const paper = document.querySelector('input[name="bldPaper"]:checked')?.value || 'a4';

  const total = mcq + tf * 4 + tln; // approximate items
  const maxBar = Math.max(mcq, tf, tln, 1);

  // Update preview bars
  const barMcq = document.getElementById('barMcq');
  const barTf  = document.getElementById('barTf');
  const barTln = document.getElementById('barTln');
  const maxW = 85; // percent

  barMcq.style.width = mcq > 0 ? Math.max(8, (mcq/100)*maxW) + '%' : '8%';
  barMcq.textContent = mcq + ' TN';
  barMcq.style.opacity = mcq > 0 ? '1' : '.3';

  barTf.style.width = tf > 0 ? Math.max(8, (tf/12)*maxW) + '%' : '8%';
  barTf.textContent = tf + ' Đ/S';
  barTf.style.opacity = tf > 0 ? '1' : '.3';

  barTln.style.width = tln > 0 ? Math.max(8, (tln/20)*maxW) + '%' : '8%';
  barTln.textContent = tln + ' TLN';
  barTln.style.opacity = tln > 0 ? '1' : '.3';

  // Estimate pages
  let pages = 1;
  if (mcq > 50 || tln > 12) pages = 2;

  const paperLabel = paper === 'a4' ? 'A4 Đứng' : 'A5 Ngang';
  document.getElementById('bldSummary').textContent =
    `Tổng: ${mcq} TN + ${tf} Đ/S + ${tln} TLN · ${paperLabel} · Ước tính ${pages} trang`;
  // Update live preview from builder
  renderSheetPreview();
}

function generateBuilderCode() {
  const mcq = parseInt(document.getElementById('bldMcq').value) || 0;
  const tf  = parseInt(document.getElementById('bldTf').value)  || 0;
  const tln = parseInt(document.getElementById('bldTln').value) || 0;
  const paper = document.querySelector('input[name="bldPaper"]:checked')?.value || 'a4';

  _builderCode = buildTypstCode(mcq, tf, tln, paper);
  document.getElementById('builderCode').textContent = _builderCode;
  document.getElementById('builderOutput').style.display = 'block';
  document.getElementById('builderOutput').scrollIntoView({behavior:'smooth', block:'nearest'});
}

function copyBuilderCode() {
  navigator.clipboard.writeText(_builderCode).then(() => alert('✅ Đã copy code Typst vào clipboard!'));
}

function downloadBuilderTyp() {
  if (!_builderCode) generateBuilderCode();
  const blob = new Blob([_builderCode], {type:'text/plain'});
  const a = document.createElement('a');
  a.href = URL.createObjectURL(blob);
  const mcq = document.getElementById('bldMcq').value;
  const tf  = document.getElementById('bldTf').value;
  const tln = document.getElementById('bldTln').value;
  a.download = `phieu_custom_${mcq}tn_${tf}ds_${tln}tln.typ`;
  a.click();
}

function buildTypstCode(mcq, tf, tln, paper) {
  const school = document.getElementById('genSchool')?.value || 'SANG MATH OMR';
  const subtitle = document.getElementById('genSubtitle')?.value || 'Custom Template';
  const handwritten = document.getElementById('bldHandwritten')?.checked ?? true;
  return genWasmTypst({ mcq, tf, tln, paper, school, subtitle, handwritten, realQr: true });
}


