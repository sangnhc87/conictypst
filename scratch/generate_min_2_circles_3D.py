import math

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
        CHUYÊN ĐỀ: CỰC TRỊ KHOẢNG CÁCH HAI ĐƯỜNG TRÒN TRONG 3D
      ]
      #v(0.3em)
      #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
        Các Cấu hình Đặc biệt & Mô hình Thực tế
      ]
    ],
  )
]

== A. BẢN CHẤT TOÁN HỌC & CÁC CẤU HÌNH ĐẶC BIỆT

Trong không gian $O x y z$, bài toán tìm khoảng cách ngắn nhất giữa hai điểm $M in (C_1)$ và $N in (C_2)$ tổng quát là một bài toán tối ưu hóa phức tạp. Tuy nhiên, trong chương trình Toán phổ thông, chúng ta sẽ khảo sát 4 cấu hình đặc biệt thông dụng nhất, thường được mô hình hóa từ các chi tiết máy, quỹ đạo vệ tinh hoặc kiến trúc 3D.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    *1. Hai đường tròn đồng phẳng*
    - Khi $(C_1)$ và $(C_2)$ cùng nằm trên một mặt phẳng $(P)$.
    - Bài toán quy về hình học phẳng cơ bản:
      $ M N_(min) = |J_1 J_2 - (R_1 + R_2)| $
      *(Nếu hai đường tròn ngoài nhau).*
  ],
  [
    *2. Hai mặt phẳng song song đồng trục*
    - Trục của $(C_1)$ đi qua tâm của $(C_2)$. Khoảng cách giữa 2 mặt phẳng là $d$.
    - Lấy hình chiếu tâm, ta đưa về tam giác vuông:
      $ M N_(min) = sqrt(d^2 + (R_1 - R_2)^2) $
  ]
)
#v(1em)
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    *3. Hai mặt phẳng trực giao (Vuông góc)*
    - Ví dụ $(C_1)$ nằm trên $z=0$, $(C_2)$ nằm trên $x=0$.
    - Đưa về dạng tổng 2 bình phương độc lập, dùng hằng đẳng thức để đánh giá giá trị nhỏ nhất.
  ],
  [
    *4. Đoạn vuông góc chung*
    - Khi tâm $J_1$ và tâm $J_2$ liên kết với nhau bằng một đoạn thẳng vuông góc với cả hai mặt phẳng. Khi đó đoạn $J_1 J_2$ chính là hình chiếu trung gian.
  ]
)

#chapter([Hệ thống bài tập phân loại mức độ (Thực tiễn & Hình học hóa)])
"""

def get_uv(A, B, C):
    if abs(A) >= abs(B) and abs(A) >= abs(C):
        u = (-B, A, 0) if A != 0 else (0, 0, 1)
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

def draw_2_circles_cetz(J1, R1, P1, J2, R2, P2, M_pt=None, N_pt=None, scale=0.3):
    A1, B1, C1, D1 = P1
    u1, v1 = get_uv(A1, B1, C1)
    
    A2, B2, C2, D2 = P2
    u2, v2 = get_uv(A2, B2, C2)
    
    # Generate circle points in 3D
    circle_pts1 = []
    circle_pts2 = []
    for deg in range(0, 361, 5):
        rad = math.radians(deg)
        pt1 = (
            J1[0] + R1 * math.cos(rad) * u1[0] + R1 * math.sin(rad) * v1[0],
            J1[1] + R1 * math.cos(rad) * u1[1] + R1 * math.sin(rad) * v1[1],
            J1[2] + R1 * math.cos(rad) * u1[2] + R1 * math.sin(rad) * v1[2]
        )
        circle_pts1.append(pt1)
        
        pt2 = (
            J2[0] + R2 * math.cos(rad) * u2[0] + R2 * math.sin(rad) * v2[0],
            J2[1] + R2 * math.cos(rad) * u2[1] + R2 * math.sin(rad) * v2[1],
            J2[2] + R2 * math.cos(rad) * u2[2] + R2 * math.sin(rad) * v2[2]
        )
        circle_pts2.append(pt2)
        
    pts_str1 = ", ".join([f"prj({p[0]}, {p[1]}, {p[2]})" for p in circle_pts1])
    pts_str2 = ", ".join([f"prj({p[0]}, {p[1]}, {p[2]})" for p in circle_pts2])
    
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
    
    let J1 = prj({J1[0]}, {J1[1]}, {J1[2]})
    let J2 = prj({J2[0]}, {J2[1]}, {J2[2]})
    
    // (C1)
    let pw1 = {max(R1 * 1.5, 5)}
    let p1_1 = prj({J1[0]} - pw1*{u1[0]} - pw1*{v1[0]}, {J1[1]} - pw1*{u1[1]} - pw1*{v1[1]}, {J1[2]} - pw1*{u1[2]} - pw1*{v1[2]})
    let p1_2 = prj({J1[0]} + pw1*{u1[0]} - pw1*{v1[0]}, {J1[1]} + pw1*{u1[1]} - pw1*{v1[1]}, {J1[2]} + pw1*{u1[2]} - pw1*{v1[2]})
    let p1_3 = prj({J1[0]} + pw1*{u1[0]} + pw1*{v1[0]}, {J1[1]} + pw1*{u1[1]} + pw1*{v1[1]}, {J1[2]} + pw1*{u1[2]} + pw1*{v1[2]})
    let p1_4 = prj({J1[0]} - pw1*{u1[0]} + pw1*{v1[0]}, {J1[1]} - pw1*{u1[1]} + pw1*{v1[1]}, {J1[2]} - pw1*{u1[2]} + pw1*{v1[2]})
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    let pts1 = ({pts_str1})
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(J1, radius: 1.5pt, fill: black)
    content(J1, [$J_1$], anchor: "north", padding: 3pt)
    
    // (C2)
    let pw2 = {max(R2 * 1.5, 5)}
    let p2_1 = prj({J2[0]} - pw2*{u2[0]} - pw2*{v2[0]}, {J2[1]} - pw2*{u2[1]} - pw2*{v2[1]}, {J2[2]} - pw2*{u2[2]} - pw2*{v2[2]})
    let p2_2 = prj({J2[0]} + pw2*{u2[0]} - pw2*{v2[0]}, {J2[1]} + pw2*{u2[1]} - pw2*{v2[1]}, {J2[2]} + pw2*{u2[2]} - pw2*{v2[2]})
    let p2_3 = prj({J2[0]} + pw2*{u2[0]} + pw2*{v2[0]}, {J2[1]} + pw2*{u2[1]} + pw2*{v2[1]}, {J2[2]} + pw2*{u2[2]} + pw2*{v2[2]})
    let p2_4 = prj({J2[0]} - pw2*{u2[0]} + pw2*{v2[0]}, {J2[1]} - pw2*{u2[1]} + pw2*{v2[1]}, {J2[2]} - pw2*{u2[2]} + pw2*{v2[2]})
    line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    
    let pts2 = ({pts_str2})
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(J1, J2, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
"""
    if M_pt and N_pt:
        code += f"""
    let M = prj({M_pt[0]}, {M_pt[1]}, {M_pt[2]})
    let N = prj({N_pt[0]}, {N_pt[1]}, {N_pt[2]})
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))
"""
    code += "  })"
    return code

def generate_mod1():
    # L1: Parallel & Concentric. C1 on z=0, center (0,0,0), r=8. C2 on z=15, center (0,0,15), r=4
    stmt = """(Bậc 1) Bên trong một hộp số ô tô, hai bánh răng hình tròn được lắp song song đồng trục. Bánh răng lớn $(C_1)$ nằm trên mặt phẳng $z=0$, có phương trình $x^2 + y^2 = 64$. Bánh răng nhỏ $(C_2)$ nằm trên mặt phẳng $z=15$, có phương trình $x^2 + y^2 = 16$. Tìm khoảng cách ngắn nhất giữa hai viền ngoài của hai bánh răng?"""
    sol = """#ppgiai[
  - $(C_1)$ có tâm $J_1(0; 0; 0)$, bán kính $R_1 = 8$, nằm trên mặt phẳng $z=0$.
  - $(C_2)$ có tâm $J_2(0; 0; 15)$, bán kính $R_2 = 4$, nằm trên mặt phẳng $z=15$.
  - Hai đường tròn này có chung trục đối xứng $O z$ (do cùng tâm tọa độ $x, y$).
]
*Bước 1:* Vì hai đường tròn nằm trên 2 mặt phẳng song song và đồng trục, ta xét mặt cắt chứa trục đối xứng (ví dụ mặt phẳng $x O z$ hoặc $y O z$).

*Bước 2:* Dựng thiết diện qua trục, $(C_1)$ trở thành một đoạn thẳng có độ dài $2 R_1 = 16$, $(C_2)$ là một đoạn thẳng độ dài $2 R_2 = 8$. Khoảng cách giữa hai mặt phẳng là $d = 15$.
Đoạn ngắn nhất $M N$ nối mép của hai bánh răng tạo thành cạnh huyền của tam giác vuông có hai cạnh góc vuông là $d = 15$ và chênh lệch bán kính $(R_1 - R_2) = 8 - 4 = 4$.

*Bước 3:* Khoảng cách cực tiểu:
$ M N_(min) = sqrt(d^2 + (R_1 - R_2)^2) = sqrt(15^2 + 4^2) = sqrt(225 + 16) = sqrt(241). $"""
    fig = draw_2_circles_cetz((0,0,0), 8, (0,0,1,0), (0,0,15), 4, (0,0,1,-15), (8,0,0), (4,0,15))
    return stmt, "[$sqrt(241)$]", sol, fig

def generate_mod2():
    # L2: Coplanar. C1 on z=0, center (0,0,0), r=3. C2 on z=0, center (12,5,0), r=4
    stmt = """(Bậc 2) Hai thiết bị không người lái chạy trên hai quỹ đạo tròn cùng nằm trên một cánh đồng phẳng $(O x y)$. Quỹ đạo thiết bị thứ nhất $(C_1): x^2 + y^2 = 9$. Quỹ đạo thiết bị thứ hai $(C_2): (x-12)^2 + (y-5)^2 = 16$. Trong quá trình di chuyển, khoảng cách gần nhất giữa hai thiết bị là bao nhiêu?"""
    sol = """#ppgiai[
  - $(C_1)$ tâm $J_1(0; 0; 0)$, bán kính $R_1 = 3$, nằm trên mặt phẳng $z=0$.
  - $(C_2)$ tâm $J_2(12; 5; 0)$, bán kính $R_2 = 4$, nằm trên mặt phẳng $z=0$.
]
*Bước 1:* Vì hai đường tròn đồng phẳng, bài toán trở thành tìm khoảng cách ngắn nhất giữa hai đường tròn trong mặt phẳng $O x y$.

*Bước 2:* Khoảng cách giữa hai tâm:
$ J_1 J_2 = sqrt(12^2 + 5^2) = 13. $

*Bước 3:* Nhận thấy $J_1 J_2 = 13 > R_1 + R_2 = 3 + 4 = 7$, nên hai đường tròn nằm ngoài nhau không giao cắt. Khoảng cách ngắn nhất là đoạn thẳng nối hai tâm trừ đi hai bán kính:
$ M N_(min) = J_1 J_2 - R_1 - R_2 = 13 - 3 - 4 = 6. $"""
    # M and N on the line connecting J1 and J2. Unit vector is (12/13, 5/13, 0).
    u = (12/13, 5/13, 0)
    M = (3 * u[0], 3 * u[1], 0)
    N = (12 - 4 * u[0], 5 - 4 * u[1], 0)
    fig = draw_2_circles_cetz((0,0,0), 3, (0,0,1,0), (12,5,0), 4, (0,0,1,0), M, N)
    return stmt, "[6]", sol, fig

def generate_mod3():
    # L3: Orthogonal planes. C1 on z=0, center(0,0,0), r=3. C2 on x=0, center(0,4,8), r=5.
    stmt = """(Bậc 3) Tại một công trường giao cắt không gian 3 chiều, một bệ đỡ tròn $(C_1): x^2 + y^2 = 9, z=0$ nằm ngang. Một bánh xe công tác khổng lồ tròn $(C_2)$ được đặt thẳng đứng trên mặt phẳng $x=0$, phương trình là $(y-4)^2 + (z-8)^2 = 25$. Tìm khoảng cách nhỏ nhất giữa mép bệ đỡ và mép lốp bánh xe?"""
    sol = """#ppgiai[
  - $(C_1)$ tâm $J_1(0; 0; 0)$, bán kính $R_1 = 3$, thuộc mặt phẳng $z=0$. Một điểm $M in (C_1)$ có tọa độ $M(3cos a; 3sin a; 0)$.
  - $(C_2)$ tâm $J_2(0; 4; 8)$, bán kính $R_2 = 5$, thuộc mặt phẳng $x=0$. Một điểm $N in (C_2)$ có tọa độ $N(0; 4 + 5cos b; 8 + 5sin b)$.
]
*Bước 1:* Tính bình phương khoảng cách $M N^2$:
$ M N^2 = (0 - 3cos a)^2 + (4 + 5cos b - 3sin a)^2 + (8 + 5sin b - 0)^2 $
$ M N^2 = 9cos^2 a + 16 + 25cos^2 b + 9sin^2 a + 40cos b - 24sin a - 30sin a cos b + 64 + 25sin^2 b + 80sin b $
Chú ý $9cos^2 a + 9sin^2 a = 9$ và $25cos^2 b + 25sin^2 b = 25$. Suy ra:
$ M N^2 = 9 + 16 + 25 + 64 + 40cos b + 80sin b - 24sin a - 30sin a cos b $
Tuy nhiên, cách biến đổi lượng giác trên khá dài và phức tạp (nhiều biến).

*Cách tiếp cận hình học khôn ngoan:*
- Điểm $M(x_1; y_1; 0)$ thỏa $x_1^2 + y_1^2 = 9$.
- Điểm $N(0; y_2; z_2)$ thỏa $(y_2 - 4)^2 + (z_2 - 8)^2 = 25$.
- Ta có $M N^2 = x_1^2 + (y_1 - y_2)^2 + z_2^2 = (x_1^2 + y_1^2) - 2y_1 y_2 + y_2^2 + z_2^2 = 9 - 2y_1 y_2 + y_2^2 + z_2^2$.
- Lại có $y_2^2 + z_2^2 = 25 - 16 - 64 + 8y_2 + 16z_2 = 8y_2 + 16z_2 - 55$. (Phức tạp không kém).

*Nhận xét cấu hình:* Cả 2 đường tròn $(C_1)$ và $(C_2)$ đều có trục đi qua $(0; 0; 0)$ và $(0; 4; 8)$. Giao tuyến của 2 mặt phẳng $z=0$ và $x=0$ là trục $O y$. Ta nhận thấy $M N_(min)$ xảy ra khi $M, N$ nằm trên mặt phẳng $y O z$ (tức $x=0$).
Khi đó $M$ thuộc $(C_1)$ mà có $x=0$ thì $M$ có tọa độ $(0; 3; 0)$ hoặc $(0; -3; 0)$.
Lấy $M(0; 3; 0)$. Khoảng cách từ $M$ đến tâm $J_2(0; 4; 8)$ của $(C_2)$:
$ M J_2 = sqrt((0-0)^2 + (4-3)^2 + (8-0)^2) = sqrt(1 + 64) = sqrt(65). $
Vì khoảng cách lớn hơn bán kính $R_2 = 5$, nên khoảng cách cực tiểu từ $M$ đến $N in (C_2)$ là:
$ M N_(min) = M J_2 - R_2 = sqrt(65) - 5. $
Thử với điểm $M(0; -3; 0)$: $M J_2 = sqrt((4 - (-3))^2 + 8^2) = sqrt(49 + 64) = sqrt(113) > sqrt(65)$.
Vậy khoảng cách nhỏ nhất chính là $sqrt(65) - 5$.
"""
    fig = draw_2_circles_cetz((0,0,0), 3, (0,0,1,0), (0,4,8), 5, (1,0,0,0), (0,3,0), (0, 4 - 5*1/math.sqrt(65), 8 - 5*8/math.sqrt(65)))
    return stmt, "[$sqrt(65) - 5$]", sol, fig


def generate_all():
    output = get_typst_header()
    
    models = [
        generate_mod1, generate_mod2, generate_mod3
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
    with open("typst/exams/CD-min-2-DuongTron-3D.typ", "w", encoding="utf-8") as f:
        f.write(content)
    print("Generated CD-min-2-DuongTron-3D.typ successfully!")
