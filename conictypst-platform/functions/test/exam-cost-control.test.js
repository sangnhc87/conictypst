'use strict';

const assert = require('node:assert/strict');
const test = require('node:test');
const {
  DEFAULT_COST_MODEL,
  buildTeacherUsage,
  costForecast,
  quotaSnapshot,
} = require('../lib/examCostControl');

test('quota snapshot reports the highest utilization and severity', () => {
  const result = quotaSnapshot(
    { classCount: 8, attemptCount: 12000 },
    { maxClasses: 10, maxAttemptsPerYear: 12000 },
  );
  assert.equal(result.peak.limitKey, 'maxAttemptsPerYear');
  assert.equal(result.severity, 'critical');
});

test('teacher usage raises quota and expiry alerts', () => {
  const result = buildTeacherUsage({
    member: {
      uid: 'teacher-1', status: 'active', accessEndsAt: new Date('2026-07-20T00:00:00Z'),
      limits: { maxClasses: 10 },
    },
    usage: { classCount: 9 },
    defaultLimits: { maxClasses: 10 },
    now: Date.parse('2026-07-17T00:00:00Z'),
  });
  assert.equal(result.quota.severity, 'danger');
  assert.deepEqual(result.alerts.map((item) => item.code), ['quota_maxClasses', 'membership_expiry']);
});

test('cost forecast projects current pace and respects free quotas', () => {
  const low = costForecast({
    attemptsThisMonth: 100,
    elapsedDays: 10,
    daysInMonth: 30,
    teacherCount: 5,
    storageBytes: 1024,
    model: DEFAULT_COST_MODEL,
  });
  assert.equal(low.projectedAttempts, 300);
  assert.equal(low.projectedVnd, 0);

  const high = costForecast({
    attemptsThisMonth: 100000,
    elapsedDays: 10,
    daysInMonth: 30,
    teacherCount: 100,
    storageBytes: DEFAULT_COST_MODEL.freeStorageBytes * 2,
    model: DEFAULT_COST_MODEL,
  });
  assert.ok(high.projectedVnd > 0);
  assert.ok(high.components.storageVnd > 0);
  assert.ok(high.projectedOperations.reads > low.projectedOperations.reads);
});
