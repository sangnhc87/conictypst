import sys

target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# --- Exercise for Dạng I ---
d1_anchor = '=== Bài 1 ★ — Bài Toán Chia Kẹo Không Điều Kiện (Dễ)'
d1_insert = """=== Bài 1A ★ — Bài Toán Chọn Tập Vở Hai Loại (Siêu Dễ)
#tln(
  id: "1GF-1A",
  [Một học sinh muốn chọn mua đúng 3 quyển vở từ 2 loại vở khác nhau: vở kẻ ngang và vở ô ly. Biết số lượng mỗi loại vở ở cửa hàng là không giới hạn. Hỏi học sinh đó có bao nhiêu cách chọn?],
  [$4$ cách],
  loigiai: [
    #ppgiai[Đây là bài toán chọn phần tử có lặp, tương đương với việc tìm số nghiệm nguyên không âm của phương trình $x_1 + x_2 = 3$, trong đó $x_1, x_2$ lần lượt là số vở kẻ ngang và vở ô ly được chọn.]

    #cach1-box[
      *Lập luận trực tiếp và liệt kê:*
      Ta chỉ ra tất cả các cách chọn bộ số $(x_1, x_2)$ có tổng bằng 3:
      - Cách 1: $(3, 0)$ (chọn 3 vở kẻ ngang, 0 vở ô ly).
      - Cách 2: $(2, 1)$ (chọn 2 vở kẻ ngang, 1 vở ô ly).
      - Cách 3: $(1, 2)$ (chọn 1 vở kẻ ngang, 2 vở ô ly).
      - Cách 4: $(0, 3)$ (chọn 0 vở kẻ ngang, 3 vở ô ly).
      
      Sử dụng công thức chia kẹo (Stars and Bars) với $n = 3$ phần tử và $k = 2$ loại:
      $
        N = C_(3+2-1)^(2-1) = C_4^1 = 4 " cách."
      $
    ]

    #cach2-box[
      *Sử dụng hàm sinh:*
      Mỗi loại vở có thể được chọn với số lượng tùy ý từ 0 đến 3 quyển. Hàm sinh đại diện cho mỗi loại vở là:
      $
        G_1(x) = G_2(x) = 1 + x^1 + x^2 + x^3 + ... = frac(1, 1-x)
      $
      Hàm sinh cho tổng số vở chọn được từ cả hai loại là:
      $
        G(x) = G_1(x) dot.c G_2(x) = lr(frac(1, 1-x))^2 = frac(1, (1-x)^2)
      $
      Số cách chọn ra 3 quyển vở chính là hệ số của $x^3$ trong khai triển của $G(x)$:
      $
        [x^3] G(x) = [x^3] sum_(n=0)^(+oo) C_(n+2-1)^(2-1) x^n = C_(3+2-1)^(2-1) = C_4^1 = 4 " cách."
      $
    ]
    #ans-box[Có tất cả *4 cách* chọn tập vở.]
  ]
)

=== Bài 1B ★ — Phương Trình Nghiệm Nguyên Dương Cơ Bản (Dễ)
#tln(
  id: "1GF-1B",
  [Tìm số nghiệm nguyên dương của phương trình: $x_1 + x_2 + x_3 = 5$.],
  [$6$ nghiệm],
  loigiai: [
    #ppgiai[Vì nghiệm yêu cầu nguyên dương nên các biến $x_i >= 1$. Ta có thể biến đổi biến số hoặc dùng hàm sinh có số mũ bắt đầu từ 1.]

    #cach1-box[
      *Sử dụng tổ hợp vách ngăn (Stars and Bars):*
      Xếp 5 ngôi sao biểu thị giá trị 5 thành một hàng ngang. Giữa 5 ngôi sao có đúng $5-1=4$ khoảng trống.
      Để chia thành 3 phần dương, ta chọn đặt 2 vách ngăn vào 4 khoảng trống này.
      Số cách chọn là:
      $
        N = C_(5-1)^(3-1) = C_4^2 = 6 " nghiệm."
      $
      Các nghiệm cụ thể gồm: $(1,1,3)$, $(1,2,2)$, $(1,3,1)$, $(2,1,2)$, $(2,2,1)$, $(3,1,1)$.
    ]

    #cach2-box[
      *Sử dụng hàm sinh:*
      Mỗi biến $x_i >= 1$ có hàm sinh tương ứng là:
      $
        G_i(x) = x^1 + x^2 + x^3 + ... = x(1 + x + x^2 + ...) = frac(x, 1-x)
      $
      Hàm sinh cho tổng $x_1 + x_2 + x_3$ của ba biến là:
      $
        G(x) = G_1(x) G_2(x) G_3(x) = lr(frac(x, 1-x))^3 = frac(x^3, (1-x)^3)
      $
      Số nghiệm chính là hệ số của $x^5$ trong khai triển $G(x)$:
      $
        [x^5] G(x) = [x^5] frac(x^3, (1-x)^3) = [x^2] frac(1, (1-x)^3)
      $
      Áp dụng công thức hệ số:
      $
        [x^2] frac(1, (1-x)^3) = C_(2+3-1)^(3-1) = C_4^2 = 6 " nghiệm."
      $
    ]
    #ans-box[Phương trình có đúng *6 nghiệm* nguyên dương.]
  ]
)

"""

# --- Exercise for Dạng II ---
d2_anchor = '=== Bài 1 ★ — Tất Cả Các Biến Đều Chẵn (Dễ)'
d2_insert = """=== Bài 1A ★ — Tổng Hai Biến Chẵn Đơn Giản (Siêu Dễ)
#tln(
  id: "2GF-1A",
  [Tìm số nghiệm nguyên không âm của phương trình $x_1 + x_2 = 6$ sao cho cả hai biến $x_1$ và $x_2$ đều phải nhận giá trị chẵn.],
  [$4$ nghiệm],
  loigiai: [
    #ppgiai[Các biến đều nhận giá trị chẵn và tổng rất nhỏ, ta có thể dễ dàng giải bằng cách đặt ẩn phụ hoặc khai triển hàm sinh trực quan.]

    #cach1-box[
      *Lập luận trực tiếp và đặt ẩn phụ:*
      Vì $x_1, x_2$ chẵn không âm nên ta liệt kê các bộ nghiệm $(x_1, x_2)$ có tổng bằng 6:
      - Các bộ thỏa mãn là: $(6, 0)$, $(4, 2)$, $(2, 4)$, $(0, 6)$. Tổng cộng có *4 nghiệm*.
      
      Hoặc đặt ẩn phụ: $x_1 = 2a$, $x_2 = 2b$ với $a, b >= 0$ nguyên.
      Thay vào phương trình ta được: $2a + 2b = 6 arrow.r a + b = 3$.
      Số nghiệm của phương trình mới là:
      $
        N = C_(3+2-1)^(2-1) = C_4^1 = 4 " nghiệm."
      $
    ]

    #cach2-box[
      *Sử dụng hàm sinh:*
      Mỗi biến chẵn có hàm sinh tương ứng là:
      $
        G_i(x) = 1 + x^2 + x^4 + x^6 + ... = frac(1, 1-x^2)
      $
      Hàm sinh tổng thể cho hai biến là:
      $
        G(x) = G_1(x) G_2(x) = lr(frac(1, 1-x^2))^2 = frac(1, (1-x^2)^2)
      $
      Cần tìm hệ số của $x^6$ trong khai triển $G(x)$. Đặt $u = x^2$, ta tìm hệ số của $u^3$ trong $frac(1, (1-u)^2)$:
      $
        [u^3] frac(1, (1-u)^2) = C_(3+2-1)^(2-1) = C_4^1 = 4 " nghiệm."
      $
    ]
    #ans-box[Có tất cả *4 nghiệm* chẵn thỏa mãn.]
  ]
)

"""

# --- Exercise for Dạng III ---
d3_anchor = '=== Bài 1 ★ — Bài Toán Đổi Tiền Xu Cơ Bản (Dễ)'
d3_insert = """=== Bài 1A ★ — Đổi Tiền Xu Mệnh Giá Nhỏ (Siêu Dễ)
#tln(
  id: "3GF-1A",
  [Có bao nhiêu cách đổi một mệnh giá xu 4 đồng thành các đồng tiền xu có mệnh giá 1 đồng và 2 đồng?],
  [$3$ cách],
  loigiai: [
    #ppgiai[Đây là bài toán đếm số nghiệm nguyên không âm của phương trình $a + 2b = 4$.]

    #cach1-box[
      *Lập luận trực tiếp:*
      Gọi $b$ là số đồng tiền xu mệnh giá 2 đồng ($b >= 0$, nguyên). Do $2b <= 4$ nên $b$ chỉ có thể nhận các giá trị: $b in \{0, 1, 2\}$.
      - Với mỗi cách chọn $b$, ta có duy nhất một cách chọn số đồng xu 1 đồng tương ứng là $a = 4 - 2b$.
      - Cụ thể các cặp nghiệm $(a, b)$ là: $(4, 0)$, $(2, 1)$, $(0, 2)$.
      
      Vậy có đúng *3 cách* đổi tiền.
    ]

    #cach2-box[
      *Sử dụng hàm sinh:*
      Hàm sinh cho loại xu 1 đồng là $frac(1, 1-x) = 1 + x^1 + x^2 + x^3 + x^4 + ...$
      Hàm sinh cho loại xu 2 đồng là $frac(1, 1-x^2) = 1 + x^2 + x^4 + x^6 + ...$
      Hàm sinh tổng quát là:
      $
        G(x) = frac(1, (1-x)(1-x^2))
      $
      Ta tìm hệ số $[x^4] G(x)$ bằng cách nhân trực tiếp hai chuỗi:
      $
        [x^4] lr( (1 + x + x^2 + x^3 + x^4) (1 + x^2 + x^4) )
      $
      Các số hạng tạo ra $x^4$ là:
      $
        1 dot.c x^4 + x^2 dot.c x^2 + x^4 dot.c 1 = 3x^4
      $
      Hệ số của $x^4$ là 3.
    ]
    #ans-box[Có tất cả *3 cách* đổi mệnh giá 4 đồng.]
  ]
)

"""

# --- Exercise for Dạng IV ---
d4_anchor = '=== Bài 1 ★★ — Bài Toán Lát Gạch Chữ Nhật Bằng Domino (Trung Bình)'
d4_insert = """=== Bài 1A ★ — Hệ Thức Truy Hồi Cấp Một Kinh Điển (Siêu Dễ)
#tln(
  id: "4GF-1A",
  [Cho dãy số $(a_n)$ được xác định bởi công thức truy hồi: $a_0 = 1$ và $a_n = 2a_(n-1)$ với mọi $n >= 1$. Tìm công thức tổng quát của dãy số $(a_n)$ bằng phương pháp hàm sinh.],
  [$a_n = 2^n$],
  loigiai: [
    #ppgiai[Đây là dãy cấp số nhân cơ bản. Ta sẽ dùng phương pháp quy nạp trực tiếp và hàm sinh để giải quyết.]

    #cach1-box[
      *Phương pháp lập luận quy nạp trực tiếp:*
      Tính một vài số hạng đầu tiên của dãy số:
      - $a_0 = 1$.
      - $a_1 = 2 a_0 = 2 = 2^1$.
      - $a_2 = 2 a_1 = 4 = 2^2$.
      - $a_3 = 2 a_2 = 8 = 2^3$.
      
      Nhận xét quy luật: $a_n = 2^n$. Ta chứng minh bằng quy nạp:
      - Với $n = 0$: $a_0 = 2^0 = 1$ (đúng).
      - Giả sử $a_k = 2^k$ đúng với $n=k >= 0$.
      - Với $n=k+1$, ta có $a_(k+1) = 2 a_k = 2 dot.c 2^k = 2^(k+1)$ (đúng).
      Vậy công thức tổng quát là $a_n = 2^n$ với mọi $n >= 0$.
    ]

    #cach2-box[
      *Sử dụng hàm sinh:*
      Đặt hàm sinh của dãy số là $G(x) = sum_(n=0)^(+oo) a_n x^n$.
      Ta nhân hai vế của phương trình truy hồi $a_n = 2 a_(n-1)$ với $x^n$ và lấy tổng từ $n=1$ đến $+oo$:
      $
        sum_(n=1)^(+oo) a_n x^n = 2 sum_(n=1)^(+oo) a_(n-1) x^n
      $
      Biến đổi vế trái và vế phải:
      $
        G(x) - a_0 = 2 x sum_(n=1)^(+oo) a_(n-1) x^(n-1) arrow.r G(x) - 1 = 2 x G(x)
      $
      Giải phương trình đại số để tìm $G(x)$:
      $
        G(x) (1 - 2x) = 1 arrow.r G(x) = frac(1, 1 - 2x)
      $
      Áp dụng khai triển chuỗi lũy thừa cơ bản:
      $
        G(x) = sum_(n=0)^(+oo) (2x)^n = sum_(n=0)^(+oo) 2^n x^n
      $
      Trích hệ số để tìm số hạng tổng quát của dãy:
      $
        a_n = [x^n] G(x) = 2^n
      $
    ]
    #ans-box[Công thức tổng quát của dãy là $a_n = 2^n$.]
  ]
)

"""

# Perform sequential insertions
if d1_anchor in content:
    content = content.replace(d1_anchor, d1_insert + d1_anchor)
    print("Dạng I exercise inserted.")
else:
    print("Failed to find Dạng I anchor.")
    sys.exit(1)

if d2_anchor in content:
    content = content.replace(d2_anchor, d2_insert + d2_anchor)
    print("Dạng II exercise inserted.")
else:
    print("Failed to find Dạng II anchor.")
    sys.exit(1)

if d3_anchor in content:
    content = content.replace(d3_anchor, d3_insert + d3_anchor)
    print("Dạng III exercise inserted.")
else:
    print("Failed to find Dạng III anchor.")
    sys.exit(1)

if d4_anchor in content:
    content = content.replace(d4_anchor, d4_insert + d4_anchor)
    print("Dạng IV exercise inserted.")
else:
    print("Failed to find Dạng IV anchor.")
    sys.exit(1)

with open(target_file, 'w') as f:
    f.write(content)

print("All modifications applied successfully!")
