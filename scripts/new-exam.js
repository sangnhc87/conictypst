#!/usr/bin/env node
// scripts/new-exam.js
// Scaffold file đề thi mới tự động
// Chạy: node scripts/new-exam.js de-02
// Hoặc: npm run new:exam de-02

import { writeFileSync, existsSync } from "fs";
import { resolve, dirname } from "path";
import { fileURLToPath } from "url";

const __dir = dirname(fileURLToPath(import.meta.url));
const args = process.argv.slice(2);

if (args.length === 0) {
  console.error("❌  Thiếu tên file. Ví dụ: node scripts/new-exam.js de-02");
  process.exit(1);
}

const name = args[0].replace(/\.typ$/, "");
const outPath = resolve(__dir, "../typst/exams", name + ".typ");
const beamerPath = resolve(__dir, "../typst/exams", name + "-beamer.typ");

if (existsSync(outPath)) {
  console.error(`❌  File đã tồn tại: ${outPath}`);
  console.error("   Đổi tên hoặc xoá file cũ trước.");
  process.exit(1);
}

const today = new Date().toLocaleDateString("vi-VN");

// ── Template đề thi ──────────────────────────────────────
const examTemplate = `#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.0"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "dethi"   // dethi | loigiai | solcolor
#let accent = classic.blue

#show math.equation: set text(fill: rgb("#000000"))
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  school: "Sở GD&ĐT ...",
  exam-title: "THI THỬ THPT QUỐC GIA 2026",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto,
  code: "101",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
)

// ═══════════════════════════════════════════════════════════
// PHẦN I — Trắc nghiệm (12 câu)
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 12)

// Câu 1
#tn(
  [Đề bài câu 1.],
  ([$A$], [$B$], [$C$], [$D$]),
  loigiai: [Lời giải câu 1.],
)

// Câu 2 — thêm câu ở đây...

// ═══════════════════════════════════════════════════════════
// PHẦN II — Đúng/Sai (4 câu)
// ═══════════════════════════════════════════════════════════
#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: auto)

// Câu 1
#ds(
  [Đề bài câu đúng/sai 1.],
  (
    True([Phát biểu đúng.]),
    [Phát biểu sai.],
    True([Phát biểu đúng.]),
    [Phát biểu sai.],
  ),
  loigiai: [Lời giải.],
)

// ═══════════════════════════════════════════════════════════
// PHẦN III — Trả lời ngắn (6 câu)
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6)

// Câu 1
#tln(
  [Đề bài điền số 1.],
  [$42$],
  loigiai: [Lời giải.],
)

#het
#print-answer-key()
`;

// ── Template beamer ──────────────────────────────────────
const beamerTemplate = `#import "../sang-beamer.typ": *

// Cấu hình slide
#show: sang-beamer-theme.with(
  title: "ĐỀ THI THỬ THPT 2026",
  subtitle: "TOÁN - LỚP 12",
  author: "GV Nguyễn Văn Sang",
  institution: "Sở GD&ĐT ...",
  code: "101",
  total-q: 22,
)

// Câu bắt đầu từ 1 — auto-counter, không cần nhập tay
#bm-resetcau()

// ═══════════════════════════════════════════════════════════
// PHẦN I — Trắc nghiệm
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN I — TRẮC NGHIỆM])

// Câu 1 — num: auto (tự đếm)
#mcq(
  [Đề bài câu 1.],
  ([A], [B], [C], [D]),
  correct: (2,),
  loigiai: [Lời giải.],
)

// Câu 2, 3, ... — không cần num, tự tăng
#mcq(
  [Đề bài câu 2.],
  ([A], [B], [C], [D]),
  correct: (1,),
)

// ═══════════════════════════════════════════════════════════
// PHẦN II — Đúng/Sai
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN II — ĐÚNG/SAI])

// num: auto bắt đầu từ 13 (sau 12 TN)
#bm-setcau(13)

#ds(
  [Đề bài câu đúng/sai 1.],
  (
    True([Phát biểu đúng.]),
    [Phát biểu sai.],
    True([Phát biểu đúng.]),
    [Phát biểu sai.],
  ),
)

// ═══════════════════════════════════════════════════════════
// PHẦN III — Trả lời ngắn
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN III — TRẢ LỜI NGẮN])

#bm-setcau(17)

#tln(
  [Đề bài câu điền số 1.],
  [$42$],
)

#het
`;

writeFileSync(outPath, examTemplate, "utf-8");
writeFileSync(beamerPath, beamerTemplate, "utf-8");

console.log(`\n✅  Đã tạo thành công:`);
console.log(`   📄  ${outPath}`);
console.log(`   📽️   ${beamerPath}`);
console.log(`\n💡  Compile thử:`);
console.log(`   typst compile typst/exams/${name}.typ --root typst`);
console.log(`   typst compile typst/exams/${name}-beamer.typ --root typst\n`);
