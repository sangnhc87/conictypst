

#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.0"
#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm)
)

// #show: stexgv-doc.with(
//   doc-type: "book",
//   title: "CHUYÊN ĐỀ: SƠ ĐỒ CÂY 1-3-6",
//   author: "GV Nguyễn Văn Sang",
//   theme-color: classic.blue
// )

#let math-color = rgb("#000000") 
#show math.equation: set text(fill: math-color)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ VÀ MỤC LỤC
// // ═══════════════════════════════════════════════════════════
// #v(1em)
// #block(
//   width: 100%,
//   fill: rgb("#f4f8fc"),
//   stroke: (left: 6pt + classic.blue, top: 0.5pt + rgb("#dbe4f0"), right: 0.5pt + rgb("#dbe4f0"), bottom: 0.5pt + rgb("#dbe4f0")),
//   inset: 16pt,
//   radius: (right: 4pt)
// )[
//   #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: Sơ Đồ Cây 1-3-6]
  
//   #v(0.8em)
//   #text(style: "italic", size: 12pt, fill: rgb("#555555"))[Kỹ thuật tọa độ hóa và công thức giải nhanh bài toán Parabol nội tiếp hình chữ nhật.]
// ]
// #v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "dethi"   // dethi | loigiai | solcolor
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

#ds(
  [Một công ty sản xuất một loại sản phẩm. Trước khi bán ra thị trường, công ty đã phỏng vấn $200$ khách hàng và thấy có $88$ người trả lời "sẽ mua", $52$ người trả lời "không mua", số còn lại trả lời "sẽ cân nhắc" thêm và hiện tại chưa quyết định sẽ mua hay không mua. Theo thống kê bằng các đợt bán các sản phẩm trước thì trong những khách hàng trả lời sẽ mua thì sẽ có $80%$ là thực sự mua, trong những khách hàng trả lời không mua thì sẽ có $30%$ thực sự mua và có $65%$ tổng số người phỏng vấn là thực sự mua. Chọn ngẫu nhiên một khách hàng trong các khách hàng đã được phỏng vấn.],
  (
    True([Xác suất để chọn được người trả lời "sẽ mua" là $44%$.]),
    [Xác suất để chọn được khách hàng thực sự mua, nếu đã biết khách hàng này đã trả lời "sẽ mua", là $44/125$.],
    [Nếu chọn được khách hàng trả lời "sẽ cân nhắc" thì tỉ lệ thực sự mua là $35%$.],
    [Xác suất để chọn được khách hàng trả lời "sẽ cân nhắc", nếu biết khách hàng đó thực sự mua là $8/25$.]
  ),
  fig: cetz.canvas(length: 1.4cm, {
    import cetz.draw: *
    
    // Nút gốc
    content((0, 0), [Khách hàng \ ($200$ người)], name: "root", frame: "rect", padding: 5pt, fill: rgb("e3f2fd"), stroke: 0.5pt + rgb("1e88e5"), radius: 3pt)
    
    // Cấu hình style chung
    let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt, radius: 2pt)
    let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
    let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)
    
    // Tầng 1: Trả lời phỏng vấn
    content((3.5, 2.5), ["Sẽ mua" \ ($A$)], name: "A", ..style1)
    content((3.5, 0), ["Cân nhắc" \ ($B$)], name: "B", ..style1)
    content((3.5, -2.5), ["Không mua" \ ($C$)], name: "C", ..style1)
    
    line("root", "A", mark: (end: ">", fill: black)); content((1.75, 1.55), text(size: 9pt)[$0,44$], ..lbl-style)
    line("root", "B", mark: (end: ">", fill: black)); content((1.75, 0), text(size: 9pt)[$0,30$], ..lbl-style)
    line("root", "C", mark: (end: ">", fill: black)); content((1.75, -1.55), text(size: 9pt)[$0,26$], ..lbl-style)
    
    // Tầng 2: Thực tế hành vi
    content((7.5, 3.2), [Mua ($M$)], name: "AM", ..style2)
    content((7.5, 1.8), [Không ($overline(M)$)], name: "AnM", ..style2)
    line("A", "AM", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,80$], ..lbl-style)
    line("A", "AnM", mark: (end: ">", fill: black)); content((5.5, 1.9), text(size: 9pt)[$0,20$], ..lbl-style)
    
    content((7.5, 0.7), [Mua ($M$)], name: "BM", ..style2, stroke: rgb("d32f2f"), fill: rgb("ffebee"))
    content((7.5, -0.7), [Không ($overline(M)$)], name: "BnM", ..style2)
    line("B", "BM", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 0.6), text(fill: red, size: 9pt)[$x$], ..lbl-style)
    line("B", "BnM", mark: (end: ">", fill: black)); content((5.5, -0.6), text(size: 9pt)[$1-x$], ..lbl-style)
    
    content((7.5, -1.8), [Mua ($M$)], name: "CM", ..style2)
    content((7.5, -3.2), [Không ($overline(M)$)], name: "CnM", ..style2)
    line("C", "CM", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,30$], ..lbl-style)
    line("C", "CnM", mark: (end: ">", fill: black)); content((5.5, -3.1), text(size: 9pt)[$0,70$], ..lbl-style)
  }),
  fig-pos: "center",
  fig-width: 90%,
  loigiai: [
    #ppgiai[
      - Bài toán yêu cầu tính xác suất có điều kiện thuận và ngược. Ta sử dụng hệ biến cố đầy đủ.
      - Gọi $A, B, C$ lần lượt là các biến cố khách hàng trả lời "sẽ mua", "cân nhắc", "không mua".
      - Gọi $M$ là biến cố khách hàng "thực sự mua".
      - *Công thức xác suất đầy đủ:* $P(M) = P(A)P(M|A) + P(B)P(M|B) + P(C)P(M|C)$.
      - *Công thức Bayes:* $P(B|M) = (P(B)P(M|B))/(P(M))$.
    ]
    #align(center)[
       #cetz.canvas(length: 1.4cm, {
    import cetz.draw: *
    
    // Nút gốc
    content((0, 0), [Khách hàng \ ($200$ người)], name: "root", frame: "rect", padding: 5pt, fill: rgb("e3f2fd"), stroke: 0.5pt + rgb("1e88e5"), radius: 3pt)
    
    // Cấu hình style chung
    let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt, radius: 2pt)
    let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
    let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)
    
    // Tầng 1: Trả lời phỏng vấn
    content((3.5, 2.5), ["Sẽ mua" \ ($A$)], name: "A", ..style1)
    content((3.5, 0), ["Cân nhắc" \ ($B$)], name: "B", ..style1)
    content((3.5, -2.5), ["Không mua" \ ($C$)], name: "C", ..style1)
    
    line("root", "A", mark: (end: ">", fill: black)); content((1.75, 1.55), text(size: 9pt)[$0,44$], ..lbl-style)
    line("root", "B", mark: (end: ">", fill: black)); content((1.75, 0), text(size: 9pt)[$0,30$], ..lbl-style)
    line("root", "C", mark: (end: ">", fill: black)); content((1.75, -1.55), text(size: 9pt)[$0,26$], ..lbl-style)
    
    // Tầng 2: Thực tế hành vi
    content((7.5, 3.2), [Mua ($M$)], name: "AM", ..style2)
    content((7.5, 1.8), [Không ($overline(M)$)], name: "AnM", ..style2)
    line("A", "AM", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,80$], ..lbl-style)
    line("A", "AnM", mark: (end: ">", fill: black)); content((5.5, 1.9), text(size: 9pt)[$0,20$], ..lbl-style)
    
    content((7.5, 0.7), [Mua ($M$)], name: "BM", ..style2, stroke: rgb("d32f2f"), fill: rgb("ffebee"))
    content((7.5, -0.7), [Không ($overline(M)$)], name: "BnM", ..style2)
    line("B", "BM", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 0.6), text(fill: red, size: 9pt)[$x$], ..lbl-style)
    line("B", "BnM", mark: (end: ">", fill: black)); content((5.5, -0.6), text(size: 9pt)[$1-x$], ..lbl-style)
    
    content((7.5, -1.8), [Mua ($M$)], name: "CM", ..style2)
    content((7.5, -3.2), [Không ($overline(M)$)], name: "CnM", ..style2)
    line("C", "CM", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,30$], ..lbl-style)
    line("C", "CnM", mark: (end: ">", fill: black)); content((5.5, -3.1), text(size: 9pt)[$0,70$], ..lbl-style)
  })
]
    *Bước 1: Tính các xác suất ban đầu*
    - $P(A) = 88/200 = 0,44$; $P(C) = 52/200 = 0,26$.
    - Do hệ ${A, B, C}$ là hệ đầy đủ nên $P(B) = 1 - (P(A) + P(C)) = 1 - 0,70 = 0,30$.
    - Dữ kiện bài cho: $P(M|A) = 0,8$; $P(M|C) = 0,3$; $P(M) = 0,65$.

    *Bước 2: Xét tính đúng sai của từng mệnh đề*
    - *a)* Xác suất chọn được người trả lời "sẽ mua" là $P(A) = 0,44 = 44%$. $=>$ *Đúng*.
    - *b)* Xác suất thực sự mua khi biết khách đã trả lời "sẽ mua" là $P(M|A) = 0,8$. Mà $44/125 = 0,352 != 0,8$. $=>$ *Sai*.
    - *c)* Áp dụng công thức xác suất đầy đủ:
      $ 0,65 = 0,44 dot 0,8 + 0,3 dot P(M|B) + 0,26 dot 0,3 $
      $ <=> 0,65 = 0,352 + 0,3 dot P(M|B) + 0,078 $
      $ <=> 0,22 = 0,3 dot P(M|B) <=> P(M|B) = 22/30 = 11/15 approx 73,3% != 35%. $
      $=>$ *Sai*.
    - *d)* Áp dụng công thức Bayes để tính xác suất khách trả lời "cân nhắc" khi biết người đó thực sự mua:
      $ P(B|M) = (P(B) dot P(M|B))/(P(M)) = (0,3 dot 11/15)/(0,65) = (0,22)/(0,65) = 22/65 approx 0,338. $
      Mà $8/25 = 0,32 != 22/65$. $=>$ *Sai*.

    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Minh họa tư duy Bayes
        rect((0,0), (8, 2.5), stroke: 0.5pt, radius: 3pt)
        content((4, 2), text(fill: rgb("d32f2f"))[*Tỉ trọng đóng góp vào $P(M) = 0,65$*])
        line((0, 1.5), (8, 1.5), stroke: 0.5pt)
        
        content((1.5, 0.75), text(size: 9pt)[$P(A)P(M|A)$\ $0,352$])
        line((3, 0), (3, 1.5), stroke: (dash: "dashed"))
        
        content((4.5, 0.75), text(fill: rgb("1e88e5"), size: 9pt)[$P(B)P(M|B)$\ $0,22$])
        line((6, 0), (6, 1.5), stroke: (dash: "dashed"))
        
        content((7, 0.75), text(size: 9pt)[$P(C)P(M|C)$\ $0,078$])
      })
    ]

    #meo[Ghi nhớ sơ đồ Bayes bằng hình chữ nhật tỉ trọng: Xác suất hậu nghiệm $P(B|M)$ chính là phần diện tích của nhóm $B$ chiếm trong tổng diện tích của toàn bộ hình chữ nhật $M$.]
  ]
)
#ds(
  [Một nhà máy có $3$ phân xưởng cùng sản xuất một loại linh kiện. Phân xưởng I chiếm $50%$ tổng sản lượng, phân xưởng II chiếm $30%$, số còn lại do phân xưởng III sản xuất. Theo thống kê từ bộ phận KCS, tỉ lệ phế phẩm của phân xưởng I là $2%$, của phân xưởng III là $3%$. Biết tỉ lệ phế phẩm chung của toàn nhà máy là $3,1%$. Chọn ngẫu nhiên một linh kiện do nhà máy sản xuất.],
  (
    True([Xác suất để chọn được linh kiện do phân xưởng I sản xuất là $50%$.]),
    [Xác suất để linh kiện là phế phẩm, nếu đã biết nó do phân xưởng I sản xuất, là $1/25$.],
    True([Nếu chọn được linh kiện của phân xưởng II thì tỉ lệ là phế phẩm của nó là $5%$.]),
    [Xác suất để linh kiện do phân xưởng II sản xuất, nếu biết nó là phế phẩm, là $1/2$.]
  ),
  fig: cetz.canvas(length: 1.4cm, {
    import cetz.draw: *
    
    // Nút gốc
    content((0, 0), [Linh kiện \ (Nhà máy)], name: "root", frame: "rect", padding: 5pt, fill: rgb("e3f2fd"), stroke: 0.5pt + rgb("1e88e5"), radius: 3pt)
    
    // Cấu hình style chung
    let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt, radius: 2pt)
    let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
    let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)
    
    // Tầng 1: Nguồn gốc sản xuất
    content((3.5, 2.5), ["Phân xưởng I" \ ($A$)], name: "A", ..style1)
    content((3.5, 0), ["Phân xưởng II" \ ($B$)], name: "B", ..style1)
    content((3.5, -2.5), ["Phân xưởng III" \ ($C$)], name: "C", ..style1)
    
    line("root", "A", mark: (end: ">", fill: black)); content((1.75, 1.55), text(size: 9pt)[$0,50$], ..lbl-style)
    line("root", "B", mark: (end: ">", fill: black)); content((1.75, 0), text(size: 9pt)[$0,30$], ..lbl-style)
    line("root", "C", mark: (end: ">", fill: black)); content((1.75, -1.55), text(size: 9pt)[$0,20$], ..lbl-style)
    
    // Tầng 2: Phân loại chất lượng
    content((7.5, 3.2), [Phế phẩm ($D$)], name: "AD", ..style2)
    content((7.5, 1.8), [Chuẩn ($overline(D)$)], name: "AnD", ..style2)
    line("A", "AD", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,02$], ..lbl-style)
    line("A", "AnD", mark: (end: ">", fill: black)); content((5.5, 1.9), text(size: 9pt)[$0,98$], ..lbl-style)
    
    content((7.5, 0.7), [Phế phẩm ($D$)], name: "BD", ..style2, stroke: rgb("d32f2f"), fill: rgb("ffebee"))
    content((7.5, -0.7), [Chuẩn ($overline(D)$)], name: "BnD", ..style2)
    line("B", "BD", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 0.6), text(fill: red, size: 9pt)[$x$], ..lbl-style)
    line("B", "BnD", mark: (end: ">", fill: black)); content((5.5, -0.6), text(size: 9pt)[$1-x$], ..lbl-style)
    
    content((7.5, -1.8), [Phế phẩm ($D$)], name: "CD", ..style2)
    content((7.5, -3.2), [Chuẩn ($overline(D)$)], name: "CnD", ..style2)
    line("C", "CD", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,03$], ..lbl-style)
    line("C", "CnD", mark: (end: ">", fill: black)); content((5.5, -3.1), text(size: 9pt)[$0,97$], ..lbl-style)
  }),
  fig-pos: "center",
  fig-width: 90%,
  loigiai: [
    #ppgiai[
      - Bài toán yêu cầu tính xác suất có điều kiện thuận và ngược. Ta sử dụng hệ biến cố đầy đủ.
      - Gọi $A, B, C$ lần lượt là các biến cố linh kiện do phân xưởng I, II, III sản xuất.
      - Gọi $D$ là biến cố linh kiện "là phế phẩm".
      - *Công thức xác suất đầy đủ:* $P(D) = P(A)P(D|A) + P(B)P(D|B) + P(C)P(D|C)$.
      - *Công thức Bayes:* $P(B|D) = (P(B)P(D|B))/(P(D))$.
    ]
    #align(center)[
      #cetz.canvas(length: 1.4cm, {
        import cetz.draw: *
        
        let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt, radius: 2pt)
        let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
        let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)
        
        content((0, 0), [Linh kiện], name: "root", frame: "rect", padding: 5pt, fill: rgb("e3f2fd"), stroke: 0.5pt + rgb("1e88e5"), radius: 3pt)
        
        content((3.5, 2.5), ["PX I" ($A$)], name: "A", ..style1)
        content((3.5, 0), ["PX II" ($B$)], name: "B", ..style1)
        content((3.5, -2.5), ["PX III" ($C$)], name: "C", ..style1)
        
        line("root", "A", mark: (end: ">", fill: black)); content((1.75, 1.55), text(size: 9pt)[$0,50$], ..lbl-style)
        line("root", "B", mark: (end: ">", fill: black)); content((1.75, 0), text(size: 9pt)[$0,30$], ..lbl-style)
        line("root", "C", mark: (end: ">", fill: black)); content((1.75, -1.55), text(size: 9pt)[$0,20$], ..lbl-style)
        
        content((7.5, 3.2), [Phế phẩm ($D$)], name: "AD", ..style2)
        content((7.5, 1.8), [Chuẩn ($overline(D)$)], name: "AnD", ..style2)
        line("A", "AD", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,02$], ..lbl-style)
        line("A", "AnD", mark: (end: ">", fill: black)); content((5.5, 1.9), text(size: 9pt)[$0,98$], ..lbl-style)
        
        content((7.5, 0.7), [Phế phẩm ($D$)], name: "BD", ..style2, stroke: rgb("d32f2f"), fill: rgb("ffebee"))
        content((7.5, -0.7), [Chuẩn ($overline(D)$)], name: "BnD", ..style2)
        line("B", "BD", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 0.6), text(fill: red, size: 9pt)[$0,05$], ..lbl-style)
        line("B", "BnD", mark: (end: ">", fill: black)); content((5.5, -0.6), text(size: 9pt)[$0,95$], ..lbl-style)
        
        content((7.5, -1.8), [Phế phẩm ($D$)], name: "CD", ..style2)
        content((7.5, -3.2), [Chuẩn ($overline(D)$)], name: "CnD", ..style2)
        line("C", "CD", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,03$], ..lbl-style)
        line("C", "CnD", mark: (end: ">", fill: black)); content((5.5, -3.1), text(size: 9pt)[$0,97$], ..lbl-style)
      })
    ]

    *Bước 1: Tính các xác suất ban đầu*
    - $P(A) = 50% = 0,50$; $P(B) = 30% = 0,30$.
    - Do hệ ${A, B, C}$ là hệ đầy đủ nên $P(C) = 1 - (P(A) + P(B)) = 1 - 0,80 = 0,20$.
    - Dữ kiện bài cho: $P(D|A) = 0,02$; $P(D|C) = 0,03$; $P(D) = 0,031$.

    *Bước 2: Xét tính đúng sai của từng mệnh đề*
    - *a)* Xác suất chọn được linh kiện của phân xưởng I là $P(A) = 0,50 = 50%$. $=>$ *Đúng*.
    - *b)* Xác suất linh kiện là phế phẩm khi biết nó do PX I sản xuất là $P(D|A) = 0,02 = 1/50$. 
      Mà $1/50 != 1/25$. $=>$ *Sai*.
    - *c)* Áp dụng công thức xác suất đầy đủ:
      $ 0,031 = 0,50 dot 0,02 + 0,30 dot P(D|B) + 0,20 dot 0,03 $
      $ <=> 0,031 = 0,010 + 0,30 dot P(D|B) + 0,006 $
      $ <=> 0,015 = 0,30 dot P(D|B) <=> P(D|B) = (0,015)/(0,30) = 0,05 = 5%. $
      $=>$ *Đúng*.
    - *d)* Áp dụng công thức Bayes để tính xác suất linh kiện do PX II sản xuất khi biết nó là phế phẩm:
      $ P(B|D) = (P(B) dot P(D|B))/(P(D)) = (0,30 dot 0,05)/(0,031) = (0,015)/(0,031) = 15/31 approx 48,39%. $
      Mà $15/31 != 1/2$. $=>$ *Sai*.

    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Minh họa tư duy Bayes
        rect((0,0), (8, 2.5), stroke: 0.5pt, radius: 3pt)
        content((4, 2), text(fill: rgb("d32f2f"))[*Tỉ trọng đóng góp vào $P(D) = 0,031$*])
        line((0, 1.5), (8, 1.5), stroke: 0.5pt)
        
        content((1.3, 0.75), text(size: 9pt)[$P(A)P(D|A)$\ $0,010$])
        line((2.6, 0), (2.6, 1.5), stroke: (dash: "dashed"))
        
        content((4.5, 0.75), text(fill: rgb("1e88e5"), size: 9pt)[$P(B)P(D|B)$\ $0,015$])
        line((6.4, 0), (6.4, 1.5), stroke: (dash: "dashed"))
        
        content((7.2, 0.75), text(size: 9pt)[$P(C)P(D|C)$\ $0,006$])
      })
    ]

    #meo[Bài toán Bayes thường xuyên xuất hiện dạng "Tìm thông số kỹ thuật của 1 máy/xưởng dựa vào thông số tổng". Lúc này ta dùng công thức xác suất đầy đủ làm phương trình bậc nhất để tìm $x$.]
  ]
)

#ds(
  [Tại một trường đại học, sinh viên năm nhất được tuyển sinh chủ yếu từ ba trường THPT: A, B và C. Thống kê của phòng công tác sinh viên cho thấy: số tân sinh viên đến từ trường A chiếm $40%$ tổng số, trường B chiếm $30%$, số còn lại đến từ trường C. Theo dõi kết quả học tập sau 4 năm, phòng đào tạo nhận thấy: tỉ lệ sinh viên tốt nghiệp loại Giỏi trong nhóm cựu học sinh trường A là $20%$, và trong nhóm trường C là $15%$. Biết rằng tỉ lệ sinh viên tốt nghiệp loại Giỏi chung của toàn khóa là $18,5%$. Chọn ngẫu nhiên một sinh viên đã tốt nghiệp của khóa đó.],
  (
    True([Xác suất để chọn được sinh viên xuất thân từ trường B là $30%$.]),
    [Nếu chọn được sinh viên từ trường A, xác suất em đó không đạt loại Giỏi là $20%$.],
    True([Tỉ lệ sinh viên đạt loại Giỏi trong số các em đến từ trường B là $20%$.]),
    [Chọn ngẫu nhiên một sinh viên tốt nghiệp loại Giỏi, xác suất em đó đến từ trường C là $27/37$.]
  ),
  fig: cetz.canvas(length: 1.4cm, {
    import cetz.draw: *
    
    // Nút gốc
    content((0, 0), [Sinh viên \ (Toàn khóa)], name: "root", frame: "rect", padding: 5pt, fill: rgb("e3f2fd"), stroke: 0.5pt + rgb("1e88e5"), radius: 3pt)
    
    // Cấu hình style chung
    let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt, radius: 2pt)
    let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
    let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)
    
    // Tầng 1: Xuất thân (Trường THPT)
    content((3.5, 2.5), ["Trường A" \ ($A$)], name: "A", ..style1)
    content((3.5, 0), ["Trường B" \ ($B$)], name: "B", ..style1)
    content((3.5, -2.5), ["Trường C" \ ($C$)], name: "C", ..style1)
    
    line("root", "A", mark: (end: ">", fill: black)); content((1.75, 1.55), text(size: 9pt)[$0,40$], ..lbl-style)
    line("root", "B", mark: (end: ">", fill: black)); content((1.75, 0), text(size: 9pt)[$0,30$], ..lbl-style)
    line("root", "C", mark: (end: ">", fill: black)); content((1.75, -1.55), text(size: 9pt)[$0,30$], ..lbl-style)
    
    // Tầng 2: Kết quả tốt nghiệp
    content((7.5, 3.2), [Giỏi ($G$)], name: "AG", ..style2)
    content((7.5, 1.8), [Khác ($overline(G)$)], name: "AnG", ..style2)
    line("A", "AG", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,20$], ..lbl-style)
    line("A", "AnG", mark: (end: ">", fill: black)); content((5.5, 1.9), text(size: 9pt)[$0,80$], ..lbl-style)
    
    content((7.5, 0.7), [Giỏi ($G$)], name: "BG", ..style2, stroke: rgb("d32f2f"), fill: rgb("ffebee"))
    content((7.5, -0.7), [Khác ($overline(G)$)], name: "BnG", ..style2)
    line("B", "BG", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 0.6), text(fill: red, size: 9pt)[$x$], ..lbl-style)
    line("B", "BnG", mark: (end: ">", fill: black)); content((5.5, -0.6), text(size: 9pt)[$1-x$], ..lbl-style)
    
    content((7.5, -1.8), [Giỏi ($G$)], name: "CG", ..style2)
    content((7.5, -3.2), [Khác ($overline(G)$)], name: "CnG", ..style2)
    line("C", "CG", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,15$], ..lbl-style)
    line("C", "CnG", mark: (end: ">", fill: black)); content((5.5, -3.1), text(size: 9pt)[$0,85$], ..lbl-style)
  }),
  fig-pos: "center",
  fig-width: 90%,
  loigiai: [
    #ppgiai[
      - Đây là dạng toán tìm xác suất điều kiện bị khuyết thông qua hệ thức xác suất toàn phần.
      - Gọi $A, B, C$ lần lượt là các biến cố sinh viên xuất thân từ trường A, B, C. Hệ ${A, B, C}$ là hệ biến cố đầy đủ.
      - Gọi $G$ là biến cố sinh viên "tốt nghiệp loại Giỏi".
      - *Công thức xác suất toàn phần:* $P(G) = P(A)P(G|A) + P(B)P(G|B) + P(C)P(G|C)$.
      - *Công thức Bayes:* $P(C|G) = (P(C)P(G|C))/(P(G))$.
    ]
    
    *Bước 1: Khai thác giả thiết và tính các xác suất cơ bản*
    - $P(A) = 40% = 0,40$; $P(B) = 30% = 0,30$.
    - Tổng tỉ lệ là $100%$, suy ra $P(C) = 1 - (0,40 + 0,30) = 0,30$.
    - Xác suất có điều kiện (tỉ lệ giỏi của từng trường): $P(G|A) = 0,20$; $P(G|C) = 0,15$.
    - Xác suất toàn phần (tỉ lệ giỏi chung): $P(G) = 18,5% = 0,185$.

    *Bước 2: Kiểm tra các mệnh đề*
    - *a)* Xác suất chọn được sinh viên đến từ trường B chính là $P(B) = 0,30 = 30%$. $=>$ *Đúng*.
    - *b)* Xác suất sinh viên không đạt loại Giỏi khi biết em đó từ trường A là: 
      $P(overline(G)|A) = 1 - P(G|A) = 1 - 0,20 = 0,80 = 80%$. 
      Đề cho là $20%$. $=>$ *Sai*.
    - *c)* Áp dụng công thức xác suất toàn phần để tìm tham số $x = P(G|B)$ bị khuyết:
      $ 0,185 = 0,40 dot 0,20 + 0,30 dot P(G|B) + 0,30 dot 0,15 $
      $ <=> 0,185 = 0,080 + 0,30 dot P(G|B) + 0,045 $
      $ <=> 0,185 = 0,125 + 0,30 dot P(G|B) <=> 0,060 = 0,30 dot P(G|B) $
      $ <=> P(G|B) = (0,060)/(0,30) = 0,20 = 20%. $
      $=>$ *Đúng*.
    - *d)* Áp dụng công thức Bayes để tính xác suất sinh viên đến từ trường C khi biết em đó đạt loại Giỏi:
      $ P(C|G) = (P(C) dot P(G|C))/(P(G)) = (0,30 dot 0,15)/(0,185) = (0,045)/(0,185) = 45/185 = 9/37. $
      Đề cho là $27/37$. $=>$ *Sai*.

    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Trực quan hóa Bayes bằng biểu đồ diện tích khối
        rect((0,0), (8, 2.5), stroke: 0.5pt, radius: 3pt)
        content((4, 2), text(fill: rgb("d32f2f"), weight: "bold")[Tỉ trọng đóng góp vào $P(G) = 0,185$])
        line((0, 1.5), (8, 1.5), stroke: 0.5pt)
        
        // Chia tỉ lệ tương đối: 0.080 : 0.060 : 0.045
        content((1.7, 0.75), text(size: 9pt)[$P(A)P(G|A)$ \ $0,080$])
        line((3.45, 0), (3.45, 1.5), stroke: (dash: "dashed", paint: gray))
        
        content((4.75, 0.75), text(fill: rgb("1e88e5"), size: 9pt)[$P(B)P(G|B)$ \ $0,060$])
        line((6.05, 0), (6.05, 1.5), stroke: (dash: "dashed", paint: gray))
        
        content((7, 0.75), text(size: 9pt)[$P(C)P(G|C)$ \ $0,045$])
      })
    ]

    #nhanxet[Khi gặp bài toán yêu cầu tìm "tỉ lệ của một nhóm nhỏ" dựa trên "tỉ lệ chung của tổng thể", hãy lập tức nghĩ đến việc đặt ẩn $x$ trên sơ đồ cây và giải phương trình bậc nhất sinh ra từ công thức Xác suất toàn phần.]
  ]
)
#ds(
  [Một công ty phần mềm vừa phát hành bản thử nghiệm (Beta) của một ứng dụng di động. Dữ liệu ghi nhận từ hệ thống cho thấy người dùng cài đặt ứng dụng từ 3 nguồn: App Store (nguồn A), Google Play (nguồn B) và Link trực tiếp (nguồn C). Trong đó, số lượng người dùng đến từ nguồn A chiếm $40%$, nguồn B chiếm $50%$, còn lại là từ nguồn C. Sau một tháng trải nghiệm, công ty thống kê được: tỉ lệ người dùng nâng cấp lên tài khoản Premium trong nhóm tải từ nguồn A là $15%$, và trong nhóm tải từ nguồn C là $5%$. Biết tỉ lệ người dùng nâng cấp Premium trên tổng số người dùng của cả 3 nguồn là $12,5%$. Chọn ngẫu nhiên một người dùng đã tải ứng dụng.],
  (
    True([Xác suất để chọn được người dùng cài đặt ứng dụng từ Google Play là $50%$.]),
    [Nếu chọn được người dùng tải từ App Store, xác suất người này không nâng cấp Premium là $80%$.],
    True([Tỉ lệ nâng cấp Premium trong nhóm người dùng đến từ Google Play là $12%$.]),
    [Chọn ngẫu nhiên một người dùng đã nâng cấp Premium, xác suất người này tải ứng dụng từ App Store là $1/2$.]
  ),
  fig: cetz.canvas(length: 1.4cm, {
    import cetz.draw: *
    
    // Nút gốc
    content((0, 0), [Người dùng \ (App Beta)], name: "root", frame: "rect", padding: 5pt, fill: rgb("e3f2fd"), stroke: 0.5pt + rgb("1e88e5"), radius: 3pt)
    
    // Cấu hình style chung
    let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt, radius: 2pt)
    let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
    let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)
    
    // Tầng 1: Nguồn cài đặt
    content((3.5, 2.5), ["App Store" \ ($A$)], name: "A", ..style1)
    content((3.5, 0), ["Google Play" \ ($B$)], name: "B", ..style1)
    content((3.5, -2.5), ["Direct Link" \ ($C$)], name: "C", ..style1)
    
    line("root", "A", mark: (end: ">", fill: black)); content((1.75, 1.55), text(size: 9pt)[$0,40$], ..lbl-style)
    line("root", "B", mark: (end: ">", fill: black)); content((1.75, 0), text(size: 9pt)[$0,50$], ..lbl-style)
    line("root", "C", mark: (end: ">", fill: black)); content((1.75, -1.55), text(size: 9pt)[$0,10$], ..lbl-style)
    
    // Tầng 2: Hành vi nâng cấp
    content((7.5, 3.2), [Premium ($P$)], name: "AP", ..style2)
    content((7.5, 1.8), [Free ($overline(P)$)], name: "AnP", ..style2)
    line("A", "AP", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,15$], ..lbl-style)
    line("A", "AnP", mark: (end: ">", fill: black)); content((5.5, 1.9), text(size: 9pt)[$0,85$], ..lbl-style)
    
    content((7.5, 0.7), [Premium ($P$)], name: "BP", ..style2, stroke: rgb("d32f2f"), fill: rgb("ffebee"))
    content((7.5, -0.7), [Free ($overline(P)$)], name: "BnP", ..style2)
    line("B", "BP", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 0.6), text(fill: red, size: 9pt)[$x$], ..lbl-style)
    line("B", "BnP", mark: (end: ">", fill: black)); content((5.5, -0.6), text(size: 9pt)[$1-x$], ..lbl-style)
    
    content((7.5, -1.8), [Premium ($P$)], name: "CP", ..style2)
    content((7.5, -3.2), [Free ($overline(P)$)], name: "CnP", ..style2)
    line("C", "CP", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,05$], ..lbl-style)
    line("C", "CnP", mark: (end: ">", fill: black)); content((5.5, -3.1), text(size: 9pt)[$0,95$], ..lbl-style)
  }),
  fig-pos: "center",
  fig-width: 90%,
  loigiai: [
    #ppgiai[
      - Bài toán yêu cầu tính xác suất có điều kiện thuận và ngược. Ta sử dụng hệ biến cố đầy đủ.
      - Gọi $A, B, C$ lần lượt là các biến cố chọn được người dùng từ nguồn A, B, C.
      - Gọi $P$ là biến cố người dùng "nâng cấp Premium".
      - *Công thức xác suất đầy đủ:* $P(P) = P(A)P(P|A) + P(B)P(P|B) + P(C)P(P|C)$.
      - *Công thức Bayes:* $P(A|P) = (P(A)P(P|A))/(P(P))$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 1.4cm, {
        import cetz.draw: *
        
        // Vẽ lại sơ đồ khi đã tìm được x = 0,12
        let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt, radius: 2pt)
        let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
        let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)
        
        content((0, 0), [Người dùng \ (App Beta)], name: "root", frame: "rect", padding: 5pt, fill: rgb("e3f2fd"), stroke: 0.5pt + rgb("1e88e5"), radius: 3pt)
        
        content((3.5, 2.5), ["App Store" ($A$)], name: "A", ..style1)
        content((3.5, 0), ["Google Play" ($B$)], name: "B", ..style1)
        content((3.5, -2.5), ["Direct Link" ($C$)], name: "C", ..style1)
        
        line("root", "A", mark: (end: ">", fill: black)); content((1.75, 1.55), text(size: 9pt)[$0,40$], ..lbl-style)
        line("root", "B", mark: (end: ">", fill: black)); content((1.75, 0), text(size: 9pt)[$0,50$], ..lbl-style)
        line("root", "C", mark: (end: ">", fill: black)); content((1.75, -1.55), text(size: 9pt)[$0,10$], ..lbl-style)
        
        content((7.5, 3.2), [Premium ($P$)], name: "AP", ..style2)
        content((7.5, 1.8), [Free ($overline(P)$)], name: "AnP", ..style2)
        line("A", "AP", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,15$], ..lbl-style)
        line("A", "AnP", mark: (end: ">", fill: black)); content((5.5, 1.9), text(size: 9pt)[$0,85$], ..lbl-style)
        
        content((7.5, 0.7), [Premium ($P$)], name: "BP", ..style2, stroke: rgb("d32f2f"), fill: rgb("ffebee"))
        content((7.5, -0.7), [Free ($overline(P)$)], name: "BnP", ..style2)
        line("B", "BP", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 0.6), text(fill: red, size: 9pt)[$0,12$], ..lbl-style)
        line("B", "BnP", mark: (end: ">", fill: black)); content((5.5, -0.6), text(size: 9pt)[$0,88$], ..lbl-style)
        
        content((7.5, -1.8), [Premium ($P$)], name: "CP", ..style2)
        content((7.5, -3.2), [Free ($overline(P)$)], name: "CnP", ..style2)
        line("C", "CP", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,05$], ..lbl-style)
        line("C", "CnP", mark: (end: ">", fill: black)); content((5.5, -3.1), text(size: 9pt)[$0,95$], ..lbl-style)
      })
    ]

    *Bước 1: Tính các xác suất ban đầu*
    - $P(A) = 40% = 0,40$; $P(B) = 50% = 0,50$.
    - Do hệ ${A, B, C}$ là hệ đầy đủ nên $P(C) = 1 - (P(A) + P(B)) = 1 - 0,90 = 0,10$.
    - Dữ kiện bài cho: $P(P|A) = 0,15$; $P(P|C) = 0,05$; và $P(P) = 0,125$.

    *Bước 2: Xét tính đúng sai của từng mệnh đề*
    - *a)* Xác suất chọn được người dùng từ Google Play là $P(B) = 0,50 = 50%$. $=>$ *Đúng*.
    - *b)* Xác suất người này không nâng cấp Premium khi biết tải từ App Store là $P(overline(P)|A) = 1 - P(P|A) = 1 - 0,15 = 0,85 = 85%$. Mệnh đề đưa ra $80%$. $=>$ *Sai*.
    - *c)* Đặt $x = P(P|B)$. Áp dụng công thức xác suất đầy đủ:
      $ 0,125 = 0,40 dot 0,15 + 0,50 dot x + 0,10 dot 0,05 $
      $ <=> 0,125 = 0,060 + 0,50x + 0,005 $
      $ <=> 0,125 = 0,065 + 0,50x <=> 0,50x = 0,060 <=> x = 0,12 = 12%. $
      $=>$ *Đúng*.
    - *d)* Áp dụng công thức Bayes để tính xác suất tải từ App Store khi biết người đó đã nâng cấp Premium:
      $ P(A|P) = (P(A) dot P(P|A))/(P(P)) = (0,40 dot 0,15)/(0,125) = (0,060)/(0,125) = 60/125 = 12/25. $
      Mệnh đề đưa ra $1/2$. $=>$ *Sai*.
  ]
)

#ds(
  [Một hệ thống phòng thủ an ninh mạng tiếp nhận dữ liệu định tuyến qua 3 cổng proxy: Alpha (cổng A), Beta (cổng B) và Gamma (cổng C). Thống kê lưu lượng cho thấy: cổng A xử lý $40%$ tổng số gói tin, cổng B xử lý $25%$, phần còn lại đi qua cổng C. Trí tuệ nhân tạo (AI) quét lõi hệ thống phát hiện: tỉ lệ gói tin chứa mã độc (malware) đi qua cổng A là $5%$, và qua cổng C là $2%$. Biết tỉ lệ gói tin chứa mã độc trên toàn bộ hệ thống là $4,7%$. Hệ thống chọn ngẫu nhiên một gói tin để kiểm tra sâu.],
  (
    True([Xác suất để chọn ngẫu nhiên được một gói tin đi qua cổng Beta là $25%$.]),
    [Xác suất gói tin chứa mã độc nếu biết nó đi qua cổng Alpha là $1/25$.],
    True([Tỉ lệ gói tin chứa mã độc được gửi qua cổng Beta là $8%$.]),
    [Nếu AI phát hiện một gói tin chứa mã độc, xác suất nó xuất phát từ cổng Gamma là $1/7$.]
  ),
  fig: cetz.canvas(length: 1.4cm, {
    import cetz.draw: *
    
    // Nút gốc - Giao diện tech
    content((0, 0), [Gói tin \ (Data Packet)], name: "root", frame: "rect", padding: 5pt, fill: rgb("eceff1"), stroke: 0.5pt + rgb("455a64"), radius: 3pt)
    
    // Cấu hình style chung
    let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt + rgb("1976d2"), radius: 2pt)
    let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
    let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)
    
    // Tầng 1: Phân luồng Proxy
    content((3.5, 2.5), ["Proxy Alpha" \ ($A$)], name: "A", ..style1)
    content((3.5, 0), ["Proxy Beta" \ ($B$)], name: "B", ..style1)
    content((3.5, -2.5), ["Proxy Gamma" \ ($C$)], name: "C", ..style1)
    
    line("root", "A", mark: (end: ">", fill: rgb("1976d2")), stroke: rgb("1976d2")); content((1.75, 1.55), text(size: 9pt)[$0,40$], ..lbl-style)
    line("root", "B", mark: (end: ">", fill: rgb("1976d2")), stroke: rgb("1976d2")); content((1.75, 0), text(size: 9pt)[$0,25$], ..lbl-style)
    line("root", "C", mark: (end: ">", fill: rgb("1976d2")), stroke: rgb("1976d2")); content((1.75, -1.55), text(size: 9pt)[$0,35$], ..lbl-style)
    
    // Tầng 2: Trạng thái an ninh
    content((7.5, 3.2), [Mã độc ($M$)], name: "AM", ..style2, stroke: rgb("d32f2f"))
    content((7.5, 1.8), [An toàn ($overline(M)$)], name: "AnM", ..style2, stroke: rgb("388e3c"))
    line("A", "AM", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,05$], ..lbl-style)
    line("A", "AnM", mark: (end: ">", fill: black)); content((5.5, 1.9), text(size: 9pt)[$0,95$], ..lbl-style)
    
    content((7.5, 0.7), [Mã độc ($M$)], name: "BM", ..style2, stroke: rgb("d32f2f"), fill: rgb("ffebee"))
    content((7.5, -0.7), [An toàn ($overline(M)$)], name: "BnM", ..style2, stroke: rgb("388e3c"))
    line("B", "BM", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 0.6), text(fill: red, size: 9pt)[$x$], ..lbl-style)
    line("B", "BnM", mark: (end: ">", fill: black)); content((5.5, -0.6), text(size: 9pt)[$1-x$], ..lbl-style)
    
    content((7.5, -1.8), [Mã độc ($M$)], name: "CM", ..style2, stroke: rgb("d32f2f"))
    content((7.5, -3.2), [An toàn ($overline(M)$)], name: "CnM", ..style2, stroke: rgb("388e3c"))
    line("C", "CM", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,02$], ..lbl-style)
    line("C", "CnM", mark: (end: ">", fill: black)); content((5.5, -3.1), text(size: 9pt)[$0,98$], ..lbl-style)
  }),
  fig-pos: "center",
  fig-width: 90%,
  loigiai: [
    #ppgiai[
      - Bài toán xác suất Bayes trong bối cảnh công nghệ thông tin. Các nguồn dữ liệu đầu vào tạo thành một hệ biến cố đầy đủ.
      - Gọi $A, B, C$ lần lượt là các biến cố gói tin đi qua cổng Alpha, Beta, Gamma.
      - Gọi $M$ là biến cố gói tin "chứa mã độc".
      - *Công thức xác suất đầy đủ:* $P(M) = P(A)P(M|A) + P(B)P(M|B) + P(C)P(M|C)$[cite: 1, 2].
      - *Công thức Bayes:* $P(C|M) = (P(C)P(M|C))/(P(M))$[cite: 1, 2].
    ]
    
    *Bước 1: Khai thác giả thiết và tính các xác suất cơ bản*
    - Tỉ trọng các cổng: $P(A) = 40% = 0,40$; $P(B) = 25% = 0,25$.
    - Do hệ ${A, B, C}$ đầy đủ nên $P(C) = 1 - (P(A) + P(B)) = 1 - 0,65 = 0,35$[cite: 1].
    - Xác suất nhiễm mã độc theo cổng: $P(M|A) = 0,05$; $P(M|C) = 0,02$[cite: 1].
    - Xác suất nhiễm mã độc toàn hệ thống: $P(M) = 4,7% = 0,047$[cite: 1].

    *Bước 2: Kiểm tra các mệnh đề*
    - *a)* Xác suất gói tin qua cổng Beta chính là $P(B) = 0,25 = 25%$. $=>$ *Đúng*[cite: 1].
    - *b)* Xác suất gói tin là mã độc khi biết nó qua cổng Alpha là $P(M|A) = 0,05 = 5/100 = 1/20$. 
      Mệnh đề cho là $1/25$. $=>$ *Sai*[cite: 1].
    - *c)* Đặt $x = P(M|B)$. Áp dụng công thức xác suất đầy đủ để tìm tỉ lệ mã độc lọt qua cổng Beta:
      $ 0,047 = 0,40 dot 0,05 + 0,25 dot x + 0,35 dot 0,02 $
      $ <=> 0,047 = 0,020 + 0,25x + 0,007 $
      $ <=> 0,047 = 0,027 + 0,25x <=> 0,020 = 0,25x $
      $ <=> x = (0,020)/(0,25) = 0,08 = 8%. $
      $=>$ *Đúng*[cite: 1].
    - *d)* Áp dụng công thức Bayes để tính xác suất mã độc xuất phát từ cổng Gamma:
      $ P(C|M) = (P(C) dot P(M|C))/(P(M)) = (0,35 dot 0,02)/(0,047) = (0,007)/(0,047) = 7/47. $
      Mệnh đề cho là $1/7 = 7/49 != 7/47$. $=>$ *Sai*[cite: 1].

    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Trực quan hóa Bayes bằng hệ thống Monitor
        rect((0,0), (9.4, 2.5), stroke: 0.5pt, radius: 3pt, fill: rgb("fafafa"))
        content((4.7, 2), text(fill: rgb("d32f2f"), weight: "bold")[CẢNH BÁO: Tỉ trọng nguồn phát tán Mã Độc $P(M) = 0,047$])
        line((0, 1.5), (9.4, 1.5), stroke: 0.5pt)
        
        // Chia tỉ lệ tương đối theo 0.020 : 0.020 : 0.007
        // (Nhân với factor để trải dài khung: ví dụ tổng 47 -> chiều dài 9.4 => factor = 200)
        content((2, 0.75), text(size: 9pt)[$P(A)P(M|A)$ \ $0,020$ (Alpha)])
        line((4, 0), (4, 1.5), stroke: (dash: "dashed", paint: gray))
        
        content((6, 0.75), text(fill: rgb("1e88e5"), size: 9pt)[$P(B)P(M|B)$ \ $0,020$ (Beta)])
        line((8, 0), (8, 1.5), stroke: (dash: "dashed", paint: gray))
        
        content((8.7, 0.75), text(size: 9pt)[$P(C)$ \ $0,007$])
      })
    ]

    #luuy[Sự thay đổi ngữ cảnh (từ khách hàng mua sắm sang an ninh mạng) không làm thay đổi bản chất toán học. Chìa khóa vẫn là dùng "xác suất toàn phần" để giải quyết tham số ẩn $x$, sau đó dùng công thức Bayes để tính xác suất truy vết (hậu nghiệm).]
  ]
)
#ds(
  [Một quỹ đầu tư mạo hiểm phân bổ toàn bộ nguồn vốn vào ba danh mục tài sản: Cổ phiếu công nghệ (A), Trái phiếu doanh nghiệp (B) và Bất động sản thương mại (C), với số vốn được chia theo tỉ lệ thuận với $5, 3$ và $2$. Cuối năm tài chính, bộ phận quản trị rủi ro tổng hợp dữ liệu và nhận thấy: xác suất để một khoản đầu tư thuộc danh mục Cổ phiếu công nghệ bị thua lỗ là $14%$, trong khi con số này ở danh mục Bất động sản thương mại là $8%$. Báo cáo kiểm toán toàn quỹ chỉ ra rằng, xác suất để một khoản đầu tư bất kỳ trong toàn bộ quỹ bị thua lỗ là $10,1%$. Một nhà phân tích chọn ngẫu nhiên một hồ sơ đầu tư để đánh giá.],
  (
    True([Xác suất để hồ sơ được chọn thuộc danh mục Trái phiếu doanh nghiệp là $0,3$.]),
    [Nếu hồ sơ được chọn thuộc Cổ phiếu công nghệ, xác suất nó không thua lỗ là $14%$.],
    True([Xác suất để một khoản đầu tư Trái phiếu doanh nghiệp bị thua lỗ là $5%$.]),
    [Chọn ngẫu nhiên một hồ sơ bị thua lỗ, xác suất nó thuộc danh mục Bất động sản thương mại là $15/101$.]
  ),
  fig: cetz.canvas(length: 1.4cm, {
    import cetz.draw: *
    
    // Nút gốc - Giao diện Tài chính
    content((0, 0), [Vốn Đầu Tư \ (Danh mục)], name: "root", frame: "rect", padding: 5pt, fill: rgb("f3e5f5"), stroke: 0.5pt + rgb("455a64"), radius: 3pt)
    
    // Cấu hình style chung
    let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt + rgb("00796b"), radius: 2pt)
    let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
    let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)
    
    // Tầng 1: Phân bổ vốn
    content((3.5, 2.5), ["Cổ phiếu công nghệ" \ ($A$)], name: "A", ..style1)
    content((3.5, 0), ["Trái phiếu DN" \ ($B$)], name: "B", ..style1)
    content((3.5, -2.5), ["Bất động sản" \ ($C$)], name: "C", ..style1)
    
    line("root", "A", mark: (end: ">", fill: rgb("00796b")), stroke: rgb("00796b")); content((1.75, 1.55), text(size: 9pt)[$5/10$], ..lbl-style)
    line("root", "B", mark: (end: ">", fill: rgb("00796b")), stroke: rgb("00796b")); content((1.75, 0), text(size: 9pt)[$3/10$], ..lbl-style)
    line("root", "C", mark: (end: ">", fill: rgb("00796b")), stroke: rgb("00796b")); content((1.75, -1.55), text(size: 9pt)[$2/10$], ..lbl-style)
    
    // Tầng 2: Trạng thái sinh lời/thua lỗ
    content((7.5, 3.2), [Thua lỗ ($L$)], name: "AL", ..style2, stroke: rgb("d32f2f"))
    content((7.5, 1.8), [Có lãi/Hòa ($overline(L)$)], name: "AnL", ..style2, stroke: rgb("388e3c"))
    line("A", "AL", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,14$], ..lbl-style)
    line("A", "AnL", mark: (end: ">", fill: black)); content((5.5, 1.9), text(size: 9pt)[$0,86$], ..lbl-style)
    
    content((7.5, 0.7), [Thua lỗ ($L$)], name: "BL", ..style2, stroke: rgb("d32f2f"), fill: rgb("ffebee"))
    content((7.5, -0.7), [Có lãi/Hòa ($overline(L)$)], name: "BnL", ..style2, stroke: rgb("388e3c"))
    line("B", "BL", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 0.6), text(fill: red, size: 9pt)[$x$], ..lbl-style)
    line("B", "BnL", mark: (end: ">", fill: black)); content((5.5, -0.6), text(size: 9pt)[$1-x$], ..lbl-style)
    
    content((7.5, -1.8), [Thua lỗ ($L$)], name: "CL", ..style2, stroke: rgb("d32f2f"))
    content((7.5, -3.2), [Có lãi/Hòa ($overline(L)$)], name: "CnL", ..style2, stroke: rgb("388e3c"))
    line("C", "CL", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,08$], ..lbl-style)
    line("C", "CnL", mark: (end: ">", fill: black)); content((5.5, -3.1), text(size: 9pt)[$0,92$], ..lbl-style)
  }),
  fig-pos: "center",
  fig-width: 90%,
  loigiai: [
    #ppgiai[
      - Từ tỉ lệ tỉ lệ thuận, ta xác định được xác suất (tỉ trọng) của từng nhánh gốc: $P(A), P(B), P(C)$.
      - Gọi $L$ là biến cố "khoản đầu tư bị thua lỗ". Ta sử dụng hệ thức xác suất toàn phần: 
        $P(L) = P(A)P(L|A) + P(B)P(L|B) + P(C)P(L|C)$
      - Để tìm xác suất nguyên nhân khi biết kết quả, áp dụng định lý Bayes: 
        $P(C|L) = (P(C)P(L|C))/(P(L))$
    ]
    
    *Bước 1: Tính các xác suất ban đầu*
    - Vì nguồn vốn tỉ lệ thuận với $5, 3$ và $2$ nên tổng số phần là $5+3+2=10$.
      $=> P(A) = 5/10 = 0,50; quad P(B) = 3/10 = 0,30; quad P(C) = 2/10 = 0,20$.
    - Xác suất thua lỗ cục bộ: $P(L|A) = 14% = 0,14$; $P(L|C) = 8% = 0,08$.
    - Xác suất thua lỗ toàn quỹ: $P(L) = 10,1% = 0,101$.

    *Bước 2: Kiểm tra các mệnh đề*
    - *a)* Xác suất hồ sơ thuộc danh mục Trái phiếu (B) là $P(B) = 0,30$. $=>$ *Đúng*.
    - *b)* Xác suất không thua lỗ (Có lãi/Hòa) nếu biết thuộc Cổ phiếu công nghệ (A) là phần bù:
      $P(overline(L)|A) = 1 - P(L|A) = 1 - 0,14 = 0,86 = 86%$. Mệnh đề cho là $14%$. $=>$ *Sai*.
    - *c)* Đặt $x = P(L|B)$ là xác suất thua lỗ của Trái phiếu. Áp dụng công thức xác suất toàn phần:
      $ 0,101 = 0,50 dot 0,14 + 0,30 dot x + 0,20 dot 0,08 $
      $ <=> 0,101 = 0,070 + 0,30x + 0,016 $
      $ <=> 0,101 = 0,086 + 0,30x <=> 0,015 = 0,30x $
      $ <=> x = (0,015)/(0,30) = 0,05 = 5%. $
      $=>$ *Đúng*.
    - *d)* Áp dụng công thức Bayes để tính xác suất hồ sơ thuộc Bất động sản (C) khi biết nó đã thua lỗ:
      $ P(C|L) = (P(C) dot P(L|C))/(P(L)) = (0,20 dot 0,08)/(0,101) = (0,016)/(0,101) = 16/101. $
      Mệnh đề cho là $15/101$. $=>$ *Sai*.

    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Trực quan hóa Bayes bằng biểu đồ thanh tích lũy chuẩn tỷ lệ thực tế
        // Tổng chiều dài là 10.1 đơn vị, tương ứng với P(L) = 0.101
        let L1 = 7.0   // 0.070 * 100
        let L2 = 1.5   // 0.015 * 100
        let L3 = 1.6   // 0.016 * 100
        let total = L1 + L2 + L3 // 10.1
        
        rect((0,0), (total, 2), fill: rgb("ffebee"), stroke: 1pt + rgb("c62828"), radius: 2pt)
        line((L1, 0), (L1, 2), stroke: (dash: "dashed", paint: rgb("c62828")))
        line((L1 + L2, 0), (L1 + L2, 2), stroke: (dash: "dashed", paint: rgb("c62828")))
        
        // Nhãn dữ liệu
        content((total/2, 2.5), text(fill: rgb("c62828"), weight: "bold")[Cấu trúc rủi ro thua lỗ toàn quỹ: $P(L) = 0,101$])
        
        content((L1/2, 1), text(size: 9pt)[$A: 0,070$])
        content((L1 + L2/2, 1), text(size: 9pt, fill: rgb("1e88e5"))[$B: 0,015$])
        content((L1 + L2 + L3/2, 1), text(size: 9pt)[$C: 0,016$])
      })
    ]

    #meo[Biểu đồ khối (Block chart) ở trên phản ánh chính xác tỉ lệ vật lý của xác suất Bayes: Tỉ lệ diện tích của khối $C$ ($0,016$) trên tổng thể toàn khối ($0,101$) chính là đáp án $16/101$ của ý D.]
  ]
)