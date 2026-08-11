const MAX_TICKET_LIFETIME_SECONDS = 10 * 60;
const MAX_OBJECT_BYTES = 16 * 1024 * 1024;

function corsHeaders(request, env) {
  const origin = request.headers.get("Origin");
  const headers = {
    "Vary": "Origin",
    "Access-Control-Allow-Methods": "GET, PUT, POST, DELETE, OPTIONS",
    "Access-Control-Allow-Headers": "Authorization, Content-Type",
    "Access-Control-Expose-Headers": "ETag, Content-Length, Content-Type",
    "Access-Control-Max-Age": "3600",
  };
  if (origin && origin === env.ALLOWED_ORIGIN) headers["Access-Control-Allow-Origin"] = origin;
  return headers;
}

function response(request, env, body, init = {}) {
  const headers = new Headers(init.headers || {});
  Object.entries(corsHeaders(request, env)).forEach(([key, value]) => headers.set(key, value));
  headers.set("Cache-Control", "no-store");
  headers.set("X-Content-Type-Options", "nosniff");
  return new Response(body, { ...init, headers });
}

function json(request, env, data, status = 200) {
  return response(request, env, JSON.stringify(data), {
    status,
    headers: { "Content-Type": "application/json; charset=utf-8" },
  });
}

function fromBase64Url(value) {
  const normalized = value.replace(/-/g, "+").replace(/_/g, "/");
  const padded = normalized.padEnd(Math.ceil(normalized.length / 4) * 4, "=");
  const raw = atob(padded);
  return Uint8Array.from(raw, (char) => char.charCodeAt(0));
}

function hex(bytes) {
  return [...new Uint8Array(bytes)].map((value) => value.toString(16).padStart(2, "0")).join("");
}

async function verifyTicket(request, env, expectedOperation) {
  const authorization = request.headers.get("Authorization") || "";
  const token = authorization.startsWith("Bearer ") ? authorization.slice(7).trim() : "";
  const [encodedPayload, encodedSignature, extra] = token.split(".");
  if (!encodedPayload || !encodedSignature || extra) throw new Error("invalid-ticket");
  const key = await crypto.subtle.importKey(
    "raw",
    new TextEncoder().encode(env.STUDIO_STORAGE_HMAC_SECRET),
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["verify"],
  );
  const valid = await crypto.subtle.verify(
    "HMAC",
    key,
    fromBase64Url(encodedSignature),
    new TextEncoder().encode(encodedPayload),
  );
  if (!valid) throw new Error("invalid-ticket");
  const payload = JSON.parse(new TextDecoder().decode(fromBase64Url(encodedPayload)));
  const now = Math.floor(Date.now() / 1000);
  if (payload.v !== 1 || payload.op !== expectedOperation || !Number.isInteger(payload.exp)) throw new Error("invalid-ticket");
  if (payload.exp <= now || payload.exp > now + MAX_TICKET_LIFETIME_SECONDS) throw new Error("expired-ticket");
  if (!/^[A-Za-z0-9_-]{1,128}$/.test(String(payload.uid || ""))) throw new Error("invalid-ticket");
  const requiredPrefix = `studio/users/${payload.uid}/`;
  if (!String(payload.key || "").startsWith(requiredPrefix) || payload.key.includes("..")) throw new Error("invalid-ticket");
  return payload;
}

async function putObject(request, env, ticket) {
  const expectedBytes = Number(ticket.bytes);
  const contentLengthHeader = request.headers.get("Content-Length");
  const contentLength = contentLengthHeader === null ? null : Number(contentLengthHeader);
  const contentType = String(request.headers.get("Content-Type") || "").toLowerCase();
  if (!Number.isInteger(expectedBytes) || expectedBytes < 1 || expectedBytes > MAX_OBJECT_BYTES) {
    return json(request, env, { error: "invalid-size" }, 400);
  }
  if ((contentLength !== null && contentLength !== expectedBytes) || contentType !== "application/zip" || ticket.contentType !== "application/zip") {
    return json(request, env, { error: "metadata-mismatch" }, 400);
  }
  const bytes = await request.arrayBuffer();
  if (bytes.byteLength !== expectedBytes) return json(request, env, { error: "size-mismatch" }, 400);
  const digest = await crypto.subtle.digest("SHA-256", bytes);
  const checksum = hex(digest);
  if (checksum !== ticket.sha256) return json(request, env, { error: "checksum-mismatch" }, 400);
  const object = await env.STUDIO_BUCKET.put(ticket.key, bytes, {
    httpMetadata: { contentType: "application/zip" },
    customMetadata: { sha256: checksum, uid: ticket.uid },
    sha256: digest,
  });
  return json(request, env, { ok: true, bytes: object.size, etag: object.httpEtag, sha256: checksum });
}

async function headObject(request, env, ticket) {
  const object = await env.STUDIO_BUCKET.head(ticket.key);
  if (!object) return json(request, env, { error: "not-found" }, 404);
  return json(request, env, {
    ok: true,
    bytes: object.size,
    etag: object.httpEtag,
    contentType: object.httpMetadata?.contentType || "",
    sha256: object.customMetadata?.sha256 || "",
  });
}

async function getObject(request, env, ticket) {
  const object = await env.STUDIO_BUCKET.get(ticket.key);
  if (!object) return json(request, env, { error: "not-found" }, 404);
  return response(request, env, object.body, {
    status: 200,
    headers: {
      "Content-Type": object.httpMetadata?.contentType || "application/zip",
      "Content-Length": String(object.size),
      "ETag": object.httpEtag,
    },
  });
}

async function deleteObject(request, env, ticket) {
  await env.STUDIO_BUCKET.delete(ticket.key);
  return json(request, env, { ok: true });
}

export default {
  async fetch(request, env) {
    if (request.method === "OPTIONS") {
      if (request.headers.get("Origin") !== env.ALLOWED_ORIGIN) return response(request, env, null, { status: 403 });
      return response(request, env, null, { status: 204 });
    }
    const operation = new URL(request.url).pathname.replace(/^\/+|\/+$/g, "");
    const methodByOperation = { put: "PUT", head: "POST", get: "GET", delete: "DELETE" };
    if (!methodByOperation[operation] || request.method !== methodByOperation[operation]) {
      return json(request, env, { error: "not-found" }, 404);
    }
    try {
      const ticket = await verifyTicket(request, env, operation);
      if (operation === "put") return putObject(request, env, ticket);
      if (operation === "head") return headObject(request, env, ticket);
      if (operation === "get") return getObject(request, env, ticket);
      return deleteObject(request, env, ticket);
    } catch (error) {
      return json(request, env, { error: error?.message || "forbidden" }, error?.message === "expired-ticket" ? 401 : 403);
    }
  },
};
