#tln(
  "1 ★",
  [Có bao nhiêu số tự nhiên có 5 chữ số đôi một khác nhau được lập từ các chữ số của tập hợp $\{1, 2, 3, 4, 5, 6, 7\}$ sao cho số đó chia hết cho 5?],
  [360],
  loigiai: [
    #cach1-box[
      Gọi số cần lập là $overline(a_1 a_2 a_3 a_4 a_5)$ với các chữ số khác nhau thuộc tập $\{1, ..., 7\}$.
      - Chữ số cuối $a_5$ bắt buộc phải bằng 5 (có đúng 1 cách chọn).
      - Bốn chữ số còn lại $a_1, a_2, a_3, a_4$ được chọn và xếp thứ tự từ tập 6 chữ số còn lại $\{1, 2, 3, 4, 6, 7\}$: có $A_6^4 = 360$ cách.
      Số lượng số thỏa mãn là: $1 dot 360 = 360$ số.
    ]
    #v(0.5em)
    #cach2-box[
      - Cố định chữ số cuối $a_5 = 5$ (1 cách chọn).
      - Đối với 4 vị trí còn lại, ta cần chọn và sắp xếp 4 chữ số từ tập hợp 6 chữ số $\{1, 2, 3, 4, 6, 7\}$.
      - Hàm sinh lũy thừa (EGF) cho việc chọn và sắp xếp $k$ chữ số từ tập 6 phần tử là:
        $ G(x) = (1 + x)^6 = sum_(k=0)^6 C_6^k k! frac(x^k, k!) = sum_(k=0)^6 A_6^k frac(x^k, k!) $
      - Số cách chọn và sắp xếp 4 chữ số là hệ số của $frac(x^4, 4!)$ trong $G(x)$, tức là:
        $ 4! [x^4] G(x) = A_6^4 = 360 " cách". $
      - Tổng số cách lập là $360 dot 1 = 360$ số.
    ]
  ]
)

#tln(
  "2 ★",
  [Tìm số nghiệm nguyên không âm của phương trình $x + y + z + w = 17$ thỏa mãn điều kiện $x >= 1$, $y >= 2$, $z >= 3$, $w >= 0$.],
  [364],
  loigiai: [
    #cach1-box[
      Thực hiện đổi biến đưa về dạng không âm tự do:
      - Đặt $x' = x - 1 >= 0$
      - Đặt $y' = y - 2 >= 0$
      - Đặt $z' = z - 3 >= 0$
      - Đặt $w' = w >= 0$
      Thay vào phương trình ta được:
      $
        (x' + 1) + (y' + 2) + (z' + 3) + w' = 17 \
        rightarrow x' + y' + z' + w' = 11
      $
      Áp dụng công thức vách ngăn cơ bản với $n=11$ và $k=4$:
      $ N = C_(11+4-1)^(4-1) = C_(14)^3 = frac(14 dot 13 dot 12, 3 dot 2 dot 1) = 364 " nghiệm". $
    ]
    #v(0.5em)
    #cach2-box[
      - Mỗi biến đóng góp một hàm sinh đại diện cho tập giá trị hợp lệ của nó:
        - Với $x >= 1$: $f_x(t) = t + t^2 + t^3 + dots = frac(t, 1-t)$
        - Với $y >= 2$: $f_y(t) = t^2 + t^3 + t^4 + dots = frac(t^2, 1-t)$
        - Với $z >= 3$: $f_z(t) = t^3 + t^4 + t^5 + dots = frac(t^3, 1-t)$
        - Với $w >= 0$: $f_w(t) = 1 + t + t^2 + dots = frac(1, 1-t)$
      - Hàm sinh tổng quát cho phương trình là:
        $ G(t) = f_x(t) f_y(t) f_z(t) f_w(t) = frac(t^6, (1-t)^4) $
      - Số nghiệm nguyên không âm của phương trình là hệ số của $t^(17)$ trong $G(t)$, tức là hệ số của $t^(11)$ trong $(1-t)^(-4)$:
        $ [t^(17)] G(t) = [t^(11)] (1-t)^(-4) = C_(11+4-1)^(11) = C_(14)^3 = 364 " nghiệm". $
    ]
  ]
)

#tln(
  "3 ★",
  [Từ 12 học sinh ưu tú, người ta muốn chia thành 4 nhóm học tập không tên gọi (không phân biệt), mỗi nhóm gồm đúng 3 học sinh. Hỏi có bao nhiêu cách chia?],
  [15400],
  loigiai: [
    #cach1-box[
      - Bước 1: Chia 12 học sinh vào 4 nhóm phân biệt (nhóm 1, nhóm 2, nhóm 3, nhóm 4) mỗi nhóm 3 học sinh:
        - Nhóm 1: Chọn 3 học sinh từ 12 học sinh: $C_(12)^3$ cách.
        - Nhóm 2: Chọn 3 học sinh từ 9 học sinh còn lại: $C_9^3$ cách.
        - Nhóm 3: Chọn 3 học sinh từ 6 học sinh còn lại: $C_6^3$ cách.
        - Nhóm 4: Chọn 3 học sinh từ 3 học sinh còn lại: $C_3^3$ cách.
        Số cách chia vào nhóm phân biệt là: $C_(12)^3 dot C_9^3 dot C_6^3 dot C_3^3 = 220 dot 84 dot 20 dot 1 = 369600$.
      - Bước 2: Vì 4 nhóm có vai trò hoàn toàn như nhau và không phân biệt tên gọi, ta phải khử lặp thứ tự bằng cách chia cho hoán vị của 4 nhóm là $4! = 24$.
      Số cách chia nhóm không phân biệt là:
      $ N = frac(369600, 24) = 15400 " cách". $
    ]
    #v(0.5em)
    #cach2-box[
      - Đây là bài toán phân hoạch tập hợp 12 phần tử phân biệt thành 4 khối có kích thước bằng 3, không phân biệt thứ tự giữa các khối.
      - Hàm sinh lũy thừa (EGF) cho mỗi khối gồm đúng 3 học sinh là $g(x) = frac(x^3, 3!)$.
      - Do 4 khối là giống nhau (không phân biệt tên gọi), ta dùng hàm sinh cấu trúc phân hoạch với $k=4$ khối:
        $ G(x) = frac(1, 4!) [g(x)]^4 = frac(1, 24) (frac(x^3, 3!))^4 = frac(x^(12), 24 dot 6^4) $
      - Số cách chia là hệ số của $frac(x^(12), 12!)$ trong EGF $G(x)$:
        $ 12! [x^(12)] G(x) = 12! dot frac(1, 24 dot 6^4) = 15400 " cách". $
    ]
  ]
)

#tln(
  "4 ★★",
  [Có bao nhiêu cách xếp 4 học sinh nam và 4 học sinh nữ thành một hàng ngang sao cho không có hai học sinh cùng giới tính đứng kề nhau (xen kẽ)?],
  [1152],
  loigiai: [
    #cach1-box[
      Để nam và nữ đứng xen kẽ nhau hoàn toàn trong hàng gồm 8 người, chỉ có hai cấu trúc hàng dọc khả dĩ:
      - *Cấu trúc 1:* `Nam - Nữ - Nam - Nữ - Nam - Nữ - Nam - Nữ`
        - Sắp xếp vị trí 4 nam vào các vị trí nam: $4! = 24$ cách.
        - Sắp xếp vị trí 4 nữ vào các vị trí nữ: $4! = 24$ cách.
        Số cách xếp là: $24 dot 24 = 576$ cách.
      - *Cấu trúc 2:* `Nữ - Nam - Nữ - Nam - Nữ - Nam - Nữ - Nam`
        - Tương tự như trên, số cách xếp là: $24 dot 24 = 576$ cách.
      Tổng số cách xếp thỏa mãn là: $576 + 576 = 1152$ cách.
    ]
    #v(0.5em)
    #cach2-box[
      - Sử dụng hàm sinh lũy thừa hai biến (bivariate EGF) với biến $x$ cho nam và $y$ cho nữ.
      - Mỗi hoán vị của 4 nam đóng góp $4!$ và 4 nữ đóng góp $4!$.
      - Cấu trúc xen kẽ được mô tả bởi đa thức hình thức biểu thị 2 kịch bản sắp xếp: $P(x, y) = (x y)^4 + (y x)^4 = 2 x^4 y^4$.
      - Số cách sắp xếp các học sinh phân biệt vào cấu trúc này là hệ số liên đới của EGF:
        $ N = 4! dot 4! [x^4 y^4] (2 x^4 y^4) = 2 dot 4! dot 4! = 1152 " cách". $
    ]
  ]
)

#tln(
  "5 ★★",
  [Có bao nhiêu số tự nhiên gồm 3 chữ số đôi một khác nhau sao cho tích của 3 chữ số đó là một số chẵn?],
  [588],
  loigiai: [
    #cach1-box[
      Tích của 3 chữ số là số chẵn khi và chỉ khi trong 3 chữ số đó có ít nhất một chữ số chẵn.
      Ta sử dụng phương pháp phần bù:
      - Tổng số các số tự nhiên có 3 chữ số đôi một khác nhau lập từ $\{0, 1, ..., 9\}$:
        - Chọn chữ số hàng trăm $a ne 0$: 9 cách chọn.
        - Chọn chữ số thứ hai $b$ (khác $a$): 9 cách chọn.
        - Chọn chữ số thứ ba $c$ (khác $a, b$): 8 cách chọn.
        Tổng số là: $9 dot 9 dot 8 = 648$ số.
      - Trường hợp vi phạm: Số có 3 chữ số đôi một khác nhau mà tích là số lẻ (tức là cả 3 chữ số đều là số lẻ lấy từ $\{1, 3, 5, 7, 9\}$):
        - Số cách chọn là chỉnh hợp chập 3 của 5 số lẻ: $A_5^3 = 5 dot 4 dot 3 = 60$ số.
      - Số các số thỏa mãn đề bài là:
        $ N = 648 - 60 = 588 " số". $
    ]
    #v(0.5em)
    #cach2-box[
      - Chia các chữ số thành nhóm Chẵn $E = \{0, 2, 4, 6, 8\}$ (5 chữ số) và nhóm Lẻ $O = \{1, 3, 5, 7, 9\}$ (5 chữ số).
      - Hàm sinh chọn 3 chữ số khác nhau từ 10 chữ số (với $u$ đại diện cho chẵn, $v$ đại diện cho lẻ):
        $ P(u, v) = [z^3] (1 + u z)^5 (1 + v z)^5 = 10 u^3 + 50 u^2 v + 50 u v^2 + 10 v^3 $
      - Mỗi bộ 3 chữ số phân biệt có $3! = 6$ cách sắp xếp thành số tự nhiên.
      - Để loại bỏ số có chữ số 0 đứng đầu, ta xét hàm sinh cho 2 chữ số còn lại khi 0 ở vị trí đầu tiên:
        $ P_0(u, v) = [z^2] (1 + u z)^4 (1 + v z)^5 = 6 u^2 + 20 u v + 10 v^2 $
      - Mỗi bộ chứa 0 (đứng đầu) có $2! = 2$ cách xếp 2 chữ số còn lại.
      - Số lượng số tự nhiên thỏa mãn yêu cầu (chứa ít nhất một chữ số chẵn) là tổng số cách xếp trừ đi số cách xếp các số toàn lẻ:
        $ N = (6 P(1, 1) - 2 P_0(1, 1)) - 6 dot 10 = (6 dot 120 - 2 dot 36) - 60 = 588 " số". $
    ]
  ]
)

#tln(
  "6 ★★",
  [Trong mặt phẳng cho 10 điểm phân biệt, trong đó không có 3 điểm nào thẳng hàng ngoại trừ đúng 4 điểm thẳng hàng với nhau trên một đường thẳng $d$. Hỏi có thể lập được bao nhiêu tam giác nhận các điểm đã cho làm đỉnh?],
  [116],
  loigiai: [
    #cach1-box[
      Gọi tập hợp 10 điểm là $S$. Có 4 điểm thẳng hàng trên đường thẳng $d$, và 6 điểm còn lại không có 3 điểm nào thẳng hàng.
      - Số cách chọn 3 điểm bất kỳ từ 10 điểm là: $C_(10)^3 = 120$.
      - Trường hợp chọn phải 3 điểm cùng nằm trên đường thẳng $d$ (không tạo thành tam giác): chọn 3 điểm từ 4 điểm thẳng hàng này: $C_4^3 = 4$ cách.
      Số tam giác lập được là:
      $ N = 120 - 4 = 116 " tam giác". $
    ]
    #v(0.5em)
    #cach2-box[
      - Chia 10 điểm thành 2 nhóm: nhóm A (4 điểm thẳng hàng trên $d$) và nhóm B (6 điểm còn lại).
      - Hàm sinh chọn điểm với biến $x$ cho nhóm A và $y$ cho nhóm B là:
        $ G(x, y) = (1 + x)^4 (1 + y)^6 $
      - Trích xuất các số hạng bậc 3 (chọn 3 đỉnh):
        $ G_3(x, y) = 4 x^3 + 36 x^2 y + 60 x y^2 + 20 y^3 $
      - Tam giác được hình thành khi không chọn cả 3 đỉnh thuộc nhóm A (tương ứng loại bỏ số hạng $4 x^3$):
        $ N = 36 + 60 + 20 = 116 " tam giác". $
    ]
  ]
)

#tln(
  "7 ★★",
  [Tính tổng tất cả các hệ số trong khai triển nhị thức Newton của $(3x - 2y)^(10)$.],
  [1],
  loigiai: [
    #cach1-box[
      Khai triển nhị thức Newton của $(3x - 2y)^(10)$ có dạng:
      $ (3x - 2y)^(10) = sum_(k=0)^(10) C_(10)^k (3x)^(10-k) (-2y)^k = sum_(k=0)^(10) C_(10)^k 3^(10-k) (-2)^k x^(10-k) y^k $
      Tổng các hệ số của khai triển này thu được bằng cách thế tất cả các biến số bằng 1, tức là đặt $x = 1$ và $y = 1$.
      Thế vào biểu thức ban đầu ta được:
      $ S = (3 dot 1 - 2 dot 1)^(10) = (3 - 2)^(10) = 1^(10) = 1. $
    ]
    #v(0.5em)
    #cach2-box[
      - Xem $(3x - 2y)^(10)$ là hàm sinh hai biến $F(x, y) = sum c_(a,b) x^a y^b$ biểu diễn các hệ số của khai triển.
      - Tổng các hệ số của khai triển chính là giá trị thu được khi đánh giá hàm sinh tại các biến bằng 1:
        $ S = F(1, 1) = (3 dot 1 - 2 dot 1)^(10) = 1. $
    ]
  ]
)

#tln(
  "8 ★★",
  [Có bao nhiêu dãy nhị phân độ dài 8 không chứa hai chữ số 0 đứng cạnh nhau và không chứa hai chữ số 1 đứng cạnh nhau (xen kẽ)?],
  [2],
  loigiai: [
    #cach1-box[
      Một dãy nhị phân độ dài 8 xen kẽ hoàn toàn chỉ có thể có hai cấu trúc duy nhất:
      - Cấu trúc 1: $01010101$
      - Cấu trúc 2: $10101010$
      Do đó, chỉ có đúng 2 dãy nhị phân thỏa mãn đề bài.
    ]
    #v(0.5em)
    #cach2-box[
      - Dãy xen kẽ bắt đầu bằng 0 chỉ có duy nhất 1 dãy cho mỗi độ dài $n$, với hàm sinh là $F_0(z) = frac(z, 1-z)$.
      - Dãy xen kẽ bắt đầu bằng 1 cũng chỉ có duy nhất 1 dãy cho mỗi độ dài $n$, với hàm sinh là $F_1(z) = frac(z, 1-z)$.
      - Hàm sinh tổng quát cho các dãy nhị phân xen kẽ là:
        $ G(z) = F_0(z) + F_1(z) = frac(2z, 1-z) = 2z + 2z^2 + 2z^3 + dots $
      - Số lượng dãy xen kẽ độ dài 8 là hệ số của $z^8$ trong $G(z)$:
        $ [z^8] G(z) = 2 " dãy". $
    ]
  ]
)

#tln(
  "9 ★★",
  [Một lưới ô vuông kích thước $5 times 5$ được tạo bởi 6 đường thẳng dọc và 6 đường thẳng ngang. Hỏi có bao nhiêu hình chữ nhật (kể cả hình vuông) xuất hiện trong lưới này?],
  [225],
  loigiai: [
    #cach1-box[
      Một hình chữ nhật được tạo ra bằng cách chọn 2 đường thẳng dọc từ 6 đường dọc và 2 đường thẳng ngang từ 6 đường ngang.
      Số cách chọn là:
      $ N = C_6^2 dot C_6^2 = 15 dot 15 = 225 " hình chữ nhật". $
    ]
    #v(0.5em)
    #cach2-box[
      - Gọi kích thước lưới ô vuông là $5 times 5$. Trên mỗi chiều có 6 đường thẳng tạo ra các đoạn thẳng độ dài $k$ ($1 <= k <= 5$).
      - Số lượng đoạn thẳng có độ dài $k$ trên một chiều là $6 - k$.
      - Hàm sinh biểu thị sự phân bố các đoạn thẳng theo chiều dài là:
        $ H(t) = sum_(k=1)^5 (6 - k) t^k = 5 t + 4 t^2 + 3 t^3 + 2 t^4 + t^5 $
      - Tổng số hình chữ nhật bằng tích tổng số đoạn thẳng trên hai chiều (ngang và dọc), thu được bằng cách đánh giá hàm sinh tại $t=1$:
        $ N = H(1) dot H(1) = (5 + 4 + 3 + 2 + 1)^2 = 15^2 = 225 " hình chữ nhật". $
    ]
  ]
)

#tln(
  "10 ★★",
  [Có bao nhiêu cách phân hoạch tập hợp $S = \{1, 2, 3, 4, 5\}$ thành đúng 2 tập con khác rỗng không phân biệt?],
  [15],
  loigiai: [
    #cach1-box[
      Số cách phân hoạch một tập hợp gồm 5 phần tử thành 2 nhóm không rỗng, không phân biệt là số Stirling loại 2 chập 2 của 5 phần tử: $S(5,2)$.
      Ta tính trực tiếp:
      $ S(5,2) = frac(1, 2!) (2^5 - 2 dot 1^5) = frac(1, 2) (32 - 2) = 15 " cách". $
    ]
    #v(0.5em)
    #cach2-box[
      - Hàm sinh lũy thừa (EGF) của số Stirling loại hai chập $k=2$ là:
        $ G_2(x) = frac((e^x - 1)^2, 2!) = frac(e^(2x) - 2e^x + 1, 2) $
      - Khai triển Taylor của $G_2(x)$:
        $ G_2(x) = frac(1, 2) (sum_(n=0)^(infty) frac(2^n x^n, n!) - 2 sum_(n=0)^(infty) frac(x^n, n!) + 1) = sum_(n=1)^(infty) frac(2^(n-1) - 1, n!) x^n $
      - Số cách phân hoạch tập 5 phần tử là hệ số của $frac(x^5, 5!)$ trong EGF $G_2(x)$:
        $ N = 5! [x^5] G_2(x) = 2^(5-1) - 1 = 15 " cách". $
    ]
  ]
)

#tln(
  "11 ★★★",
  [Lát một hành lang kích thước $1 times 10$ bằng các viên gạch kích thước $1 times 1$ và $1 times 2$. Hỏi có bao nhiêu cách lát khác nhau?],
  [89],
  loigiai: [
    #cach1-box[
      Gọi $a_n$ là số cách lát hành lang kích thước $1 times n$.
      Xét viên gạch cuối cùng được đặt ở vị trí kết thúc:
      - Nếu viên gạch cuối là $1 times 1$: Phần hành lang phía trước dài $1 times (n-1)$ có $a_(n-1)$ cách lát.
      - Nếu viên gạch cuối là $1 times 2$: Phần hành lang phía trước dài $1 times (n-2)$ có $a_(n-2)$ cách lát.
      Ta có hệ thức truy hồi Fibonacci: $a_n = a_(n-1) + a_(n-2)$ với mọi $n >= 3$.
      Khởi tạo giá trị:
      - Hành lang $1 times 1$ ($n=1$): Chỉ có 1 cách dùng gạch $1 times 1 arrow a_1 = 1$.
      - Hành lang $1 times 2$ ($n=2$): Có 2 cách (dùng hai viên $1 times 1$ hoặc một viên $1 times 2$) $arrow a_2 = 2$.
      Tính các số hạng tiếp theo của dãy:
      $
        a_3 = 3, a_4 = 5, a_5 = 8, a_6 = 13, a_7 = 21, a_8 = 34, a_9 = 55, a_(10) = 89
      $
      Vậy có tất cả 89 cách lát hành lang.
    ]
    #v(0.5em)
    #cach2-box[
      - Viên gạch $1 times 1$ đóng góp độ dài 1 (đa thức $t$), viên gạch $1 times 2$ đóng góp độ dài 2 (đa thức $t^2$).
      - Hàm sinh cho việc lát hành lang bằng hai loại gạch này là:
        $ G(t) = frac(1, 1 - t - t^2) = sum_(n=0)^(infty) F_(n+1) t^n $
      - Số cách lát hành lang độ dài 10 là hệ số của $t^(10)$ trong $G(t)$, tương ứng với số Fibonacci $F_(11) = 89$ cách.
    ]
  ]
)

#tln(
  "12 ★★★",
  [Tìm số đường đi trên lưới tọa độ từ điểm $(0,0)$ đến điểm $(5,5)$ bằng các bước đi sang phải $(+1,0)$ hoặc đi lên trên $(0,+1)$ sao cho đường đi không bao giờ đi lên phía trên đường thẳng $y = x$.],
  [42],
  loigiai: [
    #cach1-box[
      Đây là bài toán tính số đường đi Dyck dưới đường phân giác, kết quả chính là số Catalan thứ 5 ($C_5$):
      $ C_5 = frac(1, 5+1) C_(10)^5 = frac(1, 6) dot 252 = 42 " đường đi". $
    ]
    #v(0.5em)
    #cach2-box[
      - Một đường đi Dyck bắt đầu từ $(0,0)$ chạm đường phân giác lần đầu tại điểm $(k+1, k+1)$ với $0 <= k <= n-1$, phân hoạch đường đi thành hai phần độc lập. Từ đó ta có hệ thức Catalan: $C_n = sum_(k=0)^(n-1) C_k C_(n-1-k)$.
      - Hệ thức tự tương tự này tương ứng với phương trình hàm sinh: $C(x) = 1 + x C^2(x)$. Giải phương trình thu được:
        $ C(x) = frac(1 - sqrt(1 - 4x), 2x) = sum_(n=0)^(infty) frac(1, n+1) C_(2n)^n x^n $
      - Số đường đi đến điểm $(5,5)$ là hệ số của $x^5$ trong $C(x)$, tức là số Catalan thứ 5:
        $ C_5 = frac(1, 6) C_(10)^5 = 42 " đường". $
    ]
  ]
)

#tln(
  "13 ★★★",
  [Tính tổng sau theo $n$:
  $ S = (C_n^0)^2 + (C_n^1)^2 + (C_n^2)^2 + ... + (C_n^n)^2 $],
  [$C_(2n)^n$],
  loigiai: [
    #cach1-box[
      Sử dụng đồng nhất thức nhị thức Vandermonde hoặc so sánh hệ số đa thức:
      Xét tích hai đa thức khai triển:
      $ (1 + x)^n dot (x + 1)^n = (1 + x)^(2n) $
      - Hệ số của $x^n$ trong vế phải $(1 + x)^(2n)$ là: $C_(2n)^n$.
      - Hệ số của $x^n$ trong vế trái thu được bằng cách nhân chéo các số hạng:
        $ (sum_(i=0)^n C_n^i x^i) dot (sum_(j=0)^n C_n^j x^(n-j)) $
        Số hạng chứa $x^n$ xuất hiện khi chọn $i = j$, hệ số tương ứng là:
        $ sum_(i=0)^n C_n^i dot C_n^i = sum_(i=0)^n (C_n^i)^2 $
      Đồng nhất hệ số hai vế, ta được: $S = C_(2n)^n$.
    ]
    #v(0.5em)
    #cach2-box[
      - Xét hàm sinh $f(x) = (1+x)^n = sum_(k=0)^n C_n^k x^k$ và $g(x) = (1+x^(-1))^n = sum_(j=0)^n C_n^j x^(-j)$.
      - Tích của hai hàm sinh là:
        $ f(x)g(x) = (1+x)^n (1+1/x)^n = frac((1+x)^(2n), x^n) $
      - Hệ số tự do (hệ số của $x^0$) trong tích $f(x)g(x)$ là:
        $ [x^0] f(x)g(x) = [x^0] frac((1+x)^(2n), x^n) = [x^n] (1+x)^(2n) = C_(2n)^n $
      - Mặt khác, nhân trực tiếp hai chuỗi cho ta hệ số tự do khi $k=j$:
        $ [x^0] f(x)g(x) = sum_(k=0)^n C_n^k dot C_n^k = sum_(k=0)^n (C_n^k)^2 $
      - Đồng nhất hai cách tính hệ số tự do ta được: $S = C_(2n)^n$.
    ]
  ]
)

#tln(
  "14 ★★★",
  [Hai người chơi A và B chơi một trò chơi tung đồng xu. Người A thắng nếu tung được mặt ngửa, người B thắng nếu tung được mặt sấp. Biết đồng xu không cân đối, xác suất xuất hiện mặt ngửa là $p = 0.6$ và sấp là $1-p = 0.4$. Trò chơi kết thúc khi có người đạt được 2 lượt thắng. Tính xác suất để người A giành chiến thắng chung cuộc.],
  [0.648],
  loigiai: [
    #cach1-box[
      Trò chơi kết thúc sau tối đa 3 lượt chơi. A giành chiến thắng chung cuộc trong các trường hợp sau:
      - *TH1 (A thắng sau 2 lượt):* A thắng cả 2 lượt đầu. Xác suất là:
        $ P_2 = (0.6)^2 = 0.36 $
      - *TH2 (A thắng sau 3 lượt):* A thắng lượt thứ 3 và thắng đúng 1 trong 2 lượt đầu. Xác suất là:
        $ P_3 = C_2^1 dot (0.6) dot (0.4) dot 0.6 = 2 dot 0.24 dot 0.6 = 0.288 $
      Tổng xác suất A giành chiến thắng chung cuộc là:
      $ P = P_2 + P_3 = 0.36 + 0.288 = 0.648 $
    ]
    #v(0.5em)
    #cach2-box[
      - Sử dụng hàm sinh xác suất hai biến với biến $x$ đại diện cho lượt thắng của A, $y$ đại diện cho lượt thắng của B. Mỗi lượt tung đồng xu có hàm sinh xác suất: $f(x, y) = 0.6 x + 0.4 y$.
      - Trò chơi dừng ngay khi số mũ của $x$ hoặc $y$ đạt đến 2. Các nhánh thắng của A tương ứng với việc đạt trạng thái có dạng $x^2 y^k$ ($k < 2$).
      - Sau 2 lượt, hàm sinh xác suất là: $(0.6x + 0.4y)^2 = 0.36 x^2 + 0.48 x y + 0.16 y^2$.
        - Số hạng $0.36 x^2$ đạt đích (A thắng và trò chơi dừng).
        - Số hạng $0.16 y^2$ đạt đích (B thắng và trò chơi dừng).
        - Số hạng $0.48 x y$ chưa kết thúc, tiếp tục đi đến lượt 3.
      - Tại lượt 3, từ trạng thái $0.48 x y$, ta nhân tiếp với $f(x, y)$:
        $ 0.48 x y (0.6x + 0.4y) = 0.288 x^2 y + 0.192 x y^2 $
        - Số hạng $0.288 x^2 y$ tương ứng A thắng chung cuộc ở lượt 3.
      - Tổng xác suất A thắng chung cuộc là: $P = 0.36 + 0.288 = 0.648$.
    ]
  ]
)

#tln(
  "15 ★★★",
  [Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 + x_4 = 10$ thỏa mãn điều kiện $0 <= x_i <= 3$ với mọi $i = 1, 2, 3, 4$.],
  [10],
  loigiai: [
    #cach1-box[
      Sử dụng phương pháp bù trừ (PIE):
      - Tổng số nghiệm nguyên không âm không giới hạn trên: $N_Omega = C_(10+4-1)^(4-1) = C_(13)^3 = 286$.
      - Gọi $P_i$ là điều kiện vi phạm của biến $x_i$, tức là $x_i >= 4$.
      - Số nghiệm vi phạm ít nhất 1 điều kiện (ví dụ $x_1 >= 4$, đặt $x_1' = x_1 - 4 >= 0 \implies x_1' + x_2 + x_3 + x_4 = 6$):
        $ S_1 = C_4^1 dot C_(6+4-1)^(4-1) = 4 dot C_9^3 = 4 dot 84 = 336. $
      - Số nghiệm vi phạm ít nhất 2 điều kiện (ví dụ $x_1, x_2 >= 4$, đặt $x_1' = x_1 - 4, x_2' = x_2 - 4 \implies x_1' + x_2' + x_3 + x_4 = 2$):
        $ S_2 = C_4^2 dot C_(2+4-1)^(4-1) = 6 dot C_5^3 = 6 dot 10 = 60. $
      - Không thể có >= 3 điều kiện vi phạm cùng lúc vì $4 + 4 + 4 = 12 > 10$.
      - Số nghiệm thỏa mãn là:
        $ N = N_Omega - S_1 + S_2 = 286 - 336 + 60 = 10. $
    ]
    #v(0.5em)
    #cach2-box[
      - Mỗi biến $x_i$ có điều kiện $0 <= x_i <= 3$, tương ứng với đa thức lựa chọn $1 + t + t^2 + t^3 = frac(1-t^4, 1-t)$.
      - Hàm sinh tổng quát cho số nghiệm của phương trình là:
        $ G(t) = (frac(1 - t^4, 1 - t))^4 = (1 - t^4)^4 (1 - t)^(-4) $
      - Khai triển các nhân tử:
        - $(1 - t^4)^4 = 1 - 4t^4 + 6t^8 - 4t^(12) + t^(16)$
        - $(1 - t)^(-4) = sum_(k=0)^(infty) C_(k+3)^3 t^k$
      - Hệ số của $t^(10)$ trong $G(t)$ tương ứng với số nghiệm của phương trình:
        $ [t^(10)] G(t) = 1 dot C_(10+3)^3 - 4 dot C_(6+3)^3 + 6 dot C_(2+3)^3 = C_(13)^3 - 4 C_9^3 + 6 C_5^3 = 286 - 336 + 60 = 10 " nghiệm". $
    ]
  ]
)
