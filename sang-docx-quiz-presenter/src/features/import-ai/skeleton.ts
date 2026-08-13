/**
 * Skeleton-first pre-parse: trước khi giao markdown cho AI, quét deterministic
 * các "mỏ neo" của đề (marker câu hỏi, tiêu đề phần thi, bảng đáp án). Skeleton
 * là ground-truth ràng buộc mọi bước sau: cắt chunk không bao giờ xẻ đôi câu,
 * prompt bắt AI trả đúng số câu, bảng đáp án được gán lại sau cùng thay vì để
 * AI tự suy.
 */

export interface QuestionMarker {
  number: number;
  /** Offset ký tự bắt đầu dòng marker trong markdown gốc. */
  offset: number;
}

export interface SectionMarker {
  title: string;
  offset: number;
}

export interface AnswerKeyEntry {
  number: number;
  /** "A" | "B" | ... | "Đ S Đ S" | "12,5" (chuỗi thô đã trim). */
  raw: string;
}

export interface ExamSkeleton {
  markers: QuestionMarker[];
  sections: SectionMarker[];
  /** Bảng đáp án cuối đề (nếu phát hiện), kèm offset để loại khỏi phần thân. */
  answerKey: AnswerKeyEntry[] | null;
  answerKeyOffset?: number;
}

const QUESTION_MARKER = /(?:^|\n)[ \t]*(?:#{1,6}[ \t]*)?(?:\*\*|__)?[ \t]*(?:Câu|Bài|Question|Item)[ \t]*(?:\*\*)?[ \t]*0*(\d+)[ \t]*(?:\*\*)?[ \t]*[.:)]/giu;
const SECTION_HEADING = /(?:^|\n)[ \t]*(?:#{1,6}[ \t]*)?(?:\*\*)?[ \t]*(PHẦN\s+[IVX0-9]+[^\n*]{0,120}|Phần\s+[ivx0-9]+[^\n*]{0,120}|PART\s+[A-Z0-9][^\n*]{0,120})/gu;
const ANSWER_KEY_HEADING = /^[ \t]*(?:#{1,6}[ \t]*)?(?:\*\*)?[ \t]*(?:BẢNG\s+)?ĐÁP\s+ÁN(?:\s+THAM\s+KHẢO|\s+VÀ\s+HƯỚNG\s+DẪN|\s*CHI\s+TIẾT)?[ \t]*(?:\*\*)?[ \t]*[:.]?[ \t]*$/imu;
const ANSWER_KEY_HEADING_EN = /^[ \t]*(?:#{1,6}[ \t]*)?(?:\*\*)?[ \t]*ANSWER\s+KEY[ \t]*(?:\*\*)?[ \t]*[:.]?[ \t]*$/imu;

const CHOICE_ANSWER = /^[A-DĐ]$/iu;

export function findQuestionMarkers(markdown: string): QuestionMarker[] {
  const markers: QuestionMarker[] = [];
  for (const match of markdown.matchAll(QUESTION_MARKER)) {
    markers.push({ number: Number(match[1]), offset: match.index ?? 0 });
  }
  return markers;
}

export function findSectionMarkers(markdown: string): SectionMarker[] {
  const sections: SectionMarker[] = [];
  for (const match of markdown.matchAll(SECTION_HEADING)) {
    const title = (match[1] || "").replace(/\s+/g, " ").trim();
    if (title) sections.push({ title, offset: (match.index ?? 0) + 1 });
  }
  return sections;
}

/**
 * Bóc bảng đáp án ở cuối đề. Hỗ trợ 3 dạng phổ biến:
 * 1. Bảng markdown: | Câu | 1 | 2 | ... | / | Đáp án | A | B | ... |
 * 2. Lưới inline: "1. A   2. B   3. C" (nhiều dòng, có thể "1A 2B").
 * 3. Từng dòng: "Câu 1: A" / "1: A".
 */
export function extractAnswerKey(markdown: string): { entries: AnswerKeyEntry[]; offset: number } | null {
  const lines = markdown.split("\n");
  let offset = 0;
  let headingIndex = -1;
  let headingOffset = 0;
  for (let index = 0; index < lines.length; index += 1) {
    const line = lines[index];
    if (ANSWER_KEY_HEADING.test(line) || ANSWER_KEY_HEADING_EN.test(line)) {
      headingIndex = index;
      headingOffset = offset;
      break;
    }
    offset += line.length + 1;
  }
  if (headingIndex < 0) return null;

  const entries: AnswerKeyEntry[] = [];
  const tail = lines.slice(headingIndex + 1);

  // Dạng 1: bảng markdown có hàng số câu và hàng đáp án.
  const tableRows = tail.filter((line) => /^\s*\|.*\|\s*$/u.test(line)).map((line) => line.trim());
  if (tableRows.length >= 2) {
    const splitRow = (row: string) => row.replace(/^\|/, "").replace(/\|$/, "").split("|").map((cell) => cell.trim());
    for (let rowIndex = 0; rowIndex < tableRows.length - 1; rowIndex += 1) {
      const numbersRow = splitRow(tableRows[rowIndex]);
      if (!/^(câu|question)?$/iu.test(numbersRow[0] || "") && !/^câu$/iu.test(numbersRow[0] || "")) continue;
      // Tìm hàng đáp án ngay sau (bỏ qua hàng gạch ---).
      for (let next = rowIndex + 1; next < Math.min(rowIndex + 3, tableRows.length); next += 1) {
        const answerRow = splitRow(tableRows[next]);
        if (!/^(đáp\s*án|answer|key)/iu.test(answerRow[0] || "")) continue;
        const questionNumbers = numbersRow.slice(1).map((cell) => Number(cell)).filter((value) => Number.isFinite(value) && value > 0);
        const answerCells = answerRow.slice(1);
        questionNumbers.forEach((number, cellIndex) => {
          const raw = (answerCells[cellIndex] || "").replace(/\*\*/g, "").trim();
          if (raw) entries.push({ number, raw });
        });
      }
    }
    if (entries.length) return { entries, offset: headingOffset };
  }

  // Dạng 2 + 3: quét tối đa 12 dòng sau heading.
  const inlineZone = tail.slice(0, 12).join("  ");
  const seen = new Set<number>();
  for (const match of inlineZone.matchAll(/(?:^|\s|,|;)(?:Câu\s+)?0*(\d{1,3})\s*[.:)]?\s*([A-DĐ])\b/giu)) {
    const number = Number(match[1]);
    if (seen.has(number) || number < 1 || number > 200) continue;
    seen.add(number);
    entries.push({ number, raw: match[2].toUpperCase().replace("Đ", "Đ") });
  }
  // Dạng đúng/sai hoặc trả lời ngắn từng dòng: "Câu 5: Đ S Đ S" / "Câu 9: 12,5".
  for (const line of tail.slice(0, 40)) {
    const match = line.match(/^\s*(?:Câu\s+)?0*(\d{1,3})\s*[:.)]\s*((?:[ĐS]\s+){1,3}[ĐS]|[-−\d][\d.,/ ]{0,15})\s*$/iu);
    if (match && !seen.has(Number(match[1]))) {
      seen.add(Number(match[1]));
      entries.push({ number: Number(match[1]), raw: match[2].replace(/\s+/g, " ").trim() });
    }
  }
  return entries.length ? { entries: entries.sort((a, b) => a.number - b.number), offset: headingOffset } : null;
}

export function buildSkeleton(markdown: string): ExamSkeleton {
  const answerKeyResult = extractAnswerKey(markdown);
  return {
    markers: findQuestionMarkers(markdown),
    sections: findSectionMarkers(markdown),
    answerKey: answerKeyResult?.entries ?? null,
    answerKeyOffset: answerKeyResult?.offset,
  };
}

/** Tóm tắt skeleton thành văn bản đưa vào prompt AI. */
export function describeSkeleton(skeleton: ExamSkeleton, chunkQuestionNumbers: number[]): string {
  const lines: string[] = [];
  if (skeleton.markers.length) {
    const numbers = skeleton.markers.map((marker) => marker.number);
    lines.push(`Toàn đề có ${skeleton.markers.length} marker câu (từ Câu ${Math.min(...numbers)} đến Câu ${Math.max(...numbers)}).`);
  }
  if (skeleton.sections.length) {
    lines.push(`Các phần thi: ${skeleton.sections.map((section) => section.title).join(" · ")}`);
  }
  if (chunkQuestionNumbers.length) {
    lines.push(`CHUNK NÀY CHỨA ĐÚNG ${chunkQuestionNumbers.length} CÂU: ${chunkQuestionNumbers.map((number) => `Câu ${number}`).join(", ")}. Phải trả về đúng ${chunkQuestionNumbers.length} câu với number tương ứng, không thêm không bớt.`);
  }
  if (skeleton.answerKey?.length) {
    lines.push(`Bảng đáp án chính thức của đề (đã trích xuất sẵn): ${skeleton.answerKey.map((entry) => `${entry.number}.${entry.raw}`).join(" ")}. Hãy dùng bảng này để gán isCorrect/correctValue/answers; không tự suy đáp án khi bảng đã có.`);
  }
  return lines.join("\n");
}

export interface SkeletonChunk {
  text: string;
  questionNumbers: number[];
  /** Tiêu đề phần thi bao phủ chunk (nếu xác định được). */
  sectionTitle?: string;
}

/**
 * Cắt markdown theo skeleton: ranh giới cắt chỉ nằm ở marker câu hỏi nên một
 * câu không bao giờ bị xẻ đôi giữa hai chunk. Câu đơn lẻ vượt maxChars được
 * tách mềm theo dòng. Phần mở đầu (trước Câu 1) được ghép vào chunk đầu; bảng
 * đáp án cuối đề được tách khỏi chunk cuối vì đã đưa vào context riêng.
 */
export function chunkMarkdownBySkeleton(markdown: string, skeleton: ExamSkeleton, maxChars: number): SkeletonChunk[] {
  if (!skeleton.markers.length) return [{ text: markdown, questionNumbers: [] }];

  const bodyEnd = skeleton.answerKeyOffset ?? markdown.length;
  const markers = skeleton.markers.filter((marker) => marker.offset < bodyEnd);
  if (!markers.length) return [{ text: markdown, questionNumbers: [] }];

  const sectionAt = (offset: number) =>
    skeleton.sections.filter((section) => section.offset <= offset).at(-1)?.title;

  // Mỗi câu = một lát cắt [marker.offset, marker kế tiếp).
  const slices: { number: number; text: string }[] = markers.map((marker, index) => {
    const end = index + 1 < markers.length ? markers[index + 1].offset : bodyEnd;
    return { number: marker.number, text: markdown.slice(marker.offset, end).trim() };
  });
  const preamble = markdown.slice(0, markers[0].offset).trim();

  const chunks: SkeletonChunk[] = [];
  let current: { numbers: number[]; text: string } = { numbers: [], text: preamble };
  const flush = () => {
    if (!current.text.trim()) { current = { numbers: [], text: "" }; return; }
    const firstOffset = markdown.indexOf(current.text);
    chunks.push({ text: current.text.trim(), questionNumbers: [...current.numbers], sectionTitle: current.numbers.length ? sectionAt(markers.find((marker) => marker.number === current.numbers[0])?.offset ?? 0) : sectionAt(Math.max(0, firstOffset)) });
    current = { numbers: [], text: "" };
  };

  for (const slice of slices) {
    if (current.text && current.text.length + slice.text.length + 2 > maxChars && current.numbers.length) flush();
    current.text += `${current.text ? "\n\n" : ""}${slice.text}`;
    current.numbers.push(slice.number);
  }
  flush();

  // Câu đơn lẻ quá dài: tách mềm theo dòng, giữ nguyên questionNumbers ở phần đầu.
  const result: SkeletonChunk[] = [];
  for (const chunk of chunks) {
    if (chunk.text.length <= maxChars) { result.push(chunk); continue; }
    const lines = chunk.text.split("\n");
    let part = "";
    let first = true;
    for (const line of lines) {
      if (part && part.length + line.length + 1 > maxChars) {
        result.push({ text: part, questionNumbers: first ? chunk.questionNumbers : [], sectionTitle: chunk.sectionTitle });
        part = "";
        first = false;
      }
      part += `${part ? "\n" : ""}${line}`;
    }
    if (part) result.push({ text: part, questionNumbers: first ? chunk.questionNumbers : [], sectionTitle: chunk.sectionTitle });
  }
  return result;
}

/** Lát cắt markdown của đúng một câu (từ marker của nó tới marker kế tiếp). */
export function questionSlice(markdown: string, skeleton: ExamSkeleton, number: number): string {
  const bodyEnd = skeleton.answerKeyOffset ?? markdown.length;
  const markers = skeleton.markers.filter((marker) => marker.offset < bodyEnd);
  const index = markers.findIndex((marker) => marker.number === number);
  if (index < 0) return "";
  const end = index + 1 < markers.length ? markers[index + 1].offset : bodyEnd;
  return markdown.slice(markers[index].offset, end).trim();
}

const normalizeKeyToken = (value: string) => value.normalize("NFC").trim().toUpperCase();

/**
 * Gán bảng đáp án đã trích xuất vào câu hỏi. Bảng đáp án trong đề là nguồn
 * đáng tin hơn suy luận AI nên được ưu tiên ghi đè khi khớp dạng câu.
 * Trả về danh sách cảnh báo cho các mục không áp dụng được.
 */
export function applyAnswerKey<T extends { number: number; type: string; choices?: { label: string; isCorrect: boolean | null }[]; statements?: { correctValue?: boolean }[]; shortAnswer?: { acceptedAnswers: string[]; caseSensitive: boolean } }>(
  questions: T[],
  answerKey: AnswerKeyEntry[] | null,
): string[] {
  const warnings: string[] = [];
  if (!answerKey?.length) return warnings;
  const byNumber = new Map(answerKey.map((entry) => [entry.number, entry.raw]));
  for (const question of questions) {
    const raw = byNumber.get(question.number);
    if (raw === undefined) continue;
    if (question.type === "single-choice" && question.choices?.length) {
      const token = normalizeKeyToken(raw);
      const target = question.choices.find((choice) => normalizeKeyToken(choice.label) === token);
      if (target) {
        question.choices.forEach((choice) => { choice.isCorrect = choice === target ? true : false; });
      } else {
        warnings.push(`Câu ${question.number}: bảng đáp án ghi "${raw}" nhưng câu không có phương án tương ứng.`);
      }
    } else if (question.type === "true-false" && question.statements?.length) {
      const tokens = raw.split(/[\s,;|]+/u).filter(Boolean).map(normalizeKeyToken);
      if (tokens.length === question.statements.length && tokens.every((token) => token === "Đ" || token === "S" || token === "D")) {
        question.statements.forEach((statement, index) => { statement.correctValue = tokens[index] === "Đ"; });
      } else {
        warnings.push(`Câu ${question.number}: bảng đáp án "${raw}" không khớp ${question.statements.length} phát biểu đúng/sai.`);
      }
    } else if (question.type === "short-answer" && question.shortAnswer) {
      if (!question.shortAnswer.acceptedAnswers.length) question.shortAnswer.acceptedAnswers = [raw];
    }
  }
  const applied = questions.filter((question) => byNumber.has(question.number)).length;
  if (applied < byNumber.size) {
    const orphan = [...byNumber.keys()].filter((number) => !questions.some((question) => question.number === number));
    if (orphan.length) warnings.push(`Bảng đáp án có ${orphan.length} mục không tìm thấy câu tương ứng: ${orphan.slice(0, 12).join(", ")}${orphan.length > 12 ? "…" : ""}.`);
  }
  return warnings;
}
