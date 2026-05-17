#!/usr/bin/env node
// scripts/gen-id.js
// Công cụ hỗ trợ sinh ID chuẩn cho ngân hàng câu hỏi
// Chạy: node scripts/gen-id.js

import readline from "readline";
import { readFileSync, writeFileSync, existsSync } from "fs";
import { resolve, dirname } from "path";
import { fileURLToPath } from "url";

const __dir = dirname(fileURLToPath(import.meta.url));
const bankPath = resolve(__dir, "../typst/bank.json");

let bank = {};
if (existsSync(bankPath)) {
  bank = JSON.parse(readFileSync(bankPath, "utf-8"));
}

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

const ask = (q) => new Promise((resolve) => rl.question(q, resolve));

async function main() {
  console.log("\n🛠️  CÔNG CỤ SINH ID CÂU HỎI MỚI CHUẨN STEXGV\n");

  console.log("1. Chọn Khối lớp:");
  console.log("   [0] Lớp 10    [1] Lớp 11    [2] Lớp 12");
  let khoi = await ask("👉 Nhập (0/1/2): ");

  console.log("\n2. Chọn Phân môn:");
  console.log("   [D] Đại số / Giải tích    [H] Hình học");
  let mon = await ask("👉 Nhập (D/H): ");
  mon = mon.toUpperCase();

  let chuong = await ask("\n3. Nhập số Chương (ví dụ: 1, 2, 3...): ");

  console.log("\n4. Chọn Mức độ (Độ khó):");
  console.log("   [N] Nhận biết   [H] Thông hiểu   [V] Vận dụng   [C] Vận dụng cao");
  let doKho = await ask("👉 Nhập (N/H/V/C): ");
  doKho = doKho.toUpperCase();

  let bai = await ask("\n5. Nhập số Bài hoặc Dạng (ví dụ: 1, 2, 3...): ");

  let prefix = `${khoi}${mon}${chuong}${doKho}${bai}`;

  // Tìm ID trống tiếp theo
  let counter = 1;
  while (bank[`${prefix}-${counter}`] !== undefined) {
    counter++;
  }

  let newId = `${prefix}-${counter}`;
  console.log(`\n🎉 ID chuẩn dành cho bạn là: \x1b[32m${newId}\x1b[0m`);

  let desc = await ask("\n👉 Bạn có muốn thêm ID này vào bank.json không? Nhập mô tả ngắn (hoặc Enter để bỏ qua): ");
  
  if (desc.trim() !== "") {
    bank[newId] = `Lớp 1${khoi} | ${mon === 'D' ? 'Đại số' : 'Hình học'} | Ch${chuong} | Bài ${bai} | ${desc}`;
    writeFileSync(bankPath, JSON.stringify(bank, null, 4), "utf-8");
    console.log(`\n✅ Đã lưu ${newId} vào bank.json!`);
    console.log(`   Tiếp theo, hãy soạn thảo câu hỏi này trong thư mục typst/questions/`);
  } else {
    console.log(`\n❌ Đã huỷ lưu.`);
  }

  rl.close();
}

main().catch(console.error);
