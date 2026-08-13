// @vitest-environment jsdom

/**
 * Golden-set quality metrics — thước đo chung cho mục tiêu "đầu ra đạt 99%".
 *
 * - Phần DOCX: chạy toàn bộ đề thật trong public/samples qua đúng adapter
 *   parser của từng profile (cùng đường đi với production importDocx).
 * - Phần OCR markdown: chạy fixture trong src/tests/fixtures qua đường
 *   markdownToParserLines + parseLines (đường fallback cục bộ sau OCR).
 *
 * Thêm đề mới: bỏ file DOCX vào public/samples rồi khai báo trong
 * GOLDEN_DOCX_SET, hoặc bỏ cặp *.md + *.expected.json vào fixtures.
 */
import { readFile } from "node:fs/promises";
import { join } from "node:path";
import mammoth from "mammoth";
import { describe, expect, it } from "vitest";
import { parseHtmlByProfile, parseLines } from "../features/question-parser/parser";
import { markdownToParserLines } from "../features/import-ai/aiImport";
import { applyAnswerKey, buildSkeleton } from "../features/import-ai/skeleton";
import { assessQuizQuality, formatQualityReport, type QualityExpectation } from "../features/quality/metrics";

const samplePath = (name: string) => join(process.cwd(), "public", "samples", name);
const fixturePath = (name: string) => join(process.cwd(), "src", "tests", "fixtures", name);

const GOLDEN_DOCX_SET: { file: string; profileId: string; expected: QualityExpectation }[] = [
  { file: "vat-ly-tot-nghiep-2026.docx", profileId: "physics-thpt-v1", expected: { questionCount: 28 } },
  { file: "sinh-hoc-tot-nghiep-2026.docx", profileId: "biology-thpt-v1", expected: { questionCount: 28 } },
  { file: "dia-ly-tot-nghiep-2026.docx", profileId: "geography-thpt-v1", expected: { questionCount: 28 } },
  { file: "lich-su-tot-nghiep-2026.docx", profileId: "history-thpt-v1", expected: { questionCount: 28 } },
  { file: "tin-hoc-tot-nghiep-2026-le-trong-tan.docx", profileId: "informatics-thpt-v1", expected: { questionCount: 30 } },
  // Đề Ngữ văn gốc không kèm bảng đáp án cho 5 câu đọc hiểu → phủ đáp án thấp là do nguồn, không phải parser.
  { file: "nguvan-totnghiep-2026.docx", profileId: "literature-thpt-v1", expected: { questionCount: 7, minScore: 80 } },
  { file: "gdqp-10-cuoi-hki-2025-2026.docx", profileId: "gdqp-10-v1", expected: { questionCount: 32 } },
  { file: "HN-De-thi-tuyen-sinh-10-Tieng-Anh-So-GD-Ha-Noi-nam-26-27.docx", profileId: "english-10-v1", expected: { questionCount: 40 } },
  { file: "thuvienhoclieu.com-De-thi-tuyen-sinh-10-Tieng-Anh-So-GD-TP-HCM-nam-26-27-.docx", profileId: "english-10-hcm-v1", expected: { questionCount: 40 } },
  { file: "De-kiem-tra-HK2-Tieng-Anh-12-So-GD-Bac-Ninh-25-26.docx", profileId: "english-12-v1", expected: { questionCount: 40 } },
];

describe("Golden DOCX set — điểm chất lượng tổng hợp", () => {
  it.each(GOLDEN_DOCX_SET.map((entry) => [entry.file, entry] as const))("%s đạt ngưỡng 99", async (_name, entry) => {
    const converted = await mammoth.convertToHtml({ buffer: await readFile(samplePath(entry.file)) });
    const parsed = parseHtmlByProfile(converted.value, entry.profileId);
    const report = assessQuizQuality(parsed, { file: entry.file, profileId: entry.profileId, expected: entry.expected });
    console.log(formatQualityReport(report));
    expect(report.issues.filter((issue) => issue.severity === "error")).toEqual([]);
    expect(report.score).toBeGreaterThanOrEqual(entry.expected.minScore ?? 99);
  });
});

describe("OCR markdown fixtures — đường fallback cục bộ", () => {
  it("đề Toán có đáp án inline đạt ngưỡng 99", async () => {
    const markdown = await readFile(fixturePath("math-ocr-inline-answers.md"), "utf8");
    const parsed = parseLines(markdownToParserLines(markdown));
    const report = assessQuizQuality(parsed, {
      file: "math-ocr-inline-answers.md",
      profileId: "math-thpt-v1",
      expected: { questionCount: 4, answers: { 1: "A", 2: "B", 3: "Đ Đ S Đ", 4: "2" } },
    });
    console.log(formatQualityReport(report));
    expect(report.issues.filter((issue) => issue.severity === "error")).toEqual([]);
    expect(report.score).toBeGreaterThanOrEqual(99);
  });

  it("đề có bảng đáp án cuối đề được gán đáp án qua skeleton (Phase B)", async () => {
    const markdown = await readFile(fixturePath("math-ocr-answer-key-table.md"), "utf8");
    const parsed = parseLines(markdownToParserLines(markdown));
    // Mô phỏng đúng đường fallback mới: skeleton trích bảng đáp án rồi gán lại.
    applyAnswerKey(parsed.questions, buildSkeleton(markdown).answerKey);
    const report = assessQuizQuality(parsed, {
      file: "math-ocr-answer-key-table.md",
      profileId: "math-thpt-v1",
      expected: { questionCount: 4, answers: { 1: "A", 2: "B", 3: "B", 4: "C" } },
    });
    console.log(formatQualityReport(report));
    expect(report.issues.filter((issue) => issue.severity === "error")).toEqual([]);
    expect(report.score).toBeGreaterThanOrEqual(99);
  });
});
