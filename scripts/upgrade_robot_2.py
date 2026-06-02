import re

with open('/Users/admin/conictypst/typst/exams/Cánh-Tay-Robot.typ', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Format #step[...] to #step[Bước X: ...] inside each loigiai
def process_loigiai(match):
    loigiai_content = match.group(1)
    
    # Split by #step[
    parts = loigiai_content.split('#step[')
    new_content = parts[0]
    
    step_count = 1
    for part in parts[1:]:
        # Extract the title of the step
        closing_idx = part.find(']')
        if closing_idx != -1:
            title = part[:closing_idx]
            rest = part[closing_idx:]
            
            # If it already has "Bước", don't add
            if title.startswith("Bước"):
                new_title = title
            else:
                new_title = f"Bước {step_count}: {title}"
            
            new_content += f"#step[{new_title}]{rest}"
            step_count += 1
        else:
            new_content += '#step[' + part
            
    return f'#loigiai[{new_content}]'

content = re.sub(r'#loigiai\[(.*?)\]', process_loigiai, content, flags=re.DOTALL)

# 2. Append the new Professor Vision section
prof_section = """
= Tầm Nhìn Giáo Sư: Các Bài Toán Robot Xoay Trục (Trend Mới Nhất)

#lythuyet[
  **Tại sao lại là Robot Xoay Trục?** 
  Nếu tay robot phẳng chỉ kiểm tra hình học tĩnh, thì robot xoay quanh một trục (Robot quay 3D) sẽ kiểm tra khả năng lập hàm số (Đạo hàm lượng giác) và khả năng nhìn nhận Khối tròn xoay (Nón, Cầu). Đây là ranh giới phân loại cực mạnh cho mức điểm 9.5 - 10 trong năm 2026.
]

== Bài Chế 1 — Robot Lắp Ráp Giới Hạn Góc Quay (Ứng Dụng Đạo Hàm Lượng Giác)

#tln(
  [Một cánh tay robot gắp linh kiện tại nhà máy được cố định tại gốc $O$. Khâu thứ nhất $O A$ có độ dài $3$ m, tạo với trục nằm ngang $O x$ một góc $\\alpha$. Khâu thứ hai $A B$ có độ dài $2$ m, tạo với khâu $O A$ một góc $\\beta$. Do vách ngăn an toàn, hệ thống lập trình ràng buộc góc quay: $\\alpha \\in [0; \\pi/3]$ và $\\beta = 2\\alpha$. Hãy tính khoảng cách xa nhất theo phương ngang (hình chiếu của $B$ lên trục $O x$) mà vòi gắp có thể vươn tới (làm tròn đến hàng phần trăm).],
  [5.00],
  fig: align(center)[
    #cetz.canvas(length: 1.0cm, {
      import cetz.draw: *
      let o = (0, 0)
      let x = (6, 0)
      
      grid((-1,-1), (6, 4), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
      line((-0.5, 0), x, mark: (end: "stealth", fill: rgb("2C3E50")), stroke: 1.5pt + black)
      
      let alpha = 35deg
      let beta = 70deg
      let a = (3 * calc.cos(alpha), 3 * calc.sin(alpha))
      let b = (a.at(0) + 2 * calc.cos(alpha + beta), a.at(1) + 2 * calc.sin(alpha + beta))
      let bx = (b.at(0), 0)

      line(o, a, stroke: (paint: rgb("1F618D"), thickness: 2.5pt))
      line(a, b, stroke: (paint: rgb("C0392B"), thickness: 2.5pt))
      line(b, bx, stroke: (paint: red, thickness: 1pt, dash: "dashed"))

      arc(o, radius: 0.8, start: 0deg, stop: alpha, mode: "PIE", fill: rgb("1F618D").transparentize(80%), stroke: none)
      content((1.0, 0.3), $\\alpha$)
      
      line(a, (a.at(0) + 1.5*calc.cos(alpha), a.at(1) + 1.5*calc.sin(alpha)), stroke: (paint: gray, dash: "dashed"))
      arc(a, radius: 0.8, start: alpha, stop: alpha + beta, mode: "PIE", fill: rgb("C0392B").transparentize(80%), stroke: none)
      content((a.at(0) + 0.3, a.at(1) + 0.9), $\\beta$)

      circle(o, radius: 4pt, fill: white, stroke: 1.2pt + black)
      circle(a, radius: 4pt, fill: white, stroke: 1.2pt + black)
      circle(b, radius: 4pt, fill: white, stroke: 1.2pt + black)

      content(o, $O$, anchor: "north-east", padding: 8pt)
      content(a, $A$, anchor: "south-east", padding: 8pt)
      content(b, $B$, anchor: "south-west", padding: 8pt)
      content(bx, $H$, anchor: "north", padding: 8pt)
      content((6, -0.3), $x$)
    })
  ],
  fig-pos: "center",
  fig-width: 58%,
  loigiai: [
    #ppgiai(title: [Note Idea Giải: Vượt Khỏi BĐT Tam Giác Bằng Đạo Hàm])[
      - Bài này không cho đáy cố định để dùng Pitago hay BĐT tam giác. Đại lượng cần tối ưu phụ thuộc hoàn toàn vào góc quay $\\alpha$.
      - **Tư duy Giới hạn:** Góc $\\alpha$ bị kẹp, buộc ta phải lập hàm số $f(\\alpha)$ và dùng công cụ Đạo Hàm (máy tính Casio mode 8 cũng có thể dùng nhưng cần cẩn thận độ chính xác).
    ]

    #step[Thiết lập hàm tọa độ theo góc]
    Hình chiếu của $B$ lên trục $O x$ chính là hoành độ $x_B$.
    Hoành độ của điểm $A$ là $x_A = O A \\cos \\alpha = 3 \\cos \\alpha$.
    Hoành độ tương đối của $B$ so với $A$ là $2 \\cos(\\alpha + \\beta)$.
    Vậy tổng tầm với theo phương ngang là:
    $ f(\\alpha) = x_B = 3 \\cos \\alpha + 2 \\cos(\\alpha + \\beta). $

    #step[Đồng nhất biến số]
    Theo giả thiết, hệ thống bị ràng buộc cơ khí $\\beta = 2\\alpha$.
    Do đó, hàm mục tiêu trở thành một hàm theo duy nhất biến $\\alpha$:
    $ f(\\alpha) = 3 \\cos \\alpha + 2 \\cos(3\\alpha). $
    Điều kiện biến số: $\\alpha \\in \\left[0; \\frac{\\pi}{3}\\right]$.

    #step[Sử dụng Đạo hàm tìm Cực trị]
    Ta tính đạo hàm:
    $ f'(\\alpha) = -3 \\sin \\alpha - 6 \\sin(3\\alpha). $
    Giải phương trình $f'(\\alpha) = 0$:
    $ -3 \\sin \\alpha - 6 \\sin(3\\alpha) = 0 \\implies \\sin \\alpha + 2 \\sin(3\\alpha) = 0. $
    Sử dụng công thức nhân ba $\\sin(3\\alpha) = 3\\sin \\alpha - 4\\sin^3 \\alpha$:
    $ \\sin \\alpha + 2(3\\sin \\alpha - 4\\sin^3 \\alpha) = 0 \\implies 7\\sin \\alpha - 8\\sin^3 \\alpha = 0. $
    Vì $\\alpha \\in \\left[0; \\frac{\\pi}{3}\\right]$ nên $\\sin \\alpha \\ge 0$.
    Ta có $\\sin \\alpha (7 - 8\\sin^2 \\alpha) = 0$.
    - Trường hợp 1: $\\sin \\alpha = 0 \\implies \\alpha = 0$.
    - Trường hợp 2: $\\sin^2 \\alpha = \\frac{7}{8}$ (loại vì khi $\\alpha \\in [0; \\pi/3]$, $\\sin \\alpha \\le \\frac{\\sqrt{3}}{2}$, tức là $\\sin^2 \\alpha \\le \\frac{3}{4} = 0.75$, mà $7/8 = 0.875 > 0.75$).

    #step[Chốt giá trị lớn nhất]
    Do đó trên miền $\\left[0; \\frac{\\pi}{3}\\right]$, $f'(\\alpha)$ chỉ có nghiệm tại biên $\\alpha=0$ và luôn mang dấu âm (hàm nghịch biến).
    Giá trị lớn nhất đạt được tại $\\alpha = 0$:
    $ f(0) = 3 \\cos(0) + 2 \\cos(0) = 5. $
    
    #nhanxet[
      Robot vươn xa nhất khi hai khâu duỗi thẳng song song trục hoành. Hàm nghịch biến chứng minh rằng càng gập lên thì tầm với ngang càng hụt. Đạo hàm giúp khẳng định chặt chẽ điều mà trực giác mách bảo.
    ]
  ],
)

== Bài Chế 2 — Vòi Cắt CNC Quay Chạm Phôi (Ứng Dụng Hình Nón & Oxyz)

#tln(
  [Một cánh tay CNC đa năng quay quanh trục thẳng đứng $O z$. Vòi cắt $S M$ được gắn cố định tại đỉnh $S(0; 0; 4)$, tạo với trục $O z$ một góc nghiêng không đổi $30^\\circ$. Khi tay robot quay quanh $O z$, vòi $S M$ vạch ra một mặt nón tròn xoay. Một khối phôi hình cầu có tâm $I(0; 2; 1)$ và bán kính $R=1$ được đặt trên bàn làm việc. Lập trình viên cần biết vòi cắt sẽ tiếp xúc (cắt) khối phôi theo một quỹ đạo khép kín. Tính khoảng cách lớn nhất từ $S$ đến một điểm bất kỳ trên mặt phôi (chưa bị cắt) (làm tròn 2 chữ số thập phân).],
  [4.61],
  fig: align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      let o = (0, 0)
      let s = (0, 4)
      let i = (2, 1)

      // Cone
      line(s, (-2.3, 0), stroke: 1.5pt + rgb("1F618D"))
      line(s, (2.3, 0), stroke: 1.5pt + rgb("1F618D"))
      arc(o, radius: (2.3, 0.6), start: 180deg, stop: 360deg, stroke: 1.2pt + rgb("1F618D"))
      arc(o, radius: (2.3, 0.6), start: 0deg, stop: 180deg, stroke: (paint: rgb("1F618D"), dash: "dashed"))

      // Axis
      line((0, -1), (0, 5), stroke: (paint: black, dash: "dashed"), mark: (end: "stealth"))

      // Sphere
      circle(i, radius: 1, stroke: 1.5pt + rgb("C0392B"), fill: rgb("C0392B").transparentize(80%))

      circle(s, radius: 3pt, fill: black)
      circle(i, radius: 3pt, fill: black)
      
      content(s, $S$, anchor: "south-east", padding: 5pt)
      content(i, $I$, anchor: "west", padding: 5pt)
      content((0, 5.2), $z$)
      content((0.5, 3.2), $30^\\circ$)
    })
  ],
  fig-pos: "center",
  fig-width: 58%,
  loigiai: [
    #ppgiai(title: [Note Idea Giải: Mô Hình Hóa Khoảng Cách Max/Min Của Khối Cầu])[
      - Khoảng cách từ một điểm $S$ đến một mặt cầu tâm $I$ bán kính $R$ luôn tuân theo nguyên lý: $d_{max} = S I + R$ và $d_{min} = S I - R$. Bài toán này là một phép kiểm tra cơ bản trong Oxyz được khoác áo CNC.
    ]

    #step[Phân tích quỹ đạo vòi cắt]
    Tuy đề cung cấp dữ liệu về "mặt nón" của vòi cắt để đánh lạc hướng tư duy học sinh vào việc tìm giao tuyến, nhưng câu hỏi cuối cùng lại là **"khoảng cách lớn nhất từ S đến một điểm bất kỳ trên mặt phôi hình cầu"**.
    Đây là bẫy chống học vẹt tuyệt vời của Giáo sư!

    #step[Tính khoảng cách tâm]
    Mặt cầu có tâm $I(0; 2; 1)$ và bán kính $R = 1$.
    Đỉnh robot là $S(0; 0; 4)$.
    Khoảng cách $S I$ là:
    $ S I = \\sqrt{(0-0)^2 + (2-0)^2 + (1-4)^2} = \\sqrt{4 + 9} = \\sqrt{13} \\approx 3.61 \\text{ (m)}. $

    #step[Chốt khoảng cách lớn nhất]
    Điểm xa nhất trên mặt phôi so với đỉnh vòi $S$ nằm trên đường thẳng $S I$, xuyên qua tâm $I$ ra mặt sau của khối cầu.
    $ d_{max} = S I + R = \\sqrt{13} + 1 \\approx 3.61 + 1 = 4.61 \\text{ (m)}. $
    
    #luuy[
      Rất nhiều học sinh sẽ mất 15 phút loay hoay viết phương trình mặt nón $x^2+y^2 = \\frac{1}{3}(z-4)^2$ rồi tìm giao tuyến với mặt cầu. Việc rèn luyện đọc kĩ và bóc tách đích đến của câu hỏi là yếu tố sống còn cho kì thi 2026.
    ]
  ],
)
"""

if "= Tầm Nhìn Giáo Sư:" not in content:
    content = content.replace("= Lời Kết", prof_section + "\n= Lời Kết")

with open('/Users/admin/conictypst/typst/exams/Cánh-Tay-Robot.typ', 'w', encoding='utf-8') as f:
    f.write(content)
