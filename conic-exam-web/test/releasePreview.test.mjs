import test from 'node:test';
import assert from 'node:assert/strict';
import { createReleasePreview } from '../src/lib/releasePreview.js';

test('builds preview only from public release data', () => {
  const preview = createReleasePreview({
    id: 'release-1',
    title: 'Fallback title',
    maximumScore: 1.25,
    answerKey: [{ id: 'tn-1', answer: 'B' }],
    privatePackage: { items: [{ id: 'tn-1', answer: 'B' }] },
    publicPackage: {
      title: 'Đề mẫu',
      version: '2026.1',
      publicItems: [
        { id: 'tn-1', type: 'tn', questionText: 'Câu hỏi' },
        { id: 'ds-1', type: 'ds', questionText: 'Đúng sai' },
        { id: 'tln-1', type: 'tln', questionText: 'Trả lời ngắn' },
      ],
    },
  });

  assert.equal(preview.title, 'Đề mẫu');
  assert.equal(preview.questionCount, 3);
  assert.deepEqual(preview.counts, { tn: 1, ds: 1, tln: 1, tl: 0 });
  assert.equal(Object.hasOwn(preview, 'answerKey'), false);
  assert.equal(Object.hasOwn(preview, 'privatePackage'), false);
  assert.equal(JSON.stringify(preview).includes('"answer":"B"'), false);
});

test('rejects a release without a public item package', () => {
  assert.throws(() => createReleasePreview({ id: 'release-1' }), /gói câu hỏi công khai/u);
});
