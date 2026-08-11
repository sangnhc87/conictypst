import { fail, json } from "./_shared.js";
import {
  commitFirestore,
  errorResponse,
  getFirestoreDocument,
  updateWrite,
  verifyFirebaseUser,
} from "./firebaseServer.js";
import { PAYMENT_PLANS, PRODUCT_ID, resolvePaymentPlan } from "./paymentPlans.js";

const createOrderCode = () => Date.now() * 100 + Math.floor(Math.random() * 100);
const configured = (env, key) => String(env[key] || "").trim();

export const onRequestOptions = async () => new Response(null, { status: 204 });

export async function onRequestPost({ request, env }) {
  try {
    const clientId = configured(env, "PAYOS_CLIENT_ID");
    const apiKey = configured(env, "PAYOS_API_KEY");
    const checksumKey = configured(env, "PAYOS_CHECKSUM_KEY");
    if (!clientId || !apiKey || !checksumKey) {
      return fail("Máy chủ thanh toán chưa được cấu hình đầy đủ.", 503);
    }

    const account = await verifyFirebaseUser(request, env);
    const body = (await request.json().catch(() => ({}))) || {};
    const plan = resolvePaymentPlan(body.planId);
    if (!plan) return fail("Gói cước không hợp lệ.", 400, { plans: Object.keys(PAYMENT_PLANS) });

    const subject = String(body.subject || "Tiếng Anh").trim().slice(0, 80);
    let orderCode = createOrderCode();
    for (let attempt = 0; attempt < 3; attempt += 1) {
      if (!await getFirestoreDocument(`paymentOrders/${orderCode}`, env)) break;
      orderCode = createOrderCode();
    }

    const publicOrigin = String(env.PUBLIC_APP_ORIGIN || new URL(request.url).origin).replace(/\/+$/, "");
    const returnUrl = `${publicOrigin}/?payment=success&orderCode=${orderCode}`;
    const cancelUrl = `${publicOrigin}/?payment=cancel&orderCode=${orderCode}`;
    const description = `Conic ${plan.label}`;
    const now = new Date();

    await commitFirestore([
      updateWrite(`paymentOrders/${orderCode}`, {
        orderCode,
        uid: account.uid,
        email: account.email,
        subject,
        productId: PRODUCT_ID,
        planId: plan.id,
        amount: plan.amount,
        accessDays: plan.accessDays,
        status: "creating",
        createdAt: now,
        updatedAt: now,
      }, env),
    ], env);

    const signatureData = `amount=${plan.amount}&cancelUrl=${cancelUrl}&description=${description}&orderCode=${orderCode}&returnUrl=${returnUrl}`;
    const encoder = new TextEncoder();
    const cryptoKey = await crypto.subtle.importKey(
      "raw",
      encoder.encode(checksumKey),
      { name: "HMAC", hash: "SHA-256" },
      false,
      ["sign"],
    );
    const signatureBuffer = await crypto.subtle.sign("HMAC", cryptoKey, encoder.encode(signatureData));
    const signature = Array.from(new Uint8Array(signatureBuffer), (byte) => byte.toString(16).padStart(2, "0")).join("");

    const payosResponse = await fetch("https://api-merchant.payos.vn/v2/payment-requests", {
      method: "POST",
      headers: {
        "content-type": "application/json",
        "x-client-id": clientId,
        "x-api-key": apiKey,
      },
      body: JSON.stringify({
        orderCode,
        amount: plan.amount,
        description,
        returnUrl,
        cancelUrl,
        signature,
        buyerEmail: account.email,
      }),
    });
    const payosPayload = await payosResponse.json().catch(() => ({}));

    if (!payosResponse.ok || payosPayload.code !== "00" || !payosPayload.data?.checkoutUrl) {
      await commitFirestore([
        updateWrite(`paymentOrders/${orderCode}`, {
          status: "error",
          error: String(payosPayload.desc || "PayOS không tạo được link thanh toán.").slice(0, 500),
          updatedAt: new Date(),
        }, env),
      ], env);
      return fail("Không tạo được link thanh toán. Vui lòng thử lại.", 502);
    }

    await commitFirestore([
      updateWrite(`paymentOrders/${orderCode}`, {
        status: "pending",
        paymentLinkId: payosPayload.data.paymentLinkId || null,
        updatedAt: new Date(),
      }, env),
    ], env);

    return json({ ok: true, checkoutUrl: payosPayload.data.checkoutUrl, orderCode });
  } catch (error) {
    const result = errorResponse(error);
    return fail(result.message, result.status);
  }
}
