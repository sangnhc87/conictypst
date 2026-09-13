#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1e40af") // Classic Blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG",
  exam-title: "BÀI 16: HÀM SỐ BẬC HAI (ĐỀ SỐ 17A - CƠ BẢN ĐẾN VẬN DỤNG)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "140",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Tọa độ đỉnh $I$ của parabol $y = x^2 - 4x + 3$ là],
    (
        True([$I(2; -1)$]),
        [$I(-2; 15)$],
        [$I(4; 3)$],
        [$I(-4; 35)$]
    ),
    loigiai: [
        Hàm số bậc hai có các hệ số $a = 1$, $b = -4$, $c = 3$.
        Tọa độ đỉnh $I(x_I; y_I)$ được tính bởi:
        $ x_I = - b / (2a) = - (-4) / (2 cdot 1) = 2 $
        $ y_I = 2^2 - 4(2) + 3 = 4 - 8 + 3 = -1 $
        Vậy đỉnh của parabol là $I(2; -1)$.
    ]
)

// TN 2
#tn([Trục đối xứng của parabol $y = -2x^2 + 8x - 5$ là đường thẳng có phương trình],
    (
        True([$x = 2$]),
        [$x = -2$],
        [$x = 4$],
        [$y = 3$]
    ),
    loigiai: [
        Trục đối xứng của parabol $y = a x^2 + b x + c$ là đường thẳng $x = - b / (2a)$.
        Với $a = -2$ và $b = 8$, ta có:
        $ x = - 8 / (2 cdot (-2)) = - 8 / (-4) = 2 $
        Vậy trục đối xứng là $x = 2$.
    ]
)

// TN 3
#tn([Khẳng định nào sau đây là ĐÚNG về bề lõm của đồ thị hàm số $y = -3x^2 + 2x - 1$?],
    (
        True([Bề lõm quay xuống dưới]),
        [Bề lõm quay lên trên],
        [Đồ thị là một đường thẳng đi lên],
        [Đồ thị nhận gốc tọa độ làm tâm đối xứng]
    ),
    loigiai: [
        Vì hệ số $a = -3 < 0$ nên parabol có bề lõm quay xuống phía dưới (đỉnh là điểm cao nhất của đồ thị).
    ]
)

// TN 4
#tn([Giao điểm của parabol $y = x^2 - 5x + 4$ với trục hoành $O x$ là],
    (
        True([$A(1; 0)$ và $B(4; 0)$]),
        [$A(-1; 0)$ và $B(-4; 0)$],
        [$A(0; 4)$],
        [$A(2; -2)$ và $B(3; -2)$]
    ),
    loigiai: [
        Phương trình hoành độ giao điểm với trục hoành ($y = 0$):
        $ x^2 - 5x + 4 = 0 <=> (x - 1)(x - 4) = 0 <=> cases(x = 1, x = 4) $
        Vậy parabol cắt trục hoành tại hai điểm $A(1; 0)$ và $B(4; 0)$.
    ]
)

// TN 5
#tn([Giao điểm của parabol $y = 2x^2 - 3x + 7$ với trục tung $O y$ là điểm có tọa độ],
    (
        True([$M(0; 7)$]),
        [$N(7; 0)$],
        [$P(0; -3)$],
        [$Q(0; 2)$]
    ),
    loigiai: [
        Giao điểm với trục tung $O y$ ứng với hoành độ $x = 0$:
        $ y = 2(0)^2 - 3(0) + 7 = 7 $
        Vậy tọa độ giao điểm là $M(0; 7)$.
    ]
)

// TN 6
#tn([Hàm số bậc hai $y = x^2 - 6x + 8$ NGHỊCH BIẾN trên khoảng nào sau đây?],
    (
        True([$(-infinity; 3)$]),
        [$(3; +infinity)$],
        [$(-infinity; 6)$],
        [$(0; +infinity)$]
    ),
    loigiai: [
        Hàm số có $a = 1 > 0$ và hoành độ đỉnh $x_I = - (-6) / (2 cdot 1) = 3$.
        Do bề lõm quay lên trên nên hàm số nghịch biến trên khoảng $(-infinity; 3)$ và đồng biến trên khoảng $(3; +infinity)$.
    ]
)

// TN 7
#tn([Hàm số bậc hai $y = -x^2 + 4x + 1$ ĐỒNG BIẾN trên khoảng nào sau đây?],
    (
        True([$(-infinity; 2)$]),
        [$(2; +infinity)$],
        [$(-infinity; 4)$],
        [$(-2; 2)$]
    ),
    loigiai: [
        Hàm số có $a = -1 < 0$ và hoành độ đỉnh $x_I = - 4 / (2 cdot (-1)) = 2$.
        Do bề lõm quay xuống dưới nên hàm số đồng biến trên khoảng $(-infinity; 2)$ và nghịch biến trên khoảng $(2; +infinity)$.
    ]
)

// TN 8
#tn([Giá trị nhỏ nhất của hàm số $y = x^2 - 2x + 5$ trên toàn trục số thực $RR$ bằng],
    (
        True([$4$]),
        [$5$],
        [$1$],
        [$3$]
    ),
    loigiai: [
        Biến đổi về dạng bình phương:
        $ y = (x - 1)^2 + 4 >= 4 text(" với mọi ") x in RR $
        Đẳng thức xảy ra khi $x = 1$.
        Vậy giá trị nhỏ nhất của hàm số trên $RR$ là $4$.
    ]
)

// TN 9
#tn([Giá trị lớn nhất của hàm số $y = -x^2 + 6x - 2$ trên toàn trục số thực $RR$ bằng],
    (
        True([$7$]),
        [$3$],
        [$-2$],
        [$9$]
    ),
    loigiai: [
        Biến đổi:
        $ y = -(x^2 - 6x + 9) + 7 = -(x - 3)^2 + 7 <= 7 text(" với mọi ") x in RR $
        Đẳng thức xảy ra khi $x = 3$.
        Vậy giá trị lớn nhất của hàm số trên $RR$ là $7$.
    ]
)

// TN 10
#tn([Cho parabol $(P): y = a x^2 + b x + c$ đi qua gốc tọa độ $O(0; 0)$ và có đỉnh là $I(1; -2)$. Phương trình của parabol là],
    (
        True([$y = 2x^2 - 4x$]),
        [$y = x^2 - 2x$],
        [$y = -2x^2 + 4x$],
        [$y = 2x^2 + 4x$]
    ),
    loigiai: [
        - Vì $(P)$ đi qua $O(0; 0)$ nên $c = 0$.
        - Hoành độ đỉnh $x_I = -b / (2a) = 1 <=> b = -2a$.
        - Tung độ đỉnh tại $x = 1$ là $y = a(1)^2 + b(1) = a + b = -2$.
        Thay $b = -2a$ vào: $a + (-2a) = -2 <=> -a = -2 <=> a = 2 => b = -4$.
        Vậy phương trình parabol là $y = 2x^2 - 4x$.
    ]
)

// TN 11
#tn([Bác Nam sử dụng $40 text(" m")$ lưới thép để rào một mảnh vườn hình chữ nhật tựa vào một bức tường gạch có sẵn (chỉ cần rào ba cạnh còn lại).
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  // Tường gạch
  line((0, 3), (6, 3), stroke: 4pt + rgb("78716c"))
  content((3, 3.4), [Bức tường gạch có sẵn])
  
  // Rào thép
  rect((1, 0.5), (5, 3), stroke: (dash: "dashed", paint: rgb("1e40af"), thickness: 1.5pt))
  content((0.6, 1.75), [$x$])
  content((5.4, 1.75), [$x$])
  content((3, 0.1), [$40 - 2x$])
})
]
Diện tích lớn nhất mà bác Nam có thể rào chắn được là],
    (
        True([$200 text(" m")^2$]),
        [$100 text(" m")^2$],
        [$400 text(" m")^2$],
        [$150 text(" m")^2$]
    ),
    loigiai: [
        Gọi chiều rộng hai cạnh vuông góc với bức tường là $x text(" (m)")$ ($0 < x < 20$).
        Cạnh song song với bức tường có độ dài là $40 - 2x text(" (m)")$.
        Diện tích mảnh vườn là:
        $ S(x) = x(40 - 2x) = -2x^2 + 40x $
        Đây là hàm số bậc hai với $a = -2 < 0$. Diện tích đạt cực đại tại hoành độ đỉnh:
        $ x = - 40 / (2 cdot (-2)) = 10 text(" m") $
        Khi đó diện tích lớn nhất là $S_text("max") = S(10) = 10(40 - 20) = 200 text(" m")^2$.
    ]
)

// TN 12
#tn([Cho parabol $y = a x^2 + b x + c$ có đồ thị nằm hoàn toàn phía trên trục hoành $O x$ và có bề lõm quay lên trên. Mệnh đề nào sau đây là ĐÚNG?],
    (
        True([$a > 0$ và $Delta < 0$]),
        [$a > 0$ và $Delta > 0$],
        [$a < 0$ và $Delta < 0$],
        [$a > 0$ và $Delta = 0$]
    ),
    loigiai: [
        - Bề lõm quay lên trên nên hệ số $a > 0$.
        - Đồ thị nằm hoàn toàn phía trên trục hoành nghĩa là phương trình $y = 0$ vô nghiệm thực, tương đương biệt thức $Delta < 0$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đồ thị parabol có CeTZ)
#ds([Cho parabol $(P): y = -x^2 + 2x + 3$ có đồ thị trên mặt phẳng tọa độ $O x y$ như sau:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-3, 0), (4.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -3), (0, 5), stroke: 0.8pt, mark: (end: "stealth"))
  content((4.3, -0.3), [$x$])
  content((-0.3, 4.8), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Parabol y = -x^2 + 2x + 3
  line(..range(-18, 39).map(t => {
    let x = t / 10;
    (x, -calc.pow(x, 2) + 2 * x + 3)
  }), stroke: 1.5pt + rgb("1e40af"))
  
  // Đỉnh I(1; 4)
  circle((1, 4), radius: 2.5pt, fill: rgb("1e40af"))
  line((1, 0), (1, 4), stroke: (dash: "dashed", paint: gray))
  line((0, 4), (1, 4), stroke: (dash: "dashed", paint: gray))
  content((1, -0.3), [$1$])
  content((-0.3, 4), [$4$])
  content((1.3, 4.3), [$I(1; 4)$])
  
  // Giao điểm trục hoành (-1; 0) và (3; 0)
  circle((-1, 0), radius: 2pt, fill: rgb("1e40af"))
  circle((3, 0), radius: 2pt, fill: rgb("1e40af"))
  content((-1, -0.3), [$-1$])
  content((3, -0.3), [$3$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ đỉnh của parabol $(P)$ là $I(1; 4)$.]),
    True([Parabol cắt trục hoành $O x$ tại hai điểm phân biệt có tọa độ $A(-1; 0)$ và $B(3; 0)$.]),
    True([Hàm số đồng biến trên khoảng $(-infinity; 1)$ và nghịch biến trên khoảng $(1; +infinity)$.]),
    [Giá trị nhỏ nhất của hàm số trên đoạn $[0; 4]$ bằng $0$.]
  ),
  loigiai: [
    #step([Tọa độ đỉnh])
    $x_I = - 2 / (2(-1)) = 1$; $y_I = -(1)^2 + 2(1) + 3 = 4$. Đỉnh là $I(1; 4)$. Mệnh đề a ĐÚNG.

    #step([Giao điểm với trục hoành])
    $-x^2 + 2x + 3 = 0 <=> (x + 1)(3 - x) = 0 <=> cases(x = -1, x = 3)$.
    Hai giao điểm là $A(-1; 0)$ và $B(3; 0)$. Mệnh đề b ĐÚNG.

    #step([Khoảng đơn điệu])
    Vì $a = -1 < 0$, hàm số đồng biến trên $(-infinity; 1)$ và nghịch biến trên $(1; +infinity)$. Mệnh đề c ĐÚNG.

    #step([Giá trị nhỏ nhất trên đoạn [0; 4]])
    Xét hàm số trên đoạn $[0; 4]$ có chứa hoành độ đỉnh $x = 1$:
    $f(0) = 3$, $f(1) = 4$, $f(4) = -(4)^2 + 2(4) + 3 = -16 + 8 + 3 = -5$.
    Do đó giá trị nhỏ nhất của hàm số trên đoạn $[0; 4]$ là $-5$ (đạt tại $x = 4$).
    Khẳng định giá trị nhỏ nhất bằng $0$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Xác định parabol qua các điều kiện)
#ds([Cho parabol $(P): y = a x^2 + b x + c$ ($a != 0$) đi qua điểm $A(0; -1)$, điểm $B(1; -2)$ và có trục đối xứng là đường thẳng $x = 2$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hệ số tự do của hàm số là $c = -1$.]),
    True([Mối liên hệ giữa hệ số $a$ và $b$ là $b = -4a$.]),
    True([Parabol có phương trình chính xác là $y = 1/3 x^2 - 4/3 x - 1$.]),
    [Tọa độ đỉnh của parabol $(P)$ là điểm $I(2; -3)$.]
  ),
  loigiai: [
    #step([Xác định hệ số c])
    Vì $(P)$ đi qua $A(0; -1)$ nên $a(0)^2 + b(0) + c = -1 <=> c = -1$. Mệnh đề a ĐÚNG.

    #step([Trục đối xứng])
    Trục đối xứng là $x = -b / (2a) = 2 <=> b = -4a$. Mệnh đề b ĐÚNG.

    #step([Tìm a và b])
    $(P)$ đi qua $B(1; -2)$ nên:
    $ a(1)^2 + b(1) + c = -2 <=> a + b - 1 = -2 <=> a + b = -1 $
    Thay $b = -4a$ vào: $a + (-4a) = -1 <=> -3a = -1 <=> a = 1/3$.
    Suy ra $b = -4(1/3) = -4/3$.
    Vậy $(P): y = 1/3 x^2 - 4/3 x - 1$. Mệnh đề c ĐÚNG.

    #step([Tọa độ đỉnh])
    Hoành độ đỉnh là $x_I = 2$. Tung độ đỉnh:
    $ y_I = 1/3 (2)^2 - 4/3 (2) - 1 = 4/3 - 8/3 - 1 = -4/3 - 1 = -7/3 != -3 $
    Do đó đỉnh là $I(2; -7/3)$ chứ không phải $I(2; -3)$. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế quả pháo hoa)
#ds([Một quả pháo hoa tầm thấp được bắn thẳng lên không trung từ giàn phóng cao $10 text(" m")$ so với mặt đất.
Biết rằng độ cao $h(t) text(" (m)")$ của quả pháo hoa so với mặt đất sau $t text(" (giây)")$ kể từ khi rời giàn phóng được mô hình bởi hàm số:
$ h(t) = -5t^2 + 30t + 10 text(" với ") t >= 0 $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Sau $1 text(" giây")$ kể từ khi phóng, quả pháo hoa ở độ cao $35 text(" m")$ so với mặt đất.]),
    True([Quả pháo hoa đạt độ cao cực đại tại thời điểm $t = 3 text(" giây")$ kể từ khi phóng.]),
    True([Độ cao cực đại mà quả pháo hoa đạt được là $55 text(" m")$.]),
    [Thời điểm quả pháo hoa rơi trở lại chạm mặt đất là sau đúng $6 text(" giây")$ kể từ khi phóng.]
  ),
  loigiai: [
    #step([Độ cao sau 1 giây])
    $h(1) = -5(1)^2 + 30(1) + 10 = -5 + 30 + 10 = 35 text(" m")$. Mệnh đề a ĐÚNG.

    #step([Thời điểm đạt độ cao cực đại])
    Hàm số $h(t) = -5t^2 + 30t + 10$ là hàm bậc hai có $a = -5 < 0$.
    Độ cao cực đại đạt được tại đỉnh của parabol:
    $ t = - 30 / (2 cdot (-5)) = 3 text(" giây") $
    Mệnh đề b ĐÚNG.

    #step([Tính độ cao cực đại])
    $h_text("max") = h(3) = -5(3)^2 + 30(3) + 10 = -45 + 90 + 10 = 55 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Thời điểm chạm đất])
    Pháo hoa chạm đất khi độ cao $h(t) = 0$:
    $ -5t^2 + 30t + 10 = 0 <=> t^2 - 6t - 2 = 0 $
    $ Delta' = (-3)^2 - 1(-2) = 11 > 0 => t = 3 + sqrt(11) approx 3 + 3.32 = 6.32 text(" giây") != 6 text(" giây") $
    (Tại $t = 6 text(" giây")$, $h(6) = -5(36) + 180 + 10 = 10 text(" m") != 0$).
    Khẳng định sau đúng $6$ giây chạm đất là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Khảo sát GTLN và GTNN trên đoạn)
#ds([Cho hàm số bậc hai $f(x) = x^2 - 4x + 1$ xác định trên đoạn $[0; 3]$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hoành độ đỉnh của parabol là $x = 2$ thuộc đoạn $[0; 3]$.]),
    True([Giá trị của hàm số tại các điểm đầu mút là $f(0) = 1$ và $f(3) = -2$.]),
    True([Giá trị nhỏ nhất của hàm số trên đoạn $[0; 3]$ bằng $-3$.]),
    [Tổng giá trị lớn nhất và giá trị nhỏ nhất của hàm số trên đoạn $[0; 3]$ bằng $-1$.]
  ),
  loigiai: [
    #step([Xác định đỉnh])
    Hoành độ đỉnh $x_I = - (-4) / (2 cdot 1) = 2 in [0; 3]$. Mệnh đề a ĐÚNG.

    #step([Tính giá trị tại các điểm biên])
    - Tại $x = 0$: $f(0) = 0^2 - 4(0) + 1 = 1$.
    - Tại $x = 3$: $f(3) = 3^2 - 4(3) + 1 = 9 - 12 + 1 = -2$. Mệnh đề b ĐÚNG.

    #step([Tìm GTNN và GTLN])
    Tại đỉnh $x = 2$: $f(2) = 2^2 - 4(2) + 1 = 4 - 8 + 1 = -3$.
    So sánh ba giá trị $f(0) = 1$, $f(3) = -2$, $f(2) = -3$:
    - Giá trị nhỏ nhất là $min_([0; 3]) f(x) = -3$ (đạt tại $x = 2$). Mệnh đề c ĐÚNG.
    - Giá trị lớn nhất là $max_([0; 3]) f(x) = 1$ (đạt tại $x = 0$).

    #step([Tính tổng GTLN và GTNN])
    Tổng giá trị lớn nhất và nhỏ nhất là:
    $ max + min = 1 + (-3) = -2 != -1 $
    Khẳng định bằng $-1$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Hoành độ đỉnh parabol)
#tln([Tìm hoành độ đỉnh $x_I$ của parabol $y = 3x^2 - 12x + 7$.],
    [2],
    loigiai: [
        #step([Áp dụng công thức hoành độ đỉnh])
        Hoành độ đỉnh của parabol $y = a x^2 + b x + c$ là:
        $ x_I = - b / (2a) = - (-12) / (2 cdot 3) = 12 / 6 = 2 $
    ]
)

// TLN 2 (Giá trị nhỏ nhất trên R)
#tln([Tìm giá trị nhỏ nhất của hàm số bậc hai $y = 2x^2 - 8x + 11$ trên toàn trục số thực $RR$.],
    [3],
    loigiai: [
        #step([Biến đổi thành dạng chính tắc])
        $ y = 2(x^2 - 4x) + 11 = 2(x - 2)^2 - 8 + 11 = 2(x - 2)^2 + 3 $
        Vì $(x - 2)^2 >= 0$ nên $y >= 3$ với mọi $x in RR$.
        Đẳng thức xảy ra khi $x = 2$.
        Vậy giá trị nhỏ nhất của hàm số là $3$.
    ]
)

// TLN 3 (Tham số m để đỉnh parabol thuộc đường thẳng)
#tln([Tìm giá trị của tham số $m$ để đỉnh của parabol $y = x^2 - 2x + m$ nằm trên đường thẳng $d: y = 2x + 1$.],
    [4],
    loigiai: [
        #step([Tìm tọa độ đỉnh theo tham số m])
        Hoành độ đỉnh: $x_I = - (-2) / (2 cdot 1) = 1$.
        Tung độ đỉnh: $y_I = 1^2 - 2(1) + m = m - 1$.
        Tọa độ đỉnh là $I(1; m - 1)$.
        
        #step([Điều kiện đỉnh thuộc đường thẳng])
        Thay tọa độ điểm $I$ vào phương trình đường thẳng $d$:
        $ m - 1 = 2(1) + 1 <=> m - 1 = 3 <=> m = 4 $
    ]
)

// TLN 4 (Diện tích hình chữ nhật lớn nhất với chu vi cố định)
#tln([Một mảnh đất hình chữ nhật có chu vi bằng $60 text(" m")$.
Hỏi diện tích lớn nhất của mảnh đất đó bằng bao nhiêu mét vuông ($text("m")^2$)?],
    [225],
    loigiai: [
        #step([Lập hàm số diện tích])
        Nửa chu vi của mảnh đất là $60 / 2 = 30 text(" m")$.
        Gọi chiều dài một cạnh là $x text(" (m)")$ ($0 < x < 30$), cạnh còn lại là $30 - x text(" (m)")$.
        Diện tích mảnh đất là:
        $ S(x) = x(30 - x) = -x^2 + 30x $
        
        #step([Tìm giá trị lớn nhất])
        Hàm số bậc hai có đỉnh tại $x = - 30 / (2 cdot (-1)) = 15 text(" m")$.
        Diện tích lớn nhất là:
        $ S_text("max") = 15(30 - 15) = 15 cdot 15 = 225 text(" m")^2 $
    ]
)

// TLN 5 (Số giao điểm của parabol và trục hoành)
#tln([Đồ thị của hàm số $y = x^2 - 4x + 3$ cắt trục hoành $O x$ tại bao nhiêu điểm phân biệt?],
    [2],
    loigiai: [
        #step([Xét phương trình hoành độ giao điểm])
        Số giao điểm với trục hoành là số nghiệm của phương trình:
        $ x^2 - 4x + 3 = 0 <=> (x - 1)(x - 3) = 0 <=> cases(x = 1, x = 3) $
        Phương trình có hai nghiệm phân biệt $x = 1$ và $x = 3$.
        Vậy đồ thị cắt trục hoành tại đúng $2$ điểm phân biệt.
    ]
)

// TLN 6 (Độ cao tối đa của bóng chày)
#tln([Một vận động viên đánh một quả bóng chày bay lên. Độ cao $y text(" (m)")$ của quả bóng so với mặt đất phụ thuộc vào khoảng cách ngang $x text(" (m)")$ theo công thức:
$ y = -0.02 x^2 + 0.8 x + 1.5 $
Tính độ cao lớn nhất mà quả bóng đạt được theo đơn vị mét.],
    [9.5],
    loigiai: [
        #step([Tìm khoảng cách ngang khi bóng đạt độ cao lớn nhất])
        Hàm số bậc hai có hệ số $a = -0.02 < 0$.
        Độ cao đạt cực đại tại đỉnh của parabol:
        $ x = - 0.8 / (2 cdot (-0.02)) = - 0.8 / (-0.04) = 20 text(" m") $
        
        #step([Tính độ cao lớn nhất])
        Thay $x = 20$ vào công thức hàm số:
        $ y_text("max") = -0.02(20)^2 + 0.8(20) + 1.5 = -0.02(400) + 16 + 1.5 = -8 + 16 + 1.5 = 9.5 text(" m") $
        Vậy độ cao lớn nhất là $9.5 text(" m")$.
    ]
)

] // end make-questions

#make-questions()
