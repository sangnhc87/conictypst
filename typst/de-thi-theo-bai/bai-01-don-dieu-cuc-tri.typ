#import "../sang-exam.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let mode = "dethi"
#let accent = classic.blue
#let math-color = rgb("#000000")
#show math.equation: set text(fill: math-color)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "GV Nguyễn Văn Sang",
  exam-title: "BÀI 1: TÍNH ĐƠN ĐIỆU VÀ CỰC TRỊ CỦA HÀM SỐ",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto,
  code: "101",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  header-border: true,
)

#exam-part(
  [Phần I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.],
)

#tn(
  [Cho hàm số $y=f(x)$ có bảng biến thiên như hình dưới đây:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $-1$, $1$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$),
      v-vals: ($-oo$, $2$, $-2$, $+oo$),
    )
  ]
  Hàm số đã cho đồng biến trên khoảng nào dưới đây?],
  (
    [$( -1; 1 )$],
    [$( -oo; 2 )$],
    True([$( 1; +oo )$]),
    [$( -2; +oo )$],
  ),
  loigiai: [
    #step[Phân tích bảng biến thiên]
    Từ bảng biến thiên, ta thấy $f'(x) > 0$ trên các khoảng $( -oo; -1 )$ và $( 1; +oo )$.
    Do đó hàm số đồng biến trên các khoảng $( -oo; -1 )$ và $( 1; +oo )$.
    Đối chiếu với các đáp án, ta chọn $( 1; +oo )$.
  ]
)

#tn(
  [Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $0$, $2$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$),
      v-vals: ($+oo$, $-1$, $3$, $-oo$),
    )
  ]
  Điểm cực tiểu của hàm số đã cho là:],
  (
    [$x = 2$],
    True([$x = 0$]),
    [$x = -1$],
    [$x = 3$],
  ),
  loigiai: [
    #step[Tìm cực trị từ bảng biến thiên]
    Từ bảng biến thiên, $f'(x)$ đổi dấu từ âm sang dương khi đi qua $x = 0$.
    Vậy điểm cực tiểu của hàm số là $x = 0$.
  ]
)

#tn(
  [Cho hàm số $y = f(x)$ xác định trên $RR \\ {1}$ và có bảng xét dấu đạo hàm như sau:
  #align(center)[
    #bxd(
      x-vals: ($-oo$, $1$, $3$, $+oo$),
      f-signs: ($+$, $||$, $-$, $0$, $+$),
    )
  ]
  Mệnh đề nào dưới đây đúng?],
  (
    [Hàm số đạt cực đại tại $x = 1$.],
    True([Hàm số đạt cực tiểu tại $x = 3$.]),
    [Hàm số đồng biến trên khoảng $(1; 3)$.],
    [Hàm số có 2 điểm cực trị.],
  ),
  loigiai: [
    #step[Xét dấu đạo hàm]
    Tại $x=1$ hàm số không xác định nên không phải cực đại.
    Tại $x=3$, $f'(x)$ đổi dấu từ âm sang dương nên $x=3$ là điểm cực tiểu.
  ]
)

#tn(
  [Cho hàm số $y=f(x)$ có đồ thị như hình vẽ bên.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-2, 0), (4, 0), mark: (end: ">"))
      content((4, -0.3), [$x$])
      line((0, -3), (0, 3), mark: (end: ">"))
      content((-0.3, 3), [$y$])
      content((-0.3, -0.3), [$O$])
      
      let pts = range(-15, 30).map(x => {
        let nx = x / 10
        let ny = (nx * nx * nx) / 3 - nx * nx
        (nx, ny)
      })
      line(..pts, stroke: blue + 1.2pt)
      
      content((2, -2.3), [$2$])
      content((-0.3, -1.3), [$-4/3$])
      line((2,0), (2,-4/3), stroke: (dash: "dashed"))
      line((0,-4/3), (2,-4/3), stroke: (dash: "dashed"))
      circle((2, -4/3), radius: 0.05, fill: black)
      circle((0, 0), radius: 0.05, fill: black)
    })
  ]
  Hàm số đã cho đồng biến trên khoảng nào dưới đây?],
  (
    [$(0; 2)$],
    True([$(2; +oo)$]),
    [$( -oo; 2)$],
    [$(0; +oo)$],
  ),
  loigiai: [
    #step[Nhìn đồ thị để xét tính đơn điệu]
    Đồ thị hàm số đi lên từ trái sang phải trên các khoảng $(-oo; 0)$ và $(2; +oo)$.
    Do đó hàm số đồng biến trên các khoảng $(-oo; 0)$ và $(2; +oo)$.
  ]
)

#tn(
  [Cho đồ thị hàm số $y=f(x)$ như hình vẽ:
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (3, 0), mark: (end: ">"))
      content((3, -0.3), [$x$])
      line((0, -3), (0, 3), mark: (end: ">"))
      content((-0.3, 3), [$y$])
      content((-0.3, -0.3), [$O$])
      
      let pts = range(-22, 23).map(x => {
        let nx = x / 10
        let ny = -nx * nx * nx + 3 * nx
        (nx, ny)
      })
      line(..pts, stroke: blue + 1.2pt)
      
      line((1,0), (1,2), stroke: (dash: "dashed"))
      line((0,2), (1,2), stroke: (dash: "dashed"))
      line((-1,0), (-1,-2), stroke: (dash: "dashed"))
      line((0,-2), (-1,-2), stroke: (dash: "dashed"))
      
      circle((1, 2), radius: 0.05, fill: black)
      circle((-1, -2), radius: 0.05, fill: black)
      content((0.2, 2.2), [$2$])
      content((1, -0.3), [$1$])
      content((-0.3, -2), [$-2$])
      content((-1, 0.3), [$-1$])
    })
  ]
  Giá trị cực đại của hàm số là:],
  (
    [$x = 1$],
    [$-2$],
    True([$2$]),
    [$x = -1$],
  ),
  loigiai: [
    #step[Đọc đồ thị]
    Từ đồ thị, hàm số đạt cực đại tại $x = 1$ và giá trị cực đại là $y = 2$.
  ]
)

#tn(
  [Cho đạo hàm của hàm số $y=f(x)$ là $f'(x) = x(x-2)^2 (x+1)^3$. Số điểm cực trị của hàm số $f(x)$ là:],
  (
    [1],
    True([2]),
    [3],
    [4],
  ),
  loigiai: [
    #step[Đếm số lần đạo hàm đổi dấu]
    Ta có $f'(x) = 0 <=> x=0, x=2, x=-1$.
    Nghiệm $x=2$ là nghiệm bội 2 (đạo hàm không đổi dấu).
    Nghiệm $x=0$ và $x=-1$ là nghiệm lẻ (đạo hàm đổi dấu).
    Vậy hàm số có 2 điểm cực trị.
  ]
)

#tn(
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đồ thị đạo hàm $y = f'(x)$ như hình vẽ:
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (4, 0), mark: (end: ">"))
      content((4, -0.3), [$x$])
      line((0, -3), (0, 3), mark: (end: ">"))
      content((-0.3, 3), [$y$])
      content((0.2, -0.3), [$O$])
      
      let pts = range(-15, 25).map(x => {
        let nx = x / 10
        let ny = (nx + 1) * (nx - 2)
        (nx, ny)
      })
      line(..pts, stroke: red + 1.2pt)
      
      content((-1, 0.3), [$-1$])
      content((2, 0.3), [$2$])
      circle((-1, 0), radius: 0.05, fill: black)
      circle((2, 0), radius: 0.05, fill: black)
    })
  ]
  Hàm số $y = f(x)$ nghịch biến trên khoảng nào dưới đây?],
  (
    [$( -oo; -1 )$],
    True([$( -1; 2 )$]),
    [$( 2; +oo )$],
    [$( -1; +oo )$],
  ),
  loigiai: [
    #step[Xét dấu đạo hàm từ đồ thị $f'(x)$]
    Đồ thị $f'(x)$ nằm dưới trục hoành khi $x in (-1; 2)$.
    Tức là $f'(x) < 0, forall x in (-1; 2)$.
    Vậy hàm số $y=f(x)$ nghịch biến trên khoảng $(-1; 2)$.
  ]
)

#tn(
  [Cho hàm số $y = x^3 - 3x^2 + 2$. Điểm cực tiểu của đồ thị hàm số là:],
  (
    [$(0; 2)$],
    True([$(2; -2)$]),
    [$(1; 0)$],
    [$x = 2$],
  ),
  loigiai: [
    #step[Tính đạo hàm và tìm điểm cực tiểu]
    $y' = 3x^2 - 6x$. Cho $y' = 0 <=> x = 0$ hoặc $x = 2$.
    $y'' = 6x - 6$. Tại $x = 2$, $y''(2) = 6 > 0$ nên $x = 2$ là điểm cực tiểu.
    Khi $x = 2$, $y = 2^3 - 3(2)^2 + 2 = -2$.
    Vậy điểm cực tiểu của đồ thị hàm số là $(2; -2)$.
  ]
)

#tn(
  [Tìm tất cả các giá trị thực của tham số $m$ để hàm số $y = 1/3 x^3 - m x^2 + 3x - 1$ đồng biến trên $RR$.],
  (
    [$-sqrt(3) <= m <= sqrt(3)$],
    True([$-sqrt(3) <= m <= sqrt(3)$]), // Sửa lại m logic cho hàm y' = x^2 - 2m x + 3
    [$m >= sqrt(3)$],
    [$m <= -sqrt(3)$],
  ),
  loigiai: [
    #step[Điều kiện đồng biến]
    Ta có $y' = x^2 - 2m x + 3$.
    Để hàm số đồng biến trên $RR$ thì $y' >= 0, forall x in RR$.
    $<=> Delta' = m^2 - 3 <= 0 <=> -sqrt(3) <= m <= sqrt(3)$.
  ]
)

#tn(
  [Hàm số $y = -x^4 + 2x^2 + 3$ đồng biến trên khoảng nào sau đây?],
  (
    [$(0; 1)$],
    [$(1; +oo)$],
    True([$(-oo; -1)$]),
    [$(-1; 0)$],
  ),
  loigiai: [
    #step[Tính đạo hàm]
    $y' = -4x^3 + 4x = -4x(x^2 - 1)$.
    $y' = 0 <=> x = 0, x = -1, x = 1$.
    Dấu $y'$ trên $(-oo; -1)$ là dương. Vậy hàm số đồng biến trên $(-oo; -1)$.
  ]
)

#tn(
  [Cho hàm số $y=f(x)$ có đạo hàm liên tục trên $RR$ và đồ thị hàm số $y=f'(x)$ như hình vẽ.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-2, 0), (4, 0), mark: (end: ">"))
      content((4, -0.3), [$x$])
      line((0, -2), (0, 3), mark: (end: ">"))
      content((-0.3, 3), [$y$])
      
      let pts = range(-12, 23).map(x => {
        let nx = x / 10
        let ny = (nx)*(nx - 2)*(nx + 1)/2
        (nx, ny)
      })
      line(..pts, stroke: red + 1.2pt)
      content((-1, 0.3), [$-1$])
      content((2, 0.3), [$2$])
      circle((-1, 0), radius: 0.05, fill: black)
      circle((0, 0), radius: 0.05, fill: black)
      circle((2, 0), radius: 0.05, fill: black)
    })
  ]
  Hàm số $y=f(x)$ đạt cực đại tại:],
  (
    [$x = -1$],
    True([$x = 0$]),
    [$x = 2$],
    [$x = 1$],
  ),
  loigiai: [
    #step[Xét dấu từ đồ thị đạo hàm]
    Qua điểm $x=0$, đồ thị $f'(x)$ đi từ phía trên trục hoành xuống dưới trục hoành (đổi dấu từ dương sang âm).
    Do đó, $x=0$ là điểm cực đại của hàm số.
  ]
)

#tn(
  [Hàm số $y = (2x-1)/(x+1)$ có bao nhiêu điểm cực trị?],
  (
    [1],
    [2],
    True([0]),
    [3],
  ),
  loigiai: [
    #step[Tính đạo hàm]
    Ta có $y' = 3 / (x+1)^2 > 0, forall x != -1$.
    Đạo hàm luôn dương, hàm số luôn đồng biến trên từng khoảng xác định và không có cực trị.
  ]
)

#exam-part(
  [Phần II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
)

#ds(
  [Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $0$, $2$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$),
      v-vals: ($+oo$, $-2$, $4$, $-oo$),
    )
  ]
  Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đồng biến trên khoảng $(0; 2)$.]),
    [Hàm số nghịch biến trên khoảng $(-2; 4)$.],
    True([Hàm số đạt cực đại tại $x=2$ và giá trị cực đại bằng $4$.]),
    [Hàm số có 3 điểm cực trị.],
  ),
  loigiai: [
    #step[Phân tích bảng biến thiên]
    a) Đúng vì trên khoảng $(0; 2)$ thì $f'(x) > 0$.
    b) Sai vì khoảng nghịch biến là $(-oo; 0)$ và $(2; +oo)$.
    c) Đúng vì tại $x=2$ đạo hàm đổi dấu từ dương sang âm.
    d) Sai vì hàm số chỉ có 2 điểm cực trị.
  ]
)

#ds(
  [Cho hàm số $y = (a x + b)/(c x + d)$ có đồ thị như hình vẽ.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (3, 0), mark: (end: ">"))
      line((0, -3), (0, 3), mark: (end: ">"))
      // tiệm cận
      line((1, -3), (1, 3), stroke: (dash: "dashed", paint: gray))
      line((-3, 2), (3, 2), stroke: (dash: "dashed", paint: gray))
      
      let pts1 = range(-30, 8).map(x => {
        let nx = x / 10
        let ny = (2*nx + 1) / (nx - 1)
        (nx, ny)
      })
      line(..pts1, stroke: blue + 1.2pt)
      
      let pts2 = range(12, 30).map(x => {
        let nx = x / 10
        let ny = (2*nx + 1) / (nx - 1)
        (nx, ny)
      })
      line(..pts2, stroke: blue + 1.2pt)
      
      content((1.2, -0.3), [$1$])
      content((-0.3, 2.2), [$2$])
      circle((-0.5, 0), radius: 0.05, fill: black)
      circle((0, -1), radius: 0.05, fill: black)
    })
  ]
  Biết đồ thị cắt trục hoành tại $x=-1/2$ và trục tung tại $y=-1$. Xét tính đúng sai của các mệnh đề:],
  (
    True([Hàm số nghịch biến trên từng khoảng xác định.]),
    [Hàm số có 1 điểm cực trị.],
    True([Hàm số không có điểm cực trị.]),
    True([Đạo hàm của hàm số luôn mang dấu âm với mọi $x != 1$.]),
  ),
  loigiai: [
    #step[Phân tích đồ thị]
    Đồ thị đi xuống từ trái sang phải, nên hàm số nghịch biến trên từng khoảng xác định. Mệnh đề a) đúng, d) đúng.
    Hàm phân thức bậc nhất / bậc nhất không có cực trị. Mệnh đề b) sai, c) đúng.
  ]
)

#ds(
  [Cho hàm số $y = f(x)$ có đồ thị đạo hàm $y = f'(x)$ như hình vẽ.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (4, 0), mark: (end: ">"))
      line((0, -3), (0, 3), mark: (end: ">"))
      
      let pts = range(-20, 30).map(x => {
        let nx = x / 10
        let ny = nx*(nx - 2)
        (nx, ny)
      })
      line(..pts, stroke: red + 1.2pt)
      content((0.2, 0.2), [$O$])
      content((2, 0.3), [$2$])
      circle((0, 0), radius: 0.05, fill: black)
      circle((2, 0), radius: 0.05, fill: black)
    })
  ]
  Xét tính đúng sai của các mệnh đề sau đối với hàm số $y = f(x)$:],
  (
    [Hàm số $y = f(x)$ nghịch biến trên $(0; +oo)$.],
    True([Hàm số $y = f(x)$ đồng biến trên $(2; +oo)$.]),
    True([Điểm cực tiểu của hàm số $y=f(x)$ là $x = 2$.]),
    [Hàm số $y=f(x)$ đạt cực đại tại $x = 2$.],
  ),
  loigiai: [
    #step[Xét dấu đạo hàm]
    Từ đồ thị $f'(x)$, ta thấy $f'(x) < 0$ trên khoảng $(0; 2)$ và $f'(x) > 0$ trên $(2; +oo)$ và $(-oo; 0)$.
    Hàm số $f(x)$ đồng biến trên $(-oo; 0)$ và $(2; +oo)$, nghịch biến trên $(0; 2)$. a) sai, b) đúng.
    $f'(x)$ đổi dấu từ âm sang dương qua $x=2$ nên $x=2$ là điểm cực tiểu. c) đúng, d) sai.
  ]
)

#ds(
  [Cho hàm số $y = -x^3 + 3x^2 + 9x - 2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số đồng biến trên $RR$.],
    True([Hàm số nghịch biến trên khoảng $(-oo; -1)$.]),
    True([Hàm số đạt cực đại tại $x = 3$.]),
    [Giá trị cực tiểu của hàm số là $-2$.],
  ),
  loigiai: [
    #step[Tính đạo hàm và lập BBT]
    $y' = -3x^2 + 6x + 9 = -3(x^2 - 2x - 3)$.
    $y' = 0 <=> x = -1, x = 3$.
    Trong khoảng $(-1; 3)$, $y' > 0$ hàm số đồng biến. Ngoài khoảng hàm số nghịch biến.
    Vậy a) sai, b) đúng.
    Tại $x=3$, $y'$ đổi dấu từ dương sang âm nên là điểm cực đại. c) đúng.
    Tại $x=-1$, $y(-1) = 1 + 3 - 9 - 2 = -7$ là giá trị cực tiểu. d) sai.
  ]
)

#exam-part(
  [Phần III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
)

#tln(
  [Hàm số $y = 1/3 x^3 - m x^2 + (2m+3)x + 1$ có bao nhiêu giá trị nguyên của $m$ thuộc đoạn $[-5; 5]$ để hàm số đồng biến trên $RR$?],
  [$5$],
  loigiai: [
    #step[Điều kiện hàm số đồng biến trên $RR$]
    Ta có $y' = x^2 - 2m x + 2m+3$.
    Để hàm số đồng biến trên $RR$ thì $y' >= 0, forall x in RR$.
    $<=> Delta' = m^2 - (2m+3) <= 0 <=> m^2 - 2m - 3 <= 0 <=> -1 <= m <= 3$.
    Vì $m in ZZ$ và thuộc $[-5; 5]$ nên $m in {-1; 0; 1; 2; 3}$. Có tất cả 5 giá trị nguyên.
  ]
)

#tln(
  [Cho hàm số $f(x)$ có đạo hàm $f'(x) = x(x-1)(x-2)^2$. Hỏi hàm số $y = f(x)$ có bao nhiêu điểm cực trị?],
  [$2$],
  loigiai: [
    #step[Xét nghiệm của phương trình $f'(x) = 0$]
    $f'(x) = 0 <=> hoac(x = 0, x = 1, x = 2)$.
    Nghiệm $x = 2$ là nghiệm bội chẵn nên $f'(x)$ không đổi dấu.
    Nghiệm $x = 0$ và $x = 1$ là nghiệm bội lẻ nên $f'(x)$ đổi dấu.
    Vậy hàm số có 2 điểm cực trị.
  ]
)

#tln(
  [Tìm giá trị cực đại của hàm số $y = -x^3 + 3x^2 + 1$.],
  [$5$],
  loigiai: [
    #step[Tính đạo hàm và tìm điểm cực đại]
    $y' = -3x^2 + 6x$. Cho $y' = 0 <=> -3x(x - 2) = 0 <=> x = 0$ hoặc $x = 2$.
    Bảng biến thiên cho thấy đạo hàm đổi dấu từ dương sang âm tại $x = 2$, nên hàm số đạt cực đại tại $x = 2$.
    Giá trị cực đại là $y(2) = -2^3 + 3(2^2) + 1 = -8 + 12 + 1 = 5$.
  ]
)

#tln(
  [Cho hàm số $f(x)$ xác định trên $RR$, có đồ thị hàm số $y=f(x)$ là đường cong có hình dạng chữ W với điểm cực đại có tung độ là $y=4$ và hai điểm cực tiểu có tung độ là $y=-1$. Có bao nhiêu giá trị nguyên dương của tham số $m$ để phương trình $f(x) = m$ có đúng 4 nghiệm phân biệt?],
  [$3$],
  loigiai: [
    #step[Khảo sát sự tương giao]
    Hàm số bậc 4 trùng phương dạng chữ W có giá trị cực đại là $y=4$ và cực tiểu $y=-1$.
    Số nghiệm của phương trình $f(x) = m$ là số giao điểm của đồ thị với đường thẳng $y=m$.
    Để cắt tại 4 điểm phân biệt thì $-1 < m < 4$.
    Các giá trị nguyên dương của $m$ là $1, 2, 3$. Vậy có 3 giá trị.
  ]
)

#tln(
  [Tìm giá trị của tham số $m > 0$ để hàm số $y = 1/3 x^3 - m x^2 + (m^2 - 4)x$ đạt cực đại tại $x = 1$.],
  [$3$],
  loigiai: [
    #step[Sử dụng điều kiện cần và đủ]
    Ta có $y' = x^2 - 2m x + m^2 - 4$.
    Để hàm số đạt cực đại tại $x=1$ thì trước tiên $y'(1) = 0 <=> 1 - 2m + m^2 - 4 = 0 <=> m^2 - 2m - 3 = 0 <=> m = -1$ hoặc $m = 3$.
    Vì đề bài yêu cầu $m > 0$ nên $m = 3$.
    Thử lại với đạo hàm bậc hai $y'' = 2x - 2m$.
    Tại $x=1$ và $m=3$, $y''(1) = 2 - 6 = -4 < 0$ (thoả mãn điều kiện cực đại).
    Vậy $m=3$.
  ]
)

#tln(
  [Đồ thị hàm số $y = x^4 - 2x^2 - 3$ có 3 điểm cực trị là các đỉnh của một tam giác. Tính diện tích của tam giác đó.],
  [$1$],
  loigiai: [
    #step[Tìm toạ độ các điểm cực trị]
    Ta có $y' = 4x^3 - 4x = 4x(x^2 - 1)$.
    $y' = 0 <=> x = 0$ hoặc $x = +-1$.
    Với $x=0 => y = -3$. Điểm cực đại $A(0; -3)$.
    Với $x=+-1 => y = 1 - 2 - 3 = -4$. Điểm cực tiểu $B(1; -4)$ và $C(-1; -4)$.
    
    #step[Tính diện tích tam giác]
    Tam giác $A B C$ cân tại $A$. Gọi $H$ là trung điểm $B C$, ta có $H(0; -4)$.
    Độ dài đáy $B C = sqrt((-1 - 1)^2 + 0) = 2$.
    Chiều cao $A H = |-3 - (-4)| = 1$.
    Diện tích tam giác là $S = 1/2 dot B C dot A H = 1/2 dot 2 dot 1 = 1$.
  ]
)
