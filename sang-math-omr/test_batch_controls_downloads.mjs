import assert from 'node:assert/strict';
import { mkdtemp, readdir, readFile } from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import puppeteer from 'puppeteer';

const downloads = await mkdtemp(path.join(os.tmpdir(), 'omr-downloads-'));
const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
try {
  const page = await browser.newPage();
  const errors = [];
  page.on('pageerror', error => errors.push(error.message));
  const cdp = await page.target().createCDPSession();
  await cdp.send('Page.setDownloadBehavior', { behavior: 'allow', downloadPath: downloads });
  await page.goto('http://localhost:8765/', { waitUntil: 'domcontentloaded', timeout: 60000 });
  await page.waitForFunction(() => typeof renderStats === 'function' && Boolean(window.jspdf?.jsPDF), { timeout: 60000 });

  const controls = await page.evaluate(async () => {
    window.OMRCloud = null;
    omrPrompt = async () => '10A1 · kiểm tra giữa kỳ';
    omrConfirm = async () => true;
    studentList = [{ sbd: '100001', name: 'Nguyễn Văn A', cls: '10A1' }];
    window.masterAnswerKeys = { default: { mcq: { 1: 'A' }, tf: { 13: { a: 'Đ' } }, tln: { 17: '2' } } };
    const makeResult = (batchId, n) => ({
      id: `${batchId}-${n}`, batchId, batchName: batchId,
      gradeClass: '10A1', templateId: '12-4-6ngang', made: '1086',
      sbd: String(100000 + n), filename: `10A1_trang_${n}.jpg`, pdfPage: n,
      score: '7', correct: 7, total: 22, reviewStatus: 'confirmed',
      warnings: n === 1 && batchId === 'new' ? ['Câu 17 cột 1 tô mờ'] : [],
      answers: { 'mcq-1': 'A', 'tf-13': { a: 'Đ' }, 'tln-17': '2' }
    });
    gradeResults = [makeResult('old', 1), makeResult('old', 2), makeResult('new', 1), makeResult('new', 2)];
    switchTab('tab-stats');
    document.getElementById('statsSessionSelect').value = '10A1';
    renderStats();
    const noteRow = document.querySelector('#resultsBody tr.history-mark-note');
    const highlight = getComputedStyle(noteRow).backgroundColor;
    const sectionLabels = buildQuestionAnalytics().map(item => item.label);
    const sectionKey = document.getElementById('tln-17')?.previousElementSibling?.textContent;
    const originalKeys = JSON.stringify(window.masterAnswerKeys);
    setQuestionNumberingMode('continuous');
    const continuousLabels = buildQuestionAnalytics().map(item => item.label);
    const continuousKey = document.getElementById('tln-17')?.previousElementSibling?.textContent;
    const keysUnchanged = JSON.stringify(window.masterAnswerKeys) === originalKeys;
    setQuestionNumberingMode('section');
    await renameSelectedBatch();
    const renamed = gradeResults.filter(result => result.batchId === 'new').map(result => result.batchName);
    const storedName = JSON.parse(localStorage.getItem(STORAGE_KEY))[2].batchName;
    await deleteSelectedBatch();
    return {
      namedBatch: gradingBatchLabel('2026-10-03T08:00:00Z', ['10A1.pdf'], '  Kiểm tra 10A1  '),
      automaticBatch: gradingBatchLabel('2026-10-03T08:00:00Z', ['10A1.pdf']),
      highlight, noteText: noteRow.textContent,
      sectionLabels, sectionKey, continuousLabels, continuousKey, keysUnchanged,
      renamed, storedName, remaining: gradeResults.map(result => result.batchId),
      selected: document.getElementById('statsBatchSelect').value,
      numberingSaved: localStorage.getItem(QUESTION_NUMBERING_KEY)
    };
  });
  assert.equal(controls.highlight, 'rgb(234, 248, 246)');
  assert.equal(controls.namedBatch, 'Kiểm tra 10A1');
  assert.match(controls.automaticBatch, /^Chấm .*10A1\.pdf$/);
  assert.match(controls.noteText, /Có ghi chú nét tô/);
  assert(controls.sectionLabels.includes('II.1a'));
  assert(controls.sectionLabels.includes('III.1'));
  assert.equal(controls.sectionKey, 'III.1:');
  assert(controls.continuousLabels.includes('C13a'));
  assert(controls.continuousLabels.includes('C17'));
  assert.equal(controls.continuousKey, 'C17:');
  assert.equal(controls.keysUnchanged, true);
  assert.deepEqual(controls.renamed, ['10A1 · kiểm tra giữa kỳ', '10A1 · kiểm tra giữa kỳ']);
  assert.equal(controls.storedName, '10A1 · kiểm tra giữa kỳ');
  assert.deepEqual(controls.remaining, ['old', 'old']);
  assert.equal(controls.selected, 'old');
  assert.equal(controls.numberingSaved, 'section');

  await page.evaluate(() => {
    window.__downloadAlerts = [];
    omrAlert = message => window.__downloadAlerts.push(String(message));
    switchTab('tab-generate');
    document.querySelector('#tmplCards .tmpl-card[data-type="12-4-6-a4-scan"]').click();
  });
  await page.waitForSelector('#svgPreviewContainer svg', { timeout: 60000 });
  await page.click('#a4DownloadPdf');
  await page.evaluate(() => downloadActivePreview());
  await page.evaluate(() => downloadGeneratedPreviewPDF());
  await page.evaluate(() => {
    switchTab('tab-fill');
    document.getElementById('fillTemplateSelect').value = '12-4-6-a4-scan';
    generateFilledSheet();
  });
  await page.waitForFunction(() => Boolean(window.latestFilledCanvas && window.latestOverlayCanvas), { timeout: 60000 });
  await page.evaluate(() => exportFilledSheetPNG());
  await page.evaluate(() => exportFilledSheetPDF());
  let files = [];
  for (let attempt = 0; attempt < 30; attempt++) {
    files = await readdir(downloads);
    if (files.filter(name => name.endsWith('.png') || name.endsWith('.pdf')).length >= 4 &&
        !files.some(name => name.endsWith('.crdownload'))) break;
    await new Promise(resolve => setTimeout(resolve, 500));
  }
  const downloadAlerts = await page.evaluate(() => window.__downloadAlerts);
  assert(files.includes('phieu-12-4-6-a4-chuan.png'), `${files.join(', ')} · ${downloadAlerts.join('; ')}`);
  assert(files.includes('phieu-12-4-6-a4-chuan.pdf'), files.join(', '));
  assert(files.some(name => /^Phieu-12-4-6-a4-chuan-.*\.png$/.test(name)), `${files.join(', ')} · ${downloadAlerts.join('; ')}`);
  assert(files.some(name => /^Phieu-12-4-6-a4-chuan-.*\.pdf$/.test(name)), `${files.join(', ')} · ${downloadAlerts.join('; ')}`);
  for (const name of files.filter(name => name.endsWith('.pdf'))) {
    const bytes = await readFile(path.join(downloads, name));
    assert.equal(bytes.subarray(0, 4).toString(), '%PDF');
  }
  assert.deepEqual(errors, []);
  console.log({ controls, files, downloadAlerts });
} finally {
  await browser.close();
}
