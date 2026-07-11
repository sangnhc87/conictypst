import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Add jsQR script
if 'jsQR.min.js' not in content:
    content = content.replace('<script async src="https://docs.opencv.org/4.8.0/opencv.js"', '<script src="https://cdn.jsdelivr.net/npm/jsqr@1.4.0/dist/jsQR.min.js"></script>\n<script async src="https://docs.opencv.org/4.8.0/opencv.js"')

# Inject jsQR into arScanLoop
old_ar = """  try {
    let srcMat = cv.imread(scanCanvas);"""

new_ar = """  try {
    // Quick QR check
    const imgData = scanCtx.getImageData(0, 0, scanCanvas.width, scanCanvas.height);
    const code = jsQR(imgData.data, imgData.width, imgData.height, { inversionAttempts: "dontInvert" });
    if (code && code.data) {
        const detectedType = code.data.trim();
        const selectEl = document.getElementById('sheetTypeGrade');
        if (TEMPLATES[detectedType] && selectEl.value !== detectedType) {
            selectEl.value = detectedType;
            document.getElementById('arStatus').textContent = `Mẫu tự động: ${detectedType.toUpperCase()}`;
            // Bíp nhẹ báo hiệu đổi mẫu
            if (audioCtx.state === 'suspended') audioCtx.resume();
            const osc = audioCtx.createOscillator();
            osc.type = 'sine'; osc.frequency.setValueAtTime(800, audioCtx.currentTime);
            osc.connect(audioCtx.destination);
            osc.start(); osc.stop(audioCtx.currentTime + 0.1);
        }
    }

    let srcMat = cv.imread(scanCanvas);"""

if '// Quick QR check' not in content:
    content = content.replace(old_ar, new_ar)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
