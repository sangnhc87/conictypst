/* Anonymous two-sided A3 sheet. Coordinates are shared by print and OMR. */
(function (root) {
  'use strict';

  const BASE_ID = 'a3-phach';
  const DEFAULT = Object.freeze({ mcq: 16, tf: 2, tln: 4 });
  const MAX = Object.freeze({ mcq: 24, tf: 4, tln: 4 });
  const FRAME = Object.freeze({ left: 221, right: 376, top: 10, bottom: 286 });
  const SCALE = 1500 / (FRAME.right - FRAME.left);
  const WARP_HEIGHT = Math.round((FRAME.bottom - FRAME.top) * SCALE);
  const columnSymbols = [
    ['-', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
    [',', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
    [',', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
    ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  ];
  const sbdXs = Array.from({ length: 6 }, (_, i) => 232 + i * 6);
  const madeXs = Array.from({ length: 4 }, (_, i) => 338 + i * 7.2);
  const identityYs = Array.from({ length: 10 }, (_, i) => 78 + i * 4.05);
  const safeText = value => String(value ?? '').replace(/[\\#\[\]{}]/g, ' ').slice(0, 90);
  const fmt = value => Number(value).toFixed(2);
  const at = (x, y, content) => `#place(top + left, dx: ${fmt(x)}mm, dy: ${fmt(y)}mm)[${content}]`;
  const label = (x, y, value, size = 8, weight = 'regular', color = '#183047') =>
    at(x, y, `#text(size: ${size}pt, weight: "${weight}", fill: rgb("${color}"))[${safeText(value)}]`);
  const box = (x, y, width, height, color = '#a9b9c4') =>
    at(x, y, `#rect(width: ${fmt(width)}mm, height: ${fmt(height)}mm, stroke: 0.42pt + rgb("${color}"))`);
  const line = (x, y, width, color = '#adb8c4', thickness = .4) =>
    at(x, y, `#line(length: ${fmt(width)}mm, stroke: ${thickness}pt + rgb("${color}"))`);
  const fillRect = (x, y, width, height, color) =>
    at(x, y, `#rect(width: ${fmt(width)}mm, height: ${fmt(height)}mm, fill: rgb("${color}"), stroke: none)`);
  const bubble = (x, y, filled = false, radius = 1.72) =>
    at(x - radius, y - radius, `#circle(radius: ${radius}mm, stroke: 0.43pt + rgb("#3b4650"), fill: ${filled ? 'black' : 'white'})`);
  const marker = (x, y) => at(x - 2, y - 2, '#box(width: 4mm, height: 4mm, fill: black)');
  const band = (y, title, fill, accent) => [
    fillRect(225, y, 147, 5.6, fill), fillRect(225, y, 1.2, 5.6, accent),
    label(229, y + .65, title, 7.8, 'bold', accent)
  ];

  function counts(input = DEFAULT) {
    const result = {};
    for (const key of ['mcq', 'tf', 'tln']) {
      const value = Number(input[key] ?? DEFAULT[key]);
      if (!Number.isInteger(value) || value < 0 || value > MAX[key])
        throw new Error(`${key.toUpperCase()} phải từ 0 đến ${MAX[key]}.`);
      result[key] = value;
    }
    if (!result.mcq && !result.tf && !result.tln) throw new Error('Cần ít nhất một phần câu hỏi.');
    return result;
  }
  function idFor(input) {
    const c = counts(input);
    return `${BASE_ID}-${c.mcq}-${c.tf}-${c.tln}`;
  }
  function descriptor(input) {
    const c = counts(input);
    return { id: idFor(c), name: `A3 cắt phách ${c.mcq}-${c.tf}-${c.tln}`,
      ...c, paper: 'a3', version: 4, a3Cut: true, dynamic: true };
  }
  function fromId(id) {
    const match = /^a3-phach-(\d+)-(\d+)-(\d+)$/.exec(String(id || ''));
    return match ? descriptor({ mcq: Number(match[1]), tf: Number(match[2]), tln: Number(match[3]) }) : null;
  }
  function point(x, y) {
    return [Number(((x - FRAME.left) * SCALE).toFixed(2)),
      Number(((y - FRAME.top) * SCALE).toFixed(2))];
  }
  function tlnX(q, col) { return 239 + (q - 1) * 37.5 + col * 5.6; }
  function tlnY(row) { return 231 + row * 4.15; }
  function symbolRow(symbol) { return symbol === '-' ? 0 : symbol === ',' ? 1 : Number(symbol) + 2; }

  function template(input = DEFAULT) {
    const c = counts(input);
    const output = {
      ...descriptor(c), numSbd: 6, numMade: 4, numQ: c.mcq, numTf: c.tf, numTln: c.tln,
      tlnSchema: 2, phachMode: true, a3Cut: true,
      warp: { width: 1500, height: WARP_HEIGHT,
        TL: [0, 0], TR: [1500, 0], BR: [1500, WARP_HEIGHT], BL: [0, WARP_HEIGHT] },
      sbd: sbdXs.map(x => identityYs.map(y => point(x, y))),
      made: madeXs.map(x => identityYs.map(y => point(x, y))),
      mcq: {}, tf: {}, tln: {}
    };
    for (let q = 1; q <= c.mcq; q++) {
      const group = Math.floor((q - 1) / 8), row = (q - 1) % 8;
      output.mcq[q] = Array.from({ length: 4 }, (_, option) =>
        point(239 + group * 49 + option * 6, 130.5 + row * 4.7));
    }
    for (let q = 1; q <= c.tf; q++) {
      const column = (q - 1) % 2, row = Math.floor((q - 1) / 2);
      output.tf[q] = {};
      for (let clause = 0; clause < 4; clause++) {
        const y = 179 + row * 19 + clause * 4.1;
        output.tf[q]['abcd'[clause]] = [point(255 + column * 73, y), point(262 + column * 73, y)];
      }
    }
    for (let q = 1; q <= c.tln; q++) {
      output.tln[q] = Array.from({ length: 4 }, (_, col) =>
        columnSymbols[col].map(symbol => point(tlnX(q, col), tlnY(symbolRow(symbol)))));
    }
    return output;
  }

  function front(c, code, school, subtitle, qrCodeStr, sampleOnly = false) {
    const out = ['#box(width: 1pt, height: 1pt)'];
    // Left A4 writing half and central fold.
    out.push(fillRect(0, 0, 210, 297, '#fcfdfd'));
    out.push(label(13, 13, 'PHẦN TỰ LUẬN  /  BÀI LÀM', 12.5, 'bold', '#173b53'));
    out.push(label(13, 22, 'Viết rõ từng bước giải. Không ghi họ tên ở phần bài làm.', 7.2));
    for (let i = 0; i < 28; i++) out.push(line(13, 34 + i * 8.9, 184, '#c4ced6', .35));
    out.push(fillRect(209.8, 0, .35, 297, '#9bb2bf'));
    out.push(label(195.6, 273, 'NẾP GẤP A3', 6.8, 'bold', '#668294'));
    if (sampleOnly) out.push(label(13, 284, 'BẢN MẪU MỘT BÀI · KHÔNG SAO IN CHO CẢ LỚP', 7.2, 'bold', '#a95315'));

    // Anonymous body. Only this area is scanned after the strip is cut.
    out.push(fillRect(213, 0, 169, 297, '#ffffff'));
    out.push(fillRect(225, 17, 1.3, 20, '#0e947b'));
    out.push(label(230, 17.5, 'SANG MATH  /  BÀI KIỂM TRA', 7.0, 'bold', '#0b7467'));
    out.push(label(230, 23, 'PHIẾU THI ẨN DANH', 13.2, 'bold', '#143049'));
    out.push(label(230, 31, `${c.mcq} TN  ·  ${c.tf} ĐÚNG/SAI  ·  ${c.tln} TRẢ LỜI NGẮN`, 6.7, 'medium', '#536b7c'));
    out.push(label(226, 39, school, 7.3, 'bold'));
    out.push(label(226, 45, subtitle, 7.0));
    out.push(box(225, 50, 147, 12));
    out.push(label(229, 52, `MÃ PHÁCH  P${code}`, 8.5, 'bold', '#0b7467'));
    out.push(label(300, 52, 'Điểm TN', 7.1)); out.push(line(319, 58.5, 20));
    out.push(label(342, 52, 'Điểm TL', 7.1)); out.push(line(359, 58.5, 10));
    out.push(at(349, 17, qrCodeStr || '#text(size: 7pt)[QR]'));

    out.push(box(225, 64, 147, 54));
    out.push(label(229, 66, 'MÃ PHÁCH ĐÃ IN', 7.5, 'bold', '#0b7467'));
    out.push(label(335, 66, 'MÃ ĐỀ · TỰ TÔ', 7.5, 'bold', '#0b7467'));
    out.push(label(275, 76, 'Mã phách dùng ghép bài sau khi chấm.', 6.6, 'medium', '#64748b'));
    out.push(label(275, 84, 'Không viết họ tên hoặc SBD tại đây.', 6.6, 'medium', '#64748b'));
    for (let row = 0; row < 10; row++) {
      out.push(label(227.5, identityYs[row] - 1.7, row, 6.1));
      out.push(label(333.5, identityYs[row] - 1.7, row, 6.1));
      for (let col = 0; col < 6; col++) out.push(bubble(sbdXs[col], identityYs[row], Number(code[col]) === row, 1.5));
      for (const x of madeXs) out.push(bubble(x, identityYs[row], false, 1.5));
    }
    for (let col = 0; col < 6; col++) out.push(box(sbdXs[col] - 2, 70, 4, 4));
    for (const x of madeXs) out.push(box(x - 2, 70, 4, 4));

    out.push(box(225, 120, 147, 47));
    out.push(...band(120, `PHẦN I  /  TRẮC NGHIỆM · ${c.mcq} CÂU`, '#edf3fb', '#2459a7'));
    for (let group = 0; group < 3; group++) {
      const start = 229 + group * 49;
      if (group * 8 >= c.mcq) continue;
      for (let option = 0; option < 4; option++) out.push(label(237 + group * 49 + option * 6, 126, 'ABCD'[option], 6.3, 'bold'));
      for (let row = 0; row < 8; row++) {
        const q = group * 8 + row + 1;
        if (q > c.mcq) continue;
        out.push(label(start, 129 + row * 4.7, `${q}.`, 6.6, 'bold'));
        for (let option = 0; option < 4; option++) out.push(bubble(239 + group * 49 + option * 6, 130.5 + row * 4.7));
      }
      if (group < 2) out.push(fillRect(273.5 + group * 49, 127, .25, 38, '#dce5ec'));
    }

    out.push(box(225, 169, 147, 43));
    out.push(...band(169, `PHẦN II  /  ĐÚNG - SAI · ${c.tf} CÂU`, '#fff3e9', '#a95315'));
    for (let q = 1; q <= c.tf; q++) {
      const col = (q - 1) % 2, row = Math.floor((q - 1) / 2);
      const start = 229 + col * 73, top = 175.5 + row * 19;
      out.push(label(start, top, `Câu ${q}`, 6.6, 'bold'));
      out.push(label(start + 25, top, 'Đ', 6.3, 'bold'));
      out.push(label(start + 32, top, 'S', 6.3, 'bold'));
      for (let clause = 0; clause < 4; clause++) {
        out.push(label(start + 14, top + 2 + clause * 4.1, `${'abcd'[clause]})`, 6.4));
        out.push(bubble(255 + col * 73, 179 + row * 19 + clause * 4.1, false, 1.55));
        out.push(bubble(262 + col * 73, 179 + row * 19 + clause * 4.1, false, 1.55));
      }
    }
    out.push(fillRect(298.5, 176, .25, 34, '#eadcd1'));

    out.push(box(225, 214, 147, 67));
    out.push(...band(214, `PHẦN III  /  TRẢ LỜI NGẮN · ${c.tln} CÂU`, '#eaf8f0', '#167348'));
    for (let q = 1; q <= c.tln; q++) {
      const start = 227 + (q - 1) * 37.5;
      out.push(label(start + 1, 221, `Câu ${q}`, 6.6, 'bold'));
      for (let col = 0; col < 4; col++) out.push(box(tlnX(q, col) - 1.9, 224, 3.8, 3.8));
      for (let row = 0; row < 12; row++) {
        const symbol = row === 0 ? '-' : row === 1 ? ',' : String(row - 2);
        out.push(label(start, tlnY(row) - 1.8, symbol, 5.9));
        for (let col = 0; col < 4; col++) {
          if ((col === 0 && row === 1) || (col === 3 && row < 2) || (col > 0 && row === 0)) continue;
          out.push(bubble(tlnX(q, col), tlnY(row), false, 1.55));
        }
      }
      if (q < 4) out.push(fillRect(263 + (q - 1) * 37.5, 221, .25, 58, '#dce5ec'));
    }

    // Eight robust markers; the outer four define the OMR coordinate frame.
    for (const x of [FRAME.left, (FRAME.left + FRAME.right) / 2, FRAME.right]) {
      out.push(marker(x, FRAME.top), marker(x, FRAME.bottom));
    }
    out.push(marker(FRAME.left, 148), marker(FRAME.right, 148));

    // Detachable identity strip stays separate from the scored answer sheet.
    out.push(fillRect(383, 0, 37, 297, '#fbf5ed'));
    for (let y = 2; y < 295; y += 6) out.push(fillRect(382, y, .33, 3.4, '#ba6836'));
    out.push(label(387, 18, 'PHẦN CẮT PHÁCH', 9.1, 'bold', '#9e4b1b'));
    out.push(label(387, 30, `P${code}`, 12, 'bold', '#9e4b1b'));
    out.push(label(387, 45, 'Họ và tên', 7.2, 'bold')); out.push(line(387, 54, 29));
    out.push(line(387, 63, 29));
    out.push(label(387, 72, 'Lớp', 7.2, 'bold')); out.push(line(387, 81, 29));
    out.push(label(387, 92, 'Số báo danh', 7.2, 'bold'));
    for (let col = 0; col < 6; col++) out.push(box(387 + col * 4.9, 102, 4.2, 5.1));
    out.push(label(387, 119, 'Mã đề', 7.2, 'bold')); out.push(line(387, 128, 29));
    out.push(label(387, 145, 'Chỉ cắt khi đã thu bài.', 6.6, 'medium', '#9e4b1b'));
    out.push(label(387, 154, 'Giữ dải phách để ghép', 6.6, 'medium', '#9e4b1b'));
    out.push(label(387, 161, 'điểm với học sinh.', 6.6, 'medium', '#9e4b1b'));
    out.push(label(387, 185, 'Chữ ký giám thị', 7.0, 'bold')); out.push(line(387, 195, 29));
    out.push(label(387, 265, `MÃ PHÁCH P${code}`, 7.0, 'bold', '#9e4b1b'));
    return out;
  }

  function back(code, sampleOnly = false) {
    const out = ['#box(width: 1pt, height: 1pt)'];
    out.push(label(13, 13, 'BÀI LÀM TỰ LUẬN  /  MẶT SAU', 12, 'bold', '#173b53'));
    out.push(label(299, 15, `MÃ PHÁCH P${code}`, 7.8, 'bold', '#0b7467'));
    out.push(fillRect(209.8, 0, .35, 297, '#9bb2bf'));
    for (let i = 0; i < 28; i++) {
      const y = 34 + i * 8.9;
      out.push(line(13, y, 184, '#c4ced6', .35));
      out.push(line(224, y, 147, '#c4ced6', .35));
    }
    if (sampleOnly) out.push(label(13, 284, 'BẢN MẪU MỘT BÀI · HÃY SINH FILE RIÊNG CÓ MÃ PHÁCH KHÁC NHAU', 7.2, 'bold', '#a95315'));
    out.push(fillRect(383, 0, 37, 297, '#fbf5ed'));
    for (let y = 2; y < 295; y += 6) out.push(fillRect(382, y, .33, 3.4, '#ba6836'));
    out.push(label(387, 30, 'PHẦN CẮT PHÁCH', 8.2, 'bold', '#9e4b1b'));
    out.push(label(387, 40, `P${code}`, 11, 'bold', '#9e4b1b'));
    out.push(label(387, 260, 'Không viết vào dải này.', 6.4, 'medium', '#9e4b1b'));
    return out;
  }

  function source(options = {}) {
    const c = counts(options);
    const copies = Number(options.copies ?? 1), startCode = Number(options.startCode ?? 800001);
    if (!Number.isInteger(copies) || copies < 1 || copies > 100) throw new Error('Số bản A3 phải từ 1 đến 100.');
    if (!Number.isInteger(startCode) || startCode < 100000 || startCode + copies - 1 > 999999)
      throw new Error('Mã phách đầu phải gồm 6 chữ số và đủ chỗ cho toàn bộ bản in.');
    const school = safeText(options.school || 'TRƯỜNG THPT SANG MATH');
    const subtitle = safeText(options.subtitle || 'KIỂM TRA MÔN TOÁN');
    const qrCodeStr = String(options.qrCodeStr || '');
    const out = [
      '// A3 cut-sheet: print duplex on A3 landscape at 100%.',
      '#set page(width: 420mm, height: 297mm, margin: 0mm, fill: white)',
      '#set text(font: "Avenir Next", size: 8pt, fill: rgb("#183047"))',
      '#let qb = box(width: 1.12pt, height: 1.12pt, fill: black)',
      '#let qw = box(width: 1.12pt, height: 1.12pt, fill: white)'
    ];
    for (let n = 0; n < copies; n++) {
      const code = String(startCode + n).padStart(6, '0');
      if (n) out.push('#pagebreak()');
      out.push(...front(c, code, school, subtitle, qrCodeStr, Boolean(options.sampleOnly)));
      out.push('#pagebreak()');
      out.push(...back(code, Boolean(options.sampleOnly)));
    }
    return out.join('\n') + '\n';
  }

  root.OmrA3CutSheet = Object.freeze({ BASE_ID, DEFAULT, MAX, FRAME,
    counts, descriptor, fromId, template, source });
  if (typeof module !== 'undefined' && module.exports) module.exports = root.OmrA3CutSheet;
})(typeof window !== 'undefined' ? window : globalThis);
