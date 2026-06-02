#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

= CHƯƠNG II — MẶT THAM SỐ VÀ TIẾP DIỆN TRONG KHÔNG GIAN

== 1. Trực Giác Học Thuật: Từ Đường Cong Lên Mặt Cong

Để vẽ một đường cong (1D) trong không gian, ta cần 1 tham số tự do $t$ (giống như thời gian trôi qua trên một đường chạy). Bây giờ, nếu ta muốn dệt nên một mặt cong (2D) – như một dải lụa bay trong gió, vỏ của một quả bóng, hay mái vòm của một tòa nhà – ta cần bao nhiêu biến tự do?

Câu trả lời là *hai biến tự do độc lập*, thường ký hiệu là $u$ và $v$. Khi cặp số $(u, v)$ quét qua một miền phẳng $D$ trên mặt phẳng tọa độ $O u v$, ánh xạ không gian sẽ biến đổi nó thành một bề mặt cong uốn lượn trong không gian 3D:
$ vec(r)(u, v) = (x(u, v), y(u, v), z(u, v)) quad ((u, v) in D) $

#eye-box[
  *Lưới tọa độ trên Quả Địa Cầu:*
  
  Bản chất của mặt tham số giống hệt cách chúng ta định vị một điểm trên Trái Đất bằng kinh độ và vĩ độ:
  - Nếu cố định kinh độ $u = u_0$ và cho vĩ độ $v$ thay đổi, ta sẽ đi dọc theo một *đường kinh tuyến* chạy từ cực Bắc đến cực Nam.
  - Nếu cố định vĩ độ $v = v_0$ và cho kinh độ $u$ thay đổi, ta sẽ đi dọc theo một *đường vĩ tuyến* chạy song song với đường xích đạo.
  - Sự giao nhau của các đường kinh tuyến và vĩ tuyến đan chéo nhau tạo thành một mạng lưới tọa độ hoàn chỉnh bao phủ toàn bộ bề mặt địa cầu. Mỗi cặp kinh vĩ độ $(u, v)$ xác định duy nhất một vị trí 3D trên Trái Đất.
]

#align(center)[
  #canvas(length: 1.1cm, {
    import draw: *
    let sx = -0.4
    let sy = -0.3
    let proj(x, y, z) = (x + y * sx, z + y * sy)
    
    let rows = 6
    let cols = 6
    
    let get-pt(r-val, c-val) = {
      let u = r-val * 0.6
      let v = c-val * 0.6
      let x = u
      let y = v
      let z = 0.5 * calc.sin(u * 1.5) * calc.cos(v * 1.5)
      return proj(x, y, z)
    }
    
    // Vẽ lưới u = const
    for r-val in range(0, rows + 1) {
      let pts-row = ()
      for c-val in range(0, cols + 1) {
        pts-row.push(get-pt(r-val, c-val))
      }
      for i in range(0, cols) {
        line(pts-row.at(i), pts-row.at(i+1), stroke: 0.5pt + rgb("#94A3B8"))
      }
    }
    
    // Vẽ lưới v = const
    for c-val in range(0, cols + 1) {
      let pts-col = ()
      for r-val in range(0, rows + 1) {
        pts-col.push(get-pt(r-val, c-val))
      }
      for i in range(0, rows) {
        line(pts-col.at(i), pts-col.at(i+1), stroke: 0.5pt + rgb("#94A3B8"))
      }
    }
    
    // Chọn một điểm giao lưới làm điểm gốc
    let p-base = get-pt(3, 3)
    let p-u = get-pt(4, 3)
    let p-v = get-pt(3, 4)
    
    // Vẽ vectơ tiếp tuyến riêng phần
    let tu-x = p-u.at(0) - p-base.at(0)
    let tu-y = p-u.at(1) - p-base.at(1)
    let tv-x = p-v.at(0) - p-base.at(0)
    let tv-y = p-v.at(1) - p-base.at(1)
    
    line(p-base, (p-base.at(0) + tu-x * 1.5, p-base.at(1) + tu-y * 1.5), stroke: 1.5pt + rgb("#0D9488"), mark: (end: "stealth", scale: 0.5))
    line(p-base, (p-base.at(0) + tv-x * 1.5, p-base.at(1) + tv-y * 1.5), stroke: 1.5pt + rgb("#BE123C"), mark: (end: "stealth", scale: 0.5))
    
    // Vẽ vectơ pháp tuyến (tích có hướng, hướng thẳng đứng vuông góc tiếp diện)
    line(p-base, (p-base.at(0), p-base.at(1) + 1.8), stroke: 1.8pt + rgb("#0284C7"), mark: (end: "stealth", scale: 0.5))
    circle(p-base, radius: 2pt, fill: rgb("#0F172A"))
    
    content((p-base.at(0) + tu-x * 1.6, p-base.at(1) + tu-y * 1.6), $vec(r)'_u$)
    content((p-base.at(0) + tv-x * 1.6, p-base.at(1) + tv-y * 1.6), $vec(r)'_v$)
    content((p-base.at(0), p-base.at(1) + 2.0), $vec(n)$)
  })
]

== 2. Vectơ Pháp Tuyến và Tiếp Diện Oxyz (Kết nối tích có hướng lớp 12)

Một trong những bài toán quan trọng nhất của Oxyz lớp 12 là viết phương trình mặt phẳng tiếp xúc (tiếp diện) của một bề mặt tại một điểm. Để viết được phương trình mặt phẳng, ta bắt buộc phải tìm được *pháp vectơ* (vectơ vuông góc với mặt phẳng đó).

Đối với mặt tham số, ta tìm pháp vectơ cực kỳ dễ dàng bằng hai bước đơn giản:

1. *Tính đạo hàm riêng phần (đạo hàm chéo):* 
   - Vectơ tiếp tuyến theo hướng $u$ (ký hiệu là $vec(r)'_u$): Ta tính đạo hàm của các thành phần tọa độ theo biến $u$ và coi $v$ là một con số cố định (hằng số):
     $ vec(r)'_u = (x'_u, y'_u, z'_u) $
   - Vectơ tiếp tuyến theo hướng $v$ (ký hiệu là $vec(r)'_v$): Ta tính đạo hàm của các thành phần tọa độ theo biến $v$ và coi $u$ là hằng số:
     $ vec(r)'_v = (x'_v, y'_v, z'_v) $

2. *Nhân tích có hướng để tìm pháp vectơ:*
   Vì hai vectơ tiếp tuyến $vec(r)'_u$ và $vec(r)'_v$ đều nằm trong mặt phẳng tiếp xúc với bề mặt tại điểm đang xét, vectơ pháp tuyến $vec(n)$ vuông góc với bề mặt chính là tích có hướng của hai vectơ này:
   $ vec(n) = vec(r)'_u times vec(r)'_v $

#tech-box[
  *Nhắc lại công thức Tích có hướng lớp 12:*
  
  Cho hai vectơ $vec(a) = (a_1, a_2, a_3)$ và $vec(b) = (b_1, b_2, b_3)$. Tích có hướng $vec(a) times vec(b)$ là một vectơ có tọa độ:
  $ vec(a) times vec(b) = (a_2 b_3 - a_3 b_2, a_3 b_1 - a_1 b_3, a_1 b_2 - a_2 b_1) $
  *Mẹo bấm máy tính Casio FX-580VNX:*
  - Bước 1: Vào phương thức vectơ: `MENU` -> `5` (Vectơ) -> Nhập vectơ $A$ (phím `1`) và nhập kích thước là `3`.
  - Bước 2: Nhập các hệ số tọa độ của $vec(r)'_u$.
  - Bước 3: Định nghĩa vectơ $B$: Nhấn `OPTN` -> `1` (Định nghĩa Vectơ) -> Nhập vectơ $B$ (phím `2`) và kích thước `3`. Nhập tọa độ của $vec(r)'_v$.
  - Bước 4: Tính tích có hướng: Nhấn `AC` để ra màn hình trống. Nhấn `OPTN` -> `3` (VectơA) -> Nhấn phím nhân `x` -> Nhấn `OPTN` -> `4` (VectơB). Nhấn `=` để nhận kết quả tọa độ của vectơ pháp tuyến $vec(n)$.
]

#core-box[
  *Phương trình mặt phẳng tiếp diện:*
  
  Mặt phẳng tiếp xúc (tiếp diện) của mặt cong tại điểm tiếp tiếp xúc $M_0(x_0, y_0, z_0)$ có vectơ pháp tuyến $vec(n) = (A, B, C)$ là:
  $ A(x - x_0) + B(y - y_0) + C(z - z_0) = 0 $
]

== 3. Diện Tích Bề Mặt Cong Dưới Lăng Kính Tích Phân

Để tính diện tích của một hình phẳng, ta chỉ cần chia nó thành các ô vuông nhỏ $d u dot d v$ rồi cộng dồn lại. Tuy nhiên, khi mặt phẳng này bị uốn cong thành bề mặt $S$ trong không gian 3D, các ô hình chữ nhật phẳng nhỏ $d u d v$ trên lưới tham số sẽ bị kéo dãn và uốn cong thành các ô hình bình hành nhỏ trên bề mặt.

Diện tích của ô hình bình hành nhỏ này chính là độ lớn tích có hướng của hai vectơ cạnh tiếp diện:
$ d S = |vec(r)'_u times vec(r)'_v| d u d v $
Do đó, diện tích toàn bộ mặt cong được tính bằng phép cộng dồn (tích phân hai lớp) trên miền tham số $D$:
$ A(S) = integral_D |vec(r)'_u times vec(r)'_v| d u d v $
*Quy tắc tính tích phân:* Ta tính tích phân theo biến này trước (coi biến kia là số), sau đó tính tích phân theo biến còn lại như bình thường.

== 4. Hai Bề Mặt Kinh Điển và Các Ứng Dụng Thực Tế

=== A. Mặt Torus – Chiếc Bánh Donut của Không Gian 3D

Mặt Torus thu được bằng cách quay một đường tròn bán kính $r$ xung quanh một trục nằm trong cùng mặt phẳng đường tròn nhưng không cắt đường tròn đó, cách tâm một khoảng $R > r$.

#tech-box[
  *Phương trình tham số của Torus:*
  $ cases(
    x = (R + r cos u) cos v,
    y = (R + r cos u) sin v,
    z = r sin u
  ) quad (u in [0, 2 pi], v in [0, 2 pi]) $
  Trong đó:
  - Tham số $u$ đại diện cho góc quay bo quanh ruột bánh donut.
  - Tham số $v$ đại diện cho góc quay bao quanh toàn bộ bánh donut.
]

=== B. Dải Möbius – Thế Giới Tô-Pô của Bề Mặt Một Phía

Dải Möbius là hình thể nổi tiếng nhất của ngành tô-pô học. Nó là một dải băng giấy bị vặn ngược nửa vòng trước khi dán hai đầu lại với nhau. Kết quả là nó tạo nên một bề mặt chỉ có *một phía duy nhất và một đường biên duy nhất*.

#tech-box[
  *Phương trình tham số của dải Möbius:*
  $ cases(
    x = (1 + v / 2 cos(u / 2)) cos u,
    y = (1 + v / 2 cos(u / 2)) sin u,
    z = v / 2 sin(u / 2)
  ) quad (u in [0, 2 pi], v in [-1, 1]) $
  - Khi tham số $u$ quay một vòng $2 pi$ (quay $360^degree$ quanh trục thẳng đứng), tham số vặn $u/2$ chỉ mới đi được một góc $pi$ ($180^degree$ - tức là lật ngược). Điều này giải thích tại sao dải băng chỉ có một mặt duy nhất.
  - *Ứng dụng cơ khí:* Băng tải truyền động trong các nhà máy nghiền than hay đá được chế tạo dưới dạng dải Möbius để cả hai bề mặt giấy đều được mài mòn đều đặn như nhau, giúp tuổi thọ băng tải tăng gấp đôi so với dải băng thông thường.
]

== 5. Các Ví Dụ Áp Dụng Chi Tiết (Giải từng bước chuẩn phổ thông)

#vd-box("Ví dụ 1", "Tính pháp vectơ và tiếp diện của mặt cong paraboloid")[
  Cho bề mặt cong $S$ có phương trình tham số:
  $ vec(r)(u, v) = (u, v, u^2 + v^2) $
  1. Tính các vectơ tiếp tuyến riêng phần $vec(r)'_u$ và $vec(r)'_v$ tại điểm $M_0$ ứng với bộ tham số $(u_0, v_0) = (1, 2)$.
  2. Viết phương trình mặt phẳng tiếp diện của mặt cong tại điểm $M_0$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Câu 1:*
    - Tính đạo hàm riêng của $vec(r)(u, v)$ theo $u$ bằng cách coi $v$ là hằng số:
      $ vec(r)'_u = (1, 0, 2u) $
    - Tính đạo hàm riêng của $vec(r)(u, v)$ theo $v$ bằng cách coi $u$ là hằng số:
      $ vec(r)'_v = (0, 1, 2v) $
    - Thay tọa độ $(u_0, v_0) = (1, 2)$ vào hai vectơ trên:
      $ vec(r)'_u(1, 2) = (1, 0, 2) $
      $ vec(r)'_v(1, 2) = (0, 1, 4) $
  - *Câu 2:*
    - Tìm tọa độ điểm tiếp xúc $M_0(x_0, y_0, z_0)$ trong không gian bằng cách thế $(u_0, v_0) = (1, 2)$ vào phương trình của $vec(r)$:
      $ x_0 = 1, quad y_0 = 2, quad z_0 = 1^2 + 2^2 = 5 => M_0(1, 2, 5) $
    - Tính vectơ pháp tuyến $vec(n)$ của tiếp diện bằng tích có hướng của $vec(r)'_u$ và $vec(r)'_v$:
      $ vec(n) = vec(r)'_u times vec(r)'_v = det mat(vec(i), vec(j), vec(k); 1, 0, 2; 0, 1, 4) = (-2, -4, 1) $
      *(Tọa độ tính được là: $0 dot 4 - 2 dot 1 = -2$; $2 dot 0 - 1 dot 4 = -4$; $1 dot 1 - 0 dot 0 = 1$)*.
    - Viết phương trình mặt phẳng tiếp diện đi qua $M_0(1, 2, 5)$ có vectơ pháp tuyến $vec(n) = (-2, -4, 1)$:
      $ -2(x - 1) - 4(y - 2) + 1(z - 5) = 0 => -2x - 4y + z + 5 = 0 $
]

#vd-box("Ví dụ 2", "Tham số hóa mặt phẳng nghiêng trong không gian")[
  Cho mặt phẳng nghiêng $(P): 2x - y + z - 4 = 0$. Hãy viết phương trình tham số hóa của mặt phẳng này dưới dạng $vec(r)(u, v)$ và tìm vectơ pháp tuyến của nó từ phương trình tham số đó.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Chọn tham số hóa.* 
    Ta có thể đặt trực tiếp $x = u$ và $y = v$ (với $u, v$ là hai số thực tự do). 
    Từ phương trình mặt phẳng, rút tọa độ còn lại là $z$ theo $u, v$:
    $ z = 4 - 2x + y = 4 - 2u + v $
    Vậy phương trình tham số hóa của mặt phẳng $(P)$ là:
    $ vec(r)(u, v) = (u, v, 4 - 2u + v) quad (u, v in RR) $
  - *Bước 2: Tính các vectơ đạo hàm:*
    $ vec(r)'_u = (1, 0, -2) $
    $ vec(r)'_v = (0, 1, 1) $
  - *Bước 3: Tính vectơ pháp tuyến từ tích có hướng:*
    $ vec(n) = vec(r)'_u times vec(r)'_v = det mat(vec(i), vec(j), vec(k); 1, 0, -2; 0, 1, 1) = (2, -1, 1) $
    Vectơ pháp tuyến này trùng khớp hoàn toàn với vectơ hệ số của phương trình ẩn $(P)$ là $(2, -1, 1)$!
]

#vd-box("Ví dụ 3", "Kiểm tra tính trực giao của lưới tham số trên mặt cầu")[
  Cho mặt cầu có phương trình tham số địa lý (kinh độ, vĩ độ):
  $ vec(r)(u, v) = (R sin u cos v, R sin u sin v, R cos u) $
  Chứng minh rằng tại mọi điểm trên mặt cầu, đường vĩ tuyến (đường chạy theo $v$) và đường kinh tuyến (đường chạy theo $u$) luôn vuông góc với nhau (hệ tọa độ trực giao).
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Tính đạo hàm riêng theo $u$ (chạy theo kinh tuyến):
    $ vec(r)'_u = (R cos u cos v, R cos u sin v, -R sin u) $
  - *Bước 2:* Tính đạo hàm riêng theo $v$ (chạy theo vĩ tuyến):
    $ vec(r)'_v = (-R sin u sin v, R sin u cos v, 0) $
  - *Bước 3:* Xét tích vô hướng của hai vectơ này:
    $ vec(r)'_u dot vec(r)'_v = (R cos u cos v)(-R sin u sin v) + (R cos u sin v)(R sin u cos v) + (-R sin u)(0) $
    $ vec(r)'_u dot vec(r)'_v = -R^2 sin u cos u sin v cos v + R^2 sin u cos u sin v cos v + 0 = 0 $
  - *Kết luận:* Vì tích vô hướng $vec(r)'_u dot vec(r)'_v = 0$ tại mọi điểm, hệ tọa độ kinh vĩ độ trên mặt cầu là một hệ lưới vuông góc hoàn hảo. Đây là lý do bản đồ địa hình hàng hải dễ chia ô vuông cục bộ.
]

#vd-box("Ví dụ 4", "Tìm tiếp diện của mặt nón tròn xoay")[
  Cho mặt nón có phương trình tham số:
  $ vec(r)(u, v) = (u cos v, u sin v, u) $
  Viết phương trình mặt phẳng tiếp diện của mặt nón tại điểm $M_0$ ứng với $u = 2, v = pi/4$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Tìm tọa độ điểm tiếp xúc $M_0$:
    $ x_0 = 2 cos(pi/4) = 2 dot sqrt(2)/2 = sqrt(2) $
    $ y_0 = 2 sin(pi/4) = 2 dot sqrt(2)/2 = sqrt(2) $
    $ z_0 = 2 $
    Suy ra $M_0(sqrt(2), sqrt(2), 2)$.
  - *Bước 2:* Tính đạo hàm riêng theo $u$ và $v$:
    $ vec(r)'_u = (cos v, sin v, 1) $
    $ vec(r)'_v = (-u sin v, u cos v, 0) $
  - *Bước 3:* Thế $u=2, v=pi/4$ vào các vectơ đạo hàm riêng:
    $ vec(r)'_u = (sqrt(2)/2, sqrt(2)/2, 1) $
    $ vec(r)'_v = (-2 sin(pi/4), 2 cos(pi/4), 0) = (-sqrt(2), sqrt(2), 0) $
  - *Bước 4:* Tính vectơ pháp tuyến bằng tích có hướng:
    $ vec(n) = vec(r)'_u times vec(r)'_v = det mat(vec(i), vec(j), vec(k); sqrt(2)/2, sqrt(2)/2, 1; -sqrt(2), sqrt(2), 0) = (-sqrt(2), -sqrt(2), 2) $
  - *Bước 5:* Viết phương trình mặt phẳng tiếp diện đi qua $M_0(sqrt(2), sqrt(2), 2)$:
    $ -sqrt(2)(x - sqrt(2)) - sqrt(2)(y - sqrt(2)) + 2(z - 2) = 0 $
    $ -sqrt(2)x - sqrt(2)y + 2z = 0 $
]

#vd-box("Ví dụ 5", "Tính vi phân diện tích trên mặt trụ đứng")[
  Một mặt trụ tròn xoay có bán kính đáy $R=3$ được tham số hóa bởi:
  $ vec(r)(u, v) = (3 cos u, 3 sin u, v) quad (u in [0, 2 pi], v in [0, 5]) $
  Hãy tính đại lượng vi phân diện tích $d S = |vec(r)'_u times vec(r)'_v| d u d v$ và dùng tích phân tính diện tích xung quanh của hình trụ này.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Tính đạo hàm riêng:
    $ vec(r)'_u = (-3 sin u, 3 cos u, 0) $
    $ vec(r)'_v = (0, 0, 1) $
  - *Bước 2:* Tính tích có hướng:
    $ vec(r)'_u times vec(r)'_v = (3 cos u, 3 sin u, 0) $
    Đoạn này độ lớn của tích có hướng là:
    $ |vec(r)'_u times vec(r)'_v| = sqrt((3 cos u)^2 + (3 sin u)^2 + 0^2) = 3 $
    Suy ra vi phân diện tích là $d S = 3 d u d v$.
  - *Bước 3:* Tính diện tích xung quanh của mặt trụ bằng tích phân trên miền $u in [0, 2 pi]$ và $v in [0, 5]$:
    $ A = integral_0^5 ( integral_0^(2 pi) 3 d u ) d v $
    $ A = integral_0^5 [3u]_0^(2 pi) d v = integral_0^5 6 pi d v = [6 pi v]_0^5 = 30 pi quad "(đvdt)" $
    Kết quả này trùng khớp hoàn toàn với công thức phổ thông học lớp 12: $S_("xq") = 2 pi R h = 2 pi (3) (5) = 30 pi$!
]

#vd-box("Ví dụ 6", "Lập tiếp diện chung của hai mặt cong tại giao điểm")[
  Cho hai mặt cong:
  $ (S_1): vec(r)_1(u, v) = (u, v, u^2 + v^2) $
  $ (S_2): vec(r)_2(s, t) = (s, t, 4 - s^2 - t^2) $
  Hai mặt này cắt nhau và giao nhau tại một vòng tròn. Hãy tìm một điểm giao thuộc góc phần tư thứ nhất có cao độ $z = 2$, và viết phương trình mặt phẳng tiếp xúc của mặt $(S_1)$ tại điểm giao đó.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Tìm điểm giao.*
    Tại điểm giao có cao độ $z = 2$ của mặt $(S_1)$, ta có $u^2 + v^2 = 2$.
    Vì điểm thuộc góc phần tư thứ nhất ($x > 0, y > 0$), ta chọn $u = 1, v = 1$.
    Tọa độ điểm giao là $M_0(1, 1, 2)$.
    (Ta kiểm tra điểm này trên mặt $(S_2)$: với $s=1, t=1$ thì $z = 4 - 1^2 - 1^2 = 2$. Đúng là điểm giao!).
  - *Bước 2:* Tính pháp vectơ của $(S_1)$ tại $u=1, v=1$:
    Theo đạo hàm ở Ví dụ 1, ta có:
    $ vec(r)'_u = (1, 0, 2u) => vec(r)'_u(1,1) = (1, 0, 2) $
    $ vec(r)'_v = (0, 1, 2v) => vec(r)'_v(1,1) = (0, 1, 2) $
    Tích có hướng:
    $ vec(n) = vec(r)'_u times vec(r)'_v = det mat(vec(i), vec(j), vec(k); 1, 0, 2; 0, 1, 2) = (-2, -2, 1) $
  - *Bước 3:* Viết phương trình tiếp diện của $(S_1)$ tại điểm $M_0(1, 1, 2)$:
    $ -2(x - 1) - 2(y - 1) + 1(z - 2) = 0 => -2x - 2y + z + 2 = 0 $
]

#vd-box("Ví dụ 7", "Tính diện tích của mảnh mặt cầu (Tích phân trên lưới vĩ độ)")[
  Một mái vòm tòa nhà có hình dạng là phần nửa trên của mặt cầu bán kính $R = 10$ m, giới hạn từ vĩ độ $u = 0$ (đỉnh mái) đến vĩ độ $u = pi/6$ (khoảng $30^degree$ chệch xuống). Phương trình tham số của mái vòm là:
  $ vec(r)(u, v) = (10 sin u cos v, 10 sin u sin v, 10 cos u) $
  với $u in [0, pi/6]$ và $v in [0, 2 pi]$. Hãy tính diện tích bề mặt của mái vòm này.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Tính đạo hàm riêng theo hai biến $u$ và $v$:
    $ vec(r)'_u = (10 cos u cos v, 10 cos u sin v, -10 sin u) $
    $ vec(r)'_v = (-10 sin u sin v, 10 sin u cos v, 0) $
  - *Bước 2:* Tính tích có hướng $vec(r)'_u times vec(r)'_v$:
    $ vec(n) = (100 sin^2 u cos v, 100 sin^2 u sin v, 100 sin u cos u) $
  - *Bước 3:* Tính độ lớn của vectơ pháp tuyến (vi phân diện tích):
    $ |vec(n)| = sqrt((100 sin^2 u cos v)^2 + (100 sin^2 u sin v)^2 + (100 sin u cos u)^2) $
    $ |vec(n)| = sqrt(10000 sin^4 u (cos^2 v + sin^2 v) + 10000 sin^2 u cos^2 u) $
    Vì $cos^2 v + sin^2 v = 1$, ta có:
    $ |vec(n)| = sqrt(10000 sin^2 u (sin^2 u + cos^2 u)) = 100 sin u quad ("với " u in [0, pi/6], sin u >= 0) $
    Vậy vi phân diện tích là $d S = 100 sin u d u d v$.
  - *Bước 4:* Tính diện tích mái vòm bằng tích phân:
    $ A = integral_0^(2 pi) ( integral_0^(pi/6) 100 sin u d u ) d v $
    $ A = integral_0^(2 pi) [ -100 cos u ]_0^(pi/6) d v = integral_0^(2 pi) (100 - 100 cos(pi/6)) d v $
    $ A = (100 - 50 sqrt(3)) dot [v]_0^(2 pi) = 200 pi - 100 sqrt(3) pi approx 84.18 quad "(m"^2")" $
  - *Kết luận:* Diện tích của mái vòm tòa nhà bằng khoảng 84.18 $m^2$.
]

#vd-box("Ví dụ 8", "Viết phương trình tiếp diện của mặt Torus")[
  Cho mặt Torus có phương trình tham số với các bán kính $R = 4$ và $r = 1$:
  $ vec(r)(u, v) = ((4 + cos u) cos v, (4 + cos u) sin v, sin u) $
  Viết phương trình mặt phẳng tiếp xúc với mặt Torus này tại điểm ứng với $u = pi/2, v = 0$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Xác định tọa độ điểm tiếp tiếp xúc $M_0$ trong không gian:
    $ x_0 = (4 + cos(pi/2)) cos 0 = (4 + 0) dot 1 = 4 $
    $ y_0 = (4 + cos(pi/2)) sin 0 = (4 + 0) dot 0 = 0 $
    $ z_0 = sin(pi/2) = 1 $
    Tọa độ điểm tiếp tiếp xúc là $M_0(4, 0, 1)$.
  - *Bước 2:* Tính đạo hàm riêng theo hai tham số $u, v$:
    $ vec(r)'_u = (-sin u cos v, -sin u sin v, cos u) $
    $ vec(r)'_v = (-(4 + cos u) sin v, (4 + cos u) cos v, 0) $
  - *Bước 3:* Thế tọa độ $(u_0, v_0) = (pi/2, 0)$ vào hai đạo hàm riêng:
    $ vec(r)'_u(pi/2, 0) = (-sin(pi/2) cos 0, -sin(pi/2) sin 0, cos(pi/2)) = (-1, 0, 0) $
    $ vec(r)'_v(pi/2, 0) = (-(4 + 0) sin 0, (4 + 0) cos 0, 0) = (0, 4, 0) $
  - *Bước 4:* Tính vectơ pháp tuyến từ tích có hướng:
    $ vec(n) = vec(r)'_u times vec(r)'_v = det mat(vec(i), vec(j), vec(k); -1, 0, 0; 0, 4, 0) = (0, 0, -4) $
  - *Bước 5:* Viết phương trình mặt phẳng tiếp diện đi qua $M_0(4, 0, 1)$ có vectơ pháp tuyến $vec(n) = (0, 0, -4)$:
    $ 0(x - 4) + 0(y - 0) - 4(z - 1) = 0 => -4(z - 1) = 0 => z = 1 $
  - *Kết luận:* Mặt phẳng tiếp tiếp xúc tại đỉnh cao nhất của mặt donut chính là mặt phẳng nằm ngang song song mặt đáy: $z = 1$.
]
