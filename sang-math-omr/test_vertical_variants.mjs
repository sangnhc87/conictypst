import assert from 'node:assert/strict';
import { execFileSync } from 'node:child_process';
import { readFile, writeFile } from 'node:fs/promises';
import puppeteer from 'puppeteer';

const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
try {
  const page = await browser.newPage();
  await page.goto('http://localhost:8765/', { waitUntil: 'domcontentloaded', timeout: 60000 });
  await page.waitForFunction(() => OmrEngine?.isOpenCvLoaded && TEMPLATES?.['thptqg-toan'], { timeout: 60000 });
  for (const variant of ['noessay', 'essay']) {
    const source = await page.evaluate(hasEssay => genMathStandardTypst({ paper: 'a4',
      school: 'SANG MATH OMR', subtitle: 'Kiểm tra Toán', hasEssay, qrCodeStr: '' }), variant === 'essay');
    await writeFile(`/tmp/thpt-${variant}-audit.typ`, source);
    execFileSync('typst', ['compile', '--format', 'png', '--ppi', '200',
      `/tmp/thpt-${variant}-audit.typ`, `/tmp/thpt-${variant}-200.png`]);
    const bytes = await readFile(`/tmp/thpt-${variant}-200.png`);
    const outcome = await page.evaluate(async src => {
      const template = TEMPLATES['thptqg-toan'];
      const image = new Image(); image.src = src; await image.decode();
      const canvas = document.createElement('canvas'); canvas.width = image.width; canvas.height = image.height;
      const ctx = canvas.getContext('2d'); ctx.drawImage(image, 0, 0);
      const pageScale = canvas.width / 595.276;
      const map = ([x, y]) => [
        pageScale * (template.warp.TL[0] + x * (template.warp.TR[0] - template.warp.TL[0]) / template.warp.width),
        pageScale * (template.warp.TL[1] + y * (template.warp.BL[1] - template.warp.TL[1]) / template.warp.height)
      ];
      const mark = point => { const [x, y] = map(point); ctx.beginPath(); ctx.arc(x, y, 7, 0, Math.PI * 2); ctx.fillStyle = '#090909'; ctx.fill(); };
      for (let col = 0; col < 6; col++) mark(template.sbd[col][col + 1]);
      for (let col = 0; col < 4; col++) mark(template.made[col][col === 3 ? 1 : 0]);
      for (let q = 1; q <= 12; q++) mark(template.mcq[q][(q - 1) % 4]);
      for (let q = 1; q <= 4; q++) for (const [row, letter] of [...'abcd'].entries()) mark(template.tf[q][letter][(q + row) % 2]);
      for (let q = 1; q <= 6; q++) for (const [col, char] of [...['12,3', '-1,2', '0,25', '1234', '4', '9,99'][q - 1]].entries())
        mark(template.tln[q][col][OmrTlnCodec.bubbleIndex(char, col)]);
      try {
        const result = await OmrEngine.gradeImage(canvas, template, { mcq: {}, tf: {}, tln: {} }, '', 'thptqg-toan', 'opencv', { skipQr: true });
        return { sbd: result.sbd, made: result.made, answers: result.answers, warnings: result.warnings };
      } catch (error) { return { error: error.message }; }
    }, `data:image/png;base64,${bytes.toString('base64')}`);
    console.log(variant, JSON.stringify(outcome).slice(0, 1000));
    assert.equal(outcome.error, undefined, variant);
    assert.equal(outcome.sbd, '123456', variant);
    assert.equal(outcome.made, '0001', variant);
    for (let q = 1; q <= 12; q++) assert.equal(outcome.answers[`mcq-${q}`], 'ABCD'[(q - 1) % 4], `${variant} MCQ ${q}`);
    for (let q = 1; q <= 4; q++) for (const [row, letter] of [...'abcd'].entries())
      assert.equal(outcome.answers[`tf-${q + 12}`]?.[letter], (q + row) % 2 ? 'S' : 'Đ', `${variant} TF ${q}${letter}`);
    for (const [q, value] of ['12,3', '-1,2', '0,25', '1234', '4', '9,99'].entries())
      assert.equal(outcome.answers[`tln-${q + 17}`], value, `${variant} TLN ${q + 1}`);
  }
} finally { await browser.close(); }
