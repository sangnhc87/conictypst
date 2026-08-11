import { calculateOrder, json, paymentCode, publicOrder, randomToken, sha256, validEmail, validGmail } from "../../_shared.js";

export async function onRequestPost({ request, env }) {
  if (!env.DB) return json({ error: "Thanh toán đang được cấu hình." }, 503);
  let body;
  try {
    body = await request.json();
  } catch {
    return json({ error: "Dữ liệu đơn hàng không hợp lệ." }, 400);
  }
  if (!validEmail(body.email)) return json({ error: "Vui lòng nhập email hợp lệ." }, 400);

  let orderData;
  try {
    orderData = await calculateOrder(body.items, env);
  } catch (error) {
    return json({ error: error.message }, 400);
  }
  if (orderData.items.some((item) => item.fulfillmentType === "web_access") && !validGmail(body.email)) {
    return json({ error: "Game và tiện ích web cần một địa chỉ Gmail để cấp quyền theo thời hạn." }, 400);
  }

  const id = crypto.randomUUID();
  const token = randomToken();
  const now = new Date();
  const expiresAt = new Date(now.getTime() + 24 * 60 * 60 * 1000);
  let code;
  let inserted = false;

  for (let attempt = 0; attempt < 4 && !inserted; attempt += 1) {
    code = paymentCode();
    try {
      await env.DB.prepare(
        `INSERT INTO orders (id, access_token_hash, payment_code, email, items_json, total_vnd, status, created_at, expires_at)
         VALUES (?, ?, ?, ?, ?, ?, 'pending', ?, ?)`,
      )
        .bind(id, await sha256(token), code, body.email.trim().toLowerCase(), JSON.stringify(orderData.items), orderData.total, now.toISOString(), expiresAt.toISOString())
        .run();
      inserted = true;
    } catch (error) {
      if (!String(error).includes("UNIQUE")) throw error;
    }
  }

  if (!inserted) return json({ error: "Không thể tạo mã thanh toán. Vui lòng thử lại." }, 503);
  const order = await env.DB.prepare("SELECT * FROM orders WHERE id = ?").bind(id).first();
  return json({ order: publicOrder(order, env), token }, 201);
}
