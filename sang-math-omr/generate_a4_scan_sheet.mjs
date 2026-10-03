import { readFile, writeFile } from 'node:fs/promises';
import { execFileSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import path from 'node:path';
import vm from 'node:vm';
import './js/a4_scan_sheet.js';

const root = path.dirname(fileURLToPath(import.meta.url));
const { ID, source } = globalThis.OmrA4ScanSheet;
const context = {};
vm.runInNewContext(await readFile(path.join(root, 'js/vendor/qrcode.js'), 'utf8'), context);
const qr = context.qrcode(0, 'M');
qr.addData(`SMOMR:3:P:${ID}`);
qr.make();
const size = qr.getModuleCount();
const quiet = 4;
const cells = [];
for (let row = -quiet; row < size + quiet; row++) {
  for (let col = -quiet; col < size + quiet; col++) {
    const dark = row >= 0 && row < size && col >= 0 && col < size && qr.isDark(row, col);
    cells.push(dark ? 'qb' : 'qw');
  }
}
const qrTypst = `#grid(columns: ${size + quiet * 2}, column-gutter: 0pt, row-gutter: 0pt, ${cells.join(',')})`;
const typstPath = path.join(root, 'templates', `${ID}.typ`);
const pdfPath = path.join(root, 'templates', `${ID}.pdf`);
const svgPath = path.join(root, 'templates', `${ID}.svg`);
const essayTypstPath = path.join(root, 'templates', `${ID}-essay.typ`);
const essayPdfPath = path.join(root, 'templates', `${ID}-essay.pdf`);
await writeFile(typstPath, source('', '', qrTypst));
await writeFile(essayTypstPath, source('', '', qrTypst, true));
execFileSync('typst', ['compile', typstPath, pdfPath], { stdio: 'inherit' });
execFileSync('typst', ['compile', '--format', 'svg', typstPath, svgPath], { stdio: 'inherit' });
execFileSync('typst', ['compile', essayTypstPath, essayPdfPath], { stdio: 'inherit' });
console.log(pdfPath, essayPdfPath);
