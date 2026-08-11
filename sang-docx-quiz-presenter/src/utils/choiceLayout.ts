import type { ContentBlock, Question } from "../models/quiz";
import { getSubjectProfile } from "../config/subjectProfiles";

const plainText = (value: string) => value
  .replace(/<[^>]*>/g, " ")
  .replace(/&nbsp;/g, " ")
  .replace(/\s+/g, " ")
  .trim();

export const contentText = (blocks: ContentBlock[] = []) => blocks.map((block) => {
  if (block.kind === "paragraph") return plainText(block.text);
  if (block.kind === "math") return block.latex;
  if (block.kind === "image") return block.alt || block.caption || "[hình ảnh]";
  if (block.kind === "table") return block.rows.flat().join(" ");
  return block.items.join(" ");
}).join(" ").trim();

/** Short choices use a compact grid; sentence-like choices use one column. */
export const choiceLayout = (question: Question, profileId?: string): "compact" | "stacked" => {
  if (question.type !== "single-choice" || !question.choices?.length || question.choices.length < 3) {
    return "stacked";
  }

  if (profileId && getSubjectProfile(profileId).choiceLayout === "stacked") return "stacked";

  const lengths = question.choices.map((choice) => contentText(choice.content).length);
  const longest = Math.max(...lengths);
  const average = lengths.reduce((sum, length) => sum + length, 0) / lengths.length;
  const hasForcedBreak = question.choices.some((choice) => contentText(choice.content).includes("\n"));

  return longest > 48 || average > 31 || hasForcedBreak ? "stacked" : "compact";
};
