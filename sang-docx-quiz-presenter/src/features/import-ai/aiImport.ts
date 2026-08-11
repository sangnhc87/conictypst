import type {
  Confidence,
  ContentBlock,
  Question,
  QuestionType,
  QuizDocument,
} from "../../models/quiz";
import { uid } from "../../models/quiz";
import type { PdfTextAnalysis } from "./pdfText";
import { parseInformaticsLines, parseLines } from "../question-parser/parser";
import { hashFile, cacheKey, getCached, setCached } from "../cache/fileCache";
import { deskewImage } from "./imageDeskew";
import { smartOcrRoute } from "./tesseractOcr";
import { getSubjectProfile, makeProfileRef } from "../../config/subjectProfiles";


export type AiMode = "auto" | "economy" | "balanced" | "precision";
export type OcrProvider = "local" | "mistral" | "mathpix" | "gemini";

export const AI_MODE_INFO: Record<AiMode, { label: string; note: string }> = {
  auto: { label: "Tự động · khuyên dùng", note: "Đọc miễn phí trước; DOCX có rủi ro sẽ được Mistral đối chiếu cấu trúc." },
  economy: { label: "Tiết kiệm nhất", note: "Ưu tiên đọc cục bộ, chỉ dùng dịch vụ cloud khi bắt buộc." },
  balanced: { label: "Cân bằng", note: "Dịch vụ cloud xử lý toàn tài liệu rồi AI kiểm tra cấu trúc." },
  precision: { label: "Công thức khó", note: "Chế độ cao cấp cho đề STEM, công thức phức tạp và bảng biểu." },
};

export interface AiContentBlock {
  kind: "paragraph" | "math" | "image" | "table" | "list";
  text: string;
  latex: string;
  display: boolean;
  src: string;
  alt: string;
  rows: string[][];
  items: string[];
}

interface AiQuestion {
  number: number;
  type: QuestionType;
  sectionKey?: string;
  groupKey?: string;
  skill?: string;
  format?: string;
  stem: AiContentBlock[];
  choices: { label: string; content: AiContentBlock[]; isCorrect: boolean | null }[];
  statements: { label: string; content: AiContentBlock[]; correctValue: boolean | null }[];
  answers: string[];
  solution: AiContentBlock[][];
  confidence: Confidence;
  warnings: string[];
}

export interface AiStructuredDocument {
  title: string;
  sections?: { key: string; title: string; instruction: string }[];
  groups?: { key: string; title: string; instruction: string; kind: string; stimulus: AiContentBlock[] }[];
  questions: AiQuestion[];
  warnings: string[];
}

export interface ImportProfileContext {
  profileId: string;
  grade: string;
  authToken?: string;
}

interface OcrResult {
  ok: boolean;
  provider: OcrProvider;
  pending?: boolean;
  jobId?: string;
  status?: string;
  markdown?: string;
  pages?: { index: number; markdown: string; images?: Array<Record<string, unknown>> }[];
  imageAssets?: { url: string; dataUrl: string }[];
  error?: string;
  details?: string;
}

export interface AiImportResult {
  quiz: QuizDocument;
  provider: OcrProvider;
  pageCount: number;
  estimatedOcrUsd: number;
  localAnalysis?: PdfTextAnalysis;
}

const isPdf = (file: File) => file.type === "application/pdf" || file.name.toLowerCase().endsWith(".pdf");
const isImage = (file: File) => file.type.startsWith("image/");

const apiError = async (response: Response) => {
  try {
    const body = await response.json();
    return body.error || body.details || `Máy chủ trả về lỗi ${response.status}.`;
  } catch {
    return `Máy chủ trả về lỗi ${response.status}.`;
  }
};

const wait = (milliseconds: number) => new Promise((resolve) => window.setTimeout(resolve, milliseconds));

const expandOcrLine = (line: string) => {
  const normalized = line
    .replace(/\s+/g, " ")
    .trim();
  if (!normalized) return [];
  const markers = [...normalized.matchAll(/(?:^|\s)([A-Da-d])\s*[.)]\s+/gu)];
  if (markers.length < 2) return [normalized];
  const first = markers[0].index ?? 0;
  const lines: string[] = [];
  const prefix = normalized.slice(0, first).trim();
  if (prefix) lines.push(prefix);
  markers.forEach((marker, index) => {
    const start = marker.index ?? 0;
    const end = markers[index + 1]?.index ?? normalized.length;
    lines.push(normalized.slice(start, end).trim());
  });
  return lines;
};

export const markdownToParserLines = (markdown: string) =>
  markdown
    // Decode HTML entities (có thể còn sót từ một số OCR engine khác)
    .replace(/&amp;/g, "&")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&quot;/g, '"')
    .replace(/&#39;|&apos;/g, "'")
    .replace(/&nbsp;/g, " ")
    // Xóa tham chiếu bảng OCR artifact dạng [tbl-0.html](tbl-0.html) từ Mistral
    // (KHÔNG xóa ![img-0.jpeg](img-0.jpeg) — ảnh cần giữ lại để AI tạo image block + imageMap)
    .replace(/\[tbl-\d+(?:\.\w+)?\]\([^)]*\)/gi, "")
    // Xóa bold đánh dấu phần (PHẦN I, PHẦN II...) vì gây nhiễu parser câu hỏi
    .replace(/\*{1,2}(PHẦN\s+[IVX]+[:\s][^\n*]*?)\*{1,2}/gi, "$1")
    .replace(/<!--\s*page(?::\d+)?\s*-->/giu, "\n")
    .replace(/<!--\s*page-break\s*-->/giu, "\n")
    .replace(/\\pagebreak/giu, "\n")
    .split(/\r?\n/)
    .map(line => {
      return line
        .replace(/^\s*(?:\*\*|\*)\s*((?:Câu|Bài|Question|Item)\s+\d+|[A-Da-d]|[a-z]|Đáp án|Đáp số|Answer|Key|Lời giải|Giải|Hướng dẫn giải|Hướng dẫn|Explanation|Solution)\s*([.:)])\s*(?:\*\*|\*)/i, '$1$2')
        .replace(/^\s*(?:\*\*|\*)\s*((?:Câu|Bài|Question|Item)\s+\d+|[A-Da-d]|[a-z]|Đáp án|Đáp số|Answer|Key|Lời giải|Giải|Hướng dẫn giải|Hướng dẫn|Explanation|Solution)\s*(?:\*\*|\*)\s*([.:)])/i, '$1$2')
        .replace(/^\s*(Câu|Bài|Question|Item)\s+(?:\*\*|\*)\s*(\d+)\s*(?:\*\*|\*)\s*([.:)])/i, '$1 $2$3');
    })
    .flatMap((line) => expandOcrLine(line))
    .filter((line) => line && !/^[-*_]{3,}$/u.test(line));

async function runOcr(
  file: File,
  provider: Exclude<OcrProvider, "local">,
  pageCount: number,
  onProgress: (progress: number, status: string) => void,
  authToken?: string,
): Promise<OcrResult> {
  const form = new FormData();
  form.append("file", file, file.name);
  form.append("provider", provider);
  form.append("pages", String(pageCount));
  form.append("pageLimit", "120");
  const msg = provider === "mistral" ? "Mistral đang OCR tài liệu…" : provider === "gemini" ? "Gemini đang nhận dạng ảnh & công thức…" : "Mathpix đang đọc công thức…";
  onProgress(36, msg);
  const headers = authToken ? { Authorization: `Bearer ${authToken}` } : undefined;
  const response = await fetch("/api/ocr", { method: "POST", headers, body: form });
  if (!response.ok) throw new Error(await apiError(response));
  let result = (await response.json()) as OcrResult;
  if (!result.pending) return result;

  for (let attempt = 0; attempt < 120; attempt += 1) {
    await wait(Math.min(4000, 1400 + attempt * 100));
    const poll = await fetch(`/api/ocr?id=${encodeURIComponent(result.jobId || "")}`, { headers });
    if (!poll.ok) throw new Error(await apiError(poll));
    result = (await poll.json()) as OcrResult;
    onProgress(Math.min(70, 38 + attempt), `Mathpix đang xử lý · ${result.status || "đang chờ"}`);
    if (!result.pending) return result;
  }
  throw new Error("Mathpix xử lý quá lâu. Tác vụ không bị mất; hãy thử lại sau ít phút.");
}

function imageMapFromOcr(result: OcrResult) {
  const map = new Map<string, string>();
  const mimeFor = (id: string) => {
    const ext = (id.match(/\.(\w+)$/) || [])[1]?.toLowerCase();
    if (ext === "jpg" || ext === "jpeg") return "image/jpeg";
    if (ext === "webp") return "image/webp";
    if (ext === "gif") return "image/gif";
    return "image/png";
  };
  for (const page of result.pages || []) {
    for (const raw of page.images || []) {
      const id = String(raw.id || raw.name || raw.image_id || "");
      const encoded = String(raw.image_base64 || raw.base64 || "");
      if (!id || !encoded) continue;
      const src = encoded.startsWith("data:") ? encoded : `data:${mimeFor(id)};base64,${encoded}`;
      map.set(id, src);
      map.set(id.replace(/^.*\//, ""), src);
    }
  }
  for (const asset of result.imageAssets || []) {
    map.set(asset.url, asset.dataUrl);
    map.set(asset.url.replace(/^.*\//, ""), asset.dataUrl);
  }
  return map;
}

const safeImageSource = (source: string, imageMap: Map<string, string>) => {
  if (source.startsWith("data:image/")) return source;
  return imageMap.get(source) || imageMap.get(source.replace(/^.*\//, "")) || "";
};

// Tin học thường chứa thẻ HTML, toán tử C++ và ký hiệu SQL. Lưu chúng dưới
// dạng numeric entity để lớp hiển thị không coi <tr> hay </td> là rich HTML.
const protectInformaticsText = (text: string) => text
  .replace(/&amp;/gu, '&#38;')
  .replace(/&lt;/gu, '&#60;')
  .replace(/&gt;/gu, '&#62;')
  .replace(/</gu, '&#60;')
  .replace(/>/gu, '&#62;')
  .replace(/&(?!#\d+;)/gu, '&#38;');

const blocks = (items: AiContentBlock[] = [], imageMap = new Map<string, string>(), profileId?: string): ContentBlock[] => {
  const text = (value: string) => profileId === "informatics-thpt-v1" ? protectInformaticsText(value) : value;
  return items.flatMap((item): ContentBlock[] => {
    if (item.kind === "math") {
      return [{ id: uid("math"), kind: "math", latex: item.latex.trim(), display: item.display, status: "manual-latex" }];
    }
    if (item.kind === "image") {
      const src = safeImageSource(item.src, imageMap);
      if (!src) return item.alt ? [{ id: uid("p"), kind: "paragraph", text: text(`[Hình: ${item.alt}]`) }] : [];
      return [{ id: uid("img"), kind: "image", src, name: item.alt || "hinh-minh-hoa", alt: item.alt || "Hình minh họa", width: 76, align: "center" }];
    }
    if (item.kind === "table") return item.rows?.length ? [{ id: uid("table"), kind: "table", rows: item.rows.map((row) => row.map(text)) }] : [];
    if (item.kind === "list") return item.items?.length ? [{ id: uid("list"), kind: "list", items: item.items.map(text) }] : [];
    // Paragraph: cứu ảnh mà AI trả về như text dạng ![alt](src) thay vì image block
    const rawText = (item.text || "").trim();
    if (!rawText) return [];
    const imgRe = /!\[([^\]]*)\]\(([^)\s]+)\)/g;
    let imgMatch: RegExpExecArray | null;
    let lastIdx = 0;
    const rescued: ContentBlock[] = [];
    while ((imgMatch = imgRe.exec(rawText)) !== null) {
      if (imgMatch.index > lastIdx) {
        const before = rawText.slice(lastIdx, imgMatch.index).trim();
        if (before) rescued.push({ id: uid("p"), kind: "paragraph", text: text(before) });
      }
      const [, alt, srcRef] = imgMatch;
      const src = safeImageSource(srcRef, imageMap);
      if (src) {
        rescued.push({ id: uid("img"), kind: "image", src, name: srcRef, alt: alt || srcRef, width: 76, align: "center" });
      } else if (alt) {
        rescued.push({ id: uid("p"), kind: "paragraph", text: text(`[Hình: ${alt}]`) });
      }
      lastIdx = imgMatch.index + imgMatch[0].length;
    }
    if (rescued.length > 0) {
      const after = rawText.slice(lastIdx).trim();
      if (after) rescued.push({ id: uid("p"), kind: "paragraph", text: text(after) });
      return rescued;
    }
    return [{ id: uid("p"), kind: "paragraph", text: text(rawText) }];
  });
};

export function toQuizDocument(
  structured: AiStructuredDocument,
  sourceFileName: string,
  imageMap = new Map<string, string>(),
  profileContext: ImportProfileContext = { profileId: "math-thpt-v1", grade: "12" },
): QuizDocument {
  const sectionIds = new Map((structured.sections || []).map((section) => [section.key, uid("section")]));
  const groupIds = new Map((structured.groups || []).map((group) => [group.key, uid("group")]));
  const questions: Question[] = structured.questions.map((item, index) => {
    const question: Question = {
      id: uid("q"),
      number: Number.isFinite(item.number) && item.number > 0 ? item.number : index + 1,
      type: item.type,
      stem: blocks(item.stem, imageMap, profileContext.profileId),
      attachments: [],
      confidence: item.confidence || "medium",
      warnings: [...(item.warnings || [])],
      ...(item.sectionKey && sectionIds.has(item.sectionKey) ? { sectionId: sectionIds.get(item.sectionKey) } : {}),
      ...(item.groupKey && groupIds.has(item.groupKey) ? { groupId: groupIds.get(item.groupKey) } : {}),
      ...(item.skill ? { skill: item.skill } : {}),
      ...(item.format ? { format: item.format } : {}),
    };
    if (item.type === "single-choice") {
      question.choices = item.choices.map((choice, choiceIndex) => ({
        id: uid("c"),
        label: choice.label || String.fromCharCode(65 + choiceIndex),
        content: blocks(choice.content, imageMap, profileContext.profileId),
        isCorrect: choice.isCorrect === null || choice.isCorrect === undefined ? null : Boolean(choice.isCorrect),
      }));
      if (item.choices.some((choice) => choice.isCorrect === null)) question.warnings.push("Đề không ghi rõ đáp án; chưa tự đánh dấu phương án đúng.");
    }
    if (item.type === "true-false") {
      question.statements = item.statements.map((statement, statementIndex) => ({
        id: uid("tf"),
        label: statement.label || String.fromCharCode(97 + statementIndex),
        content: blocks(statement.content, imageMap, profileContext.profileId),
        ...(statement.correctValue === null ? {} : { correctValue: statement.correctValue }),
      }));
    }
    if (item.type === "short-answer") {
      question.shortAnswer = { acceptedAnswers: item.answers || [], caseSensitive: false };
    }
    if (item.solution?.length) {
      question.solution = item.solution.map((step) => ({ id: uid("step"), content: blocks(step, imageMap, profileContext.profileId) }));
    }
    return question;
  });

  const sections = (structured.sections || []).map((section) => ({
    id: sectionIds.get(section.key)!, title: section.title || "Phần thi", instruction: section.instruction || undefined,
    questionIds: questions.filter((question) => question.sectionId === sectionIds.get(section.key)).map((question) => question.id),
  })).filter((section) => section.questionIds.length > 0);
  const groups = (structured.groups || []).map((group) => ({
    id: groupIds.get(group.key)!, title: group.title || "Dữ kiện chung", instruction: group.instruction || undefined, kind: group.kind || undefined,
    stimulus: blocks(group.stimulus || [], imageMap, profileContext.profileId),
    questionIds: questions.filter((question) => question.groupId === groupIds.get(group.key)).map((question) => question.id),
  })).filter((group) => group.questionIds.length > 0);
  const profile = getSubjectProfile(profileContext.profileId);
  const profileWarnings = [] as { id: string; type: "parser"; message: string }[];
  if (profile.groupMode === "central" && questions.length >= 2 && groups.length === 0) {
    profileWarnings.push({ id: uid("w"), type: "parser", message: `${profile.label}: chưa nhận ra đoạn dẫn/câu hỏi chùm. Hãy kiểm tra lại văn bản nguồn và liên kết câu.` });
  }
  for (const question of questions) {
    if (!profile.allowedQuestionTypes.includes(question.type)) {
      question.warnings.push(`Loại câu ${question.type} không nằm trong cấu trúc khuyên dùng của ${profile.label}.`);
    }
    if (question.type === "single-choice" && (question.choices?.length || 0) < 2) question.warnings.push("Câu trắc nghiệm chưa đủ phương án.");
  }
  return {
    id: uid("quiz"),
    title: structured.title.trim() || sourceFileName.replace(/\.[^.]+$/, ""),
    sourceFileName,
    createdAt: new Date().toISOString(),
    questions,
    sections,
    groups,
    profile: makeProfileRef(profileContext.profileId, profileContext.grade),
    warnings: [...(structured.warnings || []).map((message) => ({ id: uid("w"), type: "parser" as const, message })), ...profileWarnings],
    settings: { theme: "light", revealMode: "step", hideAnswersInitially: true, ratio: "16:9" },
  };
}

const splitLongMarkdown = (text: string, maxChars: number) => {
  const parts: string[] = [];
  let remaining = text.trim();
  while (remaining.length > maxChars) {
    const window = remaining.slice(0, maxChars);
    const questionBreaks = [...window.matchAll(/\n\s*(?:Câu|Bài|Question|Item)\s+\d+[.:)]/giu)]
      .map((match) => match.index ?? -1)
      .filter((index) => index > maxChars * 0.45);
    const breakpoints = [
      ...questionBreaks,
      window.lastIndexOf("\n\n"),
      window.lastIndexOf("\n"),
      window.lastIndexOf(". "),
    ].filter((index) => index > maxChars * 0.45);
    const cutAt = breakpoints.length ? Math.max(...breakpoints) : maxChars;
    parts.push(remaining.slice(0, cutAt).trim());
    remaining = remaining.slice(cutAt).trim();
  }
  if (remaining) parts.push(remaining);
  return parts;
};

export const chunkMarkdownForAI = (markdown: string, maxChars = 4_200) => {
  const pages = markdown.split(/\n\s*<!--\s*page-break\s*-->\s*\n/i);
  const chunks: string[] = [];
  let current = "";
  const push = (text: string) => {
    if (!text.trim()) return;
    if (text.length <= maxChars) {
      if (current && current.length + text.length + 30 > maxChars) { chunks.push(current); current = ""; }
      current += `${current ? "\n\n<!-- page-break -->\n\n" : ""}${text}`;
      return;
    }
    if (current) { chunks.push(current); current = ""; }
    chunks.push(...splitLongMarkdown(text, maxChars));
  };
  pages.forEach(push);
  if (current) chunks.push(current);
  return chunks;
};

async function structureMarkdown(
  markdown: string,
  fileName: string,
  onProgress: (progress: number, status: string) => void,
  generateSolutions = true,
  customApiKey?: string,
  profileContext: ImportProfileContext = { profileId: "math-thpt-v1", grade: "12" },
): Promise<AiStructuredDocument> {
  const profile = getSubjectProfile(profileContext.profileId);
  const maxChunkChars = profile.groupMode === "central" ? 8_000 : profile.groupMode === "recommended" ? 6_000 : 4_200;
  const chunks = chunkMarkdownForAI(markdown, maxChunkChars);
  const documents: AiStructuredDocument[] = [];
  const structureChunk = async (text: string, label: string): Promise<AiStructuredDocument[]> => {
    const response = await fetch("/api/structure", {
      method: "POST",
      headers: {
        "content-type": "application/json",
        ...(profileContext.authToken ? { Authorization: `Bearer ${profileContext.authToken}` } : {}),
      },
      body: JSON.stringify({ markdown: text, sourceFileName: fileName, generateSolutions, customApiKey, profileId: profileContext.profileId, grade: profileContext.grade }),
    });
    if (!response.ok && response.status === 413 && text.length > 1_500) {
      const smaller = splitLongMarkdown(text, Math.ceil(text.length / 2));
      if (smaller.length > 1) {
        const nested: AiStructuredDocument[] = [];
        for (let partIndex = 0; partIndex < smaller.length; partIndex += 1) {
          nested.push(...await structureChunk(smaller[partIndex], `${label}.${partIndex + 1}`));
        }
        return nested;
      }
    }
    if (!response.ok) throw new Error(await apiError(response));
    const result = await response.json();
    return [result.structured as AiStructuredDocument];
  };
  for (let index = 0; index < chunks.length; index += 1) {
    onProgress(74 + Math.round(((index + 1) / chunks.length) * 23), `AI đang dựng cấu trúc · phần ${index + 1}/${chunks.length}`);
    documents.push(...await structureChunk(chunks[index], `${fileName} · phần ${index + 1}/${chunks.length}`));
  }
  const prefixKey = (index: number, key?: string) => key ? `chunk-${index}-${key}` : "";
  return {
    title: documents[0]?.title || fileName.replace(/\.[^.]+$/, ""),
    sections: documents.flatMap((document, index) => (document.sections || []).map((section) => ({ ...section, key: prefixKey(index, section.key) }))),
    groups: documents.flatMap((document, index) => (document.groups || []).map((group) => ({ ...group, key: prefixKey(index, group.key) }))),
    questions: documents.flatMap((document, index) => document.questions.map((question) => ({
      ...question,
      sectionKey: prefixKey(index, question.sectionKey),
      groupKey: prefixKey(index, question.groupKey),
    }))),
    warnings: documents.flatMap((document) => document.warnings),
  } satisfies AiStructuredDocument;
}

function fallbackQuizFromMarkdown(markdown: string, fileName: string, reason: string, profileContext: ImportProfileContext): QuizDocument {
  const parserLines = markdownToParserLines(markdown);
  const parsed = profileContext.profileId === "informatics-thpt-v1"
    ? parseInformaticsLines(parserLines, profileContext.profileId)
    : parseLines(parserLines);
  const questions = parsed.questions.length
    ? parsed.questions
    : markdown
      .split(/\n\s*(?:<!--\s*page-break\s*-->|\\pagebreak)\s*\n/iu)
      .map((page, index) => page.replace(/<!--\s*page(?::\d+)?\s*-->/giu, "").trim())
      .filter(Boolean)
      .map((page, index): Question => ({
        id: uid("q"),
        number: index + 1,
        type: "essay",
        stem: page.split(/\r?\n/).flatMap((line) => expandOcrLine(line)).filter(Boolean).map((text) => ({
          id: uid("p"),
          kind: "paragraph" as const,
          text,
        })),
        attachments: [],
        confidence: "low",
        warnings: ["Chưa tách được câu tự động; đã giữ nguyên nội dung OCR để chỉnh tay."],
      }));
  return {
    id: uid("quiz"),
    title: fileName.replace(/\.[^.]+$/, ""),
    sourceFileName: fileName,
    createdAt: new Date().toISOString(),
    questions,
    profile: makeProfileRef(profileContext.profileId, profileContext.grade),
    sections: [],
    groups: [],
    warnings: [
      { id: uid("w"), type: "parser", message: `AI dựng cấu trúc bị bỏ qua: ${reason}` },
      { id: uid("w"), type: "parser", message: "Đang dùng parser cục bộ từ OCR. Hãy rà soát lại loại câu, đáp án và lời giải trước khi xuất." },
      ...parsed.warnings,
    ],
    settings: { theme: "light", revealMode: "step", hideAnswersInitially: true, ratio: "16:9" },
  };
}

export async function importWithAi(
  fileInput: File | File[],
  mode: AiMode,
  onProgress: (progress: number, status: string) => void,
  generateSolutions = true,
  customApiKey?: string,
  profileContext: ImportProfileContext = { profileId: "math-thpt-v1", grade: "12" },
): Promise<AiImportResult> {
  const fileList = Array.isArray(fileInput) ? fileInput : [fileInput];
  const file = fileList[0];
  if (!file) throw new Error("Chưa chọn tệp.");

  // --- Xử lý nạp nhiều tệp / nhiều ảnh cùng lúc ---
  if (fileList.length > 1) {
    onProgress(2, `Đang xử lý ${fileList.length} tệp/ảnh…`);
    let combinedMarkdown = "";
    const combinedImageMap = new Map<string, string>();
    const totalPages = fileList.length;
    let mainProvider: OcrProvider = "mistral";

    for (let i = 0; i < fileList.length; i++) {
      const f = fileList[i];
      const percent = Math.round(5 + (i / fileList.length) * 55);
      onProgress(percent, `Đang đọc ảnh/tệp ${i + 1}/${fileList.length} (${f.name})…`);
      
      let ocr: OcrResult;
      try {
        ocr = await runOcr(f, "mistral", 1, (p, s) => onProgress(percent, `[Tệp ${i + 1}/${fileList.length}] ${s}`), profileContext.authToken);
        mainProvider = "mistral";
      } catch {
        onProgress(percent, `Mistral bận · chuyển sang Gemini cho tệp ${i + 1}…`);
        ocr = await runOcr(f, "gemini", 1, (p, s) => onProgress(percent, `[Tệp ${i + 1}/${fileList.length}] ${s}`), profileContext.authToken);
        mainProvider = "gemini";
      }

      if (ocr.markdown) {
        combinedMarkdown += `\n\n--- Trang ${i + 1} (${f.name}) ---\n\n` + ocr.markdown;
      }
      const subMap = imageMapFromOcr(ocr);
      subMap.forEach((v, k) => combinedImageMap.set(k, v));
    }

    if (!combinedMarkdown.trim()) throw new Error("Không thể đọc được nội dung từ các ảnh/tệp đã chọn.");

    onProgress(65, `AI đang phân tích và dựng bài thi từ ${fileList.length} tệp…`);
    let quiz: QuizDocument;
    const titleName = `Tập ${fileList.length} ảnh bài giảng (${fileList[0].name.replace(/\.[^/.]+$/, "")})`;
    try {
      const structured = await structureMarkdown(combinedMarkdown, titleName, onProgress, generateSolutions, customApiKey, profileContext);
      quiz = toQuizDocument(structured, titleName, combinedImageMap, profileContext);
    } catch (error) {
      const reason = error instanceof Error ? error.message : "AI không phản hồi đúng định dạng.";
      onProgress(96, "AI cấu trúc lỗi · đang dựng bài bằng parser cục bộ…");
      quiz = fallbackQuizFromMarkdown(combinedMarkdown, titleName, reason, profileContext);
    }

    if (!quiz.questions.length) throw new Error("Không tìm thấy câu hỏi từ các tệp đã chọn.");
    onProgress(100, `Hoàn tất · ${quiz.questions.length} câu từ ${fileList.length} ảnh/tệp · ${mainProvider}`);
    const estimatedOcrUsd = totalPages * 0.002;
    return { quiz, provider: mainProvider, pageCount: totalPages, estimatedOcrUsd };
  }

  if (file.size > 25 * 1024 * 1024) throw new Error("OCR đám mây nhận tệp tối đa 25 MB. Hãy nén hoặc chia tài liệu.");

  // --- Bước 0: Kiểm tra cache trước ---
  onProgress(1, "Kiểm tra cache…");
  const fileHash = await hashFile(file);
  const selectedProfile = getSubjectProfile(profileContext.profileId);
  const ck = cacheKey(fileHash, mode, generateSolutions, `${selectedProfile.id}@${selectedProfile.version}:${profileContext.grade}`);
  const cached = await getCached(ck);
  if (cached) {
    onProgress(100, `✨ Được lấy từ cache · ${cached.quiz.questions.length} câu · 0 VNĐ`);
    return {
      quiz: cached.quiz,
      provider: cached.provider as OcrProvider,
      pageCount: cached.pageCount,
      estimatedOcrUsd: 0, // Cache = miễn phí
    };
  }

  let analysis: PdfTextAnalysis | undefined;
  let provider: OcrProvider = "mistral";
  let markdown = "";
  let pageCount = 1;
  let imageMap = new Map<string, string>();

  // --- Bước 1: Phân loại file ---
  if (isPdf(file)) {
    onProgress(5, "Đang kiểm tra PDF có lớp chữ hay là bản quét…");
    const { analyzePdfText } = await import("./pdfText");
    analysis = await analyzePdfText(file, onProgress);
    pageCount = analysis.pageCount;
    const localIsGood = analysis.score >= 0.63 && analysis.imageSignals === 0 && analysis.markdown.replace(/\s/g, "").length >= pageCount * 260;
    if ((mode === "auto" || mode === "economy") && localIsGood) {
      provider = "local";
      markdown = analysis.markdown;
      onProgress(34, "PDF có lớp chữ tốt · không tính phí OCR");
    } else if (mode === "precision") {
      provider = "mathpix";
    } else if (analysis.imageSignals > 0) {
      provider = "mistral"; // Mistral trả về ảnh base64 inline, nhanh hơn Mathpix async rất nhiều
    } else {
      provider = "mistral";
    }
  } else if (isImage(file)) {
    // --- Bước 1b: Deskew + thử Tesseract trước ---
    if (mode === "economy") {
      onProgress(4, "Đang chỉnh thẳng ảnh…");
      const deskewed = await deskewImage(file);
      onProgress(10, "Đang thử OCR cục bộ miễn phí…");
      const tess = await smartOcrRoute(deskewed, onProgress);
      if (tess.source === "local") {
        provider = "local";
        markdown = tess.markdown;
        onProgress(34, "OCR cục bộ thành công · 0 VNĐ");
      } else {
        // Deskew xong rồi gửi lên cloud
        const processedFile = await deskewImage(file);
        provider = "mistral"; // Mistral xử lý ảnh nhanh và trả về base64 inline

        const ocr = await runOcr(processedFile, provider, 1, onProgress, profileContext.authToken);
        markdown = ocr.markdown || "";
        imageMap = imageMapFromOcr(ocr);
        if (!markdown.trim()) throw new Error(`${provider.toUpperCase()} không trả về nội dung đọc được.`);
        // Đã xử lý OCR ảnh ở trên
        let quiz: QuizDocument;
        try {
          const structured = await structureMarkdown(markdown, file.name, onProgress, generateSolutions, customApiKey, profileContext);
          quiz = toQuizDocument(structured, file.name, imageMap, profileContext);
        } catch (error) {
          const reason = error instanceof Error ? error.message : "AI không phản hồi đúng định dạng.";
          onProgress(96, "AI cấu trúc lỗi · đang dựng bài bằng parser cục bộ…");
          quiz = fallbackQuizFromMarkdown(markdown, file.name, reason, profileContext);
        }
        if (!quiz.questions.length) throw new Error("Không tìm thấy câu hỏi. Hãy thử chế độ Công thức khó hoặc chia nhỏ đề.");
        const estimatedOcrUsd = (provider as string) === "mistral" ? 0.002 : (provider as string) === "gemini" ? 0.001 : 0;
        onProgress(100, `Hoàn tất · ${quiz.questions.length} câu · ${provider}`);
        await setCached(ck, { hash: ck, quiz, provider, pageCount: 1, estimatedOcrUsd });
        return { quiz, provider, pageCount: 1, estimatedOcrUsd, localAnalysis: analysis };
      }
    } else {
      provider = "mistral"; // Mistral xử lý ảnh nhanh + kết quả chất lượng cao
    }
  } else {
    provider = "mistral";
  }

  // --- Bước 2: Gọi cloud OCR nếu cần ---
  if (provider !== "local") {
    let ocr: OcrResult;
    try {
      ocr = await runOcr(file, provider, pageCount, onProgress, profileContext.authToken);
    } catch (err) {
      if ((provider as string) !== "gemini") {
        onProgress(42, `${provider.toUpperCase()} bận · tự động chuyển sang Gemini 3.6 Flash…`);
        provider = "gemini";
        ocr = await runOcr(file, "gemini", pageCount, onProgress, profileContext.authToken);
      } else {
        throw err;
      }
    }
    markdown = ocr.markdown || "";
    imageMap = imageMapFromOcr(ocr);
    if (ocr.pages?.length) pageCount = ocr.pages.length;
    if (!markdown.trim()) throw new Error(`${provider.toUpperCase()} không trả về nội dung đọc được.`);
  }

  // --- Bước 3: Chuẩn hoá cấu trúc bằng Gemini ---
  let quiz: QuizDocument;
  try {
    const structured = await structureMarkdown(markdown, file.name, onProgress, generateSolutions, customApiKey, profileContext);
    quiz = toQuizDocument(structured, file.name, imageMap, profileContext);
  } catch (error) {
    const reason = error instanceof Error ? error.message : "AI không phản hồi đúng định dạng.";
    onProgress(96, "AI cấu trúc lỗi · đang dựng bài bằng parser cục bộ…");
    quiz = fallbackQuizFromMarkdown(markdown, file.name, reason, profileContext);
  }
  if (!quiz.questions.length) throw new Error("Không tìm thấy câu hỏi. Hãy thử chế độ Công thức khó hoặc chia nhỏ đề.");
  onProgress(100, `Hoàn tất · ${quiz.questions.length} câu · ${provider === "local" ? "OCR miễn phí" : provider}`);
  const estimatedOcrUsd = provider === "mistral" ? pageCount * 0.002 : provider === "gemini" ? pageCount * (isImage(file) ? 0.001 : 0.0015) : 0;

  // --- Bước 4: Lưu cache ---
  await setCached(ck, { hash: ck, quiz, provider, pageCount, estimatedOcrUsd });

  return { quiz, provider, pageCount, estimatedOcrUsd, localAnalysis: analysis };
}
