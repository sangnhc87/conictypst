import test from 'node:test';
import assert from 'node:assert/strict';
import { inspectExamPackage } from '../src/lib/examPackage.js';

function sample() {
  return {
    schemaVersion: 'conic-exam-package/v1',
    title: 'Đề 12-4-6',
    publicItems: [
      { id: 'q1', type: 'tn', questionSvg: '<svg />' },
      { id: 'q2', type: 'ds', questionSvg: '<svg />' },
      { id: 'q3', type: 'tln', questionSvg: '<svg />' },
    ],
    answerKey: [
      { id: 'q1', type: 'tn', points: 0.25, answer: 'o2' },
      { id: 'q2', type: 'ds', points: 1, answer: [true, false, true, false] },
      { id: 'q3', type: 'tln', points: 0.5, acceptedAnswers: ['0,25'] },
    ],
  };
}

test('accepts the public/private package contract', () => {
  const report = inspectExamPackage(sample());
  assert.equal(report.valid, true);
  assert.deepEqual(report.counts, { tn: 1, ds: 1, tln: 1, tl: 0 });
  assert.equal(report.maxScore, 1.75);
});

test('rejects duplicate item ids and missing private keys', () => {
  const value = sample();
  value.publicItems[1].id = 'q1';
  value.answerKey.pop();
  const report = inspectExamPackage(value);
  assert.equal(report.valid, false);
  assert.match(report.errors.join('\n'), /trùng/u);
  assert.match(report.errors.join('\n'), /answerKey/u);
});
