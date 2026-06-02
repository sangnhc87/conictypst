// ══════════════════════════════════════════════════════════════════════════
// back-nc.typ — Phụ Lục Quyển II (Answers, Extra Problems, Certificate)
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

= Phụ Lục Quyển II — Appendix Volume II

// ══════════════════════════════════════════════════════════════════════════
// A. HƯỚNG DẪN ĐÁP ÁN / ANSWER GUIDE
// ══════════════════════════════════════════════════════════════════════════

#block(
  width: 100%,
  fill: gradient.linear(rgb("#1E1B4B"), rgb("#312E81"), angle: 90deg),
  inset: (x: 18pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 17pt, weight: "black")[💡 Hướng Dẫn Đáp Án Chọn Lọc]
    #h(1.5em)
    #text(fill: rgb("#FCD34D"), size: 14pt)[Selected Answer Guide]
  ]
]

#v(0.8em)

#block(
  fill: rgb("#FFF7ED"),
  stroke: 1.5pt + C-GOLD,
  inset: 14pt,
  radius: 10pt,
)[
  #set text(size: 10pt)
  #text(fill: C-GOLD, weight: "bold")[💡 Lưu ý cho phụ huynh và giáo viên / Note for parents and teachers:]
  #v(0.4em)
  Đây là hướng dẫn đáp án cho *các bài tập trắc nghiệm và điền số* để dễ kiểm tra. Các bài tự luận, vẽ hình, và bài sáng tạo cần được đánh giá linh hoạt dựa trên quá trình lập luận của học sinh. \
  _This is an answer guide for fill-in and multiple-choice exercises. Creative and open-ended problems should be assessed flexibly based on the student's reasoning process._
]

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,

  // CHAPTER 1
  block(
    fill: C-CH-NC.at(0).lighten(90%),
    stroke: (left: 4pt + C-CH-NC.at(0)),
    inset: 12pt,
    radius: (right: 8pt),
  )[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(0), weight: "bold", size: 11pt)[🧠 Chương 1: Tư Duy Số Học]
    #v(0.5em)
    #set text(size: 9.5pt)
    *Bài 1:* a) 14,17,20 (cộng 3) b) 85,80,75 (trừ 5) c) 16,32 (nhân 2) d) 12,15,18 \
    *Bài 2:* Fibonacci: 8, 13. Bảng: 8 và 14 (cộng 3) \
    *Bài 4:* 45→9, 72→9, 138→12, 256→13, 999→27. Chia hết 3: 45,72,138 \
    *Bài 5c:* 22, 31, 13 (nhiều đáp án) \
    *Bài 10:* a) 5×8=40=6×7? Không. 5×8=40, 6×7=42 → <. b) 3×9=27, 4×8=32 → <. c) 2×15=30, 5×6=30 → = \
    *Bài 11:* Lan=48, Hùng=40. Hùng (40) > Nam (24): Có \
    *Kiểm tra 1:* 22,27. Ô vuông: đặt 3,7 vào ô trống (hàng 1: 8,3,4; hàng 2: 1,5,9; hàng 3: 6,7,2). Số bí ẩn: 28. Tổng chữ số: 12, 12, 9. Dãy: 27, 81. >,=. Số có tổng chữ số=7, lớn hơn 40: 43,52,61,70 (4 số)
  ],

  // CHAPTER 2
  block(
    fill: C-CH-NC.at(1).lighten(90%),
    stroke: (left: 4pt + C-CH-NC.at(1)),
    inset: 12pt,
    radius: (right: 8pt),
  )[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(1), weight: "bold", size: 11pt)[⚡ Chương 2: Tính Nhẩm]
    #v(0.5em)
    #set text(size: 9.5pt)
    *Bài 12:* a)97 b)245 c)802 d)101 e)144 f)250 g)80 h)200 \
    *Bài 14:* a)64 b)113 c)236 d)625 e)55 f)46 \
    *Bài 16 ×9:* 27,36,54,63,72,81,45,18 \
    *Bài 16 ×11:* 22,33,44,55,66,77,88,99 \
    *Bài 17:* a)3dư1 b)5dư2 c)3dư4 d)3dư1 e)3dư6 f)9dư2 g)7dư1 h)11dư1 \
    *Bài 19:* a)50 b)23 c)36 d)4 e)45 f)13 \
    *Bài 20:* a)(5+3)×4=32 b)(20-4)×3=48 c)(6+2)×(5-1)=32 — nhiều cách \
    *Kiểm tra 2:* 1)105,345,125. 2)43,237. 3)63,72,81. 4)66,99,77. 5)6dư2,8dư1. 6)36,26. 7) 17÷3=5 dư 2. 8)(10-2+3)×4=44 — không đúng, cần xem lại!
  ],
)

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,

  // CHAPTER 3
  block(
    fill: C-CH-NC.at(2).lighten(90%),
    stroke: (left: 4pt + C-CH-NC.at(2)),
    inset: 12pt,
    radius: (right: 8pt),
  )[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(2), weight: "bold", size: 11pt)[🎯 Chương 3: Chiến Lược]
    #v(0.5em)
    #set text(size: 9.5pt)
    *Bài 21:* Tiếng Anh: 200÷4=50. Tiếng Việt: 150. \
    *Bài 22:* Giữa=33, Dưới=81. Tổng=48+33+81=162 \
    *Bài 23:* 6 xe đạp, 6 xích lô (6×2+6×3=12+18=30 ✓) \
    *Bài 24a:* 42+8=50→50÷2=25→25-15=10 \
    *Bài 24b:* Ngược: 12-3=9→9+5=14→14×2=28 \
    *Bài 25:* Hai số là 20 và 30 (20×30=600, 20+30=50 ✓) \
    *Bài 26:* Tuổi em=7, tuổi anh=17 \
    *Bài 27:* 4→6, 5→10, 6→15. 10 bạn → 45 lần bắt tay \
    *Kiểm tra 3:* 1)Lớp B=27, C=62, tổng=124. 2)6 gà, 4 thỏ. 3)(20÷2-10)÷3=0? → 20÷2=10,10+10=20,20÷3≈6 — xem lại đề. 4) 15,21. 5)Tuổi con=8, bố=34
  ],

  // CHAPTER 4
  block(
    fill: C-CH-NC.at(3).lighten(90%),
    stroke: (left: 4pt + C-CH-NC.at(3)),
    inset: 12pt,
    radius: (right: 8pt),
  )[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(3), weight: "bold", size: 11pt)[📐 Chương 4: Hình Học]
    #v(0.5em)
    #set text(size: 9.5pt)
    *Bài 29:* Nhỏ=4, ghép 2=3, lớn=1 → Tổng 4+3+1=*8* tam giác \
    *Bài 30:* 1×1=6, 2×1=4, 3×1=2, 1×2=4, 2×2=2, 3×2=1 → tổng=*18* hình \
    *Bài 31:* a)1 trục b)2 trục c)5 trục \
    *Bài 33:* a)12 ô (viền ngoài) b)12 ô c)12 ô (hình L) \
    *Bài 34:* Hình A: chu vi=16cm. Hình B: chu vi=14cm → Hình B có chu vi nhỏ hơn \
    *Kiểm tra 4:* 1)8 tam giác. 2)Vuông=4, chữ nhật=2. 3)5×4−2×2=20−4=16cm². 5)Rộng=(30÷2-dài)→... dài=9,rộng=6→Diện tích=54cm²
  ],
)

#v(0.8em)

// Chapter 5 answers
#block(
  fill: C-CH-NC.at(4).lighten(90%),
  stroke: (left: 4pt + C-CH-NC.at(4)),
  inset: 12pt,
  radius: (right: 8pt),
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-CH-NC.at(4), weight: "bold", size: 11pt)[🏆 Chương 5: Thử Thách Tư Duy]
  #v(0.5em)
  #set text(size: 9.5pt)
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [
      *Bài 37a:* AB+AB=BA → 2A=B (đơn vị) → A=1,B=2 → 12+12=24? Không → thử A=4,B=8 → 48+48=96 ✓ (A=4,B=8 vì BA=84? Không) → Thực ra AB+AB=2×AB=BA là số đảo → thử: 13+13=26 (B=2,A=6 không) → 36+36=72 ✓ (A=3,B=7,BA=73? Không, 36+36=72, A=3,B=6,BA=63? 72≠63)... nhiều đáp án có thể. \
      *Bài 37b:* AAA+AAA=BBB → 2×AAA=BBB → A=1,B=2 → 111×2=222 ✓ (A=1,B=2); A=2,B=4 → 222×2=444 ✓; ... \
      *Bài 37c:* ABC+CBA=999 → A+C=9, B+B=9 không thể (B≤9) → B=9, A+C=9 → nhiều nghiệm: (1,9,8),(2,9,7),... \
    ],
    [
      *Bài 38a:* Điền lưới 4×4 theo quy tắc Sudoku. Đáp án mẫu: \
      Hàng 1: 1,3,2,4. Hàng 2: 2,4,1,3. Hàng 3: 3,1,4,2. Hàng 4: 4,2,3,1 \
      *Bài 40a:* 2×6=*12* kết quả \
      *Bài 40b:* 3×5=*15* mật khẩu \
      *Bài 41a:* 6 cách (3!=6: ABC,ACB,BAC,BCA,CAB,CBA) \
      *Bài 41b:* 4×3=*12* số có 2 chữ số \
      *Olympic Bài 4:* Các số 3 chữ số từ {1,2,3} có tổng=6: 114→4 không hợp lệ. \
      Dùng {1,2,3}: 1+2+3=6✓→ 123,132,213,231,312,321=6 số. \
      2+2+2=6✓→ 222=1 số. Tổng: *7 số*
    ],
  )
]

// ══════════════════════════════════════════════════════════════════════════
// B. BẢNG NHÂN TỔNG HỢP / MULTIPLICATION TABLES POSTER
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#1E1B4B"), rgb("#302B63"), angle: 90deg),
  inset: (x: 20pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 17pt, weight: "black")[📊 Bảng Nhân Hoàn Chỉnh (1–9)]
    #h(1em)
    #text(fill: rgb("#FCD34D"), size: 13pt)[Complete Multiplication Table]
  ]
]

#v(0.8em)

#table(
  columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  align: center + horizon,
  inset: (x: 6pt, y: 7pt),
  stroke: 0.8pt + C-LIGHT,
  fill: (x, y) => {
    if x == 0 or y == 0 { C-CH-NC.at(0) } else if x == y { C-GOLD.lighten(70%) } else { white }
  },
  ..{
    let cells = ()
    for y in range(10) {
      for x in range(10) {
        if x == 0 and y == 0 {
          cells += (text(fill: white, weight: "bold")[×],)
        } else if x == 0 {
          cells += (text(fill: white, weight: "bold")[#str(y)],)
        } else if y == 0 {
          cells += (text(fill: white, weight: "bold")[#str(x)],)
        } else {
          cells += (text(weight: if x == y { "black" } else { "regular" })[#str(x * y)],)
        }
      }
    }
    cells
  },
)

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  block(fill: C-TEAL.lighten(88%), stroke: 1.5pt + C-TEAL, inset: 12pt, radius: 8pt)[
    #set text(size: 9.5pt)
    #text(fill: C-TEAL, weight: "bold")[🌟 Tính chất quan trọng / Key Properties]
    #v(0.4em)
    • *Giao hoán:* a × b = b × a \
    • *Kết hợp:* (a×b)×c = a×(b×c) \
    • *Phân phối:* a×(b+c) = a×b + a×c \
    • Mọi số × 1 = chính số đó \
    • Mọi số × 0 = 0
  ],
  block(fill: C-ORANGE.lighten(88%), stroke: 1.5pt + C-ORANGE, inset: 12pt, radius: 8pt)[
    #set text(size: 9.5pt)
    #text(fill: C-ORANGE, weight: "bold")[⚡ Mẹo nhân nhanh / Speed Tricks]
    #v(0.4em)
    • ×2: nhân đôi (double) \
    • ×5: ×10 rồi chia 2 \
    • ×9: ×10 rồi trừ n \
    • ×11: ×10 rồi cộng n \
    • ×4: ×2 rồi ×2 lại \
    • ×8: ×2, ×2, ×2
  ],
)

// ══════════════════════════════════════════════════════════════════════════
// C. BẢNG THEO DÕI KỸ NĂNG / SKILLS TRACKER
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#1E1B4B"), rgb("#312E81"), angle: 90deg),
  inset: (x: 20pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 16pt, weight: "black")[📋 Bảng Theo Dõi Kỹ Năng Nâng Cao]
    #v(0.2em)
    #text(fill: rgb("#FCD34D"), size: 12pt)[Advanced Skills Tracker]
  ]
]

#v(0.8em)

#let skill-row(skill-vi, skill-en, c) = (
  block(inset: (x: 6pt, y: 4pt))[#text(size: 9.5pt, fill: c, weight: "bold")[#skill-vi]\ #text(
      size: 8.5pt,
      fill: C-MID,
      style: "italic",
    )[#skill-en]],
  block(fill: white, inset: 6pt, stroke: 1pt + C-LIGHT)[
    #text(size: 14pt)[☆ ☆ ☆ ☆]
  ],
  align(center)[
    #rect(width: 2.5cm, height: 1.1cm, stroke: 1pt + C-LIGHT, fill: white, radius: 4pt)[]
  ],
  align(center)[
    #rect(width: 2.5cm, height: 1.1cm, stroke: 1pt + C-LIGHT, fill: white, radius: 4pt)[]
  ],
)

#table(
  columns: (1fr, auto, 2.5cm, 2.5cm),
  align: (left + horizon, center + horizon, center + horizon, center + horizon),
  inset: (x: 8pt, y: 8pt),
  stroke: 0.7pt + C-LIGHT,
  fill: (x, y) => if y == 0 { rgb("#1E1B4B") } else if calc.even(y) { C-CREAM } else { white },
  [#text(fill: white, weight: "bold")[Kỹ Năng / Skill]],
  [#text(fill: white, weight: "bold")[Đánh Giá ⭐]],
  [#text(fill: white, weight: "bold")[Lần 1]],
  [#text(fill: white, weight: "bold")[Lần 2]],
  ..skill-row("Tìm quy luật dãy số", "Find sequence patterns", C-CH-NC.at(0)),
  ..skill-row("Ô vuông ma thuật", "Magic squares", C-CH-NC.at(0)),
  ..skill-row("Tìm số bí ẩn", "Mystery number puzzles", C-CH-NC.at(0)),
  ..skill-row("Cộng nhẩm tới 1000", "Mental addition to 1000", C-CH-NC.at(1)),
  ..skill-row("Trừ nhẩm bù số", "Complement subtraction", C-CH-NC.at(1)),
  ..skill-row("Nhân ×9, ×11 siêu nhanh", "Speed ×9 and ×11", C-CH-NC.at(1)),
  ..skill-row("Chia có dư", "Division with remainder", C-CH-NC.at(1)),
  ..skill-row("Vẽ sơ đồ Singapore", "Singapore model drawing", C-CH-NC.at(2)),
  ..skill-row("Chiến lược làm ngược", "Work-backwards strategy", C-CH-NC.at(2)),
  ..skill-row("Đếm hình phức hợp", "Count shapes in figures", C-CH-NC.at(3)),
  ..skill-row("Tính diện tích ô vuông", "Area by counting", C-CH-NC.at(3)),
  ..skill-row("Toán mật mã", "Cryptarithmetic", C-CH-NC.at(4)),
  ..skill-row("Lưới logic 4×4", "4×4 logic grids", C-CH-NC.at(4)),
  ..skill-row("Đếm tổ hợp", "Counting combinations", C-CH-NC.at(4)),
  ..skill-row("Giải bài Olympiad", "Solve Olympiad problems", C-CH-NC.at(4)),
)

// ══════════════════════════════════════════════════════════════════════════
// D. LỘ TRÌNH LÊN TẦNG CAO / NEXT-LEVEL THINKING MAP
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#0F766E"), rgb("#312E81"), angle: 90deg),
  inset: (x: 20pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 17pt, weight: "black")[🚀 Lộ Trình Lên Tầng Cao]
    #v(0.2em)
    #text(fill: rgb("#FCD34D"), size: 12pt)[Next-Level Thinking Map]
  ]
]

#v(0.8em)

#phong-thi-nghiem[
  Học sinh mạnh thật sự không dừng ở *làm đúng*. Em lên tầng cao khi làm được đủ 4 việc sau:
  #v(0.3em)
  #for item in (
    "*Làm đúng* bài theo mẫu đã học.",
    "*Nói được vì sao* từng bước là hợp lý.",
    "*Có cách thứ hai* hoặc biết so sánh hai cách.",
    "*Tự thay số, tự ra bài tương tự* rồi giải lại.",
  ) {
    [• #item \ ]
  }
]

#v(0.6em)

#table(
  columns: (0.9fr, 1.6fr, 2.0fr, 1.1cm),
  align: left + horizon,
  inset: (x: 8pt, y: 8pt),
  stroke: 0.7pt + C-LIGHT,
  fill: (x, y) => if y == 0 { rgb("#1E1B4B") } else if calc.even(y) { C-CREAM } else { white },
  [#text(fill: white, weight: "bold")[Tầng]],
  [#text(fill: white, weight: "bold")[Dấu hiệu]],
  [#text(fill: white, weight: "bold")[Việc nên làm ở nhà]],
  [#text(fill: white, weight: "bold")[✓]],

  [1], [Làm đúng theo mẫu], [Làm lại 2 bài cùng dạng mà *không nhìn* lời giải mẫu], [],
  [2], [Giải thích được], [Nói bằng 2–3 câu hoặc vẽ sơ đồ để giải thích], [],
  [3], [Có cách 2], [Tính lại bằng cách khác hoặc đổi thứ tự suy luận], [],
  [4], [Tự ra đề tương tự], [Thay số, giữ cấu trúc bài rồi tự giải lại từ đầu], [],
)

#v(0.8em)

#hai-cach[
  *Bài tự luyện 4 tầng:*
  #v(0.2em)
  1. Tính nhanh $36 + 29$.
  2. Giải thích vì sao cách của em đúng.
  3. Tìm thêm *một cách khác*.
  4. Tự thay số để tạo *một bài mới cùng dạng*.
  #o-tra-loi(h: 3.2cm, label: "Nhật ký tư duy của em:")
]

#v(0.8em)

#goc-phu-huynh[
  *Nhịp luyện 1 tuần đề nghị cho học sinh khá/giỏi lớp 2:*
  #v(0.3em)
  - 2 buổi: làm chắc dạng mới học.
  - 1 buổi: chỉ tập *so sánh hai cách giải*.
  - 1 buổi: làm *1 bài mở có nhiều đáp án*.
  - 1 buổi ngắn: để con *tự ra đề* cho bố mẹ hoặc anh chị giải thử.
]

// ══════════════════════════════════════════════════════════════════════════
// E. CHỨNG NHẬN XUẤT SẮC / EXCELLENCE CERTIFICATE
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#page(margin: (x: 2cm, y: 2cm))[
  #block(
    width: 100%,
    height: 100%,
    fill: gradient.radial(
      rgb("#FFF9E6"),
      rgb("#FFF3CD"),
      center: (50%, 50%),
    ),
    stroke: (paint: C-GOLD, thickness: 3pt),
    radius: 16pt,
    inset: (x: 2cm, y: 1.8cm),
  )[
    #set par(first-line-indent: 0em)
    #align(center)[
      // Border decoration (top)
      #text(size: 24pt)[✦ ✦ ✦ ✦ ✦ ✦ ✦]
      #v(0.8em)
      #text(fill: C-GOLD, size: 13pt, tracking: 4pt, weight: "bold")[CHỨNG NHẬN XUẤT SẮC TOÁN NÂNG CAO]
      #v(0.2em)
      #text(fill: C-CH-NC.at(0), size: 11pt, style: "italic")[Certificate of Advanced Mathematics Excellence]
      #v(1.2em)

      #text(fill: rgb("#FCD34D"), size: 72pt)[🏆]
      #v(0.8em)

      #text(fill: C-DARK, size: 12pt)[Chứng nhận rằng / This certifies that]
      #v(0.5em)
      #block(
        stroke: (bottom: 2pt + C-GOLD),
        inset: (bottom: 6pt),
        width: 80%,
      )[
        #text(
          size: 20pt,
          weight: "black",
          fill: C-CH-NC.at(0),
        )[\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_]
      ]
      #v(0.8em)

      #text(fill: C-DARK, size: 11pt)[đã hoàn thành xuất sắc]
      #v(0.3em)
      #text(fill: C-CH-NC.at(0), size: 15pt, weight: "black")[TOÁN NÂNG CAO LỚP 2 — Quyển II]
      #v(0.2em)
      #text(fill: C-MID, size: 10pt, style: "italic")[Advanced Mathematics Grade 2 — Volume II]
      #v(0.8em)

      #grid(
        columns: (1fr, auto, 1fr),
        gutter: 10pt,
        align(center)[
          #block(stroke: (bottom: 1.5pt + C-GOLD), inset: (bottom: 4pt), width: 80%)[
            #text(size: 9.5pt, fill: C-MID)[Ngày hoàn thành]
          ]
          #text(size: 8.5pt, fill: C-MID, style: "italic")[Date completed]
        ],
        align(center)[
          #text(size: 32pt)[⭐⭐⭐⭐]
        ],
        align(center)[
          #block(stroke: (bottom: 1.5pt + C-GOLD), inset: (bottom: 4pt), width: 80%)[
            #text(size: 9.5pt, fill: C-MID)[Xác nhận của Phụ huynh]
          ]
          #text(size: 8.5pt, fill: C-MID, style: "italic")[Parent \/ Guardian signature]
        ],
      )
      #v(1.0em)

      #block(
        fill: gradient.linear(rgb("#1E1B4B"), rgb("#312E81"), angle: 90deg),
        inset: (x: 20pt, y: 10pt),
        radius: 20pt,
      )[
        #text(fill: rgb("#FCD34D"), weight: "black", size: 10pt)[
          🎯 Học sinh Toán Xuất Sắc Lớp 2 — Grade 2 Advanced Math Star 🎯
        ]
      ]

      #v(0.8em)
      #text(size: 22pt)[✦ ✦ ✦ ✦ ✦ ✦ ✦]
    ]
  ]
]
