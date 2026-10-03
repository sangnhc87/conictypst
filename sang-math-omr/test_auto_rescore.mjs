import assert from 'node:assert/strict';
import puppeteer from 'puppeteer';

const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
try {
  const page = await browser.newPage();
  const errors = [];
  page.on('pageerror', error => errors.push(error.message));
  await page.goto('http://localhost:8765/', { waitUntil: 'domcontentloaded', timeout: 60000 });
  await page.waitForFunction(() => window.OmrEngine?.rescoreAnswers && typeof onSheetTypeChange === 'function');
  const result = await page.evaluate(async () => {
    window.masterAnswerKeys = { default: { mcq: { 1: 'A' }, tf: {}, tln: {} } };
    gradeResults = ['12-4-6ngang', 'thptqg-toan'].map((templateId, index) => ({
      id: `auto-${index}`, templateId, made: '0001', sbd: `10000${index + 1}`,
      score: '0', answers: { 'mcq-1': 'A' }, warnings: [], reviewStatus: 'confirmed'
    }));
    rescoreStoredResults();
    const initial = gradeResults.map(item => Number(item.score));
    window.currentMadeKey = 'default';
    selectAnswer(1, 'B');
    await new Promise(resolve => setTimeout(resolve, 0));
    const afterKey = gradeResults.map(item => Number(item.score));
    selectAnswer(1, 'A');
    await new Promise(resolve => setTimeout(resolve, 0));
    document.getElementById('cfgMcqPoints').value = '0.5';
    saveCustomConfig();
    const afterScale = gradeResults.map(item => Number(item.score));
    const sheet = document.getElementById('sheetTypeGrade');
    sheet.value = 'thptqg-toan'; onSheetTypeChange();
    const verticalInput = Number(document.getElementById('cfgMcqPoints').value);
    sheet.value = '12-4-6ngang'; onSheetTypeChange();
    const restoredInput = Number(document.getElementById('cfgMcqPoints').value);
    const savedTemplates = Object.keys(JSON.parse(localStorage.getItem('omr_custom_configs_v2') || '{}'));
    return { initial, afterKey, afterScale, verticalInput, restoredInput, savedTemplates };
  });
  assert.deepEqual(errors, []);
  assert.deepEqual(result.initial, [0.25, 0.25]);
  assert.deepEqual(result.afterKey, [0, 0]);
  assert.deepEqual(result.afterScale, [0.5, 0.25]);
  assert.equal(result.verticalInput, 0.25);
  assert.equal(result.restoredInput, 0.5);
  assert.deepEqual(result.savedTemplates, ['12-4-6ngang']);
  console.log(result);
} finally {
  await browser.close();
}
