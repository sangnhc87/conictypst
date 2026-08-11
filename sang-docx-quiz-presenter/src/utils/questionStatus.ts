import type { Question } from "../models/quiz";

export type AnswerStatus = "ready" | "missing";

/** A source answer key is known only when it contains a positive, usable answer. */
export const questionAnswerStatus = (question: Question): AnswerStatus => {
  if (question.type === "single-choice") {
    return question.choices?.some((choice) => choice.isCorrect === true) ? "ready" : "missing";
  }
  if (question.type === "true-false") {
    const statements = question.statements || [];
    return statements.length > 0 && statements.every((statement) => typeof statement.correctValue === "boolean") ? "ready" : "missing";
  }
  if (question.type === "short-answer") {
    return question.shortAnswer?.acceptedAnswers.some(Boolean) ? "ready" : "missing";
  }
  return question.solution?.some((step) => step.content.some((block) => block.kind === "paragraph" && block.text.trim())) ? "ready" : "missing";
};
