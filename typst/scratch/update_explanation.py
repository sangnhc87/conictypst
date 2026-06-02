target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

old_block = """#thm-box(title: "📐 Công Thức Khai Triển Quan Trọng Nhất (Hệ Số Nhị Thức Âm)")[
  Với mọi số nguyên dương $k$, ta có khai triển Taylor:
  $
    frac(1, (1-x)^k) = sum_(n=0)^(+oo) C_(n+k-1)^(k-1) x^n
  $
  Do đó, hệ số trích xuất vô cùng quan trọng để giải các bài toán vách ngăn là:
  $
    [x^n] frac(1, (1-x)^k) = C_(n+k-1)^(k-1)
  $
]"""

new_block = """#thm-box(title: "📐 Công Thức Khai Triển Quan Trọng Nhất (Hệ Số Nhị Thức Âm)")[
  Đây là "linh hồn" và công cụ đắc lực nhất để giải các bài toán vách ngăn bằng hàm sinh. Hãy cùng tìm hiểu nó từ những ví dụ trực quan nhất để thấy nó không hề khô khan.

  *1. Xuất phát từ việc nhân các chuỗi kẹo:*
  Ta biết hàm sinh cho việc nhận kẹo của $k$ người không điều kiện ($>=0$) là:
  $
    G(x) = lr(frac(1, 1-x))^k = frac(1, (1-x)^k) = (1 + x + x^2 + x^3 + ...)^k
  $
  
  *2. Thử với các giá trị $k$ nhỏ để thấy quy luật:*
  - *Với $k=1$* (chia kẹo cho 1 người):
    $
      frac(1, 1-x) = 1 + 1x + 1x^2 + ... + 1x^n + ...
    $
    Mỗi hệ số của $x^n$ đều bằng $1$ (có đúng 1 cách chia $n$ kẹo cho 1 người). Công thức tổ hợp vách ngăn là $C_n^0 = C_(n+1-1)^(1-1) = 1$.
  - *Với $k=2$* (chia kẹo cho 2 người):
    Khi nhân hai chuỗi $(1 + x + x^2 + ...)(1 + x + x^2 + ...)$, ta tìm hệ số của $x^n$ bằng cách đếm các cặp $(x_1, x_2)$ có tổng bằng $n$:
    $
      frac(1, (1-x)^2) = 1 + 2x + 3x^2 + 4x^3 + ... + (n+1)x^n + ...
    $
    Hệ số của $x^n$ là $n+1$ (có $n+1$ cách chia $n$ kẹo cho 2 người). Công thức tổ hợp là $C_(n+2-1)^(2-1) = C_(n+1)^1 = n+1$.
  - *Với $k=3$* (chia kẹo cho 3 người):
    $
      frac(1, (1-x)^3) = 1 + 3x + 6x^2 + 10x^3 + ... + frac((n+2)(n+1), 2)x^n + ...
    $
    Hệ số của $x^n$ là $frac((n+2)(n+1), 2)$ (số cách chia $n$ kẹo cho 3 người). Công thức tổ hợp tương ứng là $C_(n+3-1)^(3-1) = C_(n+2)^2 = frac((n+2)(n+1), 2)$.

  *3. Công thức tổng quát cho $k$ bất kỳ:*
  Từ sự tương thích hoàn hảo giữa số nghiệm vách ngăn (Tổ hợp) và hệ số của phép nhân chuỗi (Đại số), ta có công thức tổng quát:
  $
    frac(1, (1-x)^k) = sum_(n=0)^(+oo) C_(n+k-1)^(k-1) x^n
  $
  Ký hiệu trích xuất hệ số đứng trước $x^n$ trong khai triển này là:
  $
    [x^n] frac(1, (1-x)^k) = C_(n+k-1)^(k-1)
  $
  
  *Mẹo ghi nhớ nhanh:* Để lấy hệ số của $x^n$ trong phân thức $frac(1, (1-x)^k)$, ta lấy tổ hợp chập $k-1$ của tổng: (số mũ $n$ + số dưới mẫu $k$ - 1).
]"""

if old_block in content:
    content = content.replace(old_block, new_block)
    with open(target_file, 'w') as f:
        f.write(content)
    print("Explanation updated successfully!")
else:
    # Try normalized spacing
    normalized_content = content.replace('\r\n', '\n')
    normalized_old = old_block.replace('\r\n', '\n')
    if normalized_old in normalized_content:
        normalized_content = normalized_content.replace(normalized_old, new_block)
        with open(target_file, 'w') as f:
            f.write(normalized_content)
        print("Explanation updated successfully (with line ending normalization)!")
    else:
        print("Failed to find old block.")
