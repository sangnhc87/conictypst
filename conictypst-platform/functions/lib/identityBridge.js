'use strict';

const SOURCE_PROJECT_ID = 'conicgv';
const MAX_SOURCE_ID_TOKEN_LENGTH = 16384;

class IdentityBridgeError extends Error {
  constructor(code, message) {
    super(message);
    this.name = 'IdentityBridgeError';
    this.code = code;
  }
}

function fail(code, message) {
  throw new IdentityBridgeError(code, message);
}

function validateSourceIdToken(value) {
  if (typeof value !== 'string') {
    fail('invalid-argument', 'idToken phải là chuỗi.');
  }
  const token = value.trim();
  if (token.length < 100 || token.length > MAX_SOURCE_ID_TOKEN_LENGTH) {
    fail('invalid-argument', 'idToken có độ dài không hợp lệ.');
  }
  const segments = token.split('.');
  if (segments.length !== 3 || segments.some((segment) => !/^[A-Za-z0-9_-]+$/u.test(segment))) {
    fail('invalid-argument', 'idToken không đúng định dạng JWT.');
  }
  return token;
}

function normalizeEmail(value) {
  return typeof value === 'string' ? value.trim().toLowerCase() : '';
}

function sourceIdentityFromDecodedToken(decoded) {
  if (!decoded || typeof decoded !== 'object') {
    fail('unauthenticated', 'Token nguồn không hợp lệ.');
  }
  const uid = typeof decoded.uid === 'string' ? decoded.uid.trim() : String(decoded.sub || '').trim();
  const email = normalizeEmail(decoded.email);
  if (!uid || uid.length > 128 || uid.includes('/')) {
    fail('unauthenticated', 'Token nguồn không có UID hợp lệ.');
  }
  if (!email || email.length > 320 || !email.includes('@')) {
    fail('failed-precondition', 'Tài khoản nguồn không có email hợp lệ.');
  }
  if (decoded.email_verified !== true) {
    fail('failed-precondition', 'Email nguồn chưa được xác minh.');
  }
  if (decoded.firebase?.sign_in_provider !== 'google.com') {
    fail('permission-denied', 'Chỉ tài khoản đăng nhập trực tiếp bằng Google được chuyển đổi.');
  }

  const displayName = typeof decoded.name === 'string' ? decoded.name.trim().slice(0, 160) : '';
  const rawPhotoURL = typeof decoded.picture === 'string' ? decoded.picture.trim().slice(0, 2048) : '';
  const photoURL = /^https:\/\//iu.test(rawPhotoURL) ? rawPhotoURL : '';
  return { uid, email, displayName, photoURL };
}

function assertCompatibleTargetEmail(existingEmail, sourceEmail) {
  const existing = normalizeEmail(existingEmail);
  const source = normalizeEmail(sourceEmail);
  if (existing && existing !== source) {
    fail(
      'failed-precondition',
      'UID đích đã gắn với email khác; hệ thống từ chối ghi đè để bảo vệ tài khoản.',
    );
  }
}

function targetUserProperties(identity) {
  const properties = {
    uid: identity.uid,
    email: identity.email,
    emailVerified: true,
  };
  if (identity.displayName) properties.displayName = identity.displayName;
  if (identity.photoURL) properties.photoURL = identity.photoURL;
  return properties;
}

module.exports = {
  IdentityBridgeError,
  MAX_SOURCE_ID_TOKEN_LENGTH,
  SOURCE_PROJECT_ID,
  assertCompatibleTargetEmail,
  sourceIdentityFromDecodedToken,
  targetUserProperties,
  validateSourceIdToken,
};
