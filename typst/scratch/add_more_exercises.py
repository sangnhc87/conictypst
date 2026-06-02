import sys

target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# --- Bookcase exercise for Dạng II ---
d2_anchor = '= Dạng III — Bài Toán Đổi Tiền và Phân Hoạch Số 💰'
d2_insert = """=== Bài 4 ★★★ — Xếp Sách Màu Trên Kệ (Nhiều Điều Kiện)
#tln(
  id: "2GF-4",
  [Một thủ thư muốn chọn ra đúng 10 quyển sách từ 3 loại sách có sẵn: sách Toán (bìa đỏ), sách Văn (bìa xanh) và sách tiếng Anh (bìa vàng) để xếp lên một ngăn kệ. Biết số lượng sách mỗi loại trong kho là rất lớn. Hỏi có bao nhiêu cách chọn số lượng sách của mỗi loại thỏa mãn đồng thời các điều kiện sau:
  - Số sách Toán được chọn phải là một số lẻ.
  - Số sách Văn được chọn phải là một số chẵn.
  - Số sách tiếng Anh được chọn phải là một số chia hết cho 3.],
  [$5$ cách],
  loigiai: [
    #ppgiai[Gọi số lượng sách Toán, Văn, Anh được chọn lần lượt là $x, y, z$ (với $x, y, z >= 0$ nguyên). Ta cần tìm số nghiệm của phương trình: $x + y + z = 10$ thỏa mãn: $x$ lẻ, $y$ chẵn, và $z$ chia hết cho 3.]

    #cach1-box[
      *Lập luận trực tiếp và chia trường hợp:*
      Vì $z$ là bội của 3 và $z <= 10$ nên $z in \{0, 3, 6, 9\}$. Ta xét từng trường hợp của $z$:
      - *Trường hợp 1:* $z = 9$. Khi đó $x + y = 1$ với $x$ lẻ, $y$ chẵn.
        - Vì $x$ lẻ và $x <= 1$ nên $x = 1$. Khi đó $y = 0$ (chẵn, thỏa mãn).
        - Ta được bộ nghiệm: $(1, 0, 9)$ $\rightarrow$ Có *1 cách*.
      - *Trường hợp 2:* $z = 6$. Khi đó $x + y = 4$ với $x$ lẻ, $y$ chẵn.
        - Vì $x$ lẻ và $x <= 4$ nên $x in \{1, 3\}$.
        - Nếu $x = 1 \rightarrow y = 3$ (loại vì $y$ phải chẵn).
        - Nếu $x = 3 \rightarrow y = 1$ (loại vì $y$ phải chẵn).
        - Không có bộ nghiệm nào thỏa mãn $\rightarrow$ Có *0 cách*.
      - *Trường hợp 3:* $z = 3$. Khi đó $x + y = 7$ với $x$ lẻ, $y$ chẵn.
        - Vì $x$ lẻ và $x <= 7$ nên $x in \{1, 3, 5, 7\}$.
        - Nếu $x = 1 \rightarrow y = 6$ (chẵn, thỏa mãn) $\rightarrow (1, 6, 3)$.
        - Nếu $x = 3 \rightarrow y = 4$ (chẵn, thỏa mãn) $\rightarrow (3, 4, 3)$.
        - Nếu $x = 5 \rightarrow y = 2$ (chẵn, thỏa mãn) $\rightarrow (5, 2, 3)$.
        - Nếu $x = 7 \rightarrow y = 0$ (chẵn, thỏa mãn) $\rightarrow (7, 0, 3)$.
        - Ta được thêm *4 bộ nghiệm* thỏa mãn.
      - *Trường hợp 4:* $z = 0$. Khi đó $x + y = 10$ với $x$ lẻ, $y$ chẵn.
        - Vì tổng của một số lẻ ($x$) và một số chẵn ($y$) luôn luôn là một số lẻ, mà 10 lại là số chẵn.
        - Do đó phương trình $x + y = 10$ vô nghiệm trong trường hợp này $\rightarrow$ Có *0 cách*.
      
      Tổng số cách chọn thỏa mãn là: $1 + 0 + 4 + 0 = 5$ cách.
      
      Gồm các bộ nghiệm cụ thể: $(1, 0, 9)$, $(1, 6, 3)$, $(3, 4, 3)$, $(5, 2, 3)$, $(7, 0, 3)$.
    ]

    #cach2-box[
      *Sử dụng phương pháp hàm sinh:*
      Thiết lập hàm sinh cho từng loại sách:
      - Sách Toán ($x$ lẻ): $G_1(t) = t^1 + t^3 + t^5 + ... = frac(t, 1-t^2)$.
      - Sách Văn ($y$ chẵn): $G_2(t) = 1 + t^2 + t^4 + ... = frac(1, 1-t^2)$.
      - Sách Anh ($z$ chia hết cho 3): $G_3(t) = 1 + t^3 + t^6 + ... = frac(1, 1-t^3)$.
      
      Hàm sinh tổng thể là tích các hàm sinh thành phần:
      $
        G(t) = G_1(t) dot.c G_2(t) dot.c G_3(t) = frac(t, (1-t^2)^2 (1-t^3))
      $
      Ta cần tìm hệ số của $t^10$ trong khai triển của $G(t)$, tương đương với hệ số của $t^9$ trong:
      $
        H(t) = frac(1, (1-t^2)^2 (1-t^3)) = frac(1, (1-t^2)^2) dot.c frac(1, 1-t^3)
      $
      Ta có khai triển các nhân tử:
      - $frac(1, (1-t^2)^2) = sum_(k=0)^(+oo) (k+1) t^(2k) = 1 + 2t^2 + 3t^4 + 4t^6 + 5t^8 + 6t^10 + ...$
      - $frac(1, 1-t^3) = 1 + t^3 + t^6 + t^9 + ...$
      
      Để tìm hệ số của $t^9$ trong tích hai chuỗi trên, ta nhân các số hạng có tổng số mũ bằng 9:
      - Số hạng $t^0$ ở chuỗi thứ nhất nhân với $t^9$ ở chuỗi thứ hai: $1 dot.c 1 = 1$.
      - Số hạng $t^6$ ở chuỗi thứ nhất nhân với $t^3$ ở chuỗi thứ hai: $4t^6 dot.c t^3 = 4t^9 \rightarrow 4$.
      
      (Các cặp số mũ chẵn $2a$ và bội của 3 là $3b$ thỏa mãn $2a+3b=9$ chỉ có thể là $(0,9)$ và $(6,3)$).
      Vậy hệ số của $t^9$ trong $H(t)$ là: $1 + 4 = 5$.
      Do đó hệ số của $t^10$ trong $G(t)$ là *5 cách*.
    ]
    #ans-box[Có tất cả *5 cách* chọn sách thỏa mãn các ràng buộc.]
  ]
)

#v(0.5em)
#align(center)[
  #block(fill: rgb("efebe9"), stroke: 1.2pt + rgb("8d6e63"), radius: 6pt, inset: 10pt, width: 95%)[
    #text(fill: rgb("5d4037"), weight: "bold", size: 9.5pt)[📚 Minh Họa Xếp Sách Màu Trên Kệ]
    #v(0.5em)
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      
      // Vẽ kệ sách (3 ngăn hoặc 1 kệ có vách ngăn)
      rect((-4, -1), (4, 1.5), stroke: 1.5pt + rgb("8d6e63"), fill: rgb("efebe9"))
      
      // Vẽ các cuốn sách Toán (Đỏ) - xếp chồng đứng
      let red-book = rgb("ef5350")
      for i in range(3) {
        rect((-3 + i * 0.45, -0.9), (-2.65 + i * 0.45, 1.1), fill: red-book, stroke: 0.8pt + rgb("b71c1c"))
      }
      content((-2.2, 1.3), text(size: 8.5pt, fill: rgb("b71c1c"), weight: "bold")[Toán (Lẻ)])
      
      // Vẽ các cuốn sách Văn (Xanh)
      let blue-book = rgb("42a5f5")
      for i in range(4) {
        rect((-0.9 + i * 0.45, -0.9), (-0.55 + i * 0.45, 1.1), fill: blue-book, stroke: 0.8pt + rgb("0d47a1"))
      }
      content((-0.1, 1.3), text(size: 8.5pt, fill: rgb("0d47a1"), weight: "bold")[Văn (Chẵn)])
      
      // Vẽ các cuốn sách Anh (Vàng)
      let yellow-book = rgb("ffca28")
      for i in range(3) {
        rect((1.3 + i * 0.45, -0.9), (1.65 + i * 0.45, 1.1), fill: yellow-book, stroke: 0.8pt + rgb("e65100"))
      }
      content((2.1, 1.3), text(size: 8.5pt, fill: rgb("e65100"), weight: "bold")[Anh (Bội 3)])
      
      // Đường gạch kệ gỗ bên dưới
      line((-4, -0.95), (4, -0.95), stroke: 2pt + rgb("5d4037"))
    })
  ]
]

"""

# --- Round table exercise for Dạng V ---
d5_anchor = '= Dạng VI — Trắc Nghiệm Đúng/Sai Tổng Hợp 📝'
d5_insert = """=== Bài 3 ★★★★ — Chọn Ghế Bàn Tròn Không Kề Nhau (Nâng Cao)
#tln(
  id: "5GF-3",
  [Một bàn tròn có 8 chiếc ghế được đánh số thứ tự từ 1 đến 8 quanh bàn. Người ta muốn chọn ra 3 chiếc ghế sao cho không có bất kỳ hai chiếc ghế nào được chọn cạnh nhau. Hỏi có bao nhiêu cách chọn thỏa mãn?],
  [$16$ cách],
  loigiai: [
    #ppgiai[Đây là bài toán chọn phần tử không kề nhau trên vòng tròn. Ta sẽ giải bằng phương pháp chia trường hợp đường thẳng hóa và phương pháp hàm sinh khoảng cách.]

    #cach1-box[
      *Phương pháp tổ hợp đường thẳng hóa:*
      Ta chia làm hai trường hợp dựa trên trạng thái của ghế số 1:
      - *Trường hợp 1: Ghế số 1 được chọn.*
        Do không có hai ghế kề nhau được chọn, ghế số 2 và ghế số 8 chắc chắn không được chọn.
        Ta còn lại 5 ghế liên tiếp $\{3, 4, 5, 6, 7\}$, cần chọn ra 2 ghế không kề nhau từ nhóm này.
        Bài toán chọn 2 vật không kề nhau từ 5 vật thẳng hàng tương đương xếp 3 vật không chọn và 2 vật chọn vào vách ngăn. Số cách chọn là:
        $
          N_1 = C_(3+1)^2 = C_4^2 = 6 " cách."
        $
      - *Trường hợp 2: Ghế số 1 không được chọn.*
        Ta cần chọn 3 ghế không kề nhau từ 7 ghế liên tiếp $\{2, 3, 4, 5, 6, 7, 8\}$ thẳng hàng.
        Tương tự, số cách chọn 3 vật không kề nhau từ 7 vật thẳng hàng là:
        $
          N_2 = C_(4+1)^3 = C_5^3 = 10 " cách."
        $
      
      Tổng số cách chọn thỏa mãn là:
      $
        N = N_1 + N_2 = 6 + 10 = 16 " cách."
      $
    ]

    #cach2-box[
      *Sử dụng hàm sinh khoảng cách ghế trống:*
      Gọi 3 ghế được chọn theo thứ tự vòng tròn là $A, B, C$. Gọi số lượng ghế trống ở giữa $A$ và $B$ là $x_1$, giữa $B$ và $C$ là $x_2$, giữa $C$ và $A$ là $x_3$.
      - Vì không có hai ghế nào được chọn kề nhau nên giữa mỗi cặp ghế chọn phải có ít nhất 1 ghế trống: $x_1, x_2, x_3 >= 1$.
      - Tổng số ghế trống trên vòng tròn là $8 - 3 = 5$ ghế. Do đó ta có phương trình:
        $
          x_1 + x_2 + x_3 = 5   ("với " x_i >= 1)
        $
      Hàm sinh cho mỗi biến khoảng cách $x_i >= 1$ là $G_i(x) = x^1 + x^2 + ... = frac(x, 1-x)$.
      Hàm sinh cho tổng số ghế trống là:
      $
        G_S(x) = lr(frac(x, 1-x))^3 = frac(x^3, (1-x)^3)
      $
      Số bộ nghiệm $(x_1, x_2, x_3)$ là hệ số của $x^5$ trong $G_S(x)$:
      $
        N_(bộ) = [x^5] frac(x^3, (1-x)^3) = [x^2] frac(1, (1-x)^3) = C_(2+3-1)^(3-1) = C_4^2 = 6 " bộ nghiệm."
      $
      Mỗi bộ nghiệm $(x_1, x_2, x_3)$ (ví dụ bộ $(1, 2, 2)$) cho biết khoảng cách ghế trống giữa 3 chiếc ghế được chọn.
      - Để xác định vị trí thực tế trên bàn tròn, ta chọn vị trí cho ghế đầu tiên $A$ trong số 8 ghế $\rightarrow$ có 8 cách chọn. Sau đó vị trí của $B$ và $C$ sẽ được xác định duy nhất theo khoảng cách đã chọn.
      - Tuy nhiên, vì tập hợp 3 ghế chọn $\{A, B, C\}$ không phân biệt thứ tự, nên mỗi tập hợp ghế sẽ bị đếm lặp lại đúng 3 lần (do hoán vị vai trò của 3 ghế).
      - Do đó, số cách chọn thực tế là:
        $
          N = frac(8, 3) dot.c N_(bộ) = frac(8, 3) dot.c 6 = 16 " cách."
        $
    ]
    #ans-box[Có tất cả *16 cách* chọn 3 chiếc ghế thỏa mãn.]
  ]
)

#v(0.5em)
#align(center)[
  #block(fill: rgb("F5F5F5"), stroke: 1.2pt + luma(120), radius: 6pt, inset: 10pt, width: 95%)[
    #text(fill: col-blue, weight: "bold", size: 9.5pt)[🍽️ Trực Quan Hóa Bài Toán Bàn Tròn (Xoay Vòng)]
    #v(0.5em)
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      
      // Vẽ bàn tròn ở tâm (0,0)
      circle((0, 0), radius: 2.2, fill: rgb("F5F5F5"), stroke: 1.5pt + luma(120))
      content((0, 0), text(size: 9.5pt, weight: "bold", fill: luma(80))[BÀN TRÒN])
      
      // Vẽ 8 ghế xung quanh
      let labels = ("1", "2", "3", "4", "5", "6", "7", "8")
      
      for i in range(8) {
        let angle = i * 45 * 1deg
        let x = calc.cos(angle) * 2.8
        let y = calc.sin(angle) * 2.8
        
        let is_selected = (i == 0 or i == 2 or i == 5)
        let fill_col = if is_selected { rgb("E3F2FD") } else { white }
        let stroke_col = if is_selected { col-blue } else { luma(180) }
        let text_col = if is_selected { col-blue } else { luma(120) }
        let thick = if is_selected { 1.5pt } else { 0.8pt }
        
        circle((x, y), radius: 0.35, fill: fill_col, stroke: thick + stroke_col)
        content((x, y), text(size: 9pt, weight: if is_selected { "bold" } else { "regular" }, fill: text_col)[#labels.at(i)])
      }
      
      // Vẽ các nhãn khoảng trống
      content((1.8, 1.8), text(size: 9.5pt, fill: col-green, weight: "bold")[$x_1 = 1$])
      content((-1.8, 0.8), text(size: 9.5pt, fill: col-green, weight: "bold")[$x_2 = 2$])
      content((0.8, -1.8), text(size: 9.5pt, fill: col-green, weight: "bold")[$x_3 = 2$])
    })
  ]
]

"""

if d2_anchor in content:
    content = content.replace(d2_anchor, d2_insert + d2_anchor)
    print("Bookcase exercise inserted.")
else:
    print("Failed to find Dạng II anchor.")
    sys.exit(1)

if d5_anchor in content:
    content = content.replace(d5_anchor, d5_insert + d5_anchor)
    print("Round table exercise inserted.")
else:
    print("Failed to find Dạng V anchor.")
    sys.exit(1)

with open(target_file, 'w') as f:
    f.write(content)

print("All new modifications applied successfully!")
