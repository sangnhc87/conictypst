target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

target_heading = '== 0.5 — Quy Trình 4 Bước Giải Bài Toán Bằng Hàm Sinh'

note_to_insert = """#note-box(title: "🔍 Tìm hiểu sâu: Tham số d trong biểu thức 1 - x^d nghĩa là gì?")[
  Để hiểu được hàm sinh đại diện cho các điều kiện chẵn, lẻ hay bội số, ta cần hiểu rõ ý nghĩa của tham số $d$. Trong tổ hợp, $d$ chính là **"bước nhảy"** (hoặc khoảng cách, mệnh giá) của các giá trị mà biến được phép nhận.
  
  *1. Cơ sở toán học:*
  Nhớ lại công thức tổng cấp số nhân lùi vô hạn với số hạng đầu là $1$ và công bội là $x^d$ ($|x| < 1$):
  $
    1 + x^d + x^(2d) + x^(3d) + ... = sum_(m=0)^(+oo) (x^d)^m = frac(1, 1-x^d)
  $
  Như vậy, phân thức $frac(1, 1-x^d)$ sinh ra một chuỗi mà các số mũ của $x$ đều là bội số của $d$.
  
  *2. Các ví dụ áp dụng "mịn" trong cuộc sống:*
  - *Ví dụ 1 (Đổi mệnh giá tiền xu):* Bạn muốn đổi tiền chỉ bằng các đồng xu mệnh giá $5$ đồng. Số tiền bạn chọn từ loại xu này chỉ có thể là: $0$đ, $5$đ, $10$đ, $15$đ, ... (đều là bội của $5$). 
    Hàm sinh tương ứng sẽ là:
    $
      1 + x^5 + x^10 + x^15 + ... = frac(1, 1-x^5)   ("ở đây " d = 5)
    $
  - *Ví dụ 2 (Chọn nhóm đồ vật):* Bạn mua các vỉ sữa, mỗi vỉ gồm đúng $4$ hộp. Số lượng hộp sữa bạn có thể mua chỉ có thể là: $0, 4, 8, 12, ...$ hộp.
    Hàm sinh tương ứng là:
    $
      1 + x^4 + x^8 + x^12 + ... = frac(1, 1-x^4)   ("ở đây " d = 4)
    $
  - *Ví dụ 3 (Ràng buộc số lẻ):* Biến số $x_i$ chỉ được phép nhận các giá trị lẻ $1, 3, 5, 7, ...$
    Mỗi số lẻ kế tiếp cách nhau đúng $2$ đơn vị (bước nhảy $d = 2$), và giá trị nhỏ nhất bắt đầu từ $1$. Ta thiết lập chuỗi:
    $
      x^1 + x^3 + x^5 + x^7 + ... = x(1 + x^2 + x^4 + x^6 + ...) = frac(x, 1-x^2)
    $
    Ta thấy dưới mẫu vẫn là $1-x^2$ (bước nhảy $d=2$), còn tử số chứa nhân tử $x^1$ chính là giá trị nhỏ nhất được chọn.
]

"""

if target_heading in content:
    content = content.replace(target_heading, note_to_insert + target_heading)
    with open(target_file, 'w') as f:
        f.write(content)
    print("Success: Parameter d explanation inserted successfully!")
else:
    print("Failed to locate the target heading.")
