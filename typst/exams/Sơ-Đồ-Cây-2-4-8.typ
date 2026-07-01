

#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
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
//

#ds(
  [Một công ty bảo hiểm thực hiện thống kê trên $20.000$ khách hàng đăng ký. Các khách hàng được phân loại dựa trên ba tiêu chí độc lập:
  - Độ tuổi: Trẻ hoặc Già;
  - Giới tính: Nam hoặc Nữ;
  - Tình trạng hôn nhân: Đã lập gia đình hoặc Độc thân.
  Dữ liệu thống kê thu được như sau: có $6.300$ người trẻ; $9.600$ nam giới; $13.800$ người đã lập gia đình. Ngoài ra, các nhóm kết hợp bao gồm: $2.700$ nam giới trẻ; $6.400$ nam giới đã lập gia đình; $2.900$ người trẻ đã lập gia đình và $1.100$ nam giới trẻ đã lập gia đình.],
  (
    [Công ty có tất cả $6.800$ khách hàng là đàn ông già],
    True([Có tất cả $6.200$ khách hàng độc thân và $10.400$ khách hàng là phụ nữ]),
    [Xác suất để chọn ngẫu nhiên một khách hàng là phụ nữ trẻ và độc thân là $9,2%$],
    True([Biết rằng một người trẻ được chọn đã lập gia đình, xác suất người đó là đàn ông xấp xỉ $0,38$ (sai số không quá $0,01$)])
  ),
  loigiai: [
    #ppgiai[
      - Phân tích số liệu bài toán bằng sơ đồ cây để dễ dàng bóc tách các nhóm tập hợp.
      - Vận dụng phần bù: $n(overline(A)) = n(Omega) - n(A)$.
      - Xác suất có điều kiện $P(A|B) = (n(A ∩ B)) / (n(B))$.
    ]
    
    Ký hiệu tổng số khách hàng là $n(Omega) = 20000$. Theo giả thiết:
    - Tổng số người trẻ: $n(T) = 6300 =>$ Người già: $20000 - 6300 = 13700$.
    - Tổng số nam: $n(N) = 9600 =>$ Số nữ: $20000 - 9600 = 10400$.
    - Tổng số đã lập gia đình: $n(D) = 13800 =>$ Độc thân: $20000 - 13800 = 6200$.
    
    Từ các dữ kiện kết hợp, ta xây dựng sơ đồ cây phân nhánh cho nhóm *Người trẻ* ($6300$ người):
    
    #align(center)[
      #cetz.canvas(length: 1.1cm, {
        import cetz.draw: *
        // Nodes chính
        content((0, 0), [Khách hàng \ ($20000$)], name: "root")
        
        content((3, 1.5), [Trẻ \ ($6300$)], name: "T")
        content((3, -1.5), [Già \ ($13700$)], name: "G")
        
        content((6.5, 3), [Nam ($2700$)], name: "TN")
        content((6.5, 0), [Nữ ($3600$)], name: "TNu")
        
        content((11.5, 4), [Gia đình ($1100$)], name: "TND")
        content((11.5, 2), [Độc thân ($1600$)], name: "TNDT")
        
        content((11.5, 1), [Gia đình ($1800$)], name: "TNuD")
        content((11.5, -1), [Độc thân ($1800$)], name: "TNuDT")
        
        // Cạnh nối và số liệu tính toán
        line("root", "T", mark: (end: ">"), stroke: 0.8pt)
        line("root", "G", mark: (end: ">"), stroke: 0.8pt)
        
        line("T", "TN", mark: (end: ">"), stroke: (paint: blue, thickness: 1pt))
        line("T", "TNu", mark: (end: ">"), stroke: (paint: orange, thickness: 1pt))
        content((4.8, 2.5), [$2700$ (gt)], anchor: "south-east", angle: 23deg, padding: 0.15, fill: blue, size: 9pt)
        content((4.8, 0.5), [$6300-2700$], anchor: "north-east", angle: -23deg, padding: 0.15, fill: orange, size: 9pt)
        
        line("TN", "TND", mark: (end: ">"), stroke: 0.8pt)
        line("TN", "TNDT", mark: (end: ">"), stroke: 0.8pt)
        content((9, 3.65), [$1100$ (gt)], anchor: "south-east", angle: 11deg, padding: 0.15, fill: blue, size: 9pt)
        content((9, 2.35), [$2700-1100$], anchor: "north-east", angle: -11deg, padding: 0.15, fill: blue, size: 9pt)
        
        line("TNu", "TNuD", mark: (end: ">"), stroke: 0.8pt)
        line("TNu", "TNuDT", mark: (end: ">"), stroke: (paint: red, thickness: 1pt))
        content((9, 0.65), [$2900-1100$], anchor: "south-east", angle: 11deg, padding: 0.15, fill: red, size: 9pt)
        content((9, -0.65), [$3600-1800$], anchor: "north-east", angle: -11deg, padding: 0.15, fill: red, size: 9pt)
      })
    ]

    *Giải thích chi tiết các nhánh:*
    - Số nam trẻ là $2700$, nên số nữ trẻ là $6300 - 2700 = 3600$.
    - Số nam trẻ đã lập gia đình là $1100$, nên số nam trẻ độc thân là $2700 - 1100 = 1600$.
    - Tổng số người trẻ đã lập gia đình là $2900$ (theo giả thiết), suy ra số nữ trẻ đã lập gia đình là $2900 - 1100 = 1800$.
    - Từ đó, số nữ trẻ độc thân là $3600 - 1800 = 1800$.

    Dựa vào phân tích trên, ta xét các phát biểu:
    - *Ý a) Sai.* Số khách hàng là đàn ông già bằng tổng số nam trừ đi số nam trẻ:
      $ 9600 - 2700 = 6900. $
      (Khác với số liệu $6.800$ đề cho).
      
    - *Ý b) Đúng.* Theo tính toán phần bù ban đầu:
      - Số khách hàng độc thân: $20000 - 13800 = 6200$.
      - Số khách hàng nữ: $20000 - 9600 = 10400$.
      
    - *Ý c) Sai.* Từ sơ đồ cây (nhánh màu đỏ), số phụ nữ trẻ độc thân là $1800$. Xác suất chọn được người này là:
      $ P = 1800/20000 = 9/100 = 9%. $
      (Khác với $9,2%$).

    - *Ý d) Đúng.* Xét trong nhóm "người trẻ đã lập gia đình" (có $2900$ người), số lượng đàn ông là $1100$. Xác suất cần tìm là xác suất có điều kiện:
      $ P = 1100/2900 = 11/29 approx 0,3793. $
      Giá trị này xấp xỉ $0,38$ với sai số là $|0,3793 - 0,38| = 0,0007 <= 0,01$.
      
    #luuy[
      Trong các bài toán xác suất có điều kiện $P(A|B)$, không gian mẫu sẽ bị thu hẹp lại thành số phần tử của tập $B$. Cụ thể ở ý d, khi đề bài nhấn mạnh "Biết rằng một người trẻ được chọn đã lập gia đình", ta chỉ được phép chia cho $n(B) = 2900$ thay vì chia cho tổng số $20000$ khách hàng.
    ]
  ]
)

#tln(
  [Có hai hộp bi, hộp I có $5$ bi trắng và $7$ bi đỏ, hộp II có $10$ bi trắng và $15$ bi đỏ. Lấy ngẫu nhiên hai viên bi từ hộp I chuyển sang hộp II. Sau đó, từ hộp II lấy ngẫu nhiên $1$ viên bi thì được bi trắng. Xác suất để $2$ bi chuyển từ hộp I sang hộp II không cùng màu là bao nhiêu (làm tròn đến hàng phần trăm).],
  [$0,54$],
  loigiai: [
    #ppgiai[
      - Vẽ sơ đồ cây biểu diễn 2 giai đoạn: Chuyển 2 bi từ Hộp I sang Hộp II $=>$ Rút 1 bi từ Hộp II.
      - Tính xác suất chuyển bi: Không gian mẫu $C_12^2 = 66$. Các nhánh sẽ có xác suất lần lượt là $C_5^2/66, (C_5^1 dot C_7^1)/66, C_7^2/66$.
      - Khi chuyển bi xong, tổng số bi ở Hộp II luôn là $25 + 2 = 27$ viên. Số bi trắng sẽ thay đổi tùy theo nhánh.
      - Áp dụng công thức Bayes (hoặc định nghĩa trên sơ đồ cây): 
        $ P("Chuyển khác màu" | "Rút được bi Trắng") = ("Xác suất nhánh: Khác màu  VÀ  Rút Trắng") / ("Tổng các nhánh Rút được bi Trắng") $
    ]
    
    #import "@preview/cetz:0.3.2"
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // Gốc
        content((0, 0), text(weight: "bold")[Hộp I
($5"T", 7"Đ"$)], name: "root")

        // Tầng 1: Chuyển 2 bi
        content((4, 4), text(fill: blue, weight: "bold")[Chuyển 2T
#text(size: 0.8em)[Hộp II: 12T, 15Đ]], name: "2T")
        content((4, 0), text(fill: purple, weight: "bold")[Chuyển 1T, 1Đ
#text(size: 0.8em)[Hộp II: 11T, 16Đ]], name: "1T1D")
        content((4, -4), text(fill: red, weight: "bold")[Chuyển 2Đ
#text(size: 0.8em)[Hộp II: 10T, 17Đ]], name: "2D")

        // Tầng 2: Rút 1 bi từ Hộp II (Chỉ làm nổi bật nhánh rút bi Trắng vì đề cho biết đã rút được bi Trắng)
        content((9, 5), text(fill: blue, weight: "bold")[Rút được 1T], name: "2T_T")
        content((9, 3), text(fill: gray)[Rút được 1Đ], name: "2T_D")

        content((9, 1), text(fill: blue, weight: "bold")[Rút được 1T], name: "1T1D_T")
        content((9, -1), text(fill: gray)[Rút được 1Đ], name: "1T1D_D")

        content((9, -3), text(fill: blue, weight: "bold")[Rút được 1T], name: "2D_T")
        content((9, -5), text(fill: gray)[Rút được 1Đ], name: "2D_D")

        // Hàm vẽ nhánh
        let conn(from, to, text, color: black, pos: "north") = {
          line(from, to, mark: (end: ">"), stroke: (paint: color, thickness: 1.2pt), name: "e_" + from + "_" + to)
          content("e_" + from + "_" + to + ".mid", text, anchor: pos, padding: 5pt, angle: "e_" + from + "_" + to)
        }

        // Nhánh tầng 1
        conn("root", "2T", text(fill: blue)[$10/66$], color: blue.lighten(30%))
        conn("root", "1T1D", text(fill: purple)[$35/66$], color: purple.lighten(30%), pos: "south")
        conn("root", "2D", text(fill: red)[$21/66$], color: red.lighten(30%), pos: "north")

        // Nhánh tầng 2 (Tô đậm các nhánh dẫn đến rút được bi Trắng)
        conn("2T", "2T_T", text(fill: blue, weight: "bold")[$12/27$], color: blue, pos: "south")
        conn("2T", "2T_D", text(fill: gray)[$15/27$], color: gray, pos: "north")

        conn("1T1D", "1T1D_T", text(fill: blue, weight: "bold")[$11/27$], color: blue, pos: "south")
        conn("1T1D", "1T1D_D", text(fill: gray)[$16/27$], color: gray, pos: "north")

        conn("2D", "2D_T", text(fill: blue, weight: "bold")[$10/27$], color: blue, pos: "south")
        conn("2D", "2D_D", text(fill: gray)[$17/27$], color: gray, pos: "north")
        
        // Kết quả các nhánh bi Trắng
        content((11.5, 5), text(fill: blue, weight: "bold")[$120/(66 dot 27)$])
        content((11.5, 1), text(fill: purple, weight: "bold")[$385/(66 dot 27)$])
        content((11.5, -3), text(fill: red, weight: "bold")[$210/(66 dot 27)$])
        
        // Chú thích
        content((11.5, 6), text(weight: "bold")[Xác suất nhánh])
      })
    ]

    - Nhìn vào sơ đồ cây, biến cố $B$: "Cuối cùng rút được bi Trắng" là tổng của 3 nhánh (các kết quả được tô đậm ở cột cuối):
      $ P(B) = 120/(66 dot 27) + 385/(66 dot 27) + 210/(66 dot 27) = (120 + 385 + 210)/(1782) = 715/1782. $
      
    - Nhánh mà đề bài quan tâm là $A_3$: "Chuyển 2 bi không cùng màu" (nhánh giữa màu tím). Xác suất để xảy ra đồng thời nhánh này VÀ cuối cùng rút được bi Trắng là:
      $ P(A_3 inter B) = 385/(66 dot 27) = 385/1782. $
      
    - Theo công thức Bayes (hay quy tắc xác suất có điều kiện trên sơ đồ cây), xác suất cần tìm là tỉ số giữa nhánh quan tâm và tổng tất cả các nhánh đích:
      $ P(A_3 | B) = (P(A_3 inter B)) / P(B) = (385/1782) / (715/1782) = 385/715 = 7/13 approx 0,53846... $
      
    - Làm tròn kết quả đến hàng phần trăm, ta thu được *$0,54$*.
  ]
)
// Câu trả lời ngắn tính p^4 sân golf (Giải nhanh hệ 4 ẩn)

#tln(
  mode: "loigiai",
  [Cho hai hộp đựng bi, các viên bi có cùng kích thước và khối lượng:
  - Hộp $A$ chứa $2$ viên bi đỏ và $1$ viên bi xanh.
  - Hộp $B$ chứa $1$ viên bi đỏ và $2$ viên bi xanh.
  
  Một người chọn ngẫu nhiên một hộp, rồi rút ra một viên bi.
  - Nếu lần thứ nhất rút được bi đỏ, người đó giữ viên bi lại ở ngoài và tiếp tục rút thêm một viên bi từ *cùng hộp đó*.
  - Nếu lần thứ nhất rút được bi xanh, người đó giữ viên bi lại ở ngoài và chuyển sang *hộp còn lại* để rút ra một viên bi.
  
  Biết rằng viên bi rút được ở lần thứ hai là bi đỏ. Xác suất để viên bi rút được ở lần thứ nhất cũng là bi đỏ bằng $a%$. Tìm $a$.],
  [$37,5$],
  loigiai: [
    #ppgiai[
      - Vẽ sơ đồ cây biểu diễn tất cả các khả năng xảy ra (chọn hộp $=>$ rút lần 1 $=>$ rút lần 2).
      - Tính xác suất của từng nhánh bằng quy tắc nhân xác suất.
      - Xác suất của biến cố $D_2$ (lần 2 rút được bi đỏ) là tổng xác suất của tất cả các nhánh tận cùng bằng $D_2$.
      - Áp dụng công thức Bayes (hoặc định nghĩa xác suất có điều kiện trên sơ đồ cây):
        $ P(D_1 | D_2) = ("Xác suất nhánh " D_1 "và " D_2) / ("Tổng xác suất nhánh " D_2) $
    ]
    
    #import "@preview/cetz:0.3.2"
    #align(center)[
      #cetz.canvas(length: 1.1cm, {
        import cetz.draw: *

        // Các nút của sơ đồ cây
        content((0, 0), [Chọn hộp], name: "root")

        content((2.5, 2.5), [Hộp $A$], name: "A")
        content((2.5, -2.5), [Hộp $B$], name: "B")

        content((6.2, 4), [Đỏ ($D_1$)
#text(size: 0.8em)[(Hộp A: $1"Đ", 1"X"$)]], name: "AD1")
        content((6.2, 1), [Xanh ($X_1$)
#text(size: 0.8em)[(Hộp B: $1"Đ", 2"X"$)]], name: "AX1")

        content((6.2, -1), [Đỏ ($D_1$)
#text(size: 0.8em)[(Hộp B: $0"Đ", 2"X"$)]], name: "BD1")
        content((6.2, -4), [Xanh ($X_1$)
#text(size: 0.8em)[(Hộp A: $2"Đ", 1"X"$)]], name: "BX1")

        content((10.5, 4.8), [Đỏ ($D_2$)], name: "AD1D2")
        content((10.5, 3.2), [Xanh ($X_2$)], name: "AD1X2")

        content((10.5, 1.8), [Đỏ ($D_2$)], name: "AX1D2")
        content((10.5, 0.2), [Xanh ($X_2$)], name: "AX1X2")

        content((10.5, -0.2), [Đỏ ($D_2$)], name: "BD1D2")
        content((10.5, -1.8), [Xanh ($X_2$)], name: "BD1X2")

        content((10.5, -3.2), [Đỏ ($D_2$)], name: "BX1D2")
        content((10.5, -4.8), [Xanh ($X_2$)], name: "BX1X2")

        // Hàm nối và ghi xác suất trên nhánh
        let conn(from, to, text, pos: "north") = {
          line(from, to, mark: (end: ">"), name: "e_" + from + "_" + to)
          content("e_" + from + "_" + to + ".mid", text, anchor: pos, padding: 4pt, angle: "e_" + from + "_" + to)
        }

        // Vẽ nhánh
        conn("root", "A", $1/2$)
        conn("root", "B", $1/2$, pos: "south")

        conn("A", "AD1", $2/3$, pos: "south")
        conn("A", "AX1", $1/3$, pos: "south")

        conn("B", "BD1", $1/3$, pos: "south")
        conn("B", "BX1", $2/3$, pos: "south")

        conn("AD1", "AD1D2", $1/2$, pos: "south")
        conn("AD1", "AD1X2", $1/2$, pos: "south")

        conn("AX1", "AX1D2", $1/3$)
        conn("AX1", "AX1X2", $2/3$, pos: "south")

        conn("BD1", "BD1D2", $0$, pos: "south")
        conn("BD1", "BD1X2", $1$, pos: "south")

        conn("BX1", "BX1D2", $2/3$, pos: "south")
        conn("BX1", "BX1X2", $1/3$, pos: "south")

        // Ghi kết quả ở cuối
        content((12.5, 4.8), text(fill: red, weight: "bold")[$1/6 = 3/18$])
        content((12.5, 3.2), [$1/6 = 3/18$])
        content((12.5, 1.8), text(fill: red, weight: "bold")[$1/18$])
        content((12.5, 0.2), [$2/18$])
        content((12.5, -0.2), text(fill: red, weight: "bold")[$0$])
        content((12.5, -1.8), [$1/3 = 6/18$])
        content((12.5, -3.2), text(fill: red, weight: "bold")[$4/18$])
        content((12.5, -4.8), [$2/18$])
        
        // Khung chú thích
        content((12.5, 5.8), text(weight: "bold")[Xác suất])
      })
    ]
    
    Từ sơ đồ cây, biến cố lần hai rút được bi đỏ ($D_2$) là tổng của $4$ nhánh có kết quả tô màu đỏ:
    $ P(D_2) = 3/18 + 1/18 + 0 + 4/18 = 8/18 = 4/9 $
    
    Biến cố cả hai lần đều rút được bi đỏ ($D_1 inter D_2$) tương ứng với các nhánh có $D_1$ rồi đến $D_2$:
    $ P(D_1 inter D_2) = 1/2 \cdot 2/3 \cdot 1/2 + 1/2 \cdot 1/3 \cdot 0 = 3/18 + 0 = 1/6 $
    
    Xác suất để lần thứ nhất rút được bi đỏ, biết lần thứ hai rút được bi đỏ là:
    $ P(D_1 | D_2) = (P(D_1 inter D_2)) / P(D_2) = (1/6) / (4/9) = 3/8 $
    
    Đổi ra phần trăm ta có $3/8 = 0,375 = 37,5%$. Vậy *$a = 37,5$*.
  ]
)

// Câu trắc nghiệm Đúng/Sai thống kê bảo hiểm bằng Sơ đồ cây
#ds(
  mode:"loigiai",
  [Một công ty bảo hiểm thực hiện thống kê trên $20.000$ khách hàng đăng ký. Các khách hàng được phân loại dựa trên ba tiêu chí độc lập:
  - Độ tuổi: Trẻ hoặc Già;
  - Giới tính: Nam hoặc Nữ;
  - Tình trạng hôn nhân: Đã lập gia đình hoặc Độc thân.
  
  Dữ liệu thống kê thu được như sau: có $6.300$ người trẻ; $9.600$ nam giới; $13.800$ người đã lập gia đình. Ngoài ra, các nhóm kết hợp bao gồm: $2.700$ nam giới trẻ; $6.400$ nam giới đã lập gia đình; $2.900$ người trẻ đã lập gia đình và $1.100$ nam giới trẻ đã lập gia đình.],
  (
    [Công ty có tất cả $6.800$ khách hàng là đàn ông già.],
    True([Có tất cả $6.200$ khách hàng độc thân và $10.400$ khách hàng là phụ nữ.]),
    [Xác suất để chọn ngẫu nhiên một khách hàng là phụ nữ trẻ và độc thân là $9,2%$.],
    True([Biết rằng một người trẻ được chọn đã lập gia đình, xác suất người đó là đàn ông xấp xỉ $0,38$ (sai số không quá $0,01$).])
  ),
  loigiai: [
    #ppgiai[
      - Phân tích dữ liệu theo cấu trúc Sơ đồ cây gồm 3 tầng phân nhánh: *Giới tính $=>$ Độ tuổi $=>$ Hôn nhân*.
      - Từ dữ liệu cho trước, ta lấp dần số lượng người vào từng nút. Nút "mẹ" luôn bằng tổng các nút "con".
      - Các dữ liệu gốc: $N = 20000$, Nam = $9600$, Trẻ = $6300$, Lập GĐ = $13800$.
      - Khi đã có sơ đồ cây hoàn chỉnh, chỉ cần lấy số liệu từ các nhánh đọc kết quả.
    ]

    *Bước 1: Tính toán lấp đầy sơ đồ cây*
    - *Tầng Giới tính:* Nam = $9600 =>$ Nữ = $20000 - 9600 = 10400$.
    - *Tầng Độ tuổi (kết hợp Giới tính):*
      + Nam, Trẻ = $2700 =>$ Nam, Già = $9600 - 2700 = 6900$.
      + Nữ, Trẻ = (Tổng Trẻ) - (Nam, Trẻ) = $6300 - 2700 = 3600$.
      + Nữ, Già = (Tổng Nữ) - (Nữ, Trẻ) = $10400 - 3600 = 6800$.
    - *Tầng Hôn nhân (kết hợp Giới tính và Độ tuổi):*
      + Nam, Trẻ, Lập GĐ = $1100 =>$ Nam, Trẻ, Độc thân = $2700 - 1100 = 1600$.
      + Tổng Nam, Lập GĐ = $6400 =>$ Nam, Già, Lập GĐ = $6400 - 1100 = 5300$.
        $=>$ Nam, Già, Độc thân = $6900 - 5300 = 1600$.
      + Tổng Trẻ, Lập GĐ = $2900 =>$ Nữ, Trẻ, Lập GĐ = $2900 - 1100 = 1800$.
        $=>$ Nữ, Trẻ, Độc thân = $3600 - 1800 = 1800$.
      + Tổng Lập GĐ = $13800 =>$ Nữ, Già, Lập GĐ = $13800 - (1100 + 5300 + 1800) = 5600$.
        $=>$ Nữ, Già, Độc thân = $6800 - 5600 = 1200$.

    *Bước 2: Vẽ sơ đồ cây tổng quát*
    #import "@preview/cetz:0.3.2"
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Nút gốc
        content((0, 0), text(weight: "bold")[Tổng KH
($20.000$)], name: "root")

        // Tầng 1: Giới tính
        content((3, 3.5), text(fill: blue, weight: "bold")[Nam
($9.600$)], name: "M")
        content((3, -3.5), text(fill: rgb("d81b60"), weight: "bold")[Nữ
($10.400$)], name: "F")

        // Tầng 2: Độ tuổi
        content((6.5, 5.25), text(fill: rgb("2e7d32"))[Trẻ ($2.700$)], name: "MT")
        content((6.5, 1.75), text(fill: rgb("e65100"))[Già ($6.900$)], name: "MG")
        content((6.5, -1.75), text(fill: rgb("2e7d32"))[Trẻ ($3.600$)], name: "FT")
        content((6.5, -5.25), text(fill: rgb("e65100"))[Già ($6.800$)], name: "FG")

        // Tầng 3: Hôn nhân
        content((11, 6.125), [Đã Lập GĐ #text(fill: red)[($1.100$)]], name: "MTH")
        content((11, 4.375), [Độc thân #text(fill: red)[($1.600$)]], name: "MTS")
        content((11, 2.625), [Đã Lập GĐ #text(fill: red)[($5.300$)]], name: "MGH")
        content((11, 0.875), [Độc thân #text(fill: red)[($1.600$)]], name: "MGS")
        
        content((11, -0.875), [Đã Lập GĐ #text(fill: red)[($1.800$)]], name: "FTH")
        content((11, -2.625), [Độc thân #text(fill: red)[($1.800$)]], name: "FTS")
        content((11, -4.375), [Đã Lập GĐ #text(fill: red)[($5.600$)]], name: "FGH")
        content((11, -6.125), [Độc thân #text(fill: red)[($1.200$)]], name: "FGS")

        // Hàm vẽ nhánh
        let conn(from, to, color) = {
          line(from, to, mark: (end: ">"), stroke: (paint: color, thickness: 1.2pt))
        }

        // Vẽ các nhánh nối
        conn("root", "M", blue.lighten(30%))
        conn("root", "F", rgb("d81b60").lighten(30%))

        conn("M", "MT", rgb("2e7d32").lighten(30%))
        conn("M", "MG", rgb("e65100").lighten(30%))
        conn("F", "FT", rgb("2e7d32").lighten(30%))
        conn("F", "FG", rgb("e65100").lighten(30%))

        conn("MT", "MTH", rgb("6a1b9a").lighten(30%))
        conn("MT", "MTS", gray)
        conn("MG", "MGH", rgb("6a1b9a").lighten(30%))
        conn("MG", "MGS", gray)
        conn("FT", "FTH", rgb("6a1b9a").lighten(30%))
        conn("FT", "FTS", gray)
        conn("FG", "FGH", rgb("6a1b9a").lighten(30%))
        conn("FG", "FGS", gray)
      })
    ]

    *Bước 3: Đọc kết quả từ sơ đồ cây*
    - *Ý a) Sai.* Số lượng khách hàng là "đàn ông già" (Nhánh Nam $=>$ Già) là $6.900$ người. Phát biểu nói $6.800$ là sai.
    
    - *Ý b) Đúng.* 
      + Tổng khách hàng Nữ (Nhánh Nữ) là $10.400$. 
      + Khách hàng độc thân là tổng $4$ "chiếc lá" Độc thân cuối cùng: $1.600 + 1.600 + 1.800 + 1.200 = 6.200$. Phát biểu hoàn toàn chính xác.
    
    - *Ý c) Sai.* Số khách hàng "phụ nữ, trẻ, độc thân" (Nhánh Nữ $=>$ Trẻ $=>$ Độc thân) là $1.800$.
      Xác suất là $P = 1800 / 20000 = 0,09 = 9%$. Phát biểu nói $9,2%$ là sai.

    - *Ý d) Đúng.* Đây là xác suất có điều kiện: $P("Đàn ông" | "Trẻ, Đã lập GĐ")$.
      + Không gian mẫu rút gọn (Tổng số người "Trẻ, Đã lập GĐ"):
        Lấy (Nam $=>$ Trẻ $=>$ Lập GĐ) + (Nữ $=>$ Trẻ $=>$ Lập GĐ) $= 1.100 + 1.800 = 2.900$.
      + Biến cố cần tìm (Người đó là đàn ông): là nhóm (Nam $=>$ Trẻ $=>$ Lập GĐ) $= 1.100$.
      $ P = 1100 / 2900 = 11/29 approx 0,3793 $
      Giá trị $0,3793$ sai số so với $0,38$ là $|0,3793 - 0,38| = 0,0007 < 0,01$.
  ]
)


#ds(
  [Một nhà máy sản xuất bóng đèn có ba phân xưởng A, B, C cùng tham gia sản xuất. Tỉ lệ sản lượng của phân xưởng A, B, C lần lượt là $50%$, $30%$ và $20%$. Qua quá trình kiểm định chất lượng, người ta thống kê được tỉ lệ phế phẩm (bóng đèn bị hỏng) của phân xưởng A là $2%$, phân xưởng B là $3%$ và phân xưởng C là $4%$. Giả sử nhà máy sản xuất tổng cộng $10.000$ bóng đèn trong một lô hàng.],
  (
    [Phân xưởng A sản xuất được $5.000$ bóng đèn, trong đó có $150$ bóng bị hỏng.],
    True([Tổng số bóng đèn bị hỏng của cả nhà máy trong lô hàng này là $270$ bóng.]),
    True([Nếu chọn ngẫu nhiên một bóng đèn và phát hiện nó bị hỏng, xác suất bóng đèn đó do phân xưởng B sản xuất là $1/3$.]),
    [Xác suất để chọn ngẫu nhiên một bóng đèn từ lô hàng là bóng đạt tiêu chuẩn (không bị hỏng) do phân xưởng C sản xuất là $0,2$.]
  ),
  loigiai: [
    #ppgiai[
      - Phân tích số liệu bài toán bằng sơ đồ cây để dễ dàng bóc tách các nhóm tập hợp.
      - Vận dụng công thức xác suất toàn phần: $P(H) = P(A)P(H|A) + P(B)P(H|B) + P(C)P(H|C)$.
      - Công thức Bayes tính xác suất có điều kiện: $P(B|H) = (P(B)P(H|B)) / P(H)$.
    ]
    
    Ký hiệu tổng số bóng đèn là $n(Omega) = 10000$. 
    Tính số lượng bóng đèn mỗi phân xưởng sản xuất và số phế phẩm tương ứng:
    - *Phân xưởng A:* Sản xuất $10000 dot 50% = 5000$ bóng. 
      Số bóng hỏng: $5000 dot 2% = 100$ bóng. Số bóng đạt: $5000 - 100 = 4900$ bóng.
    - *Phân xưởng B:* Sản xuất $10000 dot 30% = 3000$ bóng.
      Số bóng hỏng: $3000 dot 3% = 90$ bóng. Số bóng đạt: $3000 - 90 = 2910$ bóng.
    - *Phân xưởng C:* Sản xuất $10000 dot 20% = 2000$ bóng.
      Số bóng hỏng: $2000 dot 4% = 80$ bóng. Số bóng đạt: $2000 - 80 = 1920$ bóng.
      
    Ta có sơ đồ cây biểu diễn như sau:
    
    #align(center)[
      #cetz.canvas(length: 1.1cm, {
        import cetz.draw: *
        // Nodes chính
        content((0, 0), [Bóng đèn \ ($10000$)], name: "root")
        
        content((3, 2), [Máy A \ ($5000$)], name: "A")
        content((3, 0), [Máy B \ ($3000$)], name: "B")
        content((3, -2), [Máy C \ ($2000$)], name: "C")
        
        content((6.5, 2.5), [Hỏng ($100$)], name: "AH")
        content((6.5, 1.5), [Đạt ($4900$)], name: "AD")
        
        content((6.5, 0.5), [Hỏng ($90$)], name: "BH")
        content((6.5, -0.5), [Đạt ($2910$)], name: "BD")
        
        content((6.5, -1.5), [Hỏng ($80$)], name: "CH")
        content((6.5, -2.5), [Đạt ($1920$)], name: "CD")
        
        // Cạnh nối
        line("root", "A", mark: (end: ">"), stroke: 0.8pt)
        line("root", "B", mark: (end: ">"), stroke: 0.8pt)
        line("root", "C", mark: (end: ">"), stroke: 0.8pt)
        
        line("A", "AH", mark: (end: ">"), stroke: (paint: red, thickness: 1pt))
        line("A", "AD", mark: (end: ">"), stroke: (paint: blue, thickness: 1pt))
        content((4.8, 2.4), [$2%$], anchor: "south-east", angle: 15deg, padding: 0.15, fill: red, size: 9pt)
        
        line("B", "BH", mark: (end: ">"), stroke: (paint: red, thickness: 1pt))
        line("B", "BD", mark: (end: ">"), stroke: (paint: blue, thickness: 1pt))
        content((4.8, 0.4), [$3%$], anchor: "south-east", angle: 15deg, padding: 0.15, fill: red, size: 9pt)
        
        line("C", "CH", mark: (end: ">"), stroke: (paint: red, thickness: 1pt))
        line("C", "CD", mark: (end: ">"), stroke: (paint: blue, thickness: 1pt))
        content((4.8, -1.6), [$4%$], anchor: "south-east", angle: 15deg, padding: 0.15, fill: red, size: 9pt)
      })
    ]

    Dựa vào phân tích trên, ta xét các phát biểu:
    - *Ý a) Sai.* Phân xưởng A sản xuất $5000$ bóng, nhưng số bóng hỏng là $100$ bóng (không phải $150$).
      
    - *Ý b) Đúng.* Tổng số bóng đèn bị hỏng của cả nhà máy là:
      $ 100 + 90 + 80 = 270 " (bóng)". $
      
    - *Ý c) Đúng.* Biết rằng bóng đèn chọn ra bị hỏng (nằm trong nhóm $270$ bóng hỏng), số bóng hỏng do phân xưởng B sản xuất là $90$.
      Xác suất cần tìm (áp dụng công thức Bayes) là:
      $ P(B|"Hỏng") = 90/270 = 1/3. $

    - *Ý d) Sai.* Số bóng đèn đạt tiêu chuẩn do phân xưởng C sản xuất là $1920$ bóng. Xác suất để chọn được bóng này từ toàn bộ lô hàng là:
      $ P = 1920/10000 = 0,192 = 19,2%. $
      (Khác với $0,2$).
      
    #luuy[
      Cần phân biệt rõ xác suất $P(C ∩ "Đạt")$ (chọn ngẫu nhiên một bóng từ không gian mẫu $10000$ bóng) và xác suất có điều kiện $P(C|"Đạt")$ (chỉ chọn từ nhóm những bóng đạt tiêu chuẩn). Ở ý d, câu hỏi nhấn mạnh "chọn ngẫu nhiên một bóng đèn từ lô hàng" nên ta phải chia cho tổng số bóng $10000$.
    ]
  ]
)