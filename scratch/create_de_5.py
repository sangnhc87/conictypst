import os

# Let's define the code content for 2026-Tự-Chế-Lần-5.typ
def create_de_5():
    content = r"""#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.1"
#import "../bbt.typ": *
#import "../math-sym.typ": *

#let mode = "loigiai"
#let accent = classic.blue

#show math.equation: set text(fill: black)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "THPT NGUYỄN HỮU CẢNH",
  school: "ĐỀ THI THỬ LẦN 5",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "205",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

  #tn(
    [Tập nghiệm của phương trình $log_3 (2x - 1) = 2$ là],
    (
      [$S = {4}$.],
      True([$S = {5}$.]),
      [$S = {9/2}$.],
      [$S = {3}$.],
    ),
    loigiai: [
      Điều kiện: $2x - 1 > 0 <=> x > 1/2$.
      Phương trình tương đương: $2x - 1 = 3^2 <=> 2x - 1 = 9 <=> 2x = 10 <=> x = 5$ (thỏa mãn).
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, cho đường thẳng $d: (x - 1)/2 = (y + 2)/(-1) = z/3$. Vectơ nào dưới đây là một vectơ chỉ phương của $d$?],
    (
      [$arrow(u) = (1; -2; 0)$.],
      [$arrow(u) = (-2; 1; 3)$.],
      True([$arrow(u) = (2; -1; 3)$]),
      [$arrow(u) = (2; 1; 3)$.],
    ),
    loigiai: [
      Từ phương trình chính tắc của đường thẳng $d$, ta đọc được một vectơ chỉ phương là $arrow(u) = (2; -1; 3)$.
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Hàm số $y = -x^3 + 3x^2 - 4$ nghịch biến trên khoảng nào dưới đây?],
    (
      [$(0; 2)$.],
      [$(-infinity; 2)$.],
      [$(0; +infinity)$.],
      True([$(-infinity; 0)$ và $(2; +infinity)$]),
    ),
    loigiai: [
      Ta có $y' = -3x^2 + 6x = -3x(x - 2)$.
      Cho $y' = 0 <=> x = 0$ hoặc $x = 2$.
      Hàm số nghịch biến khi $y' <= 0 <=> x in (-infinity; 0] union [2; +infinity)$.
      Chọn đáp án *D*.
    ]
  )

  #tn(
    [Cho hàm số $y = f(x)$ có đạo hàm liên tục trên đoạn $[1; 3]$ thỏa mãn $f(1) = 2$ và $f(3) = 8$. Tích phân $I = int_1^3 f'(x) dif x$ bằng],
    (
      [$10$.],
      True([$6$.]),
      [$4$.],
      [$-6$.],
    ),
    loigiai: [
      Ta có $I = int_1^3 f'(x) dif x = f(3) - f(1) = 8 - 2 = 6$. Chọn đáp án *B*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, cho hai điểm $A(1; 2; 3)$ và $B(3; 0; 1)$. Tọa độ trung điểm $M$ của đoạn thẳng $A B$ là],
    (
      [$(2; -2; -2)$.],
      [$(4; 2; 4)$.],
      True([$(2; 1; 2)$]),
      [$(1; -1; -1)$.],
    ),
    loigiai: [
      Tọa độ trung điểm $M$ của đoạn thẳng $A B$ là:
      $ x_M = (1+3)/2 = 2; quad y_M = (2+0)/2 = 1; quad z_M = (3+1)/2 = 2. $
      Do đó $M(2; 1; 2)$. Chọn đáp án *C*.
    ]
  )

  #tn(
    [Khảo sát chiều cao (đơn vị: cm) của 40 học sinh nam lớp 12 thu được kết quả:
      #align(center)[
        #table(
          columns: 5,
          align: center,
          stroke: 0.5pt + black,
          [Chiều cao (cm)], [$[160; 165)$], [$[165; 170)$], [$[170; 175)$], [$[175; 180)$],
          [Số học sinh], [5], [15], [12], [8],
        )
      ]
      Số trung vị của mẫu số liệu ghép nhóm này thuộc nhóm nào dưới đây?],
    (
      [$[160; 165)$.],
      True([$[165; 170)$]),
      [$[170; 175)$.],
      [$[175; 180)$.],
    ),
    loigiai: [
      Cỡ mẫu $n = 40$. Vị trí của số trung vị là $n/2 = 20$.
      Tần số tích lũy:
      - Nhóm 1: 5.
      - Nhóm 2: $5 + 15 = 20$.
      Do đó số trung vị nằm ở nhóm $[165; 170)$.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Nghiệm của phương trình $2^(x - 3) = 16$ là],
    (
      [$x = 4$.],
      [$x = 5$.],
      True([$x = 7$.]),
      [$x = 8$.],
    ),
    loigiai: [
      Ta có $2^(x - 3) = 16 <=> 2^(x - 3) = 2^4 <=> x - 3 = 4 <=> x = 7$.
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Họ tất cả các nguyên hàm của hàm số $f(x) = 1/x + e^x$ trên khoảng $(0; +infinity)$ là],
    (
      [$ln x - e^x + C$.],
      True([$ln x + e^x + C$.]),
      [$-1/x^2 + e^x + C$.],
      [$ln|x| + e^x + C$.],
    ),
    loigiai: [
      Với $x in (0; +infinity)$, ta có $int (1/x + e^x) dif x = ln x + e^x + C$. Chọn đáp án *B*.
    ]
  )

  #tn(
    [Đồ thị hàm số $y = (2x - 3)/(x + 1)$ có tiệm cận ngang là đường thẳng],
    (
      [$y = -3$.],
      [$x = -1$.],
      [$y = 1$.],
      True([$y = 2$.]),
    ),
    loigiai: [
      Ta có $lim_(x -> +-infinity) (2x-3)/(x+1) = 2$. Do đó tiệm cận ngang là $y = 2$. Chọn đáp án *D*.
    ]
  )

  #tn(
    [Trong một hộp chứa 5 viên bi đỏ và 7 viên bi xanh. Chọn ngẫu nhiên đồng thời 3 viên bi. Xác suất để chọn được 3 viên bi cùng màu đỏ là],
    (
      [$5/44$.],
      True([$1/22$]),
      [$7/220$.],
      [$12/220$.],
    ),
    loigiai: [
      Tổng số bi là 12. Không gian mẫu: $C_(12)^3 = 220$.
      Số cách chọn 3 viên bi đỏ là: $C_5^3 = 10$.
      Xác suất cần tìm: $P = 10/220 = 1/22$.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, cho mặt phẳng $(P): 2x - y + z - 3 = 0$. Khoảng cách từ điểm $M(1; 1; 2)$ đến mặt phẳng $(P)$ bằng],
    (
      [$2/sqrt(6)$.],
      True([$0$.]),
      [$1/sqrt(6)$.],
      [$3/sqrt(6)$.],
    ),
    loigiai: [
      Thay tọa độ $M(1; 1; 2)$ vào phương trình mặt phẳng $(P)$:
      $ 2(1) - 1 + 2 - 3 = 0. $
      Vì điểm $M$ thuộc mặt phẳng $(P)$ nên khoảng cách bằng 0.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Cho cấp số cộng $(u_n)$ có số hạng đầu $u_1 = 3$ và công sai $d = 2$. Số hạng thứ 5 của cấp số cộng bằng],
    (
      [$9$.],
      True([$11$.]),
      [$13$.],
      [$15$.],
    ),
    loigiai: [
      Ta có $u_n = u_1 + (n-1)d => u_5 = 3 + 4 \cdot 2 = 11$. Chọn đáp án *B*.
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN II — Trắc nghiệm đúng/sai
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai. Thí sinh trả lời từ Câu 1 đến Câu 4.], count: 4)

  #ds(
    [Cho hàm số $y = f(x) = x^3 - 3m x^2 + 3(m^2 - 1)x$ với $m$ là tham số thực. Xét tính đúng sai của các khẳng định sau:],
    (
      True([Với mọi giá trị của $m$, hàm số luôn có hai điểm cực trị.]),
      True([Hai điểm cực trị của đồ thị hàm số có hoành độ lần lượt là $x = m - 1$ và $x = m + 1$.]),
      [Giá trị cực đại của hàm số đạt được tại $x = m + 1$.],
      [Khoảng cách giữa hai điểm cực trị của đồ thị hàm số không phụ thuộc vào $m$ và luôn bằng $2$.],
    ),
    loigiai: [
      #ppgiai[
        - Tính đạo hàm $y'$ và tìm các điểm cực trị.
        - Khảo sát khoảng cách giữa hai điểm cực trị.
      ]
      Ta có $y' = 3x^2 - 6m x + 3(m^2 - 1)$.
      Cho $y' = 0 <=> x^2 - 2m x + m^2 - 1 = 0$.
      Biệt thức thu gọn: $Delta' = m^2 - (m^2 - 1) = 1 > 0$ với mọi $m$.
      Do đó phương trình $y' = 0$ luôn có 2 nghiệm phân biệt với mọi $m$. Ý a *ĐÚNG*.
      
      Nghiệm của phương trình là: $x_1 = m - 1; x_2 = m + 1$. Ý b *ĐÚNG*.
      
      Bảng biến thiên cho thấy hệ số $a = 1 > 0$, nên hàm số đạt cực đại tại nghiệm nhỏ hơn là $x = m - 1$, và đạt cực tiểu tại $x = m + 1$. Ý c *SAI*.
      
      Tọa độ hai điểm cực trị là:
      - $A(m-1; f(m-1)) = A(m-1; 2 - 3m)$
      - $B(m+1; f(m+1)) = B(m+1; -2 - 3m)$
      Khoảng cách giữa hai điểm cực trị:
      $ A B = sqrt( ((m+1) - (m-1))^2 + ((-2-3m) - (2-3m))^2 ) = sqrt(2^2 + (-4)^2) = sqrt(4 + 16) = sqrt(20) = 2sqrt(5). $
      Khoảng cách luôn bằng $2sqrt(5)$, không đổi nhưng không phải bằng $2$. Ý d *SAI*.
    ]
  )

  #ds(
    [Trong không gian $O x y z$, một thiết bị bay không người lái (drone) bay theo đường thẳng $d: x = 1 + 2t, y = -1 + t, z = 2 - t$ ($t >= 0$). Khu vực hạn chế bay được giới hạn bởi mặt phẳng $(P): x + 2y - z - 5 = 0$.],
    (
      True([Vectơ chỉ phương của đường bay $d$ là $arrow(u) = (2; 1; -1)$.]),
      [Drone bay song song với mặt phẳng hạn chế bay $(P)$.],
      True([Điểm giao nhau giữa đường bay của drone và mặt phẳng hạn chế bay là $M(4,2; 0,6; 0,4)$ tương ứng với $t = 1,6$.]),
      [Khoảng cách từ điểm xuất phát của drone (khi $t = 0$) đến mặt phẳng $(P)$ bằng $8/sqrt(6)$.],
    ),
    loigiai: [
      *a)* Từ phương trình tham số của $d$, ta thấy một VTCP là $arrow(u) = (2; 1; -1)$. Ý a *ĐÚNG*.
      
      *b)* Mặt phẳng $(P)$ có VTPT $arrow(n) = (1; 2; -1)$.
      Tích vô hướng: $arrow(u) \cdot arrow(n) = 2(1) + 1(2) + (-1)(-1) = 2 + 2 + 1 = 5 != 0$.
      Do đó đường thẳng cắt mặt phẳng $(P)$, không song song. Ý b *SAI*.
      
      *c)* Thay tọa độ của $d$ vào phương trình $(P)$:
      $ (1 + 2t) + 2(-1 + t) - (2 - t) - 5 = 0 <=> 5t - 8 = 0 <=> t = 1,6. $
      Khi $t = 1,6$, tọa độ điểm giao là:
      $ x = 1 + 2(1,6) = 4,2; quad y = -1 + 1,6 = 0,6; quad z = 2 - 1,6 = 0,4. $
      Do đó $M(4,2; 0,6; 0,4)$. Ý c *ĐÚNG*.
      
      *d)* Điểm xuất phát của drone tại $t = 0$ là $A(1; -1; 2)$.
      Khoảng cách từ $A$ đến mặt phẳng $(P)$:
      $ d(A, (P)) = |1 + 2(-1) - 2 - 5| / sqrt(1^2 + 2^2 + (-1)^2) = |-8| / sqrt(6) = 8/sqrt(6). $
      Ý d *ĐÚNG*.
    ]
  )

  #ds(
    [Một hộp thứ nhất chứa 5 viên bi đỏ và 3 viên bi xanh. Hộp thứ hai chứa 4 viên bi đỏ và 6 viên bi xanh. Người ta gieo một đồng xu cân đối và đồng chất. Nếu đồng xu xuất hiện mặt ngửa thì chọn ngẫu nhiên một viên bi từ hộp thứ nhất. Nếu đồng xu xuất hiện mặt sấp thì chọn ngẫu nhiên một viên bi từ hộp thứ hai.],
    (
      True([Xác suất để chọn được hộp thứ nhất bằng $0,5$.]),
      [Xác suất chọn được viên bi đỏ từ hộp thứ nhất (khi đã biết chọn hộp thứ nhất) là $3/8$.],
      True([Xác suất đầy đủ để chọn được một viên bi màu đỏ bằng $0,5125$.]),
      True([Nếu biết viên bi chọn được có màu đỏ, xác suất để viên bi đó được lấy ra từ hộp thứ nhất lớn hơn $60\%$.]),
    ),
    loigiai: [
      *a)* Vì đồng xu cân đối nên xác suất chọn mỗi hộp là $0,5$. Ý a *ĐÚNG*.
      
      *b)* Hộp thứ nhất có 5 đỏ, 3 xanh. Lấy 1 viên từ hộp này thì xác suất đỏ là $5/8$. Ý b *SAI*.
      
      *c)* Xác suất đầy đủ chọn được bi đỏ:
      $ P(Red) = P(Ngửa) \cdot P(Red|Hộp 1) + P(Sấp) \cdot P(Red|Hộp 2) $
      $ = 0,5 \cdot (5/8) + 0,5 \cdot (4/10) = 5/16 + 1/5 = 41/80 = 0,5125. $
      Ý c *ĐÚNG*.
      
      *d)* Xác suất để viên bi đỏ đó được lấy từ hộp thứ nhất là:
      $ P(Hộp 1 | Red) = (P(Ngửa) \cdot P(Red|Hộp 1)) / P(Red) = (5/16) / (41/80) = 25/41 approx 0,6097 = 60,97\% > 60\%. $
      Ý d *ĐÚNG*.
    ]
  )

  #ds(
    [Khảo sát thời gian tự học ở nhà trong một ngày của một nhóm gồm 50 học sinh, ta thu được mẫu số liệu ghép nhóm sau:
      #align(center)[
        #table(
          columns: 5,
          align: center,
          stroke: 0.5pt + black,
          [Thời gian (giờ)], [$[0; 2)$], [$[2; 4)$], [$[4; 6)$], [$[6; 8)$],
          [Số học sinh], [10], [20], [15], [5],
        )
      ]
      Xét tính đúng sai của các khẳng định sau:],
    (
      True([Kích thước mẫu là $50$ học sinh.]),
      True([Số trung vị của mẫu số liệu ghép nhóm này bằng $3,5$ giờ.]),
      [Mốt của mẫu số liệu ghép nhóm bằng $3$ giờ.],
      [Mốt lớn hơn số trung vị.],
    ),
    loigiai: [
      *a)* Cỡ mẫu $n = 10 + 20 + 15 + 5 = 50$. Ý a *ĐÚNG*.
      
      *b)* Trung vị $M_e$:
      Cỡ mẫu $n=50$, nhóm chứa trung vị là $[2; 4)$.
      Cận dưới $L = 2$. Tần số tích lũy trước nhóm trung vị: $F = 10$.
      Tần số nhóm trung vị: $f = 20$. Độ rộng nhóm: $h = 2$.
      $ M_e = 2 + ((25 - 10)/20) \cdot 2 = 2 + 1,5 = 3,5. $
      Ý b *ĐÚNG*.
      
      *c, d)* Mốt $M_o$:
      Nhóm có tần số lớn nhất là $[2; 4)$ với $f_m = 20$.
      Các tần số lân cận: $f_(m-1) = 10$, $f_(m+1) = 15$.
      $ M_o = 2 + (20 - 10)/((20 - 10) + (20 - 15)) \cdot 2 = 2 + 10/(10 + 5) \cdot 2 = 2 + 20/15 = 2 + 1,33 = 3,33. $
      Do đó mốt bằng $3,33$ giờ chứ không phải $3$. Ý c *SAI*.
      Vì $M_o = 3,33 < M_e = 3,5$ nên mốt nhỏ hơn số trung vị. Ý d *SAI*.
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN III — Trắc nghiệm trả lời ngắn
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

  #tln(
    [Một loại xét nghiệm y khoa chẩn đoán bệnh X có độ nhạy $99\%$ và độ đặc hiệu $95\%$. Biết rằng trong quần thể chỉ có $1\%$ người thực sự mắc bệnh X. Chọn ngẫu nhiên một người trong quần thể đi làm xét nghiệm, kết quả trả về là dương tính. Tính xác suất để người này thực sự mắc bệnh X (làm tròn kết quả đến hàng phần trăm).],
    [0,17],
    loigiai: [
      #ppgiai[
        Sử dụng công thức Bayes để tính xác suất thực sự mắc bệnh khi có kết quả dương tính.
      ]
      Gọi $D$ là biến cố mắc bệnh, $P(D) = 0,01$.
      Gọi $D'$ là biến cố không mắc bệnh, $P(D') = 0,99$.
      Gọi $+$ là biến cố kết quả xét nghiệm dương tính.
      $ P(+|D) = 0,99; quad P(+|D') = 1 - 0,95 = 0,05. $
      Xác suất đầy đủ để nhận kết quả dương tính:
      $ P(+) = P(D) \cdot P(+|D) + P(D') \cdot P(+|D') = 0,01 \cdot 0,99 + 0,99 \cdot 0,05 = 0,0099 + 0,0495 = 0,0594. $
      Xác suất thực sự mắc bệnh khi biết kết quả dương tính:
      $ P(D|+) = (P(D) \cdot P(+|D)) / P(+) = 0,0099 / 0,0594 = 1/6 approx 0,1667. $
      Làm tròn đến hàng phần trăm ta được $0,17$.
    ]
  )

  #tln(
    [Một hãng hàng không dự định bán vé cho một chuyến bay với giá vé ban đầu là $2$ triệu đồng thì trung bình có $100$ hành khách đăng ký mua vé. Theo khảo sát thị trường, cứ mỗi lần tăng giá vé thêm $100.000$ đồng thì số lượng hành khách mua vé sẽ giảm đi $2$ người. Hỏi hãng hàng không nên đặt giá vé là bao nhiêu triệu đồng để thu được tổng doanh thu từ việc bán vé là lớn nhất?],
    [3,5],
    loigiai: [
      #ppgiai[
        - Thiết lập hàm số doanh thu theo mức tăng giá vé.
        - Tìm giá trị lớn nhất của hàm số này.
      ]
      Gọi $x$ (trăm nghìn đồng) là số tiền tăng thêm trên mỗi vé ($x >= 0$).
      Giá vé mới: $20 + x$ (trăm nghìn đồng).
      Số lượng khách tương ứng: $100 - 2x$ (hành khách). Điều kiện $100 - 2x > 0 <=> x < 50$.
      Doanh thu bán vé:
      $ R(x) = (20 + x)(100 - 2x) = 2000 + 60x - 2x^2 " (trăm nghìn đồng)". $
      Xét hàm bậc hai $R(x)$ trên khoảng $(0; 50)$, đạt cực đại tại đỉnh:
      $ x_0 = -60 / (2 \cdot (-2)) = 15. $
      Tại $x = 15$, hãng bán vé giá $20 + 15 = 35$ trăm nghìn đồng, tức là $3,5$ triệu đồng.
      Doanh thu đạt cực đại. Vậy giá vé cần tìm là $3,5$ triệu đồng.
    ]
  )

  #tln(
    [Tính diện tích hình phẳng giới hạn bởi đường cong parabol $y = 4 - x^2$ và đường thẳng $y = 2 - x$ (làm tròn kết quả đến hàng phần mười).],
    [4,5],
    loigiai: [
      Phương trình hoành độ giao điểm:
      $ 4 - x^2 = 2 - x <=> x^2 - x - 2 = 0 <=> x = -1 " hoặc " x = 2. $
      Trên đoạn $[-1; 2]$, ta có $4 - x^2 >= 2 - x$.
      Diện tích hình phẳng cần tính là:
      $ S = int_(-1)^2 (4 - x^2 - (2 - x)) dif x = int_(-1)^2 (2 + x - x^2) dif x $
      $ S = [2x + x^2/2 - x^3/3]_(-1)^2 = (4 + 2 - 8/3) - (-2 + 1/2 + 1/3) = 10/3 - (-7/6) = 27/6 = 4,5. $
      Vậy diện tích bằng $4,5$.
    ]
  )

  #tln(
    [Một vật thể nằm giữa hai mặt phẳng vuông góc với trục $O x$ tại $x = 0$ và $x = 4$. Thiết diện của vật thể khi cắt bởi mặt phẳng vuông góc với trục $O x$ tại điểm có hoành độ $x$ ($0 <= x <= 4$) luôn là một hình vuông có độ dài cạnh bằng $sqrt(x)$. Hãy tính thể tích của vật thể đó.],
    [8],
    loigiai: [
      Diện tích của thiết diện là hình vuông cạnh $sqrt(x)$ tại điểm $x$:
      $ S(x) = (sqrt(x))^2 = x. $
      Thể tích vật thể là:
      $ V = int_0^4 S(x) dif x = int_0^4 x dif x = [x^2/2]_0^4 = 16/2 - 0 = 8. $
      Vậy thể tích vật thể bằng $8$.
    ]
  )

  #tln(
    [Một người vay ngân hàng $200$ triệu đồng trả góp với lãi suất cố định $1\%$ mỗi tháng. Cứ sau đúng một tháng kể từ ngày vay, người đó trả cho ngân hàng một số tiền cố định là $m$ triệu đồng. Biết sau đúng 1 năm (12 tháng) kể từ ngày vay thì người đó trả hết nợ. Tính số tiền $m$ người đó trả hàng tháng (làm tròn kết quả đến hàng phần trăm, đơn vị: triệu đồng).],
    [17,77],
    loigiai: [
      Áp dụng công thức trả nợ đều đặn hàng tháng để dư nợ bằng 0 sau $n$ tháng:
      $ m = (A \cdot r \cdot (1 + r)^n) / ((1 + r)^n - 1). $
      Với $A = 200$, $r = 1\% = 0,01$, $n = 12$.
      $ m = (200 \cdot 0,01 \cdot (1,01)^(12)) / ((1,01)^(12) - 1) = (2 \cdot 1,126825) / (1,126825 - 1) = 2,25365 / 0,126825 approx 17,77. $
      Vậy số tiền trả hàng tháng là $17,77$ triệu đồng.
    ]
  )

  #tln(
    [Trong không gian tọa độ $O x y z$, cho hai đường thẳng chéo nhau $d_1: x = 1 + t, y = 0, z = 0$ và $d_2: x = 0, y = 2 + s, z = 3$. Hãy tìm khoảng cách ngắn nhất giữa hai đường thẳng này.],
    [3],
    loigiai: [
      #ppgiai[
        Sử dụng công thức tính khoảng cách giữa hai đường thẳng chéo nhau.
      ]
      - Đường thẳng $d_1$ đi qua điểm $A(1; 0; 0)$ và có VTCP $arrow(u_1) = (1; 0; 0)$.
      - Đường thẳng $d_2$ đi qua điểm $B(0; 2; 3)$ và có VTCP $arrow(u_2) = (0; 1; 0)$.
      Ta có:
      $ [arrow(u_1), arrow(u_2)] = (0; 0; 1). $
      Vectơ nối hai điểm thuộc hai đường thẳng: $arrow(A B) = (-1; 2; 3)$.
      Khoảng cách giữa hai đường thẳng chéo nhau là:
      $ d(d_1, d_2) = (| [arrow(u_1), arrow(u_2)] \cdot arrow(A B) |) / |[arrow(u_1), arrow(u_2)]| = |0 \cdot (-1) + 0 \cdot 2 + 1 \cdot 3| / 1 = 3. $
      Vậy khoảng cách ngắn nhất là $3$.
    ]
  )

]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}
"""
    with open("typst/De-Cac-So/2026-Tự-Chế-Lần-5.typ", "w", encoding="utf-8") as f:
        f.write(content)
    print("Created exam 5")
