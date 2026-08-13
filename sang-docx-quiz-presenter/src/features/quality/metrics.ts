import katex from "katex";
import type { ContentBlock, Question } from "../../models/quiz";

export interface QualityIssue {
  severity: "error" | "warning";
  questionNumber?: number;
  message: string;
}

export interface QualityReport {
  file: string;
  profileId: string;
  questionCount: number;
  expectedQuestionCount?: number;
  /** 1 khi số câu khớp kỳ vọng (hoặc không đặt kỳ vọng mà parser không cảnh báo). */
  questionCountAccuracy: number;
  numberingContiguous: boolean;
  /** Tỉ lệ câu trắc nghiệm có đủ 4 phương án. */
  choiceCompleteness: number;
  /** Tỉ lệ câu có đáp án xác định (đúng loại câu). */
  answerCoverage: number;
  /** Tỉ lệ công thức LaTeX compile được bằng KaTeX. */
  latexCompileRate: number;
  /** Tỉ lệ câu có lời giải. */
  solutionCoverage: number;
  parserWarnings: number;
  typeDistribution: Record<string, number>;
  /** Điểm tổng hợp 0..100, mục tiêu vận hành là >= 99. */
  score: number;
  issues: QualityIssue[];
}

export interface QualityExpectation {
  questionCount?: number;
  /** Đáp án đúng theo số câu, ví dụ { 1: "A", 5: "Đ S Đ S", 9: "12,5" }. */
  answers?: Record<number, string>;
  /** Ngưỡng điểm tối thiểu cho fixture này (mặc định 99). Dùng khi bản thân đề nguồn thiếu dữ kiện (ví dụ không kèm đáp án). */
  minScore?: number;
}

const latexFromParagraph = (text: string): string[] => {
  const found: string[] = [];
  for (const match of text.matchAll(/\$\$([^$]+)\$\$|\$([^$]+)\$/g)) found.push(match[1] ?? match[2] ?? "");
  return found;
};

const collectLatex = (blocks: ContentBlock[] = []): string[] =>
  blocks.flatMap((block) => {
    if (block.kind === "math") return [block.latex];
    if (block.kind === "paragraph") return latexFromParagraph(block.text);
    if (block.kind === "list") return block.items.flatMap(latexFromParagraph);
    if (block.kind === "table") return block.rows.flatMap((row) => row.flatMap(latexFromParagraph));
    return [];
  });

const compilesWithKatex = (latex: string): boolean => {
  try {
    katex.renderToString(latex, { throwOnError: true, strict: false });
    return true;
  } catch {
    return false;
  }
};

const answerOf = (question: Question): string | undefined => {
  if (question.type === "single-choice") {
    const correct = (question.choices || []).filter((choice) => choice.isCorrect === true);
    return correct.length === 1 ? correct[0].label : undefined;
  }
  if (question.type === "true-false") {
    const statements = question.statements || [];
    if (!statements.length || statements.some((statement) => typeof statement.correctValue !== "boolean")) return undefined;
    return statements.map((statement) => (statement.correctValue ? "Đ" : "S")).join(" ");
  }
  if (question.type === "short-answer") {
    const answers = question.shortAnswer?.acceptedAnswers || [];
    return answers.length ? answers[0] : undefined;
  }
  // Tự luận không có "đáp án" kiểu trắc nghiệm; coi như đã phủ để không trừ điểm oan.
  return "(tự luận)";
};

const normalizeAnswer = (value: string) =>
  value.normalize("NFC").replace(/[.,;:\s]+/gu, " ").trim().toLowerCase();

/**
 * Chấm điểm chất lượng một đề đã parse. Đây là thước đo chung cho mọi đường
 * nhập (DOCX local, OCR + AI, fallback) để chứng minh mục tiêu 99% bằng số
 * liệu thay vì cảm giác.
 */
export function assessQuizQuality(
  quiz: { questions: Question[]; warnings?: { message: string }[] },
  options: { file: string; profileId: string; expected?: QualityExpectation },
): QualityReport {
  const { questions } = quiz;
  const issues: QualityIssue[] = [];
  const parserWarnings = quiz.warnings?.length ?? 0;

  // 1. Số câu
  let questionCountAccuracy = 1;
  if (options.expected?.questionCount !== undefined) {
    if (questions.length !== options.expected.questionCount) {
      questionCountAccuracy = 0;
      issues.push({ severity: "error", message: `Số câu ${questions.length} ≠ kỳ vọng ${options.expected.questionCount}.` });
    }
  } else if (!questions.length) {
    questionCountAccuracy = 0;
    issues.push({ severity: "error", message: "Không tách được câu hỏi nào." });
  }

  // 2. Số thứ tự: không trùng và liên tục. Đề có nhiều phần thi thường đánh
  // lại từ 1 ở mỗi phần (PHẦN II câu 1-4, PHẦN III câu 1-6), nên kiểm tra
  // trong phạm vi từng section khi quiz có chia phần.
  const numberingOkFor = (items: Question[]) => {
    const numbers = items.map((question) => question.number).sort((a, b) => a - b);
    if (!numbers.length) return true;
    if (new Set(numbers).size !== numbers.length) return false;
    return numbers[numbers.length - 1] - numbers[0] === numbers.length - 1;
  };
  const sections = (quiz as { sections?: { id: string; questionIds: string[] }[] }).sections;
  const numberingContiguous = sections?.length
    ? sections.every((section) => numberingOkFor(questions.filter((question) => section.questionIds.includes(question.id))))
    : numberingOkFor(questions);
  if (!numberingContiguous && questions.length) {
    const numbers = questions.map((question) => question.number).sort((a, b) => a - b);
    issues.push({ severity: "error", message: `Số thứ tự câu không liên tục hoặc bị trùng: ${numbers.join(", ")}.` });
  }

  // 3. Đủ phương án
  const mcqs = questions.filter((question) => question.type === "single-choice");
  const mcqComplete = mcqs.filter((question) => (question.choices?.length || 0) === 4 && (question.choices || []).every((choice) => choice.content.length > 0));
  for (const question of mcqs) {
    if ((question.choices?.length || 0) !== 4) {
      issues.push({ severity: "error", questionNumber: question.number, message: `Câu ${question.number}: trắc nghiệm có ${question.choices?.length || 0}/4 phương án.` });
    }
  }
  const choiceCompleteness = mcqs.length ? mcqComplete.length / mcqs.length : 1;

  // 4. Phủ đáp án
  const answered = questions.filter((question) => answerOf(question) !== undefined);
  for (const question of questions) {
    if (question.type !== "essay" && answerOf(question) === undefined) {
      issues.push({ severity: "warning", questionNumber: question.number, message: `Câu ${question.number}: chưa xác định được đáp án.` });
    }
  }
  const answerCoverage = questions.length ? answered.length / questions.length : 0;

  // 5. Đối chiếu đáp án kỳ vọng
  let answerMismatches = 0;
  if (options.expected?.answers) {
    for (const [numberText, expectedAnswer] of Object.entries(options.expected.answers)) {
      const question = questions.find((item) => item.number === Number(numberText));
      const actual = question ? answerOf(question) : undefined;
      if (actual === undefined || normalizeAnswer(actual) !== normalizeAnswer(expectedAnswer)) {
        answerMismatches += 1;
        issues.push({ severity: "error", questionNumber: Number(numberText), message: `Câu ${numberText}: đáp án "${actual ?? "∅"}" ≠ kỳ vọng "${expectedAnswer}".` });
      }
    }
  }

  // 6. LaTeX compile
  const allLatex = questions.flatMap((question) => [
    ...collectLatex(question.stem),
    ...collectLatex((question.choices || []).flatMap((choice) => choice.content)),
    ...collectLatex((question.statements || []).flatMap((statement) => statement.content)),
    ...collectLatex((question.solution || []).flatMap((step) => step.content)),
  ]);
  const compiled = allLatex.filter((latex) => compilesWithKatex(latex));
  const latexCompileRate = allLatex.length ? compiled.length / allLatex.length : 1;

  // 7. Phủ lời giải
  const withSolution = questions.filter((question) => (question.solution?.length || 0) > 0);
  const solutionCoverage = questions.length ? withSolution.length / questions.length : 0;

  const typeDistribution = questions.reduce<Record<string, number>>((counts, question) => {
    counts[question.type] = (counts[question.type] || 0) + 1;
    return counts;
  }, {});

  // Điểm tổng hợp có trọng số — mỗi hạng mục phản ánh một kiểu "rối" thực tế.
  const answerAccuracy = options.expected?.answers
    ? 1 - answerMismatches / Object.keys(options.expected.answers).length
    : answerCoverage;
  const score = Math.round(
    100 *
      (0.25 * questionCountAccuracy +
        0.1 * (numberingContiguous ? 1 : 0) +
        0.15 * choiceCompleteness +
        0.25 * answerAccuracy +
        0.15 * latexCompileRate +
        0.1 * (parserWarnings === 0 ? 1 : Math.max(0, 1 - parserWarnings / 5))),
  );

  return {
    file: options.file,
    profileId: options.profileId,
    questionCount: questions.length,
    expectedQuestionCount: options.expected?.questionCount,
    questionCountAccuracy,
    numberingContiguous,
    choiceCompleteness: Number(choiceCompleteness.toFixed(3)),
    answerCoverage: Number(answerCoverage.toFixed(3)),
    latexCompileRate: Number(latexCompileRate.toFixed(3)),
    solutionCoverage: Number(solutionCoverage.toFixed(3)),
    parserWarnings,
    typeDistribution,
    score,
    issues,
  };
}

export const formatQualityReport = (report: QualityReport): string =>
  [
    `• ${report.file} [${report.profileId}] → ${report.score}/100`,
    `  câu: ${report.questionCount}${report.expectedQuestionCount !== undefined ? `/${report.expectedQuestionCount}` : ""} · số liên tục: ${report.numberingContiguous ? "✓" : "✗"} · đủ 4 phương án: ${(report.choiceCompleteness * 100).toFixed(1)}% · có đáp án: ${(report.answerCoverage * 100).toFixed(1)}% · LaTeX compile: ${(report.latexCompileRate * 100).toFixed(1)}% · có lời giải: ${(report.solutionCoverage * 100).toFixed(1)}% · cảnh báo parser: ${report.parserWarnings}`,
    ...report.issues.slice(0, 8).map((issue) => `  ${issue.severity === "error" ? "✗" : "⚠"} ${issue.message}`),
    ...(report.issues.length > 8 ? [`  … và ${report.issues.length - 8} vấn đề khác`] : []),
  ].join("\n");
