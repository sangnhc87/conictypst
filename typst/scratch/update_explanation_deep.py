target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# We locate the start of the block we want to replace
idx_start = content.find('#thm-box(title: "📐 Công Thức Khai Triển Quan Trọng Nhất (Hệ Số Nhị Thức Âm)")[')
# We locate the end of the block (the matching closing bracket before '== 0.5 — Quy Trình 4 Bước')
idx_end = content.find('== 0.5 — Quy Trình 4 Bước Giải Bài Toán Bằng Hàm Sinh')

if idx_start != -1 and idx_end != -1:
    new_block = """#thm-box(title: "📐 Công Thức Khai Triển Quan Trọng Nhất (Hệ Số Nhị Thức Âm)")[
  Đây là "linh hồn" và công cụ đắc lực nhất để giải các bài toán vách ngăn bằng hàm sinh. Hãy cùng bóc tách nó từng bước bằng các kiến thức Toán phổ thông lớp 11 để thấy nó không hề xa lạ.

  *A. Xuất phát từ Cấp số nhân lùi vô hạn (Lớp 11):*
  Trong chương trình Toán 11, ta đã biết công thức tính tổng của một cấp số nhân lùi vô hạn có số hạng đầu $u_1 = 1$ và công bội $q = x$ với $|x| < 1$:
  $
    S = u_1 + u_1 q + u_1 q^2 + ... = 1 + x + x^2 + x^3 + ...
  $
  Theo công thức tổng cấp số nhân lùi vô hạn $S = frac(u_1, 1-q)$, ta có ngay:
  $
    frac(1, 1-x) = 1 + x + x^2 + x^3 + ...
  $
  Đây chính là hàm sinh cơ bản nhất!

  *B. Chứng minh các công thức bậc cao bằng Đạo hàm (Lớp 11):*
  Làm thế nào để tìm khai triển cho $frac(1, (1-x)^2)$ hay $frac(1, (1-x)^3)$? Ta chỉ cần dùng đạo hàm lớp 11:
  - *Với bậc hai ($k=2$):* Đạo hàm hai vế của đẳng thức cấp số nhân:
    $
      lr(frac(1, 1-x))' = (1 + x + x^2 + x^3 + ...)' \
      arrow.r frac(1, (1-x)^2) = 1 + 2x + 3x^2 + 4x^3 + ... = sum_(n=0)^(+oo) (n+1)x^n
    $
    Ta nhận thấy hệ số của $x^n$ là $n+1$, chính là tổ hợp $C_(n+1)^1 = C_(n+2-1)^(2-1)$.
  - *Với bậc ba ($k=3$):* Tiếp tục đạo hàm hai vế của đẳng thức vừa tìm được:
    $
      lr(frac(1, (1-x)^2))' = (1 + 2x + 3x^2 + 4x^3 + ...)' \
      arrow.r frac(2, (1-x)^3) = 2 + 6x + 12x^2 + ... = sum_(n=1)^(+oo) n(n+1)x^(n-1) = sum_(n=0)^(+oo) (n+1)(n+2)x^n
    $
    Chia cả hai vế cho 2, ta thu được:
    $
      frac(1, (1-x)^3) = 1 + 3x + 6x^2 + 10x^3 + ... = sum_(n=0)^(+oo) frac((n+1)(n+2), 2)x^n
    $
    Ta nhận thấy hệ số của $x^n$ là $frac((n+2)(n+1), 2)$, chính là tổ hợp $C_(n+2)^2 = C_(n+3-1)^(3-1)$.

  *C. Giải mã ký hiệu Trích hệ số $[x^n]$:*
  Ký hiệu $[x^n] G(x)$ đơn giản là câu lệnh: *"Hãy tìm hệ số đứng trước lũy thừa $x^n$ sau khi đã khai triển chuỗi $G(x)$"*.
  - *Ví dụ:* Nếu ta có đa thức $P(x) = 7 + 4x^2 + 9x^3$, thì:
    - $[x^0] P(x) = 7$ (hệ số tự do).
    - $[x^1] P(x) = 0$ (vì không có số hạng chứa $x^1$).
    - $[x^2] P(x) = 4$, và $[x^3] P(x) = 9$.

  *D. Công thức tổng quát cho $k$ bất kỳ:*
  Quy nạp từ đạo hàm bậc cao (hoặc đối chiếu trực tiếp với bài toán chia kẹo cho $k$ học sinh không điều kiện có số nghiệm là $C_(n+k-1)^(k-1)$), ta có công thức tổng quát với mọi số nguyên dương $k$:
  $
    frac(1, (1-x)^k) = sum_(n=0)^(+oo) C_(n+k-1)^(k-1) x^n
  $
  Do đó, hệ số trích xuất đại số tương ứng là:
  $
    [x^n] frac(1, (1-x)^k) = C_(n+k-1)^(k-1)
  $
  *Mẹo nhớ nhanh hệ số:*
  $
    [x^("n")] frac(1, (1-x)^("k")) = C_("n" + "k" - 1)^("k" - 1)
  $
]

"""
    # Replace content between idx_start and idx_end
    # We find the last closing bracket index of the thm-box before the next heading
    content_replaced = content[:idx_start] + new_block + content[idx_end:]
    with open(target_file, 'w') as f:
        f.write(content_replaced)
    print("Success: Explanation updated to deep version!")
else:
    print("Failed to locate blocks.")
    print("idx_start:", idx_start)
    print("idx_end:", idx_end)
