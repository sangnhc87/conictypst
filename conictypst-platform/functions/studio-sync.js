'use strict';

const crypto = require('crypto');
const { getFirestore, Timestamp } = require('firebase-admin/firestore');
const { onCall, HttpsError } = require('firebase-functions/v2/https');
const { onSchedule } = require('firebase-functions/v2/scheduler');
const { logger } = require('firebase-functions');
const { bootstrapOwnerEmails, PRODUCT_DEFINITIONS } = require('./lib/constants');

const REGION = 'asia-southeast1';
const STUDIO_PRODUCT_ID = 'studio';
const STORAGE_WORKER_URL = 'https://sang-math-studio-storage.nguyensangnhc.workers.dev';
const STORAGE_SECRETS = ['STUDIO_STORAGE_HMAC_SECRET'];
// Studio dành tối đa 5 GiB cho khoảng 100 tài khoản x 50 MiB. R2 Standard có
// 10 GB-tháng miễn phí; nếu các bucket khác đồng thời đạt trần thì phần vượt
// vẫn rất nhỏ, nhưng hard cap này ngăn chi phí tăng ngoài dự kiến.
const GLOBAL_R2_LIMIT_BYTES = 5 * 1024 ** 3;
const MAX_PROJECT_ARCHIVE_BYTES = 16 * 1024 ** 2;
const UPLOAD_RESERVATION_MS = 15 * 60 * 1000;

function db() {
    return getFirestore();
}

function memberRef(uid, database = db()) {
    return database.collection('products').doc(STUDIO_PRODUCT_ID).collection('members').doc(uid);
}

function budgetRef(database = db()) {
    return database.collection('systemBudgets').doc(STUDIO_PRODUCT_ID);
}

function requireAuth(request) {
    if (!request.auth?.uid) {
        throw new HttpsError('unauthenticated', 'Bạn cần đăng nhập Google để dùng Conic Studio Cloud.');
    }
    return request.auth;
}

function timestampMillis(value) {
    if (!value) return null;
    if (typeof value.toMillis === 'function') return value.toMillis();
    if (value instanceof Date) return value.getTime();
    const parsed = new Date(value).getTime();
    return Number.isFinite(parsed) ? parsed : null;
}

function activeStudioMember(data) {
    if (!data || data.status !== 'active') return false;
    const now = Date.now();
    const startsAt = timestampMillis(data.accessStartsAt);
    const endsAt = timestampMillis(data.accessEndsAt);
    return (startsAt === null || startsAt <= now) && (endsAt === null || endsAt > now);
}

function isSuperAdmin(auth) {
    const email = String(auth?.token?.email || '').trim().toLowerCase();
    return auth?.token?.email_verified === true && bootstrapOwnerEmails().has(email);
}

function hasStudioAccess(auth, member) {
    return isSuperAdmin(auth) || activeStudioMember(member);
}

function storageLimit(data) {
    return Math.max(0, Number(data?.limits?.storageBytes)
        || PRODUCT_DEFINITIONS.studio.defaultLimits.storageBytes);
}

function storageUsage(data) {
    return Math.max(0, Number(data?.usage?.storageBytes) || 0);
}

function validId(value, label = 'Mã') {
    const normalized = String(value || '').trim();
    if (!/^[A-Za-z0-9_-]{1,128}$/.test(normalized)) {
        throw new HttpsError('invalid-argument', `${label} không hợp lệ.`);
    }
    return normalized;
}

function validateProjectMetadata(data) {
    if (!data || typeof data !== 'object') throw new HttpsError('invalid-argument', 'Dữ liệu dự án không hợp lệ.');
    return {
        id: validId(data.id, 'Mã dự án'),
        name: String(data.name || 'Dự án Typst').trim().slice(0, 255),
        entryPath: String(data.entryPath || '/project/main.typ').slice(0, 255),
        templateId: String(data.templateId || '').slice(0, 100),
        templateVersion: Math.max(0, Number(data.templateVersion) || 0),
    };
}

function storageSecret() {
    const secret = String(process.env.STUDIO_STORAGE_HMAC_SECRET || '').trim();
    if (secret.length < 32) {
        throw new HttpsError('failed-precondition', 'Kho Studio Cloud chưa được cấu hình an toàn.');
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
    const response = await fetch(`${STORAGE_WORKER_URL}/${operation}`, {
        method,
        headers: { Authorization: `Bearer ${ticket}` },
    });
    const body = await response.json().catch(() => ({}));
    if (!response.ok) throw new Error(`Studio Storage ${operation} thất bại (${response.status}): ${body.error || 'unknown'}`);
    return body;
}

function rethrow(error, fallback) {
    if (error instanceof HttpsError) throw error;
    logger.error('[Studio Cloud]', { message: error?.message || String(error) });
    throw new HttpsError('internal', fallback);
}

// Tài khoản chưa được admin duyệt vẫn dùng đầy đủ Studio local, nhưng không có
// danh sách hay quota Cloud. Nội dung dự án không được lưu trong Firestore.
exports.studioGetProjects = onCall({ region: REGION, cors: true, maxInstances: 3 }, async (request) => {
    const auth = requireAuth(request);
    const database = db();
    try {
        const memberDoc = await memberRef(auth.uid, database).get();
        const member = memberDoc.exists ? memberDoc.data() : null;
        if (!hasStudioAccess(auth, member)) {
            return {
                ok: true,
                cloudEnabled: false,
                isPro: false,
                storageBytesLimit: 0,
                storageBytesUsed: 0,
                projects: [],
            };
        }
        const snapshot = await memberDoc.ref.collection('projects').orderBy('updatedAt', 'desc').get();
        const projects = snapshot.docs.map((document) => {
            const data = document.data();
            return {
                id: document.id,
                name: data.name,
                entryPath: data.entryPath,
                templateId: data.templateId,
                templateVersion: data.templateVersion,
                estimatedSizeBytes: Number(data.sizeBytes) || 0,
                createdAt: timestampMillis(data.createdAt),
                updatedAt: timestampMillis(data.updatedAt),
            };
        });
        return {
            ok: true,
            cloudEnabled: true,
            isPro: true,
            storageBytesLimit: storageLimit(member),
            storageBytesUsed: storageUsage(member),
            projects,
        };
    } catch (error) {
        rethrow(error, 'Không thể lấy danh sách dự án Studio Cloud.');
    }
});

exports.studioCreateUploadUrl = onCall({ region: REGION, cors: true, maxInstances: 3, secrets: STORAGE_SECRETS }, async (request) => {
    const auth = requireAuth(request);
    const project = validateProjectMetadata(request.data?.project);
    const sizeBytes = Number(request.data?.sizeBytes);
    const sha256 = String(request.data?.sha256 || '').toLowerCase();
    if (!Number.isInteger(sizeBytes) || sizeBytes < 1 || sizeBytes > MAX_PROJECT_ARCHIVE_BYTES) {
        throw new HttpsError('invalid-argument', 'Gói dự án phải nhỏ hơn 16 MB.');
    }
    if (!/^[a-f0-9]{64}$/.test(sha256)) throw new HttpsError('invalid-argument', 'SHA-256 không hợp lệ.');

    const database = db();
    const userRef = memberRef(auth.uid, database);
    const projectRef = userRef.collection('projects').doc(project.id);
    const uploadId = crypto.randomUUID();
    const uploadRef = userRef.collection('uploads').doc(uploadId);
    const objectKey = `studio/users/${auth.uid}/projects/${project.id}/${uploadId}.zip`;
    try {
        const reservation = await database.runTransaction(async (transaction) => {
            const [memberDoc, currentProjectDoc, budgetDoc] = await Promise.all([
                transaction.get(userRef),
                transaction.get(projectRef),
                transaction.get(budgetRef(database)),
            ]);
            const member = memberDoc.exists ? memberDoc.data() : null;
            if (!hasStudioAccess(auth, member)) {
                throw new HttpsError('permission-denied', 'Studio Cloud chỉ dành cho tài khoản đã được admin duyệt.');
            }
            if (currentProjectDoc.exists && currentProjectDoc.data().sha256 === sha256) {
                return {
                    skipped: true,
                    estimatedSizeBytes: Math.max(0, Number(currentProjectDoc.data().sizeBytes) || 0),
                    updatedAt: timestampMillis(currentProjectDoc.data().updatedAt),
                };
            }
            const oldBytes = currentProjectDoc.exists ? Math.max(0, Number(currentProjectDoc.data().sizeBytes) || 0) : 0;
            const projectedUserBytes = storageUsage(member) - oldBytes + sizeBytes;
            if (projectedUserBytes > storageLimit(member)) {
                throw new HttpsError('resource-exhausted', 'Dự án vượt dung lượng Studio Cloud được admin cấp.');
            }
            const budget = budgetDoc.exists ? budgetDoc.data() : {};
            const projectedGlobalBytes = Math.max(0, Number(budget.r2Bytes) || 0) - oldBytes + sizeBytes;
            if (projectedGlobalBytes > GLOBAL_R2_LIMIT_BYTES) {
                throw new HttpsError('resource-exhausted', 'Kho Studio Cloud đang gần đầy; vui lòng liên hệ admin.');
            }
            transaction.set(uploadRef, {
                id: uploadId,
                ownerUid: auth.uid,
                project,
                objectKey,
                expectedBytes: sizeBytes,
                sha256,
                createdAt: Timestamp.now(),
                reservationExpiresAt: Timestamp.fromMillis(Date.now() + UPLOAD_RESERVATION_MS),
            });
            return { skipped: false };
        });
        if (reservation.skipped) return { ok: true, ...reservation };
        const ticket = storageTicket('put', {
            uid: auth.uid,
            key: objectKey,
            bytes: sizeBytes,
            contentType: 'application/zip',
            sha256,
        });
        return {
            uploadId,
            uploadUrl: `${STORAGE_WORKER_URL}/put`,
            headers: { Authorization: `Bearer ${ticket}` },
            expiresInSeconds: 300,
        };
    } catch (error) {
        rethrow(error, 'Không thể chuẩn bị phiên tải dự án lên Cloud.');
    }
});

exports.studioCommitUpload = onCall({ region: REGION, cors: true, maxInstances: 3, secrets: STORAGE_SECRETS }, async (request) => {
    const auth = requireAuth(request);
    const uploadId = validId(request.data?.uploadId, 'Mã upload');
    const database = db();
    const userRef = memberRef(auth.uid, database);
    const uploadRef = userRef.collection('uploads').doc(uploadId);
    try {
        const uploadDoc = await uploadRef.get();
        if (!uploadDoc.exists) throw new HttpsError('not-found', 'Phiên upload không tồn tại hoặc đã hoàn tất.');
        const upload = uploadDoc.data();
        if (timestampMillis(upload.reservationExpiresAt) <= Date.now()) throw new HttpsError('deadline-exceeded', 'Phiên upload đã hết hạn.');
        const headTicket = storageTicket('head', { uid: auth.uid, key: upload.objectKey }, 120);
        const head = await storageWorkerJson('head', headTicket, 'POST');
        if (Number(head.bytes) !== Number(upload.expectedBytes) || String(head.sha256 || '') !== upload.sha256) {
            throw new HttpsError('data-loss', 'Kích thước hoặc checksum dự án trên Storage không khớp.');
        }

        const result = await database.runTransaction(async (transaction) => {
            const [freshUploadDoc, memberDoc, currentProjectDoc, budgetDoc] = await Promise.all([
                transaction.get(uploadRef),
                transaction.get(userRef),
                transaction.get(userRef.collection('projects').doc(upload.project.id)),
                transaction.get(budgetRef(database)),
            ]);
            if (!freshUploadDoc.exists) throw new HttpsError('aborted', 'Phiên upload đã được xử lý ở thiết bị khác.');
            const member = memberDoc.exists ? memberDoc.data() : null;
            if (!hasStudioAccess(auth, member)) throw new HttpsError('permission-denied', 'Tài khoản không còn quyền Studio Cloud.');
            const old = currentProjectDoc.exists ? currentProjectDoc.data() : null;
            const oldBytes = Math.max(0, Number(old?.sizeBytes) || 0);
            const nextUserBytes = storageUsage(member) - oldBytes + Number(head.bytes);
            const budget = budgetDoc.exists ? budgetDoc.data() : {};
            const nextGlobalBytes = Math.max(0, Number(budget.r2Bytes) || 0) - oldBytes + Number(head.bytes);
            if (nextUserBytes > storageLimit(member)) throw new HttpsError('resource-exhausted', 'Đã vượt dung lượng Studio Cloud được cấp.');
            if (nextGlobalBytes > GLOBAL_R2_LIMIT_BYTES) throw new HttpsError('resource-exhausted', 'Kho Studio Cloud đang gần đầy.');
            const now = Timestamp.now();
            const metadata = {
                ...upload.project,
                ownerUid: auth.uid,
                objectKey: upload.objectKey,
                sizeBytes: Number(head.bytes),
                sha256: upload.sha256,
                updatedAt: now,
                createdAt: old?.createdAt || now,
            };
            transaction.set(currentProjectDoc.ref, metadata);
            transaction.set(userRef, { usage: { ...(member.usage || {}), storageBytes: nextUserBytes }, studioUpdatedAt: now }, { merge: true });
            transaction.set(budgetRef(database), { r2Bytes: nextGlobalBytes, limitBytes: GLOBAL_R2_LIMIT_BYTES, updatedAt: now }, { merge: true });
            transaction.delete(uploadRef);
            return { metadata, oldObjectKey: old?.objectKey || '' };
        });

        if (result.oldObjectKey && result.oldObjectKey !== upload.objectKey) {
            const deleteTicket = storageTicket('delete', { uid: auth.uid, key: result.oldObjectKey }, 120);
            await storageWorkerJson('delete', deleteTicket, 'DELETE').catch((error) => {
                logger.warn('[Studio Cloud] Hoãn xóa bản dự án cũ', { uid: auth.uid, projectId: upload.project.id, message: error.message });
            });
        }
        return {
            ok: true,
            estimatedSizeBytes: result.metadata.sizeBytes,
            updatedAt: timestampMillis(result.metadata.updatedAt),
        };
    } catch (error) {
        rethrow(error, 'Không thể xác nhận dự án đã tải lên Cloud.');
    }
});

exports.studioCreateDownloadUrl = onCall({ region: REGION, cors: true, maxInstances: 3, secrets: STORAGE_SECRETS }, async (request) => {
    const auth = requireAuth(request);
    const projectId = validId(request.data?.projectId, 'Mã dự án');
    try {
        const userRef = memberRef(auth.uid);
        const [memberDoc, projectDoc] = await Promise.all([
            userRef.get(),
            userRef.collection('projects').doc(projectId).get(),
        ]);
        if (!hasStudioAccess(auth, memberDoc.exists ? memberDoc.data() : null)) throw new HttpsError('permission-denied', 'Tài khoản không có quyền Studio Cloud.');
        if (!projectDoc.exists) throw new HttpsError('not-found', 'Không tìm thấy dự án trên Cloud.');
        const ticket = storageTicket('get', { uid: auth.uid, key: projectDoc.data().objectKey }, 300);
        return {
            downloadUrl: `${STORAGE_WORKER_URL}/get`,
            headers: { Authorization: `Bearer ${ticket}` },
            expiresInSeconds: 300,
        };
    } catch (error) {
        rethrow(error, 'Không thể tạo đường dẫn tải dự án.');
    }
});

exports.studioDeleteProject = onCall({ region: REGION, cors: true, maxInstances: 3, secrets: STORAGE_SECRETS }, async (request) => {
    const auth = requireAuth(request);
    const projectId = validId(request.data?.projectId, 'Mã dự án');
    const database = db();
    const userRef = memberRef(auth.uid, database);
    const projectRef = userRef.collection('projects').doc(projectId);
    try {
        const [memberDoc, projectDoc] = await Promise.all([userRef.get(), projectRef.get()]);
        if (!hasStudioAccess(auth, memberDoc.exists ? memberDoc.data() : null)) throw new HttpsError('permission-denied', 'Tài khoản không có quyền Studio Cloud.');
        if (!projectDoc.exists) throw new HttpsError('not-found', 'Không tìm thấy dự án trên Cloud.');
        const project = projectDoc.data();
        const ticket = storageTicket('delete', { uid: auth.uid, key: project.objectKey }, 120);
        await storageWorkerJson('delete', ticket, 'DELETE');
        await database.runTransaction(async (transaction) => {
            const [freshMemberDoc, freshProjectDoc, budgetDoc] = await Promise.all([
                transaction.get(userRef), transaction.get(projectRef), transaction.get(budgetRef(database)),
            ]);
            if (!freshProjectDoc.exists) return;
            const bytes = Math.max(0, Number(freshProjectDoc.data().sizeBytes) || 0);
            const member = freshMemberDoc.data() || {};
            const budget = budgetDoc.exists ? budgetDoc.data() : {};
            transaction.delete(projectRef);
            transaction.set(userRef, { usage: { ...(member.usage || {}), storageBytes: Math.max(0, storageUsage(member) - bytes) }, studioUpdatedAt: Timestamp.now() }, { merge: true });
            transaction.set(budgetRef(database), { r2Bytes: Math.max(0, Number(budget.r2Bytes) || 0) - bytes, limitBytes: GLOBAL_R2_LIMIT_BYTES, updatedAt: Timestamp.now() }, { merge: true });
        });
        return { ok: true };
    } catch (error) {
        rethrow(error, 'Không thể xóa dự án khỏi Studio Cloud.');
    }
});

// Dọn các ZIP upload dở dang. Dự án đã commit dùng objectKey trong metadata nên
// không bị truy vấn này chạm tới.
exports.studioCleanupExpiredUploads = onSchedule({ region: REGION, schedule: 'every 24 hours', maxInstances: 1, secrets: STORAGE_SECRETS }, async () => {
    const snapshot = await db().collectionGroup('uploads')
        .where('reservationExpiresAt', '<=', Timestamp.now())
        .limit(200)
        .get();
    for (const document of snapshot.docs) {
        const upload = document.data();
        try {
            const ticket = storageTicket('delete', { uid: upload.ownerUid, key: upload.objectKey }, 120);
            await storageWorkerJson('delete', ticket, 'DELETE');
            await document.ref.delete();
        } catch (error) {
            logger.warn('[Studio Cloud] Chưa dọn được upload hết hạn', { uploadId: document.id, message: error.message });
        }
    }
});

// ── Thống kê Studio (số liệu THẬT, cập nhật định kỳ) ──────────────
// Đếm bằng count() aggregation (không đọc toàn bộ docs → rẻ và nhanh),
// rồi ghi vào doc công khai stats/studio để client đọc 1 lần mỗi phiên.
// KHÔNG lộ PII: chỉ tổng số giáo viên, số dự án, số bản Pro.
async function computeStudioStats(database = db()) {
    const membersCol = database.collection('products').doc(STUDIO_PRODUCT_ID).collection('members');
    let teachers = 0;
    let projects = 0;
    let proMembers = 0;
    try {
        teachers = (await membersCol.count().get()).data().count;
    } catch (error) {
        logger.warn('[Studio Stats] Không đếm được members', { message: error.message });
    }
    try {
        projects = (await database.collectionGroup('projects').count().get()).data().count;
    } catch (error) {
        logger.warn('[Studio Stats] Không đếm được projects', { message: error.message });
    }
    try {
        // Số bản Pro = member có entitlement còn hiệu lực (grantedAt tồn tại).
        proMembers = (await membersCol.where('status', '==', 'active').count().get()).data().count;
    } catch (error) {
        // Trường status có thể không tồn tại ở mọi bản ghi — bỏ qua, để proMembers = 0.
        logger.warn('[Studio Stats] Không đếm được proMembers', { message: error.message });
    }
    return { teachers, projects, proMembers };
}

async function writeStudioStats(database = db()) {
    const stats = await computeStudioStats(database);
    await database.collection('stats').doc('studio').set(
        { ...stats, updatedAt: Timestamp.now() },
        { merge: true },
    );
    return stats;
}

// Chạy nền mỗi 6 giờ để giữ số liệu tươi mà không tốn đọc mỗi lần mở web.
exports.studioRefreshStats = onSchedule({ region: REGION, schedule: 'every 6 hours', maxInstances: 1 }, async () => {
    const stats = await writeStudioStats();
    logger.info('[Studio Stats] Đã cập nhật', stats);
});

// Callable cho client: trả số liệu từ cache stats/studio; chỉ tính lại nếu cache
// quá 1 giờ (tránh chạy count() mỗi lần mở web). Scheduled function vẫn làm mới nền.
const STATS_MAX_AGE_MS = 60 * 60 * 1000;
exports.studioGetStats = onCall({ region: REGION, cors: true, maxInstances: 3 }, async () => {
    const database = db();
    const cached = await database.collection('stats').doc('studio').get();
    if (cached.exists) {
        const data = cached.data();
        const ageMs = Date.now() - timestampMillis(data.updatedAt);
        if (ageMs < STATS_MAX_AGE_MS) {
            return { ok: true, teachers: data.teachers || 0, projects: data.projects || 0, proMembers: data.proMembers || 0, cached: true };
        }
    }
    const stats = await writeStudioStats(database);
    return { ok: true, ...stats, cached: false };
});
