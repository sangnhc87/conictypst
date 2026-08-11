import { authenticatedGoogleUser, json } from "../../_shared.js";

const TRIAL_HOURS = 24;

export async function onRequestPost({ request, env, params }) {
  const user = await authenticatedGoogleUser(request);
  if (!user) return json({ error: "Vui lòng đăng nhập Gmail để bắt đầu dùng thử." }, 401);

  const accessKey = String(params.accessKey || "").trim().toLowerCase();
  if (!/^[a-z0-9][a-z0-9-]{1,63}$/.test(accessKey)) {
    return json({ error: "Sản phẩm dùng thử không hợp lệ." }, 400);
  }

  const product = await env.DB.prepare(
    `SELECT id FROM products
     WHERE active=1 AND product_type='game' AND entitlement_key=?
     LIMIT 1`,
  ).bind(accessKey).first();
  if (!product) return json({ error: "Game này chưa mở dùng thử." }, 404);

  const grant = await env.DB.prepare(
    `SELECT expires_at FROM access_grants
     WHERE email=? AND access_key=? AND revoked_at IS NULL
       AND (expires_at IS NULL OR datetime(expires_at) > datetime('now'))`,
  ).bind(user.email, accessKey).first();
  if (grant) return json({ error: "Gmail này đã có gói sử dụng đang hoạt động." }, 409);

  const startedAt = new Date();
  const expiresAt = new Date(startedAt.getTime() + TRIAL_HOURS * 60 * 60 * 1000);
  const inserted = await env.DB.prepare(
    `INSERT INTO product_trials (id,email,access_key,started_at,expires_at)
     VALUES (?,?,?,?,?)
     ON CONFLICT(email,access_key) DO NOTHING`,
  ).bind(crypto.randomUUID(), user.email, accessKey, startedAt.toISOString(), expiresAt.toISOString()).run();

  if (!inserted.meta?.changes) {
    const previous = await env.DB.prepare(
      "SELECT started_at,expires_at FROM product_trials WHERE email=? AND access_key=?",
    ).bind(user.email, accessKey).first();
    return json({
      error: "Gmail này đã sử dụng lượt thử của game.",
      trial: previous ? { accessKey, startedAt: previous.started_at, expiresAt: previous.expires_at, active: Date.parse(previous.expires_at) > Date.now() } : null,
    }, 409);
  }

  return json({
    trial: {
      accessKey,
      startedAt: startedAt.toISOString(),
      expiresAt: expiresAt.toISOString(),
      active: true,
    },
  }, 201);
}
