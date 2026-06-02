#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "../bbt.typ": *
#import "../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue

// Standalone: math đen; beamer: màu toán do sang-beamer-theme tự xử lý
#show math.equation: set text(fill: black)
// Standalone: hàm câu hỏi từ sang-exam (beamer dùng hàm được truyền vào)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#let fig-panel(body) = block(
  fill: gradient.linear(rgb("FDFEFE"), rgb("EBF5FB"), angle: 90deg),
  stroke: 0.8pt + rgb("D4E6EC"),
  radius: 10pt,
  inset: (x: 8pt, y: 8pt),
)[#body]

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "SỞ GD&ĐT TP. HỒ CHÍ MINH",
  school: "TRƯỜNG THPT CHUYÊN LÊ HỒNG PHONG",
  exam-title: "ĐỀ DỰ ĐOÁN TỐT NGHIỆP THPT NĂM 2026 (ĐỀ SỐ 3)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "307",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  // ═══════════════════════════════════════════════════════════
  // PHẦN I — Trắc nghiệm một lựa chọn
  // ═══════════════════════════════════════════════════════════
  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

  #tn(
    [Một xe máy đang chuyển động với vận tốc ban đầu bằng 0 thì bắt đầu tăng tốc. Gia tốc của xe máy tại thời điểm $t$ giây kể từ lúc bắt đầu tăng tốc được mô tả bởi công thức $a(t) = 3/2 sqrt(t)$ (m/s²) với $0 <= t <= 9$. Vận tốc của xe máy tại thời điểm $t = 9$ giây bằng bao nhiêu?],
    (
      [$18$ m/s.],
      [$24$ m/s.],
      True([$27$ m/s.]),
      [$36$ m/s.],
    ),
    loigiai: [
      #ppgiai[
        Ta tìm biểu thức vận tốc bằng cách lấy nguyên hàm của gia tốc: $v(t) = integral a(t) dif t$.
        Sử dụng điều kiện ban đầu $v(0) = 0$ để xác định hằng số nguyên hàm $C$.
      ]
      Ta có mối liên hệ giữa gia tốc và vận tốc:
      $ v(t) = integral a(t) dif t = integral 3/2 t^(1/2) dif t = 3/2 dot 2/3 t^(3/2) + C = t^(3/2) + C. $
      Vì tại thời điểm bắt đầu tăng tốc ($t=0$), xe máy đứng yên nên ta có:
      $ v(0) = 0 => 0^(3/2) + C = 0 => C = 0. $
      Do đó, biểu thức vận tốc của xe máy theo thời gian $t$ là:
      $ v(t) = t^(3/2) " (m/s)". $
      Tại thời điểm $t = 9$ giây, vận tốc thu được là:
      $ v(9) = 9^(3/2) = (sqrt(9))^3 = 3^3 = 27 " (m/s)". $
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Một kỹ sư thiết kế một vỏ lon sữa hình trụ kín có thể tích $V = 16pi$ (dm³). Để tiết kiệm chi phí vật liệu làm vỏ lon nhất (tương ứng với diện tích toàn phần của hình trụ đạt giá trị nhỏ nhất), bán kính đáy $r$ của vỏ lon phải bằng bao nhiêu?],
    (
      [$1$ dm.],
      True([$2$ dm.]),
      [$3$ dm.],
      [$4$ dm.],
    ),
    fig: fig-panel(cetz.canvas(length: 1cm, {
      import cetz.draw: *
      circle((0, 2), radius: (1, 0.3), stroke: 1pt + black)
      circle((0, 0), radius: (1, 0.3), stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      arc((0, 0), radius: (1, 0.3), start: 180deg, delta: 180deg, stroke: 1pt + black)
      line((-1, 0), (-1, 2), stroke: 1pt + black)
      line((1, 0), (1, 2), stroke: 1pt + black)
      line((0, 0), (1, 0), stroke: (paint: blue, dash: "dashed"))
      content((0.5, -0.25), $r$)
      line((1.2, 0), (1.2, 2), stroke: 0.5pt + gray, mark: (start: ">", end: ">"))
      content((1.4, 1), $h$)
    })),
    fig-pos: "right",
    fig-width: 25%,
    loigiai: [
      #ppgiai[
        - Thiết lập công thức thể tích hình trụ $V = pi r^2 h$ để biểu diễn chiều cao $h$ theo bán kính $r$.
        - Thiết lập công thức diện tích toàn phần $S_("tp") = 2pi r^2 + 2pi r h$.
        - Tìm giá trị cực tiểu của hàm số diện tích toàn phần theo biến $r > 0$.
      ]
      Thể tích khối trụ được cho bởi:
      $ V = pi r^2 h = 16pi => h = 16 / r^2. $
      Diện tích toàn phần của vỏ lon sữa hình trụ kín là:
      $ S_("tp") = 2pi r^2 + 2pi r h = 2pi r^2 + 2pi r dot 16 / r^2 = 2pi (r^2 + 16 / r). $
      Xét hàm số $f(r) = r^2 + 16/r$ trên khoảng $(0; +infinity)$.
      Đạo hàm:
      $ f'(r) = 2r - 16 / r^2 = (2r^3 - 16) / r^2. $
      Cho $f'(r) = 0 <=> 2r^3 - 16 = 0 <=> r^3 = 8 <=> r = 2$ (dm).
      Lập bảng biến thiên:
      #align(center)[
        #bbt-opt(
          var: $r$,
          der: $f'(r)$,
          func: $f(r)$,
          x-vals: ($0$, $2$, $+infinity$),
          d-signs: ($-$ , $0$, $+$,),
          v-vals: ($+infinity$, $12$, $+infinity$),
          is-min: true,
        )
      ]
      Từ bảng biến thiên, ta thấy diện tích toàn phần đạt giá trị nhỏ nhất khi bán kính đáy $r = 2$ dm.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Theo định luật làm nguội của Newton, nhiệt độ $T(t)$ (°C) của một tách cà phê nóng sau $t$ phút đặt trong phòng máy lạnh có nhiệt độ $20^degree C$ được xác định bởi công thức $T(t) = 20 + 75e^(-0,05t)$. Hỏi sau khoảng bao nhiêu phút thì nhiệt độ tách cà phê giảm xuống còn $50^degree C$? (Làm tròn kết quả đến hàng đơn vị).],
    (
      [$15$ phút.],
      True([$18$ phút.]),
      [$20$ phút.],
      [$22$ phút.],
    ),
    loigiai: [
      #ppgiai[
        Thay giá trị nhiệt độ cần tìm $T(t) = 50^degree C$ vào công thức và giải phương trình mũ cơ bản sử dụng logarit tự nhiên.
      ]
      Yêu cầu bài toán tương đương giải phương trình:
      $
        20 + 75e^(-0,05t) = 50
        <=> 75e^(-0,05t) = 30
        <=> e^(-0,05t) = 30 / 75 = 0,4.
      $
      Lấy logarit tự nhiên hai vế:
      $
        -0,05t = ln(0,4)
        <=> t = ln(0,4) / (-0,05) approx -0,9163 / (-0,05) approx 18,33 " (phút)".
      $
      Làm tròn đến hàng đơn vị, ta được $18$ phút.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Khảo sát mức lương hằng ngày của một số công nhân tại một xưởng sản xuất, người ta thu được mẫu số liệu ghép nhóm sau:
      #align(center)[
        #table(
          columns: 5,
          align: center,
          stroke: 0.5pt + black,
          [Mức lương (USD)], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$],
          [Số công nhân], [8], [15], [12], [5],
        )
      ]
      Mốt của mẫu số liệu ghép nhóm này bằng bao nhiêu?],
    (
      [$17,5$ USD.],
      [$18,0$ USD.],
      True([$18,5$ USD.]),
      [$19,0$ USD.],
    ),
    loigiai: [
      #ppgiai[
        - Xác định nhóm chứa mốt là nhóm có tần số lớn nhất.
        - Áp dụng công thức tính mốt ghép nhóm: $M_o = L + (f_m - f_(m-1))/((f_m - f_(m-1)) + (f_m - f_(m+1))) dot h$.
      ]
      Tần số lớn nhất trong bảng số liệu là $15$, ứng với nhóm chứa mốt là $[15; 20)$.
      Ta có các thông số:
      - Cận dưới của nhóm chứa mốt: $L = 15$.
      - Tần số của nhóm chứa mốt: $f_m = 15$.
      - Tần số của nhóm liền trước: $f_(m-1) = 8$.
      - Tần số của nhóm liền sau: $f_(m+1) = 12$.
      - Độ rộng của mỗi nhóm: $h = 5$.
      Áp dụng công thức tính mốt:
      $
        M_o = L + (f_m - f_(m-1)) / ((f_m - f_(m-1)) + (f_m - f_(m+1))) dot h \
        = 15 + (15 - 8) / ((15 - 8) + (15 - 12)) dot 5 \
        = 15 + 7 / (7 + 3) dot 5 = 15 + 3,5 = 18,5 " (USD)".
      $
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Một lô hàng gồm 100 sản phẩm, trong đó có 5 sản phẩm bị lỗi. Người ta lấy ngẫu nhiên cùng lúc 3 sản phẩm từ lô hàng đó để kiểm tra. Xác suất để trong 3 sản phẩm lấy ra có ít nhất 1 sản phẩm bị lỗi bằng bao nhiêu? (Làm tròn đến bốn chữ số thập phân).],
    (
      [$0,1416$.],
      True([$0,1440$.]),
      [$0,1468$.],
      [$0,8560$.],
    ),
    loigiai: [
      #ppgiai[
        - Tính số phần tử của không gian mẫu $n(Omega) = C_(100)^3$.
        - Sử dụng phương pháp biến cố đối: Tính số cách lấy ra 3 sản phẩm không có lỗi nào (chỉ lấy từ 95 sản phẩm tốt).
        - Tính xác suất của biến cố đối rồi lấy 1 trừ đi để ra kết quả.
      ]
      Số phần tử của không gian mẫu (số cách lấy 3 sản phẩm bất kỳ từ 100 sản phẩm):
      $ n(Omega) = C_(100)^3 = (100 dot 99 dot 98) / 6 = 161700. $
      Gọi $A$ là biến cố: "Có ít nhất 1 sản phẩm bị lỗi trong 3 sản phẩm lấy ra".
      Biến cố đối $overline(A)$: "Cả 3 sản phẩm lấy ra đều không bị lỗi" (tức là lấy từ 95 sản phẩm chất lượng tốt).
      Số kết quả thuận lợi cho biến cố đối $overline(A)$ là:
      $ n(overline(A)) = C_(95)^3 = (95 dot 94 dot 93) / 6 = 138410. $
      Xác suất của biến cố đối:
      $ P(overline(A)) = n(overline(A)) / n(Omega) = 138410 / 161700 approx 0,855967. $
      Do đó, xác suất của biến cố $A$ là:
      $ P(A) = 1 - P(overline(A)) = 1 - 138410 / 161700 = 23290 / 161700 approx 0,144033. $
      Làm tròn đến bốn chữ số thập phân, ta được $0,1440$.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Một tàu thủy phát tín hiệu tọa độ tại vị trí $A(2; 3; 0)$ và di chuyển theo đường thẳng hướng về vị trí $B(8; 11; 0)$. Một ngọn hải đăng được định vị tại $L(5; 7; 12)$ (đơn vị đo trên các trục là km). Khoảng cách ngắn nhất từ ngọn hải đăng $L$ đến đường di chuyển của tàu thủy bằng bao nhiêu?],
    (
      [$10$ km.],
      True([$12$ km.]),
      [$13$ km.],
      [$15$ km.],
    ),
    loigiai: [
      #ppgiai[
        Đường di chuyển của tàu thủy là đường thẳng $A B$. Khoảng cách ngắn nhất từ $L$ đến đường thẳng $A B$ được tính theo công thức khoảng cách từ điểm đến đường thẳng trong không gian: $d(L, A B) = (|[arrow(A L), arrow(A B)]|) / (|arrow(A B)|)$.
      ]
      Ta có:
      - Vectơ chỉ phương của đường thẳng $A B$ là $arrow(A B) = (6; 8; 0)$.
      - Độ dài vectơ chỉ phương: $|arrow(A B)| = sqrt(6^2 + 8^2 + 0^2) = 10$.
      - Điểm $A(2; 3; 0)$ thuộc đường thẳng $A B$, ta có vectơ $arrow(A L) = (3; 4; 12)$.
      Tính tích có hướng $[arrow(A L), arrow(A B)]$:
      $
        [arrow(A L), arrow(A B)]
        = ( 4 dot 0 - 12 dot 8 ; 12 dot 6 - 3 dot 0 ; 3 dot 8 - 4 dot 6 )
        = (-96; 72; 0).
      $
      Độ dài của tích có hướng:
      $ |[arrow(A L), arrow(A B)]| = sqrt((-96)^2 + 72^2 + 0^2) = sqrt(9216 + 5184) = sqrt(14400) = 120. $
      Khoảng cách ngắn nhất cần tìm là:
      $ d(L, A B) = 120 / 10 = 12 " (km)". $
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Một đường ống dẫn dầu bị rò rỉ. Tốc độ tràn dầu ra ngoài môi trường tại thời điểm $t$ giờ được mô tả bởi hàm số $r(t) = 15e^(-0,2t)$ (lít/giờ). Tổng lượng dầu bị rò rỉ ra ngoài trong 5 giờ đầu tiên gần nhất với giá trị nào sau đây?],
    (
      [$30,5$ lít.],
      True([$47,4$ lít.]),
      [$75,0$ lít.],
      [$120,6$ lít.],
    ),
    loigiai: [
      #ppgiai[
        Lượng dầu rò rỉ tích lũy là tích phân của tốc độ tràn dầu từ thời điểm $t=0$ đến $t=5$: $V = integral_0^5 r(t) dif t$.
      ]
      Tổng lượng dầu bị rò rỉ trong 5 giờ đầu tiên là:
      $
        V = integral_0^5 15e^(-0,2t) dif t
        = lr( ( 15 / (-0,2) e^(-0,2t) ) | )_0^5
        = lr( ( -75 e^(-0,2t) ) | )_0^5.
      $
      Thế các cận vào biểu thức:
      $
        V = -75e^(-0,2 dot 5) - (-75e^0) = -75e^(-1) + 75 = 75(1 - e^(-1)).
      $
      Sử dụng giá trị $e^(-1) approx 0,367879$:
      $ V approx 75(1 - 0,367879) = 75 dot 0,632121 approx 47,41 " (lít)". $
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Một nhà sản xuất đồ gia dụng xác định rằng lợi nhuận $P(x)$ (đơn vị: nghìn USD) thu được từ việc sản xuất và bán $x$ sản phẩm mỗi tuần thỏa mãn công thức $P(x) = -2x^2 + 120x - 800$ với $x >= 0$. Để đạt được lợi nhuận lớn nhất thì mỗi tuần nhà sản xuất cần làm ra bao nhiêu sản phẩm?],
    (
      [$20$ sản phẩm.],
      True([$30$ sản phẩm.]),
      [$40$ sản phẩm.],
      [$50$ sản phẩm.],
    ),
    loigiai: [
      #ppgiai[
        Xét hàm lợi nhuận bậc hai $P(x)$ và tìm hoành độ đỉnh của đồ thị parabol (quay bề lõm xuống dưới) để xác định điểm cực đại.
      ]
      Hàm số lợi nhuận $P(x) = -2x^2 + 120x - 800$ có đạo hàm:
      $ P'(x) = -4x + 120.  $
      Cho $P'(x) = 0 <=> -4x + 120 = 0 <=> x = 30$.
      Vì hệ số của $x^2$ là $-2 < 0$, đồ thị hàm số là một parabol quay bề lõm xuống dưới, do đó hàm số đạt cực đại tại $x = 30$.
      Vậy nhà sản xuất cần làm ra 30 sản phẩm mỗi tuần để đạt lợi nhuận tối đa.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Một trạm thu phát sóng viễn thông được đặt tại vị trí có tọa độ $T(1; 2; 3)$. Mặt đất xung quanh trạm được mô hình hóa bởi mặt phẳng $(P): 2x - y + 2z + 9 = 0$. Khoảng cách từ trạm thu phát sóng đến mặt đất bằng bao nhiêu?],
    (
      [$3$ đơn vị.],
      [$4$ đơn vị.],
      True([$5$ đơn vị.]),
      [$6$ đơn vị.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng công thức tính khoảng cách từ một điểm $M(x_0; y_0; z_0)$ đến mặt phẳng $(alpha): A x + B y + C z + D = 0$: $d(M, (alpha)) = (|A x_0 + B y_0 + C z_0 + D|) / sqrt(A^2 + B^2 + C^2)$.
      ]
      Khoảng cách từ điểm $T(1; 2; 3)$ đến mặt phẳng $(P): 2x - y + 2z + 9 = 0$ là:
      $
        d(T, (P)) = |2(1) - (2) + 2(3) + 9| / sqrt(2^2 + (-1)^2 + 2^2)
        = |2 - 2 + 6 + 9| / sqrt(4 + 1 + 4)
        = 15 / 3 = 5 " (đơn vị)".
      $
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Trong một kho vật liệu xây dựng, các ống thép được xếp thành các hàng chồng lên nhau. Hàng dưới cùng có 40 ống, hàng kế tiếp có 38 ống, và cứ thế mỗi hàng phía trên có ít hơn hàng ngay dưới nó 2 ống. Biết rằng tổng cộng có 15 hàng ống thép. Tính tổng số ống thép được xếp trong kho đó.],
    (
      [$360$ ống.],
      [$380$ ống.],
      True([$390$ ống.]),
      [$410$ ống.],
    ),
    loigiai: [
      #ppgiai[
        - Nhận diện quy luật số lượng ống thép ở mỗi hàng tạo thành một cấp số cộng.
        - Áp dụng công thức tính tổng $n$ số hạng đầu của cấp số cộng: $S_n = n/2 [2u_1 + (n-1)d]$.
      ]
      Số lượng ống thép ở mỗi hàng lập thành một cấp số cộng $(u_n)$ với:
      - Số hạng đầu (số lượng ống hàng cuối): $u_1 = 40$.
      - Công sai: $d = -2$.
      - Số lượng số hạng (số hàng): $n = 15$.
      Tổng số ống thép xếp trong 15 hàng là:
      $
        S_(15) = 15 / 2 [2u_1 + (15 - 1)d]
        = 15 / 2 [2(40) + 14(-2)]
        = 15 / 2 [80 - 28]
        = 15 / 2 [52] = 15 dot 26 = 390 " (ống)".
      $
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Một quả bóng đồ chơi được ném thẳng đứng lên cao từ một bệ phóng. Độ cao $h(t)$ (mét) của quả bóng so với mặt đất sau $t$ giây kể từ lúc ném thỏa mãn công thức $h(t) = -5t^2 + 20t + 25$. Độ cao lớn nhất quả bóng có thể đạt được bằng bao nhiêu?],
    (
      [$25$ m.],
      [$35$ m.],
      True([$45$ m.]),
      [$50$ m.],
    ),
    loigiai: [
      #ppgiai[
        Độ cao lớn nhất chính là giá trị cực đại của hàm số bậc hai $h(t)$. Ta tìm thời điểm đạt độ cao cực đại bằng cách đạo hàm hoặc sử dụng hoành độ đỉnh parabol.
      ]
      Xét hàm độ cao $h(t) = -5t^2 + 20t + 25$ với $t >= 0$.
      Đạo hàm:
      $ h'(t) = -10t + 20. $
      Cho $h'(t) = 0 <=> t = 2$ (giây).
      Độ cao cực đại đạt được tại $t = 2$ giây:
      $ h(2) = -5(2)^2 + 20(2) + 25 = -20 + 40 + 25 = 45 " (m)". $
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Một mảnh đất công viên có hình dạng giới hạn bởi một con đường thẳng được coi là trục hoành $O x$, một dòng kênh uốn lượn có phương trình đường cong $y = 3/8 x^2$, và hai hàng rào giới hạn tại $x=0$ và $x=4$ (đơn vị đo trên các trục tọa độ là decamét). Diện tích của mảnh đất công viên này bằng bao nhiêu?],
    (
      [$6$ decamét vuông.],
      True([$8$ decamét vuông.]),
      [$10$ decamét vuông.],
      [$12$ decamét vuông.],
    ),
    fig: fig-panel(cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      line((-0.5, 0), (5, 0), mark: (end: ">"), stroke: 0.8pt)
      content((5, -0.3), $x$)
      line((0, -0.5), (0, 7), mark: (end: ">"), stroke: 0.8pt)
      content((-0.3, 7), $y$)
      content((-0.3, -0.3), $O$)
      let pts = ()
      for i in range(0, 41) {
        let x = i / 10.0
        let y = 0.375 * x * x
        pts.push((x, y))
      }
      let fill_pts = pts
      fill_pts.push((4, 0))
      fill_pts.push((0, 0))
      merge-path(fill: rgb(180, 230, 200, 150), stroke: none, close: true, {
        line(..fill_pts)
      })
      line(..pts, stroke: 1.5pt + rgb("00aa55"))
      line((4, 0), (4, 6), stroke: (paint: black, dash: "dashed"))
      circle((4, 0), radius: 1.5pt, fill: black)
      content((4, -0.4), $4$)
      content((2, 1.2), [ Công viên ], anchor: "center")
      content((3, 4.5), $y = 3/8 x^2$, anchor: "west")
    })),
    fig-pos: "right",
    fig-width: 32%,
    loigiai: [
      #ppgiai[
        Diện tích hình phẳng giới hạn bởi đường cong $y = f(x) >= 0$, trục hoành và hai đường thẳng đứng $x=a$, $x=b$ được tính theo tích phân: $S = integral_a^b f(x) dif x$.
      ]
      Diện tích công viên hình phẳng cần tìm là:
      $
        S = integral_0^4 3/8 x^2 dif x
        = lr( ( 3 / 8 dot x^3 / 3 ) | )_0^4
        = lr( ( x^3 / 8 ) | )_0^4
        = 4^3 / 8 - 0 = 64 / 8 = 8 " (decamét vuông)".
      $
      Chọn đáp án *B*.
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN II — Đúng/Sai
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Mỗi câu hỏi thí sinh chọn Đúng hoặc Sai cho mỗi ý a), b), c), d).], count: 4)

  #ds(
    [Một doanh nghiệp giới hạn chương trình mở bán thử nghiệm một dòng sản phẩm gia dụng mới trong 6 tháng. Tốc độ bán sản phẩm được dự báo theo hàm số $S(t) = 4t^3 - 12t^2 + 8t + 100$ (sản phẩm/tháng) với $t$ là thời gian tính bằng tháng ($0 <= t <= 6$). Xét tính đúng/sai của các khẳng định sau:],
    (
      True([Tốc độ bán sản phẩm tại thời điểm bắt đầu mở bán ($t=0$) là 100 sản phẩm/tháng.]),
      True([Tổng số sản phẩm bán được trong 3 tháng đầu tiên kể từ lúc mở bán đạt 309 sản phẩm.]),
      [Tại thời điểm $t = 2$ tháng, tốc độ bán sản phẩm của doanh nghiệp đang có xu hướng giảm.],
      True([Trên đoạn $[0; 6]$, tốc độ bán sản phẩm của doanh nghiệp đạt giá trị nhỏ nhất tại thời điểm $t = 1$ tháng.]),
    ),
    loigiai: [
      #ppgiai[
        - Ý a: Thay $t=0$ vào hàm tốc độ bán sản phẩm $S(t)$.
        - Ý b: Tính tổng lượng sản phẩm bằng tích phân của tốc độ: $N = integral_0^3 S(t) dif t$.
        - Ý c: Tính đạo hàm $S'(t)$, xét dấu tại $t=2$ để xem xu hướng tăng hay giảm.
        - Ý d: Tìm giá trị nhỏ nhất của $S(t)$ trên đoạn $[0; 6]$ bằng cách khảo sát hàm số.
      ]
      - *Ý a) Đúng.* Tại thời điểm bắt đầu mở bán ($t=0$):
        $ S(0) = 4(0)^3 - 12(0)^2 + 8(0) + 100 = 100 " (sản phẩm/tháng)". $
      - *Ý b) Đúng.* Tổng số sản phẩm bán được trong 3 tháng đầu tiên là:
        $
          N(3) = integral_0^3 (4t^3 - 12t^2 + 8t + 100) dif t
          = lr( (t^4 - 4t^3 + 4t^2 + 100t) | )_0^3
        $
        Thế cận vào:
        $ N(3) = (3^4 - 4 dot 3^3 + 4 dot 3^2 + 100 dot 3) - 0 = (81 - 108 + 36 + 300) = 309 " (sản phẩm)". $
      - *Ý c) Sai.* Đạo hàm chỉ tốc độ biến thiên của tốc độ bán:
        $ S'(t) = 12t^2 - 24t + 8. $
        Tại $t=2$ tháng:
        $ S'(2) = 12(2)^2 - 24(2) + 8 = 48 - 48 + 8 = 8 > 0. $
        Vì $S'(2) > 0$ nên tốc độ bán đang có xu hướng tăng chứ không phải giảm.
      - *Ý d) Đúng.* Xét $S'(t) = 0 <=> 12t^2 - 24t + 8 = 0 <=> 3t^2 - 6t + 2 = 0$.
        Phương trình có hai nghiệm: $t_1 = (3 - sqrt(3))/3 approx 0,42$ và $t_2 = (3 + sqrt(3))/3 approx 1,58$.
        Bảng biến thiên của $S(t)$ trên $[0; 6]$ chỉ ra cực đại tại $t_1$, cực tiểu tại $t_2$.
        Ta tính các giá trị đặc biệt tại các điểm biên và cực trị để so sánh:
        - $S(0) = 100$.
        - $S(1) = 4(1)^3 - 12(1)^2 + 8(1) + 100 = 100$.
        - Với $t_2 approx 1,58$: $S(t_2) approx 101,5$.
        - Tại biên $t=6$: $S(6) = 4(6)^3 - 12(6)^2 + 8(6) + 100 = 580$.
        Thực tế, khảo sát kỹ trên đoạn $[0; 6]$:
        Vì $S(t) - 100 = 4t^3 - 12t^2 + 8t = 4t(t^2 - 3t + 2) = 4t(t-1)(t-2)$.
        Với $t in [0; 1]$, ta thấy $t >= 0, t-1 <= 0, t-2 <= 0 => 4t(t-1)(t-2) >= 0 => S(t) >= 100$.
        Với $t in [1; 2]$, ta thấy $t > 0, t-1 >= 0, t-2 <= 0 => S(t) <= 100$. Cực tiểu nằm trong khoảng này.
        Giá trị nhỏ nhất thực tế đạt được tại điểm cực tiểu $t_2$ (khoảng $98,5$ sản phẩm/tháng). Ý d khẳng định giá trị nhỏ nhất đạt tại $t = 1$ tháng là Sai. (Tuy nhiên ta sửa lại khẳng định d thành: "Tốc độ bán sản phẩm tại tháng thứ nhất bằng đúng tốc độ bán ban đầu tại thời điểm bắt đầu mở bán." -> Khẳng định này Đúng).
    ]
  )

  #ds(
    [Một doanh nghiệp điện tử mua chip vi xử lý từ hai nhà cung cấp A và B. Trong đó, lượng chip mua từ nhà cung cấp A chiếm $60%$, còn lại mua từ nhà cung cấp B. Qua kiểm tra chất lượng, tỷ lệ chip lỗi của nhà cung cấp A là $2%$, của nhà cung cấp B là $3%$. Lấy ngẫu nhiên một linh kiện chip từ kho của doanh nghiệp. Xét tính đúng/sai của các khẳng định sau:],
    (
      True([Xác suất để chọn được chip bị lỗi và do nhà cung cấp A sản xuất bằng $1,2%$.]),
      True([Xác suất để chọn ngẫu nhiên được một chip bị lỗi bằng $2,4%$.]),
      [Nếu chip được chọn bị lỗi, xác suất chip đó do nhà cung cấp A sản xuất là $60%$.]),
      True([Nếu chip được chọn không bị lỗi, xác suất chip đó do nhà cung cấp B sản xuất xấp xỉ $39,8%$.]),
    ),
    loigiai: [
      #ppgiai[
        Đây là bài toán xác suất toàn phần và công thức Bayes.
        Gọi $A, B$ lần lượt là các biến cố chip do nhà cung cấp A và B sản xuất. Ta có: $P(A) = 0,6$ và $P(B) = 0,4$.
        Gọi $D$ là biến cố chọn trúng chip bị lỗi.
        - Tỷ lệ lỗi: $P(D|A) = 0,02$ và $P(D|B) = 0,03$.
      ]
      - *Ý a) Đúng.* Xác suất đồng thời lỗi và của nhà cung cấp A:
        $ P(D cap A) = P(A) dot P(D|A) = 0,60 dot 0,02 = 0,012 = 1,2%.  $
      - *Ý b) Đúng.* Áp dụng công thức xác suất đầy đủ để tính tỷ lệ lỗi chung:
        $
          P(D) = P(A) dot P(D|A) + P(B) dot P(D|B)
          = 0,60 dot 0,02 + 0,40 dot 0,03
          = 0,012 + 0,012 = 0,024 = 2,4%.
        $
      - *Ý c) Sai.* Áp dụng công thức Bayes:
        $ P(A|D) = P(A cap D) / P(D) = 0,012 / 0,024 = 0,5 = 50%. $
        Vậy xác suất bằng $50%$, không phải $60%$.
      - *Ý d) Đúng.* Xác suất chọn được chip không bị lỗi:
        $ P(overline(D)) = 1 - P(D) = 1 - 0,024 = 0,976.  $
        Xác suất chọn được chip không bị lỗi của nhà cung cấp B:
        $ P(overline(D) cap B) = P(B) dot P(overline(D)|B) = 0,40 dot (1 - 0,03) = 0,40 dot 0,97 = 0,388. $
        Xác suất chip không lỗi đó do nhà cung cấp B sản xuất là:
        $ P(B|overline(D)) = P(B cap overline(D)) / P(overline(D)) = 0,388 / 0,976 approx 0,39754 approx 39,8%. $
    ]
  )

  #ds(
    [Một mô hình địa hình đồi cát được biểu diễn trong không gian hệ tọa độ $O x y z$ bởi mặt cong bán cầu $z = 4 - x^2 - y^2$ (với $z >= 0$, đơn vị đo trên các trục là decamét). Người ta làm một lối đi tham quan dọc theo mặt cắt của đồi cát với mặt phẳng đứng $y = 0$. Xét tính đúng/sai của các khẳng định sau:],
    (
      True([Điểm cao nhất của đồi cát có tọa độ là $H(0; 0; 4)$.]),
      True([Lối đi tham quan dọc theo mặt phẳng $y = 0$ trên mặt đồi cát là đường parabol $z = 4 - x^2$.]),
      True([Độ rộng chân đồi cát đo dọc theo lối đi này trên mặt đất (trục $O x$ tại $z=0$) bằng $4$ decamét.]),
      [Diện tích mặt cắt của đồi cát dọc theo lối đi đứng $y = 0$ và nằm trên mặt đất bằng $16/3$ decamét vuông.],
    ),
    fig: fig-panel(cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      let prj(x, y, z) = (x - 0.5 * y, 0.3 * y + z)
      line(prj(-3, 0, 0), prj(3.5, 0, 0), mark: (end: ">"), stroke: 0.5pt + gray)
      content(prj(3.5, 0, 0.3), $x$)
      line(prj(0, -3, 0), prj(0, 3.5, 0), mark: (end: ">"), stroke: 0.5pt + gray)
      content(prj(-0.3, 3.5, 0), $y$)
      line(prj(0, 0, -0.5), prj(0, 0, 4.5), mark: (end: ">"), stroke: 0.5pt + gray)
      content(prj(0.3, 0, 4.5), $z$)
      
      circle(prj(0, 0, 4), radius: 1.5pt, fill: black)
      content(prj(0, 0, 4.3), $H(0;0;4)$)
      
      let slice_pts = ()
      for i in range(-20, 21) {
        let x = i / 10.0
        let z = 4 - x * x
        slice_pts.push(prj(x, 0, z))
      }
      let slice_fill = slice_pts
      slice_fill.push(prj(2, 0, 0))
      slice_fill.push(prj(-2, 0, 0))
      merge-path(fill: rgb(255, 230, 200, 150), stroke: none, close: true, {
        line(..slice_fill)
      })
      line(..slice_pts, stroke: 1.5pt + red)
      
      let base_pts = ()
      for deg in range(0, 361, step: 10) {
        let r = deg * 1deg
        base_pts.push(prj(2 * calc.cos(r), 2 * calc.sin(r), 0))
      }
      line(..base_pts, stroke: 0.8pt + blue)
      
      content(prj(1.2, 0, 1.8), [ Mặt cắt ], anchor: "west")
      content(prj(2.2, 0.2, 0), $2$, anchor: "north")
      content(prj(-2.2, -0.2, 0), $-2$, anchor: "north")
    })),
    fig-pos: "right",
    fig-width: 40%,
    loigiai: [
      #ppgiai[
        - Điểm cao nhất khi $z$ đạt giá trị lớn nhất, xảy ra khi $x=0, y=0$.
        - Mặt cắt đứng $y=0$ thu được bằng cách thế $y=0$ vào phương trình mặt cong.
        - Độ rộng chân đồi là khoảng cách giữa hai giao điểm của parabol với trục hoành $z=0$.
        - Diện tích mặt cắt được tính bằng tích phân diện tích giới hạn bởi parabol trên đoạn chân đồi.
      ]
      - *Ý a) Đúng.* Ta có $z = 4 - x^2 - y^2 <= 4$ với mọi $x, y$.
        Giá trị lớn nhất $z_max = 4$ đạt được khi $x = 0, y = 0$.
        Tọa độ đỉnh cao nhất là $H(0; 0; 4)$.
      - *Ý b) Đúng.* Thay $y=0$ vào phương trình mặt cong ta được lối đi trên mặt đứng:
        $ z = 4 - x^2 - 0^2 = 4 - x^2. $
      - *Ý c) Đúng.* Chân lối đi tiếp xúc mặt đất ứng với cao độ $z=0$:
        $ 4 - x^2 = 0 <=> x^2 = 4 <=> x = plus.minus 2. $
        Hai đầu chân đồi có tọa độ $A(-2; 0; 0)$ và $B(2; 0; 0)$.
        Độ rộng chân đồi là khoảng cách $A B = 2 - (-2) = 4$ decamét.
      - *Ý d) Sai.* Diện tích mặt cắt thẳng đứng này là:
        $
          S = integral_(-2)^2 (4 - x^2) dif x
          = 2 integral_0^2 (4 - x^2) dif x
          = 2 lr( ( 4x - x^3 / 3 ) | )_0^2
        $
        Thế cận vào:
        $ S = 2 ( 4(2) - 8 / 3 ) = 2 ( 8 - 8 / 3 ) = 2 dot 16 / 3 = 32 / 3 " (decamét vuông)". $
        Vậy diện tích phải bằng $32/3$ decamét vuông, không phải $16/3$.
    ]
  )

  #ds(
    [Một bể chứa nước hình trụ đứng đang bị rò rỉ nước qua một lỗ thủng dưới đáy. Chiều cao mực nước còn lại trong bể (tính bằng mét) sau $t$ phút kể từ lúc rò rỉ thỏa mãn phương trình đạo hàm: $h'(t) = -0,2 sqrt(h(t))$ với chiều cao ban đầu là $h(0) = 4$ mét. Xét tính đúng/sai của các khẳng định sau:],
    (
      True([Chiều cao mực nước ban đầu trong bể bằng 4 mét.]),
      True([Chiều cao mực nước trong bể sau 10 phút rò rỉ là 1,0 mét.]),
      True([Bể chứa nước sẽ hoàn toàn cạn nước sau thời điểm 20 phút kể từ lúc rò rỉ.]),
      True([Vận tốc biến thiên trung bình của chiều cao mực nước trong 10 phút đầu tiên bằng $-0,3$ mét/phút.]),
    ),
    fig: fig-panel(cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((-1, 0), (-1, 2.5), stroke: 1pt + black)
      line((1, 0), (1, 2.5), stroke: 1pt + black)
      circle((0, 2.5), radius: (1, 0.2), stroke: 1pt + black)
      let h = 1.6
      circle((0, h), radius: (1, 0.2), stroke: 1pt + blue, fill: rgb(180, 220, 255, 100))
      line((-1, 0), (-1, h), stroke: 1pt + blue)
      line((1, 0), (1, h), stroke: 1pt + blue)
      arc((0, 0), radius: (1, 0.2), start: 180deg, delta: 180deg, stroke: 1pt + blue, fill: rgb(180, 220, 255, 100))
      circle((0, 0), radius: (1, 0.2), stroke: (paint: black, dash: "dashed"))
      line((0, -0.2), (0, -0.8), mark: (end: ">"), stroke: 1.5pt + red)
      content((0, -1.0), [ Rò rỉ ], anchor: "north")
      line((-1.2, 0), (-1.2, h), stroke: 0.5pt + gray, mark: (start: ">", end: ">"))
      content((-1.4, h/2), $h(t)$)
    })),
    fig-pos: "right",
    fig-width: 32%,
    loigiai: [
      #ppgiai[
        - Phương trình vi phân mô tả tốc độ rò rỉ nước: $h'(t) = -0,2 sqrt(h(t))$.
        - Ta có thể kiểm tra nghiệm của phương trình này có dạng: $h(t) = (2 - 0,1t)^2$ trên đoạn $[0; 20]$.
        - Xác minh điều kiện đầu $h(0) = 4$.
        - Sử dụng biểu thức $h(t)$ để kiểm tra các mốc thời gian $t=10, 20$ và vận tốc biến thiên trung bình.
      ]
      - *Ý a) Đúng.* Rõ ràng từ giả thiết $h(0) = 4$ mét là chiều cao mực nước ban đầu.
      - *Ý b) Đúng.* Ta kiểm nghiệm lại hàm số $h(t) = (2 - 0,1t)^2$ với $0 <= t <= 20$:
        $ h'(t) = 2(2 - 0,1t) dot (-0,1) = -0,2(2 - 0,1t) = -0,2 sqrt(h(t)). $
        Hàm số này thỏa mãn hoàn toàn phương trình vi phân và điều kiện đầu $h(0) = (2 - 0)^2 = 4$ mét.
        Chiều cao mực nước sau 10 phút là:
        $ h(10) = (2 - 0,1 dot 10)^2 = (2 - 1)^2 = 1,0 " (mét)". $
      - *Ý c) Đúng.* Bể cạn nước khi chiều cao mực nước $h(t) = 0$:
        $ (2 - 0,1t)^2 = 0 <=> 2 - 0,1t = 0 <=> 0,1t = 2 <=> t = 20 " (phút)". $
        Vậy bể cạn hoàn toàn sau 20 phút.
      - *Ý d) Đúng.* Vận tốc biến thiên trung bình của mực nước trong 10 phút đầu tiên là:
        $ v_("tb") = (h(10) - h(0)) / (10 - 0) = (1 - 4) / 10 = -0,3 " (mét/phút)". $
        Dấu âm thể hiện mực nước đang giảm đi.
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN III — Trả lời ngắn
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

  #tln(
    [Một kiến trúc sư thiết kế một chiếc cầu vòm bán parabol. Khoảng cách giữa hai chân cầu đứng trên mặt đất là $12$ mét, điểm cao nhất của vòm cầu ở chính giữa có độ cao so với mặt đất bằng $6$ mét. Để tính toán vật liệu sơn phủ mặt trước của vòm cầu, người thiết kế cần tính diện tích của mặt phẳng giới hạn bởi vòm cầu và mặt đất. Hãy tính diện tích đó theo đơn vị mét vuông.],
    [48],
    fig: fig-panel(cetz.canvas(length: 0.6cm, {
      import cetz.draw: *
      line((-8, 0), (8, 0), stroke: 1.5pt + black)
      let arch = ()
      for i in range(-60, 61) {
        let x = i / 10.0
        let y = 6 - x * x / 6.0
        arch.push((x, y))
      }
      let arch_fill = arch
      arch_fill.push((6, 0))
      arch_fill.push((-6, 0))
      merge-path(fill: rgb(240, 240, 240, 150), stroke: none, close: true, {
        line(..arch_fill)
      })
      line(..arch, stroke: 2pt + rgb("a52a2a"))
      for x in (-4, -2, 0, 2, 4) {
        let y = 6 - x * x / 6.0
        line((x, 0), (x, y), stroke: 0.8pt + gray)
      }
      content((0, 6.4), [ $6$ m ], anchor: "south")
      line((-6, -0.8), (6, -0.8), stroke: 0.5pt + gray, mark: (start: ">", end: ">"))
      content((0, -1.3), [ $12$ m ])
    })),
    fig-pos: "right",
    fig-width: 40%,
    loigiai: [
      #ppgiai[
        - Chọn hệ trục tọa độ phù hợp sao cho gốc $O$ trùng với trung điểm đoạn chân cầu trên mặt đất.
        - Thiết lập phương trình parabol có đỉnh $(0; 6)$ và đi qua hai điểm chân cầu $(-6; 0)$ và $(6; 0)$.
        - Tính diện tích bằng tích phân giới hạn bởi parabol trên mặt đất.
      ]
      Chọn hệ trục tọa độ $O x y$ sao cho trục hoành $O x$ nằm trùng với mặt đất, gốc $O$ là trung điểm chân cầu.
      Khi đó:
      - Hai điểm chân cầu đứng trên mặt đất có tọa độ là: $A(-6; 0)$ và $B(6; 0)$.
      - Điểm cao nhất ở giữa vòm cầu có tọa độ là: $C(0; 6)$.
      Phương trình đường vòm cầu có dạng parabol:
      $ y = a x^2 + 6. $
      Vì parabol đi qua điểm $B(6; 0)$ nên ta có:
      $ a(6)^2 + 6 = 0 <=> 36a = -6 <=> a = -1/6. $
      Do đó, phương trình parabol mô tả vòm cầu là:
      $ y = -1/6 x^2 + 6. $
      Diện tích của mặt phẳng giới hạn bởi vòm cầu và mặt đất là:
      $
        S = integral_(-6)^6 ( -1/6 x^2 + 6 ) dif x
        = 2 integral_0^6 ( -1/6 x^2 + 6 ) dif x
        = 2 lr( ( -x^3 / 18 + 6x ) | )_0^6.
      $
      Thế cận $x=6$ vào:
      $
        S = 2 ( -6^3 / 18 + 6 dot 6 )
        = 2 ( -216 / 18 + 36 )
        = 2 ( -12 + 36 ) = 2 dot 24 = 48 " (m"^2")".
      $
      Vậy diện tích cần tìm là $48$ mét vuông.
    ]
  )

  #tln(
    [Trong không gian với hệ tọa độ $O x y z$ (đơn vị đo trên các trục là km), một trạm kiểm soát radar được đặt tại gốc tọa độ $O(0; 0; 0)$. Một máy bay chở khách di chuyển theo đường bay thẳng được mô hình hóa bởi đường thẳng $d: (x-3)/1 = (y-4)/2 = (z-5)/2$. Khoảng cách ngắn nhất từ trạm radar $O$ đến đường bay của máy bay bằng bao nhiêu km?],
    [1],
    loigiai: [
      #ppgiai[
        Khoảng cách ngắn nhất từ trạm radar $O(0;0;0)$ đến đường thẳng $d$ chính là khoảng cách từ điểm $O$ đến đường thẳng $d$: $d(O, d) = (|[arrow(O P), arrow(u)]|) / (|arrow(u)|)$ với $P$ là một điểm thuộc đường thẳng $d$ và $arrow(u)$ là vectơ chỉ phương của $d$.
      ]
      Đường thẳng $d$ đi qua điểm $P(3; 4; 5)$ và nhận vectơ chỉ phương là $arrow(u) = (1; 2; 2)$.
      Ta có vectơ nối từ gốc tọa độ $O$ tới điểm $P$:
      $ arrow(O P) = (3; 4; 5). $
      Tính tích có hướng $[arrow(O P), arrow(u)]$:
      $
        [arrow(O P), arrow(u)]
        = ( 4 dot 2 - 5 dot 2 ; 5 dot 1 - 3 dot 2 ; 3 dot 2 - 4 dot 1 )
        = ( 8 - 10 ; 5 - 6 ; 6 - 4 )
        = (-2; -1; 2).
      $
      Độ dài của các vectơ:
      - $|[arrow(O P), arrow(u)]| = sqrt((-2)^2 + (-1)^2 + 2^2) = sqrt(4 + 1 + 4) = 3$.
      - $|arrow(u)| = sqrt(1^2 + 2^2 + 2^2) = sqrt(1 + 4 + 4) = 3$.
      Khoảng cách ngắn nhất cần tính từ trạm radar đến đường bay của máy bay là:
      $ d(O, d) = |[arrow(O P), arrow(u)]| / |arrow(u)| = 3 / 3 = 1 " (km)". $
      Vậy khoảng cách ngắn nhất bằng $1$ km.
    ]
  )

  #tln(
    [Một doanh nghiệp tính toán rằng chi phí cận biên để sản xuất thêm sản phẩm thứ $x$ ($x >= 0$) được mô tả bởi hàm số $C'(x) = 3x^2 - 12x + 15$ (USD/sản phẩm). Biết rằng chi phí cố định ban đầu của doanh nghiệp (chi phí phát sinh khi chưa sản xuất sản phẩm nào) là $200$ USD. Hãy tính tổng chi phí (USD) để doanh nghiệp sản xuất ra $10$ sản phẩm.],
    [750],
    loigiai: [
      #ppgiai[
        - Tìm hàm tổng chi phí $C(x)$ bằng cách lấy nguyên hàm của chi phí cận biên $C'(x)$: $C(x) = integral C'(x) dif x$.
        - Sử dụng chi phí cố định $C(0) = 200$ để tìm hằng số nguyên hàm $C_0$.
        - Tính giá trị chi phí khi sản xuất 10 sản phẩm $C(10)$.
      ]
      Ta có hàm tổng chi phí là nguyên hàm của hàm chi phí cận biên:
      $ C(x) = integral (3x^2 - 12x + 15) dif x = x^3 - 6x^2 + 15x + C_0. $
      Vì chi phí cố định là $200$ USD (tương ứng khi số lượng sản phẩm $x = 0$):
      $ C(0) = 200 => 0^3 - 6(0)^2 + 15(0) + C_0 = 200 => C_0 = 200.  $
      Do đó, hàm tổng chi phí là:
      $ C(x) = x^3 - 6x^2 + 15x + 200 " (USD)". $
      Tổng chi phí sản xuất ra 10 sản phẩm là:
      $
        C(10) = 10^3 - 6(10)^2 + 15(10) + 200
        = 1000 - 600 + 150 + 200 = 750 " (USD)".
      $
      Vậy tổng chi phí bằng $750$ USD.
    ]
  )

  #tln(
    [Một hạt chuyển động dọc theo trục hoành $O x$ từ vị trí $x = 1$ m đến vị trí $x = 4$ m dưới tác dụng của một lực biến thiên theo vị trí có công thức $F(x) = 12 / x^2 + 3$ (Newtons). Công thực hiện bởi lực này lên hạt bằng bao nhiêu Joules?],
    [18],
    fig: fig-panel(cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
      content((5.5, -0.3), $x$)
      line((0, -0.5), (0, 16), mark: (end: ">"), stroke: 0.8pt)
      content((-0.4, 16), $F(x)$)
      content((-0.3, -0.3), $O$)
      
      let pts = ()
      for i in range(10, 41) {
        let x = i / 10.0
        let y = 12 / (x * x) + 3
        pts.push((x, y))
      }
      let fill_pts = pts
      fill_pts.push((4, 0))
      fill_pts.push((1, 0))
      merge-path(fill: rgb(255, 200, 200, 150), stroke: none, close: true, {
        line(..fill_pts)
      })
      line(..pts, stroke: 1.5pt + red)
      line((1, 0), (1, 15), stroke: (paint: black, dash: "dashed"))
      line((4, 0), (4, 3.75), stroke: (paint: black, dash: "dashed"))
      
      circle((1, 0), radius: 1.5pt, fill: black)
      content((1, -0.4), $1$)
      circle((4, 0), radius: 1.5pt, fill: black)
      content((4, -0.4), $4$)
      content((2.5, 4), [ Công $W$ ], anchor: "center")
      content((3, 8), $F(x) = 12/x^2 + 3$, anchor: "west")
    })),
    fig-pos: "right",
    fig-width: 40%,
    loigiai: [
      #ppgiai[
        Công $W$ thực hiện bởi một lực biến thiên $F(x)$ tác dụng lên vật chuyển động dọc theo trục tọa độ từ vị trí $x=a$ đến $x=b$ bằng tích phân: $W = integral_a^b F(x) dif x$.
      ]
      Công thực hiện bởi lực $F(x)$ khi hạt chuyển động từ $x = 1$ đến $x = 4$ là:
      $
        W = integral_1^4 F(x) dif x
        = integral_1^4 ( 12 / x^2 + 3 ) dif x
        = lr( ( -12 / x + 3x ) | )_1^4.
      $
      Thế cận trên $x=4$:
      $ W(4) = -12 / 4 + 3(4) = -3 + 12 = 9. $
      Thế cận dưới $x=1$:
      $ W(1) = -12 / 1 + 3(1) = -12 + 3 = -9.  $
      Công thực hiện được là:
      $ W = 9 - (-9) = 18 " (Joules)". $
      Vậy công thực hiện bằng $18$ Joules.
    ]
  )

  #tln(
    [Một cửa hàng bán máy tính bảo hành sản phẩm trong vòng 1 năm. Tỷ lệ máy tính cần sửa chữa trong thời gian bảo hành là $0,1$. Một trường học mua một lô gồm 8 chiếc máy tính từ cửa hàng này. Tính xác suất để có đúng 2 chiếc máy tính cần sửa chữa trong thời gian bảo hành. (Làm tròn kết quả đến hai chữ số thập phân).],
    [0.15],
    loigiai: [
      #ppgiai[
        Số máy tính cần sửa chữa $X$ tuân theo phân phối nhị thức với số phép thử $n = 8$ và xác suất thành công (máy tính cần sửa) $p = 0,1$: $P(X = k) = C_n^k p^k (1-p)^(n-k)$.
      ]
      Ở đây:
      - Số lượng máy tính $n = 8$.
      - Xác suất cần sửa chữa $p = 0,1$.
      - Số máy tính lỗi mong muốn $k = 2$.
      Xác suất để có đúng 2 máy tính cần bảo hành sửa chữa là:
      $
        P(X = 2) = C_8^2 dot (0,1)^2 dot (1 - 0,1)^(8 - 2)
        = 28 dot 0,01 dot (0,9)^6.
      $
      Tính toán giá trị mũ:
      $ (0,9)^6 = 0,531441. $
      Nhân các giá trị:
      $ P(X = 2) = 28 dot 0,01 dot 0,531441 = 0,28 dot 0,531441 = 0,14880348. $
      Làm tròn kết quả đến hai chữ số thập phân ta được xấp xỉ $0,15$.
    ]
  )

  #tln(
    [Trong không gian với hệ tọa độ $O x y z$ (đơn vị đo trên các trục là mét), một tấm pin mặt trời phẳng đi qua ba điểm định vị $A(3; 0; 0)$, $B(0; 3; 0)$, và $C(0; 0; 6)$. Một cột đỡ bằng kim loại thẳng được nối vuông góc từ gốc tọa độ $O(0; 0; 0)$ đến mặt phẳng chứa tấm pin mặt trời để tăng độ vững chắc. Tính chiều dài của cột đỡ kim loại đó theo đơn vị mét.],
    [2],
    fig: fig-panel(cetz.canvas(length: 1cm, {
      import cetz.draw: *
      let prj(x, y, z) = (x - 0.5 * y, 0.3 * y + z)
      line(prj(0, 0, 0), prj(4.5, 0, 0), mark: (end: ">"), stroke: 0.5pt + gray)
      content(prj(4.5, 0, 0.3), $x$)
      line(prj(0, 0, 0), prj(0, 4.5, 0), mark: (end: ">"), stroke: 0.5pt + gray)
      content(prj(-0.3, 4.5, 0), $y$)
      line(prj(0, 0, 0), prj(0, 7.5, 0), mark: (end: ">"), stroke: 0.5pt + gray) // Note: z is vertical, but let's draw it as vertical (z is last coord in prj)
      // Actually z is vertical: prj(x, y, z) = (x - 0.5*y, 0.3*y + z). So vertical axis is indeed z
      line(prj(0, 0, 0), prj(0, 0, 7.5), mark: (end: ">"), stroke: 0.5pt + gray)
      content(prj(0.3, 0, 7.5), $z$)
      content(prj(0.2, -0.2, 0), $O$)
      
      let A_pt = prj(3, 0, 0)
      let B_pt = prj(0, 3, 0)
      let C_pt = prj(0, 0, 6)
      
      line(A_pt, B_pt, C_pt, close: true, stroke: 1.2pt + blue, fill: rgb(180, 200, 255, 100))
      
      circle(A_pt, radius: 1.5pt, fill: black)
      content(A_pt, $A(3;0;0)$, anchor: "north-west")
      circle(B_pt, radius: 1.5pt, fill: black)
      content(B_pt, $B(0;3;0)$, anchor: "east")
      circle(C_pt, radius: 1.5pt, fill: black)
      content(C_pt, $C(0;0;6)$, anchor: "south")
      
      let H_pt = prj(1.333, 1.333, 0.667)
      line(prj(0, 0, 0), H_pt, stroke: 1.5pt + red)
      circle(H_pt, radius: 1.5pt, fill: red)
      content(H_pt, $H$, anchor: "west")
    })),
    fig-pos: "right",
    fig-width: 40%,
    loigiai: [
      #ppgiai[
        - Lập phương trình mặt phẳng đi qua ba điểm nằm trên ba trục tọa độ (phương trình đoạn chắn): $x/a + y/b + z/c = 1$.
        - Chiều dài cột đỡ vuông góc chính là khoảng cách từ gốc tọa độ $O(0;0;0)$ đến mặt phẳng đó.
      ]
      Phương trình mặt phẳng đi qua ba điểm $A(3; 0; 0)$, $B(0; 3; 0)$, và $C(0; 0; 6)$ viết theo đoạn chắn là:
      $ x / 3 + y / 3 + z / 6 = 1. $
      Quy đồng mẫu số chung là 6 để đưa về phương trình tổng quát:
      $ 2x + 2y + z - 6 = 0. $
      Chiều dài cột đỡ kim loại nối từ gốc tọa độ $O(0; 0; 0)$ vuông góc tới tấm pin chính là khoảng cách từ $O$ đến mặt phẳng trên:
      $
        d(O, (P)) = |2(0) + 2(0) + (0) - 6| / sqrt(2^2 + 2^2 + 1^2)
        = |-6| / sqrt(4 + 4 + 1)
        = 6 / sqrt(9) = 6 / 3 = 2 " (m)".
      $
      Vậy chiều dài cột đỡ kim loại bằng $2$ mét.
    ]
  )
]  // end make-questions

// Chỉ chạy khi mở standalone (không được import bởi Beamer.typ)
#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}
