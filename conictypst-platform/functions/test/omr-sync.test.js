'use strict';

const test = require('node:test');
const assert = require('node:assert/strict');
const omr = require('../omr-sync');

const { __test } = omr;

test('retention uses calendar months and clamps end-of-month', () => {
  assert.equal(
    __test.addCalendarMonths(new Date('2024-01-31T08:30:00.000Z'), 1).toISOString(),
    '2024-02-29T08:30:00.000Z',
  );
  assert.equal(
    __test.addCalendarMonths(new Date('2024-02-29T08:30:00.000Z'), 12).toISOString(),
    '2025-02-28T08:30:00.000Z',
  );
});

test('Vietnam school-year boundary starts in July', () => {
  assert.equal(__test.academicYearId(new Date('2026-06-30T23:59:59Z')), '2025-2026');
  assert.equal(__test.academicYearId(new Date('2026-07-01T00:00:00Z')), '2026-2027');
});

test('only verified bootstrap owner emails receive owner privileges', () => {
  assert.equal(__test.isVerifiedOwner({
    token: { email: ' NguyenSangNHC@gmail.com ', email_verified: true },
  }), true);
  assert.equal(__test.isVerifiedOwner({
    token: { email: 'sangbeau@gmail.com', email_verified: true },
  }), true);
  assert.equal(__test.isVerifiedOwner({
    token: { email: 'nguyensangnhc@gmail.com', email_verified: false },
  }), false);
  assert.equal(__test.isVerifiedOwner({
    token: { email: 'another-admin@example.com', email_verified: true, ctRole: 'admin' },
  }), false);
});

test('result metadata never keeps a data URL or arbitrary client fields', () => {
  const result = __test.normalizeResult({
    id: 'result_01',
    sbd: '000001',
    score: 9.25,
    answers: { mcq: { 1: 'A' } },
    imageDataURL: 'data:image/jpeg;base64,SECRET',
    objectKey: 'must-not-be-accepted',
  });
  assert.equal(result.id, 'result_01');
  assert.equal(result.score, 9.25);
  assert.equal(result.imageDataURL, undefined);
  assert.equal(result.objectKey, undefined);
});

test('workspace enforces teacher class and student limits', () => {
  const limits = { maxClasses: 1, maxStudents: 2 };
  assert.throws(() => __test.normalizeWorkspace({
    students: [
      { sbd: '1', name: 'A', cls: '12A1' },
      { sbd: '2', name: 'B', cls: '12A2' },
    ],
  }, limits));
  const normalized = __test.normalizeWorkspace({
    students: [
      { sbd: '1', name: 'A', cls: '12A1' },
      { sbd: '2', name: 'B', cls: '12A1' },
    ],
  }, limits);
  assert.equal(normalized.classCount, 1);
  assert.equal(normalized.studentCount, 2);
});

test('new membership fields retain every legacy client alias', () => {
  const expiry = new Date('2027-07-14T00:00:00.000Z');
  const view = __test.tenantView('teacher-uid', {
    status: 'active',
    accessStartsAt: new Date('2026-07-14T00:00:00.000Z'),
    accessEndsAt: expiry,
    limits: {
      storageBytes: 512 * 1024 * 1024,
      cloudImageEnabled: true,
      maxClasses: 20,
      maxStudents: 1000,
      maxResults: 20000,
    },
    usage: { r2Bytes: 1234, pendingR2Bytes: 56 },
    usageYear: __test.academicYearId(),
    omrUpdatedAt: new Date('2026-07-14T01:00:00.000Z'),
  });
  assert.equal(view.accessEndsAt, expiry.toISOString());
  assert.equal(view.accessExpiresAt, expiry.toISOString());
  assert.equal(view.limits.storageBytes, 512 * 1024 * 1024);
  assert.equal(view.limits.r2QuotaBytes, 512 * 1024 * 1024);
  assert.equal(view.limits.r2Bytes, 512 * 1024 * 1024);
  assert.equal(view.limits.maxStorageBytes, 512 * 1024 * 1024);
  assert.equal(view.cloudImageEnabled, true);
  assert.equal(view.imageRetentionMonths, 6);
  assert.equal(view.usage.r2Bytes, 1234);
  assert.equal(view.updatedAt, '2026-07-14T01:00:00.000Z');
});

test('free tier disables legacy storage quota and guarantees 12,000 results', () => {
  const limits = __test.normalizeLimits({
    storageBytes: 512 * 1024 * 1024,
    maxResults: 5000,
  });
  assert.equal(limits.cloudImageEnabled, false);
  assert.equal(limits.r2QuotaBytes, 0);
  assert.equal(limits.maxResults, 12000);
});

test('paid cloud storage must be explicitly enabled', () => {
  const limits = __test.normalizeLimits({
    storageBytes: 1024 * 1024 * 1024,
    cloudImageEnabled: true,
  });
  assert.equal(limits.cloudImageEnabled, true);
  assert.equal(limits.r2QuotaBytes, 1024 * 1024 * 1024);
});

test('blob retention is six months and hourly cleanup can cover 50,000 results a day', () => {
  assert.equal(__test.BLOB_RETENTION_MONTHS, 6);
  assert.ok(__test.CLEANUP_RESULTS_PER_RUN * 24 >= 50000);
  assert.equal(
    __test.blobExpiryMillis({ createdAt: new Date('2026-01-31T00:00:00.000Z') }),
    Date.parse('2026-07-31T00:00:00.000Z'),
  );
});

test('timestamp conversion accepts Date and access ends at an exclusive boundary', () => {
  const expiry = new Date('2026-07-14T12:00:00.000Z');
  assert.equal(__test.timestampMillis(expiry), expiry.getTime());
  assert.doesNotThrow(() => __test.assertTenantActive({
    status: 'active',
    accessEndsAt: expiry,
  }, expiry.getTime() - 1));
  assert.throws(() => __test.assertTenantActive({
    status: 'active',
    accessEndsAt: expiry,
  }, expiry.getTime()));
  assert.throws(() => __test.assertTenantActive({
    status: 'deletion_scheduled',
    accessEndsAt: new Date('2099-01-01T00:00:00.000Z'),
  }));
});

test('cleanup path guard accepts only exact OMR member subcollections', () => {
  assert.equal(
    __test.isOmrSubcollectionPath(
      'products/omr/members/teacher_1/omrResults/result_1',
      'omrResults',
    ),
    true,
  );
  assert.equal(
    __test.isOmrSubcollectionPath(
      'products/hub/members/teacher_1/omrResults/result_1',
      'omrResults',
    ),
    false,
  );
  assert.equal(
    __test.isOmrSubcollectionPath(
      'products/omr/members/teacher_1/archive/x/omrResults/result_1',
      'omrResults',
    ),
    false,
  );
  assert.equal(
    __test.isOmrSubcollectionPath('omrTenants/teacher_1/omrResults/result_1', 'omrResults'),
    false,
  );
  assert.equal(
    __test.isOmrSubcollectionPath(
      'products/omr/members/teacher_1/arbitrary/result_1',
      'arbitrary',
    ),
    false,
  );
});

test('module exports current OMR contract and no legacy admin callables', () => {
  const expected = [
    'omrRequestAccess',
    'omrGetBootstrap',
    'omrSyncWorkspace',
    'omrSyncResults',
    'omrDeleteResult',
    'omrCreateUploadUrl',
    'omrCommitUpload',
    'omrCreateDownloadUrl',
    'omrCleanupExpiredData',
  ];
  expected.forEach((name) => assert.equal(typeof omr[name], 'function', `${name} must be exported`));
  assert.equal(omr.omrAdminListTenants, undefined);
  assert.equal(omr.omrAdminApproveTenant, undefined);
  assert.equal(omr.omrAdminUpdateTenant, undefined);
  assert.equal(omr.ctProcessDeletionJobs, undefined, 'deletion jobs share the hourly cleanup scheduler');
});
