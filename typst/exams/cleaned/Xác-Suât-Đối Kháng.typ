

#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"


// #show: stexgv-doc.with(
//   doc-type: "book",
//   title: "CHUYÊN ĐỀ: Xác Suất Đối Kháng",
//   author: "GV Nguyễn Văn Sang",
//   theme-color: classic.blue
// )

#let math-color = rgb("#000000") 
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
        SƠ ĐỒ CÂY - TÌM _x_
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
       Vấn đề hai vật chuyển động có vận tốc gặp nhau
      ]
    ]
  )
]
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

#tln( [ Trong một cuộc thi Toán, hai học sinh Minh Châu và Tiến Hân cùng đạt điểm cao nhất. Ban tổ chức quyết định chọn ra một bạn để trao thưởng đặc biệt bằng cách cho mỗi bạn cầm hai con xúc xắc cân đối đồng chất và cùng gieo, bạn nào có tổng số chấm lớn hơn thì được chọn, bằng điểm thì gieo lại. Hãy tính xác suất để bạn Minh Châu nhận được phần thưởng ngay sau lần gieo đầu tiên (làm tròn kết quả đến hàng phần trăm). ], 
[0.44],
loigiai:[ 
#ppgiai[ Tổng số chấm khi gieo hai con xúc xắc có các khả năng từ $2$ đến $12$ với số cách tương ứng là $1,2,3,4,5,6,5,4,3,2,1$. Do hai bạn gieo trong điều kiện như nhau nên xác suất Minh Châu thắng bằng xác suất Tiến Hân thắng.]
Gọi $A$ là biến cố Minh Châu nhận được phần thưởng ngay sau lần gieo đầu tiên.
Xác suất hai bạn có cùng tổng số chấm là
$
P("hòa")
= frac(1^2 + 2^2 + 3^2 + 4^2 + 5^2 + 6^2 + 5^2 + 4^2 + 3^2 + 2^2 + 1^2, 36^2)
= frac(146, 1296)
= frac(73, 648).
$
Suy ra
$
P(A)
= frac(1 - P("hòa"), 2)
= frac(1 - frac(73, 648), 2)
= frac(575, 1296)
approx 0,4437.
$
Làm tròn đến hàng phần trăm, ta được
$
P(A) approx 0,44.
$
#meo[
Vì hai người có vai trò đối xứng nên chỉ cần tính xác suất hòa, sau đó lấy nửa xác suất không hòa.
]

], )
// Á à, tôi hiểu ý thầy rồi! Giữ nguyên cái "lõi" tư duy (tính đối xứng trong trò chơi đối kháng có cửa hoà) nhưng thay cái "vỏ" đi để học sinh không học vẹt. 
// Đổi từ xúc xắc sang bốc bóng, phân bố xác suất thay đổi một chút nhưng chiến thuật giải thì y hệt. Thầy xem thử câu này nhé:
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
    [
      #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
        XÁC SUẤT ĐỐI KHÁNG THẮNG THUA
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
       Vấn đề hai vật chuyển động có vận tốc gặp nhau
      ]
    ]
  )
]
#tln(
  [Trong một buổi ngoại khoá Toán học, hai học sinh Minh Khôi và Gia Linh tham gia một trò chơi tính điểm. Ban tổ chức chuẩn bị một hộp kín chứa $4$ quả bóng giống hệt nhau được đánh số từ $1$ đến $4$. 
  
  Mỗi bạn đến lượt sẽ bốc ngẫu nhiên đồng thời $2$ quả bóng từ hộp, ghi lại tổng các số trên $2$ quả bóng đó rồi trả lại vào hộp cho người kia bốc. Người nào bốc được tổng điểm lớn hơn sẽ giành chiến thắng, nếu bằng điểm nhau thì trò chơi hoà và cả hai phải bốc lại lượt mới. Hãy tính xác suất để bạn Minh Khôi giành chiến thắng ngay sau lượt bốc đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Hộp đựng bóng
      rect((-1.8, -1.2), (1.8, 1.2), stroke: 1.5pt, fill: rgb("f5f5f5"), radius: 0.2)
      line((-1.8, 0.8), (1.8, 0.8), stroke: 1pt) // Nắp hộp
      
      // Bóng bên trong
      let draw-ball(x, y, num, c) = {
        circle((x, y), radius: 0.45, fill: c, stroke: 0.8pt)
        content((x, y), text(weight: "bold", size: 1.2em)[#num])
      }
      
      draw-ball(-0.8, -0.4, 1, rgb("ff9999"))
      draw-ball(0.3, 0.3, 2, rgb("99ff99"))
      draw-ball(-0.4, 0.4, 3, rgb("9999ff"))
      draw-ball(0.8, -0.3, 4, rgb("ffff99"))
      
      // Tay bốc (minh hoạ đơn giản bằng mũi tên)
      line((0, 2.5), (0, 1), mark: (end: "stealth", fill: black), stroke: (thickness: 1.5pt, dash: "dashed"))
      content((0, 2.8), [*Bốc 2 quả*])
    })
  ]
  ],
  [$0,39$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Xác định không gian mẫu khi bốc $2$ quả bóng từ $4$ quả.
      - *Bước 2:* Gọi $X$ và $Y$ lần lượt là tổng điểm của Minh Khôi và Gia Linh. Lập bảng phân bố xác suất cho $X$.
      - *Bước 3:* Tính xác suất cửa hoà $P(X=Y)$.
      - *Bước 4:* Áp dụng tính chất đối xứng $P(X>Y) = P(X<Y)$ để tính xác suất thắng $P(X>Y) = (1 - P(X=Y))/2$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Trục toạ độ
        line((2, 0), (8, 0), mark: (end: ">")); content((8, -0.5), $k$)
        line((2.5, -0.5), (2.5, 4), mark: (end: ">")); content((2, 4), $P(X=k)$)
        
        // Vẽ biểu đồ phân bố
        let freqs = ((3, 1), (4, 1), (5, 2), (6, 1), (7, 1))
        for f in freqs {
          let x = f.at(0)
          let y = f.at(1) * 1.5
          rect((x - 0.35, 0), (x + 0.35, y), fill: rgb("ffe0b2"), stroke: rgb("f57c00"))
          content((x, -0.5), str(x))
          content((x, y + 0.3), text(size: 8pt)[$#f.at(1)/6$])
        }
        content((5, 4.5), text(size: 9pt, fill: rgb("f57c00"))[Phân bố xác suất tổng điểm])
      })
    ]
    
    Số cách bốc đồng thời $2$ quả bóng từ $4$ quả bóng là $n(Omega) = C_4^2 = 6$.
    Gọi $X, Y$ lần lượt là tổng điểm bốc được của Minh Khôi và Gia Linh. Các giá trị có thể có của $X$ là:
    - Tổng $3$: bốc được $(1;2) => P(X=3) = 1/6$
    - Tổng $4$: bốc được $(1;3) => P(X=4) = 1/6$
    - Tổng $5$: bốc được $(1;4)$ hoặc $(2;3) => P(X=5) = 2/6$
    - Tổng $6$: bốc được $(2;4) => P(X=6) = 1/6$
    - Tổng $7$: bốc được $(3;4) => P(X=7) = 1/6$
    
    Do hai bạn bốc độc lập từ cùng một hộp (có hoàn lại) nên $X$ và $Y$ có cùng quy luật phân bố xác suất.
    Xác suất để hai bạn bốc được tổng điểm bằng nhau (trò chơi hoà) là:
    $ P(X=Y) &= P(X=3)P(Y=3) + P(X=4)P(Y=4) + P(X=5)P(Y=5) \
             &quad + P(X=6)P(Y=6) + P(X=7)P(Y=7) \
             &= (1/6)^2 + (1/6)^2 + (2/6)^2 + (1/6)^2 + (1/6)^2 \
             &= (1 + 1 + 4 + 1 + 1)/36 = 8/36 = 2/9. $
             
    Vì trò chơi hoàn toàn công bằng nên xác suất thắng của hai bạn là như nhau: $P(X>Y) = P(X<Y)$.
    Mặt khác, tổng các xác suất bằng $1$ nên ta có:
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Minh Khôi giành chiến thắng ngay sau lượt bốc đầu tiên là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 2/9)/2 = (7/9)/2 = 7/18 approx 0,3888... $
    
    Làm tròn kết quả đến hàng phần trăm, ta được $0,39$.
    
    #meo[
      Cốt lõi của những bài toán "đọ điểm" kiểu này luôn là công thức vàng: $P("Thắng") = (1 - P("Hoà")) / 2$. Thầy cô nên nhắc học trò chỉ cần tập trung tính xác suất cửa Hoà (tổng bình phương các xác suất thành phần), tránh việc liệt kê thủ công đếm số trường hợp Thắng rất dễ bị sót nghiệm.
    ]
  ]
)
#tln(
  [Trong một trò chơi dân gian dịp hội xuân, hai bạn Hải Đăng và Thảo My cùng tham gia thử thách bốc bi tính điểm. Ban tổ chức chuẩn bị một chiếc hộp kín chứa $5$ viên bi giống hệt nhau về kích thước và khối lượng, được đánh số từ $1$ đến $5$. 
  
  Mỗi bạn đến lượt sẽ bốc ngẫu nhiên đồng thời $2$ viên bi từ hộp, tính tổng các số ghi trên $2$ viên bi đó rồi trả lại vào hộp cho người kia bốc. Người nào có tổng điểm lớn hơn sẽ giành chiến thắng, nếu bằng điểm nhau thì kết quả hoà và cả hai phải bốc lại lượt mới. Hãy tính xác suất để bạn Hải Đăng giành chiến thắng ngay sau lượt bốc đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Hộp đựng bi
      rect((-2.2, -1.2), (2.2, 1.2), stroke: 1.5pt, fill: rgb("f5f5f5"), radius: 0.2)
      line((-2.2, 0.8), (2.2, 0.8), stroke: 1pt) // Nắp hộp
      
      // Bi bên trong
      let draw-ball(x, y, num, c) = {
        circle((x, y), radius: 0.45, fill: c, stroke: 0.8pt)
        content((x, y), text(weight: "bold", size: 1.2em)[#num])
      }
      
      draw-ball(-1.3, -0.4, 1, rgb("ff9999"))
      draw-ball(-0.4, -0.5, 2, rgb("99ff99"))
      draw-ball(0.5, -0.4, 3, rgb("9999ff"))
      draw-ball(-0.8, 0.4, 4, rgb("ffff99"))
      draw-ball(0.2, 0.5, 5, rgb("ffcc99"))
      
      // Mũi tên bốc bi
      line((0, 2.5), (0, 1.2), mark: (end: "stealth", fill: black), stroke: (thickness: 1.5pt, dash: "dashed"))
      content((0, 2.8), [*Bốc 2 viên*])
    })
  ]
  ],
  [$0,42$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Xác định không gian mẫu khi bốc $2$ viên bi từ $5$ viên.
      - *Bước 2:* Gọi $X$ và $Y$ lần lượt là tổng điểm của Hải Đăng và Thảo My. Lập bảng phân bố xác suất cho biến ngẫu nhiên $X$.
      - *Bước 3:* Tính xác suất cửa hoà $P(X=Y)$.
      - *Bước 4:* Áp dụng tính chất đối xứng $P(X>Y) = P(X<Y)$ để tính xác suất thắng $P(X>Y) = (1 - P(X=Y))/2$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Trục toạ độ
        line((1.5, 0), (10, 0), mark: (end: ">")); content((10, -0.5), $k$)
        line((2, -0.5), (2, 4), mark: (end: ">")); content((1.5, 4), $P(X=k)$)
        
        // Vẽ biểu đồ phân bố
        let freqs = ((3, 1), (4, 1), (5, 2), (6, 2), (7, 2), (8, 1), (9, 1))
        for f in freqs {
          let x = f.at(0)
          let y = f.at(1) * 1.5
          rect((x - 0.35, 0), (x + 0.35, y), fill: rgb("ffe0b2"), stroke: rgb("f57c00"))
          content((x, -0.5), str(x))
          content((x, y + 0.3), text(size: 8pt)[$#f.at(1)/10$])
        }
        content((6, 4.5), text(size: 9pt, fill: rgb("f57c00"))[Phân bố xác suất tổng điểm])
      })
    ]
    
    Số cách bốc đồng thời $2$ viên bi từ $5$ viên bi là $n(Omega) = C_5^2 = 10$.
    Gọi $X, Y$ lần lượt là tổng điểm bốc được của Hải Đăng và Thảo My. Các giá trị có thể có của $X$ (tổng $2$ số khác nhau từ $1$ đến $5$) là:
    - Tổng $3$: bốc được $(1;2) => P(X=3) = 1/10$
    - Tổng $4$: bốc được $(1;3) => P(X=4) = 1/10$
    - Tổng $5$: bốc được $(1;4)$ hoặc $(2;3) => P(X=5) = 2/10$
    - Tổng $6$: bốc được $(1;5)$ hoặc $(2;4) => P(X=6) = 2/10$
    - Tổng $7$: bốc được $(2;5)$ hoặc $(3;4) => P(X=7) = 2/10$
    - Tổng $8$: bốc được $(3;5) => P(X=8) = 1/10$
    - Tổng $9$: bốc được $(4;5) => P(X=9) = 1/10$
    
    Do hai bạn bốc độc lập từ cùng một hộp (có hoàn lại) nên $X$ và $Y$ độc lập và có cùng quy luật phân bố xác suất.
    Xác suất để hai bạn bốc được tổng điểm bằng nhau (trò chơi hoà) là:
    $ P(X=Y) &= P(X=3)^2 + P(X=4)^2 + P(X=5)^2 + P(X=6)^2 \ 
             &quad + P(X=7)^2 + P(X=8)^2 + P(X=9)^2 \
             &= (1/10)^2 + (1/10)^2 + (2/10)^2 + (2/10)^2 \
             &quad + (2/10)^2 + (1/10)^2 + (1/10)^2 \
             &= (1 + 1 + 4 + 4 + 4 + 1 + 1)/100 = 16/100 = 4/25. $
             
    Vì trò chơi hoàn toàn công bằng nên xác suất thắng của hai bạn là như nhau: $P(X>Y) = P(X<Y)$.
    Mặt khác, tổng các xác suất bằng $1$ nên ta có:
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Hải Đăng giành chiến thắng ngay sau lượt bốc đầu tiên là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 0,16)/2 = 0,84/2 = 0,42. $
    
    Kết quả là $0,42$.
    
    #luuy[
      Điều kiện kiên quyết để có thể áp dụng tính chất $P(X>Y) = P(X<Y)$ là hai biến ngẫu nhiên $X$ và $Y$ phải độc lập và có *cùng phân phối xác suất*. Hành động "trả lại bi vào hộp trước khi người kia bốc" chính là chìa khóa đảm bảo điều kiện này. Nếu không có chi tiết này, xác suất của người bốc sau sẽ bị phụ thuộc vào người bốc trước.
    ]
  ]
)
#tln(
  [Trong một trò chơi board game, hai bạn Tuấn và Tú thi đấu phân định thắng thua bằng xúc xắc. Mỗi bạn được phát $2$ viên xúc xắc cân đối và đồng chất. Khi đến lượt, mỗi người gieo đồng thời cả $2$ viên xúc xắc của mình và tính tổng số chấm xuất hiện trên hai mặt hướng lên trên. Người nào có tổng số chấm lớn hơn sẽ giành chiến thắng. Nếu tổng số chấm bằng nhau, hai bạn hoà và phải gieo lại lượt mới. Hãy tính xác suất để bạn Tuấn giành chiến thắng ngay sau lượt gieo đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      let draw-die(cx, cy, val, cfill) = {
         rect((cx - 0.4, cy - 0.4), (cx + 0.4, cy + 0.4), fill: cfill, stroke: 1pt, radius: 0.1)
         content((cx, cy), text(weight: "bold", size: 1.2em)[#val])
      }
      
      // Tuấn
      draw-die(-1.5, 0, 5, rgb("e0f7fa"))
      draw-die(-0.5, 0, 4, rgb("e0f7fa"))
      content((-1, -0.8), [*Tuấn*])
      
      content((1, 0), text(size: 1.5em)[$>$])
      
      // Tú
      draw-die(2.5, 0, 3, rgb("ffebee"))
      draw-die(3.5, 0, 6, rgb("ffebee"))
      content((3, -0.8), [*Tú*])
    })
  ]
  ],
  [$0,44$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Xác định không gian mẫu và quy luật phân bố xác suất cho tổng số chấm khi gieo $2$ viên xúc xắc.
      - *Bước 2:* Gọi $X, Y$ lần lượt là tổng số chấm của Tuấn và Tú. Tính xác suất xảy ra cửa hoà $P(X=Y)$ bằng tổng bình phương các xác suất thành phần.
      - *Bước 3:* Áp dụng tính chất đối xứng $P(X>Y) = P(X<Y)$ và định lý xác suất toàn phần $P(X>Y) + P(X<Y) + P(X=Y) = 1$ để suy ra xác suất chiến thắng.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        line((1, 0), (13, 0), mark: (end: ">")); content((13, -0.6), $k$)
        line((1.5, -0.5), (1.5, 7), mark: (end: ">")); content((1, 7), $P(X=k)$)
        
        let freqs = (
          (2, 1), (3, 2), (4, 3), (5, 4), (6, 5), (7, 6),
          (8, 5), (9, 4), (10, 3), (11, 2), (12, 1)
        )
        for f in freqs {
          let x = f.at(0)
          let y = f.at(1)
          rect((x - 0.4, 0), (x + 0.4, y), fill: rgb("b39ddb"), stroke: rgb("5e35b1"))
          content((x, -0.6), str(x))
          content((x, y + 0.4), text(size: 7pt)[$#f.at(1)/36$])
        }
        content((7, 7.8), text(size: 9pt, fill: rgb("5e35b1"))[Phân bố xác suất tổng số chấm của 2 xúc xắc])
      })
    ]
    
    Khi gieo $2$ viên xúc xắc cân đối đồng chất, số kết quả có thể xảy ra là $6 times 6 = 36$.
    Gọi $X, Y$ lần lượt là tổng số chấm xuất hiện của Tuấn và Tú ($X, Y in {2; 3; ...; 12}$).
    Phân bố xác suất của $X$ (cũng như của $Y$) là:
    - $P(X=2) = P(X=12) = 1/36$
    - $P(X=3) = P(X=11) = 2/36$
    - $P(X=4) = P(X=10) = 3/36$
    - $P(X=5) = P(X=9) = 4/36$
    - $P(X=6) = P(X=8) = 5/36$
    - $P(X=7) = 6/36$
    
    Xác suất để hai bạn gieo được tổng số chấm bằng nhau (kết quả hoà) là:
    $ P(X=Y) &= P(X=2)^2 + P(X=3)^2 + ... + P(X=12)^2 \
             &= 2 dot ((1/36)^2 + (2/36)^2 + (3/36)^2 + (4/36)^2 + (5/36)^2) + (6/36)^2 \
             &= (2(1 + 4 + 9 + 16 + 25) + 36)/1296 = (2 dot 55 + 36)/1296 = 146/1296 = 73/648. $
             
    Do trò chơi công bằng (hai bạn dùng xúc xắc như nhau) nên xác suất thắng của mỗi người là bằng nhau: $P(X>Y) = P(X<Y)$.
    Lại có tổng các xác suất tạo thành không gian mẫu nên:
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Tuấn giành chiến thắng ngay sau lượt gieo đầu tiên là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 73/648)/2 = (575/648)/2 = 575/1296 approx 0,4436... $
    
    Làm tròn kết quả đến hàng phần trăm, ta được $0,44$.
    
    #nhanxet[
      Đây là mô hình bài toán kinh điển về xác suất trong các trò chơi đối xứng có cửa hoà. Việc tính trực tiếp biến cố "Thắng" (đếm số các cặp trường hợp $X > Y$) sẽ vô cùng phức tạp và dễ sai sót. Chuyển sang tính xác suất "Hoà" $P(X=Y)$ bằng tổng bình phương các xác suất rồi suy ngược lại theo phần bù là tư duy ngắn gọn và chính xác nhất.
    ]
  ]
)
#tln(
  [Tại một gian hàng hội chợ Xuân, hai bạn Minh Tâm và Hải Nam cùng tham gia trò chơi "Vòng quay kỳ diệu" để giành phần thưởng. Ban tổ chức chuẩn bị một vòng quay được chia thành $4$ phần bằng nhau, ghi các số $1, 2, 3, 4$. 
  
  Mỗi bạn đến lượt sẽ quay vòng quay $2$ lần liên tiếp. Điểm số của mỗi người được tính bằng *tích* của hai số quay được trong lượt của mình. Người nào có điểm số lớn hơn sẽ giành chiến thắng, nếu điểm bằng nhau thì kết quả hoà và cả hai phải chơi lại lượt mới. Hãy tính xác suất để bạn Minh Tâm giành chiến thắng ngay sau lượt chơi đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Khung vòng quay
      circle((0,0), radius: 1.5, fill: rgb("fffde7"), stroke: (paint: rgb("fbc02d"), thickness: 2pt))
      circle((0,0), radius: 1.6, stroke: (paint: rgb("f57f17"), thickness: 3pt))
      
      // Các đường chia 4 phần
      line((-1.5,0), (1.5,0), stroke: (paint: rgb("fbc02d"), thickness: 1.5pt))
      line((0,-1.5), (0,1.5), stroke: (paint: rgb("fbc02d"), thickness: 1.5pt))
      
      // Số trên vòng quay
      content((0.6, 0.6), text(weight: "bold", size: 1.4em, fill: rgb("d32f2f"))[$1$])
      content((-0.6, 0.6), text(weight: "bold", size: 1.4em, fill: rgb("1976d2"))[$2$])
      content((-0.6, -0.6), text(weight: "bold", size: 1.4em, fill: rgb("388e3c"))[$3$])
      content((0.6, -0.6), text(weight: "bold", size: 1.4em, fill: rgb("7b1fa2"))[$4$])
      
      // Kim chỉ thị
      line((0,0), (0.7, 0.2), mark: (end: "stealth", fill: red, scale: 1.5), stroke: (paint: red, thickness: 2pt))
      circle((0,0), radius: 4pt, fill: rgb("424242"))
      
      // Chân đế vòng quay
      line((0, -1.6), (-0.8, -2.2), stroke: (paint: rgb("795548"), thickness: 3pt))
      line((0, -1.6), (0.8, -2.2), stroke: (paint: rgb("795548"), thickness: 3pt))
      line((-1, -2.2), (1, -2.2), stroke: (paint: rgb("5d4037"), thickness: 4pt))
    })
  ]
  ],
  [$0,44$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Xác định không gian mẫu khi quay $2$ lần (mỗi lần $4$ khả năng).
      - *Bước 2:* Gọi $X, Y$ lần lượt là điểm số (tích $2$ lần quay) của Minh Tâm và Hải Nam. Lập bảng phân bố xác suất cho biến ngẫu nhiên $X$. Khác với bài toán tính tổng, phép nhân sẽ tạo ra một phân bố xác suất có hình dáng đặc biệt hơn.
      - *Bước 3:* Tính xác suất cửa hoà $P(X=Y)$ bằng tổng bình phương các xác suất thành phần.
      - *Bước 4:* Áp dụng tính chất đối xứng $P(X>Y) = P(X<Y)$ để tính xác suất thắng $P(X>Y) = (1 - P(X=Y))/2$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.7cm, {
        import cetz.draw: *
        // Trục toạ độ
        line((-0.5, 0), (13, 0), mark: (end: ">")); content((13, -0.5), $k$)
        line((0, -0.5), (0, 5), mark: (end: ">")); content((-0.5, 5), $P(X=k)$)
        
        // Mảng chứa các giá trị và tần số: (giá trị thực tế, vị trí x trên trục, tần số tử số)
        let data = (
          (1, 1, 1), (2, 2.2, 2), (3, 3.4, 2), 
          (4, 4.6, 3), (6, 5.8, 2), (8, 7, 2), 
          (9, 8.2, 1), (12, 9.4, 2), (16, 10.6, 1)
        )
        
        for d in data {
          let val = d.at(0)
          let x = d.at(1)
          let y = d.at(2) * 1.2
          rect((x - 0.4, 0), (x + 0.4, y), fill: rgb("a5d6a7"), stroke: rgb("2e7d32"))
          content((x, -0.6), str(val))
          content((x, y + 0.4), text(size: 7pt)[$#d.at(2)/16$])
        }
        content((6, 5.5), text(size: 9pt, fill: rgb("2e7d32"))[Phân bố xác suất của tích 2 lần quay])
      })
    ]
    
    Mỗi bạn quay $2$ lần, mỗi lần có $4$ kết quả nên không gian mẫu của mỗi người là $4 times 4 = 16$.
    Gọi $X, Y$ lần lượt là tích số chấm của Minh Tâm và Hải Nam. 
    Các giá trị có thể có của $X$ và xác suất tương ứng:
    - Điểm $1$: $(1,1) => P(X=1) = 1/16$
    - Điểm $2$: $(1,2), (2,1) => P(X=2) = 2/16$
    - Điểm $3$: $(1,3), (3,1) => P(X=3) = 2/16$
    - Điểm $4$: $(1,4), (4,1), (2,2) => P(X=4) = 3/16$
    - Điểm $6$: $(2,3), (3,2) => P(X=6) = 2/16$
    - Điểm $8$: $(2,4), (4,2) => P(X=8) = 2/16$
    - Điểm $9$: $(3,3) => P(X=9) = 1/16$
    - Điểm $12$: $(3,4), (4,3) => P(X=12) = 2/16$
    - Điểm $16$: $(4,4) => P(X=16) = 1/16$
    
    Do hai bạn chơi hoàn toàn độc lập nên $X$ và $Y$ có cùng phân bố xác suất.
    Xác suất để hai bạn hoà nhau (cùng điểm số) là:
    $ P(X=Y) &= P(X=1)^2 + P(X=2)^2 + ... + P(X=16)^2 \
             &= (1^2 + 2^2 + 2^2 + 3^2 + 2^2 + 2^2 + 1^2 + 2^2 + 1^2)/16^2 \
             &= (1 + 4 + 4 + 9 + 4 + 4 + 1 + 4 + 1)/256 \
             &= 32/256 = 1/8. $
             
    Theo tính chất đối xứng của trò chơi công bằng, xác suất thắng của hai bạn là bằng nhau: $P(X>Y) = P(X<Y)$.
    Mặt khác ta có phương trình không gian mẫu:
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Minh Tâm giành chiến thắng ngay sau lượt đầu tiên là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 1/8)/2 = (7/8)/2 = 7/16 = 0,4375. $
    
    Làm tròn kết quả đến hàng phần trăm, ta được $0,44$.
    
    #nhanxet[
      Bài toán đã thay đổi phép toán từ "Tổng" sang "Tích". Điều này làm cho biểu đồ phân bố xác suất không còn dạng đối xứng hình chuông (đồ thị Gauss) quen thuộc như khi tính tổng xúc xắc, mà bị kéo giãn và đứt quãng ở các số nguyên tố. Tuy nhiên, điều tuyệt vời là tư duy giải bài toán bằng phần bù $P("Thắng") = (1 - P("Hoà")) / 2$ vẫn đúng đắn tuyệt đối, chứng minh sức mạnh của phương pháp sử dụng tính chất đối xứng trong Xác suất.
    ]
  ]
)
#tln(
  [Tại lễ hội toán học của trường THPT Nguyễn Hữu Cảnh, hai học sinh Tuấn Đạt và Diệu Nhi tham gia thử thách "Con số may mắn". Ban tổ chức chuẩn bị một chiếc hộp kín chứa $10$ viên bi giống hệt nhau về kích thước và khối lượng, được đánh số từ $1$ đến $10$. 
  
  Mỗi bạn đến lượt sẽ bốc ngẫu nhiên đồng thời $2$ viên bi từ hộp, tính tổng các số ghi trên $2$ viên bi đó rồi trả lại toàn bộ vào hộp cho người kia bốc. Người nào có tổng điểm lớn hơn sẽ giành phần thưởng, nếu bằng điểm nhau thì kết quả hoà và cả hai phải bốc lại lượt mới. Hãy tính xác suất để bạn Tuấn Đạt giành chiến thắng ngay sau lượt bốc đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Hộp đựng bi
      rect((-2.5, -1.5), (2.5, 1.5), stroke: 1.5pt, fill: rgb("f5f5f5"), radius: 0.2)
      line((-2.5, 1.0), (2.5, 1.0), stroke: 1pt) // Nắp hộp
      
      // Hàm vẽ bi
      let draw-ball(x, y, num, c) = {
        circle((x, y), radius: 0.38, fill: c, stroke: 0.8pt)
        content((x, y), text(weight: "bold", size: 1.1em)[#num])
      }
      
      // Vẽ 10 viên bi phân bố ngẫu nhiên trong hộp
      draw-ball(-1.8, -0.6, 1, rgb("ffadad"))
      draw-ball(-1.0, 0.2, 2, rgb("ffd6a5"))
      draw-ball(-0.2, -0.8, 3, rgb("fdffb6"))
      draw-ball(0.6, 0.4, 4, rgb("caffbf"))
      draw-ball(1.6, -0.5, 5, rgb("9bf6ff"))
      draw-ball(-1.4, 0.6, 6, rgb("a0c4ff"))
      draw-ball(0.0, 0.0, 7, rgb("bdb2ff"))
      draw-ball(1.0, -0.7, 8, rgb("ffc6ff"))
      draw-ball(1.8, 0.5, 9, rgb("fffffc"))
      draw-ball(0.8, 0.6, 10, rgb("f08080"))
      
      // Mũi tên bốc bi
      line((0, 2.5), (0, 1.2), mark: (end: "stealth", fill: black), stroke: (thickness: 1.5pt, dash: "dashed"))
      content((0, 2.8), [*Bốc 2 viên*])
    })
  ]
  ],
  [$0,46$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Tính số phần tử của không gian mẫu khi bốc $2$ viên bi từ $10$ viên.
      - *Bước 2:* Gọi $X$ và $Y$ lần lượt là tổng điểm của Tuấn Đạt và Diệu Nhi. Xác định các giá trị có thể có của $X$ và thống kê tần số (số cách bốc) cho mỗi mức điểm. Bài toán tăng số lượng bi nên việc lập bảng thống kê cần cẩn thận để không sót trường hợp.
      - *Bước 3:* Tính xác suất cửa hoà $P(X=Y) = (sum f_i^2) / n(Omega)^2$.
      - *Bước 4:* Áp dụng tính đối xứng $P(X>Y) = (1 - P(X=Y))/2$ để tìm đáp án.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.45cm, {
        import cetz.draw: *
        // Trục toạ độ
        line((1, 0), (21, 0), mark: (end: ">")); content((21, -1), $k$)
        line((2, -0.5), (2, 7.5), mark: (end: ">")); content((1, 7.5), $P(X=k)$)
        
        // Mảng chứa giá trị tổng (k) và tần số (số cách bốc được tổng đó)
        let freqs = (
          (3, 1), (4, 1), (5, 2), (6, 2), (7, 3), (8, 3), (9, 4), (10, 4),
          (11, 5), (12, 4), (13, 4), (14, 3), (15, 3), (16, 2), (17, 2), (18, 1), (19, 1)
        )
        
        for f in freqs {
          let x = f.at(0)
          let y = f.at(1) * 1.2
          rect((x - 0.35, 0), (x + 0.35, y), fill: rgb("bbdefb"), stroke: rgb("1976d2"))
          content((x, -1), text(size: 8pt)[#str(x)])
          content((x, y + 0.6), text(size: 6pt)[$#f.at(1)/45$])
        }
        content((11, 8.5), text(size: 9pt, fill: rgb("1976d2"))[Phân bố xác suất tổng điểm 2 viên bi])
      })
    ]
    
    Số cách bốc đồng thời $2$ viên bi từ $10$ viên bi là $n(Omega) = C_10^2 = 45$.
    Gọi $X, Y$ lần lượt là tổng điểm bốc được của Tuấn Đạt và Diệu Nhi. 
    Các giá trị có thể có của $X$ chạy từ $1+2=3$ đến $9+10=19$. 
    Thống kê tần số (số cặp bi) cho mỗi tổng $X=k$ như sau:
    - Tổng $3, 4, 18, 19$: mỗi tổng có $1$ cặp.
    - Tổng $5, 6, 16, 17$: mỗi tổng có $2$ cặp.
    - Tổng $7, 8, 14, 15$: mỗi tổng có $3$ cặp.
    - Tổng $9, 10, 12, 13$: mỗi tổng có $4$ cặp.
    - Tổng $11$: có $5$ cặp (gồm $(1;10), (2;9), (3;8), (4;7), (5;6)$).
    
    Do hai bạn bốc độc lập từ cùng một hộp (có hoàn lại) nên $X$ và $Y$ độc lập, cùng phân phối.
    Xác suất để hai bạn bốc được tổng điểm bằng nhau (kết quả hoà) là tổng bình phương các xác suất thành phần:
    $ P(X=Y) &= sum_(k=3)^19 P(X=k)^2 \
             &= (2 dot (1^2 + 1^2 + 2^2 + 2^2 + 3^2 + 3^2 + 4^2 + 4^2) + 5^2) / 45^2 \
             &= (2 dot (1 + 1 + 4 + 4 + 9 + 9 + 16 + 16) + 25) / 2025 \
             &= (2 dot 60 + 25) / 2025 = 145 / 2025 = 29 / 405. $
             
    Vì trò chơi công bằng nên xác suất chiến thắng của hai bạn là như nhau: $P(X>Y) = P(X<Y)$.
    Mặt khác, tổng xác suất các biến cố luôn bằng $1$:
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Tuấn Đạt giành chiến thắng ngay sau lượt bốc đầu tiên là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 29/405)/2 = (376/405)/2 = 188/405 approx 0,4641... $
    
    Làm tròn kết quả đến hàng phần trăm, ta được $0,46$.
    
    #nhanxet[
      Khi quy mô bài toán tăng lên (từ $5$ bi lên $10$ bi), nếu học sinh không nắm vững phương pháp $P("Thắng") = (1 - P("Hoà")) / 2$ mà cắm đầu đi liệt kê các trường hợp $X > Y$ thì chắc chắn sẽ "lạc trôi" giữa phòng thi. 
      Ngoài ra, việc nhận diện tính đối xứng của biểu đồ phân bố (tần số của tổng $k$ bằng tần số của tổng $22-k$) giúp rút ngắn một nửa thời gian tính tổng bình phương $sum f_i^2$. Học trò nên lưu ý "cái bẫy" tính toán này để tối ưu tốc độ làm bài.
    ]
  ]
)
#tln(
  [Trong một buổi sinh hoạt câu lạc bộ Toán học, hai học sinh Gia Huy và Bảo Ngọc lọt vào vòng chung kết. Ban tổ chức quyết định phân định người chiến thắng bằng cách cho mỗi bạn tung $3$ đồng xu cân đối và đồng chất. Bạn nào tung được nhiều mặt sấp (S) hơn sẽ giành chiến thắng, nếu số mặt sấp bằng nhau thì cả hai cùng tung lại. Hãy tính xác suất để bạn Gia Huy giành chiến thắng ngay sau lần tung đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      let draw-coin(x, y, text-face, color-fill) = {
        circle((x, y), radius: 0.4, fill: color-fill, stroke: rgb("b8860b") + 1pt)
        circle((x, y), radius: 0.32, stroke: rgb("b8860b") + 0.5pt)
        content((x, y), text(weight: "bold", fill: rgb("8b6508"))[#text-face])
      }
      
      // Gia Huy
      draw-coin(0, 0, "S", rgb("ffd700"))
      draw-coin(1, 0, "S", rgb("ffd700"))
      draw-coin(2, 0, "N", rgb("e0e0e0"))
      content((1, -0.8), [*Gia Huy*])
      
      content((3.5, 0), text(size: 1.5em)[$>$])
      
      // Bảo Ngọc
      draw-coin(5, 0, "S", rgb("ffd700"))
      draw-coin(6, 0, "N", rgb("e0e0e0"))
      draw-coin(7, 0, "N", rgb("e0e0e0"))
      content((6, -0.8), [*Bảo Ngọc*])
    })
  ]
  ],
  [$0,34$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Gọi $X$ và $Y$ lần lượt là số mặt sấp (S) mà Gia Huy và Bảo Ngọc tung được. Xác định phân bố xác suất của $X$ và $Y$.
      - *Bước 2:* Tính xác suất để hai bạn tung được số mặt sấp bằng nhau $P(X=Y)$.
      - *Bước 3:* Dựa vào tính đối xứng $P(X>Y) = P(X<Y)$ và biến cố tổng quát $P(X>Y) + P(X<Y) + P(X=Y) = 1$, ta tính được xác suất Gia Huy chiến thắng ngay lần đầu là $P(X>Y) = (1 - P(X=Y)) / 2$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        line((-0.5,0), (4.5,0), mark: (end: ">")); content((4.5, -0.5), $k$)
        line((0,-0.5), (0,3.5), mark: (end: ">")); content((-0.8, 3.5), $P(X=k)$)
        
        let freqs = (1, 3, 3, 1)
        for i in range(4) {
          let y = freqs.at(i) * 0.8 
          rect((i - 0.25, 0), (i + 0.25, y), fill: rgb("90caf9"), stroke: rgb("1565c0"))
          content((i, -0.5), str(i))
          // Đã fix lỗi truyền 3 tham số vào hàm content và lỗi nối chuỗi
          content((i, y + 0.3), text(size: 8pt)[$#freqs.at(i)/8$])
        }
        // Đã fix cách gộp style text vào tham số body
        content((2, 4), text(size: 9pt, fill: rgb("1565c0"))[Phân bố xác suất số mặt Sấp])
      })
    ]
    
    Gọi $X, Y$ lần lượt là số mặt sấp mà Gia Huy và Bảo Ngọc tung được khi gieo $3$ đồng xu. 
    Ta có $X, Y in {0; 1; 2; 3}$ và tuân theo quy luật phân bố nhị thức với xác suất thành công $p = 1/2$.
    Bảng phân bố xác suất của $X$ (tương tự với $Y$):
    - $P(X=0) = C_3^0 (1/2)^3 = 1/8$
    - $P(X=1) = C_3^1 (1/2)^3 = 3/8$
    - $P(X=2) = C_3^2 (1/2)^3 = 3/8$
    - $P(X=3) = C_3^3 (1/2)^3 = 1/8$
    
    Xác suất để hai bạn tung được số mặt sấp bằng nhau (phải tung lại) là:
    $ P(X=Y) &= P(X=0)P(Y=0) + P(X=1)P(Y=1) + P(X=2)P(Y=2) + P(X=3)P(Y=3) \
             &= (1/8)^2 + (3/8)^2 + (3/8)^2 + (1/8)^2 \
             &= (1 + 9 + 9 + 1)/64 = 20/64 = 5/16. $
    
    Vì hai bạn sử dụng đồng xu giống hệt nhau nên trò chơi công bằng, do đó xác suất thắng của mỗi người là như nhau: $P(X>Y) = P(X<Y)$.
    Mặt khác, tổng các trường hợp tạo thành không gian mẫu nên ta luôn có: 
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Gia Huy giành chiến thắng ngay sau lần tung đầu tiên ($X>Y$) là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 5/16)/2 = 11/32 = 0,34375. $
    
    Làm tròn kết quả đến hàng phần trăm, ta được $0,34$.
    
    #nhanxet[
      Bài toán khai thác tính chất đối xứng của các biến cố độc lập, cùng phân phối. Việc áp dụng tính chất $P(X>Y) = P(X<Y)$ giúp tránh phải liệt kê và tính tổng nhiều trường hợp rời rạc, tiết kiệm tối đa thời gian tính toán trong phòng thi.
    ]
  ]
)

#tln(
  [Trong một buổi sinh hoạt ngoại khóa, hai bạn Hoàng Nam và Khánh Huyền cùng tham gia một trò chơi mang tên "Khoảng cách may mắn". Ban tổ chức chuẩn bị một hộp kín chứa $5$ tấm thẻ giống hệt nhau, được đánh số từ $1$ đến $5$. 
  
  Mỗi bạn đến lượt sẽ bốc ngẫu nhiên đồng thời $2$ tấm thẻ từ hộp, tính *hiệu số tuyệt đối* (khoảng cách) giữa hai số ghi trên thẻ rồi trả lại toàn bộ vào hộp cho người kia bốc. Người nào có hiệu số lớn hơn sẽ giành chiến thắng, nếu hiệu số bằng nhau thì kết quả hoà và cả hai phải chơi lại lượt mới. Hãy tính xác suất để bạn Hoàng Nam giành chiến thắng ngay sau lượt bốc đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Vẽ 5 thẻ bài
      let draw-card(cx, cy, val, cfill) = {
        rect((cx - 0.4, cy - 0.6), (cx+0.4, cy+0.6), fill: cfill, stroke: 1.5pt, radius: 0.1)
        content((cx, cy), text(weight: "bold", size: 1.3em)[#val])
      }
      
      draw-card(-2.4, 0, 1, rgb("ffcdd2"))
      draw-card(-1.2, 0, 2, rgb("f8bbd0"))
      draw-card(0, 0, 3, rgb("e1bee7"))
      draw-card(1.2, 0, 4, rgb("d1c4e9"))
      draw-card(2.4, 0, 5, rgb("c5cae9"))
      
      // Minh hoạ thao tác bốc 2 thẻ
      line((-0.5, 1.6), (-0.5, 0.8), mark: (end: "stealth", fill: black), stroke: (thickness: 1.5pt, dash: "dashed"))
      line((0.5, 1.6), (0.5, 0.8), mark: (end: "stealth", fill: black), stroke: (thickness: 1.5pt, dash: "dashed"))
      content((0, 1.9), [*Bốc 2 thẻ bất kỳ*])
    })
  ]
  ],
  [$0,35$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Tính số phần tử của không gian mẫu khi bốc $2$ thẻ từ $5$ thẻ.
      - *Bước 2:* Gọi $X$ và $Y$ lần lượt là hiệu số tuyệt đối của Hoàng Nam và Khánh Huyền. Xác định các giá trị có thể có của $X$ và thống kê tần số. Lưu ý: Phép tính "hiệu số" (khoảng cách) sẽ tạo ra một phân bố xác suất có dạng bậc thang đi xuống rất thú vị, khác hẳn với phép cộng hay phép nhân.
      - *Bước 3:* Tính xác suất cửa hoà $P(X=Y) = sum P(X=k)^2$.
      - *Bước 4:* Áp dụng tính đối xứng $P(X>Y) = (1 - P(X=Y))/2$ để tìm xác suất thắng.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Trục toạ độ
        line((0, 0), (6, 0), mark: (end: ">")); content((6, -0.5), $k$)
        line((0.5, -0.5), (0.5, 5.5), mark: (end: ">")); content((0, 5.5), $P(X=k)$)
        
        // Mảng chứa giá trị hiệu số (k) và tần số (số cách bốc)
        let freqs = ((1, 4), (2, 3), (3, 2), (4, 1))
        
        for f in freqs {
          let x = f.at(0)
          let y = f.at(1)
          rect((x - 0.35, 0), (x + 0.35, y), fill: rgb("b2dfdb"), stroke: rgb("00796b"))
          content((x, -0.5), str(x))
          content((x, y + 0.4), text(size: 8pt)[$#y/10$])
        }
        content((3, 5), text(size: 9pt, fill: rgb("00796b"))[Phân bố xác suất hiệu số tuyệt đối])
      })
    ]
    
    Số cách bốc đồng thời $2$ tấm thẻ từ $5$ tấm thẻ là $n(Omega) = C_5^2 = 10$.
    Gọi $X, Y$ lần lượt là hiệu số tuyệt đối bốc được của Hoàng Nam và Khánh Huyền. 
    Các giá trị có thể có của $X$ là $1, 2, 3, 4$. Ta thống kê số cặp thẻ tạo ra từng hiệu số:
    - Hiệu số $1$: $(1;2), (2;3), (3;4), (4;5) =>$ có $4$ cặp $=> P(X=1) = 4/10$.
    - Hiệu số $2$: $(1;3), (2;4), (3;5) =>$ có $3$ cặp $=> P(X=2) = 3/10$.
    - Hiệu số $3$: $(1;4), (2;5) =>$ có $2$ cặp $=> P(X=3) = 2/10$.
    - Hiệu số $4$: $(1;5) =>$ có $1$ cặp $=> P(X=4) = 1/10$.
    
    Do hai bạn bốc độc lập từ cùng một hộp (có hoàn lại) nên $X$ và $Y$ độc lập và có cùng quy luật phân bố xác suất.
    Xác suất để hai bạn bốc được hiệu số bằng nhau (kết quả hoà) là:
    $ P(X=Y) &= P(X=1)^2 + P(X=2)^2 + P(X=3)^2 + P(X=4)^2 \
             &= (4/10)^2 + (3/10)^2 + (2/10)^2 + (1/10)^2 \
             &= (16 + 9 + 4 + 1) / 100 \
             &= 30 / 100 = 0,3. $
             
    Vì trò chơi công bằng nên xác suất chiến thắng của hai bạn là như nhau: $P(X>Y) = P(X<Y)$.
    Mặt khác, tổng xác suất các biến cố luôn bằng $1$:
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Hoàng Nam giành chiến thắng ngay sau lượt bốc đầu tiên là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 0,3)/2 = 0,7 / 2 = 0,35. $
    
    Kết quả là $0,35$.
    
    #meo[
      Bài toán này đổi "khẩu vị" bằng cách sử dụng phép trừ (khoảng cách) thay vì phép cộng hay nhân. Điểm độc đáo nằm ở biểu đồ phân bố xác suất: nó tạo thành một dải bậc thang tuyến tính đi xuống rất đẹp mắt thay vì hình tháp đối xứng. Tuy nhiên, bất chấp hình dáng phân bố có thay đổi ra sao, *định lý về tính đối xứng trong trò chơi đối kháng* $P("Thắng") = (1 - P("Hoà")) / 2$ vẫn là chiếc "chìa khoá vạn năng" giải quyết bài toán trong vòng 3 nốt nhạc!
    ]
  ]
)

#tln(
  [Tại một gian hàng trò chơi Toán học, hai bạn Bảo Long và Nhã Kỳ cùng tham gia thử thách "Đỉnh cao xúc xắc". Ban tổ chức chuẩn bị cho mỗi người $2$ viên xúc xắc hình tứ diện đều (xúc xắc $4$ mặt), trên các mặt ghi các số $1, 2, 3, 4$. 
  
  Mỗi bạn đến lượt sẽ gieo đồng thời cả $2$ viên xúc xắc của mình. Điểm số của mỗi người được tính là *số lớn nhất* trong hai số xuất hiện trên mặt đáy của $2$ viên xúc xắc. Người nào có điểm số lớn hơn sẽ giành chiến thắng, nếu điểm bằng nhau thì kết quả hoà và cả hai phải gieo lại. Hãy tính xác suất để bạn Bảo Long giành chiến thắng ngay sau lượt gieo đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Hàm vẽ xúc xắc tứ diện (nhìn từ trên xuống/nghiêng)
      let draw-tetra(cx, cy, val, cfill, cstroke) = {
        let p1 = (cx, cy + 0.6)
        let p2 = (cx - 0.7, cy - 0.4)
        let p3 = (cx + 0.7, cy - 0.4)
        let p4 = (cx, cy - 0.1) // đỉnh chóp
        
        line(p1, p2, p3, close: true, fill: cfill, stroke: cstroke + 1pt)
        line(p1, p4, stroke: cstroke + 0.8pt)
        line(p2, p4, stroke: cstroke + 0.8pt)
        line(p3, p4, stroke: cstroke + 0.8pt)
        
        content((cx, cy - 0.45), text(weight: "bold", size: 1.1em, fill: cstroke)[#val])
      }
      
      // Bảo Long
      draw-tetra(-2, 0, 3, rgb("e3f2fd"), rgb("1565c0"))
      draw-tetra(-0.5, 0, 2, rgb("e3f2fd"), rgb("1565c0"))
      content((-1.25, -1), [*Bảo Long*])
      
      content((1, 0), text(size: 1.5em)[$>$])
      
      // Nhã Kỳ
      draw-tetra(2.5, 0, 1, rgb("fce4ec"), rgb("c2185b"))
      draw-tetra(4, 0, 1, rgb("fce4ec"), rgb("c2185b"))
      content((3.25, -1), [*Nhã Kỳ*])
    })
  ]
  ],
  [$0,34$],
  loigiai: [
    #ppgiai[
      -  *Bước 1:* Xác định không gian mẫu khi gieo $2$ viên xúc xắc tứ diện (mỗi viên có $4$ mặt).
      -  *Bước 2:* Gọi $X, Y$ lần lượt là điểm số (giá trị lớn nhất trong $2$ mặt đáy) của Bảo Long và Nhã Kỳ. Lập bảng phân bố xác suất cho biến ngẫu nhiên $X$. Phép lấy *max* sẽ làm cho các giá trị lớn xuất hiện với tần suất cao hơn.
      -  *Bước 3:* Tính xác suất xảy ra cửa hoà $P(X=Y)$.
      -  *Bước 4:* Áp dụng tính chất đối xứng $P(X>Y) = P(X<Y)$ để tính xác suất thắng $P(X>Y) = (1 - P(X=Y))/2$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Trục toạ độ
        line((-0.5, 0), (6, 0), mark: (end: ">")); content((6, -0.5), $k$)
        line((0, -0.5), (0, 5), mark: (end: ">")); content((-0.5, 5), $P(X=k)$)
        
        // Mảng chứa giá trị k và tần số (số cách gieo ra max = k)
        let data = ((1, 1), (2, 3), (3, 5), (4, 7))
        
        for d in data {
          let x = d.at(0)
          let y = d.at(1) * 0.5
          rect((x - 0.35, 0), (x + 0.35, y), fill: rgb("ffe082"), stroke: rgb("ff8f00"))
          content((x, -0.5), str(x))
          content((x, y + 0.3), text(size: 8pt)[$#d.at(1)/16$])
        }
        content((2.5, 5.2), text(size: 9pt, fill: rgb("ff8f00"))[Phân bố xác suất của giá trị lớn nhất (max)])
      })
    ]
    
    Khi gieo $2$ viên xúc xắc $4$ mặt, số kết quả có thể xảy ra là $4 times 4 = 16$.
    Gọi $X, Y$ lần lượt là điểm số của Bảo Long và Nhã Kỳ. Giá trị của $X$ là số lớn nhất trong $2$ lần gieo, $X in {1; 2; 3; 4}$.
    Thống kê số trường hợp cho từng giá trị của $X$:
    -  $X = 1$: Chỉ có cách gieo $(1;1) =>$ có $1$ trường hợp $=> P(X=1) = 1/16$.
    -  $X = 2$: Gồm $(1;2), (2;1), (2;2) =>$ có $3$ trường hợp $=> P(X=2) = 3/16$.
    -  $X = 3$: Có $5$ trường hợp (các cặp chứa số $3$ và không chứa số $4$) $=> P(X=3) = 5/16$.
    -  $X = 4$: Có $7$ trường hợp (các cặp chứa ít nhất một số $4$) $=> P(X=4) = 7/16$.
    
    Do hai bạn gieo độc lập với các viên xúc xắc giống nhau nên $X$ và $Y$ có cùng phân bố xác suất.
    Xác suất để hai bạn hoà nhau (cùng điểm số) là tổng bình phương các xác suất thành phần:
    $ P(X=Y) &= P(X=1)^2 + P(X=2)^2 + P(X=3)^2 + P(X=4)^2 \
             &= (1^2 + 3^2 + 5^2 + 7^2) / 16^2 \
             &= (1 + 9 + 25 + 49) / 256 \
             &= 84 / 256 = 21 / 64. $
             
    Vì trò chơi đối xứng và hoàn toàn công bằng nên xác suất thắng của hai bạn là bằng nhau: $P(X>Y) = P(X<Y)$.
    Mặt khác ta có định lý xác suất toàn phần:
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Bảo Long giành chiến thắng ngay sau lượt gieo đầu tiên là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 21/64)/2 = (43/64)/2 = 43/128 approx 0,3359... $
    
    Làm tròn kết quả đến hàng phần trăm, ta được $0,34$.
    
    #nhanxet[
      Việc thay đổi quy tắc tính điểm từ *tổng* sang lấy *giá trị lớn nhất* (hàm max) tạo ra một phân bố xác suất tăng dần đều rất đặc trưng (dãy số lẻ $1, 3, 5, 7$). Bất chấp việc phân bố này lệch hẳn về một phía (không đối xứng như hình chuông của phép cộng), tính công bằng của trò chơi vẫn được bảo toàn. Nhờ đó, tuyệt chiêu dùng phần bù $P("Thắng") = (1 - P("Hoà") / 2$ vẫn hoạt động hoàn hảo và là lối đi duy nhất giúp giải bài toán thần tốc.
    ]
  ]
)