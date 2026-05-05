#!/usr/bin/env node
// scripts/bank-stat.js
// Thống kê ngân hàng câu hỏi từ bank.json
// Format: { "ID": "L12 | Đại Số | Ch3: ... | Bài X: ... | Dạng Y: ..." }
//
// Chạy: node scripts/bank-stat.js
//        node scripts/bank-stat.js "xác suất"   <- tìm kiếm
//        node scripts/bank-stat.js --missing    <- câu chưa có content

import { readFileSync, existsSync } from "fs";
import { resolve, dirname } from "path";
import { fileURLToPath } from "url";

const __dir = dirname(fileURLToPath(import.meta.url));
const bankPath = resolve(__dir, "../bank.json");

if (!existsSync(bankPath)) {
  // Thử đường dẫn typst/bank.json
  const alt = resolve(__dir, "../typst/bank.json");
  if (!existsSync(alt)) {
    console.error("❌  Không tìm thấy bank.json");
    process.exit(1);
  }
}

const bank = JSON.parse(readFileSync(bankPath, "utf-8"));

// ── Parse mô tả: "L12 | Đại Số | Ch3: Hàm số | Bài 1: ... | Dạng 1: ..." ──
function parseEntry(id, desc) {
  if (typeof desc !== "string") return { id, raw: desc };
  const parts = desc.split("|").map((s) => s.trim());
  const grade = parts[0] || "";
  const branch = parts[1] || "";
  const chapter = (parts[2] || "").replace(/^Ch\d+:\s*/, "");
  const lesson = (parts[3] || "").replace(/^Bài\s*\d+:\s*/, "");
  const form = (parts[4] || "").replace(/^Dạng\s*\d+:\s*/, "");
  return { id, grade, branch, chapter, lesson, form, raw: desc };
}

const entries = Object.entries(bank).map(([id, desc]) => parseEntry(id, desc));

// ── Thống kê ─────────────────────────────────────────────
const stat = {
  total: entries.length,
  byGrade: {},
  byBranch: {},
  byChapter: {},
  byLesson: {},
  byForm: {},
};

for (const e of entries) {
  const inc = (obj, key) => {
    const k = key?.trim() || "(chưa phân loại)";
    obj[k] = (obj[k] || 0) + 1;
  };
  inc(stat.byGrade, e.grade);
  inc(stat.byBranch, e.branch);
  inc(stat.byChapter, e.chapter);
  inc(stat.byLesson, e.lesson);
  inc(stat.byForm, e.form);
}

// ── In báo cáo ───────────────────────────────────────────
const HR = "─".repeat(60);
const col = (label, n) =>
  `  ${label.substring(0, 44).padEnd(44, ".")} ${String(n).padStart(5)}`;

console.log(`\n📚  THỐNG KÊ NGÂN HÀNG CÂU HỎI — bank.json`);
console.log(HR);
console.log(`  Tổng số mã câu hỏi: ${stat.total}`);
console.log(HR);

const printSection = (title, obj, top = 15) => {
  console.log(`\n${title}`);
  const sorted = Object.entries(obj).sort((a, b) => b[1] - a[1]);
  for (const [k, v] of sorted.slice(0, top)) console.log(col(k, v));
  if (sorted.length > top)
    console.log(`  ... và ${sorted.length - top} mục khác`);
};

printSection("📖  Theo lớp:", stat.byGrade, 10);
printSection("🔱  Theo mảng:", stat.byBranch, 10);
printSection("📗  Theo chương (top 20):", stat.byChapter, 20);
printSection("📄  Theo bài (top 15):", stat.byLesson, 15);
printSection("🎯  Theo dạng (top 15):", stat.byForm, 15);

console.log(`\n${HR}`);
console.log(`  💡  Tìm kiếm: npm run bank:search -- "xác suất"`);
console.log(`  💡  Scaffold đề mới: npm run new:exam -- de-03`);
console.log(HR + "\n");

// ── Tìm kiếm nhanh ───────────────────────────────────────
const args = process.argv.slice(2).filter((a) => !a.startsWith("--"));
const flags = process.argv.slice(2).filter((a) => a.startsWith("--"));

if (args.length > 0) {
  const q = args.join(" ").toLowerCase();
  const matches = entries.filter(
    (e) =>
      e.id.toLowerCase().includes(q) ||
      e.chapter.toLowerCase().includes(q) ||
      e.lesson.toLowerCase().includes(q) ||
      e.form.toLowerCase().includes(q) ||
      e.branch.toLowerCase().includes(q) ||
      e.grade.toLowerCase().includes(q)
  );

  console.log(`🔍  Tìm kiếm "${args.join(" ")}": ${matches.length} kết quả\n`);

  // Nhóm theo chương
  const grouped = {};
  for (const e of matches) {
    const key = `${e.grade} | ${e.branch} | ${e.chapter}`;
    if (!grouped[key]) grouped[key] = [];
    grouped[key].push(e);
  }

  for (const [group, items] of Object.entries(grouped).slice(0, 10)) {
    console.log(`  📗 ${group}`);
    for (const e of items.slice(0, 8)) {
      console.log(
        `     ${e.id.padEnd(14)} ${e.lesson} > ${e.form}`
      );
    }
    if (items.length > 8)
      console.log(`     ... và ${items.length - 8} câu nữa`);
    console.log("");
  }

  if (Object.keys(grouped).length > 10)
    console.log(`  ... và ${Object.keys(grouped).length - 10} chương nữa\n`);
}
