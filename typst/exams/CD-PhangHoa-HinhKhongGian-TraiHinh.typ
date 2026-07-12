#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG & ĐỊNH DẠNG CHUNG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("117A65"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ═══════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ
// ═══════════════════════════════════════════════
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      Chuyên Đề: Phẳng Hoá Hình Không Gian - Vận Dụng Cao\
      Trải Mặt Đa Diện & Đường Xoắn Ốc Không Gian
    ]
    #v(0.3em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Định lý Cosin mở rộng · Đa mặt cắt · Không gian Oxyz · Tối ưu đường đi
    ]
  ]
]

// ═══════════════════════════════════════════════
// LÝ THUYẾT NỀN TẢNG
// ═══════════════════════════════════════════════
= I. Phương Pháp Giải & Định Lý Cơ Bản

#lythuyet[
  *1. Nguyên lý trải phẳng đa diện:*
  Khi một vật thể chuyển động men theo các mặt của một khối đa diện (chóp, lăng trụ) đi từ điểm A đến điểm B, quãng đường ngắn nhất được tìm bằng cách "mở tung" các mặt đa diện đó ra một mặt phẳng duy nhất.
  - *Lưu ý tử huyệt:* Tổng các góc ở đỉnh chung (ví dụ đỉnh $S$) khi trải phẳng phải nhỏ hơn $180^degree$. Nếu $Sigma alpha >= 180^degree$, đường nối thẳng sẽ cắt qua đỉnh hoặc vượt ra khỏi ranh giới mặt phẳng, khi đó quỹ đạo ngắn nhất sẽ đi thẳng qua đỉnh $S$.

  *2. Đường xoắn ốc (Helix) trên nón và trụ:*
  Khi một vật thể quấn quanh hình nón (hoặc trụ) $n$ vòng, ta không chỉ trải nón $1$ lần mà phải *copy và dán* liên tiếp $n$ hình quạt (hoặc $n$ hình chữ nhật) cạnh nhau.
  Quãng đường đi ngắn nhất chính là đoạn thẳng nối điểm xuất phát ở "bản sao đầu tiên" với điểm kết thúc ở "bản sao thứ $n$". Góc ở tâm của toàn bộ hệ tọa độ phẳng này sẽ là $alpha_"total" = n dot alpha$.
]

// ═══════════════════════════════════════════════
// PHÂN TÍCH Ý TƯỞNG & BÀI TOÁN GỐC
// ═══════════════════════════════════════════════
= II. Các Siêu Phẩm Vận Dụng Cao (VDC)

#tln(
  id: "PH-VDC-01",
  [Cho khối chóp tứ giác đều $S.A B C D$ có cạnh đáy $a = 1$, cạnh bên $b = 2$. Một con nhện xuất phát từ điểm $M$ nằm trên cạnh bên $S A$ với khoảng cách $S M = 1$, nó bò men theo liên tiếp 4 mặt bên $(S A B), (S B C), (S C D), (S D A)$ rồi quay trở lại đúng vị trí $M$ ban đầu. Tính quãng đường ngắn nhất mà con nhện đã đi.],
  [$(7 sqrt(15))/16$],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Nhìn trên không gian 3D, quỹ đạo con nhện là một đường gấp khúc không gian uốn quanh 4 mặt chóp.
      2. Nếu ta cắt hình chóp theo đường sinh $S A$ và trải phẳng ra, ta sẽ được 4 tam giác cân dính liền nhau tại đỉnh $S$. Cạnh $S A$ tách làm 2 viền ngoài cùng.
      3. Quãng đường Min chính là đoạn thẳng nối 2 điểm viền ngoài. Dùng Định lý Cosin với Góc ở đỉnh tổng.
    ]

    *Hình 3D Phối cảnh & Sơ đồ Trải phẳng:*
    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *

        // HÌNH 3D CHÓP (bên trái)
        let S_3d = (-5, 3.5)
        let A_3d = (-7, 0)
        let B_3d = (-3, 0)
        let C_3d = (-2, 1)
        let D_3d = (-6, 1)

        line(A_3d, B_3d, C_3d, stroke: 1.5pt)
        line(C_3d, D_3d, A_3d, stroke: (dash: "dashed", paint: rgb("555")))

        line(S_3d, A_3d, stroke: 1.5pt)
        line(S_3d, B_3d, stroke: 1.5pt)
        line(S_3d, C_3d, stroke: 1.5pt)
        line(S_3d, D_3d, stroke: (dash: "dashed", paint: rgb("555")))

        circle(S_3d, radius: 0.05, fill: black)
        content((S_3d.at(0), S_3d.at(1) + 0.3), [$S$])
        content((A_3d.at(0) - 0.2, A_3d.at(1) - 0.2), [$A$])
        content((B_3d.at(0) + 0.2, B_3d.at(1) - 0.2), [$B$])
        content((C_3d.at(0) + 0.2, C_3d.at(1) + 0.2), [$C$])
        content((D_3d.at(0) - 0.2, D_3d.at(1) + 0.2), [$D$])

        // Điểm M
        let M_3d = (-6, 1.75) // Midpoint of SA
        circle(M_3d, radius: 0.08, fill: rgb("E91E63"))
        content((M_3d.at(0) - 0.3, M_3d.at(1)), box(fill: rgb("fce4ec"), inset: 2pt, radius: 2pt)[#text(
          size: 8pt,
        )[$M$]])

        // Quỹ đạo 3D (Ziczac curve)
        let P1 = (-4.393, 2.438)
        let P2 = (-4.203, 2.836)
        let P3 = (-5.304, 2.741)
        line(M_3d, P1, P2, stroke: 1.5pt + rgb("E91E63"))
        line(P2, P3, M_3d, stroke: (dash: "dashed", paint: rgb("E91E63"), thickness: 1.5pt))

        content((-4.5, -0.8), box(
          fill: rgb("e3f2fd"),
          stroke: 1pt + rgb("1976D2"),
          inset: 3pt,
          radius: 3pt,
        )[Hình 3D Khối Chóp])

        // HÌNH TRẢI PHẲNG (bên phải)
        let S = (2, 0)
        circle(S, radius: 0.05, fill: rgb("D32F2F"), name: "S_2d")
        content((S.at(0) - 0.2, S.at(1) + 0.2), box(fill: rgb("ffebee"), inset: 2pt, radius: 2pt)[#text(
          size: 9pt,
        )[$S$]])

        let a = -15deg
        let pA1 = (S.at(0) + 4 * calc.cos(a), S.at(1) + 4 * calc.sin(a))
        let pB = (S.at(0) + 4 * calc.cos(a + 29deg), S.at(1) + 4 * calc.sin(a + 29deg))
        let pC = (S.at(0) + 4 * calc.cos(a + 58deg), S.at(1) + 4 * calc.sin(a + 58deg))
        let pD = (S.at(0) + 4 * calc.cos(a + 87deg), S.at(1) + 4 * calc.sin(a + 87deg))
        let pA2 = (S.at(0) + 4 * calc.cos(a + 116deg), S.at(1) + 4 * calc.sin(a + 116deg))

        line(S, pA1, stroke: 1pt + rgb("1A5276"))
        line(S, pB, stroke: 1pt + rgb("1A5276"))
        line(S, pC, stroke: 1pt + rgb("1A5276"))
        line(S, pD, stroke: 1pt + rgb("1A5276"))
        line(S, pA2, stroke: 1pt + rgb("1A5276"))
        line(pA1, pB, pC, pD, pA2, stroke: 1.5pt + rgb("388E3C"))

        content(pA1, box(fill: rgb("e3f2fd"), inset: 2pt, radius: 2pt)[#text(size: 9pt)[$A$]])
        content(pB, box(fill: rgb("e3f2fd"), inset: 2pt, radius: 2pt)[#text(size: 9pt)[$B$]])
        content(pA2, box(fill: rgb("e3f2fd"), inset: 2pt, radius: 2pt)[#text(size: 9pt)[$A'$]])

        let m1 = (S.at(0) + 2 * calc.cos(a), S.at(1) + 2 * calc.sin(a))
        let m2 = (S.at(0) + 2 * calc.cos(a + 116deg), S.at(1) + 2 * calc.sin(a + 116deg))
        circle(m1, radius: 0.08, fill: rgb("E91E63"))
        content((m1.at(0) + 0.3, m1.at(1) - 0.2), box(fill: rgb("fce4ec"), inset: 2pt, radius: 2pt)[#text(
          size: 9pt,
        )[$M_1$]])
        circle(m2, radius: 0.08, fill: rgb("E91E63"))
        content((m2.at(0) - 0.3, m2.at(1) + 0.2), box(fill: rgb("fce4ec"), inset: 2pt, radius: 2pt)[#text(
          size: 9pt,
        )[$M_2$]])

        line(m1, m2, stroke: 2pt + rgb("E91E63"))
        content((4, 1.5), box(fill: rgb("fff3e0"), stroke: 1pt + rgb("E91E63"), inset: 3pt, radius: 3pt)[#text(
          size: 9pt,
        )[$d_"min"$]])

        let arc_start1 = (S.at(0) + 0.8 * calc.cos(a), S.at(1) + 0.8 * calc.sin(a))
        arc(arc_start1, start: a, stop: a + 116deg, radius: 0.8, stroke: (dash: "dashed", paint: rgb("E91E63")))
        content((3.2, 0.8), box(fill: white, inset: 1pt)[$4 alpha$])
      })
    ]

    #step([Tính góc ở đỉnh của 1 mặt bên])
    Xét $Delta S A B$ là tam giác cân tại $S$ với $S A = S B = 2, A B = 1$. Gọi $alpha = angle A S B$. Áp dụng định lý hàm cos:
    $ cos alpha = (S A^2 + S B^2 - A B^2) / (2 dot S A dot S B) = (2^2 + 2^2 - 1^2) / (2 dot 2 dot 2) = 7/8 $

    #step([Tính tổng góc $4 alpha$ và định lý cosin cho cả quãng đường])
    Khi trải 4 mặt phẳng liên tiếp, tổng góc ở đỉnh là $angle M_1 S M_2 = 4 alpha$.
    Ta cần tính $cos(4 alpha)$. Dùng công thức nhân đôi liên tiếp:
    $ cos(2 alpha) = 2 cos^2 alpha - 1 = 2 (7/8)^2 - 1 = 2 (49/64) - 1 = 17/32 $
    $ cos(4 alpha) = 2 cos^2(2 alpha) - 1 = 2 (17/32)^2 - 1 = 2 (289/1024) - 1 = 289/512 - 512/512 = -223/512 $

    #step([Tính độ dài quãng đường ngắn nhất $M_1 M_2$])
    Xét $Delta S M_1 M_2$ có $S M_1 = S M_2 = 1$. Áp dụng định lý hàm cos:
    $ d_"min"^2 = S M_1^2 + S M_2^2 - 2 dot S M_1 dot S M_2 dot cos(4 alpha) $
    $ d_"min"^2 = 1^2 + 1^2 - 2(1)(1)(-223/512) = 2 + 223/256 = (512 + 223)/256 = 735/256 $
    Vậy $d_"min" = sqrt(735)/16 = (7 sqrt(15))/16$.
  ],
)

#tln(
  id: "PH-VDC-02",
  [Cho khối nón có đỉnh $S$, bán kính đáy $R = 1$ và đường sinh $l = 12$. Một dây leo bắt đầu từ điểm $A$ trên viền đáy, quấn quanh mặt xung quanh của khối nón đúng 3 vòng rồi kết thúc tại điểm $B$ nằm trên cùng đường sinh $S A$ với $A$. Biết khoảng cách từ $S$ đến $B$ là $5$. Tìm chiều dài ngắn nhất của đoạn dây leo đó.],
  [$13$],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Trong không gian 3D, sợi dây leo tạo thành đường xoắn ốc (Helix) ẩn hiện 3 lần quanh mặt nón.
      2. Mở phẳng, quỹ đạo này cắt qua $3$ lần bề mặt nón. Ta trải phẳng mặt nón và nhân bản nó lên 3 lần liền nhau.
      3. Nếu góc trải của 1 nón là $alpha$, thì góc trải của 3 vòng là $3 alpha$. Đoạn thẳng nối $A$ và $B'$ sẽ đâm xuyên qua 3 bản sao này.
    ]

    *Hình 3D Khối Nón & Sơ đồ Triple-unrolling:*
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *

        // HÌNH 3D NÓN (bên trái)
        let S_cone = (-8, 8)
        let A_cone = (-11, 0)
        let A_right = (-5, 0)

        // Đáy nón (Elip)
        arc((-5, 0), start: 0deg, stop: -180deg, radius: (3, 0.8), stroke: 1.5pt)
        arc((-5, 0), start: 0deg, stop: 180deg, radius: (3, 0.8), stroke: (dash: "dashed", paint: rgb("555")))

        line(S_cone, A_cone, stroke: 1.5pt)
        line(S_cone, A_right, stroke: 1.5pt)
        circle(S_cone, radius: 0.08, fill: black)
        content((-8, 8.5), [$S$])
        circle(A_cone, radius: 0.08, fill: rgb("1976D2"))
        content((-11.5, 0), [$A$])

        let B_cone = (-9.167, 4.667) // SB = 5, SA = 12 => z_B = 8 * (7/12) = 14/3 = 4.667. x_B = -8 - 3*(7/12) = -9.75. Wait! I just place it where helix ends.
        circle((-9.25, 4.667), radius: 0.08, fill: rgb("388E3C"))
        content((-10.0, 4.667), [$B$])

        // Vẽ Helix 3 vòng được generated bằng Python
        line(
          (-11.000, 0.000),
          (-10.949, -0.086),
          (-10.825, -0.167),
          (-10.634, -0.241),
          (-10.380, -0.306),
          (-10.070, -0.357),
          (-9.712, -0.395),
          (-9.316, -0.416),
          (-8.891, -0.420),
          (-8.449, -0.406),
          (-8.000, -0.372),
          (-7.556, -0.320),
          (-7.127, -0.250),
          (-6.724, -0.162),
          (-6.357, -0.059),
          (-6.033, 0.059),
          (-5.762, 0.189),
          (-5.548, 0.328),
          (-5.396, 0.474),
          (-5.311, 0.625),
          (-5.292, 0.778),
          stroke: 1.5pt + rgb("E91E63"),
        )
        line(
          (-5.292, 0.778),
          (-5.339, 0.929),
          (-5.452, 1.076),
          (-5.626, 1.217),
          (-5.856, 1.349),
          (-6.136, 1.469),
          (-6.460, 1.577),
          (-6.817, 1.669),
          (-7.199, 1.746),
          (-7.597, 1.807),
          (-8.000, 1.850),
          (-8.399, 1.877),
          (-8.783, 1.887),
          (-9.143, 1.882),
          (-9.472, 1.862),
          (-9.760, 1.831),
          (-10.002, 1.788),
          (-10.192, 1.737),
          (-10.326, 1.679),
          (-10.401, 1.618),
          (-10.417, 1.556),
          stroke: (dash: "dashed", paint: rgb("E91E63")),
        )
        line(
          (-10.417, 1.556),
          (-10.373, 1.494),
          (-10.271, 1.437),
          (-10.114, 1.385),
          (-9.908, 1.341),
          (-9.657, 1.308),
          (-9.369, 1.286),
          (-9.051, 1.278),
          (-8.711, 1.283),
          (-8.358, 1.304),
          (-8.000, 1.339),
          (-7.647, 1.389),
          (-7.307, 1.454),
          (-6.989, 1.532),
          (-6.700, 1.623),
          (-6.446, 1.724),
          (-6.234, 1.836),
          (-6.068, 1.954),
          (-5.951, 2.078),
          (-5.887, 2.205),
          (-5.875, 2.333),
          stroke: 1.5pt + rgb("E91E63"),
        )
        line(
          (-5.875, 2.333),
          (-5.916, 2.460),
          (-6.007, 2.584),
          (-6.146, 2.702),
          (-6.328, 2.813),
          (-6.549, 2.915),
          (-6.802, 3.006),
          (-7.082, 3.086),
          (-7.379, 3.154),
          (-7.688, 3.208),
          (-8.000, 3.250),
          (-8.307, 3.279),
          (-8.603, 3.295),
          (-8.879, 3.299),
          (-9.129, 3.292),
          (-9.348, 3.276),
          (-9.530, 3.252),
          (-9.672, 3.222),
          (-9.771, 3.187),
          (-9.825, 3.149),
          (-9.833, 3.111),
          stroke: (dash: "dashed", paint: rgb("E91E63")),
        )
        line(
          (-9.833, 3.111),
          (-9.796, 3.074),
          (-9.716, 3.040),
          (-9.595, 3.011),
          (-9.436, 2.988),
          (-9.245, 2.974),
          (-9.026, 2.968),
          (-8.786, 2.972),
          (-8.530, 2.987),
          (-8.266, 3.013),
          (-8.000, 3.050),
          (-7.738, 3.098),
          (-7.488, 3.157),
          (-7.254, 3.226),
          (-7.042, 3.304),
          (-6.858, 3.390),
          (-6.706, 3.483),
          (-6.587, 3.580),
          (-6.506, 3.682),
          (-6.463, 3.785),
          (-6.458, 3.889),
          stroke: 1.5pt + rgb("E91E63"),
        )
        line(
          (-6.458, 3.889),
          (-6.492, 3.991),
          (-6.562, 4.091),
          (-6.665, 4.187),
          (-6.800, 4.277),
          (-6.961, 4.360),
          (-7.145, 4.436),
          (-7.346, 4.503),
          (-7.560, 4.561),
          (-7.779, 4.610),
          (-8.000, 4.650),
          (-8.216, 4.680),
          (-8.422, 4.702),
          (-8.614, 4.716),
          (-8.786, 4.722),
          (-8.935, 4.722),
          (-9.058, 4.716),
          (-9.153, 4.707),
          (-9.217, 4.694),
          (-9.249, 4.681),
          (-9.250, 4.667),
          stroke: (dash: "dashed", paint: rgb("E91E63")),
        )

        content((-8, -2), box(
          fill: rgb("e3f2fd"),
          stroke: 1pt + rgb("1976D2"),
          inset: 3pt,
          radius: 3pt,
        )[Hình 3D Đường Helix])

        // HÌNH TRẢI PHẲNG (bên phải)
        let S = (2, 0)
        circle(S, radius: 0.1, fill: rgb("D32F2F"))
        content((S.at(0) - 0.4, S.at(1) - 0.2), box(fill: rgb("ffebee"), inset: 2pt, radius: 2pt)[#text(
          size: 9pt,
        )[$S$]])

        let a = 0deg
        let pA = (S.at(0) + 8 * calc.cos(a), S.at(1) + 8 * calc.sin(a))
        let pM1 = (S.at(0) + 8 * calc.cos(a + 30deg), S.at(1) + 8 * calc.sin(a + 30deg))
        let pM2 = (S.at(0) + 8 * calc.cos(a + 60deg), S.at(1) + 8 * calc.sin(a + 60deg))
        let pA_prime = (S.at(0) + 8 * calc.cos(a + 90deg), S.at(1) + 8 * calc.sin(a + 90deg))

        line(S, pA, stroke: 1.5pt + rgb("1A5276"))
        line(S, pM1, stroke: (dash: "dashed", paint: rgb("999")))
        line(S, pM2, stroke: (dash: "dashed", paint: rgb("999")))
        line(S, pA_prime, stroke: 1.5pt + rgb("1A5276"))

        let arc_start2 = (S.at(0) + 8 * calc.cos(a), S.at(1) + 8 * calc.sin(a))
        arc(arc_start2, start: 0deg, stop: 90deg, radius: 8, stroke: 1.5pt + rgb("1A5276"))

        circle(pA, radius: 0.1, fill: rgb("1976D2"))
        content((pA.at(0) + 0.6, pA.at(1)), box(fill: rgb("e3f2fd"), inset: 2pt, radius: 2pt)[#text(size: 9pt)[$A$]])

        let pB = (S.at(0) + 3.33 * calc.cos(90deg), S.at(1) + 3.33 * calc.sin(90deg)) // SB = 5
        circle(pB, radius: 0.1, fill: rgb("388E3C"))
        content((pB.at(0) - 0.6, pB.at(1) + 0.2), box(fill: rgb("e8f5e9"), inset: 2pt, radius: 2pt)[#text(
          size: 9pt,
        )[$B'$]])

        line(pA, pB, stroke: 2pt + rgb("E91E63"))

        // Ký hiệu góc 90
        line(
          (S.at(0) + 0.5, S.at(1)),
          (S.at(0) + 0.5, S.at(1) + 0.5),
          (S.at(0), S.at(1) + 0.5),
          stroke: 1pt + rgb("D32F2F"),
        )
        content((S.at(0) + 2.5, S.at(1) + 3.5), box(fill: white, inset: 1pt)[$3 alpha = 90^degree$])
      })
    ]

    #step([Tính góc ở tâm khi mở phẳng 1 vòng])
    Chu vi đáy nón $C = 2 pi R = 2 pi$. Bán kính của hình quạt trải phẳng chính là đường sinh $l = 12$.
    Góc ở tâm hình quạt cho 1 vòng nón là:
    $ alpha = C / l = (2 pi) / 12 = pi / 6 = 30^degree. $

    #step([Hợp nhất 3 vòng trên mặt phẳng])
    Quấn 3 vòng tương đương với trải hình quạt 3 lần, tổng góc tạo bởi đường sinh xuất phát $S A$ và đường đích $S A'$ là:
    $ angle A S A' = 3 times 30^degree = 90^degree. $
    Điều này nghĩa là trên hệ tọa độ phẳng, $Delta S A B'$ là tam giác vuông tại $S$.

    #step([Tính chiều dài dây leo])
    Ta có $S A = 12$ và $S B' = 5$. Áp dụng định lý Pytago trong tam giác vuông $S A B'$:
    $ d_"min" = A B' = sqrt(S A^2 + (S B')^2) = sqrt(12^2 + 5^2) = 13. $
  ],
)

#tln(
  id: "PH-VDC-03",
  [*(Siêu phẩm Trải Hình Nón Cụt - 1 Vòng)* Một khối nón cụt có bán kính đáy dưới $R = 2$, bán kính đáy trên $r = 1$, và đường sinh của nón cụt là $l_c = 6$. Một con kiến bò từ điểm $A$ ở viền đáy dưới, quấn quanh mặt nón cụt đúng một vòng và lên đến điểm $B$ ở viền đáy trên (biết $B$ nằm trên cùng một đường sinh với $A$). Tìm độ dài ngắn nhất quãng đường con kiến đã bò.],
  [$6 sqrt(3)$],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Kéo dài đường sinh của nón cụt để tạo thành khối nón hoàn chỉnh có đỉnh $S$. Hình trải phẳng của nón cụt sẽ là một "Hình Vành Khăn" bị cắt góc.
      2. Sử dụng định lý Talet để tìm đường sinh $l_1$ của phần nón bị cắt đi. Từ đó suy ra đường sinh $L$ của nón lớn.
      3. Xác định góc ở tâm $alpha$ và áp dụng định lý Cosin cho $Delta S A B'$.
    ]

    *Hình 3D Nón Cụt & Sơ đồ Trải phẳng (Vành khăn 1 vòng):*
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *

        // 3D Truncated Cone
        let S_cone = (-8, 8)
        let A_cone = (-11, 0)
        let A_right = (-5, 0)
        let B_cone = (-9.5, 4)
        let B_right = (-6.5, 4)

        arc((-5, 0), start: 0deg, stop: -180deg, radius: (3, 0.8), stroke: 1.5pt)
        arc((-5, 0), start: 0deg, stop: 180deg, radius: (3, 0.8), stroke: (dash: "dashed", paint: rgb("555")))

        arc((-6.5, 4), start: 0deg, stop: -180deg, radius: (1.5, 0.4), stroke: 1.5pt)
        arc((-6.5, 4), start: 0deg, stop: 180deg, radius: (1.5, 0.4), stroke: 1.5pt)

        line(A_cone, B_cone, stroke: 1.5pt)
        line(A_right, B_right, stroke: 1.5pt)
        line(B_cone, S_cone, stroke: (dash: "dashed", paint: rgb("999")))
        line(B_right, S_cone, stroke: (dash: "dashed", paint: rgb("999")))

        circle(A_cone, radius: 0.08, fill: rgb("1976D2"))
        content((-11.5, 0), [$A$])
        circle(B_cone, radius: 0.08, fill: rgb("388E3C"))
        content((-10, 4), [$B$])

        line(
          (-11.000, 0.000),
          (-10.959, -0.016),
          (-10.886, -0.030),
          (-10.782, -0.041),
          (-10.649, -0.048),
          (-10.490, -0.050),
          (-10.306, -0.047),
          (-10.099, -0.037),
          (-9.874, -0.022),
          (-9.631, 0.001),
          (-9.375, 0.032),
          (-9.108, 0.069),
          (-8.834, 0.115),
          (-8.556, 0.169),
          (-8.277, 0.231),
          (-8.000, 0.300),
          (-7.728, 0.377),
          (-7.465, 0.462),
          (-7.212, 0.553),
          (-6.973, 0.652),
          (-6.750, 0.756),
          (-6.545, 0.866),
          (-6.361, 0.981),
          (-6.198, 1.101),
          (-6.058, 1.224),
          (-5.943, 1.350),
          (-5.853, 1.478),
          (-5.789, 1.608),
          (-5.750, 1.739),
          (-5.737, 1.870),
          (-5.750, 2.000),
          stroke: 1.5pt + rgb("E91E63"),
        )
        line(
          (-5.750, 2.000),
          (-5.787, 2.129),
          (-5.848, 2.255),
          (-5.931, 2.379),
          (-6.036, 2.500),
          (-6.160, 2.617),
          (-6.301, 2.729),
          (-6.458, 2.837),
          (-6.628, 2.940),
          (-6.810, 3.037),
          (-7.000, 3.129),
          (-7.197, 3.214),
          (-7.397, 3.295),
          (-7.600, 3.369),
          (-7.801, 3.437),
          (-8.000, 3.500),
          (-8.193, 3.557),
          (-8.379, 3.609),
          (-8.556, 3.657),
          (-8.722, 3.699),
          (-8.875, 3.737),
          (-9.014, 3.772),
          (-9.138, 3.804),
          (-9.245, 3.832),
          (-9.335, 3.859),
          (-9.407, 3.883),
          (-9.462, 3.907),
          (-9.498, 3.930),
          (-9.516, 3.953),
          (-9.517, 3.976),
          (-9.500, 4.000),
          stroke: (dash: "dashed", paint: rgb("E91E63")),
        )

        content((-8, -2), box(
          fill: rgb("e3f2fd"),
          stroke: 1pt + rgb("1976D2"),
          inset: 3pt,
          radius: 3pt,
        )[Hình 3D Nón Cụt])

        // 2D Unfolding
        let S = (0, 7)
        let alpha = 60deg
        let a = -120deg

        let pA = (S.at(0) + 6 * calc.cos(a), S.at(1) + 6 * calc.sin(a))
        let pB = (S.at(0) + 3 * calc.cos(a), S.at(1) + 3 * calc.sin(a))
        let pA_prime = (S.at(0) + 6 * calc.cos(a + alpha), S.at(1) + 6 * calc.sin(a + alpha))
        let pB_prime = (S.at(0) + 3 * calc.cos(a + alpha), S.at(1) + 3 * calc.sin(a + alpha))

        line(pA, pB, stroke: 1.5pt + rgb("1A5276"))
        line(pA_prime, pB_prime, stroke: 1.5pt + rgb("1A5276"))
        line(S, pB, stroke: (dash: "dashed", paint: rgb("999")))
        line(S, pB_prime, stroke: (dash: "dashed", paint: rgb("999")))

        let arc_outer = (S.at(0) + 6 * calc.cos(a), S.at(1) + 6 * calc.sin(a))
        arc(arc_outer, start: a, stop: a + alpha, radius: 6, stroke: 1.5pt + rgb("1A5276"))

        let arc_inner = (S.at(0) + 3 * calc.cos(a), S.at(1) + 3 * calc.sin(a))
        arc(arc_inner, start: a, stop: a + alpha, radius: 3, stroke: 1.5pt + rgb("1A5276"))

        circle(pA, radius: 0.1, fill: rgb("1976D2"))
        content((pA.at(0) - 0.5, pA.at(1) - 0.5), [$A$])
        circle(pB_prime, radius: 0.1, fill: rgb("388E3C"))
        content((pB_prime.at(0) + 0.5, pB_prime.at(1) + 0.5), [$B'$])
        circle(S, radius: 0.1, fill: rgb("999"))
        content((S.at(0) - 0.5, S.at(1)), [$S$])

        line(pA, pB_prime, stroke: 2pt + rgb("E91E63"))

        let arc_angle = (S.at(0) + 0.8 * calc.cos(a), S.at(1) + 0.8 * calc.sin(a))
        arc(arc_angle, start: a, stop: a + alpha, radius: 0.8, stroke: (dash: "dashed", paint: rgb("E91E63")))
        content((S.at(0), S.at(1) - 1.2), box(fill: white, inset: 1pt)[$60^degree$])
      })
    ]

    #step([Khôi phục Nón gốc và tìm kích thước])
    Gọi $S$ là đỉnh của hình nón hoàn chỉnh chứa nón cụt.
    Đường sinh của nón cụt là $A B = l_c = 6$. Theo định lý Talet:
    $ (S B) / (S A) = r / R = 1/2 => S A = 2 S B $
    Mà $S A = S B + 6 => 2 S B = S B + 6 => S B = 6$.
    Đường sinh nón lớn là $S A = 12$.

    Góc ở tâm hình quạt cho 1 vòng nón lớn là:
    $ alpha = 360^degree dot R / (S A) = 360^degree dot 2 / 12 = 60^degree. $

    #step([Hợp nhất 1 vòng trên mặt phẳng])
    Kiến quấn 1 vòng tương đương với trải hình quạt 1 lần, góc tạo bởi đường sinh xuất phát $S A$ và đường đích $S B'$ chính là $60^degree$.
    Điều này nghĩa là trên hệ tọa độ phẳng, $Delta S A B'$ có góc ở đỉnh $S$ bằng $60^degree$.

    #step([Tính chiều dài dây leo])
    Ta có $S A = 12$ và $S B' = 6$. Áp dụng định lý Cosin trong tam giác $S A B'$:
    $
      d_"min" = A B' & = sqrt(S A^2 + (S B')^2 - 2 S A dot S B' dot cos 60^degree) \
                     & = sqrt(144 + 36 - 2 dot 12 dot 6 dot 1/2) \
                     & = sqrt(180 - 72) = sqrt(108) = 6 sqrt(3).
    $
  ],
)

#tln(
  id: "PH-VDC-04",
  [*(Siêu phẩm Trải Hình Nón Cụt)* Một khối nón cụt có bán kính đáy dưới $R = 1$, bán kính đáy trên $r = 1/4$, và đường sinh của nón cụt là $l_c = 9$. Một con kiến bò từ điểm $A$ ở viền đáy dưới, quấn quanh mặt nón cụt đúng $2$ vòng và lên đến điểm $B$ ở viền đáy trên (biết $B$ nằm trên cùng một đường sinh với $A$). Tìm độ dài ngắn nhất quãng đường con kiến đã bò.],
  [$3 sqrt(13)$],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Kéo dài đường sinh của nón cụt để tạo thành khối nón hoàn chỉnh có đỉnh $S$. Hình trải phẳng của nón cụt sẽ là một "Hình Vành Khăn" bị cắt góc.
      2. Sử dụng định lý Talet để tìm đường sinh $l_1$ của phần nón bị cắt đi. Từ đó suy ra đường sinh $L$ của nón lớn.
      3. Xác định góc ở tâm $alpha$ và áp dụng định lý Cosin cho $Delta S A B'$.
    ]

    *Hình 3D Nón Cụt & Sơ đồ Trải phẳng (Vành khăn):*
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *

        // 3D Truncated Cone
        let S_cone = (-8, 8)
        let A_cone = (-11, 0)
        let A_right = (-5, 0)
        let B_cone = (-8.75, 6)
        let B_right = (-7.25, 6)

        arc((-5, 0), start: 0deg, stop: -180deg, radius: (3, 0.8), stroke: 1.5pt)
        arc((-5, 0), start: 0deg, stop: 180deg, radius: (3, 0.8), stroke: (dash: "dashed", paint: rgb("555")))

        arc((-7.25, 6), start: 0deg, stop: -180deg, radius: (0.75, 0.2), stroke: 1.5pt)
        arc((-7.25, 6), start: 0deg, stop: 180deg, radius: (0.75, 0.2), stroke: 1.5pt)

        line(A_cone, B_cone, stroke: 1.5pt)
        line(A_right, B_right, stroke: 1.5pt)
        line(B_cone, S_cone, stroke: (dash: "dashed", paint: rgb("999")))
        line(B_right, S_cone, stroke: (dash: "dashed", paint: rgb("999")))

        circle(A_cone, radius: 0.08, fill: rgb("1976D2"))
        content((-11.5, 0), [$A$])
        circle(B_cone, radius: 0.08, fill: rgb("388E3C"))
        content((-9.2, 6), [$B$])

        line(
          (-11.000, 0.000),
          (-10.965, -0.033),
          (-10.898, -0.064),
          (-10.800, -0.093),
          (-10.672, -0.117),
          (-10.517, -0.137),
          (-10.336, -0.153),
          (-10.132, -0.162),
          (-9.907, -0.165),
          (-9.664, -0.161),
          (-9.406, -0.150),
          (-9.136, -0.131),
          (-8.858, -0.104),
          (-8.573, -0.069),
          (-8.286, -0.026),
          (-8.000, 0.025),
          (-7.718, 0.084),
          (-7.443, 0.151),
          (-7.177, 0.225),
          (-6.925, 0.306),
          (-6.688, 0.394),
          (-6.468, 0.488),
          (-6.269, 0.587),
          (-6.091, 0.692),
          (-5.937, 0.800),
          (-5.808, 0.913),
          (-5.705, 1.027),
          (-5.628, 1.145),
          (-5.579, 1.263),
          (-5.557, 1.382),
          (-5.562, 1.500),
          stroke: 1.5pt + rgb("E91E63"),
        )
        line(
          (-5.562, 1.500),
          (-5.595, 1.617),
          (-5.652, 1.733),
          (-5.735, 1.846),
          (-5.842, 1.956),
          (-5.970, 2.062),
          (-6.119, 2.164),
          (-6.286, 2.262),
          (-6.469, 2.353),
          (-6.666, 2.439),
          (-6.875, 2.520),
          (-7.092, 2.594),
          (-7.316, 2.661),
          (-7.544, 2.722),
          (-7.773, 2.777),
          (-8.000, 2.825),
          (-8.223, 2.867),
          (-8.441, 2.903),
          (-8.649, 2.933),
          (-8.847, 2.957),
          (-9.031, 2.976),
          (-9.201, 2.991),
          (-9.355, 3.001),
          (-9.491, 3.008),
          (-9.608, 3.012),
          (-9.705, 3.012),
          (-9.781, 3.012),
          (-9.837, 3.009),
          (-9.871, 3.006),
          (-9.883, 3.003),
          (-9.875, 3.000),
          stroke: (dash: "dashed", paint: rgb("E91E63")),
        )
        line(
          (-9.875, 3.000),
          (-9.846, 2.998),
          (-9.797, 2.998),
          (-9.730, 3.000),
          (-9.644, 3.005),
          (-9.543, 3.013),
          (-9.426, 3.024),
          (-9.296, 3.039),
          (-9.154, 3.058),
          (-9.003, 3.082),
          (-8.844, 3.110),
          (-8.679, 3.143),
          (-8.510, 3.182),
          (-8.339, 3.225),
          (-8.169, 3.272),
          (-8.000, 3.325),
          (-7.835, 3.382),
          (-7.676, 3.444),
          (-7.525, 3.510),
          (-7.382, 3.580),
          (-7.250, 3.654),
          (-7.129, 3.730),
          (-7.021, 3.810),
          (-6.927, 3.892),
          (-6.847, 3.977),
          (-6.782, 4.062),
          (-6.732, 4.150),
          (-6.698, 4.237),
          (-6.680, 4.325),
          (-6.676, 4.413),
          (-6.688, 4.500),
          stroke: 1.5pt + rgb("E91E63"),
        )
        line(
          (-6.688, 4.500),
          (-6.713, 4.586),
          (-6.753, 4.671),
          (-6.805, 4.754),
          (-6.869, 4.834),
          (-6.945, 4.912),
          (-7.029, 4.988),
          (-7.122, 5.061),
          (-7.222, 5.130),
          (-7.328, 5.197),
          (-7.438, 5.260),
          (-7.550, 5.319),
          (-7.664, 5.376),
          (-7.778, 5.429),
          (-7.890, 5.478),
          (-8.000, 5.525),
          (-8.106, 5.569),
          (-8.207, 5.609),
          (-8.301, 5.647),
          (-8.389, 5.683),
          (-8.469, 5.717),
          (-8.540, 5.748),
          (-8.602, 5.778),
          (-8.655, 5.807),
          (-8.698, 5.835),
          (-8.731, 5.862),
          (-8.754, 5.889),
          (-8.767, 5.916),
          (-8.770, 5.944),
          (-8.765, 5.971),
          (-8.750, 6.000),
          stroke: (dash: "dashed", paint: rgb("E91E63")),
        )

        content((-8, -2), box(
          fill: rgb("e3f2fd"),
          stroke: 1pt + rgb("1976D2"),
          inset: 3pt,
          radius: 3pt,
        )[Hình 3D Nón Cụt])

        // 2D Unfolding
        let S = (0, 7)
        let alpha = 120deg
        let a = -120deg

        let pA = (S.at(0) + 6 * calc.cos(a), S.at(1) + 6 * calc.sin(a))
        let pB = (S.at(0) + 1.5 * calc.cos(a), S.at(1) + 1.5 * calc.sin(a))
        let pA_prime = (S.at(0) + 6 * calc.cos(a + alpha), S.at(1) + 6 * calc.sin(a + alpha))
        let pB_prime = (S.at(0) + 1.5 * calc.cos(a + alpha), S.at(1) + 1.5 * calc.sin(a + alpha))

        line(pB, pA, stroke: 1.5pt + rgb("1A5276"))
        line(pB_prime, pA_prime, stroke: 1.5pt + rgb("1A5276"))
        line(S, pB, stroke: (dash: "dashed", paint: rgb("999")))
        line(S, pB_prime, stroke: (dash: "dashed", paint: rgb("999")))

        let arc_outer = (S.at(0) + 6 * calc.cos(a), S.at(1) + 6 * calc.sin(a))
        arc(arc_outer, start: a, stop: a + alpha, radius: 6, stroke: 1.5pt + rgb("1A5276"))

        let arc_inner = (S.at(0) + 1.5 * calc.cos(a), S.at(1) + 1.5 * calc.sin(a))
        arc(arc_inner, start: a, stop: a + alpha, radius: 1.5, stroke: 1.5pt + rgb("1A5276"))

        circle(pA, radius: 0.1, fill: rgb("1976D2"))
        content((pA.at(0) - 0.5, pA.at(1) - 0.5), [$A$])
        circle(pB_prime, radius: 0.1, fill: rgb("388E3C"))
        content((pB_prime.at(0) + 0.5, pB_prime.at(1) + 0.5), [$B'$])

        line(pA, pB_prime, stroke: 2pt + rgb("E91E63"))

        let arc_angle = (S.at(0) + 0.8 * calc.cos(a), S.at(1) + 0.8 * calc.sin(a))
        arc(arc_angle, start: a, stop: a + alpha, radius: 0.8, stroke: (dash: "dashed", paint: rgb("E91E63")))
        content((S.at(0), S.at(1) - 1.2), box(fill: white, inset: 1pt)[$120^degree$])
      })
    ]

    #step([Khôi phục Nón gốc và tìm kích thước])
    Gọi $l_1$ là đường sinh của phần nón bị cắt đi, $L$ là đường sinh của nón lớn. Áp dụng định lý Talet:
    $ l_1 / r = (l_1 + l_c) / R <=> l_1 / 1 = (l_1 + 6) / 3 <=> 3l_1 = l_1 + 6 <=> l_1 = 3. $
    Vậy đường sinh nón lớn $L = l_1 + l_c = 3 + 6 = 9$.

    #step([Tính góc ở tâm khi trải phẳng])
    Góc ở tâm hình quạt (vành khăn) là:
    $ alpha = (2 pi R) / L = (2 pi dot 3) / 9 = (2 pi) / 3 = 120^degree. $

    #step([Áp dụng Định lý Cosin])
    Trên mặt phẳng, ta xét tam giác $S A B'$ với $S A = L = 9$ và $S B' = l_1 = 3$. Góc $angle A S B' = 120^degree$.
    Quãng đường ngắn nhất $d = A B'$ được tính bằng:
    $ d^2 = S A^2 + (S B')^2 - 2 dot S A dot S B' dot cos(120^degree) $
    $ d^2 = 9^2 + 3^2 - 2(9)(3)(-1/2) = 81 + 9 + 27 = 117. $
    Vậy quãng đường ngắn nhất là $d = sqrt(117) = 3 sqrt(13)$.
  ],
)

#tln(
  id: "PH-VDC-04b",
  [*(Siêu phẩm Trải Hình Nón Cụt - 1.5 Vòng)* Một khối nón cụt có bán kính đáy dưới $R = 1$, bán kính đáy trên $r = 1/3$, và đường sinh của nón cụt là $l_c = 6$. Một con kiến bò từ điểm $A$ ở viền đáy dưới, quấn quanh mặt nón cụt đúng $1.5$ vòng và lên đến điểm $B$ ở viền đáy trên (biết $B$ nằm trên viền đáy trên sao cho $B$ đối diện với đường sinh đi qua $A$). Tìm độ dài ngắn nhất quãng đường con kiến đã bò.],
  [$3 sqrt(7)$],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Kéo dài đường sinh để tạo hình nón hoàn chỉnh đỉnh $S$. Hình trải phẳng của nón cụt là một vành khăn.
      2. Sử dụng Talet: Đường sinh nón lớn $L = 9$, nón nhỏ $l = 3$. Góc ở tâm nón lớn $alpha = 40^degree$.
      3. Quấn $1.5$ vòng tương đương với di chuyển qua một góc $1.5 times 40^degree = 60^degree$. Điểm đến là $B'$ cách $A$ một góc $60^degree$ đối với tâm $S$.
    ]

    *Hình 3D Nón Cụt & Sơ đồ Trải phẳng (1.5 vòng):*
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *

        // 3D Truncated Cone
        let S_cone = (-8, 9)
        let A_cone = (-11, 0)
        let A_right = (-5, 0)
        let B_cone = (-9, 6)
        let B_right = (-7, 6)

        arc((-5, 0), start: 0deg, stop: -180deg, radius: (3, 0.8), stroke: 1.5pt)
        arc((-5, 0), start: 0deg, stop: 180deg, radius: (3, 0.8), stroke: (dash: "dashed", paint: rgb("555")))

        arc((-7, 6), start: 0deg, stop: -180deg, radius: (1, 0.26), stroke: 1.5pt)
        arc((-7, 6), start: 0deg, stop: 180deg, radius: (1, 0.26), stroke: 1.5pt)

        line(A_cone, B_cone, stroke: 1.5pt)
        line(A_right, B_right, stroke: 1.5pt)
        line(B_cone, S_cone, stroke: (dash: "dashed", paint: rgb("999")))
        line(B_right, S_cone, stroke: (dash: "dashed", paint: rgb("999")))

        circle(A_cone, radius: 0.08, fill: rgb("1976D2"))
        content((-11.5, 0), [$A$])
        circle((-7, 6), radius: 0.08, fill: rgb("388E3C"))
        content((-6.5, 6), [$B$])

        line(
          (-11.000, 0.000),
          (-10.961, -0.016),
          (-10.891, -0.031),
          (-10.790, -0.042),
          (-10.659, -0.049),
          (-10.502, -0.052),
          (-10.319, -0.049),
          (-10.114, -0.041),
          (-9.888, -0.026),
          (-9.646, -0.004),
          (-9.389, 0.025),
          (-9.121, 0.062),
          (-8.845, 0.107),
          (-8.564, 0.160),
          (-8.281, 0.220),
          (-8.000, 0.289),
          (-7.724, 0.365),
          (-7.455, 0.449),
          (-7.197, 0.541),
          (-6.952, 0.639),
          (-6.722, 0.743),
          (-6.511, 0.853),
          (-6.320, 0.969),
          (-6.150, 1.089),
          (-6.004, 1.213),
          (-5.883, 1.341),
          (-5.787, 1.471),
          (-5.717, 1.602),
          (-5.674, 1.735),
          (-5.657, 1.868),
          (-5.667, 2.000),
          stroke: 1.5pt + rgb("E91E63"),
        )
        line(
          (-5.667, 2.000),
          (-5.702, 2.131),
          (-5.761, 2.260),
          (-5.844, 2.387),
          (-5.950, 2.510),
          (-6.075, 2.630),
          (-6.220, 2.745),
          (-6.382, 2.855),
          (-6.558, 2.961),
          (-6.746, 3.060),
          (-6.944, 3.154),
          (-7.150, 3.242),
          (-7.361, 3.324),
          (-7.575, 3.400),
          (-7.789, 3.470),
          (-8.000, 3.533),
          (-8.207, 3.591),
          (-8.407, 3.643),
          (-8.597, 3.690),
          (-8.777, 3.732),
          (-8.944, 3.770),
          (-9.097, 3.803),
          (-9.234, 3.832),
          (-9.354, 3.858),
          (-9.456, 3.882),
          (-9.540, 3.904),
          (-9.604, 3.924),
          (-9.648, 3.943),
          (-9.674, 3.962),
          (-9.680, 3.980),
          (-9.667, 4.000),
          stroke: (dash: "dashed", paint: rgb("E91E63")),
        )
        line(
          (-9.667, 4.000),
          (-9.635, 4.021),
          (-9.587, 4.043),
          (-9.522, 4.068),
          (-9.441, 4.096),
          (-9.347, 4.126),
          (-9.240, 4.160),
          (-9.123, 4.197),
          (-8.996, 4.238),
          (-8.862, 4.284),
          (-8.722, 4.333),
          (-8.578, 4.387),
          (-8.433, 4.445),
          (-8.286, 4.507),
          (-8.142, 4.574),
          (-8.000, 4.644),
          (-7.863, 4.719),
          (-7.732, 4.797),
          (-7.609, 4.879),
          (-7.494, 4.964),
          (-7.389, 5.051),
          (-7.295, 5.141),
          (-7.212, 5.233),
          (-7.141, 5.327),
          (-7.083, 5.422),
          (-7.038, 5.519),
          (-7.005, 5.615),
          (-6.986, 5.712),
          (-6.978, 5.809),
          (-6.983, 5.905),
          (-7.000, 6.000),
          stroke: 1.5pt + rgb("E91E63"),
        )

        content((-8, -2), box(
          fill: rgb("e3f2fd"),
          stroke: 1pt + rgb("1976D2"),
          inset: 3pt,
          radius: 3pt,
        )[Hình 3D Nón Cụt])

        // 2D Unfolding
        let S = (0, 7)
        let alpha = 90deg
        let a = -120deg

        let pA = (S.at(0) + 6 * calc.cos(a), S.at(1) + 6 * calc.sin(a))
        let pB = (S.at(0) + 2 * calc.cos(a), S.at(1) + 2 * calc.sin(a))
        let pA_prime = (S.at(0) + 6 * calc.cos(a + alpha), S.at(1) + 6 * calc.sin(a + alpha))
        let pB_prime = (S.at(0) + 2 * calc.cos(a + alpha), S.at(1) + 2 * calc.sin(a + alpha))

        line(pA, pB, stroke: 1.5pt + rgb("1A5276"))
        line(pA_prime, pB_prime, stroke: 1.5pt + rgb("1A5276"))
        line(S, pB, stroke: (dash: "dashed", paint: rgb("999")))
        line(S, pB_prime, stroke: (dash: "dashed", paint: rgb("999")))

        let arc_outer = (S.at(0) + 6 * calc.cos(a), S.at(1) + 6 * calc.sin(a))
        arc(arc_outer, start: a, stop: a + alpha, radius: 6, stroke: 1.5pt + rgb("1A5276"))

        let arc_inner = (S.at(0) + 2 * calc.cos(a), S.at(1) + 2 * calc.sin(a))
        arc(arc_inner, start: a, stop: a + alpha, radius: 2, stroke: 1.5pt + rgb("1A5276"))

        circle(pA, radius: 0.1, fill: rgb("1976D2"))
        content((pA.at(0) - 0.5, pA.at(1) - 0.5), [$A$])
        circle(pB_prime, radius: 0.1, fill: rgb("388E3C"))
        content((pB_prime.at(0) + 0.5, pB_prime.at(1) + 0.5), [$B'$])
        circle(S, radius: 0.1, fill: rgb("999"))
        content((S.at(0) - 0.5, S.at(1)), [$S$])

        line(pA, pB_prime, stroke: 2pt + rgb("E91E63"))

        let arc_angle = (S.at(0) + 0.8 * calc.cos(a), S.at(1) + 0.8 * calc.sin(a))
        arc(arc_angle, start: a, stop: a + alpha, radius: 0.8, stroke: (dash: "dashed", paint: rgb("E91E63")))
        content((S.at(0), S.at(1) - 1.2), box(fill: white, inset: 1pt)[$90^degree$])
      })
    ]

    #step([Khôi phục Nón gốc và tìm kích thước])
    Đường sinh của nón cụt là $l_c = 6$. Theo định lý Talet:
    $ (S B) / (S A) = r / R = (1/3) / 1 = 1/3 => S A = 3 S B $
    Mà $S A = S B + 6 => 2 S B = 6 => S B = 3$.
    Đường sinh nón lớn là $S A = 9$.

    Góc ở tâm hình quạt cho 1 vòng nón lớn là:
    $ alpha = 360^degree dot R / (S A) = 360^degree dot 1 / 9 = 40^degree. $

    #step([Hợp nhất 1.5 vòng trên mặt phẳng])
    Kiến quấn 1.5 vòng tương đương với trải hình quạt qua góc:
    $ angle A S B' = 1.5 times 40^degree = 60^degree. $
    Trên hệ tọa độ phẳng, $Delta S A B'$ có góc ở đỉnh $S$ bằng $60^degree$.

    #step([Tính chiều dài dây leo])
    Ta có $S A = 9$ và $S B' = 3$. Áp dụng định lý Cosin trong tam giác $S A B'$:
    $
      d_"min" = A B' & = sqrt(S A^2 + (S B')^2 - 2 S A dot S B' dot cos 60^degree) \
                     & = sqrt(81 + 9 - 2 dot 9 dot 3 dot 1/2) \
                     & = sqrt(90 - 27) = sqrt(63) = 3 sqrt(7).
    $
  ],
)

#tln(
  id: "PH-VDC-05",
  [*(Con nhện trên Lập Phương)* Cho khối lập phương $A B C D.A' B' C' D'$ có cạnh bằng $1$. Một con kiến xuất phát từ đỉnh $A$ (dưới cùng) muốn bò đến đỉnh $C'$ (trên cùng đối diện). Biết con kiến chỉ có thể bò trên bề mặt các mặt của lập phương, tìm quãng đường ngắn nhất.],
  [$sqrt(5)$],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      Nhiều học sinh sẽ nghĩ kiến bò qua 3 mặt (ví dụ $A -> B -> C -> C'$) dài $3$, hoặc băng chéo mặt đáy rồi lên ($A -> C -> C'$) dài $sqrt(2) + 1 approx 2.414$.
      Thực chất, đường đi tối ưu nhất là vắt chéo qua đúng 2 mặt phẳng (ví dụ băng qua cạnh $B B'$). Khi trải phẳng 2 mặt này ra, nó trở thành một hình chữ nhật kích thước $1 times 2$.
    ]

    *Hình 3D Khối Lập Phương & Sơ đồ Trải 2 mặt:*
    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *

        // 3D Cube
        let A = (0, 0)
        let B = (2, 0)
        let C = (3, 1)
        let D = (1, 1)
        let A_p = (0, 2)
        let B_p = (2, 2)
        let C_p = (3, 3)
        let D_p = (1, 3)

        line(A, B, C, C_p, B_p, A_p, A, stroke: 1.5pt)
        line(B, B_p, stroke: 1.5pt)
        line(A_p, D_p, C_p, stroke: 1.5pt)

        line(A, D, D_p, stroke: (dash: "dashed", paint: rgb("555")))
        line(C, D, stroke: (dash: "dashed", paint: rgb("555")))

        circle(A, radius: 0.08, fill: rgb("1976D2"))
        content((-0.3, -0.3), [$A$])
        circle(C_p, radius: 0.08, fill: rgb("388E3C"))
        content((3.3, 3.3), [$C'$])

        // Path A -> B'B -> C'
        let M = (2, 1) // mid of BB'
        line(A, M, C_p, stroke: 2pt + rgb("E91E63"))

        content((1.5, -1), box(
          fill: rgb("e3f2fd"),
          stroke: 1pt + rgb("1976D2"),
          inset: 3pt,
          radius: 3pt,
        )[Hình 3D Lập Phương])

        // 2D Unfolding
        let U_A = (6, 0)
        let U_B = (8, 0)
        let U_C = (10, 0)
        let U_A_p = (6, 2)
        let U_B_p = (8, 2)
        let U_C_p = (10, 2)

        rect(U_A, U_B_p, fill: rgb("FFF9C4"), stroke: 1.5pt)
        rect(U_B, U_C_p, fill: rgb("E8F5E9"), stroke: 1.5pt)

        circle(U_A, radius: 0.08, fill: rgb("1976D2"))
        content((5.7, -0.3), [$A$])
        circle(U_C_p, radius: 0.08, fill: rgb("388E3C"))
        content((10.3, 2.3), [$C'$])

        line(U_A, U_C_p, stroke: 2pt + rgb("E91E63"))
        content((8, 1.4), box(fill: rgb("fce4ec"), stroke: 1pt + rgb("E91E63"), inset: 2pt, radius: 2pt)[#text(
          size: 9pt,
        )[$d = sqrt(5)$]])

        content((7, 0.3), box(fill: white, inset: 1pt)[Mặt $A B B'A'$])
        content((9, 0.3), box(fill: white, inset: 1pt)[Mặt $B C C'B'$])
      })
    ]

    #step([Trải 2 mặt phẳng])
    Ta "gập mở" mặt bên $B C C'B'$ quay quanh bản lề $B B'$ để nó nằm cùng mặt phẳng với mặt $A B B'A'$.
    Khi đó ta thu được một hình chữ nhật $A C C'A'$ có:
    - Chiều ngang $A C = A B + B C = 1 + 1 = 2$.
    - Chiều cao $C C' = 1$.

    #step([Tính quãng đường Min])
    Quãng đường từ $A$ đến $C'$ chính là đường chéo của hình chữ nhật $2 times 1$:
    $ d_"min" = sqrt(2^2 + 1^2) = sqrt(5) approx 2.236. $
    Cách đi này ngắn hơn hẳn so với việc đi men theo đường chéo mặt đáy ($sqrt(2)+1 approx 2.414$).
  ],
)

#tln(
  id: "PH-VDC-06",
  [*(Con kiến bò khối Trụ - 1 Vòng)* Một khối trụ có bán kính đáy $R = 4 / pi$ và chiều cao $h = 8$. Một con kiến bò từ điểm $A$ ở viền đáy dưới, quấn quanh mặt trụ đúng một vòng và lên đến điểm $B$ ở viền đáy trên (biết $B$ nằm trên cùng một đường sinh với $A$). Tìm độ dài ngắn nhất quãng đường con kiến đã bò.],
  [$8 sqrt(2)$],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Khác với khối nón khi trải ra là hình quạt, khối trụ khi trải phẳng ra mặt phẳng sẽ là một *Hình Chữ Nhật*.
      2. Quỹ đạo của con kiến quấn 1 vòng quanh trụ khi trải phẳng sẽ là một đường chéo nối từ góc dưới của hình chữ nhật đến góc trên.
    ]

    *Hình 3D Khối Trụ & Sơ đồ Trải phẳng:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // 3D Cylinder
        let C_bottom = (-8, 0)
        let C_top = (-8, 6)
        let R_v = 3
        let y_v = 0.8

        arc((-5, 0), start: 0deg, stop: -180deg, radius: (R_v, y_v), stroke: 1.5pt)
        arc((-5, 0), start: 0deg, stop: 180deg, radius: (R_v, y_v), stroke: (dash: "dashed", paint: rgb("555")))

        arc((-5, 6), start: 0deg, stop: 360deg, radius: (R_v, y_v), stroke: 1.5pt)

        line((-11, 0), (-11, 6), stroke: 1.5pt)
        line((-5, 0), (-5, 6), stroke: 1.5pt)

        circle((-11, 0), radius: 0.08, fill: rgb("1976D2"))
        content((-11.5, 0), [$A$])
        circle((-11, 6), radius: 0.08, fill: rgb("388E3C"))
        content((-11.5, 6), [$B$])

        line(
          (-11.000, 0.000),
          (-10.984, 0.016),
          (-10.934, 0.034),
          (-10.853, 0.053),
          (-10.741, 0.075),
          (-10.598, 0.100),
          (-10.427, 0.130),
          (-10.229, 0.165),
          (-10.007, 0.205),
          (-9.763, 0.253),
          (-9.500, 0.307),
          (-9.220, 0.369),
          (-8.927, 0.439),
          (-8.624, 0.517),
          (-8.314, 0.604),
          (-8.000, 0.700),
          (-7.686, 0.804),
          (-7.376, 0.917),
          (-7.073, 1.039),
          (-6.780, 1.169),
          (-6.500, 1.307),
          (-6.237, 1.453),
          (-5.993, 1.605),
          (-5.771, 1.765),
          (-5.573, 1.930),
          (-5.402, 2.100),
          (-5.259, 2.275),
          (-5.147, 2.453),
          (-5.066, 2.634),
          (-5.016, 2.816),
          (-5.000, 3.000),
          stroke: 1.5pt + rgb("E91E63"),
        )
        line(
          (-5.000, 3.000),
          (-5.016, 3.184),
          (-5.066, 3.366),
          (-5.147, 3.547),
          (-5.259, 3.725),
          (-5.402, 3.900),
          (-5.573, 4.070),
          (-5.771, 4.235),
          (-5.993, 4.395),
          (-6.237, 4.547),
          (-6.500, 4.693),
          (-6.780, 4.831),
          (-7.073, 4.961),
          (-7.376, 5.083),
          (-7.686, 5.196),
          (-8.000, 5.300),
          (-8.314, 5.396),
          (-8.624, 5.483),
          (-8.927, 5.561),
          (-9.220, 5.631),
          (-9.500, 5.693),
          (-9.763, 5.747),
          (-10.007, 5.795),
          (-10.229, 5.835),
          (-10.427, 5.870),
          (-10.598, 5.900),
          (-10.741, 5.925),
          (-10.853, 5.947),
          (-10.934, 5.966),
          (-10.984, 5.984),
          (-11.000, 6.000),
          stroke: (dash: "dashed", paint: rgb("E91E63")),
        )

        content((-8, -2), box(
          fill: rgb("e3f2fd"),
          stroke: 1pt + rgb("1976D2"),
          inset: 3pt,
          radius: 3pt,
        )[Hình 3D Khối Trụ])

        // 2D Unfolding
        let U_bl = (-2, 0)
        let U_br = (6, 0)
        let U_tl = (-2, 6)
        let U_tr = (6, 6)

        rect(U_bl, U_tr, fill: rgb("E8F5E9"), stroke: 1.5pt + rgb("388E3C"))

        line(U_bl, U_tr, stroke: 2pt + rgb("E91E63"))

        circle(U_bl, radius: 0.08, fill: rgb("1976D2"))
        content((-2.4, 0), [$A$])
        circle(U_tr, radius: 0.08, fill: rgb("388E3C"))
        content((6.4, 6), [$B'$])
        circle(U_br, radius: 0.08, fill: rgb("999"))
        content((6.4, 0), [$A'$])
        circle(U_tl, radius: 0.08, fill: rgb("999"))
        content((-2.4, 6), [$B$])

        content((2, -0.4), [$2 pi R = 8$])
        content((-2.6, 3), [$h = 8$])
      })
    ]

    #step([Trải hình mặt xung quanh khối trụ])
    Khi cắt dọc theo đường sinh $A B$ và trải phẳng mặt xung quanh khối trụ, ta thu được một hình chữ nhật $A B B' A'$ với:
    - Chiều rộng chính là đường sinh: $A B = h = 8$.
    - Chiều dài chính là chu vi đáy: $A A' = 2 pi R = 2 pi dot (4/pi) = 8$.

    #step([Tính chiều dài dây leo])
    Quỹ đạo 1 vòng của con kiến chính là đường chéo $A B'$ của hình chữ nhật.
    Áp dụng định lý Pytago trong tam giác vuông $A A' B'$:
    $ d_"min" = A B' = sqrt(A A'^2 + (A' B')^2) = sqrt(8^2 + 8^2) = 8 sqrt(2). $
  ],
)

#tln(
  id: "PH-VDC-07",
  [*(Đường đi trên mặt trụ)* Một khối trụ tròn xoay có bán kính đáy $R = 2 / pi$ và chiều cao $h = 8$. Một con kiến bò từ điểm $A$ ở viền đáy dưới, quấn quanh mặt xung quanh khối trụ và lên đến điểm $B$ nằm trên viền đáy trên. Biết hình chiếu vuông góc của $B$ xuống đáy dưới là điểm $B'$ đối xứng với $A$ qua tâm đáy, và trong quá trình di chuyển con kiến đã cắt đường sinh đi qua $A$ đúng $1$ lần. Tìm chiều dài ngắn nhất của đường đi đó.],
  [$10$],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      Kiến quấn cắt đường sinh qua A đúng 1 lần rồi sang vị trí đối diện có nghĩa là kiến quấn đúng $1.5$ vòng.
      Khối trụ khi trải phẳng ra sẽ là một hình chữ nhật có chiều dài bằng chu vi đáy $C = 2 pi R$, chiều rộng bằng chiều cao $h$.
      Việc kiến quấn $1.5$ vòng quanh trụ tương đương với việc nó đi qua $1.5$ hình chữ nhật ghép sát nhau.
    ]

    *Hình 3D Khối Trụ & Sơ đồ Trải phẳng:*
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *

        // 3D Cylinder
        let C_bottom = (-8, 0)
        let C_top = (-8, 8)

        arc((-6, 0), start: 0deg, stop: -180deg, radius: (2, 0.6), stroke: 1.5pt)
        arc((-6, 0), start: 0deg, stop: 180deg, radius: (2, 0.6), stroke: (dash: "dashed", paint: rgb("555")))

        arc((-6, 8), start: 0deg, stop: -180deg, radius: (2, 0.6), stroke: 1.5pt)
        arc((-6, 8), start: 0deg, stop: 180deg, radius: (2, 0.6), stroke: 1.5pt)

        line((-10, 0), (-10, 8), stroke: 1.5pt)
        line((-6, 0), (-6, 8), stroke: 1.5pt)

        let A = (-10, 0)
        let B = (-6, 8)
        circle(A, radius: 0.1, fill: rgb("1976D2"))
        content((-10.5, 0), [$A$])
        circle(B, radius: 0.1, fill: rgb("388E3C"))
        content((-5.5, 8), [$B$])

        // Helix 1.5 loops generated by sang-math v2.0
        import "../../typst-pkg-sang-math/geometry-3d/curves-3d.typ": draw-helix
        draw-helix(
          center: (-8, 0),
          radius: 2,
          height: 8,
          loops: 1.5,
          color: rgb("E91E63"),
        )

        content((-8, -1.5), box(
          fill: rgb("e3f2fd"),
          stroke: 1pt + rgb("1976D2"),
          inset: 3pt,
          radius: 3pt,
        )[Hình 3D Khối Trụ])

        // 2D Unfolding
        let Start_x = -2
        let W = 4
        let L = 6

        rect((Start_x, 0), (Start_x + W, 8), fill: rgb("E8F5E9"), stroke: 1.5pt)
        rect((Start_x + W, 0), (Start_x + L, 8), fill: rgb("F1F8E9"), stroke: 1.5pt)

        circle((Start_x, 0), radius: 0.1, fill: rgb("1976D2"))
        content((Start_x - 0.4, -0.3), [$A$])
        circle((Start_x + L, 8), radius: 0.1, fill: rgb("388E3C"))
        content((Start_x + L + 0.5, 8.3), [$B'$])

        line((Start_x, 0), (Start_x + L, 8), stroke: 2pt + rgb("E91E63"))
        content((Start_x + 1.5, 4.5), box(
          fill: rgb("fce4ec"),
          stroke: 1pt + rgb("E91E63"),
          inset: 2pt,
          radius: 2pt,
        )[#text(size: 9pt)[$d = 10$]])

        content((Start_x + W / 2, 0.4), box(fill: white, inset: 1pt)[Vòng 1 ($C=4$)])
        content((Start_x + W + 1, 0.4), box(fill: white, inset: 1pt)[0.5 Vòng ($2$)])
        content((Start_x - 1, 4), box(fill: white, inset: 1pt)[$h=8$])
      })
    ]

    #step([Tìm kích thước hình phẳng])
    Chu vi đáy hình trụ là $C = 2 pi R = 2 pi dot (2 / pi) = 4$.
    Kiến quấn cắt đường sinh qua $A$ đúng $1$ lần rồi đến điểm đối diện $B$, tức là quấn tổng cộng $1.5$ vòng.
    Trên sơ đồ trải phẳng, tấm trải có chiều dài $L = 1.5 dot C = 1.5 dot 4 = 6$.
    Chiều cao hình trụ là $h = 8$.

    #step([Tính quãng đường Min])
    Quãng đường từ điểm đầu $A$ đến điểm cuối $B'$ là đường chéo của hình chữ nhật tổng kích thước $6 times 8$:
    $ d_"min" = sqrt(L^2 + h^2) = sqrt(6^2 + 8^2) = sqrt(36 + 64) = sqrt(100) = 10. $
  ],
)

// ==========================================
// BÀI PH-VDC-08: HÌNH HỘP CHỮ NHẬT
// ==========================================
#tln(
  id: "PH-VDC-08",
  [
    Cho hình hộp chữ nhật $A B C D.A' B' C' D'$ có các kích thước $A B = 3, A D = 4, A A' = 5$. Một con kiến xuất phát từ đỉnh $A$ và muốn bò trên các mặt của hình hộp chữ nhật để đến đỉnh $C'$ đối diện.
    Hỏi quãng đường ngắn nhất con kiến có thể bò là bao nhiêu?
  ],
  [$sqrt(74)$],
  loigiai: [
    #box(width: 100%, stroke: 0.5pt + luma(200), fill: rgb("F8FAFC"), inset: 10pt, radius: 4pt)[
      #align(center)[
        #cetz.canvas(length: 0.8cm, {
          import cetz.draw: *

          // 3D Cuboid
          let A = (0, 0)
          let B = (6, 0)
          let C = (8.5, 2)
          let D = (2.5, 2)
          let A_p = (0, 6)
          let B_p = (6, 6)
          let C_p = (8.5, 8)
          let D_p = (2.5, 8)

          let M1 = (6.000, 2.571)
          let M2 = (1.562, 7.250)
          let M3 = (3.333, 6.000)

          line(A, B, C, stroke: 1.5pt)
          line(A_p, B_p, C_p, D_p, close: true, stroke: 1.5pt)
          line(A, A_p, stroke: 1.5pt)
          line(B, B_p, stroke: 1.5pt)
          line(C, C_p, stroke: 1.5pt)

          line(A, D, C, stroke: (dash: "dashed", paint: rgb("555")))
          line(D, D_p, stroke: (dash: "dashed", paint: rgb("555")))

          // Path 1 (Front - Right) -> Pink
          line(A, M1, C_p, stroke: 1.5pt + rgb("E91E63"))

          // Path 2 (Left - Top) -> Blue
          line(A, M2, stroke: (dash: "dashed", paint: rgb("1976D2"), thickness: 1.5pt))
          line(M2, C_p, stroke: 1.5pt + rgb("1976D2"))

          // Path 3 (Front - Top) -> Green
          line(A, M3, C_p, stroke: 1.5pt + rgb("388E3C"))

          circle(A, radius: 0.1, fill: black)
          content((-0.4, -0.3), [$A$])
          circle(B, radius: 0.1, fill: black)
          content((6.4, -0.3), [$B$])
          circle(C, radius: 0.1, fill: black)
          content((8.9, 1.8), [$C$])
          circle(D, radius: 0.1, fill: black)
          content((2.1, 2.2), [$D$])

          circle(A_p, radius: 0.1, fill: black)
          content((-0.4, 6.2), [$A'$])
          circle(B_p, radius: 0.1, fill: black)
          content((6.4, 6.2), [$B'$])
          circle(C_p, radius: 0.1, fill: black)
          content((8.9, 8.2), [$C'$])
          circle(D_p, radius: 0.1, fill: black)
          content((2.1, 8.2), [$D'$])

          content((3, -0.4), [$3$])
          content((7.5, 0.7), [$4$])
          content((-0.4, 3), [$5$])

          content((4, -1.5), box(
            fill: rgb("e3f2fd"),
            stroke: 1pt + rgb("1976D2"),
            inset: 3pt,
            radius: 3pt,
          )[Khối hộp 3D và 3 đường đi])

          // 2D Unfoldings
          let X_off = 11
          let Y_off = 5
          let scale = 0.5

          // Unfolding 1: Front + Right (3+4) x 5
          let w1 = (3 + 4) * scale
          let h1 = 5 * scale
          rect((X_off, Y_off), (X_off + w1, Y_off + h1), fill: rgb("FCE4EC"), stroke: 1pt)
          line((X_off + 3 * scale, Y_off), (X_off + 3 * scale, Y_off + h1), stroke: (dash: "dashed", paint: rgb("999")))
          line((X_off, Y_off), (X_off + w1, Y_off + h1), stroke: 1.5pt + rgb("E91E63"))
          content((X_off + w1 / 2, Y_off - 0.5), text(size: 9pt)[$(3+4) times 5 arrow d_1 = sqrt(74)$])
          circle((X_off, Y_off), radius: 0.1, fill: black)
          content((X_off - 0.3, Y_off - 0.3), [$A$])
          circle((X_off + w1, Y_off + h1), radius: 0.1, fill: black)
          content((X_off + w1 + 0.3, Y_off + h1 + 0.3), [$C'$])

          // Unfolding 2: Left + Top (4) + (5,3) => wait.
          // Left face is 4x5. Top face is 4x3.
          // If we attach Top face to Left face at A'D':
          // Left face: width 4, height 5. A=(4,0), D=(0,0), A'=(4,5), D'=(0,5).
          // Top face attached at A'D': goes UP by 3. A'=(4,5), B'=(4,8), C'=(0,8), D'=(0,5).
          // Path from A(4,0) to C'(0,8).
          // Width = 4, Height = 5 + 3 = 8.
          // Or we can draw it flat as 4 x 8.
          Y_off = 0
          let w2 = 4 * scale
          let h2 = (5 + 3) * scale
          rect((X_off, Y_off), (X_off + w2, Y_off + h2), fill: rgb("E3F2FD"), stroke: 1pt)
          line((X_off, Y_off + 5 * scale), (X_off + w2, Y_off + 5 * scale), stroke: (dash: "dashed", paint: rgb("999")))
          line((X_off + w2, Y_off), (X_off, Y_off + h2), stroke: 1.5pt + rgb("1976D2")) // from A(w2, 0) to C'(0, h2)
          content((X_off + w2 / 2, Y_off - 0.5), text(size: 9pt)[$4 times (5+3) arrow d_2 = sqrt(80)$])
          circle((X_off + w2, Y_off), radius: 0.1, fill: black)
          content((X_off + w2 + 0.3, Y_off - 0.3), [$A$])
          circle((X_off, Y_off + h2), radius: 0.1, fill: black)
          content((X_off - 0.3, Y_off + h2 + 0.3), [$C'$])

          // Unfolding 3: Front + Top (3) + (5,4)
          // Front face is 3x5. Top face is 3x4.
          // Front: A=(0,0), B=(3,0), A'=(0,5), B'=(3,5).
          // Top attached at A'B': A'=(0,5), D'=(0,9), C'=(3,9), B'=(3,5).
          // Path from A(0,0) to C'(3,9). Width = 3, Height = 5 + 4 = 9.
          X_off = 17
          let w3 = 3 * scale
          let h3 = (5 + 4) * scale
          rect((X_off, Y_off), (X_off + w3, Y_off + h3), fill: rgb("E8F5E9"), stroke: 1pt)
          line((X_off, Y_off + 5 * scale), (X_off + w3, Y_off + 5 * scale), stroke: (dash: "dashed", paint: rgb("999")))
          line((X_off, Y_off), (X_off + w3, Y_off + h3), stroke: 1.5pt + rgb("388E3C"))
          content((X_off + w3 / 2, Y_off - 0.5), text(size: 9pt)[$3 times (5+4) arrow d_3 = sqrt(90)$])
          circle((X_off, Y_off), radius: 0.1, fill: black)
          content((X_off - 0.3, Y_off - 0.3), [$A$])
          circle((X_off + w3, Y_off + h3), radius: 0.1, fill: black)
          content((X_off + w3 + 0.3, Y_off + h3 + 0.3), [$C'$])
        })
      ]
    ]

    #step([Lý thuyết phẳng hóa Hình hộp chữ nhật])
    Để đi từ đỉnh $A$ đến đỉnh $C'$ đối diện của hình hộp chữ nhật, con kiến phải đi qua ít nhất 2 mặt. Ta có 3 kịch bản trải phẳng tương ứng với việc băng qua 3 cạnh trung gian:

    #step([Tính toán quãng đường trên từng sơ đồ trải phẳng])
    - **Trường hợp 1 (Đường màu hồng):** Đi qua cạnh $B C$ (hoặc mặt bên). Hình chữ nhật trải phẳng gồm mặt trước và mặt bên phải ghép lại, kích thước là $(A B + B C) times A A' = (3 + 4) times 5 = 7 times 5$.
      Quãng đường: $d_1 = sqrt(7^2 + 5^2) = sqrt(49 + 25) = sqrt(74) approx 8.602$.

    - **Trường hợp 2 (Đường màu xanh biển):** Đi qua cạnh $A' D'$ (hoặc mặt trái). Hình chữ nhật trải phẳng gồm mặt trái và mặt trên ghép lại, kích thước là $A D times (A A' + A' B') = 4 times (5 + 3) = 4 times 8$.
      Quãng đường: $d_2 = sqrt(4^2 + 8^2) = sqrt(16 + 64) = sqrt(80) approx 8.944$.

    - **Trường hợp 3 (Đường màu xanh lá):** Đi qua cạnh $A' B'$ (hoặc mặt trước). Hình chữ nhật trải phẳng gồm mặt trước và mặt trên ghép lại, kích thước là $A B times (A A' + A' D') = 3 times (5 + 4) = 3 times 9$.
      Quãng đường: $d_3 = sqrt(3^2 + 9^2) = sqrt(9 + 81) = sqrt(90) approx 9.487$.

    #step([Kết luận])
    So sánh 3 trường hợp, ta thấy quãng đường ngắn nhất là $d_"min" = sqrt(74)$.
  ],
)

// ==========================================
// BÀI PH-VDC-09: LĂNG TRỤ TAM GIÁC ĐỀU
// ==========================================
#tln(
  id: "PH-VDC-09",
  [
    Cho lăng trụ tam giác đều $A B C.A' B' C'$ có cạnh đáy $a = 2$, chiều cao $h = 4$. Một con kiến xuất phát từ đỉnh $A$ bò dọc theo các mặt bên, quấn đúng một vòng quanh lăng trụ và dừng lại ở đỉnh $A'$ trên nắp. Hỏi quãng đường ngắn nhất con kiến bò là bao nhiêu?
  ],
  [$2sqrt(13)$],
  loigiai: [
    #box(width: 100%, stroke: 0.5pt + luma(200), fill: rgb("F8FAFC"), inset: 10pt, radius: 4pt)[
      #align(center)[
        #cetz.canvas(length: 0.8cm, {
          import cetz.draw: *

          // 3D Prism
          let A = (0, 0)
          let B = (4, -1.5)
          let C = (7, 1)
          let h = 6

          let A_p = (A.at(0), A.at(1) + h)
          let B_p = (B.at(0), B.at(1) + h)
          let C_p = (C.at(0), C.at(1) + h)

          // Intersection points
          let M1 = (B.at(0), B.at(1) + h / 3)
          let M2 = (C.at(0), C.at(1) + 2 * h / 3)

          line(A, B, C, stroke: 1.5pt)
          line(A, C, stroke: (dash: "dashed", paint: rgb("555")))

          line(A_p, B_p, C_p, close: true, stroke: 1.5pt)

          line(A, A_p, stroke: 1.5pt)
          line(B, B_p, stroke: 1.5pt)
          line(C, C_p, stroke: 1.5pt)

          // Path
          line(A, M1, M2, stroke: 1.5pt + rgb("E91E63"))
          line(M2, A_p, stroke: (dash: "dashed", paint: rgb("E91E63"), thickness: 1.5pt))

          circle(A, radius: 0.1, fill: black)
          content((A.at(0) - 0.3, A.at(1)), [$A$])
          circle(B, radius: 0.1, fill: black)
          content((B.at(0) + 0.1, B.at(1) - 0.4), [$B$])
          circle(C, radius: 0.1, fill: black)
          content((C.at(0) + 0.4, C.at(1)), [$C$])

          circle(A_p, radius: 0.1, fill: black)
          content((A_p.at(0) - 0.3, A_p.at(1)), [$A'$])

          // 2D Unfolding
          let X_off = 11
          let Y_off = 0
          let scale = 1.5
          let w = 2 * scale
          let h2 = 4 * scale

          rect((X_off, Y_off), (X_off + 3 * w, Y_off + h2), fill: rgb("FCE4EC"), stroke: 1.5pt)
          line((X_off + w, Y_off), (X_off + w, Y_off + h2), stroke: (dash: "dashed", paint: rgb("999")))
          line((X_off + 2 * w, Y_off), (X_off + 2 * w, Y_off + h2), stroke: (dash: "dashed", paint: rgb("999")))

          line((X_off, Y_off), (X_off + 3 * w, Y_off + h2), stroke: 1.5pt + rgb("E91E63"))

          content((X_off + 1.5 * w, Y_off - 0.5), box(fill: white, inset: 1pt)[$3a = 6$])
          content((X_off - 0.6, Y_off + h2 / 2), box(fill: white, inset: 1pt)[$h = 4$])

          circle((X_off, Y_off), radius: 0.1, fill: black)
          content((X_off - 0.3, Y_off - 0.3), [$A$])
          circle((X_off + 3 * w, Y_off + h2), radius: 0.1, fill: black)
          content((X_off + 3 * w + 0.3, Y_off + h2 + 0.3), [$A'$])
        })
      ]
    ]

    #step([Tìm kích thước hình phẳng])
    Trải phẳng 3 mặt bên của lăng trụ tam giác đều, ta được một hình chữ nhật có kích thước chiều ngang là chu vi đáy $C = 3a = 3 times 2 = 6$, và chiều cao là $h = 4$.

    #step([Tính quãng đường Min])
    Đường đi ngắn nhất quấn 1 vòng chính là đường chéo của hình chữ nhật trải phẳng này:
    $ d_"min" = sqrt(C^2 + h^2) = sqrt(6^2 + 4^2) = sqrt(36 + 16) = sqrt(52) = 2sqrt(13). $
  ],
)


// ==========================================
// BÀI PH-VDC-10: LĂNG TRỤ LỤC GIÁC ĐỀU
// ==========================================
#tln(
  id: "PH-VDC-10",
  [
    Cho lăng trụ lục giác đều $A B C D E F.A' B' C' D' E' F'$ có cạnh đáy $a = 1$, chiều cao $h = 5$. Một con kiến xuất phát từ đỉnh $A$ bò dọc theo các mặt bên, quấn đúng *2 vòng* quanh lăng trụ và dừng lại ở đỉnh $A'$ trên nắp. Hỏi quãng đường ngắn nhất con kiến bò là bao nhiêu?
  ],
  [$13$],
  loigiai: [
    #box(width: 100%, stroke: 0.5pt + luma(200), fill: rgb("F8FAFC"), inset: 10pt, radius: 4pt)[
      #align(center)[
        #cetz.canvas(length: 0.8cm, {
          import cetz.draw: *

          // 3D Hexagonal Prism
          let h = 6
          let R = 3
          // Base points
          let P = range(6).map(i => {
            let angle = -15deg - i * 60deg
            (R * calc.cos(angle), R * calc.sin(angle) * 0.4)
          })

          // Top points
          let P_p = range(6).map(i => (P.at(i).at(0), P.at(i).at(1) + h))

          // Draw dashed base (back)
          line(P.at(3), P.at(4), P.at(5), P.at(0), stroke: (dash: "dashed", paint: rgb("555")))
          // Draw solid base (front)
          line(P.at(0), P.at(1), P.at(2), P.at(3), stroke: 1.5pt)

          // Draw top base
          line(..P_p, close: true, stroke: 1.5pt)

          // Draw vertical edges
          for i in range(6) {
            if i in (4, 5) {
              line(P.at(i), P_p.at(i), stroke: (dash: "dashed", paint: rgb("555")))
            } else {
              line(P.at(i), P_p.at(i), stroke: 1.5pt)
            }
          }

          // Path 2 loops
          let path_pts = range(13).map(step => {
            let h_curr = step * h / 12
            let idx = calc.rem(step, 6)
            (P.at(idx).at(0), P.at(idx).at(1) + h_curr)
          })

          // Draw segments
          for i in range(12) {
            let is_front = (calc.rem(i, 6) in (0, 1, 2))
            if is_front {
              line(path_pts.at(i), path_pts.at(i + 1), stroke: 1.5pt + rgb("E91E63"))
            } else {
              line(path_pts.at(i), path_pts.at(i + 1), stroke: (dash: "dashed", paint: rgb("E91E63"), thickness: 1.5pt))
            }
          }

          circle(P.at(0), radius: 0.1, fill: black)
          content((P.at(0).at(0) + 0.3, P.at(0).at(1) - 0.3), [$A$])
          circle(P_p.at(0), radius: 0.1, fill: black)
          content((P_p.at(0).at(0) + 0.3, P_p.at(0).at(1) + 0.3), [$A'$])

          // 2D Unfolding
          let X_off = 5
          let Y_off = -1
          let scale = 0.8
          let w = 1 * scale
          let h2 = 5 * scale

          rect((X_off, Y_off), (X_off + 12 * w, Y_off + h2), fill: rgb("E8F5E9"), stroke: 1.5pt)
          for i in range(1, 12) {
            line((X_off + i * w, Y_off), (X_off + i * w, Y_off + h2), stroke: (dash: "dashed", paint: rgb("999")))
          }

          line((X_off, Y_off), (X_off + 12 * w, Y_off + h2), stroke: 1.5pt + rgb("E91E63"))

          content((X_off + 6 * w, Y_off - 0.5), box(fill: white, inset: 1pt)[$12a = 12$])
          content((X_off - 0.6, Y_off + h2 / 2), box(fill: white, inset: 1pt)[$h = 5$])

          circle((X_off, Y_off), radius: 0.1, fill: black)
          content((X_off - 0.3, Y_off - 0.3), [$A$])
          circle((X_off + 12 * w, Y_off + h2), radius: 0.1, fill: black)
          content((X_off + 12 * w + 0.3, Y_off + h2 + 0.3), [$A'$])
        })
      ]
    ]

    #step([Tìm kích thước hình phẳng])
    Trải phẳng các mặt bên của lăng trụ lục giác đều thành một dải hình chữ nhật. Do con kiến quấn *2 vòng*, nó đi qua tổng cộng $2 times 6 = 12$ mặt bên.
    Hình chữ nhật trải phẳng tương ứng sẽ có chiều ngang là $L = 12a = 12 times 1 = 12$, và chiều cao là $h = 5$.

    #step([Tính quãng đường Min])
    Đường đi ngắn nhất quấn 2 vòng chính là đường chéo của hình chữ nhật khổng lồ này. Ta có bộ số Pytago siêu đẹp:
    $ d_"min" = sqrt(L^2 + h^2) = sqrt(12^2 + 5^2) = sqrt(144 + 25) = sqrt(169) = 13. $
  ],
)



// ==========================================
// BÀI PH-VDC-11: LĂNG TRỤ TỨ GIÁC ĐỀU
// ==========================================
#tln(
  id: "PH-VDC-11",
  [
    Cho lăng trụ tứ giác đều $A B C D.A' B' C' D'$ (hình hộp chữ nhật đáy vuông) có cạnh đáy $a = 0.75$, chiều cao $h = 8$. Một con kiến xuất phát từ đỉnh $A$ bò dọc theo các mặt bên, quấn đúng *2 vòng* quanh lăng trụ và dừng lại ở đỉnh $A'$ trên nắp. Hỏi quãng đường ngắn nhất con kiến bò là bao nhiêu?
  ],
  [$10$],
  loigiai: [
    #box(width: 100%, stroke: 0.5pt + luma(200), fill: rgb("F8FAFC"), inset: 10pt, radius: 4pt)[
      #align(center)[
        #cetz.canvas(length: 0.8cm, {
          import cetz.draw: *

          let h = 8
          let R = 3
          let P = range(4).map(i => {
            let angle = -20deg - i * 90deg
            (R * calc.cos(angle), R * calc.sin(angle) * 0.4)
          })

          let P_p = range(4).map(i => (P.at(i).at(0), P.at(i).at(1) + h))

          // Back base edges
          line(P.at(2), P.at(3), P.at(0), stroke: (dash: "dashed", paint: rgb("555")))
          // Front base edges
          line(P.at(0), P.at(1), P.at(2), stroke: 0.75pt)

          // Top base
          line(..P_p, close: true, stroke: 0.75pt)

          // Vertical edges
          for i in range(4) {
            if i == 3 {
              line(P.at(i), P_p.at(i), stroke: (dash: "dashed", paint: rgb("555")))
            } else {
              line(P.at(i), P_p.at(i), stroke: 0.75pt)
            }
          }

          let path_pts = range(9).map(step => {
            let h_curr = step * h / 8
            let idx = calc.rem(step, 4)
            (P.at(idx).at(0), P.at(idx).at(1) + h_curr)
          })

          for i in range(8) {
            let is_front = (calc.rem(i, 4) in (0, 1))
            if is_front {
              line(path_pts.at(i), path_pts.at(i + 1), stroke: 0.75pt + rgb("1976D2"))
            } else {
              line(path_pts.at(i), path_pts.at(i + 1), stroke: (
                dash: "dashed",
                paint: rgb("1976D2"),
                thickness: 0.75pt,
              ))
            }
          }

          circle(P.at(0), radius: 0.1, fill: black)
          content((P.at(0).at(0) + 0.3, P.at(0).at(1) - 0.3), [$A$])
          circle(P_p.at(0), radius: 0.1, fill: black)
          content((P_p.at(0).at(0) + 0.3, P_p.at(0).at(1) + 0.3), [$A'$])

          let X_off = 5
          let Y_off = 1
          let scale = 0.8
          let w = 0.75 * scale
          let h2 = 8 * scale

          rect((X_off, Y_off), (X_off + 8 * w, Y_off + h2), fill: rgb("E3F2FD"), stroke: 0.75pt)
          for i in range(1, 8) {
            line((X_off + i * w, Y_off), (X_off + i * w, Y_off + h2), stroke: (dash: "dashed", paint: rgb("999")))
          }

          line((X_off, Y_off), (X_off + 8 * w, Y_off + h2), stroke: 0.75pt + rgb("1976D2"))

          content((X_off + 4 * w, Y_off - 0.5), box(fill: white, inset: 1pt)[$8a = 12$])
          content((X_off - 0.6, Y_off + h2 / 2), box(fill: white, inset: 1pt)[$h = 8$]) // actually height is 8, base is 12, wait! Wait, 2 vòng = 8 mặt, 8 * 0.75 = 12? Ah, actually 12^2 + 8^2 is NOT 10^2! Wait!
          // 8 * 0.75 = 12. sqrt(12^2 + 8^2) = sqrt(144 + 64) = sqrt(208).
          // Wait! To get exactly 10, we need 6^2 + 8^2 = 10^2.
          // So width should be 6!
          // 2 vòng -> 8 mặt -> 8a = 6 => a = 6/8 = 0.75.
          // So I should set a = 0.75 in the text!
        })
      ]
    ]

    #step([Tìm kích thước hình phẳng])
    Trải phẳng các mặt bên của lăng trụ tứ giác đều thành một dải hình chữ nhật. Quấn *2 vòng* tức là đi qua tổng cộng $2 times 4 = 8$ mặt bên.
    Hình chữ nhật trải phẳng sẽ có chiều ngang $L = 8a = 8 times 0.75 = 6$, chiều cao $h = 8$.

    #step([Tính quãng đường Min])
    Đường đi ngắn nhất:
    $ d_"min" = sqrt(L^2 + h^2) = sqrt(6^2 + 8^2) = sqrt(36 + 64) = 10. $
  ],
)

// ==========================================
// BÀI PH-VDC-12: LĂNG TRỤ NGŨ GIÁC ĐỀU
// ==========================================
#tln(
  id: "PH-VDC-12",
  [
    Cho lăng trụ ngũ giác đều $A B C D E.A' B' C' D' E'$ có cạnh đáy $a = 1$, chiều cao $h = 24$. Một con kiến xuất phát từ đỉnh $A$ bò dọc theo các mặt bên, quấn đúng *2 vòng* quanh lăng trụ và dừng lại ở đỉnh $A'$ trên nắp. Hỏi quãng đường ngắn nhất con kiến bò là bao nhiêu?
  ],
  [$26$],
  loigiai: [
    #box(width: 100%, stroke: 0.5pt + luma(200), fill: rgb("F8FAFC"), inset: 10pt, radius: 4pt)[
      #align(center)[
        #cetz.canvas(length: 0.6cm, {
          import cetz.draw: *

          let h = 12
          let R = 3
          let P = range(5).map(i => {
            let angle = -90deg - i * 72deg
            (R * calc.cos(angle), R * calc.sin(angle) * 0.4)
          })

          let P_p = range(5).map(i => (P.at(i).at(0), P.at(i).at(1) + h))

          // Dashed base (back)
          line(P.at(1), P.at(2), P.at(3), P.at(4), stroke: (dash: "dashed", paint: rgb("555")))
          // Solid base (front)
          line(P.at(4), P.at(0), P.at(1), stroke: 0.75pt)

          // Top base
          line(..P_p, close: true, stroke: 0.75pt)

          // Vertical edges
          for i in range(5) {
            if i in (2, 3) {
              line(P.at(i), P_p.at(i), stroke: (dash: "dashed", paint: rgb("555")))
            } else {
              line(P.at(i), P_p.at(i), stroke: 0.75pt)
            }
          }

          let path_pts = range(11).map(step => {
            let h_curr = step * h / 10
            let idx = calc.rem(step, 5)
            (P.at(idx).at(0), P.at(idx).at(1) + h_curr)
          })

          for i in range(10) {
            let is_front = (calc.rem(i, 5) in (4, 0))
            if is_front {
              line(path_pts.at(i), path_pts.at(i + 1), stroke: 0.75pt + rgb("FF9800"))
            } else {
              line(path_pts.at(i), path_pts.at(i + 1), stroke: (
                dash: "dashed",
                paint: rgb("FF9800"),
                thickness: 0.75pt,
              ))
            }
          }

          circle(P.at(0), radius: 0.1, fill: black)
          content((P.at(0).at(0) + 0.3, P.at(0).at(1) - 0.3), [$A$])
          circle(P_p.at(0), radius: 0.1, fill: black)
          content((P_p.at(0).at(0) + 0.3, P_p.at(0).at(1) + 0.3), [$A'$])

          let X_off = 5
          let Y_off = -1
          let scale = 0.5
          let w = 1 * scale
          let h2 = 24 * scale

          rect((X_off, Y_off), (X_off + 10 * w, Y_off + h2), fill: rgb("FFF3E0"), stroke: 0.75pt)
          for i in range(1, 10) {
            line((X_off + i * w, Y_off), (X_off + i * w, Y_off + h2), stroke: (dash: "dashed", paint: rgb("999")))
          }

          line((X_off, Y_off), (X_off + 10 * w, Y_off + h2), stroke: 0.75pt + rgb("FF9800"))

          content((X_off + 5 * w, Y_off - 0.5), box(fill: white, inset: 1pt)[$10a = 10$])
          content((X_off - 0.8, Y_off + h2 / 2), box(fill: white, inset: 1pt)[$h = 24$])

          circle((X_off, Y_off), radius: 0.1, fill: black)
          content((X_off - 0.3, Y_off - 0.3), [$A$])
          circle((X_off + 10 * w, Y_off + h2), radius: 0.1, fill: black)
          content((X_off + 10 * w + 0.3, Y_off + h2 + 0.3), [$A'$])
        })
      ]
    ]

    #step([Tìm kích thước hình phẳng])
    Trải phẳng các mặt bên của lăng trụ ngũ giác đều thành một dải hình chữ nhật. Quấn *2 vòng* tức là đi qua tổng cộng $2 times 5 = 10$ mặt bên.
    Hình chữ nhật trải phẳng sẽ có chiều ngang $L = 10a = 10 times 1 = 10$, chiều cao $h = 24$.

    #step([Tính quãng đường Min])
    Đường đi ngắn nhất:
    $ d_"min" = sqrt(L^2 + h^2) = sqrt(10^2 + 24^2) = sqrt(100 + 576) = sqrt(676) = 26. $
  ],
)
