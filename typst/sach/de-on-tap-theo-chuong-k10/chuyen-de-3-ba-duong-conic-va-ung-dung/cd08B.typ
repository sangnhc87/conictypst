#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("059669") // Emerald cho Đề 8B

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BA ĐƯỜNG CONIC & ỨNG DỤNG",
  exam-title: "BÀI 2: BÁN KÍNH QUA TIÊU VÀ TÍNH CHẤT HÌNH HỌC (ĐỀ B - TIẾP TUYẾN CONIC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "323",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Phương trình tiếp tuyến của elip $(E): x^2 / a^2 + y^2 / b^2 = 1$ tại điểm $M_0(x_0, y_0)$ thuộc elip là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Axes
    line((-2.8, 0), (2.8, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -1.8), (0, 1.8), mark: (end: "stealth"), stroke: 0.8pt)
    // Ellipse
    circle((0, 0), radius: (2.0, 1.2), stroke: 1.5pt + rgb("059669"))
    // Point M0
    circle((1.4, 0.85), radius: 0.08, fill: rgb("dc2626"))
    content((1.4, 1.1), text(size: 7.5pt, weight: "bold")[$M_0(x_0, y_0)$])
    // Tangent line at M0
    line((0.2, 1.8), (2.6, -0.1), stroke: 1.2pt + rgb("dc2626"))
    content((2.8, 0.2), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold")[$d$])
  })
]
],
    (
        True([$(x_0 x) / a^2 + (y_0 y) / b^2 = 1$]),
        [$(x_0 x) / a + (y_0 y) / b = 1$],
        [$(x_0 x) / a^2 - (y_0 y) / b^2 = 1$],
        [$(x x_0) / b^2 + (y y_0) / a^2 = 1$]
    ),
    loigiai: [
        #step([Phương trình tiếp tuyến của Elip])
        Tiếp tuyến của elip $x^2 / a^2 + y^2 / b^2 = 1$ tại điểm $M_0(x_0, y_0) in (E)$ có phương trình phân đôi tọa độ là:
        $ (x_0 x) / a^2 + (y_0 y) / b^2 = 1 $
    ]
)

// TN 2
#tn([Phương trình tiếp tuyến của hypebol $(H): x^2 / a^2 - y^2 / b^2 = 1$ tại điểm $M_0(x_0, y_0)$ thuộc hypebol là],
    (
        True([$(x_0 x) / a^2 - (y_0 y) / b^2 = 1$]),
        [$(x_0 x) / a^2 + (y_0 y) / b^2 = 1$],
        [$(x_0 x) / a - (y_0 y) / b = 1$],
        [$(x_0 x) / a^2 - (y_0 y) / b^2 = 0$]
    ),
    loigiai: [
        #step([Phương trình tiếp tuyến của Hypebol])
        Tương tự elip, tiếp tuyến tại $M_0(x_0, y_0) in (H)$ có phương trình là $(x_0 x) / a^2 - (y_0 y) / b^2 = 1$.
    ]
)

// TN 3
#tn([Phương trình tiếp tuyến của parabol $(P): y^2 = 2 p x$ tại điểm $M_0(x_0, y_0)$ thuộc parabol là],
    (
        True([$y_0 y = p(x + x_0)$]),
        [$y_0 y = 2 p(x + x_0)$],
        [$y_0 y = p(x - x_0)$],
        [$x_0 x = p(y + y_0)$]
    ),
    loigiai: [
        #step([Phương trình tiếp tuyến của Parabol])
        Dùng quy tắc phân đôi tọa độ cho $y^2 = 2 p x$: thay $y^2 -> y_0 y$ và $2 x -> x + x_0$, ta được tiếp tuyến:
        $ y_0 y = p(x + x_0) $
    ]
)

// TN 4
#tn([Tiếp tuyến tại đỉnh $A_2(a, 0)$ của elip $(E): x^2 / a^2 + y^2 / b^2 = 1$ có phương trình là],
    (
        True([$x = a$]),
        [$x = -a$],
        [$y = b$],
        [$y = 0$]
    ),
    loigiai: [
        #step([Xác định tiếp tuyến tại đỉnh])
        Thay $x_0 = a, y_0 = 0$ vào phương trình tiếp tuyến:
        $ (a x) / a^2 + (0 y) / b^2 = 1 <=> x / a = 1 <=> x = a $
    ]
)

// TN 5
#tn([Phương trình tiếp tuyến của parabol $(P): y^2 = 4 x$ tại điểm $M(1, 2)$ là],
    (
        True([$x - y + 1 = 0$]),
        [$x + y - 3 = 0$],
        [$2 x - y = 0$],
        [$x - 2 y + 3 = 0$]
    ),
    loigiai: [
        #step([Lập phương trình tiếp tuyến])
        Ta có $2 p = 4 => p = 2$.
        Thay $x_0 = 1, y_0 = 2$ vào công thức $y_0 y = p(x + x_0)$:
        $ 2 y = 2(x + 1) <=> y = x + 1 <=> x - y + 1 = 0 $
    ]
)

// TN 6
#tn([Điều kiện cần và đủ để đường thẳng $Delta: A x + B y + C = 0$ tiếp xúc với elip $(E): x^2 / a^2 + y^2 / b^2 = 1$ là],
    (
        True([$A^2 a^2 + B^2 b^2 = C^2$]),
        [$A^2 a^2 - B^2 b^2 = C^2$],
        [$A a^2 + B b^2 = C^2$],
        [$A^2 / a^2 + B^2 / b^2 = C^2$]
    ),
    loigiai: [
        #step([Điều kiện tiếp xúc của đường thẳng với Elip])
        Đường thẳng $A x + B y + C = 0$ tiếp xúc với elip $x^2 / a^2 + y^2 / b^2 = 1$ khi và chỉ khi:
        $ A^2 a^2 + B^2 b^2 = C^2 $
    ]
)

// TN 7
#tn([Cho elip $(E): x^2 / 25 + y^2 / 9 = 1$. Phương trình tiếp tuyến của $(E)$ tại điểm $M(0, 3)$ là],
    (
        True([$y = 3$]),
        [$y = -3$],
        [$x = 5$],
        [$3 x + 5 y = 15$]
    ),
    loigiai: [
        #step([Tiếp tuyến tại đỉnh trục nhỏ])
        Thay $x_0 = 0, y_0 = 3$:
        $ (0 x) / 25 + (3 y) / 9 = 1 <=> y / 3 = 1 <=> y = 3 $
    ]
)

// TN 8
#tn([Cho parabol $(P): y^2 = 8 x$. Hệ số góc $k$ của tiếp tuyến với $(P)$ tại điểm $M(2, 4)$ bằng],
    (
        True([$1$]),
        [$2$],
        [$1 / 2$],
        [$4$]
    ),
    loigiai: [
        #step([Tính hệ số góc tiếp tuyến])
        Phương trình tiếp tuyến: $y_0 y = p(x + x_0)$ với $p = 4, x_0 = 2, y_0 = 4$:
        $ 4 y = 4(x + 2) <=> y = x + 2 $
        Hệ số góc của tiếp tuyến là $k = 1$.
    ]
)

// TN 9
#tn([Đường thẳng $d: 3 x - 4 y + C = 0$ tiếp xúc với elip $(E): x^2 / 16 + y^2 / 9 = 1$. Giá trị của $C^2$ bằng],
    (
        True([$288$]),
        [$144$],
        [$72$],
        [$576$]
    ),
    loigiai: [
        #step([Áp dụng điều kiện tiếp xúc])
        $A = 3, B = -4, a^2 = 16, b^2 = 9$.
        $ C^2 = A^2 a^2 + B^2 b^2 = 3^2 times 16 + (-4)^2 times 9 = 9 times 16 + 16 times 9 = 144 + 144 = 288 $
    ]
)

// TN 10
#tn([Phương trình tiếp tuyến của hypebol $(H): x^2 / 16 - y^2 / 9 = 1$ tại điểm $M(5, 9 / 4)$ là],
    (
        True([$5 x - 4 y - 16 = 0$]),
        [$5 x + 4 y - 16 = 0$],
        [$4 x - 5 y - 16 = 0$],
        [$5 x - 4 y + 16 = 0$]
    ),
    loigiai: [
        #step([Lập phương trình tiếp tuyến của hypebol])
        Thay $x_0 = 5, y_0 = 9 / 4$:
        $ (5 x) / 16 - ((9 / 4) y) / 9 = 1 <=> (5 x) / 16 - y / 4 = 1 $
        Nhân cả hai vế với $16$:
        $ 5 x - 4 y = 16 <=> 5 x - 4 y - 16 = 0 $
    ]
)

// TN 11
#tn([Tiếp tuyến của parabol $(P): y^2 = 6 x$ tại đỉnh $O(0, 0)$ là đường thẳng nào sau đây?],
    (
        True([Trục tung $x = 0$]),
        [Trục hoành $y = 0$],
        [Đường thẳng $x + y = 0$],
        [Đường thẳng $x = 3$]
    ),
    loigiai: [
        #step([Tiếp tuyến tại đỉnh của parabol])
        Tại đỉnh $O(0, 0)$, tiếp tuyến của parabol $y^2 = 2 p x$ chính là trục tung có phương trình $x = 0$.
    ]
)

// TN 12
#tn([Tiếp tuyến của elip $(E): x^2 / 4 + y^2 = 1$ song song với đường thẳng $x + y = 0$ có phương trình là],
    (
        True([$x + y plus.minus sqrt(5) = 0$]),
        [$x + y plus.minus 5 = 0$],
        [$x + y plus.minus sqrt(3) = 0$],
        [$x + y plus.minus 2 = 0$]
    ),
    loigiai: [
        #step([Tìm tiếp tuyến song song])
        Đường thẳng song song có dạng $d: x + y + C = 0$ ($A = 1, B = 1$).
        Điều kiện tiếp xúc với elip $a^2 = 4, b^2 = 1$:
        $ C^2 = A^2 a^2 + B^2 b^2 = 1^2 times 4 + 1^2 times 1 = 5 <=> C = plus.minus sqrt(5) $
        Phương trình là $x + y plus.minus sqrt(5) = 0$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Cho elip $(E): x^2 / 16 + y^2 / 9 = 1$ và điểm $M(0, 3)$ thuộc $(E)$.],
  (
    True([Điểm $M$ là đỉnh của elip nằm trên trục tung.]),
    True([Tiếp tuyến $d$ của elip tại điểm $M$ song song với trục hoành $O x$.]),
    True([Phương trình của tiếp tuyến $d$ là $y - 3 = 0$.]),
    [Khoảng cách từ gốc tọa độ $O$ đến tiếp tuyến $d$ bằng $4$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    $M(0, 3)$ thỏa mãn $x_0 = 0, y_0 = 3 = b$ nên $M$ là đỉnh trên trục tung (Ý a ĐÚNG).
    Phương trình tiếp tuyến tại $M$: $(0 x) / 16 + (3 y) / 9 = 1 <=> y / 3 = 1 <=> y = 3 <=> y - 3 = 0$ (Ý c ĐÚNG).
    Đường thẳng $y = 3$ song song với trục hoành $O x$ (Ý b ĐÚNG).

    #step([Xét ý d])
    Khoảng cách từ $O(0, 0)$ đến tiếp tuyến $y = 3$ là $d(O, d) = |0 - 3| = 3 != 4$.
    Do đó ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Cho parabol $(P): y^2 = 4 x$ và điểm $M(4, 4)$ nằm trên parabol.],
  (
    True([Tham số tiêu của parabol là $p = 2$.]),
    True([Phương trình tiếp tuyến $d$ của $(P)$ tại $M$ là $x - 2 y + 4 = 0$.]),
    True([Tiếp tuyến $d$ cắt trục hoành tại điểm $T(-4, 0)$.]),
    [Tiếp tuyến $d$ tạo với hai trục tọa độ một tam giác vuông có diện tích bằng $8$.]
  ),
  loigiai: [
    #step([Xét ý a])
    $2 p = 4 => p = 2$ (Ý a ĐÚNG).

    #step([Xét ý b])
    Tiếp tuyến tại $M(4, 4)$:
    $ 4 y = 2(x + 4) <=> 2 y = x + 4 <=> x - 2 y + 4 = 0 $ (Ý b ĐÚNG).

    #step([Xét ý c])
    Giao điểm với $O x$ ($y = 0$): $x + 4 = 0 => x = -4 => T(-4, 0)$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Giao điểm với $O y$ ($x = 0$): $-2 y + 4 = 0 => y = 2 => Y(0, 2)$.
    Diện tích tam giác vuông $O T Y$:
    $ S = 1 / 2 times |x_T| times |y_Y| = 1 / 2 times 4 times 2 = 4 != 8 $.
    Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Cho hypebol $(H): x^2 / 9 - y^2 / 16 = 1$ và điểm $M(5, 16 / 3)$ thuộc $(H)$.],
  (
    True([Bán trục thực $a = 3$, bán trục ảo $b = 4$.]),
    True([Phương trình tiếp tuyến $d$ của $(H)$ tại $M$ là $5 x - 3 y - 9 = 0$.]),
    True([Hệ số góc của tiếp tuyến $d$ là $k = 5 / 3$.]),
    [Tiếp tuyến $d$ đi qua gốc tọa độ $O(0, 0)$.]
  ),
  loigiai: [
    #step([Xét ý a])
    $a = 3, b = 4$ (Ý a ĐÚNG).

    #step([Xét ý b và c])
    Phương trình tiếp tuyến tại $M$:
    $ (5 x) / 9 - ((16 / 3) y) / 16 = 1 <=> (5 x) / 9 - y / 3 = 1 <=> 5 x - 3 y - 9 = 0 $ (Ý b ĐÚNG).
    Hệ số góc: $3 y = 5 x - 9 => y = (5 / 3) x - 3 => k = 5 / 3$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Thay $O(0, 0)$ vào tiếp tuyến: $5(0) - 3(0) - 9 = -9 != 0$.
    Tiếp tuyến không đi qua gốc tọa độ. Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Cho parabol $(P): y^2 = 8 x$ và đường thẳng $Delta: 2 x - y + 1 = 0$.],
  (
    True([Tham số tiêu của parabol là $p = 4$.]),
    True([Đường thẳng $Delta$ tiếp xúc với parabol $(P)$.]),
    True([Tọa độ tiếp điểm là $M(1 / 2, 2)$.]),
    [Khoảng cách từ tiêu điểm $F$ của $(P)$ đến đường thẳng $Delta$ bằng $0$.]
  ),
  loigiai: [
    #step([Xét ý a])
    $2 p = 8 => p = 4$ (Ý a ĐÚNG).

    #step([Xét ý b])
    Đường thẳng $2 x - y + 1 = 0$ có $A = 2, B = -1, C = 1$.
    Điều kiện tiếp xúc với parabol:
    $ p B^2 = 2 A C <=> 4 times (-1)^2 = 2 times 2 times 1 <=> 4 = 4 $ (thỏa mãn).
    Vậy $Delta$ tiếp xúc với $(P)$ (Ý b ĐÚNG).

    #step([Xét ý c])
    Từ $y = 2 x + 1$, thay vào parabol:
    $ (2 x + 1)^2 = 8 x <=> 4 x^2 + 4 x + 1 = 8 x <=> 4 x^2 - 4 x + 1 = 0 <=> (2 x - 1)^2 = 0 $
    $ <=> x = 1 / 2 => y = 2(1 / 2) + 1 = 2 $. Tiếp điểm $M(1 / 2, 2)$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Tiêu điểm $F(p / 2, 0) = F(2, 0)$.
    Khoảng cách từ $F$ đến $Delta$:
    $ d(F, Delta) = |2(2) - 0 + 1| / sqrt(2^2 + (-1)^2) = 5 / sqrt(5) = sqrt(5) > 0 $.
    Khoảng cách bằng $sqrt(5) != 0$. Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Tính hệ số góc $k$ của tiếp tuyến với parabol $(P): y^2 = 12 x$ tại điểm $M(3, 6)$.],
    [1],
    loigiai: [
        #step([Viết phương trình tiếp tuyến và tìm k])
        $2 p = 12 => p = 6$.
        Tiếp tuyến tại $M(3, 6)$ là:
        $ 6 y = 6(x + 3) <=> y = x + 3 $
        Hệ số góc của tiếp tuyến là $k = 1$.
    ]
)

// TLN 2 (Câu 18)
#tln([Tìm giá trị dương của $C$ để đường thẳng $x + 2 y + C = 0$ tiếp xúc với elip $x^2 / 8 + y^2 / 2 = 1$.],
    [4],
    loigiai: [
        #step([Áp dụng điều kiện tiếp xúc])
        $A = 1, B = 2, a^2 = 8, b^2 = 2$.
        Điều kiện tiếp xúc:
        $ C^2 = A^2 a^2 + B^2 b^2 = 1^2 times 8 + 2^2 times 2 = 8 + 8 = 16 $
        Vì $C > 0$ nên $C = 4$.
    ]
)

// TLN 3 (Câu 19)
#tln([Cho elip $(E): x^2 / 25 + y^2 / 16 = 1$. Tiếp tuyến của $(E)$ tại đỉnh $A_2(5, 0)$ và tiếp tuyến tại đỉnh $B_2(0, 4)$ cắt nhau tại điểm $I$. Tính giá trị của biểu thức $T = O I^2$, trong đó $O$ là gốc tọa độ.],
    [41],
    loigiai: [
        #step([Tìm tọa độ điểm I])
        - Tiếp tuyến tại $A_2(5, 0)$ là $x = 5$.
        - Tiếp tuyến tại $B_2(0, 4)$ là $y = 4$.
        Hai tiếp tuyến cắt nhau tại $I(5, 4)$.
        #step([Tính OI^2])
        $ O I^2 = 5^2 + 4^2 = 25 + 16 = 41 $
    ]
)

// TLN 4 (Câu 20)
#tln([Hypebol $(H): x^2 / 16 - y^2 / 9 = 1$ có bao nhiêu tiếp tuyến đi qua gốc tọa độ $O(0, 0)$?],
    [0],
    loigiai: [
        #step([Nhận xét về tâm đối xứng])
        Gốc tọa độ $O(0, 0)$ là tâm đối xứng của hypebol. Mọi đường thẳng đi qua $O$ nếu cắt hypebol sẽ cắt tại hai điểm đối xứng hoặc không cắt (tiệm cận), không thể tiếp xúc. Do đó không có tiếp tuyến nào đi qua gốc $O$ (số tiếp tuyến là $0$).
    ]
)

// TLN 5 (Câu 21)
#tln([Cho parabol $(P): y^2 = 4 x$. Tiếp tuyến của $(P)$ tại điểm $M(1, 2)$ cắt trục hoành tại điểm $T$. Tính hoành độ của điểm $T$.],
    [-1],
    loigiai: [
        #step([Lập phương trình tiếp tuyến và tìm giao điểm])
        $p = 2$. Tiếp tuyến tại $M(1, 2)$ là:
        $ 2 y = 2(x + 1) <=> y = x + 1 $
        Giao điểm với trục hoành ($y = 0$):
        $ 0 = x + 1 <=> x = -1 $
        Vậy hoành độ của điểm $T$ là $-1$.
    ]
)

// TLN 6 (Câu 22)
#tln([Tìm giá trị của $m > 0$ sao cho đường thẳng $y = x + m$ tiếp xúc với parabol $(P): y^2 = 4 x$.],
    [1],
    loigiai: [
        #step([Thiết lập phương trình hoành độ giao điểm])
        Thay $y = x + m$ vào phương trình parabol:
        $ (x + m)^2 = 4 x <=> x^2 + 2 m x + m^2 = 4 x <=> x^2 + 2(m - 2) x + m^2 = 0 $
        #step([Điều kiện tiếp xúc])
        Đường thẳng tiếp xúc parabol khi và chỉ khi phương trình có nghiệm kép ($Delta' = 0$):
        $ Delta' = (m - 2)^2 - m^2 = m^2 - 4 m + 4 - m^2 = -4 m + 4 = 0 <=> m = 1 $
    ]
)

] // end make-questions

#make-questions()
