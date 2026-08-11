export const QUESTION_PATTERNS = {
  question: /^(?:Câu|Bài|Question|Item)\s*0*(\d+)\s*[.:)]\s*(.*)$/iu,
  choice: /^([A-Da-d])\s*[.:)]\s+(.+)$/u,
  statement: /^([a-z])\s*[.)]\s+(.+)$/u,
  answer: /^(?:Đáp án|Đáp số|Answer|Key)\s*:\s*(.*)$/iu,
  solution: /^(?:Lời giải|Giải|Hướng dẫn giải|Hướng dẫn|Explanation|Solution)\s*:\s*(.*)$/iu,
} as const;
export const TYPE_LABELS = { 'single-choice': 'Một đáp án', 'true-false': 'Đúng – sai', 'short-answer': 'Trả lời ngắn', essay: 'Tự luận' } as const;
