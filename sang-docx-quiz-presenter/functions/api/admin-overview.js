import { fail, isAdminEmail, json } from "./_shared.js";
import {
  errorResponse,
  listFirestoreCollection,
  queryFirebaseAuthUsers,
  verifyFirebaseUser,
} from "./firebaseServer.js";

const TRIAL_DAYS = 7;
const TRIAL_USES = 10;
const MAX_COLLECTION_DOCUMENTS = 5_000;

const lastPathSegment = (name) => {
  const value = String(name || "").split("/").pop() || "";
  try { return decodeURIComponent(value); } catch { return value; }
};

const dateFrom = (value) => {
  if (value instanceof Date) return Number.isFinite(value.getTime()) ? value : null;
  if (typeof value === "number" || (typeof value === "string" && /^\d{10,}$/.test(value))) {
    const numeric = Number(value);
    const millis = numeric < 10_000_000_000 ? numeric * 1000 : numeric;
    const date = new Date(millis);
    return Number.isFinite(date.getTime()) ? date : null;
  }
  const date = new Date(String(value || ""));
  return Number.isFinite(date.getTime()) ? date : null;
};

const iso = (value) => dateFrom(value)?.toISOString() || null;
const numberValue = (...values) => {
  for (const value of values) {
    const number = Number(value);
    if (Number.isFinite(number)) return number;
  }
  return 0;
};

const emptyAccount = (uid) => ({
  uid,
  email: "",
  displayName: "",
  photoURL: "",
  authCreatedAt: null,
  lastSeenAt: null,
  authLastLoginAt: null,
  authDisabled: false,
  emailVerified: false,
  userDoc: {},
  userDocCreateTime: null,
  subscription: {},
  orders: [],
});

const statusFor = (account, now) => {
  if (isAdminEmail(account.email)) return "admin";
  const subscription = account.subscription || {};
  const accessEndsAt = dateFrom(subscription.subscriptionAccessEndsAt);
  const subscriptionStatus = String(subscription.subscriptionStatus || "").toLowerCase();
  if (subscriptionStatus === "active" && accessEndsAt && accessEndsAt.getTime() > now) return "paid-active";
  if (subscriptionStatus === "active" && accessEndsAt) return "paid-expired";
  const trialEndsAt = dateFrom(account.trialStartedAt);
  if (trialEndsAt) {
    trialEndsAt.setTime(trialEndsAt.getTime() + TRIAL_DAYS * 24 * 60 * 60 * 1000);
    return trialEndsAt.getTime() > now ? "trial-active" : "trial-expired";
  }
  return "registered";
};

const decorateAccount = (account, now) => {
  const userDoc = account.userDoc || {};
  const subscription = account.subscription || {};
  const orders = account.orders || [];
  const firstPaidOrder = orders
    .filter((order) => String(order.status || "").toLowerCase() === "paid")
    .sort((left, right) => (dateFrom(right.paidAt || right.createdAt)?.getTime() || 0) - (dateFrom(left.paidAt || left.createdAt)?.getTime() || 0))[0];
  const authCreatedAt = dateFrom(account.authCreatedAt || userDoc.authCreatedAt || account.userDocCreateTime);
  const trialStartedAt = dateFrom(userDoc.trialStartedAt || userDoc.subjectSelectedAt || account.trialStartedAt);
  const trialEndsAt = trialStartedAt ? new Date(trialStartedAt.getTime() + TRIAL_DAYS * 24 * 60 * 60 * 1000) : null;
  const accessEndsAt = dateFrom(subscription.subscriptionAccessEndsAt || userDoc.subscriptionAccessEndsAt);
  const aiImportCount = Math.max(0, Math.floor(numberValue(userDoc.aiImportCount)));
  const status = statusFor({ ...account, authCreatedAt, trialStartedAt }, now);
  const paidOrders = orders.filter((order) => String(order.status || "").toLowerCase() === "paid");
  return {
    uid: account.uid,
    email: account.email || userDoc.email || firstPaidOrder?.email || "",
    displayName: account.displayName || userDoc.displayName || "",
    photoURL: account.photoURL || userDoc.photoURL || "",
    createdAt: iso(authCreatedAt),
    lastSeenAt: iso(userDoc.lastSeenAt || account.authLastLoginAt || account.userDocCreateTime),
    authLastLoginAt: iso(account.authLastLoginAt),
    authDisabled: account.authDisabled === true,
    emailVerified: account.emailVerified === true,
    preferredSubject: String(userDoc.preferredSubject || firstPaidOrder?.subject || ""),
    aiImportCount,
    trialUsesRemaining: Math.max(0, TRIAL_USES - aiImportCount),
    trialEndsAt: iso(trialEndsAt),
    subscriptionProductId: String(subscription.subscriptionProductId || userDoc.subscriptionProductId || ""),
    subscriptionPlanId: String(subscription.subscriptionPlanId || userDoc.subscriptionPlanId || firstPaidOrder?.planId || ""),
    subscriptionStatus: String(subscription.subscriptionStatus || userDoc.subscriptionStatus || ""),
    accessEndsAt: iso(accessEndsAt),
    status,
    totalOrders: orders.length,
    paidOrders: paidOrders.length,
    paidAmount: paidOrders.reduce((sum, order) => sum + numberValue(order.paidAmount, order.amount), 0),
    lastPaymentAt: iso(subscription.lastPaymentAt || firstPaidOrder?.paidAt || firstPaidOrder?.createdAt),
    lastPaymentOrderCode: String(subscription.lastPaymentOrderCode || firstPaidOrder?.orderCode || ""),
  };
};

const mergeData = ({ authUsers, userDocuments, billingDocuments, paymentDocuments }) => {
  const accounts = new Map();
  const get = (uid) => {
    const key = String(uid || "").trim();
    if (!key) return null;
    if (!accounts.has(key)) accounts.set(key, emptyAccount(key));
    return accounts.get(key);
  };

  for (const auth of authUsers) {
    const account = get(auth.localId);
    if (!account) continue;
    account.email = String(auth.email || "").trim().toLowerCase();
    account.displayName = String(auth.displayName || "");
    account.photoURL = String(auth.photoUrl || "");
    account.authCreatedAt = auth.createdAt || null;
    account.authLastLoginAt = auth.lastLoginAt || null;
    account.authDisabled = auth.disabled === true;
    account.emailVerified = auth.emailVerified === true;
  }
  for (const document of userDocuments) {
    const account = get(lastPathSegment(document.name));
    if (!account) continue;
    account.userDoc = document.data || {};
    account.userDocCreateTime = document.createTime || null;
  }
  for (const document of billingDocuments) {
    const account = get(lastPathSegment(document.name));
    if (account) account.subscription = document.data || {};
  }
  for (const document of paymentDocuments) {
    const order = document.data || {};
    const account = get(order.uid);
    if (account) account.orders.push(order);
  }
  return accounts;
};

const safeAuthUsers = async (env) => {
  try {
    const result = await queryFirebaseAuthUsers(env, { maxUsers: MAX_COLLECTION_DOCUMENTS });
    return { ...result, available: true };
  } catch {
    // A service account may have Firestore access but not firebaseauth.users.get.
    // The dashboard still works from server-written Firestore profiles.
    return { total: null, users: [], truncated: false, available: false };
  }
};

const safeCollection = async (collection, env) => {
  try {
    return { ...(await listFirestoreCollection(collection, env, { maxDocuments: MAX_COLLECTION_DOCUMENTS })), available: true };
  } catch {
    return { documents: [], truncated: false, available: false };
  }
};

export async function onRequestGet({ request, env }) {
  try {
    const account = await verifyFirebaseUser(request, env);
    if (!isAdminEmail(account.email)) return fail("Bạn không có quyền truy cập khu vực quản trị.", 403);

    const [authResult, userResult, billingResult, paymentResult] = await Promise.all([
      safeAuthUsers(env),
      safeCollection("users", env),
      safeCollection("billingSubscriptions", env),
      safeCollection("paymentOrders", env),
    ]);
    if (![userResult, billingResult, paymentResult].every((result) => result.available)) {
      return fail("Máy chủ chưa đọc được dữ liệu Firestore quản trị. Kiểm tra service account và quyền Firestore.", 503);
    }
    const accounts = mergeData({
      authUsers: authResult.users,
      userDocuments: userResult.documents,
      billingDocuments: billingResult.documents,
      paymentDocuments: paymentResult.documents,
    });
    const now = Date.now();
    const users = [...accounts.values()]
      .map((item) => decorateAccount(item, now))
      .filter((item) => item.email || item.uid)
      .sort((left, right) => (dateFrom(right.lastSeenAt || right.createdAt)?.getTime() || 0) - (dateFrom(left.lastSeenAt || left.createdAt)?.getTime() || 0));
    const payments = paymentResult.documents
      .map((document) => document.data || {})
      .map((order) => ({
        orderCode: String(order.orderCode || ""),
        uid: String(order.uid || ""),
        email: String(order.email || "").trim().toLowerCase(),
        planId: String(order.planId || ""),
        subject: String(order.subject || ""),
        status: String(order.status || ""),
        amount: numberValue(order.paidAmount, order.amount),
        createdAt: iso(order.createdAt),
        paidAt: iso(order.paidAt),
        accessEndsAt: iso(order.accessEndsAt),
      }))
      .sort((left, right) => (dateFrom(right.paidAt || right.createdAt)?.getTime() || 0) - (dateFrom(left.paidAt || left.createdAt)?.getTime() || 0))
      .slice(0, 100);
    const customerUsers = users.filter((user) => user.status !== "admin");
    const paidOrders = payments.filter((payment) => payment.status === "paid");
    const stats = {
      totalAccounts: authResult.available ? Math.max(Number(authResult.total || 0), users.length) : users.length,
      trackedProfiles: userResult.documents.length,
      customerCount: customerUsers.length,
      adminCount: users.length - customerUsers.length,
      trialActive: customerUsers.filter((user) => user.status === "trial-active").length,
      paidActive: customerUsers.filter((user) => user.status === "paid-active").length,
      paidExpired: customerUsers.filter((user) => user.status === "paid-expired").length,
      trialExpired: customerUsers.filter((user) => user.status === "trial-expired").length,
      registered: customerUsers.filter((user) => user.status === "registered").length,
      aiImportCount: users.reduce((sum, user) => sum + user.aiImportCount, 0),
      paidOrderCount: paidOrders.length,
      revenue: paidOrders.reduce((sum, payment) => sum + payment.amount, 0),
    };
    return json({
      ok: true,
      generatedAt: new Date().toISOString(),
      stats,
      users,
      payments,
      dataSources: {
        authAvailable: authResult.available,
        authTotal: authResult.total,
        authTruncated: authResult.truncated,
        usersTruncated: userResult.truncated,
        billingTruncated: billingResult.truncated,
        paymentsTruncated: paymentResult.truncated,
      },
    });
  } catch (error) {
    const result = errorResponse(error, "Không tải được số liệu quản trị.");
    return fail(result.message, result.status);
  }
}
