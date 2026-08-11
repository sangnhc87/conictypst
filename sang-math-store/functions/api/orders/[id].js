import { authorizeOrder, json, publicOrder } from "../../_shared.js";

export async function onRequestGet({ request, env, params }) {
  if (!env.DB) return json({ error: "Dịch vụ đơn hàng chưa sẵn sàng." }, 503);
  const order = await env.DB.prepare("SELECT * FROM orders WHERE id = ?").bind(params.id).first();
  const url = new URL(request.url);
  if (!(await authorizeOrder(order, request, url))) return json({ error: "Không tìm thấy đơn hàng." }, 404);
  return json({ order: publicOrder(order, env) });
}
