import assert from 'node:assert/strict';
import { writeFile } from 'node:fs/promises';
import puppeteer from 'puppeteer';

const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
try {
  const page = await browser.newPage();
  const errors = [];
  page.on('pageerror', error => errors.push(error.message));
  await page.goto('http://localhost:8765/scan.html', { waitUntil: 'domcontentloaded', timeout: 60000 });
  await page.waitForFunction(() => window.OmrDocumentScanner?.state?.ready, { timeout: 60000 });
  const setup = await page.evaluate(async () => {
    await OmrDocumentScanStore.clearPages();
    OmrDocumentScanner.state.pages = [];
    const sheet = new Image();
    sheet.src = './test-data/a4-scan-sheet/blank.png';
    await sheet.decode();
    const transformed = document.createElement('canvas');
    transformed.width = 1900; transformed.height = 2600;
    const source = cv.imread(sheet);
    const target = new cv.Mat(transformed.height, transformed.width, cv.CV_8UC4,
      new cv.Scalar(35, 35, 35, 255));
    const from = cv.matFromArray(4, 1, cv.CV_32FC2,
      [0, 0, sheet.width - 1, 0, sheet.width - 1, sheet.height - 1, 0, sheet.height - 1]);
    const to = cv.matFromArray(4, 1, cv.CV_32FC2,
      [190, 140, 1690, 100, 1760, 2470, 120, 2510]);
    const transform = cv.getPerspectiveTransform(from, to);
    cv.warpPerspective(source, target, transform,
      new cv.Size(transformed.width, transformed.height), cv.INTER_LINEAR,
      cv.BORDER_CONSTANT, new cv.Scalar(35, 35, 35, 255));
    cv.imshow(transformed, target);
    source.delete(); target.delete(); from.delete(); to.delete(); transform.delete();
    const scaleCanvas = document.createElement('canvas');
    scaleCanvas.width = 585; scaleCanvas.height = 800;
    scaleCanvas.getContext('2d').drawImage(transformed, 0, 0, 585, 800);
    const detected = OmrA4Scanner.detect(scaleCanvas);
    const focus = OmrA4Scanner.focusScore(scaleCanvas);
    navigator.mediaDevices.getUserMedia = async () => {
      const stream = transformed.captureStream(12);
      const context = transformed.getContext('2d');
      window.__testFrameTimer = setInterval(() => {
        const pixel = context.getImageData(0, 0, 1, 1);
        context.putImageData(pixel, 0, 0);
      }, 80);
      return stream;
    };
    window.__testStreamCanvas = transformed;
    return { detected: Boolean(detected), focus, fraction: detected?.fraction };
  });
  assert.equal(setup.detected, true);
  assert.ok(setup.focus > 38, `focus ${setup.focus}`);
  await page.click('#startCamera');
  await page.waitForFunction(() => OmrDocumentScanner.state.pages.length === 1, { timeout: 30000 })
    .catch(async error => {
      console.error(await page.evaluate(() => ({
        status: document.getElementById('scanStatus').textContent,
        width: document.getElementById('scanVideo').videoWidth,
        height: document.getElementById('scanVideo').videoHeight,
        stable: OmrDocumentScanner.state.stable,
        ready: OmrDocumentScanner.state.ready,
        stream: Boolean(OmrDocumentScanner.state.stream)
      })));
      throw error;
    });
  await new Promise(resolve => setTimeout(resolve, 1400));
  const result = await page.evaluate(async () => {
    const pages = OmrDocumentScanner.state.pages;
    const blob = await OmrDocumentScanner.buildPdf();
    const stored = await OmrDocumentScanStore.listPages();
    const preview = await new Promise(resolve => {
      const reader = new FileReader();
      reader.onload = () => resolve(String(reader.result).split(',')[1]);
      reader.readAsDataURL(pages[0].blob);
    });
    return { count: pages.length, width: pages[0].width, height: pages[0].height,
      pdfType: blob.type, pdfBytes: blob.size, persisted: stored.length,
      status: document.getElementById('scanStatus').textContent, preview };
  });
  await writeFile('/tmp/omr-scanner-rectified.jpg', Buffer.from(result.preview, 'base64'));
  delete result.preview;
  assert.deepEqual(errors, []);
  assert.equal(result.count, 1, 'same page should not be auto scanned twice');
  assert.deepEqual([result.width, result.height], [1600, 2263]);
  assert.equal(result.pdfType, 'application/pdf');
  assert.ok(result.pdfBytes > 10000);
  assert.equal(result.persisted, 1);
  await page.click('#gradePdf');
  await page.waitForFunction(() => location.pathname.endsWith('/index.html') &&
    !new URL(location.href).searchParams.has('scanPdf') &&
    document.getElementById('gradeBtn') && !document.getElementById('gradeBtn').disabled,
    { timeout: 60000 });
  const handoff = await page.evaluate(async () => ({
    buttonReady: !document.getElementById('gradeBtn').disabled,
    pending: await OmrDocumentScanStore.consumeHandoff(),
    batchText: document.getElementById('batchList').textContent.slice(0, 120)
  }));
  assert.equal(handoff.buttonReady, true);
  assert.equal(handoff.pending, null, 'PDF handoff should be consumed exactly once');
  console.log({ setup, result });
} finally {
  await browser.close();
}
