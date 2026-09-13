#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Biểu diễn miền nghiệm của bất phương trình bậc nhất hai ẩn", mau: C2)

#phuong-phap(mau: C2)[
  Các bước biểu diễn miền nghiệm của bất phương trình $a x + b y <= c$ trên mặt phẳng toạ độ $O x y$:
  - *Bước 1*: Vẽ đường thẳng $Delta: a x + b y = c$.
  - *Bước 2*: Lấy một điểm $M_0(x_0; y_0)$ không thuộc $Delta$ (thường lấy gốc toạ độ $O(0; 0)$ nếu $c != 0$).
  - *Bước 3*: Tính $a x_0 + b y_0$ và so sánh với $c$.
  - *Bước 4*: Kết luận:
    - Nếu $a x_0 + b y_0 < c$ thì nửa mặt phẳng bờ $Delta$ chứa điểm $M_0$ là miền nghiệm của $a x + b y <= c$.
    - Nếu $a x_0 + b y_0 > c$ thì nửa mặt phẳng bờ $Delta$ không chứa điểm $M_0$ là miền nghiệm của $a x + b y <= c$.
  - *Lưu ý*: Nếu dấu bất phương trình là nghiêm ngặt ($<$ hoặc $>$), ta không kể đường biên $Delta$ (vẽ bằng nét đứt).
]

#bai-tap-tu-luan(mau: C2)[
  #bt-item(1, [Biểu diễn miền nghiệm của mỗi bất phương trình sau trên mặt phẳng toạ độ:
    + $3x + 2y >= 300$.
    + $7x + 20y < 0$.
    + $2x + 3y - 1 < 0$.
    + $x + 3y - 2 <= 0$.
    + e) $(x + y)/2 > (2x - y + 1)/3$.
    + f) $(5x + y - 1)/2 >= x + y + 1$.
  ], loigiai: [
    - a) Vẽ đường thẳng $3x + 2y = 300$. Xét $O(0; 0)$: $3(0) + 2(0) = 0 < 300$. Miền nghiệm là nửa mặt phẳng bờ $3x + 2y = 300$ không chứa gốc $O$, kể cả bờ.
    - b) Đường thẳng $7x + 20y = 0$ đi qua gốc toạ độ $O$. Chọn điểm $M(0; 1)$: $7(0) + 20(1) = 20 > 0$. Miền nghiệm là nửa mặt phẳng bờ $7x + 20y = 0$ không chứa điểm $M(0; 1)$, không kể bờ.
    - c) Vẽ $2x + 3y = 1$. Điểm $O(0; 0)$ thỏa mãn $2(0) + 3(0) - 1 = -1 < 0$. Miền nghiệm là nửa mặt phẳng chứa $O$, không kể bờ.
    - d) Vẽ $x + 3y = 2$. Miền nghiệm là nửa mặt phẳng bờ chứa gốc $O$, kể cả bờ.
    - e) Biến đổi: $3(x + y) > 2(2x - y + 1) <=> -x + 5y - 2 > 0$.
    - f) Biến đổi: $5x + y - 1 >= 2(x + y + 1) <=> 3x - y - 3 >= 0$.
  ])

  #bt-item(2, [Ông An thuê ô tô trong 1 tuần: Từ thứ Hai đến thứ Sáu phí cố định 900 nghìn đồng/ngày và 8 nghìn đồng/km; Cuối tuần phí cố định 1500 nghìn đồng/ngày và 10 nghìn đồng/km. Gọi $x, y$ lần lượt là số km đi trong tuần và cuối tuần. Viết BPT sao cho tổng chi phí không quá 14 triệu đồng.], loigiai: [
    Tổng chi phí cố định: $5 dot 900 + 2 dot 1500 = 4500 + 3000 = 7500$ nghìn đồng.
    Tổng tiền di chuyển: $8x + 10y$ (nghìn đồng).
    Tổng chi phí không quá 14 triệu ($14000$ nghìn đồng):
    $ 7500 + 8x + 10y <= 14000 <=> 8x + 10y <= 6500 <=> 4x + 5y <= 3250 quad (x, y >= 0). $
  ])

  #bt-item(3, [Một cửa hàng trộn $x$ kg cà phê loại một (140 nghìn đồng/kg) và $y$ kg loại hai (180 nghìn đồng/kg) sao cho giá cà phê đã trộn không quá 170 nghìn đồng/kg.
    + Viết bất phương trình bậc nhất hai ẩn $x, y$ thoả mãn đề bài.
    + Biểu diễn miền nghiệm của bất phương trình trên mặt phẳng toạ độ.
  ], loigiai: [
    Giá trung bình mỗi kg cà phê trộn: $(140x + 180y)/(x + y) <= 170$.
    Do $x, y >= 0$ và $x + y > 0$ nên:
    $ 140x + 180y <= 170(x + y) <=> 10y <= 30x <=> 3x - y >= 0. $
  ])
]

#bai-tap-trac-nghiem(mau: C2)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)], count: 13, reset-counter: true)

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
    Thay tọa độ điểm $A(-1; 3)$ vào từng bất phương trình:
    - Phương án A: $-3(-1) + 2(3) - 4 = 3 + 6 - 4 = 5 > 0$, không thỏa mãn bất phương trình $< 0$. Do đó điểm $A$ không thuộc miền nghiệm của phương án A.
    - Phương án B: $-1 + 3(3) = 8 > 0$ (thỏa mãn).
    - Phương án C: $3(-1) - 3 = -6 <= 0$ (thỏa mãn).
    - Phương án D: $2(-1) - 3 + 4 = -1 < 0$ (thỏa mãn).
    Chọn đáp án A.
  ]
)

#tn(
  dir: "ngang",
  [Miền nghiệm của bất phương trình $3x + 2(y + 3) > 4(x + 1) - y + 3$ là phần mặt phẳng chứa điểm nào?],
  (
    [$(3; 0)$.],
    [$(3; 1)$.],
    True([$(1; 1)$.]),
    [$(0; 0)$.],
  ),
  loigiai: [
    Khai triển và thu gọn bất phương trình:
    $ 3x + 2y + 6 > 4x + 4 - y + 3 <=> -x + 3y - 1 > 0. $
    Thay tọa độ các điểm vào vế trái $f(x, y) = -x + 3y - 1$:
    - Với $(3; 0)$: $-3 + 3(0) - 1 = -4 < 0$ (loại).
    - Với $(3; 1)$: $-3 + 3(1) - 1 = -1 < 0$ (loại).
    - Với $(1; 1)$: $-1 + 3(1) - 1 = 1 > 0$ (thỏa mãn).
    - Với $(0; 0)$: $-0 + 3(0) - 1 = -1 < 0$ (loại).
    Chọn đáp án C.
  ]
)

#tn(
  dir: "ngang",
  [Miền nghiệm của bất phương trình $5(x + 2) - 9 < 2x - 2y + 7$ là phần mặt phẳng không chứa điểm nào?],
  (
    [$(-2; 1)$.],
    True([$(2; 3)$.]),
    [$(2; -1)$.],
    [$(0; 0)$.],
  ),
  loigiai: [BPT tương đương $3x + 2y - 6 < 0$. Thay $(2; 3)$ có $3(2) + 2(3) - 6 = 6 > 0$, do đó miền nghiệm không chứa $(2; 3)$. Chọn đáp án B.]
)

#tn(
  dir: "ngang",
  [Phần bị gạch sọc trong hình vẽ có đường thẳng đi qua $(0; -3)$ và $(3/2; 0)$ là miền nghiệm của bất phương trình nào?],
  (
    True([$2x - y > 3$.]),
    [$2x - y < 3$.],
    [$x - 2y < 3$.],
    [$x - 2y > 3$.],
  ),
  loigiai: [Đường thẳng cắt trục tung tại $(0; -3)$ và trục hoành tại $(3/2; 0)$ có phương trình $2x - y = 3$. Điểm $O(0; 0)$ có $2(0) - 0 = 0 < 3$. Miền gạch không chứa gốc $O$ tương ứng với $2x - y > 3$. Chọn đáp án A.]
)

#tn(
  dir: "ngang",
  [Điểm nào sau đây thuộc miền nghiệm của bất phương trình $2x + y - 3 > 0$?],
  (
    [$Q(-1; -3)$.],
    True([$M(1; 3/2)$.]),
    [$N(1; 1)$.],
    [$P(-1; 3/2)$.],
  ),
  loigiai: [Thay $M(1; 3/2)$: $2(1) + 3/2 - 3 = 1/2 > 0$ thỏa mãn. Chọn đáp án B.]
)

#tn(
  dir: "ngang",
  [Phần không bị gạch chéo có đường biên đi qua $(-2; 0)$ và $(0; 3)$ là miền nghiệm của bất phương trình nào?],
  (
    [$3x - 2y < -6$.],
    True([$3x - 2y > -6$.]),
    [$3x - 2y > 0$.],
    [$3x - 2y < 0$.],
  ),
  loigiai: [Đường thẳng qua $(-2; 0)$ và $(0; 3)$ có phương trình $x/(-2) + y/3 = 1 <=> -3x + 2y = 6 <=> 3x - 2y = -6$. Gốc $O(0; 0)$ thuộc miền nghiệm và $3(0) - 2(0) = 0 > -6$. Do đó miền nghiệm là $3x - 2y > -6$. Chọn đáp án B.]
)

#tn(
  dir: "ngang",
  [Miền không bị gạch chứa gốc toạ độ $O$ có đường biên qua $(4; 0)$ và $(0; -2)$ biểu diễn bất phương trình nào?],
  (
    True([$2x - 4y < 8$.]),
    [$2x - 4y > 8$.],
    [$2x - 4y > -5$.],
    [$2x - 4y > -3$.],
  ),
  loigiai: [Đường thẳng $x/4 + y/(-2) = 1 <=> x - 2y = 4 <=> 2x - 4y = 8$. Điểm $O(0; 0)$ thỏa mãn $2(0) - 4(0) = 0 < 8$. Chọn đáp án A.]
)

#tn(
  dir: "ngang",
  [Phần không bị gạch sọc có đường biên đi qua $(0; 3)$ và $(2; 0)$ là miền nghiệm của bất phương trình nào?],
  (
    [$3x + 2y < 6$.],
    True([$3x + 2y > 6$.]),
    [$3x + 2y < 0$.],
    [$3x + 2y > 0$.],
  ),
  loigiai: [Đường thẳng $3x + 2y = 6$. Miền không bị gạch không chứa gốc $O(0; 0)$ nên tương ứng với $3x + 2y > 6$. Chọn đáp án B.]
)

#tn(
  dir: "ngang",
  [Miền nghiệm của bất phương trình $(1 + sqrt(3))x - (1 - sqrt(3))y >= 2$ chứa điểm nào sau đây?],
  (
    True([$A(1; -1)$.]),
    [$B(-1; -1)$.],
    [$C(-1; 1)$.],
    [$D(-sqrt(3); sqrt(3))$.],
  ),
  loigiai: [Thay $A(1; -1)$: $(1 + sqrt(3))(1) - (1 - sqrt(3))(-1) = 1 + sqrt(3) + 1 - sqrt(3) = 2 >= 2$ thỏa mãn. Chọn đáp án A.]
)

#tn(
  dir: "ngang",
  [Miền nghiệm của bất phương trình $x - 2 + 2(y - 1) > 2x + 4$ chứa điểm nào sau đây?],
  (
    [$A(1; 1)$.],
    True([$B(1; 5)$.]),
    [$C(4; 3)$.],
    [$D(0; 4)$.],
  ),
  loigiai: [BPT tương đương $-x + 2y - 8 > 0$. Thay $B(1; 5)$ có $-1 + 2(5) - 8 = 1 > 0$. Chọn đáp án B.]
)

#tn(
  dir: "ngang",
  [Tìm tất cả các giá trị của tham số $m$ để điểm $M(1; 2)$ thuộc miền nghiệm của bất phương trình $(m + 1)x + (m^2 + m)y - 1 > 0$.],
  (
    [$m in (0; +oo)$.],
    [$m in (-oo; -3/2)$.],
    True([$m in (-oo; -3/2) union (0; +oo)$.]),
    [$m in (-3/2; 0) \\ {-1}$.],
  ),
  loigiai: [
    Thay $x = 1, y = 2$:
    $ (m + 1)(1) + (m^2 + m)(2) - 1 > 0 <=> 2m^2 + 3m > 0 <=> m(2m + 3) > 0 <=> m < -3/2 " hoặc " m > 0. $
    Chọn đáp án C.
  ]
)

#tn(
  dir: "ngang",
  [Bạn Lan có 15 nghìn đồng mua vở: Vở loại A giá 3000 đồng/cuốn, loại B giá 4000 đồng/cuốn. Hỏi bạn Lan có thể mua nhiều nhất bao nhiêu cuốn vở sao cho có cả hai loại?],
  (
    [$3$.],
    [$5$.],
    True([$4$.]),
    [$6$.],
  ),
  loigiai: [
    Gọi $x, y in NN^*$ là số vở loại A và B.
    $3000x + 4000y <= 15000 <=> 3x + 4y <= 15$.
    Để tổng số vở $x + y$ lớn nhất, ta ưu tiên mua nhiều vở loại A (giá rẻ hơn).
    Với $y = 1 => 3x <= 11 => x <= 3$. Khi đó $x = 3, y = 1$ cho tổng số vở là $3 + 1 = 4$.
    Chọn đáp án C.
  ]
)

#tn(
  dir: "ngang",
  [Cho BPT $2x + y >= 2$ có miền nghiệm $D$. Dựng hình vuông $A B C O$ có cạnh $a$ nằm trong góc phần tư thứ nhất ($O$ là gốc toạ độ). Biết diện tích phần chung giữa miền nghiệm $D$ và hình vuông bằng $2022$. Giá trị của $a$ thuộc khoảng nào?],
  (
    True([$(44; 45)$.]),
    [$(44; 44,5)$.],
    [$(45; 46)$.],
    [$(43; 44)$.],
  ),
  loigiai: [
    Đường thẳng $2x + y = 2$ cắt $O x$ tại $(1; 0)$ và cắt $O y$ tại $(0; 2)$.
    Phần diện tích tam giác bị loại khỏi góc phần tư thứ nhất là $S_0 = 1/2 dot 1 dot 2 = 1$.
    Khi $a$ lớn, diện tích phần chung là $a^2 - S_0 = a^2 - 1 = 2022 <=> a^2 = 2023 => a = sqrt(2023) approx 44,98$.
    Giá trị này thuộc $(44; 45)$. Chọn đáp án A.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)], count: 4, reset-counter: true)

#ds(
  [Xét tính đúng, sai của các mệnh đề sau:],
  (
    True([Bất phương trình $3 - 2y > 0$ có miền nghiệm là nửa mặt phẳng bờ $3 - 2y = 0$ chứa gốc $O$ (bỏ bờ).]),
    [Bất phương trình $2x + y > 1$ có miền nghiệm là nửa mặt phẳng bờ $-2x + y + 1 = 0$ chứa gốc $O$.],
    [Bất phương trình $-2x + y + 1 <= 0$ có miền nghiệm là nửa mặt phẳng bờ chứa gốc $O$.],
    True([Bất phương trình $2x - 3y + 5 >= 0$ có miền nghiệm là nửa mặt phẳng bờ $2x - 3y + 5 = 0$ chứa $O$.]),
  ),
  loigiai: [
    - a) $3 - 2(0) = 3 > 0$ thỏa mãn, bỏ bờ do dấu $>$. (Đúng)
    - b) $2(0) + 0 = 0 < 1$ không chứa $O$. (Sai)
    - c) Thay $O(0; 0)$ được $1 <= 0$ sai. (Sai)
    - d) Thay $O(0; 0)$ được $5 >= 0$ đúng. (Đúng)
  ]
)

#ds(
  [Cho bất phương trình bậc nhất hai ẩn: $x - 2y + 2 <= 0$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Miền nghiệm của bất phương trình là nửa mặt phẳng kể cả bờ, không chứa gốc toạ độ $O$.]),
    True([$(1; 4)$ là nghiệm của bất phương trình.]),
    [$(0; 3)$ không là nghiệm của bất phương trình.],
    True([$(2; 2)$ là nghiệm của bất phương trình.]),
  ),
  loigiai: [
    Xét bất phương trình $f(x, y) = x - 2y + 2 <= 0$:
    - *a) Đúng:* Thay gốc $O(0; 0)$ vào ta được $0 - 2(0) + 2 = 2 > 0$ (không thỏa mãn). Do đó miền nghiệm là nửa mặt phẳng bờ $x - 2y + 2 = 0$ không chứa gốc $O$, kể cả bờ đường thẳng (do dấu $<=$).
    - *b) Đúng:* Thay $(1; 4)$ vào: $1 - 2(4) + 2 = -5 <= 0$ (thỏa mãn).
    - *c) Sai:* Thay $(0; 3)$ vào: $0 - 2(3) + 2 = -4 <= 0$, do đó $(0; 3)$ là một nghiệm của bất phương trình. Khẳng định nói 'không là nghiệm' là sai.
    - *d) Đúng:* Thay $(2; 2)$ vào: $2 - 2(2) + 2 = 0 <= 0$ (thỏa mãn).
  ]
)

#ds(
  [Phí gọi nội mạng 1.000 đ/phút, ngoại mạng 2.000 đ/phút. Gọi $x, y$ lần lượt là số phút gọi nội mạng và ngoại mạng. Muốn tổng cước thấp hơn 100.000 đồng. Khi đó:],
  (
    True([Số tiền phải trả là $x + 2y$ (nghìn đồng) với $x, y in NN$.]),
    True([Bất phương trình bậc nhất hai ẩn là $x + 2y < 100$.]),
    True([$x = 50, y = 20$ là nghiệm của bất phương trình.]),
    [Miền nghiệm của bất phương trình là một hình vuông.],
  ),
  loigiai: [
    - a), b) Đúng.
    - c) $50 + 2(20) = 90 < 100$ thỏa mãn. (Đúng)
    - d) Miền nghiệm trong góc phần tư thứ nhất là một miền tam giác, không phải hình vuông. (Sai)
  ]
)

#ds(
  [Rạp chiếu phim: Vé loại 1 (trẻ em): 50.000 đ/vé, Loại 2 (người lớn): 100.000 đ/vé. Cần tối thiểu 20 triệu để không bù lỗ. Gọi $x, y$ là số vé bán được ($x, y in NN$). Khi đó:],
  (
    True([Rạp chiếu phim sẽ phải bù lỗ nếu $x + 2y < 400$.]),
    True([Nếu bán được 250 vé loại 1 và 150 vé loại 2 thì rạp có lãi.]),
    True([Nếu bán được 200 vé loại 1 và 100 vé loại 2 thì rạp hòa vốn.]),
    True([Nếu bán được 50 vé loại 1 và 100 vé loại 2 thì rạp phải bù lỗ.]),
  ),
  loigiai: [
    Điều kiện hòa vốn/có lãi là $50x + 100y >= 20000 <=> x + 2y >= 400$.
    - Do đó bù lỗ khi $x + 2y < 400$.
    - 250 vé loại 1 + 150 vé loại 2: $250 + 300 = 550 >= 400$ (Có lãi).
    - 200 vé loại 1 + 100 vé loại 2: $200 + 200 = 400$ (Hòa vốn).
    - 50 vé loại 1 + 100 vé loại 2: $50 + 200 = 250 < 400$ (Bù lỗ).
    Cả 4 ý đều đúng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho bất phương trình $x/2 + y/3 - 1 <= 0$. Miền nghiệm có chứa bao nhiêu điểm $(x; y)$ với $x, y$ là các số nguyên dương?],
  [1],
  loigiai: [
    Quy đồng: $3x + 2y <= 6$.
    Vì $x, y in NN^*$ nên $x >= 1, y >= 1$.
    Với $x = 1 => 2y <= 3 => y = 1$ (thỏa mãn: $3(1) + 2(1) = 5 <= 6$).
    Với $x >= 2 => 3x >= 6 => 2y <= 0$ (vô nghiệm do $y >= 1$).
    Vậy chỉ có duy nhất 1 điểm là $(1; 1)$.
  ]
)

#tln(
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của tham số $m$ sao cho cặp $(x; y) = (1; -1)$ là nghiệm của bất phương trình $(m/2)x - (m + 1)y + 2 >= 0$.],
  [-2],
  loigiai: [
    Thay $x = 1, y = -1$ vào:
    $ m/2(1) - (m + 1)(-1) + 2 >= 0 <=> m/2 + m + 1 + 2 >= 0 <=> (3m)/2 + 3 >= 0 <=> m >= -2. $
    Vậy giá trị nhỏ nhất của $m$ là $-2$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tam giác $A B C$ có $A(0; 3), B(-1; 2), C(2; 1)$. Biết điều kiện của tham số $m$ để điểm $M(m; (2m - 1)/2)$ nằm bên trong tam giác $A B C$ là $a < m < b$. Tính giá trị của biểu thức $T = 8a + 4b$.],
  [20],
  loigiai: [
    Lập phương trình đường thẳng chứa ba cạnh của tam giác $A B C$:
    - Đường thẳng $A B$: đi qua $A(0; 3)$ có VTCP $arrow(A B) = (-1; -1) =>$ VTPT $arrow(n)_(A B) = (1; -1)$.
      Phương trình $A B$: $1(x - 0) - 1(y - 3) = 0 <=> x - y + 3 = 0$.
      Điểm $C(2; 1)$ có $2 - 1 + 3 = 4 > 0$, do đó nửa mặt phẳng chứa $C$ là $x - y + 3 > 0$.
    - Đường thẳng $A C$: đi qua $A(0; 3)$ có VTCP $arrow(A C) = (2; -2) =>$ VTPT $arrow(n)_(A C) = (1; 1)$.
      Phương trình $A C$: $1(x - 0) + 1(y - 3) = 0 <=> x + y - 3 = 0$.
      Điểm $B(-1; 2)$ có $-1 + 2 - 3 = -2 < 0$, do đó nửa mặt phẳng chứa $B$ là $x + y - 3 < 0$.
    - Đường thẳng $B C$: đi qua $B(-1; 2)$ có VTCP $arrow(B C) = (3; -1) =>$ VTPT $arrow(n)_(B C) = (1; 3)$.
      Phương trình $B C$: $1(x + 1) + 3(y - 2) = 0 <=> x + 3y - 5 = 0$.
      Điểm $A(0; 3)$ có $0 + 3(3) - 5 = 4 > 0$, do đó nửa mặt phẳng chứa $A$ là $x + 3y - 5 > 0$.
    Điểm $M$ nằm bên trong tam giác $A B C$ khi và chỉ khi tọa độ của $M$ thỏa mãn hệ ba bất phương trình:
    $ cases(x - y + 3 > 0, x + y - 3 < 0, x + 3y - 5 > 0) $
    Thay tọa độ $M(m; (2m - 1)/2)$ vào:
    1. $m - (2m - 1)/2 + 3 > 0 <=> 7/2 > 0$ (luôn đúng với mọi $m$).
    2. $m + (2m - 1)/2 - 3 < 0 <=> (4m - 7)/2 < 0 <=> m < 7/4$.
    3. $m + 3 dot ((2m - 1)/2) - 5 > 0 <=> (8m - 13)/2 > 0 <=> m > 13/8$.
    Kết hợp lại ta được: $13/8 < m < 7/4$.
    Do đó $a = 13/8$ và $b = 7/4$.
    Giá trị của biểu thức $T = 8a + 4b = 8 dot (13/8) + 4 dot (7/4) = 13 + 7 = 20$.
  ]
)

#tln(
  dir: "ngang",
  [Bạn Lan mang 150.000 đồng mua tập (8.000 đ/cuốn) và bút (6.000 đ/cây). Lan đã mua 10 cây bút. Hỏi Lan có thể mua được tối đa bao nhiêu quyển tập?],
  [11],
  loigiai: [
    Tiền mua 10 cây bút: $10 dot 6000 = 60000$ đồng.
    Số tiền còn lại: $150000 - 60000 = 90000$ đồng.
    Số quyển tập tối đa: $floor(90000 / 8000) = 11$ quyển.
  ]
)

#tln(
  dir: "ngang",
  [Hộ nông dân trồng đậu và cà trên diện tích $800 "m"^2$. Mỗi $100 "m"^2$ đậu cần 20 công làm, thu 3 triệu đồng. Mỗi $100 "m"^2$ cà cần 30 công làm, thu 4 triệu đồng. Tổng số công không quá 180 công. Để thu nhiều tiền nhất thì diện tích trồng đậu là bao nhiêu mét vuông?],
  [600],
  loigiai: [
    Gọi $x, y$ là số trăm mét vuông trồng đậu và cà ($x, y >= 0$).
    Ràng buộc: $x + y <= 8$ và $20x + 30y <= 180 <=> 2x + 3y <= 18$.
    Lợi nhuận $F = 3x + 4y$ (triệu đồng).
    Các đỉnh của miền nghiệm: $(0; 0), (8; 0), (6; 2), (0; 6)$.
    Tại $(8; 0)$: $F = 24$.
    Tại $(6; 2)$: $F = 3(6) + 4(2) = 26$ triệu đồng (lớn nhất).
    Vậy diện tích trồng đậu tối ưu là $6$ trăm $"m"^2$, tức là $600 "m"^2$.
  ]
)

#tln(
  dir: "ngang",
  [Anh An được hoa hồng 600 nghìn đồng cho mỗi máy giặt và 1,3 triệu đồng cho mỗi tủ lạnh. Để nhận từ 10 triệu đồng trở lên tiền hoa hồng thì nếu anh An chỉ bán tủ lạnh, số tủ lạnh tối thiểu cần bán là bao nhiêu?],
  [8],
  loigiai: [
    Gọi số tủ lạnh là $y in NN$.
    Hoa hồng: $1,3y >= 10 <=> y >= 10 / 1,3 approx 7,69$.
    Vì $y in NN$ nên anh An cần bán tối thiểu 8 chiếc tủ lạnh.
  ]
)
