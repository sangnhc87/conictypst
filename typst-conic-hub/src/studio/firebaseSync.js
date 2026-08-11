import { initializeApp, getApp, getApps } from 'firebase/app';
import {
  getAuth,
  setPersistence,
  browserLocalPersistence,
  browserSessionPersistence,
  onIdTokenChanged,
  signInWithCustomToken,
  signInWithPopup,
  signInWithRedirect,
  signOut as firebaseSignOut,
  getIdTokenResult,
  getRedirectResult,
  GoogleAuthProvider
} from 'firebase/auth';
import { getFunctions, httpsCallable } from 'firebase/functions';
import { exportProjectZip, importProjectZip } from './projectStore.js';

const REGION = 'asia-southeast1';

const FIREBASE_CONFIG = {
  identity: {
    apiKey: 'AIzaSyDwbd6q4EHUp_JouOD5K1a96yNxq_RTTfc',
    authDomain: 'conicgv.firebaseapp.com',
    projectId: 'conicgv',
    storageBucket: 'conicgv.firebasestorage.app',
    messagingSenderId: '777103975965',
    appId: '1:777103975965:web:00f564c7f00de09698c8f4',
  },
  platform: {
    apiKey: 'AIzaSyAOjWhQD6DsrInCKgsfTKoZST6wHWavB_c',
    authDomain: 'conictypst-platform.firebaseapp.com',
    projectId: 'conictypst-platform',
    storageBucket: 'conictypst-platform.firebasestorage.app',
    messagingSenderId: '247634082918',
    appId: '1:247634082918:web:373969616934306f8441a7',
  }
};

function getOrCreateApp(name, config) {
  return getApps().some((app) => app.name === name) ? getApp(name) : initializeApp(config, name);
}

// Khởi tạo các ứng dụng Firebase phục vụ Đăng nhập chung
const identityApp = getOrCreateApp('conic-hub-identity', FIREBASE_CONFIG.identity);
const platformApp = getOrCreateApp('conic-hub-platform', FIREBASE_CONFIG.platform);

export const identityAuth = getAuth(identityApp);
export const platformAuth = getAuth(platformApp);
export const platformFunctions = getFunctions(platformApp, REGION);

// Khởi tạo các hàm Cloud Functions Callable tương ứng
const exchangeTokenFn = httpsCallable(platformFunctions, 'ctExchangeConicgvToken');
const getProjectsFn = httpsCallable(platformFunctions, 'studioGetProjects');
const createUploadFn = httpsCallable(platformFunctions, 'studioCreateUploadUrl');
const commitUploadFn = httpsCallable(platformFunctions, 'studioCommitUpload');
const createDownloadFn = httpsCallable(platformFunctions, 'studioCreateDownloadUrl');
const deleteProjectFn = httpsCallable(platformFunctions, 'studioDeleteProject');
const getStatsFn = httpsCallable(platformFunctions, 'studioGetStats');

function projectMetadata(project) {
  return {
    id: project.id,
    name: project.name,
    entryPath: project.entryPath,
    templateId: project.templateId,
    templateVersion: project.templateVersion,
  };
}

async function sha256Hex(buffer) {
  const digest = await crypto.subtle.digest('SHA-256', buffer);
  return [...new Uint8Array(digest)].map((value) => value.toString(16).padStart(2, '0')).join('');
}

async function storageRequest(url, options, fallbackMessage) {
  const response = await fetch(url, options);
  if (response.ok) return response;
  const detail = await response.json().catch(() => ({}));
  throw new Error(detail?.error || fallbackMessage);
}

// Cấu hình persistence cho cả hai phiên đăng nhập
let setupPromise = null;
let signInPromise = null;
export function initAuthPersistence() {
  if (setupPromise) return setupPromise;
  setupPromise = (async () => {
    // Safari, embedded browsers and strict privacy modes can reject IndexedDB
    // persistence. That must not prevent a user from signing in: Firebase can
    // still continue with its in-memory fallback for the current tab.
    const persistenceResults = await Promise.allSettled([
      setPersistence(identityAuth, browserLocalPersistence),
      setPersistence(platformAuth, browserSessionPersistence),
    ]);
    persistenceResults.forEach((result) => {
      if (result.status === 'rejected') console.warn('Firebase persistence fallback:', result.reason);
    });

    // Complete a Google redirect when the browser returns to TypstConicHub.
    // The auth-state listener below remains the source of truth for the UI.
    try {
      return await getRedirectResult(identityAuth);
    } catch (error) {
      console.warn('Firebase redirect result:', error);
      return null;
    }
  })();
  return setupPromise;
}

// Bắt đầu quy trình đăng nhập bằng tài khoản Google
export async function signInWithGoogle() {
  // Keep one request for the whole app so double clicks cannot cancel the
  // Google chooser. Popup is the fast path and also avoids third-party redirect
  // storage restrictions on pages.dev. Full-page redirect is only a fallback.
  if (signInPromise) return signInPromise;
  signInPromise = (async () => {
    // Start setup/recovery in the background. Waiting for it can freeze the
    // button indefinitely in privacy-restricted browsers; Firebase can still
    // authenticate this tab with its default persistence.
    void initAuthPersistence().catch((error) => {
      console.warn('Firebase auth setup fallback:', error);
    });
    const provider = new GoogleAuthProvider();
    provider.setCustomParameters({ prompt: 'select_account' });
    try {
      return await signInWithPopup(identityAuth, provider);
    } catch (error) {
      if (error?.code === 'auth/cancelled-popup-request' || error?.code === 'auth/popup-closed-by-user') return null;
      if (['auth/popup-blocked', 'auth/operation-not-supported-in-this-environment'].includes(error?.code)) {
        await signInWithRedirect(identityAuth, provider);
        return null;
      }
      throw error;
    }
  })();
  try {
    return await signInPromise;
  } finally {
    signInPromise = null;
  }
}

// Đăng xuất khỏi toàn bộ hệ thống
export async function signOut() {
  await Promise.allSettled([
    firebaseSignOut(platformAuth),
    firebaseSignOut(identityAuth)
  ]);
}

// Lắng nghe sự thay đổi của trạng thái đăng nhập và thực hiện trao đổi token tự động
export function listenAuthState(onStateChanged) {
  let active = true;
  let syncSequence = 0;

  initAuthPersistence().catch(() => null);

  const unsubscribe = onIdTokenChanged(identityAuth, async (identityUser) => {
    const sequence = ++syncSequence;
    if (!active) return;

    if (!identityUser) {
      await firebaseSignOut(platformAuth).catch(() => undefined);
      if (!active || sequence !== syncSequence) return;
      onStateChanged({ user: null, loading: false });
      return;
    }

    onStateChanged({ user: null, loading: true, statusText: 'Đang kết nối hệ thống Conic...' });

    try {
      const tokenResult = await getIdTokenResult(identityUser, false);
      const response = await exchangeTokenFn({ idToken: tokenResult.token });
      const customToken = response?.data?.customToken;
      
      if (typeof customToken !== 'string' || customToken.length < 20) {
        throw new Error('Không cấp được phiên đăng nhập Conic.');
      }

      const credential = await signInWithCustomToken(platformAuth, customToken);
      if (!active || sequence !== syncSequence) return;

      onStateChanged({ user: credential.user, loading: false });
    } catch (error) {
      console.error('Lỗi trao đổi token Conic:', error);
      if (!active || sequence !== syncSequence) return;
      onStateChanged({ user: null, loading: false, error: error?.message || 'Không thể đăng nhập hệ thống.' });
    }
  });

  return () => {
    active = false;
    unsubscribe();
  };
}

// API Cloud: Lấy toàn bộ danh sách dự án
export async function fetchCloudProjects() {
  try {
    const response = await getProjectsFn();
    return response.data;
  } catch (error) {
    throw new Error(error?.message || 'Không thể tải danh sách dự án từ đám mây.');
  }
}

// API Cloud: Lưu/Cập nhật dự án
export async function syncCloudProject(project) {
  try {
    const archive = await exportProjectZip(project);
    const bytes = await archive.arrayBuffer();
    const sha256 = await sha256Hex(bytes);
    const reservation = await createUploadFn({
      project: projectMetadata(project),
      sizeBytes: bytes.byteLength,
      sha256,
    });
    const ticket = reservation.data;
    if (ticket.skipped) return ticket;
    await storageRequest(ticket.uploadUrl, {
      method: 'PUT',
      headers: {
        ...ticket.headers,
        'Content-Type': 'application/zip',
      },
      body: bytes,
    }, 'Không thể tải dự án lên kho Cloud.');
    const committed = await commitUploadFn({ uploadId: ticket.uploadId });
    return committed.data;
  } catch (error) {
    throw new Error(error?.message || 'Không thể đồng bộ dự án lên đám mây.');
  }
}

// API Cloud: tải một ZIP dự án từ R2 rồi nhập lại vào IndexedDB cục bộ.
export async function downloadCloudProject(projectId) {
  try {
    const response = await createDownloadFn({ projectId });
    const ticket = response.data;
    const download = await storageRequest(ticket.downloadUrl, {
      method: 'GET',
      headers: ticket.headers,
    }, 'Không thể tải dự án từ kho Cloud.');
    const archive = await download.blob();
    const file = new File([archive], `${projectId}.zip`, { type: 'application/zip' });
    return importProjectZip(file, { preserveId: true });
  } catch (error) {
    throw new Error(error?.message || 'Không thể tải dự án từ đám mây.');
  }
}

// API Cloud: Xóa dự án
export async function deleteCloudProject(projectId) {
  try {
    const response = await deleteProjectFn({ projectId });
    return response.data;
  } catch (error) {
    throw new Error(error?.message || 'Không thể xóa dự án trên đám mây.');
  }
}

// API Cloud: Thống kê tổng hợp Studio (số THẬT, chỉ số đếm — không PII).
// Trả null nếu lỗi để UI ẩn thống kê thay vì vỡ (tính năng "cho vui", không cốt lõi).
export async function fetchStudioStats() {
  try {
    const response = await getStatsFn();
    const d = response.data || {};
    if (!d.ok) return null;
    return { teachers: d.teachers || 0, projects: d.projects || 0, proMembers: d.proMembers || 0 };
  } catch (error) {
    return null;
  }
}
