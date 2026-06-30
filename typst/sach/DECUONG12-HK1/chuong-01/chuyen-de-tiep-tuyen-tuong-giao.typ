#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Chuyên Đề: Tiếp Tuyến, Tương Giao Và Các Điểm Đặc Biệt])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án (10 câu)], count: 10)

// ── Câu 1 ──
#tn(
  dir: "ngang",
  [Số giao điểm của đồ thị hàm số $y = x^3 - 3x + 2$ và trục hoành là],
  (
    [$0$.],
    [$1$.],
    True([$2$.]),
    [$3$.],
  ),
  loigiai: [
    #step[Phương trình hoành độ giao điểm: $x^3 - 3x + 2 = 0$.]
    #step[Phân tích nhân tử: $(x - 1)^2(x + 2) = 0$.]
    #step[Hai nghiệm phân biệt: $x = 1$ (nghiệm kép) và $x = -2$.]
    #step[Vậy đồ thị có $2$ giao điểm với trục hoành.]
  ]
)

// ── Câu 2 ──
#tn(
  dir: "ngang",
  [Phương trình tiếp tuyến của đồ thị hàm số $y = (x + 1)/(x - 1)$ tại điểm có hoành độ $x = 2$ là],
  (
    [$y = -2x + 1$.],
    True([$y = -2x + 7$.]),
    [$y = 2x - 1$.],
    [$y = -2x + 3$.],
  ),
  loigiai: [
    #step[Với $x = 2$: $y(2) = 3/1 = 3$. Điểm tiếp tuyến là $A(2; 3)$.]
    #step[Đạo hàm $y' = -2/(x - 1)^2 => k = y'(2) = -2$.]
    #step[Phương trình tiếp tuyến: $y = -2(x - 2) + 3 = -2x + 7$.]
  ]
)

// ── Câu 3 ──
#tn(
  dir: "ngang",
  [Cho hàm số $y = -x^4 + 2x^2 + 3$. Có bao nhiêu tiếp tuyến của đồ thị song song với trục hoành?],
  (
    [$0$.],
    [$1$.],
    [$2$.],
    True([$3$.]),
  ),
  loigiai: [
    #step[Tiếp tuyến song song trục hoành khi hệ số góc $k = 0$.]
    #step[$y' = -4x^3 + 4x = 0 <=> -4x(x^2 - 1) = 0 <=> x = 0, plus.minus 1$.]
    #step[Có $3$ nghiệm nên có $3$ tiếp tuyến song song trục hoành.]
  ]
)

// ── Câu 4 ──
#tn(
  dir: "ngang",
  [Đường thẳng $d: y = 2x + m$ cắt đồ thị $(C): y = (2x - 1)/(x - 1)$ tại hai điểm phân biệt khi và chỉ khi],
  (
    [$m > 0$.],
    [$m < 0$.],
    True([Với mọi $m$.]),
    [Không tồn tại $m$.],
  ),
  loigiai: [
    #step[Phương trình hoành độ giao điểm ($x != 1$): $(2x-1)/(x-1) = 2x+m$.]
    #step[Thu gọn: $2x^2 + (m-4)x - m + 1 = 0$ $(star)$.]
    #step[$Delta = (m-4)^2 - 8(-m+1) = m^2 + 8 > 0$ với mọi $m$.]
    #step[Thay $x = 1$ vào $(star)$: $2 + m - 4 - m + 1 = -1 != 0$ với mọi $m$.]
    #step[Kết luận: $d$ luôn cắt $(C)$ tại 2 điểm phân biệt với mọi $m$.]
  ]
)

// ── Câu 5 ──
#tn(
  dir: "ngang",
  [Hệ số góc của tiếp tuyến tại điểm uốn của đồ thị hàm số $y = x^3 - 3x^2 + 1$ bằng],
  (
    True([$-3$.]),
    [$0$.],
    [$3$.],
    [$-1$.],
  ),
  loigiai: [
    #step[$y' = 3x^2 - 6x$, $y'' = 6x - 6$.]
    #step[Điểm uốn: $y'' = 0 <=> x = 1$.]
    #step[Hệ số góc tiếp tuyến tại điểm uốn: $k = y'(1) = 3 - 6 = -3$.]
  ]
)

// ── Câu 6 ──
#tn(
  dir: "ngang",
  [Giao điểm hai đường tiệm cận của đồ thị hàm số $y = (2x + 1)/(x - 1)$ là điểm $I(a; b)$. Tổng $a + b$ bằng],
  (
    [$1$.],
    [$3$.],
    True([$4$.]),
    [$5$.],
  ),
  loigiai: [
    #step[Tiệm cận đứng: $x = 1$; tiệm cận ngang: $y = 2$.]
    #step[Giao điểm hai tiệm cận: $I(1; 2)$. Vậy $a = 1, b = 2 => a + b = 3$.]
  ]
)

// ── Câu 7 ──
#tn(
  dir: "ngang",
  [Biết đường thẳng $y = -x + 2$ cắt đồ thị $y = x^3 - 2x^2 + 2$ tại điểm $A$ và tiếp xúc tại điểm $B(x_0; y_0)$. Giá trị $x_0$ bằng],
  (
    [$0$.],
    True([$1$.]),
    [$2$.],
    [$-1$.],
  ),
  loigiai: [
    #step[Phương trình hoành độ: $x^3 - 2x^2 + 2 = -x + 2 <=> x^3 - 2x^2 + x = 0 <=> x(x-1)^2 = 0$.]
    #step[Nghiệm đơn $x = 0$ (điểm cắt); nghiệm kép $x = 1$ (điểm tiếp xúc $B$).]
    #step[Vậy $x_0 = 1$.]
  ]
)

// ── Câu 8 ──
#tn(
  dir: "ngang",
  [Số điểm có tọa độ nguyên thuộc đồ thị hàm số $y = (3x + 2)/(x - 1)$ là],
  (
    [$2$.],
    True([$4$.]),
    [$6$.],
    [$8$.],
  ),
  loigiai: [
    #step[Chia: $y = 3 + 5/(x - 1)$. Để $x, y in ZZ$ cần $x - 1$ là ước của $5$.]
    #step[$x - 1 in {-5, -1, 1, 5} => x in {-4, 0, 2, 6}$.]
    #step[Vậy có $4$ điểm có tọa độ nguyên.]
  ]
)

// ── Câu 9 ──
#tn(
  dir: "ngang",
  [Đồ thị hàm số $y = x^3 - (2m+1)x^2 + (3m+2)x - m$ luôn đi qua hai điểm cố định với mọi $m$. Tổng hoành độ hai điểm đó là],
  (
    [$1$.],
    True([$3/2$.]),
    [$2$.],
    [$5/2$.],
  ),
  loigiai: [
    #step[Nhóm theo $m$: $y = (x^3 - x^2 + 2x) + m(-2x^2 + 3x - 1)$.]
    #step[Điểm cố định khi $-2x^2 + 3x - 1 = 0 <=> x = 1$ hoặc $x = 1/2$.]
    #step[Tổng hoành độ: $1 + 1/2 = 3/2$.]
  ]
)

// ── Câu 10 ──
#tn(
  dir: "ngang",
  [Hệ số góc nhỏ nhất của các tiếp tuyến của đồ thị $y = 1/3 x^3 - 2x^2 + 3x + 1$ bằng],
  (
    True([$-1$.]),
    [$0$.],
    [$1$.],
    [$-2$.],
  ),
  loigiai: [
    #step[$k = y' = x^2 - 4x + 3 = (x-2)^2 - 1 >= -1$.]
    #step[Giá trị nhỏ nhất $k = -1$ đạt khi $x = 2$.]
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng/sai (4 câu)], count: 4)

// ── Câu 11 ──
#ds(
  dir: "doc",
  [Cho hàm số $y = x^3 - 3x^2 + 2$ có đồ thị $(C)$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Đồ thị $(C)$ cắt trục hoành tại 3 điểm phân biệt.]),
    [Tiếp tuyến của $(C)$ tại điểm có hoành độ $x = 1$ có hệ số góc bằng $0$.],
    True([Có đúng 2 tiếp tuyến của $(C)$ đi qua điểm $A(0; 2)$.]),
    True([Điểm uốn của đồ thị $(C)$ là tâm đối xứng của đồ thị.]),
  ),
  loigiai: [
    #step[a) $x^3 - 3x^2 + 2 = 0 <=> (x-1)(x^2-2x-2) = 0$. Có 3 nghiệm phân biệt: $x=1$ và $x = 1 plus.minus sqrt(3)$. (Đúng)]
    #step[b) $y' = 3x^2 - 6x => y'(1) = -3 != 0$. (Sai)]
    #step[c) Tiếp tuyến tại $M(t; t^3-3t^2+2)$ đi qua $A(0;2)$: $(3t^2-6t)(0-t) = 2 - (t^3-3t^2+2) <=> 2t^3-3t^2 = 0 <=> t=0$ hoặc $t=3/2$. Có 2 tiếp tuyến. (Đúng)]
    #step[d) Hàm bậc 3 luôn nhận điểm uốn làm tâm đối xứng. (Đúng)]
  ]
)

// ── Câu 12 ──
#ds(
  dir: "doc",
  [Cho hàm số $y = (2x-1)/(x+1)$ có đồ thị $(C)$ và đường thẳng $d: y = -x + m$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    [Khi $m = 0$, đường thẳng $d$ không cắt đồ thị $(C)$.],
    True([Đường thẳng $d$ luôn cắt đồ thị $(C)$ tại hai điểm phân biệt với mọi $m$.]),
    True([Hoành độ trung điểm của đoạn $A B$ là $x_I = (m-3)/2$.]),
    True([Có duy nhất một giá trị $m$ để đoạn $A B$ có độ dài nhỏ nhất.]),
  ),
  loigiai: [
    #step[Phương trình hoành độ giao điểm ($x != -1$): $x^2 + (3-m)x - m - 1 = 0$ $(star)$.]
    #step[a) Khi $m=0$: $Delta = 9 + 4 = 13 > 0$, có 2 giao điểm. (Sai)]
    #step[b) $Delta = (3-m)^2 + 4(m+1) = m^2 - 2m + 13 = (m-1)^2 + 12 > 0$ với mọi $m$. Thay $x=-1$ vào $(star)$: $1-(3-m)-m-1=-3 != 0$. Luôn có 2 giao điểm. (Đúng)]
    #step[c) Vi-et: $x_1+x_2 = m-3 => x_I = (m-3)/2$. (Đúng)]
    #step[d) $|A B|^2 = 2(x_1-x_2)^2 = 2[(m-3)^2+4(m+1)] = 2(m^2-2m+13) = 2[(m-1)^2+12]$. Min tại $m=1$ (duy nhất). (Đúng)]
  ]
)

// ── Câu 13 ──
#ds(
  dir: "doc",
  [Cho hàm số $y = 1/3 x^3 - m x^2 + (m+2)x - 1$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Khi $m = 2$, hàm số đồng biến trên $RR$.]),
    [Khi $m = 2$, tiếp tuyến tại điểm có hoành độ $x = 2$ song song với trục tung.],
    True([Với mọi $m$, đồ thị hàm số luôn đi qua điểm $(0; -1)$.]),
    True([Tồn tại giá trị của $m$ để đồ thị có hai tiếp tuyến cùng hệ số góc $-1$.]),
  ),
  loigiai: [
    #step[$y' = x^2 - 2m x + m + 2$.]
    #step[a) $m=2$: $y' = (x-2)^2 >= 0, forall x$. Hàm đồng biến trên $RR$. (Đúng)]
    #step[b) $m=2$, $y'(2) = 0$. Tiếp tuyến song song trục hoành (không phải trục tung). (Sai)]
    #step[c) Thay $x=0$: $y = -1$ không phụ thuộc $m$. (Đúng)]
    #step[d) Phương trình $y'=-1 <=> x^2 - 2m x + m+3 = 0$ có $Delta' = m^2-m-3$. Với $m=3$: $Delta'=3>0$. Tồn tại $m$. (Đúng)]
  ]
)

// ── Câu 14 ──
#ds(
  dir: "doc",
  [Cho hàm số $y = x^4 - 2x^2 - 3$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Đồ thị cắt trục hoành tại $2$ điểm phân biệt.]),
    [Ba điểm cực trị của đồ thị tạo thành một tam giác đều.],
    [Tiếp tuyến tại điểm $A(1; -4)$ đi qua gốc tọa độ $O$.],
    True([Qua điểm $B(0; -3)$ kẻ được đúng $3$ tiếp tuyến đến đồ thị.]),
  ),
  loigiai: [
    #step[a) Đặt $t = x^2 >= 0$: $t^2-2t-3=0 <=> t=3$ (nhận) hoặc $t=-1$ (loại). Suy ra $x = plus.minus sqrt(3)$. Có 2 giao điểm. (Đúng)]
    #step[b) Điểm cực trị: $M(0;-3)$, $N(1;-4)$, $P(-1;-4)$. $M N = sqrt(2)$, $N P = 2$. Tam giác vuông cân (không phải đều). (Sai)]
    #step[c) $y'(1) = 4-4 = 0$. Tiếp tuyến tại $A(1;-4)$ là $y=-4$, không qua $O(0;0)$. (Sai)]
    #step[d) Điều kiện tiếp xúc từ $B(0;-3)$: $3x^4 - 2x^2 = 0 <=> x^2(3x^2-2) = 0$. Ba nghiệm: $x=0, x = plus.minus sqrt(2/3)$. Có 3 tiếp tuyến. (Đúng)]
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

// ── Câu 15 ──
#tln(
  dir: "ngang",
  [Gọi $S$ là tập các giá trị của $m$ để đường thẳng $y = x + m$ cắt đồ thị $y = (2x+1)/(x-1)$ tại hai điểm phân biệt $A$, $B$ sao cho tam giác $O A B$ vuông tại $O$. Tính tổng các phần tử của $S$.],
  [$2$],
  loigiai: [
    #step[Phương trình hoành độ ($x != 1$): $x^2 + (m-3)x - m - 1 = 0$ $(star)$.]
    #step[Vi-et: $x_1+x_2 = 3-m$ và $x_1 x_2 = -m-1$.]
    #step[Điều kiện $overline(O A) dot overline(O B) = 0$: $x_1 x_2 + y_1 y_2 = 0$.]
    #step[$y_1 y_2 = (x_1+m)(x_2+m) = x_1 x_2 + m(x_1+x_2) + m^2$.]
    #step[Thay vào: $2(-m-1) + m(3-m) + m^2 = 0 <=> m = 2$.]
    #step[Kiểm tra: $m=2$ cho $Delta = 1+12 = 13 > 0$. Thỏa mãn. Tổng các phần tử của $S$ là $2$.]
  ]
)

// ── Câu 16 ──
#tln(
  dir: "ngang",
  [Tìm số tiếp tuyến của đồ thị hàm số $y = x^3 - 3x + 2$ tạo với hai trục tọa độ một tam giác vuông cân.],
  [$4$],
  loigiai: [
    #step[Tiếp tuyến tạo tam giác vuông cân với hai trục tọa độ khi $k = 1$ hoặc $k = -1$ (và không đi qua gốc tọa độ).]
    #step[$y' = 3x^2 - 3$. Giải $3x^2-3=1 <=> x^2=4/3$ (2 nghiệm). Giải $3x^2-3=-1 <=> x^2=2/3$ (2 nghiệm).]
    #step[Mỗi nghiệm cho 1 tiếp điểm, tất cả đều có $x != 0$ nên tiếp tuyến không qua gốc. Có $4$ tiếp tuyến.]
  ]
)

// ── Câu 17 ──
#tln(
  dir: "ngang",
  [Cho hàm số $y = (x+2)/(x-1)$ có đồ thị $(C)$ và $I$ là giao điểm hai đường tiệm cận. Có bao nhiêu điểm $M$ thuộc $(C)$ sao cho tiếp tuyến tại $M$ cắt hai tiệm cận tại $A$, $B$ với $I A = I B$?],
  [$2$],
  loigiai: [
    #step[$I(1;1)$. Gọi tiếp điểm $M(t; 1 + 3/(t-1))$ với $t != 1$.]
    #step[$y' = -3/(x-1)^2$. Giao tiếp tuyến với $x=1$: $I A = |6/(t-1)|$. Giao với $y=1$: $I B = 2|t-1|$.]
    #step[$I A = I B <=> (t-1)^2 = 3 <=> t = 1 plus.minus sqrt(3)$. Có $2$ điểm $M$.]
  ]
)

// ── Câu 18 ──
#tln(
  dir: "ngang",
  [Tìm giá trị $m$ để đường thẳng $y = m$ cắt đồ thị $(C): y = x^4 - 4x^2 + 3$ tại $4$ điểm theo thứ tự từ trái qua phải tạo thành cấp số cộng. Biểu diễn $m = p/q$ (phân số tối giản). Tính $p + q$.],
  [$64$],
  loigiai: [
    #step[Đặt $t = x^2 > 0$: $t^2 - 4t + 3 - m = 0$ có 2 nghiệm dương $0 < t_1 < t_2$.]
    #step[Bốn nghiệm (từ trái qua phải): $-sqrt(t_2), -sqrt(t_1), sqrt(t_1), sqrt(t_2)$.]
    #step[Để lập CSC: $sqrt(t_2) = 3 sqrt(t_1) <=> t_2 = 9 t_1$.]
    #step[Vi-et: $t_1 + t_2 = 4 <=> 10 t_1 = 4 <=> t_1 = 2/5$, $t_2 = 18/5$.]
    #step[$t_1 dot t_2 = 3 - m <=> 36/25 = 3 - m <=> m = 39/25$.]
    #step[$p = 39, q = 25 => p + q = 64$.]
  ]
)

// ── Câu 19 ──
#tln(
  dir: "ngang",
  [Có bao nhiêu tiếp tuyến của đồ thị hàm số $y = x/(x+1)$ đi qua giao điểm $I$ của hai đường tiệm cận?],
  [$0$],
  loigiai: [
    #step[Tiệm cận đứng $x=-1$, tiệm cận ngang $y=1$. Giao điểm $I(-1;1)$.]
    #step[$y' = 1/(x+1)^2$. Tiếp tuyến tại $M(t; t/(t+1))$ đi qua $I(-1;1)$:]
    #step[$1 = 1/(t+1)^2 (-1-t) + t/(t+1) = -1/(t+1) + t/(t+1) = (t-1)/(t+1)$.]
    #step[$t+1 = t-1$ (vô lý). Vậy không có tiếp tuyến nào đi qua $I$. Đáp số là $0$.]
  ]
)

// ── Câu 20 ──
#tln(
  dir: "ngang",
  [Cho đường cong $(C): y = x^3 - 3x^2$. Gọi $d$ là đường thẳng qua $A(-1; -4)$ có hệ số góc $k$. Số giá trị nguyên của $k$ thuộc đoạn $[-10; 10]$ để $d$ cắt $(C)$ tại ba điểm phân biệt là bao nhiêu?],
  [$9$],
  loigiai: [
    #step[Phương trình hoành độ: $x^3 - 3x^2 = k(x+1) - 4 <=> x^3 - 3x^2 - k x - k + 4 = 0$.]
    #step[Thay $x=-1$: $-1-3+k-k+4 = 0$. Vậy $x = -1$ luôn là nghiệm. Phân tích: $(x+1)(x^2-4x-k+4) = 0$.]
    #step[Để có 3 điểm phân biệt: $g(x) = x^2-4x-k+4 = 0$ có 2 nghiệm phân biệt khác $-1$.]
    #step[ĐK 1: $Delta' = k > 0$. ĐK 2: $g(-1) = 1+4-k+4 = 9-k != 0 <=> k != 9$.]
    #step[Các giá trị nguyên thỏa mãn ($k > 0, k != 9$) trong $[-10;10]$: ${1,2,3,4,5,6,7,8,10}$. Có $9$ giá trị.]
  ]
)
