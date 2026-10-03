import assert from 'node:assert/strict';
import { execFileSync } from 'node:child_process';
import { readFile } from 'node:fs/promises';
import puppeteer from 'puppeteer';

const ids = ['tn-40', 'tn-50', 'tn-60', 'ds-12', 'tln-10', 'ds-20-ngang'];
for (const id of ids) execFileSync('typst', ['compile', '--format', 'png', '--ppi', '200',
  `sang-math-omr/templates/${id}.typ`, `/tmp/omr-audit-${id}.png`]);
const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
try {
  const page = await browser.newPage();
  await page.goto('http://localhost:8765/', { waitUntil: 'domcontentloaded', timeout: 60000 });
  await page.waitForFunction(() => OmrEngine?.isOpenCvLoaded && TEMPLATES?.['ds-20-ngang'], { timeout: 60000 });
  for (const id of ids) {
    const image = await readFile(`/tmp/omr-audit-${id}.png`);
    const result = await page.evaluate(async (type, src) => {
      const t = TEMPLATES[type];
      const image = new Image(); image.src = src; await image.decode();
      const canvas = document.createElement('canvas'); canvas.width = image.width; canvas.height = image.height;
      const ctx = canvas.getContext('2d'); ctx.drawImage(image, 0, 0);
      const mat = cv.imread(canvas);
      const markers = OmrEngine.detectMarkers(mat, { camera: true, expectedAspect: t.warp.width / t.warp.height });
      mat.delete();
      if (!markers) return { error: 'No markers' };
      const xy = ([x, y]) => {
        const u = x / t.warp.width, v = y / t.warp.height;
        const topX = markers.tl[0] + u * (markers.tr[0] - markers.tl[0]);
        const bottomX = markers.bl[0] + u * (markers.br[0] - markers.bl[0]);
        const topY = markers.tl[1] + u * (markers.tr[1] - markers.tl[1]);
        const bottomY = markers.bl[1] + u * (markers.br[1] - markers.bl[1]);
        return [topX + v * (bottomX - topX), topY + v * (bottomY - topY)];
      };
      const mark = point => { const [x, y] = xy(point); ctx.beginPath(); ctx.arc(x, y, 7, 0, Math.PI * 2); ctx.fillStyle = '#080808'; ctx.fill(); };
      for (let col = 0; col < 6; col++) mark(t.sbd[col][col + 1]);
      for (let col = 0; col < 4; col++) mark(t.made[col][col === 3 ? 1 : 0]);
      for (let q = 1; q <= t.numQ; q++) mark(t.mcq[q][(q - 1) % 4]);
      for (let q = 1; q <= t.numTf; q++) for (const [row, letter] of [...'abcd'].entries()) mark(t.tf[q][letter][(q + row) % 2]);
      for (let q = 1; q <= t.numTln; q++) mark(t.tln[q][0][q % 9 + 1]);
      try {
        const graded = await OmrEngine.gradeImage(canvas, t, { mcq: {}, tf: {}, tln: {} }, '', type, 'opencv', { skipQr: true });
        return { id: graded.templateId, sbd: graded.sbd, made: graded.made, answers: graded.answers, warnings: graded.warnings };
      } catch (error) { return { error: error.message }; }
    }, id, `data:image/png;base64,${image.toString('base64')}`);
    console.log(id, result.error || `${result.sbd}/${result.made}`, result.warnings?.slice(0, 3));
    assert.equal(result.error, undefined, id);
    assert.equal(result.sbd, '123456', id);
    assert.equal(result.made, '0001', id);
    for (let q = 1; q <= (id.startsWith('tn-') ? Number(id.slice(3)) : 0); q++)
      assert.equal(result.answers[`mcq-${q}`], 'ABCD'[(q - 1) % 4], `${id} MCQ ${q}`);
    const tfCount = id === 'ds-12' ? 12 : id === 'ds-20-ngang' ? 20 : 0;
    for (let q = 1; q <= tfCount; q++) for (const [row, letter] of [...'abcd'].entries())
      assert.equal(result.answers[`tf-${q}`]?.[letter], (q + row) % 2 ? 'S' : 'Đ', `${id} TF ${q}${letter}`);
    if (id === 'tln-10') for (let q = 1; q <= 10; q++)
      assert.equal(result.answers[`tln-${q}`], String(q % 9 + 1), `${id} TLN ${q}`);
  }
  const quarantined = await page.evaluate(() => ['a3-cat-phach', 'tln-10-ngang']
    .every(id => [...document.querySelectorAll(`option[value="${id}"]`)].every(option => option.disabled)));
  assert.equal(quarantined, true, 'broken legacy presets must be disabled');
} finally { await browser.close(); }
