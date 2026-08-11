// @vitest-environment jsdom

import { readFile } from "node:fs/promises";
import { join } from "node:path";
import mammoth from "mammoth";
import { describe, expect, it } from "vitest";
import { parsePhysicsStructuredHtml } from "../features/question-parser/parser";

const sample = join(process.cwd(), "public", "samples", "vat-ly-tot-nghiep-2026.docx");

describe("Physics graduation DOCX sample regression audit", () => {
  it("keeps 18 + 4 true/false groups + 6 short answers and shared calculation contexts", async () => {
    const converted = await mammoth.convertToHtml({ buffer: await readFile(sample) });
    const parsed = parsePhysicsStructuredHtml(converted.value, "physics-thpt-v1");
    const partOne = parsed.questions.filter((question) => question.sectionId === "part-i");
    const partTwo = parsed.questions.filter((question) => question.sectionId === "part-ii");
    const partThree = parsed.questions.filter((question) => question.sectionId === "part-iii");

    expect(parsed.warnings).toHaveLength(0);
    expect(partOne).toHaveLength(18);
    expect(partOne.every((question) => question.type === "single-choice" && question.choices?.length === 4)).toBe(true);
    expect(partOne.every((question) => question.choices?.some((choice) => choice.isCorrect === true))).toBe(true);
    expect(partTwo).toHaveLength(4);
    expect(partTwo.every((question) => question.type === "true-false" && question.statements?.length === 4)).toBe(true);
    expect(partTwo.every((question) => question.statements?.every((statement) => typeof statement.correctValue === "boolean"))).toBe(true);
    expect(partThree).toHaveLength(6);
    expect(partThree.every((question) => question.type === "short-answer" && question.shortAnswer?.acceptedAnswers.length === 1)).toBe(true);
    expect(parsed.groups).toHaveLength(7);
    expect(parsed.groups?.filter((group) => group.kind === "physics-data")).toHaveLength(4);
    expect(parsed.groups?.filter((group) => group.kind === "physics-calculation")).toHaveLength(3);
    expect(parsed.groups?.filter((group) => group.kind === "physics-calculation").every((group) => group.questionIds.length === 2)).toBe(true);
    expect(parsed.groups?.some((group) => group.stimulus.some((block) => block.kind === "image"))).toBe(true);
    expect(partOne[0].solution?.[0].content[0]).toMatchObject({ kind: "paragraph" });
    expect(partTwo[0].solution?.[0].content[0]).toMatchObject({ kind: "paragraph" });
    expect(partThree[0].solution?.[0].content[0]).toMatchObject({ kind: "paragraph" });
  });
});
