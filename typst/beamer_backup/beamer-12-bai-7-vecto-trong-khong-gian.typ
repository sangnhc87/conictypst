#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-BÀI 7: VECTƠ TRONG KHÔNG GIAN
// Toán 12 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../giao-an/modules/lecture-beamer.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)


#show: lecture-theme.with(
  title:       "Bài 1: Vectơ trong không gian",
  subtitle:    "TOÁN 12 — Chương II: Vectơ và Hệ trục tọa độ trong không gian",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   24pt,                                
  math-color:  rgb("#d81b60"),                      // Magenta
  math-size:   1.05em,                              
  body-font:   ("Arial", "Times New Roman"),        
)

#lec-reset()
#lt-toc()

// ════════════════════════════════════════════════
// MỞ ĐẦU & YẾU TỐ LỊCH SỬ
// ════════════════════════════════════════════════

#lt-slide-back(title: "I. MỞ ĐẦU & LỊCH SỬ PHÁT TRIỂN")[
  #step("Nguồn gốc của từ \"Vectơ\"")
  - Trong tiếng Latin, \"*vector*\" có nghĩa là \"người mang\" hoặc \"người truyền\".
  - Thuật ngữ này được nhà thiên văn học người Ireland *William Rowan Hamilton* sử dụng lần đầu tiên vào năm 1846 để mô tả một đại lượng có hướng và độ dài.

  #step("Sự phát triển của Giải tích Vectơ")
  - *Hermann Grassmann (1844)*: Xuất bản cuốn *Ausdehnungslehre* (Lý thuyết mở rộng), đặt nền móng cho hình học $n$ chiều và đại số tuyến tính, dù lúc đó chưa được công nhận rộng rãi.
  - *Josiah Willard Gibbs (Mỹ)* và *Oliver Heaviside (Anh)* (cuối thế kỷ 19): Tách rời khái niệm vectơ khỏi quaternion của Hamilton, xây dựng hệ thống ký hiệu phân tích vectơ ba chiều (tích vô hướng, tích có hướng) đang được sử dụng toàn cầu hiện nay.
  
  #lt-note(title: "Ý nghĩa trong thực tiễn")[
    Vectơ là công cụ tối thượng để mô tả *lực, vận tốc, gia tốc, từ trường và điện trường* trong không gian 3 chiều.
  ]
]

// ════════════════════════════════════════════════
// CƠ SỞ LÝ THUYẾT
// ════════════════════════════════════════════════

#lt-slide-back(title: "II. CƠ SỞ LÝ THUYẾT")[
  #lt-two-col(ratio: (50%, 50%),
    [
      #step("1. Khái niệm Vectơ trong không gian")
      - *Vectơ* trong không gian là một đoạn thẳng có hướng.
      - *Ký hiệu*: $arrow(A B)$, $arrow(a)$, $arrow(b)$, $arrow(u)$, $arrow(v)$,...
      - *Độ dài*: Ký hiệu là $|arrow(A B)|$ hoặc $|arrow(a)|$.
      - *Giá của vectơ*: Đường thẳng đi qua điểm đầu và điểm cuối của vectơ đó.
      
      #step("Hai vectơ bằng nhau")
      Hai vectơ được gọi là *bằng nhau* nếu chúng có *cùng hướng* và *cùng độ dài*.
    ],
    [
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          line((0,0), (3,1), mark: (end: ">"), name: "a")
          content("a.50%", anchor: "south", padding: .2)[$arrow(u)$]
          
          line((0,-1.5), (3,-0.5), mark: (end: ">"), name: "b")
          content("b.50%", anchor: "south", padding: .2)[$arrow(v)$]
          
          content((1.5,-2.5))[$arrow(u) = arrow(v)$]
        })
      ]
    ]
  )
]

#lt-slide-back(title: "II. CƠ SỞ LÝ THUYẾT (Tiếp theo)")[
  #step("2. Các quy tắc cộng vectơ cơ bản")
  Giống như trong mặt phẳng, ta vẫn có các quy tắc nền tảng:
  - *Quy tắc 3 điểm (Nối đuôi)*:
    $ arrow(A B) + arrow(B C) = arrow(A C) $
  - *Quy tắc trừ (Chung gốc)*:
    $ arrow(O B) - arrow(O A) = arrow(A B) $
  - *Quy tắc hình bình hành*: Nếu $A B C D$ là hình bình hành thì:
    $ arrow(A B) + arrow(A D) = arrow(A C) $
]

#lt-slide-back(title: "II. CƠ SỞ LÝ THUYẾT (Tiếp theo)")[
  #step("3. Quy tắc hình hộp (Điểm nhấn của không gian)")
  Cho hình hộp $A B C D . A'B'C'D'$. Ta có quy tắc cộng mở rộng cho 3 kích thước:
  $ arrow(A B) + arrow(A D) + arrow(A A') = arrow(A C') $
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      let A = (0, 0)
      let B = (4, 0)
      let D = (1.5, 1.5)
      let C = (5.5, 1.5)
      
      let A1 = (0, 3.5)
      let B1 = (4, 3.5)
      let D1 = (1.5, 5)
      let C1 = (5.5, 5)
      
      // Bottom face
      line(A, B)
      line(B, C)
      line(C, D, stroke: (dash: "dashed"))
      line(D, A, stroke: (dash: "dashed"))
      
      // Top face
      line(A1, B1)
      line(B1, C1)
      line(C1, D1)
      line(D1, A1)
      
      // Vertical edges
      line(A, A1)
      line(B, B1)
      line(C, C1)
      line(D, D1, stroke: (dash: "dashed"))
      
      // Vectors
      line(A, B, mark: (end: ">"), stroke: (paint: blue, thickness: 1.5pt))
      line(A, D, mark: (end: ">"), stroke: (paint: blue, thickness: 1.5pt, dash: "dashed"))
      line(A, A1, mark: (end: ">"), stroke: (paint: blue, thickness: 1.5pt))
      line(A, C1, mark: (end: ">"), stroke: (paint: red, thickness: 1.5pt))
      
      // Labels
      content(A, anchor: "north-east", padding: .2)[$A$]
      content(B, anchor: "north", padding: .2)[$B$]
      content(C, anchor: "south", padding: .2)[$C$]
      content(D, anchor: "east", padding: .2)[$D$]
      
      content(A1, anchor: "south", padding: .2)[$A'$]
      content(B1, anchor: "north-west", padding: .2)[$B'$]
      content(C1, anchor: "south", padding: .2)[$C'$]
      content(D1, anchor: "south", padding: .2)[$D'$]
    })
  ]
]

#lt-slide-back(title: "II. CƠ SỞ LÝ THUYẾT (Tiếp theo)")[
  #step("4. Sự đồng phẳng của ba vectơ")
  #lt-note(title: "Định nghĩa")[
    Ba vectơ $arrow(a), arrow(b), arrow(c)$ được gọi là *đồng phẳng* nếu các giá của chúng cùng song song với một mặt phẳng (hoặc cùng nằm trong một mặt phẳng).
  ]
  
  #step("Điều kiện đồng phẳng")
  Cho 2 vectơ không cùng phương $arrow(a)$ và $arrow(b)$. Vectơ $arrow(c)$ đồng phẳng với $arrow(a)$ và $arrow(b)$ khi và chỉ khi tồn tại hai số thực $m, n$ sao cho:
  $ arrow(c) = m arrow(a) + n arrow(b) $
  
  #step("Phân tích một vectơ theo 3 vectơ không đồng phẳng")
  Nếu ba vectơ $arrow(a), arrow(b), arrow(c)$ *không đồng phẳng*, thì với mọi vectơ $arrow(x)$ trong không gian, ta luôn có thể phân tích:
  $ arrow(x) = m arrow(a) + n arrow(b) + p arrow(c) $
  (trong đó $m, n, p$ là các số thực duy nhất).
]

#lt-slide-back(title: "II. CƠ SỞ LÝ THUYẾT (Tiếp theo)")[
  #step("5. Góc giữa hai vectơ và Tích vô hướng")
  #lt-note(title: "Tích vô hướng")[
    Tích vô hướng của hai vectơ $arrow(a)$ và $arrow(b)$ (khác $arrow(0)$) là một số thực, ký hiệu là $arrow(a) dot.op arrow(b)$ và được tính bằng công thức:
    $ arrow(a) dot.op arrow(b) = |arrow(a)| dot.op |arrow(b)| dot.op cos(arrow(a), arrow(b)) $
  ]
  
  #step("Điều kiện vuông góc")
  Hai vectơ $arrow(a)$ và $arrow(b)$ khác vectơ-không vuông góc với nhau khi và chỉ khi:
  $ arrow(a) dot.op arrow(b) = 0 $
  
  #step("Bình phương vô hướng")
  $ arrow(a)^2 = |arrow(a)|^2 $
]

// ==================== BÀI TẬP VẬN DỤNG ====================

#let my-tn(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tn(final-stem, options, loigiai: loigiai, de: de)
}

#let my-ds(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-ds(final-stem, options, loigiai: loigiai, de: de)
}

#let my-tln(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let answer = pos.at(1, default: none)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tln(final-stem, answer, loigiai: loigiai, de: de)
}
#let my-bbbt = bbbt
#let my-bxd = bxd

// ==================== Đề 1 ====================
#my-tn(de: "Đề 1", 
  [Cho tứ diện $A B C D$. Đặt $arrow(A B) = arrow(a)$, $arrow(A C) = arrow(b)$, $arrow(A D) = arrow(c)$. Gọi $G$ là trọng tâm tam giác $B C D$. Đẳng thức nào sau đây đúng?],
  (
    [$arrow(A G) = arrow(a) + arrow(b) + arrow(c)$],
    True([$arrow(A G) = 1/3 (arrow(a) + arrow(b) + arrow(c))$]),
    [$arrow(A G) = 1/2 (arrow(a) + arrow(b) + arrow(c))$],
    [$arrow(A G) = 1/4 (arrow(a) + arrow(b) + arrow(c))$]
  ),
  loigiai: [
    #step[Vì $G$ là trọng tâm tam giác $B C D$, theo tính chất trọng tâm tam giác, với mọi điểm $A$ ta có:
    $arrow(A B) + arrow(A C) + arrow(A D) = 3 arrow(A G) <=> arrow(A G) = 1/3 (arrow(A B) + arrow(A C) + arrow(A D))$.]
    #step[Thay các vectơ $arrow(A B) = arrow(a)$, $arrow(A C) = arrow(b)$, $arrow(A D) = arrow(c)$ vào ta được:
    $arrow(A G) = 1/3 (arrow(a) + arrow(b) + arrow(c))$.]
    #step[Kết luận: Chọn đáp án B.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho tứ diện $A B C D$. Đặt $arrow(A B) = arrow(a)$, $arrow(A C) = arrow(b)$, $arrow(A D) = arrow(c)$. Gọi $M$ là trung điểm của đoạn $B C$. Đẳng thức nào dưới đây đúng?],
  (
    True([$arrow(D M) = 1/2 (arrow(a) + arrow(b) - 2 arrow(c))$]),
    [$arrow(D M) = 1/2 (arrow(a) + 2 arrow(b) - arrow(c))$],
    [$arrow(D M) = 1/2 (arrow(a) - 2 arrow(b) + arrow(c))$],
    [$arrow(D M) = 1/2 (arrow(a) + arrow(b) - arrow(c))$]
  ),
  loigiai: [
    #step[Vì $M$ là trung điểm của đoạn $B C$, ta có hệ thức:
    $arrow(A M) = 1/2 (arrow(A B) + arrow(A C)) = 1/2 (arrow(a) + arrow(b))$.]
    #step[Ta biểu diễn vectơ $arrow(D M)$ như sau:
    $arrow(D M) = arrow(A M) - arrow(A D) = 1/2 (arrow(a) + arrow(b)) - arrow(c) = 1/2 (arrow(a) + arrow(b) - 2 arrow(c))$.]
    #step[Kết luận: Chọn đáp án A.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho tứ diện $A B C D$. Gọi $M$ và $P$ lần lượt là trung điểm của các cạnh $A B$ và $C D$. Đặt $arrow(A B) = arrow(b)$, $arrow(A C) = arrow(c)$, $arrow(A D) = arrow(d)$. Khẳng định nào sau đây đúng?],
  (
    [$arrow(M P) = 1/2 (arrow(c) + arrow(d) + arrow(b))$],
    [$arrow(M P) = 1/2 (arrow(d) + arrow(b) - arrow(c))$],
    [$arrow(M P) = 1/2 (arrow(c) + arrow(b) - arrow(d))$],
    True([$arrow(M P) = 1/2 (arrow(c) + arrow(d) - arrow(b))$])
  ),
  loigiai: [
    #step[Ta có $M$ là trung điểm $A B$, $P$ là trung điểm $C D$. Theo quy tắc trung điểm, ta có:
    $arrow(A P) = 1/2 (arrow(A C) + arrow(A D)) = 1/2 (arrow(c) + arrow(d))$.]
    #step[Đồng thời, ta có $arrow(A M) = 1/2 arrow(A B) = 1/2 arrow(b)$.]
    #step[Biểu diễn vectơ $arrow(M P)$:
    $arrow(M P) = arrow(A P) - arrow(A M) = 1/2 (arrow(c) + arrow(d)) - 1/2 arrow(b) = 1/2 (arrow(c) + arrow(d) - arrow(b))$.]
    #step[Kết luận: Chọn đáp án D.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho tứ diện $A B C D$ và điểm $G$ thỏa mãn $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$ ($G$ là trọng tâm của tứ diện). Gọi $G_0$ là giao điểm của $G A$ và mặt phẳng $(B C D)$. Khẳng định nào dưới đây đúng?],
  (
    [$arrow(G A) = - 2 arrow(G_0 G)$],
    [$arrow(G A) = 4 arrow(G_0 G)$],
    True([$arrow(G A) = 3 arrow(G_0 G)$]),
    [$arrow(G A) = 2 arrow(G_0 G)$]
  ),
  loigiai: [
    #step[Vì $G_0$ là giao điểm của $G A$ và mặt phẳng $(B C D)$, và $G$ là trọng tâm của tứ diện $A B C D$, đường thẳng $A G$ đi qua trọng tâm $G_0$ của tam giác $B C D$.]
    #step[Do $G_0$ là trọng tâm tam giác $B C D$, ta có hệ thức:
    $arrow(G B) + arrow(G C) + arrow(G D) = 3 arrow(G G_0)$.]
    #step[Thay vào đẳng thức $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$, ta được:
    $arrow(G A) + 3 arrow(G G_0) = arrow(0) <=> arrow(G A) = - 3 arrow(G G_0) = 3 arrow(G_0 G)$.]
    #step[Kết luận: Chọn đáp án C.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Đặt $arrow(S A) = arrow(a)$, $arrow(S B) = arrow(b)$, $arrow(S C) = arrow(c)$, $arrow(S D) = arrow(d)$. Khẳng định nào dưới đây là đúng?],
  (
    True([$arrow(a) + arrow(c) = arrow(b) + arrow(d)$]),
    [$arrow(a) + arrow(b) + arrow(c) + arrow(d) = arrow(0)$],
    [$arrow(a) + arrow(d) = arrow(b) + arrow(c)$],
    [$arrow(a) + arrow(b) = arrow(c) + arrow(d)$]
  ),
  loigiai: [
    #step[Gọi $O$ là tâm hình bình hành $A B C D$. Khi đó $O$ là trung điểm của hai đường chéo $A C$ và $B D$.]
    #step[Áp dụng quy tắc trung điểm đối với điểm $S$ và các đoạn thẳng $A C, B D$:
    $arrow(S A) + arrow(S C) = 2 arrow(S O)$ và $arrow(S B) + arrow(S D) = 2 arrow(S O)$.]
    #step[Suy ra $arrow(S A) + arrow(S C) = arrow(S B) + arrow(S D) <=> arrow(a) + arrow(c) = arrow(b) + arrow(d)$.]
    #step[Kết luận: Chọn đáp án A.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho hình lăng trụ $A B C . A' B' C'$. Đặt $arrow(A A') = arrow(a)$, $arrow(A B) = arrow(b)$, $arrow(A C) = arrow(c)$. Gọi $G'$ là trọng tâm của tam giác $A' B' C'$. Vectơ $arrow(A G')$ bằng:],
  (
    [$1/3 (arrow(a) + 3 arrow(b) + arrow(c))$],
    True([$1/3 (3 arrow(a) + arrow(b) + arrow(c))$]),
    [$1/3 (arrow(a) + arrow(b) + 3 arrow(c))$],
    [$1/3 (arrow(a) + arrow(b) + arrow(c))$]
  ),
  loigiai: [
    #step[Vì $G'$ là trọng tâm của tam giác $A' B' C'$, ta có hệ thức vectơ:
    $arrow(A G') = 1/3 (arrow(A A') + arrow(A B') + arrow(A C'))$.]
    #step[Ta phân tích các vectơ theo các vectơ cơ sở $arrow(a), arrow(b), arrow(c)$:
    - $arrow(A A') = arrow(a)$.
    - $arrow(A B') = arrow(A B) + arrow(B B') = arrow(A B) + arrow(A A') = arrow(b) + arrow(a)$.
    - $arrow(A C') = arrow(A C) + arrow(C C') = arrow(A C) + arrow(A A') = arrow(c) + arrow(a)$.]
    #step[Cộng vế theo vế ta được:
    $arrow(A G') = 1/3 (arrow(a) + arrow(b) + arrow(a) + arrow(c) + arrow(a)) = 1/3 (3 arrow(a) + arrow(b) + arrow(c))$.]
    #step[Kết luận: Chọn đáp án B.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho hình lăng trụ $A B C . A' B' C'$. Đặt $arrow(A A') = arrow(a)$, $arrow(A B) = arrow(b)$, $arrow(A C) = arrow(c)$. Hãy biểu diễn vectơ $arrow(B' C)$ theo $arrow(a), arrow(b), arrow(c)$?],
  (
    [$arrow(B' C) = arrow(a) + arrow(b) - arrow(c)$],
    [$arrow(B' C) = - arrow(a) + arrow(b) - arrow(c)$],
    [$arrow(B' C) = arrow(a) + arrow(b) + arrow(c)$],
    True([$arrow(B' C) = - arrow(a) - arrow(b) + arrow(c)$])
  ),
  loigiai: [
    #step[Ta có $arrow(B' C) = arrow(A C) - arrow(A B')$.]
    #step[Mà $arrow(A B') = arrow(A B) + arrow(B B') = arrow(A B) + arrow(A A') = arrow(b) + arrow(a)$.]
    #step[Do đó: $arrow(B' C) = arrow(c) - (arrow(b) + arrow(a)) = - arrow(a) - arrow(b) + arrow(c)$.]
    #step[Kết luận: Chọn đáp án D.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho hình lăng trụ $A B C . A' B' C'$. Gọi $M$ là trung điểm của cạnh $B B'$. Đặt $arrow(C A) = arrow(a)$, $arrow(C B) = arrow(b)$, $arrow(A A') = arrow(c)$. Khẳng định nào sau đây đúng?],
  (
    [$arrow(A M) = arrow(a) + arrow(c) - 1/2 arrow(b)$],
    [$arrow(A M) = arrow(b) + arrow(c) - 1/2 arrow(a)$],
    True([$arrow(A M) = arrow(b) - arrow(a) + 1/2 arrow(c)$]),
    [$arrow(A M) = arrow(a) - arrow(c) + 1/2 arrow(b)$]
  ),
  loigiai: [
    #step[Ta phân tích vectơ $arrow(A M)$ theo quy tắc ba điểm:
    $arrow(A M) = arrow(A B) + arrow(B M)$.]
    #step[Vì $M$ là trung điểm của cạnh $B B'$, ta có:
    $arrow(B M) = 1/2 arrow(B B') = 1/2 arrow(A A') = 1/2 arrow(c)$.]
    #step[Đồng thời:
    $arrow(A B) = arrow(C B) - arrow(C A) = arrow(b) - arrow(a)$.]
    #step[Thay vào biểu thức trên:
    $arrow(A M) = arrow(b) - arrow(a) + 1/2 arrow(c)$.]
    #step[Kết luận: Chọn đáp án C.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho hình hộp $A B C D.A' B' C' D'$ tâm $O$. Gọi $I$ là tâm của hình bình hành $A B C D$. Đặt $arrow(A C') = arrow(u)$, $arrow(C A') = arrow(v)$, $arrow(B D') = arrow(x)$, $arrow(D B') = arrow(y)$. Khi đó:],
  (
    True([$2 arrow(O I) = - 1/4 (arrow(u) + arrow(v) + arrow(x) + arrow(y))$]),
    [$2 arrow(O I) = - 1/2 (arrow(u) + arrow(v) + arrow(x) + arrow(y))$],
    [$2 arrow(O I) = 1/2 (arrow(u) + arrow(v) + arrow(x) + arrow(y))$],
    [$2 arrow(O I) = 1/4 (arrow(u) + arrow(v) + arrow(x) + arrow(y))$]
  ),
  loigiai: [
    #step[Vì $O$ là tâm của hình hộp nên $O$ là trung điểm của các đường chéo chính $A C'$, $C A'$, $B D'$, $D B'$. Do đó ta có:
    - $arrow(O A) + arrow(O C') = arrow(0) <=> arrow(u) = arrow(A C') = -2 arrow(O A)$.
    - $arrow(O C) + arrow(O A') = arrow(0) <=> arrow(v) = arrow(C A') = -2 arrow(O C)$.
    - $arrow(O B) + arrow(O D') = arrow(0) <=> arrow(x) = arrow(B D') = -2 arrow(O B)$.
    - $arrow(O D) + arrow(O B') = arrow(0) <=> arrow(y) = arrow(D B') = -2 arrow(O D)$.]
    #step[Cộng bốn đẳng thức trên ta được:
    $arrow(u) + arrow(v) + arrow(x) + arrow(y) = -2 (arrow(O A) + arrow(O C) + arrow(O B) + arrow(O D))$.]
    #step[Vì $I$ là tâm của hình bình hành $A B C D$ nên $I$ là trung điểm của $A C$ và $B D$. Theo quy tắc trung điểm:
    $arrow(O A) + arrow(O C) = 2 arrow(O I)$ và $arrow(O B) + arrow(O D) = 2 arrow(O I)$.]
    #step[Suy ra:
    $arrow(u) + arrow(v) + arrow(x) + arrow(y) = -2 (2 arrow(O I) + 2 arrow(O I)) = -8 arrow(O I) <=> 2 arrow(O I) = -1/4 (arrow(u) + arrow(v) + arrow(x) + arrow(y))$.]
    #step[Kết luận: Chọn đáp án A.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho hình lăng trụ tam giác $A B C . A' B' C'$. Đặt $arrow(A A') = arrow(a)$, $arrow(A B) = arrow(b)$, $arrow(A C) = arrow(c)$, $arrow(B C) = arrow(d)$. Khẳng định nào sau đây là đúng?],
  (
    [$arrow(a) = arrow(b) + arrow(c)$],
    [$arrow(a) + arrow(b) + arrow(c) + arrow(d) = arrow(0)$],
    True([$arrow(b) - arrow(c) + arrow(d) = arrow(0)$]),
    [$arrow(a) + arrow(b) + arrow(c) = arrow(d)$]
  ),
  loigiai: [
    #step[Ta xét vectơ $arrow(d) = arrow(B C)$ trong tam giác $A B C$.]
    #step[Theo hiệu hai vectơ chung gốc $A$:
    $arrow(B C) = arrow(A C) - arrow(A B)$.]
    #step[Thay các vectơ theo định nghĩa $arrow(A B) = arrow(b)$, $arrow(A C) = arrow(c)$, $arrow(B C) = arrow(d)$, ta được:
    $arrow(d) = arrow(c) - arrow(b) <=> arrow(b) - arrow(c) + arrow(d) = arrow(0)$.]
    #step[Kết luận: Chọn đáp án C.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho hình lập phương $A B C D.A' B' C' D'$. Gọi $O$ là tâm của hình lập phương. Khẳng định nào sau đây là đúng?],
  (
    [$arrow(A O) = 1/3 (arrow(A B) + arrow(A D) + arrow(A A'))$],
    True([$arrow(A O) = 1/2 (arrow(A B) + arrow(A D) + arrow(A A'))$]),
    [$arrow(A O) = 1/4 (arrow(A B) + arrow(A D) + arrow(A A'))$],
    [$arrow(A O) = 2/3 (arrow(A B) + arrow(A D) + arrow(A A'))$]
  ),
  loigiai: [
    #step[Vì $O$ là tâm của hình lập phương $A B C D.A' B' C' D'$, $O$ là trung điểm của đường chéo chính $A C'$.]
    #step[Theo quy tắc hình hộp:
    $arrow(A C') = arrow(A B) + arrow(A D) + arrow(A A')$.]
    #step[Do $O$ là trung điểm $A C'$, ta có:
    $arrow(A O) = 1/2 arrow(A C') = 1/2 (arrow(A B) + arrow(A D) + arrow(A A'))$.]
    #step[Kết luận: Chọn đáp án B.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho hình hộp $A B C D.A' B' C' D'$. Đặt $arrow(A B) = arrow(a)$, $arrow(A D) = arrow(b)$, $arrow(A A') = arrow(c)$. Phân tích vectơ $arrow(A C')$ theo $arrow(a), arrow(b), arrow(c)$?],
  (
    [$arrow(A C') = - arrow(a) + arrow(b) + arrow(c)$],
    [$arrow(A C') = arrow(a) + arrow(b) - arrow(c)$],
    True([$arrow(A C') = arrow(a) + arrow(b) + arrow(c)$]),
    [$arrow(A C') = arrow(a) - arrow(b) + arrow(c)$]
  ),
  loigiai: [
    #step[Áp dụng trực tiếp quy tắc hình hộp cho hình hộp $A B C D.A' B' C' D'$ xuất phát từ đỉnh $A$, ta có:
    $arrow(A C') = arrow(A B) + arrow(A D) + arrow(A A')$.]
    #step[Thay các vectơ $arrow(A B) = arrow(a)$, $arrow(A D) = arrow(b)$, $arrow(A A') = arrow(c)$ vào đẳng thức trên:
    $arrow(A C') = arrow(a) + arrow(b) + arrow(c)$.]
    #step[Kết luận: Chọn đáp án C.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho tứ diện $A B C D$. Điểm $N$ xác định bởi đẳng thức sau $arrow(A N) = arrow(A B) + arrow(A C) - arrow(A D)$. Mệnh đề nào sau đây đúng?],
  (
    [$N$ là trung điểm $B D$.],
    [$N$ là đỉnh hình bình hành $B C D N$.],
    True([$N$ là đỉnh hình bình hành $C D B N$.]),
    [$N = A$.]
  ),
  loigiai: [
    #step[Biến đổi đẳng thức đã cho:
    $arrow(A N) = arrow(A B) + arrow(A C) - arrow(A D) <=> arrow(A N) - arrow(A B) = arrow(A C) - arrow(A D)$.]
    #step[Theo quy tắc hiệu:
    $arrow(B N) = arrow(D C)$.]
    #step[Vì $arrow(B N) = arrow(D C)$ nên hai vectơ cùng hướng và cùng độ dài.
    Do đó, bốn điểm $C, D, B, N$ tạo thành hình bình hành $C D B N$.]
    #step[Kết luận: Chọn đáp án C.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho hình hộp $A B C D.A' B' C' D'$. Gọi $M$ là điểm được xác định bởi đẳng thức sau $arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D) + arrow(M A') + arrow(M B') + arrow(M C') + arrow(M D') = arrow(0)$. Mệnh đề nào đúng?],
  (
    [$M$ là tâm mặt đáy $A B C D$.],
    [$M$ là tâm mặt đáy $A' B' C' D'$.],
    True([$M$ là trung điểm đoạn thẳng nối hai tâm của hai mặt đáy.]),
    [Tập hợp điểm $M$ là đoạn thẳng nối hai tâm của hai mặt đáy.]
  ),
  loigiai: [
    #step[Gọi $I, I'$ lần lượt là tâm (giao điểm hai đường chéo) của hai đáy $A B C D$ và $A' B' C' D'$.]
    #step[Ta có:
    - $arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D) = 4 arrow(M I)$ (do $I$ là trung điểm $A C$ và $B D$).
    - $arrow(M A') + arrow(M B') + arrow(M C') + arrow(M D') = 4 arrow(M I')$ (do $I'$ là trung điểm $A' C'$ và $B' D'$).]
    #step[Thay vào đẳng thức ban đầu:
    $4 arrow(M I) + 4 arrow(M I') = arrow(0) <=> arrow(M I) + arrow(M I') = arrow(0)$.]
    #step[Đẳng thức này chứng tỏ $M$ là trung điểm của đoạn thẳng $I I'$ nối tâm hai đáy.]
    #step[Kết luận: Chọn đáp án C.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho hình hộp $A B C D.A' B' C' D'$ có tâm $O$. Đặt $arrow(A B) = arrow(a)$, $arrow(B C) = arrow(b)$. Điểm $M$ xác định bởi đẳng thức $arrow(O M) = 1/2 (arrow(a) - arrow(b))$. Khẳng định nào sau đây đúng?],
  (
    True([$M$ là trung điểm $B B'$.]),
    [$M$ là tâm hình bình hành $B C C' B'$.],
    [$M$ là trung điểm $C C'$.],
    [$M$ là tâm hình bình hành $A B B' A'$.]
  ),
  loigiai: [
    #step[Ta có $arrow(a) - arrow(b) = arrow(A B) - arrow(B C) = arrow(A B) - arrow(A D)$ (vì $arrow(B C) = arrow(A D)$).]
    #step[Do đó:
    $arrow(a) - arrow(b) = arrow(D B)$.]
    #step[Hệ thức cho ta:
    $arrow(O M) = 1/2 arrow(D B)$.]
    #step[Gọi $I$ và $I'$ lần lượt là tâm của hai đáy $A B C D$ và $A' B' C' D'$.
    Vì $O$ là tâm hình hộp, $O$ là trung điểm của $I I'$ và $B D'$ nên ta có:
    $arrow(O B) + arrow(O D') = arrow(0)$.]
    #step[Xét hình bình hành $B D D' B'$, có $O$ là trung điểm của đường chéo $B D'$, nên $O$ cũng là trung điểm của đường chéo $B' D$.
    Do đó: $arrow(O B') + arrow(O D) = arrow(0) <=> arrow(O D) = - arrow(O B')$.]
    #step[Ta có:
    $1/2 arrow(D B) = 1/2 (arrow(O B) - arrow(O D)) = 1/2 (arrow(O B) - (- arrow(O B'))) = 1/2 (arrow(O B) + arrow(O B'))$.]
    #step[Từ đó: $arrow(O M) = 1/2 (arrow(O B) + arrow(O B'))$. Đẳng thức này chứng tỏ $M$ là trung điểm của đoạn thẳng $B B'$.]
    #step[Kết luận: Chọn đáp án A.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho ba vectơ $arrow(a), arrow(b), arrow(c)$. Điều kiện nào dưới đây khẳng định $arrow(a), arrow(b), arrow(c)$ đồng phẳng?],
  (
    [Tồn tại ba số thực $m, n, p$ thỏa mãn $m + n + p = 0$ và $m arrow(a) + n arrow(b) + p arrow(c) = arrow(0)$.],
    True([Tồn tại ba số thực $m, n, p$ thỏa mãn $m + n + p != 0$ và $m arrow(a) + n arrow(b) + p arrow(c) = arrow(0)$.]),
    [Tồn tại ba số thực $m, n, p$ sao cho $m arrow(a) + n arrow(b) + p arrow(c) = arrow(0)$.],
    [Giá của $arrow(a), arrow(b), arrow(c)$ đồng qui.]
  ),
  loigiai: [
    #step[Theo định nghĩa và định lý về sự đồng phẳng của ba vectơ:
    Ba vectơ $arrow(a), arrow(b), arrow(c)$ đồng phẳng khi và chỉ khi tồn tại ba số thực $m, n, p$ không đồng thời bằng $0$ sao cho $m arrow(a) + n arrow(b) + p arrow(c) = arrow(0)$.]
    #step[Nếu $m + n + p != 0$, điều này đảm bảo rằng các số $m, n, p$ không thể đồng thời bằng $0$.
    Do đó, sự tồn tại của bộ số này khẳng định ba vectơ đồng phẳng.]
    #step[Đáp án C sai vì nếu chọn $m=n=p=0$ thì luôn có $0 arrow(a) + 0 arrow(b) + 0 arrow(c) = arrow(0)$ với mọi bộ ba vectơ bất kỳ (kể cả không đồng phẳng).]
    #step[Kết luận: Chọn đáp án B.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho ba vectơ $arrow(a), arrow(b), arrow(c)$ không đồng phẳng. Xét các vectơ $arrow(x) = 2 arrow(a) + arrow(b)$, $arrow(y) = arrow(a) - arrow(b) - arrow(c)$ và $arrow(z) = -3 arrow(b) - 2 arrow(c)$. Khẳng định nào dưới đây là đúng?],
  (
    True([$arrow(x), arrow(y), arrow(z)$ đồng phẳng.]),
    [$arrow(x), arrow(a)$ cùng phương.],
    [$arrow(x), arrow(b)$ cùng phương.],
    [$arrow(x), arrow(y), arrow(z)$ đôi một cùng phương.]
  ),
  loigiai: [
    #step[Giả sử $arrow(x) = m arrow(y) + n arrow(z)$. Ta có:
    $2 arrow(a) + arrow(b) = m (arrow(a) - arrow(b) - arrow(c)) + n (-3 arrow(b) - 2 arrow(c))$
    $<=> 2 arrow(a) + arrow(b) = m arrow(a) - (m + 3n) arrow(b) - (m + 2n) arrow(c)$.]
    #step[Đồng nhất hệ số của các vectơ không đồng phẳng $arrow(a), arrow(b), arrow(c)$, ta có hệ phương trình:
    $heva(m = 2, -(m + 3n) = 1, -(m + 2n) = 0) <=> heva(m = 2, 3n = -3, 2n = -2) <=> heva(m = 2, n = -1)$.]
    #step[Hệ phương trình có nghiệm duy nhất $(m; n) = (2; -1)$, suy ra $arrow(x) = 2 arrow(y) - arrow(z)$.]
    #step[Vì một vectơ biểu diễn được qua hai vectơ còn lại nên ba vectơ $arrow(x), arrow(y), arrow(z)$ đồng phẳng.]
    #step[Kết luận: Chọn đáp án A.]
  ]
)

#my-tn(de: "Đề 1", 
  [Cho ba vectơ $arrow(a), arrow(b), arrow(c)$ không đồng phẳng. Khẳng định nào dưới đây đúng?],
  (
    True([Các vectơ $arrow(x) = arrow(a) + arrow(b) + 2 arrow(c)$, $arrow(y) = 2 arrow(a) - 3 arrow(b) - 6 arrow(c)$, $arrow(z) = - arrow(a) + 3 arrow(b) + 6 arrow(c)$ đồng phẳng.]),
    [Các vectơ $arrow(x) = arrow(a) - 2 arrow(b) + 4 arrow(c)$, $arrow(y) = 3 arrow(a) - 3 arrow(b) + 2 arrow(c)$, $arrow(z) = 2 arrow(a) - 3 arrow(b) - 3 arrow(c)$ đồng phẳng.],
    [Các vectơ $arrow(x) = arrow(a) + arrow(b) + arrow(c)$, $arrow(y) = 2 arrow(a) - 3 arrow(b) + arrow(c)$, $arrow(z) = - arrow(a) + 3 arrow(b) + 3 arrow(c)$ đồng phẳng.],
    [Các vectơ $arrow(x) = arrow(a) + arrow(b) - arrow(c)$, $arrow(y) = 2 arrow(a) - arrow(b) + 3 arrow(c)$, $arrow(z) = - arrow(a) - arrow(b) + 2 arrow(c)$ đồng phẳng.]
  ),
  loigiai: [
    #step[Để ba vectơ $arrow(x) = a_1 arrow(a) + b_1 arrow(b) + c_1 arrow(c)$, $arrow(y) = a_2 arrow(a) + b_2 arrow(b) + c_2 arrow(c)$ và $arrow(z) = a_3 arrow(a) + b_3 arrow(b) + c_3 arrow(c)$ đồng phẳng (với $arrow(a), arrow(b), arrow(c)$ không đồng phẳng) thì định thức của ma trận hệ số phải bằng 0.]
    #step[Xét đáp án A:
    $D = |mat(1, 1, 2; 2, -3, -6; -1, 3, 6)| = 1(-18 - (-18)) - 1(12 - 6) + 2(6 - 3) = 0 - 6 + 6 = 0$.
    Do đó ba vectơ này đồng phẳng. Ta có mối quan hệ tuyến tính: $3 arrow(y) + 3 arrow(z) = 3 arrow(a) <=> arrow(y) + arrow(z) = arrow(a)$, thay vào $arrow(x)$ ta được biểu diễn tuyến tính.]
    #step[Các đáp án B, C, D đều có định thức ma trận hệ số khác 0 nên các bộ vectơ đó không đồng phẳng.]
    #step[Kết luận: Chọn đáp án A.]
  ]
)

#my-tn(de: "Đề 1", 
  [Mệnh đề nào sau đây là sai?],
  (
    [$arrow(a), arrow(b), arrow(c)$ đồng phẳng nếu một trong ba vectơ đó bằng $arrow(0)$.],
    [$arrow(a), arrow(b), arrow(c)$ đồng phẳng nếu có hai trong ba vectơ đó cùng phương.],
    [Trong hình hộp $A B C D.A' B' C' D'$ ba vectơ $arrow(A B'), arrow(C' A'), arrow(D A')$ đồng phẳng.],
    True([$arrow(x) = arrow(a) + arrow(b) + arrow(c)$ luôn đồng phẳng với hai vectơ $arrow(a)$ và $arrow(b)$.])
  ),
  loigiai: [
    #step[Đáp án A đúng: Vì vectơ $arrow(0)$ cùng phương với mọi vectơ nên bộ ba vectơ có chứa $arrow(0)$ luôn đồng phẳng.]
    #step[Đáp án B đúng: Nếu có hai vectơ cùng phương thì hai vectơ này và vectơ thứ ba luôn đồng phẳng (vì giá của chúng luôn song song hoặc nằm trên một mặt phẳng).]
    #step[Đáp án C đúng: Ta phân tích theo các cạnh lăng trụ:
    $arrow(A B') = arrow(A B) + arrow(A A')$, $arrow(C' A') = - arrow(A B) - arrow(A D)$, $arrow(D A') = - arrow(A D) + arrow(A A')$.
    Ta thấy $arrow(A B') + arrow(C' A') = arrow(A A') - arrow(A D) = arrow(D A')$.
    Vì $arrow(D A') = arrow(A B') + arrow(C' A')$ nên ba vectơ này đồng phẳng.]
    #step[Đáp án D sai: Vectơ $arrow(x) = arrow(a) + arrow(b) + arrow(c)$ chỉ đồng phẳng với $arrow(a)$ và $arrow(b)$ khi $arrow(c)$ đồng phẳng với $arrow(a)$ và $arrow(b)$. Nếu $arrow(a), arrow(b), arrow(c)$ không đồng phẳng thì $arrow(x)$ không thể đồng phẳng với $arrow(a)$ và $arrow(b)$.]
    #step[Kết luận: Chọn đáp án D.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    
    // Ceiling
    let ceiling_w = 1.5
    let O = (0, 3.5)
    line((-ceiling_w, O.at(1)), (ceiling_w, O.at(1)), stroke: 1.5pt + rgb("#333"))
    for i in range(-5, 6) {
      let x = i * 0.25
      line((x, O.at(1)), (x + 0.15, O.at(1) + 0.15), stroke: 0.8pt + gray)
    }
    
    circle(O, radius: 0.06, fill: black)
    content((O.at(0), O.at(1) + 0.35), $O$)
    
    // The suspended lamp disk (drawn as an ellipse)
    let lamp_center = (0, 0.5)
    let r_x = 1.6
    let r_y = 0.6
    
    // Points on the disk
    let A = (-1.2, 0.5 - 0.2)
    let B = (0.5, 0.5 + 0.45) // back point
    let C = (1.2, 0.5 - 0.1)
    
    // Back string OB (hidden part and visible part)
    line(O, B, stroke: (thickness: 1pt, dash: "dashed", paint: rgb("#7f8c8d")))
    
    // Draw lamp disk
    circle(lamp_center, radius: (r_x, r_y), fill: rgb(224, 234, 245, 80%), stroke: 1.5pt + rgb("#2980b9"))
    // Inner decorations
    circle(lamp_center, radius: (r_x * 0.8, r_y * 0.8), fill: none, stroke: 0.8pt + rgb("#3498db"))
    
    // Front strings
    line(O, A, stroke: 1.2pt + rgb("#2c3e50"))
    line(O, C, stroke: 1.2pt + rgb("#2c3e50"))
    
    // Force vectors at O
    let vA = (A.at(0) - O.at(0), A.at(1) - O.at(1))
    let vB = (B.at(0) - O.at(0), B.at(1) - O.at(1))
    let vC = (C.at(0) - O.at(0), C.at(1) - O.at(1))
    
    let scale = 0.4
    let F1 = (O.at(0) + vA.at(0)*scale, O.at(1) + vA.at(1)*scale)
    let F2 = (O.at(0) + vB.at(0)*scale, O.at(1) + vB.at(1)*scale)
    let F3 = (O.at(0) + vC.at(0)*scale, O.at(1) + vC.at(1)*scale)
    
    line(O, F1, stroke: 1.8pt + rgb("#e74c3c"), mark: (end: "stealth", fill: rgb("#e74c3c")))
    line(O, F2, stroke: 1.8pt + rgb("#e74c3c"), mark: (end: "stealth", fill: rgb("#e74c3c")))
    line(O, F3, stroke: 1.8pt + rgb("#e74c3c"), mark: (end: "stealth", fill: rgb("#e74c3c")))
    
    content((F1.at(0) - 0.35, F1.at(1) + 0.1), text(fill: rgb("#c0392b"))[$arrow(F_1)$])
    content((F2.at(0) + 0.4, F2.at(1) + 0.1), text(fill: rgb("#c0392b"))[$arrow(F_2)$])
    content((F3.at(0) + 0.4, F3.at(1) + 0.1), text(fill: rgb("#c0392b"))[$arrow(F_3)$])
    
    // Points labels
    circle(A, radius: 0.05, fill: black)
    circle(B, radius: 0.05, fill: black)
    circle(C, radius: 0.05, fill: black)
    content((A.at(0) - 0.25, A.at(1) - 0.2), $A$)
    content((B.at(0) + 0.2, B.at(1) + 0.2), $B$)
    content((C.at(0) + 0.25, C.at(1) - 0.2), $C$)
    
    // Gravity P
    circle(lamp_center, radius: 0.06, fill: rgb("#27ae60"))
    line(lamp_center, (lamp_center.at(0), lamp_center.at(1) - 1.5), stroke: 2.5pt + rgb("#27ae60"), mark: (end: "stealth", fill: rgb("#27ae60")))
    content((lamp_center.at(0) + 0.4, lamp_center.at(1) - 1.0), text(fill: rgb("#27ae60"))[$arrow(P)$])
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một chiếc đèn tròn được treo song song với mặt phẳng nằm ngang bởi ba sợi dây không dãn xuất phát từ điểm $O$ trên trần nhà và lần lượt buộc vào ba điểm $A, B, C$ trên đèn tròn sao cho các lực căng $arrow(F_1), arrow(F_2), arrow(F_3)$ lần lượt trên mỗi dây $O A, O B, O C$ đôi một vuông góc với nhau và $|arrow(F_1)| = |arrow(F_2)| = |arrow(F_3)| = 15$ (N). Tính trọng lượng của chiếc đèn tròn đó.],
  (
    [$14 sqrt(3) "N"$],
    True([$15 sqrt(3) "N"$]),
    [$17 sqrt(3) "N"$],
    [$16 sqrt(3) "N"$]
  ),
  loigiai: [
    #step[Chiếc đèn tròn ở trạng thái cân bằng dưới tác dụng của bốn lực: ba lực căng dây $arrow(F_1), arrow(F_2), arrow(F_3)$ và trọng lực $arrow(P)$.]
    #step[Điều kiện cân bằng lực:
    $arrow(F_1) + arrow(F_2) + arrow(F_3) + arrow(P) = arrow(0) <=> arrow(P) = - (arrow(F_1) + arrow(F_2) + arrow(F_3))$.]
    #step[Trọng lượng của chiếc đèn chính là độ lớn của trọng lực $arrow(P)$:
    $P = |arrow(P)| = |arrow(F_1) + arrow(F_2) + arrow(F_3)|$.]
    #step[Bình phương hai vế để tính độ lớn:
    $P^2 = |arrow(F_1) + arrow(F_2) + arrow(F_3)|^2$
    $= arrow(F_1)^2 + arrow(F_2)^2 + arrow(F_3)^2 + 2(arrow(F_1) dot arrow(F_2) + arrow(F_2) dot arrow(F_3) + arrow(F_3) dot arrow(F_1))$.]
    #step[Vì các lực căng đôi một vuông góc nên các tích vô hướng của chúng bằng 0:
    $arrow(F_1) dot arrow(F_2) = arrow(F_2) dot arrow(F_3) = arrow(F_3) dot arrow(F_1) = 0$.]
    #step[Do đó:
    $P^2 = |arrow(F_1)|^2 + |arrow(F_2)|^2 + |arrow(F_3)|^2 = 15^2 + 15^2 + 15^2 = 3 times 15^2$.]
    #step[Suy ra $P = 15 sqrt(3)$ (N).]
    #step[Kết luận: Chọn đáp án B.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    
    let S = (0, 3.5)
    
    // Square base (perspective)
    let A = (-1.5, 0.2)
    let B = (0.5, 1.0)
    let C = (1.5, 0.2)
    let D = (-0.5, -0.6)
    
    // Center O
    let O = (0, 0.2)
    
    // Back edges of the disc and base
    line(A, B, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    line(B, C, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    
    // Back string SB
    line(S, B, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    
    // Height SO
    line(S, O, stroke: (thickness: 0.8pt, dash: "dashed", paint: rgb("#e74c3c")))
    
    // Diagonals
    line(A, C, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(B, D, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    
    // Lamp disc (ellipse inscribed in ABCD roughly)
    circle(O, radius: (1.5, 0.5), fill: rgb(243, 156, 18, 40%), stroke: 1.5pt + rgb("#d35400"))
    // inner rings
    circle(O, radius: (1.2, 0.4), fill: none, stroke: 1pt + rgb("#e67e22"))
    circle(O, radius: (0.8, 0.25), fill: none, stroke: 1pt + rgb("#e67e22"))
    
    // Front edges of the frame
    line(A, D, stroke: 1.2pt + black)
    line(D, C, stroke: 1.2pt + black)
    
    // Front strings
    line(S, A, stroke: 1.5pt + rgb("#2c3e50"))
    line(S, D, stroke: 1.5pt + rgb("#2c3e50"))
    line(S, C, stroke: 1.5pt + rgb("#2c3e50"))
    
    // Gravity P
    circle(O, radius: 0.06, fill: rgb("#c0392b"))
    line(O, (0, -1.8), stroke: 2.5pt + rgb("#27ae60"), mark: (end: "stealth", fill: rgb("#27ae60")))
    content((0.4, -1.2), text(fill: rgb("#27ae60"))[$arrow(P)$])
    
    // Labels
    content((S.at(0), S.at(1) + 0.3), $S$)
    content((A.at(0) - 0.25, A.at(1)), $A$)
    content((B.at(0) + 0.2, B.at(1) + 0.2), $B$)
    content((C.at(0) + 0.25, C.at(1)), $C$)
    content((D.at(0) - 0.2, D.at(1) - 0.2), $D$)
    content((O.at(0) + 0.1, O.at(1) + 0.2), $O$)
    
    circle(A, radius: 0.05, fill: black)
    circle(B, radius: 0.05, fill: black)
    circle(C, radius: 0.05, fill: black)
    circle(D, radius: 0.05, fill: black)
    circle(S, radius: 0.05, fill: black)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một chiếc đèn chùm treo có khối lượng $m = 5$ kg được thiết kế với đĩa đèn được giữ bởi bốn đoạn xích $S A, S B, S C, S D$ sao cho $S.A B C D$ là hình chóp tứ giác đều có $hat(A S C) = 60^degree$. Tìm độ lớn của lực căng cho mỗi sợi xích. Lấy $g = 10$ m/s².],
  (
    [$15 sqrt(3)/3$ "N"],
    [$20 sqrt(3)/3$ "N"],
    True([$25 sqrt(3)/3$ "N"]),
    [$30 sqrt(3)/3$ "N"]
  ),
  loigiai: [
    #step[Trọng lực tác dụng lên chiếc đèn chùm có độ lớn:
    $P = m g = 5 times 10 = 50$ (N).]
    #step[Chiếc đèn chùm ở trạng thái cân bằng dưới tác dụng của trọng lực $arrow(P)$ và bốn lực căng xích $arrow(T_A), arrow(T_B), arrow(T_C), arrow(T_D)$:
    $arrow(T_A) + arrow(T_B) + arrow(T_C) + arrow(T_D) + arrow(P) = arrow(0) <=> arrow(T_A) + arrow(T_B) + arrow(T_C) + arrow(T_D) = - arrow(P)$.]
    #step[Do tính chất đối xứng của hình chóp tứ giác đều, độ lớn lực căng trên các sợi xích bằng nhau:
    $T = |arrow(T_A)| = |arrow(T_B)| = |arrow(T_C)| = |arrow(T_D)|$.]
    #step[Đồng thời, tổng các vectơ lực căng theo phương thẳng đứng sẽ cân bằng với trọng lực. Gọi $O$ là tâm của đáy $A B C D$ (hình vuông), ta có:
    $4 T cos hat(A S O) = P$.]
    #step[Xét tam giác $S A C$: có $S A = S C$ (do chóp đều) và góc $hat(A S C) = 60^degree$, nên tam giác $S A C$ là tam giác đều.]
    #step[Vì vậy, góc giữa cạnh bên $S A$ và trục thẳng đứng $S O$ bằng:
    $hat(A S O) = 1/2 hat(A S C) = 30^degree$.]
    #step[Thay các giá trị vào hệ thức cân bằng lực:
    $4 T cos 30^degree = 50 <=> 4 T dot sqrt(3)/2 = 50 <=> 2 sqrt(3) T = 50 <=> T = 25/sqrt(3) = (25 sqrt(3))/3$ (N).]
    #step[Kết luận: Chọn đáp án C.]
  ]
)

#my-tn(de: "Đề 1", 
  [Theo định luật II Newton thì gia tốc của một vật có cùng hướng với lực tác dụng lên vật. Độ lớn của gia tốc tỉ lệ thuận với độ lớn của lực và tỉ lệ nghịch với khối lượng của vật: $arrow(F) = m arrow(a)$, trong đó $arrow(a)$ là vectơ gia tốc (m/s²), $arrow(F)$ là vectơ lực (N). Muốn truyền cho quả bóng có khối lượng $0.5$ kg một gia tốc $50$ m/s² thì cần một lực đá có độ lớn là bao nhiêu?],
  (
    [$10$ N],
    [$15$ N],
    [$20$ N],
    True([$25$ N])
  ),
  loigiai: [
    #step[Theo định luật II Newton, độ lớn của lực tác dụng liên hệ với gia tốc và khối lượng qua công thức:
    $F = m a$.]
    #step[Thay số với $m = 0.5$ kg và $a = 50$ m/s²:]
    #step[$F = 0.5 times 50 = 25$ (N).]
    #step[Kết luận: Chọn đáp án D.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Apple
    circle((0, 0.8), radius: 0.6, fill: red.lighten(20%), stroke: 1.2pt + red)
    // Stem
    line((0, 1.4), (0.2, 1.7), stroke: 1.5pt + rgb("#8B4513"))
    // Leaf
    bezier((0.1, 1.65), (0.5, 1.8), (0.2, 1.8), (0.4, 1.7), stroke: 0.8pt + green, fill: green.lighten(30%))
    
    // Force vector
    line((0, 0.8), (0, -1.0), stroke: 2.2pt + rgb("#d32f2f"), mark: (end: "stealth", fill: rgb("#d32f2f")))
    content((0.4, -0.6), text(fill: rgb("#d32f2f"))[$arrow(P)$])
    
    // Label m
    content((0, 0.8), $m$)
    // Label g arrow
    line((-0.8, 0.8), (-0.8, 0.0), stroke: 1pt + rgb("#333"), mark: (end: "stealth"))
    content((-1.2, 0.4), $arrow(g)$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  [Nếu một vật có khối lượng $m$ (kg) thì lực hấp dẫn $arrow(P)$ của Trái Đất tác dụng lên vật được xác định theo công thức $arrow(P) = m arrow(g)$, trong đó $arrow(g)$ là gia tốc rơi tự do có độ lớn $g = 9.8$ m/s². Tính độ lớn của lực hấp dẫn của Trái Đất tác dụng lên một quả táo có khối lượng $105$ gam.],
  (
    True([$1.029$ N]),
    [$1.433$ N],
    [$2.096$ N],
    [$1.477$ N]
  ),
  loigiai: [
    #step[Trước tiên, ta đổi khối lượng của quả táo sang đơn vị kg:
    $m = 105 "gam" = 105/1000 "kg" = 0.105 "kg"$.]
    #step[Độ lớn lực hấp dẫn (trọng lực) tác dụng lên quả táo là:
    $P = m g = 0.105 times 9.8 = 1.029$ (N).]
    #step[Kết luận: Chọn đáp án A.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Draw two parallel charged plates
    line((-2.0, 1.2), (2.0, 1.2), stroke: 1.5pt + rgb("#d32f2f")) // top plate (+)
    line((-2.0, -1.2), (2.0, -1.2), stroke: 1.5pt + rgb("#2E7D32")) // bottom plate (-)
    
    // Plus and minus signs on plates
    for x in range(-7, 8) {
      let px = x * 0.25
      content((px, 1.4), text(size: 8pt, fill: rgb("#d32f2f"))[$+$])
      content((px, -1.4), text(size: 8pt, fill: rgb("#2E7D32"))[$-$])
    }
    
    // Electric field lines (downward arrows)
    for x in range(-3, 4) {
      let px = x * 0.5
      line((px, 1.1), (px, -1.1), stroke: 0.5pt + gray, mark: (end: "stealth", fill: gray))
    }
    content((2.3, 0), text(fill: gray)[$arrow(E)$])
    
    // Charged particle in field
    circle((0.2, 0.2), radius: 0.15, fill: rgb("#2E7D32").lighten(50%), stroke: 1pt + rgb("#2E7D32"))
    content((0.2, 0.2), text(size: 7pt, fill: rgb("#2E7D32"))[$+$])
    content((0.6, 0.2), $M$)
    
    // Force arrow
    line((0.2, 0.05), (0.2, -0.9), stroke: 1.5pt + blue, mark: (end: "stealth", fill: blue))
    content((0.4, -0.6), text(fill: blue)[$arrow(F)$])
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Trong điện trường đều, lực tĩnh điện $arrow(F)$ (đơn vị: N) tác dụng lên điện tích điểm có điện tích $q$ (đơn vị: C) được tính theo công thức $arrow(F) = q arrow(E)$, trong đó $arrow(E)$ là cường độ điện trường (đơn vị: N/C). Tính độ lớn của lực tĩnh điện tác dụng lên điện tích điểm khi $q = 10^(-9)$ C và độ lớn điện trường $E = 10^5$ N/C.],
  (
    True([$10^(-4)$ N]),
    [$2 dot 10^(-6)$ N],
    [$10^(-2)$ N],
    [$1.8 dot 10^(-6)$ N]
  ),
  loigiai: [
    #step[Độ lớn lực tĩnh điện tác dụng lên điện tích điểm được xác định bởi công thức:
    $F = |q| E$.]
    #step[Thay các giá trị $q = 10^(-9)$ C và $E = 10^5$ N/C vào công thức:
    $F = |10^(-9)| times 10^5 = 10^(-4)$ (N).]
    #step[Kết luận: Chọn đáp án A.]
  ]
)


#my-ds(de: "Đề 1", 
  [Trong không gian, cho tứ diện $A B C D$ có trọng tâm $G$. Xét tính đúng/sai của các phát biểu sau:],
  (
    True([$arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$.]),
    True([$arrow(O G) = 1/4 (arrow(O A) + arrow(O B) + arrow(O C) + arrow(O D))$ với mọi điểm $O$.]),
    True([$arrow(B G) = arrow(G A) + arrow(G C) + arrow(G D)$.]),
    [$arrow(A G) = 2/3 (arrow(A B) + arrow(A C) + arrow(A D))$.]
  ),
  loigiai: [
    #step[a) Theo định nghĩa trọng tâm tứ diện, $G$ là điểm thỏa mãn $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$. Do đó phát biểu này Đúng.]
    #step[b) Với mọi điểm $O$, chèn điểm $G$ ta có:
    $arrow(O A) + arrow(O B) + arrow(O C) + arrow(O D) = 4 arrow(O G) + (arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D)) = 4 arrow(O G)$.
    Suy ra $arrow(O G) = 1/4 (arrow(O A) + arrow(O B) + arrow(O C) + arrow(O D))$. Phát biểu này Đúng.]
    #step[c) Từ đẳng thức trọng tâm:
    $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0) <=> - arrow(G B) = arrow(G A) + arrow(G C) + arrow(G D) <=> arrow(B G) = arrow(G A) + arrow(G C) + arrow(G D)$. Phát biểu này Đúng.]
    #step[d) Ta có:
    $arrow(A G) = 1/4 (arrow(A A) + arrow(A B) + arrow(A C) + arrow(A D)) = 1/4 (arrow(A B) + arrow(A C) + arrow(A D))$.
    Vì hệ số là $1/4$ chứ không phải $2/3$ nên phát biểu này Sai.]
  ]
)

#my-ds(de: "Đề 1", 
  [Cho tứ diện $A B C D$. Gọi $M$ và $N$ lần lượt là trung điểm của $A B, C D$ và $G$ là trung điểm của $M N$. Xét tính đúng/sai của các phát biểu sau:],
  (
    True([$arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$.]),
    True([$arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D) = 4 arrow(M G)$.]),
    [$arrow(M N) = 1/2 (arrow(A B) + arrow(C D))$.],
    True([$2 arrow(M N) = arrow(A C) + arrow(B D)$.])
  ),
  loigiai: [
    #step[a) Do $M$ là trung điểm $A B$, ta có $arrow(G A) + arrow(G B) = 2 arrow(G M)$.
    Do $N$ là trung điểm $C D$, ta có $arrow(G C) + arrow(G D) = 2 arrow(G N)$.
    Do $G$ là trung điểm $M N$, ta có $arrow(G M) + arrow(G N) = arrow(0)$.
    Cộng lại ta được $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = 2(arrow(G M) + arrow(G N)) = arrow(0)$. (Đúng)]
    #step[b) Vì $G$ là trọng tâm tứ diện $A B C D$, với điểm $M$ bất kỳ ta luôn có:
    $arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D) = 4 arrow(M G)$. (Đúng)]
    #step[c) Ta phân tích vectơ $arrow(M N)$:
    $arrow(M N) = arrow(M A) + arrow(A D) + arrow(D N) = -1/2 arrow(A B) + arrow(A D) + 1/2 arrow(C D)$.
    Đẳng thức này không trùng với $1/2 (arrow(A B) + arrow(C D))$. (Sai)]
    #step[d) Ta có:
    - $arrow(M N) = arrow(M A) + arrow(A C) + arrow(C N) = -1/2 arrow(A B) + arrow(A C) + 1/2 arrow(C D)$.
    - $arrow(M N) = arrow(M B) + arrow(B D) + arrow(D N) = 1/2 arrow(A B) + arrow(B D) - 1/2 arrow(C D)$.
    Cộng vế theo vế ta được: $2 arrow(M N) = arrow(A C) + arrow(B D)$. (Đúng)]
  ]
)

#my-ds(de: "Đề 1", 
  [Trong không gian cho hình hộp $A B C D.A' B' C' D'$ tâm $O$. Xét tính đúng/sai của các phát biểu sau:],
  (
    True([$arrow(A C') = arrow(A B) + arrow(A D) + arrow(A A')$.]),
    True([$arrow(A B) + arrow(B C') + arrow(C D) + arrow(D' A) = arrow(0)$.]),
    [$arrow(A B) + arrow(A A') = arrow(A D) + arrow(D D')$.],
    True([$arrow(A B) + arrow(B C) + arrow(C C') = arrow(A D') + arrow(D' O) + arrow(O C')$.])
  ),
  loigiai: [
    #step[a) Áp dụng trực tiếp quy tắc hình hộp cho đỉnh $A$, ta có $arrow(A C') = arrow(A B) + arrow(A D) + arrow(A A')$. (Đúng)]
    #step[b) Biến đổi vế trái:
    $arrow(A B) + arrow(B C') + arrow(C D) + arrow(D' A) = arrow(A C') - arrow(D C) - arrow(A D')$ (vì $arrow(C D) = - arrow(D C)$ và $arrow(D' A) = - arrow(A D')$)
    $= arrow(A C') - arrow(A B) - (arrow(A D) + arrow(A A'))$ (do $arrow(D C) = arrow(A B)$ và $arrow(A D') = arrow(A D) + arrow(A A'))$
    $= arrow(A C') - (arrow(A B) + arrow(A D) + arrow(A A')) = arrow(A C') - arrow(A C') = arrow(0)$. (Đúng)]
    #step[c) Ta có $arrow(A B) + arrow(A A') = arrow(A B')$ và $arrow(A D) + arrow(D D') = arrow(A D')$.
    Trong hình hộp, hai vectơ đường chéo mặt $arrow(A B')$ và $arrow(A D')$ không bằng nhau trong trường hợp tổng quát. (Sai)]
    #step[d) Ta có:
    - Vế trái: $arrow(A B) + arrow(B C) + arrow(C C') = arrow(A C) + arrow(C C') = arrow(A C')$.
    - Vế phải: $arrow(A D') + arrow(D' O) + arrow(O C') = arrow(A O) + arrow(O C') = arrow(A C')$.
    Do đó hai vế bằng nhau. (Đúng)]
  ]
)

#my-ds(de: "Đề 1", 
  [Trong không gian, cho hình hộp $A B C D.A' B' C' D'$. Xét tính đúng/sai của các đẳng thức sau:],
  (
    True([$arrow(B C) + arrow(B A) = arrow(B' C') + arrow(B' A')$.]),
    True([$arrow(A D) + arrow(D' C') + arrow(D' A') = arrow(D C)$.]),
    True([$arrow(B C) + arrow(B A) + arrow(B B') = arrow(B D')$.]),
    [$arrow(B A) + arrow(D D') + arrow(B D') = arrow(B C)$.]
  ),
  loigiai: [
    #step[a) Vế trái bằng $arrow(B D)$ (quy tắc hình bình hành đáy đáy). Vế phải bằng $arrow(B' D')$. Vì đáy dưới và đáy trên là các hình bình hành bằng nhau nên $arrow(B D) = arrow(B' D')$. (Đúng)]
    #step[b) Ta có $arrow(A D) + arrow(D' A') = arrow(A' D') + arrow(D' A') = arrow(0)$ (vì $arrow(A D) = arrow(A' D')$).
    Hơn nữa, $arrow(D' C') = arrow(D C)$. Do đó vế trái rút gọn còn $arrow(D C)$. (Đúng)]
    #step[c) Áp dụng quy tắc hình hộp xuất phát từ đỉnh $B$, ta có $arrow(B C) + arrow(B A) + arrow(B B') = arrow(B D')$. (Đúng)]
    #step[d) Ta có $arrow(B A) + arrow(D D') = arrow(B A) + arrow(B B') = arrow(B A')$.
    Vế trái trở thành $arrow(B A') + arrow(B D') 
eq arrow(B C)$. (Sai)]
  ]
)

#my-ds(de: "Đề 1", 
  [Trong không gian, cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành tâm $O$. Gọi $G$ là điểm thỏa mãn $arrow(G S) + arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$. Xét tính đúng/sai của các phát biểu sau:],
  (
    [$arrow(A B) + arrow(B C) + arrow(C D) + arrow(D A) = arrow(S O)$.],
    True([$arrow(O A) + arrow(O B) + arrow(O C) + arrow(O D) = arrow(0)$.]),
    True([$arrow(S B) + arrow(S D) = arrow(S A) + arrow(S C)$.]),
    [$arrow(G S) = 3 arrow(O G)$.]
  ),
  loigiai: [
    #step[a) Vế trái: $arrow(A B) + arrow(B C) + arrow(C D) + arrow(D A) = arrow(A C) + arrow(C A) = arrow(0)$.
    Còn $arrow(S O) 
eq arrow(0)$ vì $S$ không trùng $O$. (Sai)]
    #step[b) Do $O$ là tâm hình bình hành $A B C D$ nên $O$ là trung điểm $A C$ và $B D$.
    Ta có $arrow(O A) + arrow(O C) = arrow(0)$ và $arrow(O B) + arrow(O D) = arrow(0)$, suy ra tổng bằng $arrow(0)$. (Đúng)]
    #step[c) Áp dụng quy tắc trung điểm với điểm $S$:
    $arrow(S A) + arrow(S C) = 2 arrow(S O)$ và $arrow(S B) + arrow(S D) = 2 arrow(S O)$. Do đó chúng bằng nhau. (Đúng)]
    #step[d) Vì $O$ là tâm của hình bình hành $A B C D$ nên $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = 4 arrow(G O)$.
    Thay vào giả thiết: $arrow(G S) + 4 arrow(G O) = arrow(0) <=> arrow(G S) = 4 arrow(O G)$.
    Mệnh đề ghi hệ số 3 nên là Sai.]
  ]
)

#my-ds(de: "Đề 1", 
  [Trong không gian, cho hình lập phương $A B C D.A' B' C' D'$ có cạnh bằng $a$. Gọi $I$ là tâm hình vuông $A B C D$, gọi $G$ là trọng tâm của tam giác $A B' C$. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([$arrow(A B) + arrow(A D) + arrow(A A') = arrow(A C')$.]),
    [$arrow(G A) + arrow(G B') + arrow(G C) = 2 arrow(G I)$.],
    True([$arrow(A B) + arrow(A D) = arrow(A' C')$.]),
    [$arrow(B D') = 2 arrow(B G)$.]
  ),
  loigiai: [
    #step[a) Áp dụng quy tắc hình hộp cho đỉnh $A$ ta có trực tiếp $arrow(A B) + arrow(A D) + arrow(A A') = arrow(A C')$. (Đúng)]
    #step[b) Vì $G$ là trọng tâm của tam giác $A B' C$ nên ta có $arrow(G A) + arrow(G B') + arrow(G C) = arrow(0) 
eq 2 arrow(G I)$. (Sai)]
    #step[c) Ta có $arrow(A B) + arrow(A D) = arrow(A C)$. Mà mặt bên hình lập phương có các cạnh song song và bằng nhau nên $arrow(A C) = arrow(A' C')$. Vậy $arrow(A B) + arrow(A D) = arrow(A' C')$. (Đúng)]
    #step[d) Chọn hệ trục tọa độ với $B(0;0;0)$. Khi đó $A(a;0;0)$, $C(0;a;0)$, $B'(0;0;a)$.
    Trọng tâm $G$ của tam giác $A B' C$ có tọa độ $G(a/3; a/3; a/3) => arrow(B G) = (a/3; a/3; a/3)$.
    Điểm $D'(a; a; a) => arrow(B D') = (a; a; a) = 3 arrow(B G)$.
    Đẳng thức đúng phải là $arrow(B D') = 3 arrow(B G)$ chứ không phải $2 arrow(B G)$. (Sai)]
  ]
)

#my-ds(de: "Đề 1", 
  [Trong không gian, cho tứ diện $A B C D$. Gọi $M, N$ lần lượt là trung điểm $A D, B C$. Xét tính đúng/sai của các phát biểu sau:],
  (
    True([Ba vectơ $arrow(A B), arrow(D C), arrow(M N)$ đồng phẳng.]),
    True([Ba vectơ $arrow(A B), arrow(A C), arrow(M N)$ không đồng phẳng.]),
    [Ba vectơ $arrow(A N), arrow(C M), arrow(M N)$ đồng phẳng.],
    True([Ba vectơ $arrow(B D), arrow(A C), arrow(M N)$ đồng phẳng.])
  ),
  loigiai: [
    #step[a) Ta có hệ thức vectơ:
    $arrow(M N) = 1/2 (arrow(A B) + arrow(D C))$.
    Vì $arrow(M N)$ đồng phẳng với $arrow(A B)$ và $arrow(D C)$ (biểu diễn tuyến tính được qua hai vectơ này) nên ba vectơ đồng phẳng. (Đúng)]
    #step[b) Ba vectơ $arrow(A B), arrow(A C), arrow(M N)$ có giá không song song với cùng một mặt phẳng (đường thẳng $M N$ cắt mặt phẳng $(A B C)$). Do đó chúng không đồng phẳng. (Đúng)]
    #step[c) Ba vectơ $arrow(A N), arrow(C M), arrow(M N)$ không cùng song song với bất kỳ mặt phẳng nào trong trường hợp tứ diện tổng quát. (Sai)]
    #step[d) Ta có hệ thức vectơ tương tự:
    $2 arrow(M N) = arrow(A C) + arrow(D B) = arrow(A C) - arrow(B D)$.
    Vì $arrow(M N)$ biểu diễn tuyến tính được qua $arrow(A C)$ và $arrow(B D)$ nên ba vectơ đồng phẳng. (Đúng)]
  ]
)

#my-ds(de: "Đề 1", 
  [Trong không gian, cho tứ diện $A B C D$. Trên cạnh $A D$ và $B C$ lần lượt lấy các điểm $M, N$ sao cho $A M = 3 M D$ và $B N = 3 N C$. Gọi $P, Q$ lần lượt là trung điểm $A D$ và $B C$. Xét tính đúng/sai của các phát biểu sau:],
  (
    [$arrow(P Q) = arrow(A C) + arrow(D B)$.],
    True([$arrow(M N) = arrow(M A) + arrow(A C) + arrow(C N)$.]),
    True([$arrow(M N) = arrow(M D) + arrow(D B) + arrow(B N)$.]),
    [Ba vectơ $arrow(B D), arrow(A C), arrow(M N)$ đồng phẳng.]
  ),
  loigiai: [
    #step[a) Đẳng thức đúng phải là $2 arrow(P Q) = arrow(A C) + arrow(D B)$. Do thiếu hệ số 2 nên phát biểu này Sai.]
    #step[b) Theo quy tắc cộng vectơ (quy tắc đa giác), ta có $arrow(M N) = arrow(M A) + arrow(A C) + arrow(C N)$ luôn luôn đúng. (Đúng)]
    #step[c) Tương tự, $arrow(M N) = arrow(M D) + arrow(D B) + arrow(B N)$ luôn đúng bằng phép chèn điểm liên tiếp. (Đúng)]
    #step[d) Biểu diễn vectơ $arrow(M N)$ theo hệ cơ sở $\{arrow(A B), arrow(A C), arrow(A D)\}$:
    $arrow(M N) = arrow(A N) - arrow(A M) = (arrow(A B) + 3/4 (arrow(A C) - arrow(A B))) - 3/4 arrow(A D) = 1/4 arrow(A B) + 3/4 arrow(A C) - 3/4 arrow(A D)$.
    Mà $arrow(B D) = arrow(A D) - arrow(A B)$. Ta thấy không thể biểu diễn $arrow(M N) = x arrow(A C) + y arrow(B D)$ vì hệ số của $arrow(A B)$ và $arrow(A D)$ trong biểu thức không đối xứng như trong $arrow(B D)$ (tỉ số hệ số là $-3$ so với $-1$).
    Do đó ba vectơ này không đồng phẳng. (Sai)]
  ]
)

#my-ds(de: "Đề 1", 
  [Cho hình hộp chữ nhật $A B C D.A' B' C' D'$ có cạnh $A B = a$, $A D = a sqrt(3)$, $A A' = 2a$. Xét tính đúng/sai của các khẳng định sau:],
  (
    [$arrow(A B') + arrow(C D') = arrow(0)$.],
    True([$arrow(A' D) + arrow(C B') = arrow(0)$.]),
    [$|arrow(A B) + arrow(A D)| = a sqrt(5)$.],
    True([$|arrow(A B) + arrow(A' D') + arrow(C C')| = 2 sqrt(2) a$.])
  ),
  loigiai: [
    #step[a) Ta có $arrow(A B') = arrow(A B) + arrow(A A')$ và $arrow(C D') = arrow(C D) + arrow(C C') = - arrow(A B) + arrow(A A')$.
    Do đó $arrow(A B') + arrow(C D') = 2 arrow(A A') 
eq arrow(0)$. (Sai)]
    #step[b) Ta có $arrow(A' D) = arrow(A D) - arrow(A A')$ và $arrow(C B') = arrow(C B) + arrow(B B') = - arrow(A D) + arrow(A A')$.
    Suy ra $arrow(A' D) + arrow(C B') = arrow(0)$. (Đúng)]
    #step[c) Ta có $arrow(A B) + arrow(A D) = arrow(A C)$ (do đáy là hình chữ nhật).
    Độ dài là $|arrow(A C)| = sqrt(A B^2 + A D^2) = sqrt(a^2 + (a sqrt(3))^2) = 2a 
eq a sqrt(5)$. (Sai)]
    #step[d) Ta có $arrow(A' D') = arrow(A D)$ và $arrow(C C') = arrow(A A')$.
    Do đó $arrow(A B) + arrow(A' D') + arrow(C C') = arrow(A B) + arrow(A D) + arrow(A A') = arrow(A C')$.
    Độ dài đường chéo hình hộp chữ nhật: $|arrow(A C')| = sqrt(A B^2 + A D^2 + A A'^2) = sqrt(a^2 + 3a^2 + 4a^2) = sqrt(8a^2) = 2 sqrt(2) a$. (Đúng)]
  ]
)

#my-ds(de: "Đề 1", 
  [Trong không gian, cho hình lập phương $A B C D.A' B' C' D'$ có cạnh bằng $a$. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([$arrow(B' B) - arrow(D B) = arrow(B' D)$.]),
    [$arrow(B A) + arrow(B C) + arrow(B B') = arrow(B D)$.],
    [$|arrow(B A) + arrow(B C) + arrow(B B')| = a sqrt(2)$.],
    [$|arrow(B C) - arrow(B A) + arrow(C' A')| = a$.]
  ),
  loigiai: [
    #step[a) Ta biến đổi: $arrow(B' B) - arrow(D B) = arrow(B' B) + arrow(B D) = arrow(B' D)$. (Đúng)]
    #step[b) Theo quy tắc hình hộp cho đỉnh $B$ của hình lập phương: $arrow(B A) + arrow(B C) + arrow(B B') = arrow(B D')$. Đề ghi $arrow(B D)$ là Sai.]
    #step[c) Độ dài vectơ tổng là độ dài đường chéo hình lập phương: $|arrow(B D')| = sqrt(a^2 + a^2 + a^2) = a sqrt(3) 
eq a sqrt(2)$. (Sai)]
    #step[d) Rút gọn biểu thức vectơ:
    $arrow(B C) - arrow(B A) + arrow(C' A') = arrow(A C) + arrow(C' A') = arrow(A C) - arrow(A C) = arrow(0)$ (vì $arrow(C' A') = - arrow(A' C') = - arrow(A C)$).
    Độ dài bằng 0 chứ không phải bằng $a$. (Sai)]
  ]
)

#my-ds(de: "Đề 1", 
  [Trong không gian, cho tứ diện $A B C D$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A D$ và $B C$, $I$ là trung điểm $M N$. Xét tính đúng/sai của các đẳng thức sau:],
  (
    True([$arrow(A B) - arrow(C D) = arrow(A C) - arrow(B D)$.]),
    True([$arrow(A B) + arrow(C D) = arrow(A D) + arrow(C B)$.]),
    True([$arrow(A B) + arrow(D C) = 2 arrow(M N)$.]),
    True([$arrow(I A) + arrow(I B) + arrow(I C) + arrow(I D) = arrow(0)$.])
  ),
  loigiai: [
    #step[a) Đẳng thức tương đương: $arrow(A B) + arrow(B D) = arrow(A C) + arrow(C D) <=> arrow(A D) = arrow(A D)$ (luôn đúng). (Đúng)]
    #step[b) Đẳng thức tương đương: $arrow(A B) - arrow(A D) = arrow(C B) - arrow(C D) <=> arrow(D B) = arrow(D B)$ (luôn đúng). (Đúng)]
    #step[c) Ta phân tích:
    - $arrow(M N) = arrow(M A) + arrow(A B) + arrow(B N)$
    - $arrow(M N) = arrow(M D) + arrow(D C) + arrow(C N)$
    Cộng hai đẳng thức trên, chú ý $arrow(M A) + arrow(M D) = arrow(0)$ và $arrow(B N) + arrow(C N) = arrow(0)$, ta được:
    $2 arrow(M N) = arrow(A B) + arrow(D C)$. (Đúng)]
    #step[d) Vì $M, N$ là trung điểm $A D, B C$ nên $arrow(I A) + arrow(I D) = 2 arrow(I M)$ và $arrow(I B) + arrow(I C) = 2 arrow(I N)$.
    Do $I$ là trung điểm $M N$ nên $2(arrow(I M) + arrow(I N)) = arrow(0)$.
    Vậy $arrow(I A) + arrow(I B) + arrow(I C) + arrow(I D) = arrow(0)$. (Đúng)]
  ]
)

#my-ds(de: "Đề 1", 
  dir: "doc",
  fig: canvas(length: 1.1cm, {
    import draw: *
    // Vertex E (hook point) and cable lines
    let E = (0, 3.0)
    content((0, 3.2), $E$)
    
    // Bottom rectangle base ABCD of the iron frame
    let A = (-1.5, 0.4)
    let B = (-0.5, 1.2)
    let C = (1.5, 0.8)
    let D = (0.5, 0.0)
    
    // Draw cables
    line(E, A, stroke: 1pt + rgb("#333"), mark: (end: "stealth", fill: blue))
    line(E, B, stroke: 0.8pt + rgb("#aaa"), mark: (end: "stealth", fill: blue)) // back cable
    line(E, C, stroke: 1pt + rgb("#333"), mark: (end: "stealth", fill: blue))
    line(E, D, stroke: 1pt + rgb("#333"), mark: (end: "stealth", fill: blue))
    
    // Force labels
    content((-0.9, 1.9), text(fill: blue)[$arrow(F_1)$])
    content((-0.2, 2.1), text(fill: blue)[$arrow(F_2)$])
    content((0.9, 1.9), text(fill: blue)[$arrow(F_3)$])
    content((0.4, 1.6), text(fill: blue)[$arrow(F_4)$])
    
    // Draw iron frame (rectangular box)
    // base ABCD
    line(A, D, stroke: 1.5pt + black)
    line(D, C, stroke: 1.5pt + black)
    line(C, B, stroke: 0.8pt + gray)
    line(B, A, stroke: 0.8pt + gray)
    
    // vertical pillars down to support platform
    let A_d = (-1.5, -0.8)
    let B_d = (-0.5, 0.0)
    let C_d = (1.5, -0.4)
    let D_d = (0.5, -1.2)
    
    line(A, A_d, stroke: 1.5pt + black)
    line(B, B_d, stroke: 0.8pt + gray)
    line(C, C_d, stroke: 1.5pt + black)
    line(D, D_d, stroke: 1.5pt + black)
    
    // bottom platform
    line(A_d, D_d, stroke: 1.8pt + black)
    line(D_d, C_d, stroke: 1.8pt + black)
    line(C_d, B_d, stroke: 0.8pt + gray)
    line(B_d, A_d, stroke: 0.8pt + gray)
    
    // Draw a simplified red car on the platform
    rect((-0.6, -0.8), (0.6, -0.4), fill: red, stroke: 1pt + red)
    circle((-0.3, -0.8), radius: 0.15, fill: black)
    circle((0.3, -0.8), radius: 0.15, fill: black)
    
    // Labels of vertices
    content((-1.7, 0.4), $A$)
    content((-0.7, 1.35), $B$)
    content((1.7, 0.8), $C$)
    content((0.6, -0.15), $D$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một chiếc ô tô được đặt trên mặt đáy dưới của một khung sắt có dạng hình hộp chữ nhật với đáy trên là hình chữ nhật $A B C D$, mặt phẳng $(A B C D)$ song song với mặt phẳng nằm ngang. Khung sắt đó được buộc vào móc $E$ của chiếc cần cẩu sao cho các đoạn dây cáp $E A, E B, E C, E D$ có độ dài bằng nhau và cùng tạo với mặt phẳng $(A B C D)$ một góc bằng $60^degree$. Chiếc cần cẩu kéo khung sắt lên theo phương thẳng đứng. Biết rằng các lực căng $arrow(F_1), arrow(F_2), arrow(F_3), arrow(F_4)$ đều có cường độ là $4700$ N và trọng lượng của khung sắt là $3000$ N. Xét tính đúng/sai của các phát biểu sau:],
  (
    [$arrow(F_1) + arrow(F_2) = arrow(F_3) + arrow(F_4)$.],
    True([$arrow(F_1) + arrow(F_3) = arrow(F_2) + arrow(F_4)$.]),
    True([$|arrow(F_1) + arrow(F_3)| = 8141$ N (làm tròn đến hàng đơn vị).]),
    [Trọng lượng của chiếc xe ô tô là $16282$ N (làm tròn đến hàng đơn vị).]
  ),
  loigiai: [
    #step[a) Các vectơ lực căng $arrow(F_1), arrow(F_2)$ hướng từ $E$ đến $A, B$, còn $arrow(F_3), arrow(F_4)$ hướng từ $E$ đến $C, D$. Các cặp này không thể bằng nhau vì phương hướng khác nhau. (Sai)]
    #step[b) Do tính chất đối xứng của hình chữ nhật $A B C D$, hai dây đối diện $E A$ và $E C$ tạo thành các góc bằng nhau với trục thẳng đứng. Tổng hợp lực căng của cặp đối diện $arrow(F_1) + arrow(F_3)$ hướng thẳng đứng lên trên.
    Tương tự, $arrow(F_2) + arrow(F_4)$ cũng hướng thẳng đứng lên trên và có độ lớn bằng nhau. Do đó chúng là hai vectơ bằng nhau. (Đúng)]
    #step[c) Độ lớn của hợp lực hai dây đối diện $arrow(F_1)$ và $arrow(F_3)$ là:
    $|arrow(F_1) + arrow(F_3)| = 2 F_1 sin 60^degree = 2 times 4700 times sqrt(3)/2 = 4700 sqrt(3) approx 8140.64$ (N).
    Làm tròn đến hàng đơn vị ta được $8141$ N. (Đúng)]
    #step[d) Tổng hợp lực nâng của 4 sợi dây cáp là lực nâng thẳng đứng hướng lên:
    $F_("nâng") = 4 F_1 sin 60^degree = 4 times 4700 times sqrt(3)/2 = 9400 sqrt(3) approx 16281.27$ (N).
    Trọng lượng tổng cộng của khung sắt và ô tô khi nâng thẳng đứng đều là $P_("tổng") = F_("nâng") approx 16281$ N.
    Trọng lượng của ô tô là: $P_("ô tô") = P_("tổng") - P_("khung") = 16281 - 3000 = 13281$ (N).
    Phát biểu ghi trọng lượng xe ô tô là $16282$ N là Sai (đây là trọng lượng của cả xe và khung sắt). (Sai)]
  ]
)


#my-tln(de: "Đề 1", 
  [Trong không gian, cho hình lập phương $A B C D.A' B' C' D'$ biết rằng $arrow(A N) = -4 arrow(A B) + k arrow(A A') - 2 arrow(A D)$ ($k in RR$) và $arrow(A M) = 2 arrow(A B) + arrow(A A') - 3 arrow(A D)$. Tìm giá trị $k$ thích hợp để $arrow(A N) perp arrow(A M)$.],
  [$2$],
  loigiai: [
    #step[Chọn hệ tọa độ có gốc là đỉnh $A$ của hình lập phương, các trục trùng với các cạnh xuất phát từ $A$. Không mất tính tổng quát, giả sử độ dài cạnh hình lập phương bằng 1.
    Khi đó, các vectơ cơ sở $arrow(A B), arrow(A D), arrow(A A')$ đôi một vuông góc và có độ dài bằng 1.]
    #step[Tọa độ các vectơ:
    - $arrow(A N) = (-4; -2; k)$.
    - $arrow(A M) = (2; -3; 1)$.]
    #step[Điều kiện để $arrow(A N) perp arrow(A M)$ là tích vô hướng của chúng bằng 0:
    $arrow(A N) dot arrow(A M) = 0 <=> (-4) times 2 + (-2) times (-3) + k times 1 = 0$
    $<=> -8 + 6 + k = 0 <=> k - 2 = 0 <=> k = 2$.]
    #step[Vậy giá trị thích hợp là $k = 2$.]
  ]
)

#my-tln(de: "Đề 1", 
  [Trong không gian, cho hình chóp $S.A B C D$ có đáy là hình bình hành tâm $O$, $M$ là điểm thay đổi trên $S O$. Tìm tỉ số $(S M) / (S O)$ để biểu thức $P = M S^2 + M A^2 + M B^2 + M C^2 + M D^2$ đạt giá trị nhỏ nhất.],
  [$0.8$],
  loigiai: [
    #step[Chọn tâm $O$ làm gốc tọa độ. Do $O$ là tâm hình bình hành $A B C D$ nên ta có:
    $arrow(O A) + arrow(O C) = arrow(0)$ và $arrow(O B) + arrow(O D) = arrow(0)$.]
    #step[Ta biến đổi tổng bình phương khoảng cách:
    $M A^2 + M C^2 = (arrow(O A) - arrow(O M))^2 + (arrow(O C) - arrow(O M))^2 = 2 O M^2 + O A^2 + O C^2$ (vì $arrow(O A) + arrow(O C) = arrow(0)$).
    Tương tự: $M B^2 + M D^2 = 2 O M^2 + O B^2 + O D^2$.]
    #step[Do đó:
    $P = M S^2 + 4 O M^2 + C$, với $C = O A^2 + O B^2 + O C^2 + O D^2$ là hằng số.]
    #step[Vì $M$ nằm trên đoạn thẳng $S O$, đặt $arrow(O M) = (1-y) arrow(O S)$ với $y = S M / S O$ (điều kiện $0 <= y <= 1$).
    Khi đó, $arrow(M S) = y arrow(O S)$.]
    #step[Biểu thức $P$ trở thành:
    $P = y^2 O S^2 + 4 (1-y)^2 O S^2 + C = O S^2 (5 y^2 - 8 y + 4) + C$.]
    #step[Để $P$ đạt giá trị nhỏ nhất, ta tìm giá trị nhỏ nhất của tam thức bậc hai $f(y) = 5 y^2 - 8 y + 4$ trên đoạn $[0; 1]$.
    Tọa độ đỉnh của parabol là: $y = -(-8) / (2 times 5) = 8/10 = 0.8$ (thỏa mãn điều kiện).]
    #step[Vậy tỉ số $S M / S O$ để $P$ nhỏ nhất bằng $0.8$ (hoặc $4/5$).]
  ]
)

#my-tln(de: "Đề 1", 
  [Trong không gian, cho tứ diện $A B C D$ có các điểm $M, N, P$ lần lượt thuộc các cạnh $B C, B D, A C$ sao cho $B C = 4 B M$, $A C = 3 A P$, $B D = 2 B N$. Mặt phẳng $(M N P)$ cắt đường thẳng $A D$ tại điểm $Q$. Tính tỉ số $(A Q) / (A D)$.],
  [$0.6$],
  loigiai: [
    #step[Chọn điểm $A$ làm gốc tọa độ. Đặt $arrow(A B) = arrow(b)$, $arrow(A C) = arrow(c)$, $arrow(A D) = arrow(d)$.
    Theo giả thiết, ta biểu diễn tọa độ các điểm $M, N, P, Q$ như sau:
    - $arrow(A P) = 1/3 arrow(c)$.
    - $B C = 4 B M => arrow(B M) = 1/4 arrow(B C) => arrow(A M) = 3/4 arrow(b) + 1/4 arrow(c)$.
    - $B D = 2 B N => arrow(A N) = 1/2 arrow(b) + 1/2 arrow(d)$.
    - $Q$ thuộc $A D => arrow(A Q) = k arrow(d)$.]
    #step[Vì bốn điểm $M, N, P, Q$ đồng phẳng nên ba vectơ $arrow(P M), arrow(P N), arrow(P Q)$ đồng phẳng. Ta tính chúng theo hệ cơ sở:
    - $arrow(P M) = arrow(A M) - arrow(A P) = 3/4 arrow(b) - 1/12 arrow(c)$.
    - $arrow(P N) = arrow(A N) - arrow(A P) = 1/2 arrow(b) - 1/3 arrow(c) + 1/2 arrow(d)$.
    - $arrow(P Q) = arrow(A Q) - arrow(A P) = -1/3 arrow(c) + k arrow(d)$.]
    #step[Vì ba vectơ đồng phẳng nên tồn tại hai số thực $x, y$ sao cho:
    $arrow(P Q) = x arrow(P M) + y arrow(P N)$
    $<=> -1/3 arrow(c) + k arrow(d) = (3/4 x + 1/2 y) arrow(b) - (1/12 x + 1/3 y) arrow(c) + 1/2 y arrow(d)$.]
    #step[Đồng nhất hệ số của các vectơ độc lập tuyến tính $arrow(b), arrow(c), arrow(d)$, ta có hệ phương trình:
    $heva(3/4 x + 1/2 y = 0, 1/12 x + 1/3 y = 1/3, 1/2 y = k) <=> heva(3x + 2y = 0, x + 4y = 4, k = 1/2 y)$.]
    #step[Giải hệ hai phương trình đầu:
    $x + 4(-1.5 x) = 4 <=> -5x = 4 <=> x = -4/5$
    $=> y = -1.5 times (-4/5) = 6/5$.]
    #step[Thay $y = 6/5$ vào phương trình cuối ta tìm được:
    $k = 1/2 times 6/5 = 3/5 = 0.6$.
    Do đó $arrow(A Q) = 0.6 arrow(A D) => A Q / A D = 0.6$.]
  ]
)

#my-tln(de: "Đề 1", 
  [Trong không gian, cho tứ diện $S.A B C$ có $S A = S B = S C = A B = A C = 2$, $B C = 2 sqrt(2)$. Hãy tính tích vô hướng $arrow(S C) dot arrow(A B)$.],
  [$-2$],
  loigiai: [
    #step[Xét tam giác $A B C$: có $A B = A C = 2$ và $B C = 2 sqrt(2)$.
    Ta thấy $A B^2 + A C^2 = 2^2 + 2^2 = 8 = B C^2$. Do đó tam giác $A B C$ vuông cân tại $A$.]
    #step[Xét tam giác $S B C$: tương tự có $S B = S C = 2$ và $B C = 2 sqrt(2)$ nên tam giác $S B C$ vuông cân tại $S$. Suy ra $arrow(S B) perp arrow(S C) <=> arrow(S B) dot arrow(S C) = 0$.]
    #step[Xét tam giác $S A C$: có $S A = S C = A C = 2$ nên tam giác $S A C$ là tam giác đều.
    Do đó góc $hat(A S C) = 60^degree$. Tích vô hướng:
    $arrow(S A) dot arrow(S C) = S A dot S C dot cos 60^degree = 2 times 2 times 1/2 = 2$.]
    #step[Ta tính tích vô hướng đề bài yêu cầu:
    $arrow(S C) dot arrow(A B) = arrow(S C) dot (arrow(S B) - arrow(S A)) = arrow(S C) dot arrow(S B) - arrow(S C) dot arrow(S A) = 0 - 2 = -2$.]
  ]
)

#my-tln(de: "Đề 1", 
  [Trong không gian, cho tứ diện $A B C D$. Gọi $E, F$ lần lượt là trung điểm của $A B, C D$. Cho $A B = 2a$, $C D = 2b$, $E F = 2c$. Với $M$ là một điểm tùy ý, biết tổng $M A^2 + M B^2 = k M E^2 + l a^2$. Tính giá trị của biểu thức $k + l$.],
  [$4$],
  loigiai: [
    #step[Vì $E$ là trung điểm của đoạn thẳng $A B$, nên $M E$ là trung tuyến của tam giác $M A B$.]
    #step[Theo công thức độ dài đường trung tuyến trong tam giác $M A B$, ta luôn có:
    $M E^2 = (M A^2 + M B^2)/2 - A B^2/4$
    $<=> M A^2 + M B^2 = 2 M E^2 + A B^2/2$.]
    #step[Theo đề bài $A B = 2a$, thay vào hệ thức trên:
    $M A^2 + M B^2 = 2 M E^2 + (2a)^2/2 = 2 M E^2 + 2 a^2$.]
    #step[Đồng nhất hệ số với biểu thức $k M E^2 + l a^2$, ta có:
    $k = 2$ và $l = 2$.
    Vậy $k + l = 2 + 2 = 4$.]
  ]
)

#my-tln(de: "Đề 1", 
  [Trong không gian, cho hình hộp $A B C D.A' B' C' D'$. Biết $arrow(M A) = k arrow(M C)$, $arrow(N C') = l arrow(N D)$. Khi $M N$ song song với $B D'$ thì $k + l$ có giá trị là bao nhiêu?],
  [$-4$],
  loigiai: [
    #step[Chọn điểm $A$ làm gốc tọa độ. Đặt $arrow(A B) = arrow(a)$, $arrow(A D) = arrow(b)$, $arrow(A A') = arrow(c)$.
    Khi đó tọa độ các đỉnh:
    - $B = arrow(a)$, $C = arrow(a) + arrow(b)$, $D = arrow(b)$, $D' = arrow(b) + arrow(c)$.
    - Vectơ đường chéo: $arrow(B D') = arrow(b) + arrow(c) - arrow(a)$.]
    #step[Xác định vị trí điểm $M$ từ $arrow(M A) = k arrow(M C)$:
    $arrow(M A) - k arrow(M C) = arrow(0) <=> arrow(A M) = -k / (1 - k) arrow(A C) = -k / (1-k) (arrow(a) + arrow(b))$.
    Đặt $x = -k / (1-k)$, ta có $arrow(A M) = x arrow(a) + x arrow(b)$.]
    #step[Xác định vị trí điểm $N$ từ $arrow(N C') = l arrow(N D)$:
    $arrow(A N) - arrow(A C') = l (arrow(A D) - arrow(A N)) <=> (1-l) arrow(A N) = arrow(A C') - l arrow(A D)$.
    Vì $arrow(A C') = arrow(a) + arrow(b) + arrow(c)$ và $arrow(A D) = arrow(b)$:
    $arrow(A N) = 1/(1-l) arrow(a) + arrow(b) + 1/(1-l) arrow(c)$.
    Đặt $y = 1/(1-l)$, ta có $arrow(A N) = y arrow(a) + arrow(b) + y arrow(c)$.]
    #step[Vectơ $arrow(M N) = arrow(A N) - arrow(A M) = (y - x) arrow(a) + (1 - x) arrow(b) + y arrow(c)$.]
    #step[Để $M N parallel B D'$, tồn tại số thực $t != 0$ sao cho $arrow(M N) = t arrow(B D')$:
    $heva(y - x = -t, 1 - x = t, y = t) <=> heva(t - x = -t, 1 - x = t, y = t) <=> heva(x = 2t, 1 - 2t = t, y = t) <=> heva(t = 1/3, x = 2/3, y = 1/3)$.]
    #step[Từ các giá trị này ta tìm lại $k, l$:
    - $x = -k / (1-k) = 2/3 <=> -3k = 2 - 2k <=> k = -2$.
    - $y = 1 / (1-l) = 1/3 <=> 3 = 1 - l <=> l = -2$.
    Vậy $k + l = -2 + (-2) = -4$.]
  ]
)

#my-tln(de: "Đề 1", 
  [Trong không gian, cho hình hộp $A B C D.A_1 B_1 C_1 D_1$ có $G_1; G_2$ lần lượt là trọng tâm tam giác $B D A_1$ và $C B_1 D_1$. Biết $arrow(A C_1) = a arrow(A G_1) + b arrow(A G_2)$. Tính $a + b$.],
  [$2$],
  loigiai: [
    #step[Chọn điểm $A$ làm gốc tọa độ. Đặt các vectơ cạnh là $arrow(A B) = arrow(u)$, $arrow(A D) = arrow(v)$, $arrow(A A_1) = arrow(w)$.
    Vectơ đường chéo: $arrow(A C_1) = arrow(u) + arrow(v) + arrow(w)$.]
    #step[Vì $G_1$ là trọng tâm tam giác $B D A_1$, ta có:
    $arrow(A G_1) = 1/3 (arrow(A B) + arrow(A D) + arrow(A A_1)) = 1/3 (arrow(u) + arrow(v) + arrow(w)) = 1/3 arrow(A C_1)$.]
    #step[Vì $G_2$ là trọng tâm tam giác $C B_1 D_1$, ta có:
    $arrow(A G_2) = 1/3 (arrow(A C) + arrow(A B_1) + arrow(A D_1))$
    $= 1/3 ( (arrow(u) + arrow(v)) + (arrow(u) + arrow(w)) + (arrow(v) + arrow(w)) )$
    $= 2/3 (arrow(u) + arrow(v) + arrow(w)) = 2/3 arrow(A C_1)$.]
    #step[Ta cộng vế theo vế hai biểu thức trên:
    $arrow(A G_1) + arrow(A G_2) = 1/3 arrow(A C_1) + 2/3 arrow(A C_1) = arrow(A C_1)$.]
    #step[Đồng nhất hệ số với đẳng thức $arrow(A C_1) = a arrow(A G_1) + b arrow(A G_2)$, ta được:
    $a = 1$ và $b = 1$.
    Vậy $a + b = 2$.]
  ]
)

#my-tln(de: "Đề 1", 
  [Cho hình chóp $S.A B C$ với $S A = 3, S B = 4, S C = 5$. Một mặt phẳng $(alpha)$ thay đổi luôn đi qua trọng tâm của tứ diện $S.A B C$ cắt các cạnh $S A, S B, S C$ tại các điểm $A_1, B_1, C_1$. Tìm giá trị nhỏ nhất của biểu thức $P = 1/(S A_1^2) + 1/(S B_1^2) + 1/(S C_1^2)$.],
  [$0.32$],
  loigiai: [
    #step[Gọi $G$ là trọng tâm của tứ diện $S A B C$. Ta có đẳng thức vectơ:
    $arrow(S G) = 1/4 (arrow(S A) + arrow(S B) + arrow(S C))$.]
    #step[Đặt $arrow(S A_1) = x arrow(S A)$, $arrow(S B_1) = y arrow(S B)$, $arrow(S C_1) = z arrow(S C)$ với $x, y, z in (0; 1]$.
    Ta biểu diễn các vectơ đỉnh qua các điểm trên mặt cắt:
    $arrow(S G) = 1/4 ( 1/x arrow(S A_1) + 1/y arrow(S B_1) + 1/z arrow(S C_1) )$.]
    #step[Vì bốn điểm $G, A_1, B_1, C_1$ đồng phẳng nên tổng các hệ số của ba vectơ biểu diễn $arrow(S G)$ qua chúng phải bằng 1:
    $1/4 (1/x + 1/y + 1/z) = 1 <=> 1/x + 1/y + 1/z = 4$.]
    #step[Mặt khác, tỉ lệ độ dài là: $1/x = S A / S A_1 = 3 / S A_1$, $1/y = 4 / S B_1$, $1/z = 5 / S C_1$.
    Thay vào đẳng thức trên:
    $3 / S A_1 + 4 / S B_1 + 5 / S C_1 = 4$.]
    #step[Áp dụng bất đẳng thức Cauchy-Schwarz:
    $(3^2 + 4^2 + 5^2) (1/S A_1^2 + 1/S B_1^2 + 1/S C_1^2) >= (3 / S A_1 + 4 / S B_1 + 5 / S C_1)^2$
    $<=> (9 + 16 + 25) P >= 4^2 <=> 50 P >= 16 <=> P >= 16/50 = 0.32$.]
    #step[Dấu đẳng thức xảy ra khi các tỉ số bằng nhau. Vậy giá trị nhỏ nhất của $P$ là $0.32$ (hoặc $8/25$).]
  ]
)

#my-tln(de: "Đề 1", 
  [Trong không gian, cho hình lập phương $A B C D.A' B' C' D'$. Gọi $N$ là điểm thỏa $arrow(C' N) = 2 arrow(N B')$, $M$ là trung điểm của $A' D'$, $I$ là giao điểm của $A' N$ và $B' M$. Biết $arrow(A I) = a arrow(A A') + b arrow(A B) + c arrow(A D)$. Tính $a + b + c$.],
  [$1.8$],
  loigiai: [
    #step[Chọn điểm $A$ làm gốc tọa độ. Đặt các vectơ cạnh là $arrow(A B) = arrow(b)$, $arrow(A D) = arrow(d)$, $arrow(A A') = arrow(h)$.
    Tọa độ các điểm liên quan:
    - $A' = arrow(h)$, $D' = arrow(d) + arrow(h)$ => Trung điểm $M$ của $A' D'$ là $M = 1/2 arrow(d) + arrow(h)$.
    - $C' = arrow(b) + arrow(d) + arrow(h)$, $B' = arrow(b) + arrow(h)$.]
    #step[Xác định điểm $N$ từ $arrow(C' N) = 2 arrow(N B')$:
    $arrow(C' N) - 2 arrow(N B') = arrow(0) <=> arrow(A N) = (arrow(A C') + 2 arrow(A B'))/3 = (arrow(b) + arrow(d) + arrow(h) + 2(arrow(b) + arrow(h)))/3 = arrow(b) + 1/3 arrow(d) + arrow(h)$.]
    #step[Vì $I$ là giao điểm của $A' N$ và $B' M$, ta biểu diễn $I$ theo hai cách:
    - $I$ nằm trên đường thẳng $A' N$: $arrow(A I) = arrow(A A') + t arrow(A' N) = arrow(h) + t (arrow(b) + 1/3 arrow(d))$.
    - $I$ nằm trên đường thẳng $B' M$: $arrow(A I) = arrow(A B') + s arrow(B' M) = (arrow(b) + arrow(h)) + s (1/2 arrow(d) - arrow(b)) = (1-s) arrow(b) + 1/2 s arrow(d) + arrow(h)$.]
    #step[Đồng nhất hệ số của các vectơ độc lập tuyến tính $arrow(b), arrow(d)$:
    $heva(t = 1 - s, 1/3 t = 1/2 s) <=> heva(t = 1 - s, 2t = 3s) <=> heva(s = 2/5, t = 3/5)$.]
    #step[Thay $t = 3/5$ ta được tọa độ của $I$:
    $arrow(A I) = 3/5 arrow(b) + 1/5 arrow(d) + arrow(h) = 1 arrow(A A') + 3/5 arrow(A B) + 1/5 arrow(A D)$.]
    #step[Do đó $a = 1, b = 0.6, c = 0.2$.
    Tổng $a + b + c = 1 + 0.6 + 0.2 = 1.8$.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Vertices of pyramid
    let S = (0, 3.0)
    let A = (-1.5, 0.2)
    let B = (0.5, -0.4)
    let C = (1.5, 0.4)
    let D = (-0.5, 1.0)
    
    // Calculate points exactly
    let M = ( (S.at(0) + D.at(0)) / 2, (S.at(1) + D.at(1)) / 2 )
    let N = ( (B.at(0) + 2 * C.at(0)) / 3, (B.at(1) + 2 * C.at(1)) / 3 )
    let P = ( 0.25 * S.at(0) + 0.75 * C.at(0), 0.25 * S.at(1) + 0.75 * C.at(1) )

    // Draw hidden edges first
    line(S, D, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(C, D, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(A, D, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))

    // Draw section AMNP (hidden parts)
    line(A, N, stroke: (thickness: 1.2pt, dash: "dashed", paint: blue))
    line(M, P, stroke: (thickness: 1.2pt, dash: "dashed", paint: blue))
    line(M, A, stroke: (thickness: 1.2pt, dash: "dashed", paint: blue))

    // Draw visible edges
    line(S, A, stroke: 1.2pt)
    line(S, B, stroke: 1.2pt)
    line(S, C, stroke: 1.2pt)
    line(A, B, stroke: 1.2pt)
    line(B, C, stroke: 1.2pt)

    // Draw section AMNP (visible parts)
    line(N, P, stroke: 1.2pt + blue)

    // Draw points
    circle(M, radius: 0.04, fill: black)
    content((M.at(0) - 0.2, M.at(1) + 0.1), $M$)
    
    circle(N, radius: 0.04, fill: black)
    content((N.at(0) + 0.25, N.at(1) - 0.1), $N$)
    
    circle(P, radius: 0.04, fill: black)
    content((P.at(0) + 0.25, P.at(1) + 0.1), $P$)

    // Labels
    content((S.at(0), S.at(1) + 0.3), $S$)
    content((A.at(0) - 0.2, A.at(1)), $A$)
    content((B.at(0) + 0.1, B.at(1) - 0.2), $B$)
    content((C.at(0) + 0.2, C.at(1)), $C$)
    content((D.at(0) - 0.2, D.at(1) + 0.15), $D$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Trong không gian, cho hình chóp $S.A B C D$ đáy là hình bình hành. Gọi $M$ và $N$ là các điểm thỏa mãn $arrow(M D) + arrow(M S) = arrow(0)$, $arrow(N B) + 2 arrow(N C) = arrow(0)$. Mặt phẳng $(A M N)$ cắt $S C$ tại $P$. Tính tỉ số $(S P) / (S C)$.],
  [$0.75$],
  loigiai: [
    #step[Chọn điểm $S$ làm gốc tọa độ. Đặt các vectơ từ đỉnh $S$ là $arrow(S A) = arrow(a)$, $arrow(S B) = arrow(b)$, $arrow(S C) = arrow(c)$, $arrow(S D) = arrow(d)$.
    Vì đáy $A B C D$ là hình bình hành nên ta có liên hệ:
    $arrow(a) + arrow(c) = arrow(b) + arrow(d) <=> arrow(a) = arrow(b) + arrow(d) - arrow(c)$.]
    #step[Xác định vị trí các điểm $M, N$ từ giả thiết:
    - $M$ là trung điểm $S D$ => $arrow(S M) = 1/2 arrow(d)$.
    - $arrow(N B) + 2 arrow(N C) = arrow(0) => arrow(S N) = 1/3 arrow(b) + 2/3 arrow(c)$.]
    #step[Vì $P$ thuộc cạnh $S C$, ta đặt $arrow(S P) = k arrow(c)$ với $k in (0; 1]$.
    Do bốn điểm $A, M, N, P$ đồng phẳng nên tồn tại ba số thực $x, y, z$ sao cho $x + y + z = 1$ và:
    $arrow(S P) = x arrow(S A) + y arrow(S M) + z arrow(S N)$.]
    #step[Thay các biểu thức vectơ vào đẳng thức trên:
    $k arrow(c) = x arrow(a) + 1/2 y arrow(d) + z (1/3 arrow(b) + 2/3 arrow(c))$.]
    #step[Thay thế $arrow(a) = arrow(b) + arrow(d) - arrow(c)$ để biểu diễn toàn bộ theo hệ vectơ độc lập tuyến tính $\{arrow(b), arrow(c), arrow(d)\}$:
    $k arrow(c) = x (arrow(b) + arrow(d) - arrow(c)) + 1/2 y arrow(d) + 1/3 z arrow(b) + 2/3 z arrow(c)$
    $<=> k arrow(c) = (x + 1/3 z) arrow(b) + (-x + 2/3 z) arrow(c) + (x + 1/2 y) arrow(d)$.]
    #step[Đồng nhất hệ số của các vectơ $arrow(b)$ và $arrow(d)$, ta có:
    - $x + 1/3 z = 0 => z = -3x$.
    - $x + 1/2 y = 0 => y = -2x$.]
    #step[Thay vào điều kiện $x + y + z = 1$:
    $x - 2x - 3x = 1 <=> -4x = 1 <=> x = -1/4$.
    Từ đó: $y = 1/2$ và $z = 3/4$.]
    #step[Hệ số của $arrow(c)$ cho ta giá trị của $k$:
    $k = -x + 2/3 z = -(-1/4) + 2/3 times 3/4 = 1/4 + 1/2 = 3/4 = 0.75$.
    Do đó $S P / S C = 0.75$.]
  ]
)





// ==================== Đề 2 ====================
#my-tn(de: "Đề 2", 
  [Cho $arrow(a)$ và $arrow(b)$ là hai vectơ cùng hướng và đều khác vectơ $arrow(0)$. Mệnh đề nào sau đây đúng?],
  (
    True([$arrow(a) dot arrow(b) = |arrow(a)| dot |arrow(b)|$]),
    [$arrow(a) dot arrow(b) = 0$],
    [$arrow(a) dot arrow(b) = -1$],
    [$arrow(a) dot arrow(b) = -|arrow(a)| dot |arrow(b)|$]
  ),
  loigiai: [
    #step[Hai vectơ khác $arrow(0)$ cùng hướng thì góc giữa chúng bằng $0^degree$.]
    #step[Theo công thức tính tích vô hướng:
    $arrow(a) dot arrow(b) = |arrow(a)| dot |arrow(b)| cos(arrow(a), arrow(b)) = |arrow(a)| dot |arrow(b)| cos 0^degree = |arrow(a)| dot |arrow(b)|$.]
    #step[Kết luận: Chọn đáp án A.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hai vectơ $arrow(a)$ và $arrow(b)$ khác $arrow(0)$. Xác định góc $alpha$ giữa hai vectơ $arrow(a)$ và $arrow(b)$ khi $arrow(a) dot arrow(b) = -|arrow(a)| dot |arrow(b)|$.],
  (
    True([$alpha = 180^degree$]),
    [$alpha = 0^degree$],
    [$alpha = 90^degree$],
    [$alpha = 45^degree$]
  ),
  loigiai: [
    #step[Theo định nghĩa tích vô hướng:
    $arrow(a) dot arrow(b) = |arrow(a)| dot |arrow(b)| cos alpha$.]
    #step[Từ giả thiết ta có:
    $|arrow(a)| dot |arrow(b)| cos alpha = -|arrow(a)| dot |arrow(b)| <=> cos alpha = -1$.]
    #step[Do đó $alpha = 180^degree$. Chọn đáp án A.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hai vectơ $arrow(a)$ và $arrow(b)$ thỏa mãn $|arrow(a)|=3, |arrow(b)|=2$ và $arrow(a) dot arrow(b) = -3$. Xác định góc $alpha$ giữa hai vectơ $arrow(a)$ và $arrow(b)$.],
  (
    [$alpha = 30^degree$],
    [$alpha = 45^degree$],
    [$alpha = 60^degree$],
    True([$alpha = 120^degree$])
  ),
  loigiai: [
    #step[Ta dùng công thức tính cosin của góc giữa hai vectơ:
    $cos alpha = (arrow(a) dot arrow(b)) / (|arrow(a)| dot |arrow(b)|)$.]
    #step[Thay các số liệu đề bài cho:
    $cos alpha = -3 / (3 times 2) = -1/2$.]
    #step[Vì $0^degree <= alpha <= 180^degree$, suy ra $alpha = 120^degree$. Chọn đáp án D.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hai vectơ $arrow(a)$ và $arrow(b)$ thỏa mãn $|arrow(a)|=|arrow(b)|=1$ và hai vectơ $arrow(u) = 2/5 arrow(a) - 3 arrow(b)$ và $arrow(v) = arrow(a) + arrow(b)$ vuông góc với nhau. Xác định góc $alpha$ giữa hai vectơ $arrow(a)$ và $arrow(b)$.],
  (
    [$alpha = 90^degree$],
    True([$alpha = 180^degree$]),
    [$alpha = 60^degree$],
    [$alpha = 45^degree$]
  ),
  loigiai: [
    #step[Hai vectơ $arrow(u)$ và $arrow(v)$ vuông góc khi và chỉ khi tích vô hướng của chúng bằng 0:
    $arrow(u) dot arrow(v) = 0 <=> (2/5 arrow(a) - 3 arrow(b)) dot (arrow(a) + arrow(b)) = 0$.]
    #step[Khai triển biểu thức tích vô hướng:
    $2/5 |arrow(a)|^2 - 3 |arrow(b)|^2 + (2/5 - 3) arrow(a) dot arrow(b) = 0$.]
    #step[Thay $|arrow(a)|=|arrow(b)|=1$:
    $2/5 - 3 - 13/5 (arrow(a) dot arrow(b)) = 0 <=> -13/5 - 13/5 (arrow(a) dot arrow(b)) = 0 <=> arrow(a) dot arrow(b) = -1$.]
    #step[Ta tính cosin của góc giữa chúng:
    $cos alpha = (arrow(a) dot arrow(b)) / (|arrow(a)| dot |arrow(b)|) = -1 / 1 = -1 => alpha = 180^degree$. Chọn đáp án B.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hai vectơ $arrow(a)$ và $arrow(b)$ thỏa mãn điều kiện $|arrow(a)|=|arrow(b)|=1$ và $arrow(a) dot arrow(b) = 3$. Độ dài vectơ $3 arrow(a) + 5 arrow(b)$ bằng:],
  (
    [$5 sqrt(5)$],
    [$sqrt(24)$],
    [$8$],
    True([$124$])
  ),
  loigiai: [
    #step[Xét bình phương vô hướng của vectơ cần tính:
    $|3 arrow(a) + 5 arrow(b)|^2 = (3 arrow(a) + 5 arrow(b))^2 = 9 |arrow(a)|^2 + 25 |arrow(b)|^2 + 30 (arrow(a) dot arrow(b))$.]
    #step[Thay các giá trị giả thiết đề bài vào:
    $|3 arrow(a) + 5 arrow(b)|^2 = 9 times 1^2 + 25 times 1^2 + 30 times 3 = 9 + 25 + 90 = 124$.]
    #step[Mặc dù điều kiện $|arrow(a) dot arrow(b)| <= 1$ không thỏa mãn trong thực tế toán học đối với vectơ đơn vị, nhưng theo số liệu giả định của đề bài, giá trị bình phương là $124$. Chọn đáp án D.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hai vectơ $arrow(a), arrow(b)$ thỏa mãn: $|arrow(a)| = 4; |arrow(b)| = 3; |arrow(a)-arrow(b)| = 4$. Gọi $alpha$ là góc giữa hai vectơ $arrow(a), arrow(b)$. Chọn khẳng định đúng.],
  (
    True([$cos alpha = 3/8$]),
    [$alpha = 30^degree$],
    [$cos alpha = 1/3$],
    [$alpha = 60^degree$]
  ),
  loigiai: [
    #step[Ta có mối liên hệ giữa bình phương độ dài và tích vô hướng:
    $|arrow(a)-arrow(b)|^2 = |arrow(a)|^2 + |arrow(b)|^2 - 2 arrow(a) dot arrow(b)$.]
    #step[Thay các độ lớn vào đẳng thức trên:
    $4^2 = 4^2 + 3^2 - 2 arrow(a) dot arrow(b) <=> 16 = 16 + 9 - 2 arrow(a) dot arrow(b) <=> 2 arrow(a) dot arrow(b) = 9 <=> arrow(a) dot arrow(b) = 4.5$.]
    #step[Tính cosin góc giữa hai vectơ:
    $cos alpha = (arrow(a) dot arrow(b)) / (|arrow(a)| dot |arrow(b)|) = 4.5 / (4 times 3) = 4.5 / 12 = 3/8$. Chọn đáp án A.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hai vectơ $arrow(a), arrow(b)$ thỏa mãn: $|arrow(a)| = 4; |arrow(b)| = 3; arrow(a) dot arrow(b) = 10$. Xét hai vectơ $arrow(y) = arrow(a) - arrow(b)$, $arrow(x) = arrow(a) - 2 arrow(b)$. Gọi $alpha$ là góc giữa hai vectơ $arrow(x), arrow(y)$. Chọn khẳng định đúng.],
  (
    [$cos alpha = -2/sqrt(15)$],
    [$cos alpha = 1/sqrt(15)$],
    [$cos alpha = 3/sqrt(15)$],
    True([$cos alpha = 2/sqrt(15)$])
  ),
  loigiai: [
    #step[Tính bình phương độ dài các vectơ $arrow(x)$ và $arrow(y)$:
    - $|arrow(x)|^2 = |arrow(a) - 2 arrow(b)|^2 = |arrow(a)|^2 + 4 |arrow(b)|^2 - 4 (arrow(a) dot arrow(b)) = 16 + 4 times 9 - 4 times 10 = 12 => |arrow(x)| = sqrt(12) = 2 sqrt(3)$.
    - $|arrow(y)|^2 = |arrow(a) - arrow(b)|^2 = |arrow(a)|^2 + |arrow(b)|^2 - 2 (arrow(a) dot arrow(b)) = 16 + 9 - 2 times 10 = 5 => |arrow(y)| = sqrt(5)$.]
    #step[Tính tích vô hướng của $arrow(x)$ và $arrow(y)$:
    $arrow(x) dot arrow(y) = (arrow(a) - 2 arrow(b)) dot (arrow(a) - arrow(b)) = |arrow(a)|^2 - 3 (arrow(a) dot arrow(b)) + 2 |arrow(b)|^2 = 16 - 30 + 18 = 4$.]
    #step[Tính cosin góc $alpha$:
    $cos alpha = (arrow(x) dot arrow(y)) / (|arrow(x)| dot |arrow(y)|) = 4 / (2 sqrt(3) times sqrt(5)) = 2 / sqrt(15)$. Chọn đáp án D.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hai vectơ $arrow(a), arrow(b)$ thỏa mãn: $|arrow(a)| = 26; |arrow(b)| = 28; |arrow(a)+arrow(b)| = 48$. Độ dài vectơ $arrow(a)-arrow(b)$ bằng?],
  (
    [$25$],
    True([$sqrt(616)$]),
    [$9$],
    [$sqrt(618)$]
  ),
  loigiai: [
    #step[Ta áp dụng hệ thức hình bình hành đối với độ dài vectơ:
    $|arrow(a)+arrow(b)|^2 + |arrow(a)-arrow(b)|^2 = 2(|arrow(a)|^2 + |arrow(b)|^2)$.]
    #step[Thay các giá trị số đề bài đã cho:
    $48^2 + |arrow(a)-arrow(b)|^2 = 2(26^2 + 28^2)$
    $<=> 2304 + |arrow(a)-arrow(b)|^2 = 2(676 + 784) = 2920$.]
    #step[Tính độ dài vectơ hiệu:
    $|arrow(a)-arrow(b)|^2 = 2920 - 2304 = 616 => |arrow(a)-arrow(b)| = sqrt(616)$. Chọn đáp án B.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho tứ diện $A B C D$ có $A B = A C = A D$ và $hat(B A C) = hat(B A D) = 60^degree$. Hãy xác định góc giữa cặp vectơ $arrow(A B)$ và $arrow(C D)$?],
  (
    [$60^degree$],
    [$45^degree$],
    [$120^degree$],
    True([$90^degree$])
  ),
  loigiai: [
    #step[Xét tích vô hướng của hai vectơ:
    $arrow(A B) dot arrow(C D) = arrow(A B) dot (arrow(A D) - arrow(A C)) = arrow(A B) dot arrow(A D) - arrow(A B) dot arrow(A C)$.]
    #step[Đặt độ dài các cạnh bằng nhau là $A B = A C = A D = m$. Ta có:
    - $arrow(A B) dot arrow(A D) = A B dot A D cos hat(B A D) = m^2 cos 60^degree = 1/2 m^2$.
    - $arrow(A B) dot arrow(A C) = A B dot A C cos hat(B A C) = m^2 cos 60^degree = 1/2 m^2$.]
    #step[Do đó:
    $arrow(A B) dot arrow(C D) = 1/2 m^2 - 1/2 m^2 = 0$.
    Vì tích vô hướng bằng 0 nên hai vectơ vuông góc với nhau, góc giữa chúng bằng $90^degree$. Chọn đáp án D.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hình chóp $S.A B C$ có $S A = S B = S C$ và $hat(A S B) = hat(B S C) = hat(C S A)$. Hãy xác định góc giữa cặp vectơ $arrow(S A)$ và $arrow(B C)$?],
  (
    [$120^degree$],
    True([$90^degree$]),
    [$60^degree$],
    [$45^degree$]
  ),
  loigiai: [
    #step[Ta tính tích vô hướng của hai vectơ đề bài yêu cầu:
    $arrow(S A) dot arrow(B C) = arrow(S A) dot (arrow(S C) - arrow(S B)) = arrow(S A) dot arrow(S C) - arrow(S A) dot arrow(S B)$.]
    #step[Đặt độ dài các cạnh bên là $S A = S B = S C = m$ và các góc ở đỉnh bằng nhau là $hat(A S B) = hat(B S C) = hat(C S A) = beta$.]
    #step[Khi đó ta có:
    - $arrow(S A) dot arrow(S C) = m^2 cos beta$.
    - $arrow(S A) dot arrow(S B) = m^2 cos beta$.
    Từ đó $arrow(S A) dot arrow(B C) = m^2 cos beta - m^2 cos beta = 0$, suy ra $arrow(S A) perp arrow(B C)$.
    Góc giữa hai vectơ bằng $90^degree$. Chọn đáp án B.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hình chóp $S.A B C D$ có đáy là hình vuông $A B C D$ cạnh bằng $a$ và các cạnh bên đều bằng $a$. Gọi $M$ và $N$ lần lượt là trung điểm của $A D$ và $S D$. Số đo của góc $(M N, S C)$ bằng:],
  (
    [$45^degree$],
    [$30^degree$],
    True([$90^degree$]),
    [$60^degree$]
  ),
  loigiai: [
    #step[Trong tam giác $S A D$, $M$ và $N$ lần lượt là trung điểm của $A D$ và $S D$ nên $M N$ là đường trung bình của tam giác $S A D$.
    Suy ra $M N parallel S A$. Do đó, góc giữa hai đường thẳng $M N$ và $S C$ bằng góc giữa $S A$ và $S C$.]
    #step[Xét tam giác $S A C$ có $S A = a$, $S C = a$, và $A C$ là đường chéo hình vuông đáy cạnh $a$ nên $A C = a sqrt(2)$.]
    #step[Ta có:
    $S A^2 + S C^2 = a^2 + a^2 = 2 a^2 = A C^2$.
    Theo định lý Pythagore đảo, tam giác $S A C$ vuông tại $S$, góc $hat(A S C) = 90^degree$.
    Vậy góc $(M N, S C) = 90^degree$. Chọn đáp án C.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho tứ diện $A B C D$ đều cạnh bằng $a$. Gọi $O$ là tâm đường tròn ngoại tiếp tam giác $B C D$. Góc giữa $A O$ và $C D$ bằng bao nhiêu?],
  (
    [$0^degree$],
    [$30^degree$],
    True([$90^degree$]),
    [$60^degree$]
  ),
  loigiai: [
    #step[Vì tứ diện $A B C D$ đều và $O$ là tâm đường tròn ngoại tiếp tam giác đáy $B C D$ nên đường thẳng $A O$ vuông góc với mặt phẳng đáy $(B C D)$.]
    #step[Đường thẳng $C D$ nằm trong mặt phẳng đáy $(B C D)$ nên $A O perp C D$.]
    #step[Do đó góc giữa hai đường thẳng $A O$ và $C D$ bằng $90^degree$. Chọn đáp án C.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho tứ diện $A B C D$ với $A B perp A C, A B perp B D$. Gọi $P, Q$ lần lượt là trung điểm của $A B$ và $C D$. Góc giữa $P Q$ và $A B$ là?],
  (
    True([$90^degree$]),
    [$60^degree$],
    [$30^degree$],
    [$45^degree$]
  ),
  loigiai: [
    #step[Ta có vectơ trung điểm $arrow(P Q) = 1/2 (arrow(A D) + arrow(B C))$.]
    #step[Xét tích vô hướng:
    $arrow(P Q) dot arrow(A B) = 1/2 (arrow(A D) + arrow(B C)) dot arrow(A B) = 1/2 (arrow(A D) dot arrow(A B) + arrow(B C) dot arrow(A B))$.]
    #step[Ta biến đổi từng tích vô hướng:
    - $arrow(A D) dot arrow(A B) = (arrow(A B) + arrow(B D)) dot arrow(A B) = A B^2 + arrow(B D) dot arrow(A B) = A B^2$ (vì $A B perp B D$).
    - $arrow(B C) dot arrow(A B) = (arrow(A C) - arrow(A B)) dot arrow(A B) = arrow(A C) dot arrow(A B) - A B^2 = -A B^2$ (vì $A B perp A C$).]
    #step[Do đó $arrow(P Q) dot arrow(A B) = 1/2 (A B^2 - A B^2) = 0$. Suy ra $P Q perp A B$, góc giữa chúng bằng $90^degree$. Chọn đáp án A.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho tứ diện $A B C D$ có $A B = A C = A D$ và $hat(B A C) = hat(B A D) = 60^degree, hat(C A D) = 90^degree$. Gọi $I$ và $J$ lần lượt là trung điểm của $A B$ và $C D$. Hãy xác định góc giữa cặp vectơ $arrow(A B)$ và $arrow(I J)$?],
  (
    [$120^degree$],
    True([$90^degree$]),
    [$60^degree$],
    [$45^degree$]
  ),
  loigiai: [
    #step[Biểu diễn vectơ $arrow(I J)$ thông qua các cạnh xuất phát từ $A$:
    $arrow(I J) = arrow(A J) - arrow(A I) = 1/2 (arrow(A C) + arrow(A D)) - 1/2 arrow(A B)$.]
    #step[Tính tích vô hướng của $arrow(I J)$ và $arrow(A B)$:
    $arrow(I J) dot arrow(A B) = 1/2 arrow(A C) dot arrow(A B) + 1/2 arrow(A D) dot arrow(A B) - 1/2 A B^2$.]
    #step[Đặt $A B = A C = A D = m$. Ta có:
    - $arrow(A C) dot arrow(A B) = m^2 cos 60^degree = 1/2 m^2$.
    - $arrow(A D) dot arrow(A B) = m^2 cos 60^degree = 1/2 m^2$.]
    #step[Thay vào biểu thức tích vô hướng:
    $arrow(I J) dot arrow(A B) = 1/2 (1/2 m^2) + 1/2 (1/2 m^2) - 1/2 m^2 = 1/4 m^2 + 1/4 m^2 - 1/2 m^2 = 0$.
    Do đó $arrow(I J) perp arrow(A B)$, góc giữa chúng bằng $90^degree$. Chọn đáp án B.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho tứ diện $A B C D$ có hai mặt $A B C$ và $A B D$ là các tam giác đều. Khẳng định nào sau đây đúng nhất.],
  (
    [AB và CD chéo nhau],
    True([AB và CD vuông góc với nhau]),
    [AB và CD đồng phẳng],
    [AB và CD cắt nhau]
  ),
  loigiai: [
    #step[Gọi $M$ là trung điểm của cạnh $A B$.]
    #step[Vì tam giác $A B C$ đều nên đường trung tuyến $C M$ cũng là đường cao, suy ra $C M perp A B$.
Vì tam giác $A B D$ đều nên đường trung tuyến $D M$ cũng là đường cao, suy ra $D M perp A B$.]
    #step[Do $A B$ vuông góc với cả $C M$ và $D M$ nên $A B$ vuông góc với mặt phẳng $(C D M)$ chứa $C D$.
Suy ra $A B perp C D$. Chọn đáp án B.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Vertices of prism
    let A = (-0.8, 2.0)
    let C = (1.5, 2.0)
    let B = (-0.3, 1.2)
    let A_d = (-0.8, 0.0)
    let C_d = (1.5, 0.0)
    let B_d = (-0.3, -0.8)
    
    // Draw top face ABC
    line(A, B, stroke: 1.2pt)
    line(B, C, stroke: 1.2pt)
    line(C, A, stroke: 1.2pt)
    
    // Draw bottom face A'B'C'
    line(A_d, B_d, stroke: 1.2pt)
    line(B_d, C_d, stroke: 1.2pt)
    line(C_d, A_d, stroke: (thickness: 0.8pt, dash: "dashed"))
    
    // Draw vertical edges
    line(A, A_d, stroke: (thickness: 0.8pt))
    line(B, B_d, stroke: 1.2pt)
    line(C, C_d, stroke: 1.2pt)
    
    // Diagonals AB' and BC'
    line(A, B_d, stroke: 1.2pt + blue)
    line(B, C_d, stroke: 1.2pt + red)
    
    // Labels
    content((-1.0, 2.0), $A$)
    content((-0.1, 1.4), $B$)
    content((1.7, 2.0), $C$)
    content((-1.0, 0.0), $A'$)
    content((-0.1, -0.9), $B'$)
    content((1.7, 0.0), $C'$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Cho hình lăng trụ tam giác đều $A B C.A' B' C'$ có $A B = a$ và $A A' = sqrt(2)a$. Góc giữa hai đường thẳng $A B$' và $B C$' bằng:],
  (
    True([$60^degree$]),
    [$45^degree$],
    [$90^degree$],
    [$30^degree$]
  ),
  loigiai: [
    #step[Đặt hệ vectơ cơ sở: $arrow(A B) = arrow(u)$, $arrow(A C) = arrow(v)$, $arrow(A A') = arrow(w)$.
    Do lăng trụ đều nên $|arrow(u)|=|arrow(v)|=a$, $|arrow(w)|=sqrt(2)a$, $arrow(w) perp arrow(u)$, $arrow(w) perp arrow(v)$, và góc $(arrow(u), arrow(v)) = 60^degree$.]
    #step[Biểu diễn hai vectơ đường chéo:
    - $arrow(A B') = arrow(u) + arrow(w) => |arrow(A B')|^2 = a^2 + 2a^2 = 3a^2$.
    - $arrow(B C') = arrow(v) - arrow(u) + arrow(w) => |arrow(B C')|^2 = (a^2+a^2-a^2) + 2a^2 = 3a^2$.]
    #step[Tính tích vô hướng:
    $arrow(A B') dot arrow(B C') = (arrow(u)+arrow(w)) dot (arrow(v)-arrow(u)+arrow(w)) = arrow(u) dot arrow(v) - |arrow(u)|^2 + |arrow(w)|^2 = 1/2 a^2 - a^2 + 2a^2 = 3/2 a^2$.]
    #step[Tính cosin góc giữa hai đường thẳng:
    $cos(A B', B C') = |arrow(A B') dot arrow(B C')| / (|arrow(A B')| |arrow(B C')|) = (3/2 a^2) / (3 a^2) = 1/2$.
    Vậy góc giữa chúng bằng $60^degree$. Chọn đáp án A.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hình lập phương $A B C D.A_1 B_1 C_1 D_1$ có cạnh $a$. Gọi $M$ là trung điểm $A D$. Giá trị $arrow(B_1 M) dot arrow(B D_1)$ là:],
  (
    True([$1/2 a^2$]),
    [$a^2$],
    [$3/4 a^2$],
    [$3/2 a^2$]
  ),
  loigiai: [
    #step[Chọn hệ tọa độ có gốc là đỉnh $A$, các trục $A x, A y, A z$ lần lượt đi qua $B, D, A_1$.]
    #step[Tọa độ các điểm khi coi cạnh hình lập phương bằng $a$:
    - $B_1(a; 0; a)$, $M(0; a/2; 0)$.
    - $B(a; 0; 0)$, $D_1(0; a; a)$.]
    #step[Xác định tọa độ các vectơ:
    - $arrow(B_1 M) = (-a; a/2; -a)$.
    - $arrow(B D_1) = (-a; a; a)$.]
    #step[Tính tích vô hướng:
    $arrow(B_1 M) dot arrow(B D_1) = (-a)(-a) + (a/2)(a) + (-a)(a) = a^2 + 1/2 a^2 - a^2 = 1/2 a^2$.
    Chọn đáp án A.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hình lập phương $A B C D.E F G H$. Hãy xác định góc giữa cặp vectơ $arrow(A B)$ và $arrow(E G)$?],
  (
    [$90^degree$],
    [$60^degree$],
    True([$45^degree$]),
    [$120^degree$]
  ),
  loigiai: [
    #step[Vì $A B C D.E F G H$ là hình lập phương nên hai mặt đáy $A B C D$ và $E F G H$ song song và các cạnh tương ứng song song.
    Ta có $arrow(E F) parallel arrow(A B)$ và cùng hướng, do đó $arrow(E F) = arrow(A B)$.]
    #step[Suy ra góc giữa $arrow(A B)$ và $arrow(E G)$ bằng góc giữa $arrow(E F)$ và $arrow(E G)$.]
    #step[Vì $E F G H$ là hình vuông nên đường chéo $E G$ tạo với cạnh $E F$ một góc $45^degree$.
    Do đó góc giữa hai vectơ bằng $45^degree$. Chọn đáp án C.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hình lập phương $A B C D.A' B' C' D'$. Gọi $M, N$ lần lượt là trung điểm của $A D, B B'$. Cosin của góc hợp bởi $M N$ và $A C'$ bằng:],
  (
    [$sqrt(3)/3$],
    True([$sqrt(2)/3$]),
    [$sqrt(5)/3$],
    [$sqrt(2)/4$]
  ),
  loigiai: [
    #step[Chọn hệ trục tọa độ gốc $A(0;0;0)$ với các cạnh của hình lập phương có độ dài bằng 1 nằm trên các trục tọa độ.
    Khi đó, ta có tọa độ các điểm:
    $M(0; 1/2; 0)$, $N(1; 0; 1/2)$, và $C'(1; 1; 1)$.]
    #step[Tọa độ các vectơ:
    - $arrow(M N) = (1; -1/2; 1/2) => |arrow(M N)| = sqrt(1^2 + (-1/2)^2 + (1/2)^2) = sqrt(3/2)$.
    - $arrow(A C') = (1; 1; 1) => |arrow(A C')| = sqrt(3)$.]
    #step[Tính tích vô hướng:
    $arrow(M N) dot arrow(A C') = 1 times 1 + (-1/2) times 1 + (1/2) times 1 = 1$.]
    #step[Tính cosin góc giữa hai đường thẳng:
    $cos alpha = |arrow(M N) dot arrow(A C')| / (|arrow(M N)| |arrow(A C')|) = 1 / (sqrt(3/2) times sqrt(3)) = 1 / sqrt(9/2) = sqrt(2)/3$.
    Chọn đáp án B.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hình lăng trụ $A B C.A' B' C'$ có đáy $A B C$ là tam giác đều cạnh $a$, tam giác $A' B C$ đều nằm trong mặt phẳng vuông góc với $(A B C)$. $M$ là trung điểm cạnh $C C'$. Tính cosin góc $alpha$ giữa hai đường thẳng $A A'$ và $B M$.],
  (
    [$2 sqrt(2)/11$],
    True([$sqrt(33)/11$]),
    [$sqrt(11)/11$],
    [$sqrt(22)/11$]
  ),
  loigiai: [
    #step[Chọn hệ tọa độ gốc là trung điểm $H$ của $B C$. Trục $H y$ trùng với $H C$, trục $H z$ trùng với $H A'$ (do $A' H perp (A B C)$), trục $H x$ đi qua $A$.]
    #step[Chiều cao tam giác đều $A' B C$ và $A B C$ bằng $a sqrt(3)/2$. Tọa độ các đỉnh:
    $H(0;0;0)$, $C(0; a/2; 0)$, $B(0; -a/2; 0)$, $A(a sqrt(3)/2; 0; 0)$, $A'(0; 0; a sqrt(3)/2)$.]
    #step[Theo tính chất lăng trụ, ta xác định tọa độ $C'$ và trung điểm $M$ của $C C'$:
    - $C' = C + A' - A = (-a sqrt(3)/2; a/2; a sqrt(3)/2)$.
    - $M = 1/2 (C + C') = (-a sqrt(3)/4; a/2; a sqrt(3)/4)$.]
    #step[Tọa độ các vectơ:
    - $arrow(A A') = (-a sqrt(3)/2; 0; a sqrt(3)/2) => |arrow(A A')| = a sqrt(6)/2$.
    - $arrow(B M) = (-a sqrt(3)/4; a; a sqrt(3)/4) => |arrow(B M)| = a sqrt(22)/4$.
    - Tích vô hướng: $arrow(A A') dot arrow(B M) = 3/8 a^2 + 3/8 a^2 = 3/4 a^2$.]
    #step[Tính cosin góc $alpha$:
    $cos alpha = |arrow(A A') dot arrow(B M)| / (|arrow(A A')| |arrow(B M)|) = (3/4 a^2) / (a^2 sqrt(33)/4) = sqrt(33)/11$.
    Chọn đáp án B.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "doc",lines: 2,
  [Cho tam giác $A B C$, thì công thức tính diện tích nào sau đây là đúng nhất.],
  (
    [$S = 1/2 sqrt(A B^2 A C^2 - B C^2)$],
    [$S = 1/2 sqrt(A B^2 A C^2 + 1/2 (arrow(A B) dot arrow(A C))^2)$],
    [$S = 1/2 sqrt(A B^2 A C^2 - 1/2 (arrow(A B) dot arrow(A C))^2)$],
    True([$S = 1/2 sqrt(A B^2 A C^2 - (arrow(A B) dot arrow(A C))^2)$])
  ),
  loigiai: [
    #step[Diện tích tam giác $A B C$ được tính bởi công thức:
    $S = 1/2 A B dot A C sin A$.]
    #step[Ta biến đổi hàm lượng giác:
    $sin A = sqrt(1 - cos^2 A) => S = 1/2 A B dot A C sqrt(1 - cos^2 A) = 1/2 sqrt(A B^2 A C^2 - A B^2 A C^2 cos^2 A)$.]
    #step[Theo định nghĩa tích vô hướng:
    $arrow(A B) dot arrow(A C) = A B dot A C cos A$.
    Thay vào biểu thức trên ta được:
    $S = 1/2 sqrt(A B^2 A C^2 - (arrow(A B) dot arrow(A C))^2)$. Chọn đáp án D.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho hình lập phương $A B C D.E F G H$ có cạnh bằng $a$. Ta có $arrow(A B) dot arrow(E G)$ bằng?],
  (
    [$a^2 sqrt(2)$],
    True([$a^2$]),
    [$a^2 sqrt(3)$],
    [$(a^2 sqrt(2))/2$]
  ),
  loigiai: [
    #step[Vì các mặt đối diện của hình lập phương song song nên $E G parallel A C$ và có cùng hướng, suy ra $arrow(E G) = arrow(A C)$.]
    #step[Tính tích vô hướng:
    $arrow(A B) dot arrow(E G) = arrow(A B) dot arrow(A C) = A B dot A C cos hat(B A C)$.]
    #step[Trong hình vuông $A B C D$ cạnh $a$, độ dài đường chéo $A C = a sqrt(2)$ và góc $hat(B A C) = 45^degree$.
    $arrow(A B) dot arrow(E G) = a dot a sqrt(2) dot cos 45^degree = a^2 sqrt(2) dot sqrt(2)/2 = a^2$.
    Chọn đáp án B.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho tứ diện $A B C D$ với $A C = 3/2 A D$, $hat(C A B) = hat(D A B) = 60^degree$, $C D = A D$. Gọi $phi$ là góc giữa $A B$ và $C D$. Chọn khẳng định đúng?],
  (
    [$cos phi = 3/4$],
    [$phi = 60^degree$],
    [$phi = 30^degree$],
    True([$cos phi = 1/4$])
  ),
  loigiai: [
    #step[Ta biểu diễn vectơ $arrow(C D) = arrow(A D) - arrow(A C)$.]
    #step[Tính tích vô hướng của $arrow(A B)$ và $arrow(C D)$:
    $arrow(A B) dot arrow(C D) = arrow(A B) dot (arrow(A D) - arrow(A C)) = arrow(A B) dot arrow(A D) - arrow(A B) dot arrow(A C)$.]
    #step[Đặt $A B = x, A D = y => A C = 3/2 y$ và $C D = y$. Ta có:
    - $arrow(A B) dot arrow(A D) = x y cos 60^degree = 1/2 x y$.
    - $arrow(A B) dot arrow(A C) = x (3/2 y) cos 60^degree = 3/4 x y$.
    Suy ra $arrow(A B) dot arrow(C D) = 1/2 x y - 3/4 x y = -1/4 x y$.]
    #step[Tính cosin góc giữa hai đường thẳng:
    $cos phi = |arrow(A B) dot arrow(C D)| / (A B dot C D) = (1/4 x y) / (x y) = 1/4$. Chọn đáp án D.]
  ]
)

#my-tn(de: "Đề 2", 
  [Cho tứ diện đều $A B C D$, $M$ là trung điểm của cạnh $B C$. Khi đó $cos(A B, D M)$ bằng:],
  (
    [$sqrt(2)/2$],
    True([$sqrt(3)/6$]),
    [$1/2$],
    [$sqrt(3)/2$]
  ),
  loigiai: [
    #step[Đặt cạnh của tứ diện đều bằng $a$. Ta có $arrow(D M) = arrow(A M) - arrow(A D)$.]
    #step[Tích vô hướng:
    $arrow(A B) dot arrow(D M) = arrow(A B) dot (arrow(A M) - arrow(A D)) = arrow(A B) dot arrow(A M) - arrow(A B) dot arrow(A D)$.]
    #step[Vì $M$ là trung điểm của $B C$ nên $arrow(A M) = 1/2 (arrow(A B) + arrow(A C))$.
    - $arrow(A B) dot arrow(A M) = 1/2 A B^2 + 1/2 arrow(A B) dot arrow(A C) = 1/2 a^2 + 1/4 a^2 = 3/4 a^2$.
    - $arrow(A B) dot arrow(A D) = a^2 cos 60^degree = 1/2 a^2$.
    Do đó: $arrow(A B) dot arrow(D M) = 3/4 a^2 - 1/2 a^2 = 1/4 a^2$.]
    #step[Độ dài các đoạn: $A B = a$, $D M = a sqrt(3)/2$ (đường cao trong tam giác đều cạnh $a$).
    $cos(A B, D M) = |arrow(A B) dot arrow(D M)| / (A B dot D M) = (1/4 a^2) / (a dot a sqrt(3)/2) = 1 / (2 sqrt(3)) = sqrt(3)/6$.
    Chọn đáp án B.]
  ]
)


#my-ds(de: "Đề 2", 
  [Trong không gian, cho hai vectơ $arrow(a)$ và $arrow(b)$ cùng có độ dài bằng 1. Biết rằng góc giữa hai véc-tơ đó là $45^degree$. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([$arrow(a) dot arrow(b) = sqrt(2)/2$.]),
    True([$(arrow(a) + 3 arrow(b)) dot (arrow(a) - 2 arrow(b)) = -5 + sqrt(2)/2$.]),
    [$|arrow(a) + arrow(b)| = 2 + sqrt(2)$.],
    [$|arrow(a) - sqrt(2) arrow(b)| = 0$.]
  ),
  loigiai: [
    #step[a) Tích vô hướng: $arrow(a) dot arrow(b) = |arrow(a)| |arrow(b)| cos 45^degree = 1 times 1 times sqrt(2)/2 = sqrt(2)/2$. (Đúng)]
    #step[b) Nhân phân phối biểu thức tích vô hướng:
    $(arrow(a) + 3 arrow(b)) dot (arrow(a) - 2 arrow(b)) = |arrow(a)|^2 - 2 (arrow(a) dot arrow(b)) + 3 (arrow(a) dot arrow(b)) - 6 |arrow(b)|^2$
    $= 1 + arrow(a) dot arrow(b) - 6 = -5 + sqrt(2)/2$. (Đúng)]
    #step[c) Bình phương độ dài tổng:
    $|arrow(a) + arrow(b)|^2 = |arrow(a)|^2 + |arrow(b)|^2 + 2 arrow(a) dot arrow(b) = 1 + 1 + 2 (sqrt(2)/2) = 2 + sqrt(2)$
    $=> |arrow(a) + arrow(b)| = sqrt(2 + sqrt(2))$. Khẳng định thiếu dấu căn nên Sai. (Sai)]
    #step[d) Bình phương độ dài hiệu:
    $|arrow(a) - sqrt(2) arrow(b)|^2 = |arrow(a)|^2 + 2 |arrow(b)|^2 - 2 sqrt(2) (arrow(a) dot arrow(b)) = 1 + 2 - 2 sqrt(2) (sqrt(2)/2) = 3 - 2 = 1$
    $=> |arrow(a) - sqrt(2) arrow(b)| = 1 != 0$. (Sai)]
  ]
)

#my-ds(de: "Đề 2", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Vertices of regular tetrahedron
    let A = (0, 2.5)
    let B = (-1.5, 0.0)
    let C = (0.5, -0.4)
    let D = (1.5, 0.4)
    
    // Midpoint M of CD
    let M = (1.0, 0.0)
    
    // Draw solid edges
    line(A, B, stroke: 1.2pt)
    line(A, C, stroke: 1.2pt)
    line(A, D, stroke: 1.2pt)
    line(B, C, stroke: 1.2pt)
    line(C, D, stroke: 1.2pt)
    line(A, M, stroke: 1.2pt + blue)
    
    // Draw dashed back edges
    line(B, D, stroke: (thickness: 0.8pt, dash: "dashed"))
    line(B, M, stroke: (thickness: 0.8pt, dash: "dashed", paint: red))
    
    // Labels
    content((0, 2.75), $A$)
    content((-1.7, 0.0), $B$)
    content((0.5, -0.65), $C$)
    content((1.7, 0.4), $D$)
    content((1.2, -0.2), $M$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Cho tứ diện đều $A B C D$ có cạnh bằng $a$ và $M$ là trung điểm của $C D$. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([$arrow(A M) dot arrow(C D) = 0$.]),
    True([$arrow(A B) dot arrow(A C) = a^2/2$.]),
    True([$arrow(A B) dot arrow(C D) = 0$.]),
    [$arrow(A M) dot arrow(A B) = - a^2/2$.]
  ),
  loigiai: [
    #step[a) Vì tam giác $A C D$ đều cạnh $a$ và $M$ là trung điểm $C D$ nên đường trung tuyến $A M$ đồng thời là đường cao: $A M perp C D => arrow(A M) dot arrow(C D) = 0$. (Đúng)]
    #step[b) Tích vô hướng: $arrow(A B) dot arrow(A C) = A B dot A C cos 60^degree = a^2 dot 1/2 = a^2/2$. (Đúng)]
    #step[c) Ta phân tích: $arrow(A B) dot arrow(C D) = arrow(A B) dot (arrow(A D) - arrow(A C)) = arrow(A B) dot arrow(A D) - arrow(A B) dot arrow(A C)$.
    Vì tứ diện đều nên $arrow(A B) dot arrow(A D) = a^2/2$ và $arrow(A B) dot arrow(A C) = a^2/2$.
    Do đó $arrow(A B) dot arrow(C D) = 0$. (Đúng)]
    #step[d) Ta có: $arrow(A M) dot arrow(A B) = 1/2 (arrow(A C) + arrow(A D)) dot arrow(A B) = 1/2 (arrow(A C) dot arrow(A B) + arrow(A D) dot arrow(A B))$.
    Thay các tích vô hướng đã biết: $1/2 (a^2/2 + a^2/2) = a^2/2 != -a^2/2$. (Sai)]
  ]
)

#my-ds(de: "Đề 2", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Vertices of cube
    let A = (-1.0, 1.0)
    let B = (1.0, 1.0)
    let B_d = (1.0, -1.0)
    let A_d = (-1.0, -1.0)
    let D = (-0.4, 1.6)
    let C = (1.6, 1.6)
    let C_d = (1.6, -0.4)
    let D_d = (-0.4, -0.4)
    
    // Draw solid edges
    line(A, B, stroke: 1.2pt)
    line(B, C, stroke: 1.2pt)
    line(C, D, stroke: 1.2pt)
    line(D, A, stroke: 1.2pt)
    line(A, A_d, stroke: 1.2pt)
    line(B, B_d, stroke: 1.2pt)
    line(C, C_d, stroke: 1.2pt)
    line(A_d, B_d, stroke: 1.2pt)
    line(B_d, C_d, stroke: 1.2pt)
    
    // Draw dashed back edges
    line(D, D_d, stroke: (thickness: 0.8pt, dash: "dashed"))
    line(C_d, D_d, stroke: (thickness: 0.8pt, dash: "dashed"))
    line(D_d, A_d, stroke: (thickness: 0.8pt, dash: "dashed"))
    
    // Draw Force arrows from A
    // a along AD
    line(A, D, stroke: 1.5pt + rgb("#2E7D32"), mark: (end: "stealth", fill: rgb("#2E7D32")))
    content((-0.9, 1.5), text(fill: rgb("#2E7D32"))[$arrow(a)$])
    
    // b along AB
    line(A, B, stroke: 1.5pt + rgb("#d32f2f"), mark: (end: "stealth", fill: rgb("#d32f2f")))
    content((0.0, 1.25), text(fill: rgb("#d32f2f"))[$arrow(b)$])
    
    // c along AC'
    line(A, C_d, stroke: (thickness: 1.5pt, dash: "dashed", paint: blue), mark: (end: "stealth", fill: blue))
    content((0.4, 0.4), text(fill: blue)[$arrow(c)$])
    
    // Labels of vertices
    content((-1.2, 1.2), $A$)
    content((1.2, 1.2), $B$)
    content((1.8, 1.8), $C$)
    content((-0.3, 1.8), $D$)
    content((-1.2, -1.2), $A'$)
    content((1.2, -1.2), $B'$)
    content((1.8, -0.4), $C'$)
    content((-0.3, -0.4), $D'$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một chất điểm ở vị trí đỉnh $A$ của hình lập phương $A B C D.A' B' C' D'$. Chất điểm chịu tác động bởi ba lực $arrow(a), arrow(b), arrow(c)$ lần lượt cùng hướng với $arrow(A D), arrow(A B)$ và $arrow(A C')$ như hình vẽ. Độ lớn của các lực $arrow(a), arrow(b)$ và $arrow(c)$ tương ứng là $10$ N, $10$ N và $20$ N. Xét tính đúng/sai của các phát biểu sau:],
  (
    [$arrow(a) + arrow(b) = arrow(c)$.],
    [$|arrow(a) + arrow(b)| = 20$ N.],
    True([$|arrow(a) + arrow(c)| = |arrow(b) + arrow(c)|$.]),
    True([$|arrow(a) + arrow(b) + arrow(c)| = 32.59$ N (làm tròn kết quả đến hàng phần mười).])
  ),
  loigiai: [
    #step[a) Lực $arrow(a)$ cùng phương $arrow(A D)$, lực $arrow(b)$ cùng phương $arrow(A B)$ nên tổng hợp lực $arrow(a)+arrow(b)$ nằm trên mặt phẳng $(A B C D)$ và cùng phương với đường chéo $arrow(A C)$.
Trong khi đó, lực $arrow(c)$ cùng phương với đường chéo không gian $arrow(A C')$. Do đó $arrow(a) + arrow(b) != arrow(c)$. (Sai)]
    #step[b) Vì $A B C D$ là hình vuông nên $A B perp A D => arrow(a) perp arrow(b)$.
    Độ lớn tổng lực hiệu dụng của $arrow(a)$ và $arrow(b)$ là:
    $|arrow(a) + arrow(b)| = sqrt(10^2 + 10^2) = 10 sqrt(2) approx 14.14$ N. (Sai)]
    #step[c) Do tính chất đối xứng của hình lập phương qua mặt phẳng chéo chứa $A C'$ và vuông góc đáy, các góc tạo bởi đường chéo $A C'$ với hai cạnh $A B$ và $A D$ là bằng nhau.
    Do đó tích vô hướng $arrow(a) dot arrow(c) = arrow(b) dot arrow(c)$.
    Suy ra: $|arrow(a)+arrow(c)|^2 = a^2 + c^2 + 2 arrow(a) dot arrow(c) = b^2 + c^2 + 2 arrow(b) dot arrow(c) = |arrow(b)+arrow(c)|^2$. (Đúng)]
    #step[d) Chọn hệ trục tọa độ sao cho các lực hướng dọc theo các vectơ đơn vị:
- $arrow(a) = (0; 10; 0)$,
- $arrow(b) = (10; 0; 0)$,
- $arrow(c) = 20/sqrt(3) (1; 1; 1) approx (11.547; 11.547; 11.547)$.
Tổng lực hiệu dụng: $arrow(F) = arrow(a) + arrow(b) + arrow(c) approx (21.547; 21.547; 11.547)$.
Độ lớn tổng lực: $F = sqrt(21.547^2 + 21.547^2 + 11.547^2) approx 32.59$ N. (Đúng)]
  ]
)

#my-ds(de: "Đề 2", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Vertex S and height
    let S = (0, 3.2)
    let O = (0, 0.4)
    content((0, 3.4), $S$)
    
    // Base points of regular pyramid
    let A = (-1.4, 0.2)
    let B = (0.6, 0.9)
    let C = (1.4, 0.6)
    let D = (-0.6, -0.1)
    
    // Draw edges
    line(S, A, stroke: 1.2pt + rgb("#333"))
    line(S, B, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(S, C, stroke: 1.2pt + rgb("#333"))
    line(S, D, stroke: 1.2pt + rgb("#333"))
    
    // Base disk representing the light fixture
    circle(O, radius: (1.4, 0.5), fill: rgb(150, 160, 255, 60), stroke: 1.2pt + blue)
    
    // Center point and gravity P
    circle(O, radius: 0.04, fill: red)
    line(O, (0, -1.3), stroke: 2pt + rgb("#d32f2f"), mark: (end: "stealth", fill: rgb("#d32f2f")))
    content((0.3, -0.8), text(fill: rgb("#d32f2f"))[$arrow(P)$])
    
    // Labels
    content((-1.6, 0.2), $A$)
    content((0.8, 1.0), $B$)
    content((1.6, 0.6), $C$)
    content((-0.8, -0.2), $D$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một chiếc đèn chùm treo có khối lượng $m = 5$ kg được thiết kế với đĩa đèn được giữ bởi bốn đoạn xích $S A, S B, S C, S D$ sao cho $S.A B C D$ là hình chóp tứ giác đều có $hat(A S C) = 60^degree$. Biết $arrow(P) = m arrow(g)$ là trọng lực tác dụng lên đĩa đèn, với $g = 10$ m/s². Xét tính đúng/sai của các phát biểu sau:],
  (
    [$arrow(S A), arrow(S B), arrow(S C), arrow(S D)$ là 4 vectơ đồng phẳng.],
    True([$|arrow(S A)| = |arrow(S B)| = |arrow(S C)| = |arrow(S D)|$.]),
    True([Độ lớn của trọng lực $arrow(P)$ tác dụng lên chiếc đèn chùm bằng $50$ N.]),
    [Độ lớn của lực căng cho mỗi sợi xích bằng $(25 sqrt(3))/2$ N.]
  ),
  loigiai: [
    #step[a) Bốn vectơ lực xuất phát từ đỉnh $S$ hướng đến 4 đỉnh $A, B, C, D$ của hình chóp nên chúng không cùng nằm trên bất kỳ mặt phẳng nào. Do đó chúng không đồng phẳng. (Sai)]
    #step[b) Vì hình chóp $S.A B C D$ là hình chóp đều nên các cạnh bên bằng nhau, dẫn đến độ dài các vectơ lực căng xích bằng nhau. (Đúng)]
    #step[c) Trọng lượng chiếc đèn chùm là: $P = m g = 5 times 10 = 50$ N. (Đúng)]
    #step[d) Điều kiện cân bằng lực theo trục thẳng đứng $S O$:
    $4 T cos hat(A S O) = P$.
    Vì tam giác $S A C$ đều nên $hat(A S O) = 1/2 hat(A S C) = 30^degree$.
    $4 T cos 30^degree = 50 <=> 4 T dot sqrt(3)/2 = 50 <=> 2 sqrt(3) T = 50 <=> T = 25/sqrt(3) = (25 sqrt(3))/3$ N. Khẳng định ghi $(25 sqrt(3))/2$ N là Sai. (Sai)]
  ]
)


#my-tln(de: "Đề 2", 
  [Cho tứ diện đều $A B C D$ cạnh $a$. Gọi $M$ là trung điểm của $B C$. Tính cosin góc giữa hai đường thẳng $A B$ và $D M$.],
  [$0.29$],
  loigiai: [
    #step[Đặt cạnh của tứ diện đều bằng $a$. Ta biểu diễn tích vô hướng của $arrow(A B)$ và $arrow(D M)$:
    $arrow(A B) dot arrow(D M) = arrow(A B) dot (arrow(A M) - arrow(A D)) = arrow(A B) dot arrow(A M) - arrow(A B) dot arrow(A D)$.]
    #step[Với $M$ là trung điểm $B C$, ta có $arrow(A M) = 1/2 (arrow(A B) + arrow(A C))$:
    - $arrow(A B) dot arrow(A M) = 1/2 A B^2 + 1/2 arrow(A B) dot arrow(A C) = 1/2 a^2 + 1/4 a^2 = 3/4 a^2$.
    - $arrow(A B) dot arrow(A D) = a^2 cos 60^degree = 1/2 a^2$.]
    #step[Thay các biểu thức trên vào tích vô hướng:
    $arrow(A B) dot arrow(D M) = 3/4 a^2 - 1/2 a^2 = 1/4 a^2$.]
    #step[Độ dài các đoạn thẳng: $A B = a$, $D M = a sqrt(3)/2$ (đường cao trong tam giác đều cạnh $a$).
    $cos(A B, D M) = |arrow(A B) dot arrow(D M)| / (A B dot D M) = (1/4 a^2) / (a dot a sqrt(3)/2) = 1 / (2 sqrt(3)) = sqrt(3)/6 approx 0.29$.]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Draw slide
    line((0, 0), (4.0, 0), stroke: (paint: gray, thickness: 0.8pt, dash: "dashed")) // ground
    line((0, 0), (0, 2.3), stroke: (paint: gray, thickness: 0.8pt, dash: "dashed")) // ladder height
    line((0, 2.3), (4.0, 0), stroke: 1.5pt + black) // slide
    
    // Draw child (circle and stick body)
    circle((2.0, 1.15), radius: 0.15, fill: green.lighten(60%), stroke: 1pt + green)
    line((2.0, 1.0), (2.0, 0.5), stroke: 1.5pt + black)
    
    // Draw gravity P vector
    line((2.0, 0.5), (2.0, -0.7), stroke: 1.8pt + red, mark: (end: "stealth", fill: red))
    content((2.3, -0.4), text(fill: red)[$arrow(P)$])
    
    // Angle indicator
    arc((4.0, 0), start: 180deg, stop: 150deg, radius: 0.8, stroke: 1pt + gray)
    content((3.0, 0.25), $30^degree$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một em nhỏ cân nặng $m = 25$ kg trượt trên cầu trượt dài $3.5$ m. Biết rằng, cầu trượt có góc nghiêng so với phương nằm ngang là $30^degree$. Tính độ lớn của trọng lực $arrow(P) = m arrow(g)$ tác dụng lên em nhỏ, cho biết vectơ gia tốc rơi tự do $arrow(g)$ có độ lớn là $g = 9.8$ m/s².],
  [$245$],
  loigiai: [
    #step[Trọng lực $arrow(P)$ là lực hút của Trái Đất tác dụng lên vật có khối lượng $m$.]
    #step[Công thức tính độ lớn trọng lực:
    $P = m g$.]
    #step[Thay số với $m = 25$ kg và $g = 9.8$ m/s²:
    $P = 25 times 9.8 = 245$ (N).
    Vậy độ lớn trọng lực là $245$ N.]
  ]
)

#my-tln(de: "Đề 2", 
  [Có ba lực cùng tác động vào một vật. Hai trong ba lực này hợp với nhau một góc $100^degree$ và có độ lớn lần lượt là $25$ N và $12$ N. Lực thứ ba vuông góc với mặt phẳng tạo bởi hai lực đã cho và có độ lớn $4$ N. Tính độ lớn của hợp lực của ba lực trên (làm tròn đến hàng đơn vị).],
  [$26$],
  loigiai: [
    #step[Gọi ba lực lần lượt là $arrow(F_1), arrow(F_2), arrow(F_3)$ với $|arrow(F_1)| = 25$ N, $|arrow(F_2)| = 12$ N, $|arrow(F_3)| = 4$ N và $(arrow(F_1), arrow(F_2)) = 100^degree$.
    Vectơ hợp lực: $arrow(F) = arrow(F_1) + arrow(F_2) + arrow(F_3)$.]
    #step[Đặt $arrow(F_{12}) = arrow(F_1) + arrow(F_2)$. Bình phương độ lớn lực tổng hợp hai lực đầu tiên:
    $F_{12}^2 = F_1^2 + F_2^2 + 2 F_1 F_2 cos 100^degree = 25^2 + 12^2 + 2 times 25 times 12 times cos 100^degree$
    $F_{12}^2 = 625 + 144 + 600 cos 100^degree approx 769 - 104.19 = 664.81$ N².]
    #step[Vì lực thứ ba $arrow(F_3)$ vuông góc với mặt phẳng chứa $arrow(F_1)$ và $arrow(F_2)$ nên $arrow(F_3)$ vuông góc với $arrow(F_{12})$.
    Do đó, bình phương độ lớn của hợp lực tổng cộng là:
    $F^2 = F_{12}^2 + F_3^2 approx 664.81 + 4^2 = 680.81$ N².]
    #step[Tính độ lớn hợp lực:
    $F = sqrt(680.81) approx 26.09$ N. Làm tròn đến hàng đơn vị là $26$ N.]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Draw slide path
    line((0, 0), (4.0, 0), stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line((0, 2.3), (4.0, 0), stroke: 1.5pt + black)
    
    // Draw child on slide
    circle((2.0, 1.15), radius: 0.15, fill: green.lighten(60%), stroke: 1pt + green)
    
    // Displacement vector d
    line((2.0, 1.15), (3.5, 0.28), stroke: 2pt + blue, mark: (end: "stealth", fill: blue))
    content((3.0, 0.9), text(fill: blue)[$arrow(d)$])
    
    // Gravity vector P
    line((2.0, 1.15), (2.0, -0.05), stroke: 1.8pt + red, mark: (end: "stealth", fill: red))
    content((2.3, 0.4), text(fill: red)[$arrow(P)$])
    
    // Angle
    arc((4.0, 0), start: 180deg, stop: 150deg, radius: 0.8, stroke: 1pt + gray)
    content((3.0, 0.25), $30^degree$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một em nhỏ cân nặng $m = 25$ kg trượt trên cầu trượt dài $3.5$ m. Biết rằng, cầu trượt có góc nghiêng so với phương nằm ngang là $30^degree$. Độ lớn của trọng lực là $arrow(P) = m arrow(g)$ tác dụng lên em nhỏ, với $g = 9.8$ m/s². Hãy tính công sinh bởi trọng lực $arrow(P)$ khi em nhỏ trượt hết chiều dài cầu trượt (đơn vị: J).],
  [$428.75$],
  loigiai: [
    #step[Độ lớn trọng lực tác dụng lên em nhỏ là:
    $P = m g = 25 times 9.8 = 245$ N.]
    #step[Vectơ dịch chuyển $arrow(d)$ có hướng dọc theo máng trượt đi xuống, độ dài $d = 3.5$ m.
    Vì máng trượt nghiêng góc $30^degree$ so với mặt phẳng ngang, nên phương của máng trượt tạo với phương thẳng đứng (phương của trọng lực $arrow(P)$) một góc bằng:
    $theta = 90^degree - 30^degree = 60^degree$.]
    #step[Công sinh bởi trọng lực $arrow(P)$ là tích vô hướng của trọng lực và vectơ dịch chuyển:
    $A = arrow(P) dot arrow(d) = P dot d dot cos theta = 245 times 3.5 times cos 60^degree = 245 times 3.5 times 0.5 = 428.75$ (J).]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Plates of capacitor
    line((-3.0, 1.5), (3.0, 1.5), stroke: 1.5pt + rgb("#d32f2f"))
    line((-3.0, -1.5), (3.0, -1.5), stroke: 1.5pt + rgb("#2E7D32"))
    
    // Electric field vectors
    for x in range(-2, 3) {
      let px = x * 1.2
      line((px, 1.1), (px, -1.1), stroke: 0.6pt + gray, mark: (end: "stealth", fill: gray))
    }
    content((2.5, 0), text(fill: gray)[$arrow(E)$])
    
    // Path M -> P -> N
    let M = (-1.5, 1.0)
    let P = (0.5, -0.5)
    let N = (2.0, -1.2)
    let H = (-1.5, -1.2)
    
    // Draw path
    line(M, P, stroke: 1.2pt + blue, mark: (end: "stealth", fill: blue))
    line(P, N, stroke: 1.2pt + blue, mark: (end: "stealth", fill: blue))
    
    // Vertical reference
    line(M, H, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(H, N, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    
    // Labels
    content((-1.5, 1.3), $M$)
    content((0.5, -0.15), $P$)
    content((2.3, -1.2), $N$)
    content((-1.8, -1.2), $H$)
    content((-2.0, 0), $d$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một lực tĩnh điện $arrow(F)$ tác động lên điện tích điểm $M$ trong điện trường đều làm cho $M$ dịch chuyển theo đường gấp khúc $M P N$. Biết $q = 2 dot 10^(-12)$ C, vectơ cường độ điện trường có độ lớn $E = 1.8 dot 10^5$ N/C và hình chiếu của độ dịch chuyển lên phương điện trường là $d = M H = 5$ mm. Tính công $A$ sinh bởi lực tĩnh điện (đơn vị: J).],
  [$1.8 dot 10^(-9)$],
  loigiai: [
    #step[Lực tĩnh điện tác dụng lên điện tích $q$ là: $arrow(F) = q arrow(E)$.
    Trong điện trường đều, công sinh bởi lực tĩnh điện khi điện tích dịch chuyển từ $M$ đến $N$ chỉ phụ thuộc vào hình chiếu của điểm đầu và điểm cuối lên phương của đường sức điện.]
    #step[Độ dài hình chiếu của quãng đường dịch chuyển dọc theo phương của điện trường là:
    $d = M H = 5$ mm $= 5 dot 10^(-3)$ m.]
    #step[Công sinh bởi lực tĩnh điện được tính theo công thức:
    $A = q E d = (2 dot 10^(-12)) times (1.8 dot 10^5) times (5 dot 10^(-3))$.]
    #step[Tính toán giá trị:
    $A = 2 times 1.8 times 5 times 10^(-12 + 5 - 3) = 18 times 10^(-10) = 1.8 dot 10^(-9)$ (J).]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    
    // Parallelogram top:
    let A = (-1.5, 0.5)
    let B = (-0.5, 1.2)
    let C = (1.5, 1.2)
    let D = (0.5, 0.5)
    
    let dy = -1.5 // Height of the frame
    let Ad = (A.at(0), A.at(1) + dy)
    let Bd = (B.at(0), B.at(1) + dy)
    let Cd = (C.at(0), C.at(1) + dy)
    let Dd = (D.at(0), D.at(1) + dy)
    
    let E = (0, 3.0)
    
    // Hook
    line(E, (0, 3.4), stroke: 2.5pt + rgb("#e67e22"))
    arc((0.15, 3.4), start: 180deg, stop: -45deg, radius: 0.15, stroke: 2.5pt + rgb("#e67e22"))
    circle(E, radius: 0.08, fill: rgb("#e67e22"), stroke: none)
    
    // Hidden edges of the frame (back edges)
    line(B, Bd, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    line(A, B, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    line(B, C, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    line(Ad, Bd, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    line(Bd, Cd, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    
    // Hidden cable
    line(E, B, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    
    // Draw the car (placed on the bottom face, center)
    let cx = 0.1
    let cy = -0.4
    let car_w = 1.4
    let car_h = 0.4
    let top_w = 0.8
    let top_h = 0.35
    
    // Wheels (back)
    circle((cx - 0.4, cy), radius: 0.2, fill: rgb("#2c3e50"), stroke: none)
    circle((cx + 0.4, cy), radius: 0.2, fill: rgb("#2c3e50"), stroke: none)
    
    // Car body
    rect((cx - car_w/2, cy), (cx + car_w/2, cy + car_h), fill: rgb("#e74c3c"), stroke: rgb("#c0392b") + 1pt, radius: 0.1)
    
    // Car top (cabin)
    rect((cx - top_w/2, cy + car_h), (cx + top_w/2, cy + car_h + top_h), fill: rgb("#ecf0f1"), stroke: rgb("#bdc3c7") + 1pt, radius: 0.1)
    // Windows
    rect((cx - top_w/2 + 0.05, cy + car_h + 0.05), (cx - 0.05, cy + car_h + top_h - 0.05), fill: rgb("#3498db"), stroke: none, radius: 0.05)
    rect((cx + 0.05, cy + car_h + 0.05), (cx + top_w/2 - 0.05, cy + car_h + top_h - 0.05), fill: rgb("#3498db"), stroke: none, radius: 0.05)
    
    // Wheels (front, overlapping body)
    circle((cx - 0.4, cy), radius: 0.2, fill: rgb("#34495e"), stroke: 1pt + rgb("#2c3e50"))
    circle((cx + 0.4, cy), radius: 0.2, fill: rgb("#34495e"), stroke: 1pt + rgb("#2c3e50"))
    circle((cx - 0.4, cy), radius: 0.08, fill: rgb("#bdc3c7"), stroke: none)
    circle((cx + 0.4, cy), radius: 0.08, fill: rgb("#bdc3c7"), stroke: none)
    
    // Visible edges of the frame (front edges)
    line(Ad, Dd, stroke: 1.5pt + black)
    line(Dd, Cd, stroke: 1.5pt + black)
    line(A, Ad, stroke: 1.5pt + black)
    line(D, Dd, stroke: 1.5pt + black)
    line(C, Cd, stroke: 1.5pt + black)
    line(A, D, stroke: 1.5pt + black)
    line(D, C, stroke: 1.5pt + black)
    
    // Visible cables
    line(E, A, stroke: 1.2pt + rgb("#333"))
    line(E, C, stroke: 1.2pt + rgb("#333"))
    line(E, D, stroke: 1.5pt + black)
    
    // Labels
    content((A.at(0) - 0.2, A.at(1) + 0.1), $A$)
    content((B.at(0) - 0.2, B.at(1) + 0.1), $B$)
    content((C.at(0) + 0.2, C.at(1) + 0.1), $C$)
    content((D.at(0) + 0.2, D.at(1) - 0.1), $D$)
    content((E.at(0) - 0.25, E.at(1) + 0.1), $E$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một chiếc ô tô được đặt trên mặt đáy dưới của một khung sắt có dạng hình hộp chữ nhật với đáy trên là hình chữ nhật $A B C D$, mặt phẳng $(A B C D)$ song song với mặt phẳng nằm ngang. Khung sắt đó được buộc vào móc $E$ của chiếc cần cẩu sao cho các đoạn dây cáp $E A, E B, E C, E D$ có độ dài bằng nhau và cùng tạo với mặt phẳng $(A B C D)$ một góc bằng $60^degree$. Chiếc cần cẩu kéo khung sắt lên theo phương thẳng đứng. Tính trọng lượng của chiếc xe ô tô (làm tròn đến hàng đơn vị), biết rằng các lực căng $arrow(F_1), arrow(F_2), arrow(F_3), arrow(F_4)$ đều có cường độ là $4700$ N và trọng lượng của khung sắt là $3000$ N.],
  [$13281$],
  loigiai: [
    #step[Tổng hợp lực nâng thẳng đứng hướng lên do 4 dây cáp tạo ra là:
    $F_("nâng") = 4 F_1 sin 60^degree = 4 times 4700 times sqrt(3)/2 = 9400 sqrt(3) approx 16281.27$ N.]
    #step[Khi cẩu nâng thẳng đứng đều, tổng lực nâng cân bằng với trọng lượng tổng cộng của khung sắt và xe ô tô:
    $P_("tổng") = F_("nâng") approx 16281$ N.]
    #step[Trọng lượng của riêng xe ô tô là:
    $P_("ô tô") = P_("tổng") - P_("khung") approx 16281 - 3000 = 13281$ N.]
  ]
)


