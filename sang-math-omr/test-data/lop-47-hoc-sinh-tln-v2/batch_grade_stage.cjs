#!/usr/bin/env node
'use strict';

const assert = require('node:assert/strict');
const crypto = require('node:crypto');
const fs = require('node:fs');
const path = require('node:path');
const puppeteer = require('puppeteer');

const HERE = __dirname;
const BASE_URL = process.argv[2] || 'http://127.0.0.1:8765/index.html';
const BASE_HOST = new URL(BASE_URL).hostname;
const PAGES_DIR = path.resolve(process.argv[3] || '/private/tmp/omr-tln-v2-pages');
const STUDENT_DATA_PATH = path.join(HERE, 'du-lieu-47-hoc-sinh.json');
const ANSWER_PATH = path.join(HERE, 'dap-an-ma-de-0303.json');
const REPORT_PATH = path.join(HERE, 'batch-grade-report.json');
const HASH_PATH = path.join(HERE, 'SHA256SUMS.txt');

function writeHashManifest() {
  const names = [
    'dap-an-ma-de-0303.json',
    'dap-an-ma-de-0303.csv',
    'dap-an-ma-de-0303.xlsx',
    'du-lieu-47-hoc-sinh.json',
    'ket-qua-ky-vong.csv',
    'lop-47-hoc-sinh-tln-v2.pdf',
    'batch-grade-report.json',
  ];
  const lines = names.map(name => {
    const digest = crypto
      .createHash('sha256')
      .update(fs.readFileSync(path.join(HERE, name)))
      .digest('hex');
    return `${digest}  ${name}`;
  });
  fs.writeFileSync(HASH_PATH, `${lines.join('\n')}\n`);
}

function normalizedNumber(value) {
  return Number(String(value ?? '').replace(',', '.'));
}

function compareResult(mode, student, result) {
  const mismatches = [];
  const expected = student.expected;

  if (String(result.sbd) !== student.sbd) {
    mismatches.push(`SBD ${result.sbd} != ${student.sbd}`);
  }
  if (String(result.made) !== student.made) {
    mismatches.push(`Mã đề ${result.made} != ${student.made}`);
  }

  for (let question = 1; question <= 12; question++) {
    const key = `mcq-${question}`;
    const actual = String(result.answers?.[key] ?? '');
    const wanted = student.answers.mcq[String(question)];
    if (actual !== wanted) mismatches.push(`${key} ${actual} != ${wanted}`);
  }

  for (let question = 13; question <= 16; question++) {
    const key = `tf-${question}`;
    const actual = result.answers?.[key] || {};
    for (const label of ['a', 'b', 'c', 'd']) {
      const wanted = student.answers.tf[String(question)][label];
      if (actual[label] !== wanted) {
        mismatches.push(`${key}${label} ${actual[label]} != ${wanted}`);
      }
    }
  }

  for (let question = 17; question <= 22; question++) {
    const key = `tln-${question}`;
    const actual = String(result.answers?.[key] ?? '').replace('.', ',');
    const wanted = student.answers.tln[String(question)].replace('.', ',');
    if (actual !== wanted) mismatches.push(`${key} ${actual} != ${wanted}`);
  }

  if (result.mcqCorrect !== expected.mcqCorrect) {
    mismatches.push(`MCQ đúng ${result.mcqCorrect} != ${expected.mcqCorrect}`);
  }
  if (Math.abs(normalizedNumber(result.tfPoints) - expected.tfPoints) > 1e-6) {
    mismatches.push(`Điểm ĐS ${result.tfPoints} != ${expected.tfPoints}`);
  }
  if (result.tlnCorrect !== expected.tlnCorrect) {
    mismatches.push(`TLN đúng ${result.tlnCorrect} != ${expected.tlnCorrect}`);
  }
  if (Math.abs(normalizedNumber(result.score) - expected.score) > 1e-6) {
    mismatches.push(`Điểm ${result.score} != ${expected.score}`);
  }

  return {
    mode,
    index: student.index,
    sbd: student.sbd,
    pass: mismatches.length === 0,
    mismatches,
    warnings: result.warnings || [],
  };
}

async function gradeOne(page, pngPath, masterKeys, camera) {
  const bytes = fs.readFileSync(pngPath);
  const dataUrl = `data:image/png;base64,${bytes.toString('base64')}`;
  return page.evaluate(async ({ dataUrl, masterKeys, camera }) => {
    const image = new Image();
    image.src = dataUrl;
    await image.decode();
    const template = window.TEMPLATES['12-4-6ngang'];
    const result = await window.OmrEngine.gradeImage(
      image,
      template,
      masterKeys,
      '',
      '12-4-6ngang',
      'opencv',
      {
        skipQr: true,
        camera,
        expectedAspect: template.warp.width / template.warp.height,
      },
    );
    delete result.imageDataURL;
    return result;
  }, { dataUrl, masterKeys, camera });
}

async function main() {
  const studentData = JSON.parse(fs.readFileSync(STUDENT_DATA_PATH, 'utf8'));
  const answerPackage = JSON.parse(fs.readFileSync(ANSWER_PATH, 'utf8'));
  assert.equal(studentData.students.length, 47);
  assert.ok(fs.existsSync(PAGES_DIR), `Không thấy thư mục PNG: ${PAGES_DIR}`);

  const browser = await puppeteer.launch({
    headless: true,
    args: ['--disable-dev-shm-usage'],
  });
  const page = await browser.newPage();
  await page.setRequestInterception(true);
  page.on('request', request => {
    const url = new URL(request.url());
    if (url.hostname === BASE_HOST || url.protocol === 'data:') request.continue();
    else request.abort();
  });
  page.on('console', message => {
    if (message.type() === 'error') {
      console.error('[browser]', message.text());
    }
  });
  await page.goto(BASE_URL, { waitUntil: 'domcontentloaded', timeout: 120000 });
  await page.waitForFunction(
    () => window.OmrEngine?.isOpenCvLoaded && typeof window.cv?.imread === 'function',
    { timeout: 120000 },
  );

  const checks = [];
  for (const student of studentData.students) {
    const pngPath = path.join(
      PAGES_DIR,
      `student-${String(student.index).padStart(3, '0')}.png`,
    );
    assert.ok(fs.existsSync(pngPath), `Thiếu ${pngPath}`);

    const upload = await gradeOne(page, pngPath, answerPackage.keys, false);
    checks.push(compareResult('upload', student, upload));

    const camera = await gradeOne(page, pngPath, answerPackage.keys, true);
    checks.push(compareResult('camera', student, camera));

    if (student.index % 5 === 0 || student.index === 47) {
      console.log(`Đã chấm ${student.index}/47 học sinh × 2 chế độ`);
    }
  }

  await browser.close();

  const byMode = {};
  for (const mode of ['upload', 'camera']) {
    const modeChecks = checks.filter(check => check.mode === mode);
    byMode[mode] = {
      passed: modeChecks.filter(check => check.pass).length,
      total: modeChecks.length,
      mismatches: modeChecks.filter(check => !check.pass),
      warningSheets: modeChecks.filter(check => check.warnings.length > 0).map(check => ({
        index: check.index,
        sbd: check.sbd,
        warnings: check.warnings,
      })),
    };
  }
  const report = {
    generatedAt: new Date().toISOString(),
    baseUrl: BASE_URL,
    pagesDir: PAGES_DIR,
    byMode,
  };
  fs.writeFileSync(REPORT_PATH, `${JSON.stringify(report, null, 2)}\n`);
  writeHashManifest();
  console.log(JSON.stringify(byMode, null, 2));

  const failures = checks.filter(check => !check.pass);
  if (failures.length) {
    process.exitCode = 1;
  }
}

main().catch(error => {
  console.error(error);
  process.exitCode = 1;
});
