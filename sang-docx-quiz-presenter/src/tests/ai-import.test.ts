import { describe, expect, it } from "vitest";
import { chunkMarkdownForAI, markdownToParserLines, toQuizDocument, type AiStructuredDocument } from "../features/import-ai/aiImport";
import { parseLines } from "../features/question-parser/parser";

const empty = { text: "", latex: "", display: false, src: "", alt: "", rows: [] as string[][], items: [] as string[] };

describe("AI structured document conversion", () => {
  it("keeps every choice and maps formulas, tables and solutions", () => {
    const source: AiStructuredDocument = {
      title: "Đề kiểm tra",
      warnings: [],
      questions: [{
        number: 1,
        type: "single-choice",
        stem: [
          { ...empty, kind: "paragraph", text: "Tính giá trị" },
          { ...empty, kind: "math", latex: "x^2+1", display: true },
          { ...empty, kind: "table", rows: [["x", "1"], ["y", "2"]] },
        ],
        choices: "ABCD".split("").map((label, index) => ({
          label,
          content: [{ ...empty, kind: "paragraph" as const, text: String(index + 1) }],
          isCorrect: label === "C",
        })),
        statements: [],
        answers: [],
        solution: [[{ ...empty, kind: "paragraph", text: "Thay x vào biểu thức." }]],
        confidence: "high",
        warnings: [],
      }],
    };

    const quiz = toQuizDocument(source, "de.pdf");
    expect(quiz.questions).toHaveLength(1);
    expect(quiz.questions[0].choices).toHaveLength(4);
    expect(quiz.questions[0].choices?.find((choice) => choice.isCorrect)?.label).toBe("C");
    expect(quiz.questions[0].stem.map((block) => block.kind)).toEqual(["paragraph", "math", "table"]);
    expect(quiz.questions[0].solution?.[0].content[0]).toMatchObject({ kind: "paragraph", text: "Thay x vào biểu thức." });
  });

  it("does not invent a true/false answer when OCR has none", () => {
    const source: AiStructuredDocument = {
      title: "Đúng sai",
      warnings: ["Thiếu đáp án"],
      questions: [{
        number: 2,
        type: "true-false",
        stem: [{ ...empty, kind: "paragraph", text: "Xét các phát biểu" }],
        choices: [],
        statements: [{ label: "a", content: [{ ...empty, kind: "paragraph", text: "Mệnh đề" }], correctValue: null }],
        answers: [],
        solution: [],
        confidence: "medium",
        warnings: [],
      }],
    };
    const statement = toQuizDocument(source, "de.pdf").questions[0].statements?.[0];
    expect(statement).not.toHaveProperty("correctValue");
  });

  it("maps AI sections and a shared stimulus to multiple child questions", () => {
    const source: AiStructuredDocument = {
      title: "English reading",
      warnings: [],
      sections: [{ key: "reading", title: "Reading", instruction: "Read the passage." }],
      groups: [{ key: "passage-1", title: "Passage 1", instruction: "Questions 1–2", kind: "reading", stimulus: [{ ...empty, kind: "paragraph", text: "A shared passage." }] }],
      questions: [1, 2].map((number) => ({
        number, type: "single-choice" as const, sectionKey: "reading", groupKey: "passage-1", skill: "Reading", format: "Detail",
        stem: [{ ...empty, kind: "paragraph" as const, text: `Question ${number}` }],
        choices: ["A", "B"].map((label, index) => ({ label, content: [{ ...empty, kind: "paragraph" as const, text: label }], isCorrect: index === 0 })),
        statements: [], answers: [], solution: [], confidence: "high" as const, warnings: [],
      })),
    };
    const quiz = toQuizDocument(source, "english.pdf", new Map(), { profileId: "english-12-v1", grade: "12" });
    expect(quiz.groups).toHaveLength(1);
    expect(quiz.groups?.[0].questionIds).toHaveLength(2);
    expect(quiz.questions.every((question) => question.groupId === quiz.groups?.[0].id)).toBe(true);
    expect(quiz.questions.every((question) => question.sectionId === quiz.sections?.[0].id)).toBe(true);
  });

  it("keeps AI chunks below the low-cost token budget", () => {
    const page = "Câu 1. " + "Nội dung đề toán ".repeat(900);
    const chunks = chunkMarkdownForAI([page, page, page].join("\n\n<!-- page-break -->\n\n"));
    expect(chunks.length).toBeGreaterThan(1);
    expect(Math.max(...chunks.map((chunk) => chunk.length))).toBeLessThanOrEqual(4_200);
  });

  it("lets the local fallback recover inline multiple-choice OCR", () => {
    const lines = markdownToParserLines("Câu 1. Chọn kết quả A. 1 B. 2 C. 3 D. 4\nĐáp án: B");
    const parsed = parseLines(lines);
    expect(parsed.questions).toHaveLength(1);
    expect(parsed.questions[0].choices).toHaveLength(4);
    expect(parsed.questions[0].choices?.[1].isCorrect).toBe(true);
  });

  it("protects Tin học markup and operators from rich-text interpretation", () => {
    const source: AiStructuredDocument = {
      title: "Tin học",
      warnings: [],
      questions: [{
        number: 1,
        type: "single-choice",
        stem: [{ ...empty, kind: "paragraph", text: "Mã <td> a[i] && b[i] >= k </td>" }],
        choices: ["A", "B", "C", "D"].map((label) => ({ label, content: [{ ...empty, kind: "paragraph" as const, text: label }], isCorrect: label === "A" })),
        statements: [],
        answers: [],
        solution: [],
        confidence: "high",
        warnings: [],
      }],
    };
    const quiz = toQuizDocument(source, "tin-hoc.pdf", new Map(), { profileId: "informatics-thpt-v1", grade: "12" });
    const stemText = quiz.questions[0].stem.find((block) => block.kind === "paragraph");
    expect(stemText).toMatchObject({ kind: "paragraph", text: "Mã &#60;td&#62; a[i] &#38;&#38; b[i] &#62;= k &#60;/td&#62;" });
  });
});
