import 'fake-indexeddb/auto';
import test from 'node:test';
import assert from 'node:assert/strict';
import {
  clearOfflineUser,
  isOfflineAttemptOwned,
  isRecoverableOfflineError,
  loadOfflineAttempt,
  offlineCacheKey,
  saveOfflineAttempt,
} from '../src/lib/offline.js';

const ownerA = 'student-a';
const ownerB = 'student-b';
const attemptId = 'attempt-shared-route';

test('offline attempt cache is isolated by Firebase uid and cleared per owner', async () => {
  const saved = await saveOfflineAttempt({
    ownerUid: ownerA,
    studentUid: ownerA,
    attemptId,
    answers: { q1: 'A' },
    seq: 1,
    snapshot: {
      attempt: { id: attemptId, studentUid: ownerA, status: 'active' },
      items: [{ id: 'q1', type: 'tn' }],
    },
  });
  assert.equal(saved, true);
  assert.equal((await loadOfflineAttempt(ownerA, attemptId)).answers.q1, 'A');
  assert.equal(await loadOfflineAttempt(ownerB, attemptId), null);
  assert.notEqual(offlineCacheKey(ownerA, attemptId), offlineCacheKey(ownerB, attemptId));

  await clearOfflineUser(ownerA);
  assert.equal(await loadOfflineAttempt(ownerA, attemptId), null);
});

test('mismatched owner, student, attempt and snapshot are rejected', async () => {
  assert.equal(await saveOfflineAttempt({
    ownerUid: ownerA,
    studentUid: ownerB,
    attemptId,
    snapshot: { attempt: { id: attemptId, studentUid: ownerB } },
  }), false);
  assert.equal(await saveOfflineAttempt({
    ownerUid: ownerA,
    studentUid: ownerA,
    attemptId,
    snapshot: { attempt: { id: 'another-attempt', studentUid: ownerA } },
  }), false);

  const validShape = {
    cacheKey: offlineCacheKey(ownerA, attemptId),
    ownerUid: ownerA,
    studentUid: ownerA,
    attemptId,
    snapshot: { attempt: { id: attemptId, studentUid: ownerA } },
  };
  assert.equal(isOfflineAttemptOwned(validShape, ownerA, attemptId), true);
  assert.equal(isOfflineAttemptOwned({ ...validShape, studentUid: ownerB }, ownerA, attemptId), false);
  assert.equal(isOfflineAttemptOwned({ ...validShape, snapshot: { attempt: { id: attemptId, studentUid: ownerB } } }, ownerA, attemptId), false);
});

test('offline fallback allows only genuine connectivity failures', () => {
  for (const code of ['permission-denied', 'unauthenticated', 'not-found']) {
    assert.equal(isRecoverableOfflineError({ code }, false), false, code);
  }
  assert.equal(isRecoverableOfflineError({ code: 'unavailable' }, true), true);
  assert.equal(isRecoverableOfflineError({ code: 'network-request-failed' }, true), true);
  assert.equal(isRecoverableOfflineError({ code: 'internal' }, true), false);
  assert.equal(isRecoverableOfflineError(new Error('offline'), false), true);
});

test('final-submit draft keeps answers, review state and stable mutation id across reloads', async () => {
  const finalAttemptId = 'attempt-final-submit';
  const mutationId = 'submit-mutation-stable-0001';
  await saveOfflineAttempt({
    ownerUid: ownerA,
    studentUid: ownerA,
    attemptId: finalAttemptId,
    answers: {
      'tn-1': 'B',
      'ds-1': [true, false, true, false],
      'tln-1': '2.5',
    },
    flaggedIds: ['ds-1'],
    currentIndex: 2,
    submitMutationId: mutationId,
    snapshot: {
      attempt: { id: finalAttemptId, studentUid: ownerA, status: 'active' },
      items: [
        { id: 'tn-1', type: 'tn' },
        { id: 'ds-1', type: 'ds' },
        { id: 'tln-1', type: 'tln' },
      ],
    },
  });

  const restored = await loadOfflineAttempt(ownerA, finalAttemptId);
  assert.deepEqual(restored.answers, {
    'tn-1': 'B',
    'ds-1': [true, false, true, false],
    'tln-1': '2.5',
  });
  assert.deepEqual(restored.flaggedIds, ['ds-1']);
  assert.equal(restored.currentIndex, 2);
  assert.equal(restored.submitMutationId, mutationId);
  assert.equal(restored.snapshot.attempt.status, 'active');
});
