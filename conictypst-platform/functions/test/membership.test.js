'use strict';

const assert = require('node:assert/strict');
const test = require('node:test');
const {
  addUtcMonthsClamped,
  reduceMembershipAction,
} = require('../lib/membership');

const product = {
  id: 'omr',
  defaultMonths: 12,
  defaultLimits: { storageBytes: 100, maxClasses: 10, retentionDays: 365 },
};
const actorUid = 'owner-uid';

function activeMember(overrides = {}) {
  return {
    uid: 'teacher-uid',
    productId: 'omr',
    status: 'active',
    revision: 4,
    accessStartsAt: new Date('2026-01-01T00:00:00.000Z'),
    accessEndsAt: new Date('2026-12-31T00:00:00.000Z'),
    limits: { storageBytes: 100, maxClasses: 10, retentionDays: 365 },
    ...overrides,
  };
}

test('calendar month addition clamps end-of-month dates', () => {
  assert.equal(
    addUtcMonthsClamped(new Date('2026-01-31T10:30:00.000Z'), 1).toISOString(),
    '2026-02-28T10:30:00.000Z',
  );
});

test('quota update never changes expiry', () => {
  const current = activeMember();
  const result = reduceMembershipAction({
    action: 'update_limits',
    current,
    payload: { limits: { maxClasses: 25 } },
    actorUid,
    now: new Date('2026-07-14T00:00:00.000Z'),
    product,
  });
  assert.equal(Object.hasOwn(result.patch, 'accessEndsAt'), false);
  assert.deepEqual(result.patch.limits, {
    storageBytes: 100,
    maxClasses: 25,
    retentionDays: 365,
  });
});

test('cloud image entitlement is an explicit boolean quota', () => {
  const current = activeMember();
  const result = reduceMembershipAction({
    action: 'update_limits',
    current,
    payload: { limits: { storageBytes: 1024, cloudImageEnabled: true } },
    actorUid,
    now: new Date('2026-07-14T00:00:00.000Z'),
    product,
  });
  assert.equal(result.patch.limits.cloudImageEnabled, true);
  assert.equal(result.patch.limits.storageBytes, 1024);
});

test('extend starts from current future expiry', () => {
  const result = reduceMembershipAction({
    action: 'extend',
    current: activeMember(),
    payload: { months: 2 },
    actorUid,
    now: new Date('2026-07-14T00:00:00.000Z'),
    product,
  });
  assert.equal(result.patch.accessEndsAt.toISOString(), '2027-02-28T00:00:00.000Z');
});

test('extend starts from now when membership has expired', () => {
  const result = reduceMembershipAction({
    action: 'extend',
    current: activeMember({ accessEndsAt: new Date('2025-01-01T00:00:00.000Z') }),
    payload: { months: 1 },
    actorUid,
    now: new Date('2026-07-14T00:00:00.000Z'),
    product,
  });
  assert.equal(result.patch.accessEndsAt.toISOString(), '2026-08-14T00:00:00.000Z');
});

test('suspend and resume preserve expiry', () => {
  const current = activeMember();
  const suspended = reduceMembershipAction({
    action: 'suspend', current, payload: {}, actorUid,
    now: new Date('2026-07-14T00:00:00.000Z'), product,
  });
  assert.equal(Object.hasOwn(suspended.patch, 'accessEndsAt'), false);

  const resumed = reduceMembershipAction({
    action: 'resume',
    current: { ...current, ...suspended.patch },
    payload: {},
    actorUid,
    now: new Date('2026-07-15T00:00:00.000Z'),
    product,
  });
  assert.equal(Object.hasOwn(resumed.patch, 'accessEndsAt'), false);
  assert.equal(resumed.patch.status, 'active');
});

test('scheduled deletion blocks access and cancellation restores prior status', () => {
  const current = activeMember({ status: 'suspended' });
  const scheduled = reduceMembershipAction({
    action: 'schedule_delete',
    current,
    payload: { graceDays: 7 },
    actorUid,
    now: new Date('2026-07-14T00:00:00.000Z'),
    product,
  });
  assert.equal(scheduled.patch.status, 'deletion_scheduled');
  assert.equal(scheduled.patch.deleteAfter.toISOString(), '2026-07-21T00:00:00.000Z');

  const cancelled = reduceMembershipAction({
    action: 'cancel_delete',
    current: { ...current, ...scheduled.patch },
    payload: {},
    actorUid,
    now: new Date('2026-07-15T00:00:00.000Z'),
    product,
  });
  assert.equal(cancelled.patch.status, 'suspended');
  assert.ok(cancelled.deleteFields.includes('deleteAfter'));
});
