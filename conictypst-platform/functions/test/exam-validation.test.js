'use strict';

const assert = require('node:assert/strict');
const crypto = require('node:crypto');
const test = require('node:test');
const zlib = require('node:zlib');
const {
  ExamValidationError,
  normalizePackage,
  normalizeResponses,
} = require('../lib/examValidation');

function validPackage() {
  return {
    title: 'Đề mẫu 12-4-6',
    version: '2026.1',
    sourceId: 'de-mau',
    sourceHash: 'a'.repeat(64),
    publicItems: [
      {
        id: 'tn-1', type: 'tn', position: 1, points: 0.25, section: 'Phần I', questionText: 'Chọn phương án.',
        options: [{ id: 'A', label: 'A', text: '1' }, { id: 'B', label: 'B', contentText: '2' }],
      },
      {
        id: 'ds-1', type: 'ds', position: 2, questionText: 'Đúng hay sai?',
        statements: [
          { id: 'a', text: 'a' }, { id: 'b', text: 'b' },
          { id: 'c', text: 'c' }, { id: 'd', text: 'd' },
        ],
      },
      { id: 'tln-1', type: 'tln', position: 3, questionText: 'Trả lời ngắn' },
      { id: 'tl-1', type: 'tl', position: 4, questionText: 'Trình bày lời giải' },
    ],
    answerKey: [
      { id: 'tn-1', type: 'tn', answer: 'A', points: 0.25, sourceId: 'bank-tn-001', optionOrder: ['A', 'B'] },
      { id: 'ds-1', type: 'ds', answer: [true, false, true, false], points: 1, statementOrder: ['a', 'b', 'c', 'd'] },
      { id: 'tln-1', type: 'tln', acceptedAnswers: [1.25, '5/4'], tolerance: 0.001, points: 0.5 },
      { id: 'tl-1', type: 'tl', points: 2, rubric: [{ points: 1, criterion: 'Lập luận' }], solutionAsset: { hash: 'x' } },
    ],
  };
}

function compressedSvg(svg) {
  const expanded = Buffer.from(svg, 'utf8');
  return {
    encoding: 'gzip-base64',
    data: zlib.gzipSync(expanded).toString('base64'),
    sha256: crypto.createHash('sha256').update(expanded).digest('hex'),
    bytes: expanded.length,
  };
}

test('publishing creates separate public and private packages with Passport lineage', () => {
  const result = normalizePackage(validPackage());
  assert.equal(result.questionCount, 4);
  assert.equal(result.maximumScore, 3.75);
  assert.equal(result.publicPackage.publicItems[0].answer, undefined);
  assert.equal(result.privatePackage.items[0].answer, 'A');
  assert.equal(result.privatePackage.items[0].sourceId, 'bank-tn-001');
  assert.deepEqual(result.privatePackage.items[0].optionOrder, ['A', 'B']);
  assert.deepEqual(result.privatePackage.items[1].statementOrder, ['a', 'b', 'c', 'd']);
  assert.deepEqual(result.privatePackage.items[3].solutionAsset, { hash: 'x' });
  assert.match(result.contentHash, /^[a-f0-9]{64}$/u);
});

test('public package rejects nested secret aliases, not only exact answer fields', () => {
  for (const leaked of [
    { acceptedAnswers: ['A'] },
    { renderer: { correctOptionId: 'A' } },
    { asset: { solutionAsset: '/secret.svg' } },
  ]) {
    const input = validPackage();
    Object.assign(input.publicItems[0], leaked);
    assert.throws(() => normalizePackage(input), ExamValidationError);
  }
});

test('public item schema rejects every unknown field including truth aliases and source lineage', () => {
  for (const field of ['truth', 'expected', 'key', 'isRight', 'sourceId', 'answerValue', 'harmlessUnknown']) {
    const input = validPackage();
    input.publicItems[0][field] = field === 'isRight' ? true : 'secret';
    assert.throws(() => normalizePackage(input), /không được hỗ trợ/u);
  }
  const nested = validPackage();
  nested.publicItems[0].options[0].isRight = true;
  assert.throws(() => normalizePackage(nested), /không được hỗ trợ/u);
});

test('inline SVG fields reject scripts, event handlers and external resources', () => {
  for (const svg of [
    '<svg><script>alert(1)</script></svg>',
    '<svg onload="alert(1)"></svg>',
    '<svg><image href="https://tracker.example/pixel" /></svg>',
    '<svg><foreignObject>html</foreignObject></svg>',
  ]) {
    const input = validPackage();
    input.publicItems[0].questionSvg = svg;
    assert.throws(() => normalizePackage(input), /không an toàn/u);
  }
});

test('questionSvg accepts only verified gzip-base64 SVG objects with exact fields', () => {
  const input = validPackage();
  const packed = compressedSvg('<svg xmlns="http://www.w3.org/2000/svg"><text>Typst</text></svg>');
  input.publicItems[0].questionSvg = packed;
  const result = normalizePackage(input);
  assert.deepEqual(result.publicPackage.publicItems[0].questionSvg, packed);
  assert.equal(result.publicPackage.publicItems[0].points, 0.25);
  assert.equal(result.publicPackage.publicItems[0].section, 'Phần I');
  assert.equal(result.publicPackage.publicItems[0].options[0].label, 'A');
  assert.equal(result.publicPackage.publicItems[0].supportsOptionShuffle, false);

  for (const mutate of [
    (value) => { value.encoding = 'base64'; },
    (value) => { value.sha256 = '0'.repeat(64); },
    (value) => { value.bytes += 1; },
    (value) => { value.unknown = true; },
    (value) => {
      const middle = Math.floor(value.data.length / 2);
      const replacement = value.data[middle] === 'A' ? 'B' : 'A';
      value.data = `${value.data.slice(0, middle)}${replacement}${value.data.slice(middle + 1)}`;
    },
  ]) {
    const invalid = validPackage();
    invalid.publicItems[0].questionSvg = { ...packed };
    mutate(invalid.publicItems[0].questionSvg);
    assert.throws(() => normalizePackage(invalid), ExamValidationError);
  }
});

test('only independent option content enables option shuffling', () => {
  const input = validPackage();
  input.publicItems[0].options = [
    { id: 'A', text: 'A', contentText: 'Phương án thứ nhất' },
    { id: 'B', text: 'B', contentSvg: '<svg><text>Phương án thứ hai</text></svg>' },
  ];
  assert.equal(normalizePackage(input).publicPackage.publicItems[0].supportsOptionShuffle, true);
});

test('compressed private solution SVG is verified and never copied into public package', () => {
  const input = validPackage();
  const packed = compressedSvg('<svg xmlns="http://www.w3.org/2000/svg"><text>Lời giải</text></svg>');
  input.answerKey[0].solutionSvg = packed;
  const result = normalizePackage(input);
  assert.equal(result.publicPackage.publicItems[0].solution, undefined);
  assert.deepEqual(result.privatePackage.items[0].solution, packed);
});

test('public package is rejected above the 900 KiB Firestore safety cap', () => {
  const input = validPackage();
  input.publicItems[0].questionText = 'q'.repeat(100000);
  input.publicItems[0].stemText = 's'.repeat(100000);
  input.publicItems[0].options = Array.from({ length: 10 }, (_, index) => ({
    id: `o${index}`,
    text: 't'.repeat(100000),
  }));
  input.answerKey[0].optionOrder = input.publicItems[0].options.map((option) => option.id);
  input.answerKey[0].answer = 'o0';
  assert.throws(() => normalizePackage(input), /900 KiB/u);
});

test('aggregate expanded SVG budget rejects gzip bombs above 32 MiB', () => {
  const largeSvg = `<svg><text>${'x'.repeat(2 * 1024 * 1024 - 100)}</text></svg>`;
  const packed = compressedSvg(largeSvg);
  const input = {
    title: 'SVG budget',
    publicItems: Array.from({ length: 17 }, (_, index) => ({
      id: `tl-${index}`, type: 'tl', questionSvg: packed,
    })),
    answerKey: Array.from({ length: 17 }, (_, index) => ({
      id: `tl-${index}`, type: 'tl', points: 1,
    })),
  };
  assert.throws(() => normalizePackage(input), /Tổng SVG giải nén/u);
});

test('TN validates unique option IDs, answer membership and one-based finite numeric indices', () => {
  const duplicate = validPackage();
  duplicate.publicItems[0].options[1].id = 'A';
  assert.throws(() => normalizePackage(duplicate), /ID trùng/u);

  const foreignAnswer = validPackage();
  foreignAnswer.answerKey[0].answer = 'Z';
  assert.throws(() => normalizePackage(foreignAnswer), /không thuộc/u);

  const numeric = validPackage();
  numeric.answerKey[0].answer = 2;
  assert.equal(normalizePackage(numeric).privatePackage.items[0].answer, 'B');
  for (const bad of [0, 3, 1.5, Number.POSITIVE_INFINITY, Number.NaN]) {
    const invalid = validPackage();
    invalid.answerKey[0].answer = bad;
    assert.throws(() => normalizePackage(invalid), /Chỉ số đáp án/u);
  }
});

test('DS requires exactly four statement objects, unique IDs and an exact statement order', () => {
  const tooShort = validPackage();
  tooShort.publicItems[1].statements.pop();
  assert.throws(() => normalizePackage(tooShort), /đúng 4/u);

  const duplicate = validPackage();
  duplicate.publicItems[1].statements[3].id = 'a';
  assert.throws(() => normalizePackage(duplicate), /ID trùng/u);

  const badOrder = validPackage();
  badOrder.answerKey[1].statementOrder = ['a', 'b', 'c', 'x'];
  assert.throws(() => normalizePackage(badOrder), /hoán vị/u);
});

test('true/false package enforces four booleans and one maximum point', () => {
  const wrongLength = validPackage();
  wrongLength.answerKey[1].answer = [true, false];
  assert.throws(() => normalizePackage(wrongLength), /đúng 4/u);

  const wrongPoints = validPackage();
  wrongPoints.answerKey[1].points = 2;
  assert.throws(() => normalizePackage(wrongPoints), /points = 1/u);
});

test('an empty answer can never make an unanswered response correct', () => {
  const emptyTn = validPackage();
  emptyTn.answerKey[0].answer = '   ';
  assert.throws(() => normalizePackage(emptyTn), /không được để trống/u);

  const emptyTln = validPackage();
  emptyTln.answerKey[2].acceptedAnswers = [''];
  assert.throws(() => normalizePackage(emptyTln), /acceptedAnswers/u);
});

test('response validation rejects unknown IDs and type confusion', () => {
  const items = validPackage().publicItems;
  assert.deepEqual(normalizeResponses({
    'tn-1': 'A', 'ds-1': [true, null, false, true], 'tln-1': '1,25', 'tl-1': 'Bài làm',
  }, items), {
    'tn-1': 'A', 'ds-1': [true, null, false, true], 'tln-1': '1,25', 'tl-1': 'Bài làm',
  });
  assert.throws(() => normalizeResponses({ foreign: 'A' }, items), /không thuộc đề/u);
  assert.throws(() => normalizeResponses({ 'ds-1': ['true'] }, items), /true\/false/u);
  assert.throws(() => normalizeResponses({ 'tn-1': 'Z' }, items), /ID phương án/u);
  assert.equal(normalizeResponses({ 'tn-1': 2 }, items)['tn-1'], 'B');
  assert.throws(() => normalizeResponses({ 'tn-1': Number.NaN }, items), /hữu hạn/u);
  assert.throws(() => normalizeResponses({ 'tln-1': Number.POSITIVE_INFINITY }, items), /không hữu hạn/u);
});
