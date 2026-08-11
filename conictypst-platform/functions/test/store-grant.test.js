'use strict';

const assert = require('node:assert/strict');
const test = require('node:test');
const {
  extendedAccessEnd,
  normalizeStoreGrantPayload,
} = require('../lib/storeGrant');

test('Store plans grant the exact 1, 2 and 5 year durations', () => {
  const expected = new Map([
    ['hub-cloud-1y', 365],
    ['hub-cloud-2y', 730],
    ['hub-cloud-5y', 1825],
  ]);
  for (const [productId, accessDays] of expected) {
    const result = normalizeStoreGrantPayload({
      orderId: 'order_12345678',
      transactionId: 'sepay-123',
      productId,
      email: 'Teacher@Gmail.com',
      accessDays,
      totalVnd: 99000,
      paidAt: '2026-07-22T00:00:00.000Z',
    });
    assert.equal(result.email, 'teacher@gmail.com');
    assert.equal(result.accessDays, accessDays);
  }
});

test('Store rejects a duration that does not match the purchased plan', () => {
  assert.throws(() => normalizeStoreGrantPayload({
    orderId: 'order_12345678',
    transactionId: 'sepay-123',
    productId: 'hub-cloud-1y',
    email: 'teacher@gmail.com',
    accessDays: 1825,
    paidAt: '2026-07-22T00:00:00.000Z',
  }), /không khớp/);
});

test('A renewal extends from a future expiry instead of losing remaining days', () => {
  const result = extendedAccessEnd({
    paidAt: '2026-07-22T00:00:00.000Z',
    accessDays: 365,
    currentAccessEnd: '2027-01-01T00:00:00.000Z',
  });
  assert.equal(result.toISOString(), '2028-01-01T00:00:00.000Z');
});
