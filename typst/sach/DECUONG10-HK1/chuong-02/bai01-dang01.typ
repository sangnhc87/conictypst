#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Nhận diện và tìm nghiệm của bất phương trình bậc nhất hai ẩn", mau: C2)

#phuong-phap(mau: C2)[
  - *Bất phương trình bậc nhất hai ẩn* $x, y$ là bất phương trình có một trong các dạng:
    $ a x + b y + c < 0, quad a x + b y + c <= 0, quad a x + b y + c > 0, quad a x + b y + c >= 0 $
    trong đó $a, b, c$ là những số thực đã cho và $a, b$ không đồng thời bằng $0$.
  - Mỗi cặp số $(x_0; y_0)$ sao cho khi thay $x = x_0, y = y_0$ vào bất phương trình ta được một khẳng định đúng thì $(x_0; y_0)$ được gọi là một *nghiệm* của bất phương trình.
]

#bai-tap-tu-luan(mau: C2)[
  #bt-item(1, [Tìm các bất phương trình bậc nhất hai ẩn trong các bất phương trình sau:
    + $x - 5y + 2 <= 0$.
    + $9x^2 + 8y - 7 >= 0$.
    + $3x - 2y > 0$.
    + $4y + 11x <= 0$.
  ], loigiai: [
    Theo định nghĩa, bất phương trình bậc nhất hai ẩn $x, y$ có dạng $a x + b y + c < 0$ (hoặc $<= 0, > 0, >= 0$) với $a, b$ không đồng thời bằng $0$, trong đó số mũ của các ẩn $x, y$ đều bằng $1$.
    - *a)* $x - 5y + 2 <= 0$: Là BPT bậc nhất hai ẩn (với $a = 1, b = -5, c = 2$).
    - *b)* $9x^2 + 8y - 7 >= 0$: Không phải vì chứa $x^2$ (bậc hai đối với ẩn $x$).
    - *c)* $3x - 2y > 0$: Là BPT bậc nhất hai ẩn (với $a = 3, b = -2, c = 0$).
    - *d)* $4y + 11x <= 0 <=> 11x + 4y <= 0$: Là BPT bậc nhất hai ẩn (với $a = 11, b = 4, c = 0$).
    Vậy các bất phương trình bậc nhất hai ẩn là: a), c) và d).
  ])

  #bt-item(2, [Tìm bất phương trình bậc nhất hai ẩn trong các bất phương trình sau:
    + $3x - 2(y - x + 1) > 0$.
    + $2^2 x + y <= 0$.
    + $2x^2 - y >= 1$.
  ], loigiai: [
    Biến đổi và thu gọn từng bất phương trình:
    - *a)* $3x - 2(y - x + 1) > 0 <=> 3x - 2y + 2x - 2 > 0 <=> 5x - 2y - 2 > 0$.
      Đây là BPT bậc nhất hai ẩn $x, y$ (với $a = 5, b = -2, c = -2$).
    - *b)* $2^2 x + y <= 0 <=> 4x + y <= 0$.
      Đây là BPT bậc nhất hai ẩn $x, y$ (với $a = 4, b = 1, c = 0$).
    - *c)* $2x^2 - y >= 1$: Chứa $x^2$ nên không phải là BPT bậc nhất.
  ])

  #bt-item(3, [Tìm $m$ để bất phương trình sau là bất phương trình bậc nhất hai ẩn:
    $ (m^2 + m)x^2 - m x + m^2 y - 1 <= 0 $
  ], loigiai: [
    Để bất phương trình đã cho là bất phương trình bậc nhất hai ẩn $x, y$, ta cần đồng thời hai điều kiện:
    1. Hệ số của $x^2$ phải triệt tiêu: $m^2 + m = 0 <=> m(m + 1) = 0 <=> #hoac("m = 0", "m = -1")$.
    2. Các hệ số của $x$ và $y$ không đồng thời bằng $0$: $(-m)^2 + (m^2)^2 != 0 <=> m != 0$.
    Kết hợp hai điều kiện trên:
    $ cases(m(m + 1) = 0, m != 0) <=> m = -1. $
    Vậy $m = -1$ là giá trị duy nhất thỏa mãn yêu cầu bài toán.
  ])

  #bt-item(4, [Một gian hàng trưng bày bàn và ghế rộng $60 "m"^2$. Diện tích để kê một chiếc ghế là $0,5 "m"^2$, một chiếc bàn là $1,2 "m"^2$. Gọi $x$ là số chiếc ghế, $y$ là số chiếc bàn được kê.
    + Viết bất phương trình bậc nhất hai ẩn $x, y$ cho phần mặt sàn để kê bàn và ghế, biết diện tích mặt sàn dành cho lưu thông tối thiểu là $12 "m"^2$.
    + Chỉ ra ba nghiệm của bất phương trình trên.
  ], loigiai: [
    - *a)* Diện tích kê $x$ chiếc ghế là $0,5x space upright(m)^2$ và kê $y$ chiếc bàn là $1,2y space upright(m)^2$.
      Vì diện tích dành cho lối đi lưu thông tối thiểu là $12 space upright(m)^2$ nên tổng diện tích kê bàn ghế tối đa là:
      $ 60 - 12 = 48 space upright(m)^2. $
      Do đó ta có bất phương trình:
      $ 0,5x + 1,2y <= 48 quad text("với") quad x, y in NN. $
    - *b)* Chỉ ra ba cặp nghiệm nguyên không âm thỏa mãn:
      - Cặp $(x; y) = (20; 10)$: $0,5(20) + 1,2(10) = 10 + 12 = 22 <= 48$ (thỏa mãn).
      - Cặp $(x; y) = (40; 10)$: $0,5(40) + 1,2(10) = 20 + 12 = 32 <= 48$ (thỏa mãn).
      - Cặp $(x; y) = (0; 40)$: $0,5(0) + 1,2(40) = 48 <= 48$ (thỏa mãn).
  ])

  #bt-item(5, [Trong 1 lạng thịt bò chứa khoảng 26g protein, 1 lạng cá rô phi chứa khoảng 20g protein. Một người phụ nữ cần tối thiểu 46g protein mỗi ngày. Gọi $x, y$ lần lượt là số lạng thịt bò và cá rô phi ăn trong một ngày. Viết BPT và chỉ ra ba nghiệm.], loigiai: [
    - Lượng protein từ $x$ lạng thịt bò là $26x$ (g) và từ $y$ lạng cá rô phi là $20y$ (g).
      Để đáp ứng nhu cầu tối thiểu $46$g protein mỗi ngày, ta có bất phương trình:
      $ 26x + 20y >= 46 <=> 13x + 10y >= 23 quad (x, y >= 0). $
    - Ba nghiệm của bất phương trình:
      - Cặp $(x; y) = (1; 1)$: $13(1) + 10(1) = 23 >= 23$ (thỏa mãn).
      - Cặp $(x; y) = (2; 1)$: $13(2) + 10(1) = 36 >= 23$ (thỏa mãn).
      - Cặp $(x; y) = (0; 3)$: $13(0) + 10(3) = 30 >= 23$ (thỏa mãn).
  ])

  #bt-item(6, [Hà, Châu, Liên và Ngân cùng đi mua trà sữa. Bốn bạn có tất cả 185 nghìn đồng, mua 4 cốc trà sữa giá 35 nghìn đồng/cốc. Một phần trân châu đen giá 5 nghìn đồng, trân châu trắng giá 10 nghìn đồng. Gọi $x, y$ lần lượt là số phần trân châu đen và trắng mua thêm.
    + Viết BPT bậc nhất hai ẩn thể hiện số tiền các bạn có đủ khả năng chi trả.
    + Chỉ ra một nghiệm nguyên của bất phương trình đó.
  ], loigiai: [
    - *a)* Số tiền mua 4 cốc trà sữa là $4 dot 35 = 140$ nghìn đồng.
      Số tiền mua thêm $x$ phần trân châu đen và $y$ phần trân châu trắng là $5x + 10y$ (nghìn đồng).
      Tổng số tiền chi tiêu không vượt quá 185 nghìn đồng:
      $ 140 + 5x + 10y <= 185 <=> 5x + 10y <= 45 <=> x + 2y <= 9 quad (x, y in NN). $
    - *b)* Chọn một nghiệm nguyên không âm:
      Với $x = 3, y = 2$: $3 + 2(2) = 7 <= 9$.
      Vậy $(3; 2)$ là một nghiệm của bất phương trình (tức mua thêm 3 phần trân châu đen và 2 phần trân châu trắng).
  ])

  #bt-item(7, [Mỗi 100g thịt bò chứa 250 calo, một quả trứng 44g chứa 70 calo. Một người cần bữa sáng không quá 600 calo. Gọi $x$ (gam) thịt bò và $y$ (quả) trứng ăn trong bữa sáng.
    + Lập BPT theo $x, y$ diễn tả giới hạn lượng calo.
    + Dùng BPT trả lời:
      - Ăn 200g thịt bò và 2 quả trứng có phù hợp không?
      - Ăn 150g thịt bò và 3 quả trứng có phù hợp không?
  ], loigiai: [
    - *a)* Trong 1g thịt bò chứa $250 / 100 = 2,5$ calo.
      Lượng calo từ $x$ gam thịt bò là $2,5x$ calo và từ $y$ quả trứng là $70y$ calo.
      Vì bữa sáng không quá $600$ calo nên bất phương trình là:
      $ 2,5x + 70y <= 600 quad (x >= 0, y in NN). $
    - *b)* Kiểm tra từng trường hợp:
      - Trường hợp 1: Ăn 200g thịt bò và 2 quả trứng ($x = 200, y = 2$):
        $ 2,5(200) + 70(2) = 500 + 140 = 640 > 600. $
        Do đó thực đơn này vượt quá giới hạn calo (không phù hợp).
      - Trường hợp 2: Ăn 150g thịt bò và 3 quả trứng ($x = 150, y = 3$):
        $ 2,5(150) + 70(3) = 375 + 210 = 585 <= 600. $
        Do đó thực đơn này thỏa mãn giới hạn calo (phù hợp).
  ])
]

#bai-tap-trac-nghiem(mau: C2)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)], count: 16, reset-counter: true)

#tn(
  dir: "ngang",
  [Cặp số nào sau đây là nghiệm của bất phương trình $2x - y + 1 < 0$?],
  (
    [$(0; -1)$.],
    [$(3; 5)$.],
    True([$(1; 4)$.]),
    [$(2; -1)$.],
  ),
  loigiai: [
    Thay lần lượt tọa độ các điểm vào vế trái $f(x, y) = 2x - y + 1$:
    - Với $(0; -1)$: $2(0) - (-1) + 1 = 2 > 0$ (loại).
    - Với $(3; 5)$: $2(3) - 5 + 1 = 2 > 0$ (loại).
    - Với $(1; 4)$: $2(1) - 4 + 1 = -1 < 0$ (thỏa mãn).
    - Với $(2; -1)$: $2(2) - (-1) + 1 = 6 > 0$ (loại).
    Chọn đáp án C.
  ]
)

#tn(
  dir: "ngang",
  [Tìm cặp số là nghiệm của bất phương trình $-x + 3y - 2 > 0$.],
  (
    [$(1; 1)$.],
    True([$(-1; 2)$.]),
    [$(0; 0)$.],
    [$(3; 1)$.],
  ),
  loigiai: [Thay $(-1; 2)$ vào vế trái: $-(-1) + 3(2) - 2 = 1 + 6 - 2 = 5 > 0$ (thỏa mãn). Chọn đáp án B.]
)

#tn(
  dir: "ngang",
  [Cặp số nào sau đây không là nghiệm của bất phương trình $2x + y - 7 > 0$?],
  (
    [$(3; 2)$.],
    [$(5; -1)$.],
    [$(4; 0)$.],
    True([$(-2; 5)$.]),
  ),
  loigiai: [Thay $(-2; 5)$ vào vế trái: $2(-2) + 5 - 7 = -6 <= 0$, do đó $(-2; 5)$ không là nghiệm. Chọn đáp án D.]
)

#tn(
  dir: "ngang",
  [Cặp số $(x; y) = (19; 8)$ là một nghiệm của bất phương trình nào sau đây?],
  (
    [$2x - 5y - 1 > 0$.],
    [$x - y < 0$.],
    [$3x - y - 5 < 0$.],
    True([$x - 2y + 1 >= 0$.]),
  ),
  loigiai: [
    Thay $x = 19, y = 8$ vào từng phương án:
    - A: $2(19) - 5(8) - 1 = 38 - 40 - 1 = -3 > 0$ (sai).
    - B: $19 - 8 = 11 < 0$ (sai).
    - C: $3(19) - 8 - 5 = 57 - 13 = 44 < 0$ (sai).
    - D: $19 - 2(8) + 1 = 19 - 16 + 1 = 4 >= 0$ (đúng).
    Chọn đáp án D.
  ]
)

#tn(
  dir: "ngang",
  [Điểm $A(-1; 3)$ là điểm không thuộc miền nghiệm của bất phương trình nào sau đây?],
  (
    True([$-3x + 2y - 4 < 0$.]),
    [$x + 3y > 0$.],
    [$3x - y <= 0$.],
    [$2x - y + 4 < 0$.],
  ),
  loigiai: [
    Thay $x = -1, y = 3$ vào các bất phương trình:
    - Với phương án A: $-3(-1) + 2(3) - 4 = 3 + 6 - 4 = 5 > 0$, không thỏa mãn bất phương trình $< 0$. Do đó $A$ không thuộc miền nghiệm của bất phương trình ở phương án A.
    Chọn đáp án A.
  ]
)

#tn(
  dir: "ngang",
  [Cặp số nào sau đây là nghiệm của bất phương trình $2x - y < 0$?],
  (
    [$(0; -1)$.],
    [$(3; 5)$.],
    True([$(1; 4)$.]),
    [$(2; -1)$.],
  ),
  loigiai: [Thay $(1; 4)$ vào vế trái ta có: $2(1) - 4 = -2 < 0$ (thỏa mãn). Chọn đáp án C.]
)

#tn(
  dir: "ngang",
  [Tìm cặp số là nghiệm của bất phương trình $-2x + 3y - 5 > 0$.],
  (
    [$(-1; 1)$.],
    True([$(-1; 2)$.]),
    [$(0; 0)$.],
    [$(3; 1)$.],
  ),
  loigiai: [Thay $(-1; 2)$ vào vế trái: $-2(-1) + 3(2) - 5 = 2 + 6 - 5 = 3 > 0$ (thỏa mãn). Chọn đáp án B.]
)

#tn(
  dir: "ngang",
  [Cặp số nào sau đây không là nghiệm của bất phương trình $x + 2y - 3 > 0$?],
  (
    [$(-2; 3)$.],
    [$(-1; 4)$.],
    [$(4; 0)$.],
    True([$(-1; 0)$.]),
  ),
  loigiai: [Thay $(-1; 0)$ vào vế trái ta được: $-1 + 2(0) - 3 = -4 <= 0$, không thỏa mãn $> 0$. Do đó $(-1; 0)$ không là nghiệm. Chọn đáp án D.]
)

#tn(
  dir: "ngang",
  [Cặp số $(x; y) = (9; 8)$ là một nghiệm của bất phương trình nào sau đây?],
  (
    [$-x + y < 0$.],
    [$x - y < 0$.],
    [$x + 3y - 5 < 0$.],
    True([$2x - y + 1 >= 0$.]),
  ),
  loigiai: [Thay $x = 9, y = 8$ vào phương án D: $2(9) - 8 + 1 = 18 - 8 + 1 = 11 >= 0$ (thỏa mãn). Chọn đáp án D.]
)

#tn(
  dir: "ngang",
  [Miền nghiệm của bất phương trình $-x + 2 + 2(y - 2) < 2(1 - x)$ là nửa mặt phẳng không chứa điểm nào trong các điểm sau?],
  (
    [$A(0; 0)$.],
    [$B(1; 1)$.],
    True([$C(4; 2)$.]),
    [$D(1; -1)$.],
  ),
  loigiai: [
    Biến đổi bất phương trình:
    $ -x + 2 + 2y - 4 < 2 - 2x <=> x + 2y - 4 < 0. $
    Thay tọa độ điểm $C(4; 2)$ vào:
    $ 4 + 2(2) - 4 = 4 >= 0 text(" (không thỏa mãn)"). $
    Vậy miền nghiệm không chứa điểm $C(4; 2)$. Chọn đáp án C.
  ]
)

#tn(
  dir: "ngang",
  [Tìm $m$ để bất phương trình $m x - 3y < 2$ là bất phương trình bậc nhất hai ẩn?],
  (
    True([$m in RR$.]),
    [$m != 0$.],
    [$m > 0$.],
    [$m < 0$.],
  ),
  loigiai: [BPT bậc nhất hai ẩn $a x + b y < c$ yêu cầu $a, b$ không đồng thời bằng $0$. Ở đây hệ số của $y$ là $b = -3 != 0$ nên với mọi giá trị $m in RR$, bất phương trình luôn là BPT bậc nhất hai ẩn. Chọn đáp án A.]
)

#tn(
  dir: "ngang",
  [Với giá trị nào của tham số $m$ thì bất phương trình $(m^2 - 1)x + (2 - 2m)y > 2$ là bất phương trình bậc nhất hai ẩn:],
  (
    True([$m != 1$.]),
    [$m != plus.minus 1$.],
    [$m = 1$.],
    [$m = -1$.],
  ),
  loigiai: [
    Để là BPT bậc nhất hai ẩn thì các hệ số của $x$ và $y$ không đồng thời bằng $0$:
    $ #heva("m^2 - 1 = 0", "2 - 2m = 0") <=> #heva("m = plus.minus 1", "m = 1") <=> m = 1. $
    Do đó để không đồng thời bằng 0 thì $m != 1$. Chọn đáp án A.]
)

#tn(
  dir: "ngang",
  [Tìm $m$ để bất phương trình $4x - m y < 5$ là bất phương trình bậc nhất hai ẩn?],
  (
    True([$m in RR$.]),
    [$m != 0$.],
    [$m > 0$.],
    [$m < 0$.],
  ),
  loigiai: [Vì hệ số của $x$ là $4 != 0$ nên với mọi $m in RR$, hai hệ số không bao giờ cùng bằng 0. Chọn đáp án A.]
)

#tn(
  dir: "ngang",
  [Với giá trị nào của tham số $m$ thì bất phương trình $(m^2 - 3m + 2)x + (1 - m)y >= 3$ là bất phương trình bậc nhất hai ẩn:],
  (
    True([$m != 1$.]),
    [$m != 2$.],
    [$m = 1$.],
    [$m = 2$.],
  ),
  loigiai: [
    Hai hệ số cùng bằng 0 khi:
    $ #heva("m^2 - 3m + 2 = 0", "1 - m = 0") <=> #heva("m in {1; 2}", "m = 1") <=> m = 1. $
    Vậy điều kiện để là BPT bậc nhất hai ẩn là $m != 1$. Chọn đáp án A.
  ]
)

#tn(
  dir: "ngang",
  [Một cửa hàng bán hai loại đồ uống: loại A giá 15.000 đồng/ly, loại B giá 20.000 đồng/ly. Muốn có lãi mỗi ngày phải bán ít nhất 2 triệu đồng tiền hàng. Cửa hàng có lãi trong trường hợp nào?],
  (
    [90 ly loại A và 30 ly loại B.],
    True([85 ly loại A và 37 ly loại B.]),
    [78 ly loại A và 42 ly loại B.],
    [80 ly loại A và 30 ly loại B.],
  ),
  loigiai: [
    Gọi $x, y$ lần lượt là số ly loại A và loại B bán được. Doanh thu tính theo nghìn đồng:
    $ 15x + 20y >= 2000. $
    Kiểm tra từng trường hợp:
    - 90 ly A và 30 ly B: $15(90) + 20(30) = 1350 + 600 = 1950 < 2000$.
    - 85 ly A và 37 ly B: $15(85) + 20(37) = 1275 + 740 = 2015 >= 2000$ (thỏa mãn).
    - 78 ly A và 42 ly B: $15(78) + 20(42) = 1170 + 840 = 2010$ (cần đối chiếu phương án).
    - 80 ly A và 30 ly B: $15(80) + 20(30) = 1200 + 600 = 1800 < 2000$.
    Chọn đáp án B.
  ]
)

#tn(
  dir: "ngang",
  [Công ty chi tối đa 12 triệu quảng cáo: 1,5 triệu/phút đài phát thanh (ít nhất 3 phút), 4 triệu/phút truyền hình (tối đa 4 phút). Hiệu quả truyền hình gấp 5 lần phát thanh. Để hiệu quả tối đa thì nên phân bổ thời lượng thế nào?],
  (
    [3 phút trên phát thanh và 5 phút trên truyền hình.],
    [5 phút trên phát thanh và 3 phút trên truyền hình.],
    True([3 phút trên phát thanh và $15/8$ phút trên truyền hình.]),
    [$5/8$ phút phát thanh và $99/8$ phút truyền hình.],
  ),
  loigiai: [
    Gọi $x$ (phút) là thời lượng phát thanh, $y$ (phút) là thời lượng truyền hình ($x >= 3, 0 <= y <= 4$).
    Ràng buộc chi phí: $1,5x + 4y <= 12 <=> 3x + 8y <= 24$.
    Gọi hiệu quả 1 phút phát thanh là $1$ đơn vị thì 1 phút truyền hình là $5$ đơn vị.
    Hàm tổng hiệu quả cần tối đa hóa: $F(x, y) = x + 5y$.
    Từ $3x + 8y <= 24 => y <= (24 - 3x)/8 = 3 - 3/8 x$.
    Do đó: $F(x, y) <= x + 5(3 - 3/8 x) = 15 - 7/8 x$.
    Vì $x >= 3$ nên $F(x, y) <= 15 - 7/8 (3) = 99/8$.
    Dấu bằng đạt được khi $x = 3$ và $y = (24 - 3 dot 3)/8 = 15/8$ phút (thỏa mãn $y <= 4$).
    Vậy thời lượng tối ưu là 3 phút phát thanh và $15/8$ phút truyền hình.
    Chọn đáp án C.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)], count: 4, reset-counter: true)

#ds(
  [Xét tính đúng, sai của các mệnh đề sau:],
  (
    True([$(-1)/7 x - y/3 <= 8$ là bất phương trình bậc nhất hai ẩn;]),
    [$sqrt(2)x^2 - 5sqrt(y) >= 8$ là bất phương trình bậc nhất hai ẩn;],
    [$2/x - 5/y > 8$ là bất phương trình bậc nhất hai ẩn;],
    True([$2/(-5) x - 5^2 y <= -sqrt(15)$ là bất phương trình bậc nhất hai ẩn.]),
  ),
  loigiai: [
    - *a) Đúng:* Có dạng $a x + b y <= c$ với $a = -1/7, b = -1/3, c = 8$, các hệ số thực và bậc của $x, y$ đều là 1.
    - *b) Sai:* Chứa $x^2$ và căn bậc hai $sqrt(y)$, không phải bậc nhất.
    - *c) Sai:* Các ẩn $x, y$ nằm ở mẫu số, không phải dạng đa thức bậc nhất.
    - *d) Đúng:* Thu gọn thành $-2/5 x - 25y <= -sqrt(15)$, là BPT bậc nhất hai ẩn.
  ]
)

#ds(
  [An có 200.000 đồng mua cam (15.000 đ/kg) và xoài (30.000 đ/kg). Gọi $x, y$ lần lượt là số kg cam và xoài mua trong tuần. Khi đó:],
  (
    True([Số tiền mua cam là $15000x$, số tiền mua xoài là $30000y$ với $x, y > 0$.]),
    [Bất phương trình bậc nhất cho hai ẩn $x, y$ là $3x + 6y >= 40$.],
    True([Cặp số $(5; 4)$ thỏa mãn bất phương trình mua hàng của An.]),
    [An có thể mua 4 kg cam và 5 kg xoài trong tuần.],
  ),
  loigiai: [
    - *a) Đúng:* Giá cam là 15.000 đ/kg nên $x$ kg hết $15000x$; xoài hết $30000y$.
    - *b) Sai:* Tổng số tiền An có là 200.000 đồng, do đó số tiền chi trả không được vượt quá số tiền có:
      $ 15000x + 30000y <= 200000 <=> 15x + 30y <= 200 <=> 3x + 6y <= 40. $
      Khẳng định ghi dấu $>=$ là sai.
    - *c) Đúng:* Với cặp $(5; 4)$, ta có $3(5) + 6(4) = 15 + 24 = 39 <= 40$ (thỏa mãn).
    - *d) Sai:* Với 4 kg cam và 5 kg xoài: $3(4) + 6(5) = 12 + 30 = 42 > 40$ (vượt quá 200.000 đ).
  ]
)

#ds(
  [Một đội sản xuất cần 3 giờ làm sản phẩm loại I, 2 giờ làm sản phẩm loại II. Thời gian làm việc tối đa là 18 giờ. Gọi $x, y$ lần lượt là số sản phẩm loại I và II làm được ($x, y in NN$). Khi đó:],
  (
    [Tổng thời gian làm xong sản phẩm loại I là $2x$, loại II là $3y$.],
    [Bất phương trình bậc nhất hai ẩn theo $x, y$ là $3x + 2y < 18$.],
    True([$(3; 4)$ là một nghiệm của bất phương trình giới hạn thời gian.]),
    True([$(4; 3)$ là một nghiệm của bất phương trình giới hạn thời gian.]),
  ),
  loigiai: [
    - *a) Sai:* Mỗi sản phẩm loại I mất 3 giờ nên $x$ sản phẩm mất $3x$ giờ; loại II mất $2y$ giờ.
    - *b) Sai:* Thời gian tối đa là 18 giờ (được phép bằng 18) nên bất phương trình là $3x + 2y <= 18$, không phải $< 18$.
    - *c) Đúng:* Thay $(3; 4)$ vào: $3(3) + 2(4) = 9 + 8 = 17 <= 18$.
    - *d) Đúng:* Thay $(4; 3)$ vào: $3(4) + 2(3) = 12 + 6 = 18 <= 18$.
  ]
)

#ds(
  [Một trò chơi chọn ô chữ: chọn chữ A được cộng 3 điểm, chọn chữ B bị trừ 1 điểm. Cần tối thiểu 20 điểm để thắng. Gọi $x, y$ lần lượt là số lần chọn A và B. Khi đó:],
  (
    True([Tổng số điểm đạt được khi chọn chữ A là $3x$, số điểm bị trừ khi chọn B là $y$.]),
    [Bất phương trình bậc nhất hai ẩn trong tình huống người chơi chiến thắng là $3x - y >= 18$.],
    True([Người chơi chọn chữ A 7 lần và chọn chữ B 1 lần thì người đó vừa đủ điểm giành chiến thắng.]),
    [Người chơi chọn chữ A 8 lần và chọn chữ B 3 lần thì người đó vừa đủ điểm giành chiến thắng.],
  ),
  loigiai: [
    - *a) Đúng:* Mỗi lần chọn A được $+3$ điểm nên $x$ lần được $3x$; mỗi lần chọn B bị trừ $1$ điểm nên $y$ lần bị trừ $y$ điểm.
    - *b) Sai:* Điểm số cần đạt tối thiểu là 20 điểm nên BPT chiến thắng là: $3x - y >= 20$.
    - *c) Đúng:* Khi $x = 7, y = 1$ thì số điểm là $3(7) - 1 = 20$, vừa đúng mốc 20 điểm chiến thắng.
    - *d) Sai:* Khi $x = 8, y = 3$ thì số điểm là $3(8) - 3 = 21 > 20$, người này vượt điểm chiến thắng chứ không phải 'vừa đủ điểm' (mức vừa đủ là đúng 20 điểm).
  ]
)

