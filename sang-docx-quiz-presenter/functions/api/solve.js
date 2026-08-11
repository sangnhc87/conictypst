import { corsHeaders, fail, guardExpensiveRequest, json, safeError, withCors } from "./_shared.js";
import { resolvePromptProfile } from "./subjectProfiles.js";
import { requireTeacherAccess } from "./firebaseServer.js";

const MAX_QUESTION_CHARS = 18_000;

export const onRequestOptions = async ({ request }) => new Response(null, { status: 204, headers: corsHeaders(request) });

export const onRequestPost = async ({ request, env }) => {
  try {
    const payload = await request.json();
    const apiKey = payload.customApiKey || env.GEMINI_API_KEY;
    if (!apiKey) return withCors(fail("Máy chủ chưa cấu hình GEMINI_API_KEY.", 503), request);
    if (!payload.customApiKey) await requireTeacherAccess(request, env);
    if (!payload.customApiKey) {
      const guarded = await guardExpensiveRequest(request, "solve");
      if (guarded) return withCors(guarded, request);
    }

    const profileId = String(payload.profileId || "math-thpt-v1");
    const grade = String(payload.grade || "12").slice(0, 20);
    const profile = resolvePromptProfile(profileId);
    const question = payload.question && typeof payload.question === "object" ? payload.question : null;
    if (!question) return withCors(fail("Thiếu nội dung câu hỏi cần giải."), request);
    const source = JSON.stringify({ question, group: payload.group || null }).slice(0, MAX_QUESTION_CHARS);

    const systemInstruction = `Bạn là ${profile.role}. Hãy tạo lời giải chi tiết, chính xác và có thể dùng ngay cho giáo viên.
Môn: ${profile.subject}; khối: ${grade}.
${profile.rules.map((rule) => `- ${rule}`).join("\n")}
Quy tắc xử lý câu hỏi:
- Giữ nguyên tiếng Anh, công thức, ký hiệu và văn bản nguồn khi trích dẫn.
- Xác định đáp án trước, sau đó giải thích quy tắc hoặc bằng chứng đủ để giáo viên dạy học sinh.
- Nếu là câu đọc/cloze/gapped text, nêu câu hoặc cụm bằng chứng trong dữ kiện chung.
- Nếu dữ kiện hoặc đáp án chưa đủ rõ, nói thẳng “Chưa đủ dữ kiện để kết luận” và chỉ ra phần cần giáo viên kiểm tra; không đoán.
- Chỉ trả lời phần lời giải, không thêm JSON, không lặp lại toàn bộ câu hỏi.`;

    const response = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/gemini-3.6-flash:generateContent?key=${apiKey}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        systemInstruction: { parts: [{ text: systemInstruction }] },
        contents: [{ role: "user", parts: [{ text: `DỮ LIỆU CÂU HỎI:\n${source}` }] }],
        generationConfig: { temperature: 0.15 },
      }),
    });
    if (!response.ok) return withCors(fail("Gemini chưa tạo được lời giải.", response.status, await safeError(response)), request);
    const result = await response.json();
    const solution = result.candidates?.[0]?.content?.parts?.map((part) => part.text || "").join("\n").trim();
    if (!solution) return withCors(fail("Gemini trả về lời giải trống.", 502), request);
    return withCors(json({ ok: true, solution, model: "gemini-3.6-flash", profileId }), request);
  } catch (error) {
    return withCors(fail(error instanceof Error ? error.message : "Không tạo được lời giải.", error?.status || 400), request);
  }
};
