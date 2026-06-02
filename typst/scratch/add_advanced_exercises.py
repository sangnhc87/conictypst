target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Define the block for Dạng II Bài 5 to be inserted
d2_insert = r"""=== Bài 5 ★★★★ — Chọn Bi Màu Nhiều Ràng Buộc Hỗn Hợp (Sức Mạnh Hàm Sinh)
#tln(
  id: "2GF-2-5",
  [Một túi quà chứa rất nhiều viên bi có 3 màu: đỏ, xanh, vàng. Một học sinh muốn chọn ra đúng 15 viên bi từ túi quà đó. Hỏi có bao nhiêu cách chọn số lượng bi mỗi loại thỏa mãn đồng thời các điều kiện sau:
  - Số bi đỏ được chọn phải là một số chẵn và không vượt quá 8 viên.
  - Số bi xanh được chọn phải là một số chia hết cho 3 và không vượt quá 9 viên.
  - Số bi vàng được chọn phải là một số lẻ.],
  [$10$ cách],
  loigiai: [
    #ppgiai[Bài toán này chứa cả điều kiện chẵn/lẻ/bội (chặn dưới) kết hợp điều kiện giới hạn trên (chặn trên chẵn lẻ khác nhau). Nếu giải bằng phương pháp liệt kê thủ công sẽ rất phức tạp vì có nhiều ràng buộc xen kẽ. Hàm sinh đại số sẽ giải quyết cực kỳ cơ học và chính xác.]

    #cach1-box[
      *Lập luận trực tiếp và phân tích điều kiện:*
      Gọi số bi đỏ, xanh, vàng chọn ra lần lượt là $x, y, z$ (với $x, y, z >= 0$ nguyên). Ta cần tìm số nghiệm nguyên của phương trình $x + y + z = 15$ thỏa mãn:
      - $x in \{0, 2, 4, 6, 8\}$ (5 khả năng).
      - $y in \{0, 3, 6, 9\}$ (4 khả năng).
      - $z in \{1, 3, 5, 7, 9, 11, 13, 15\}$ (số lẻ).
      
      Vì số khả năng của $x$ và $y$ là hữu hạn và khá nhỏ, ta có thể chia các trường hợp theo cặp $(x, y)$:
      - Tổng $x + y$ phải là số sao cho $z = 15 - (x + y)$ là một số lẻ và $z >= 1$.
      - Vì $15$ lẻ, nên để $z$ lẻ thì tổng $x + y$ phải là một số chẵn.
      - Do $x$ chẵn (luôn chẵn), nên để $x + y$ chẵn thì $y$ bắt buộc phải là số chẵn. Trong tập hợp các giá trị của $y$, chỉ có $y in \{0, 6\}$ là chẵn. Ta xét các trường hợp:
        - *Trường hợp 1:* $y = 0$. Khi đó $x + z = 15 \rightarrow z = 15 - x$.
          - Với $x = 0 \rightarrow z = 15$ (thỏa mãn lẻ).
          - Với $x = 2 \rightarrow z = 13$ (thỏa mãn lẻ).
          - Với $x = 4 \rightarrow z = 11$ (thỏa mãn lẻ).
          - Với $x = 6 \rightarrow z = 9$ (thỏa mãn lẻ).
          - Với $x = 8 \rightarrow z = 7$ (thỏa mãn lẻ).
          $\rightarrow$ Có *5 cách* chọn.
        - *Trường hợp 2:* $y = 6$. Khi đó $x + z = 9 \rightarrow z = 9 - x$.
          - Với $x = 0 \rightarrow z = 9$ (thỏa mãn lẻ).
          - Với $x = 2 \rightarrow z = 7$ (thỏa mãn lẻ).
          - Với $x = 4 \rightarrow z = 5$ (thỏa mãn lẻ).
          - Với $x = 6 \rightarrow z = 3$ (thỏa mãn lẻ).
          - Với $x = 8 \rightarrow z = 1$ (thỏa mãn lẻ).
          $\rightarrow$ Có *5 cách* chọn.
      
      Tổng số cách chọn thỏa mãn là: $5 + 5 = 10$ cách chọn.
      
      *(Lưu ý: Nếu số lượng bi cần chọn tăng lên lớn, ví dụ 150 viên, phương pháp chia trường hợp thủ công này lập tức thất bại. Khi đó, Hàm sinh là con đường duy nhất).*
    ]

    #cach2-box[
      *Sử dụng phương pháp hàm sinh:*
      Thiết lập hàm sinh cho từng biến số:
      - Bi màu Đỏ ($x$ chẵn và $<= 8$):
        $ G_1(t) = 1 + t^2 + t^4 + t^6 + t^8 = frac(1-t^10, 1-t^2) $
      - Bi màu Xanh ($y$ chia hết cho 3 và $<= 9$):
        $ G_2(t) = 1 + t^3 + t^6 + t^9 = frac(1-t^12, 1-t^3) $
      - Bi màu Vàng ($z$ lẻ):
        $ G_3(t) = t^1 + t^3 + t^5 + ... = frac(t, 1-t^2) $
      
      Hàm sinh tổng thể cho cách chọn bi là tích các hàm sinh trên:
      $
        G(t) = G_1(t) dot.c G_2(t) dot.c G_3(t) = frac(1-t^10, 1-t^2) dot.c frac(1-t^12, 1-t^3) dot.c frac(t, 1-t^2)
      $
      Rút gọn biểu thức $G(t)$:
      $
        G(t) = t(1-t^10)(1-t^12) dot.c frac(1, (1-t^2)^2 (1-t^3)) = (t - t^11 - t^13 + t^25) dot.c frac(1, (1-t^2)^2 (1-t^3))
      $
      Ta cần tìm hệ số của $t^15$ trong khai triển $G(t)$, tương đương với:
      $
        [t^15] G(t) = [t^15] \Big[ (t - t^11 - t^13) dot.c frac(1, (1-t^2)^2 (1-t^3)) \Big]
      $
      (Ta bỏ qua số hạng $t^25$ vì số mũ của nó đã vượt quá 15).
      Áp dụng quy tắc dịch chuyển số mũ (Shift Rule) cho từng số hạng của tử số:
      $
        [t^15] G(t) = [t^14] frac(1, (1-t^2)^2 (1-t^3)) - [t^4] frac(1, (1-t^2)^2 (1-t^3)) - [t^2] frac(1, (1-t^2)^2 (1-t^3))
      $
      Đặt $H(t) = frac(1, (1-t^2)^2 (1-t^3))$. Ta đi tìm hệ số $[t^k] H(t)$ với $k in \{2, 4, 14\}$:
      - Khai triển các nhân tử ở mẫu:
        - $A(t) = frac(1, (1-t^2)^2) = sum_(i=0)^(+oo) (i+1) t^(2i) = 1 + 2t^2 + 3t^4 + 4t^6 + 5t^8 + 6t^10 + 7t^12 + 8t^14 + ...$
        - $B(t) = frac(1, 1-t^3) = sum_(j=0)^(+oo) t^(3j) = 1 + t^3 + t^6 + t^9 + t^12 + ...$
      - Tính các hệ số thành phần của $H(t) = A(t) dot.c B(t)$:
        1. Tìm $[t^2] H(t)$: Cách duy nhất tạo ra số mũ 2 là lấy số hạng $2t^2$ ở $A(t)$ nhân $1$ ở $B(t)$ $\rightarrow [t^2] H(t) = 2 dot.c 1 = 2$.
        2. Tìm $[t^4] H(t)$: Cách duy nhất tạo ra số mũ 4 là lấy số hạng $3t^4$ ở $A(t)$ nhân $1$ ở $B(t)$ $\rightarrow [t^4] H(t) = 3 dot.c 1 = 3$.
        3. Tìm $[t^14] H(t)$: Ta tìm các cặp chỉ số $(i, j)$ sao cho $2i + 3j = 14$ với $i, j >= 0$.
           Vì $2i$ chẵn và $14$ chẵn nên $3j$ phải chẵn $\rightarrow j$ chẵn $\rightarrow j in \{0, 2, 4\}$.
           - Với $j = 0 \rightarrow 2i = 14 \rightarrow i = 7$. Hệ số tương ứng là: $(7+1) dot.c 1 = 8$.
           - Với $j = 2 \rightarrow 3j = 6 \rightarrow 2i = 8 \rightarrow i = 4$. Hệ số tương ứng là: $(4+1) dot.c 1 = 5$.
           - Với $j = 4 \rightarrow 3j = 12 \rightarrow 2i = 2 \rightarrow i = 1$. Hệ số tương ứng là: $(1+1) dot.c 1 = 2$.
           Do đó, $[t^14] H(t) = 8 + 5 + 2 = 15$.
      
      Thay các kết quả thành phần vào công thức hiệu ban đầu, ta có:
      $
        [t^15] G(t) = 15 - 3 - 2 = 10 " cách."
      $
      Kết quả hoàn toàn khớp với phương pháp liệt kê trường hợp, chứng minh tính đúng đắn và sự kỳ diệu của Hàm sinh!
    ]
    #ans-box[Có tất cả *10 cách* chọn bộ bi thỏa mãn điều kiện.]
  ]
)

#v(0.5em)
#align(center)[
  #block(fill: rgb("FAFAFA"), stroke: 1pt + luma(180), radius: 8pt, inset: 12pt, width: 95%)[
    #text(fill: col-purple, weight: "bold", size: 9.5pt)[🔮 Minh Họa 3 Túi Bi Ràng Buộc Hỗn Hợp]
    #v(0.5em)
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      let red-color = rgb("EF5350")
      let blue-color = rgb("42A5F5")
      let yellow-color = rgb("FFCA28")
      
      // Túi Đỏ
      rect((-4, -0.8), (-2, 1.2), fill: rgb("FFEBEE"), stroke: 1.5pt + red-color, radius: 4pt)
      circle((-3.5, 0.4), radius: 0.18, fill: red-color, stroke: none)
      circle((-2.9, 0.6), radius: 0.18, fill: red-color, stroke: none)
      circle((-3.2, 0.0), radius: 0.18, fill: red-color, stroke: none)
      circle((-2.6, 0.1), radius: 0.18, fill: red-color, stroke: none)
      circle((-3.1, 0.8), radius: 0.18, fill: red-color, stroke: none)
      content((-3.0, -1.3), text(size: 8.5pt, fill: rgb("C62828"), weight: "bold")[Túi Đỏ])
      content((-3.0, -1.8), text(size: 8pt, fill: luma(100))[Chẵn, $<= 8$])
      
      // Túi Xanh
      rect((-1, -0.8), (1, 1.2), fill: rgb("E3F2FD"), stroke: 1.5pt + blue-color, radius: 4pt)
      circle((-0.5, 0.4), radius: 0.18, fill: blue-color, stroke: none)
      circle((0.1, 0.6), radius: 0.18, fill: blue-color, stroke: none)
      circle((-0.2, 0.0), radius: 0.18, fill: blue-color, stroke: none)
      circle((0.4, 0.1), radius: 0.18, fill: blue-color, stroke: none)
      circle((-0.1, 0.8), radius: 0.18, fill: blue-color, stroke: none)
      content((0.0, -1.3), text(size: 8.5pt, fill: rgb("0D47A1"), weight: "bold")[Túi Xanh])
      content((0.0, -1.8), text(size: 8pt, fill: luma(100))[Bội $3, <= 9$])
      
      // Túi Vàng
      rect((2, -0.8), (4, 1.2), fill: rgb("FFFDE7"), stroke: 1.5pt + yellow-color, radius: 4pt)
      circle((2.5, 0.4), radius: 0.18, fill: yellow-color, stroke: none)
      circle((3.1, 0.6), radius: 0.18, fill: yellow-color, stroke: none)
      circle((2.8, 0.0), radius: 0.18, fill: yellow-color, stroke: none)
      circle((3.4, 0.1), radius: 0.18, fill: yellow-color, stroke: none)
      circle((2.9, 0.8), radius: 0.18, fill: yellow-color, stroke: none)
      content((3.0, -1.3), text(size: 8.5pt, fill: rgb("E65100"), weight: "bold")[Túi Vàng])
      content((3.0, -1.8), text(size: 8pt, fill: luma(100))[Số Lẻ $>= 1$])
      
      // Dấu cộng giữa các túi
      content((-1.5, 0.2), text(size: 14pt, fill: luma(120))[+])
      content((1.5, 0.2), text(size: 14pt, fill: luma(120))[+])
    })
  ]
]
"""

# Define the block for Dạng V Bài 4 to be inserted
d5_insert = r"""=== Bài 4 ★★★★ — Chọn Ghế Bàn Tròn Cách Nhau Ít Nhất m Ghế Trống (Bản Lĩnh Hàm Sinh)
#tln(
  id: "2GF-5-4",
  [Có 12 chiếc ghế được xếp thành một vòng tròn quanh một bàn tiệc lớn. Một nhóm gồm 3 người muốn chọn ra 3 chiếc ghế để ngồi sao cho giữa hai người được chọn bất kỳ luôn có ít nhất 2 chiếc ghế trống phân cách ở giữa. Hỏi có bao nhiêu cách chọn 3 chiếc ghế như vậy?],
  [$40$ cách],
  loigiai: [
    #ppgiai[Đây là bài toán chọn tập con không kề nhau trên vòng tròn nhưng có điều kiện khoảng cách tối thiểu được nâng lên là $m = 2$ ghế trống. Nếu sử dụng các phương pháp tổ hợp thẳng hàng thông thường rồi loại trừ hoặc chia trường hợp thì các điều kiện biên của vòng tròn khép kín cực kỳ rắc rối. Hàm sinh khoảng cách sẽ giải quyết điều này vô cùng thanh thoát và cơ học.]

    #cach1-box[
      *Đặt thẳng hàng và chia trường hợp:*
      Đánh số các ghế từ 1 đến 12 theo chiều kim đồng hồ. Ta chia thành hai trường hợp dựa trên trạng thái của chiếc ghế số 1:
      - *Trường hợp 1: Ghế số 1 được chọn.*
        Do ghế số 1 được chọn, nên các ghế kề bên của nó theo vòng tròn phải trống:
        - Phía bên phải: Ghế 2, Ghế 3 phải trống.
        - Phía bên trái: Ghế 11, Ghế 12 phải trống.
        Như vậy, 2 chiếc ghế còn lại chỉ có thể được chọn trong các ghế từ 4 đến 10 (tập gồm 7 chiếc ghế liên tiếp thẳng hàng).
        Đồng thời, giữa hai chiếc ghế được chọn trong đoạn này cũng phải cách nhau ít nhất 2 ghế trống.
        Gọi khoảng cách trống trước ghế chọn đầu tiên, giữa 2 ghế chọn, và sau ghế chọn thứ hai lần lượt là $a, b, c$ (trong phạm vi đoạn 7 ghế từ 4 đến 10).
        Tổng số ghế trống của đoạn 7 ghế là $7 - 2 = 5$ ghế. Ta có phương trình:
        $
          a + b + c = 5 \quad (\text{với } b >= 2 \text{ và } a, c >= 0)
        $
        Đặt $b' = b - 2 >= 0 \rightarrow a + b' + c = 3$.
        Số cách chọn là: $C_(3+3-1)^(3-1) = C_5^2 = 10$ cách.
      - *Trường hợp 2: Ghế số 1 không được chọn.*
        Ta chọn 3 ghế từ 11 ghế liên tiếp $\{2, 3, ..., 12\}$ thẳng hàng sao cho khoảng cách giữa hai ghế chọn bất kỳ ít nhất là 2 ghế trống.
        Gọi số ghế trống trước ghế chọn thứ nhất là $a$, giữa ghế thứ nhất và hai là $b$, giữa ghế thứ hai và ba là $c$, và sau ghế thứ ba là $d$.
        Tổng số ghế trống trong đoạn 11 ghế là $11 - 3 = 8$ ghế. Do đó ta có:
        $ a + b + c + d = 8 \quad (\text{với } b, c >= 2 \text{ và } a, d >= 0) $
        Đồng thời, do ghế số 1 trống và vòng tròn khép kín, khoảng cách từ ghế cuối (trong đoạn 11 ghế) vòng quanh ghế 1 đến ghế đầu phải ít nhất là 2 ghế trống. Vì ghế 1 trống nằm ở giữa nên khoảng cách thực tế là $a + d + 1 >= 2 \rightarrow a + d >= 1$.
        Ta đi tìm số nghiệm của hệ:
        $ a + b + c + d = 8 \quad (\text{với } b, c >= 2, a + d >= 1) $
        - Số nghiệm nếu không có điều kiện $a + d >= 1$:
          Đặt $b' = b-2 >= 0, c' = c-2 >= 0 \rightarrow a + b' + c' + d = 4$.
          Số nghiệm là $C_(4+4-1)^(4-1) = C_7^3 = 35$ nghiệm.
        - Trừ đi các trường hợp vi phạm $a + d = 0 \rightarrow a = 0$ và $d = 0$:
          Khi đó $b' + c' = 4$. Số nghiệm là $C_(4+2-1)^(2-1) = C_5^1 = 5$ nghiệm.
        - Vậy số cách ở trường hợp này là: $35 - 5 = 30$ cách.
      
      Tổng số cách chọn thỏa mãn là: $10 + 30 = 40$ cách.
    ]

    #cach2-box[
      *Sử dụng hàm sinh khoảng cách ghế trống:*
      Gọi 3 ghế được chọn theo thứ tự vòng tròn là $A, B, C$. Gọi số lượng ghế trống ở giữa $A$ và $B$ là $x_1$, giữa $B$ và $C$ là $x_2$, giữa $C$ và $A$ là $x_3$.
      - Vì giữa hai ghế được chọn bất kỳ phải có ít nhất 2 ghế trống phân cách nên: $x_1, x_2, x_3 >= 2$.
      - Tổng số ghế trống trên vòng tròn là $12 - 3 = 9$ ghế. Do đó ta lập được phương trình khoảng cách ghế trống:
        $
          x_1 + x_2 + x_3 = 9 \quad (\text{với } x_i >= 2)
        $
      - Hàm sinh cho mỗi biến khoảng cách $x_i >= 2$ (bước nhảy $d = 1$, bắt đầu từ số mũ 2) là:
        $ G_i(x) = x^2 + x^3 + x^4 + ... = frac(x^2, 1-x) $
      - Hàm sinh cho tổng số ghế trống (tích các hàm sinh thành phần):
        $
          G_S(x) = lr(frac(x^2, 1-x))^3 = frac(x^6, (1-x)^3)
        $
      - Số bộ nghiệm $(x_1, x_2, x_3)$ chính là hệ số của $x^9$ trong $G_S(x)$:
        $
          N_("bộ") = [x^9] frac(x^6, (1-x)^3) = [x^3] frac(1, (1-x)^3)
        $
        Áp dụng công thức nhị thức âm với $n = 3, k = 3$:
        $
          N_("bộ") = C_(3+3-1)^(3-1) = C_5^2 = 10 " bộ nghiệm."
        $
      - Để xác định vị trí thực tế trên vòng tròn 12 ghế: ta chọn vị trí ghế đầu tiên $A$ trong số 12 ghế $\rightarrow$ có 12 cách chọn. Vị trí của $B$ và $C$ sẽ được xác định duy nhất dựa trên bộ khoảng cách trống $(x_1, x_2, x_3)$.
      - Tuy nhiên, do 3 ghế chọn $\{A, B, C\}$ không phân biệt thứ tự chọn nên mỗi tập hợp ghế sẽ bị đếm lặp lại đúng 3 lần (hoán vị xoay vòng của 3 ghế).
      - Do đó, số cách chọn thực tế là:
        $
          N = frac(12, 3) dot.c N_("bộ") = 4 dot.c 10 = 40 " cách."
        $
    ]
    #ans-box[Có tất cả *40 cách* chọn 3 chiếc ghế thỏa mãn.]
  ]
)

#v(0.5em)
#align(center)[
  #block(fill: rgb("FAFAFA"), stroke: 1.2pt + luma(120), radius: 6pt, inset: 10pt, width: 95%)[
    #text(fill: col-purple, weight: "bold", size: 9.5pt)[🍽️ Trực Quan Hóa Bàn Tròn 12 Ghế (Khoảng cách tối thiểu m = 2)]
    #v(0.5em)
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      
      // Vẽ bàn tròn lớn ở tâm (0,0)
      circle((0, 0), radius: 2.8, fill: rgb("F5F5F5"), stroke: 1.5pt + luma(120))
      content((0, 0), text(size: 9.5pt, weight: "bold", fill: luma(80))[BÀN TRÒN 12 GHẾ])
      
      // Vẽ 12 ghế xung quanh
      let labels = ("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
      
      for i in range(12) {
        let angle = i * 30 * 1deg
        let x = calc.cos(angle) * 3.4
        let y = calc.sin(angle) * 3.4
        
        let is_selected = (i == 0 or i == 3 or i == 7) // Ghế 1, 4, 8
        let fill_col = if is_selected { rgb("EDE7F6") } else { white }
        let stroke_col = if is_selected { col-purple } else { luma(180) }
        let text_col = if is_selected { col-purple } else { luma(120) }
        let thick = if is_selected { 1.5pt } else { 0.8pt }
        
        circle((x, y), radius: 0.38, fill: fill_col, stroke: thick + stroke_col)
        content((x, y), text(size: 9pt, weight: if is_selected { "bold" } else { "regular" }, fill: text_col)[#labels.at(i)])
      }
      
      // Chú thích các khoảng trống ở giữa
      content((2.8, 1.6), text(size: 9.5pt, fill: col-green, weight: "bold")[$x_1 = 2$])
      content((-2.0, 2.3), text(size: 9.5pt, fill: col-green, weight: "bold")[$x_2 = 3$])
      content((-0.8, -2.8), text(size: 9.5pt, fill: col-green, weight: "bold")[$x_3 = 4$])
    })
  ]
]
"""

# Let's perform the insertions
# 1. Insert d2_insert before '= Dạng III'
idx_d3 = content.find('= Dạng III — Bài Toán Đổi Tiền và Phân Hoạch Số 💰')
if idx_d3 != -1:
    content = content[:idx_d3] + d2_insert + '\n' + content[idx_d3:]
    print("Success: Dạng II Bài 5 inserted.")
else:
    print("Failed to locate Dạng III heading.")

# 2. Insert d5_insert before '= Dạng VI'
idx_d6 = content.find('= Dạng VI — Trắc Nghiệm Đúng/Sai Tổng Hợp 📝')
if idx_d6 != -1:
    content = content[:idx_d6] + d5_insert + '\n' + content[idx_d6:]
    print("Success: Dạng V Bài 4 inserted.")
else:
    print("Failed to locate Dạng VI heading.")

with open(target_file, 'w') as f:
    f.write(content)

print("Insertion process completed!")
