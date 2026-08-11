import { json } from "../_shared.js";

export async function onRequestGet({ env }) {
  const { results } = await env.DB.prepare("SELECT id,name,eyebrow,description,image,image2,color,price_vnd,starter,sort_order,product_type,fulfillment_type,access_model,access_days,entitlement_key,badge,featured FROM products WHERE active = 1 ORDER BY featured DESC,sort_order,id").all();
  const combo = await env.DB.prepare("SELECT value FROM settings WHERE key = 'starter_combo_price'").first();
  return json({
    products: results.map((row) => ({ ...row, price: row.price_vnd, starter: Boolean(row.starter) })),
    comboPrice: Number(combo?.value || 79000),
  });
}
