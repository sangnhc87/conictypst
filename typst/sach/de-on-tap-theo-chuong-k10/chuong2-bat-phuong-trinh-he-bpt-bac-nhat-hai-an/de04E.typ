#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.emerald

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 2",
  exam-title: "BÀI 4: QUY HOẠCH TUYẾN TÍNH & TOÁN THỰC TẾ (ĐỀ SỐ 2 - NÔNG NGHIỆP & TRANG TRẠI)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "105",
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

// TN 1: Ràng buộc quỹ đất canh tác
#tn([Một nông hộ có $10" ha"$ đất để trồng cà rốt ($x" ha"$) và bắp cải ($y" ha"$). Bất phương trình nào sau đây mô tả đúng ràng buộc về tổng diện tích đất canh tác khả dụng?],
    (
        [$x + y >= 10$],
        True([$x + y <= 10$ (với $x >= 0, y >= 0$)]),
        [$x - y <= 10$],
        [$10x + 10y <= 1$]
    ),
    loigiai: [
        #step([Lập bảng phân bổ diện tích])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Cà rốt ($x" ha"$)], [Bắp cải ($y" ha"$)], [Tổng quỹ đất],
          [Diện tích gieo trồng], [$x$], [$y$], [Tối đa $10" ha"$]
        )
        ]
        Tổng diện tích đất gieo trồng là $x + y$. Do diện tích không vượt quá quỹ đất hiện có $10" ha"$ và diện tích không âm nên ta có $x + y <= 10$ với $x >= 0, y >= 0$.
    ]
)

// TN 2: Ràng buộc ngày công lao động
#tn([Để trồng $1" ha"$ ngô cần $20$ ngày công lao động và $1" ha"$ đậu tương cần $30$ ngày công lao động. Trang trại có tối đa $180$ ngày công trong vụ mùa. Gọi $x, y$ lần lượt là diện tích (ha) trồng ngô và đậu tương. Bất phương trình rút gọn về ngày công là:],
    (
        [$3x + 2y <= 18$],
        [$2x + 3y >= 18$],
        True([$2x + 3y <= 18$]),
        [$x + y <= 9$]
    ),
    loigiai: [
        #step([Lập bảng nhu cầu ngày công])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Yếu tố lao động], [Ngô ($x" ha"$)], [Đậu tương ($y" ha"$)], [Quỹ ngày công tối đa],
          [Ngày công (công/ha)], [$20$], [$30$], [Không quá $180$ công]
        )
        ]
        Ta có: $20x + 30y <= 180 <=> 2x + 3y <= 18$.
    ]
)

// TN 3: Nhu cầu nước tưới hồ chứa
#tn([Một trang trại trồng sầu riêng ($x$ sào) và bơ booth ($y$ sào). Mỗi sào sầu riêng cần $40" m"^3$ nước tưới mỗi đợt, mỗi sào bơ cần $25" m"^3$ nước tưới. Hồ thủy lợi chỉ có thể cấp tối đa $500" m"^3$ nước mỗi đợt. Bất phương trình mô tả lượng nước tưới là:],
    (
        [$5x + 8y <= 100$],
        True([$8x + 5y <= 100$]),
        [$8x + 5y >= 100$],
        [$4x + 2.5y >= 50$]
    ),
    loigiai: [
        #step([Lập bảng sử dụng nguồn nước])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Nguồn lực], [Sầu riêng ($x$ sào)], [Bơ booth ($y$ sào)], [Dung tích hồ chứa],
          [Nước tưới ($"m"^3$/sào)], [$40$], [$25$], [Tối đa $500" m"^3$]
        )
        ]
        Ta có: $40x + 25y <= 500 <=> 8x + 5y <= 100$ (chia cả hai vế cho 5).
    ]
)

// TN 4: Hàm mục tiêu doanh thu hoa Tết
#tn([Một vườn hoa Đà Lạt trồng hai loại hoa phục vụ Tết: hoa ly ($x$ sào, lãi $80$ triệu đồng/sào) và hoa cúc ($y$ sào, lãi $40$ triệu đồng/sào). Hàm mục tiêu biểu thị tổng tiền lãi $L(x, y)$ (đơn vị: triệu đồng) là:],
    (
        [$L(x, y) = 40x + 80y$],
        True([$L(x, y) = 80x + 40y$]),
        [$L(x, y) = 120(x + y)$],
        [$L(x, y) = 80x - 40y$]
    ),
    loigiai: [
        #step([Lập bảng đơn giá tiền lãi])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Hoa ly ($x$ sào)], [Hoa cúc ($y$ sào)], [Tổng tiền lãi $L(x, y)$],
          [Lãi (triệu đồng/sào)], [$80$], [$40$], [$80 dot x + 40 dot y$]
        )
        ]
        Tổng tiền lãi thu được: $L(x, y) = 80x + 40y$ (triệu đồng).
    ]
)

// TN 5: Phối trộn thức ăn chăn nuôi
#tn([Để phối trộn $1" kg"$ thức ăn tổng hợp cho gà, người nuôi dùng cám bắp ($x" kg"$) và bột đậu nành ($y" kg"$). Mỗi kg cám bắp chứa $80" g"$ đạm; mỗi kg bột đậu nành chứa $400" g"$ đạm. Để đàn gà phát triển tốt, hỗn hợp phải cung cấp ít nhất $160" g"$ đạm. Bất phương trình nào sau đây đúng?],
    (
        [$x + 5y <= 2$],
        [$5x + y >= 2$],
        True([$x + 5y >= 2$]),
        [$80x + 400y <= 160$]
    ),
    loigiai: [
        #step([Lập bảng hàm lượng đạm])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Dinh dưỡng], [Cám bắp ($x" kg"$)], [Bột đậu nành ($y" kg"$)], [Nhu cầu tối thiểu],
          [Hàm lượng đạm (gam)], [$80$], [$400$], [Ít nhất $160" g"$]
        )
        ]
        Lượng đạm cung cấp: $80x + 400y >= 160 <=> x + 5y >= 2$ (chia hai vế cho 80).
    ]
)

// TN 6: Bón phân NPK cho vườn cây
#tn([Một nông dân cần cung cấp tối thiểu $40" kg"$ Đạm (N) cho vườn cây. Phân bón loại I chứa $10\%$ Đạm, phân bón loại II chứa $20\%$ Đạm. Gọi $x, y$ lần lượt là số kg phân loại I và II được bón. Bất phương trình nào thể hiện yêu cầu về lượng Đạm?],
    (
        [$x + 2y <= 400$],
        [$2x + y >= 400$],
        True([$x + 2y >= 400$]),
        [$0.1x + 0.2y <= 40$]
    ),
    loigiai: [
        #step([Lập bảng tỉ lệ thành phần phân bón])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Nguyên tố], [Phân loại I ($x" kg"$)], [Phân loại II ($y" kg"$)], [Yêu cầu cây trồng],
          [Khối lượng Đạm (kg)], [$0.1x$], [$0.2y$], [Tối thiểu $40" kg"$]
        )
        ]
        Ta có: $0.1x + 0.2y >= 40 <=> x + 2y >= 400$ (nhân hai vế với 10).
    ]
)

// TN 7: Thuê máy gặt lúa liên hợp
#tn([Cần gặt xong ít nhất $20" ha"$ lúa trong một ngày. Hợp tác xã điều động $x$ máy gặt loại lớn (công suất $4" ha"$/ngày) và $y$ máy gặt loại nhỏ (công suất $2" ha"$/ngày). Bất phương trình ràng buộc diện tích lúa được gặt là:],
    (
        [$2x + y <= 10$],
        True([$2x + y >= 10$]),
        [$4x + 2y <= 20$],
        [$x + 2y >= 10$]
    ),
    loigiai: [
        #step([Lập bảng công suất máy gặt])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Máy lớn ($x$ chiếc)], [Máy nhỏ ($y$ chiếc)], [Chỉ tiêu trong ngày],
          [Công suất (ha/ngày)], [$4$], [$2$], [Ít nhất $20" ha"$]
        )
        ]
        Tổng diện tích gặt được: $4x + 2y >= 20 <=> 2x + y >= 10$.
    ]
)

// TN 8: Đặt thùng ong lấy mật
#tn([Một trại nuôi ong đặt $x$ đàn ong nội và $y$ đàn ong ngoại. Thời gian chăm sóc mỗi tuần cho $1$ đàn ong nội là $2$ giờ, $1$ đàn ong ngoại là $3$ giờ. Trại có tối đa $60$ giờ chăm sóc mỗi tuần. Bất phương trình nào sau đây đúng?],
    (
        [$3x + 2y <= 60$],
        True([$2x + 3y <= 60$]),
        [$2x + 3y >= 60$],
        [$x + y <= 25$]
    ),
    loigiai: [
        #step([Lập bảng thời gian chăm sóc ong])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Công việc], [Ong nội ($x$ đàn)], [Ong ngoại ($y$ đàn)], [Quỹ thời gian tuần],
          [Chăm sóc (giờ/đàn)], [$2$], [$3$], [Tối đa $60$ giờ]
        )
        ]
        Ta có: $2x + 3y <= 60$.
    ]
)

// TN 9: Lợi nhuận trồng dưa hấu và dưa lê
#tn([Miền phương án trồng trọt của một hộ nông dân là tam giác $O A B$ có các đỉnh $O(0; 0), A(6; 0), B(0; 5)$. Hàm lợi nhuận từ dưa hấu ($x$ sào) và dưa lê ($y$ sào) là $F(x, y) = 15x + 20y$ (triệu đồng). Mức lợi nhuận lớn nhất đạt được là:],
    (
        [$90$ triệu đồng],
        True([$100$ triệu đồng]),
        [$95$ triệu đồng],
        [$110$ triệu đồng]
    ),
    loigiai: [
        #step([Lập bảng tính lợi nhuận tại các đỉnh tam giác])
        #align(center)[
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Biểu thức $F(x, y) = 15x + 20y$], [Lợi nhuận (triệu đồng)],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(6; 0)$], [$15(6) + 20(0) = 90$], [$90$],
          [$B(0; 5)$], [$15(0) + 20(5) = 100$], [$100$]
        )
        ]
        Lợi nhuận lớn nhất là $100$ triệu đồng tại phương án $B(0; 5)$ (chuyên canh $5$ sào dưa lê).
    ]
)

// TN 10: Tối ưu tiền lãi chăn nuôi gia cầm
#tn([Miền nghiệm của bài toán chăn nuôi gia cầm là tứ giác $O A B C$ với tọa độ các đỉnh $O(0; 0), A(50; 0), B(30; 40), C(0; 60)$ (đơn vị: con). Hàm lợi nhuận từ gà ($x$ con) và vịt ($y$ con) là $F(x, y) = 30x + 25y$ (nghìn đồng). Tiền lãi lớn nhất là:],
    (
        [$1.500.000$ đồng],
        True([$1.900.000$ đồng]),
        [$1.800.000$ đồng],
        [$2.000.000$ đồng]
    ),
    loigiai: [
        #step([Lập bảng so sánh tiền lãi tại các đỉnh])
        #align(center)[
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Biểu thức $F(x, y) = 30x + 25y$], [Tiền lãi (nghìn đồng)],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(50; 0)$], [$30(50) = 1500$], [$1500$],
          [$B(30; 40)$], [$30(30) + 25(40) = 900 + 1000$], [$1900$],
          [$C(0; 60)$], [$25(60) = 1500$], [$1500$]
        )
        ]
        Tiền lãi lớn nhất là $1900$ nghìn đồng ($1.900.000$ đồng) khi nuôi $30$ con gà và $40$ con vịt.
    ]
)

// TN 11: Ràng buộc phun chế phẩm sinh học
#tn([Trang trại cần xử lý sâu bệnh cho hai khu vườn $A$ và $B$. Mỗi lít thuốc sinh học phun được $2" ha"$ vườn $A$ hoặc $3" ha"$ vườn $B$. Tổng diện tích trang trại cần phun tối thiểu là $12" ha"$. Bất phương trình nào sau đây đúng với lượng thuốc $x, y$ (lít) dùng cho hai vườn?],
    (
        [$3x + 2y <= 12$],
        True([$2x + 3y >= 12$]),
        [$2x + 3y <= 12$],
        [$x + y >= 6$]
    ),
    loigiai: [
        #step([Lập bảng diện tích xử lý sinh học])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Vườn A ($x$ lít)], [Vườn B ($y$ lít)], [Yêu cầu tối thiểu],
          [Diện tích phun (ha/lít)], [$2$], [$3$], [Ít nhất $12" ha"$]
        )
        ]
        Ta có diện tích bảo vệ được là: $2x + 3y >= 12$.
    ]
)

// TN 12: Chi phí mua giống phủ xanh đất trống
#tn([Để phủ xanh đồi trọc, trạm kiểm lâm trồng hai loại cây: keo tai tượng ($x$ vạn cây, giá $20$ triệu đồng/vạn) và bạch đàn ($y$ vạn cây, giá $25$ triệu đồng/vạn). Hàm tổng chi phí mua giống $C(x, y)$ (đơn vị: triệu đồng) cần tối thiểu hóa là:],
    (
        [$C(x, y) = 25x + 20y$],
        [$C(x, y) = 45(x + y)$],
        True([$C(x, y) = 20x + 25y$]),
        [$C(x, y) = 20x - 25y$]
    ),
    loigiai: [
        #step([Lập bảng chi phí mua cây giống])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Khoản mục], [Keo tai tượng ($x$ vạn)], [Bạch đàn ($y$ vạn)], [Tổng chi phí giống],
          [Đơn giá (triệu/vạn)], [$20$], [$25$], [$C(x, y) = 20x + 25y$]
        )
        ]
        Hàm chi phí cần làm nhỏ nhất là: $C(x, y) = 20x + 25y$ (triệu đồng).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

#pagebreak()

// DS 1: Trang trại nuôi bò sữa và bò thịt
#ds([Một trang trại chăn nuôi hai loại bò: bò sữa và bò thịt. Mỗi ngày, một con bò sữa cần $15" kg"$ cỏ khô và $4$ giờ chăm sóc, mang lại tiền lãi $120$ nghìn đồng; một con bò thịt cần $10" kg"$ cỏ khô và $2$ giờ chăm sóc, mang lại tiền lãi $70$ nghìn đồng. Mỗi ngày trang trại có tối đa $150" kg"$ cỏ khô và $36$ giờ chăm sóc. Gọi $x, y$ lần lượt là số con bò sữa và bò thịt trang trại nuôi ($x, y in NN$). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình mô tả các ràng buộc về lượng cỏ khô và thời gian chăm sóc rút gọn là $cases(3x + 2y <= 30, 2x + y <= 18, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của bài toán là một hình tứ giác có các đỉnh là $O(0; 0), A(9; 0), B(6; 6), C(0; 15)$.]),
    True([Để thu được tiền lãi nhiều nhất mỗi ngày, trang trại nên nuôi $6$ con bò sữa và $6$ con bò thịt.]),
    True([Số tiền lãi lớn nhất mà trang trại có thể đạt được trong một ngày là $1.140.000$ đồng.])
  ),
  loigiai: [
    #step([Lập bảng tóm tắt số liệu chăn nuôi])
    #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      align: center + horizon,
      stroke: 0.5pt + rgb("cbd5e1"),
      fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
      [Nguồn lực / Lãi], [Bò sữa ($x$ con)], [Bò thịt ($y$ con)], [Giới hạn trong ngày],
      [Cỏ khô (kg/con)], [$15$], [$10$], [Tối đa $150" kg"$],
      [Chăm sóc (giờ/con)], [$4$], [$2$], [Tối đa $36$ giờ],
      [Tiền lãi (nghìn đồng)], [$120$], [$70$], [$F(x, y) = 120x + 70y$]
    )
    ]
    Hệ BPT: $cases(3x + 2y <= 30, 2x + y <= 18, x >= 0, y >= 0)$ (Ý a Đúng).

    #step([Tọa độ đỉnh và minh họa miền nghiệm hình học])
    #grid(
      columns: (1fr, auto),
      gutter: 10pt,
      align: horizon,
      [
        Giao điểm biên: $cases(3x + 2y = 30, 2x + y = 18) <=> cases(x = 6, y = 6) => B(6; 6)$.
        Miền nghiệm tứ giác $O A B C$:
        $O(0; 0), A(9; 0), B(6; 6), C(0; 15)$ (Ý b Đúng).

        #v(3pt)
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Tính toán $F(x, y)$], [Tiền lãi],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(9; 0)$], [$120(9)$], [$1080$],
          [$B(6; 6)$], [$120(6) + 70(6)$], [$1140$],
          [$C(0; 15)$], [$70(15)$], [$1050$]
        )
        Lãi lớn nhất tại $B(6; 6)$ là $1.140.000$ đ. (Ý c, d Đúng)
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.16
          let xmax = 12
          let ymax = 19
          
          for x in range(0, 7) {
            let xv = x * 2 * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 10) {
            let yv = y * 2 * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (9 * sc, 0), (6 * sc, 6 * sc), (0, 15 * sc), close: true)
          
          line((0, 15 * sc), (11 * sc, -1.5 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((8.5 * sc, 4 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$3x + 2y = 30$]])
          
          line((-0.5 * sc, 19 * sc), (9.5 * sc, -1 * sc), stroke: 1.1pt + rgb("059669"))
          content((2.8 * sc, 15 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$2x + y = 18$]])
          
          line((6 * sc, 6 * sc), (6 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((6 * sc, 6 * sc), (0, 6 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 1) * sc, 0), [$x$])
          line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 1) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((6 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$6$]])
          content((9 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$9$]])
          content((-0.26, 6 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$6$]])
          content((-0.26, 15 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$15$]])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((9 * sc, 0), radius: 2pt, fill: black)
          content((9 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
          circle((0, 15 * sc), radius: 2pt, fill: black)
          content((0.22, 15 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
          
          circle((6 * sc, 6 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((6 * sc + 0.55, 6 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(6; 6)$]])
        })
      ]
    )
  ]
)

#pagebreak()

// DS 2: Trồng dưa lưới và cà chua bi nhà màng
#ds([Một doanh nghiệp nông nghiệp ứng dụng công nghệ cao trồng dưa lưới ($x$ sào) và cà chua bi ($y$ sào) trong nhà màng. Để trồng $1$ sào dưa lưới cần $40$ triệu đồng tiền vốn và $20$ ngày công chăm sóc, lãi $30$ triệu đồng. Để trồng $1$ sào cà chua bi cần $30$ triệu đồng tiền vốn và $30$ ngày công chăm sóc, lãi $28$ triệu đồng. Doanh nghiệp có $240$ triệu đồng tiền vốn và tối đa $180$ ngày công. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc vốn và ngày công rút gọn là $cases(4x + 3y <= 24, 2x + 3y <= 18, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của bài toán là một hình tứ giác lồi có đỉnh giao điểm là $B(3; 4)$.]),
    False([Để tối đa hóa lợi nhuận, doanh nghiệp nên dùng toàn bộ vốn để trồng dưa lưới và không trồng cà chua bi.]),
    True([Lợi nhuận lớn nhất mà doanh nghiệp có thể thu được là $202$ triệu đồng.])
  ),
  loigiai: [
    #step([Lập bảng tóm tắt số liệu nhà màng])
    #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      align: center + horizon,
      stroke: 0.5pt + rgb("cbd5e1"),
      fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
      [Nguồn lực / Lãi], [Dưa lưới ($x$ sào)], [Cà chua bi ($y$ sào)], [Khả dụng tối đa],
      [Vốn đầu tư (triệu)], [$40$], [$30$], [Tối đa $240$ triệu],
      [Ngày công (công)], [$20$], [$30$], [Tối đa $180$ công],
      [Lợi nhuận (triệu)], [$30$], [$28$], [$F(x, y) = 30x + 28y$]
    )
    ]
    Hệ BPT: $cases(4x + 3y <= 24, 2x + 3y <= 18, x >= 0, y >= 0)$ (Ý a Đúng).

    #step([Tọa độ đỉnh và minh họa miền nghiệm hình học])
    #grid(
      columns: (1fr, auto),
      gutter: 10pt,
      align: horizon,
      [
        Giao điểm biên: $cases(4x + 3y = 24, 2x + 3y = 18) <=> cases(x = 3, y = 4) => B(3; 4)$.
        Miền nghiệm tứ giác $O A B C$:
        $O(0; 0), A(6; 0), B(3; 4), C(0; 6)$ (Ý b Đúng).

        #v(3pt)
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Tính toán $F(x, y)$], [Lợi nhuận (triệu)],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(6; 0)$], [$30(6)$], [$180$],
          [$B(3; 4)$], [$30(3) + 28(4)$], [$202$],
          [$C(0; 6)$], [$28(6)$], [$168$]
        )
        Lãi lớn nhất là $202$ triệu tại $B(3; 4)$. (Ý c Sai, d Đúng)
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.32
          let xmax = 9.5
          let ymax = 9
          
          for x in range(0, 10) {
            let xv = x * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 10) {
            let yv = y * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (6 * sc, 0), (3 * sc, 4 * sc), (0, 6 * sc), close: true)
          
          line((-0.5 * sc, 8.67 * sc), (6.5 * sc, -0.67 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((5.2 * sc, 3.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$4x + 3y = 24$]])
          
          line((-1 * sc, 6.67 * sc), (9.5 * sc, -0.33 * sc), stroke: 1.1pt + rgb("059669"))
          content((2.2 * sc, 6.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$2x + 3y = 18$]])
          
          line((3 * sc, 4 * sc), (3 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((3 * sc, 4 * sc), (0, 4 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 1) * sc, 0), [$x$])
          line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 1) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((3 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$3$]])
          content((6 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$6$]])
          content((-0.26, 4 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$4$]])
          content((-0.26, 6 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$6$]])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((6 * sc, 0), radius: 2pt, fill: black)
          content((6 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
          circle((0, 6 * sc), radius: 2pt, fill: black)
          content((0.22, 6 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
          
          circle((3 * sc, 4 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((3 * sc + 0.55, 4 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(3; 4)$]])
        })
      ]
    )
  ]
)

#pagebreak()

// DS 3: Phối trộn phân bón NPK chi phí nhỏ nhất
#ds([Để bón phân cho vườn cây ăn trái sau thu hoạch, nông dân cần bổ sung tối thiểu $90" kg"$ Đạm (N) và $60" kg"$ Kali (K). Nông dân có thể mua hai loại phân: bao loại I (giá $300$ nghìn đồng/bao, chứa $3" kg" N$ và $1" kg" K$) và bao loại II (giá $250$ nghìn đồng/bao, chứa $1" kg" N$ và $2" kg" K$). Gọi $x, y$ lần lượt là số bao phân loại I và II cần mua. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc về hàm lượng dinh dưỡng Đạm và Kali là $cases(3x + y >= 90, x + 2y >= 60, x >= 0, y >= 0)$.]),
    True([Giao điểm của hai đường thẳng biên tương ứng là đỉnh $B(24; 18)$.]),
    True([Chi phí mua phân bón nhỏ nhất khi nông dân mua $24$ bao loại I và $18$ bao loại II.]),
    False([Tổng số tiền ít nhất để mua phân bón thỏa mãn dinh dưỡng là $10.500.000$ đồng.])
  ),
  loigiai: [
    #step([Lập bảng tóm tắt dinh dưỡng phân bón])
    #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      align: center + horizon,
      stroke: 0.5pt + rgb("cbd5e1"),
      fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
      [Dinh dưỡng / Giá], [Bao loại I ($x$ bao)], [Bao loại II ($y$ bao)], [Nhu cầu tối thiểu],
      [Đạm N (kg/bao)], [$3$], [$1$], [Ít nhất $90" kg"$],
      [Kali K (kg/bao)], [$1$], [$2$], [Ít nhất $60" kg"$],
      [Giá tiền (nghìn)], [$300$], [$250$], [$C(x, y) = 300x + 250y$]
    )
    ]
    Hệ BPT: $cases(3x + y >= 90, x + 2y >= 60, x >= 0, y >= 0)$ (Ý a Đúng).

    #step([Tọa độ đỉnh và minh họa miền nghiệm hình học])
    #grid(
      columns: (1fr, auto),
      gutter: 10pt,
      align: horizon,
      [
        Giao điểm biên: $cases(3x + y = 90, x + 2y = 60) <=> cases(x = 24, y = 18) => B(24; 18)$ (Ý b Đúng).
        Miền nghiệm là miền không giới hạn với các đỉnh bờ:
        $A(0; 90), B(24; 18), C(60; 0)$.

        #v(3pt)
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Tính toán $C(x, y)$], [Chi phí (nghìn)],
          [$A(0; 90)$], [$250(90)$], [$22500$],
          [$B(24; 18)$], [$300(24) + 250(18)$], [$11700$],
          [$C(60; 0)$], [$300(60)$], [$18000$]
        )
        Chi phí nhỏ nhất là $11.700.000$ đ tại $B(24; 18)$. (Ý c Đúng, d Sai)
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.028
          let xmax = 75
          let ymax = 105
          
          for x in range(0, 8) {
            let xv = x * 10 * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 11) {
            let yv = y * 10 * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 102 * sc), (0, 90 * sc), (24 * sc, 18 * sc), (60 * sc, 0), (72 * sc, 0), (72 * sc, 102 * sc), close: true)
          
          line((-2 * sc, 96 * sc), (32 * sc, -6 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((26 * sc, 40 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$3x + y = 90$]])
          
          line((-4 * sc, 32 * sc), (66 * sc, -3 * sc), stroke: 1.1pt + rgb("059669"))
          content((55 * sc, 12 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$x + 2y = 60$]])
          
          line((24 * sc, 18 * sc), (24 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((24 * sc, 18 * sc), (0, 18 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-5 * sc, 0), ((xmax + 5) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 7) * sc, 0), [$x$])
          line((0, -5 * sc), (0, (ymax + 5) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 7) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((24 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$24$]])
          content((60 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$60$]])
          content((-0.28, 18 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$18$]])
          content((-0.28, 90 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$90$]])
          
          circle((60 * sc, 0), radius: 2pt, fill: black)
          content((60 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
          circle((0, 90 * sc), radius: 2pt, fill: black)
          content((0.22, 90 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
          
          circle((24 * sc, 18 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((24 * sc + 0.6, 18 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(24; 18)$]])
        })
      ]
    )
  ]
)

#pagebreak()

// DS 4: Nuôi tôm thẻ và cá chẽm thâm canh
#ds([Một hợp tác xã nuôi thủy sản trên diện tích mặt nước $6" ha"$, số vốn thả giống tối đa là $180$ triệu đồng. Hợp tác xã nuôi tôm thẻ chân trắng ($x" ha"$) và cá chẽm ($y" ha"$). Tiền con giống cho $1" ha"$ tôm là $40$ triệu đồng, mang lại tiền lãi $60$ triệu đồng. Tiền con giống cho $1" ha"$ cá là $20$ triệu đồng, mang lại tiền lãi $35$ triệu đồng. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc về diện tích mặt nước và vốn con giống là $cases(x + y <= 6, 2x + y <= 9, x >= 0, y >= 0)$.]),
    True([Giao điểm của hai đường biên là $B(3; 3)$.]),
    True([Lợi nhuận cao nhất đạt được khi hợp tác xã nuôi $3" ha"$ tôm thẻ và $3" ha"$ cá chẽm.]),
    True([Mức lợi nhuận tối đa hợp tác xã có thể đạt được là $285$ triệu đồng.])
  ),
  loigiai: [
    #step([Lập bảng tóm tắt số liệu thủy sản])
    #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      align: center + horizon,
      stroke: 0.5pt + rgb("cbd5e1"),
      fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
      [Nguồn lực / Lãi], [Tôm thẻ ($x" ha"$)], [Cá chẽm ($y" ha"$)], [Khả dụng tối đa],
      [Mặt nước (ha)], [$1$], [$1$], [Tối đa $6" ha"$],
      [Vốn giống (triệu)], [$40$], [$20$], [Tối đa $180$ triệu],
      [Lợi nhuận (triệu)], [$60$], [$35$], [$F(x, y) = 60x + 35y$]
    )
    ]
    Hệ BPT: $cases(x + y <= 6, 2x + y <= 9, x >= 0, y >= 0)$ (Ý a Đúng).

    #step([Tọa độ đỉnh và minh họa miền nghiệm hình học])
    #grid(
      columns: (1fr, auto),
      gutter: 10pt,
      align: horizon,
      [
        Giao điểm biên: $cases(x + y = 6, 2x + y = 9) <=> cases(x = 3, y = 3) => B(3; 3)$ (Ý b Đúng).
        Miền nghiệm tứ giác $O A B C$:
        $O(0; 0), A(4.5; 0), B(3; 3), C(0; 6)$.

        #v(3pt)
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Tính toán $F(x, y)$], [Lợi nhuận (triệu)],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(4.5; 0)$], [$60(4.5)$], [$270$],
          [$B(3; 3)$], [$60(3) + 35(3)$], [$285$],
          [$C(0; 6)$], [$35(6)$], [$210$]
        )
        Lãi lớn nhất là $285$ triệu tại $B(3; 3)$. (Ý c, d Đúng)
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.32
          let xmax = 7.5
          let ymax = 10
          
          for x in range(0, 8) {
            let xv = x * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 11) {
            let yv = y * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (4.5 * sc, 0), (3 * sc, 3 * sc), (0, 6 * sc), close: true)
          
          line((-0.5 * sc, 6.5 * sc), (6.5 * sc, -0.5 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((4.8 * sc, 2.5 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$x + y = 6$]])
          
          line((-0.5 * sc, 10 * sc), (5 * sc, -1 * sc), stroke: 1.1pt + rgb("059669"))
          content((1.8 * sc, 7.5 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$2x + y = 9$]])
          
          line((3 * sc, 3 * sc), (3 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((3 * sc, 3 * sc), (0, 3 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 1) * sc, 0), [$x$])
          line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 1) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((3 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$3$]])
          content((4.5 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$4.5$]])
          content((-0.26, 3 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$3$]])
          content((-0.26, 6 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$6$]])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((4.5 * sc, 0), radius: 2pt, fill: black)
          content((4.5 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
          circle((0, 6 * sc), radius: 2pt, fill: black)
          content((0.22, 6 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
          
          circle((3 * sc, 3 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((3 * sc + 0.55, 3 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(3; 3)$]])
        })
      ]
    )
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1: Trồng lúa và khoai lang
#tln([Bác Ba có $8" ha"$ đất để trồng lúa ($x" ha"$) và khoai lang ($y" ha"$). Vốn đầu tư cho mỗi ha lúa là $20$ triệu đồng, mỗi ha khoai lang là $30$ triệu đồng. Bác Ba có tất cả $180$ triệu đồng tiền vốn. Tiền lãi mỗi ha lúa là $30$ triệu đồng, mỗi ha khoai lang là $40$ triệu đồng. Tìm số tiền lãi lớn nhất (đơn vị: triệu đồng) mà bác Ba có thể thu được.],
    [260],
    loigiai: [
        #step([Lập bảng tóm tắt số liệu])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Yếu tố], [Lúa ($x" ha"$)], [Khoai lang ($y" ha"$)], [Khả dụng tối đa],
          [Diện tích (ha)], [$1$], [$1$], [Tối đa $8" ha"$],
          [Vốn đầu tư (triệu)], [$20$], [$30$], [Tối đa $180$ triệu],
          [Tiền lãi (triệu)], [$30$], [$40$], [$F(x, y) = 30x + 40y$]
        )
        ]
        Hệ bất phương trình: $cases(x + y <= 8, 2x + 3y <= 18, x >= 0, y >= 0)$.
        Giao điểm $B$: nhân phương trình thứ nhất với $2$ được $2x + 2y = 16$. Trừ phương trình thứ hai được $y = 2 => x = 6 => B(6; 2)$.
        Các đỉnh: $O(0; 0), A(8; 0), B(6; 2), C(0; 6)$.
        - $F(A) = 30(8) = 240$ triệu.
        - $F(B) = 30(6) + 40(2) = 180 + 80 = 260$ triệu.
        - $F(C) = 40(6) = 240$ triệu.
        Tiền lãi lớn nhất là $260$ triệu đồng tại $B(6; 2)$.
    ]
)

// TLN 2: Khẩu phần thức ăn nuôi lợn
#tln([Một trại nuôi lợn cần cung cấp tối thiểu $12" kg"$ chất béo và $18" kg"$ chất xơ mỗi ngày. Thức ăn loại $A$ (giá $20$ nghìn đồng/kg) chứa $0.2" kg"$ chất béo và $0.6" kg"$ chất xơ. Thức ăn loại $B$ (giá $25$ nghìn đồng/kg) chứa $0.4" kg"$ chất béo và $0.3" kg"$ chất xơ. Để chi phí mua thức ăn thấp nhất, trại cần mua bao nhiêu kg thức ăn loại $A$ mỗi ngày?],
    [20],
    loigiai: [
        #step([Lập bảng hàm lượng dinh dưỡng thức ăn])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chất dinh dưỡng], [Loại A ($x" kg"$)], [Loại B ($y" kg"$)], [Yêu cầu tối thiểu],
          [Chất béo (kg/kg)], [$0.2$], [$0.4$], [Ít nhất $12" kg"$],
          [Chất xơ (kg/kg)], [$0.6$], [$0.3$], [Ít nhất $18" kg"$],
          [Đơn giá (nghìn)], [$20$], [$25$], [$C(x, y) = 20x + 25y$]
        )
        ]
        Hệ bất phương trình rút gọn:
        $ cases(x + 2y >= 60, 2x + y >= 60, x >= 0, y >= 0) $
        Giao điểm $B$: giải hệ được $x = 20, y = 20 => B(20; 20)$.
        Chi phí thấp nhất đạt tại $B(20; 20)$ với $C = 20(20) + 25(20) = 900$ nghìn đồng.
        Số kg thức ăn loại $A$ cần mua là $x = 20" kg"$.
    ]
)

// TLN 3: Thu hoạch cam sành ngày Tết
#tln([Một nhà vườn cần thuê nhân công thu hoạch cam sành. Nhóm thợ lành nghề ($x$ người) thu hoạch được $120" kg"$/ngày, tiền công $300$ nghìn đồng/người. Nhóm thợ thời vụ ($y$ người) thu hoạch được $80" kg"$/ngày, tiền công $180$ nghìn đồng/người. Vườn cam cần thu hoạch ít nhất $720" kg"$ trong ngày và số thợ lành nghề không quá $4$ người. Tính chi phí thuê thợ ít nhất (đơn vị: nghìn đồng).],
    [1620],
    loigiai: [
        #step([Lập bảng công suất và tiền công])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Thợ lành nghề ($x$)], [Thợ thời vụ ($y$)], [Yêu cầu thu hoạch],
          [Năng suất (kg/người)], [$120$], [$80$], [Ít nhất $720" kg"$],
          [Số lượng thợ], [$x <= 4$], [$y >= 0$], [Thợ nghề tối đa $4$],
          [Tiền công (nghìn)], [$300$], [$180$], [$C(x, y) = 300x + 180y$]
        )
        ]
        Rút gọn điều kiện sản lượng: $120x + 80y >= 720 <=> 3x + 2y >= 18$.
        - Với $x = 4$: $2y >= 18 - 3(4) = 6 => y >= 3$.
          Điểm biên $(4; 3)$ cho chi phí $C(4, 3) = 300(4) + 180(3) = 1200 + 540 = 1740$ nghìn.
        - Với $x = 0$: $2y >= 18 => y = 9 => C(0, 9) = 180(9) = 1620$ nghìn.
        - Với $x = 2$: $2y >= 12 => y = 6 => C(2, 6) = 300(2) + 180(6) = 600 + 1080 = 1680$ nghìn.
        Chi phí nhỏ nhất là $1620$ nghìn đồng khi chỉ thuê $9$ thợ thời vụ.
    ]
)

// TLN 4: Hệ thống tưới nhỏ giọt
#tln([Trang trại lắp hệ thống tưới nhỏ giọt cho vườn bưởi da xanh ($x" ha"$) và mít ruột đỏ ($y" ha"$). Mỗi ha bưởi cần $30$ van tưới và $400" m"$ ống dẫn. Mỗi ha mít cần $20$ van tưới và $500" m"$ ống dẫn. Kho trang trại có $120$ van tưới và $2400" m"$ ống dẫn. Tìm diện tích canh tác lớn nhất $(x + y)$ (đơn vị: ha) có thể lắp đặt được hệ thống.],
    [5],
    loigiai: [
        #step([Lập bảng vật tư tưới nhỏ giọt])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Vật tư], [Bưởi ($x" ha"$)], [Mít ($y" ha"$)], [Số lượng sẵn có],
          [Van tưới], [$30$], [$20$], [Tối đa $120$ van],
          [Ống dẫn (m)], [$400$], [$500$], [Tối đa $2400" m"$]
        )
        ]
        Hệ bất phương trình: $cases(3x + 2y <= 12, 4x + 5y <= 24, x >= 0, y >= 0)$.
        Giao điểm $B$: giải hệ được $x = 12/7 approx 1.71, y = 24/7 approx 3.43$.
        Tổng diện tích tại $B$: $x + y = 36/7 approx 5.14" ha"$.
        Tại các đỉnh khác:
        - $A(4; 0) => x + y = 4$.
        - $C(0; 4.8) => x + y = 4.8$.
        Nếu diện tích làm tròn nguyên là $5" ha"$.
    ]
)

// TLN 5: Nuôi hươu sao và dê núi
#tln([Một trang trại nuôi hươu sao lấy nhung ($x$ con) và dê núi ($y$ con). Chuồng trại có sức chứa tối đa $40$ con. Vốn mua giống cho $1$ con hươu là $15$ triệu đồng, cho $1$ con dê là $5$ triệu đồng. Trang trại có tổng số vốn là $300$ triệu đồng. Mỗi con hươu mang lại lãi $10$ triệu đồng/năm, mỗi con dê lãi $4$ triệu đồng/năm. Tính tiền lãi lớn nhất (đơn vị: triệu đồng) mỗi năm.],
    [220],
    loigiai: [
        #step([Lập bảng số liệu trang trại hươu và dê])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Hươu sao ($x$ con)], [Dê núi ($y$ con)], [Hạn mức trang trại],
          [Chuồng trại (con)], [$1$], [$1$], [Tối đa $40$ con],
          [Vốn giống (triệu)], [$15$], [$5$], [Tối đa $300$ triệu],
          [Tiền lãi (triệu)], [$10$], [$4$], [$F(x, y) = 10x + 4y$]
        )
        ]
        Rút gọn ràng buộc vốn: $15x + 5y <= 300 <=> 3x + y <= 60$.
        Hệ bất phương trình: $cases(x + y <= 40, 3x + y <= 60, x >= 0, y >= 0)$.
        Giao điểm $B$: trừ hai vế được $2x = 20 => x = 10 => y = 30 => B(10; 30)$.
        Các đỉnh: $O(0; 0), A(20; 0), B(10; 30), C(0; 40)$.
        - $F(A) = 10(20) = 200$ triệu.
        - $F(B) = 10(10) + 4(30) = 100 + 120 = 220$ triệu.
        - $F(C) = 4(40) = 160$ triệu.
        Tiền lãi lớn nhất là $220$ triệu đồng khi nuôi $10$ con hươu và $30$ con dê.
    ]
)

#pagebreak()

// TLN 6: Sinh thái tuần hoàn VAC nấm rơm và linh chi
#tln([Một hợp tác xã nông nghiệp tuần hoàn sản xuất nấm rơm hữu cơ ($x$ nghìn bịch phôi) và nấm linh chi đỏ ($y$ nghìn bịch phôi). Quy trình sản xuất trải qua ba công đoạn: Phối trộn nguyên liệu mùn cưa, Khử trùng hấp sấy, và Phòng nuôi thu hoạch.
- Để sản xuất $1$ nghìn bịch nấm rơm cần $3$ giờ phối trộn, $2$ giờ khử trùng và $1$ giờ phòng nuôi, lãi $25$ triệu đồng.
- Để sản xuất $1$ nghìn bịch nấm linh chi cần $2$ giờ phối trộn, $3$ giờ khử trùng và $3$ giờ phòng nuôi, lãi $35$ triệu đồng.
Hợp tác xã có tối đa $30$ giờ phối trộn, $36$ giờ khử trùng và $30$ giờ phòng nuôi mỗi đợt.
Tính số tiền lãi lớn nhất (đơn vị: triệu đồng) hợp tác xã có thể đạt được trong một đợt.],
    [390],
    loigiai: [
        #step([Lập bảng ma trận công đoạn sản xuất nấm])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Công đoạn / Lãi], [Nấm rơm ($x$ nghìn bịch)], [Nấm linh chi ($y$ nghìn bịch)], [Thời gian tối đa (giờ)],
          [Phối trộn nguyên liệu], [$3$], [$2$], [Tối đa $30$ giờ],
          [Khử trùng hấp sấy], [$2$], [$3$], [Tối đa $36$ giờ],
          [Phòng nuôi thu hoạch], [$1$], [$3$], [Tối đa $30$ giờ],
          [Tiền lãi (triệu đồng)], [$25$], [$35$], [$F(x, y) = 25x + 35y$]
        )
        ]

        #step([Thiết lập hệ bất phương trình ràng buộc])
        $ cases(
            3x + 2y <= 30 quad &(d_1),
            2x + 3y <= 36 quad &(d_2),
            x + 3y <= 30 quad &(d_3),
            x >= 0, y >= 0
        ) $

        #step([Tọa độ đỉnh, khảo sát điểm nguyên và minh họa CeTZ])
        #grid(
          columns: (1fr, auto),
          gutter: 10pt,
          align: horizon,
          [
            Giao điểm $d_1: 3x + 2y = 30$ và $d_3: x + 3y = 30$ là $M(30/7; 60/7)$ (thỏa $d_2$).
            Miền nghiệm tứ giác lồi:
            $O(0; 0), A(10; 0), M(30/7; 60/7), C(0; 10)$.

            Khảo sát các điểm nguyên $(x; y) in NN^2$ lân cận đỉnh $M$:
            - Điểm $(3; 9)$: thỏa mãn các ràng buộc, cho $F(3, 9) = 25(3) + 35(9) = 390$ triệu.
            - Điểm $(4; 8)$: cho $F = 380$ triệu; $(5; 7)$: cho $F = 370$ triệu.

            Tiền lãi lớn nhất đạt $390$ triệu đồng khi sản xuất $3$ nghìn bịch nấm rơm và $9$ nghìn bịch nấm linh chi.
          ],
          [
            #cetz.canvas({
                import cetz.draw: *
                set-style(stroke: 0.8pt)
                let sc = 0.22
                let xmax = 13
                let ymax = 13
                
                // Lưới tọa độ nhạt
                for x in range(0, 14) {
                  let xv = x * sc
                  line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
                }
                for y in range(0, 14) {
                  let yv = y * sc
                  line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
                }
                
                // Tô màu miền nghiệm tứ giác
                fill(rgb("eff6ff"))
                stroke(1.2pt + rgb("2563eb"))
                line((0, 0), (10 * sc, 0), (4.29 * sc, 8.57 * sc), (0, 10 * sc), close: true)
                
                // Các đường biên
                line((0, 15 * sc), (11 * sc, -1.5 * sc), stroke: 1.1pt + rgb("2563eb"))
                content((9.5 * sc, 2.5 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$3x + 2y = 30$]])
                
                line((-1 * sc, 10.33 * sc), (15 * sc, 5 * sc), stroke: 1.1pt + rgb("059669"))
                content((2.5 * sc, 10.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$x + 3y = 30$]])
                
                // Đường dóng nét đứt từ điểm tối ưu nguyên (3; 9)
                line((3 * sc, 9 * sc), (3 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
                line((3 * sc, 9 * sc), (0, 9 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
                
                // Trục tọa độ Oxy
                line((-1 * sc, 0), ((xmax + 1) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
                content(((xmax + 1.2) * sc, 0), [$x$])
                line((0, -1 * sc), (0, (ymax + 1) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
                content((0, (ymax + 1.2) * sc), [$y$])
                content((-0.2, -0.2), [$O$])
                
                // Nhãn mốc tọa độ trên trục
                content((3 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$3$]])
                content((10 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$10$]])
                content((-0.26, 9 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$9$]])
                content((-0.26, 10 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$10$]])
                
                // Các đỉnh
                circle((0, 0), radius: 1.8pt, fill: black)
                circle((10 * sc, 0), radius: 2pt, fill: black)
                content((10 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
                circle((0, 10 * sc), radius: 2pt, fill: black)
                content((0.22, 10 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
                
                // Điểm tối ưu nguyên (3; 9)
                circle((3 * sc, 9 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
                content((3 * sc + 0.55, 9 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), weight: "bold", size: 7.5pt)[$(3; 9)$]])
            })
          ]
        )
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
