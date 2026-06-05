#!/usr/bin/env node
// scripts/mix-exam.js
// Trộn câu hỏi từ nhiều file đề thi Typst thành một đề mới
//
// Cách dùng:
//   node scripts/mix-exam.js de-01 de-02 de-03 --out de-mix-01 --code 201
//   npm run mix:exam de-01 de-02 --out de-mix-02

import { readFileSync, writeFileSync, existsSync } from "fs";
import { resolve, dirname } from "path";
import { fileURLToPath } from "url";

const __dir = dirname(fileURLToPath(import.meta.url));

// ─── Parse arguments ─────────────────────────────────────────────────
const rawArgs = process.argv.slice(2);
const sources = [];
let outName = null;
let examCode = "201";

for (let i = 0; i < rawArgs.length; i++) {
  if (rawArgs[i] === "--out") {
    outName = rawArgs[++i];
  } else if (rawArgs[i] === "--code") {
    examCode = rawArgs[++i];
  } else {
    sources.push(rawArgs[i].replace(/\.typ$/, ""));
  }
}

if (sources.length === 0) {
  console.error("❌  Thiếu file nguồn. Ví dụ:");
  console.error("   node scripts/mix-exam.js de-01 de-02 --out de-mix-01 --code 201");
  process.exit(1);
}

if (!outName) {
  outName = `de-mix-${Date.now().toString().slice(-4)}`;
}

// ─── Extract blocks from a Typst file ────────────────────────────────
// Quy tắc Typst: #fn([...], [...]) — nội dung trong [...] là markup thuần
// `)` trong markup (vd "*Ý a)*") không phải kết thúc block
// Giải pháp: khi bracketDepth > 0, bỏ qua tất cả `(` và `)`
function extractBlocks(content, keyword) {
  const blocks = [];
  const prefix = `#${keyword}(`;
  let pos = 0;

  while (pos < content.length) {
    const idx = content.indexOf(prefix, pos);
    if (idx === -1) break;

    let i = idx + prefix.length - 1;
    let parenDepth   = 0;  // depth của ngoặc tròn (arguments)
    let bracketDepth = 0;  // depth của ngoặc vuông [markup content]
    let braceDepth   = 0;  // depth của ngoặc nhọn {code block}
    let inLineComment = false;
    let inString = false;
    let end = -1;

    while (i < content.length) {
      const ch = content[i];
      const next = content[i + 1] || "";

      // Comment // → bỏ qua đến hết dòng
      if (!inString && ch === "/" && next === "/") {
        inLineComment = true;
      }
      if (ch === "\n") inLineComment = false;
      if (inLineComment) { i++; continue; }

      // String "..." → bỏ qua nội dung
      if (ch === '"' && !inString) {
        inString = true; i++; continue;
      }
      if (ch === '"' && inString) {
        inString = false; i++; continue;
      }
      if (inString) {
        if (ch === "\\") i++; // skip escape
        i++; continue;
      }

      // Ngoặc vuông [markup] — () bên trong không tính
      if (ch === "[") { bracketDepth++; i++; continue; }
      if (ch === "]") { if (bracketDepth > 0) bracketDepth--; i++; continue; }

      // Ngoặc nhọn {code} — () bên trong cũng không tính với context này
      if (ch === "{") { braceDepth++; i++; continue; }
      if (ch === "}") { if (braceDepth > 0) braceDepth--; i++; continue; }

      // Ngoặc tròn — CHỈ tính khi không đang trong [...] hoặc {...}
      if (bracketDepth === 0 && braceDepth === 0) {
        if (ch === "(") {
          parenDepth++;
        } else if (ch === ")") {
          parenDepth--;
          if (parenDepth === 0) { end = i; break; }
        }
      }

      i++;
    }

    if (end === -1) { pos = idx + prefix.length; continue; }

    blocks.push(content.slice(idx, end + 1));
    pos = end + 1;
  }
  return blocks;
}


// ─── Load all source files ────────────────────────────────────────────
const allTN = [];  // Trắc nghiệm nhiều lựa chọn
const allDS = [];  // Đúng/Sai
const allTLN = []; // Trả lời ngắn

for (const src of sources) {
  const filePath = resolve(__dir, "../typst/exams", src + ".typ");
  if (!existsSync(filePath)) {
    console.warn(`⚠️  Không tìm thấy: ${filePath} — bỏ qua`);
    continue;
  }

  const content = readFileSync(filePath, "utf-8");

  // Xác định vùng từng phần để phân loại đúng
  const part1Start = content.search(/PHẦN I\./);
  const part2Start = content.search(/PHẦN II\./);
  const part3Start = content.search(/PHẦN III\./);
  const part4Start = content.search(/PHẦN IV\./);

  const part1End = part2Start > 0 ? part2Start : content.length;
  const part2End = part3Start > 0 ? part3Start : content.length;
  const part3End = part4Start > 0 ? part4Start : content.length;

  // PHẦN I: #tn hoặc #tln đều là Trắc Nghiệm nhiều lựa chọn
  const part1Content = content.slice(part1Start, part1End);
  const tnBlocks = [
    ...extractBlocks(part1Content, "tn"),
    ...extractBlocks(part1Content, "tln").filter(b => !b.includes("loigiai")),
    // Nếu có loigiai thì cũng OK - ta lấy hết tln ở phần I
    ...(!extractBlocks(part1Content, "tn").length ? extractBlocks(part1Content, "tln") : [])
  ];
  // Deduplicate (tln có thể bị lấy 2 lần nếu không có tn)
  const tnUniq = [...new Set(tnBlocks)];

  const dsBlocks  = extractBlocks(content.slice(part2Start, part2End), "ds");
  // PHẦN III: #tln là Trả lời ngắn
  const tlnBlocks = extractBlocks(content.slice(part3Start, part3End), "tln");

  console.log(`📂  ${src}: ${tnUniq.length} TN | ${dsBlocks.length} ĐS | ${tlnBlocks.length} TLN`);

  allTN.push(...tnUniq);
  allDS.push(...dsBlocks);
  allTLN.push(...tlnBlocks);
}

// ─── Shuffle helper ───────────────────────────────────────────────────
function shuffle(arr) {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

// ─── Pick N items ─────────────────────────────────────────────────────
function pick(arr, n) {
  const shuffled = shuffle(arr);
  if (shuffled.length < n) {
    console.warn(`⚠️  Chỉ có ${shuffled.length} câu (cần ${n}), lấy tất cả`);
  }
  return shuffled.slice(0, n);
}

// ─── Build output file ────────────────────────────────────────────────
const tnPicked  = pick(allTN, 12);
const dsPicked  = pick(allDS, 4);
const tlnPicked = pick(allTLN, 6);

const today = new Date().toLocaleDateString("vi-VN");

// Header giữ nguyên import động theo các file nguồn
const importLines = `#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
`;

const header = `${importLines}
// ═══════════════════════════════════════════════════════════
// ĐỀ TRỘN — Tạo tự động ${today}
// Nguồn: ${sources.join(", ")}
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue

#show math.equation: set text(fill: rgb("#000000"))
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  school: "Sở GD&ĐT ...",
  exam-title: "THI THỬ THPT QUỐC GIA 2026",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto,
  code: "${examCode}",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: true,
)

`;

const part1 = `// ═══════════════════════════════════════════════════════════
// PHẦN I — Trắc nghiệm (${tnPicked.length} câu)
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: ${tnPicked.length})

${tnPicked.map((b, i) => `// Câu ${i + 1}\n${b}`).join("\n\n")}

`;

const part2 = `// ═══════════════════════════════════════════════════════════
// PHẦN II — Đúng/Sai (${dsPicked.length} câu)
// ═══════════════════════════════════════════════════════════
#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: auto)

${dsPicked.map((b, i) => `// Câu ${i + 1}\n${b}`).join("\n\n")}

`;

const part3 = `// ═══════════════════════════════════════════════════════════
// PHẦN III — Trả lời ngắn (${tlnPicked.length} câu)
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: ${tlnPicked.length})

${tlnPicked.map((b, i) => `// Câu ${i + 1}\n${b}`).join("\n\n")}

`;

const footer = `#het
#print-answer-key()
`;

const output = header + part1 + part2 + part3 + footer;

// ─── Write output ─────────────────────────────────────────────────────
const outPath = resolve(__dir, "../typst/exams", outName + ".typ");

if (existsSync(outPath)) {
  const ts = Date.now().toString().slice(-4);
  const newOut = outPath.replace(".typ", `-${ts}.typ`);
  writeFileSync(newOut, output, "utf-8");
  console.log(`\n⚠️  File đã tồn tại, đã lưu thành: ${newOut}`);
} else {
  writeFileSync(outPath, output, "utf-8");
  console.log(`\n✅  Đề trộn đã tạo: ${outPath}`);
}

console.log(`\n📊  Thống kê:`);
console.log(`   Nguồn:   ${sources.join(" + ")}`);
console.log(`   TN:      ${tnPicked.length}/${allTN.length} câu`);
console.log(`   ĐS:      ${dsPicked.length}/${allDS.length} câu`);
console.log(`   TLN:     ${tlnPicked.length}/${allTLN.length} câu`);
console.log(`\n💡  Compile:`);
console.log(`   typst compile typst/exams/${outName}.typ --root .`);
