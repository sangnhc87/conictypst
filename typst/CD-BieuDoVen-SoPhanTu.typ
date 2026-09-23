// ═══════════════════════════════════════════════════════════════════════════
//  CD-BieuDoVen-SoPhanTu.typ
//  CHUYÊN ĐỀ CHUYÊN SÂU: BIỂU ĐỒ VENN & NGUYÊN LÝ BÙ TRỪ (PIE)
//  Từ Bản Chất Miền Nguyên Tử Đến Đỉnh Cao Cực Trị & Bài Toán Hay – Lạ – Khó
//  Tác giả: GV Nguyễn Văn Sang · Toán THPT & Bồi dưỡng HSG / Luyện thi ĐGNL
// ═══════════════════════════════════════════════════════════════════════════

#import "template.typ": *
#import "@preview/cetz:0.5.2"

// ── BẢNG MÀU CHỦ ĐẠO SANG TRỌNG ──────────────────────────────────────────
#let C-main = rgb("#1E3A8A")   // Xanh Navy hoàng gia (Chủ đề chính)
#let C-sec  = rgb("#0D9488")   // Xanh Ngọc Teal (Ứng dụng, Ví dụ)
#let C-acc  = rgb("#E11D48")   // Đỏ Rose (Điểm nhấn, Chú ý)
#let C-purp = rgb("#7C3AED")   // Tím Royal (Định lý, Công thức chìa khoá)
#let C-warn = rgb("#D97706")   // Vàng Hổ phách (Cảnh báo bẫy sai lầm)
#let C-gray = rgb("#475569")   // Xám Slate (Ghi chú, Phụ đề)

// ── CÁC HỘP ĐẶC TRƯNG CHUYÊN SÂU ─────────────────────────────────────────
#let pp-box(title: [📌 Cơ sở lý thuyết], color: C-main, body) = block(
  width: 100%, below: 1em, radius: 6pt, clip: true,
  stroke: 0.8pt + color.lighten(40%),
)[
  #block(width: 100%, fill: color, inset: (x: 12pt, y: 7pt))[
    #text(fill: white, weight: "bold", size: 10.5pt)[#title]
  ]
  #block(width: 100%, fill: color.lighten(94%), inset: (x: 13pt, y: 10pt))[
    #set text(fill: luma(20), size: 10pt)
    #body
  ]
]

#let theorem-box(title: [🔑 Định lý & Công thức cốt lõi], body) = block(
  width: 100%, below: 1em,
)[
  #line(length: 100%, stroke: 2.2pt + C-purp)
  #block(width: 100%, fill: C-purp.lighten(94%), inset: (x: 14pt, top: 8pt, bottom: 9pt))[
    #text(weight: "bold", fill: C-purp, size: 10.5pt)[#title.] \
    #v(3pt)
    #body
  ]
  #line(length: 100%, stroke: 0.8pt + C-purp.lighten(50%))
]

#let trap-box(title: [⚠️ Cảnh báo bẫy tư duy], body) = block(
  width: 100%, below: 0.9em,
  stroke: (left: 4.5pt + C-warn, rest: 0.6pt + C-warn.lighten(60%)),
  inset: (left: 12pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 5pt), fill: C-warn.lighten(94%),
)[
  #text(weight: "bold", fill: C-warn, size: 10pt)[#title:] #h(4pt) #body
]

#let kq-box(body) = block(
  width: 100%, below: 0.8em,
  stroke: (left: 4.5pt + C-sec, rest: 0.6pt + C-sec.lighten(60%)),
  inset: (left: 12pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 5pt), fill: C-sec.lighten(93%),
)[
  #text(weight: "bold", fill: C-sec, size: 10pt)[✅ Kết luận & Mẹo chốt nhanh:] #h(4pt) #body
]

// ── BỘ TẠO SƠ ĐỒ VENN BẰNG CETZ (CHUYÊN NGHIỆP, TỰ ĐỘNG) ─────────────────

// 1. Biểu đồ Venn 2 tập hợp đầy đủ giá trị các miền
#let venn2-draw(
  name-a: $A$, name-b: $B$,
  val-a: "", val-ab: "", val-b: "", val-out: "",
  title: none, s-len: 0.75cm
) = {
  align(center)[
    #cetz.canvas(length: s-len, {
      import cetz.draw: *
      rect((-3.8, -2.4), (3.8, 2.4), stroke: 1pt + luma(120), fill: rgb("#F8FAFC"), radius: 6pt)
      content((-3.3, 1.9), text(weight: "bold", size: 11pt, fill: C-main)[$U$])
      if title != none {
        content((0, 2.05), text(weight: "bold", size: 9.5pt, fill: C-main)[#title])
      }
      // Hai hình tròn giao nhau tô màu bán trong suốt
      circle((-1.1, 0), radius: 1.55, fill: rgb(59, 130, 246, 55), stroke: 1.4pt + rgb(37, 99, 235))
      circle((1.1, 0), radius: 1.55, fill: rgb(239, 68, 68, 55), stroke: 1.4pt + rgb(220, 38, 38))
      // Tên tập hợp
      content((-1.6, 1.2), text(weight: "bold", size: 10.5pt, fill: rgb(30, 58, 138))[#name-a])
      content((1.6, 1.2), text(weight: "bold", size: 10.5pt, fill: rgb(153, 27, 27))[#name-b])
      // Giá trị 3 miền trong
      content((-1.5, 0), text(weight: "bold", size: 10pt, fill: rgb(30, 58, 138))[#val-a])
      content((0, 0), text(weight: "bold", size: 10.5pt, fill: rgb(109, 40, 217))[#val-ab])
      content((1.5, 0), text(weight: "bold", size: 10pt, fill: rgb(153, 27, 27))[#val-b])
      // Miền ngoài
      if val-out != "" {
        content((3.0, -1.8), text(size: 9.5pt, fill: luma(80))[Phần bù: #val-out])
      }
    })
  ]
}

// 2. Biểu đồ Venn 3 tập hợp chuẩn 7 miền nguyên tử đối xứng
#let venn3-draw(
  name-a: $A$, name-b: $B$, name-c: $C$,
  x1: "", x2: "", x3: "",
  y1: "", y2: "", y3: "",
  z: "", val-out: "",
  title: none, s-len: 0.72cm
) = {
  align(center)[
    #cetz.canvas(length: s-len, {
      import cetz.draw: *
      rect((-4.2, -3.4), (4.2, 3.4), stroke: 1pt + luma(120), fill: rgb("#F8FAFC"), radius: 7pt)
      content((-3.7, 2.9), text(weight: "bold", size: 11pt, fill: C-main)[$U$])
      if title != none {
        content((0, 3.0), text(weight: "bold", size: 10pt, fill: C-main)[#title])
      }
      
      // 3 hình tròn giao nhau 120 độ
      circle((0, 0.95), radius: 1.7, fill: rgb(59, 130, 246, 50), stroke: 1.3pt + rgb(37, 99, 235))
      circle((-1.15, -0.75), radius: 1.7, fill: rgb(239, 68, 68, 50), stroke: 1.3pt + rgb(220, 38, 38))
      circle((1.15, -0.75), radius: 1.7, fill: rgb(16, 185, 129, 50), stroke: 1.3pt + rgb(5, 150, 105))
      
      // Nhãn tên 3 tập
      content((0, 2.45), text(weight: "bold", size: 11pt, fill: rgb(30, 58, 138))[#name-a])
      content((-2.7, -1.6), text(weight: "bold", size: 11pt, fill: rgb(153, 27, 27))[#name-b])
      content((2.7, -1.6), text(weight: "bold", size: 11pt, fill: rgb(6, 95, 70))[#name-c])
      
      // 7 miền nguyên tử
      // Chỉ 1 tập:
      content((0, 1.5), text(weight: "bold", size: 9pt, fill: rgb(30, 58, 138))[#x1])
      content((-1.65, -1.05), text(weight: "bold", size: 9pt, fill: rgb(153, 27, 27))[#x2])
      content((1.65, -1.05), text(weight: "bold", size: 9pt, fill: rgb(6, 95, 70))[#x3])
      // Đúng 2 tập:
      content((-0.95, 0.45), text(weight: "bold", size: 9pt, fill: rgb(109, 40, 217))[#y1])
      content((0.95, 0.45), text(weight: "bold", size: 9pt, fill: rgb(13, 148, 136))[#y2])
      content((0, -1.35), text(weight: "bold", size: 9pt, fill: rgb(180, 83, 9))[#y3])
      // Cả 3 tập (tâm):
      content((0, -0.1), text(weight: "bold", size: 10pt, fill: rgb(124, 58, 237))[#z])
      
      // Miền bù ngoài
      if val-out != "" {
        content((3.2, -2.8), text(size: 9pt, fill: luma(80))[Ngoài: #val-out])
      }
    })
  ]
}

// 3. Sơ đồ minh họa Cực trị Min - Max của Giao hai tập hợp
#let venn-extreme-draw(s-len: 0.65cm) = {
  align(center)[
    #grid(
      columns: (1fr, 1fr),
      gutter: 12pt,
      [
        #cetz.canvas(length: s-len, {
          import cetz.draw: *
          rect((-3.2, -2.2), (3.2, 2.2), stroke: 0.9pt + luma(120), fill: rgb("#F8FAFC"), radius: 5pt)
          content((0, 1.8), text(weight: "bold", size: 8.5pt, fill: C-sec)[TRƯỜNG HỢP GIAO LỚN NHẤT ($B subset A$)])
          circle((-0.3, -0.2), radius: 1.5, fill: rgb(59, 130, 246, 45), stroke: 1.2pt + rgb(37, 99, 235))
          circle((0.2, -0.2), radius: 0.8, fill: rgb(239, 68, 68, 65), stroke: 1.2pt + rgb(220, 38, 38))
          content((-1.2, 0.6), text(weight: "bold", size: 9pt, fill: rgb(30, 58, 138))[$A$])
          content((0.2, -0.2), text(weight: "bold", size: 9pt, fill: white)[$B$])
          content((0, -1.9), text(size: 8pt, style: "italic")[$n(A inter B)_("max") = n(B)$])
        })
      ],
      [
        #cetz.canvas(length: s-len, {
          import cetz.draw: *
          rect((-3.2, -2.2), (3.2, 2.2), stroke: 0.9pt + luma(120), fill: rgb("#F8FAFC"), radius: 5pt)
          content((0, 1.8), text(weight: "bold", size: 8.5pt, fill: C-acc)[TRƯỜNG HỢP GIAO NHỎ NHẤT ($A union B = U$)])
          circle((-1.0, -0.2), radius: 1.45, fill: rgb(59, 130, 246, 45), stroke: 1.2pt + rgb(37, 99, 235))
          circle((1.0, -0.2), radius: 1.45, fill: rgb(239, 68, 68, 45), stroke: 1.2pt + rgb(220, 38, 38))
          content((-1.6, 0.6), text(weight: "bold", size: 9pt, fill: rgb(30, 58, 138))[$A$])
          content((1.6, 0.6), text(weight: "bold", size: 9pt, fill: rgb(153, 27, 27))[$B$])
          content((0, -0.2), text(weight: "bold", size: 8.5pt, fill: rgb(109, 40, 217))[Giao min])
          content((0, -1.9), text(size: 8pt, style: "italic")[$n(A inter B)_("min") = n(A) + n(B) - n(U)$])
        })
      ]
    )
  ]
}

// ═══════════════════════════════════════════════════════════════════════════
//  THIẾT LẬP TÀI LIỆU CHUYÊN ĐỀ CHUẨN MỰC
// ═══════════════════════════════════════════════════════════════════════════
#show: stexgv-doc.with(
  doc-type: "chuyende",
  title: "BIỂU ĐỒ VENN & NGUYÊN LÝ BÙ TRỪ",
  subtitle: "Từ Mô Hình Miền Nguyên Tử Đến Đỉnh Cao Cực Trị & Bài Toán Hay – Lạ – Khó",
  author: "GV Nguyễn Văn Sang",
  institution: "Tổ Toán · Hệ Thống Giáo Dục Chuyên Sâu THPT",
  subject: "Đại số & Xác suất Tổ hợp 10",
  grade: "Lớp 10 & Ôn Thi ĐGNL / HSG",
  series: "Chuyên Đề Đột Phá Tư Duy Toán",
  academic-year: "2025–2026",
  theme-color: C-main,
)

// ═══════════════════════════════════════════════════════════════════════════
= LỜI NÓI ĐẦU & BẢN ĐỒ CHIẾN LƯỢC

Trong chương trình Toán THPT (đặc biệt là chương Tập hợp lớp 10), bài toán "Dùng biểu đồ Venn và công thức tính số phần tử" thường được giới thiệu ở mức độ trực quan, chủ yếu dừng lại ở việc áp dụng công thức cộng $n(A union B) = n(A) + n(B) - n(A inter B)$ trong các tình huống khảo sát 2 hoặc 3 môn học đơn giản.

Tuy nhiên, trong các kỳ thi học sinh giỏi, các kỳ thi Đánh giá năng lực (HSA ĐHQG Hà Nội, APT ĐHQG TP.HCM, TSA Đại học Bách Khoa Hà Nội) và cấu trúc đề thi tốt nghiệp THPT mới từ năm 2025, chủ đề này đã phát triển thành *một nhánh tổ hợp cực kỳ phong phú, sâu sắc và đầy tính phân hóa*. Các bài toán không chỉ dừng lại ở phép thế số trực tiếp, mà đòi hỏi:
+ Kỹ thuật phân hoạch không gian mẫu thành các *miền nguyên tử rời nhau (Atomic Disjoint Regions)* để biến bài toán tập hợp thành hệ phương trình tuyến tính nguyên không âm;
+ Kỹ thuật đánh giá *Bất đẳng thức Bonferroni* và tìm *Cực trị Min – Max* của số phần tử khi các dữ kiện bị ẩn hoặc bị khuyết;
+ Khả năng phát hiện *mâu thuẫn logic trong số liệu báo cáo* (phát hiện gian lận thống kê);
+ Vận dụng linh hoạt trong *Số học (Sàng Eratosthenes, BCNN, Hàm phi Euler)* và các bài toán thực tế đa tầng nhận thức.

Chuyên đề này được biên soạn độc lập, tách riêng với hệ thống lý thuyết chuẩn mực, phân loại chi tiết 5 dạng toán đột phá, kèm theo hơn 25 ví dụ mổ xẻ cặn kẽ và bộ đề rèn luyện 20 câu đầy đủ 3 phần format mới của Bộ GD&ĐT. Mọi bài toán đều có sơ đồ trực quan được vẽ chuẩn xác, giúp người đọc nắm trọn bản chất toán học từ gốc đến ngọn.

// ═══════════════════════════════════════════════════════════════════════════
= PHẦN I: CƠ SỞ LÝ THUYẾT & VŨ KHÍ ĐẠI SỐ TỐI THƯỢNG

== 1.1. Mô hình Miền nguyên tử (Atomic Disjoint Regions - ADR)

Sai lầm phổ biến nhất của học sinh khi giải bài toán tập hợp là nhầm lẫn giữa các khái niệm:
- *"Số phần tử của $A$"* (kí hiệu $n(A)$): bao gồm cả những phần tử thuộc riêng $A$ lẫn những phần tử thuộc chung với các tập khác.
- *"Số phần tử CHỈ thuộc $A$"* (kí hiệu $n(A \\ (B union C))$): phần độc quyền của $A$.
- *"Số phần tử thuộc ĐÚNG hai tập hợp"* vs *"Số phần tử thuộc ÍT NHẤT hai tập hợp"*.

Để triệt tiêu hoàn toàn sự nhầm lẫn này, vũ khí tối thượng là *Mô hình phân hoạch Miền nguyên tử*: Mọi không gian mẫu $U$ chứa $n$ tập hợp con sẽ bị phân cắt thành đúng $2^n$ miền độc lập, đôi một rời nhau.

=== A. Trường hợp 2 tập hợp ($2^2 = 4$ miền nguyên tử)

#venn2-draw(
  name-a: $A$, name-b: $B$,
  val-a: [$x_1$], val-ab: [$x_2$], val-b: [$x_3$], val-out: [$x_0$],
  title: [Phân hoạch 4 miền nguyên tử của 2 tập hợp],
  s-len: 0.8cm
)

Các đại lượng được giải mã thành tổng các biến số nguyên không âm ($x_i in NN$):
- $x_1 = n(A \\ B)$: Số phần tử *chỉ* thuộc $A$.
- $x_2 = n(A inter B)$: Số phần tử thuộc *cả* $A$ và $B$.
- $x_3 = n(B \\ A)$: Số phần tử *chỉ* thuộc $B$.
- $x_0 = n(U \\ (A union B))$: Số phần tử *không* thuộc tập nào.

Khi đó, toàn bộ các công thức tập hợp quy về phép cộng đại số đơn giản:
$ cases(
  n(A) = x_1 + x_2,
  n(B) = x_3 + x_2,
  n(A union B) = x_1 + x_2 + x_3,
  n(U) = x_0 + x_1 + x_2 + x_3,
) $
Từ đó dễ dàng thấy ngay: $n(A) + n(B) = (x_1 + x_2) + (x_3 + x_2) = (x_1 + x_2 + x_3) + x_2 = n(A union B) + n(A inter B)$.

=== B. Trường hợp 3 tập hợp ($2^3 = 8$ miền nguyên tử)

#venn3-draw(
  name-a: $A$, name-b: $B$, name-c: $C$,
  x1: [$x_1$], x2: [$x_2$], x3: [$x_3$],
  y1: [$y_1$], y2: [$y_2$], y3: [$y_3$],
  z: [$z$], val-out: [$x_0$],
  title: [Mô hình 8 miền nguyên tử của 3 tập hợp],
  s-len: 0.75cm
)

Gọi $8$ miền nguyên tử là:
1. *Nhóm chỉ thuộc đúng 1 tập hợp*:
   - $x_1 = n(A \\ (B union C))$ (chỉ thuộc $A$)
   - $x_2 = n(B \\ (C union A))$ (chỉ thuộc $B$)
   - $x_3 = n(C \\ (A union B))$ (chỉ thuộc $C$)
   - Đặt tổng $S_1 = x_1 + x_2 + x_3$.
2. *Nhóm thuộc đúng 2 tập hợp*:
   - $y_1 = n((A inter B) \\ C)$ (chỉ thuộc $A, B$ mà không thuộc $C$)
   - $y_2 = n((A inter C) \\ B)$ (chỉ thuộc $A, C$ mà không thuộc $B$)
   - $y_3 = n((B inter C) \\ A)$ (chỉ thuộc $B, C$ mà không thuộc $A$)
   - Đặt tổng $S_2 = y_1 + y_2 + y_3$.
3. *Nhóm thuộc cả 3 tập hợp*:
   - $z = S_3 = n(A inter B inter C)$.
4. *Nhóm không thuộc tập nào*:
   - $x_0 = n(U \\ (A union B union C))$.

#theorem-box(title: [🔑 Định lý Đẳng thức Tầng Miền (Bản quyền phân tầng)])[
  Đặt:
  - $Sigma_1 = n(A) + n(B) + n(C)$ (tổng số phần tử từng tập riêng lẻ).
  - $Sigma_2 = n(A inter B) + n(B inter C) + n(C inter A)$ (tổng giao từng cặp hai tập).
  - $Sigma_3 = n(A inter B inter C) = z$ (giao cả ba tập).
  - $N_("hop") = n(A union B union C)$ (số phần tử thuộc ít nhất một tập).

  Khi đó, ta có hệ liên hệ đại số hoàn hảo:
  $ cases(
    Sigma_1 = S_1 + 2 S_2 + 3 S_3 ,
    Sigma_2 = S_2 + 3 S_3 ,
    N_("hop") = S_1 + S_2 + S_3
  ) $
  Từ hệ phương trình này, ta suy ra ngay lập tức các công thức suy diễn thần tốc:
  + Số phần tử thuộc *đúng một tập hợp*: $S_1 = Sigma_1 - 2 Sigma_2 + 3 z$.
  + Số phần tử thuộc *đúng hai tập hợp*: $S_2 = Sigma_2 - 3 z$.
  + Số phần tử thuộc *ít nhất hai tập hợp*: $S_2 + S_3 = Sigma_2 - 2 z$.
  + Công thức hợp 3 tập: $N_("hop") = Sigma_1 - Sigma_2 + Sigma_3$ (Chính là Nguyên lý bù trừ!).
]

== 1.2. Nguyên lý Bù trừ (Principle of Inclusion-Exclusion - PIE) Tổng Quát

#pp-box(title: [📌 Bản chất toán học của PIE])[
  Khi tính số phần tử của hợp các tập hợp, nếu ta chỉ cộng số phần tử từng tập lẻ, các phần tử nằm trong phần giao của 2 tập sẽ bị đếm lặp $2$ lần, các phần tử trong phần giao của 3 tập bị đếm lặp $3$ lần,... Để bù trừ, ta trừ đi giao đôi một, nhưng khi trừ đi thì phần giao 3 tập lại bị trừ quá tay, do đó phải cộng lại giao của 3 tập,... Cứ thế so le dấu:
  $ n(union.big_(i=1)^n A_i) = sum_(k=1)^n (-1)^(k-1) sum_(1 <= i_1 < i_2 < dots < i_k <= n) n(A_(i_1) inter A_(i_2) inter dots inter A_(i_k)) $
]

Với $n = 3$:
$ n(A union B union C) = [n(A) + n(B) + n(C)] - [n(A inter B) + n(B inter C) + n(C inter A)] + n(A inter B inter C) $

Với $n = 4$:
$ n(A union B union C union D) = sum n(A_i) - sum n(A_i inter A_j) + sum n(A_i inter A_j inter A_k) - n(A inter B inter C inter D) $

== 1.3. Bất đẳng thức Bonferroni & Kỹ thuật Cực trị Min – Max

Trong thực tế thi cử, rất nhiều bài toán không cho đủ số liệu để tính ra một con số duy nhất, mà yêu cầu tìm: *"Số người cùng thỏa mãn cả 3 tiêu chuẩn ít nhất là bao nhiêu?"* hoặc *"Nhiều nhất là bao nhiêu?"*. Đây là đỉnh cao của dạng toán tập hợp!

#venn-extreme-draw(s-len: 0.65cm)

#theorem-box(title: [🔑 Bất đẳng thức Bonferroni & Biên Cực Trị])[
  Cho không gian mẫu $U$ có $n(U) = N$ phần tử và các tập con $A, B, C subset U$:
  1. *Chặn giao của 2 tập hợp*:
     $ max{0, thin n(A) + n(B) - N} <= n(A inter B) <= min{n(A), thin n(B)} $
     - $n(A inter B)_("max") = min{n(A), n(B)}$, đạt được khi và chỉ khi một tập là con của tập kia ($B subset A$ hoặc $A subset B$).
     - $n(A inter B)_("min") = max{0, n(A) + n(B) - N}$, đạt được khi hai tập phủ kín không gian mẫu $U$ tối đa có thể ($A union B = U$).

  2. *Chặn giao của 3 tập hợp (Bonferroni bậc 3)*:
     $ max{0, thin n(A) + n(B) + n(C) - 2N} <= n(A inter B inter C) <= min{n(A), thin n(B), thin n(C)} $
     - Tổng quát cho $k$ tập hợp trong vũ trụ $N$ phần tử:
       $ n(inter.big_(i=1)^k A_i) >= sum_(i=1)^k n(A_i) - (k - 1) N $
]

#trap-box[
  *Lưu ý then chốt:* Bất đẳng thức Bonferroni $n(A inter B inter C) >= n(A) + n(B) + n(C) - 2N$ là một điều kiện cần tổng quát nhưng đôi khi cận dưới này có thể nhỏ hơn 0 (khi đó cận dưới thực tế là 0) hoặc có thể chưa phải là cận chặt nếu có thêm các điều kiện ràng buộc giữa các cặp giao đôi một! Muốn tìm Min - Max chặt chẽ trong mọi trường hợp phức tạp, ta phải kết hợp với kỹ thuật đặt ẩn tự do dưới đây.
]

== 1.4. Kỹ thuật Đặt ẩn tự do & Biện luận Nghiệm nguyên Không âm

Khi số phương trình ít hơn số ẩn (ví dụ: hệ 8 miền nguyên tử nhưng đề chỉ cho 5 phương trình), hệ có vô số nghiệm đại số. Tuy nhiên, vì các miền nguyên tử biểu thị số lượng người/vật nên bắt buộc phải thỏa mãn:
$ x_i in NN, quad x_i >= 0 quad (forall i = 0, 1, dots, 7) $
Quy trình giải quyết bài toán thiếu dữ kiện:
1. *Bước 1*: Chọn một ẩn trung tâm làm tham số tự do, thông thường là $z = n(A inter B inter C)$ (số phần tử giao cả 3 tập).
2. *Bước 2*: Biểu diễn toàn bộ các miền còn lại $x_1, x_2, x_3, y_1, y_2, y_3, x_0$ theo tham số $z$.
3. *Bước 3*: Thiết lập hệ bất phương trình không âm:
   $ cases(x_1(z) >= 0, x_2(z) >= 0, x_3(z) >= 0, y_1(z) >= 0, y_2(z) >= 0, y_3(z) >= 0, x_0(z) >= 0) $
4. *Bước 4*: Giải hệ bất phương trình tìm khoảng giá trị của $z$: $z_("min") <= z <= z_("max")$. Từ đó suy ra cực trị của mọi đại lượng cần tìm!

// ═══════════════════════════════════════════════════════════════════════════
= PHẦN II: PHÂN LOẠI 5 DẠNG TOÁN ĐỘT PHÁ HAY – LẠ – KHÓ

== Dạng 1: Đặt Ẩn Miền Nguyên Tử & Giải Hệ Bất Định Có Ràng Buộc

#vd(
  [*(Bài toán Khảo sát CLB Học sinh giỏi - Trích đề thi Chọn HSG)* \
   Trong kỳ thi tuyển chọn học sinh giỏi của một trường THPT có 60 học sinh tham gia. Nhà trường tổ chức khảo sát nguyện vọng tham gia 3 câu lạc bộ chuyên sâu: Toán ($T$), Tin học ($I$) và Tiếng Anh ($A$). Kết quả thu được:
   - Có 35 bạn đăng ký CLB Toán, 30 bạn đăng ký CLB Tin học, 28 bạn đăng ký CLB Tiếng Anh.
   - Có 15 bạn đăng ký cả Toán và Tin học; 12 bạn đăng ký cả Toán và Tiếng Anh.
   - Có 5 bạn không đăng ký bất kỳ CLB nào trong ba CLB trên.
   - Gọi $k$ là số bạn đăng ký cả Tin học và Tiếng Anh, $z$ là số bạn đăng ký cả ba câu lạc bộ.
   + Hãy thiết lập mối quan hệ giữa $k$ và $z$.
   + Tìm giá trị nhỏ nhất và lớn nhất của số học sinh đăng ký cả ba câu lạc bộ ($z$).
   + Khi $z$ đạt giá trị nhỏ nhất, có bao nhiêu bạn chỉ đăng ký đúng một câu lạc bộ?
  ],
  loigiai: [
    #pp-box(title: [💡 Chiến lược phân tích])[
      Đề bài chưa cho số học sinh đăng ký cả Tin và Anh ($k$), cũng chưa cho số học sinh học cả ba môn ($z$). Đây là bài toán hệ khuyết. Ta sẽ dùng mô hình 8 miền nguyên tử để biểu diễn toàn bộ theo $z$.
    ]

    *Bước 1: Thiết lập hệ đại số miền.* \
    Tổng số học sinh tham gia ít nhất một câu lạc bộ là:
    $ n(T union I union A) = 60 - 5 = 55 text(" học sinh"). $
    Áp dụng công thức nguyên lý bù trừ cho 3 tập hợp:
    $ n(T union I union A) = n(T) + n(I) + n(A) - [n(T inter I) + n(T inter A) + n(I inter A)] + n(T inter I inter A) $
    Thay các số liệu đã biết vào:
    $ 55 = 35 + 30 + 28 - (15 + 12 + k) + z $
    $ <=> 55 = 93 - 27 - k + z <=> 55 = 66 - k + z <=> k - z = 11 <=> k = z + 11. $
    Như vậy ta có mối quan hệ chặt chẽ: $k = z + 11$ (hay số bạn đăng ký cả Tin và Anh luôn nhiều hơn số bạn đăng ký cả ba môn đúng $11$ bạn).

    *Bước 2: Biểu diễn từng miền nguyên tử theo $z$.*
    - Các miền giao đúng 2 môn (không tính môn thứ 3):
      + $y_1 = n(T inter I \\ A) = 15 - z$.
      + $y_2 = n(T inter A \\ I) = 12 - z$.
      + $y_3 = n(I inter A \\ T) = k - z = (z + 11) - z = 11$ (đại lượng này là hằng số!).
    - Các miền chỉ đăng ký đúng 1 môn:
      + Chỉ đăng ký Toán:
        $ x_1 = n(T) - y_1 - y_2 - z = 35 - (15 - z) - (12 - z) - z = 8 + z. $
      + Chỉ đăng ký Tin học:
        $ x_2 = n(I) - y_1 - y_3 - z = 30 - (15 - z) - 11 - z = 4 $ (cố định bằng 4 học sinh!).
      + Chỉ đăng ký Tiếng Anh:
        $ x_3 = n(A) - y_2 - y_3 - z = 28 - (12 - z) - 11 - z = 5 $ (cố định bằng 5 học sinh!).

    #venn3-draw(
      name-a: $T$, name-b: $I$, name-c: $A$,
      x1: [$8+z$], x2: [$4$], x3: [$5$],
      y1: [$15-z$], y2: [$12-z$], y3: [$11$],
      z: [$z$], val-out: [$5$],
      title: [Sơ đồ miền tham số hóa theo z],
      s-len: 0.72cm
    )

    *Bước 3: Biện luận điều kiện nghiệm nguyên không âm.* \
    Tất cả các miền đều phải có số phần tử không âm:
    $ cases(
      z >= 0 ,
      15 - z >= 0 <=> z <= 15 ,
      12 - z >= 0 <=> z <= 12 ,
      8 + z >= 0 <=> z >= -8
    ) <=> 0 <= z <= 12. $
    Do $z$ là số học sinh nên $z in {0, 1, 2, dots, 12}$.
    - Giá trị nhỏ nhất của $z$ là $z_("min") = 0$.
    - Giá trị lớn nhất của $z$ là $z_("max") = 12$.

    *Bước 4: Trả lời câu hỏi phụ.* \
    Tổng số học sinh chỉ đăng ký đúng một câu lạc bộ là:
    $ S_1 = x_1 + x_2 + x_3 = (8 + z) + 4 + 5 = 17 + z. $
    Khi $z$ đạt giá trị nhỏ nhất ($z = 0$), số học sinh chỉ đăng ký đúng một câu lạc bộ là:
    $ S_1 = 17 + 0 = 17 text(" học sinh"). $

    #kq-box[
      + $k = z + 11$.
      + $z_("min") = 0$, $z_("max") = 12$. Khi $z = 0$ thì $k = 11$; khi $z = 12$ thì $k = 23$.
      + Số học sinh chỉ học đúng một câu lạc bộ khi $z_("min")$ là $17$ bạn.
    ]
  ],
  theme-color: C-main,
)

== Dạng 2: Cực Trị Số Phần Tử & Bài Toán Tối Ưu Hóa (Min – Max Giao Nhiều Tập Hợp)

#vd(
  [*(Bài toán Khảo sát Tiêu dùng - Đánh giá năng lực)* \
   Một công ty nghiên cứu thị trường tiến hành khảo sát $100$ gia đình tại một khu đô thị thông minh về ba thiết bị gia dụng hiện đại: Robot hút bụi ($R$), Nồi chiên không dầu ($N$), Máy lọc không khí ($M$). Kết quả thống kê cho biết:
   - Có $85$ gia đình sở hữu Robot hút bụi.
   - Có $80$ gia đình sở hữu Nồi chiên không dầu.
   - Có $75$ gia đình sở hữu Máy lọc không khí.
   1. Hỏi có ít nhất bao nhiêu gia đình sở hữu cả ba thiết bị trên?
   2. Có nhiều nhất bao nhiêu gia đình sở hữu cả ba thiết bị trên?
   3. Giả sử số gia đình sở hữu cả ba thiết bị đạt giá trị nhỏ nhất, hãy cho biết có bao nhiêu gia đình không sở hữu thiết bị nào?
  ],
  loigiai: [
    #pp-box(title: [💡 Phân tích bản chất qua phần bù])[
      Để phần giao $n(R inter N inter M)$ đạt giá trị nhỏ nhất, ta cần phần bù của các tập hợp "rải đều" và không chồng chéo lên nhau trên không gian mẫu $100$ gia đình.
    ]

    *1. Tìm giá trị nhỏ nhất của $n(R inter N inter M)$:* \
    Gọi $U$ là tập hợp 100 gia đình được khảo sát ($n(U) = 100$).
    Xét các tập phần bù:
    - Số gia đình không có Robot hút bụi: $n(R') = 100 - 85 = 15$.
    - Số gia đình không có Nồi chiên không dầu: $n(N') = 100 - 80 = 20$.
    - Số gia đình không có Máy lọc không khí: $n(M') = 100 - 75 = 25$.

    Một gia đình không sở hữu đủ cả ba thiết bị khi và chỉ khi gia đình đó thuộc ít nhất một trong ba tập $R', N', M'$ (tức là thuộc $R' union N' union M'$).
    Theo bất đẳng thức cộng số phần tử:
    $ n(R' union N' union M') <= n(R') + n(N') + n(M') = 15 + 20 + 25 = 60. $
    Mặt khác, theo luật De Morgan:
    $ R inter N inter M = U \\ (R' union N' union M') $
    $ => n(R inter N inter M) = n(U) - n(R' union N' union M') >= 100 - 60 = 40. $
    Dấu bằng xảy ra khi và chỉ khi ba tập phần bù $R', N', M'$ đôi một rời nhau và nằm trọn trong $U$ (điều này hoàn toàn khả thi vì $15 + 20 + 25 = 60 <= 100$).
    Vậy có *ít nhất 40 gia đình* sở hữu cả ba thiết bị trên.

    #venn3-draw(
      name-a: $R$, name-b: $N$, name-c: $M$,
      x1: [$0$], x2: [$0$], x3: [$0$],
      y1: [$25$], y2: [$20$], y3: [$15$],
      z: [$40$], val-out: [$0$],
      title: [Trường hợp đạt Min = 40 (các phần bù ghép khít nhau)],
      s-len: 0.72cm
    )

    *2. Tìm giá trị lớn nhất của $n(R inter N inter M)$:* \
    Vì giao của ba tập là tập con của từng tập hợp nên:
    $ n(R inter N inter M) <= min{n(R), n(N), n(M)} = min{85, 80, 75} = 75. $
    Để đạt dấu bằng $n(R inter N inter M) = 75$, tập $M$ (có 75 phần tử) phải nằm hoàn toàn bên trong cả $R$ và $N$ ($M subset R$ và $M subset N$).
    Khi đó, nếu $M subset N subset R$:
    - $n(R union N union M) = n(R) = 85 <= 100$ (hoàn toàn thỏa mãn).
    Vậy có *nhiều nhất 75 gia đình* sở hữu cả ba thiết bị.

    *3. Số gia đình không sở hữu thiết bị nào khi $z$ đạt Min = 40:* \
    Khi $n(R inter N inter M) = 40$, ta có $n(R' union N' union M') = 60$.
    Số gia đình sở hữu ít nhất một thiết bị là:
    $ n(R union N union M) = 100 - n(R' inter N' inter M'). $
    Vì $R', N', M'$ rời nhau từng đôi một, không có phần tử nào thuộc giao của cả ba phần bù, tức là $n(R' inter N' inter M') = 0$, hoặc ta kiểm tra trực tiếp:
    Tổng số gia đình có thiết bị trong trường hợp dấu bằng đạt được là:
    $ 40 + 25 + 20 + 15 = 100 text(" gia đình"). $
    Do đó, số gia đình không sở hữu thiết bị nào là: $100 - 100 = 0$ gia đình.

    #kq-box[
      + Giá trị nhỏ nhất là *40* gia đình (Áp dụng Bonferroni: $85 + 80 + 75 - 2 dot 100 = 40$).
      + Giá trị lớn nhất là *75* gia đình ($min{85, 80, 75}$).
    ]
  ],
  theme-color: C-sec,
)

== Dạng 3: Kiểm Định Tính Logic & Phát Hiện Dữ Liệu Gian Lận Thống Kê

#vd(
  [*(Bài toán Kiểm toán Dữ liệu Thống kê)* \
   Một thanh tra giáo dục tiến hành kiểm tra báo cáo thành tích của một lớp chuyên gồm 50 học sinh. Bản báo cáo có các số liệu sau:
   - Có 35 em đạt danh hiệu học sinh Giỏi Toán ($T$).
   - Có 32 em đạt danh hiệu học sinh Giỏi Vật lý ($L$).
   - Có 30 em đạt danh hiệu học sinh Giỏi Hóa học ($H$).
   - Có 22 em giỏi cả Toán và Lý.
   - Có 18 em giỏi cả Lý và Hóa.
   - Có 20 em giỏi cả Toán và Hóa.
   - Có 15 em giỏi cả ba môn Toán, Lý, Hóa.
   - Có 3 em không giỏi môn nào trong ba môn trên.
   Thanh tra kết luận ngay: *"Bản báo cáo này có số liệu bị làm giả hoặc bị nhầm lẫn nghiêm trọng!"*. Bằng lập luận toán học và biểu đồ Venn, em hãy chứng minh kết luận của thanh tra là hoàn toàn chính xác.
  ],
  loigiai: [
    #pp-box(title: [💡 Phương pháp vạch trần số liệu mâu thuẫn])[
      Một bảng số liệu tập hợp chỉ hợp lệ khi và chỉ khi:
      1. Tổng số phần tử hợp không vượt quá sĩ số không gian mẫu.
      2. *Tất cả các miền nguyên tử phải có số phần tử là số nguyên không âm* ($x_i >= 0$). Chỉ cần một miền nguyên tử bị âm ($x_i < 0$), số liệu chắc chắn sai!
    ]

    *Cách 1: Kiểm tra tổng số học sinh bằng Nguyên lý bù trừ.* \
    Theo số liệu báo cáo, số học sinh giỏi ít nhất một môn là:
    $ n(T union L union H) = [n(T) + n(L) + n(H)] - [n(T inter L) + n(L inter H) + n(T inter H)] + n(T inter L inter H) $
    Thay các số liệu báo cáo vào:
    $ n(T union L union H) = (35 + 32 + 30) - (22 + 18 + 20) + 15 = 97 - 60 + 15 = 52. $
    Tuy nhiên, theo báo cáo: sĩ số lớp là $50$ em và có $3$ em không giỏi môn nào.
    Do đó, số học sinh giỏi ít nhất một môn trên thực tế tối đa chỉ có thể là:
    $ 50 - 3 = 47 text(" em"). $
    Rõ ràng $52 != 47$ (thậm chí $52 > 50$, vượt quá cả tổng sĩ số toàn lớp!). Đây là mâu thuẫn thứ nhất.

    *Cách 2: Phân rã trực tiếp vào từng miền nguyên tử.* \
    Giả sử số liệu là đúng, ta tính số học sinh ở từng miền:
    - Số học sinh giỏi cả 3 môn: $z = 15$.
    - Số học sinh chỉ giỏi Toán và Lý: $y_1 = n(T inter L) - z = 22 - 15 = 7$.
    - Số học sinh chỉ giỏi Lý và Hóa: $y_2 = n(L inter H) - z = 18 - 15 = 3$.
    - Số học sinh chỉ giỏi Toán và Hóa: $y_3 = n(T inter H) - z = 20 - 15 = 5$.
    Bây giờ ta tính số học sinh *chỉ giỏi môn Vật lý*:
    $ x_2 = n(L) - y_1 - y_2 - z = 32 - 7 - 3 - 15 = 7 >= 0. $
    Tính số học sinh *chỉ giỏi môn Toán*:
    $ x_1 = n(T) - y_1 - y_3 - z = 35 - 7 - 5 - 15 = 8 >= 0. $
    Tính số học sinh *chỉ giỏi môn Hóa học*:
    $ x_3 = n(H) - y_2 - y_3 - z = 30 - 3 - 5 - 15 = 7 >= 0. $
    Tổng số học sinh giỏi ít nhất một môn là:
    $ S = x_1 + x_2 + x_3 + y_1 + y_2 + y_3 + z = 8 + 7 + 7 + 7 + 3 + 5 + 15 = 52. $
    Cộng thêm 3 em không giỏi môn nào: $52 + 3 = 55 > 50$.

    #kq-box[
      Bản báo cáo khẳng định lớp có 50 em nhưng các số liệu liệt kê lại tạo ra tổng số 55 học sinh ($52$ em giỏi ít nhất một môn $+ 3$ em không giỏi môn nào $= 55$). Số liệu mâu thuẫn hoàn toàn, kết luận của thanh tra là chính xác 100%!
    ]
  ],
  theme-color: C-warn,
)

== Dạng 4: Biểu Đồ Venn Trong Số Học & Sàng Eratosthenes

#vd(
  [*(Bài toán Đếm số học nâng cao - Sàng BCNN)* \
   Cho tập hợp các số nguyên dương $S = {1, 2, 3, dots, 1200}$.
   1. Có bao nhiêu số trong $S$ chia hết cho ít nhất một trong ba số $4, 6, 10$?
   2. Có bao nhiêu số trong $S$ chia hết cho đúng hai trong ba số $4, 6, 10$?
   3. Có bao nhiêu số trong $S$ nguyên tố cùng nhau với $60$?
  ],
  loigiai: [
    #pp-box(title: [💡 Cạm bẫy BCNN khi các số không nguyên tố cùng nhau])[
      Khi tính giao của các tập chia hết, ta phải lấy *Bội chung nhỏ nhất (BCNN)* của các số, TUYỆT ĐỐI KHÔNG được nhân thẳng các số lại với nhau!
      Ví dụ: Một số chia hết cho cả 4 và 6 là số chia hết cho $[4, 6] = 12$, chứ không phải chia hết cho $4 dot 6 = 24$!
    ]

    Gọi:
    - $A = {x in S : 4 mid x}$, số phần tử $|A| = floor(1200 / 4) = 300$.
    - $B = {x in S : 6 mid x}$, số phần tử $|B| = floor(1200 / 6) = 200$.
    - $C = {x in S : 10 mid x}$, số phần tử $|C| = floor(1200 / 10) = 120$.

    *Bước 1: Tính các phần giao đôi một (dùng BCNN):*
    - $A inter B$: các số chia hết cho $[4, 6] = 12$.
      $|A inter B| = floor(1200 / 12) = 100$.
    - $B inter C$: các số chia hết cho $[6, 10] = 30$.
      $|B inter C| = floor(1200 / 30) = 40$.
    - $C inter A$: các số chia hết cho $[10, 4] = 20$.
      $|C inter A| = floor(1200 / 20) = 60$.

    *Bước 2: Tính phần giao cả ba tập:*
    - $A inter B inter C$: các số chia hết cho $[4, 6, 10] = 60$.
      $|A inter B inter C| = floor(1200 / 60) = 20$.

    #venn3-draw(
      name-a: [Chia 4], name-b: [Chia 6], name-c: [Chia 10],
      x1: [$160$], x2: [$80$], x3: [$40$],
      y1: [$80$], y2: [$40$], y3: [$20$],
      z: [$20$], val-out: [$760$],
      title: [Phân bố số học các tập chia hết cho 4, 6, 10],
      s-len: 0.72cm
    )

    *1. Số các số chia hết cho ít nhất một trong ba số 4, 6, 10:* \
    Áp dụng nguyên lý bù trừ:
    $ |A union B union C| = (|A| + |B| + |C|) - (|A inter B| + |B inter C| + |C inter A|) + |A inter B inter C| $
    $ = (300 + 200 + 120) - (100 + 40 + 60) + 20 = 620 - 200 + 20 = 440 text(" số"). $

    *2. Số các số chia hết cho đúng hai trong ba số 4, 6, 10:* \
    Theo công thức tầng miền ở Mục 1.1:
    $ S_2 = (|A inter B| + |B inter C| + |C inter A|) - 3 |A inter B inter C| $
    $ = (100 + 40 + 60) - 3 dot 20 = 200 - 60 = 140 text(" số"). $
    (Hoặc cộng trực tiếp từng vùng: $y_1 + y_2 + y_3 = (100 - 20) + (60 - 20) + (40 - 20) = 80 + 40 + 20 = 140$).

    *3. Số các số nguyên tố cùng nhau với 60:* \
    Phân tích thừa số nguyên tố: $60 = 2^2 dot 3 dot 5$.
    Một số nguyên tố cùng nhau với $60$ khi và chỉ khi nó không chia hết cho bất kỳ ước nguyên tố nào của 60 (tức là không chia hết cho 2, 3 và 5).
    Đặt:
    - $P_2 = {x in S : 2 mid x}$, $|P_2| = 1200 / 2 = 600$.
    - $P_3 = {x in S : 3 mid x}$, $|P_3| = 1200 / 3 = 400$.
    - $P_5 = {x in S : 5 mid x}$, $|P_5| = 1200 / 5 = 240$.
    Vì $2, 3, 5$ đôi một nguyên tố cùng nhau nên:
    - $|P_2 inter P_3| = 1200 / 6 = 200$.
    - $|P_3 inter P_5| = 1200 / 15 = 80$.
    - $|P_5 inter P_2| = 1200 / 10 = 120$.
    - $|P_2 inter P_3 inter P_5| = 1200 / 30 = 40$.
    Số lượng các số chia hết cho ít nhất một trong ba số 2, 3, 5 là:
    $ |P_2 union P_3 union P_5| = (600 + 400 + 240) - (200 + 80 + 120) + 40 = 1240 - 400 + 40 = 880. $
    Vậy số lượng các số nguyên tố cùng nhau với 60 là:
    $ 1200 - 880 = 320 text(" số"). $
    *(Kiểm chứng bằng Hàm phi Euler: $phi(60) = 60 dot (1 - 1/2)(1 - 1/3)(1 - 1/5) = 16$. Trong mỗi chu kỳ 60 số có 16 số nguyên tố cùng nhau với 60. Với 1200 số có đúng $1200 / 60 = 20$ chu kỳ, tổng cộng: $20 dot 16 = 320$ số. Hoàn toàn khớp!)*
  ],
  theme-color: C-purp,
)

== Dạng 5: Mở Rộng 4 Tập Hợp & Bài Toán Tình Huống Thực Tế ĐGNL

#vd(
  [*(Bài toán Tuyển dụng Nhân sự Hàng không - 4 Tiêu chuẩn)* \
   Một hãng hàng không quốc tế tuyển dụng tiếp viên với 4 tiêu chuẩn khắt khe: Ngoại ngữ xuất sắc ($A$), Ngoại hình đạt chuẩn ($B$), Kỹ năng sơ cấp cứu y tế ($C$), Kỹ năng xử lý khủng hoảng ($D$). Có $120$ ứng viên lọt vào vòng chung kết. Thống kê cho biết:
   - Mỗi ứng viên đều đạt ít nhất một trong bốn tiêu chuẩn trên.
   - Số ứng viên đạt tiêu chuẩn $A, B, C, D$ lần lượt là $70, 65, 60, 55$.
   - Mỗi cặp 2 tiêu chuẩn bất kỳ đều có đúng $25$ ứng viên đạt đồng thời.
   - Mỗi bộ 3 tiêu chuẩn bất kỳ đều có đúng $10$ ứng viên đạt đồng thời.
   Hỏi có bao nhiêu ứng viên xuất sắc đạt trọn vẹn cả 4 tiêu chuẩn để được tuyển thẳng vào khoang Thương gia?
  ],
  loigiai: [
    #pp-box(title: [💡 Bản chất của bài toán 4 tập hợp mang tính đối xứng])[
      Mô hình 4 tập hợp có tổng cộng $2^4 = 16$ miền nguyên tử. Khi các phần giao đôi một và bộ ba đều có tính đối xứng bằng nhau, ta áp dụng trực tiếp công thức Nguyên lý bù trừ 4 tập hợp.
    ]

    Gọi $A, B, C, D$ lần lượt là tập các ứng viên đạt tiêu chuẩn tương ứng.
    Theo đề bài:
    - Tổng số ứng viên đạt ít nhất một tiêu chuẩn: $n(A union B union C union D) = 120$.
    - Tổng số phần tử từng tập đơn lẻ:
      $ Sigma_1 = n(A) + n(B) + n(C) + n(D) = 70 + 65 + 60 + 55 = 250. $
    - Số cặp gồm 2 tập hợp chọn từ 4 tập là $binom(4, 2) = 6$ cặp. Mỗi cặp có 25 người:
      $ Sigma_2 = sum_(1 <= i < j <= 4) n(A_i inter A_j) = 6 dot 25 = 150. $
    - Số bộ gồm 3 tập hợp chọn từ 4 tập là $binom(4, 3) = 4$ bộ. Mỗi bộ có 10 người:
      $ Sigma_3 = sum_(1 <= i < j < k <= 4) n(A_i inter A_j inter A_k) = 4 dot 10 = 40. $
    - Gọi $x = n(A inter B inter C inter D)$ là số ứng viên đạt cả 4 tiêu chuẩn cần tìm.

    Áp dụng công thức Nguyên lý bù trừ cho 4 tập hợp:
    $ n(A union B union C union D) = Sigma_1 - Sigma_2 + Sigma_3 - Sigma_4 $
    Thay các giá trị vào phương trình:
    $ 120 = 250 - 150 + 40 - x $
    $ <=> 120 = 140 - x <=> x = 140 - 120 = 20. $

    #kq-box[
      Có đúng *20 ứng viên* đạt trọn vẹn cả 4 tiêu chuẩn.
    ]
  ],
  theme-color: C-main,
)

// ═══════════════════════════════════════════════════════════════════════════
= PHẦN III: HỆ THỐNG BÀI TẬP TUYỂN CHỌN ĐẲNG CẤP (CHUẨN FORMAT BỘ GD&ĐT 2025)

// KÍCH HOẠT CHẾ ĐỘ HIỂN THỊ LỜI GIẢI CHI TIẾT 100% CHO TOÀN BỘ BÀI TẬP
#let (tn, ds, tln, tl) = exam-mode(mode: "loigiai", accent: C-main)
#resetexamstate()

// ─────────────────────────────────────────────────────────────────────────
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi thí sinh chỉ chọn một phương án)], count: 10, reset-counter: true)

#tn(
  dir: "ngang",
  [Một lớp học có 45 học sinh. Trong đợt khảo sát năng khiếu thể thao, có 28 em đăng ký môn Bơi lội, 24 em đăng ký môn Cầu lông. Biết rằng có 5 em không đăng ký môn nào. Số học sinh chỉ đăng ký duy nhất môn Cầu lông là:],
  (
    True([$12$.]),
    [$16$.],
    [$11$.],
    [$7$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng mô hình miền nguyên tử của 2 tập hợp và công thức phần bù.

    ✍️ *Lời giải chi tiết:* \
    - Gọi $B$ là tập học sinh đăng ký Bơi lội, $C$ là tập học sinh đăng ký Cầu lông.
    - Số học sinh đăng ký ít nhất một môn thể thao là:
      $ n(B union C) = 45 - 5 = 40 text(" học sinh"). $
    - Số học sinh đăng ký cả hai môn là số phần tử của $B inter C$:
      $ n(B inter C) = n(B) + n(C) - n(B union C) = 28 + 24 - 40 = 12 text(" học sinh"). $
    - Số học sinh chỉ đăng ký duy nhất môn Cầu lông là:
      $ n(C \\ B) = n(C) - n(B inter C) = 24 - 12 = 12 text(" học sinh"). $
    - Số học sinh chỉ đăng ký duy nhất môn Bơi lội là:
      $ n(B \\ C) = n(B) - n(B inter C) = 28 - 12 = 16 text(" học sinh"). $

    #venn2-draw(name-a: [Bơi (28)], name-b: [Cầu lông (24)], val-a: [16], val-ab: [12], val-b: [12], val-out: [5], title: [Phân bố thể thao lớp 45 học sinh], s-len: 0.65cm)

    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Cho hai tập hợp $A$ và $B$ thỏa mãn $n(A) = 25$, $n(B) = 18$ và $n(A union B) = 33$. Giá trị của $n(A Delta B) = n(A \\ B) + n(B \\ A)$ (hiệu đối xứng của hai tập hợp) là:],
  (
    [$10$.],
    True([$23$.]),
    [$15$.],
    [$8$.],
  ),
  loigiai: [
    Ta có $n(A inter B) = n(A) + n(B) - n(A union B) = 25 + 18 - 33 = 10$.
    Khi đó số phần tử chỉ thuộc $A$ là: $n(A \\ B) = 25 - 10 = 15$.
    Số phần tử chỉ thuộc $B$ là: $n(B \\ A) = 18 - 10 = 8$.
    Hiệu đối xứng là: $n(A Delta B) = 15 + 8 = 23$. \
    *(Hoặc tính nhanh: $n(A Delta B) = n(A union B) - n(A inter B) = 33 - 10 = 23$.)* \
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Trong một hội thảo khoa học quốc tế có 100 đại biểu. Có 75 người nói được tiếng Anh, 60 người nói được tiếng Pháp và 45 người nói được tiếng Nga. Mỗi đại biểu nói được ít nhất một thứ tiếng. Hỏi có ít nhất bao nhiêu đại biểu nói được cả ba thứ tiếng?],
  (
    True([$0$.]),
    [$10$.],
    [$15$.],
    [$20$.],
  ),
  loigiai: [
    Áp dụng bất đẳng thức Bonferroni: $n(A inter B inter C) >= n(A) + n(B) + n(C) - 2 n(U) = 75 + 60 + 45 - 2 dot 100 = 180 - 200 = -20$.
    Vì số phần tử không âm nên cận dưới theo Bonferroni là $max{0, -20} = 0$.
    Ta kiểm tra xem có tồn tại mô hình mà số người nói cả 3 thứ tiếng bằng 0 hay không:
    Cho $z = 0$. Khi đó ta hoàn toàn có thể phân phối các đại biểu nói 2 thứ tiếng sao cho tổng vẫn bằng 100 người.
    Do đó có ít nhất $0$ người nói được cả 3 thứ tiếng. \
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Một câu lạc bộ có 50 thành viên. Khảo sát về 3 kỹ năng Lập trình ($L$), Đồ họa ($D$) và Thuyết trình ($T$): có 30 bạn biết Lập trình, 25 bạn biết Đồ họa, 28 bạn biết Thuyết trình. Biết mỗi bạn đều thành thạo ít nhất một kỹ năng và có đúng 12 bạn thành thạo cả ba kỹ năng. Số bạn thành thạo đúng hai kỹ năng là:],
  (
    [$15$.],
    [$19$.],
    [$21$.],
    True([$9$.]),
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng Định lý Đẳng thức Tầng Miền (Mục 1.1).

    ✍️ *Lời giải chi tiết:* \
    - Gọi $S_1, S_2, S_3$ lần lượt là số người biết đúng 1, đúng 2, cả 3 kỹ năng.
    - Theo đề bài:
      + Mỗi bạn đều thành thạo ít nhất một kỹ năng: $N_("hop") = S_1 + S_2 + S_3 = 50$.
      + Có đúng 12 bạn thành thạo cả ba kỹ năng: $S_3 = z = 12$.
      + Tổng số kỹ năng đơn lẻ của các thành viên:
        $ Sigma_1 = n(L) + n(D) + n(T) = 30 + 25 + 28 = 83. $
    - Mặt khác, theo định lý phân tầng miền nguyên tử:
      $ Sigma_1 = S_1 + 2 S_2 + 3 S_3 = 83. $
    - Ta có hệ phương trình hai ẩn $S_1, S_2$:
      $ cases(
        S_1 + S_2 = 50 - 12 = 38,
        S_1 + 2 S_2 = 83 - 3 dot 12 = 47,
      ) $
    - Lấy phương trình dưới trừ phương trình trên:
      $ S_2 = 47 - 38 = 9 text(" bạn"). $
    Vậy có đúng $9$ bạn thành thạo đúng hai kỹ năng.

    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Có bao nhiêu số tự nhiên nhỏ hơn 1000 mà chia hết cho ít nhất một trong hai số 5 hoặc 7?],
  (
    [$314$.],
    True([$313$.]),
    [$341$.],
    [$342$.],
  ),
  loigiai: [
    Tập hợp các số tự nhiên nhỏ hơn 1000 là $S = {0, 1, 2, dots, 999}$ gồm 1000 số.
    Nếu tính từ 1 đến 999:
    - Số chia hết cho 5: $floor(999 / 5) = 199$ số.
    - Số chia hết cho 7: $floor(999 / 7) = 142$ số.
    - Số chia hết cho cả 5 và 7 (chia hết cho 35): $floor(999 / 35) = 28$ số.
    Số các số nguyên dương chia hết cho 5 hoặc 7 là: $199 + 142 - 28 = 313$ số.
    Cộng thêm số $0$ (vì $0$ là số tự nhiên chia hết cho cả 5 và 7): $313 + 1 = 314$.
    Nếu đề bài xét các số nguyên dương $1 <= n < 1000$, đáp án là $313$. \
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Một giải đấu cờ vua có 30 kỳ thủ tham gia. Thống kê kết quả thi đấu: có 18 kỳ thủ từng thắng ván cầm quân Trắng, 16 kỳ thủ từng thắng ván cầm quân Đen, và 5 kỳ thủ chưa từng thắng ván nào. Số kỳ thủ từng thắng ở cả hai vị trí cầm quân Trắng và Đen là:],
  (
    [$7$.],
    True([$9$.]),
    [$11$.],
    [$14$.],
  ),
  loigiai: [
    Số kỳ thủ từng thắng ít nhất một ván là: $30 - 5 = 25$.
    Số kỳ thủ thắng ở cả hai màu quân là: $18 + 16 - 25 = 9$ người. \
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Trong một đợt khám sức khỏe cho 80 công nhân nhà máy, kết quả cho thấy: có 45 người có vấn đề về Thị lực, 38 người có vấn đề về Huyết áp. Hỏi số lượng công nhân mắc cả hai vấn đề trên có thể nhận giá trị lớn nhất ($M$) và nhỏ nhất ($m$) lần lượt là:],
  (
    [$M = 45, m = 0$.],
    [$M = 38, m = 0$.],
    True([$M = 38, m = 3$.]),
    [$M = 45, m = 3$.],
  ),
  loigiai: [
    Áp dụng công thức chặn của giao hai tập hợp:
    $ max{0, n(T) + n(H) - N} <= n(T inter H) <= min{n(T), n(H)} $
    $ max{0, 45 + 38 - 80} <= n(T inter H) <= min{45, 38} $
    $ max{0, 3} <= n(T inter H) <= 38 <=> 3 <= n(T inter H) <= 38. $
    Do đó $M = 38$ và $m = 3$. \
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho ba tập hợp $A, B, C$ đôi một giao nhau. Biết $n(A) = 20, n(B) = 22, n(C) = 24$. Tổng số phần tử lớn nhất có thể của hợp $n(A union B union C)$ đạt được khi nào?],
  (
    [Khi $A, B, C$ trùng nhau.],
    [Khi mỗi cặp giao nhau đúng 1 phần tử.],
    True([Khi $A, B, C$ đôi một rời nhau (không giao nhau).]),
    [Khi một tập là con của hai tập còn lại.],
  ),
  loigiai: [
    Ta có $n(A union B union C) <= n(A) + n(B) + n(C) = 20 + 22 + 24 = 66$.
    Giá trị lớn nhất này đạt được khi và chỉ khi ba tập đôi một rời nhau (phần giao bằng rỗng). \
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Một cuộc khảo sát trên 100 độc giả báo điện tử về ba chuyên mục: Kinh doanh ($K$), Thể thao ($T$) và Công nghệ ($C$). Có 65 người đọc Kinh doanh, 55 người đọc Thể thao, 50 người đọc Công nghệ. Biết rằng không có ai đọc cả ba chuyên mục và mỗi người đọc ít nhất một chuyên mục. Số người đọc đúng hai chuyên mục là:],
  (
    [$50$.],
    True([$70$.]),
    [$60$.],
    [$30$.],
  ),
  loigiai: [
    Gọi $S_1, S_2, S_3$ là số người đọc đúng 1, đúng 2, cả 3 chuyên mục.
    Theo giả thiết: $S_3 = 0$, $N_("hop") = 100$.
    Ta có hệ phương trình:
    $ cases(
      S_1 + S_2 = 100 ,
      S_1 + 2 S_2 = 65 + 55 + 50 = 170
    ) $
    Lấy phương trình (2) trừ phương trình (1):
    $ S_2 = 170 - 100 = 70. $
    Vậy có đúng $70$ người đọc đúng hai chuyên mục! \
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $X = {1, 2, 3, dots, 500}$. Số các phần tử của $X$ chia hết cho 3 nhưng không chia hết cho cả 2 và 5 là:],
  (
    True([$66$.]),
    [$133$.],
    [$67$.],
    [$100$.],
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng nguyên lý bù trừ trên tập các bội số của 3.

    ✍️ *Lời giải chi tiết:* \
    - Gọi $A$ là tập các số trong $X$ chia hết cho 3. Ta có:
      $ |A| = floor(500 / 3) = 166 text(" số"). $
    - Trong tập $A$:
      + Số chia hết cho 2 chính là các số chia hết cho $[3, 2] = 6$:
        $ |A_2| = floor(500 / 6) = 83 text(" số"). $
      + Số chia hết cho 5 chính là các số chia hết cho $[3, 5] = 15$:
        $ |A_5| = floor(500 / 15) = 33 text(" số"). $
      + Số chia hết cho cả 2 và 5 chính là các số chia hết cho $[3, 2, 5] = 30$:
        $ |A_(2, 5)| = floor(500 / 30) = 16 text(" số"). $
    - Số phần tử trong $A$ chia hết cho ít nhất một trong hai số 2 hoặc 5 là:
      $ |A_2 union A_5| = |A_2| + |A_5| - |A_(2, 5)| = 83 + 33 - 16 = 100 text(" số"). $
    - Vậy số phần tử của $X$ chia hết cho 3 nhưng không chia hết cho 2 và 5 là:
      $ |A| - |A_2 union A_5| = 166 - 100 = 66 text(" số"). $

    ✅ *Chọn đáp án A.*
  ]
)

// ─────────────────────────────────────────────────────────────────────────
#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)], count: 4, reset-counter: true)

#ds(
  [Lớp 10A có 42 học sinh tham gia tuần lễ văn hóa thể thao. Có 20 bạn đăng ký thi cờ vua, 22 bạn đăng ký thi bóng bàn và 18 bạn đăng ký thi cầu lông. Trong đó, có 8 bạn thi cả cờ vua và bóng bàn, 7 bạn thi cả bóng bàn và cầu lông, 6 bạn thi cả cờ vua và cầu lông. Có 3 bạn đăng ký cả ba môn thể thao trên. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([Có đúng 42 học sinh tham gia ít nhất một môn thể thao.]),
    True([Số học sinh chỉ tham gia đúng môn cờ vua là 9 bạn.]),
    [Số học sinh tham gia đúng hai môn thể thao là 18 bạn.],
    [Số học sinh tham gia đúng một môn thể thao là 24 bạn.],
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng mô hình 8 miền nguyên tử của 3 tập hợp.

    ✍️ *Lời giải chi tiết:* \
    - Gọi $V, B, C$ lần lượt là tập học sinh thi Cờ vua, Bóng bàn, Cầu lông.
    - Miền giao cả 3 môn: $z = 3$.
    - Các miền giao đúng 2 môn:
      + Chỉ Cờ vua và Bóng bàn: $y_1 = n(V inter B) - z = 8 - 3 = 5$.
      + Chỉ Bóng bàn và Cầu lông: $y_2 = n(B inter C) - z = 7 - 3 = 4$.
      + Chỉ Cờ vua và Cầu lông: $y_3 = n(V inter C) - z = 6 - 3 = 3$.
      Tổng số bạn tham gia đúng 2 môn là: $S_2 = y_1 + y_2 + y_3 = 5 + 4 + 3 = 12$ bạn.
    - Các miền chỉ tham gia đúng 1 môn:
      + Chỉ Cờ vua: $x_1 = 20 - (5 + 3 + 3) = 9$ bạn.
      + Chỉ Bóng bàn: $x_2 = 22 - (5 + 4 + 3) = 10$ bạn.
      + Chỉ Cầu lông: $x_3 = 18 - (4 + 3 + 3) = 8$ bạn.
      Tổng số bạn tham gia đúng 1 môn: $S_1 = x_1 + x_2 + x_3 = 9 + 10 + 8 = 27$ bạn.
    - Tổng số học sinh tham gia ít nhất một môn:
      $ N_("hop") = S_1 + S_2 + S_3 = 27 + 12 + 3 = 42 text(" học sinh"). $

    #venn3-draw(
      name-a: [Cờ vua (20)], name-b: [Bóng bàn (22)], name-c: [Cầu lông (18)],
      x1: [9], x2: [10], x3: [8],
      y1: [5], y2: [3], y3: [4],
      z: [3], val-out: [0],
      title: [Phân bố 42 học sinh theo 3 môn thể thao],
      s-len: 0.65cm
    )

    - a) *Đúng*, có đúng 42 học sinh tham gia ít nhất một môn thể thao.
    - b) *Đúng*, số học sinh chỉ thi cờ vua là $x_1 = 9$ bạn.
    - c) *Sai*, số học sinh tham gia đúng hai môn thể thao là $12$ bạn (không phải 18).
    - d) *Sai*, số học sinh tham gia đúng một môn thể thao là $27$ bạn (không phải 24).
  ]
)

#ds(
  [Một công ty du lịch khảo sát 100 du khách nước ngoài về ba địa điểm du lịch tại Việt Nam: Hà Nội ($H$), Đà Nẵng ($D$) và TP. Hồ Chí Minh ($M$). Kết quả thu được: $n(H) = 60$, $n(D) = 55$, $n(M) = 50$. Gọi $x$ là số du khách đã đến thăm cả ba địa điểm trên. Biết rằng toàn bộ 100 du khách đều đã đến ít nhất một trong ba địa điểm. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Số du khách đến cả ba địa điểm $x$ không thể vượt quá 50.]),
    True([Giá trị nhỏ nhất có thể của $x$ theo bất đẳng thức Bonferroni là 0.]),
    True([Nếu có đúng 10 du khách đến cả ba địa điểm thì số người đến đúng hai địa điểm luôn bằng 45.]),
    [Số du khách đến đúng một địa điểm có thể đạt giá trị lớn nhất là 70.],
  ),
  loigiai: [
    📌 *Phương pháp:* Áp dụng Định lý Đẳng thức Tầng Miền và Bất đẳng thức Bonferroni.

    ✍️ *Lời giải chi tiết:* \
    - Gọi $S_1, S_2, x$ lần lượt là số người đến đúng 1, đúng 2, cả 3 địa điểm.
    - Theo đề bài: $N_("hop") = S_1 + S_2 + x = 100$.
    - Tổng lượt khách đơn lẻ: $Sigma_1 = 60 + 55 + 50 = 165 => S_1 + 2 S_2 + 3 x = 165$.
    - Lấy phương trình dưới trừ phương trình trên:
      $ S_2 + 2x = 65 <=> S_2 = 65 - 2x. $
    - Thay vào biểu thức của $S_1$:
      $ S_1 = 100 - S_2 - x = 100 - (65 - 2x) - x = 35 + x. $
    - Xét từng khẳng định:
      + a) *Đúng*, vì $x <= min{n(H), n(D), n(M)} = min{60, 55, 50} = 50$.
      + b) *Đúng*, theo Bonferroni: $x >= 60 + 55 + 50 - 2 dot 100 = -35 => x_("min") = 0$.
      + c) *Đúng*, khi $x = 10$ thì số người đến đúng hai địa điểm là $S_2 = 65 - 2(10) = 45$.
      + d) *Sai*, vì $S_2 = 65 - 2x >= 0 => x <= 32.5 => x <= 32$ (với $x in NN$).
        Do đó $S_1 = 35 + x <= 35 + 32 = 67 < 70$.
  ]
)

#ds(
  [Trong đợt tình nguyện Mùa hè xanh, một đội sinh viên gồm 40 người tham gia 3 đội hình chuyên trách: Dạy học ($D$), Tiếp sức mùa thi ($T$) và Bảo vệ môi trường ($M$). Biết rằng:
  - Có 22 bạn tham gia Dạy học; 18 bạn tham gia Tiếp sức mùa thi.
  - Số bạn tham gia Bảo vệ môi trường bằng số bạn tham gia cả Dạy học và Tiếp sức mùa thi.
  - Không có bạn nào tham gia cả ba đội hình.
  - Có 4 bạn không tham gia đội hình nào.
  Xét tính đúng/sai của các khẳng định sau:],
  (
    True([Số sinh viên tham gia ít nhất một đội hình là 36 bạn.]),
    True([Số sinh viên tham gia cả Dạy học và Tiếp sức mùa thi không vượt quá 18 bạn.]),
    [Số sinh viên tham gia Bảo vệ môi trường luôn lớn hơn 20 bạn.],
    True([Nếu có 10 bạn tham gia cả Dạy học và Tiếp sức mùa thi thì có đúng 10 bạn tham gia Bảo vệ môi trường.]),
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng tính chất tập con và miền nguyên tử.

    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*: Sĩ số 40 bạn, có 4 bạn không tham gia nên số bạn tham gia ít nhất một đội hình là $40 - 4 = 36$.
    - b) *Đúng*: Vì $D inter T subset T$ nên $n(D inter T) <= n(T) = 18$ bạn.
    - c) *Sai*: Theo giả thiết $n(M) = n(D inter T) <= 18 < 20$.
    - d) *Đúng*: Trực tiếp từ giả thiết $n(M) = n(D inter T) = 10$.
  ]
)

#ds(
  [Cho tập hợp $E = {1, 2, 3, dots, 600}$. Gọi $A, B, C$ lần lượt là tập hợp các số trong $E$ chia hết cho 6, 8 và 12. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([Tập hợp $C$ là tập con của tập hợp $A$.]),
    True([Số phần tử của $A inter B$ bằng 25.]),
    [Số phần tử của $A union B union C$ bằng 125.],
    True([Có đúng 450 phần tử của $E$ không chia hết cho cả 6, 8 và 12.]),
  ),
  loigiai: [
    📌 *Phương pháp:* Sử dụng tính chất BCNN và quan hệ bao hàm giữa các tập chia hết.

    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*: Vì mọi số chia hết cho 12 đều chia hết cho 6 ($12k = 6 dot 2k$), nên mọi phần tử của $C$ đều thuộc $A$, tức là $C subset A$.
    - b) *Đúng*: Giao $A inter B$ là tập các số chia hết cho cả 6 và 8, tức chia hết cho $[6, 8] = 24$.
      Số phần tử: $|A inter B| = floor(600 / 24) = 25$.
    - c) *Sai*: Vì $C subset A$ nên $A union C = A$.
      Do đó: $A union B union C = A union B$.
      Ta có: $|A| = floor(600 / 6) = 100$, $|B| = floor(600 / 8) = 75$, $|A inter B| = 25$.
      $=> |A union B union C| = |A union B| = 100 + 75 - 25 = 150 != 125$.
    - d) *Đúng*: Số phần tử của $E$ không chia hết cho số nào trong cả ba số là:
      $ 600 - |A union B union C| = 600 - 150 = 450 text(" số"). $
  ]
)

// ─────────────────────────────────────────────────────────────────────────
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (Thí sinh viết câu trả lời bằng số)], count: 6, reset-counter: true)

#tln(
  dir: "ngang",
  [Khảo sát 120 học sinh khối 10 của một trường THPT về việc sử dụng mạng xã hội: có 95 em dùng Facebook, 80 em dùng TikTok và 70 em dùng Instagram. Hỏi có ít nhất bao nhiêu học sinh dùng cả ba mạng xã hội trên?],
  [5],
  loigiai: [
    Áp dụng bất đẳng thức Bonferroni cho 3 tập hợp trong vũ trụ $N = 120$:
    $ n(F inter T inter I) >= n(F) + n(T) + n(I) - 2 N = 95 + 80 + 70 - 2(120) = 245 - 240 = 5. $
    Vậy có ít nhất $5$ học sinh sử dụng cả ba mạng xã hội trên. \
    ✅ *Đáp số:* 5.
  ]
)

#tln(
  dir: "ngang",
  [Trong tập hợp 1000 số nguyên dương đầu tiên ${1, 2, 3, dots, 1000}$, có bao nhiêu số chia hết cho ít nhất một trong hai số 6 hoặc 9?],
  [222],
  loigiai: [
    - Số chia hết cho 6: $floor(1000 / 6) = 166$.
    - Số chia hết cho 9: $floor(1000 / 9) = 111$.
    - Số chia hết cho cả 6 và 9 (chia hết cho $[6, 9] = 18$): $floor(1000 / 18) = 55$.
    Số lượng các số thỏa mãn: $166 + 111 - 55 = 222$. \
    ✅ *Đáp số:* 222.
  ]
)

#tln(
  dir: "ngang",
  [Một đội tuyển thi đấu thể thao gồm 35 vận động viên. Có 20 người thi đấu Điền kinh, 18 người thi đấu Bơi lội và 15 người thi đấu Bắn súng. Biết có 7 người thi cả Điền kinh và Bơi lội; 6 người thi cả Bơi lội và Bắn súng; 8 người thi cả Điền kinh và Bắn súng. Mỗi vận động viên đều thi ít nhất một môn. Hỏi có bao nhiêu vận động viên thi đấu cả ba môn?],
  [3],
  loigiai: [
    Áp dụng nguyên lý bù trừ 3 tập hợp:
    $ 35 = 20 + 18 + 15 - (7 + 6 + 8) + z $
    $ <=> 35 = 53 - 21 + z <=> 35 = 32 + z <=> z = 3. $
    ✅ *Đáp số:* 3.
  ]
)

#tln(
  dir: "ngang",
  [Lớp 10B có 45 học sinh. Trong đợt kiểm tra cuối kỳ I môn Toán, có 3 câu hỏi nâng cao. Kết quả: có 20 em làm được câu 1; 18 em làm được câu 2; 15 em làm được câu 3. Có 8 em làm được câu 1 và 2; 7 em làm được câu 2 và 3; 6 em làm được câu 1 và 3; có 4 em làm được cả 3 câu. Hỏi lớp 10B có bao nhiêu em không làm được câu nâng cao nào?],
  [9],
  loigiai: [
    Số em làm được ít nhất một câu nâng cao là:
    $ N_("hop") = 20 + 18 + 15 - (8 + 7 + 6) + 4 = 53 - 21 + 4 = 36 text(" em"). $
    Số học sinh không làm được câu nào là: $45 - 36 = 9$ học sinh. \
    ✅ *Đáp số:* 9.
  ]
)

#tln(
  dir: "ngang",
  [Cho $S$ là tập hợp các số tự nhiên có ba chữ số. Có bao nhiêu số trong $S$ chia hết cho 4 hoặc chia hết cho 6 nhưng không chia hết cho 12?],
  [225],
  loigiai: [
    📌 *Phương pháp:* Sử dụng hiệu đối xứng và sàng bội số.

    ✍️ *Lời giải chi tiết:* \
    - Tập hợp $S = {100, 101, dots, 999}$ gồm $999 - 100 + 1 = 900$ số.
    - Gọi $A$ là tập các số trong $S$ chia hết cho 4, $B$ là tập các số trong $S$ chia hết cho 6.
    - Giao $A inter B$ chính là tập các số trong $S$ chia hết cho $[4, 6] = 12$.
    - Một số chia hết cho 4 hoặc 6 nhưng không chia hết cho 12 chính là số thuộc:
      $ (A union B) \\ (A inter B) = (A \\ B) union (B \\ A). $
    - Ta tính số lượng phần tử:
      + Số có 3 chữ số chia hết cho 4: $|A| = floor(999/4) - floor(99/4) = 249 - 24 = 225$.
      + Số có 3 chữ số chia hết cho 6: $|B| = floor(999/6) - floor(99/6) = 166 - 16 = 150$.
      + Số có 3 chữ số chia hết cho 12: $|A inter B| = floor(999/12) - floor(99/12) = 83 - 8 = 75$.
    - Khi đó:
      + Số chia hết cho 4 mà không chia hết cho 12: $|A \\ B| = 225 - 75 = 150$.
      + Số chia hết cho 6 mà không chia hết cho 12: $|B \\ A| = 150 - 75 = 75$.
    - Tổng số các số thỏa mãn yêu cầu bài toán là:
      $ 150 + 75 = 225 text(" số"). $

    ✅ *Đáp số:* 225.
  ]
)

#tln(
  dir: "ngang",
  [Một lớp chuyên Toán có 36 học sinh. Mỗi bạn đăng ký học ít nhất một môn thể thao trong ba môn: Bóng rổ ($B$), Bóng đá ($D$), Bơi ($L$). Biết rằng số bạn đăng ký Bóng rổ bằng số bạn đăng ký Bóng đá và bằng 20 bạn. Số bạn đăng ký cả Bóng rổ và Bóng đá là 10 bạn. Số bạn chỉ đăng ký đúng môn Bơi là 6 bạn. Biết rằng trong số các bạn chơi Bóng rổ hoặc Bóng đá, có đúng 10 bạn có tham gia thêm môn Bơi. Hỏi lớp có tất cả bao nhiêu bạn đăng ký môn Bơi?],
  [16],
  loigiai: [
    📌 *Phương pháp:* Sử dụng mô hình phân hoạch miền độc lập.

    ✍️ *Lời giải chi tiết:* \
    - Số bạn đăng ký Bóng rổ hoặc Bóng đá là số phần tử của hợp $B union D$:
      $ n(B union D) = n(B) + n(D) - n(B inter D) = 20 + 20 - 10 = 30 text(" bạn"). $
    - Toàn bộ 36 học sinh của lớp được chia thành hai nhóm rời nhau:
      + Nhóm 1: Các bạn thuộc $B union D$ (gồm 30 bạn).
      + Nhóm 2: Các bạn chỉ đăng ký môn Bơi mà không chơi Bóng rổ hay Bóng đá ($L \\ (B union D)$), có đúng $36 - 30 = 6$ bạn (khớp giả thiết).
    - Tập hợp tất cả các bạn đăng ký môn Bơi ($L$) được hợp từ hai bộ phận rời nhau:
      + Bộ phận 1: Các bạn chỉ đăng ký Bơi ($6$ bạn).
      + Bộ phận 2: Các bạn vừa đăng ký Bơi, vừa tham gia Bóng rổ hoặc Bóng đá ($L inter (B union D)$), theo giả thiết có đúng $10$ bạn.
    - Do đó, tổng số học sinh đăng ký môn Bơi là:
      $ n(L) = 6 + 10 = 16 text(" bạn"). $

    ✅ *Đáp số:* 16.
  ]
)

// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()
= PHẦN IV: BẢNG ĐÁP ÁN & MA TRẬN PHÂN TÍCH

#align(center)[
  #table(
    columns: (2.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm),
    stroke: 0.6pt + luma(180),
    fill: (col, row) => if row == 0 { C-main.lighten(85%) } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
    inset: 8pt,
    align: center + horizon,
    table.header([*Câu*], [*Phần I*], [*Câu*], [*Phần II*], [*Phần III*]),
    [1], [A], [1], [Đ - Đ - S - S], [5],
    [2], [B], [2], [Đ - Đ - Đ - S], [222],
    [3], [A], [3], [Đ - Đ - S - Đ], [3],
    [4], [D], [4], [Đ - Đ - S - Đ], [9],
    [5], [B], [-], [-], [225],
    [6], [B], [-], [-], [16],
    [7], [C], [-], [-], [-],
    [8], [C], [-], [-], [-],
    [9], [B], [-], [-], [-],
    [10], [A], [-], [-], [-],
  )
]

#v(1.5em)
#align(center)[
  #text(fill: C-main, weight: "bold", size: 12pt)[--- HẾT CHUYÊN ĐỀ ---] \
  #v(0.3em)
  #text(fill: luma(100), size: 9pt, style: "italic")[Tài liệu độc quyền lưu hành nội bộ · Hệ thống Giáo dục ConicTypst · GV Nguyễn Văn Sang]
]
