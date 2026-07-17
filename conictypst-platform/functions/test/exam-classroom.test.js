'use strict';

const assert = require('node:assert/strict');
const test = require('node:test');
const { normalizeJoinMode, projectJoinMembership } = require('../lib/examClassroom');

test('class join mode accepts only approval and auto', () => {
  assert.equal(normalizeJoinMode(undefined), 'approval');
  assert.equal(normalizeJoinMode('AUTO'), 'auto');
  assert.throws(() => normalizeJoinMode('public'), /approval hoặc auto/u);
});

test('approval creates pending membership while auto activates within quota', () => {
  assert.deepEqual(projectJoinMembership({ joinMode: 'approval', activeMemberships: 9, maxStudents: 10 }), {
    reused: false, nextStatus: 'pending', pendingDelta: 1, studentDelta: 0,
  });
  assert.deepEqual(projectJoinMembership({ joinMode: 'auto', activeMemberships: 9, maxStudents: 10 }), {
    reused: false, nextStatus: 'active', pendingDelta: 0, studentDelta: 1,
  });
});

test('auto join respects quota and existing membership is idempotent', () => {
  assert.equal(projectJoinMembership({ joinMode: 'auto', activeMemberships: 10, maxStudents: 10 }).quotaExceeded, true);
  assert.deepEqual(projectJoinMembership({ currentStatus: 'active', joinMode: 'auto', activeMemberships: 10, maxStudents: 10 }), {
    reused: true, nextStatus: 'active', pendingDelta: 0, studentDelta: 0,
  });
});
