const fs = require('fs');
const vm = require('vm');

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
  window: {},
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

function buildTypstCode(mcq, tf, tln, paper) {
  const hasEssay = (mcq === 12 && tf === 4 && tln === 6) || (mcq === 0 && tf === 0 && tln === 10);
  return genWasmTypst({ mcq, tf, tln, paper, school: 'SANG MATH OMR', subtitle: 'Kiểm tra – Môn Toán', hasEssay });
}

// Define some presets
if (!fs.existsSync('templates')) {
  fs.mkdirSync('templates');
}

fs.writeFileSync('templates/tn-40.typ', buildTypstCode(40, 0, 0, 'a4'));
fs.writeFileSync('templates/tn-50.typ', buildTypstCode(50, 0, 0, 'a4'));
fs.writeFileSync('templates/tn-60.typ', buildTypstCode(60, 0, 0, 'a4'));
fs.writeFileSync('templates/ds-12.typ', buildTypstCode(0, 12, 0, 'a4'));
fs.writeFileSync('templates/tln-10.typ', buildTypstCode(0, 0, 10, 'a4'));
fs.writeFileSync('templates/hybrid-28tn-12ds.typ', buildTypstCode(28, 12, 0, 'a4'));
fs.writeFileSync('templates/12-4-6ngang.typ', buildTypstCode(12, 4, 6, 'a5'));
fs.writeFileSync('templates/thptqg-toan-2025.typ', buildTypstCode(12, 4, 6, 'a4'));

console.log("Updated templates successfully!");
process.exit(0);
