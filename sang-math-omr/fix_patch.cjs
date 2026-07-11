const fs = require('fs');
let content = fs.readFileSync('index.html', 'utf8');

const scriptInjected = `
async function generatePdfsDirectly() {
  if (typeof typstEngine === 'undefined' || !typstEngine) {
    return alert('Trình biên dịch Typst chưa tải xong, vui lòng đợi lát!');
  }
  
  const school = document.getElementById('genSchool')?.value || 'SANG MATH OMR';
  const subtitle = document.getElementById('genSubtitle')?.value || 'Custom Template';
  const handwritten = document.getElementById('genHandwritten')?.checked ?? true;
  const madeRaw = document.getElementById('genMade')?.value || '';
  const copies = parseInt(document.getElementById('genCopies')?.value) || 1;
  const madeList = madeRaw.split(',').map(s => s.trim()).filter(Boolean);
  if (madeList.length === 0) madeList.push('');
  
  const selectedTemplateType = document.getElementById('genTemplate').value;
  const conf = TEMPLATES[selectedTemplateType];
  if (!conf) return alert("Vui lòng chọn mẫu phiếu!");
  
  const btn = document.querySelector('button[onclick="generatePdfsDirectly()"]');
  const oldText = btn.innerHTML;
  btn.innerHTML = '⏳ Đang biên dịch PDF...';
  btn.disabled = true;
  
  try {
    let pdfs = [];
    for (let made of madeList) {
      for (let i = 0; i < copies; i++) {
        const code = genWasmTypst({ 
            mcq: conf.mcq, tf: conf.tf, tln: conf.tln, paper: conf.paper, 
            school, subtitle, handwritten, realQr: true, made 
        });
        
        let pdfData;
        if (typeof typstEngine.pdf === 'function') {
           pdfData = await typstEngine.pdf({ mainContent: code });
        } else {
           throw new Error("Trình duyệt không hỗ trợ trực tiếp. Yêu cầu tải bundle full.");
        }
        
        const padS = (i+1).toString().padStart(3, '0');
        const fileName = made ? \`phieu_omr_M\${made}_\${padS}.pdf\` : \`phieu_omr_\${padS}.pdf\`;
        pdfs.push({ name: fileName, data: pdfData });
      }
    }
    
    if (pdfs.length === 1) {
      const blob = new Blob([pdfs[0].data], { type: 'application/pdf' });
      const a = document.createElement('a');
      a.href = URL.createObjectURL(blob);
      a.download = pdfs[0].name;
      a.click();
    } else {
      if (typeof JSZip === 'undefined') {
         await new Promise((resolve, reject) => {
           const script = document.createElement('script');
           script.src = "https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js";
           script.onload = resolve;
           script.onerror = reject;
           document.head.appendChild(script);
         });
      }
      const zip = new JSZip();
      pdfs.forEach(p => zip.file(p.name, p.data));
      const zipBlob = await zip.generateAsync({ type: 'blob' });
      const a = document.createElement('a');
      a.href = URL.createObjectURL(zipBlob);
      a.download = \`phieu_omr_batch.zip\`;
      a.click();
    }
  } catch(e) {
    console.error(e);
    alert('Biên dịch PDF trực tiếp thất bại, sẽ tải về file mã nguồn (.typ) để biên dịch bằng Typst CLI. Lỗi: ' + e.message);
    downloadTypZipFallback(madeList, copies, conf, school, subtitle, handwritten);
  } finally {
    btn.innerHTML = oldText;
    btn.disabled = false;
  }
}

async function downloadTypZipFallback(madeList, copies, conf, school, subtitle, handwritten) {
    if (typeof JSZip === 'undefined') {
        await new Promise((resolve, reject) => {
           const script = document.createElement('script');
           script.src = "https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js";
           script.onload = resolve;
           script.onerror = reject;
           document.head.appendChild(script);
        });
    }
    const zip = new JSZip();
    let compileScript = '#!/bin/bash\\nmkdir -p pdfs\\n';
    
    for (let made of madeList) {
      for (let i = 0; i < copies; i++) {
        const code = genWasmTypst({ mcq: conf.mcq, tf: conf.tf, tln: conf.tln, paper: conf.paper, school, subtitle, handwritten, realQr: true, made });
        const padS = (i+1).toString().padStart(3, '0');
        const fileName = made ? \`phieu_omr_M\${made}_\${padS}.typ\` : \`phieu_omr_\${padS}.typ\`;
        zip.file(fileName, code);
        compileScript += \`typst compile \${fileName} pdfs/\${fileName.replace('.typ','.pdf')}\\n\`;
      }
    }
    
    zip.file('compile.sh', compileScript);
    const zipBlob = await zip.generateAsync({ type: 'blob' });
    const a = document.createElement('a');
    a.href = URL.createObjectURL(zipBlob);
    a.download = \`phieu_omr_nguon_typst.zip\`;
    a.click();
}
`;

content = content.replace('function genWasmTypst', scriptInjected + '\n\nfunction genWasmTypst');
fs.writeFileSync('index.html', content);
console.log('fixed patch applied');
