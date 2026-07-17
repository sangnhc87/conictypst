'use strict';

const assert = require('node:assert/strict');
const test = require('node:test');
const { initializeApp, deleteApp } = require('firebase-admin/app');
const { getAuth } = require('firebase-admin/auth');
const { getFirestore } = require('firebase-admin/firestore');

const canRun = Boolean(
  process.env.FIRESTORE_EMULATOR_HOST
  && process.env.FIREBASE_AUTH_EMULATOR_HOST,
);

const projectId = process.env.GCLOUD_PROJECT || 'conictypst-platform';
const functionHost = process.env.FUNCTIONS_EMULATOR_HOST || '127.0.0.1:5001';
const functionBase = `http://${functionHost}/${projectId}/asia-southeast1`;
const authBase = `http://${process.env.FIREBASE_AUTH_EMULATOR_HOST || '127.0.0.1:9099'}`;
const firestoreBase = `http://${process.env.FIRESTORE_EMULATOR_HOST || '127.0.0.1:8080'}`;

async function authRequest(path, body) {
  const response = await fetch(`${authBase}/identitytoolkit.googleapis.com/v1/${path}?key=fake-api-key`, {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  });
  const json = await response.json();
  if (!response.ok) throw new Error(`Auth emulator ${path} failed: ${JSON.stringify(json)}`);
  return json;
}

async function signIn(email, password) {
  const signedIn = await authRequest('accounts:signInWithPassword', {
    email,
    password,
    returnSecureToken: true,
  });
  return signedIn.idToken;
}

async function createVerifiedUser(auth, email, displayName) {
  const password = 'Emulator-only-password-123!';
  let uid;
  try {
    const created = await authRequest('accounts:signUp', { email, password, returnSecureToken: true });
    uid = created.localId;
  } catch (error) {
    if (!String(error.message).includes('EMAIL_EXISTS')) throw error;
    uid = (await auth.getUserByEmail(email)).uid;
  }
  await auth.updateUser(uid, { emailVerified: true, displayName });
  return { uid, email, password, token: await signIn(email, password) };
}

async function callable(name, token, data = {}) {
  const response = await fetch(`${functionBase}/${name}`, {
    method: 'POST',
    headers: {
      authorization: `Bearer ${token}`,
      'content-type': 'application/json',
    },
    body: JSON.stringify({ data }),
  });
  const json = await response.json();
  if (!response.ok || json.error) {
    throw new Error(`${name} failed: ${JSON.stringify(json.error || json)}`);
  }
  return json.result;
}

async function firestoreRest(path, token, options = {}) {
  return fetch(
    `${firestoreBase}/v1/projects/${projectId}/databases/(default)/documents/${path}`,
    {
      ...options,
      headers: {
        authorization: `Bearer ${token}`,
        'content-type': 'application/json',
        ...(options.headers || {}),
      },
    },
  );
}

test('owner bootstrap and teacher lifecycle are atomic and idempotent', { skip: !canRun }, async () => {
  const app = initializeApp({ projectId }, `integration-${Date.now()}`);
  const auth = getAuth(app);
  const firestore = getFirestore(app);
  try {
    const owner = await createVerifiedUser(auth, 'nguyensangnhc@gmail.com', 'ConicTypst Owner');
    const teacher = await createVerifiedUser(auth, 'teacher.integration@example.com', 'Teacher Integration');

    const account = await callable('ctGetAccount', owner.token);
    assert.equal(account.isAdmin, true);
    assert.equal(account.admin.role, 'owner');

    const bootstrap = await callable('ctAdminBootstrap', owner.token);
    assert.deepEqual(bootstrap.products.map((product) => product.id), ['omr', 'hub', 'hdsd', 'studio', 'exam']);

    const request = await callable('ctRequestProductAccess', teacher.token, { productId: 'omr' });
    assert.equal(request.member.status, 'pending');
    assert.equal(request.member.revision, 1);

    // Browser rules permit only self reads and deny every privileged write,
    // including for an owner using the client SDK directly.
    assert.equal((await firestoreRest(`users/${teacher.uid}`, teacher.token)).status, 200);
    assert.equal((await firestoreRest(`users/${owner.uid}`, teacher.token)).status, 403);
    assert.equal((await firestoreRest(`products/omr/members/${teacher.uid}`, teacher.token)).status, 200);
    assert.equal((await firestoreRest('platformAdmins', owner.token)).status, 403);
    assert.equal((await firestoreRest(`users/${teacher.uid}?updateMask.fieldPaths=displayName`, teacher.token, {
      method: 'PATCH',
      body: JSON.stringify({ fields: { displayName: { stringValue: 'Unauthorized write' } } }),
    })).status, 403);

    const pending = await callable('ctAdminListMembers', owner.token, {
      productId: 'omr', status: 'pending', pageSize: 50,
    });
    assert.equal(pending.items.some((member) => member.uid === teacher.uid), true);

    const approveInput = {
      mutationId: 'integration-approve-0001',
      productId: 'omr',
      uid: teacher.uid,
      action: 'approve',
      expectedRevision: 1,
      payload: { months: 12 },
      reason: 'integration test',
    };
    const approved = await callable('ctAdminApplyMembershipAction', owner.token, approveInput);
    assert.equal(approved.member.status, 'active');
    assert.equal(approved.member.revision, 2);
    const originalExpiry = approved.member.accessEndsAt;

    const replayed = await callable('ctAdminApplyMembershipAction', owner.token, approveInput);
    assert.equal(replayed.replayed, true);
    assert.equal(replayed.member.revision, 2);
    assert.equal((await firestore.collection('adminMutations').doc(approveInput.mutationId).get()).exists, true);
    const audit = await firestore.collection('adminAudit')
      .where('mutationId', '==', approveInput.mutationId)
      .get();
    assert.equal(audit.size, 1);

    const limitsUpdated = await callable('ctAdminApplyMembershipAction', owner.token, {
      mutationId: 'integration-limits-0001',
      productId: 'omr',
      uid: teacher.uid,
      action: 'update_limits',
      expectedRevision: 2,
      payload: { limits: { maxClasses: 33 } },
    });
    assert.equal(limitsUpdated.member.revision, 3);
    assert.equal(limitsUpdated.member.limits.maxClasses, 33);
    assert.equal(limitsUpdated.member.accessEndsAt, originalExpiry);

    const suspended = await callable('ctAdminApplyMembershipAction', owner.token, {
      mutationId: 'integration-suspend-001',
      productId: 'omr', uid: teacher.uid, action: 'suspend', expectedRevision: 3, payload: {},
    });
    assert.equal(suspended.member.status, 'suspended');
    assert.equal(suspended.member.accessEndsAt, originalExpiry);

    const resumed = await callable('ctAdminApplyMembershipAction', owner.token, {
      mutationId: 'integration-resume-0001',
      productId: 'omr', uid: teacher.uid, action: 'resume', expectedRevision: 4, payload: {},
    });
    assert.equal(resumed.member.status, 'active');
    assert.equal(resumed.member.accessEndsAt, originalExpiry);
    assert.equal(Object.hasOwn(resumed.member, 'suspendedAt'), false);

    const scheduled = await callable('ctAdminApplyMembershipAction', owner.token, {
      mutationId: 'integration-delete-0001',
      productId: 'omr', uid: teacher.uid, action: 'schedule_delete', expectedRevision: 5,
      payload: { graceDays: 0 }, reason: 'integration cleanup',
    });
    assert.equal(scheduled.member.status, 'deletion_scheduled');
    assert.equal(scheduled.member.hasAccess, false);

    const cancelled = await callable('ctAdminApplyMembershipAction', owner.token, {
      mutationId: 'integration-cancel-0001',
      productId: 'omr', uid: teacher.uid, action: 'cancel_delete', expectedRevision: 6, payload: {},
    });
    assert.equal(cancelled.member.status, 'active');
    assert.equal(cancelled.member.accessEndsAt, originalExpiry);
    assert.equal(Object.hasOwn(cancelled.member, 'deleteAfter'), false);
    assert.equal((await firestore.collection('deletionJobs').doc(`omr__${teacher.uid}`).get()).data().status, 'cancelled');

    // A forged/stale owner claim alone is never sufficient without an active
    // platformAdmins/{uid} record.
    await auth.setCustomUserClaims(teacher.uid, { ctRole: 'owner' });
    const staleClaimToken = await signIn(teacher.email, teacher.password);
    await assert.rejects(
      callable('ctAdminBootstrap', staleClaimToken),
      /PERMISSION_DENIED|permission-denied/u,
    );
  } finally {
    await deleteApp(app);
  }
});
