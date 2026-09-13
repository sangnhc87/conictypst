#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0d9488") // Teal

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG",
  exam-title: "BÀI 16: HÀM SỐ BẬC HAI (ĐỀ SỐ 17B - VẬN DỤNG & THỰC TIỄN)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "141",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Tọa độ đỉnh $I$ của parabol $y = -2x^2 + 4x + 1$ là],
    (
        True([$I(1; 3)$]),
        [$I(-1; -5)$],
        [$I(2; 1)$],
        [$I(1; 1)$]
    ),
    loigiai: [
        Hệ số $a = -2$, $b = 4$, $c = 1$.
        Hoành độ đỉnh: $x_I = - b / (2a) = - 4 / (2 cdot (-2)) = 1$.
        Tung độ đỉnh: $y_I = -2(1)^2 + 4(1) + 1 = 3$.
        Vậy đỉnh của parabol là $I(1; 3)$.
    ]
)

// TN 2
#tn([Trục đối xứng của parabol $y = 3x^2 - 6x + 2$ là đường thẳng có phương trình],
    (
        True([$x = 1$]),
        [$x = -1$],
        [$y = -1$],
        [$x = 2$]
    ),
    loigiai: [
        Trục đối xứng của parabol là $x = - b / (2a) = - (-6) / (2 cdot 3) = 6 / 6 = 1$.
    ]
)

// TN 3
#tn([Điểm nào sau đây THUỘC parabol $y = x^2 - 3x + 2$?],
    (
        True([$A(3; 2)$]),
        [$B(1; 1)$],
        [$C(2; 1)$],
        [$D(0; -2)$]
    ),
    loigiai: [
        Thay tọa độ từng điểm:
        - Với $A(3; 2)$: $y = 3^2 - 3(3) + 2 = 2$ (Thỏa mãn).
        - Với $B(1; 1)$: $y = 1^2 - 3(1) + 2 = 0 != 1$ (Loại).
        - Với $C(2; 1)$: $y = 2^2 - 3(2) + 2 = 0 != 1$ (Loại).
        - Với $D(0; -2)$: $y = 2 != -2$ (Loại).
    ]
)

// TN 4
#tn([Hàm số bậc hai $y = 2x^2 + 4x - 1$ ĐỒNG BIẾN trên khoảng nào sau đây?],
    (
        True([$(-1; +infinity)$]),
        [$(-infinity; -1)$],
        [$(-2; +infinity)$],
        [$(-infinity; 2)$]
    ),
    loigiai: [
        Hàm số có $a = 2 > 0$ và hoành độ đỉnh $x_I = - 4 / (2 cdot 2) = -1$.
        Vì bề lõm quay lên trên nên hàm số đồng biến trên khoảng $(-1; +infinity)$.
    ]
)

// TN 5
#tn([Hàm số bậc hai $y = -3x^2 + 12x - 5$ NGHỊCH BIẾN trên khoảng nào sau đây?],
    (
        True([$(2; +infinity)$]),
        [$(-infinity; 2)$],
        [$(-infinity; 4)$],
        [$(0; +infinity)$]
    ),
    loigiai: [
        Hàm số có $a = -3 < 0$ và hoành độ đỉnh $x_I = - 12 / (2 cdot (-3)) = 2$.
        Vì bề lõm quay xuống dưới nên hàm số nghịch biến trên khoảng $(2; +infinity)$.
    ]
)

// TN 6
#tn([Giá trị lớn nhất của hàm số bậc hai $y = -2x^2 + 8x - 3$ trên toàn trục số thực $RR$ bằng],
    (
        True([$5$]),
        [$2$],
        [$3$],
        [$-3$]
    ),
    loigiai: [
        $y = -2(x^2 - 4x + 4) + 5 = -2(x - 2)^2 + 5 <= 5 text(" với mọi ") x in RR$.
        Đẳng thức xảy ra khi $x = 2$. Giá trị lớn nhất là $5$.
    ]
)

// TN 7
#tn([Giá trị nhỏ nhất của hàm số $y = x^2 - 4x + 7$ trên đoạn $[1; 4]$ bằng],
    (
        True([$3$]),
        [$4$],
        [$7$],
        [$2$]
    ),
    loigiai: [
        Hoành độ đỉnh là $x_I = 2 in [1; 4]$.
        Tính giá trị tại các điểm:
        - $f(1) = 1 - 4 + 7 = 4$.
        - $f(2) = 4 - 8 + 7 = 3$.
        - $f(4) = 16 - 16 + 7 = 7$.
        Vậy giá trị nhỏ nhất của hàm số trên đoạn $[1; 4]$ là $3$ (đạt tại $x = 2$).
    ]
)

// TN 8
#tn([Số giao điểm của parabol $y = x^2 - 2x - 3$ với đường thẳng $y = x + 1$ là],
    (
        True([$2$]),
        [$1$],
        [$0$],
        [$3$]
    ),
    loigiai: [
        Phương trình hoành độ giao điểm:
        $ x^2 - 2x - 3 = x + 1 <=> x^2 - 3x - 4 = 0 <=> (x + 1)(x - 4) = 0 <=> cases(x = -1, x = 4) $
        Phương trình có hai nghiệm phân biệt nên số giao điểm là $2$.
    ]
)

// TN 9
#tn([Cho parabol đi qua ba điểm $A(-1; 0)$, $B(3; 0)$ và $C(0; -3)$. Phương trình của parabol là],
    (
        True([$y = x^2 - 2x - 3$]),
        [$y = -x^2 + 2x + 3$],
        [$y = x^2 + 2x - 3$],
        [$y = 2x^2 - 4x - 3$]
    ),
    loigiai: [
        Vì parabol cắt trục hoành tại $x = -1$ và $x = 3$ nên phương trình có dạng $y = a(x + 1)(x - 3)$.
        Đồ thị đi qua $C(0; -3)$ nên: $-3 = a(0 + 1)(0 - 3) = -3a <=> a = 1$.
        Vậy phương trình là $y = (x + 1)(x - 3) = x^2 - 2x - 3$.
    ]
)

// TN 10
#tn([Một công ty du lịch ước tính: Nếu giá một tour là $x$ (trăm nghìn đồng) thì số lượng khách đăng ký tour là $N(x) = 120 - x$. Doanh thu từ tour du lịch đó được biểu diễn bởi hàm số $R(x) = x(120 - x)$. Giá tour bao nhiêu thì doanh thu đạt lớn nhất?],
    (
        True([$60 text(" trăm nghìn đồng")$]),
        [$50 text(" trăm nghìn đồng")$],
        [$70 text(" trăm nghìn đồng")$],
        [$120 text(" trăm nghìn đồng")$]
    ),
    loigiai: [
        Hàm doanh thu: $R(x) = -x^2 + 120x$.
        Đây là hàm bậc hai có $a = -1 < 0$, đạt giá trị lớn nhất tại hoành độ đỉnh:
        $ x = - 120 / (2 cdot (-1)) = 60 text(" trăm nghìn đồng") $
    ]
)

// TN 11
#tn([Biết parabol $y = a x^2 + b x + 2$ có trục đối xứng là $x = 2$ và đi qua điểm $M(1; 5)$. Giá trị của tích $a b$ bằng],
    (
        True([$-4$]),
        [$4$],
        [$-2$],
        [$6$]
    ),
    loigiai: [
        - Trục đối xứng $x = -b / (2a) = 2 <=> b = -4a$.
        - Đi qua $M(1; 5)$ nên: $a(1)^2 + b(1) + 2 = 5 <=> a + b = 3$.
        Thay $b = -4a$ vào: $a + (-4a) = 3 <=> -3a = 3 <=> a = -1$.
        Suy ra $b = -4(-1) = 4$.
        Vậy $a b = (-1)(4) = -4$.
    ]
)

// TN 12
#tn([Đỉnh của parabol $y = a x^2 + b x + c$ nằm ở góc phần tư thứ tư của mặt phẳng tọa độ $O x y$. Khi đó tọa độ đỉnh $(x_I; y_I)$ thỏa mãn điều kiện nào?],
    (
        True([$x_I > 0$ và $y_I < 0$]),
        [$x_I < 0$ và $y_I < 0$],
        [$x_I > 0$ và $y_I > 0$],
        [$x_I < 0$ và $y_I > 0$]
    ),
    loigiai: [
        Các điểm nằm ở góc phần tư thứ tư (phía dưới bên phải) luôn có hoành độ dương ($x > 0$) và tung độ âm ($y < 0$).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đồ thị parabol y = x^2 - 2x - 3)
#ds([Cho hàm số bậc hai $y = f(x) = x^2 - 2x - 3$ có đồ thị parabol $(P)$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-3, 0), (5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -5), (0, 4), stroke: 0.8pt, mark: (end: "stealth"))
  content((4.8, -0.3), [$x$])
  content((-0.3, 3.8), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Parabol y = x^2 - 2x - 3
  line(..range(-15, 36).map(t => {
    let x = t / 10;
    (x, calc.pow(x, 2) - 2 * x - 3)
  }), stroke: 1.5pt + rgb("0d9488"))
  
  // Đỉnh I(1; -4)
  circle((1, -4), radius: 2.5pt, fill: rgb("0d9488"))
  line((1, 0), (1, -4), stroke: (dash: "dashed", paint: gray))
  line((0, -4), (1, -4), stroke: (dash: "dashed", paint: gray))
  content((1, 0.3), [$1$])
  content((-0.4, -4), [$-4$])
  content((1.6, -4.2), [$I(1; -4)$])
  
  // Giao điểm với Ox: (-1; 0), (3; 0)
  circle((-1, 0), radius: 2pt, fill: rgb("0d9488"))
  circle((3, 0), radius: 2pt, fill: rgb("0d9488"))
  content((-1, 0.3), [$-1$])
  content((3, 0.3), [$3$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ đỉnh của parabol là $I(1; -4)$.]),
    True([Trục đối xứng của đồ thị là đường thẳng có phương trình $x = 1$.]),
    True([Đồ thị cắt trục hoành tại hai điểm phân biệt $A(-1; 0)$ và $B(3; 0)$.]),
    [Giá trị lớn nhất của hàm số trên đoạn $[-2; 2]$ bằng $4$.]
  ),
  loigiai: [
    #step([Tọa độ đỉnh])
    $x_I = - (-2) / (2 cdot 1) = 1$; $y_I = 1^2 - 2(1) - 3 = -4$. Đỉnh $I(1; -4)$. Mệnh đề a ĐÚNG.

    #step([Trục đối xứng])
    Đường thẳng qua đỉnh song song với $O y$ là $x = 1$. Mệnh đề b ĐÚNG.

    #step([Giao điểm trục hoành])
    $x^2 - 2x - 3 = 0 <=> (x + 1)(x - 3) = 0 <=> cases(x = -1, x = 3)$. Mệnh đề c ĐÚNG.

    #step([Giá trị lớn nhất trên đoạn [-2; 2]])
    Xét $f(x)$ trên $[-2; 2]$:
    - $f(-2) = (-2)^2 - 2(-2) - 3 = 4 + 4 - 3 = 5$.
    - $f(1) = -4$ (giá trị nhỏ nhất).
    - $f(2) = 2^2 - 2(2) - 3 = -3$.
    Do đó giá trị lớn nhất trên đoạn $[-2; 2]$ là $5$ (đạt tại $x = -2$).
    Khẳng định giá trị lớn nhất bằng $4$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Toán thực tế cổng vòm Parabol)
#ds([Một cổng trường đại học được xây dựng theo hình dáng một vòm cong parabol.
Biết rằng chiều cao của cổng tính từ mặt đất lên đỉnh cao nhất là $8 text(" m")$, và khoảng cách giữa hai chân cổng trên mặt đất là $8 text(" m")$.
Chọn hệ trục tọa độ $O x y$ sao cho gốc $O$ là trung điểm đoạn thẳng nối hai chân cổng trên mặt đất, trục $O y$ thẳng đứng hướng lên đi qua đỉnh cổng.
Phương trình của đường vòm cong parabol có dạng $y = a x^2 + 8$ ($a < 0$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hệ số $a$ trong phương trình vòm cổng là $a = - 1 / 2$.]),
    True([Điểm cao nhất của vòm cổng cách mặt phẳng mặt đất $8 text(" m")$.]),
    True([Một xe tải chở hàng có bề rộng thùng xe là $4 text(" m")$ có thể đi lọt qua cổng nếu chiều cao của xe không vượt quá $6 text(" m")$.]),
    [Một xe chở thiết bị cồng kềnh có chiều cao $7.5 text(" m")$ muốn đi lọt qua cổng thì bề rộng tối đa của xe là $1 text(" m")$.]
  ),
  loigiai: [
    #step([Xác định phương trình vòm cổng])
    Vì khoảng cách giữa hai chân cổng là $8 text(" m")$ nên hai chân cổng có tọa độ $A(-4; 0)$ và $B(4; 0)$.
    Thay tọa độ điểm $B(4; 0)$ vào phương trình:
    $ 0 = a(4)^2 + 8 <=> 16a = -8 <=> a = - 8 / 16 = - 1 / 2 $
    Phương trình parabol là $y = - 1/2 x^2 + 8$. Mệnh đề a ĐÚNG.

    #step([Chiều cao đỉnh cổng])
    Đỉnh cổng tại $x = 0$ có tung độ $y = 8 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Chiều cao tối đa của xe rộng 4 m])
    Xe rộng $4 text(" m")$ đi vào chính giữa cổng thì mỗi bên mép xe cách trục đối xứng $x = 2 text(" m")$.
    Chiều cao vòm cổng tại vị trí mép xe là:
    $ y = - 1/2 (2)^2 + 8 = -2 + 8 = 6 text(" m") $
    Vậy chiều cao tối đa của xe là $6 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Bề rộng tối đa của xe cao 7.5 m])
    Để xe cao $7.5 text(" m")$ đi lọt thì tung độ tại mép xe phải thỏa mãn:
    $ - 1/2 x^2 + 8 >= 7.5 <=> 1/2 x^2 <= 0.5 <=> x^2 <= 1 <=> -1 <= x <= 1 $
    Khoảng cách ngang giữa hai mép xe tối đa là: $d = 1 - (-1) = 2 text(" m")$.
    Khẳng định bề rộng tối đa $1 text(" m")$ là SAI (vì mỗi bên là $1 text(" m")$, tổng bề rộng là $2 text(" m")$). Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế kinh doanh rạp chiếu phim)
#ds([Một rạp chiếu phim có sức chứa $400$ chỗ ngồi. Khi giá vé là $80.000$ đồng thì tất cả các ghế đều được bán hết.
Để tăng doanh thu, rạp tiến hành khảo sát và nhận thấy: Cứ mỗi lần tăng giá vé thêm $5.000$ đồng thì số vé bán ra sẽ giảm đi $10$ vé.
Gọi $x$ là số lần tăng giá vé ($x in NN^*$).
Giá vé sau khi tăng là $80.000 + 5.000x$ (đồng) và số lượng vé bán ra là $400 - 10x$ (vé).
Doanh thu của rạp được biểu thị bởi hàm số $R(x)$ (đồng).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu rạp tăng giá vé $4$ lần thì giá mỗi vé là $100.000$ đồng và bán được $360$ vé.]),
    True([Công thức của hàm doanh thu theo $x$ là $R(x) = -50.000 x^2 + 1.200.000 x + 32.000.000 text(" (đồng)")$.]),
    True([Rạp đạt doanh thu lớn nhất khi tăng giá vé $12$ lần (tương ứng giá vé là $140.000$ đồng).]),
    [Doanh thu lớn nhất mà rạp có thể thu được trong một suất chiếu là $40.000.000$ đồng.]
  ),
  loigiai: [
    #step([Kiểm tra khi tăng 4 lần])
    Giá vé: $80.000 + 5.000(4) = 100.000$ đồng.
    Số vé bán được: $400 - 10(4) = 360$ vé. Mệnh đề a ĐÚNG.

    #step([Lập công thức hàm doanh thu])
    $R(x) = (80.000 + 5.000x)(400 - 10x)$
    $= 32.000.000 - 800.000x + 2.000.000x - 50.000x^2$
    $= -50.000x^2 + 1.200.000x + 32.000.000$ đồng. Mệnh đề b ĐÚNG.

    #step([Tìm số lần tăng để đạt doanh thu lớn nhất])
    Hàm số bậc hai có hệ số $a = -50.000 < 0$.
    Doanh thu đạt cực đại tại:
    $ x = - 1.200.000 / (2 cdot (-50.000)) = 1.200.000 / 100.000 = 12 $
    Giá vé khi đó: $80.000 + 5.000(12) = 140.000$ đồng. Mệnh đề c ĐÚNG.

    #step([Tính doanh thu lớn nhất])
    Thay $x = 12$:
    Số vé bán được: $400 - 10(12) = 280$ vé.
    Doanh thu lớn nhất: $R_text("max") = 140.000 times 280 = 39.200.000$ đồng.
    Con số này nhỏ hơn $40.000.000$ đồng.
    Khẳng định doanh thu lớn nhất là $40.000.000$ đồng là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tương giao giữa parabol và đường thẳng)
#ds([Cho parabol $(P): y = x^2 - 4x + 3$ và đường thẳng $d: y = 2x + m$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khi $m = -6$, đường thẳng $d$ tiếp xúc với parabol $(P)$ tại điểm $M(3; 0)$.]),
    True([Đường thẳng $d$ cắt parabol $(P)$ tại hai điểm phân biệt khi và chỉ khi $m > -6$.]),
    True([Khi $m = 1$, hoành độ trung điểm của đoạn thẳng nối hai giao điểm bằng $3$.]),
    [Có đúng $3$ giá trị nguyên âm của tham số $m$ để đường thẳng $d$ cắt $(P)$ tại hai điểm phân biệt có hoành độ đều dương.]
  ),
  loigiai: [
    #step([Phương trình hoành độ giao điểm])
    $x^2 - 4x + 3 = 2x + m <=> x^2 - 6x + 3 - m = 0$ (1).
    Biệt thức thu gọn: $Delta' = (-3)^2 - 1(3 - m) = 9 - 3 + m = m + 6$.

    #step([Khi m = -6])
    $Delta' = 0$, phương trình có nghiệm kép $x = - (-3) / 1 = 3$.
    Tung độ: $y = 2(3) + (-6) = 0$.
    Đường thẳng tiếp xúc với $(P)$ tại điểm $M(3; 0)$. Mệnh đề a ĐÚNG.

    #step([Điều kiện có hai nghiệm phân biệt])
    Đường thẳng cắt $(P)$ tại hai điểm phân biệt khi và chỉ khi $Delta' > 0 <=> m + 6 > 0 <=> m > -6$. Mệnh đề b ĐÚNG.

    #step([Hoành độ trung điểm])
    Theo định lý Vi-ét, $x_1 + x_2 = 6$ (không phụ thuộc vào $m$).
    Hoành độ trung điểm của hai giao điểm là $x_I = (x_1 + x_2) / 2 = 6 / 2 = 3$. Mệnh đề c ĐÚNG.

    #step([Hai nghiệm phân biệt đều dương])
    Hai nghiệm đều dương khi và chỉ khi:
    $ cases(Delta' > 0, S > 0, P > 0) <=> cases(m > -6, 6 > 0, 3 - m > 0) <=> -6 < m < 3 $
    Các giá trị nguyên âm của $m$ là $m in {-5; -4; -3; -2; -1}$ (gồm đúng $5$ giá trị).
    Khẳng định có đúng $3$ giá trị nguyên âm là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tung độ đỉnh)
#tln([Tìm tung độ đỉnh $y_I$ của parabol $y = -2x^2 + 4x + 5$.],
    [7],
    loigiai: [
        #step([Tính tọa độ đỉnh])
        Hoành độ đỉnh: $x_I = - 4 / (2 cdot (-2)) = 1$.
        Tung độ đỉnh: $y_I = -2(1)^2 + 4(1) + 5 = 7$.
    ]
)

// TLN 2 (GTNN trên đoạn)
#tln([Tìm giá trị nhỏ nhất của hàm số $y = 3x^2 - 6x + 8$ trên đoạn $[0; 3]$.],
    [5],
    loigiai: [
        #step([Tìm hoành độ đỉnh])
        $x_I = - (-6) / (2 cdot 3) = 1 in [0; 3]$.
        
        #step([So sánh các giá trị])
        - $f(0) = 8$.
        - $f(1) = 3(1) - 6(1) + 8 = 5$.
        - $f(3) = 3(9) - 6(3) + 8 = 27 - 18 + 8 = 17$.
        Vậy giá trị nhỏ nhất là $5$ (đạt tại $x = 1$).
    ]
)

// TLN 3 (GTLN trên đoạn)
#tln([Tìm giá trị lớn nhất của hàm số $y = -x^2 + 4x - 1$ trên đoạn $[0; 5]$.],
    [3],
    loigiai: [
        #step([Tìm hoành độ đỉnh])
        $x_I = - 4 / (2 cdot (-1)) = 2 in [0; 5]$.
        
        #step([So sánh các giá trị])
        Vì $a = -1 < 0$ nên giá trị lớn nhất đạt tại đỉnh:
        $ y_text("max") = f(2) = -(2)^2 + 4(2) - 1 = -4 + 8 - 1 = 3 $
        (Tại hai đầu mút: $f(0) = -1$ và $f(5) = -6$, đều nhỏ hơn $3$).
    ]
)

// TLN 4 (Chiều cao vòm cầu parabol)
#tln([Một cây cầu vòm hình parabol có nhịp cầu dài $A B = 40 text(" m")$, đỉnh vòm cầu cao $10 text(" m")$ so với mặt sàn cầu $A B$.
Hỏi tại điểm cách chân cầu $A$ một khoảng $10 text(" m")$ thì chiều cao của vòm cầu so với sàn cầu bằng bao nhiêu mét?],
    [7.5],
    loigiai: [
        #step([Lập phương trình vòm cầu])
        Chọn hệ trục tọa độ $O x y$ sao cho gốc $O$ là trung điểm $A B$, đỉnh cầu nằm trên trục $O y$.
        Khi đó đỉnh cầu là $(0; 10)$, hai chân cầu là $A(-20; 0)$ và $B(20; 0)$.
        Phương trình parabol có dạng: $y = a x^2 + 10$.
        Vì parabol đi qua $B(20; 0)$ nên:
        $ a(20)^2 + 10 = 0 <=> 400a = -10 <=> a = - 1 / 40 $
        Do đó phương trình vòm cầu là $y = - 1 / 40 x^2 + 10$.
        
        #step([Tính chiều cao tại điểm cách chân cầu 10 m])
        Điểm cách chân cầu $A(-20; 0)$ một khoảng $10 text(" m")$ ứng với hoành độ:
        $ x = -20 + 10 = -10 $
        Chiều cao tương ứng là:
        $ y = - 1 / 40 (-10)^2 + 10 = - 100 / 40 + 10 = -2.5 + 10 = 7.5 text(" m") $
    ]
)

// TLN 5 (Tham số m để tiếp xúc trục hoành)
#tln([Tìm giá trị của tham số $m$ để parabol $y = x^2 - 2x + 2m - 1$ tiếp xúc với trục hoành $O x$.],
    [1],
    loigiai: [
        #step([Điều kiện tiếp xúc])
        Parabol tiếp xúc với trục hoành khi và chỉ khi phương trình hoành độ giao điểm $x^2 - 2x + 2m - 1 = 0$ có nghiệm kép:
        $ Delta' = (-1)^2 - 1(2m - 1) = 0 <=> 1 - 2m + 1 = 0 <=> 2 - 2m = 0 <=> m = 1 $
    ]
)

// TLN 6 (Tầm bay xa của cầu lông)
#tln([Một quả cầu lông được đánh lên từ độ cao $2 text(" m")$, quỹ đạo bay là một parabol có phương trình:
$ h(x) = -0.1 x^2 + 0.8 x + 2 $
(trong đó $x$ là khoảng cách ngang tính bằng mét, $h(x)$ là độ cao tính bằng mét).
Tính khoảng cách ngang từ vị trí đánh đến điểm quả cầu lông rơi chạm đất (mét).],
    [10],
    loigiai: [
        #step([Điều kiện chạm đất])
        Quả cầu lông chạm đất khi độ cao $h(x) = 0$:
        $ -0.1 x^2 + 0.8 x + 2 = 0 <=> x^2 - 8x - 20 = 0 <=> (x - 10)(x + 2) = 0 $
        Vì khoảng cách ngang $x > 0$ nên ta nhận nghiệm $x = 10 text(" m")$.
        Vậy khoảng cách ngang khi chạm đất là $10 text(" m")$.
    ]
)

] // end make-questions

#make-questions()
