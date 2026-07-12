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
      Chuyên Đề: Kỳ Vọng Ẩn Trong Bài Toán Truy Nguồn Gốc\
      Một Viên Bi Cuối Cùng Sau Nhiều Giai Đoạn
    ]
    #v(0.3em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Bảo toàn tỉ lệ · Trọng số nguồn · Bayes rút gọn · Mẹo giải nhanh theo GDPT 2018
    ]
  ]
]

= I. Ý Tưởng Trọng Tâm

#lythuyet[
  *Lưu ý chương trình:* "Kỳ vọng" không phải kiến thức xác suất chính thức trong GDPT 2018. Vì vậy trong chuyên đề này ta không trình bày theo ngôn ngữ kỳ vọng, mà dùng cách gọi gần gũi hơn: *trọng số trung bình*, *bảo toàn tỉ lệ*, *mỗi viên bi cuối cùng đại diện cho một dòng chảy xác suất*.

  *Mẹo 1. Bảo toàn tỉ lệ khi lấy mẫu ngẫu nhiên.*
  Nếu một hộp có $a$ bi đỏ, $b$ bi xanh. Lấy ngẫu nhiên $k$ viên đưa sang hộp khác. Sau đó chỉ nhìn một viên bất kỳ trong nhóm $k$ viên vừa chuyển, xác suất viên đó đỏ vẫn là:
  $ a / (a + b) $
  Không cần xét lấy được $0,1,2,...$ viên đỏ. Đây chính là phần "kỳ vọng" được giấu dưới dạng mẹo.

  *Mẹo 2. Nguồn của viên bi cuối chỉ phụ thuộc vào số viên đóng góp.*
  Nếu hộp cuối nhận $m_1$ viên từ nguồn $H_1$, $m_2$ viên từ nguồn $H_2$, ..., tổng cộng $M=m_1+m_2+...+m_n$ viên, rồi rút ngẫu nhiên $1$ viên, thì:
  $ P("gốc H_i") = m_i / M $

  *Mẹo 3. Khi đã biết màu, truy nguồn bằng Bayes dạng tỉ số trọng số.*
  Nếu nguồn $H_i$ có tỉ lệ bi đỏ là $r_i$, thì "độ nặng" của nhánh $H_i$ khi biết viên cuối đỏ là:
  $ w_i = ("số viên H_i đóng góp") dot r_i $
  Khi đó:
  $ P("gốc H_k" | "bi đỏ") = w_k / (w_1 + w_2 + ... + w_n) $

  *Mẹo 4. Nhiều giai đoạn thì nhân các tỉ lệ đường đi.*
  Nếu viên cuối đi theo đường $H_1 -> A -> B -> T$, ta nhân các tỉ lệ đóng góp trên đường đó. Ví dụ: $H_1$ chiếm $2/5$ trong $A$, $A$ chiếm $3/8$ trong $B$, $B$ chiếm $4/10$ trong $T$, thì xác suất nguồn $H_1$ của viên cuối là:
  $ 2/5 dot 3/8 dot 4/10 $
]

#ppgiai[
  *Công thức bấm nhanh:* Với mỗi nguồn ban đầu, hãy ghi hai dòng:
  - *Trọng số nguồn:* viên cuối có xác suất bao nhiêu đến từ nguồn đó?
  - *Tỉ lệ màu trong nguồn:* nếu đến từ nguồn đó thì xác suất có màu đang xét là bao nhiêu?

  Sau đó lấy:
  $ "nhánh cần tìm" / "tổng các nhánh tạo ra màu đã biết" $
]

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *

    rect((-5.6, 3.0), (-3.1, 4.5), radius: 0.15, stroke: 1.2pt + rgb("1A5276"), fill: rgb("EBF5FB"))
    content((-4.35, 3.75), text(weight: "bold", fill: rgb("1A5276"))[Nguồn $H_1$])
    rect((-1.25, 3.0), (1.25, 4.5), radius: 0.15, stroke: 1.2pt + rgb("900C3F"), fill: rgb("FADBD8"))
    content((0, 3.75), text(weight: "bold", fill: rgb("900C3F"))[Nguồn $H_2$])
    rect((3.1, 3.0), (5.6, 4.5), radius: 0.15, stroke: 1.2pt + rgb("117A65"), fill: rgb("E8F8F5"))
    content((4.35, 3.75), text(weight: "bold", fill: rgb("117A65"))[Nguồn $H_3$])

    rect((-1.5, 0), (1.5, 1.4), radius: 0.15, stroke: 1.5pt + rgb("555555"), fill: rgb("F8F9F9"))
    content((0, 0.7), text(weight: "bold")[Hộp cuối $T$])

    line((-4.35, 3.0), (-0.9, 1.4), mark: (end: ">"))
    content((-2.8, 2.2), box(fill: white, inset: 2pt)[$m_1$ viên])
    line((0, 3.0), (0, 1.4), mark: (end: ">"))
    content((0.75, 2.2), box(fill: white, inset: 2pt)[$m_2$ viên])
    line((4.35, 3.0), (0.9, 1.4), mark: (end: ">"))
    content((2.8, 2.2), box(fill: white, inset: 2pt)[$m_3$ viên])

    line((0, 0), (0, -1.0), mark: (end: ">"), stroke: 1.5pt + red)
    circle((0, -1.55), radius: 0.45, fill: rgb("ffebee"), stroke: 1.5pt + red)
    content((0, -1.55), text(fill: red, weight: "bold")[Đỏ])
  })
]

= II. Bài Mẫu Theo Tầng

#tln(
  id: "KV-BI-01",
  [Ba hộp bi $A,B,C$ chứa các viên bi cùng kích thước và khối lượng. Hộp $A$ có $6$ bi đỏ, $4$ bi xanh; hộp $B$ có $3$ bi đỏ, $7$ bi xanh; hộp $C$ có $5$ bi đỏ, $5$ bi xanh. Lấy ngẫu nhiên $4$ viên từ $A$, $3$ viên từ $B$, $5$ viên từ $C$ bỏ vào hộp $T$. Từ $T$ rút ngẫu nhiên $1$ viên thì được bi đỏ. Tính xác suất viên bi đỏ này có nguồn gốc từ hộp $A$.],
  [$12/29$],
  loigiai: [
    #ppgiai[
      Đây là bài một tầng. Ta không cần xét trong $4$ viên từ $A$ có bao nhiêu viên đỏ. Chỉ cần nhớ: một viên đại diện cho phần lấy từ $A$ có xác suất đỏ bằng đúng tỉ lệ đỏ ban đầu của $A$.
    ]

    *Trực quan hóa bằng Sơ đồ cây:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let rootBox = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Rút 1 bi từ Hộp T (12 bi)*]
        content((0, 4), rootBox, name: "root")

        let bA = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc Hộp A*]
        content((-4, 2), bA, name: "hA")
        let bB = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc Hộp B*]
        content((0, 2), bB, name: "hB")
        let bC = box(fill: rgb("f3e5f5"), stroke: 1.5pt + rgb("9c27b0"), inset: 8pt, radius: 5pt)[*Gốc Hộp C*]
        content((4, 2), bC, name: "hC")

        circle((-5, 0), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c1")
        content("c1", [*Đỏ*], name: "hAd")
        circle((-3, 0), radius: 0.6, fill: rgb("e3f2fd"), stroke: 1.5pt + rgb("1976d2"), name: "c2")
        content("c2", [*Xanh*], name: "hAx")

        circle((-1, 0), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c3")
        content("c3", [*Đỏ*], name: "hBd")
        circle((1, 0), radius: 0.6, fill: rgb("e3f2fd"), stroke: 1.5pt + rgb("1976d2"), name: "c4")
        content("c4", [*Xanh*], name: "hBx")

        circle((3, 0), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c5")
        content("c5", [*Đỏ*], name: "hCd")
        circle((5, 0), radius: 0.6, fill: rgb("e3f2fd"), stroke: 1.5pt + rgb("1976d2"), name: "c6")
        content("c6", [*Xanh*], name: "hCx")

        line("root", "hA", mark: (end: ">"))
        content((-2, 3.3), box(fill: white, inset: 1pt)[$4 / 12$])
        line("root", "hB", mark: (end: ">"))
        content((0.4, 3.3), box(fill: white, inset: 1pt)[$3 / 12$])
        line("root", "hC", mark: (end: ">"))
        content((2, 3.3), box(fill: white, inset: 1pt)[$5 / 12$])

        line("hA", "c1", mark: (end: ">"))
        content((-4.8, 1.2), box(fill: white, inset: 1pt)[$6 / 10$])
        line("hA", "c2", mark: (end: ">"))
        content((-3.2, 1.2), box(fill: white, inset: 1pt)[$4 / 10$])

        line("hB", "c3", mark: (end: ">"))
        content((-0.8, 1.2), box(fill: white, inset: 1pt)[$3 / 10$])
        line("hB", "c4", mark: (end: ">"))
        content((0.8, 1.2), box(fill: white, inset: 1pt)[$7 / 10$])

        line("hC", "c5", mark: (end: ">"))
        content((3.2, 1.2), box(fill: white, inset: 1pt)[$5 / 10$])
        line("hC", "c6", mark: (end: ">"))
        content((4.8, 1.2), box(fill: white, inset: 1pt)[$5 / 10$])
      })
    ]

    #step([Ghi trọng số đỏ của từng nguồn (nhân xác suất trên nhánh)])
    
    - Nguồn $A$: $4/12 dot 6/10 = 1/5$. 

    - Nguồn $B$: $3/12 dot 3/10 = 3/40$.

    - Nguồn $C$: $5/12 dot 5/10 = 5/24$.

    #step([Truy nguồn khi biết viên cuối đỏ])
    Xác suất hậu nghiệm Bayes được tính bằng tỉ số giữa nhánh $A$ và tổng các nhánh Đỏ:
    $ P(A|"Đỏ") = (1/5) / (1/5 + 3/40 + 5/24) = (1/5)/(58/120) = 24/58 = 12/29. $
  ],
)

#tln(
  id: "KV-BI-02",
  [Hộp $H_1$ có $8$ bi đỏ và $2$ bi xanh; hộp $H_2$ có $2$ bi đỏ và $6$ bi xanh. Lấy ngẫu nhiên $3$ viên từ $H_1$ và $5$ viên từ $H_2$ bỏ vào hộp $M$. Sau đó lấy ngẫu nhiên $4$ viên từ $M$ và $6$ viên từ hộp $H_3$ bỏ vào hộp $N$, biết $H_3$ có $5$ bi đỏ và $5$ bi xanh. Từ $N$ rút ngẫu nhiên $1$ viên thì được bi đỏ. Tính xác suất viên bi đỏ này có nguồn gốc ban đầu từ $H_2$.],
  [$25/193$],
  loigiai: [
    #ppgiai[
      Hộp $M$ chỉ là trạm trung gian. Viên đi từ $M$ sang $N$ vẫn giữ "hồ sơ nguồn" theo tỉ lệ đóng góp ban đầu vào $M$: $H_1$ chiếm $3/8$, $H_2$ chiếm $5/8$.
    ]

    *Trực quan hóa bằng Sơ đồ cây:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let rootBox = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Rút 1 bi từ Hộp N (10 bi)*]
        content((0, 4.5), rootBox, name: "root")

        let bM = box(fill: rgb("e8eaf6"), stroke: 1.5pt + rgb("3f51b5"), inset: 8pt, radius: 5pt)[*Gốc Hộp M*]
        content((-3, 2.5), bM, name: "hM")
        let bH3 = box(fill: rgb("f3e5f5"), stroke: 1.5pt + rgb("9c27b0"), inset: 8pt, radius: 5pt)[*Gốc Hộp H3*]
        content((3, 2.5), bH3, name: "hH3")

        let bH1 = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc H1*]
        content((-5, 0.5), bH1, name: "hH1")
        let bH2 = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc H2*]
        content((-1, 0.5), bH2, name: "hH2")

        circle((-6, -1.5), radius: 0.5, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c1")
        content("c1", [*Đỏ*])
        circle((-4, -1.5), radius: 0.5, fill: rgb("e3f2fd"), stroke: 1.5pt + rgb("1976d2"), name: "c2")
        content("c2", [*Xanh*])

        circle((-2, -1.5), radius: 0.5, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c3")
        content("c3", [*Đỏ*])
        circle((0, -1.5), radius: 0.5, fill: rgb("e3f2fd"), stroke: 1.5pt + rgb("1976d2"), name: "c4")
        content("c4", [*Xanh*])

        circle((2, -1.5), radius: 0.5, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c5")
        content("c5", [*Đỏ*])
        circle((4, -1.5), radius: 0.5, fill: rgb("e3f2fd"), stroke: 1.5pt + rgb("1976d2"), name: "c6")
        content("c6", [*Xanh*])

        line("root", "hM", mark: (end: ">"))
        content((-1.2, 3.8), box(fill: white, inset: 1pt)[$4 / 10$])
        line("root", "hH3", mark: (end: ">"))
        content((1.8, 3.8), box(fill: white, inset: 1pt)[$6 / 10$])

        line("hM", "hH1", mark: (end: ">"))
        content((-4.3, 1.7), box(fill: white, inset: 1pt)[$3 / 8$])
        line("hM", "hH2", mark: (end: ">"))
        content((-1.7, 1.7), box(fill: white, inset: 1pt)[$5 / 8$])

        line("hH1", "c1", mark: (end: ">"))
        content((-5.8, -0.2), box(fill: white, inset: 1pt)[$8 / 10$])
        line("hH1", "c2", mark: (end: ">"))
        content((-4.2, -0.2), box(fill: white, inset: 1pt)[$2 / 10$])

        line("hH2", "c3", mark: (end: ">"))
        content((-1.8, -0.2), box(fill: white, inset: 1pt)[$2 / 8$])
        line("hH2", "c4", mark: (end: ">"))
        content((-0.2, -0.2), box(fill: white, inset: 1pt)[$6 / 8$])

        line("hH3", "c5", mark: (end: ">"))
        content((2.2, 0.7), box(fill: white, inset: 1pt)[$5 / 10$])
        line("hH3", "c6", mark: (end: ">"))
        content((3.8, 0.7), box(fill: white, inset: 1pt)[$5 / 10$])
      })
    ]

    #step([Tính xác suất nguồn của một viên trong N])
    - Từ $M$ sang $N$ chiếm $4/10$. Trong $M$, phần từ $H_1$ chiếm $3/8$, phần từ $H_2$ chiếm $5/8$.
    - Do đó:
    $ P("gốc H_1") = 4/10 dot 3/8 = 3/20 $
    $ P("gốc H_2") = 4/10 dot 5/8 = 1/4 $
    $ P("gốc H_3") = 6/10 = 3/5 $

    #step([Gắn màu đỏ vào từng nguồn])
    $ P("gốc H_1 và Đỏ") = 3/20 dot 8/10 = 3/25 $
    $ P("gốc H_2 và Đỏ") = 1/4 dot 2/8 = 1/16 $
    $ P("gốc H_3 và Đỏ") = 3/5 dot 5/10 = 3/10 $

    #step([Áp dụng Bayes rút gọn])
    $ P(H_2|"Đỏ") = (1/16) / (3/25 + 1/16 + 3/10) $
    Quy đồng mẫu $400$:
    $ P(H_2|"Đỏ") = (25/400) / ((48+25+120)/400) = 25/193. $
  ],
)

#tln(
  id: "KV-BI-03",
  [Hộp $A$ có $x$ bi đỏ và $4$ bi xanh; hộp $B$ có $6$ bi đỏ và $4$ bi xanh. Lấy ngẫu nhiên $2$ viên từ $A$ và $3$ viên từ $B$ bỏ vào hộp $M$. Sau đó lấy ngẫu nhiên $2$ viên từ $M$ và thêm $3$ viên lấy trực tiếp từ $B$ bỏ vào hộp $T$. Từ $T$ rút ngẫu nhiên $1$ viên thì được bi đỏ. Biết xác suất viên bi đỏ này có nguồn gốc ban đầu từ $A$ bằng $4/25$. Tìm $x$.],
  [$6$],
  loigiai: [
    *Trực quan hóa bằng Sơ đồ cây:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let rootBox = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Rút 1 bi từ Hộp T (5 bi)*]
        content((0, 4.5), rootBox, name: "root")

        let bM = box(fill: rgb("e8eaf6"), stroke: 1.5pt + rgb("3f51b5"), inset: 8pt, radius: 5pt)[*Gốc Hộp M*]
        content((-3, 2.5), bM, name: "hM")
        let bB1 = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc Hộp B (trực tiếp)*]
        content((3, 2.5), bB1, name: "hB1")

        let bA = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc Hộp A*]
        content((-5, 0.5), bA, name: "hA")
        let bB2 = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc Hộp B*]
        content((-1, 0.5), bB2, name: "hB2")

        circle((-5, -1.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c1")
        content("c1", [*Đỏ*])
        circle((-1, -1.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c3")
        content("c3", [*Đỏ*])
        circle((3, -1.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c5")
        content("c5", [*Đỏ*])

        line("root", "hM", mark: (end: ">"))
        content((-1.2, 3.8), box(fill: white, inset: 1pt)[$2 / 5$])
        line("root", "hB1", mark: (end: ">"))
        content((1.8, 3.8), box(fill: white, inset: 1pt)[$3 / 5$])

        line("hM", "hA", mark: (end: ">"))
        content((-4.3, 1.7), box(fill: white, inset: 1pt)[$2 / 5$])
        line("hM", "hB2", mark: (end: ">"))
        content((-1.7, 1.7), box(fill: white, inset: 1pt)[$3 / 5$])

        line("hA", "c1", mark: (end: ">"))
        content((-5.5, -0.5), box(fill: white, inset: 1pt)[$x/(x+4)$])

        line("hB2", "c3", mark: (end: ">"))
        content((-1.5, -0.5), box(fill: white, inset: 1pt)[$6 / 10$])

        line("hB1", "c5", mark: (end: ">"))
        content((2.5, 0.5), box(fill: white, inset: 1pt)[$6 / 10$])
      })
    ]

    #step([Tính trọng số nguồn trong hộp T])
    Phần từ $M$ chiếm $2/5$ trong $T$. Trong $M$, phần từ $A$ chiếm $2/5$, phần từ $B$ chiếm $3/5$.

    Do đó:
    $ P("gốc A") = 2/5 dot 2/5 = 4/25 $
    $ P("gốc B") = 2/5 dot 3/5 + 3/5 = 6/25 + 15/25 = 21/25 $

    #step([Gắn điều kiện viên cuối đỏ])
    $ P("gốc A và Đỏ") = 4/25 dot x/(x+4) $
    $ P("gốc B và Đỏ") = 21/25 dot 6/10 = 63/125 $

    #step([Lập phương trình truy nguồn])
    Theo đề:
    $ (4/25 dot x/(x+4)) / (4/25 dot x/(x+4) + 63/125) = 4/25 $

    Đặt $a = 4 dot x/(x+4)$ và cùng triệt tiêu mẫu $25$, ta có:
    $ a / (a + 63/5) = 4/25 $
    $ 25a = 4a + 252/5 <=> 21a = 252/5 <=> a = 12/5. $

    Suy ra:
    $ 4x/(x+4) = 12/5 <=> 20x = 12x + 48 <=> x = 6. $
  ],
)

#tln(
  id: "KV-BI-04",
  [Ba hộp $A,B,C$ có thành phần như sau: $A$ có $4$ bi đỏ, $5$ bi xanh, $1$ bi vàng; $B$ có $3$ bi đỏ, $2$ bi xanh, $5$ bi vàng; $C$ có $5$ bi đỏ, $4$ bi xanh, $3$ bi vàng. Lấy ngẫu nhiên $2$ viên từ $A$, $4$ viên từ $B$, $6$ viên từ $C$ bỏ vào hộp $T$. Từ $T$ rút ngẫu nhiên $1$ viên thì được bi vàng. Tính xác suất viên bi vàng đó có nguồn gốc từ $B$.],
  [$20/37$],
  loigiai: [
    #ppgiai[
      Màu cần xét là vàng, nên toàn bộ tỉ lệ đỏ/xanh chỉ là nhiễu. Với mỗi nguồn, ta lấy "số viên đóng góp" nhân "tỉ lệ vàng".
    ]

    *Sơ đồ cây xác suất:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let rootBox = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Rút 1 bi từ Hộp T*]
        content((0, 4.5), rootBox, name: "root")

        let bA = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc Hộp A*]
        content((-4, 2.5), bA, name: "hA")
        let bB = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc Hộp B*]
        content((0, 2.5), bB, name: "hB")
        let bC = box(fill: rgb("f3e5f5"), stroke: 1.5pt + rgb("9c27b0"), inset: 8pt, radius: 5pt)[*Gốc Hộp C*]
        content((4, 2.5), bC, name: "hC")

        circle((-4, 0.5), radius: 0.6, fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), name: "c1")
        content("c1", [*Vàng*])
        circle((0, 0.5), radius: 0.6, fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), name: "c2")
        content("c2", [*Vàng*])
        circle((4, 0.5), radius: 0.6, fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), name: "c3")
        content("c3", [*Vàng*])

        line("root", "hA", mark: (end: ">"))
        content((-2.2, 3.8), box(fill: white, inset: 1pt)[$2 / 12$])
        line("root", "hB", mark: (end: ">"))
        content((0.4, 3.8), box(fill: white, inset: 1pt)[$4 / 12$])
        line("root", "hC", mark: (end: ">"))
        content((2.2, 3.8), box(fill: white, inset: 1pt)[$6 / 12$])

        line("hA", "c1", mark: (end: ">"))
        content((-4.5, 1.5), box(fill: white, inset: 1pt)[$1/10$])
        line("hB", "c2", mark: (end: ">"))
        content((-0.5, 1.5), box(fill: white, inset: 1pt)[$5/10$])
        line("hC", "c3", mark: (end: ">"))
        content((4.5, 1.5), box(fill: white, inset: 1pt)[$3/12$])
      })
    ]

    #step([Tính các nhánh tạo ra màu vàng])
    - Nguồn $A$: $2/12 dot 1/10 = 1/60$.
    - Nguồn $B$: $4/12 dot 5/10 = 1/6$.
    - Nguồn $C$: $6/12 dot 3/12 = 1/8$.

    #step([Truy nguồn về B])
    $ P(B|"Vàng") = (1/6) / (1/60 + 1/6 + 1/8) $
    $ = (20/120) / ((2+20+15)/120) = 20/37. $
  ],
)

#tln(
  id: "KV-BI-05",
  [Có ba nguồn bi $H_1,H_2,H_3$. Mỗi lần gieo một con xúc xắc cân đối: nếu ra $1$ hoặc $2$ thì lấy ngẫu nhiên $2$ viên từ $H_1$; nếu ra $3,4,5$ thì lấy ngẫu nhiên $2$ viên từ $H_2$; nếu ra $6$ thì lấy ngẫu nhiên $2$ viên từ $H_3$. Thực hiện phép thử trên $2$ lần, tất cả bi lấy được đều bỏ vào hộp $T$. Biết $H_1$ có tỉ lệ đỏ $4/10$, $H_2$ có tỉ lệ đỏ $7/10$, $H_3$ có tỉ lệ đỏ $9/10$. Từ $T$ rút ngẫu nhiên $1$ viên thì được bi đỏ. Tính xác suất viên bi đỏ này có nguồn gốc từ $H_3$.],
  [$9/38$],
  loigiai: [
    #ppgiai[
      Vì mỗi lần gieo đều đóng góp đúng $2$ viên, nên một viên ngẫu nhiên trong hộp $T$ có xác suất đến từ mỗi nguồn đúng bằng xác suất xúc xắc chọn nguồn đó. Hai lần gieo không làm thay đổi tỉ lệ nguồn trung bình.
    ]

    *Sơ đồ cây xác suất:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let rootBox = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Rút 1 bi từ Hộp T*]
        content((0, 4.5), rootBox, name: "root")

        let bTH1 = box(fill: rgb("e8eaf6"), stroke: 1.5pt + rgb("3f51b5"), inset: 8pt, radius: 5pt)[*Hộp $H_1$ (1,2 chấm)*]
        content((-4, 2.5), bTH1, name: "h1")
        let bTH2 = box(fill: rgb("f3e5f5"), stroke: 1.5pt + rgb("9c27b0"), inset: 8pt, radius: 5pt)[*Hộp $H_2$ (3,4,5 chấm)*]
        content((0, 2.5), bTH2, name: "h2")
        let bTH3 = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Hộp $H_3$ (6 chấm)*]
        content((4, 2.5), bTH3, name: "h3")

        circle((-4, 0.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c1")
        content("c1", [*Đỏ*])
        circle((0, 0.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c2")
        content("c2", [*Đỏ*])
        circle((4, 0.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c3")
        content("c3", [*Đỏ*])

        line("root", "h1", mark: (end: ">"))
        content((-2.2, 3.8), box(fill: white, inset: 1pt)[$2 / 6$])
        line("root", "h2", mark: (end: ">"))
        content((0.4, 3.8), box(fill: white, inset: 1pt)[$3 / 6$])
        line("root", "h3", mark: (end: ">"))
        content((2.2, 3.8), box(fill: white, inset: 1pt)[$1 / 6$])

        line("h1", "c1", mark: (end: ">"))
        content((-4.5, 1.5), box(fill: white, inset: 1pt)[$4/10$])
        line("h2", "c2", mark: (end: ">"))
        content((-0.5, 1.5), box(fill: white, inset: 1pt)[$7/10$])
        line("h3", "c3", mark: (end: ">"))
        content((4.5, 1.5), box(fill: white, inset: 1pt)[$9/10$])
      })
    ]

    #step([Tính xác suất nguồn])
    $ P(H_1)=2/6=1/3; quad P(H_2)=3/6=1/2; quad P(H_3)=1/6. $

    #step([Tính trọng số đỏ])
    $ w_1 = 1/3 dot 4/10 = 2/15 $
    $ w_2 = 1/2 dot 7/10 = 7/20 $
    $ w_3 = 1/6 dot 9/10 = 3/20 $

    #step([Truy nguồn H_3])
    $ P(H_3|"Đỏ") = (3/20) / (2/15 + 7/20 + 3/20) $
    $ = (3/20) / (38/60) = 9/38. $
  ],
)

#tln(
  id: "KV-BI-06",
  [Ba hộp ban đầu $A,B,C$ lần lượt có tỉ lệ bi đỏ là $3/4$, $1/5$, $1/2$. Hộp $M$ nhận ngẫu nhiên $4$ viên từ $A$ và $2$ viên từ $B$. Hộp $N$ nhận ngẫu nhiên $3$ viên từ $M$ và $5$ viên từ $C$. Hộp $P$ nhận ngẫu nhiên $4$ viên từ $N$ và $4$ viên lấy trực tiếp từ $B$. Từ $P$ rút ngẫu nhiên $1$ viên thì được bi đỏ. Tính xác suất viên bi đỏ đó có nguồn gốc ban đầu từ $A$.],
  [$15/58$],
  loigiai: [
    #ppgiai[
      Bài này có hai đường đi cùng về nguồn $B$: một đường qua $M,N$, một đường trực tiếp vào $P$. Khi truy nguồn, các đường cùng nguồn phải cộng lại trước khi gắn màu.
    ]

    *Sơ đồ dòng chảy xác suất (cộng dồn nhánh B):*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let bP = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Hộp P*]
        content((0, 6.5), bP, name: "hP")

        let bN = box(fill: rgb("e8eaf6"), stroke: 1.5pt + rgb("3f51b5"), inset: 8pt, radius: 5pt)[*Hộp N*]
        content((-2, 4.5), bN, name: "hN")
        
        let bM = box(fill: rgb("f3e5f5"), stroke: 1.5pt + rgb("9c27b0"), inset: 8pt, radius: 5pt)[*Hộp M*]
        content((-4, 2.5), bM, name: "hM")
        
        let bA = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc A*]
        content((-6, 0.5), bA, name: "hA")
        let bB = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc B*]
        content((-2, 0.5), bB, name: "hB")
        let bC = box(fill: rgb("e8f5e9"), stroke: 1.5pt + rgb("4caf50"), inset: 8pt, radius: 5pt)[*Gốc C*]
        content((2, 2.5), bC, name: "hC")

        line("hP", "hN", mark: (end: ">"))
        content((-1.5, 5.8), box(fill: white, inset: 1pt)[$4 / 8$])
        line("hP", "hB", mark: (end: ">"))
        content((0.2, 3.5), box(fill: white, inset: 1pt)[$4 / 8$ (Trực tiếp)])

        line("hN", "hM", mark: (end: ">"))
        content((-3.5, 3.8), box(fill: white, inset: 1pt)[$3 / 8$])
        line("hN", "hC", mark: (end: ">"))
        content((0.2, 3.8), box(fill: white, inset: 1pt)[$5 / 8$])

        line("hM", "hA", mark: (end: ">"))
        content((-5.5, 1.8), box(fill: white, inset: 1pt)[$4 / 6$])
        line("hM", "hB", mark: (end: ">"))
        content((-2.8, 1.8), box(fill: white, inset: 1pt)[$2 / 6$])
      })
    ]

    #step([Lần theo trọng số nguồn trong P])
    - Đường từ $A$: $P <- N <- M <- A$ nên:
    $ q_A = 4/8 dot 3/8 dot 4/6 = 1/8. $
    - Đường từ $B$ qua $M,N$:
    $ q_(B,1) = 4/8 dot 3/8 dot 2/6 = 1/16. $
    - Đường từ $B$ trực tiếp vào $P$:
    $ q_(B,2) = 4/8 = 1/2. $
    Vậy $q_B = 1/16 + 1/2 = 9/16$.
    - Đường từ $C$:
    $ q_C = 4/8 dot 5/8 = 5/16. $

    #step([Gắn màu đỏ])
    $ P(A inter "Đỏ") = 1/8 dot 3/4 = 3/32 $
    $ P(B inter "Đỏ") = 9/16 dot 1/5 = 9/80 $
    $ P(C inter "Đỏ") = 5/16 dot 1/2 = 5/32 $

    #step([Bayes dạng tổng trọng số])
    $ P(A|"Đỏ") = (3/32) / (3/32 + 9/80 + 5/32) $
    $ = (15/160) / ((15+18+25)/160) = 15/58. $
  ],
)

#tln(
  id: "KV-BI-07",
  [Hộp $A$ có $x$ bi đỏ và $5$ bi xanh; hộp $B$ có $4$ bi đỏ và $6$ bi xanh; hộp $C$ có $7$ bi đỏ và $3$ bi xanh. Lấy ngẫu nhiên $7$ viên từ $A$, $2$ viên từ $B$, $1$ viên từ $C$ bỏ vào hộp $T$. Từ $T$ rút ngẫu nhiên $1$ viên thì được bi đỏ. Tìm giá trị nguyên nhỏ nhất của $x$ để xác suất viên bi đỏ này có nguồn gốc từ $A$ không nhỏ hơn $3/4$.],
  [$9$],
  loigiai: [
    *Sơ đồ cây xác suất:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let rootBox = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Rút 1 bi từ Hộp T*]
        content((0, 4.5), rootBox, name: "root")

        let bA = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc Hộp A*]
        content((-4, 2.5), bA, name: "hA")
        let bB = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc Hộp B*]
        content((0, 2.5), bB, name: "hB")
        let bC = box(fill: rgb("f3e5f5"), stroke: 1.5pt + rgb("9c27b0"), inset: 8pt, radius: 5pt)[*Gốc Hộp C*]
        content((4, 2.5), bC, name: "hC")

        circle((-4, 0.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c1")
        content("c1", [*Đỏ*])
        circle((0, 0.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c2")
        content("c2", [*Đỏ*])
        circle((4, 0.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c3")
        content("c3", [*Đỏ*])

        line("root", "hA", mark: (end: ">"))
        content((-2.2, 3.8), box(fill: white, inset: 1pt)[$7 / 10$])
        line("root", "hB", mark: (end: ">"))
        content((0.4, 3.8), box(fill: white, inset: 1pt)[$2 / 10$])
        line("root", "hC", mark: (end: ">"))
        content((2.2, 3.8), box(fill: white, inset: 1pt)[$1 / 10$])

        line("hA", "c1", mark: (end: ">"))
        content((-4.8, 1.5), box(fill: white, inset: 1pt)[$x/(x+5)$])
        line("hB", "c2", mark: (end: ">"))
        content((-0.5, 1.5), box(fill: white, inset: 1pt)[$4/10$])
        line("hC", "c3", mark: (end: ">"))
        content((4.5, 1.5), box(fill: white, inset: 1pt)[$7/10$])
      })
    ]

    #step([Tính trọng số đỏ của các nguồn không phải A])
    $ w_B = 2/10 dot 4/10 = 2/25 $
    $ w_C = 1/10 dot 7/10 = 7/100 $
    $ w_B + w_C = 2/25 + 7/100 = 3/20. $

    #step([Tính trọng số đỏ của A])
    $ w_A = 7/10 dot x/(x+5). $

    #step([Lập bất phương trình hậu nghiệm])
    Ta cần:
    $ w_A / (w_A + 3/20) >= 3/4 $
    $ <=> 4w_A >= 3w_A + 9/20 <=> w_A >= 9/20. $

    Thay $w_A$:
    $ 7/10 dot x/(x+5) >= 9/20 $
    $ <=> 14x >= 9(x+5) <=> 5x >= 45 <=> x >= 9. $

    Vậy giá trị nguyên nhỏ nhất là $x=9$.
  ],
)

#tln(
  id: "KV-BI-08",
  [Bốn hộp $A,B,C,D$ chứa bi đỏ và bi xanh. Tỉ lệ bi đỏ lần lượt là $2/3$, $1/4$, $3/5$, $5/6$. Hộp $M$ nhận $3$ viên từ $A$ và $1$ viên từ $B$. Hộp $N$ nhận $2$ viên từ $M$ và $4$ viên từ $C$. Hộp $T$ nhận $3$ viên từ $N$, $2$ viên từ $D$ và $1$ viên trực tiếp từ $B$. Từ $T$ rút ngẫu nhiên $1$ viên thì được bi đỏ. Hỏi nguồn nào có xác suất hậu nghiệm lớn nhất?],
  [Nguồn $D$],
  loigiai: [
    #ppgiai[
      Bài này không cần tính đủ xác suất hậu nghiệm. Muốn biết nguồn nào lớn nhất khi biết bi đỏ, chỉ cần so sánh các trọng số $q_i dot r_i$, trong đó $q_i$ là xác suất nguồn của viên cuối, $r_i$ là tỉ lệ đỏ trong nguồn.
    ]

    *Sơ đồ dòng chảy xác suất tổng quát:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let bT = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Hộp T*]
        content((0, 6.5), bT, name: "hT")

        let bN = box(fill: rgb("e8eaf6"), stroke: 1.5pt + rgb("3f51b5"), inset: 8pt, radius: 5pt)[*Hộp N*]
        content((-3, 4.5), bN, name: "hN")
        let bD = box(fill: rgb("e3f2fd"), stroke: 1.5pt + rgb("2196f3"), inset: 8pt, radius: 5pt)[*Gốc D*]
        content((1, 4.5), bD, name: "hD")
        
        let bM = box(fill: rgb("f3e5f5"), stroke: 1.5pt + rgb("9c27b0"), inset: 8pt, radius: 5pt)[*Hộp M*]
        content((-5, 2.5), bM, name: "hM")
        let bC = box(fill: rgb("e8f5e9"), stroke: 1.5pt + rgb("4caf50"), inset: 8pt, radius: 5pt)[*Gốc C*]
        content((-1, 2.5), bC, name: "hC")
        
        let bA = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc A*]
        content((-7, 0.5), bA, name: "hA")
        let bB = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc B*]
        content((-3, 0.5), bB, name: "hB")

        line("hT", "hN", mark: (end: ">"))
        content((-1.2, 5.8), box(fill: white, inset: 1pt)[$3 / 6$])
        line("hT", "hD", mark: (end: ">"))
        content((1.2, 5.8), box(fill: white, inset: 1pt)[$2 / 6$])
        line("hT", "hB", mark: (end: ">"))
        content((0, 2), box(fill: white, inset: 1pt)[$1/6$ (trực tiếp)])

        line("hN", "hM", mark: (end: ">"))
        content((-4.5, 3.8), box(fill: white, inset: 1pt)[$2 / 6$])
        line("hN", "hC", mark: (end: ">"))
        content((-1.5, 3.8), box(fill: white, inset: 1pt)[$4 / 6$])

        line("hM", "hA", mark: (end: ">"))
        content((-6.5, 1.8), box(fill: white, inset: 1pt)[$3 / 4$])
        line("hM", "hB", mark: (end: ">"))
        content((-3.5, 1.8), box(fill: white, inset: 1pt)[$1 / 4$])
      })
    ]

    #step([Tính trọng số nguồn trong T])
    Từ $T$, ta có:
    - Phần qua $N$: $3/6 = 1/2$.
    - Phần từ $D$: $2/6 = 1/3$.
    - Phần trực tiếp từ $B$: $1/6$.

    Trong $N$, phần từ $M$ chiếm $2/6=1/3$, phần từ $C$ chiếm $4/6=2/3$. Trong $M$, phần từ $A$ chiếm $3/4$, phần từ $B$ chiếm $1/4$.

    Do đó:
    $ q_A = 1/2 dot 1/3 dot 3/4 = 1/8 $
    $ q_B = 1/2 dot 1/3 dot 1/4 + 1/6 = 1/24 + 1/6 = 5/24 $
    $ q_C = 1/2 dot 2/3 = 1/3 $
    $ q_D = 1/3 $

    #step([So sánh trọng số đỏ])
    $ w_A = 1/8 dot 2/3 = 1/12 $
    $ w_B = 5/24 dot 1/4 = 5/96 $
    $ w_C = 1/3 dot 3/5 = 1/5 $
    $ w_D = 1/3 dot 5/6 = 5/18 $

    Vì $5/18 > 1/5 > 1/12 > 5/96$, nguồn có xác suất hậu nghiệm lớn nhất là $D$.
  ],
)

= III. Mẫu Tổng Quát Cho Bài Nhiều Giai Đoạn

#lythuyet[
  *Bước 1. Đánh số nguồn ban đầu:* $H_1,H_2,...,H_n$.

  *Bước 2. Tính trọng số nguồn $q_i$ của một viên bất kỳ trong hộp cuối.*
  - Nếu đi trực tiếp: $q_i = "số viên từ H_i" / "tổng số viên hộp cuối"$.
  - Nếu đi qua nhiều trạm: nhân các tỉ lệ trên đường đi.
  - Nếu một nguồn có nhiều đường đi: cộng các đường lại.

  *Bước 3. Gắn màu đã biết.*
  Nếu màu đã biết là đỏ và tỉ lệ đỏ ở nguồn $H_i$ là $r_i$, đặt:
  $ w_i = q_i dot r_i $

  *Bước 4. Truy nguồn.*
  $ P(H_k | "Đỏ") = w_k / (w_1 + w_2 + ... + w_n) $

  *Câu thần chú:* "Muốn truy nguồn một viên cuối, đừng đếm cả hộp trung gian. Hãy cho mỗi viên một xác suất nguồn, rồi gắn màu ở nguồn ban đầu."
]


#tln(
  id: "KV-BI-09",
  [Hộp I đựng 4 viên bi đỏ và 6 viên bi xanh, hộp II đựng 5 viên bi đỏ và 7 viên bi xanh, hộp III đựng 3 viên bi đỏ và 2 viên bi xanh. Ta lấy ngẫu nhiên 3 viên bi từ hộp I và 4 viên bi từ hộp II cho vào hộp IV. Sau đó, lấy ngẫu nhiên 2 viên bi từ hộp IV và 3 viên bi từ hộp III cho vào hộp V. Từ hộp V lấy ngẫu nhiên 1 viên bi thì được viên bi đỏ. Tính xác suất viên bi đó có nguồn gốc từ hộp II.],
  [$2/11$],
  loigiai: [
    #ppgiai[
      Bài toán có 3 giai đoạn chuyển bi, nhưng nhờ bảo toàn tỉ lệ, ta có thể dễ dàng truy ngược nguồn gốc của $1$ viên từ Hộp V về các hộp I, II, III.
    ]

    *Sơ đồ cây dòng chảy xác suất:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let rootBox = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Rút 1 bi từ Hộp V (5 bi)*]
        content((0, 4.5), rootBox, name: "root")

        let bIV = box(fill: rgb("e8eaf6"), stroke: 1.5pt + rgb("3f51b5"), inset: 8pt, radius: 5pt)[*Gốc Hộp IV*]
        content((-3, 2.5), bIV, name: "hIV")
        let bIII = box(fill: rgb("f3e5f5"), stroke: 1.5pt + rgb("9c27b0"), inset: 8pt, radius: 5pt)[*Gốc Hộp III*]
        content((3, 2.5), bIII, name: "hIII")

        let bI = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc Hộp I*]
        content((-5, 0.5), bI, name: "hI")
        let bII = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc Hộp II*]
        content((-1, 0.5), bII, name: "hII")

        circle((-5, -1.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c1")
        content("c1", [*Đỏ*])
        circle((-1, -1.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c2")
        content("c2", [*Đỏ*])
        circle((3, -1.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c3")
        content("c3", [*Đỏ*])

        line("root", "hIV", mark: (end: ">"))
        content((-1.2, 3.8), box(fill: white, inset: 1pt)[$2 / 5$])
        line("root", "hIII", mark: (end: ">"))
        content((1.8, 3.8), box(fill: white, inset: 1pt)[$3 / 5$])

        line("hIV", "hI", mark: (end: ">"))
        content((-4.3, 1.7), box(fill: white, inset: 1pt)[$3 / 7$])
        line("hIV", "hII", mark: (end: ">"))
        content((-1.7, 1.7), box(fill: white, inset: 1pt)[$4 / 7$])

        line("hI", "c1", mark: (end: ">"))
        content((-5.5, -0.5), box(fill: white, inset: 1pt)[$4 / 10$])
        line("hII", "c2", mark: (end: ">"))
        content((-1.5, -0.5), box(fill: white, inset: 1pt)[$5 / 12$])
        line("hIII", "c3", mark: (end: ">"))
        content((2.5, 0.5), box(fill: white, inset: 1pt)[$3 / 5$])
      })
    ]

    #step([Tính xác suất nguồn (tỉ lệ đóng góp) trong Hộp V])
    - Hộp V nhận 2 viên từ IV và 3 viên từ III. Suy ra phần gốc từ IV chiếm $2/5$, phần gốc từ III chiếm $3/5$.
    - Trong Hộp IV, nhận 3 viên từ I và 4 viên từ II. Suy ra phần gốc từ I chiếm $3/7$, phần gốc từ II chiếm $4/7$.
    
    Do đó, xác suất nguồn của $1$ viên trong hộp V là:
    $ q_"I" = 2/5 dot 3/7 = 6/35 $
    $ q_"II" = 2/5 dot 4/7 = 8/35 $
    $ q_"III" = 3/5 $

    #step([Tính trọng số sinh ra bi Đỏ (Xác suất Gốc giao Đỏ)])
    $ w_"I" = q_"I" dot P("Đỏ" | "I") = 6/35 dot 4/10 = 12/175 $
    $ w_"II" = q_"II" dot P("Đỏ" | "II") = 8/35 dot 5/12 = 2/21 $
    $ w_"III" = q_"III" dot P("Đỏ" | "III") = 3/5 dot 3/5 = 9/25 $

    #step([Truy nguồn gốc Hộp II])
    Xác suất viên bi có nguồn gốc từ Hộp II là:
    $ P("II" | "Đỏ") = w_"II" / (w_"I" + w_"II" + w_"III") = (2/21) / (12/175 + 2/21 + 9/25) $
    Quy đồng mẫu $525$:
    $ = (50/525) / ((36 + 50 + 189)/525) = 50 / 275 = 2/11. $
    
  ]
)

#tln(
  id: "KV-BI-10",
  [Một trang trại có $3$ lồng gà $A, B, C$. Lồng $A$ có $3$ gà trống, $7$ gà mái; lồng $B$ có $4$ gà trống, $6$ gà mái; lồng $C$ có $4$ gà trống, $6$ gà mái. Lấy ngẫu nhiên $x$ con từ $A$ và $5$ con từ $B$ cho vào lồng $M$. Sau đó lấy ngẫu nhiên $4$ con từ $M$ và $2$ con từ $C$ cho vào lồng $N$. Từ $N$ bắt ngẫu nhiên $1$ con thì được gà mái. Biết xác suất con gà mái này có nguồn gốc từ lồng $B$ là $6/19$. Tìm $x$.],
  [$5$],
  loigiai: [
    *Sơ đồ cây xác suất:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let rootBox = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Bắt 1 con từ Lồng N (6 con)*]
        content((0, 4.5), rootBox, name: "root")

        let bM = box(fill: rgb("e8eaf6"), stroke: 1.5pt + rgb("3f51b5"), inset: 8pt, radius: 5pt)[*Gốc Lồng M*]
        content((-3, 2.5), bM, name: "hM")
        let bC = box(fill: rgb("f3e5f5"), stroke: 1.5pt + rgb("9c27b0"), inset: 8pt, radius: 5pt)[*Gốc Lồng C*]
        content((3, 2.5), bC, name: "hC")

        let bA = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc Lồng A*]
        content((-5, 0.5), bA, name: "hA")
        let bB = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc Lồng B*]
        content((-1, 0.5), bB, name: "hB")

        circle((-5, -1.5), radius: 0.6, fill: rgb("fce4ec"), stroke: 1.5pt + rgb("e91e63"), name: "c1")
        content("c1", [*Mái*])
        circle((-1, -1.5), radius: 0.6, fill: rgb("fce4ec"), stroke: 1.5pt + rgb("e91e63"), name: "c2")
        content("c2", [*Mái*])
        circle((3, -1.5), radius: 0.6, fill: rgb("fce4ec"), stroke: 1.5pt + rgb("e91e63"), name: "c3")
        content("c3", [*Mái*])

        line("root", "hM", mark: (end: ">"))
        content((-1.2, 3.8), box(fill: white, inset: 1pt)[$4 / 6$])
        line("root", "hC", mark: (end: ">"))
        content((1.8, 3.8), box(fill: white, inset: 1pt)[$2 / 6$])

        line("hM", "hA", mark: (end: ">"))
        content((-4.3, 1.7), box(fill: white, inset: 1pt)[$x / (x+5)$])
        line("hM", "hB", mark: (end: ">"))
        content((-1.7, 1.7), box(fill: white, inset: 1pt)[$5 / (x+5)$])

        line("hA", "c1", mark: (end: ">"))
        content((-5.5, -0.5), box(fill: white, inset: 1pt)[$7 / 10$])
        line("hB", "c2", mark: (end: ">"))
        content((-1.5, -0.5), box(fill: white, inset: 1pt)[$6 / 10$])
        line("hC", "c3", mark: (end: ">"))
        content((2.5, 0.5), box(fill: white, inset: 1pt)[$6 / 10$])
      })
    ]

    #step([Tính trọng số nguồn trong Lồng N])
    - Gốc $C$: $2/6 = 1/3$.
    - Gốc $M$: $4/6 = 2/3$. Trong đó, nguồn $A$ chiếm tỉ lệ $x/(x+5)$, nguồn $B$ chiếm $5/(x+5)$.
    Suy ra:
    $ q_A = 2/3 dot x/(x+5) $
    $ q_B = 2/3 dot 5/(x+5) = 10 / (3(x+5)) $

    #step([Trọng số Mái của từng nguồn])
    $ w_A = q_A dot P("Mái"|"A") = 2/3 dot x/(x+5) dot 7/10 = (7x)/(15(x+5)) $
    $ w_B = q_B dot P("Mái"|"B") = 10/(3(x+5)) dot 6/10 = 2/(x+5) $
    $ w_C = q_C dot P("Mái"|"C") = 1/3 dot 6/10 = 1/5 $

    #step([Lập phương trình Bayes])
    $ w_B / (w_A + w_B + w_C) = 6/19 $
    $ (2 / (x+5)) / ( (7x)/ (15(x+5)) + 2/(x+5) + 1/5 ) = 6/19 $
    
    Nhân cả tử và mẫu với $15(x+5)$:
    Tử số: $30$
    Mẫu số: $7x + 30 + 3(x+5) = 10x + 45$
    
    Vậy:
    $ 30 / (10x + 45) = 6/19 $
    $ 10x + 45 = 5 dot 19 = 95 $
    $ 10x = 50 => x = 5 $
    
  ]
)


#tln(
  id: "KV-BI-11",
  [Bốn hộp bi $A, B, C, D$ có tỉ lệ bi đỏ lần lượt là $20%, 30%, 50%, 80%$. Gieo một con xúc xắc cân đối đồng chất. Nếu xuất hiện mặt $1$ hoặc $2$ chấm, ta lấy $3$ viên từ $A$ và $2$ viên từ $B$ bỏ vào hộp $M$. Nếu xuất hiện mặt $3, 4, 5$ chấm, ta lấy $4$ viên từ $B$ và $1$ viên từ $C$ bỏ vào hộp $M$. Nếu xuất hiện mặt $6$ chấm, ta lấy $5$ viên từ $D$ bỏ vào hộp $M$. 
  Từ hộp $M$, ta rút ngẫu nhiên $1$ viên bi thì được bi đỏ. Tính xác suất viên bi đỏ này có nguồn gốc ban đầu từ hộp $B$.],
  [$48/115$],
  loigiai: [
    #ppgiai[
      Dù hành động chọn hộp phụ thuộc vào xúc xắc, ta vẫn có thể dùng "Trọng số trung bình". 
      Trung bình, số viên bi mỗi hộp đóng góp vào hộp $M$ (kỳ vọng số bi) sẽ là xác suất xảy ra trường hợp đó nhân với số bi được lấy. Tổng số bi trong hộp $M$ luôn là $5$ viên, nên ta có thể coi mỗi nhánh là một dòng chảy xác suất.
    ]

    *Sơ đồ cây xác suất:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let rootBox = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Rút 1 bi từ Hộp M (luôn có 5 bi)*]
        content((0, 4.5), rootBox, name: "root")

        let bTH1 = box(fill: rgb("e8eaf6"), stroke: 1.5pt + rgb("3f51b5"), inset: 8pt, radius: 5pt)[*TH 1,2 chấm*]
        content((-4, 2.5), bTH1, name: "hTH1")
        let bTH2 = box(fill: rgb("f3e5f5"), stroke: 1.5pt + rgb("9c27b0"), inset: 8pt, radius: 5pt)[*TH 3,4,5 chấm*]
        content((0, 2.5), bTH2, name: "hTH2")
        let bTH3 = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*TH 6 chấm*]
        content((4, 2.5), bTH3, name: "hTH3")

        let bA = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 4pt, radius: 3pt)[*Gốc A*]
        content((-5.5, 0.5), bA, name: "hA")
        let bB1 = box(fill: rgb("ffebee"), stroke: 1.5pt + rgb("f44336"), inset: 4pt, radius: 3pt)[*Gốc B*]
        content((-2.5, 0.5), bB1, name: "hB1")
        
        let bB2 = box(fill: rgb("ffebee"), stroke: 1.5pt + rgb("f44336"), inset: 4pt, radius: 3pt)[*Gốc B*]
        content((-1.5, 0.5), bB2, name: "hB2")
        let bC = box(fill: rgb("e8f5e9"), stroke: 1.5pt + rgb("4caf50"), inset: 4pt, radius: 3pt)[*Gốc C*]
        content((1.5, 0.5), bC, name: "hC")

        let bD = box(fill: rgb("e3f2fd"), stroke: 1.5pt + rgb("2196f3"), inset: 4pt, radius: 3pt)[*Gốc D*]
        content((4, 0.5), bD, name: "hD")

        circle((-5.5, -1.5), radius: 0.5, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c1")
        content("c1", [*Đỏ*])
        circle((-2.5, -1.5), radius: 0.5, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c2")
        content("c2", [*Đỏ*])
        circle((-1.5, -1.5), radius: 0.5, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c3")
        content("c3", [*Đỏ*])
        circle((1.5, -1.5), radius: 0.5, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c4")
        content("c4", [*Đỏ*])
        circle((4, -1.5), radius: 0.5, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c5")
        content("c5", [*Đỏ*])

        line("root", "hTH1", mark: (end: ">"))
        content((-2.2, 3.8), box(fill: white, inset: 1pt)[$2 / 6$])
        line("root", "hTH2", mark: (end: ">"))
        content((0.4, 3.8), box(fill: white, inset: 1pt)[$3 / 6$])
        line("root", "hTH3", mark: (end: ">"))
        content((2.2, 3.8), box(fill: white, inset: 1pt)[$1 / 6$])

        line("hTH1", "hA", mark: (end: ">"))
        content((-5.3, 1.7), box(fill: white, inset: 1pt)[$3 / 5$])
        line("hTH1", "hB1", mark: (end: ">"))
        content((-2.7, 1.7), box(fill: white, inset: 1pt)[$2 / 5$])

        line("hTH2", "hB2", mark: (end: ">"))
        content((-1.2, 1.7), box(fill: white, inset: 1pt)[$4 / 5$])
        line("hTH2", "hC", mark: (end: ">"))
        content((1.2, 1.7), box(fill: white, inset: 1pt)[$1 / 5$])
        
        line("hTH3", "hD", mark: (end: ">"))
        content((4.4, 1.7), box(fill: white, inset: 1pt)[$5 / 5$])

        line("hA", "c1", mark: (end: ">"))
        content((-6.2, -0.5), box(fill: white, inset: 1pt)[$2/10$])
        line("hB1", "c2", mark: (end: ">"))
        content((-3.2, -0.5), box(fill: white, inset: 1pt)[$3/10$])
        line("hB2", "c3", mark: (end: ">"))
        content((-2.2, -0.5), box(fill: white, inset: 1pt)[$3/10$])
        line("hC", "c4", mark: (end: ">"))
        content((2.2, -0.5), box(fill: white, inset: 1pt)[$5/10$])
        line("hD", "c5", mark: (end: ">"))
        content((4.8, -0.5), box(fill: white, inset: 1pt)[$8/10$])
      })
    ]

    #step([Tính xác suất nguồn (Trọng số gốc) của một viên trong M])
    - Gốc $A$: $2/6 dot 3/5 = 1/5 = 6/30$.
    - Gốc $B$: có 2 đường đi: $2/6 dot 2/5 + 3/6 dot 4/5 = 4/30 + 12/30 = 16/30$.
    - Gốc $C$: $3/6 dot 1/5 = 3/30$.
    - Gốc $D$: $1/6 dot 5/5 = 5/30$.
    (Kiểm tra: $6+16+3+5 = 30$, tổng bằng $1$).

    #step([Gắn tỉ lệ bi đỏ cho từng nguồn (Trọng số Đỏ)])
    - Gốc $A$: $w_A = 6/30 dot 2/10 = 12/300$.
    - Gốc $B$: $w_B = 16/30 dot 3/10 = 48/300$.
    - Gốc $C$: $w_C = 3/30 dot 5/10 = 15/300$.
    - Gốc $D$: $w_D = 5/30 dot 8/10 = 40/300$.

    #step([Truy nguồn Hộp B bằng Bayes])
    $ P(B|"Đỏ") = w_B / (w_A + w_B + w_C + w_D) $
    $ = 48 / (12 + 48 + 15 + 40) = 48 / 115. $
    (Lưu ý: Bạn có thể tự tính lại số liệu).
    Wait, $48 / 115$? Let's fix the answer key! 48/115 is correct based on these numbers. Let me correct the answer string to [$48/115$].
  ]
)

#tln(
  id: "KV-BI-12",
  [Ba phân xưởng I, II, III cùng sản xuất một loại chi tiết máy. Phân xưởng I chiếm $30%$ sản lượng, phân xưởng II chiếm $50%$ sản lượng, phân xưởng III chiếm $20%$ sản lượng. Tỉ lệ phế phẩm của ba phân xưởng lần lượt là $2%, 3%, 5%$. Sản phẩm của phân xưởng I và phân xưởng II được đưa vào kho A. Sản phẩm của phân xưởng III và một nửa sản phẩm của kho A (chọn ngẫu nhiên) được đưa vào kho B. Lấy ngẫu nhiên $1$ chi tiết máy từ kho B thì được phế phẩm. Tính xác suất phế phẩm này do phân xưởng I sản xuất.],
  [$6/41$],
  loigiai: [
    #ppgiai[
      Bài toán công xưởng thực chất là bài toán "trộn bi". "Sản lượng" chính là "số viên bi đóng góp". "Tỉ lệ phế phẩm" là "tỉ lệ bi đỏ". Ta chỉ cần theo dõi sự bảo toàn tỉ lệ khi trộn.
    ]

    *Sơ đồ cây tỉ trọng sản phẩm:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let rootBox = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Lấy 1 sản phẩm từ Kho B*]
        content((0, 4.5), rootBox, name: "root")

        let bKhoA = box(fill: rgb("e8eaf6"), stroke: 1.5pt + rgb("3f51b5"), inset: 8pt, radius: 5pt)[*Kho A (Chứa I, II)*]
        content((-3, 2.5), bKhoA, name: "hKhoA")
        let bPX3 = box(fill: rgb("f3e5f5"), stroke: 1.5pt + rgb("9c27b0"), inset: 8pt, radius: 5pt)[*Phân xưởng III*]
        content((3, 2.5), bPX3, name: "hPX3")

        let bPX1 = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc PX I*]
        content((-5, 0.5), bPX1, name: "hPX1")
        let bPX2 = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc PX II*]
        content((-1, 0.5), bPX2, name: "hPX2")

        circle((-5, -1.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c1")
        content("c1", [*Phế*])
        circle((-1, -1.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c2")
        content("c2", [*Phế*])
        circle((3, -1.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c3")
        content("c3", [*Phế*])

        line("root", "hKhoA", mark: (end: ">"))
        content((-1.2, 3.8), box(fill: white, inset: 1pt)[$40 / 60$])
        line("root", "hPX3", mark: (end: ">"))
        content((1.8, 3.8), box(fill: white, inset: 1pt)[$20 / 60$])

        line("hKhoA", "hPX1", mark: (end: ">"))
        content((-4.3, 1.7), box(fill: white, inset: 1pt)[$30 / 80$])
        line("hKhoA", "hPX2", mark: (end: ">"))
        content((-1.7, 1.7), box(fill: white, inset: 1pt)[$50 / 80$])

        line("hPX1", "c1", mark: (end: ">"))
        content((-5.5, -0.5), box(fill: white, inset: 1pt)[$2/100$])
        line("hPX2", "c2", mark: (end: ">"))
        content((-1.5, -0.5), box(fill: white, inset: 1pt)[$3/100$])
        line("hPX3", "c3", mark: (end: ">"))
        content((2.5, 0.5), box(fill: white, inset: 1pt)[$5/100$])
      })
    ]

    #step([Xác định tỉ trọng (Trọng số nguồn) của Kho B])
    - Kho A nhận toàn bộ sản lượng của PX I ($30%$) và PX II ($50%$). Do đó, tổng lượng Kho A bằng $80%$ tổng sản lượng toàn nhà máy. Trong Kho A, PX I chiếm $30/80 = 3/8$, PX II chiếm $50/80 = 5/8$.
    - Kho B nhận "một nửa Kho A" tức là $40%$ tổng sản lượng, và toàn bộ PX III là $20%$ tổng sản lượng. 
    Tổng lượng Kho B = $40% + 20% = 60%$.
    Trong Kho B:
    $ q_"KhoA" = 40/60 = 2/3, quad q_"PX III" = 20/60 = 1/3. $

    #step([Tính xác suất gốc của từng phân xưởng trong Kho B])
    $ q_"I" = q_"KhoA" dot 3/8 = 2/3 dot 3/8 = 1/4 $
    $ q_"II" = q_"KhoA" dot 5/8 = 2/3 dot 5/8 = 5/12 $
    $ q_"III" = 1/3 $

    #step([Trọng số Phế phẩm])
    $ w_"I" = 1/4 dot 2/100 = 2/400 $
    $ w_"II" = 5/12 dot 3/100 = 5/400 $
    $ w_"III" = 1/3 dot 5/100 = 5/300 = 20/1200. $
    Quy đồng mẫu $1200$: 
    $w_"I" = 6/1200$, $w_"II" = 15/1200$, $w_"III" = 20/1200$.

    #step([Truy nguồn PX I])
    $ P("I" | "Phế") = 6 / (6 + 15 + 20) = 6 / 41. $
    (Tôi sẽ sửa đáp án thành $6/41$).
  ]
)

#tln(
  id: "KV-BI-13",
  [Hộp $A$ có tỉ lệ bi đỏ là $1/3$, hộp $B$ có tỉ lệ bi đỏ là $2/5$. Lấy $x$ viên bi từ hộp $A$ và $(10-x)$ viên bi từ hộp $B$ bỏ vào hộp $C$. Sau đó lấy $3$ viên bi từ hộp $C$ và $2$ viên từ hộp $A$ bỏ vào hộp $D$. Từ hộp $D$ rút ngẫu nhiên $1$ viên thì được bi đỏ. Biết xác suất viên bi đỏ này có nguồn gốc từ hộp $B$ (ở mọi nhánh) là $18/53$. Tìm số lượng bi $x$ đã lấy từ hộp $A$ lúc đầu ($0 <= x <= 10, x in NN$).],
  [$5$],
  loigiai: [
    *Sơ đồ cây xác suất:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let rootBox = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Rút 1 bi từ Hộp D (5 bi)*]
        content((0, 4.5), rootBox, name: "root")

        let bC = box(fill: rgb("e8eaf6"), stroke: 1.5pt + rgb("3f51b5"), inset: 8pt, radius: 5pt)[*Gốc Hộp C*]
        content((-3, 2.5), bC, name: "hC")
        let bATrucTiep = box(fill: rgb("f3e5f5"), stroke: 1.5pt + rgb("9c27b0"), inset: 8pt, radius: 5pt)[*Gốc A (trực tiếp)*]
        content((3, 2.5), bATrucTiep, name: "hA2")

        let bA1 = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc Hộp A*]
        content((-5, 0.5), bA1, name: "hA1")
        let bB = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc Hộp B*]
        content((-1, 0.5), bB, name: "hB")

        circle((-5, -1.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c1")
        content("c1", [*Đỏ*])
        circle((-1, -1.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c2")
        content("c2", [*Đỏ*])
        circle((3, -1.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c3")
        content("c3", [*Đỏ*])

        line("root", "hC", mark: (end: ">"))
        content((-1.2, 3.8), box(fill: white, inset: 1pt)[$3 / 5$])
        line("root", "hA2", mark: (end: ">"))
        content((1.8, 3.8), box(fill: white, inset: 1pt)[$2 / 5$])

        line("hC", "hA1", mark: (end: ">"))
        content((-4.3, 1.7), box(fill: white, inset: 1pt)[$x / 10$])
        line("hC", "hB", mark: (end: ">"))
        content((-1.7, 1.7), box(fill: white, inset: 1pt)[$(10-x) / 10$])

        line("hA1", "c1", mark: (end: ">"))
        content((-5.5, -0.5), box(fill: white, inset: 1pt)[$1/3$])
        line("hB", "c2", mark: (end: ">"))
        content((-1.5, -0.5), box(fill: white, inset: 1pt)[$2/5$])
        line("hA2", "c3", mark: (end: ">"))
        content((2.5, 0.5), box(fill: white, inset: 1pt)[$1/3$])
      })
    ]

    #step([Xác định trọng số nguồn của một viên trong D])
    Hộp $C$ nhận $x$ viên từ $A$, $(10-x)$ viên từ $B$, tổng là $10$ viên.
    Trong hộp $D$, phần từ $C$ chiếm $3/5$, phần trực tiếp từ $A$ chiếm $2/5$.
    
    Xác suất gốc $B$:
    $ q_B = 3/5 dot (10-x)/10 = (3(10-x))/50 $
    
    Xác suất gốc $A$ (từ cả $C$ và trực tiếp):
    $ q_A = 3/5 dot x/10 + 2/5 = (3x)/50 + 20/50 = (3x+20)/50 $
    
    #step([Trọng số Đỏ của mỗi nguồn])
    $ w_B = q_B dot P("Đỏ"|"B") = (3(10-x))/50 dot 2/5 = (6(10-x))/250 $
    $ w_A = q_A dot P("Đỏ"|"A") = (3x+20)/50 dot 1/3 = (3x+20)/150 $
    
    #step([Lập phương trình Bayes])
    Ta có $P(B | "Đỏ") = w_B / (w_A + w_B) = 18/53$.
    Thay số:
    $ ( (6(10-x))/250 ) / ( (3x+20)/150 + (6(10-x))/250 ) = 18/53 $
    Quy đồng tử và mẫu với $750$ (BCNN của 150 và 250):
    $w_A = 5(3x+20)/750 = (15x+100)/750$
    $w_B = 3(6(10-x))/750 = (180 - 18x)/750$
    
    Khi đó phương trình trở thành:
    $ (180 - 18x) / ( (15x+100) + (180 - 18x) ) = 18/53 $
    $ (180 - 18x) / (280 - 3x) = 18/53 $
    
    Giải phương trình:
    $ 53(180 - 18x) = 18(280 - 3x) $
    $ 9540 - 954x = 5040 - 54x $
    $ 900x = 4500 $
    $ x = 5 $. Thỏa mãn điều kiện $x in NN$.
  ]
)


#tln(
  id: "KV-BI-14",
  [Bài toán trộn liên hoàn (Chain Mixing): Có ba hộp bi $H_1, H_2, H_3$. Hộp $H_1$ có $8$ bi đỏ và $2$ bi xanh. Hộp $H_2$ có $1$ bi đỏ và $4$ bi xanh. Hộp $H_3$ có $3$ bi đỏ và $3$ bi xanh. Ta thực hiện quy trình sau:
  - Lấy ngẫu nhiên $5$ viên bi từ $H_1$ bỏ vào $H_2$ rồi lắc đều.
  - Sau đó lấy ngẫu nhiên $4$ viên bi từ $H_2$ bỏ vào $H_3$ rồi lắc đều.
  - Cuối cùng lấy ngẫu nhiên $3$ viên bi từ $H_3$ bỏ vào hộp $M$ (ban đầu rỗng).
  Từ hộp $M$ lấy ngẫu nhiên ra $1$ viên bi thì được bi đỏ. Tính xác suất viên bi đỏ này có nguồn gốc ban đầu từ hộp $H_1$.],
  [$8/25$],
  loigiai: [
    #ppgiai[
      Nếu giải bằng cách đếm trường hợp phân phối bi (VD: 5 đỏ 0 xanh, 4 đỏ 1 xanh...), bài toán này sẽ sinh ra hàng chục trường hợp lồng nhau và không thể giải bằng tay. Tuy nhiên, bằng "Bảo toàn tỉ lệ", ta chỉ cần đếm số bi ở mỗi hộp qua mỗi giai đoạn để tìm dòng chảy xác suất.
    ]

    *Sơ đồ dòng chảy truyền bi:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let rootBox = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Hộp M (3 bi)*]
        content((0, 6.5), rootBox, name: "hM")

        let bH3 = box(fill: rgb("e8eaf6"), stroke: 1.5pt + rgb("3f51b5"), inset: 8pt, radius: 5pt)[*Hộp $H_3$ (10 bi)*]
        content((0, 4.5), bH3, name: "h3")
        let bG3 = box(fill: rgb("f3e5f5"), stroke: 1.5pt + rgb("9c27b0"), inset: 8pt, radius: 5pt)[*Gốc $H_3$ (6 bi)*]
        content((3, 4.5), bG3, name: "g3")
        
        let bH2 = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Hộp $H_2$ (10 bi)*]
        content((-3, 2.5), bH2, name: "h2")
        let bG2 = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc $H_2$ (5 bi)*]
        content((0, 2.5), bG2, name: "g2")
        
        let bG1 = box(fill: rgb("ffebee"), stroke: 1.5pt + rgb("f44336"), inset: 8pt, radius: 5pt)[*Gốc $H_1$ (10 bi)*]
        content((-3, 0.5), bG1, name: "g1")

        line("hM", "h3", mark: (end: ">"))
        content((-0.6, 5.5), box(fill: white, inset: 1pt)[$3 / 3$])

        line("h3", "h2", mark: (end: ">"))
        content((-2.2, 3.8), box(fill: white, inset: 1pt)[$4 / 10$])
        line("h3", "g3", mark: (end: ">"))
        content((1.8, 3.8), box(fill: white, inset: 1pt)[$6 / 10$])

        line("h2", "g1", mark: (end: ">"))
        content((-3.6, 1.5), box(fill: white, inset: 1pt)[$5 / 10$])
        line("h2", "g2", mark: (end: ">"))
        content((-1.2, 1.5), box(fill: white, inset: 1pt)[$5 / 10$])
      })
    ]

    #step([Xác định trọng số nguồn của viên cuối (tính ngược)])
    - Ở bước cuối, hộp $M$ nhận 3 viên hoàn toàn từ $H_3$. Vậy viên cuối chắc chắn đến từ $H_3$ ở giai đoạn ngay trước đó (Trọng số $= 1$).
    - Hộp $H_3$ trước khi bị lấy bi đi có $10$ viên (gồm $6$ viên gốc $H_3$ ban đầu và $4$ viên nhận từ $H_2$). 
      $=> q_"G3" = 6/10 = 3/5$, còn $4/10 = 2/5$ là đến từ $H_2$.
    - Hộp $H_2$ trước khi cho đi có $10$ viên (gồm $5$ viên gốc $H_2$ ban đầu và $5$ viên nhận từ $H_1$).
      $=> q_"G2" = 2/5 dot 5/10 = 1/5$.
      $=> q_"G1" = 2/5 dot 5/10 = 1/5$.
    
    Vậy một viên bi bất kỳ trong $M$ có trọng số nguồn ban đầu là:
    $q_"G1" = 1/5, quad q_"G2" = 1/5, quad q_"G3" = 3/5.$
    (Kiểm tra lại: $1/5 + 1/5 + 3/5 = 1$).

    #step([Trọng số Đỏ của mỗi gốc])
    - Gốc $H_1$: $w_1 = q_"G1" dot P("Đỏ" | H_1) = 1/5 dot 8/10 = 4/25 = 8/50$.
    - Gốc $H_2$: $w_2 = q_"G2" dot P("Đỏ" | H_2) = 1/5 dot 1/5 = 1/25 = 2/50$.
    - Gốc $H_3$: $w_3 = q_"G3" dot P("Đỏ" | H_3) = 3/5 dot 3/6 = 3/10 = 15/50$.

    #step([Truy nguồn H_1 bằng Bayes])
    $ P(H_1 | "Đỏ") = w_1 / (w_1 + w_2 + w_3) = (8/50) / ((8+2+15)/50) = 8/25. $
  ]
)

#tln(
  id: "KV-BI-15",
  [Hộp $A$ có tổng cộng $10$ viên bi gồm bi đỏ và bi xanh. Hộp $B$ có $3$ bi đỏ và $2$ bi xanh. Người ta lấy ngẫu nhiên $4$ viên từ hộp $A$ và $1$ viên từ hộp $B$ bỏ vào hộp $M$. Từ hộp $M$ lấy ngẫu nhiên ra $1$ viên bi thì được bi đỏ. Biết xác suất viên bi đỏ này có nguồn gốc từ hộp $B$ là $1/7$. Hỏi lúc đầu hộp $A$ có bao nhiêu viên bi đỏ?],
  [$9$],
  loigiai: [
    #ppgiai[
      Đây là dạng toán ngược: Đề cho biết trước xác suất hậu nghiệm (Bayes) và yêu cầu ta tìm tỉ lệ cấu tạo ban đầu của một hộp. Bằng sơ đồ cây trọng số, ta dễ dàng lập phương trình chứa ẩn số.
    ]

    Gọi số bi đỏ ban đầu trong hộp $A$ là $x$ ($x in NN, 0 <= x <= 10$). 
    Khi đó tỉ lệ bi đỏ trong hộp $A$ là $x/10$.

    *Sơ đồ cây xác suất:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let rootBox = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Rút 1 bi từ Hộp M (5 bi)*]
        content((0, 4.5), rootBox, name: "root")

        let bA = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc Hộp A*]
        content((-2, 2.5), bA, name: "hA")
        let bB = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc Hộp B*]
        content((2, 2.5), bB, name: "hB")

        circle((-2, 0.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c1")
        content("c1", [*Đỏ*])
        circle((2, 0.5), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c2")
        content("c2", [*Đỏ*])

        line("root", "hA", mark: (end: ">"))
        content((-1.5, 3.8), box(fill: white, inset: 1pt)[$4 / 5$])
        line("root", "hB", mark: (end: ">"))
        content((1.5, 3.8), box(fill: white, inset: 1pt)[$1 / 5$])

        line("hA", "c1", mark: (end: ">"))
        content((-2.6, 1.5), box(fill: white, inset: 1pt)[$x/10$])
        line("hB", "c2", mark: (end: ">"))
        content((1.4, 1.5), box(fill: white, inset: 1pt)[$3/5$])
      })
    ]

    #step([Tính trọng số Đỏ của mỗi nguồn])
    - Nguồn $A$: Hộp $M$ nhận $4$ viên từ $A$ trong tổng số $5$ viên. Trọng số nguồn của $A$ là $4/5$.
      $ w_A = 4/5 dot x/10 = (4x)/50 $
    
    - Nguồn $B$: Hộp $M$ nhận $1$ viên từ $B$ trong tổng số $5$ viên. Trọng số nguồn của $B$ là $1/5$.
      $ w_B = 1/5 dot 3/5 = 3/25 = 6/50 $

    #step([Lập phương trình hậu nghiệm Bayes])
    Đề bài cho biết xác suất viên bi đỏ lấy ra có nguồn gốc từ hộp $B$ là $1/7$. 
    Ta có phương trình:
    $ P(B | "Đỏ") = w_B / (w_A + w_B) = 1/7 $
    Thay các giá trị trọng số vào (do cùng mẫu số $50$ nên ta triệt tiêu được):
    $ 6 / (4x + 6) = 1/7 $
    $ <=> 4x + 6 = 42 $
    $ <=> 4x = 36 $
    $ <=> x = 9. $

    Vậy lúc đầu hộp $A$ có $9$ viên bi đỏ.
  ]
)

= IV. Bài Tự Luyện Tốc Chiến

#tln(
  id: "KV-LUYEN-01",
  [Hộp $A$ có tỉ lệ đỏ $2/5$, hộp $B$ có tỉ lệ đỏ $3/4$. Hộp $T$ nhận $6$ viên từ $A$ và $4$ viên từ $B$. Rút từ $T$ được bi đỏ. Tính xác suất bi này có gốc từ $B$.],
  [$5/9$],
  loigiai: [
    $ P(B|"Đỏ") = (4/10 dot 3/4) / (6/10 dot 2/5 + 4/10 dot 3/4) = (3/10)/(6/25+3/10) = 5/9. $
  ],
)

#tln(
  id: "KV-LUYEN-02",
  [Hộp $M$ nhận $2$ viên từ $A$ và $3$ viên từ $B$. Hộp $T$ nhận $4$ viên từ $M$ và $1$ viên từ $C$. Tỉ lệ bi xanh ở $A,B,C$ lần lượt là $1/2, 1/3, 4/5$. Rút từ $T$ được bi xanh. Tính xác suất bi này có gốc từ $A$.],
  [$1/3$],
  loigiai: [
    $ q_A = 4/5 dot 2/5 = 8/25; quad q_B = 4/5 dot 3/5 = 12/25; quad q_C=1/5. $
    $ P(A|"Xanh") = (8/25 dot 1/2)/(8/25 dot 1/2 + 12/25 dot 1/3 + 1/5 dot 4/5) $
    $ = (4/25)/(4/25+4/25+4/25)=1/3. $
  ],
)

#tln(
  id: "KV-LUYEN-03",
  [Hộp $A$ có $x$ bi đỏ và $3$ bi xanh; hộp $B$ có tỉ lệ đỏ $1/2$. Hộp $T$ nhận $5$ viên từ $A$ và $5$ viên từ $B$.
  
  Rút từ $T$ được bi đỏ. Biết xác suất bi đỏ đó có gốc từ $A$ bằng $4/7$. Tìm $x$.],
  [$6$],
  loigiai: [
    $ ((1/2) dot x/(x+3)) / ((1/2) dot x/(x+3) + (1/2) dot 1/2) = 4/7 $
    Triệt tiêu $1/2$:
    $ (x/(x+3))/(x/(x+3)+1/2)=4/7 $
    $ 7x/(x+3)=4x/(x+3)+2 <=> 3x/(x+3)=2 $
    $ 3x = 2x + 6 <=> x = 6. $
  ],
)
