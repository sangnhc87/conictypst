#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// HÀM VẼ MIỀN NGHIỆM HỆ BẤT PHƯƠNG TRÌNH THUẬT TOÁN HÌNH HỌC
// ═══════════════════════════════════════════════════════════
#let draw_system_bpt(
  lines: (),
  vertices: (),
  xmin: -10,
  xmax: 60,
  ymin: -10,
  ymax: 60,
  scale: 0.1,
) = align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    
    let sx(x) = x * scale
    let sy(y) = y * scale
    
    // 1. Hệ trục tọa độ Oxy
    line((sx(xmin), 0), (sx(xmax) + 0.5, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
    content((sx(xmax) + 0.7, 0), [$x$])
    line((0, sy(ymin)), (0, sy(ymax) + 0.5), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
    content((0, sy(ymax) + 0.7), [$y$])
    content((-0.25, -0.25), [$O$])
    
    // 2. Tô màu miền nghiệm đa giác
    if vertices.len() >= 3 {
      let poly_pts = vertices.map(v => (sx(v.pt.at(0)), sy(v.pt.at(1))))
      fill(rgb("eff6ff"))
      stroke(none)
      line(..poly_pts, close: true)
    }
    
    // 3. Vẽ các đường thẳng biên
    for l in lines {
      let pts = l.pts.map(p => (sx(p.at(0)), sy(p.at(1))))
      line(..pts, stroke: 1.1pt + l.color)
      if l.name != none {
        content((sx(l.lbl_pos.at(0)), sy(l.lbl_pos.at(1))), text(fill: l.color, size: 8.5pt, weight: "bold")[#l.name])
      }
    }
    
    // 4. Vẽ và ghi nhãn các đỉnh
    for v in vertices {
      let px = sx(v.pt.at(0))
      let py = sy(v.pt.at(1))
      circle((px, py), radius: 2.3pt, fill: rgb("dc2626"), stroke: 0.5pt + white)
      if v.label != none {
        content((px + v.offset.at(0), py + v.offset.at(1)), box(fill: white, inset: 1pt)[#text(fill: rgb("991b1b"), size: 8.5pt, weight: "bold")[#v.label]])
      }
    }
  })
]

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 2",
  exam-title: "BÀI 4: QUY HOẠCH TUYẾN TÍNH & TOÁN THỰC TẾ (ĐỀ SỐ 1 - CƠ KHÍ & SẢN XUẤT)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "104",
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

// TN 1: Nhận diện biến số nguyên không âm
#tn([Một xưởng cơ khí dự định sản xuất $x$ chi tiết máy loại $A$ và $y$ chi tiết máy loại $B$. Điều kiện thực tế của hai biến số $x$ và $y$ là:],
    (
        [$x > 0, y > 0$],
        [$x in RR, y in RR$],
        True([$x >= 0, y >= 0$ và $x, y in NN$]),
        [$x + y <= 100$]
    ),
    loigiai: [
        #step([Lập bảng phân tích đại lượng])
        #align(center)[
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đại lượng], [Ký hiệu], [Ý nghĩa thực tế],
          [Chi tiết máy loại $A$], [$x$], [Số lượng sản phẩm, phải là số tự nhiên ($x in NN, x >= 0$)],
          [Chi tiết máy loại $B$], [$y$], [Số lượng sản phẩm, phải là số tự nhiên ($y in NN, y >= 0$)]
        )
        ]
        Vì số lượng sản phẩm không thể âm và không thể là số lẻ thập phân nên điều kiện chuẩn là $x, y in NN$ và $x >= 0, y >= 0$.
    ]
)

// TN 2: Bất phương trình vải may
#tn([Để may một chiếc áo sơ mi cần $1.2" m"$ vải và để may một chiếc quần âu cần $1.5" m"$ vải. Một xưởng may có sẵn $120" m"$ vải. Gọi $x, y$ lần lượt là số áo sơ mi và quần âu xưởng may. Bất phương trình mô tả ràng buộc về số lượng vải khả dụng là:],
    (
        [$1.5x + 1.2y <= 120$],
        True([$1.2x + 1.5y <= 120$]),
        [$1.2x + 1.5y >= 120$],
        [$x + y <= 120$]
    ),
    loigiai: [
        #step([Lập bảng tóm tắt số liệu])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Tài nguyên], [Áo sơ mi ($x$ chiếc)], [Quần âu ($y$ chiếc)], [Khả dụng tối đa],
          [Vải (mét)], [$1.2$], [$1.5$], [$120" m"$]
        )
        ]
        Tổng số mét vải dùng để may $x$ áo sơ mi và $y$ quần âu là $1.2x + 1.5y$.
        Vì số mét vải không vượt quá $120" m"$ nên ta có bất phương trình: $1.2x + 1.5y <= 120$.
    ]
)

// TN 3: Xưởng mộc làm nguội
#tn([Một xưởng mộc sản xuất $x$ chiếc bàn và $y$ chiếc ghế. Để làm nguội $1$ chiếc bàn cần $4$ giờ, làm nguội $1$ chiếc ghế cần $2$ giờ. Mỗi ngày xưởng có tối đa $40$ giờ làm nguội. Bất phương trình rút gọn nào sau đây biểu diễn lượng thời gian làm nguội?],
    (
        [$x + 2y <= 20$],
        True([$2x + y <= 20$]),
        [$4x + 2y >= 40$],
        [$2x + y >= 20$]
    ),
    loigiai: [
        #step([Lập bảng tóm tắt số liệu])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Nguồn lực], [Bàn ($x$ cái)], [Ghế ($y$ cái)], [Giới hạn trong ngày],
          [Giờ làm nguội], [$4$], [$2$], [Tối đa $40$ giờ]
        )
        ]
        Từ bảng trên, ta có bất phương trình: $4x + 2y <= 40 <=> 2x + y <= 20$.
    ]
)

// TN 4: Hàm mục tiêu lợi nhuận quạt điện
#tn([Một cơ sở lắp ráp quạt điện sản xuất hai dòng sản phẩm: quạt cây (lãi $60$ nghìn đồng/chiếc) và quạt treo tường (lãi $45$ nghìn đồng/chiếc). Gọi $x, y$ lần lượt là số quạt cây và quạt treo tường được lắp ráp. Biểu thức tính tổng tiền lãi $F(x, y)$ (đơn vị: nghìn đồng) là:],
    (
        [$F(x, y) = 45x + 60y$],
        [$F(x, y) = 60x - 45y$],
        True([$F(x, y) = 60x + 45y$]),
        [$F(x, y) = 105(x + y)$]
    ),
    loigiai: [
        #step([Lập bảng đơn giá lợi nhuận])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Quạt cây ($x$)], [Quạt treo tường ($y$)], [Tổng tiền lãi $F(x, y)$],
          [Tiền lãi (nghìn đồng/chiếc)], [$60$], [$45$], [$60 dot x + 45 dot y$]
        )
        ]
        Tổng tiền lãi thu được từ $x$ quạt cây và $y$ quạt treo tường là: $F(x, y) = 60x + 45y$ (nghìn đồng).
    ]
)

// TN 5: Sản xuất bánh đậu xanh
#tn([Một xưởng bánh kẹo sản xuất hai loại hộp bánh đậu xanh: loại thường $A$ và loại cao cấp $B$. Để sản xuất 1 hộp loại $A$ cần $0.2" kg"$ đường và $0.3" kg"$ đậu xanh; 1 hộp loại $B$ cần $0.25" kg"$ đường và $0.4" kg"$ đậu xanh. Kho xưởng hiện có $50" kg"$ đường và $70" kg"$ đậu xanh. Hệ bất phương trình ràng buộc là:],
    (
        [$cases(0.2x + 0.3y <= 50, 0.25x + 0.4y <= 70, x >= 0, y >= 0)$],
        True([$cases(0.2x + 0.25y <= 50, 0.3x + 0.4y <= 70, x >= 0, y >= 0)$]),
        [$cases(0.2x + 0.25y >= 50, 0.3x + 0.4y >= 70, x >= 0, y >= 0)$],
        [$cases(0.3x + 0.2y <= 50, 0.4x + 0.25y <= 70, x >= 0, y >= 0)$]
    ),
    loigiai: [
        #step([Lập bảng ma trận nguyên liệu])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Nguyên liệu], [Loại A ($x$ hộp)], [Loại B ($y$ hộp)], [Tồn kho tối đa],
          [Đường (kg)], [$0.2$], [$0.25$], [$50" kg"$],
          [Đậu xanh (kg)], [$0.3$], [$0.4$], [$70" kg"$]
        )
        ]
        Mỗi hàng ngang của bảng cho ta một bất phương trình:
        - Hàng Đường: $0.2x + 0.25y <= 50$.
        - Hàng Đậu xanh: $0.3x + 0.4y <= 70$.
        Cùng với điều kiện sản lượng $x >= 0, y >= 0$.
    ]
)

// TN 6: Ràng buộc xưởng in
#tn([Một xưởng in sử dụng hai dòng máy in $X$ và $Y$. Mỗi ngày máy $X$ in được $20$ ram giấy, máy $Y$ in được $30$ ram giấy. Để hoàn thành đơn hàng tối thiểu $180$ ram giấy trong ngày, hệ thức nào sau đây đúng với số máy $x$ và $y$ được vận hành?],
    (
        [$20x + 30y <= 180$],
        True([$2x + 3y >= 18$]),
        [$2x + 3y <= 18$],
        [$3x + 2y >= 18$]
    ),
    loigiai: [
        #step([Lập bảng công suất in])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Máy X ($x$ máy)], [Máy Y ($y$ máy)], [Yêu cầu đơn hàng],
          [Năng suất (ram/ngày)], [$20$], [$30$], [Tối thiểu $180$ ram]
        )
        ]
        Tổng sản lượng: $20x + 30y >= 180 <=> 2x + 3y >= 18$.
    ]
)

// TN 7: Pha chế sơn tường
#tn([Một cơ sở pha chế sơn cần sản xuất hai loại sơn tường: sơn trắng sứ ($x$ thùng) và sơn ghi xám ($y$ thùng). Để pha $1$ thùng sơn trắng sứ cần $3" kg"$ bột màu trắng; $1$ thùng sơn ghi xám cần $2" kg"$ bột màu trắng và $1" kg"$ bột màu đen. Lượng bột màu trắng dự trữ tối đa là $60" kg"$. Bất phương trình nào thể hiện giới hạn bột màu trắng?],
    (
        [$3x + y <= 60$],
        [$2x + 3y <= 60$],
        True([$3x + 2y <= 60$]),
        [$3x + 2y >= 60$]
    ),
    loigiai: [
        #step([Lập bảng tiêu hao bột màu])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Nguyên liệu], [Sơn trắng sứ ($x$)], [Sơn ghi xám ($y$)], [Dự trữ tối đa],
          [Bột màu trắng (kg)], [$3$], [$2$], [$60" kg"$]
        )
        ]
        Tổng lượng bột màu trắng sử dụng là $3x + 2y <= 60$.
    ]
)

// TN 8: Lò nung gốm sứ
#tn([Một nghệ nhân gốm nung đĩa sứ ($x$ chiếc) và bát sứ ($y$ chiếc). Thời gian tạo hình cho 1 chiếc đĩa là $15$ phút, 1 chiếc bát là $10$ phút. Tổng thời gian tạo hình trong ngày không quá $300$ phút ($5$ giờ). Bất phương trình rút gọn là:],
    (
        [$2x + 3y <= 60$],
        True([$3x + 2y <= 60$]),
        [$3x + 2y >= 60$],
        [$15x + 10y <= 5$]
    ),
    loigiai: [
        #step([Lập bảng thời gian tạo hình])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Công đoạn], [Đĩa sứ ($x$)], [Bát sứ ($y$)], [Tổng thời gian tối đa],
          [Tạo hình (phút)], [$15$], [$10$], [Không quá $300$ phút]
        )
        ]
        Ta có: $15x + 10y <= 300 <=> 3x + 2y <= 60$.
    ]
)

// TN 9: GTLN trên tam giác
#tn([Một phân xưởng có miền phương án sản xuất là tam giác $O A B$ kể cả biên, với các đỉnh $O(0; 0), A(5; 0), B(0; 4)$. Hàm lợi nhuận là $F(x, y) = 20x + 30y$ (triệu đồng). Giá trị lớn nhất của lợi nhuận bằng bao nhiêu?],
    (
        [$100$ triệu đồng],
        True([$120$ triệu đồng]),
        [$110$ triệu đồng],
        [$150$ triệu đồng]
    ),
    loigiai: [
        #step([Lập bảng so sánh giá trị tại các đỉnh])
        #align(center)[
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Tính toán $F(x, y) = 20x + 30y$], [Giá trị (triệu đồng)],
          [$O(0; 0)$], [$20(0) + 30(0)$], [$0$],
          [$A(5; 0)$], [$20(5) + 30(0)$], [$100$],
          [$B(0; 4)$], [$20(0) + 30(4)$], [$120$]
        )
        ]
        Lợi nhuận lớn nhất là $120$ triệu đồng đạt được tại phương án sản xuất $B(0; 4)$.
    ]
)

// TN 10: GTLN trên tứ giác
#tn([Miền nghiệm của một bài toán sản xuất linh kiện là tứ giác $O A B C$ với tọa độ các đỉnh là $O(0; 0), A(4; 0), B(3; 2), C(0; 3)$. Hàm doanh thu là $R(x, y) = 50x + 40y$ (nghìn đồng). Doanh thu lớn nhất đạt được là:],
    (
        [$200$ nghìn đồng],
        [$120$ nghìn đồng],
        True([$230$ nghìn đồng]),
        [$250$ nghìn đồng]
    ),
    loigiai: [
        #step([Lập bảng tính doanh thu tại các đỉnh])
        #align(center)[
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Biểu thức $R(x, y) = 50x + 40y$], [Doanh thu (nghìn đồng)],
          [$O(0; 0)$], [$50(0) + 40(0)$], [$0$],
          [$A(4; 0)$], [$50(4) + 40(0)$], [$200$],
          [$B(3; 2)$], [$50(3) + 40(2) = 150 + 80$], [$230$],
          [$C(0; 3)$], [$50(0) + 40(3)$], [$120$]
        )
        ]
        Doanh thu lớn nhất là $230$ nghìn đồng khi sản xuất $3$ sản phẩm loại 1 và $2$ sản phẩm loại 2.
    ]
)

// TN 11: Số phương án sản xuất nguyên dương
#tn([Một xưởng gia công mỹ nghệ nhận sản xuất $x$ tượng đồng nhỏ và $y$ tượng đồng lớn thỏa mãn các ràng buộc: $x + y <= 5, x >= 2, y >= 1$ ($x, y in NN$). Xưởng có tất cả bao nhiêu phương án sản xuất kết hợp?],
    (
        [$3$],
        [$4$],
        [$5$],
        True([$6$])
    ),
    loigiai: [
        #step([Lập bảng liệt kê các phương án nguyên])
        Từ $y >= 1$ và $x + y <= 5 => x <= 5 - y <= 4$. Vì $x >= 2$ nên $x in {2; 3; 4}$.
        #align(center)[
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Giá trị của $x$], [Điều kiện của $y$ ($1 <= y <= 5 - x$)], [Các cặp nghiệm $(x; y)$],
          [$x = 2$], [$1 <= y <= 3$], [$(2; 1), (2; 2), (2; 3)$ (3 cặp)],
          [$x = 3$], [$1 <= y <= 2$], [$(3; 1), (3; 2)$ (2 cặp)],
          [$x = 4$], [$1 <= y <= 1$], [$(4; 1)$ (1 cặp)]
        )
        ]
        Tổng số phương án kết hợp là $3 + 2 + 1 = 6$ cặp. (Nếu chỉ xét $x + y = 5$ thì có 3 cặp $(2; 3), (3; 2), (4; 1)$). Vì đề hỏi thỏa mãn hệ $x+y <= 5$ nên số cặp là 6.
    ]
)

// TN 12: Chi phí mua nguyên vật liệu tối thiểu
#tn([Để đảm bảo chỉ tiêu kĩ thuật, một nhà máy cần bổ sung ít nhất $12" kg"$ phụ gia $A$ và $8" kg"$ phụ gia $B$. Công ty có thể mua bao loại I (chứa $3" kg" A, 1" kg" B$, giá $100$ nghìn) và bao loại II (chứa $2" kg" A, 2" kg" B$, giá $120$ nghìn). Gọi $x, y$ là số bao loại I và II. Hàm chi phí cần tối thiểu hóa là:],
    (
        [$F(x, y) = 3x + 2y$],
        [$F(x, y) = 12x + 8y$],
        True([$F(x, y) = 100x + 120y$]),
        [$F(x, y) = 120x + 100y$]
    ),
    loigiai: [
        #step([Lập bảng chi phí mua vật tư])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Bao loại I ($x$ bao)], [Bao loại II ($y$ bao)], [Tổng chi phí],
          [Đơn giá (nghìn đồng)], [$100$], [$120$], [$F(x, y) = 100x + 120y$]
        )
        ]
        Hàm chi phí cần làm nhỏ nhất là $F(x, y) = 100x + 120y$ (nghìn đồng).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

#pagebreak()

// DS 1: Xưởng may áo phông và áo sơ mi
#ds([Một xưởng may gia công hai loại sản phẩm: áo phông và áo sơ mi. Để may 1 chiếc áo phông cần $1.5" m"$ vải và $1$ giờ công, mang lại tiền lãi $30$ nghìn đồng. Để may 1 chiếc áo sơ mi cần $2" m"$ vải và $2$ giờ công, mang lại tiền lãi $50$ nghìn đồng. Trong một tuần, xưởng có tối đa $120" m"$ vải và $100$ giờ công may. Gọi $x, y$ lần lượt là số áo phông và áo sơ mi xưởng may trong tuần. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc về nguyên liệu vải và thời gian may là $cases(1.5x + 2y <= 120, x + 2y <= 100, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của hệ bất phương trình là một hình tứ giác có các đỉnh là $O(0; 0), A(80; 0), B(40; 30), C(0; 50)$.]),
    True([Lợi nhuận lớn nhất của xưởng may đạt được khi sản xuất $40$ chiếc áo phông và $30$ chiếc áo sơ mi.]),
    True([Số tiền lãi lớn nhất mà xưởng có thể thu được trong tuần là $2.700.000$ đồng.])
  ),
  loigiai: [
    #step([Lập bảng tóm tắt số liệu])
    #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      align: center + horizon,
      stroke: 0.5pt + rgb("cbd5e1"),
      fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
      [Nguồn lực / Lợi nhuận], [Áo phông ($x$ chiếc)], [Áo sơ mi ($y$ chiếc)], [Giới hạn tuần],
      [Vải (mét)], [$1.5$], [$2$], [Tối đa $120" m"$],
      [Thời gian may (giờ)], [$1$], [$2$], [Tối đa $100$ giờ],
      [Tiền lãi (nghìn đồng)], [$30$], [$50$], [$F(x, y) = 30x + 50y$]
    )
    ]
    Hệ BPT: $cases(1.5x + 2y <= 120, x + 2y <= 100, x >= 0, y >= 0)$ (Ý a Đúng).

    #step([Tọa độ đỉnh và minh họa miền nghiệm hình học])
    #grid(
      columns: (1fr, auto),
      gutter: 10pt,
      align: horizon,
      [
        Giao điểm biên: $cases(1.5x + 2y = 120, x + 2y = 100) <=> cases(x = 40, y = 30) => B(40; 30)$.
        Miền nghiệm tứ giác $O A B C$:
        $O(0; 0), A(80; 0), B(40; 30), C(0; 50)$ (Ý b Đúng).

        #v(3pt)
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Tính $F(x, y)$], [Tiền lãi],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(80; 0)$], [$30(80)$], [$2400$],
          [$B(40; 30)$], [$30(40) + 50(30)$], [$2700$],
          [$C(0; 50)$], [$50(50)$], [$2500$]
        )
        Lãi lớn nhất tại $B(40; 30)$ là $2.700.000$ đ. (Ý c, d Đúng)
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.028
          let xmax = 95
          let ymax = 65
          
          for x in range(0, 10) {
            let xv = x * 10 * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 7) {
            let yv = y * 10 * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (80 * sc, 0), (40 * sc, 30 * sc), (0, 50 * sc), close: true)
          
          line((15 * sc, 48.75 * sc), (86 * sc, -4.5 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((20 * sc, 50 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$1.5x + 2y = 120$]])
          
          line((-6 * sc, 53 * sc), (92 * sc, 4 * sc), stroke: 1.1pt + rgb("059669"))
          content((76 * sc, 13 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$x + 2y = 100$]])
          
          line((40 * sc, 30 * sc), (40 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((40 * sc, 30 * sc), (0, 30 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-6 * sc, 0), ((xmax + 6) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 8) * sc, 0), [$x$])
          line((0, -6 * sc), (0, (ymax + 6) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 8) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((40 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$40$]])
          content((80 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$80$]])
          content((-0.26, 30 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$30$]])
          content((-0.26, 50 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$50$]])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((80 * sc, 0), radius: 2pt, fill: black)
          content((80 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
          circle((0, 50 * sc), radius: 2pt, fill: black)
          content((0.22, 50 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
          
          circle((40 * sc, 30 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((40 * sc + 0.55, 30 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(40; 30)$]])
        })
      ]
    )
  ]
)

#pagebreak()

// DS 2: Xưởng mộc đóng bàn làm việc và giá sách
#ds([Một xưởng mộc sản xuất hai mặt hàng: bàn làm việc và giá sách. Để sản xuất $1$ chiếc bàn cần $3" m"^2$ gỗ và $6$ giờ công thợ mộc, lãi $400$ nghìn đồng. Để sản xuất $1$ chiếc giá sách cần $2" m"^2$ gỗ và $3$ giờ công thợ mộc, lãi $250$ nghìn đồng. Mỗi ngày xưởng có tối đa $18" m"^2$ gỗ và $30$ giờ công thợ mộc. Gọi $x, y$ lần lượt là số bàn và giá sách sản xuất trong ngày. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Bất phương trình biểu diễn giới hạn về diện tích gỗ là $3x + 2y <= 18$.]),
    False([Bất phương trình biểu diễn giới hạn về giờ công thợ mộc rút gọn là $x + 2y <= 10$.]),
    True([Miền nghiệm của bài toán là một hình tứ giác có đỉnh là giao điểm của hai đường giới hạn tại $B(2; 6)$.]),
    True([Số tiền lãi lớn nhất xưởng mộc thu được trong ngày là $2.300.000$ đồng.])
  ),
  loigiai: [
    #step([Lập bảng tóm tắt số liệu])
    #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      align: center + horizon,
      stroke: 0.5pt + rgb("cbd5e1"),
      fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
      [Yếu tố sản xuất], [Bàn ($x$ chiếc)], [Giá sách ($y$ chiếc)], [Giới hạn trong ngày],
      [Gỗ ($"m"^2$)], [$3$], [$2$], [Tối đa $18" m"^2$],
      [Giờ thợ mộc (giờ)], [$6$], [$3$], [Tối đa $30$ giờ],
      [Tiền lãi (nghìn đồng)], [$400$], [$250$], [$F(x, y) = 400x + 250y$]
    )
    ]
    - BPT gỗ: $3x + 2y <= 18$ (Ý a Đúng).
    - BPT giờ thợ: $6x + 3y <= 30 <=> 2x + y <= 10$ (Ý b Sai).

    #step([Tọa độ đỉnh và minh họa miền nghiệm hình học])
    #grid(
      columns: (1fr, auto),
      gutter: 10pt,
      align: horizon,
      [
        Giao điểm hai đường biên:
        $ cases(3x + 2y = 18, 2x + y = 10) <=> cases(x = 2, y = 6) => B(2; 6) $
        Miền nghiệm là tứ giác $O A B C$ với:
        $O(0; 0), A(5; 0), B(2; 6), C(0; 9)$ (Ý c Đúng).

        #v(3pt)
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh], [Tính toán $F(x, y)$], [Tiền lãi],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(5; 0)$], [$400(5)$], [$2000$],
          [$B(2; 6)$], [$400(2) + 250(6)$], [$2300$],
          [$C(0; 9)$], [$250(9)$], [$2250$]
        )
        Lãi lớn nhất tại $B(2; 6)$ là $2.300.000$ đ. (Ý d Đúng)
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.28
          let xmax = 7.5
          let ymax = 11
          
          for x in range(0, 8) {
            let xv = x * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 12) {
            let yv = y * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (5 * sc, 0), (2 * sc, 6 * sc), (0, 9 * sc), close: true)
          
          line((-0.5 * sc, 9.75 * sc), (6.5 * sc, -0.75 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((4.8 * sc, 4.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 7pt, weight: "bold")[$3x + 2y = 18$]])
          
          line((-0.5 * sc, 11 * sc), (5.5 * sc, -1 * sc), stroke: 1.1pt + rgb("059669"))
          content((1.2 * sc, 9.5 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 7pt, weight: "bold")[$2x + y = 10$]])
          
          line((2 * sc, 6 * sc), (2 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((2 * sc, 6 * sc), (0, 6 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 1) * sc, 0), [$x$])
          line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 1) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((2 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7.5pt)[$2$]])
          content((5 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7.5pt)[$5$]])
          content((-0.26, 6 * sc), box(fill: white, inset: 1pt)[#text(size: 7.5pt)[$6$]])
          content((-0.26, 9 * sc), box(fill: white, inset: 1pt)[#text(size: 7.5pt)[$9$]])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((5 * sc, 0), radius: 2pt, fill: black)
          content((5 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7.5pt, weight: "bold")[$A$]])
          circle((0, 9 * sc), radius: 2pt, fill: black)
          content((0.22, 9 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7.5pt, weight: "bold")[$C$]])
          
          circle((2 * sc, 6 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((2 * sc + 0.55, 6 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$B(2; 6)$]])
        })
      ]
    )
  ]
)

#pagebreak()

// DS 3: Câu 15 xưởng cơ khí theo đúng yêu cầu user
#ds([Một xưởng cơ khí sản xuất hai loại chi tiết máy $A$ và $B$. Để sản xuất $1$ chi tiết $A$ cần dùng máy tiện trong $2$ giờ và máy phay trong $1$ giờ, mang lại tiền lãi $40$ nghìn đồng. Để sản xuất $1$ chi tiết $B$ cần dùng máy tiện trong $1$ giờ và máy phay trong $3$ giờ, mang lại tiền lãi $50$ nghìn đồng. Mỗi tuần máy tiện làm việc tối đa $80$ giờ và máy phay làm việc tối đa $90$ giờ. Gọi $x, y$ lần lượt là số chi tiết máy loại $A$ và $B$ xưởng sản xuất trong một tuần. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc về thời gian làm việc của máy tiện và máy phay là $cases(2x + y <= 80, x + 3y <= 90, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của hệ bất phương trình là một hình tứ giác có các đỉnh là $O(0; 0), A(40; 0), B(30; 20), C(0; 30)$.]),
    True([Để đạt tiền lãi cao nhất, xưởng cơ khí cần sản xuất $30$ chi tiết máy $A$ và $20$ chi tiết máy $B$ mỗi tuần.]),
    True([Số tiền lãi lớn nhất xưởng cơ khí có thể thu được trong một tuần là $2.200.000$ đồng.])
  ),
  loigiai: [
    #step([Lập bảng tóm tắt số liệu])
    #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      align: center + horizon,
      stroke: 0.5pt + rgb("cbd5e1"),
      fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
      [Máy móc / Lợi nhuận], [Chi tiết $A$ ($x$ chiếc)], [Chi tiết $B$ ($y$ chiếc)], [Thời gian tối đa tuần],
      [Máy tiện (giờ)], [$2$], [$1$], [Tối đa $80$ giờ],
      [Máy phay (giờ)], [$1$], [$3$], [Tối đa $90$ giờ],
      [Tiền lãi (nghìn đồng)], [$40$], [$50$], [$F(x, y) = 40x + 50y$]
    )
    ]
    Hệ BPT: $cases(2x + y <= 80, x + 3y <= 90, x >= 0, y >= 0)$ (Ý a Đúng).

    #step([Tọa độ đỉnh và minh họa miền nghiệm hình học])
    #grid(
      columns: (1fr, auto),
      gutter: 10pt,
      align: horizon,
      [
        Giao điểm biên: $cases(2x + y = 80, x + 3y = 90) <=> cases(x = 30, y = 20) => B(30; 20)$.
        Miền nghiệm tứ giác $O A B C$:
        $O(0; 0), A(40; 0), B(30; 20), C(0; 30)$ (Ý b Đúng).

        #v(3pt)
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Tính $F(x, y)$], [Tiền lãi (nghìn)],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(40; 0)$], [$40(40)$], [$1600$],
          [$B(30; 20)$], [$40(30) + 50(20)$], [$2200$],
          [$C(0; 30)$], [$50(30)$], [$1500$]
        )
        Lãi lớn nhất tại $B(30; 20)$ là $2.200.000$ đ. (Ý c, d Đúng)
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.052
          let xmax = 55
          let ymax = 45
          
          for x in range(0, 6) {
            let xv = x * 10 * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 5) {
            let yv = y * 10 * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (40 * sc, 0), (30 * sc, 20 * sc), (0, 30 * sc), close: true)
          
          line((22 * sc, 36 * sc), (43 * sc, -6 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((22 * sc, 38 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$2x + y = 80$]])
          
          line((-4 * sc, 31.33 * sc), (52 * sc, 12.67 * sc), stroke: 1.1pt + rgb("059669"))
          content((46 * sc, 16.5 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$x + 3y = 90$]])
          
          line((30 * sc, 20 * sc), (30 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((30 * sc, 20 * sc), (0, 20 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-4 * sc, 0), ((xmax + 4) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 5) * sc, 0), [$x$])
          line((0, -4 * sc), (0, (ymax + 4) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 5) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((30 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$30$]])
          content((40 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$40$]])
          content((-0.26, 20 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$20$]])
          content((-0.26, 30 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$30$]])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((40 * sc, 0), radius: 2pt, fill: black)
          content((40 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
          circle((0, 30 * sc), radius: 2pt, fill: black)
          content((0.22, 30 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
          
          circle((30 * sc, 20 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((30 * sc + 0.55, 20 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(30; 20)$]])
        })
      ]
    )
  ]
)

#pagebreak()

// DS 4: Lắp ráp thiết bị điện tử
#ds([Một nhà máy lắp ráp hai thiết bị điện tử thông minh: đồng hồ đeo tay ($x$ chiếc) và tai nghe không dây ($y$ chiếc). Để lắp 1 chiếc đồng hồ cần $3$ chip vi xử lý và $2$ giờ nhân công, lãi $200$ nghìn đồng. Để lắp 1 chiếc tai nghe cần $1$ chip vi xử lý và $2$ giờ nhân công, lãi $120$ nghìn đồng. Trong kho hiện có $180$ chip vi xử lý và tổng thời gian làm việc của công nhân không quá $200$ giờ. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Bất phương trình ràng buộc về số lượng chip vi xử lý là $3x + y <= 180$.]),
    True([Bất phương trình ràng buộc về giờ công nhân công rút gọn là $x + y <= 100$.]),
    False([Để đạt lợi nhuận lớn nhất, nhà máy chỉ nên lắp ráp đồng hồ và không lắp ráp tai nghe.]),
    False([Số tiền lãi lớn nhất nhà máy có thể đạt được là $14.000.000$ đồng.])
  ),
  loigiai: [
    #step([Lập bảng tóm tắt số liệu])
    #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      align: center + horizon,
      stroke: 0.5pt + rgb("cbd5e1"),
      fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
      [Linh kiện / Nguồn lực], [Đồng hồ ($x$ chiếc)], [Tai nghe ($y$ chiếc)], [Khả dụng tối đa],
      [Chip vi xử lý], [$3$], [$1$], [Tối đa $180$ chiếc],
      [Nhân công (giờ)], [$2$], [$2$], [Tối đa $200$ giờ],
      [Tiền lãi (nghìn đồng)], [$200$], [$120$], [$F(x, y) = 200x + 120y$]
    )
    ]
    - Ràng buộc chip: $3x + y <= 180$ (Ý a Đúng).
    - Ràng buộc nhân công: $x + y <= 100$ (Ý b Đúng).

    #step([Tọa độ đỉnh và minh họa miền nghiệm hình học])
    #grid(
      columns: (1fr, auto),
      gutter: 10pt,
      align: horizon,
      [
        Giao điểm biên: $cases(3x + y = 180, x + y = 100) <=> cases(x = 40, y = 60) => B(40; 60)$.
        Miền nghiệm là tứ giác $O A B C$ với:
        $O(0; 0), A(60; 0), B(40; 60), C(0; 100)$.

        #v(4pt)
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Tính $F(x, y)$], [Tiền lãi (nghìn)],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(60; 0)$], [$200(60)$], [$12000$],
          [$B(40; 60)$], [$200(40) + 120(60)$], [$15200$],
          [$C(0; 100)$], [$120(100)$], [$12000$]
        )
        Lãi lớn nhất là $15.200.000$ đ tại $B(40; 60)$. (Ý c, d Sai)
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.03
          let xmax = 75
          let ymax = 115
          
          for x in range(0, 8) {
            let xv = x * 10 * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 12) {
            let yv = y * 10 * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (60 * sc, 0), (40 * sc, 60 * sc), (0, 100 * sc), close: true)
          
          line((25 * sc, 105 * sc), (65 * sc, -15 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((27 * sc, 108 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 7pt, weight: "bold")[$3x + y = 180$]])
          
          line((-5 * sc, 105 * sc), (75 * sc, 25 * sc), stroke: 1.1pt + rgb("059669"))
          content((66 * sc, 38 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 7pt, weight: "bold")[$x + y = 100$]])
          
          line((40 * sc, 60 * sc), (40 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((40 * sc, 60 * sc), (0, 60 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-6 * sc, 0), ((xmax + 6) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 8) * sc, 0), [$x$])
          line((0, -6 * sc), (0, (ymax + 6) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 8) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((40 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7.5pt)[$40$]])
          content((60 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7.5pt)[$60$]])
          content((-0.28, 60 * sc), box(fill: white, inset: 1pt)[#text(size: 7.5pt)[$60$]])
          content((-0.28, 100 * sc), box(fill: white, inset: 1pt)[#text(size: 7.5pt)[$100$]])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((60 * sc, 0), radius: 2pt, fill: black)
          content((60 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7.5pt, weight: "bold")[$A$]])
          circle((0, 100 * sc), radius: 2pt, fill: black)
          content((0.22, 100 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7.5pt, weight: "bold")[$C$]])
          
          circle((40 * sc, 60 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((40 * sc + 0.55, 60 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$B(40; 60)$]])
        })
      ]
    )
  ]
)

#pagebreak()

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1: Xưởng gốm mỹ nghệ
#tln([Một nghệ nhân làm bình hoa ($x$ chiếc) và ấm trà ($y$ chiếc). Để làm 1 bình hoa cần $2" kg"$ đất sét và $4$ giờ nung, lãi $150$ nghìn đồng. Để làm 1 ấm trà cần $1" kg"$ đất sét và $1$ giờ nung, lãi $60$ nghìn đồng. Nghệ nhân có $30" kg"$ đất sét và $80$ giờ nung lò. Tính số tiền lãi lớn nhất (đơn vị: nghìn đồng) mà nghệ nhân có thể thu được.],
    [2250],
    loigiai: [
        #step([Lập bảng tóm tắt số liệu])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Yếu tố], [Bình hoa ($x$)], [Ấm trà ($y$)], [Dự trữ tối đa],
          [Đất sét (kg)], [$2$], [$1$], [$30" kg"$],
          [Nung lò (giờ)], [$4$], [$1$], [$80$ giờ],
          [Tiền lãi (nghìn đồng)], [$150$], [$60$], [$F(x, y) = 150x + 60y$]
        )
        ]
        Hệ bất phương trình: $cases(2x + y <= 30, 4x + y <= 80, x >= 0, y >= 0)$.
        Vì $4x + y <= 80$ có $2x + y <= 4x + y$, giao của $2x + y = 30$ và $4x + y = 80$ là $2x = 50 => x = 25 => y = - 20$ (nằm ngoài góc phần tư I).
        Thực tế đường $4x + y = 80$ cắt $O x$ tại $(20; 0)$, đường $2x + y = 30$ cắt $O x$ tại $(15; 0)$.
        Giao của hai nửa mặt phẳng là tứ giác với các đỉnh: $O(0; 0), A(15; 0), B(0; 30)$.
        - Tại $A(15; 0): F = 150(15) = 2250$ nghìn.
        - Tại $B(0; 30): F = 60(30) = 1800$ nghìn.
        - Chú ý nếu $4x + y <= 80$ không hạn chế thì tối đa tại $(10; 10): 2(10) + 10 = 30$ và $4(10)+10 = 50 <= 80$, khi đó $F = 150(10)+60(10) = 2100$.
        Ở đây $x = 15, y = 0$ thỏa mãn $4(15) + 0 = 60 <= 80$ và $2(15) + 0 = 30 <= 30$, cho lãi $2250$ nghìn.
    ]
)

// TLN 2: Xưởng sản xuất xe đạp
#tln([Một xưởng lắp ráp xe đạp địa hình ($x$ chiếc) và xe đạp đường phố ($y$ chiếc). Lắp $1$ xe địa hình cần $3$ giờ công và $2$ bộ giảm xóc, lãi $300$ nghìn đồng. Lắp $1$ xe đường phố cần $2$ giờ công và $1$ bộ giảm xóc, lãi $180$ nghìn đồng. Xưởng có $120$ giờ công và $70$ bộ giảm xóc. Để tiền lãi lớn nhất, xưởng cần lắp ráp bao nhiêu chiếc xe đạp địa hình?],
    [20],
    loigiai: [
        #step([Lập bảng tóm tắt số liệu])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Nguồn lực], [Xe địa hình ($x$)], [Xe đường phố ($y$)], [Tối đa khả dụng],
          [Giờ công (giờ)], [$3$], [$2$], [$120$ giờ],
          [Giảm xóc (bộ)], [$2$], [$1$], [$70$ bộ],
          [Tiền lãi (nghìn đồng)], [$300$], [$180$], [$F(x, y) = 300x + 180y$]
        )
        ]
        Hệ bất phương trình: $cases(3x + 2y <= 120, 2x + y <= 70, x >= 0, y >= 0)$.
        Tìm giao điểm $B$ của hai đường biên:
        $ cases(3x + 2y = 120, 4x + 2y = 140) => x = 20 => y = 70 - 2(20) = 30 => B(20; 30) $
        Các đỉnh miền nghiệm: $O(0; 0), A(35; 0), B(20; 30), C(0; 60)$.
        - $F(A) = 300(35) = 10500$.
        - $F(B) = 300(20) + 180(30) = 6000 + 5400 = 11400$.
        - $F(C) = 180(60) = 10800$.
        Lợi nhuận lớn nhất đạt tại $B(20; 30)$, tức là cần sản xuất $x = 20$ chiếc xe đạp địa hình.
    ]
)

// TLN 3: Xưởng bánh trung thu
#tln([Một xưởng làm bánh trung thu nướng ($x$ cái) và dẻo ($y$ cái). Mỗi bánh nướng cần $100" g"$ bột và $50" g"$ đường. Mỗi bánh dẻo cần $80" g"$ bột và $80" g"$ đường. Xưởng có $8" kg"$ bột ($8000" g"$) và $6" kg"$ đường ($6000" g"$). Tiền lãi mỗi chiếc bánh nướng là $15$ nghìn đồng, bánh dẻo là $12$ nghìn đồng. Tính tiền lãi lớn nhất (đơn vị: nghìn đồng) xưởng có thể thu được.],
    [1250],
    loigiai: [
        #step([Lập bảng tóm tắt số liệu])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Nguyên liệu], [Bánh nướng ($x$)], [Bánh dẻo ($y$)], [Dự trữ kho (gam)],
          [Bột mì (gam)], [$100$], [$80$], [$8000" g"$],
          [Đường (gam)], [$50$], [$80$], [$6000" g"$],
          [Tiền lãi (nghìn đồng)], [$15$], [$12$], [$F(x, y) = 15x + 12y$]
        )
        ]
        Rút gọn hệ bất phương trình:
        $ cases(5x + 4y <= 400, 5x + 8y <= 600, x >= 0, y >= 0) $
        Giao điểm $B$: lấy phương trình dưới trừ phương trình trên được $4y = 200 => y = 50 => 5x = 400 - 4(50) = 200 => x = 40 => B(40; 50)$.
        Các đỉnh: $O(0; 0), A(80; 0), B(40; 50), C(0; 75)$.
        - $F(A) = 15(80) = 1200$.
        - $F(B) = 15(40) + 12(50) = 600 + 600 = 1200$.
        - $F(C) = 12(75) = 900$.
        Để có giá trị lớn nhất duy nhất, ta tính $F(40; 50) = 1200$ nghìn.
    ]
)

// TLN 4: Gia công kim loại tấm
#tln([Một xưởng gia công tấm kim loại sản xuất hộp loại I ($x$ chiếc) và hộp loại II ($y$ chiếc). Máy cắt làm việc tối đa $12$ giờ, máy chấn dập làm việc tối đa $18$ giờ. Mỗi hộp loại I cần $2$ giờ cắt và $2$ giờ dập; mỗi hộp loại II cần $1$ giờ cắt và $3$ giờ dập. Tìm tổng số lượng hộp $(x + y)$ được sản xuất khi xưởng sử dụng hết công suất của cả hai máy.],
    [7],
    loigiai: [
        #step([Lập bảng thời gian máy])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Công đoạn], [Hộp loại I ($x$)], [Hộp loại II ($y$)], [Công suất tối đa],
          [Máy cắt (giờ)], [$2$], [$1$], [$12$ giờ],
          [Máy chấn dập (giờ)], [$2$], [$3$], [$18$ giờ]
        )
        ]
        Khi sử dụng hết công suất cả hai máy, cặp $(x; y)$ thỏa mãn hệ phương trình biên:
        $ cases(2x + y = 12, 2x + 3y = 18) <=> cases(2y = 6 => y = 3, 2x = 12 - 3 = 9 => x = 4.5) $
        Nếu yêu cầu $x, y in NN$: xét các điểm nguyên lân cận $(3; 4)$ hoặc $(4; 3)$. Tại $(3; 4): 2(3)+4 = 10 <= 12, 2(3)+3(4) = 18 <= 18$, tổng số hộp là $x + y = 3 + 4 = 7$.
    ]
)

// TLN 5: Đóng gói tương ớt
#tln([Một công ty đóng chai tương ớt sản xuất loại chai thủy tinh ($x$ thùng) và chai nhựa ($y$ thùng). Chi phí sản xuất mỗi thùng chai thủy tinh là $40$ nghìn đồng, chai nhựa là $30$ nghìn đồng. Yêu cầu sản xuất ít nhất $50$ thùng mỗi ngày và số thùng chai nhựa không ít hơn số thùng chai thủy tinh . Đồng thời số thùng chai thủy tinh không ít hơn $20$ thùng. Tìm chi phí sản xuất thấp nhất (đơn vị: nghìn đồng) trong ngày.],
    [1700],
    loigiai: [
        #step([Lập bảng ràng buộc và chi phí])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Chai thủy tinh ($x$)], [Chai nhựa ($y$)], [Ràng buộc kế hoạch],
          [Số lượng thùng], [$x >= 20$], [$y >= x$], [Tổng $x + y >= 50$],
          [Chi phí (nghìn đồng)], [$40$], [$30$], [$C(x, y) = 40x + 30y$]
        )
        ]
        Các đỉnh của miền nghiệm:
        - Giao của $x = 20$ và $x + y = 50$ là $A(20; 30)$.
        - Giao của $y = x$ và $x + y = 50$ là $B(25; 25)$.
        Tính chi phí tại các đỉnh:
        - $C(A) = 40(20) + 30(30) = 800 + 900 = 1700$ nghìn đồng.
        - $C(B) = 40(25) + 30(25) = 1000 + 750 = 1750$ nghìn đồng.
        Chi phí nhỏ nhất là $1700$ nghìn đồng tại $A(20; 30)$.
    ]
)

#pagebreak()

// TLN 6: Chế tạo robot công nghiệp kèm hình vẽ CeTZ
#tln([Một nhà máy chế tạo hai dòng robot công nghiệp: robot hàn tự động ($x$ chiếc) và robot sơn tự động ($y$ chiếc). Quy trình chế tạo trải qua ba công đoạn: Cơ khí, Điện tử và Kiểm thử.
- Mỗi robot hàn cần $4$ giờ cơ khí, $2$ giờ điện tử và $1$ giờ kiểm thử, mang lại doanh thu $60$ triệu đồng.
- Mỗi robot sơn cần $2$ giờ cơ khí, $3$ giờ điện tử và $2$ giờ kiểm thử, mang lại doanh thu $50$ triệu đồng.
Quỹ thời gian tối đa mỗi tuần là: $40$ giờ cơ khí, $36$ giờ điện tử và $20$ giờ kiểm thử.
Tìm doanh thu lớn nhất (đơn vị: triệu đồng) mà nhà máy có thể đạt được trong một tuần.],
    [720],
    loigiai: [
        #step([Lập bảng ma trận các công đoạn sản xuất])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Công đoạn / Doanh thu], [Robot hàn ($x$ chiếc)], [Robot sơn ($y$ chiếc)], [Giới hạn tuần (giờ)],
          [Gia công cơ khí (giờ)], [$4$], [$2$], [Tối đa $40$ giờ],
          [Lắp ráp điện tử (giờ)], [$2$], [$3$], [Tối đa $36$ giờ],
          [Kiểm thử (giờ)], [$1$], [$2$], [Tối đa $20$ giờ],
          [Doanh thu (triệu đồng)], [$60$], [$50$], [$F(x, y) = 60x + 50y$]
        )
        ]

        #step([Thiết lập hệ bất phương trình ràng buộc])
        Từ bảng trên, ta rút ra hệ bất phương trình:
        $ cases(
            4x + 2y <= 40 <=> 2x + y <= 20 quad &(d_1),
            2x + 3y <= 36 quad &(d_2),
            x + 2y <= 20 quad &(d_3),
            x >= 0, y >= 0
        ) $

        #step([Tọa độ đỉnh, khảo sát điểm nguyên và minh họa CeTZ])
        #grid(
          columns: (1fr, auto),
          gutter: 10pt,
          align: horizon,
          [
            Giao điểm $d_1: 2x + y = 20$ và $d_3: x + 2y = 20$ là $M(20/3; 20/3)$ (thỏa mãn $d_2$).
            Miền nghiệm tứ giác lồi $O A M C$:
            $O(0; 0), A(10; 0), M(20/3; 20/3), C(0; 10)$.

            Khảo sát các điểm nguyên $(x; y) in NN^2$ lân cận đỉnh $M$:
            - Điểm $(7; 6)$: thỏa mãn các ràng buộc, $F(7, 6) = 60(7) + 50(6) = 720$ triệu.
            - Điểm $(6; 7)$: $F = 710$ triệu; $(8; 4)$: $F = 680$ triệu.

            Doanh thu lớn nhất đạt $720$ triệu đồng khi sản xuất $7$ robot hàn và $6$ robot sơn.
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
                
                // Tô màu miền nghiệm tứ giác O - A(10;0) - M(6.67; 6.67) - C(0; 10)
                fill(rgb("eff6ff"))
                stroke(1.2pt + rgb("2563eb"))
                line((0, 0), (10 * sc, 0), (6.67 * sc, 6.67 * sc), (0, 10 * sc), close: true)
                
                // Các đường biên
                line((0, 20 * sc), (11 * sc, -2 * sc), stroke: 1.1pt + rgb("2563eb"))
                content((10.5 * sc, 2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$2x + y = 20$]])
                
                line((-1 * sc, 10.5 * sc), (21 * sc, -0.5 * sc), stroke: 1.1pt + rgb("059669"))
                content((2.5 * sc, 10.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$x + 2y = 20$]])
                
                // Đường dóng nét đứt từ điểm tối ưu nguyên (7; 6)
                line((7 * sc, 6 * sc), (7 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
                line((7 * sc, 6 * sc), (0, 6 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
                
                // Trục tọa độ Oxy
                line((-1 * sc, 0), ((xmax + 1) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
                content(((xmax + 1.2) * sc, 0), [$x$])
                line((0, -1 * sc), (0, (ymax + 1) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
                content((0, (ymax + 1.2) * sc), [$y$])
                content((-0.2, -0.2), [$O$])
                
                // Nhãn mốc tọa độ trên trục
                content((7 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$7$]])
                content((10 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$10$]])
                content((-0.26, 6 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$6$]])
                content((-0.26, 10 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$10$]])
                
                // Các đỉnh
                circle((0, 0), radius: 1.8pt, fill: black)
                circle((10 * sc, 0), radius: 2pt, fill: black)
                content((10 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
                circle((0, 10 * sc), radius: 2pt, fill: black)
                content((0.22, 10 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
                
                // Điểm tối ưu nguyên (7; 6)
                circle((7 * sc, 6 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
                content((7 * sc + 0.55, 6 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), weight: "bold", size: 7.5pt)[$(7; 6)$]])
            })
          ]
        )
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
