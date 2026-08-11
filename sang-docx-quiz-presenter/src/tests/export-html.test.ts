import { describe, expect, it } from "vitest";
import { demoQuiz } from "../demo/demoData";
import { htmlFor } from "../features/export/exporters";

describe("premium offline HTML export", () => {
  it("contains all questions, keyboard teaching controls and offline MathML", async () => {
    const html = await htmlFor(demoQuiz, "GV-TEST-KEY-2026");
    expect((html.match(/<section class="slide"/g) || [])).toHaveLength(demoQuiz.questions.length);
    expect(html).toContain("K</kbd> ám hiệu");
    expect(html).toContain("A</kbd> đáp án");
    expect(html).toContain("S</kbd> lời giải");
    expect(html).toContain("requestFullscreen");
    expect(html).toContain("<math");
    expect(html).not.toContain("https://cdn");
  });

  it("escapes document text before embedding it", async () => {
    const quiz = structuredClone(demoQuiz);
    quiz.title = '<script>alert("x")</script>';
    const html = await htmlFor(quiz, "GV-TEST-KEY-2026");
    expect(html).not.toContain('<script>alert("x")</script>');
    expect(html).toContain("&lt;script&gt;");
  });
});
