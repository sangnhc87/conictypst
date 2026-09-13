#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0d9488") // Teal cho Đề 7B

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BA ĐƯỜNG CONIC & ỨNG DỤNG",
  exam-title: "BÀI 1: BA ĐƯỜNG CONIC VÀ ĐỊNH NGHĨA TỔNG QUÁT (ĐỀ B - PHƯƠNG TRÌNH CONIC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "320",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong mặt phẳng tọa độ $O x y$, parabol $(P)$ có đỉnh tại gốc tọa độ $O(0, 0)$, trục đối xứng là $O x$ và tiêu điểm $F(3, 0)$. Phương trình chính tắc của parabol $(P)$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Directrix
    line((-1.5, -2.0), (-1.5, 2.0), stroke: (paint: rgb("0d9488"), dash: "dashed", thickness: 1.2pt))
    content((-1.5, 2.2), text(size: 7.5pt, fill: rgb("0d9488"))[$x = -3$])
    // Axes
    line((-2.2, 0), (3.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -2.0), (0, 2.0), mark: (end: "stealth"), stroke: 0.8pt)
    content((3.7, 0), [$x$], anchor: "west")
    content((0, 2.2), [$y$], anchor: "south")
    // Focus F(1.5, 0) in canvas coords
    circle((1.5, 0), radius: 0.08, fill: rgb("0d9488"))
    content((1.5, -0.3), text(size: 7.5pt, weight: "bold")[$F(3, 0)$])
    // Parabola y^2 = 4*1.5*x = 6x in scale
    // x = y^2 / 6
    let pts = ()
    for i in range(-18, 19) {
      let y = i * 0.1
      let x = (y * y) / 2.5
      pts.push((x, y))
    }
    line(..pts, stroke: 1.5pt + rgb("0d9488"))
  })
]
],
    (
        True([$y^2 = 12 x$]),
        [$y^2 = 6 x$],
        [$y^2 = 3 x$],
        [$x^2 = 12 y$]
    ),
    loigiai: [
        #step([Xác định tham số tiêu p])
        Tiêu điểm $F(p / 2, 0) = F(3, 0) => p / 2 = 3 => p = 6$.
        Phương trình chính tắc của parabol là:
        $ y^2 = 2 p x = 2 times 6 x = 12 x $
    ]
)

// TN 2
#tn([Parabol $(P)$ có đường chuẩn là đường thẳng $x = -5$. Phương trình chính tắc của $(P)$ là],
    (
        True([$y^2 = 20 x$]),
        [$y^2 = 10 x$],
        [$y^2 = 5 x$],
        [$x^2 = 20 y$]
    ),
    loigiai: [
        #step([Tìm tham số tiêu p])
        Đường chuẩn có phương trình $x = -p / 2 = -5 => p = 10$.
        Phương trình chính tắc là $y^2 = 2 p x = 20 x$.
    ]
)

// TN 3
#tn([Parabol $(P): y^2 = 2 p x$ đi qua điểm $A(2, 4)$. Giá trị của tham số tiêu $p$ là],
    (
        True([$4$]),
        [$2$],
        [$8$],
        [$1$]
    ),
    loigiai: [
        #step([Thay tọa độ điểm A vào phương trình])
        Thay $x = 2, y = 4$ vào $y^2 = 2 p x$:
        $ 4^2 = 2 p times 2 <=> 16 = 4 p <=> p = 4 $
    ]
)

// TN 4
#tn([Một elip $(E)$ có tâm sai $e = 1 / 2$ và một đường chuẩn có phương trình $x = 8$. Độ dài bán trục lớn $a$ của elip bằng],
    (
        True([$4$]),
        [$2$],
        [$16$],
        [$8$]
    ),
    loigiai: [
        #step([Tính bán trục lớn a])
        Đường chuẩn của elip có dạng $x = a / e = 8$.
        Suy ra $a = 8 e = 8 times (1 / 2) = 4$.
    ]
)

// TN 5
#tn([Một elip $(E)$ có tiêu cự $2 c = 8$ và khoảng cách giữa hai đường chuẩn bằng $16$. Giá trị $a^2$ của elip bằng],
    (
        True([$32$]),
        [$16$],
        [$64$],
        [$8$]
    ),
    loigiai: [
        #step([Lập phương trình liên hệ])
        Ta có $2 c = 8 => c = 4$.
        Khoảng cách giữa hai đường chuẩn là:
        $ d(Delta_1, Delta_2) = (2 a^2) / c = 16 <=> (2 a^2) / 4 = 16 <=> a^2 = 32 $
    ]
)

// TN 6
#tn([Một hypebol $(H)$ có một tiêu điểm $F(5, 0)$ và một đường chuẩn tương ứng $x = 16 / 5$. Phương trình chính tắc của $(H)$ là],
    (
        True([$x^2 / 16 - y^2 / 9 = 1$]),
        [$x^2 / 9 - y^2 / 16 = 1$],
        [$x^2 / 25 - y^2 / 16 = 1$],
        [$x^2 / 16 - y^2 / 25 = 1$]
    ),
    loigiai: [
        #step([Tìm a và b])
        Tiêu điểm $F(c, 0) = F(5, 0) => c = 5$.
        Đường chuẩn: $a^2 / c = 16 / 5 => a^2 / 5 = 16 / 5 => a^2 = 16$.
        Trong hypebol: $b^2 = c^2 - a^2 = 25 - 16 = 9$.
        Phương trình chính tắc là $x^2 / 16 - y^2 / 9 = 1$.
    ]
)

// TN 7
#tn([Phương trình chính tắc của parabol đi qua điểm $M(1, -2)$ là],
    (
        True([$y^2 = 4 x$]),
        [$y^2 = 2 x$],
        [$y^2 = -4 x$],
        [$x^2 = -y$]
    ),
    loigiai: [
        #step([Tìm phương trình chính tắc])
        Phương trình có dạng $y^2 = 2 p x$. Điểm $M(1, -2)$ thuộc parabol nên:
        $ (-2)^2 = 2 p times 1 <=> 4 = 2 p <=> 2 p = 4 $
        Vậy phương trình là $y^2 = 4 x$.
    ]
)

// TN 8
#tn([Cho elip $(E): x^2 / 100 + y^2 / 36 = 1$. Khoảng cách từ gốc tọa độ $O$ đến một trong hai đường chuẩn của $(E)$ bằng],
    (
        True([$12.5$]),
        [$10$],
        [$8$],
        [$15$]
    ),
    loigiai: [
        #step([Tính khoảng cách từ gốc O đến đường chuẩn])
        $a^2 = 100 => a = 10$, $b^2 = 36 => c = sqrt(100 - 36) = 8$.
        Đường chuẩn có phương trình $x = plus.minus a^2 / c = plus.minus 100 / 8 = plus.minus 12.5$.
        Khoảng cách từ $O(0, 0)$ đến đường chuẩn là $d = 12.5$.
    ]
)

// TN 9
#tn([Một hypebol có tâm sai $e = sqrt(2)$ được gọi là hypebol vuông (hypebol đều). Khi đó, tỉ số giữa độ dài trục ảo và trục thực $b / a$ bằng],
    (
        True([$1$]),
        [$sqrt(2)$],
        [$1 / 2$],
        [$2$]
    ),
    loigiai: [
        #step([Tính tỉ số b/a của Hypebol vuông])
        Ta có $e = c / a = sqrt(2) => c^2 = 2 a^2$.
        Mặt khác $c^2 = a^2 + b^2 => 2 a^2 = a^2 + b^2 => b^2 = a^2 => b = a$.
        Do đó tỉ số $b / a = 1$.
    ]
)

// TN 10
#tn([Phương trình của đường conic có tiêu điểm $F(1, 1)$, đường chuẩn $x + y - 1 = 0$ và tâm sai $e = 1$ là],
    (
        True([$(x - 1)^2 + (y - 1)^2 = (x + y - 1)^2 / 2$]),
        [$(x - 1)^2 + (y - 1)^2 = (x + y - 1)^2$],
        [$(x + 1)^2 + (y + 1)^2 = (x + y - 1)^2 / 2$],
        [$(x - 1)^2 + (y - 1)^2 = 2(x + y - 1)^2$]
    ),
    loigiai: [
        #step([Áp dụng định nghĩa tổng quát])
        Điểm $M(x, y)$ thuộc conic khi:
        $ (M F) / (d(M, Delta)) = e = 1 <=> M F^2 = d(M, Delta)^2 $
        $ (x - 1)^2 + (y - 1)^2 = ((x + y - 1) / (sqrt(1^2 + 1^2)))^2 = (x + y - 1)^2 / 2 $
    ]
)

// TN 11
#tn([Điểm $M(x_0, y_0)$ nằm trên parabol $(P): y^2 = 16 x$ có bán kính qua tiêu $M F = 9$. Hoành độ $x_0$ của điểm $M$ bằng],
    (
        True([$5$]),
        [$4$],
        [$9$],
        [$1$]
    ),
    loigiai: [
        #step([Sử dụng công thức bán kính qua tiêu])
        Với parabol $y^2 = 2 p x = 16 x => p = 8$.
        Bán kính qua tiêu của parabol là:
        $ M F = x_0 + p / 2 = x_0 + 4 $
        Theo đề bài $x_0 + 4 = 9 => x_0 = 5$.
    ]
)

// TN 12
#tn([Một elip có hai đường chuẩn là $x = -25 / 4$ và $x = 25 / 4$, hai tiêu điểm là $F_1(-4, 0)$ và $F_2(4, 0)$. Phương trình chính tắc của elip là],
    (
        True([$x^2 / 25 + y^2 / 9 = 1$]),
        [$x^2 / 25 + y^2 / 16 = 1$],
        [$x^2 / 16 + y^2 / 9 = 1$],
        [$x^2 / 36 + y^2 / 20 = 1$]
    ),
    loigiai: [
        #step([Xác định các thông số của Elip])
        Ta có $c = 4$. Đường chuẩn $a^2 / c = 25 / 4 => a^2 / 4 = 25 / 4 => a^2 = 25$.
        $ b^2 = a^2 - c^2 = 25 - 16 = 9 $.
        Phương trình chính tắc là $x^2 / 25 + y^2 / 9 = 1$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Trong mặt phẳng tọa độ $O x y$, cho parabol $(P)$ có đỉnh tại gốc tọa độ $O(0, 0)$, trục đối xứng là trục hoành và đi qua điểm $M(2, 4)$.],
  (
    True([Phương trình chính tắc của parabol là $y^2 = 8 x$.]),
    True([Tham số tiêu của parabol là $p = 4$.]),
    True([Tọa độ tiêu điểm của parabol là $F(2, 0)$.]),
    [Khoảng cách từ điểm $M$ đến đường chuẩn của parabol bằng $6$.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    $y^2 = 2 p x$. Điểm $M(2, 4) in (P) => 4^2 = 2 p times 2 <=> 16 = 4 p => p = 4$.
    Phương trình là $y^2 = 8 x$ (Ý a và b ĐÚNG).

    #step([Xét ý c])
    Tiêu điểm $F(p / 2, 0) = F(2, 0)$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Đường chuẩn là $Delta: x = -p / 2 = -2$.
    Khoảng cách từ $M(2, 4)$ đến đường chuẩn là:
    $ d(M, Delta) = |2 - (-2)| = 4 $.
    Khoảng cách bằng $4$, không phải $6$. Do đó ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Cho elip $(E)$ có tiêu cự $2 c = 6$ và khoảng cách giữa hai đường chuẩn bằng $50 / 3$.],
  (
    True([Tiêu cự $2 c = 6 => c = 3$.]),
    True([Bán trục lớn của elip là $a = 5$.]),
    True([Bán trục nhỏ của elip là $b = 4$.]),
    [Tâm sai của elip là $e = 4 / 5$.]
  ),
  loigiai: [
    #step([Xét ý a])
    $2 c = 6 => c = 3$ (Ý a ĐÚNG).

    #step([Xét ý b và c])
    Khoảng cách hai đường chuẩn:
    $ (2 a^2) / c = 50 / 3 <=> (2 a^2) / 3 = 50 / 3 <=> 2 a^2 = 50 <=> a^2 = 25 => a = 5 $.
    $ b^2 = a^2 - c^2 = 25 - 9 = 16 => b = 4 $.
    (Ý b và c ĐÚNG).

    #step([Xét ý d])
    Tâm sai $e = c / a = 3 / 5 = 0.6 != 4 / 5$.
    Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Cho hypebol $(H)$ có hai đường chuẩn là $x = -4$ và $x = 4$, đồng thời có tâm sai $e = 1.5$.],
  (
    True([Bán trục thực của hypebol là $a = 6$.]),
    True([Tiêu cự của hypebol là $2 c = 18$.]),
    True([Bán trục ảo của hypebol thỏa mãn $b^2 = 45$.]),
    [Phương trình chính tắc của hypebol là $x^2 / 36 - y^2 / 45 = -1$.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    Đường chuẩn $a / e = 4 => a = 4 e = 4 times 1.5 = 6$ (Ý a ĐÚNG).
    $c = e a = 1.5 times 6 = 9 => 2 c = 18$ (Ý b ĐÚNG).

    #step([Xét ý c])
    $b^2 = c^2 - a^2 = 9^2 - 6^2 = 81 - 36 = 45$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Phương trình chính tắc của hypebol phải có vế phải bằng $+1$:
    $ x^2 / 36 - y^2 / 45 = 1 $.
    Phương trình với $-1$ là sai. Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Trong mặt phẳng tọa độ $O x y$, cho điểm $F(0, 2)$ và đường thẳng $Delta: y + 2 = 0$. Xét tập hợp tất cả các điểm $M(x, y)$ thỏa mãn khoảng cách $d(M, F) = d(M, Delta)$.],
  (
    True([Tập hợp điểm $M$ là một đường parabol.]),
    True([Đỉnh của parabol này là gốc tọa độ $O(0, 0)$.]),
    True([Trục đối xứng của parabol này là trục tung $O y$.]),
    [Phương trình của parabol là $y^2 = 8 x$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    $d(M, F) = d(M, Delta)$ với $F(0, 2) in O y$ và $Delta: y = -2$ vuông góc với $O y$.
    Theo định nghĩa, tập hợp điểm $M$ là parabol có tiêu điểm trên $O y$, đỉnh tại trung điểm của $F$ và hình chiếu của nó lên $Delta$, tức gốc $O(0, 0)$. Trục đối xứng là $O y$ (Ý a, b, c ĐÚNG).

    #step([Xét ý d])
    Thiết lập phương trình:
    $ sqrt(x^2 + (y - 2)^2) = |y + 2| <=> x^2 + (y - 2)^2 = (y + 2)^2 $
    $ <=> x^2 + y^2 - 4 y + 4 = y^2 + 4 y + 4 <=> x^2 = 8 y $.
    Phương trình đúng là $x^2 = 8 y$, không phải $y^2 = 8 x$. Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Tính tham số tiêu $p$ của một parabol biết khoảng cách từ tiêu điểm đến đường chuẩn của nó bằng $8$.],
    [8],
    loigiai: [
        #step([Ý nghĩa hình học của tham số tiêu])
        Tiêu điểm là $F(p / 2, 0)$, đường chuẩn là $x = -p / 2$.
        Khoảng cách giữa tiêu điểm và đường chuẩn là:
        $ d(F, Delta) = p / 2 - (-p / 2) = p $
        Do đó $p = 8$.
    ]
)

// TLN 2 (Câu 18)
#tln([Một elip có bán trục lớn $a = 6$ và phương trình một đường chuẩn là $x = 9$. Tính giá trị $b^2$ (bình phương bán trục bé) của elip này.],
    [20],
    loigiai: [
        #step([Tìm c và b^2])
        Đường chuẩn: $a^2 / c = 9 <=> 36 / c = 9 <=> c = 4$.
        Ta có hệ thức:
        $ b^2 = a^2 - c^2 = 36 - 16 = 20 $
    ]
)

// TLN 3 (Câu 19)
#tln([Cho parabol $(P): y^2 = 12 x$. Một dây cung của parabol đi qua tiêu điểm $F$ và vuông góc với trục hoành có độ dài bằng bao nhiêu?],
    [12],
    loigiai: [
        #step([Độ dài dây cung qua tiêu (Latus Rectum)])
        $2 p = 12 => p = 6 => F(3, 0)$.
        Đường thẳng đi qua $F$ vuông góc với $O x$ có phương trình $x = 3$.
        Thay vào phương trình parabol:
        $ y^2 = 12 times 3 = 36 <=> y = plus.minus 6 $
        Hai đầu mút dây cung là $(3, 6)$ và $(3, -6)$.
        Độ dài dây cung là $6 - (-6) = 12$ (chính bằng $2 p$).
    ]
)

// TLN 4 (Câu 20)
#tln([Cho hypebol $(H): x^2 / a^2 - y^2 / b^2 = 1$ có tâm sai $e = 2$ và khoảng cách giữa hai đường chuẩn bằng $2$. Tính độ dài trục thực $2 a$ của hypebol.],
    [4],
    loigiai: [
        #step([Tính độ dài trục thực 2a])
        Khoảng cách hai đường chuẩn:
        $ (2 a^2) / c = 2 <=> a^2 / c = 1 <=> a^2 = c $
        Mặt khác $e = c / a = 2 => c = 2 a$.
        Thay vào: $a^2 = 2 a <=> a = 2$ (do $a > 0$).
        Độ dài trục thực là $2 a = 4$.
    ]
)

// TLN 5 (Câu 21)
#tln([Cho điểm $M(x_0, 6)$ thuộc parabol $(P): y^2 = 12 x$. Tính khoảng cách từ điểm $M$ đến tiêu điểm $F$ của parabol $(P)$.],
    [6],
    loigiai: [
        #step([Tìm hoành độ x0 và bán kính qua tiêu])
        Thay $y = 6$ vào phương trình parabol:
        $ 6^2 = 12 x_0 <=> 36 = 12 x_0 <=> x_0 = 3 $
        Tham số tiêu: $2 p = 12 => p = 6 => p / 2 = 3$.
        Khoảng cách từ $M$ đến $F$ là:
        $ M F = x_0 + p / 2 = 3 + 3 = 6 $
    ]
)

// TLN 6 (Câu 22)
#tln([Một elip $(E)$ có diện tích của hình chữ nhật cơ sở bằng $80$ và tiêu cự $2 c = 6$. Tính giá trị của biểu thức $T = 3 times d(Delta_1, Delta_2)$, trong đó $d(Delta_1, Delta_2)$ là khoảng cách giữa hai đường chuẩn của $(E)$.],
    [50],
    loigiai: [
        #step([Thiết lập hệ phương trình cho a và b])
        - Tiêu cự $2 c = 6 => c = 3 => a^2 - b^2 = 9$.
        - Diện tích hình chữ nhật cơ sở: $S = 2 a times 2 b = 4 a b = 80 => a b = 20$.
        #step([Giải tìm a^2])
        Ta có $b^2 = a^2 - 9$. Thay vào:
        $ a^2(a^2 - 9) = 400 <=> a^4 - 9 a^2 - 400 = 0 $
        $ <=> (a^2 - 25)(a^2 + 16) = 0 => a^2 = 25 $
        #step([Tính khoảng cách hai đường chuẩn])
        $ d(Delta_1, Delta_2) = (2 a^2) / c = (2 times 25) / 3 = 50 / 3 $
        Vậy $T = 3 times (50 / 3) = 50$.
    ]
)

] // end make-questions

#make-questions()
