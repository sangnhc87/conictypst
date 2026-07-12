const fs = require('fs');
let html = fs.readFileSync('sang-math-omr/index.html', 'utf8');

// 1. Add toggle to UI
const uiSearch = `<span id="arModeBadge" style="background:rgba(74,222,128,0.25);color:#4ade80;border:1px solid #4ade80;border-radius:12px;font-size:11px;padding:2px 8px;font-weight:600;">TỰ ĐỘNG</span>`;
const uiReplace = `<span id="arModeBadge" style="background:rgba(74,222,128,0.25);color:#4ade80;border:1px solid #4ade80;border-radius:12px;font-size:11px;padding:2px 8px;font-weight:600;">TỰ ĐỘNG</span>
      <label style="color:#fff; font-size:12px; display:flex; align-items:center; gap:4px; margin-left:8px; cursor:pointer;">
        <input type="checkbox" id="continuousModeToggle" checked onchange="isContinuousMode = this.checked"> Liên tục & Đọc điểm
      </label>`;
if (html.includes(uiSearch)) {
    html = html.replace(uiSearch, uiReplace);
} else {
    console.log("Could not find AR header UI to patch.");
}

// 2. Add variable
const varSearch = `let lastScanTime = 0;`;
const varReplace = `let isContinuousMode = true;\nlet lastScanTime = 0;`;
if (html.includes(varSearch) && !html.includes("let isContinuousMode = true;")) {
    html = html.replace(varSearch, varReplace);
}

// 3. Modify _showArResult
const showResSearch = `  showSingleResult(result);\n}`;
const showResReplace = `  showSingleResult(result);

  if (window.isContinuousMode) {
      if ('speechSynthesis' in window) {
          const scoreText = result.score.toString().replace('.', ' phẩy ');
          const utterance = new SpeechSynthesisUtterance(scoreText);
          utterance.lang = 'vi-VN';
          utterance.rate = 1.1;
          window.speechSynthesis.speak(utterance);
      }
      setTimeout(() => {
          if (document.getElementById('arModal').classList.contains('active')) {
              resumeCamera();
          }
      }, 2000);
  }
}`;
if (html.includes(showResSearch)) {
    html = html.replace(showResSearch, showResReplace);
} else {
    console.log("Could not find showSingleResult in _showArResult.");
}

// 4. Wake up speech synthesis in openCameraModal
const openCamSearch = `async function openCameraModal() {`;
const openCamReplace = `async function openCameraModal() {
  if ('speechSynthesis' in window) {
      // Wake up TTS engine on user interaction
      let u = new SpeechSynthesisUtterance('');
      u.volume = 0;
      window.speechSynthesis.speak(u);
  }`;
if (html.includes(openCamSearch)) {
    html = html.replace(openCamSearch, openCamReplace);
} else {
    console.log("Could not find openCameraModal");
}

fs.writeFileSync('sang-math-omr/index.html', html, 'utf8');
console.log("Live scan patched successfully.");
