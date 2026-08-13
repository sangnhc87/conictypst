// @vitest-environment jsdom

import { readFile } from "node:fs/promises";
import { join } from "node:path";
import { describe, expect, it } from "vitest";
import { applyAnswerKey, buildSkeleton, chunkMarkdownBySkeleton, describeSkeleton, extractAnswerKey, findQuestionMarkers } from "../features/import-ai/skeleton";

const fixturePath = (name: string) => join(process.cwd(), "src", "tests", "fixtures", name);

describe("buildSkeleton — mỏ neo deterministic", () => {
  it("tìm đúng marker câu hỏi, bỏ qua marker giả trong nội dung", () => {
    const markdown = "Câu 1. Nội dung\nA. x\nCâu 2. Nội dung\n**Câu 3.** Nội dung\n";
    const markers = findQuestionMarkers(markdown);
    expect(markers.map((marker) => marker.number)).toEqual([1, 2, 3]);
  });

  it("trích bảng đáp án dạng bảng markdown", async () => {
    const markdown = await readFile(fixturePath("math-ocr-answer-key-table.md"), "utf8");
    const result = extractAnswerKey(markdown);
    expect(result?.entries).toEqual([
      { number: 1, raw: "A" },
      { number: 2, raw: "B" },
      { number: 3, raw: "B" },
      { number: 4, raw: "C" },
    ]);
  });

  it("trích đáp án dạng lưới inline 1. A 2. B", () => {
    const markdown = "Câu 1. x\nA. 1\nB. 2\nC. 3\nD. 4\n\nĐÁP ÁN\n1. B   2. C   3. A   4. D\n5. A   6. B\n";
    const result = extractAnswerKey(markdown);
    expect(result?.entries.map((entry) => `${entry.number}${entry.raw}`)).toEqual(["1B", "2C", "3A", "4D", "5A", "6B"]);
  });

  it("trích đáp án đúng/sai và trả lời ngắn từng dòng", () => {
    const markdown = "Câu 1. x\n\nĐÁP ÁN\nCâu 1: Đ S Đ S\nCâu 2: 12,5\n";
    const result = extractAnswerKey(markdown);
    expect(result?.entries).toEqual([
      { number: 1, raw: "Đ S Đ S" },
      { number: 2, raw: "12,5" },
    ]);
  });

  it("không nhận nhầm khi đề không có bảng đáp án", async () => {
    const markdown = await readFile(fixturePath("math-ocr-inline-answers.md"), "utf8");
    expect(extractAnswerKey(markdown)).toBeNull();
  });

  it("buildSkeleton tổng hợp marker, phần thi và đáp án", async () => {
    const markdown = await readFile(fixturePath("math-ocr-answer-key-table.md"), "utf8");
    const skeleton = buildSkeleton(markdown);
    expect(skeleton.markers.map((marker) => marker.number)).toEqual([1, 2, 3, 4]);
    expect(skeleton.sections.length).toBeGreaterThanOrEqual(1);
    expect(skeleton.answerKey).toHaveLength(4);
  });

  it("chunkMarkdownBySkeleton không bao giờ xẻ đôi câu và giữ section", () => {
    const question = (n: number) => `Câu ${n}. ${"Nội dung câu hỏi dài để ép chunk phải cắt. ".repeat(8)}\nA. x\nB. y\nC. z\nD. w\n`;
    const markdown = `PHẦN I. Trắc nghiệm.\n\n${[1, 2, 3, 4, 5, 6].map(question).join("\n")}\nĐÁP ÁN\n1. A 2. B 3. C 4. D 5. A 6. B\n`;
    const skeleton = buildSkeleton(markdown);
    const chunks = chunkMarkdownBySkeleton(markdown, skeleton, 1200);
    expect(chunks.length).toBeGreaterThan(1);
    // Mọi chunk đều chứa trọn vẹn các câu của nó (đủ 4 phương án A-D).
    for (const chunk of chunks) {
      for (const number of chunk.questionNumbers) {
        const section = chunk.text.slice(chunk.text.indexOf(`Câu ${number}.`));
        expect(section).toMatch(/A\.\s/);
        expect(section).toMatch(/D\.\s/);
      }
    }
    expect(chunks.flatMap((chunk) => chunk.questionNumbers)).toEqual([1, 2, 3, 4, 5, 6]);
    // Bảng đáp án không lọt vào chunk cuối.
    expect(chunks.at(-1)!.text).not.toContain("ĐÁP ÁN");
    expect(chunks.every((chunk) => chunk.sectionTitle?.startsWith("PHẦN I"))).toBe(true);
  });

  it("chunkMarkdownBySkeleton chịu được đề không có marker", () => {
    const chunks = chunkMarkdownBySkeleton("văn bản tự do", buildSkeleton("văn bản tự do"), 100);
    expect(chunks).toHaveLength(1);
    expect(chunks[0].questionNumbers).toEqual([]);
  });

  it("applyAnswerKey gán đáp án TN, Đ/S và TLN, cảnh báo mục mồ côi", () => {
    const questions = [
      { number: 1, type: "single-choice", choices: ["A", "B", "C", "D"].map((label) => ({ label, isCorrect: null as boolean | null })) },
      { number: 2, type: "true-false", statements: [{}, {}, {}, {}] as { correctValue?: boolean }[] },
      { number: 3, type: "short-answer", shortAnswer: { acceptedAnswers: [] as string[], caseSensitive: false } },
    ];
    const warnings = applyAnswerKey(questions, [
      { number: 1, raw: "B" },
      { number: 2, raw: "Đ S Đ S" },
      { number: 3, raw: "12,5" },
      { number: 9, raw: "A" },
    ]);
    expect(questions[0].choices?.[1].isCorrect).toBe(true);
    expect(questions[0].choices?.filter((choice) => choice.isCorrect)).toHaveLength(1);
    expect(questions[1].statements?.map((statement) => statement.correctValue)).toEqual([true, false, true, false]);
    expect(questions[2].shortAnswer?.acceptedAnswers).toEqual(["12,5"]);
    expect(warnings.some((warning) => warning.includes("9"))).toBe(true);
  });

  it("describeSkeleton nêu rõ số câu chunk phải trả", () => {
    const text = describeSkeleton(
      { markers: [{ number: 1, offset: 0 }, { number: 2, offset: 10 }], sections: [{ title: "PHẦN I", offset: 0 }], answerKey: [{ number: 1, raw: "A" }] },
      [1, 2],
    );
    expect(text).toContain("ĐÚNG 2 CÂU");
    expect(text).toContain("1.A");
  });
});
