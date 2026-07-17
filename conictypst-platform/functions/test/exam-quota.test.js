'use strict';

const assert = require('node:assert/strict');
const test = require('node:test');
const {
  consumesActiveAssignmentQuota,
  projectActiveAssignmentCount,
} = require('../lib/examQuota');

const now = Date.parse('2026-07-16T12:00:00.000Z');

test('only published assignments which have not closed consume active quota', () => {
  assert.equal(consumesActiveAssignmentQuota({
    status: 'published', closeAt: new Date(now + 60000),
  }, now), true);
  assert.equal(consumesActiveAssignmentQuota({
    status: 'published', closeAt: new Date(now),
  }, now), false);
  assert.equal(consumesActiveAssignmentQuota({
    status: 'published', closeAt: new Date(now - 1),
  }, now), false);
  assert.equal(consumesActiveAssignmentQuota({
    status: 'draft', closeAt: new Date(now + 60000),
  }, now), false);
  assert.equal(consumesActiveAssignmentQuota({
    status: 'closed', closeAt: new Date(now + 60000),
  }, now), false);
  assert.equal(consumesActiveAssignmentQuota({
    status: 'cancelled', closeAt: new Date(now + 60000),
  }, now), false);
});

test('live reconciliation releases expired, closed and cancelled assignment slots', () => {
  const expiredToFuture = projectActiveAssignmentCount(0, {
    status: 'published', closeAt: new Date(now - 1),
  }, {
    status: 'published', closeAt: new Date(now + 60000),
  }, now);
  assert.deepEqual(expiredToFuture, { before: 0, after: 1, delta: 1, projected: 1 });

  const closing = projectActiveAssignmentCount(30, {
    status: 'published', closeAt: new Date(now + 60000),
  }, {
    status: 'closed', closeAt: new Date(now + 60000),
  }, now);
  assert.deepEqual(closing, { before: 1, after: 0, delta: -1, projected: 29 });

  const historical = projectActiveAssignmentCount(0, null, {
    status: 'published', closeAt: new Date(now - 1),
  }, now);
  assert.deepEqual(historical, { before: 0, after: 0, delta: 0, projected: 0 });
});
