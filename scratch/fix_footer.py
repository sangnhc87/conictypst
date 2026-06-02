path = "/Users/admin/conictypst/scratch/reconstructed_virtual.typ"
with open(path, "r", encoding="utf-8") as f:
    lines = f.readlines()

# Remove lines from 2626 to the end (which are 0-indexed: index 2625 to the end)
# Wait, index is 0-indexed, so line 2626 is index 2625.
# Let's check what the last few lines are:
print("Last 5 lines before removal:")
for idx in range(len(lines) - 5, len(lines)):
    print(f"{idx+1}: {lines[idx]}", end="")

# Keep up to line 2625 (index 2624)
lines = lines[:2625]

# Add the correct table and footer:
footer = """= Bảng Tổng Hợp Công Thức Cốt Lõi

#align(center)[
  #block(width: 100%)[
    #table(
      columns: (1.2fr, 2fr, 1.2fr, 2fr),
      align: (center, left, center, left),
      stroke: 0.6pt + rgb("E2E8F0"),
      inset: (x: 8pt, y: 7pt),
      fill: (x,y) => if y==0 { c-navy } else if calc.rem(y,2)==0 { rgb("F8FAFC") } else { white },

      text(fill:white,weight:"bold", size:9.5pt)[Tên gọi],
      text(fill:white,weight:"bold", size:9.5pt)[Công thức toán học],
      text(fill:white,weight:"bold", size:9.5pt)[Tên gọi],
      text(fill:white,weight:"bold", size:9.5pt)[Công thức toán học],

      [Hoán vị], $P_n = n!$, [Tổ hợp], $C_n^k = frac(n!, k!(n-k)!)$,
      [Chỉnh hợp], $A_n^k = frac(n!, (n-k)!)$, [Hoán vị lặp], $frac(n!, n_1!n_2!dots.c n_k!)$,
      [Vách ngăn ($>= 0$)], $C_(n+k-1)^(k-1)$, [Vách ngăn ($>= 1$)], $C_(n-1)^(k-1)$,
      [Stirling loại 2], $S(n,k) = frac(1, k!) sum (-1)^j C_k^j (k-j)^n$, [Số Bell], $B(n) = sum_(k=1)^n S(n,k)$,
      [Số Catalan], $C_n = frac(1, n+1) C_(2n)^n$, [Đa thức sắc vòng], $(k-1)^n + (k-1)(-1)^n$,
      [Dãy Fibonacci], $F_n = F_(n-1)+F_(n-2)$, [Hàm phi Euler], $phi(n) = n product_(p|n) (1 - 1/p)$,
      [Khai triển], $(a+b)^n = sum C_n^k a^(n-k) b^k$, [Vandermonde], $C_(2n)^n = sum_(k=0)^n (C_n^k)^2$,
    )
  ]
]

#v(1em)
#key-box[
  *Phương châm giải toán Đại số Tổ hợp:*
  - *Xem xét tính phân biệt:* Vật phân biệt hay giống nhau? Hộp/Nhóm phân biệt hay giống nhau?
  - *Xem xét tính thứ tự:* Lựa chọn có quan tâm đến thứ tự sắp xếp hay chỉ lấy ra tập hợp?
  - *Đơn giản hóa mô hình:* Nếu đếm xuôi có quá nhiều điều kiện chặn, hãy lập tức nghĩ đến việc đếm gián tiếp qua phần bù hoặc thiết lập hệ thức truy hồi.
]
"""

with open(path, "w", encoding="utf-8") as f:
    f.writelines(lines)
    f.write(footer)

print("Appended correct footer.")
