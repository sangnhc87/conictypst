// @vitest-environment jsdom

import { readFile } from "node:fs/promises";
import { join } from "node:path";
import { describe, expect, it } from "vitest";
import { inspectDocx } from "../features/import-docx/docxInspector";
import { hasTemplateStyles, parseTemplateBlocks } from "../features/import-docx/templateParser";
import { assessQuizQuality, formatQualityReport } from "../features/quality/metrics";

const templatePath = join(process.cwd(), "public", "templates", "mau-de-chuan-quiz.docx");

describe("Template DOCX chuẩn (style Quiz*)", () => {
  it("inspectDocx bắt được styleId của đoạn", async () => {
    const buffer = await readFile(templatePath);
    const inspection = await inspectDocx(new Uint8Array(buffer).buffer as ArrayBuffer);
    const styled = inspection.structure.blocks.filter((block) => block.styleId?.startsWith("Quiz"));
    expect(styled.length).toBeGreaterThanOrEqual(10);
    expect(hasTemplateStyles(inspection.structure.blocks)).toBe(true);
  });

  it("parse deterministic đạt điểm tuyệt đối trên template", async () => {
    const buffer = await readFile(templatePath);
    const inspection = await inspectDocx(new Uint8Array(buffer).buffer as ArrayBuffer);
    const parsed = parseTemplateBlocks(inspection.structure.blocks);
    expect(parsed.warnings).toEqual([]);

    const bySection = (id: string) => parsed.questions.filter((question) => question.sectionId === id);
    const sections = parsed.sections || [];
    expect(sections).toHaveLength(3);
    expect(bySection(sections[0].id).map((question) => question.type)).toEqual(["single-choice", "single-choice"]);
    expect(bySection(sections[1].id)[0]).toMatchObject({ type: "true-false" });
    expect(bySection(sections[2].id)[0]).toMatchObject({ type: "short-answer" });
    // Câu 2 tự đọc nhãn có sẵn trong text; câu 1 tự sinh nhãn.
    const question1 = parsed.questions.find((question) => question.number === 1)!;
    expect(question1.choices?.map((choice) => choice.label)).toEqual(["A", "B", "C", "D"]);
    expect(question1.choices?.[0].isCorrect).toBe(true);
    // Chùm: câu đúng/sai nằm trong group stimulus.
    expect(parsed.groups).toHaveLength(1);
    expect(parsed.groups?.[0].questionIds).toHaveLength(1);

    const report = assessQuizQuality(parsed, {
      file: "mau-de-chuan-quiz.docx",
      profileId: "math-thpt-v1",
      expected: { questionCount: 4, answers: { 1: "A" } },
    });
    console.log(formatQualityReport(report));
    // Số câu trùng nhau giữa các phần (1,2 / 1 / 1) nên bỏ qua tiêu chí
    // numbering toàn cục; các hạng mục còn lại phải đạt tuyệt đối.
    expect(report.choiceCompleteness).toBe(1);
    expect(report.latexCompileRate).toBe(1);
    expect(report.answerCoverage).toBe(1);
  });
});
