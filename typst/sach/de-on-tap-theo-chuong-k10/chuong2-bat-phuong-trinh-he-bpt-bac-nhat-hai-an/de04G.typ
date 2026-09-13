#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("4f46e5") // Indigo hiện đại

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 2",
  exam-title: "BÀI 4: QUY HOẠCH TUYẾN TÍNH NÂNG CAO (ĐỀ SỐ 4 - CÔNG NGHỆ CAO & NĂNG LƯỢNG MỚI)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "107",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

// ═══════════════════════════════════════════════════════════════════
// HÀM RENDER NỘI DUNG ĐỀ THI
// ═══════════════════════════════════════════════════════════════════
#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1: Phân tích biến số linh kiện bán dẫn
#tn([Một nhà máy sản xuất linh kiện bán dẫn chế tạo $x$ vi xử lý loại $A$ và $y$ cảm biến vi mạch loại $B$. Do quy trình kỹ thuật đóng gói chip, mỗi ngày nhà máy sản xuất không quá $50$ vi xử lý loại $A$ và số lượng cảm biến $B$ không được vượt quá hai lần số vi xử lý $A$. Hệ bất phương trình mô tả các điều kiện thực tế trên là:],
    (
        [$cases(x <= 50, y <= 2x)$],
        [$cases(0 < x <= 50, y < 2x)$],
        True([$cases(0 <= x <= 50, 0 <= y <= 2x, x in NN, y in NN)$]),
        [$cases(x + y <= 50, x >= 2y)$]
    ),
    loigiai: [
        #step([Lập bảng phân tích điều kiện công nghệ])
        #align(center)[
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Linh kiện], [Số lượng ($NN$)], [Quy chuẩn sản xuất],
          [Vi xử lý A], [$x$ chiếc], [Không âm, tối đa $50$ chiếc ($0 <= x <= 50$)],
          [Cảm biến B], [$y$ chiếc], [Không âm, không quá $2$ lần $A$ ($0 <= y <= 2x$)]
        )
        ]
        Vì số lượng là số tự nhiên nên hệ điều kiện đúng là $cases(0 <= x <= 50, 0 <= y <= 2x, x in NN, y in NN)$.
    ]
)

// TN 2: Ràng buộc kim loại hiếm Coban và Niken
#tn([Để chế tạo một pack pin thể rắn cần $3" g"$ Coban và $5" g"$ Niken; một pack pin LFP cần $1" g"$ Coban và $6" g"$ Niken. Kho vật liệu có tối đa $60" g"$ Coban và $120" g"$ Niken. Gọi $x, y$ lần lượt là số pack pin thể rắn và pin LFP sản xuất ($x, y >= 0$). Bất phương trình ràng buộc lượng Coban là:],
    (
        [$5x + 6y <= 120$],
        True([$3x + y <= 60$]),
        [$3x + 5y <= 60$],
        [$x + 6y <= 120$]
    ),
    loigiai: [
        #step([Lập bảng tiêu hao kim loại Coban])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Kim loại], [Pin thể rắn ($x$ pack)], [Pin LFP ($y$ pack)], [Trữ lượng kho],
          [Coban ($"g"$)], [$3$], [$1$], [Tối đa $60" g"$]
        )
        ]
        Tổng khối lượng Coban cần dùng là $3x + y <= 60$.
    ]
)

// TN 3: Kiểm tra điểm phương án công nghệ khả thi
#tn([Quy trình phủ màng quang học cho kính viễn vọng có hệ bất phương trình ràng buộc $cases(x + 2y <= 18, 3x + y <= 21, x >= 0, y >= 0)$ với $x$ là số mẻ phủ kính lớn, $y$ là số mẻ phủ kính nhỏ. Phương án nào sau đây *không* thuộc miền nghiệm của hệ?],
    (
        [$(3; 5)$],
        [$(5; 4)$],
        [$(6; 2)$],
        True([$(6; 4)$])
    ),
    loigiai: [
        #step([Kiểm tra phương án])
        Thay $(6; 4)$ vào hệ: $3x + y = 3(6) + 4 = 22 > 21$ (vi phạm). Vậy $(6; 4)$ không thuộc miền nghiệm.
    ]
)

// TN 4: Nửa mặt phẳng biểu diễn công suất quang điện
#tn([Một trạm phát điện mặt trời có hai cụm pin mono ($x$ MW) và poly ($y$ MW) thỏa mãn $2x + 3y >= 60$. Điểm nào sau đây thuộc miền nghiệm của bất phương trình trên?],
    (
        [$(10; 10)$],
        [$(15; 8)$],
        True([$(20; 10)$]),
        [$(12; 11)$]
    ),
    loigiai: [
        #step([Thử giá trị công suất])
        Tại $(20; 10)$: $2x + 3y = 2(20) + 3(10) = 70 >= 60$ (thỏa mãn).
    ]
)

// TN 5: Tìm tọa độ giao điểm biên của hệ vi mạch
#tn([Trong bài toán quy hoạch sản xuất bo mạch điện tử, miền nghiệm bị giới hạn bởi hai đường biên $d_1: 3x + 4y = 36$ và $d_2: 2x + y = 14$. Tọa độ giao điểm của hai đường biên này là:],
    (
        [$(3; 6)$],
        True([$(4; 6)$]),
        [$(6; 2)$],
        [$(5; 4)$]
    ),
    loigiai: [
        #step([Giải hệ phương trình đường biên])
        $ cases(3x + 4y = 36, 2x + y = 14) <=> cases(3x + 4(14 - 2x) = 36, y = 14 - 2x) <=> cases(x = 4, y = 6) $. Tọa độ giao điểm là $(4; 6)$.
    ]
)

// TN 6: Hệ bất phương trình 3 điều kiện công đoạn chip
#tn([Một phân xưởng đúc chip AI cần trải qua ba công đoạn: Khắc tia cực tím EUV, Lắng đọng hơi hóa học CVD, và Đóng gói vi mạch BGA. Thời gian cho 1 tấm wafer loại X cần lần lượt $2$ giờ EUV, $1$ giờ CVD, $3$ giờ BGA; loại Y cần $1$ giờ EUV, $2$ giờ CVD, $2$ giờ BGA. Thời gian tối đa của ba công đoạn lần lượt là $16$ giờ, $14$ giờ, $24$ giờ. Hệ bất phương trình mô tả số tấm wafer $x, y$ là:],
    (
        [$cases(2x + y <= 16, x + 2y <= 14, x >= 0, y >= 0)$],
        True([$cases(2x + y <= 16, x + 2y <= 14, 3x + 2y <= 24, x >= 0, y >= 0)$]),
        [$cases(3x + y <= 16, 2x + 2y <= 14, x + 3y <= 24, x >= 0, y >= 0)$],
        [$cases(2x + 3y <= 16, x + 2y <= 14, 3x + 2y <= 24)$]
    ),
    loigiai: [
        #step([Lập bảng ma trận 3 công đoạn chip])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Công đoạn], [Wafer X ($x$)], [Wafer Y ($y$)], [Tối đa],
          [EUV], [$2" h"$], [$1" h"$], [$16" h"$],
          [CVD], [$1" h"$], [$2" h"$], [$14" h"$],
          [BGA], [$3" h"$], [$2" h"$], [$24" h"$]
        )
        ]
        Hệ điều kiện 3 công đoạn là $cases(2x + y <= 16, x + 2y <= 14, 3x + 2y <= 24, x >= 0, y >= 0)$.
    ]
)

// TN 7: Nhận diện đỉnh của miền tam giác năng lượng
#tn([Một cụm phát điện hỗn hợp có miền nghiệm tam giác $O A B$ với $O(0; 0), A(12; 0), B(6; 6)$. Giá trị lớn nhất của biểu thức công suất $P(x, y) = 15x + 20y$ (kW) trên miền nghiệm là:],
    (
        [$180" kW"$],
        True([$210" kW"$]),
        [$240" kW"$],
        [$150" kW"$]
    ),
    loigiai: [
        #step([Tính công suất tại các đỉnh])
        $P(O) = 0$; $P(A) = 15(12) = 180$; $P(B) = 15(6) + 20(6) = 210$. Công suất lớn nhất đạt $210" kW"$ tại $B(6; 6)$.
    ]
)

// TN 8: Điều kiện bảo toàn tỷ lệ vật liệu bán dẫn
#tn([Để chế tạo thanh bán dẫn nhiệt điện, số mol hợp chất $A$ ($x$) và $B$ ($y$) phải đảm bảo: số mol $B$ ít nhất bằng một nửa số mol $A$, nhưng không vượt quá $3$ lần số mol $A$. Bất phương trình kép biểu diễn mối quan hệ này là:],
    (
        [$x/2 <= y <= 3x$],
        [$2x <= y <= 3x$],
        True([$1/2 x <= y <= 3x <=> cases(x - 2y <= 0, 3x - y >= 0)$]),
        [$x <= 2y <= 6x$]
    ),
    loigiai: [
        #step([Phân tích tỷ lệ số mol])
        Theo bài toán: $1/2 x <= y <= 3x <=> cases(y >= 1/2 x, y <= 3x) <=> cases(x - 2y <= 0, 3x - y >= 0)$.
    ]
)

// TN 9: Tìm min chi phí vật liệu đất hiếm
#tn([Một viện nghiên cứu mua hai loại bột đất hiếm: loại I ($x$ kg, giá $30$ triệu/kg) và loại II ($y$ kg, giá $40$ triệu/kg). Miền nghiệm ràng buộc các nguyên tố Neody và Dysprosi có các đỉnh biên $A(0; 6), B(4; 2), C(8; 0)$. Chi phí nhỏ nhất để mua đất hiếm là:],
    (
        [$240$ triệu đồng],
        [$220$ triệu đồng],
        True([$200$ triệu đồng]),
        [$180$ triệu đồng]
    ),
    loigiai: [
        #step([Tính chi phí tại các đỉnh])
        $C(A) = 40(6) = 240$; $C(B) = 30(4) + 40(2) = 200$; $C(C) = 30(8) = 240$. Chi phí nhỏ nhất là $200$ triệu đồng tại $B(4; 2)$.
    ]
)

// TN 10: Giới hạn ngân sách R&D công nghệ
#tn([Một tập đoàn công nghệ có ngân sách nghiên cứu tối đa $150$ triệu đồng cho hai dự án Trí tuệ nhân tạo ($x$ tháng) và Lượng tử ($y$ tháng). Chi phí mỗi tháng của AI là $15$ triệu đồng, của Lượng tử là $25$ triệu đồng. Bất phương trình ngân sách rút gọn là:],
    (
        [$3x + 5y >= 30$],
        True([$3x + 5y <= 30$]),
        [$5x + 3y <= 30$],
        [$3x + 5y <= 150$]
    ),
    loigiai: [
        #step([Rút gọn bất phương trình ngân sách])
        $15x + 25y <= 150 <=> 3x + 5y <= 30$ (chia cả hai vế cho $5$).
    ]
)

// TN 11: Xác định hệ số góc và mức độ ưu tiên
#tn([Cho hàm mục tiêu lợi nhuận $F(x, y) = 80x + 120y$ (triệu đồng). Đường mức của hàm mục tiêu ứng với mức lợi nhuận $240$ triệu đồng là đường thẳng có phương trình:],
    (
        [$2x + 3y = 12$],
        True([$2x + 3y = 6$]),
        [$3x + 2y = 6$],
        [$4x + 6y = 24$]
    ),
    loigiai: [
        #step([Rút gọn phương trình đường mức])
        $80x + 120y = 240 <=> 2x + 3y = 6$ (chia cả hai vế cho $40$).
    ]
)

// TN 12: Đánh giá điểm nguyên tối ưu lân cận
#tn([Miền nghiệm của một hệ bất phương trình kỹ thuật có đỉnh lý thuyết là điểm cực đại $M(3.4; 5.2)$. Nếu $x, y$ bắt buộc phải là các số nguyên dương ($x, y in NN^*$), điểm nào sau đây có khả năng là phương án nguyên tối ưu nhất thuộc miền nghiệm?],
    (
        [$(4; 6)$],
        True([$(3; 5)$]),
        [$(4; 5)$],
        [$(3; 6)$]
    ),
    loigiai: [
        #step([Phân tích điểm nguyên lân cận])
        Điểm $(3; 5)$ nằm sát phía trong đỉnh $M(3.4; 5.2)$ nên thuộc miền nghiệm và đạt giá trị tối ưu.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

#pagebreak()

// DS 1: Sản xuất Cell Pin Lithium công nghệ cao - 3 RÀNG BUỘC KIM LOẠI
#ds([Một nhà máy công nghệ cao sản xuất hai loại cell pin: Cell dung lượng cao ($x$ nghìn cell) và Cell sạc siêu nhanh ($y$ nghìn cell). Quá trình sản xuất yêu cầu ba kim loại chiến lược: Coban ($"Co"$), Niken ($"Ni"$) và Liti ($"Li"$). Mỗi nghìn cell dung lượng cao cần $2" kg" "Co", 1" kg" "Ni", 1" kg" "Li"$, lãi $50$ triệu. Mỗi nghìn cell sạc nhanh cần $1" kg" "Co", 2" kg" "Ni", 1" kg" "Li"$, lãi $60$ triệu. Hạn ngạch nguyên liệu kho: Coban tối đa $16" kg"$, Niken tối đa $16" kg"$, Liti tối đa $10" kg"$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc cả 3 kim loại chiến lược là $cases(2x + y <= 16, x + 2y <= 16, x + y <= 10, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của bài toán là một hình ngũ giác lồi có 5 đỉnh gồm $O(0; 0), A(8; 0), B(6; 4), C(4; 6), D(0; 8)$.]),
    True([Nếu nhà máy sản xuất $6$ nghìn cell dung lượng cao và $4$ nghìn cell sạc nhanh thì tiền lãi thu được là $540$ triệu đồng.]),
    True([Lợi nhuận lớn nhất nhà máy đạt được là $560$ triệu đồng khi sản xuất $4$ nghìn cell dung lượng cao và $6$ nghìn cell sạc nhanh.])
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập bảng 3 kim loại chiến lược và thiết lập hệ bất phương trình])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        inset: (x: 8pt, y: 1.5pt),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Kim loại chiến lược], [Cell dung lượng cao ($x$)], [Cell sạc nhanh ($y$)], [Hạn ngạch kho],
        [Coban ($"Co"$)], [$2" kg"$], [$1" kg"$], [$16" kg"$],
        [Niken ($"Ni"$)], [$1" kg"$], [$2" kg"$], [$16" kg"$],
        [Liti ($"Li"$)], [$1" kg"$], [$1" kg"$], [$10" kg"$],
        [Tiền lãi thu được], [$50$ triệu], [$60$ triệu], [$F(x, y)$]
      )

      #v(2pt)
      *Hệ BPT 3 kim loại chiến lược:*
      $ cases(
        2x + y <= 16 quad &(d_1),
        x + 2y <= 16 quad &(d_2),
        x + y <= 10 quad &(d_3),
        x >= 0, y >= 0
      ) $
      $=>$ *Mệnh đề a) là Đúng*.
    ]

    #step([Xác định tọa độ đỉnh miền nghiệm, tối ưu hóa và hình vẽ CeTZ])
    - Giao biên: $B(6; 4) = (d_1) inter (d_3)$, $C(4; 6) = (d_2) inter (d_3)$. Ngũ giác $O(0; 0), A(8; 0), B, C, D(0; 8)$ $=>$ *Ý b) Đúng*.

    #align(center)[
    #grid(
      columns: (auto, auto),
      gutter: 24pt,
      align: horizon,
      [
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          inset: (x: 5pt, y: 1.8pt),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Tính giá trị $F(x, y)$], [Tiền lãi (triệu)],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(8; 0)$], [$50(8)$], [$400$],
          [$B(6; 4)$], [$50(6) + 60(4)$], [$540$],
          [$C(4; 6)$], [$50(4) + 60(6)$], [$560$ (cực đại)],
          [$D(0; 8)$], [$60(8)$], [$480$]
        )
        #v(1pt)
        #text(size: 8.5pt)[- Phương án $(6; 4)$ thu lãi $540$ triệu $=>$ *Ý c) Đúng*.        - Lãi lớn nhất đạt $560$ triệu tại $C(4; 6)$ $=>$ *Ý d) Đúng*.]
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.22
          let xmax = 9.5
          let ymax = 9.5
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (8 * sc, 0), (6 * sc, 4 * sc), (4 * sc, 6 * sc), (0, 8 * sc), close: true)
          
          line((4 * sc, 8 * sc), (9 * sc, -2 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((8.8 * sc, 1.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((-1 * sc, 8.5 * sc), (10 * sc, 3 * sc), stroke: 1.1pt + rgb("059669"))
          content((1.8 * sc, 9 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$(d_2)$]])
          
          line((2 * sc, 8 * sc), (9 * sc, 1 * sc), stroke: 1.1pt + rgb("d97706"))
          content((7.2 * sc, 3.8 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("d97706"), size: 6.5pt, weight: "bold")[$(d_3)$]])
          
          line((4 * sc, 6 * sc), (4 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((4 * sc, 6 * sc), (0, 6 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-0.5 * sc, 0), ((xmax + 0.5) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 0.8) * sc, 0), [$x$])
          line((0, -0.5 * sc), (0, (ymax + 0.5) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 0.8) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((8 * sc, 0), radius: 2pt, fill: black)
          content((8 * sc, -0.25), [#text(size: 7pt, weight: "bold")[$A$]])
          circle((6 * sc, 4 * sc), radius: 2pt, fill: black)
          content((6 * sc + 0.35, 4 * sc + 0.15), [#text(size: 7pt, weight: "bold")[$B$]])
          circle((0, 8 * sc), radius: 2pt, fill: black)
          content((-0.28, 8 * sc), [#text(size: 7pt, weight: "bold")[$D$]])
          
          circle((4 * sc, 6 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((4 * sc + 0.75, 6 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$C(4; 6)$]])
        })
      ]
    )
    ]
  ]
)

#pagebreak()
// DS 2: Sản xuất Thiết bị năng lượng tái tạo - 3 CÔNG ĐOẠN & TỶ LỆ KỸ THUẬT
#ds([Một nhà máy sản xuất: Turbine gió ($x$ tổ máy, lãi $40$ triệu) và Cụm pin quang điện ($y$ hệ thống, lãi $30$ triệu) qua 3 xưởng: Cơ khí composite (tối đa $30" h"$), Mạch biến tần (tối đa $24" h"$), Trạm kiểm định (tối đa $16" h"$). Để làm $1$ tổ turbine gió cần $3" h"$ cơ khí, $1" h"$ biến tần, $1" h"$ kiểm định; $1$ cụm pin cần $1" h"$ cơ khí, $2" h"$ biến tần, $1" h"$ kiểm định. Cân bằng lưới yêu cầu $y <= 2x$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc gồm 3 công đoạn và điều kiện tỷ lệ là $cases(3x + y <= 30, x + 2y <= 24, x + y <= 16, 2x - y >= 0, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của bài toán là một hình đa giác có 5 đỉnh gồm $O(0; 0), A(10; 0), B(7; 9), C(8; 8), D(4; 8)$ với $C$ và $D$ là các đỉnh biên.]),
    False([Nhà máy nên chỉ sản xuất cụm pin quang điện để tối đa hóa lợi nhuận.]),
    True([Lợi nhuận lớn nhất nhà máy đạt được là $560$ triệu đồng khi sản xuất $8$ tổ turbine gió và $8$ cụm pin quang điện.])
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập bảng 3 công đoạn xưởng và thiết lập hệ bất phương trình])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        inset: (x: 8pt, y: 1.5pt),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Công đoạn xưởng], [Turbine gió ($x$)], [Cụm pin ($y$)], [Quỹ thời gian],
        [Cơ khí composite], [$3" h"$], [$1" h"$], [$30" h"$],
        [Mạch biến tần], [$1" h"$], [$2" h"$], [$24" h"$],
        [Trạm kiểm định], [$1" h"$], [$1" h"$], [$16" h"$],
        [Lợi nhuận / tổ máy], [$40$ triệu], [$30$ triệu], [$F(x, y)$]
      )

      #v(2pt)
      *Hệ BPT 3 công đoạn và điều kiện cân bằng lưới $y <= 2x$:*
      $ cases(
        3x + y <= 30 quad &(d_1),
        x + 2y <= 24 quad &(d_2),
        x + y <= 16 quad &(d_3),
        2x - y >= 0 quad &(Delta),
        x >= 0, y >= 0
      ) $
      $=>$ *Mệnh đề a) là Đúng*.
    ]

    #step([Xác định tọa độ đỉnh miền nghiệm, tối ưu hóa và hình vẽ CeTZ])
    - Giao biên: $B(7; 9) = (d_1) inter (d_3)$, $C(8; 8) = (d_3) inter (d_2)$, $D(4; 8) = (d_2) inter (Delta)$. Đa giác $O, A(10; 0), B, C, D$ $=>$ *Ý b) Đúng*.

    #align(center)[
    #grid(
      columns: (auto, auto),
      gutter: 24pt,
      align: horizon,
      [
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          inset: (x: 5pt, y: 1.8pt),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Tính giá trị $F(x, y)$], [Lợi nhuận (triệu)],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(10; 0)$], [$40(10)$], [$400$],
          [$B(7; 9)$], [$40(7) + 30(9)$], [$550$],
          [$C(8; 8)$], [$40(8) + 30(8)$], [$560$ (cực đại)],
          [$D(4; 8)$], [$40(4) + 30(8)$], [$400$]
        )
        #v(1pt)
        #text(size: 8.5pt)[- Vì $y <= 2x$ nên không thể chỉ làm pin quang điện $=>$ *Ý c) Sai*.        - Lợi nhuận lớn nhất đạt $560$ triệu tại $C(8; 8)$ $=>$ *Ý d) Đúng*.]
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.20
          let xmax = 11.5
          let ymax = 13.5
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (10 * sc, 0), (7 * sc, 9 * sc), (8 * sc, 8 * sc), (4 * sc, 8 * sc), close: true)
          
          line((7.5 * sc, 7.5 * sc), (11 * sc, -3 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((10.8 * sc, 1.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((-1 * sc, 12.5 * sc), (12 * sc, 6 * sc), stroke: 1.1pt + rgb("059669"))
          content((1.8 * sc, 12.5 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$(d_2)$]])
          
          line((0, 0), (6 * sc, 12 * sc), stroke: 1.1pt + rgb("7c3aed"))
          content((5.2 * sc, 11.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("7c3aed"), size: 6.5pt, weight: "bold")[$(Delta)$]])
          
          line((8 * sc, 8 * sc), (8 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((8 * sc, 8 * sc), (0, 8 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-0.5 * sc, 0), ((xmax + 0.5) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 0.8) * sc, 0), [$x$])
          line((0, -0.5 * sc), (0, (ymax + 0.5) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 0.8) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((10 * sc, 0), radius: 2pt, fill: black)
          content((10 * sc, -0.25), [#text(size: 7pt, weight: "bold")[$A$]])
          circle((4 * sc, 8 * sc), radius: 2pt, fill: black)
          content((4 * sc - 0.28, 8 * sc + 0.2), [#text(size: 7pt, weight: "bold")[$D$]])
          
          circle((8 * sc, 8 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((8 * sc + 0.75, 8 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$C(8; 8)$]])
        })
      ]
    )
    ]
  ]
)

#pagebreak()
// DS 3: Phối trộn Hợp kim Titan hàng không vũ trụ - BÀI TOÁN CỰC TIỂU 3 TIÊU CHUẨN
#ds([Để chế tạo vỏ tàu vũ trụ, viện luyện kim phối trộn: Hợp kim Titan-Alpha ($x$ tấn, giá $15$ triệu/tấn) và Hợp kim Titan-Beta ($y$ tấn, giá $20$ triệu/tấn). Hỗn hợp phải thỏa mãn ba tiêu chuẩn: bền kéo (ít nhất $14$), chống ăn mòn (ít nhất $10$), và chịu nhiệt (ít nhất $18$). Mỗi tấn Titan-Alpha cung cấp $2$ bền kéo, $1$ ăn mòn, $1$ chịu nhiệt. Mỗi tấn Titan-Beta cung cấp $1$ bền kéo, $1$ ăn mòn, $3$ chịu nhiệt. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc 3 tiêu chuẩn kỹ thuật là $cases(2x + y >= 14, x + y >= 10, x + 3y >= 18, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của bài toán là một miền đa giác mở không giới hạn có 4 đỉnh bờ gồm $A(0; 14), B(4; 6), C(6; 4), D(18; 0)$.]),
    True([Tại phương án phối trộn $4$ tấn Titan-Alpha và $6$ tấn Titan-Beta, tổng chi phí là $180$ triệu đồng.]),
    True([Phương án phối trộn tối ưu có chi phí thấp nhất là $170$ triệu đồng khi sử dụng $6$ tấn Titan-Alpha và $4$ tấn Titan-Beta.])
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập bảng 3 tiêu chuẩn kỹ thuật vỏ tàu vũ trụ và thiết lập hệ BPT])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        inset: (x: 8pt, y: 1.5pt),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Tiêu chuẩn kỹ thuật], [Titan-Alpha ($x$)], [Titan-Beta ($y$)], [Định mức tối thiểu],
        [Độ bền kéo], [$2$ đơn vị], [$1$ đơn vị], [Ít nhất $14$],
        [Chống ăn mòn], [$1$ đơn vị], [$1$ đơn vị], [Ít nhất $10$],
        [Khả năng chịu nhiệt], [$1$ đơn vị], [$3$ đơn vị], [Ít nhất $18$],
        [Đơn giá / tấn], [$15$ triệu], [$20$ triệu], [$C(x, y)$]
      )

      #v(2pt)
      *Hệ BPT 3 tiêu chuẩn kỹ thuật vỏ tàu vũ trụ:*
      $ cases(
        2x + y >= 14 quad &(d_1),
        x + y >= 10 quad &(d_2),
        x + 3y >= 18 quad &(d_3),
        x >= 0, y >= 0
      ) $
      $=>$ *Mệnh đề a) là Đúng*.
    ]

    #step([Xác định tọa độ đỉnh bờ, tối ưu hóa chi phí và hình vẽ CeTZ])
    - Giao bờ: $B(4; 6) = (d_1) inter (d_2)$, $C(6; 4) = (d_2) inter (d_3)$. Các đỉnh bờ $A(0; 14), B, C, D(18; 0)$ $=>$ *Ý b) Đúng*.

    #align(center)[
    #grid(
      columns: (auto, auto),
      gutter: 24pt,
      align: horizon,
      [
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          inset: (x: 5pt, y: 1.8pt),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh bờ $(x; y)$], [Tính chi phí $C(x, y)$], [Chi phí (triệu)],
          [$A(0; 14)$], [$20(14)$], [$280$],
          [$B(4; 6)$], [$15(4) + 20(6)$], [$180$],
          [$C(6; 4)$], [$15(6) + 20(4)$], [$170$ (nhỏ nhất)],
          [$D(18; 0)$], [$15(18)$], [$270$]
        )
        #v(1pt)
        #text(size: 8.5pt)[
          - Tại $(4; 6)$ chi phí là $180$ triệu $=>$ *Ý c) Đúng*.          - Chi phí cực tiểu đạt $170$ triệu tại $C(6; 4)$ $=>$ *Ý d) Đúng*.
        ]
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.17
          let xmax = 20
          let ymax = 16
          
          fill(rgb("eff6ff"))
          line((0, 16 * sc), (0, 14 * sc), (4 * sc, 6 * sc), (6 * sc, 4 * sc), (18 * sc, 0), (20 * sc, 0), (20 * sc, 16 * sc), close: true, stroke: none)
          
          line((-0.5 * sc, 15 * sc), (8 * sc, -2 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((8.2 * sc, 1.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((0, 10 * sc), (12 * sc, -2 * sc), stroke: 1.1pt + rgb("059669"))
          content((1.8 * sc, 9.5 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$(d_2)$]])
          
          line((-1 * sc, 6.33 * sc), (20 * sc, -0.67 * sc), stroke: 1.1pt + rgb("d97706"))
          content((19 * sc, 2.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("d97706"), size: 6.5pt, weight: "bold")[$(d_3)$]])
          
          line((6 * sc, 4 * sc), (6 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((6 * sc, 4 * sc), (0, 4 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 1) * sc, 0), [$x$])
          line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 1) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((0, 14 * sc), radius: 2pt, fill: black)
          content((0.35, 14 * sc + 0.12), [#text(size: 7pt, weight: "bold")[$A$]])
          circle((4 * sc, 6 * sc), radius: 2pt, fill: black)
          content((4 * sc - 0.28, 6 * sc + 0.2), [#text(size: 7pt, weight: "bold")[$B$]])
          circle((18 * sc, 0), radius: 2pt, fill: black)
          content((18 * sc, -0.25), [#text(size: 7pt, weight: "bold")[$D$]])
          
          circle((6 * sc, 4 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((6 * sc + 0.85, 4 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$C(6; 4)$]])
        })
      ]
    )
    ]
  ]
)

#pagebreak()
// DS 4: Điều độ Lưới điện thông minh Smart Grid - HẠN MỨC ĐA KÊNH
#ds([Một trung tâm điều độ lưới điện thông minh phối hợp hai nguồn phát: Điện mặt trời ($x$ MW, doanh thu $12$ triệu/MW) và Pin lưu trữ BESS ($y$ MW, doanh thu $18$ triệu/MW). Tổng công suất phát qua trạm không vượt quá $80" MW"$. Chi phí vận hành mỗi ngày là $2$ triệu đồng/MW điện mặt trời và $5$ triệu đồng/MW pin lưu trữ, với tổng ngân sách tối đa $260$ triệu đồng/ngày. Để bảo đảm cấp điện ban đêm, công suất pin lưu trữ tối thiểu phải đạt $20" MW"$. Đồng thời, để ổn định tần số lưới điện, công suất điện mặt trời phải đạt ít nhất $1.5$ lần công suất pin lưu trữ. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc vận hành lưới điện là $cases(x + y <= 80, 2x + 5y <= 260, y >= 20, 2x - 3y >= 0, x >= 0)$.]),
    True([Giao điểm của hai đường thẳng $x + y = 80$ và $2x + 5y = 260$ là đỉnh $B(46.67; 33.33)$ nhưng vi phạm điều kiện $2x - 3y >= 0$.]),
    True([Miền nghiệm thực tế là một hình tam giác với các đỉnh $M_1(30; 20), M_2(60; 20), M_3(48; 32)$.]),
    True([Doanh thu lớn nhất mà trung tâm điều độ đạt được trong ngày là $1152$ triệu đồng.])
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập bảng chỉ tiêu kỹ thuật lưới điện và hệ bất phương trình])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        inset: (x: 8pt, y: 1.5pt),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Chỉ tiêu kỹ thuật], [Điện MT ($x$)], [Pin BESS ($y$)], [Định mức tiêu chuẩn],
        [Công suất phát], [$1" MW"$], [$1" MW"$], [Tối đa $80" MW"$],
        [Chi phí vận hành], [$2$ triệu], [$5$ triệu], [Tối đa $260$ triệu],
        [Dự trữ ban đêm], [Không], [$1" MW"$], [Tối thiểu $20" MW"$],
        [Ổn định tần số], [$2$], [$-3$], [$2x - 3y >= 0$],
        [Doanh thu / MW], [$12$ triệu], [$18$ triệu], [$R(x, y)$]
      )

      #v(2pt)
      *Hệ BPT vận hành lưới điện:*
      $ cases(
        x + y <= 80 quad &(d_1),
        2x + 5y <= 260 quad &(d_2),
        y >= 20 quad &(d_3),
        2x - 3y >= 0 quad &(Delta),
        x >= 0
      ) $
      $=>$ *Mệnh đề a) là Đúng*.
    ]

    #step([Xác định tọa độ đỉnh tam giác, so sánh doanh thu và hình vẽ CeTZ])
    - Giao $(d_1), (d_2)$ là $(46.67; 33.33)$ vi phạm $2x - 3y >= 0$ $=>$ *Ý b) Đúng*. Tam giác $M_1(30; 20), M_2(60; 20), M_3(48; 32)$ $=>$ *Ý c) Đúng*.

    #align(center)[
    #grid(
      columns: (auto, auto),
      gutter: 24pt,
      align: horizon,
      [
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          inset: (x: 5pt, y: 1.8pt),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh tam giác], [Tính $R(x, y)$], [Doanh thu (triệu)],
          [$M_1(30; 20)$], [$12(30) + 18(20)$], [$720$],
          [$M_2(60; 20)$], [$12(60) + 18(20)$], [$1080$],
          [$M_3(48; 32)$], [$12(48) + 18(32)$], [$1152$ (cực đại)]
        )
        #v(1pt)
        #text(size: 8.5pt)[- Doanh thu cực đại đạt $1152$ triệu đồng tại phương án $M_3(48; 32)$ $=>$ *Ý d) Đúng*.]
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.040
          let xmax = 85
          let ymax = 48
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((30 * sc, 20 * sc), (60 * sc, 20 * sc), (48 * sc, 32 * sc), close: true)
          
          line((20 * sc, 60 * sc), (85 * sc, -5 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((84 * sc, 2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((0, 20 * sc), (80 * sc, 20 * sc), stroke: 1.1pt + rgb("059669"))
          content((10 * sc, 22 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$(d_3)$]])
          
          line((0, 0), (60 * sc, 40 * sc), stroke: 1.1pt + rgb("7c3aed"))
          content((40 * sc, 28 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("7c3aed"), size: 6.5pt, weight: "bold")[$(Delta)$]])
          
          line((48 * sc, 32 * sc), (48 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((48 * sc, 32 * sc), (0, 32 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-3 * sc, 0), ((xmax + 3) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 5) * sc, 0), [$x$])
          line((0, -3 * sc), (0, (ymax + 3) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 5) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((30 * sc, 20 * sc), radius: 2pt, fill: black)
          content((30 * sc - 0.2, 20 * sc - 0.25), [#text(size: 6.5pt, weight: "bold")[$M_1$]])
          circle((60 * sc, 20 * sc), radius: 2pt, fill: black)
          content((60 * sc + 0.2, 20 * sc - 0.25), [#text(size: 6.5pt, weight: "bold")[$M_2$]])
          
          circle((48 * sc, 32 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((48 * sc + 0.75, 32 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$M_3$]])
        })
      ]
    )
    ]
  ]
)

#pagebreak()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1: Tối ưu tấm pin năng lượng mặt trời dân dụng
#tln([Một hộ gia đình lắp đặt hệ thống điện mặt trời gồm $x$ tấm pin loại $400" W"$ (giá $2$ triệu đồng/tấm) và $y$ tấm pin loại $550" W"$ (giá $3$ triệu đồng/tấm). Mái nhà có diện tích lắp đặt tối đa $18$ tấm pin, và tổng ngân sách gia đình có không quá $42$ triệu đồng. Tìm công suất cực đại (đơn vị: kW) mà hệ thống điện mặt trời có thể tạo ra.],
    [8.1],
    loigiai: [
        #step([Lập bảng chi phí và công suất pin])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Tấm 400 W ($x$)], [Tấm 550 W ($y$)], [Hạn mức gia đình],
          [Diện tích mái], [$1$ tấm], [$1$ tấm], [Tối đa $18$ tấm],
          [Giá tiền (triệu)], [$2$], [$3$], [Tối đa $42$ triệu],
          [Công suất (W)], [$400$], [$550$], [$P(x, y) = 400x + 550y$]
        )
        ]
        Hệ bất phương trình: $cases(x + y <= 18, 2x + 3y <= 42, x >= 0, y >= 0, x, y in NN)$.
        Giao điểm biên: $cases(x + y = 18, 2x + 3y = 42) <=> cases(x = 12, y = 6)$.
        Công suất: $P(12, 6) = 400(12) + 550(6) = 4800 + 3300 = 8100" W" = 8.1" kW"$.
    ]
)

// TLN 2: Luyện hợp kim bán dẫn chịu áp lực
#tln([Một mẻ hợp kim siêu bán dẫn cần pha trộn $x$ kg Silic tinh khiết (giá $40$ nghìn đồng/kg) và $y$ kg Gali (giá $90$ nghìn đồng/kg). Yêu cầu kỹ thuật bắt buộc: tổng khối lượng ít nhất $20" kg"$, tỷ lệ phối trộn yêu cầu khối lượng Silic không ít hơn khối lượng Gali, và khối lượng Gali tối thiểu là $5" kg"$. Chi phí nguyên liệu thấp nhất của mẻ luyện (đơn vị: nghìn đồng) là bao nhiêu?],
    [1050],
    loigiai: [
        #step([Lập bảng tỷ lệ hợp kim])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Nguyên tố], [Silic ($x$ kg)], [Gali ($y$ kg)], [Quy chuẩn kỹ thuật],
          [Khối lượng mẻ], [$1$], [$1$], [Ít nhất $20" kg"$],
          [Tỷ lệ phối trộn], [$x >= y$], [Gali $y >= 5$], [Silic $>= $ Gali],
          [Đơn giá (nghìn/kg)], [$40$], [$90$], [$C(x, y) = 40x + 90y$]
        )
        ]
        Bất phương trình: $cases(x + y >= 20, x - y >= 0, y >= 5)$.
        Tại $M_1(15; 5)$: $C(15, 5) = 40(15) + 90(5) = 1050$ nghìn đồng.
    ]
)

#pagebreak()

// TLN 3: Thời lượng kiểm thử chip AI bằng siêu máy tính
#tln([Một phòng lab thuê siêu máy tính chạy kiểm thử mô hình AI trên cụm GPU H100 ($x$ giờ) và cụm TPU v5 ($y$ giờ). Mỗi giờ thuê H100 tốn $50$ USD, kiểm tra được $120$ triệu tham số. Mỗi giờ thuê TPU tốn $30$ USD, kiểm tra được $80$ triệu tham số. Kinh phí thuê tối đa $300$ USD và tổng thời gian chạy không quá $8$ giờ. Tính số lượng tham số lớn nhất (đơn vị: triệu tham số) mà phòng lab có thể kiểm thử.],
    [760],
    loigiai: [
        #step([Lập bảng chi phí siêu máy tính])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Cụm tính toán], [GPU H100 ($x$ giờ)], [TPU v5 ($y$ giờ)], [Hạn mức ngân sách],
          [Chi phí (USD/giờ)], [$50$], [$30$], [Tối đa $300$ USD],
          [Thời gian thuê], [$1$], [$1$], [Tối đa $8$ giờ],
          [Tham số (triệu)], [$120$], [$80$], [$T(x, y) = 120x + 80y$]
        )
        ]
        Giao điểm biên: $cases(5x + 3y = 30, x + y = 8) <=> B(3; 5)$. Tham số lớn nhất: $T(3, 5) = 120(3) + 80(5) = 760$ triệu tham số.
    ]
)

#pagebreak()

// TLN 4: Vận hành dây chuyền hàn chip tự động SMT
#tln([Dây chuyền hàn dán bề mặt chip SMT vận hành máy cắm chip tốc độ cao ($x$ giờ) và máy hàn đối lưu hồng ngoại ($y$ giờ). Tiền lãi thu được là $60$ nghìn đồng/giờ máy cắm chip và $80$ nghìn đồng/giờ máy hàn. Máy cắm chip hoạt động không quá $14$ giờ/ngày, máy hàn không quá $10$ giờ/ngày. Ngoài ra, do áp lực nguồn điện làm mát, tổng thời gian hai máy không quá $20$ giờ/ngày. Tìm số tiền lãi lớn nhất (đơn vị: nghìn đồng) trong ngày.],
    [1400],
    loigiai: [
        #step([Lập bảng thông số dây chuyền SMT])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Thiết bị SMT], [Máy cắm chip ($x$)], [Máy hàn ($y$)], [Giới hạn vận hành],
          [Thời gian máy], [$0 <= x <= 14$], [$0 <= y <= 10$], [Tối đa riêng từng máy],
          [Tổng phụ tải điện], [$1$], [$1$], [Tối đa $20$ giờ],
          [Tiền lãi (nghìn/h)], [$60$], [$80$], [$L(x, y) = 60x + 80y$]
        )
        ]
        Tại đỉnh $C(10; 10)$: Tiền lãi lớn nhất là $L = 60(10) + 80(10) = 1400$ nghìn đồng.
    ]
)

#pagebreak()

// TLN 5: Chế tạo pin mặt trời Perovskite thế hệ mới
#tln([Phòng thí nghiệm tổng hợp màng mỏng Perovskite dùng hai dung môi hữu cơ $A$ ($x$ lít, giá $25$ nghìn đồng/lít) và $B$ ($y$ lít, giá $40$ nghìn đồng/lít). Cần điều chế ít nhất $50$ lít dung dịch, lượng dung môi $B$ không quá $30$ lít và lượng dung môi $A$ phải ít nhất gấp đôi lượng dung môi $B$. Tìm chi phí dung môi thấp nhất (đơn vị: nghìn đồng).],
    [1250],
    loigiai: [
        #step([Lập bảng dung môi hữu cơ])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Dung môi], [Dung môi A ($x$ lít)], [Dung môi B ($y$ lít)], [Yêu cầu điều chế],
          [Thể tích dung dịch], [$1$], [$1$], [Ít nhất $50$ lít],
          [Giới hạn dung môi B], [Không hạn chế], [$y <= 30$], [Tối đa $30$ lít B],
          [Tỷ lệ hòa tan], [$x >= 2y$], [Hòa tan kết tinh], [A ít nhất gấp đôi B],
          [Giá (nghìn/lít)], [$25$], [$40$], [$C(x, y) = 25x + 40y$]
        )
        ]
        Hệ BPT: $cases(x + y >= 50, x - 2y >= 0, 0 <= y <= 30, x >= 0)$.
        Tại $(50; 0)$: $C(50, 0) = 25(50) = 1250$ nghìn đồng (nhỏ nhất).
    ]
)

#pagebreak()

// TLN 6: Chế tạo Robot tự hành AGV nhà máy bán dẫn - 3 CÔNG ĐOẠN ĐIỂM NGUYÊN
#tln([Một doanh nghiệp chế tạo robot công nghiệp sản xuất hai dòng robot vận chuyển chip trong phòng sạch: Robot AGV mini ($x$ con) và Robot tải nặng AMR ($y$ con). Quá trình hoàn thiện trải qua 3 phân xưởng chuyên biệt:
- Lắp ráp cảm biến LiDAR: $1$ con AGV mini cần $3$ giờ; $1$ con AMR cần $2$ giờ.
- Cài đặt vi điều khiển AI: $1$ con AGV mini cần $1$ giờ; $1$ con AMR cần $3$ giờ.
- Kiểm định phòng sạch Class 1: $1$ con AGV mini cần $2$ giờ; $1$ con AMR cần $2$ giờ.
Mỗi tháng, quỹ thời gian tối đa của ba xưởng lần lượt là $42$ giờ (LiDAR), $45$ giờ (AI) và $36$ giờ (Phòng sạch). Mỗi con AGV mini mang lại tiền lãi $25$ triệu đồng, mỗi con AMR mang lại tiền lãi $35$ triệu đồng.
Tìm số tiền lãi lớn nhất (đơn vị: triệu đồng) mà doanh nghiệp có thể thu được trong tháng.],
    [580],
    loigiai: [
        #step([Lập bảng ma trận 3 xưởng chế tạo robot bán dẫn])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Công đoạn xưởng], [AGV mini ($x$ con)], [AMR tải nặng ($y$ con)], [Quỹ thời gian tháng],
          [Cảm biến LiDAR], [$3$ giờ], [$2$ giờ], [Tối đa $42$ giờ],
          [Vi điều khiển AI], [$1$ giờ], [$3$ giờ], [Tối đa $45$ giờ],
          [Kiểm định phòng sạch], [$2$ giờ], [$2$ giờ], [Tối đa $36$ giờ],
          [Tiền lãi (triệu đồng)], [$25$], [$35$], [$F(x, y) = 25x + 35y$]
        )
        ]

        #step([Thiết lập hệ bất phương trình ràng buộc])
        $ cases(
            3x + 2y <= 42 quad &(d_1),
            x + 3y <= 45 quad &(d_2),
            2x + 2y <= 36 <=> x + y <= 18 quad &(d_3),
            x >= 0,
            y >= 0
        ) $ với $x, y in NN$.

        #step([Tọa độ đỉnh, khảo sát điểm nguyên và minh họa CeTZ])
        #grid(
          columns: (1fr, auto),
          gutter: 10pt,
          align: horizon,
          [
            Giao $d_1, d_3$ là $M_1(6; 12)$. Giao $d_2, d_3$ là $M_2(4.5; 13.5)$.
            Miền nghiệm: $O(0; 0), A(14; 0), M_1(6; 12), M_2(4.5; 13.5), D(0; 15)$.
            Khảo sát các điểm nguyên lân cận $M_2(4.5; 13.5)$:
            - Điểm $(4; 13)$: $F = 25(4) + 35(13) = 555$ triệu.
            - Điểm $(5; 13)$: thỏa hệ BPT:
              $3(5) + 2(13) = 41 <= 42$;
              $5 + 3(13) = 44 <= 45$;
              $5 + 13 = 18 <= 18$.
              Tiền lãi: $F(5, 13) = 25(5) + 35(13) = 580$ triệu đồng!
            Vậy tiền lãi lớn nhất là $580$ triệu đồng khi sản xuất $5$ con AGV mini và $13$ con AMR tải nặng.
          ],
          [
            #cetz.canvas({
                import cetz.draw: *
                set-style(stroke: 0.8pt)
                let sc = 0.18
                let xmax = 16
                let ymax = 17
                
                for x in range(0, 17) {
                  let xv = x * sc
                  line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
                }
                for y in range(0, 18) {
                  let yv = y * sc
                  line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
                }
                
                fill(rgb("eff6ff"))
                stroke(1.2pt + rgb("2563eb"))
                line((0, 0), (14 * sc, 0), (6 * sc, 12 * sc), (4.5 * sc, 13.5 * sc), (0, 15 * sc), close: true)
                
                line((2 * sc, 18 * sc), (15 * sc, -1.5 * sc), stroke: 1.1pt + rgb("2563eb"))
                line((-1 * sc, 15.33 * sc), (16 * sc, 9.67 * sc), stroke: 1.1pt + rgb("059669"))
                line((1 * sc, 17 * sc), (17 * sc, 1 * sc), stroke: 1.1pt + rgb("d97706"))
                
                line((5 * sc, 13 * sc), (5 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
                line((5 * sc, 13 * sc), (0, 13 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
                
                line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
                content(((xmax + 1) * sc, 0), [$x$])
                line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
                content((0, (ymax + 1) * sc), [$y$])
                content((-0.2, -0.2), [$O$])
                
                circle((0, 0), radius: 1.8pt, fill: black)
                circle((14 * sc, 0), radius: 2pt, fill: black)
                content((14 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
                circle((6 * sc, 12 * sc), radius: 2pt, fill: black)
                circle((0, 15 * sc), radius: 2pt, fill: black)
                content((0.22, 15 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$D$]])
                
                circle((5 * sc, 13 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
                content((5 * sc + 0.65, 13 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), weight: "bold", size: 7.5pt)[$(5; 13)$]])
            })
          ]
        )
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
