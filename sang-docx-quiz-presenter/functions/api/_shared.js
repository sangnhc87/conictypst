const JSON_HEADERS = {
  "content-type": "application/json; charset=utf-8",
  "cache-control": "no-store",
  "x-content-type-options": "nosniff",
};

// Keep this allow-list in the server layer as the final authorization check.
// The client may display an admin link, but it is never trusted for access.
export const ADMIN_EMAILS = Object.freeze([
  "nguyensangnhc@gmail.com",
  "sangbeau@gmail.com",
]);

export const isAdminEmail = (email) => ADMIN_EMAILS.includes(String(email || "").trim().toLowerCase());

export const json = (data, status = 200, extraHeaders = {}) =>
  new Response(JSON.stringify(data), {
    status,
    headers: { ...JSON_HEADERS, ...extraHeaders },
  });

export const fail = (message, status = 400, details = undefined) =>
  json({ ok: false, error: message, ...(details ? { details } : {}) }, status);

export const parsePositiveInt = (value, fallback, max) => {
  const parsed = Number.parseInt(String(value ?? ""), 10);
  if (!Number.isFinite(parsed) || parsed <= 0) return fallback;
  return Math.min(parsed, max);
};

export const fileToDataUrl = async (file) => {
  const bytes = new Uint8Array(await file.arrayBuffer());
  let binary = "";
  const chunk = 0x8000;
  for (let index = 0; index < bytes.length; index += chunk) {
    binary += String.fromCharCode(...bytes.subarray(index, index + chunk));
  }
  return `data:${file.type || "application/octet-stream"};base64,${btoa(binary)}`;
};

const bytesToDataUrl = (bytes, mimeType = "application/octet-stream") => {
  let binary = "";
  const chunk = 0x8000;
  for (let index = 0; index < bytes.length; index += chunk) binary += String.fromCharCode(...bytes.subarray(index, index + chunk));
  return `data:${mimeType};base64,${btoa(binary)}`;
};

export const collectRemoteMathpixImages = async (markdown) => {
  const urls = [...new Set([...String(markdown).matchAll(/!\[[^\]]*\]\((https:\/\/[^)\s]+)\)/g)].map((match) => match[1]))].slice(0, 30);
  const assets = [];
  for (const url of urls) {
    try {
      const parsed = new URL(url);
      if (!parsed.hostname.endsWith("mathpix.com")) continue;
      const response = await fetch(url);
      if (!response.ok) continue;
      const contentType = response.headers.get("content-type") || "image/png";
      if (!contentType.startsWith("image/")) continue;
      const bytes = new Uint8Array(await response.arrayBuffer());
      if (bytes.byteLength > 8 * 1024 * 1024) continue;
      assets.push({ url, dataUrl: bytesToDataUrl(bytes, contentType) });
    } catch {
      // A missing crop should remain a visible warning in the structured result, not fail the whole exam.
    }
  }
  return assets;
};

export const safeError = async (response) => {
  const text = await response.text();
  try {
    const parsed = JSON.parse(text);
    return parsed?.message || parsed?.error?.message || parsed?.error || text;
  } catch {
    return text.slice(0, 500);
  }
};

export const corsHeaders = (request) => {
  const origin = request.headers.get("origin") || "";
  const allowed = origin === "" || origin.endsWith(".pages.dev") || origin.startsWith("http://localhost:") || origin.startsWith("http://127.0.0.1:");
  return {
    "access-control-allow-origin": allowed ? origin || "*" : "null",
    "access-control-allow-methods": "GET,POST,OPTIONS",
    "access-control-allow-headers": "content-type",
    "access-control-max-age": "86400",
  };
};

export const withCors = (response, request) => {
  const headers = new Headers(response.headers);
  for (const [key, value] of Object.entries(corsHeaders(request))) headers.set(key, value);
  return new Response(response.body, { status: response.status, headers });
};

export const guardExpensiveRequest = async (request, action) => {
  const requestUrl = new URL(request.url);
  const origin = request.headers.get("origin");
  if (origin) {
    try {
      if (new URL(origin).host !== requestUrl.host) return fail("Yêu cầu khác nguồn đã bị từ chối.", 403);
    } catch {
      return fail("Origin không hợp lệ.", 403);
    }
  }
  if (typeof caches === "undefined" || !caches.default) return null;
  const actor = (request.headers.get("cf-connecting-ip") || "local").replace(/[^0-9A-Fa-f:._-]/g, "").slice(0, 80);
  const windowId = Math.floor(Date.now() / 60_000);
  const cacheKey = new Request(`https://conic-rate-limit.invalid/${encodeURIComponent(actor)}/${action}/${windowId}`);
  const previous = await caches.default.match(cacheKey);
  const count = Number(previous?.headers.get("x-request-count") || 0) + 1;
  const limit = action === "structure" ? 48 : 12;
  if (count > limit) return fail("Bạn đang gửi quá nhanh. Hãy đợi khoảng một phút để bảo vệ hạn mức OCR.", 429);
  await caches.default.put(cacheKey, new Response("", {
    headers: { "x-request-count": String(count), "cache-control": "public, max-age=65" },
  }));
  return null;
};
