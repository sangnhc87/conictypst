#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("d97706") // Amber công nghệ AI, logistics & hàng không

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 2",
  exam-title: "BÀI 4: QUY HOẠCH TUYẾN TÍNH NÂNG CAO (ĐỀ SỐ 6 - AI DATA CENTER & HÀNG KHÔNG LOGISTICS)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "109",
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

// TN 1: Phân bổ hạ tầng máy chủ GPU tại Data Center
#tn([Một trung tâm dữ liệu AI lắp đặt $x$ cụm máy chủ huấn luyện và $y$ cụm máy chủ suy luận. Do giới hạn nguồn điện trạm biến áp, tổng công suất tiêu thụ không quá $100" kW"$. Mỗi cụm huấn luyện dùng $4" kW"$, mỗi cụm suy luận dùng $2" kW"$. Để đảm bảo an toàn chịu tải, số cụm suy luận không được vượt quá hai lần số cụm huấn luyện. Hệ bất phương trình mô tả các điều kiện kỹ thuật trên là:],
    (
        [$cases(4x + 2y <= 100, y <= 2x)$],
        [$cases(2x + y <= 50, x >= 2y, x >= 0, y >= 0)$],
        True([$cases(2x + y <= 50, 2x - y >= 0, x >= 0, y >= 0)$]),
        [$cases(2x + y <= 50, 2x - y <= 0, x >= 0, y >= 0)$]
    ),
    loigiai: [
        #step([Lập bảng thông số công suất và tỷ lệ máy chủ])
        #align(center)[
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Hạng mục], [Máy chủ ($x, y$)], [Giới hạn kỹ thuật],
          [Công suất điện], [$4x + 2y <= 100$], [$2x + y <= 50$ (chia cả hai vế cho $2$)],
          [Tỷ lệ chịu tải], [$y <= 2x$], [$2x - y >= 0$ và $x, y >= 0$]
        )
        ]
        Hệ bất phương trình là $cases(2x + y <= 50, 2x - y >= 0, x >= 0, y >= 0)$.
    ]
)

// TN 2: Ràng buộc tải trọng hàng không siêu trọng
#tn([Một chuyến bay vận tải Antonov chở kiện hàng siêu trường ($x$ kiện, nặng $5$ tấn/kiện) và kiện hàng siêu trọng ($y$ kiện, nặng $8$ tấn/kiện). Tổng tải trọng hàng hóa không được vượt quá $120$ tấn. Bất phương trình nào sau đây mô tả đúng giới hạn trên?],
    (
        [$5x + 8y >= 120$],
        True([$5x + 8y <= 120$]),
        [$8x + 5y <= 120$],
        [$5x + 8y < 120$]
    ),
    loigiai: [
        #step([Thiết lập bất phương trình tải trọng])
        Tổng khối lượng hàng hóa là $5x + 8y$ (tấn), không quá $120$ tấn nên $5x + 8y <= 120$.
    ]
)

// TN 3: Điểm phương án khả thi trong kho lạnh tự động
#tn([Miền nghiệm của hệ kiểm soát nhiệt độ kho lạnh AGV là $cases(2x + y <= 28, x + 2y <= 26, x >= 0, y >= 0)$. Cặp giá trị phương án nào sau đây *không* thuộc miền nghiệm?],
    (
        [$(6; 8)$],
        [$(8; 6)$],
        [$(10; 4)$],
        True([$(10; 9)$])
    ),
    loigiai: [
        #step([Kiểm tra phương án vi phạm])
        Thay $(10; 9)$ vào hệ: $2(10) + 9 = 29 > 28$ (vi phạm). Vậy $(10; 9)$ không thuộc miền nghiệm.
    ]
)

// TN 4: Nửa mặt phẳng băng thông cáp quang biển quốc tế
#tn([Băng thông kết nối hai tuyến cáp quang biển APG ($x$ Gbps) và AAE-1 ($y$ Gbps) thỏa mãn $4x + 5y <= 200$. Cặp dung lượng nào sau đây nằm trong giới hạn an toàn?],
    (
        [$(35; 15)$],
        [$(30; 18)$],
        True([$(25; 18)$]),
        [$(40; 10)$]
    ),
    loigiai: [
        #step([Thử giá trị băng thông])
        Tại $(25; 18)$: $4(25) + 5(18) = 100 + 90 = 190 <= 200$ (thỏa mãn an toàn).
    ]
)

// TN 5: Tọa độ giao điểm cân bằng luồng gió giải nhiệt
#tn([Trong hệ thống làm mát trung tâm dữ liệu, hai đường biên áp suất luồng khí lạnh là $d_1: 3x + 2y = 36$ và $d_2: x + 4y = 32$. Tọa độ giao điểm của hai đường biên này là:],
    (
        [$(6; 7)$],
        True([$(8; 6)$]),
        [$(7; 6)$],
        [$(8; 5)$]
    ),
    loigiai: [
        #step([Giải hệ phương trình áp suất biên])
        $ cases(3x + 2y = 36, x + 4y = 32) <=> cases(3(32 - 4y) + 2y = 36, x = 32 - 4y) <=> cases(-10y = -60, x = 32 - 4y) <=> cases(y = 6, x = 8) $. Giao điểm là $(8; 6)$.
    ]
)

// TN 6: Hệ bất phương trình 3 công đoạn robot xếp dỡ container
#tn([Một cảng cạn ICD sử dụng robot gắp container loại tự hành ($x$ chiếc) và cẩu trục giàn ($y$ chiếc) qua 3 khu vực: bãi tập kết, bãi soi chiếu an ninh, và bãi xếp dỡ tàu hỏa. Định mức thời gian tối đa của ba bãi lần lượt là $30$ giờ, $24$ giờ, $20$ giờ. Mỗi robot tự hành cần $3" h"$ bãi tập kết, $1" h"$ soi chiếu, $1" h"$ xếp dỡ; mỗi cẩu trục cần $1" h"$ bãi tập kết, $2" h"$ soi chiếu, $1" h"$ xếp dỡ. Hệ bất phương trình mô tả số thiết bị vận hành là:],
    (
        [$cases(3x + y <= 30, x + 2y <= 24, x >= 0, y >= 0)$],
        True([$cases(3x + y <= 30, x + 2y <= 24, x + y <= 20, x >= 0, y >= 0)$]),
        [$cases(x + 3y <= 30, 2x + y <= 24, x + y <= 20, x >= 0, y >= 0)$],
        [$cases(3x + y <= 30, x + 2y <= 24, x + y <= 20)$]
    ),
    loigiai: [
        #step([Lập bảng ma trận 3 khu vực cảng cạn ICD])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Khu vực cảng], [Robot tự hành ($x$)], [Cẩu trục ($y$)], [Quỹ thời gian tối đa],
          [Bãi tập kết], [$3" h"$], [$1" h"$], [$30" h"$],
          [Soi chiếu an ninh], [$1" h"$], [$2" h"$], [$24" h"$],
          [Xếp dỡ tàu hỏa], [$1" h"$], [$1" h"$], [$20" h"$]
        )
        ]
        Hệ bất phương trình: $cases(3x + y <= 30, x + 2y <= 24, x + y <= 20, x >= 0, y >= 0)$.
    ]
)

// TN 7: Doanh thu tối đa của đội xe tải đông lạnh
#tn([Miền nghiệm của bài toán điều vận xe đông lạnh là tam giác $O A B$ với $O(0; 0), A(14; 0), B(8; 6)$. Giá trị lớn nhất của cước phí vận chuyển $F(x, y) = 30x + 40y$ (triệu đồng) trên miền nghiệm là:],
    (
        [$420$ triệu],
        True([$480$ triệu]),
        [$450$ triệu],
        [$500$ triệu]
    ),
    loigiai: [
        #step([Tính cước phí tại các đỉnh])
        $F(O) = 0$; $F(A) = 30(14) = 420$; $F(B) = 30(8) + 40(6) = 240 + 240 = 480$. Cước phí lớn nhất là $480$ triệu đồng tại $B(8; 6)$.
    ]
)

// TN 8: Điều kiện cân bằng tải cụm máy chủ đám mây
#tn([Trong hệ thống phân tán Kubernetes, số lượng pod xử lý backend ($x$) và pod xử lý frontend ($y$) phải thỏa mãn: số pod frontend không ít hơn một nửa số pod backend, đồng thời không vượt quá hai lần số pod backend. Hệ bất phương trình mô tả là:],
    (
        [$cases(x - 2y <= 0, 2x - y <= 0)$],
        True([$cases(x - 2y <= 0, 2x - y >= 0)$]),
        [$cases(2x - y >= 0, x - y <= 0)$],
        [$cases(x - 2y >= 0, 2x - y <= 0)$]
    ),
    loigiai: [
        #step([Phân tích bất phương trình tỷ lệ cân bằng])
        $1/2 x <= y <= 2x <=> cases(y >= 1/2 x, y <= 2x) <=> cases(x - 2y <= 0, 2x - y >= 0)$.
    ]
)

// TN 9: Tìm cực tiểu chi phí điện toán đám mây Cloud
#tn([Một công ty AI thuê hạ tầng đám mây gồm hai gói: Gói tính toán cơ bản ($x$ giờ, giá $20$ USD/h) và Gói tính toán tăng tốc ($y$ giờ, giá $30$ USD/h). Miền nghiệm có các đỉnh bờ $A(0; 10), B(4; 5), C(12; 0)$. Chi phí thuê đám mây thấp nhất là:],
    (
        [$240$ USD],
        True([$230$ USD]),
        [$300$ USD],
        [$250$ USD]
    ),
    loigiai: [
        #step([Tính chi phí tại các đỉnh bờ])
        $C(A) = 30(10) = 300$; $C(B) = 20(4) + 30(5) = 80 + 150 = 230$; $C(C) = 20(12) = 240$. Chi phí nhỏ nhất là $230$ USD tại $B(4; 5)$.
    ]
)

// TN 10: Rút gọn ngân sách bảo trì hệ thống cáp mạng
#tn([Trung tâm dữ liệu có ngân sách bảo trì tối đa $360$ triệu đồng cho cáp đồng ($x$ km, giá $12$ triệu/km) và cáp quang ($y$ km, giá $18$ triệu/km). Bất phương trình rút gọn là:],
    (
        [$2x + 3y >= 60$],
        True([$2x + 3y <= 60$]),
        [$3x + 2y <= 60$],
        [$2x + 3y <= 360$]
    ),
    loigiai: [
        #step([Rút gọn phương trình ngân sách])
        $12x + 18y <= 360 <=> 2x + 3y <= 60$ (chia cả hai vế cho $6$).
    ]
)

// TN 11: Phương trình đường mức thông lượng dữ liệu
#tn([Thông lượng dữ liệu toàn mạng là $Q(x, y) = 80x + 120y$ (TB/ngày). Phương trình đường mức tương ứng với thông lượng đạt $480$ TB là:],
    (
        [$3x + 2y = 12$],
        True([$2x + 3y = 12$]),
        [$2x + 3y = 24$],
        [$4x + 6y = 12$]
    ),
    loigiai: [
        #step([Rút gọn phương trình đường mức])
        $80x + 120y = 480 <=> 2x + 3y = 12$ (chia cả hai vế cho $40$).
    ]
)

// TN 12: Đánh giá phương án nguyên số container lạnh
#tn([Miền khả thi của kế hoạch xếp dỡ container lạnh có đỉnh lý thuyết cực đại $Q(5.2; 7.8)$. Với $x, y$ là số container nguyên ($x, y in NN^*$), điểm phương án nguyên khả thi tối ưu sát đỉnh $Q$ nhất là:],
    (
        [$(6; 8)$],
        True([$(5; 7)$]),
        [$(5; 8)$],
        [$(6; 7)$]
    ),
    loigiai: [
        #step([Đánh giá điểm nguyên])
        Điểm $(5; 7)$ nằm sát bên trong miền khả thi của đỉnh $Q(5.2; 7.8)$ nên luôn thỏa mãn và tối ưu.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

#pagebreak()

// DS 1: Cụm Siêu máy tính AI Data Center - 3 RÀNG BUỘC HẠ TẦNG CÔNG NGHỆ
#ds([Một trung tâm dữ liệu AI vận hành hai loại máy chủ: Cụm GPU ($x$ cụm, doanh thu $60$ triệu) và Cụm TPU ($y$ cụm, doanh thu $70$ triệu). Ba hạ tầng Data Center dùng chung: Điện nguồn (tối đa $22" MW"$), Làm mát Chiller (tối đa $22$ nghìn $"m"^3/"h"$), Băng thông quang (tối đa $14" Tbps"$). Mỗi cụm GPU cần $2" MW"$, $1$ nghìn $"m"^3/"h"$ làm mát, $1" Tbps"$ mạng. Mỗi cụm TPU cần $1" MW"$, $2$ nghìn $"m"^3/"h"$ làm mát, $1" Tbps"$ mạng. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc cả 3 tài nguyên hạ tầng là $cases(2x + y <= 22, x + 2y <= 22, x + y <= 14, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của bài toán là một hình ngũ giác lồi gồm 5 đỉnh $O(0; 0), A(11; 0), B(8; 6), C(6; 8), D(0; 11)$.]),
    True([Nếu trung tâm vận hành $8$ cụm GPU và $6$ cụm TPU thì doanh thu đạt được là $900$ triệu đồng/ngày.]),
    True([Doanh thu lớn nhất mà trung tâm dữ liệu đạt được là $920$ triệu đồng/ngày khi vận hành $6$ cụm GPU và $8$ cụm TPU.])
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập bảng 3 hạ tầng công nghệ và thiết lập hệ bất phương trình])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        inset: (x: 8pt, y: 1.5pt),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Hạ tầng Data Center], [Cụm GPU ($x$)], [Cụm TPU ($y$)], [Giới hạn tối đa],
        [Công suất điện], [$2" MW"$], [$1" MW"$], [$22" MW"$],
        [Làm mát Chiller], [$1" nghìn m"^3$], [$2" nghìn m"^3$], [$22" nghìn m"^3$],
        [Băng thông mạng], [$1" Tbps"$], [$1" Tbps"$], [$14" Tbps"$],
        [Doanh thu / ngày], [$60$ triệu], [$70$ triệu], [$F(x, y)$]
      )

      #v(2pt)
      *Hệ BPT 3 tài nguyên hạ tầng Data Center:*
      $ cases(
        2x + y <= 22 quad &(d_1),
        x + 2y <= 22 quad &(d_2),
        x + y <= 14 quad &(d_3),
        x >= 0, y >= 0
      ) $
      $=>$ *Mệnh đề a) là Đúng*.
    ]

    #step([Xác định tọa độ đỉnh miền nghiệm, tối ưu hóa và hình vẽ CeTZ])
    - Giao biên: $B(8; 6) = (d_1) inter (d_3)$, $C(6; 8) = (d_2) inter (d_3)$. Ngũ giác $O, A(11; 0), B, C, D(0; 11)$ $=>$ *Ý b) Đúng*.

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
          [Đỉnh $(x; y)$], [Tính giá trị $F(x, y)$], [Doanh thu (triệu)],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(11; 0)$], [$60(11)$], [$660$],
          [$B(8; 6)$], [$60(8) + 70(6)$], [$900$],
          [$C(6; 8)$], [$60(6) + 70(8)$], [$920$ (lớn nhất)],
          [$D(0; 11)$], [$70(11)$], [$770$]
        )
        #v(1pt)
        #text(size: 8.5pt)[- Phương án $(8; 6)$ thu $900$ triệu $=>$ *Ý c) Đúng*.        - Lớn nhất đạt $920$ triệu tại $C(6; 8)$ $=>$ *Ý d) Đúng*.]
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.18
          let xmax = 12.5
          let ymax = 12.5
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("d97706"))
          line((0, 0), (11 * sc, 0), (8 * sc, 6 * sc), (6 * sc, 8 * sc), (0, 11 * sc), close: true)
          
          line((5.5 * sc, 11 * sc), (12 * sc, -2 * sc), stroke: 1.1pt + rgb("d97706"))
          content((11.8 * sc, 1.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("d97706"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((-1 * sc, 11.5 * sc), (13 * sc, 4.5 * sc), stroke: 1.1pt + rgb("0284c7"))
          content((1.8 * sc, 12 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0284c7"), size: 6.5pt, weight: "bold")[$(d_2)$]])
          
          line((3 * sc, 11 * sc), (12 * sc, 2 * sc), stroke: 1.1pt + rgb("10b981"))
          content((9.2 * sc, 5.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("10b981"), size: 6.5pt, weight: "bold")[$(d_3)$]])
          
          line((6 * sc, 8 * sc), (6 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((6 * sc, 8 * sc), (0, 8 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-0.5 * sc, 0), ((xmax + 0.5) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 0.8) * sc, 0), [$x$])
          line((0, -0.5 * sc), (0, (ymax + 0.5) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 0.8) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((11 * sc, 0), radius: 2pt, fill: black)
          content((11 * sc, -0.25), [#text(size: 7pt, weight: "bold")[$A$]])
          circle((8 * sc, 6 * sc), radius: 2pt, fill: black)
          content((8 * sc + 0.35, 6 * sc + 0.15), [#text(size: 7pt, weight: "bold")[$B$]])
          circle((0, 11 * sc), radius: 2pt, fill: black)
          content((-0.28, 11 * sc), [#text(size: 7pt, weight: "bold")[$D$]])
          
          circle((6 * sc, 8 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((6 * sc + 0.75, 8 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$C(6; 8)$]])
        })
      ]
    )
    ]
  ]
)

#pagebreak()
// DS 2: Vận tải Hàng không Siêu trọng - 3 GIỚI HẠN VẬT LÝ & ĐIỀU KIỆN DẰN TRỌNG TÂM
#ds([Một máy bay vận tải hàng không chuyên chở: Kiện thiết bị cơ khí nặng ($x$ kiện, cước phí $40$ triệu/kiện) và Kiện hàng điện tử công nghệ ($y$ kiện, cước phí $50$ triệu/kiện). Mỗi kiện cơ khí nặng $2$ tấn, chiếm thể tích $1" m"^3$; mỗi kiện điện tử nặng $1$ tấn, chiếm thể tích $2" m"^3$. Khoang máy bay chịu tải cất cánh tối đa $26$ tấn, thể tích tối đa $20" m"^3$, và tải trọng sàn thân tối đa $14$ tấn (mỗi kiện loại nào cũng tính $1$ tấn sàn). Để cân bằng trọng tâm thân máy bay, số kiện điện tử không được vượt quá $2$ lần số kiện cơ khí. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc là $cases(2x + y <= 26, x + 2y <= 20, x + y <= 14, 2x - y >= 0, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của bài toán là một đa giác có các đỉnh $O(0; 0), A(13; 0), B(12; 2), C(8; 6), D(4; 8)$.]),
    False([Hãng bay nên chỉ vận chuyển kiện hàng điện tử để tối đa hóa cước phí vận chuyển.]),
    True([Cước phí vận chuyển lớn nhất đạt được là $620$ triệu đồng khi chở $8$ kiện thiết bị cơ khí và $6$ kiện hàng điện tử.])
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập bảng 3 chỉ tiêu khoang hàng không và thiết lập hệ bất phương trình])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        inset: (x: 8pt, y: 1.5pt),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Chỉ tiêu khoang], [Kiện cơ khí ($x$)], [Kiện điện tử ($y$)], [Giới hạn khoang],
        [Tải trọng cất cánh], [$2" tấn"$], [$1" tấn"$], [$26" tấn"$],
        [Thể tích chiếm chỗ], [$1" m"^3$], [$2" m"^3$], [$20" m"^3$],
        [Chịu lực sàn giữa], [$1" tấn"$], [$1" tấn"$], [$14" tấn"$],
        [Cước phí vận chuyển], [$40$ triệu], [$50$ triệu], [$F(x, y)$]
      )

      #v(2pt)
      *Hệ BPT khoang bay và điều kiện cân bằng $2x >= y$:*
      $ cases(
        2x + y <= 26 quad &(d_1),
        x + 2y <= 20 quad &(d_2),
        x + y <= 14 quad &(d_3),
        2x - y >= 0 quad &(Delta),
        x >= 0, y >= 0
      ) $
      $=>$ *Mệnh đề a) là Đúng*.
    ]

    #step([Xác định tọa độ đỉnh miền nghiệm, tối ưu hóa và hình vẽ CeTZ])
    - Giao biên: $B(12; 2) = (d_1) inter (d_3)$, $C(8; 6) = (d_2) inter (d_3)$, $D(4; 8) = (d_2) inter (Delta)$. Đa giác $O, A, B, C, D$ $=>$ *Ý b) Đúng*.

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
          [Đỉnh $(x; y)$], [Tính giá trị $F(x, y)$], [Cước phí (triệu)],
          [$A(13; 0)$], [$40(13)$], [$520$],
          [$B(12; 2)$], [$40(12) + 50(2)$], [$580$],
          [$C(8; 6)$], [$40(8) + 50(6)$], [$620$ (lớn nhất)],
          [$D(4; 8)$], [$40(4) + 50(8)$], [$560$]
        )
        #v(1pt)
        #text(size: 8.5pt)[- Vì $2x >= y$ nên không thể chỉ chở hàng điện tử $=>$ *Ý c) Sai*.        - Cước phí lớn nhất đạt $620$ triệu tại $C(8; 6)$ $=>$ *Ý d) Đúng*.]
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.18
          let xmax = 14.5
          let ymax = 11
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("d97706"))
          line((0, 0), (13 * sc, 0), (12 * sc, 2 * sc), (8 * sc, 6 * sc), (4 * sc, 8 * sc), close: true)
          
          line((7 * sc, 12 * sc), (14 * sc, -2 * sc), stroke: 1.1pt + rgb("d97706"))
          content((13.8 * sc, 1.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("d97706"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((-1 * sc, 10.5 * sc), (15 * sc, 2.5 * sc), stroke: 1.1pt + rgb("0284c7"))
          content((1.8 * sc, 10.5 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0284c7"), size: 6.5pt, weight: "bold")[$(d_2)$]])
          
          line((0, 0), (5.5 * sc, 11 * sc), stroke: 1.1pt + rgb("7c3aed"))
          content((4.2 * sc, 9.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("7c3aed"), size: 6.5pt, weight: "bold")[$(Delta)$]])
          
          line((8 * sc, 6 * sc), (8 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((8 * sc, 6 * sc), (0, 6 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-0.5 * sc, 0), ((xmax + 0.5) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 0.8) * sc, 0), [$x$])
          line((0, -0.5 * sc), (0, (ymax + 0.5) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 0.8) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((13 * sc, 0), radius: 2pt, fill: black)
          content((13 * sc, -0.25), [#text(size: 7pt, weight: "bold")[$A$]])
          circle((12 * sc, 2 * sc), radius: 2pt, fill: black)
          content((12 * sc + 0.35, 2 * sc + 0.15), [#text(size: 7pt, weight: "bold")[$B$]])
          circle((4 * sc, 8 * sc), radius: 2pt, fill: black)
          content((4 * sc - 0.28, 8 * sc + 0.2), [#text(size: 7pt, weight: "bold")[$D$]])
          
          circle((8 * sc, 6 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((8 * sc + 0.75, 6 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$C(8; 6)$]])
        })
      ]
    )
    ]
  ]
)

#pagebreak()
// DS 3: Hệ thống Kho lạnh thông minh Logistics - BÀI TOÁN CỰC TIỂU 3 TIÊU CHUẨN
#ds([Để duy trì kho lạnh bảo quản vắc xin và thủy sản xuất khẩu, trung tâm vận hành hai tổ máy: Cụm máy nén lạnh sâu Amoniac ($x$ giờ, chi phí $15$ triệu/giờ) và Bơm nhiệt biến tần CO2 ($y$ giờ, chi phí $20$ triệu/giờ). Ba yêu cầu công nghệ bắt buộc: trữ lạnh sâu $-25 degree$ C (ít nhất $18$ đơn vị), cấp đông nhanh (ít nhất $12$ đơn vị), và duy trì áp suất an toàn (ít nhất $23$ đơn vị). Mỗi giờ máy Amoniac cung cấp $2$ lạnh sâu, $1$ cấp đông, $1$ áp suất. Mỗi giờ máy CO2 cung cấp $1$ lạnh sâu, $1$ cấp đông, $3$ áp suất. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc 3 tiêu chuẩn kho lạnh là $cases(2x + y >= 18, x + y >= 12, x + 3y >= 23, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của bài toán là một miền đa giác mở không giới hạn có 4 đỉnh bờ gồm $A(0; 18), B(6; 6), C(7; 5), D(23; 0)$.]),
    True([Tại phương án chạy $6$ giờ máy Amoniac và $6$ giờ máy CO2, tổng chi phí là $210$ triệu đồng.]),
    True([Phương án vận hành tối ưu có chi phí thấp nhất là $205$ triệu đồng khi sử dụng $7$ giờ máy Amoniac và $5$ giờ máy CO2.])
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập bảng 3 tiêu chuẩn kho lạnh và thiết lập hệ bất phương trình])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        inset: (x: 8pt, y: 1.5pt),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Tiêu chuẩn kỹ thuật], [Máy Amoniac ($x$)], [Máy CO2 ($y$)], [Định mức tối thiểu],
        [Trữ lạnh sâu], [$2$ đơn vị], [$1$ đơn vị], [Ít nhất $18$],
        [Cấp đông nhanh], [$1$ đơn vị], [$1$ đơn vị], [Ít nhất $12$],
        [Áp suất an toàn], [$1$ đơn vị], [$3$ đơn vị], [Ít nhất $23$],
        [Đơn giá / giờ], [$15$ triệu], [$20$ triệu], [$C(x, y)$]
      )

      #v(2pt)
      *Hệ BPT 3 tiêu chuẩn kho lạnh:*
      $ cases(
        2x + y >= 18 quad &(d_1),
        x + y >= 12 quad &(d_2),
        x + 3y >= 23 quad &(d_3),
        x >= 0, y >= 0
      ) $
      $=>$ *Mệnh đề a) là Đúng*.
    ]

    #step([Xác định tọa độ đỉnh bờ, tối ưu hóa chi phí và hình vẽ CeTZ])
    - Giao bờ: $B(6; 6) = (d_1) inter (d_2)$, $C(7; 5) = (d_2) inter (d_3)$. Các đỉnh bờ $A(0; 18), B, C, D(23; 0)$ $=>$ *Ý b) Đúng*.

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
          [$A(0; 18)$], [$20(18)$], [$360$],
          [$B(6; 6)$], [$15(6) + 20(6)$], [$210$],
          [$C(7; 5)$], [$15(7) + 20(5)$], [$205$ (thấp nhất)],
          [$D(23; 0)$], [$15(23)$], [$345$]
        )
        #v(1pt)
        #text(size: 8.5pt)[
          - Tại $(6; 6)$ chi phí là $210$ triệu $=>$ *Ý c) Đúng*.          - Chi phí cực tiểu đạt $205$ triệu tại $C(7; 5)$ $=>$ *Ý d) Đúng*.
        ]
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.17
          let xmax = 24
          let ymax = 19
          
          fill(rgb("eff6ff"))
          line((0, 19 * sc), (0, 18 * sc), (6 * sc, 6 * sc), (7 * sc, 5 * sc), (23 * sc, 0), (24 * sc, 0), (24 * sc, 19 * sc), close: true, stroke: none)
          
          line((-0.5 * sc, 19 * sc), (10 * sc, -2 * sc), stroke: 1.1pt + rgb("d97706"))
          content((10.2 * sc, 1.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("d97706"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((0, 12 * sc), (14 * sc, -2 * sc), stroke: 1.1pt + rgb("0284c7"))
          content((1.8 * sc, 11.5 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0284c7"), size: 6.5pt, weight: "bold")[$(d_2)$]])
          
          line((-1 * sc, 8 * sc), (24 * sc, -0.33 * sc), stroke: 1.1pt + rgb("10b981"))
          content((23 * sc, 2.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("10b981"), size: 6.5pt, weight: "bold")[$(d_3)$]])
          
          line((7 * sc, 5 * sc), (7 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((7 * sc, 5 * sc), (0, 5 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 1) * sc, 0), [$x$])
          line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 1) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((0, 18 * sc), radius: 2pt, fill: black)
          content((0.35, 18 * sc + 0.12), [#text(size: 7pt, weight: "bold")[$A$]])
          circle((6 * sc, 6 * sc), radius: 2pt, fill: black)
          content((6 * sc - 0.28, 6 * sc + 0.2), [#text(size: 7pt, weight: "bold")[$B$]])
          circle((23 * sc, 0), radius: 2pt, fill: black)
          content((23 * sc, -0.25), [#text(size: 7pt, weight: "bold")[$D$]])
          
          circle((7 * sc, 5 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((7 * sc + 0.85, 5 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$C(7; 5)$]])
        })
      ]
    )
    ]
  ]
)

#pagebreak()
// DS 4: Điều độ Điện toán Đám mây Cloud AI - 4 RÀNG BUỘC & LOẠI BỎ BIÊN DƯ
#ds([Một nền tảng Cloud AI phân bổ hai loại máy chủ ảo: Máy chủ GPU render 3D ($x$ máy, lợi nhuận $30$ USD/h) và Máy chủ CPU high-memory ($y$ máy, lợi nhuận $25$ USD/h). Mỗi máy GPU cần $1$ cổng mạng và $3" GB"$ RAM; mỗi máy CPU cần $1$ cổng mạng và $5" GB"$ RAM. Hạ tầng cung cấp tối đa $90$ cổng mạng và $340" GB"$ RAM. Để phục vụ hợp đồng doanh nghiệp, cần duy trì tối thiểu $20$ máy CPU. Đồng thời, số máy GPU phải đạt ít nhất gấp đôi số máy CPU để cân bằng tải. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc điều độ máy chủ ảo là $cases(x + y <= 90, 3x + 5y <= 340, y >= 20, x - 2y >= 0, x >= 0)$.]),
    True([Giao điểm của hai đường $x + y = 90$ và $3x + 5y = 340$ là điểm $(55; 35)$ nhưng vi phạm điều kiện tỷ lệ $x - 2y >= 0$.]),
    True([Miền nghiệm thực tế là một hình tam giác với các đỉnh $M_1(40; 20), M_2(70; 20), M_3(60; 30)$.]),
    True([Lợi nhuận lớn nhất mà nền tảng Cloud AI đạt được là $2600$ USD/h tại đỉnh $M_2(70; 20)$.])
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập bảng chỉ tiêu hạ tầng đám mây và hệ bất phương trình])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        inset: (x: 8pt, y: 1.5pt),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Chỉ tiêu kỹ thuật], [Máy GPU ($x$)], [Máy CPU ($y$)], [Định mức tối đa],
        [Cổng mạng], [$1$ cổng], [$1$ cổng], [$90$ cổng],
        [Dung lượng RAM], [$3" GB"$], [$5" GB"$], [$340" GB"$],
        [Cam kết tối thiểu], [Không], [$1$ máy], [Tối thiểu $20$],
        [Cân bằng tải], [$1$], [$-2$], [$x - 2y >= 0$],
        [Lợi nhuận / giờ], [$30$ USD], [$25$ USD], [$P(x, y)$]
      )

      #v(2pt)
      *Hệ BPT điều độ máy chủ ảo:*
      $ cases(
        x + y <= 90 quad &(d_1),
        3x + 5y <= 340 quad &(d_2),
        y >= 20 quad &(d_3),
        x - 2y >= 0 quad &(Delta),
        x >= 0
      ) $
      $=>$ *Mệnh đề a) là Đúng*.
    ]

    #step([Xác định tọa độ đỉnh tam giác, so sánh lợi nhuận và hình vẽ CeTZ])
    - Giao $(d_1), (d_2)$ là $(55; 35)$ vi phạm $x - 2y >= 0$ $=>$ *Ý b) Đúng*. Tam giác $M_1(40; 20), M_2(70; 20), M_3(60; 30)$ $=>$ *Ý c) Đúng*.

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
          [Đỉnh tam giác], [Tính $P(x, y)$], [Lợi nhuận (USD/h)],
          [$M_1(40; 20)$], [$30(40) + 25(20)$], [$1700$],
          [$M_3(60; 30)$], [$30(60) + 25(30)$], [$2550$],
          [$M_2(70; 20)$], [$30(70) + 25(20)$], [$2600$ (cực đại)]
        )
        #v(1pt)
        #text(size: 8.5pt)[- Lợi nhuận cực đại đạt $2600$ USD/h tại $M_2(70; 20)$ $=>$ *Ý d) Đúng*.]
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.042
          let xmax = 95
          let ymax = 48
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("d97706"))
          line((40 * sc, 20 * sc), (70 * sc, 20 * sc), (60 * sc, 30 * sc), close: true)
          
          line((20 * sc, 70 * sc), (95 * sc, -5 * sc), stroke: 1.1pt + rgb("d97706"))
          content((94 * sc, 2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("d97706"), size: 6.5pt, weight: "bold")[$(d_1)$]])
          
          line((0, 20 * sc), (90 * sc, 20 * sc), stroke: 1.1pt + rgb("0284c7"))
          content((10 * sc, 22 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("0284c7"), size: 6.5pt, weight: "bold")[$(d_3)$]])
          
          line((0, 0), (80 * sc, 40 * sc), stroke: 1.1pt + rgb("10b981"))
          content((50 * sc, 28 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("10b981"), size: 6.5pt, weight: "bold")[$(Delta)$]])
          
          line((70 * sc, 20 * sc), (70 * sc, 0), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          line((70 * sc, 20 * sc), (0, 20 * sc), stroke: (dash: "dashed", paint: rgb("94a3b8"), thickness: 0.5pt))
          
          line((-3 * sc, 0), ((xmax + 3) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content(((xmax + 5) * sc, 0), [$x$])
          line((0, -3 * sc), (0, (ymax + 3) * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          content((0, (ymax + 5) * sc), [$y$])
          content((-0.22, -0.22), [$O$])
          
          circle((40 * sc, 20 * sc), radius: 2pt, fill: black)
          content((40 * sc - 0.2, 20 * sc - 0.25), [#text(size: 6.5pt, weight: "bold")[$M_1$]])
          circle((60 * sc, 30 * sc), radius: 2pt, fill: black)
          content((60 * sc + 0.2, 30 * sc + 0.25), [#text(size: 6.5pt, weight: "bold")[$M_3$]])
          
          circle((70 * sc, 20 * sc), radius: 2.8pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((70 * sc + 0.75, 20 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$M_2$]])
        })
      ]
    )
    ]
  ]
)

#pagebreak()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1: Tối ưu cụm máy chủ ảo hóa VPS
#tln([Cho thuê hai gói VPS: Gói Standard ($x$ gói, giá $40$ USD) và Gói Pro ($y$ gói, giá $60$ USD). Hạ tầng gồm tối đa $32" Core"$ CPU và $72" GB"$ RAM. Mỗi gói Standard cần $1" Core"$, $2" GB"$ RAM; mỗi gói Pro cần $1" Core"$, $3" GB"$ RAM. Tìm doanh thu lớn nhất (đơn vị: USD) mỗi tháng.],
    [1440],
    loigiai: [
        #step([Lập bảng tài nguyên VPS đám mây])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [VPS Standard ($x$)], [VPS Pro ($y$)], [Tài nguyên tối đa],
          [CPU Core], [$1$], [$1$], [Tối đa $32" Core"$],
          [Bộ nhớ RAM], [$2" GB"$], [$3" GB"$], [Tối đa $72" GB"$],
          [Giá thuê (USD)], [$40$], [$60$], [$T(x, y) = 40x + 60y$]
        )
        ]
        Hệ bất phương trình: $cases(x + y <= 32, 2x + 3y <= 72, x >= 0, y >= 0, x, y in NN)$. Giao biên $B(24; 8)$. Doanh thu lớn nhất: $T(24, 8) = 40(24) + 60(8) = 1440$ USD.
    ]
)

// TLN 2: Điều vận máy bay không người lái giao hàng UAV
#tln([Đội drone vận hành hai dòng UAV: Drone cánh quạt ($x$ chiếc, chi phí $50$ nghìn/giờ) và Drone cánh bằng ($y$ chiếc, chi phí $70$ nghìn/giờ). Ca trực cần: ít nhất $16$ chiếc, số cánh bằng tối thiểu $5$ chiếc, và số lượng drone cánh quạt không ít hơn số drone cánh bằng. Tìm chi phí đội bay thấp nhất (đơn vị: nghìn đồng/giờ).],
    [900],
    loigiai: [
        #step([Lập bảng điều vận phi đội UAV])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Dòng drone], [Cánh quạt ($x$)], [Cánh bằng ($y$)], [Quy chuẩn],
          [Số lượng], [$1$], [$1$], [Ít nhất $16$ chiếc],
          [Điều kiện], [$x >= y$], [$y >= 5$], [Tối thiểu $5$ cánh bằng, $x >= y$],
          [Chi phí (nghìn)], [$50$], [$70$], [$C(x, y) = 50x + 70y$]
        )
        ]
        Hệ BPT: $cases(x + y >= 16, x - y >= 0, y >= 5)$. Chi phí thấp nhất là $900$ nghìn đồng tại $M_1(11; 5)$.
    ]
)

#pagebreak()

// TLN 3: Thời gian tính toán mô phỏng khí động học CFD trên siêu máy tính
#tln([Một viện thiết kế hàng không chạy mô phỏng CFD trên cụm CPU đa nhân ($x$ giờ) và cụm GPU siêu tốc ($y$ giờ). Mỗi giờ CPU tốn $60$ USD, tính được $20$ triệu mắt lưới; mỗi giờ GPU tốn $90$ USD, tính được $40$ triệu mắt lưới. Kinh phí phân bổ tối đa $540$ USD và tổng thời gian chạy không quá $8$ giờ. Tính số lượng mắt lưới lớn nhất (đơn vị: triệu mắt lưới) viện có thể mô phỏng.],
    [240],
    loigiai: [
        #step([Lập bảng chi phí siêu máy tính CFD])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Cụm tính toán], [Cụm CPU ($x$ giờ)], [Cụm GPU ($y$ giờ)], [Hạn mức dự án],
          [Chi phí (USD/giờ)], [$60$], [$90$], [Tối đa $540$ USD],
          [Thời gian chạy], [$1$], [$1$], [Tối đa $8$ giờ],
          [Mắt lưới (triệu)], [$20$], [$40$], [$N(x, y) = 20x + 40y$]
        )
        ]
        Hệ BPT: $cases(2x + 3y <= 18, x + y <= 8, x >= 0, y >= 0, x, y in NN)$.
        Giao điểm biên: $cases(2x + 3y = 18, x + y = 8) <=> cases(y = 2, x = 6)$.
        - Tại $(6; 2)$: $N = 20(6) + 40(2) = 120 + 80 = 200$ triệu.
        - Tại $(0; 6)$: $2(0) + 3(6) = 18 <= 18, 0 + 6 = 6 <= 8$. $N(0, 6) = 40(6) = 240$ triệu mắt lưới!
        - Tại $(8; 0)$: $N = 20(8) = 160$ triệu.
        Số mắt lưới lớn nhất là $240$ triệu mắt lưới khi chạy $6$ giờ GPU.
    ]
)

#pagebreak()

// TLN 4: Vận hành trạm sạc điện cao áp siêu nhanh cho xe tải điện
#tln([Một trạm sạc cao tốc vận hành trụ sạc Mega-Watt ($x$ trụ, công suất $350" kW"$) và trụ sạc nhanh Ultra ($y$ trụ, công suất $150" kW"$). Doanh thu dịch vụ thu được là $80$ nghìn đồng/giờ từ trụ Mega-Watt và $40$ nghìn đồng/giờ từ trụ Ultra. Trạm có tối đa $8$ trụ Mega-Watt, tối đa $12$ trụ Ultra, và tổng công suất lưới cấp không vượt quá $2400" kW"$. Tìm doanh thu dịch vụ lớn nhất (đơn vị: nghìn đồng/giờ).],
    [600],
    loigiai: [
        #step([Lập bảng thông số trạm sạc cao tốc])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Trụ sạc điện], [Trụ Mega-Watt ($x$)], [Trụ Ultra ($y$)], [Giới hạn lưới trạm],
          [Số lượng trụ], [$0 <= x <= 8$], [$0 <= y <= 12$], [Tối đa riêng từng loại],
          [Công suất (kW)], [$350$], [$150$], [Tối đa $2400" kW"$],
          [Doanh thu (nghìn/h)], [$80$], [$40$], [$R(x, y) = 80x + 40y$]
        )
        ]
        Tại $x = 8$: $7(8) + 3y <= 48 => 3y <= -8$ (không thỏa).
        Tại $x = 6$: $7(6) + 3y <= 48 => 3y <= 6 => y <= 2$. $R(6, 2) = 80(6) + 40(2) = 480 + 80 = 560$ nghìn.
        Tại $y = 12$: $7x + 3(12) <= 48 => 7x <= 12 => x <= 1$. $R(1, 12) = 80(1) + 40(12) = 560$ nghìn.
        Tại $x = 3$: $7(3) + 3y <= 48 => 3y <= 27 => y <= 9$. $R(3, 9) = 80(3) + 40(9) = 240 + 360 = 600$ nghìn.
        Doanh thu lớn nhất nguyên đạt $600$ nghìn đồng/giờ.
    ]
)

#pagebreak()

// TLN 5: Pha chế nhiên liệu phản lực sinh học hàng không SAF
#tln([Hãng hàng không phối trộn nhiên liệu sinh học hàng không bền vững SAF gồm: Nhiên liệu sinh học gốc dầu ăn thải UCO ($x$ nghìn lít, giá $28$ triệu/nghìn lít) và Nhiên liệu phản lực truyền thống Jet A-1 ($y$ nghìn lít, giá $20$ triệu/nghìn lít). Chuyến bay cần nạp ít nhất $70$ nghìn lít, lượng nhiên liệu truyền thống không quá $50$ nghìn lít, và tỷ lệ nhiên liệu sinh học UCO tối thiểu bằng một nửa nhiên liệu truyền thống. Chi phí nhiên liệu thấp nhất (đơn vị: triệu đồng) là bao nhiêu?],
    [1592],
    loigiai: [
        #step([Lập bảng phối trộn nhiên liệu hàng không])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Nhiên liệu], [Nhiên liệu SAF ($x$)], [Jet A-1 ($y$)], [Quy chuẩn hàng không],
          [Thể tích nạp], [$1$], [$1$], [Ít nhất $70$ nghìn lít],
          [Hạn mức Jet A-1], [Không hạn chế], [$y <= 50$], [Tối đa $50$ nghìn lít],
          [Tỷ lệ pha chế], [$2x - y >= 0$], [Quy chuẩn IATA], [SAF $>= 0.5$ Jet A-1],
          [Giá (triệu/nghìn lít)], [$28$], [$20$], [$C(x, y) = 28x + 20y$]
        )
        ]
        Hệ BPT: $cases(x + y >= 70, y <= 50, 2x - y >= 0, x >= 0, y >= 0)$.
        - Giao $x + y = 70$ và $y = 50$ là $A(20; 50)$. Kiểm tra $2(20) - 50 = -10 < 0$ (vi phạm!).
        - Giao $x + y = 70$ và $2x - y = 0$ là $B(70/3; 140/3) approx (23.33; 46.67)$.
          Thử $y = 140/3 approx 46.67 <= 50$ (thỏa mãn!).
        - Tại điểm nguyên lân cận $(24; 46)$: $24 + 46 = 70, 46 <= 50, 2(24) - 46 = 2 >= 0$.
          $C(24, 46) = 28(24) + 20(46) = 672 + 920 = 1592$ triệu.
        - Tại điểm $(25; 45)$: $C(25, 45) = 28(25) + 20(45) = 700 + 900 = 1600$ triệu.
        - Tại $y = 50$: $x >= 25$ ($2x >= y$). Tại $(25; 50)$: $C(25, 50) = 28(25) + 20(50) = 700 + 1000 = 1700$ triệu.
        - Tại đỉnh $y = 0$: $x = 70 => C(70, 0) = 28(70) = 1960$ triệu.
        Chi phí thấp nhất nguyên là $1592$ triệu đồng tại $(24; 46)$.
    ]
)

#pagebreak()

// TLN 6: Chế tạo Thiết bị Mạng 5G/6G Công nghiệp - 3 PHÂN XƯỞNG & ĐIỂM NGUYÊN TỐI ƯU
#tln([Một công ty viễn thông công nghiệp sản xuất hai dòng thiết bị mạng thế hệ mới: Trạm gốc viễn thông 5G mini ($x$ bộ) và Router định tuyến quang siêu tốc ($y$ bộ). Quá trình chế tạo trải qua 3 phân xưởng kỹ thuật cao:
- Phân xưởng Gia công bo mạch cao tần PCB: $1$ bộ trạm 5G cần $3$ giờ; $1$ bộ Router quang cần $2$ giờ.
- Phân xưởng Gắn chip FPGA và kiểm tra tín hiệu: $1$ bộ trạm 5G cần $1$ giờ; $1$ bộ Router quang cần $3$ giờ.
- Phân xưởng Đóng vỏ tản nhiệt nhôm định hình: $1$ bộ trạm 5G cần $2$ giờ; $1$ bộ Router quang cần $2$ giờ.
Mỗi tháng, quỹ thời gian tối đa của ba xưởng lần lượt là $48$ giờ (Bo mạch), $48$ giờ (Chip FPGA) và $38$ giờ (Vỏ tản nhiệt). Mỗi bộ trạm 5G mang lại tiền lãi $35$ triệu đồng, mỗi bộ Router quang mang lại tiền lãi $45$ triệu đồng.
Tìm số tiền lãi lớn nhất (đơn vị: triệu đồng) mà công ty có thể thu được trong tháng.],
    [805],
    loigiai: [
        #step([Lập bảng ma trận 3 phân xưởng sản xuất thiết bị mạng])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Công đoạn xưởng], [Trạm gốc 5G ($x$)], [Router quang ($y$)], [Quỹ thời gian tháng],
          [Gia công bo mạch PCB], [$3$ giờ], [$2$ giờ], [Tối đa $48$ giờ],
          [Gắn chip FPGA], [$1$ giờ], [$3$ giờ], [Tối đa $48$ giờ],
          [Vỏ tản nhiệt nhôm], [$2$ giờ], [$2$ giờ], [Tối đa $38$ giờ],
          [Tiền lãi (triệu đồng)], [$35$], [$45$], [$F(x, y) = 35x + 45y$]
        )
        ]

        #step([Thiết lập hệ bất phương trình ràng buộc])
        $ cases(
            3x + 2y <= 48 quad &(d_1),
            x + 3y <= 48 quad &(d_2),
            2x + 2y <= 38 <=> x + y <= 19 quad &(d_3),
            x >= 0,
            y >= 0
        ) $ với $x, y in NN$.

        #step([Tọa độ đỉnh, khảo sát điểm nguyên và minh họa CeTZ])
        #grid(
          columns: (1fr, auto),
          gutter: 10pt,
          align: horizon,
          [
            Giao $d_1, d_3$ là $M_1(10; 9)$. Giao $d_2, d_3$ là $M_2(4.5; 14.5)$.
            Miền nghiệm: $O(0; 0), A(16; 0), M_1(10; 9), M_2(4.5; 14.5), D(0; 16)$.
            Khảo sát các điểm nguyên lân cận $M_2(4.5; 14.5)$:
            - Điểm $(4; 14)$: $F = 35(4) + 45(14) = 140 + 630 = 770$ triệu.
            - Điểm $(5; 14)$: thỏa cả 3 điều kiện:
              $3(5) + 2(14) = 43 <= 48$;
              $5 + 3(14) = 47 <= 48$;
              $5 + 14 = 19 <= 19$.
              Tiền lãi: $F(5, 14) = 35(5) + 45(14) = 805$ triệu đồng!
            Vậy tiền lãi lớn nhất là $805$ triệu đồng khi sản xuất $5$ bộ trạm 5G và $14$ bộ Router quang.
          ],
          [
            #cetz.canvas({
                import cetz.draw: *
                set-style(stroke: 0.8pt)
                let sc = 0.16
                let xmax = 18
                let ymax = 18
                
                for x in range(0, 19) {
                  let xv = x * sc
                  line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
                }
                for y in range(0, 19) {
                  let yv = y * sc
                  line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
                }
                
                fill(rgb("eff6ff"))
                stroke(1.2pt + rgb("d97706"))
                line((0, 0), (16 * sc, 0), (10 * sc, 9 * sc), (4.5 * sc, 14.5 * sc), (0, 16 * sc), close: true)
                
                line((4 * sc, 18 * sc), (17 * sc, -1.5 * sc), stroke: 1.1pt + rgb("d97706"))
                line((-1 * sc, 16.33 * sc), (18 * sc, 10 * sc), stroke: 1.1pt + rgb("0284c7"))
                line((2 * sc, 17 * sc), (18 * sc, 1 * sc), stroke: 1.1pt + rgb("10b981"))
                
                line((5 * sc, 14 * sc), (5 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
                line((5 * sc, 14 * sc), (0, 14 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
                
                line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
                content(((xmax + 1) * sc, 0), [$x$])
                line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
                content((0, (ymax + 1) * sc), [$y$])
                content((-0.2, -0.2), [$O$])
                
                circle((0, 0), radius: 1.8pt, fill: black)
                circle((16 * sc, 0), radius: 2pt, fill: black)
                content((16 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
                circle((10 * sc, 9 * sc), radius: 2pt, fill: black)
                circle((0, 16 * sc), radius: 2pt, fill: black)
                content((0.22, 16 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$D$]])
                
                circle((5 * sc, 14 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
                content((5 * sc + 0.65, 14 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), weight: "bold", size: 7.5pt)[$(5; 14)$]])
            })
          ]
        )
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
