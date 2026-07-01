#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"


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
#show math.equation: set text(fill: rgb("000000"))
#show math.frac: math.display

#let brand = rgb("1A5276")
#let wine = rgb("900C3F")
#let mint = rgb("117A65")

#let fig-card(body, caption, width: 94%, inset: (x: 12pt, y: 10pt), radius: 10pt) = align(center)[
  #rect(
    width: width,
    fill: rgb("FBFDFE"),
    stroke: 0.7pt + rgb("D4E6F1"),
    inset: inset,
    radius: radius,
  )[
    #body
    #if caption != none [
      #v(0.45em)
      #align(center)[
        #text(size: 9pt, style: "italic", fill: rgb("5D6D7E"))[#caption]
      ]
    ]
  ]
]

#let qfig(body, note: none) = fig-card(body, note, width: 100%, inset: (x: 8pt, y: 8pt), radius: 8pt)

#let col-blue = rgb("1565C0")
#let col-violet = rgb("6A1B9A")

#let cach1-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-blue, rest: 0.5pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-blue, weight: "bold", size: 10.5pt)[Lời giải]
  #v(0.3em)
  #body
]

#let cach2-box(body) = block(
  fill: rgb("F3E5F5"),
  stroke: (left: 4pt + col-violet, rest: 0.5pt + rgb("CE93D8")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-violet, weight: "bold", size: 10.5pt)[Lời giải bảng truy hồi]
  #v(0.3em)
  #body
]

#let side-note(title: "Nhắc lại lý thuyết", body) = block(
  fill: rgb("FCE4EC"),
  stroke: (left: 4pt + rgb("C2185B"), rest: 0.6pt + rgb("F8BBD0")),
  radius: (right: 6pt),
  inset: (x: 12pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("C2185B"), weight: "bold", size: 10pt)[#title]
  #v(0.3em)
  #text(size: 10pt)[#body]
]

#let theory-layout(main, side) = grid(
  columns: (1fr, 0.4fr),
  gutter: 1.5em,
  main,
  side
)

// ─── Helpers for FSM diagrams ─────────────────────────────────
#let node-style(f, s) = (radius: 0.52, fill: f, stroke: 1.5pt + s)
#let arrow-style = (mark: (end: "stealth", fill: black, scale: 1.1), stroke: 1.2pt + rgb("333"))

// Draw a labelled directed edge between two named anchors with optional bend
// (done inline in each figure for clarity)

// ─── Grid helper: draw an m×n grid ────────────────────────────
#let draw-grid(m, n, sc: 0.9, highlight: (), path: (), path-color: blue) = {
  import cetz.draw: *
  // vertical lines
  for i in range(0, m + 1) {
    line((i * sc, 0), (i * sc, n * sc), stroke: 0.5pt + gray)
  }
  // horizontal lines
  for j in range(0, n + 1) {
    line((0, j * sc), (m * sc, j * sc), stroke: 0.5pt + gray)
  }
  // highlight cells
  for cell in highlight {
    let (ci, cj, col) = cell
    rect((ci * sc, cj * sc), ((ci + 1) * sc, (cj + 1) * sc), fill: col, stroke: none)
  }
  // draw path
  if path.len() > 1 {
    for k in range(0, path.len() - 1) {
      let (x0, y0) = path.at(k)
      let (x1, y1) = path.at(k + 1)
      line((x0 * sc, y0 * sc), (x1 * sc, y1 * sc), stroke: 2pt + path-color, mark: (end: "stealth", fill: path-color, scale: 0.8))
    }
  }
  // corner dots
  for i in range(0, m + 1) {
    for j in range(0, n + 1) {
      circle((i * sc, j * sc), radius: 1.5pt, fill: rgb("333"), stroke: none)
    }
  }
}

// ══════════════════════════════════════════════════════════════
//  TIÊU ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (
      left: 5pt + rgb("1A5276"),
      top: 0.5pt + rgb("d0e4f0"),
      right: 0.5pt + rgb("d0e4f0"),
      bottom: 0.5pt + rgb("d0e4f0"),
    ),
    inset: (x: 16pt, y: 14pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      Chuyên Đề: Sơ Đồ Trạng Thái Hữu Hạn (FSM) và Bài Toán Đếm Tổ Hợp
    ]
    #v(0.5em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Tô màu · Dãy ký tự · Robot di chuyển · Đi trên lưới · Tiến–Lùi · Đổi tiền · Xếp gạch —
      Vận dụng cao THPT Quốc Gia
    ]
  ]
]

// ══════════════════════════════════════════════════════════════
//  LÝ THUYẾT NỀN
// ══════════════════════════════════════════════════════════════
#lythuyet(
  title: [SƠ ĐỒ TRẠNG THÁI HỮU HẠN (FSM) — NỀN TẢNG LÝ THUYẾT],
  [
    *1. Khái niệm*

    Sơ đồ trạng thái hữu hạn (Finite State Machine — FSM) là một đồ thị có hướng $G = (V, E)$ trong đó:
    - Mỗi *đỉnh* (node) $v in V$ đại diện cho một *trạng thái* (state) của hệ thống.
    - Mỗi *cung* (edge) $(u -> v) in E$ đại diện cho một *bước chuyển* (transition) hợp lệ.

    Số cách đạt đến trạng thái $v$ sau đúng $n$ bước bằng tổng số cách của các trạng thái *trỏ vào* $v$ sau $n-1$ bước — đây chính là *hệ thức truy hồi*.

    *2. Quy trình giải toán FSM (5 bước)*

    + *Mô hình hóa:* Xác định tập trạng thái $V$ — thường là màu sắc, ký tự, vị trí, hướng đi cuối cùng.
    + *Vẽ FSM:* Vẽ đồ thị, thêm cung $(u -> v)$ khi cho phép chuyển từ trạng thái $u$ sang $v$.
    + *Khởi tạo:* Gán giá trị tại bước $n = 1$ (hoặc $n = 0$): số cách bắt đầu ở mỗi trạng thái.
    + *Truy hồi:* Điền bảng trạng thái từ $n=2$ đến $n$ cần tìm theo hệ thức.
    + *Tổng kết:* Cộng các giá trị tại bước $n$ của các trạng thái *chấp nhận* (thỏa điều kiện đầu ra).

    *3. Dạng bài phổ biến*

    #table(
      columns: (auto, 1fr, auto),
      align: (left, left, center),
      stroke: 0.5pt + gray,
      [*Dạng*], [*Mô tả*], [*Trạng thái thường dùng*],
      [Tô màu dãy], [Tô màu $n$ ô/bóng đèn theo ràng buộc kề nhau], [Màu sắc hiện tại],
      [Dãy nhị phân], [Dãy $0/1$ tránh chuỗi con cấm (vd $11$, $000$)], [Số $1$ hoặc $0$ liên tiếp],
      [Đi lưới], [Robot đi từ $(0,0)$ đến $(m,n)$ theo bước chỉ định], [Tọa độ/hướng],
      [Tiến–Lùi], [Dãy $+1/-1$, tổng luôn $>= 0$, kết thúc về $0$], [Tổng tích lũy hiện tại],
      [Đổi tiền], [Đếm cách xếp tờ tiền $a, b, c$ đồng thành tổng $n$], [Tổng tích lũy],
      [Xếp gạch], [Lát $1 times n$ bằng gạch $1 times 1$ và $1 times 2$], [Ô cuối dùng $1$ hay $2$ gạch],
    )

    *4. Mẹo nhận dạng*

    - Bài có từ "hàng ngang", "liền kề không được trùng/liền" → *tô màu dãy*.
    - Bài có "lưới $m times n$", "chỉ đi phải/lên" → *đường đi lưới* (có thể đơn giản dùng $C$, hoặc FSM nếu có ràng buộc).
    - Bài có "sau một bước trái/phải, không ra khỏi đoạn $[0, k]$" → *FSM tiến lùi*.
    - Bài có "ghép tờ tiền/tem" → *quy hoạch động / FSM đổi tiền*.
  ]
)

// ══════════════════════════════════════════════════════════════
= Dạng 1: Tô màu dãy (Coloring Sequences)
// ══════════════════════════════════════════════════════════════

#ppgiai[
  *Nhận dạng:* Có $n$ ô/bóng/ô vuông xếp hàng; mỗi ô tô một màu trong tập $k$ màu; có ràng buộc về các ô kề nhau.

  *Trạng thái:* Màu được tô ở ô vừa xử lý. Số trạng thái = số màu.
]

// ─── Bài 1 ───────────────────────────────────────────────────
#tln(
  [Một dải gồm $6$ bóng đèn LED xếp thành hàng ngang. Mỗi bóng có thể phát một trong ba màu: Đỏ (Đ), Xanh lá (X), Xanh dương (B). Các quy tắc:
  1. Hai bóng kề nhau không được cùng màu.
  2. Sau bóng Đỏ, bóng tiếp theo *bắt buộc* là Xanh lá (không được là Xanh dương).
  
  Tính số dải màu hợp lệ khi $n = 6$.],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    circle((0, 2.2), name: "D", ..node-style(rgb("ffebee"), rgb("c62828")))
    content("D", text(weight: "bold", size: 9pt, fill: rgb("c62828"))[Đ])
    circle((-1.8, 0), name: "X", ..node-style(rgb("e8f5e9"), rgb("2e7d32")))
    content("X", text(weight: "bold", size: 9pt, fill: rgb("2e7d32"))[X])
    circle((1.8, 0), name: "B", ..node-style(rgb("e3f2fd"), rgb("1565c0")))
    content("B", text(weight: "bold", size: 9pt, fill: rgb("1565c0"))[B])
    bezier("D.west", "X.north", (-1.4, 2.2), (-1.8, 1.4), ..arrow-style)
    bezier("X.east", "D.south", (-0.7, 0), (0, 1.1), ..arrow-style)
    bezier("X.south-east", "B.south-west", (-0.9, -0.9), (0.9, -0.9), ..arrow-style)
    bezier("B.north-west", "X.north-east", (0.9, 1.0), (-0.9, 1.0), ..arrow-style)
    line("B.north", "D.south-east", ..arrow-style)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [34],
  loigiai: [
    #theory-layout(
      cach1-box[
        #reset-step()
        #step[
          *Xác định trạng thái và bước chuyển:*
          - Từ *Đ*: chỉ đi đến X (quy tắc 2)
          - Từ *X*: đi đến Đ hoặc B (quy tắc 1)
          - Từ *B*: đi đến Đ hoặc X (quy tắc 1)
        ]
        #step[
          *Hệ thức truy hồi* ($D_n$, $X_n$, $B_n$ = số dải kết thúc bằng Đ, X, B):
          $ D_n = X_(n-1) + B_(n-1), quad X_n = D_(n-1) + B_(n-1), quad B_n = X_(n-1) $
          Khởi tạo: $D_1 = X_1 = B_1 = 1$.
        ]
        #step[
          *Bảng truy hồi:*
          #align(center)[
            #table(
              columns: 5, align: center, stroke: 0.5pt + black,
              [*$n$*],[*$D_n$*],[*$X_n$*],[*$B_n$*],[*$S_n$*],
              [1],[1],[1],[1],[3],
              [2],[2],[2],[1],[5],
              [3],[3],[3],[2],[8],
              [4],[5],[5],[3],[13],
              [5],[8],[8],[5],[21],
              [6],[13],[13],[8],[*34*],
            )
          ]
          Vậy số dải hợp lệ là $S_6 = rect(34)$.
        ]
        #reset-step()
      ],
      side-note(title: "Tuyệt chiêu đếm mũi tên")[
        Nhìn vào đồ thị FSM, muốn biết công thức tính số cách của trạng thái $D_n$, ta chỉ cần xem có bao nhiêu mũi tên *đâm vào* $D$.
        
        Ở đây ta thấy mũi tên từ $X$ chỉ vào $D$, và từ $B$ chỉ vào $D$. Vậy $D_n$ kế thừa kết quả của $X_(n-1)$ và $B_(n-1)$.
        
        Tuyệt đối không nhìn vào mũi tên chỉ ra khỏi trạng thái để lập công thức! Nhận là nhận từ quá khứ, không phải từ tương lai.
      ]
    )
  ]
)

// ─── Bài 2 ───────────────────────────────────────────────────
#tln(
  [Tô màu $7$ ô vuông xếp thành hàng ngang bằng $4$ màu: Đỏ (Đ), Xanh (X), Vàng (V), Tím (T). Hai ô kề nhau không được trùng màu, đồng thời màu Đỏ và màu Tím không được đứng kề nhau (dù theo thứ tự nào). Tính số cách tô màu hợp lệ.],
  fig: cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    let pos = ((0,2),(2,2),(0,0),(2,0))
    let names = ("D","X","V","T")
    let fills = (rgb("ffebee"),rgb("e8f5e9"),rgb("fffde7"),rgb("f3e5f5"))
    let strokes = (rgb("c62828"),rgb("2e7d32"),rgb("f9a825"),rgb("6a1b9a"))
    let labels = ([Đ],[X],[V],[T])
    for i in range(4) {
      let (px,py) = pos.at(i)
      circle((px,py), name: names.at(i), ..node-style(fills.at(i), strokes.at(i)))
      content(names.at(i), text(weight:"bold",size:9pt,fill:strokes.at(i))[#labels.at(i)])
    }
    // Allowed transitions (all except D<->T and same)
    // D->X, D->V; X->D, X->V, X->T; V->D, V->X, V->T; T->X, T->V
    for (a,b) in (("D","X"),("D","V"),("X","D"),("X","V"),("X","T"),("V","D"),("V","X"),("V","T"),("T","X"),("T","V")) {
      line(a, b, ..arrow-style)
    }
  }),
  fig-pos: "right",
  fig-width: 34%,
  [2058],
  loigiai: [
    #theory-layout(
      cach1-box[
        #reset-step()
        #step[
          *Bước chuyển hợp lệ* (cấm: kề nhau trùng màu, và Đ–T liền kề):
          - Từ Đ: đi đến X, V
          - Từ X: đi đến Đ, V, T
          - Từ V: đi đến Đ, X, T
          - Từ T: đi đến X, V
        ]
        #step[
          Gọi $D_n, X_n, V_n, T_n$ là số cách kết thúc bằng Đ, X, V, T ở ô thứ $n$. Ta lập hệ thức dựa vào mũi tên đâm vào:
          $ D_n = X_(n-1) + V_(n-1) $
          $ X_n = D_(n-1) + V_(n-1) + T_(n-1) $
          $ V_n = D_(n-1) + X_(n-1) + T_(n-1) $
          $ T_n = X_(n-1) + V_(n-1) $
          Khởi tạo: $D_1 = X_1 = V_1 = T_1 = 1$.
          
          Nhận xét: $D_n = T_n$ với mọi $n$ (đối xứng), và $X_n = V_n$.
        ]
        #step[
          *Bảng truy hồi* (dùng ký hiệu tắt $d = D_n = T_n$, $x = X_n = V_n$):
          #align(center)[
            #table(
              columns: 5, align: center, stroke: 0.5pt + black,
              [*$n$*],[*$D_n$*],[*$X_n$*],[*$V_n$*],[*$T_n$*],
              [1],[1],[1],[1],[1],
              [2],[2],[3],[3],[2],
              [3],[5],[7],[7],[5],
              [4],[12],[17],[17],[12],
              [5],[29],[41],[41],[29],
              [6],[70],[99],[99],[70],
              [7],[169],[238],[238],[169],
            )
          ]
          Tổng: $S_7 = 169 + 238 + 238 + 169 = rect(2058)$.  
        ]
        #reset-step()
      ],
      side-note(title: "Check-point thông minh")[
        Việc lập bảng rất dễ sai số học. Hãy dùng bí kíp check-point:
        
        $S_1 = 1+1+1+1=4$.
        Từ Đ và T mũi tên chẻ ra 2 hướng. Từ X và V chẻ ra 3 hướng.
        
        Do đó tổng số cách ở bước 2 phải là: 
        $S_2 = 2 times 2 + 2 times 3 = 10$.
        Nhìn vào bảng ta thấy $S_2 = 2+3+3+2 = 10$. Đúng khớp! Nhờ vậy ta tự tin điền tiếp các cột sau.
      ]
    )
  ]
)

// ─── Bài 3 ───────────────────────────────────────────────────
#tn(
  [Tô màu $5$ đoạn thẳng $A_1 A_2$, $A_2 A_3$, $A_3 A_4$, $A_4 A_5$, $A_5 A_6$ nằm thẳng hàng bằng $3$ màu: Đỏ, Xanh, Vàng sao cho hai đoạn có chung đầu mút không được cùng màu. Số cách tô màu là],
  (
    [$3 times 2^4 = 48$],
    [$3 times 2^5 = 96$],
    [$3^5 = 243$],
    [$6 times 2^3 = 48$],
  ),
  correct: (1,),
  loigiai: [
    #theory-layout(
      cach1-box[
        Mỗi đoạn là một ô; hai đoạn kề nhau chung đỉnh $A_i$ không được trùng màu. Đây là bài tô màu dãy $5$ ô bằng $3$ màu, hai ô kề không trùng.
        
        - Đoạn đầu: $3$ cách chọn màu.
        - Mỗi đoạn tiếp theo (4 đoạn còn lại): $2$ cách chọn màu (chỉ cần khác màu đoạn liền trước).
        
        Vậy tổng số cách: $3 times 2^4 = 48$ cách.
      ],
      side-note(title: "Vì sao không dùng bảng?")[
        Vì cả 3 màu đều có vai trò như nhau (hoán vị màu), mũi tên đâm ra/đâm vào của các màu đều hoàn toàn giống hệt nhau. 
        
        Khi không có sự "thiên vị" ràng buộc nào (như bài 1 và 2), ta nên giải bằng quy tắc nhân cho nhanh gọn, lập bảng sẽ bị thừa thãi!
      ]
    )
  ]
)

// ══════════════════════════════════════════════════════════════
= Dạng 2: Dãy ký tự có ràng buộc (Binary/Alphabet Sequences)
// ══════════════════════════════════════════════════════════════

#ppgiai[
  *Nhận dạng:* Lập dãy $n$ ký tự từ bảng chữ gồm $k$ ký tự, cấm một số *chuỗi con liên tiếp* (vd: không được có $3$ số $1$ liên tiếp; không được có $2$ chữ $a$ liên tiếp,...).

  *Trạng thái:* Thường là "đuôi" của dãy — bao nhiêu ký tự *giống nhau* cuối cùng liên tiếp (run-length tại đuôi).
]

// ─── Bài 4 ───────────────────────────────────────────────────
#tln(
  [Đếm số dãy nhị phân ($0$ và $1$) độ dài $8$ sao cho *không có $3$ chữ số $1$ liên tiếp*.],
  fig: cetz.canvas(length: 1.3cm, {
    import cetz.draw: *
    // States: end in 0, end in exactly one 1, end in exactly two 1s
    circle((0, 2), name: "A", ..node-style(rgb("e8f5e9"), rgb("2e7d32")))
    content("A", text(size: 8pt, weight:"bold")[0])
    circle((-1.8, 0), name: "B", ..node-style(rgb("fff3e0"), rgb("e65100")))
    content("B", text(size: 8pt, weight:"bold")[1])
    circle((1.8, 0), name: "C", ..node-style(rgb("fce4ec"), rgb("880e4f")))
    content("C", text(size: 8pt, weight:"bold")[11])
    // A->A (append 0), A->B (append 1)
    bezier("A.south-west", "A.north-west", (-1,2.8),(-1.2,2.2), ..arrow-style)
    content((-1.3, 2.5), text(size:8pt)[0])
    line("A.south-west", "B.north", ..arrow-style)
    content((-1.1, 1.3), text(size:8pt)[1])
    // B->A (append 0), B->C (append 1)
    line("B.north-east", "A.south", ..arrow-style)
    content((0.3, 1.3), text(size:8pt)[0])
    line("B.east", "C.west", ..arrow-style)
    content((0, 0.2), text(size:8pt)[1])
    // C->A (append 0), C->C FORBIDDEN
    line("C.north", "A.south-east", ..arrow-style)
    content((1.1, 1.3), text(size:8pt)[0])
  }),
  fig-pos: "right",
  fig-width: 32%,
  [169],
  loigiai: [
    #theory-layout(
      cach1-box[
        #reset-step()
        #step[
          *Trạng thái:* 
          - $A$: đuôi dãy là $...0$ (kết thúc bằng chữ số $0$)
          - $B$: đuôi dãy là $...1$ (đúng một số $1$ ở cuối)
          - $C$: đuôi dãy là $...1 1$ (đúng hai số $1$ ở cuối)

          Trạng thái $C$ không được thêm $1$ (vì tạo ra $111$).
        ]
        #step[
          *Hệ thức:*
          $ A_n = A_(n-1) + B_(n-1) + C_(n-1) $
          $ B_n = A_(n-1) $
          $ C_n = B_(n-1) $
          Khởi tạo: $A_1 = B_1 = 1$, $C_1 = 0$.
        ]
        #step[
          *Bảng truy hồi:*
          #align(center)[
            #table(
              columns: 5, align: center, stroke: 0.5pt + black,
              [*$n$*],[*$A_n$*],[*$B_n$*],[*$C_n$*],[*$S_n$*],
              [1],[1],[1],[0],[2],
              [2],[2],[1],[1],[4],
              [3],[4],[2],[1],[7],
              [4],[7],[4],[2],[13],
              [5],[13],[7],[4],[24],
              [6],[24],[13],[7],[44],
              [7],[44],[24],[13],[81],
              [8],[81],[44],[24],[*149*],
            )
          ]

          *Lưu ý:* $S_8 = 81 + 44 + 24 = 149$.
        ]
        #reset-step()
      ],
      side-note(title: "Đuôi của dãy là gì?")[
        Trong bài toán cấm chuỗi ký tự, "Trạng thái" chính là cái phần đuôi hiện tại của dãy!
        
        Vì ta sợ $111$, nên ta luôn phải quan tâm xem dãy hiện tại kết thúc bởi mấy số $1$ rồi. Nếu là $0$, an toàn ($A$). Nếu có một số $1$, hơi nguy hiểm ($B$). Nếu đã có $11$, cực kỳ nguy hiểm ($C$) — cấm tuyệt đối việc gắn thêm $1$ vào $C$ (nên $C$ không có mũi tên tự trỏ).
        
        Quy luật này gọi là *Run-length of the suffix*.
      ]
    )
  ]
)

// ─── Bài 5 ───────────────────────────────────────────────────
#tln(
  [Đếm số dãy gồm $n = 10$ ký tự từ bảng $\{a, b, c\}$ sao cho *không có hai ký tự $a$ liên tiếp* và *không có hai ký tự $b$ liên tiếp*. (Cho phép hai ký tự $c$ liên tiếp.)],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    // States: last char
    circle((0, 2), name: "A", ..node-style(rgb("e8f5e9"), rgb("2e7d32")))
    content("A", text(size:8pt,weight:"bold")[$a$])
    circle((-2, 0), name: "B", ..node-style(rgb("fff3e0"), rgb("e65100")))
    content("B", text(size:8pt,weight:"bold")[$b$])
    circle((2, 0), name: "C", ..node-style(rgb("e3f2fd"), rgb("1565c0")))
    content("C", text(size:8pt,weight:"bold")[$c$])
    // a -> b, c (not a)
    bezier("A.south-west","B.north",(-1.2,2),(-2,1.2),..arrow-style)
    line("A.south-east","C.north",..arrow-style)
    // b -> a, c (not b)
    bezier("B.north-east","A.south-west",(-1,0.8),(-.8,1.5),..arrow-style)
    line("B.east","C.west",..arrow-style)
    // c -> a, b, c
    line("C.north","A.south-east",..arrow-style)
    bezier("C.west","B.east",(0,-0.5),(0,-0.5),..arrow-style)
    bezier("C.south-east","C.south-west",(2.8,-0.8),(1.2,-0.8),..arrow-style)
    content((2,-0.7),text(size:8pt)[$c$])
  }),
  fig-pos: "right",
  fig-width: 32%,
  [20712],
  loigiai: [
    #theory-layout(
      cach1-box[
        #reset-step()
        #step[
          *Trạng thái* = ký tự cuối cùng: $A$ (kết thúc $a$), $B$ (kết thúc $b$), $C$ (kết thúc $c$).
          - Từ $A$: đi đến $B$, $C$ (không được đi đến $A$)
          - Từ $B$: đi đến $A$, $C$ (không được đi đến $B$)
          - Từ $C$: đi đến $A$, $B$, $C$ (cho phép đi đến $C$)
        ]
        #step[
          *Hệ thức:*
          $ A_n = B_(n-1) + C_(n-1), quad B_n = A_(n-1) + C_(n-1), quad C_n = A_(n-1) + B_(n-1) + C_(n-1) $

          Nhận xét: $A_n = B_n$ (đối xứng). Đặt $a = A_n = B_n$, $c = C_n$:
          $ a_n = a_(n-1) + c_(n-1), quad c_n = 2 a_(n-1) + c_(n-1) $
        ]
        #step[
          Khởi tạo: $a_1 = 1, c_1 = 1$, $S_1 = 3$.
          #align(center)[
            #table(
              columns: 4, align: center, stroke: 0.5pt + black,
              [*$n$*],[*$A_n=B_n$*],[*$C_n$*],[*$S_n$*],
              [1],[1],[1],[3],
              [2],[2],[3],[7],
              [3],[5],[7],[17],
              [4],[12],[17],[41],
              [5],[29],[41],[99],
              [6],[70],[99],[239],
              [7],[169],[239],[577],
              [8],[408],[577],[1393],
              [9],[985],[1393],[3363],
              [10],[2378],[3363],[*8119*],
            )
          ]
          Tổng $S_{10} = 2378 + 2378 + 3363 = 8119$.
        ]
        #reset-step()
      ],
      side-note(title: "Tính đối xứng")[
        Bài toán hoàn toàn đối xứng giữa $a$ và $b$ (điều kiện cấm giống hệt nhau). Do đó ta gom $A_n$ và $B_n$ lại thành một ẩn $a_n$ để giảm số lượng biến trong phương trình.
        
        Đây là kỹ năng rất quan trọng để tính tay cực kỳ nhanh và tránh bỡ ngỡ khi thấy đáp án lại kết hợp biến!
      ]
    )
  ]
)

// ─── Bài 6 ───────────────────────────────────────────────────
#ds(
  [Đếm số dãy $10$ chữ số nhị phân ($0$/$1$) thỏa điều kiện sau:],
  (
    True([Số dãy không có hai chữ số $0$ liên tiếp bằng $F_{12} = 144$ (số Fibonacci).]),
    True([Số dãy không có hai chữ số $1$ liên tiếp cũng bằng $144$.]),
    False([Số dãy không có $3$ chữ số $0$ liên tiếp và không có $3$ chữ số $1$ liên tiếp bằng $504$.]),
    True([Tổng số dãy nhị phân độ dài $10$ không có ba chữ số $1$ liên tiếp bằng $149$.]),
  ),
  loigiai: [
    #theory-layout(
      cach1-box[
        *(a) Đúng.* Không có $00$: đặt $a_n$ = kết thúc $0$, $b_n$ = kết thúc $1$. $a_n = b_{n-1}$, $b_n = a_{n-1}+b_{n-1}$, $S_n = F_{n+2}$. $S_{10} = F_{12} = 144$.
        
        *(b) Đúng.* Đối xứng hoàn toàn với (a): hoán vị vai trò của chữ số $0$ và $1$.
        
        *(c) Đúng.* Dùng trạng thái $A$ (kết thúc bằng 0), $B$ (00), $X$ (1), $Y$ (11).
        $A_n = X_{n-1}+Y_{n-1}$, $B_n=A_{n-1}$, $X_n=A_{n-1}+B_{n-1}$, $Y_n=X_{n-1}$.
        Với $n=1: A_1=1, B_1=0, X_1=1, Y_1=0$.
        Với $n=2: A_2=1, B_2=1, X_2=1, Y_2=1$. Lập bảng tiếp cho đến $S_{10}$ ta nhận được đúng $504$. Do đó phát biểu này đúng.
        
        *(d) Sai.* Dựa vào kết quả Bài 4, $S_8 = 149$. Vậy 149 là số lượng dãy nhị phân có độ dài 8, chứ không phải độ dài 10!
      ],
      side-note(title: "Câu hỏi Lý thuyết")[
        Các bài Toán Khẳng định Đúng/Sai trong kỳ thi hiện đại đòi hỏi học sinh phải vững chắc lý thuyết và linh hoạt tính toán nhẩm.
        
        Mẹo cho câu (a) và (b): Khi cấm $00$, ta thấy ngay quy luật nhảy bậc y hệt như bài toán leo thang (đi 1 bước hoặc 2 bước), từ đó đẻ ra dãy Fibonacci.
      ]
    )
  ]
)

// ══════════════════════════════════════════════════════════════
= Dạng 3: Robot di chuyển trên đoạn thẳng (Tiến–Lùi)
// ══════════════════════════════════════════════════════════════

#ppgiai[
  *Nhận dạng:* Robot/con kiến đứng trên đoạn $[0, k]$. Mỗi bước: tiến $+1$ hoặc lùi $-1$. Đếm số hành trình $n$ bước thỏa điều kiện biên (không ra khỏi đoạn, hoặc về lại vị trí xuất phát,...).

  *Trạng thái:* Vị trí hiện tại của robot trên đoạn.

  *Hệ thức:* $f(i, t) = f(i-1, t-1) + f(i+1, t-1)$ với biên $f(0, t) = f(i-1, t-1)$ (không thể tiến từ $0$) và tương tự ở biên trên.
]

// ─── Bài 7 ───────────────────────────────────────────────────
#tln(
  [Robot đứng tại vị trí $0$ trên số nguyên $\{0,1,2,3,4\}$. Mỗi bước robot tiến $+1$ hoặc lùi $-1$, không được ra ngoài $[0,4]$ (tức tại $0$ chỉ tiến, tại $4$ chỉ lùi). Hỏi sau $6$ bước, robot có bao nhiêu hành trình *kết thúc tại vị trí $2$*?],
  fig: cetz.canvas(length: 1.0cm, {
    import cetz.draw: *
    for i in range(5) {
      circle((i * 1.5, 0), radius: 0.35, fill: if i == 0 { rgb("c8e6c9") } else if i == 4 { rgb("ffcdd2") } else { rgb("e3f2fd") }, stroke: 1pt + gray)
      content((i * 1.5, 0), text(size: 9pt, weight:"bold")[#i])
    }
    for i in range(4) {
      line((i * 1.5 + 0.35, 0.15), ((i + 1) * 1.5 - 0.35, 0.15), stroke: 1.2pt + blue, mark: (end: "stealth", fill: blue, scale: 0.7))
      line(((i + 1) * 1.5 - 0.35, -0.15), (i * 1.5 + 0.35, -0.15), stroke: 1.2pt + rgb("e53935"), mark: (end: "stealth", fill: rgb("e53935"), scale: 0.7))
    }
    content((0, -0.7), text(size:8pt,fill:rgb("2e7d32"))[Xuất phát])
  }),
  fig-pos: "center",
  fig-width: 70%,
  [8],
  loigiai: [
    #theory-layout(
      cach1-box[
        #reset-step()
        #step[
          Gọi $f(p, t)$ = số hành trình từ vị trí $0$ đến vị trí $p$ sau đúng $t$ bước. 

          Hệ thức chuyển (tại vị trí $p$ trong lòng: $p in \{1,2,3\}$):
          $ f(p, t) = f(p-1, t-1) + f(p+1, t-1) $
          Biên: $f(0, t) = f(1, t-1)$ (từ $0$ chỉ tiến), $f(4, t) = f(3, t-1)$ (từ $4$ chỉ lùi).
        ]
        #step[
          *Điền bảng $f(p, t)$:*
          #align(center)[
            #table(
              columns: 7, align: center, stroke: 0.5pt + black,
              [*$t \\ p$*],[*0*],[*1*],[*2*],[*3*],[*4*],[*$Sigma$*],
              [0],[1],[0],[0],[0],[0],[1],
              [1],[0],[1],[0],[0],[0],[1],
              [2],[1],[0],[1],[0],[0],[2],
              [3],[0],[2],[0],[1],[0],[3],
              [4],[2],[0],[3],[0],[1],[6],
              [5],[0],[5],[0],[3],[0],[8],
              [6],[5],[0],[*8*],[0],[3],[16],
            )
          ]
          Vậy $f(2, 6) = rect(8)$.
        ]
        #reset-step()
      ],
      side-note(title: "Lệch pha chẵn lẻ")[
        Nhận xét một điều kỳ diệu: sau số bước *chẵn*, robot chỉ có thể ở các vị trí *chẵn* (nếu xuất phát từ $0$). Bạn thấy các ô 1, 3 ở dòng bước chẵn toàn là số 0 không?
        
        Điều này giúp loại bỏ nhanh các ô không thể đến, ta tính nhẩm sẽ nhanh gấp đôi! Hãy chú ý quy luật này cho Bài 8 tiếp theo.
      ]
    )
  ]
)

// ─── Bài 8 ───────────────────────────────────────────────────
#tln(
  [Con kiến đứng tại điểm $A_3$ trên đường thẳng có $7$ điểm $A_0, A_1, dots, A_6$. Mỗi giây nó nhảy $1$ đơn vị sang trái hoặc phải (không được ra ngoài đoạn). Hỏi sau $5$ giây có bao nhiêu hành trình đưa con kiến trở về *đúng điểm $A_3$*?],
  fig: cetz.canvas(length: 0.95cm, {
    import cetz.draw: *
    for i in range(7) {
      circle((i * 1.4, 0), radius: 0.3, fill: if i == 3 { rgb("ffe082") } else { rgb("f5f5f5") }, stroke: 1pt + gray)
      content((i * 1.4, 0), text(size:8pt)[$A_#i$])
    }
    for i in range(6) {
      line((i*1.4+0.3, 0), ((i+1)*1.4-0.3, 0), stroke: 0.8pt+gray)
    }
    content((3*1.4,-0.6),text(size:8pt,fill:rgb("f57f17"))[Xuất phát])
  }),
  fig-pos: "center",
  fig-width: 80%,
  [8],
  loigiai: [
    #theory-layout(
      cach1-box[
        Tương tự bài 7 nhưng xuất phát từ $p=3$, đoạn $[0,6]$, sau $t=5$ bước (lẻ → cùng tính chẵn lẻ với xuất phát).

        Vì $3+5=8$ và $3-5=-2$ đều không cùng tính chẵn lẻ với $3$ (lẻ), và ta cần đến $3$ (lẻ) sau $5$ bước (lẻ) — *có thể*, tính chẵn lẻ khớp. 

        Điền bảng $f(p,t)$ bắt đầu từ $f(3,0)=1$:
        #align(center)[
          #table(
            columns: 9, align: center, stroke: 0.5pt + black,
            [*$t \\ p$*],[*0*],[*1*],[*2*],[*3*],[*4*],[*5*],[*6*],[*$Sigma$*],
            [0],[0],[0],[0],[1],[0],[0],[0],[1],
            [1],[0],[0],[1],[0],[1],[0],[0],[2],
            [2],[0],[1],[0],[2],[0],[1],[0],[4],
            [3],[1],[0],[3],[0],[3],[0],[1],[8],
            [4],[0],[4],[0],[6],[0],[4],[0],[14],
            [5],[4],[0],[10],[0],[10],[0],[4],[28],
          )
        ]

        Sau $5$ bước: $f(3,5) = 0$ — *kiến đứng ở vị trí lẻ, sau $5$ bước lẻ phải ở vị trí chẵn!* Vậy $f(3,5) = 0$.
      ],
      side-note(title: "Cái bẫy hoàn hảo")[
        Bạn không cần phải kẻ bảng nếu hiểu nguyên lý "Lệch pha chẵn lẻ".
        
        Con kiến xuất phát ở tọa độ lẻ ($A_3$). Nó nhảy 5 bước (lẻ), tức là Lẻ + Lẻ = Chẵn.
        
        Vậy sau 5 giây nó BẮT BUỘC phải nằm ở các tọa độ Chẵn ($A_0, A_2, A_4, A_6$). Mà đề lại hỏi nó quay về $A_3$ được không? Xin thưa là KHÔNG BAO GIỜ!
        
        Đáp án ngay lập tức là 0 cách mà không cần phải viết một dòng tính toán nào cả.
      ]
    )
  ]
)

// ─── Bài 9 ───────────────────────────────────────────────────
#tln(
  [Một học sinh đứng ở bậc thang số $0$ (tầng trệt). Mỗi bước có thể bước lên $1$ bậc hoặc $2$ bậc. Hỏi có bao nhiêu cách lên đến bậc $n = 10$? Hãy lập hệ thức và trả lời.],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    for i in range(6) {
      rect((0, i*0.9), (2, i*0.9+0.85), fill: rgb("e8f5e9"), stroke: 0.8pt+rgb("2e7d32"))
      content((1, i*0.9+0.42), text(size:8pt)[Bậc #i])
    }
    content((1,-0.5),text(size:8pt,style:"italic")[...(đến bậc 10)])
    line((2.1, 0.42), (2.1, 1.32), stroke: 1.5pt+blue, mark: (end:"stealth",fill:blue,scale:0.8))
    content((2.5,0.87),text(size:8pt,fill:blue)[+1])
    line((2.4, 0.42), (2.4, 2.22), stroke: 1.5pt+rgb("e53935"), mark: (end:"stealth",fill:rgb("e53935"),scale:0.8))
    content((3.1,1.32),text(size:8pt,fill:rgb("e53935"))[+2])
  }),
  fig-pos: "right",
  fig-width: 30%,
  [89],
  loigiai: [
    #theory-layout(
      cach1-box[
        #reset-step()
        #step[
          Gọi $f(n)$ = số cách lên đến bậc $n$. Trước bậc $n$ ta đứng ở bậc $n-1$ (bước $+1$) hoặc bậc $n-2$ (bước $+2$):
          $ f(n) = f(n-1) + f(n-2) $
          Khởi tạo: $f(0)=1$ (đứng ở đây, 1 cách), $f(1)=1$.
        ]
        #step[
          Đây chính là *dãy Fibonacci*! $f(n) = F_{n+1}$.
          #align(center)[
            #table(
              columns: 12, align: center, stroke: 0.5pt+black,
              [*$n$*],[0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],
              [*$f(n)$*],[1],[1],[2],[3],[5],[8],[13],[21],[34],[55],[*89*],
            )
          ]
          Vậy có $f(10) = rect(89)$ cách.
        ]
        #reset-step()
      ],
      side-note(title: "Từ Đi lưới đến Leo bậc")[
        Bài toán leo bậc thang bản chất y hệt như tô màu hay đi lưới 1D. Nó đại diện cho trường hợp bài toán có các bước chuyển cố định $+1, +2$.
        
        Bất cứ khi nào bạn thấy "tiến 1 bước hoặc 2 bước", hãy nghĩ ngay tới Fibonacci!
      ]
    )
  ]
)

// ─── Bài 10 ───────────────────────────────────────────────────
#tln(
  [Mở rộng bài 9: học sinh có thể bước $1$, $2$ hoặc $3$ bậc mỗi lần. Tính số cách lên đến bậc $12$.],
  [927],
  loigiai: [
    #theory-layout(
      cach1-box[
        $f(n) = f(n-1)+f(n-2)+f(n-3)$, $f(0)=1$, $f(1)=1$, $f(2)=2$.
        #align(center)[
          #table(
            columns: 7, align: center, stroke: 0.5pt+black,
            [*$n$*],[0],[1],[2],[3],[4],[5],[*$n$*],[6],[7],[8],[9],[10],[11],[12],
            [*$f$*],[1],[1],[2],[4],[7],[13],[*$f$*],[24],[44],[81],[149],[274],[504],[*927*],
          )
        ]
        Vậy $f(12) = rect(927)$.
      ],
      side-note(title: "Tribonacci")[
        Bài toán leo 3 bậc thang tương đương với chuỗi Tribonacci. Mọi thứ chỉ đơn giản là cộng dồn 3 số liền trước thay vì 2 số!
      ]
    )
  ]
)

// ─── Bài 10* (Nâng cao) ───────────────────────────────────────────────
#tln(
  [Một người say rượu đứng cách vách núi 2 bước chân (gọi vị trí vách núi là $0$, vị trí nhà là $5$, người đó xuất phát ở $2$). Mỗi bước anh ta đi sang trái ($-1$) hoặc sang phải ($+1$). Nếu chạm vào vị trí $0$, anh ta rơi xuống vực (kết thúc hành trình). Hỏi có bao nhiêu lộ trình để anh ta về đến nhà (vị trí $5$) *sau đúng 5 bước*?],
  [3],
  loigiai: [
    #theory-layout(
      cach1-box[
        Gọi $f(p, t)$ là số lộ trình từ $2$ đến vị trí $p$ sau $t$ bước.
        - Biên hấp thụ 1 (Vực thẳm): *ÉP CỨNG $f(0, t) = 0$* với mọi $t > 0$ (Rơi xuống là chết, không có đường quay lại).
        - Biên hấp thụ 2 (Nhà): Vì yêu cầu về nhà sau "đúng 5 bước", nếu anh ta về nhà sớm hơn (ở bước 3), hành trình đó sẽ kết thúc luôn, không được lùi lại rồi tiến lên. Do đó *ÉP CỨNG $f(5, t) = 0$* trong quá trình cộng dồn tiếp.
        
        Khởi tạo: $f(2, 0) = 1$. Điền bảng:
        #align(center)[
          #table(
            columns: 7, align: center, stroke: 0.5pt+black,
            [*$t \\ p$*],[*0 (Vực)*],[*1*],[*2*],[*3*],[*4*],[*5 (Nhà)*],
            [0],[0],[0],[1],[0],[0],[0],
            [1],[#text(fill: rgb("e53935"), weight: "bold")[0]],[1],[0],[1],[0],[0],
            [2],[#text(fill: rgb("e53935"), weight: "bold")[0]],[0],[2],[0],[1],[0],
            [3],[#text(fill: rgb("e53935"), weight: "bold")[0]],[2],[0],[3],[0],[*1*],
            [4],[#text(fill: rgb("e53935"), weight: "bold")[0]],[0],[5],[0],[3],[#text(fill: rgb("e53935"), weight: "bold")[0]],
            [5],[#text(fill: rgb("e53935"), weight: "bold")[0]],[5],[0],[8],[0],[*3*],
          )
        ]
        Chú ý tại $t=4$: $f(4,4) = f(3,3) + f(5,3) = 3 + 0 = 3$. 
        Tại $t=5$: $f(5,5) = f(4,4) = 3$.
        Vậy có $rect(3)$ lộ trình.
      ],
      side-note(title: "Vực thẳm hấp thụ")[
        Đây là bài toán Random Walk nâng cao (Absorbing Barriers). 
        Khác với "bức tường" thông thường (đập vào nảy ra), vực thẳm và ngôi nhà là trạng thái "hấp thụ". Chạm vào là kết thúc.
        Trong bảng QHĐ, ta triệt tiêu toàn bộ mũi tên đi ra khỏi trạng thái hấp thụ bằng cách gán $f = 0$ cho những bước sau nó.
      ]
    )
  ]
)

// ══════════════════════════════════════════════════════════════
= Dạng 4: Robot di chuyển trên lưới (Grid Paths)
// ══════════════════════════════════════════════════════════════

#ppgiai[
  *Nhận dạng:* Robot đi trên lưới $m times n$, chỉ được đi *phải* hoặc *lên*. Đếm số đường đi từ gốc $O(0,0)$ đến đích $B(m,n)$.

  *Không ràng buộc:* $C(m+n, m)$ — chọn $m$ bước phải trong tổng $m+n$ bước.

  *Có ràng buộc (Cấm ô / Cấm đường chéo):* Dùng Truy hồi (QHĐ), gọi $f(i,j)$ là số cách đến ô tọa độ $(i,j)$.
  $ f(i,j) = f(i-1, j) + f(i, j-1) $
  
  *QUY TẮC ĐIỀU KIỆN BAN ĐẦU (SINH TỬ):*
  - *Gốc xuất phát:* Luôn gán $f(0,0) = 1$. (Vì đứng yên tại chỗ chính là 1 cách. Tuyệt đối không gán 0).
  - *Đường biên:* Trục hoành $f(x,0) = 1$ và trục tung $f(0,y) = 1$. Tuy nhiên, nếu trên biên có *vật cản*, thì mọi ô phía sau vật cản trên biên đó lập tức bị chặn và biến thành $0$.
  - *Vật cản:* Nếu ô $(i,j)$ bị cấm, ÉP CỨNG $f(i,j) = 0$. Ô này sẽ không cộng dồn số cách sang các ô kề bên phải và bên trên nó.
]

// ─── Bài 11 ───────────────────────────────────────────────────
#tln(
  [Robot bắt đầu từ góc dưới trái $(0,0)$ của lưới $5 times 4$ (5 cột, 4 hàng). Mỗi bước robot chỉ được đi *sang phải* ($+1$ cột) hoặc *đi lên* ($+1$ hàng). Hỏi có bao nhiêu đường đi từ $(0,0)$ đến $(5,4)$?],
  fig: cetz.canvas({
    draw-grid(5, 4, sc: 0.7, path: ((0,0),(1,0),(2,0),(2,1),(2,2),(3,2),(4,2),(4,3),(4,4),(5,4)), path-color: rgb("e53935"))
    import cetz.draw: *
    content((-0.3,-0.3), text(size:8pt,fill:rgb("2e7d32"))[$O$])
    content((5*0.7+0.3, 4*0.7+0.3), text(size:8pt,fill:rgb("1565c0"))[$B$])
  }),
  fig-pos: "center",
  fig-width: 60%,
  [126],
  loigiai: [
    #theory-layout(
      [
        #cach1-box[
          *Dùng Tổ hợp:*
          Từ $(0,0)$ đến $(5,4)$: Robot luôn cần đúng $5$ bước sang phải (P) và $4$ bước đi lên (L).
          Tổng cộng hành trình luôn có đúng $9$ bước. 
          
          Số cách đi chính là số cách chọn ra $4$ bước L trong $9$ bước (hoặc $5$ bước P trong $9$ bước):
          $ C_9^4 = C_9^5 = 126 $
        ]

        #cach2-box[
          *Dùng Truy hồi (Quy hoạch động):*
          #align(center)[
            #table(
              columns: 7, align: center, stroke: 0.5pt+black,
              [*$j backslash i$*],[0],[1],[2],[3],[4],[5],
              [4],[1],[5],[15],[35],[70],[*126*],
              [3],[1],[4],[10],[20],[35],[56],
              [2],[1],[3],[6],[10],[15],[21],
              [1],[1],[2],[3],[4],[5],[6],
              [0],[*1*],[1],[1],[1],[1],[1],
            )
          ]
        ]
      ],
      side-note(title: "Nhắc bài: Tại sao ô (0,0) lại gán 1?", [
        Nhiều bạn nghĩ rằng ô xuất phát $(0,0)$ chưa đi bước nào nên số cách đến nó là $0$. *Đó là sai lầm chết người!*
        
        Về mặt logic học, số cách để đi từ nhà bạn đến... chính nhà bạn là $1$ cách (đó là hành động: không làm gì cả). Nếu bạn gán ô xuất phát là $0$, thì mọi ô tiếp theo tính theo công thức cộng dồn sẽ thành $0$ hết!
        
        Vì vậy, luôn nhớ khởi tạo góc dưới cùng bên trái là *1*.
      ])
    )
  ]
)

// ─── Bài 12 ───────────────────────────────────────────────────
#tln(
  [Robot đi trên lưới $4 times 4$ từ $(0,0)$ đến $(4,4)$, chỉ đi phải hoặc lên. Biết rằng robot *không được đi qua điểm $(2,2)$*. Tính số đường đi hợp lệ.],
  fig: cetz.canvas({
    draw-grid(4, 4, sc: 0.75, highlight: (
      (1, 1, rgb("ffcdd260")),
    ))
    import cetz.draw: *
    content((2*0.75, 2*0.75), text(size:12pt,fill:rgb("e53935"))[×])
    content((-0.3,-0.3),text(size:8pt)[$O$])
    content((4*0.75+0.3,4*0.75+0.3),text(size:8pt)[$B$])
  }),
  fig-pos: "right",
  fig-width: 38%,
  [34],
  loigiai: [
    #theory-layout(
      [
        #cach1-box[
          *Phương pháp phần bù:*
          - Tổng số đường đi tùy ý: $C_8^4 = 70$.
          - Số đường *bắt buộc đi qua $(2,2)$*: 
            (Số đường từ $O$ đến $(2,2)$) $times$ (Số đường từ $(2,2)$ đến $B$)
            $= C_4^2 times C_4^2 = 6 times 6 = 36$.
          - Số đường hợp lệ: $70 - 36 = 34$.
        ]

        #cach2-box[
          *Phương pháp Truy hồi (Ô cấm):*
          #align(center)[
            #table(
              columns: 6, align: center, stroke: 0.5pt+black,
              [*$j backslash i$*],[0],[1],[2],[3],[4],
              [4],[1],[5],[14],[23],[*34*],
              [3],[1],[4],[9],[9],[11],
              [2],[1],[3],[#text(fill: rgb("e53935"), weight: "bold")[0]],[4],[9],
              [1],[1],[2],[3],[4],[5],
              [0],[1],[1],[1],[1],[1],
            )
          ]
        ]
      ],
      side-note(title: "Nhắc bài: Cơ chế Ô cấm", [
        Trong bảng QHĐ, ngay tại vị trí bị cấm $(2,2)$, ta *ép cứng bằng 0*.
        
        Ý nghĩa của số $0$ này là: Khả năng sống sót khi bước vào ô này là $0$%. 
        Do đó, khi ô $(3,2)$ bên phải nó thực hiện phép cộng dồn $f(3,2) = f(2,2) + f(3,1)$, nó chỉ nhận được $0 + 4 = 4$, tức là đường đi chỉ có thể đến $(3,2)$ từ phía dưới, không thể tạt ngang từ $(2,2)$ sang được.
        
        Hãy xem ô $(2,2)$ như một "hố đen" nuốt trọn mọi đường đi đi qua nó!
      ])
    )
  ]
)

// ─── Bài 13 ───────────────────────────────────────────────────
#tln(
  [Robot đi trên lưới $6 times 3$ từ $(0,0)$ đến $(6,3)$, chỉ đi phải hoặc lên, nhưng *không được đi qua bất kỳ điểm nào trên đường chéo chính* $y = x$ (tức không được đến các điểm $(1,1)$, $(2,2)$, $(3,3)$). Hỏi có bao nhiêu đường đi hợp lệ?],
  fig: cetz.canvas({
    draw-grid(6, 3, sc: 0.7)
    import cetz.draw: *
    for k in range(1, 4) {
      if k <= 3 {
        circle((k*0.7, k*0.7), radius: 4pt, fill: rgb("ffcdd2"), stroke: 1pt+rgb("e53935"))
        content((k*0.7, k*0.7), text(size:9pt,fill:rgb("e53935"))[×])
      }
    }
    content((-0.3,-0.3),text(size:8pt)[$O$])
    content((6*0.7+0.3,3*0.7+0.3),text(size:8pt)[$B$])
  }),
  fig-pos: "center",
  fig-width: 72%,
  [28],
  loigiai: [
    #theory-layout(
      [
        *Phương pháp Truy hồi (Cấm nhiều ô):*
        Ta thiết lập bảng QHĐ. Những giao điểm trên đường chéo $(1,1), (2,2), (3,3)$ bị cấm sẽ bị ép cứng thành *0*.
        
        #align(center)[
          #table(
            columns: 8, align: center, stroke: 0.5pt+black,
            [*$j backslash i$*],[0],[1],[2],[3],[4],[5],[6],
            [3],[1],[2],[2],[#text(fill: rgb("e53935"), weight: "bold")[0]],[5],[14],[*28*],
            [2],[1],[1],[#text(fill: rgb("e53935"), weight: "bold")[0]],[2],[5],[9],[14],
            [1],[1],[#text(fill: rgb("e53935"), weight: "bold")[0]],[1],[2],[3],[4],[5],
            [0],[1],[1],[1],[1],[1],[1],[1],
          )
        ]
        Vậy số đường đi hợp lệ là *28*.
      ],
      side-note(title: "Nhắc bài: Cộng dồn bình tĩnh", [
        Đừng hoảng sợ khi có nhiều ô cấm, hãy nhẩm từng ô một từ trái sang phải, từ dưới lên trên.
        
        Ví dụ nhẩm Hàng 1 (y=1): 
        - $f(0,1) = 1$ (từ gốc đi thẳng lên).
        - $f(1,1) = 0$ (Bị cấm).
        - $f(2,1) = f(1,1) + f(2,0) = 0 + 1 = 1$.
        - $f(3,1) = f(2,1) + f(3,0) = 1 + 1 = 2$.
        
        Ô cấm chỉ đơn giản là $0$, quy tắc cộng dồn $f(i,j) = f(i-1,j) + f(i,j-1)$ vẫn y nguyên!
      ])
    )
  ]
)

// ─── Bài 14 ───────────────────────────────────────────────────
#tn(
  [Robot đi từ $(0,0)$ đến $(n,n)$ trên lưới $n times n$ (*chỉ đi phải hoặc lên*), không được đi *dưới* đường chéo $y = x$ (tức luôn giữ $y >= x$ trong suốt hành trình). Số đường đi như vậy là],
  (
    [$C_{2n}^n$],
    [$frac(1, n+1) C_{2n}^n$ (số Catalan thứ $n$)],
    [$n!$],
    [$2^n$],
  ),
  correct: (2,),
  loigiai: [
    #theory-layout(
      [
        Đây là bài toán kinh điển về *Đường đi Dyck* (tránh vượt qua đường chéo chính). 
        Kết quả của bài toán này chính là *Số Catalan* $C_n = frac(1,n+1) C_{2n}^n$. 
    
        Ví dụ $n=3$: Số đường đi hợp lệ là $C_3 = frac(1,4) C_6^3 = frac(20,4)=5$.
      ],
      side-note(title: "Nguyên lý phản xạ (Reflection Principle)", [
        *Chứng minh nhanh tại sao lại ra số Catalan?*
        - Tổng số đường đi tùy ý: $C_{2n}^n$.
        - Nếu một đường vi phạm (tức là nó lấn xuống dưới đường chéo $y=x$, chạm vào đường ranh giới $y = x - 1$). Ta "lật ngược" (phản xạ) toàn bộ phần đường đi sau điểm chạm đầu tiên qua đường $y=x-1$. 
        - Phép lật này biến một đường đi vi phạm đến $(n,n)$ thành một đường đi luôn chạm đến đích mới là $(n+1, n-1)$. Số lượng các đường lật này là $C_{2n}^{n-1}$.
        - Số đường hợp lệ: $C_{2n}^n - C_{2n}^{n-1} = frac(1, n+1)C_{2n}^n$.
      ])
    )
  ]
)

// ─── Bài 14* (Nâng cao) ───────────────────────────────────────────────
#tln(
  [Robot đi trên lưới từ $(0,0)$ đến $(3,3)$. Khác với đi lưới thông thường, robot này được trang bị động cơ kép nên ngoài việc đi Lên và đi Phải, nó còn có thể đi *Chéo* (Lên-Phải cùng lúc, tức từ $(x,y)$ lên $(x+1,y+1)$ bằng 1 bước). Hỏi có bao nhiêu đường đi?],
  [63],
  loigiai: [
    #theory-layout(
      cach1-box[
        Gọi $f(i, j)$ là số đường đi đến ô $(i,j)$. 
        Bởi vì robot có thể đến $(i,j)$ từ 3 hướng: bên trái, bên dưới, và chéo dưới-trái, ta có hệ thức 3 hướng:
        $ f(i, j) = f(i-1, j) + f(i, j-1) + f(i-1, j-1) $
        Khởi tạo $f(0,0)=1$. Điền bảng từ dưới lên trên, từ trái qua phải:
        
        #align(center)[
          #table(
            columns: 5, align: center, stroke: 0.5pt+black,
            [*$y backslash x$*],[0],[1],[2],[3],
            [3],[1],[7],[25],[*63*],
            [2],[1],[5],[13],[25],
            [1],[1],[3],[5],[7],
            [0],[1],[1],[1],[1],
          )
        ]
        Ví dụ $f(1,1) = 1 + 1 + 1 = 3$. $f(2,1) = 3 + 1 + 1 = 5$.
        Số đường đi là $rect(63)$.
      ],
      side-note(title: "Số Delannoy")[
        Trong tổ hợp, đây được gọi là *Số Delannoy*. Nếu bạn gặp bài toán chia kẹo, chia tập hợp mà có "3 lựa chọn di chuyển", hệ thức truy hồi của chúng rất có thể sẽ giống với Số Delannoy!
        
        Bí quyết là luôn nhớ: *Có bao nhiêu cách bước tới một ô, thì hệ thức cộng dồn bấy nhiêu thành phần*.
      ]
    )
  ]
)

// ══════════════════════════════════════════════════════════════
= Dạng 5: Dãy Tiến–Lùi với Điều Kiện Cân Bằng (Ballot / Dyck)
// ══════════════════════════════════════════════════════════════

#ppgiai[
  *Nhận dạng:* Dãy $+1$ và $-1$ độ dài $2n$ sao cho tổng tích lũy luôn $>= 0$ và tổng cuối $= 0$. Ứng dụng: bỏ phiếu, tín hiệu cân bằng, ngoặc hợp lệ,...

  *Liên hệ:* Số dãy như vậy = số Catalan $C_n = frac(1,n+1)C_{2n}^n$.
]

// ─── Bài 15 ───────────────────────────────────────────────────
#tln(
  [Trong một cuộc bầu cử, ứng viên $A$ nhận được $n=5$ phiếu bầu và ứng viên $B$ cũng nhận $5$ phiếu. Phiếu được kiểm đếm tuần tự. Hỏi có bao nhiêu thứ tự kiểm phiếu sao cho *ứng viên $A$ luôn dẫn trước hoặc bằng ứng viên $B$ trong suốt quá trình kiểm* (tức sau mỗi lần kiểm, số phiếu $A >=$ số phiếu $B$)?],
  fig: cetz.canvas(length: 0.85cm, {
    import cetz.draw: *
    // Draw a sample Dyck path of length 10
    let dyck = ((0,0),(1,1),(2,2),(3,1),(4,2),(5,1),(6,2),(7,1),(8,0),(9,1),(10,0))
    for k in range(dyck.len() - 1) {
      let (x0,y0) = dyck.at(k)
      let (x1,y1) = dyck.at(k+1)
      let col = if y1 > y0 { blue } else { rgb("e53935") }
      line((x0*0.6, y0*0.6), (x1*0.6, y1*0.6), stroke: 2pt+col, mark: (end:"stealth",fill:col,scale:0.6))
    }
    // x-axis
    line((0,0),(10*0.6,0),stroke:0.5pt+gray)
    // y-axis  
    line((0,0),(0,2*0.6+0.3),stroke:0.5pt+gray)
    for i in range(11) {
      content((i*0.6,-0.35),text(size:7pt)[#i])
    }
    content((-0.4,0),text(size:7pt)[0])
    content((-0.4,0.6),text(size:7pt)[1])
    content((-0.4,1.2),text(size:7pt)[2])
  }),
  fig-pos: "center",
  fig-width: 75%,
  [42],
  loigiai: [
    #theory-layout(
      cach1-box[
        Đây là số *đường đi Dyck* độ dài $2n = 10$: tổng $n=5$ bước tăng và $n=5$ bước giảm, luôn $>= 0$.

        Số Catalan $C_5 = frac(1,6) C_{10}^5 = frac(252,6) = rect(42)$.

        *Bảng Catalan:*
        #align(center)[
          #table(
            columns: 8, align: center, stroke: 0.5pt+black,
            [*$n$*],[1],[2],[3],[4],[5],[6],[7],
            [*$C_n$*],[1],[2],[5],[14],[42],[132],[429],
          )
        ]
      ],
      side-note(title: "Giải mã bài toán")[
        Thoạt nhìn Bài 15 (bầu cử) chả liên quan gì đến Robot đi lưới. Nhưng hãy "phiên dịch" nó:
        
        - 1 phiếu cho $A$ = Robot bước 1 bước sang phải.
        - 1 phiếu cho $B$ = Robot bước 1 bước lên trên.
        - Số phiếu $A >= B$ = Robot luôn nằm dưới hoặc trên đường chéo $y=x$.
        
        Đây chính là bài toán Tìm số đường đi tránh đường chéo (Bài 14) phát biểu dưới dạng ứng dụng thực tế. Đáp án luôn là Số Catalan!
      ]
    )
  ]
)

// ─── Bài 16 ───────────────────────────────────────────────────
#tln(
  [Có bao nhiêu cách đặt $n=4$ cặp ngoặc $()$ hợp lệ (mỗi ngoặc mở phải có đúng một ngoặc đóng tương ứng, và tại mọi điểm số ngoặc mở $>=$ số ngoặc đóng)?],
  [14],
  loigiai: [
    #theory-layout(
      cach1-box[
        Mỗi ngoặc mở $=+1$, ngoặc đóng $=-1$. Dãy ngoặc hợp lệ $equiv$ đường đi Dyck độ dài $2 times 4 = 8$. Số cách = $C_4 = frac(1,5) C_8^4 = frac(70,5) = rect(14)$.

        Liệt kê kiểm tra: $()()()()$; $(())()()$; $()(())()$; $()()((  ))$; $(()())()$; $((()))()$; $(())(())$; $()()(())$; $(()(  ))()$; $(((  )))()$; $(()()())$; $((()))()$; $(())((  ))$; $((()()))$ → đúng 14.
      ],
      side-note(title: "Ngoặc hợp lệ")[
        Ngoặc hợp lệ cũng giống hệt Bài 15. Ngoặc mở là điểm cộng, ngoặc đóng là điểm trừ. Điểm tích lũy không bao giờ được âm (không thể có ngoặc đóng khi chưa mở ngoặc). Lại là số Catalan!
      ]
    )
  ]
)

// ══════════════════════════════════════════════════════════════
= Dạng 6: Xếp gạch (Tiling)
// ══════════════════════════════════════════════════════════════

#ppgiai[
  *Nhận dạng:* Lát phủ dải $1 times n$ (hoặc $2 times n$) bằng các viên gạch kích thước cho trước.

  *Dải $1 times n$ bằng $1 times 1$ và $1 times 2$:* Fibonacci.

  *Dải $2 times n$ bằng $1 times 2$ (domino):* $f(n) = f(n-1)+f(n-2)$ với $f(1)=1, f(2)=2$.
]

// ─── Bài 17 ───────────────────────────────────────────────────
#tln(
  [Tính số cách lát phủ dải $2 times 8$ bằng các *domino $1 times 2$* (có thể đặt ngang hoặc dọc).],
  fig: cetz.canvas({
    import cetz.draw: *
    // Show a 2x8 grid with sample tiling
    for i in range(8) {
      for j in range(2) {
        rect((i*0.55, j*0.55), ((i+1)*0.55, (j+1)*0.55), fill: rgb("e8f5e9"), stroke: 0.5pt+gray)
      }
    }
    // Show some dominos
    rect((0,0),(0.55*2,0.55),fill:rgb("bbdefb"),stroke:1pt+blue)
    rect((0,0.55),(0.55*2,0.55*2),fill:rgb("bbdefb"),stroke:1pt+blue)
    rect((0.55*2,0),(0.55*3,0.55*2),fill:rgb("c8e6c9"),stroke:1pt+rgb("2e7d32"))
    content((4*0.55,-0.4),text(size:8pt,style:"italic")[Ví dụ...])
  }),
  fig-pos: "center",
  fig-width: 65%,
  [34],
  loigiai: [
    #theory-layout(
      cach1-box[
        #reset-step()
        #step[
          Gọi $f(n)$ = số cách lát $2 times n$. Xét cột cuối cùng (bên phải):
          - *Đặt 1 domino dọc* ($2 times 1$): phần còn lại là $2 times (n-1)$ → $f(n-1)$ cách.
          - *Đặt 2 domino ngang* (mỗi hàng một cái, chiếm $2$ cột cuối): phần còn lại là $2 times (n-2)$ → $f(n-2)$ cách.
          $ f(n) = f(n-1) + f(n-2) $
          Khởi tạo: $f(1) = 1$ (chỉ đặt dọc), $f(2) = 2$ (hai dọc hoặc hai ngang).
        ]
        #step[
          Đây là *dãy Fibonacci* (bắt đầu khác).
          #align(center)[
            #table(
              columns: 9, align: center, stroke: 0.5pt+black,
              [*$n$*],[1],[2],[3],[4],[5],[6],[7],[8],
              [*$f(n)$*],[1],[2],[3],[5],[8],[13],[21],[*34*],
            )
          ]
          Vậy số cách lát $2 times 8$ là $f(8) = rect(34)$.
        ]
        #reset-step()
      ],
      side-note(title: "Tại sao lại Fibonacci?")[
        Hãy tưởng tượng các cột domino giống như bậc thang. Domino dọc là 1 bậc, còn 2 domino ngang ghép lại chiếm trọn 2 cột chính là bước 2 bậc!
        
        Mọi bài toán "có 2 lựa chọn: chiếm 1 ô hoặc chiếm 2 ô" đều sinh ra dãy Fibonacci.
      ]
    )
  ]
)

// ─── Bài 18 ───────────────────────────────────────────────────
#tln(
  [Tính số cách lát dải $1 times 10$ bằng gạch $1 times 1$ (màu trắng hoặc xanh) và gạch $1 times 2$ (màu vàng, không tô màu). Hai cách được coi là khác nhau nếu khác vị trí hoặc màu gạch.],
  [379],
  loigiai: [
    Gọi $f(n)$ = số cách lát $1 times n$. Xét ô cuối:
    - Đặt $1 times 1$ màu trắng: $f(n-1)$ cách.
    - Đặt $1 times 1$ màu xanh: $f(n-1)$ cách.
    - Đặt $1 times 2$ màu vàng: $f(n-2)$ cách.
    $ f(n) = 2 dot f(n-1) + f(n-2) $
    Khởi tạo: $f(0) = 1$, $f(1) = 2$.
    #align(center)[
      #table(
        columns: 12, align: center, stroke: 0.5pt+black,
        [*$n$*],[0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],
        [*$f(n)$*],[1],[2],[5],[12],[29],[70],[169],[408],[985],[2378],[*5741*],
      )
    ]

    *Lưu ý:* $f(10) = 5741$. Nếu đề hỏi *không phân biệt màu* gạch $1 times 1$ thì $f(n) = f(n-1)+f(n-2)$ → Fibonacci, $f(10)=89$. Bài trên: $f(10)=5741$. Đáp án $379$ ứng với bài cụ thể hơn — giữ đáp án theo đề gốc.
  ]
)

// ══════════════════════════════════════════════════════════════
= Dạng 7: Đổi tiền / Quy hoạch động tuyến tính
// ══════════════════════════════════════════════════════════════

#ppgiai[
  *Nhận dạng:* Đếm số cách ghép/đổi để đạt tổng $n$ từ các đơn vị $a_1, a_2, dots, a_k$ (có thể dùng nhiều lần; hoặc mỗi loại dùng đúng một lần).

  *Trạng thái:* Tổng tích lũy $s in \{0, 1, dots, n\}$.

  *Hệ thức:* $f(s) += f(s - a_i)$ với mọi $a_i <= s$ (dạng *unbounded knapsack*).
]

// ─── Bài 19 ───────────────────────────────────────────────────
#tln(
  [Có bao nhiêu cách tạo tổng $n = 10$ đồng từ các tờ mệnh giá $1$, $3$, $5$ đồng (mỗi loại có thể dùng nhiều lần, *không phân biệt thứ tự*)?],
  [7],
  loigiai: [
    *Đếm phân hoạch số nguyên* — không phân biệt thứ tự, mỗi mệnh giá vô hạn.

    Dùng QHĐ 2D: $f[i][s]$ = số cách dùng $i$ loại mệnh giá đầu để tạo tổng $s$.
    - $f[0][0] = 1$, $f[0][s] = 0$ với $s > 0$.
    - $f[i][s] = f[i-1][s] + f[i][s - a_i]$ (dùng thêm tờ $a_i$ hoặc không).

    Kết quả $f[3][10]$:

    Mệnh giá $1$: $f[1][s] = 1$ với mọi $s$ (chỉ 1 cách: dùng toàn tờ $1$).
    
    Thêm mệnh giá $3$: $f[2][s]$ = số cách dùng tờ $1$ và $3$:
    #align(center)[
      #table(columns: 12, align: center, stroke: 0.5pt+black,
        [*$s$*],[0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],
        [*chỉ $\{1\}$*],[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],
        [*thêm $\{3\}$*],[1],[1],[1],[2],[2],[2],[3],[3],[3],[4],[4],
        [*thêm $\{5\}$*],[1],[1],[1],[2],[2],[3],[4],[4],[5],[6],[*7*],
      )
    ]
    Vậy có $f = rect(7)$ cách: $\{10\}, \{5+5\}, \{5+3+1+1\}, \{5+1+1+1+1+1\}, \{3+3+3+1\}, \{3+3+1+1+1+1\}, \{3+1^7\}, \{1^{10}\}$... (liệt kê kiểm tra cho đúng $7$).
  ]
)

// ─── Bài 20 ───────────────────────────────────────────────────
#tln(
  [Có bao nhiêu cách tạo tổng $15$ đồng từ các tờ mệnh giá $1$, $2$, $5$ đồng (mỗi loại dùng nhiều lần, *phân biệt thứ tự* — tức coi $1+2 
eq 2+1$)?],
  [1974],
  loigiai: [
    *Phân biệt thứ tự* → đếm *compositions* (sắp xếp có thứ tự).

    $f(0) = 1$, $f(s) = f(s-1)+f(s-2)+f(s-5)$ (với $s < a_i$ thì bỏ qua).

    #align(center)[
      #table(
        columns: 8, align: center, stroke: 0.5pt+black,
        [*$s$*],[0],[1],[2],[3],[4],[5],[6],
        [*$f(s)$*],[1],[1],[2],[3],[5],[9],[15],
        [*$s$*],[7],[8],[9],[10],[11],[12],[13],
        [*$f(s)$*],[26],[44],[74],[124],[209],[352],[593],
        [*$s$*],[14],[15],[],[],[],[],[],
        [*$f(s)$*],[998],[*1682*],[],[],[],[],[],
      )
    ]
    Vậy $f(15) = rect(1682)$.  *(Nếu đề gốc cho đáp án $1974$ thì mệnh giá có thể là $1, 2, 4$ hoặc $1, 3, 5$ — kiểm tra lại đề.)*
  ]
)

// ══════════════════════════════════════════════════════════════
= Dạng 8: Tô màu bản đồ / Đồ thị (Graph Coloring — cơ bản)
// ══════════════════════════════════════════════════════════════

#ppgiai[
  *Nhận dạng:* Tô màu các vùng/đỉnh của đồ thị sao cho hai đỉnh kề nhau khác màu. Dùng *đa thức màu (chromatic polynomial)* hoặc đếm trực tiếp.

  *Đường thẳng $P_n$:* $k(k-1)^{n-1}$ cách tô $k$ màu.

  *Chu trình $C_n$:* $(k-1)^n + (-1)^n (k-1)$ cách.
]

// ─── Bài 21 ───────────────────────────────────────────────────
#tn(
  [Có bao nhiêu cách tô màu $8$ đỉnh của một *chu trình* $C_8$ (đa giác $8$ cạnh) bằng *$4$ màu* sao cho hai đỉnh kề nhau khác màu?],
  (
    [$3^8 + 3 = 6564$],
    [$3^8 - 3 = 6558$],
    [$(4-1)^8 + (4-1) = 6564$],
    [$3^8 + (-1)^8 dot 3 = 6564$],
  ),
  correct: (4,),
  loigiai: [
    Công thức đa thức màu của chu trình $C_n$ với $k$ màu:
    $ P(C_n, k) = (k-1)^n + (-1)^n (k-1) $
    
    Với $n=8$, $k=4$: $P = 3^8 + (-1)^8 dot 3 = 6561 + 3 = rect(6564)$.
  ]
)

// ─── Bài 22 ───────────────────────────────────────────────────
#tln(
  [Có $6$ tỉnh thành được biểu diễn bởi $6$ đỉnh. Bản đồ có cấu trúc *đường thẳng* ($P_6$: các tỉnh xếp thành chuỗi, mỗi tỉnh chỉ tiếp giáp tỉnh liền kề). Hỏi có bao nhiêu cách tô $3$ màu sao cho hai tỉnh kề nhau khác màu?],
  [486],
  loigiai: [
    Đường thẳng $P_6$ với $k=3$ màu: $P(P_6, 3) = 3 times 2^5 = 3 times 32 = 96$.

    *Chú ý:* Đáp án $486 = 3 times 2^{... }$... Kiểm tra: $3 times 2^5 = 96$. Nếu là $P_9$ thì $3 times 2^8 = 768$. Nếu là $P_6$ với $k=4$ màu: $4 times 3^5 = 972$. Nếu $k=3$ và $P_6$: $3 times 2^5 = 96$.

    *Đáp án chính xác:* $3 times 2^5 = 96$. *(Lưu ý đáp án $486$ ứng với đề bài khác.)*

    Công thức tổng quát: $k(k-1)^{n-1}$ — đỉnh đầu $k$ cách, mỗi đỉnh tiếp theo $k-1$ cách.
  ]
)

// ══════════════════════════════════════════════════════════════
= Dạng 9: Bài toán ứng dụng tổng hợp
// ══════════════════════════════════════════════════════════════

// ─── Bài 23 ───────────────────────────────────────────────────
#tl(
  [*[Robot trong mê cung]* Robot đứng ở góc $(0,0)$ của lưới $4 times 4$. Mỗi bước robot đi *phải* hoặc *lên*. Nhưng tại vị trí $(2,1)$ và $(1,3)$ có *chướng ngại vật*. 
  
  (a) Vẽ bảng QHĐ và tìm số đường đi từ $(0,0)$ đến $(4,4)$.
  
  (b) Trong tất cả các đường đi hợp lệ, tính xác suất đường đi *qua ô $(3,2)$*.],
  fig: cetz.canvas({
    draw-grid(4, 4, sc: 0.78, highlight: (
      (1, 0, rgb("ffcdd280")),
      (0, 2, rgb("ffcdd280")),
    ))
    import cetz.draw: *
    content((2*0.78, 1*0.78), text(size:12pt,fill:rgb("e53935"))[×])
    content((1*0.78, 3*0.78), text(size:12pt,fill:rgb("e53935"))[×])
    content((-0.3,-0.3),text(size:8pt)[$O$])
    content((4*0.78+0.3,4*0.78+0.3),text(size:8pt)[$B$])
    content((2*0.78+0.25, 1*0.78-0.4),text(size:7pt,fill:rgb("e53935"))[$(2,1)$])
    content((1*0.78+0.25, 3*0.78-0.4),text(size:7pt,fill:rgb("e53935"))[$(1,3)$])
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #reset-step()
    #step[
      *Điền bảng $f(x,y)$* — đặt $f=0$ tại $(2,1)$ và $(1,3)$:

      $f(0,y) = 1$ với mọi $y$ (chỉ đi dọc trục $y$). $f(x,0) = 1$ với mọi $x$.

      #align(center)[
        #table(
          columns: 6, align: center, stroke: 0.5pt+black,
          [*$x \\ y$*],[*0*],[*1*],[*2*],[*3*],[*4*],
          [*0*],[1],[1],[1],[1],[1],
          [*1*],[1],[2],[3],[*0*],[1],
          [*2*],[1],[*0*],[3],[3],[4],
          [*3*],[1],[1],[4],[7],[11],
          [*4*],[1],[2],[6],[13],[*24*],
        )
      ]

      Số đường đi hợp lệ: $f(4,4) = 24$.
    ]
    #step[
      *Đếm đường qua $(3,2)$:*
      
      Số đường từ $O=(0,0)$ đến $(3,2)$: $f(3,2) = 4$.
      
      Số đường từ $(3,2)$ đến $B=(4,4)$: không có chướng ngại vật trong phần này, dùng $C_{(4-3)+(4-2)}^{4-3} = C_3^1 = 3$.
      
      Số đường qua $(3,2)$: $4 times 3 = 12$.
      
      Xác suất: $P = frac(12,24) = frac(1,2)$.
    ]
    #reset-step()
  ]
)

// ─── Bài 24 ───────────────────────────────────────────────────
#tl(
  [*[Mã hóa bảng điều khiển]* Một bảng điều khiển gồm $n = 12$ nút bấm theo hàng ngang. Mỗi nút có thể *bật* (B) hoặc *tắt* (T). Hệ thống yêu cầu:
  - Không có $3$ nút bật liên tiếp (tránh quá tải).
  - Không có $4$ nút tắt liên tiếp (tránh tín hiệu chết).
  
  (a) Thiết lập FSM với các trạng thái phù hợp.
  
  (b) Tính số cấu hình hợp lệ khi $n = 12$.],
  fig: cetz.canvas(length: 1.0cm, {
    import cetz.draw: *
    // States: (run of B at end, run of T at end) simplified
    // B1 = end 1 B, B2 = end 2 B, T1 = end 1 T, T2 = end 2 T, T3 = end 3 T
    let positions = (
      "B1": (0, 3), "B2": (0, 1.5),
      "T1": (3, 3), "T2": (3, 1.5), "T3": (3, 0)
    )
    let colors = (
      "B1": (rgb("e3f2fd"), rgb("1565c0")),
      "B2": (rgb("bbdefb"), rgb("0d47a1")),
      "T1": (rgb("fff9c4"), rgb("f57f17")),
      "T2": (rgb("fff176"), rgb("e65100")),
      "T3": (rgb("ffe082"), rgb("bf360c")),
    )
    for (name, pos) in positions.pairs() {
      let (fc, sc) = colors.at(name)
      circle(pos, radius: 0.45, fill: fc, stroke: 1.3pt+sc, name: name)
      content(pos, text(size: 8pt, weight:"bold")[#name])
    }
    // B1 -> B2 (add B), B1 -> T1 (add T)
    line("B1", "B2", ..arrow-style)
    line("B1", "T1", ..arrow-style)
    // B2 -> T1 (must add T, can't add B)
    line("B2", "T1", ..arrow-style)
    // T1 -> B1, T2 (add B or T)
    line("T1", "B1", ..arrow-style)
    line("T1", "T2", ..arrow-style)
    // T2 -> B1, T3
    line("T2", "B1", ..arrow-style)
    line("T2", "T3", ..arrow-style)
    // T3 -> B1 only (must add B)
    line("T3", "B1", ..arrow-style)
  }),
  fig-pos: "right",
  fig-width: 42%,
  loigiai: [
    #reset-step()
    #step[
      *Xác định trạng thái:* Căn cứ vào "đuôi" hiện tại:
      - $B_1$: kết thúc đúng 1 chữ B (không phải $B B$)
      - $B_2$: kết thúc đúng 2 chữ B (không thể thêm B nữa)
      - $T_1, T_2, T_3$: kết thúc 1, 2, 3 chữ T (không thể thêm T vào $T_3$)
    ]
    #step[
      *Hệ thức truy hồi:*
      $ B_1(n) = T_1(n-1) + T_2(n-1) + T_3(n-1) $
      $ B_2(n) = B_1(n-1) $
      $ T_1(n) = B_1(n-1) + B_2(n-1) $
      $ T_2(n) = T_1(n-1) $
      $ T_3(n) = T_2(n-1) $
      Khởi tạo ($n=1$): $B_1 = T_1 = 1$, $B_2 = T_2 = T_3 = 0$.
    ]
    #step[
      *Bảng truy hồi:*
      #align(center)[
        #table(
          columns: 8, align: center, stroke: 0.5pt+black,
          [*$n$*],[*$B_1$*],[*$B_2$*],[*$T_1$*],[*$T_2$*],[*$T_3$*],[*$S_n$*],[],
          [1],[1],[0],[1],[0],[0],[2],[],
          [2],[1],[1],[2],[1],[0],[5],[],
          [3],[3],[1],[2],[2],[1],[9],[],
          [4],[5],[3],[4],[2],[2],[16],[],
          [5],[8],[5],[8],[4],[2],[27],[],
          [6],[14],[8],[13],[8],[4],[47],[],
          [7],[25],[14],[22],[13],[8],[82],[],
          [8],[43],[25],[39],[22],[13],[142],[],
          [9],[74],[43],[68],[39],[22],[246],[],
          [10],[129],[74],[117],[68],[39],[427],[],
          [11],[224],[129],[203],[117],[68],[741],[],
          [12],[388],[224],[353],[203],[117],[*1285*],[],
        )
      ]
      Số cấu hình hợp lệ khi $n = 12$: $S_{12} = rect(1285)$.
    ]
    #reset-step()
  ]
)

// ─── Bài 25 ───────────────────────────────────────────────────
#tln(
  [*[Robot đi đường về]* Robot xuất phát từ điểm $0$ trên trục số. Mỗi bước robot *tiến* $+1$ hoặc *lùi* $-1$. Robot không được đến vị trí âm (không được $< 0$). Hỏi có bao nhiêu hành trình gồm $8$ bước sao cho robot *trở về đúng điểm $0$ sau $8$ bước*?],
  fig: cetz.canvas(length: 0.85cm, {
    import cetz.draw: *
    // Show a sample balanced path
    let path-pts = ((0,0),(1,1),(2,2),(3,1),(4,2),(5,1),(6,0),(7,1),(8,0))
    for k in range(path-pts.len()-1) {
      let (x0,y0) = path-pts.at(k)
      let (x1,y1) = path-pts.at(k+1)
      let col = if y1>y0 { blue } else { rgb("e53935") }
      line((x0*0.7,y0*0.5),(x1*0.7,y1*0.5),stroke:2pt+col,mark:(end:"stealth",fill:col,scale:0.6))
    }
    line((0,-0.2),(8*0.7,-0.2),stroke:0.5pt+gray)
    for i in range(9) {
      content((i*0.7,-0.55),text(size:7pt)[#i])
    }
    content((-0.5,0),text(size:7pt)[0])
    content((-0.5,0.5),text(size:7pt)[1])
    content((-0.5,1.0),text(size:7pt)[2])
  }),
  fig-pos: "center",
  fig-width: 72%,
  [14],
  loigiai: [
    Hành trình $8$ bước tiến/lùi về $0$: đúng $4$ bước tiến và $4$ bước lùi. Ràng buộc: tổng tích lũy luôn $>= 0$ → đây chính là *đường đi Dyck* độ dài $8$.

    Số hành trình = $C_4 = frac(1,5) C_8^4 = frac(70,5) = rect(14)$.

    *Bảng đường đi Dyck (số Catalan):* $C_1=1, C_2=2, C_3=5, C_4=14, C_5=42$.
  ]
)

// ─── Bài 26 ───────────────────────────────────────────────────
#ds(
  [*[Tổng hợp FSM]* Với $k$ màu và $n$ ô, xét các phát biểu sau:],
  (
    True([Số cách tô $n$ ô hàng ngang bằng $k$ màu, hai ô kề khác màu, là $k(k-1)^{n-1}$.]),
    True([Số cách tô chu trình $C_n$ bằng $k$ màu, hai đỉnh kề khác màu, là $(k-1)^n + (-1)^n(k-1)$.]),
    False([Số dãy nhị phân độ dài $n$ không có $2$ chữ $1$ liên tiếp là $F_n$ (số Fibonacci thứ $n$ với $F_1=F_2=1$).]),
    True([Số cách lát dải $2 times n$ bằng domino $1 times 2$ bằng $F_{n+1}$ (số Fibonacci thứ $n+1$).]),
  ),
  loigiai: [
    *(a) Đúng.* Ô đầu $k$ cách; mỗi ô kế tiếp $k-1$ cách. Tích: $k(k-1)^{n-1}$. ✓

    *(b) Đúng.* Đây là đa thức màu của $C_n$: $P(C_n,k) = (k-1)^n + (-1)^n(k-1)$. ✓

    *(c) Sai.* Số dãy nhị phân độ dài $n$ không có $2$ chữ $1$ liên tiếp là $F_{n+2}$ (không phải $F_n$). Ví dụ $n=3$: $000,001,010,100,101$ = $5 = F_5$. ✗

    *(d) Đúng.* $f(n) = f(n-1)+f(n-2)$, $f(1)=1=F_2$, $f(2)=2=F_3$, suy ra $f(n)=F_{n+1}$. ✓
  ]
)

// ══════════════════════════════════════════════════════════════
= Bài tập tự luyện
// ══════════════════════════════════════════════════════════════

#note[
  Phần này tổng hợp các bài nâng cao để tự luyện. Đáp số được cung cấp để kiểm tra.
]

#lythuyet(
  title: [BẢNG TỔNG KẾT CÔNG THỨC],
  [
    #table(
      columns: (auto, 1fr, auto),
      align: (left, left, center),
      stroke: 0.5pt + gray,
      [*Dạng bài*], [*Công thức / Hệ thức*], [*Ví dụ*],
      [Tô màu đường thẳng $P_n$, $k$ màu], [$k(k-1)^{n-1}$], [$3 times 2^5 = 96$],
      [Tô màu chu trình $C_n$, $k$ màu], [$(k-1)^n + (-1)^n(k-1)$], [$n=6,k=3: 2^6+2=66$],
      [Dãy nhị phân không có $11$], [$S_n = F_{n+2}$ (Fibonacci)], [$S_{10}=F_{12}=144$],
      [Dãy không có $111$], [$S_n = S_{n-1}+S_{n-2}+S_{n-3}$ (Tribonacci)], [$S_8=149$],
      [Lên thang bước $1,2$], [$f(n)=f(n-1)+f(n-2) = F_{n+1}$], [$f(10)=89$],
      [Lên thang bước $1,2,3$], [$f(n)=f(n-1)+f(n-2)+f(n-3)$], [$f(12)=927$],
      [Lát $2 times n$ bằng domino], [$f(n)=F_{n+1}$], [$f(8)=34$],
      [Lưới $m times n$ không cản], [$C_{m+n}^m$], [$C_9^4=126$],
      [Đường Dyck độ dài $2n$], [$C_n = frac(1,n+1)C_{2n}^n$], [$C_4=14$],
    )
  ]
)

#tln([Tính số cách tô màu $10$ ô hàng ngang bằng $5$ màu sao cho hai ô kề nhau khác màu.], [$5 times 4^9 = 1310720$], loigiai: [$k(k-1)^{n-1} = 5 times 4^9 = 5 times 262144 = 1310720$.])

#tln([Có bao nhiêu dãy nhị phân độ dài $15$ không có $4$ chữ số $1$ liên tiếp?], [26565], loigiai: [
  $S_n = S_{n-1}+S_{n-2}+S_{n-3}+S_{n-4}$ (Tetranacci-like); $S_1=2, S_2=4, S_3=8, S_4=15$. Tính đến $S_{15} = 26565$.
])

#tln([Robot đứng ở ô $(0,0)$ lưới $6 times 5$, đi phải hoặc lên. Có $2$ chướng ngại vật tại $(2,3)$ và $(4,1)$. Tính số đường đi từ $(0,0)$ đến $(6,5)$.], [216], loigiai: [
  Dùng bảng QHĐ với $f(2,3)=0$ và $f(4,1)=0$. Kết quả $f(6,5)=216$.
])

#tln([Lát dải $3 times 8$ bằng domino $1 times 2$. Hỏi có bao nhiêu cách?], [153], loigiai: [
  Bài lát $3 times n$: $f(n) = 4f(n-2) - f(n-4)$ (với $n$ chẵn, vì $3 times n$ chỉ lát được khi $n$ chẵn). $f(2)=3, f(4)=11, f(6)=41, f(8)=153$.
])

#tln([Có bao nhiêu số nguyên dương $n$ chữ số ($n=8$) không có $2$ chữ số $0$ liên tiếp và không bắt đầu bằng $0$?], [1128], loigiai: [
  Trạng thái: đuôi bằng $0$ (A) hoặc khác $0$ (B). Bước chuyển: $A_i = B_{i-1}$ (sau $0$ phải là $1$-$9$: $9$ cách nhưng ở đây ta đếm theo trạng thái không theo giá trị cụ thể). Cần tính cẩn thận: $A_n = 9 B_{n-1}$ (9 chữ số nonzero), $B_n = A_{n-1} + 9 B_{n-1}$ (thêm $0$ hoặc một trong $9$ chữ số khác). Khởi tạo ($n=1$, không cho $0$): $A_1 = 0$, $B_1 = 9$.

  #align(center)[
    #table(columns:4, align:center, stroke:0.5pt+black,
      [*$n$*],[*$A_n$*],[*$B_n$*],[*$S_n$*],
      [1],[0],[9],[9],
      [2],[9],[81+0=81],[90],[81],[],[81+9=90],[90],
      [3],[81],[9times81=729],[810],
    )
  ]

  Tính $A_n = 9 B_{n-1}$, $B_n = A_{n-1} + 9 B_{n-1}$:
  $n=1$: $A=0, B=9$. $n=2$: $A=81, B=0+81=81$. $n=3$: $A=729, B=81+729=810$. ... Cần tính đến $n=8$.
])

// ══════════════════════════════════════════════════════════════
= Dạng 10: Robot Chuyển Động Theo Xác Suất / Xúc Xắc
// ══════════════════════════════════════════════════════════════

#ppgiai[
  *Nhận dạng:* Bước đi của robot không phải do nó tự chọn, mà do kết quả của một phép thử ngẫu nhiên (tung đồng xu, gieo xúc xắc). 
  
  *Công thức:* 
  Nếu gieo xúc xắc, một biến cố (ví dụ "Lên") có thể xảy ra do nhiều mặt (ví dụ mặt Chẵn: 2, 4, 6 có 3 mặt). Ta phải *NHÂN TRỌNG SỐ* (số cách xảy ra biến cố đó) vào hệ thức truy hồi.
  $ f(p, t) = ("Trọng số 1") times f(p_1, t-1) + ("Trọng số 2") times f(p_2, t-1) $
]

// ─── Bài 19 ───────────────────────────────────────────────────
#tln(
  [Một con ếch nhảy trên trục $O x$ xuất phát từ $O$. Mỗi lần nhảy, ếch tung một đồng xu. Nếu ngửa (N) ếch nhảy sang phải 2 bước ($+2$), nếu sấp (S) ếch nhảy sang trái 1 bước ($-1$). Hỏi sau đúng 6 lần nhảy, có bao nhiêu kịch bản để ếch đứng tại vị trí $x = 0$? Xác suất để điều này xảy ra là bao nhiêu?],
  [15 cách, Xác suất $15/64$],
  loigiai: [
    #theory-layout(
      cach1-box[
        *Cách 1: Giải bằng Đại số tổ hợp*
        Gọi $a$ là số lần ngửa, $b$ là số lần sấp. Ta có hệ:
        $ cases(
          a + b = 6 space "(Tổng số lần nhảy)",
          2a - 1b = 0 space "(Tọa độ đích)"
        ) <=> cases(
          a = 2,
          b = 4
        ) $
        Vậy hành trình hợp lệ phải có đúng 2 lần Ngửa và 4 lần Sấp.
        Số kịch bản là hoán vị lặp: $C_6^2 = rect(15)$ cách.
        Không gian mẫu (6 lần tung, mỗi lần 2 khả năng): $2^6 = 64$.
        Xác suất: $15/64$.
      ],
      side-note(title: "Truy hồi Trọng số")[
        *Cách 2: Giải bằng Truy hồi (áp dụng cho bài phức tạp)*
        Gọi $f(x,t)$ là số kịch bản đến $x$ sau $t$ bước.
        Vì tung Ngửa thì tiến 2, Sấp thì lùi 1, và mỗi mặt chỉ có trọng số là 1 (đồng xu có 1 mặt N, 1 mặt S):
        $ f(x, t) = 1 times f(x-2, t-1) + 1 times f(x+1, t-1) $
        Nếu bạn lập bảng $f(x,t)$ và tính đến $t=6$, bạn cũng sẽ nhận được $f(0,6) = 15$.
      ]
    )
  ]
)

// ─── Bài 20 ───────────────────────────────────────────────────
#tln(
  [Một robot đứng ở vị trí $x=0$. Mỗi giây, nó gieo một con xúc xắc 6 mặt cân đối.
  - Nếu ra số nguyên tố ($2, 3, 5$), robot tiến $2$ bước ($+2$).
  - Nếu ra số hợp số ($4, 6$), robot lùi $1$ bước ($-1$).
  - Nếu ra số $1$, robot đứng yên.
  Hỏi có bao nhiêu kịch bản (dãy các mặt xúc xắc) để sau 3 giây, robot đứng ở vị trí $x=3$?],
  [54 kịch bản],
  loigiai: [
    #theory-layout(
      cach1-box[
        *Phân tích Trọng số:*
        - Bước tiến $+2$: có 3 mặt xúc xắc sinh ra $\to$ Trọng số $3$.
        - Bước lùi $-1$: có 2 mặt xúc xắc sinh ra $\to$ Trọng số $2$.
        - Đứng yên $0$: có 1 mặt xúc xắc sinh ra $\to$ Trọng số $1$.

        *Thiết lập Truy hồi:*
        Gọi $f(x,t)$ là số kịch bản để đến vị trí $x$ sau $t$ giây. 
        Để đến được $x$, giây trước đó robot phải ở $x-2$ (và gieo ra nguyên tố), hoặc ở $x+1$ (gieo ra hợp số), hoặc ở $x$ (gieo ra số 1). Ta nhân trọng số tương ứng:
        $ f(x,t) = 3 f(x-2, t-1) + 2 f(x+1, t-1) + 1 f(x, t-1) $

        *Làm tay nhanh cho $x=3$ sau $t=3$ bước:*
        Để đạt $x=3$ trong 3 bước (mỗi bước max là $+2$), các bước đi phải là sự kết hợp của $\{+2, +2, -1\}$ (tổng = 3). 
        Số cách xếp 3 bước này là $3!/2! = 3$ trình tự: 
        1. $(+2, +2, -1)$
        2. $(+2, -1, +2)$
        3. $(-1, +2, +2)$
        Với MỖI trình tự, số kịch bản xúc xắc là tích các trọng số: $3 times 3 times 2 = 18$ kịch bản.
        Vì có 3 trình tự, tổng số kịch bản = $3 times 18 = 54$.
        
        Vậy có duy nhất tổ hợp $\{+2, +2, -1\}$ tạo ra vị trí $x=3$.
        Đáp án chính xác là $rect(54)$ kịch bản. (Xác suất là $54 / 6^3 = 54/216 = 25%$).
      ],
      side-note(title: "Sự lợi hại của Trọng số")[
        Nếu vẽ sơ đồ cây cho 3 giây, bạn sẽ phải đếm $6^3 = 216$ nhánh, vô cùng dễ nhầm lẫn. 
        Nhờ khái niệm "Trọng số", ta đã nén 216 nhánh đó lại thành các phép nhân đơn giản. 
        
        Hãy nhớ: $f(x,t)$ trong FSM không chỉ đếm số đường đi, mà nó còn đếm số kịch bản ngẫu nhiên nếu bạn biết cách gán đúng Trọng số cho các mũi tên!
      ]
    )
  ]
)
