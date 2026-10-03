import assert from 'node:assert/strict';
import puppeteer from 'puppeteer';

const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
try {
  const page = await browser.newPage();
  await page.goto('http://localhost:8765/', { waitUntil: 'domcontentloaded', timeout: 60000 });
  await page.waitForFunction(() => OmrEngine?.isOpenCvLoaded && TEMPLATES?.['12-4-6-a4-scan'],
    { timeout: 60000 });

  const results = await page.evaluate(async () => {
    const template = TEMPLATES['12-4-6-a4-scan'];
    const base = new Image();
    base.src = './test-data/a4-scan-sheet/blank.png';
    await base.decode();
    const sheet = document.createElement('canvas');
    sheet.width = base.width;
    sheet.height = base.height;
    const context = sheet.getContext('2d');
    context.drawImage(base, 0, 0);
    const scale = sheet.width / template.warp.width;
    const radius = 2 * sheet.width / 210 * 0.77;
    const mark = ([x, y]) => {
      context.beginPath();
      context.arc(x * scale, y * scale, radius, 0, Math.PI * 2);
      context.fillStyle = '#101010';
      context.fill();
    };
    for (let col = 0; col < 6; col++) mark(template.sbd[col][col + 1]);
    for (let col = 0; col < 4; col++) mark(template.made[col][col === 3 ? 1 : 0]);
    for (let q = 1; q <= 12; q++) mark(template.mcq[q][(q - 1) % 4]);
    for (let q = 1; q <= 4; q++) {
      for (const [row, letter] of [...'abcd'].entries()) mark(template.tf[q][letter][(q + row) % 2]);
    }
    const tlnValues = ['12,3', '-1,2', '0,25', '1234', '4', '9,99'];
    for (let q = 1; q <= 6; q++) {
      for (const [col, char] of [...tlnValues[q - 1]].entries()) {
        mark(template.tln[q][col][OmrTlnCodec.bubbleIndex(char, col)]);
      }
    }

    const transformed = document.createElement('canvas');
    transformed.width = 1900;
    transformed.height = 2600;
    const src = cv.imread(sheet);
    const target = new cv.Mat(transformed.height, transformed.width, cv.CV_8UC4,
      new cv.Scalar(40, 40, 40, 255));
    const from = cv.matFromArray(4, 1, cv.CV_32FC2,
      [0, 0, sheet.width - 1, 0, sheet.width - 1, sheet.height - 1, 0, sheet.height - 1]);
    const to = cv.matFromArray(4, 1, cv.CV_32FC2,
      [180, 130, 1690, 85, 1775, 2460, 110, 2520]);
    const transform = cv.getPerspectiveTransform(from, to);
    cv.warpPerspective(src, target, transform,
      new cv.Size(transformed.width, transformed.height), cv.INTER_LINEAR,
      cv.BORDER_CONSTANT, new cv.Scalar(40, 40, 40, 255));
    cv.imshow(transformed, target);
    src.delete(); target.delete(); from.delete(); to.delete(); transform.delete();

    const smaller = document.createElement('canvas');
    smaller.width = Math.round(sheet.width * 0.5);
    smaller.height = Math.round(sheet.height * 0.5);
    smaller.getContext('2d').drawImage(sheet, 0, 0, smaller.width, smaller.height);

    const damageCorners = names => {
      const damaged = document.createElement('canvas');
      damaged.width = sheet.width;
      damaged.height = sheet.height;
      const ctx = damaged.getContext('2d');
      ctx.drawImage(sheet, 0, 0);
      const corners = { tl: [8, 8], tr: [198, 8], bl: [8, 285], br: [198, 285] };
      ctx.fillStyle = 'white';
      for (const name of names) {
        const [x, y] = corners[name];
        ctx.fillRect((x - 1) * sheet.width / 210, (y - 1) * sheet.height / 297,
          6 * sheet.width / 210, 6 * sheet.height / 297);
      }
      return damaged;
    };

    const grade = async (canvas, skipQr = false) => {
      try {
        const result = await OmrEngine.gradeImage(canvas, template,
          { mcq: {}, tf: {}, tln: {} }, '', '12-4-6-a4-scan', 'opencv', { skipQr });
        return { id: result.templateId, sbd: result.sbd, made: result.made,
          answers: result.answers, warnings: result.warnings };
      } catch (error) {
        const mat = cv.imread(canvas);
        const markers = OmrEngine.detectA4ScanMarkers(mat);
        mat.delete();
        return { error: error.message, markers, debug: OmrEngine.lastA4ScanDebug };
      }
    };
    return {
      direct: await grade(sheet),
      perspective: await grade(transformed, true),
      lowResolution: await grade(smaller, true),
      oneDamagedCorner: await grade(damageCorners(['tr']), true),
      twoDamagedCorners: await grade(damageCorners(['tr', 'bl']), true)
    };
  });

  for (const [name, result] of Object.entries(results)) {
    if (result.error) console.error(name, JSON.stringify(result));
    assert.equal(result.id, '12-4-6-a4-scan', name);
    assert.equal(result.sbd, '123456', name);
    assert.equal(result.made, '0001', name);
    for (let q = 1; q <= 12; q++) {
      assert.equal(result.answers[`mcq-${q}`], 'ABCD'[(q - 1) % 4], `${name} MCQ ${q}`);
    }
    for (let q = 1; q <= 4; q++) {
      for (const [row, letter] of [...'abcd'].entries()) {
        assert.equal(result.answers[`tf-${q + 12}`]?.[letter], (q + row) % 2 ? 'S' : 'Đ',
          `${name} TF ${q}${letter}`);
      }
    }
    for (const [q, value] of ['12,3', '-1,2', '0,25', '1234', '4', '9,99'].entries()) {
      assert.equal(result.answers[`tln-${q + 17}`], value, `${name} TLN ${q + 1}`);
    }
    if (name === 'direct' || name === 'lowResolution') {
      assert.deepEqual(result.warnings, [], `${name} warnings`);
    } else {
      assert.ok(result.warnings.every(warning => warning.startsWith('Đã căn phiếu từ ')),
        `${name} warnings: ${result.warnings.join('; ')}`);
    }
    console.log(`${name}: SBD ${result.sbd}, mã ${result.made}, 12 TN + 16 Đ/S + 6 TLN đúng`);
  }
} finally {
  await browser.close();
}
