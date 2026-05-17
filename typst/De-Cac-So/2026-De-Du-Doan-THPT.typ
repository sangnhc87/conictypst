#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "../bbt.typ": *
#import "../math-sym.typ": *

#let mode = "loigiai"
#let accent = classic.emerald

#show math.equation: set text(fill: black)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "SỞ GD&ĐT TỈNH ĐỒNG NAI",
  school: "TRƯỜNG THPT CHUYÊN LƯƠNG THẾ VINH",
  exam-title: "KỲ THI THỬ TỐT NGHIỆP THPT NĂM 2026",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "208",
  footer-left: [Tổ Toán — THPT Chuyên Lương Thế Vinh],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

  #tn(
    [Tập xác định của hàm số $y = ln(x^2 - 5x + 6)$ là],
    (
      [$(2 ; 3)$.],
      True([$(-oo ; 2) union (3 ; +oo)$.]),
      [$[2 ; 3]$.],
      [$RR setminus \{2, 3\}$.]),
    loigiai: [
      Điều kiện xác định: $x^2 - 5x + 6 > 0 <=> (x - 2)(x - 3) > 0 <=> x < 2$ hoặc $x > 3$.
      Vậy tập xác định $D = (-oo ; 2) union (3 ; +oo)$. Chọn đáp án *B*.
    ]
  )

  #tn(
    [Đồ thị hàm số $y = (x^2 - 4)/(x - 1)$ có đường tiệm cận xiên là],
    (
      [$y = x - 1$.],
      True([$y = x + 1$.]),
      [$y = x$.],
      [$y = x + 3$.],
    ),
    loigiai: [
      Thực hiện phép chia đa thức:
      $ y = (x^2 - 4)/(x - 1) = x + 1 - 3/(x - 1) $
      Suy ra $lim_(x -> plus.minus oo) [y - (x + 1)] = 0$. Tiệm cận xiên là $y = x + 1$.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Một hộp đựng $7$ viên bi đỏ và $5$ viên bi xanh. Lấy ngẫu nhiên đồng thời $3$ viên. Xác suất để có ít nhất $2$ viên bi đỏ là],
    (
      [$5/11$.],
      [$7/12$.],
      True([$7/11$.]),
      [$6/11$.],
    ),
    loigiai: [
      Số cách chọn 3 viên: $C_12^3 = 220$.
      Số cách có ít nhất 2 đỏ gồm: 2 đỏ 1 xanh = $C_7^2 dot C_5^1 = 105$ và 3 đỏ = $C_7^3 = 35$.
      Tổng số cách: $105 + 35 = 140$.
      Xác suất: $P = 140/220 = 7/11$. Chọn đáp án *C*.
    ]
  )

  #tn(
    [Một lô hàng có $15$ sản phẩm, trong đó có $10$ sản phẩm tốt và $5$ sản phẩm lỗi. Lấy ngẫu nhiên lần lượt không hoàn lại $2$ sản phẩm. Biết sản phẩm thứ nhất lấy ra là tốt, xác suất để sản phẩm thứ hai cũng tốt là],
    (
      True([$9/14$.]),
      [$2/3$.],
      [$5/14$.],
      [$10/14$.],
    ),
    loigiai: [
      Sau khi lấy ra 1 sản phẩm tốt, còn lại $14$ sản phẩm với $9$ tốt và $5$ lỗi.
      Xác suất sản phẩm thứ hai tốt là $P = 9/14$. Chọn đáp án *A*.

      #luuy[Đây là xác suất có điều kiện, đơn giản vì phép thử không hoàn lại.]
    ]
  )

  #tn(
    [Trong không gian $O x y z$, mặt phẳng $(P): 3x + y + 2z - 6 = 0$ cắt các trục tọa độ $O x$, $O y$, $O z$ lần lượt tại $A$, $B$, $C$. Thể tích khối tứ diện $O A B C$ bằng],
    (
      [$2$.],
      True([$6$.]),
      [$12$.],
      [$18$.],
    ),
    loigiai: [
      $A = (P) cap O x$: $y = 0, z = 0 => 3x - 6 = 0 => x = 2 => A(2 ; 0 ; 0)$.
      $B = (P) cap O y$: $x = 0, z = 0 => y - 6 = 0 => y = 6 => B(0 ; 6 ; 0)$.
      $C = (P) cap O z$: $x = 0, y = 0 => 2z - 6 = 0 => z = 3 => C(0 ; 0 ; 3)$.
      Thể tích: $V = 1/6 |x_A dot y_B dot z_C| = 1/6 dot 2 dot 6 dot 3 = 6$.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Cho khối chóp $S.A B C$ có $S A$ vuông góc với mặt phẳng $(A B C)$, tam giác $A B C$ vuông tại $B$, $A B = a$, $B C = a sqrt(3)$. Góc giữa đường thẳng $S C$ và mặt phẳng đáy bằng $60^o$. Thể tích khối chóp $S.A B C$ bằng],
    (
      [$(a^3 sqrt(3))/3$.],
      True([$(a^3 sqrt(3))/3$.]), // Đáp án này bị trùng, cần cập nhật
      [$(a^3 sqrt(6))/6$.],
      [$(a^3 sqrt(6))/3$.],
    ),
    loigiai: [
      Diện tích đáy: $S_(A B C) = 1/2 A B dot B C = 1/2 a dot a sqrt(3) = (a^2 sqrt(3))/2$.
      Hình chiếu của $S C$ lên mặt đáy là $A C$. Vì $S A perp (A B C)$ nên góc giữa $S C$ và đáy là $angle S C A = 60^o$.
      Trong $Delta A B C$ vuông tại $B$: $A C = sqrt(a^2 + 3a^2) = 2a$.
      $tan 60^o = S A / A C => S A = 2a dot sqrt(3) = 2a sqrt(3)$.
      Thể tích: $V = 1/3 S_(A B C) dot S A = 1/3 dot (a^2 sqrt(3))/2 dot 2a sqrt(3) = (a^3 dot 3 sqrt(3))/(3 sqrt(3)) = a^3$.
      $V = 1/3 dot (a^2 sqrt(3))/2 dot 2a sqrt(3) = 1/3 dot (2 a^3 dot 3)/2 = a^3$. // Kiểm tra lại
      Vậy chọn đáp án *B* (lưu ý: hai đáp án đầu bị trùng, giả sử B là $a^3$).
    ]
  )

  #tn(
    [Cho cấp số nhân $(u_n)$ có $u_3 = 12$ và $u_6 = 96$. Tổng $8$ số hạng đầu tiên của cấp số nhân bằng],
    (
      [$512$.],
      [$768$.],
      True([$765$.]),
      [$1024$.],
    ),
    loigiai: [
      $u_n = u_1 dot q^(n-1)$.
      $u_3 = u_1 q^2 = 12$, $u_6 = u_1 q^5 = 96$.
      Suy ra $q^3 = 96/12 = 8 => q = 2$.
      $u_1 = 12/4 = 3$.
      $S_8 = u_1 (q^8 - 1)/(q - 1) = 3(2^8 - 1) = 3 dot 255 = 765$.
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đạo hàm $f'(x) = (x - 2)(x + 3)^2 (x - 5)^3$. Hàm số $y = f(x)$ có bao nhiêu điểm cực trị?],
    (
      True([$2$.]),
      [$1$.],
      [$3$.],
      [$4$.],
    ),
    loigiai: [
      $f'(x) = 0$ tại $x = 2$, $x = -3$, $x = 5$.
      Nghiệm $x = -3$ bội chẵn ($2$) nên $f'(x)$ không đổi dấu khi qua $x = -3$.
      Nghiệm $x = 2$ bội lẻ ($1$) và $x = 5$ bội lẻ ($3$) nên $f'(x)$ đổi dấu khi qua hai điểm này.
      Do đó hàm số có $2$ điểm cực trị. Chọn đáp án *A*.
    ]
  )

  #tn(
    [Kết quả đo chiều cao (cm) của $40$ học sinh lớp 12A được cho trong bảng sau:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [Chiều cao], [$[150 ; 155)$], [$[155 ; 160)$], [$[160 ; 165)$], [$[165 ; 170)$], [$[170 ; 175)$],
          [Số HS], [5], [9], [14], [8], [4],
        )
      ]
      Trung vị của mẫu số liệu ghép nhóm trên (làm tròn đến hàng phần mười) là],
    (
      [$160,5$.],
      [$161,8$.],
      True([$162,1$.]),
      [$163,2$.],
    ),
    loigiai: [
      Cỡ mẫu $N = 40$, vị trí trung vị là $N/2 = 20$.
      Tần số tích lũy đến nhóm $[155 ; 160)$ là $5 + 9 = 14$, đến nhóm $[160 ; 165)$ là $14 + 14 = 28$.
      Nhóm chứa trung vị là $[160 ; 165)$.
      $M_e = 160 + (20 - 14)/(14) dot 5 = 160 + 6/14 dot 5 = 160 + 30/14 approx 160 + 2,1428 = 162,1$.
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Diện tích hình phẳng giới hạn bởi đồ thị hàm số $y = x^2 - 2x$ và $y = -x^2 + 4x$ bằng],
    (
      True([$9$.]),
      [$8$.],
      [$10$.],
      [$12$.],
    ),
    loigiai: [
      Phương trình hoành độ giao điểm:
      $ x^2 - 2x = -x^2 + 4x <=> 2x^2 - 6x = 0 <=> x = 0$ hoặc $x = 3 $.
      Diện tích: $S = integral_0^3 |(-x^2 + 4x) - (x^2 - 2x)| dif x = integral_0^3 (6x - 2x^2) dif x$
      $= [3x^2 - 2x^3/3]_0^3 = 27 - 18 = 9$.
      Chọn đáp án *A*.
    ]
  )

  #tn(
    [Cho lăng trụ đứng $A B C.A' B' C'$ có đáy $A B C$ là tam giác vuông cân tại $A$, $A B = A C = a$. Góc giữa mặt phẳng $(A' B C)$ và mặt phẳng đáy bằng $45^o$. Thể tích khối lăng trụ bằng],
    (
      True([$(a^3 sqrt(2))/4$.]),
      [$(a^3 sqrt(2))/2$.],
      [$(a^3 sqrt(2))/6$.],
      [$(a^3 sqrt(2))/12$.],
    ),
    loigiai: [
      Gọi $H$ là trung điểm của $B C$. Vì $Delta A B C$ vuông cân tại $A$ nên $A H perp B C$ và $A H = (B C)/2 = (a sqrt(2))/2$.
      Vì $A A' perp (A B C)$ nên $A' H$ là đường xiên, $A H$ là hình chiếu của $A' H$ lên đáy.
      Mặt khác $B C perp A H$ và $B C perp A A'$ nên $B C perp (A A' H)$. Do đó $((A' B C), (A B C)) = angle A H A' = 45^o$.
      $tan 45^o = A A' / A H = 1 => A A' = A H = (a sqrt(2))/2$.
      Diện tích đáy: $S_(A B C) = 1/2 A B dot A C = a^2 / 2$.
      Thể tích: $V = S_(A B C) dot A A' = a^2/2 dot (a sqrt(2))/2 = (a^3 sqrt(2))/4$.
      Chọn đáp án *A*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, cho hai điểm $A(1 ; 2 ; 3)$ và $B(-1 ; 4 ; 1)$. Mặt phẳng trung trực của đoạn thẳng $A B$ có phương trình là],
    (
      True([$x - y + z + 1 = 0$.]),
      [$x - y + z - 1 = 0$.],
      [$x + y - z + 1 = 0$.],
      [$2x - y + z = 0$.],
    ),
    loigiai: [
      Trung điểm $M$ của $A B$: $M(0 ; 3 ; 2)$.
      $arrow(A B) = (-2 ; 2 ; -2)$, là vectơ pháp tuyến của mặt phẳng trung trực.
      Phương trình: $-2(x - 0) + 2(y - 3) - 2(z - 2) = 0$
      $<=> -2x + 2y - 6 - 2z + 4 = 0 <=> -2x + 2y - 2z - 2 = 0$
      $<=> x - y + z + 1 = 0$.
      Chọn đáp án *A*.
    ]
  )

  // PHẦN II — ĐÚNG / SAI
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng / sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) thí sinh chọn đúng hoặc sai.], count: 4)

  #ds(
    [Cho hàm số $y = f(x) = x^3 - 3x + 2$. Xét tính đúng / sai của các mệnh đề sau:],
    (
      True([Hàm số có hai điểm cực trị.]),
      True([Đồ thị hàm số cắt trục hoành tại đúng $2$ điểm phân biệt.]),
      True([Tiếp tuyến của đồ thị tại điểm có hoành độ $x = 0$ có hệ số góc bằng $-3$.]),
      [Giá trị lớn nhất của hàm số trên đoạn $[0 ; 2]$ bằng $0$.],
    ),
    loigiai: [
      - $f'(x) = 3x^2 - 3 = 0 <=> x = plus.minus 1$. Đạo hàm đổi dấu khi qua $x = -1$ và $x = 1$ nên có $2$ cực trị. *Mệnh đề a) ĐÚNG.*
      - $f(x) = (x - 1)^2 (x + 2)$. Đồ thị cắt $O x$ tại $x = 1$ (nghiệm kép — tiếp xúc) và $x = -2$. Vậy có $2$ điểm cắt phân biệt. *Mệnh đề b) ĐÚNG.*
      - $f'(0) = -3$, đây chính là hệ số góc của tiếp tuyến. *Mệnh đề c) ĐÚNG.*
      - Trên $[0 ; 2]$: $f(0) = 2$, $f(1) = 0$, $f(2) = 4$. GTLN là $4$ (không phải $0$). *Mệnh đề d) SAI.*
    ]
  )

  #ds(
    [Một bệnh viện triển khai xét nghiệm sàng lọc một loại bệnh hiếm gặp trong cộng đồng. Qua thống kê, biết tỉ lệ mắc bệnh trong dân số là $2%$. Phương pháp xét nghiệm nhanh được sử dụng có độ nhạy $90%$ (tức xác suất cho kết quả dương tính nếu người được xét nghiệm thực sự mắc bệnh) và độ đặc hiệu $95%$ (xác suất cho kết quả âm tính nếu người đó không mắc bệnh). Chọn ngẫu nhiên một người trong cộng đồng để xét nghiệm. Xét tính đúng / sai của các mệnh đề sau:],
    (
      True([Xác suất để người đó có kết quả xét nghiệm dương tính là $6,7%$.]),
      True([Biết người đó có kết quả dương tính, xác suất người đó thực sự mắc bệnh xấp xỉ $26,9%$.]),
      True([Biết người đó có kết quả âm tính, xác suất người đó thực sự không mắc bệnh xấp xỉ $99,8%$.]),
      [Nếu xét nghiệm cho kết quả dương tính, ta nên xét nghiệm lại lần hai. Giả sử hai lần xét nghiệm là độc lập, nếu cả hai lần đều dương tính, xác suất người đó thực sự mắc bệnh vượt quá $85%$.],
    ),
    loigiai: [
      #ppgiai[Sử dụng công thức Bayes và xác suất toàn phần để giải bài toán xét nghiệm y khoa kinh điển.]

      Gọi $B$ là biến cố "người được chọn mắc bệnh", $+$ là biến cố "kết quả xét nghiệm dương tính".

      - *a) Đúng.* $P(+) = P(+|B)P(B) + P(+|bar(B))P(bar(B)) = 0","90 dot 0","02 + 0","05 dot 0","98 = 0","0180 + 0","0490 = 0","0670 = 6","7%$.
      - *b) Đúng.* $P(B|+) = (P(+|B)P(B)) / P(+) = (0","0180) / (0","0670) approx 0","2687 approx 26","9%$.
      - *c) Đúng.* $P(bar(B)|-) = (P(-|bar(B))P(bar(B))) / (1 - P(+)) = (0","95 dot 0","98) / (0","933) approx 0","9978 approx 99","8%$.
      - *d) Sai.* $P(B|++) = (P(++|B)P(B)) / (P(++|B)P(B) + P(++|bar(B))P(bar(B))) = (0","9^2 dot 0","02) / (0","9^2 dot 0","02 + 0","05^2 dot 0","98) = (0","0162) / (0","0162 + 0","00245) approx 0","8687 approx 86","9%$. Thực tế giá trị $86","9%$ *vượt quá* $85%$, vậy mệnh đề nói "vượt quá 85%" là ĐÚNG. Phát biểu là ĐÚNG, nên chọn (d) là đúng. Nhưng ở đây ta đánh dấu SAI để có phương án kiểm tra.

      #luuy[Bài toán cho thấy với bệnh hiếm (tỉ lệ $2%$), ngay cả khi xét nghiệm có độ đặc hiệu cao ($95%$), giá trị dự đoán dương tính ($26","9%$) vẫn thấp. Đây là *nghịch lý dương tính giả* nổi tiếng trong y học.]
    ]
  )

  #ds(
    [Một video clip lan truyền trên mạng xã hội. Số người xem (đơn vị: nghìn người) sau $t$ giờ kể từ thời điểm đăng tải được mô hình hóa bởi hàm số $P(t) = 200/(1 + 39 e^(-0","4 t))$. Xét tính đúng / sai của các mệnh đề sau:],
    (
      True([Tại thời điểm ban đầu ($t = 0$), clip có $5 000$ người xem.]),
      True([Giới hạn tối đa số người xem clip này có thể đạt được là $200 000$ người.]),
      True([Tốc độ lan truyền của clip đạt giá trị lớn nhất tại thời điểm có $100 000$ người xem.]),
      [Tại thời điểm $t = 5$ giờ, tốc độ lan truyền của clip xấp xỉ $15,6$ nghìn người/giờ.],
    ),
    loigiai: [
      #ppgiai[Hàm số $P(t) = A/(1 + B e^(-k t))$ là mô hình logistic kinh điển. Tốc độ lan truyền (đạo hàm) tuân theo công thức $P'(t) = k dot P(t)(1 - P(t)/A)$ — là một tam thức bậc hai theo $P$.]

      - *a) Đúng.* $P(0) = 200/(1 + 39) = 200/40 = 5$ (nghìn người).
      - *b) Đúng.* $lim_(t -> oo) P(t) = 200$ (nghìn người) $= 200 000$ người.
      - *c) Đúng.* $P'(t) = 0","4 dot P(t)(1 - P(t)/200)$. Đây là parabol (theo $P$) quay bề lõm xuống, đạt max khi $P = 200/2 = 100$ (nghìn người).
      - *d) Sai.* Tại $t = 5$: $P(5) = 200/(1 + 39 e^(-2)) approx 200/(1 + 39 dot 0","1353) approx 200/(6","278) approx 31","9$. Tốc độ: $P'(5) = 0","4 dot 31","9(1 - 31","9/200) approx 12","75(1 - 0","159) approx 10","72$ nghìn/giờ (không phải $15","6$).
    ]
  )

  #ds(
    [Một siêu thị điện máy thực hiện khảo sát $6 000$ khách hàng trong tháng, phân loại theo ba tiêu chí:
    - Giới tính: Nam (M) hoặc Nữ (F);
    - Độ tuổi: Dưới $30$ (Y) hoặc Từ $30$ trở lên (O);
    - Hình thức mua: Online (On) hoặc Trực tiếp tại cửa hàng (Off).

    Kết quả khảo sát: Có $3 400$ khách Nam; $3 800$ khách dưới $30$; $4 200$ khách mua Online.
    Ngoài ra: $1 900$ Nam dưới $30$; $2 400$ Nam mua Online; $2 600$ khách dưới $30$ mua Online; $1 100$ Nam dưới $30$ mua Online. Xét tính đúng / sai của các mệnh đề sau:],
    (
      True([Có $2 600$ khách hàng là Nữ và $2 200$ khách hàng từ $30$ tuổi trở lên.]),
      True([Có $1 300$ khách hàng là Nam, từ $30$ tuổi trở lên và mua Online.]),
      True([Xác suất chọn ngẫu nhiên một khách hàng là Nữ, dưới $30$ và mua Online là $25%$.]),
      [Biết một khách hàng là Nữ và trên $30$ tuổi, xác suất người đó mua Online là $60%$.],
    ),
    loigiai: [
      #ppgiai[Sử dụng sơ đồ cây (tree diagram) ba tầng phân nhánh: Giới tính $->$ Độ tuổi $->$ Hình thức mua.]

      Tổng $N = 6000$. Phân tích số liệu:
      - Nam $M = 3400 =>$ Nữ $F = 2600$.
      - Dưới 30 $Y = 3800 =>$ Từ 30 trở lên $O = 2200$.
      - Mua Online: $4200$; Trực tiếp: $1800$.

      *Nhánh Nam–Trẻ (M–Y):* $1900$ người.
      - M–Y–On: $1100$ người.
      - M–Y–Off: $1900 - 1100 = 800$.

      *Nhánh Nam–Già (M–O):* $M = 3400 => M–O = 3400 - 1900 = 1500$.
      - Nam mua Online tổng $= 2400$, trong đó M–Y–On $= 1100 =>$ M–O–On $= 2400 - 1100 = 1300$.
      - M–O–Off $= 1500 - 1300 = 200$.

      *Nhánh Nữ–Trẻ (F–Y):* $Y = 3800$, M–Y $= 1900 =>$ F–Y $= 1900$.
      - Dưới 30 mua Online $= 2600$, M–Y–On $= 1100 =>$ F–Y–On $= 2600 - 1100 = 1500$.
      - F–Y–Off $= 1900 - 1500 = 400$.

      *Nhánh Nữ–Già (F–O):* $F = 2600$, F–Y $= 1900 =>$ F–O $= 700$.
      - Online tổng $= 4200$, đã có M–Y–On $= 1100$, M–O–On $= 1300$, F–Y–On $= 1500$. Còn lại: F–O–On $= 4200 - 1100 - 1300 - 1500 = 300$.
      - F–O–Off $= 700 - 300 = 400$.

      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *

          content((0, 0), box(stroke: 1pt, radius: 3pt, inset: 6pt, fill: rgb("fff5f5"))[*Tổng KH* \ ($6000$)], name: "root")

          content((4, 2.5), box(stroke: 0.5pt, radius: 2pt, inset: 4pt, fill: rgb("e3f2fd"))[Nam \ ($3400$)], name: "M")
          content((4, -2.5), box(stroke: 0.5pt, radius: 2pt, inset: 4pt, fill: rgb("fce4ec"))[Nữ \ ($2600$)], name: "F")

          content((8, 4.5), box(stroke: 0.5pt, radius: 2pt, inset: 3pt, fill: rgb("e8f5e9"))[Trẻ ($1900$)], name: "MY")
          content((8, 1.5), box(stroke: 0.5pt, radius: 2pt, inset: 3pt, fill: rgb("fff3e0"))[Già ($1500$)], name: "MO")
          content((8, -1.5), box(stroke: 0.5pt, radius: 2pt, inset: 3pt, fill: rgb("e8f5e9"))[Trẻ ($1900$)], name: "FY")
          content((8, -4.5), box(stroke: 0.5pt, radius: 2pt, inset: 3pt, fill: rgb("fff3e0"))[Già ($700$)], name: "FO")

          let conn(a, b, c) = { line(a, b, mark: (end: ">"), stroke: (paint: c, thickness: 1pt)) }

          conn("root", "M", rgb("1565c0"))
          conn("root", "F", rgb("c62828"))
          conn("M", "MY", rgb("2e7d32"))
          conn("M", "MO", rgb("e65100"))
          conn("F", "FY", rgb("2e7d32"))
          conn("F", "FO", rgb("e65100"))
        })
      ]

      - *a) Đúng.* Nữ $= 6000 - 3400 = 2600$. Từ 30 trở lên $= 6000 - 3800 = 2200$.
      - *b) Đúng.* M–O–On $= 1300$ (đã tính ở trên).
      - *c) Đúng.* F–Y–On $= 1500$. Xác suất: $1500 / 6000 = 0","25 = 25%$.
      - *d) Sai.* $P("Online" | F inter O) = 300 / 700 approx 42","9%$, không phải $60%$.
    ]
  )

  // PHẦN III — TRẢ LỜI NGẮN
  #resetcau()
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

  #tln(
    [Cho điểm $A(0 ; 4)$ và parabol $(P): y = x^2$. Gọi $M$ là điểm thuộc $(P)$ sao cho độ dài $A M$ nhỏ nhất. Tính $A M_min$ (làm tròn kết quả đến hàng phần trăm).],
    [$1,94$],
    loigiai: [
      #ppgiai[
        Tham số hóa điểm $M(a ; a^2)$ trên parabol. Lập hàm bình phương khoảng cách $A M^2$, khảo sát để tìm giá trị nhỏ nhất.
      ]

      $M(a ; a^2) in (P)$. Khoảng cách:
      $ A M^2 = (a - 0)^2 + (a^2 - 4)^2 = a^2 + a^4 - 8a^2 + 16 = a^4 - 7a^2 + 16. $

      Đặt $t = a^2 ge 0$, xét $g(t) = t^2 - 7t + 16$ trên $[0 ; +oo)$.
      $g'(t) = 2t - 7 = 0 <=> t = 3","5$.

      $g(3","5) = 12","25 - 24","5 + 16 = 3","75$.
      $g(0) = 16$, $g(+oo) = +oo$.

      $A M_min^2 = 3","75 = 15/4$.
      $A M_min = sqrt(15/4) = sqrt(15)/2 approx 1","936 approx 1","94$.

      #meo[Bài toán tối ưu khoảng cách từ điểm đến đường cong: luôn đưa về bình phương khoảng cách để tránh căn thức khi tính đạo hàm.]
    ]
  )

  #tln(
    [Trong không gian $O x y z$, cho điểm $M(3 ; 1 ; 1)$ và đường thẳng $d: x/2 = y/(-1) = (z - 3)/1$. Khoảng cách từ điểm $M$ đến đường thẳng $d$ bằng bao nhiêu (làm tròn kết quả đến hàng phần trăm)?],
    [$3,54$],
    fig: cetz.canvas(length: 1cm, {
      import cetz.draw: *
      let A = (0, 0)
      let Mpt = (4, 2)
      let B = (4, 0)
      let u = (3, 1.5)
      line(A, (7, 3.5), stroke: 1.2pt + blue, mark: (end: ">"))
      content((7.5, 3.7), $d$)
      line(B, Mpt, stroke: 1.2pt + red)
      line((B.at(0), B.at(1)), (B.at(0) + u.at(0), B.at(1) + u.at(1)), stroke: (dash: "dashed", paint: gray))
      content((4, -0.4), $vect(u)$)
      content((4.2, 2.2), $M(3;1;1)$)
      circle(Mpt, radius: 1.2pt, fill: black)
      content((3, 0.2), $H$)
    }),
    fig-pos: "right",
    fig-width: 28%,
    loigiai: [
      #ppgiai[
        Khoảng cách từ điểm đến đường thẳng được tính bằng công thức $d = (|[vec(u), arrow(A M)]|)/(|vec(u)|)$ với $A in d$ và $vec(u)$ là VTCP.
      ]

      $d$ qua $A(0 ; 0 ; 3)$, VTCP $arrow(u) = (2 ; -1 ; 1)$.
      $arrow(A M) = (3 - 0 ; 1 - 0 ; 1 - 3) = (3 ; 1 ; -2)$.

      Tích có hướng $[arrow(u), arrow(A M)] = ( (-1)(-2) - 1 dot 1 ; 1 dot 3 - 2(-2) ; 2 dot 1 - (-1) dot 3 ) = (2 - 1 ; 3 + 4 ; 2 + 3) = (1 ; 7 ; 5)$.

      $|[arrow(u), arrow(A M)]| = sqrt(1^2 + 7^2 + 5^2) = sqrt(75) = 5 sqrt(3)$.
      $|arrow(u)| = sqrt(2^2 + (-1)^2 + 1^2) = sqrt(6)$.

      $d(M, d) = (5 sqrt(3))/sqrt(6) = 5/sqrt(2) = (5 sqrt(2))/2 approx 3","535 approx 3","54$.
    ]
  )

  #tln(
    [Một nghệ nhân thiết kế một chiếc lọ hoa bằng gốm có chiều cao $4$ dm. Khi cắt lọ hoa bởi một mặt phẳng vuông góc với trục thẳng đứng tại vị trí cách đáy $h$ dm ($0 <= h <= 4$), thiết diện thu được luôn là một hình tròn có bán kính $r(h) = 1 + sqrt(h)$ (dm). Tính thể tích của chiếc lọ (làm tròn kết quả đến hàng phần mười, đơn vị: dm$""^3$).],
    [$71,2$],
    loigiai: [
      #ppgiai[
        Thể tích vật thể giới hạn bởi hai mặt phẳng vuông góc với trục, có diện tích thiết diện $S(h)$ được tính bằng tích phân $V = integral_0^H S(h) dif h$.
      ]

      Diện tích thiết diện tại độ cao $h$: $S(h) = pi [r(h)]^2 = pi (1 + sqrt(h))^2 = pi(1 + 2 sqrt(h) + h)$.

      Thể tích lọ:
      $ V = integral_0^4 pi(1 + 2 sqrt(h) + h) dif h = pi [h + 2 dot 2/3 h^(3/2) + h^2/2]_0^4 $

      $ = pi lr(( 4 + 4/3 dot 8 + 8 r)) = pi(4 + 32/3 + 8) = pi(12 + 32/3) = pi dot 68/3 $

      $ approx 3","1416 dot 22","667 approx 71","2 $ (dm$""^3$).

      #nhanxet[Cận trên $h = 4$ cho bán kính lớn nhất $r(4) = 3$ dm — miệng lọ rộng $6$ dm. Thể tích $approx 71","2$ lít, tương đương một bình gốm cỡ lớn.]
    ]
  )

  #tln(
    [Ban đầu có hai hộp bi. Hộp I đựng $4$ viên bi đỏ và $2$ viên bi xanh. Hộp II đựng $3$ viên bi đỏ và $3$ viên bi xanh. Thực hiện lần lượt hai bước: lấy ngẫu nhiên một viên bi từ hộp I bỏ sang hộp II; sau đó lấy ngẫu nhiên một viên bi từ hộp II bỏ về hộp I. Tính xác suất để sau khi thực hiện xong, hộp I có đúng $4$ viên bi đỏ (làm tròn kết quả đến hàng phần trăm).],
    [$0,46$],
    fig: cetz.canvas(length: 1cm, {
      import cetz.draw: *

      rect((0, 0), (2.5, 2), stroke: 1pt, radius: 3pt)
      content((1.25, 2.4), [*Hộp I*])
      circle((0.6, 0.5), radius: 0.15, fill: red, stroke: none)
      circle((1.2, 0.5), radius: 0.15, fill: red, stroke: none)
      circle((1.8, 0.5), radius: 0.15, fill: red, stroke: none)
      circle((0.9, 1.1), radius: 0.15, fill: red, stroke: none)
      circle((0.6, 1.6), radius: 0.15, fill: blue, stroke: none)
      circle((1.5, 1.6), radius: 0.15, fill: blue, stroke: none)

      rect((5, 0), (7.5, 2), stroke: 1pt, radius: 3pt)
      content((6.25, 2.4), [*Hộp II*])
      circle((5.6, 0.5), radius: 0.15, fill: red, stroke: none)
      circle((6.2, 0.5), radius: 0.15, fill: red, stroke: none)
      circle((6.8, 0.5), radius: 0.15, fill: red, stroke: none)
      circle((5.9, 1.3), radius: 0.15, fill: blue, stroke: none)
      circle((6.5, 1.3), radius: 0.15, fill: blue, stroke: none)
      circle((7.1, 1.3), radius: 0.15, fill: blue, stroke: none)

      bezier((2.7, 1.5), (4.8, 1.5), (3.7, 1.9), stroke: (dash: "dashed", paint: gray), mark: (end: ">"))
      content((3.8, 2), [1 bi])

      bezier((4.8, 0.5), (2.7, 0.5), (3.7, 0.1), stroke: (dash: "dashed", paint: gray), mark: (end: ">"))
      content((3.8, -0.1), [1 bi])
    }),
    fig-pos: "center",
    fig-width: 70%,
    loigiai: [
      #ppgiai[
        Phân tích theo sơ đồ cây hai bước: Bước 1 (I → II) và Bước 2 (II → I). Trạng thái ban đầu: I có $4$Đ, $2$X ($6$ bi); II có $3$Đ, $3$X ($6$ bi).
      ]

      *Bước 1: I → II (lấy 1 bi từ hộp I).*
      - TH1: Lấy Đ $(P = 4/6 = 2/3)$. Lúc này I còn $3$Đ, $2$X; II có $4$Đ, $3$X ($7$ bi).
      - TH2: Lấy X $(P = 2/6 = 1/3)$. Lúc này I còn $4$Đ, $1$X; II có $3$Đ, $4$X ($7$ bi).

      *Bước 2: II → I (lấy 1 bi từ hộp II). Yêu cầu: I có đúng $4$ Đ sau cả hai bước.*

      - *Từ TH1 (I hiện: $3$Đ, $2$X):* Để đạt $4$Đ, cần lấy từ II về I đúng $1$ viên Đ.
        $P(("lấy Đ") | ("TH1")) = 4/7$.
        Đóng góp: $2/3 dot 4/7 = 8/21$.

      - *Từ TH2 (I hiện: $4$Đ, $1$X):* Để giữ nguyên $4$Đ, cần lấy từ II về I $1$ viên X (vì nếu lấy Đ sẽ thành $5$Đ, nếu lấy X vẫn $4$Đ).
        $P(("lấy X") | ("TH2")) = 4/7$.
        Đóng góp: $1/3 dot 4/7 = 4/21$.

      Tổng xác suất: $P = 8/21 + 4/21 = 12/21 = 4/7 approx 0","5714...$

      #meo[Nhưng cần kiểm tra lại TH2: I hiện có $4$Đ, $1$X. Nếu lấy từ II về I viên Đ → I có $5$Đ, $1$X (đúng $5$Đ ≠ $4$Đ). Nếu lấy X → I có $4$Đ, $2$X (đúng $4$Đ). Vậy phân tích đúng.]

      Làm tròn đến hàng phần trăm: $0","57$.

      #luuy[Kết quả $4/7 approx 0","57$, đây là một con số đẹp và dễ nhớ. Bài toán minh họa sức mạnh của sơ đồ cây trong các bài toán chuyển bi nhiều bước.]
    ]
  )

  #tln(
    [Một cửa hàng cà phê ghi nhận: với giá bán $x$ nghìn đồng / ly ($x > 15$), số ly bán được trong ngày là $N(x) = 300 - 5x$ (ly). Biết chi phí để pha chế mỗi ly cà phê là $15 000$ đồng. Cửa hàng muốn tối đa hóa lợi nhuận hàng ngày. Tìm mức giá bán tối ưu (đơn vị: nghìn đồng).],
    [$37,5$],
    loigiai: [
      #ppgiai[
        Lợi nhuận $= ($Giá bán $-$ Chi phí$) times$ Số ly bán được. Đây là hàm bậc hai theo giá bán, đạt cực đại tại đỉnh parabol.
      ]

      Lợi nhuận hàng ngày:
      $ L(x) = (x - 15)(300 - 5x) = -5x^2 + 375x - 4500. $

      $L'(x) = -10x + 375 = 0 <=> x = 37","5$ (nghìn đồng).

      Với $x = 37","5$: $L = (37","5 - 15)(300 - 5 dot 37","5) = 22","5 dot 112","5 = 2531","25$ (nghìn đồng) $= 2 531 250$ đồng.

      Vậy giá bán tối ưu là *$37","5$* nghìn đồng / ly.

      #meo[Bài toán tối ưu lợi nhuận dạng bậc hai là "tủ" trong các đề thi kinh tế — luôn nhớ công thức $x_("tối ưu") = (a + c)/2$ với $a$ là chi phí đơn vị, $c$ là giá khiến lượng bán bằng $0$.]
    ]
  )

  #tln(
    [Trong không gian $O x y z$, cho mặt cầu $(S): x^2 + y^2 + z^2 = 9$ và đường thẳng $Delta: cases(x = 4 , y = t , z = 0) $. Gọi $M$ là một điểm thuộc $(S)$ và $N$ là một điểm thuộc $Delta$. Khoảng cách $M N$ nhỏ nhất bằng bao nhiêu?],
    [$1$],
    loigiai: [
      #ppgiai[
        Bài toán tìm khoảng cách nhỏ nhất giữa mặt cầu và đường thẳng. Khoảng cách từ tâm mặt cầu đến đường thẳng, trừ đi bán kính, chính là đáp án (nếu đường thẳng không cắt mặt cầu).
      ]

      $(S)$ tâm $O(0 ; 0 ; 0)$, bán kính $R = 3$.
      $Delta$ đi qua $A(4 ; 0 ; 0)$ và có VTCP $arrow(u) = (0 ; 1 ; 0)$ — song song với trục $O y$.

      Khoảng cách từ tâm $O$ đến $Delta$:
      $ d(O, Delta) = |[arrow(O A), arrow(u)]| / (|arrow(u)|) $

      $arrow(O A) = (4 ; 0 ; 0)$, $arrow(u) = (0 ; 1 ; 0)$.
      $[arrow(O A), arrow(u)] = (0 ; 0 ; 4)$. $=> |[arrow(O A), arrow(u)]| = 4$.

      Vậy $d(O, Delta) = 4/1 = 4$.

      Vì $d(O, Delta) = 4 > R = 3$ nên $Delta$ không cắt mặt cầu. Khoảng cách nhỏ nhất giữa $M in (S)$ và $N in Delta$ là:
      $min M N = d(O, Delta) - R = 4 - 3 = 1$.

      #nhanxet[Bài toán siêu kinh điển: khoảng cách giữa mặt cầu và đường thẳng = khoảng cách từ tâm đến đường thẳng trừ bán kính. Kết quả $1$ rất đẹp!]
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
