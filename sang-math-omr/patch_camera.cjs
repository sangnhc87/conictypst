const fs = require('fs');
let html = fs.readFileSync('index.html', 'utf8');

// 1. Inject Styles
const styleHTML = `
/* AR Camera Modal */
.ar-modal {
  position: fixed; top: 0; left: 0; width: 100vw; height: 100vh;
  background: #000; z-index: 9999; display: flex; flex-direction: column;
  visibility: hidden; opacity: 0; transition: opacity 0.3s;
}
.ar-modal.active { visibility: visible; opacity: 1; }
.ar-header {
  position: absolute; top: 0; left: 0; width: 100%; padding: 15px;
  background: linear-gradient(to bottom, rgba(0,0,0,0.8), transparent);
  display: flex; justify-content: space-between; align-items: center; z-index: 10;
}
.ar-header h3 { margin: 0; color: #fff; font-size: 16px; }
.ar-btn { background: rgba(255,255,255,0.2); color: #fff; border: none; padding: 8px 15px; border-radius: 20px; font-weight: bold; cursor: pointer; backdrop-filter: blur(5px); }
.ar-btn.danger { background: rgba(239, 68, 68, 0.8); }
.ar-video-container { position: relative; flex: 1; overflow: hidden; background: #111; display:flex; justify-content:center; align-items:center; }
#arVideo { width: 100%; height: 100%; object-fit: cover; }
#arOverlay { position: absolute; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; }
.ar-footer {
  position: absolute; bottom: 0; left: 0; width: 100%; padding: 20px;
  background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);
  display: flex; justify-content: center; align-items: center; z-index: 10;
}
.ar-status { color: #fff; text-align: center; font-size: 14px; background: rgba(0,0,0,0.5); padding: 5px 15px; border-radius: 20px; }
.ar-result-overlay {
  position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);
  background: rgba(0, 0, 0, 0.85); padding: 30px; border-radius: 20px;
  text-align: center; color: white; display: none; z-index: 20;
  box-shadow: 0 10px 30px rgba(0,0,0,0.5); border: 2px solid #4ade80;
  min-width: 250px;
}
.ar-result-overlay h2 { font-size: 48px; color: #4ade80; margin: 0 0 10px 0; }
.ar-result-overlay p { margin: 0 0 20px 0; font-size: 16px; color: #ccc; }
`;
if (!html.includes('/* AR Camera Modal */')) {
    html = html.replace('</style>', styleHTML + '\n</style>');
}

// 2. Inject Modal HTML
const modalHTML = `
<!-- AR Live Camera Modal -->
<div class="ar-modal" id="arModal">
  <div class="ar-header">
    <button class="ar-btn" onclick="switchCamera()">🔄 Đổi Camera</button>
    <button class="ar-btn danger" onclick="closeCameraModal()">❌ Đóng</button>
  </div>
  <div class="ar-video-container">
    <video id="arVideo" autoplay playsinline></video>
    <canvas id="arOverlay"></canvas>
    <div class="ar-result-overlay" id="arResult">
      <h2 id="arScore">10.0</h2>
      <p id="arDetails">SBD: 123456 - Mã Đề: 101</p>
      <button class="btn btn-success" onclick="resumeCamera()" style="width:100%; font-size:16px; padding:10px;">👉 Chấm bài tiếp theo</button>
    </div>
  </div>
  <div class="ar-footer">
    <div class="ar-status" id="arStatus">Đang tìm 4 góc đen...</div>
  </div>
</div>
`;
if (!html.includes('id="arModal"')) {
    html = html.replace('</body>', modalHTML + '\n</body>');
}

// 3. Inject Button
const currentGradeBtn = `          <button class="btn btn-primary" id="gradeBtn" disabled style="width:100%;justify-content:center;">
            <div class="spinner" id="gradeSpinner"></div>
            <span>CHẤM BÀI NGAY</span>
          </button>`;
const newGradeBtns = `          <div style="display:flex; gap:10px;">
            <button class="btn btn-primary" id="gradeBtn" disabled style="flex:1;justify-content:center;">
              <div class="spinner" id="gradeSpinner"></div>
              <span>CHẤM TỪ ẢNH</span>
            </button>
            <button class="btn btn-success" id="liveCamBtn" style="flex:1;justify-content:center;background:var(--green);border:none" onclick="openCameraModal()">
              <span>📷 CHẤM LIVE (AR)</span>
            </button>
          </div>`;
if (html.includes(currentGradeBtn)) {
    html = html.replace(currentGradeBtn, newGradeBtns);
} else {
    console.log("Could not find gradeBtn to replace!");
}

// 4. Inject JS logic
const jsLogic = `
// ==================== AR CAMERA LOGIC ====================
let arStream = null;
let arScanInterval = null;
let arCurrentFacingMode = 'environment';
let isArScanning = false;

async function openCameraModal() {
  if (!window.OmrEngine || !window.OmrEngine.isOpenCvLoaded) {
    alert("Vui lòng chờ hệ thống khởi tạo (hiện chấm xanh) trước khi chấm live.");
    return;
  }
  document.getElementById('arModal').classList.add('active');
  await startCamera(arCurrentFacingMode);
}

function closeCameraModal() {
  document.getElementById('arModal').classList.remove('active');
  stopCamera();
}

async function switchCamera() {
  arCurrentFacingMode = (arCurrentFacingMode === 'environment') ? 'user' : 'environment';
  await startCamera(arCurrentFacingMode);
}

function stopCamera() {
  isArScanning = false;
  if (arScanInterval) { cancelAnimationFrame(arScanInterval); arScanInterval = null; }
  if (arStream) {
    arStream.getTracks().forEach(track => track.stop());
    arStream = null;
  }
}

async function startCamera(facingMode) {
  stopCamera();
  try {
    arStream = await navigator.mediaDevices.getUserMedia({
      video: { facingMode: facingMode, width: { ideal: 1920 }, height: { ideal: 1080 } }
    });
    const videoEl = document.getElementById('arVideo');
    videoEl.srcObject = arStream;
    // Đợi video ready
    videoEl.onloadedmetadata = () => {
      videoEl.play();
      resumeCamera(); // Bắt đầu loop
    };
  } catch (err) {
    alert("Không thể truy cập Camera: " + err.message);
    closeCameraModal();
  }
}

function resumeCamera() {
  document.getElementById('arResult').style.display = 'none';
  document.getElementById('arStatus').textContent = "Đang quét 4 góc đen...";
  isArScanning = true;
  arScanLoop();
}

const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
function playBeep() {
  if (audioCtx.state === 'suspended') audioCtx.resume();
  const osc = audioCtx.createOscillator();
  const gain = audioCtx.createGain();
  osc.connect(gain); gain.connect(audioCtx.destination);
  osc.type = 'sine'; osc.frequency.value = 1000;
  gain.gain.setValueAtTime(1, audioCtx.currentTime);
  gain.gain.exponentialRampToValueAtTime(0.001, audioCtx.currentTime + 0.1);
  osc.start(); osc.stop(audioCtx.currentTime + 0.1);
}

let lastScanTime = 0;
async function arScanLoop(timestamp) {
  if (!isArScanning) return;
  requestAnimationFrame(arScanLoop);

  // Limit to ~4 FPS for marker detection to save battery
  if (timestamp - lastScanTime < 250) return;
  lastScanTime = timestamp;

  const videoEl = document.getElementById('arVideo');
  const canvasOverlay = document.getElementById('arOverlay');
  if (videoEl.videoWidth === 0) return;

  canvasOverlay.width = videoEl.clientWidth;
  canvasOverlay.height = videoEl.clientHeight;
  const ctx = canvasOverlay.getContext('2d');
  ctx.clearRect(0, 0, canvasOverlay.width, canvasOverlay.height);

  // Tạo một canvas nhỏ để test OpenCV cho nhanh
  const scanCanvas = document.createElement('canvas');
  const scale = 500 / videoEl.videoWidth;
  scanCanvas.width = 500; 
  scanCanvas.height = videoEl.videoHeight * scale;
  const scanCtx = scanCanvas.getContext('2d');
  scanCtx.drawImage(videoEl, 0, 0, scanCanvas.width, scanCanvas.height);

  try {
    let srcMat = cv.imread(scanCanvas);
    let markers = window.OmrEngine.detectMarkers(srcMat);
    srcMat.delete();

    if (markers) {
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
      document.getElementById('arStatus').textContent = "Tìm thấy bài! Đang chấm điểm...";
      playBeep();

      // Render video nguyên bản độ phân giải cao ra canvas để chấm thật
      const fullCanvas = document.createElement('canvas');
      fullCanvas.width = videoEl.videoWidth;
      fullCanvas.height = videoEl.videoHeight;
      const fCtx = fullCanvas.getContext('2d');
      fCtx.drawImage(videoEl, 0, 0);
      
      // Gọi hàm chấm
      const templateName = document.getElementById('selTemplate').value;
      const template = TEMPLATES[templateName];
      const apiKey = document.getElementById('geminiApiKey').value.trim();
      const engine = templateName.includes('tln') ? 'gemini' : 'opencv';
      
      const tKey = engine === 'gemini' ? (document.getElementById('selCorrectType').value === 's1' ? 'fullS1' : 'fullS2') : (document.getElementById('selCorrectType').value === 's1' ? 's1' : 's2');
      const correctAnswers = CORRECT_ANSWERS[templateName][tKey];

      try {
        const result = await window.OmrEngine.gradeImage(fullCanvas, template, correctAnswers, apiKey, templateName, engine);
        
        // Show success result overlay
        document.getElementById('arScore').textContent = result.score;
        document.getElementById('arScore').style.color = result.score >= 5 ? '#4ade80' : '#f87171';
        document.getElementById('arDetails').textContent = \`SBD: \${result.sbd} - Mã Đề: \${result.made}\\n(\${result.correct}/\${result.total})\`;
        document.getElementById('arResult').style.display = 'block';
        document.getElementById('arStatus').textContent = "Chấm hoàn tất! Bấm tiếp tục để quét.";

        // Thêm vào danh sách và render
        result.name = "Quét Live AR";
        result.cls = "Live";
        result.timestamp = Date.now();
        gradeResults.push(result);
        renderStats();

      } catch (err) {
        document.getElementById('arStatus').textContent = "Lỗi chấm: " + err.message;
        setTimeout(resumeCamera, 3000); // Tự động quét lại sau 3s nếu lỗi thuật toán chấm
      }
    }
  } catch(e) {
    // console error safely
  }
}
`;

if (!html.includes('function openCameraModal')) {
    html = html.replace('</script>', jsLogic + '\n</script>');
}

fs.writeFileSync('index.html', html);
console.log("Patched successfully.");
