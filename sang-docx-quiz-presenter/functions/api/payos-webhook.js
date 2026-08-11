import { fail, json } from "./_shared.js";
import {
  commitFirestore,
  errorResponse,
  getFirestoreDocument,
  updateWrite,
} from "./firebaseServer.js";
import { PRODUCT_ID, resolvePaymentPlan } from "./paymentPlans.js";

const hmacHex = async (value, secret) => {
  const encoder = new TextEncoder();
  const key = await crypto.subtle.importKey(
    "raw",
    encoder.encode(secret),
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["sign"],
  );
  const signature = await crypto.subtle.sign("HMAC", key, encoder.encode(value));
  return Array.from(new Uint8Array(signature), (byte) => byte.toString(16).padStart(2, "0")).join("");
};

const sameHex = (left, right) => {
  const a = String(left || "").toLowerCase();
  const b = String(right || "").toLowerCase();
  if (!/^[a-f0-9]{64}$/.test(a) || !/^[a-f0-9]{64}$/.test(b)) return false;
  let difference = 0;
  for (let index = 0; index < a.length; index += 1) difference |= a.charCodeAt(index) ^ b.charCodeAt(index);
  return difference === 0;
};

const webhookSignatureData = (data) => Object.keys(data || {})
  .sort()
  .map((key) => `${key}=${data[key] === null || data[key] === undefined ? "" : data[key]}`)
  .join("&");

const dateValue = (value) => {
  const parsed = new Date(value || "");
  return Number.isFinite(parsed.getTime()) ? parsed : null;
};

const currentExpiry = (value) => {
  const parsed = dateValue(value);
  return parsed && parsed.getTime() > Date.now() ? parsed : new Date();
};

export async function onRequestPost({ request, env }) {
  try {
    const checksumKey = String(env.PAYOS_CHECKSUM_KEY || "").trim();
    if (!checksumKey) return fail("Webhook thanh toán chưa được cấu hình.", 503);
    const body = await request.json().catch(() => null);
    const data = body?.data;
    if (!data || !body.signature) return fail("Webhook PayOS không hợp lệ.", 400);

    const expected = await hmacHex(webhookSignatureData(data), checksumKey);
    if (!sameHex(expected, body.signature)) return fail("Chữ ký webhook không hợp lệ.", 400);

    const orderCode = Number(data.orderCode);
    if (!Number.isSafeInteger(orderCode)) return fail("Mã đơn hàng không hợp lệ.", 400);
    const orderDocument = await getFirestoreDocument(`paymentOrders/${orderCode}`, env);
    if (!orderDocument) {
      // PayOS dùng một giao dịch mẫu để xác nhận URL. Trả payload success chuẩn
      // để confirm-webhook chấp nhận, nhưng tuyệt đối không cấp quyền cho đơn lạ.
      return json({ code: "00", desc: "success", ok: true, received: true, status: "unknown_order" });
    }
    const order = orderDocument.data;
    if (order.status === "paid") return json({ ok: true, received: true, status: "paid" });

    if (String(data.code) !== "00") {
      await commitFirestore([
        updateWrite(`paymentOrders/${orderCode}`, {
          status: "failed",
          webhookCode: String(data.code || ""),
          webhookDescription: String(body.desc || "").slice(0, 500),
          updatedAt: new Date(),
        }, env, orderDocument.updateTime),
      ], env);
      return json({ ok: true, received: true, status: "failed" });
    }

    const plan = resolvePaymentPlan(order.planId);
    if (!plan || order.productId !== PRODUCT_ID || Number(data.amount) !== Number(order.amount)) {
      await commitFirestore([
        updateWrite(`paymentOrders/${orderCode}`, {
          status: "amount_mismatch",
          paidAmount: Number(data.amount) || 0,
          updatedAt: new Date(),
        }, env, orderDocument.updateTime),
      ], env);
      return json({ ok: true, received: true, status: "amount_mismatch" });
    }

    const subscriptionDocument = await getFirestoreDocument(`billingSubscriptions/${order.uid}`, env);
    const subscription = subscriptionDocument?.data || {};
    const start = currentExpiry(subscription.subscriptionAccessEndsAt);
    const accessEndsAt = new Date(start.getTime() + plan.accessDays * 24 * 60 * 60 * 1000);
    const now = new Date();

    try {
      // Precondition trên đơn hàng khiến hai webhook trùng nhau không thể cộng hạn dùng hai lần.
      await commitFirestore([
        updateWrite(`billingSubscriptions/${order.uid}`, {
          subscriptionProductId: PRODUCT_ID,
          subscriptionPlanId: plan.id,
          subscriptionStatus: "active",
          subscriptionAccessEndsAt: accessEndsAt,
          subscriptionUpdatedAt: now,
          lastPaymentOrderCode: orderCode,
          lastPaymentAmount: plan.amount,
          lastPaymentEmail: order.email,
          lastPaymentAt: now,
        }, env),
        // Bản sao hiển thị trong hồ sơ; quyền AI/OCR phía máy chủ chỉ tin
        // billingSubscriptions, không tin các field này từ client.
        updateWrite(`users/${order.uid}`, {
          subscriptionProductId: PRODUCT_ID,
          subscriptionPlanId: plan.id,
          subscriptionStatus: "active",
          subscriptionAccessEndsAt: accessEndsAt,
          subscriptionUpdatedAt: now,
        }, env),
        updateWrite(`paymentOrders/${orderCode}`, {
          status: "paid",
          paidAmount: plan.amount,
          paidAt: now,
          accessEndsAt,
          updatedAt: now,
        }, env, orderDocument.updateTime),
      ], env);
    } catch (error) {
      // Một webhook khác vừa hoàn tất đơn này: đây là kết quả idempotent an toàn.
      if (error?.firestoreStatus === 409 || error?.status === 409) {
        return json({ ok: true, received: true, status: "paid" });
      }
      throw error;
    }

    return json({ ok: true, received: true, status: "paid", accessEndsAt: accessEndsAt.toISOString() });
  } catch (error) {
    const result = errorResponse(error, "Webhook chưa xử lý xong; PayOS có thể gửi lại sau.");
    return fail(result.message, result.status);
  }
}
