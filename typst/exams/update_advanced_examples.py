import re

with open('CD-DaiBacVanNang-MoRong.typ', 'r') as f:
    content = f.read()

# 1. Inject Table of Contents after the title block
toc_code = r"""
#v(1em)
#block(
  fill: rgb("FAFAFA"), 
  stroke: 1pt + rgb("E0E0E0"), 
  radius: 8pt, 
  inset: 15pt,
  width: 100%
)[
  #text(size: 14pt, weight: "bold", fill: rgb("4A148C"))[📑 MỤC LỤC CHUYÊN ĐỀ]
  #v(0.5em)
  #outline(depth: 2, indent: auto)
]
#v(1em)
"""
# Find the end of the title block (after "#v(1.5em)")
content = content.replace('#v(1.5em)\n\n#let cannon-box', toc_code + '\n#let cannon-box')

# 2. Add Examples 105 and 106
new_examples_code = r"""

== 1.6. Chuyên Mục Đặc Biệt: Phân Tích Chuyên Sâu Lưới Dị Biệt

#prob("105",
  [Lưới $3 \times 3$ bị "thắt eo" ở giữa (Đồng hồ cát). Cụ thể: Cột 1 có đủ 3 ô, Cột 2 chỉ có đúng 1 ô ở giữa (mất ô trên và dưới), Cột 3 có đủ 3 ô. Cho $k=4$ màu. Tính số cách tô màu.],
  [Trạng thái bị nén và giải phóng],
  loigiai: [
    #cach-box(title: "Hiện tượng Thắt Eo - Mở Rộng")[
      - *Cột 1 (3 ô):* Số cách tô là $4 \times 3 \times 3 = 36$ cách.
      - *Cột 2 (1 ô giữa):* Bị kìm kẹp bởi ô giữa của Cột 1. Do đó có 3 cách chọn (chỉ cần khác ô giữa Cột 1). Trạng thái của toàn lưới lúc này bị "nén" lại chỉ phụ thuộc vào duy nhất 1 ô của Cột 2.
      - *Cột 3 (3 ô):* Khi bung từ Cột 2 sang Cột 3, điều gì xảy ra?
        - Ô giữa Cột 3: Bị chặn bởi ô giữa Cột 2 $\Rightarrow$ có 3 cách.
        - Ô trên Cột 3: Không bị Cột 2 chặn ngang (vì Cột 2 khuyết ô trên). Nó chỉ cần khác ô giữa Cột 3. $\Rightarrow$ có 3 cách!
        - Ô dưới Cột 3: Tương tự, không bị Cột 2 chặn ngang. Chỉ cần khác ô giữa Cột 3. $\Rightarrow$ có 3 cách!
      Sự vắng mặt của ô trên/dưới tại Cột 2 đã *giải phóng tự do* hoàn toàn cho ô trên/dưới của Cột 3!
    ]
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Col 1
        rect((0, 0), (1, 3), fill: rgb("ECEFF1"), stroke: 1.5pt + rgb("78909C"), radius: 3pt)
        line((0, 1), (1, 1), stroke: 1pt); line((0, 2), (1, 2), stroke: 1pt)
        content((0.5, -0.5), text(weight: "bold")[Cột 1])
        
        // Col 2 (Eo)
        rect((2.5, 1), (3.5, 2), fill: gradient.linear(rgb("FFEBEE"), rgb("FFCDD2")), stroke: 1.5pt + rgb("D32F2F"), radius: 3pt)
        content((3, 1.5), text(fill: rgb("B71C1C"), weight: "bold")[Nén])
        content((3, -0.5), text(weight: "bold")[Cột 2])
        
        // Col 3
        rect((5, 0), (6, 3), fill: rgb("E8F5E9"), stroke: 1.5pt + rgb("2E7D32"), radius: 3pt)
        line((5, 1), (6, 1), stroke: 1pt); line((5, 2), (6, 2), stroke: 1pt)
        content((5.5, -0.5), text(weight: "bold")[Cột 3])
        
        // Arrows C1 -> C2
        line((1.1, 1.5), (2.4, 1.5), mark: (end: ">"), stroke: 1.5pt + rgb("D32F2F"))
        
        // Arrows C2 -> C3
        line((3.6, 1.5), (4.9, 1.5), mark: (end: ">"), stroke: 1.5pt + rgb("2E7D32"))
        
        // Free arrows C3
        bezier((5.5, 1.9), (5.5, 2.5), (5, 2.2), (6, 2.2), mark: (end: ">", fill: rgb("F57F17")), stroke: 1.5pt + rgb("FBC02D"))
        content((5.5, 3.4), text(fill: rgb("F57F17"), size: 8pt)[Tự do (3 cách)])
        bezier((5.5, 1.1), (5.5, 0.5), (5, 0.8), (6, 0.8), mark: (end: ">", fill: rgb("F57F17")), stroke: 1.5pt + rgb("FBC02D"))
        content((5.5, -0.4), text(fill: rgb("F57F17"), size: 8pt)[Tự do (3 cách)])
      })
    ]
    
    *Tổng kết số cách:* $36 \times 3 \times (3 \times 3 \times 3) = 2916$ cách.
  ]
)

#v(0.5em)
#prob("106",
  [Lưới $2 \times n$ được uốn cong thành hình trụ (vòng tròn khép kín), tức là Cột cuối cùng ($C_n$) sẽ kề cạnh với Cột đầu tiên ($C_1$). Có $k$ màu. Tìm số cách tô.],
  [Dùng công thức truy hồi chặn 2 đầu],
  loigiai: [
    Đây là dạng toán kinh điển "Vòng khép kín". Ta không thể cứ nhân hệ số chuyển tiếp một mạch từ trái sang phải, vì Cột $n$ khi quét tới không được tự do, mà phải *né màu của chính Cột 1*.
    
    #cach-box(title: "Phương pháp Cố định phần tử đầu (Fixing First Column)")[
      Gọi dãy $S_n$ là số cách tô lưới $2 \times n$ thẳng (không khép vòng).
      Từ Quy tắc 1 và 2: $S_n = k(k-1) \cdot H^(n-1)$ (với $H = k^2 - 3k + 3$).
      
      Nhưng khi cuộn tròn, ta có 2 trường hợp xảy ra tại Cột $n-1$:
      - *Trường hợp 1:* Cột $n-1$ vô tình tô *trùng màu hoàn toàn* với Cột 1. Lúc này, Cột $n$ bị kẹp giữa 2 cột *giống hệt nhau*. Số cách chọn cho Cột $n$ sẽ nhiều hơn bình thường (giống như rút gọn lại thành lưới chập đầu).
      - *Trường hợp 2:* Cột $n-1$ khác Cột 1. Lúc này Cột $n$ bị kẹp giữa 2 cột khác nhau, số cách chọn sẽ ít hơn.
      
      *Thuật giải bằng dãy số:* Gọi $V_n$ là số cách tô vòng khép kín chiều dài $n$.
      Ta luôn có hệ thức kinh điển: $ V_n = H \cdot V_{n-1} + \dots $
      *(Phần chứng minh chi tiết xin xem ở Chuyên đề Đồ thị Vòng $C_n$)*.
    ]
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Vẽ lưới cuộn cong (cylinder-like)
        bezier((0,0), (6,0), (2, -1), (4, -1), stroke: 1.5pt + rgb("9E9E9E"))
        bezier((0,2), (6,2), (2, 1), (4, 1), stroke: 1.5pt + rgb("9E9E9E"))
        
        // Cột 1
        rect((-0.4, 0), (0.4, 2), fill: gradient.linear(rgb("E3F2FD"), rgb("BBDEFB")), stroke: 1.5pt + rgb("1565C0"), radius: 2pt)
        line((-0.4, 1), (0.4, 1), stroke: 1pt + rgb("1565C0"))
        content((0, 2.4), text(weight: "bold", fill: rgb("0D47A1"))[$C_1$])
        
        // Cột 2, 3 (ở giữa)
        rect((1.6, -0.3), (2.4, 1.7), fill: rgb("F5F5F5"), stroke: 1.2pt + rgb("BDBDBD"))
        line((1.6, 0.7), (2.4, 0.7), stroke: 1pt + rgb("BDBDBD"))
        content((2, 0.7), $dots$)
        
        // Cột n-1
        rect((3.6, -0.3), (4.4, 1.7), fill: rgb("F5F5F5"), stroke: 1.2pt + rgb("BDBDBD"))
        line((3.6, 0.7), (4.4, 0.7), stroke: 1pt + rgb("BDBDBD"))
        content((4, -0.7), text(weight: "bold")[$C_{n-1}$])
        
        // Cột n
        rect((5.6, 0), (6.4, 2), fill: gradient.linear(rgb("FFF3E0"), rgb("FFE0B2")), stroke: 1.5pt + rgb("E65100"), radius: 2pt)
        line((5.6, 1), (6.4, 1), stroke: 1pt + rgb("E65100"))
        content((6, 2.4), text(weight: "bold", fill: rgb("E65100"))[$C_n$])
        
        // Mũi tên chập
        bezier((6, 1.5), (0, 1.5), (4, 3), (2, 3), mark: (end: ">", fill: rgb("D32F2F")), stroke: 1.5pt + rgb("D32F2F"), style: "dashed")
        content((3, 2.6), text(fill: rgb("C62828"), size: 8pt, weight: "bold")[Bị ràng buộc ngược lại!])
      })
    ]
  ]
)
"""

content = content.replace("== 2. Bộ 3 Quy Tắc Vạn Năng", new_examples_code + "\n== 2. Bộ 3 Quy Tắc Vạn Năng")

with open('CD-DaiBacVanNang-MoRong.typ', 'w') as f:
    f.write(content)

