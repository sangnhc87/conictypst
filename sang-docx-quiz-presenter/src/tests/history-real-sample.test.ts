// @vitest-environment jsdom

import { readFile } from "node:fs/promises";
import { join } from "node:path";
import mammoth from "mammoth";
import { describe, expect, it } from "vitest";
import { parseHistoryStructuredHtml } from "../features/question-parser/parser";

const sample = join(process.cwd(), "public", "samples", "lich-su-tot-nghiep-2026.docx");

describe("History graduation DOCX sample regression audit", () => {
  it("keeps the 24-question plus four source-group structure from su-2026.docx", async () => {
    const converted = await mammoth.convertToHtml({ buffer: await readFile(sample) });
    const parsed = parseHistoryStructuredHtml(converted.value, "history-thpt-v1");
    const partOne = parsed.questions.filter((question) => question.sectionId === "part-i");
    const partTwo = parsed.questions.filter((question) => question.sectionId === "part-ii");

    expect(parsed.warnings).toHaveLength(0);
    expect(partOne).toHaveLength(24);
    expect(partOne.every((question) => question.type === "single-choice" && question.choices?.length === 4)).toBe(true);
    expect(partOne.every((question) => question.choices?.some((choice) => choice.isCorrect === true))).toBe(true);
    expect(partTwo).toHaveLength(4);
    expect(partTwo.every((question) => question.type === "true-false" && question.statements?.length === 4)).toBe(true);
    expect(partTwo.every((question) => question.statements?.every((statement) => typeof statement.correctValue === "boolean"))).toBe(true);
    expect(parsed.groups).toHaveLength(4);
    expect(parsed.groups?.every((group) => group.kind === "historical-source" && group.stimulus.length > 0 && group.questionIds.length === 1)).toBe(true);
    expect(partOne[0].solution?.[0].content[0]).toMatchObject({ kind: "paragraph" });
    expect(partTwo[0].solution?.[0].content[0]).toMatchObject({ kind: "paragraph" });
  });
});
