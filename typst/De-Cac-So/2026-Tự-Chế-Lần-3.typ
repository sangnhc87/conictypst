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
  #ds(
    [Trong không gian $O x y z$ (đơn vị đo là kilômét), một chiếc drone thứ nhất cất cánh từ điểm $A(1; 2; 0)$ và bay thẳng theo hướng của vectơ chỉ phương $vect(u_1) = (1; 1; 2)$ để tới giao hàng tại một điểm $B$ ở trên đỉnh một tòa nhà cao tầng. Điểm $B$ có cao độ $z = 4$. Cùng thời điểm đó, một chiếc drone thứ hai bay thẳng từ điểm $C(4; 5; 3)$ theo đường thẳng $d_2$ song song với trục cao độ $O z$ để thực hiện nhiệm vụ khảo sát thời tiết.],
    (
      True([Điểm giao hàng $B$ có tọa độ là $(3; 4; 4)$.]),
      True([Đường thẳng chứa quỹ đạo bay của drone thứ hai song song với trục $O z$ nên có vectơ chỉ phương có thể chọn là $vect(u_2) = (0; 0; 1)$.]),
      [Khoảng cách ngắn nhất giữa hai quỹ đạo bay của hai chiếc drone bằng $1$ km.],
      True([Nếu tiếp tục duy trì đường bay thẳng theo quỹ đạo cũ thì drone thứ nhất sẽ bay cắt qua đường bay $d_2$ của drone thứ hai tại điểm có tọa độ $(4; 5; 6)$.]),
    ),
    loigiai: [
      #ppgiai[
        - Quỹ đạo drone 1 đi qua $A(1;2;0)$, chỉ phương $vect(u_1) = (1;1;2)$. Tọa độ điểm $M(x;y;z)$ thuộc đường bay là $x = 1+t, y = 2+t, z = 2t$ ($t >= 0$).
        - Quỹ đạo drone 2 đi qua $C(4;5;3)$, song song $O z$ nên có phương trình $x = 4, y = 5, z = 3 + t'$ ($t' in RR$).
        - Ta tìm tọa độ điểm $B$ và khảo sát mối quan hệ giữa hai đường thẳng.
      ]

      *a)* Điểm $B$ thuộc đường bay drone 1 và có cao độ $z = 4$.
      Thay vào phương trình: $2t = 4 <=> t = 2$.
      Suy ra hoành độ và tung độ của $B$ là $x = 1 + 2 = 3$, $y = 2 + 2 = 4$.
      Do đó $B(3; 4; 4)$. Mệnh đề a *ĐÚNG*.

      *b)* Vì quỹ đạo drone thứ hai song song với trục $O z$ nên nó có vectơ chỉ phương cùng phương với vectơ đơn vị $vect(k) = (0; 0; 1)$. Mệnh đề b *ĐÚNG*.

      *c)* Khoảng cách giữa hai đường thẳng $d_1$ và $d_2$:
      - $d_1$ đi qua $A(1; 2; 0)$, chỉ phương $vect(u_1) = (1; 1; 2)$.
      - $d_2$ đi qua $C(4; 5; 3)$, chỉ phương $vect(u_2) = (0; 0; 1)$.
      Tích có hướng: $[vect(u_1), vect(u_2)] = (1; -1; 0)$.
      Ta có $vect(A C) = (3; 3; 3)$.
      Khoảng cách giữa hai đường thẳng:
      $
        d(d_1, d_2) = (| [vect(u_1), vect(u_2)] \cdot vect(A C) |) / (|[vect(u_1), vect(u_2)]|) = (|1 \cdot 3 + (-1) \cdot 3 + 0 \cdot 3|)/sqrt(1^2 + (-1)^2 + 0^2) = 0.
      $
      Vì khoảng cách bằng $0$ nên hai đường thẳng này cắt nhau. Mệnh đề nói khoảng cách bằng $1$ km là *SAI*.

      *d)* Tìm giao điểm của $d_1$ và $d_2$:
      Giải hệ phương trình:
      $
        cases(1 + t = 4, 2 + t = 5, 2t = 3 + t') <=> cases(t = 3, t' = 3).
      $
      Tại $t = 3$, giao điểm có tọa độ là $(4; 5; 6)$. Mệnh đề d *ĐÚNG*.
    ],
  )

  #ds(
    [Để đánh giá hiệu quả của chiến dịch tiêm vắc-xin phòng bệnh X tại một địa phương có dân số ổn định gồm $10.000$ người, các chuyên gia y tế sử dụng hàm số logistic để mô tả số người được tiêm ít nhất một mũi vắc-xin sau $t$ tuần kể từ ngày phát động: $N(t) = (10.000) / (1 + 99 e^(-k t))$ (người), trong đó $k$ là một hằng số dương biểu thị tốc độ lan tỏa của chiến dịch. Biết rằng sau $1$ tuần kể từ khi bắt đầu chiến dịch, có đúng $1.000$ người dân địa phương này đã được tiêm vắc-xin.],
    (
      True([Tại thời điểm bắt đầu phát động chiến dịch ($t = 0$), địa phương này có đúng $100$ người đã được tiêm vắc-xin.]),
      True([Hằng số tốc độ lan tỏa của chiến dịch tiêm chủng bằng $ln(11)$ (xấp xỉ $2,40$).]),
      True([Tốc độ tiêm chủng (số người được tiêm mới trên mỗi tuần) đạt giá trị lớn nhất vào thời điểm $t = (ln(99)) / (ln(11))$ tuần (xấp xỉ $1,91$ tuần).]),
      [Tốc độ tiêm chủng tối đa đạt được trong chiến dịch này là $6.000$ người/tuần.],
    ),
    loigiai: [
      #ppgiai[
        - Tính $N(0)$ để xác định số người tiêm ban đầu.
        - Sử dụng giả thiết $N(1) = 1.000$ để giải phương trình mũ tìm hằng số $k$.
        - Tốc độ tiêm chủng được biểu diễn bởi đạo hàm $N'(t)$. Ta tìm giá trị lớn nhất của đạo hàm này.
      ]

      *a)* Tại thời điểm bắt đầu ($t = 0$), số người đã được tiêm là:
      $
        N(0) = (10.000) / (1 + 99 e^0) = 10.000 / 100 = 100 " (người)".
      $
      Mệnh đề a *ĐÚNG*.

      *b)* Theo đề bài, sau $1$ tuần ($t = 1$), số người được tiêm là $1.000$:
      $
        N(1) = 1.000 <=> 10.000 / (1 + 99 e^(-k)) = 1.000 <=> 1 + 99 e^(-k) = 10
      $
      $
        <=> 99 e^(-k) = 9 <=> e^(-k) = 1/11 <=> e^k = 11 <=> k = ln(11) approx 2,40.
      $
      Mệnh đề b *ĐÚNG*.

      *c)* Tốc độ tiêm chủng là đạo hàm của hàm số $N(t)$:
      $
        N'(t) = k \cdot N(t) \cdot (1 - (N(t)) / (10.000)).
      $
      Đặt $x = N(t)$ với $x \in (0; 10.000)$. Hàm tốc độ có dạng:
      $
        f(x) = k \cdot x \cdot (1 - x / (10.000)) = k / (10.000) \cdot x \cdot (10.000 - x).
      $
      Theo bất đẳng thức AM-GM (hoặc đỉnh của parabol):
      $
        x(10.000 - x) <= ((x + 10.000 - x) / 2)^2 = (5.000)^2 = 25.000.000.
      $
      Dấu đẳng thức xảy ra khi $x = 5.000$ (người).
      Thời điểm đạt tốc độ tiêm chủng tối đa thỏa mãn:
      $
        N(t) = 5.000 <=> 10.000 / (1 + 99 e^(-k t)) = 5.000 <=> 1 + 99 e^(-k t) = 2
      $
      $
        <=> 99 e^(-k t) = 1 <=> e^(k t) = 99 <=> t = (ln(99)) / k = (ln(99)) / (ln(11)) approx 1,91 " (tuần)".
      $
      Mệnh đề c *ĐÚNG*.

      *d)* Tốc độ tiêm chủng tối đa đạt được là:
      $
        N'_(max) = k \cdot 5.000 \cdot (1 - 5.000 / (10.000)) = 2.500 \cdot k = 2.500 \cdot ln(11) approx 2.500 \cdot 2,3979 = 5.994,75 " (người/tuần)".
      $
      Mệnh đề nói tốc độ tiêm chủng tối đa là $6.000$ người/tuần là *SAI*. (Vì $5995 != 6000$ và sai lệch đáng kể).
    ],
  )

  // PHẦN III
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)
  #resetcau()

  #tln(
    [Một phòng thí nghiệm y khoa tiến hành xét nghiệm sàng lọc bệnh X cho một quần thể dân cư. Biết rằng có $2\%$ dân số thực sự mắc bệnh X. Bộ sinh phẩm xét nghiệm nhanh được sử dụng có độ nhạy $95\%$ (nghĩa là nếu một người có bệnh thì xác suất xét nghiệm cho kết quả dương tính là $95\%$) và độ đặc hiệu $90\%$ (nghĩa là nếu một người không có bệnh thì xác suất xét nghiệm cho kết quả âm tính là $90\%$). Chọn ngẫu nhiên một người trong quần thể để làm xét nghiệm, biết rằng kết quả xét nghiệm của người đó là dương tính. Xác suất để người này thực sự bị bệnh X bằng bao nhiêu? (Làm tròn kết quả đến hàng phần trăm).],
    [0,16],
    loigiai: [
      #ppgiai[
        - Sử dụng công thức xác suất đầy đủ và công thức Bayes để tính xác suất có điều kiện.
      ]

      Gọi $B$ là biến cố "Người được chọn thực sự bị bệnh X", ta có $P(B) = 0,02$.
      Suy ra biến cố đối $B'$ "Người được chọn không bị bệnh X" có xác suất $P(B') = 0,98$.
      Gọi $A$ là biến cố "Kết quả xét nghiệm dương tính". Theo đề bài ta có:
      - Độ nhạy: $P(A | B) = 0,95$.
      - Độ đặc hiệu: $P(A' | B') = 0,90 => P(A | B') = 1 - 0,90 = 0,10$.

      Áp dụng công thức xác suất đầy đủ, xác suất để một người nhận được kết quả xét nghiệm dương tính là:
      $
        P(A) = P(B) \cdot P(A | B) + P(B') \cdot P(A | B')
        = 0,02 \cdot 0,95 + 0,98 \cdot 0,10 = 0,019 + 0,098 = 0,117.
      $

      Áp dụng công thức Bayes, xác suất để người có kết quả xét nghiệm dương tính thực sự mắc bệnh X là:
      $
        P(B | A) = (P(B) \cdot P(A | B)) / P(A) = (0,02 \cdot 0,95) / 0,117 = 0,019 / 0,117 = 19/117 approx 0,16239.
      $
      Làm tròn đến hàng phần trăm, ta được kết quả là *$0,16$*.
    ],
  )

  #tln(
    [Từ một tấm bìa các-tông hình vuông có cạnh bằng $24$ cm, người ta cắt bỏ bốn hình vuông nhỏ bằng nhau có cạnh bằng $x$ (cm) ở bốn góc, sau đó gập các phần mép còn lại lên để tạo thành một chiếc hộp không nắp hình hộp chữ nhật. Hãy tìm giá trị $x$ (cm) để thể tích của chiếc hộp thu được là lớn nhất.],
    [4],
    loigiai: [
      #ppgiai[
        - Lập công thức thể tích chiếc hộp theo biến $x$.
        - Sử dụng đạo hàm để tìm điểm cực đại của hàm thể tích trên khoảng xác định.
      ]

      Khi cắt bỏ bốn góc mỗi góc một hình vuông cạnh $x$ (cm), điều kiện để tạo được chiếc hộp là:
      $
        0 < 2x < 24 <=> 0 < x < 12.
      $
      Khi đó, đáy của chiếc hộp hình hộp chữ nhật là hình vuông có độ dài cạnh là $24 - 2x$ (cm).
      Chiều cao của chiếc hộp bằng $x$ (cm).
      Thể tích của chiếc hộp là:
      $
        V(x) = x(24 - 2x)^2 = 4x(12 - x)^2 = 4(x^3 - 24x^2 + 144x) " (cm"^3")".
      $

      Xét hàm số $V(x)$ trên khoảng $(0; 12)$, ta có đạo hàm:
      $
        V'(x) = 4(3x^2 - 48x + 144) = 12(x^2 - 16x + 48).
      $
      Cho $V'(x) = 0 <=> x^2 - 16x + 48 = 0 <=> hoac(x = 4, x = 12)$.
      Vì $x \in (0; 12)$, ta chỉ nhận giá trị $x = 4$.
      
      Bảng biến thiên của hàm số $V(x)$ trên khoảng $(0; 12)$:
      - $V'(x) > 0$ trên $(0; 4)$ nên hàm số đồng biến.
      - $V'(x) < 0$ trên $(4; 12)$ nên hàm số nghịch biến.
      Do đó, hàm số đạt giá trị lớn nhất tại $x = 4$.
      Vậy để thể tích chiếc hộp là lớn nhất thì cạnh hình vuông nhỏ cắt đi là $4$ cm.
    ],
  )

  #tln(
    [Trong không gian tọa độ $O x y z$, cho mặt cầu $(S): (x-1)^2 + (y-2)^2 + (z-3)^2 = 4$ và đường thẳng $d$ có phương trình chính tắc là $x / 2 = (y - 4) / 2 = z - 1$. Hãy tìm khoảng cách ngắn nhất giữa một điểm $M$ di động trên mặt cầu $(S)$ và đường thẳng $d$.],
    [1],
    loigiai: [
      #ppgiai[
        - Mặt cầu $(S)$ có tâm $I(1; 2; 3)$ và bán kính $R = 2$.
        - Tính khoảng cách từ tâm $I$ đến đường thẳng $d$.
        - Khoảng cách ngắn nhất từ điểm $M$ trên mặt cầu đến đường thẳng $d$ là $d(I, d) - R$ (nếu đường thẳng nằm ngoài mặt cầu).
      ]

      Đường thẳng $d$ đi qua điểm $A(0; 4; 1)$ và có vectơ chỉ phương $vect(u) = (2; 2; 1)$.
      Mặt cầu $(S)$ có tâm $I(1; 2; 3)$ và bán kính $R = 2$.
      Ta tính khoảng cách từ $I$ đến đường thẳng $d$:
      Vectơ $vect(A I) = (1; -2; 2)$.
      Tích có hướng của $vect(A I)$ và $vect(u)$:
      $
        [vect(A I), vect(u)] = ( (-2) \cdot 1 - 2 \cdot 2; 2 \cdot 2 - 1 \cdot 1; 1 \cdot 2 - (-2) \cdot 2 ) = (-6; 3; 6).
      $
      Độ dài của tích có hướng là:
      $
        |[vect(A I), vect(u)]| = sqrt((-6)^2 + 3^2 + 6^2) = sqrt(36 + 9 + 36) = sqrt(81) = 9.
      $
      Độ dài của vectơ chỉ phương $vect(u)$ là:
      $
        |vect(u)| = sqrt(2^2 + 2^2 + 1^2) = 3.
      $
      Khoảng cách từ tâm $I$ đến đường thẳng $d$ là:
      $
        d(I, d) = (|[vect(A I), vect(u)]|) / (|vect(u)|) = 9 / 3 = 3.
      $
      Vì $d(I, d) = 3 > R = 2$ nên đường thẳng $d$ không cắt mặt cầu $(S)$.
      Khoảng cách ngắn nhất giữa một điểm $M$ trên mặt cầu và đường thẳng $d$ là:
      $
        d_(min) = d(I, d) - R = 3 - 2 = 1.
      $
      Vậy đáp số là *$1$*.
    ],
  )

  #tln(
    [Một vật thể có đáy là hình tròn bán kính bằng $3$ dm. Khi cắt vật thể bằng các mặt phẳng vuông góc với một trục đường kính của đáy tại điểm cách tâm đường tròn đáy một khoảng bằng $x$ (dm) ($0 <= x <= 3$), thiết diện thu được luôn là một tam giác đều có cạnh bằng $2 sqrt(9 - x^2)$ (dm). Tính thể tích của vật thể đó theo đơn vị đề-xi-mét khối (làm tròn kết quả đến hàng đơn vị).],
    [62],
    loigiai: [
      #ppgiai[
        - Thiết lập công thức tính diện tích thiết diện tại vị trí $x$.
        - Sử dụng công thức tính thể tích vật thể bằng tích phân của hàm diện tích thiết diện.
      ]

      Do đáy vật thể là hình tròn bán kính $3$ nên khi cắt vuông góc với trục đường kính, biến $x$ chạy từ $-3$ đến $3$.
      Tại mỗi vị trí $x \in [-3; 3]$, thiết diện thu được là một tam giác đều có cạnh là $s(x) = 2 sqrt(9 - x^2)$ (dm).
      Diện tích của tam giác đều cạnh $s(x)$ là:
      $
        S(x) = (sqrt(3)) / 4 \cdot [s(x)]^2 = (sqrt(3)) / 4 \cdot 4(9 - x^2) = sqrt(3)(9 - x^2) " (dm"^2")".
      $

      Thể tích của vật thể là:
      $
        V = integral_(-3)^3 S(x) dif x = integral_(-3)^3 sqrt(3)(9 - x^2) dif x
        = 2 sqrt(3) integral_0^3 (9 - x^2) dif x.
      $
      Tính tích phân:
      $
        integral_0^3 (9 - x^2) dif x = lr((9x - x^3/3) |)_0^3 = (27 - 9) - 0 = 18.
      $
      Do đó, thể tích vật thể là:
      $
        V = 2 sqrt(3) \cdot 18 = 36 sqrt(3) approx 62,35 " (dm"^3")".
      $
      Làm tròn đến hàng đơn vị, thể tích vật thể là *$62$* $d m^3$.
    ],
  )

  #tln(
    [Một khách hàng vay ngân hàng $100$ triệu đồng để tiêu dùng với lãi suất cố định $0,8\%$ mỗi tháng. Phương thức trả nợ là: Cứ sau đúng mỗi tháng kể từ ngày vay, khách hàng trả đều đặn cho ngân hàng cùng một số tiền là $m$ triệu đồng. Biết rằng sau đúng $2$ năm (24 tháng) kể từ ngày vay thì khách hàng đó trả hết nợ. Hãy tính số tiền trả hàng tháng $m$ (làm tròn kết quả đến hàng phần trăm, đơn vị: triệu đồng).],
    [4,60],
    loigiai: [
      #ppgiai[
        - Thiết lập công thức số dư nợ sau mỗi tháng.
        - Tìm biểu thức số tiền $m$ phải trả hàng tháng để dư nợ bằng 0 sau 24 tháng.
      ]

      Gọi $A = 100$ (triệu đồng) là số tiền vay ban đầu.
      $r = 0,8\% = 0,008$ là lãi suất hàng tháng.
      $n = 24$ (tháng) là thời gian trả nợ.
      Gọi $A_k$ là số dư nợ sau tháng thứ $k$:
      - Sau tháng 1: $A_1 = A(1 + r) - m$.
      - Sau tháng 2: $A_2 = A_1(1 + r) - m = A(1 + r)^2 - m(1 + r) - m$.
      - Bằng phương pháp quy nạp, sau tháng thứ $n$:
      $
        A_n = A(1 + r)^n - m \cdot ( (1 + r)^n - 1 ) / r.
      $
      Để khách hàng trả hết nợ sau $n = 24$ tháng, ta phải có $A_(24) = 0$:
      $
        m = (A \cdot r \cdot (1 + r)^(24)) / ( (1 + r)^(24) - 1 ).
      $

      Thay các số liệu vào công thức:
      $
        m = (100 \cdot 0,008 \cdot (1,008)^(24)) / ( (1,008)^(24) - 1 )
        = (0,8 \cdot 1,210743) / (1,210743 - 1)
        = (0,968594) / (0,210743) approx 4,596...
      $
      Làm tròn kết quả đến hàng phần trăm, số tiền trả hàng tháng là *$4,60$* triệu đồng.
    ],
  )

  #tln(
    [Có bao nhiêu giá trị nguyên của tham số thực $m$ để hàm số $y = (x^2 + m x - 1) / (x - m)$ đồng biến trên từng khoảng xác định của nó?],
    [1],
    loigiai: [
      #ppgiai[
        - Tìm tập xác định và tính đạo hàm của hàm số.
        - Hàm số đồng biến trên từng khoảng xác định khi và chỉ khi đạo hàm không âm trên tập xác định và chỉ bằng 0 tại hữu hạn điểm.
      ]

      Tập xác định của hàm số: $D = RR setminus {m}$.
      Đạo hàm của hàm số:
      $
        y' = ( (2x + m)(x - m) - (x^2 + m x - 1) \cdot 1 ) / (x - m)^2
        = ( 2x^2 - m x - m^2 - x^2 - m x + 1 ) / (x - m)^2
      $
      $
        = ( x^2 - 2m x - m^2 + 1 ) / (x - m)^2.
      $

      Để hàm số đồng biến trên từng khoảng xác định của nó, điều kiện cần và đủ là:
      $
        y' >= 0, quad forall x != m
        <=> x^2 - 2m x - m^2 + 1 >= 0, quad forall x != m.
      $
      Vì đây là tam thức bậc hai có hệ số của $x^2$ là $1 > 0$ nên nó luôn không âm với mọi $x$ (kể cả $x = m$) khi và chỉ khi biệt thức thu gọn:
      $
        Delta' <= 0 <=> (-m)^2 - 1 \cdot (-m^2 + 1) <= 0
      $
      $
        <=> m^2 + m^2 - 1 <= 0 <=> 2m^2 - 1 <= 0 <=> m^2 <= 1/2 <=> - (sqrt(2)) / 2 <= m <= (sqrt(2)) / 2.
      $
      Vì $m$ là số nguyên nên $m$ chỉ có thể nhận giá trị $m = 0$ (do $-0,707 <= m <= 0,707$).
      Vậy có duy nhất *$1$* giá trị nguyên của tham số $m$ (đó là $m = 0$).
    ],
  )

]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}

