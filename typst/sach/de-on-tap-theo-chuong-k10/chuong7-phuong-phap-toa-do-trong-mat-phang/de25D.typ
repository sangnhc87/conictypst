#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("e11d48") // Rose

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VII: PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG",
  exam-title: "CHUYÊN ĐỀ TOÁN THỰC TẾ 1: GIAO THÔNG, CẦU ĐƯỜNG & QUY HOẠCH ĐÔ THỊ (ĐỀ SỐ 25D - MÃ ĐỀ 170)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "170",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một tuyến đường sắt đô thị chạy thẳng theo đường thẳng $d: 3x + 4y - 120 = 0$ (đơn vị: mét).
Một trạm biến áp điện đặt tại điểm $A(10; 15)$.
Khoảng cách ngắn nhất từ trạm biến áp đến tuyến đường sắt bằng],
    (
        True([$6 text(" m")$]),
        [$10 text(" m")$],
        [$8 text(" m")$],
        [$12 text(" m")$]
    ),
    loigiai: [
        Khoảng cách từ trạm biến áp $A(10; 15)$ đến đường thẳng $d$:
        $ d(A, d) = (|3(10) + 4(15) - 120|) / sqrt(3^2 + 4^2) = (|30 + 60 - 120|) / 5 = (|-30|) / 5 = 6 text(" m") $
    ]
)

// TN 2
#tn([Một vòng xoay ngã tư (bùng binh) hình tròn có tâm đặt tại vị trí $I(20; 30)$ và bán kính đảo giao thông là $R = 15 text(" m")$.
Phương trình đường viền giới hạn của đảo giao thông là],
    (
        True([$(x - 20)^2 + (y - 30)^2 = 225$]),
        [$(x + 20)^2 + (y + 30)^2 = 225$],
        [$(x - 20)^2 + (y - 30)^2 = 15$],
        [$(x - 30)^2 + (y - 20)^2 = 225$]
    ),
    loigiai: [
        Đường tròn tâm $I(20; 30)$, bán kính $R = 15 text(" m")$ có phương trình:
        $ (x - 20)^2 + (y - 30)^2 = 15^2 = 225 $
    ]
)

// TN 3
#tn([Một khúc cua an toàn của đường cao tốc là một cung tròn tiếp xúc với trục đường $O y$ tại gốc $O(0; 0)$ và có tâm $I(R; 0)$ nằm trên trục hoành $O x$.
Biết bán kính thiết kế an toàn chống lật xe của khúc cua là $R = 250 text(" m")$.
Phương trình đường tròn chứa khúc cua là],
    (
        True([$(x - 250)^2 + y^2 = 62500$]),
        [$x^2 + (y - 250)^2 = 62500$],
        [$(x + 250)^2 + y^2 = 62500$],
        [$(x - 250)^2 + y^2 = 250$]
    ),
    loigiai: [
        Tâm $I(250; 0)$, bán kính $R = 250 text(" m")$.
        Phương trình đường tròn: $(x - 250)^2 + y^2 = 250^2 = 62500$.
    ]
)

// TN 4
#tn([Một vòm cầu bê tông vượt sông có dạng Parabol với chiều rộng nhịp cầu là $60 text(" m")$ và chiều cao tại đỉnh vòm là $15 text(" m")$.
Chọn hệ trục $O x y$ có gốc $O$ là trung điểm chân nhịp cầu trên mặt đường, trục tung đi qua đỉnh vòm.
Phương trình Parabol của vòm cầu là],
    (
        True([$y = - 1 / 60 x^2 + 15$]),
        [$y = - 1 / 30 x^2 + 15$],
        [$y = - 1 / 15 x^2 + 15$],
        [$y = - 1 / 120 x^2 + 15$]
    ),
    loigiai: [
        Dạng Parabol: $y = a x^2 + 15$.
        Chân nhịp cầu có độ rộng $60 text(" m")$ nên tọa độ chân vòm là $B(30; 0)$.
        Thay $B(30; 0)$ vào phương trình:
        $ 0 = a(30^2) + 15 <=> 900a = -15 <=> a = - 15 / 900 = - 1 / 60 $
        Phương trình: $y = - 1 / 60 x^2 + 15$.
    ]
)

// TN 5
#tn([Một cây cầu treo dây võng có hai trụ tháp cao $80 text(" m")$ cách nhau $400 text(" m")$.
Dây cáp chính có dạng Parabol võng xuống điểm thấp nhất cách mặt cầu $10 text(" m")$ tại vị trí chính giữa hai tháp.
Độ cao của dây cáp chính tại vị trí cách một trụ tháp $100 text(" m")$ bằng],
    (
        True([$27.5 text(" m")$]),
        [$25 text(" m")$],
        [$32.5 text(" m")$],
        [$20 text(" m")$]
    ),
    loigiai: [
        Chọn gốc tọa độ $O$ tại mặt cầu dưới điểm thấp nhất của dây cáp.
        Đỉnh parabol là $M(0; 10)$, phương trình có dạng $y = a x^2 + 10$.
        Hai đỉnh tháp cách đều có tọa độ $(plus.minus 200; 80)$.
        Thay $(200; 80)$: $80 = a(200^2) + 10 <=> 40000a = 70 <=> a = 7 / 4000$.
        Vị trí cách trụ tháp $100 text(" m")$ tương ứng với khoảng cách đến tâm là $x = 200 - 100 = 100 text(" m")$:
        $ y = 7 / 4000 (100^2) + 10 = 70 / 4 + 10 = 17.5 + 10 = 27.5 text(" m") $
    ]
)

// TN 6
#tn([Một hầm chui đường bộ có mặt cắt là nửa trên hình Elip rộng $16 text(" m")$ ($2a = 16$) và cao $6 text(" m")$ ($b = 6$).
Chiều cao tĩnh không của vòm hầm tại vị trí cách tâm đường $4 text(" m")$ ($x = 4$) bằng],
    (
        True([$3 sqrt(3) text(" m")$]),
        [$5 text(" m")$],
        [$4.5 text(" m")$],
        [$3.6 text(" m")$]
    ),
    loigiai: [
        Phương trình nửa elip: $x^2 / 64 + y^2 / 36 = 1$ ($y >= 0$).
        Tại $x = 4 text(" m")$:
        $ 4^2 / 64 + y^2 / 36 = 1 <=> 16 / 64 + y^2 / 36 = 1 <=> 1 / 4 + y^2 / 36 = 1 <=> y^2 / 36 = 3 / 4 $
        $ y^2 = 36 times 3 / 4 = 27 => y = sqrt(27) = 3 sqrt(3) text(" m") approx 5.20 text(" m") $
    ]
)

// TN 7
#tn([Để kết nối giao thông giữa hai khu đô thị mới tại $A(2; 5)$ và $B(8; 11)$, thành phố quy hoạch một tuyến đường thẳng nối trực tiếp $A$ và $B$. Phương trình tổng quát của tuyến đường này là],
    (
        True([$x - y + 3 = 0$]),
        [$x + y - 7 = 0$],
        [$x - y - 3 = 0$],
        [$2x - y + 1 = 0$]
    ),
    loigiai: [
        $vec(A B) = (8 - 2; 11 - 5) = (6; 6) = 6(1; 1)$.
        Vectơ pháp tuyến: $vec(n) = (1; -1)$.
        Phương trình đường thẳng $A B$:
        $ 1(x - 2) - 1(y - 5) = 0 <=> x - y + 3 = 0 $
    ]
)

// TN 8
#tn([Hai tuyến tàu điện trên cao Metro chạy song song có trục ray được mô hình bởi hai đường thẳng $d_1: 4x - 3y + 10 = 0$ và $d_2: 4x - 3y - 25 = 0$ (đơn vị: mét).
Khoảng cách an toàn giữa hai trục ray bằng],
    (
        True([$7 text(" m")$]),
        [$5 text(" m")$],
        [$15 text(" m")$],
        [$3.5 text(" m")$]
    ),
    loigiai: [
        Khoảng cách giữa hai đường song song:
        $ d = (|10 - (-25)|) / sqrt(4^2 + (-3)^2) = 35 / 5 = 7 text(" m") $
    ]
)

// TN 9
#tn([Hai trục đại lộ chính trong khu đô thị là Đại lộ Đông Tây $d_1: 2x + y - 8 = 0$ và Đại lộ Bắc Nam $d_2: x - 2y + 1 = 0$.
Tọa độ nút giao thông ngã tư giữa hai đại lộ là],
    (
        True([$(3; 2)$]),
        [$(2; 3)$],
        [$(1; 6)$],
        [$(4; 0)$]
    ),
    loigiai: [
        Tọa độ nút giao là nghiệm của hệ phương trình:
        $ cases(2x + y = 8, x - 2y = -1) <=> cases(4x + 2y = 16, x - 2y = -1) <=> cases(5x = 15 => x = 3, y = 8 - 2(3) = 2) $
        Nút giao có tọa độ $(3; 2)$.
    ]
)

// TN 10
#tn([Dải phân cách trung tâm cách đều hai tuyến đường chạy song song $d_1: 3x - 4y + 2 = 0$ và $d_2: 3x - 4y - 18 = 0$ có phương trình là],
    (
        True([$3x - 4y - 8 = 0$]),
        [$3x - 4y - 10 = 0$],
        [$3x - 4y - 16 = 0$],
        [$3x - 4y + 8 = 0$]
    ),
    loigiai: [
        Đường thẳng cách đều hai đường song song $a x + b y + c_1 = 0$ và $a x + b y + c_2 = 0$ có phương trình:
        $ a x + b y + (c_1 + c_2) / 2 = 0 <=> 3x - 4y + (2 + (-18)) / 2 = 0 <=> 3x - 4y - 8 = 0 $
    ]
)

// TN 11
#tn([Tại một khúc cua chữ Y, một gương cầu lồi đặt tại gốc tọa độ $O(0; 0)$ có bán kính $R = 2 text(" m")$.
Một bức tường rào che khuất tầm nhìn nằm trên đường thẳng $d: x + y - 10 = 0$.
Khoảng cách từ tâm gương cầu lồi đến bức tường rào bằng],
    (
        True([$5 sqrt(2) text(" m")$]),
        [$10 text(" m")$],
        [$5 text(" m")$],
        [$2 sqrt(5) text(" m")$]
    ),
    loigiai: [
        $ d(O, d) = (|0 + 0 - 10|) / sqrt(1^2 + 1^2) = 10 / sqrt(2) = 5 sqrt(2) text(" m") $
    ]
)

// TN 12
#tn([Chóa đèn pha của một xe tự hành ban đêm có mặt cắt dạng Parabol $y^2 = 24x$ (đơn vị: centimét).
Bóng đèn LED hiệu suất cao đặt tại tiêu điểm $F$ của gương để tạo chùm tia chiếu xa song song.
Khoảng cách từ đỉnh chóa đèn đến bóng đèn LED bằng],
    (
        True([$6 text(" cm")$]),
        [$12 text(" cm")$],
        [$24 text(" cm")$],
        [$3 text(" cm")$]
    ),
    loigiai: [
        $2p = 24 => p = 12 text(" cm")$.
        Khoảng cách từ đỉnh Parabol đến tiêu điểm: $O F = p / 2 = 12 / 2 = 6 text(" cm")$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Cầu vòm Parabol có CeTZ)
#ds([Một cây cầu vòm thép có mặt cắt là đường Parabol $y = - 1 / 60 x^2 + 15$ (đơn vị: mét).
Mặt sàn cầu dành cho xe cơ giới nằm ngang trùng với trục hoành $O x$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-4.5, 0), (4.5, 0), stroke: 1.2pt + gray)
  line((0, -0.5), (0, 3.2), stroke: 0.8pt, mark: (end: "stealth"))
  content((4.3, -0.3), [$x$])
  content((-0.3, 3), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Vẽ vòm Parabol nhịp L = 60, H = 15 (scale x: 0.1, y: 0.16)
  // x từ -30 đến 30 -> canvas x từ -3 đến 3, đỉnh (0, 2.4)
  line((-3, 0), (-2.4, 0.86), (-1.8, 1.54), (-1.2, 2.02), (-0.6, 2.3), (0, 2.4),
       (0.6, 2.3), (1.2, 2.02), (1.8, 1.54), (2.4, 0.86), (3, 0), stroke: 1.5pt + rgb("e11d48"))
       
  // Các thanh treo đứng
  line((-1.8, 0), (-1.8, 1.54), stroke: (dash: "dashed", paint: blue))
  line((-0.9, 0), (-0.9, 2.18), stroke: (dash: "dashed", paint: blue))
  line((0, 0), (0, 2.4), stroke: (dash: "dashed", paint: blue))
  line((0.9, 0), (0.9, 2.18), stroke: (dash: "dashed", paint: blue))
  line((1.8, 0), (1.8, 1.54), stroke: (dash: "dashed", paint: blue))
  
  content((0, 2.6), [$H = 15 text(" m")$])
  content((-3, -0.3), [$-30$])
  content((3, -0.3), [$30$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Chiều rộng nhịp cầu giữa hai chân vòm trên mặt sàn cầu bằng $60 text(" m")$.]),
    True([Chiều cao của vòm cầu tại điểm cao nhất giữa cầu bằng $15 text(" m")$.]),
    True([Tại vị trí cách tâm cầu $18 text(" m")$, độ cao của thanh treo cáp thẳng đứng là $9.6 text(" m")$.]),
    [Một thanh cáp treo thẳng đứng tại vị trí cách mố cầu $5 text(" m")$ ($x = 25$) có chiều dài bằng $8 text(" m")$.]
  ),
  loigiai: [
    #step([Nhịp cầu])
    Chân cầu tại $y = 0 <=> - 1 / 60 x^2 + 15 = 0 <=> x^2 = 900 <=> x = plus.minus 30$.
    Nhịp cầu là $30 - (-30) = 60 text(" m")$. Mệnh đề a ĐÚNG.

    #step([Chiều cao đỉnh])
    Tại $x = 0 => y = 15 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Chiều cao tại x = 18m])
    $y = - 1 / 60 (18^2) + 15 = - 324 / 60 + 15 = - 5.4 + 15 = 9.6 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Thanh treo tại x = 25m])
    $y = - 1 / 60 (25^2) + 15 = - 625 / 60 + 15 = - 10.42 + 15 = 4.58 text(" m")$ (chứ không phải $8 text(" m")$).
    Khẳng định chiều dài bằng $8 text(" m")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Hầm chui vòm bán elip)
#ds([Một hầm đường bộ qua núi có mặt cắt là nửa trên hình Elip có phương trình $x^2 / 64 + y^2 / 36 = 1$ ($y >= 0$, đơn vị: mét).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Chiều rộng của mặt đường xe chạy dưới chân vòm hầm bằng $16 text(" m")$.]),
    True([Chiều cao tại điểm cao nhất của vòm hầm bằng $6 text(" m")$.]),
    True([Tại vị trí mép làn xe cách tâm đường $4 text(" m")$, chiều cao tĩnh không của vòm hầm đạt $3 sqrt(3) text(" m")$ ($approx 5.20 text(" m")$).]),
    [Một xe chuyên dụng chở cánh quạt điện gió có bề rộng thân xe $6 text(" m")$ và chiều cao $5.8 text(" m")$ có thể lưu thông an toàn qua hầm.]
  ),
  loigiai: [
    #step([Kích thước cơ bản])
    $a^2 = 64 => a = 8$, chiều rộng chân hầm $2a = 16 text(" m")$. Mệnh đề a ĐÚNG.
    $b^2 = 36 => b = 6$, chiều cao tại đỉnh $b = 6 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Tĩnh không tại x = 4m])
    $y = 6 sqrt(1 - 4^2 / 64) = 6 sqrt(3 / 4) = 3 sqrt(3) text(" m")$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra xe chở cánh quạt điện gió])
    Bề rộng xe $6 text(" m")$ nên mép xe cách tâm đường $x = 6 / 2 = 3 text(" m")$.
    Chiều cao vòm hầm tại $x = 3 text(" m")$:
    $ y = 6 sqrt(1 - 3^2 / 64) = 6 sqrt(55 / 64) = (3 sqrt(55)) / 4 approx 5.56 text(" m") $
    Vì $5.56 text(" m") < 5.8 text(" m")$ nên nóc xe sẽ va chạm vào thành vòm hầm. Xe không thể qua lọt.
    Khẳng định lưu thông an toàn là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Nút giao thông cao tốc và trạm cân)
#ds([Trong quy hoạch nút giao lập thể cao tốc, đường cong chuyển tiếp là một cung tròn tâm $I(50; 50)$ và bán kính $R = 40 text(" m")$.
Một trạm cân tải trọng tự động được đặt tại vị trí $A(90; 80)$ (đơn vị: mét).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương trình đường tròn chứa cung rẽ là $(x - 50)^2 + (y - 50)^2 = 1600$.]),
    True([Khoảng cách từ tâm cung rẽ $I$ đến trạm cân $A$ bằng $50 text(" m")$.]),
    True([Trạm cân $A$ nằm bên ngoài đường cong cung rẽ của nút giao.]),
    [Khoảng cách ngắn nhất từ trạm cân $A$ đến mép đường cong cung rẽ bằng $20 text(" m")$.]
  ),
  loigiai: [
    #step([Phương trình đường tròn])
    $(x - 50)^2 + (y - 50)^2 = 40^2 = 1600$. Mệnh đề a ĐÚNG.

    #step([Khoảng cách IA])
    $I A = sqrt((90 - 50)^2 + (80 - 50)^2) = sqrt(40^2 + 30^2) = 50 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Vị trí của trạm cân])
    Vì $I A = 50 > R = 40$ nên trạm cân $A$ nằm bên ngoài đường cong. Mệnh đề c ĐÚNG.

    #step([Khoảng cách ngắn nhất đến cung rẽ])
    $d_text("min") = I A - R = 50 - 40 = 10 text(" m")$ (chứ không phải $20 text(" m")$).
    Khẳng định khoảng cách ngắn nhất bằng $20 text(" m")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Dải phân cách và hành lang an toàn cao tốc)
#ds([Cho hai tuyến đường cao tốc song song có trục đường là $d_1: 3x - 4y + 30 = 0$ và $d_2: 3x - 4y - 20 = 0$ (đơn vị: mét).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tuyến dải cây xanh cách đều hai tuyến đường có phương trình là $3x - 4y + 5 = 0$.]),
    True([Khoảng cách giữa hai tuyến đường cao tốc bằng $10 text(" m")$.]),
    True([Một cột đèn chiếu sáng đặt tại vị trí $P(0; 2)$ nằm ở khoảng giữa hai tuyến đường cao tốc.]),
    [Khoảng cách từ cột đèn $P(0; 2)$ đến tuyến đường $d_1$ bằng khoảng cách từ $P$ đến tuyến đường $d_2$.]
  ),
  loigiai: [
    #step([Dải cây xanh trung tâm])
    $3x - 4y + (30 + (-20)) / 2 = 0 <=> 3x - 4y + 5 = 0$. Mệnh đề a ĐÚNG.

    #step([Khoảng cách giữa hai đường])
    $d(d_1, d_2) = (|30 - (-20)|) / sqrt(3^2 + (-4)^2) = 50 / 5 = 10 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Vị trí điểm P])
    Thay $P(0; 2)$: $3(0) - 4(2) + 30 = 22 > 0$ và $3(0) - 4(2) - 20 = -28 < 0$.
    Hai giá trị trái dấu nhau nên $P$ nằm ở dải đất giữa hai đường. Mệnh đề c ĐÚNG.

    #step([So sánh khoảng cách])
    $d(P, d_1) = 22 / 5 = 4.4 text(" m")$ và $d(P, d_2) = 28 / 5 = 5.6 text(" m")$.
    Hai khoảng cách không bằng nhau ($4.4 != 5.6$).
    Khẳng định bằng nhau là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Độ cao thanh treo cáp vòm Parabol)
#tln([Trong bài toán vòm cầu Parabol $y = - 1 / 60 x^2 + 15$, độ cao của thanh treo cáp tại vị trí cách tâm cầu $18 text(" m")$ bằng bao nhiêu mét?],
    [9.6],
    loigiai: [
        #step([Thay x = 18m])
        $ y = - 1 / 60 (18^2) + 15 = - 5.4 + 15 = 9.6 text(" m") $
    ]
)

// TLN 2 (Độ cao dây cáp cầu treo)
#tln([Trong bài toán cầu treo dây võng hai tháp cách nhau $400 text(" m")$ cao $80 text(" m")$ võng thấp nhất $10 text(" m")$, độ cao của dây cáp tại vị trí cách một trụ tháp $100 text(" m")$ bằng bao nhiêu mét?],
    [27.5],
    loigiai: [
        #step([Tính độ cao y])
        $x = 200 - 100 = 100 text(" m")$.
        $ y = 7 / 4000 (100^2) + 10 = 17.5 + 10 = 27.5 text(" m") $
    ]
)

// TLN 3 (Khoảng cách hai trục ray metro)
#tln([Trong bài toán hai tuyến tàu điện chạy song song $4x - 3y + 10 = 0$ và $4x - 3y - 25 = 0$, khoảng cách an toàn giữa hai trục ray bằng bao nhiêu mét?],
    [7],
    loigiai: [
        #step([Tính khoảng cách])
        $ d = (|10 - (-25)|) / 5 = 35 / 5 = 7 text(" m") $
    ]
)

// TLN 4 (Khoảng cách trạm biến áp đến đường sắt)
#tln([Trong bài toán tuyến đường sắt $3x + 4y - 120 = 0$ và trạm biến áp $A(10; 15)$, khoảng cách ngắn nhất từ trạm đến đường ray bằng bao nhiêu mét?],
    [6],
    loigiai: [
        #step([Tính khoảng cách])
        $ d = (|3(10) + 4(15) - 120|) / 5 = 30 / 5 = 6 text(" m") $
    ]
)

// TLN 5 (Khoảng cách ngắn nhất từ trạm cân đến cung rẽ)
#tln([Trong bài toán nút giao thông cao tốc, khoảng cách ngắn nhất từ trạm cân $A(90; 80)$ đến đường cong cung rẽ tâm $I(50; 50)$ bán kính $R = 40 text(" m")$ bằng bao nhiêu mét?],
    [10],
    loigiai: [
        #step([Tính khoảng cách ngắn nhất])
        $I A = sqrt(40^2 + 30^2) = 50 text(" m")$.
        $ d_text("min") = I A - R = 50 - 40 = 10 text(" m") $
    ]
)

// TLN 6 (Khoảng cách đỉnh chóa đến bóng đèn LED)
#tln([Trong bài toán chóa đèn pha xe tự hành $y^2 = 24x$, khoảng cách từ đỉnh chóa đến bóng đèn LED đặt tại tiêu điểm bằng bao nhiêu centimét?],
    [6],
    loigiai: [
        #step([Tính tiêu cự])
        $ 2p = 24 => p = 12 $
        $ O F = p / 2 = 6 text(" cm") $
    ]
)

] // end make-questions

#make-questions()
