// ══════════════════════════════════════════════════════════════════════════
// back-nc-full.typ — Sách Giải Toàn Diện / Full Solutions Guide (Parent Ed.)
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

// ══════════════════════════════════════════════════════════════════════════
// TRANG BÌA PHỤ HUYNH
// ══════════════════════════════════════════════════════════════════════════
#page(
  paper: "a4",
  margin: (x: 0pt, y: 0pt),
  fill: gradient.linear(rgb("#1E1B4B"), rgb("#0F172A"), angle: 135deg),
)[
  #set par(first-line-indent: 0em)
  #place(
    top + center,
    dy: 50pt,
    block(width: 100%, align(center)[
      #text(fill: white.transparentize(50%), size: 10pt, tracking: 6pt)[
        TOÁN NÂNG CAO LỚP 2 — ADVANCED MATH GRADE 2
      ]
      #v(0.5em)
      #text(fill: rgb("#FCD34D"), size: 14pt, weight: "bold", tracking: 3pt)[
        ⭐ BẢN DÀNH CHO PHỤ HUYNH & GIÁO VIÊN ⭐
      ]
      #v(0.4em)
      #text(fill: white.transparentize(60%), size: 9pt)[
        Teacher & Parent Edition — Not For Student Use
      ]
    ]),
  )
  #place(center + horizon, dy: -20pt)[
    #align(center)[
      #block(
        fill: white.transparentize(90%),
        inset: (x: 40pt, y: 20pt),
        radius: 20pt,
        stroke: 1pt + white.transparentize(70%),
      )[
        #text(size: 64pt)[💡]
      ]
      #v(1em)
      #text(fill: white, size: 38pt, weight: "black")[Hướng Dẫn Giải]
      #v(0.3em)
      #text(fill: white, size: 24pt, weight: "bold")[Toàn Diện]
      #v(0.5em)
      #text(fill: rgb("#BAE6FD"), size: 15pt)[Full Solutions & Explanations]
      #v(1.5em)
      #block(
        fill: rgb("#FCD34D"),
        inset: (x: 24pt, y: 10pt),
        radius: 20pt,
      )[
        #text(fill: rgb("#1E1B4B"), size: 13pt, weight: "black")[
          Quyển II — Volume II
        ]
      ]
    ]
  ]
  #place(bottom + center, dy: -40pt)[
    #align(center)[
      #grid(
        columns: 4,
        gutter: 20pt,
        text(fill: white.transparentize(30%), size: 11pt)[📖 Lời giải chi tiết],
        text(fill: white.transparentize(30%), size: 11pt)[🎯 Hướng dẫn dạy],
        text(fill: white.transparentize(30%), size: 11pt)[💡 Mẹo cho bé],
        text(fill: white.transparentize(30%), size: 11pt)[📊 Bảng tiến bộ],
      )
    ]
  ]
]

// ══════════════════════════════════════════════════════════════════════════
// LỜI NÓI ĐẦU CHO PHỤ HUYNH
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)
#set par(first-line-indent: 0em)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#FFF7ED"), rgb("#FEF9EE"), angle: 90deg),
  stroke: 2pt + C-GOLD,
  inset: (x: 24pt, y: 20pt),
  radius: 14pt,
)[
  #align(center)[
    #text(fill: C-GOLD, size: 18pt, weight: "black")[🌟 Kính Gửi Phụ Huynh & Giáo Viên]
    #v(0.2em)
    #text(fill: C-GOLD.darken(20%), size: 13pt, style: "italic")[Dear Parents and Teachers]
  ]
  #v(0.8em)
  #set text(size: 10.5pt)
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [
      Cuốn sách này là *bản hướng dẫn giải đầy đủ* cho bộ sách **Toán Nâng Cao Lớp 2 — Quyển II**. Mỗi bài toán đều có:
      - ✅ Đáp án hoặc đáp án mẫu
      - 📝 Lời giải từng bước (step-by-step)
      - 💡 Gợi ý dạy con tại nhà
      - ⚠️ Lỗi phổ biến cần tránh

      *Lưu ý:* Một số bài mở (bài vẽ, bài sáng tạo) chỉ cho đáp án mẫu. Hãy linh hoạt đánh giá theo quá trình lập luận của con.
    ],
    [
      This guide contains *complete solutions* for all key exercises in the Advanced Math Grade 2 — Volume II workbook.

      *How to use this guide:*
      - Read the solution only after the child has tried
      - Guide with questions, not answers
      - Celebrate the reasoning process, not just correct answers
      - Use the "Teaching Tips" to explain concepts in a child-friendly way

      _Mathematics is not about getting the right answer — it's about developing the habit of thinking._
    ],
  )
]

#v(1em)

// ══════════════════════════════════════════════════════════════════════════
// CHƯƠNG 1 — TƯ DUY SỐ HỌC
// ══════════════════════════════════════════════════════════════════════════
#block(
  width: 100%,
  fill: C-CH-NC.at(0),
  inset: (x: 18pt, y: 12pt),
  radius: 10pt,
)[
  #set par(first-line-indent: 0em)
  #text(fill: white, size: 15pt, weight: "black")[🧠 Chương 1: Tư Duy Số Học — Number Logic]
  #h(1em)
  #text(fill: rgb("#FCD34D"), size: 11pt)[Lời giải đầy đủ / Full Solutions]
]

#v(0.6em)

#block(fill: C-CH-NC.at(0).lighten(92%), stroke: 1pt + C-CH-NC.at(0), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(0))[BÀI 1: Dãy Số Kỳ Diệu / Number Sequences]
  #v(0.4em)
  #set text(size: 9.5pt)

  *a) 2, 5, 8, 11, \_\_, \_\_* → Quy luật: cộng thêm 3. → *14, 17*

  *b) 100, 95, 89, 82, \_\_* → Hiệu: −5, −6, −7, −8 → *74*

  *c) 1, 2, 4, 8, 16, \_\_, \_\_* → Quy luật: nhân 2 → *32, 64*

  *d) 1, 1, 2, 3, 5, 8, \_\_, \_\_* → Fibonacci: 8+5=13, 8+13=21 → *13, 21*

  *e) 3, 6, 12, 24, \_\_* → Nhân 2 → *48*

  *f) 81, 27, 9, 3, \_\_* → Chia 3 → *1*

  #text(fill: C-TEAL, size: 9pt)[
    💡 *Mẹo dạy*: Hỏi con "hiệu/thương giữa 2 số liên tiếp là bao nhiêu?" để con tự tìm quy luật thay vì đoán.
  ]
]

#v(0.5em)

#block(fill: C-CH-NC.at(0).lighten(92%), stroke: 1pt + C-CH-NC.at(0), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(0))[BÀI 2: Ô Vuông Ma Thuật / Magic Squares]
  #v(0.4em)
  #set text(size: 9.5pt)

  *Ô vuông 3×3 dùng số 1–9, tổng mỗi hàng/cột/chéo = 15:*

  Đáp án chuẩn (một trong 8 cách xoay/lật):
  #align(center)[
    #table(
      columns: (1.8cm, 1.8cm, 1.8cm),
      align: center + horizon,
      rows: (1.5cm, 1.5cm, 1.5cm),
      stroke: 1.5pt + C-CH-NC.at(0),
      fill: (x, y) => if calc.odd(x + y) { C-CH-NC.at(0).lighten(80%) } else { white },
      [2], [7], [6],
      [9], [5], [1],
      [4], [3], [8],
    )
  ]

  *Nếu tổng = 3×n (với n là tâm):* n = 15÷3 = 5. Tâm phải là 5. Các cặp bù là (2,8), (3,7), (4,6), (1,9).

  #text(fill: C-TEAL, size: 9pt)[
    💡 *Mẹo dạy*: Dạy con cách điền: đặt số 5 vào giữa, rồi dùng tính chất "tổng hai số đối xứng qua tâm = 10" để điền các số còn lại.
  ]
]

#v(0.5em)

#block(fill: C-CH-NC.at(0).lighten(92%), stroke: 1pt + C-CH-NC.at(0), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(0))[BÀI 3–4: Số Bí Ẩn & Tổng Chữ Số]
  #v(0.4em)
  #set text(size: 9.5pt)

  *Số bí ẩn:* Tôi là số có 2 chữ số. Tích chữ số = 18. Hiệu chữ số = 3.
  → Các cặp có tích 18: (2,9), (3,6). Cặp có hiệu 3: (6,3). → Số: *63 hoặc 36*.

  *Tổng chữ số:*
  - 45 → 4+5 = *9* (chia hết 9 ✓)
  - 72 → 7+2 = *9* (chia hết 9 ✓)
  - 138 → 1+3+8 = *12* (chia hết 3 ✓, không chia hết 9)
  - 256 → 2+5+6 = *13*
  - 999 → 9+9+9 = *27*

  *Quy tắc chia hết:* Số chia hết 3 khi tổng chữ số chia hết 3. Số chia hết 9 khi tổng chữ số chia hết 9.

  #text(fill: C-TEAL, size: 9pt)[
    💡 *Mẹo dạy*: Thực hành với số điện thoại của bố/mẹ — tổng chữ số có chia hết 3 không?
  ]
]

#v(0.5em)

#block(fill: C-CH-NC.at(0).lighten(92%), stroke: 1pt + C-CH-NC.at(0), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(0))[BÀI 5: So Sánh Nâng Cao & Kiểm Tra Chương 1]
  #v(0.4em)
  #set text(size: 9.5pt)

  *So sánh không cần tính:*
  - 5×8 ○ 6×7 → 40 ○ 42 → *<*
  - 3×9 ○ 4×8 → 27 ○ 32 → *<*
  - 2×15 ○ 5×6 → 30 ○ 30 → *=*

  *Kiểm tra Chương 1 — Đáp án:*

  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    [
      *Câu 1*: Số bí ẩn → 28 (hàng chục = 2, hàng đơn vị = 8; 2×8=16, 2+8=10? → thử lại: tổng=10, tích=21 → 3×7=21, 3+7=10 → *37 hoặc 73*) \
      *Câu 2*: Dãy 3,7,15,31,... → nhân 2 rồi cộng 1 → *63* \
      *Câu 3*: Ma thuật tổng=15: điền như trên \
      *Câu 4*: Tổng chữ số chia hết 9 trong {81,72,63,54,45,36,27,18,9} — tất cả đều chia hết 9!
    ],
    [
      *Câu 5*: Số có 2 chữ số, tổng chữ số=7, lớn hơn 40: 43, 52, 61, 70 → *4 số* \
      *Câu 6*: Lan=48, Hùng=40, Nam=24. Hùng>Nam: đúng. Lan−Nam=24 \
      *Câu 7*: 1+3+5+7+9 = *25* (tổng 5 số lẻ đầu = 5²) \
      *Câu 8*: 2,4,8,16,32,64 → số thứ 6 = *64*
    ],
  )
]

// ══════════════════════════════════════════════════════════════════════════
// CHƯƠNG 2 — TÍNH NHẨM THẦN TỐC
// ══════════════════════════════════════════════════════════════════════════
#v(0.8em)
#block(
  width: 100%,
  fill: C-CH-NC.at(1),
  inset: (x: 18pt, y: 12pt),
  radius: 10pt,
)[
  #set par(first-line-indent: 0em)
  #text(fill: white, size: 15pt, weight: "black")[⚡ Chương 2: Tính Nhẩm Thần Tốc — Speed Arithmetic]
  #h(1em)
  #text(fill: rgb("#FCD34D"), size: 11pt)[Lời giải đầy đủ / Full Solutions]
]

#v(0.6em)

#block(fill: C-CH-NC.at(1).lighten(92%), stroke: 1pt + C-CH-NC.at(1), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(1))[BÀI 6: Nhẩm Cộng Trừ Nhanh đến 1000]
  #v(0.4em)
  #set text(size: 9.5pt)

  *Phương pháp bù số (Complementary method):*
  - 398 + 203 = (400 − 2) + 203 = 603 − 2 = *601*
  - 800 − 397 = 800 − 400 + 3 = *403*
  - 456 + 299 = 456 + 300 − 1 = *755*
  - 702 − 298 = 700 − 300 + 2 + 2 = *404*

  *Phương pháp tách số:*
  - 346 + 237 = 300 + 246 + 237 = 300 + 483 = *583*

  #text(fill: C-TEAL, size: 9pt)[
    💡 *Mẹo dạy*: Dạy con nhận ra số gần tròn chục/trăm (như 98, 299, 401) và dùng "bù số" để tính nhanh hơn. Đây là kỹ năng nền tảng của Singapore Math.
  ]
]

#v(0.5em)

#block(fill: C-CH-NC.at(1).lighten(92%), stroke: 1pt + C-CH-NC.at(1), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(1))[BÀI 7–8: Nhân Nhanh ×9, ×11 và Mẹo Đặc Biệt]
  #v(0.4em)
  #set text(size: 9.5pt)

  *Bảng ×9 (dùng ngón tay):* 1×9=9, 2×9=18, ..., 9×9=81

  *Quy luật ×9:* Tổng 2 chữ số kết quả luôn bằng 9. Chữ số hàng chục = số nhân − 1.
  - Ví dụ: 7×9 → hàng chục = 6, hàng đơn vị = 9−6 = 3 → *63*

  *Bảng ×11:* 11×n = n kẹp giữa (với n ≤ 9): 11×7 = 77; 11×8 = 88
  - Với n = 2 chữ số: 11×23 = 2(2+3)3 = *253*
  - 11×36 = 3(3+6)6 = *396*; 11×47 = 4(4+7)7 = 4(11)7 → nhớ 1 → *517*

  *Đáp án nhanh:*
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    [9×3=*27*; 9×6=*54*; 9×8=*72*], [11×4=*44*; 11×7=*77*; 11×9=*99*], [25×4=*100*; 25×8=*200*; 50×6=*300*],
  )

  #text(fill: C-TEAL, size: 9pt)[
    💡 *Mẹo dạy*: Với ×25: nhớ 25×4=100, nên 25×n = 100×n÷4. Ví dụ 25×12 = 1200÷4 = 300.
  ]
]

#v(0.5em)

#block(fill: C-CH-NC.at(1).lighten(92%), stroke: 1pt + C-CH-NC.at(1), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(1))[BÀI 9–10: Chia Có Dư & Thứ Tự Phép Tính]
  #v(0.4em)
  #set text(size: 9.5pt)

  *Chia có dư:*
  - 17 ÷ 5 = *3 dư 2* (vì 5×3=15, 17−15=2)
  - 29 ÷ 4 = *7 dư 1* (vì 4×7=28, 29−28=1)
  - 57 ÷ 8 = *7 dư 1* (vì 8×7=56, 57−56=1)
  - 100 ÷ 7 = *14 dư 2*

  *Thứ tự phép tính (BODMAS):* Ngoặc → Nhân/Chia → Cộng/Trừ
  - (15+9)÷3−4×2 = 24÷3−8 = 8−8 = *0*
  - 5×(8−3)+7 = 5×5+7 = 25+7 = *32*
  - 100−(4+6)×8 = 100−80 = *20*

  #text(fill: C-TEAL, size: 9pt)[
    💡 *Mẹo dạy*: Nhớ: "Nhân chia trước, cộng trừ sau, ngoặc đơn ưu tiên nhất." Dùng trò chơi tạo biểu thức với 4 chữ số (ví dụ: bộ bài mưu mẹo) để luyện tập vui hơn.
  ]
]

// ══════════════════════════════════════════════════════════════════════════
// CHƯƠNG 3 — CHIẾN LƯỢC GIẢI TOÁN
// ══════════════════════════════════════════════════════════════════════════
#v(0.8em)
#block(
  width: 100%,
  fill: C-CH-NC.at(2),
  inset: (x: 18pt, y: 12pt),
  radius: 10pt,
)[
  #set par(first-line-indent: 0em)
  #text(fill: white, size: 15pt, weight: "black")[🎯 Chương 3: Chiến Lược Giải Toán — Problem Strategies]
  #h(1em)
  #text(fill: rgb("#FCD34D"), size: 11pt)[Lời giải đầy đủ / Full Solutions]
]

#v(0.6em)

#block(fill: C-CH-NC.at(2).lighten(92%), stroke: 1pt + C-CH-NC.at(2), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(2))[Sơ Đồ Thanh (Bar Model) — Phương pháp Singapore]
  #v(0.4em)
  #set text(size: 9.5pt)

  *Bài mẫu:* An có 24 viên bi. Bình có gấp 3 lần An. Hỏi hai bạn có tất cả bao nhiêu viên?

  #align(center)[
    #canvas(length: 0.8cm, {
      import draw: *
      rect((0, 1.5), (2, 2), fill: rgb("#BBF7D0"), stroke: 1.5pt + rgb("#065F46"), name: "an")
      content((1, 1.75), text(size: 8pt)[An: 24])
      rect((0, 0.5), (6, 1), fill: rgb("#6EE7B7"), stroke: 1.5pt + rgb("#065F46"), name: "binh")
      content((3, 0.75), text(size: 8pt)[Bình: 24×3=72])
      content((-0.8, 1.75), text(size: 8pt, fill: rgb("#065F46"))[1 phần])
      content((-0.8, 0.75), text(size: 8pt, fill: rgb("#065F46"))[3 phần])
    })
  ]

  Bình = 24 × 3 = 72. Tổng = 24 + 72 = *96 viên bi.*

  *Bài 3 bạn:* An: x, Bình: 3x, Châu: 3x − 12. Tổng = x + 3x + 3x − 12 = 7x − 12 = 68 → 7x = 80 → x ≈ 11. Thử lại: x = 11.4 (không nguyên) → *xem lại đề: tổng = 74 thì x=12*.

  #text(fill: C-TEAL, size: 9pt)[
    💡 *Mẹo dạy*: Luôn vẽ sơ đồ thanh trước khi lập phương trình. Con lớp 2-3 thường hiểu sơ đồ hơn ký hiệu đại số.
  ]
]

#v(0.5em)

#block(fill: C-CH-NC.at(2).lighten(92%), stroke: 1pt + C-CH-NC.at(2), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(2))[Chiến Lược Làm Ngược / Work Backwards]
  #v(0.4em)
  #set text(size: 9.5pt)

  *Bài:* Sau khi tặng 1/3 số bi cho Lan và cho Hùng 8 viên, Nam còn 20 viên. Nam có bao nhiêu ban đầu?

  *Giải ngược:* Cuối → Đầu
  - Còn lại 20 viên (sau khi cho Hùng 8)
  - Trước khi cho Hùng: 20 + 8 = 28 viên
  - Đây là 2/3 số ban đầu (đã cho Lan 1/3)
  - Số ban đầu: 28 ÷ 2 × 3 = *42 viên*

  *Kiểm tra:* 42 → cho 1/3 = 14 → còn 28 → cho 8 → còn 20 ✓

  *Các bài làm ngược khác:*
  - Bài 24b: 12 → ngược (+3) → 9... → *x₀ = 28*
  - Quy tắc: Đảo chiều tất cả phép tính (cộng↔trừ, nhân↔chia)

  #text(fill: C-TEAL, size: 9pt)[
    💡 *Mẹo dạy*: Cho con đọc bài từ câu cuối ngược lên. Vẽ mũi tên ngược chiều và ghi từng bước đảo ngược.
  ]
]

#v(0.5em)

#block(fill: C-CH-NC.at(2).lighten(92%), stroke: 1pt + C-CH-NC.at(2), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(2))[Chiến Lược Thử – Điều Chỉnh / Guess & Check]
  #v(0.4em)
  #set text(size: 9.5pt)

  *Bài:* 6 xe đạp (2 bánh) và xe ba bánh. Tổng 30 bánh. Tìm số mỗi loại.

  Gọi số xe đạp = a, xe ba bánh = b → 2a + 3b = 30.

  #table(
    columns: (2cm, 2cm, 3cm, 2.5cm),
    align: center,
    inset: 6pt,
    fill: (x, y) => if y == 0 { C-CH-NC.at(2) } else if y == 3 { rgb("#D1FAE5") } else { white },
    stroke: 0.5pt + C-MID,
    text(fill: white)[Xe đạp], text(fill: white)[Ba bánh], text(fill: white)[Tổng bánh], text(fill: white)[Đúng?],
    [10], [?], [20+?=30 → b=10/3], [✗],
    [9], [4], [18+12=30], [✓],
    [6], [6], [12+18=30], [✓],
  )

  → *Nhiều đáp án*: (a=9,b=4); (a=6,b=6); (a=3,b=8); (a=0,b=10). Đề cần thêm điều kiện!

  #text(fill: rgb("#991B1B"), size: 9pt)[
    ⚠️ *Lưu ý cho giáo viên*: Bài toán này có nhiều đáp án. Nếu đề bài chỉ rõ tổng số xe = 13, thì: a + b = 13 và 2a + 3b = 30 → *a=9, b=4*.
  ]
]

// ══════════════════════════════════════════════════════════════════════════
// CHƯƠNG 4 — HÌNH HỌC NÂNG CAO
// ══════════════════════════════════════════════════════════════════════════
#v(0.8em)
#block(
  width: 100%,
  fill: C-CH-NC.at(3),
  inset: (x: 18pt, y: 12pt),
  radius: 10pt,
)[
  #set par(first-line-indent: 0em)
  #text(fill: white, size: 15pt, weight: "black")[📐 Chương 4: Hình Học Nâng Cao — Advanced Geometry]
  #h(1em)
  #text(fill: rgb("#FCD34D"), size: 11pt)[Lời giải đầy đủ / Full Solutions]
]

#v(0.6em)

#block(fill: C-CH-NC.at(3).lighten(92%), stroke: 1pt + C-CH-NC.at(3), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(3))[Đếm Hình & Chu Vi — Counting Shapes & Perimeter]
  #v(0.4em)
  #set text(size: 9.5pt)

  *Đếm hình chữ nhật trong lưới m×n:*
  - Số HCN = C(m+1,2) × C(n+1,2) = m(m+1)/2 × n(n+1)/2

  *Lưới 3×4:* HCN = (3×4/2) × (4×5/2) = 6 × 10 = *60 hình chữ nhật*

  *Lưới 4×4 (hình vuông):* = (4×5/2)² = 100 hình (trong đó có hình vuông và hình chữ nhật)

  *Hình vuông trong lưới 4×4:* 1×1=16, 2×2=9, 3×3=4, 4×4=1 → *30 hình vuông*

  *Đối xứng:*
  - Chữ A, H, M, O, T, U, V, W, X, Y → trục đứng
  - Chữ B, C, D, E, K → trục ngang
  - Hình vuông: 4 trục; Hình chữ nhật: 2 trục; Hình tròn: ∞ trục

  *Chu vi hình L (gồm HCN 6×4 bỏ góc 2×3):*
  P = (6+4+3+2+3+6)×... → Tính cạnh từng bước = *20 cm*

  #text(fill: C-TEAL, size: 9pt)[
    💡 *Mẹo dạy*: Dạy con đánh số hàng và cột, sau đó đếm hệ thống (đừng đếm lộn xộn). Với hình ghép phức tạp, hãy cắt giấy rồi thực hành trực tiếp.
  ]
]

#v(0.5em)

#block(fill: C-CH-NC.at(3).lighten(92%), stroke: 1pt + C-CH-NC.at(3), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(3))[Diện Tích — Area Problems]
  #v(0.4em)
  #set text(size: 9.5pt)

  *Bài vườn rau:* Tăng dài 4m, diện tích tăng 36m² → chiều rộng = 36÷4 = *9m*. Tăng rộng 3m, diện tích tăng 33m² → chiều dài = 33÷3 = *11m*. Diện tích ban đầu = 11×9 = *99m²*.

  *Diện tích hình L:* Cách 1 — Tính HCN lớn rồi trừ. Cách 2 — Chia thành 2 HCN nhỏ.
  - Hình L = (8×6) − (3×4) = 48 − 12 = *36 cm²*

  *Diện tích tam giác:* Bằng nửa HCN cùng đáy-chiều cao. S = đáy × cao ÷ 2.

  #text(fill: C-TEAL, size: 9pt)[
    💡 *Mẹo dạy*: Với bài toán tăng kích thước, dùng sơ đồ vẽ "phần tăng thêm" (hình chữ nhật mỏng) để con thấy trực giác tại sao chiều dài × chiều rộng tăng = phần tăng diện tích.
  ]
]

// ══════════════════════════════════════════════════════════════════════════
// CHƯƠNG 5 — THỬ THÁCH TƯ DUY
// ══════════════════════════════════════════════════════════════════════════
#v(0.8em)
#block(
  width: 100%,
  fill: C-CH-NC.at(4),
  inset: (x: 18pt, y: 12pt),
  radius: 10pt,
)[
  #set par(first-line-indent: 0em)
  #text(fill: white, size: 15pt, weight: "black")[🏆 Chương 5: Thử Thách Tư Duy — Thinking Challenges]
  #h(1em)
  #text(fill: rgb("#FCD34D"), size: 11pt)[Lời giải đầy đủ / Full Solutions]
]

#v(0.6em)

#block(fill: C-CH-NC.at(4).lighten(92%), stroke: 1pt + C-CH-NC.at(4), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(4))[Đếm Tổ Hợp / Combinatorics Counting]
  #v(0.4em)
  #set text(size: 9.5pt)

  *Bắt tay:* n người bắt tay nhau = n(n−1)/2.
  - 5 người: 5×4÷2 = *10 cái bắt tay*
  - 10 người: 10×9÷2 = *45 cái*

  *Số có 4 chữ số từ {1,2,3,4}, mỗi số dùng đúng 1 lần:*
  - Tổng số: 4! = 4×3×2×1 = *24 số*
  - Mỗi chữ số xuất hiện ở mỗi vị trí: 24÷4 = 6 lần
  - Tổng = 6 × (1+2+3+4) × 1111 = 6 × 10 × 1111 = *66,660*

  *Tổ hợp màu sắc:* Từ 5 màu chọn 3 màu không quan tâm thứ tự = C(5,3) = 10 cách.

  #text(fill: C-TEAL, size: 9pt)[
    💡 *Mẹo dạy*: Cách đơn giản nhất để dạy đếm tổ hợp: liệt kê hệ thống. Đối với bài bắt tay, vẽ sơ đồ mạng (dot diagram) rồi đếm đường nối.
  ]
]

#v(0.5em)

#block(fill: C-CH-NC.at(4).lighten(92%), stroke: 1pt + C-CH-NC.at(4), inset: 14pt, radius: 8pt)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-CH-NC.at(4))[Olympiad Classics — Bài Toán Kinh Điển]
  #v(0.4em)
  #set text(size: 9.5pt)

  *Bài Gauss:* 1+2+3+...+100 = 100×101÷2 = *5050*. (Cặp 1+100=101, có 50 cặp.)

  *Tháp Hà Nội (Tower of Hanoi):* Với n đĩa cần 2ⁿ−1 bước. n=3 → 7 bước. n=10 → 1023 bước.

  *Fibonacci ứng dụng:* Dãy thỏ của Leonardo Fibonacci (1202): Tháng 1→1 đôi, 2→1, 3→2, 4→3, 5→5, 6→8, 7→13... Số thứ 10 = *55*.

  *Bài tổng kết phần C1:* 100 học sinh thi 3 môn: Đậu Toán=72, KH=58, TA=65. Không ai đậu cả 3.
  - Tổng = 72+58+65 = 195
  - Theo nguyên lý bù trừ (inclusion-exclusion): |A∪B∪C| = 195 − (đậu 2 môn) − 2×0 ≤ 100
  - Đậu ít nhất 1 = 100 → đậu 2 môn = 195 − 100 = *95 học sinh* đậu đúng 2 môn

  #text(fill: C-TEAL, size: 9pt)[
    💡 *Mẹo dạy*: Dùng sơ đồ Venn 3 vòng tròn để minh họa. Cho con tô màu các vùng giao nhau.
  ]
]

// ══════════════════════════════════════════════════════════════════════════
// ĐÁP ÁN ĐỀ KIỂM TRA
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)
#block(
  width: 100%,
  fill: gradient.linear(rgb("#1E1B4B"), rgb("#312E81"), angle: 90deg),
  inset: (x: 18pt, y: 14pt),
  radius: 12pt,
)[
  #set par(first-line-indent: 0em)
  #align(center)[
    #text(fill: white, size: 17pt, weight: "black")[📋 Đáp Án Các Đề Thi / Exam Answer Keys]
  ]
]

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,

  block(fill: C-LAVENDER, stroke: 1.5pt + C-PURPLE, inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-PURPLE, weight: "bold", size: 11pt)[📝 Đề Thi Mock Exam 1]
    #v(0.4em)
    #set text(size: 9pt)
    *Phần 1:* 1)17,20 2)74 3)48,64 4)601 5)403 6)54,63,72 7)44,77 8)3 dư 1 9)36 10)= < > \
    *Phần 2:* 11)50 12)7 13)36 14)72 15)35 16)8,3,9 17)6 cách 18)14 \
    *Phần 3:* 19)Bình=18, An=6, Châu=30 20)Tuổi bố=37, con=9
  ],

  block(fill: C-LAVENDER, stroke: 1.5pt + C-PURPLE, inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-PURPLE, weight: "bold", size: 11pt)[📝 Đề Thi Mock Exam 2]
    #v(0.4em)
    #set text(size: 9pt)
    *Phần 1:* 1)63 2)100 3)301 4)9 5)27 6)5050 7)55 8)23 9)60 10)72 \
    *Phần 2:* 11)3 chữ số 12)28 số 13)> < = 14)30 bắt tay 15)20 và 30 \
    *Phần 3:* 16)Tiết kiệm 8 ngày 17)An=10, Bình=30, Châu=18 18)x=42
  ],
)

#v(0.8em)

#block(fill: rgb("#F0FDF4"), stroke: 1.5pt + C-CH-NC.at(2), inset: 14pt, radius: 10pt)[
  #set par(first-line-indent: 0em)
  #text(fill: C-CH-NC.at(2), weight: "bold", size: 11pt)[📝 Đề Tổng Kết Cuối Sách — Final Exam]
  #v(0.4em)
  #set text(size: 9pt)
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    [
      *Phần A (20 điền):*
      1) 162; 2) 74; 3) 21; 4) 601; 5) 403; 6) 110;
      7) 7 dư 1; 8) 29,38,47; 9) S=36, P=26; 10) 12 số;
      11) 55; 12) 23; 13) 55 hình; 14) 10 lần bắt tay;
      15) A=4, B=3; 16) 9; 17) 55; 18) 6; 19) 6; 20) 0
    ],
    [
      *Phần B (bài toán):*
      B1) 840−135+270−97 = *878 kg*
      B2) An=8, Bình=24, Châu=12 *(xem bar model)*
      B3) 42 viên *(làm ngược)*
      B4) Dài=11m, Rộng=9m, S=99m²
      B5) a) 24 số; b) Tổng = 66,660

      *Phần C (Olympiad):*
      C1) *95 học sinh* đậu đúng 2 môn
      C2) Ma thuật tích: Không tồn tại với 1–9 *(thực ra tích khác nhau — bài tư duy mở)*
    ],
  )
]

// ══════════════════════════════════════════════════════════════════════════
// BẢNG THEO DÕI TIẾN BỘ
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)
#block(
  width: 100%,
  fill: gradient.linear(rgb("#0F172A"), rgb("#1E3A8A"), angle: 90deg),
  inset: (x: 18pt, y: 14pt),
  radius: 12pt,
)[
  #set par(first-line-indent: 0em)
  #align(center)[
    #text(fill: white, size: 17pt, weight: "black")[📊 Bảng Theo Dõi Tiến Bộ — Progress Tracker]
    #v(0.2em)
    #text(fill: rgb("#BAE6FD"), size: 11pt)[Dành cho Phụ Huynh / For Parents to Track]
  ]
]

#v(0.8em)

#set text(size: 10pt)

#table(
  columns: (3cm, 4cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm),
  align: center + horizon,
  inset: 9pt,
  stroke: 0.5pt + C-MID,
  fill: (x, y) => {
    if y == 0 { rgb("#1E3A8A") } else if y == 1 or y == 3 or y == 5 or y == 7 { C-CH-NC.at(0).lighten(90%) } else {
      white
    }
  },
  text(fill: white, weight: "bold")[Chương],
  text(fill: white, weight: "bold")[Kỹ năng chính],
  text(fill: white, weight: "bold")[Lần 1],
  text(fill: white, weight: "bold")[Lần 2],
  text(fill: white, weight: "bold")[Lần 3],
  text(fill: white, weight: "bold")[Thành thạo],

  [🧠 Ch1], [Dãy số, ô vuông ma thuật], [\_\_/10], [\_\_/10], [\_\_/10], [☐ ☑],
  [⚡ Ch2], [Nhẩm ×9 ×11, bù số], [\_\_/10], [\_\_/10], [\_\_/10], [☐ ☑],
  [🎯 Ch3], [Bar model, làm ngược], [\_\_/10], [\_\_/10], [\_\_/10], [☐ ☑],
  [📐 Ch4], [Đếm hình, diện tích], [\_\_/10], [\_\_/10], [\_\_/10], [☐ ☑],
  [🏆 Ch5], [Đếm, Olympiad logic], [\_\_/10], [\_\_/10], [\_\_/10], [☐ ☑],
  [📋 ĐT], [Đề thi tổng hợp], [\_\_/40], [\_\_/40], [\_\_/40], [☐ ☑],
)

#v(1em)

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,
  block(fill: C-MINT, stroke: 1pt + C-TEAL, inset: 14pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-TEAL, weight: "bold")[📅 Lịch Học Gợi Ý]
    #v(0.4em)
    #set text(size: 9.5pt)
    *Tuần 1–2*: Chương 1 (Tư duy số) \
    *Tuần 3–4*: Chương 2 (Tính nhẩm) \
    *Tuần 5–7*: Chương 3 (Giải toán) \
    *Tuần 8–9*: Chương 4 (Hình học) \
    *Tuần 10–11*: Chương 5 (Thử thách) \
    *Tuần 12*: Ôn tập + Đề thi tổng kết
  ],
  block(fill: C-PEACH, stroke: 1pt + C-ORANGE, inset: 14pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-ORANGE, weight: "bold")[💡 Lời Khuyên Phụ Huynh]
    #v(0.4em)
    #set text(size: 9.5pt)
    ✅ Học 20–30 phút mỗi ngày, đều đặn \
    ✅ Khen ngợi quá trình, không chỉ kết quả \
    ✅ Cho con giải thích lại cho bố/mẹ nghe \
    ✅ Không vội vàng xem đáp án \
    ✅ Kết hợp với trò chơi và thực tế \
    ✅ Thỉnh thoảng học cùng con — con sẽ dạy lại bạn!
  ],
)
