import { describe, expect, it } from "vitest";
import type { Question } from "../models/quiz";
import { choiceLayout } from "../utils/choiceLayout";

const question = (texts: string[]): Question => ({
  id: "q-layout",
  number: 1,
  type: "single-choice",
  stem: [],
  choices: texts.map((text, index) => ({
    id: `c-${index}`,
    label: String.fromCharCode(65 + index),
    content: [{ id: `p-${index}`, kind: "paragraph", text }],
    isCorrect: index === 0,
  })),
  attachments: [],
  confidence: "high",
  warnings: [],
});

describe("adaptive choice layout", () => {
  it("keeps short language choices compact", () => {
    expect(choiceLayout(question(["in", "with", "at", "to"]))).toBe("compact");
  });

  it("stacks sentence-like choices into one readable column", () => {
    expect(choiceLayout(question([
      "For example, students can switch off unused lights and fans",
      "However, every classroom must remain empty all day",
      "As a result, electricity is a school subject",
      "In contrast, books should never be reused",
    ]))).toBe("stacked");
  });

  it("always stacks History graduation choices, even when the options are short", () => {
    expect(choiceLayout(question(["A", "B", "C", "D"]), "history-thpt-v1")).toBe("stacked");
  });
});
