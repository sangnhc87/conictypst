// ═══════════════════════════════════════════════════════════
// questions/lop12-xac-suat.typ
// Ngân hàng câu hỏi — Lớp 12 — Xác suất & Thống kê
// ═══════════════════════════════════════════════════════════

#import "../modules/question-bank.typ": ds-item, question-tn, question-ds, question-tln, question-tl

#let q-lop12-xac-suat = (

// ─────────────────────────────────────────────────────────
// THỐNG KÊ — ĐỘ LỆCH CHUẨN, PHƯƠNG SAI
// ─────────────────────────────────────────────────────────

"12XS-TK-01": question-tn(
  [Cho mẫu số liệu ghép nhóm:
  #table(columns: 6, align: center, stroke: 0.5pt + black,
    [*Nhóm*], [*[8; 10)*], [*[10; 12)*], [*[12; 14)*], [*[14; 16)*], [*[16; 18)*],
    [*Tần số*], [4], [5], [8], [7], [5]
  )
  Độ lệch chuẩn (làm tròn đến hàng phần trăm) là],
  ([$2,57$], [$2,55$], [$2,56$], [$2,54$]),
  correct: 3,
  solution: [
    Điểm giữa: $9, 11, 13, 15, 17$. $n = 29$.
    $overline(x) = 385/29$.
    $s^2 = 5301/29 - (385/29)^2 approx 6.5434$.
    $s approx 2.56$.
  ],
  tags: ("thong-ke", "do-lech-chuan", "mau-ghep-nhom"),
  difficulty: "TH",
  status: "ready",
  source: "de-01",
),

// ─────────────────────────────────────────────────────────
// XÁC SUẤT — BAYES, XÁC SUẤT TOÀN PHẦN
// ─────────────────────────────────────────────────────────

"12XS-BAYES-01": question-ds(
  [Hệ thống cửa nhận diện gương mặt tại công ty: nhận đúng nhân viên với xác suất $99%$, nhận nhầm khách thành nhân viên với xác suất $15%$. Tỉ lệ nhân viên trong sảnh là $90%$.],
  (
    ds-item([Xác suất hệ thống từ chối mở cửa cho một khách là $0.85$.], correct: true),
    ds-item([Xác suất hệ thống mở cửa cho một người bất kỳ là $0.9$.], correct: false),
    ds-item([Một người được mở cửa, xác suất người đó là khách nhỏ hơn $0.02$.], correct: true),
    ds-item([Xác suất một người bất kỳ bị hệ thống nhận diện nhầm là $0.024$.], correct: true),
  ),
  solution: [
    $P(overline(M)|K) = 0.85$. (a) Đúng.
    $P(M) = 0.9 times 0.99 + 0.1 times 0.15 = 0.906 != 0.9$. (b) Sai.
    $P(K|M) = 0.015/0.906 approx 0.0166 < 0.02$. (c) Đúng.
    $P("Nhầm") = 0.9 times 0.01 + 0.1 times 0.15 = 0.024$. (d) Đúng.
  ],
  tags: ("xac-suat", "bayes", "xac-suat-toan-phan"),
  difficulty: "VD",
  status: "ready",
  source: "de-01",
),

)
