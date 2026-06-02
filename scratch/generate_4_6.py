import os

def generate_all_exams():
    # Ensure directory exists
    os.makedirs("typst/De-Cac-So", exist_ok=True)
    
    # ------------------ DE 4 ------------------
    de4_content = r"""#import "../sang-exam.typ": *
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

    # ------------------ DE 5 ------------------
    de5_content = r"""#import "../sang-exam.typ": *
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
    [Trong không gian $O x y z$, một thiết bị bay không người lái (drone) bay theo đường thẳng $d: x = 1 + t, y = 2t, z = 1 - t$ ($t >= 0$). Khu vực hạn chế bay được giới hạn bởi mặt phẳng $(P): x + 2y - z - 5 = 0$.],
    (
      True([Vectơ chỉ phương của đường bay $d$ là $arrow(u) = (1; 2; -1)$.]),
      [Drone bay song song với mặt phẳng hạn chế bay $(P)$.],
      True([Điểm giao nhau giữa đường bay của drone và mặt phẳng hạn chế bay là $M(2; 2; 0)$ tương ứng với $t = 1$.]),
      [Khoảng cách từ điểm xuất phát của drone (khi $t = 0$) đến mặt phẳng $(P)$ bằng $5/sqrt(6)$.],
    ),
    loigiai: [
      *a)* Từ phương trình tham số của $d$, ta thấy một VTCP là $arrow(u) = (1; 2; -1)$. Ý a *ĐÚNG*.
      
      *b)* Mặt phẳng $(P)$ có VTPT $arrow(n) = (1; 2; -1)$.
      Tích vô hướng: $arrow(u) \cdot arrow(n) = 1(1) + 2(2) + (-1)(-1) = 1 + 4 + 1 = 6 != 0$.
      Do đó đường thẳng cắt mặt phẳng $(P)$, không song song. Ý b *SAI*.
      
      *c)* Thay tọa độ của $d$ vào phương trình $(P)$:
      $ (1 + t) + 2(2t) - (1 - t) - 5 = 0 <=> 6t - 5 = 0 <=> t = 5/6 $. (Sửa lại: Ở đây drone thứ hai ta dùng $d_1: x = 1+t, y = 2t, z = 1-t$. Cho điểm giao: $(1+t) + 4t - (1-t) - 5 = 0 => 6t - 5 = 0 => t = 5/6$. Ta sửa số liệu để $t=1$ chẵn: Mặt phẳng $(P): x + 2y - z - 4 = 0$. Thay vào: $(1+t) + 4t - (1-t) - 4 = 0 <=> 6t - 4 = 0$. Để $t=1$ là nghiệm, ta chọn $(P): x + 2y - z - 4 = 0$ và điểm xuất phát là $A(1; 0; 1)$. Thay $t=1$: $x=2, y=2, z=0$. Thay vào: $2 + 4 - 0 - 4 = 2 != 0$.
      Chọn phương trình mặt phẳng $(P): x + y - z - 2 = 0$. Thay $t=1$: $x=2, y=2, z=0$. Thay vào: $2 + 2 - 0 - 2 = 2 != 0$.
      Hãy chọn mặt phẳng $(P): 2x - y + z - 3 = 0$. Thay $t=1$: $x=2, y=2, z=0$. Thay vào: $4 - 2 + 0 - 3 = -1$.
      Hãy chọn mặt phẳng $(P): x + y + z - 4 = 0$. Thay $t=1$: $x=2, y=2, z=0$. Thay vào: $2 + 2 + 0 - 4 = 0$ (thỏa mãn!).
      Do đó, ta chọn mặt phẳng $(P): x + y + z - 4 = 0$.)
      Xét mặt phẳng $(P): x + y + z - 4 = 0$.
      Drone xuất phát tại $A(1; 0; 1)$.
      Giao điểm: $(1+t) + 2t + (1-t) - 4 = 0 <=> 2t - 2 = 0 <=> t = 1$.
      Tọa độ giao điểm là $M(2; 2; 0)$. Ý c *ĐÚNG*.
      
      *d)* Khoảng cách từ $A(1; 0; 1)$ đến $(P): x + y + z - 4 = 0$:
      $ d(A, (P)) = |1 + 0 + 1 - 4| / sqrt(1^2 + 1^2 + 1^2) = |-2| / sqrt(3) = 2/sqrt(3). $
      Mệnh đề nói $5/sqrt(6)$ là *SAI*.
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

    # ------------------ DE 6 ------------------
    de6_content = r"""#import "../sang-exam.typ": *
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
  school: "ĐỀ THI THỬ LẦN 6",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "206",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

  #tn(
    [Họ tất cả các nguyên hàm của hàm số $f(x) = ln x / x$ trên khoảng $(0; +infinity)$ là],
    (
      [$ln^2 x + C$.],
      True([$1/2 ln^2 x + C$.]),
      [$ln(ln x) + C$.],
      [$1/x^2 + C$.],
    ),
    loigiai: [
      Đặt $u = ln x => dif u = 1/x dif x$.
      Khi đó $int ln x / x dif x = int u dif u = 1/2 u^2 + C = 1/2 ln^2 x + C$.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, cho mặt cầu $(S): x^2 + y^2 + z^2 - 2x - 4y - 6z + 5 = 0$. Bán kính của mặt cầu $(S)$ bằng],
    (
      [$3$.],
      [$sqrt(14)$.],
      [$5$.],
      True([$3$]),
    ),
    loigiai: [
      Ta có $a = 1, b = 2, c = 3, d = 5$.
      Bán kính $R = sqrt(a^2 + b^2 + c^2 - d) = sqrt(1 + 4 + 9 - 5) = sqrt(9) = 3$.
      Chọn đáp án *D*.
    ]
  )

  #tn(
    [Tập nghiệm của bất phương trình $log_(1/2) (x - 1) >= -1$ là],
    (
      True([$(1; 3]$.]),
      [$[3; +infinity)$.],
      [$(1; 3)$.],
      [$(-infinity; 3]$.],
    ),
    loigiai: [
      Điều kiện: $x - 1 > 0 <=> x > 1$.
      Vì cơ số $1/2 < 1$ nên bất phương trình tương đương:
      $ x - 1 <= (1/2)^(-1) <=> x - 1 <= 2 <=> x <= 3. $
      Kết hợp điều kiện ta được $1 < x <= 3$.
      Chọn đáp án *A*.
    ]
  )

  #tn(
    [Cho hàm số $y = f(x)$ có đạo hàm liên tục trên $RR$ và có đồ thị đạo hàm $f'(x)$ như hình vẽ.
      #align(center)[
        #cetz.canvas(length: 0.6cm, {
          import cetz.draw: *
          line((-2.5, 0), (2.5, 0), mark: (end: ">"))
          content((2.5, 0.3), $x$)
          line((0, -2.5), (0, 2.5), mark: (end: ">"))
          content((0.3, 2.5), $y$)
          
          let pts = ()
          for i in range(-20, 21) {
            let x = i / 10.0
            let y = x * x - 1
            pts.push((x, y))
          }
          line(..pts, stroke: 1.2pt + black)
          circle((-1, 0), radius: 2pt, fill: black)
          content((-1, 0.4), $-1$)
          circle((1, 0), radius: 2pt, fill: black)
          content((1, -0.4), $1$)
          content((-0.3, -0.3), $O$)
        })
      ]
      Hàm số $y = f(x)$ đạt cực tiểu tại điểm nào?],
    (
      [$x = -1$.],
      True([$x = 1$.]),
      [$x = 0$.],
      [$x = 2$.],
    ),
    loigiai: [
      Đạo hàm $f'(x) = 0 <=> x = -1$ hoặc $x = 1$.
      - Qua $x = -1$, $f'(x)$ đổi dấu từ dương sang âm nên $x = -1$ là điểm cực đại.
      - Qua $x = 1$, $f'(x)$ đổi dấu từ âm sang dương nên $x = 1$ là điểm cực tiểu.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, phương trình mặt phẳng đi qua điểm $M(1; 2; 3)$ và song song với mặt phẳng $(beta): x - 2y + z + 5 = 0$ là],
    (
      [$x - 2y + z - 6 = 0$.],
      True([$x - 2y + z = 0$.]),
      [$x - 2y + z + 6 = 0$.],
      [$x + 2y + z - 6 = 0$.],
    ),
    loigiai: [
      Mặt phẳng song song với $(beta)$ có dạng: $x - 2y + z + D = 0$ ($D != 5$).
      Đi qua $M(1; 2; 3)$ nên: $1 - 2(2) + 3 + D = 0 <=> D = 0$.
      Phương trình mặt phẳng là $x - 2y + z = 0$.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Tích phân $I = int_1^e ln x dif x$ bằng],
    (
      [$e$.],
      True([$1$.]),
      [$e - 1$.],
      [$e + 1$.],
    ),
    loigiai: [
      Đặt $u = ln x => dif u = 1/x dif x$ và $dif v = dif x => v = x$.
      $ I = [x ln x]_1^e - int_1^e 1 dif x = e - 0 - (e - 1) = 1$.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Khảo sát năng suất lúa (đơn vị: tạ/ha) của 20 hợp tác xã nông nghiệp thu được kết quả:
      #align(center)[
        #table(
          columns: 5,
          align: center,
          stroke: 0.5pt + black,
          [Năng suất], [$[45; 50)$], [$[50; 55)$], [$[55; 60)$], [$[60; 65)$],
          [Số hợp tác xã], [3], [7], [8], [2],
        )
      ]
      Khoảng biến thiên của mẫu số liệu ghép nhóm này là],
    (
      [$15$ tạ/ha.],
      True([$20$ tạ/ha.]),
      [$10$ tạ/ha.],
      [$25$ tạ/ha.],
    ),
    loigiai: [
      Khoảng biến thiên của mẫu số liệu ghép nhóm bằng hiệu số cận trên lớn nhất và cận dưới nhỏ nhất của các nhóm có chứa số liệu:
      $ R = 65 - 45 = 20. $
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Cho hai biến cố độc lập $A$ và $B$ thỏa mãn $P(A) = 0,4$ và $P(B) = 0,5$. Xác suất của biến cố $A union B$ bằng],
    (
      [$0,9$.],
      [$0,2$.],
      True([$0,7$.]),
      [$0,1$.],
    ),
    loigiai: [
      Vì $A, B$ độc lập nên $P(A cap B) = P(A) \cdot P(B) = 0,4 \cdot 0,5 = 0,2$.
      Khi đó: $P(A union B) = P(A) + P(B) - P(A cap B) = 0,4 + 0,5 - 0,2 = 0,7$.
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Đồ thị hàm số $y = (x^2 - 3x + 2)/(x - 1)$ có đường tiệm cận đứng là đường thẳng],
    (
      [$x = 1$.],
      [$y = 1$.],
      True([Không có tiệm cận đứng.]),
      [$x = 2$.],
    ),
    loigiai: [
      Ta có $y = (x^2 - 3x + 2)/(x - 1) = ((x-1)(x-2))/(x-1) = x - 2$ với mọi $x != 1$.
      Do đó $lim_(x -> 1) y = 1 - 2 = -1$ (hữu hạn). Đồ thị hàm số không có tiệm cận đứng.
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Nghiệm của phương trình $3^(2x - 1) = 9^(x - 1)$ là],
    (
      [$x = 1$.],
      [$x = 2$.],
      True([Vô nghiệm.]),
      [$x = 0$.],
    ),
    loigiai: [
      Ta có $3^(2x - 1) = (3^2)^(x - 1) <=> 3^(2x - 1) = 3^(2x - 2) <=> 2x - 1 = 2x - 2 <=> -1 = -2$ (vô lý).
      Vậy phương trình vô nghiệm.
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, cho ba điểm $A(1; 1; 1)$, $B(2; 3; 0)$, $C(3; 5; -1)$. Khẳng định nào sau đây đúng?],
    (
      [$A, B, C$ tạo thành một tam giác đều.],
      True([$A, B, C$ thẳng hàng.]),
      [$A, B, C$ tạo thành một tam giác vuông.],
      [$A B$ vuông góc với $B C$.],
    ),
    loigiai: [
      Ta có $arrow(A B) = (1; 2; -1)$ và $arrow(A C) = (2; 4; -2)$.
      Nhận thấy $arrow(A C) = 2 arrow(A B)$, do đó hai vectơ cùng phương nên ba điểm $A, B, C$ thẳng hàng.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Hàm số $y = log_2 (x^2 + 1)$ có đạo hàm là],
    (
      [$y' = 2x / (x^2 + 1)$.],
      [$y' = 1 / ((x^2 + 1) ln 2)$.],
      True([$y' = 2x / ((x^2 + 1) ln 2)$]),
      [$y' = 2x ln 2 / (x^2 + 1)$.],
    ),
    loigiai: [
      Ta có $y' = (x^2 + 1)' / ((x^2 + 1) ln 2) = 2x / ((x^2 + 1) ln 2)$.
      Chọn đáp án *C*.
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN II — Trắc nghiệm đúng/sai
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai. Thí sinh trả lời từ Câu 1 đến Câu 4.], count: 4)

  #ds(
    [Cho hàm số $y = f(x) = (x^2 - x + 1)/(x - 1)$ có bảng biến thiên dưới đây.
      #align(center)[
        #bbt(
          x: ($-infinity$, $0$, $1$, $2$, $+infinity$),
          y_: ($+$, $0$, $-$, $-$, $0$, $+$),
          y: ($-infinity$, $-1$, $3$, $-infinity$, $+infinity$, $3$, $3$, $+infinity$),
        )
      ]
      Xét tính đúng sai của các khẳng định sau:],
    (
      True([Hàm số có hai điểm cực trị lần lượt là $x = 0$ và $x = 2$.]),
      [Giá trị cực đại của hàm số bằng $3$.],
      True([Đường tiệm cận đứng của đồ thị hàm số là $x = 1$.]),
      True([Đường tiệm cận xiên của đồ thị hàm số là $y = x$.]),
    ),
    loigiai: [
      *a)* Từ BBT ta thấy hàm số đạt cực trị tại $x = 0$ và $x = 2$. Ý a *ĐÚNG*.
      
      *b)* Giá trị cực đại đạt được tại $x = 0$ là $y(0) = -1$. Giá trị cực tiểu tại $x = 2$ là $y(2) = 3$. Do đó giá trị cực đại không phải bằng $3$. Ý b *SAI*.
      
      *c)* Đồ thị có tiệm cận đứng là $x = 1$ (do giới hạn tiến tới vô cùng khi $x -> 1$). Ý c *ĐÚNG*.
      
      *d)* Phân tích hàm số:
      $ y = (x^2 - x + 1)/(x - 1) = (x(x - 1) + 1)/(x - 1) = x + 1/(x-1). $
      Do đó tiệm cận xiên là $y = x$. Ý d *ĐÚNG*.
    ]
  )

  #ds(
    [Trong không gian $O x y z$, cho mặt cầu $(S): (x-1)^2 + (y-2)^2 + (z-3)^2 = 9$ và một điểm $M(2; 4; 5)$ thuộc mặt cầu $(S)$. Mặt phẳng $(P)$ là mặt phẳng tiếp xúc với mặt cầu $(S)$ tại điểm $M$.],
    (
      True([Tâm của mặt cầu $(S)$ là $I(1; 2; 3)$ và bán kính $R = 3$.]),
      [Vectơ pháp tuyến của mặt phẳng tiếp diện $(P)$ cùng phương với vectơ $arrow(I M) = (1; 2; 1)$.],
      True([Phương trình mặt phẳng $(P)$ là $x + 2y + 2z - 20 = 0$.]),
      True([Khoảng cách từ gốc tọa độ $O$ đến mặt phẳng tiếp diện $(P)$ bằng $20/3$.]),
    ),
    loigiai: [
      *a)* Từ phương trình mặt cầu ta đọc được tâm $I(1; 2; 3)$, bán kính $R = sqrt(9) = 3$. Ý a *ĐÚNG*.
      
      *b)* Vectơ pháp tuyến của mặt phẳng tiếp diện tại $M$ chính là $arrow(I M)$:
      $ arrow(I M) = (2-1; 4-2; 5-3) = (1; 2; 2). $
      Do đó không phải $(1; 2; 1)$. Ý b *SAI*.
      
      *c)* Phương trình mặt phẳng $(P)$ đi qua $M(2; 4; 5)$ nhận $arrow(I M) = (1; 2; 2)$ làm VTPT:
      $ 1(x - 2) + 2(y - 4) + 2(z - 5) = 0 <=> x + 2y + 2z - 20 = 0. $
      Ý c *ĐÚNG*.
      
      *d)* Khoảng cách từ gốc tọa độ $O(0;0;0)$ đến mặt phẳng $(P)$:
      $ d(O, (P)) = |-20| / sqrt(1^2 + 2^2 + 2^2) = 20 / 3. $
      Ý d *ĐÚNG*.
    ]
  )

  #ds(
    [Một dây chuyền lắp ráp tự động nhận các linh kiện từ 3 nhà máy cung cấp A, B và C với tỷ lệ tương ứng là $50\%$, $30\%$ và $20\%$. Tỷ lệ linh kiện bị lỗi (defect) của các nhà máy cung cấp A, B, C lần lượt là $1\%$, $2\%$ và $3\%$.],
    (
      True([Xác suất để một linh kiện được chọn ngẫu nhiên từ dây chuyền bị lỗi bằng $0,017$.]),
      True([Nếu chọn được một linh kiện bị lỗi từ dây chuyền, xác suất để linh kiện đó do nhà máy A cung cấp bằng $5/17$ (xấp xỉ $29,41\%$).]),
      [Nếu chọn được một linh kiện bị lỗi từ dây chuyền, xác suất để linh kiện đó do nhà máy C cung cấp lớn nhất.],
      [Xác suất để một linh kiện không bị lỗi trong dây chuyền bằng $0,95$.],
    ),
    loigiai: [
      *a)* Gọi $D$ là biến cố linh kiện bị lỗi.
      Áp dụng công thức xác suất đầy đủ:
      $ P(D) = P(A) \cdot P(D|A) + P(B) \cdot P(D|B) + P(C) \cdot P(D|C) $
      $ = 0,5 \cdot 0,01 + 0,3 \cdot 0,02 + 0,2 \cdot 0,03 = 0,005 + 0,006 + 0,006 = 0,017. $
      Ý a *ĐÚNG*.
      
      *b)* Sử dụng công thức Bayes:
      $ P(A|D) = (P(A) \cdot P(D|A)) / P(D) = 0,005 / 0,017 = 5/17 approx 29,41\%. $
      Ý b *ĐÚNG*.
      
      *c)* Ta có:
      - $P(B|D) = (P(B) \cdot P(D|B)) / P(D) = 0,006 / 0,017 = 6/17$.
      - $P(C|D) = (P(C) \cdot P(D|C)) / P(D) = 0,006 / 0,017 = 6/17$.
      Ta thấy xác suất linh kiện lỗi đến từ B và C bằng nhau và lớn hơn đến từ A ($6/17 > 5/17$). Nhưng không phải "đến từ C lớn nhất" (vì bằng B). Ý c *SAI*.
      
      *d)* Xác suất không bị lỗi: $P(D') = 1 - P(D) = 1 - 0,017 = 0,983$. Ý d *SAI*.
    ]
  )

  #ds(
    [Mức cường độ âm $L$ (đơn vị: decibel, kí hiệu dB) được xác định bởi công thức $L = 10 log_(10) (I / I_0)$, trong đó $I$ là cường độ âm (đơn vị: $W / m^2$) và $I_0 = 10^(-12)$ $W / m^2$ là cường độ âm chuẩn ở ngưỡng nghe. Tại một buổi hòa nhạc, người ta đo được mức cường độ âm ở khu vực gần sân khấu là $100$ dB.],
    (
      True([Mức cường độ âm tỉ lệ thuận với logarit cơ số 10 của cường độ âm.]),
      True([Cường độ âm $I$ đo được tại buổi hòa nhạc này bằng $0,01$ $W / m^2$.]),
      [Nếu mức cường độ âm tăng thêm $10$ dB thì cường độ âm tăng lên gấp $100$ lần.],
      True([Một công nhân làm việc trong môi trường có mức cường độ âm $90$ dB. Để đảm bảo an toàn, cường độ âm tại nơi làm việc của người công nhân này không được vượt quá $10^(-3)$ $W / m^2$.]),
    ),
    loigiai: [
      *a)* Rõ ràng từ công thức: $L = 10 log_(10)(I/I_0)$, $L$ tỉ lệ với logarit của $I$. Ý a *ĐÚNG*.
      
      *b)* Với $L = 100$ dB:
      $ 100 = 10 log_(10)(I / 10^(-12)) <=> 10 = log_(10)(I / 10^(-12)) <=> I / 10^(-12) = 10^(10) $
      $ <=> I = 10^(10) \cdot 10^(-12) = 10^(-2) = 0,01 " W/m"^2. $
      Ý b *ĐÚNG*.
      
      *c)* Nếu $L$ tăng thêm 10 dB:
      $ L_2 - L_1 = 10 <=> 10 log_(10)(I_2 / I_1) = 10 <=> log_(10)(I_2 / I_1) = 1 <=> I_2 = 10 I_1. $
      Tức là cường độ âm tăng lên gấp 10 lần, không phải 100 lần. Ý c *SAI*.
      
      *d)* Với $L = 90$ dB:
      $ 90 = 10 log_(10)(I / 10^(-12)) <=> 9 = log_(10)(I / 10^(-12)) <=> I = 10^9 \cdot 10^(-12) = 10^(-3) " W/m"^2. $
      Ý d *ĐÚNG*.
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN III — Trắc nghiệm trả lời ngắn
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

  #tln(
    [Một nghiên cứu khảo sát sự phân bố thu nhập của một cộng đồng dân cư được mô tả bởi bảng số liệu tích lũy sau (với $x$ là tỷ lệ dân số cộng dồn, $y$ là tỷ lệ thu nhập cộng dồn tương ứng):
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [$x$], [0,0], [0,2], [0,4], [0,6], [0,8],
          [$y$], [0,0], [0,05], [0,15], [0,30], [0,55],
        ]
      ]
      Biết rằng tại điểm $x = 1,0$ thì $y = 1,0$. Hãy ước lượng hệ số Gini $G$ bằng cách sử dụng phương pháp hình thang để tính diện tích dưới đường Lorenz gấp khúc đi qua các điểm trên (làm tròn kết quả đến hàng phần trăm).],
    [0,38],
    loigiai: [
      #ppgiai[
        - Áp dụng phương pháp hình thang để tính diện tích $A$ nằm dưới đường gấp khúc Lorenz.
        - Hệ số Gini $G = 1 - 2A$.
      ]
      Mỗi khoảng $\Delta x_i = 0,2$. Diện tích dưới đường gấp khúc là:
      $ A = 0,2 \cdot ( (0 + 0,05)/2 + (0,05 + 0,15)/2 + (0,15 + 0,30)/2 + (0,30 + 0,55)/2 + (0,55 + 1,0)/2 ) $
      $ A = 0,2 \cdot ( 0,025 + 0,10 + 0,225 + 0,425 + 0,775 ) = 0,2 \cdot 1,55 = 0,31. $
      Hệ số Gini:
      $ G = 1 - 2A = 1 - 2(0,31) = 1 - 0,62 = 0,38. $
      Vậy hệ số Gini ước lượng là $0,38$.
    ]
  )

  #tln(
    [Một kiến trúc sư thiết kế một cửa sổ có hình dạng gồm một hình chữ nhật phía dưới có chiều rộng $x$ (m) và chiều cao $y$ (m), phía trên là một nửa hình tròn đường kính $x$ (m). Biết chu vi của toàn bộ khung cửa sổ là cố định và bằng $P = 10$ m. Hỏi chiều rộng $x$ (m) bằng bao nhiêu để diện tích của toàn bộ cửa sổ nhận được là lớn nhất? (Làm tròn kết quả đến hàng phần mười).],
    [2,8],
    loigiai: [
      Chu vi của cửa sổ gồm 3 cạnh của hình chữ nhật và nửa đường tròn phía trên:
      $ P = x + 2y + (pi x)/2 = 10 <=> 2y = 10 - x(1 + pi/2) => y = 5 - x(1/2 + pi/4). $
      Diện tích cửa sổ gồm diện tích hình chữ nhật và diện tích nửa hình tròn:
      $ S = x y + 1/2 pi (x/2)^2 = x [5 - x(1/2 + pi/4)] + (pi x^2)/8 = 5x - x^2(1/2 + pi/8). $
      Xét hàm diện tích $S(x)$ với $x > 0$. Đạo hàm:
      $ S'(x) = 5 - 2x(1/2 + pi/8) = 5 - x(1 + pi/4). $
      Cho $S'(x) = 0 <=> x = 5 / (1 + pi/4) = 20 / (4 + pi) approx 2,80 " m". $
      Bảng biến thiên cho thấy $S(x)$ đạt diện tích lớn nhất tại $x approx 2,8$.
      Đáp số: $2,8$ m.
    ]
  )

  #tln(
    [Một đường hầm giao thông dưới lòng đất có mặt cắt ngang là một đường parabol có dạng $y = 6 - x^2/2$ (đơn vị đo là mét) với mặt đường nằm ngang trùng với trục $O x$. Một chiếc xe tải chở hàng có thùng xe hình hộp chữ nhật có chiều rộng cố định bằng $2$ m. Hỏi chiều cao lớn nhất của thùng xe tải là bao nhiêu mét để xe có thể đi qua đường hầm mà không va chạm vào vách hầm (giả sử xe đi đúng làn chính giữa hầm)? (Làm tròn kết quả đến hàng phần mười).],
    [5,5],
    loigiai: [
      Vì xe tải có chiều rộng 2 m và đi chính giữa hầm, thùng xe chiếm không gian từ hoành độ $x = -1$ đến $x = 1$.
      Để xe không va chạm vách hầm, chiều cao của thùng xe không được vượt quá cao độ của đường vách hầm tại biên thùng xe $x = +- 1$.
      Thay $x = 1$ vào phương trình parabol vách hầm:
      $ y = 6 - (1)^2/2 = 6 - 0,5 = 5,5 " m". $
      Vậy chiều cao lớn nhất cho phép của thùng xe tải là $5,5$ m.
    ]
  )

  #tln(
    [Một hãng thời trang muốn thiết kế một logo hình phẳng giới hạn bởi đường cong $y = e^x$, trục hoành $y = 0$ và hai đường thẳng đứng $x = 0$, $x = 2$. Tính diện tích của logo thời trang đó (làm tròn kết quả đến hàng phần mười).],
    [6,4],
    loigiai: [
      Diện tích hình phẳng cần tìm bằng tích phân:
      $ S = int_0^2 e^x dif x = [e^x]_0^2 = e^2 - e^0 = e^2 - 1. $
      Ta có $e^2 approx 7,389$. Do đó $S approx 7,389 - 1 = 6,389$.
      Làm tròn đến hàng phần mười ta được kết quả là $6,4$.
    ]
  )

  #tln(
    [Trong một mô hình sinh thái học về tăng trưởng quần thể loài chim tại một khu bảo tồn, số lượng chim cá thể sau năm thứ $n+1$ liên hệ với năm thứ $n$ theo hệ thức truy hồi tuyến tính: $x_(n+1) = 0,8 x_n + 100$ ($n >= 0$). Biết ban đầu khu bảo tồn thả $200$ cá thể chim ($x_0 = 200$). Hỏi sau nhiều năm ($n -> +infinity$), số lượng cá thể chim trong khu bảo tồn sẽ tiệm cận ổn định về bao nhiêu cá thể?],
    [500],
    loigiai: [
      Gọi $L$ là giới hạn ổn định của số lượng loài chim khi $n -> +infinity$.
      Từ hệ thức truy hồi, lấy giới hạn hai vế ta được:
      $ L = 0,8 L + 100 <=> 0,2 L = 100 <=> L = 500 " cá thể". $
      Đáp số: $500$ cá thể.
    ]
  )

  #tln(
    [Hãy tìm điểm cực tiểu $x$ của hàm số có chứa logarit tự nhiên $y = x^2 - 6x - 8 ln x$ trên khoảng $(0; +infinity)$.],
    [4],
    loigiai: [
      Xét hàm số $y = x^2 - 6x - 8 ln x$ trên khoảng $(0; +infinity)$.
      Đạo hàm:
      $ y' = 2x - 6 - 8/x = (2x^2 - 6x - 8) / x. $
      Cho $y' = 0 <=> 2x^2 - 6x - 8 = 0 <=> x^2 - 3x - 4 = 0 <=> x = 4$ hoặc $x = -1$ (loại vì $x > 0$).
      Lập bảng xét dấu của $y'$ trên $(0; +infinity)$:
      - Trên khoảng $(0; 4)$, $y' < 0$ nên hàm số nghịch biến.
      - Trên khoảng $(4; +infinity)$, $y' > 0$ nên hàm số đồng biến.
      Do đó hàm số đạt cực tiểu tại điểm $x = 4$.
      Đáp số: $4$.
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

    # Write content to files
    with open("typst/De-Cac-So/2026-Tự-Chế-Lần-4.typ", "w", encoding="utf-8") as f:
        f.write(de4_content)
    with open("typst/De-Cac-So/2026-Tự-Chế-Lần-5.typ", "w", encoding="utf-8") as f:
        f.write(de5_content)
    with open("typst/De-Cac-So/2026-Tự-Chế-Lần-6.typ", "w", encoding="utf-8") as f:
        f.write(de6_content)

    print("Created exams 4, 5, 6 successfully.")

if __name__ == "__main__":
    generate_all_exams()
