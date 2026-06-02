import math
import random

def get_typst_header():
    return """#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *

#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm),
)
#set text(font: "New Computer Modern", size: 10pt, lang: "vi")
#set par(justify: true, leading: 0.75em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 14pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.2em,
  below: 0.6em,
  text(fill: rgb("900C3F"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#let math-color = rgb("#000000") 
#show math.equation: set text(fill: math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
    [
      #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
        CHUYÊN ĐỀ: CỰC TRỊ KHOẢNG CÁCH MẶT CẦU - ĐƯỜNG TRÒN
      ]
      #v(0.3em)
      #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
        12 Mô hình Ứng dụng Thực tế & Hình học hóa 3D
      ]
    ],
  )
]

== A. BẢN CHẤT TOÁN HỌC & CÔNG THỨC GIẢI NHANH

Cho mặt cầu $(S)$ tâm $I$, bán kính $R_S$. Đường tròn $(C)$ tâm $J$, bán kính $R_C$ nằm trong mặt phẳng $(P)$.
Một điểm $M$ di động trên mặt cầu $(S)$, một điểm $N$ di động trên đường tròn $(C)$. Tìm khoảng cách nhỏ nhất giữa $M$ và $N$.

*Ý tưởng cốt lõi:* Chiếu tâm mặt cầu $I$ vuông góc xuống mặt phẳng $(P)$ chứa đường tròn $(C)$ để thu được hình chiếu $H$. Mọi khoảng cách đều được tính toán thông qua điểm trung gian $H$ này.

*Phân tích hình học:*
Theo bất đẳng thức tam giác với điểm $I, M, N$, ta có:
$ M N >= I N - I M = I N - R_S $
Do $R_S$ không đổi, $M N$ đạt giá trị nhỏ nhất khi và chỉ khi đoạn thẳng $I N$ đạt giá trị nhỏ nhất, đồng thời $I, M, N$ thẳng hàng (M nằm giữa I và N).

Gọi $H$ là hình chiếu vuông góc của tâm $I$ lên mặt phẳng $(P)$. Xét tam giác vuông $I H N$, theo định lý Pitago:
$ I N^2 = I H^2 + H N^2 $
Vì $I$ và $(P)$ cố định nên đoạn $I H = d(I, (P))$ không đổi. Để $I N$ nhỏ nhất thì $H N$ phải nhỏ nhất.
$H$ là điểm cố định nằm trên mặt phẳng $(P)$, còn $N$ là điểm di động trên đường tròn tâm $J$, bán kính $R_C$ cùng nằm trên mặt phẳng $(P)$. Khoảng cách ngắn nhất từ điểm $H$ đến đường tròn tâm $J$ chính là:
$ H N_(min) = |H J - R_C| $

#align(center)[
  #cetz.canvas(length: 0.4 * 1cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let alpha = -30 * 0.0174532925
      let beta = 20 * 0.0174532925
      let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
      let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
      let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
      (xp, ypp)
    }
    
    // Mặt phẳng P
    let p1 = prj(-6, -6, 0)
    let p2 = prj(6, -6, 0)
    let p3 = prj(6, 6, 0)
    let p4 = prj(-6, 6, 0)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    content(prj(5, 5, 0), text(fill: rgb("#0284c7"))[$(P)$], anchor: "south-west")
    
    // Đường tròn (C)
    let pts = ()
    for deg in range(0, 361, step: 5) { 
      let rad = deg * 0.0174532925
      pts.push(prj(4 * calc.cos(rad) - 2, 4 * calc.sin(rad), 0)) 
    }
    line(..pts, stroke: 1.2pt + rgb("#dc2626"))
    content(prj(2, 0, 0), text(fill: rgb("#dc2626"))[$(C)$], anchor: "west")
    let J = prj(-2, 0, 0)
    circle(J, radius: 1.5pt, fill: black)
    content(J, [$J$], anchor: "north", padding: 3pt)
    
    // Tâm I và Hình chiếu H
    let I = prj(3, 0, 7)
    let H = prj(3, 0, 0)
    circle(I, radius: 1.5pt, fill: black)
    content(I, [$I$], anchor: "south-west", padding: 3pt)
    circle(H, radius: 1.5pt, fill: black)
    content(H, [$H$], anchor: "north", padding: 3pt)
    
    line(I, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(H, J, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    
    // N (trên C)
    let N = prj(-2 + 4, 0, 0)
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "south-west", padding: 3pt)
    
    // QUẢ CẦU 3D ĐẸP TẠI I
    let r = 2.5
    circle(I, radius: r, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    circle(I, radius: (0.35 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle(I, radius: (0.7 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    arc((I.at(0) + r, I.at(1)), start: 0deg, stop: 180deg, radius: (r, 0.2 * r), stroke: (dash: "dashed", paint: rgb("#16a34a"), thickness: 1pt))
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, 0.2 * r), stroke: (paint: rgb("#16a34a"), thickness: 1pt))
    content(prj(3, 0, 9.8), text(fill: rgb("#16a34a"))[$(S)$], anchor: "south-west")
    
    // Điểm M
    let M = prj(3 - 0.71, 0, 7 - 2.4)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    
    // Đoạn thẳng
    line(I, N, stroke: 1.2pt + gray)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))
  })
]

*Từ đó ta suy ra công thức tổng quát (Siêu tốc):*
#rect(fill: rgb("fef2f2"), stroke: 1pt + rgb("ef4444"), inset: 8pt, radius: 4pt)[
  $ M N_(min) = sqrt(d^2 (I, (P)) + (|H J| - R_C)^2) - R_S $
]

#chapter([Hệ thống bài tập phân loại mức độ (Thực tiễn & Hình học hóa)])
"""

def solve_sphere_circle(I, RS, J, RC, P):
    A, B, C, D = P
    xI, yI, zI = I
    xJ, yJ, zJ = J
    
    dIP_num = abs(A*xI + B*yI + C*zI + D)
    dIP_den = math.sqrt(A**2 + B**2 + C**2)
    dIP = dIP_num / dIP_den
    
    t = -(A*xI + B*yI + C*zI + D) / (A**2 + B**2 + C**2)
    xH = xI + A*t
    yH = yI + B*t
    zH = zI + C*t
    H = (xH, yH, zH)
    
    HJ = math.sqrt((xH-xJ)**2 + (yH-yJ)**2 + (zH-zJ)**2)
    HN_min = abs(HJ - RC)
    IN_min = math.sqrt(dIP**2 + HN_min**2)
    MN_min = IN_min - RS
    
    return {
        'H': H, 'dIP': dIP, 'HJ': HJ, 'HN_min': HN_min, 'IN_min': IN_min, 'MN_min': MN_min
    }

def get_uv(A, B, C):
    if abs(A) >= abs(B) and abs(A) >= abs(C):
        u = (-B, A, 0) if A != 0 else (0, 0, 1) # A is max, so A!=0 unless all 0
    elif abs(B) >= abs(A) and abs(B) >= abs(C):
        u = (B, -A, 0)
    else:
        u = (0, -C, B)
    
    len_u = math.sqrt(u[0]**2 + u[1]**2 + u[2]**2)
    u = (u[0]/len_u, u[1]/len_u, u[2]/len_u)
    
    v = (B*u[2] - C*u[1], C*u[0] - A*u[2], A*u[1] - B*u[0])
    len_v = math.sqrt(v[0]**2 + v[1]**2 + v[2]**2)
    v = (v[0]/len_v, v[1]/len_v, v[2]/len_v)
    
    return u, v

def draw_cetz(I, J, RS, RC, P, scale=0.3):
    A, B, C, D = P
    u, v = get_uv(A, B, C)
    
    # Calculate H
    xI, yI, zI = I
    t = -(A*xI + B*yI + C*zI + D) / (A**2 + B**2 + C**2)
    H = (xI + A*t, yI + B*t, zI + C*t)
    
    # Generate circle points in 3D using J, RC, u, v
    circle_pts = []
    for deg in range(0, 361, 5):
        rad = math.radians(deg)
        pt = (
            J[0] + RC * math.cos(rad) * u[0] + RC * math.sin(rad) * v[0],
            J[1] + RC * math.cos(rad) * u[1] + RC * math.sin(rad) * v[1],
            J[2] + RC * math.cos(rad) * u[2] + RC * math.sin(rad) * v[2]
        )
        circle_pts.append(pt)
        
    pts_str = ", ".join([f"prj({p[0]}, {p[1]}, {p[2]})" for p in circle_pts])
    
    code = f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    let prj(x, y, z) = {{
      let alpha = -30 * 0.0174532925
      let beta = 20 * 0.0174532925
      let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
      let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
      let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
      (xp, ypp)
    }}
    
    let I = prj({I[0]}, {I[1]}, {I[2]})
    let J = prj({J[0]}, {J[1]}, {J[2]})
    let H = prj({H[0]}, {H[1]}, {H[2]})
    
    // Mặt phẳng (P) ảo (vẽ theo u, v)
    let pw = {max(RC * 1.5, 6)}
    let p1 = prj({H[0]} - pw*{u[0]} - pw*{v[0]}, {H[1]} - pw*{u[1]} - pw*{v[1]}, {H[2]} - pw*{u[2]} - pw*{v[2]})
    let p2 = prj({H[0]} + pw*{u[0]} - pw*{v[0]}, {H[1]} + pw*{u[1]} - pw*{v[1]}, {H[2]} + pw*{u[2]} - pw*{v[2]})
    let p3 = prj({H[0]} + pw*{u[0]} + pw*{v[0]}, {H[1]} + pw*{u[1]} + pw*{v[1]}, {H[2]} + pw*{u[2]} + pw*{v[2]})
    let p4 = prj({H[0]} - pw*{u[0]} + pw*{v[0]}, {H[1]} - pw*{u[1]} + pw*{v[1]}, {H[2]} - pw*{u[2]} + pw*{v[2]})
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // Đường tròn (C)
    let pts = ({pts_str})
    line(..pts, stroke: 1.2pt + rgb("#dc2626"))
    
    circle(J, radius: 1.5pt, fill: black)
    content(J, [$J$], anchor: "north", padding: 3pt)
    
    // Cầu (S) tại I
    let r = {RS}
    circle(I, radius: r, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    circle(I, radius: (0.35 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle(I, radius: (0.7 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    arc((I.at(0) + r, I.at(1)), start: 0deg, stop: 180deg, radius: (r, 0.2 * r), stroke: (dash: "dashed", paint: rgb("#16a34a"), thickness: 1pt))
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, 0.2 * r), stroke: (paint: rgb("#16a34a"), thickness: 1pt))
    
    circle(I, radius: 1.5pt, fill: black)
    content(I, [$I$], anchor: "south-west", padding: 3pt)
    
    circle(H, radius: 1.5pt, fill: black)
    content(H, [$H$], anchor: "north", padding: 3pt)
    line(I, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(H, J, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  }})"""
    return code

def generate_mod1_1():
    xI, yI, zI = 6, 8, 12
    RS = 2; RC = 4
    I = (xI, yI, zI); J = (0, 0, 0); P = (0, 0, 1, 0) 
    res = solve_sphere_circle(I, RS, J, RC, P)
    stmt = f"""(Bậc 1) Dưới đáy biển (được mô hình hóa bởi mặt phẳng tọa độ $O x y: z=0$), một trạm dò tìm quét một vùng vòng tròn giới hạn bởi phương trình $x^2 + y^2 = 16$. Trên mặt nước, một phao tiêu báo hiệu có dạng hình cầu $(S)$ với phương trình $(x-6)^2 + (y-8)^2 + (z-12)^2 = 4$. Tính khoảng cách ngắn nhất từ một điểm trên phao tiêu đến khu vực dò tìm của trạm (đơn vị mét)?"""
    sol = f"""#ppgiai[
  - Phao tiêu $(S)$ có tâm $I(6; 8; 12)$, bán kính $R_S = 2$.
  - Khu vực dò tìm là đường tròn $(C)$ tâm $J(0; 0; 0)$, bán kính $R_C = 4$, nằm trong $(O x y): z = 0$.
]
*Bước 1:* Hình chiếu vuông góc của tâm $I(6; 8; 12)$ lên mặt phẳng đáy biển $(O x y)$ là $H(6; 8; 0)$. Khoảng cách từ $I$ đến đáy biển: $I H = d(I, (O x y)) = 12$.
*Bước 2:* Khoảng cách từ $H(6; 8; 0)$ đến tâm $J(0; 0; 0)$ của đường tròn: $H J = 10$. Khoảng cách nhỏ nhất từ $H$ đến đường tròn $(C)$: $H N_(min) = |10 - 4| = 6$.
*Bước 3:* Áp dụng định lý Pitago: $I N_(min) = sqrt(12^2 + 6^2) = 6 sqrt(5)$. Khoảng cách cực tiểu: $M N_(min) = 6 sqrt(5) - 2$."""
    fig_code = draw_cetz(I, J, RS, RC, P, scale=0.3)
    return stmt, f"[{6 * math.sqrt(5) - 2:.2f}]", sol, fig_code

def generate_mod1_2():
    xI, yI, zI = 0, 15, 8
    RS = 3; RC = 7
    I = (xI, yI, zI); J = (0, 0, 0); P = (0, 0, 1, 0)
    res = solve_sphere_circle(I, RS, J, RC, P)
    stmt = f"""(Bậc 1) Một vệ tinh định vị hình cầu có phương trình $x^2 + (y-15)^2 + (z-8)^2 = 9$. Nó đang rà quét một hệ thống đĩa cảm biến viễn vọng hình tròn có phương trình $x^2 + y^2 = 49$ nằm trên mặt phẳng xích đạo $z=0$. Xác định khoảng cách ngắn nhất giữa vệ tinh và đĩa viễn vọng?"""
    sol = f"""#ppgiai[
  - Vệ tinh $(S)$ có tâm $I(0; 15; 8)$, bán kính $R_S = 3$.
  - Đĩa viễn vọng là đường tròn $(C)$ tâm $J(0; 0; 0)$, bán kính $R_C = 7$, nằm trên $z=0$.
]
*Bước 1:* Hình chiếu của $I(0; 15; 8)$ lên $z=0$ là $H(0; 15; 0)$. Khoảng cách là $I H = 8$.
*Bước 2:* Khoảng cách từ $H(0; 15; 0)$ đến tâm đĩa $J(0; 0; 0)$ là: $H J = 15$. Khoảng cách cực tiểu từ $H$ đến $(C)$: $H N_(min) = |15 - 7| = 8$.
*Bước 3:* Pitago: $I N_(min) = sqrt(8^2 + 8^2) = 8 sqrt(2)$. Khoảng cách cực tiểu: $M N_(min) = 8 sqrt(2) - 3$."""
    fig_code = draw_cetz(I, J, RS, RC, P, scale=0.3)
    return stmt, f"[{8 * math.sqrt(2) - 3:.2f}]", sol, fig_code

def generate_mod2_1():
    xI, yI, zI = 3, 4, 15
    RS = 5; J = (8, 16, 10); RC = 8; P = (0, 0, 1, -10)
    I = (xI, yI, zI)
    stmt = f"""(Bậc 2) Khinh khí cầu do thám dạng hình cầu $(S): (x-3)^2 + (y-4)^2 + (z-15)^2 = 25$ lơ lửng trên không trung. Flycam bay theo quỹ đạo là đường tròn $(C): (x-8)^2 + (y-16)^2 = 64, z=10$. Tìm khoảng cách ngắn nhất giữa flycam và khinh khí cầu?"""
    sol = f"""#ppgiai[
  - Khinh khí cầu $(S)$ tâm $I(3; 4; 15)$, bán kính $R_S = 5$.
  - Quỹ đạo flycam $(C)$ tâm $J(8; 16; 10)$, bán kính $R_C = 8$, thuộc mặt phẳng $z=10$.
]
*Bước 1:* Hình chiếu của $I$ lên $z=10$ là $H(3; 4; 10)$. Độ dài $I H = 5$.
*Bước 2:* Khoảng cách $H J = sqrt((8-3)^2 + (16-4)^2) = 13$. Độ lệch khoảng cách từ $H$ đến đường tròn $(C)$: $H N_(min) = |13 - 8| = 5$.
*Bước 3:* Pitago: $I N_(min) = sqrt(5^2 + 5^2) = 5 sqrt(2)$. Khoảng cách cực tiểu: $M N_(min) = 5 sqrt(2) - 5$."""
    fig_code = draw_cetz(I, J, RS, RC, P, scale=0.3)
    return stmt, f"[{5 * math.sqrt(2) - 5:.2f}]", sol, fig_code

def generate_mod2_2():
    xI, yI, zI = 12, 10, 5
    RS = 2; J = (3, -2, 0); RC = 7; P = (1, 0, 0, -3)
    I = (xI, yI, zI)
    stmt = f"""(Bậc 2) Bề mặt một tòa nhà được trang bị một hệ thống vòng đệm an toàn tròn $(C): (y+2)^2 + z^2 = 49$ nằm trên mặt kính $x = 3$. Một drone khảo sát $(S)$ có phương trình $(x-12)^2 + (y-10)^2 + (z-5)^2 = 4$. Tính khoảng cách tối thiểu giữa drone và vòng đệm?"""
    sol = f"""#ppgiai[
  - Drone $(S)$ tâm $I(12; 10; 5)$, bán kính $R_S = 2$.
  - Vòng đệm $(C)$ tâm $J(3; -2; 0)$, bán kính $R_C = 7$, thuộc mặt phẳng $x=3$.
]
*Bước 1:* Hình chiếu của $I$ lên mặt kính $x=3$ là $H(3; 10; 5)$. Khoảng cách: $I H = |12 - 3| = 9$.
*Bước 2:* Khoảng cách $H J = sqrt((10 - (-2))^2 + (5 - 0)^2) = 13$. Giá trị tối thiểu trên mặt kính: $H N_(min) = |13 - 7| = 6$.
*Bước 3:* Pitago: $I N_(min) = sqrt(9^2 + 6^2) = 3 sqrt(13)$. Khoảng cách cực tiểu: $M N_(min) = 3 sqrt(13) - 2$."""
    fig_code = draw_cetz(I, J, RS, RC, P, scale=0.3)
    return stmt, f"[{3 * math.sqrt(13) - 2:.2f}]", sol, fig_code

def generate_mod3_1():
    I = (8, 15, 24); RS = 4; J = (0, 0, 4); RC = 3; P = (0, 0, 1, -4)
    stmt = f"""(Bậc 3) Một hành tinh nhỏ dạng cầu $(S_1): x^2 + y^2 + z^2 = 25$ bị cắt bởi một mặt phẳng kiến tạo $z = 4$ tạo ra một miệng núi lửa hình tròn $(C)$. Một tàu trinh sát không gian dạng cầu $(S_2): (x-8)^2 + (y-15)^2 + (z-24)^2 = 16$. Tìm khoảng cách cực tiểu từ thân tàu vũ trụ đến vành của miệng núi lửa?"""
    sol = f"""#ppgiai[
  - Tàu trinh sát $(S_2)$ tâm $I(8; 15; 24)$, bán kính $R_S = 4$.
  - Miệng núi lửa là đường tròn $(C)$ giao tuyến của $(S_1)$ tâm $O(0;0;0)$ bán kính $R_1=5$ và mặt phẳng $z=4$.
]
*Bước 1:* Khoảng cách từ tâm $O$ đến mặt phẳng $z=4$ là $d = 4$.
Bán kính đường tròn $(C)$ là $R_C = sqrt(R_1^2 - d^2) = sqrt(25 - 16) = 3$. Tâm của $(C)$ là $J(0; 0; 4)$.
*Bước 2:* Hình chiếu của tâm tàu $I(8; 15; 24)$ lên $z=4$ là $H(8; 15; 4)$. Khoảng cách $I H = 20$.
Độ dài $H J = sqrt(8^2 + 15^2) = 17$. Khoảng cách cực tiểu: $H N_(min) = |17 - 3| = 14$.
*Bước 3:* Khoảng cách từ tâm tàu $I$ đến miệng núi lửa: $I N_(min) = sqrt(20^2 + 14^2) = 2 sqrt(149)$. Khoảng cách cực tiểu: $M N_(min) = 2 sqrt(149) - 4$."""
    fig_code = draw_cetz(I, J, RS, RC, P, scale=0.3)
    return stmt, f"[{2 * math.sqrt(149) - 4:.2f}]", sol, fig_code

def generate_mod4_1():
    I = (11, 14, 15); RS = 2; J = (2, 2, 2); RC = 5; P = (2, 2, -1, -6)
    stmt = f"""(Bậc 4) Một đĩa mặt trời nhân tạo thu năng lượng $(C)$ có tâm $J(2; 2; 2)$, bán kính $R_C = 5$ được lắp đặt nằm trên mặt dốc $(P): 2x + 2y - z - 6 = 0$. Một quả cầu trữ năng lượng $(S): (x-11)^2 + (y-14)^2 + (z-15)^2 = 4$ bay lơ lửng bên trên. Tìm độ dài đoạn cáp ngắn nhất kết nối quả cầu với viền của đĩa mặt trời?"""
    sol = f"""#ppgiai[
  - Quả cầu $(S)$ tâm $I(11; 14; 15)$, bán kính $R_S = 2$.
  - Đĩa mặt trời $(C)$ tâm $J(2; 2; 2)$, bán kính $R_C = 5$, thuộc $(P): 2x+2y-z-6=0$.
]
*Bước 1:* Tính khoảng cách vuông góc từ $I$ đến mặt dốc $(P)$:
$ I H = d(I, (P)) = (abs(2(11) + 2(14) - 15 - 6)) / 3 = 29/3. $
*Bước 2:* Đường thẳng qua $I$ vuông góc với $(P)$ có phương trình tham số $x = 11 + 2t, y = 14 + 2t, z = 15 - t$. Thay vào $(P)$ giải ra $t = -29/9$. Tọa độ hình chiếu $H(41/9; 68/9; 164/9)$.
Độ dài $H J = sqrt(24345) / 9 approx 17.33$.
Khoảng cách cực tiểu trên mặt dốc: $H N_(min) = |H J - 5|$.
*Bước 3:* Độ dài cáp ngắn nhất:
$ I N_(min) = sqrt(I H^2 + H N_(min)^2) = sqrt((29/3)^2 + (H J - 5)^2). $
$ M N_(min) = I N_(min) - 2. $"""
    fig_code = draw_cetz(I, J, RS, RC, P, scale=0.3)
    return stmt, f"[{math.sqrt((29/3)**2 + (math.sqrt(24345)/9 - 5)**2) - 2:.2f}]", sol, fig_code

def generate_mod5_1():
    I = (0, 12, 20); RS = 4; J = (3, 4, 5); RC = 10; P = (0, 0, 1, -5)
    stmt = f"""(Bậc 5) Vòng quay Mặt Trời (Sun Wheel) tại khu công viên có quỹ đạo của một cabin tuân theo phương trình tham số $x = 3 + 10 cos t, y = 4 + 10 sin t, z = 5$ (với $t in [0; 2pi]$). Một quả bóng bay khổng lồ dạng mặt cầu $(S): x^2 + (y-12)^2 + (z-20)^2 = 16$ bị vướng trên không trung. Bỏ qua kích thước cabin, tìm khoảng cách ngắn nhất giữa cabin và quả bóng bay?"""
    sol = f"""#ppgiai[
  - Quả bóng bay $(S)$ tâm $I(0; 12; 20)$, bán kính $R_S = 4$.
  - Quỹ đạo cabin chính là phương trình tham số của đường tròn $(C)$ tâm $J(3; 4; 5)$, bán kính $R_C = 10$, thuộc mặt phẳng $z=5$.
]
*Bước 1:* Hình chiếu tâm $I(0; 12; 20)$ lên mặt phẳng $z=5$ là $H(0; 12; 5)$. Khoảng cách $I H = |20 - 5| = 15$.
*Bước 2:* Độ dài đoạn $H J = sqrt((3-0)^2 + (4-12)^2) = sqrt(73)$.
Khoảng cách từ $H$ đến quỹ đạo $(C)$:
$ H N_(min) = |H J - R_C| = |sqrt(73) - 10| = 10 - sqrt(73) quad ("Vì " sqrt(73) approx 8.54 < 10). $
*Bước 3:* Khoảng cách từ $I$ đến cabin:
$ I N_(min) = sqrt(I H^2 + H N_(min)^2) = sqrt(15^2 + (10 - sqrt(73))^2) = sqrt(398 - 20sqrt(73)). $
Khoảng cách ngắn nhất cần tìm:
$ M N_(min) = sqrt(398 - 20sqrt(73)) - 4. $"""
    fig_code = draw_cetz(I, J, RS, RC, P, scale=0.3)
    return stmt, f"[{math.sqrt(398 - 20*math.sqrt(73)) - 4:.2f}]", sol, fig_code

def generate_mod6_1():
    I = (7, 0, 0); RS = 1; J = (0, 0, 4); RC = 4; P = (0, 0, 1, -4)
    stmt = f"""(Bậc 6) Một trạm vũ trụ nhỏ được neo tại một vị trí di động trên mặt cầu $(S): (x-m)^2 + y^2 + z^2 = 1$. Nó phải duy trì khoảng cách kết nối an toàn tối thiểu tới một vành đai vành khuyên $(C): x^2 + y^2 = 16, z=4$ (bỏ qua độ dày vành khuyên) đúng bằng $4$. Tìm giá trị thực dương của tham số $m$ để thỏa mãn hệ thống an toàn này?"""
    sol = f"""#ppgiai[
  - Mặt cầu $(S)$ tâm $I(m; 0; 0)$, bán kính $R_S = 1$.
  - Vành đai $(C)$ tâm $J(0; 0; 4)$, bán kính $R_C = 4$, nằm trên mặt phẳng $z=4$.
]
*Bước 1:* Hình chiếu của tâm $I(m; 0; 0)$ lên mặt phẳng $z=4$ là $H(m; 0; 4)$. Khoảng cách: $I H = 4$.
*Bước 2:* Khoảng cách $H J = sqrt(m^2) = m$ (vì $m > 0$). Khoảng cách từ $H$ đến vành đai $(C)$: $H N_(min) = |m - 4|$.
*Bước 3:* Lập phương trình khoảng cách ngắn nhất: $M N_(min) = sqrt(I H^2 + H N_(min)^2) - R_S = sqrt(16 + (m-4)^2) - 1$.
Theo bài toán, $M N_(min) = 4$:
$ sqrt(16 + (m-4)^2) - 1 = 4 <=> 16 + (m-4)^2 = 25 <=> (m-4)^2 = 9 $
Do đó $m - 4 = 3 => m = 7$ hoặc $m - 4 = -3 => m = 1$.
Vậy có hai giá trị thực dương của tham số là $m = 7$ và $m = 1$.
"""
    fig_code = draw_cetz(I, J, RS, RC, P, scale=0.3)
    return stmt, "[1; 7]", sol, fig_code

def generate_all():
    output = get_typst_header()
    
    models = [
        generate_mod1_1, generate_mod1_2,
        generate_mod2_1, generate_mod2_2,
        generate_mod3_1, generate_mod4_1,
        generate_mod5_1, generate_mod6_1
    ]
    
    for i, func in enumerate(models):
        stmt, ans, sol, fig = func()
        output += f"""
#tln(
  [{stmt}],
  {ans},
  fig: {fig},
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    {sol}
  ]
)
"""
    return output

if __name__ == "__main__":
    content = generate_all()
    with open("typst/exams/CD-min-MatCau-DuongTron-3D.typ", "w", encoding="utf-8") as f:
        f.write(content)
    print("Generated CD-min-MatCau-DuongTron-3D.typ successfully!")
