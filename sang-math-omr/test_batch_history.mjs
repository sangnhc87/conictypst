import assert from 'node:assert/strict';
import puppeteer from 'puppeteer';

const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
try {
  const page = await browser.newPage();
  const errors = [];
  page.on('pageerror', error => errors.push(error.message));
  await page.goto('http://localhost:8765/', { waitUntil: 'domcontentloaded', timeout: 60000 });
  await page.waitForFunction(() => window.OmrEngine?.isOpenCvLoaded && typeof renderStats === 'function',
    { timeout: 60000 });

  const state = await page.evaluate(() => {
    studentList = [{ sbd: '100001', name: 'Nguyễn Văn A', cls: '10A1' }];
    window.masterAnswerKeys = { default: { mcq: { 1: 'A' }, tf: {}, tln: {} } };
    const base = {
      templateId: '12-4-6ngang', made: '1086', gradeClass: '10A1',
      answers: { 'mcq-1': 'A' }, score: '0', correct: 0, total: 12,
      imageDataURL: null
    };
    gradeResults = [
      { ...base, id: 'one', sbd: '??0001', filename: 'class_trang_001.jpg',
        sourceFile: 'class.pdf', batchId: 'batch-a', batchName: 'Lớp 10A1 · lần 1',
        pdfPage: 1, warnings: ['SBD cột 1 tô nhiều ô'], reviewStatus: 'pending',
        quality: { identityAmbiguous: 1 } },
      { ...base, id: 'two', sbd: '100002', filename: 'class_trang_002.jpg',
        sourceFile: 'class.pdf', batchId: 'batch-a', batchName: 'Lớp 10A1 · lần 1',
        pdfPage: 2, warnings: ['Câu 17 cột 1 tô mờ'], reviewStatus: 'pending',
        quality: { faintMarks: 1 } },
      { ...base, id: 'three', sbd: '100003', filename: 'other_trang_001.jpg',
        sourceFile: 'other.pdf', batchId: 'batch-b', batchName: 'Lớp 10A1 · lần 2',
        pdfPage: 1, warnings: [], reviewStatus: 'confirmed' }
    ];
    switchTab('tab-stats');
    document.getElementById('statsBatchSelect').value = 'batch-a';
    renderStats();
    const before = {
      batchCards: document.querySelectorAll('#batchOverview .history-batch').length,
      rows: document.querySelectorAll('#resultsBody tr').length,
      pending: document.getElementById('reviewPendingCount').textContent,
      advisoryPending: isReviewPending(gradeResults[1])
    };
    openNextReview();
    document.getElementById('batchReviewStudentSearch').value = 'nguyen';
    renderReviewNameMatches();
    const match = document.querySelector('#batchReviewNameMatches button');
    const matchText = match?.textContent || '';
    match?.click();
    const resolvedSbd = document.getElementById('batchReviewSbd').value;
    const rescanDisabled = document.getElementById('batchReviewRescan').disabled;
    confirmBatchReview();
    const after = {
      sbd: gradeResults[0].sbd,
      status: gradeResults[0].reviewStatus,
      score: gradeResults[0].score,
      pending: document.getElementById('reviewPendingCount').textContent,
      modalOpen: document.getElementById('batchReviewModal').style.display === 'block'
    };
    document.getElementById('statsBatchSelect').value = 'batch-b';
    renderStats();
    return { before, matchText, resolvedSbd, rescanDisabled, after,
      batchBRows: document.querySelectorAll('#resultsBody tr').length,
      batchBExportCount: _exportResults().length,
      numericAnswer: OmrTlnCodec.sameValue('0042', '42') };
  });
  assert.deepEqual(errors, []);
  assert.equal(state.before.batchCards, 3);
  assert.equal(state.before.rows, 2);
  assert.equal(state.before.pending, '1');
  assert.equal(state.before.advisoryPending, false);
  assert.match(state.matchText, /Nguyễn Văn A/);
  assert.equal(state.resolvedSbd, '100001');
  assert.equal(state.rescanDisabled, true);
  assert.equal(state.after.sbd, '100001');
  assert.equal(state.after.status, 'confirmed');
  assert.equal(state.after.pending, '0');
  assert.equal(state.after.modalOpen, false);
  assert.equal(state.batchBRows, 1);
  assert.equal(state.batchBExportCount, 1);
  assert.equal(state.numericAnswer, true);
  const exportedCsv = await page.evaluate(async () => {
    downloadBlobFile = blob => { window.__testExportBlob = blob; };
    exportCSV();
    return window.__testExportBlob.text();
  });
  assert.match(exportedCsv, /100003/);
  assert.doesNotMatch(exportedCsv, /100001|100002/);
  const reread = await page.evaluate(async () => {
    const template = TEMPLATES['12-4-6-a4-scan'];
    const image = new Image();
    image.src = './test-data/a4-scan-sheet/blank.png';
    await image.decode();
    const canvas = document.createElement('canvas');
    canvas.width = image.naturalWidth;
    canvas.height = image.naturalHeight;
    const context = canvas.getContext('2d');
    context.drawImage(image, 0, 0);
    const scale = canvas.width / template.warp.width;
    const radius = 2 * canvas.width / 210 * 0.77;
    const mark = ([x, y]) => {
      context.beginPath();
      context.arc(x * scale, y * scale, radius, 0, Math.PI * 2);
      context.fillStyle = '#101010';
      context.fill();
    };
    for (let col = 0; col < 6; col++) mark(template.sbd[col][col + 1]);
    for (let col = 0; col < 4; col++) mark(template.made[col][col === 3 ? 1 : 0]);
    mark(template.mcq[1][0]);
    const result = {
      id: 'reread-one', templateId: '12-4-6-a4-scan',
      sbd: '?', made: '?', score: '0', answers: {},
      filename: 'reread.jpg', batchId: 'batch-c', batchName: 'Đọc lại',
      rawImageDataURL: canvas.toDataURL('image/jpeg', 0.92),
      reviewStatus: 'pending', warnings: ['Cần đọc lại']
    };
    gradeResults.push(result);
    openBatchReview(result);
    await regradeBatchReviewFromImage();
    return { id: result.id, sbd: result.sbd, made: result.made,
      answer: result.answers['mcq-1'], count: result.regradeCount,
      pending: isReviewPending(result) };
  });
  assert.deepEqual(reread, { id: 'reread-one', sbd: '123456', made: '0001',
    answer: 'A', count: 1, pending: false });
  const splitClassHistory = await page.evaluate(() => {
    const makeResult = (batchId, gradeClass, index, createdAt) => ({
      id: `${batchId}-${index}`, batchId, batchName: '10A1-Scan.pdf',
      sourceFile: '10A1-Scan.pdf', gradeClass, createdAt,
      batchStartedAt: new Date(createdAt).toISOString(),
      filename: `10A1-Scan_trang_${String(index).padStart(3, '0')}.jpg`,
      pdfPage: index, sbd: String(index).padStart(6, '0'), made: '1086',
      score: '7.00', correct: 7, total: 10, reviewStatus: 'confirmed'
    });
    gradeResults = [
      ...Array.from({ length: 46 }, (_, index) => makeResult('batch-first', '10A1', index + 1, Date.parse('2026-10-01T08:00:00Z'))),
      ...Array.from({ length: 46 }, (_, index) => makeResult('batch-second', '10A1', index + 1, Date.parse('2026-10-02T08:00:00Z'))),
      ...Array.from({ length: 5 }, (_, index) => makeResult('batch-other', '10A2', index + 1, Date.parse('2026-10-03T08:00:00Z')))
    ];
    renderStats();
    document.getElementById('statsSessionSelect').value = '10A1';
    renderStats();
    const current = {
      selected: document.getElementById('statsBatchSelect').value,
      total: document.getElementById('statTotal').textContent,
      rows: document.querySelectorAll('#resultsBody tr').length,
      scope: document.getElementById('historyScope').textContent,
      cards: [...document.querySelectorAll('#batchOverview .history-batch')].map(button => button.textContent),
      exported: _exportResults().length
    };
    document.querySelectorAll('#batchOverview .history-batch')[1].click();
    const first = { selected: document.getElementById('statsBatchSelect').value,
      rows: document.querySelectorAll('#resultsBody tr').length,
      exported: _exportResults().length };
    document.querySelectorAll('#batchOverview .history-batch')[2].click();
    const all = { total: document.getElementById('statTotal').textContent,
      rows: document.querySelectorAll('#resultsBody tr').length };
    document.getElementById('statsSessionSelect').value = '10A2';
    renderStats();
    const other = { total: document.getElementById('statTotal').textContent,
      cards: document.querySelectorAll('#batchOverview .history-batch').length };
    return { current, first, all, other };
  });
  assert.equal(splitClassHistory.current.selected, 'batch-second');
  assert.equal(splitClassHistory.current.total, '46');
  assert.equal(splitClassHistory.current.rows, 46);
  assert.equal(splitClassHistory.current.exported, 46);
  assert.match(splitClassHistory.current.scope, /10A1: 92 bài trong 2 đợt.*đợt 2 \(46 bài\)/);
  assert.equal(splitClassHistory.current.cards.length, 3);
  assert.match(splitClassHistory.current.cards[0], /ĐỢT 2 \/ 2/);
  assert.match(splitClassHistory.current.cards[1], /ĐỢT 1 \/ 2/);
  assert.match(splitClassHistory.current.cards[2], /Tất cả đợt.*92 bài/);
  assert.deepEqual(splitClassHistory.first, { selected: 'batch-first', rows: 46, exported: 46 });
  assert.deepEqual(splitClassHistory.all, { total: '92', rows: 92 });
  assert.deepEqual(splitClassHistory.other, { total: '5', cards: 2 });
  const legacyHistory = await page.evaluate(() => {
    gradeResults = gradeResults.filter(result => result.gradeClass === '10A1').map(result => {
      const { batchId, batchName, batchStartedAt, ...legacy } = result;
      return legacy;
    });
    document.getElementById('statsSessionSelect').value = '10A1';
    renderStats();
    return {
      selected: document.getElementById('statsBatchSelect').value,
      cards: document.querySelectorAll('#batchOverview .history-batch').length,
      rows: document.querySelectorAll('#resultsBody tr').length,
      scope: document.getElementById('historyScope').textContent
    };
  });
  assert.equal(legacyHistory.selected, 'old:10A1-Scan.pdf:run-2');
  assert.equal(legacyHistory.cards, 3);
  assert.equal(legacyHistory.rows, 46);
  assert.match(legacyHistory.scope, /92 bài trong 2 đợt/);
  console.log(state);
  console.log(reread);
  console.log(splitClassHistory);
  console.log(legacyHistory);
} finally {
  await browser.close();
}
