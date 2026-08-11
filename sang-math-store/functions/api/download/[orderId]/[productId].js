import { authorizeOrder, json } from "../../../_shared.js";

export async function onRequestGet({ request, env, params }) {
  const product = await env.DB.prepare("SELECT id,file_key,file_name,fulfillment_type FROM products WHERE id=?").bind(params.productId).first();
  if (!product) return json({ error: "Sản phẩm không tồn tại." }, 404);
  const order = await env.DB.prepare("SELECT * FROM orders WHERE id = ?").bind(params.orderId).first();
  const url = new URL(request.url);
  if (!(await authorizeOrder(order, request, url))) return json({ error: "Liên kết tải không hợp lệ." }, 404);
  if (order.status !== "paid") return json({ error: "Đơn hàng chưa được thanh toán." }, 403);
  const items = JSON.parse(order.items_json);
  if (!items.some((item) => item.id === params.productId)) return json({ error: "Mẫu này không thuộc đơn hàng." }, 403);
  if (product.fulfillment_type !== "download") return json({ error: "Sản phẩm này được giao bằng quyền truy cập web." }, 400);

  const object = await env.DOWNLOADS.get(product.file_key || `products/${params.productId}.zip`);
  if (!object) return json({ error: "File đang được cập nhật. Vui lòng liên hệ hỗ trợ." }, 503);
  return new Response(object.body, {
    headers: {
      "content-type": "application/zip",
      "content-disposition": `attachment; filename="${product.file_name || `sang-math-${params.productId}.zip`}"`,
      "content-length": String(object.size),
      "cache-control": "private, no-store",
      "referrer-policy": "no-referrer",
      "x-content-type-options": "nosniff",
    },
  });
}
