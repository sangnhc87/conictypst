(function () {
    'use strict';

    const FIREBASE_VERSION = '9.10.0';
    const FIREBASE_BASE = `https://www.gstatic.com/firebasejs/${FIREBASE_VERSION}`;
    const FIREBASE_CONFIG = Object.freeze({
        apiKey: 'AIzaSyAOjWhQD6DsrInCKgsfTKoZST6wHWavB_c',
        authDomain: 'conictypst-platform.firebaseapp.com',
        projectId: 'conictypst-platform',
        storageBucket: 'conictypst-platform.firebasestorage.app',
        messagingSenderId: '247634082918',
        appId: '1:247634082918:web:373969616934306f8441a7'
    });
    const IDENTITY_FIREBASE_CONFIG = Object.freeze({
        apiKey: 'AIzaSyDwbd6q4EHUp_JouOD5K1a96yNxq_RTTfc',
        authDomain: 'conicgv.firebaseapp.com',
        projectId: 'conicgv',
        storageBucket: 'conicgv.firebasestorage.app',
        messagingSenderId: '777103975965',
        appId: '1:777103975965:web:00f564c7f00de09698c8f4'
    });
    const APP_NAME = 'sang-math-omr-cloud';
    const IDENTITY_APP_NAME = 'conictypst-google-identity';
    const REGION = 'asia-southeast1';
    const ENABLED_KEY = 'omr_cloud_enabled_v1';
    const IMAGE_SYNC_KEY = 'omr_cloud_image_sync_v1';
    const DEVICE_OWNER_PROJECT_KEY = 'device-owner-project';
    const MAX_PULL_PAGES = 20;
    const OWNER_EMAIL = 'nguyensangnhc@gmail.com';

    const state = {
        sdkPromise: null,
        app: null,
        auth: null,
        functions: null,
        identityApp: null,
        identityAuth: null,
        identityUser: null,
        platformUser: null,
        exchangePromise: null,
        user: null,
        tenant: null,
        isAdmin: false,
        boundUid: null,
        accountConflict: false,
        syncPromise: null,
        syncHadOperationError: false,
        lastSyncAt: null,
        lastError: '',
        panelOpen: false,
        initialized: false
    };

    function cloudEnabled() {
        return localStorage.getItem(ENABLED_KEY) === '1';
    }

    function imageSyncEnabled() {
        return cloudImageAllowed() && localStorage.getItem(IMAGE_SYNC_KEY) === '1';
    }

    function cloudImageAllowed() {
        return state.tenant?.cloudImageEnabled === true
            || state.tenant?.limits?.cloudImageEnabled === true;
    }

    function isOwnerAccount(user = state.user) {
        return String(user?.email || '').trim().toLowerCase() === OWNER_EMAIL;
    }

    function canManageTeachers() {
        return state.isAdmin === true && isOwnerAccount();
    }

    function loadScript(src) {
        return new Promise((resolve, reject) => {
            const existing = document.querySelector(`script[data-omr-cloud-src="${src}"]`);
            if (existing) {
                if (existing.dataset.loaded === '1') resolve();
                else {
                    existing.addEventListener('load', resolve, { once: true });
                    existing.addEventListener('error', reject, { once: true });
                }
                return;
            }
            const script = document.createElement('script');
            script.src = src;
            script.async = false;
            script.dataset.omrCloudSrc = src;
            script.addEventListener('load', () => {
                script.dataset.loaded = '1';
                resolve();
            }, { once: true });
            script.addEventListener('error', () => reject(new Error(`Không tải được ${src}`)), { once: true });
            document.head.appendChild(script);
        });
    }

    async function ensureFirebase() {
        if (state.app) return state.app;
        if (state.sdkPromise) return state.sdkPromise;
        state.sdkPromise = (async () => {
            await loadScript(`${FIREBASE_BASE}/firebase-app-compat.js`);
            await loadScript(`${FIREBASE_BASE}/firebase-auth-compat.js`);
            await loadScript(`${FIREBASE_BASE}/firebase-functions-compat.js`);
            const existing = firebase.apps.find(app => app.name === APP_NAME);
            state.app = existing || firebase.initializeApp(FIREBASE_CONFIG, APP_NAME);
            const existingIdentity = firebase.apps.find(app => app.name === IDENTITY_APP_NAME);
            state.identityApp = existingIdentity || firebase.initializeApp(IDENTITY_FIREBASE_CONFIG, IDENTITY_APP_NAME);
            state.auth = state.app.auth();
            state.identityAuth = state.identityApp.auth();
            state.functions = state.app.functions(REGION);
            await Promise.all([
                state.auth.setPersistence(firebase.auth.Auth.Persistence.LOCAL),
                state.identityAuth.setPersistence(firebase.auth.Auth.Persistence.LOCAL)
            ]);
            state.auth.onAuthStateChanged(handlePlatformAuthState);
            state.identityAuth.onAuthStateChanged(handleIdentityAuthState);
            state.identityAuth.getRedirectResult().catch(error => {
                state.lastError = firebaseErrorMessage(error);
                updateUi();
            });
            return state.app;
        })().catch(error => {
            state.sdkPromise = null;
            throw error;
        });
        return state.sdkPromise;
    }

    function callable(name) {
        if (!state.functions) throw new Error('Firebase chưa sẵn sàng.');
        return state.functions.httpsCallable(name);
    }

    async function call(name, payload = {}) {
        const response = await callable(name)(payload);
        return response?.data || {};
    }

    function firebaseErrorMessage(error) {
        const code = String(error?.code || '');
        if (code.includes('unauthorized-domain')) {
            return 'Tên miền chấm thi chưa được thêm vào Firebase Auth Authorized domains.';
        }
        if (code.includes('popup-blocked')) return 'Trình duyệt đã chặn cửa sổ đăng nhập Google.';
        if (code.includes('network-request-failed')) return 'Mạng đang gián đoạn; dữ liệu vẫn được giữ trên máy.';
        if (code.includes('permission-denied')) return error?.message || 'Tài khoản chưa được admin cấp quyền OMR.';
        return error?.message || String(error || 'Lỗi không xác định');
    }

    async function signIn() {
        await ensureFirebase();
        if (state.identityAuth.currentUser) {
            await ensurePlatformSession(state.identityAuth.currentUser);
            return;
        }
        const provider = new firebase.auth.GoogleAuthProvider();
        provider.setCustomParameters({ prompt: 'select_account' });
        try {
            await state.identityAuth.signInWithPopup(provider);
        } catch (error) {
            if (['auth/popup-blocked', 'auth/operation-not-supported-in-this-environment'].includes(error?.code)) {
                await state.identityAuth.signInWithRedirect(provider);
                return;
            }
            state.lastError = firebaseErrorMessage(error);
            updateUi();
            throw error;
        }
    }

    async function signOut() {
        await Promise.all([
            state.auth?.signOut?.(),
            state.identityAuth?.signOut?.()
        ]);
    }

    async function ensurePlatformSession(identityUser) {
        if (!identityUser || !state.auth || !state.functions) return;
        if (state.auth.currentUser?.uid === identityUser.uid
            && String(state.auth.currentUser.email || '').toLowerCase() === String(identityUser.email || '').toLowerCase()) {
            state.platformUser = state.auth.currentUser;
            return state.auth.currentUser;
        }
        if (state.exchangePromise) return state.exchangePromise;
        state.exchangePromise = (async () => {
            if (state.auth.currentUser) await state.auth.signOut();
            const idToken = await identityUser.getIdToken(true);
            const response = await call('ctExchangeConicgvToken', { idToken });
            if (!response.customToken) throw new Error('Máy chủ chưa trả phiên đăng nhập ConicTypst.');
            const credential = await state.auth.signInWithCustomToken(response.customToken);
            state.platformUser = credential.user;
            return credential.user;
        })().catch(error => {
            state.lastError = firebaseErrorMessage(error);
            updateUi();
            throw error;
        }).finally(() => {
            state.exchangePromise = null;
        });
        return state.exchangePromise;
    }

    async function handleIdentityAuthState(user) {
        state.identityUser = user || null;
        if (!user) {
            state.platformUser = null;
            await state.auth?.signOut?.().catch(() => undefined);
            await handleAuthState(null);
            return;
        }
        try {
            await ensurePlatformSession(user);
            const platformUser = state.auth?.currentUser;
            if (platformUser?.uid === user.uid
                && String(platformUser.email || '').toLowerCase() === String(user.email || '').toLowerCase()) {
                await handleAuthState(platformUser);
            }
        } catch (_) {
            // ensurePlatformSession đã ghi lỗi có thể đọc được cho UI.
        }
    }

    async function handlePlatformAuthState(user) {
        state.platformUser = user || null;
        if (!user) {
            if (!state.identityUser) await handleAuthState(null);
            return;
        }
        const identityUser = state.identityUser;
        if (!identityUser) return;
        if (user.uid !== identityUser.uid
            || String(user.email || '').toLowerCase() !== String(identityUser.email || '').toLowerCase()) {
            await state.auth.signOut().catch(() => undefined);
            return;
        }
        await handleAuthState(user);
    }

    async function requestAccess() {
        if (!state.user) return signIn();
        try {
            const response = await call('omrRequestAccess', {
                displayName: state.user.displayName || '',
                source: location.hostname
            });
            state.tenant = response.tenant || { status: response.status || 'pending' };
            state.lastError = '';
            updateUi();
        } catch (error) {
            state.lastError = firebaseErrorMessage(error);
            updateUi();
        }
    }

    function isTenantActive(tenant = state.tenant) {
        if (!tenant || tenant.status !== 'active') return false;
        const expiry = dateValue(tenant.accessExpiresAt || tenant.accessEndsAt);
        return !expiry || expiry > Date.now();
    }

    function dateValue(value) {
        if (!value) return 0;
        if (typeof value === 'number') return value;
        if (typeof value === 'string') return Date.parse(value) || 0;
        if (typeof value.toMillis === 'function') return value.toMillis();
        if (typeof value._seconds === 'number') return value._seconds * 1000;
        if (typeof value.seconds === 'number') return value.seconds * 1000;
        return 0;
    }

    function cleanForCloud(value) {
        if (Array.isArray(value)) return value.map(cleanForCloud).filter(item => item !== undefined);
        if (value && typeof value === 'object') {
            const output = {};
            Object.entries(value).forEach(([key, item]) => {
                if (item === undefined || typeof item === 'function') return;
                if (key === 'imageDataURL' || key === 'rawImageDataURL' || key === 'file' || key === 'imgEl') return;
                const cleaned = cleanForCloud(item);
                if (cleaned !== undefined) output[key] = cleaned;
            });
            return output;
        }
        if (typeof value === 'number' && !Number.isFinite(value)) return null;
        return value;
    }

    function resultMetadata(result) {
        const cleaned = cleanForCloud(result || {});
        delete cleaned.cloudBlobId;
        delete cleaned.cloudImageSyncedAt;
        cleaned.id = String(result?.id || '');
        cleaned.clientUpdatedAt = Date.now();
        return cleaned;
    }

    function operationRevision() {
        return self.crypto?.randomUUID?.() || `${Date.now()}-${Math.random().toString(36).slice(2)}`;
    }

    function currentSyncUid() {
        if (!state.user?.uid || state.accountConflict || state.boundUid !== state.user.uid) return '';
        return state.user.uid;
    }

    async function ensureDeviceBinding(uid) {
        if (!uid || !window.OMRDB) return false;
        const stored = String(await window.OMRDB.getCloudState('device-owner-uid') || '');
        const storedProject = String(await window.OMRDB.getCloudState(DEVICE_OWNER_PROJECT_KEY) || '');
        if (!stored) {
            await window.OMRDB.setCloudState('device-owner-uid', uid);
            await window.OMRDB.setCloudState(DEVICE_OWNER_PROJECT_KEY, FIREBASE_CONFIG.projectId);
            state.boundUid = uid;
            state.accountConflict = false;
            return true;
        }
        if (!storedProject || storedProject === 'conicgv') {
            // Bản cloud trước dùng Firebase project conicgv và chưa lưu project
            // trong binding. Cloud cũ không có tenant/result nên chuyển một lần
            // sang UID mới, đồng thời xếp lại dữ liệu local để upload an toàn.
            const oldQueue = await window.OMRDB.getSyncQueue(stored, true).catch(() => []);
            for (const operation of oldQueue) {
                await window.OMRDB.deleteSyncOperation(operation.id).catch(() => {});
            }
            const results = await window.OMRDB.getAllResults().catch(() => []);
            for (const result of results) {
                if (!result?.cloudBlobId && !result?.cloudImageSyncedAt) continue;
                delete result.cloudBlobId;
                delete result.cloudImageSyncedAt;
                await window.OMRDB.saveResult(result);
            }
            await window.OMRDB.setCloudState('device-owner-uid', uid);
            await window.OMRDB.setCloudState(DEVICE_OWNER_PROJECT_KEY, FIREBASE_CONFIG.projectId);
            await window.OMRDB.setCloudState('device-binding-migrated-v1', {
                fromUid: stored,
                migratedAt: Date.now()
            });
            state.boundUid = uid;
            state.accountConflict = false;
            return true;
        }
        if (storedProject !== FIREBASE_CONFIG.projectId) {
            state.accountConflict = true;
            state.lastError = 'Dữ liệu trên trình duyệt đang gắn với một hệ thống tài khoản khác. Đồng bộ đã bị khóa để tránh trộn bài; hãy liên hệ admin để chuyển an toàn.';
            return false;
        }
        state.boundUid = stored;
        state.accountConflict = stored !== uid;
        if (state.accountConflict) {
            state.lastError = 'Thiết bị này đang gắn với một tài khoản Google khác. Đồng bộ đã bị khóa để không trộn dữ liệu giáo viên; hãy đăng xuất và dùng đúng tài khoản.';
            return false;
        }
        return true;
    }

    async function queueResult(result) {
        const ownerUid = currentSyncUid();
        if (!cloudEnabled() || !ownerUid || !result?.id || !window.OMRDB) return;
        const revision = operationRevision();
        await window.OMRDB.queueSync({
            id: `${ownerUid}:result:${result.id}`,
            kind: 'result',
            ownerUid,
            resultId: result.id,
            payload: resultMetadata(result),
            revision,
            clientMutationId: mutationId('result'),
            queuedAt: Date.now()
        });
        if (imageSyncEnabled() && result.imageDataURL && !result.cloudBlobId) {
            await window.OMRDB.queueSync({
                id: `${ownerUid}:image:${result.id}`,
                kind: 'image',
                ownerUid,
                resultId: result.id,
                revision: operationRevision(),
                clientMutationId: mutationId('image'),
                queuedAt: Date.now()
            });
        }
        scheduleSync();
    }

    async function queueDelete(resultId) {
        const ownerUid = currentSyncUid();
        if (!cloudEnabled() || !ownerUid || !resultId || !window.OMRDB) return;
        await window.OMRDB.deleteSyncOperation(`${ownerUid}:result:${resultId}`).catch(() => {});
        await window.OMRDB.deleteSyncOperation(`${ownerUid}:image:${resultId}`).catch(() => {});
        await window.OMRDB.queueSync({
            id: `${ownerUid}:delete:${resultId}`,
            kind: 'delete',
            ownerUid,
            resultId,
            revision: operationRevision(),
            clientMutationId: mutationId('delete'),
            queuedAt: Date.now()
        });
        scheduleSync();
    }

    async function queueWorkspace() {
        const ownerUid = currentSyncUid();
        if (!cloudEnabled() || !ownerUid || !window.OMRDB || !window.OMRCloudLocal?.getWorkspace) return;
        const baseSyncVersion = Number(await window.OMRDB.getCloudState(`workspace-version:${ownerUid}`)) || 0;
        await window.OMRDB.queueSync({
            id: `${ownerUid}:workspace:current`,
            kind: 'workspace',
            ownerUid,
            payload: cleanForCloud(window.OMRCloudLocal.getWorkspace()),
            baseSyncVersion,
            revision: operationRevision(),
            clientMutationId: mutationId('workspace'),
            queuedAt: Date.now()
        });
        scheduleSync();
    }

    function mutationId(prefix) {
        return `${prefix}-${self.crypto?.randomUUID?.() || `${Date.now()}-${Math.random().toString(36).slice(2)}`}`;
    }

    async function enqueueInitialData() {
        if (!window.OMRDB || !state.user) return;
        const key = `initial-sync:${state.user.uid}`;
        if (await window.OMRDB.getCloudState(key)) return;
        await queueWorkspace();
        const results = window.OMRCloudLocal?.getResults?.() || [];
        for (const result of results) await queueResult(result);
        await window.OMRDB.setCloudState(key, { queuedAt: Date.now() });
    }

    async function enqueueMissingImages() {
        const ownerUid = currentSyncUid();
        if (!window.OMRDB || !ownerUid || !imageSyncEnabled()) return;
        const results = await window.OMRDB.getAllResults();
        for (const result of results) {
            if (!result?.id || !result.imageDataURL || result.cloudBlobId) continue;
            await window.OMRDB.queueSync({
                id: `${ownerUid}:image:${result.id}`,
                kind: 'image',
                ownerUid,
                resultId: result.id,
                revision: operationRevision(),
                clientMutationId: mutationId('image'),
                queuedAt: Date.now()
            });
        }
    }

    async function stableBatchMutationId(operations) {
        const source = operations.map(item => `${item.id}:${item.revision}`).sort().join('|');
        if (self.crypto?.subtle) {
            const digest = await self.crypto.subtle.digest('SHA-256', new TextEncoder().encode(source));
            const hex = [...new Uint8Array(digest)].map(value => value.toString(16).padStart(2, '0')).join('');
            return `results-${hex}`;
        }
        let hash = 2166136261;
        for (let index = 0; index < source.length; index += 1) hash = Math.imul(hash ^ source.charCodeAt(index), 16777619);
        return `results-${(hash >>> 0).toString(16)}-${source.length}`;
    }

    async function markOperationFailure(operation, error) {
        const message = firebaseErrorMessage(error);
        state.syncHadOperationError = true;
        state.lastError = message;
        await window.OMRDB.markSyncFailure(operation.id, operation.revision, message).catch(() => {});
    }

    async function applySyncedResults(slice, changes) {
        if (!Array.isArray(changes)) return;
        const deletedById = new Map();
        for (const item of slice) {
            const removed = await window.OMRDB.deleteSyncOperation(item.id, item.revision);
            deletedById.set(String(item.resultId), removed);
            const change = changes.find(candidate => String(candidate?.id || '') === String(item.resultId));
            if (!removed && change && !change.conflict && !change.deletedAt && !change.isDeleted && change.syncVersion) {
                await window.OMRDB.rebaseSyncOperation(item.id, item.revision, change.syncVersion);
            }
        }
        const ownerUid = currentSyncUid();
        const applicable = [];
        for (const change of changes) {
            const id = String(change?.id || '');
            const tombstone = Boolean(change?.deletedAt || change?.isDeleted);
            if (tombstone && ownerUid && id) {
                await window.OMRDB.deleteSyncOperation(`${ownerUid}:result:${id}`).catch(() => {});
                await window.OMRDB.deleteSyncOperation(`${ownerUid}:image:${id}`).catch(() => {});
                applicable.push(change);
            } else if (deletedById.get(id)) {
                applicable.push(change);
            }
        }
        if (applicable.length && window.OMRCloudLocal?.applyResultChanges) {
            await window.OMRCloudLocal.applyResultChanges(applicable);
        }
    }

    async function syncResultSlice(slice) {
        const response = await call('omrSyncResults', {
            results: slice.map(item => ({
                ...item.payload,
                baseSyncVersion: Number(item.payload?.syncVersion) || 0
            })),
            clientMutationId: await stableBatchMutationId(slice)
        });
        await applySyncedResults(slice, response.synced || []);
    }

    async function processResultOperations(operations) {
        for (let index = 0; index < operations.length; index += 25) {
            const slice = operations.slice(index, index + 25);
            try {
                await syncResultSlice(slice);
            } catch (error) {
                if (slice.length === 1) {
                    await markOperationFailure(slice[0], error);
                    continue;
                }
                for (const item of slice) {
                    try {
                        await syncResultSlice([item]);
                    } catch (itemError) {
                        await markOperationFailure(item, itemError);
                    }
                }
            }
        }
    }

    async function purgeExpiredLocalResults() {
        const results = window.OMRCloudLocal?.getResults?.() || [];
        const expired = results.filter(result => dateValue(result.expiresAt) > 0 && dateValue(result.expiresAt) <= Date.now());
        if (!expired.length || !window.OMRCloudLocal?.applyResultChanges) return;
        await window.OMRCloudLocal.applyResultChanges(expired.map(result => ({
            id: result.id,
            isDeleted: true,
            deletedAt: new Date().toISOString()
        })));
    }

    async function sha256Hex(blob) {
        if (!crypto?.subtle) return '';
        const digest = await crypto.subtle.digest('SHA-256', await blob.arrayBuffer());
        return [...new Uint8Array(digest)].map(value => value.toString(16).padStart(2, '0')).join('');
    }

    async function processImageOperation(operation) {
        const all = await window.OMRDB.getAllResults();
        const result = all.find(item => item.id === operation.resultId);
        if (!result?.imageDataURL) {
            await window.OMRDB.deleteSyncOperation(operation.id, operation.revision);
            return;
        }
        if (result.cloudBlobId) {
            await window.OMRDB.deleteSyncOperation(operation.id, operation.revision);
            return;
        }
        const blob = await fetch(result.imageDataURL).then(response => response.blob());
        const contentType = blob.type === 'image/png' ? 'image/png' : 'image/jpeg';
        const reservation = await call('omrCreateUploadUrl', {
            resultId: operation.resultId,
            kind: 'annotated',
            contentType,
            sizeBytes: blob.size,
            sha256: await sha256Hex(blob)
        });
        const uploadUrl = reservation.uploadUrl || reservation.url;
        if (!uploadUrl || !reservation.uploadId) throw new Error('Server chưa trả URL tải ảnh riêng tư.');
        const headers = { 'Content-Type': contentType, ...(reservation.headers || {}) };
        const uploadResponse = await fetch(uploadUrl, { method: 'PUT', headers, body: blob });
        if (!uploadResponse.ok) throw new Error(`Tải ảnh lên R2 thất bại (${uploadResponse.status}).`);
        const committed = await call('omrCommitUpload', {
            uploadId: reservation.uploadId,
            resultId: operation.resultId
        });
        result.cloudBlobId = committed.blobId || reservation.blobId || reservation.uploadId;
        result.cloudImageSyncedAt = Date.now();
        await window.OMRDB.saveResult(result);
        await window.OMRDB.deleteSyncOperation(operation.id, operation.revision);
    }

    function blobToDataUrl(blob) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.onload = () => resolve(String(reader.result || ''));
            reader.onerror = () => reject(reader.error || new Error('Không đọc được ảnh R2.'));
            reader.readAsDataURL(blob);
        });
    }

    async function fetchResultImage(result) {
        if (!result?.cloudBlobId) return result?.imageDataURL || '';
        if (result.imageDataURL) return result.imageDataURL;
        await ensureFirebase();
        if (!state.user || !isTenantActive()) throw new Error('Tài khoản OMR chưa sẵn sàng để tải ảnh.');
        const signed = await call('omrCreateDownloadUrl', { blobId: result.cloudBlobId });
        if (!signed.url) throw new Error('Server không trả URL ảnh riêng tư.');
        const response = await fetch(signed.url, { cache: 'no-store', headers: signed.headers || {} });
        if (!response.ok) throw new Error(`Không tải được ảnh bài chấm (${response.status}).`);
        const blob = await response.blob();
        if (!/^image\/(jpeg|png)$/i.test(blob.type) || blob.size > 12 * 1024 * 1024) {
            throw new Error('Tệp trả về không phải ảnh OMR hợp lệ.');
        }
        result.imageDataURL = await blobToDataUrl(blob);
        await window.OMRDB?.saveResult?.(result);
        return result.imageDataURL;
    }

    async function processOutbox() {
        const ownerUid = currentSyncUid();
        if (!window.OMRDB || !ownerUid) return;
        const queue = await window.OMRDB.getSyncQueue(ownerUid);
        // Xóa luôn được ưu tiên; một workspace lỗi quota không được phép chặn xóa dữ liệu.
        for (const item of queue.filter(item => item.kind === 'delete')) {
            try {
                await call('omrDeleteResult', {
                    resultId: item.resultId,
                    clientMutationId: item.clientMutationId
                });
                await window.OMRDB.deleteSyncOperation(item.id, item.revision);
            } catch (error) {
                await markOperationFailure(item, error);
            }
        }
        for (const item of queue.filter(item => item.kind === 'workspace')) {
            try {
                const response = await call('omrSyncWorkspace', {
                    workspace: item.payload,
                    baseSyncVersion: Number(item.baseSyncVersion) || 0,
                    clientMutationId: item.clientMutationId
                });
                const removed = await window.OMRDB.deleteSyncOperation(item.id, item.revision);
                if (!removed && !response.conflict && response.syncVersion) {
                    await window.OMRDB.rebaseSyncOperation(item.id, item.revision, response.syncVersion);
                }
                if (removed && response.conflict && response.workspace && window.OMRCloudLocal?.applyWorkspace) {
                    window.OMRCloudLocal.applyWorkspace(response.workspace, { initial: false });
                }
                if (removed && response.syncVersion) {
                    await window.OMRDB.setCloudState(`workspace-version:${ownerUid}`, Number(response.syncVersion) || 0);
                }
            } catch (error) {
                await markOperationFailure(item, error);
            }
        }
        await processResultOperations(queue.filter(item => item.kind === 'result'));
        const imageOperations = queue.filter(item => item.kind === 'image');
        if (!cloudImageAllowed()) {
            for (const item of imageOperations) {
                await window.OMRDB.deleteSyncOperation(item.id, item.revision).catch(() => {});
            }
        } else if (imageSyncEnabled()) {
            for (const item of imageOperations) {
                try {
                    await processImageOperation(item);
                } catch (error) {
                    await markOperationFailure(item, error);
                }
            }
        }
    }

    async function pullChanges() {
        if (!state.user || !window.OMRDB) return;
        const cursorKey = `cursor:${state.user.uid}`;
        let cursor = Number(await window.OMRDB.getCloudState(cursorKey)) || 0;
        for (let page = 0; page < MAX_PULL_PAGES; page += 1) {
            const bootstrap = await call('omrGetBootstrap', { cursor });
            state.tenant = bootstrap.tenant || { status: bootstrap.status || 'unregistered' };
            state.isAdmin = bootstrap.isAdmin === true;
            if (!isTenantActive()) return;
            if (bootstrap.workspace && window.OMRCloudLocal?.applyWorkspace) {
                const workspaceVersion = Number(bootstrap.workspace.syncVersion || 0);
                const localVersion = Number(await window.OMRDB.getCloudState(`workspace-version:${state.user.uid}`)) || 0;
                if (workspaceVersion > localVersion) {
                    await window.OMRDB.setCloudState(`workspace-version:${state.user.uid}`, workspaceVersion);
                    window.OMRCloudLocal.applyWorkspace(bootstrap.workspace, { initial: localVersion === 0 });
                }
            }
            const changes = Array.isArray(bootstrap.changes) ? bootstrap.changes : [];
            if (changes.length && window.OMRCloudLocal?.applyResultChanges) {
                const ownerUid = currentSyncUid();
                for (const change of changes) {
                    if (!ownerUid || !(change?.deletedAt || change?.isDeleted) || !change?.id) continue;
                    await window.OMRDB.deleteSyncOperation(`${ownerUid}:result:${change.id}`).catch(() => {});
                    await window.OMRDB.deleteSyncOperation(`${ownerUid}:image:${change.id}`).catch(() => {});
                }
                await window.OMRCloudLocal.applyResultChanges(changes);
            }
            const nextCursor = Number(bootstrap.nextCursor ?? bootstrap.cursor ?? cursor);
            if (nextCursor > cursor) {
                cursor = nextCursor;
                await window.OMRDB.setCloudState(cursorKey, cursor);
            }
            if (!bootstrap.hasMore || nextCursor <= cursor && !changes.length) break;
        }
    }

    async function syncNow() {
        if (state.syncPromise) return state.syncPromise;
        state.syncPromise = (async () => {
            if (!navigator.onLine) throw new Error('Đang ngoại tuyến; tác vụ đã được xếp hàng trên máy.');
            await ensureFirebase();
            if (!state.user) throw new Error('Hãy đăng nhập Google để đồng bộ.');
            updateUi('syncing');
            await purgeExpiredLocalResults();
            if (!await ensureDeviceBinding(state.user.uid)) throw new Error(state.lastError);
            await pullChanges();
            const tenantStatus = String(state.tenant?.status || 'unregistered');
            if (!isTenantActive() && canManageTeachers()
                && !['suspended', 'deletion_scheduled'].includes(tenantStatus)) {
                const response = await call('omrRequestAccess', {
                    displayName: state.user.displayName || '',
                    source: location.hostname
                });
                state.tenant = response.tenant || { status: response.status || 'pending' };
            }
            if (!isTenantActive()) {
                updateUi();
                return;
            }
            await enqueueInitialData();
            state.syncHadOperationError = false;
            await processOutbox();
            await pullChanges();
            state.lastSyncAt = Date.now();
            if (!state.syncHadOperationError) state.lastError = '';
            updateUi();
        })().catch(error => {
            state.lastError = firebaseErrorMessage(error);
            updateUi();
            throw error;
        }).finally(() => {
            state.syncPromise = null;
        });
        return state.syncPromise;
    }

    let syncTimer = null;
    function scheduleSync(delay = 1200) {
        clearTimeout(syncTimer);
        if (!cloudEnabled() || !state.user || !isTenantActive() || !navigator.onLine) return;
        syncTimer = setTimeout(() => syncNow().catch(() => {}), delay);
    }

    async function handleAuthState(user) {
        if (user && state.user?.uid === user.uid) {
            updateUi();
            return;
        }
        if (!user && !state.user) {
            updateUi();
            return;
        }
        state.user = user || null;
        state.tenant = null;
        state.isAdmin = false;
        state.lastError = '';
        state.accountConflict = false;
        state.boundUid = null;
        if (user) {
            localStorage.setItem(ENABLED_KEY, '1');
            try {
                if (!await ensureDeviceBinding(user.uid)) {
                    updateUi();
                    return;
                }
                await syncNow();
            } catch (error) {
                const code = String(error?.code || '');
                if (code.includes('not-found') || code.includes('failed-precondition')) {
                    state.tenant = { status: 'pending' };
                } else {
                    state.lastError = firebaseErrorMessage(error);
                }
            }
        }
        updateUi();
    }

    function formatBytes(bytes) {
        const value = Number(bytes) || 0;
        if (value < 1024) return `${value} B`;
        const units = ['KB', 'MB', 'GB', 'TB'];
        let current = value / 1024;
        let index = 0;
        while (current >= 1024 && index < units.length - 1) {
            current /= 1024;
            index += 1;
        }
        return `${current.toFixed(current >= 10 ? 1 : 2)} ${units[index]}`;
    }

    function formatDate(value) {
        const millis = dateValue(value);
        return millis ? new Date(millis).toLocaleDateString('vi-VN') : '—';
    }

    function ensureUi() {
        if (document.getElementById('omrCloudButton')) return;
        const style = document.createElement('style');
        style.textContent = `
          .omr-cloud-button{display:inline-flex;align-items:center;gap:6px;border:1px solid #cbd5e1;border-radius:999px;background:#fff;color:#334155;padding:7px 11px;font:700 11px/1 Inter,sans-serif;cursor:pointer;white-space:nowrap}.omr-cloud-button[data-state="active"]{color:#047857;border-color:#6ee7b7;background:#ecfdf5}.omr-cloud-button[data-state="syncing"]{color:#1d4ed8;border-color:#93c5fd;background:#eff6ff}.omr-cloud-button[data-state="error"]{color:#b91c1c;border-color:#fecaca;background:#fef2f2}.omr-cloud-panel{position:fixed;inset:0;z-index:20000;display:none;align-items:center;justify-content:center;padding:16px;background:rgba(15,23,42,.58);backdrop-filter:blur(5px)}.omr-cloud-panel.open{display:flex}.omr-cloud-card{width:min(94vw,520px);max-height:88vh;overflow:auto;border:1px solid #dbeafe;border-radius:20px;background:#fff;padding:22px;box-shadow:0 30px 80px rgba(15,23,42,.28)}.omr-cloud-head{display:flex;align-items:flex-start;justify-content:space-between;gap:12px;margin-bottom:16px}.omr-cloud-head h2{margin:0;color:#0f172a;font-size:20px}.omr-cloud-head p{margin:5px 0 0;color:#64748b;font-size:12px}.omr-cloud-close{border:0;background:#f1f5f9;border-radius:9px;width:34px;height:34px;cursor:pointer}.omr-cloud-info{display:grid;grid-template-columns:1fr 1fr;gap:9px;margin:14px 0}.omr-cloud-metric{padding:11px;border:1px solid #e2e8f0;border-radius:12px;background:#f8fafc}.omr-cloud-metric small{display:block;color:#64748b;font-size:10px;text-transform:uppercase}.omr-cloud-metric strong{display:block;margin-top:4px;color:#0f172a;font-size:13px}.omr-cloud-note{padding:11px 12px;border-radius:12px;background:#eff6ff;color:#1e40af;font-size:12px;line-height:1.55}.omr-cloud-error{margin-top:10px;padding:10px;border-radius:10px;background:#fef2f2;color:#b91c1c;font-size:12px}.omr-cloud-actions{display:flex;gap:8px;flex-wrap:wrap;margin-top:15px}.omr-cloud-action{border:0;border-radius:10px;padding:10px 13px;background:#2563eb;color:#fff;font:700 12px Inter,sans-serif;cursor:pointer}.omr-cloud-action.secondary{background:#f1f5f9;color:#334155}.omr-cloud-action.danger{background:#fff1f2;color:#be123c}.omr-cloud-toggle{display:flex;align-items:flex-start;gap:9px;margin-top:13px;color:#334155;font-size:12px;line-height:1.5}.omr-cloud-toggle input{margin-top:2px}@media(max-width:720px){header>div:last-child{gap:6px!important}.status-badge{display:none}.omr-cloud-button{padding:7px 9px}.omr-cloud-info{grid-template-columns:1fr}}`;
        document.head.appendChild(style);

        const button = document.createElement('button');
        button.type = 'button';
        button.id = 'omrCloudButton';
        button.className = 'omr-cloud-button';
        button.textContent = '☁ Đồng bộ';
        button.addEventListener('click', async () => {
            if (!state.user) {
                try { await signIn(); } catch (_) {}
            } else {
                state.panelOpen = true;
                updateUi();
            }
        });
        document.querySelector('header > div:last-child')?.appendChild(button);

        const panel = document.createElement('div');
        panel.id = 'omrCloudPanel';
        panel.className = 'omr-cloud-panel';
        panel.addEventListener('click', event => {
            if (event.target === panel) {
                state.panelOpen = false;
                updateUi();
            }
        });
        document.body.appendChild(panel);
        updateUi();
    }

    function updateUi(forcedState = '') {
        const button = document.getElementById('omrCloudButton');
        const panel = document.getElementById('omrCloudPanel');
        if (!button || !panel) return;
        let status = forcedState;
        if (!status) {
            if (state.lastError) status = 'error';
            else if (state.syncPromise) status = 'syncing';
            else if (state.user && isTenantActive()) status = 'active';
            else status = 'idle';
        }
        button.dataset.state = status;
        button.textContent = status === 'syncing' ? '↻ Đang đồng bộ' : state.user ? (isTenantActive() ? '☁ Đã đồng bộ' : '☁ Chờ duyệt') : '☁ Đăng nhập';
        panel.classList.toggle('open', Boolean(state.panelOpen));
        panel.replaceChildren(buildPanelCard());
    }

    function buildPanelCard() {
        const card = document.createElement('div');
        card.className = 'omr-cloud-card';
        const head = document.createElement('div');
        head.className = 'omr-cloud-head';
        const heading = document.createElement('div');
        const title = document.createElement('h2');
        title.textContent = 'Đồng bộ Sang Math OMR';
        const subtitle = document.createElement('p');
        subtitle.textContent = state.user ? `${state.user.displayName || 'Giáo viên'} · ${state.user.email || ''}` : 'Đăng nhập Google để dùng trên nhiều thiết bị';
        heading.append(title, subtitle);
        const close = document.createElement('button');
        close.type = 'button';
        close.className = 'omr-cloud-close';
        close.textContent = '✕';
        close.addEventListener('click', () => { state.panelOpen = false; updateUi(); });
        head.append(heading, close);
        card.appendChild(head);

        if (!state.user) {
            const note = document.createElement('div');
            note.className = 'omr-cloud-note';
            note.textContent = 'Chấm bài vẫn hoạt động hoàn toàn trên máy khi chưa đăng nhập hoặc mất mạng.';
            card.appendChild(note);
            card.appendChild(actionButton('Đăng nhập Google', () => signIn().catch(() => {})));
            return card;
        }

        if (state.accountConflict) {
            const note = document.createElement('div');
            note.className = 'omr-cloud-note';
            note.textContent = 'Đồng bộ đang khóa vì dữ liệu trên trình duyệt thuộc một tài khoản Google khác. Hãy đăng xuất và chọn đúng tài khoản để tránh trộn bài giữa hai giáo viên.';
            card.appendChild(note);
            card.appendChild(actionButton('Đăng xuất', signOut, 'secondary'));
        } else if (!isTenantActive()) {
            const note = document.createElement('div');
            note.className = 'omr-cloud-note';
            const tenantStatus = state.tenant?.status || 'pending';
            note.textContent = canManageTeachers()
                ? 'Quyền OMR của chủ sở hữu được kích hoạt tự động, không cần gửi yêu cầu hoặc tự duyệt.'
                : tenantStatus === 'suspended'
                ? 'Tài khoản OMR đang tạm dừng. Dữ liệu trên máy vẫn nguyên vẹn.'
                : 'Tài khoản Google đã đăng nhập. Admin cần duyệt thời hạn và dung lượng trước khi bật đồng bộ.';
            card.appendChild(note);
            const actions = document.createElement('div');
            actions.className = 'omr-cloud-actions';
            if (canManageTeachers()) {
                actions.appendChild(actionButton('Kích hoạt quyền chủ sở hữu', () => syncNow().catch(() => {})));
            } else if (tenantStatus !== 'suspended') {
                actions.appendChild(actionButton('Gửi yêu cầu duyệt', requestAccess));
            }
            if (canManageTeachers()) {
                actions.appendChild(actionButton('Quản trị giáo viên', () => {
                    window.open('https://admin-conictypst.pages.dev/', '_blank', 'noopener');
                }, 'secondary'));
            }
            actions.appendChild(actionButton('Đăng xuất', signOut, 'secondary'));
            card.appendChild(actions);
        } else {
            const usage = state.tenant.usage || {};
            const limits = state.tenant.limits || {};
            const grid = document.createElement('div');
            grid.className = 'omr-cloud-info';
            grid.append(
                metric('Hạn sử dụng', formatDate(state.tenant.accessExpiresAt || state.tenant.accessEndsAt)),
                metric('Dữ liệu điểm', 'Tự xoá sau 12 tháng'),
                metric('Lớp / học sinh', `${usage.classCount || 0}/${limits.maxClasses || 10} · ${usage.studentCount || 0}/${limits.maxStudents || 500}`),
                metric('Ảnh cloud', cloudImageAllowed()
                    ? `${formatBytes(usage.r2Bytes)} / ${formatBytes(limits.r2Bytes || limits.maxStorageBytes)} · tối đa 6 tháng`
                    : 'Không bật · lưu trên máy')
            );
            card.appendChild(grid);
            const note = document.createElement('div');
            note.className = 'omr-cloud-note';
            note.textContent = cloudImageAllowed()
                ? 'Điểm, đáp án, lớp và thống kê được đồng bộ. Ảnh chỉ lên cloud khi bạn bật bên dưới; PDF luôn xuất và lưu trên máy.'
                : 'Gói miễn phí chỉ đồng bộ điểm, đáp án, lớp và thống kê. Ảnh bài chấm và PDF nằm trên máy của người chấm; hãy tải ZIP/PDF để sao lưu.';
            card.appendChild(note);
            if (cloudImageAllowed()) {
                const toggle = document.createElement('label');
                toggle.className = 'omr-cloud-toggle';
                const checkbox = document.createElement('input');
                checkbox.type = 'checkbox';
                checkbox.checked = imageSyncEnabled();
                checkbox.addEventListener('change', () => {
                    localStorage.setItem(IMAGE_SYNC_KEY, checkbox.checked ? '1' : '0');
                    if (checkbox.checked) enqueueMissingImages().then(() => scheduleSync(50));
                });
                const toggleText = document.createElement('span');
                toggleText.textContent = 'Đồng bộ ảnh cloud trả phí (mặc định tắt, tự xóa sau tối đa 6 tháng).';
                toggle.append(checkbox, toggleText);
                card.appendChild(toggle);
            }
            const actions = document.createElement('div');
            actions.className = 'omr-cloud-actions';
            actions.append(
                actionButton(state.syncPromise ? 'Đang đồng bộ…' : 'Đồng bộ ngay', () => syncNow().catch(() => {})),
                actionButton('Đăng xuất', signOut, 'secondary')
            );
            if (canManageTeachers()) {
                actions.appendChild(actionButton('Quản trị giáo viên', () => {
                    window.open('https://admin-conictypst.pages.dev/', '_blank', 'noopener');
                }, 'secondary'));
            }
            card.appendChild(actions);
            const last = document.createElement('p');
            last.style.cssText = 'margin:10px 0 0;color:#64748b;font-size:11px';
            last.textContent = state.lastSyncAt ? `Lần cuối: ${new Date(state.lastSyncAt).toLocaleString('vi-VN')}` : 'Chưa có lần đồng bộ hoàn tất.';
            card.appendChild(last);
        }
        if (state.lastError) {
            const error = document.createElement('div');
            error.className = 'omr-cloud-error';
            error.textContent = state.lastError;
            card.appendChild(error);
        }
        return card;
    }

    function actionButton(label, handler, variant = '') {
        const button = document.createElement('button');
        button.type = 'button';
        button.className = `omr-cloud-action ${variant}`.trim();
        button.textContent = label;
        button.addEventListener('click', handler);
        return button;
    }

    function metric(label, value) {
        const item = document.createElement('div');
        item.className = 'omr-cloud-metric';
        const small = document.createElement('small');
        small.textContent = label;
        const strong = document.createElement('strong');
        strong.textContent = value;
        item.append(small, strong);
        return item;
    }

    async function initialize() {
        if (state.initialized) return;
        state.initialized = true;
        ensureUi();
        if (cloudEnabled() && navigator.onLine) {
            ensureFirebase().catch(error => {
                state.lastError = firebaseErrorMessage(error);
                updateUi();
            });
        }
        window.addEventListener('online', () => {
            if (cloudEnabled()) ensureFirebase().then(() => scheduleSync(200)).catch(() => {});
        });
        document.addEventListener('visibilitychange', () => {
            if (!document.hidden) scheduleSync(300);
        });
        setInterval(() => {
            if (!document.hidden) scheduleSync(0);
        }, 15 * 60 * 1000);
    }

    window.OMRCloud = Object.freeze({
        initialize,
        signIn,
        signOut,
        syncNow,
        fetchResultImage,
        queueResult: result => queueResult(result).catch(error => console.warn('[OMR cloud] Không xếp hàng kết quả:', error)),
        queueDelete: resultId => queueDelete(resultId).catch(error => console.warn('[OMR cloud] Không xếp hàng xoá:', error)),
        queueWorkspace: () => queueWorkspace().catch(error => console.warn('[OMR cloud] Không xếp hàng workspace:', error))
    });

    if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initialize, { once: true });
    else initialize();
})();
