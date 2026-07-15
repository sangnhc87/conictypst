'use strict';

const crypto = require('crypto');
const { getFirestore, Timestamp, FieldValue } = require('firebase-admin/firestore');
const { onCall, HttpsError } = require('firebase-functions/v2/https');
const { onSchedule } = require('firebase-functions/v2/scheduler');
const { logger } = require('firebase-functions');
const { DEFAULT_OWNER_EMAIL, PRODUCT_DEFINITIONS } = require('./lib/constants');
const { buildSearchTokens, normalizeProfile } = require('./lib/membership');

const REGION = 'asia-southeast1';
const OMR_PRODUCT_ID = 'omr';
const RETENTION_MONTHS = 12;
const BLOB_RETENTION_MONTHS = 6;
const OWNER_ACCESS_MONTHS = 120;
const BLOB_VERIFY_LEASE_MS = 2 * 60 * 1000;
const DELETION_LEASE_MS = 10 * 60 * 1000;
const DELETION_STORAGE_DRAIN_MS = 20 * 60 * 1000;
const GLOBAL_R2_LIMIT_BYTES = 5 * 1024 ** 3;
const CLEANUP_RESULTS_PER_RUN = 2500;
const CLEANUP_BLOBS_PER_RUN = 1000;
const CLEANUP_LIGHTWEIGHT_PER_RUN = 2500;
const CLEANUP_CONCURRENCY = 20;
const DEFAULT_LIMITS = Object.freeze({
    maxClasses: PRODUCT_DEFINITIONS.omr.defaultLimits.maxClasses,
    maxStudents: PRODUCT_DEFINITIONS.omr.defaultLimits.maxStudents,
    maxResults: PRODUCT_DEFINITIONS.omr.defaultLimits.maxResults,
    r2QuotaBytes: PRODUCT_DEFINITIONS.omr.defaultLimits.storageBytes,
});
const BLOB_SECRETS = ['OMR_STORAGE_HMAC_SECRET'];
const STORAGE_WORKER_URL = 'https://sang-math-omr-storage.nguyensangnhc.workers.dev';
const ALLOWED_UPLOADS = Object.freeze({
    annotated: { types: ['image/jpeg', 'image/png'], maxBytes: 8 * 1024 ** 2 },
    source: { types: ['image/jpeg', 'image/png'], maxBytes: 12 * 1024 ** 2 },
    report: { types: ['application/pdf'], maxBytes: 12 * 1024 ** 2 },
});
const RESULT_FIELDS = new Set([
    'id', 'sbd', 'made', 'score', 'correct', 'total',
    'mcqCorrect', 'mcqTotal', 'mcqScore',
    'tfCorrect', 'tfTotal', 'tfScore',
    'tlnCorrect', 'tlnTotal', 'tlnScore',
    'filename', 'timestamp', 'templateId', 'session', 'sessionName',
    'studentName', 'studentClass', 'answers', 'warnings', 'questionDetails',
    'clientUpdatedAt',
]);

function db() {
    return getFirestore();
}

function productRef(productId = OMR_PRODUCT_ID, database = db()) {
    return database.collection('products').doc(productId);
}

function memberRef(uid, database = db(), productId = OMR_PRODUCT_ID) {
    return productRef(productId, database).collection('members').doc(uid);
}

function storageBudgetRef(database = db()) {
    return database.collection('systemBudgets').doc(OMR_PRODUCT_ID);
}

function normalizeStorageBudget(data = {}) {
    return {
        r2Bytes: Math.max(0, Number(data.r2Bytes) || 0),
        pendingR2Bytes: Math.max(0, Number(data.pendingR2Bytes) || 0),
        limitBytes: GLOBAL_R2_LIMIT_BYTES,
    };
}

function requireAuth(request) {
    if (!request.auth?.uid) {
        throw new HttpsError('unauthenticated', 'Bạn cần đăng nhập Google để dùng đồng bộ OMR.');
    }
    return request.auth;
}

function numberInRange(value, min, max, fallback) {
    const number = Number(value);
    return Number.isFinite(number) ? Math.min(max, Math.max(min, number)) : fallback;
}

function integerInRange(value, min, max, fallback) {
    return Math.round(numberInRange(value, min, max, fallback));
}

function timestampMillis(value) {
    if (!value) return 0;
    if (value instanceof Date) return value.getTime();
    if (typeof value.toMillis === 'function') return value.toMillis();
    if (typeof value === 'number') return value;
    if (typeof value === 'string') return Date.parse(value) || 0;
    if (typeof value._seconds === 'number') return value._seconds * 1000;
    if (typeof value.seconds === 'number') return value.seconds * 1000;
    return 0;
}

function timestampIso(value) {
    const millis = timestampMillis(value);
    return millis ? new Date(millis).toISOString() : null;
}

function addCalendarMonths(source, months) {
    const date = new Date(source instanceof Date ? source.getTime() : source);
    const day = date.getUTCDate();
    date.setUTCDate(1);
    date.setUTCMonth(date.getUTCMonth() + months);
    const lastDay = new Date(Date.UTC(date.getUTCFullYear(), date.getUTCMonth() + 1, 0)).getUTCDate();
    date.setUTCDate(Math.min(day, lastDay));
    return date;
}

function blobExpiryMillis(blob) {
    const explicitExpiry = timestampMillis(blob?.expiresAt) || Number.POSITIVE_INFINITY;
    const createdAt = timestampMillis(blob?.createdAt);
    const retentionExpiry = createdAt
        ? addCalendarMonths(new Date(createdAt), BLOB_RETENTION_MONTHS).getTime()
        : explicitExpiry;
    return Math.min(explicitExpiry, retentionExpiry);
}

function academicYearId(date = new Date()) {
    const year = date.getUTCFullYear();
    return date.getUTCMonth() >= 6 ? `${year}-${year + 1}` : `${year - 1}-${year}`;
}

function validId(value, label = 'mã') {
    const id = String(value || '').trim();
    if (!/^[A-Za-z0-9_-]{1,128}$/.test(id)) {
        throw new HttpsError('invalid-argument', `${label} không hợp lệ.`);
    }
    return id;
}

function cleanJson(value, depth = 0) {
    if (depth > 12) throw new HttpsError('invalid-argument', 'Dữ liệu lồng nhau quá sâu.');
    if (value === null || typeof value === 'boolean') return value;
    if (typeof value === 'number') return Number.isFinite(value) ? value : null;
    if (typeof value === 'string') return value.slice(0, 20000);
    if (Array.isArray(value)) return value.slice(0, 5000).map((item) => cleanJson(item, depth + 1));
    if (value && typeof value === 'object' && Object.getPrototypeOf(value) === Object.prototype) {
        const output = {};
        Object.entries(value).slice(0, 500).forEach(([key, item]) => {
            const safeKey = String(key).slice(0, 200);
            if (/^__.*__$/.test(safeKey) || ['__proto__', 'prototype', 'constructor'].includes(safeKey)) return;
            if (item !== undefined && typeof item !== 'function') output[safeKey] = cleanJson(item, depth + 1);
        });
        return output;
    }
    return null;
}

function jsonBytes(value) {
    return Buffer.byteLength(JSON.stringify(value), 'utf8');
}

function normalizeLimits(data = {}) {
    const cloudImageEnabled = data.cloudImageEnabled === true;
    const configuredQuota = integerInRange(
        data.storageBytes ?? data.r2QuotaBytes ?? data.r2Bytes ?? data.maxStorageBytes,
        0,
        10 * 1024 ** 3,
        DEFAULT_LIMITS.r2QuotaBytes,
    );
    return {
        maxClasses: integerInRange(data.maxClasses, 1, 100, DEFAULT_LIMITS.maxClasses),
        maxStudents: integerInRange(data.maxStudents, 1, 10000, DEFAULT_LIMITS.maxStudents),
        maxResults: Math.max(
            DEFAULT_LIMITS.maxResults,
            integerInRange(data.maxResults, 1, 100000, DEFAULT_LIMITS.maxResults),
        ),
        cloudImageEnabled,
        r2QuotaBytes: cloudImageEnabled ? configuredQuota : 0,
    };
}

function normalizeUsage(tenant, now = new Date()) {
    const source = tenant.usage || {};
    const sameYear = tenant.usageYear === academicYearId(now);
    return {
        classCount: sameYear ? Math.max(0, Number(source.classCount || source.classes) || 0) : 0,
        studentCount: sameYear ? Math.max(0, Number(source.studentCount || source.students) || 0) : 0,
        resultCount: sameYear ? Math.max(0, Number(source.resultCount) || 0) : 0,
        r2Bytes: Math.max(0, Number(source.r2Bytes || source.storageBytes) || 0),
        pendingR2Bytes: Math.max(0, Number(source.pendingR2Bytes) || 0),
    };
}

function assertTenantActive(tenant, now = Date.now()) {
    if (!tenant || tenant.status !== 'active') {
        throw new HttpsError('permission-denied', 'Tài khoản OMR chưa được duyệt hoặc đang tạm dừng.');
    }
    if (timestampMillis(tenant.accessEndsAt || tenant.accessExpiresAt) <= now) {
        throw new HttpsError('permission-denied', 'Tài khoản OMR đã hết hạn sử dụng.');
    }
}

function tenantView(uid, tenant) {
    const limits = normalizeLimits(tenant.limits || {});
    const usage = normalizeUsage(tenant);
    const accessEndsAt = timestampIso(tenant.accessEndsAt || tenant.accessExpiresAt);
    return {
        uid,
        email: tenant.email || '',
        displayName: tenant.displayName || tenant.name || '',
        status: tenant.status || 'pending',
        accessMonths: tenant.accessMonths || null,
        accessStartsAt: timestampIso(tenant.accessStartsAt),
        accessEndsAt,
        accessExpiresAt: accessEndsAt,
        retentionMonths: RETENTION_MONTHS,
        imageRetentionMonths: BLOB_RETENTION_MONTHS,
        cloudImageEnabled: limits.cloudImageEnabled,
        limits: {
            ...limits,
            storageBytes: limits.r2QuotaBytes,
            r2Bytes: limits.r2QuotaBytes,
            maxStorageBytes: limits.r2QuotaBytes,
            r2QuotaGiB: limits.r2QuotaBytes / 1024 ** 3,
        },
        usage,
        usageYear: tenant.usageYear || academicYearId(),
        syncVersion: Number(tenant.syncVersion) || 0,
        requestStatus: tenant.requestStatus || null,
        requestedAt: timestampIso(tenant.requestedAt),
        requestUpdatedAt: timestampIso(tenant.requestUpdatedAt),
        createdAt: timestampIso(tenant.createdAt),
        updatedAt: timestampIso(tenant.omrUpdatedAt || tenant.updatedAt),
    };
}

function normalizeResult(input) {
    if (!input || typeof input !== 'object' || Array.isArray(input)) {
        throw new HttpsError('invalid-argument', 'Kết quả OMR không hợp lệ.');
    }
    if (jsonBytes(input) > 128 * 1024) {
        throw new HttpsError('invalid-argument', 'Metadata một kết quả vượt 128 KiB. Ảnh phải tải riêng lên R2.');
    }
    const output = {};
    for (const [key, value] of Object.entries(input)) {
        if (RESULT_FIELDS.has(key) && value !== undefined) output[key] = cleanJson(value);
    }
    output.id = validId(input.id, 'Mã kết quả');
    output.sbd = String(output.sbd || '').slice(0, 40);
    output.made = String(output.made || '').slice(0, 40);
    output.filename = String(output.filename || '').slice(0, 220);
    output.templateId = String(output.templateId || '').slice(0, 80);
    output.session = String(output.session || '').slice(0, 120);
    output.sessionName = String(output.sessionName || '').slice(0, 120);
    output.studentName = String(output.studentName || '').slice(0, 160);
    output.studentClass = String(output.studentClass || '').slice(0, 80);
    if (jsonBytes(output) > 96 * 1024) throw new HttpsError('invalid-argument', 'Metadata kết quả vượt 96 KiB.');
    return output;
}

function normalizeWorkspace(input, limits) {
    if (!input || typeof input !== 'object' || Array.isArray(input)) {
        throw new HttpsError('invalid-argument', 'Workspace OMR không hợp lệ.');
    }
    if (jsonBytes(input) > 700 * 1024) throw new HttpsError('invalid-argument', 'Workspace vượt 700 KiB.');
    const students = Array.isArray(input.students) ? input.students.map((student) => ({
        sbd: String(student?.sbd || '').trim().slice(0, 40),
        name: String(student?.name || '').trim().slice(0, 160),
        cls: String(student?.cls || '').trim().slice(0, 80),
    })).filter((student) => student.sbd && student.name) : [];
    if (students.length > limits.maxStudents) {
        throw new HttpsError('resource-exhausted', `Danh sách vượt hạn mức ${limits.maxStudents} học sinh.`);
    }
    const classes = new Set(students.map((student) => student.cls).filter(Boolean));
    if (classes.size > limits.maxClasses) {
        throw new HttpsError('resource-exhausted', `Danh sách vượt hạn mức ${limits.maxClasses} lớp.`);
    }
    const sessions = [...new Set((Array.isArray(input.sessions) ? input.sessions : [])
        .map((item) => String(item || '').trim().slice(0, 120)).filter(Boolean))].slice(0, 100);
    const output = {
        students,
        sessions,
        answerKeys: cleanJson(input.answerKeys || {}),
        scoring: input.scoring ? cleanJson(input.scoring) : null,
        templateId: String(input.templateId || '').slice(0, 80),
    };
    if (jsonBytes(output) > 700 * 1024) throw new HttpsError('invalid-argument', 'Workspace sau chuẩn hóa vẫn quá lớn.');
    return { output, classCount: classes.size, studentCount: students.length };
}

function mutationRef(tenantRef, mutationId) {
    const id = validId(mutationId || crypto.randomUUID(), 'Mã thao tác');
    return tenantRef.collection('omrMutations').doc(id);
}

function storageSecret() {
    const secret = String(process.env.OMR_STORAGE_HMAC_SECRET || '').trim();
    if (secret.length < 32) {
        throw new HttpsError('failed-precondition', 'Cổng lưu trữ OMR chưa được cấu hình an toàn.');
    }
    return secret;
}

function storageTicket(operation, payload, ttlSeconds = 300) {
    const encoded = Buffer.from(JSON.stringify({
        v: 1,
        op: operation,
        ...payload,
        exp: Math.floor(Date.now() / 1000) + Math.min(600, Math.max(1, ttlSeconds)),
    })).toString('base64url');
    const signature = crypto.createHmac('sha256', storageSecret()).update(encoded).digest('base64url');
    return `${encoded}.${signature}`;
}

async function storageWorkerJson(operation, ticket, method) {
    const result = await fetch(`${STORAGE_WORKER_URL}/${operation}`, {
        method,
        headers: { Authorization: `Bearer ${ticket}` },
    });
    const body = await result.json().catch(() => ({}));
    if (!result.ok) throw new Error(`Storage Worker ${operation} thất bại (${result.status}): ${body.error || 'unknown'}`);
    return body;
}

function uploadExtension(contentType) {
    return ({ 'image/jpeg': 'jpg', 'image/png': 'png', 'application/pdf': 'pdf' })[contentType] || 'bin';
}

async function isPlatformAdmin(auth, database = db()) {
    const verifiedBootstrapOwner = isVerifiedOwner(auth);
    if (verifiedBootstrapOwner) return true;
    // Avoid one Firestore read on every background sync for ordinary teachers.
    // The claim is only a lookup hint; the active admin document remains the
    // authoritative decision, so a stale claim cannot grant access.
    if (!['owner', 'admin'].includes(auth.token?.ctRole)) return false;
    const snapshot = await database.collection('platformAdmins').doc(auth.uid).get();
    if (!snapshot.exists) return false;
    const record = snapshot.data();
    return record.active === true && ['owner', 'admin'].includes(record.role);
}

function isVerifiedOwner(auth) {
    const email = String(auth.token?.email || '').trim().toLowerCase();
    return auth.token?.email_verified === true && email === DEFAULT_OWNER_EMAIL;
}

exports.omrRequestAccess = onCall({ region: REGION, cors: true, maxInstances: 3 }, async (request) => {
    const auth = requireAuth(request);
    const verifiedOwner = isVerifiedOwner(auth);
    const database = db();
    const tenantRef = memberRef(auth.uid, database);
    const profile = normalizeProfile({
        uid: auth.uid,
        email: auth.token?.email || '',
        displayName: auth.token?.name || request.data?.displayName || '',
        photoURL: auth.token?.picture || '',
    }, auth.uid);
    const source = String(request.data?.source || '').trim().slice(0, 160);
    return database.runTransaction(async (transaction) => {
        const tenantDoc = await transaction.get(tenantRef);
        const current = tenantDoc.exists ? tenantDoc.data() : null;
        if (current) {
            try {
                assertTenantActive(current);
                return { status: 'active', tenant: tenantView(auth.uid, current) };
            } catch (_) {
                // Hết hạn hoặc tạm dừng vẫn được ghi nhận để admin xử lý.
            }
            if (current.status === 'deletion_scheduled') {
                return { status: 'deletion_scheduled', tenant: tenantView(auth.uid, current) };
            }
        }
        const now = Timestamp.now();
        const expiredActive = current?.status === 'active'
            && timestampMillis(current.accessEndsAt || current.accessExpiresAt) <= now.toMillis();
        if (verifiedOwner && (!current || current.status === 'pending' || expiredActive)) {
            const revision = Number.isSafeInteger(current?.revision) ? current.revision + 1 : 1;
            const activeTenant = {
                ...current,
                ...profile,
                productId: OMR_PRODUCT_ID,
                status: 'active',
                accessStartsAt: current?.accessStartsAt || now,
                accessEndsAt: Timestamp.fromDate(addCalendarMonths(now.toDate(), OWNER_ACCESS_MONTHS)),
                limits: current?.limits || { ...PRODUCT_DEFINITIONS.omr.defaultLimits },
                usage: current?.usage || normalizeUsage({}),
                usageYear: current?.usageYear || academicYearId(now.toDate()),
                syncVersion: Number(current?.syncVersion) || 0,
                approvedAt: now,
                approvedBy: auth.uid,
                ownerAutoApproved: true,
                createdAt: current?.createdAt || now,
                updatedAt: now,
                omrUpdatedAt: now,
                revision,
                searchTokens: buildSearchTokens(profile),
            };
            transaction.set(tenantRef, {
                ...activeTenant,
                requestStatus: FieldValue.delete(),
                requestedAt: FieldValue.delete(),
                requestUpdatedAt: FieldValue.delete(),
                requestSource: FieldValue.delete(),
                statusBeforeRequest: FieldValue.delete(),
            }, { merge: true });
            return { status: 'active', tenant: tenantView(auth.uid, activeTenant), ownerAutoApproved: true };
        }
        const unchanged = current
            && current.requestStatus === 'pending'
            && !expiredActive
            && current.email === profile.email
            && current.displayName === profile.displayName
            && current.photoURL === profile.photoURL
            && String(current.requestSource || '') === source;
        if (!unchanged) {
            const revision = Number.isSafeInteger(current?.revision) ? current.revision + 1 : 1;
            transaction.set(tenantRef, {
                ...profile,
                productId: OMR_PRODUCT_ID,
                status: expiredActive ? 'pending' : (current?.status || 'pending'),
                statusBeforeRequest: expiredActive ? 'active' : (current?.statusBeforeRequest || null),
                limits: current?.limits || { ...PRODUCT_DEFINITIONS.omr.defaultLimits },
                usage: current?.usage || normalizeUsage({}),
                usageYear: current?.usageYear || academicYearId(now.toDate()),
                syncVersion: Number(current?.syncVersion) || 0,
                requestStatus: 'pending',
                requestedAt: current?.requestedAt || now,
                requestUpdatedAt: now,
                requestSource: source,
                createdAt: current?.createdAt || now,
                updatedAt: now,
                revision,
                searchTokens: buildSearchTokens(profile),
            }, { merge: true });
        }
        return { status: 'pending' };
    });
});

exports.omrGetBootstrap = onCall({ region: REGION, cors: true, maxInstances: 3 }, async (request) => {
    const auth = requireAuth(request);
    const database = db();
    const tenantRef = memberRef(auth.uid, database);
    const [tenantDoc, adminAccess] = await Promise.all([
        tenantRef.get(),
        isPlatformAdmin(auth, database),
    ]);
    if (!tenantDoc.exists) {
        return { tenant: null, status: 'unregistered', isAdmin: adminAccess, changes: [], nextCursor: 0, hasMore: false };
    }
    const tenant = tenantDoc.data();
    const view = tenantView(auth.uid, tenant);
    try {
        assertTenantActive(tenant);
    } catch (_) {
        return {
            tenant: view,
            status: timestampMillis(tenant.accessEndsAt || tenant.accessExpiresAt) <= Date.now() ? 'expired' : tenant.status,
            isAdmin: adminAccess,
            changes: [],
            nextCursor: Number(tenant.syncVersion) || 0,
            hasMore: false,
        };
    }
    const cursor = Math.max(0, Number(request.data?.cursor) || 0);
    const [workspaceDoc, resultSnapshot] = await Promise.all([
        tenantRef.collection('omrWorkspace').doc('current').get(),
        tenantRef.collection('omrResults').where('syncVersion', '>', cursor).orderBy('syncVersion').limit(101).get(),
    ]);
    const now = Date.now();
    const docs = resultSnapshot.docs.slice(0, 100);
    const changes = docs.map((doc) => ({ id: doc.id, ...doc.data() }))
        .filter((item) => timestampMillis(item.expiresAt) > now);
    const nextCursor = docs.reduce((max, doc) => Math.max(max, Number(doc.data().syncVersion) || 0), cursor);
    const workspaceData = workspaceDoc.exists && timestampMillis(workspaceDoc.data().expiresAt) > now
        ? workspaceDoc.data()
        : null;
    return {
        tenant: view,
        isAdmin: adminAccess,
        workspace: workspaceData,
        changes,
        nextCursor,
        hasMore: resultSnapshot.size > 100,
    };
});

exports.omrSyncWorkspace = onCall({ region: REGION, cors: true, maxInstances: 3 }, async (request) => {
    const auth = requireAuth(request);
    const database = db();
    const tenantRef = memberRef(auth.uid, database);
    const workspaceRef = tenantRef.collection('omrWorkspace').doc('current');
    const opRef = mutationRef(tenantRef, request.data?.clientMutationId);
    return database.runTransaction(async (transaction) => {
        const [tenantDoc, oldWorkspace, operation] = await Promise.all([
            transaction.get(tenantRef), transaction.get(workspaceRef), transaction.get(opRef),
        ]);
        if (!tenantDoc.exists) throw new HttpsError('permission-denied', 'Tài khoản OMR chưa được duyệt.');
        const tenant = tenantDoc.data();
        assertTenantActive(tenant);
        if (operation.exists) return operation.data().response;
        const limits = normalizeLimits(tenant.limits || {});
        const now = Timestamp.now();
        const oldWorkspaceActive = oldWorkspace.exists && timestampMillis(oldWorkspace.data().expiresAt) > now.toMillis();
        const baseSyncVersion = Math.max(0, Number(request.data?.baseSyncVersion) || 0);
        if (oldWorkspaceActive && baseSyncVersion < (Number(oldWorkspace.data().syncVersion) || 0)) {
            const response = {
                conflict: true,
                syncVersion: Number(oldWorkspace.data().syncVersion) || 0,
                workspace: oldWorkspace.data(),
            };
            transaction.set(opRef, {
                kind: 'workspace-conflict',
                response,
                createdAt: now,
                expiresAt: Timestamp.fromDate(addCalendarMonths(now.toDate(), RETENTION_MONTHS)),
            });
            return response;
        }
        const normalized = normalizeWorkspace(request.data?.workspace, limits);
        const syncVersion = (Number(tenant.syncVersion) || 0) + 1;
        const usage = normalizeUsage(tenant, now.toDate());
        const response = { syncVersion };
        transaction.set(workspaceRef, {
            ...normalized.output,
            ownerUid: auth.uid,
            createdAt: oldWorkspaceActive ? (oldWorkspace.data().createdAt || now) : now,
            updatedAt: now,
            expiresAt: oldWorkspaceActive
                ? oldWorkspace.data().expiresAt
                : Timestamp.fromDate(addCalendarMonths(now.toDate(), RETENTION_MONTHS)),
            syncVersion,
        });
        transaction.set(tenantRef, {
            usage: { ...usage, classCount: normalized.classCount, studentCount: normalized.studentCount },
            usageYear: academicYearId(now.toDate()),
            syncVersion,
            omrUpdatedAt: now,
        }, { merge: true });
        transaction.set(opRef, { kind: 'workspace', response, createdAt: now, expiresAt: Timestamp.fromDate(addCalendarMonths(now.toDate(), RETENTION_MONTHS)) });
        return response;
    });
});

exports.omrSyncResults = onCall({ region: REGION, cors: true, maxInstances: 3 }, async (request) => {
    const auth = requireAuth(request);
    const rawResults = Array.isArray(request.data?.results) ? request.data.results : [];
    if (!rawResults.length || rawResults.length > 25) throw new HttpsError('invalid-argument', 'Mỗi lượt đồng bộ cần từ 1 đến 25 kết quả.');
    const normalized = rawResults.map(normalizeResult);
    const baseSyncVersions = rawResults.map((result) => Math.max(0, Number(result?.baseSyncVersion) || 0));
    if (new Set(normalized.map((item) => item.id)).size !== normalized.length) throw new HttpsError('invalid-argument', 'Danh sách có mã kết quả trùng nhau.');
    const database = db();
    const tenantRef = memberRef(auth.uid, database);
    const opRef = mutationRef(tenantRef, request.data?.clientMutationId);
    const resultRefs = normalized.map((item) => tenantRef.collection('omrResults').doc(item.id));
    return database.runTransaction(async (transaction) => {
        const tenantDoc = await transaction.get(tenantRef);
        const operation = await transaction.get(opRef);
        const oldResults = [];
        for (const ref of resultRefs) oldResults.push(await transaction.get(ref));
        if (!tenantDoc.exists) throw new HttpsError('permission-denied', 'Tài khoản OMR chưa được duyệt.');
        const tenant = tenantDoc.data();
        assertTenantActive(tenant);
        if (operation.exists) return operation.data().response;
        const now = Timestamp.now();
        const limits = normalizeLimits(tenant.limits || {});
        const usage = normalizeUsage(tenant, now.toDate());
        const newCount = oldResults.filter((doc) => !doc.exists).length;
        if (usage.resultCount + newCount > limits.maxResults) {
            throw new HttpsError('resource-exhausted', `Đã vượt hạn mức ${limits.maxResults} bài chấm trong năm học.`);
        }
        const syncVersion = (Number(tenant.syncVersion) || 0) + 1;
        const synced = [];
        normalized.forEach((result, index) => {
            const old = oldResults[index].exists ? oldResults[index].data() : {};
            if (oldResults[index].exists && timestampMillis(old.expiresAt) <= now.toMillis()) {
                throw new HttpsError('failed-precondition', `Kết quả ${result.id} đã hết thời hạn lưu.`);
            }
            if (oldResults[index].exists && old.deletedAt) {
                synced.push({
                    id: result.id,
                    isDeleted: true,
                    deletedAt: old.deletedAt,
                    expiresAt: old.expiresAt,
                    syncVersion: Number(old.syncVersion) || 0,
                });
                return;
            }
            if (oldResults[index].exists && baseSyncVersions[index] < (Number(old.syncVersion) || 0)) {
                synced.push({ id: result.id, ...old, conflict: true });
                return;
            }
            const expiresAt = old.expiresAt || Timestamp.fromDate(addCalendarMonths(now.toDate(), RETENTION_MONTHS));
            transaction.set(resultRefs[index], {
                ...result,
                ownerUid: auth.uid,
                createdAt: old.createdAt || now,
                updatedAt: now,
                expiresAt,
                deletedAt: null,
                syncVersion,
                blobIds: Array.isArray(old.blobIds) ? old.blobIds : [],
                cloudBlobId: old.cloudBlobId || null,
            });
            synced.push({ id: result.id, syncVersion, expiresAt });
        });
        const response = { synced, syncVersion };
        transaction.set(tenantRef, {
            usage: { ...usage, resultCount: usage.resultCount + newCount },
            usageYear: academicYearId(now.toDate()),
            syncVersion,
            omrUpdatedAt: now,
        }, { merge: true });
        transaction.set(opRef, { kind: 'results', response, createdAt: now, expiresAt: Timestamp.fromDate(addCalendarMonths(now.toDate(), RETENTION_MONTHS)) });
        return response;
    });
});

async function purgeResultBlobs(tenantRef, resultId) {
    const snapshot = await tenantRef.collection('omrBlobs').where('resultId', '==', resultId).get();
    if (snapshot.empty) return { bytes: 0, pendingBytes: 0, deleted: 0 };
    for (const doc of snapshot.docs) {
        const blob = doc.data();
        if (blob.objectKey) {
            const ticket = storageTicket('delete', { uid: tenantRef.id, key: blob.objectKey }, 120);
            await storageWorkerJson('delete', ticket, 'DELETE');
        }
    }
    const database = db();
    const budgetRef = storageBudgetRef(database);
    return database.runTransaction(async (transaction) => {
        const currentDocs = [];
        for (const doc of snapshot.docs) currentDocs.push(await transaction.get(doc.ref));
        let bytes = 0;
        let pendingBytes = 0;
        let deleted = 0;
        currentDocs.forEach((doc) => {
            if (!doc.exists) return;
            const blob = doc.data();
            if (blob.status === 'committed' || (blob.status === 'deletePending' && blob.deleteAccounting === 'committed')) {
                bytes += Number(blob.bytes) || 0;
            }
            if (['reserved', 'verifying'].includes(blob.status) || (blob.status === 'deletePending' && blob.deleteAccounting !== 'committed')) {
                pendingBytes += Number(blob.expectedBytes) || 0;
            }
            transaction.delete(doc.ref);
            deleted += 1;
        });
        if (deleted) {
            transaction.set(tenantRef, {
                'usage.r2Bytes': FieldValue.increment(-bytes),
                'usage.pendingR2Bytes': FieldValue.increment(-pendingBytes),
                omrUpdatedAt: Timestamp.now(),
            }, { merge: true });
            transaction.set(budgetRef, {
                r2Bytes: FieldValue.increment(-bytes),
                pendingR2Bytes: FieldValue.increment(-pendingBytes),
                limitBytes: GLOBAL_R2_LIMIT_BYTES,
                updatedAt: Timestamp.now(),
            }, { merge: true });
        }
        return { bytes, pendingBytes, deleted };
    });
}

exports.omrDeleteResult = onCall({ region: REGION, cors: true, maxInstances: 3, secrets: BLOB_SECRETS }, async (request) => {
    const auth = requireAuth(request);
    const resultId = validId(request.data?.resultId, 'Mã kết quả');
    const database = db();
    const tenantRef = memberRef(auth.uid, database);
    const resultRef = tenantRef.collection('omrResults').doc(resultId);
    const opRef = mutationRef(tenantRef, request.data?.clientMutationId);
    const response = await database.runTransaction(async (transaction) => {
        const [tenantDoc, resultDoc, operation] = await Promise.all([
            transaction.get(tenantRef), transaction.get(resultRef), transaction.get(opRef),
        ]);
        if (!tenantDoc.exists) throw new HttpsError('permission-denied', 'Tài khoản OMR chưa được duyệt.');
        assertTenantActive(tenantDoc.data());
        if (operation.exists) return operation.data().response;
        if (!resultDoc.exists) return { deleted: true, resultId };
        const now = Timestamp.now();
        const old = resultDoc.data();
        if (old.deletedAt) {
            const result = {
                deleted: true,
                resultId,
                syncVersion: Number(old.syncVersion) || 0,
                deletedAt: old.deletedAt,
            };
            transaction.set(opRef, {
                kind: 'delete',
                response: result,
                createdAt: now,
                expiresAt: Timestamp.fromDate(addCalendarMonths(now.toDate(), RETENTION_MONTHS)),
            });
            return result;
        }
        const syncVersion = (Number(tenantDoc.data().syncVersion) || 0) + 1;
        const result = { deleted: true, resultId, syncVersion };
        transaction.set(resultRef, {
            id: resultId,
            ownerUid: auth.uid,
            createdAt: old.createdAt || now,
            updatedAt: now,
            deletedAt: now,
            expiresAt: old.expiresAt || Timestamp.fromDate(addCalendarMonths(now.toDate(), RETENTION_MONTHS)),
            syncVersion,
            blobIds: Array.isArray(old.blobIds) ? old.blobIds : [],
            isDeleted: true,
        });
        transaction.set(tenantRef, { syncVersion, omrUpdatedAt: now }, { merge: true });
        transaction.set(opRef, { kind: 'delete', response: result, createdAt: now, expiresAt: Timestamp.fromDate(addCalendarMonths(now.toDate(), RETENTION_MONTHS)) });
        return result;
    });
    try {
        await purgeResultBlobs(tenantRef, resultId);
        await resultRef.update({
            blobCleanupPending: FieldValue.delete(),
            blobCleanupRetryAt: FieldValue.delete(),
        }).catch(() => {});
        return { ...response, blobCleanupPending: false };
    } catch (error) {
        logger.error('[OMR] Hoãn xóa blob kết quả', { uid: auth.uid, resultId, error: error.message });
        await resultRef.update({
            blobCleanupPending: true,
            blobCleanupRetryAt: Timestamp.now(),
            updatedAt: Timestamp.now(),
        }).catch(() => {});
        return { ...response, blobCleanupPending: true };
    }
});

exports.omrCreateUploadUrl = onCall({ region: REGION, cors: true, maxInstances: 3, secrets: BLOB_SECRETS }, async (request) => {
    const auth = requireAuth(request);
    const resultId = validId(request.data?.resultId, 'Mã kết quả');
    const kind = String(request.data?.kind || 'annotated');
    const rule = ALLOWED_UPLOADS[kind];
    if (!rule) throw new HttpsError('invalid-argument', 'Loại tệp OMR không được hỗ trợ.');
    const contentType = String(request.data?.contentType || '').toLowerCase();
    const declaredBytes = Number(request.data?.sizeBytes);
    if (!Number.isInteger(declaredBytes) || declaredBytes < 1 || declaredBytes > rule.maxBytes || !rule.types.includes(contentType)) {
        throw new HttpsError('invalid-argument', 'MIME hoặc kích thước tệp không hợp lệ.');
    }
    const sizeBytes = declaredBytes;
    const sha256 = String(request.data?.sha256 || '').toLowerCase();
    if (sha256 && !/^[a-f0-9]{64}$/.test(sha256)) throw new HttpsError('invalid-argument', 'SHA-256 không hợp lệ.');
    const database = db();
    const tenantRef = memberRef(auth.uid, database);
    const resultRef = tenantRef.collection('omrResults').doc(resultId);
    const blobId = crypto.randomUUID();
    const blobRef = tenantRef.collection('omrBlobs').doc(blobId);
    const budgetRef = storageBudgetRef(database);
    const objectKey = `omr/users/${auth.uid}/results/${resultId}/${blobId}.${uploadExtension(contentType)}`;
    const ticket = storageTicket('put', {
        uid: auth.uid,
        key: objectKey,
        bytes: sizeBytes,
        contentType,
        sha256: sha256 || null,
    }, 300);
    const now = Timestamp.now();
    await database.runTransaction(async (transaction) => {
        const [tenantDoc, resultDoc, budgetDoc] = await Promise.all([
            transaction.get(tenantRef), transaction.get(resultRef), transaction.get(budgetRef),
        ]);
        if (!tenantDoc.exists || !resultDoc.exists) throw new HttpsError('not-found', 'Không tìm thấy kết quả OMR để gắn tệp.');
        const tenant = tenantDoc.data();
        const result = resultDoc.data();
        assertTenantActive(tenant);
        if (result.deletedAt || timestampMillis(result.expiresAt) <= now.toMillis()) throw new HttpsError('failed-precondition', 'Kết quả đã bị xóa hoặc hết hạn.');
        const usage = normalizeUsage(tenant, now.toDate());
        const limits = normalizeLimits(tenant.limits || {});
        if (!limits.cloudImageEnabled || limits.r2QuotaBytes <= 0) {
            throw new HttpsError(
                'permission-denied',
                'Ảnh/PDF mặc định lưu trên thiết bị. Đồng bộ tệp cloud chỉ dành cho gói trả phí.',
            );
        }
        if (usage.r2Bytes + usage.pendingR2Bytes + sizeBytes > limits.r2QuotaBytes) {
            throw new HttpsError('resource-exhausted', 'Không đủ dung lượng R2 được admin cấp.');
        }
        const budget = normalizeStorageBudget(budgetDoc.exists ? budgetDoc.data() : {});
        if (budget.r2Bytes + budget.pendingR2Bytes + sizeBytes > budget.limitBytes) {
            throw new HttpsError('resource-exhausted', 'Kho R2 của toàn hệ thống đã gần đầy; vui lòng liên hệ admin.');
        }
        transaction.set(blobRef, {
            id: blobId,
            ownerUid: auth.uid,
            resultId,
            kind,
            status: 'reserved',
            objectKey,
            expectedBytes: sizeBytes,
            contentType,
            sha256: sha256 || null,
            createdAt: now,
            reservationExpiresAt: Timestamp.fromMillis(now.toMillis() + 15 * 60 * 1000),
            expiresAt: Timestamp.fromMillis(Math.min(
                timestampMillis(result.expiresAt),
                addCalendarMonths(now.toDate(), BLOB_RETENTION_MONTHS).getTime(),
            )),
        });
        transaction.set(tenantRef, { 'usage.pendingR2Bytes': FieldValue.increment(sizeBytes), omrUpdatedAt: now }, { merge: true });
        transaction.set(budgetRef, {
            pendingR2Bytes: FieldValue.increment(sizeBytes),
            limitBytes: GLOBAL_R2_LIMIT_BYTES,
            updatedAt: now,
        }, { merge: true });
    });
    return {
        uploadId: blobId,
        blobId,
        uploadUrl: `${STORAGE_WORKER_URL}/put`,
        headers: { Authorization: `Bearer ${ticket}` },
        expiresInSeconds: 300,
    };
});

async function finishDeletePendingBlob(tenantRef, blobRef) {
    const currentDoc = await blobRef.get();
    if (!currentDoc.exists || currentDoc.data().status !== 'deletePending') return false;
    const blob = currentDoc.data();
    if (blob.objectKey) {
        const ticket = storageTicket('delete', { uid: tenantRef.id, key: blob.objectKey }, 120);
        await storageWorkerJson('delete', ticket, 'DELETE');
    }
    const database = db();
    return database.runTransaction(async (transaction) => {
        const current = await transaction.get(blobRef);
        if (!current.exists || current.data().status !== 'deletePending') return false;
        const data = current.data();
        const committed = data.deleteAccounting === 'committed';
        const bytes = committed ? Math.max(0, Number(data.bytes) || 0) : 0;
        const pendingBytes = committed ? 0 : Math.max(0, Number(data.expectedBytes) || 0);
        transaction.delete(blobRef);
        transaction.set(tenantRef, {
            'usage.r2Bytes': FieldValue.increment(-bytes),
            'usage.pendingR2Bytes': FieldValue.increment(-pendingBytes),
            omrUpdatedAt: Timestamp.now(),
        }, { merge: true });
        transaction.set(storageBudgetRef(database), {
            r2Bytes: FieldValue.increment(-bytes),
            pendingR2Bytes: FieldValue.increment(-pendingBytes),
            limitBytes: GLOBAL_R2_LIMIT_BYTES,
            updatedAt: Timestamp.now(),
        }, { merge: true });
        return true;
    });
}

async function rejectReservedBlob(tenantRef, blobRef, force = false) {
    const claimed = await db().runTransaction(async (transaction) => {
        const currentDoc = await transaction.get(blobRef);
        if (!currentDoc.exists) return false;
        const current = currentDoc.data();
        if (current.status === 'committed' || current.deleteAccounting === 'committed') return false;
        if (current.status === 'verifying' && !force && timestampMillis(current.verificationExpiresAt) > Date.now()) {
            return false;
        }
        if (!['reserved', 'verifying', 'deletePending'].includes(current.status)) return false;
        transaction.set(blobRef, {
            status: 'deletePending',
            deletePending: true,
            deleteAccounting: 'pending',
            deleteStartedAt: Timestamp.now(),
            updatedAt: Timestamp.now(),
        }, { merge: true });
        return true;
    });
    if (!claimed) return false;
    return finishDeletePendingBlob(tenantRef, blobRef);
}

async function deleteCommittedBlob(tenantRef, blobId) {
    if (!blobId) return false;
    const blobRef = tenantRef.collection('omrBlobs').doc(blobId);
    const claimed = await db().runTransaction(async (transaction) => {
        const currentDoc = await transaction.get(blobRef);
        if (!currentDoc.exists) return false;
        const current = currentDoc.data();
        if (current.status === 'deletePending' && current.deleteAccounting === 'committed') return true;
        if (current.status !== 'committed') return false;
        transaction.set(blobRef, {
            status: 'deletePending',
            deletePending: true,
            deleteAccounting: 'committed',
            deleteStartedAt: Timestamp.now(),
            updatedAt: Timestamp.now(),
        }, { merge: true });
        return true;
    });
    if (!claimed) return false;
    return finishDeletePendingBlob(tenantRef, blobRef);
}

async function cleanupCommittedBlobIds(tenantRef, blobIds, ownerUid) {
    let cleanupPending = false;
    for (const oldBlobId of new Set(blobIds.filter(Boolean))) {
        try {
            await deleteCommittedBlob(tenantRef, oldBlobId);
        } catch (error) {
            cleanupPending = true;
            logger.error('[OMR] Hoãn xóa ảnh annotated đã thay thế', {
                uid: ownerUid,
                blobId: oldBlobId,
                error: error.message,
            });
        }
    }
    return cleanupPending;
}

exports.omrCommitUpload = onCall({ region: REGION, cors: true, maxInstances: 3, secrets: BLOB_SECRETS }, async (request) => {
    const auth = requireAuth(request);
    const blobId = validId(request.data?.uploadId, 'Mã upload');
    const resultId = validId(request.data?.resultId, 'Mã kết quả');
    const database = db();
    const tenantRef = memberRef(auth.uid, database);
    const blobRef = tenantRef.collection('omrBlobs').doc(blobId);
    const resultRef = tenantRef.collection('omrResults').doc(resultId);
    const budgetRef = storageBudgetRef(database);
    const blob = await database.runTransaction(async (transaction) => {
        const [tenantDoc, blobDoc, resultDoc] = await Promise.all([
            transaction.get(tenantRef), transaction.get(blobRef), transaction.get(resultRef),
        ]);
        if (!tenantDoc.exists || !blobDoc.exists || !resultDoc.exists) throw new HttpsError('not-found', 'Upload OMR không tồn tại.');
        assertTenantActive(tenantDoc.data());
        if (!normalizeLimits(tenantDoc.data().limits || {}).cloudImageEnabled) {
            throw new HttpsError('permission-denied', 'Gói hiện tại không bật đồng bộ ảnh cloud.');
        }
        const current = blobDoc.data();
        if (current.resultId !== resultId) throw new HttpsError('permission-denied', 'Upload không thuộc kết quả này.');
        const resultData = resultDoc.data();
        if (resultData.deletedAt || timestampMillis(resultData.expiresAt) <= Date.now()) {
            throw new HttpsError('failed-precondition', 'Kết quả đã bị xóa hoặc hết hạn trong khi upload.');
        }
        const authoritativeBlobId = current.kind === 'annotated' && resultData.cloudBlobId
            ? String(resultData.cloudBlobId)
            : blobId;
        const superseded = authoritativeBlobId !== blobId;
        const committedOrSuperseded = current.status === 'committed'
            || (superseded && current.status === 'deletePending' && current.deleteAccounting === 'committed');
        if (committedOrSuperseded) {
            return {
                ...current,
                alreadyCommitted: true,
                authoritativeBlobId,
                superseded,
                resultSyncVersion: Math.max(0, Number(resultData.syncVersion) || 0),
            };
        }
        const verificationActive = current.status === 'verifying' && timestampMillis(current.verificationExpiresAt) > Date.now();
        if (!verificationActive && (current.status !== 'reserved' || timestampMillis(current.reservationExpiresAt) <= Date.now())) {
            throw new HttpsError('failed-precondition', 'Phiên upload đã hết hạn.');
        }
        if (!verificationActive) {
            transaction.set(blobRef, {
                status: 'verifying',
                verificationStartedAt: Timestamp.now(),
                verificationExpiresAt: Timestamp.fromMillis(Date.now() + BLOB_VERIFY_LEASE_MS),
                updatedAt: Timestamp.now(),
            }, { merge: true });
        }
        return current;
    });
    if (blob.alreadyCommitted) {
        const authoritativeBlobId = blob.authoritativeBlobId || blobId;
        const cleanupIds = [blob.replacedBlobId];
        if (blob.superseded) cleanupIds.push(blobId);
        const replacementCleanupPending = await cleanupCommittedBlobIds(
            tenantRef,
            cleanupIds.filter((oldBlobId) => oldBlobId !== authoritativeBlobId),
            auth.uid,
        );
        return {
            blobId: authoritativeBlobId,
            committed: true,
            syncVersion: blob.resultSyncVersion,
            replacementCleanupPending,
        };
    }
    let head;
    try {
        const ticket = storageTicket('head', { uid: auth.uid, key: blob.objectKey }, 120);
        head = await storageWorkerJson('head', ticket, 'POST');
    } catch (_) {
        throw new HttpsError('failed-precondition', 'R2 chưa nhận đủ tệp upload.');
    }
    const actualBytes = Number(head.bytes) || 0;
    const actualType = String(head.contentType || '').toLowerCase();
    const actualHash = String(head.sha256 || '').toLowerCase();
    if (actualBytes !== Number(blob.expectedBytes) || actualType !== blob.contentType || (blob.sha256 && actualHash !== blob.sha256)) {
        await rejectReservedBlob(tenantRef, blobRef, true);
        throw new HttpsError('data-loss', 'Kích thước, MIME hoặc checksum của tệp không khớp.');
    }
    const committed = await database.runTransaction(async (transaction) => {
        const [currentTenant, currentBlob, currentResult] = await Promise.all([
            transaction.get(tenantRef), transaction.get(blobRef), transaction.get(resultRef),
        ]);
        if (!currentTenant.exists || !currentBlob.exists || !currentResult.exists) throw new HttpsError('not-found', 'Dữ liệu upload đã thay đổi.');
        const current = currentBlob.data();
        assertTenantActive(currentTenant.data());
        if (!normalizeLimits(currentTenant.data().limits || {}).cloudImageEnabled) {
            throw new HttpsError('permission-denied', 'Gói hiện tại không bật đồng bộ ảnh cloud.');
        }
        const currentResultData = currentResult.data();
        if (currentResultData.deletedAt || timestampMillis(currentResultData.expiresAt) <= Date.now()) {
            throw new HttpsError('failed-precondition', 'Kết quả đã bị xóa hoặc hết hạn trong khi upload.');
        }
        const authoritativeBlobId = current.kind === 'annotated' && currentResultData.cloudBlobId
            ? String(currentResultData.cloudBlobId)
            : blobId;
        const superseded = authoritativeBlobId !== blobId;
        const committedOrSuperseded = current.status === 'committed'
            || (superseded && current.status === 'deletePending' && current.deleteAccounting === 'committed');
        if (committedOrSuperseded) {
            return {
                blobId: authoritativeBlobId,
                requestedBlobId: blobId,
                committed: true,
                bytes: Math.max(0, Number(current.bytes) || 0),
                syncVersion: Math.max(0, Number(currentResultData.syncVersion) || 0),
                replacedBlobId: current.replacedBlobId || null,
                superseded,
            };
        }
        if (current.status !== 'verifying' || timestampMillis(current.verificationExpiresAt) <= Date.now()) {
            throw new HttpsError('aborted', 'Phiên xác minh upload đã thay đổi; vui lòng thử lại.');
        }
        const now = Timestamp.now();
        const syncVersion = (Number(currentTenant.data().syncVersion) || 0) + 1;
        const resultData = currentResultData;
        const previousBlobId = current.kind === 'annotated' && resultData.cloudBlobId && resultData.cloudBlobId !== blobId
            ? String(resultData.cloudBlobId)
            : null;
        let replacementClaimed = false;
        if (previousBlobId) {
            const previousBlobRef = tenantRef.collection('omrBlobs').doc(previousBlobId);
            const previousBlobDoc = await transaction.get(previousBlobRef);
            if (previousBlobDoc.exists) {
                const previousBlob = previousBlobDoc.data();
                if (previousBlob.resultId !== resultId) {
                    throw new HttpsError('failed-precondition', 'Ảnh cũ không thuộc kết quả đang chấm lại.');
                }
                if (previousBlob.status === 'committed') {
                    transaction.set(previousBlobRef, {
                        status: 'deletePending',
                        deletePending: true,
                        deleteAccounting: 'committed',
                        deleteStartedAt: now,
                        updatedAt: now,
                    }, { merge: true });
                    replacementClaimed = true;
                } else if (previousBlob.status === 'deletePending' && previousBlob.deleteAccounting === 'committed') {
                    replacementClaimed = true;
                } else {
                    throw new HttpsError('failed-precondition', 'Ảnh cũ chưa ở trạng thái có thể thay thế.');
                }
            }
        }
        transaction.set(blobRef, {
            status: 'committed',
            bytes: actualBytes,
            replacedBlobId: previousBlobId || FieldValue.delete(),
            committedAt: now,
            updatedAt: now,
            reservationExpiresAt: FieldValue.delete(),
            verificationStartedAt: FieldValue.delete(),
            verificationExpiresAt: FieldValue.delete(),
        }, { merge: true });
        const nextBlobIds = new Set(Array.isArray(resultData.blobIds) ? resultData.blobIds : []);
        if (previousBlobId) nextBlobIds.delete(previousBlobId);
        nextBlobIds.add(blobId);
        const resultUpdate = {
            blobIds: [...nextBlobIds],
            updatedAt: now,
            syncVersion,
        };
        if (current.kind === 'annotated') resultUpdate.cloudBlobId = blobId;
        transaction.set(resultRef, resultUpdate, { merge: true });
        transaction.set(tenantRef, {
            'usage.pendingR2Bytes': FieldValue.increment(-Number(current.expectedBytes || actualBytes)),
            'usage.r2Bytes': FieldValue.increment(actualBytes),
            syncVersion,
            omrUpdatedAt: now,
        }, { merge: true });
        transaction.set(budgetRef, {
            pendingR2Bytes: FieldValue.increment(-Number(current.expectedBytes || actualBytes)),
            r2Bytes: FieldValue.increment(actualBytes),
            limitBytes: GLOBAL_R2_LIMIT_BYTES,
            updatedAt: now,
        }, { merge: true });
        return {
            blobId,
            committed: true,
            bytes: actualBytes,
            syncVersion,
            replacedBlobId: previousBlobId,
            replacementClaimed,
        };
    });
    const cleanupIds = [];
    if (committed.replacedBlobId && committed.replacementClaimed !== false) cleanupIds.push(committed.replacedBlobId);
    if (committed.superseded && committed.requestedBlobId) cleanupIds.push(committed.requestedBlobId);
    const replacementCleanupPending = await cleanupCommittedBlobIds(
        tenantRef,
        cleanupIds.filter((oldBlobId) => oldBlobId !== committed.blobId),
        auth.uid,
    );
    const response = {
        blobId: committed.blobId,
        committed: true,
        syncVersion: committed.syncVersion,
        replacementCleanupPending,
    };
    if (!committed.superseded) response.bytes = committed.bytes;
    return response;
});

exports.omrCreateDownloadUrl = onCall({ region: REGION, cors: true, maxInstances: 3, secrets: BLOB_SECRETS }, async (request) => {
    const auth = requireAuth(request);
    const blobId = validId(request.data?.blobId, 'Mã tệp');
    const tenantRef = memberRef(auth.uid);
    const [tenantDoc, blobDoc] = await Promise.all([tenantRef.get(), tenantRef.collection('omrBlobs').doc(blobId).get()]);
    if (!tenantDoc.exists || !blobDoc.exists) throw new HttpsError('not-found', 'Không tìm thấy tệp OMR.');
    assertTenantActive(tenantDoc.data());
    const blob = blobDoc.data();
    const effectiveExpiry = blobExpiryMillis(blob);
    if (blob.status !== 'committed' || effectiveExpiry <= Date.now()) throw new HttpsError('failed-precondition', 'Tệp đã hết hạn hoặc chưa hoàn tất.');
    const resultDoc = await tenantRef.collection('omrResults').doc(blob.resultId).get();
    if (!resultDoc.exists || resultDoc.data().deletedAt) throw new HttpsError('not-found', 'Kết quả chứa tệp đã bị xóa.');
    const secondsUntilExpiry = Math.floor((effectiveExpiry - Date.now()) / 1000);
    const expiresIn = Math.max(1, Math.min(300, secondsUntilExpiry));
    const ticket = storageTicket('get', { uid: auth.uid, key: blob.objectKey }, expiresIn);
    return {
        url: `${STORAGE_WORKER_URL}/get`,
        headers: { Authorization: `Bearer ${ticket}` },
        expiresInSeconds: expiresIn,
        contentType: blob.contentType,
        bytes: blob.bytes,
    };
});

async function cleanupOneResult(resultDoc) {
    const tenantRef = omrMemberRefFromSubcollectionDoc(resultDoc, 'omrResults');
    if (!tenantRef) return false;
    const result = resultDoc.data();
    const hasBlobReferences = Boolean(result.cloudBlobId)
        || (Array.isArray(result.blobIds) && result.blobIds.some(Boolean))
        || result.blobCleanupPending === true;
    if (hasBlobReferences) await purgeResultBlobs(tenantRef, resultDoc.id);
    await resultDoc.ref.delete();
    return true;
}

function isOmrSubcollectionPath(path, collectionName) {
    const allowedCollections = new Set(['omrResults', 'omrBlobs', 'omrWorkspace', 'omrMutations']);
    if (!allowedCollections.has(collectionName)) return false;
    const parts = String(path || '').split('/');
    return parts.length === 6
        && parts[0] === 'products'
        && parts[1] === OMR_PRODUCT_ID
        && parts[2] === 'members'
        && Boolean(parts[3])
        && parts[4] === collectionName
        && Boolean(parts[5]);
}

function isOmrSubcollectionDoc(doc, collectionName) {
    return isOmrSubcollectionPath(doc?.ref?.path, collectionName);
}

function omrMemberRefFromSubcollectionDoc(doc, collectionName) {
    if (!isOmrSubcollectionDoc(doc, collectionName)) return null;
    const parent = doc.ref.parent?.parent;
    const parts = doc.ref.path.split('/');
    return parent?.path === `products/${OMR_PRODUCT_ID}/members/${parts[3]}` ? parent : null;
}

async function cleanupOneExpiredBlob(blobDoc) {
    const tenantRef = omrMemberRefFromSubcollectionDoc(blobDoc, 'omrBlobs');
    if (!tenantRef) return false;
    const blob = blobDoc.data();
    if (blob.status === 'deletePending') return finishDeletePendingBlob(tenantRef, blobDoc.ref);
    if (blob.status === 'committed') return deleteCommittedBlob(tenantRef, blobDoc.id);
    return rejectReservedBlob(tenantRef, blobDoc.ref, true);
}

async function deleteRefsInChunks(refs) {
    for (let index = 0; index < refs.length; index += 450) {
        const batch = db().batch();
        refs.slice(index, index + 450).forEach((ref) => batch.delete(ref));
        await batch.commit();
    }
}

async function forEachWithConcurrency(items, concurrency, worker) {
    if (!items.length) return;
    let cursor = 0;
    async function runner() {
        for (;;) {
            const index = cursor;
            cursor += 1;
            if (index >= items.length) return;
            await worker(items[index], index);
        }
    }
    const workers = Math.min(Math.max(1, concurrency), items.length);
    await Promise.all(Array.from({ length: workers }, () => runner()));
}

async function claimDeletionJob(jobRef) {
    const database = db();
    return database.runTransaction(async (transaction) => {
        const jobDoc = await transaction.get(jobRef);
        if (!jobDoc.exists) return null;
        const job = jobDoc.data();
        const nowMillis = Date.now();
        // A PUT ticket may already have been issued immediately before access
        // was blocked. Drain that short-lived capability before deleting the
        // metadata, otherwise a slow upload could recreate an orphan in R2.
        const ready = job.status === 'queued'
            && timestampMillis(job.deleteAfter) + DELETION_STORAGE_DRAIN_MS <= nowMillis;
        const abandoned = job.status === 'processing' && timestampMillis(job.leaseExpiresAt) <= nowMillis;
        if (!ready && !abandoned) return null;
        const productId = String(job.productId || '');
        const uid = String(job.uid || '');
        if (!PRODUCT_DEFINITIONS[productId] || !uid || uid.includes('/') || jobRef.id !== `${productId}__${uid}`) {
            transaction.set(jobRef, {
                status: 'failed',
                lastError: 'Deletion job identity is invalid.',
                updatedAt: Timestamp.now(),
                expireAt: Timestamp.fromDate(addCalendarMonths(new Date(), RETENTION_MONTHS)),
            }, { merge: true });
            return null;
        }
        const targetRef = memberRef(uid, database, productId);
        const targetDoc = await transaction.get(targetRef);
        if (targetDoc.exists && targetDoc.data().status !== 'deletion_scheduled') {
            transaction.set(jobRef, {
                status: 'cancelled',
                cancelledAt: Timestamp.now(),
                cancellationReason: 'membership-no-longer-scheduled',
                updatedAt: Timestamp.now(),
                expireAt: Timestamp.fromDate(addCalendarMonths(new Date(), RETENTION_MONTHS)),
            }, { merge: true });
            return null;
        }
        const leaseToken = crypto.randomUUID();
        const now = Timestamp.now();
        transaction.set(jobRef, {
            status: 'processing',
            leaseToken,
            leaseStartedAt: now,
            leaseExpiresAt: Timestamp.fromMillis(now.toMillis() + DELETION_LEASE_MS),
            attempts: Math.max(0, Number(job.attempts) || 0) + 1,
            updatedAt: now,
            lastError: FieldValue.delete(),
        }, { merge: true });
        return { ...job, productId, uid, leaseToken };
    });
}

async function renewDeletionLease(jobRef, leaseToken) {
    return db().runTransaction(async (transaction) => {
        const jobDoc = await transaction.get(jobRef);
        if (!jobDoc.exists) return false;
        const job = jobDoc.data();
        if (job.status !== 'processing' || job.leaseToken !== leaseToken) return false;
        const now = Timestamp.now();
        transaction.set(jobRef, {
            leaseExpiresAt: Timestamp.fromMillis(now.toMillis() + DELETION_LEASE_MS),
            updatedAt: now,
        }, { merge: true });
        return true;
    });
}

async function purgeOmrMemberForDeletion(targetRef, jobRef, leaseToken) {
    for (;;) {
        if (!await renewDeletionLease(jobRef, leaseToken)) {
            throw new Error('Deletion lease is no longer active.');
        }
        const blobSnapshot = await targetRef.collection('omrBlobs').limit(100).get();
        if (blobSnapshot.empty) break;
        let removed = 0;
        for (const blobDoc of blobSnapshot.docs) {
            if (await cleanupOneExpiredBlob(blobDoc)) removed += 1;
        }
        if (!removed) throw new Error('OMR blob cleanup made no progress.');
    }
    if (!await renewDeletionLease(jobRef, leaseToken)) {
        throw new Error('Deletion lease is no longer active.');
    }
    await db().recursiveDelete(targetRef);
}

async function completeDeletionJob(jobRef, claimed) {
    const database = db();
    await database.runTransaction(async (transaction) => {
        const jobDoc = await transaction.get(jobRef);
        if (!jobDoc.exists) return;
        const current = jobDoc.data();
        if (current.status !== 'processing' || current.leaseToken !== claimed.leaseToken) return;
        const now = Timestamp.now();
        const auditRef = database.collection('adminAudit').doc();
        transaction.set(jobRef, {
            status: 'completed',
            completedAt: now,
            updatedAt: now,
            leaseToken: FieldValue.delete(),
            leaseExpiresAt: FieldValue.delete(),
            expireAt: Timestamp.fromDate(addCalendarMonths(now.toDate(), RETENTION_MONTHS)),
        }, { merge: true });
        transaction.set(auditRef, {
            productId: claimed.productId,
            targetUid: claimed.uid,
            action: 'deletion_completed',
            actorUid: String(claimed.requestedBy || 'system'),
            actorEmail: '',
            actorRole: 'system',
            reason: String(claimed.reason || '').slice(0, 500),
            before: { status: 'deletion_scheduled' },
            after: { status: 'deleted', authUserPreserved: true, userProfilePreserved: true },
            createdAt: now,
            expireAt: Timestamp.fromDate(addCalendarMonths(now.toDate(), RETENTION_MONTHS)),
        });
    });
}

async function releaseDeletionJob(jobRef, leaseToken, error) {
    await db().runTransaction(async (transaction) => {
        const jobDoc = await transaction.get(jobRef);
        if (!jobDoc.exists) return;
        const current = jobDoc.data();
        if (current.status !== 'processing' || current.leaseToken !== leaseToken) return;
        const now = Timestamp.now();
        transaction.set(jobRef, {
            status: 'queued',
            deleteAfter: Timestamp.fromMillis(now.toMillis() + 5 * 60 * 1000),
            lastError: String(error?.message || error || 'unknown').slice(0, 1000),
            lastFailedAt: now,
            updatedAt: now,
            leaseToken: FieldValue.delete(),
            leaseExpiresAt: FieldValue.delete(),
        }, { merge: true });
    });
}

async function processDeletionJobs() {
    const database = db();
    const now = Timestamp.now();
    const [queued, abandoned] = await Promise.all([
        database.collection('deletionJobs')
            .where('status', '==', 'queued')
            .where('deleteAfter', '<=', now)
            .limit(10)
            .get(),
        database.collection('deletionJobs')
            .where('status', '==', 'processing')
            .where('leaseExpiresAt', '<=', now)
            .limit(10)
            .get(),
    ]);
    const candidates = new Map([...queued.docs, ...abandoned.docs].map((doc) => [doc.ref.path, doc.ref]));
    for (const jobRef of candidates.values()) {
        let claimed = null;
        try {
            claimed = await claimDeletionJob(jobRef);
            if (!claimed) continue;
            const targetRef = memberRef(claimed.uid, database, claimed.productId);
            if (claimed.productId === OMR_PRODUCT_ID) {
                await purgeOmrMemberForDeletion(targetRef, jobRef, claimed.leaseToken);
            } else {
                if (!await renewDeletionLease(jobRef, claimed.leaseToken)) {
                    throw new Error('Deletion lease is no longer active.');
                }
                await database.recursiveDelete(targetRef);
            }
            await completeDeletionJob(jobRef, claimed);
        } catch (error) {
            logger.error('[ConicTypst deletion] Chưa hoàn tất job', {
                job: jobRef.path,
                productId: claimed?.productId || '',
                uid: claimed?.uid || '',
                error: error?.message || String(error),
            });
            if (claimed) await releaseDeletionJob(jobRef, claimed.leaseToken, error).catch(() => {});
        }
    }
}

exports.omrCleanupExpiredData = onSchedule({
    region: REGION,
    schedule: 'every 60 minutes',
    timeZone: 'Asia/Ho_Chi_Minh',
    timeoutSeconds: 540,
    memory: '512MiB',
    maxInstances: 1,
    retryCount: 3,
    minBackoffSeconds: 60,
    maxBackoffSeconds: 300,
    secrets: BLOB_SECRETS,
}, async () => {
    const database = db();
    const now = Timestamp.now();
    const legacyBlobCutoff = Timestamp.fromDate(addCalendarMonths(now.toDate(), -BLOB_RETENTION_MONTHS));
    // Process lifecycle deletions inside the existing hourly cleanup job. This
    // keeps one scheduler for both retention and admin-requested deletion.
    await processDeletionJobs();
    const [expired, pendingBlobResults, pendingBlobDeletes, expiredBlobs, legacyBlobs, reservations, workspaces, mutations] = await Promise.all([
        database.collectionGroup('omrResults').where('expiresAt', '<=', now).limit(CLEANUP_RESULTS_PER_RUN).get(),
        database.collectionGroup('omrResults').where('blobCleanupPending', '==', true).limit(CLEANUP_BLOBS_PER_RUN).get(),
        database.collectionGroup('omrBlobs').where('deletePending', '==', true).limit(CLEANUP_BLOBS_PER_RUN).get(),
        database.collectionGroup('omrBlobs').where('expiresAt', '<=', now).limit(CLEANUP_BLOBS_PER_RUN).get(),
        database.collectionGroup('omrBlobs').where('createdAt', '<=', legacyBlobCutoff).limit(CLEANUP_BLOBS_PER_RUN).get(),
        database.collectionGroup('omrBlobs').where('reservationExpiresAt', '<=', now).limit(CLEANUP_BLOBS_PER_RUN).get(),
        database.collectionGroup('omrWorkspace').where('expiresAt', '<=', now).limit(CLEANUP_LIGHTWEIGHT_PER_RUN).get(),
        database.collectionGroup('omrMutations').where('expiresAt', '<=', now).limit(CLEANUP_LIGHTWEIGHT_PER_RUN).get(),
    ]);
    let retriedPendingBlobDeletes = 0;
    await forEachWithConcurrency(pendingBlobDeletes.docs, CLEANUP_CONCURRENCY, async (doc) => {
        const tenantRef = omrMemberRefFromSubcollectionDoc(doc, 'omrBlobs');
        if (!tenantRef) return;
        try {
            if (await finishDeletePendingBlob(tenantRef, doc.ref)) retriedPendingBlobDeletes += 1;
        } catch (error) {
            logger.error('[OMR cleanup] Chưa xóa được blob đang chờ', { path: doc.ref.path, error: error.message });
        }
    });
    let removedExpiredBlobs = 0;
    const blobDocs = new Map([...expiredBlobs.docs, ...legacyBlobs.docs]
        .filter((doc) => isOmrSubcollectionDoc(doc, 'omrBlobs'))
        .map((doc) => [doc.ref.path, doc]));
    await forEachWithConcurrency([...blobDocs.values()], CLEANUP_CONCURRENCY, async (doc) => {
        try {
            if (await cleanupOneExpiredBlob(doc)) removedExpiredBlobs += 1;
        } catch (error) {
            logger.error('[OMR cleanup] Không xóa được blob hết hạn', { path: doc.ref.path, error: error.message });
        }
    });
    let retriedBlobCleanup = 0;
    await forEachWithConcurrency(pendingBlobResults.docs, CLEANUP_CONCURRENCY, async (doc) => {
        const tenantRef = omrMemberRefFromSubcollectionDoc(doc, 'omrResults');
        if (!tenantRef) return;
        try {
            await purgeResultBlobs(tenantRef, doc.id);
            await doc.ref.set({
                blobCleanupPending: FieldValue.delete(),
                blobCleanupRetryAt: FieldValue.delete(),
                updatedAt: Timestamp.now(),
            }, { merge: true });
            retriedBlobCleanup += 1;
        } catch (error) {
            logger.error('[OMR cleanup] Chưa xóa được blob của tombstone', { path: doc.ref.path, error: error.message });
        }
    });
    const resultDocs = new Map(expired.docs
        .filter((doc) => isOmrSubcollectionDoc(doc, 'omrResults'))
        .map((doc) => [doc.ref.path, doc]));
    let removedResults = 0;
    await forEachWithConcurrency([...resultDocs.values()], CLEANUP_CONCURRENCY, async (doc) => {
        try {
            if (await cleanupOneResult(doc)) removedResults += 1;
        } catch (error) {
            logger.error('[OMR cleanup] Không xóa được kết quả', { path: doc.ref.path, error: error.message });
        }
    });
    let removedReservations = 0;
    await forEachWithConcurrency(reservations.docs, CLEANUP_CONCURRENCY, async (doc) => {
        const tenantRef = omrMemberRefFromSubcollectionDoc(doc, 'omrBlobs');
        if (!tenantRef) return;
        if (!['reserved', 'verifying', 'deletePending'].includes(doc.data().status)) return;
        if (doc.data().status === 'verifying' && timestampMillis(doc.data().verificationExpiresAt) > now.toMillis()) return;
        try {
            if (await rejectReservedBlob(tenantRef, doc.ref)) removedReservations += 1;
        } catch (error) {
            logger.error('[OMR cleanup] Không xóa được reservation', { path: doc.ref.path, error: error.message });
        }
    });
    const lightweightRefs = [
        ...workspaces.docs.filter((doc) => isOmrSubcollectionDoc(doc, 'omrWorkspace')),
        ...mutations.docs.filter((doc) => isOmrSubcollectionDoc(doc, 'omrMutations')),
    ].map((doc) => doc.ref);
    await deleteRefsInChunks(lightweightRefs);
    logger.info('[OMR cleanup] Hoàn tất', {
        removedResults,
        removedReservations,
        removedExpiredBlobs,
        retriedPendingBlobDeletes,
        retriedBlobCleanup,
        removedWorkspaces: workspaces.docs.filter((doc) => isOmrSubcollectionDoc(doc, 'omrWorkspace')).length,
        removedMetadata: mutations.docs.filter((doc) => isOmrSubcollectionDoc(doc, 'omrMutations')).length,
    });
});

Object.defineProperty(exports, '__test', {
    enumerable: false,
    value: {
        BLOB_RETENTION_MONTHS,
        CLEANUP_RESULTS_PER_RUN,
        OMR_PRODUCT_ID,
        addCalendarMonths,
        academicYearId,
        assertTenantActive,
        blobExpiryMillis,
        forEachWithConcurrency,
        isOmrSubcollectionPath,
        normalizeLimits,
        normalizeResult,
        normalizeUsage,
        normalizeWorkspace,
        isVerifiedOwner,
        tenantView,
        timestampMillis,
    },
});
