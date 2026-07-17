'use strict';

const { initializeApp } = require('firebase-admin/app');
const { getAuth } = require('firebase-admin/auth');
const {
  FieldValue,
  Timestamp,
  getFirestore,
} = require('firebase-admin/firestore');
const { setGlobalOptions } = require('firebase-functions/v2');
const { HttpsError, onCall } = require('firebase-functions/v2/https');
const { logger } = require('firebase-functions');

const {
  ADMIN_ACTIONS,
  AUDIT_RETENTION_DAYS,
  MEMBER_STATUSES,
  MUTATION_RETENTION_DAYS,
  PRODUCT_DEFINITIONS,
  PRODUCT_IDS,
} = require('./lib/constants');
const { approvalRequired, automaticMembership } = require('./lib/accessPolicy');
const {
  ensureBootstrapOwner,
  getPlatformAdmin,
  isVerifiedBootstrapOwner,
  normalizedAuthEmail,
  requireAuth,
  requirePlatformAdmin,
} = require('./lib/auth');
const {
  MembershipActionError,
  addUtcMonthsClamped,
  asMillis,
  buildSearchTokens,
  normalizeProfile,
  reduceMembershipAction,
} = require('./lib/membership');
const {
  asAdminAction,
  asExpectedRevision,
  asMutationId,
  asObject,
  asOptionalString,
  asPageSize,
  asProductId,
  asStatusFilter,
  asUid,
  decodePageToken,
  encodePageToken,
  normalizeSearch,
  requestHash,
} = require('./lib/validation');
const {
  IdentityBridgeError,
  SOURCE_PROJECT_ID,
  assertCompatibleTargetEmail,
  sourceIdentityFromDecodedToken,
  targetUserProperties,
  validateSourceIdToken,
} = require('./lib/identityBridge');

const targetApp = initializeApp();
const conicgvVerifierApp = initializeApp(
  { projectId: SOURCE_PROJECT_ID },
  'conicgv-token-verifier',
);
setGlobalOptions({
  region: 'asia-southeast1',
  memory: '256MiB',
  timeoutSeconds: 30,
  maxInstances: 3,
});

const db = getFirestore(targetApp);
db.settings({ ignoreUndefinedProperties: true });
const targetAuth = getAuth(targetApp);
const conicgvAuth = getAuth(conicgvVerifierApp);

const CALLABLE_OPTIONS = Object.freeze({
  cors: true,
  minInstances: 0,
});

function dateAfterDays(date, days) {
  return new Date(date.getTime() + days * 86400000);
}

function publicProduct(product) {
  return {
    id: product.id,
    name: product.name,
    description: product.description,
    active: product.active,
    accessMode: product.accessMode,
    defaultMonths: product.defaultMonths,
    priceVnd: product.priceVnd || null,
    defaultLimits: { ...product.defaultLimits },
  };
}

function plainValue(value) {
  if (value instanceof Timestamp) return value.toDate().toISOString();
  if (value instanceof Date) return value.toISOString();
  if (Array.isArray(value)) return value.map(plainValue);
  if (value && typeof value === 'object') {
    return Object.fromEntries(
      Object.entries(value)
        .filter(([, child]) => child !== undefined)
        .map(([key, child]) => [key, plainValue(child)]),
    );
  }
  return value;
}

function memberResponse(snapshotOrData, fallbackUid = '') {
  const data = typeof snapshotOrData?.data === 'function' ? snapshotOrData.data() : snapshotOrData;
  if (!data) return null;
  const now = Date.now();
  const start = asMillis(data.accessStartsAt);
  const end = asMillis(data.accessEndsAt);
  return plainValue({
    ...data,
    uid: data.uid || snapshotOrData?.id || fallbackUid,
    hasAccess: data.status === 'active'
      && (start === null || start <= now)
      && (end === null || end > now),
  });
}

function profileFromAuthContext(authContext) {
  return normalizeProfile({
    uid: authContext.uid,
    email: normalizedAuthEmail(authContext),
    displayName: authContext.token.name || '',
    photoURL: authContext.token.picture || '',
  }, authContext.uid);
}

function profileFromAuthRecord(record) {
  return normalizeProfile({
    uid: record.uid,
    email: record.email || '',
    displayName: record.displayName || '',
    photoURL: record.photoURL || '',
  }, record.uid);
}

async function ensureProductDocuments() {
  const refs = PRODUCT_IDS.map((id) => db.collection('products').doc(id));
  const snapshots = await db.getAll(...refs);
  const missing = snapshots.filter((snapshot) => !snapshot.exists);
  if (missing.length) {
    const batch = db.batch();
    for (const snapshot of missing) {
      const product = PRODUCT_DEFINITIONS[snapshot.id];
      batch.set(snapshot.ref, {
        ...publicProduct(product),
        createdAt: FieldValue.serverTimestamp(),
        updatedAt: FieldValue.serverTimestamp(),
      });
    }
    await batch.commit();
  }
  return PRODUCT_IDS.map((id) => publicProduct(PRODUCT_DEFINITIONS[id]));
}

async function upsertUserProfile(authContext) {
  const profile = profileFromAuthContext(authContext);
  const ref = db.collection('users').doc(authContext.uid);
  const snapshot = await ref.get();
  const current = snapshot.exists ? snapshot.data() : null;
  const lastSeen = asMillis(current?.lastSeenAt) || 0;
  const changed = !current
    || current.email !== profile.email
    || current.displayName !== profile.displayName
    || current.photoURL !== profile.photoURL
    || Date.now() - lastSeen >= 86400000;

  if (changed) {
    await ref.set({
      ...profile,
      createdAt: current?.createdAt || FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
      lastSeenAt: FieldValue.serverTimestamp(),
    }, { merge: true });
  }
  return { ...current, ...profile };
}

function toHttpsError(error) {
  if (error instanceof HttpsError) return error;
  if (error instanceof IdentityBridgeError) {
    return new HttpsError(error.code, error.message);
  }
  if (error instanceof MembershipActionError) {
    return new HttpsError(error.code, error.message);
  }
  logger.error('Unhandled ConicTypst control-plane error', {
    name: error?.name || 'Error',
    code: error?.code || 'unknown',
    message: error?.message || 'Unknown error',
  });
  return new HttpsError('internal', 'Hệ thống chưa thể xử lý yêu cầu. Vui lòng thử lại.');
}

async function getOrCreateBridgeTargetUser(identity) {
  try {
    const existing = await targetAuth.getUser(identity.uid);
    assertCompatibleTargetEmail(existing.email, identity.email);
    const properties = targetUserProperties(identity);
    delete properties.uid;
    return targetAuth.updateUser(identity.uid, properties);
  } catch (error) {
    if (error instanceof IdentityBridgeError) throw error;
    if (error?.code !== 'auth/user-not-found') throw error;
  }

  try {
    return await targetAuth.createUser(targetUserProperties(identity));
  } catch (error) {
    // Two simultaneous exchanges for the same UID may race. Re-read and accept
    // only when the winner created the exact same identity.
    if (error?.code === 'auth/uid-already-exists') {
      const existing = await targetAuth.getUser(identity.uid);
      assertCompatibleTargetEmail(existing.email, identity.email);
      return existing;
    }
    if (error?.code === 'auth/email-already-exists') {
      throw new IdentityBridgeError(
        'failed-precondition',
        'Email đã thuộc một UID khác trong hệ ConicTypst; không thể tự động gộp tài khoản.',
      );
    }
    throw error;
  }
}

exports.ctExchangeConicgvToken = onCall({
  ...CALLABLE_OPTIONS,
  timeoutSeconds: 20,
  maxInstances: 3,
}, async (request) => {
  try {
    const data = asObject(request.data || {});
    const sourceIdToken = validateSourceIdToken(data.idToken);
    let decoded;
    try {
      // The secondary Admin app enforces the conicgv audience and issuer. The
      // revocation check also rejects disabled users and tokens issued before
      // tokensValidAfterTime.
      decoded = await conicgvAuth.verifyIdToken(sourceIdToken, true);
    } catch (error) {
      logger.warn('Rejected ConicGV identity exchange', {
        code: typeof error?.code === 'string' ? error.code : 'invalid-source-token',
      });
      throw new HttpsError('unauthenticated', 'Phiên đăng nhập ConicGV không hợp lệ hoặc đã bị thu hồi.');
    }

    const identity = sourceIdentityFromDecodedToken(decoded);
    await getOrCreateBridgeTargetUser(identity);
    // Never copy source custom claims. Platform roles are resolved exclusively
    // from this project's platformAdmins collection.
    const customToken = await targetAuth.createCustomToken(identity.uid);
    return { customToken };
  } catch (error) {
    throw toHttpsError(error);
  }
});

exports.ctGetAccount = onCall(CALLABLE_OPTIONS, async (request) => {
  try {
    const authContext = requireAuth(request);
    if (!normalizedAuthEmail(authContext) || authContext.token.email_verified !== true) {
      throw new HttpsError('failed-precondition', 'Tài khoản Google phải có email đã xác minh.');
    }
    const ownerByAllowlist = isVerifiedBootstrapOwner(authContext);
    if (ownerByAllowlist) await ensureBootstrapOwner(authContext);

    const [profile, admin, ...membershipSnapshots] = await Promise.all([
      upsertUserProfile(authContext),
      getPlatformAdmin(authContext),
      ...PRODUCT_IDS.map((id) => db.collection('products').doc(id).collection('members').doc(authContext.uid).get()),
    ]);

    const memberships = PRODUCT_IDS.map((id, index) => {
      const product = PRODUCT_DEFINITIONS[id];
      const automatic = automaticMembership(product, profile);
      if (automatic) return automatic;
      const snapshot = membershipSnapshots[index];
      return snapshot.exists ? memberResponse(snapshot) : null;
    }).filter(Boolean);

    return {
      profile: plainValue(profile),
      isAdmin: Boolean(admin),
      admin,
      memberships,
      products: PRODUCT_IDS.map((id) => publicProduct(PRODUCT_DEFINITIONS[id])),
    };
  } catch (error) {
    throw toHttpsError(error);
  }
});

exports.ctRequestProductAccess = onCall(CALLABLE_OPTIONS, async (request) => {
  try {
    const authContext = requireAuth(request);
    if (!normalizedAuthEmail(authContext) || authContext.token.email_verified !== true) {
      throw new HttpsError('failed-precondition', 'Tài khoản Google phải có email đã xác minh.');
    }
    const data = asObject(request.data || {});
    const productId = asProductId(data.productId);
    const note = asOptionalString(data.note, 'note', 500);
    const isOwner = isVerifiedBootstrapOwner(authContext);
    if (isOwner) await ensureBootstrapOwner(authContext);
    const profile = profileFromAuthContext(authContext);
    await upsertUserProfile(authContext);

    const product = PRODUCT_DEFINITIONS[productId];
    const automatic = automaticMembership(product, profile);
    if (automatic) {
      return { productId, member: automatic, approvalRequired: false };
    }

    const memberRef = db.collection('products').doc(productId).collection('members').doc(authContext.uid);
    const now = new Date();
    const member = await db.runTransaction(async (transaction) => {
      const snapshot = await transaction.get(memberRef);
      const current = snapshot.exists ? snapshot.data() : null;

      if (current && ['active', 'suspended', 'deletion_scheduled'].includes(current.status)) {
        return current;
      }

      let patch;
      let responseMember;
      if (isOwner) {
        const reduced = reduceMembershipAction({
          action: 'approve',
          current,
          payload: { months: 120 },
          actorUid: authContext.uid,
          now,
          product,
          targetProfile: profile,
        });
        patch = { ...reduced.patch, ownerAutoApproved: true };
        for (const field of reduced.deleteFields) patch[field] = FieldValue.delete();
        responseMember = { ...current, ...reduced.patch, ownerAutoApproved: true };
      } else {
        const unchangedPending = current?.status === 'pending'
          && current.email === profile.email
          && current.displayName === profile.displayName
          && current.photoURL === profile.photoURL
          && String(current.requestNote || '') === note;
        if (unchangedPending) return current;
        patch = {
          ...profile,
          productId,
          status: 'pending',
          limits: current?.limits || { ...product.defaultLimits },
          requestedAt: current?.requestedAt || now,
          requestUpdatedAt: now,
          requestNote: note,
          createdAt: current?.createdAt || now,
          updatedAt: now,
          revision: (Number.isSafeInteger(current?.revision) ? current.revision : 0) + 1,
          searchTokens: buildSearchTokens(profile),
        };
        responseMember = { ...current, ...patch };
      }
      transaction.set(memberRef, patch, { merge: true });
      return responseMember;
    });

    return { productId, member: memberResponse(member, authContext.uid) };
  } catch (error) {
    throw toHttpsError(error);
  }
});

exports.ctAdminBootstrap = onCall(CALLABLE_OPTIONS, async (request) => {
  try {
    const { admin } = await requirePlatformAdmin(request, { allowBootstrap: true });
    const products = await ensureProductDocuments();
    return {
      admin,
      products,
      statuses: MEMBER_STATUSES,
      actions: ADMIN_ACTIONS,
      defaults: {
        pageSize: 50,
        deletionGraceDays: 7,
        retentionDays: AUDIT_RETENTION_DAYS,
      },
    };
  } catch (error) {
    throw toHttpsError(error);
  }
});

exports.ctAdminListMembers = onCall(CALLABLE_OPTIONS, async (request) => {
  try {
    await requirePlatformAdmin(request, { allowBootstrap: true });
    const data = asObject(request.data || {});
    const productId = asProductId(data.productId);
    const status = asStatusFilter(data.status);
    const search = normalizeSearch(data.search);
    const pageSize = asPageSize(data.pageSize);
    const decodedToken = decodePageToken(data.pageToken);

    if (!approvalRequired(PRODUCT_DEFINITIONS[productId])) {
      return { productId, status, search, items: [], nextPageToken: null, approvalRequired: false };
    }

    if (decodedToken && (
      decodedToken.productId !== productId
      || decodedToken.status !== status
      || decodedToken.search !== search
    )) {
      throw new HttpsError('invalid-argument', 'pageToken không thuộc bộ lọc hiện tại.');
    }

    const members = db.collection('products').doc(productId).collection('members');
    let query = members;
    if (status !== 'all') query = query.where('status', '==', status);
    if (search) query = query.where('searchTokens', 'array-contains', search);
    query = query.orderBy('updatedAt', 'desc');

    if (decodedToken) {
      const cursor = await members.doc(asUid(decodedToken.uid)).get();
      if (!cursor.exists) {
        throw new HttpsError('invalid-argument', 'Trang trước đã thay đổi; vui lòng tải lại danh sách.');
      }
      const cursorData = cursor.data();
      if ((status !== 'all' && cursorData.status !== status)
        || (search && !Array.isArray(cursorData.searchTokens))
        || (search && !cursorData.searchTokens.includes(search))) {
        throw new HttpsError('invalid-argument', 'pageToken không còn phù hợp với bộ lọc.');
      }
      query = query.startAfter(cursor);
    }

    const snapshot = await query.limit(pageSize + 1).get();
    const hasNext = snapshot.docs.length > pageSize;
    const visibleDocs = snapshot.docs.slice(0, pageSize);
    const last = visibleDocs[visibleDocs.length - 1];
    return {
      productId,
      status,
      search,
      items: visibleDocs.map((doc) => memberResponse(doc)),
      nextPageToken: hasNext && last
        ? encodePageToken({ v: 1, productId, status, search, uid: last.id })
        : null,
    };
  } catch (error) {
    throw toHttpsError(error);
  }
});

exports.ctAdminListAudit = onCall(CALLABLE_OPTIONS, async (request) => {
  try {
    await requirePlatformAdmin(request, { allowBootstrap: true });
    const snapshot = await db.collection('adminAudit')
      .orderBy('createdAt', 'desc')
      .limit(50)
      .get();
    return {
      items: snapshot.docs.map((doc) => plainValue({ id: doc.id, ...doc.data() })),
    };
  } catch (error) {
    throw toHttpsError(error);
  }
});

exports.ctAdminApplyMembershipAction = onCall(CALLABLE_OPTIONS, async (request) => {
  try {
    const { authContext, admin } = await requirePlatformAdmin(request, { allowBootstrap: true });
    const data = asObject(request.data || {});
    const mutationId = asMutationId(data.mutationId);
    const productId = asProductId(data.productId);
    const uid = asUid(data.uid);
    const action = asAdminAction(data.action);
    const expectedRevision = asExpectedRevision(data.expectedRevision);
    const payload = data.payload === undefined ? {} : asObject(data.payload, 'payload');
    const reason = asOptionalString(data.reason, 'reason', 500);
    if (!approvalRequired(PRODUCT_DEFINITIONS[productId])) {
      throw new HttpsError('failed-precondition', 'Sản phẩm này không dùng quy trình quản trị phê duyệt.');
    }
    const canonicalRequest = { mutationId, productId, uid, action, expectedRevision, payload, reason };
    const hash = requestHash(canonicalRequest);

    const now = new Date();
    const mutationRef = db.collection('adminMutations').doc(mutationId);
    const memberRef = db.collection('products').doc(productId).collection('members').doc(uid);
    const auditRef = db.collection('adminAudit').doc();
    const jobRef = db.collection('deletionJobs').doc(`${productId}__${uid}`);

    // Fast idempotent replay must not depend on mutable external state such as
    // the target Auth user still existing after the first successful request.
    const existingMutation = await mutationRef.get();
    if (existingMutation.exists) {
      const previous = existingMutation.data();
      if (previous.actorUid !== authContext.uid || previous.requestHash !== hash) {
        throw new HttpsError('already-exists', 'mutationId đã được dùng cho một yêu cầu khác.');
      }
      return { ...previous.result, replayed: true };
    }

    let targetProfile = null;
    if (action === 'approve') {
      try {
        const targetUser = await getAuth().getUser(uid);
        if (!targetUser.email || targetUser.emailVerified !== true) {
          throw new HttpsError('failed-precondition', 'Email của giáo viên chưa được xác minh.');
        }
        targetProfile = profileFromAuthRecord(targetUser);
      } catch (error) {
        if (error instanceof HttpsError) throw error;
        if (error?.code === 'auth/user-not-found') {
          throw new HttpsError('not-found', 'Không tìm thấy tài khoản đăng nhập của giáo viên.');
        }
        throw error;
      }
    }

    const result = await db.runTransaction(async (transaction) => {
      const reads = [
        transaction.get(mutationRef),
        transaction.get(memberRef),
        transaction.get(jobRef),
      ];
      const userRef = db.collection('users').doc(uid);
      if (action === 'approve') reads.push(transaction.get(userRef));
      const [mutationSnapshot, memberSnapshot, jobSnapshot, userSnapshot] = await Promise.all(reads);

      if (mutationSnapshot.exists) {
        const previous = mutationSnapshot.data();
        if (previous.actorUid !== authContext.uid || previous.requestHash !== hash) {
          throw new HttpsError('already-exists', 'mutationId đã được dùng cho một yêu cầu khác.');
        }
        return { ...previous.result, replayed: true };
      }

      const current = memberSnapshot.exists ? memberSnapshot.data() : null;
      if (action === 'cancel_delete' && jobSnapshot.exists && jobSnapshot.data().status === 'processing') {
        throw new HttpsError(
          'failed-precondition',
          'Quá trình xóa dữ liệu đã bắt đầu và không thể hủy để tránh khôi phục một phần dữ liệu.',
        );
      }
      const currentRevision = Number.isSafeInteger(current?.revision) ? current.revision : 0;
      if (currentRevision !== expectedRevision) {
        throw new HttpsError(
          'aborted',
          `Dữ liệu đã thay đổi (revision ${currentRevision}); vui lòng tải lại trước khi lưu.`,
          { currentRevision },
        );
      }

      const reduced = reduceMembershipAction({
        action,
        current,
        payload,
        actorUid: authContext.uid,
        now,
        product: PRODUCT_DEFINITIONS[productId],
        targetProfile,
      });
      const patch = { ...reduced.patch };
      if (reason) patch.lastAdminReason = reason;
      if (action === 'schedule_delete' && reason) patch.deletionReason = reason;
      for (const field of reduced.deleteFields) patch[field] = FieldValue.delete();
      transaction.set(memberRef, patch, { merge: true });

      if (action === 'approve' && targetProfile) {
        transaction.set(userRef, {
          ...targetProfile,
          updatedAt: now,
          createdAt: (userSnapshot?.exists && userSnapshot.data().createdAt) || now,
        }, { merge: true });
      }

      if (reduced.job?.operation === 'schedule') {
        transaction.set(jobRef, {
          productId,
          uid,
          status: 'queued',
          previousStatus: reduced.job.previousStatus,
          deleteAfter: reduced.job.deleteAfter,
          requestedAt: now,
          requestedBy: authContext.uid,
          reason,
          updatedAt: now,
          cancelledAt: FieldValue.delete(),
          cancelledBy: FieldValue.delete(),
          expireAt: addUtcMonthsClamped(now, 12),
        }, { merge: true });
      } else if (reduced.job?.operation === 'cancel') {
        transaction.set(jobRef, {
          productId,
          uid,
          status: 'cancelled',
          cancelledAt: now,
          cancelledBy: authContext.uid,
          updatedAt: now,
          expireAt: dateAfterDays(now, MUTATION_RETENTION_DAYS),
        }, { merge: true });
      }

      const responseMemberData = { ...current, ...reduced.patch };
      if (reason) responseMemberData.lastAdminReason = reason;
      if (action === 'schedule_delete' && reason) responseMemberData.deletionReason = reason;
      for (const field of reduced.deleteFields) delete responseMemberData[field];
      const resultMember = memberResponse(responseMemberData, uid);
      const response = { mutationId, productId, uid, action, member: resultMember, replayed: false };
      const auditBefore = current ? plainValue({
        status: current.status,
        revision: currentRevision,
        accessEndsAt: current.accessEndsAt || null,
        limits: current.limits || {},
      }) : null;
      const auditAfter = plainValue({
        status: resultMember.status,
        revision: resultMember.revision,
        accessEndsAt: resultMember.accessEndsAt || null,
        limits: resultMember.limits || {},
      });
      transaction.set(auditRef, {
        mutationId,
        productId,
        targetUid: uid,
        action,
        expectedRevision,
        resultingRevision: reduced.patch.revision,
        actorUid: authContext.uid,
        actorEmail: admin.email,
        actorRole: admin.role,
        reason,
        before: auditBefore,
        after: auditAfter,
        createdAt: now,
        expireAt: addUtcMonthsClamped(now, 12),
      });
      transaction.create(mutationRef, {
        mutationId,
        actorUid: authContext.uid,
        requestHash: hash,
        result: response,
        createdAt: now,
        expireAt: dateAfterDays(now, MUTATION_RETENTION_DAYS),
      });
      return response;
    });

    return result;
  } catch (error) {
    throw toHttpsError(error);
  }
});

// Keep the OMR data plane in the same isolated Firebase project while exposing
// its stable public callable names to the existing web client.
Object.assign(exports, require('./omr-sync'));

// Conic Exam shares the existing identity/product control plane. The data plane
// remains callable-only; Firestore rules deny browser access to every exam
// collection, including public packages and private answer keys.
Object.assign(exports, require('./exam'));
