target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

target_heading = '== 0.5 — Quy Trình 4 Bước Giải Bài Toán Bằng Hàm Sinh'

note_to_insert = """#note-box(title: "💡 Mối Liên Hệ: Tại sao bảng công thức đa dạng nhưng khi khai triển ta luôn dùng 1/(1-x)^k?")[
  Đây là một thắc mắc vô cùng tinh tế và là chìa khóa để hiểu phương pháp hàm sinh!
  
  *1. Bảng công thức là các \\"Viên gạch\\" thành phần:*
  Mỗi công thức trong bảng (như $frac(1, 1-x^2)$, $frac(1, 1-x^d)$) biểu diễn điều kiện riêng biệt của *từng biến lẻ*. Ví dụ: biến $x_1$ chỉ nhận giá trị chẵn $arrow.r$ hàm sinh thành phần là $frac(1, 1-x^2)$.
  
  *2. Phép biến đổi đưa về dạng nhị thức âm cơ bản:*
  Khi nhân các viên gạch này lại để tạo hàm sinh tổng $G(x)$, ta thường thu được các mẫu số có dạng $(1-x^d)^k$. Để khai triển các mẫu số này, ta *luôn luôn đưa về công thức nhị thức âm cơ bản* bằng phương pháp **đổi biến (thay thế biến)**:
  - Ví dụ, với phân thức $frac(1, (1-x^2)^3)$, ta đặt biến phụ $u = x^2$. Phân thức trở thành dạng nhị thức âm cơ bản theo biến $u$: $frac(1, (1-u)^3)$.
  - Áp dụng công thức nhị thức âm cho biến $u$:
    $
      frac(1, (1-u)^3) = sum_(m=0)^(+oo) C_(m+3-1)^(3-1) u^m = sum_(m=0)^(+oo) C_(m+2)^2 u^m
    $
  - Thay ngược lại $u = x^2$, ta có chuỗi khai triển theo biến $x$:
    $
      frac(1, (1-x^2)^3) = sum_(m=0)^(+oo) C_(m+2)^2 x^(2m)
    $
    Ta thấy chỉ số mũ của $x$ tăng theo bước nhảy là 2 ($x^0, x^2, x^4, ...$), nhưng hệ số đứng trước chúng vẫn tuân theo đúng quy luật của nhị thức âm!
  
  *Kết luận:* Công thức $frac(1, (1-x)^k)$ chính là **\\"máy xay đại số\\" duy nhất** giúp ta trích xuất hệ số của mẫu số. Mọi mẫu số phức tạp dạng $(1-x^d)^k$ đều chỉ là phiên bản đổi biến $u = x^d$ của công thức này!
]

"""

if target_heading in content:
    content = content.replace(target_heading, note_to_insert + target_heading)
    with open(target_file, 'w') as f:
        f.write(content)
    print("Success: Relation explanation inserted successfully!")
else:
    print("Failed to locate the target heading.")
