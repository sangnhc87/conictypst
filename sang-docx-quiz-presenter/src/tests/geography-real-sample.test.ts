// @vitest-environment jsdom

import { readFile } from "node:fs/promises";
import { join } from "node:path";
import mammoth from "mammoth";
import { describe, expect, it } from "vitest";
import { parseGeographyStructuredHtml } from "../features/question-parser/parser";

const sample = join(process.cwd(), "public", "samples", "dia-ly-tot-nghiep-2026.docx");

describe("Geography graduation DOCX sample regression audit", () => {
  it("keeps the 18 + 4 groups + 6 short-answer structure and preserves figures/tables", async () => {
    const converted = await mammoth.convertToHtml({ buffer: await readFile(sample) });
    const parsed = parseGeographyStructuredHtml(converted.value, "geography-thpt-v1");
    const partOne = parsed.questions.filter((question) => question.sectionId === "part-i");
    const partTwo = parsed.questions.filter((question) => question.sectionId === "part-ii");
    const partThree = parsed.questions.filter((question) => question.sectionId === "part-iii");

    expect(parsed.warnings).toHaveLength(0);
    expect(partOne).toHaveLength(18);
    expect(partOne.every((question) => question.type === "single-choice" && question.choices?.length === 4)).toBe(true);
    expect(partOne.every((question) => question.choices?.some((choice) => choice.isCorrect === true))).toBe(true);
    expect(partOne.some((question) => question.stem.some((block) => block.kind === "table"))).toBe(true);
    expect(partOne.some((question) => question.stem.some((block) => block.kind === "image"))).toBe(true);
    expect(partTwo).toHaveLength(4);
    expect(partTwo.every((question) => question.type === "true-false" && question.statements?.length === 4)).toBe(true);
    expect(partTwo.every((question) => question.statements?.every((statement) => typeof statement.correctValue === "boolean"))).toBe(true);
    expect(parsed.groups).toHaveLength(4);
    expect(parsed.groups?.every((group) => group.kind === "geography-data" && group.stimulus.length > 0 && group.questionIds.length === 1)).toBe(true);
    expect(parsed.groups?.some((group) => group.stimulus.some((block) => block.kind === "image"))).toBe(true);
    expect(partThree).toHaveLength(6);
    expect(partThree.every((question) => question.shortAnswer?.acceptedAnswers.length === 1)).toBe(true);
    expect(partThree[1].stem.some((block) => block.kind === "table")).toBe(true);
    expect(partOne[0].solution?.[0].content[0]).toMatchObject({ kind: "paragraph" });
    expect(partTwo[0].solution?.[0].content[0]).toMatchObject({ kind: "paragraph" });
    expect(partThree[0].solution?.[0].content[0]).toMatchObject({ kind: "paragraph" });
  });
});
