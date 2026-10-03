/* One physical A4 page, one OMR profile. All positions are in millimetres. */
(function (root) {
  'use strict';

  const ID = '12-4-6-a4-scan';
  const SCALE = 1500 / 210;
  const point = (x, y) => [Number((x * SCALE).toFixed(2)), Number((y * SCALE).toFixed(2))];
  const sbdXs = Array.from({ length: 6 }, (_, i) => 26 + 7 * i);
  const madeXs = Array.from({ length: 4 }, (_, i) => 145 + 8 * i);
  const identityYs = Array.from({ length: 10 }, (_, i) => 62.5 + 4.9 * i);
  const tlnXs = q => Array.from({ length: 4 }, (_, col) => 23 + (q - 1) * 30.4 + col * 6);
  const tlnY = row => 225 + row * 4.7;
  const columnSymbols = [
    ['-', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
    [',', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
    [',', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
    ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  ];
  const symbolRow = symbol => symbol === '-' ? 0 : symbol === ',' ? 1 : Number(symbol) + 2;

  const template = {
    numSbd: 6, numMade: 4, numQ: 12, numTf: 4, numTln: 6,
    tlnSchema: 2,
    warp: {
      width: 1500, height: Math.round(297 * SCALE),
      TL: point(10, 10), TR: point(200, 10),
      BR: point(200, 287), BL: point(10, 287)
    },
    sbd: sbdXs.map(x => identityYs.map(y => point(x, y))),
    made: madeXs.map(x => identityYs.map(y => point(x, y))),
    mcq: {}, tf: {}, tln: {}
  };
  for (let q = 1; q <= 12; q++) {
    const group = Math.floor((q - 1) / 4);
    const row = (q - 1) % 4;
    template.mcq[q] = Array.from({ length: 4 }, (_, option) =>
      point(36 + group * 60 + option * 8, 125 + row * 9));
  }
  for (let q = 1; q <= 4; q++) {
    const x = 41 + (q - 1) * 45;
    const y = 172;
    template.tf[q] = {};
    for (let row = 0; row < 4; row++) {
      template.tf[q]['abcd'[row]] = [point(x, y + row * 8), point(x + 9, y + row * 8)];
    }
  }
  for (let q = 1; q <= 6; q++) {
    template.tln[q] = tlnXs(q).map((x, col) =>
      columnSymbols[col].map(symbol => point(x, tlnY(symbolRow(symbol)))));
  }

  const safeText = value => String(value ?? '').replace(/\s+/g, ' ').slice(0, 90)
    .replace(/[\\#\[\]{}]/g, char => `\\${char}`);
  const at = (x, y, content) => `#place(top + left, dx: ${x.toFixed(2)}mm, dy: ${y.toFixed(2)}mm)[${content}]`;
  const label = (x, y, value, size = 8, weight = 'regular', color = '#1e293b') =>
    at(x, y, `#text(size: ${size}pt, weight: "${weight}", fill: rgb("${color}"))[${safeText(value)}]`);
  const fittedLabel = (x, y, value, width, size, minSize = 6, weight = 'regular', color = '#1e293b') => {
    const content = safeText(value);
    const units = Array.from(content).reduce((sum, char) => sum +
      (/\s/u.test(char) ? 0.28 : /[.,:;!·/\-]/u.test(char) ? 0.34 : /[A-ZÀ-ỸĐ]/u.test(char) ? 0.66 : 0.54), 0);
    const fitSize = units ? Math.min(size, width * 72 / 25.4 * 0.9 / units) : size;
    const actualSize = Math.max(minSize, fitSize).toFixed(2);
    return at(x, y, `#box(width: ${width}mm, height: 4.5mm, clip: true)[#text(size: ${actualSize}pt, weight: "${weight}", fill: rgb("${color}"))[${content}]]`);
  };
  const rule = (x, y, width) =>
    at(x, y, `#line(length: ${width}mm, stroke: 0.4pt + rgb("#94a3b8"))`);
  const band = (x, y, width, title, fill, accent) => [
    at(x, y, `#rect(width: ${width}mm, height: 6mm, fill: rgb("${fill}"), stroke: none)`),
    at(x, y, `#rect(width: 1.25mm, height: 6mm, fill: rgb("${accent}"), stroke: none)`),
    label(x + 3, y + 1.0, title, 8.7, 'bold', accent)
  ];
  const divider = (x, y, height) =>
    at(x, y, `#rect(width: 0.25mm, height: ${height}mm, fill: rgb("#dbe2ea"), stroke: none)`);
  const bubble = (x, y) => at(x - 2, y - 2,
    '#circle(radius: 2mm, stroke: 0.45pt + rgb("#333333"), fill: white)');
  const box = (x, y, w, h, stroke = '#a3a3a3') =>
    at(x, y, `#rect(width: ${w}mm, height: ${h}mm, stroke: 0.35pt + rgb("${stroke}"))`);
  const marker = (x, y, size = 4) => at(x, y,
    `#box(width: ${size}mm, height: ${size}mm, fill: black)`);

  const DEFAULT_TEXT = Object.freeze({
    brand: 'SANG MATH  /  PHIẾU TRẢ LỜI',
    title: 'PHIẾU TRẢ LỜI TOÁN',
    structure: '12 TRẮC NGHIỆM    ·    4 ĐÚNG / SAI    ·    6 TRẢ LỜI NGẮN',
    studentLabel: 'Họ và tên',
    classLabel: 'Lớp',
    schoolLabel: 'Trường',
    examLabel: 'Kỳ kiểm tra',
    guideTitle: 'HƯỚNG DẪN TÔ',
    guide1: '01   Tô kín trọn một ô.',
    guide2: '02   Không tô hai ô cùng hàng.',
    guide3: '03   Không gạch, không tẩy mờ.',
    printNote: 'In đúng tỷ lệ 100% trên A4.',
    scanNote: 'Scan trọn cả 8 mốc định vị.'
  });

  function source(school = '', subtitle = '', qrCodeStr = '', hasEssay = false, textOptions = {}) {
    const copy = { ...DEFAULT_TEXT, ...textOptions };
    const out = [
      '// Sang Math OMR - phieu 12-4-6 A4 chuan, one sheet per page.',
      '#set page(paper: "a4", margin: 0mm, fill: white)',
      '#set text(font: "Avenir Next", size: 8pt, fill: rgb("#1e293b"))',
      '#let qb = box(width: 1.15pt, height: 1.15pt, fill: black)',
      '#let qw = box(width: 1.15pt, height: 1.15pt, fill: white)',
      '#box(width: 1pt, height: 1pt)',
      marker(8, 8), marker(103, 8), marker(198, 8),
      marker(8, 146.5), marker(198, 146.5),
      marker(8, 285), marker(103, 285), marker(198, 285),
      at(16, 14, '#rect(width: 1.5mm, height: 16mm, fill: rgb("#0f9f84"), stroke: none)'),
      fittedLabel(20, 14.5, copy.brand, 150, 7.2, 6.5, 'bold', '#0f766e'),
      fittedLabel(20, 19.4, copy.title, 150, 15.5, 11.5, 'bold', '#11283d'),
      fittedLabel(20, 28.3, copy.structure, 150, 8.1, 6.5, 'medium', '#475569'),
      fittedLabel(16, 34, copy.studentLabel, 23, 8, 6.2), rule(40, 38.5, 75),
      fittedLabel(122, 34, copy.classLabel, 11, 8, 6.2), rule(134, 38.5, 62),
      fittedLabel(16, 41, copy.schoolLabel, 23, 8, 6.2), rule(40, 45.5, 67),
      fittedLabel(112, 41, copy.examLabel, 26, 8, 6.2), rule(139, 45.5, 57),
      school ? fittedLabel(40, 40.5, school, 67, 7.4, 6.2) : '',
      subtitle ? fittedLabel(139, 40.5, subtitle, 57, 7.4, 6.2) : '',
      box(173, 16, 18, 18, '#0f766e'),
      at(175, 18, qrCodeStr || '#text(size: 7pt)[QR]'),
      label(175, 35, 'A4 · 8 MỐC', 6.5, 'bold', '#0f766e'),
      box(16, 48, 180, 62),
      label(18, 49, 'SỐ BÁO DANH', 9, 'bold', '#0f766e'),
      label(137, 49, 'MÃ ĐỀ', 9, 'bold', '#0f766e'),
      at(76, 57, '#rect(width: 52mm, height: 45mm, radius: 2mm, fill: rgb("#f0f8f7"), stroke: 0.3pt + rgb("#c9e7e2"))'),
      fittedLabel(79, 61, copy.guideTitle, 46, 8.5, 6.3, 'bold', '#0f766e'),
      fittedLabel(79, 68, copy.guide1, 46, 7.7, 6.3),
      fittedLabel(79, 75, copy.guide2, 46, 7.7, 6.3),
      fittedLabel(79, 82, copy.guide3, 46, 7.7, 6.3),
      fittedLabel(79, 91, copy.printNote, 46, 7.5, 6.3, 'bold'),
      fittedLabel(79, 96, copy.scanNote, 46, 7.5, 6.3),
      box(16, 112, 180, 43),
      ...band(16, 112, 180, 'PHẦN I  /  TRẮC NGHIỆM   ·   Chọn một đáp án', '#edf4fe', '#2459a7'),
      divider(76, 119, 35), divider(136, 119, 35),
      box(16, 157, 180, 45),
      ...band(16, 157, 180, 'PHẦN II  /  ĐÚNG - SAI   ·   Mỗi ý chọn Đ hoặc S', '#fff4e9', '#a85113'),
      divider(61, 164, 37), divider(106, 164, 37), divider(151, 164, 37),
      box(16, 204, 180, 76),
      ...band(16, 204, 180, 'PHẦN III  /  TRẢ LỜI NGẮN   ·   Tối đa 4 ký tự, dùng dấu phẩy', '#edf8f2', '#137248'),
      ...Array.from({ length: 5 }, (_, i) => divider(46.4 + i * 30.4, 211, 68)),
    ];

    for (let row = 0; row < 10; row++) {
      out.push(label(18.5, identityYs[row] - 2.1, row, 6.8));
      out.push(label(137, identityYs[row] - 2.1, row, 6.8));
      for (const x of sbdXs) out.push(bubble(x, identityYs[row]));
    }
    for (let row = 0; row < 10; row++) {
      for (const x of madeXs) out.push(bubble(x, identityYs[row]));
    }
    for (const x of sbdXs) out.push(box(x - 2.25, 52, 4.5, 4.5, '#444444'));
    for (const x of madeXs) out.push(box(x - 2.25, 52, 4.5, 4.5, '#444444'));

    for (let group = 0; group < 3; group++) {
      const start = 16 + group * 60;
      for (let option = 0; option < 4; option++) {
        out.push(label(33.9 + group * 60 + option * 8, 119, 'ABCD'[option], 8, 'bold'));
      }
      for (let row = 0; row < 4; row++) {
        const q = group * 4 + row + 1;
        out.push(label(start + 4, 123 + row * 9, String(q).padStart(2, '0') + '.', 8, 'bold'));
        for (const [x, y] of template.mcq[q]) out.push(bubble(x / SCALE, y / SCALE));
      }
    }

    for (let q = 1; q <= 4; q++) {
      const left = 17 + (q - 1) * 45;
      const top = 165;
      out.push(label(left, top, `Câu ${q}`, 8, 'bold'));
      out.push(label(left + 22.5, top, 'Đ', 7.5, 'bold'));
      out.push(label(left + 31.5, top, 'S', 7.5, 'bold'));
      for (let row = 0; row < 4; row++) {
        out.push(label(left + 10, top + 5 + row * 8, `${'abcd'[row]})`, 8));
        for (const [x, y] of template.tf[q]['abcd'[row]]) out.push(bubble(x / SCALE, y / SCALE));
      }
    }

    for (let q = 1; q <= 6; q++) {
      const xs = tlnXs(q);
      const start = 16 + (q - 1) * 30.4;
      out.push(label(start + 1, 211, `Câu ${q}`, 8, 'bold'));
      for (const x of xs) out.push(box(x - 2.25, 214, 4.5, 4.5, '#555555'));
      for (let row = 0; row < 12; row++) {
        const symbol = row === 0 ? '-' : row === 1 ? ',' : String(row - 2);
        out.push(label(start + 0.5, tlnY(row) - 2.1, symbol, 7.2));
        for (let col = 0; col < 4; col++) {
          if (col === 0 && row === 1) continue;
          if (col === 3 && row < 2) continue;
          if (col > 0 && row === 0) continue;
          out.push(bubble(xs[col], tlnY(row)));
        }
      }
    }
    if (hasEssay) {
      out.push('#pagebreak()', '#box(width: 1pt, height: 1pt)');
      out.push(at(16, 17, '#rect(width: 1.5mm, height: 16mm, fill: rgb("#0f9f84"), stroke: none)'));
      out.push(label(20, 17, `${copy.brand.slice(0, 23)}  /  TỰ LUẬN`, 7.5, 'bold', '#0f766e'));
      out.push(label(20, 23, 'BÀI LÀM TỰ LUẬN', 16, 'bold', '#11283d'));
      out.push(fittedLabel(16, 39, copy.studentLabel, 23, 8, 6.2)); out.push(rule(40, 44, 93));
      out.push(fittedLabel(142, 39, copy.classLabel, 10, 8, 6.2)); out.push(rule(153, 44, 40));
      out.push(label(16, 48, 'Số báo danh', 8)); out.push(rule(44, 53, 54));
      out.push(label(110, 48, 'Mã đề', 8)); out.push(rule(129, 53, 64));
      out.push(...band(16, 60, 180, 'PHẦN TỰ LUẬN  /  Trình bày rõ các bước giải', '#edf8f2', '#137248'));
      for (let i = 0; i < 18; i++) out.push(rule(17, 73 + i * 11.4, 178));
      out.push(label(16, 281, 'Trang tự luận không dùng để chấm OMR tự động.', 7, 'medium', '#64748b'));
    }
    return out.join('\n') + '\n';
  }

  root.OmrA4ScanSheet = { ID, template, DEFAULT_TEXT, source };
  if (typeof module !== 'undefined' && module.exports) module.exports = root.OmrA4ScanSheet;
})(typeof window !== 'undefined' ? window : globalThis);
