import { corsHeaders, fail, guardExpensiveRequest, json, safeError, withCors } from "./_shared.js";
import { buildSystemPrompt, resolvePromptProfile } from "./subjectProfiles.js";
import { requireTeacherAccess } from "./firebaseServer.js";

const MAX_MARKDOWN_CHARS = 12_000;

const contentBlockGemini = {
  type: "OBJECT",
  required: ["kind", "text", "latex", "display", "src", "alt", "rows", "items"],
  properties: {
    kind: { type: "STRING", enum: ["paragraph", "math", "image", "table", "list"] },
    text: { type: "STRING" },
    latex: { type: "STRING" },
    display: { type: "BOOLEAN" },
    src: { type: "STRING" },
    alt: { type: "STRING" },
    rows: { type: "ARRAY", items: { type: "ARRAY", items: { type: "STRING" } } },
    items: { type: "ARRAY", items: { type: "STRING" } },
  },
};

const geminiSchema = {
  type: "OBJECT",
  required: ["title", "sections", "groups", "questions", "warnings"],
  properties: {
    title: { type: "STRING" },
    warnings: { type: "ARRAY", items: { type: "STRING" } },
    sections: {
      type: "ARRAY",
      items: {
        type: "OBJECT",
        required: ["key", "title", "instruction"],
        properties: { key: { type: "STRING" }, title: { type: "STRING" }, instruction: { type: "STRING" } },
      },
    },
    groups: {
      type: "ARRAY",
      items: {
        type: "OBJECT",
        required: ["key", "title", "instruction", "kind", "stimulus"],
        properties: {
          key: { type: "STRING" }, title: { type: "STRING" }, instruction: { type: "STRING" }, kind: { type: "STRING" },
          stimulus: { type: "ARRAY", items: contentBlockGemini },
        },
      },
    },
    questions: {
      type: "ARRAY",
      items: {
        type: "OBJECT",
        required: ["number", "type", "sectionKey", "groupKey", "skill", "format", "stem", "choices", "statements", "answers", "solution", "confidence", "warnings"],
        properties: {
          number: { type: "INTEGER" },
          type: { type: "STRING", enum: ["single-choice", "true-false", "short-answer", "essay"] },
          sectionKey: { type: "STRING" },
          groupKey: { type: "STRING" },
          skill: { type: "STRING" },
          format: { type: "STRING" },
          stem: { type: "ARRAY", items: contentBlockGemini },
          choices: {
            type: "ARRAY",
            items: {
              type: "OBJECT",
              required: ["label", "content"],
              properties: {
                label: { type: "STRING" },
                content: { type: "ARRAY", items: contentBlockGemini },
                isCorrect: { type: "BOOLEAN" },
              },
            },
          },
          statements: {
            type: "ARRAY",
            items: {
              type: "OBJECT",
              required: ["label", "content"],
              properties: {
                label: { type: "STRING" },
                content: { type: "ARRAY", items: contentBlockGemini },
                correctValue: { type: "BOOLEAN" },
              },
            },
          },
          answers: { type: "ARRAY", items: { type: "STRING" } },
          solution: { type: "ARRAY", items: { type: "ARRAY", items: contentBlockGemini } },
          confidence: { type: "STRING", enum: ["high", "medium", "low"] },
          warnings: { type: "ARRAY", items: { type: "STRING" } },
        },
      },
    },
  },
};

export const onRequestOptions = async ({ request }) => new Response(null, { status: 204, headers: corsHeaders(request) });

export const onRequestPost = async ({ request, env }) => {
  try {
    const payload = await request.json();
    const apiKey = payload.customApiKey || env.GEMINI_API_KEY;
    if (!apiKey) return withCors(fail("Máy chủ chưa cấu hình GEMINI_API_KEY.", 503), request);
    if (!payload.customApiKey) await requireTeacherAccess(request, env);
    if (!payload.customApiKey) {
      const guarded = await guardExpensiveRequest(request, "structure");
      if (guarded) return withCors(guarded, request);
    }
    const markdown = String(payload.markdown || "");
    if (!markdown.trim()) return withCors(fail("Kết quả OCR đang trống."), request);
    if (markdown.length > MAX_MARKDOWN_CHARS) return withCors(fail("Tài liệu quá dài; hãy chia thành các phần nhỏ hơn."), request);
    const sourceName = String(payload.sourceFileName || "de-thi").slice(0, 180);
    const generateSolutions = payload.generateSolutions !== false;
    const profileId = String(payload.profileId || "math-thpt-v1");
    const grade = String(payload.grade || "12").slice(0, 20);
    const profile = resolvePromptProfile(profileId);
    const effectivePrompt = buildSystemPrompt(profileId, grade, generateSolutions);

    const geminiPayload = {
      systemInstruction: {
        parts: [{ text: effectivePrompt }]
      },
      contents: [
        {
          role: "user",
          parts: [{ text: `Profile: ${profileId}\nMôn: ${profile.subject}\nKhối: ${grade}\nTên tệp: ${sourceName}\n\nNỘI DUNG OCR:\n${markdown}` }]
        }
      ],
      generationConfig: {
        temperature: 0.05,
        responseMimeType: "application/json",
        responseSchema: geminiSchema
      }
    };
    
    const response = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/gemini-3.6-flash:generateContent?key=${apiKey}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(geminiPayload)
    });
    
    if (!response.ok) return withCors(fail("Gemini chưa chuẩn hóa được cấu trúc đề.", response.status, await safeError(response)), request);
    const result = await response.json();
    const content = result.candidates?.[0]?.content?.parts?.[0]?.text;
    if (!content) return withCors(fail("Gemini trả về kết quả trống.", 502), request);
    const structured = JSON.parse(content);
    return withCors(json({ ok: true, provider: "gemini", model: "gemini-3.6-flash", profileId, structured, usage: result.usageMetadata || null }), request);
  } catch (error) {
    return withCors(fail(error instanceof Error ? error.message : "Không chuẩn hóa được đề.", error?.status || 400), request);
  }
};
