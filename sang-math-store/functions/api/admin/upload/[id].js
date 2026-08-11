import { adminAuthorizedLimited, json } from "../../../_shared.js";

export async function onRequestPost({ request, env, params }) {
  const auth = await adminAuthorizedLimited(request, env);
  if (auth.blocked) return json({ error: "Quá nhiều lần sai. Thử lại sau ít phút." }, 429, { "retry-after": String(auth.retryAfter) });
  if (!auth.ok) return json({ error: "Sai mật khẩu quản trị." }, 401);
  const id = String(params.id || "").toLowerCase();
  if (!/^[a-z0-9][a-z0-9-]{1,48}$/.test(id)) return json({ error: "Mã sản phẩm không hợp lệ." }, 400);
  const form = await request.formData();
  const file = form.get("file");
  if (!(file instanceof File) || file.size < 4 || file.size > 20 * 1024 * 1024) return json({ error: "Chọn file ZIP tối đa 20 MB." }, 400);
  const bytes = new Uint8Array(await file.arrayBuffer());
  if (bytes[0] !== 0x50 || bytes[1] !== 0x4b) return json({ error: "File không đúng định dạng ZIP." }, 400);
  const key = `products/${id}.zip`;
  await env.DOWNLOADS.put(key, bytes, { httpMetadata: { contentType: "application/zip" }, customMetadata: { originalName: file.name } });
  await env.DB.prepare("UPDATE products SET file_key=?,file_name=?,file_size=?,updated_at=? WHERE id=?").bind(key, file.name.slice(0, 180), file.size, new Date().toISOString(), id).run();
  return json({ success: true, fileName: file.name, fileSize: file.size });
}
