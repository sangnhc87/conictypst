const fs = require('fs');
const vm = require('vm');
const qrcode = require('qrcode-generator');
function getQRTypst(text) {
    const qr = qrcode(0, 'L');
    qr.addData(text);
    qr.make();
    const size = qr.getModuleCount();
    let rows = [];
    for (let r = 0; r < size; r++) {
        let rowCols = [];
        for (let c = 0; c < size; c++) {
            rowCols.push(qr.isDark(r, c) ? "qb" : "qw");
        }
        rows.push(rowCols.join(', '));
    }
    return `#grid(columns: ${size}, spacing: 0pt,\n  ${rows.join(',\n  ')}\n)`;
}


const html = fs.readFileSync('index.html', 'utf8');

// Find the script tag containing genWasmTypst
const scripts = html.match(/<script[\s\S]*?>([\s\S]*?)<\/script>/g);
let scriptContent = '';
for (const script of scripts) {
  if (script.includes('function genWasmTypst')) {
    scriptContent = script.replace(/<script[\s\S]*?>/g, '').replace(/<\/script>/g, '');
    break;
  }
}

// Mock browser objects
const globalMock = {
  document: {
    getElementById: (id) => ({
      value: '',
      checked: false,
      addEventListener: () => {},
      classList: { add: () => {}, remove: () => {} },
      appendChild: () => {},
      remove: () => {}
    }),
    querySelector: () => null,
    querySelectorAll: () => [],
    addEventListener: () => {},
    createElement: () => ({
      style: {},
      classList: { add: () => {}, remove: () => {} },
      appendChild: () => {},
      addEventListener: () => {}
    })
  },
  window: { addEventListener: () => {} },
  localStorage: {
    getItem: () => null,
    setItem: () => {}
  },
  navigator: {
    clipboard: {
      writeText: () => Promise.resolve()
    }
  },
  TEMPLATES: {
    '12-4-6ngang': { numQ: 50 }
  },
  AudioContext: class {},
  webkitAudioContext: class {},
  localStorage: {
    getItem: () => null,
    setItem: () => {}
  },
  console: console
};

// Create sandbox
const context = vm.createContext(globalMock);
vm.runInContext(scriptContent, context);

const genWasmTypst = context.genWasmTypst;

function buildTypstCode(mcq, tf, tln, paper, templateId) {
  const hasEssay = (mcq === 12 && tf === 4 && tln === 6) || (mcq === 0 && tf === 0 && tln === 10);
  const qrCodeStr = getQRTypst(templateId);
  return genWasmTypst({ mcq, tf, tln, paper, school: 'SANG MATH OMR', subtitle: 'Kiểm tra – Môn Toán', hasEssay, qrCodeStr });
}

// Define some presets
if (!fs.existsSync('templates')) {
  fs.mkdirSync('templates');
}

fs.writeFileSync('templates/tn-40.typ', buildTypstCode(40, 0, 0, 'a4', 'tn-40'));
fs.writeFileSync('templates/tn-50.typ', buildTypstCode(50, 0, 0, 'a4', 'tn-50'));
fs.writeFileSync('templates/tn-60.typ', buildTypstCode(60, 0, 0, 'a4', 'tn-60'));
fs.writeFileSync('templates/ds-12.typ', buildTypstCode(0, 12, 0, 'a4', 'ds-12'));
fs.writeFileSync('templates/tln-10.typ', buildTypstCode(0, 0, 10, 'a4', 'tln-10'));
fs.writeFileSync('templates/hybrid-28tn-12ds.typ', buildTypstCode(28, 12, 0, 'a4', 'hybrid-28tn-12ds'));
fs.writeFileSync('templates/12-4-6ngang.typ', buildTypstCode(12, 4, 6, 'a5', '12-4-6ngang'));
fs.writeFileSync('templates/thptqg-toan-2025.typ', buildTypstCode(12, 4, 6, 'a4', 'thptqg-toan-2025'));

console.log("Updated templates successfully!");
process.exit(0);
