import { authorizeOrder, json } from "../../../_shared.js";

export async function onRequestGet({ request, env, params }) {
  const product = await env.DB.prepare(
    "SELECT id,fulfillment_type,delivery_url FROM products WHERE id=?",
  ).bind(params.productId).first();
  if (!product) return json({ error: "Sản phẩm không tồn tại." }, 404);

  const order = await env.DB.prepare("SELECT * FROM orders WHERE id = ?").bind(params.orderId).first();
  const url = new URL(request.url);
  if (!(await authorizeOrder(order, request, url))) return json({ error: "Liên kết truy cập không hợp lệ." }, 404);
  if (order.status !== "paid") return json({ error: "Đơn hàng chưa được thanh toán." }, 403);

  const items = JSON.parse(order.items_json);
  if (!items.some((item) => item.id === params.productId)) return json({ error: "Sản phẩm này không thuộc đơn hàng." }, 403);
  if (product.fulfillment_type !== "web_access" || !product.delivery_url) {
    return json({ error: "Sản phẩm chưa có đường dẫn sử dụng tự động." }, 503);
  }

  let destination;
  try {
    destination = new URL(product.delivery_url);
  } catch {
    return json({ error: "Đường dẫn sản phẩm chưa hợp lệ." }, 503);
  }
  if (destination.protocol !== "https:") return json({ error: "Đường dẫn sản phẩm phải dùng HTTPS." }, 503);

  return Response.redirect(destination.toString(), 302);
}

