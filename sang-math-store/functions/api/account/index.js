import { authenticatedGoogleUser, json } from "../../_shared.js";

export async function onRequestGet({ request, env }) {
  const user = await authenticatedGoogleUser(request);
  if (!user) return json({ error: "Vui lòng đăng nhập bằng Gmail đã mua sản phẩm." }, 401);

  const { results: grants } = await env.DB.prepare(
    `SELECT g.access_key,g.source_product_id,g.starts_at,g.expires_at,
            p.name,p.product_type,p.delivery_url
     FROM access_grants g
     LEFT JOIN products p ON p.id=g.source_product_id
     WHERE g.email=? AND g.revoked_at IS NULL
       AND (g.expires_at IS NULL OR datetime(g.expires_at) > datetime('now'))
     ORDER BY g.updated_at DESC`,
  ).bind(user.email).all();

  const { results: trials } = await env.DB.prepare(
    `SELECT access_key,started_at,expires_at
     FROM product_trials
     WHERE email=?
     ORDER BY started_at DESC`,
  ).bind(user.email).all();

  return json({
    user: { email: user.email, name: user.name, picture: user.picture },
    entitlements: grants.map((row) => ({
      accessKey: row.access_key,
      productId: row.source_product_id,
      productName: row.name,
      productType: row.product_type,
      deliveryUrl: row.delivery_url,
      startsAt: row.starts_at,
      expiresAt: row.expires_at,
    })),
    trials: trials.map((row) => ({
      accessKey: row.access_key,
      startedAt: row.started_at,
      expiresAt: row.expires_at,
      active: Date.parse(row.expires_at) > Date.now(),
    })),
  });
}
