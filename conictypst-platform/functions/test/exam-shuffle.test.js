'use strict';

const assert = require('node:assert/strict');
const test = require('node:test');
const {
  applyAttemptPresentation,
  buildAttemptPresentation,
  deterministicShuffle,
} = require('../lib/examShuffle');
const { normalizeResponses } = require('../lib/examValidation');
const { gradeObjectiveItem } = require('../lib/examGrading');

const items = [
  {
    id: 'q1', type: 'tn', questionText: 'Q1',
    options: [{ id: 'A', text: 'A' }, { id: 'B', text: 'B' }, { id: 'C', text: 'C' }],
  },
  { id: 'q2', type: 'tln', questionText: 'Q2' },
  {
    id: 'q3', type: 'tn', questionText: 'Q3',
    options: [{ id: 'X', text: 'X' }, { id: 'Y', text: 'Y' }],
  },
];

test('attempt shuffling is deterministic for one seed and differs for another', () => {
  const first = buildAttemptPresentation(items, { shuffleQuestions: true, shuffleOptions: true }, 'seed-1');
  const replay = buildAttemptPresentation(items, { shuffleQuestions: true, shuffleOptions: true }, 'seed-1');
  assert.deepEqual(first, replay);
  assert.notDeepEqual(
    deterministicShuffle(Array.from({ length: 20 }, (_, index) => index), 'seed-1'),
    deterministicShuffle(Array.from({ length: 20 }, (_, index) => index), 'seed-2'),
  );
});

test('presentation changes only order and preserves stable question/option IDs', () => {
  const presentation = buildAttemptPresentation(items, { shuffleQuestions: true, shuffleOptions: true }, 'student-attempt');
  const rendered = applyAttemptPresentation(items, presentation);
  assert.deepEqual(new Set(rendered.map((item) => item.id)), new Set(['q1', 'q2', 'q3']));
  assert.deepEqual(new Set(rendered.find((item) => item.id === 'q1').options.map((option) => option.id)), new Set(['A', 'B', 'C']));
  assert.equal(rendered.find((item) => item.id === 'q1').options.find((option) => option.id === 'B').text, 'B');
});

test('disabled shuffle retains author order', () => {
  const presentation = buildAttemptPresentation(items, { shuffleQuestions: false, shuffleOptions: false }, 'any');
  assert.deepEqual(presentation.itemOrder, ['q1', 'q2', 'q3']);
  assert.deepEqual(presentation.optionOrders.q1, ['A', 'B', 'C']);
  assert.deepEqual(applyAttemptPresentation(items, presentation), items);
});

test('shuffle keeps section order and only changes questions inside each section', () => {
  const sectioned = [
    { id: 'p1-a', type: 'tln', section: 'Phần I' },
    { id: 'p1-b', type: 'tln', section: 'Phần I' },
    { id: 'p1-c', type: 'tln', section: 'Phần I' },
    { id: 'p2-a', type: 'tln', section: 'Phần II' },
    { id: 'p2-b', type: 'tln', section: 'Phần II' },
    { id: 'p2-c', type: 'tln', section: 'Phần II' },
  ];
  const presentation = buildAttemptPresentation(sectioned, { shuffleQuestions: true }, 'section-seed');
  assert.deepEqual(new Set(presentation.itemOrder.slice(0, 3)), new Set(['p1-a', 'p1-b', 'p1-c']));
  assert.deepEqual(new Set(presentation.itemOrder.slice(3)), new Set(['p2-a', 'p2-b', 'p2-c']));
});

test('numeric UI responses follow displayed option order but grading keeps stable IDs', () => {
  const displayed = applyAttemptPresentation(items, {
    itemOrder: ['q1', 'q2', 'q3'],
    optionOrders: { q1: ['C', 'A', 'B'], q3: ['Y', 'X'] },
  });
  const response = normalizeResponses({ q1: 1 }, displayed);
  assert.equal(response.q1, 'C');
  assert.equal(gradeObjectiveItem({ id: 'q1', type: 'tn', answer: 'C', points: 0.25 }, response.q1).points, 0.25);
});

test('whole-question SVG with label-only options never shuffles fixed A-D artwork', () => {
  const wholeQuestion = [{
    id: 'whole',
    type: 'tn',
    questionSvg: '<svg></svg>',
    supportsOptionShuffle: false,
    options: [
      { id: 'A', text: 'A' }, { id: 'B', text: 'B' },
      { id: 'C', text: 'C' }, { id: 'D', text: 'D' },
    ],
  }];
  const presentation = buildAttemptPresentation(
    wholeQuestion,
    { shuffleQuestions: true, shuffleOptions: true },
    'must-not-remap-fixed-artwork',
  );
  assert.deepEqual(presentation.optionOrders.whole, ['A', 'B', 'C', 'D']);
});
