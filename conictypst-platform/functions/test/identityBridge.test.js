'use strict';

const assert = require('node:assert/strict');
const test = require('node:test');
const {
  IdentityBridgeError,
  assertCompatibleTargetEmail,
  sourceIdentityFromDecodedToken,
  targetUserProperties,
  validateSourceIdToken,
} = require('../lib/identityBridge');

function fakeJwt(payloadLength = 180) {
  return `header.${'a'.repeat(payloadLength)}.signature`;
}

function googleClaims(overrides = {}) {
  return {
    uid: 'same-source-and-target-uid',
    sub: 'same-source-and-target-uid',
    email: 'Teacher@Example.com',
    email_verified: true,
    name: 'Teacher Name',
    picture: 'https://example.com/photo.jpg',
    firebase: { sign_in_provider: 'google.com' },
    ...overrides,
  };
}

test('source token input is bounded and JWT-shaped', () => {
  assert.equal(validateSourceIdToken(`  ${fakeJwt()}  `), fakeJwt());
  assert.throws(() => validateSourceIdToken('short'), IdentityBridgeError);
  assert.throws(() => validateSourceIdToken(`a.${'b'.repeat(17000)}.c`), IdentityBridgeError);
  assert.throws(() => validateSourceIdToken(`a.${'!'.repeat(180)}.c`), IdentityBridgeError);
});

test('only verified Google identities are accepted', () => {
  assert.throws(
    () => sourceIdentityFromDecodedToken(googleClaims({ email_verified: false })),
    /chưa được xác minh/u,
  );
  assert.throws(
    () => sourceIdentityFromDecodedToken(googleClaims({ firebase: { sign_in_provider: 'password' } })),
    /Google/u,
  );
});

test('source profile is normalized while retaining the exact UID', () => {
  const identity = sourceIdentityFromDecodedToken(googleClaims());
  assert.deepEqual(identity, {
    uid: 'same-source-and-target-uid',
    email: 'teacher@example.com',
    displayName: 'Teacher Name',
    photoURL: 'https://example.com/photo.jpg',
  });
  assert.deepEqual(targetUserProperties(identity), {
    uid: identity.uid,
    email: identity.email,
    emailVerified: true,
    displayName: identity.displayName,
    photoURL: identity.photoURL,
  });
});

test('existing target email cannot be overwritten by source identity', () => {
  assert.doesNotThrow(() => assertCompatibleTargetEmail('TEACHER@example.com', 'teacher@example.com'));
  assert.doesNotThrow(() => assertCompatibleTargetEmail('', 'teacher@example.com'));
  assert.throws(
    () => assertCompatibleTargetEmail('someone-else@example.com', 'teacher@example.com'),
    /từ chối ghi đè/u,
  );
});
