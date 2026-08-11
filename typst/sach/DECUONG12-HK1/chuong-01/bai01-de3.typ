#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display


#muc([Đề Luyện Tập Số 03])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#tn(
  dir: "ngang",lines: 4,
  [Hàm số $y = e^x - x$ đồng biến trên khoảng nào dưới đây?],
  (
    [$(-oo; 0)$],
    True([$(0; +oo)$]),
    [$(-oo; +oo)$],
    [$(1; +oo)$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = e^x - 1$.]
    #step[Hàm số đồng biến khi $y' > 0 <=> e^x - 1 > 0 <=> e^x > 1 <=> x > 0$.]
    #step[Vậy hàm số đồng biến trên khoảng $(0; +oo)$.]
    #step[Đối chiếu các phương án, ta chọn B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Hàm số $y = x^2 - 8 ln x$ nghịch biến trên khoảng nào dưới đây?],
  (
    True([$(0; 2)$]),
    [$(2; +oo)$],
    [$(0; 4)$],
    [$(-oo; 2)$]
  ),
  loigiai: [
    #step[Tập xác định: $D = (0; +oo)$.]
    #step[Đạo hàm: $y' = 2x - 8/x = (2x^2 - 8)/x$.]
    #step[Hàm số nghịch biến khi $y' < 0 <=> (2x^2 - 8)/x < 0$.]
    #step[Do $x > 0$ nên ta chỉ cần tử số âm: $2x^2 - 8 < 0 <=> x^2 < 4 <=> -2 < x < 2$.]
    #step[Kết hợp với tập xác định, ta được khoảng nghịch biến là $(0; 2)$.]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Hàm số $y = x - sin x$ đồng biến trên khoảng nào dưới đây?],
  (
    [$(0; pi)$],
    [$(-pi; pi)$],
    True([$(-oo; +oo)$]),
    [Không đồng biến trên $RR$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = 1 - cos x$.]
    #step[Vì $-1 <= cos x <= 1 forall x in RR$ nên $y' >= 0 forall x in RR$.]
    #step[Đồng thời $y' = 0 <=> cos x = 1 <=> x = k 2pi (k in ZZ)$, tức là $y'$ chỉ bằng $0$ tại một số điểm rời rạc.]
    #step[Do đó, hàm số đồng biến trên khoảng $(-oo; +oo)$.]
    #step[Vậy đáp án là C.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Hàm số $y = sqrt(2x - x^2)$ đồng biến trên khoảng nào dưới đây?],
  (
    [$(1; 2)$],
    [$(0; 2)$],
    True([$(0; 1)$]),
    [$(0; +oo)$]
  ),
  loigiai: [
    #step[Điều kiện xác định: $2x - x^2 >= 0 <=> 0 <= x <= 2$.]
    #step[Đạo hàm: $y' = (2 - 2x) / (2 sqrt(2x - x^2)) = (1 - x) / sqrt(2x - x^2)$.]
    #step[Hàm số đồng biến khi $y' > 0 <=> 1 - x > 0 <=> x < 1$.]
    #step[Kết hợp với điều kiện xác định, ta được khoảng đồng biến là $(0; 1)$.]
    #step[Vậy đáp án là C.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Số điểm cực trị của hàm số $y = root(3, x^2)$ là],
  (
    [$0$],
    True([$1$]),
    [$2$],
    [$3$]
  ),
  loigiai: [
    #step[Hàm số $y = root(3, x^2)$ có tập xác định $D = RR$. Ta có thể viết $y = x^(2/3)$ (khi xét $x > 0$ hoặc với quy ước căn bậc lẻ).]
    #step[Tuy nhiên, để chính xác ta tính $y' = 2/(3 root(3, x))$.]
    #step[Đạo hàm $y'$ không xác định tại $x = 0$ nhưng hàm số liên tục tại $x = 0$.]
    #step[Với $x < 0$, $root(3, x) < 0 => y' < 0$. Với $x > 0$, $root(3, x) > 0 => y' > 0$.]
    #step[Đạo hàm đổi dấu từ âm sang dương khi đi qua $x = 0$ nên $x = 0$ là điểm cực trị duy nhất của hàm số.]
    #step[Vậy hàm số có $1$ điểm cực trị. Đáp án là B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $ f(x) = cases(x^2 - 2x &"nếu " x >= 0, x &"nếu " x < 0) $. Số điểm cực trị của hàm số đã cho là],
  (
    [$1$],
    True([$2$]),
    [$0$],
    [$3$]
  ),
  loigiai: [
    #step[Tính liên tục tại $x = 0$: $lim_(x -> 0^+) (x^2 - 2x) = 0$ và $lim_(x -> 0^-) x = 0 = f(0)$. Vậy hàm số liên tục trên $RR$.]
    #step[Ta có đạo hàm $f'(x) = cases(2x - 2 &"với " x > 0, 1 &"với " x < 0)$.]
    #step[Với $x < 0$, $f'(x) = 1 > 0$.]
    #step[Với $x > 0$, $f'(x) = 2x - 2$. Cho $f'(x) = 0 <=> x = 1$ (nhận).]
    #step[Lập bảng xét dấu đạo hàm, ta thấy $f'(x)$ đổi dấu từ dương sang âm tại $x = 0$ (do $lim_(x -> 0^+) f'(x) = -2$) và đổi dấu từ âm sang dương tại $x = 1$.]
    #step[Vậy hàm số có $2$ điểm cực trị. Đáp án là B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số bậc ba $y = f(x) = x^3 - 3x$. Số điểm cực trị của hàm số $y = |x^3 - 3x|$ là],
  (
    [$2$],
    [$3$],
    [$4$],
    True([$5$])
  ),
  loigiai: [
    #step[Xét hàm số $f(x) = x^3 - 3x$. Đạo hàm $f'(x) = 3x^2 - 3 = 0 <=> x = 1$ hoặc $x = -1$.]
    #step[Hàm số $f(x)$ có $2$ điểm cực trị.]
    #step[Giải phương trình $f(x) = 0 <=> x(x^2 - 3) = 0 <=> x = 0$ hoặc $x = plus.minus sqrt(3)$.]
    #step[Phương trình có $3$ nghiệm đơn phân biệt, tức là đồ thị cắt trục hoành tại $3$ điểm.]
    #step[Số điểm cực trị của hàm số $y = |f(x)|$ bằng tổng số điểm cực trị của $f(x)$ và số nghiệm đơn của phương trình $f(x) = 0$.]
    #step[Tổng cộng là $2 + 3 = 5$ điểm cực trị. Đáp án là D.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",lines: 0,
  [Cho hàm số $y = f(x)$ có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt( 
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $-1$, $1$, $+oo$),
        d-signs: ("+", "0", "-", "0", "+"),
        v-vals: ($-oo$, $3$, $-1$, $+oo$)
      )
    ]
    Số điểm cực trị của hàm số $y = f(|x|)$ là],
  (
    [$2$],
    True([$3$]),
    [$1$],
    [$5$]
  ),
  loigiai: [
    #step[Từ bảng biến thiên, ta thấy hàm số $f(x)$ có điểm cực trị có hoành độ dương duy nhất là $x = 1$.]
    #step[Số điểm cực trị của hàm số $y = f(|x|)$ được tính theo công thức $2k + 1$, trong đó $k$ là số điểm cực trị có hoành độ dương của $f(x)$.]
    #step[Do $k = 1$, số điểm cực trị của $y = f(|x|)$ là $2 dot 1 + 1 = 3$.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = x e^(-x)$. Khẳng định nào sau đây là *đúng*?],
  (
    [Hàm số đạt cực tiểu tại $x = 1$.],
    True([Hàm số đạt cực đại tại $x = 1$.]),
    [Hàm số đồng biến trên $RR$.],
    [Hàm số nghịch biến trên khoảng $(-oo; 1)$.]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = 1 dot e^(-x) + x dot (-e^(-x)) = e^(-x)(1 - x)$.]
    #step[Cho $y' = 0 <=> 1 - x = 0 <=> x = 1$.]
    #step[Lập bảng xét dấu: với $x < 1$ thì $y' > 0$, với $x > 1$ thì $y' < 0$.]
    #step[Đạo hàm đổi dấu từ dương sang âm khi đi qua $x = 1$ nên hàm số đạt cực đại tại $x = 1$.]
    #step[Vậy khẳng định B là đúng.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Số lượng vi khuẩn của một mẻ nuôi cấy được mô hình hóa bởi hàm số $N(t) = -t^3 + 12t^2 + 100$ ($t$ tính bằng giờ, $0 <= t <= 8$). Tốc độ sinh trưởng của vi khuẩn đạt giá trị lớn nhất tại thời điểm nào?],
  (
    [$t = 2$ giờ],
    True([$t = 4$ giờ]),
    [$t = 6$ giờ],
    [$t = 8$ giờ]
  ),
  loigiai: [
    #step[Tốc độ sinh trưởng của vi khuẩn là đạo hàm của hàm số $N(t)$:
      $ v(t) = N'(t) = -3t^2 + 24t $]
    #step[Ta cần tìm thời điểm $t$ để $v(t)$ đạt giá trị lớn nhất trên đoạn $[0; 8]$.]
    #step[Hàm số $v(t)$ là một parabol bề lõm quay xuống, đạt giá trị cực đại tại đỉnh $t = -24 / (2 dot (-3)) = 4$.]
    #step[Do $t = 4 in [0; 8]$, nên tốc độ sinh trưởng đạt cực đại tại $t = 4$ giờ.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số bậc ba $y = f(x) = x^3 - 3x^2 + 2$. Số điểm cực trị của hàm số $y = |f(x)|$ là],
  (
    True([$5$]),
    [$3$],
    [$4$],
    [$2$]
  ),
  loigiai: [
    #step[Xét hàm số $f(x) = x^3 - 3x^2 + 2$. Ta có $f'(x) = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Hàm số $f(x)$ có $2$ điểm cực trị.]
    #step[Phương trình $f(x) = 0 <=> x^3 - 3x^2 + 2 = 0 <=> (x - 1)(x^2 - 2x - 2) = 0 <=> x = 1$ hoặc $x = 1 plus.minus sqrt(3)$.]
    #step[Đồ thị hàm số $f(x)$ cắt trục hoành tại $3$ điểm phân biệt.]
    #step[Số điểm cực trị của hàm số chứa dấu giá trị tuyệt đối $y = |f(x)|$ là $2 + 3 = 5$.]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Số điểm cực trị của hàm số $y = x^2 ln x$ là],
  (
    [$0$],
    [$2$],
    True([$1$]),
    [$3$]
  ),
  loigiai: [
    #step[Tập xác định: $D = (0; +oo)$.]
    #step[Đạo hàm: $y' = 2x ln x + x^2 dot 1/x = x(2 ln x + 1)$.]
    #step[Cho $y' = 0 <=> x(2 ln x + 1) = 0$. Vì $x > 0$, ta có $2 ln x + 1 = 0 <=> ln x = -1/2 <=> x = e^(-1/2) = 1/sqrt(e)$.]
    #step[Đạo hàm chỉ đổi dấu một lần duy nhất khi đi qua $x = 1/sqrt(e)$.]
    #step[Vậy hàm số có đúng $1$ điểm cực trị. Đáp án là C.]
    #resetstep()
  ]
)



#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  dir: "doc",
  [Cho hàm số $y = |x - 1| + |x + 2|$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số nghịch biến trên khoảng $(-oo; -2)$.]),
    True([Hàm số đồng biến trên khoảng $(1; +oo)$.]),
    [Hàm số đạt cực đại tại $x = 1$.],
    True([Bất phương trình $y' > 0$ nghiệm đúng với mọi $x > 1$.])
  ),
  loigiai: [
    #step[Phá dấu giá trị tuyệt đối của hàm số $y = |x - 1| + |x + 2|$, ta được:
      $ y = cases(
        -2x - 1 &"nếu " x < -2,
        3 &"nếu " -2 <= x <= 1,
        2x + 1 &"nếu " x > 1
      ) $]
    #step[a) Trên khoảng $(-oo; -2)$, $y = -2x - 1$ có hệ số góc âm nên nghịch biến. Mệnh đề a) Đúng.]
    #step[b) Trên khoảng $(1; +oo)$, $y = 2x + 1$ có hệ số góc dương nên đồng biến. Mệnh đề b) Đúng.]
    #step[c) Dựa vào các phân nhánh, ta thấy giá trị của hàm số lớn hơn hoặc bằng $3$. Tập giá trị là $[3; +oo)$. Mệnh đề c) Đúng.]
    #step[d) Hàm số đạt giá trị nhỏ nhất bằng $3$ trên toàn bộ đoạn $[-2; 1]$, do đó không phải chỉ tại duy nhất một điểm. Mệnh đề d) Sai.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",
  [Cho hàm số $y = f(x) = (ln x)/x$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = (0; +oo)$.]),
    True([Đạo hàm của hàm số là $f'(x) = (1 - ln x)/x^2$.]),
    [Hàm số đồng biến trên khoảng $(e; +oo)$.],
    True([Hàm số đạt cực đại tại điểm $x = e$.])
  ),
  loigiai: [
    #step[a) Do có chứa $ln x$, điều kiện xác định là $x > 0$. Suy ra $D = (0; +oo)$. Mệnh đề a) Đúng.]
    #step[b) Tính đạo hàm: $f'(x) = ((ln x)' dot x - ln x dot (x)')/x^2 = (1/x dot x - ln x)/x^2 = (1 - ln x)/x^2$. Mệnh đề b) Đúng.]
    #step[c) Cho $f'(x) = 0 <=> 1 - ln x = 0 <=> x = e$. Đạo hàm đổi dấu từ dương sang âm qua $x = e$ nên hàm số đạt cực đại tại đây. Mệnh đề c) Đúng.]
    #step[d) Thay $x = e$ vào hàm số, ta được giá trị cực đại $y = (ln e)/e = 1/e$. Mệnh đề d) Đúng.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",lines: 2,
  [Cho hàm số $y = f(x)$ có bảng biến thiên như hình vẽ dưới đây:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
        d-signs: ("-", "0", "+", "||", "-", "0", "+"),
        v-vals: ($+oo$, $0$, $2$, $0$, $+oo$),
        ranks: (2, 0, 1, 0, 2)
      )
    ]
    Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số nghịch biến trên các khoảng $(-oo; -1)$ và $(0; 1)$.]),
    True([Hàm số đồng biến trên các khoảng $(-1; 0)$ và $(1; +oo)$.]),
    True([Hàm số đạt cực đại tại $x = 0$.]),
    True([Hàm số có đúng 3 điểm cực trị.])
  ),
  loigiai: [
    #step[Dựa vào bảng biến thiên của hàm số:]
    #step[a) Đạo hàm $y'$ mang dấu âm trên hai khoảng $(-oo; -1)$ và $(0; 1)$, nên hàm số nghịch biến trên các khoảng này. Mệnh đề a) Đúng.]
    #step[b) Đạo hàm $y'$ mang dấu dương trên hai khoảng $(-1; 0)$ và $(1; +oo)$, nên hàm số đồng biến. Mệnh đề b) Đúng.]
    #step[c) Tại $x = -1$ và $x = 1$, $y'$ đổi dấu từ âm sang dương nên đây là hai điểm cực tiểu. Mệnh đề c) Đúng.]
    #step[d) Tại $x = 0$, $y'$ đổi dấu từ dương sang âm nên đây là điểm cực đại với giá trị bằng $2$. Mệnh đề d) Đúng.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",lines: 2,
  [Nồng độ một loại thuốc trong máu của bệnh nhân sau $t$ giờ tiêm được tính bởi công thức $C(t) = (4t)/(t^2 + 4)$ (đơn vị: mg/L, $t >= 0$). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Nồng độ thuốc tăng trong khoảng thời gian 2 giờ đầu tiên sau khi tiêm.]),
    True([Nồng độ thuốc giảm từ giờ thứ 2 trở đi.]),
    True([Nồng độ thuốc trong máu đạt cực đại tại thời điểm $t = 2$ giờ.]),
    [Nồng độ thuốc trong máu đạt cực đại là $2$ mg/L.]
  ),
  loigiai: [
    #step[Đạo hàm $C'(t) = (4(t^2 + 4) - 4t(2t))/(t^2 + 4)^2 = (16 - 4t^2)/(t^2 + 4)^2$.]
    #step[Cho $C'(t) = 0 <=> 16 - 4t^2 = 0 <=> t = 2$ (do $t >= 0$).]
    #step[a) Trên khoảng $(0; 2)$, $C'(t) > 0$ nên hàm số đồng biến. Tức nồng độ tăng trong $2$ giờ đầu tiên. Mệnh đề a) Đúng.]
    #step[b) Với $t > 2$, $C'(t) < 0$ nên nồng độ giảm. Mệnh đề b) Đúng.]
    #step[c) Hàm số đạt giá trị lớn nhất tại $t = 2$. Giá trị cực đại $C(2) = (4 dot 2)/(2^2 + 4) = 8/8 = 1$ mg/L. Mệnh đề c) Đúng.]
    #step[d) Tại $t = 4$, nồng độ là $C(4) = (4 dot 4)/(4^2 + 4) = 16/20 = 0.8$ mg/L. Mệnh đề d) Đúng.]
    #resetstep()
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  dir: "ngang",
  [Tìm số điểm cực trị của hàm số $y = cos x + 1/2 cos 2x$ trên khoảng $(0; 2pi)$.],
  [$3$],
  loigiai: [
    #step[Đạo hàm: $y' = -sin x - 1/2 dot 2 sin 2x = -sin x - sin 2x = -sin x(1 + 2 cos x)$.]
    #step[Cho $y' = 0 <=> sin x = 0$ hoặc $1 + 2 cos x = 0 <=> cos x = -1/2$.]
    #step[Trên khoảng $(0; 2pi)$: phương trình $sin x = 0$ có nghiệm $x = pi$; phương trình $cos x = -1/2$ có nghiệm $x = (2pi)/3$ và $x = (4pi)/3$.]
    #step[Hàm số có $3$ nghiệm đơn phân biệt, tức đạo hàm đổi dấu khi đi qua $3$ điểm này.]
    #step[Vậy trên khoảng $(0; 2pi)$, hàm số có $3$ điểm cực trị.]
    #step[Kết luận: $3$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số bậc ba $y = f(x) = x^3 - 3x^2 + 1$. Gọi $S$ là số điểm cực trị của hàm số $y = |f(x)|$. Tính giá trị của $S$.],
  [$5$],
  loigiai: [
    #step[Ta xét hàm số $f(x) = x^3 - 3x^2 + 1$. Đạo hàm $f'(x) = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Hàm số $f(x)$ có $2$ điểm cực trị, với các giá trị cực trị là $f(0) = 1$ và $f(2) = -3$.]
    #step[Vì $f(0) dot f(2) = -3 < 0$, đồ thị hàm số cắt trục hoành tại $3$ điểm phân biệt.]
    #step[Số điểm cực trị của hàm số $y = |f(x)|$ bằng tổng số điểm cực trị của $f(x)$ và số giao điểm với trục hoành.]
    #step[Vậy $S = 2 + 3 = 5$.]
    #step[Kết luận: $5$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $y = e^x (x^2 - 3)$. Gọi $x_0$ là hoành độ điểm cực đại của đồ thị hàm số. Tính giá trị $x_0 + 3$.],
  [$0$],
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm $y' = e^x(x^2 - 3) + e^x(2x) = e^x(x^2 + 2x - 3)$.]
    #step[Cho $y' = 0 <=> x^2 + 2x - 3 = 0 <=> x = 1$ hoặc $x = -3$.]
    #step[Lập bảng xét dấu, đạo hàm đổi dấu từ dương sang âm qua $x = -3$, nên đây là điểm cực đại.]
    #step[Vậy hoành độ điểm cực đại là $x_0 = -3$. Suy ra $x_0 + 3 = 0$.]
    #step[Kết luận: $0$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $ f(x) = cases(x^2 + 4x &"nếu " x >= -1, -2x - 5 &"nếu " x < -1) $. Hàm số đã cho có bao nhiêu điểm cực trị?],
  [$1$],
  loigiai: [
    #step[Xét tính liên tục tại $x = -1$: $lim_(x -> -1^+) f(x) = 1 - 4 = -3$ và $lim_(x -> -1^-) f(x) = 2 - 5 = -3$. Hàm số liên tục.]
    #step[Đạo hàm: $f'(x) = cases(2x + 4 &"với " x > -1, -2 &"với " x < -1)$.]
    #step[Trên khoảng $(-oo; -1)$, ta có $f'(x) = -2 < 0$.]
    #step[Trên khoảng $(-1; +oo)$, ta có $f'(x) = 2x + 4 > 0$ vì $x > -1$.]
    #step[Đạo hàm $f'(x)$ đổi dấu từ âm sang dương khi đi qua $x = -1$ (cho dù tại đó không có đạo hàm). Do đó, hàm số đạt cực tiểu tại $x = -1$.]
    #step[Vậy hàm số đã cho có $1$ điểm cực trị.]
    #step[Kết luận: $1$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Tìm hoành độ điểm cực tiểu của đồ thị hàm số $y = sqrt(x^2 - 6x + 10)$.],
  [$3$],
  loigiai: [
    #step[Ta có $x^2 - 6x + 10 = (x - 3)^2 + 1 >= 1 forall x in RR$.]
    #step[Suy ra $y = sqrt(x^2 - 6x + 10) >= sqrt(1) = 1$.]
    #step[Dấu "$=$" xảy ra khi và chỉ khi $x - 3 = 0 <=> x = 3$.]
    #step[Vậy điểm cực tiểu của đồ thị hàm số nằm tại hoành độ $x = 3$.]
    #step[Kết luận: $3$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $f(x)$ liên tục trên $RR$ và có bảng xét dấu của đạo hàm $f'(x)$ như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'(x)$,
        x-vals: ($-oo$, $-2$, $0$, $2$, $+oo$),
        f-signs: ("+", "||", "-", "0", "+", "0", "+")
      )
    ]
    Hỏi hàm số $f(x)$ có bao nhiêu điểm cực trị?],
  [$2$],
  loigiai: [
    #step[Hàm số $f(x)$ liên tục trên $RR$ nên tại các điểm mà đạo hàm bị gián đoạn (như tại $x = -2$), hàm số vẫn có thể đạt cực trị.]
    #step[Dựa vào bảng xét dấu đạo hàm $f'(x)$:]
    #step[Tại $x = -2$, $f'(x)$ đổi dấu từ dương sang âm nên đây là một điểm cực đại.]
    #step[Tại $x = 0$, $f'(x)$ đổi dấu từ âm sang dương nên đây là một điểm cực tiểu.]
    #step[Tại $x = 2$, $f'(x)$ không đổi dấu (từ dương sang dương) nên $x = 2$ không phải là điểm cực trị.]
    #step[Vậy hàm số có tổng cộng $2$ điểm cực trị.]
    #step[Kết luận: $2$.]
    #resetstep()
  ]
)
