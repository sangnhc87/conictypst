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
            rowCols.push(qr.isDark(r, c) ? "box(width: 2.2pt, height: 2.2pt, fill: black)" : "box(width: 2.2pt, height: 2.2pt, fill: white)");
        }
        rows.push(rowCols.join(', '));
    }
    return `#grid(columns: ${size}, spacing: 0pt,\n  ${rows.join(',\n  ')}\n)`;
}

console.log(getQRTypst('tn-50').substring(0, 500));
