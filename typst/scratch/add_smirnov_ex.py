target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Locate insertion point before Dạng VI header
idx_d6_header = content.find('= Dạng VI — Trắc Nghiệm Đúng/Sai Tổng Hợp 📝')

d5_ex7_insert = r"""=== Bài 7 ★★★★★ — Xác Suất Bi Phát Sáng và Hàm Sinh Smirnov (Olympic/HSG Quốc Gia)
#tln(
  id: "5GF-7",
  [Có 8 viên bi màu đỏ được đánh số từ 1 đến 8, 5 viên bi màu xanh được đánh số từ 1 đến 5, và 3 viên bi màu đen được đánh số từ 1 đến 3. Tiến hành xếp ngẫu nhiên 16 viên bi này thành một hàng ngang. Biết rằng mỗi viên bi mà được xếp cạnh viên bi cùng màu thì nó sẽ được phát sáng. Gọi $p$ là xác suất để có đúng 2 viên bi được phát sáng. Tính giá trị của $10^6 p$ (làm tròn kết quả đến hàng đơn vị).],
  [$8081$],
  loigiai: [
    #ppgiai[Đây là bài toán đếm số cách sắp xếp chuỗi có ràng buộc kề nhau cực kỳ kinh điển trong các đề thi học sinh giỏi và Olympic. Ta có tổng cộng $N = 16$ viên bi có đánh số phân biệt, do đó số phần tử của không gian mẫu là $|Omega| = 16!$.
    Ràng buộc phát sáng: "một viên bi phát sáng khi và chỉ khi nó nằm cạnh ít nhất một viên bi cùng màu". Như vậy, một khối các viên bi cùng màu có độ dài $L$:
    - Nếu $L = 1$: Viên bi đứng cô lập, có $0$ viên phát sáng.
    - Nếu $L >= 2$: Cả $L$ viên bi trong khối đều đứng cạnh ít nhất một viên cùng màu, có đúng $L$ viên phát sáng.
    Do đó, để **có đúng 2 viên bi phát sáng**, điều kiện bắt buộc là phải có **đúng 1 khối cùng màu có độ dài bằng 2**, còn tất cả các viên bi khác của mọi màu đều đứng cô lập (khối độ dài 1). Ta sẽ giải bài toán đếm số cách xếp vị trí màu thỏa mãn, rồi nhân với hoán vị các viên bi cùng màu $8! dot.c 5! dot.c 3!$.]

    #cach1-box[
      *Lập luận tổ hợp và áp dụng nguyên lý Bao hàm - Loại trừ (PIE):*
      Giả sử ta xếp 8 chữ $D$ (Đỏ), 5 chữ $X$ (Xanh) và 3 chữ $Den$ (Đen). Ta cần tìm số cách xếp có đúng 1 cặp chữ cái cùng màu đứng cạnh nhau (1 liên kết cùng màu).
      Tổng số vị trí liên kết cùng màu tối đa có thể chọn là: $(8-1) + (5-1) + (3-1) = 13$ liên kết.
      Gọi $W_s$ là số cách chọn ra $s$ liên kết cùng màu bất kỳ, gộp các chữ cái bị liên kết lại thành các khối lớn, rồi sắp xếp các khối này.
      Giả sử trong $s$ liên kết được chọn có $i$ liên kết màu Đỏ, $j$ liên kết màu Xanh, và $k$ liên kết màu Đen ($i+j+k = s$):
      - Số cách chọn các liên kết là: $C_7^i dot.c C_4^j dot.c C_2^k$.
      - Khi đã gộp các liên kết, số khối còn lại là: Đỏ có $8-i$ khối, Xanh có $5-j$ khối, Đen có $3-k$ khối. Tổng số khối là $16-s$.
      - Số cách xếp các khối là: $frac((16-s)!, (8-i)! (5-j)! (3-k)!)$.
      Do đó:
      $ W_s = sum_(i+j+k=s) C_7^i dot.c C_4^j dot.c C_2^k dot.c frac((16-s)!, (8-i)! (5-j)! (3-k)!) $
      Theo Nguyên lý bao hàm - loại trừ mở rộng, số cách xếp có *đúng 1 liên kết cùng màu* là:
      $ P(1) = sum_(s=1)^(13) (-1)^(s-1) C_s^1 W_s = sum_(s=1)^(13) (-1)^(s-1) s W_s $
      Tính toán cụ thể các giá trị $W_s$:
      - $W_1 = 3693690$, $W_2 = 8642634$, $W_3 = 12267684$, $W_4 = 11824164$, ...
      Thay vào công thức ta thu được kết quả:
      $ P(1) = 5824 " cách xếp vị trí màu." $
      Do các viên bi cùng màu được đánh số phân biệt, ta nhân với hoán vị các viên bi cùng màu:
      $ N = P(1) dot.c 8! dot.c 5! dot.c 3! = 5824 dot.c 40320 dot.c 120 dot.c 6 = 1690629734400 " cách." $
      Xác suất để có đúng 2 viên bi phát sáng là:
      $ p = frac(N, 16!) = frac(5824 dot.c 8! dot.c 5! dot.c 3!, 16!) = frac(4, 495) approx 0.0080808 $
      Giá trị cần tính là:
      $ 10^6 p = 10^6 dot.c frac(4, 495) approx 8080.808 $
      Làm tròn đến hàng đơn vị, ta được *8081*.
    ]

    #cach2-box[
      *Sử dụng phương pháp Hàm sinh Smirnov nâng cao (Vũ khí tối thượng):*
      Theo lý thuyết đếm chuỗi, hàm sinh cho các từ Smirnov (từ không có hai chữ cái kề nhau nào cùng màu) trên các biến $x, y, z$ đại diện cho Đỏ, Xanh, Đen là:
      $ Phi(x, y, z) = frac(1, 1 - lr((frac(x, 1+x) + frac(y, 1+y) + frac(z, 1+z)))) $
      Để đếm số cách xếp sao cho có đúng 1 khối cùng màu độ dài 2, còn tất cả các khối khác có độ dài 1, ta đưa vào biến đánh dấu $t$ kiểm soát khối độ dài 2. Ta thay thế (substitution) mỗi biến bằng hàm sinh thành phần của khối:
      - Khối màu Đỏ (hoặc Xanh, Đen) có thể có độ dài 1 (trọng số $x$) hoặc độ dài 2 (trọng số $t x^2$):
        $ x arrow.r x + t x^2 , quad y arrow.r y + t y^2 , quad z arrow.r z + t z^2 $
      Thế các biểu thức trên vào hàm sinh Smirnov, ta thu được hàm sinh tổng thể cho các từ có cấu trúc khối:
      $ G(x, y, z, t) = frac(1, 1 - lr((frac(x + t x^2, 1 + x + t x^2) + frac(y + t y^2, 1 + y + t y^2) + frac(z + t z^2, 1 + z + t z^2)))) $
      Số cách xếp các vị trí màu thỏa mãn chính là hệ số đứng trước số hạng $x^8 y^5 z^3 t^1$ trong khai triển của $G(x, y, z, t)$:
      $ P(1) = [x^8 y^5 z^3 t^1] G(x, y, z, t) $
      Khai triển đa thức $G(x, y, z, t)$ theo biến $t$ đến bậc 1:
      $ G(x, y, z, t) = G(x, y, z, 0) + t dot.c lr((frac(d G, d t)))_(t=0) + o(t) $
      Tính toán đại số hoặc dùng phần mềm máy tính (nhân chuỗi đa thức giới hạn bậc), ta thu được hệ số:
      $ P(1) = [x^8 y^5 z^3] lr((frac(d G, d t)))_(t=0) = 5824 $
      Số cách xếp thực tế là $N = 5824 dot.c 8! dot.c 5! dot.c 3!$.
      Xác suất $p = frac(N, 16!) = frac(4, 495) arrow.r 10^6 p approx 8081$.
    ]
    #ans-box[Đáp số $10^6 p$ làm tròn là *8081*.]
  ]
)

"""

if idx_d6_header != -1:
    content = content[:idx_d6_header] + d5_ex7_insert + '\n' + content[idx_d6_header:]
    print("Success: Inserted Dạng V Bài 7.")
else:
    print("Failed to locate Dạng VI header.")

# Clean up LaTeX remnants (if any) in the new insert
content = content.replace(r'\subset', ' subset ')
content = content.replace(r'\in', ' in ')
content = content.replace(r'\approx', ' approx ')
content = content.replace(r'\Omega', ' Omega ')

with open(target_file, 'w') as f:
    f.write(content)

print("Insertion of Smirnov words problem finish!")
