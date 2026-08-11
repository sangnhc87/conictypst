'use strict';

const crypto = require('crypto');
const { getAuth } = require('firebase-admin/auth');
const { FieldValue, Timestamp, getFirestore } = require('firebase-admin/firestore');
const { onRequest } = require('firebase-functions/v2/https');
const { logger } = require('firebase-functions');
const { PRODUCT_DEFINITIONS } = require('./lib/constants');
const { buildSearchTokens, normalizeProfile } = require('./lib/membership');
const {
  extendedAccessEnd,
  normalizeEmail,
  normalizeStoreGrantPayload,
} = require('./lib/storeGrant');

const REGION = 'asia-southeast1';
const STORE_SECRET = 'STUDIO_STORE_WEBHOOK_SECRET';
const SIGNATURE_WINDOW_SECONDS = 300;

function grantIdFor(orderId, productId) {
  return crypto.createHash('sha256').update(`${orderId}:${productId}`).digest('hex');
}

function pendingEmailId(email) {
  return crypto.createHash('sha256').update(normalizeEmail(email)).digest('hex');
}

function rawRequestBody(request) {
  if (Buffer.isBuffer(request.rawBody)) return request.rawBody;
  if (typeof request.body === 'string') return Buffer.from(request.body);
  return Buffer.from(JSON.stringify(request.body || {}));
}

function verifyStoreSignature(request, rawBody) {
  const timestamp = String(request.get('x-sangmath-timestamp') || '').trim();
  const signature = String(request.get('x-sangmath-signature') || '').trim().toLowerCase();
  const timestampNumber = Number(timestamp);
  if (!Number.isInteger(timestampNumber)
      || Math.abs(Math.floor(Date.now() / 1000) - timestampNumber) > SIGNATURE_WINDOW_SECONDS
      || !/^[a-f0-9]{64}$/.test(signature)) return false;

  const secret = String(process.env[STORE_SECRET] || '').trim();
  if (secret.length < 32) {
    logger.error(`${STORE_SECRET} chưa được cấu hình hoặc quá ngắn.`);
    return false;
  }
  const expected = crypto.createHmac('sha256', secret)
    .update(timestamp)
    .update('.')
    .update(rawBody)
    .digest('hex');
  return crypto.timingSafeEqual(Buffer.from(signature, 'hex'), Buffer.from(expected, 'hex'));
}

function json(response, status, body) {
  response.status(status).set('cache-control', 'no-store').json(body);
}

async function applyGrantToUser(grantId, userRecord) {
  const database = getFirestore();
  const grantRef = database.collection('storeFulfillments').doc(grantId);
  const memberRef = database.collection('products').doc('studio').collection('members').doc(userRecord.uid);
  const profile = normalizeProfile({
    uid: userRecord.uid,
    email: userRecord.email || '',
    displayName: userRecord.displayName || '',
    photoURL: userRecord.photoURL || '',
  }, userRecord.uid);

  return database.runTransaction(async (transaction) => {
    const [grantSnapshot, memberSnapshot] = await Promise.all([
      transaction.get(grantRef),
      transaction.get(memberRef),
    ]);
    if (!grantSnapshot.exists) throw new Error('Không tìm thấy yêu cầu cấp quyền.');
    const grant = grantSnapshot.data();
    if (grant.status === 'applied') return grant;
    if (normalizeEmail(grant.email) !== normalizeEmail(userRecord.email)) {
      throw new Error('Gmail đăng nhập không khớp Gmail thanh toán.');
    }

    const current = memberSnapshot.exists ? memberSnapshot.data() : null;
    const paidAt = grant.paidAt?.toDate ? grant.paidAt.toDate() : new Date(grant.paidAt);
    const currentEnd = current?.accessEndsAt?.toDate
      ? current.accessEndsAt.toDate()
      : current?.accessEndsAt || null;
    const accessEndsAt = extendedAccessEnd({
      paidAt,
      accessDays: grant.accessDays,
      currentAccessEnd: currentEnd,
    });
    const now = new Date();
    const defaultLimits = PRODUCT_DEFINITIONS.studio.defaultLimits;
    const limits = {
      ...defaultLimits,
      ...(current?.limits || {}),
      storageBytes: Math.max(
        Number(defaultLimits.storageBytes) || 0,
        Number(current?.limits?.storageBytes) || 0,
      ),
    };
    const patch = {
      ...profile,
      productId: 'studio',
      status: 'active',
      accessStartsAt: current?.accessStartsAt || paidAt,
      accessEndsAt,
      limits,
      approvedAt: current?.approvedAt || paidAt,
      approvedBy: current?.approvedBy || 'store:sepay',
      lastPaidAt: paidAt,
      lastOrderId: grant.orderId,
      lastTransactionId: grant.transactionId,
      entitlementKey: 'conic-studio-pro',
      createdAt: current?.createdAt || now,
      updatedAt: now,
      updatedBy: 'store:sepay',
      revision: (Number.isSafeInteger(current?.revision) ? current.revision : 0) + 1,
      searchTokens: buildSearchTokens(profile),
    };
    transaction.set(memberRef, patch, { merge: true });
    transaction.set(grantRef, {
      status: 'applied',
      claimedUid: userRecord.uid,
      appliedAt: now,
      accessEndsAt,
      updatedAt: now,
    }, { merge: true });
    transaction.delete(database.collection('storePendingByEmail')
      .doc(pendingEmailId(grant.email)).collection('grants').doc(grantId));
    return { ...grant, ...patch };
  });
}

async function claimPendingStudioStoreGrants(authContext) {
  const email = normalizeEmail(authContext?.token?.email || '');
  if (authContext?.token?.email_verified !== true) return 0;
  const userRecord = await getAuth().getUser(authContext.uid);
  if (normalizeEmail(userRecord.email) !== email) return 0;
  const pending = await getFirestore().collection('storePendingByEmail')
    .doc(pendingEmailId(email)).collection('grants').limit(20).get();
  let applied = 0;
  for (const snapshot of pending.docs) {
    await applyGrantToUser(snapshot.id, userRecord);
    applied += 1;
  }
  return applied;
}

const studioStoreGrant = onRequest({
  region: REGION,
  cors: false,
  maxInstances: 3,
  secrets: [STORE_SECRET],
}, async (request, response) => {
  if (request.method !== 'POST') return json(response, 405, { success: false, error: 'Method not allowed' });
  const rawBody = rawRequestBody(request);
  if (!verifyStoreSignature(request, rawBody)) {
    return json(response, 401, { success: false, error: 'Unauthorized' });
  }

  let payload;
  try {
    payload = normalizeStoreGrantPayload(JSON.parse(rawBody.toString('utf8')));
  } catch (error) {
    return json(response, 400, { success: false, error: error.message });
  }

  const database = getFirestore();
  const grantId = grantIdFor(payload.orderId, payload.productId);
  const grantRef = database.collection('storeFulfillments').doc(grantId);
  const pendingRef = database.collection('storePendingByEmail')
    .doc(pendingEmailId(payload.email)).collection('grants').doc(grantId);
  const now = new Date();
  await database.runTransaction(async (transaction) => {
    const snapshot = await transaction.get(grantRef);
    if (snapshot.exists) return;
    transaction.create(grantRef, {
      ...payload,
      paidAt: Timestamp.fromDate(payload.paidAt),
      status: 'pending',
      createdAt: now,
      updatedAt: now,
    });
    transaction.create(pendingRef, { grantId, email: payload.email, createdAt: now });
  });

  try {
    const userRecord = await getAuth().getUserByEmail(payload.email);
    const result = await applyGrantToUser(grantId, userRecord);
    return json(response, 200, {
      success: true,
      status: 'applied',
      uid: userRecord.uid,
      accessEndsAt: result.accessEndsAt instanceof Date
        ? result.accessEndsAt.toISOString()
        : result.accessEndsAt?.toDate?.().toISOString() || null,
    });
  } catch (error) {
    if (error?.code === 'auth/user-not-found') {
      return json(response, 202, { success: true, status: 'pending-login' });
    }
    logger.error('Không thể cấp quyền Conic Studio từ Store.', {
      orderId: payload.orderId,
      productId: payload.productId,
      message: error?.message || String(error),
    });
    return json(response, 500, { success: false, error: 'Chưa thể cấp quyền Conic Studio.' });
  }
});

module.exports = {
  applyGrantToUser,
  claimPendingStudioStoreGrants,
  studioStoreGrant,
};
