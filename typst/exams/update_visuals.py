import re

with open('CD-DaiBacVanNang-MoRong.typ', 'r') as f:
    content = f.read()

new_section = r"""== 1.5. Kỹ Thuật Xây Dựng Bộ Quy Tắc Chuyển Trạng Thái Giữa Các Cột

Khi làm việc với lưới 2 chiều, nếu chỉ dùng cảm giác nhân hệ số, ta rất dễ đếm thiếu hoặc trùng lặp. Phương pháp chuyển trạng thái (State Transition) giúp "số hóa" quá trình chuyển màu từ Cột $i$ sang Cột $i+1$. 

#theory-box[
  *Bước 1: Phân loại trạng thái của một cột*
  Mỗi cột $h$ ô sẽ có nhiều cách tô màu. Ta gom các cách tô có đặc điểm giống nhau thành các *Nhóm Trạng Thái*. 
  Ví dụ, với cột 2 ô (trên, dưới):
  - Nhóm A: Hai ô có *cùng màu* (nếu đề cho phép).
  - Nhóm B: Hai ô có *khác màu*.
  
  *Bước 2: Phân tích sự sinh sản (Chuyển trạng thái)*
  Giả sử cột $i$ thuộc Nhóm A. Khi xây cột $i+1$, ta xem nó có thể tô được bao nhiêu cột Nhóm A mới, bao nhiêu cột Nhóm B mới mà không trùng màu ở cạnh kề. Ta gọi đây là *Sơ Đồ Đẻ Nhánh*.
  
  *Bước 3: Lập ma trận và nhân liên tiếp*
  Từ sơ đồ nhánh, ta có hệ phương trình truy hồi liên kết số lượng cột A, B của bước trước với bước sau. Cột 1 $\to$ Cột 2 $\to$ Cột 3...
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Group A box (Column i)
    rect((-1.5, 1), (1.5, 2.5), fill: gradient.linear(rgb("E8F5E9"), rgb("C8E6C9")), stroke: 1.5pt + rgb("2E7D32"), radius: 4pt, name: "col_i")
    content("col_i", text(weight: "bold", fill: rgb("1B5E20"))[CỘT $i$\nTrạng thái gốc])
    
    // Branches
    bezier((-0.5, 1), (-2, -0.5), (-1, 0.5), (-1.5, 0), mark: (end: ">", fill: rgb("1565C0")), stroke: 1.5pt + rgb("1565C0"))
    bezier((0.5, 1), (2, -0.5), (1, 0.5), (1.5, 0), mark: (end: ">", fill: rgb("E65100")), stroke: 1.5pt + rgb("E65100"))
    
    // Group A (Column i+1)
    rect((-3.5, -2), (-0.5, -0.5), fill: gradient.linear(rgb("E3F2FD"), rgb("BBDEFB")), stroke: 1.5pt + rgb("1565C0"), radius: 4pt, name: "col_i1_A")
    content("col_i1_A", text(weight: "bold", fill: rgb("0D47A1"))[CỘT $i+1$\n$x$ nhóm A])
    
    // Group B (Column i+1)
    rect((0.5, -2), (3.5, -0.5), fill: gradient.linear(rgb("FFF3E0"), rgb("FFE0B2")), stroke: 1.5pt + rgb("E65100"), radius: 4pt, name: "col_i1_B")
    content("col_i1_B", text(weight: "bold", fill: rgb("E65100"))[CỘT $i+1$\n$y$ nhóm B])
    
    // Badges
    circle((-1.8, 0.2), radius: 0.3, fill: rgb("1565C0"), stroke: none)
    content((-1.8, 0.2), text(fill: white, size: 8pt, weight: "bold")[$x$])
    
    circle((1.8, 0.2), radius: 0.3, fill: rgb("E65100"), stroke: none)
    content((1.8, 0.2), text(fill: white, size: 8pt, weight: "bold")[$y$])
  })
]

#prob("101", 
  [Cho một lưới chữ nhật $2 \times n$ ô. Bạn có $k$ màu để tô sao cho không có 2 ô nào chung cạnh (cả ngang và dọc) có cùng màu. Hãy xây dựng bộ quy tắc tính số cách tô bằng phương pháp chuyển trạng thái.],
  [$k(k-1)$ cách cho cột đầu, hệ số chuyển tự thiết lập],
  loigiai: [
    #cach-box(title: "Hướng dẫn xây dựng quy tắc chuyển cột")[
      Ta chia trạng thái của mỗi cột (2 ô) thành các nhóm:
      Do đề bài yêu cầu không chung cạnh dọc, nên 2 ô trên một cột *bắt buộc* phải khác màu.
      Vậy chỉ có đúng 1 nhóm hợp lệ là Nhóm B (khác màu). Cột 1 có số cách tô là: $k(k-1)$.

      *Lập quy tắc từ Cột $i$ sang Cột $i+1$:*
      Giả sử Cột $i$ tô 2 màu $(M_1, M_2)$. Cột $i+1$ cần tô 2 màu $(M_3, M_4)$ sao cho $M_3 \neq M_1, M_4 \neq M_2$ và $M_3 \neq M_4$.
      Ta chia các lựa chọn của Cột $i+1$ thành các trường hợp phụ thuộc vào Cột $i$:
      - *Trường hợp 1:* $(M_3, M_4) = (M_2, M_1)$ (Tô đảo màu chéo). Có đúng *1 cách*.
      - *Trường hợp 2:* $M_3 = M_2$ nhưng $M_4 \neq M_1$. Có $k-2$ cách.
      - *Trường hợp 3:* $M_4 = M_1$ nhưng $M_3 \neq M_2$. Có $k-2$ cách.
      - *Trường hợp 4:* $M_3 \neq M_2$ và $M_4 \neq M_1$. Có $(k-2)(k-3)$ cách (nếu $k \ge 3$).
      
      Tổng cộng một cột bất kỳ sẽ sinh ra: 
      $1 + 2(k-2) + (k-2)(k-3) = k^2 - 3k + 3$ cột mới.
    ]
    #v(0.5em)
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        
        // Cột i
        rect((0, 3), (1.2, 5.4), fill: rgb("ECEFF1"), stroke: 1.5pt + rgb("78909C"), radius: 3pt)
        line((0, 4.2), (1.2, 4.2), stroke: 1.2pt + rgb("B0BEC5"))
        circle((0.6, 4.8), radius: 0.35, fill: rgb("EF5350"), stroke: none)
        content((0.6, 4.8), text(fill: white, weight: "bold", size: 8pt)[$M_1$])
        circle((0.6, 3.6), radius: 0.35, fill: rgb("42A5F5"), stroke: none)
        content((0.6, 3.6), text(fill: white, weight: "bold", size: 8pt)[$M_2$])
        content((0.6, 2.5), text(weight: "bold")[Cột $i$])
        
        // Mũi tên và kết quả 1
        bezier((1.2, 4.8), (3.8, 5.5), (2.5, 4.8), (2.5, 5.5), mark: (end: ">"), stroke: 1.5pt + rgb("AB47BC"))
        rect((4, 4.5), (5.2, 6.9), fill: rgb("F3E5F5"), stroke: 1.5pt + rgb("AB47BC"), radius: 3pt)
        line((4, 5.7), (5.2, 5.7), stroke: 1.2pt + rgb("CE93D8"))
        circle((4.6, 6.3), radius: 0.35, fill: rgb("42A5F5"), stroke: none)
        circle((4.6, 5.1), radius: 0.35, fill: rgb("EF5350"), stroke: none)
        content((6.2, 5.7), text(fill: rgb("8E24AA"), weight: "bold")[1 cách])
        
        // Mũi tên và kết quả 2
        bezier((1.2, 4.2), (3.8, 3.5), (2.5, 4.2), (2.5, 3.5), mark: (end: ">"), stroke: 1.5pt + rgb("00897B"))
        rect((4, 2), (5.2, 4.4), fill: rgb("E0F2F1"), stroke: 1.5pt + rgb("00897B"), radius: 3pt)
        line((4, 3.2), (5.2, 3.2), stroke: 1.2pt + rgb("80CBC4"))
        circle((4.6, 3.8), radius: 0.35, fill: rgb("42A5F5"), stroke: none)
        circle((4.6, 2.6), radius: 0.35, fill: rgb("FFA726"), stroke: none)
        content((4.6, 2.6), text(fill: white, size: 8pt, weight: "bold")[$M_4$])
        content((6.5, 3.2), text(fill: rgb("00695C"), weight: "bold")[$2(k-2)$ cách])
        
        // Mũi tên và kết quả 3
        bezier((1.2, 3.6), (3.8, 0.5), (2.5, 3.6), (2.5, 0.5), mark: (end: ">"), stroke: 1.5pt + rgb("F57C00"))
        rect((4, -0.5), (5.2, 1.9), fill: rgb("FFF3E0"), stroke: 1.5pt + rgb("F57C00"), radius: 3pt)
        line((4, 0.7), (5.2, 0.7), stroke: 1.2pt + rgb("FFCC80"))
        circle((4.6, 1.3), radius: 0.35, fill: rgb("66BB6A"), stroke: none)
        content((4.6, 1.3), text(fill: white, size: 8pt, weight: "bold")[$M_3$])
        circle((4.6, 0.1), radius: 0.35, fill: rgb("FFA726"), stroke: none)
        content((4.6, 0.1), text(fill: white, size: 8pt, weight: "bold")[$M_4$])
        content((7.2, 0.7), text(fill: rgb("E65100"), weight: "bold")[$(k-2)(k-3)$ cách])
      })
    ]
  ]
)

#v(0.5em)
#prob("102",
  [Lưới kích thước $3 \times n$ nhưng ô ở góc dưới cùng bên phải của Cột 1 bị khoét (Cột 1 chỉ có 2 ô trên, các cột sau có 3 ô). Có $k=4$ màu. Hãy chỉ ra cách chuyển từ Cột 1 (khuyết) sang Cột 2 (đầy đủ).],
  [Tính qua trạng thái nhóm],
  loigiai: [
    Cột 1 (chỉ có ô trên và ô giữa). Số cách tô Cột 1 là: $4 \times 3 = 12$ cách. Đều thuộc nhóm 2 ô khác màu.
    Khi chuyển sang Cột 2 (đầy đủ 3 ô), Cột 2 chịu ảnh hưởng từ Cột 1 ở *2 ô trên và giữa*, ô dưới cùng của Cột 2 *không bị* Cột 1 chặn màu ngang trực tiếp.
    
    #v(0.5em)
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Col 1 (missing bottom)
        rect((0, 1.2), (1.2, 3.6), fill: gradient.linear(rgb("E8F5E9"), rgb("C8E6C9")), stroke: 1.5pt + rgb("2E7D32"), radius: 3pt)
        line((0, 2.4), (1.2, 2.4), stroke: 1.2pt + rgb("81C784"))
        content((0.6, 3), text(fill: rgb("1B5E20"), weight: "bold")[$X$])
        content((0.6, 1.8), text(fill: rgb("1B5E20"), weight: "bold")[$Y$])
        content((0.6, 0.6), text(fill: rgb("9E9E9E"), style: "italic")[Khuyết])
        content((0.6, -0.2), text(weight: "bold")[Cột 1])
        
        // Col 2 (full)
        rect((3, 0), (4.2, 3.6), fill: gradient.linear(rgb("E3F2FD"), rgb("BBDEFB")), stroke: 1.5pt + rgb("1565C0"), radius: 3pt)
        line((3, 1.2), (4.2, 1.2), stroke: 1.2pt + rgb("90CAF9"))
        line((3, 2.4), (4.2, 2.4), stroke: 1.2pt + rgb("90CAF9"))
        content((3.6, 3), text(fill: rgb("0D47A1"), weight: "bold")[$\neq X$])
        content((3.6, 1.8), text(fill: rgb("0D47A1"), weight: "bold")[$\neq Y$])
        content((3.6, 0.6), text(fill: rgb("D84315"), weight: "bold")[Tự do])
        content((3.6, -0.2), text(weight: "bold")[Cột 2])
        
        // Arrows
        line((1.3, 3), (2.9, 3), mark: (end: ">"), stroke: 1.5pt + rgb("EF5350"))
        content((2.1, 3.3), text(fill: rgb("C62828"), size: 8pt)[Chặn])
        line((1.3, 1.8), (2.9, 1.8), mark: (end: ">"), stroke: 1.5pt + rgb("EF5350"))
        content((2.1, 2.1), text(fill: rgb("C62828"), size: 8pt)[Chặn])
        
        line((1.3, 0.6), (2.9, 0.6), mark: (end: ">"), stroke: 1.5pt + rgb("81C784"), style: "dashed")
        content((2.1, 0.9), text(fill: rgb("2E7D32"), size: 8pt)[Không chặn])
      })
    ]
    
    *Cách tính số cấu hình Cột 2 sinh ra từ 1 cấu hình Cột 1:*
    - Ô trên của Cột 2: $3$ lựa chọn (khác $X$).
    - Ô giữa của Cột 2: $3$ lựa chọn (khác $Y$).
    - Ô dưới của Cột 2: *KHÔNG* bị chặn ngang bởi Cột 1, chỉ cần khác ô giữa của Cột 2. Do đó có $3$ lựa chọn.
    Tuy nhiên, ô trên và ô giữa của Cột 2 phải khác màu nhau. Bài toán này quy về đếm số cách tô một cột 3 ô (Cột 2) sao cho ô 1 khác $X$, ô 2 khác $Y$, ô 3 chỉ cần khác ô 2.
  ]
)

#v(0.5em)
#prob("103",
  [Lưới kích thước $3 \times n$. Tô bằng 3 màu sao cho 2 ô kề cạnh (ngang, dọc) khác màu. Xây dựng ma trận chuyển trạng thái.],
  [Nhóm A (đầu cuối cùng màu), Nhóm B (3 ô khác màu)],
  loigiai: [
    #cach-box(title: "Chìa khóa: Vòng đời của Nhóm A và Nhóm B")[
      Với lưới cao 3 ô và 3 màu, một cột bắt buộc phải thuộc 1 trong 2 nhóm:
      - *Nhóm A:* Ô trên cùng và ô dưới cùng *cùng màu* (VD: Đỏ - Xanh - Đỏ). Số lượng Cột 1 thuộc nhóm A là: $3 \times 2 \times 1 = 6$ cách.
      - *Nhóm B:* Cả 3 ô *khác màu nhau* (VD: Đỏ - Xanh - Vàng). Số lượng Cột 1 thuộc nhóm B là: $3 \times 2 \times 1 = 6$ cách.
      
      Bây giờ ta lập sơ đồ đẻ nhánh từ Cột $i$ sang Cột $i+1$:
      - Nếu Cột $i$ thuộc *Nhóm A* (Đỏ - Xanh - Đỏ): 
        - Nó có thể sinh ra bao nhiêu cột Nhóm A mới? (Bắt buộc phải là Xanh - Đỏ - Xanh, hoặc Vàng - Đỏ - Vàng $\dots$). Đếm được *3 cách*.
        - Sinh ra bao nhiêu cột Nhóm B mới? (VD: Xanh - Đỏ - Vàng). Đếm được *2 cách*.
      - Nếu Cột $i$ thuộc *Nhóm B* (Đỏ - Xanh - Vàng):
        - Nó có thể sinh ra bao nhiêu cột Nhóm A mới? Đếm được *2 cách*.
        - Sinh ra bao nhiêu cột Nhóm B mới? Đếm được *2 cách*.
    ]
    
    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Vòng lặp tuần hoàn sinh sản (Markov Chain style)
        circle((-2, 0), radius: 1.2, fill: gradient.linear(rgb("E3F2FD"), rgb("BBDEFB")), stroke: 1.5pt + rgb("1565C0"), name: "A")
        content("A", text(fill: rgb("0D47A1"), weight: "bold")[NHÓM A])
        
        circle((2, 0), radius: 1.2, fill: gradient.linear(rgb("FFF3E0"), rgb("FFE0B2")), stroke: 1.5pt + rgb("E65100"), name: "B")
        content("B", text(fill: rgb("E65100"), weight: "bold")[NHÓM B])
        
        // A -> B
        bezier((-1.2, 0.6), (1.2, 0.6), (-0.5, 1.2), (0.5, 1.2), mark: (end: ">", fill: rgb("757575")), stroke: 1.5pt + rgb("757575"))
        circle((0, 0.9), radius: 0.2, fill: white, stroke: 1pt + rgb("757575"))
        content((0, 0.9), text(weight: "bold", size: 8pt)[$2$])
        
        // B -> A
        bezier((1.2, -0.6), (-1.2, -0.6), (0.5, -1.2), (-0.5, -1.2), mark: (end: ">", fill: rgb("757575")), stroke: 1.5pt + rgb("757575"))
        circle((0, -0.9), radius: 0.2, fill: white, stroke: 1pt + rgb("757575"))
        content((0, -0.9), text(weight: "bold", size: 8pt)[$2$])
        
        // A -> A (self loop)
        bezier((-3, 0.6), (-3, -0.6), (-5, 2.5), (-5, -2.5), mark: (end: ">", fill: rgb("1565C0")), stroke: 1.5pt + rgb("1565C0"))
        circle((-4, 0), radius: 0.2, fill: white, stroke: 1pt + rgb("1565C0"))
        content((-4, 0), text(weight: "bold", fill: rgb("1565C0"), size: 8pt)[$3$])
        
        // B -> B (self loop)
        bezier((3, 0.6), (3, -0.6), (5, 2.5), (5, -2.5), mark: (end: ">", fill: rgb("E65100")), stroke: 1.5pt + rgb("E65100"))
        circle((4, 0), radius: 0.2, fill: white, stroke: 1pt + rgb("E65100"))
        content((4, 0), text(weight: "bold", fill: rgb("E65100"), size: 8pt)[$2$])
      })
    ]
    Hệ phương trình lặp của 2 dãy $A_n, B_n$ (số cột A, B ở vị trí $n$) là:
    $ \begin{cases} A_{n+1} &= 3A_n + 2B_n \\ B_{n+1} &= 2A_n + 2B_n \end{cases} $
  ]
)

#v(0.5em)
#prob("104",
  [Lưới $3 \times 4$ nhưng bị khoét mất ô trung tâm (Hàng 2, Cột 2). Có 4 màu. Phân tích sự ảnh hưởng của ô bị khoét đến cột kế tiếp.],
  [Quy tắc lặp bị gián đoạn tại Cột 2],
  loigiai: [
    Khi lưới bị thủng, ta quét cột như bình thường, nhưng tại Cột bị thủng, *bộ quy tắc chuyển sẽ khác biệt hoàn toàn*.
    - *Cột 1 (đầy đủ 3 ô):* Có $4 \times 3 \times 3 = 36$ cách tô.
    - *Chuyển từ Cột 1 sang Cột 2 (bị thủng ô giữa):* 
      Cột 2 chỉ có ô trên và ô dưới. Ô trên Cột 2 phải khác ô trên Cột 1 (3 cách). Ô dưới Cột 2 phải khác ô dưới Cột 1 (3 cách).
      Cột 2 hoàn toàn không bị ràng buộc dọc (vì mất ô giữa). Số cách tô Cột 2 ứng với mỗi cấu hình Cột 1 là: $3 \times 3 = 9$ cách.
    - *Chuyển từ Cột 2 sang Cột 3 (đầy đủ 3 ô):*
      Ô trên Cột 3 khác ô trên Cột 2 (3 cách). Ô dưới Cột 3 khác ô dưới Cột 2 (3 cách).
      Và ĐẶC BIỆT: *Ô giữa Cột 3 hoàn toàn không bị Cột 2 chặn màu ngang* (do Cột 2 không có ô giữa). Nó chỉ cần khác màu ô trên và ô dưới của Cột 3!
      
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Col 1 (Full)
        rect((0, 0), (1.2, 3.6), fill: rgb("ECEFF1"), stroke: 1.5pt + rgb("78909C"), radius: 3pt)
        line((0, 1.2), (1.2, 1.2), stroke: 1pt); line((0, 2.4), (1.2, 2.4), stroke: 1pt)
        content((0.6, 3), $x_1$); content((0.6, 1.8), $x_2$); content((0.6, 0.6), $x_3$)
        content((0.6, -0.5), text(weight: "bold")[Cột 1])
        
        // Col 2 (Hole)
        rect((2.5, 2.4), (3.7, 3.6), fill: rgb("E3F2FD"), stroke: 1.5pt + rgb("1565C0"), radius: 3pt)
        rect((2.5, 0), (3.7, 1.2), fill: rgb("E3F2FD"), stroke: 1.5pt + rgb("1565C0"), radius: 3pt)
        content((3.1, 3), $y_1$); content((3.1, 0.6), $y_3$)
        content((3.1, 1.8), text(fill: rgb("D32F2F"), weight: "bold")[LỖ HỔNG])
        content((3.1, -0.5), text(weight: "bold")[Cột 2])
        
        // Col 3 (Full)
        rect((5, 0), (6.2, 3.6), fill: rgb("FFF3E0"), stroke: 1.5pt + rgb("E65100"), radius: 3pt)
        line((5, 1.2), (6.2, 1.2), stroke: 1pt); line((5, 2.4), (6.2, 2.4), stroke: 1pt)
        content((5.6, 3), $z_1$); content((5.6, 1.8), $z_2$); content((5.6, 0.6), $z_3$)
        content((5.6, -0.5), text(weight: "bold")[Cột 3])
        
        // Arrows C1 -> C2
        line((1.3, 3), (2.4, 3), mark: (end: ">"), stroke: 1.5pt + rgb("90CAF9"))
        line((1.3, 0.6), (2.4, 0.6), mark: (end: ">"), stroke: 1.5pt + rgb("90CAF9"))
        
        // Arrows C2 -> C3
        line((3.8, 3), (4.9, 3), mark: (end: ">"), stroke: 1.5pt + rgb("FFCC80"))
        line((3.8, 0.6), (4.9, 0.6), mark: (end: ">"), stroke: 1.5pt + rgb("FFCC80"))
        
        // The freedom arrow
        bezier((3.1, 2.3), (5.5, 1.8), (4, 1.8), (4.5, 1.8), mark: (end: ">", fill: rgb("4CAF50")), stroke: 1.5pt + rgb("4CAF50"), style: "dashed")
        content((4.2, 2.1), text(fill: rgb("2E7D32"), size: 8pt)[$z_2$ Tự Do Màu Ngang!])
      })
    ]
  ]
)
"""

pattern = re.compile(r"== 1\.5\. Kỹ Thuật Xây Dựng Bộ Quy Tắc Chuyển Trạng Thái Giữa Các Cột.*?== 2\. Bộ 3 Quy Tắc Vạn Năng", re.DOTALL)
content = pattern.sub(lambda _: new_section + "\n== 2. Bộ 3 Quy Tắc Vạn Năng", content)

with open('CD-DaiBacVanNang-MoRong.typ', 'w') as f:
    f.write(content)
