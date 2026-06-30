#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.equation: set text(fill: black)
#show math.equation.where(block: true): it => math.display(it.body)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 1",
  exam-title: "CHƯƠNG 1. LƯỢNG GIÁC (ĐỀ SỐ 03)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part(
  [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.],
  count: 12,
)

// TN 1
#tn([Hai bánh xe có bán kính lần lượt là $R_1 = 10 " cm"$ và $R_2 = 25 " cm"$ được nối với nhau bằng một dây curoa (không trượt). 
#align(center)[
      #cetz.canvas({
    import cetz.draw: *
    // Wheels
    circle((-2, 0), radius: 1, name: "c1", fill: luma(230), stroke: 2pt + luma(100))
    circle((3, 0), radius: 2.5, name: "c2", fill: luma(230), stroke: 2pt + luma(100))
    
    // Belt wrap
    arc((-2.3, 0.954), start: 107.5deg, stop: 252.5deg, radius: 1, stroke: 2pt + blue)
    arc((2.25, -2.385), start: 252.5deg, stop: 467.5deg, radius: 2.5, stroke: 2pt + blue)

    // Belt lines
    line((-2.3, 0.954), (2.25, 2.385), stroke: 2pt + blue)
    line((-2.3, -0.954), (2.25, -2.385), stroke: 2pt + blue)
    
    // Pulleys details
    circle((-2, 0), radius: 0.2, fill: white, stroke: 1.5pt)
    circle((3, 0), radius: 0.5, fill: white, stroke: 1.5pt)
    circle((3, 0), radius: 2.1, stroke: 1pt + luma(150))
    for i in range(8) {
      let angle = i * 45deg
      line((3 + 0.5 * calc.cos(angle), 0.5 * calc.sin(angle)), 
           (3 + 2.1 * calc.cos(angle), 2.1 * calc.sin(angle)), stroke: 2pt + luma(150))
    }
    
    // Centers
    circle((-2, 0), radius: 0.1, fill: black)
    circle((3, 0), radius: 0.1, fill: black)
    
    // Radii
    line((-2, 0), (-2, -1), stroke: (dash: "dashed", thickness: 1pt))
    line((3, 0), (3, -2.5), stroke: (dash: "dashed", thickness: 1pt))
    content((-2.5, -0.5), [$R_1$])
    content((3.5, -1.25), [$R_2$])
  })
]
Khi bánh xe nhỏ quay được $5$ vòng thì góc quay của bánh xe lớn (tính bằng radian) là],
    (
        [$2pi$],
        True([$4pi$]),
        [$10pi$],
        [$12.5pi$]
    ),
    loigiai: [
        Góc quay của bánh xe nhỏ là $alpha_1 = 5 dot 2pi = 10pi$ (rad).

        Quãng đường di chuyển của một điểm trên vành bánh xe nhỏ là $S = R_1 alpha_1 = 10 dot 10pi = 100pi$ (cm).

        Do dây không trượt nên quãng đường di chuyển của vành bánh xe lớn cũng là $S$.

        Góc quay của bánh xe lớn là $alpha_2 = S / R_2 = (100pi)/25 = 4pi$ (rad).
    ]
)

// TN 2
#tn([Trái Đất quay một vòng quanh trục của nó mất khoảng $24$ giờ. 
#align(center)[
      #cetz.canvas({
    import cetz.draw: *
    
    // Tilted coordinate system to make it look 3D
    group(name: "earth", {
      // 3D sphere gradient
      circle((0, 0), radius: 1.5, fill: gradient.radial(white, blue, center: (30%, 30%), radius: 100%), stroke: none)
      
      // Rotate for the axis tilt (23.5 degrees)
      rotate(-23.5deg)
      
      // Equator
      arc((-1.5, 0), start: 180deg, stop: 360deg, radius: (1.5, 0.3), stroke: (dash: "dashed", paint: white))
      arc((1.5, 0), start: 0deg, stop: 180deg, radius: (1.5, 0.3), stroke: 1pt + white)
      
      // Latitude lines
      arc((-1.2, 0.9), start: 180deg, stop: 360deg, radius: (1.2, 0.24), stroke: (dash: "dashed", paint: white))
      arc((1.2, 0.9), start: 0deg, stop: 180deg, radius: (1.2, 0.24), stroke: 0.5pt + white)
      
      arc((-1.2, -0.9), start: 180deg, stop: 360deg, radius: (1.2, 0.24), stroke: (dash: "dashed", paint: white))
      arc((1.2, -0.9), start: 0deg, stop: 180deg, radius: (1.2, 0.24), stroke: 0.5pt + white)

      // Longitude lines
      arc((0, -1.5), start: -90deg, stop: 90deg, radius: (0.5, 1.5), stroke: 0.5pt + white)
      arc((0, -1.5), start: 90deg, stop: 270deg, radius: (0.5, 1.5), stroke: (dash: "dashed", paint: white))
      
      arc((0, -1.5), start: -90deg, stop: 90deg, radius: (1.0, 1.5), stroke: 0.5pt + white)
      arc((0, -1.5), start: 90deg, stop: 270deg, radius: (1.0, 1.5), stroke: (dash: "dashed", paint: white))

      // Axis
      line((0, 1.5), (0, 2.5), stroke: 2pt + red)
      line((0, -2.5), (0, -1.5), stroke: 2pt + red)
      
      // Rotation arrow
      arc((-0.7, 2.0), start: 180deg, stop: -20deg, radius: (0.7, 0.2), mark: (end: ">"), stroke: 1.5pt + orange)
    })
    content((0, -2.8), [Trái Đất])
  })
]
Tốc độ góc của Trái Đất tự quay xấp xỉ bằng bao nhiêu rad/s?],
    (
        [$pi/12$],
        [$pi/4320$],
        True([$pi/43200$]),
        [$pi/86400$]
    ),
    loigiai: [
        Chu kì tự quay của Trái Đất là $T = 24$ giờ $= 24 dot 3600 = 86400$ (giây).
        
        Tốc độ góc là $omega = (2pi) / T = (2pi) / 86400 = pi/43200$ (rad/s).
    ]
)

// TN 3
#tn([Một người bình thường khi nghỉ ngơi có nhịp thở là $15$ lần mỗi phút. Thể tích không khí trong phổi của người đó biến thiên theo một hàm số lượng giác theo thời gian.
#align(center)[
    #cetz.canvas({
    import cetz.draw: *
    grid((-0.5, -0.5), (6, 3), step: 1, stroke: (dash: "dotted", paint: luma(200)))
    line((-0.5, 0), (6, 0), mark: (end: ">"), stroke: 1.5pt, name: "t")
    line((0, -0.5), (0, 3), mark: (end: ">"), stroke: 1.5pt, name: "V")
    content((5.8, -0.3), [$t$ (s)])
    content((-0.4, 2.8), [$V$ (L)])
    let pts = range(0, 101).map(i => {
      let t = i / 100 * 6
      let y = 1.5 + 1.0 * calc.sin(90deg * t)
      (t, y)
    })
    line(..pts, stroke: 2pt + blue)
  })
]
Chu kì dao động của hàm số đó (tính bằng giây) là],
    (
        [$15$],
        [$1/4$],
        [$2$],
        True([$4$])
    ),
    loigiai: [
        Người đó thở $15$ lần trong $1$ phút ($60$ giây). 
        
        Thời gian của một lần hít thở (một chu kì dao động) là $T = 60 / 15 = 4$ (giây).
    ]
)

// TN 4
#tn([Một dao động sóng âm có phương trình áp suất theo thời gian là $P(t) = 0.05 cos(440pi t - pi/3)$ (Pascal), với $t$ tính bằng giây. Biên độ dao động của áp suất sóng âm này là],
    (
        [$440pi$ Pa],
        [$0.1$ Pa],
        True([$0.05$ Pa]),
        [$-pi/3$ Pa]
    ),
    loigiai: [
        Hàm số $P(t) = A cos(omega t + phi)$ có biên độ là $A$.
        
        Do đó, biên độ dao động của sóng âm là $A = 0.05$ (Pa).
    ]
)

// TN 5
#tn([Nhiệt độ ngoài trời $T$ (tính bằng $""^circ C$) vào ngày thứ $t$ trong năm tại một thành phố ôn đới được mô phỏng bởi hàm số $T(t) = 15 + 10 sin((2pi)/365 (t - 80))$. Nhiệt độ đạt cực đại vào khoảng ngày thứ bao nhiêu trong năm?],
    (
        [$80$],
        [$171$],
        True([$171.25$]),
        [$262$]
    ),
    loigiai: [
        Nhiệt độ đạt cực đại khi 
        $
          sin((2pi)/365 (t - 80)) = 1 <=> (2pi)/365 (t - 80) = pi/2 + k 2pi
        $
.
        
        Nghiệm dương nhỏ nhất ($k=0$) là: 
        $
          t - 80 = 365/4 <=> t = 80 + 91.25 = 171.25
        $
.
    ]
)

// TN 6
#tn([Trong một động cơ đốt trong, khoảng cách $x$ (cm) từ đỉnh của piston đến tâm trục khuỷu biến thiên theo phương trình $x(t) = 15 + 4 cos(100pi t)$. 
#align(center)[
    #cetz.canvas({
    import cetz.draw: *
    // Cylinder
    line((-1.2, 0), (-1.2, 4), stroke: 2pt)
    line((1.2, 0), (1.2, 4), stroke: 2pt)
    line((-1.2, 4), (1.2, 4), stroke: 2pt)
    
    // Piston
    rect((-1.1, 1.5), (1.1, 2.5), fill: rgb("dddddd"), stroke: 1.5pt)
    // Connecting rod
    line((0, 1.5), (0.5, -1), stroke: 2pt + gray)
    circle((0, 1.5), radius: 0.15, fill: black)
    // Crankshaft
    circle((0, -1.5), radius: 1, stroke: 1pt + red)
    line((0, -1.5), (0.5, -1), stroke: 2pt + blue)
    circle((0, -1.5), radius: 0.15, fill: black)
    circle((0.5, -1), radius: 0.15, fill: black)
    content((2.5, 2), [Piston])
    content((2.5, -1.5), [Trục khuỷu])
  })
]
Quãng đường lớn nhất piston di chuyển được giữa hai vị trí biên trong xilanh (còn gọi là hành trình piston) là],
    (
        [$15$ cm],
        [$4$ cm],
        True([$8$ cm]),
        [$19$ cm]
    ),
    loigiai: [
        Giá trị lớn nhất của $x$ là $x_max = 15 + 4 = 19$.
        
        Giá trị nhỏ nhất của $x$ là $x_min = 15 - 4 = 11$.
        
        Quãng đường di chuyển giữa hai vị trí biên là $x_max - x_min = 19 - 11 = 8$ (cm). (Hành trình piston bằng $2$ lần biên độ $2A$).
    ]
)

// TN 7
#tn([Tập xác định của hàm số $y = tan(2x - pi/4)$ là],
    (
        [$RR setminus {pi/2 + k pi, k in ZZ}$],
        [$RR setminus {pi/4 + k pi/2, k in ZZ}$],
        True([$RR setminus {3pi/8 + k pi/2, k in ZZ}$]),
        [$RR setminus {3pi/8 + k pi, k in ZZ}$]
    ),
    loigiai: [
        Điều kiện: 
        $
          cos(2x - pi/4) != 0 <=> 2x - pi/4 != pi/2 + k pi
        $
.
        
        
        $
          <=> 2x != (3pi)/4 + k pi <=> x != (3pi)/8 + (k pi)/2 (k in ZZ)
        $
.
    ]
)

// TN 8
#tn([Chu kì dao động của hàm số $y = 5 sin(x/3) + 2$ là],
    (
        [$pi/3$],
        [$2pi/3$],
        True([$6pi$]),
        [$3pi$]
    ),
    loigiai: [
        Hàm số $y = a sin(b x) + c$ có chu kì là $T = (2pi)/|b|$.
        
        Ở đây $b = 1/3$, suy ra $T = (2pi) / (1/3) = 6pi$.
    ]
)

// TN 9
#tn([Một dao động tổng hợp có li độ $y(t) = 3 sin(omega t) + 4 cos(omega t)$. Biên độ của dao động tổng hợp này là],
    (
        [$7$],
        [$1$],
        True([$5$]),
        [$12$]
    ),
    loigiai: [
        Hàm số có dạng $y = a sin X + b cos X = sqrt(a^2+b^2) cos(X - phi)$.
        
        Biên độ tổng hợp là $A = sqrt(3^2 + 4^2) = sqrt(25) = 5$.
    ]
)

// TN 10
#tn([Trong hệ thống điện lưới quốc gia, điện áp tức thời được cho bởi $u(t) = 220sqrt(2) cos(100pi t + pi/4)$ (V). Tần số của dòng điện này là bao nhiêu Hz?],
    (
        [$100pi$],
        [$100$],
        True([$50$]),
        [$60$]
    ),
    loigiai: [
        Tần số góc $omega = 100pi$ (rad/s).
        
        Tần số của dòng điện là $f = omega / (2pi) = (100pi) / (2pi) = 50$ (Hz).
    ]
)

// TN 11
#tn([Nhiệt độ cơ thể của một người thay đổi theo nhịp sinh học trong ngày và được mô hình bởi hàm $N(t) = 37 + 0.5 cos((pi)/12 (t-15))$, với $t$ là số giờ tính từ nửa đêm ($0 <= t <= 24$). Thời điểm nhiệt độ cơ thể người đó xuống thấp nhất trong ngày là lúc mấy giờ?],
    (
        [$15$ giờ],
        [$21$ giờ],
        True([$3$ giờ]),
        [$9$ giờ]
    ),
    loigiai: [
        Nhiệt độ thấp nhất khi 
        $
          cos((pi)/12 (t-15)) = -1 <=> (pi)/12 (t-15) = pi <=> t - 15 = 12 <=> t = 27
        $
.
        
        Vì chu kì là $24$ giờ nên thời điểm tương đương trong ngày là $t = 27 - 24 = 3$ giờ sáng.
    ]
)

// TN 12
#tn([Số nghiệm của phương trình $2 sin(x) - 1 = 0$ trên khoảng $(0; 3pi)$ là],
    (
        [$2$],
        [$3$],
        True([$4$]),
        [$5$]
    ),
    loigiai: [
        Ta có 
        $
          2 sin(x) - 1 = 0 <=> sin(x) = 1/2 <=> x = pi/6 + k 2pi
        $
 hoặc $x = (5pi)/6 + k 2pi$.
        
        Với họ $x = pi/6 + k 2pi$, trên $(0; 3pi)$ có các nghiệm $x = pi/6 (k=0)$ và $x = 13pi/6 (k=1)$.
        
        Với họ $x = (5pi)/6 + k 2pi$, trên $(0; 3pi)$ có các nghiệm $x = (5pi)/6 (k=0)$ và $x = 17pi/6 (k=1)$.
        
        Tổng cộng có $4$ nghiệm.
    ]
)

#exam-part(
  [PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
  count: auto,
)

// DS 1
#ds(
    [Mô hình số giờ ánh sáng mặt trời trong ngày tại một khu vực ở vĩ độ $45^circ$ Bắc được biểu diễn bởi hàm số $H(t) = 12 + 4 sin((2pi)/365(t - 80))$, trong đó $t$ là ngày thứ $t$ trong năm ($t = 1$ tương ứng với ngày 1 tháng 1). 
#align(center)[
    #cetz.canvas({
    import cetz.draw: *
    grid((-0.5, -0.5), (9, 4.5), step: (1, 1), stroke: (dash: "dotted", paint: luma(200)))
    line((-0.5, 0), (9, 0), mark: (end: ">"), stroke: 1.5pt)
    line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 1.5pt)
    content((8.7, -0.4), [$t$ (ngày)])
    content((-0.6, 4.3), [$H$ (giờ)])
    
    for i in (2, 4, 6, 8) {
      let t_val = i * 45.625
      line((i, -0.1), (i, 0.1))
      content((i, -0.4), [#calc.round(t_val)])
    }
    for i in (1, 2, 3, 4) {
      let h_val = 8 + i * 2
      line((-0.1, i), (0.1, i))
      content((-0.4, i), [#h_val])
    }
    content((-0.3, -0.3), [$O$])
    
    let pts = range(0, 401).map(i => {
      let t_plot = i / 400 * 9
      let h_plot = (12 + 4 * calc.sin(360deg / 365 * (t_plot * 45.625 - 80)) - 8) / 2
      (t_plot, h_plot)
    })
    line(..pts, stroke: 2pt + orange)
  })
]    
    Các phát biểu sau đây đúng hay sai?], (
        True([Trong $365$ ngày của năm đầu tiên ($1 <= t <= 365$), có đúng $2$ ngày số giờ ánh sáng mặt trời là $12$ giờ.]),
        True([Thời điểm khu vực này đạt số giờ nắng nhỏ nhất là ngày thứ $353$ hoặc $354$ trong năm.]),
        [Trong khoảng thời gian từ đầu năm đến hết ngày thứ $100$ ($1 <= t <= 100$), phương trình $H(t) = 14$ có $2$ nghiệm.],
        [Tổng các nghiệm của phương trình $H(t) = 12$ trong khoảng $(0; 365]$ là $445$.]
    ), 
    loigiai: [
        - *a)* Đúng. Yêu cầu phương trình 
        $
          H(t) = 12 <=> sin((2pi)/365(t - 80)) = 0 <=> (2pi)/365(t - 80) = k pi <=> t = 80 + 182.5 k
        $
. Trong đoạn $[1; 365]$, 
        $
          k=0 => t=80
        $
 và 
        $
          k=1 => t=262.5
        $
. Do $t$ là ngày, có 2 ngày lân cận $262$ và $263$, nên số nghiệm chính xác phụ thuộc vào việc tính tròn ngày. Trên thực tế có đúng $2$ thời điểm đạt $12$ giờ.
        - *b)* Đúng. $H(t)$ đạt cực tiểu khi 
        $
          sin((2pi)/365(t - 80)) = -1 <=> (2pi)/365(t - 80) = -pi/2 <=> t - 80 = -365/4 <=> t = 80 - 91.25 = -11.25
        $
. Cộng $1$ chu kì $365$, ta có $t = 353.75$.
        - *c)* Sai. 
        $
          H(t) = 14 <=> sin((2pi)/365(t - 80)) = 1/2 <=> (2pi)/365(t - 80) = pi/6 + k 2pi
        $
 hoặc $(2pi)/365(t - 80) = (5pi)/6 + k 2pi$.
        - Góc 
        $
          pi/6 => t = 80 + 365/12 approx 110.4 > 100
        $
.
        - Góc 
        $
          (5pi)/6 => t = 80 + (5 dot 365)/12 approx 232 > 100
        $
.
        Vậy trong khoảng $[1; 100]$, phương trình $H(t) = 14$ vô nghiệm.
        - *d)* Sai. Hai nghiệm trong khoảng $(0; 365]$ là $t_1 = 80$ và $t_2 = 262.5$. Tổng hai nghiệm là $80 + 262.5 = 342.5 != 445$.
    ]
)

// DS 2
#ds(
    [Trong một khu bảo tồn, số lượng của quần thể cáo (kẻ săn mồi) biến động theo mô hình $F(t) = 100 + 40 sin((pi t)/6)$ (cá thể), với $t$ là thời gian (tháng, $t >= 0$). 
#align(center)[
    #cetz.canvas({
    import cetz.draw: *
    grid((-0.5, -0.5), (6, 3), step: (1, 1), stroke: (dash: "dotted", paint: luma(200)))
    line((-0.5, 0), (6, 0), mark: (end: ">"), stroke: 1.5pt)
    line((0, -0.5), (0, 3), mark: (end: ">"), stroke: 1.5pt)
    content((5.8, -0.3), [$t$ (tháng)])
    content((-0.6, 2.8), [$F$ (cá thể)])
    
    for i in (1, 2, 3, 4, 5) {
      line((i, -0.1), (i, 0.1))
      content((i, -0.4), [#calc.round(i*5)])
    }
    for i in (1, 2) {
      let y_val = i * 60
      line((-0.1, i), (0.1, i))
      content((-0.4, i), [#y_val])
    }
    
    let pts = range(0, 301).map(i => {
      let t = i / 300 * 6
      let y = (100 + 40 * calc.sin(30deg * t * 5)) / 60
      (t, y)
    })
    line(..pts, stroke: 2pt + red)
  })
]    
    Các phát biểu sau đây đúng hay sai?], (
        True([Trong $12$ tháng đầu tiên ($0 <= t <= 12$), phương trình $F(t) = 140$ có đúng $1$ nghiệm.]),
        [Có chính xác $3$ thời điểm trong vòng $2$ năm ($0 <= t <= 24$) số lượng cáo đạt mức trung bình $100$ cá thể.],
        True([Nghiệm lớn nhất của phương trình $F(t) = 60$ trên đoạn $[0; 12]$ là $t = 9$ (tháng).]),
        True([Tổng các nghiệm của phương trình $F(t) = 120$ trên khoảng $[0; 12]$ bằng $6$.])
    ), 
    loigiai: [
        - *a)* Đúng. 
        $
          F(t) = 140 <=> sin((pi t)/6) = 1 <=> (pi t)/6 = pi/2 + k 2pi <=> t = 3 + 12k
        $
. Với $t in [0; 12]$, chỉ có nghiệm $t = 3$.
        - *b)* Sai. 
        $
          F(t) = 100 <=> sin((pi t)/6) = 0 <=> (pi t)/6 = k pi <=> t = 6k
        $
. Trên $[0; 24]$, $k in {0, 1, 2, 3, 4}$, tức là có $5$ thời điểm ($t = 0, 6, 12, 18, 24$).
        - *c)* Đúng. 
        $
          F(t) = 60 <=> sin((pi t)/6) = -1 <=> (pi t)/6 = (3pi)/2 + k 2pi <=> t = 9 + 12k
        $
. Trên $[0; 12]$, nghiệm duy nhất và lớn nhất là $t = 9$.
        - *d)* Đúng. 
        $
          F(t) = 120 <=> sin((pi t)/6) = 1/2 <=> (pi t)/6 = pi/6 + k 2pi
        $
 hoặc $(pi t)/6 = (5pi)/6 + k 2pi$.
        Suy ra $t = 1 + 12k$ hoặc $t = 5 + 12k$. Trên $[0; 12]$ có hai nghiệm $t_1 = 1$, $t_2 = 5$. Tổng là $1 + 5 = 6$.
    ]
)

// DS 3
#ds(
    [Một quả lắc đồng hồ dao động điều hoà, góc lệch $alpha$ (rad) của dây treo so với phương thẳng đứng tại thời điểm $t$ (giây) được cho bởi $alpha(t) = 0.1 cos(pi t + pi/3)$. Các phát biểu sau đúng hay sai?], (
        True([Trong khoảng thời gian $1$ giây đầu tiên ($0 <= t <= 1$), phương trình $alpha(t) = 0$ có đúng $1$ nghiệm.]),
        True([Nghiệm nhỏ nhất của phương trình $alpha(t) = -0.1$ (đạt biên âm) là $t = 2/3$ (giây).]),
        [Tổng các nghiệm của phương trình $alpha(t) = 0.05$ trên đoạn $[0; 2]$ bằng $2$.],
        True([Thời gian ngắn nhất để con lắc di chuyển từ vị trí cân bằng đến biên dương là $0.5$ giây.])
    ), 
    loigiai: [
        - *a)* Đúng. 
        $
          alpha(t) = 0 <=> cos(pi t + pi/3) = 0 <=> pi t + pi/3 = pi/2 + k pi <=> t = 1/6 + k
        $
. Với $0 <= t <= 1$, ta được 
        $
          k = 0 => t = 1/6
        $
. Có đúng $1$ nghiệm.
        - *b)* Đúng. 
        $
          alpha(t) = -0.1 <=> cos(pi t + pi/3) = -1 <=> pi t + pi/3 = pi + k 2pi <=> t = 2/3 + 2k
        $
. Nghiệm dương nhỏ nhất là $t = 2/3$.
        - *c)* Sai. 
        $
          alpha(t) = 0.05 <=> cos(pi t + pi/3) = 1/2 <=> pi t + pi/3 = pi/3 + k 2pi
        $
 hoặc $pi t + pi/3 = -pi/3 + k 2pi$.
        $t = 2k$ hoặc $t = -2/3 + 2k$. Trên $[0; 2]$ có các nghiệm $t = 0, t = 2, t = 4/3$. Tổng $= 0 + 2 + 4/3 = 10/3$.
        - *d)* Đúng. Chu kì dao động là $T = (2pi)/pi = 2$ giây. Khoảng thời gian từ VTCB đến biên dương là $T/4 = 0.5$ giây.
    ]
)

// DS 4
#ds(
    [Nhu cầu tiêu thụ điện năng của một thành phố được mô hình hoá bởi $P(t) = 50 + 20 cos((pi)/12 (t - 18))$ (Megawatt), với $t$ là số giờ tính từ nửa đêm ($0 <= t <= 24$). Các phát biểu sau đúng hay sai?], (
        True([Nghiệm của phương trình $P(t) = 70$ trên $[0; 24]$ là thời điểm thành phố tiêu thụ nhiều điện nhất.]),
        True([Phương trình $P(t) = 40$ có đúng $2$ nghiệm trong đoạn $[0; 24]$.]),
        [Tổng các nghiệm của phương trình $P(t) = 50$ trên đoạn $[0; 24]$ là $24$.],
        [Nghiệm lớn nhất của phương trình $P(t) = 30$ trên đoạn $[0; 24]$ là $t = 24$.]
    ), 
    loigiai: [
        - *a)* Đúng. Giá trị lớn nhất của $P(t)$ là $50 + 20 = 70$. Do đó nghiệm của $P(t) = 70$ chính là thời điểm tiêu thụ cực đại.
        - *b)* Đúng. 
        $
          P(t) = 40 <=> cos((pi)/12 (t - 18)) = -1/2
        $
. Do $t in [0; 24]$ nên độ dài là đúng 1 chu kì $T = 24$. Một phương trình $cos X = a (a in (-1; 1))$ luôn có $2$ nghiệm trên $1$ chu kì.
        - *c)* Sai. 
        $
          P(t) = 50 <=> cos((pi)/12 (t - 18)) = 0 <=> (pi)/12 (t - 18) = pi/2 + k pi <=> t = 24 + 12k <=> t = 12 (k=-1)
        $
 hoặc $t = 24 (k=0)$ hoặc $t = 0 (k=-2)$. Trong đoạn $[0; 24]$ có $3$ nghiệm $0, 12, 24$. Tổng là $36$.
        - *d)* Sai. 
        $
          P(t) = 30 <=> cos((pi)/12 (t - 18)) = -1 <=> (pi)/12 (t - 18) = pi + k 2pi <=> t - 18 = 12 + 24k <=> t = 30 + 24k <=> t = 6 (k=-1)
        $
. Nghiệm duy nhất trên $[0; 24]$ là $t=6$. Không phải $t=24$.
    ]
)

#exam-part(
  [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.],
  count: 6,
)

// TLN 1
#tln([Một bánh xe ô tô có bán kính $R = 40$ cm. Bánh xe lăn không trượt trên mặt đường thẳng. Khi bánh xe quay được một góc $300^circ$ thì tâm bánh xe đã di chuyển được một đoạn đường dài bao nhiêu cm? (Làm tròn kết quả đến hàng đơn vị, lấy $pi approx 3.14$).],
    [209],
    loigiai: [
        Đổi góc quay ra radian: $alpha = 300^circ = 300 dot pi / 180 = (5pi)/3$ (rad).
        
        Đoạn đường tâm bánh xe di chuyển bằng đúng độ dài cung tròn mà vành bánh xe đã lăn được.
        
        $S = R alpha = 40 dot (5pi)/3 = (200pi)/3 approx (200 dot 3.14)/3 = 628 / 3 approx 209.33$ (cm).
        
        Làm tròn đến hàng đơn vị ta được $209$.
    ]
)

// TLN 2
#tln([Cho điện áp xoay chiều $u = 220sqrt(2) cos(100pi t)$ (V) (với $t$ tính bằng giây). Kể từ thời điểm $t=0$, thời điểm đầu tiên điện áp bằng $0$ là $1/a$ giây. Hãy tìm giá trị của số tự nhiên $a$.],
    [200],
    loigiai: [
        Điện áp bằng 0 khi 
        $
          u = 0 <=> cos(100pi t) = 0 <=> 100pi t = pi/2 + k pi
        $
.
        
        
        $
          <=> t = 1/200 + k / 100
        $
.
        
        Thời điểm đầu tiên ($t > 0$) ứng với $k = 0$, ta có $t = 1/200$ (giây).
        
        Vậy $a = 200$.
    ]
)

// TLN 3
#tln([Chiều cao mực nước tại một bến cảng được cho bởi $h(t) = 10 + 4 cos((pi t)/6)$ (mét), với $t$ là số giờ tính từ nửa đêm ($0 <= t <= 24$). Một tàu chở hàng có mớn nước là $11$ m (phần chìm dưới nước) chỉ có thể cập cảng an toàn khi khoảng cách từ đáy tàu đến đáy bến cảng ít nhất là $1$ m, tức là mực nước $h(t)$ phải lớn hơn hoặc bằng $12$ m. Trong một ngày (24 giờ), tổng số giờ tàu có thể ra vào cảng an toàn là bao nhiêu?],
    [8],
    loigiai: [
        Điều kiện để tàu cập cảng an toàn: 
        $
          h(t) >= 12 <=> 10 + 4 cos((pi t)/6) >= 12 <=> cos((pi t)/6) >= 1/2
        $
.
        
        Chu kì của mực nước là $T = (2pi) / (pi/6) = 12$ giờ. Trong 1 ngày $24$ giờ có đúng $2$ chu kì.
        
        Trên một chu kì từ $[-6; 6]$, giải bất phương trình $cos((pi t)/6) >= 1/2$ ta được 
        $
          -(pi)/3 <= (pi t)/6 <= pi/3 <=> -2 <= t <= 2
        $
.
        
        Khoảng thời gian thỏa mãn trong $1$ chu kì là từ $t = -2$ đến $t = 2$, độ dài là $4$ tiếng.
        
        Do một ngày có $2$ chu kì, nên tổng thời gian an toàn là $4 dot 2 = 8$ tiếng.
    ]
)

// TLN 4
#tln([Tính tổng các nghiệm (tính bằng radian) của phương trình $sin x + sqrt(3) cos x = 1$ trên đoạn $[0; 2pi]$. Làm tròn kết quả đến $2$ chữ số thập phân (lấy $pi approx 3.14$).],
    [7,33],
    loigiai: [
        Phương trình tương đương: 
        $
          1/2 sin x + sqrt(3)/2 cos x = 1/2 <=> cos(x - pi/6) = 1/2
        $
.
        
        
        $
          <=> x - pi/6 = pi/3 + k 2pi
        $
 hoặc $x - pi/6 = -pi/3 + k 2pi$.
        
        
        $
          <=> x = pi/2 + k 2pi
        $
 hoặc $x = -pi/6 + k 2pi$.
        
        Xét trên đoạn $[0; 2pi]$:
        - Với $x = pi/2 + k 2pi$, nghiệm duy nhất là $x_1 = pi/2$.
        - Với $x = -pi/6 + k 2pi$, nghiệm duy nhất là $x_2 = -pi/6 + 2pi = (11pi)/6$.
        
        Tổng các nghiệm là $S = pi/2 + (11pi)/6 = (14pi)/6 = (7pi)/3$.
        
        Thay $pi approx 3.14$, ta được $S approx (7 dot 3.14) / 3 = 21.98 / 3 approx 7.326...$. Làm tròn $2$ chữ số thập phân được $7,33$.
    ]
)

// TLN 5
#tln([Một vệ tinh bay quanh Trái Đất có quỹ đạo coi như đường tròn. Độ cao $h$ (km) của vệ tinh so với mặt đất sau $t$ phút kể từ lúc bắt đầu quan sát được tính bằng $h(t) = 400 + 50 sin((pi t)/45)$. Trong vòng $180$ phút quan sát đầu tiên ($0 <= t <= 180$), có bao nhiêu lần vệ tinh đạt độ cao đúng $450$ km?],
    [2],
    loigiai: [
        Để độ cao đạt $450$ km, ta có phương trình: 
        $
          400 + 50 sin((pi t)/45) = 450 <=> sin((pi t)/45) = 1
        $
.
        
        
        $
          <=> (pi t)/45 = pi/2 + k 2pi <=> t/45 = 1/2 + 2k <=> t = 22.5 + 90k (k in ZZ)
        $
.
        
        Vì $0 <= t <= 180$, suy ra 
        $
          0 <= 22.5 + 90k <= 180 <=> -0.25 <= k <= 1.75
        $
.
        
        Do $k in ZZ$, ta có $k = 0$ và $k = 1$.
        
        Vậy có $2$ lần vệ tinh đạt độ cao $450$ km.
    ]
)

// TLN 6
#tln([Cho hàm số $y = 3 sin(2x) - 4 cos(2x)$. Gọi $M$ là giá trị lớn nhất, $m$ là giá trị nhỏ nhất của hàm số. Tính giá trị của biểu thức $T = M - m$.],
    [10],
    loigiai: [
        Hàm số có dạng $y = a sin X + b cos X$.
        
        Ta có điều kiện có nghiệm của phương trình $a sin X + b cos X = y$ là $a^2 + b^2 >= y^2$.
        
        Suy ra 
        $
          3^2 + (-4)^2 >= y^2 <=> y^2 <= 25 <=> -5 <= y <= 5
        $
.
        
        Giá trị lớn nhất $M = 5$, giá trị nhỏ nhất $m = -5$.
        
        Vậy $T = M - m = 5 - (-5) = 10$.
    ]
)

]

#make-questions()
