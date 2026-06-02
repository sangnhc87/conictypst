target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Define replacement for Dạng II Bài 4 Cách 2
d2_ex4_old_cach2 = r"""    #cach2-box[
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
      - Số hạng $t^6$ ở chuỗi thứ nhất nhân với $t^3$ ở chuỗi thứ hai: $4t^6 dot.c t^3 = 4t^9 
arrow.r 4$.
      
      (Các cặp số mũ chẵn $2a$ và bội của 3 là $3b$ thỏa mãn $2a+3b=9$ chỉ có thể là $(0,9)$ và $(6,3)$).
      Vậy hệ số của $t^9$ trong $H(t)$ là: $1 + 4 = 5$.
      Do đó hệ số của $t^10$ trong $G(t)$ là *5 cách*.
    ]"""

# Since we ran bracket fixer, some parts of d2_ex4_old_cach2 might have been modified to lr((...)) or similar, but wait, there is no lr() inside d2_ex4_old_cach2.
# Let's check:
# "G_1(t) = t^1 + t^3 + t^5 + ... = frac(t, 1-t^2)." -> no lr
# "G(t) = G_1(t) dot.c G_2(t) dot.c G_3(t) = frac(t, (1-t^2)^2 (1-t^3))" -> no lr
# Let's check if the raw search works. To be safe, we can search for a slightly shorter, unique substring and replace it.

# Let's look at d2_ex4:
d2_ex4_target = """      Ta cần tìm hệ số của $t^10$ trong khai triển của $G(t)$, tương đương với hệ số của $t^9$ trong:
      $
        H(t) = frac(1, (1-t^2)^2 (1-t^3)) = frac(1, (1-t^2)^2) dot.c frac(1, 1-t^3)
      $
      Ta có khai triển các nhân tử:
      - $frac(1, (1-t^2)^2) = sum_(k=0)^(+oo) (k+1) t^(2k) = 1 + 2t^2 + 3t^4 + 4t^6 + 5t^8 + 6t^10 + ...$"""

d2_ex4_replacement = """      Ta cần tìm hệ số của $t^10$ trong khai triển của $G(t)$, tương đương với hệ số của $t^9$ trong:
      $
        H(t) = frac(1, (1-t^2)^2 (1-t^3)) = frac(1, (1-t^2)^2) dot.c frac(1, 1-t^3)
      $

      #note-box(title: "💡 Giải nghĩa Sư phạm: Khai triển Mẫu số qua Đổi biến")[
        Để khai triển các nhân tử phức tạp ở mẫu số, ta quy chúng về các dạng nhị thức âm cơ bản bằng phép đổi biến số:
        - Với nhân tử $frac(1, (1-t^2)^2)$: Đặt $u = t^2$, ta có phân thức quen thuộc $frac(1, (1-u)^2)$. Theo định lý nhị thức âm bậc 2: $frac(1, (1-u)^2) = sum_(k=0)^(+oo) (k+1) u^k = 1 + 2u + 3u^2 + ...$ Thế ngược $u = t^2$ ta thu được: $frac(1, (1-t^2)^2) = 1 + 2t^2 + 3t^4 + 4t^6 + ...$
        - Với nhân tử $frac(1, 1-t^3)$: Đặt $v = t^3$, ta có cấp số nhân lùi vô hạn $frac(1, 1-v) = 1 + v + v^2 + ...$ Thế ngược $v = t^3$ ta được: $frac(1, 1-t^3) = 1 + t^3 + t^6 + t^9 + ...$
      ]

      Ta có khai triển các nhân tử:
      - $frac(1, (1-t^2)^2) = sum_(k=0)^(+oo) (k+1) t^(2k) = 1 + 2t^2 + 3t^4 + 4t^6 + 5t^8 + 6t^10 + ...$"""

if d2_ex4_target in content:
    content = content.replace(d2_ex4_target, d2_ex4_replacement)
    print("Success: Updated Dạng II Bài 4 explanation.")
else:
    # Try normalizing line endings or spaces
    print("Failed to find Dạng II Bài 4 target.")


# Define replacement for Dạng II Bài 5
d2_ex5_target = """      Đặt $H(t) = frac(1, (1-t^2)^2 (1-t^3))$. Ta đi tìm hệ số $[t^k] H(t)$ với $k in \{2, 4, 14\}$:
      - Khai triển các nhân tử ở mẫu:
        - $A(t) = frac(1, (1-t^2)^2) = sum_(i=0)^(+oo) (i+1) t^(2i) = 1 + 2t^2 + 3t^4 + 4t^6 + 5t^8 + 6t^10 + 7t^12 + 8t^14 + ...$"""

d2_ex5_replacement = """      Đặt $H(t) = frac(1, (1-t^2)^2 (1-t^3))$. Ta đi tìm hệ số $[t^k] H(t)$ với $k in \{2, 4, 14\}$:

      #note-box(title: "💡 Giải nghĩa Sư phạm: Cơ chế khai triển nhân tử mẫu số")[
        Ta thực hiện đổi biến đại số để khai triển các phân thức phức tạp về dạng quen thuộc:
        - Nhân tử $A(t) = frac(1, (1-t^2)^2)$: Đặt $u = t^2$, ta áp dụng khai triển nhị thức âm bậc 2: $frac(1, (1-u)^2) = sum_(i=0)^(+oo) (i+1) u^i = 1 + 2u + 3u^2 + 4u^3 + ...$ Thay lại $u = t^2$ thu được chuỗi: $1 + 2t^2 + 3t^4 + 4t^6 + 5t^8 + ...$
        - Nhân tử $B(t) = frac(1, 1-t^3)$: Đặt $v = t^3$, áp dụng khai triển cấp số nhân lùi vô hạn: $frac(1, 1-v) = 1 + v + v^2 + v^3 + ...$ Thay lại $v = t^3$ thu được chuỗi: $1 + t^3 + t^6 + t^9 + ...$
        Tích chập $H(t) = A(t) dot.c B(t)$ là kết quả nhân phân phối hai chuỗi này để tìm hệ số đứng trước các lũy thừa của $t$.
      ]

      - Khai triển các nhân tử ở mẫu:
        - $A(t) = frac(1, (1-t^2)^2) = sum_(i=0)^(+oo) (i+1) t^(2i) = 1 + 2t^2 + 3t^4 + 4t^6 + 5t^8 + 6t^10 + 7t^12 + 8t^14 + ...$"""

if d2_ex5_target in content:
    content = content.replace(d2_ex5_target, d2_ex5_replacement)
    print("Success: Updated Dạng II Bài 5 explanation.")
else:
    print("Failed to find Dạng II Bài 5 target.")


# Fix duplicate numbering of Dạng V Bài 3 and Bài 4
# Old: === Bài 3 ★★★★ — Chọn Ghế Bàn Tròn Không Kề Nhau (Nâng Cao)
content = content.replace('=== Bài 3 ★★★★ — Chọn Ghế Bàn Tròn Không Kề Nhau (Nâng Cao)', '=== Bài 4 ★★★★ — Chọn Ghế Bàn Tròn Không Kề Nhau (Nâng Cao)')

# Old: === Bài 4 ★★★★ — Chọn Ghế Bàn Tròn Cách Nhau Ít Nhất m Ghế Trống (Bản Lĩnh Hàm Sinh)
content = content.replace('=== Bài 4 ★★★★ — Chọn Ghế Bàn Tròn Cách Nhau Ít Nhất m Ghế Trống (Bản Lĩnh Hàm Sinh)', '=== Bài 5 ★★★★ — Chọn Ghế Bàn Tròn Cách Nhau Ít Nhất m Ghế Trống (Bản Lĩnh Hàm Sinh)')

# Locate insertion point for Dạng V Bài 6 (which is at the end of Dạng V, right before '= Dạng VI — Trắc Nghiệm Đúng/Sai Tổng Hợp 📝')
idx_d6_header = content.find('= Dạng VI — Trắc Nghiệm Đúng/Sai Tổng Hợp 📝')

d5_ex6_insert = r"""=== Bài 6 ★★★★ — Chọn Tập Con Có Tổng Các Phần Tử Cho Trước (Đại Số Hóa Tập Con)
#tln(
  id: "5GF-6",
  [Cho tập hợp $S = \{1, 2, 3, 4, 5, 6, 7, 8\}$. Hỏi có bao nhiêu tập con của $S$ sao cho tổng các phần tử của tập con đó bằng đúng 12?],
  [$10$ tập con],
  loigiai: [
    #ppgiai[Đây là bài toán đếm tập con có tổng cho trước (Subset Sum Problem) trong lý thuyết tập hợp phổ thông. Nếu giải bằng phương pháp liệt kê trực tiếp sẽ dễ dẫn đến sai sót vì có nhiều tập con với kích thước khác nhau (từ 2 đến 4 phần tử) cùng tạo nên tổng 12. Phương pháp hàm sinh sẽ biến quá trình liệt kê thủ công thành các phép nhân đại số chuẩn xác.]

    #cach1-box[
      *Lập luận trực tiếp và phân tích theo kích thước tập con:*
      Gọi $A$ là tập con của $S = \{1, 2, ..., 8\}$ sao cho tổng các phần tử của $A$ bằng 12.
      Ta phân tích số 12 thành tổng các số nguyên dương phân biệt trong $S$:
      - *Trường hợp 1: Tập con có 1 phần tử.*
        Không thể xảy ra vì phần tử lớn nhất của $S$ chỉ là 8.
      - *Trường hợp 2: Tập con có 2 phần tử $\{a, b\} \subset S$ với $a < b$.*
        Ta tìm các cặp số có tổng bằng 12:
        $a + b = 12 \Rightarrow \{4, 8\}, \{5, 7\}$.
        $arrow.r$ Có *2 tập con*.
      - *Trường hợp 3: Tập con có 3 phần tử $\{a, b, c\} \subset S$ với $a < b < c$.*
        Ta tìm các bộ ba số có tổng bằng 12:
        - Nếu $a = 1$: $b + c = 11 \Rightarrow \{1, 3, 8\}, \{1, 4, 7\}, \{1, 5, 6\}$.
        - Nếu $a = 2$: $b + c = 10 \Rightarrow \{2, 3, 7\}, \{2, 4, 6\}$.
        - Nếu $a = 3$: $b + c = 9 \Rightarrow \{3, 4, 5\}$.
        $arrow.r$ Có *6 tập con*.
      - *Trường hợp 4: Tập con có 4 phần tử $\{a, b, c, d\} \subset S$ với $a < b < c < d$.*
        Ta tìm các bộ bốn số có tổng bằng 12.
        Nhận xét bộ bốn nhỏ nhất là $\{1, 2, 3, 4\}$ có tổng bằng $10$.
        - Nếu ta tăng các phần tử lên để có tổng bằng 12:
          - $\{1, 2, 3, 6\}$ (tổng $1+2+3+6=12$, thỏa mãn).
          - $\{1, 2, 4, 5\}$ (tổng $1+2+4+5=12$, thỏa mãn).
        $arrow.r$ Có *2 tập con*.
      - *Trường hợp 5: Tập con có từ 5 phần tử trở lên.*
        Tập con 5 phần tử nhỏ nhất của $S$ là $\{1, 2, 3, 4, 5\}$ đã có tổng bằng $15 > 12$. Do đó không tồn tại tập con nào có 5 phần tử trở lên thỏa mãn.
      
      Tổng số tập con thỏa mãn là: $2 + 6 + 2 = 10$ tập con.
    ]

    #cach2-box[
      *Sử dụng phương pháp hàm sinh:*
      Mỗi số nguyên $k \in S = \{1, 2, ..., 8\}$ được quyền xuất hiện đúng 0 hoặc 1 lần trong tập con được chọn.
      - Sự lựa chọn của số $k$ được đại số hóa bằng hàm sinh thành phần:
        $ G_k(x) = x^0 + x^k = 1 + x^k $
        Trong đó, $x^0 = 1$ tương ứng với không chọn số $k$, còn $x^k$ tương ứng với việc đưa số $k$ vào tập con.
      - Hàm sinh tổng thể cho tổng các phần tử của tập con là tích của 8 hàm sinh thành phần:
        $ G(x) = (1+x)(1+x^2)(1+x^3)(1+x^4)(1+x^5)(1+x^6)(1+x^7)(1+x^8) $
      - Số tập con có tổng phần tử bằng 12 chính là hệ số đứng trước $x^{12}$ trong khai triển của $G(x)$.
        Ta tìm $[x^{12}] G(x)$ bằng cách nhân phân phối thông minh qua hai nhóm đa thức:
        $ A(x) = (1+x)(1+x^2)(1+x^3)(1+x^4) $
        $ B(x) = (1+x^5)(1+x^6)(1+x^7)(1+x^8) $
        Khai triển đa thức $A(x)$:
        - Nhân 2 nhân tử đầu: $(1+x)(1+x^2) = 1 + x + x^2 + x^3$.
        - Nhân tiếp với $(1+x^3)$: $(1+x+x^2+x^3)(1+x^3) = 1 + x + x^2 + 2x^3 + x^4 + x^5 + x^6$.
        - Nhân tiếp với $(1+x^4)$:
          $ A(x) = (1+x+x^2+2x^3+x^4+x^5+x^6)(1+x^4) $
          $ A(x) = 1 + x + x^2 + 2x^3 + 2x^4 + 2x^5 + 2x^6 + 2x^7 + x^8 + x^9 + x^{10} $
        Khai triển đa thức $B(x)$, ta chỉ giữ lại các lũy thừa có số mũ không vượt quá 12:
        $ B(x) = 1 + x^5 + x^6 + x^7 + x^8 + x^11 + x^12 + o(x^12) $
        Tìm hệ số $[x^{12}] G(x) = [x^{12}] (A(x) \cdot B(x))$ bằng cách lấy tổng các tích $[x^m] A(x) \cdot [x^{12-m}] B(x)$ với các số mũ $12-m$ có mặt trong $B(x)$:
        - Với $12-m = 12 \Rightarrow m = 0 \Rightarrow [x^0] A(x) \cdot [x^{12}] B(x) = 1 \cdot 1 = 1$.
        - Với $12-m = 11 \Rightarrow m = 1 \Rightarrow [x^1] A(x) \cdot [x^{11}] B(x) = 1 \cdot 1 = 1$.
        - Với $12-m = 8 \Rightarrow m = 4 \Rightarrow [x^4] A(x) \cdot [x^8] B(x) = 2 \cdot 1 = 2$.
        - Với $12-m = 7 \Rightarrow m = 5 \Rightarrow [x^5] A(x) \cdot [x^7] B(x) = 2 \cdot 1 = 2$.
        - Với $12-m = 6 \Rightarrow m = 6 \Rightarrow [x^6] A(x) \cdot [x^6] B(x) = 2 \cdot 1 = 2$.
        - Với $12-m = 5 \Rightarrow m = 7 \Rightarrow [x^7] A(x) \cdot [x^5] B(x) = 2 \cdot 1 = 2$.
        Các trường hợp khác đều có hệ số bằng 0.
        
        Cộng các tích thành phần:
        $ [x^{12}] G(x) = 1 + 1 + 2 + 2 + 2 + 2 = 10 " tập con." $
      
      Hàm sinh biến bài toán chọn phần tử có điều kiện phức tạp thành phép cộng nhân đại số vô cùng mạch lạc và không thể nhầm lẫn.
    ]
    #ans-box[Có tất cả *10 tập con* thỏa mãn.]
  ]
)

"""

if idx_d6_header != -1:
    content = content[:idx_d6_header] + d5_ex6_insert + '\n' + content[idx_d6_header:]
    print("Success: Inserted Dạng V Bài 6.")
else:
    print("Failed to locate Dạng VI header.")

with open(target_file, 'w') as f:
    f.write(content)

print("Insertion and explanation finish!")
