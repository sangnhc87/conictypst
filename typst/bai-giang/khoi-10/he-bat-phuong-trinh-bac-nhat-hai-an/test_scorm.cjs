/* Browser integration checks for all answer modes, persistence and SCORM 1.2 calls. */
const assert = require('node:assert/strict');
const path = require('node:path');
const {pathToFileURL} = require('node:url');
const puppeteer = require('puppeteer');

const url = pathToFileURL(path.join(__dirname, 'dist/scorm/index.html')).href;

async function check(browser) {
  const page = await browser.newPage();
  const errors = [];
  page.on('pageerror', error => errors.push(error.message));
  await page.setViewport({width: 1380, height: 900, deviceScaleFactor: 1});
  await page.goto(url, {waitUntil: 'load'});
  await page.evaluate(() => localStorage.clear());
  await page.reload({waitUntil: 'load'});
  assert.equal(await page.$$eval('.question-card', cards => cards.length), 24);
  assert.equal(await page.$$eval('.lesson-page', pages => pages.length), 5);
  await page.waitForFunction(() => { const page = document.querySelector('.lesson-page'); return page.complete && page.naturalWidth > 0; });
  assert.equal(await page.$eval('#progress-label', el => el.textContent), '0/24 câu hoàn thành');
  await page.screenshot({path: '/private/tmp/bpt-scorm-desktop.png'});

  // Single choice: wrong answer, retry, then correct.
  await page.click('[data-question="01-1"] input[value="1"]');
  await page.click('[data-question="01-1"] .check-button');
  assert.match(await page.$eval('[data-question="01-1"] .feedback', el => el.textContent), /Chưa đúng/);
  await page.click('[data-question="01-1"] input[value="0"]');
  await page.click('[data-question="01-1"] .check-button');
  assert.equal(await page.$eval('#progress', el => el.value), 1);

  // Multiple choice and a hint.
  await page.click('[data-question="01-2"] .hint-button');
  assert.equal(await page.$eval('[data-question="01-2"] .hint', el => el.classList.contains('hidden')), false);
  await page.click('[data-question="01-2"] input[value="0"]');
  await page.click('[data-question="01-2"] input[value="3"]');
  await page.click('[data-question="01-2"] .check-button');
  assert.equal(await page.$eval('#progress', el => el.value), 2);

  // Numeric and exact point.
  await page.type('[data-question="03-1"] input[type="text"]', '14');
  await page.click('[data-question="03-1"] .check-button');
  await page.type('[data-question="03-2"] input[aria-label^="Tọa độ x"]', '2');
  await page.type('[data-question="03-2"] input[aria-label^="Tọa độ y"]', '4');
  await page.click('[data-question="03-2"] .check-button');

  // A strict half-plane boundary must fail; an interior point passes.
  await page.type('[data-question="02-3"] input[aria-label^="Tọa độ x"]', '1');
  await page.type('[data-question="02-3"] input[aria-label^="Tọa độ y"]', '3');
  await page.click('[data-question="02-3"] .check-button');
  assert.match(await page.$eval('[data-question="02-3"] .feedback', el => el.textContent), /x \+ y < 4/);
  await page.$eval('[data-question="02-3"] input[aria-label^="Tọa độ y"]', el => { el.value = '1'; });
  await page.click('[data-question="02-3"] .check-button');

  // Production quantities reject fractional pieces.
  await page.type('[data-question="04-3"] input[aria-label^="Tọa độ x"]', '2,5');
  await page.type('[data-question="04-3"] input[aria-label^="Tọa độ y"]', '2');
  await page.click('[data-question="04-3"] .check-button');
  assert.match(await page.$eval('[data-question="04-3"] .feedback', el => el.textContent), /số nguyên/);
  await page.$eval('[data-question="04-3"] input[aria-label^="Tọa độ x"]', el => { el.value = '2'; });
  await page.click('[data-question="04-3"] .check-button');
  assert.equal(await page.$eval('#progress', el => el.value), 6);

  await page.reload({waitUntil: 'load'});
  assert.equal(await page.$eval('#progress', el => el.value), 6);
  assert.equal(await page.$eval('[data-question="04-3"] .check-button', el => el.disabled), true);
  assert.deepEqual(errors, []);
  await page.setViewport({width: 390, height: 844, deviceScaleFactor: 1});
  await page.goto(url, {waitUntil: 'load'});
  await page.screenshot({path: '/private/tmp/bpt-scorm-mobile.png'});
  assert.equal(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1), true);
  await page.$eval('[data-question="01-1"]', card => { document.documentElement.style.scrollBehavior = 'auto'; card.scrollIntoView(); });
  await page.waitForFunction(() => document.querySelector('[data-question="01-1"]').getBoundingClientRect().top < window.innerHeight);
  await page.screenshot({path: '/private/tmp/bpt-scorm-mobile-question.png'});
  await page.close();

  // An LMS frame receives initialized status, score and suspend data.
  const lms = await browser.newPage();
  await lms.evaluateOnNewDocument(() => {
    window.__lmsCalls = [];
    window.API = {
      LMSInitialize: value => { window.__lmsCalls.push(['init', value]); return 'true'; },
      LMSGetValue: key => key === 'cmi.suspend_data' ? '{"done":[]}' : '',
      LMSSetValue: (key, value) => { window.__lmsCalls.push([key, value]); return 'true'; },
      LMSCommit: value => { window.__lmsCalls.push(['commit', value]); return 'true'; },
      LMSFinish: value => { window.__lmsCalls.push(['finish', value]); return 'true'; },
    };
  });
  await lms.goto(url, {waitUntil: 'load'});
  assert.equal(await lms.$eval('#progress', el => el.value), 0);
  await lms.click('[data-question="01-1"] input[value="0"]');
  await lms.click('[data-question="01-1"] .check-button');
  const calls = await lms.evaluate(() => window.__lmsCalls);
  assert(calls.some(([key]) => key === 'init'));
  assert(calls.some(([key, value]) => key === 'cmi.core.score.raw' && value === '4'));
  assert(calls.some(([key, value]) => key === 'cmi.core.lesson_status' && value === 'incomplete'));
  assert(calls.some(([key]) => key === 'cmi.suspend_data'));
  await lms.close();
}

(async () => {
  const browser = await puppeteer.launch({headless: true});
  try {
    await check(browser);
    console.log('SCORM browser integration passed: 24 questions, 5 lesson pages, answer modes, persistence, mobile layout, LMS API.');
  } finally {
    await browser.close();
  }
})().catch(error => { console.error(error); process.exitCode = 1; });
