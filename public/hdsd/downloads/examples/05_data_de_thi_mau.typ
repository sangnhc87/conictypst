#import "../lib.typ": *

#let make-questions(tn: none, ds: none, tln: none, tl: none, exam-part: none) = {
  exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án], count: 12)

  tn([Cho hàm số $y=f(x)$ có bảng biến thiên như sau. Hàm số đã cho đồng biến trên khoảng nào dưới đây?], ([$(-1; 1)$], [$(-oo; -1)$], True([$(1; +oo)$]), [$(0; 2)$]), loigiai: [
    - Dựa vào bảng biến thiên, ta thấy đạo hàm $y' > 0$ và đồ thị có hướng đi lên trong khoảng $(1; +oo)$.
    - Suy ra hàm số đồng biến trên khoảng $(1; +oo)$.
  ])

  tn([Hàm số $y=x^3-3x$ đạt cực đại tại điểm nào?], (True([$x = -1$]), [$x = 1$], [$x = 0$], [$x = -3$]), loigiai: [
    - Tập xác định: $D = RR$.
    - Đạo hàm: $y' = 3x^2 - 3$.
    - Xét phương trình:
      $ y' = 0 <=> 3x^2 - 3 = 0 <=> hoac(x &= 1, x &= -1) $
    - Qua điểm $x = -1$, đạo hàm $y'$ đổi dấu từ $(+)$ sang $(-)$. Do đó, hàm số đạt cực đại tại $x = -1$.
  ])

  tn([Trong không gian $O x y z$, cho điểm $A(1; -2; 3)$. Hình chiếu vuông góc của $A$ trên mặt phẳng $(O x y)$ có tọa độ là], ([$(1; -2; 3)$], True([$(1; -2; 0)$]), [$(0; 0; 3)$], [$(1; 0; 0)$]), loigiai: [
    - Gọi $H$ là hình chiếu vuông góc của $A(1; -2; 3)$ trên mặt phẳng $(O x y)$.
    - Khi chiếu lên mặt phẳng $(O x y)$, hoành độ và tung độ được giữ nguyên, cao độ bằng $0$.
    - Vậy tọa độ điểm $H$ là $(1; -2; 0)$.
  ])

  tn([Đường tiệm cận đứng của đồ thị hàm số $y=(2x-1)/(x+1)$ là], ([$x=2$], [$y=2$], True([$x=-1$]), [$y=-1$]), loigiai: [
    - Tập xác định: $D = RR \\ {-1}$.
    - Ta có $lim_(x -> -1^+) (2x-1)/(x+1) = -oo$ và $lim_(x -> -1^-) (2x-1)/(x+1) = +oo$.
    - Suy ra đường thẳng $x = -1$ là tiệm cận đứng của đồ thị hàm số.
  ])

  tn([Cho hai vectơ $vec(u)=(1; 2; -1)$ và $vec(v)=(2; -1; 1)$. Tích vô hướng $vec(u) . vec(v)$ bằng], ([$3$], [$-2$], True([$-1$]), [$0$]), loigiai: [
    - Áp dụng công thức tích vô hướng của hai vectơ:
      $ vec(u) . vec(v) &= x_1 x_2 + y_1 y_2 + z_1 z_2 \
                        &= 1 . 2 + 2 . (-1) + (-1) . 1 \
                        &= 2 - 2 - 1 = -1 $
  ])

  tn([Giá trị lớn nhất của hàm số $f(x)=x^3-3x$ trên đoạn $[0; 2]$ bằng], ([$0$], [$-2$], True([$2$]), [$1$]), loigiai: [
    - Đạo hàm: $f'(x) = 3x^2 - 3$.
    - Xét trên đoạn $[0; 2]$:
      $ f'(x) = 0 <=> x^2 - 1 = 0 <=> hoac(x &= 1 quad &("nhận"), x &= -1 quad &("loại")) $
    - Tính các giá trị:
      $ f(0) = 0, quad f(1) = -2, quad f(2) = 2 $
    - Vậy $max_([0; 2]) f(x) = 2$.
  ])

  tn([Phương trình mặt cầu tâm $I(1; -2; 0)$, bán kính $R=3$ là], ([$(x-1)^2+(y+2)^2+z^2=3$], True([$(x-1)^2+(y+2)^2+z^2=9$]), [$(x+1)^2+(y-2)^2+z^2=9$], [$(x-1)^2+(y+2)^2+z^2=sqrt(3)$]), loigiai: [
    - Phương trình mặt cầu tâm $I(a; b; c)$, bán kính $R$ có dạng:
      $ (x - a)^2 + (y - b)^2 + (z - c)^2 = R^2 $
    - Thay $I(1; -2; 0)$ và $R = 3$ vào, ta được:
      $ (x - 1)^2 + (y + 2)^2 + z^2 = 9 $
  ])

  tn([Đạo hàm của hàm số $y=e^(2x)$ là], ([$y'=e^(2x)$], True([$y'=2e^(2x)$]), [$y'=1/2 e^(2x)$], [$y'=2x e^(2x-1)$]), loigiai: [
    - Áp dụng công thức đạo hàm hàm hợp $(e^u)' = u' e^u$.
    - Ta có:
      $ y' = (2x)' . e^(2x) = 2 e^(2x) $
  ])

  tn([Trong một mẫu số liệu ghép nhóm, độ dài của nhóm $[a; b)$ được tính bằng công thức nào?], ([$a+b$], [$(a+b)/2$], True([$b-a$]), [$(b-a)/2$]), loigiai: [
    - Theo định nghĩa, độ dài của nhóm $[a; b)$ là hiệu số giữa đầu mút phải và đầu mút trái.
    - Công thức: $L = b - a$.
  ])

  tn([Cho hình chóp $S.A B C$ có đáy là tam giác vuông tại $B$, $S A$ vuông góc với mặt phẳng đáy. Có bao nhiêu vectơ pháp tuyến của mặt phẳng $(S A B)$ được lập từ các đỉnh của hình chóp?], ([$1$], True([$2$]), [$3$], [$4$]), loigiai: [
    - Ta có $S A perp (A B C) => S A perp B C$.
    - Lại có $A B perp B C$ (do đáy là tam giác vuông tại $B$).
    - Suy ra $B C perp (S A B)$.
    - Do đó, mặt phẳng $(S A B)$ nhận $vec(B C)$ và $vec(C B)$ làm các vectơ pháp tuyến. Vậy có $2$ vectơ.
  ])

  tn([Hàm số nào dưới đây có đồ thị là một đường cong nhận gốc tọa độ $O$ làm tâm đối xứng?], (True([$y=x^3-3x$]), [$y=x^4-2x^2$], [$y=(x+1)/(x-1)$], [$y=e^x$]), loigiai: [
    - Hàm số nhận gốc tọa độ $O(0;0)$ làm tâm đối xứng là hàm số lẻ.
    - Xét $f(x) = x^3 - 3x$ có tập xác định $D = RR$.
    - Ta có $f(-x) = (-x)^3 - 3(-x) = -x^3 + 3x = - (x^3 - 3x) = -f(x)$.
    - Vậy $y=x^3-3x$ là hàm số lẻ.
  ])

  tn([Cho $a > 0, a != 1$. Biểu thức $P=a^(1/3) . sqrt(a)$ viết dưới dạng lũy thừa với số mũ hữu tỉ là], ([$a^(1/6)$], [$a^(2/3)$], True([$a^(5/6)$]), [$a^(5/3)$]), loigiai: [
    - Áp dụng các công thức lũy thừa:
      $ P = a^(1/3) . a^(1/2) = a^(1/3 + 1/2) = a^(5/6) $
  ])


  exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 4)

  ds([Cho hàm số $y=f(x)=(x^2-2x+2)/(x-1)$.],
    (
      True([Hàm số có tập xác định là $D=RR \\ {1}$.]),
      [Đồ thị hàm số có tiệm cận đứng là $x=-1$.],
      True([Đồ thị hàm số có tiệm cận xiên là $y=x-1$.]),
      [Hàm số đồng biến trên các khoảng $(-oo; 1)$ và $(1; +oo)$.],
    ),
    loigiai: [
      - *Ý a)* Mẫu số $x-1 != 0 <=> x != 1$. Tập xác định $D = RR \\ {1}$. Mệnh đề *ĐÚNG*.
      - *Ý b)* Đường thẳng $x = 1$ mới là tiệm cận đứng của đồ thị hàm số. Mệnh đề *SAI*.
      - *Ý c)* Thực hiện phép chia đa thức:
        $ y = (x(x-1) - (x-1) + 1)/(x-1) = x - 1 + 1/(x-1) $
        Đường thẳng $y = x - 1$ là tiệm cận xiên. Mệnh đề *ĐÚNG*.
      - *Ý d)* Đạo hàm:
        $ y' = 1 - 1/(x-1)^2 = ((x-1)^2 - 1)/(x-1)^2 = (x^2 - 2x)/(x-1)^2 $
        Phương trình $y' = 0 <=> hoac(x = 0, x = 2)$. Hàm số đồng biến trên $(-oo; 0)$ và $(2; +oo)$, nghịch biến trên $(0; 1)$ và $(1; 2)$. Mệnh đề *SAI*.
    ]
  )

  ds([Trong không gian với hệ tọa độ $O x y z$, cho ba điểm $A(1; 0; 0)$, $B(0; 2; 0)$ và $C(0; 0; 3)$.],
    (
      True([Vectơ $vec(A B) = (-1; 2; 0)$.]),
      True([Phương trình mặt phẳng $(A B C)$ là $x/1 + y/2 + z/3 = 1$.]),
      [Khoảng cách từ gốc tọa độ $O$ đến mặt phẳng $(A B C)$ bằng $1$.],
      [Tam giác $A B C$ là tam giác vuông tại $A$.],
    ),
    loigiai: [
      - *Ý a)* Tọa độ vectơ $vec(A B) = (0-1; 2-0; 0-0) = (-1; 2; 0)$. Mệnh đề *ĐÚNG*.
      - *Ý b)* Mặt phẳng $(A B C)$ cắt ba trục tọa độ tại $A(1;0;0), B(0;2;0), C(0;0;3)$ nên có phương trình theo đoạn chắn là:
        $ x/1 + y/2 + z/3 = 1 $
        Mệnh đề *ĐÚNG*.
      - *Ý c)* Quy đồng phương trình mặt phẳng $(A B C)$:
        $ 6x + 3y + 2z - 6 = 0 $
        Khoảng cách từ $O(0;0;0)$ đến $(A B C)$ là:
        $ d(O, (A B C)) = (|-6|)/(sqrt(6^2 + 3^2 + 2^2)) = 6/7 $
        Mệnh đề *SAI*.
      - *Ý d)* Độ dài các cạnh:
        $ A B^2 = 1^2 + 2^2 = 5 \ A C^2 = 1^2 + 3^2 = 10 \ B C^2 = 2^2 + 3^2 = 13 $
        Ta thấy $A B^2 + A C^2 != B C^2$, tam giác không vuông tại $A$. Mệnh đề *SAI*.
    ]
  )

  ds([Nhà trường thống kê thời gian sử dụng thư viện (phút) của một số học sinh trong một tuần thu được bảng sau:
    - Nhóm $[0; 30)$: 5 học sinh
    - Nhóm $[30; 60)$: 15 học sinh
    - Nhóm $[60; 90)$: 20 học sinh
    - Nhóm $[90; 120)$: 10 học sinh],
    (
      [Mẫu số liệu trên có kích thước là $N = 40$.],
      True([Giá trị đại diện của nhóm thứ hai là $45$.]),
      True([Nhóm chứa trung vị là nhóm $[60; 90)$.]),
      [Khoảng biến thiên của mẫu số liệu ghép nhóm là $90$.],
    ),
    loigiai: [
      - *Ý a)* Kích thước mẫu:
        $ N = 5 + 15 + 20 + 10 = 50 $
        Mệnh đề *SAI*.
      - *Ý b)* Giá trị đại diện của nhóm thứ hai $[30; 60)$ là:
        $ c_2 = (30+60)/2 = 45 $
        Mệnh đề *ĐÚNG*.
      - *Ý c)* Ta có $N/2 = 25$.
        Tần số tích lũy của hai nhóm đầu là $5 + 15 = 20 < 25$.
        Tần số tích lũy đến nhóm thứ ba là $20 + 20 = 40 > 25$.
        Vậy trung vị nằm ở nhóm $[60; 90)$. Mệnh đề *ĐÚNG*.
      - *Ý d)* Khoảng biến thiên:
        $ R = 120 - 0 = 120 $
        Mệnh đề *SAI*.
    ]
  )

  ds([Cho hàm số $y=(a x+b)/(c x+d)$ có đồ thị là đường cong $(C)$. Biết đồ thị nhận đường thẳng $x=2$ làm tiệm cận đứng, đường thẳng $y=-1$ làm tiệm cận ngang và đi qua điểm $M(1; -3)$.],
    (
      [Hàm số đồng biến trên từng khoảng xác định.],
      True([Tích $a c < 0$.]),
      True([Đồ thị cắt trục hoành tại điểm có hoành độ $x=4$.]),
      [Đạo hàm của hàm số luôn nhận giá trị dương.],
    ),
    loigiai: [
      Từ giả thiết bài toán:
      - Tiệm cận đứng $x = 2 => -d/c = 2 <=> d = -2c$.
      - Tiệm cận ngang $y = -1 => a/c = -1 <=> a = -c$.
      - Đồ thị đi qua $M(1; -3)$:
        $ (a.1+b)/(c.1+d) = -3 <=> (-c+b)/(c-2c) = -3 <=> (b-c)/(-c) = -3 <=> b - c = 3c <=> b = 4c $
      Hàm số có dạng:
        $ y = (-c x + 4c)/(c x - 2c) = (-x + 4)/(x - 2) $
      - *Ý a)* Đạo hàm $y' = ((-1).(-2) - 1.4)/(x-2)^2 = (-2)/(x-2)^2 < 0$. Hàm số nghịch biến trên từng khoảng xác định. Mệnh đề *SAI*.
      - *Ý b)* Xét tích $a c = (-c).c = -c^2 < 0$ (vì $c != 0$). Mệnh đề *ĐÚNG*.
      - *Ý c)* Giao điểm với trục hoành: Cho $y = 0 <=> -x + 4 = 0 <=> x = 4$. Mệnh đề *ĐÚNG*.
      - *Ý d)* Đạo hàm luôn nhận giá trị âm (như chứng minh ở ý a). Mệnh đề *SAI*.
    ]
  )


  exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6)

  tln([Một vật chuyển động có phương trình quãng đường là $s(t) = -t^3 + 6t^2 + 2t$ ($t$ tính bằng giây, $s$ tính bằng mét). Vận tốc lớn nhất của vật đạt được bằng bao nhiêu (m/s)?], [$14$], show-boxes: false, loigiai: [
    + Phương trình vận tốc của vật là đạo hàm của phương trình quãng đường:
      $ v(t) = s'(t) = -3t^2 + 12t + 2 $
    + Hàm số $v(t)$ là một parabol có bề lõm hướng xuống, đạt giá trị lớn nhất tại đỉnh:
      $ t = -b/(2a) = (-12)/(2 . (-3)) = 2 $
    + Vận tốc lớn nhất là:
      $ v_(max) = v(2) = -3(2)^2 + 12(2) + 2 = 14 "(m/s)" $
  ])

  tln([Cho hình lập phương $A B C D.A' B' C' D'$ có cạnh bằng $a=2$. Đặt một hệ trục tọa độ $O x y z$ với $O$ trùng $A$, các trục $O x, O y, O z$ lần lượt đi qua các tia $A B, A D, A A'$. Tính tọa độ cao độ ($z$) của điểm tâm mặt phẳng $A'B'C'D'$.], [$2$], show-boxes: false, loigiai: [
    + Hệ trục tọa độ $O x y z$ có tâm $O equiv A(0; 0; 0)$.
    + Trục $O z$ trùng với $A A'$.
    + Mặt phẳng $(A'B'C'D')$ song song với mặt phẳng $(O x y)$ và cách $(O x y)$ một khoảng bằng $A A' = 2$.
    + Do đó, mọi điểm thuộc mặt phẳng $(A'B'C'D')$ đều có cao độ $z = 2$. Tâm của hình vuông mặt trên cũng có cao độ $z = 2$.
  ])

  tln([Gọi $M$ và $m$ lần lượt là giá trị lớn nhất và nhỏ nhất của hàm số $y=x+4/x$ trên đoạn $[1; 3]$. Tính $M+m$.], [$9$], show-boxes: false, loigiai: [
    + Tập xác định: $D = RR \\ {0}$.
    + Đạo hàm:
      $ y' = 1 - 4/x^2 = (x^2 - 4)/x^2 $
    + Cho $y' = 0 <=> x^2 - 4 = 0 <=> hoac(x &= 2 quad &("nhận vì " x in [1;3]), x &= -2 quad &("loại")) $
    + Tính các giá trị:
      $ y(1) = 5, quad y(2) = 4, quad y(3) = 13/3 $
    + So sánh ta được: $M = 5$ và $m = 4$.
    + Vậy $M + m = 5 + 4 = 9$.
  ])

  tln([Tính giới hạn $lim_(x -> -oo) (sqrt(x^2+2x)+x)$.], [$-1$], show-boxes: false, loigiai: [
    + Đây là dạng vô định $oo - oo$. Ta tiến hành nhân lượng liên hợp:
      $ lim_(x -> -oo) (sqrt(x^2+2x)+x) &= lim_(x -> -oo) ((x^2+2x) - x^2)/(sqrt(x^2+2x) - x) \
        &= lim_(x -> -oo) (2x)/(|x|sqrt(1 + 2/x) - x) $
    + Vì $x -> -oo$ nên $|x| = -x$:
      $ L &= lim_(x -> -oo) (2x)/(-x sqrt(1 + 2/x) - x) \
        &= lim_(x -> -oo) (2)/(-sqrt(1 + 2/x) - 1) = 2/(-1 - 1) = -1 $
  ])

  tln([Một hộp chứa 5 viên bi đỏ và 4 viên bi xanh. Lấy ngẫu nhiên đồng thời 3 viên bi. Xác suất để lấy được ít nhất 1 viên bi xanh là $a/b$ (phân số tối giản). Tính $a+b$.], [$79$], show-boxes: false, loigiai: [
    + Số phần tử của không gian mẫu (chọn 3 bi từ 9 bi):
      $ n(Omega) = C_9^3 = 84 $
    + Gọi biến cố $A$: "Lấy được ít nhất 1 viên bi xanh".
      Biến cố đối $overline(A)$: "Lấy được 3 viên bi đỏ".
    + Số kết quả thuận lợi cho $overline(A)$ (chọn 3 bi đỏ từ 5 bi đỏ):
      $ n(overline(A)) = C_5^3 = 10 $
    + Xác suất của biến cố đối: $P(overline(A)) = 10/84 = 5/42$.
    + Xác suất của biến cố $A$:
      $ P(A) = 1 - P(overline(A)) = 1 - 5/42 = 37/42 $
    + Từ đó ta có $a = 37, b = 42 => a + b = 37 + 42 = 79$.
  ])

  tln([Tìm hệ số của $x^3$ trong khai triển $(2x+1)^5$.], [$80$], show-boxes: false, loigiai: [
    + Số hạng tổng quát trong khai triển của nhị thức Newton:
      $ T_(k+1) = C_5^k . (2x)^k . 1^(5-k) = C_5^k . 2^k . x^k quad (0 <= k <= 5) $
    + Số hạng chứa $x^3$ ứng với $k = 3$.
    + Hệ số cần tìm là:
      $ C_5^3 . 2^3 = 10 . 8 = 80 $
  ])


  exam-part([PHẦN IV. Câu tự luận], count: 4)

  tl([Cho hàm số $y=x^3-3x^2+2$. Hãy khảo sát sự biến thiên và vẽ đồ thị của hàm số trên.], lines: 8, loigiai: [
    *1. Tập xác định:* $D = RR$.
    
    *2. Sự biến thiên:*
    - *Đạo hàm:* 
      $ y' = 3x^2 - 6x \ y' = 0 <=> 3x(x - 2) = 0 <=> hoac(x &= 0, x &= 2) $
    - *Chiều biến thiên:* 
      Hàm số đồng biến trên các khoảng $(-oo; 0)$ và $(2; +oo)$.
      Hàm số nghịch biến trên khoảng $(0; 2)$.
    - *Cực trị:* 
      Cực đại tại $x = 0, y_("CĐ") = 2$.
      Cực tiểu tại $x = 2, y_("CT") = -2$.
    - *Giới hạn:* 
      $lim_(x->+oo) y = +oo$; $lim_(x->-oo) y = -oo$.
    
    *3. Đồ thị:* 
    Giao với trục tung tại điểm $(0; 2)$. Đồ thị nhận điểm uốn $I(1; 0)$ làm tâm đối xứng.
  ])

  tl([Trong không gian $O x y z$, cho hai điểm $A(1; 2; -1)$ và $B(3; 0; 1)$. Viết phương trình mặt phẳng trung trực của đoạn thẳng $A B$.], lines: 6, loigiai: [
    - Gọi $I$ là trung điểm của đoạn thẳng $A B$. Tọa độ điểm $I$ là:
      $ I ( (1+3)/2 ; (2+0)/2 ; (-1+1)/2 ) => I(2; 1; 0) $
    - Vectơ chỉ phương của đoạn $A B$:
      $ vec(A B) = (2; -2; 2) $
    - Mặt phẳng trung trực $(alpha)$ đi qua $I$ và nhận $vec(A B)$ làm vectơ pháp tuyến. Chọn vectơ pháp tuyến rút gọn là $vec(n) = 1/2 vec(A B) = (1; -1; 1)$.
    - Phương trình mặt phẳng $(alpha)$:
      $ 1(x - 2) - 1(y - 1) + 1(z - 0) = 0 \ <=> x - y + z - 1 = 0 $
  ])

  tl([Một công ty sản xuất một loại hộp giấy hình hộp chữ nhật không có nắp với thể tích là $500 c m^3$. Đáy hộp là hình vuông. Hãy tìm cạnh đáy của hộp để lượng giấy dùng làm hộp là ít nhất (bỏ qua mép dán).], lines: 7, loigiai: [
    - Gọi cạnh đáy của hộp là $x$ (cm, $x>0$), chiều cao hộp là $h$ (cm, $h>0$).
    - Thể tích khối hộp là:
      $ V = x^2 h = 500 => h = 500/x^2 $
    - Diện tích giấy cần dùng (tổng diện tích xung quanh và 1 đáy) là:
      $ S(x) = x^2 + 4 x h = x^2 + 4 x (500/x^2) = x^2 + 2000/x $
    - Khảo sát hàm số $S(x)$ với $x > 0$:
      $ S'(x) = 2x - 2000/x^2 = (2x^3 - 2000)/x^2 \
        S'(x) = 0 <=> x^3 = 1000 <=> x = 10 $
    - Lập bảng xét dấu đạo hàm, ta thấy hàm số $S(x)$ đạt giá trị nhỏ nhất tại $x=10$.
    - Vậy cạnh đáy cần tìm là $10 c m$.
  ])

  tl([Tại một phòng khám y tế, tỷ lệ người đến khám bị mắc bệnh $X$ là $10%$. Để chẩn đoán bệnh $X$, người xuất phương pháp xét nghiệm. Các nghiên cứu cho thấy: nếu một người thực sự mắc bệnh $X$, xét nghiệm sẽ cho kết quả dương tính với xác suất $95%$; nếu một người không mắc bệnh $X$, xét nghiệm vẫn có thể cho kết quả dương tính (dương tính giả) với xác suất $2%$.
    
  a) Chọn ngẫu nhiên một người đến khám bệnh. Tính xác suất để người này có kết quả xét nghiệm dương tính.
  b) Giả sử một người đến khám và có kết quả xét nghiệm dương tính. Tính xác suất để người này thực sự mắc bệnh $X$ (làm tròn kết quả đến chữ số thập phân thứ ba).], lines: 8, loigiai: [
    - Gọi $A$ là biến cố: "Người đến khám thực sự mắc bệnh $X$". Suy ra $P(A) = 10% = 0.1$.
      Biến cố đối $overline(A)$: "Người đến khám không mắc bệnh $X$". Ta có $P(overline(A)) = 1 - 0.1 = 0.9$.
    - Gọi $B$ là biến cố: "Người đến khám có kết quả xét nghiệm dương tính". Theo giả thiết:
      $ P(B|A) = 95% = 0.95 quad "và" quad P(B|overline(A)) = 2% = 0.02 $
    - *Câu a)* Áp dụng công thức xác suất toàn phần, xác suất để người này có kết quả xét nghiệm dương tính là:
      $ P(B) &= P(A) . P(B|A) + P(overline(A)) . P(B|overline(A)) \
             &= 0.1 . 0.95 + 0.9 . 0.02 \
             &= 0.095 + 0.018 = 0.113 $
    - *Câu b)* Áp dụng định lý Bayes, xác suất để người này thực sự mắc bệnh $X$ biết rằng kết quả xét nghiệm dương tính là:
      $ P(A|B) &= (P(A) . P(B|A)) / P(B) \
               &= 0.095 / 0.113 approx 0.841 $
    - *Kết luận:* Xác suất xét nghiệm dương tính là $0.113$. Xác suất người đó thực sự mắc bệnh khi có xét nghiệm dương tính là $0.841$.
  ])
}
