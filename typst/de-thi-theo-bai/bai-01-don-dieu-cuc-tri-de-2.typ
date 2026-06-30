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
  exam-title: "BÀI 1: TÍNH ĐƠN ĐIỆU VÀ CỰC TRỊ CỦA HÀM SỐ (ĐỀ 2)",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto,
  code: "102",
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
      x-vals: ($-oo$, $-2$, $1$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$),
      v-vals: ($+oo$, $-3$, $5$, $-oo$),
    )
  ]
  Hàm số đã cho đạt cực đại tại điểm nào dưới đây?],
  (
    [$x = 5$],
    True([$x = 1$]),
    [$x = -2$],
    [$x = -3$],
  ),
  loigiai: [
    #step[Đọc bảng biến thiên]
    Tại $x = 1$, đạo hàm $f'(x)$ đổi dấu từ dương sang âm nên $x=1$ là điểm cực đại của hàm số.
  ]
)

#tn(
  [Cho hàm số $y=f(x)$ có đồ thị như hình vẽ bên.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (3, 0), mark: (end: ">"))
      content((3, -0.3), [$x$])
      line((0, -3), (0, 4), mark: (end: ">"))
      content((-0.3, 4), [$y$])
      content((-0.3, -0.3), [$O$])
      
      let pts = range(-22, 23).map(x => {
        let nx = x / 10
        let ny = -nx * nx * nx + 3 * nx + 1
        (nx, ny)
      })
      line(..pts, stroke: blue + 1.2pt)
      
      line((1,0), (1,3), stroke: (dash: "dashed"))
      line((0,3), (1,3), stroke: (dash: "dashed"))
      line((-1,0), (-1,-1), stroke: (dash: "dashed"))
      line((0,-1), (-1,-1), stroke: (dash: "dashed"))
      
      circle((1, 3), radius: 0.05, fill: black)
      circle((-1, -1), radius: 0.05, fill: black)
      content((0.2, 3.2), [$3$])
      content((1, -0.3), [$1$])
      content((0.3, -1), [$-1$])
      content((-1, 0.3), [$-1$])
    })
  ]
  Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
  (
    [$( -1; 1 )$],
    True([$( 1; +oo )$]),
    [$( -1; 3 )$],
    [$( 0; 1 )$],
  ),
  loigiai: [
    #step[Phân tích đồ thị]
    Đồ thị đi xuống (nghịch biến) trên các khoảng $( -oo; -1 )$ và $( 1; +oo )$.
    Đối chiếu các đáp án, khoảng $( 1; +oo )$ là khoảng nghịch biến.
  ]
)

#tn(
  [Giá trị cực tiểu của hàm số $y = x^3 - 3x^2 - 9x + 2$ là:],
  (
    [$7$],
    [$-3$],
    True([$-25$]),
    [$3$],
  ),
  loigiai: [
    #step[Tính đạo hàm và xét cực trị]
    $y' = 3x^2 - 6x - 9$. Cho $y' = 0 <=> x = -1$ hoặc $x = 3$.
    $y'' = 6x - 6$. Tại $x = 3$, $y''(3) = 12 > 0$ nên hàm số đạt cực tiểu tại $x = 3$.
    Khi đó, giá trị cực tiểu $y(3) = 3^3 - 3(3^2) - 9(3) + 2 = -25$.
  ]
)

#tn(
  [Cho hàm số $y=f(x)$ liên tục trên $RR$ và có bảng xét dấu đạo hàm như sau:
  #align(center)[
    #bxd(
      x-vals: ($-oo$, $-1$, $0$, $2$, $+oo$),
      f-signs: ($+$, $0$, $-$, $0$, $-$, $0$, $+$),
    )
  ]
  Số điểm cực trị của hàm số đã cho là:],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$4$],
  ),
  loigiai: [
    #step[Xét dấu đạo hàm]
    Đạo hàm đổi dấu qua $x = -1$ (từ $+$ sang $-$) và qua $x = 2$ (từ $-$ sang $+$).
    Tại $x = 0$ đạo hàm không đổi dấu.
    Vậy hàm số có 2 điểm cực trị.
  ]
)

#tn(
  [Cho đồ thị hàm số $y=f'(x)$ như hình vẽ. 
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (4, 0), mark: (end: ">"))
      content((4, -0.3), [$x$])
      line((0, -2), (0, 3), mark: (end: ">"))
      content((-0.3, 3), [$y$])
      
      let pts = range(-10, 30).map(x => {
        let nx = x / 10
        let ny = (nx - 1)*(nx - 1) - 1
        (nx, ny)
      })
      line(..pts, stroke: red + 1.2pt)
      content((0.2, 0.3), [$0$])
      content((2, 0.3), [$2$])
      circle((0, 0), radius: 0.05, fill: black)
      circle((2, 0), radius: 0.05, fill: black)
    })
  ]
  Khẳng định nào dưới đây đúng?],
  (
    [Hàm số $y=f(x)$ đồng biến trên khoảng $(0; 2)$.],
    [Hàm số $y=f(x)$ nghịch biến trên khoảng $(2; +oo)$.],
    True([Hàm số $y=f(x)$ nghịch biến trên khoảng $(0; 2)$.]),
    [Hàm số $y=f(x)$ đạt cực tiểu tại $x=0$.],
  ),
  loigiai: [
    #step[Xét dấu từ đồ thị đạo hàm]
    Trên khoảng $(0; 2)$, đồ thị $f'(x)$ nằm dưới trục hoành nên $f'(x) < 0$. Suy ra hàm số $f(x)$ nghịch biến trên $(0; 2)$.
    Tại $x=0$, $f'(x)$ chuyển từ dương sang âm nên là cực đại, không phải cực tiểu.
  ]
)

#tn(
  [Cho hàm số $y = (x+2)/(x-1)$. Khẳng định nào sau đây là đúng?],
  (
    [Hàm số đồng biến trên các khoảng $( -oo; 1 )$ và $( 1; +oo )$.],
    True([Hàm số nghịch biến trên các khoảng $( -oo; 1 )$ và $( 1; +oo )$.]),
    [Hàm số đồng biến trên $RR \\ {1}$.],
    [Hàm số nghịch biến trên khoảng $( -oo; 1 ) union ( 1; +oo )$.],
  ),
  loigiai: [
    #step[Tính đạo hàm]
    Tập xác định: $D = RR \\ {1}$.
    Đạo hàm: $y' = (-3) / (x-1)^2 < 0, forall x != 1$.
    Hàm số nghịch biến trên từng khoảng xác định. Cách viết $( -oo; 1 ) union ( 1; +oo )$ là sai theo quy ước. 
  ]
)

#tn(
  [Hàm số $y = x^4 - 2x^2 + 3$ có đồ thị như thế nào đối với các điểm cực trị?],
  (
    [Có 1 điểm cực đại và không có điểm cực tiểu.],
    [Có 1 điểm cực tiểu và 2 điểm cực đại.],
    True([Có 1 điểm cực đại và 2 điểm cực tiểu.]),
    [Không có cực trị.],
  ),
  loigiai: [
    #step[Khảo sát hàm bậc 4 trùng phương]
    $y' = 4x^3 - 4x = 4x(x^2 - 1)$. $y' = 0 <=> x=0, x=+-1$.
    Hệ số $a = 1 > 0$ nên đồ thị có dạng chữ W, tức là có 1 điểm cực đại ($x=0$) và 2 điểm cực tiểu ($x=+-1$).
  ]
)

#tn(
  [Đạo hàm của hàm số $y=f(x)$ là $f'(x) = x(x-1)^2(x+2)^3$. Hàm số $y=f(x)$ có bao nhiêu điểm cực trị?],
  (
    [1],
    True([2]),
    [3],
    [4],
  ),
  loigiai: [
    #step[Đếm nghiệm lẻ của đạo hàm]
    Phương trình $f'(x)=0$ có các nghiệm $x=0$ (nghiệm đơn), $x=1$ (nghiệm bội chẵn 2), $x=-2$ (nghiệm bội lẻ 3).
    Chỉ có 2 nghiệm lẻ là $x=0$ và $x=-2$ làm đạo hàm đổi dấu nên hàm số có 2 điểm cực trị.
  ]
)

#tn(
  [Hàm số $y = f(x)$ có bảng biến thiên:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $1$, $+oo$),
      d-signs: ($+$, $||$, $+$),
      v-vals: ($-oo$, ($+oo$, $-oo$), $+oo$),
    )
  ]
  Mệnh đề nào sau đây đúng?],
  (
    [Hàm số có điểm cực đại là $x=1$.],
    [Hàm số nghịch biến trên tập xác định.],
    [Hàm số đồng biến trên $RR \\ {1}$.],
    True([Hàm số đồng biến trên các khoảng $( -oo; 1 )$ và $( 1; +oo )$.]),
  ),
  loigiai: [
    #step[Đọc bảng biến thiên]
    Hàm số không xác định tại $x=1$ nên không có cực trị tại đó. Đạo hàm luôn dương nên hàm đồng biến trên các khoảng $( -oo; 1 )$ và $( 1; +oo )$. (Cách viết đồng biến trên $RR \\ {1}$ là sai).
  ]
)

#tn(
  [Tìm tất cả các giá trị thực của tham số $m$ để hàm số $y = -1/3 x^3 + m x^2 - 4x + 1$ nghịch biến trên $RR$.],
  (
    [$-2 < m < 2$],
    True([$-2 <= m <= 2$]),
    [$m >= 2$],
    [$m <= -2$],
  ),
  loigiai: [
    #step[Điều kiện nghịch biến trên $RR$]
    $y' = -x^2 + 2m x - 4$. Để hàm số nghịch biến trên $RR$ thì $y' <= 0, forall x in RR$.
    $<=> Delta' = m^2 - 4 <= 0 <=> -2 <= m <= 2$.
  ]
)

#tn(
  [Cho hàm số $y=f(x)$ có đồ thị như hình vẽ.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (3, 0), mark: (end: ">"))
      content((3, -0.3), [$x$])
      line((0, -2), (0, 3), mark: (end: ">"))
      content((-0.3, 3), [$y$])
      content((-0.3, -0.3), [$O$])
      
      let pts = range(-22, 23).map(x => {
        let nx = x / 10
        let ny = (nx * nx * nx) / 3 - nx
        (nx, ny)
      })
      line(..pts, stroke: blue + 1.2pt)
      
      circle((1, -2/3), radius: 0.05, fill: black)
      circle((-1, 2/3), radius: 0.05, fill: black)
      content((1, -1), [$1$])
      content((-1, 1), [$-1$])
    })
  ]
  Hàm số đồng biến trên khoảng nào?],
  (
    [$(-1; 1)$],
    True([$(1; +oo)$]),
    [$(0; +oo)$],
    [$(-oo; 1)$],
  ),
  loigiai: [
    #step[Quan sát đồ thị]
    Đồ thị đi lên trên các khoảng $(-oo; -1)$ và $(1; +oo)$.
    Nên hàm số đồng biến trên khoảng $(1; +oo)$.
  ]
)

#tn(
  [Tìm tọa độ điểm cực đại của đồ thị hàm số $y = -x^4 + 2x^2 + 2$.],
  (
    [$(0; 2)$],
    [$(1; 3)$],
    [$( -1; 3 )$],
    True([$( -1; 3 )$ và $(1; 3)$]),
  ),
  loigiai: [
    #step[Tìm cực trị hàm trùng phương]
    $y' = -4x^3 + 4x = -4x(x^2 - 1) = 0 <=> x=0, x=+-1$.
    Do hệ số $a < 0$, đồ thị dạng chữ M, có hai điểm cực đại là $x=+-1$.
    Tại $x=+-1$, $y = -1 + 2 + 2 = 3$. Vậy tọa độ là $(-1; 3)$ và $(1; 3)$.
  ]
)

#exam-part(
  [Phần II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
)

#ds(
  [Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $-1$, $3$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$),
      v-vals: ($-oo$, $4$, $-2$, $+oo$),
    )
  ]
  Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số nghịch biến trên khoảng $(-oo; -1)$.],
    True([Hàm số đồng biến trên khoảng $(3; +oo)$.]),
    True([Điểm cực tiểu của đồ thị hàm số là $(3; -2)$.]),
    [Giá trị cực đại của hàm số là $-1$.],
  ),
  loigiai: [
    #step[Phân tích bảng biến thiên]
    a) Sai, trên $(-oo; -1)$ hàm số đồng biến.
    b) Đúng, trên $(3; +oo)$ đạo hàm mang dấu dương.
    c) Đúng, điểm cực tiểu của đồ thị là $(3; -2)$.
    d) Sai, giá trị cực đại là $y = 4$.
  ]
)

#ds(
  [Cho hàm số $y = (x^2 - 2x + 2)/(x - 1)$. Xét tính đúng sai của các mệnh đề:],
  (
    [Tập xác định của hàm số là $RR$.],
    True([Hàm số có hai điểm cực trị.]),
    True([Hàm số đạt cực đại tại $x = 0$.]),
    True([Điểm cực tiểu của đồ thị hàm số là $(2; 2)$.]),
  ),
  loigiai: [
    #step[Tính đạo hàm và khảo sát]
    a) Tập xác định là $RR \\ {1}$. Mệnh đề sai.
    b) $y' = ((2x-2)(x-1) - (x^2-2x+2))/(x-1)^2 = (x^2 - 2x)/(x-1)^2$.
    $y' = 0 <=> x=0, x=2$. Hàm số có 2 điểm cực trị. Đúng.
    c) $x=0$ làm đạo hàm đổi dấu từ dương sang âm nên là điểm cực đại. Đúng.
    d) Tại $x=2$, $y = (4 - 4 + 2)/(1) = 2$. Vậy điểm cực tiểu của đồ thị là $(2; 2)$. Đúng.
  ]
)

#ds(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x(x+1)(x-2)^2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số nghịch biến trên khoảng $( -1; 2 )$.],
    True([Hàm số đồng biến trên khoảng $( 0; +oo )$.]),
    True([Hàm số đạt cực đại tại $x = -1$.]),
    [Hàm số có 3 điểm cực trị.],
  ),
  loigiai: [
    #step[Lập bảng xét dấu đạo hàm]
    Nghiệm của $f'(x) = 0$ là $x = 0$, $x = -1$, $x = 2$.
    Trong đó $x = 2$ là nghiệm kép (đạo hàm không đổi dấu), còn $x=0$ và $x=-1$ là nghiệm đơn.
    Dấu của $f'(x)$: trên $( -oo; -1 )$ là dương, trên $( -1; 0 )$ là âm, trên $( 0; 2 )$ là dương, trên $( 2; +oo )$ là dương.
    a) Sai, hàm số nghịch biến trên $(-1; 0)$ thôi, trên $(0; 2)$ đồng biến.
    b) Đúng, trên $(0; +oo)$ thì $f'(x) >= 0$.
    c) Đúng, $x = -1$ đạo hàm chuyển từ dương sang âm nên là cực đại.
    d) Sai, chỉ có 2 cực trị.
  ]
)

#ds(
  [Cho đồ thị hàm số $y = f(x)$ như hình bên. 
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (3, 0), mark: (end: ">"))
      line((0, -3), (0, 3), mark: (end: ">"))
      
      let pts = range(-22, 23).map(x => {
        let nx = x / 10
        let ny = (nx * nx * nx) / 3 - nx
        (nx, ny)
      })
      line(..pts, stroke: red + 1.2pt)
      
      circle((1, -2/3), radius: 0.05, fill: black)
      circle((-1, 2/3), radius: 0.05, fill: black)
      content((1, 0.3), [$1$])
      content((-1, -0.3), [$-1$])
    })
  ]
  Xét tính đúng sai của các mệnh đề đối với hàm số $g(x) = f(x) + x$ (Biết đạo hàm của $f(x)$ tại $x=0$ là $-1$, tức là đồ thị $f'(0)=-1$ và $f'(x)$ là tam thức bậc hai):], // wait, making inference from the plot
  ( // maybe too hard for lesson 1. Let's change the question slightly
    True([Hàm số $f(x)$ đồng biến trên $(1; +oo)$.]),
    True([Giá trị cực đại của $f(x)$ dương.]),
    [Hàm số $f(x)$ không có giá trị cực tiểu.],
    [Hàm số $f(x)$ nghịch biến trên $(-oo; -1)$.],
  ),
  loigiai: [
    #step[Nhận xét đồ thị]
    Từ đồ thị ta thấy:
    a) Đồ thị đi lên trên $(1; +oo)$, nên đồng biến. Đúng.
    b) Điểm cực đại có hoành độ $x=-1$, tung độ lớn hơn 0. Đúng.
    c) Hàm số có điểm cực tiểu tại $x=1$. Sai.
    d) Trên $(-oo; -1)$ đồ thị đi lên nên đồng biến. Sai.
  ]
)

#exam-part(
  [Phần III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
)

#tln(
  [Tìm giá trị nguyên nhỏ nhất của tham số $m$ để hàm số $y = x^3 - 3m x^2 + 3(m+2)x - 1$ đồng biến trên $RR$.],
  [$-1$],
  loigiai: [
    #step[Sử dụng điều kiện đồng biến]
    Ta có $y' = 3x^2 - 6m x + 3(m+2) = 3(x^2 - 2m x + m + 2)$.
    Để hàm số đồng biến trên $RR$ thì $y' >= 0, forall x in RR$.
    $<=> Delta' = m^2 - (m+2) <= 0 <=> m^2 - m - 2 <= 0 <=> -1 <= m <= 2$.
    Giá trị nguyên nhỏ nhất là $m = -1$.
  ]
)

#tln(
  [Cho hàm số $y = f(x)$ có bảng biến thiên:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $1$, $3$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$),
      v-vals: ($+oo$, $-2$, $4$, $-oo$),
    )
  ]
  Có bao nhiêu giá trị nguyên dương của tham số $m$ để phương trình $f(x) = m$ có 3 nghiệm phân biệt?],
  [$3$],
  loigiai: [
    #step[Biện luận số nghiệm theo đồ thị]
    Phương trình $f(x) = m$ có 3 nghiệm phân biệt khi và chỉ khi đường thẳng $y=m$ cắt đồ thị tại 3 điểm phân biệt.
    Dựa vào bảng biến thiên, điều kiện là $-2 < m < 4$.
    Các giá trị nguyên dương của $m$ là: $1, 2, 3$. Có tất cả 3 giá trị.
  ]
)

#tln(
  [Hàm số $y = -x^4 + 2x^2 + 3$ có tất cả bao nhiêu điểm cực trị?],
  [$3$],
  loigiai: [
    #step[Tính đạo hàm]
    $y' = -4x^3 + 4x = -4x(x^2 - 1)$. $y' = 0 <=> x=0, x=1, x=-1$.
    Hàm số có 3 điểm cực trị.
  ]
)

#tln(
  [Bình phương khoảng cách giữa hai điểm cực trị của đồ thị hàm số $y = -x^3 + 3x + 1$ là bao nhiêu?],
  [$20$],
  loigiai: [
    #step[Tìm tọa độ điểm cực trị]
    Ta có $y' = -3x^2 + 3 = 0 <=> x = 1$ hoặc $x = -1$.
    Với $x = -1 => y = 1 - 3 + 1 = -1$, ta có điểm cực tiểu $A(-1; -1)$.
    Với $x = 1 => y = -1 + 3 + 1 = 3$, ta có điểm cực đại $B(1; 3)$.
    #step[Tính bình phương khoảng cách]
    $A B^2 = (1 - (-1))^2 + (3 - (-1))^2 = 2^2 + 4^2 = 4 + 16 = 20$.
  ]
)

#tln(
  [Tổng bình phương các tọa độ của điểm cực tiểu của đồ thị hàm số $y = x^3 - 3x^2 + 2$ là bao nhiêu?],
  [$8$],
  loigiai: [
    #step[Tìm điểm cực tiểu]
    $y' = 3x^2 - 6x = 3x(x - 2) = 0 <=> x=0, x=2$.
    Từ bảng xét dấu, hàm số đạt cực đại tại $x=0$, cực tiểu tại $x=2$.
    Khi $x=2$, $y = 2^3 - 3(2^2) + 2 = -2$.
    Tọa độ điểm cực tiểu là $(2; -2)$.
    Tổng bình phương tọa độ: $2^2 + (-2)^2 = 4 + 4 = 8$.
  ]
)

#tln(
  [Cho hàm số $y = (x^2 - x + 4)/(x - 1)$. Tính tổng các điểm cực trị của hàm số.],
  [$2$],
  loigiai: [
    #step[Khảo sát hàm phân thức]
    Tập xác định: $D = RR \\ {1}$.
    Đạo hàm $y' = ((2x-1)(x-1) - (x^2-x+4))/(x-1)^2 = (2x^2 - 3x + 1 - x^2 + x - 4)/(x-1)^2 = (x^2 - 2x - 3)/(x-1)^2$.
    $y' = 0 <=> x = -1$ hoặc $x = 3$.
    Tổng các điểm cực trị là $(-1) + 3 = 2$.
  ]
)

