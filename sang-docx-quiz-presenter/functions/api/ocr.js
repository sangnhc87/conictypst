import {
  corsHeaders,
  collectRemoteMathpixImages,
  fail,
  fileToDataUrl,
  guardExpensiveRequest,
  json,
  parsePositiveInt,
  safeError,
  withCors,
} from "./_shared.js";
import { requireTeacherAccess } from "./firebaseServer.js";

const MAX_FILE_BYTES = 25 * 1024 * 1024;
const ALLOWED_TYPES = new Set([
  "application/pdf",
  "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  "application/msword",
  "image/png",
  "image/jpeg",
  "image/webp",
]);

const requireFile = async (request) => {
  const form = await request.formData();
  const file = form.get("file");
  if (!(file instanceof File)) throw new Error("Thiếu tệp cần OCR.");
  if (file.size <= 0 || file.size > MAX_FILE_BYTES) throw new Error("Tệp phải nhỏ hơn 25 MB.");
  if (file.type && !ALLOWED_TYPES.has(file.type)) throw new Error("Định dạng chưa được hỗ trợ.");
  return { file, form };
};

const runMistral = async (file, form, env) => {
  if (!env.MISTRAL_API_KEY) return fail("Máy chủ chưa cấu hình MISTRAL_API_KEY.", 503);
  const dataUrl = await fileToDataUrl(file);
  const isImage = file.type.startsWith("image/");
  const model = env.MISTRAL_OCR_MODEL || "mistral-ocr-latest";
  const body = {
    model,
    document: isImage
      ? { type: "image_url", image_url: dataUrl }
      : { type: "document_url", document_url: dataUrl },
    include_image_base64: true,
    extract_header: true,
    extract_footer: true,
    table_format: "markdown",
    confidence_scores_granularity: "page",
  };
  const response = await fetch("https://api.mistral.ai/v1/ocr", {
    method: "POST",
    headers: {
      authorization: `Bearer ${env.MISTRAL_API_KEY}`,
      "content-type": "application/json",
    },
    body: JSON.stringify(body),
  });
  if (!response.ok) return fail("Mistral OCR không xử lý được tài liệu.", response.status, await safeError(response));
  const payload = await response.json();
  const pages = (payload.pages || []).map((page, index) => ({
    index: Number.isFinite(page.index) ? page.index : index,
    markdown: page.markdown || "",
      images: page.images || [],
      blocks: page.blocks || [],
      confidence: page.confidence_scores || null,
    header: page.header || "",
    footer: page.footer || "",
    dimensions: page.dimensions || null,
  }));
  return json({
    ok: true,
    provider: "mistral",
    model,
    pages,
    markdown: pages.map((page) => page.markdown).join("\n\n<!-- page-break -->\n\n"),
    usage: payload.usage_info || payload.usage || null,
  });
};

const runMathpixImage = async (file, env) => {
  if (!env.MATHPIX_APP_KEY) return fail("Máy chủ chưa cấu hình MATHPIX_APP_KEY.", 503);
  if (file.size > 1_450_000) return fail("Ảnh Mathpix phải nhỏ hơn khoảng 1,4 MB do giới hạn base64. Hãy giảm kích thước hoặc dùng Mistral.", 413);
  const src = await fileToDataUrl(file);
  let authHeaders;
  if (env.MATHPIX_APP_ID) {
    authHeaders = { app_id: env.MATHPIX_APP_ID, app_key: env.MATHPIX_APP_KEY };
  } else {
    const tokenResponse = await fetch("https://api.mathpix.com/v3/app-tokens", {
      method: "POST",
      headers: { app_key: env.MATHPIX_APP_KEY },
    });
    if (!tokenResponse.ok) return fail("Không tạo được token Mathpix ngắn hạn.", tokenResponse.status, await safeError(tokenResponse));
    const token = await tokenResponse.json();
    authHeaders = { app_token: token.app_token };
  }
  const response = await fetch("https://api.mathpix.com/v3/text", {
    method: "POST",
    headers: {
      ...authHeaders,
      "content-type": "application/json",
    },
    body: JSON.stringify({
      src,
      formats: ["text", "data"],
      data_options: { include_asciimath: true, include_latex: true },
      include_line_data: true,
      enable_tables_fallback: true,
    }),
  });
  if (!response.ok) return fail("Mathpix không nhận dạng được ảnh.", response.status, await safeError(response));
  const payload = await response.json();
  return json({
    ok: true,
    provider: "mathpix",
    model: "v3/text",
    pages: [{ index: 0, markdown: payload.text || "", images: [], confidence: payload.confidence ?? null }],
    markdown: payload.text || "",
    confidence: payload.confidence ?? null,
  });
};

const submitMathpixDocument = async (file, env) => {
  if (!env.MATHPIX_APP_KEY) return fail("Máy chủ chưa cấu hình MATHPIX_APP_KEY.", 503);
  const upload = new FormData();
  upload.append("file", file, file.name);
  upload.append("options_json", JSON.stringify({
    include_page_breaks: true,
    disable_itemize: true,
    math_inline_delimiters: ["$", "$"],
    rm_spaces: true,
  }));
  const response = await fetch("https://api.mathpix.com/files/v1", {
    method: "POST",
    headers: { app_key: env.MATHPIX_APP_KEY, "Idempotency-Key": crypto.randomUUID() },
    body: upload,
  });
  if (!response.ok) return fail("Mathpix không nhận tài liệu.", response.status, await safeError(response));
  const payload = await response.json();
  return json({ ok: true, provider: "mathpix", pending: true, jobId: payload.file_id });
};

const pollMathpix = async (request, env) => {
  if (!env.MATHPIX_APP_KEY) return fail("Máy chủ chưa cấu hình MATHPIX_APP_KEY.", 503);
  const url = new URL(request.url);
  const jobId = (url.searchParams.get("id") || "").replace(/[^A-Za-z0-9_-]/g, "");
  if (!jobId) return fail("Thiếu mã tác vụ Mathpix.");
  const headers = { app_key: env.MATHPIX_APP_KEY };
  const statusResponse = await fetch(`https://api.mathpix.com/files/v1/${jobId}`, { headers });
  if (!statusResponse.ok) return fail("Không đọc được trạng thái Mathpix.", statusResponse.status, await safeError(statusResponse));
  const status = await statusResponse.json();
  if (status.status === "error") return fail("Mathpix báo lỗi khi xử lý tài liệu.", 422, status.error || status);
  if (status.status !== "completed") return json({ ok: true, provider: "mathpix", pending: true, jobId, status: status.status, percent: status.percent_done || null });
  const resultResponse = await fetch(`https://api.mathpix.com/files/v1/${jobId}.mmd`, { headers });
  if (!resultResponse.ok) return fail("Mathpix đã xong nhưng chưa tải được kết quả.", resultResponse.status, await safeError(resultResponse));
  const markdown = await resultResponse.text();
  const imageAssets = await collectRemoteMathpixImages(markdown);
  await fetch(`https://api.mathpix.com/files/v1/${jobId}`, { method: "DELETE", headers }).catch(() => undefined);
  return json({ ok: true, provider: "mathpix", pending: false, jobId, markdown, imageAssets, pages: markdown.split(/\\pagebreak|<!--\s*page-break\s*-->/i).map((text, index) => ({ index, markdown: text.trim(), images: [] })) });
};

const runGemini = async (file, form, env) => {
  const apiKey = form.get("geminiKey") || env.GEMINI_API_KEY;
  if (!apiKey) return fail("Thiếu API Key cho Gemini. Vui lòng cấu hình GEMINI_API_KEY.", 403);
  
  const dataUrl = await fileToDataUrl(file);
  const base64Data = dataUrl.split(",")[1];
  const mimeType = file.type;
  
  const payload = {
    contents: [
      {
        parts: [
          { text: "Bạn là một chuyên gia nhận dạng đề thi Toán THPT Việt Nam. Hãy chuyển đổi tài liệu/ảnh này sang Markdown sạch.\nQUY TẮC BẮT BUỘC:\n1. Phải phân tách rõ từng câu hỏi. Mỗi câu BẮT BUỘC bắt đầu bằng 'Câu 1.', 'Câu 2.', 'Câu 3.'... ở đầu dòng.\n2. Các phương án trắc nghiệm BẮT BUỘC xuống dòng và bắt đầu bằng 'A. ', 'B. ', 'C. ', 'D. ' (hoặc 'a) ', 'b) ', 'c) ', 'd) ' đối với câu Đúng/Sai).\n3. Đưa tất cả công thức Toán học về định dạng LaTeX chuẩn (dùng $...$ cho công thức trong dòng và $$...$$ cho công thức đứng riêng).\n4. Chèn '<!-- page-break -->' giữa các trang.\n5. Giữ nguyên 100% tiếng Việt, không bỏ sót bất kỳ câu hay lựa chọn nào." },
          { inlineData: { mimeType, data: base64Data } }
        ]
      }
    ]
  };

  const response = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/gemini-3.6-flash:generateContent?key=${apiKey}`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload)
  });

  if (!response.ok) return fail("Gemini OCR thất bại.", response.status, await safeError(response));
  
  const data = await response.json();
  const markdown = data.candidates?.[0]?.content?.parts?.[0]?.text || "";
  
  return json({
    ok: true,
    provider: "gemini",
    model: "gemini-3.6-flash",
    pages: [{ index: 0, markdown, images: [] }],
    markdown
  });
};

export const onRequestOptions = async ({ request }) => new Response(null, { status: 204, headers: corsHeaders(request) });

export const onRequestGet = async ({ request, env }) => {
  try {
    await requireTeacherAccess(request, env);
    return withCors(await pollMathpix(request, env), request);
  } catch (error) {
    return withCors(fail(error instanceof Error ? error.message : "Bạn cần đăng nhập để tiếp tục.", error?.status || 500), request);
  }
};

export const onRequestPost = async ({ request, env }) => {
  try {
    const guarded = await guardExpensiveRequest(request, "ocr");
    if (guarded) return withCors(guarded, request);
    const { file, form } = await requireFile(request);
    if (!form.get("geminiKey")) await requireTeacherAccess(request, env);
    const provider = String(form.get("provider") || "mistral");
    const pageLimit = parsePositiveInt(form.get("pageLimit"), 80, 200);
    if (Number(form.get("pages") || 0) > pageLimit) return withCors(fail(`Tài liệu vượt giới hạn ${pageLimit} trang của lần xử lý.`), request);
    let response;
    if (provider === "mistral") response = await runMistral(file, form, env);
    else if (provider === "gemini") response = await runGemini(file, form, env);
    else if (provider === "mathpix" && file.type.startsWith("image/")) response = await runMathpixImage(file, env);
    else if (provider === "mathpix") response = await submitMathpixDocument(file, env);
    else response = fail("Nhà cung cấp OCR không hợp lệ.");
    return withCors(response, request);
  } catch (error) {
    return withCors(fail(error instanceof Error ? error.message : "Không xử lý được tệp.", error?.status || 400), request);
  }
};
