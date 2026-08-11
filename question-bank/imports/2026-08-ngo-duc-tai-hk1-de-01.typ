// Generated from conictypst.question-bank/v1; package API: sang-math:1.0.4
// Mỗi câu giữ nguyên bank ID để truy xuất và đối soát sau khi trộn đề.
#import "@preview/sang-math:1.0.4": *

#let preset = exam-preset(
  theme: "teal-pro",
  profile: "loigiai",
  two-columns: false,
  answer-key: false,
)
#let (tn, ds, tln, tl) = exam-mode(..preset.question, show-hyperlink: true)
#show: sang-setup.with(math-color: preset.accent)
#show: exam-theme.with(
  exam-title: "NGÂN HÀNG CÂU HỎI TOÁN THPT",
  subject: "TOÁN THPT",
  code: "BANK",
  ..preset.template,
)

#exam-part([PHẦN I. CÂU TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN], count: 12)

// bank-id: 2D1N1-1
#tn(
  [Cho hàm số $y = frac(x-3, x+1)$. Mệnh đề nào dưới đây đúng?],
  ([Hàm số đồng biến trên $RR backslash {-1}$.], [Hàm số nghịch biến trên $(-oo;-1)$.], [Hàm số đồng biến trên $(-oo;+oo)$.], True([Hàm số đồng biến trên $(-oo;-1)$.])),
  id: "2D1N1-1",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "don-dieu", "NB",),
  loigiai: [$y' = frac(4,(x+1)^2) > 0$ với mọi $x != -1$. Hàm số đồng biến trên từng khoảng $(-oo;-1)$ và $(-1;+oo)$, nên mệnh đề đúng là D.]
)

// bank-id: 2D1N4-1
#tn(
  [Tiệm cận đứng của đồ thị hàm số $y = frac(3x+1, x-2)$ là đường thẳng],
  ([$y=3$.], True([$x=2$.]), [$x=3$.], [$y=2$.]),
  id: "2D1N4-1",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "tiep-can", "NB",),
  loigiai: [Mẫu số bằng $0$ tại $x=2$ và tử số tại đó bằng $7 != 0$, nên tiệm cận đứng là $x=2$.]
)

// bank-id: 2H2N1-1
#tn(
  [Trong không gian, cho hình hộp $A B C D.A' B' C' D'$. Vectơ nào sau đây là vectơ đối của vectơ $vec(A A')$?],
  ([$vec(A' C')$.], [$vec(B A')$.], [$vec(B B')$.], True([$vec(C' C)$.])),
  id: "2H2N1-1",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "vec-to-khong-gian", "NB",),
  loigiai: [Trong hình hộp, $vec(A A') = vec(C C')$. Vectơ đối của $vec(A A')$ là $vec(C' C)$, chọn D.]
)

// bank-id: 2D1N1-2
#tn(
  [Cho hàm số $y=f(x)$ có bảng biến thiên: các mốc $x$ là $-oo,-2,1,4,+oo$; $y'$ có dấu $+$, $0$, $-$, gián đoạn tại $1$, $-$, $0$, $+$; các giá trị chính của $y$ là $-oo,1,-oo,+oo,3,+oo$. Hàm số $y=f(x)$ nghịch biến trên khoảng nào dưới đây?],
  ([$(-2;4)$.], [$(3;+oo)$.], [$(-oo;-2)$.], True([$(-2;1)$.])),
  id: "2D1N1-2",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "bbt", "don-dieu", "NB",),
  loigiai: [Từ bảng biến thiên, hàm số nghịch biến trên $(-2;1)$ và $(1;4)$. Khoảng phù hợp trong các lựa chọn là $(-2;1)$, chọn D.]
)

// bank-id: 2D1N4-2
#tn(
  [Đường tiệm cận xiên của đồ thị hàm số $y=f(x)=2x-1-frac(1,x+1)$ có phương trình là],
  ([$y=x+1$.], True([$y=2x-1$.]), [$y=x-1$.], [$y=2x+1$.]),
  id: "2D1N4-2",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "tiep-can-xien", "NB",),
  loigiai: [Vì $y=2x-1-frac(1,x+1)$ và $frac(1,x+1) -> 0$ khi $x -> plus.minus oo$, nên tiệm cận xiên là $y=2x-1$.]
)

// bank-id: 2D1N5-1
#tn(
  [Đường cong trong hình vẽ có tiệm cận đứng $x=-1$, tiệm cận ngang $y=-2$, đi qua các điểm mốc $(0;2)$ và $(1;0)$. Đó là đồ thị của hàm số nào?],
  ([$y=frac(2x-2,x+1)$.], [$y=frac(-x+2,x+2)$.], True([$y=frac(-2x+2,x+1)$.]), [$y=frac(x-2,x+1)$.]),
  id: "2D1N5-1",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "nhan-dang-do-thi", "NB",),
  loigiai: [Phương án C có tiệm cận đứng $x=-1$, tiệm cận ngang $y=-2$, đồng thời $f(0)=2$ và $f(1)=0$. Vì vậy chọn C.]
)

// bank-id: 2D1N3-1
#tn(
  [Giá trị nhỏ nhất của hàm số $y=frac(2x-1,x+1)$ trên đoạn $[1;2]$ là],
  ([$-1$.], True([$frac(1,2)$.]), [$1$.], [$-frac(1,2)$.]),
  id: "2D1N3-1",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "gtln-gtnn", "NB",),
  loigiai: [$y'=frac(3,(x+1)^2)>0$ trên $[1;2]$, nên hàm số đồng biến. Giá trị nhỏ nhất đạt tại $x=1$: $y(1)=frac(1,2)$.]
)

// bank-id: 2D1N2-1
#tn(
  [Giá trị cực tiểu của hàm số $y=-x^4+8x^2+2025$ là],
  ([$y=2041$.], [$y=0$.], [$y=-2025$.], True([$y=2025$.])),
  id: "2D1N2-1",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "cuc-tri", "NB",),
  loigiai: [$y'=-4x(x^2-4)$, nên các điểm tới hạn là $x=-2,0,2$. Ta có $f(0)=2025$ và $f(plus.minus 2)=2041$; do đó giá trị cực tiểu là $2025$.]
)

// bank-id: 2D1H3-1
#tn(
  [Cho hàm số $y=f(x)$ có đồ thị trên đoạn $[-3;3]$. Đồ thị đi qua các mốc $(-3;-2)$, đạt cực đại tại $(-1;4)$, đạt cực tiểu tại $(1;-1)$ và đi qua $(3;4)$. Giá trị lớn nhất $M$ và giá trị nhỏ nhất $m$ của hàm số lần lượt là],
  ([$M=3; m=-1$.], True([$M=4; m=-2$.]), [$M=3; m=-3$.], [$M=-1; m=1$.]),
  id: "2D1H3-1",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "gtln-gtnn", "do-thi", "TH",),
  loigiai: [Đọc các tung độ tại các điểm mốc của đồ thị: giá trị lớn nhất là $4$, còn giá trị nhỏ nhất là $-2$. Vậy $(M;m)=(4;-2)$, chọn B.]
)

// bank-id: 2H2N1-3
#tn(
  [Cho $abs(vec(a))=2$, $abs(vec(b))=6$, góc giữa hai vectơ $vec(a)$ và $vec(b)$ bằng $120 degree$. Khẳng định nào dưới đây đúng?],
  ([$vec(a) dot vec(b)=12$.], [$vec(a) dot vec(b)=40$.], True([$vec(a) dot vec(b)=-6$.]), [$vec(a) dot vec(b)=6sqrt(3)$.]),
  id: "2H2N1-3",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "tich-vo-huong", "NB",),
  loigiai: [$vec(a) dot vec(b)=abs(vec(a)) abs(vec(b)) cos(120 degree)=2 dot 6 dot (-frac(1,2))=-6$. Chọn C.]
)

// bank-id: 2D1H2-2
#tn(
  [Cho hàm số $y=f(x)$ có bảng biến thiên: $f'(x)$ mang dấu $+$ trên $(-oo;0)$, bằng $0$ tại $0$, mang dấu $-$ trên $(0;2)$, bằng $0$ tại $2$ và mang dấu $+$ trên $(2;+oo)$; $f(0)=4$, $f(2)=0$. Điểm cực tiểu của hàm số đã cho là],
  ([$0$.], [$6$.], True([$2$.]), [$4$.]),
  id: "2D1H2-2",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "cuc-tri", "bbt", "TH",),
  loigiai: [Dấu của $f'$ đổi từ âm sang dương tại $x=2$, nên hàm số đạt cực tiểu tại $x=2$. Chọn C.]
)

// bank-id: 2H2N1-2
#tn(
  [Cho hình hộp $A B C D.A' B' C' D'$. Khẳng định nào sau đây là đúng?],
  ([$vec(A C')=vec(A B)+vec(C B)+vec(A A')$.], [$vec(A C')=vec(A B)+vec(A C)+vec(A A')$.], [$vec(A C')=vec(B' D)+vec(A C)+vec(A A')$.], True([$vec(A C')=vec(A B)+vec(A D)+vec(A A')$.])),
  id: "2H2N1-2",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "vec-to-khong-gian", "NB",),
  loigiai: [Theo quy tắc hình hộp, $vec(A C')=vec(A B)+vec(A D)+vec(A A')$. Chọn D.]
)

#exam-part([PHẦN II. CÂU TRẮC NGHIỆM ĐÚNG - SAI], count: 4)

// bank-id: 2D1H1-1
#ds(
  [Cho hàm số $y=x^3-3x+2$. Xét tính đúng sai của các phát biểu sau.],
  ([Tập xác định của hàm số đã cho là $(0;+oo)$.], True([Đồ thị của hàm số đã cho đi qua điểm $(0;2)$.]), [Hàm số đạt cực trị tại $x=0$.], True([Giá trị lớn nhất của hàm số đã cho trên đoạn $[0;2]$ bằng $4$.])),
  id: "2D1H1-1",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "ham-so", "dao-ham", "TH",),
  loigiai: [a) Sai vì đa thức có tập xác định $RR$. b) Đúng vì $f(0)=2$. c) Sai vì $f'(x)=3x^2-3$, các điểm tới hạn là $x=plus.minus 1$, không phải $0$. d) Đúng: $f(0)=2$, $f(1)=0$, $f(2)=4$, nên GTLN trên $[0;2]$ là $4$.]
)

// bank-id: 2D1H4-1
#ds(
  [Cho hàm số $y=frac(x^2+x+1,x+1)$. Bảng biến thiên có các mốc $x=-oo,-2,-1,0,+oo$; $f'(x)$ có dấu $+$, $0$, $-$, gián đoạn tại $-1$, $-$, $0$, $+$; $f(-2)=-3$, $f(0)=1$. Xét tính đúng sai của các phát biểu sau.],
  ([Hàm số $y=f(x)$ đồng biến trên $RR$.], [$y'=frac(x^2-2x,(x+1)^2)$ với mọi $x!=-1$.], True([Hàm số có bảng biến thiên như dữ kiện đã cho.]), True([Khoảng cách giữa hai điểm cực trị của đồ thị hàm số bằng $2sqrt(5)$.])),
  id: "2D1H4-1",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "ham-phan-thuc", "bbt", "TH",),
  loigiai: [Ta có $f(x)=x+frac(1,x+1)$ và $f'(x)=frac(x(x+2),(x+1)^2)$. Vì vậy a) Sai, hàm số không đồng biến trên toàn miền xác định. b) Sai, tử số đúng là $x^2+2x$. c) Đúng theo dấu của $f'$, với cực đại $(-2;-3)$ và cực tiểu $(0;1)$. d) Đúng vì khoảng cách là $sqrt((0+2)^2+(1+3)^2)=2sqrt(5)$.]
)

// bank-id: 2H2H1-2
#ds(
  [Cho hình lập phương $A B C D.A' B' C' D'$ có cạnh bằng $a$. Xét tính đúng sai của các khẳng định về các vectơ trong hình.],
  (True([$vec(B' B)-vec(D B)=vec(B' D)$.]), [$vec(B A)+vec(B C)+vec(B B')=vec(B D)$.], [$abs(vec(B A)+vec(B C)+vec(B B'))=a sqrt(2)$.], True([$abs(vec(B C)-vec(B A)+vec(C' A))=a$.])),
  id: "2H2H1-2",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "hinh-hop", "vec-to", "TH",),
  loigiai: [Đặt $A(0,0,0)$, $B(a,0,0)$, $C(a,a,0)$, $D(0,a,0)$ và các điểm có dấu phẩy cao hơn $a$ đơn vị theo trục $z$. Khi đó a) đúng vì hai vế cùng bằng $(-a,a,-a)$. b) Sai vì vế trái có thành phần đứng. c) Sai vì độ dài vế trái là $a sqrt(3)$, không phải $a sqrt(2)$. d) Đúng vì vectơ trong giá trị tuyệt đối có độ dài $a$.]
)

// bank-id: 2D1H2-7
#ds(
  [Nhà máy A bán sản phẩm cho nhà máy B. Nếu đặt hàng $x$ tấn thì giá bán mỗi tấn là $P(x)=45-0.001x^2$ triệu đồng và chi phí sản xuất là $C(x)=100+30x$ triệu đồng, với $0<=x<=100$. Xét tính đúng sai của các phát biểu sau.],
  ([Số tiền nhà máy A thu được khi bán $10$ tấn là $600$ triệu đồng.], True([Chi phí sản xuất $10$ tấn trong một tháng là $400$ triệu đồng.]), True([Lợi nhuận là $H(x)=-0.001x^3+15x-100$ triệu đồng.]), True([Lợi nhuận lớn nhất đạt được khi bán khoảng $70.7$ tấn mỗi tháng.])),
  id: "2D1H2-7",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "loi-nhuan", "thuc-te", "TH",),
  loigiai: [Doanh thu là $R(x)=x P(x)=45x-0.001x^3$. a) $R(10)=449$, nên sai. b) $C(10)=100+30 dot 10=400$, đúng. c) $H(x)=R(x)-C(x)=-0.001x^3+15x-100$, đúng. d) $H'(x)=-0.003x^2+15=0$ cho $x=sqrt(5000) approx 70.7$; đây là điểm đạt cực đại trên $[0;100]$, đúng.]
)

#exam-part([PHẦN III. CÂU TRẢ LỜI NGẮN], count: 6)

// bank-id: 2D1V4-1
#tln(
  [Cho hàm số $y=frac(x^2+2x-3,x-2)$. Đường tiệm cận xiên có dạng $y=a x+b$. Tính $P=frac(a,b)$.],
  [0,25],
  id: "2D1V4-1",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "tiep-can-xien", "VD",),
  loigiai: [Chia đa thức: $frac(x^2+2x-3,x-2)=x+4+frac(5,x-2)$. Suy ra tiệm cận xiên là $y=x+4$, nên $a=1$, $b=4$ và $P=frac(1,4)=0.25$.]
)

// bank-id: 2D1V5-1
#tln(
  [Đường cong trong hình là đồ thị của hàm số $y=frac(a x+2,c x+b)$, với $a,b,c$ là các số thực. Hình cho thấy tiệm cận đứng $x=2$, tiệm cận ngang $y=1$ và giao điểm với trục hoành là $x=-2$. Tính $a+b+c$.],
  [0],
  id: "2D1V5-1",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "nhan-dang-do-thi", "ham-phan-thuc", "VD",),
  loigiai: [Tiệm cận ngang cho $frac(a,c)=1$, nên $a=c$. Tiệm cận đứng cho $-frac(b,c)=2$, nên $b=-2c$. Giao điểm với trục hoành thỏa $a x+2=0$ tại $x=-2$, suy ra $a=1$. Do đó $c=1$, $b=-2$ và $a+b+c=0$.]
)

// bank-id: 2H2V1-3
#tln(
  [Cho hình chóp tứ giác đều $S.A B C D$ có độ dài cạnh bên và cạnh đáy đều bằng $10$. Tính $vec(A B) dot vec(S C)$.],
  [50],
  id: "2H2V1-3",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "hinh-chop", "tich-vo-huong", "VD",),
  loigiai: [Đặt tâm đáy là $O$, chọn $A(-5,-5,0)$, $B(5,-5,0)$, $C(5,5,0)$ và $S(0,0,h)$. Khi đó $vec(A B)=(10,0,0)$, $vec(S C)=(5,5,-h)$, nên $vec(A B) dot vec(S C)=10 dot 5=50$.]
)

// bank-id: 2D1V2-7
#tln(
  [Một doanh nghiệp mua xe X với giá $30$ triệu đồng/chiếc và đang bán với giá $35$ triệu đồng/chiếc, bán được $400$ chiếc/năm. Nếu giảm $1$ triệu đồng mỗi chiếc thì số lượng bán được tăng thêm $100$ chiếc/năm. Giá bán mới bao nhiêu thì lợi nhuận cao nhất?],
  [34,5],
  id: "2D1V2-7",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "loi-nhuan", "thuc-te", "VD",),
  loigiai: [Gọi $t$ là số triệu đồng giảm giá. Khi đó giá bán là $35-t$, số xe bán được là $400+100t$. Lợi nhuận là $L(t)=(35-t-30)(400+100t)=2000+100t-100t^2$. Parabol đạt cực đại tại $t=frac(100,200)=0.5$, nên giá bán mới là $35-0.5=34.5$ triệu đồng.]
)

// bank-id: 2D1V3-6
#tln(
  [Một người chèo thuyền từ $A$ qua con sông rộng $3$ km đến điểm $B$ ở bờ đối diện, cách điểm đối diện $C$ về phía hạ lưu $8$ km. Người đó có thể cập bờ tại $D$ giữa $C$ và $B$ rồi chạy bộ đến $B$. Tốc độ chèo là $6$ km/h, tốc độ chạy là $8$ km/h. Tìm thời gian ngắn nhất, tính theo phút và làm tròn đến hàng đơn vị.],
  [80],
  id: "2D1V3-6",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "toi-uu", "thuc-te", "VD",),
  loigiai: [Gọi $x=C D$, $0<=x<=8$. Thời gian là $T(x)=frac(sqrt(x^2+9),6)+frac(8-x,8)$. Điều kiện cực tiểu: $T'(x)=frac(x,6sqrt(x^2+9))-frac(1,8)=0$, suy ra $x=frac(9,sqrt(7))$. Khi đó $T_min=1+frac(sqrt(7),8)$ giờ, tương đương khoảng $79.84$ phút, làm tròn được $80$ phút.]
)

// bank-id: 2H2V1-4
#tln(
  [Ba lực $vec(F_1), vec(F_2), vec(F_3)$ cùng tác động vào một vật, có phương đôi một vuông góc và độ lớn lần lượt là $2$ N, $3$ N, $4$ N. Hợp lực của ba lực có độ lớn bao nhiêu Niu-tơn? Kết quả làm tròn đến một chữ số thập phân.],
  [5,4],
  id: "2H2V1-4",
  tags: ("lop12", "hk1", "ngo-duc-tai", "de-01", "luc", "vec-to", "VD",),
  loigiai: [Do ba lực đôi một vuông góc, độ lớn hợp lực là $F=sqrt(2^2+3^2+4^2)=sqrt(29) approx 5.385$. Làm tròn đến một chữ số thập phân được $5.4$ N, ghi theo dấu phẩy là $5,4$.]
)
