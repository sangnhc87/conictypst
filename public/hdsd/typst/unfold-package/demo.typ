#import "@preview/cetz:0.5.2"
#import "unfold.typ": *
#import "tree.typ": *
#import "venn.typ": *
#import "solid-section.typ": *
#import "conic-tangent.typ": *
#set page(paper: "a4", margin: (x: 1.8cm, y: 2.2cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)

// --- Template định dạng cho tài liệu ---
#let title-block(title, subtitle) = block(
  width: 100%,
  stroke: (bottom: 2pt + rgb("1A5276")),
  inset: (bottom: 1em),
  above: 1em,
  below: 2em,
  [
    #text(fill: rgb("1A5276"), size: 20pt, weight: "bold")[#title] \
    #v(0.4em)
    #text(fill: rgb("555555"), size: 11pt, style: "italic")[#subtitle]
  ]
)

#let heading-section(title) = block(
  width: 100%,
  stroke: (bottom: 1.2pt + rgb("900C3F")),
  inset: (bottom: 0.4em),
  above: 2em,
  below: 1.2em,
  text(fill: rgb("900C3F"), size: 14pt, weight: "bold", title)
)

#let code-label(body) = box(
  fill: rgb("F4F6F7"),
  stroke: 0.5pt + rgb("BDC3C7"),
  inset: (x: 8pt, y: 5pt),
  radius: 3pt,
  text(font: "Courier New", size: 9.5pt, fill: rgb("2C3E50"), body)
)

// --- Nội dung trang demo ---

#title-block(
  "Thư viện vẽ hình Khối Tròn Xoay & Trải Phẳng",
  "Hỗ trợ vẽ hình 3D trực quan, hình trải phẳng (2D Net) và đường đi xoắn ốc (Helix) tối ưu"
)

#heading-section("0. Bảng Tham Số (API Reference)")

#text(style: "italic", size: 10pt)[Các hàm chính: `#cone`, `#frustum`, `#cylinder`, `#prism`, `#cube`, `#pyramid`. Đa số các hàm chia sẻ chung một bộ tham số để bạn dễ dàng ghi nhớ:]
#v(0.5em)

#table(
  columns: (22%, 22%, 56%),
  fill: (col, row) => if row == 0 { rgb("F2F4F4") } else { none },
  stroke: 0.5pt + rgb("BDC3C7"),
  align: (col, row) => if row == 0 { center } else if col == 0 { right } else { left },
  [*Tham số*], [*Dùng cho*], [*Ý nghĩa & Tuỳ chọn*],
  [`r`, `l`, `h`, `a`, `r1`, `r2`], [Tất cả], [Kích thước *toán học thật* của đề bài (bán kính đáy, đường sinh, chiều cao, cạnh đáy). Hệ thống tự tính toán góc trải dựa vào số liệu này.],
  [`vis_r`, `vis_h`, `vis_...`], [Khối tròn xoay], [Kích thước *thẩm mỹ 3D* (bán kính / chiều cao dùng riêng để vẽ hình 3D cho cân đối). Hình phẳng 2D vẫn dùng kích thước toán học thật.],
  [`wrap`], [Tất cả], [*Khối tròn xoay:* Số vòng quấn. \ *Khối đa diện:* Số mặt bên đi qua.],
  [`to`], [Tất cả (trừ cube)], [Vị trí kết thúc của đường đi tính từ đỉnh. (ví dụ: `to: 5` $\to$ đoạn $S B = 5$). Bỏ trống sẽ đi đến hết đáy/đỉnh.],
  [`z_start`, `z_end`], [prism, cube, pyramid], [Vị trí xuất phát/kết thúc trên cạnh. Giá trị $0.0 \to 1.0$ (ví dụ: $0.25$ tương ứng 1/4 cạnh từ trên xuống).],
  [`m_at_bottom`], [`#cube`], [`false` (mặc định) hoặc `true`. Chuyển điểm xuất phát M xuống cạnh đáy. Hình trải phẳng sẽ tự xoay tương ứng.],
  [`path_type`], [`#cube`], [`"auto"` (mặc định) hoặc `"all-faces"`. Dùng `"all-faces"` khi muốn bắt buộc đường đi qua mặt bên (ví dụ quấn ngang hông).],
  [`display`], [Tất cả], [`"3d"` (vẽ 3D), `"2d"` (vẽ trải phẳng), `"both"` (vẽ cả hai ở hai bên).],
  [`scale`, `gap`], [Tất cả], [`scale`: Phóng to/thu nhỏ. `gap`: Khoảng cách giữa 3D và 2D khi dùng `"both"`.]
)

#pagebreak()

#heading-section("1. Khối nón tròn xoay (Cone)")

Dưới đây là so sánh giữa đường đi $1$ vòng và đường đi $3$ vòng quấn quanh mặt bên của hình nón:

#v(1em)
#grid(
  columns: (1fr),
  gutter: 2.5em,
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 1.1: Quấn quanh nón đúng 1 vòng] \
    #text(style: "italic", size: 0.9em)[Toán học: $R=1, l=12$ (Góc trải $30^degree$) \ Thẩm mỹ 3D: $R_("vis")=4.5, h_("vis")=12$] \ 
    #v(0.4em)
    #code-label([#raw("#cone(r: 1, l: 12, vis_r: 4.5, vis_h: 12, display: \"both\")")])
    #v(0.8em)
    #align(center)[#cone(r: 1, l: 12, vis_r: 4.5, vis_h: 12, display: "both", scale: 0.28cm, gap: 2.5cm)]
  ],
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 1.2: Quấn quanh nón nhiều vòng (wrap: 3, to: 5)] \
    #text(style: "italic", size: 0.9em)[Đường đi ngắn nhất từ A đến B (nằm trên SA sao cho SB = 5), góc xoè đúng $90^degree$] \ 
    #v(0.4em)
    #code-label([#raw("#cone(r: 1, l: 12, to: 5, vis_r: 4.5, vis_h: 12, wrap: 3, display: \"both\")")])
    #v(0.8em)
    #align(center)[#cone(r: 1, l: 12, to: 5, vis_r: 4.5, vis_h: 12, wrap: 3, display: "both", scale: 0.28cm, gap: 2.5cm)]
  ]
)

#pagebreak()

#heading-section("2. Khối nón cụt (Frustum / Truncated Cone)")

Khối nón cụt được vẽ kèm theo phần kéo dài đỉnh ảo nét đứt ($S$) để dễ dàng suy luận Talet. Đường sinh xoắn ốc tự động tính toán điểm kết thúc $B$ chính xác theo số vòng quấn:

#v(1em)
#grid(
  columns: (1fr),
  gutter: 2.5em,
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 2.1: Quấn quanh nón cụt 1 vòng] \
    #text(style: "italic", size: 0.9em)[Toán học: $R=2, r=1, l=6$ (Góc trải $60^degree$) \ Thẩm mỹ 3D: $R_("vis")=4.5, r_("vis")=2.25, h_("vis")=6$] \ 
    #v(0.4em)
    #code-label([#raw("#frustum(r1: 2, r2: 1, l: 6, vis_r1: 4.5, vis_r2: 2.25, vis_h: 6, display: \"both\")")])
    #v(0.8em)
    #align(center)[#frustum(r1: 2, r2: 1, l: 6, vis_r1: 4.5, vis_r2: 2.25, vis_h: 6, display: "both", scale: 0.28cm, gap: 2.5cm)]
  ],
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 2.2: Quấn quanh nón cụt 1.5 vòng (wrap: 1.5)] \
    #text(style: "italic", size: 0.9em)[Góc xoè mở rộng thành $90^degree$] \ 
    #v(0.4em)
    #code-label([#raw("#frustum(..., wrap: 5.5, path_style: \"helix\")")])
    #v(0.8em)
    #align(center)[#frustum(r1: 4, r2: 2, l: 6, vis_r1: 4.5, vis_r2: 2.25, vis_h: 6, wrap: 3, path_style: "helix", display: "both", scale: 0.28cm, gap: 2.5cm)]
  ]
)

#pagebreak()

#heading-section("3. Khối trụ đứng (Cylinder)")

Hình trụ đứng với hai đáy tròn xoay và mặt phẳng trải bên hình chữ nhật:

#v(1em)
#grid(
  columns: (1fr),
  gutter: 2.5em,
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 3.1: Quấn quanh trụ 1 vòng] \
    #text(style: "italic", size: 0.9em)[Toán học: $R=1, h=4$ (Tỉ lệ thực 1:4) \ Thẩm mỹ 3D: $R_("vis")=1.5, h_("vis")=4$] \ 
    #v(0.4em)
    #code-label([#raw("#cylinder(r: 1, h: 4, vis_r: 1.5, vis_h: 4, display: \"both\")")])
    #v(0.8em)
    #align(center)[#cylinder(r: 1, h: 4, vis_r: 1.5, vis_h: 4, display: "both", scale: 0.85cm, gap: 2.5cm)]
  ],
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 3.2: Quấn quanh trụ với số vòng lẻ (wrap: 3.5)] \
    #text(style: "italic", size: 0.9em)[Kiến bò 3.5 vòng quanh trụ] \ 
    #v(0.4em)
    #code-label([#raw("#cylinder(r: 0.4, h: 4, vis_r: 1.5, vis_h: 4, wrap: 3.5, display: \"both\")")])
    #v(0.8em)
    #align(center)[#cylinder(r: 0.4, h: 4, vis_r: 1.5, vis_h: 4, wrap: 3.5, display: "both", scale: 0.85cm, gap: 2.5cm)]
  ]
)

#pagebreak()

#heading-section("6. Khối lăng trụ (Prism)")

Hình lăng trụ đứng với đáy là đa giác đều (tam giác, tứ giác, lục giác...) và mặt phẳng trải bên gồm các hình chữ nhật nối tiếp nhau:

#v(1em)
#grid(
  columns: (1fr),
  gutter: 2.5em,
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 6.1: Lăng trụ tam giác đều quấn 2 vòng] \
    #text(style: "italic", size: 0.9em)[Khối lăng trụ đáy tam giác đều, đường đi quấn 2 vòng] \ 
    #v(0.4em)
    #code-label([#raw("#prism(faces: 3, a: 2, h: 4, wrap: 2, display: \"both\")")])
    #v(0.8em)
    #align(center)[#prism(faces: 3, a: 2, h: 4, wrap: 2, display: "both", scale: 0.5cm, gap: 2.5cm)]
  ],
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 6.2: Lăng trụ lục giác đều quấn 1 vòng] \
    #text(style: "italic", size: 0.9em)[Khối lăng trụ đáy lục giác đều (6 cạnh)] \ 
    #v(0.4em)
    #code-label([#raw("#prism(faces: 6, a: 1.5, h: 5, wrap: 1, display: \"both\")")])
    #v(0.8em)
    #align(center)[#prism(faces: 6, a: 1.5, h: 5, wrap: 1, display: "both", scale: 0.5cm, gap: 2.5cm)]
  ]
)

#pagebreak()

#heading-section("7. Khối lập phương (Cube)")

Hình lập phương đứng với đường đi quấn qua $N$ mặt bên:

#v(1em)
#grid(
  columns: (1fr),
  gutter: 2.5em,
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 7.1: Quấn quanh hình lập phương 3 mặt] \
    #text(style: "italic", size: 0.9em)[Khối lập phương, đường đi quấn qua 3 mặt bên] \
    #v(0.4em)
    #code-label([#raw("#cube(a: 2.2, wrap: 3, display: \"both\")")])
    #v(0.8em)
    #align(center)[#cube(a: 2.2, wrap: 3, display: "both", scale: 0.55cm, gap: 2.5cm)]
  ],
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 7.2: Quấn quanh hình lập phương 5 mặt] \
    #text(style: "italic", size: 0.9em)[Khối lập phương, đường đi quấn qua 5 mặt bên (hơn 1 vòng)] \
    #v(0.4em)
    #code-label([#raw("#cube(a: 2.2, wrap: 5, display: \"both\")")])
    #v(0.8em)
    #align(center)[#cube(a: 2.2, wrap: 5, display: "both", scale: 0.55cm, gap: 2.5cm)]
  ]
)

#pagebreak()

#grid(
  columns: (1fr),
  gutter: 2.5em,
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 7.3: Điểm xuất phát nằm trên cạnh, quấn chéo quanh 4 mặt bên] \
    #text(style: "italic", size: 0.9em)[Khối lập phương, đường đi chéo từ điểm $M$ (độ cao $0.2h$) quấn quanh 4 mặt bên tới điểm $N$ (độ cao $0.8h$)] \
    #v(0.4em)
    #code-label([#raw("#cube(a: 2.2, wrap: 4, z_start: 0.2, z_end: 0.8, display: \"both\")")])
    #v(0.8em)
    #align(center)[#cube(a: 2.2, wrap: 4, z_start: 0.2, z_end: 0.8, display: "both", scale: 0.55cm, gap: 2.5cm)]
  ],
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 7.4: Điểm xuất phát nằm trên cạnh, bò chéo qua 3 mặt bên] \
    #text(style: "italic", size: 0.9em)[Khối lập phương, đường đi chéo từ điểm $M$ (độ cao $0.2h$) bò qua 3 mặt bên tới điểm $N$ (độ cao $0.8h$)] \
    #v(0.4em)
    #code-label([#raw("#cube(a: 2.2, wrap: 3, z_start: 0.2, z_end: 0.8, display: \"both\")")])
    #v(0.8em)
    #align(center)[#cube(a: 2.2, wrap: 3, z_start: 0.2, z_end: 0.8, display: "both", scale: 0.55cm, gap: 2.5cm)]
  ]
)

#pagebreak()

#grid(
  columns: (1fr),
  gutter: 2.5em,
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 7.5: Đường đi khép kín qua sáu mặt (Bài toán con kiến Sở Ninh Bình)] \
    #text(style: "italic", size: 0.9em)[Khối lập phương cạnh 9, điểm $M$ chia $O'B'$ tỉ lệ 1/3 ($z_("start") = 0.333$). Kiến bò qua 6 mặt ngắn nhất rồi quay về $M$.] \
    #v(0.4em)
    #code-label([#raw("#cube(a: 2.2, wrap: 6, z_start: 0.333, z_end: 0.333, display: \"both\")")])
    #v(0.8em)
    #align(center)[#cube(a: 2.2, wrap: 6, z_start: 0.333, z_end: 0.333, display: "both", scale: 0.55cm, gap: 2.5cm)]
  ],
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 7.6: Đường đi khép kín qua năm mặt (wrap: 5, path_type: "all-faces")] \
    #text(style: "italic", size: 0.9em)[Khối lập phương, đường đi khép kín qua đúng 5 mặt bên và quay về điểm xuất phát $M$ ($z_("start") = 0.25$).] \
    #v(0.4em)
    #code-label([#raw("#cube(a: 2.2, wrap: 5, path_type: \"all-faces\", z_start: 0.25, z_end: 0.25, display: \"both\")")])
    #v(0.8em)
    #align(center)[#cube(a: 2.2, wrap: 5, path_type: "all-faces", z_start: 0.25, z_end: 0.25, display: "both", scale: 0.55cm, gap: 2.5cm)]
  ],
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 7.7: Điểm M nằm ở cạnh đáy (m_at_bottom: true)] \
    #text(style: "italic", size: 0.9em)[Tương tự bài toán con kiến nhưng điểm $M$ chia cạnh đáy $O B$ theo tỉ lệ 1/3 ($z_("start") = 0.333$).] \
    #v(0.4em)
    #code-label([#raw("#cube(a: 2.2, wrap: 6, z_start: 0.333, z_end: 0.333, m_at_bottom: true, display: \"both\")")])
    #v(0.8em)
    #align(center)[#cube(a: 2.2, wrap: 6, z_start: 0.333, z_end: 0.333, m_at_bottom: true, display: "both", scale: 0.55cm, gap: 2.5cm)]
  ],
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 7.8: Đường đi qua 4 mặt với M ở đáy (wrap: 4)] \
    #text(style: "italic", size: 0.9em)[Khối lập phương, đường đi khép kín qua 4 mặt và điểm $M$ ở đáy ($z_("start") = 0.5$).] \
    #v(0.4em)
    #code-label([#raw("#cube(a: 2.2, wrap: 4, path_type: \"all-faces\", z_start: 0.5, z_end: 0.5, m_at_bottom: true, display: \"both\")")])
    #v(0.8em)
    #align(center)[#cube(a: 2.2, wrap: 4, path_type: "all-faces", z_start: 0.5, z_end: 0.5, m_at_bottom: true, display: "both", scale: 0.55cm, gap: 2.5cm)]
  ]
)

#pagebreak()

#heading-section("8. Khối chóp đều (Pyramid)")

Hình chóp đều với đường đi chéo quấn quanh các mặt bên:

#v(1em)
#grid(
  columns: (1fr),
  gutter: 2.5em,
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 8.1: Bò chéo qua 2 mặt bên chóp tam giác đều] \
    #text(style: "italic", size: 0.9em)[Khối chóp tam giác đều, đường đi chéo từ $M$ (cách $S$ một đoạn $2.0$) qua 2 mặt bên tới $N$ (cách $S$ một đoạn $2.5$)] \
    #v(0.4em)
    #code-label([#raw("#pyramid(n: 3, a: 1.8, e: 3, wrap: 2/3, sm: 2.0, sm2: 2.5, display: \"both\")")])
    #v(0.8em)
    #align(center)[#pyramid(n: 3, a: 1.8, e: 3, wrap: 2/3, sm: 2.0, sm2: 2.5, display: "both", scale: 0.7cm, gap: 2.5cm)]
  ],
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 8.2: Bò chéo qua 3 mặt bên chóp tứ giác đều] \
    #text(style: "italic", size: 0.9em)[Khối chóp tứ giác đều, đường đi chéo từ $M$ (cách $S$ một đoạn $2.0$) qua 3 mặt bên tới $N$ (cách $S$ một đoạn $2.6$)] \
    #v(0.4em)
    #code-label([#raw("#pyramid(n: 4, a: 1.8, e: 3, wrap: 3/4, sm: 2.0, sm2: 2.6, display: \"both\")")])
    #v(0.8em)
    #align(center)[#pyramid(n: 4, a: 1.8, e: 3, wrap: 3/4, sm: 2.0, sm2: 2.6, display: "both", scale: 0.7cm, gap: 2.5cm)]
  ]
)

#pagebreak()

#heading-section("9. Sơ đồ cây xác suất (Probability Tree)")

#v(0.5em)
Tự động vẽ sơ đồ cây thông qua mảng dữ liệu phân cấp, tự tính toán toạ độ và vẽ mũi tên/nhãn xác suất.

#v(1em)
#text(weight: "bold", fill: rgb("117A65"))[Trường hợp 9.1: Bài toán khách hàng (Sơ đồ cây 1-3-6)] \
#text(style: "italic", size: 0.9em)[Dữ liệu chia làm 3 nhánh lớn, mỗi nhánh chia 2 nhánh con.] \
#v(0.4em)
#code-label([#raw("
#let data = (
  [Khách hàng],
  (
    [Sẽ mua \ ($A$)], \"0,44\",
    ([Mua ($M$)], \"0,80\"),
    ([Không ($overline(M)$)], \"0,20\")
  ),
  (
    [Cân nhắc \ ($B$)], \"0,30\",
    ([Mua ($M$)], $x$),
    ([Không ($overline(M)$)], $1-x$)
  ),
  (
    [Không mua \ ($C$)], \"0,26\",
    ([Mua ($M$)], \"0,30\"),
    ([Không ($overline(M)$)], \"0,70\")
  )
)
#prob-tree(data)
")])

#v(1em)
#align(center)[
  #let data1 = (
    [Khách hàng \ ($200$ người)],
    (
      [Sẽ mua \ ($A$)], "0,44",
      ([Mua ($M$)], "0,80"),
      ([Không ($overline(M)$)], "0,20")
    ),
    (
      [Cân nhắc \ ($B$)], "0,30", (fill: rgb("fff3e0"), stroke: rgb("ef6c00")),
      ([Mua ($M$)], $x$, (stroke: red)),
      ([Không ($overline(M)$)], $1-x$)
    ),
    (
      [Không mua \ ($C$)], "0,26",
      ([Mua ($M$)], "0,30"),
      ([Không ($overline(M)$)], "0,70")
    )
  )
  #prob-tree(data1, theme: "blue", scale: 1.2cm, level-step: 3.5, node-step: 1.2)
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[Trường hợp 9.2: Sơ đồ bốc bi (Theme Red)] \
#text(style: "italic", size: 0.9em)[Hỗ trợ các theme màu sắc: `default`, `blue`, `red`, `green`, `orange`.] \
#v(0.4em)
#code-label([#raw("
#prob-tree(data2, theme: \"red\")
")])

#v(1em)
#align(center)[
  #let data2 = (
    [Hộp I],
    (
      [Lấy 2 Đỏ], $C_4^2 / C_7^2$,
      ([Đỏ, Đỏ], $1/2$),
      ([Đỏ, Xanh], $1/2$)
    ),
    (
      [Lấy 2 Xanh], $C_2^2 / C_7^2$,
      ([Đỏ, Đỏ], $1/2$),
      ([Đỏ, Xanh], $1/2$)
    )
  )
  #prob-tree(data2, theme: "red", scale: 1.2cm, level-step: 3.5, node-step: 1.2)
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[Trường hợp 9.3: Sơ đồ từ trên xuống (Vertical Tree)] \
#text(style: "italic", size: 0.9em)[Thay đổi hướng vẽ bằng tham số `dir: "down"`. Rất thích hợp cho phân lô, phân loại.] \
#v(0.4em)
#code-label([#raw("
#prob-tree(data2, dir: \"down\", theme: \"green\")
")])

#v(1em)
#align(center)[
  #let data3 = (
    [Hộp I],
    (
      [Lấy 2 Đỏ], $C_4^2 / C_7^2$,
      ([Đỏ, Đỏ], $1/2$),
      ([Đỏ, Xanh], $1/2$)
    ),
    (
      [Lấy 2 Xanh], $C_2^2 / C_7^2$,
      ([Đỏ, Đỏ], $1/2$),
      ([Đỏ, Xanh], $1/2$)
    )
  )
  #prob-tree(data3, dir: "down", theme: "green", scale: 1.2cm, level-step: 2.5, node-step: 1.8)
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[Trường hợp 9.4: Truy nguồn gốc (Bayes) với Node tròn] \
#text(style: "italic", size: 0.9em)[Hỗ trợ `shape: "circle"` cho node lá (hoặc bất kỳ node nào) để vẽ hình tròn chuẩn xác thay vì hình chữ nhật. Kết hợp `dir: "down"` rất phù hợp bài Bayes.] \
#v(0.4em)
#code-label([#raw("
#let data-bayes = (
  [1 bi từ Hộp III],
  ([Gốc Hộp I], \"3/5\",
    (text(fill: red)[*Đỏ*], \"6/10\", (shape: \"circle\", radius: 0.45, fill: rgb(\"FFEBEE\"), stroke: 1.5pt + red)),
    (text(fill: blue)[*Xanh*], \"4/10\", (shape: \"circle\", radius: 0.45, fill: rgb(\"E3F2FD\"), stroke: 1.5pt + blue))
  ),
  ([Gốc Hộp II], \"2/5\",
    (text(fill: red)[*Đỏ*], \"3/8\", (shape: \"circle\", radius: 0.45, fill: rgb(\"FFEBEE\"), stroke: 1.5pt + red)),
    (text(fill: blue)[*Xanh*], \"5/8\", (shape: \"circle\", radius: 0.45, fill: rgb(\"E3F2FD\"), stroke: 1.5pt + blue))
  )
)
#prob-tree(data-bayes, dir: \"down\", theme: \"orange\", level-step: 2.5, node-step: 2.0)
")])

#v(1em)
#align(center)[
  #let data-bayes = (
    [1 bi từ Hộp III],
    ([Gốc Hộp I], "3/5",
      (text(fill: red)[*Đỏ*], "6/10", (shape: "circle", radius: 0.45, fill: rgb("FFEBEE"), stroke: 1.5pt + red)),
      (text(fill: blue)[*Xanh*], "4/10", (shape: "circle", radius: 0.45, fill: rgb("E3F2FD"), stroke: 1.5pt + blue))
    ),
    ([Gốc Hộp II], "2/5",
      (text(fill: red)[*Đỏ*], "3/8", (shape: "circle", radius: 0.45, fill: rgb("FFEBEE"), stroke: 1.5pt + red)),
      (text(fill: blue)[*Xanh*], "5/8", (shape: "circle", radius: 0.45, fill: rgb("E3F2FD"), stroke: 1.5pt + blue))
    )
  )
  #prob-tree(data-bayes, dir: "down", theme: "orange", scale: 1.2cm, level-step: 2.5, node-step: 2.0)
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[Trường hợp 9.5: Cây đa tầng phức tạp (Dạng 2-4-8)] \
#text(style: "italic", size: 0.9em)[Hàm `#prob-tree` sử dụng đệ quy tự động tính toán toạ độ, nên hỗ trợ số tầng và số nhánh không giới hạn mà không bao giờ bị đè chéo nhánh lên nhau.] \
#v(0.4em)

#align(center)[
  #let data-248 = (
    [Khởi đầu],
    ([A], "",
      ([A1], "",
        ([A1.1], ""), ([A1.2], "")
      ),
      ([A2], "",
        ([A2.1], ""), ([A2.2], "")
      )
    ),
    ([B], "",
      ([B1], "",
        ([B1.1], ""), ([B1.2], "")
      ),
      ([B2], "",
        ([B2.1], ""), ([B2.2], "")
      )
    )
  )
  #prob-tree(data-248, dir: "right", theme: "default", scale: 1.0cm, level-step: 3.5, node-step: 1.2)
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[Trường hợp 9.6: Gieo xúc xắc kết hợp Bốc bi (Tính xác suất toàn phần)] \
#text(style: "italic", size: 0.9em)[Áp dụng hoàn hảo cho các bài toán thi THPT Quốc gia phức tạp, phân nhánh nhiều giai đoạn.] \
#v(0.4em)

#align(center)[
  #let data-xucxac = (
    [Gieo xúc xắc],
    ([Hộp I], "1/6",
      ([Cùng màu ($E$)], "10/36", ([ $1/6 times 5/18 = 25/540$ ], "")),
      ([Khác màu ($F$)], "26/36")
    ),
    ([Hộp II], "1/3",
      ([Cùng màu ($E$)], "16/45", ([ $1/3 times 16/45 = 64/540$ ], "")),
      ([Khác màu ($F$)], "29/45")
    ),
    ([Hộp III], "1/2", (stroke: 1.5pt + rgb("d81b60")),
      ([Cùng màu ($E$)], "14/45", (stroke: 1.5pt + rgb("d81b60")), ([ $1/2 times 14/45 = 84/540$ ], "", (stroke: none, fill: none))),
      ([Khác màu ($F$)], "31/45")
    )
  )
  #prob-tree(data-xucxac, dir: "right", theme: "blue", scale: 1.2cm, level-step: 3.5, node-step: 1.2)
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[Trường hợp 9.7: Gấp khúc vuông góc (Orthogonal) & Theme Minimal] \
#text(style: "italic", size: 0.9em)[Thay vì đường thẳng, bạn có thể dùng `path-type: "orthogonal"` để vẽ các đường nhánh vuông góc. Kết hợp với `theme: "minimal"` để tạo ra sơ đồ siêu tối giản (không có khung viền).] \
#v(0.4em)

#align(center)[
  #let data-248 = (
    [Khởi đầu],
    ([A], "",
      ([A1], "",
        ([A1.1], ""), ([A1.2], "")
      ),
      ([A2], "",
        ([A2.1], ""), ([A2.2], "")
      )
    ),
    ([B], "",
      ([B1], "",
        ([B1.1], ""), ([B1.2], "")
      ),
      ([B2], "",
        ([B2.1], ""), ([B2.2], "")
      )
    )
  )
  #prob-tree(data-248, dir: "right", theme: "minimal", path-type: "orthogonal", scale: 1.0cm, level-step: 3.5, node-step: 1.2)
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[Trường hợp 9.8: Nhãn xác suất nghiêng theo đường thẳng (Angled Labels)] \
#text(style: "italic", size: 0.9em)[Thêm tham số `angled-labels: true` để các nhãn chữ chạy dọc theo độ dốc của nhánh cây, rất "thông minh" và chuyên nghiệp.] \
#v(0.4em)

#align(center)[
  #let data-angled = (
    [Gốc],
    ([Nhánh A], "0.6",
      ([Lá A1], "0.3"),
      ([Lá A2], "0.7")
    ),
    ([Nhánh B], "0.4",
      ([Lá B1], "0.2"),
      ([Lá B2], "0.8")
    )
  )
  #prob-tree(data-angled, dir: "right", theme: "default", angled-labels: true, scale: 1.2cm, level-step: 3.5, node-step: 1.2)
]

#pagebreak()

#grid(
  columns: (1fr),
  gutter: 2.5em,
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 8.3: Bò chéo qua 4 mặt bên chóp tứ giác đều và quay lại vị trí ban đầu] \
    #text(style: "italic", size: 0.9em)[Khối chóp tứ giác đều, đường đi chéo từ $M$ (cách $S$ một đoạn $2.4$) quấn quanh 4 mặt bên và quay về $M$ ($M'$ trên hình khai triển)] \
    #v(0.4em)
    #code-label([#raw("#pyramid(n: 4, a: 1.8, e: 3, wrap: 1, sm: 2.4, sm2: 2.4, display: \"both\")")])
    #v(0.8em)
    #align(center)[#pyramid(n: 4, a: 1.8, e: 3, wrap: 1, sm: 2.4, sm2: 2.4, display: "both", scale: 0.7cm, gap: 2.5cm)]
  ],
  [
    #text(weight: "bold", fill: rgb("117A65"))[Trường hợp 8.4: Bò chéo qua 5 mặt bên chóp ngũ giác đều và quay lại vị trí ban đầu] \
    #text(style: "italic", size: 0.9em)[Khối chóp ngũ giác đều, đường đi chéo từ $M$ (cách $S$ một đoạn $2.5$) quấn quanh 5 mặt bên và quay về $M$ ($M'$ trên hình khai triển)] \
    #v(0.4em)
    #code-label([#raw("#pyramid(n: 5, a: 1.5, e: 3, wrap: 1, sm: 2.5, sm2: 2.5, display: \"both\")")])
    #v(0.8em)
    #align(center)[#pyramid(n: 5, a: 1.5, e: 3, wrap: 1, sm: 2.5, sm2: 2.5, display: "both", scale: 0.7cm, gap: 2.5cm)]
  ]
)
#pagebreak()

= PHẦN 3: SƠ ĐỒ VENN (TẬP HỢP, XÁC SUẤT)
#v(1em)

#text(style: "italic")[Macro `#venn-diagram` hỗ trợ vẽ nhanh sơ đồ Venn 2, 3 và 4 tập hợp chuẩn mực toán học, tự động đánh dấu các vùng giao nhau và hỗ trợ điền số liệu (value) trực tiếp vào đúng toạ độ giao nhau mà không cần căn chỉnh thủ công.]

#v(1em)
#text(weight: "bold", fill: rgb("117A65"))[1. Sơ đồ Venn 2 tập hợp] \
#v(0.4em)

#align(center)[
  #venn-diagram(n: 2, labels: ("A", "B"), values: ("A": 15, "B": 20, "AB": 5), theme: "blue", size-scale: 1.2)
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[2. Sơ đồ Venn 3 tập hợp] \
#v(0.4em)

#align(center)[
  #venn-diagram(n: 3, labels: ("Toán", "Lý", "Hoá"), values: ("A": 10, "B": 8, "C": 12, "AB": 3, "BC": 4, "AC": 2, "ABC": 1), theme: "red", size-scale: 1.2)
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[3. Sơ đồ Venn 4 tập hợp (Chuẩn 4 Elip)] \
#text(style: "italic", size: 0.9em)[Venn 4 bắt buộc phải dùng 4 hình elip cắt nhau để tạo ra đúng 16 phân vùng (15 vùng bên trong). Các phân vùng được đánh dấu tự động.] \
#v(0.4em)

#align(center)[
  #venn-diagram(n: 4, labels: ("A", "B", "C", "D"), values: ("A": 1, "B": 2, "C": 3, "D": 4, "AB": 5, "CD": 6, "ABCD": "All"), theme: "green", size-scale: 1.2)
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[4. Sơ đồ Venn Tối Giản (Theme Minimal)] \
#v(0.4em)

#align(center)[
  #venn-diagram(n: 3, labels: ("A", "B", "C"), values: ("ABC": "A ∩ B ∩ C"), theme: "minimal", size-scale: 1.5)
]
#pagebreak()

= PHẦN 4: THIẾT DIỆN TÍCH PHÂN 3D (AUTO SOLID CROSS-SECTION)
#v(1em)

#text(style: "italic")[Macro `#draw-solid-section` tự động vẽ các khối vật thể 3D trong bài toán tích phân thể tích. Hỗ trợ tự động nội suy đỉnh (tròn, nửa tròn, tam giác, vuông, ngũ giác, lục giác), tự động chia nét đứt/nét liền và vẽ đường bao chân thực. Nay đã hỗ trợ thêm `anchor: "bottom"` (đặt đáy lên mặt phẳng) và `rotation` (xoay thiết diện).]

#v(1em)
#text(weight: "bold", fill: rgb("117A65"))[1. Khối tròn xoay (Thiết diện Hình Tròn)] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "circle", 
    axis: "y", 
    f: y => 2/3 * y * (3 - y), 
    domain: (0, 3), 
    slices: (0.5, 1.5, 2.5), 
    theme: "blue", 
    size-scale: 1.5
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[2. Thiết diện Nửa Hình Tròn (Trục ngang Ox)] \
#text(style: "italic", size: 0.9em)[Vật thể nằm ngang (trục x) có đáy giới hạn bởi trục hoành. Thiết diện là nửa hình tròn dựng đứng trên đáy.] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "semi-circle", 
    axis: "x", 
    f: x => 4 - 0.5 * x, 
    anchor: "bottom", // Nửa đường tròn nằm hẳn trên trục
    domain: (0, 6), 
    slices: (1, 3, 5), 
    theme: "blue", 
    size-scale: 0.6
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[3. Thiết diện Hình Vuông (Lục bình, Tháp vuông - Xoay tâm)] \
#text(style: "italic", size: 0.9em)[Thiết diện hình vuông xoay quanh trục Oxyz (đối xứng qua tâm).] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "square", 
    axis: "y", 
    f: y => calc.sqrt(y + 1) * (4 - y) / 2, 
    value-type: "side", 
    domain: (0, 4), 
    slices: (1, 2, 3), 
    theme: "orange", 
    size-scale: 1.2
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[4. Thiết diện Hình Vuông có ĐÁY NẰM TRÊN MẶT PHẲNG] \
#text(style: "italic", size: 0.9em)[Dùng `anchor: "bottom"` để tự động tịnh tiến hình vuông sao cho cạnh đáy chạm đúng vào trục/mặt phẳng.] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "square", 
    axis: "x", 
    f: x => calc.pow(2, x), 
    value-type: "side", 
    anchor: "bottom", // Cạnh đáy nằm trên mặt phẳng (chạm trục x)
    domain: (0, 2), 
    slices: (0.5, 1, 1.5), 
    theme: "orange", 
    size-scale: 1.2
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[5. Thiết diện Tam Giác Đều (Đứng)] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "triangle", 
    axis: "y", 
    f: y => 2 * calc.sqrt(y) * (3 - y) / 1.5, 
    value-type: "side", 
    domain: (0, 3), 
    slices: (0.5, 1.5, 2.5), 
    theme: "green", 
    size-scale: 1.5
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[6. Thiết diện Tam Giác Đều (Xoay đỉnh ngang)] \
#text(style: "italic", size: 0.9em)[Sử dụng `rotation: 90deg` để xoay đỉnh tam giác chĩa sang phải.] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "triangle", 
    axis: "y", 
    f: y => 2 * calc.sqrt(y) * (3 - y) / 1.5, 
    value-type: "side", 
    rotation: 90deg, // Xoay 90 độ
    domain: (0, 3), 
    slices: (0.5, 1.5, 2.5), 
    theme: "green", 
    size-scale: 1.5
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[7. Thiết diện Ngũ Giác Đều (Tháp đa diện)] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "pentagon", 
    axis: "y", 
    f: y => calc.sqrt(y * (6 - y)), 
    value-type: "radius", 
    domain: (0, 6), 
    slices: (1, 3, 5), 
    theme: "gray", 
    size-scale: 1.2
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[8. Thiết diện Lục Giác Đều (Tháp đa diện)] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "hexagon", 
    axis: "y", 
    f: y => calc.sqrt(y * (6 - y)), 
    value-type: "radius", 
    domain: (0, 6), 
    slices: (1, 3, 5), 
    theme: "gray", 
    size-scale: 1.0
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[9. Khối Tròn Xoay Rỗng (Thể tích giữa 2 đường cong)] \
#text(style: "italic", size: 0.9em)[Tạo khối vành khăn bằng cách sử dụng thêm tham số `f2` (đường cong bên trong).] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "circle", 
    axis: "x", 
    f: x => calc.sqrt(x) + 1, // Đường cong ngoài
    f2: x => 0.5 * x,         // Đường cong trong (f2)
    domain: (0, 4), 
    slices: (1, 2, 3), 
    theme: "blue", 
    size-scale: 1.2
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[10. Tháp Đa Diện Rỗng (Khối chóp cụt rỗng)] \
#text(style: "italic", size: 0.9em)[Tạo khối đa diện lục giác bị khoét rỗng bên trong bởi một đường cong khác.] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "hexagon", 
    axis: "y", 
    f: y => 3 - 0.2 * y,      // Đường ngoài
    f2: y => 1.5 - 0.1 * y,   // Đường khoét rỗng bên trong
    value-type: "radius", 
    domain: (0, 5), 
    slices: (1, 3), 
    theme: "green", 
    size-scale: 1.1,
    caps: true
  )
]


#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[11. Khối Đồng Hồ Cát Rỗng (Trục Oy)] \
#text(style: "italic", size: 0.9em)[Vật thể tạo bởi hình vành khăn (washer) xoay quanh trục thẳng đứng, với bán kính biến thiên uốn lượn.] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "circle", 
    axis: "y", 
    f: y => 2 + calc.sin(y * 50deg),   // Đường cong ngoài (hình sin)
    f2: y => 1 + 0.5 * calc.sin(y * 50deg), // Đường rỗng bên trong
    domain: (0, 7.2), 
    slices: (1.5, 3.6, 5.7), 
    theme: "orange", 
    size-scale: 0.9,
    caps: true
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[12. Tháp Vuông Rỗng Ruột (Hollow Square Pyramid)] \
#text(style: "italic", size: 0.9em)[Thiết diện là hình vuông bị khoét rỗng bằng một hình vuông nhỏ hơn bên trong, tâm trục đứng.] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "square", 
    axis: "y", 
    f: y => 4 - 0.3 * y,      // Hình vuông ngoài nhỏ dần
    f2: y => 2 - 0.1 * y,     // Hình vuông trong cũng nhỏ dần
    value-type: "side", 
    domain: (0, 6), 
    slices: (2, 4), 
    theme: "green", 
    size-scale: 1.1,
    caps: true
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[13. Chiếc Bát Pha Lê (Crystal Bowl)] \
#text(style: "italic", size: 0.9em)[Khối vành khăn hình parabol xoay quanh trục Oy, tạo thành một chiếc bát rỗng với thành bát mỏng dần.] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "circle", 
    axis: "y", 
    f: y => 3 * calc.sqrt(y) + 0.5,    // Mặt ngoài của bát
    f2: y => 2.8 * calc.sqrt(y),       // Mặt trong của bát
    domain: (0, 4), 
    slices: (1, 2, 3), 
    theme: "blue", 
    size-scale: 1.0,
    caps: true
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[14. Lọ Hoa Nghệ Thuật (Art Vase)] \
#text(style: "italic", size: 0.9em)[Sự kết hợp giữa hàm lượng giác và hàm bậc hai để chế tác ra một chiếc bình hoa có đường cong vô cùng sắc sảo.] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "circle", 
    axis: "y", 
    f: y => 2.5 - 1.5 * calc.cos(y * 45deg) + 0.1 * y * y,   // Viền ngoài bình hoa
    f2: y => 2.2 - 1.4 * calc.cos(y * 45deg) + 0.08 * y * y, // Viền trong bình hoa
    domain: (0, 6), 
    slices: (1, 3, 5), 
    theme: "orange", 
    size-scale: 0.9,
    caps: true
  )
]

#pagebreak()
= PHẦN 5: BỘ SƯU TẬP KHỐI HÌNH NGHỆ THUẬT (ARTISTIC SOLIDS)
#text(style: "italic", size: 0.9em)[Áp dụng sức mạnh của các hàm có điều kiện (`if-else`), căn bậc hai và lượng giác để thiết kế các vật thể phức tạp mang tính nghệ thuật cao.] \
#v(1em)

#text(weight: "bold", fill: rgb("117A65"))[15. Viên Kim Cương Lục Giác (Hexagonal Diamond Drop)] \
#text(style: "italic", size: 0.9em)[Vật thể nhọn ở 2 đầu nhờ hàm bậc nhất đối xứng, mô phỏng một viên pha lê lục giác tinh xảo.] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "hexagon", 
    axis: "y", 
    f: y => if y < 3 { 1.5 * y } else { 4.5 - 1.5 * (y - 3) },
    domain: (0, 6), 
    slices: (1.5, 3, 4.5), 
    theme: "green", 
    size-scale: 1.0,
    caps: false // Kim cương có đầu nhọn nên không vẽ mặt đáy
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[16. Khối Giọt Nước (Water Drop Solid)] \
#text(style: "italic", size: 0.9em)[Thiết diện lục giác biến thiên theo hàm lượng giác kết hợp hàm mũ (`sin(y) * e^{-0.2y}`) tạo thành hình giọt nước uốn lượn.] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "hexagon", 
    axis: "y", 
    f: y => 2.5 * calc.sin(y * 45deg) * calc.exp(-0.2 * y),
    domain: (0, 4), 
    slices: (1, 2, 3), 
    theme: "orange", 
    size-scale: 1.2,
    caps: false // Đáy và đỉnh tụ về 0 nên không cần nắp
  )
]
#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[17. Khối Quả Trám (Olive Solid)] \
#text(style: "italic", size: 0.9em)[Tạo hình từ một chu kỳ của hàm `sin`, tạo nên một khối tròn xoay mượt mà, hoàn hảo không tì vết.] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "circle",
    axis: "y",
    f: y => 3 * calc.sin(y * 60deg),
    domain: (0, 3),
    slices: (0.75, 1.5, 2.25),
    theme: "blue",
    size-scale: 1.2,
    caps: false
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[18. Khối Loa Kèn (C1-Smooth Trumpet)] \
#text(style: "italic", size: 0.9em)[Khối tròn xoay tạo bởi hàm ghép (Piece-wise): Một Parabol bề lõm hướng lên nối với một Parabol bề lõm hướng xuống. Tại điểm nối ($y=2$), hai đường có cùng giá trị và cùng tiếp tuyến, tạo ra bề mặt siêu mượt (C1 Continuous).] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "circle", 
    axis: "y", 
    f: y => if y <= 2 {
      0.5 * y * y
    } else {
      2 + 2 * (y - 2) - 8/9 * (y - 2) * (y - 2)
    },
    domain: (0, 5), 
    slices: (1.5, 3), 
    theme: "green", 
    size-scale: 1.2,
    caps: false
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[19. Khối Quả Lê Nghệ Thuật (C1-Smooth Pear)] \
#text(style: "italic", size: 0.9em)[Hàm ghép Lượng giác: Ghép hàm `sin` và hàm `cos`. Tại điểm nối ($y=2$), cả hai hàm đều đạt cực đại (đạo hàm bằng 0), giúp chúng khớp nối với nhau thành một đường cong hoàn hảo không tì vết.] \
#v(0.4em)

#align(center)[
  #draw-solid-section(
    type: "circle", 
    axis: "y", 
    f: y => if y <= 2 {
      1.5 + 1.5 * calc.sin(90deg * (y - 1))
    } else {
      1.5 + 1.5 * calc.cos(45deg * (y - 2))
    },
    domain: (0, 6), 
    slices: (2, 4), 
    theme: "orange", 
    size-scale: 1.0,
    caps: false
  )
]

#pagebreak()
= PHẦN 6: BÀI TOÁN TIẾP XÚC CONIC & ĐƯỜNG TRÒN
#text(style: "italic", size: 0.9em)[Giải quyết các bài toán "vật thể rơi vào khe", "viên bi kẹt trong cốc" hay "khoét lỗ tròn tiếp xúc". Tự động tính toán toạ độ và bán kính để tiếp xúc (chạm thành, chạm đỉnh) hoàn hảo.] \
#v(1em)

#text(weight: "bold", fill: rgb("117A65"))[20. Viên bi rơi vào cốc Parabol] \
#text(style: "italic", size: 0.9em)[Viên bi (đường tròn) rơi vào cốc Parabol $y = x^2$. Viên nhỏ ($R=1/2$) chạm đáy, viên lớn ($R=1$) kẹt ở thành cốc.] \
#v(0.4em)

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    cetz.canvas({
      import cetz.draw: *
      draw-tangent-parabola(
        a: 1,
        domain: (-1.8, 1.8),
        axes-range: ((-2, 2), (-0.5, 3.5)),
        mode: "3d",
        circles: (
          (R: 0.5, y: "auto", stroke: rgb("F44336"), fill: rgb("FFCDD2"), name: text(size: 8pt, fill: rgb("F44336"))[$R=1/2$]),
        )
      )
    }),
    cetz.canvas({
      import cetz.draw: *
      draw-tangent-parabola(
        a: 1,
        domain: (-1.8, 1.8),
        axes-range: ((-2, 2), (-0.5, 3.5)),
        mode: "3d",
        circles: (
          (R: 1, y: "auto", stroke: rgb("4CAF50"), fill: rgb("C8E6C9"), name: text(size: 8pt, fill: rgb("4CAF50"))[$R=1$]),
        )
      )
    })
  )
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[21. Quả bóng kẹt trong bồn Elip] \
#text(style: "italic", size: 0.9em)[Bồn Elip $x^2/4 + y^2/16 = 1$. Quả bóng bán kính $R=2$ rơi vào bồn và tự động tìm vị trí kẹt. Đổ bóng gradient 3D.] \
#v(0.4em)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    draw-tangent-ellipse(
      a: 2, b: 4,
      axes-range: ((-3, 3), (-5, 1)),
      mode: "3d",
      circles: (
        (R: 2, y: "auto", stroke: rgb("FF9800"), fill: rgb("FFE0B2"), name: text(fill: rgb("FF9800"))[$O$]),
      )
    )
  })
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[22. Viên bi kẹt giữa ngàm Hypebol] \
#text(style: "italic", size: 0.9em)[Khe Hypebol (đồng hồ cát) $x^2/9 - y^2/16 = 1$. Đặt viên bi $R=3$ vào khe ở $y=1$.] \
#v(0.4em)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    draw-tangent-hyperbola(
      a: 3, b: 4,
      domain: (-3, 3),
      axes-range: ((-6, 6), (-4, 4)),
      mode: "3d",
      circles: (
        (R: 3, x: 0, y: 1, stroke: rgb("9C27B0"), fill: rgb("E1BEE7"), name: text(fill: rgb("9C27B0"))[$I$]),
      )
    )
  })
]

#pagebreak()
= PHẦN 7: TỰ ĐỘNG TÌM VÀ VẼ MIỀN NGHIỆM QUY HOẠCH TUYẾN TÍNH
#text(style: "italic", size: 0.9em)[Nhập mảng hệ số các bất phương trình $a x + b y <= c$, hệ thống sẽ tự động giao cắt các nửa mặt phẳng, tính toạ độ các đỉnh và nối lại thành đa giác lồi chuẩn xác.] \
#v(1em)

#text(weight: "bold", fill: rgb("117A65"))[23. Đa giác lồi bị chặn (Dạng 1 & 2)] \
#v(0.4em)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    
    // Hệ: 
    // x + 2y <= 10
    // 2x + y <= 8
    // x >= 0, y >= 0
    let ineqs1 = (
      (a: 1, b: 2, c: 10, stroke: (paint: rgb("E91E63"), dash: "dashed")),
      (a: 2, b: 1, c: 8, stroke: (paint: rgb("388E3C"), dash: "dashed")),
      (a: -1, b: 0, c: 0),
      (a: 0, b: -1, c: 0)
    )
    
    draw-lp-region(ineqs1, p-fill: rgb("E3F2FD"), format-vertex: "auto")
  })
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[24. Miền không bị chặn (Dạng 3)] \
#v(0.4em)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    
    // Hệ:
    // 2x + y >= 10
    // x + y >= 7
    // x >= 0, y >= 0
    let ineqs2 = (
      (a: 2, b: 1, op: ">=", c: 10),
      (a: 1, b: 1, op: ">=", c: 7),
      (a: -1, b: 0, c: 0),
      (a: 0, b: -1, c: 0)
    )
    
    draw-lp-region(ineqs2, p-fill: rgb("E8F5E9"), format-vertex: "auto")
  })
]

#pagebreak()
= PHẦN 8: ỨNG DỤNG TÍCH PHÂN - DIỆN TÍCH HÌNH PHẲNG
#text(style: "italic", size: 0.9em)[Tự động tìm giao điểm giữa hai hàm số $f(x)$ và $g(x)$, tô màu miền diện tích khép kín tạo bởi hai đồ thị.] \
#v(1em)

#text(weight: "bold", fill: rgb("117A65"))[25. Diện tích giới hạn bởi Parabol và Đường thẳng] \
#v(0.4em)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    
    // f(x) = x^2 - 2, g(x) = x
    let f(x) = calc.pow(x, 2) - 2
    let g(x) = x
    
    draw-integral-region(f, g, domain: (-2.5, 3))
    
    // Label
    content((2.5, 5), text(rgb("1565C0"))[$y = x^2 - 2$])
    content((2.5, 2), text(rgb("E91E63"))[$y = x$])
  })
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[26. Diện tích tạo bởi hai hàm Sin/Cos] \
#v(0.4em)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    
    // f(x) = sin(x), g(x) = cos(x)
    let f(x) = calc.sin(x * 1rad)
    let g(x) = calc.cos(x * 1rad)
    
    // Auto fill region between -2 and 2
    draw-integral-region(f, g, domain: (-2, 2), p-fill: rgb("FFF9C4"))
    
    content((1.5, 1.2), text(rgb("1565C0"))[$y = sin(x)$])
    content((1.5, -0.5), text(rgb("E91E63"))[$y = cos(x)$])
  })
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[27. Diện tích hình phẳng (Đa thức bậc 3 và đường thẳng)] \
#v(0.4em)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    
    // f(x) = x^3 - 3x, g(x) = x
    let f(x) = calc.pow(x, 3) - 3 * x
    let g(x) = x
    
    // Thể hiện tham số tick-step tùy chỉnh và fill xen kẽ 2 màu
    draw-integral-region(
      f, g, 
      domain: (-2.5, 2.5), 
      p-fill: (rgb("E1BEE7"), rgb("C8E6C9")), // Mảng 2 màu xen kẽ
      x-tick-step: 1,
      y-tick-step: 2,
      f-label: text(rgb("1565C0"))[$y = x^3 - 3x$],
      g-label: text(rgb("E91E63"))[$y = x$]
    )
  })
]

#v(2em)
#text(weight: "bold", fill: rgb("117A65"))[28. Diện tích với trục hoành (Tự động g = 0)] \
#v(0.4em)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    
    // Chỉ cần truyền f(x), tự động g(x) = 0
    let f(x) = calc.pow(x, 2) - 4
    
    draw-integral-region(
      f,
      domain: (-3, 3), 
      p-fill: rgb("FFCC80"),
      f-label: text(rgb("1565C0"))[$y = x^2 - 4$]
    )
  })
]
