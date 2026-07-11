import re

with open('generate_all_presets.cjs', 'r', encoding='utf-8') as f:
    content = f.read()

qr_func = """const qrcode = require('qrcode-generator');
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
    return `#grid(columns: ${size}, spacing: 0pt,\\n  ${rows.join(',\\n  ')}\\n)`;
}
"""

if 'require(\'qrcode-generator\')' not in content:
    content = content.replace("const vm = require('vm');", "const vm = require('vm');\n" + qr_func)

old_build = """function buildTypstCode(mcq, tf, tln, paper) {
  const hasEssay = (mcq === 12 && tf === 4 && tln === 6) || (mcq === 0 && tf === 0 && tln === 10);
  return genWasmTypst({ mcq, tf, tln, paper, school: 'SANG MATH OMR', subtitle: 'Kiểm tra – Môn Toán', hasEssay });
}"""
new_build = """function buildTypstCode(mcq, tf, tln, paper, templateId) {
  const hasEssay = (mcq === 12 && tf === 4 && tln === 6) || (mcq === 0 && tf === 0 && tln === 10);
  const qrCodeStr = getQRTypst(templateId);
  return genWasmTypst({ mcq, tf, tln, paper, school: 'SANG MATH OMR', subtitle: 'Kiểm tra – Môn Toán', hasEssay, qrCodeStr });
}"""
content = content.replace(old_build, new_build)

old_calls = """fs.writeFileSync('templates/tn-40.typ', buildTypstCode(40, 0, 0, 'a4'));
fs.writeFileSync('templates/tn-50.typ', buildTypstCode(50, 0, 0, 'a4'));
fs.writeFileSync('templates/tn-60.typ', buildTypstCode(60, 0, 0, 'a4'));
fs.writeFileSync('templates/ds-12.typ', buildTypstCode(0, 12, 0, 'a4'));
fs.writeFileSync('templates/tln-10.typ', buildTypstCode(0, 0, 10, 'a4'));
fs.writeFileSync('templates/hybrid-28tn-12ds.typ', buildTypstCode(28, 12, 0, 'a4'));
fs.writeFileSync('templates/12-4-6ngang.typ', buildTypstCode(12, 4, 6, 'a5'));
fs.writeFileSync('templates/thptqg-toan-2025.typ', buildTypstCode(12, 4, 6, 'a4'));"""

new_calls = """fs.writeFileSync('templates/tn-40.typ', buildTypstCode(40, 0, 0, 'a4', 'tn-40'));
fs.writeFileSync('templates/tn-50.typ', buildTypstCode(50, 0, 0, 'a4', 'tn-50'));
fs.writeFileSync('templates/tn-60.typ', buildTypstCode(60, 0, 0, 'a4', 'tn-60'));
fs.writeFileSync('templates/ds-12.typ', buildTypstCode(0, 12, 0, 'a4', 'ds-12'));
fs.writeFileSync('templates/tln-10.typ', buildTypstCode(0, 0, 10, 'a4', 'tln-10'));
fs.writeFileSync('templates/hybrid-28tn-12ds.typ', buildTypstCode(28, 12, 0, 'a4', 'hybrid-28tn-12ds'));
fs.writeFileSync('templates/12-4-6ngang.typ', buildTypstCode(12, 4, 6, 'a5', '12-4-6ngang'));
fs.writeFileSync('templates/thptqg-toan-2025.typ', buildTypstCode(12, 4, 6, 'a4', 'thptqg-toan-2025'));"""
content = content.replace(old_calls, new_calls)

with open('generate_all_presets.cjs', 'w', encoding='utf-8') as f:
    f.write(content)
