'use strict';

const test = require('node:test');
const assert = require('node:assert/strict');

const { PRODUCT_DEFINITIONS } = require('../lib/constants');
const { approvalRequired, automaticMembership } = require('../lib/accessPolicy');

const teacher = Object.freeze({ uid: 'teacher-01', email: 'gv@example.com' });

test('HDSD tự cấp quyền ngay sau đăng nhập, không vào hàng chờ', () => {
  const member = automaticMembership(PRODUCT_DEFINITIONS.hdsd, teacher);
  assert.equal(approvalRequired(PRODUCT_DEFINITIONS.hdsd), false);
  assert.equal(member.status, 'active');
  assert.equal(member.hasAccess, true);
  assert.equal(member.autoGranted, true);
  assert.equal(member.accessMode, 'authenticated');
});

test('Hub công khai và OMR vẫn cần phê duyệt', () => {
  assert.equal(automaticMembership(PRODUCT_DEFINITIONS.hub, teacher).status, 'public');
  assert.equal(automaticMembership(PRODUCT_DEFINITIONS.omr, teacher), null);
  assert.equal(approvalRequired(PRODUCT_DEFINITIONS.omr), true);
});
