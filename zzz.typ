#import "@preview/sang-math:1.0.1": *

#let mode = "loigiai"
#let accent = classic.blue
#let math-color = rgb("#000000")
#show math.equation: set text(fill: math-color)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.frac: math.display
#show: thpt-school-exam.with(
  department: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "GV Nguyễn Văn Sang",
  exam-title: "ĐỀ DỰ ĐOÁN CUỐI CÙNG", 
  subject: "TOÁN - LỚP 12", 
  duration: "90 phút",
  structure: auto,
  code: "9999",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: true,
)
 
#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [
  #exam-part(
    [Phần I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.
    ],
  )

  #tn(
    [Trong mặt phẳng $O x y$, cho elip có phương trình chính tắc $x^2/25 + y^2/16 = 1$. Hỏi điểm nào dưới đây là một trong hai tiêu điểm của elip đã cho
    ],
    ([$(0;3)$], True([$(3;0)$]), [$( - 5;0)$], [$(4;0)$]),
    id: "DMTD-TN-001",
    loigiai: [
      #step[Xác định các thông số của elip]
      Từ phương trình chính tắc của elip $x^2/a^2 + y^2/b^2 = 1$, ta có $a^2 = 25$ và $b^2 = 16$.\
      Từ phương trình chính tắc của elip $x^2/a^2 + y^2/b^2 = 1$, ta có $a^2 = 25$ và $b^2 = 16$.
      #step[Tính tọa độ tiêu điểm]
      Ta có $c^2 = a^2 - b^2 = 25 - 16 = 9 => c = 3$.
      Hai tiêu điểm của elip nằm trên trục $O x$ có tọa độ là $F_1( - 3;0)$ và $F_2(3;0)$.
      Vậy điểm $(3;0)$ là một trong hai tiêu điểm của elip.
    ],
  )

  #tn(
    [Giá trị của biểu thức $P_4 + A_6^2 + C_5^3$ là],
    ([$99$.], [$49$.], [$29$.], True([$64$.])),
    id: "DMTD-TN-002",
    loigiai: [
      #step[Tính các giá trị tổ hợp, chỉnh hợp, hoán vị]
      Ta có:
      - $P_4 = 4! = 24$.
      - $A_6^2 = 6 times 5 = 30$.
      - $C_5^3 = frac(5!, 3!2!) = 10$.
      #step[Tính tổng]
      Vậy $P_4 + A_6^2 + C_5^3 = 24 + 30 + 10 = 64$.
    ],
  )

  #tn(
    // cols: 2,
    // row-gutter: 2em,
    [Nghiệm của phương trình $cot(x - pi/3 )= sqrt(3)$ là],  
    (
      True([$x = pi/2 + k pi, k in ZZ$.]), 
      [$x = pi/2 + k 2 pi, k in ZZ$.], 
      [$x = (2 pi)/3 + k pi, k in ZZ$.],
      [$x = pi/6 + k pi, k in ZZ$.],
    ),
    id: "DMTD-TN-003",
    loigiai: [
      #step[Giải phương trình lượng giác cơ bản]
      Ta có $cot(x - pi/3) = sqrt(3) <=> cot(x - pi/3) = cot(pi/6)$.
      Suy ra $x - pi/3 = pi/6 + k pi, k in ZZ$.
      #step[Kết luận nghiệm]
      $<=> x = pi/3 + pi/6 + k pi = pi/2 + k pi, k in ZZ$.
    ],
  )

  #tn(
    [Khi phát biểu về quan hệ song song trong không gian, hỏi phát biểu nào sau đây đúng?],
    (
      [Hai đường thẳng chéo nhau là hai đường thẳng không có điểm chung.],
      True([Một đường thẳng song song với một mặt phẳng nếu nó không nằm trong mặt phẳng đó và song song với một đường thẳng nằm trong mặt phẳng đó.]),
      [Hai mặt phẳng song song với nhau nếu mặt phẳng này có chứa ít nhất một đường thẳng song song với mặt phẳng còn lại.],
      [Cho hai đường thẳng song song, khi đó tồn tại duy nhất một mặt phẳng chứa đường thẳng này và song song với đường thẳng còn lại.]
    ), 
    id: "DMTD-TN-004",
    loigiai: [
      #step[Phân tích từng phát biểu]
      - Phát biểu A: Sai vì hai đường thẳng chéo nhau là hai đường thẳng không đồng phẳng. "Không có điểm chung" có thể là hai đường thẳng song song.
      - Phát biểu B: Đúng. Đây là định lý về điều kiện để đường thẳng song song với mặt phẳng.
      - Phát biểu C: Sai vì hai mặt phẳng cắt nhau cũng có thể chứa một đường thẳng ở mặt này song song với mặt kia (giao tuyến song song).
      - Phát biểu D: Sai vì có vô số mặt phẳng chứa đường thẳng này và song song với đường thẳng kia.
    ],
  )

  #tn(
    [Hỏi tập giá trị của hàm số nào dưới đây cũng là tập xác định của hàm số $y = log x$?],
    ([$y = ln x$.], [$y = x^2$.], True([$y = e^x$.]), [$y = sqrt(x)$.]),
    id: "DMTD-TN-005",
    loigiai: [
      #step[Tìm tập xác định của hàm số $y = log x$]
      Hàm số $y = log x$ có tập xác định là $D = (0; +oo)$.
      #step[Tìm tập giá trị của các hàm số trong phương án]
      - $y = ln x$ có tập giá trị là $RR$.
      - $y = x^2$ có tập giá trị là $[0; +oo)$.
      - $y = e^x$ có tập giá trị là $(0; +oo)$.
      - $y = sqrt(x)$ có tập giá trị là $[0; +oo)$.
      Vậy hàm số $y = e^x$ có tập giá trị bằng tập xác định của hàm số $y = log x$.
    ],
  )

  #tn(
    [Biểu thức đạo hàm của hàm số $y = e^x + log x$ là],
    (True([$y = e^x + 1/(x ln 10)$.]), [$y = e^x + 1/x$.], [$y = e^x + x$.], [$y = e^x - 1/(x ln 10)$.]),
    id: "DMTD-TN-006",
    loigiai: [
      #step[Áp dụng quy tắc tính đạo hàm]
      Ta có $y' = (e^x)' + (log x)' = e^x + frac(1, x ln 10)$.
    ],
  )

  #tn(
    [Cho mẫu số liệu ghép nhóm $M$ có 6 nhóm (độ dài các nhóm bằng nhau), có phần tử đại diện của nhóm thứ 2 hơn đầu mút trái của nhóm thứ 1 một lượng là 3. Khoảng biến thiên của $M$ bằng],
    (True([$12$.]), [$18$.], [$24$.], [$36$.]),
    id: "DMTD-TN-007",
    loigiai: [
      #step[Thiết lập mô hình các nhóm]
      Gọi các mút của các nhóm lần lượt là $a, a+h, a+2h, ..., a+6h$. ($h$ là độ dài nhóm).
      - Nhóm thứ 1 là $[a; a+h)$. Đầu mút trái của nhóm 1 là $a$.
      - Nhóm thứ 2 là $[a+h; a+2h)$. Phần tử đại diện của nhóm 2 là $frac(a+h+a+2h, 2) = a + 1.5h$.
      #step[Tính độ dài khoảng biến thiên]
      Theo giả thiết, phần tử đại diện nhóm 2 hơn đầu mút trái nhóm 1 lượng là 3:
      $a + 1.5h - a = 3 <=> 1.5h = 3 <=> h = 2$.
      Mẫu số liệu có 6 nhóm, nên khoảng biến thiên là $R = 6h = 6 times 2 = 12$.
    ],
  )

  #tn(
    [Cho hình chóp $S.A B C$ có đường cao $S H$ và các kích thước được cho như hình vẽ bên dưới. Thể tích khối chóp $S.A B C$ bằng:],
    ([$12sqrt(3)$], [$4sqrt(3)$], True([$16$]), [$4sqrt(6)$]),
    fig: cetz.canvas(length: .95cm, {
      import cetz.draw: *
      let S = (0.0, 3.0)
      let A = (-2.5, -0.5)
      let C = (2.5, 0.5)
      let H = (0.0, 0.0)
      let B = (0.5, -1.8)

      // Vẽ đáy
      line(A, B, C, stroke: 1pt + rgb("#37474f"))
      line(A, C, stroke: (dash: "dashed", paint: rgb("#37474f"), thickness: 1pt))
      line(H, B, stroke: (dash: "dashed", paint: rgb("#37474f"), thickness: 1pt))
      
      // Vẽ đường cao và các cạnh bên
      line(H, S, stroke: (dash: "dashed", paint: red, thickness: 1pt))
      line(A, S, stroke: 1pt + rgb("#37474f"))
      line(C, S, stroke: 1pt + rgb("#37474f"))
      line(B, S, stroke: 1pt + rgb("#37474f"))
      
      // Ký hiệu góc vuông
      line((0.0, 0.3), (0.3, 0.36), (0.3, 0.06), stroke: 0.5pt)

      // Đánh dấu các đỉnh
      content((-2.7, -0.5), $A$)
      content((0.5, -2.1), $B$)
      content((2.7, 0.5), $C$)
      content((0.0, 3.3), $S$)
      content((-0.2, 0.2), $H$)
      
      // Kích thước
      content((-1.25, -0.4), text(fill: rgb("#d32f2f"))[$4$])
      content((1.25, 0.0), text(fill: rgb("#d32f2f"))[$4$])
      content((0.5, -0.8), text(fill: rgb("#d32f2f"))[$4$])
      content((-0.2, 1.5), text(fill: rgb("#1e88e5"))[$3$])
    }),
    fig-pos: "right",
    fig-width: 35%,
    id: "DMTD-TN-008",
    loigiai: [
      #step[Phân tích dữ kiện hình vẽ]
      Từ hình vẽ, ta thấy mặt đáy là tam giác $A B C$. Hình chiếu của $S$ xuống mặt phẳng $(A B C)$ là điểm $H$ nằm trên cạnh $A C$.
      Ta có $A H = 4$, $H C = 4 => A C = A H + H C = 8$.
      Ngoài ra $H B = 4$. Trong $Delta A B C$ có đường trung tuyến $B H = 4 = frac(1, 2)A C$.
      Do đó $Delta A B C$ vuông tại $B$.
      #step[Tính diện tích đáy và thể tích]
      Đường cao $B H perp A C$ (nếu nhìn $B H$ là đường cao tương ứng với cạnh huyền hoặc hình vẽ biểu thị tam giác cân tại $B$ có $B H perp A C$).
      Thực chất, diện tích tam giác $A B C$ là $S_{A B C} = frac(1, 2) A C * H B = frac(1, 2) * 8 * 4 = 16$.
      Đường cao của khối chóp là $S H = 3$.
      Thể tích khối chóp là $V = frac(1, 3) S_{A B C} * S H = frac(1, 3) * 16 * 3 = 16$.
    ],
  )

  #tn(
    [Cho đồ thị của hàm số $y = f(x)$ như hình vẽ bên dưới. Hãy xác định cực tiểu của hàm số $y = f(x)$?],
    (True([$0$]), [$4$], [$(4;0)$], [$1$]),
    fig: cetz.canvas(length: 0.7cm, {
      import cetz.draw: *
      // Trục tọa độ
      line((-2, 0), (6, 0), mark: (end: ">"), name: "x")
      line((0, -1), (0, 5), mark: (end: ">"), name: "y")
      content((5.8, -0.3), $x$)
      content((-0.3, 4.8), $y$)
      content((-0.3, -0.3), $O$)

      // Vẽ đường cong (Hàm bậc 3 có CĐ tại (0,4) và CT tại (4,0))
      bezier((-1.5, -0.5), (0, 4), (-0.8, 2), (-0.5, 4), stroke: 1.2pt + rgb("#1e88e5"))
      bezier((0, 4), (4, 0), (1.5, 4), (2.5, 0), stroke: 1.2pt + rgb("#1e88e5"))
      bezier((4, 0), (5.5, 3), (4.5, 0), (5, 1.5), stroke: 1.2pt + rgb("#1e88e5"))

      // Đánh dấu các mốc toạ độ
      content((-0.3, 4), $4$)
      content((4, -0.3), $4$)
      
      // Đánh dấu điểm cực đại, cực tiểu
      circle((0, 4), radius: 0.05, fill: black)
      circle((4, 0), radius: 0.05, fill: black)
    }),
    fig-pos: "right",
    fig-width: 35%,
    id: "DMTD-TN-009",
    loigiai: [
      #step[Quan sát đồ thị]
      Cực tiểu của hàm số là *giá trị cực tiểu*, tức là tung độ của điểm cực tiểu.
      Đồ thị có một điểm cực tiểu tại $(4; 0)$.
      Do đó, giá trị cực tiểu của hàm số là $y_{C T} = 0$.
    ],
  )

  #tn(
    [Cho hình lập phương $A B C D.A' B' C' D'$. Hỏi độ dài của vectơ $arrow(A B) + arrow(A' D') + arrow(C B) + arrow(B C')$ không bằng đoạn thẳng nào dưới đây?],
    ([$A C'$.], [$B D'$.], True([$B D$.]), [$A' C$.]),
    id: "DMTD-TN-010",
    loigiai: [
      #step[Rút gọn biểu thức vectơ]
      Ta có $arrow(v) = arrow(A B) + arrow(A' D') + arrow(C B) + arrow(B C')$.
      Vì $A B C D.A' B' C' D'$ là hình lập phương nên $arrow(A' D') = arrow(A D)$.
      Thay vào biểu thức: $arrow(v) = arrow(A B) + arrow(A D) + arrow(C B) + arrow(B C') = (arrow(A B) + arrow(C B)) + ...$
      Dùng quy tắc cộng vectơ:
      $arrow(A B) + arrow(C B)$ thay $arrow(C B) = arrow(D A)$, ta có $arrow(A B) + arrow(A D) = arrow(A C)$.
      Lại có $arrow(A C) + arrow(C B) + arrow(B C') = arrow(A C) + arrow(C C') = arrow(A C')$.
      Vậy độ dài của vectơ là $|arrow(A C')| = A C'$.
      #step[Kiểm tra các đáp án]
      Độ dài các đường chéo chính của hình lập phương đều bằng nhau: $A C' = B D' = A' C = B' D$.
      Trong các đáp án, $B D$ là độ dài đường chéo của mặt (chéo của hình vuông đáy), nên $B D != A C'$.
      Vậy độ dài vectơ không bằng $B D$.
    ],
  )

  #tn(
    [Trong không gian $O x y z$, đường thẳng $d: frac(x, 2) = frac(y-1, 3) = frac(z, 1)$ có vectơ chỉ phương là],
    (
      [$arrow(u_1) = (0;1;0)$],
      [$arrow(u_2) = (-2; -3; -1)$],
      True([$arrow(u_3) = (2;3;1)$]),
      [$arrow(u_4) = (-1; -1; -1)$],
    ),
    cols: 2,
    id: "DMTD-TN-011",
    loigiai: [
      #step[Nhận dạng phương trình đường thẳng]
      Đường thẳng có phương trình chính tắc $frac(x-x_0, a) = frac(y-y_0, b) = frac(z-z_0, c)$ nhận $arrow(u) = (a; b; c)$ làm một vectơ chỉ phương.
      Với $d: frac(x, 2) = frac(y-1, 3) = frac(z, 1)$, vectơ chỉ phương là $(2; 3; 1)$.
    ],
  )

  #tn(
    [Họ nguyên hàm của hàm số $f(x) = frac(1, x ln 2) - 2x$ là],
    (
      [$F(x) = ln|x| - x^2 + C$],
      [$F(x) = frac(1, 2)ln|x| - x^2 + C$],
      [$F(x) = log_2|x| - 2x^2 + C$],
      True([$F(x) = log_2|x| - x^2 + C$]),
    ),
    id: "DMTD-TN-012",
    loigiai: [
      #step[Tính nguyên hàm]
      Ta có $integral f(x) d x = integral (frac(1, x ln 2) - 2x) d x = frac(1, ln 2) integral frac(1, x) d x - integral 2x d x$
      $= frac(ln|x|, ln 2) - x^2 + C = log_2|x| - x^2 + C$.
    ],
  )

  #exam-part(
    [Phần II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
    reset-counter: true,
  )

  #ds(
    [Trong mặt phẳng toạ độ $O x y$, cho hàm số $y = (x^2 - 2x + 1)/(x + 1)$ có đồ thị $(C)$. Xét tính đúng sai của các mệnh đề sau:],
    (
      True([Tập xác định của hàm số là $D = RR \\ {-1}$.]),
      True([Hàm số có hai điểm cực trị.]),
      [(C) có tâm đối xứng là $I(-1; -2)$.],
      True([Đường thẳng đi qua hai điểm cực trị của $(C)$ là $y = 2x - 2$.]),
    ),
    // use-table: false,
    id: "DMTD-DS-001",
    loigiai: [
      #ppgiai[
        - *Tập xác định:* Tìm điều kiện xác định của phân thức để suy ra tập xác định $D$.
        - *Đạo hàm & Cực trị:* Tính đạo hàm $y'$, tìm các nghiệm của phương trình $y' = 0$ và lập bảng biến thiên để xác định các điểm cực trị.
        - *Tâm đối xứng:* Phân tích hàm số dưới dạng $y = a x + b + frac(k, x - x_0)$ để tìm tiệm cận đứng $x = -1$ và tiệm cận xiên $y = x - 3$. Giao điểm $I$ của hai tiệm cận này chính là tâm đối xứng.
        - *Đường thẳng qua hai cực trị:* Đối với hàm phân thức bậc hai trên bậc nhất $y = frac(u(x), v(x))$, đường thẳng đi qua hai điểm cực trị có phương trình $y = frac(u'(x), v'(x))$.
      ]

      #step[Xét mệnh đề a)]
      - *Mệnh đề phát biểu:* "Tập xác định của hàm số là $D = RR \\ {-1}$."
      - *Phân tích:* Hàm số $y = frac(x^2 - 2x + 1, x + 1)$ xác định khi và chỉ khi mẫu thức khác $0$:
        $x + 1 != 0 <=> x != -1$.
        Do đó, tập xác định của hàm số là $D = RR \\ {-1}$.
      - *Kết luận:* Mệnh đề a) #text(fill: rgb("#2e7d32"))[*ĐÚNG*].

      #step[Xét mệnh đề b)]
      - *Mệnh đề phát biểu:* "Hàm số có hai điểm cực trị."
      - *Phân tích:* Ta có đạo hàm:
        $
          y' = frac((x^2 - 2x + 1)'(x + 1) - (x^2 - 2x + 1)(x + 1)', (x + 1)^2) \
          = frac((2x - 2)(x + 1) - (x^2 - 2x + 1), (x + 1)^2) \
          = frac((2x^2 - 2) - (x^2 - 2x + 1), (x + 1)^2) \
          = frac(x^2 + 2x - 3, (x + 1)^2).
        $
        Cho $y' = 0 <=> x^2 + 2x - 3 = 0 <=> cases(x = 1, x = -3)$.
        Bảng biến thiên của hàm số:
        #align(center)[
          #bbtv2(
            x-vals: ($-oo$, $-3$, $-1$, $1$, $+oo$),
            d-signs: ($+$, $0$, $-$, "||", $-$, $0$, $+$),
            v-vals: ($-oo$, $-8$, ($-oo$, $+oo$), $0$, $+oo$),
          )
        ]
        Dựa vào bảng biến thiên, ta thấy hàm số đổi dấu khi đi qua hai nghiệm $x = -3$ và $x = 1$, do đó hàm số có hai điểm cực trị.
      - *Kết luận:* Mệnh đề b) #text(fill: rgb("#2e7d32"))[*ĐÚNG*].

      #step[Xét mệnh đề c)]
      - *Mệnh đề phát biểu:* "$(C)$ có tâm đối xứng là $I(-1; -2)$."
      - *Phân tích:* Thực hiện phép chia đa thức tử số cho mẫu số ta được:
        $y = frac(x^2 - 2x + 1, x + 1) = x - 3 + frac(4, x + 1)$.
        - Tiệm cận đứng của đồ thị $(C)$ là đường thẳng $x = -1$.
        - Tiệm cận xiên của đồ thị $(C)$ là đường thẳng $y = x - 3$.

        Giao điểm $I$ của hai tiệm cận này là nghiệm của hệ phương trình:
        $cases(x = -1, y = x - 3) => cases(x = -1, y = -4) => I(-1; -4)$.
        Giao điểm $I(-1; -4)$ chính là tâm đối xứng của đồ thị $(C)$. Do đó phát biểu $I(-1; -2)$ là không chính xác.
      - *Kết luận:* Mệnh đề c) #text(fill: rgb("#c62828"))[*SAI*].

      #step[Xét mệnh đề d)]
      - *Mệnh đề phát biểu:* "Đường thẳng đi qua hai điểm cực trị của $(C)$ là $y = 2x - 2$."
      - *Phân tích:* Đối với hàm phân thức bậc hai trên bậc nhất $y = frac(u(x), v(x))$, phương trình đường thẳng đi qua hai điểm cực trị được tính nhanh bằng công thức:
        $y = frac(u'(x), v'(x)) = frac((x^2 - 2x + 1)', (x + 1)') = frac(2x - 2, 1) = 2x - 2$.
        Vậy phương trình đường thẳng qua hai cực trị là $y = 2x - 2$.
      - *Kết luận:* Mệnh đề d) #text(fill: rgb("#2e7d32"))[*ĐÚNG*].
    ],
  )

#ds(
  [Một ngân hàng tiến hành phân loại rủi ro tín dụng. Sau vòng sơ duyệt $200$ hồ sơ vay vốn, ngân hàng phân loại được $88$ hồ sơ vào nhóm "rất tín nhiệm", $52$ hồ sơ vào nhóm "tín nhiệm thấp", số còn lại được xếp vào nhóm "tín nhiệm trung bình". Theo thống kê từ các đợt giải ngân trước, tỉ lệ khách hàng trả nợ đúng hạn ở nhóm "rất tín nhiệm" là $80%$, ở nhóm "tín nhiệm thấp" là $30%$. Biết rằng tổng tỉ lệ khách hàng trả nợ đúng hạn của toàn bộ số hồ sơ sơ duyệt là $65%$. Chọn ngẫu nhiên một hồ sơ trong các hồ sơ trên.
  ],
  (
    True([Xác suất để chọn được hồ sơ thuộc nhóm "rất tín nhiệm" là $44%$.]),
    [Xác suất khách hàng trả nợ đúng hạn, nếu biết hồ sơ thuộc nhóm "rất tín nhiệm", là $44/125$.],
    [Nếu chọn được hồ sơ thuộc nhóm "tín nhiệm trung bình" thì tỉ lệ trả nợ đúng hạn là $35%$.],
    [Xác suất để chọn được hồ sơ thuộc nhóm "tín nhiệm trung bình", nếu biết khách hàng đó đã trả nợ đúng hạn là $8/25$.]
  ),
  // use-table: false,
  id: "DMTD-DS-002",
  loigiai: [
    #align(center)[

  fig: #cetz.canvas(length: 1.4cm, {
    import cetz.draw: *
    
    // Nút gốc
    content((0, 0), [Hồ sơ vay \ ($200$ bộ)], name: "root", frame: "rect", padding: 5pt, fill: rgb("e3f2fd"), stroke: 0.5pt + rgb("1e88e5"), radius: 3pt)
    
    // Cấu hình style chung
    let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt, radius: 2pt)
    let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
    let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)
    
    // Tầng 1: Phân loại tín nhiệm
    content((3.5, 2.5), ["Rất TN" \ ($A$)], name: "A", ..style1)
    content((3.5, 0), ["TN trung bình" \ ($B$)], name: "B", ..style1)
    content((3.5, -2.5), ["TN thấp" \ ($C$)], name: "C", ..style1)
    
    line("root", "A", mark: (end: ">", fill: black)); content((1.75, 1.55), text(size: 9pt)[$0,44$], ..lbl-style)
    line("root", "B", mark: (end: ">", fill: black)); content((1.75, 0), text(size: 9pt)[$0,30$], ..lbl-style)
    line("root", "C", mark: (end: ">", fill: black)); content((1.75, -1.55), text(size: 9pt)[$0,26$], ..lbl-style)
    
    // Tầng 2: Khả năng trả nợ
    content((7.5, 3.2), [Đúng hạn ($M$)], name: "AM", ..style2)
    content((7.5, 1.8), [Trễ hạn ($overline(M)$)], name: "AnM", ..style2)
    line("A", "AM", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,80$], ..lbl-style)
    line("A", "AnM", mark: (end: ">", fill: black)); content((5.5, 1.9), text(size: 9pt)[$0,20$], ..lbl-style)
    
    content((7.5, 0.7), [Đúng hạn ($M$)], name: "BM", ..style2, stroke: rgb("d32f2f"), fill: rgb("ffebee"))
    content((7.5, -0.7), [Trễ hạn ($overline(M)$)], name: "BnM", ..style2)
    line("B", "BM", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 0.6), text(fill: red, size: 9pt)[$x$], ..lbl-style)
    line("B", "BnM", mark: (end: ">", fill: black)); content((5.5, -0.6), text(size: 9pt)[$1-x$], ..lbl-style)
    
    content((7.5, -1.8), [Đúng hạn ($M$)], name: "CM", ..style2)
    content((7.5, -3.2), [Trễ hạn ($overline(M)$)], name: "CnM", ..style2)
    line("C", "CM", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,30$], ..lbl-style)
    line("C", "CnM", mark: (end: ">", fill: black)); content((5.5, -3.1), text(size: 9pt)[$0,70$], ..lbl-style)
  }),

    ],
    #ppgiai[
      - Bài toán yêu cầu tính xác suất có điều kiện thuận và ngược. Ta sử dụng hệ biến cố đầy đủ.
      - Gọi $A, B, C$ lần lượt là các biến cố hồ sơ được xếp vào nhóm "rất tín nhiệm", "tín nhiệm trung bình", "tín nhiệm thấp".
      - Gọi $M$ là biến cố khách hàng "trả nợ đúng hạn".
      - *Công thức xác suất đầy đủ:* $P(M) = P(A)P(M|A) + P(B)P(M|B) + P(C)P(M|C)$.
      - *Công thức Bayes:* $P(B|M) = (P(B)P(M|B))/(P(M))$.
    ]
    #align(center)[
       #cetz.canvas(length: 1.4cm, {
    import cetz.draw: *
    
    // Nút gốc
    content((0, 0), [Hồ sơ vay \ ($200$ bộ)], name: "root", frame: "rect", padding: 5pt, fill: rgb("e3f2fd"), stroke: 0.5pt + rgb("1e88e5"), radius: 3pt)
    
    // Cấu hình style chung
    let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt, radius: 2pt)
    let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
    let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)
    
    // Tầng 1: Phân loại tín nhiệm
    content((3.5, 2.5), ["Rất TN" \ ($A$)], name: "A", ..style1)
    content((3.5, 0), ["TN trung bình" \ ($B$)], name: "B", ..style1)
    content((3.5, -2.5), ["TN thấp" \ ($C$)], name: "C", ..style1)
    
    line("root", "A", mark: (end: ">", fill: black)); content((1.75, 1.55), text(size: 9pt)[$0,44$], ..lbl-style)
    line("root", "B", mark: (end: ">", fill: black)); content((1.75, 0), text(size: 9pt)[$0,30$], ..lbl-style)
    line("root", "C", mark: (end: ">", fill: black)); content((1.75, -1.55), text(size: 9pt)[$0,26$], ..lbl-style)
    
    // Tầng 2: Khả năng trả nợ
    content((7.5, 3.2), [Đúng hạn ($M$)], name: "AM", ..style2)
    content((7.5, 1.8), [Trễ hạn ($overline(M)$)], name: "AnM", ..style2)
    line("A", "AM", mark: (end: ">", fill: black)); content((5.5, 3.1), text(size: 9pt)[$0,80$], ..lbl-style)
    line("A", "AnM", mark: (end: ">", fill: black)); content((5.5, 1.9), text(size: 9pt)[$0,20$], ..lbl-style)
    
    content((7.5, 0.7), [Đúng hạn ($M$)], name: "BM", ..style2, stroke: rgb("d32f2f"), fill: rgb("ffebee"))
    content((7.5, -0.7), [Trễ hạn ($overline(M)$)], name: "BnM", ..style2)
    line("B", "BM", mark: (end: ">", fill: red), stroke: rgb("d32f2f")); content((5.5, 0.6), text(fill: red, size: 9pt)[$x$], ..lbl-style)
    line("B", "BnM", mark: (end: ">", fill: black)); content((5.5, -0.6), text(size: 9pt)[$1-x$], ..lbl-style)
    
    content((7.5, -1.8), [Đúng hạn ($M$)], name: "CM", ..style2)
    content((7.5, -3.2), [Trễ hạn ($overline(M)$)], name: "CnM", ..style2)
    line("C", "CM", mark: (end: ">", fill: black)); content((5.5, -1.9), text(size: 9pt)[$0,30$], ..lbl-style)
    line("C", "CnM", mark: (end: ">", fill: black)); content((5.5, -3.1), text(size: 9pt)[$0,70$], ..lbl-style)
  })
]
    *Bước 1: Tính các xác suất ban đầu*
    - $P(A) = 88/200 = 0,44$; $P(C) = 52/200 = 0,26$.
    - Do hệ ${A, B, C}$ là hệ đầy đủ nên $P(B) = 1 - (P(A) + P(C)) = 1 - 0,70 = 0,30$.
    - Dữ kiện bài cho: $P(M|A) = 0,8$; $P(M|C) = 0,3$; $P(M) = 0,65$.

    *Bước 2: Xét tính đúng sai của từng mệnh đề*
    - *a)* Xác suất chọn được hồ sơ nhóm "rất tín nhiệm" là $P(A) = 0,44 = 44%$. $=>$ *Đúng*.
    - *b)* Xác suất khách hàng trả nợ đúng hạn khi biết hồ sơ thuộc nhóm "rất tín nhiệm" là $P(M|A) = 0,8$. Mà $44/125 = 0,352 != 0,8$. $=>$ *Sai*.
    - *c)* Áp dụng công thức xác suất đầy đủ:
      $ 0,65 = 0,44 dot 0,8 + 0,3 dot P(M|B) + 0,26 dot 0,3 $
      $ <=> 0,65 = 0,352 + 0,3 dot P(M|B) + 0,078 $
      $ <=> 0,22 = 0,3 dot P(M|B) <=> P(M|B) = 22/30 = 11/15 approx 73,3% != 35%. $
      $=>$ *Sai*.
    - *d)* Áp dụng công thức Bayes để tính xác suất hồ sơ thuộc nhóm "tín nhiệm trung bình" khi biết khách hàng đó trả nợ đúng hạn:
      $ P(B|M) = (P(B) dot P(M|B))/(P(M)) = (0,3 dot 11/15)/(0,65) = (0,22)/(0,65) = 22/65 approx 0,338. $
      Mà $8/25 = 0,32 != 22/65$. $=>$ *Sai*.

    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Minh họa tư duy Bayes
        rect((0,0), (8, 2.5), stroke: 0.5pt, radius: 3pt)
        content((4, 2), text(fill: rgb("d32f2f"))[*Tỉ trọng đóng góp vào $P(M) = 0,65$*])
        line((0, 1.5), (8, 1.5), stroke: 0.5pt)
        
        content((1.5, 0.75), text(size: 9pt)[$P(A)P(M|A)$\ $0,352$])
        line((3, 0), (3, 1.5), stroke: (dash: "dashed"))
        
        content((4.5, 0.75), text(fill: rgb("1e88e5"), size: 9pt)[$P(B)P(M|B)$\ $0,22$])
        line((6, 0), (6, 1.5), stroke: (dash: "dashed"))
        
        content((7, 0.75), text(size: 9pt)[$P(C)P(M|C)$\ $0,078$])
      })
    ]

    #meo[Ghi nhớ sơ đồ Bayes bằng hình chữ nhật tỉ trọng: Xác suất hậu nghiệm $P(B|M)$ chính là phần diện tích của nhóm $B$ chiếm trong tổng diện tích của toàn bộ hình chữ nhật $M$.]
  ]
  )



  #ds(
    [Một hạt chuyển động dọc theo trục $O y$. Vị trí của hạt (đơn vị: mét) tại thời điểm $t$ (giây) được xác định bởi $y(t) = 30t e^(-0,5t)$ (m), (với $t >= 0$). Xét tính đúng sai của các mệnh đề sau:],
    (
      True([Vận tốc xuất phát của hạt tại thời điểm $t = 0$ là $30$ m/s.]),
      True(
        [Trong suốt quá trình chuyển động, hạt chỉ đổi chiều chuyển động đúng một lần duy nhất tại thời điểm $t = 2$ (giây).],
      ),
      True(
        [Khoảng cách xa nhất mà hạt đạt được so với gốc tọa độ $O$ là $22,1$ mét (tính theo đơn vị mét và làm tròn kết quả đến hàng phần mười).],
      ),
      True([Tổng quãng đường hạt đi được không quá $44,15$ mét.]),
    ),
    id: "DMTD-DS-003",
    loigiai: [
      #ppgiai[
        - *Vận tốc:* Đạo hàm bậc nhất của phương trình chuyển động $y(t)$ chính là vận tốc $v(t) = y'(t)$.
        - *Đổi chiều chuyển động:* Hạt đổi chiều khi và chỉ khi vận tốc $v(t)$ đổi dấu (nghĩa là $v(t) = 0$ và đi qua điểm đó $v(t)$ đổi từ dương sang âm hoặc ngược lại).
        - *Khoảng cách xa nhất:* Lập bảng biến thiên của hàm $y(t)$ trên nửa khoảng $[0; +oo)$ để tìm giá trị lớn nhất.
        - *Quãng đường:* Tổng quãng đường bằng tổng các trị tuyệt đối của độ dời trên từng khoảng đơn điệu.
      ]

      #step[Xét mệnh đề a)]
      - *Mệnh đề phát biểu:* "Vận tốc xuất phát của hạt tại thời điểm $t = 0$ là $30$ m/s."
      - *Phân tích:*
        Vận tốc của hạt tại thời điểm $t$ là đạo hàm của hàm vị trí:
        $ v(t) = y'(t) = (30t e^(-0,5t))' = 30 e^(-0,5t) + 30t dot (-0,5) e^(-0,5t) = 30 e^(-0,5t) (1 - 0,5t). $
        Vận tốc xuất phát của hạt tại thời điểm $t = 0$ là:
        $ v(0) = 30 e^(-0,5 dot 0) (1 - 0,5 dot 0) = 30 "m/s". $
      - *Kết luận:* Mệnh đề a) #text(fill: rgb("#2e7d32"))[*ĐÚNG*].

      #step[Xét mệnh đề b)]
      - *Mệnh đề phát biểu:* "Trong suốt quá trình chuyển động, hạt chỉ đổi chiều chuyển động đúng một lần duy nhất tại thời điểm $t = 2$ (giây)."
      - *Phân tích:*
        - Hạt đổi chiều chuyển động tại những thời điểm $t >= 0$ mà vận tốc $v(t)$ bằng $0$ and đổi dấu qua điểm đó.
        - Ta giải phương trình vận tốc bằng $0$:
          $ v(t) = 0 <=> 30 e^(-0,5t) (1 - 0,5t) = 0 <=> 1 - 0,5t = 0 <=> t = 2. $
        - Ta lập bảng xét dấu của vận tốc $v(t)$:
          - Với $0 <= t < 2$, ta có $v(t) > 0$, do đó hạt chuyển động theo chiều dương.
          - Với $t > 2$, ta có $v(t) < 0$, do đó hạt chuyển động theo chiều âm.
        - Vì vận tốc đổi dấu từ dương sang âm tại $t = 2$, nên hạt đổi chiều chuyển động đúng một lần duy nhất tại thời điểm $t = 2$ (giây).
      - *Kết luận:* Mệnh đề b) #text(fill: rgb("#2e7d32"))[*ĐÚNG*].

      #align(center)[
        #bbt-opt(
          x-vals: ($0$, $2$, $+oo$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $60/e$, $0$),
          is-min: false,
        )
      ]

      #step[Xét mệnh đề c)]
      - *Mệnh đề phát biểu:* "Khoảng cách xa nhất mà hạt đạt được so với gốc tọa độ $O$ là $22,1$ mét (tính theo đơn vị mét và làm tròn kết quả đến hàng phần mười)."
      - *Phân tích:*
        - Khoảng cách từ hạt đến gốc tọa độ $O$ tại thời điểm $t >= 0$ là $|y(t)|$. Vì $y(t) >= 0$ với mọi $t >= 0$, khoảng cách này chính là $y(t)$.
        - Dựa vào bảng biến thiên của $y(t)$ ở trên, giá trị lớn nhất của $y(t)$ trên khoảng $[0; +oo)$ đạt được tại thời điểm $t = 2$:
          $ y_max = y(2) = 30 dot 2 dot e^(-0,5 dot 2) = frac(60, e) approx 22,07 "m". $
        - Làm tròn kết quả đến hàng phần mười, ta thu được khoảng cách xa nhất là $22,1$ mét.
      - *Kết luận:* Mệnh đề c) #text(fill: rgb("#2e7d32"))[*ĐÚNG*].

      #align(center)[
        #cetz.canvas({
          import cetz.draw: *

          // Trục tọa độ ngang (Oy)
          line((-1.0, 0), (8.0, 0), mark: (end: ">"), stroke: 1.5pt + rgb("#37474f"), name: "axis")
          content((8.2, 0), $y\ ("mét")$)

          // O(0)
          line((0, -0.15), (0, 0.15), stroke: 1.2pt + rgb("#37474f"))
          content((0, -0.5), $O(0)$)

          // y_max
          line((6, -0.15), (6, 0.15), stroke: 1.2pt + rgb("#37474f"))
          content((6, -0.5), $y_max = 60/e approx 22","1$)

          // Điểm t=2
          circle((6, 0), radius: 0.08, fill: rgb("#ffb300"), stroke: none)
          content((6, 0.4), text(size: 9pt, weight: "bold", fill: rgb("#ffb300"))[$t=2$])

          // Đường cong tiến (đi ra xa)
          bezier(
            (0, 0.15), 
            (5.9, 0.15), 
            (2, 1.5), (4, 1.5),
            stroke: (paint: rgb("#2e7d32"), thickness: 1.5pt),
            mark: (end: ">", fill: rgb("#2e7d32"))
          )
          content((3, 1.3), text(fill: rgb("#2e7d32"), weight: "bold")[Đi lên: $0 <= t <= 2$])

          // Đường cong lùi (đi về gần 0)
          bezier(
            (6, -0.15), 
            (0.8, -0.15), 
            (4, -1.5), (2, -1.5),
            stroke: (paint: rgb("#c62828"), thickness: 1.5pt),
            mark: (end: ">", fill: rgb("#c62828"))
          )
          content((3, -1.3), text(fill: rgb("#c62828"), weight: "bold")[Đổi chiều, tiệm cận về $0$: $t > 2$])
          
          // Mũi tên tiệm cận
          line((0.8, -0.15), (0.1, -0.15), stroke: (paint: rgb("#c62828"), thickness: 1pt, dash: "dashed"), mark: (end: ">", fill: rgb("#c62828")))
        })
      ]

      #step[Xét mệnh đề d)]
      - *Mệnh đề phát biểu:* "Tổng quãng đường hạt đi được không quá $44,15$ mét."
      - *Phân tích:*
        - Từ thời điểm $t = 0$ đến $t = 2$, hạt chuyển động theo chiều dương từ vị trí ban đầu $y(0) = 0$ đến vị trí xa nhất $y(2) = frac(60, e)$. Quãng đường đi được trong giai đoạn này là:
          $ S_1 = |y(2) - y(0)| = frac(60, e). $
        - Từ thời điểm $t = 2$ trở đi ($t -> +oo$), hạt đổi chiều chuyển động sang chiều âm và tiệm cận về vị trí gốc tọa độ do $lim_(t -> +oo) y(t) = lim_(t -> +oo) frac(30t, e^(0,5t)) = 0$. Quãng đường đi được trong giai đoạn này là:
          $ S_2 = |lim_(t -> +oo) y(t) - y(2)| = |0 - frac(60, e)| = frac(60, e). $
        - Tổng quãng đường hạt đã đi được là:
          $ S = S_1 + S_2 = frac(60, e) + frac(60, e) = frac(120, e) approx 44,1455 "m". $
        - Vì $44,1455 <= 44,15$, tổng quãng đường hạt đi được không vượt quá $44,15$ mét.
      - *Kết luận:* Mệnh đề d) #text(fill: rgb("#2e7d32"))[*ĐÚNG*].
    ],
  )

  #ds(
    [Trong không gian $O x y z$ có đơn vị dài trên mỗi trục là centimet, có một quả cầu nhỏ $(S)$ có bán kính bằng $25$ cm, ở thời điểm ban đầu $t_0 = 0$ tâm của nó ở vị trí $I_0(240; 180; 0)$ và có một khối cầu to $(S')$ có tâm $J(0;0;0)$ và bán kính $R' = 180$.
      Quả cầu nhỏ bắt đầu chuyển động tịnh tiến với tốc độ bằng $v = 12$ cm/s theo hướng vectơ $arrow(u) = (-1; -2; -1)$. Hỏi trong các mệnh đề dưới đây, mệnh đề nào đúng, mệnh đề nào sai?],
    (
      True([$I_0 J = 300$.]),
      True(
        [Tâm của quả cầu $(S)$ chuyển động trên đường thẳng có phương trình $cases(x = 240 - t, y = 180 - 2t, z = -t)$.],
      ),
      True([Quả cầu nhỏ va chạm vào quả cầu to ngay khi khoảng cách hai tâm của hai quả cầu bằng $205$ cm.]),
      [Tính từ lúc bắt đầu chuyển động đến khi quả cầu nhỏ va chạm vào quả cầu to thì hết một khoảng thời gian là $14$ giây (tính theo giây và làm tròn đến hàng đơn vị).],
    ),
    id: "DMTD-DS-004",
    loigiai: [
      #ppgiai[
        - *Mệnh đề a:* Sử dụng công thức khoảng cách giữa hai điểm trong không gian $O x y z$: $d = sqrt((x_B-x_A)^2 + (y_B-y_A)^2 + (z_B-z_A)^2)$.
        - *Mệnh đề b:* Quỹ đạo chuyển động tịnh tiến của một vật là đường thẳng đi qua vị trí ban đầu và nhận hướng chuyển động làm vectơ chỉ phương. Từ đó lập phương trình tham số.
        - *Mệnh đề c:* Sự va chạm (tiếp xúc ngoài) xảy ra khi khoảng cách giữa tâm hai khối cầu bằng đúng tổng hai bán kính của chúng: $d = R + R'$.
        - *Mệnh đề d:* Từ tốc độ và hướng đã cho, tìm vectơ vận tốc $arrow(v)$. Tọa độ tâm quả cầu chuyển động tại thời điểm $t$ là $I = I_0 + t dot arrow(v)$. Giải phương trình $I J = R + R'$ để tìm thời gian $t$.
      ]

      #step[Xét mệnh đề a)]
      - Tâm của khối cầu to $(S')$ là gốc tọa độ $J(0; 0; 0)$. Vị trí ban đầu của tâm quả cầu nhỏ $(S)$ là $I_0(240; 180; 0)$.
      - Khoảng cách ban đầu giữa hai tâm là:
        $ I_0 J = sqrt((240 - 0)^2 + (180 - 0)^2 + (0 - 0)^2) = sqrt(57600 + 32400) = sqrt(90000) = 300 "cm". $
      - *Kết luận:* Mệnh đề a) #text(fill: rgb("#2e7d32"))[*ĐÚNG*].

      #step[Xét mệnh đề b)]
      - Quả cầu nhỏ $(S)$ bắt đầu chuyển động từ điểm $I_0(240; 180; 0)$ và chuyển động tịnh tiến theo hướng của vectơ chỉ phương $arrow(u) = (-1; -2; -1)$.
      - Do đó, quỹ đạo chuyển động của tâm quả cầu $(S)$ là đường thẳng đi qua điểm $I_0$ và nhận $arrow(u)$ làm vectơ chỉ phương. Phương trình tham số của đường thẳng này là:
        $ cases(x = 240 - t, y = 180 - 2t, z = -t) quad (t in RR). $
      - *Kết luận:* Mệnh đề b) #text(fill: rgb("#2e7d32"))[*ĐÚNG*].

      #step[Xét mệnh đề c)]
      - Quả cầu nhỏ $(S)$ có bán kính $R = 25 "cm"$, khối cầu to $(S')$ có bán kính $R' = 180 "cm"$.
      - Hai khối cầu bắt đầu va chạm (tiếp xúc ngoài) ngay khi khoảng cách giữa hai tâm $I$ và $J$ đúng bằng tổng các bán kính của chúng:
        $ I J = R + R' = 25 + 180 = 205 "cm". $
      - *Kết luận:* Mệnh đề c) #text(fill: rgb("#2e7d32"))[*ĐÚNG*].

      #align(center)[
        #cetz.canvas({
          import cetz.draw: *

          // Khối cầu to (J)
          let R_J = 2.5
          circle((0, 0), radius: R_J, name: "J_sphere", stroke: 1pt + black, fill: rgb("e3f2fd").darken(5%))
          // Xích đạo của J tạo cảm giác 3D
          arc((-R_J, 0), start: 180deg, stop: 360deg, radius: (R_J, R_J * 0.3), stroke: 0.5pt + rgb("1e88e5"))
          arc((R_J, 0), start: 0deg, stop: 180deg, radius: (R_J, R_J * 0.3), stroke: (
            dash: "dashed",
            paint: rgb("1e88e5"),
            thickness: 0.5pt,
          ))

          content((0, 0), $J$, anchor: "north-east", padding: 0.1)
          circle((0, 0), radius: 0.05, fill: black)

          // Quả cầu nhỏ tại vị trí ban đầu (I_0)
          let I0_x = 6.5
          let I0_y = 2.5
          let R_I = 0.6
          circle((I0_x, I0_y), radius: R_I, name: "I_sphere", stroke: 1pt + black, fill: rgb("fbe9e7").darken(5%))
          // Xích đạo của I_0 tạo cảm giác 3D
          arc((I0_x - R_I, I0_y), start: 180deg, stop: 360deg, radius: (R_I, R_I * 0.3), stroke: 0.5pt + rgb("d84315"))
          arc((I0_x + R_I, I0_y), start: 0deg, stop: 180deg, radius: (R_I, R_I * 0.3), stroke: (
            dash: "dashed",
            paint: rgb("d84315"),
            thickness: 0.5pt,
          ))

          content((I0_x, I0_y), $I_0$, anchor: "south-west", padding: 0.1)
          circle((I0_x, I0_y), radius: 0.05, fill: black)

          // Đường nối I_0 và J
          line((0, 0), (I0_x, I0_y), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
          content((I0_x / 2 + 0.3, I0_y / 2), $I_0 J = 300$, anchor: "north-west")

          // Quỹ đạo chuyển động và vector vận tốc
          let I1_x = I0_x - 2.5
          let I1_y = I0_y - 1.2
          line((I0_x, I0_y), (I1_x, I1_y), mark: (end: ">"), stroke: 1.5pt + red)
          content((I0_x - 1, I0_y - 0.4), text(fill: red, $arrow(v)$), anchor: "south-east")

          // Vị trí va chạm (I)
          let Ic_x = 2.8
          let Ic_y = 0.8
          circle((Ic_x, Ic_y), radius: R_I, stroke: (dash: "dashed", paint: gray, thickness: 0.8pt), fill: none)
          circle((Ic_x, Ic_y), radius: 0.03, fill: gray)
          content((Ic_x, Ic_y), $I$, anchor: "north-west", padding: 0.1)

          // Khoảng cách lúc va chạm
          line((0, 0), (Ic_x, Ic_y), stroke: (dash: "dashed", paint: black, thickness: 0.5pt))
          content((Ic_x / 2 - 0.2, Ic_y / 2 + 0.2), $R + R' = 205$, anchor: "south-east", angle: 16deg)
        })
      ]

      #step[Xét mệnh đề d)]
      - Vectơ vận tốc $arrow(v)$ của quả cầu nhỏ cùng hướng với $arrow(u) = (-1; -2; -1)$ và có độ lớn bằng tốc độ $v = 12 "cm/s"$.
      - Ta có độ dài $|arrow(u)| = sqrt((-1)^2 + (-2)^2 + (-1)^2) = sqrt(6)$.
        Do đó, vectơ vận tốc là:
        $
          arrow(v) = v dot frac(arrow(u), |arrow(u)|) = 12 dot frac((-1; -2; -1), sqrt(6)) = (-2sqrt(6); -4sqrt(6); -2sqrt(6)).
        $
      - Tại thời điểm $t$ (giây), tọa độ tâm $I$ là $I = I_0 + t dot arrow(v)$:
        $ I(240 - 2sqrt(6)t; 180 - 4sqrt(6)t; -2sqrt(6)t). $
      - Bình phương khoảng cách giữa hai tâm tại thời điểm $t$ là:
        $
          I J^2 & = (240 - 2sqrt(6)t)^2 + (180 - 4sqrt(6)t)^2 + (-2sqrt(6)t)^2 \
                & = (57600 - 960sqrt(6)t + 24t^2) + (32400 - 1440sqrt(6)t + 96t^2) + 24t^2 \
                & = 144t^2 - 2400sqrt(6)t + 90000.
        $
      - Hai quả cầu va chạm khi $I J = 205 <=> I J^2 = 205^2 = 42025$.
        Ta được phương trình:
        $ 144t^2 - 2400sqrt(6)t + 90000 = 42025 <=> 144t^2 - 2400sqrt(6)t + 47975 = 0. $
      - Giải phương trình bậc hai trên với điều kiện $t >= 0$, ta được hai nghiệm:
        $t_1 approx 11,29 "giây"$ và $t_2 approx 29,54 "giây"$.
      - Vì hai quả cầu tiếp xúc và xảy ra va chạm ngay tại thời điểm gặp nhau đầu tiên, nên thời gian từ lúc bắt đầu đến khi va chạm là $t = t_1 approx 11,29$ giây. Làm tròn đến hàng đơn vị ta được $11$ giây. Phát biểu cho rằng thời gian va chạm là $14$ giây là sai.
      - *Kết luận:* Mệnh đề d) #text(fill: rgb("#c62828"))[*SAI*].
    ],
  )

  #exam-part([Phần III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], reset-counter: true)

  #tln(
    [Cho hình chóp $S.A B C D$ có đáy là hình chữ nhật với $A B = 8, A D = 6$ và số đo góc nhị diện $[D, S B, A]$ bằng $60^degree$. Giả sử $S A perp (A B C D)$. Hãy tính thể tích khối chóp $S.A B C D$ _(không làm tròn ở các phép tính trung gian và làm tròn kết quả cuối cùng đến hàng phần mười)_?],
    [$61,5$],
    id: "DMTD-TLN-001",
    answer-value: "61,5",
    accepted-answers: ("61,5", "61.5"),
    tolerance: 0,
    loigiai: [
      #ppgiai[
        - *Thiết lập hệ trục toạ độ:* Gắn hình chóp vào hệ trục toạ độ không gian $O x y z$ với gốc toạ độ $O equiv A$. Từ giả thiết $S A perp (A B C D)$ và $A B C D$ là hình chữ nhật, ta chọn các trục $O x, O y, O z$ lần lượt chứa các cạnh $A B, A D, A S$.
        - *Toạ độ hoá các đỉnh:* Gọi $S A = h\ (h > 0)$, xác định toạ độ các đỉnh $A, B, D, S$ theo hệ trục đã chọn.
        - *Tính toán góc nhị diện:* Xác định vectơ pháp tuyến của hai mặt phẳng $(S A B)$ và $(S B D)$. Sử dụng công thức tính góc giữa hai mặt phẳng để giải phương trình tìm chiều cao $h$.
        - *Tính thể tích khối chóp:* $V = frac(1, 3) S_("đáy") dot h$.
      ]

      #step[Chọn hệ trục toạ độ và toạ độ hoá các điểm]
      Gắn hình chóp vào hệ trục toạ độ $O x y z$ với:
      - Gốc toạ độ $O equiv A(0; 0; 0)$.
      - Tia $O x$ trùng với tia $A B$. Vì $A B = 8$ nên $B(8; 0; 0)$.
      - Tia $O y$ trùng với tia $A D$. Vì $A D = 6$ nên $D(0; 6; 0)$.
      - Tia $O z$ trùng với tia $A S$ (do $S A perp (A B C D)$). Gọi chiều cao $S A = h > 0$, ta có $S(0; 0; h)$.

      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Đáy ABCD (hình bình hành biểu diễn hình chữ nhật)
          line((0, 0), (4, 0), (6, 1.5), (2, 1.5), close: true, name: "base", stroke: (dash: "dashed", paint: gray))
          line((0, 0), (4, 0), (6, 1.5))
          line((0, 0), (2, 1.5), (6, 1.5), stroke: (dash: "dashed"))
          content((-0.2, -0.2), $A (equiv O)$)
          content((4.2, -0.2), $B$)
          content((6.2, 1.7), $C$)
          content((1.8, 1.7), $D$)

          // Chiều cao SA
          line((0, 0), (0, 4), name: "SA")
          content((-0.2, 4.2), $S$)

          // Các cạnh bên
          line((0, 4), (4, 0)) // SB
          line((0, 4), (6, 1.5)) // SC
          line((0, 4), (2, 1.5), stroke: (dash: "dashed")) // SD

          // Trục toạ độ kéo dài
          line((4, 0), (5.5, 0), mark: (end: ">"), stroke: (paint: blue, thickness: 1pt))
          content((5.7, 0), text(fill: blue)[$x$])
          line((2, 1.5), (3.0, 2.25), mark: (end: ">"), stroke: (dash: "dashed", paint: blue, thickness: 1pt))
          content((3.2, 2.45), text(fill: blue)[$y$])
          line((0, 4), (0, 5), mark: (end: ">"), stroke: (paint: blue, thickness: 1pt))
          content((0, 5.2), text(fill: blue)[$z$])

          // Kí hiệu vuông góc
          line((0, 0.3), (0.3, 0.3), (0.3, 0)) // SA vuông AB
        })
      ]

      #step[Xác định phương trình các mặt phẳng]
      - Mặt phẳng $(S A B)$ là mặt phẳng toạ độ $(O x z)$, có phương trình $y = 0$, do đó nó nhận vectơ đơn vị trên trục $O y$ làm vectơ pháp tuyến: $arrow(n)_1 = (0; 1; 0)$.
      - Mặt phẳng $(S B D)$ đi qua ba điểm có toạ độ trên ba trục tọa độ là $B(8; 0; 0), D(0; 6; 0)$ và $S(0; 0; h)$. Áp dụng phương trình mặt phẳng theo đoạn chắn, ta có:
        $ frac(x, 8) + frac(y, 6) + frac(z, h) = 1 <=> 3h x + 4h y + 24 z - 24h = 0. $
        Từ phương trình trên, một vectơ pháp tuyến của $(S B D)$ là $arrow(n)_2 = (3h; 4h; 24)$.

      #step[Khai thác giả thiết góc nhị diện]
      - Theo giả thiết, số đo góc nhị diện $[D, S B, A]$ bằng $60^degree$. Vì hình chiếu vuông góc của $D$ lên mặt phẳng $(S A B)$ là $A$ nên góc nhị diện này là góc nhọn và bằng đúng góc giữa hai mặt phẳng $(S A B)$ và $(S B D)$.
      - Áp dụng công thức góc giữa hai mặt phẳng:
        $ |cos 60^degree| = frac(|arrow(n)_1 dot arrow(n)_2|, |arrow(n)_1| dot |arrow(n)_2|) $
        $
          <=> frac(1, 2) = frac(|0 dot 3h + 1 dot 4h + 0 dot 24|, sqrt(0^2 + 1^2 + 0^2) dot sqrt((3h)^2 + (4h)^2 + 24^2))
        $
        $ <=> frac(1, 2) = frac(4h, sqrt(9h^2 + 16h^2 + 576)) quad ("do " h > 0) $
        $ <=> sqrt(25h^2 + 576) = 8h. $
      - Bình phương hai vế phương trình:
        $ 25h^2 + 576 = 64h^2 <=> 39h^2 = 576 <=> h^2 = frac(576, 39) = frac(192, 13). $
        Suy ra chiều cao $h = sqrt(frac(192, 13)) = frac(8sqrt(3), sqrt(13))$.

      #step[Tính thể tích khối chóp $S.A B C D$]
      - Diện tích đáy (hình chữ nhật $A B C D$) là:
        $ S_(A B C D) = A B dot A D = 8 dot 6 = 48. $
      - Thể tích khối chóp $S.A B C D$ là:
        $
          V = frac(1, 3) S_(A B C D) dot h = frac(1, 3) dot 48 dot frac(8sqrt(3), sqrt(13)) = frac(128sqrt(3), sqrt(13)) approx 61,464.
        $
      - Làm tròn kết quả đến hàng phần mười, ta được thể tích khối chóp là $61,5$.
    ],
  )

  #tln(
    [Trong không gian $O x y z$ có đơn vị dài trên mỗi trục là kilômét với mặt đất là mặt phẳng $(O x y)$, hai trạm phát sóng có mặt cầu mô tả ranh giới phủ sóng lần lượt là $(S_1): (x-1)^2 + (y-4)^2 + (z-0,4)^2 = 20$ và $(S_2): (x-3)^2 + (y+2)^2 + (z-0,3)^2 = 16$. Hãy xác định theo đơn vị kilômét vuông diện tích phần phủ sóng chung của hai trạm phát sóng này trên mặt đất (không làm tròn ở các phép tính trung gian và làm tròn kết quả cuối cùng đến hàng phần mười)?],
    [$8,1$],
    id: "DMTD-TLN-002",
    answer-value: "8,1",
    accepted-answers: ("8,1", "8.1"),
    tolerance: 0,
    loigiai: [
      #ppgiai[
        - *Bước 1: Phân tích không gian:* Mặt đất là mặt phẳng tọa độ $(O x y)$ với phương trình $z = 0$. Ranh giới phủ sóng của mỗi trạm trên mặt đất là giao tuyến của mặt cầu phát sóng với mặt phẳng $z = 0$, tạo thành các hình tròn.
        - *Bước 2: Tìm bán kính vùng phủ sóng:* Thay $z = 0$ vào phương trình mặt cầu để xác định phương trình, tâm và bán kính của hai đường tròn giao tuyến $(C_1), (C_2)$.
        - *Bước 3: Tính diện tích phần chung:* Áp dụng công thức tính diện tích giao của hai đường tròn (tổng diện tích hai hình quạt trừ đi diện tích phần tứ giác). Sử dụng Định lý Côsin để tìm các góc ở tâm tương ứng.
      ]

      #step[Bước 1: Xác định vùng phủ sóng trên mặt đất]
      Mặt đất tương ứng với mặt phẳng có phương trình $z = 0$.
      - Giao tuyến của mặt cầu $(S_1)$ với mặt phẳng $z = 0$ là đường tròn $(C_1)$ thể hiện vùng phủ sóng của trạm 1. Thay $z=0$ vào phương trình $(S_1)$:
        $ (x-1)^2 + (y-4)^2 + (0 - 0,4)^2 = 20 <=> (x-1)^2 + (y-4)^2 = 19,84. $
        Đường tròn $(C_1)$ có tâm $I_1(1; 4)$ và bán kính $R_1 = sqrt(19","84)$.

      - Tương tự, giao tuyến của $(S_2)$ với mặt phẳng $z = 0$ là đường tròn $(C_2)$. Thay $z=0$ vào phương trình $(S_2)$:
        $ (x-3)^2 + (y+2)^2 + (0 - 0,3)^2 = 16 <=> (x-3)^2 + (y+2)^2 = 15,91. $
        Đường tròn $(C_2)$ có tâm $I_2(3; -2)$ và bán kính $R_2 = sqrt(15","91)$.

      #step[Bước 2: Vị trí tương đối và mô hình 3D]
      Khoảng cách giữa tâm hai vùng phủ sóng trên mặt đất $I_1$ và $I_2$ là:
      $ d = I_1 I_2 = sqrt((3-1)^2 + (-2-4)^2) = sqrt(2^2 + (-6)^2) = sqrt(40) "km". $
      Vì $|R_1 - R_2| < d < R_1 + R_2$, hai đường tròn trên mặt đất cắt nhau tại hai điểm phân biệt, giả sử là $A$ và $B$. Phần diện tích phủ sóng chung chính là phần giao của $(C_1)$ và $(C_2)$.

      #align(center)[
        #cetz.canvas({
          import cetz.draw: *

          // Mặt phẳng Oxy (mặt đất)
          fill(rgb("#f0f0f0"))
          stroke(gray)
          line((-5, -2), (5, -2), (7, 3), (-3, 3), close: true, name: "plane")
          content((-4, -1.5), text(fill: rgb("#555555"), size: 0.9em)[Mặt đất $(O x y)$])

          // Vùng phủ sóng C1
          fill(rgb("#ff999960")) // Đỏ nhạt có độ trong suốt
          stroke(red)
          circle((-1.5, 0), radius: (2.5, 1), name: "C1")

          // Vùng phủ sóng C2
          fill(rgb("#99ccff60")) // Xanh nhạt có độ trong suốt
          stroke(blue)
          circle((2, 0), radius: (2, 0.8), name: "C2")

          // Khối cầu S1
          fill(none)
          stroke((paint: red, thickness: 1.2pt, dash: "dashed"))
          circle((-1.5, 0.8), radius: 2.7)

          // Khối cầu S2
          stroke((paint: blue, thickness: 1.2pt, dash: "dashed"))
          circle((2, 0.6), radius: 2.15)

          // Tâm khối cầu (Trạm phát sóng)
          fill(black)
          stroke(none)
          circle((-1.5, 0.8), radius: 0.05)
          content((-1.5, 1.1), text(fill: red, weight: "bold")[$O_1$])

          circle((2, 0.6), radius: 0.05)
          content((2, 0.9), text(fill: blue, weight: "bold")[$O_2$])

          // Tâm đường tròn giao tuyến
          circle((-1.5, 0), radius: 0.05)
          content((-1.5, -0.3), text(fill: red)[$I_1$])

          circle((2, 0), radius: 0.05)
          content((2, -0.3), text(fill: blue)[$I_2$])

          // Cột ăng ten / Khoảng cách từ tâm cầu xuống mặt đất
          stroke((dash: "dashed", paint: gray, thickness: 1.5pt))
          line((-1.5, 0.8), (-1.5, 0)) // O1 - I1
          line((2, 0.6), (2, 0)) // O2 - I2

          // Đường nối I1 - I2
          stroke((dash: "dotted", paint: black))
          line((-1.5, 0), (2, 0))

          // Chú thích khối cầu
          content((-4.5, 2.5), text(fill: red)[$(S_1)$])
          content((4.5, 2), text(fill: blue)[$(S_2)$])

          // Giao điểm A, B của C1 và C2
          fill(black)
          stroke(none)
          circle((0.45, 0.64), radius: 0.05)
          content((0.45, 0.9), $A$)

          circle((0.45, -0.64), radius: 0.05)
          content((0.45, -0.9), $B$)

          // Nối I1, I2 với A, B
          stroke((paint: gray, thickness: 0.8pt))
          line((-1.5, 0), (0.45, 0.64))
          line((-1.5, 0), (0.45, -0.64))
          line((2, 0), (0.45, 0.64))
          line((2, 0), (0.45, -0.64))

          // Dây cung AB
          stroke((dash: "dashed", paint: black))
          line((0.45, 0.64), (0.45, -0.64))
        })
      ]

      #step[Bước 3: Tính diện tích phần phủ sóng chung]
      Phần diện tích giao nhau tạo bởi hai cung tròn. Diện tích này bằng tổng diện tích hai hình quạt tròn tương ứng của $(C_1)$ và $(C_2)$ trừ đi diện tích tứ giác tạo bởi hai tâm và hai giao điểm $I_1 A I_2 B$.

      Xét tam giác $I_1 A I_2$ có $I_1 A = R_1$, $I_2 A = R_2$ và $I_1 I_2 = d$. Áp dụng Định lý Côsin, ta có:
      $
        cos(hat(A I_1 I_2)) = frac(I_1 A^2 + I_1 I_2^2 - I_2 A^2, 2 dot I_1 A dot I_1 I_2) = frac(19","84 + 40 - 15","91, 2 dot sqrt(19","84) dot sqrt(40)) approx 0","7797.
      $
      Suy ra góc $hat(A I_1 I_2) approx 0,6764$ rad.
      Do tính đối xứng qua trục $I_1 I_2$, góc ở tâm của hình quạt $(C_1)$ là $alpha_1 = 2 hat(A I_1 I_2) approx 1,3528$ rad.

      Tương tự đối với góc tại $I_2$:
      $
        cos(hat(A I_2 I_1)) = frac(I_2 A^2 + I_1 I_2^2 - I_1 A^2, 2 dot I_2 A dot I_1 I_2) = frac(15","91 + 40 - 19","84, 2 dot sqrt(15","91) dot sqrt(40)) approx 0","7149.
      $
      Suy ra góc $hat(A I_2 I_1) approx 0,7744$ rad.
      Góc ở tâm của hình quạt $(C_2)$ là $alpha_2 = 2 hat(A I_2 I_1) approx 1,5488$ rad.

      - Diện tích hình quạt tròn $(C_1)$:
        $ S_1 = 1/2 R_1^2 alpha_1 approx 1/2 dot 19,84 dot 1,3528 = 13,42 "km"^2. $
      - Diện tích hình quạt tròn $(C_2)$:
        $ S_2 = 1/2 R_2^2 alpha_2 approx 1/2 dot 15,91 dot 1,5488 = 12,32 "km"^2. $
      - Diện tích tứ giác $I_1 A I_2 B$ (gồm hai tam giác bằng nhau):
        $ S_(I_1 A I_2 B) = 2 dot S_(I_1 A I_2) = 2 dot (1/2 dot I_1 A dot I_1 I_2 dot sin(hat(A I_1 I_2))). $
        Với $sin(hat(A I_1 I_2)) = sqrt(1 - cos^2(hat(A I_1 I_2))) approx sqrt(1 - 0","7797^2) approx 0","6261$, ta được:
        $ S_(I_1 A I_2 B) approx sqrt(19","84) dot sqrt(40) dot 0,6261 approx 17,64 "km"^2. $

      Vậy diện tích phần phủ sóng chung của hai trạm là:
      $ S = S_1 + S_2 - S_(I_1 A I_2 B) = 13,42 + 12,32 - 17,64 = 8,10 "km"^2. $

      Làm tròn kết quả đến hàng phần mười, diện tích vùng phủ sóng chung là *$8,1$* $"km"^2$.
    ],
  )

  #tln(
    [Chiếc bình bằng thuỷ tinh có mặt bên ngoài được tạo thành bằng cách quay hình phẳng $(H)$ (phần tô màu trong hình vẽ) quanh trục $A B$. Hình $(H)$ nằm trong hình chữ nhật $A B C D$, giới hạn bởi các đoạn thẳng $A M, B P$, cung tròn $M N$ (có tâm $I$ là trung điểm của đoạn thẳng $A E$ nằm trên trục $A B$) và cung parabol $N P$ với $P$ là đỉnh. Biết rằng $A B = 60$ cm, $A M = 20$ cm, $B E = 20$ cm. Tiếp tuyến của cung tròn và cung parabol tại điểm tiếp giáp $N$ là trùng nhau. Biết tổng thể tích của thuỷ tinh đã dùng là 2400 cm³. Hãy xác định sức chứa nước tối đa theo đơn vị lít của chiếc bình (không làm tròn ở các phép tính trung gian và làm tròn kết quả cuối cùng đến hàng phần mười)?

      #align(center)[
        #grid(
          columns: 2,
          gutter: 30pt,
          align(center + horizon)[
            #cetz.canvas({
          import cetz.draw: *

          // Tô màu hình phẳng (H)
          merge-path(close: true, fill: rgb("e0e0e0").lighten(30%), stroke: none, {
            line((0, 0), (0, 2))
            arc((0, 2), start: 135deg, stop: 45deg, radius: 2.8284)
            bezier((4, 2), (6, 1), (5, 1))
            line((6, 1), (6, 0))
          })

          // Hình chữ nhật ABCD
          line((0, 0), (6, 0), (6, 3), (0, 3), close: true, stroke: (dash: "dashed", paint: gray))
          content((-0.2, -0.2), $A$)
          content((6.2, -0.2), $B$)
          content((6.2, 3.2), $C$)
          content((-0.2, 3.2), $D$)

          // Biên của hình (H)
          line((0, 0), (6, 0), stroke: 1.5pt)
          line((0, 0), (0, 2), stroke: 1.5pt)
          arc((0, 2), start: 135deg, stop: 45deg, radius: 2.8284, stroke: 1.5pt)
          bezier((4, 2), (6, 1), (5, 1), stroke: 1.5pt)
          line((6, 1), (6, 0), stroke: 1.5pt)

          // Các điểm đặc biệt
          circle((0, 2), radius: 0.05, fill: black)
          content((-0.3, 2), $M$)

          circle((4, 2), radius: 0.05, fill: black)
          content((4.2, 2.3), $N$)

          circle((6, 1), radius: 0.05, fill: black)
          content((6.3, 1), $P$)

          circle((2, 0), radius: 0.05, fill: black)
          content((2, -0.3), $I$)

          circle((4, 0), radius: 0.05, fill: black)
          content((4, -0.3), $E$)

          // Đường dóng
          line((4, 2), (4, 0), stroke: (dash: "dashed", paint: gray))
          line((2, 0), (2, 2.8284), stroke: (dash: "dashed", paint: gray))

          content((2, 1.2), text(fill: rgb("424242"))[$(H)$])
        })
          ],
          align(center + horizon)[
            #cetz.canvas(length: 0.8cm,{
          import cetz.draw: *

          // Vẽ khối tròn xoay (3D)

          // Đáy bình (tại x = 0)
          circle((0, 0), radius: (0.4, 2), stroke: 1pt, fill: rgb("e0f7fa").darken(5%))

          // Biên trên
          arc((0, 2), start: 135deg, stop: 45deg, radius: 2.8284, stroke: 1.5pt)
          bezier((4, 2), (6, 1), (5, 1), stroke: 1.5pt)

          // Biên dưới
          arc((0, -2), start: 225deg, stop: 315deg, radius: 2.8284, stroke: 1.5pt)
          bezier((4, -2), (6, -1), (5, -1), stroke: 1.5pt)

          // Các đường elip tạo cảm giác 3D
          // Tại vị trí phình to nhất (x = 2)
          arc((2, 2.8284), start: 90deg, stop: 270deg, radius: (0.5, 2.8284), stroke: (dash: "dashed", paint: gray))
          arc((2, -2.8284), start: 270deg, stop: 450deg, radius: (0.5, 2.8284), stroke: gray)

          // Tại vị trí cổ bình (x = 4)
          arc((4, 2), start: 90deg, stop: 270deg, radius: (0.3, 2), stroke: (dash: "dashed", paint: gray))
          arc((4, -2), start: 270deg, stop: 450deg, radius: (0.3, 2), stroke: gray)

          // Miệng bình (tại x = 6)
          circle((6, 0), radius: (0.2, 1), stroke: 1.5pt, fill: white)

          // Trục quay Ox
          line((-1, 0), (7, 0), stroke: (dash: "dash-dotted", paint: red), mark: (end: ">"))
          content((7, -0.3), text(fill: red)[$x$])

          // Các điểm trên trục
          circle((0, 0), radius: 0.05, fill: black)
          content((-0.6, -0.3), $A(0)$)

          circle((6, 0), radius: 0.05, fill: black)
          content((6, -0.4), $B(60)$)

          content((3, -3.3), text(fill: blue)[Mặt ngoài bình thuỷ tinh khi quay quanh trục $O x$])
        })
          ]
        )
      ]
    ],
    [$93,1$],
    id: "DMTD-TLN-003",
    answer-value: "93,1",
    accepted-answers: ("93,1", "93.1"),
    tolerance: 0,
    loigiai: [
      #ppgiai[
        - *Bước 1: Lập hệ trục tọa độ.* Gắn trục $O x$ trùng với trục quay $A B$, gốc tọa độ tại $A$. Xác định tọa độ các điểm quan trọng.
        - *Bước 2: Tìm phương trình đường cong tạo hình.* Biên giới hạn $(H)$ gồm cung tròn $M N$ và cung parabol $N P$. Sử dụng điều kiện tiếp xúc (đạo hàm bằng nhau tại điểm nối) để xác định phương trình.
        - *Bước 3: Tính toán thể tích.* Sử dụng công thức tính thể tích vật thể tròn xoay $V = pi integral_a^b f^2(x) d x$ để tính tổng thể tích ngoài, sau đó trừ đi thể tích thủy tinh để tìm sức chứa.
      ]

      #align(center)[
        #cetz.canvas({
          import cetz.draw: *

          // Vẽ khối tròn xoay (3D)

          // Đáy bình (tại x = 0)
          circle((0, 0), radius: (0.4, 2), stroke: 1pt, fill: rgb("e0f7fa").darken(5%))

          // Biên trên
          arc((0, 2), start: 135deg, stop: 45deg, radius: 2.8284, stroke: 1.5pt)
          bezier((4, 2), (6, 1), (5, 1), stroke: 1.5pt)

          // Biên dưới
          arc((0, -2), start: 225deg, stop: 315deg, radius: 2.8284, stroke: 1.5pt)
          bezier((4, -2), (6, -1), (5, -1), stroke: 1.5pt)

          // Các đường elip tạo cảm giác 3D
          // Tại vị trí phình to nhất (x = 2)
          arc((2, 2.8284), start: 90deg, stop: 270deg, radius: (0.5, 2.8284), stroke: (dash: "dashed", paint: gray))
          arc((2, -2.8284), start: 270deg, stop: 450deg, radius: (0.5, 2.8284), stroke: gray)

          // Tại vị trí cổ bình (x = 4)
          arc((4, 2), start: 90deg, stop: 270deg, radius: (0.3, 2), stroke: (dash: "dashed", paint: gray))
          arc((4, -2), start: 270deg, stop: 450deg, radius: (0.3, 2), stroke: gray)

          // Miệng bình (tại x = 6)
          circle((6, 0), radius: (0.2, 1), stroke: 1.5pt, fill: white)

          // Trục quay Ox
          line((-1, 0), (7, 0), stroke: (dash: "dash-dotted", paint: red), mark: (end: ">"))
          content((7, -0.3), text(fill: red)[$x$])

          // Các điểm trên trục
          circle((0, 0), radius: 0.05, fill: black)
          content((-0.6, -0.3), $A(0)$)

          circle((6, 0), radius: 0.05, fill: black)
          content((6, -0.4), $B(60)$)

          content((3, -3.3), text(fill: blue)[Mặt ngoài bình thuỷ tinh khi quay quanh trục $O x$])
        })
      ]

      #step[Thiết lập hệ trục tọa độ]
      Chọn hệ trục tọa độ $O x y$ sao cho gốc $O$ trùng với $A$, tia $O x$ trùng với tia $A B$. Dựa vào giả thiết, ta có:
      - $A(0; 0)$ và $B(60; 0)$.
      - Điểm $M$ thuộc trục tung, do $A M = 20$ nên $M(0; 20)$.
      - Vì $B E = 20$ nên $A E = 60 - 20 = 40 => E(40; 0)$.
      - Tâm $I$ là trung điểm $A E$ nên $I(20; 0)$.

      #step[Phương trình đường sinh tạo bởi cung tròn $M N$]
      Cung tròn có tâm $I(20; 0)$ và đi qua $M(0; 20)$ nên bán kính là:
      $ R = I M = sqrt((0 - 20)^2 + (20 - 0)^2) = 20sqrt(2) $
      Phương trình đường tròn tâm $I$ là $(x - 20)^2 + y^2 = 800$.
      Suy ra phương trình cung $M N$ (phần nằm trên trục hoành) là:
      $ y = f_1(x) = sqrt(800 - (x - 20)^2) quad "với" x in [0; 40] $
      Tại $x = 40$, ta tính được tung độ điểm $N$ là $y_N = sqrt(800 - 20^2) = 20 => N(40; 20)$.
      Hệ số góc của tiếp tuyến với cung tròn tại $N$:
      $ f'_1(x) = frac(-(x - 20), sqrt(800 - (x - 20)^2)) => f'_1(40) = -1 $

      #step[Phương trình đường sinh tạo bởi cung parabol $N P$]
      Để mặt đáy của chiếc bình bằng phẳng, tiếp tuyến tại điểm $P$ phải song song với trục $O x$, nghĩa là đỉnh của parabol nằm trên đường thẳng $x = 60$. Ta gọi phương trình parabol là: $y = f_2(x) = a(x - 60)^2 + c$.
      Đạo hàm: $f'_2(x) = 2a(x - 60)$.
      Vì tiếp tuyến của parabol và cung tròn tại điểm nối $N(40; 20)$ trùng nhau nên:
      $
        cases(
          f_2(40) = 20,
          f'_2(40) = f'_1(40) = -1
        ) <=> cases(
          a(-20)^2 + c = 20,
          2a(-20) = -1
        ) <=> cases( 
          a = 1/40, 
          c = 10 
        ) 
      $
      Vậy phương trình cung parabol là: $y = f_2(x) = 1/40(x - 60)^2 + 10$ với $x in [40; 60]$.
      #step[Tính thể tích và sức chứa của bình]
      Tổng thể tích không gian bên trong và vỏ thủy tinh (thể tích ngoài) là khối tròn xoay sinh ra bởi $(H)$:
      $ V_("ngoài") = pi integral_0^40 f_1^2(x) d x + pi integral_40^60 f_2^2(x) d x $
      - Tính phần 1: 
      $ V_1 = pi integral_0^40 [800 - (x - 20)^2] d x = frac(80000pi, 3) $
      - Tính phần 2: 
      $ V_2 = pi integral_40^60 [1/40(x - 60)^2 + 10]^2 d x = frac(11200pi, 3) $
      Cộng lại ta được:
      $ V_("ngoài") = V_1 + V_2 = 30400pi approx 95504,42 "cm"^3 $
      Sức chứa nước tối đa (thể tích phần rỗng) bằng tổng thể tích ngoài trừ đi thể tích vỏ thủy tinh:
      $ V_("nước") = V_("ngoài") - V_("thủy tinh") = 30400pi - 2400 approx 93104,42 "cm"^3 $
      Đổi đơn vị: $93104,42 "cm"^3 approx 93,1 "lít"$.

      Vậy sức chứa nước tối đa của bình xấp xỉ *$93,1$ lít*.
    ],
  )

  #tln(
    [Trong mặt phẳng $O x y$ có đơn vị dài trên mỗi trục là mét, cho hàm số $y = frac(x^2 - 6x + 15, x - 2)$ có đồ thị $(C)$. Từ một điểm $M in C$ một vật di chuyển đến tiệm cận đứng của $(C)$ tại điểm $H$ theo hướng vuông góc với tiệm cận đứng này, từ $H$ ta trở về $M$, tiếp sau đó di chuyển từ $M$ đến gặp tiệm cận xiên của $(C)$ tại điểm $K$ theo hướng vuông góc với tiệm cận xiên này. Hãy tính tổng quãng đường nhỏ nhất mà vật đã di chuyển theo đơn vị mét _(không làm tròn ở các phép tính trung gian và làm tròn kết quả cuối cùng đến hàng phần mười)_?],
    [$6,3$],
    id: "DMTD-TLN-004",
    answer-value: "6,3",
    accepted-answers: ("6,3", "6.3"),
    tolerance: 0,
    loigiai: [
      #ppgiai[
        - *Phân tích hàm số:* Chia đa thức để đưa hàm số về dạng $y = a x + b + frac(c, x - x_0)$. Từ đó chỉ ra phương trình tiệm cận đứng $Delta_1$ và tiệm cận xiên $Delta_2$.
        - *Lập hàm khoảng cách:* Gọi $M(m; y_m) in (C)$. Tính các khoảng cách $d_1 = M H$ (từ $M$ đến $Delta_1$) và $d_2 = M K$ (từ $M$ đến $Delta_2$).
        - *Tối ưu hóa quãng đường:* Phân tích quỹ đạo di chuyển ($M -> H -> M -> K$) để lập tổng quãng đường $S = 2 M H + M K$. Sử dụng bất đẳng thức AM-GM (Cauchy) cho hai số dương để tìm giá trị nhỏ nhất.
      ]

      #step[Xác định phương trình các tiệm cận của đồ thị (C)]
      Thực hiện phép chia đa thức tử số cho mẫu số, ta viết lại hàm số:
      $ y = frac(x^2 - 6x + 15, x - 2) = frac(x(x - 2) - 4(x - 2) + 7, x - 2) = x - 4 + frac(7, x - 2). $
      Từ dạng trên, ta xác định được hai đường tiệm cận của đồ thị $(C)$:
      - Tiệm cận đứng $Delta_1: x = 2 <=> x - 2 = 0$.
      - Tiệm cận xiên $Delta_2: y = x - 4 <=> x - y - 4 = 0$.

      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Hệ trục tọa độ
          line((-1, 0), (9, 0), mark: (end: ">"), name: "x")
          content((9, -0.3), $x$)
          line((0, -4), (0, 7), mark: (end: ">"), name: "y")
          content((-0.3, 7), $y$)
          content((-0.3, -0.3), $O$)

          // Tiệm cận đứng x = 2
          line((2, -3.5), (2, 6.5), stroke: (dash: "dashed", paint: red), name: "D1")
          content((1.5, 6), text(fill: red)[$Delta_1$])

          // Tiệm cận xiên y = x - 4
          line((-0.5, -4.5), (8.5, 4.5), stroke: (dash: "dashed", paint: blue), name: "D2")
          content((7.5, 2.8), text(fill: blue)[$Delta_2$])

          // Vẽ đồ thị C (nhánh x > 2) bằng vòng lặp điểm chính xác
          let pts = ()
          for i in range(22, 90) {
            let x_val = i / 10
            let y_val = x_val - 4 + 7 / (x_val - 2)
            if y_val <= 6.5 and y_val >= -3 {
              pts.push((x_val, y_val))
            }
          }
          line(..pts, stroke: (paint: black, thickness: 1.2pt))
          content((8, 5.5), $(C)$)

          // Điểm M(4, 3.5), H(2, 3.5), K(5.75, 1.75)
          let M = (4, 3.5)
          let H = (2, 3.5)
          let K = (5.75, 1.75)

          // Quãng đường M <-> H (có mũi tên 2 chiều)
          line(M, H, mark: (end: ">", start: ">"), stroke: (paint: green, thickness: 1.2pt))
          content((3, 3.9), text(fill: green)[$2 M H$])

          // Quãng đường M -> K
          line(M, K, mark: (end: ">"), stroke: (paint: orange, thickness: 1.2pt))
          content((5.1, 2.8), text(fill: orange)[$M K$])

          // Chấm tròn cho các điểm
          circle(M, radius: 0.05, fill: black)
          content((4.2, 3.8), $M$)
          circle(H, radius: 0.05, fill: green)
          content((1.6, 3.5), $H$)
          circle(K, radius: 0.05, fill: orange)
          content((6.2, 1.5), $K$)

          // Ký hiệu góc vuông tại H
          line((2, 3.3), (2.2, 3.3), (2.2, 3.5), stroke: green)
          // Ký hiệu góc vuông tại K (tính toán dựa trên vector (1, -1) và (1, 1))
          line((5.55, 1.95), (5.35, 1.75), (5.55, 1.55), stroke: orange)
        })
      ]

      #step[Biểu diễn khoảng cách từ M đến hai tiệm cận]
      Lấy điểm $M(m; y_m) in (C)$ với $m > 2$ (do vật di chuyển được đến cả 2 tiệm cận). Tọa độ của $M$ là:
      $ M(m; m - 4 + frac(7, m - 2)). $
      - Khoảng cách từ $M$ đến tiệm cận đứng $Delta_1: x - 2 = 0$ là:
        $ d_1 = M H = |m - 2| = m - 2 quad ("do" m > 2). $
      - Khoảng cách từ $M$ đến tiệm cận xiên $Delta_2: x - y - 4 = 0$ là:
        $
          d_2 = M K = frac(|m - y_m - 4|, sqrt(1^2 + (-1)^2)) = frac(|m - (m - 4 + frac(7, m - 2)) - 4|, sqrt(2)) = frac(7, sqrt(2) (m - 2)).
        $

      #step[Tìm tổng quãng đường di chuyển nhỏ nhất]
      Phân tích quỹ đạo di chuyển của vật:
      1. Đi từ $M$ đến $H$: quãng đường $d_1$.
      2. Quay trở lại từ $H$ về $M$: quãng đường $d_1$.
      3. Đi từ $M$ đến $K$: quãng đường $d_2$.

     #step[Tìm tổng quãng đường di chuyển nhỏ nhất bằng đạo hàm]
    Do đó, tổng quãng đường vật đã di chuyển là $S = 2 d_1 + d_2$. Thay các biểu thức vào, ta xét hàm số $S(m)$ với $m > 2$:
    $ S(m) = 2 (m - 2) + frac(7, sqrt(2) (m - 2)). $
    Đạo hàm của hàm số $S(m)$ trên khoảng $(2; +oo)$ là:
    $ S'(m) = 2 - frac(7, sqrt(2) (m - 2)^2). $
    Cho $S'(m) = 0$, ta có:
    $ 2 - frac(7, sqrt(2) (m - 2)^2) = 0 <=> (m - 2)^2 = frac(7, 2sqrt(2)). $
    Vì điều kiện $m > 2$ nên ta nhận nghiệm:
    $ m = 2 + sqrt(frac(7, 2sqrt(2))). $
    Xét dấu đạo hàm, ta thấy $S'(m) < 0$ khi $m in (2; 2 + sqrt(frac(7, 2sqrt(2))))$ và $S'(m) > 0$ khi $m > 2 + sqrt(frac(7, 2sqrt(2)))$. 
    Hàm số đổi dấu từ âm sang dương nên đạt giá trị nhỏ nhất tại $m = 2 + sqrt(frac(7, 2sqrt(2)))$.
    Thay giá trị này vào hàm $S(m)$, ta được tổng quãng đường nhỏ nhất là:
    $ S_min = 2 sqrt(frac(7, 2sqrt(2))) + frac(7, sqrt(2) dot sqrt(frac(7, 2sqrt(2)))) = 2 sqrt(7sqrt(2)) approx 6,293. $
    Vậy tổng quãng đường nhỏ nhất mà vật đã di chuyển xấp xỉ *$6,3$* mét.
    ],
  )

  #tln(
  id: "KT-DL-10",
  [Một khu resort nghỉ dưỡng cao cấp có tổng cộng 50 phòng suite. Ban quản lý nhận thấy: nếu giá thuê mỗi đêm chốt ở mức 5 triệu đồng/phòng thì toàn bộ resort sẽ kín chỗ. Tuy nhiên, cứ tăng giá thêm 0,2 triệu đồng/phòng thì sẽ có 1 phòng bị bỏ trống do vượt quá ngân sách của khách.
   
  Mặt khác, chi phí vận hành resort biến động theo số lượng phòng được thuê: Nếu đón từ 36 phòng trở lên, chi phí là 3 triệu đồng/phòng. Nếu từ 35 phòng trở xuống, chi phí giảm còn 1,5 triệu đồng/phòng. Hỏi ban quản lý nên áp dụng số lần tăng giá là bao nhiêu để thu về lợi nhuận ròng mỗi đêm cao nhất?],
  [16],
  answer-value: "16",
  accepted-answers: ("16",),
  tolerance: 0,
  loigiai: [
    #ppgiai[
      - Gọi $x$ là số lần tăng giá. Lập hàm lợi nhuận $L(x) = "Doanh thu" - "Chi phí"$.
      - *Cốt lõi:* Lập bảng phân tích để thấy rõ mốc "gãy" chi phí xảy ra khi số phòng giảm qua mốc 35 (tương ứng $x = 15$), từ đó thiết lập hàm $L(x)$ phân nhánh.
      - Tìm giá trị lớn nhất của từng nhánh parabol và so sánh.
    ]

    #step[Phân tích biến số và lập bảng điều kiện chi phí]
    Gọi $x$ ($x in NN$) là số lần tăng giá. Ta có các đại lượng sau:
    - Giá thuê 1 phòng: $5 + 0,2x$ (triệu đồng).
    - Số phòng có khách: $50 - x$ (phòng).
    - Tổng doanh thu: $(50 - x)(5 + 0,2x)$.

    Mốc thay đổi chi phí xảy ra khi lượng khách giảm từ 36 phòng xuống 35 phòng. Ta lập bảng phân tích:
    
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center + horizon,
        fill: (_, row) => if row == 0 { rgb("e6e6e6") } else { none },
        [*Số lần tăng giá* ($x$)], [*Số phòng có khách* ($50 - x$)], [*Chi phí 1 phòng*], [*Tổng chi phí*],
        [$0 <= x <= 14$], [Từ $36$ đến $50$ phòng \ (Ngưỡng đắt đỏ)], [$3$ triệu], [$3(50 - x)$],
        [$15 <= x <= 50$], [Từ $0$ đến $35$ phòng \ (Ngưỡng tiết kiệm)], [$1,5$ triệu], [$1,5(50 - x)$]
      )
    ]

    #step[Xây dựng hàm lợi nhuận đa công thức]
    Từ bảng trên, lợi nhuận $L(x) = "Doanh thu" - "Tổng chi phí"$ được biểu diễn dưới dạng hàm đa công thức:
    $ L(x) = cases(
      (50-x)(5 + 0.2x) - 3(50-x) = -0.2 x^2 + 8 x + 100 & "nếu" 0 <= x <= 14,
      (50-x)(5 + 0.2x) - 1.5(50-x) = -0.2 x^2 + 6.5 x + 175 & "nếu" 15 <= x <= 50
    ) $

    #step[Tìm giá trị lớn nhất trên từng nhánh]
    - *Nhánh 1 ($0 <= x <= 14$):*
      Hoành độ đỉnh parabol là $x = (-8)/(2 dot (-0,2)) = 20 quad (20 in.not [0; 14])$.
      Vì hệ số $a < 0$, hàm đồng biến trên đoạn $[0; 14]$, đạt lớn nhất tại biên phải $x = 14$:
      $ L_1(14) = -0,2(14)^2 + 8(14) + 100 = 172,8 $ (triệu đồng).

    - *Nhánh 2 ($15 <= x <= 50$):*
      Hoành độ đỉnh parabol là $x = (-6,5)/(2 dot (-0,2)) = 16,25 quad (16,25 in [15; 50])$.
      Vì $x in NN$, ta kiểm tra hai số nguyên gần đỉnh $16,25$ nhất là $16$ và $17$:
      $ L_2(16) = 227,8 $ (triệu đồng); $ quad L_2(17) = 227,7 $ (triệu đồng).
      Lợi nhuận lớn nhất của nhánh 2 là $227,8$ triệu đồng, đạt tại $x = 16$.

    #step[Kết luận]
    So sánh giá trị lớn nhất của hai nhánh, ta thấy $227,8 > 172,8$. 
    Vậy lợi nhuận ròng cao nhất đạt được khi ban quản lý áp dụng số lần tăng giá là $16$ lần.
  ]
)
  
  #tln(
    [Trong công tác chuẩn bị cho Kỳ thi Tốt nghiệp THPT năm 2027, một phần mềm quản lý thi tiến hành xếp chỗ cho 20 thí sinh vào một phòng thi chuẩn. Phòng thi chuẩn gồm 20 bàn được xếp thành 4 dãy, đánh số thứ tự từ 1 đến 4, mỗi dãy gồm 5 bàn (mỗi bàn đúng một thí sinh).

    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        let dx = 2.5
        let dy = 1.2
        for col in (1, 2, 3, 4) {
          content(((col - 1) * dx + 1, 5 * dy + 0.2), text(weight: "bold", fill: rgb("003366"))[Dãy #col])
          for row in (1, 2, 3, 4, 5) {
             let x = (col - 1) * dx
             let y = (5 - row) * dy
             rect((x, y), (x + 2, y + 0.8), radius: 0.15, fill: rgb("f0f8ff"), stroke: 1pt + rgb("4da6ff"))
             content((x + 1, y + 0.4), text(size: 9pt, fill: rgb("333333"))[Bàn #row])
          }
        }
      })
    ]

    Trong số 20 thí sinh này, có 9 thí sinh chọn thi môn Vật Lý và 11 thí sinh chọn thi môn Lịch Sử (trong ca thi này mỗi thí sinh chỉ làm một bài thi là Vật Lí hoặc Lịch Sử). Biết rằng sau khi sắp xếp, phần mềm không tạo ra bất kỳ dãy bàn nào chỉ toàn thí sinh thi môn Lịch Sử.
      Gọi $p$ là xác suất để dãy bàn số 1 có đúng 3 thí sinh thi môn Lịch Sử. Hãy tính $2027 p$ (làm tròn kết quả cuối cùng đến hàng đơn vị)?],
    [$832$],
    id: "DMTD-TLN-006",
    answer-value: "832",
    accepted-answers: ("832",),
    tolerance: 0,
    loigiai: [
      #ppgiai[
        - *Phân tích điều kiện:* Không có dãy nào chỉ toàn học sinh Sử nghĩa là mỗi dãy bàn phải có ít nhất 1 học sinh Vật Lý. Có 9 học sinh Vật Lý xếp vào 4 dãy bàn (mỗi dãy 5 bàn).
        - *Thiết lập phương trình:* Gọi $x_i$ là số lượng học sinh Vật Lý xếp vào dãy bàn thứ $i$ ($i = 1, 2, 3, 4$). Ta có phương trình: $x_1 + x_2 + x_3 + x_4 = 9$ với $1 <= x_i <= 5$.
        - *Không gian mẫu và biến cố:* Tính số lượng cách xếp chọn vị trí bàn học cho học sinh Vật Lý trên mỗi dãy. Không gian mẫu là tổng số cách xếp thỏa mãn điều kiện $1 <= x_i <= 5$. Biến cố là số cách xếp khi dãy 1 có đúng 3 học sinh Sử, tức có đúng $5 - 3 = 2$ học sinh Vật Lý ($x_1 = 2$).
      ]

      #step[Xác định các điều kiện toán học]
      Mỗi dãy bàn (gồm 5 bàn) không được chỉ toàn học sinh Sử, đồng nghĩa với việc mỗi dãy bàn phải có ít nhất một học sinh Vật Lý.
      Gọi $x_i$ là số lượng học sinh Vật Lý được xếp vào dãy bàn thứ $i$ ($i = 1, 2, 3, 4$).
      Vì có tổng cộng 9 học sinh Vật Lý và mỗi dãy bàn có tối đa 5 bàn, ta có phương trình:
      $ x_1 + x_2 + x_3 + x_4 = 9 quad "với" quad 1 <= x_i <= 5 quad (x_i in NN). $
      #luuy[Để tính xác suất, ta chỉ cần xét số cách chọn vị trí (bàn) cho 9 học sinh Vật Lý trên 20 bàn học của phòng thi. Hoán vị học sinh Vật Lý ($9!$) và học sinh Sử ($11!$) sẽ triệt tiêu ở cả tử và mẫu của phân số tính xác suất.]

      #step[Tính số phần tử của không gian mẫu thu hẹp]
      Ta phân tích số cách chọn vị trí cho học sinh Vật Lý ứng với các cấu hình bộ số $(x_1, x_2, x_3, x_4)$ thỏa mãn phương trình, thể hiện qua bảng sau:

      #align(center)[
        #table(
          inset: 9pt,
          columns: (auto, auto, auto, auto, auto),
          align: (center, center, center, left, right),
          [*TH*], [*Bộ số $(x_1, x_2, x_3, x_4)$*], [*Số hoán vị*], [*Cách chọn vị trí trên dãy*], [*Số cách xếp*],
          [1], [Hoán vị của $(5, 2, 1, 1)$], [$4!/2! = 12$], [$C_5^5 C_5^2 C_5^1 C_5^1 = 250$], [$3.000$],
          [2], [Hoán vị của $(4, 3, 1, 1)$], [$4!/2! = 12$], [$C_5^4 C_5^3 C_5^1 C_5^1 = 1.250$], [$15.000$],
          [3], [Hoán vị của $(4, 2, 2, 1)$], [$4!/2! = 12$], [$C_5^4 C_5^2 C_5^2 C_5^1 = 2.500$], [$30.000$],
          [4], [Hoán vị của $(3, 3, 2, 1)$], [$4!/2! = 12$], [$C_5^3 C_5^3 C_5^2 C_5^1 = 5.000$], [$60.000$],
          [5], [Hoán vị của $(3, 2, 2, 2)$], [$4!/3! = 4$],  [$C_5^3 C_5^2 C_5^2 C_5^2 = 10.000$], [$40.000$]
        )
      ]

      Tổng số cách xếp thỏa mãn điều kiện (không gian mẫu) là:
      $ n(Omega) = 3.000 + 15.000 + 30.000 + 60.000 + 40.000 = 148.000 "cách". $

      #step[Tính số cách xếp thỏa mãn biến cố]
      Biến cố cần tính: "Dãy bàn số 1 có đúng 3 học sinh Sử", nghĩa là dãy bàn số 1 phải có đúng $5 - 3 = 2$ học sinh Vật Lý. Do đó ta có $x_1 = 2$.
      
      Khi đó số học sinh Vật Lý ở 3 dãy còn lại phải thỏa mãn:
      $ x_2 + x_3 + x_4 = 9 - 2 = 7 quad "với" quad 1 <= x_i <= 5 quad (i = 2, 3, 4). $
      
      Ta cũng liệt kê các bộ số $(x_2, x_3, x_4)$ thỏa mãn bằng bảng:
      
      #align(center)[
        #table(
          inset: 9pt,
          columns: (auto, auto, auto, auto, auto),
          align: (center, center, center, left, right),
          [*TH*], [*Bộ số $(x_2, x_3, x_4)$*], [*Số hoán vị*], [*Cách chọn vị trí trên dãy*], [*Số cách xếp*],
          [1], [Hoán vị của $(5, 1, 1)$], [$3!/2! = 3$], [$C_5^5 C_5^1 C_5^1 = 25$], [$75$],
          [2], [Hoán vị của $(4, 2, 1)$], [$3! = 6$], [$C_5^4 C_5^2 C_5^1 = 250$], [$1.500$],
          [3], [Hoán vị của $(3, 3, 1)$], [$3!/2! = 3$], [$C_5^3 C_5^3 C_5^1 = 500$], [$1.500$],
          [4], [Hoán vị của $(3, 2, 2)$], [$3!/2! = 3$], [$C_5^3 C_5^2 C_5^2 = 1.000$], [$3.000$]
        )
      ]

      Tổng số cách chọn cho 3 dãy bàn còn lại là:
      $ 75 + 1.500 + 1.500 + 3.000 = 6.075 "cách". $
      
      Đồng thời, số cách chọn 2 vị trí cho học sinh Vật Lý ở dãy bàn 1 là $C_5^2 = 10$ cách.
      Vậy số cách xếp thỏa mãn biến cố là:
      $ n(A) = C_5^2 dot 6.075 = 10 dot 6.075 = 60.750 "cách". $

      #step[Tính xác suất p và giá trị 2027p]
      Xác suất cần tính là:
      $ p = frac(n(A), n(Omega)) = frac(60.750, 148.000) = frac(243, 592) approx 0,410473. $
      Từ đó ta có:
      $ 2027p = 2027 dot frac(243, 592) approx 832,028. $
      Làm tròn kết quả đến hàng đơn vị, ta được $832$.
    ],
  )
]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()

  // ═══════════════════════════════════════════════════════════
  // BẢNG ĐÁP ÁN (3 loại — tự động)
  // ═══════════════════════════════════════════════════════════
  // pagebreak() 
  // print-answer-key()
}


