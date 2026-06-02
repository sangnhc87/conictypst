// toan-lop3.typ — Driver file for Grade 3 Math (Typst)
// This file assembles the book from chapter files and applies
// the shared theme in `_theme.typ`.

#import "_theme.typ": *

= Toán — Lớp 3

_Một cuốn sách Toán cho học sinh lớp 3 — trình bày rõ ràng, thân thiện, và dễ hiểu._

--

// Front matter (bìa, lời nói đầu, hướng dẫn sử dụng sách)
#include "front.typ"

// Nội dung chính: các chương. Mỗi chương là một file Typst riêng:

// Chương 1: Số học (số, đọc, ghi, so sánh, các phép tính cơ bản)
#include "c1-so-hoc.typ"

// Chương 2: Cộng và trừ (kỹ thuật, bài toán vận dụng)
#include "c2-cong-tru.typ"

// Chương 3: Nhân và chia (bảng nhân, chiến lược tính nhanh)
#include "c3-nhan-chia.typ"

// Chương 4: Hình học cơ bản (hình, đo, vẽ, tính chu vi)
#include "c4-hinh-hoc.typ"

// Chương 5: Phân số cơ bản (khái niệm, so sánh, bài tập)
#include "c5-phan-so.typ"

// Phần cuối: phụ lục, đáp án, tài liệu tham khảo
#include "back.typ"

// Hướng dẫn build (để tiện):
// Từ thư mục gốc repo, chạy: `typst compile typst/sach/toan-lop3/toan-lop3.typ`

