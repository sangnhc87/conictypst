// ══════════════════════════════════════════════════════════════════════════
// nc-extras.typ — Extra Bonus Content / Phần Thưởng Thêm
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

// ══════════════════════════════════════════════════════════════════════════
// ĐỀ KIỂM TRA TỔNG KẾT — FINAL COMPREHENSIVE EXAM
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#3730A3"), rgb("#4338CA"), angle: 90deg),
  inset: (x: 20pt, y: 18pt),
  radius: 14pt,
)[
  #align(center)[
    #text(fill: white, size: 20pt, weight: "black")[🏁 Đề Kiểm Tra Tổng Kết — Final Exam]
    #v(0.4em)
    #text(fill: rgb("#FDE68A"), size: 14pt)[Comprehensive Final Assessment — All Topics]
    #v(0.4em)
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      gutter: 6pt,
      [#text(fill: white.transparentize(20%), size: 9.5pt)[⏱ 60 phút]],
      [#text(fill: white.transparentize(20%), size: 9.5pt)[📝 40 điểm]],
      [#text(fill: white.transparentize(20%), size: 9.5pt)[🎯 Cả 5 chương]],
      [#text(fill: white.transparentize(20%), size: 9.5pt)[✍️ Tên: \_\_\_\_\_\_\_\_\_]],
    )
  ]
]

#v(0.8em)

== Phần A: Điền Nhanh (10 điểm — 0.5đ/câu)

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,
  [
    *1.* Dãy số: 2, 6, 18, 54, \_\_\_\_ \
    *2.* Dãy số: 100, 95, 89, 82, \_\_\_\_ *(hiệu tăng 1)* \
    *3.* Ô vuông ma thuật, tâm = 7, tổng = \_\_\_\_ \
    *4.* 398 + 203 = \_\_\_\_ *(nhẩm nhanh)* \
    *5.* 800 − 397 = \_\_\_\_ *(bù số)* \
    *6.* 7 × 8 + 6 × 9 = \_\_\_\_ \
    *7.* 57 ÷ 8 = \_\_\_ dư \_\_\_ \
    *8.* Số có 2 chữ số, tổng chữ số = 11, chia hết 3: \_\_\_\_ (liệt kê) \
    *9.* Hình chữ nhật 9×4: Diện tích=\_\_\_\_, Chu vi=\_\_\_\_ \
    *10.* Từ {1,2,3,4} tạo số có 2 chữ số khác nhau: \_\_\_\_ số \
  ],
  [
    *11.* 1+2+3+...+10 = \_\_\_\_ *(Gauss)* \
    *12.* Số nguyên tố nhỏ nhất lớn hơn 20: \_\_\_\_ \
    *13.* Hình vuông 5×5 trong lưới 5×5: \_\_\_\_ hình (tổng các loại) \
    *14.* 5 bạn bắt tay nhau: \_\_\_\_ cái bắt tay \
    *15.* A×B=12, A+B=7, A>B: A=\_\_\_, B=\_\_\_ \
    *16.* 9ⁿ luôn có tổng chữ số chia hết cho: \_\_\_\_ \
    *17.* Số thứ 10 trong dãy Fibonacci: \_\_\_\_ \
    *18.* Nếu 3 đường thẳng tạo 3 điểm giao, 4 đường thẳng tạo tối đa \_\_\_\_ điểm \
    *19.* Số hoàn hảo đầu tiên: \_\_\_\_ \
    *20.* (15 + 9) ÷ 3 − 4 × 2 = \_\_\_\_
  ],
)

#v(0.8em)

== Phần B: Bài Toán Có Lời (20 điểm)

*Bài 1 (4đ):* Kho lương thực có 840 kg gạo. Ngày 1 xuất 135 kg. Ngày 2 nhập vào gấp đôi lượng xuất ngày 1. Ngày 3 xuất 97 kg. Hỏi kho còn bao nhiêu kg?

#dong-viet(n: 3)

*Bài 2 (4đ):* Giải bằng sơ đồ thanh (bar model): \
Ba bạn An, Bình, Châu đều sở hữu sách. Số sách của Bình bằng 3 lần An. Số sách của Châu ít hơn Bình 12 quyển. Tổng cả ba bạn có 68 quyển. Tìm số sách mỗi bạn.

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  [*Sơ đồ:* #rect(width: 100%, height: 4cm, stroke: 1pt + C-LIGHT, fill: white, radius: 4pt)[]],
  [*Bài giải:* #dong-viet(n: 5)],
)

*Bài 3 (4đ):* Giải bằng chiến lược làm ngược: \
Sau khi tặng 1/3 số bi cho Lan và cho Hùng 8 viên, Nam còn lại 20 viên. Nam có bao nhiêu viên ban đầu?

#dong-viet(n: 3)

*Bài 4 (4đ):* Vườn rau có hình chữ nhật. Nếu tăng chiều dài thêm 4m (giữ nguyên rộng), diện tích tăng 36m². Nếu tăng chiều rộng thêm 3m (giữ nguyên dài), diện tích tăng 33m². Tìm kích thước ban đầu của vườn.

#dong-viet(n: 4)

*Bài 5 (4đ):* Từ 4 chữ số {1, 2, 3, 4}, dùng mỗi chữ số đúng một lần, lập các số có 4 chữ số. \
*a)* Có bao nhiêu số? \_\_\_\_ \
*b)* Tổng tất cả các số đó bằng bao nhiêu? *(Gợi ý: mỗi vị trí có 3! = 6 số có chữ số đó)* \
#dong-viet(n: 3)

== Phần C: Thử Thách Olympiad (10 điểm)

*Câu C1 (4đ):* Có 100 học sinh tham gia cuộc thi. Mỗi học sinh thi 3 môn: Toán, Khoa học, Tiếng Anh. 72 em đậu Toán, 58 em đậu Khoa học, 65 em đậu Tiếng Anh. Biết không có ai đậu cả ba. Hỏi có bao nhiêu em đậu đúng hai môn?

#dong-viet(n: 4)

*Câu C2 (6đ)* ⭐⭐⭐⭐⭐: Điền các số nguyên dương từ 1 đến 9 (mỗi số dùng đúng 1 lần) vào 9 ô dưới đây sao cho ba số trong mỗi hàng ngang, hàng dọc, và hai đường chéo đều có *tích bằng nhau*:

#align(center)[
  #block(fill: white, inset: 14pt, radius: 8pt, stroke: 1.5pt + C-GOLD)[
    #table(
      columns: (2.2cm, 2.2cm, 2.2cm),
      rows: (1.8cm, 1.8cm, 1.8cm),
      align: center + horizon,
      inset: 8pt,
      stroke: 1.5pt + C-DARK,
      [], [3], [],
      [], [], [],
      [2], [], [],
    )
    #v(0.3em)
    #text(size: 9pt, fill: C-MID, style: "italic")[Gợi ý: Tích ma thuật = ? (dùng 1–9, tích hàng = cột = chéo)]
  ]
]

#dong-viet(n: 4)

// ══════════════════════════════════════════════════════════════════════════
// PHÒNG THÍ NGHIỆM TƯ DUY — SINGAPORE & JAPAN THINKING LAB
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#0F766E"), rgb("#1E3A8A"), angle: 90deg),
  inset: (x: 20pt, y: 16pt),
  radius: 14pt,
)[
  #align(center)[
    #text(fill: white, size: 18pt, weight: "black")[🧪 Phòng Thí Nghiệm Tư Duy]
    #v(0.2em)
    #text(fill: rgb("#FDE68A"), size: 12.5pt)[Singapore–Japan Thinking Lab]
  ]
]

#v(0.8em)

#phong-thi-nghiem[
  *Chu trình 4 bước để nâng từ “làm đúng” lên “tư duy thật”:*
  #v(0.3em)
  #for item in (
    "*Dự đoán* trước khi làm: đáp án khoảng bao nhiêu?",
    "*Mô hình hoá*: vẽ sơ đồ thanh, bảng, hình hoặc ghi nhóm đều nhau.",
    "*Giải*: làm bằng một cách rõ ràng, sạch bước.",
    "*So sánh*: thử tìm thêm một cách khác hoặc giải thích vì sao cách này tốt.",
  ) {
    [• #item \ ]
  }
]

#v(0.7em)

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,
  block(fill: C-CH-NC.at(2).lighten(92%), stroke: 1.5pt + C-CH-NC.at(2), inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(2), weight: "bold", size: 11pt)[🔷 Lab 1 — Sơ Đồ Thanh Nhiều Bước]
    #v(0.4em)
    An có *12* viên bi. Bình có *gấp đôi* An. Cả ba bạn An, Bình, Châu có *45* viên bi. Hỏi Châu có bao nhiêu viên bi?
    #v(0.5em)
    #align(center)[
      #bar-model(
        label-total: "45",
        parts: (
          (label: "12", w: 2.2),
          (label: "12", w: 2.2),
          (label: "12", w: 2.2),
          (label: "?", w: 2.8),
        ),
        bw: 9.4,
      )
    ]
    #v(0.3em)
    #text(fill: C-MID, size: 9pt, style: "italic")[Gợi ý: Tính số bi của Bình trước, rồi dùng tổng để tìm Châu.]
    #o-tra-loi(h: 3.1cm, label: "Bài giải / Solution:")
  ],
  block(fill: C-CH-NC.at(1).lighten(92%), stroke: 1.5pt + C-CH-NC.at(1), inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(1), weight: "bold", size: 11pt)[🧩 Lab 2 — Một Bài, Nhiều Đáp Án]
    #v(0.4em)
    Tìm *ít nhất 3 bộ số khác nhau* $a$, $b$, $c$ sao cho:
    #v(0.2em)
    - $a + b + c = 30$
    - số lớn nhất là *số chẵn*
    - số bé nhất *lớn hơn 4*
    - cả 3 số *khác nhau*
    #v(0.4em)
    Sau khi tìm xong, em hãy khoanh bộ số em thấy *đẹp nhất* và giải thích vì sao.
    #o-tra-loi(h: 3.5cm, label: "Liệt kê và giải thích:")
  ],
)

#v(0.8em)

#hai-cach[
  *So sánh hai cách tính rồi chọn cách em thích hơn:*
  #v(0.3em)
  *Bài toán:* $48 + 27$
  #v(0.4em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    block(fill: white, stroke: 1pt + C-LIGHT, inset: 10pt, radius: 8pt)[
      *Cách 1 — Bù tròn chục*
      #v(0.2em)
      $48 + 27 = 50 + 25 = 75$
    ],
    block(fill: white, stroke: 1pt + C-LIGHT, inset: 10pt, radius: 8pt)[
      *Cách 2 — Tách chục và đơn vị*
      #v(0.2em)
      $(40 + 20) + (8 + 7) = 60 + 15 = 75$
    ],
  )
  #v(0.4em)
  Em hãy tự thử lại với $63 - 28$ theo *2 cách khác nhau*.
  #o-tra-loi(h: 2.6cm, label: "Cách của em:")
]

#v(0.8em)

#goc-phu-huynh[
  - Với bài nâng cao, cho con quyền vẽ nháp, gạch nhóm, lập bảng hoặc thử sai có kiểm soát.
  - Đừng chỉ hỏi *đúng hay sai*; hãy hỏi thêm *vì sao* và *có cách nào khác*.
  - Nếu con bí, chỉ gợi theo thứ tự: *dữ kiện nào đã biết → mô hình nào hợp → bước đầu tiên là gì*.
]

// ══════════════════════════════════════════════════════════════════════════
// DANH SÁCH SÁCH THAM KHẢO — RECOMMENDED BOOKS
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#1E3A8A"), rgb("#1E1B4B"), angle: 90deg),
  inset: (x: 20pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 17pt, weight: "black")[📚 Tài Liệu Tham Khảo — Further Reading]
    #v(0.2em)
    #text(fill: rgb("#FCD34D"), size: 12pt)[Recommended Books & Resources]
  ]
]

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,

  block(fill: C-CH-NC.at(0).lighten(90%), stroke: 1.5pt + C-CH-NC.at(0), inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(0), weight: "bold", size: 11pt)[📗 Sách Tiếng Việt]
    #v(0.5em)
    #set text(size: 9.5pt)
    *• Toán Tuổi Thơ Lớp 2* — Trần Nam Dũng \
    *• 180 Đề Toán Sáng Tạo Lớp 2* — Nguyễn Vũ Lương \
    *• Toán Nâng Cao Tiểu Học* — Phạm Đình Thực \
    *• Bài Tập Nâng Cao Toán 2* — Nguyễn Áng \
    *• Tuyển Tập Bài Toán Hay Lớp 2* — Nhiều tác giả \
    *• Toán Tư Duy Lớp 2* — Phan Thị Luyến \
    *• Khám Phá Toán Học với Trẻ* — Đào Tam
  ],

  block(fill: C-CH-NC.at(1).lighten(90%), stroke: 1.5pt + C-CH-NC.at(1), inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(1), weight: "bold", size: 11pt)[📘 English Books]
    #v(0.5em)
    #set text(size: 9.5pt)
    *• Singapore Math Grade 2* — Marshall Cavendish \
    *• Beast Academy 2* — Art of Problem Solving \
    *• Primary Mathematics 2* — Singapore \
    *• Thinking Kids Math Grade 2* — Carson Dellosa \
    *• Math Olympiad for Elementary* — Lenchner \
    *• Figure It Out! Math Puzzles* — various \
    *• Murderous Maths* — Kjartan Poskitt
  ],
)

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,

  block(fill: C-CH-NC.at(2).lighten(90%), stroke: 1.5pt + C-CH-NC.at(2), inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(2), weight: "bold", size: 11pt)[🌐 Trang Web Học Toán]
    #v(0.5em)
    #set text(size: 9.5pt)
    *• Khan Academy Kids* — khanacademy.org \
    *• Brilliant.org* — bài toán tư duy \
    *• Math Playground* — mathplayground.com \
    *• IXL Math* — ixl.com \
    *• Prodigy Math* — prodigygame.com \
    *• Math Kangaroo* — mathkangaroo.org \
    *• Art of Problem Solving* — artofproblemsolving.com
  ],

  block(fill: C-CH-NC.at(3).lighten(90%), stroke: 1.5pt + C-CH-NC.at(3), inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(3), weight: "bold", size: 11pt)[🏆 Cuộc Thi Toán Cho Bé]
    #v(0.5em)
    #set text(size: 9.5pt)
    *• Toán Tuổi Thơ* — Báo Toán Học Tuổi Trẻ \
    *• Math Olympiad (MOEMS)* — cấp Tiểu học \
    *• AMC 8* — cho học sinh dưới 14 tuổi \
    *• Mathkangaroo* — cuộc thi quốc tế \
    *• SASMO* — Singapore & Asian Schools \
    *• Hy Lạp — Kangaroo Math* — các quốc gia \
    *• VioMath* — Toán Việt Online
  ],
)

#v(0.8em)

#block(
  fill: gradient.linear(rgb("#FFF9E6"), rgb("#FEFCE8"), angle: 90deg),
  stroke: 1.5pt + C-GOLD,
  inset: 16pt,
  radius: 10pt,
)[
  #set par(first-line-indent: 0em)
  #align(center)[
    #text(fill: C-GOLD, weight: "bold", size: 13pt)[🌟 Lời Kết — Final Words]
  ]
  #v(0.6em)
  #set text(size: 10pt)
  #grid(
    columns: (1fr, 1fr),
    gutter: 16pt,
    [
      Toán học không chỉ là những con số — đó là *nghệ thuật tư duy*, *công cụ khám phá*, và *ngôn ngữ vũ trụ*. Mỗi bài toán bạn giải được là một bước tiến trên hành trình trở thành nhà tư duy vĩ đại.

      *Đừng sợ sai* — sai là bước đệm để đúng. \
      *Đừng sợ khó* — khó là nơi tư duy lớn lên. \
      *Hãy vui với toán* — vì toán học là trò chơi đẹp nhất!
    ],
    [
      #set text(style: "italic")
      _Mathematics is not about numbers, equations, computations, or algorithms: it is about understanding._
      #v(0.4em)
      — William Paul Thurston
      #v(0.6em)
      _Pure mathematics is, in its way, the poetry of logical ideas._
      #v(0.4em)
      — Albert Einstein
      #v(0.6em)
      _The only way to learn mathematics is to do mathematics._
      #v(0.4em)
      — Paul Halmos
    ],
  )
]
