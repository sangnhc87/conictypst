export const PRODUCTS = Object.freeze({
  "teal-pro": { name: "Teal Pro", price: 19000 },
  aurora: { name: "Aurora", price: 19000 },
  "navy-gold": { name: "Navy Gold", price: 19000 },
  lotus: { name: "Lotus", price: 19000 },
  "ocean-hexagon": { name: "Ocean Hexagon", price: 19000 },
  hyperlink: { name: "Hyperlink Tự Động", price: 19000 },
  beamer: { name: "Beamer Teal Pro", price: 19000 },
  "draft-duplex": { name: "Đề 70/30 — Nháp Đối Xứng", price: 19000 },
});

const encoder = new TextEncoder();
const FIREBASE_IDENTITY_API_KEY = "AIzaSyDwbd6q4EHUp_JouOD5K1a96yNxq_RTTfc";

export function json(data, status = 200, extraHeaders = {}) {
  return new Response(JSON.stringify(data), {
    status,
    headers: {
      "content-type": "application/json; charset=utf-8",
      "cache-control": "no-store",
      "referrer-policy": "no-referrer",
      ...extraHeaders,
    },
  });
}

export async function calculateOrder(rawItems, env) {
  if (!Array.isArray(rawItems)) throw new Error("Danh sách mẫu không hợp lệ.");
  const ids = [...new Set(rawItems.map(String))];
  if (!ids.length || ids.length > 50) throw new Error("Hãy chọn ít nhất một mẫu.");
  const placeholders = ids.map(() => "?").join(",");
  const { results } = await env.DB.prepare(`SELECT id,name,price_vnd,starter,product_type,fulfillment_type,access_model,access_days,entitlement_key FROM products WHERE active=1 AND id IN (${placeholders})`).bind(...ids).all();
  if (results.length !== ids.length) throw new Error("Có mẫu không tồn tại hoặc đang tạm ẩn.");
  const byId = new Map(results.map((row) => [row.id, row]));
  const starters = results.filter((row) => row.starter);
  const starterCount = await env.DB.prepare("SELECT COUNT(*) AS count FROM products WHERE active=1 AND starter=1").first();
  const hasStarterCombo = starters.length >= 2 && starters.length === Number(starterCount?.count || 0);
  const normalTotal = results.reduce((sum, row) => sum + row.price_vnd, 0);
  const combo = hasStarterCombo ? await env.DB.prepare("SELECT value FROM settings WHERE key='starter_combo_price'").first() : null;
  const starterTotal = starters.reduce((sum, row) => sum + row.price_vnd, 0);
  const total = hasStarterCombo ? Number(combo?.value || starterTotal) + normalTotal - starterTotal : normalTotal;
  return {
    ids,
    total,
    items: ids.map((id) => {
      const product = byId.get(id);
      return {
        id,
        name: product.name,
        price: product.price_vnd,
        productType: product.product_type,
        fulfillmentType: product.fulfillment_type,
        accessModel: product.access_model,
        accessDays: product.access_days,
        entitlementKey: product.entitlement_key || product.id,
      };
    }),
  };
}

export function adminAuthorized(request, env) {
  const provided = request.headers.get("x-admin-key") || "";
  const expected = env.ADMIN_KEY || "";
  return expected.length >= 20 && timingSafeEqual(provided, expected);
}

// Số lần sai tối đa trong cửa sổ trước khi khóa IP, và thời lượng khóa.
const ADMIN_MAX_FAILS = 10;
const ADMIN_WINDOW_MS = 15 * 60 * 1000; // cửa sổ đếm sai: 15 phút
const ADMIN_BLOCK_MS = 15 * 60 * 1000; // thời gian khóa sau khi vượt ngưỡng

// Bọc adminAuthorized bằng rate-limit theo IP (chống dò mật khẩu).
// Trả về: { ok: bool, blocked: bool, retryAfter: giây }.
// AN TOÀN: mọi truy cập D1 nằm trong try/catch. Nếu bảng chưa tồn tại
// (migration 0012 chưa chạy) hoặc D1 lỗi → tự fallback về kiểm tra key thuần,
// KHÔNG bao giờ khóa nhầm admin thật.
export async function adminAuthorizedLimited(request, env, now = Date.now()) {
  const ip = request.headers.get("cf-connecting-ip") || "unknown";
  const nowIso = new Date(now).toISOString();

  let row = null;
  try {
    row = await env.DB.prepare(
      "SELECT ip, fail_count, first_fail_at, blocked_until FROM admin_auth_attempts WHERE ip = ?",
    ).bind(ip).first();
  } catch (_) {
    // Bảng chưa có / D1 lỗi → bỏ qua rate-limit, chỉ kiểm tra key như cũ.
    return { ok: adminAuthorized(request, env), blocked: false, retryAfter: 0 };
  }

  // Đang trong thời gian khóa?
  if (row && row.blocked_until && Date.parse(row.blocked_until) > now) {
    return { ok: false, blocked: true, retryAfter: Math.ceil((Date.parse(row.blocked_until) - now) / 1000) };
  }

  const passed = adminAuthorized(request, env);

  try {
    if (passed) {
      // Đúng key → xóa lịch sử sai của IP này.
      if (row) await env.DB.prepare("DELETE FROM admin_auth_attempts WHERE ip = ?").bind(ip).run();
      return { ok: true, blocked: false, retryAfter: 0 };
    }

    // Sai key → tăng đếm. Reset cửa sổ nếu lần sai đầu đã quá hạn.
    const windowExpired = row && (now - Date.parse(row.first_fail_at)) > ADMIN_WINDOW_MS;
    const fails = (row && !windowExpired ? row.fail_count : 0) + 1;
    const firstFailAt = row && !windowExpired ? row.first_fail_at : nowIso;
    const blockedUntil = fails >= ADMIN_MAX_FAILS ? new Date(now + ADMIN_BLOCK_MS).toISOString() : null;

    await env.DB.prepare(
      `INSERT INTO admin_auth_attempts (ip, fail_count, first_fail_at, blocked_until)
       VALUES (?,?,?,?)
       ON CONFLICT(ip) DO UPDATE SET fail_count=excluded.fail_count, first_fail_at=excluded.first_fail_at, blocked_until=excluded.blocked_until`,
    ).bind(ip, fails, firstFailAt, blockedUntil).run();

    if (blockedUntil) {
      return { ok: false, blocked: true, retryAfter: Math.ceil(ADMIN_BLOCK_MS / 1000) };
    }
  } catch (_) {
    // D1 ghi lỗi → không chặn, chỉ trả kết quả kiểm tra key.
  }

  return { ok: passed, blocked: false, retryAfter: 0 };
}

export function validEmail(value) {
  return typeof value === "string" && value.length <= 180 && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
}

export function validGmail(value) {
  return validEmail(value) && String(value).trim().toLowerCase().endsWith("@gmail.com");
}

export async function authenticatedGoogleUser(request) {
  const authorization = request.headers.get("authorization") || "";
  const token = authorization.startsWith("Bearer ") ? authorization.slice(7).trim() : "";
  if (token.length < 100) return null;

  let response;
  try {
    response = await globalThis.fetch(`https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=${FIREBASE_IDENTITY_API_KEY}`, {
      method: "POST",
      headers: { "content-type": "application/json" },
      body: JSON.stringify({ idToken: token }),
    });
  } catch {
    return null;
  }
  if (!response.ok) return null;
  const data = await response.json();
  const account = data.users?.[0];
  const email = String(account?.email || "").trim().toLowerCase();
  const googleProvider = account?.providerUserInfo?.some((provider) => provider.providerId === "google.com");
  if (!account?.emailVerified || !googleProvider || !validGmail(email)) return null;
  return { email, name: account.displayName || "", picture: account.photoUrl || "" };
}

export function randomToken(bytes = 24) {
  const data = crypto.getRandomValues(new Uint8Array(bytes));
  return toBase64Url(data);
}

export function paymentCode() {
  const alphabet = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
  const bytes = crypto.getRandomValues(new Uint8Array(9));
  return "SM" + Array.from(bytes, (value) => alphabet[value % alphabet.length]).join("");
}

export async function sha256(value) {
  const digest = await crypto.subtle.digest("SHA-256", encoder.encode(value));
  return toHex(new Uint8Array(digest));
}

export async function authorizeOrder(order, request, url) {
  const token = request.headers.get("x-order-token") || url.searchParams.get("token") || "";
  if (!token || !order || (await sha256(token)) !== order.access_token_hash) return false;
  return true;
}

export function publicOrder(order, env) {
  const items = JSON.parse(order.items_json);
  const accountName = env.BANK_ACCOUNT_NAME || "NGUYEN VAN SANG";
  const qrParams = new URLSearchParams({
    amount: String(order.total_vnd),
    addInfo: order.payment_code,
    accountName,
  });
  const accountNumber = env.BANK_ACCOUNT_NUMBER || "AGBSPTU0DENS09";
  return {
    id: order.id,
    paymentCode: order.payment_code,
    email: order.email,
    items,
    total: order.total_vnd,
    status: normalizedStatus(order),
    createdAt: order.created_at,
    expiresAt: order.expires_at,
    paidAt: order.paid_at,
    paymentError: order.last_payment_error,
    bank: {
      code: env.BANK_CODE || "VPBANK",
      accountNumber,
      accountName,
    },
    qrUrl: accountNumber
      ? `https://sang-math-store.pages.dev/api/qr?url=${encodeURIComponent(`https://img.vietqr.io/image/${env.BANK_CODE || "VPBANK"}-${accountNumber}-qr_only.png?${qrParams}`)}`
      : null,
  };
}

export function normalizedStatus(order) {
  if (order.status === "pending" && Date.parse(order.expires_at) <= Date.now()) return "expired";
  return order.status;
}

export function extractPaymentCode(payload) {
  const candidates = [payload.code, payload.content, payload.description];
  for (const candidate of candidates) {
    const match = String(candidate || "").toUpperCase().match(/\bSM[A-Z2-9]{9}\b/);
    if (match) return match[0];
  }
  return null;
}

export async function verifySepaySignature(request, rawBody, secret) {
  if (!secret) return false;
  const timestamp = request.headers.get("x-sepay-timestamp") || "";
  const provided = (request.headers.get("x-sepay-signature") || "").replace(/^sha256=/i, "").toLowerCase();
  const seconds = Number(timestamp);
  if (!Number.isFinite(seconds) || Math.abs(Date.now() / 1000 - seconds) > 300) return false;
  const key = await crypto.subtle.importKey("raw", encoder.encode(secret), { name: "HMAC", hash: "SHA-256" }, false, ["sign"]);
  const signature = await crypto.subtle.sign("HMAC", key, encoder.encode(`${timestamp}.${rawBody}`));
  return timingSafeEqual(provided, toHex(new Uint8Array(signature)));
}

function timingSafeEqual(a, b) {
  if (a.length !== b.length || !a.length) return false;
  let mismatch = 0;
  for (let index = 0; index < a.length; index += 1) mismatch |= a.charCodeAt(index) ^ b.charCodeAt(index);
  return mismatch === 0;
}

function toHex(bytes) {
  return Array.from(bytes, (byte) => byte.toString(16).padStart(2, "0")).join("");
}

function toBase64Url(bytes) {
  let binary = "";
  for (const byte of bytes) binary += String.fromCharCode(byte);
  return btoa(binary).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/g, "");
}
