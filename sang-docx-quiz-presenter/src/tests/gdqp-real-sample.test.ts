// @vitest-environment jsdom

import { readFile } from "node:fs/promises";
import { join } from "node:path";
import mammoth from "mammoth";
import { describe, expect, it } from "vitest";
import { parseGdqpStructuredHtml } from "../features/question-parser/parser";

const sample = join(process.cwd(), "public", "samples", "gdqp-10-cuoi-hki-2025-2026.docx");

describe("GDQP 10 DOCX sample regression audit", () => {
  it("keeps 30 A-D questions, two essay topics and the separate answer table", async () => {
    const converted = await mammoth.convertToHtml({ buffer: await readFile(sample) });
    const parsed = parseGdqpStructuredHtml(converted.value, "gdqp-10-v1");
    const mcq = parsed.questions.filter((question) => question.sectionId === "mcq");
    const essay = parsed.questions.filter((question) => question.sectionId === "essay");

    expect(parsed.warnings).toHaveLength(0);
    expect(parsed.groups).toEqual([]);
    expect(mcq).toHaveLength(30);
    expect(mcq.every((question) => question.type === "single-choice" && question.choices?.length === 4)).toBe(true);
    expect(mcq.every((question) => question.choices?.some((choice) => choice.isCorrect === true))).toBe(true);
    expect(mcq[0].choices?.find((choice) => choice.isCorrect)?.label).toBe("A");
    expect(mcq[29].choices?.find((choice) => choice.isCorrect)?.label).toBe("A");
    expect(essay).toHaveLength(2);
    expect(essay.every((question) => question.type === "essay" && question.stem.length > 0)).toBe(true);
    expect(essay[0].stem[0]).toMatchObject({ kind: "paragraph", text: expect.stringContaining("ma tuý") });
    expect(parsed.sections?.map((section) => [section.id, section.questionIds.length])).toEqual([["mcq", 30], ["essay", 2]]);
  });
});
