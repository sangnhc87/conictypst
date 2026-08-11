var __defProp = Object.defineProperty;
var __name = (target, value) => __defProp(target, "name", { value, configurable: true });

// api/_shared.js
var JSON_HEADERS = {
  "content-type": "application/json; charset=utf-8",
  "cache-control": "no-store",
  "x-content-type-options": "nosniff"
};
var json = /* @__PURE__ */ __name((data, status = 200, extraHeaders = {}) => new Response(JSON.stringify(data), {
  status,
  headers: { ...JSON_HEADERS, ...extraHeaders }
}), "json");
var fail = /* @__PURE__ */ __name((message, status = 400, details = void 0) => json({ ok: false, error: message, ...details ? { details } : {} }, status), "fail");
var parsePositiveInt = /* @__PURE__ */ __name((value, fallback, max) => {
  const parsed = Number.parseInt(String(value ?? ""), 10);
  if (!Number.isFinite(parsed) || parsed <= 0) return fallback;
  return Math.min(parsed, max);
}, "parsePositiveInt");
var fileToDataUrl = /* @__PURE__ */ __name(async (file) => {
  const bytes = new Uint8Array(await file.arrayBuffer());
  let binary = "";
  const chunk = 32768;
  for (let index = 0; index < bytes.length; index += chunk) {
    binary += String.fromCharCode(...bytes.subarray(index, index + chunk));
  }
  return `data:${file.type || "application/octet-stream"};base64,${btoa(binary)}`;
}, "fileToDataUrl");
var bytesToDataUrl = /* @__PURE__ */ __name((bytes, mimeType = "application/octet-stream") => {
  let binary = "";
  const chunk = 32768;
  for (let index = 0; index < bytes.length; index += chunk) binary += String.fromCharCode(...bytes.subarray(index, index + chunk));
  return `data:${mimeType};base64,${btoa(binary)}`;
}, "bytesToDataUrl");
var collectRemoteMathpixImages = /* @__PURE__ */ __name(async (markdown) => {
  const urls = [...new Set([...String(markdown).matchAll(/!\[[^\]]*\]\((https:\/\/[^)\s]+)\)/g)].map((match2) => match2[1]))].slice(0, 30);
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
    }
  }
  return assets;
}, "collectRemoteMathpixImages");
var safeError = /* @__PURE__ */ __name(async (response) => {
  const text = await response.text();
  try {
    const parsed = JSON.parse(text);
    return parsed?.message || parsed?.error?.message || parsed?.error || text;
  } catch {
    return text.slice(0, 500);
  }
}, "safeError");
var corsHeaders = /* @__PURE__ */ __name((request) => {
  const origin = request.headers.get("origin") || "";
  const allowed = origin === "" || origin.endsWith(".pages.dev") || origin.startsWith("http://localhost:") || origin.startsWith("http://127.0.0.1:");
  return {
    "access-control-allow-origin": allowed ? origin || "*" : "null",
    "access-control-allow-methods": "GET,POST,OPTIONS",
    "access-control-allow-headers": "content-type",
    "access-control-max-age": "86400"
  };
}, "corsHeaders");
var withCors = /* @__PURE__ */ __name((response, request) => {
  const headers = new Headers(response.headers);
  for (const [key, value] of Object.entries(corsHeaders(request))) headers.set(key, value);
  return new Response(response.body, { status: response.status, headers });
}, "withCors");
var guardExpensiveRequest = /* @__PURE__ */ __name(async (request, action) => {
  const requestUrl = new URL(request.url);
  const origin = request.headers.get("origin");
  if (origin) {
    try {
      if (new URL(origin).host !== requestUrl.host) return fail("Y\xEAu c\u1EA7u kh\xE1c ngu\u1ED3n \u0111\xE3 b\u1ECB t\u1EEB ch\u1ED1i.", 403);
    } catch {
      return fail("Origin kh\xF4ng h\u1EE3p l\u1EC7.", 403);
    }
  }
  if (typeof caches === "undefined" || !caches.default) return null;
  const actor = (request.headers.get("cf-connecting-ip") || "local").replace(/[^0-9A-Fa-f:._-]/g, "").slice(0, 80);
  const windowId = Math.floor(Date.now() / 6e4);
  const cacheKey = new Request(`https://conic-rate-limit.invalid/${encodeURIComponent(actor)}/${action}/${windowId}`);
  const previous = await caches.default.match(cacheKey);
  const count = Number(previous?.headers.get("x-request-count") || 0) + 1;
  if (count > 12) return fail("B\u1EA1n \u0111ang g\u1EEDi qu\xE1 nhanh. H\xE3y \u0111\u1EE3i kho\u1EA3ng m\u1ED9t ph\xFAt \u0111\u1EC3 b\u1EA3o v\u1EC7 h\u1EA1n m\u1EE9c OCR.", 429);
  await caches.default.put(cacheKey, new Response("", {
    headers: { "x-request-count": String(count), "cache-control": "public, max-age=65" }
  }));
  return null;
}, "guardExpensiveRequest");

// api/ocr.js
var MAX_FILE_BYTES = 25 * 1024 * 1024;
var ALLOWED_TYPES = /* @__PURE__ */ new Set([
  "application/pdf",
  "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  "application/msword",
  "image/png",
  "image/jpeg",
  "image/webp"
]);
var requireFile = /* @__PURE__ */ __name(async (request) => {
  const form = await request.formData();
  const file = form.get("file");
  if (!(file instanceof File)) throw new Error("Thi\u1EBFu t\u1EC7p c\u1EA7n OCR.");
  if (file.size <= 0 || file.size > MAX_FILE_BYTES) throw new Error("T\u1EC7p ph\u1EA3i nh\u1ECF h\u01A1n 25 MB.");
  if (file.type && !ALLOWED_TYPES.has(file.type)) throw new Error("\u0110\u1ECBnh d\u1EA1ng ch\u01B0a \u0111\u01B0\u1EE3c h\u1ED7 tr\u1EE3.");
  return { file, form };
}, "requireFile");
var runMistral = /* @__PURE__ */ __name(async (file, form, env) => {
  if (!env.MISTRAL_API_KEY) return fail("M\xE1y ch\u1EE7 ch\u01B0a c\u1EA5u h\xECnh MISTRAL_API_KEY.", 503);
  if (file.type.includes("word")) return fail("Mistral OCR nh\u1EADn PDF/\u1EA3nh; DOC/DOCX s\u1EBD d\xF9ng b\u1ED9 \u0111\u1ECDc c\u1EE5c b\u1ED9 ho\u1EB7c Mathpix.", 400);
  const dataUrl = await fileToDataUrl(file);
  const isImage = file.type.startsWith("image/");
  const model = env.MISTRAL_OCR_MODEL || "mistral-ocr-2512";
  const body = {
    model,
    document: isImage ? { type: "image_url", image_url: dataUrl } : { type: "document_url", document_url: dataUrl },
    include_image_base64: true,
    extract_header: true,
    extract_footer: true,
    table_format: "html"
  };
  const response = await fetch("https://api.mistral.ai/v1/ocr", {
    method: "POST",
    headers: {
      authorization: `Bearer ${env.MISTRAL_API_KEY}`,
      "content-type": "application/json"
    },
    body: JSON.stringify(body)
  });
  if (!response.ok) return fail("Mistral OCR kh\xF4ng x\u1EED l\xFD \u0111\u01B0\u1EE3c t\xE0i li\u1EC7u.", response.status, await safeError(response));
  const payload = await response.json();
  const pages = (payload.pages || []).map((page, index) => ({
    index: Number.isFinite(page.index) ? page.index : index,
    markdown: page.markdown || "",
    images: page.images || [],
    header: page.header || "",
    footer: page.footer || "",
    dimensions: page.dimensions || null
  }));
  return json({
    ok: true,
    provider: "mistral",
    model,
    pages,
    markdown: pages.map((page) => page.markdown).join("\n\n<!-- page-break -->\n\n"),
    usage: payload.usage_info || payload.usage || null
  });
}, "runMistral");
var runMathpixImage = /* @__PURE__ */ __name(async (file, env) => {
  if (!env.MATHPIX_APP_KEY) return fail("M\xE1y ch\u1EE7 ch\u01B0a c\u1EA5u h\xECnh MATHPIX_APP_KEY.", 503);
  if (file.size > 145e4) return fail("\u1EA2nh Mathpix ph\u1EA3i nh\u1ECF h\u01A1n kho\u1EA3ng 1,4 MB do gi\u1EDBi h\u1EA1n base64. H\xE3y gi\u1EA3m k\xEDch th\u01B0\u1EDBc ho\u1EB7c d\xF9ng Mistral.", 413);
  const src = await fileToDataUrl(file);
  let authHeaders;
  if (env.MATHPIX_APP_ID) {
    authHeaders = { app_id: env.MATHPIX_APP_ID, app_key: env.MATHPIX_APP_KEY };
  } else {
    const tokenResponse = await fetch("https://api.mathpix.com/v3/app-tokens", {
      method: "POST",
      headers: { app_key: env.MATHPIX_APP_KEY }
    });
    if (!tokenResponse.ok) return fail("Kh\xF4ng t\u1EA1o \u0111\u01B0\u1EE3c token Mathpix ng\u1EAFn h\u1EA1n.", tokenResponse.status, await safeError(tokenResponse));
    const token = await tokenResponse.json();
    authHeaders = { app_token: token.app_token };
  }
  const response = await fetch("https://api.mathpix.com/v3/text", {
    method: "POST",
    headers: {
      ...authHeaders,
      "content-type": "application/json"
    },
    body: JSON.stringify({
      src,
      formats: ["text", "data"],
      data_options: { include_asciimath: true, include_latex: true },
      include_line_data: true,
      enable_tables_fallback: true
    })
  });
  if (!response.ok) return fail("Mathpix kh\xF4ng nh\u1EADn d\u1EA1ng \u0111\u01B0\u1EE3c \u1EA3nh.", response.status, await safeError(response));
  const payload = await response.json();
  return json({
    ok: true,
    provider: "mathpix",
    model: "v3/text",
    pages: [{ index: 0, markdown: payload.text || "", images: [], confidence: payload.confidence ?? null }],
    markdown: payload.text || "",
    confidence: payload.confidence ?? null
  });
}, "runMathpixImage");
var submitMathpixDocument = /* @__PURE__ */ __name(async (file, env) => {
  if (!env.MATHPIX_APP_KEY) return fail("M\xE1y ch\u1EE7 ch\u01B0a c\u1EA5u h\xECnh MATHPIX_APP_KEY.", 503);
  const upload = new FormData();
  upload.append("file", file, file.name);
  upload.append("options_json", JSON.stringify({
    include_page_breaks: true,
    disable_itemize: true,
    math_inline_delimiters: ["$", "$"],
    rm_spaces: true
  }));
  const response = await fetch("https://api.mathpix.com/files/v1", {
    method: "POST",
    headers: { app_key: env.MATHPIX_APP_KEY, "Idempotency-Key": crypto.randomUUID() },
    body: upload
  });
  if (!response.ok) return fail("Mathpix kh\xF4ng nh\u1EADn t\xE0i li\u1EC7u.", response.status, await safeError(response));
  const payload = await response.json();
  return json({ ok: true, provider: "mathpix", pending: true, jobId: payload.file_id });
}, "submitMathpixDocument");
var pollMathpix = /* @__PURE__ */ __name(async (request, env) => {
  if (!env.MATHPIX_APP_KEY) return fail("M\xE1y ch\u1EE7 ch\u01B0a c\u1EA5u h\xECnh MATHPIX_APP_KEY.", 503);
  const url = new URL(request.url);
  const jobId = (url.searchParams.get("id") || "").replace(/[^A-Za-z0-9_-]/g, "");
  if (!jobId) return fail("Thi\u1EBFu m\xE3 t\xE1c v\u1EE5 Mathpix.");
  const headers = { app_key: env.MATHPIX_APP_KEY };
  const statusResponse = await fetch(`https://api.mathpix.com/files/v1/${jobId}`, { headers });
  if (!statusResponse.ok) return fail("Kh\xF4ng \u0111\u1ECDc \u0111\u01B0\u1EE3c tr\u1EA1ng th\xE1i Mathpix.", statusResponse.status, await safeError(statusResponse));
  const status = await statusResponse.json();
  if (status.status === "error") return fail("Mathpix b\xE1o l\u1ED7i khi x\u1EED l\xFD t\xE0i li\u1EC7u.", 422, status.error || status);
  if (status.status !== "completed") return json({ ok: true, provider: "mathpix", pending: true, jobId, status: status.status, percent: status.percent_done || null });
  const resultResponse = await fetch(`https://api.mathpix.com/files/v1/${jobId}.mmd`, { headers });
  if (!resultResponse.ok) return fail("Mathpix \u0111\xE3 xong nh\u01B0ng ch\u01B0a t\u1EA3i \u0111\u01B0\u1EE3c k\u1EBFt qu\u1EA3.", resultResponse.status, await safeError(resultResponse));
  const markdown = await resultResponse.text();
  const imageAssets = await collectRemoteMathpixImages(markdown);
  await fetch(`https://api.mathpix.com/files/v1/${jobId}`, { method: "DELETE", headers }).catch(() => void 0);
  return json({ ok: true, provider: "mathpix", pending: false, jobId, markdown, imageAssets, pages: markdown.split(/\\pagebreak|<!--\s*page-break\s*-->/i).map((text, index) => ({ index, markdown: text.trim(), images: [] })) });
}, "pollMathpix");
var onRequestOptions = /* @__PURE__ */ __name(async ({ request }) => new Response(null, { status: 204, headers: corsHeaders(request) }), "onRequestOptions");
var onRequestGet = /* @__PURE__ */ __name(async ({ request, env }) => withCors(await pollMathpix(request, env), request), "onRequestGet");
var onRequestPost = /* @__PURE__ */ __name(async ({ request, env }) => {
  try {
    const guarded = await guardExpensiveRequest(request, "ocr");
    if (guarded) return withCors(guarded, request);
    const { file, form } = await requireFile(request);
    const provider = String(form.get("provider") || "mistral");
    const pageLimit = parsePositiveInt(form.get("pageLimit"), 80, 200);
    if (Number(form.get("pages") || 0) > pageLimit) return withCors(fail(`T\xE0i li\u1EC7u v\u01B0\u1EE3t gi\u1EDBi h\u1EA1n ${pageLimit} trang c\u1EE7a l\u1EA7n x\u1EED l\xFD.`), request);
    let response;
    if (provider === "mistral") response = await runMistral(file, form, env);
    else if (provider === "mathpix" && file.type.startsWith("image/")) response = await runMathpixImage(file, env);
    else if (provider === "mathpix") response = await submitMathpixDocument(file, env);
    else response = fail("Nh\xE0 cung c\u1EA5p OCR kh\xF4ng h\u1EE3p l\u1EC7.");
    return withCors(response, request);
  } catch (error) {
    return withCors(fail(error instanceof Error ? error.message : "Kh\xF4ng x\u1EED l\xFD \u0111\u01B0\u1EE3c t\u1EC7p."), request);
  }
}, "onRequestPost");

// api/structure.js
var MAX_MARKDOWN_CHARS = 1e5;
var contentBlock = {
  type: "object",
  additionalProperties: false,
  required: ["kind", "text", "latex", "display", "src", "alt", "rows", "items"],
  properties: {
    kind: { type: "string", enum: ["paragraph", "math", "image", "table", "list"] },
    text: { type: "string" },
    latex: { type: "string" },
    display: { type: "boolean" },
    src: { type: "string" },
    alt: { type: "string" },
    rows: { type: "array", items: { type: "array", items: { type: "string" } } },
    items: { type: "array", items: { type: "string" } }
  }
};
var schema = {
  type: "object",
  additionalProperties: false,
  required: ["title", "questions", "warnings"],
  properties: {
    title: { type: "string" },
    warnings: { type: "array", items: { type: "string" } },
    questions: {
      type: "array",
      items: {
        type: "object",
        additionalProperties: false,
        required: ["number", "type", "stem", "choices", "statements", "answers", "solution", "confidence", "warnings"],
        properties: {
          number: { type: "integer" },
          type: { type: "string", enum: ["single-choice", "true-false", "short-answer", "essay"] },
          stem: { type: "array", items: contentBlock },
          choices: {
            type: "array",
            items: {
              type: "object",
              additionalProperties: false,
              required: ["label", "content", "isCorrect"],
              properties: {
                label: { type: "string" },
                content: { type: "array", items: contentBlock },
                isCorrect: { type: ["boolean", "null"] }
              }
            }
          },
          statements: {
            type: "array",
            items: {
              type: "object",
              additionalProperties: false,
              required: ["label", "content", "correctValue"],
              properties: {
                label: { type: "string" },
                content: { type: "array", items: contentBlock },
                correctValue: { type: ["boolean", "null"] }
              }
            }
          },
          answers: { type: "array", items: { type: "string" } },
          solution: { type: "array", items: { type: "array", items: contentBlock } },
          confidence: { type: "string", enum: ["high", "medium", "low"] },
          warnings: { type: "array", items: { type: "string" } }
        }
      }
    }
  }
};
var systemPrompt = `B\u1EA1n l\xE0 bi\xEAn t\u1EADp vi\xEAn \u0111\u1EC1 thi To\xE1n THPT Vi\u1EC7t Nam. Chuy\u1EC3n OCR Markdown th\xE0nh d\u1EEF li\u1EC7u tr\xECnh chi\u1EBFu ch\xEDnh x\xE1c.
Quy t\u1EAFc b\u1EAFt bu\u1ED9c:
1. Gi\u1EEF \u0111\u1EE7 T\u1EA4T C\u1EA2 c\xE2u h\u1ECFi v\xE0 T\u1EA4T C\u1EA2 ph\u01B0\u01A1ng \xE1n, kh\xF4ng r\xFAt g\u1ECDn, kh\xF4ng t\u1EF1 gi\u1EA3i thay n\u1ED9i dung g\u1ED1c.
2. Nh\u1EADn di\u1EC7n: tr\u1EAFc nghi\u1EC7m ch\u1ECDn \u0111\xE1p \xE1n = single-choice; \u0111\xFAng/sai c\xF3 c\xE1c \xFD a,b,c,d = true-false; tr\u1EA3 l\u1EDDi ng\u1EAFn = short-answer; t\u1EF1 lu\u1EADn = essay.
3. T\xE1ch c\xF4ng th\u1EE9c th\xE0nh block math v\u1EDBi LaTeX s\u1EA1ch, kh\xF4ng gi\u1EEF d\u1EA5u $ bao ngo\xE0i. V\u0103n b\u1EA3n l\xE0 paragraph; b\u1EA3ng l\xE0 table/rows; danh s\xE1ch l\xE0 list/items. V\u1EDBi tr\u01B0\u1EDDng kh\xF4ng d\xF9ng, tr\u1EA3 chu\u1ED7i r\u1ED7ng ho\u1EB7c m\u1EA3ng r\u1ED7ng \u0111\xFAng schema.
4. Ch\u1EC9 \u0111\xE1nh isCorrect/correctValue khi \u0111\u1EC1 c\xF3 \u0111\xE1p \xE1n r\xF5; n\u1EBFu kh\xF4ng th\xEC null. \u0110\xE1p \xE1n ng\u1EAFn \u0111\u01B0a v\xE0o answers.
5. L\u1EDDi gi\u1EA3i chia th\xE0nh c\xE1c b\u01B0\u1EDBc s\u01B0 ph\u1EA1m h\u1EE3p l\xFD nh\u01B0ng kh\xF4ng b\u1ECBa d\u1EEF ki\u1EC7n. N\u1EBFu OCR m\u01A1 h\u1ED3, gi\u1EEF n\u1ED9i dung g\u1EA7n nguy\xEAn b\u1EA3n v\xE0 th\xEAm warning.
6. Kh\xF4ng g\u1ED9p hai c\xE2u, kh\xF4ng b\u1ECF h\xECnh/tham chi\u1EBFu h\xECnh. V\u1EDBi image, gi\u1EEF nguy\xEAn \u0111\u1ECBnh danh/t\xEAn \u1EA3nh OCR trong src v\xE0 m\xF4 t\u1EA3 \u1EDF alt. Gi\u1EEF nh\xE3n A,B,C,D v\xE0 a,b,c,d.
7. \u01AFu ti\xEAn ti\u1EBFng Vi\u1EC7t chu\u1EA9n, s\u1EEDa l\u1ED7i OCR hi\u1EC3n nhi\xEAn nh\u01B0ng kh\xF4ng \u0111\u1ED5i \xFD to\xE1n h\u1ECDc.`;
var onRequestOptions2 = /* @__PURE__ */ __name(async ({ request }) => new Response(null, { status: 204, headers: corsHeaders(request) }), "onRequestOptions");
var onRequestPost2 = /* @__PURE__ */ __name(async ({ request, env }) => {
  if (!env.GROQ_API_KEY) return withCors(fail("M\xE1y ch\u1EE7 ch\u01B0a c\u1EA5u h\xECnh GROQ_API_KEY.", 503), request);
  try {
    const guarded = await guardExpensiveRequest(request, "structure");
    if (guarded) return withCors(guarded, request);
    const payload = await request.json();
    const markdown = String(payload.markdown || "");
    if (!markdown.trim()) return withCors(fail("K\u1EBFt qu\u1EA3 OCR \u0111ang tr\u1ED1ng."), request);
    if (markdown.length > MAX_MARKDOWN_CHARS) return withCors(fail("T\xE0i li\u1EC7u qu\xE1 d\xE0i; h\xE3y chia th\xE0nh c\xE1c ph\u1EA7n nh\u1ECF h\u01A1n."), request);
    const sourceName = String(payload.sourceFileName || "de-thi").slice(0, 180);
    const model = env.GROQ_STRUCTURE_MODEL || "openai/gpt-oss-20b";
    const response = await fetch("https://api.groq.com/openai/v1/chat/completions", {
      method: "POST",
      headers: {
        authorization: `Bearer ${env.GROQ_API_KEY}`,
        "content-type": "application/json"
      },
      body: JSON.stringify({
        model,
        temperature: 0.05,
        max_completion_tokens: 32768,
        messages: [
          { role: "system", content: systemPrompt },
          { role: "user", content: `T\xEAn t\u1EC7p: ${sourceName}

N\u1ED8I DUNG OCR:
${markdown}` }
        ],
        response_format: {
          type: "json_schema",
          json_schema: { name: "quiz_document", strict: true, schema }
        }
      })
    });
    if (!response.ok) return withCors(fail("Groq ch\u01B0a chu\u1EA9n h\xF3a \u0111\u01B0\u1EE3c c\u1EA5u tr\xFAc \u0111\u1EC1.", response.status, await safeError(response)), request);
    const result = await response.json();
    const content = result.choices?.[0]?.message?.content;
    if (!content) return withCors(fail("Groq tr\u1EA3 v\u1EC1 k\u1EBFt qu\u1EA3 tr\u1ED1ng.", 502), request);
    const structured = JSON.parse(content);
    return withCors(json({ ok: true, provider: "groq", model, structured, usage: result.usage || null }), request);
  } catch (error) {
    return withCors(fail(error instanceof Error ? error.message : "Kh\xF4ng chu\u1EA9n h\xF3a \u0111\u01B0\u1EE3c \u0111\u1EC1."), request);
  }
}, "onRequestPost");

// ../.wrangler/tmp/pages-rG47On/functionsRoutes-0.257807149512018.mjs
var routes = [
  {
    routePath: "/api/ocr",
    mountPath: "/api",
    method: "GET",
    middlewares: [],
    modules: [onRequestGet]
  },
  {
    routePath: "/api/ocr",
    mountPath: "/api",
    method: "OPTIONS",
    middlewares: [],
    modules: [onRequestOptions]
  },
  {
    routePath: "/api/ocr",
    mountPath: "/api",
    method: "POST",
    middlewares: [],
    modules: [onRequestPost]
  },
  {
    routePath: "/api/structure",
    mountPath: "/api",
    method: "OPTIONS",
    middlewares: [],
    modules: [onRequestOptions2]
  },
  {
    routePath: "/api/structure",
    mountPath: "/api",
    method: "POST",
    middlewares: [],
    modules: [onRequestPost2]
  }
];

// ../../node_modules/path-to-regexp/dist.es2015/index.js
function lexer(str) {
  var tokens = [];
  var i = 0;
  while (i < str.length) {
    var char = str[i];
    if (char === "*" || char === "+" || char === "?") {
      tokens.push({ type: "MODIFIER", index: i, value: str[i++] });
      continue;
    }
    if (char === "\\") {
      tokens.push({ type: "ESCAPED_CHAR", index: i++, value: str[i++] });
      continue;
    }
    if (char === "{") {
      tokens.push({ type: "OPEN", index: i, value: str[i++] });
      continue;
    }
    if (char === "}") {
      tokens.push({ type: "CLOSE", index: i, value: str[i++] });
      continue;
    }
    if (char === ":") {
      var name = "";
      var j = i + 1;
      while (j < str.length) {
        var code = str.charCodeAt(j);
        if (
          // `0-9`
          code >= 48 && code <= 57 || // `A-Z`
          code >= 65 && code <= 90 || // `a-z`
          code >= 97 && code <= 122 || // `_`
          code === 95
        ) {
          name += str[j++];
          continue;
        }
        break;
      }
      if (!name)
        throw new TypeError("Missing parameter name at ".concat(i));
      tokens.push({ type: "NAME", index: i, value: name });
      i = j;
      continue;
    }
    if (char === "(") {
      var count = 1;
      var pattern = "";
      var j = i + 1;
      if (str[j] === "?") {
        throw new TypeError('Pattern cannot start with "?" at '.concat(j));
      }
      while (j < str.length) {
        if (str[j] === "\\") {
          pattern += str[j++] + str[j++];
          continue;
        }
        if (str[j] === ")") {
          count--;
          if (count === 0) {
            j++;
            break;
          }
        } else if (str[j] === "(") {
          count++;
          if (str[j + 1] !== "?") {
            throw new TypeError("Capturing groups are not allowed at ".concat(j));
          }
        }
        pattern += str[j++];
      }
      if (count)
        throw new TypeError("Unbalanced pattern at ".concat(i));
      if (!pattern)
        throw new TypeError("Missing pattern at ".concat(i));
      tokens.push({ type: "PATTERN", index: i, value: pattern });
      i = j;
      continue;
    }
    tokens.push({ type: "CHAR", index: i, value: str[i++] });
  }
  tokens.push({ type: "END", index: i, value: "" });
  return tokens;
}
__name(lexer, "lexer");
function parse(str, options) {
  if (options === void 0) {
    options = {};
  }
  var tokens = lexer(str);
  var _a = options.prefixes, prefixes = _a === void 0 ? "./" : _a, _b = options.delimiter, delimiter = _b === void 0 ? "/#?" : _b;
  var result = [];
  var key = 0;
  var i = 0;
  var path = "";
  var tryConsume = /* @__PURE__ */ __name(function(type) {
    if (i < tokens.length && tokens[i].type === type)
      return tokens[i++].value;
  }, "tryConsume");
  var mustConsume = /* @__PURE__ */ __name(function(type) {
    var value2 = tryConsume(type);
    if (value2 !== void 0)
      return value2;
    var _a2 = tokens[i], nextType = _a2.type, index = _a2.index;
    throw new TypeError("Unexpected ".concat(nextType, " at ").concat(index, ", expected ").concat(type));
  }, "mustConsume");
  var consumeText = /* @__PURE__ */ __name(function() {
    var result2 = "";
    var value2;
    while (value2 = tryConsume("CHAR") || tryConsume("ESCAPED_CHAR")) {
      result2 += value2;
    }
    return result2;
  }, "consumeText");
  var isSafe = /* @__PURE__ */ __name(function(value2) {
    for (var _i = 0, delimiter_1 = delimiter; _i < delimiter_1.length; _i++) {
      var char2 = delimiter_1[_i];
      if (value2.indexOf(char2) > -1)
        return true;
    }
    return false;
  }, "isSafe");
  var safePattern = /* @__PURE__ */ __name(function(prefix2) {
    var prev = result[result.length - 1];
    var prevText = prefix2 || (prev && typeof prev === "string" ? prev : "");
    if (prev && !prevText) {
      throw new TypeError('Must have text between two parameters, missing text after "'.concat(prev.name, '"'));
    }
    if (!prevText || isSafe(prevText))
      return "[^".concat(escapeString(delimiter), "]+?");
    return "(?:(?!".concat(escapeString(prevText), ")[^").concat(escapeString(delimiter), "])+?");
  }, "safePattern");
  while (i < tokens.length) {
    var char = tryConsume("CHAR");
    var name = tryConsume("NAME");
    var pattern = tryConsume("PATTERN");
    if (name || pattern) {
      var prefix = char || "";
      if (prefixes.indexOf(prefix) === -1) {
        path += prefix;
        prefix = "";
      }
      if (path) {
        result.push(path);
        path = "";
      }
      result.push({
        name: name || key++,
        prefix,
        suffix: "",
        pattern: pattern || safePattern(prefix),
        modifier: tryConsume("MODIFIER") || ""
      });
      continue;
    }
    var value = char || tryConsume("ESCAPED_CHAR");
    if (value) {
      path += value;
      continue;
    }
    if (path) {
      result.push(path);
      path = "";
    }
    var open = tryConsume("OPEN");
    if (open) {
      var prefix = consumeText();
      var name_1 = tryConsume("NAME") || "";
      var pattern_1 = tryConsume("PATTERN") || "";
      var suffix = consumeText();
      mustConsume("CLOSE");
      result.push({
        name: name_1 || (pattern_1 ? key++ : ""),
        pattern: name_1 && !pattern_1 ? safePattern(prefix) : pattern_1,
        prefix,
        suffix,
        modifier: tryConsume("MODIFIER") || ""
      });
      continue;
    }
    mustConsume("END");
  }
  return result;
}
__name(parse, "parse");
function match(str, options) {
  var keys = [];
  var re = pathToRegexp(str, keys, options);
  return regexpToFunction(re, keys, options);
}
__name(match, "match");
function regexpToFunction(re, keys, options) {
  if (options === void 0) {
    options = {};
  }
  var _a = options.decode, decode = _a === void 0 ? function(x) {
    return x;
  } : _a;
  return function(pathname) {
    var m = re.exec(pathname);
    if (!m)
      return false;
    var path = m[0], index = m.index;
    var params = /* @__PURE__ */ Object.create(null);
    var _loop_1 = /* @__PURE__ */ __name(function(i2) {
      if (m[i2] === void 0)
        return "continue";
      var key = keys[i2 - 1];
      if (key.modifier === "*" || key.modifier === "+") {
        params[key.name] = m[i2].split(key.prefix + key.suffix).map(function(value) {
          return decode(value, key);
        });
      } else {
        params[key.name] = decode(m[i2], key);
      }
    }, "_loop_1");
    for (var i = 1; i < m.length; i++) {
      _loop_1(i);
    }
    return { path, index, params };
  };
}
__name(regexpToFunction, "regexpToFunction");
function escapeString(str) {
  return str.replace(/([.+*?=^!:${}()[\]|/\\])/g, "\\$1");
}
__name(escapeString, "escapeString");
function flags(options) {
  return options && options.sensitive ? "" : "i";
}
__name(flags, "flags");
function regexpToRegexp(path, keys) {
  if (!keys)
    return path;
  var groupsRegex = /\((?:\?<(.*?)>)?(?!\?)/g;
  var index = 0;
  var execResult = groupsRegex.exec(path.source);
  while (execResult) {
    keys.push({
      // Use parenthesized substring match if available, index otherwise
      name: execResult[1] || index++,
      prefix: "",
      suffix: "",
      modifier: "",
      pattern: ""
    });
    execResult = groupsRegex.exec(path.source);
  }
  return path;
}
__name(regexpToRegexp, "regexpToRegexp");
function arrayToRegexp(paths, keys, options) {
  var parts = paths.map(function(path) {
    return pathToRegexp(path, keys, options).source;
  });
  return new RegExp("(?:".concat(parts.join("|"), ")"), flags(options));
}
__name(arrayToRegexp, "arrayToRegexp");
function stringToRegexp(path, keys, options) {
  return tokensToRegexp(parse(path, options), keys, options);
}
__name(stringToRegexp, "stringToRegexp");
function tokensToRegexp(tokens, keys, options) {
  if (options === void 0) {
    options = {};
  }
  var _a = options.strict, strict = _a === void 0 ? false : _a, _b = options.start, start = _b === void 0 ? true : _b, _c = options.end, end = _c === void 0 ? true : _c, _d = options.encode, encode = _d === void 0 ? function(x) {
    return x;
  } : _d, _e = options.delimiter, delimiter = _e === void 0 ? "/#?" : _e, _f = options.endsWith, endsWith = _f === void 0 ? "" : _f;
  var endsWithRe = "[".concat(escapeString(endsWith), "]|$");
  var delimiterRe = "[".concat(escapeString(delimiter), "]");
  var route = start ? "^" : "";
  for (var _i = 0, tokens_1 = tokens; _i < tokens_1.length; _i++) {
    var token = tokens_1[_i];
    if (typeof token === "string") {
      route += escapeString(encode(token));
    } else {
      var prefix = escapeString(encode(token.prefix));
      var suffix = escapeString(encode(token.suffix));
      if (token.pattern) {
        if (keys)
          keys.push(token);
        if (prefix || suffix) {
          if (token.modifier === "+" || token.modifier === "*") {
            var mod = token.modifier === "*" ? "?" : "";
            route += "(?:".concat(prefix, "((?:").concat(token.pattern, ")(?:").concat(suffix).concat(prefix, "(?:").concat(token.pattern, "))*)").concat(suffix, ")").concat(mod);
          } else {
            route += "(?:".concat(prefix, "(").concat(token.pattern, ")").concat(suffix, ")").concat(token.modifier);
          }
        } else {
          if (token.modifier === "+" || token.modifier === "*") {
            throw new TypeError('Can not repeat "'.concat(token.name, '" without a prefix and suffix'));
          }
          route += "(".concat(token.pattern, ")").concat(token.modifier);
        }
      } else {
        route += "(?:".concat(prefix).concat(suffix, ")").concat(token.modifier);
      }
    }
  }
  if (end) {
    if (!strict)
      route += "".concat(delimiterRe, "?");
    route += !options.endsWith ? "$" : "(?=".concat(endsWithRe, ")");
  } else {
    var endToken = tokens[tokens.length - 1];
    var isEndDelimited = typeof endToken === "string" ? delimiterRe.indexOf(endToken[endToken.length - 1]) > -1 : endToken === void 0;
    if (!strict) {
      route += "(?:".concat(delimiterRe, "(?=").concat(endsWithRe, "))?");
    }
    if (!isEndDelimited) {
      route += "(?=".concat(delimiterRe, "|").concat(endsWithRe, ")");
    }
  }
  return new RegExp(route, flags(options));
}
__name(tokensToRegexp, "tokensToRegexp");
function pathToRegexp(path, keys, options) {
  if (path instanceof RegExp)
    return regexpToRegexp(path, keys);
  if (Array.isArray(path))
    return arrayToRegexp(path, keys, options);
  return stringToRegexp(path, keys, options);
}
__name(pathToRegexp, "pathToRegexp");

// ../../node_modules/wrangler/templates/pages-template-worker.ts
var escapeRegex = /[.+?^${}()|[\]\\]/g;
function* executeRequest(request) {
  const requestPath = new URL(request.url).pathname;
  for (const route of [...routes].reverse()) {
    if (route.method && route.method !== request.method) {
      continue;
    }
    const routeMatcher = match(route.routePath.replace(escapeRegex, "\\$&"), {
      end: false
    });
    const mountMatcher = match(route.mountPath.replace(escapeRegex, "\\$&"), {
      end: false
    });
    const matchResult = routeMatcher(requestPath);
    const mountMatchResult = mountMatcher(requestPath);
    if (matchResult && mountMatchResult) {
      for (const handler of route.middlewares.flat()) {
        yield {
          handler,
          params: matchResult.params,
          path: mountMatchResult.path
        };
      }
    }
  }
  for (const route of routes) {
    if (route.method && route.method !== request.method) {
      continue;
    }
    const routeMatcher = match(route.routePath.replace(escapeRegex, "\\$&"), {
      end: true
    });
    const mountMatcher = match(route.mountPath.replace(escapeRegex, "\\$&"), {
      end: false
    });
    const matchResult = routeMatcher(requestPath);
    const mountMatchResult = mountMatcher(requestPath);
    if (matchResult && mountMatchResult && route.modules.length) {
      for (const handler of route.modules.flat()) {
        yield {
          handler,
          params: matchResult.params,
          path: matchResult.path
        };
      }
      break;
    }
  }
}
__name(executeRequest, "executeRequest");
var pages_template_worker_default = {
  async fetch(originalRequest, env, workerContext) {
    let request = originalRequest;
    const handlerIterator = executeRequest(request);
    let data = {};
    let isFailOpen = false;
    const next = /* @__PURE__ */ __name(async (input, init) => {
      if (input !== void 0) {
        let url = input;
        if (typeof input === "string") {
          url = new URL(input, request.url).toString();
        }
        request = new Request(url, init);
      }
      const result = handlerIterator.next();
      if (result.done === false) {
        const { handler, params, path } = result.value;
        const context = {
          request: new Request(request.clone()),
          functionPath: path,
          next,
          params,
          get data() {
            return data;
          },
          set data(value) {
            if (typeof value !== "object" || value === null) {
              throw new Error("context.data must be an object");
            }
            data = value;
          },
          env,
          waitUntil: workerContext.waitUntil.bind(workerContext),
          passThroughOnException: /* @__PURE__ */ __name(() => {
            isFailOpen = true;
          }, "passThroughOnException")
        };
        const response = await handler(context);
        if (!(response instanceof Response)) {
          throw new Error("Your Pages function should return a Response");
        }
        return cloneResponse(response);
      } else if ("ASSETS") {
        const response = await env["ASSETS"].fetch(request);
        return cloneResponse(response);
      } else {
        const response = await fetch(request);
        return cloneResponse(response);
      }
    }, "next");
    try {
      return await next();
    } catch (error) {
      if (isFailOpen) {
        const response = await env["ASSETS"].fetch(request);
        return cloneResponse(response);
      }
      throw error;
    }
  }
};
var cloneResponse = /* @__PURE__ */ __name((response) => (
  // https://fetch.spec.whatwg.org/#null-body-status
  new Response(
    [101, 204, 205, 304].includes(response.status) ? null : response.body,
    response
  )
), "cloneResponse");
export {
  pages_template_worker_default as default
};
