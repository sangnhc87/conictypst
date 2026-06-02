import re

filepath = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Normalize content to use \n newlines
content = content.replace("\r\n", "\n")

# 1. Regex to locate the theory block
theory_pattern = r'(#method-box\[\s*Công thức đóng góp của một phương án phân bổ cột.*?\])'
match_theory = re.search(theory_pattern, content, re.DOTALL)

if match_theory:
    target_theory = match_theory.group(1)
    print("Found theory block! Length:", len(target_theory))
    
    theory_replacement = target_theory + """

#rev-box(title: "🔑 Quy Trình Biện Luận Nghiệm Cho Hệ Phương Trình Cấu Hình Cột")[
  Khi số lượng lớp lớn (ví dụ $s = 3, 4$), hệ phương trình cấu hình cột có nhiều biến số và thường có nhiều nghiệm nguyên không âm. Để tránh bỏ sót nghiệm, ta áp dụng quy trình biện luận nghiệm có hệ thống sau:

  1. *Bước 1: Liệt kê đầy đủ các biến số.* Các biến số đại diện cho các kiểu cột có thể có (ví dụ: $t_{A B}, t_{A C}, dots$). Số lượng biến tối đa là $binom(s, 2)$.
  2. *Bước 2: Thiết lập giới hạn trên của từng biến.* Mỗi biến $t_{i j}$ đại diện cho cột chứa lớp $i$ và $j$, do đó ta luôn có giới hạn:
     $ t_{i j} <= min(n_i, n_j) $
  3. *Bước 3: Chọn biến có giới hạn hẹp nhất làm tham số biện luận.* 
     - Thông thường, ta chọn lớp có ít học sinh nhất (ví dụ lớp C và D có $n_C = n_D = 1$). 
     - Biến $t_{C D}$ khi đó chỉ có thể nhận giá trị từ $0$ đến $min(n_C, n_D)$. Ta chia làm các trường hợp tương ứng với từng giá trị nguyên của $t_{C D}$.
  4. *Bước 4: Thay giá trị vào hệ phương trình để giải các biến còn lại.* Với mỗi giá trị của biến tham số, hệ phương trình ban đầu sẽ giảm số lượng biến và có thể giải một cách dễ dàng, loại bỏ các nghiệm có giá trị âm hoặc không thỏa mãn tổng số cột $m$.
  5. *Bước 5: Tổng hợp các cấu hình nghiệm hợp lệ.* Mỗi bộ nghiệm nguyên không âm thỏa mãn hệ phương trình sẽ là một cấu hình cột hợp lệ.
]"""
    content = content.replace(target_theory, theory_replacement)
else:
    print("Could not find theory target!")

# 2. Modify Example 1.6
eg16_pattern = r'(#eg-box\(title:\s*"🎯 Ví Dụ 1\.6 — Quy mô lớn: 2A, 2B, 2C, 2D ngồi 2 hàng 4 ghế \(\$m=4\$\)"\)\[.*?\])\s*\n\s*\*⬧ Dạng 1\.4\.3'
match16 = re.search(eg16_pattern, content, re.DOTALL)
if not match16:
    print("Could not find Example 1.6 using regex!")
else:
    target_eg16 = match16.group(1)
    print("Found Example 1.6! Length:", len(target_eg16))
    
    replacement_eg16 = """#eg-box(title: "🎯 Ví Dụ 1.6 — Quy mô lớn: 2A, 2B, 2C, 2D ngồi 2 hàng 4 ghế ($m=4$)")[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C, 2 học sinh lớp D. Xếp vào 2 hàng 4 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
  
  *Lời giải chi tiết:*
  Ta có $m = 4$ cột. Học sinh của mỗi lớp là $n_A = n_B = n_C = n_D = 2$.
  Dưới đây là 2 cách tiếp cận giải quyết bài toán:

  *🔵 Cách 1: Phương pháp phân tích chu trình đồ thị*
  Mỗi lớp có đúng 2 học sinh nên mỗi lớp phải xuất hiện trong đúng 2 cột khác nhau. Ta phân tích các cấu trúc ghép cột hợp lệ dưới dạng đồ thị (coi các cột là cạnh nối giữa các lớp):
  - *Trường hợp 1: Tạo thành một vòng khép kín duy nhất 4 đỉnh (Single 4-cycle).* Các cột ghép các lớp theo vòng tròn khép kín dạng: A - B - C - D - A.
    1. Số cách lập vòng tròn từ 4 lớp: $frac((4-1)!, 2) = 3$ cách (gồm: A-B-C-D-A, A-B-D-C-A, A-C-B-D-A).
    2. Với mỗi vòng tròn lớp, kiểu cột được xác định độc nhất.
    3. Số cách xếp cho TH1 là:
       $ N_1 = 3 times underbrace(4!, "Gán vào 4 cột") times underbrace(2! 2! 2! 2!, "Hoán vị học sinh") times underbrace(2^4, "Đảo hàng") = 3 times 24 times 16 times 16 = bold(18432) " cách." $
  - *Trường hợp 2: Tạo thành 2 vòng nhỏ 2 đỉnh (Hai cặp song song).* 4 lớp chia làm 2 cặp tự ghép với nhau. Ví dụ: cặp $\{A, B\}$ ghép 2 cột và $\{C, D\}$ ghép 2 cột.
    1. Số cách phân 4 lớp thành 2 cặp: $frac(1, 2) binom(4, 2) = 3$ cách.
    2. Với mỗi cách chia, kiểu cột gồm 2 cột kiểu này và 2 cột kiểu kia (ví dụ: 2 cột $\{A, B\}$, 2 cột $\{C, D\}$).
    3. Số cách xếp cho TH2 là:
       $ N_2 = 3 times underbrace(frac(4!, 2! times 2!), "Gán kiểu cột") times underbrace(2! 2! 2! 2!, "Hoán vị học sinh") times underbrace(2^4, "Đảo hàng") = 3 times 6 times 16 times 16 = bold(4608) " cách." $
  
  $arrow.r$ Tổng số cách xếp: $N = N_1 + N_2 = 18432 + 4608 = bold(23040)$ cách.

  *🟣 Cách 2: Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*
  Ta gọi $t_{i j}$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ với các cặp $(i, j)$ chọn từ $\{A, B, C, D\}$. Để phân bổ hết học sinh, ta có hệ phương trình:
  $
  t_{A B} + t_{A C} + t_{A D} + t_{B C} + t_{B D} + t_{C D} = 4 quad &("tổng số cột") \
  t_{A B} + t_{A C} + t_{A D} = n_A = 2 quad &("lượt xuất hiện của A") \
  t_{A B} + t_{B C} + t_{B D} = n_B = 2 quad &("lượt xuất hiện của B") \
  t_{A C} + t_{B C} + t_{C D} = n_C = 2 quad &("lượt xuất hiện của C") \
  t_{A D} + t_{B D} + t_{C D} = n_D = 2 quad &("lượt xuất hiện của D")
  $
  Ta biện luận nghiệm nguyên không âm của hệ phương trình dựa trên giới hạn trên của các biến. Vì mỗi lớp chỉ có 2 học sinh, nên số cột chung của hai lớp bất kỳ $t_{i j} <= 2$.
  - *Trường hợp 2.1: Có một biến $t_{i j} = 2$ (cấu hình hai cặp song song)*
    Không mất tính tổng quát, giả sử $t_{A B} = 2$. Khi đó từ các phương trình của A và B, ta có các biến liên quan khác bằng 0: $t_{A C} = t_{A D} = t_{B C} = t_{B D} = 0$. 
    Thay vào phương trình của C và D ta được $t_{C D} = 2$.
    Vậy ta có cấu hình: $\{2 \\times (A, B), 2 \\times (C, D)\}$.
    Do tính đối xứng, ta có 3 cách chia 4 lớp thành 2 cặp tương tự:
    1. $\{2 \\times (A, B), 2 \\times (C, D)\}$ $\\rightarrow$ Số cách gán $M = frac(4!, 2! 2!) = 6$.
    2. $\{2 \\times (A, C), 2 \\times (B, D)\}$ $\\rightarrow$ Số cách gán $M = 6$.
    3. $\{2 \\times (A, D), 2 \\times (B, C)\}$ $\\rightarrow$ Số cách gán $M = 6$.
    Mỗi cấu hình đóng góp: $6 \\times (2! 2! 2! 2!) \\times 2^4 = 6 \\times 16 \\times 16 = bold(1536)$ cách.
    $\\rightarrow$ Đóng góp của TH2.1: $3 \\times 1536 = bold(4608)$ cách.
  
  - *Trường hợp 2.2: Tất cả các biến $t_{i j} <= 1$ (cấu hình một vòng lớn 4 đỉnh)*
    Hệ phương trình chỉ có các nghiệm mà các biến chỉ nhận giá trị $0$ hoặc $1$. Để tổng số lượt xuất hiện của mỗi lớp bằng 2, mỗi lớp phải ghép với đúng 2 lớp khác. Điều này tương ứng với các cấu hình vòng khép kín.
    Có 3 nghiệm tương ứng với 3 vòng tròn:
    1. Vòng $A-B-C-D-A$ $\\rightarrow$ Cấu hình $\{1 \\times (A, B), 1 \\times (B, C), 1 \\times (C, D), 1 \\times (A, D)\}$.
    2. Vòng $A-B-D-C-A$ $\\rightarrow$ Cấu hình $\{1 \\times (A, B), 1 \\times (B, D), 1 \\times (C, D), 1 \\times (A, C)\}$.
    3. Vòng $A-C-B-D-A$ $\\rightarrow$ Cấu hình $\{1 \\times (A, C), 1 \\times (B, C), 1 \\times (B, D), 1 \\times (A, D)\}$.
    Với mỗi cấu hình, số cách gán kiểu cột vào các vị trí là $M = frac(4!, 1! 1! 1! 1!) = 24$.
    Mỗi cấu hình đóng góp: $24 \\times (2! 2! 2! 2!) \\times 2^4 = 24 \\times 16 \\times 16 = bold(6144)$ cách.
    $\\rightarrow$ Đóng góp của TH2.2: $3 \\times 6144 = bold(18432)$ cách.

  #rev-box(title: "🧩 Bảng tính số cách xếp cho từng cấu hình cột (Ví dụ 1.6)")[
    #align(center)[
      #table(
        columns: (2.2fr, 1.2fr, 1.4fr, 1.0fr, 1.4fr),
        inset: 6pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("4A148C") } else { none },
        stroke: 0.5pt + col-violet,
        [#text(fill: white, weight: "bold")[Cấu hình loại cột]],
        [#text(fill: white, weight: "bold")[Số cấu hình]],
        [#text(fill: white, weight: "bold")[Số cách gán M]],
        [#text(fill: white, weight: "bold")[Hoán vị & Đảo]],
        [#text(fill: white, weight: "bold")[Đóng góp tổng]],
        
        [$2 \\times (A, B), 2 \\times (C, D)$ \\ (và 2 hoán vị lớp)],
        [$3$],
        [$frac(4!, 2! 2!) = 6$],
        [$16 \\times 16 = 256$],
        [$3 \\times 6 \\times 256 = bold(4608)$],

        [$1 \\times (A, B), 1 \\times (B, C), \\ 1 \\times (C, D), 1 \\times (A, D)$ \\ (và 2 hoán vị vòng)],
        [$3$],
        [$frac(4!, 1! 1! 1! 1!) = 24$],
        [$16 \\times 16 = 256$],
        [$3 \\times 24 \\times 256 = bold(18432)$]
      )
    ]
    $arrow.r$ Tổng số cách xếp thu được là: $N = 4608 + 18432 = bold(23040)$ cách.
  ]
]"""
    content = content.replace(target_eg16, replacement_eg16)

# Write back to file
with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)

print("Upgrade process finished successfully!")
