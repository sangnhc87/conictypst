import JSZip from "jszip";
import type { GameQuestion } from "./gameDb";

export type QuestionImportResult = {
  questions: GameQuestion[];
  source: string;
  skipped: number;
};

const MAX_QUESTIONS = 200;

function normalize(value: unknown) {
  return String(value ?? "")
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .replace(/đ/g, "d")
    .replace(/[^a-z0-9]+/g, " ")
    .trim();
}

function answerIndex(value: unknown) {
  const key = normalize(value).replace(/\s+/g, "");
  if (["a", "1"].includes(key)) return 0;
  if (["b", "2"].includes(key)) return 1;
  if (["c", "3"].includes(key)) return 2;
  if (["d", "4"].includes(key)) return 3;
  return -1;
}

const aliases = {
  prompt: ["cau hoi", "noi dung", "question", "prompt"],
  a: ["phuong an a", "dap an a", "lua chon a", "answer a", "a"],
  b: ["phuong an b", "dap an b", "lua chon b", "answer b", "b"],
  c: ["phuong an c", "dap an c", "lua chon c", "answer c", "c"],
  d: ["phuong an d", "dap an d", "lua chon d", "answer d", "d"],
  correct: ["dap an dung", "dap an", "correct", "correct answer"],
  explanation: ["loi giai", "giai thich", "goi y", "explanation"],
} as const;

function columnIndex(headers: unknown[], keys: readonly string[]) {
  const normalized = headers.map(normalize);
  return normalized.findIndex((header) => keys.includes(header));
}

function rowsToQuestions(rows: unknown[][], source: string): QuestionImportResult {
  if (rows.length < 2) throw new Error("File chưa có hàng dữ liệu câu hỏi.");
  const headerIndex = rows.slice(0, 20).findIndex((candidate) => {
    const required = [aliases.prompt, aliases.a, aliases.b, aliases.c, aliases.d, aliases.correct];
    return required.every((keys) => columnIndex(candidate, keys) >= 0);
  });
  if (headerIndex < 0) throw new Error("Thiếu hàng tiêu đề. Hãy dùng file mẫu Word hoặc Excel của Sang Math.");
  const headers = rows[headerIndex];
  const columns = {
    prompt: columnIndex(headers, aliases.prompt),
    a: columnIndex(headers, aliases.a),
    b: columnIndex(headers, aliases.b),
    c: columnIndex(headers, aliases.c),
    d: columnIndex(headers, aliases.d),
    correct: columnIndex(headers, aliases.correct),
    explanation: columnIndex(headers, aliases.explanation),
  };
  if ([columns.prompt, columns.a, columns.b, columns.c, columns.d, columns.correct].some((index) => index < 0)) {
    throw new Error("Thiếu cột bắt buộc. Hãy dùng file mẫu Word hoặc Excel của Sang Math.");
  }

  let skipped = 0;
  const questions: GameQuestion[] = [];
  for (const row of rows.slice(headerIndex + 1)) {
    const prompt = String(row[columns.prompt] ?? "").trim();
    const answers = [columns.a, columns.b, columns.c, columns.d].map((index) => String(row[index] ?? "").trim()) as GameQuestion["answers"];
    const correct = answerIndex(row[columns.correct]);
    if (!prompt && answers.every((answer) => !answer)) continue;
    if (!prompt || answers.some((answer) => !answer) || correct < 0) { skipped += 1; continue; }
    questions.push({
      id: crypto.randomUUID(),
      level: questions.length + 1,
      prompt,
      answers,
      correct,
      explanation: columns.explanation >= 0 ? String(row[columns.explanation] ?? "").trim() : "",
    });
    if (questions.length >= MAX_QUESTIONS) break;
  }
  if (!questions.length) throw new Error("Không đọc được câu hỏi hợp lệ nào trong file.");
  return { questions, source, skipped };
}

function parseCsv(text: string) {
  const rows: string[][] = [];
  let row: string[] = [];
  let value = "";
  let quoted = false;
  for (let index = 0; index < text.length; index += 1) {
    const character = text[index];
    if (character === '"') {
      if (quoted && text[index + 1] === '"') { value += '"'; index += 1; }
      else quoted = !quoted;
    } else if (character === "," && !quoted) {
      row.push(value); value = "";
    } else if ((character === "\n" || character === "\r") && !quoted) {
      if (character === "\r" && text[index + 1] === "\n") index += 1;
      row.push(value); value = "";
      if (row.some((cell) => cell.trim())) rows.push(row);
      row = [];
    } else value += character;
  }
  row.push(value);
  if (row.some((cell) => cell.trim())) rows.push(row);
  return rows;
}

function xmlText(node: Element) {
  return Array.from(node.getElementsByTagNameNS("http://schemas.openxmlformats.org/wordprocessingml/2006/main", "t"))
    .map((item) => item.textContent || "")
    .join("")
    .trim();
}

function parseWordBlocks(lines: string[]) {
  const rows: string[][] = [["Câu hỏi", "Phương án A", "Phương án B", "Phương án C", "Phương án D", "Đáp án", "Lời giải"]];
  let record: Record<string, string> | null = null;
  let started = false;
  const flush = () => {
    if (!record) return;
    rows.push([record.prompt || "", record.a || "", record.b || "", record.c || "", record.d || "", record.correct || "", record.explanation || ""]);
    record = null;
  };
  for (const rawLine of lines) {
    const line = rawLine.trim();
    if (!line) continue;
    if (/^câu\s+\d+/i.test(line) && !/^câu\s+hỏi/i.test(line)) { flush(); record = {}; started = true; continue; }
    if (!started) continue;
    record ||= {};
    const match = line.match(/^(câu hỏi|question|a|b|c|d|đáp án|dap an|lời giải|loi giai|giải thích|giai thich)\s*[:.\-]\s*(.*)$/i);
    if (!match) {
      if (record.prompt) record.prompt += ` ${line}`;
      else record.prompt = line;
      continue;
    }
    const key = normalize(match[1]);
    const content = match[2].trim();
    if (key === "cau hoi" || key === "question") record.prompt = content;
    else if (["a", "b", "c", "d"].includes(key)) record[key] = content;
    else if (key === "dap an") record.correct = content;
    else record.explanation = content;
  }
  flush();
  return rows;
}

async function importDocx(file: File) {
  const zip = await JSZip.loadAsync(await file.arrayBuffer());
  const entry = zip.file("word/document.xml");
  if (!entry) throw new Error("Đây không phải file Word .docx hợp lệ.");
  const xml = new DOMParser().parseFromString(await entry.async("text"), "application/xml");
  const namespace = "http://schemas.openxmlformats.org/wordprocessingml/2006/main";
  const tables = Array.from(xml.getElementsByTagNameNS(namespace, "tbl"));
  if (tables.length) {
    const rows = Array.from(tables[0].getElementsByTagNameNS(namespace, "tr")).map((row) =>
      Array.from(row.getElementsByTagNameNS(namespace, "tc")).map(xmlText),
    );
    try { return rowsToQuestions(rows, "Word"); } catch { /* fall through to paragraph blocks */ }
  }
  const lines = Array.from(xml.getElementsByTagNameNS(namespace, "p"))
    .filter((paragraph) => !paragraph.parentElement || paragraph.parentElement.localName !== "tc")
    .map(xmlText)
    .filter(Boolean);
  return rowsToQuestions(parseWordBlocks(lines), "Word");
}

export async function importQuestionsFromFile(file: File): Promise<QuestionImportResult> {
  if (file.size > 12 * 1024 * 1024) throw new Error("File tối đa 12 MB để xử lý nhanh ngay trên máy.");
  const extension = file.name.toLowerCase().split(".").pop();
  if (extension === "docx") return importDocx(file);
  if (extension === "csv") return rowsToQuestions(parseCsv(await file.text()), "CSV");
  if (extension === "xlsx") {
    const { default: readXlsxFile } = await import("read-excel-file");
    const rows = await readXlsxFile(file);
    return rowsToQuestions(rows, "Excel");
  }
  if (extension === "json") {
    const parsed = JSON.parse(await file.text()) as { questions?: GameQuestion[] } | GameQuestion[];
    const rawQuestions = Array.isArray(parsed) ? parsed : parsed.questions;
    if (!Array.isArray(rawQuestions)) throw new Error("JSON cần có mảng questions.");
    const rows = [["Câu hỏi", "A", "B", "C", "D", "Đáp án", "Lời giải"], ...rawQuestions.map((question) => [question.prompt, ...question.answers, String((question.correct ?? 0) + 1), question.explanation])];
    return rowsToQuestions(rows, "JSON");
  }
  throw new Error("Hỗ trợ Word .docx, Excel .xlsx, CSV và JSON.");
}
