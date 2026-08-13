import type { ParsedDocument } from "../question-parser/parser";
import type { ContentBlock, Question, QuestionGroup, QuizSection, QuestionType } from "../../models/quiz";
import { uid } from "../../models/quiz";
import type { StructuralDocxBlock } from "./docxInspector";

/**
 * Parser theo template chuẩn: khi DOCX dùng đúng bộ style Quiz* (xem
 * public/templates/mau-de-chuan-quiz.docx), vai trò của từng đoạn được suy ra
 * từ style thay vì đoán bằng regex → kết quả deterministic, không phụ thuộc
 * người soạn đánh "Câu 1." hay đặt "A." thế nào.
 */
export const QUIZ_TEMPLATE_STYLES = {
  question: "QuizQuestion",
  choice: "QuizChoice",
  statement: "QuizStatement",
  answer: "QuizAnswer",
  solution: "QuizSolution",
  section: "QuizSection",
  stimulus: "QuizStimulus",
} as const;

const TEMPLATE_STYLE_SET = new Set<string>(Object.values(QUIZ_TEMPLATE_STYLES));

/** Chỉ coi là template khi có ít nhất 3 đoạn theo style và có style câu hỏi. */
export const hasTemplateStyles = (blocks: StructuralDocxBlock[]): boolean => {
  const styled = blocks.filter((block) => block.styleId && TEMPLATE_STYLE_SET.has(block.styleId));
  return styled.length >= 3 && styled.some((block) => block.styleId === QUIZ_TEMPLATE_STYLES.question);
};

const paragraph = (text: string): ContentBlock => ({ id: uid("p"), kind: "paragraph", text });

const CHOICE_PREFIX = /^([A-Da-d])\s*[.:)]\s*/u;
const STATEMENT_PREFIX = /^([a-z])\s*[.)]\s*/u;
const NUMBER_PREFIX = /^(?:(?:Câu|Bài|Question)\s*)?0*(\d+)\s*[.:)]\s*/iu;

const stripPrefix = (text: string, pattern: RegExp) => text.replace(pattern, "").trim();

const finalizeType = (question: Question): QuestionType => {
  if ((question.statements?.length || 0) > 0) return "true-false";
  if ((question.choices?.length || 0) > 0) return "single-choice";
  if (question.shortAnswer?.acceptedAnswers.length) return "short-answer";
  return "essay";
};

/**
 * Dựng ParsedDocument từ các block đã gán style. Quy ước:
 * - QuizSection: mở phần thi mới (tiêu đề = nội dung đoạn).
 * - QuizStimulus: mở dữ kiện chùm; các câu sau thuộc chùm tới khi gặp
 *   QuizStimulus/QuizSection khác.
 * - QuizQuestion: mở câu mới; số câu lấy từ prefix "Câu N." nếu có, không thì
 *   đếm tuần tự.
 * - QuizChoice/QuizStatement: phương án/phát biểu của câu hiện tại; nhãn tự
 *   sinh A-D/a-d nếu đoạn không tự mang nhãn.
 * - QuizAnswer: "B" (TN), "Đ S Đ S" (Đ/S), giá trị tự do (TLN).
 * - QuizSolution: một bước lời giải của câu hiện tại.
 */
export function parseTemplateBlocks(blocks: StructuralDocxBlock[]): ParsedDocument {
  const questions: Question[] = [];
  const sections: QuizSection[] = [];
  const groups: QuestionGroup[] = [];
  const warnings: ParsedDocument["warnings"] = [];

  let currentQuestion: Question | undefined;
  let currentSection: QuizSection | undefined;
  let currentGroup: QuestionGroup | undefined;
  let autoNumber = 0;

  const ensureQuestion = (style: string, blockText: string): Question | undefined => {
    if (currentQuestion) return currentQuestion;
    warnings.push({ id: uid("w"), type: "parser", message: `Đoạn style ${style} ("${blockText.slice(0, 60)}…") không nằm sau một câu hỏi nào — đã bỏ qua.` });
    return undefined;
  };

  for (const block of blocks) {
    const style = block.styleId;
    if (!style || !TEMPLATE_STYLE_SET.has(style)) continue;
    const text = block.text;

    if (style === QUIZ_TEMPLATE_STYLES.section) {
      currentSection = { id: uid("section"), title: text, questionIds: [] };
      sections.push(currentSection);
      currentGroup = undefined;
      continue;
    }
    if (style === QUIZ_TEMPLATE_STYLES.stimulus) {
      currentGroup = { id: uid("group"), title: "Dữ kiện chung", stimulus: [paragraph(text)], questionIds: [], kind: "template-stimulus" };
      groups.push(currentGroup);
      continue;
    }
    if (style === QUIZ_TEMPLATE_STYLES.question) {
      autoNumber += 1;
      const prefixed = text.match(NUMBER_PREFIX);
      const number = prefixed ? Number(prefixed[1]) : autoNumber;
      if (prefixed) autoNumber = number;
      currentQuestion = {
        id: uid("q"),
        number,
        type: "essay", // sẽ được suy lại ở finalizeType
        stem: [paragraph(prefixed ? stripPrefix(text, NUMBER_PREFIX) : text)],
        attachments: [],
        confidence: "high",
        warnings: [],
      };
      if (currentSection) {
        currentQuestion.sectionId = currentSection.id;
        currentSection.questionIds.push(currentQuestion.id);
      }
      if (currentGroup) {
        currentQuestion.groupId = currentGroup.id;
        currentGroup.questionIds.push(currentQuestion.id);
      }
      questions.push(currentQuestion);
      continue;
    }
    if (style === QUIZ_TEMPLATE_STYLES.choice) {
      const question = ensureQuestion(style, text);
      if (!question) continue;
      const labeled = text.match(CHOICE_PREFIX);
      const index = question.choices?.length || 0;
      question.choices = question.choices || [];
      question.choices.push({
        id: uid("c"),
        label: labeled ? labeled[1].toUpperCase() : String.fromCharCode(65 + index),
        content: [paragraph(labeled ? stripPrefix(text, CHOICE_PREFIX) : text)],
        isCorrect: null,
      });
      continue;
    }
    if (style === QUIZ_TEMPLATE_STYLES.statement) {
      const question = ensureQuestion(style, text);
      if (!question) continue;
      const labeled = text.match(STATEMENT_PREFIX);
      const index = question.statements?.length || 0;
      question.statements = question.statements || [];
      question.statements.push({
        id: uid("tf"),
        label: labeled ? labeled[1].toLowerCase() : String.fromCharCode(97 + index),
        content: [paragraph(labeled ? stripPrefix(text, STATEMENT_PREFIX) : text)],
      });
      continue;
    }
    if (style === QUIZ_TEMPLATE_STYLES.answer) {
      const question = ensureQuestion(style, text);
      if (!question) continue;
      const value = text.replace(/^(?:Đáp\s*án|Answer|Key)\s*[:.]\s*/iu, "").trim();
      const tokens = value.split(/[\s,;|]+/u).filter(Boolean);
      if (tokens.length > 1 && tokens.every((token) => /^(Đ|đ|S|s)$/.test(token))) {
        // Đúng/sai nhiều ý.
        question.statements = question.statements || [];
        tokens.forEach((token, index) => {
          if (question.statements![index]) question.statements![index].correctValue = token.toUpperCase() === "Đ";
        });
        if (tokens.length !== question.statements.length) {
          question.warnings.push(`Đáp án "${value}" không khớp ${question.statements.length} phát biểu đúng/sai.`);
        }
      } else if (/^[A-Da-d](\s*[,;]\s*[A-Da-d])*$/u.test(value) && (question.choices?.length || 0) > 0) {
        const correctLabels = new Set(value.split(/[\s,;]+/u).map((label) => label.toUpperCase()));
        question.choices!.forEach((choice) => { choice.isCorrect = correctLabels.has(choice.label.toUpperCase()); });
      } else {
        question.shortAnswer = { acceptedAnswers: [value], caseSensitive: false };
      }
      continue;
    }
    if (style === QUIZ_TEMPLATE_STYLES.solution) {
      const question = ensureQuestion(style, text);
      if (!question) continue;
      question.solution = question.solution || [];
      question.solution.push({ id: uid("step"), content: [paragraph(text.replace(/^(?:Lời giải|Giải|Hướng dẫn giải|Hướng dẫn)\s*[:.]\s*/iu, ""))] });
      continue;
    }
  }

  for (const question of questions) {
    question.type = finalizeType(question);
    if (question.type === "single-choice" && (question.choices?.length || 0) < 2) {
      question.warnings.push("Câu trắc nghiệm chưa đủ phương án.");
      question.confidence = "medium";
    }
  }
  const nonEmptyGroups = groups.filter((group) => group.questionIds.length > 0);
  for (const group of groups) {
    if (!group.questionIds.length) warnings.push({ id: uid("w"), type: "parser", message: `Dữ kiện chùm "${group.stimulus[0]?.kind === "paragraph" ? (group.stimulus[0] as { text: string }).text.slice(0, 50) : ""}…" không có câu nào đi kèm — đã bỏ.` });
  }
  return { questions, warnings, sections: sections.length ? sections : undefined, groups: nonEmptyGroups.length ? nonEmptyGroups : undefined };
}
