#import "sang-exam.typ": *
#import "@preview/cetz:0.5.0"
#import "@preview/cetz-plot:0.1.1"
#import "bbt.typ": *
#import "math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue

// Standalone: math đen; beamer: màu toán do sang-beamer-theme tự xử lý
#show math.equation: set text(fill: black)
// Standalone: hàm câu hỏi từ sang-exam (beamer dùng hàm được truyền vào)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "THPT NGUYỄN HỮU CẢNH ",
  school: "ĐỀ THI THỬ LẦN 1 - 12C1",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "357",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

// ═══════════════════════════════════════════════════════════════════
// make-questions — exportable cho Beamer.typ, không cần --input beamer=1
// • Beamer.typ:  #import "...": make-questions; gọi với hàm beamer
// • Standalone:  gọi tự động ở cuối file này với tn-s, ds-s, ...
// ═══════════════════════════════════════════════════════════════════
#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [
  // ═══════════════════════════════════════════════════════════
  // PHẦN I — Trắc nghiệm nhiều phương án lựa chọn
  // ═══════════════════════════════════════════════════════════
  #exam-part(
    [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.],
    count: 12,
  )

  #tn(
    [Cho hàm số $f(x) = (2x + 1)/(x^2 + x + 1)$. Họ nguyên hàm của $f(x)$ là],
    (
      [$1/2 ln(x^2 + x + 1) + C$.],
      [$ln(x^2 + x) + C$.],
      True([$ln(x^2 + x + 1) + C$.]),
      [$2ln(x^2 + x + 1) + C$.],
    ),
    loigiai: [
      #ppgiai[
        Đặt $u = x^2 + x + 1$ thì $dif u = (2x + 1) dif x$.
      ]

      Khi đó:
      $
        integral (2x + 1)/(x^2 + x + 1) dif x
        = integral 1/u dif u
        = ln|u| + C.
      $
      Vì $x^2 + x + 1 > 0$ với mọi $x$, suy ra:
      $
        integral (2x + 1)/(x^2 + x + 1) dif x = ln(x^2 + x + 1) + C.
      $
      Vậy chọn đáp án *C*.
    ],
  )

  #tn(
    [Một lớp học thống kê thời gian tự học mỗi ngày của học sinh trong bảng sau:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [Thời gian
            (phút)],
          [$[10;20)$],
          [$[20;30)$],
          [$[30;40)$],
          [$[40;50)$],
          [$[50;60)$],

          [Số học sinh], [4], [7], [12], [6], [1],
        )
      ]
      Trung vị của mẫu số liệu ghép nhóm trên gần nhất với giá trị nào sau đây?],
    (
      [$31,7$ phút.],
      True([$33,3$ phút.]),
      [$34,8$ phút.],
      [$36,2$ phút.],
    ),
    loigiai: [
      #ppgiai[
        Tổng số quan sát là $n = 30$, nên vị trí trung vị là $n/2 = 15$.
        Bảng tần số tích lũy cho thấy lớp chứa trung vị là lớp $[30;40)$.
      ]

      Ta có:
      - Cận dưới của lớp trung vị: $L = 30$.
      - Tần số tích lũy trước lớp trung vị: $F = 11$.
      - Tần số lớp trung vị: $f = 12$.
      - Độ rộng lớp: $h = 10$.

      Do đó:
      $
        M_e = L + (n/2 - F)/f dot h = 30 + (15 - 11)/12 dot 10 = 100/3.
      $
      Suy ra trung vị xấp xỉ $33,3$ phút.
      Vậy chọn đáp án *B*.
    ],
  )

  #tn(
    [Trong không gian $O x y z$, cho hai điểm $A(1; -2; 3)$ và $B(7; 1; -6)$. Điểm $M$ thuộc đoạn $A B$ sao cho $A M = 2M B$. Tọa độ điểm $M$ là],
    (
      [$(3; -1; 0)$.],
      [$(4; 0; -2)$.],
      True([$(5; 0; -3)$.]),
      [$(6; 1; -4)$.],
    ),
    loigiai: [
      #ppgiai[
        Vì $M$ nằm trên đoạn $A B$ và $A M : M B = 2 : 1$, nên ta áp dụng công thức chia đoạn trong.
      ]

      Ta có:
      $
        M = ((1 + 2 dot 7)/3; (-2 + 2 dot 1)/3; (3 + 2 dot (-6))/3).
      $
      Suy ra:
      $
        M = (5; 0; -3).
      $
      Vậy chọn đáp án *C*.
    ],
  )

  #tn(
    [Đồ thị hàm số $y = (2x^2 - 3x + 4)/(x + 2)$ có đường tiệm cận xiên là],
    (
      [$y = 2x + 1$.],
      [$y = 2x - 5$.],
      True([$y = 2x - 7$.]),
      [$y = x - 7$.],
    ),
    loigiai: [
      #ppgiai[
        Với phân thức hữu tỉ có bậc tử lớn hơn bậc mẫu đúng $1$, ta chia đa thức tử cho đa thức mẫu để tìm tiệm cận xiên.
      ]

      Thực hiện phép chia, ta được:
      $
        (2x^2 - 3x + 4)/(x + 2) = 2x - 7 + 18/(x + 2).
      $
      Khi $x -> plus.minus infinity$, ta có $18/(x + 2) -> 0$.
      Do đó đồ thị hàm số có tiệm cận xiên là:
      $
        y = 2x - 7.
      $
      Vậy chọn đáp án *C*.
    ],
  )

  #tn(
    [Cho hình chóp $S.A B C D$ có đáy $(A B C D)$ là hình chữ nhật và $S A perp (A B C D)$. Khẳng định nào sau đây là sai?],
    (
      [$S A perp B D$.],
      [$B C perp (S A B)$.],
      [$(S A D) perp (A B C D)$.],
      True([$(S B C) perp (A B C D)$.]),
    ),
    loigiai: [
      #ppgiai[
        Do $S A perp (A B C D)$ nên $S A$ vuông góc với mọi đường thẳng nằm trong đáy.
        Đồng thời, nếu một đường thẳng vuông góc với hai đường cắt nhau trong một mặt phẳng thì nó vuông góc với mặt phẳng đó.
      ]

      - Mệnh đề A đúng vì $B D$ nằm trong đáy nên $S A perp B D$.
      - Mệnh đề B đúng vì $B C perp A B$ và $B C perp S A$. Hai đường $A B$ và $S A$ cắt nhau trong mặt phẳng $(S A B)$ nên $B C perp (S A B)$.
      - Mệnh đề C đúng vì mặt phẳng $(S A D)$ chứa đường thẳng $S A perp (A B C D)$ nên $(S A D) perp (A B C D)$.
      - Mệnh đề D sai vì mặt phẳng $(S B C)$ không nhất thiết chứa một đường thẳng vuông góc với đáy.

      Vậy chọn đáp án *D*.
    ],
  )

  #tn(
    [Giá trị của tích phân $I = integral_0^2 |x^2 - 2x| dif x$ là],
    (
      [$1$.],
      [$2/3$.],
      True([$4/3$.]),
      [$5/3$.],
    ),
    loigiai: [
      #ppgiai[
        Trên đoạn $[0;2]$, ta có $x(x-2) <= 0$, nên $|x^2 - 2x| = 2x - x^2$.
      ]

      Do đó:
      $
        I = integral_0^2 (2x - x^2) dif x = (x^2 - x^3/3)|_0^2 = 4 - 8/3 = 4/3.
      $
      Vậy chọn đáp án *C*.
    ],
  )

  #tn(
    [Trong không gian với hệ tọa độ $O x y z$, mặt phẳng $(P)$ chứa trục $O x$ và vuông góc với mặt phẳng $(alpha): x - 2y + 2z + 3 = 0$ có phương trình là],
    (
      True([$y + z = 0$.]),
      [$y - z = 0$.],
      [$x + y + z = 0$.],
      [$2y + z = 0$.],
    ),
    loigiai: [
      #ppgiai[
        Mặt phẳng $(P)$ chứa trục $O x$ nên có một vectơ chỉ phương là $(1;0;0)$.
        Vì $(P) perp (alpha)$ nên một vectơ pháp tuyến của $(alpha)$ cũng là một vectơ chỉ phương của $(P)$.
      ]

      Mặt phẳng $(alpha)$ có vectơ pháp tuyến:
      $
        (1; -2; 2).
      $
      Một vectơ pháp tuyến của $(P)$ vuông góc với cả $(1;0;0)$ và $(1;-2;2)$, nên ta có thể chọn:
      $
        (0; 1; 1).
      $
      Vì $(P)$ chứa trục $O x$ nên đi qua gốc tọa độ $O(0;0;0)$.
      Suy ra phương trình của $(P)$ là:
      $
        y + z = 0.
      $
      Vậy chọn đáp án *A*.
    ],
  )

  #tn(
    [Trong không gian với hệ tọa độ $O x y z$, cho mặt phẳng $(P): x - 2y + 2z - 3 = 0$. Đường thẳng nào dưới đây song song với mặt phẳng $(P)$?],
    (
      [$(x - 1)/1 = (y + 2)/1 = (z - 3)/1$.],
      [$(x + 1)/1 = (y - 2)/2 = (z + 1)/1$.],
      [$(x - 2)/1 = (y + 1)/1 = (z - 4)/(-1)$.],
      True([$(x + 1)/2 = y/2 = z$.]),
    ),
    loigiai: [
      #ppgiai[
        Một đường thẳng song song với mặt phẳng khi vectơ chỉ phương của nó vuông góc với vectơ pháp tuyến của mặt phẳng và đường thẳng đó không nằm trong mặt phẳng.
      ]

      Mặt phẳng $(P)$ có vectơ pháp tuyến:
      $
        (1; -2; 2).
      $
      Với đáp án D, vectơ chỉ phương là:
      $
        (2; 2; 1).
      $
      Ta có:
      $
        2 - 4 + 2 = 0.
      $
      Điểm $M(-1; 0; 0)$ thuộc đường thẳng D và:
      $
        -1 - 2 dot 0 + 2 dot 0 - 3 = -4 != 0.
      $
      Vậy đường thẳng D song song với mặt phẳng $(P)$.
      Chọn đáp án *D*.
    ],
  )

  #tn(
    [Cho cấp số nhân $(u_n)$ có các số hạng dương, biết $u_2 = 6$ và $u_5 = 48$. Tổng $S_6 = u_1 + u_2 + ... + u_6$ bằng],
    (
      [$96$.],
      [$126$.],
      True([$189$.]),
      [$192$.],
    ),
    loigiai: [
      #ppgiai[
        Với cấp số nhân, ta có $u_n = u_1 q^(n-1)$.
        Từ $u_2$ và $u_5$ ta tìm công bội $q$, sau đó tính $u_1$ và dùng công thức tổng.
      ]

      Ta có:
      $
        u_2 = u_1 q = 6,
        quad u_5 = u_1 q^4 = 48.
      $
      Suy ra:
      $
        q^3 = u_5/u_2 = 48/6 = 8 => q = 2.
      $
      Khi đó:
      $
        u_1 = 6/2 = 3.
      $
      Tổng sáu số hạng đầu là:
      $
        S_6 = u_1 (q^6 - 1)/(q - 1) = 3(2^6 - 1) = 3 dot 63 = 189.
      $
      Vậy chọn đáp án *C*.
    ],
  )

  #tn(
    [Tập nghiệm của phương trình $2sin x = sqrt(3)$ là],
    (
      [$S = {pi/3 + k pi, k in ZZ}$.],
      [$S = {2pi/3 + k pi, k in ZZ}$.],
      True([$S = {pi/3 + k 2pi; 2pi/3 + k 2pi, k in ZZ}$.]),
      [$S = {pi/6 + k 2pi; 5pi/6 + k 2pi, k in ZZ}$.],
    ),
    loigiai: [
      #ppgiai[
        Từ phương trình đã cho, ta đưa về dạng cơ bản $sin x = sqrt(3)/2$.
        Trên đường tròn lượng giác, giá trị này đạt được tại hai góc thuộc góc phần tư I và II.
      ]

      Ta có:
      $
        2sin x = sqrt(3) <=> sin x = sqrt(3)/2.
      $
      Suy ra:
      $
        x = pi/3 + k 2pi
        quad or quad
        x = 2pi/3 + k 2pi,
        quad k in ZZ.
      $
      Vậy chọn đáp án *C*.
    ],
  )

  #tn(
    [Đường cong trong hình bên là đồ thị của hàm số nào dưới đây?],
    (
      True([$y = x^3 - 3x + 1$.]),
      [$y = -x^3 + 3x + 1$.],
      [$y = x^3 - 3x^2 + 1$.],
      [$y = -x^3 + 3x^2 + 1$.],
    ),
    fig: cetz.canvas(length: 0.7cm, {
      import cetz.draw: *

      line((-2.5, 0), (2.5, 0), mark: (end: ">"))
      content((2.5, 0.35), $x$)
      line((0, -2), (0, 3.5), mark: (end: ">"))
      content((0.3, 3.5), $y$)
      content((-0.25, -0.25), $O$)

      line((-1, 0.1), (-1, -0.1))
      content((-1, -0.4), $-1$)
      line((1, 0.1), (1, -0.1))
      content((1, -0.4), $1$)
      line((2, 0.1), (2, -0.1))
      content((2, -0.4), $2$)

      line((0.1, 1), (-0.1, 1))
      content((-0.35, 1), $1$)
      line((0.1, 3), (-0.1, 3))
      content((-0.35, 3), $3$)
      line((0.1, -1), (-0.1, -1))
      content((-0.4, -1), $-1$)

      let pts = ()
      for i in range(-40, 41) {
        let x = i / 20.0
        let y = x * x * x - 3 * x + 1
        pts.push((x, y))
      }
      line(..pts, stroke: 1pt + blue)
    }),
    fig-pos: "right",
    fig-width: 35%,
    loigiai: [
      #ppgiai[
        Từ đồ thị ta nhận thấy:
        - Đồ thị cắt trục tung tại điểm có tung độ bằng $1$.
        - Đồ thị có cực đại tại gần điểm $(-1; 3)$ và cực tiểu tại gần điểm $(1; -1)$.
      ]

      Thử với phương án A:
      $
        f(0) = 1,
        quad f(-1) = -1 + 3 + 1 = 3,
        quad f(1) = 1 - 3 + 1 = -1.
      $
      Các đặc điểm này hoàn toàn phù hợp với hình vẽ.
      Vậy đồ thị đã cho là của hàm số:
      $
        y = x^3 - 3x + 1.
      $
      Chọn đáp án *A*.
    ],
  )

  #tn(
    [Tập nghiệm của bất phương trình $log_2(x - 1) + log_2(x + 3) <= 3$ là],
    (
      [$(1; +infinity)$.],
      True([$(1; -1 + 2sqrt(3)]$.]),
      [$[-1 - 2sqrt(3); -1 + 2sqrt(3)]$.],
      [$(1; 3]$.],
    ),
    loigiai: [
      #ppgiai[
        Trước hết cần tìm điều kiện xác định của biểu thức lôgarit.
        Sau đó gộp hai lôgarit cùng cơ số rồi đưa về bất phương trình đại số quen thuộc.
      ]

      Điều kiện xác định:
      $
        x - 1 > 0 and x + 3 > 0 => x > 1.
      $
      Ta có:
      $
        log_2(x - 1) + log_2(x + 3) <= 3
        <=> log_2((x - 1)(x + 3)) <= 3
        <=> (x - 1)(x + 3) <= 8.
      $
      Suy ra:
      $
        x^2 + 2x - 11 <= 0.
      $
      Phương trình bậc hai tương ứng có hai nghiệm:
      $
        x = -1 plus.minus 2sqrt(3).
      $
      Do đó:
      $
        -1 - 2sqrt(3) <= x <= -1 + 2sqrt(3).
      $
      Kết hợp với điều kiện $x > 1$, ta được:
      $
        1 < x <= -1 + 2sqrt(3).
      $
      Vậy chọn đáp án *B*.
    ],
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN II — Trắc nghiệm đúng/sai
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: auto)

  #ds(
    [Trong không gian với hệ tọa độ $O x y z$, cho mặt cầu $(S)$ có tâm $I(2; -1; 4)$ và đi qua điểm $A(5; 3; 4)$. Xét mặt phẳng $(P): x + 2y + 2z - 9 = 0$. Xét tính đúng sai của các mệnh đề sau.],
    (
      True([Bán kính của mặt cầu $(S)$ bằng $5$.]),
      [Mặt phẳng $(P)$ tiếp xúc với mặt cầu $(S)$.],
      True([Gốc tọa độ $O$ nằm trong khối cầu $(S)$.]),
      True([Nếu $(P)$ cắt $(S)$ theo đường tròn $(C)$ thì bán kính của $(C)$ bằng $4sqrt(14)/3$.]),
    ),
    loigiai: [
      #ppgiai[
        Ta khai thác ba công thức cơ bản:
        - Bán kính mặt cầu bằng khoảng cách từ tâm tới một điểm thuộc mặt cầu.
        - Khoảng cách từ tâm tới mặt phẳng quyết định vị trí tương đối giữa mặt cầu và mặt phẳng.
        - Bán kính thiết diện tròn được tính bởi định lý Pythagore trong tam giác vuông nối tâm mặt cầu với tâm thiết diện.
      ]

      Ta có:
      $
        I A = sqrt((5 - 2)^2 + (3 - (-1))^2 + (4 - 4)^2) = sqrt(9 + 16) = 5.
      $
      Vậy bán kính của mặt cầu bằng $5$, nên mệnh đề a đúng.

      Khoảng cách từ $I$ đến mặt phẳng $(P)$ là:
      $
        d(I, (P)) = |2 + 2(-1) + 2 dot 4 - 9|/sqrt(1 + 4 + 4) = 1/3.
      $
      Do $1/3 < 5$ nên $(P)$ không tiếp xúc với $(S)$, mà cắt $(S)$ theo một đường tròn. Mệnh đề b sai.

      Mặt khác:
      $
        O I = sqrt(2^2 + (-1)^2 + 4^2) = sqrt(21).
      $
      Vì $sqrt(21) < 5$ nên $O$ nằm trong khối cầu $(S)$, do đó mệnh đề c đúng.

      Bán kính thiết diện là:
      $
        r = sqrt(25 - 1/9) = sqrt(224/9) = 4sqrt(14)/3.
      $
      Vậy mệnh đề d đúng.

      #luuy[Điểm $A(5;3;4)$ được chọn để bán kính mặt cầu ra đúng bằng $5$, nhưng các ý còn lại vẫn đòi hỏi phải xử lý đầy đủ quan hệ giữa mặt phẳng và mặt cầu.]
    ],
  )

  #ds(
    [Một nhà máy có $3$ phân xưởng cùng sản xuất một loại linh kiện. Phân xưởng I chiếm $50%$ tổng sản lượng, phân xưởng II chiếm $30%$, số còn lại do phân xưởng III sản xuất. Theo thống kê từ bộ phận KCS, tỉ lệ phế phẩm của phân xưởng I là $2%$, của phân xưởng III là $3%$. Biết tỉ lệ phế phẩm chung của toàn nhà máy là $3,1%$. Chọn ngẫu nhiên một linh kiện do nhà máy sản xuất.],
    (
      True([Xác suất để chọn được linh kiện do phân xưởng I sản xuất là $50%$.]),
      [Xác suất để linh kiện là phế phẩm, nếu đã biết nó do phân xưởng I sản xuất, là $1/25$.],
      True([Nếu chọn được linh kiện của phân xưởng II thì tỉ lệ là phế phẩm của nó là $5%$.]),
      [Xác suất để linh kiện do phân xưởng II sản xuất, nếu biết nó là phế phẩm, là $1/2$.],
    ),
    // fig: cetz.canvas(length: 1.4cm, {
    //   import cetz.draw: *

    //   // Nút gốc
    //   content((0, 0), [Linh kiện \ (Nhà máy)], name: "root", frame: "rect", padding: 5pt, fill: rgb("e3f2fd"), stroke: 0.5pt + rgb("1e88e5"), radius: 3pt)

    //   // Cấu hình style chung
    //   let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt, radius: 2pt)
    //   let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
    //   let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)

    //   // Tầng 1: Nguồn gốc sản xuất
    //   content((3.5, 2.5), ["Phân xưởng I" \ ($A$)], name: "A", ..style1)
    //   content((3.5, 0), ["Phân xưởng II" \ ($B$)], name: "B", ..style1)
    //   content((3.5, -2.5), ["Phân xưởng III" \ ($C$)], name: "C", ..style1)

    //   line("root", "A", mark: (end: ">", fill: black)); content((1.75, 1.55), text(size: 9pt)[$0,50$], ..lbl-style)
    //   line("root", "B", mark: (end: ">", fill: black)); content((1.75, 0), text(size: 9pt)[$0,30$], ..lbl-style)
    //   line("root", "C", mark: (end: ">", fill: black)); content((1.75, -1.55), text(size: 9pt)[$0,20$], ..lbl-style)

    //   // Tầng 2: Phân loại chất lượng
    //   content((7.5, 3.2), [Phế phẩm ($D$)], name: "AD", ..style2)
    //   content((7.5, 1.8), [Chuẩn ($overline(D)$)], name: "AnD", ..style2)
    //   line("A", "AD", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,02$], ..lbl-style)
    //   line("A", "AnD", mark: (end: ">", fill: black)); content((5.5, 1.9), text(size: 9pt)[$0,98$], ..lbl-style)

    //   content((7.5, 0.7), [Phế phẩm ($D$)], name: "BD", ..style2, stroke: rgb("d32f2f"), fill: rgb("ffebee"))
    //   content((7.5, -0.7), [Chuẩn ($overline(D)$)], name: "BnD", ..style2)
    //   line("B", "BD", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 0.6), text(fill: red, size: 9pt)[$x$], ..lbl-style)
    //   line("B", "BnD", mark: (end: ">", fill: black)); content((5.5, -0.6), text(size: 9pt)[$1-x$], ..lbl-style)

    //   content((7.5, -1.8), [Phế phẩm ($D$)], name: "CD", ..style2)
    //   content((7.5, -3.2), [Chuẩn ($overline(D)$)], name: "CnD", ..style2)
    //   line("C", "CD", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,03$], ..lbl-style)
    //   line("C", "CnD", mark: (end: ">", fill: black)); content((5.5, -3.1), text(size: 9pt)[$0,97$], ..lbl-style)
    // }),
    // fig-pos: "center",
    // fig-width: 90%,
    loigiai: [
      #ppgiai[
        - Bài toán yêu cầu tính xác suất có điều kiện thuận và ngược. Ta sử dụng hệ biến cố đầy đủ.
        - Gọi $A, B, C$ lần lượt là các biến cố linh kiện do phân xưởng I, II, III sản xuất.
        - Gọi $D$ là biến cố linh kiện "là phế phẩm".
        - *Công thức xác suất đầy đủ:* $P(D) = P(A)P(D|A) + P(B)P(D|B) + P(C)P(D|C)$.
        - *Công thức Bayes:* $P(B|D) = (P(B)P(D|B))/(P(D))$.
      ]
      #align(center)[
        #cetz.canvas(length: 1.4cm, {
          import cetz.draw: *

          let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt, radius: 2pt)
          let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
          let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)

          content(
            (0, 0),
            [Linh kiện],
            name: "root",
            frame: "rect",
            padding: 5pt,
            fill: rgb("e3f2fd"),
            stroke: 0.5pt + rgb("1e88e5"),
            radius: 3pt,
          )

          content((3.5, 2.5), ["PX I" ($A$)], name: "A", ..style1)
          content((3.5, 0), ["PX II" ($B$)], name: "B", ..style1)
          content((3.5, -2.5), ["PX III" ($C$)], name: "C", ..style1)

          line("root", "A", mark: (end: ">", fill: black))
          content((1.75, 1.55), text(size: 9pt)[$0,50$], ..lbl-style)
          line("root", "B", mark: (end: ">", fill: black))
          content((1.75, 0), text(size: 9pt)[$0,30$], ..lbl-style)
          line("root", "C", mark: (end: ">", fill: black))
          content((1.75, -1.55), text(size: 9pt)[$0,20$], ..lbl-style)

          content((7.5, 3.2), [Phế phẩm ($D$)], name: "AD", ..style2)
          content((7.5, 1.8), [Chuẩn ($overline(D)$)], name: "AnD", ..style2)
          line("A", "AD", mark: (end: ">", fill: black))
          content((5.5, 3.1), text(size: 9pt)[$0,02$], ..lbl-style)
          line("A", "AnD", mark: (end: ">", fill: black))
          content((5.5, 1.9), text(size: 9pt)[$0,98$], ..lbl-style)

          content((7.5, 0.7), [Phế phẩm ($D$)], name: "BD", ..style2, stroke: rgb("d32f2f"), fill: rgb("ffebee"))
          content((7.5, -0.7), [Chuẩn ($overline(D)$)], name: "BnD", ..style2)
          line("B", "BD", mark: (end: ">", fill: red), stroke: rgb("d32f2f"))
          content((5.5, 0.6), text(fill: red, size: 9pt)[$0,05$], ..lbl-style)
          line("B", "BnD", mark: (end: ">", fill: black))
          content((5.5, -0.6), text(size: 9pt)[$0,95$], ..lbl-style)

          content((7.5, -1.8), [Phế phẩm ($D$)], name: "CD", ..style2)
          content((7.5, -3.2), [Chuẩn ($overline(D)$)], name: "CnD", ..style2)
          line("C", "CD", mark: (end: ">", fill: black))
          content((5.5, -1.9), text(size: 9pt)[$0,03$], ..lbl-style)
          line("C", "CnD", mark: (end: ">", fill: black))
          content((5.5, -3.1), text(size: 9pt)[$0,97$], ..lbl-style)
        })
      ]

      *Bước 1: Tính các xác suất ban đầu*
      - $P(A) = 50% = 0,50$; $P(B) = 30% = 0,30$.
      - Do hệ ${A, B, C}$ là hệ đầy đủ nên $P(C) = 1 - (P(A) + P(B)) = 1 - 0,80 = 0,20$.
      - Dữ kiện bài cho: $P(D|A) = 0,02$; $P(D|C) = 0,03$; $P(D) = 0,031$.

      *Bước 2: Xét tính đúng sai của từng mệnh đề*
      - *a)* Xác suất chọn được linh kiện của phân xưởng I là $P(A) = 0,50 = 50%$. $=>$ *Đúng*.
      - *b)* Xác suất linh kiện là phế phẩm khi biết nó do PX I sản xuất là $P(D|A) = 0,02 = 1/50$.
        Mà $1/50 != 1/25$. $=>$ *Sai*.
      - *c)* Áp dụng công thức xác suất đầy đủ:
        $ 0,031 = 0,50 dot 0,02 + 0,30 dot P(D|B) + 0,20 dot 0,03 $
        $ <=> 0,031 = 0,010 + 0,30 dot P(D|B) + 0,006 $
        $ <=> 0,015 = 0,30 dot P(D|B) <=> P(D|B) = (0,015)/(0,30) = 0,05 = 5%. $
        $=>$ *Đúng*.
      - *d)* Áp dụng công thức Bayes để tính xác suất linh kiện do PX II sản xuất khi biết nó là phế phẩm:
        $ P(B|D) = (P(B) dot P(D|B))/(P(D)) = (0,30 dot 0,05)/(0,031) = (0,015)/(0,031) = 15/31 approx 48,39%. $
        Mà $15/31 != 1/2$. $=>$ *Sai*.

      #align(center)[
        #cetz.canvas(length: 1.2cm, {
          import cetz.draw: *
          // Minh họa tư duy Bayes
          rect((0, 0), (8, 2.5), stroke: 0.5pt, radius: 3pt)
          content((4, 2), text(fill: rgb("d32f2f"))[*Tỉ trọng đóng góp vào $P(D) = 0,031$*])
          line((0, 1.5), (8, 1.5), stroke: 0.5pt)

          content((1.3, 0.75), text(size: 9pt)[$P(A)P(D|A)$\ $0,010$])
          line((2.6, 0), (2.6, 1.5), stroke: (dash: "dashed"))

          content((4.5, 0.75), text(fill: rgb("1e88e5"), size: 9pt)[$P(B)P(D|B)$\ $0,015$])
          line((6.4, 0), (6.4, 1.5), stroke: (dash: "dashed"))

          content((7.2, 0.75), text(size: 9pt)[$P(C)P(D|C)$\ $0,006$])
        })
      ]

      #meo[Bài toán Bayes thường xuyên xuất hiện dạng "Tìm thông số kỹ thuật của 1 máy/xưởng dựa vào thông số tổng". Lúc này ta dùng công thức xác suất đầy đủ làm phương trình bậc nhất để tìm $x$.]
    ],
  )



  // #ds(
  //   [Một chất điểm chuyển động dọc theo trục $O x$. Tọa độ của chất điểm tại thời điểm $t$ (giây) được cho bởi $x(t) = 5t^3 e^(-t)$ với $t >= 0$. Xét tính đúng sai của các mệnh đề sau.],
  //   (
  //     [Vận tốc xuất phát của chất điểm bằng $5$ m/s.],
  //     True([Chất điểm chỉ đổi chiều chuyển động đúng một lần, tại thời điểm $t = 3$.]),
  //     True([Khoảng cách xa nhất của chất điểm tới gốc tọa độ bằng $135e^(-3)$ m.]),
  //     [Tổng quãng đường chất điểm đi được bằng $135e^(-3)$ m.],
  //   ),
  //   loigiai: [
  //     #ppgiai[
  //       Tính vận tốc bằng đạo hàm $v(t) = x'(t)$, sau đó xét dấu của $v(t)$.
  //       Vì $x(t) >= 0$ với mọi $t >= 0$, khoảng cách đến gốc tọa độ bằng chính $x(t)$.
  //     ]

  //     Ta có:
  //     $
  //       v(t) = x'(t) = 15t^2 e^(-t) - 5t^3 e^(-t) = 5t^2 e^(-t)(3 - t).
  //     $
  //     Suy ra $v(0) = 0$, nên mệnh đề a sai.

  //     Phương trình $v(t) = 0$ cho ta $t = 0$ hoặc $t = 3$.
  //     Trên $(0;3)$, ta có $v(t) > 0$; trên $(3; +infinity)$, ta có $v(t) < 0$.
  //     Vì thế chất điểm chỉ đổi chiều đúng một lần tại $t = 3$. Mệnh đề b đúng.

  //     Khoảng cách lớn nhất đạt được tại $t = 3$:
  //     $
  //       x_(max) = x(3) = 5 dot 27 dot e^(-3) = 135e^(-3).
  //     $
  //     Mệnh đề c đúng.

  //     Từ $t=0$ đến $t=3$, chất điểm đi được $135e^(-3)$ m; từ $t=3$ đến khi $t -> +infinity$, chất điểm quay về gần gốc tọa độ nên đi thêm đúng $135e^(-3)$ m nữa.
  //     Tổng quãng đường là:
  //     $
  //       S = 270e^(-3).
  //     $
  //     Do đó mệnh đề d sai.
  //   ],
  // )


  #ds(
    [Trong không gian $O x y z$ (đơn vị: mét), hình phẳng $(H)$ nằm trong mặt phẳng $(O y z)$, được giới hạn bởi parabol $(P)$ và hai đoạn $C D$, $C' D'$ như hình vẽ. Hình không gian $(K)$ có hai đáy dạng $(H)$ và chiều dài $2$ m. Bể nước hình $(K)$, đáy $A B C D$ kín nằm dưới, miệng $A' B' C' D'$ để hở. Vòi nước lưu lượng không đổi $0","02 space (m^3 \/ "phút")$ chảy vào bể.],
    (
      True([Phương trình parabol $(P)$ là $z = 25/9 y^2 - 0","2$. ]),
      True([Diện tích hình phẳng $(H)$ bằng $0","73 space m^2$ (làm tròn đến hàng phần trăm).]),
      True([Thời gian để nước chảy đầy bể là $72","8$ phút (làm tròn đến hàng phần mười).]),
      True([Sau $60$ phút, chiều cao mực nước so với đáy bằng $0","69$ m (làm tròn đến hàng phần trăm).]),
    ),
    fig: align(center)[
      #cetz.canvas({
        import cetz.draw: *
        let sc = 3.5
        let p(x, y, z) = ((y - 0.5 * x) * sc, (z - 0.35 * x) * sc)
        let y0 = 0.26833
        let hfill = rgb(173, 216, 230, 150)

        // Hình phẳng (H) + đáy ABCD
        let h-pts = ()
        for i in range(-60, 61) {
          let y = i / 100.0
          let z = 25.0 / 9.0 * y * y - 0.2
          if z >= 0 { h-pts.push(p(0, y, z)) }
        }
        h-pts.push(p(0, 0.6, 0.8))
        h-pts.push(p(0, -0.6, 0.8))
        line(..h-pts, close: true, fill: hfill, stroke: none)
        line(p(0, -y0, 0), p(0, y0, 0), p(2, y0, 0), p(2, -y0, 0), close: true, fill: hfill, stroke: none)

        // Parabol đầy mặt sau
        let bp = ()
        for i in range(-70, 71) {
          let y = i / 100.0
          bp.push(p(0, y, 25.0 / 9.0 * y * y - 0.2))
        }
        line(..bp, stroke: 0.5pt)

        // Biên bể — mặt sau
        line(p(0, -0.6, 0.8), p(0, 0.6, 0.8), stroke: 1.2pt + red)
        line(p(0, -y0, 0), p(0, y0, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
        let bl = ()
        let br = ()
        for i in range(-60, 61) {
          let y = i / 100.0
          let z = 25.0 / 9.0 * y * y - 0.2
          if z >= 0 { if y < 0 { bl.push(p(0, y, z)) } else { br.push(p(0, y, z)) } }
        }
        line(..bl, stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
        line(..br, stroke: 1.2pt + red)

        // Sườn giữa
        for xv in (0.5, 1.0, 1.5) {
          let pts = ()
          for i in range(-60, 61) {
            let y = i / 100.0
            let z = 25.0 / 9.0 * y * y - 0.2
            if z >= 0 { pts.push(p(xv, y, z)) }
          }
          line(..pts, stroke: (paint: red.lighten(30%), thickness: 0.8pt, dash: "dotted"))
          line(p(xv, -0.6, 0.8), p(xv, 0.6, 0.8), stroke: (paint: red.lighten(30%), thickness: 0.8pt, dash: "dotted"))
          line(p(xv, -y0, 0), p(xv, y0, 0), stroke: (paint: red.lighten(30%), thickness: 0.8pt, dash: "dotted"))
        }

        // Biên bể — mặt trước
        line(p(2, -0.6, 0.8), p(2, 0.6, 0.8), stroke: 1.2pt + red)
        line(p(2, -y0, 0), p(2, y0, 0), stroke: 1.2pt + red)
        let fl = ()
        let fr = ()
        for i in range(-60, 61) {
          let y = i / 100.0
          let z = 25.0 / 9.0 * y * y - 0.2
          if z >= 0 { if y < -y0 { fl.push(p(2, y, z)) } else if y > y0 { fr.push(p(2, y, z)) } }
        }
        line(..fl, stroke: 1.2pt + red)
        line(..fr, stroke: 1.2pt + red)
        let fd = ()
        for i in range(-27, 28) {
          let y = i / 100.0
          fd.push(p(2, y, 25.0 / 9.0 * y * y - 0.2))
        }
        line(..fd, stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))

        // Đường sinh
        line(p(0, -0.6, 0.8), p(2, -0.6, 0.8), stroke: 1.2pt + red)
        line(p(0, 0.6, 0.8), p(2, 0.6, 0.8), stroke: 1.2pt + red)
        line(p(0, -y0, 0), p(2, -y0, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
        line(p(0, y0, 0), p(2, y0, 0), stroke: 1.2pt + red)

        // Nhãn
        content(p(0, -0.6, 0.9), $D'$)
        content(p(0, 0.6, 0.9), $C'$)
        content(p(0, 0.05, -0.1), $O$)
        content(p(0, 0.35, 0.1), $C$)
        content(p(2, -0.65, 0.8), $A'$)
        content(p(2, 0.6, 0.85), $B'$)
        content(p(2, -0.35, -0.1), $A$)
        content(p(2, 0.35, -0.1), $B$)

        // Kích thước
        line(p(0, -0.6, 1.05), p(0, 0.6, 1.05), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content(p(0, 0.2, 1.15), $1","2$)
        line(p(0, 0.9, 0), p(0, 0.9, 0.8), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content(p(0, 1.05, 0.4), $0","8$)
        line(p(-1, -0.5, -0.35), p(1, -0.5, -0.35), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content(p(1, -0.4, -0.45), $2$)
        // content(p(0, 0, -0.28), $-0","2$)
line(p(0, 0.9, 0), p(0, 0.9, -0.2), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content(p(0, 1.05, -0.1), $0","2$)
        // Chú thích
        content(p(0, 0.3, 0.4), $(H)$)
        content(p(0.5, -0.5, 0.55), $(P)$)
        line(p(0.4, -0.5, 0.5), p(0, -0.5, 0.3), mark: (end: ">"), stroke: 0.5pt)
        content(p(1.5, -0.65, 0.7), $(K)$)
        line(p(1.5, -0.55, 0.65), p(1.2, -0.5, 0.5), mark: (end: ">"), stroke: 0.5pt)
      })
    ],
    fig-pos: "center",
    fig-width: 50%,
    loigiai: [
      #step([Lập phương trình parabol $(P)$])
      Parabol có đỉnh $V(0; -0","2)$ trên trục $O z$: dạng $z = a y^2 - 0","2$.
      Điểm $C'(0","6;\ 0","8)$ thuộc $(P)$: $0","8 = a(0","6)^2 - 0","2 => a = 1/(0","36) = 25/9$.
      Vậy $(P): z = (25)/9 y^2 - 0","2$. *Mệnh đề (a) ĐÚNG.*

      #step([Tính diện tích $(H)$])
      Bể giới hạn $z in [0;\ 0","8]$. Từ $(P)$: $y = plus.minus 3/5 sqrt(z+0","2)$, chiều rộng $w(z) = 6/5 sqrt(z+0","2)$.
      $
        S_(H) = integral_0^(0","8) 6/5 sqrt(z+0","2) d z
        = 6/5 dot [2/3 (z+0","2)^(3/2)]_0^(0","8)
        = 4/5 [(1","0)^(3/2) - (0","2)^(3/2)]
        approx 4/5 (1 - 0","0894) approx 0","7284 approx 0","73 space m^2.
      $
      *Mệnh đề (b) ĐÚNG.*

      #step([Thời gian đầy bể])
      $V = S_(H) dot 2 approx 0","7284 dot 2 = 1","4568 space m^3$.
      $t = V / Q = 1","4568 / 0","02 = 72","84 approx 72","8$ phút. *Mệnh đề (c) ĐÚNG.*

      #step([Mực nước sau 60 phút])
      $V_(60) = 60 dot 0","02 = 1","2 space m^3$. Diện tích mặt ngập: $A = V_(60)/2 = 0","6 space m^2$.
      Giải $4/5 [(k+0","2)^(3/2) - (0","2)^(3/2)] = 0","6$:
      $(k+0","2)^(3/2) = 0","75 + 0","0894 = 0","8394$, $k+0","2 = 0","8394^(2/3) approx 0","8899$, $k approx 0","69$ m.
      *Mệnh đề (d) ĐÚNG.*
    ],
  )
  #ds(
    [Doanh thu hằng tháng $R$ của một sản phẩm mới trong một khoảng thời gian dự kiến tuân theo hàm logistic: $R = R(t) = A / (1+55e^(-t)) - B$ (sản phẩm), với $A, B$ là các hệ số thực và $t$ là thời gian được tính bằng tháng. Biết tốc độ bán hàng là đạo hàm theo thời gian $t$ của doanh thu với đơn vị là sản phẩm/ tháng, số lượng sản phẩm bán được tối đa là $5500$ sản phẩm. Trong bài toán kết quả được trả lời làm tròn đến hàng đơn vị. Hỏi trong các mệnh đề dưới đây, mệnh đề nào *đúng*, mệnh đề nào *sai*?],
    (
      True[$B = A / 56$],
      True[$R'(t) > 0$ với mọi $t >= 0$],
      True[Khi doanh thu bằng $500$ thì tốc độ bán hàng bằng $536$ sản phẩm/ $1$ tháng],
      True[Sản phẩm bán chạy nhất ở tháng thứ $4$],
    ),
    loigiai: [
      #step[Kiểm tra mệnh đề a]
      Vì đề bài nhắc đến "sản phẩm mới", nên tại thời điểm bắt đầu ($t=0$), doanh thu sẽ bằng 0.
      Ta thế trực tiếp vào hàm:
      $ R(0) = A / (1+55e^0) - B = A/56 - B = 0 => B = A/56 $
      $=>$ Mệnh đề a *Đúng*.

      #step[Kiểm tra mệnh đề b]
      Dữ kiện "số lượng sản phẩm bán được tối đa là $5500$" đồng nghĩa với việc giới hạn của hàm doanh thu khi thời gian tiến ra vô cực là $5500$.
      $ lim_(t -> +oo) R(t) = A / (1+0) - B = A - B = 5500 $
      Thay $B = A/56$ vừa tìm được vào, ta có:
      $ A - A/56 = 5500 => (55A)/56 = 5500 => A = 5600 $
      Từ đó suy ra $B = 100$. Lúc này, hàm doanh thu hoàn chỉnh là:
      $ R(t) = 5600 / (1+55e^(-t)) - 100 $
      Tốc độ bán hàng là đạo hàm bậc nhất:
      $ R'(t) = (-5600 dot (-55e^(-t))) / (1+55e^(-t))^2 = (308000e^(-t)) / (1+55e^(-t))^2 $
      Vì $e^(-t) > 0$ với mọi $t >= 0$, nên ta luôn có $R'(t) > 0$ với mọi $t >= 0$.
      $=>$ Mệnh đề b *Đúng*.

      #step[Kiểm tra mệnh đề c]
      Đặt $P(t) = R(t) + 100 = 5600 / (1+55e^(-t))$. Phương trình đạo hàm của hàm logistic luôn tuân theo dạng:
      $ P'(t) = P(t) (1 - P(t)/5600) $
      Vì $R'(t) = P'(t)$ và tại thời điểm doanh thu $500$ thì $P(t) = 500 + 100 = 600$, ta thay trực tiếp vào để tìm tốc độ bán:
      $ R'(t) = 600 (1 - 600/5600) = 600 dot 50 / 56 approx 535,71 $
      Làm tròn đến hàng đơn vị theo yêu cầu, ta được $536$ (sản phẩm/tháng).
      $=>$ Mệnh đề c *Đúng*.

      #step[Kiểm tra mệnh đề d]
      Sản phẩm bán chạy nhất khi tốc độ bán hàng $R'(t)$ đạt cực đại.
      Dựa vào phương trình tam thức bậc hai $R'(t) = P(t)(1 - P(t)/5600)$, tốc độ đạt giá trị lớn nhất tại đỉnh parabol, tức là khi:
      $ P(t) = 5600 / 2 = 2800 $
      Giải tìm $t$:
      $ 5600 / (1+55e^(-t)) = 2800 => 1+55e^(-t) = 2 => e^(-t) = 1/55 => t = ln(55) approx 4,007 $
      Làm tròn đến hàng đơn vị, ta được kết quả là tháng thứ $4$.
      $=>$ Mệnh đề d *Đúng*.
    ],
  )


  // ═══════════════════════════════════════════════════════════
  // PHẦN III — Trả lời ngắn
  // ═══════════════════════════════════════════════════════════
  #exam-part(
    [
      #set text(fill: rgb("d32f2f"))
      PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6)
  #resetcau()
  #tln(
    // mode: "loigiai",
    [Cho một hồ nước nhỏ có hai bờ hồ song song cách nhau $20$ m. Ở hai bên bờ hồ có hai chiếc cọc thẳng đứng, hai đỉnh cọc $A$ và $B$ lần lượt có độ cao so với mặt nước hồ là $4$ m và $5$ m, hai điểm $A$ và $B$ cách nhau $30$ m. Một chú chim bói cá đậu tại $A$ và quan sát thấy có một con cá tại điểm $C$ (ở giữa hồ, cách bờ hồ phía chim bói cá $4$ m) đang bơi theo hướng vuông góc với bờ hồ với tốc độ $180 " cm/s"$ sang phía bờ bên kia. Chú chim bói cá này quan sát thấy con cá cách mình $6$ m và chú chim này sẽ bay thẳng với tốc độ $6 " m/s"$ để bắt con cá (coi thời gian bắt cá là $1$ giây) rồi mang theo con cá bay thẳng với tốc độ $5 " m/s"$ lên đỗ ở $B$. Hãy xác định khoảng thời gian tính từ lúc chú chim bói cá bắt đầu rời $A$ và đỗ vào $B$ theo đơn vị giây (làm tròn kết quả đến hàng phần trăm).],
    [$7,29$],
    fig: cetz.canvas(length: 0.9cm, {
      import cetz.draw: *

      // Nền mặt nước (Hồ nước)
      let W_bl = (-4, -2)
      let W_br = (4, -2)
      let W_tr = (6, 1)
      let W_tl = (-2, 1)
      line(W_bl, W_br, W_tr, W_tl, close: true, fill: rgb("b3e5fc"), stroke: 0.5pt + rgb("0288d1"))

      // Kích thước bờ hồ 20m
      line((-4, -2), (4, -2), mark: (start: "<", end: ">"), stroke: 0.6pt)
      content((0, -2), [$20$ m], anchor: "south", padding: 4pt)

      // Chân cọc H và đỉnh A
      let H = (-2, -0.5)
      let A = (-2, 2.5)
      line(H, A, stroke: 1.5pt + rgb("388e3c"))
      circle(H, radius: 1.5pt, fill: black)
      content(H, $H$, anchor: "east", padding: 3pt)
      circle(A, radius: 1.5pt, fill: black)
      content(A, $A$, anchor: "east", padding: 3pt)
      content((-2, 1), [$4$ m], anchor: "east", padding: 3pt)

      // Chân cọc K và đỉnh B
      let K = (4.5, 0.5)
      let B = (4.5, 4)
      line(K, B, stroke: 1.5pt + rgb("388e3c"))
      circle(K, radius: 1.5pt, fill: black)
      content(K, $K$, anchor: "west", padding: 3pt)
      circle(B, radius: 1.5pt, fill: black)
      content(B, $B$, anchor: "west", padding: 3pt)
      content((4.5, 2.25), [$5$ m], anchor: "west", padding: 3pt)

      // Các đường nối nét đứt
      line(H, K, stroke: (dash: "dashed", paint: rgb("455a64")))
      line(A, B, stroke: (dash: "dashed", paint: rgb("455a64")))
      content((1.25, 3.25), [$30$ m], anchor: "south-east", angle: 12deg)

      // Vị trí cá tại C
      let C = (-0.5, -1)
      content(C, text(size: 14pt)[🐟], anchor: "south", padding: 1pt)
      content(C, $C$, anchor: "north", padding: 4pt)

      // Đường nhìn của chim từ A đến C
      content(A, text(size: 14pt)[🦅], anchor: "south", padding: 1pt)
      line(A, C, stroke: (dash: "dashed", paint: rgb("455a64")))
      content((-1.2, 0.6), [$6$ m], angle: -55deg, anchor: "south")

      // Khoảng cách từ C đến bờ (chiếu vuông góc)
      line(C, (-2, -1), stroke: (dash: "dashed", paint: rgb("455a64")))
      content((-1.25, -1), [$4$ m], anchor: "north", padding: 2pt)
    }),
    fig-pos: "center",
    fig-width: 40%,
    loigiai: [
      #ppgiai[
        - Chìa khóa bài toán này là sử dụng phương pháp *tọa độ hóa không gian $O x y z$*.
        - Chọn mặt nước làm mặt phẳng $(O x y)$. Gốc tọa độ $O$ trùng với chân cọc của điểm $A$.
        - Dựa vào khoảng cách để xác định tọa độ các điểm $A, B$ và vị trí ban đầu của cá $C$.
        - Tham số hóa tọa độ của cá theo thời gian $t$. Dựa vào quãng đường bay của chim để lập phương trình tìm thời gian bắt được cá ($t_1$).
        - Tính khoảng cách từ điểm bắt cá $D$ đến $B$ để tìm thời gian bay tiếp ($t_2$).
      ]

      *Bước 1: Tọa độ hóa không gian.*
      Chọn hệ trục $O x y z$ sao cho gốc $O$ trùng với chân cọc $H$ ($O equiv H(0; 0; 0)$).
      - Bờ hồ chứa $A$ là trục $O y$ ($x=0$). Mặt nước là $(O x y)$ ($z=0$).
      - Bờ hồ bên kia song song với $O y$ và cách $20$ m nên nằm trên đường thẳng $x = 20$.
      - Đỉnh cọc $A$ nằm thẳng đứng trên $H$, cao $4$ m $=> A(0; 0; 4)$.
      - Chân cọc thứ hai $K(20; y_K; 0)$, đỉnh cọc $B(20; y_K; 5)$.

      *Bước 2: Tìm tọa độ $B$ và $C$.*
      Khoảng cách $A B = 30$ m:
      $ A B^2 = (20 - 0)^2 + (y_K - 0)^2 + (5 - 4)^2 = 30^2 <=> 400 + y_K^2 + 1 = 900 <=> y_K^2 = 499. $
      Ta chọn chiều dương sao cho $y_K > 0$, suy ra $y_K = sqrt(499)$. Vậy $B(20; sqrt(499); 5)$.

      Con cá ở $C$ cách bờ $O y$ $4$ m nên hoành độ $x_C = 4$. Cá ở mặt nước nên $z_C = 0$. $=> C(4; y_C; 0)$.
      Khoảng cách $A C = 6$ m:
      $ A C^2 = (4 - 0)^2 + (y_C - 0)^2 + (0 - 4)^2 = 6^2 <=> 16 + y_C^2 + 16 = 36 <=> y_C^2 = 4. $
      Ta chọn chiều dương $y_C = 2$. Vậy $C(4; 2; 0)$.

      *Bước 3: Lập phương trình chuyển động để tìm thời gian bắt cá ($t_1$).*
      - Cá bơi vuông góc bờ sang bên kia (hướng theo trục $O x$) với vận tốc $v_c = 180 " cm/s" = 1,8 " m/s"$.
      - Tọa độ cá tại thời điểm $t_1$ giây là $D(4 + 1,8t_1; 2; 0)$.
      - Chim bay thẳng với tốc độ $6 " m/s"$. Khi bắt được cá, quãng đường chim bay là $A D = 6t_1$:
        $ A D^2 = (6t_1)^2 <=> (4 + 1,8t_1)^2 + (2 - 0)^2 + (0 - 4)^2 = 36t_1^2 $
        $ <=> 16 + 14,4t_1 + 3,24t_1^2 + 4 + 16 = 36t_1^2 $
        $ <=> 32,76t_1^2 - 14,4t_1 - 36 = 0. $
      - Giải phương trình bậc hai (chọn nghiệm dương), ta được:
        $ t_1 = (14,4 + sqrt(14.4^2 - 4 dot 32.76 dot (-36)))/(2 dot 32,76) approx 1,2908 " (s)". $

      *Bước 4: Tính thời gian mang cá bay về $B$ ($t_2$).*
      - Tọa độ điểm bắt cá $D$ là: $x_D = 4 + 1,8(1,2908) approx 6,3234$. Vậy $D(6,3234; 2; 0)$.
      - Khoảng cách từ $D$ đến $B$:
        $ D B = sqrt((20 - 6,3234)^2 + (sqrt(499) - 2)^2 + (5 - 0)^2) $
        $ D B = sqrt(13.6766^2 + 20.3383^2 + 25) = sqrt(187.049 + 413.646 + 25) = sqrt(625.695) approx 25,0139 " (m)". $
      - Thời gian chim mang cá bay về $B$ (với vận tốc $5 " m/s"$):
        $ t_2 = (D B)/5 = (25,0139)/5 approx 5,0028 " (s)". $

      Tổng thời gian từ lúc rời $A$, thời gian bắt cá ($1$ giây) và bay đến đỗ ở $B$ là:
      $ T_"tổng" = t_1 + 1 + t_2 approx 1,2908 + 1 + 5,0028 = 7,2936 " (s)". $
      Làm tròn đến hàng phần trăm, ta được kết quả là *$7,29$* giây.


      #nhanxet[Bài toán là một ví dụ điển hình của ứng dụng hình học giải tích $O x z$ vào vật lý động học. Việc chọn gốc tọa độ khéo léo (tại hình chiếu của điểm xuất phát) sẽ giúp triệt tiêu nhiều biến số, làm phương trình đơn giản hơn đáng kể.]
    ],
  )


  #tln(
    [Ban đầu cho hai hộp bi riêng biệt đựng những viên bi có cùng kích thước và cùng khối lượng. Hộp I đựng 4 viên bi màu đỏ, 2 viên bi màu xanh, 1 viên bi vàng còn hộp II đựng 5 viên bi màu đỏ và 2 viên bi màu xanh. Tiến hành lấy ngẫu nhiên hai viên bi ở hộp I bỏ sang hộp II, rồi lấy ngẫu nhiên hai viên bi từ hộp II bỏ về hộp I. Hãy tính xác suất để hộp I vẫn có đủ ba loại bi, nếu biết hai viên bi lấy ra từ hộp II cùng màu (làm tròn kết quả đến hàng phần trăm)?],
    [$0,74$],
    fig: cetz.canvas(length: 1cm, {
      import cetz.draw: *

      // Hộp I
      rect((0, 0), (3, 2.2), stroke: 1.5pt, radius: 0.2)
      content((1.5, 2.6), [*Hộp I*])
      let r = 0.18
      // Bi Đỏ
      circle((0.5, 0.5), radius: r, fill: red, stroke: none)
      circle((1.1, 0.5), radius: r, fill: red, stroke: none)
      circle((1.7, 0.5), radius: r, fill: red, stroke: none)
      circle((2.3, 0.5), radius: r, fill: red, stroke: none)
      // Bi Xanh
      circle((0.8, 1.2), radius: r, fill: blue, stroke: none)
      circle((1.4, 1.2), radius: r, fill: blue, stroke: none)
      // Bi Vàng
      circle((2.0, 1.2), radius: r, fill: yellow, stroke: 0.5pt + orange)

      // Hộp II
      rect((5, 0), (8, 2.2), stroke: 1.5pt, radius: 0.2)
      content((6.5, 2.6), [*Hộp II*])
      // Bi Đỏ
      circle((5.5, 0.5), radius: r, fill: red, stroke: none)
      circle((6.1, 0.5), radius: r, fill: red, stroke: none)
      circle((6.7, 0.5), radius: r, fill: red, stroke: none)
      circle((7.3, 0.5), radius: r, fill: red, stroke: none)
      circle((5.8, 1.2), radius: r, fill: red, stroke: none)
      // Bi Xanh
      circle((6.4, 1.2), radius: r, fill: blue, stroke: none)
      circle((7.0, 1.2), radius: r, fill: blue, stroke: none)

      // Mũi tên tương tác
      bezier((3.2, 1.7), (4.8, 1.7), (4, 2.2), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
      content((4, 2.3), [2 bi])

      bezier((4.8, 0.5), (3.2, 0.5), (4, 0), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
      content((4, -0.1), [2 bi cùng màu])
    }),
    fig-pos: "center",
    loigiai: [
      #ppgiai[
        - Sử dụng *Sơ đồ cây* kết hợp với công thức xác suất toàn phần và xác suất điều kiện: $P(F|E) = (P(F cap E))/(P(E))$.
        - Phân tích cẩn thận sự thay đổi số lượng bi ở từng hộp sau Lượt 1. Việc sử dụng sơ đồ cây giúp phân nhánh các trường hợp rõ ràng và tránh nhầm lẫn.
      ]

      Gọi $E$ là biến cố: "2 viên bi lấy về từ hộp II cùng màu". \
      Gọi $F$ là biến cố: "Hộp I vẫn có đủ ba loại bi sau khi thực hiện xong 2 bước". \
      Cần tính $P(F|E) = (P(F cap E))/(P(E))$.

      Ta xây dựng sơ đồ cây biểu diễn các trường hợp lấy 2 bi ở Lượt 1 và kết quả tương ứng ở Lượt 2:

      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          // Nút gốc
          content(
            (0, 0),
            box(stroke: 1pt, inset: 6pt, radius: 3pt, fill: rgb("fff5f5"))[*Lượt 1* \ Lấy 2 bi Hộp I \ (Tổng 21 cách)],
            name: "root",
          )

          let Y = (4.5, 2.25, 0, -2.25, -4.5)
          let L1 = ([2 Đỏ], [2 Xanh], [1 Đỏ, 1 Xanh], [1 Đỏ, 1 Vàng], [1 Xanh, 1 Vàng])
          let P1 = ($6/21$, $1/21$, $8/21$, $4/21$, $2/21$)
          let PE = ($22/36$, $16/36$, $18/36$, $16/36$, $13/36$)
          let PFE = ($22/36$, $6/36$, $18/36$, $0$, $0$)

          for i in range(5) {
            // Nhánh Lượt 1
            content(
              (4.2, Y.at(i)),
              box(stroke: 0.5pt, inset: 4pt, radius: 2pt, fill: rgb("f0f6ff"))[TH#(i + 1): #L1.at(i)],
              name: "T" + str(i),
            )
            line("root", "T" + str(i), mark: (end: ">"), name: "e" + str(i))
            content("e" + str(i) + ".mid", P1.at(i), anchor: "south", padding: 2pt)

            // Nhánh Lượt 2 - Tính P(E)
            content((9.2, Y.at(i) + 0.6), [$P(E) = #PE.at(i)$], name: "E" + str(i))
            line("T" + str(i), "E" + str(i), mark: (end: ">"))

            // Nhánh Lượt 2 - Tính P(F giao E)
            content((9.2, Y.at(i) - 0.6), [$P(F cap E) = #PFE.at(i)$], name: "F" + str(i))
            line("T" + str(i), "F" + str(i), mark: (end: ">"))
          }
        })
      ]

      *Dựa vào sơ đồ cây, ta có các phân tích chi tiết cho Lượt 2:*
      - *TH1:* Hộp II lúc này có (7 Đỏ, 2 Xanh).
        - $P(E) = (C_7^2 + C_2^2)/(C_9^2) = 22/36$.
        - Hộp I còn (2 Đỏ, 2 Xanh, 1 Vàng). Lấy về 2 Đỏ hoặc 2 Xanh thì Hộp I vẫn đủ 3 màu $=> P(F cap E) = 22/36$.
      - *TH2:* Hộp II có (5 Đỏ, 4 Xanh).
        - $P(E) = (C_5^2 + C_4^2)/(C_9^2) = 16/36$.
        - Hộp I còn (4 Đỏ, 0 Xanh, 1 Vàng). Để đủ 3 màu, *bắt buộc* phải lấy về 2 Xanh $=> P(F cap E) = (C_4^2)/36 = 6/36$.
      - *TH3:* Hộp II có (6 Đỏ, 3 Xanh).
        - $P(E) = (C_6^2 + C_3^2)/(C_9^2) = 18/36$.
        - Hộp I còn (3 Đỏ, 1 Xanh, 1 Vàng). Lấy về 2 Đỏ hoặc 2 Xanh đều khiến Hộp I đủ 3 màu $=> P(F cap E) = 18/36$.
      - *TH4 & TH5:* Ở Lượt 1 đã lấy đi viên bi Vàng duy nhất. Để Hộp I đủ 3 màu, bắt buộc Lượt 2 phải lấy lại bi Vàng. Tuy nhiên, biến cố $E$ đòi hỏi lấy 2 bi *cùng màu*, mà Hộp II lúc này chỉ có 1 bi Vàng nên không thể lấy 2 bi Vàng $=> P(F cap E) = 0$.

      Từ đó, áp dụng quy tắc cộng dọc theo các nhánh của sơ đồ cây:
      $
        P(E) & = 6/21 dot 22/36 + 1/21 dot 16/36 + 8/21 dot 18/36 + 4/21 dot 16/36 + 2/21 dot 13/36 \
             & = (132 + 16 + 144 + 64 + 26)/756 = 382/756.
      $

      $
        P(F cap E) & = 6/21 dot 22/36 + 1/21 dot 6/36 + 8/21 dot 18/36 + 4/21 dot 0 + 2/21 dot 0 \
                   & = (132 + 6 + 144)/756 = 282/756.
      $

      Xác suất cần tìm là:
      $ P(F|E) = (P(F cap E))/(P(E)) = (282/756) / (382/756) = 282/382 = 141/191 approx 0,7382... $

      Làm tròn kết quả đến hàng phần trăm, ta được *$0,74$*.

      #meo[
        Sơ đồ cây giúp ta hình thị hóa toàn bộ quá trình biến đổi của không gian mẫu. Đặc biệt, việc nhìn vào sơ đồ cây giúp bạn dễ dàng nhận ra nhánh TH4 và TH5 có $P(F cap E) = 0$ ngay lập tức, tiết kiệm tối đa thời gian suy luận trong phòng thi!
      ]
    ],
  )


  #let hinh-minh-hoa = cetz.canvas({
    import cetz.draw: *

    // chiếu 3D -> 2D
    let prj(x, y, z) = (x - 0.6 * y, 0.35 * y + z)

    let H = prj(0, 0, 0)
    let N = prj(8, 0, 4)
    let Hprime = prj(8, 0, 0)
    let M = prj(5, 0, 0)

    // Khung mặt phẳng Oxy (chỉ vẽ viền để khỏi dính polygon/fill)
    let A = prj(-6, -6, 0)
    let B = prj(10, -6, 0)
    let C = prj(10, 6, 0)
    let D = prj(-6, 6, 0)
    line(A, B, stroke: 0.5pt + luma(210))
    line(B, C, stroke: 0.5pt + luma(210))
    line(C, D, stroke: 0.5pt + luma(210))
    line(D, A, stroke: 0.5pt + luma(210))
    content(prj(-5.7, 5.7, 0), text(fill: luma(120))[$(O x y)$], anchor: "north-west", padding: 2pt)

    // Trục
    line(prj(-6, 0, 0), prj(10, 0, 0), stroke: (dash: "dashed", paint: luma(140)), mark: (end: ">"))
    content(prj(10.7, 0, 0), [$x$], anchor: "west", padding: 2pt)

    line(prj(0, -6, 0), prj(0, 6, 0), stroke: (dash: "dashed", paint: luma(140)), mark: (end: ">"))
    content(prj(0, 6.7, 0), [$y$], anchor: "south", padding: 2pt)

    line(prj(0, 0, 0), prj(0, 0, 6), stroke: (dash: "dashed", paint: luma(140)), mark: (end: ">"))
    content(prj(0, 0, 6.7), [$z$], anchor: "south", padding: 2pt)

    // (C): vẽ bằng quét góc
    let circle-points = range(0, 360, step: 3).map(deg => {
      let rad = deg * 1deg
      prj(5 * calc.cos(rad), 5 * calc.sin(rad), 0)
    })
    line(..circle-points, close: true, stroke: 1.2pt + rgb("#0057b8"))
    content(prj(-3.2, 3.6, 0), text(fill: rgb("#0057b8"))[$(C)$], anchor: "south", padding: 2pt)

    // d' và d
    line(prj(8, -6, 0), prj(8, 6, 0), stroke: 1pt + luma(110))
    content(prj(8, 6.6, 0), [$d'$], anchor: "south", padding: 2pt)

    line(prj(8, -6, 4), prj(8, 6, 4), stroke: 1.4pt + rgb("#1a7a2e"))
    content(prj(8, 6.6, 4), text(fill: rgb("#1a7a2e"))[$d$], anchor: "south", padding: 2pt)

    // các đoạn minh hoạ
    line(H, M, stroke: (dash: "dotted", paint: rgb("#0057b8")))
    content(prj(2.5, 0, 0), [$r=5$], anchor: "south", padding: 2pt)

    line(M, Hprime, stroke: (dash: "dotted", paint: luma(80)))
    content(prj(6.5, 0, 0), [$3$], anchor: "south", padding: 2pt)

    line(Hprime, N, stroke: (dash: "dotted", paint: luma(80)))
    content(prj(8, 0, 2), [$h=4$], anchor: "west", padding: 2pt)

    line(M, N, stroke: 1.6pt + rgb("#cc2200"))
    content(prj(6.6, 0, 2), text(fill: rgb("#cc2200"), weight: "bold")[$M N=5$], anchor: "south-west", padding: 2pt)

    // điểm
    circle(H, radius: 1.6pt, fill: black)
    content(H, [$H$], anchor: "north-east", padding: 2pt)

    circle(M, radius: 1.6pt, fill: black)
    content(M, [$M$], anchor: "north", padding: 2pt)

    circle(Hprime, radius: 1.6pt, fill: black)
    content(Hprime, [$H'$], anchor: "north", padding: 2pt)

    circle(N, radius: 1.6pt, fill: black)
    content(N, [$N$], anchor: "south-west", padding: 2pt)
  })


  #tln(
    [Trong không gian $O x y z$, cho đường tròn $(C)$ là giao tuyến của mặt cầu $(S): x^2 + y^2 + z^2 = 25$ và mặt phẳng $(alpha): z = 0$. Cho đường thẳng $d$ có phương trình $cases(x = 8, y = t, z = 4)$. Tìm giá trị nhỏ nhất của đoạn $M N$ với $M in (C)$ và $N in d$.],
    [$5$],
    // fig: hinh-minh-hoa,
    // fig-pos: "center",
    // fig-width: 100%,
    loigiai: [
      #ppgiai[
        - Nhận xét đường thẳng $d$ song song với mặt phẳng $(alpha)$.
        - Gọi $h$ là khoảng cách từ $d$ đến $(alpha)$, $d'$ là hình chiếu của $d$ lên $(alpha)$.
        - Khoảng cách ngắn nhất $min M N = sqrt(h^2 + (max(0, p - r))^2)$, với $p = d(H, d')$.
      ]
      Đường tròn $(C)$ nằm trong mặt phẳng $O x y$ ($z=0$), có tâm $H(0; 0; 0)$ và bán kính $r = 5$.

      Đường thẳng $d$ có vectơ chỉ phương $arrow(u) = (0; 1; 0)$ và đi qua $A(8; 0; 4)$.
      Vì $arrow(u) perp arrow(k)$ và $A notin (alpha)$ nên $d parallel (alpha)$.
      Khoảng cách từ $d$ đến $(alpha)$ là $h = d(A, (alpha)) = 4$.

      Hình chiếu vuông góc của $d$ lên $(alpha)$ là đường thẳng $d'$ có phương trình: $cases(x = 8, y = t, z = 0)$.
      Trong mặt phẳng $(alpha)$, khoảng cách từ tâm $H$ đến $d'$ là $p = d(H, d') = 8$.

      Vì $p > r$ ($8 > 5$), khoảng cách ngắn nhất từ $M in (C)$ đến $d'$ là $p - r = 8 - 5 = 3$.

      Khoảng cách ngắn nhất trong không gian từ $M$ đến $N$ là:
      $ min M N = sqrt(h^2 + 3^2) = sqrt(4^2 + 3^2) = 5. $

      #meo[
        Khi gặp đường thẳng song song với mặt phẳng chứa đường tròn (Trường hợp B), hãy tách bài toán thành 2 thành phần vuông góc: "độ cao" $h$ không đổi và "bài toán phẳng" trên mặt phẳng hình chiếu. Sử dụng định lý Pythagore để tính kết quả cuối cùng.
      ]
    ],
  )

  #tln(
    [
      Cho một hình lập phương $A B C D.A'B'C'D'$ có độ dài một cạnh bằng $2$ m. Một thanh trượt được cố định dọc theo cạnh $B B'$, trên đó có một con chạy $M$ di chuyển (đặt $B M = x$ với $0 <= x <= 2$). Một sợi dây đàn hồi nối từ điểm $E$ (là tâm của mặt bên $A B B' A'$) đến một điểm $N$ chạy tự do trên đoạn thẳng $D M$. Khi độ dài sợi dây $E N$ đạt giá trị ngắn nhất, hãy tính $x$ theo đơn vị mét. _Kết quả làm tròn đến hàng phần mười_
    ],
    fig: cetz.canvas(length: 1cm, {
      import cetz.draw: *
      let a = (1.5, 1.2)
      let b = (0, 0)
      let c = (3, 0)
      let d = (4.5, 1.2)
      let a1 = (1.5, 4.2)
      let b1 = (0, 3)
      let c1 = (3, 3)
      let d1 = (4.5, 4.2)

      // Các cạnh khuất
      line(a, b, stroke: (dash: "dashed", thickness: 0.8pt))
      line(a, d, stroke: (dash: "dashed", thickness: 0.8pt))
      line(a, a1, stroke: (dash: "dashed", thickness: 0.8pt))

      // Các cạnh thấy
      line(b, c, d, stroke: 0.8pt)
      line(b1, c1, d1, a1, close: true, stroke: 0.8pt)
      line(b, b1, stroke: 0.8pt)
      line(c, c1, stroke: 0.8pt)
      line(d, d1, stroke: 0.8pt)

      // Điểm M trên BB' (minh hoạ x = 4/3)
      let m = (0, 2)
      circle(m, radius: 1.5pt, fill: black)
      content(m, $M$, anchor: "east", padding: 3pt)

      // Đoạn DM
      line(d, m, stroke: 0.6pt)

      // Điểm E là tâm mặt ABB'A'
      let e = (0.75, 2.1)
      circle(e, radius: 1.5pt, fill: black)
      content(e, $E$, anchor: "south", padding: 3pt)

      // Điểm N trên DM
      let n = (2.25, 1.6)
      circle(n, radius: 1.5pt, fill: black)
      content(n, $N$, anchor: "north-west", padding: 3pt)
      line(e, n, stroke: (dash: "dashed", paint: red, thickness: 0.8pt))

      // Nhãn đỉnh
      content(a, $A$, anchor: "south-east", padding: 5pt)
      content(b, $B$, anchor: "north-east", padding: 5pt)
      content(c, $C$, anchor: "north-west", padding: 5pt)
      content(d, $D$, anchor: "south-west", padding: 5pt)
      content(a1, $A'$, anchor: "south-east", padding: 5pt)
      content(b1, $B'$, anchor: "east", padding: 5pt)
      content(c1, $C'$, anchor: "west", padding: 5pt)
      content(d1, $D'$, anchor: "south-west", padding: 5pt)
    }),
    fig-pos: "right",
    fig-width: 30%,
    [ $1.33$ ],
    loigiai: [
      #ppgiai[
        - Chọn hệ trục tọa độ $O x y z$ với gốc tọa độ tại $A$.
        - Xác định tọa độ $M$ (trên $B B'$), đường thẳng tham chiếu $D M$ và điểm $E$ (tâm $A B B' A'$).
        - Áp dụng công thức khoảng cách từ điểm $E$ đến đường thẳng $D M$: $d(E, D M) = (abs([arrow(D E), arrow(D M)])) / abs(arrow(D M))$.
        - Thiết lập hàm số và giải đạo hàm để tìm $x$.
      ]

      Chọn hệ trục tọa độ $O x y z$ với gốc $A(0;0;0)$, các tia $A B$, $A D$, $A A'$ lần lượt nằm trên $O x$, $O y$, $O z$.
      Vì hình lập phương có cạnh bằng $2$ nên ta có:
      $B(2;0;0)$, $D(0;2;0)$, $A'(0;0;2)$ và $B'(2;0;2)$.

      Vì $M$ thuộc cạnh $B B'$ và $B M = x$ ($0 <= x <= 2$) nên tọa độ của $M$ là $M(2;0;x)$.

      Điểm $E$ là tâm của mặt $A B B' A'$, tức là trung điểm của $A B'$, suy ra $E(1; 0; 1)$.

      Đường thẳng $D M$ đi qua $D(0;2;0)$ và có véc-tơ chỉ phương $arrow(u) = arrow(D M) = (2; -2; x)$.
      Véc-tơ $arrow(D E) = (1; -2; 1)$.

      Ta tính tích có hướng của hai véc-tơ $arrow(D E)$ và $arrow(u)$:
      $
        [arrow(D E), arrow(u)] & = ( (-2)(x) - 1(-2) ; 1(2) - 1(x) ; 1(-2) - (-2)(2) ) \
                               & = (-2x + 2; 2 - x; 2).
      $

      Khoảng cách $E N$ nhỏ nhất khi $E N$ vuông góc với $D M$, tức là $E N = d(E, D M)$. Bình phương khoảng cách này là:
      $
        f(x) & = (abs([arrow(D E), arrow(u)])^2)/(abs(arrow(u))^2) = ((-2x + 2)^2 + (2 - x)^2 + 2^2)/(2^2 + (-2)^2 + x^2) \
             & = (4x^2 - 8x + 4 + x^2 - 4x + 4 + 4)/(x^2 + 8) = (5x^2 - 12x + 12)/(x^2 + 8).
      $

      Xét hàm số $f(x) = (5x^2 - 12x + 12)/(x^2 + 8)$ trên đoạn $[0; 2]$. Lấy đạo hàm:
      $
        f'(x) & = ( (10x - 12)(x^2 + 8) - 2x(5x^2 - 12x + 12) ) / ((x^2 + 8)^2) \
              & = (10x^3 + 80x - 12x^2 - 96 - 10x^3 + 24x^2 - 24x) / ((x^2 + 8)^2) \
              & = (12x^2 + 56x - 96) / ((x^2 + 8)^2) = (4(3x^2 + 14x - 24)) / ((x^2 + 8)^2).
      $

      Cho $f'(x) = 0 <=> 3x^2 + 14x - 24 = 0$.
      Phương trình bậc hai này có hai nghiệm:
      $x = (-14 + sqrt(14^2 - 4(3)(-24)))/6 = (-14 + 22)/6 = 4/3$ (nhận) và $x = (-14 - 22)/6 = -6$ (loại vì không thuộc $[0;2]$).

      Ta có bảng biến thiên:
      #align(center)[#bbt-opt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($0$, $4/3$, $2$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($1.5$, $f(4/3)$, $2/3$),
        is-min: true,
      )]
      Với $x in [0; 4/3)$, $f'(x) < 0$; với $x in (4/3; 2]$, $f'(x) > 0$.
      Hàm số đạt giá trị nhỏ nhất tại $x = 4/3$. Tại đó, giá trị khoảng cách ngắn nhất là $sqrt(f(4/3)) = sqrt(1/2) = (sqrt(2))/2$ mét.

      Vậy $x = 4/3$ mét.
    ],
  )

  #tln(
    [Một doanh nghiệp ra mắt một dòng sản phẩm gia dụng mới. Bộ phận phân tích thị trường ước tính rằng: nếu công ty chi $x$ (triệu đồng) cho chiến dịch quảng cáo ($0 <= x <= 60$) thì *lợi nhuận gộp* (doanh thu trừ đi các chi phí sản xuất, lưu kho, vận hành) thu được từ sản phẩm này được mô hình hoá bởi hàm số:
      $ f(x) = -1/3 x^3 + 20x^2 + 501x quad ("triệu đồng"). $
      Biết rằng *lợi nhuận thuần* của doanh nghiệp bằng lợi nhuận gộp trừ đi chi phí quảng cáo. Hỏi doanh nghiệp cần chi bao nhiêu triệu đồng cho quảng cáo để lợi nhuận thuần đạt giá trị lớn nhất?],
    [$50$],
    loigiai: [
      #ppgiai[
        - Từ giả thiết, thiết lập hàm lợi nhuận thuần $P(x) = f(x) - x$.
        - Bài toán yêu cầu tìm giá trị lớn nhất của $P(x)$ trên đoạn $[0; 60]$.
        - Tính đạo hàm $P'(x)$, giải phương trình $P'(x) = 0$ để tìm điểm cực trị.
        - Lập bảng biến thiên trên đoạn $[0; 60]$ để tìm cực đại và kết luận.
      ]

      Gọi $x$ (triệu đồng) là số tiền chi cho quảng cáo ($0 <= x <= 60$).
      Theo đề bài, lợi nhuận thuần của doanh nghiệp là:
      $
        P(x) & = f(x) - x \
             & = (-1/3 x^3 + 20x^2 + 501x) - x \
             & = -1/3 x^3 + 20x^2 + 500x.
      $

      Xét hàm số $P(x) = -1/3 x^3 + 20x^2 + 500x$ trên đoạn $[0; 60]$.
      Đạo hàm:
      $ P'(x) = -x^2 + 40x + 500. $

      Cho $P'(x) = 0 <=> -x^2 + 40x + 500 = 0 <=> hoac(x = 50 quad &("nhận"), x = -10 quad &("loại")).$

      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $P'(x)$,
          func: $P(x)$,
          x-vals: ($0$, $50$, $60$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $100000/3$, $30000$),
          is-min: false,
        )
      ]

      Từ bảng biến thiên, ta thấy hàm số đạt giá trị lớn nhất trên đoạn $[0; 60]$ tại $x = 50$.
      Vậy doanh nghiệp cần chi $50$ triệu đồng cho quảng cáo để đạt được lợi nhuận thuần lớn nhất.

      #nhanxet[
        Bài toán phản ánh một quy luật kinh tế thực tế là *"Hiệu suất giảm dần"* (Law of diminishing returns): Ban đầu, khi chi tiền quảng cáo, lợi nhuận sẽ tăng vọt; nhưng nếu vung tay chi quá nhiều (vượt qua mốc 50 triệu), thị trường sẽ bão hoà, lượng khách hàng mới không đủ bù đắp chi phí quảng cáo dẫn đến lợi nhuận rớt xuống.

        Dạng toán cực trị hàm bậc 3 này cực kỳ quen thuộc, dễ giải tay và rất phù hợp với đề thi THPT Quốc gia hiện hành.
      ]
    ],
  )
  #tln(
    [Một tháp nghệ thuật bằng kính được thiết kế dọc theo trục thẳng đứng $O y$ (đơn vị: mét). Đáy tháp nằm tại gốc tọa độ $O (y=0)$ và đỉnh tháp nằm tại $y=4$. Biết rằng khi cắt khối tháp bởi một mặt phẳng vuông góc với trục $O y$ tại điểm có tung độ $y$ ($0 <= y <= 4$), ta luôn thu được thiết diện là một hình vuông có độ dài cạnh $a(y) = y sqrt(4 - y)$ (mét). Biết thể tích của khối tháp đó (viết kết quả dưới dạng phân số tối giản $a/b$, tính $a+b$).],
    fig: cetz.canvas(length: 1cm, {
      import cetz.draw: *

      // Phép chiếu 3D chuẩn xác: X ngang, Y đứng, Z đâm ra trước và chéo sang trái
      // Các điểm Z < 0 (nửa sau) sẽ khuất, Z > 0 (nửa trước) sẽ thấy
      let proj(x, y, z) = (x - 0.5 * z, y - 0.25 * z)

      // Hệ trục tọa độ
      line(proj(0, 0, 0), proj(2.5, 0, 0), mark: (end: ">"), stroke: 0.5pt)
      content(proj(2.7, 0, 0), $x$)

      line(proj(0, 0, 0), proj(0, 4.6, 0), mark: (end: ">"), stroke: 0.5pt)
      content(proj(0, 4.8, 0), $y$)

      line(proj(0, 0, 0), proj(0, 0, 2), mark: (end: ">"), stroke: 0.5pt)
      content(proj(0, 0, 2.3), $z$)

      content(proj(0.2, -0.2, 0), $O$)

      // Hàm tính nửa cạnh hình vuông tại y
      let half_a(y) = 0.5 * y * calc.sqrt(4 - y)

      // 1. VẼ ĐƯỜNG SINH KHUẤT PHÍA SAU (Đường P4)
      let env_p4 = ()
      for i in range(0, 41) {
        let y = i * 0.1
        let ha = half_a(y)
        env_p4.push(proj(-ha, y, -ha)) // P4: Trái - Sau
      }
      line(..env_p4, stroke: (dash: "dashed", paint: rgb("888888")))

      // 2. HÀM VẼ MỘT LÁT CẮT (THIẾT DIỆN)
      let draw_slice(y, fill_alpha: "22") = {
        let ha = half_a(y)
        let p1 = proj(-ha, y, ha) // P1: Trái - Trước (Mép trái thấy)
        let p2 = proj(ha, y, ha) // P2: Phải - Trước (Đỉnh nhô ra)
        let p3 = proj(ha, y, -ha) // P3: Phải - Sau (Mép phải thấy)
        let p4 = proj(-ha, y, -ha) // P4: Trái - Sau (Góc khuất sâu nhất)

        // Vẽ viền khuất (2 cạnh nối vào P4)
        line(p1, p4, p3, stroke: (dash: "dashed", paint: rgb("999999")))

        // Tô màu lát cắt
        if fill_alpha != "00" {
          line(p1, p2, p3, p4, close: true, fill: rgb("00aa55" + fill_alpha), stroke: none)
        }

        // Vẽ viền thấy (2 cạnh nối P1-P2-P3)
        line(p1, p2, p3, stroke: 0.8pt + rgb("008844"))
      }

      // Vẽ các lát cắt từ dưới lên trên để tạo chiều sâu đúng
      draw_slice(0.5, fill_alpha: "1a")
      draw_slice(1.5, fill_alpha: "22")
      draw_slice(2.5, fill_alpha: "33")
      draw_slice(3.5, fill_alpha: "44")

      // 3. VẼ CÁC ĐƯỜNG SINH THẤY PHÍA TRƯỚC (P1, P2, P3)
      let env_p1 = ()
      let env_p2 = ()
      let env_p3 = ()

      for i in range(0, 41) {
        let y = i * 0.1
        let ha = half_a(y)
        env_p1.push(proj(-ha, y, ha)) // Bao trái
        env_p2.push(proj(ha, y, ha)) // Sống lưng phía trước
        env_p3.push(proj(ha, y, -ha)) // Bao phải
      }

      line(..env_p1, stroke: 1.2pt + rgb("008844"))
      line(..env_p3, stroke: 1.2pt + rgb("008844"))
      line(..env_p2, stroke: 0.5pt + rgb("00884488")) // Sống lưng vẽ mảnh để tạo khối

      // Chú thích
      line(proj(0, 4, 0), proj(-1.5, 4, 0), stroke: (dash: "dashed", paint: gray))
      content(proj(-1.8, 4, 0), $4$)

      let ty = 2.5
      let tha = half_a(ty)
      let tp1 = proj(-tha, ty, tha)
      let tp2 = proj(tha, ty, tha)
      line((tp1.at(0), tp1.at(1) - 0.2), (tp2.at(0), tp2.at(1) - 0.2), mark: (start: ">", end: ">"), stroke: 0.4pt)
      // content(((tp1.at(0)+tp2.at(0)-1-2-2.5)/2, tp1.at(1) + 0.5), text(fill: rgb("006633"), size: 9pt)[$a(y) = y sqrt(4-y)$])
    }),
    fig-pos: "right",
    fig-width: 35%,
    [$67$],
    loigiai: [
      #ppgiai[
        - Thể tích của vật thể giới hạn bởi hai mặt phẳng vuông góc với trục $O y$ tại $y=a$ và $y=b$ được tính bởi công thức:
          $ V = integral_a^b S(y) dif y $
        - Trong đó, $S(y)$ là diện tích thiết diện của vật thể khi bị cắt bởi mặt phẳng vuông góc với trục $O y$ tại điểm có tung độ $y$.
        - Vì thiết diện là hình vuông cạnh $a(y)$, nên $S(y) = [a(y)]^2$.
      ]

      *Bước 1: Thiết lập hàm diện tích thiết diện $S(y)$*
      - Chiều dài cạnh hình vuông tại cao độ $y$ là:
        $ a(y) = y sqrt(4 - y) quad (0 <= y <= 4) $
      - Diện tích của thiết diện hình vuông này là:
        $ S(y) = [a(y)]^2 = (y sqrt(4 - y))^2 = y^2 (4 - y) = 4y^2 - y^3 $

      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          // Vẽ đồ thị S(y) để học sinh hình dung sự biến thiên của tiết diện
          line((-0.2, 0), (4.5, 0), mark: (end: ">"))
          content((4.5, -0.3), $y$)
          line((0, -0.2), (0, 3.5), mark: (end: ">"))
          content((-0.6, 3.5), $S(y)$)
          content((-0.2, -0.2), $O$)

          let curve = ()
          for i in range(0, 41) {
            let y = i * 0.1
            let S = 4 * y * y - y * y * y
            curve.push((y, S / 3.5)) // Scale trục tung
          }
          line(..curve, stroke: 1.2pt + rgb("008844"), fill: rgb("00aa5522"))

          line((4, 0), (4, 0.2), stroke: 1pt)
          content((4, -0.3), $4$)

          let y_max = 8 / 3
          let S_max = 4 * calc.pow(y_max, 2) - calc.pow(y_max, 3)
          line((y_max, 0), (y_max, S_max / 3.5), stroke: (dash: "dashed", paint: red))
          content((y_max, -0.4), $8/3$)

          content((2, 2.5), text(fill: rgb("006633"))[$S(y) = 4y^2 - y^3$])
        })
      ]

      *Bước 2: Tính thể tích khối tháp $V$*
      - Khối tháp nằm từ $y = 0$ đến $y = 4$. Thể tích của khối tháp là:
        $
          V & = integral_0^4 S(y) dif y = integral_0^4 (4y^2 - y^3) dif y \
            & = lr((4/3 y^3 - y^4/4) |)_0^4 \
            & = (4/3 dot 4^3 - 4^4/4) - 0 \
            & = 256/3 - 64 = 256/3 - 192/3 = 64/3 " (m"^3")"
        $

      Vậy thể tích của khối tháp nghệ thuật là *$64/3$*.

      #nhanxet[
        Qua đồ thị $S(y)$, ta thấy diện tích mặt cắt tăng dần từ $0$ (tại đáy $y=0$), đạt cực đại tại $y = 8/3$ (phần phình to nhất của tháp), sau đó thu hẹp lại và bằng $0$ tại $y=4$ (đỉnh tháp). Hình dáng này giải thích vì sao khối tháp có dạng giống một nụ hoa đóng kín ở hai đầu.
      ]
    ],
  )
]  // end make-questions

// Chỉ chạy khi mở standalone (không được import bởi Beamer.typ)
#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}

