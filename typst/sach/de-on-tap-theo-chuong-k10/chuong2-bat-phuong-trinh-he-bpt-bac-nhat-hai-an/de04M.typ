#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0284c7") // Sky blue hiện đại, sắc sảo

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 2",
  exam-title: "BÀI 4M: CHUYÊN ĐỀ TƯ DUY NÂNG CAO - HỆ BPT CHỨA THAM SỐ & TỐI ƯU HÓA HÌNH HỌC",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "113",
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
#set text(size: 9.5pt)

// TN 1: Chặn hoành độ đơn giản
#tn([Cho hệ bất phương trình $cases(x >= 0, y >= 0, x + y <= 4, x >= m)$. Tìm tất cả các giá trị của tham số $m$ để hệ bất phương trình có nghiệm.],
    (
        [$m >= 4$],
        True([$m <= 4$]),
        [$m < 0$],
        [$m <= 0$]
    ),
    loigiai: [
        Từ $y >= 0$ và $x + y <= 4 => x <= 4 - y <= 4$.
        Kết hợp với $x >= 0$, ta có miền hoành độ $0 <= x <= 4$.
        Để hệ có nghiệm thỏa mãn $x >= m$ thì điều kiện cần và đủ là $m <= 4$.
    ]
)

// TN 2: Kẹp biến tìm hoành độ lớn nhất
#tn([Tìm tất cả các giá trị của tham số $m$ để hệ bất phương trình $cases(x - y <= 2, x + y <= 6, x >= m)$ có nghiệm.],
    (
        [$m >= 4$],
        [$m <= 2$],
        True([$m <= 4$]),
        [$m <= 6$]
    ),
    loigiai: [
        #step([Biểu diễn kẹp biến y theo x])
        Từ hệ hai bất phương trình đầu:
        $ cases(x - y <= 2 <=> y >= x - 2, x + y <= 6 <=> y <= 6 - x) => x - 2 <= y <= 6 - x $
        Để tồn tại $y$ thỏa mãn bất đẳng thức kẹp trên thì:
        $ x - 2 <= 6 - x <=> 2x <= 8 <=> x <= 4 $
        Đẳng thức $x = 4$ xảy ra khi $y = 2$ (ứng với giao điểm $M(4; 2)$).
        Do đó, hệ có nghiệm khi và chỉ khi $m <= 4$.
    ]
)

// TN 3: Chặn tung độ nhỏ nhất
#tn([Tìm giá trị nguyên nhỏ nhất của tham số $m$ để hệ bất phương trình $cases(x + y >= 6, x <= 4, y <= m)$ có nghiệm.],
    (
        [$m = 0$],
        [$m = 1$],
        True([$m = 2$]),
        [$m = 4$]
    ),
    loigiai: [
        Từ $x <= 4$ và $x + y >= 6 => y >= 6 - x >= 6 - 4 = 2$.
        Đẳng thức $y = 2$ đạt được khi $x = 4$ (tại điểm $A(4; 2)$).
        Do đó trong miền nghiệm, tung độ luôn thỏa mãn $y >= 2$.
        Để hệ có nghiệm $y <= m$ thì $m >= 2$. Giá trị nguyên nhỏ nhất là $m = 2$.
    ]
)


// TN 4: Điều kiện hệ có nghiệm duy nhất
#tn([Tìm giá trị của tham số $m$ để hệ bất phương trình $cases(2x + y <= 5, x >= 1, y >= m)$ có đúng MỘT nghiệm duy nhất.],
    (
        [$m = 1$],
        [$m = 2$],
        True([$m = 3$]),
        [$m = 5$]
    ),
    loigiai: [
        Từ $x >= 1$ suy ra $y <= 5 - 2x <= 5 - 2(1) = 3$.
        Để hệ có nghiệm thỏa mãn $y >= m$ thì $m <= 3$.
        Để hệ có đúng 1 nghiệm duy nhất thì bắt buộc $m = 3$. Khi đó nghiệm duy nhất là $(1; 3)$.
    ]
)

// TN 5: Đếm số giá trị nguyên của tham số m
#tn([Có bao nhiêu giá trị nguyên của tham số $m in [-5; 5]$ để hệ bất phương trình $cases(x + 2y <= 8, 2x - y <= 1, x >= m)$ có nghiệm?],
    (
        [$6$],
        [$7$],
        True([$8$]),
        [$9$]
    ),
    loigiai: [
        Từ hệ hai bất phương trình đầu, biểu diễn $y$ theo $x$:
        $ 2x - 1 <= y <= (8 - x)/2 $
        Để tồn tại $y$ thì $2x - 1 <= 4 - x/2 <=> (5x)/2 <= 5 <=> x <= 2$.
        Do đó hệ có nghiệm khi và chỉ khi $m <= 2$.
        Với $m in [-5; 5]$ và $m in ZZ$, các giá trị thỏa mãn là $m in {-5; -4; -3; -2; -1; 0; 1; 2}$ (có $8$ giá trị).
    ]
)

// TN 6: Dịch chuyển đường thẳng xiên qua miền nghiệm tam giác
#tn([Cho hệ bất phương trình $cases(x >= 0, y >= 0, x + y <= 5, 2x + y >= m)$. Tìm tất cả các giá trị của tham số $m$ để hệ có nghiệm.],
    (
        [$m <= 5$],
        True([$m <= 10$]),
        [$m >= 10$],
        [$m <= 0$]
    ),
    loigiai: [
        Miền nghiệm của ba bất phương trình đầu là miền tam giác có ba đỉnh $O(0;0), A(5;0), B(0;5)$.
        Biểu thức $F(x, y) = 2x + y$ đạt giá trị lớn nhất trên miền tam giác tại đỉnh $A(5; 0)$:
        $ F_(max) = 2(5) + 0 = 10 $
        Để hệ có nghiệm thỏa mãn $2x + y >= m$ thì $m <= F_(max) = 10$.
    ]
)


// TN 7: Chặn tung độ bằng phương pháp kẹp biến
#tn([Tìm giá trị nguyên nhỏ nhất của tham số $m$ để hệ bất phương trình $cases(3x + y >= 6, x - y <= 2, y <= m)$ có nghiệm.],
    (
        [$m = -2$],
        [$m = -1$],
        True([$m = 0$]),
        [$m = 2$]
    ),
    loigiai: [
        Từ hệ hai bất phương trình đầu, biểu diễn $x$ theo $y$:
        $ (6 - y)/3 <= x <= y + 2 $
        Để tồn tại $x$ thì $(6 - y)/3 <= y + 2 <=> 6 - y <= 3y + 6 <=> 4y >= 0 <=> y >= 0$.
        Đẳng thức $y = 0$ đạt được khi $x = 2$ (tại $M(2; 0)$).
        Do đó để $y <= m$ có nghiệm thì $m >= 0$. Giá trị nguyên nhỏ nhất là $m = 0$.
    ]
)

// TN 8: Điều kiện nghiệm duy nhất trên hình vuông
#tn([Tìm giá trị của tham số $m$ để hệ bất phương trình $cases(0 <= x <= 2, 0 <= y <= 3, x + y >= m)$ có duy nhất một nghiệm.],
    (
        [$m = 3$],
        [$m = 4$],
        True([$m = 5$]),
        [$m = 6$]
    ),
    loigiai: [
        Vì $x <= 2$ và $y <= 3$ nên $x + y <= 2 + 3 = 5$.
        Để hệ có nghiệm thỏa mãn $x + y >= m$ thì $m <= 5$.
        Hệ có nghiệm duy nhất khi và chỉ khi $m = 5$, khi đó nghiệm là điểm cực biên $(2; 3)$.
    ]
)

// TN 9: Dải song song có nghiệm
#tn([Tìm tất cả các giá trị của tham số $m$ để hệ bất phương trình $cases(x + y <= 3, x + y >= m)$ có nghiệm.],
    (
        [$m > 3$],
        True([$m <= 3$]),
        [$m >= 3$],
        [$m < 3$]
    ),
    loigiai: [
        Hệ tương đương với dải mặt phẳng $m <= x + y <= 3$.
        Để dải này không rỗng (hệ có nghiệm) thì $m <= 3$.
    ]
)


// TN 10: Tìm m để giá trị lớn nhất đạt yêu cầu
#tn([Cho hệ bất phương trình $cases(x >= 0, y >= 0, x + y <= 4)$. Tìm giá trị dương của tham số $m$ để giá trị lớn nhất của $F(x, y) = 3x + 2y$ trên miền nghiệm của hệ bằng $m^2 + 3$.],
    (
        [$m = 2$],
        True([$m = 3$]),
        [$m = 4$],
        [$m = 9$]
    ),
    loigiai: [
        Miền nghiệm là tam giác vuông có ba đỉnh $O(0;0), A(4;0), B(0;4)$.
        - $F(O) = 0$.
        - $F(A) = 3(4) + 2(0) = 12$.
        - $F(B) = 3(0) + 2(4) = 8$.
        Giá trị lớn nhất là $F_(max) = 12$ (đạt tại $A(4; 0)$).
        Theo bài ra: $m^2 + 3 = 12 <=> m^2 = 9 <=> m = 3$ (do $m > 0$).
    ]
)

// TN 11: Chặn hoành độ đối xứng
#tn([Tìm giá trị nguyên lớn nhất của tham số $m$ để hệ bất phương trình $cases(x + 2y <= 6, x - 2y <= 2, x >= m)$ có nghiệm.],
    (
        [$m = 2$],
        [$m = 3$],
        True([$m = 4$]),
        [$m = 6$]
    ),
    loigiai: [
        Cộng hai bất phương trình đầu vế theo vế:
        $ (x + 2y) + (x - 2y) <= 6 + 2 <=> 2x <= 8 <=> x <= 4 $
        Đẳng thức $x = 4$ xảy ra khi $y = 1$ (tại giao điểm $(4; 1)$).
        Do đó để $x >= m$ có nghiệm thì $m <= 4$. Giá trị nguyên lớn nhất là $m = 4$.
    ]
)

// TN 12: Ứng dụng thực tế quy hoạch có tham số chỉ tiêu
#tn([Một phân xưởng sản xuất hai mẫu chi tiết máy $A$ ($x$ chiếc) và $B$ ($y$ chiếc) với điều kiện giờ công máy: $2x + y <= 20$ và $x + 2y <= 20$ ($x, y in NN$). Tìm chỉ tiêu tổng số lượng sản phẩm $m = x + y$ lớn nhất mà phân xưởng có thể đạt được.],
    (
        [$12$],
        True([$13$]),
        [$14$],
        [$15$]
    ),
    loigiai: [
        Cộng hai bất phương trình: $3(x + y) <= 40 => x + y <= 40/3 approx 13.33$.
        Vì $x, y in NN$ nên $x + y <= 13$.
        Cặp số $(6; 7)$ thỏa mãn: $2(6) + 7 = 19 <= 20$ và $6 + 2(7) = 20 <= 20$, cho tổng $x + y = 13$.
        Vậy chỉ tiêu nguyên lớn nhất có thể đạt được là $m = 13$.
    ]
)

#pagebreak()

// ═══════════════════════════════════════════════════════════════════
// PHẦN II: CÂU TRẮC NGHIỆM ĐÚNG/SAI
// ═══════════════════════════════════════════════════════════════════
#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13): Phát triển mô hình Câu 22 Đề 04A (Chặn hoành độ x)
#ds([Cho hệ bất phương trình $cases(x + y <= 5, 2x - y <= 1, x >= m)$ (với $m$ là tham số). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Giao điểm của hai đường thẳng $d_1: x + y = 5$ và $d_2: 2x - y = 1$ có tọa độ là $M(2; 3)$.]),
    True([Với mọi điểm $(x; y)$ thuộc miền nghiệm của hai bất phương trình đầu, hoành độ luôn thỏa mãn $x <= 2$.]),
    True([Hệ ba bất phương trình có nghiệm khi và chỉ khi tham số $m <= 2$.]),
    [Khi $m = 2$, hệ bất phương trình có vô số nghiệm phân biệt.]
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập luận đại số và kẹp biến hoành độ $x$])
    #align(center)[
      #table(
        columns: (auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Đường thẳng biên], [Phương trình], [Tọa độ giao điểm $M$],
        [$d_1$], [$x + y = 5$], table.cell(rowspan: 2)[$cases(x + y = 5, 2x - y = 1) <=> cases(x = 2, y = 3) => M(2; 3)$],
        [$d_2$], [$2x - y = 1$]
      )
    ]
    #align(center)[
      $ cases(x + y <= 5 <=> y <= 5 - x, 2x - y <= 1 <=> y >= 2x - 1) => 2x - 1 <= y <= 5 - x $
    ]
    #align(center)[
      Để tồn tại $y$ kẹp giữa thì $2x - 1 <= 5 - x <=> 3x <= 6 <=> x <= 2$.
    ]
    #align(center)[
      $=>$ *Mệnh đề a) và b) là Đúng*.
    ]

    #step([Điều kiện tham số và hình vẽ minh họa CeTZ])
    #align(center)[
      #grid(
        columns: (auto, auto),
        gutter: 24pt,
        align: horizon,
        [
          #box(width: 170pt)[
            - Điểm có hoành độ lớn nhất trong miền nghiệm là đỉnh $M(2; 3)$ ($x_(max) = 2$).
            - Nửa mặt phẳng $x >= m$ giao với miền nghiệm $<=>$ đường thẳng thẳng đứng $x = m$ nằm bên trái hoặc đi qua đỉnh $M$:
            $ m <= 2 $
            $=>$ *Mệnh đề c) là Đúng*.
            
            - Khi $m = 2$, đường thẳng $x = 2$ chỉ chạm miền nghiệm tại đúng một điểm duy nhất là $M(2; 3)$. Phát biểu "vô số nghiệm" là Sai.
            $=>$ *Mệnh đề d) là Sai*.
          ]
        ],
        [
          #cetz.canvas({
            import cetz.draw: *
            set-style(stroke: 0.8pt)
            let sc = 0.55
            let xmin = -1.0 * sc
            let xmax = 4.5 * sc
            let ymin = -1.0 * sc
            let ymax = 5.5 * sc
            
            let sx(x) = x * sc
            let sy(y) = y * sc
            
            // Lưới mờ
            for x in range(-1, 5) { line((sx(x), ymin), (sx(x), ymax), stroke: 0.2pt + rgb("e2e8f0")) }
            for y in range(-1, 6) { line((xmin, sy(y)), (xmax, sy(y)), stroke: 0.2pt + rgb("e2e8f0")) }
            
            // Miền nghiệm xanh
            fill(rgb("eff6ff"))
            stroke(none)
            line((sx(-1), sy(-1)), (sx(0), sy(-1)), (sx(2), sy(3)), (sx(-0.5), sy(5.5)), (sx(-1), sy(5.5)), close: true)
            
            // Trục tọa độ
            line((xmin - 0.2, 0), (xmax + 0.3, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt)
            content((xmax + 0.45, 0), [$x$])
            line((0, ymin - 0.2), (0, ymax + 0.3), mark: (end: "stealth", fill: black), stroke: 0.8pt)
            content((0, ymax + 0.45), [$y$])
            content((-0.2, -0.2), [$O$])
            
            // Đường thẳng biên
            line((sx(-0.5), sy(5.5)), (sx(4.5), sy(0.5)), stroke: 1.1pt + rgb("2563eb"))
            content((sx(3.8), sy(1.8)), text(fill: rgb("2563eb"), size: 7.5pt, weight: "bold")[$d_1$])
            
            line((sx(0), sy(-1)), (sx(3), sy(5)), stroke: 1.1pt + rgb("059669"))
            content((sx(2.8), sy(4.8)), text(fill: rgb("059669"), size: 7.5pt, weight: "bold")[$d_2$])
            
            // Đường x = 2
            line((sx(2), ymin), (sx(2), ymax), stroke: (paint: rgb("dc2626"), dash: "dashed", thickness: 0.9pt))
            content((sx(2) + 0.45, sy(5.0)), text(fill: rgb("dc2626"), size: 7.5pt)[$x = 2$])
            
            // Đỉnh M(2; 3)
            circle((sx(2), sy(3)), radius: 2.2pt, fill: rgb("dc2626"), stroke: black)
            content((sx(2) + 0.65, sy(3) + 0.2), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$M(2; 3)$])
          })
        ]
      )
    ]
  ]
)

#pagebreak()

// DS 2 (Câu 14): Phát triển mô hình Câu 22 Đề 04B (Chặn tung độ y)
#ds([Cho hệ bất phương trình $cases(x + 2y >= 6, 2x - y <= 2, y <= m)$ (với $m$ là tham số). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Giao điểm của hai đường thẳng biên $d_1: x + 2y = 6$ và $d_2: 2x - y = 2$ là $A(2; 2)$.]),
    True([Với mọi điểm $(x; y)$ thuộc miền nghiệm của hai bất phương trình đầu, tung độ luôn thỏa mãn $y >= 2$.]),
    True([Hệ ba bất phương trình có nghiệm khi và chỉ khi $m >= 2$.]),
    [Khi $m = 1$, hệ bất phương trình có vô số nghiệm phân biệt.]
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Lập luận đại số và kẹp biến tung độ $y$])
    #align(center)[
      #table(
        columns: (auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Đường thẳng biên], [Phương trình], [Tọa độ giao điểm $A$],
        [$d_1$], [$x + 2y = 6$], table.cell(rowspan: 2)[$cases(x + 2y = 6, 2x - y = 2) <=> cases(x = 2, y = 2) => A(2; 2)$],
        [$d_2$], [$2x - y = 2$]
      )
    ]
    #align(center)[
      Từ hai bất phương trình đầu, biểu diễn $x$ theo $y$:
      $ cases(x + 2y >= 6 <=> x >= 6 - 2y, 2x - y <= 2 <=> x <= (y + 2)/2) => 6 - 2y <= x <= (y + 2)/2 $
    ]
    #align(center)[
      Để tồn tại số thực $x$ thỏa mãn bất đẳng thức kẹp trên thì:
      $ 6 - 2y <= (y + 2)/2 <=> 12 - 4y <= y + 2 <=> 5y >= 10 <=> y >= 2 $
    ]
    #align(center)[
      Đẳng thức $y = 2$ xảy ra khi $x = 2$, ứng với đỉnh nhọn $A(2; 2)$ là điểm có tung độ nhỏ nhất.
    ]
    #align(center)[
      $=>$ *Mệnh đề a) và b) là Đúng*.
    ]

    #step([Điều kiện tham số và hình vẽ minh họa CeTZ])
    #align(center)[
      #grid(
        columns: (auto, auto),
        gutter: 24pt,
        align: horizon,
        [
          #box(width: 170pt)[
            - Điểm thấp nhất (có tung độ nhỏ nhất) của miền nghiệm là đỉnh $A(2; 2)$ ($y_(min) = 2$).
            - Nửa mặt phẳng $y <= m$ biểu diễn miền phía dưới đường thẳng nằm ngang $y = m$.
            - Để hệ có nghiệm, đường thẳng $y = m$ phải cắt hoặc nằm phía trên đỉnh $A$:
            $ m >= 2 $
            $=>$ *Mệnh đề c) là Đúng*.
            
            - Khi $m = 1 < 2$, nửa mặt phẳng $y <= 1$ hoàn toàn không giao với miền nghiệm, do đó hệ vô nghiệm. Phát biểu "vô số nghiệm" là Sai.
            $=>$ *Mệnh đề d) là Sai*.
          ]
        ],
        [
          #cetz.canvas({
            import cetz.draw: *
            set-style(stroke: 0.8pt)
            let sc = 0.55
            let xmin = -1.0 * sc
            let xmax = 5.0 * sc
            let ymin = -0.5 * sc
            let ymax = 5.0 * sc
            
            let sx(x) = x * sc
            let sy(y) = y * sc
            
            // Lưới mờ
            for x in range(-1, 5) { line((sx(x), ymin), (sx(x), ymax), stroke: 0.2pt + rgb("e2e8f0")) }
            for y in range(0, 6) { line((xmin, sy(y)), (xmax, sy(y)), stroke: 0.2pt + rgb("e2e8f0")) }
            
            // Miền nghiệm xanh
            fill(rgb("eff6ff"))
            stroke(none)
            line((sx(-1), sy(3.5)), (sx(2), sy(2)), (sx(3.5), sy(5.0)), (sx(-1), sy(5.0)), close: true)
            
            // Trục tọa độ
            line((xmin - 0.2, 0), (xmax + 0.3, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt)
            content((xmax + 0.45, 0), [$x$])
            line((0, ymin - 0.2), (0, ymax + 0.3), mark: (end: "stealth", fill: black), stroke: 0.8pt)
            content((0, ymax + 0.45), [$y$])
            content((-0.2, -0.2), [$O$])
            
            // Đường thẳng d1, d2
            line((sx(-1), sy(3.5)), (sx(5.0), sy(0.5)), stroke: 1.1pt + rgb("2563eb"))
            content((sx(4.5), sy(1.2)), text(fill: rgb("2563eb"), size: 7.5pt, weight: "bold")[$d_1$])
            
            line((sx(0.5), sy(-1)), (sx(3.5), sy(5.0)), stroke: 1.1pt + rgb("059669"))
            content((sx(3.3), sy(4.4)), text(fill: rgb("059669"), size: 7.5pt, weight: "bold")[$d_2$])
            
            // Đường y = 2
            line((xmin, sy(2)), (xmax, sy(2)), stroke: (paint: rgb("dc2626"), dash: "dashed", thickness: 0.9pt))
            content((sx(4.2), sy(2) + 0.25), text(fill: rgb("dc2626"), size: 7.5pt)[$y = 2$])
            
            // Đỉnh A(2; 2)
            circle((sx(2), sy(2)), radius: 2.2pt, fill: rgb("dc2626"), stroke: black)
            content((sx(2) + 0.65, sy(2) - 0.25), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$A(2; 2)$])
          })
        ]
      )
    ]
  ]
)

#pagebreak()

// DS 3 (Câu 15): Dịch chuyển đường biên xiên qua hình chữ nhật
#ds([Cho hệ bất phương trình $cases(1 <= x <= 4, 1 <= y <= 5, x + y >= m)$ (với $m$ là tham số). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Miền nghiệm của hai bất phương trình đầu là một hình chữ nhật có diện tích bằng $12$.]),
    True([Hệ ba bất phương trình có nghiệm khi và chỉ khi $m <= 9$.]),
    True([Khi $m = 9$, hệ bất phương trình có duy nhất một nghiệm là $(4; 5)$.]),
    [Khi $m = 10$, miền nghiệm của hệ là một hình tam giác.]
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Xác định tọa độ các đỉnh và biên độ biến thiên của x + y])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Đỉnh hình chữ nhật], [Tọa độ $(x; y)$], [Giá trị $T = x + y$], [Vai trò],
        [$A$], [$(1; 1)$], [$1 + 1 = 2$], [Cực tiểu ($T_(min)$)],
        [$B$], [$(4; 1)$], [$4 + 1 = 5$], [Điểm biên],
        [$C$], [$(4; 5)$], [$4 + 5 = 9$], [Cực đại ($T_(max)$)],
        [$D$], [$(1; 5)$], [$1 + 5 = 6$], [Điểm biên]
      )
    ]
    #align(center)[
      Diện tích hình chữ nhật: $S = (4 - 1)(5 - 1) = 3 dot 4 = 12$. Biên độ: $2 <= x + y <= 9$.
    ]
    #align(center)[
      $=>$ *Mệnh đề a) là Đúng*.
    ]

    #step([Điều kiện tham số và hình vẽ minh họa CeTZ])
    #align(center)[
      #grid(
        columns: (auto, auto),
        gutter: 24pt,
        align: horizon,
        [
          #box(width: 170pt)[
            - Bất phương trình $x + y >= m$ biểu diễn nửa mặt phẳng phía trên đường thẳng dằn $x + y = m$.
            - Để hệ có nghiệm, nửa mặt phẳng phải cắt hình chữ nhật:
            $ m <= T_(max) = 9 $
            $=>$ *Mệnh đề b) là Đúng*.
            
            - Khi $m = 9$, đường thẳng $x + y = 9$ đi qua đúng đỉnh cực biên $C(4; 5)$, hệ có nghiệm duy nhất $(4; 5)$.
            $=>$ *Mệnh đề c) là Đúng*.
            
            - Khi $m = 10 > 9$, đường thẳng nằm hoàn toàn ngoài hình chữ nhật, hệ vô nghiệm. Phát biểu "là hình tam giác" là Sai.
            $=>$ *Mệnh đề d) là Sai*.
          ]
        ],
        [
          #cetz.canvas({
            import cetz.draw: *
            set-style(stroke: 0.8pt)
            let sc = 0.5
            let xmin = -0.5 * sc
            let xmax = 5.5 * sc
            let ymin = -0.5 * sc
            let ymax = 6.0 * sc
            
            let sx(x) = x * sc
            let sy(y) = y * sc
            
            // Trục tọa độ
            line((xmin, 0), (xmax + 0.3, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt)
            content((xmax + 0.45, 0), [$x$])
            line((0, ymin), (0, ymax + 0.3), mark: (end: "stealth", fill: black), stroke: 0.8pt)
            content((0, ymax + 0.45), [$y$])
            content((-0.2, -0.2), [$O$])
            
            // Hình chữ nhật ABCD
            rect((sx(1), sy(1)), (sx(4), sy(5)), fill: rgb("eff6ff"), stroke: 1.1pt + rgb("2563eb"))
            content((sx(2.5), sy(3)), text(fill: rgb("1d4ed8"), weight: "bold", size: 8pt)[$S = 12$])
            
            // Các đường thẳng m = 2, m = 9
            line((sx(0), sy(2)), (sx(2), sy(0)), stroke: (paint: rgb("059669"), dash: "dotted", thickness: 0.8pt))
            content((sx(0.5), sy(1.8)), text(fill: rgb("059669"), size: 6.5pt)[$m = 2$])
            
            line((sx(3), sy(6)), (sx(6), sy(3)), stroke: (paint: rgb("dc2626"), dash: "dashed", thickness: 1pt))
            content((sx(5.2), sy(4.2)), text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$x + y = 9$])
            
            // Đỉnh C(4; 5)
            circle((sx(4), sy(5)), radius: 2.2pt, fill: rgb("dc2626"), stroke: black)
            content((sx(4) + 0.65, sy(5) + 0.2), text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$C(4; 5)$])
          })
        ]
      )
    ]
  ]
)

#pagebreak()

// DS 4 (Câu 16): Ứng dụng thực tế quy hoạch tuyến tính có tham số chỉ tiêu ngân sách
#ds([Một công ty công nghệ sản xuất hai dòng thiết bị IoT thông minh: Thiết bị Cảm biến $A$ ($x$ chiếc) và Bộ Điều khiển $B$ ($y$ chiếc). Điều kiện về dây chuyền hàn chip và kiểm định chất lượng dẫn tới hệ ràng buộc kỹ thuật: $cases(x + y <= 10, 2x + y <= 16, x >= 0, y >= 0)$. Để kế hoạch sản xuất được ban giám đốc phê duyệt, tổng lợi nhuận thu được $L(x, y) = 3x + 2y$ (triệu đồng) phải đạt chỉ tiêu tối thiểu $m$ triệu đồng ($L(x, y) >= m$). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Miền nghiệm kỹ thuật của công ty là một tứ giác lồi có 4 đỉnh $O(0;0), A(8;0), B(6;4), C(0;10)$.]),
    True([Phương án sản xuất mang lại lợi nhuận cao nhất là chế tạo $6$ thiết bị $A$ và $4$ thiết bị $B$.]),
    True([Mức chỉ tiêu lợi nhuận $m$ cao nhất mà công ty có thể cam kết hoàn thành là $26$ triệu đồng.]),
    [Nếu ban giám đốc đặt chỉ tiêu $m = 28$ triệu đồng, công ty vẫn tìm được ít nhất hai phương án sản xuất khả thi.]
  ),
  loigiai: [
    #set text(size: 9.5pt)
    #step([Tính toán lợi nhuận tại các đỉnh của miền nghiệm])
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        stroke: 0.5pt + rgb("cbd5e1"),
        fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
        [Đỉnh đa giác], [Tọa độ $(x; y)$], [Lợi nhuận $L = 3x + 2y$], [Đánh giá thực tế],
        [$O$], [$(0; 0)$], [$0$ triệu đồng], [Không sản xuất],
        [$A$], [$(8; 0)$], [$3(8) + 0 = 24$ triệu], [Chuyên thiết bị A],
        [$B$], [$(6; 4)$], [$3(6) + 2(4) = 26$ triệu], [Tối ưu toàn diện ($L_(max)$)],
        [$C$], [$(0; 10)$], [$0 + 2(10) = 20$ triệu], [Chuyên thiết bị B]
      )
    ]
    #align(center)[
      Giao điểm $B = (x + y = 10) inter (2x + y = 16) => B(6; 4)$ cho lợi nhuận cực đại $26$ triệu đồng.
    ]
    #align(center)[
      $=>$ *Mệnh đề a), b) và c) là Đúng*.
    ]

    #step([Đánh giá chỉ tiêu tham số m và hình vẽ CeTZ])
    #align(center)[
      #grid(
        columns: (auto, auto),
        gutter: 24pt,
        align: horizon,
        [
          #box(width: 170pt)[
            - Chỉ tiêu $m$ khả thi khi và chỉ khi hệ có nghiệm, tức là $m <= L_(max) = 26$ triệu đồng.
            - Với chỉ tiêu $m = 28$ triệu đồng, vượt quá trần lợi nhuận tối đa $26$ triệu đồng, do đó không tồn tại bất kỳ phương án nào đáp ứng được. Phát biểu "vẫn tìm được ít nhất hai phương án" là Sai.
            $=>$ *Mệnh đề d) là Sai*.
          ]
        ],
        [
          #cetz.canvas({
            import cetz.draw: *
            set-style(stroke: 0.8pt)
            let sc = 0.26
            let xmin = -1.0 * sc
            let xmax = 10.5 * sc
            let ymin = -1.0 * sc
            let ymax = 12.0 * sc
            
            let sx(x) = x * sc
            let sy(y) = y * sc
            
            // Miền nghiệm tứ giác OABC
            fill(rgb("eff6ff"))
            stroke(none)
            line((0, 0), (sx(8), 0), (sx(6), sy(4)), (0, sy(10)), close: true)
            
            // Trục tọa độ
            line((xmin, 0), (xmax + 0.3, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt)
            content((xmax + 0.5, 0), [$x$])
            line((0, ymin), (0, ymax + 0.3), mark: (end: "stealth", fill: black), stroke: 0.8pt)
            content((0, ymax + 0.5), [$y$])
            content((-0.2, -0.2), [$O$])
            
            // Các đường thẳng biên
            line((0, sy(10)), (sx(10), 0), stroke: 1.1pt + rgb("2563eb"))
            content((sx(8.5), sy(2.5)), text(fill: rgb("2563eb"), size: 6.5pt)[$x + y = 10$])
            
            line((0, sy(16)), (sx(8), 0), stroke: 1.1pt + rgb("059669"))
            content((sx(4.5), sy(8.5)), text(fill: rgb("059669"), size: 6.5pt)[$2x + y = 16$])
            
            // Đỉnh tối ưu B(6; 4)
            circle((sx(6), sy(4)), radius: 2.2pt, fill: rgb("dc2626"), stroke: black)
            content((sx(6) + 1.1, sy(4) + 0.3), text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(6; 4)$])
          })
        ]
      )
    ]
  ]
)

#pagebreak()

// ═══════════════════════════════════════════════════════════════════
// PHẦN III: CÂU TRẮC NGHIỆM TRẢ LỜI NGẮN
// ═══════════════════════════════════════════════════════════════════
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)
#set text(size: 9.5pt)

// TLN 1 (Câu 17): Kẹp biến chặn hoành độ x
#tln([Tìm giá trị nguyên lớn nhất của tham số $m$ để hệ bất phương trình $cases(x + y <= 6, 3x - y <= 2, x >= m)$ có nghiệm.],
    [2],
    loigiai: [
        #step([Đánh giá chặn trên của hoành độ x bằng phương pháp kẹp biến])
        Từ hệ hai bất phương trình đầu, biểu diễn $y$ theo $x$:
        $ cases(x + y <= 6 <=> y <= 6 - x, 3x - y <= 2 <=> y >= 3x - 2) => 3x - 2 <= y <= 6 - x $
        Để tồn tại $y$ thỏa mãn bất đẳng thức kẹp trên, điều kiện cần và đủ là:
        $ 3x - 2 <= 6 - x <=> 4x <= 8 <=> x <= 2 $
        Đẳng thức $x = 2$ đạt được khi $y = 6 - 2 = 4$, ứng với đỉnh $M(2; 4)$ là điểm có hoành độ lớn nhất trong miền nghiệm.
        
        #step([Điều kiện để hệ có nghiệm])
        Bất phương trình $x >= m$ biểu diễn nửa mặt phẳng phía bên phải đường thẳng thẳng đứng $x = m$.
        Để hệ ba bất phương trình có nghiệm thì $m <= x_(max) = 2$.
        Vì $m in ZZ$ nên giá trị nguyên lớn nhất cần tìm là $m = 2$.
    ]
)

// TLN 2 (Câu 18): Chặn tung độ y
#tln([Tìm giá trị nguyên nhỏ nhất của tham số $m$ để hệ bất phương trình $cases(2x + y >= 7, x <= 2, y <= m)$ có nghiệm.],
    [3],
    loigiai: [
        #step([Đánh giá chặn dưới của tung độ y])
        Từ hai bất phương trình đầu:
        $ cases(2x + y >= 7 <=> y >= 7 - 2x, x <= 2 <=> -2x >= -4) => y >= 7 - 2x >= 7 - 4 = 3 $
        Đẳng thức $y = 3$ đạt được khi $x = 2$ (tại điểm $A(2; 3)$).
        Do đó trong toàn bộ miền nghiệm, tung độ luôn thỏa mãn $y >= 3$ ($y_(min) = 3$).
        
        #step([Điều kiện tham số m])
        Để hệ có nghiệm thỏa mãn $y <= m$ thì $m >= y_(min) = 3$.
        Vì $m in ZZ$ nên giá trị nguyên nhỏ nhất của $m$ là $m = 3$.
    ]
)

#pagebreak()

// TLN 3 (Câu 19): Đếm số tham số nguyên dương
#tln([Có tất cả bao nhiêu số nguyên dương $m$ để hệ bất phương trình $cases(x - y <= 1, x + 2y <= 10, x >= m)$ có nghiệm?],
    [4],
    loigiai: [
        #step([Kẹp biến tung độ y theo x])
        Từ hai bất phương trình đầu:
        $ x - 1 <= y <= (10 - x)/2 $
        Điều kiện để tồn tại $y$:
        $ x - 1 <= (10 - x)/2 <=> 2x - 2 <= 10 - x <=> 3x <= 12 <=> x <= 4 $
        Đẳng thức $x = 4$ xảy ra khi $y = 3$ (tại $M(4; 3)$).
        
        #step([Đếm số giá trị nguyên dương của m])
        Để hệ có nghiệm thì $m <= 4$.
        Vì $m in ZZ^+$ nên $m in {1; 2; 3; 4}$. Có tất cả $4$ giá trị thỏa mãn.
    ]
)

// TLN 4 (Câu 20): Tham số m để hệ có nghiệm duy nhất
#tln([Tìm giá trị của tham số $m$ để hệ bất phương trình $cases(x + y <= 5, x >= 2, y >= m)$ có đúng MỘT nghiệm duy nhất.],
    [3],
    loigiai: [
        #step([Đánh giá giá trị của y])
        Từ $x >= 2$ và $x + y <= 5 => y <= 5 - x <= 5 - 2 = 3$.
        Để hệ có nghiệm thỏa mãn $y >= m$ thì $m <= 3$.
        
        #step([Điều kiện có nghiệm duy nhất])
        Để hệ có đúng 1 nghiệm duy nhất, miền nghiệm phải co lại thành đúng một điểm biên:
        $ m = 3 $
        Khi đó nghiệm duy nhất là $(2; 3)$.
    ]
)

// TLN 5 (Câu 21): Tham số m xác định diện tích đa giác nghiệm
#tln([Cho hình vuông $O A B C$ trên mặt phẳng tọa độ với $O(0;0), A(3;0), B(3;3), C(0;3)$. Tìm giá trị nguyên của tham số $m$ ($0 < m <= 3$) để miền nghiệm của hệ bất phương trình $cases(0 <= x <= 3, 0 <= y <= 3, x + y >= m)$ là một ngũ giác có diện tích bằng $7$.],
    [2],
    loigiai: [
        #step([Phân tích diện tích ngũ giác theo phần bị cắt])
        Diện tích hình vuông $O A B C$ là $S_("hình vuông") = 3 dot 3 = 9$.
        Đường thẳng $x + y = m$ (với $0 < m <= 3$) cắt hai cạnh $O A$ và $O C$ lần lượt tại $(m; 0)$ và $(0; m)$.
        Phần không thuộc miền nghiệm là tam giác vuông cân đỉnh $O$ có hai cạnh góc vuông bằng $m$:
        $ S_("bị cắt") = 1/2 dot m dot m = m^2 / 2 $
        
        #step([Giải phương trình diện tích tìm m])
        Diện tích ngũ giác nghiệm là:
        $ S = S_("hình vuông") - S_("bị cắt") = 9 - m^2 / 2 = 7 <=> m^2 / 2 = 2 <=> m^2 = 4 $
        Vì $0 < m <= 3$ nên giá trị nguyên cần tìm là $m = 2$.
    ]
)

#pagebreak()

// TLN 6 (Câu 22): Đỉnh cao tư duy tổng hợp kẹp biến & hình học
#tln([Tìm giá trị nguyên lớn nhất của tham số $m$ để hệ bất phương trình $cases(x + 2y <= 7, 2x - y <= 4, x >= m)$ có nghiệm.],
    [3],
    loigiai: [
        #step([Đánh giá chặn trên của hoành độ x])
        Từ hệ hai bất phương trình đầu, biểu diễn $y$ theo $x$:
        $ cases(x + 2y <= 7 <=> y <= (7 - x)/2, 2x - y <= 4 <=> y >= 2x - 4) => 2x - 4 <= y <= (7 - x)/2 $
        Để tồn tại số thực $y$ thỏa mãn bất đẳng thức kẹp trên, điều kiện cần và đủ là:
        $ 2x - 4 <= (7 - x)/2 <=> 4x - 8 <= 7 - x <=> 5x <= 15 <=> x <= 3 $
        Đẳng thức $x = 3$ đạt được khi $y = 2x - 4 = 2(3) - 4 = 2$, ứng với đỉnh nhọn $M(3; 2)$ là điểm có hoành độ lớn nhất trong toàn bộ miền nghiệm của hai bất phương trình đầu:
        $ x <= 3 $

        #step([Điều kiện tham số m và hình vẽ minh họa CeTZ])
        #align(center)[
          #grid(
            columns: (auto, auto),
            gutter: 24pt,
            align: horizon,
            [
              #box(width: 175pt)[
                - Điểm có hoành độ lớn nhất trong toàn bộ miền nghiệm là đỉnh nhọn $M(3; 2)$ ($x_(max) = 3$).
                - Nửa mặt phẳng $x >= m$ biểu diễn miền phía bên phải đường thẳng đứng $x = m$.
                - Để hệ ba bất phương trình có nghiệm, đường thẳng $x = m$ phải cắt hoặc nằm bên trái điểm $M$:
                $ m <= x_(max) = 3 $
                
                - Vì $m in ZZ$ nên giá trị nguyên lớn nhất của tham số $m$ cần tìm là $m = 3$.
              ]
            ],
            [
              #cetz.canvas({
                import cetz.draw: *
                set-style(stroke: 0.8pt)
                let sc = 0.65
                let xmin = -1.2 * sc
                let xmax = 5.0 * sc
                let ymin = -1.2 * sc
                let ymax = 5.0 * sc
                
                let sx(x) = x * sc
                let sy(y) = y * sc
                
                // Lưới tọa độ nhạt
                for x in range(-1, 6) {
                    line((sx(x), ymin), (sx(x), ymax), stroke: 0.25pt + rgb("e2e8f0"))
                }
                for y in range(-1, 6) {
                    line((xmin, sy(y)), (xmax, sy(y)), stroke: 0.25pt + rgb("e2e8f0"))
                }
                
                // Miền nghiệm xanh nhạt
                fill(rgb("eff6ff"))
                stroke(none)
                line((sx(-1.2), ymin), (sx(0.5), ymin), (sx(3), sy(2)), (sx(-1.2), sy(4.1)), close: true)
                
                // Hệ trục Oxy
                line((xmin - 0.2, 0), (xmax + 0.3, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt)
                content((xmax + 0.45, 0), [$x$])
                line((0, ymin - 0.2), (0, ymax + 0.3), mark: (end: "stealth", fill: black), stroke: 0.8pt)
                content((0, ymax + 0.45), [$y$])
                content((-0.2, -0.2), [$O$])
                
                // Đường d1: x + 2y = 7
                line((sx(-1), sy(4)), (sx(5), sy(1)), stroke: 1.1pt + rgb("2563eb"))
                content((sx(4.5), sy(0.6)), text(fill: rgb("2563eb"), weight: "bold", size: 7.5pt)[$d_1$])
                
                // Đường d2: 2x - y = 4
                line((sx(1), sy(-2)), (sx(4.5), sy(5)), stroke: 1.1pt + rgb("059669"))
                content((sx(4.2), sy(4.6)), text(fill: rgb("059669"), weight: "bold", size: 7.5pt)[$d_2$])
                
                // Đường thẳng x = 3
                line((sx(3), ymin), (sx(3), ymax), stroke: (paint: rgb("dc2626"), dash: "dashed", thickness: 0.9pt))
                content((sx(3) - 0.5, sy(4.6)), text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$x = 3$])
                
                // Gióng tọa độ
                line((sx(3), 0), (sx(3), sy(2)), stroke: (paint: luma(120), thickness: 0.45pt, dash: "densely-dashed"))
                line((0, sy(2)), (sx(3), sy(2)), stroke: (paint: luma(120), thickness: 0.45pt, dash: "densely-dashed"))
                
                // Đỉnh M(3; 2)
                circle((sx(3), sy(2)), radius: 2.3pt, fill: rgb("dc2626"), stroke: black)
                content((sx(3) + 0.75, sy(2) + 0.2), text(fill: rgb("dc2626"), weight: "bold", size: 8pt)[$M(3; 2)$])
              })
            ]
          )
        ]
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
