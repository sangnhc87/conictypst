'use strict';

const assert = require('node:assert/strict');
const test = require('node:test');
const {
  DS_POINTS,
  gradeObjectiveItem,
  gradeResponses,
  numericValue,
} = require('../lib/examGrading');

test('true/false grading uses the complete national 0-.1-.25-.5-1 scale', () => {
  const key = { id: 'ds-1', type: 'ds', answer: [true, false, true, false], points: 1 };
  assert.deepEqual(DS_POINTS, [0, 0.1, 0.25, 0.5, 1]);
  for (let correct = 0; correct <= 4; correct += 1) {
    const response = key.answer.map((answer, index) => (index < correct ? answer : !answer));
    assert.equal(gradeObjectiveItem(key, response).points, DS_POINTS[correct]);
  }
});

test('short-answer grading supports comma decimals and explicit numeric tolerance', () => {
  const key = {
    id: 'tln-1', type: 'tln', answer: 1.25, acceptedAnswers: [1.25], tolerance: 0.01, points: 0.5,
  };
  assert.equal(numericValue(' 1,259 '), 1.259);
  assert.equal(gradeObjectiveItem(key, '1,259').points, 0.5);
  assert.equal(gradeObjectiveItem(key, '1,27').points, 0);
});

test('a correct 12-4-6 exam receives exactly 10 points', () => {
  const keys = [];
  const responses = {};
  for (let index = 1; index <= 12; index += 1) {
    const id = `tn-${index}`;
    keys.push({ id, type: 'tn', answer: 'A', points: 0.25 });
    responses[id] = 'A';
  }
  for (let index = 1; index <= 4; index += 1) {
    const id = `ds-${index}`;
    keys.push({ id, type: 'ds', answer: [true, false, true, false], points: 1 });
    responses[id] = [true, false, true, false];
  }
  for (let index = 1; index <= 6; index += 1) {
    const id = `tln-${index}`;
    keys.push({ id, type: 'tln', answer: index, acceptedAnswers: [index], tolerance: 0, points: 0.5 });
    responses[id] = String(index);
  }
  const result = gradeResponses(keys, responses);
  assert.equal(result.score, 10);
  assert.equal(result.maximumScore, 10);
  assert.equal(result.manualPending, 0);
});

test('essay points remain pending until a bounded manual grade exists', () => {
  const keys = [{ id: 'tl-1', type: 'tl', points: 2, rubric: [] }];
  assert.equal(gradeResponses(keys, { 'tl-1': 'Bài làm' }).manualPending, 1);
  const graded = gradeResponses(keys, { 'tl-1': 'Bài làm' }, {
    'tl-1': { points: 1.75, feedback: 'Tốt' },
  });
  assert.equal(graded.manualPending, 0);
  assert.equal(graded.score, 1.75);
});
