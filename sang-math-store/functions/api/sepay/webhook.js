import { extractPaymentCode, json, verifySepaySignature } from "../../_shared.js";

const encoder = new TextEncoder();

async function hmacHex(value, secret) {
  const key = await crypto.subtle.importKey(
    "raw",
    encoder.encode(secret),
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["sign"],
  );
  const signature = await crypto.subtle.sign("HMAC", key, encoder.encode(value));
  return Array.from(new Uint8Array(signature), (byte) => byte.toString(16).padStart(2, "0")).join("");
}

async function fulfillConicGv(order, env, transactionId, paidAt) {
  const items = JSON.parse(order.items_json);
  const conicGvItems = items.filter((item) => item.id === "conicgv-suite-1y");
  if (!conicGvItems.length) return;

  const url = String(env.CONICGV_GRANT_URL || "").trim();
  const secret = String(env.CONICGV_STORE_WEBHOOK_SECRET || "").trim();
  if (!url || !secret) throw new Error("Cầu cấp quyền ConicGV chưa được cấu hình.");

  for (const item of conicGvItems) {
    const body = JSON.stringify({
      orderId: order.id,
      transactionId,
      productId: item.id,
      email: String(order.email).toLowerCase(),
      accessDays: Math.round(Number(item.accessDays) || 365),
      totalVnd: Math.round(Number(item.price) || 0),
      paidAt,
    });
    const timestamp = String(Math.floor(Date.now() / 1000));
    const signature = await hmacHex(`${timestamp}.${body}`, secret);
    const response = await globalThis.fetch(url, {
      method: "POST",
      headers: {
        "content-type": "application/json",
        "x-sangmath-timestamp": timestamp,
        "x-sangmath-signature": signature,
      },
      body,
    });
    if (!response.ok) {
      const result = await response.json().catch(() => ({}));
      throw new Error(result.error || `ConicGV trả về HTTP ${response.status}.`);
    }
  }
}

async function fulfillConicStudio(order, env, transactionId, paidAt) {
  const items = JSON.parse(order.items_json);
  const studioItems = items.filter((item) => item.entitlementKey === 'conic-studio-pro'
    || ['hub-cloud-1y', 'hub-cloud-2y', 'hub-cloud-5y'].includes(item.id));
  if (!studioItems.length) return;

  const url = String(env.STUDIO_GRANT_URL || '').trim();
  const secret = String(env.STUDIO_STORE_WEBHOOK_SECRET || '').trim();
  if (!url || !secret) throw new Error('Cầu cấp quyền Conic Studio chưa được cấu hình.');

  for (const item of studioItems) {
    const body = JSON.stringify({
      orderId: order.id,
      transactionId,
      productId: item.id,
      email: String(order.email).toLowerCase(),
      accessDays: Math.round(Number(item.accessDays) || 365),
      totalVnd: Math.round(Number(item.price) || 0),
      paidAt,
    });
    const timestamp = String(Math.floor(Date.now() / 1000));
    const signature = await hmacHex(`${timestamp}.${body}`, secret);
    const response = await globalThis.fetch(url, {
      method: 'POST',
      headers: {
        'content-type': 'application/json',
        'x-sangmath-timestamp': timestamp,
        'x-sangmath-signature': signature,
      },
      body,
    });
    if (!response.ok) {
      const result = await response.json().catch(() => ({}));
      throw new Error(result.error || `Conic Studio trả về HTTP ${response.status}.`);
    }
  }
}

async function fulfillExternalAccess(order, env, transactionId, paidAt) {
  await fulfillConicGv(order, env, transactionId, paidAt);
  await fulfillConicStudio(order, env, transactionId, paidAt);
}

export async function onRequestPost({ request, env }) {
  const rawBody = await request.text();
  if (!(await verifySepaySignature(request, rawBody, env.SEPAY_WEBHOOK_SECRET))) {
    return json({ success: false, error: "Unauthorized" }, 401);
  }

  let payload;
  try {
    payload = JSON.parse(rawBody);
  } catch {
    return json({ success: false, error: "Invalid JSON" }, 400);
  }

  const sepayId = String(payload.id || "");
  const transferAmount = Math.round(Number(payload.transferAmount || 0));
  const transferType = String(payload.transferType || "").toLowerCase();
  const code = extractPaymentCode(payload);
  const receivedAt = new Date().toISOString();
  if (!sepayId || !Number.isSafeInteger(transferAmount) || transferAmount <= 0) {
    return json({ success: false, error: "Invalid transaction" }, 400);
  }

  const existing = await env.DB.prepare(
    "SELECT sepay_id,matched_order_id,result,received_at FROM transactions WHERE sepay_id = ?",
  ).bind(sepayId).first();
  if (existing) {
    if (existing.result === "paid" && existing.matched_order_id) {
      const paidOrder = await env.DB.prepare("SELECT * FROM orders WHERE id = ?").bind(existing.matched_order_id).first();
      if (paidOrder) {
        try {
          await fulfillExternalAccess(paidOrder, env, sepayId, existing.received_at);
          await env.DB.prepare("UPDATE orders SET last_payment_error = NULL WHERE id = ?").bind(paidOrder.id).run();
        } catch (error) {
          await env.DB.prepare("UPDATE orders SET last_payment_error = ? WHERE id = ?")
            .bind(`Đã nhận tiền; đang thử lại bước kích hoạt: ${error.message}`, paidOrder.id).run();
          return json({ success: false, retry: true }, 503);
        }
      }
    }
    return json({ success: true, duplicate: true });
  }

  let order = null;
  let result = transferType && transferType !== "in" ? "ignored_outgoing" : "unmatched";
  if ((!transferType || transferType === "in") && code) {
    order = await env.DB.prepare("SELECT * FROM orders WHERE payment_code = ?").bind(code).first();
    if (order) {
      if (order.status === "paid") result = "order_already_paid";
      else if (order.total_vnd !== transferAmount) result = "amount_mismatch";
      else result = "paid";
    }
  }

  await env.DB.prepare(
    `INSERT INTO transactions
      (sepay_id, reference_code, payment_code, transfer_amount, transfer_type, matched_order_id, result, payload_json, received_at)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
  )
    .bind(sepayId, String(payload.referenceCode || ""), code, transferAmount, transferType, order?.id || null, result, rawBody, receivedAt)
    .run();

  if (result === "paid") {
    const items = JSON.parse(order.items_json);
    const grants = items
      .filter((item) => item.fulfillmentType === "web_access")
      .map((item) => {
        const accessDays = Math.max(1, Math.min(3650, Math.round(Number(item.accessDays) || 365)));
        const expiresAt = new Date(Date.parse(receivedAt) + accessDays * 86400000).toISOString();
        return env.DB.prepare(
          `INSERT INTO access_grants
            (id,email,access_key,source_product_id,last_order_id,starts_at,expires_at,revoked_at,updated_at)
           VALUES (?,?,?,?,?,?,?,NULL,?)
           ON CONFLICT(email,access_key) DO UPDATE SET
             source_product_id=excluded.source_product_id,
             last_order_id=excluded.last_order_id,
             starts_at=excluded.starts_at,
             expires_at=CASE
               WHEN access_grants.expires_at IS NULL THEN NULL
               WHEN julianday(access_grants.expires_at) > julianday(excluded.starts_at)
                 THEN datetime(access_grants.expires_at, '+' || ? || ' days')
               ELSE excluded.expires_at
             END,
             revoked_at=NULL,
             updated_at=excluded.updated_at`,
        ).bind(
          crypto.randomUUID(),
          String(order.email).toLowerCase(),
          item.entitlementKey || item.id,
          item.id,
          order.id,
          receivedAt,
          expiresAt,
          receivedAt,
          accessDays,
        );
      });
    await env.DB.batch([
      env.DB.prepare(
        "UPDATE orders SET status = 'paid', paid_at = ?, transaction_id = ?, last_payment_error = NULL WHERE id = ? AND status = 'pending'",
      ).bind(receivedAt, sepayId, order.id),
      ...grants,
    ]);

    try {
      await fulfillExternalAccess(order, env, sepayId, receivedAt);
    } catch (error) {
      await env.DB.prepare("UPDATE orders SET last_payment_error = ? WHERE id = ?")
        .bind(`Đã nhận tiền; đang thử lại bước kích hoạt: ${error.message}`, order.id).run();
      return json({ success: false, retry: true }, 503);
    }
  } else if (result === "amount_mismatch") {
    await env.DB.prepare(
      "UPDATE orders SET last_payment_error = ? WHERE id = ? AND status = 'pending'",
    ).bind(`Đã nhận ${transferAmount}đ, cần đúng ${order.total_vnd}đ.`, order.id).run();
  }

  return json({ success: true });
}
