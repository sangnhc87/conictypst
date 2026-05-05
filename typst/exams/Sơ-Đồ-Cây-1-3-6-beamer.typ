// ═══════════════════════════════════════════════════════════
// SƠ-ĐỒ-CÂY-1-3-6-BEAMER.TYP — Nội dung slide (không standalone)
// Được #include từ main-beamer.typ — KHÔNG có #set page / #show rules
// ═══════════════════════════════════════════════════════════

// Import hàm slide từ beamer module (KHÔNG import sang-exam.typ)
#import "../sang-beamer.typ": True, classic, exam-part, luuy, mcq, meo, ppgiai, tf
#import "@preview/cetz:0.5.0"

// ── Cấu hình scale cetz dùng chung ─────────────────────────
// Slide 16:9 ≈ 22cm usable width, fig-width: 45% ≈ 99mm → length: 0.9cm
#let _len = 0.9cm
#let _s1 = (frame: "rect", padding: 3pt, stroke: 0.5pt + white, radius: 2pt, fill: rgb("#1e293b"))
#let _s2 = (frame: "rect", padding: 2.5pt, stroke: 0.4pt + white, radius: 2pt, fill: rgb("#1e293b"))
#let _lbl = (frame: "rect", fill: rgb("#0f172a"), padding: 1pt, stroke: none)

// ══════════════════════════════════════════════════════════
// PHẦN CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════
#exam-part([CHUYÊN ĐỀ: SƠ ĐỒ CÂY 1-3-6], accent: classic.blue)

// ── Câu 1 — Công ty sản xuất (Bayes xuôi + ngược) ──────────
#tf(
  [Một công ty sản xuất một loại sản phẩm. Trước khi bán ra thị trường, công ty đã phỏng vấn $200$ khách hàng và thấy có $88$ người trả lời "sẽ mua", $52$ người trả lời "không mua", số còn lại trả lời "sẽ cân nhắc". Theo thống kê: trong khách hàng trả lời "sẽ mua" có $80%$ thực sự mua; "không mua" có $30%$ thực sự mua; tỉ lệ thực sự mua toàn bộ là $65%$. Chọn ngẫu nhiên một khách hàng.],
  (
    True([Xác suất để chọn được người trả lời "sẽ mua" là $44%$.]),
    [Xác suất để khách hàng thực sự mua, nếu biết khách đã trả lời "sẽ mua", là $44/125$.],
    [Nếu chọn được khách hàng trả lời "sẽ cân nhắc" thì tỉ lệ thực sự mua là $35%$.],
    [Xác suất để chọn được khách hàng trả lời "sẽ cân nhắc", nếu biết khách đó thực sự mua là $8/25$.],
  ),
  num: 1,
  label-num: 101,
  fig: cetz.canvas(length: _len, {
    import cetz.draw: *
    content(
      (0, 0),
      [KH \ ($200$)],
      name: "root",
      frame: "rect",
      padding: 4pt,
      fill: rgb("#172554"),
      stroke: 0.5pt + rgb("#3b82f6"),
      radius: 3pt,
    )
    content((3.5, 2.5), [Sẽ mua \ ($A$)], name: "A", .._s1)
    content((3.5, 0), [Cân nhắc \ ($B$)], name: "B", .._s1)
    content((3.5, -2.5), [Không mua \ ($C$)], name: "C", .._s1)
    line("root", "A", mark: (end: ">", fill: white), stroke: white)
    content((1.75, 1.55), text(size: 8pt, fill: white)[$0,44$], .._lbl)
    line("root", "B", mark: (end: ">", fill: white), stroke: white)
    content((1.75, 0), text(size: 8pt, fill: white)[$0,30$], .._lbl)
    line("root", "C", mark: (end: ">", fill: white), stroke: white)
    content((1.75, -1.55), text(size: 8pt, fill: white)[$0,26$], .._lbl)
    content((7.5, 3.2), [Mua ($M$)], name: "AM", .._s2)
    content((7.5, 1.8), [Không], name: "AnM", .._s2)
    line("A", "AM", mark: (end: ">", fill: white), stroke: white)
    content((5.5, 3.1), text(size: 8pt, fill: white)[$0,80$], .._lbl)
    line("A", "AnM", mark: (end: ">", fill: white), stroke: white)
    content((5.5, 1.9), text(size: 8pt, fill: white)[$0,20$], .._lbl)
    content((7.5, 0.7), [Mua ($M$)], name: "BM", .._s2 + (stroke: rgb("#ef4444"), fill: rgb("#450a0a")))
    content((7.5, -0.7), [Không], name: "BnM", .._s2)
    line("B", "BM", mark: (end: ">", fill: rgb("#ef4444")), stroke: rgb("#ef4444"))
    content((5.5, 0.6), text(size: 8pt, fill: rgb("#ef4444"))[$x$], .._lbl)
    line("B", "BnM", mark: (end: ">", fill: white), stroke: white)
    content((5.5, -0.6), text(size: 8pt, fill: white)[$1-x$], .._lbl)
    content((7.5, -1.8), [Mua ($M$)], name: "CM", .._s2)
    content((7.5, -3.2), [Không], name: "CnM", .._s2)
    line("C", "CM", mark: (end: ">", fill: white), stroke: white)
    content((5.5, -1.9), text(size: 8pt, fill: white)[$0,30$], .._lbl)
    line("C", "CnM", mark: (end: ">", fill: white), stroke: white)
    content((5.5, -3.1), text(size: 8pt, fill: white)[$0,70$], .._lbl)
  }),
  fig-pos: "right",
  fig-width: 42%,
  solution: [
    - *a) Đúng.* $P(A) = 88/200 = 0,44 = 44%$.
    - *b) Sai.* $P(M|A) = 0,8 != 44/125$.
    - *c) Sai.* $0,65 = 0,44·0,8 + 0,3·P(M|B) + 0,26·0,3 => P(M|B) = 11/15 ≈ 73%$.
    - *d) Sai.* $P(B|M) = (0,3 · 11/15)/0,65 = 22/65 != 8/25$.
  ],
)

// ── Câu 2 — Nhà máy 3 phân xưởng ──────────────────────────
#tf(
  [Một nhà máy có $3$ phân xưởng cùng sản xuất linh kiện. PX I chiếm $50%$, PX II chiếm $30%$, còn lại là PX III. Tỉ lệ phế phẩm: PX I là $2%$, PX III là $3%$; tỉ lệ phế phẩm chung toàn nhà máy là $3,1%$. Chọn ngẫu nhiên một linh kiện.],
  (
    True([Xác suất để chọn được linh kiện do PX I sản xuất là $50%$.]),
    [Xác suất để linh kiện là phế phẩm, nếu biết nó do PX I sản xuất, là $1/25$.],
    True([Nếu chọn được linh kiện của PX II thì tỉ lệ là phế phẩm là $5%$.]),
    [Xác suất để linh kiện do PX II sản xuất, nếu biết nó là phế phẩm, là $1/2$.],
  ),
  num: 2,
  label-num: 102,
  fig: cetz.canvas(length: _len, {
    import cetz.draw: *
    content(
      (0, 0),
      [Linh kiện],
      name: "root",
      frame: "rect",
      padding: 4pt,
      fill: rgb("#172554"),
      stroke: 0.5pt + rgb("#3b82f6"),
      radius: 3pt,
    )
    content((3.5, 2.5), ["PX I" \ ($A$)], name: "A", .._s1)
    content((3.5, 0), ["PX II" \ ($B$)], name: "B", .._s1)
    content((3.5, -2.5), ["PX III" \ ($C$)], name: "C", .._s1)
    line("root", "A", mark: (end: ">", fill: white), stroke: white)
    content((1.75, 1.55), text(size: 8pt, fill: white)[$0,50$], .._lbl)
    line("root", "B", mark: (end: ">", fill: white), stroke: white)
    content((1.75, 0), text(size: 8pt, fill: white)[$0,30$], .._lbl)
    line("root", "C", mark: (end: ">", fill: white), stroke: white)
    content((1.75, -1.55), text(size: 8pt, fill: white)[$0,20$], .._lbl)
    content((7.5, 3.2), [Phế ($D$)], name: "AD", .._s2)
    content((7.5, 1.8), [Chuẩn], name: "AnD", .._s2)
    line("A", "AD", mark: (end: ">", fill: white), stroke: white)
    content((5.5, 3.1), text(size: 8pt, fill: white)[$0,02$], .._lbl)
    line("A", "AnD", mark: (end: ">", fill: white), stroke: white)
    content((5.5, 1.9), text(size: 8pt, fill: white)[$0,98$], .._lbl)
    content((7.5, 0.7), [Phế ($D$)], name: "BD", .._s2 + (stroke: rgb("#ef4444"), fill: rgb("#450a0a")))
    content((7.5, -0.7), [Chuẩn], name: "BnD", .._s2)
    line("B", "BD", mark: (end: ">", fill: rgb("#ef4444")), stroke: rgb("#ef4444"))
    content((5.5, 0.6), text(size: 8pt, fill: rgb("#ef4444"))[$x$], .._lbl)
    line("B", "BnD", mark: (end: ">", fill: white), stroke: white)
    content((5.5, -0.6), text(size: 8pt, fill: white)[$1-x$], .._lbl)
    content((7.5, -1.8), [Phế ($D$)], name: "CD", .._s2)
    content((7.5, -3.2), [Chuẩn], name: "CnD", .._s2)
    line("C", "CD", mark: (end: ">", fill: white), stroke: white)
    content((5.5, -1.9), text(size: 8pt, fill: white)[$0,03$], .._lbl)
    line("C", "CnD", mark: (end: ">", fill: white), stroke: white)
    content((5.5, -3.1), text(size: 8pt, fill: white)[$0,97$], .._lbl)
  }),
  fig-pos: "right",
  fig-width: 42%,
  solution: [
    - *a) Đúng.* $P(A) = 0,50 = 50%$.
    - *b) Sai.* $P(D|A) = 0,02 = 1/50 != 1/25$.
    - *c) Đúng.* $0,031 = 0,50·0,02 + 0,30·x + 0,20·0,03 => x = 0,05 = 5%$.
    - *d) Sai.* $P(B|D) = (0,30·0,05)/0,031 = 15/31 != 1/2$.
  ],
)

// ── Câu 3 — Trường đại học (Giỏi theo xuất thân) ───────────
#tf(
  [Tại một trường đại học, tân sinh viên đến từ ba trường THPT: A ($40%$), B ($30%$), C (còn lại). Tỉ lệ tốt nghiệp loại Giỏi: trường A là $20%$, trường C là $15%$; tỉ lệ Giỏi chung toàn khóa là $18,5%$. Chọn ngẫu nhiên một sinh viên đã tốt nghiệp.],
  (
    True([Xác suất để chọn được sinh viên đến từ trường B là $30%$.]),
    [Nếu chọn được sinh viên từ trường A, xác suất em đó không đạt loại Giỏi là $20%$.],
    True([Tỉ lệ sinh viên đạt loại Giỏi trong số các em đến từ trường B là $20%$.]),
    [Chọn một sinh viên tốt nghiệp loại Giỏi, xác suất em đó đến từ trường C là $27/37$.],
  ),
  num: 3,
  label-num: 103,
  fig: cetz.canvas(length: _len, {
    import cetz.draw: *
    content(
      (0, 0),
      [Sinh viên],
      name: "root",
      frame: "rect",
      padding: 4pt,
      fill: rgb("#172554"),
      stroke: 0.5pt + rgb("#3b82f6"),
      radius: 3pt,
    )
    content((3.5, 2.5), [Trường A], name: "A", .._s1)
    content((3.5, 0), [Trường B], name: "B", .._s1)
    content((3.5, -2.5), [Trường C], name: "C", .._s1)
    line("root", "A", mark: (end: ">", fill: white), stroke: white)
    content((1.75, 1.55), text(size: 8pt, fill: white)[$0,40$], .._lbl)
    line("root", "B", mark: (end: ">", fill: white), stroke: white)
    content((1.75, 0), text(size: 8pt, fill: white)[$0,30$], .._lbl)
    line("root", "C", mark: (end: ">", fill: white), stroke: white)
    content((1.75, -1.55), text(size: 8pt, fill: white)[$0,30$], .._lbl)
    content((7.5, 3.2), [Giỏi ($G$)], name: "AG", .._s2)
    content((7.5, 1.8), [Khác], name: "AnG", .._s2)
    line("A", "AG", mark: (end: ">", fill: white), stroke: white)
    content((5.5, 3.1), text(size: 8pt, fill: white)[$0,20$], .._lbl)
    line("A", "AnG", mark: (end: ">", fill: white), stroke: white)
    content((5.5, 1.9), text(size: 8pt, fill: white)[$0,80$], .._lbl)
    content((7.5, 0.7), [Giỏi ($G$)], name: "BG", .._s2 + (stroke: rgb("#ef4444"), fill: rgb("#450a0a")))
    content((7.5, -0.7), [Khác], name: "BnG", .._s2)
    line("B", "BG", mark: (end: ">", fill: rgb("#ef4444")), stroke: rgb("#ef4444"))
    content((5.5, 0.6), text(size: 8pt, fill: rgb("#ef4444"))[$x$], .._lbl)
    line("B", "BnG", mark: (end: ">", fill: white), stroke: white)
    content((5.5, -0.6), text(size: 8pt, fill: white)[$1-x$], .._lbl)
    content((7.5, -1.8), [Giỏi ($G$)], name: "CG", .._s2)
    content((7.5, -3.2), [Khác], name: "CnG", .._s2)
    line("C", "CG", mark: (end: ">", fill: white), stroke: white)
    content((5.5, -1.9), text(size: 8pt, fill: white)[$0,15$], .._lbl)
    line("C", "CnG", mark: (end: ">", fill: white), stroke: white)
    content((5.5, -3.1), text(size: 8pt, fill: white)[$0,85$], .._lbl)
  }),
  fig-pos: "right",
  fig-width: 42%,
  solution: [
    - *a) Đúng.* $P(B) = 0,30 = 30%$.
    - *b) Sai.* $P(overline(G)|A) = 1 - 0,20 = 80% != 20%$.
    - *c) Đúng.* $0,185 = 0,40·0,20 + 0,30·x + 0,30·0,15 => x = 0,20 = 20%$.
    - *d) Sai.* $P(C|G) = (0,30·0,15)/0,185 = 9/37 != 27/37$.
  ],
)
