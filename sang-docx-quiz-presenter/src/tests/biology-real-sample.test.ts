// @vitest-environment jsdom

import { readFile } from "node:fs/promises";
import { join } from "node:path";
import mammoth from "mammoth";
import { describe, expect, it } from "vitest";
import { parseBiologyStructuredHtml } from "../features/question-parser/parser";

const sample = join(process.cwd(), "public", "samples", "sinh-hoc-tot-nghiep-2026.docx");

describe("Biology graduation DOCX sample regression audit", () => {
  it("keeps 18 A-D questions, four true/false data groups, six short answers and figures", async () => {
    const converted = await mammoth.convertToHtml({ buffer: await readFile(sample) });
    const parsed = parseBiologyStructuredHtml(converted.value, "biology-thpt-v1");
    const partOne = parsed.questions.filter((question) => question.sectionId === "part-i");
    const partTwo = parsed.questions.filter((question) => question.sectionId === "part-ii");
    const partThree = parsed.questions.filter((question) => question.sectionId === "part-iii");
    expect(parsed.warnings).toHaveLength(0);
    expect(partOne).toHaveLength(18);
    expect(partOne.every((question) => question.type === "single-choice" && question.choices?.length === 4)).toBe(true);
    expect(partOne.every((question) => question.choices?.some((choice) => choice.isCorrect === true))).toBe(true);
    expect(partOne[0].choices?.find((choice) => choice.isCorrect)?.label).toBe("C");
    expect(partOne[17].choices?.find((choice) => choice.isCorrect)?.label).toBe("C");
    expect(partTwo).toHaveLength(4);
    expect(partTwo.every((question) => question.type === "true-false" && question.statements?.length === 4)).toBe(true);
    expect(partTwo.every((question) => question.statements?.every((statement) => typeof statement.correctValue === "boolean"))).toBe(true);
    expect(partThree).toHaveLength(6);
    expect(partThree.every((question) => question.type === "short-answer" && question.shortAnswer?.acceptedAnswers.length === 1)).toBe(true);
    expect(parsed.groups).toHaveLength(4);
    expect(parsed.groups?.every((group) => group.kind === "biology-data" && group.questionIds.length === 1)).toBe(true);
    expect(parsed.groups?.some((group) => group.stimulus.some((block) => block.kind === "image"))).toBe(true);
    expect(partThree.some((question) => question.stem.some((block) => block.kind === "image"))).toBe(true);
    expect(partOne[0].solution?.length).toBeGreaterThan(0);
    expect(partTwo[0].solution?.length).toBeGreaterThan(0);
    expect(partThree[0].solution?.length).toBeGreaterThan(0);
  });
});
