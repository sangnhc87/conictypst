// cloud-platform covers both Firestore and the Identity Toolkit query used by
// the private admin dashboard. The service account still needs only the
// corresponding IAM permissions in the Firebase project.
const FIRESTORE_SCOPE = "https://www.googleapis.com/auth/cloud-platform";
const GOOGLE_TOKEN_URL = "https://oauth2.googleapis.com/token";
const FIRESTORE_API = "https://firestore.googleapis.com/v1";

let cachedGoogleToken = null;
let cachedGoogleTokenExpiresAt = 0;

class FirebaseServerError extends Error {
  constructor(message, status = 500) {
    super(message);
    this.name = "FirebaseServerError";
    this.status = status;
  }
}

const base64UrlEncode = (value) => {
  const bytes = typeof value === "string" ? new TextEncoder().encode(value) : value;
  let binary = "";
  for (let index = 0; index < bytes.length; index += 1) binary += String.fromCharCode(bytes[index]);
  return btoa(binary).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/g, "");
};

const base64UrlDecode = (value) => {
  const normalized = String(value).replace(/-/g, "+").replace(/_/g, "/");
  const padding = "=".repeat((4 - (normalized.length % 4)) % 4);
  const binary = atob(normalized + padding);
  return Uint8Array.from(binary, (character) => character.charCodeAt(0));
};

const privateKeyBytes = (pem) => {
  const normalized = String(pem || "")
    .replace(/-----BEGIN PRIVATE KEY-----/g, "")
    .replace(/-----END PRIVATE KEY-----/g, "")
    .replace(/\\n/g, "")
    .replace(/\s+/g, "");
  if (!normalized) throw new FirebaseServerError("Firebase service account thiếu private key.", 503);
  return base64UrlDecode(normalized);
};

const serviceAccount = (env) => {
  let parsed = null;
  if (env.FIREBASE_SERVICE_ACCOUNT_JSON) {
    try {
      parsed = JSON.parse(env.FIREBASE_SERVICE_ACCOUNT_JSON);
    } catch {
      throw new FirebaseServerError("FIREBASE_SERVICE_ACCOUNT_JSON không phải JSON hợp lệ.", 503);
    }
  }
  const clientEmail = String(parsed?.client_email || env.FIREBASE_CLIENT_EMAIL || "").trim();
  const privateKey = String(parsed?.private_key || env.FIREBASE_PRIVATE_KEY || "").replace(/\\n/g, "\n");
  const projectId = String(env.FIREBASE_PROJECT_ID || parsed?.project_id || "").trim();
  if (!clientEmail || !privateKey || !projectId) {
    throw new FirebaseServerError(
      "Thiếu cấu hình Firebase server. Cần FIREBASE_PROJECT_ID và service account.",
      503,
    );
  }
  return { clientEmail, privateKey, projectId };
};

async function googleAccessToken(env) {
  const now = Math.floor(Date.now() / 1000);
  if (cachedGoogleToken && cachedGoogleTokenExpiresAt - now > 60) return cachedGoogleToken;

  const account = serviceAccount(env);
  const header = base64UrlEncode(JSON.stringify({ alg: "RS256", typ: "JWT" }));
  const claim = base64UrlEncode(JSON.stringify({
    iss: account.clientEmail,
    scope: FIRESTORE_SCOPE,
    aud: GOOGLE_TOKEN_URL,
    iat: now,
    exp: now + 3600,
  }));
  const unsignedToken = `${header}.${claim}`;
  const key = await crypto.subtle.importKey(
    "pkcs8",
    privateKeyBytes(account.privateKey),
    { name: "RSASSA-PKCS1-v1_5", hash: "SHA-256" },
    false,
    ["sign"],
  );
  const signature = await crypto.subtle.sign(
    "RSASSA-PKCS1-v1_5",
    key,
    new TextEncoder().encode(unsignedToken),
  );
  const assertion = `${unsignedToken}.${base64UrlEncode(new Uint8Array(signature))}`;
  const response = await fetch(GOOGLE_TOKEN_URL, {
    method: "POST",
    headers: { "content-type": "application/x-www-form-urlencoded" },
    body: `grant_type=${encodeURIComponent("urn:ietf:params:oauth:grant-type:jwt-bearer")}&assertion=${encodeURIComponent(assertion)}`,
  });
  if (!response.ok) throw new FirebaseServerError("Firebase không cấp được quyền truy cập máy chủ.", 503);
  const payload = await response.json();
  if (!payload.access_token) throw new FirebaseServerError("Firebase trả về access token trống.", 503);
  cachedGoogleToken = payload.access_token;
  cachedGoogleTokenExpiresAt = now + Number(payload.expires_in || 3600);
  return cachedGoogleToken;
}

const firestoreRoot = (env) => {
  const { projectId } = serviceAccount(env);
  return `${FIRESTORE_API}/projects/${encodeURIComponent(projectId)}/databases/(default)/documents`;
};

const documentName = (path, env) => `${firestoreRoot(env)}/${String(path).split("/").map(encodeURIComponent).join("/")}`;

const firestoreValue = (value) => {
  if (value === null) return { nullValue: "NULL_VALUE" };
  if (value instanceof Date) return { timestampValue: value.toISOString() };
  if (typeof value === "string") return { stringValue: value };
  if (typeof value === "boolean") return { booleanValue: value };
  if (typeof value === "number") {
    if (Number.isInteger(value)) return { integerValue: String(value) };
    return { doubleValue: value };
  }
  if (Array.isArray(value)) return { arrayValue: { values: value.map(firestoreValue) } };
  if (typeof value === "object") {
    const fields = {};
    for (const [key, child] of Object.entries(value)) {
      if (child !== undefined) fields[key] = firestoreValue(child);
    }
    return { mapValue: { fields } };
  }
  return { stringValue: String(value) };
};

export const firestoreFields = (value) => {
  const fields = {};
  for (const [key, child] of Object.entries(value || {})) {
    if (child !== undefined) fields[key] = firestoreValue(child);
  }
  return fields;
};

const firestoreValueToJs = (value = {}) => {
  if (Object.prototype.hasOwnProperty.call(value, "nullValue")) return null;
  if (Object.prototype.hasOwnProperty.call(value, "stringValue")) return value.stringValue;
  if (Object.prototype.hasOwnProperty.call(value, "integerValue")) return Number(value.integerValue);
  if (Object.prototype.hasOwnProperty.call(value, "doubleValue")) return Number(value.doubleValue);
  if (Object.prototype.hasOwnProperty.call(value, "booleanValue")) return value.booleanValue;
  if (Object.prototype.hasOwnProperty.call(value, "timestampValue")) return value.timestampValue;
  if (value.arrayValue) return (value.arrayValue.values || []).map(firestoreValueToJs);
  if (value.mapValue) return firestoreFieldsToJs(value.mapValue.fields || {});
  return undefined;
};

export const firestoreFieldsToJs = (fields = {}) => Object.fromEntries(
  Object.entries(fields).map(([key, value]) => [key, firestoreValueToJs(value)]),
);

async function firestoreFetch(url, options, env) {
  const response = await fetch(url, {
    ...options,
    headers: {
      ...(options?.headers || {}),
      authorization: `Bearer ${await googleAccessToken(env)}`,
      "content-type": "application/json",
    },
  });
  if (!response.ok) {
    const text = await response.text();
    let message = text.slice(0, 500);
    try { message = JSON.parse(text)?.error?.message || message; } catch { /* keep text */ }
    const error = new FirebaseServerError(`Firestore: ${message}`, response.status === 404 ? 404 : 503);
    error.firestoreStatus = response.status;
    throw error;
  }
  return response;
}

export async function getFirestoreDocument(path, env) {
  try {
    const response = await firestoreFetch(documentName(path, env), { method: "GET" }, env);
    const document = await response.json();
    return {
      ...document,
      data: firestoreFieldsToJs(document.fields || {}),
    };
  } catch (error) {
    if (error?.status === 404 || error?.firestoreStatus === 404) return null;
    throw error;
  }
}

export const updateWrite = (path, data, env, updateTime = undefined) => ({
  update: { name: documentName(path, env), fields: firestoreFields(data) },
  updateMask: { fieldPaths: Object.keys(data || {}) },
  ...(updateTime ? { currentDocument: { updateTime } } : {}),
});

export async function commitFirestore(writes, env) {
  const response = await firestoreFetch(`${firestoreRoot(env)}:commit`, {
    method: "POST",
    body: JSON.stringify({ writes }),
  }, env);
  return response.json();
}

export async function listFirestoreCollection(collection, env, options = {}) {
  const pageSize = Math.min(Math.max(Number(options.pageSize) || 500, 1), 1000);
  const maxDocuments = Math.max(Number(options.maxDocuments) || 5000, pageSize);
  const documents = [];
  let pageToken = "";
  let truncated = false;

  while (documents.length < maxDocuments) {
    const url = new URL(`${firestoreRoot(env)}/${encodeURIComponent(String(collection))}`);
    url.searchParams.set("pageSize", String(Math.min(pageSize, maxDocuments - documents.length)));
    if (pageToken) url.searchParams.set("pageToken", pageToken);
    const response = await firestoreFetch(url.toString(), { method: "GET" }, env);
    const payload = await response.json();
    for (const document of payload.documents || []) {
      documents.push({
        name: document.name || "",
        createTime: document.createTime || null,
        updateTime: document.updateTime || null,
        data: firestoreFieldsToJs(document.fields || {}),
      });
      if (documents.length >= maxDocuments) break;
    }
    pageToken = String(payload.nextPageToken || "");
    if (!pageToken || !(payload.documents || []).length) break;
  }

  if (pageToken) truncated = true;
  return { documents, truncated };
}

export async function queryFirebaseAuthUsers(env, options = {}) {
  const { projectId } = serviceAccount(env);
  const maxUsers = Math.max(Number(options.maxUsers) || 5000, 1);
  const pageSize = Math.min(maxUsers, 500);
  const token = await googleAccessToken(env);
  const endpoint = `https://identitytoolkit.googleapis.com/v1/projects/${encodeURIComponent(projectId)}/accounts:query`;

  const query = async (body) => {
    const response = await fetch(endpoint, {
      method: "POST",
      headers: {
        authorization: `Bearer ${token}`,
        "content-type": "application/json",
      },
      body: JSON.stringify(body),
    });
    if (!response.ok) {
      const text = await response.text();
      let message = text.slice(0, 500);
      try { message = JSON.parse(text)?.error?.message || message; } catch { /* keep text */ }
      const error = new FirebaseServerError(`Firebase Auth: ${message}`, response.status === 403 ? 403 : 503);
      error.firebaseStatus = response.status;
      throw error;
    }
    return response.json();
  };

  const countPayload = await query({ returnUserInfo: false });
  const total = Number(countPayload.recordsCount || 0);
  const users = [];
  for (let offset = 0; offset < Math.min(total, maxUsers); offset += pageSize) {
    const payload = await query({
      returnUserInfo: true,
      limit: String(Math.min(pageSize, maxUsers - offset)),
      offset: String(offset),
      sortBy: "CREATED_AT",
      order: "DESC",
    });
    const page = Array.isArray(payload.userInfo) ? payload.userInfo : [];
    users.push(...page);
    if (page.length < pageSize) break;
  }
  return { total, users, truncated: total > maxUsers };
}

export async function verifyFirebaseUser(request, env) {
  const authorization = String(request.headers.get("authorization") || "");
  const match = authorization.match(/^Bearer\s+(.+)$/i);
  const apiKey = String(env.FIREBASE_WEB_API_KEY || "").trim();
  if (!match || !apiKey) throw new FirebaseServerError("Cần đăng nhập Gmail để thanh toán.", 401);

  const response = await fetch(`https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=${encodeURIComponent(apiKey)}`, {
    method: "POST",
    headers: { "content-type": "application/json" },
    body: JSON.stringify({ idToken: match[1] }),
  });
  if (!response.ok) throw new FirebaseServerError("Phiên đăng nhập Gmail đã hết hạn. Hãy đăng nhập lại.", 401);
  const payload = await response.json();
  const account = payload.users?.[0];
  const email = String(account?.email || "").trim().toLowerCase();
  if (!account?.localId || !email || account.emailVerified !== true) {
    throw new FirebaseServerError("Tài khoản Gmail chưa được xác minh.", 403);
  }
  return {
    uid: account.localId,
    email,
    displayName: account.displayName || "",
    photoURL: account.photoUrl || "",
    createdAt: Number(account.createdAt || 0),
  };
}

export async function requireTeacherAccess(request, env) {
  const account = await verifyFirebaseUser(request, env);
  const admin = account.email === "nguyensangnhc@gmail.com" || account.email === "sangbeau@gmail.com";
  if (admin) return { account, paid: true, trial: false };

  const subscriptionDocument = await getFirestoreDocument(`billingSubscriptions/${account.uid}`, env);
  const userDocument = await getFirestoreDocument(`users/${account.uid}`, env);
  const user = { ...(userDocument?.data || {}), ...(subscriptionDocument?.data || {}) };
  const accessEndsAt = new Date(user.subscriptionAccessEndsAt || "").getTime();
  const paid = user.subscriptionStatus === "active" && accessEndsAt > Date.now();
  let trialStartedAt = new Date(user.trialStartedAt || user.subjectSelectedAt || "");
  if (!Number.isFinite(trialStartedAt.getTime())) {
    trialStartedAt = new Date();
    await commitFirestore([
      updateWrite(`users/${account.uid}`, { trialStartedAt }, env),
    ], env);
  }
  const trialEndsAt = trialStartedAt.getTime() + 7 * 24 * 60 * 60 * 1000;
  const aiImportCount = Number(user.aiImportCount || 0);
  const trial = Number.isFinite(trialEndsAt) && trialEndsAt > Date.now() && aiImportCount < 10;
  if (!paid && !trial) {
    throw new FirebaseServerError("Thời gian dùng thử đã hết. Hãy nâng cấp để tiếp tục dùng AI/OCR.", 402);
  }
  return { account, paid, trial };
}

export function errorResponse(error, fallback = "Hệ thống thanh toán đang bận. Vui lòng thử lại.") {
  const status = Number(error?.status) >= 400 && Number(error?.status) < 600 ? Number(error.status) : 500;
  return { status, message: status >= 500 ? fallback : String(error?.message || fallback) };
}
