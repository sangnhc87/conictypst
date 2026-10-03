import assert from 'node:assert/strict';
import { execFileSync } from 'node:child_process';
import { readFileSync, writeFileSync } from 'node:fs';
import vm from 'node:vm';
import puppeteer from 'puppeteer';

const sheetContext = {};
sheetContext.window = sheetContext;
vm.runInNewContext(readFileSync('sang-math-omr/js/a3_cut_sheet.js', 'utf8'), sheetContext);
const sheet = sheetContext.OmrA3CutSheet;
assert.throws(() => sheet.descriptor({ mcq: 25, tf: 4, tln: 4 }), /0 đến 24/);
assert.throws(() => sheet.descriptor({ mcq: 24, tf: 5, tln: 4 }), /0 đến 4/);

const qrContext = {};
vm.runInNewContext(readFileSync('sang-math-omr/js/vendor/qrcode.js', 'utf8'), qrContext);
sheetContext.qrcode = qrContext.qrcode;
vm.runInNewContext(readFileSync('sang-math-omr/js/omr_profiles.js', 'utf8'), sheetContext);

const profiles = [sheet.DEFAULT, sheet.MAX];
const samples = [];
for (const [index, counts] of profiles.entries()) {
  const descriptor = sheet.descriptor(counts);
  const qrCodeStr = sheetContext.OmrProfiles.qrTypst(descriptor);
  assert.ok(qrCodeStr.includes('#grid('), 'QR must be printed');
  const source = sheet.source({ ...counts, startCode: 800001 + index, qrCodeStr });
  const file = `/private/tmp/a3-cut-test-${index}`;
  writeFileSync(`${file}.typ`, source);
  execFileSync('typst', ['compile', `${file}.typ`, `${file}.pdf`]);
  execFileSync('pdftoppm', ['-f', '1', '-l', '1', '-r', '205', '-singlefile', '-png', `${file}.pdf`, file]);
  samples.push({ file: `${file}.png`, descriptor });
}

const browser = await puppeteer.launch({ headless: true, timeout: 60000,
  args: ['--no-sandbox', '--disable-gpu'] });
try {
  const page = await browser.newPage();
  page.on('pageerror', error => console.error('page error:', error.message));
  await page.goto('http://localhost:8765/', { waitUntil: 'domcontentloaded', timeout: 60000 });
  await page.waitForFunction(() => OmrEngine?.isOpenCvLoaded && window.OmrA3CutSheet, { timeout: 60000 });
  const ui = await page.evaluate(() => {
    const card = document.querySelector('#tmplCards .tmpl-card[data-type="a3-phach"]');
    selectTemplate('a3-phach', card);
    document.getElementById('a3Mcq').value = '24';
    document.getElementById('a3Tf').value = '4';
    updateA3PhachConfig();
    const source = getWasmTypstSource('a3-phach', 'TRƯỜNG THỬ', 'KIỂM TRA');
    return { selected: document.getElementById('sheetTypeGrade').value,
      configVisible: document.getElementById('a3PhachConfig').style.display !== 'none',
      qr: source.includes('#grid('), twoSided: source.includes('#pagebreak()'),
      maxLabel: source.includes('24 TN') };
  });
  assert.deepEqual(ui, { selected: 'a3-phach-24-4-4', configVisible: true,
    qr: true, twoSided: true, maxLabel: true });
  const review = await page.evaluate(() => {
    const result = { id: 'a3-review', templateId: 'a3-phach-16-2-4',
      sbd: 'P800001', phachCode: 'P800001', made: '0001', score: '7.50',
      answers: {}, warnings: [], reviewStatus: 'confirmed', filename: 'scan_1.jpg' };
    const pending = isReviewPending(result);
    openBatchReview(result);
    const note = document.getElementById('batchReviewPhach').textContent;
    const sbdInput = document.getElementById('batchReviewSbd').value;
    closeBatchReview();
    result.sbd = '123456';
    return { pending, note: note.includes('P800001'), sbdInput,
      matchedPending: isReviewPending(result) };
  });
  assert.deepEqual(review, { pending: true, note: true, sbdInput: '', matchedPending: false });
  for (const { file, descriptor } of samples) {
    const image = readFileSync(file);
    const result = await page.evaluate(async (profile, encoded) => {
      const descriptorFromQr = OmrProfiles.decode(OmrProfiles.encode(profile));
      const template = OmrA3CutSheet.template(profile);
      TEMPLATES[profile.id] = template;
      const base = new Image(); base.src = encoded; await base.decode();
      const full = document.createElement('canvas');
      full.width = base.width; full.height = base.height;
      const ctx = full.getContext('2d'); ctx.drawImage(base, 0, 0);
      const xScale = full.width / 420, yScale = full.height / 297;
      const mm = ([x, y]) => [221 + x / (1500 / 155), 10 + y / (1500 / 155)];
      const mark = point => {
        const [x, y] = mm(point);
        ctx.beginPath(); ctx.ellipse(x * xScale, y * yScale, 1.35 * xScale,
          1.35 * yScale, 0, 0, Math.PI * 2);
        ctx.fillStyle = '#111'; ctx.fill();
      };
      for (let col = 0; col < 4; col++) mark(template.made[col][col === 3 ? 1 : 0]);
      for (let q = 1; q <= template.numQ; q++) mark(template.mcq[q][(q - 1) % 4]);
      for (let q = 1; q <= template.numTf; q++) {
        for (const [row, letter] of [...'abcd'].entries()) mark(template.tf[q][letter][(q + row) % 2]);
      }
      const values = ['12,3', '-1,2', '0,25', '1234'];
      for (let q = 1; q <= template.numTln; q++) {
        for (const [col, char] of [...values[q - 1]].entries()) {
          mark(template.tln[q][col][OmrTlnCodec.bubbleIndex(char, col)]);
        }
      }
      const body = document.createElement('canvas');
      body.width = Math.round(172 * xScale); body.height = full.height;
      body.getContext('2d').drawImage(full, Math.round(210 * xScale), 0,
        Math.round(172 * xScale), full.height, 0, 0, body.width, body.height);
      const mat = cv.imread(body);
      const markers = OmrEngine.detectA4ScanMarkers(mat, true);
      mat.delete();
      const grade = async (canvas, skipQr = true) => {
        try {
          const r = await OmrEngine.gradeImage(canvas, template,
            { mcq: {}, tf: {}, tln: {} }, '', profile.id, 'opencv', { skipQr });
          return { id: r.templateId, sbd: r.sbd, made: r.made, answers: r.answers,
            warnings: r.warnings };
        } catch (error) { return { error: error.message }; }
      };
      const pdfSize = document.createElement('canvas');
      pdfSize.width = 1600; pdfSize.height = 2263;
      pdfSize.getContext('2d').drawImage(body, 0, 0, pdfSize.width, pdfSize.height);
      const damaged = document.createElement('canvas');
      damaged.width = body.width; damaged.height = body.height;
      const damagedContext = damaged.getContext('2d');
      damagedContext.drawImage(body, 0, 0);
      damagedContext.fillStyle = 'white';
      for (const [x, y] of [[166, 10], [11, 286]]) {
        damagedContext.fillRect((x - 3) * xScale, (y - 3) * yScale, 6 * xScale, 6 * yScale);
      }
      const angled = document.createElement('canvas');
      angled.width = 1900; angled.height = 2800;
      const src = cv.imread(body);
      const target = new cv.Mat(angled.height, angled.width, cv.CV_8UC4,
        new cv.Scalar(42, 42, 42, 255));
      const from = cv.matFromArray(4, 1, cv.CV_32FC2,
        [0, 0, body.width - 1, 0, body.width - 1, body.height - 1, 0, body.height - 1]);
      const to = cv.matFromArray(4, 1, cv.CV_32FC2,
        [180, 145, 1680, 90, 1740, 2600, 120, 2670]);
      const homography = cv.getPerspectiveTransform(from, to);
      cv.warpPerspective(src, target, homography, new cv.Size(angled.width, angled.height),
        cv.INTER_LINEAR, cv.BORDER_CONSTANT, new cv.Scalar(42, 42, 42, 255));
      cv.imshow(angled, target);
      src.delete(); target.delete(); from.delete(); to.delete(); homography.delete();
      const analysis = document.createElement('canvas');
      analysis.width = 820; analysis.height = Math.round(angled.height * 820 / angled.width);
      analysis.getContext('2d').drawImage(angled, 0, 0, analysis.width, analysis.height);
      const found = OmrA4Scanner.detect(analysis);
      const mapped = found?.points.map(point => ({
        x: point.x * angled.width / analysis.width,
        y: point.y * angled.height / analysis.height
      }));
      const rectified = mapped ? OmrA4Scanner.rectify(angled, mapped, 1600) : null;
      return { decoded: descriptorFromQr?.id, markers: markers?.markerCount,
        scannerRatio: found ? Math.max(found.width, found.height) / Math.min(found.width, found.height) : null,
        direct: await grade(body, false), scannedPdf: await grade(pdfSize), angled: await grade(angled),
        twoMissingMarkers: await grade(damaged),
        scannerPdf: rectified ? await grade(rectified) : { error: 'Scanner did not find A3 folded body' } };
    }, descriptor, `data:image/png;base64,${image.toString('base64')}`);
    console.log(descriptor.id, JSON.stringify(result));
    assert.equal(result.decoded, descriptor.id, 'QR profile');
    assert.ok(result.markers >= 6, 'A3 body registration marks');
    assert.ok(result.scannerRatio >= 1.24 && result.scannerRatio <= 1.90, 'scanner A3 ratio');
    for (const variant of ['direct', 'scannedPdf', 'angled', 'scannerPdf', 'twoMissingMarkers']) {
      const graded = result[variant];
      assert.equal(graded.error, undefined, `${descriptor.id} ${variant}`);
      assert.equal(graded.id, descriptor.id);
      assert.equal(graded.sbd, descriptor.mcq === 16 ? 'P800001' : 'P800002');
      assert.equal(graded.made, '0001');
      for (let q = 1; q <= descriptor.mcq; q++)
        assert.equal(graded.answers[`mcq-${q}`], 'ABCD'[(q - 1) % 4], `${variant} MCQ ${q}`);
    }
  }
} finally { await browser.close(); }
