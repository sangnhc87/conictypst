import { adminAuthorizedLimited, json } from "../../_shared.js";

export async function onRequestGet({ request, env }) {
  const auth = await adminAuthorizedLimited(request, env);
  if (auth.blocked) return json({ error: "Quá nhiều lần sai. Thử lại sau ít phút." }, 429, { "retry-after": String(auth.retryAfter) });
  if (!auth.ok) return json({ error: "Sai mật khẩu quản trị." }, 401);
  const { results } = await env.DB.prepare("SELECT * FROM products ORDER BY sort_order,id").all();
  const combo = await env.DB.prepare("SELECT value FROM settings WHERE key = 'starter_combo_price'").first();
  return json({ products: results, comboPrice: Number(combo?.value || 79000) });
}

export async function onRequestPut({ request, env }) {
  const auth = await adminAuthorizedLimited(request, env);
  if (auth.blocked) return json({ error: "Quá nhiều lần sai. Thử lại sau ít phút." }, 429, { "retry-after": String(auth.retryAfter) });
  if (!auth.ok) return json({ error: "Sai mật khẩu quản trị." }, 401);
  const body = await request.json();
  if (!Array.isArray(body.products) || body.products.length > 50) return json({ error: "Danh sách sản phẩm không hợp lệ." }, 400);
  const now = new Date().toISOString();
  const statements = [];
  for (const [index, product] of body.products.entries()) {
    const id = String(product.id || "").trim().toLowerCase();
    const price = Math.round(Number(product.price_vnd));
    if (!/^[a-z0-9][a-z0-9-]{1,48}$/.test(id) || !String(product.name || "").trim() || !Number.isSafeInteger(price) || price < 0 || price > 50000000) {
      return json({ error: `Sản phẩm số ${index + 1} không hợp lệ.` }, 400);
    }
    const productType = ["template", "utility", "game", "account", "latex"].includes(product.product_type) ? product.product_type : "template";
    const fulfillmentType = ["download", "web_access"].includes(product.fulfillment_type) ? product.fulfillment_type : "download";
    const accessModel = ["lifetime", "subscription"].includes(product.access_model) ? product.access_model : "subscription";
    const accessDays = accessModel === "subscription" ? Math.max(1, Math.min(3650, Math.round(Number(product.access_days) || 30))) : null;
    const entitlementKey = fulfillmentType === "web_access"
      ? String(product.entitlement_key || id).trim().toLowerCase().replace(/[^a-z0-9-]/g, "-").slice(0, 64)
      : null;
    const deliveryUrl = fulfillmentType === "web_access" ? String(product.delivery_url || "").trim().slice(0, 500) : null;
    if (product.active && fulfillmentType === "web_access" && !/^https:\/\//i.test(deliveryUrl)) {
      return json({ error: `Sản phẩm số ${index + 1} cần đường dẫn HTTPS để giao tự động.` }, 400);
    }
    statements.push(env.DB.prepare(
      `INSERT INTO products (id,name,eyebrow,description,image,image2,color,price_vnd,active,starter,sort_order,file_key,file_name,file_size,updated_at,product_type,fulfillment_type,access_model,access_days,delivery_url,badge,featured,entitlement_key)
       VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
       ON CONFLICT(id) DO UPDATE SET name=excluded.name,eyebrow=excluded.eyebrow,description=excluded.description,image=excluded.image,image2=excluded.image2,color=excluded.color,price_vnd=excluded.price_vnd,active=excluded.active,starter=excluded.starter,sort_order=excluded.sort_order,updated_at=excluded.updated_at,product_type=excluded.product_type,fulfillment_type=excluded.fulfillment_type,access_model=excluded.access_model,access_days=excluded.access_days,delivery_url=excluded.delivery_url,badge=excluded.badge,featured=excluded.featured,entitlement_key=excluded.entitlement_key`,
    ).bind(id, String(product.name).trim().slice(0, 100), String(product.eyebrow || "Sản phẩm số").trim().slice(0, 80), String(product.description || "").trim().slice(0, 500), String(product.image || "/previews/teal-pro.png").trim().slice(0, 300), product.image2 ? String(product.image2).trim().slice(0, 300) : null, /^#[0-9a-f]{6}$/i.test(product.color || "") ? product.color : "#0f766e", price, product.active ? 1 : 0, product.starter ? 1 : 0, Math.round(Number(product.sort_order) || index + 1), product.file_key || null, product.file_name || null, product.file_size || null, now, productType, fulfillmentType, accessModel, accessDays, deliveryUrl, String(product.badge || "").trim().slice(0, 30) || null, product.featured ? 1 : 0, entitlementKey));
  }
  const comboPrice = Math.round(Number(body.comboPrice));
  if (!Number.isSafeInteger(comboPrice) || comboPrice < 0 || comboPrice > 50000000) return json({ error: "Giá combo không hợp lệ." }, 400);
  statements.push(env.DB.prepare("INSERT INTO settings (key,value,updated_at) VALUES ('starter_combo_price',?,?) ON CONFLICT(key) DO UPDATE SET value=excluded.value,updated_at=excluded.updated_at").bind(String(comboPrice), now));
  await env.DB.batch(statements);
  return json({ success: true });
}
