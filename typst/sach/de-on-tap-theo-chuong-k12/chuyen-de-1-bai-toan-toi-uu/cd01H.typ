#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("ea580c") // Burnt Orange

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 1: BÀI TOÁN TỐI ƯU HÓA TRONG THỰC TIỄN",
  exam-title: "CHỦ ĐỀ 1H: QUY HOẠCH TUYẾN TÍNH & TỐI ƯU HÓA ĐA MỤC TIÊU (VD - VDC)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "508",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn(
  [Một xưởng sản xuất hai loại sản phẩm $I$ và $I I$ từ hai loại nguyên liệu $A$ và $B$. Để sản xuất một tấn sản phẩm $I$ cần $2$ tấn nguyên liệu $A$ và $1$ tấn nguyên liệu $B$, đem lại lợi nhuận $4$ triệu đồng. Để sản xuất một tấn sản phẩm $I I$ cần $1$ tấn nguyên liệu $A$ và $2$ tấn nguyên liệu $B$, đem lại lợi nhuận $5$ triệu đồng. Kho dự trữ hiện có tối đa $8$ tấn nguyên liệu $A$ và $10$ tấn nguyên liệu $B$. Lợi nhuận lớn nhất mà xưởng có thể đạt được bằng bao nhiêu?],
  (
    [$24$ triệu đồng],
    True([$26$ triệu đồng]),
    [$28$ triệu đồng],
    [$30$ triệu đồng]
  ),
  loigiai: [
    #step([Thiết lập mô hình quy hoạch tuyến tính])
    Gọi $x, y$ (tấn) lần lượt là số tấn sản phẩm $I$ và $I I$ cần sản xuất ($x >= 0, y >= 0$).
    Lượng nguyên liệu $A$ sử dụng: $2x + y <= 8$.
    Lượng nguyên liệu $B$ sử dụng: $x + 2y <= 10$.
    Hàm mục tiêu lợi nhuận: $F(x, y) = 4x + 5y$ (triệu đồng).

    #step([Xác định các đỉnh của miền nghiệm])
    Miền nghiệm là tứ giác lồi $O A B C$ với:
    - $O(0; 0)$: $F(0, 0) = 0$.
    - $A(4; 0)$ (giao điểm của $2x + y = 8$ và $O x$): $F(4, 0) = 4(4) + 5(0) = 16$ triệu đồng.
    - $B(2; 4)$ (giao điểm của $2x + y = 8$ và $x + 2y = 10$): $F(2, 4) = 4(2) + 5(4) = 26$ triệu đồng.
    - $C(0; 5)$ (giao điểm của $x + 2y = 10$ và $O y$): $F(0, 5) = 4(0) + 5(5) = 25$ triệu đồng.

    #step([Kết luận giá trị tối ưu])
    Lợi nhuận lớn nhất là $26$ triệu đồng khi sản xuất $2$ tấn sản phẩm $I$ và $4$ tấn sản phẩm $I I$.
  ]
)

// TN 2
#tn(
  [Một công ty du lịch cần thuê xe ô tô để chở ít nhất $140$ du khách và $9$ tấn hành lý. Có hai loại xe để thuê: Loại $A$ có $10$ chiếc với giá thuê $4$ triệu đồng/xe, chở được tối đa $20$ khách và $0","6$ tấn hành lý. Loại $B$ có $8$ chiếc với giá thuê $3$ triệu đồng/xe, chở được tối đa $10$ khách và $1","5$ tấn hành lý. Chi phí thuê xe nhỏ nhất bằng bao nhiêu?],
  (
    [$30$ triệu đồng],
    True([$32$ triệu đồng]),
    [$34$ triệu đồng],
    [$36$ triệu đồng]
  ),
  loigiai: [
    #step([Thiết lập hệ bất phương trình])
    Gọi $x, y$ lần lượt là số xe loại $A$ và loại $B$ cần thuê ($x, y in NN$).
    Ta có hệ điều kiện:
    $cases(
      0 <= x <= 10,
      0 <= y <= 8,
      20x + 10y >= 140 <=> 2x + y >= 14,
      0","6x + 1","5y >= 9 <=> 2x + 5y >= 30
    )$
    Hàm chi phí cần tối thiểu hóa: $F(x, y) = 4x + 3y$ (triệu đồng).

    #step([Tìm tọa độ các đỉnh của miền nghiệm])
    Giao điểm của $2x + y = 14$ và $2x + 5y = 30$: Trừ vế theo vế được $4y = 16 => y = 4$, suy ra $x = 5$.
    Điểm $M(5; 4)$ thỏa mãn $x <= 10, y <= 8$.
    Các đỉnh của miền chấp nhận được gồm:
    - $(5; 4)$: $F(5, 4) = 4(5) + 3(4) = 32$ triệu đồng.
    - $(10; 2)$: $F(10, 2) = 4(10) + 3(2) = 46$ triệu đồng.
    - $(3; 8)$: $F(3, 8) = 4(3) + 3(8) = 36$ triệu đồng.
    - $(10; 8)$: $F(10, 8) = 4(10) + 3(8) = 64$ triệu đồng.
    Vậy chi phí thuê xe nhỏ nhất là $32$ triệu đồng khi thuê $5$ xe loại $A$ và $4$ xe loại $B$.
  ]
)

// TN 3
#tn(
  [Một bác sĩ dinh dưỡng khuyên một bệnh nhân cần nạp tối thiểu $360$ đơn vị vitamin $A$ và $280$ đơn vị vitamin $C$ mỗi tuần. Bệnh nhân có thể bổ sung qua hai loại thực phẩm chức năng $M$ và $N$. Mỗi viên thực phẩm $M$ chứa $30$ đơn vị vitamin $A$, $14$ đơn vị vitamin $C$ và có giá $4.000$ đồng. Mỗi viên thực phẩm $N$ chứa $20$ đơn vị vitamin $A$, $28$ đơn vị vitamin $C$ và có giá $5.000$ đồng. Chi phí thấp nhất để mua đủ lượng vitamin cần thiết trong một tuần là:],
  (
    [$56.000$ đồng],
    True([$62.000$ đồng]),
    [$68.000$ đồng],
    [$72.000$ đồng]
  ),
  loigiai: [
    #step([Mô hình hóa bài toán])
    Gọi $x, y$ lần lượt là số viên loại $M$ và loại $N$ bệnh nhân dùng trong tuần ($x, y >= 0$).
    Điều kiện vitamin $A$: $30x + 20y >= 360 <=> 3x + 2y >= 36$.
    Điều kiện vitamin $C$: $14x + 28y >= 280 <=> x + 2y >= 20$.
    Hàm chi phí: $F(x, y) = 4x + 5y$ (nghìn đồng).

    #step([Tìm giao điểm các đường ranh giới])
    Giao điểm của $3x + 2y = 36$ và $x + 2y = 20$:
    Lấy phương trình đầu trừ phương trình sau: $2x = 16 => x = 8 => y = 6$.
    Tọa độ đỉnh $P(8; 6)$.
    Giao điểm với trục tung ($x = 0$): $y = 18 => (0; 18)$.
    Giao điểm với trục hoành ($y = 0$): $x = 20 => (20; 0)$.

    #step([Tính giá trị chi phí tại các đỉnh])
    - Tại $(0; 18)$: $F(0, 18) = 4(0) + 5(18) = 90$ nghìn đồng.
    - Tại $(20; 0)$: $F(20, 0) = 4(20) + 5(0) = 80$ nghìn đồng.
    - Tại $(8; 6)$: $F(8, 6) = 4(8) + 5(6) = 32 + 30 = 62$ nghìn đồng.
    Vậy chi phí thấp nhất là $62.000$ đồng khi dùng $8$ viên $M$ và $6$ viên $N$.
  ]
)

// TN 4
#tn(
  [Một trang trại có $12$ héc-ta đất nông nghiệp để trồng hai loại cây: Đậu tương và ngô. Trồng $1$ ha đậu tương cần $20$ ngày công và $3$ triệu đồng tiền vốn, đem lại lợi nhuận $40$ triệu đồng. Trồng $1$ ha ngô cần $30$ ngày công và $4$ triệu đồng tiền vốn, đem lại lợi nhuận $50$ triệu đồng. Trang trại có tổng cộng $300$ ngày công lao động và $40$ triệu đồng tiền vốn. Lợi nhuận lớn nhất mà trang trại có thể thu được là:],
  (
    [$480$ triệu đồng],
    [$500$ triệu đồng],
    [$510$ triệu đồng],
    True([$520$ triệu đồng])
  ),
  loigiai: [
    #step([Hệ bất phương trình ràng buộc])
    Gọi $x, y$ lần lượt là diện tích trồng đậu tương và ngô ($x >= 0, y >= 0$, đơn vị ha).
    - Diện tích đất: $x + y <= 12$.
    - Ngày công: $20x + 30y <= 300 <=> 2x + 3y <= 30$.
    - Tiền vốn: $3x + 4y <= 40$.
    Hàm mục tiêu lợi nhuận: $P(x, y) = 40x + 50y$ (triệu đồng).

    #step([Xác định các đỉnh của miền nghiệm])
    - Giao điểm của $x + y = 12$ và $3x + 4y = 40$ là $B(8; 4)$.
    Kiểm tra điều kiện công: $2(8) + 3(4) = 28 <= 30$ (thỏa mãn!).
    - Giao điểm của $2x + 3y = 30$ và $3x + 4y = 40$ là $A(0; 10)$.
    Kiểm tra diện tích: $0 + 10 = 10 <= 12$ (thỏa mãn!).
    - Giao điểm với trục hoành: $(12; 0)$ thỏa mãn vốn $36 <= 40$ và công $24 <= 30$.

    #step([Tính giá trị tại các đỉnh hợp lệ])
    - Đỉnh $(0; 10)$: $P(0, 10) = 40(0) + 50(10) = 500$ triệu đồng.
    - Đỉnh $(12; 0)$: $P(12, 0) = 40(12) = 480$ triệu đồng.
    - Đỉnh $(8; 4)$: $P(8, 4) = 40(8) + 50(4) = 320 + 200 = 520$ triệu đồng.
    Vậy lợi nhuận lớn nhất là $520$ triệu đồng khi trồng $8$ ha đậu tương và $4$ ha ngô.
  ]
)

// TN 5
#tn(
  [Một xưởng cơ khí gia công hai loại chi tiết máy $A$ và $B$. Thời gian gia công trên máy tiện và máy phay cho mỗi chi tiết máy được cho trong bảng sau:
  #align(center)[
    #table(
      columns: (2.5cm, 2.5cm, 2.5cm),
      align: center,
      [Chi tiết], [Máy tiện (giờ)], [Máy phay (giờ)],
      [Loại $A$], [$2$], [$1$],
      [Loại $B$], [$1$], [$2$],
      [Tổng quỹ giờ], [$100$ giờ], [$80$ giờ],
    )
  ]
  Mỗi chi tiết loại $A$ có lãi $50$ nghìn đồng, loại $B$ có lãi $40$ nghìn đồng. Lợi nhuận lớn nhất của xưởng bằng bao nhiêu?],
  (
    [$2","5$ triệu đồng],
    [$2","6$ triệu đồng],
    True([$2","8$ triệu đồng]),
    [$3","0$ triệu đồng]
  ),
  loigiai: [
    #step([Hệ điều kiện thời gian máy])
    Gọi $x, y$ lần lượt là số chi tiết loại $A$ và $B$ ($x, y >= 0$).
    $cases(
      2x + y <= 100,
      x + 2y <= 80
    )$
    Lợi nhuận: $F(x, y) = 50x + 40y$ (nghìn đồng).

    #step([Tìm tọa độ các đỉnh])
    Giao điểm của $2x + y = 100$ và $x + 2y = 80$:
    Nhân phương trình hai với $2$: $2x + 4y = 160$.
    Trừ phương trình một: $3y = 60 => y = 20 => x = (100 - 20) / 2 = 40$.
    Các đỉnh của miền nghiệm:
    - $O(0; 0)$: $F(0, 0) = 0$.
    - $M(50; 0)$: $F(50, 0) = 50(50) = 2500$ nghìn đồng.
    - $N(40; 20)$: $F(40, 20) = 50(40) + 40(20) = 2000 + 800 = 2800$ nghìn đồng.
    - $P(0; 40)$: $F(0, 40) = 40(40) = 1600$ nghìn đồng.
    Vậy lợi nhuận lớn nhất là $2800$ nghìn đồng = $2","8$ triệu đồng.
  ]
)

// TN 6
#tn(
  [Miền nghiệm của hệ bất phương trình $cases(x - y >= -2, x + y <= 4, x >= 0, y >= 0)$ là một miền đa giác. Giá trị lớn nhất của biểu thức $F(x, y) = 2x + 3y$ trên miền nghiệm này bằng:],
  (
    [$8$],
    [$10$],
    True([$11$]),
    [$12$]
  ),
  loigiai: [
    #step([Xác định tọa độ các đỉnh của miền đa giác])
    Miền nghiệm là tứ giác lồi tạo bởi các đường thẳng:
    - $x = 0$ (trục $O y$), $y = 0$ (trục $O x$).
    - $x - y = -2 <=> y - x = 2$.
    - $x + y = 4$.
    Giao điểm:
    - $O(0; 0)$.
    - $A(4; 0)$ (giao của $x + y = 4$ với $O x$).
    - $B$: giao điểm của $x + y = 4$ và $y - x = 2$: cộng hai phương trình được $2y = 6 => y = 3, x = 1$. Vậy $B(1; 3)$.
    - $C(0; 2)$ (giao của $y - x = 2$ với $O y$).

    #step([Tính giá trị $F(x, y)$ tại các đỉnh])
    - $F(0, 0) = 0$.
    - $F(4, 0) = 2(4) + 3(0) = 8$.
    - $F(1, 3) = 2(1) + 3(3) = 2 + 9 = 11$.
    - $F(0, 2) = 2(0) + 3(2) = 6$.
    Vậy giá trị lớn nhất là $11$ đạt tại điểm $(1; 3)$.
  ]
)

// TN 7
#tn(
  [Một công ty dự định chi tối đa $20$ triệu đồng cho quảng cáo một sản phẩm mới trên truyền hình và đài phát thanh. Chi phí cho một phút quảng cáo trên truyền hình là $2$ triệu đồng, trên đài phát thanh là $1$ triệu đồng. Do quy định của đài phát thanh, thời lượng phát sóng trên đài phát thanh không quá $10$ phút. Qua khảo sát, một phút quảng cáo trên truyền hình đem lại hiệu quả tiếp cận $60$ nghìn khách hàng, một phút trên đài phát thanh tiếp cận $20$ nghìn khách hàng. Để số lượng khách hàng tiếp cận được là lớn nhất, công ty nên chi bao nhiêu phút quảng cáo trên truyền hình?],
  (
    [$5$ phút],
    [$8$ phút],
    True([$10$ phút]),
    [$12$ phút]
  ),
  loigiai: [
    #step([Thiết lập hệ bất phương trình])
    Gọi $x, y$ (phút) lần lượt là thời lượng quảng cáo trên truyền hình và đài phát thanh ($x >= 0, 0 <= y <= 10$).
    Chi phí: $2x + y <= 20$.
    Số khách hàng tiếp cận: $H(x, y) = 60x + 20y$ (nghìn người).

    #step([Tìm cực đại])
    Ta có $H(x, y) = 20(3x + y)$.
    Từ $2x + y <= 20 => y <= 20 - 2x$.
    Do đó: $H(x, y) = 60x + 20y <= 60x + 20(20 - 2x) = 20x + 400$.
    Vì $2x <= 2x + y <= 20 => x <= 10$.
    Dấu "=" xảy ra khi $x = 10$, khi đó $y = 20 - 2(10) = 0$.
    Khi $x = 10, y = 0$: $H(10, 0) = 600$ nghìn người.
    Vậy công ty nên chi toàn bộ ngân sách để quảng cáo $10$ phút trên truyền hình.
  ]
)

// TN 8
#tn(
  [Một nhà đầu tư có $1$ tỷ đồng để phân bổ vào hai danh mục: Trái phiếu an toàn với lãi suất $6%$/năm và quỹ cổ phiếu tăng trưởng với lãi suất kỳ vọng $14%$/năm. Để quản trị rủi ro, nhà đầu tư quy định: số tiền đầu tư vào cổ phiếu không được vượt quá số tiền đầu tư vào trái phiếu, và số tiền đầu tư vào trái phiếu tối thiểu là $400$ triệu đồng. Lợi nhuận kỳ vọng lớn nhất sau một năm mà nhà đầu tư có thể nhận được là:],
  (
    [$80$ triệu đồng],
    [$90$ triệu đồng],
    True([$100$ triệu đồng]),
    [$110$ triệu đồng]
  ),
  loigiai: [
    #step([Hệ điều kiện phân bổ vốn])
    Gọi $x, y$ (triệu đồng) lần lượt là số tiền đầu tư vào trái phiếu và cổ phiếu ($x, y >= 0$).
    - Tổng vốn: $x + y = 1000$.
    - Ràng buộc an toàn: $y <= x$.
    - Trái phiếu tối thiểu: $x >= 400$.
    Từ $x + y = 1000$ và $y <= x => 1000 - x <= x <=> 2x >= 1000 <=> x >= 500$.
    Kết hợp $x >= 400$, ta được $500 <= x <= 1000$.
    Suy ra $y = 1000 - x <= 500$.

    #step([Hàm lợi nhuận])
    $L(x, y) = 0","06 x + 0","14 y = 0","06 x + 0","14(1000 - x) = 140 - 0","08 x.$
    Để lợi nhuận lớn nhất thì $x$ phải nhỏ nhất.
    Vì $x >= 500$, giá trị nhỏ nhất của $x$ là $x = 500$ triệu đồng.
    Khi đó $y = 500$ triệu đồng.
    Lợi nhuận kỳ vọng tối đa: $L_max = 140 - 0","08(500) = 140 - 40 = 100$ triệu đồng.
  ]
)

// TN 9
#tn(
  [Cho bài toán quy hoạch tuyến tính với miền chấp nhận được là miền tứ giác $A B C D$ có các đỉnh $A(1; 1), B(5; 2), C(4; 5), D(1; 5)$. Tìm giá trị nhỏ nhất của hàm mục tiêu $F(x, y) = 3x - 2y$ trên miền tứ giác này.],
  (
    [$-6$],
    True([$-7$]),
    [$-5$],
    [$-3$]
  ),
  loigiai: [
    #step([Tính giá trị của hàm mục tiêu tại các đỉnh])
    - Tại $A(1; 1)$: $F(1, 1) = 3(1) - 2(1) = 1$.
    - Tại $B(5; 2)$: $F(5, 2) = 3(5) - 2(2) = 15 - 4 = 11$.
    - Tại $C(4; 5)$: $F(4, 5) = 3(4) - 2(5) = 12 - 10 = 2$.
    - Tại $D(1; 5)$: $F(1, 5) = 3(1) - 2(5) = 3 - 10 = -7$.
    Vậy giá trị nhỏ nhất của $F(x, y)$ là $-7$ đạt tại $D(1; 5)$.
  ]
)

// TN 10
#tn(
  [Một tiệm bánh làm hai loại bánh: Bánh bông lan và bánh kem. Mỗi chiếc bánh bông lan cần $200$ g bột và $50$ g đường, lãi $30$ nghìn đồng. Mỗi chiếc bánh kem cần $100$ g bột và $100$ g đường, lãi $40$ nghìn đồng. Tiệm bánh có sẵn $4$ kg bột ($4000$ g) và $2$ kg đường ($2000$ g). Số lượng bánh bông lan và bánh kem nên làm để tiền lãi lớn nhất lần lượt là:],
  (
    [$10$ và $20$],
    True([$12$ và $14$]),
    [$13$ và $13$],
    [$0$ và $20$]
  ),
  loigiai: [
    #step([Thiết lập hệ bất phương trình])
    Gọi $x, y$ lần lượt là số bánh bông lan và bánh kem cần làm ($x, y in NN$).
    Điều kiện bột: $200x + 100y <= 4000 <=> 2x + y <= 40$.
    Điều kiện đường: $50x + 100y <= 2000 <=> x + 2y <= 40$.
    Lợi nhuận: $L(x, y) = 30x + 40y$ (nghìn đồng).

    #step([Tìm nghiệm nguyên tối ưu])
    Giao điểm thực của $2x + y = 40$ và $x + 2y = 40$ là $(40/3; 40/3) approx (13","33; 13","33)$.
    Kiểm tra các điểm nguyên thỏa mãn hệ:
    - Tại $(13; 13)$: $L(13, 13) = 30(13) + 40(13) = 910$ nghìn đồng.
    - Tại $(14; 12)$: $L(14, 12) = 30(14) + 40(12) = 900$ nghìn đồng.
    - Tại $(12; 14)$: $2(12) + 14 = 38 <= 40$ và $12 + 2(14) = 40 <= 40$.
    $L(12, 14) = 30(12) + 40(14) = 360 + 560 = 920$ nghìn đồng.
    Lợi nhuận lớn nhất là $920$ nghìn đồng khi làm $12$ bánh bông lan và $14$ bánh kem.
  ]
)

// TN 11
#tn(
  [Một công ty vận tải có hai kho hàng $A$ và $B$. Kho $A$ có $50$ tấn hàng, kho $B$ có $70$ tấn hàng. Công ty cần chuyển hàng đến hai cửa hàng $C$ (cần $40$ tấn) và $D$ (cần $60$ tấn). Cước phí vận chuyển mỗi tấn hàng từ kho đến cửa hàng được cho như sau: từ $A$ đến $C$ là $40$ nghìn đồng, từ $A$ đến $D$ là $60$ nghìn đồng, từ $B$ đến $C$ là $50$ nghìn đồng, từ $B$ đến $D$ là $30$ nghìn đồng. Chi phí vận chuyển tối thiểu để đáp ứng đủ nhu cầu là:],
  (
    [$3","5$ triệu đồng],
    [$3","6$ triệu đồng],
    True([$3","7$ triệu đồng]),
    [$3","9$ triệu đồng]
  ),
  loigiai: [
    #step([Đưa về một biến])
    Gọi $x$ là số tấn hàng vận chuyển từ $A$ đến $C$ ($0 <= x <= 40$).
    Khi đó số hàng vận chuyển từ $A$ đến $D$ là $50 - x$.
    Để $D$ nhận đủ $60$ tấn, số hàng chuyển từ $B$ đến $D$ phải là $60 - (50 - x) = 10 + x$.
    Để $C$ nhận đủ $40$ tấn, số hàng chuyển từ $B$ đến $C$ phải là $40 - x$.
    Điều kiện: $0 <= x <= 40$.

    #step([Thiết lập hàm chi phí])
    Tổng chi phí:
    $C(x) = 40x + 60(50 - x) + 50(40 - x) + 30(10 + x)$ (nghìn đồng)
    $= 5300 - 40x.$
    Hàm số nghịch biến theo $x$, đạt giá trị nhỏ nhất khi $x = 40$ tấn.
    $C_min = 5300 - 40(40) = 3700$ nghìn đồng = $3","7$ triệu đồng.
  ]
)

// TN 12
#tn(
  [Trong bài toán quy hoạch tuyến tính tìm giá trị lớn nhất của hàm mục tiêu $F(x, y) = a x + b y$ trên miền đa giác lồi, khẳng định nào sau đây là SAI?],
  (
    [Miền nghiệm của hệ bất phương trình bậc nhất hai ẩn luôn là một tập hợp lồi.],
    [Nếu hàm mục tiêu đạt giá trị lớn nhất thì giá trị đó luôn đạt được tại ít nhất một đỉnh của miền đa giác lồi.],
    True([Giá trị lớn nhất của hàm mục tiêu chỉ có thể đạt được tại duy nhất một điểm trong mọi trường hợp.]),
    [Nếu đường mức của hàm mục tiêu trùng với một cạnh của đa giác miền nghiệm thì bài toán có vô số nghiệm tối ưu.]
  ),
  loigiai: [
    #step([Phân tích lý thuyết quy hoạch tuyến tính])
    - Định lý cơ bản của quy hoạch tuyến tính khẳng định cực trị luôn đạt tại đỉnh của miền đa giác lồi.
    - Trong trường hợp đường mức song song và trùng với một cạnh biên của miền đa giác thì mọi điểm thuộc đoạn thẳng cạnh đó đều là nghiệm tối ưu (vô số nghiệm tối ưu).
    - Do đó khẳng định "chỉ có thể đạt được tại duy nhất một điểm trong mọi trường hợp" là SAI.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#ds(
  [Một cơ sở sản xuất đồ gỗ mỹ nghệ sản xuất hai loại bàn ghế: Bộ bàn ghế gỗ gõ đỏ (loại $A$) và bộ bàn ghế gỗ hương (loại $B$). Mỗi bộ loại $A$ cần $3$ m#super[3] gỗ, $20$ ngày công hoàn thiện và đem lại lợi nhuận $15$ triệu đồng. Mỗi bộ loại $B$ cần $2$ m#super[3] gỗ, $30$ ngày công hoàn thiện và đem lại lợi nhuận $18$ triệu đồng. Cơ sở hiện có nguồn gỗ dự trữ là $36$ m#super[3] và có tối đa $360$ ngày công lao động trong tháng. Gọi $x, y$ lần lượt là số bộ bàn ghế loại $A$ và loại $B$ sản xuất trong tháng ($x, y >= 0$).
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      // Trục tọa độ
      line((-0.5, 0), (6, 0), stroke: 1pt, mark: (end: "stealth"))
      content((6.2, 0), [$x$])
      line((0, -0.5), (0, 5), stroke: 1pt, mark: (end: "stealth"))
      content((0, 5.2), [$y$])
      // Đường 3x + 2y = 36: (0, 18), (12, 0) -> scale x/2.5, y/3.6: (0, 5), (4.8, 0)
      // Đường 20x + 30y = 360 <=> 2x + 3y = 36: (0, 12), (18, 0) -> (0, 3.33), (7.2, 0)
      // Giao điểm: 5x = 36 => x = 7.2, y = 7.2
      line((0, 3.6), (4.8, 0), stroke: (paint: rgb("#dc2626"), thickness: 1.5pt))
      line((0, 2.4), (7.2, 0), stroke: (paint: rgb("#2563eb"), thickness: 1.5pt))
      // Đa giác nghiệm
      line((0, 0), (4.8, 0), stroke: (paint: rgb("#ea580c"), thickness: 2pt))
      line((4.8, 0), (2.88, 1.44), stroke: (paint: rgb("#ea580c"), thickness: 2pt))
      line((2.88, 1.44), (0, 2.4), stroke: (paint: rgb("#ea580c"), thickness: 2pt))
      line((0, 2.4), (0, 0), stroke: (paint: rgb("#ea580c"), thickness: 2pt))
      content((1.5, 0.8), [Miền nghiệm], fill: rgb("#fff7ed"))
    })
  ]],
  (
    True([Hệ bất phương trình ràng buộc là $cases(3x + 2y <= 36, 2x + 3y <= 36, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của hệ là tứ giác lồi $O A M B$ với các đỉnh $O(0; 0), A(12; 0), M(7","2; 7","2), B(0; 12)$.]),
    True([Hàm lợi nhuận là $F(x, y) = 15x + 18y$ (triệu đồng).]),
    [Để lợi nhuận lớn nhất, cơ sở nên sản xuất số bộ loại $A$ nhiều hơn số bộ loại $B$.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    Điều kiện gỗ: $3x + 2y <= 36$.
    Điều kiện công: $20x + 30y <= 360 <=> 2x + 3y <= 36$.
    Điều kiện thực tế: $x >= 0, y >= 0$. Ý a ĐÚNG.

    #step([Phân tích ý b])
    Giao điểm của $3x + 2y = 36$ và $2x + 3y = 36$:
    Cộng hai phương trình: $5x + 5y = 72 => x + y = 14","4$.
    Trừ hai phương trình: $x - y = 0 => x = y = 7","2$.
    Các đỉnh của miền nghiệm gồm $O(0; 0)$, $A(12; 0)$, $M(7","2; 7","2)$, $B(0; 12)$. Ý b ĐÚNG.

    #step([Phân tích ý c])
    Lợi nhuận mỗi bộ loại $A$ là $15$ triệu, loại $B$ là $18$ triệu nên $F(x, y) = 15x + 18y$ (triệu đồng). Ý c ĐÚNG.

    #step([Phân tích ý d])
    Xét các điểm nguyên lân cận điểm tối ưu thực $M(7","2; 7","2)$:
    - Tại $(7; 7)$: $3(7) + 2(7) = 35 <= 36$ và $2(7) + 3(7) = 35 <= 36$.
    Lợi nhuận: $15(7) + 18(7) = 231$ triệu đồng.
    - Tại $(6; 8)$: $3(6) + 2(8) = 34 <= 36$ và $2(6) + 3(8) = 36 <= 36$.
    Lợi nhuận: $15(6) + 18(8) = 90 + 144 = 234$ triệu đồng.
    - Tại $(8; 6)$: $3(8) + 2(6) = 36 <= 36$ và $2(8) + 3(6) = 34 <= 36$.
    Lợi nhuận: $15(8) + 18(6) = 120 + 108 = 228$ triệu đồng.
    Rõ ràng sản xuất $6$ bộ loại $A$ và $8$ bộ loại $B$ đem lại lợi nhuận $234$ triệu đồng cao hơn (vì bộ loại $B$ có tỷ suất lợi nhuận cao hơn). Do đó số bộ loại $B$ nhiều hơn số bộ loại $A$. Ý d SAI.
  ]
)

// DS 2
#ds(
  [Một công ty chăn nuôi bò thịt cần cung cấp thức ăn chứa hai thành phần dinh dưỡng thiết yếu là protein và khoáng chất. Mỗi ngày đàn bò cần tối thiểu $40$ kg protein và $30$ kg khoáng chất. Công ty sử dụng hai loại thức ăn công nghiệp: Loại $I$ chứa $20%$ protein và $10%$ khoáng chất, giá $10.000$ đồng/kg. Loại $I I$ chứa $10%$ protein và $15%$ khoáng chất, giá $12.000$ đồng/kg. Gọi $x, y$ (kg) lần lượt là khối lượng thức ăn loại $I$ và loại $I I$ cần mua mỗi ngày ($x, y >= 0$).],
  (
    True([Điều kiện protein tương đương với bất phương trình $2x + y >= 200$.]),
    True([Điều kiện khoáng chất tương đương với bất phương trình $2x + 3y >= 600$.]),
    True([Tọa độ giao điểm của hai đường ranh giới giới hạn miền nghiệm là $(0; 200)$...]),
    [Chi phí mua thức ăn thấp nhất mỗi ngày là trên $3$ triệu đồng.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    Lượng protein: $0","2x + 0","1y >= 40 <=> 2x + y >= 200$. Ý a ĐÚNG.

    #step([Phân tích ý b])
    Lượng khoáng chất: $0","1x + 0","15y >= 30 <=> 2x + 3y >= 600$. Ý b ĐÚNG.

    #step([Phân tích ý c])
    Giao điểm của $2x + y = 200$ và $2x + 3y = 600$:
    Trừ vế theo vế: $2y = 400 => y = 200 => 2x = 0 => x = 0$.
    Giao điểm chính là $(0; 200)$. Ý c ĐÚNG.

    #step([Phân tích ý d])
    Hàm chi phí: $C(x, y) = 10.000x + 12.000y$ (đồng).
    Tại $(0; 200)$: $C(0, 200) = 12.000(200) = 2.400.000$ đồng = $2","4$ triệu đồng.
    Tại $(300; 0)$ (giao điểm của $2x + 3y = 600$ với $O x$): $C(300, 0) = 10.000(300) = 3.000.000$ đồng.
    Vậy chi phí thấp nhất là $2","4$ triệu đồng, không vượt quá $3$ triệu đồng. Ý d SAI.
  ]
)

// DS 3
#ds(
  [Một xưởng may xuất khẩu sản xuất hai mặt hàng: Áo khoác (loại $1$) và quần âu (loại $2$). Mỗi chiếc áo khoác cần $2$ m vải len và $1$ m vải lót, lãi $120$ nghìn đồng. Mỗi chiếc quần âu cần $1$ m vải len và $1","5$ m vải lót, lãi $90$ nghìn đồng. Kho hiện có $180$ m vải len và $150$ m vải lót. Thị trường yêu cầu số lượng quần âu sản xuất ra không được vượt quá $80$ chiếc.],
  (
    True([Hệ bất phương trình ràng buộc là $cases(2x + y <= 180, x + 1","5y <= 150, 0 <= y <= 80, x >= 0)$.]),
    True([Nếu xưởng chỉ chuyên sản xuất áo khoác thì sản xuất được tối đa $90$ chiếc và đạt lợi nhuận $10","8$ triệu đồng.]),
    True([Giao điểm của hai đường biên vật liệu $2x + y = 180$ và $x + 1","5y = 150$ là điểm $(60; 60)$.]),
    [Lợi nhuận lớn nhất mà xưởng có thể đạt được là dưới $12$ triệu đồng.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    Vải len: $2x + y <= 180$.
    Vải lót: $x + 1","5y <= 150$.
    Thị trường: $0 <= y <= 80$. Áo khoác: $x >= 0$. Ý a ĐÚNG.

    #step([Phân tích ý b])
    Khi chỉ may áo khoác ($y = 0$): $2x <= 180 => x <= 90$.
    Lợi nhuận: $90 dot 120.000 = 10.800.000$ đồng = $10","8$ triệu đồng. Ý b ĐÚNG.

    #step([Phân tích ý c])
    Hệ $cases(2x + y = 180, x + 1","5y = 150)$.
    Nhân phương trình hai với $2$: $2x + 3y = 300$.
    Trừ phương trình một: $2y = 120 => y = 60 => x = (180 - 60) / 2 = 60$.
    Điểm $(60; 60)$ thỏa mãn $y <= 80$. Ý c ĐÚNG.

    #step([Phân tích ý d])
    Tính lợi nhuận tại các đỉnh:
    - Tại $(90; 0)$: $10","8$ triệu đồng.
    - Tại $(60; 60)$: $L(60, 60) = 60(120) + 60(90) = 7200 + 5400 = 12600$ nghìn đồng = $12","6$ triệu đồng.
    - Tại $y = 80$: $x + 1","5(80) = 150 => x = 30$. Thử vào len: $2(30) + 80 = 140 <= 180$.
    $L(30, 80) = 30(120) + 80(90) = 3600 + 7200 = 10800$ nghìn đồng = $10","8$ triệu đồng.
    Lợi nhuận lớn nhất là $12","6$ triệu đồng > $12$ triệu đồng. Do đó ý d SAI.
  ]
)

// DS 4
#ds(
  [Xét bài toán quy hoạch tuyến tính tổng quát với miền nghiệm $Omega$ là một miền đa giác đóng, bị chặn trong mặt phẳng tọa độ $O x y$, và hàm mục tiêu có dạng $F(x, y) = a x + b y + c$ ($a, b$ không đồng thời bằng $0$).],
  (
    True([Miền nghiệm $Omega$ luôn là một hình đa giác lồi.]),
    True([Hàm mục tiêu $F(x, y)$ luôn đạt giá trị lớn nhất và giá trị nhỏ nhất tại các đỉnh của đa giác $Omega$.]),
    True([Nếu hàm số đạt giá trị lớn nhất tại hai đỉnh kề nhau của đa giác thì nó cũng đạt giá trị lớn nhất tại mọi điểm trên cạnh nối hai đỉnh đó.]),
    [Nếu thay đổi hệ số tự do $c$ thì tọa độ điểm tối ưu của bài toán quy hoạch tuyến tính cũng sẽ thay đổi theo.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    Giao của hữu hạn các nửa mặt phẳng đóng (miền nghiệm của bất phương trình bậc nhất) luôn là một tập lồi. Do đó đa giác $Omega$ luôn lồi. Ý a ĐÚNG.

    #step([Phân tích ý b])
    Theo định lý cơ bản của quy hoạch tuyến tính, cực trị của hàm tuyến tính trên một đa giác lồi bị chặn luôn đạt được tại ít nhất một đỉnh. Ý b ĐÚNG.

    #step([Phân tích ý c])
    Nếu $F(A) = F(B) = M$ là giá trị lớn nhất, với mọi điểm $M_0$ trên đoạn $A B$ ($M_0 = k A + (1 - k)B$ với $0 <= k <= 1$), ta có $F(M_0) = k F(A) + (1 - k)F(B) = k M + (1 - k)M = M$. Do đó mọi điểm trên cạnh nối hai đỉnh đều cho giá trị lớn nhất. Ý c ĐÚNG.

    #step([Phân tích ý d])
    Hàm mục tiêu $F(x, y) = a x + b y + c$. Khi thay đổi $c$, giá trị của $F$ tăng hoặc giảm một lượng như nhau tại mọi điểm $(x, y)$, do đó thứ tự độ lớn của $F$ tại các đỉnh hoàn toàn không đổi. Tọa độ điểm tối ưu $(x_0, y_0)$ không hề thay đổi. Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln(
  [Một hộ gia đình làm nghề thủ công đan giỏ tre có hai loại sản phẩm: Giỏ hoa quả (loại $A$) và giỏ quà tặng (loại $B$). Mỗi giỏ loại $A$ cần $1$ giờ đan nan tre và $2$ giờ trang trí, tiền lãi là $40$ nghìn đồng. Mỗi giỏ loại $B$ cần $2$ giờ đan nan tre và $1$ giờ trang trí, tiền lãi là $50$ nghìn đồng. Trong một tuần, hộ gia đình có thể bố trí tối đa $40$ giờ đan nan tre và $50$ giờ trang trí. Tiền lãi lớn nhất mà hộ gia đình có thể thu được trong tuần bằng bao nhiêu nghìn đồng?],
  [1300],
  loigiai: [
    #step([Hệ điều kiện thời gian])
    Gọi $x, y$ lần lượt là số giỏ loại $A$ và $B$ ($x, y >= 0$).
    - Đan nan: $x + 2y <= 40$.
    - Trang trí: $2x + y <= 50$.
    Hàm tiền lãi: $F(x, y) = 40x + 50y$ (nghìn đồng).

    #step([Tìm giao điểm tối ưu])
    Giao điểm của $x + 2y = 40$ và $2x + y = 50$:
    Cộng hai phương trình: $3x + 3y = 90 => x + y = 30$.
    Nhân đôi phương trình đầu: $2x + 4y = 80$. Trừ phương trình hai: $3y = 30 => y = 10 => x = 20$.
    Tọa độ đỉnh $M(20; 10)$.
    Tính lãi tại các đỉnh:
    - Tại $(20; 10)$: $F(20, 10) = 40(20) + 50(10) = 800 + 500 = 1300$ nghìn đồng.
    - Tại $(25; 0)$: $F(25, 0) = 40(25) = 1000$ nghìn đồng.
    - Tại $(0; 20)$: $F(0, 20) = 50(20) = 1000$ nghìn đồng.
    Lãi lớn nhất là $1300$ nghìn đồng.
  ]
)

// TLN 2
#tln(
  [Một công ty cần vận chuyển $80$ tấn hàng hóa bằng hai loại xe tải: Loại $I$ có trọng tải $4$ tấn, giá cước $1","2$ triệu đồng/chuyến; loại $I I$ có trọng tải $5$ tấn, giá cước $1","4$ triệu đồng/chuyến. Biết công ty chỉ có thể thuê tối đa $12$ xe loại $I$ và $10$ xe loại $I I$. Chi phí thuê xe thấp nhất để chở hết số hàng trên bằng bao nhiêu triệu đồng? (Nhập kết quả dưới dạng số thập phân)],
  [23.2],
  loigiai: [
    #step([Hệ điều kiện tải trọng])
    Gọi $x, y$ lần lượt là số xe loại $I$ và $I I$ cần thuê ($x, y in NN$).
    Điều kiện hàng hóa: $4x + 5y >= 80$.
    Điều kiện giới hạn xe: $0 <= x <= 12, 0 <= y <= 10$.
    Hàm chi phí: $C(x, y) = 1","2x + 1","4y$ (triệu đồng).

    #step([Tìm cực tiểu])
    Kiểm tra các phương án thỏa mãn:
    - Phương án $y = 8, x = 10$: tổng tải trọng $4(10) + 5(8) = 80$ tấn (vừa đủ).
    Chi phí: $C(10, 8) = 1","2(10) + 1","4(8) = 12 + 11","2 = 23","2$ triệu đồng.
    - Phương án $y = 10, x = 8$: tổng tải trọng $4(8) + 5(10) = 82$ tấn.
    Chi phí: $C(8, 10) = 1","2(8) + 1","4(10) = 9","6 + 14 = 23","6$ triệu đồng.
    Vậy chi phí thấp nhất là $23","2$ triệu đồng.
  ]
)

// TLN 3
#tln(
  [Một nông dân có diện tích đất $8$ ha để trồng dưa hấu và dứa. Chi phí trồng dưa hấu là $10$ triệu đồng/ha, trồng dứa là $15$ triệu đồng/ha. Tổng ngân sách dành cho trồng trọt không vượt quá $100$ triệu đồng. Lợi nhuận thu được từ dưa hấu là $30$ triệu đồng/ha, từ dứa là $40$ triệu đồng/ha. Lợi nhuận lớn nhất mà người nông dân có thể thu được bằng bao nhiêu triệu đồng?],
  [280],
  loigiai: [
    #step([Thiết lập hệ bất phương trình])
    Gọi $x, y$ lần lượt là số ha trồng dưa hấu và dứa ($x, y >= 0$).
    - Diện tích: $x + y <= 8$.
    - Ngân sách: $10x + 15y <= 100 <=> 2x + 3y <= 20$.
    Lợi nhuận: $P(x, y) = 30x + 40y$ (triệu đồng).

    #step([Tìm cực đại tại đỉnh miền nghiệm])
    Giao điểm của $x + y = 8$ và $2x + 3y = 20$ là $B(4; 4)$.
    Các đỉnh của miền nghiệm gồm $O(0; 0)$, $A(8; 0)$, $B(4; 4)$, $C(0; 20/3)$.
    - Tại $(8; 0)$: $P(8, 0) = 30(8) = 240$ triệu đồng.
    - Tại $(4; 4)$: $P(4, 4) = 30(4) + 40(4) = 280$ triệu đồng.
    - Tại $(0; 20/3)$: $P(0, 20/3) = 40 dot 20/3 approx 266","7$ triệu đồng.
    Vậy lợi nhuận lớn nhất là $280$ triệu đồng khi trồng $4$ ha dưa hấu và $4$ ha dứa.
  ]
)

// TLN 4
#tln(
  [Một xưởng cơ khí cần sản xuất hai loại sản phẩm $A$ và $B$. Mỗi sản phẩm $A$ lãi $100$ nghìn đồng, mỗi sản phẩm $B$ lãi $60$ nghìn đồng. Do yêu cầu kỹ thuật và công suất máy, số sản phẩm $A$ và $B$ thỏa mãn hệ: $cases(x + y <= 50, 2x + y <= 80, x >= 0, y >= 0)$. Số lượng sản phẩm loại $A$ cần sản xuất để tổng tiền lãi lớn nhất bằng bao nhiêu?],
  [30],
  loigiai: [
    #step([Tìm giao điểm của hai đường ranh giới])
    $cases(x + y = 50, 2x + y = 80) <=> cases(x = 30, y = 20)$.
    Tọa độ đỉnh $M(30; 20)$.

    #step([Tính giá trị tiền lãi tại các đỉnh])
    Hàm tiền lãi: $L(x, y) = 100x + 60y$ (nghìn đồng).
    - Tại $O(0; 0)$: $L = 0$.
    - Tại $A(40; 0)$: $L(40, 0) = 100(40) = 4000$ nghìn đồng.
    - Tại $B(0; 50)$: $L(0, 50) = 60(50) = 3000$ nghìn đồng.
    - Tại $M(30; 20)$: $L(30, 20) = 100(30) + 60(20) = 3000 + 1200 = 4200$ nghìn đồng.
    Lãi lớn nhất đạt tại $(30; 20)$, khi đó số sản phẩm loại $A$ cần sản xuất là $x = 30$.
  ]
)

// TLN 5
#tln(
  [Một công ty chế biến thực phẩm phối trộn hai loại hạt ngũ cốc $X$ và $Y$ để đóng gói thành một loại bột dinh dưỡng tổng hợp. Mỗi kg hạt $X$ có giá $30$ nghìn đồng và chứa $40$ g protein, mỗi kg hạt $Y$ có giá $20$ nghìn đồng và chứa $20$ g protein. Để đảm bảo chất lượng, mỗi mẻ sản phẩm cần tối thiểu $200$ g protein và khối lượng hạt $Y$ không được vượt quá $6$ kg. Chi phí nhỏ nhất của nguyên liệu cho một mẻ sản phẩm bằng bao nhiêu nghìn đồng?],
  [170],
  loigiai: [
    #step([Hệ điều kiện])
    Gọi $x, y$ (kg) lần lượt là khối lượng hạt $X$ và $Y$ cần dùng ($x >= 0, 0 <= y <= 6$).
    Điều kiện protein: $40x + 20y >= 200 <=> 2x + y >= 10$.
    Hàm chi phí: $C(x, y) = 30x + 20y$ (nghìn đồng).

    #step([Tìm cực tiểu])
    Vì $y <= 6$, ta có $2x >= 10 - y >= 10 - 6 = 4 => x >= 2$.
    Các đỉnh của miền chấp nhận được:
    - Khi $y = 6$: $2x + 6 = 10 => x = 2$.
    Chi phí: $C(2, 6) = 30(2) + 20(6) = 60 + 120 = 180$ nghìn đồng.
    - Khi $y = 0$: $2x = 10 => x = 5$.
    Chi phí: $C(5, 0) = 30(5) + 20(0) = 150$ nghìn đồng!
    So sánh: $150 < 180$.
    Chi phí nhỏ nhất là $150$ nghìn đồng khi dùng $5$ kg hạt $X$ và $0$ kg hạt $Y$.
    Đáp số: 150.
  ]
)

// TLN 6
#tln(
  [Cho hai số thực không âm $x, y$ thỏa mãn hệ điều kiện: $cases(x + y <= 6, x + 2y <= 8, x >= 0, y >= 0)$. Giá trị lớn nhất của biểu thức $P = 4x + 3y$ bằng bao nhiêu?],
  [24],
  loigiai: [
    #step([Xác định các đỉnh của miền nghiệm])
    Giao điểm của $x + y = 6$ và $x + 2y = 8$:
    Trừ vế theo vế: $y = 2 => x = 4$. Đỉnh $M(4; 2)$.
    Các đỉnh khác:
    - $O(0; 0)$.
    - $A(6; 0)$ (giao của $x + y = 6$ với $O x$).
    - $B(0; 4)$ (giao của $x + 2y = 8$ với $O y$).

    #step([Tính giá trị biểu thức tại các đỉnh])
    - Tại $O(0; 0)$: $P = 0$.
    - Tại $A(6; 0)$: $P(6, 0) = 4(6) + 3(0) = 24$.
    - Tại $M(4; 2)$: $P(4, 2) = 4(4) + 3(2) = 16 + 6 = 22$.
    - Tại $B(0; 4)$: $P(0, 4) = 4(0) + 3(4) = 12$.
    Vậy giá trị lớn nhất của biểu thức là $24$ đạt tại $(6; 0)$.
  ]
)

]

#make-questions()
