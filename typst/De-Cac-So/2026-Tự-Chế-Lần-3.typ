#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.1"
#import "../bbt.typ": *
#import "../math-sym.typ": *

#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue

#show math.equation: set text(fill: black)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "THPT NGUYỄN HỮU CẢNH",
  school: "ĐỀ THI THỬ LẦN 3",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "201",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  #exam-part([PHẦN I. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi, thí sinh chỉ chọn một phương án trả lời.], count: 12)

  #tn(
    [Trong không gian $O x y z$, cho điểm $M(1; -2; 3)$. Tọa độ điểm $M'$ đối xứng với điểm $M$ qua mặt phẳng $(O x y)$ là],
    (
      [$M'(-1; 2; -3)$.],
      [$M'(1; -2; 0)$.],
      [$M'(-1; 2; 3)$.],
      True([$M'(1; -2; -3)$.]),
    ),
    loigiai: [
      #ppgiai[
        Hai điểm đối xứng nhau qua mặt phẳng $(O x y)$ thì có cùng hoành độ và tung độ, còn cao độ đổi dấu.
      ]

      Điểm $M(1; -2; 3)$ đối xứng qua mặt phẳng $(O x y)$ sẽ có tọa độ:
      $
        M'(1; -2; -3).
      $
      Vậy chọn đáp án *D*.
    ],
  )

  #tn(
    [Khảo sát thời gian tự học trong một ngày (đơn vị tính bằng giờ) của $40$ học sinh, ta thu được mẫu số liệu ghép nhóm sau:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [Thời gian], [$[0; 2)$], [$[2; 4)$], [$[4; 6)$], [$[6; 8)$], [$[8; 10)$],
          [Số học sinh], [5], [12], [15], [6], [2],
        )
      ]
      Trung vị của mẫu số liệu trên bằng],
    (
      [$4,8$.],
      [$4,5$.],
      True([$4,4$.]),
      [$4,2$.],
    ),
    loigiai: [
      #ppgiai[
        Cỡ mẫu $n = 40$, vị trí trung vị là $n/2 = 20$.
        Bảng tần số tích lũy cho thấy lớp chứa trung vị là lớp $[4; 6)$.
      ]

      Ta có:
      - Cận dưới của lớp trung vị: $L = 4$.
      - Tần số tích lũy trước lớp trung vị: $F = 5 + 12 = 17$.
      - Tần số lớp trung vị: $f = 15$.
      - Độ rộng lớp: $h = 2$.

      Do đó:
      $
        M_e = L + ((n/2 - F)/f) dot h = 4 + ((20 - 17)/15) dot 2 = 4 + 6/15 dot 2 = 4 + 0,4 = 4,4.
      $
      Vậy chọn đáp án *C*.
    ],
  )

  #tn(
    [Tập nghiệm của bất phương trình $((1)/2)^(x^2 - x) >= (1)/4$ là],
    (
      True([$[-1; 2]$.]),
      [$(-oo; -1] union [2; +oo)$.],
      [$(-1; 2)$.],
      [$[-2; 1]$.],
    ),
    loigiai: [
      #ppgiai[
        Vì cơ số $1/2 < 1$ nên khi bỏ cơ số ta phải đổi chiều bất phương trình.
      ]

      Ta có:
      $
        ((1)/2)^(x^2 - x) >= ((1)/2)^2 <=> x^2 - x <= 2.
      $
      Suy ra:
      $
        x^2 - x - 2 <= 0 <=> -1 <= x <= 2.
      $
      Vậy tập nghiệm là $[-1; 2]$. Chọn đáp án *A*.
    ],
  )

  #tn(
    [Cho hàm số $y = f(x)$ là hàm đa thức bậc $5$, có đạo hàm $f'(x)$ trên $RR$. Đồ thị của hàm số $y = f'(x)$ là đường cong có đúng ba điểm chung với trục hoành như hình vẽ dưới đây.
Số điểm cực tiểu của hàm số $y = f(x)$ là],
    (
      [$3$.],
      [$0$.],
      [$2$.],
      True([$1$.]),
    ),
    fig: cetz.canvas(length: 0.8cm, {
      import cetz.draw: *

      // Trục tọa độ
      line((-2.5, 0), (3.5, 0), mark: (end: ">"))
      content((3.5, 0.3), $x$)
      line((0, -2.5), (0, 2.5), mark: (end: ">"))
      content((0.3, 2.5), $y$)
      content((-0.3, -0.3), $O$)

      // Vẽ đồ thị f'(x) - đa thức bậc 4 có 3 nghiệm (1 nghiệm kép)
      let pts = ()
      for i in range(-40, 61) {
        let x = i / 20.0
        let y = 0.15 * (x + 1.5) * calc.pow(x - 0.5, 2) * (x - 2)
        pts.push((x, y))
      }
      line(..pts, stroke: 1.2pt + black)

      // Đánh dấu 3 điểm chung với trục hoành
      circle((-1.5, 0), radius: 2pt, fill: black)
      circle((0.5, 0), radius: 2pt, fill: black)
      circle((2.0, 0), radius: 2pt, fill: black)
    }),
    fig-pos: "center",
    fig-width: 40%,
    loigiai: [
      #ppgiai[
        Điểm cực tiểu của $f(x)$ tương ứng với nghiệm của $f'(x) = 0$ mà tại đó $f'(x)$ đổi dấu từ âm sang dương.
      ]

      Từ đồ thị $y = f'(x)$:
      - Tại $x_1 approx -1,5$: $f'(x)$ đổi dấu từ dương sang âm $=>$ $f(x)$ có cực đại.
      - Tại $x_2 approx 0,5$: $f'(x)$ không đổi dấu (tiếp xúc trục hoành) $=>$ không phải cực trị.
      - Tại $x_3 approx 2$: $f'(x)$ đổi dấu từ âm sang dương $=>$ $f(x)$ có cực tiểu.

      Vậy hàm số $y = f(x)$ có *1* điểm cực tiểu. Chọn đáp án *D*.
    ],
  )

  #tn(
    [Cho hình hộp $A B C D . A' B' C' D'$. Đặt $vect(a) = vect(A B)$, $vect(b) = vect(A D)$, $vect(c) = vect(A A')$. Khẳng định nào sau đây đúng?],
    (
      [$vect(B' D) = vect(a) - vect(b) - vect(c)$.],
      [$vect(B' D) = vect(a) - vect(b) + vect(c)$.],
      [$vect(B' D) = vect(a) + vect(b) + vect(c)$.],
      True([$ vect(B' D) = -vect(a) + vect(b) - vect(c) $.]),
    ),
    loigiai: [
      #ppgiai[
        Sử dụng quy tắc cộng vectơ và tính chất hình hộp để phân tích $vect(B' D)$ theo các vectơ cơ sở.
      ]

      Ta có:
      $
        vect(B' D) = vect(B' A') + vect(A' D') + vect(D' D).
      $
      Vì $A B C D . A' B' C' D'$ là hình hộp nên:
      $
        vect(B' A') = -vect(A B) = -vect(a),
        quad vect(A' D') = vect(A D) = vect(b),
        quad vect(D' D) = -vect(A A') = -vect(c).
      $
      Suy ra:
      $
        vect(B' D) = -vect(a) + vect(b) - vect(c).
      $
      Vậy chọn đáp án *D*.
    ],
  )

  #tn(
    [Cho hàm số $F(x)$ thỏa mãn $int x e^{2x} dif x = F(x) + C$. Giá trị của biểu thức $P = F''(1) - 2F'(1)$ bằng],
    (
      [$0$.],
      True([$e^2$.]),
      [$2e^2$.],
      [$3e^2$.],
    ),
    loigiai: [
      #ppgiai[
        Từ định nghĩa nguyên hàm, ta có $F'(x)$ chính là hàm dưới dấu tích phân.
        Sau đó tính đạo hàm cấp hai và thay giá trị $x=1$ vào biểu thức $P$.
      ]

      Theo đề bài:
      $
        F'(x) = x e^{2x}.
      $
      Đạo hàm hai vế:
      $
        F''(x) = (x e^{2x})' = e^{2x} + 2x e^{2x} = e^{2x}(1 + 2x).
      $
      Tính giá trị biểu thức $P$:
      $
        P = F''(1) - 2F'(1) = e^2(1 + 2) - 2(1 \cdot e^2) = 3e^2 - 2e^2 = e^2.
      $
      Vậy chọn đáp án *B*.
    ],
  )

  #tn(
    [Cho hình chóp tam giác đều $S . A B C$. Gọi $M$ là trung điểm của cạnh $B C$ như hình vẽ dưới đây. Góc phẳng nhị diện của góc nhị diện $[S, B C, A]$ là góc nào dưới đây?],
    (
      [$hat(S A B)$.],
      [$hat(S B M)$.],
      True([$ hat(S M A) $.]),
      [$hat(S C A)$.],
    ),
    loigiai: [
      #ppgiai[
        Góc phẳng nhị diện được xác định bởi hai đường thẳng lần lượt thuộc hai mặt phẳng và cùng vuông góc với giao tuyến tại một điểm.
      ]

      Vì $S . A B C$ là hình chóp tam giác đều nên đáy $A B C$ là tam giác đều và hình chiếu của $S$ trùng với trọng tâm đáy.
      - $M$ là trung điểm $B C$ nên $A M perp B C$ (trong tam giác đều).
      - $S B = S C$ nên $S M perp B C$ (trong tam giác cân).
      Giao tuyến của hai mặt phẳng $(S B C)$ và $(A B C)$ là $B C$.
      Do đó góc giữa hai mặt phẳng chính là góc giữa $S M$ và $A M$, tức là $hat(S M A)$.
      Vậy chọn đáp án *C*.
    ],
  )

  #tn(
    [Cho cấp số nhân $(u_n)$ có số hạng đầu $u_1 = 3$ và công bội $q = -2$. Số hạng thứ $5$ của cấp số nhân đã cho bằng],
    (
      [$-5$.],
      [$-48$.],
      True([$48$.]),
      [$-96$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng công thức số hạng tổng quát của cấp số nhân: $u_n = u_1 q^{n-1}$.
      ]

      Ta có:
      $
        u_5 = u_1 q^4 = 3 \cdot (-2)^4 = 3 \cdot 16 = 48.
      $
      Vậy chọn đáp án *C*.
    ],
  )

  #tn(
    [Đường cong trong hình vẽ dưới đây là đồ thị của một trong bốn hàm số được liệt kê ở bốn phương án A, B, C, D. Hỏi hàm số đó là hàm số nào dưới đây?],
    (
      True([$y = (x^2 - x + 1)/(x - 1)$.]),
      [$y = (-x^2 + x - 1)/(x - 1)$.],
      [$y = (x^2 - x - 1)/(x - 1)$.],
      [$y = (x^2 + x + 1)/(x + 1)$.],
    ),
    fig: cetz.canvas(length: 0.8cm, {
      import cetz.draw: *

      // Trục tọa độ
      line((-2.5, 0), (3.5, 0), mark: (end: ">"))
      content((3.5, 0.3), $x$)
      line((0, -2.5), (0, 3.5), mark: (end: ">"))
      content((0.3, 3.5), $y$)
      content((-0.3, -0.3), $O$)

      // Tiệm cận đứng x=1
      line((1, -2.5), (1, 3.5), stroke: (dash: "dashed", paint: gray))
      content((1.1, -2.3), $1$)

      // Tiệm cận xiên y=x
      line((-2, -2), (3, 3), stroke: (dash: "dashed", paint: gray))
      content((3.1, 2.8), $y=x$)

      // Vẽ đồ thị y = x + 1/(x-1)
      let pts1 = ()
      for i in range(-30, 9) {
        let x = i / 10.0
        let y = x + 1/(x - 1)
        pts1.push((x, y))
      }
      line(..pts1, stroke: 1.2pt + black)

      let pts2 = ()
      for i in range(13, 40) {
        let x = i / 10.0
        let y = x + 1/(x - 1)
        pts2.push((x, y))
      }
      line(..pts2, stroke: 1.2pt + black)

      // Đánh dấu điểm cực trị
      circle((0, -1), radius: 2pt, fill: black)
      content((-0.4, -1), $-1$)
      circle((2, 3), radius: 2pt, fill: black)
      content((2.1, 3.2), $3$)
      content((2.1, -0.3), $2$)
    }),
    fig-pos: "right",
    fig-width: 35%,
    loigiai: [
      #ppgiai[
        Quan sát đồ thị để xác định các đặc điểm: tiệm cận đứng, tiệm cận xiên, và các điểm cực trị.
        So sánh với các phương án để loại trừ.
      ]

      Từ đồ thị ta thấy:
      - Tiệm cận đứng là đường thẳng $x = 1$ $=>$ loại đáp án D (tiệm cận đứng $x = -1$).
      - Đồ thị cắt trục tung tại điểm có tung độ âm (khoảng $-1$).
        Kiểm tra: $y(0) = -1$ thỏa mãn đáp án A và C. Loại B vì $y(0) = 1$.
      - Đồ thị có tiệm cận xiên $y = x$.
        Xét đáp án A: $y = (x^2 - x + 1)/(x - 1) = x + 1/(x - 1)$, tiệm cận xiên $y = x$.
        Xét đáp án C: $y = (x^2 - x - 1)/(x - 1) = x - 1/(x - 1)$, tiệm cận xiên $y = x$.
      - Kiểm tra điểm cực tiểu: Đồ thị có cực tiểu tại $x = 2$, $y = 3$.
        Đáp án A: $y' = 1 - 1/(x-1)^2 = 0 <=> x = 0$ hoặc $x = 2$. $y(2) = 3$. Thỏa mãn.
        Đáp án C: $y' = 1 + 1/(x-1)^2 > 0$ nên không có cực trị. Loại.

      Vậy hàm số cần tìm là $y = (x^2 - x + 1)/(x - 1)$. Chọn đáp án *A*.
    ],
  )

  #tn(
    [Trong không gian $O x y z$, đường thẳng đi qua điểm $M(1; -2; 3)$ và vuông góc với mặt phẳng $(P): 2x - y + 3z - 5 = 0$ có phương trình chính tắc là],
    (
      [$(x - 1)/2 = (y + 2)/1 = (z - 3)/3$.],
      [$(x + 1)/2 = (y - 2)/(-1) = (z + 3)/3$.],
      True([$(x - 1)/2 = (y + 2)/(-1) = (z - 3)/3$.]),
      [$(x - 2)/1 = (y + 1)/(-2) = (z - 3)/3$.],
    ),
    loigiai: [
      #ppgiai[
        Đường thẳng vuông góc với mặt phẳng $(P)$ nên có vectơ chỉ phương trùng với vectơ pháp tuyến của $(P)$.
      ]

      Mặt phẳng $(P)$ có vectơ pháp tuyến $vect(n) = (2; -1; 3)$.
      Đường thẳng đi qua $M(1; -2; 3)$ và có vectơ chỉ phương $vect(u) = vect(n) = (2; -1; 3)$ có phương trình chính tắc:
      $
        (x - 1)/2 = (y + 2)/(-1) = (z - 3)/3.
      $
      Vậy chọn đáp án *C*.
    ],
  )

  #tn(
    [Gọi $S_1$ và $S_2$ là diện tích của hai hình phẳng giới hạn bởi đồ thị của hàm số $y = f(x)$ và trục hoành như hình vẽ dưới đây. Tích phân $integral_{-1}^4 f(x) dif x$ bằng],
    (
      True([$S_1 - S_2$.]),
      [$S_1 + S_2$.],
      [$-S_1 - S_2$.],
      [$-S_1 + S_2$.],
    ),
    fig: cetz.canvas(length: 0.7cm, {
      import cetz.draw: *

      line((-2, 0), (5, 0), mark: (end: ">"))
      content((5, 0.3), $x$)
      line((0, -2), (0, 2.5), mark: (end: ">"))
      content((0.3, 2.5), $y$)
      content((-0.3, -0.3), $O$)

      // Vẽ đồ thị hàm bậc 3 cắt trục hoành tại -1, 2, 4
      let pts = ()
      for i in range(-20, 50) {
        let x = i / 10.0
        let y = -0.15 * (x + 1) * (x - 2) * (x - 4)
        pts.push((x, y))
      }
      line(..pts, stroke: 1.2pt + black)

      // Tô màu S1
      let s1 = ()
      for i in range(-10, 20) {
        let x = i / 10.0
        let y = -0.15 * (x + 1) * (x - 2) * (x - 4)
        s1.push((x, y))
      }
      s1.push((2, 0))
      s1.push((-1, 0))
      line(..s1, close: true, fill: rgb(200, 220, 255), stroke: none)
      content((0.5, 0.8), $S_1$)

      // Tô màu S2
      let s2 = ()
      for i in range(20, 40) {
        let x = i / 10.0
        let y = -0.15 * (x + 1) * (x - 2) * (x - 4)
        s2.push((x, y))
      }
      s2.push((4, 0))
      s2.push((2, 0))
      line(..s2, close: true, fill: rgb(255, 220, 200), stroke: none)
      content((3, -0.6), $S_2$)

      // Đánh dấu điểm cắt
      content((-1, -0.4), $-1$)
      content((4, -0.4), $4$)
    }),
    fig-pos: "center",
    fig-width: 40%,
    loigiai: [
      #ppgiai[
        Tích phân xác định bằng diện tích phần đồ thị nằm trên trục hoành trừ đi diện tích phần đồ thị nằm dưới trục hoành.
      ]

      Từ hình vẽ:
      - Trên khoảng $[-1; 2]$, đồ thị nằm phía trên trục hoành, diện tích là $S_1$.
        $ integral_{-1}^2 f(x) dif x = S_1. $
      - Trên khoảng $[2; 4]$, đồ thị nằm phía dưới trục hoành, diện tích là $S_2$.
        $ integral_2^4 f(x) dif x = -S_2. $

      Do đó:
      $
        integral_{-1}^4 f(x) dif x = integral_{-1}^2 f(x) dif x + integral_2^4 f(x) dif x = S_1 - S_2.
      $
      Vậy chọn đáp án *A*.
    ],
  )

  #tn(
    [Tập xác định của hàm số $y = 1 / sin x + tan x$ là],
    (
      True([$D = RR setminus {k pi / 2 | k in ZZ}$.]),
      [$D = RR setminus {k 2pi | k in ZZ}$.],
      [$D = RR setminus {k pi | k in ZZ}$.],
      [$D = RR setminus {pi / 2 + k pi | k in ZZ}$.],
    ),
    loigiai: [
      #ppgiai[
        Hàm số xác định khi mẫu số khác 0 và hàm tan xác định.
      ]

      Điều kiện xác định:
      $
        hoac(sin x != 0, cos x != 0).
      $
      Ta có:
      $
        sin x != 0 <=> x != k pi,
        quad cos x != 0 <=> x != pi / 2 + k pi.
      $
      Kết hợp hai điều kiện, ta được:
      $
        x != k pi / 2, quad k in ZZ.
      $
      Vậy tập xác định là $D = RR setminus {k pi / 2 | k in ZZ}$. Chọn đáp án *A*.
    ],
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN II — Trắc nghiệm đúng/sai
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai. Thí sinh trả lời từ Câu 1 đến Câu 4.], count: 4)

  #ds(
    [Một dịch vụ truyền hình trực tuyến tại Việt Nam cung cấp 3 gói đăng ký dịch vụ bao gồm gói "Cơ bản", gói "Tiêu chuẩn" và gói "Cao cấp". Những người sử dụng dịch vụ thông qua việc đóng phí hằng tháng được gọi là thuê bao. Mỗi thuê bao chỉ được chọn một trong ba gói dịch vụ trên. Theo thống kê của hệ thống: có $70%$ số thuê bao là người từ $40$ tuổi trở xuống. Trong số những thuê bao từ $40$ tuổi trở xuống, có $20%$ người chọn gói Cơ bản, $30%$ người chọn gói Tiêu chuẩn và $50%$ người chọn gói Cao cấp. Trong số những thuê bao trên $40$ tuổi, có $40%$ người chọn gói Cơ bản, $40%$ người chọn gói Tiêu chuẩn và $20%$ người chọn gói Cao cấp.],
    (
      [Nếu chọn ngẫu nhiên một thuê bao và biết người đó đăng ký gói Cao cấp, xác suất để thuê bao đó trên $40$ tuổi lớn hơn $15%$.],
      [Cần chọn ngẫu nhiên ít nhất $12$ thuê bao để xác suất có ít nhất một người trên $40$ tuổi lớn hơn $99%$.],
      True([Xác suất để chọn ngẫu nhiên một thuê bao là người từ $40$ tuổi trở xuống và có đăng ký gói Cao cấp bằng $0,35$.]),
      True([Xác suất để chọn ngẫu nhiên một thuê bao là người trên $40$ tuổi bằng $0,3$.]),
    ),
    loigiai: [
      #ppgiai[
        - Gọi $A$ là biến cố "thuê bao từ 40 tuổi trở xuống", $P(A) = 0,7$.
        - Gọi $B$ là biến cố "thuê bao trên 40 tuổi", $P(B) = 0,3$.
        - Gọi $C_1, C_2, C_3$ lần lượt là biến cố thuê bao chọn gói Cơ bản, Tiêu chuẩn, Cao cấp.
        - Dữ kiện: $P(C_3 | A) = 0,5$; $P(C_3 | B) = 0,2$.
        - Sử dụng công thức Bayes và xác suất đầy đủ.
      ]

      *Bước 1: Tính $P(C_3)$ bằng công thức xác suất đầy đủ*
      $
        P(C_3) = P(A) dot P(C_3 | A) + P(B) dot P(C_3 | B)
        = 0,7 dot 0,5 + 0,3 dot 0,2 = 0,35 + 0,06 = 0,41.
      $

      *Bước 2: Xét từng mệnh đề*

      *a)* Xác suất để thuê bao trên 40 tuổi khi biết đăng ký gói Cao cấp:
      $
        P(B | C_3) = (P(B) dot P(C_3 | B)) / P(C_3) = (0,3 dot 0,2) / 0,41 = 0,06 / 0,41 approx 0,1463 = 14,63%.
      $
      Vì $14,63% < 15%$ nên mệnh đề a *SAI*.

      *b)* Gọi $n$ là số thuê bao chọn ngẫu nhiên. Xác suất có ít nhất một người trên 40 tuổi:
      $
        P = 1 - P("tất cả đều <= 40") = 1 - 0,7^n.
      $
      Cần $1 - 0,7^n > 0,99 <=> 0,7^n < 0,01$.
      Thử $n = 12$: $0,7^{12} approx 0,0138 > 0,01$ (chưa đủ).
      Thử $n = 13$: $0,7^{13} approx 0,0097 < 0,01$ (thỏa).
      Vậy cần ít nhất $13$ thuê bao, không phải $12$. Mệnh đề b *SAI*.

      *c)* Xác suất thuê bao từ 40 tuổi trở xuống VÀ đăng ký gói Cao cấp:
      $
        P(A cap C_3) = P(A) dot P(C_3 | A) = 0,7 dot 0,5 = 0,35.
      $
      Mệnh đề c *ĐÚNG*.

      *d)* Xác suất chọn ngẫu nhiên một thuê bao là người trên 40 tuổi:
      $
        P(B) = 1 - P(A) = 1 - 0,7 = 0,3.
      $
      Mệnh đề d *ĐÚNG*.

      #nhanxet[Bài toán kết hợp xác suất có điều kiện (Bayes) và phân phối nhị thức. Ý b) là "bẫy" phổ biến: học sinh dễ nhầm $0,7^{12} < 0,01$ mà không kiểm tra lại bằng máy tính.]
    ],
  )

  #ds(
    [Trung bình mỗi người trưởng thành ở Việt Nam tiêu thụ khoảng $200$ mg caffeine mỗi ngày. Sau khi uống, caffeine đi vào máu và được cơ thể phân hủy theo thời gian. Biến thiên lượng caffeine trong máu sau khi uống được mô tả bởi hàm số mũ có số cơ số $e$ có dạng $f(t) = A dot e^(k t)$, trong đó $A$ là lượng caffeine ban đầu (tính bằng mg), $t$ là thời gian kể từ lúc uống (tính bằng giờ), và $k$ là hằng số phân giải. Một người uống một tách cà phê chứa $120$ mg caffeine. Biết rằng cứ sau khoảng $3$ giờ thì lượng caffeine trong cơ thể người ấy giảm đi một nửa.],
    (
      True([Hàm số mô tả lượng caffeine trong máu của người đó sau $t$ giờ có phương trình $f(t) = 120 dot e^(-(ln 2)/3 dot t)$.]),
      [Sau $6$ giờ kể từ lúc uống, lượng caffeine còn lại trong máu người đó là $40$ mg.],
      True([Kể từ lúc uống, thời gian để lượng caffeine trong máu phân giải hết $7/8$ lượng ban đầu là $9$ giờ.]),
      [Một thanh niên uống một lon nước tăng lực chứa $160$ mg caffeine có cùng chu kỳ bán rã như trên. Biết rằng để không bị mất ngủ, lượng caffeine trong cơ thể không được vượt quá $20$ mg. Nếu thanh niên này dự định đi ngủ lúc $22$ giờ thì thời điểm muộn nhất có thể uống lon nước tăng lực đó là lúc $14$ giờ cùng ngày.],
    ),
    loigiai: [
      #ppgiai[
        - Từ dữ kiện "sau 3 giờ giảm đi một nửa" ta tìm được hằng số phân giải $k$.
        - Công thức tổng quát: $f(t) = A dot e^(k t)$ với $f(3) = A/2$.
        - Giải ra: $e^(3k) = 1/2 => 3k = ln(1/2) = -ln 2 => k = -(ln 2)/3$.
        - Vậy $f(t) = A dot e^(-(ln 2)/3 dot t)$.
      ]

      *a)* Với $A = 120$ mg, hàm số mô tả là $f(t) = 120 dot e^(-(ln 2)/3 dot t)$. Mệnh đề a *ĐÚNG*.

      *b)* Sau $6$ giờ:
      $
        f(6) = 120 dot e^(-(ln 2)/3 dot 6) = 120 dot e^(-2 ln 2) = 120 dot (e^(ln 2))^(-2) = 120 dot 2^(-2) = 120/4 = 30 " (mg)".
      $
      Mệnh đề nói $40$ mg là sai. Mệnh đề b *SAI*.

      *c)* Phân giải hết $7/8$ lượng ban đầu nghĩa là còn lại $1/8$ lượng ban đầu:
      $
        f(t) = A/8 => A dot e^(-(ln 2)/3 dot t) = A/8 => e^(-(ln 2)/3 dot t) = 1/8 = 2^(-3).
      $
      Lấy logarit hai vế:
      $
        -(ln 2)/3 dot t = -3 ln 2 => t = 9 " (giờ)".
      $
      Mệnh đề c *ĐÚNG*.

      *d)* Với $A = 160$ mg, cần $f(t) <= 20$:
      $
        160 dot e^(-(ln 2)/3 dot t) <= 20 => e^(-(ln 2)/3 dot t) <= 1/8 = 2^(-3).
      $
      $
        -(ln 2)/3 dot t <= -3 ln 2 => t >= 9 " (giờ)".
      $
      Nếu ngủ lúc $22$ giờ, phải uống trước đó ít nhất $9$ giờ, tức là lúc $13$ giờ (1 giờ chiều).
      Mệnh đề nói $14$ giờ là sai (vì $14$ giờ đến $22$ giờ chỉ có $8$ giờ, lượng caffeine còn lại là $160 dot (1/2)^(8/3) approx 25,2$ mg $> 20$ mg).
      Mệnh đề d *SAI*.

      #meo[Bài toán phân rã theo hàm mũ luôn có tính chất "chu kỳ bán rã": cứ sau một khoảng thời gian cố định thì lượng chất còn lại giảm đi một nửa. Ở đây chu kỳ bán rã là $3$ giờ, nên sau $6$ giờ còn $1/4$, sau $9$ giờ còn $1/8$. Dùng tính chất này sẽ giải nhanh hơn công thức.]
    ],
  )

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
