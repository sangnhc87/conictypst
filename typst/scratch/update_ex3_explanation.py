target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

old_block = """    #cach2-box[
      *Sử dụng phương pháp hàm sinh:*
      Hàm sinh tương ứng cho các biến là:
      - Biến $x_1$: $G_1(x) = x^1 + x^2 + ... = frac(x, 1-x)$
      
      - Biến $x_2$: $G_2(x) = x^2 + x^3 + ... = frac(x^2, 1-x)$
      - Biến $x_3$: $G_3(x) = x^3 + x^4 + ... = frac(x^3, 1-x)$
      - Biến $x_4$: $G_4(x) = x^4 + x^5 + ... = frac(x^4, 1-x)$
      
      Hàm sinh tổng là:
      $
        G(x) = frac(x, 1-x) dot.c frac(x^2, 1-x) dot.c frac(x^3, 1-x) dot.c frac(x^4, 1-x) = frac(x^10, (1-x)^4)
      $
      Cần tìm hệ số của $x^18$ trong $G(x)$:
      $
        [x^18] G(x) = [x^18] frac(x^10, (1-x)^4) = [x^8] frac(1, (1-x)^4) = C_(8+4-1)^(4-1) = C_11^3 = 165 " nghiệm."
      $
    ]"""

new_block = """    #cach2-box[
      *Sử dụng phương pháp hàm sinh:*
      Hàm sinh tương ứng cho các biến là:
      - Biến $x_1$: $G_1(x) = x^1 + x^2 + ... = frac(x, 1-x)$
      
      - Biến $x_2$: $G_2(x) = x^2 + x^3 + ... = frac(x^2, 1-x)$
      - Biến $x_3$: $G_3(x) = x^3 + x^4 + ... = frac(x^3, 1-x)$
      - Biến $x_4$: $G_4(x) = x^4 + x^5 + ... = frac(x^4, 1-x)$
      
      Hàm sinh tổng là:
      $
        G(x) = frac(x, 1-x) dot.c frac(x^2, 1-x) dot.c frac(x^3, 1-x) dot.c frac(x^4, 1-x) = frac(x^10, (1-x)^4)
      $
      Cần tìm hệ số của $x^18$ trong $G(x)$:
      $
        [x^18] G(x) = [x^18] frac(x^10, (1-x)^4)
      $
      
      #note-box(title: "💡 Giải thích bước dịch chuyển số mũ (Shift Rule)"): [
        Tại sao ta có $[x^18] frac(x^10, (1-x)^4) = [x^8] frac(1, (1-x)^4)$?
        - Hãy xem chuỗi cần tìm hệ số là $H(x) = frac(1, (1-x)^4) = h_0 + h_1 x + h_2 x^2 + ... + h_n x^n + ...$
        - Khi ta nhân thêm nhân tử $x^10$ vào trước, chuỗi mới trở thành:
          $
            x^10 H(x) = h_0 x^10 + h_1 x^11 + h_2 x^12 + ... + h_n x^(n+10) + ...
          $
        - Lúc này, số hạng chứa $x^18$ ở chuỗi mới ứng với số mũ: $n + 10 = 18 arrow.r n = 8$.
        - Hệ số của $x^18$ trong chuỗi mới này chính là hệ số $h_8$ (tức hệ số đứng trước $x^8$ của chuỗi $H(x)$ ban đầu).
        - Tổng quát hóa thành quy tắc dịch chuyển số mũ: $[x^n] (x^m dot.c H(x)) = [x^(n-m)] H(x)$. Ta chỉ việc trừ bớt số mũ cần lấy đi $m$ đơn vị.
      ]
      
      Áp dụng quy tắc dịch chuyển số mũ trên, ta có:
      $
        [x^18] frac(x^10, (1-x)^4) = [x^(18-10)] frac(1, (1-x)^4) = [x^8] frac(1, (1-x)^4)
      $
      Áp dụng công thức nhị thức âm với $n = 8$ và $k = 4$:
      $
        [x^8] frac(1, (1-x)^4) = C_(8+4-1)^(4-1) = C_11^3 = 165 " nghiệm."
      $
    ]"""

if old_block in content:
    content = content.replace(old_block, new_block)
    with open(target_file, 'w') as f:
        f.write(content)
    print("Success: Exercise 3 explanation updated!")
else:
    normalized_content = content.replace('\r\n', '\n')
    normalized_old = old_block.replace('\r\n', '\n')
    if normalized_old in normalized_content:
        normalized_content = normalized_content.replace(normalized_old, new_block)
        with open(target_file, 'w') as f:
            f.write(normalized_content)
        print("Success: Exercise 3 explanation updated (with line ending normalization)!")
    else:
        print("Failed to locate old block in exercise 3.")
