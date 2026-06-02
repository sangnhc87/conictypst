import re

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

proof_content = r"""
#align(center)[
  #rect(
    fill: rgb("FFF9C4"),
    stroke: (left: 4pt + rgb("F57F17")),
    inset: 12pt,
    radius: 4pt,
    width: 95%
  )[
    #align(left)[
      *Chứng minh Công thức Vạn năng:*
      
      Gọi $M'$ là hình chiếu vuông góc của $M$ lên mặt phẳng $(P_2)$ chứa đường tròn $(C_2)$. 
      Ta có $M M' perp (P_2)$, do đó $M M' = d(M, P_2)$.
      Trong mặt phẳng $(P_2)$, xét tam giác vuông $M M' J_2$ tại $M'$, ta có:
      $M' J_2^2 = M J_2^2 - M M'^2 = M J_2^2 - d(M, P_2)^2$.
      
      Lấy điểm $N$ bất kỳ trên đường tròn $(C_2)$. Tam giác $M M' N$ vuông tại $M'$, nên:
      $M N^2 = M M'^2 + M' N^2 = d(M, P_2)^2 + M' N^2$.
      
      Để khoảng cách $M N$ đạt nhỏ nhất (hay lớn nhất), thì khoảng cách $M' N$ trên mặt phẳng $(P_2)$ phải đạt nhỏ nhất (hoặc lớn nhất). Do $M', J_2, N$ cùng nằm trong mặt phẳng $(P_2)$ và $N$ chạy trên đường tròn tâm $J_2$, bán kính $R_2$, nên cực trị xảy ra khi $M', N, J_2$ thẳng hàng.
      - Giá trị cực trị của $M' N$ là: $M' N = |M' J_2 +- R_2|$.
      
      Bình phương hai vế, ta được:
      $M' N^2 = (M' J_2 +- R_2)^2 = M' J_2^2 + R_2^2 +- 2 R_2 M' J_2$.
      
      Thay vào công thức $M N^2$ ban đầu:
      $M N^2 = d(M, P_2)^2 + M' J_2^2 + R_2^2 +- 2 R_2 M' J_2$.
      Nhận thấy $d(M, P_2)^2 + M' J_2^2 = M J_2^2$, do đó:
      $M N^2 = M J_2^2 + R_2^2 +- 2 R_2 M' J_2$.
      
      Cuối cùng, thay $M' J_2 = sqrt(M J_2^2 - d(M, P_2)^2)$, ta thu được Công thức Vạn năng:
      $ M N_(min \/ max)^2 = M J_2^2 + R_2^2 +- 2R_2 sqrt(M J_2^2 - d(M, P_2)^2) $
    ]
  ]
]
"""

# Insert it before the #pagebreak() before == II. Bài tập ví dụ
code = code.replace("#pagebreak()\n== II. Bài tập ví dụ", proof_content + "\n#pagebreak()\n== II. Bài tập ví dụ")

with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)
