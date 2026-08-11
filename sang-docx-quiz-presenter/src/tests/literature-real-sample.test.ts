// @vitest-environment jsdom

import { readFile } from "node:fs/promises";
import { join } from "node:path";
import mammoth from "mammoth";
import { describe, expect, it } from "vitest";
import { parseLiteratureStructuredHtml } from "../features/question-parser/parser";

const sample = join(process.cwd(), "public", "samples", "nguvan-totnghiep-2026.docx");

describe("Literature graduation DOCX sample regression audit", () => {
  it("keeps the official 5-reading-question, 200-word and 600-word structure", async () => {
    const converted = await mammoth.convertToHtml({ buffer: await readFile(sample) });
    const parsed = parseLiteratureStructuredHtml(converted.value, "literature-thpt-v1");
    const reading = parsed.questions.filter((question) => question.sectionId === "reading");
    const social = parsed.questions.filter((question) => question.sectionId === "social");
    const literary = parsed.questions.filter((question) => question.sectionId === "literary");
    const readingGroup = parsed.groups?.find((group) => group.kind === "literature-reading");
    const poemGroup = parsed.groups?.find((group) => group.kind === "literature-poem");

    expect(parsed.warnings).toHaveLength(0);
    expect(reading).toHaveLength(5);
    expect(reading.every((question) => question.type === "short-answer" && question.shortAnswer?.acceptedAnswers.length === 0)).toBe(true);
    expect(reading.every((question) => question.solution && question.solution.length > 0)).toBe(true);
    expect(readingGroup?.questionIds).toHaveLength(5);
    expect(readingGroup?.stimulus.some((block) => block.kind === "paragraph" && block.text.includes("Gutenberg"))).toBe(true);
    expect(social).toHaveLength(1);
    expect(social[0].type).toBe("essay");
    expect(social[0].stem.some((block) => block.kind === "paragraph" && block.text.includes("200 chữ"))).toBe(true);
    expect(social[0].solution?.some((step) => step.content.some((block) => block.kind === "paragraph" && block.text.includes("HƯỚNG DẪN CHẤM")))).toBe(true);
    expect(literary).toHaveLength(1);
    expect(literary[0].type).toBe("essay");
    expect(literary[0].stem.some((block) => block.kind === "paragraph" && block.text.includes("600 chữ"))).toBe(true);
    expect(poemGroup?.stimulus.some((block) => block.kind === "paragraph" && block.text.includes("NHỮNG CHIẾC LÁ"))).toBe(true);
    expect(poemGroup?.stimulus.some((block) => block.kind === "paragraph" && block.text.includes("Chiều lạnh cóng"))).toBe(true);
    expect(literary[0].groupId).toBe(poemGroup?.id);
  });
});
