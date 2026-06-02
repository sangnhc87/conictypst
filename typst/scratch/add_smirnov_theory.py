target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Locate insertion point before the pagebreak of Dạng I
idx_pagebreak = content.find('#pagebreak()\n\n// ═══════════════════════════════════════════════\n// DẠNG I: STARS AND BARS')

smirnov_theory_insert = r"""
== 0.6 — Kỹ Thuật Nâng Cao: Từ Smirnov & Hàm Sinh Phân Hoạch Chuỗi (Smirnov Words)

#rev-box(title: "📖 Định Nghĩa & Hàm Sinh Smirnov")[
  Trong lý thuyết tổ hợp đếm chuỗi (từ dựng bằng bảng chữ cái), một từ mà *không có hai chữ cái kề nhau nào giống nhau* được gọi là **từ Smirnov (Smirnov word)**. 
  
  Ví dụ: Chuỗi $D X D X "Den"$ là từ Smirnov, nhưng $D D X D "Den"$ thì không phải (vì có 2 chữ $D$ đứng cạnh nhau).

  Giả sử ta xét bảng chữ cái gồm $k$ chữ cái khác nhau. Gọi $x_i$ là biến hình thức đại diện cho chữ cái thứ $i$. Hàm sinh tổng quát cho các từ Smirnov bất kỳ được xác định bằng công thức vô cùng nổi tiếng:
  $
    Phi(x_1, x_2, ..., x_k) = frac(1, 1 - sum_(i=1)^k frac(x_i, 1 + x_i))
  $
  Đặc biệt, với trường hợp 3 loại chữ cái $x, y, z$ (tương ứng với các màu Đỏ, Xanh, Đen), hàm sinh Smirnov là:
  $
    Phi(x, y, z) = frac(1, 1 - lr((frac(x, 1+x) + frac(y, 1+y) + frac(z, 1+z))))
  $
]

#note-box(title: "🛠️ Nguyên Lý Đổi Biến Cấu Trúc Khối (Block Substitution Rule)")[
  Khi ta muốn đếm số lượng từ bất kỳ thỏa mãn các khối liên tiếp cùng loại (ví dụ: nhóm các viên bi cùng màu đứng cạnh nhau) có độ dài thuộc một tập hợp $S$ cho trước, ta có thể xây dựng trực tiếp từ hàm sinh Smirnov bằng phép thế biến:
  
  Mỗi biến đơn lẻ $x_i$ trong hàm sinh Smirnov đại diện cho một khối cùng màu đứng liên tiếp. Nếu ta định nghĩa hàm sinh cho các độ dài khối là $f_i(x_i)$, ta chỉ cần thay thế trực tiếp:
  $
    x_i arrow.r f_i(x_i)
  $
  khi đó hàm sinh tổng thể sẽ trở thành:
  $
    G(x_1, ..., x_k) = Phi(f_1(x_1), ..., f_k(x_k)) = frac(1, 1 - sum_(i=1)^k frac(f_i(x_i), 1 + f_i(x_i)))
  $
  
  *Ví dụ minh họa:*
  1. *Nếu độ dài khối có thể nhận mọi giá trị $L >= 1$*: Hàm sinh của khối là $f(x) = x + x^2 + x^3 + ... = frac(x, 1-x)$. 
     Thế vào ta có: $frac(f(x), 1+f(x)) = frac(frac(x, 1-x), 1 + frac(x, 1-x)) = x$.
     Hàm sinh trở thành: $G = frac(1, 1 - (x_1 + x_2 + ... + x_k))$, chính là hàm sinh đếm số chuỗi bất kỳ không ràng buộc.
  2. *Nếu ta muốn kiểm soát số khối có độ dài bằng 2 (dùng biến đánh dấu $t$)* và các khối khác đều có độ dài 1:
     Hàm sinh cho khối khi này chỉ gồm độ dài 1 (trọng số $x$) và độ dài 2 (trọng số $t x^2$): $f(x) = x + t x^2$.
     Thành phần tương ứng trong mẫu số sẽ là:
     $
       frac(f(x), 1+f(x)) = frac(x + t x^2, 1 + x + t x^2)
     $
     Đây chính là cơ sở đại số cho phương pháp giải quyết các bài toán đếm sắp xếp có ràng buộc kề nhau cực kỳ phức tạp!
]
"""

if idx_pagebreak != -1:
    content = content[:idx_pagebreak] + smirnov_theory_insert + '\n' + content[idx_pagebreak:]
    print("Success: Inserted Smirnov theory section.")
else:
    print("Failed to locate insertion point.")

# Cleanup LaTeX remnants
content = content.replace(r'\subset', ' subset ')
content = content.replace(r'\in', ' in ')
content = content.replace(r'\approx', ' approx ')
content = content.replace(r'\Omega', ' Omega ')

with open(target_file, 'w') as f:
    f.write(content)

print("Insertion of Smirnov theory finish!")
