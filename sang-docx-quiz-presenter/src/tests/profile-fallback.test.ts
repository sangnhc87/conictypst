// @vitest-environment jsdom

import { describe, expect, it } from "vitest";
import { parseProfileStructuredHtml } from "../features/question-parser/parser";

describe("profile-aware local DOCX fallback", () => {
  it("keeps subject sections and moves shared true/false data into a group", () => {
    const html = `
      <p>Câu 1. Chất nào sau đây là axit?</p>
      <p>A. HCl</p><p>B. NaOH</p><p>C. NaCl</p><p>D. H2O</p>
      <p>Câu 2. Cho thí nghiệm sau.</p>
      <p>a) Có khí thoát ra.</p><p>b) Dung dịch đổi màu.</p><p>c) Phản ứng tỏa nhiệt.</p><p>d) Không có hiện tượng.</p>
    `;
    const parsed = parseProfileStructuredHtml(html, "chemistry-thpt-v1");

    expect(parsed.questions).toHaveLength(2);
    expect(parsed.questions[0].sectionId).toBe(parsed.sections?.find((section) => section.title === "Lý thuyết hóa học")?.id);
    expect(parsed.questions[1].sectionId).toBe(parsed.sections?.find((section) => section.title === "Thí nghiệm và phổ")?.id);
    expect(parsed.questions[1].stem).toHaveLength(0);
    expect(parsed.questions[1].groupId).toBeTruthy();
    expect(parsed.groups?.some((group) => group.questionIds.includes(parsed.questions[1].id) && group.stimulus.length > 0)).toBe(true);
  });
});
