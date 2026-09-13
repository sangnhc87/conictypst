#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0d9488") // Teal y tế sinh học & môi trường

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 2",
  exam-title: "BÀI 4: QUY HOẠCH TUYẾN TÍNH NÂNG CAO (ĐỀ SỐ 5 - DƯỢC PHẨM & MÔI TRƯỜNG SINH THÁI)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "108",
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

// TN 1: Phân tích biến số dung dịch vắc xin
#tn([Một phòng xét nghiệm sinh học pha chế $x$ lít dung dịch kháng nguyên và $y$ lít dung dịch tá dược. Do giới hạn thiết bị bảo quản lạnh sâu, tổng thể tích hai dung dịch không vượt quá $50$ lít và thể tích tá dược không được vượt quá ba lần thể tích kháng nguyên. Hệ bất phương trình mô tả các điều kiện thực tế trên là:],
    (
        [$cases(x + y <= 50, y <= 3x)$],
        [$cases(0 < x + y <= 50, 0 < y < 3x)$],
        True([$cases(x + y <= 50, 3x - y >= 0, x >= 0, y >= 0)$]),
        [$cases(x + y <= 50, x >= 3y, x >= 0, y >= 0)$]
    ),
    loigiai: [
        #step([Lập bảng phân tích chỉ tiêu thể tích])
        #align(center)[
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Dung dịch], [Thể tích], [Quy chuẩn thực tế],
          [Kháng nguyên], [$x$ lít], [Không âm, tổng hai chất không quá $50$ lít],
          [Tá dược], [$y$ lít], [Không âm, $y <= 3x <=> 3x - y >= 0$]
        )
        ]
        Hệ điều kiện thực tế là $cases(x + y <= 50, 3x - y >= 0, x >= 0, y >= 0)$.
    ]
)

// TN 2: Ràng buộc tiêu chuẩn vi sinh vật trong nước
#tn([Để xử lý $1000" m"^3$ nước thải sinh hoạt cần dùng hóa chất keo tụ PAC ($x$ kg) và polymer trợ lắng ($y$ kg). Mỗi kg PAC lắng được $4" g"$ cặn lơ lửng, mỗi kg polymer lắng được $10" g"$ cặn. Yêu cầu phải lắng được ít nhất $200" g"$ cặn lơ lửng. Bất phương trình rút gọn nào sau đây đúng?],
    (
        [$4x + 10y <= 200$],
        True([$2x + 5y >= 100$]),
        [$2x + 5y <= 100$],
        [$5x + 2y >= 100$]
    ),
    loigiai: [
        #step([Rút gọn bất phương trình cặn lắng])
        $4x + 10y >= 200 <=> 2x + 5y >= 100$ (chia cả hai vế cho $2$).
    ]
)

// TN 3: Điểm kiểm tra an toàn dược phẩm khả thi
#tn([Hệ bất phương trình kiểm soát độ ẩm và nhiệt độ phòng sạch đóng nang thuốc là $cases(x + 3y <= 30, 2x + y <= 25, x >= 0, y >= 0)$. Điểm phương án nào sau đây *không* thuộc miền nghiệm của hệ?],
    (
        [$(5; 5)$],
        [$(8; 4)$],
        [$(10; 2)$],
        True([$(8; 10)$])
    ),
    loigiai: [
        #step([Kiểm tra phương án vi phạm])
        Thay $(8; 10)$ vào hệ: $x + 3y = 8 + 3(10) = 38 > 30$ (vi phạm). Vậy $(8; 10)$ không thuộc miền nghiệm.
    ]
)

// TN 4: Nửa mặt phẳng tiêu chuẩn khí thải nhà máy dược
#tn([Nồng độ hai loại khí thải $"SO"_2$ ($x$ ppm) và $"NO"_2$ ($y$ ppm) của tháp hấp phụ hóa học thỏa mãn $3x + 4y <= 120$. Cặp giá trị nào sau đây nằm trong giới hạn an toàn?],
    (
        [$(25; 15)$],
        [$(30; 10)$],
        True([$(20; 12)$]),
        [$(35; 10)$]
    ),
    loigiai: [
        #step([Thử giá trị nồng độ])
        Tại $(20; 12)$: $3(20) + 4(12) = 60 + 48 = 108 <= 120$ (an toàn).
    ]
)

// TN 5: Tọa độ giao điểm cân bằng hệ thống màng lọc RO
#tn([Trong mô hình lọc nước siêu tinh khiết cho chạy thận nhân tạo, hai đường biên giới hạn áp suất thẩm thấu là $d_1: 4x + 3y = 48$ và $d_2: x + 2y = 22$. Tọa độ giao điểm của hai đường biên này là:],
    (
        [$(5; 8)$],
        True([$(6; 8)$]),
        [$(8; 5)$],
        [$(6; 7)$]
    ),
    loigiai: [
        #step([Giải hệ phương trình áp suất biên])
        $ cases(4x + 3y = 48, x + 2y = 22) <=> cases(4(22 - 2y) + 3y = 48, x = 22 - 2y) <=> cases(y = 8, x = 6) $. Tọa độ giao điểm là $(6; 8)$.
    ]
)

// TN 6: Hệ bất phương trình 3 điều kiện khử trùng vi sinh
#tn([Để tiệt trùng lô thiết bị y tế, quy trình cần trải qua ba công đoạn: Hấp sấy nhiệt ẩm ($x$ giờ), Khí Ethylene Oxide ($y$ giờ) và Thông khí vô trùng. Thời gian giới hạn của ba công đoạn lần lượt là $20$ giờ, $18$ giờ, $24$ giờ. Biết mỗi mẻ thiết bị loại I cần $2" h"$ sấy, $1" h"$ khí EO, $2" h"$ thông khí; loại II cần $1" h"$ sấy, $2" h"$ khí EO, $3" h"$ thông khí. Hệ bất phương trình mô tả số mẻ $x, y$ là:],
    (
        [$cases(2x + y <= 20, x + 2y <= 18, x >= 0, y >= 0)$],
        True([$cases(2x + y <= 20, x + 2y <= 18, 2x + 3y <= 24, x >= 0, y >= 0)$]),
        [$cases(x + 2y <= 20, 2x + y <= 18, 3x + 2y <= 24, x >= 0, y >= 0)$],
        [$cases(2x + y <= 20, x + 2y <= 18, 2x + 3y <= 24)$]
    ),
    loigiai: [
        #step([Lập bảng ma trận 3 công đoạn tiệt trùng])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Công đoạn], [Thiết bị I ($x$)], [Thiết bị II ($y$)], [Tối đa],
          [Sấy nhiệt ẩm], [$2" h"$], [$1" h"$], [$20" h"$],
          [Khí EO], [$1" h"$], [$2" h"$], [$18" h"$],
          [Thông khí], [$2" h"$], [$3" h"$], [$24" h"$]
        )
        ]
        Hệ bất phương trình: $cases(2x + y <= 20, x + 2y <= 18, 2x + 3y <= 24, x >= 0, y >= 0)$.
    ]
)

// TN 7: Nhận diện đỉnh miền nghiệm sản xuất thuốc kháng viêm
#tn([Miền nghiệm của bài toán điều chế siro ho là tam giác $O A B$ với $O(0; 0), A(15; 0), B(8; 6)$. Giá trị lớn nhất của doanh thu $T(x, y) = 25x + 30y$ (triệu đồng) trên miền nghiệm là:],
    (
        [$375$ triệu],
        True([$380$ triệu]),
        [$360$ triệu],
        [$400$ triệu]
    ),
    loigiai: [
        #step([Tính doanh thu tại các đỉnh])
        $T(O) = 0$; $T(A) = 25(15) = 375$; $T(B) = 25(8) + 30(6) = 200 + 180 = 380$. Lớn nhất là $380$ triệu tại $B(8; 6)$.
    ]
)

// TN 8: Điều kiện giới hạn nồng độ vi sinh hiếu khí
#tn([Trong bể phản ứng sinh học, nồng độ vi sinh vật $A$ ($x$ g/lít) và nồng độ chất nền hữu cơ $B$ ($y$ g/lít) phải thỏa mãn: nồng độ chất nền không ít hơn một phần ba nồng độ vi sinh, nhưng không quá hai lần nồng độ vi sinh. Hệ bất phương trình mô tả là:],
    (
        [$cases(x - 3y <= 0, 2x - y >= 0)$],
        True([$cases(x - 3y <= 0, 2x - y <= 0)$]),
        [$cases(3x - y <= 0, x - 2y >= 0)$],
        [$cases(x - 3y >= 0, 2x - y >= 0)$]
    ),
    loigiai: [
        #step([Phân tích bất phương trình kép])
        $1/3 x <= y <= 2x <=> cases(y >= 1/3 x, y <= 2x) <=> cases(x - 3y <= 0, 2x - y >= 0)$.
    ]
)

// TN 9: Tìm min chi phí xử lý bùn thải y tế
#tn([Một bệnh viện thuê đơn vị tiêu hủy hai loại rác thải lây nhiễm: rác rắn ($x$ tấn, giá $20$ triệu/tấn) và rác lỏng ($y$ tấn, giá $25$ triệu/tấn). Miền nghiệm có các đỉnh bờ $A(0; 8), B(3; 4), C(9; 0)$. Chi phí tiêu hủy thấp nhất là:],
    (
        [$180$ triệu],
        True([$160$ triệu]),
        [$200$ triệu],
        [$150$ triệu]
    ),
    loigiai: [
        #step([Tính chi phí tại các đỉnh bờ])
        $C(A) = 25(8) = 200$; $C(B) = 20(3) + 25(4) = 160$; $C(C) = 20(9) = 180$. Chi phí nhỏ nhất là $160$ triệu tại $B(3; 4)$.
    ]
)

// TN 10: Hạn mức ngân sách kiểm nghiệm thuốc lâm sàng
#tn([Trung tâm thử nghiệm lâm sàng có kinh phí tối đa $240$ triệu đồng cho thử nghiệm pha I ($x$ ca, giá $12$ triệu/ca) và pha II ($y$ ca, giá $20$ triệu/ca). Bất phương trình ngân sách rút gọn là:],
    (
        [$3x + 5y >= 60$],
        True([$3x + 5y <= 60$]),
        [$5x + 3y <= 60$],
        [$3x + 5y <= 240$]
    ),
    loigiai: [
        #step([Rút gọn phương trình ngân sách])
        $12x + 20y <= 240 <=> 3x + 5y <= 60$ (chia cả hai vế cho $4$).
    ]
)

// TN 11: Đường mức của hàm mục tiêu chỉ số xử lý ô nhiễm
#tn([Chỉ số hấp phụ kim loại nặng $K(x, y) = 60x + 90y$. Phương trình đường mức ứng với chỉ số hấp phụ đạt $360$ đơn vị là:],
    (
        [$3x + 2y = 12$],
        True([$2x + 3y = 12$]),
        [$2x + 3y = 6$],
        [$4x + 6y = 36$]
    ),
    loigiai: [
        #step([Rút gọn phương trình đường mức])
        $60x + 90y = 360 <=> 2x + 3y = 12$ (chia cả hai vế cho $30$).
    ]
)

// TN 12: Đánh giá điểm phương án nguyên liều lượng kháng sinh
#tn([Miền khả thi cho đơn thuốc phối hợp có đỉnh lý thuyết cực đại $P(4.2; 6.7)$. Với $x, y$ là số viên thuốc nguyên ($x, y in NN^*$), điểm nào sau đây là phương án khả thi nguyên tối ưu sát đỉnh $P$?],
    (
        [$(5; 7)$],
        True([$(4; 6)$]),
        [$(4; 7)$],
        [$(5; 6)$]
    ),
    loigiai: [
        #step([Đánh giá điểm nguyên])
        Điểm $(4; 6)$ nằm sát bên trong đỉnh $P(4.2; 6.7)$ nên luôn thuộc miền nghiệm và tối ưu.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

#pagebreak()

// DS 1: Bào chế Dung dịch Kháng thể Đơn dòng - 3 RÀNG BUỘC HOẠT CHẤT
#ds([Một viện công nghệ sinh học bào chế hai loại dung dịch đặc trị: Kháng thể A ($x$ lô, lãi $40$ triệu) và Kháng thể B ($y$ lô, lãi $50$ triệu). Quá trình bào chế sử dụng ba hoạt chất sinh học chiến lược: Kháng nguyên tái tổ hợp (tối đa $20" g"$), Tá dược đệm pH (tối đa $20" g"$) và Chất chống đông vón (tối đa $12" g"$). Mỗi lô Kháng thể A cần $2" g"$ kháng nguyên, $1" g"$ tá dược, $1" g"$ chống đông. Mỗi lô Kháng thể B cần $1" g"$ kháng nguyên, $2" g"$ tá dược, $1" g"$ chống đông. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc cả 3 hoạt chất sinh học là $cases(2x + y <= 20, x + 2y <= 20, x + y <= 12, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của bài toán là một hình ngũ giác lồi có 5 đỉnh gồm $O(0; 0), A(10; 0), B(8; 4), C(4; 8), D(0; 10)$.]),
    True([Nếu viện sản xuất $8$ lô Kháng thể A và $4$ lô Kháng thể B thì tiền lãi thu được là $520$ triệu đồng.]),
    True([Lợi nhuận lớn nhất viện đạt được là $560$ triệu đồng khi sản xuất $4$ lô Kháng thể A và $8$ lô Kháng thể B.])
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập bảng 3 hoạt chất sinh học và thiết lập hệ bất phương trình])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        inset: (x: 8pt, y: 1.5pt),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Hoạt chất sinh học], [Kháng thể A ($x$)], [Kháng thể B ($y$)], [Dự trữ kho],
        [Kháng nguyên], [$2" g"$], [$1" g"$], [$20" g"$],
        [Tá dược đệm pH], [$1" g"$], [$2" g"$], [$20" g"$],
        [Chống đông vón], [$1" g"$], [$1" g"$], [$12" g"$],
        [Tiền lãi thu được], [$40$ triệu], [$50$ triệu], [$F(x, y)$]
      )

      #v(2pt)
      *Hệ BPT 3 hoạt chất sinh học:*
      $ cases(
        2x + y <= 20 quad &(d_1),
        x + 2y <= 20 quad &(d_2),
        x + y <= 12 quad &(d_3),
        x >= 0, y >= 0
      ) $
      $=>$ *Mệnh đề a) là Đúng*.
    ]

    #step([Xác định tọa độ đỉnh miền nghiệm, tối ưu hóa và hình vẽ CeTZ])
    - Giao biên: $B(8; 4) = (d_1) inter (d_3)$, $C(4; 8) = (d_2) inter (d_3)$. Ngũ giác $O(0; 0), A(10; 0), B, C, D(0; 10)$ $=>$ *Ý b) Đúng*.

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
          [$A(10; 0)$], [$40(10)$], [$400$],
          [$B(8; 4)$], [$40(8) + 50(4)$], [$520$],
          [$C(4; 8)$], [$40(4) + 50(8)$], [$560$ (cực đại)],
          [$D(0; 10)$], [$50(10)$], [$500$]
        )
        #v(1pt)
        #text(size: 8.5pt)[- Phương án $(8; 4)$ thu lãi $520$ triệu $=>$ *Ý c) Đúng*.        - Lãi lớn nhất đạt $560$ triệu tại $C(4; 8)$ $=>$ *Ý d) Đúng*.]
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.20
          let xmax = 11.5
          let ymax = 11.5
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("0d9488"))
          line((0, 0), (10 * sc, 0), (8 * sc, 4 * sc), (4 * sc, 8 * sc), (0, 10 * sc), close: true)
          
          line((5 * sc, 10 * sc), (11 * sc, -2 * sc), stroke: 1.1pt + rgb("0d9488"))
          content((10.8 * sc, 1.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0d9488"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((-1 * sc, 10.5 * sc), (12 * sc, 4 * sc), stroke: 1.1pt + rgb("0284c7"))
          content((1.8 * sc, 11 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0284c7"), size: 6.5pt, weight: "bold")[$(d_2)$]])
          
          line((2 * sc, 10 * sc), (11 * sc, 1 * sc), stroke: 1.1pt + rgb("d97706"))
          content((8.8 * sc, 4.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("d97706"), size: 6.5pt, weight: "bold")[$(d_3)$]])
          
          line((4 * sc, 8 * sc), (4 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((4 * sc, 8 * sc), (0, 8 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-0.5 * sc, 0), ((xmax + 0.5) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 0.8) * sc, 0), [$x$])
          line((0, -0.5 * sc), (0, (ymax + 0.5) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 0.8) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((10 * sc, 0), radius: 2pt, fill: black)
          content((10 * sc, -0.25), [#text(size: 7pt, weight: "bold")[$A$]])
          circle((8 * sc, 4 * sc), radius: 2pt, fill: black)
          content((8 * sc + 0.35, 4 * sc + 0.15), [#text(size: 7pt, weight: "bold")[$B$]])
          circle((0, 10 * sc), radius: 2pt, fill: black)
          content((-0.28, 10 * sc), [#text(size: 7pt, weight: "bold")[$D$]])
          
          circle((4 * sc, 8 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((4 * sc + 0.75, 8 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$C(4; 8)$]])
        })
      ]
    )
    ]
  ]
)

#pagebreak()
// DS 2: Trạm xử lý nước thải y tế sinh thái - 3 CHỈ SỐ Ô NHIỄM & TỶ LỆ CÂN BẰNG
#ds([Một trạm xử lý nước thải y tế gồm: Bể bùn hiếu khí ($x$ nghìn $"m"^3$, hiệu quả $30$) và Màng lọc MBR ($y$ nghìn $"m"^3$, hiệu quả $40$). Khả năng tiếp nhận ô nhiễm: Khử $"BOD"_5$ tối đa $24" kg"$, Khử $"COD"$ tối đa $24" kg"$, Khử cặn $"TSS"$ tối đa $15" kg"$. Để xử lý $1$ nghìn $"m"^3$ qua Bể hiếu khí khử $2" kg BOD", 1" kg COD", 1" kg TSS"$; qua MBR khử $1" kg BOD", 2" kg COD", 1" kg TSS"$. Cân bằng sinh học yêu cầu $3x - 2y >= 0$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc trạm xử lý là $cases(2x + y <= 24, x + 2y <= 24, x + y <= 15, 3x - 2y >= 0, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của bài toán là một đa giác có 5 đỉnh gồm $O(0; 0), A(12; 0), B(9; 6), C(6; 9), D(0; 0)$ với $C$ là giao của $(d_3)$ và $(Delta)$.]),
    False([Trạm nên vận hành $12$ nghìn $"m"^3$ MBR và không dùng Bể hiếu khí để tối đa hóa hiệu quả.]),
    True([Hiệu quả xử lý đạt mức cao nhất là $510$ điểm khi trạm vận hành $9$ nghìn $"m"^3$ Bể hiếu khí và $6$ nghìn $"m"^3$ Màng MBR.])
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập bảng 3 chỉ số ô nhiễm và thiết lập hệ bất phương trình])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        inset: (x: 8pt, y: 1.5pt),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Chỉ tiêu ô nhiễm], [Bể hiếu khí ($x$)], [Màng MBR ($y$)], [Tải trọng tối đa],
        [Khử $"BOD"_5$], [$2" kg"$], [$1" kg"$], [$24" kg"$],
        [Khử $"COD"$], [$1" kg"$], [$2" kg"$], [$24" kg"$],
        [Khử cặn $"TSS"$], [$1" kg"$], [$1" kg"$], [$15" kg"$],
        [Điểm hiệu quả], [$30$ điểm], [$40$ điểm], [$E(x, y)$]
      )

      #v(2pt)
      *Hệ BPT xử lý nước thải và điều kiện sinh học $3x >= 2y$:*
      $ cases(
        2x + y <= 24 quad &(d_1),
        x + 2y <= 24 quad &(d_2),
        x + y <= 15 quad &(d_3),
        3x - 2y >= 0 quad &(Delta),
        x >= 0, y >= 0
      ) $
      $=>$ *Mệnh đề a) là Đúng*.
    ]

    #step([Xác định tọa độ đỉnh miền nghiệm, tối ưu hóa và hình vẽ CeTZ])
    - Giao biên: $B(9; 6) = (d_1) inter (d_3)$, $C(6; 9) = (d_3) inter (Delta)$. Đa giác $O, A(12; 0), B, C$ $=>$ *Ý b) Đúng*.

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
          [Đỉnh $(x; y)$], [Tính điểm $E(x, y)$], [Hiệu quả xử lý],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(12; 0)$], [$30(12)$], [$360$],
          [$B(9; 6)$], [$30(9) + 40(6)$], [$510$ (cực đại)],
          [$C(6; 9)$], [$30(6) + 40(9)$], [$540$ (loại vì $y <= 6$)]
        )
        #v(1pt)
        #text(size: 8.5pt)[- Vì $3x >= 2y$ nên không thể chỉ chạy MBR $=>$ *Ý c) Sai*.        - Hiệu quả lớn nhất đạt $510$ điểm tại $B(9; 6)$ $=>$ *Ý d) Đúng*.]
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.17
          let xmax = 13.5
          let ymax = 12.5
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("0d9488"))
          line((0, 0), (12 * sc, 0), (9 * sc, 6 * sc), (6 * sc, 9 * sc), close: true)
          
          line((6 * sc, 12 * sc), (13 * sc, -2 * sc), stroke: 1.1pt + rgb("0d9488"))
          content((12.8 * sc, 1.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0d9488"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((-1 * sc, 12.5 * sc), (14 * sc, 5 * sc), stroke: 1.1pt + rgb("0284c7"))
          content((1.8 * sc, 12 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0284c7"), size: 6.5pt, weight: "bold")[$(d_2)$]])
          
          line((0, 0), (8 * sc, 12 * sc), stroke: 1.1pt + rgb("7c3aed"))
          content((7.2 * sc, 11.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("7c3aed"), size: 6.5pt, weight: "bold")[$(Delta)$]])
          
          line((9 * sc, 6 * sc), (9 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((9 * sc, 6 * sc), (0, 6 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-0.5 * sc, 0), ((xmax + 0.5) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 0.8) * sc, 0), [$x$])
          line((0, -0.5 * sc), (0, (ymax + 0.5) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 0.8) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((12 * sc, 0), radius: 2pt, fill: black)
          content((12 * sc, -0.25), [#text(size: 7pt, weight: "bold")[$A$]])
          circle((6 * sc, 9 * sc), radius: 2pt, fill: black)
          content((6 * sc - 0.28, 9 * sc + 0.2), [#text(size: 7pt, weight: "bold")[$C$]])
          
          circle((9 * sc, 6 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((9 * sc + 0.75, 6 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(9; 6)$]])
        })
      ]
    )
    ]
  ]
)

#pagebreak()
// DS 3: Tiệt trùng Phòng sạch Dược phẩm - BÀI TOÁN CỰC TIỂU 3 TIÊU CHUẨN
#ds([Để khử khuẩn phòng sạch sản xuất thuốc tiêm, bệnh viện phối hợp hai công nghệ: Khí Ozone ($x$ giờ, chi phí $12$ triệu/giờ) và Tia cực tím UV-C ($y$ giờ, chi phí $16$ triệu/giờ). Yêu cầu kỹ thuật bắt buộc: diệt khuẩn bào tử (ít nhất $16$ đơn vị), diệt nấm mốc (ít nhất $11$ đơn vị), và phân hủy nội độc tố vi khuẩn (ít nhất $21$ đơn vị). Mỗi giờ chạy Ozone cung cấp $2$ bào tử, $1$ nấm mốc, $1$ nội độc tố. Mỗi giờ chạy UV-C cung cấp $1$ bào tử, $1$ nấm mốc, $3$ nội độc tố. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc 3 tiêu chuẩn tiệt trùng là $cases(2x + y >= 16, x + y >= 11, x + 3y >= 21, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của bài toán là một miền đa giác mở không giới hạn có 4 đỉnh bờ gồm $A(0; 16), B(5; 6), C(6; 5), D(21; 0)$.]),
    True([Tại phương án chạy $5$ giờ Ozone và $6$ giờ UV-C, tổng chi phí khử trùng là $156$ triệu đồng.]),
    True([Phương án vận hành tối ưu có chi phí thấp nhất là $152$ triệu đồng khi sử dụng $6$ giờ máy Ozone và $5$ giờ đèn UV-C.])
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập bảng 3 tiêu chuẩn tiệt trùng phòng sạch và thiết lập hệ BPT])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        inset: (x: 8pt, y: 1.5pt),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Tiêu chuẩn tiệt trùng], [Máy Ozone ($x$)], [Đèn UV-C ($y$)], [Định mức tối thiểu],
        [Diệt khuẩn bào tử], [$2$ đơn vị], [$1$ đơn vị], [Ít nhất $16$],
        [Diệt vi nấm mốc], [$1$ đơn vị], [$1$ đơn vị], [Ít nhất $11$],
        [Phân hủy nội độc tố], [$1$ đơn vị], [$3$ đơn vị], [Ít nhất $21$],
        [Chi phí / giờ], [$12$ triệu], [$16$ triệu], [$C(x, y)$]
      )

      #v(2pt)
      *Hệ BPT 3 tiêu chuẩn tiệt trùng phòng sạch:*
      $ cases(
        2x + y >= 16 quad &(d_1),
        x + y >= 11 quad &(d_2),
        x + 3y >= 21 quad &(d_3),
        x >= 0, y >= 0
      ) $
      $=>$ *Mệnh đề a) là Đúng*.
    ]

    #step([Xác định tọa độ đỉnh bờ, tối ưu hóa chi phí và hình vẽ CeTZ])
    - Giao bờ: $B(5; 6) = (d_1) inter (d_2)$, $C(6; 5) = (d_2) inter (d_3)$. Các đỉnh bờ $A(0; 16), B, C, D(21; 0)$ $=>$ *Ý b) Đúng*.

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
          [$A(0; 16)$], [$16(16)$], [$256$],
          [$B(5; 6)$], [$12(5) + 16(6)$], [$156$],
          [$C(6; 5)$], [$12(6) + 16(5)$], [$152$ (thấp nhất)],
          [$D(21; 0)$], [$12(21)$], [$252$]
        )
        #v(1pt)
        #text(size: 8.5pt)[
          - Tại $(5; 6)$ chi phí là $156$ triệu $=>$ *Ý c) Đúng*.          - Chi phí cực tiểu đạt $152$ triệu tại $C(6; 5)$ $=>$ *Ý d) Đúng*.
        ]
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.17
          let xmax = 22
          let ymax = 17
          
          fill(rgb("eff6ff"))
          line((0, 17 * sc), (0, 16 * sc), (5 * sc, 6 * sc), (6 * sc, 5 * sc), (21 * sc, 0), (22 * sc, 0), (22 * sc, 17 * sc), close: true, stroke: none)
          
          line((-0.5 * sc, 17 * sc), (9 * sc, -2 * sc), stroke: 1.1pt + rgb("0d9488"))
          content((9.2 * sc, 1.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0d9488"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((0, 11 * sc), (13 * sc, -2 * sc), stroke: 1.1pt + rgb("0284c7"))
          content((1.8 * sc, 10.5 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0284c7"), size: 6.5pt, weight: "bold")[$(d_2)$]])
          
          line((-1 * sc, 7.33 * sc), (22 * sc, -0.33 * sc), stroke: 1.1pt + rgb("d97706"))
          content((21 * sc, 2.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("d97706"), size: 6.5pt, weight: "bold")[$(d_3)$]])
          
          line((6 * sc, 5 * sc), (6 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((6 * sc, 5 * sc), (0, 5 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 1) * sc, 0), [$x$])
          line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 1) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((0, 16 * sc), radius: 2pt, fill: black)
          content((0.35, 16 * sc + 0.12), [#text(size: 7pt, weight: "bold")[$A$]])
          circle((5 * sc, 6 * sc), radius: 2pt, fill: black)
          content((5 * sc - 0.28, 6 * sc + 0.2), [#text(size: 7pt, weight: "bold")[$B$]])
          circle((21 * sc, 0), radius: 2pt, fill: black)
          content((21 * sc, -0.25), [#text(size: 7pt, weight: "bold")[$D$]])
          
          circle((6 * sc, 5 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((6 * sc + 0.85, 5 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$C(6; 5)$]])
        })
      ]
    )
    ]
  ]
)

#pagebreak()
// DS 4: Dây chuyền Tinh chế Dược chất Tự động - 4 RÀNG BUỘC & LOẠI BỎ BIÊN DƯ
#ds([Một trung tâm tinh chế dược phẩm sản xuất: Viên nang phóng thích chậm ($x$ nghìn lọ, doanh thu $20$ triệu/nghìn lọ) và Dung dịch tiêm tĩnh mạch ($y$ nghìn lọ, doanh thu $25$ triệu/nghìn lọ). Quá trình sản xuất yêu cầu: mỗi nghìn lọ viên nang cần $1$ giờ máy sấy tầng sôi và $2$ giờ máy ly tâm siêu tốc; mỗi nghìn lọ dung dịch tiêm cần $1$ giờ máy sấy và $5$ giờ máy ly tâm. Tổng thời gian máy sấy tối đa $90$ giờ, máy ly tâm tối đa $300$ giờ. Để phục vụ bệnh viện, kho lạnh sâu cần trữ tối thiểu $25$ nghìn lọ dung dịch tiêm. Đồng thời, số lượng viên nang sản xuất phải đạt ít nhất gấp đôi số lọ dung dịch tiêm. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc tinh chế dược chất là $cases(x + y <= 90, 2x + 5y <= 300, y >= 25, x - 2y >= 0, x >= 0)$.]),
    True([Giao điểm của hai đường thẳng $x + y = 90$ và $2x + 5y = 300$ là đỉnh $B(50; 40)$ nhưng vi phạm điều kiện tỷ lệ $x - 2y >= 0$.]),
    True([Miền nghiệm thực tế là một hình tam giác với các đỉnh $M_1(50; 25), M_2(65; 25), M_3(60; 30)$.]),
    True([Doanh thu lớn nhất mà dây chuyền tinh chế đạt được là $1950$ triệu đồng.])
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập bảng chỉ tiêu kỹ thuật tinh chế và hệ bất phương trình])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        inset: (x: 8pt, y: 1.5pt),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Chỉ tiêu kỹ thuật], [Viên nang ($x$)], [Lọ tiêm ($y$)], [Định mức tiêu chuẩn],
        [Máy sấy tầng sôi], [$1" h"$], [$1" h"$], [$90" h"$],
        [Ly tâm siêu tốc], [$2" h"$], [$5" h"$], [$300" h"$],
        [Kho lạnh sâu], [Không], [$1$ nghìn], [Tối thiểu $25$ nghìn],
        [Tỷ lệ dược tính], [$1$], [$-2$], [$x - 2y >= 0$],
        [Doanh thu / nghìn], [$20$ triệu], [$25$ triệu], [$R(x, y)$]
      )

      #v(2pt)
      *Hệ BPT tinh chế dược chất:*
      $ cases(
        x + y <= 90 quad &(d_1),
        2x + 5y <= 300 quad &(d_2),
        y >= 25 quad &(d_3),
        x - 2y >= 0 quad &(Delta),
        x >= 0
      ) $
      $=>$ *Mệnh đề a) là Đúng*.
    ]

    #step([Xác định tọa độ đỉnh tam giác, so sánh doanh thu và hình vẽ CeTZ])
    - Giao $(d_1), (d_2)$ là $(50; 40)$ vi phạm $x - 2y >= 0$ $=>$ *Ý b) Đúng*. Tam giác $M_1(50; 25), M_2(65; 25), M_3(60; 30)$ $=>$ *Ý c) Đúng*.

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
          [$M_1(50; 25)$], [$20(50) + 25(25)$], [$1625$],
          [$M_2(65; 25)$], [$20(65) + 25(25)$], [$1925$],
          [$M_3(60; 30)$], [$20(60) + 25(30)$], [$1950$ (cực đại)]
        )
        #v(1pt)
        #text(size: 8.5pt)[- Doanh thu cực đại đạt $1950$ triệu đồng tại phương án $M_3(60; 30)$ $=>$ *Ý d) Đúng*.]
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.040
          let xmax = 95
          let ymax = 48
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("0d9488"))
          line((50 * sc, 25 * sc), (65 * sc, 25 * sc), (60 * sc, 30 * sc), close: true)
          
          line((20 * sc, 70 * sc), (95 * sc, -5 * sc), stroke: 1.1pt + rgb("0d9488"))
          content((94 * sc, 2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0d9488"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((0, 25 * sc), (90 * sc, 25 * sc), stroke: 1.1pt + rgb("0284c7"))
          content((10 * sc, 27 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0284c7"), size: 6.5pt, weight: "bold")[$(d_3)$]])
          
          line((0, 0), (80 * sc, 40 * sc), stroke: 1.1pt + rgb("d97706"))
          content((50 * sc, 28 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("d97706"), size: 6.5pt, weight: "bold")[$(Delta)$]])
          
          line((60 * sc, 30 * sc), (60 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((60 * sc, 30 * sc), (0, 30 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-3 * sc, 0), ((xmax + 3) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 5) * sc, 0), [$x$])
          line((0, -3 * sc), (0, (ymax + 3) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 5) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((50 * sc, 25 * sc), radius: 2pt, fill: black)
          content((50 * sc - 0.2, 25 * sc - 0.25), [#text(size: 6.5pt, weight: "bold")[$M_1$]])
          circle((65 * sc, 25 * sc), radius: 2pt, fill: black)
          content((65 * sc + 0.2, 25 * sc - 0.25), [#text(size: 6.5pt, weight: "bold")[$M_2$]])
          
          circle((60 * sc, 30 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((60 * sc + 0.75, 30 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$M_3$]])
        })
      ]
    )
    ]
  ]
)

#pagebreak()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1: Tối ưu pha chế dung dịch bù điện giải Oresol
#tln([Một xưởng dược sản xuất gói Oresol tiêu chuẩn ($x$ nghìn gói, giá $3$ nghìn đồng) và tăng cường ($y$ nghìn gói, giá $5$ nghìn đồng). Kho có tối đa $20" kg"$ Natri clorid và $36" kg"$ Glucose. Biết $1$ nghìn gói tiêu chuẩn cần $1" kg"$ Natri, $1" kg"$ Glucose; $1$ nghìn gói tăng cường cần $1" kg"$ Natri, $3" kg"$ Glucose. Tìm doanh thu lớn nhất (đơn vị: triệu đồng).],
    [76],
    loigiai: [
        #step([Lập bảng hoạt chất muối khoáng])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Nguyên liệu], [Gói tiêu chuẩn ($x$)], [Gói tăng cường ($y$)], [Trữ lượng kho],
          [Natri clorid], [$1" kg"$], [$1" kg"$], [Tối đa $20" kg"$],
          [Glucose], [$1" kg"$], [$3" kg"$], [Tối đa $36" kg"$],
          [Đơn giá (nghìn)], [$3$], [$5$], [$T(x, y) = 3x + 5y$]
        )
        ]
        Hệ bất phương trình: $cases(x + y <= 20, x + 3y <= 36, x >= 0, y >= 0, x, y in NN)$.
        Giao biên: $cases(x + y = 20, x + 3y = 36) <=> cases(x = 12, y = 8)$. Doanh thu lớn nhất: $T(12, 8) = 3(12) + 5(8) = 76$ triệu đồng.
    ]
)

// TLN 2: Nuôi cấy nấm men sinh học sản xuất Enzym
#tln([Nuôi cấy nấm men từ Bột cao thịt ($x$ kg, giá $60$ nghìn/kg) và Dịch chiết ($y$ kg, giá $80$ nghìn/kg). Quy chuẩn: khối lượng ít nhất $18" kg"$, dịch chiết không ít hơn $6" kg"$, và khối lượng cao thịt không ít hơn khối lượng dịch chiết. Tìm chi phí nuôi cấy rẻ nhất (đơn vị: nghìn đồng).],
    [1200],
    loigiai: [
        #step([Lập bảng dinh dưỡng môi trường nuôi cấy])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Môi trường], [Cao thịt ($x$ kg)], [Dịch chiết ($y$ kg)], [Quy chuẩn],
          [Khối lượng], [$1$], [$1$], [Ít nhất $18" kg"$],
          [Điều kiện], [$x >= y$], [$y >= 6$], [Tối thiểu $6" kg"$, $x >= y$],
          [Đơn giá (nghìn)], [$60$], [$80$], [$C(x, y) = 60x + 80y$]
        )
        ]
        Hệ BPT: $cases(x + y >= 18, x - y >= 0, y >= 6)$. Tại đỉnh $M_1(12; 6)$: $C(12, 6) = 60(12) + 80(6) = 1200$ nghìn đồng (rẻ nhất).
    ]
)

#pagebreak()

// TLN 3: Thời gian chạy sắc ký lỏng hiệu năng cao HPLC
#tln([Một trung tâm kiểm nghiệm dược phẩm sử dụng hai máy sắc ký lỏng hiệu năng cao: Máy HPLC phân giải cao ($x$ giờ) và Máy sắc ký khí GC-MS ($y$ giờ). Chi phí chạy máy HPLC là $80$ nghìn đồng/giờ, kiểm nghiệm được $15$ mẫu hoạt chất; chi phí máy GC-MS là $50$ nghìn đồng/giờ, kiểm nghiệm được $10$ mẫu. Kinh phí tối đa là $400$ nghìn đồng và tổng thời gian vận hành hai máy không quá $7$ giờ. Tính số mẫu hoạt chất lớn nhất trung tâm có thể phân tích.],
    [75],
    loigiai: [
        #step([Lập bảng chi phí kiểm nghiệm sắc ký])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Thiết bị sắc ký], [Máy HPLC ($x$ giờ)], [Máy GC-MS ($y$ giờ)], [Giới hạn phòng lab],
          [Chi phí (nghìn/giờ)], [$80$], [$50$], [Tối đa $400$ nghìn],
          [Thời gian chạy], [$1$], [$1$], [Tối đa $7$ giờ],
          [Số mẫu phân tích], [$15$], [$10$], [$M(x, y) = 15x + 10y$]
        )
        ]
        Hệ BPT: $cases(8x + 5y <= 40, x + y <= 7, x >= 0, y >= 0, x, y in NN)$.
        Giao điểm biên: $cases(8x + 5y = 40, x + y = 7) <=> cases(3x = 5, y = 16/3) <=> (1.67; 5.33)$.
        - Tại $(0; 7)$: $M = 10(7) = 70$.
        - Tại $(5; 0)$: $M = 15(5) = 75$.
        - Điểm nguyên lân cận $(1; 6)$: $8(1) + 5(6) = 38 <= 40, 1 + 6 = 7 <= 7$. $M(1, 6) = 15(1) + 10(6) = 75$.
        - Điểm $(2; 4)$: $8(2) + 5(4) = 36 <= 40, 2 + 4 = 6 <= 7$. $M(2, 4) = 15(2) + 10(4) = 70$.
        - Điểm $(3; 3)$: $8(3) + 5(3) = 39 <= 40, 3 + 3 = 6 <= 7$. $M(3, 3) = 15(3) + 10(3) = 75$.
        - Điểm $(4; 1)$: $8(4) + 5(1) = 37 <= 40$. $M(4, 1) = 15(4) + 10(1) = 70$.
        Số mẫu kiểm nghiệm lớn nhất là $75$ mẫu.
    ]
)

#pagebreak()

// TLN 4: Vận hành tháp hấp phụ xử lý mùi chuồng trại sinh học
#tln([Trang trại chăn nuôi công nghệ cao vận hành tháp than hoạt tính ($x$ giờ, tiêu thụ điện $40$ kWh/giờ) và màng lọc sinh học Biofilter ($y$ giờ, tiêu thụ điện $25$ kWh/giờ). Tiền công xử lý môi trường nhận được là $70$ nghìn đồng/giờ than hoạt tính và $50$ nghìn đồng/giờ Biofilter. Giới hạn tháp than chạy tối đa $12$ giờ/ngày, Biofilter tối đa $14$ giờ/ngày. Trạm điện cung cấp tổng phụ tải không quá $600" kWh/ngày"$. Tìm số tiền công lớn nhất (đơn vị: nghìn đồng) trong ngày.],
    [1120],
    loigiai: [
        #step([Lập bảng thông số công nghệ khử mùi])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Công nghệ xử lý], [Than hoạt tính ($x$)], [Biofilter ($y$)], [Giới hạn phụ tải],
          [Thời gian máy], [$0 <= x <= 12$], [$0 <= y <= 14$], [Tối đa riêng từng tháp],
          [Phụ tải điện (kWh/h)], [$40$], [$25$], [Tối đa $600$ kWh],
          [Tiền công (nghìn/h)], [$70$], [$50$], [$L(x, y) = 70x + 50y$]
        )
        ]
        Tại đỉnh $B(12; 4.8)$: $x = 12, y = (120 - 96)/5 = 4.8$.
        Điểm nguyên lân cận $(12; 4)$: $L(12, 4) = 70(12) + 50(4) = 840 + 200 = 1040$ nghìn.
        Tại $y = 14$: $8x <= 120 - 70 = 50 => x = 6.25$. Điểm $(6; 14)$:
        $L(6, 14) = 70(6) + 50(14) = 420 + 700 = 1120$ nghìn đồng!
        Điểm $(7; 12)$: $8(7) + 5(12) = 56 + 60 = 116 <= 120$.
        $L(7, 12) = 70(7) + 50(12) = 490 + 600 = 1090$ nghìn.
        Điểm $(8; 11)$: $8(8) + 5(11) = 64 + 55 = 119 <= 120$.
        $L(8, 11) = 70(8) + 50(11) = 560 + 550 = 1110$ nghìn.
        Tiền công lớn nhất là $1120$ nghìn đồng khi chạy $6$ giờ than hoạt tính và $14$ giờ Biofilter.
    ]
)

#pagebreak()

// TLN 5: Chiết xuất Tinh dầu Dược liệu quý bằng dung môi xanh
#tln([Hợp tác xã chiết xuất tinh dầu thảo dược dùng hai dung môi hữu cơ sinh học: Cồn thực phẩm $96 degree$ ($x$ lít, giá $30$ nghìn đồng/lít) và Nước cất tinh khiết ($y$ lít, giá $10$ nghìn đồng/lít). Cần phối trộn ít nhất $60$ lít dung môi, lượng nước cất không vượt quá $40$ lít và lượng cồn thực phẩm phải ít nhất bằng một nửa lượng nước cất. Chi phí dung môi thấp nhất (đơn vị: nghìn đồng) là bao nhiêu?],
    [1000],
    loigiai: [
        #step([Lập bảng phối trộn dung môi xanh])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Dung môi], [Cồn thực phẩm ($x$)], [Nước cất ($y$)], [Quy chuẩn chiết xuất],
          [Thể tích dung môi], [$1$], [$1$], [Ít nhất $60$ lít],
          [Hạn mức nước cất], [Không hạn chế], [$y <= 40$], [Tối đa $40$ lít nước],
          [Tỷ lệ cồn/nước], [$2x - y >= 0$], [Đảm bảo độ cồn], [Cồn ít nhất bằng nửa nước],
          [Giá (nghìn/lít)], [$30$], [$10$], [$C(x, y) = 30x + 10y$]
        )
        ]
        Hệ BPT: $cases(x + y >= 60, y <= 40, 2x - y >= 0, x >= 0, y >= 0)$.
        - Giao $x + y = 60$ và $y = 40$ là $A(20; 40)$. Kiểm tra $2x - y = 40 - 40 = 0 >= 0$ (thỏa mãn!).
        - Giao $x + y = 60$ và $2x - y = 0$ là $B(20; 40)$ (trùng $A$).
        - Giao $x + y = 60$ với trục hoành ($y = 0$) là $C(60; 0)$.
        Tính chi phí tại các đỉnh biên:
        - Tại $A(20; 40)$: $C(20, 40) = 30(20) + 10(40) = 600 + 400 = 1000$ nghìn đồng.
        - Tại $C(60; 0)$: $C(60, 0) = 30(60) = 1800$ nghìn đồng.
        Chi phí thấp nhất là $1000$ nghìn đồng tại $A(20; 40)$.
    ]
)

#pagebreak()

// TLN 6: Sản xuất Kháng sinh thế hệ mới - 3 PHÂN XƯỞNG & ĐIỂM NGUYÊN TỐI ƯU
#tln([Một công ty dược phẩm sinh học sản xuất hai dòng thuốc kháng sinh phổ rộng thế hệ mới: Cephalosporin thế hệ 4 ($x$ thùng) và Carbapenem ($y$ thùng). Quá trình hoàn thiện trải qua 3 phân xưởng chuyên biệt:
- Phân xưởng Lên men sinh học vô trùng: $1$ thùng Cephalosporin cần $3$ giờ; $1$ thùng Carbapenem cần $2$ giờ.
- Phân xưởng Tách chiết & Sắc ký cột: $1$ thùng Cephalosporin cần $1$ giờ; $1$ thùng Carbapenem cần $3$ giờ.
- Phân xưởng Kết tinh đông khô phòng sạch: $1$ thùng Cephalosporin cần $2$ giờ; $1$ thùng Carbapenem cần $2$ giờ.
Mỗi tháng, quỹ thời gian tối đa của ba xưởng lần lượt là $48$ giờ (Lên men), $51$ giờ (Tách chiết) và $40$ giờ (Kết tinh đông khô). Mỗi thùng Cephalosporin mang lại tiền lãi $30$ triệu đồng, mỗi thùng Carbapenem mang lại tiền lãi $40$ triệu đồng.
Tìm số tiền lãi lớn nhất (đơn vị: triệu đồng) mà công ty có thể thu được trong tháng.],
    [750],
    loigiai: [
        #step([Lập bảng ma trận 3 phân xưởng sản xuất kháng sinh])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Công đoạn xưởng], [Cephalosporin ($x$)], [Carbapenem ($y$)], [Quỹ thời gian tháng],
          [Lên men sinh học], [$3$ giờ], [$2$ giờ], [Tối đa $48$ giờ],
          [Tách chiết sắc ký], [$1$ giờ], [$3$ giờ], [Tối đa $51$ giờ],
          [Kết tinh đông khô], [$2$ giờ], [$2$ giờ], [Tối đa $40$ giờ],
          [Tiền lãi (triệu đồng)], [$30$], [$40$], [$F(x, y) = 30x + 40y$]
        )
        ]

        #step([Thiết lập hệ bất phương trình ràng buộc])
        $ cases(
            3x + 2y <= 48 quad &(d_1),
            x + 3y <= 51 quad &(d_2),
            2x + 2y <= 40 <=> x + y <= 20 quad &(d_3),
            x >= 0,
            y >= 0
        ) $ với $x, y in NN$.

        #step([Tọa độ đỉnh, khảo sát điểm nguyên và minh họa CeTZ])
        #grid(
          columns: (1fr, auto),
          gutter: 10pt,
          align: horizon,
          [
            Giao $d_1, d_3$ là $M_1(8; 12)$. Giao $d_2, d_3$ là $M_2(4.5; 15.5)$.
            Miền nghiệm: $O(0; 0), A(16; 0), M_1(8; 12), M_2(4.5; 15.5), D(0; 17)$.
            Khảo sát các điểm nguyên lân cận $M_2(4.5; 15.5)$:
            - Điểm $(4; 15)$: $F = 30(4) + 40(15) = 720$ triệu.
            - Điểm $(5; 15)$: thỏa cả 3 điều kiện:
              $3(5) + 2(15) = 45 <= 48$;
              $5 + 3(15) = 50 <= 51$;
              $5 + 15 = 20 <= 20$.
              Tiền lãi: $F(5, 15) = 30(5) + 40(15) = 750$ triệu đồng!
            Vậy tiền lãi lớn nhất là $750$ triệu đồng khi sản xuất $5$ thùng Cephalosporin và $15$ thùng Carbapenem.
          ],
          [
            #cetz.canvas({
                import cetz.draw: *
                set-style(stroke: 0.8pt)
                let sc = 0.16
                let xmax = 18
                let ymax = 19
                
                for x in range(0, 19) {
                  let xv = x * sc
                  line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
                }
                for y in range(0, 20) {
                  let yv = y * sc
                  line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
                }
                
                fill(rgb("eff6ff"))
                stroke(1.2pt + rgb("0d9488"))
                line((0, 0), (16 * sc, 0), (8 * sc, 12 * sc), (4.5 * sc, 15.5 * sc), (0, 17 * sc), close: true)
                
                line((4 * sc, 18 * sc), (17 * sc, -1.5 * sc), stroke: 1.1pt + rgb("0d9488"))
                line((-1 * sc, 17.33 * sc), (18 * sc, 11 * sc), stroke: 1.1pt + rgb("0284c7"))
                line((2 * sc, 18 * sc), (19 * sc, 1 * sc), stroke: 1.1pt + rgb("d97706"))
                
                line((5 * sc, 15 * sc), (5 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
                line((5 * sc, 15 * sc), (0, 15 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
                
                line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
                content(((xmax + 1) * sc, 0), [$x$])
                line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
                content((0, (ymax + 1) * sc), [$y$])
                content((-0.2, -0.2), [$O$])
                
                circle((0, 0), radius: 1.8pt, fill: black)
                circle((16 * sc, 0), radius: 2pt, fill: black)
                content((16 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
                circle((8 * sc, 12 * sc), radius: 2pt, fill: black)
                circle((0, 17 * sc), radius: 2pt, fill: black)
                content((0.22, 17 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$D$]])
                
                circle((5 * sc, 15 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
                content((5 * sc + 0.65, 15 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), weight: "bold", size: 7.5pt)[$(5; 15)$]])
            })
          ]
        )
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
