const fs = require('fs');
const vm = require('vm');
const qrcode = require('qrcode-generator');
function getQRTypst(text) { return '#grid(columns: 1, [QR])'; }

const html = fs.readFileSync('index.html', 'utf8');
const scripts = html.match(/<script[\s\S]*?>([\s\S]*?)<\/script>/g);
let scriptContent = '';
for (const script of scripts) {
  if (script.includes('function genWasmTypst')) {
    scriptContent = script.replace(/<script[\s\S]*?>/g, '').replace(/<\/script>/g, '');
    break;
  }
}

const context = vm.createContext({
    console,
    TEMPLATES: {},
    getQRTypst
});
vm.runInContext(scriptContent, context);

const genWasmTypst = context.genWasmTypst;

// Try generating ds-20-ngang (tf=20, a5)
let out = genWasmTypst({ mcq: 0, tf: 20, tln: 0, paper: 'a5', school: 'TEST', subtitle: 'TEST', hasEssay: false, qrCodeStr: '' });
fs.writeFileSync('test_ds_20.typ', out);

// Try generating tln-10-ngang (tln=10, a5)
let out2 = genWasmTypst({ mcq: 0, tf: 0, tln: 10, paper: 'a5', school: 'TEST', subtitle: 'TEST', hasEssay: false, qrCodeStr: '' });
fs.writeFileSync('test_tln_10.typ', out2);
print("Done")
