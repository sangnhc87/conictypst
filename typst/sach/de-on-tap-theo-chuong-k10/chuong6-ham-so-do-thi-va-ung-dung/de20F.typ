#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("047857") // Emerald Green

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VI: HÀM SỐ, ĐỒ THI VÀ ỨNG DỤNG",
  exam-title: "CHUYÊN ĐỀ TOÁN THỰC TẾ: KỸ THUẬT & AN TOÀN GIAO THÔNG (ĐỀ SỐ 20F)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "154",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Theo quy chuẩn an toàn giao thông, quãng đường dừng xe khẩn cấp $d(v)$ (tính theo mét) của một ô tô khi chạy với vận tốc $v text(" (m/s)")$ trên đường nhựa khô ráo được xác định bởi công thức:
$ d(v) = 0.8 v + 0.05 v^2 text(" (m)") $
trong đó $0.8 v$ là quãng đường xe chạy trong thời gian phản xạ của tài xế và $0.05 v^2$ là quãng đường trượt khi đạp phanh.
Khi ô tô đang chạy với vận tốc $v = 20 text(" m/s")$ (tức $72 text(" km/h")$), quãng đường dừng an toàn của xe là],
    (
        True([$36 text(" m")$]),
        [$32 text(" m")$],
        [$40 text(" m")$],
        [$28 text(" m")$]
    ),
    loigiai: [
        Thay $v = 20 text(" m/s")$ vào công thức:
        $ d(20) = 0.8(20) + 0.05(20)^2 = 16 + 0.05(400) = 16 + 20 = 36 text(" m") $
    ]
)

// TN 2
#tn([Để quãng đường dừng xe khẩn cấp của ô tô trong bài toán trên không vượt quá $65 text(" m")$, vận tốc tối đa của xe không được vượt quá],
    (
        True([$26 text(" m/s")$]),
        [$25 text(" m/s")$],
        [$30 text(" m/s")$],
        [$24 text(" m/s")$]
    ),
    loigiai: [
        Yêu cầu bài toán tương đương:
        $ d(v) <= 65 <=> 0.05 v^2 + 0.8 v - 65 <= 0 $
        Nhân cả hai vế với $20$:
        $ v^2 + 16 v - 1300 <= 0 <=> (v - 26)(v + 50) <= 0 $
        Vì vận tốc $v >= 0$ nên ta được: $0 <= v <= 26 text(" m/s")$.
        Vậy vận tốc tối đa không được vượt quá $26 text(" m/s")$ (khoảng $93.6 text(" km/h")$).
    ]
)

// TN 3
#tn([Hai cột điện cao thế cách nhau $200 text(" m")$ trên mặt đất bằng phẳng. Dây cáp điện treo giữa hai cột có dạng hình parabol.
Điểm gắn dây cáp trên mỗi cột điện cao $30 text(" m")$ so với mặt đất và điểm võng thấp nhất của dây cáp ở chính giữa cách mặt đất $20 text(" m")$.
Chọn hệ trục tọa độ $O x y$ với gốc $O$ tại mặt đất ngay dưới điểm võng thấp nhất của dây cáp (điểm thấp nhất có tọa độ $(0; 20)$).
Phương trình parabol của đường dây cáp điện là],
    (
        True([$y = 0.001 x^2 + 20$]),
        [$y = 0.002 x^2 + 20$],
        [$y = 0.0005 x^2 + 20$],
        [$y = 0.01 x^2 + 20$]
    ),
    loigiai: [
        Điểm võng thấp nhất là đỉnh của parabol $I(0; 20)$, do đó phương trình có dạng:
        $ y = a x^2 + 20 $
        Hai cột điện cách đều trục tung nên có hoành độ $x = -100$ và $x = 100$.
        Điểm treo cáp có tọa độ $(100; 30)$. Thay vào phương trình:
        $ 30 = a(100)^2 + 20 <=> 10000 a = 10 <=> a = 10 / 10000 = 0.001 $
        Vậy phương trình đường dây cáp là: $y = 0.001 x^2 + 20$.
    ]
)

// TN 4
#tn([Trong bài toán đường dây cáp điện cao thế trên, tại vị trí cách cột điện một khoảng $50 text(" m")$ (tương ứng cách tâm $50 text(" m")$), độ cao của dây cáp so với mặt đất bằng],
    (
        True([$22.5 text(" m")$]),
        [$25 text(" m")$],
        [$21.5 text(" m")$],
        [$24 text(" m")$]
    ),
    loigiai: [
        Thay $x = 50 text(" m")$ vào phương trình dây cáp:
        $ y(50) = 0.001(50)^2 + 20 = 0.001(2500) + 20 = 2.5 + 20 = 22.5 text(" m") $
    ]
)

// TN 5
#tn([Một Flycam trắc địa địa chất bay khảo sát một hẻm núi có mặt cắt dạng parabol với phương trình:
$ y = 0.01 x^2 - 25 text(" (m)") $
trong đó mặt phẳng chuẩn mặt đất tương ứng với $y = 0$ ($x in [-50; 50]$).
Độ sâu của đáy hẻm núi so với mặt đất bằng],
    (
        True([$25 text(" m")$]),
        [$50 text(" m")$],
        [$20 text(" m")$],
        [$30 text(" m")$]
    ),
    loigiai: [
        Đáy hẻm núi đạt tại đỉnh parabol $x = 0$:
        $ y(0) = 0.01(0)^2 - 25 = -25 text(" m") $
        Vậy độ sâu của đáy hẻm núi là $25 text(" m")$ so với mặt đất.
    ]
)

// TN 6
#tn([Chiều rộng của miệng hẻm núi trên mặt đất ($y = 0$) trong bài toán trên bằng],
    (
        True([$100 text(" m")$]),
        [$50 text(" m")$],
        [$80 text(" m")$],
        [$120 text(" m")$]
    ),
    loigiai: [
        Tại miệng hẻm núi trên mặt đất ($y = 0$):
        $ 0.01 x^2 - 25 = 0 <=> 0.01 x^2 = 25 <=> x^2 = 2500 <=> x = plus.minus 50 $
        Chiều rộng miệng hẻm núi là:
        $ d = 50 - (-50) = 100 text(" m") $
    ]
)

// TN 7
#tn([Hai con tàu $A$ và $B$ khởi hành cùng một thời điểm từ ngã tư đường biển $O$.
Tàu $A$ chạy về hướng Đông với vận tốc không đổi $30 text(" km/h")$, tàu $B$ chạy về hướng Bắc với vận tốc không đổi $40 text(" km/h")$.
Khoảng cách giữa hai con tàu sau $t$ giờ là],
    (
        True([$d(t) = 50t text(" (km)")$]),
        [$d(t) = 70t text(" (km)")$],
        [$d(t) = 10t text(" (km)")$],
        [$d(t) = 25t text(" (km)")$]
    ),
    loigiai: [
        Sau $t$ giờ, quãng đường tàu $A$ chạy được là $O A = 30t text(" km")$, quãng đường tàu $B$ chạy được là $O B = 40t text(" km")$.
        Vì hai hướng Đông và Bắc vuông góc nhau, theo định lý Pythagore:
        $ d(t) = sqrt((30t)^2 + (40t)^2) = sqrt(900 t^2 + 1600 t^2) = sqrt(2500 t^2) = 50t text(" km") $
    ]
)

// TN 8
#tn([Một con tàu $A$ đang ở vị trí cách ngã tư $O$ một khoảng $60 text(" km")$ về phía Tây và di chuyển về phía Đông (hướng về $O$) với vận tốc $20 text(" km/h")$.
Cùng lúc đó, tàu $B$ xuất phát từ $O$ chạy về phía Bắc với vận tốc $15 text(" km/h")$.
Sau bao nhiêu giờ kể từ lúc bắt đầu thì khoảng cách giữa hai con tàu là nhỏ nhất?],
    (
        True([$1.92 text(" giờ")$]),
        [$2 text(" giờ")$],
        [$1.5 text(" giờ")$],
        [$2.5 text(" giờ")$]
    ),
    loigiai: [
        Sau $t$ giờ ($t >= 0$):
        - Vị trí tàu $A$: cách $O$ khoảng $60 - 20t text(" km")$.
        - Vị trí tàu $B$: cách $O$ khoảng $15t text(" km")$.
        Bình phương khoảng cách giữa hai tàu là:
        $ d^2(t) = (60 - 20t)^2 + (15t)^2 = (3600 - 2400t + 400t^2) + 225t^2 = 625t^2 - 2400t + 3600 $
        Hàm số bậc hai đạt giá trị nhỏ nhất tại hoành độ đỉnh:
        $ t_I = - (-2400) / (2 cdot 625) = 2400 / 1250 = 1.92 text(" giờ") $
    ]
)

// TN 9
#tn([Khoảng cách ngắn nhất giữa hai con tàu $A$ và $B$ trong bài toán trên bằng],
    (
        True([$36 text(" km")$]),
        [$30 text(" km")$],
        [$40 text(" km")$],
        [$32 text(" km")$]
    ),
    loigiai: [
        Thay $t = 1.92 text(" giờ")$ vào biểu thức bình phương khoảng cách:
        $ d^2(1.92) = 625(1.92)^2 - 2400(1.92) + 3600 = 625(3.6864) - 4608 + 3600 = 2304 - 4608 + 3600 = 1296 $
        Khoảng cách ngắn nhất là:
        $ d_text("min") = sqrt(1296) = 36 text(" km") $
    ]
)

// TN 10
#tn([Một kỹ sư thủy lợi thiết kế mương dẫn nước bằng bê tông có mặt cắt hình chữ nhật với diện tích $8 text(" m"^2)$.
Chu vi ướt (gồm đáy mương và hai thành bên tiếp xúc với nước) là $P(x) = x + 16 / x text(" (m)")$ với $x text(" (m)")$ là chiều rộng của đáy mương.
Để tiết kiệm chi phí xây dựng bê tông nhất (chu vi ướt nhỏ nhất), chiều rộng đáy mương nên được thiết kế bằng],
    (
        True([$4 text(" m")$]),
        [$2 text(" m")$],
        [$8 text(" m")$],
        [$3 text(" m")$]
    ),
    loigiai: [
        Áp dụng bất đẳng thức Cauchy cho hai số dương $x$ và $16 / x$:
        $ P(x) = x + 16 / x >= 2 sqrt(x cdot 16 / x) = 2 sqrt(16) = 8 text(" m") $
        Dấu đẳng thức xảy ra khi và chỉ khi:
        $ x = 16 / x <=> x^2 = 16 <=> x = 4 text(" m") $
    ]
)

// TN 11
#tn([Công suất hao phí trên đường dây truyền tải điện xoay chiều một pha được cho bởi công thức:
$ Delta P = (P^2 R) / (U^2 cos^2 phi) $
Nếu các thông số $P, R, cos phi$ không đổi, khi nâng điện áp hiệu dụng $U$ từ $10 text(" kV")$ lên $20 text(" kV")$ thì công suất hao phí trên đường dây sẽ],
    (
        True([Giảm $4$ lần]),
        [Giảm $2$ lần],
        [Giảm $8$ lần],
        [Không đổi]
    ),
    loigiai: [
        Công suất hao phí $Delta P$ tỉ lệ nghịch với bình phương điện áp $U^2$.
        Khi điện áp tăng lên gấp đôi: $U' = 2U$, ta có:
        $ Delta P' = (P^2 R) / ((2U)^2 cos^2 phi) = 1 / 4 cdot (P^2 R) / (U^2 cos^2 phi) = 1 / 4 Delta P $
        Do đó công suất hao phí giảm đi $4$ lần.
    ]
)

// TN 12
#tn([Áp suất trong một đường ống dẫn khí đốt vượt đồi tại vị trí cách trạm nén khí khoảng cách $x text(" (km)")$ ($0 <= x <= 30$) được cho bởi:
$ p(x) = -0.1 x^2 + 4x + 10 text(" (bar)") $
Áp suất lớn nhất trong đường ống là],
    (
        True([$50 text(" bar")$]),
        [$40 text(" bar")$],
        [$60 text(" bar")$],
        [$45 text(" bar")$]
    ),
    loigiai: [
        Hàm số bậc hai $p(x) = -0.1 x^2 + 4x + 10$ có $a = -0.1 < 0$.
        Đạt cực đại tại đỉnh:
        $ x_I = - 4 / (2(-0.1)) = 20 text(" km") $
        Áp suất lớn nhất là:
        $ p(20) = -0.1(20)^2 + 4(20) + 10 = -0.1(400) + 80 + 10 = -40 + 90 = 50 text(" bar") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Quãng đường hãm phanh an toàn có CeTZ)
#ds([Nghiên cứu an toàn giao thông đường bộ chỉ ra rằng quãng đường dừng xe an toàn $S(v)$ (mét) của một chiếc ô tô phụ thuộc vào vận tốc di chuyển $v text(" (m/s)")$ theo hàm số bậc hai:
$ S(v) = 0.75 v + 0.05 v^2 $
(trong đó $0.75 v$ là quãng đường xe di chuyển trong thời gian phản xạ của người lái xe và $0.05 v^2$ là quãng đường phanh trượt).
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-0.5, 0), (5.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -0.5), (0, 4.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((5.2, -0.3), [$v text(" (m/s)")$])
  content((-0.4, 4.2), [$S text(" (m)")$])
  content((-0.25, -0.25), [$O$])
  
  // Đồ thị S(v) = 0.75v + 0.05v^2 với v in [0; 30] (scale: v chia 6, S chia 15)
  // v = 10 -> x = 1.67, S = 12.5 -> y = 0.83
  // v = 20 -> x = 3.33, S = 35 -> y = 2.33
  // v = 25 -> x = 4.17, S = 50 -> y = 3.33
  line(..range(0, 31).map(t => {
    let v_real = t;
    let x_plot = v_real / 6;
    let s_real = 0.75 * v_real + 0.05 * calc.pow(v_real, 2);
    let y_plot = s_real / 15;
    (x_plot, y_plot)
  }), stroke: 1.5pt + rgb("047857"))
  
  // Điểm v = 10, S = 12.5
  circle((1.67, 0.83), radius: 2pt, fill: rgb("047857"))
  line((1.67, 0), (1.67, 0.83), stroke: (dash: "dashed", paint: gray))
  line((0, 0.83), (1.67, 0.83), stroke: (dash: "dashed", paint: gray))
  content((1.67, -0.3), [$10$])
  content((-0.4, 0.83), [$12.5$])
  
  // Điểm v = 20, S = 35
  circle((3.33, 2.33), radius: 2pt, fill: rgb("047857"))
  line((3.33, 0), (3.33, 2.33), stroke: (dash: "dashed", paint: gray))
  line((0, 2.33), (3.33, 2.33), stroke: (dash: "dashed", paint: gray))
  content((3.33, -0.3), [$20$])
  content((-0.3, 2.33), [$35$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khi xe chạy với vận tốc $v = 10 text(" m/s")$ (tức $36 text(" km/h")$), quãng đường dừng an toàn là $12.5 text(" m")$.]),
    True([Khi xe chạy với vận tốc $v = 20 text(" m/s")$ (tức $72 text(" km/h")$), quãng đường dừng an toàn là $35 text(" m")$.]),
    True([Để xe có thể dừng an toàn trong phạm vi khoảng cách $50 text(" m")$, vận tốc của xe không được vượt quá $25 text(" m/s")$ (tức $90 text(" km/h")$).]),
    [Nếu tăng gấp đôi vận tốc xe từ $10 text(" m/s")$ lên $20 text(" m/s")$ thì quãng đường dừng xe an toàn cũng chỉ tăng gấp đôi.]
  ),
  loigiai: [
    #step([Tính khi v = 10m/s])
    $S(10) = 0.75(10) + 0.05(10)^2 = 7.5 + 5 = 12.5 text(" m")$. Mệnh đề a ĐÚNG.

    #step([Tính khi v = 20m/s])
    $S(20) = 0.75(20) + 0.05(20)^2 = 15 + 20 = 35 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Điều kiện để S <= 50m])
    $0.05 v^2 + 0.75 v <= 50 <=> v^2 + 15 v - 1000 <= 0 <=> (v - 25)(v + 40) <= 0 <=> 0 <= v <= 25 text(" m/s")$.
    Đổi sang km/h: $25 times 3.6 = 90 text(" km/h")$. Mệnh đề c ĐÚNG.

    #step([Tỉ lệ tăng quãng đường dừng])
    Khi vận tốc tăng gấp đôi từ $10$ lên $20 text(" m/s")$, quãng đường dừng tăng từ $12.5 text(" m")$ lên $35 text(" m")$.
    Tỉ số tăng: $35 / 12.5 = 2.8$ lần (gần gấp $3$ lần, chứ không phải tăng gấp đôi).
    Khẳng định chỉ tăng gấp đôi là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Khoảng cách an toàn giữa hai tàu trên biển)
#ds([Trên hải đồ, một tàu chở hàng $A$ đang ở vị trí $(-80; 0)$ (đơn vị tọa độ là hải lý) và di chuyển thẳng về hướng Đông (về phía gốc $O$) với vận tốc không đổi $20$ hải lý/giờ.
Cùng lúc đó, tàu chở dầu $B$ xuất phát từ gốc tọa độ $O$ di chuyển thẳng về hướng Bắc với vận tốc không đổi $15$ hải lý/giờ.
Sau $t$ giờ kể từ thời điểm ban đầu ($t >= 0$):
- Vị trí của tàu $A$ là $(-80 + 20t; 0)$.
- Vị trí của tàu $B$ là $(0; 15t)$.
Bình phương khoảng cách giữa hai tàu là:
$ d^2(t) = (-80 + 20t)^2 + (15t)^2 = 625 t^2 - 3200 t + 6400 $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tại thời điểm ban đầu ($t = 0$), khoảng cách giữa hai con tàu là $80$ hải lý.]),
    True([Công thức tính bình phương khoảng cách giữa hai con tàu theo thời gian $t$ là $d^2(t) = 625 t^2 - 3200 t + 6400$.]),
    True([Khoảng cách giữa hai con tàu đạt giá trị nhỏ nhất tại thời điểm $t = 2.56$ giờ.]),
    [Khoảng cách ngắn nhất giữa hai con tàu trong suốt hành trình là lớn hơn $50$ hải lý.]
  ),
  loigiai: [
    #step([Khoảng cách ban đầu])
    Tại $t = 0$: $d^2(0) = 6400 => d(0) = 80$ hải lý. Mệnh đề a ĐÚNG.

    #step([Bình phương khoảng cách])
    $d^2(t) = (20t - 80)^2 + (15t)^2 = (400t^2 - 3200t + 6400) + 225t^2 = 625t^2 - 3200t + 6400$. Mệnh đề b ĐÚNG.

    #step([Thời điểm khoảng cách ngắn nhất])
    Hàm số $d^2(t)$ có $a = 625 > 0$ đạt cực tiểu tại hoành độ đỉnh:
    $ t_I = - (-3200) / (2 cdot 625) = 3200 / 1250 = 2.56 text(" giờ") $
    Mệnh đề c ĐÚNG.

    #step([Tính khoảng cách ngắn nhất])
    $d^2(2.56) = 625(2.56)^2 - 3200(2.56) + 6400 = 625(6.5536) - 8192 + 6400 = 4096 - 8192 + 6400 = 2304$.
    Khoảng cách ngắn nhất: $d_text("min") = sqrt(2304) = 48$ hải lý.
    Vì $48$ hải lý $< 50$ hải lý nên khẳng định lớn hơn $50$ hải lý là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Đường bay Flycam quét qua thung lũng)
#ds([Một Flycam địa chất quét qua một thung lũng có mặt cắt dạng parabol với phương trình:
$ y = 0.02 x^2 - 18 text(" (m)") $ (với $-30 <= x <= 30$, mặt phẳng chuẩn mặt đất là $y = 0$).
Flycam bay ngang ổn định ở độ cao $14 text(" m")$ so với mặt đất (tức đường bay nằm trên đường thẳng $y = 14$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Miệng của thung lũng trên mặt đất ($y = 0$) có chiều rộng là $60 text(" m")$.]),
    True([Đáy thung lũng ở điểm thấp nhất có độ sâu là $18 text(" m")$ so với mặt đất.]),
    True([Khoảng cách thẳng đứng từ Flycam đến đáy thung lũng bằng $32 text(" m")$.]),
    [Khi Flycam ở vị trí có hoành độ $x = 20 text(" m")$, khoảng cách thẳng đứng từ Flycam đến sườn thung lũng là $20 text(" m")$.]
  ),
  loigiai: [
    #step([Chiều rộng miệng thung lũng])
    Tại $y = 0$: $0.02 x^2 - 18 = 0 <=> x^2 = 900 <=> x = plus.minus 30$.
    Chiều rộng là: $30 - (-30) = 60 text(" m")$. Mệnh đề a ĐÚNG.

    #step([Độ sâu đáy thung lũng])
    Đáy thung lũng tại $x = 0$: $y(0) = -18 text(" m")$ (độ sâu $18 text(" m")$). Mệnh đề b ĐÚNG.

    #step([Khoảng cách từ Flycam đến đáy])
    Flycam ở độ cao $y = 14 text(" m")$, đáy ở $y = -18 text(" m")$.
    Khoảng cách thẳng đứng là: $14 - (-18) = 32 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Khoảng cách tại x = 20m])
    Tại $x = 20 text(" m")$, độ cao sườn thung lũng là:
    $ y(20) = 0.02(20)^2 - 18 = 0.02(400) - 18 = 8 - 18 = -10 text(" m") $
    Khoảng cách thẳng đứng từ Flycam ($y = 14$) đến sườn thung lũng là:
    $ Delta y = 14 - (-10) = 24 text(" m") $ (chứ không phải $20 text(" m")$).
    Khẳng định khoảng cách là $20 text(" m")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Máng xối tôn thoát nước mưa)
#ds([Một máng xối thoát nước mưa có thiết diện là hình chữ nhật được uốn từ tấm tôn phẳng rộng $40 text(" cm")$ bằng cách gập vuông góc hai mép tôn lên với độ cao $x text(" cm")$ ($0 < x < 20$).
Đáy máng có chiều rộng là $40 - 2x text(" cm")$.
Diện tích mặt cắt ngang của lòng máng là:
$ S(x) = x(40 - 2x) = -2x^2 + 40x " (cm"^2")" $
Quy chuẩn thoát nước mưa công trình yêu cầu diện tích mặt cắt ngang của máng phải đạt từ $150 text(" cm"^2)$ trở lên để đảm bảo không bị tràn nước khi có mưa lớn.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu gập thành máng cao $x = 5 text(" cm")$ thì diện tích mặt cắt ngang của máng bằng $150 text(" cm"^2)$.]),
    True([Diện tích mặt cắt ngang của máng đạt giá trị lớn nhất khi chiều cao thành gập là $x = 10 text(" cm")$.]),
    True([Diện tích mặt cắt ngang lớn nhất mà lòng máng có thể đạt được là $200 text(" cm"^2)$.]),
    [Khoảng giá trị của chiều cao gập $x$ để máng đáp ứng quy chuẩn kỹ thuật ($S(x) >= 150 text(" cm"^2)$) là $5 text(" cm") <= x <= 12 text(" cm")$.]
  ),
  loigiai: [
    #step([Kiểm tra khi x = 5cm])
    $S(5) = 5(40 - 2(5)) = 5(30) = 150 text(" cm"^2)$. Mệnh đề a ĐÚNG.

    #step([Chiều cao gập để diện tích lớn nhất])
    Đỉnh parabol tại:
    $ x_I = - 40 / (2(-2)) = 10 text(" cm") $
    Mệnh đề b ĐÚNG.

    #step([Diện tích lớn nhất])
    $S_text("max") = S(10) = -2(10)^2 + 40(10) = -200 + 400 = 200 text(" cm"^2)$. Mệnh đề c ĐÚNG.

    #step([Điều kiện đáp ứng quy chuẩn kỹ thuật])
    $S(x) >= 150 <=> -2x^2 + 40x >= 150 <=> 2x^2 - 40x + 150 <= 0 <=> x^2 - 20x + 75 <= 0 <=> (x - 5)(x - 15) <= 0 <=> 5 <= x <= 15 text(" cm")$.
    Khẳng định $5 text(" cm") <= x <= 12 text(" cm")$ là SAI (thiếu khoảng từ $12$ đến $15 text(" cm")$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Quãng đường dừng an toàn)
#tln([Trong bài toán hãm phanh an toàn ô tô với hàm $S(v) = 0.75 v + 0.05 v^2$, khi xe chạy với vận tốc $20 text(" m/s")$ thì quãng đường dừng an toàn là bao nhiêu mét?],
    [35],
    loigiai: [
        #step([Tính quãng đường dừng])
        $ S(20) = 0.75(20) + 0.05(20)^2 = 15 + 0.05(400) = 15 + 20 = 35 text(" m") $
    ]
)

// TLN 2 (Khoảng cách ngắn nhất giữa hai tàu)
#tln([Trong bài toán hai tàu hàng hải di chuyển, khoảng cách ngắn nhất giữa hai con tàu trong suốt hành trình là bao nhiêu hải lý?],
    [48],
    loigiai: [
        #step([Tính khoảng cách nhỏ nhất])
        Biểu thức: $d^2(t) = 625 t^2 - 3200 t + 6400$.
        Đạt cực tiểu tại $t = 2.56 text(" giờ")$.
        $ d^2_text("min") = 2304 => d_text("min") = sqrt(2304) = 48 text(" hải lý") $
    ]
)

// TLN 3 (Khoảng cách thẳng đứng từ Flycam đến đáy)
#tln([Trong bài toán Flycam trắc địa bay ngang ở độ cao $14 text(" m")$ qua hẻm núi có đáy sâu $18 text(" m")$, khoảng cách thẳng đứng từ Flycam đến đáy hẻm núi là bao nhiêu mét?],
    [32],
    loigiai: [
        #step([Tính khoảng cách thẳng đứng])
        $ Delta y = y_text("Flycam") - y_text("đáy") = 14 - (-18) = 32 text(" m") $
    ]
)

// TLN 4 (Diện tích mặt cắt máng xối lớn nhất)
#tln([Trong bài toán máng xối thoát nước mưa, diện tích mặt cắt ngang lớn nhất mà máng có thể đạt được là bao nhiêu $text("cm"^2)$?],
    [200],
    loigiai: [
        #step([Tính diện tích cực đại])
        Hàm diện tích: $S(x) = -2x^2 + 40x$.
        Đạt cực đại tại $x = 10 text(" cm")$.
        $ S_text("max") = -2(10)^2 + 40(10) = 200 text(" cm"^2) $
    ]
)

// TLN 5 (Độ cao dây cáp điện cao thế)
#tln([Trong bài toán dây cáp điện cao thế có phương trình $y = 0.001 x^2 + 20$, tại vị trí cách tâm hai cột điện một khoảng $50 text(" m")$, độ cao của dây cáp so với mặt đất là bao nhiêu mét? (Nhập kết quả dưới dạng số thập phân)],
    [22.5],
    loigiai: [
        #step([Tính độ cao dây cáp tại x = 50])
        $ y(50) = 0.001(50)^2 + 20 = 0.001(2500) + 20 = 2.5 + 20 = 22.5 text(" m") $
    ]
)

// TLN 6 (Áp suất lớn nhất ống dẫn khí)
#tln([Áp suất lớn nhất cho phép trong đường ống dẫn khí đốt vượt đồi $p(x) = -0.1 x^2 + 4x + 10$ là bao nhiêu bar?],
    [50],
    loigiai: [
        #step([Tính áp suất cực đại])
        Hàm áp suất: $p(x) = -0.1 x^2 + 4x + 10$.
        Đạt cực đại tại $x = 20 text(" km")$.
        $ p(20) = -0.1(400) + 4(20) + 10 = 50 text(" bar") $
    ]
)

] // end make-questions

#make-questions()
