

#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *
#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm)
)

// #show: stexgv-doc.with(
//   doc-type: "book",
//   title: "CHUYÊN ĐỀ: Xác Suất Đối Kháng",
//   author: "GV Nguyễn Văn Sang",
//   theme-color: classic.blue
// )

#let math-color = rgb("#ee07b8") 
#show math.equation: set text(fill: math-color)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ VÀ MỤC LỤC
// ═══════════════════════════════════════════════════════════
// #v(1em)
// #block(
//   width: 100%,
//   fill: rgb("#f4f8fc"),
//   stroke: (left: 6pt + classic.blue, top: 0.5pt + rgb("#dbe4f0"), right: 0.5pt + rgb("#dbe4f0"), bottom: 0.5pt + rgb("#dbe4f0")),
//   inset: 16pt,
//   radius: (right: 4pt)
// )[
//   #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: Mặt Cầu]
  
//   #v(0.8em)
//   #text(style: "italic", size: 12pt, fill: rgb("#555555"))[Kỹ thuật tọa độ hóa và công thức giải nhanh bài toán Parabol nội tiếp hình chữ nhật.]
// ]
// #v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill:  math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 

// ═══════════════════════════════════════════════════════════
// THIẾT KẾ CHUYÊN ĐỀ MẪU: BÀI TOÁN THỰC TẾ & VẬN DỤNG CAO
// ═════════════════════════════════════════════
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
    [
      #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
        XÁC SUẤT BỐC BI
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
       Vấn đề di chuyển bi giữa các hộp.
      ]
    ]
  )
]
#import "@preview/cetz:0.5.2": canvas, draw

#tln(
  [Có 3 chiếc hộp trống được ký hiệu là $A$, $B$ và $C$. Người ta thực hiện một phép thử như sau: Gieo một con xúc xắc cân đối và đồng chất, gọi $k$ là số chấm xuất hiện. Mỗi lần gieo, người ta lấy đúng 2 quả bóng để cho vào các hộp theo quy tắc: nếu $k <= 2$ thì cho cả 2 quả bóng vào hộp $A$; nếu $3 <= k <= 5$ thì cho 1 quả bóng vào hộp $A$ và 1 quả bóng vào hộp $B$; nếu $k = 6$ thì cho 1 quả bóng vào hộp $B$ và 1 quả bóng vào hộp $C$. Thực hiện lặp lại phép thử trên 2 lần. Biết rằng sau 2 lần gieo, số bóng có trong hộp $A$ là một số chẵn. Tính xác suất để số bóng trong hộp $B$ nhiều hơn số bóng trong hộp $C$.],
  [0.5],
  loigiai: [
    #step[
      Gọi $X$ là biến cố "Sau 2 lần gieo, số bóng ở hộp $A$ là số chẵn" và $Y$ là biến cố "Số bóng ở hộp $B$ nhiều hơn hộp $C$". Ta cần tính $P(Y | X) = (P(X inter Y)) / P(X)$.
      
      Trước tiên, phân tích 3 khả năng (KN) có thể xảy ra trong *mỗi lần gieo*:
      - *KN1:* $k in {1; 2}$ $arrow$ Xác suất $1/3$, phân bổ bóng: $(+2A, 0B, 0C)$.
      - *KN2:* $k in {3; 4; 5}$ $arrow$ Xác suất $1/2$, phân bổ bóng: $(+1A, +1B, 0C)$.
      - *KN3:* $k = 6$ $arrow$ Xác suất $1/6$, phân bổ bóng: $(0A, +1B, +1C)$.
    ]
    
    #step[
      *Sơ đồ cây biểu diễn phân bổ bóng sau 2 lần gieo:*
      #v(0.5em)
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          
          let edge-style = (mark: (end: ">", fill: black), stroke: 0.7pt)
          let lbl(txt) = box(fill: white, inset: 1pt, txt)
          
          // Các điểm neo L1
          let p1_1 = (3.5, 4.5)
          let p1_2 = (3.5, 0)
          let p1_3 = (3.5, -4.5)

          // Vẽ Nút gốc (Bắt đầu)
          content((0, 0), box(stroke: 1pt + black, inset: 5pt, radius: 4pt)[Bắt đầu], name: "N0")
          
          // Vẽ Nút Lần 1
          content(p1_1, align(center)[*KN1* \ $(2A, 0B, 0C)$], name: "N1_1")
          content(p1_2, align(center)[*KN2* \ $(1A, 1B, 0C)$], name: "N1_2")
          content(p1_3, align(center)[*KN3* \ $(0A, 1B, 1C)$], name: "N1_3")

          // Nhánh Lần 1
          line("N0", "N1_1", ..edge-style); content((1.75, 2.75), lbl[$1/3$])
          line("N0", "N1_2", ..edge-style); content((1.75, 0), lbl[$1/2$])
          line("N0", "N1_3", ..edge-style); content((1.75, -2.85), lbl[$1/6$])

          // Nhánh Lần 2 (Viết tường minh, không dùng vòng lặp để tránh lỗi scope của Cetz)
          
          // 1. Từ KN1 rẽ ra 3 nhánh
          line("N1_1", (7.5, 6.0), ..edge-style)
          content((5.5, 5.6), lbl[$1/3$])
          content((7.7, 6.0), [*KN1* $arrow (4A, 0B, 0C)$ #h(2pt) #text(fill: green)[(Nhận)]], anchor: "west")

          line("N1_1", (7.5, 4.5), ..edge-style)
          content((5.5, 4.4), lbl[$1/2$])
          content((7.7, 4.5), [*KN2* $arrow (3A, 1B, 0C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west") 

          line("N1_1", (7.5, 3.0), ..edge-style)
          content((5.5, 3.25), lbl[$1/6$])
          content((7.7, 3.0), [*KN3* $arrow (2A, 1B, 1C)$ #h(2pt) #text(fill: green)[(Nhận)]], anchor: "west")

          // 2. Từ KN2 rẽ ra 3 nhánh
          line("N1_2", (7.5, 1.5), ..edge-style)
          content((5.5, 0.8+.3), lbl[$1/3$])
          content((7.7, 1.5), [*KN1* $arrow (3A, 1B, 0C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          line("N1_2", (7.5, 0), ..edge-style)
          content((5.5, 0.1 -.2), lbl[$1/2$])
          content((7.7, 0), [*KN2* $arrow (2A, 2B, 0C)$ #h(2pt) #text(fill: blue, weight: "bold")[($B>C$)]], anchor: "west")

          line("N1_2", (7.5, -1.5), ..edge-style)
          content((5.5, -0.5 -.8), lbl[$1/6$])
          content((7.7, -1.5), [*KN3* $arrow (1A, 2B, 1C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // 3. Từ KN3 rẽ ra 3 nhánh
          line("N1_3", (7.5, -3.0), ..edge-style)
          content((5.5, -3.7 +.3), lbl[$1/3$])
          content((7.7, -3.0), [*KN1* $arrow (2A, 1B, 1C)$ #h(2pt) #text(fill: green)[(Nhận)]], anchor: "west")

          line("N1_3", (7.5, -4.5), ..edge-style)
          content((5.5, -4.4 -.2), lbl[$1/2$])
          content((7.7, -4.5), [*KN2* $arrow (1A, 2B, 1C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          line("N1_3", (7.5, -6.0), ..edge-style)
          content((5.5, -5.1-.8), lbl[$1/6$])
          content((7.7, -6.0), [*KN3* $arrow (0A, 2B, 2C)$ #h(2pt) #text(fill: green)[(Nhận)]], anchor: "west")
        })
      ]
    ]

    #step[
      Dựa vào sơ đồ cây, ta lọc được các nhánh mà hộp $A$ có số bóng chẵn (biến cố $X$):
      $ P(X) = (1/3 times 1/3) + (1/3 times 1/6) + (1/2 times 1/2) + (1/6 times 1/3) + (1/6 times 1/6) = 1/2 $
      
      Trong số các nhánh trên, nhánh duy nhất thỏa mãn điều kiện số bóng hộp $B$ nhiều hơn hộp $C$ (biến cố $X inter Y$) là nhánh gieo ra KN2 cả hai lần (được $2A, 2B, 0C$):
      $ P(X inter Y) = 1/2 times 1/2 = 1/4 $
    ]

    #step[
      Xác suất cần tìm (xác suất có điều kiện) là:
      $ P(Y | X) = (P(X inter Y)) / P(X) = (1/4) / (1/2) = 1/2 $
    ]
  ]
)

#tln(
  [Có $3$ chiếc hộp trống được ký hiệu là $A$, $B$ và $C$. Người ta thực hiện một phép thử như sau: Gieo một con xúc xắc cân đối và đồng chất, gọi $k$ là số chấm xuất hiện. Mỗi lần gieo, người ta lấy đúng $2$ quả bóng để cho vào các hộp theo quy tắc: nếu $k <= 2$ thì cho cả $2$ quả bóng vào hộp $A$; nếu $3 <= k <= 5$ thì cho $1$ quả bóng vào hộp $A$ và $1$ quả bóng vào hộp $B$; nếu $k = 6$ thì cho $1$ quả bóng vào hộp $B$ và $1$ quả bóng vào hộp $C$. Thực hiện lặp lại phép thử trên $2$ lần. Biết rằng sau $2$ lần gieo, số bóng có trong hộp $A$ là một số chẵn. Tính xác suất để số bóng trong hộp $B$ nhiều hơn số bóng trong hộp $C$.],
  [$1/2$],
  loigiai: [
    #ppgiai(title: [Tư duy phá án (Xác suất có điều kiện)])[
      Bài toán yêu cầu tính xác suất $P(N|M)$ với:
      - Biến cố $M$: "Sau $2$ lần gieo, số bóng trong hộp $A$ là số chẵn".
      - Biến cố $N$: "Số bóng trong hộp $B$ nhiều hơn hộp $C$".
      Ta áp dụng công thức Bayes để phá án: $P(N|M) = (P(N cap M))/(P(M))$.
    ]

    #step[Phân tích phép thử trong 1 lần gieo]
    Gọi $X_1, X_2, X_3$ là các biến cố tương ứng với $3$ quy tắc bỏ bóng:
    - $X_1$ ($k in {1, 2}$): Lấy $2$ quả vào $A$. Xác suất $P(X_1) = 2/6 = 1/3$.
    - $X_2$ ($k in {3, 4, 5}$): Lấy $1$ quả vào $A$, $1$ quả vào $B$. Xác suất $P(X_2) = 3/6 = 1/2$.
    - $X_3$ ($k = 6$): Lấy $1$ quả vào $B$, $1$ quả vào $C$. Xác suất $P(X_3) = 1/6$.

    #step[Sơ đồ phân nhánh không gian mẫu sau 2 lần gieo]
    Ta lập sơ đồ bảng để quét toàn bộ hiện trường, tìm biến cố $M$ (số bóng $A$ chẵn):

    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + palette.border,
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Lần 1]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Lần 2]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Xác suất ($p$)]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Trạng thái $(A, B, C)$]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Điều kiện $M$ ($A$ chẵn)]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Mục tiêu $N$ ($B > C$)]],

        [$X_1$], [$X_1$], [$(1/3)^2 = 1/9$], [$(4, 0, 0)$], text(palette.correct)[Nhận ($A=4$)], [Loại ($0=0$)],
        [$X_1$], [$X_2$], [$1/3 times 1/2 = 1/6$], [$(3, 1, 0)$], text(palette.wrong)[Loại ($A=3$)], [-],
        [$X_1$], [$X_3$], [$1/3 times 1/6 = 1/18$], [$(2, 1, 1)$], text(palette.correct)[Nhận ($A=2$)], [Loại ($1=1$)],

        [$X_2$], [$X_1$], [$1/2 times 1/3 = 1/6$], [$(3, 1, 0)$], text(palette.wrong)[Loại ($A=3$)], [-],
        [$X_2$], [$X_2$], [$(1/2)^2 = 1/4$], [$(2, 2, 0)$], text(palette.correct)[Nhận ($A=2$)], text(palette.correct)[Nhận ($2>0$)],
        [$X_2$], [$X_3$], [$1/2 times 1/6 = 1/12$], [$(1, 2, 1)$], text(palette.wrong)[Loại ($A=1$)], [-],

        [$X_3$], [$X_1$], [$1/6 times 1/3 = 1/18$], [$(2, 1, 1)$], text(palette.correct)[Nhận ($A=2$)], [Loại ($1=1$)],
        [$X_3$], [$X_2$], [$1/6 times 1/2 = 1/12$], [$(1, 2, 1)$], text(palette.wrong)[Loại ($A=1$)], [-],
        [$X_3$], [$X_3$], [$(1/6)^2 = 1/36$], [$(0, 2, 2)$], text(palette.correct)[Nhận ($A=0$)], [Loại ($2=2$)]
      )
    ]

    #step[Khoanh vùng hiện trường và kết luận]
    Dựa vào sơ đồ trên, ta thu thập được các "chứng cứ" sau:
    - Xác suất để hộp $A$ có số bóng chẵn (tổng các ô "Nhận" ở cột $M$):
      $ P(M) = 1/9 + 1/18 + 1/4 + 1/18 + 1/36 = 18/36 = 1/2 $
    - Trong các "hiện trường" $A$ chẵn, duy nhất nhánh $(X_2, X_2)$ thỏa mãn thêm yêu cầu hộp $B$ nhiều bóng hơn hộp $C$ (cột $N$):
      $ P(N cap M) = 1/4 $
    - Theo công thức xác suất có điều kiện, ta có kết quả cuối cùng:
      $ P(N|M) = (P(N cap M))/(P(M)) = (1/4)/(1/2) = 1/2 $
    #reset-step()
  ]
)

#tln(
  [Có 3 chiếc hộp trống được ký hiệu là $A$, $B$ và $C$. Gieo một con xúc xắc cân đối và đồng chất, gọi $k$ là số chấm xuất hiện. Mỗi lần gieo lấy đúng 2 quả bóng cho vào các hộp theo quy tắc: nếu $k$ là số lẻ thì cho 1 bóng vào hộp $A$ và 1 bóng vào hộp $B$; nếu $k in {2; 4}$ thì cho cả 2 bóng vào hộp $C$; nếu $k = 6$ thì cho cả 2 bóng vào hộp $B$. Thực hiện lặp lại phép thử 2 lần. Biết rằng sau 2 lần gieo, hộp $B$ có đúng 2 quả bóng. Tính xác suất để hộp $A$ trống (không có quả bóng nào).],
  [$4/13$],
  loigiai: [
    #step[
      Gọi $X$ là biến cố "Sau 2 lần gieo, hộp $B$ có đúng 2 bóng" và $Y$ là biến cố "Hộp $A$ trống ($0$ bóng)". Ta cần tính $P(Y | X) = (P(X inter Y)) / P(X)$.
      
      Phân tích 3 khả năng (KN) trong *mỗi lần gieo*:
      - *KN1:* $k in {1; 3; 5}$ $arrow$ Xác suất $1/2$, phân bổ bóng: $(+1A, +1B, 0C)$.
      - *KN2:* $k in {2; 4}$ $arrow$ Xác suất $1/3$, phân bổ bóng: $(0A, 0B, +2C)$.
      - *KN3:* $k = 6$ $arrow$ Xác suất $1/6$, phân bổ bóng: $(0A, +2B, 0C)$.
    ]
    
    #step[
      *Sơ đồ cây biểu diễn phân bổ bóng sau 2 lần gieo:*
      #v(0.5em)
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          
          let edge-style = (mark: (end: ">", fill: black), stroke: 0.7pt)
          let lbl(txt) = box(fill: white, inset: 1pt, txt)
          
          let p1_1 = (3.5, 4.5)
          let p1_2 = (3.5, 0)
          let p1_3 = (3.5, -4.5)

          content((0, 0), box(stroke: 1pt + black, inset: 5pt, radius: 4pt)[Bắt đầu], name: "N0")
          
          content(p1_1, align(center)[*KN1* \ $(1A, 1B, 0C)$], name: "N1_1")
          content(p1_2, align(center)[*KN2* \ $(0A, 0B, 2C)$], name: "N1_2")
          content(p1_3, align(center)[*KN3* \ $(0A, 2B, 0C)$], name: "N1_3")

          line("N0", "N1_1", ..edge-style); content((1.75, 2.75), lbl[$1/2$])
          line("N0", "N1_2", ..edge-style); content((1.75, 0), lbl[$1/3$])
          line("N0", "N1_3", ..edge-style); content((1.75, -2.85), lbl[$1/6$])

          // 1. Từ KN1 rẽ ra 3 nhánh
          line("N1_1", (7.5, 6.0), ..edge-style)
          content((5.5, 5.6), lbl[$1/2$])
          content((7.7, 6.0), [*KN1* $arrow (2A, 2B, 0C)$ #h(2pt) #text(fill: green)[(Nhận)]], anchor: "west")

          line("N1_1", (7.5, 4.5), ..edge-style)
          content((5.5, 4.4), lbl[$1/3$])
          content((7.7, 4.5), [*KN2* $arrow (1A, 1B, 2C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west") 

          line("N1_1", (7.5, 3.0), ..edge-style)
          content((5.5, 3.25), lbl[$1/6$])
          content((7.7, 3.0), [*KN3* $arrow (1A, 3B, 0C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // 2. Từ KN2 rẽ ra 3 nhánh
          line("N1_2", (7.5, 1.5), ..edge-style)
          content((5.5, 0.8+.3), lbl[$1/2$])
          content((7.7, 1.5), [*KN1* $arrow (1A, 1B, 2C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          line("N1_2", (7.5, 0), ..edge-style)
          content((5.5, 0.1 -.2), lbl[$1/3$])
          content((7.7, 0), [*KN2* $arrow (0A, 0B, 4C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          line("N1_2", (7.5, -1.5), ..edge-style)
          content((5.5, -0.5 -.8), lbl[$1/6$])
          content((7.7, -1.5), [*KN3* $arrow (0A, 2B, 2C)$ #h(2pt) #text(fill: blue, weight: "bold")[($A=0$)]], anchor: "west")

          // 3. Từ KN3 rẽ ra 3 nhánh
          line("N1_3", (7.5, -3.0), ..edge-style)
          content((5.5, -3.7 +.3), lbl[$1/2$])
          content((7.7, -3.0), [*KN1* $arrow (1A, 3B, 0C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          line("N1_3", (7.5, -4.5), ..edge-style)
          content((5.5, -4.4 -.2), lbl[$1/3$])
          content((7.7, -4.5), [*KN2* $arrow (0A, 2B, 2C)$ #h(2pt) #text(fill: blue, weight: "bold")[($A=0$)]], anchor: "west")

          line("N1_3", (7.5, -6.0), ..edge-style)
          content((5.5, -5.1-.8), lbl[$1/6$])
          content((7.7, -6.0), [*KN3* $arrow (0A, 4B, 0C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
        })
      ]
    ]

    #step[
      Dựa vào sơ đồ cây, ta lọc được các nhánh mà hộp $B$ có đúng 2 bóng (biến cố $X$):
      $ P(X) = (1/2 times 1/2) + (1/3 times 1/6) + (1/6 times 1/3) = 1/4 + 1/18 + 1/18 = 13/36 $
      
      Trong số các nhánh được "Nhận" đó, nhánh thỏa mãn điều kiện hộp $A$ trống (biến cố $X inter Y$) là 2 nhánh gieo ra tổ hợp (KN2, KN3) và (KN3, KN2):
      $ P(X inter Y) = (1/3 times 1/6) + (1/6 times 1/3) = 2/18 = 4/36 $
    ]

    #step[
      Xác suất cần tìm là:
      $ P(Y | X) = (P(X inter Y)) / P(X) = (4/36) / (13/36) = 4/13 $
    ]
  ]
)

#tln(
  [Một robot di chuyển trên mặt phẳng tọa độ $O x y$, xuất phát từ gốc tọa độ $O(0;0)$. Robot thực hiện $2$ bước di chuyển liên tiếp, mỗi bước được điều khiển bằng cách gieo một con xúc xắc. Nếu số chấm nhỏ hơn hoặc bằng $2$ thì robot đi lên trên $1$ đơn vị; nếu số chấm từ $3$ đến $5$ thì robot đi sang phải $1$ đơn vị; nếu số chấm bằng $6$ thì robot đi chéo lên góc phần tư thứ nhất sao cho hoành độ và tung độ đều tăng $1$ đơn vị. Biết rằng sau $2$ bước, robot nằm trên đường phân giác $y = x$. Tính xác suất để robot kết thúc tại điểm $K(1;1)$.],
  [$12/13$],
  loigiai: [
    #ppgiai(title: [Tư duy phá án (Sử dụng bảng quét tọa độ)])[
      - Tọa độ robot bắt đầu là $(0, 0)$. Phép cộng tọa độ sau mỗi bước:
        + Lên trên ($U$): Cộng $(0, 1)$ với xác suất $P(U) = 2/6 = 1/3$.
        + Sang phải ($R$): Cộng $(1, 0)$ với xác suất $P(R) = 3/6 = 1/2$.
        + Đi chéo ($D$): Cộng $(1, 1)$ với xác suất $P(D) = 1/6$.
      - *Điều kiện $M$:* Robot nằm trên $y = x$ (nghĩa là hoành độ bằng tung độ).
      - *Mục tiêu $N$:* Tọa độ cuối cùng là $(1, 1)$.
    ]

    #step[Bảng lưới tọa độ sau 2 bước]

    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        inset: (x: 8pt, y: 10pt), // <--- Thêm dòng này để tăng chiều cao hàng
        stroke: 0.5pt + palette.border,
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Bước 1]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Bước 2]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Xác suất ($p$)]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Tọa độ $(x, y)$]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Điều kiện $M$ ($x=y$)]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Mục tiêu $N$ $(1,1)$]],

        [$U$], [$U$], [$(1/3)^2 = 1/9$], [$(0, 2)$], text(palette.wrong)[Loại], [-],
        [$U$], [$R$], [$1/3 times 1/2 = 1/6$], [$(1, 1)$], text(palette.correct)[Nhận], text(palette.correct)[Nhận],
        [$U$], [$D$], [$1/3 times 1/6 = 1/18$], [$(1, 2)$], text(palette.wrong)[Loại], [-],

        [$R$], [$U$], [$1/2 times 1/3 = 1/6$], [$(1, 1)$], text(palette.correct)[Nhận], text(palette.correct)[Nhận],
        [$R$], [$R$], [$(1/2)^2 = 1/4$], [$(2, 0)$], text(palette.wrong)[Loại], [-],
        [$R$], [$D$], [$1/2 times 1/6 = 1/12$], [$(2, 1)$], text(palette.wrong)[Loại], [-],

        [$D$], [$U$], [$1/6 times 1/3 = 1/18$], [$(1, 2)$], text(palette.wrong)[Loại], [-],
        [$D$], [$R$], [$1/6 times 1/2 = 1/12$], [$(2, 1)$], text(palette.wrong)[Loại], [-],
        [$D$], [$D$], [$(1/6)^2 = 1/36$], [$(2, 2)$], text(palette.correct)[Nhận], text(palette.wrong)[Loại],
      )
    ]

    #step[Tính toán xác suất Bayes]
    - Xác suất robot nằm trên đường $y=x$ (cộng các xác suất ở ô Nhận của cột $M$):
      $ P(M) = 1/6 + 1/6 + 1/36 = 6/36 + 6/36 + 1/36 = 13/36 $
    - Xác suất robot nằm đúng tại $(1,1)$ trong số các trường hợp trên:
      $ P(N cap M) = 1/6 + 1/6 = 12/36 $
    - Áp dụng công thức phá án ngược:
      $ P(N|M) = (P(N cap M))/(P(M)) = (12/36) / (13/36) = 12/13 $
    #reset-step()
  ]
)

#import "@preview/cetz:0.5.2": canvas, draw

#tln(
  [Có 3 chiếc hộp trống được ký hiệu là $A$, $B$ và $C$. Gieo một con xúc xắc cân đối và đồng chất, gọi $k$ là số chấm xuất hiện. Mỗi lần gieo, người ta lấy đúng 5 quả bóng để cho vào hộp theo quy tắc: nếu $k=1$ thì cho 3 bóng vào hộp $A$ và 2 bóng vào hộp $B$; nếu $k in {2; 3; 4}$ thì cho cả 5 bóng vào hộp $C$; nếu $k in {5; 6}$ thì cho 2 bóng vào hộp $A$, 1 bóng vào $B$ và 2 bóng vào $C$. Thực hiện phép thử trên 2 lần. Biết rằng sau 2 lần gieo, hộp $B$ có chính xác 2 quả bóng. Tính xác suất để hộp $A$ có chính xác 3 quả bóng.],
  [0.6],
  loigiai: [
    #step[
      Gọi $X$ là biến cố "Sau 2 lần gieo, hộp $B$ có đúng 2 bóng" và $Y$ là biến cố "Hộp $A$ có đúng 3 bóng". Cần tính $P(Y | X) = (P(X inter Y)) / P(X)$.
      
      Phân tích 3 khả năng (KN) trong *mỗi lần gieo*:
      - *KN1:* $k=1$ $arrow$ Xác suất $1/6$, phân bổ: $(+3A, +2B, 0C)$.
      - *KN2:* $k in {2; 3; 4}$ $arrow$ Xác suất $3/6 = 1/2$, phân bổ: $(0A, 0B, +5C)$.
      - *KN3:* $k in {5; 6}$ $arrow$ Xác suất $2/6 = 1/3$, phân bổ: $(+2A, +1B, +2C)$.
    ]
    
    #step[
      *Sơ đồ cây phân bổ bóng sau 2 lần gieo:*
      #v(0.5em)
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          let edge-style = (mark: (end: ">", fill: black), stroke: 0.7pt)
          let lbl(txt) = box(fill: white, inset: 1pt, txt)
          
          let p1_1 = (3.5, 4.5); let p1_2 = (3.5, 0); let p1_3 = (3.5, -4.5)

          content((0, 0), box(stroke: 1pt + black, inset: 5pt, radius: 4pt)[Bắt đầu], name: "N0")
          content(p1_1, align(center)[*KN1* \ $(3A, 2B, 0C)$], name: "N1_1")
          content(p1_2, align(center)[*KN2* \ $(0A, 0B, 5C)$], name: "N1_2")
          content(p1_3, align(center)[*KN3* \ $(2A, 1B, 2C)$], name: "N1_3")

          line("N0", "N1_1", ..edge-style); content((1.75, 2.75), lbl[$1/6$])
          line("N0", "N1_2", ..edge-style); content((1.75, 0), lbl[$1/2$])
          line("N0", "N1_3", ..edge-style); content((1.75, -2.85), lbl[$1/3$])

          // Từ KN1
          line("N1_1", (7.5, 6.0), ..edge-style); content((5.5, 5.6), lbl[$1/6$])
          content((7.7, 6.0), [*KN1* $arrow (6A, 4B, 0C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_1", (7.5, 4.5), ..edge-style); content((5.5, 4.4), lbl[$1/2$])
          content((7.7, 4.5), [*KN2* $arrow (3A, 2B, 5C)$ #h(2pt) #text(fill: blue, weight: "bold")[($A=3$)]], anchor: "west") 
          line("N1_1", (7.5, 3.0), ..edge-style); content((5.5, 3.25), lbl[$1/3$])
          content((7.7, 3.0), [*KN3* $arrow (5A, 3B, 2C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // Từ KN2
          line("N1_2", (7.5, 1.5), ..edge-style); content((5.5, 0.8+.3), lbl[$1/6$])
          content((7.7, 1.5), [*KN1* $arrow (3A, 2B, 5C)$ #h(2pt) #text(fill: blue, weight: "bold")[($A=3$)]], anchor: "west")
          line("N1_2", (7.5, 0), ..edge-style); content((5.5, 0.1 -.2), lbl[$1/2$])
          content((7.7, 0), [*KN2* $arrow (0A, 0B, 10C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_2", (7.5, -1.5), ..edge-style); content((5.5, -0.5 -.8), lbl[$1/3$])
          content((7.7, -1.5), [*KN3* $arrow (2A, 1B, 7C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // Từ KN3
          line("N1_3", (7.5, -3.0), ..edge-style); content((5.5, -3.7 +.3), lbl[$1/6$])
          content((7.7, -3.0), [*KN1* $arrow (5A, 3B, 2C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_3", (7.5, -4.5), ..edge-style); content((5.5, -4.4 -.2), lbl[$1/2$])
          content((7.7, -4.5), [*KN2* $arrow (2A, 1B, 7C)$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_3", (7.5, -6.0), ..edge-style); content((5.5, -5.1-.8), lbl[$1/3$])
          content((7.7, -6.0), [*KN3* $arrow (4A, 2B, 4C)$ #h(2pt) #text(fill: green)[(Nhận)]], anchor: "west")
        })
      ]
    ]

    #step[
      Từ sơ đồ trên, các nhánh thỏa mãn hộp $B$ có đúng 2 bóng (biến cố $X$) gồm các nhánh Xanh dương và Xanh lá:
      $ P(X) = (1/6 times 1/2) + (1/2 times 1/6) + (1/3 times 1/3) = 1/12 + 1/12 + 1/9 = 10/36 $
      
      Trong số đó, những nhánh thỏa mãn có đúng 3 quả bóng ở hộp $A$ (biến cố $X inter Y$) chỉ có nhánh Xanh dương:
      $ P(X inter Y) = (1/6 times 1/2) + (1/2 times 1/6) = 1/12 + 1/12 = 6/36 $
    ]

    #step[
      Xác suất cần tìm dưới dạng số thập phân là:
      $ P(Y | X) = (P(X inter Y)) / P(X) = (6/36) / (10/36) = 6/10 = 0.6 $
    ]
  ]
)
#import "@preview/cetz:0.5.2": canvas, draw

#tln(
  [Một nhân vật trong trò chơi bắt đầu với 1 Điểm kỹ năng. Người chơi có thể gieo xúc xắc cân đối để nâng cấp trong 2 giai đoạn. Ở mỗi giai đoạn: nếu số chấm $k in {1; 2}$ thì nâng cấp thành công (được cộng thêm 1 điểm); nếu $k in {3; 4; 5}$ thì nâng cấp hòa (không cộng không trừ điểm); nếu $k = 6$ thì nâng cấp thất bại (bị trừ đi 1 điểm). Biết rằng sau 2 giai đoạn, nhân vật có ít nhất 2 Điểm kỹ năng. Tính xác suất để nhân vật đạt được số Điểm kỹ năng tối đa (3 điểm).],
  [0.25],
  loigiai: [
    #step[
      Gọi $X$ là biến cố "Sau 2 giai đoạn, Điểm kỹ năng $>= 2$" và $Y$ là biến cố "Điểm kỹ năng đạt tối đa (3 điểm)". Ta tính $P(Y | X) = (P(X inter Y)) / P(X)$.
      
      Nhân vật bắt đầu với $1$ điểm. Phân tích 3 khả năng (KN) ở *mỗi giai đoạn*:
      - *KN1:* $k in {1; 2}$ $arrow$ Xác suất $1/3$, thay đổi điểm: $+1$.
      - *KN2:* $k in {3; 4; 5}$ $arrow$ Xác suất $1/2$, thay đổi điểm: $+0$.
      - *KN3:* $k = 6$ $arrow$ Xác suất $1/6$, thay đổi điểm: $-1$.
    ]
    
    #step[
      *Sơ đồ cây biểu diễn quá trình thay đổi điểm (Ban đầu: 1đ):*
      #v(0.5em)
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          let edge-style = (mark: (end: ">", fill: black), stroke: 0.7pt)
          let lbl(txt) = box(fill: white, inset: 1pt, txt)
          
          let p1_1 = (3.5, 4.5); let p1_2 = (3.5, 0); let p1_3 = (3.5, -4.5)

          content((0, 0), box(stroke: 1pt + black, inset: 5pt, radius: 4pt)[Có 1 điểm], name: "N0")
          content(p1_1, align(center)[*KN1* \ ($+1$)], name: "N1_1")
          content(p1_2, align(center)[*KN2* \ ($+0$)], name: "N1_2")
          content(p1_3, align(center)[*KN3* \ ($-1$)], name: "N1_3")

          line("N0", "N1_1", ..edge-style); content((1.75, 2.75), lbl[$1/3$])
          line("N0", "N1_2", ..edge-style); content((1.75, 0), lbl[$1/2$])
          line("N0", "N1_3", ..edge-style); content((1.75, -2.85), lbl[$1/6$])

          // Từ nhánh GĐ 1: KN1 (Đang có 2 điểm)
          line("N1_1", (7.0, 6.0), ..edge-style); content((5.25, 5.6), lbl[$1/3$])
          content((7.2, 6.0), [*KN1* $arrow$ Cuối: 3đ #h(2pt) #text(fill: blue, weight: "bold")[($=3$đ)]], anchor: "west")
          line("N1_1", (7.0, 4.5), ..edge-style); content((5.25, 4.4), lbl[$1/2$])
          content((7.2, 4.5), [*KN2* $arrow$ Cuối: 2đ #h(2pt) #text(fill: green)[($>=2$đ)]], anchor: "west") 
          line("N1_1", (7.0, 3.0), ..edge-style); content((5.25, 3.25), lbl[$1/6$])
          content((7.2, 3.0), [*KN3* $arrow$ Cuối: 1đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // Từ nhánh GĐ 1: KN2 (Đang có 1 điểm)
          line("N1_2", (7.0, 1.5), ..edge-style); content((5.25, 0.8+.3), lbl[$1/3$])
          content((7.2, 1.5), [*KN1* $arrow$ Cuối: 2đ #h(2pt) #text(fill: green)[($>=2$đ)]], anchor: "west")
          line("N1_2", (7.0, 0), ..edge-style); content((5.25, 0.1 -.2), lbl[$1/2$])
          content((7.2, 0), [*KN2* $arrow$ Cuối: 1đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_2", (7.0, -1.5), ..edge-style); content((5.25, -0.5 -.8), lbl[$1/6$])
          content((7.2, -1.5), [*KN3* $arrow$ Cuối: 0đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // Từ nhánh GĐ 1: KN3 (Đang có 0 điểm)
          line("N1_3", (7.0, -3.0), ..edge-style); content((5.25, -3.7 +.3), lbl[$1/3$])
          content((7.2, -3.0), [*KN1* $arrow$ Cuối: 1đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_3", (7.0, -4.5), ..edge-style); content((5.25, -4.4 -.2), lbl[$1/2$])
          content((7.2, -4.5), [*KN2* $arrow$ Cuối: 0đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_3", (7.0, -6.0), ..edge-style); content((5.25, -5.1-.8), lbl[$1/6$])
          content((7.2, -6.0), [*KN3* $arrow$ Cuối: -1đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
        })
      ]
    ]

    #step[
      Các nhánh thỏa mãn biến cố $X$ (tổng điểm $>= 2$) gồm nhánh Xanh lá và Xanh dương:
      $ P(X) = (1/3 times 1/3) + (1/3 times 1/2) + (1/2 times 1/3) = 1/9 + 1/6 + 1/6 = 4/36 + 6/36 + 6/36 = 16/36 $
      
      Trong 3 nhánh trên, chỉ có duy nhất nhánh đạt tối đa 3 điểm (biến cố $X inter Y$, màu xanh dương):
      $ P(X inter Y) = 1/3 times 1/3 = 1/9 = 4/36 $
    ]

    #step[
      Xác suất cần tìm dưới dạng số thập phân là:
      $ P(Y | X) = (P(X inter Y)) / P(X) = (4/36) / (16/36) = 4/16 = 1/4 = 0.25 $
    ]
  ]
)

#tln(
  [Một xạ thủ tham gia hội thao  với 2 giai đoạn bắn cung. Ở mỗi giai đoạn, xạ thủ gieo một con xúc xắc cân đối để xác định loại cung và vị trí bắn: nếu số chấm $k in {1; 2; 3}$, xạ thủ bắn trúng vòng ngoài (được 1 điểm); nếu $k in {4; 5}$, xạ thủ bắn trúng hồng tâm (được 10 điểm); nếu $k = 6$, xạ thủ bắn trượt (được 0 điểm). Biết rằng sau 2 giai đoạn, tổng số điểm xạ thủ ghi được lớn hơn hoặc bằng 10. Tính xác suất để tổng số điểm của xạ thủ là một số lẻ.],
  [0.6],
  loigiai: [
    #step[
      Gọi $X$ là biến cố "Tổng điểm sau 2 giai đoạn $>= 10$" (tức là có ít nhất 1 lần trúng hồng tâm) và $Y$ là biến cố "Tổng điểm là một số lẻ". Cần tính $P(Y | X) = (P(X inter Y)) / P(X)$.
      
      Phân tích 3 khả năng (KN) trong *mỗi giai đoạn bắn*:
      - *KN1:* $k in {1; 2; 3}$ $arrow$ Xác suất $1/2$, ghi nhận: $1$ điểm.
      - *KN2:* $k in {4; 5}$ $arrow$ Xác suất $1/3$, ghi nhận: $10$ điểm.
      - *KN3:* $k = 6$ $arrow$ Xác suất $1/6$, ghi nhận: $0$ điểm.
    ]
    
    #step[
      *Sơ đồ cây biểu diễn điểm số sau 2 giai đoạn:*
      #v(0.5em)
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          let edge-style = (mark: (end: ">", fill: black), stroke: 0.7pt)
          let lbl(txt) = box(fill: white, inset: 1pt, txt)
          
          let p1_1 = (3.5, 4.5); let p1_2 = (3.5, 0); let p1_3 = (3.5, -4.5)

          content((0, 0), box(stroke: 1pt + black, inset: 5pt, radius: 4pt)[Bắt đầu (0đ)], name: "N0")
          content(p1_1, align(center)[*KN1* \ (1đ)], name: "N1_1")
          content(p1_2, align(center)[*KN2* \ (10đ)], name: "N1_2")
          content(p1_3, align(center)[*KN3* \ (0đ)], name: "N1_3")

          line("N0", "N1_1", ..edge-style); content((1.75, 2.75), lbl[$1/2$])
          line("N0", "N1_2", ..edge-style); content((1.75, 0), lbl[$1/3$])
          line("N0", "N1_3", ..edge-style); content((1.75, -2.85), lbl[$1/6$])

          // Từ nhánh GĐ 1: KN1 (1đ)
          line("N1_1", (7.0, 6.0), ..edge-style); content((5.25, 5.6), lbl[$1/2$])
          content((7.2, 6.0), [*KN1* $arrow$ Tổng: 2đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_1", (7.0, 4.5), ..edge-style); content((5.25, 4.4), lbl[$1/3$])
          content((7.2, 4.5), [*KN2* $arrow$ Tổng: 11đ #h(2pt) #text(fill: blue, weight: "bold")[(Lẻ)]], anchor: "west") 
          line("N1_1", (7.0, 3.0), ..edge-style); content((5.25, 3.25), lbl[$1/6$])
          content((7.2, 3.0), [*KN3* $arrow$ Tổng: 1đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // Từ nhánh GĐ 1: KN2 (10đ)
          line("N1_2", (7.0, 1.5), ..edge-style); content((5.25, 0.8+.3), lbl[$1/2$])
          content((7.2, 1.5), [*KN1* $arrow$ Tổng: 11đ #h(2pt) #text(fill: blue, weight: "bold")[(Lẻ)]], anchor: "west")
          line("N1_2", (7.0, 0), ..edge-style); content((5.25, 0.1 -.2), lbl[$1/3$])
          content((7.2, 0), [*KN2* $arrow$ Tổng: 20đ #h(2pt) #text(fill: green)[(Chẵn)]], anchor: "west")
          line("N1_2", (7.0, -1.5), ..edge-style); content((5.25, -0.5 -.8), lbl[$1/6$])
          content((7.2, -1.5), [*KN3* $arrow$ Tổng: 10đ #h(2pt) #text(fill: green)[(Chẵn)]], anchor: "west")

          // Từ nhánh GĐ 1: KN3 (0đ)
          line("N1_3", (7.0, -3.0), ..edge-style); content((5.25, -3.7 +.3), lbl[$1/2$])
          content((7.2, -3.0), [*KN1* $arrow$ Tổng: 1đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_3", (7.0, -4.5), ..edge-style); content((5.25, -4.4 -.2), lbl[$1/3$])
          content((7.2, -4.5), [*KN2* $arrow$ Tổng: 10đ #h(2pt) #text(fill: green)[(Chẵn)]], anchor: "west")
          line("N1_3", (7.0, -6.0), ..edge-style); content((5.25, -5.1-.8), lbl[$1/6$])
          content((7.2, -6.0), [*KN3* $arrow$ Tổng: 0đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
        })
      ]
    ]

    #step[
      Từ sơ đồ, các nhánh thỏa mãn biến cố $X$ (tổng điểm $>= 10$) gồm các nhánh Xanh lá và Xanh dương:
      $ P(X) = (1/2 times 1/3) + (1/3 times 1/2) + (1/3 times 1/3) + (1/3 times 1/6) + (1/6 times 1/3) $
      $ P(X) = 1/6 + 1/6 + 1/9 + 1/18 + 1/18 = 6/36 + 6/36 + 4/36 + 2/36 + 2/36 = 20/36 $
      
      Trong số đó, những nhánh có tổng điểm là số lẻ (biến cố $X inter Y$) chỉ gồm 2 nhánh Xanh dương (đều ra $11$ điểm):
      $ P(X inter Y) = (1/2 times 1/3) + (1/3 times 1/2) = 1/6 + 1/6 = 12/36 $
    ]

    #step[
      Xác suất cần tìm dưới dạng số thập phân là:
      $ P(Y | X) = (P(X inter Y)) / P(X) = (12/36) / (20/36) = 12/20 = 0.6 $
    ]
  ]
)


#tln(
  [Ba học sinh $A$, $B$, và $C$ cùng tham gia một trò chơi tích điểm. Trò chơi gồm $2$ lượt. Trong mỗi lượt, người quản trò gieo một con xúc xắc cân đối. Gọi $k$ là số chấm xuất hiện. Nếu $k \le 3$ thì học sinh $A$ được cộng $2$ điểm; nếu $k in \{4; 5\}$ thì $A$ và $B$ mỗi người được cộng $1$ điểm; nếu $k = 6$ thì $B$ và $C$ mỗi người được cộng $1$ điểm. Ban đầu cả ba đều có $0$ điểm. Biết rằng sau $2$ lượt chơi, học sinh $A$ có đúng $2$ điểm. Tính xác suất để điểm của học sinh $B$ cao hơn điểm của học sinh $C$ (nhập kết quả dạng số thập phân).],
  [0.4],
  fig: canvas({
    import draw: *
    let lbl(txt) = box(fill: rgb("#eef6ed"), inset: 3pt, radius: 2pt, text(size: 8.5pt, txt))
    
    // Icon xúc xắc giả lập (vuông bo góc)
    rect((0,0), (1.2, 1.2), radius: 0.2, stroke: 1.2pt + palette.accent, fill: rgb("#e8f0fc"))
    content((0.6, 0.6), text(weight: "bold", fill: palette.accent)[Gieo])
    
    // Phân nhánh quy tắc
    line((1.3, 0.9), (2.5, 1.5), mark: (end: ">", fill: black), stroke: 0.8pt)
    content((2.6, 1.5), lbl[$ <= 3$ chấm: $+2A$], anchor: "west") 
    
    line((1.3, 0.6), (2.5, 0.6), mark: (end: ">", fill: black), stroke: 0.8pt)
    content((2.6, 0.6), lbl[$4,5$ chấm: $+1A, +1B$], anchor: "west")
    
    line((1.3, 0.3), (2.5, -0.3), mark: (end: ">", fill: black), stroke: 0.8pt)
    content((2.6, -0.3), lbl[$6$ chấm: $+1B, +1C$], anchor: "west")
  }),
  fig-width: 35%,
  loigiai: [
    #ppgiai(title: [Tư duy phá án (Xác suất có điều kiện)])[
      - *Biến cố $M$:* Sau $2$ lượt, điểm của $A$ bằng $2$.
      - *Biến cố $N$:* Điểm của $B$ lớn hơn điểm của $C$ ($B > C$).
      - Lập bảng quét mọi khả năng của phép thử $2$ lượt.
    ]

    #step[Phân tích 1 lượt chơi]
    - $X_1$ ($k in \{1, 2, 3\}$): $A$ được $2$ điểm. $P(X_1) = 3/6 = 1/2$.
    - $X_2$ ($k in \{4, 5\}$): $A$ được $1$, $B$ được $1$. $P(X_2) = 2/6 = 1/3$.
    - $X_3$ ($k = 6$): $B$ được $1$, $C$ được $1$. $P(X_3) = 1/6$.

    #step[Bảng phân tích trạng thái không gian mẫu sau 2 lượt]
    Điểm số được biểu diễn dưới dạng bộ số $(A, B, C)$:

    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        inset: (x: 8pt, y: 10pt), // <--- Thêm dòng này để tăng chiều cao hàng
        stroke: 0.5pt + palette.border,
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Lượt 1]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Lượt 2]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Xác suất ($p$)]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Điểm $(A, B, C)$]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Điều kiện $A=2$]],
        table.cell(fill: palette.accent)[#text(white, weight: "bold")[Mục tiêu $B > C$]],

        [$X_1$], [$X_1$], [$(1/2)^2 = 1/4$], [$(4, 0, 0)$], text(palette.wrong)[Loại ($A=4$)], [-],
        [$X_1$], [$X_2$], [$1/2 times 1/3 = 1/6$], [$(3, 1, 0)$], text(palette.wrong)[Loại ($A=3$)], [-],
        [$X_1$], [$X_3$], [$1/2 times 1/6 = 1/12$], [$(2, 1, 1)$], text(palette.correct)[Nhận], [Loại ($1=1$)],

        [$X_2$], [$X_1$], [$1/3 times 1/2 = 1/6$], [$(3, 1, 0)$], text(palette.wrong)[Loại ($A=3$)], [-],
        [$X_2$], [$X_2$], [$(1/3)^2 = 1/9$], [$(2, 2, 0)$], text(palette.correct)[Nhận], text(palette.correct)[Nhận],
        [$X_2$], [$X_3$], [$1/3 times 1/6 = 1/18$], [$(1, 2, 1)$], text(palette.wrong)[Loại ($A=1$)], [-],

        [$X_3$], [$X_1$], [$1/6 times 1/2 = 1/12$], [$(2, 1, 1)$], text(palette.correct)[Nhận], [Loại ($1=1$)],
        [$X_3$], [$X_2$], [$1/6 times 1/3 = 1/18$], [$(1, 2, 1)$], text(palette.wrong)[Loại ($A=1$)], [-],
        [$X_3$], [$X_3$], [$(1/6)^2 = 1/36$], [$(0, 2, 2)$], text(palette.wrong)[Loại ($A=0$)], [-]
      )
    ]

    #step[Tổng hợp hiện trường và tính xác suất]
    - Xác suất xảy ra biến cố $M$ (tổng cột Nhận của $M$):
      $ P(M) = 1/12 + 1/9 + 1/12 = 5/18 $
    - Xác suất xảy ra đồng thời $M$ và $N$:
      $ P(N cap M) = 1/9 $
    - Xác suất cần tìm:
      $ P(N|M) = (P(N cap M))/(P(M)) = (1/9) / (5/18) = 2/5 = 0.4 $
    #reset-step()
  ]
)

#import "@preview/cetz:0.5.2": canvas, draw

#tln(
  [Một nhân vật trong trò chơi bắt đầu với 1 Điểm kỹ năng. Người chơi có thể gieo xúc xắc cân đối để nâng cấp trong 2 giai đoạn. Ở mỗi giai đoạn: nếu số chấm $k in {1; 2}$ thì nâng cấp thành công (được cộng thêm 1 điểm); nếu $k in {3; 4; 5}$ thì nâng cấp hòa (không cộng không trừ điểm); nếu $k = 6$ thì nâng cấp thất bại (bị trừ đi 1 điểm). Biết rằng sau 2 giai đoạn, nhân vật có ít nhất 2 Điểm kỹ năng. Tính xác suất để nhân vật đạt được số Điểm kỹ năng tối đa (3 điểm).],
  [0.25],
  loigiai: [
    #step[
      Gọi $X$ là biến cố "Sau 2 giai đoạn, Điểm kỹ năng $>= 2$" và $Y$ là biến cố "Điểm kỹ năng đạt tối đa (3 điểm)". Ta tính $P(Y | X) = (P(X inter Y)) / P(X)$.
      
      Nhân vật bắt đầu với $1$ điểm. Phân tích 3 khả năng (KN) ở *mỗi giai đoạn*:
      - *KN1:* $k in {1; 2}$ $arrow$ Xác suất $1/3$, thay đổi điểm: $+1$.
      - *KN2:* $k in {3; 4; 5}$ $arrow$ Xác suất $1/2$, thay đổi điểm: $+0$.
      - *KN3:* $k = 6$ $arrow$ Xác suất $1/6$, thay đổi điểm: $-1$.
    ]
    
    #step[
      *Sơ đồ cây biểu diễn quá trình thay đổi điểm (Ban đầu: 1đ):*
      #v(0.5em)
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          let edge-style = (mark: (end: ">", fill: black), stroke: 0.7pt)
          let lbl(txt) = box(fill: white, inset: 1pt, txt)
          
          let p1_1 = (3.5, 4.5); let p1_2 = (3.5, 0); let p1_3 = (3.5, -4.5)

          content((0, 0), box(stroke: 1pt + black, inset: 5pt, radius: 4pt)[Có 1 điểm], name: "N0")
          content(p1_1, align(center)[*KN1* \ ($+1$)], name: "N1_1")
          content(p1_2, align(center)[*KN2* \ ($+0$)], name: "N1_2")
          content(p1_3, align(center)[*KN3* \ ($-1$)], name: "N1_3")

          line("N0", "N1_1", ..edge-style); content((1.75, 2.75), lbl[$1/3$])
          line("N0", "N1_2", ..edge-style); content((1.75, 0), lbl[$1/2$])
          line("N0", "N1_3", ..edge-style); content((1.75, -2.85), lbl[$1/6$])

          // Từ nhánh GĐ 1: KN1 (Đang có 2 điểm)
          line("N1_1", (7.0, 6.0), ..edge-style); content((5.25, 5.6), lbl[$1/3$])
          content((7.2, 6.0), [*KN1* $arrow$ Cuối: 3đ #h(2pt) #text(fill: blue, weight: "bold")[($=3$đ)]], anchor: "west")
          line("N1_1", (7.0, 4.5), ..edge-style); content((5.25, 4.4), lbl[$1/2$])
          content((7.2, 4.5), [*KN2* $arrow$ Cuối: 2đ #h(2pt) #text(fill: green)[($>=2$đ)]], anchor: "west") 
          line("N1_1", (7.0, 3.0), ..edge-style); content((5.25, 3.25), lbl[$1/6$])
          content((7.2, 3.0), [*KN3* $arrow$ Cuối: 1đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // Từ nhánh GĐ 1: KN2 (Đang có 1 điểm)
          line("N1_2", (7.0, 1.5), ..edge-style); content((5.25, 0.8+.3), lbl[$1/3$])
          content((7.2, 1.5), [*KN1* $arrow$ Cuối: 2đ #h(2pt) #text(fill: green)[($>=2$đ)]], anchor: "west")
          line("N1_2", (7.0, 0), ..edge-style); content((5.25, 0.1 -.2), lbl[$1/2$])
          content((7.2, 0), [*KN2* $arrow$ Cuối: 1đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_2", (7.0, -1.5), ..edge-style); content((5.25, -0.5 -.8), lbl[$1/6$])
          content((7.2, -1.5), [*KN3* $arrow$ Cuối: 0đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // Từ nhánh GĐ 1: KN3 (Đang có 0 điểm)
          line("N1_3", (7.0, -3.0), ..edge-style); content((5.25, -3.7 +.3), lbl[$1/3$])
          content((7.2, -3.0), [*KN1* $arrow$ Cuối: 1đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_3", (7.0, -4.5), ..edge-style); content((5.25, -4.4 -.2), lbl[$1/2$])
          content((7.2, -4.5), [*KN2* $arrow$ Cuối: 0đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_3", (7.0, -6.0), ..edge-style); content((5.25, -5.1-.8), lbl[$1/6$])
          content((7.2, -6.0), [*KN3* $arrow$ Cuối: -1đ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
        })
      ]
    ]

    #step[
      Các nhánh thỏa mãn biến cố $X$ (tổng điểm $>= 2$) gồm nhánh Xanh lá và Xanh dương:
      $ P(X) = (1/3 times 1/3) + (1/3 times 1/2) + (1/2 times 1/3) = 1/9 + 1/6 + 1/6 = 4/36 + 6/36 + 6/36 = 16/36 $
      
      Trong 3 nhánh trên, chỉ có duy nhất nhánh đạt tối đa 3 điểm (biến cố $X inter Y$, màu xanh dương):
      $ P(X inter Y) = 1/3 times 1/3 = 1/9 = 4/36 $
    ]

    #step[
      Xác suất cần tìm dưới dạng số thập phân là:
      $ P(Y | X) = (P(X inter Y)) / P(X) = (4/36) / (16/36) = 4/16 = 1/4 = 0.25 $
    ]
  ]
)
#import "@preview/cetz:0.5.2": canvas, draw

#tln(
  [Một học sinh tham gia một trò chơi trực tuyến. Ở mỗi lượt, hệ thống sẽ gieo ngẫu nhiên một con xúc xắc cân đối và đồng chất để tặng "Sao" tích lũy. Quy tắc như sau: nếu số chấm xuất hiện $k in {1; 2; 3}$ thì được tặng 1 Sao; nếu $k in {4; 5}$ thì được tặng 2 Sao; nếu $k = 6$ thì được tặng 3 Sao. Học sinh này được chơi đúng 2 lượt. Biết rằng sau 2 lượt chơi, học sinh đó tích lũy được *chính xác 4 Sao*. Tính xác suất để học sinh đó nhận được số Sao *bằng nhau* ở cả 2 lượt chơi.],
  [0.4],
  loigiai: [
    #step[
      Gọi $X$ là biến cố "Sau 2 lượt chơi, tổng số Sao tích lũy là $4$" và $Y$ là biến cố "Số Sao nhận được ở 2 lượt chơi là bằng nhau". Ta cần tính $P(Y | X) = (P(X inter Y)) / P(X)$.
      
      Phân tích 3 khả năng (KN) trong *mỗi lượt chơi*:
      - *KN1:* $k in {1; 2; 3}$ $arrow$ Xác suất $1/2$, nhận: $1$ Sao.
      - *KN2:* $k in {4; 5}$ $arrow$ Xác suất $1/3$, nhận: $2$ Sao.
      - *KN3:* $k = 6$ $arrow$ Xác suất $1/6$, nhận: $3$ Sao.
    ]
    
    #step[
      *Sơ đồ cây biểu diễn tổng số Sao sau 2 lượt chơi:*
      #v(0.5em)
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          let edge-style = (mark: (end: ">", fill: black), stroke: 0.7pt)
          let lbl(txt) = box(fill: white, inset: 1pt, txt)
          
          let p1_1 = (3.5, 4.5); let p1_2 = (3.5, 0); let p1_3 = (3.5, -4.5)

          content((0, 0), box(stroke: 1pt + black, inset: 5pt, radius: 4pt)[Bắt đầu (0 Sao)], name: "N0")
          content(p1_1, align(center)[*KN1* \ (1 Sao)], name: "N1_1")
          content(p1_2, align(center)[*KN2* \ (2 Sao)], name: "N1_2")
          content(p1_3, align(center)[*KN3* \ (3 Sao)], name: "N1_3")

          line("N0", "N1_1", ..edge-style); content((1.75, 2.75), lbl[$1/2$])
          line("N0", "N1_2", ..edge-style); content((1.75, 0), lbl[$1/3$])
          line("N0", "N1_3", ..edge-style); content((1.75, -2.85), lbl[$1/6$])

          // Từ KN1 (Đang có 1 Sao)
          line("N1_1", (7.0, 6.0), ..edge-style); content((5.25, 5.6), lbl[$1/2$])
          content((7.2, 6.0), [*KN1* $arrow$ Tổng: 2 Sao #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_1", (7.0, 4.5), ..edge-style); content((5.25, 4.4), lbl[$1/3$])
          content((7.2, 4.5), [*KN2* $arrow$ Tổng: 3 Sao #h(2pt) #text(fill: red)[(Loại)]], anchor: "west") 
          line("N1_1", (7.0, 3.0), ..edge-style); content((5.25, 3.25), lbl[$1/6$])
          content((7.2, 3.0), [*KN3* $arrow$ Tổng: 4 Sao #h(2pt) #text(fill: green)[(Nhận)]], anchor: "west")

          // Từ KN2 (Đang có 2 Sao)
          line("N1_2", (7.0, 1.5), ..edge-style); content((5.25, 0.8+.3), lbl[$1/2$])
          content((7.2, 1.5), [*KN1* $arrow$ Tổng: 3 Sao #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_2", (7.0, 0), ..edge-style); content((5.25, 0.1 -.2), lbl[$1/3$])
          content((7.2, 0), [*KN2* $arrow$ Tổng: 4 Sao #h(2pt) #text(fill: blue, weight: "bold")[(Nhận, 2 lượt bằng nhau)]], anchor: "west")
          line("N1_2", (7.0, -1.5), ..edge-style); content((5.25, -0.5 -.8), lbl[$1/6$])
          content((7.2, -1.5), [*KN3* $arrow$ Tổng: 5 Sao #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // Từ KN3 (Đang có 3 Sao)
          line("N1_3", (7.0, -3.0), ..edge-style); content((5.25, -3.7 +.3), lbl[$1/2$])
          content((7.2, -3.0), [*KN1* $arrow$ Tổng: 4 Sao #h(2pt) #text(fill: green)[(Nhận)]], anchor: "west")
          line("N1_3", (7.0, -4.5), ..edge-style); content((5.25, -4.4 -.2), lbl[$1/3$])
          content((7.2, -4.5), [*KN2* $arrow$ Tổng: 5 Sao #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_3", (7.0, -6.0), ..edge-style); content((5.25, -5.1-.8), lbl[$1/6$])
          content((7.2, -6.0), [*KN3* $arrow$ Tổng: 6 Sao #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
        })
      ]
    ]

    #step[
      Từ sơ đồ, các nhánh thỏa mãn biến cố $X$ (tổng đúng 4 Sao) gồm 2 nhánh màu Xanh lá và 1 nhánh màu Xanh dương:
      $ P(X) = (1/2 times 1/6) + (1/3 times 1/3) + (1/6 times 1/2) $
      $ P(X) = 1/12 + 1/9 + 1/12 = 3/36 + 4/36 + 3/36 = 10/36 $
      
      Trong 3 nhánh đó, chỉ có nhánh nhận (2 Sao) ở cả 2 lượt chơi (màu Xanh dương) là thỏa mãn biến cố $X inter Y$:
      $ P(X inter Y) = 1/3 times 1/3 = 1/9 = 4/36 $
    ]

    #step[
      Xác suất cần tìm dưới dạng số thập phân là:
      $ P(Y | X) = (P(X inter Y)) / P(X) = (4/36) / (10/36) = 4/10 = 0.4 $
    ]
  ]
)

#tln(
  [Trong một tựa game thẻ tướng (Gacha), người chơi được tặng $2$ lượt quay miễn phí. Ở mỗi lượt quay, hệ thống gieo ngầm một con xúc xắc cân đối để quyết định phần thưởng. Gọi $k$ là số chấm xuất hiện. Nếu $k <= 2$, người chơi nhận $2$ Vé Vàng và $1$ Vé Bạc; nếu $k in {3, 4}$, nhận $1$ Vé Vàng và $2$ Vé Bạc; nếu $k in {5, 6}$, hệ thống báo xui xẻo, chỉ nhận $1$ Vé Bạc (không có Vé Vàng). Biết rằng sau $2$ lượt quay, người chơi thu thập được đúng $2$ Vé Vàng. Tính xác suất để số Vé Bạc họ thu được nhiều hơn số Vé Vàng (nhập kết quả dạng số thập phân làm tròn đến $4$ chữ số).],
  [0.3333],
  fig: canvas({
    import draw: *
    let box-lbl(txt) = box(fill: white, inset: 2pt, text(size: 8.5pt, txt))
    
    // Nút Gacha
    rect((0,0), (1.5, 0.8), radius: 0.2, fill: palette.accent, stroke: none)
    content((0.75, 0.4), text(weight: "bold", fill: white)[Quay Gacha])
    
    // Các đường phân nhánh
    line((1.6, 0.6), (2.8, 1.4), mark: (end: ">"), stroke: 0.8pt)
    content((3.0, 1.4), box-lbl[$2$ Vàng, $1$ Bạc], anchor: "west")
    content((1.8, 1.2), box-lbl[$k <= 2$])
    
    line((1.6, 0.4), (2.8, 0.4), mark: (end: ">"), stroke: 0.8pt)
    content((3.0, 0.4), box-lbl[$1$ Vàng, $2$ Bạc], anchor: "west")
    content((2.2, 0.65), box-lbl[$k in {3, 4}$])
    
    line((1.6, 0.2), (2.8, -0.6), mark: (end: ">"), stroke: 0.8pt)
    content((3.0, -0.6), box-lbl[$0$ Vàng, $1$ Bạc], anchor: "west")
    content((1.8, -0.4), box-lbl[$k in {5, 6}$])
  }),
  fig-width: 35%,
  loigiai: [
    #ppgiai(title: [Tư duy phá án (Đếm tài nguyên)])[
      - Biến cố $M$: Tổng số Vé Vàng sau $2$ lượt quay đúng bằng $2$.
      - Biến cố $N$: Số Vé Bạc lớn hơn số Vé Vàng (Bạc $> 2$).
      - Lập bảng $3 times 3$ để quét toàn bộ lộ trình ra thẻ.
    ]

    #step[Phân tích 1 lượt quay]
    - $X_1$ ($k <= 2$): Nhận $(2V, 1B)$. Xác suất $P(X_1) = 2/6 = 1/3$.
    - $X_2$ ($k in {3, 4}$): Nhận $(1V, 2B)$. Xác suất $P(X_2) = 2/6 = 1/3$.
    - $X_3$ ($k in {5, 6}$): Nhận $(0V, 1B)$. Xác suất $P(X_3) = 2/6 = 1/3$.

    #step[Bảng lưới phân phối tài nguyên sau 2 lượt]
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        inset: (x: 8pt, y: 10pt),
        stroke: 0.5pt + palette.border,
        table.cell(fill: palette.accent)[#text(fill: white, weight: "bold")[Lượt 1]],
        table.cell(fill: palette.accent)[#text(fill: white, weight: "bold")[Lượt 2]],
        table.cell(fill: palette.accent)[#text(fill: white, weight: "bold")[Xác suất ($p$)]],
        table.cell(fill: palette.accent)[#text(fill: white, weight: "bold")[Kho đồ $(V, B)$]],
        table.cell(fill: palette.accent)[#text(fill: white, weight: "bold")[Điều kiện $M$ ($V=2$)]],
        table.cell(fill: palette.accent)[#text(fill: white, weight: "bold")[Mục tiêu $N$ ($B > V$)]],

        [$X_1$], [$X_1$], [$(1/3)^2 = 1/9$], [$(4V, 2B)$], text(fill: palette.wrong)[Loại], [-],
        [$X_1$], [$X_2$], [$1/3 times 1/3 = 1/9$], [$(3V, 3B)$], text(fill: palette.wrong)[Loại], [-],
        [$X_1$], [$X_3$], [$1/3 times 1/3 = 1/9$], [$(2V, 2B)$], text(fill: palette.correct)[Nhận], text(fill: palette.wrong)[Loại ($2=2$)],

        [$X_2$], [$X_1$], [$1/3 times 1/3 = 1/9$], [$(3V, 3B)$], text(fill: palette.wrong)[Loại], [-],
        [$X_2$], [$X_2$], [$(1/3)^2 = 1/9$], [$(2V, 4B)$], text(fill: palette.correct)[Nhận], text(fill: palette.correct)[Nhận ($4>2$)],
        [$X_2$], [$X_3$], [$1/3 times 1/3 = 1/9$], [$(1V, 3B)$], text(fill: palette.wrong)[Loại], [-],

        [$X_3$], [$X_1$], [$1/3 times 1/3 = 1/9$], [$(2V, 2B)$], text(fill: palette.correct)[Nhận], text(fill: palette.wrong)[Loại ($2=2$)],
        [$X_3$], [$X_2$], [$1/3 times 1/3 = 1/9$], [$(1V, 3B)$], text(fill: palette.wrong)[Loại], [-],
        [$X_3$], [$X_3$], [$(1/3)^2 = 1/9$], [$(0V, 2B)$], text(fill: palette.wrong)[Loại], [-]
      )
    ]

    #step[Tính toán Bayes]
    - Xác suất rơi vào "hiện trường" $M$ (có đúng $2$ Vé Vàng):
      $ P(M) = 1/9 + 1/9 + 1/9 = 3/9 = 1/3 $
    - Xác suất thỏa mãn cả $M$ và $N$ (chỉ có duy nhất ô $X_2, X_2$):
      $ P(N inter M) = 1/9 $
    - Vậy xác suất cần tìm là:
      $ P(N|M) = (P(N inter M))/(P(M)) = (1/9) / (1/3) = 1/3 approx 0.3333 $
    #reset-step()
  ]
)

#tln(
  [Trong một giải đấu Esport "Đấu trường sinh tồn", một tuyển thủ tham gia $2$ trận đấu phân hạng. Ở mỗi trận, vị trí nhảy dù quyết định kịch bản điểm số tích lũy từ lượng hạ gục dựa trên việc gieo một con xúc xắc cân đối. Gọi $k$ là số chấm xuất hiện. Nếu $k <= 2$ (Vòng hiểm họa), tuyển thủ nhận $+3$ điểm; nếu $3 <= k <= 5$ (Vòng an toàn), nhận $+1$ điểm; nếu $k = 6$ (Bị gank sớm), nhận $0$ điểm. Biết rằng sau $2$ trận đấu, tổng số điểm tích lũy của tuyển thủ là một số lẻ. Tính xác suất để tuyển thủ đó có ít nhất một trận bị gank sớm và nhận $0$ điểm.],
  [1],
  fig: canvas({
    import draw: *
    let box-lbl(txt) = box(fill: white, inset: 2pt, text(size: 8.5pt, txt))
    
    // Gốc đổ bộ
    circle((0,0), radius: 0.5, fill: rgb("#eff6ff"), stroke: 1pt + rgb("#1d4ed8"))
    content((0,0), text(weight: "bold", fill: rgb("#1d4ed8"))[Nhảy])
    
    // Các hướng kịch bản
    line((0.45, 0), (2.2, 1.2), mark: (end: ">"), stroke: 0.8pt)
    content((2.4, 1.2), box-lbl[$+3$ điểm], anchor: "west")
    content((1.2, 0.9), box-lbl[$k <= 2$])
    
    line((0.45, 0), (2.2, 0), mark: (end: ">"), stroke: 0.8pt)
    content((2.4, 0), box-lbl[$+1$ điểm], anchor: "west")
    content((1.5, 0.25), box-lbl[$3 <= k <= 5$])
    
    line((0.45, 0), (2.2, -1.2), mark: (end: ">"), stroke: 0.8pt)
    content((2.4, -1.2), box-lbl[$0$ điểm], anchor: "west")
    content((1.2, -0.9), box-lbl[$k = 6$])
  }),
  fig-pos: "center",
  fig-width: 45%,
  loigiai: [
    #ppgiai(title: [Tư duy phá án (Phân tích tính chất chẵn lẻ)])[
      - Biến cố $M$: Tổng số điểm sau $2$ trận là một số lẻ.
      - Biến cố $N$: Có ít nhất $1$ trận nhận $0$ điểm.
      - Điểm số nhận được ở mỗi trận có tính chất: $+3$ (lẻ), $+1$ (lẻ), $0$ (chẵn).
    ]

    #step[Phân tích xác suất từng kịch bản trận đấu]
    - $X_1$ (Vòng hiểm họa): Được $3$ điểm. Xác suất $P(X_1) = 2/6 = 1/3$.
    - $X_2$ (Vòng an toàn): Được $1$ điểm. Xác suất $P(X_2) = 3/6 = 1/2$.
    - $X_3$ (Bị gank sớm): Được $0$ điểm. Xác suất $P(X_3) = 1/6$.

    #step[Bảng lưới phân tích tổng điểm sau 2 trận]
    Sử dụng lệnh sửa lỗi hiển thị màu toán hiển thị cho các tiêu đề bảng:

    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        inset: (x: 8pt, y: 10pt),
        stroke: 0.5pt + palette.border,
        table.cell(fill: palette.accent)[#set text(fill: white); #show math.equation: set text(fill: white); #text(weight: "bold")[Trận 1]],
        table.cell(fill: palette.accent)[#set text(fill: white); #show math.equation: set text(fill: white); #text(weight: "bold")[Trận 2]],
        table.cell(fill: palette.accent)[#set text(fill: white); #show math.equation: set text(fill: white); #text(weight: "bold")[Xác suất ($p$)]],
        table.cell(fill: palette.accent)[#set text(fill: white); #show math.equation: set text(fill: white); #text(weight: "bold")[Tổng điểm]],
        table.cell(fill: palette.accent)[#set text(fill: white); #show math.equation: set text(fill: white); #text(weight: "bold")[Điều kiện $M$ (Lẻ)]],
        table.cell(fill: palette.accent)[#set text(fill: white); #show math.equation: set text(fill: white); #text(weight: "bold")[Mục tiêu $N$ (Có $0$)]],

        [$X_1$], [$X_1$], [$(1/3)^2 = 1/9$], [$6$], text(fill: palette.wrong)[Loại (Chẵn)], [-],
        [$X_1$], [$X_2$], [$1/3 times 1/2 = 1/6$], [$4$], text(fill: palette.wrong)[Loại (Chẵn)], [-],
        [$X_1$], [$X_3$], [$1/3 times 1/6 = 1/18$], [$3$], text(fill: palette.correct)[Nhận], text(fill: palette.correct)[Nhận],

        [$X_2$], [$X_1$], [$1/2 times 1/3 = 1/6$], [$4$], text(fill: palette.wrong)[Loại (Chẵn)], [-],
        [$X_2$], [$X_2$], [$(1/2)^2 = 1/4$], [$2$], text(fill: palette.wrong)[Loại (Chẵn)], [-],
        [$X_2$], [$X_3$], [$1/2 times 1/6 = 1/12$], [$1$], text(fill: palette.correct)[Nhận], text(fill: palette.correct)[Nhận],

        [$X_3$], [$X_1$], [$1/6 times 1/3 = 1/18$], [$3$], text(fill: palette.correct)[Nhận], text(fill: palette.correct)[Nhận],
        [$X_3$], [$X_2$], [$1/6 times 1/2 = 1/12$], [$1$], text(fill: palette.correct)[Nhận], text(fill: palette.correct)[Nhận],
        [$X_3$], [$X_3$], [$(1/6)^2 = 1/36$], [$0$], text(fill: palette.wrong)[Loại (Chẵn)], [-]
      )
    ]

    #step[Khám phá bất ngờ từ hiện trường và kết luận]
    - Để tổng điểm của $2$ trận là một số lẻ, tuyển thủ bắt buộc phải có một trận điểm lẻ ($+3$ hoặc $+1$) và một trận điểm chẵn ($0$ điểm). Do đó, tất cả các trường hợp thỏa mãn điều kiện $M$ đều bắt buộc phải chứa trận đấu bị gank sớm ($X_3$).
    - Xác suất tổng điểm lẻ thu được là:
      $ P(M) = 1/18 + 1/12 + 1/18 + 1/12 = 2/18 + 2/12 = 1/9 + 1/6 = 5/18 $
    - Xác suất để vừa có tổng điểm lẻ vừa có trận bị gank sớm chính bằng toàn bộ không gian vùng điều kiện:
      $ P(N inter M) = 1/18 + 1/12 + 1/18 + 1/12 = 5/18 $
    - Áp dụng công thức tính xác suất có điều kiện:
      $ P(N|M) = (P(N inter M))/(P(M)) = (5/18) / (5/18) = 1 $
    - Kết quả điền phiếu trắc nghiệm: $1$.
    #reset-step()
  ]
)

#import "@preview/cetz:0.5.2": canvas, draw

#tln(
  [Có 3 chiếc hộp trống được ký hiệu là $A$, $B$ và $C$. Gieo một con xúc xắc cân đối và đồng chất, gọi $k$ là số chấm xuất hiện. Quy tắc thêm bóng vào hộp ở mỗi lần gieo như sau: nếu $k in {1; 2; 3}$ thì cho 2 quả bóng vào hộp $A$; nếu $k in {4; 5}$ thì cho 1 quả bóng vào hộp $A$ và 1 quả bóng vào hộp $B$; nếu $k = 6$ thì cho 2 quả bóng vào hộp $C$. Thực hiện lặp lại phép thử trên 2 lần. Biết rằng sau 2 lần gieo, số bóng trong hộp $A$ là một **số chẵn**. Tính xác suất để hộp $A$ có **chính xác 2 quả bóng**.],
  [0.5],
  loigiai: [
    #step[
      Gọi $X$ là biến cố "Sau 2 lần gieo, số bóng ở hộp $A$ là số chẵn ($0, 2, 4$)" và $Y$ là biến cố "Hộp $A$ có chính xác 2 quả bóng". Ta cần tính $P(Y | X) = (P(X inter Y)) / P(X)$.
      
      Vì câu hỏi chỉ quan tâm đến hộp $A$, ta tóm tắt sự thay đổi của hộp $A$ trong *mỗi lần gieo*:
      - *KN1:* $k in {1; 2; 3}$ $arrow$ Xác suất $1/2$, hộp A nhận: $+2$ bóng.
      - *KN2:* $k in {4; 5}$ $arrow$ Xác suất $1/3$, hộp A nhận: $+1$ bóng.
      - *KN3:* $k = 6$ $arrow$ Xác suất $1/6$, hộp A nhận: $+0$ bóng.
    ]
    
    #step[
      *Sơ đồ cây biểu diễn số bóng của hộp $A$ sau 2 lần gieo:*
      #v(0.5em)
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          let edge-style = (mark: (end: ">", fill: black), stroke: 0.7pt)
          let lbl(txt) = box(fill: white, inset: 1pt, txt)
          
          let p1_1 = (3.5, 4.5); let p1_2 = (3.5, 0); let p1_3 = (3.5, -4.5)

          content((0, 0), box(stroke: 1pt + black, inset: 5pt, radius: 4pt)[Hộp A (0)], name: "N0")
          content(p1_1, align(center)[*KN1* \ ($+2$)], name: "N1_1")
          content(p1_2, align(center)[*KN2* \ ($+1$)], name: "N1_2")
          content(p1_3, align(center)[*KN3* \ ($+0$)], name: "N1_3")

          line("N0", "N1_1", ..edge-style); content((1.75, 2.75), lbl[$1/2$])
          line("N0", "N1_2", ..edge-style); content((1.75, 0), lbl[$1/3$])
          line("N0", "N1_3", ..edge-style); content((1.75, -2.85), lbl[$1/6$])

          // Từ KN1 (Đang có 2 bóng)
          line("N1_1", (7.0, 6.0), ..edge-style); content((5.25, 5.6), lbl[$1/2$])
          content((7.2, 6.0), [*KN1* $arrow$ A có: 4 #h(2pt) #text(fill: green)[(Chẵn)]], anchor: "west")
          line("N1_1", (7.0, 4.5), ..edge-style); content((5.25, 4.4), lbl[$1/3$])
          content((7.2, 4.5), [*KN2* $arrow$ A có: 3 #h(2pt) #text(fill: red)[(Loại)]], anchor: "west") 
          line("N1_1", (7.0, 3.0), ..edge-style); content((5.25, 3.25), lbl[$1/6$])
          content((7.2, 3.0), [*KN3* $arrow$ A có: 2 #h(2pt) #text(fill: blue, weight: "bold")[($A=2$)]], anchor: "west")

          // Từ KN2 (Đang có 1 bóng)
          line("N1_2", (7.0, 1.5), ..edge-style); content((5.25, 0.8+.3), lbl[$1/2$])
          content((7.2, 1.5), [*KN1* $arrow$ A có: 3 #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_2", (7.0, 0), ..edge-style); content((5.25, 0.1 -.2), lbl[$1/3$])
          content((7.2, 0), [*KN2* $arrow$ A có: 2 #h(2pt) #text(fill: blue, weight: "bold")[($A=2$)]], anchor: "west")
          line("N1_2", (7.0, -1.5), ..edge-style); content((5.25, -0.5 -.8), lbl[$1/6$])
          content((7.2, -1.5), [*KN3* $arrow$ A có: 1 #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // Từ KN3 (Đang có 0 bóng)
          line("N1_3", (7.0, -3.0), ..edge-style); content((5.25, -3.7 +.3), lbl[$1/2$])
          content((7.2, -3.0), [*KN1* $arrow$ A có: 2 #h(2pt) #text(fill: blue, weight: "bold")[($A=2$)]], anchor: "west")
          line("N1_3", (7.0, -4.5), ..edge-style); content((5.25, -4.4 -.2), lbl[$1/3$])
          content((7.2, -4.5), [*KN2* $arrow$ A có: 1 #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_3", (7.0, -6.0), ..edge-style); content((5.25, -5.1-.8), lbl[$1/6$])
          content((7.2, -6.0), [*KN3* $arrow$ A có: 0 #h(2pt) #text(fill: green)[(Chẵn)]], anchor: "west")
        })
      ]
    ]

    #step[
      Dựa vào sơ đồ, các nhánh thỏa mãn biến cố $X$ (Hộp A có số bóng chẵn) gồm Xanh lá ($0, 4$) và Xanh dương ($2$):
      $ P(X) = (1/2 times 1/2) + (1/2 times 1/6) + (1/3 times 1/3) + (1/6 times 1/2) + (1/6 times 1/6) $
      $ P(X) = 1/4 + 1/12 + 1/9 + 1/12 + 1/36 = 9/36 + 3/36 + 4/36 + 3/36 + 1/36 = 20/36 $
      
      Trong số đó, những nhánh thỏa mãn hộp A có đúng 2 bóng (biến cố $X inter Y$, màu xanh dương) là:
      $ P(X inter Y) = (1/2 times 1/6) + (1/3 times 1/3) + (1/6 times 1/2) = 1/12 + 1/9 + 1/12 = 10/36 $
    ]

    #step[
      Xác suất cần tìm dưới dạng số thập phân là:
      $ P(Y | X) = (P(X inter Y)) / P(X) = (10/36) / (20/36) = 10/20 = 0.5 $
    ]
  ]
)
#import "@preview/cetz:0.5.2": canvas, draw

#tln(
  [Một Robot xuất phát tại gốc tọa độ $O(0)$ trên trục số $O x$. Ở mỗi bước, hệ thống gieo một con xúc xắc cân đối để xác định hướng đi: nếu số chấm $k in {1; 2}$ Robot tiến tới 1 đơn vị (cộng 1 vào tọa độ); nếu $k in {3; 4}$ Robot lùi lại 1 đơn vị (trừ 1 vào tọa độ); nếu $k in {5; 6}$ Robot đứng im. Robot thực hiện 2 bước di chuyển liên tiếp. Biết rằng sau 2 bước, tọa độ của Robot là một **số chẵn** (bao gồm cả số 0). Tính xác suất để Robot quay trở lại **đúng gốc tọa độ $O$**.],
  [0.6],
  loigiai: [
    #step[
      Gọi $X$ là biến cố "Sau 2 bước, tọa độ Robot là số chẵn ($... , -2, 0, 2, ...$)" và $Y$ là biến cố "Tọa độ Robot bằng $0$". Cần tính $P(Y | X) = (P(X inter Y)) / P(X)$.
      
      Vì 6 mặt chia đều cho 3 hành động, xác suất *mỗi bước* đều là $1/3$:
      - *KN1:* Tiến $+1$ (Xác suất $1/3$).
      - *KN2:* Lùi $-1$ (Xác suất $1/3$).
      - *KN3:* Đứng im $+0$ (Xác suất $1/3$).
    ]
    
    #step[
      *Sơ đồ cây biểu diễn tọa độ Robot sau 2 bước:*
      #v(0.5em)
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          let edge-style = (mark: (end: ">", fill: black), stroke: 0.7pt)
          let lbl(txt) = box(fill: white, inset: 1pt, txt)
          
          let p1_1 = (3.5, 4.5); let p1_2 = (3.5, 0); let p1_3 = (3.5, -4.5)

          content((0, 0), box(stroke: 1pt + black, inset: 5pt, radius: 4pt)[Vị trí (0)], name: "N0")
          content(p1_1, align(center)[*KN1* \ ($+1$)], name: "N1_1")
          content(p1_2, align(center)[*KN2* \ ($-1$)], name: "N1_2")
          content(p1_3, align(center)[*KN3* \ ($+0$)], name: "N1_3")

          line("N0", "N1_1", ..edge-style); content((1.75, 2.75), lbl[$1/3$])
          line("N0", "N1_2", ..edge-style); content((1.75, 0), lbl[$1/3$])
          line("N0", "N1_3", ..edge-style); content((1.75, -2.85), lbl[$1/3$])

          // Từ KN1 (Đang ở +1)
          line("N1_1", (7.0, 6.0), ..edge-style); content((5.25, 5.6), lbl[$1/3$])
          content((7.2, 6.0), [*KN1* $arrow$ Cuối: $+2$ #h(2pt) #text(fill: green)[(Chẵn)]], anchor: "west")
          line("N1_1", (7.0, 4.5), ..edge-style); content((5.25, 4.4), lbl[$1/3$])
          content((7.2, 4.5), [*KN2* $arrow$ Cuối: $0$ #h(2pt) #text(fill: blue, weight: "bold")[(=0)]], anchor: "west") 
          line("N1_1", (7.0, 3.0), ..edge-style); content((5.25, 3.25), lbl[$1/3$])
          content((7.2, 3.0), [*KN3* $arrow$ Cuối: $+1$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // Từ KN2 (Đang ở -1)
          line("N1_2", (7.0, 1.5), ..edge-style); content((5.25, 0.8+.3), lbl[$1/3$])
          content((7.2, 1.5), [*KN1* $arrow$ Cuối: $0$ #h(2pt) #text(fill: blue, weight: "bold")[(=0)]], anchor: "west")
          line("N1_2", (7.0, 0), ..edge-style); content((5.25, 0.1 -.2), lbl[$1/3$])
          content((7.2, 0), [*KN2* $arrow$ Cuối: $-2$ #h(2pt) #text(fill: green)[(Chẵn)]], anchor: "west")
          line("N1_2", (7.0, -1.5), ..edge-style); content((5.25, -0.5 -.8), lbl[$1/3$])
          content((7.2, -1.5), [*KN3* $arrow$ Cuối: $-1$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // Từ KN3 (Đang ở 0)
          line("N1_3", (7.0, -3.0), ..edge-style); content((5.25, -3.7 +.3), lbl[$1/3$])
          content((7.2, -3.0), [*KN1* $arrow$ Cuối: $+1$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_3", (7.0, -4.5), ..edge-style); content((5.25, -4.4 -.2), lbl[$1/3$])
          content((7.2, -4.5), [*KN2* $arrow$ Cuối: $-1$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_3", (7.0, -6.0), ..edge-style); content((5.25, -5.1-.8), lbl[$1/3$])
          content((7.2, -6.0), [*KN3* $arrow$ Cuối: $0$ #h(2pt) #text(fill: blue, weight: "bold")[(=0)]], anchor: "west")
        })
      ]
    ]

    #step[
      Tất cả 9 nhánh đều có xác suất bằng nhau là $1/3 times 1/3 = 1/9$.
      
      Số nhánh thỏa mãn biến cố $X$ (tọa độ chẵn) gồm 2 nhánh Xanh lá ($+2, -2$) và 3 nhánh Xanh dương ($0$):
      $ P(X) = 5 times 1/9 = 5/9 $
      
      Trong 5 nhánh đó, số nhánh nằm ngay tại $0$ (biến cố $X inter Y$, màu xanh dương) là 3 nhánh:
      $ P(X inter Y) = 3 times 1/9 = 3/9 $
    ]

    #step[
      Xác suất cần tìm dưới dạng số thập phân là:
      $ P(Y | X) = (P(X inter Y)) / P(X) = (3/9) / (5/9) = 3/5 = 0.6 $
    ]
  ]
)


#import "@preview/cetz:0.5.2": canvas, draw

#tln(
  [Một hệ thống bảo mật tạo mã PIN gồm 2 chữ số. Để tạo mỗi chữ số, hệ thống sẽ gieo một con xúc xắc cân đối bên trong: nếu số chấm $k in {1; 2; 3}$ thì chữ số tạo ra là $1$; nếu $k in {4; 5}$ thì chữ số tạo ra là $2$; nếu $k = 6$ thì chữ số tạo ra là $3$. Biết rằng sau khi tạo xong mã PIN 2 chữ số, **tổng của hai chữ số đó là một số chẵn**. Tính xác suất để mã PIN vừa tạo có **hai chữ số giống hệt nhau** (ví dụ: $11, 22, 33$).],
  [0.7],
  loigiai: [
    #step[
      Gọi $X$ là biến cố "Tổng của 2 chữ số tạo ra là số chẵn" và $Y$ là biến cố "Hai chữ số giống hệt nhau". Cần tính $P(Y | X) = (P(X inter Y)) / P(X)$.
      
      Phân tích 3 khả năng (KN) tạo *mỗi chữ số*:
      - *KN1:* Số $1$ $arrow$ Xác suất $3/6 = 1/2$.
      - *KN2:* Số $2$ $arrow$ Xác suất $2/6 = 1/3$.
      - *KN3:* Số $3$ $arrow$ Xác suất $1/6$.
    ]
    
    #step[
      *Sơ đồ cây biểu diễn mã PIN tạo được sau 2 giai đoạn:*
      #v(0.5em)
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          let edge-style = (mark: (end: ">", fill: black), stroke: 0.7pt)
          let lbl(txt) = box(fill: white, inset: 1pt, txt)
          
          let p1_1 = (3.5, 4.5); let p1_2 = (3.5, 0); let p1_3 = (3.5, -4.5)

          content((0, 0), box(stroke: 1pt + black, inset: 5pt, radius: 4pt)[Bắt đầu], name: "N0")
          content(p1_1, align(center)[*KN1* \ (Ra số 1)], name: "N1_1")
          content(p1_2, align(center)[*KN2* \ (Ra số 2)], name: "N1_2")
          content(p1_3, align(center)[*KN3* \ (Ra số 3)], name: "N1_3")

          line("N0", "N1_1", ..edge-style); content((1.75, 2.75), lbl[$1/2$])
          line("N0", "N1_2", ..edge-style); content((1.75, 0), lbl[$1/3$])
          line("N0", "N1_3", ..edge-style); content((1.75, -2.85), lbl[$1/6$])

          // Chữ số thứ nhất là 1
          line("N1_1", (7.0, 6.0), ..edge-style); content((5.25, 5.6), lbl[$1/2$])
          content((7.2, 6.0), [*KN1* $arrow$ Mã: 11 (Tổng 2) #h(2pt) #text(fill: blue, weight: "bold")[(Trùng)]], anchor: "west")
          line("N1_1", (7.0, 4.5), ..edge-style); content((5.25, 4.4), lbl[$1/3$])
          content((7.2, 4.5), [*KN2* $arrow$ Mã: 12 (Tổng 3) #h(2pt) #text(fill: red)[(Loại)]], anchor: "west") 
          line("N1_1", (7.0, 3.0), ..edge-style); content((5.25, 3.25), lbl[$1/6$])
          content((7.2, 3.0), [*KN3* $arrow$ Mã: 13 (Tổng 4) #h(2pt) #text(fill: green)[(Chẵn)]], anchor: "west")

          // Chữ số thứ nhất là 2
          line("N1_2", (7.0, 1.5), ..edge-style); content((5.25, 0.8+.3), lbl[$1/2$])
          content((7.2, 1.5), [*KN1* $arrow$ Mã: 21 (Tổng 3) #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_2", (7.0, 0), ..edge-style); content((5.25, 0.1 -.2), lbl[$1/3$])
          content((7.2, 0), [*KN2* $arrow$ Mã: 22 (Tổng 4) #h(2pt) #text(fill: blue, weight: "bold")[(Trùng)]], anchor: "west")
          line("N1_2", (7.0, -1.5), ..edge-style); content((5.25, -0.5 -.8), lbl[$1/6$])
          content((7.2, -1.5), [*KN3* $arrow$ Mã: 23 (Tổng 5) #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

          // Chữ số thứ nhất là 3
          line("N1_3", (7.0, -3.0), ..edge-style); content((5.25, -3.7 +.3), lbl[$1/2$])
          content((7.2, -3.0), [*KN1* $arrow$ Mã: 31 (Tổng 4) #h(2pt) #text(fill: green)[(Chẵn)]], anchor: "west")
          line("N1_3", (7.0, -4.5), ..edge-style); content((5.25, -4.4 -.2), lbl[$1/3$])
          content((7.2, -4.5), [*KN2* $arrow$ Mã: 32 (Tổng 5) #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
          line("N1_3", (7.0, -6.0), ..edge-style); content((5.25, -5.1-.8), lbl[$1/6$])
          content((7.2, -6.0), [*KN3* $arrow$ Mã: 33 (Tổng 6) #h(2pt) #text(fill: blue, weight: "bold")[(Trùng)]], anchor: "west")
        })
      ]
    ]

    #step[
      Các mã PIN có tổng chữ số là số chẵn (Biến cố $X$) bao gồm các nhánh Xanh lá và Xanh dương:
      $ P(X) = (1/2 times 1/2) + (1/2 times 1/6) + (1/3 times 1/3) + (1/6 times 1/2) + (1/6 times 1/6) $
      $ P(X) = 1/4 + 1/12 + 1/9 + 1/12 + 1/36 = 9/36 + 3/36 + 4/36 + 3/36 + 1/36 = 20/36 $
      
      Các mã PIN có hai chữ số trùng nhau (Biến cố $X inter Y$, màu xanh dương) là $11, 22$ và $33$:
      $ P(X inter Y) = (1/2 times 1/2) + (1/3 times 1/3) + (1/6 times 1/6) $
      $ P(X inter Y) = 1/4 + 1/9 + 1/36 = 9/36 + 4/36 + 1/36 = 14/36 $
    ]

    #step[
      Xác suất cần tìm dưới dạng số thập phân là:
      $ P(Y | X) = (P(X inter Y)) / P(X) = (14/36) / (20/36) = 14/20 = 7/10 = 0.7 $
    ]
  ]
)

