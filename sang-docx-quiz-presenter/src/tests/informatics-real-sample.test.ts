// @vitest-environment jsdom

import { readFile } from "node:fs/promises";
import { join } from "node:path";
import mammoth from "mammoth";
import { describe, expect, it } from "vitest";
import { parseInformaticsStructuredHtml } from "../features/question-parser/parser";

const sample = join(process.cwd(), "public", "samples", "tin-hoc-tot-nghiep-2026-le-trong-tan.docx");

describe("Tin học graduation-style DOCX sample regression audit", () => {
  it("keeps 24 A-D questions, six true/false groups, code tables and both orientations", async () => {
    const converted = await mammoth.convertToHtml({ buffer: await readFile(sample) }, { styleMap: ["u => u"] });
    const parsed = parseInformaticsStructuredHtml(converted.value, "informatics-thpt-v1");
    const partOne = parsed.questions.filter((question) => question.sectionId === "part-i");
    const common = parsed.questions.filter((question) => question.sectionId === "part-ii-common");
    const computerScience = parsed.questions.filter((question) => question.sectionId === "part-ii-cs");
    const applied = parsed.questions.filter((question) => question.sectionId === "part-ii-app");

    expect(parsed.warnings).toHaveLength(0);
    expect(partOne).toHaveLength(24);
    expect(partOne.every((question) => question.type === "single-choice" && question.choices?.length === 4)).toBe(true);
    expect(partOne.every((question) => question.choices?.some((choice) => choice.isCorrect === true))).toBe(true);
    expect(common).toHaveLength(2);
    expect(computerScience).toHaveLength(2);
    expect(applied).toHaveLength(2);
    expect([...common, ...computerScience, ...applied].every((question) => question.type === "true-false" && question.statements?.length === 4)).toBe(true);
    expect([...common, ...computerScience, ...applied].every((question) => question.statements?.every((statement) => typeof statement.correctValue === "boolean"))).toBe(true);
    expect(parsed.groups).toHaveLength(6);
    expect(parsed.groups?.every((group) => group.kind === "informatics-data" && group.stimulus.length > 0 && group.questionIds.length === 1)).toBe(true);
    expect(partOne[0].choices?.find((choice) => choice.isCorrect)?.label).toBe("C");
    expect(partOne[4].stem.some((block) => block.kind === "table" && block.rows[0]?.[0] === "Python")).toBe(true);
    expect(parsed.groups?.some((group) => group.stimulus.some((block) => block.kind === "table" && block.rows[0]?.[0] === "Python"))).toBe(true);
    expect(partOne[0].solution?.[0].content[0]).toMatchObject({ kind: "paragraph" });
    expect(common[0].solution?.[0].content[0]).toMatchObject({ kind: "paragraph" });
  });
});
