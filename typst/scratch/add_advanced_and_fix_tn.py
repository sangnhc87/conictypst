target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Define the new Dạng I Bài 5 content to insert
d1_ex5_insert = r"""=== Bài 5 ★★★★ — Chia Bút Chì Cho 4 Học Sinh Ràng Buộc Hỗn Hợp (Đỉnh Cao Vách Ngăn)
#tln(
  id: "2GF-1-5",
  [Có 15 chiếc bút chì giống nhau được chia cho 4 học sinh A, B, C, D. Hỏi có bao nhiêu cách chia nếu thỏa mãn đồng thời các điều kiện sau:
  - Học sinh A nhận từ 2 đến 6 chiếc bút chì.
  - Học sinh B nhận từ 1 đến 4 chiếc bút chì.
  - Học sinh C nhận ít nhất 3 chiếc bút chì.
  - Học sinh D nhận tùy ý không âm.],
  [$130$ cách],
  loigiai: [
    #ppgiai[Đây là bài toán chia kẹo/phần thưởng với các điều kiện ràng buộc độc lập chặn trên và chặn dưới khác nhau cho các học sinh. Bài toán này nếu giải theo tổ hợp thông thường sẽ phải dùng Nguyên lý bao hàm - loại trừ sau khi đã trừ đi các phần chặn dưới bắt buộc. Cách dùng hàm sinh sẽ tự động giải quyết các bước loại trừ này thông qua các phép toán đại số.]

    #cach1-box[
      *Sử dụng tổ hợp và Nguyên lý bao hàm - loại trừ (PIE):*
      Gọi số bút chì chia cho A, B, C, D lần lượt là $x_1, x_2, x_3, x_4$ (nguyên không âm). Ta cần tìm số nghiệm của phương trình $x_1 + x_2 + x_3 + x_4 = 15$ thỏa mãn:
      - $2 <= x_1 <= 6$
      - $1 <= x_2 <= 4$
      - $x_3 >= 3$
      - $x_4 >= 0$
      
      *Bước 1: Trừ đi các phần chặn dưới bắt buộc:*
      Chia trước cho A 2 cái, B 1 cái, C 3 cái (tổng cộng $2 + 1 + 3 = 6$ cái).
      Đặt các biến mới là khoảng tăng thêm: $y_1 = x_1 - 2 >= 0$, $y_2 = x_2 - 1 >= 0$, $y_3 = x_3 - 3 >= 0$, $y_4 = x_4 >= 0$.
      Phương trình trở thành:
      $
        (y_1 + 2) + (y_2 + 1) + (y_3 + 3) + y_4 = 15 arrow.r y_1 + y_2 + y_3 + y_4 = 9
      $
      Các điều kiện chặn trên của A và B chuyển thành:
      - $x_1 <= 6 arrow.r y_1 + 2 <= 6 arrow.r y_1 <= 4$
      - $x_2 <= 4 arrow.r y_2 + 1 <= 4 arrow.r y_2 <= 3$
      Các biến khác chỉ cần không âm: $y_3 >= 0, y_4 >= 0$.
      
      *Bước 2: Sử dụng Nguyên lý bao hàm - loại trừ (PIE) để xử lý điều kiện chặn trên $y_1 <= 4$ và $y_2 <= 3$:*
      - Số nghiệm không điều kiện chặn trên của $y_1 + y_2 + y_3 + y_4 = 9$ (với $y_i >= 0$) là:
        $
          S = C_(9+4-1)^(4-1) = C_12^3 = 220 " cách."
        $
      - Tập các nghiệm vi phạm điều kiện $y_1 >= 5$ (đặt $z_1 = y_1 - 5 >= 0 \rightarrow z_1 + y_2 + y_3 + y_4 = 4$):
        $
          A = C_(4+4-1)^(4-1) = C_7^3 = 35 " cách."
        $
      - Tập các nghiệm vi phạm điều kiện $y_2 >= 4$ (đặt $z_2 = y_2 - 4 >= 0 \rightarrow y_1 + z_2 + y_3 + y_4 = 5$):
        $
          B = C_(5+4-1)^(4-1) = C_8^3 = 56 " cách."
        $
      - Tập các nghiệm đồng thời vi phạm cả hai điều kiện $y_1 >= 5$ và $y_2 >= 4$ (đặt $z_1 = y_1 - 5 >= 0, z_2 = y_2 - 4 >= 0 \rightarrow z_1 + z_2 + y_3 + y_4 = 0$):
        $
          A sect B = C_(0+4-1)^(4-1) = C_3^3 = 1 " cách."
        $
      
      Theo nguyên lý bao hàm - loại trừ, số nghiệm thỏa mãn đồng thời các điều kiện là:
      $
        N = S - (A + B) + (A sect B) = 220 - (35 + 56) + 1 = 130 " cách."
      $
    ]

    #cach2-box[
      *Sử dụng phương pháp hàm sinh:*
      Thiết lập hàm sinh thành phần cho cách nhận bút chì của từng học sinh:
      - Học sinh A ($2 <= x_1 <= 6$):
        $ G_A(x) = x^2 + x^3 + x^4 + x^5 + x^6 = x^2 (1 + x + x^2 + x^3 + x^4) = x^2 frac(1-x^5, 1-x) $
      - Học sinh B ($1 <= x_2 <= 4$):
        $ G_B(x) = x^1 + x^2 + x^3 + x^4 = x (1 + x + x^2 + x^3) = x frac(1-x^4, 1-x) $
      - Học sinh C ($x_3 >= 3$):
        $ G_C(x) = x^3 + x^4 + x^5 + ... = frac(x^3, 1-x) $
      - Học sinh D ($x_4 >= 0$):
        $ G_D(x) = 1 + x + x^2 + ... = frac(1, 1-x) $
      
      Hàm sinh tổng thể cho cách chia bút là tích các hàm sinh thành phần:
      $
        G(x) = G_A(x) dot.c G_B(x) dot.c G_C(x) dot.c G_D(x) = lr(x^2 frac(1-x^5, 1-x)) dot.c lr(x frac(1-x^4, 1-x)) dot.c frac(x^3, 1-x) dot.c frac(1, 1-x)
      $
      Rút gọn biểu thức $G(x)$:
      $
        G(x) = x^6 (1-x^4)(1-x^5) dot.c frac(1, (1-x)^4) = (x^6 - x^10 - x^11 + x^15) dot.c frac(1, (1-x)^4)
      $
      Số cách chia bút chính là hệ số đứng trước $x^15$ trong khai triển $G(x)$.
      Áp dụng quy tắc dịch chuyển số mũ (Shift Rule):
      $
        [x^15] G(x) = [x^15] \Big[ (x^6 - x^10 - x^11 + x^15) dot.c frac(1, (1-x)^4) \Big]
      $
      $
        = [x^9] frac(1, (1-x)^4) - [x^5] frac(1, (1-x)^4) - [x^4] frac(1, (1-x)^4) + [x^0] frac(1, (1-x)^4)
      $
      Áp dụng công thức trích hệ số nhị thức âm $[x^n] frac(1, (1-x)^k) = C_(n+k-1)^(k-1)$:
      - $[x^9] frac(1, (1-x)^4) = C_(9+4-1)^(4-1) = C_12^3 = 220$
      - $[x^5] frac(1, (1-x)^4) = C_(5+4-1)^(4-1) = C_8^3 = 56$
      - $[x^4] frac(1, (1-x)^4) = C_(4+4-1)^(4-1) = C_7^3 = 35$
      - $[x^0] frac(1, (1-x)^4) = C_(0+4-1)^(4-1) = C_3^3 = 1$
      
      Thay vào biểu thức ta có kết quả:
      $
        [x^15] G(x) = 220 - 56 - 35 + 1 = 130 " cách."
      $
      Hai cách giải cho ra cùng một đáp số chính xác là 130 cách, chứng minh sức mạnh của hàm sinh trong việc đại số hóa nguyên lý bao hàm loại trừ một cách cực kỳ mượt mà.
    ]
    #ans-box[Có tất cả *130 cách* chia bút chì thỏa mãn.]
  ]
)

"""

# Let's insert Dạng I Bài 5 before '== 1.3 — Các Câu Hỏi Trắc Nghiệm Dạng I'
idx_tn_header = content.find('== 1.3 — Các Câu Hỏi Trắc Nghiệm Dạng I')
if idx_tn_header != -1:
    content = content[:idx_tn_header] + d1_ex5_insert + '\n' + content[idx_tn_header:]
    print("Success: Dạng I Bài 5 inserted.")
else:
    print("Failed to locate TN header.")

# Define the new multiple choice solutions
new_tn_content = r"""#tn(
  id: "1GF-TN1",
  [Số nghiệm nguyên không âm của phương trình $x + y + z = 9$ là:],
  ([$45$], True([$55$]), [$66$], [$78$]),
  loigiai: [
    #cach1-box[
      *Sử dụng tổ hợp và vách ngăn trực tiếp:*
      Tìm số nghiệm nguyên không âm của phương trình $x + y + z = 9$ tương đương với việc chia 9 chiếc kẹo giống nhau cho 3 học sinh không kèm theo bất kỳ điều kiện nào khác.
      Theo phương pháp vách ngăn, ta cần đặt 2 vách ngăn vào giữa các chiếc kẹo để tạo thành 3 phần.
      Tổng số vị trí của kẹo và vách ngăn là $9 + (3 - 1) = 11$ vị trí.
      Số cách chọn 2 vị trí để đặt vách ngăn là:
      $
        C_11^2 = frac(11 dot.c 10, 2) = 55 " cách."
      $
    ]
    #cach2-box[
      *Sử dụng phương pháp hàm sinh:*
      - Thiết lập hàm sinh thành phần cho các biến $x, y, z$. Vì các biến nhận giá trị không âm tùy ý ($x, y, z >= 0$), hàm sinh thành phần của từng biến là:
        $ G_x(t) = G_y(t) = G_z(t) = 1 + t + t^2 + t^3 + ... = frac(1, 1-t) $
      - Hàm sinh tổng cho phương trình là tích các hàm sinh thành phần:
        $ G(t) = G_x(t) dot.c G_y(t) dot.c G_z(t) = lr(frac(1, 1-t))^3 = frac(1, (1-t)^3) $
      - Số nghiệm của phương trình chính là hệ số đứng trước số hạng $t^9$ trong khai triển $G(t)$.
        Áp dụng công thức trích hệ số nhị thức âm $[t^n] frac(1, (1-t)^k) = C_(n+k-1)^(k-1)$ với $n = 9, k = 3$:
        $
          [t^9] G(t) = [t^9] frac(1, (1-t)^3) = C_(9+3-1)^(3-1) = C_11^2 = 55 " nghiệm."
        $
    ]
    #ans-box[Đáp án đúng là *55*.]
  ],
)

#tn(
  id: "1GF-TN2",
  [Có bao nhiêu cách chia 8 cái bút chì giống nhau cho 5 em nhỏ sao cho mỗi em nhỏ nhận được ít nhất 1 cái bút?],
  ([$C_12^4 = 495$], [$C_12^3$], True([$C_7^4 = 35$]), [$C_8^4$]),
  loigiai: [
    #cach1-box[
      *Sử dụng tổ hợp (Vách ngăn có điều kiện):*
      Gọi số bút chì chia cho 5 em nhỏ lần lượt là $x_1, x_2, x_3, x_4, x_5$ ($x_i >= 1$ nguyên). Ta cần tìm số nghiệm nguyên dương của phương trình:
      $ x_1 + x_2 + x_3 + x_4 + x_5 = 8 $
      Đặt $y_i = x_i - 1 >= 0$, phương trình trở thành:
      $
        (y_1+1) + (y_2+1) + ... + (y_5+1) = 8 arrow.r y_1 + y_2 + y_3 + y_4 + y_5 = 3
      $
      Số nghiệm nguyên không âm của phương trình mới là:
      $
        C_(3+5-1)^(5-1) = C_7^4 = 35 " cách."
      $
    ]
    #cach2-box[
      *Sử dụng phương pháp hàm sinh:*
      - Vì mỗi học sinh nhận được ít nhất 1 chiếc bút ($x_i >= 1$), hàm sinh thành phần cho từng học sinh là:
        $ G_i(t) = t + t^2 + t^3 + ... = t(1 + t + t^2 + ...) = frac(t, 1-t) $
      - Hàm sinh tổng cho cách chia bút cho 5 em nhỏ là:
        $ G(t) = lr(frac(t, 1-t))^5 = frac(t^5, (1-t)^5) $
      - Ta cần tìm hệ số đứng trước $t^8$ trong khai triển $G(t)$.
        Áp dụng quy tắc dịch chuyển số mũ (Shift Rule):
        $
          [t^8] G(t) = [t^8] frac(t^5, (1-t)^5) = [t^3] frac(1, (1-t)^5)
        $
        Áp dụng công thức trích hệ số nhị thức âm với $n = 3, k = 5$:
        $
          [t^3] frac(1, (1-t)^5) = C_(3+5-1)^(5-1) = C_7^4 = 35 " cách."
        $
    ]
    #ans-box[Đáp án đúng là *C_7^4 = 35*.]
  ],
)

#tn(
  id: "1GF-TN3",
  [Hệ số của $x^7$ trong khai triển chuỗi lũy thừa hình thức $frac(1, (1-x)^5)$ bằng:],
  ([$C_11^4 = 330$], True([$C_11^4 = 330$]), [$C_12^4$], [$C_10^4$]),
  loigiai: [
    #cach1-box[
      *Áp dụng trực tiếp công thức khai triển nhị thức âm:*
      Theo định lý hệ số nhị thức âm, với mọi số nguyên dương $k$, ta có khai triển Taylor:
      $
        frac(1, (1-x)^k) = sum_(n=0)^(+oo) C_(n+k-1)^(k-1) x^n
      $
      Áp dụng trực tiếp cho trường hợp $k = 5$ và cần tìm hệ số của $x^7$ (tương ứng $n = 7$), ta có:
      $
        [x^7] frac(1, (1-x)^5) = C_(7+5-1)^(5-1) = C_11^4 = frac(11 dot.c 10 dot.c 9 dot.c 8, 4 dot.c 3 dot.c 2 dot.c 1) = 330
      $
    ]
    #cach2-box[
      *Giải thích thông qua ý nghĩa tổ hợp (Quy về bài toán chia kẹo):*
      Hệ số đứng trước $x^7$ trong khai triển chuỗi hình thức $frac(1, (1-x)^5)$ thực chất chính là số nghiệm nguyên không âm của phương trình:
      $
        x_1 + x_2 + x_3 + x_4 + x_5 = 7 \quad (\text{với } x_i >= 0)
      $
      Đây là bài toán chia 7 cái kẹo giống nhau cho 5 em nhỏ không kèm theo điều kiện ràng buộc.
      Áp dụng phương pháp vách ngăn không điều kiện, ta có số cách chia là:
      $
        C_(7+5-1)^(5-1) = C_11^4 = 330 " cách."
      $
    ]
    #ans-box[Đáp án đúng là *330*.]
  ],
)
"""

# Let's replace the old tn blocks
# We locate the start of tn 1
idx_tn1 = content.find('#tn(\n  id: "1GF-TN1",')
# We locate the end of tn 3.
# The tn 3 ends with:
#     #ans-box[Đáp án đúng là *330*.]
#   ],
# )
idx_tn3_end_str = '#ans-box[Đáp án đúng là *330*.]\n  ],\n)'
idx_tn3_end = content.find(idx_tn3_end_str)

if idx_tn1 != -1 and idx_tn3_end != -1:
    end_pos = idx_tn3_end + len(idx_tn3_end_str)
    content = content[:idx_tn1] + new_tn_content + content[end_pos:]
    print("Success: TN1-3 replaced with detailed solutions.")
else:
    print("Failed to locate TN1-3 block for replacement.", idx_tn1, idx_tn3_end)

with open(target_file, 'w') as f:
    f.write(content)

print("Insertion and replacement finished!")
