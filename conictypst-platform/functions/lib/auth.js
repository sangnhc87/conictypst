'use strict';

const { getAuth } = require('firebase-admin/auth');
const { getFirestore, FieldValue } = require('firebase-admin/firestore');
const { HttpsError } = require('firebase-functions/v2/https');
const { logger } = require('firebase-functions');
const { bootstrapOwnerEmails } = require('./constants');

function requireAuth(request) {
  if (!request.auth || !request.auth.uid) {
    throw new HttpsError('unauthenticated', 'Vui lòng đăng nhập bằng tài khoản Google.');
  }
  return request.auth;
}

function normalizedAuthEmail(authContext) {
  return typeof authContext.token.email === 'string'
    ? authContext.token.email.trim().toLowerCase()
    : '';
}

function isVerifiedBootstrapOwner(authContext) {
  const email = normalizedAuthEmail(authContext);
  return Boolean(email)
    && authContext.token.email_verified === true
    && bootstrapOwnerEmails().has(email);
}

async function ensureBootstrapOwner(authContext) {
  if (!isVerifiedBootstrapOwner(authContext)) return false;

  const db = getFirestore();
  const email = normalizedAuthEmail(authContext);
  const ref = db.collection('platformAdmins').doc(authContext.uid);
  const snapshot = await ref.get();
  const current = snapshot.exists ? snapshot.data() : null;

  if (!current || current.active !== true || current.role !== 'owner' || current.email !== email) {
    await ref.set({
      uid: authContext.uid,
      email,
      role: 'owner',
      active: true,
      bootstrapSource: 'verified-email-allowlist',
      createdAt: current?.createdAt || FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
    }, { merge: true });
  }

  if (authContext.token.ctRole !== 'owner') {
    try {
      const auth = getAuth();
      const user = await auth.getUser(authContext.uid);
      await auth.setCustomUserClaims(authContext.uid, { ...user.customClaims, ctRole: 'owner' });
    } catch (error) {
      // The Firestore admin record grants this request immediately; the claim is
      // only a cached authorization hint for following ID tokens.
      logger.warn('Could not refresh owner custom claim', {
        uid: authContext.uid,
        code: error?.code || 'unknown',
      });
    }
  }
  return true;
}

async function getPlatformAdmin(authContext) {
  const snapshot = await getFirestore().collection('platformAdmins').doc(authContext.uid).get();
  const record = snapshot.exists ? snapshot.data() : null;
  const activeRecord = Boolean(record && record.active === true && ['owner', 'admin'].includes(record.role));
  // Custom claims are a UI/cache hint only. A stale claim must never bypass an
  // absent or suspended authoritative admin record.
  if (!activeRecord) return null;
  return {
    uid: authContext.uid,
    email: normalizedAuthEmail(authContext),
    displayName: String(authContext.token.name || '').slice(0, 160),
    role: record.role,
    isOwner: record.role === 'owner',
  };
}

async function requirePlatformAdmin(request, { allowBootstrap = false } = {}) {
  const authContext = requireAuth(request);
  if (allowBootstrap) await ensureBootstrapOwner(authContext);
  const admin = await getPlatformAdmin(authContext);
  if (!admin) throw new HttpsError('permission-denied', 'Tài khoản không có quyền quản trị ConicTypst.');
  return { authContext, admin };
}

module.exports = {
  ensureBootstrapOwner,
  getPlatformAdmin,
  isVerifiedBootstrapOwner,
  normalizedAuthEmail,
  requireAuth,
  requirePlatformAdmin,
};
