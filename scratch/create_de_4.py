import os

def create_de_4():
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
  school: "ĐỀ THI THỬ LẦN 4",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "204",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

  #tn(
    [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x(x - 2)^2$ với mọi $x in RR$. Hàm số đã cho đồng biến trên khoảng nào dưới đây?],
    (
      [$(-infinity; 0)$.],
      [$(0; 2)$.],
      True([$(0; +infinity)$]),
      [$(-infinity; 2)$.],
    ),
    loigiai: [
      #ppgiai[
        Hàm số đồng biến trên các khoảng mà tại đó $f'(x) >= 0$ (dấu bằng chỉ xảy ra ở hữu hạn điểm).
      ]
      Ta có $f'(x) = x(x-2)^2$. Vì $(x-2)^2 >= 0$ với mọi $x$, ta thấy $f'(x) >= 0 <=> x >= 0$.
      Do đó hàm số đồng biến trên khoảng $(0; +infinity)$. Chọn đáp án *C*.
    ]
  )

  #tn(
    [Đường tiệm cận đứng của đồ thị hàm số $y = (3x + 2)/(x - 1)$ là đường thẳng có phương trình:],
    (
      [$y = 3$.],
      True([$x = 1$.]),
      [$x = -1$.],
      [$y = 1$.],
    ),
    loigiai: [
      Tiệm cận đứng là nghiệm của mẫu số $x - 1 = 0 <=> x = 1$. Chọn đáp án *B*.
    ]
  )

  #tn(
    [Họ tất cả các nguyên hàm của hàm số $f(x) = cos x - 2x$ là],
    (
      [$sin x - 2 + C$.],
      [$-sin x - x^2 + C$.],
      True([$sin x - x^2 + C$.]),
      [$sin x - 2x^2 + C$.],
    ),
    loigiai: [
      Ta có $int (cos x - 2x) dif x = sin x - x^2 + C$. Chọn đáp án *C*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, cho ba điểm $A(1; 0; 0)$, $B(0; -2; 0)$, $C(0; 0; 3)$. Phương trình mặt phẳng $(A B C)$ là],
    (
      [$x/1 + y/2 + z/3 = 1$.],
      True([$x/1 + y/(-2) + z/3 = 1$.]),
      [$x/1 - y/2 - z/3 = 1$.],
      [$x/1 + y/2 - z/3 = 1$.],
    ),
    loigiai: [
      Mặt phẳng đi qua các điểm trên các trục tọa độ có phương trình đoạn chắn là:
      $ x/1 + y/(-2) + z/3 = 1 $.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, tâm $I$ và bán kính $R$ của mặt cầu $(S): x^2 + y^2 + z^2 - 2x + 4y - 2 = 0$ lần lượt là],
    (
      [$I(-1; 2; 0), R = sqrt(7)$.],
      [$I(1; -2; 0), R = sqrt(5)$.],
      [$I(-1; 2; 0), R = sqrt(5)$.],
      True([$I(1; -2; 0), R = sqrt(7)$]),
    ),
    loigiai: [
      Ta có $a = 1, b = -2, c = 0, d = -2$.
      Tâm $I(1; -2; 0)$. Bán kính $R = sqrt(a^2 + b^2 + c^2 - d) = sqrt(1 + 4 + 0 + 2) = sqrt(7)$.
      Chọn đáp án *D*.
    ]
  )

  #tn(
    [Khảo sát thời gian xem tivi trong một ngày của $30$ người cao tuổi thu được kết quả:
      #align(center)[
        #table(
          columns: 5,
          align: center,
          stroke: 0.5pt + black,
          [Thời gian (giờ)], [$[0; 1)$], [$[1; 2)$], [$[2; 3)$], [$[3; 4)$],
          [Số người], [4], [8], [12], [6],
        )
      ]
      Giá trị trung bình thời gian xem tivi của mẫu số liệu ghép nhóm này là],
      (
        [$2,1$ giờ.],
        True([$2,17$ giờ.]),
        [$2,5$ giờ.],
        [$2,0$ giờ.],
      ),
      loigiai: [
        Các giá trị đại diện là: $x_1 = 0,5$; $x_2 = 1,5$; $x_3 = 2,5$; $x_4 = 3,5$.
        Giá trị trung bình:
        $ bar(x) = (4 dot 0,5 + 8 dot 1,5 + 12 dot 2,5 + 6 dot 3,5)/30 = (2 + 12 + 30 + 21)/30 = 65/30 approx 2,17 " giờ". $
        Chọn đáp án *B*.
      ]
  )

  #tn(
    [Trong một hộp chứa $6$ quả cầu đỏ và $4$ quả cầu xanh. Lấy ngẫu nhiên $2$ quả cầu từ hộp. Xác suất để chọn được $2$ quả cầu cùng màu là],
    (
      [$1/3$.],
      True([$7/15$.]),
      [$8/15$.],
      [$2/3$.],
    ),
    loigiai: [
      Không gian mẫu: $C_(10)^2 = 45$.
      Số cách chọn 2 quả đỏ: $C_6^2 = 15$.
      Số cách chọn 2 quả xanh: $C_4^2 = 6$.
      Xác suất chọn 2 quả cùng màu: $P = (15 + 6)/45 = 21/45 = 7/15$.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Tập nghiệm của bất phương trình $log_2 (x - 1) < 3$ là],
    (
      [$(-infinity; 9)$.],
      True([$(1; 9)$.]),
      [$(1; 7)$.],
      [$(-infinity; 7)$.],
    ),
    loigiai: [
      Điều kiện: $x - 1 > 0 <=> x > 1$.
      Bất phương trình tương đương: $x - 1 < 2^3 <=> x < 9$.
      Kết hợp điều kiện, ta có tập nghiệm là $(1; 9)$. Chọn đáp án *B*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, cho vectơ $arrow(u) = -arrow(i) + 2arrow(j) - 3arrow(k)$. Tọa độ của vectơ $arrow(u)$ là],
    (
      [$(1; 2; -3)$.],
      [$(1; -2; 3)$.],
      True([$(-1; 2; -3)$]),
      [$(-1; 2; 3)$.],
    ),
    loigiai: [
      Tọa độ của vectơ theo các vectơ đơn vị: $arrow(u) = x arrow(i) + y arrow(j) + z arrow(k) => arrow(u) = (-1; 2; -3)$.
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Hàm số nào dưới đây có đồ thị dạng đường cong như hình vẽ bên dưới?
      #align(center)[
        #cetz.canvas(length: 0.6cm, {
          import cetz.draw: *
          line((-2.5, 0), (2.5, 0), mark: (end: ">"))
          content((2.5, 0.3), $x$)
          line((0, -1.5), (0, 3.5), mark: (end: ">"))
          content((0.3, 3.5), $y$)
          content((-0.3, -0.3), $O$)
          
          let pts = ()
          for i in range(-20, 21) {
            let x = i / 10.0
            let y = x * x * x - 3 * x + 1
            pts.push((x, y))
          }
          line(..pts, stroke: 1.2pt + black)
        })
      ]
    ],
    (
      [$y = -x^3 + 3x + 1$.],
      [$y = x^4 - 2x^2 + 1$.],
      True([$y = x^3 - 3x + 1$]),
      [$y = x^3 - 3x^2 + 1$.],
    ),
    loigiai: [
      Đồ thị là của hàm bậc ba $y = a x^3 + b x^2 + c x + d$ với hệ số $a > 0$ vì khi $x -> +infinity$ thì $y -> +infinity$.
      Đồ thị đi qua điểm $(0; 1)$, có hai điểm cực trị đối xứng qua trục tung. Nhận thấy $y = x^3 - 3x + 1$ có $y' = 3x^2 - 3 = 0 <=> x = +- 1$.
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Tích phân $I = int_0^1 e^(2x) dif x$ bằng],
    (
      [$e^2 - 1$.],
      True([$(e^2 - 1)/2$]),
      [$2(e^2 - 1)$.],
      [$(e^2 + 1)/2$.],
    ),
    loigiai: [
      Ta có $I = [1/2 e^(2x)]_0^1 = 1/2 (e^2 - 1)$. Chọn đáp án *B*.
    ]
  )

  #tn(
    [Đạo hàm của hàm số $y = 3^x$ là],
    (
      [$y' = x \cdot 3^(x-1)$.],
      [$y' = 3^x$.],
      [$y' = 3^x / (ln 3)$.],
      True([$y' = 3^x ln 3$]),
    ),
    loigiai: [
      Đạo hàm của hàm mũ $y = a^x$ là $y' = a^x ln a$. Do đó $y' = 3^x ln 3$. Chọn đáp án *D*.
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN II — Trắc nghiệm đúng/sai
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai. Thí sinh trả lời từ Câu 1 đến Câu 4.], count: 4)

  #ds(
    [Cho hàm số $y = f(x) = (x^2 + 2x - m) / (x + 1)$ với $m$ là tham số thực. Xét tính đúng sai của các khẳng định sau:],
    (
      True([Khi $m = -1$, hàm số đã cho không có cực trị.]),
      [Với mọi $m != -1$, đồ thị hàm số luôn có hai điểm cực trị nằm về hai phía của trục hoành.],
      True([Khi $m = 1$, tiệm cận xiên của đồ thị hàm số là đường thẳng $y = x + 1$.]),
      [Hàm số đồng biến trên các khoảng xác định khi và chỉ khi $m <= -1$.],
    ),
    loigiai: [
      #ppgiai[
        - Tính đạo hàm $y'$.
        - Khảo sát sự tồn tại cực trị và tiệm cận xiên của đồ thị hàm số.
      ]
      Ta có tập xác định $D = RR setminus {-1}$.
      Đạo hàm:
      $ y' = ((2x + 2)(x + 1) - (x^2 + 2x - m))/(x + 1)^2 = (x^2 + 2x + 2 + m)/(x + 1)^2. $
      *a)* Khi $m = -1$, ta có $y' = (x^2 + 2x + 1)/(x + 1)^2 = 1 > 0$ với mọi $x != -1$. Hàm số luôn đồng biến, không có cực trị. Ý a *ĐÚNG*.
      
      *b)* Với $m != -1$, đồ thị hàm số có hai điểm cực trị khi tử số của $y'$ có hai nghiệm phân biệt khác $-1$, tức là $Delta' = 1 - (2+m) = -m - 1 > 0 <=> m < -1$. Do đó không phải "với mọi $m != -1$". Ý b *SAI*.
      
      *c)* Khi $m = 1$, ta có $y = (x^2 + 2x - 1)/(x + 1) = x + 1 - 2/(x+1)$. Do đó tiệm cận xiên là $y = x + 1$. Ý c *ĐÚNG*.
      
      *d)* Hàm số đồng biến trên các khoảng xác định khi và chỉ khi $y' >= 0, forall x != -1 <=> x^2 + 2x + 2 + m >= 0, forall x != -1 <=> Delta' = -m - 1 <= 0 <=> m >= -1$. Mệnh đề ghi $m <= -1$ là *SAI*.
    ]
  )

  #ds(
    [Trong không gian $O x y z$, một tấm pin năng lượng mặt trời được đặt trên mái nhà nghiêng. Mái nhà thuộc mặt phẳng $(P): x + y + 2z - 6 = 0$. Một tia sáng mặt trời chiếu thẳng xuống theo phương của vectơ $arrow(v) = (1; -1; -1)$.],
    (
      True([Mặt phẳng mái nhà $(P)$ có một vectơ pháp tuyến là $arrow(n) = (1; 1; 2)$.]),
      [Đường thẳng chứa tia sáng mặt trời vuông góc với mặt phẳng mái nhà $(P)$.],
      True([Góc tạo bởi tia sáng mặt trời và mặt phẳng mái nhà $(P)$ có số đo gần nhất với $30^o$.]),
      True([Nếu ta lắp đặt một cột đỡ vuông góc với mái nhà tại điểm $A(2; 2; 1)$, đường thẳng chứa cột đỡ có phương trình tham số là $x = 2 + t, y = 2 + t, z = 1 + 2t$.]),
    ),
    loigiai: [
      #ppgiai[
        - Xác định VTPT của mặt phẳng $(P)$ là $arrow(n) = (1; 1; 2)$.
        - Xác định góc giữa đường thẳng chỉ phương $arrow(v)$ và mặt phẳng $(P)$.
      ]
      *a)* Mặt phẳng $(P): x + y + 2z - 6 = 0$ có VTPT là $arrow(n) = (1; 1; 2)$. Ý a *ĐÚNG*.
      
      *b)* Tích vô hướng $arrow(v) \cdot arrow(n) = 1 \cdot 1 + (-1) \cdot 1 + (-1) \cdot 2 = 1 - 1 - 2 = -2 != 0$. Hai phương này không vuông góc hay song song. Do đó tia sáng không vuông góc với mái nhà. Ý b *SAI*.
      
      *c)* Gọi $alpha$ là góc giữa tia sáng và mái nhà. Ta có:
      $ sin alpha = (|arrow(v) \cdot arrow(n)|)/(|arrow(v)| \cdot |arrow(n)|) = |-2| / (sqrt(3) \cdot sqrt(6)) = 2 / (3sqrt(2)) = sqrt(2)/3 approx 0,4714. $
      Suy ra $alpha approx 28,13^o$, gần nhất với $30^o$. Ý c *ĐÚNG*.
      
      *d)* Cột đỡ vuông góc với mái nhà tại $A(2; 2; 1)$ nên đường thẳng này đi qua $A$ và nhận VTPT $arrow(n) = (1; 1; 2)$ làm VTCP.
      Phương trình tham số là: $x = 2 + t, y = 2 + t, z = 1 + 2t$. Ý d *ĐÚNG*.
    ]
  )

  #ds(
    [Một xí nghiệp sản xuất thống kê năng suất lao động của 50 công nhân (đơn vị: sản phẩm/ngày) và thu được bảng tần số ghép nhóm sau:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [Năng suất], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$], [$[30; 35)$],
          [Số công nhân], [6], [12], [18], [10], [4],
        )
      ]
      Xét tính đúng sai của các mệnh đề sau:],
    (
      [Giá trị trung bình của mẫu số liệu ghép nhóm này là $21$ sản phẩm/ngày.],
      True([Nhóm chứa mốt của mẫu số liệu là nhóm $[20; 25)$.]),
      True([Độ lệch chuẩn của mẫu số liệu ghép nhóm này lớn hơn $5,5$.]),
      [Phương sai của mẫu số liệu nhỏ hơn $30$.],
    ),
    loigiai: [
      *a)* Tính trung bình:
      Các giá trị đại diện là $12,5$; $17,5$; $22,5$; $27,5$; $32,5$.
      $ bar(x) = (6 dot 12,5 + 12 dot 17,5 + 18 dot 22,5 + 10 dot 27,5 + 4 dot 32,5)/50 = (75 + 210 + 405 + 275 + 130)/50 = 1095/50 = 21,9. $
      Mệnh đề nói $21$ là sai. Ý a *SAI*.
      
      *b)* Tần số lớn nhất là 18, tương ứng nhóm $[20; 25)$. Ý b *ĐÚNG*.
      
      *c, d)* Tính phương sai $s^2$:
      $ s^2 = 1/50 [ 6 dot (12,5 - 21,9)^2 + 12 dot (17,5 - 21,9)^2 + 18 dot (22,5 - 21,9)^2 + 10 dot (27,5 - 21,9)^2 + 4 dot (32,5 - 21,9)^2 ] $
      $ = 1/50 [ 6 dot (-9,4)^2 + 12 dot (-4,4)^2 + 18 dot (0,6)^2 + 10 dot (5,6)^2 + 4 dot (10,6)^2 ] $
      $ = 1/50 [ 6 dot 88,36 + 12 dot 19,36 + 18 dot 0,36 + 10 dot 31,36 + 4 dot 112,36 ] $
      $ = 1/50 [ 530,16 + 232,32 + 6,48 + 313,6 + 449,44 ] = 1532 / 50 = 30,64. $
      Phương sai $s^2 = 30,64 > 30$ (do đó ý d *SAI*).
      Độ lệch chuẩn $s = sqrt(30,64) approx 5,535 > 5,5$ (do đó ý c *ĐÚNG*).
    ]
  )

  #ds(
    [Một video ca nhạc được đăng tải trên nền tảng mạng xã hội. Số lượt chia sẻ của video sau $t$ ngày được mô tả bởi công thức tăng trưởng mũ $S(t) = S_0 \cdot 2^(k t)$, trong đó $S_0$ là số lượt chia sẻ ban đầu, $k$ là hằng số tăng trưởng. Biết rằng ngày đầu tiên phát hành ($t = 0$), video có $100$ lượt chia sẻ. Sau đúng $3$ ngày, số lượt chia sẻ đạt tới $800$ lượt.],
    (
      True([Số lượt chia sẻ ban đầu là $S_0 = 100$.]),
      True([Hằng số tăng trưởng $k = 1$.]),
      [Số lượt chia sẻ của video sau $5$ ngày là $1.600$ lượt.],
      True([Sau ít nhất $7$ ngày thì số lượt chia sẻ của video vượt quá $10.000$ lượt.]),
    ),
    loigiai: [
      *a)* Tại $t = 0$, $S(0) = S_0 = 100$. Ý a *ĐÚNG*.
      
      *b)* Tại $t = 3$, $S(3) = 100 \cdot 2^(3k) = 800 <=> 2^(3k) = 8 = 2^3 <=> 3k = 3 <=> k = 1$. Ý b *ĐÚNG*.
      
      *c)* Sau $5$ ngày, số lượt chia sẻ là: $S(5) = 100 \cdot 2^5 = 3.200$ lượt. Ý c *SAI*.
      
      *d)* Ta cần $S(t) > 10.000 <=> 100 \cdot 2^t > 10.000 <=> 2^t > 100 <=> t > log_2 100 approx 6,64$.
      Do đó sau ít nhất $7$ ngày số lượt chia sẻ vượt quá $10.000$. Ý d *ĐÚNG*.
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN III — Trắc nghiệm trả lời ngắn
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

  #tln(
    [Một bộ lọc thư rác của hệ thống email hoạt động dựa trên thống kê sau: $20\%$ số email gửi đến hệ thống là thư rác (spam). Trong số các thư rác, có $90\%$ chứa từ khóa "miễn phí". Trong số các email bình thường (không phải thư rác), có $5\%$ chứa từ khóa "miễn phí". Chọn ngẫu nhiên một email gửi đến hệ thống, biết rằng email này chứa từ khóa "miễn phí". Xác suất để email đó thực sự là thư rác bằng bao nhiêu? (Làm tròn kết quả đến hàng phần trăm).],
    [0,82],
    loigiai: [
      #ppgiai[
        Sử dụng công thức Bayes để tính xác suất có điều kiện.
      ]
      Gọi $S$ là biến cố email là thư rác, $P(S) = 0,20$.
      Gọi $S'$ là biến cố email bình thường, $P(S') = 0,80$.
      Gọi $F$ là biến cố email chứa từ khóa "miễn phí". Theo đề bài:
      $ P(F | S) = 0,90; quad P(F | S') = 0,05. $
      Xác suất đầy đủ để email chứa từ "miễn phí" là:
      $ P(F) = P(S) \cdot P(F | S) + P(S') \cdot P(F | S') = 0,20 \cdot 0,90 + 0,80 \cdot 0,05 = 0,18 + 0,04 = 0,22. $
      Xác suất email đó là thư rác khi biết nó chứa từ "miễn phí" là:
      $ P(S | F) = (P(S) \cdot P(F | S)) / P(F) = (0,20 \cdot 0,90) / 0,22 = 0,18 / 0,22 = 9/11 approx 0,818. $
      Làm tròn đến hàng phần trăm ta được $0,82$.
    ]
  )

  #tln(
    [Một doanh nghiệp muốn sản xuất những chiếc lon hình trụ kín có thể tích chứa đúng $V = 2000 pi$ $c m^3$. Hãy tìm bán kính đáy $r$ (cm) của lon nước để tổng diện tích toàn phần của lon nước là nhỏ nhất (giúp tiết kiệm nguyên liệu sản xuất nhất).],
    [10],
    loigiai: [
      #ppgiai[
        - Thiết lập biểu thức diện tích toàn phần theo bán kính $r$.
        - Tìm giá trị cực tiểu của hàm số diện tích.
      ]
      Thể tích của hình trụ: $V = pi r^2 h = 2000 pi => h = 2000 / r^2$.
      Diện tích toàn phần của hình trụ kín:
      $ S_(t p) = 2 pi r^2 + 2 pi r h = 2 pi r^2 + 2 pi r \cdot (2000 / r^2) = 2 pi (r^2 + 2000/r). $
      Xét hàm số $f(r) = r^2 + 2000/r$ với $r > 0$.
      Đạo hàm: $f'(r) = 2r - 2000/r^2$.
      Cho $f'(r) = 0 <=> 2r^3 - 2000 = 0 <=> r^3 = 1000 <=> r = 10$ (cm).
      Bảng biến thiên cho thấy $f(r)$ đạt giá trị nhỏ nhất tại $r = 10$.
      Vậy bán kính đáy cần tìm là $10$ cm.
    ]
  )

  #tln(
    [Trong không gian tọa độ $O x y z$, cho mặt cầu $(S): (x-3)^2 + (y-4)^2 + z^2 = 4$ và đường thẳng $d$ chính là trục cao độ $O z$. Hãy tìm khoảng cách ngắn nhất giữa một điểm $M$ di động trên mặt cầu $(S)$ và đường thẳng $d$.],
    [3],
    loigiai: [
      #ppgiai[
        - Tìm tâm $I$ và bán kính $R$ của mặt cầu.
        - Tính khoảng cách từ tâm $I$ đến trục $O z$.
        - Khoảng cách ngắn nhất là $d(I, O z) - R$.
      ]
      Mặt cầu $(S)$ có tâm $I(3; 4; 0)$ và bán kính $R = 2$.
      Khoảng cách từ điểm $I(3; 4; 0)$ đến trục $O z$ là:
      $ d(I, O z) = sqrt(x_I^2 + y_I^2) = sqrt(3^2 + 4^2) = 5. $
      Khoảng cách ngắn nhất từ một điểm trên mặt cầu đến trục $O z$ là:
      $ d_(min) = d(I, O z) - R = 5 - 2 = 3. $
      Vậy đáp số là $3$.
    ]
  )

  #tln(
    [Để đánh giá sự bất bình đẳng trong phân phối thu nhập của một quốc gia, người ta sử dụng đường Lorenz có phương trình $L(x) = x^2$ với $x in [0; 1]$ là tỷ lệ cộng dồn dân số và $L(x)$ là tỷ lệ cộng dồn thu nhập. Hệ số Gini $G$ biểu thị độ bất bình đẳng được tính bằng công thức $G = 2 integral_0^1 (x - L(x)) dif x$. Hãy tính hệ số Gini của quốc gia đó (làm tròn kết quả đến hàng phần trăm).],
    [0,33],
    loigiai: [
      Ta có:
      $ G = 2 integral_0^1 (x - x^2) dif x = 2 [x^2/2 - x^3/3]_0^1 = 2 (1/2 - 1/3) = 2 \cdot 1/6 = 1/3 approx 0,333. $
      Làm tròn đến hàng phần trăm ta được $0,33$.
    ]
  )

  #tln(
    [Một người gửi đều đặn mỗi tháng $5$ triệu đồng vào ngân hàng theo hình thức tiết kiệm tích lũy với lãi suất $0,5\%$ mỗi tháng. Khoản tiền gửi được thực hiện vào đầu mỗi tháng. Hỏi sau đúng $2$ năm (24 tháng), tổng số tiền người đó nhận được (gồm cả gốc và lãi) là bao nhiêu triệu đồng? (Làm tròn kết quả đến hàng đơn vị).],
    [128],
    loigiai: [
      #ppgiai[
        Sử dụng công thức tính tổng số tiền tích lũy đều đặn đầu kỳ:
        $ S_n = P \cdot ((1 + r)^n - 1)/r \cdot (1 + r). $
      ]
      Với $P = 5$ triệu đồng, $r = 0,5\% = 0,005$, $n = 24$.
      Tổng số tiền nhận được sau 24 tháng là:
      $ S_(24) = 5 \cdot ((1,005)^(24) - 1)/0,005 \cdot 1,005 $
      $ S_(24) approx 5 \cdot (1,12716 - 1)/0,005 \cdot 1,005 = 5 \cdot 25,432 \cdot 1,005 approx 127,8 " triệu đồng". $
      Làm tròn đến hàng đơn vị ta được $128$ triệu đồng.
    ]
  )

  #tln(
    [Cho hàm số $y = f(x)$ có đạo hàm liên tục trên $RR$ và có đồ thị đạo hàm $f'(x)$ như hình vẽ. Biết rằng hàm số $g(x) = f(x^2 - 4x)$ đạt cực trị tại các nghiệm của phương trình $g'(x) = 0$. Hỏi hàm số $g(x)$ có bao nhiêu điểm cực trị, biết phương trình $f'(x) = 0$ có đúng 3 nghiệm phân biệt là $x = -2, x = 0, x = 2$?
      #align(center)[
        #cetz.canvas(length: 0.6cm, {
          import cetz.draw: *
          line((-3.5, 0), (3.5, 0), mark: (end: ">"))
          content((3.5, 0.3), $x$)
          line((0, -2.5), (0, 2.5), mark: (end: ">"))
          content((0.3, 2.5), $y$)
          
          let pts = ()
          for i in range(-25, 26) {
            let x = i / 10.0
            let y = 0.3 * x * (x * x - 4)
            pts.push((x, y))
          }
          line(..pts, stroke: 1.2pt + black)
          circle((-2, 0), radius: 2pt, fill: black)
          content((-2, 0.4), $-2$)
          circle((2, 0), radius: 2pt, fill: black)
          content((2, -0.4), $2$)
          content((-0.3, -0.3), $O$)
        })
      ]
    ],
    [7],
    loigiai: [
      Ta có $g'(x) = (2x - 4) f'(x^2 - 4x)$.
      Cho $g'(x) = 0 <=> 2x - 4 = 0$ hoặc $f'(x^2 - 4x) = 0$.
      - $2x - 4 = 0 <=> x = 2$.
      - $f'(x^2 - 4x) = 0 <=> x^2 - 4x = -2$ hoặc $x^2 - 4x = 0$ hoặc $x^2 - 4x = 2$.
      Xét các phương trình bậc hai:
      1) $x^2 - 4x + 2 = 0$ có $Delta' = 4 - 2 = 2 > 0$ nên có 2 nghiệm phân biệt.
      2) $x^2 - 4x = 0$ có 2 nghiệm phân biệt là $x = 0, x = 4$.
      3) $x^2 - 4x - 2 = 0$ có $Delta' = 4 + 2 = 6 > 0$ nên có 2 nghiệm phân biệt.
      Tất cả các nghiệm này đều là nghiệm đơn và đôi một khác nhau (và khác $2$).
      Tổng số nghiệm đơn của phương trình $g'(x) = 0$ là: $1 + 2 + 2 + 2 = 7$ nghiệm.
      Do đó hàm số $g(x)$ có 7 điểm cực trị.
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
    os.makedirs("typst/De-Cac-So", exist_ok=True)
    with open("typst/De-Cac-So/2026-Tự-Chế-Lần-4.typ", "w", encoding="utf-8") as f:
        f.write(content)
    print("Created exam 4")
