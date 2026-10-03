import assert from 'node:assert/strict';
import { writeFileSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
import puppeteer from 'puppeteer';

const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
try {
  const page = await browser.newPage();
  await page.setViewport({ width: 1440, height: 900 });
  await page.goto('http://localhost:8765/', { waitUntil: 'domcontentloaded', timeout: 60000 });
  await page.waitForFunction(() => window.OmrA4ScanSheet && typstState === 'ready', { timeout: 90000 });
  await page.click('#btn-tab-generate');
  await page.click('#tmplCards .tmpl-card[data-type="12-4-6-a4-scan"]');
  await page.waitForFunction(() => document.getElementById('a4TextEditor').style.display !== 'none');
  await page.$eval('#a4TextEditor', el => { el.open = true; });

  const values = [
    ['#genSchool', 'TRƯỜNG THPT NGUYỄN DU'],
    ['#genSubtitle', 'KIỂM TRA CUỐI KỲ II – TOÁN 12'],
    ['[data-a4-text="title"]', 'PHIẾU TRẢ LỜI KIỂM TRA TOÁN'],
    ['[data-a4-text="guide2"]', '02 Mỗi hàng chỉ được tô đúng một ô.'],
    ['[data-a4-text="printNote"]', 'In trang A4 đúng tỷ lệ 100 phần trăm.']
  ];
  for (const [selector, value] of values) {
    await page.$eval(selector, (el, text) => {
      el.value = text;
      el.dispatchEvent(new Event('input', { bubbles: true }));
    }, value);
  }

  const check = await page.evaluate(() => {
    const expected = getWasmTypstSource('12-4-6-a4-scan',
      document.getElementById('genSchool').value,
      document.getElementById('genSubtitle').value, false);
    generateBuilderCode();
    generateSheetCmd();
    return {
      exactCode: _builderCode === expected,
      source: expected,
      command: document.getElementById('genCmdText').value,
      link: document.getElementById('a4DownloadPdf').textContent,
      selected: selectedTemplateType
    };
  });
  assert.equal(check.selected, '12-4-6-a4-scan');
  assert.equal(check.exactCode, true, 'Smart Builder must export the selected A4 sheet');
  assert.match(check.source, /PHIẾU TRẢ LỜI KIỂM TRA TOÁN/);
  assert.match(check.source, /TRƯỜNG THPT NGUYỄN DU/);
  assert.match(check.source, /Mỗi hàng chỉ được tô đúng một ô/);
  assert.match(check.command, /typst compile phieu-12-4-6-a4-chuan\.typ/);
  assert.match(check.link, /đúng nội dung đang xem/);
  await page.$eval('[data-a4-text="title"]', el => {
    el.value = 'PHIẾU TRẢ LỜI MÔN TOÁN';
    el.dispatchEvent(new Event('input', { bubbles: true }));
  });
  assert.equal(await page.evaluate(() => _builderCode === getWasmTypstSource('12-4-6-a4-scan',
    document.getElementById('genSchool').value, document.getElementById('genSubtitle').value, false)), true,
  'Visible Typst code must update when text changes');
  await page.$eval('[data-a4-text="title"]', el => {
    el.value = 'PHIẾU TRẢ LỜI KIỂM TRA TOÁN';
    el.dispatchEvent(new Event('input', { bubbles: true }));
  });

  const typstPath = '/private/tmp/a4-editor-from-browser.typ';
  const pdfPath = '/private/tmp/a4-editor-from-browser.pdf';
  writeFileSync(typstPath, check.source);
  execFileSync('typst', ['compile', typstPath, pdfPath]);
  const text = execFileSync('pdftotext', [pdfPath, '-'], { encoding: 'utf8' });
  for (const token of ['PHIẾU TRẢ LỜI KIỂM TRA TOÁN', 'TRƯỜNG THPT NGUYỄN DU',
    'KIỂM TRA CUỐI KỲ II – TOÁN 12', 'Mỗi hàng chỉ được tô đúng một ô',
    'In trang A4 đúng tỷ lệ 100 phần trăm']) {
    assert.ok(text.includes(token), `PDF must contain: ${token}`);
  }

  await page.waitForFunction(() => document.querySelector('#svgPreviewContainer svg'), { timeout: 60000 });
  await page.screenshot({ path: '/private/tmp/a4-editor-ui-v57.png', fullPage: true });
  const dimensions = await page.evaluate(() => {
    const svg = document.querySelector('#svgPreviewContainer svg');
    return { width: svg.viewBox.baseVal.width, height: svg.viewBox.baseVal.height };
  });
  assert.ok(dimensions.height > dimensions.width, 'A4 portrait preview');

  const livePdf = await page.evaluate(async () => {
    window.downloadBlobFile = (blob, name) => { window.__sheetDownload = { blob, name }; };
    await downloadGeneratedPreviewPDF();
    const download = window.__sheetDownload;
    return download ? { name: download.name, bytes: Array.from(new Uint8Array(await download.blob.arrayBuffer())) } : null;
  });
  assert.ok(livePdf, 'PDF button must create a download');
  assert.match(livePdf.name, /phieu-12-4-6-a4-chuan\.pdf/);
  assert.equal(Buffer.from(livePdf.bytes).subarray(0, 4).toString(), '%PDF');
  writeFileSync('/private/tmp/a4-editor-live-download.pdf', Buffer.from(livePdf.bytes));
  const liveText = execFileSync('pdftotext', ['/private/tmp/a4-editor-live-download.pdf', '-'], { encoding: 'utf8' });
  assert.ok(liveText.includes('PHIẾU TRẢ LỜI KIỂM TRA TOÁN'));
  assert.ok(liveText.includes('Mỗi hàng chỉ được tô đúng một ô'));

  const livePng = await page.evaluate(async () => {
    window.__sheetDownload = null;
    window.__sheetError = '';
    window.omrAlert = message => { window.__sheetError = message; };
    await downloadActivePreview();
    const download = window.__sheetDownload;
    return download ? { name: download.name, header: Array.from(new Uint8Array(await download.blob.slice(0, 8).arrayBuffer())) }
      : { error: window.__sheetError,
        svgHead: new XMLSerializer().serializeToString(document.querySelector('#svgPreviewContainer svg')).slice(0, 1000),
        hrefs: Array.from(new XMLSerializer().serializeToString(document.querySelector('#svgPreviewContainer svg')).matchAll(/(?:href|src)="([^"]+)/g)).slice(0, 6).map(m => m[1].slice(0, 100)) };
  });
  assert.ok(livePng.name, `PNG button must create a download: ${JSON.stringify(livePng)}`);
  assert.match(livePng.name, /\.png$/);
  assert.deepEqual(livePng.header, [137, 80, 78, 71, 13, 10, 26, 10]);

  const essaySource = await page.evaluate(() => {
    document.getElementById('genHasEssay').checked = true;
    generateBuilderCode();
    const expected = getWasmTypstSource('12-4-6-a4-scan',
      document.getElementById('genSchool').value,
      document.getElementById('genSubtitle').value, true);
    if (_builderCode !== expected) throw new Error('Mã Typst có tự luận khác cấu hình PDF.');
    return expected;
  });
  writeFileSync('/private/tmp/a4-editor-essay.typ', essaySource);
  execFileSync('typst', ['compile', '/private/tmp/a4-editor-essay.typ', '/private/tmp/a4-editor-essay.pdf']);
  const info = execFileSync('pdfinfo', ['/private/tmp/a4-editor-essay.pdf'], { encoding: 'utf8' });
  assert.match(info, /Pages:\s+2\b/);
  await page.reload({ waitUntil: 'domcontentloaded' });
  assert.equal(await page.$eval('[data-a4-text="title"]', el => el.value), 'PHIẾU TRẢ LỜI KIỂM TRA TOÁN');

  console.log('A4 editable text, exact Typst export, live PDF/PNG and portrait preview: OK');
} finally {
  await browser.close();
}
