const fs = require('fs');
let html = fs.readFileSync('sang-math-omr/index.html', 'utf8');

// 1. Add pdf.js script
const scriptTag = `<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js"></script>`;
if (!html.includes(scriptTag)) {
    html = html.replace('<!-- OpenCV.js & Engine', `${scriptTag}\n    <script>pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js';</script>\n    <!-- OpenCV.js & Engine`);
}

// 2. Add UI for PDF Upload next to image upload
const uploadUiSearch = `                <input type="file" id="imageInput" accept="image/*" multiple style="display:none" onchange="handleImageUpload(event)">
                <button class="btn btn-primary" onclick="document.getElementById('imageInput').click()">
                    📸 Tải Ảnh (Hoặc Chụp)
                </button>`;
const uploadUiReplace = `                <input type="file" id="imageInput" accept="image/*" multiple style="display:none" onchange="handleImageUpload(event)">
                <button class="btn btn-primary" onclick="document.getElementById('imageInput').click()" style="flex:1;">
                    📸 Tải Ảnh
                </button>
                <input type="file" id="pdfInput" accept="application/pdf" multiple style="display:none" onchange="handlePdfUpload(event)">
                <button class="btn btn-secondary" onclick="document.getElementById('pdfInput').click()" style="flex:1;">
                    📄 Tải PDF (Chấm lô)
                </button>`;
if (html.includes(uploadUiSearch)) {
    html = html.replace(uploadUiSearch, uploadUiReplace);
}

// 3. Update the container to use flex row
const uploadContainerSearch = `<div style="display:flex; gap:10px; margin-bottom:15px; flex-wrap:wrap;">`;
// It might already be display:flex, but let's check
if (!html.includes('id="pdfInput"')) {
    html = html.replace(
        `<div style="display:flex; gap:10px; margin-bottom:15px; flex-wrap:wrap;">`, 
        `<div style="display:flex; gap:10px; margin-bottom:15px; flex-wrap:wrap; width:100%;">`
    );
}

// 4. Implement handlePdfUpload logic
const logicStr = `
        async function handlePdfUpload(event) {
            const files = event.target.files;
            if (!files.length) return;
            if (!window.OmrEngine || !window.OmrEngine.isOpenCvLoaded) {
                alert("Hệ thống (OpenCV) đang tải, vui lòng đợi vài giây...");
                return;
            }

            // Show a progress overlay or use arStatus
            document.getElementById('loadingOverlay').style.display = 'flex';
            document.getElementById('loadingText').textContent = 'Đang đọc PDF...';

            const templateName = document.getElementById('sheetTypeGrade').value;
            const template = TEMPLATES[templateName];
            const apiKey = document.getElementById('geminiApiKey').value.trim();
            const engine = (apiKey) ? 'gemini' : 'opencv';

            try {
                for (let i = 0; i < files.length; i++) {
                    const file = files[i];
                    const arrayBuffer = await file.arrayBuffer();
                    const pdf = await pdfjsLib.getDocument({ data: arrayBuffer }).promise;
                    
                    for (let pageNum = 1; pageNum <= pdf.numPages; pageNum++) {
                        document.getElementById('loadingText').textContent = \`Đang chấm PDF \${i+1}/\${files.length} (Trang \${pageNum}/\${pdf.numPages})...\`;
                        const page = await pdf.getPage(pageNum);
                        const viewport = page.getViewport({ scale: 2.0 }); // Render at higher resolution for OpenCV accuracy
                        const canvas = document.createElement('canvas');
                        const ctx = canvas.getContext('2d');
                        canvas.width = viewport.width;
                        canvas.height = viewport.height;
                        
                        await page.render({ canvasContext: ctx, viewport: viewport }).promise;

                        // Grade the canvas
                        const fullAnswers = { mcq: {}, tf: {}, tln: {} };
                        try {
                            const result = await window.OmrEngine.gradeImage(canvas, template, fullAnswers, apiKey, templateName, engine);
                            
                            // Emulate _showArResult logic for saving
                            result.name = file.name + ' - Trang ' + pageNum;
                            result.cls = 'PDF';
                            result.timestamp = Date.now();
                            result.sessionName = document.getElementById('sessionNameSelect') ? document.getElementById('sessionNameSelect').value : 'Mặc định';
                            gradeResults.push(result);
                            await saveToStorage();
                        } catch (err) {
                            console.error("Lỗi chấm PDF trang", pageNum, err);
                            // Push a failed result
                            gradeResults.push({
                                sbd: 'LỖI',
                                made: '---',
                                score: 0,
                                correct: 0,
                                total: 0,
                                details: [],
                                name: file.name + ' - Trang ' + pageNum,
                                cls: 'Lỗi: ' + err.message,
                                sessionName: 'Mặc định',
                                timestamp: Date.now()
                            });
                        }
                    }
                }
                document.getElementById('loadingOverlay').style.display = 'none';
                renderStats();
                switchTab('tab-stats');
            } catch (err) {
                console.error(err);
                alert("Có lỗi khi đọc PDF: " + err.message);
                document.getElementById('loadingOverlay').style.display = 'none';
            }
            // Reset input
            event.target.value = '';
        }
`;

if (!html.includes('function handlePdfUpload')) {
    html = html.replace('// ---- AR LIVE SCAN LOGIC ----', logicStr + '\n        // ---- AR LIVE SCAN LOGIC ----');
}

fs.writeFileSync('sang-math-omr/index.html', html, 'utf8');
console.log("Patched PDF batch scanning!");
