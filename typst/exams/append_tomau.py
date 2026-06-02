import codecs
import re

with codecs.open('CD-ToMau.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# Fix syntax errors
text = text.replace('(-1)^n(k-1)', '(-1)^n (k-1)')
text = text.replace('P_{n-1}', 'P_(n-1)')
text = text.replace('P_{n-2}', 'P_(n-2)')

# The new content to append
new_content = r"""
#pagebreak()

= Phần III: Tư Duy Lắt Léo Trên "Lưới Lạ"

Khi đề bài không cho các hình dáng chuẩn (đường thẳng, vòng tròn, lưới chữ nhật trọn vẹn) mà lại "khoét" đi một số ô, Đại Bác Xoá - Chập sẽ tỏa sáng. Hãy cùng phân tích các "Lưới Lạ" sau:

== 1. Bảng Lưới Khuyết Góc (Hình chữ L)

#example-box(n: "3.1 — Lưới khuyết")[
  *Đề bài:* Có 4 màu để tô vào một lưới gồm 3 ô vuông xếp thành hình chữ L như hình vẽ. Hai ô kề nhau (chung cạnh) phải khác màu. Hỏi có bao nhiêu cách tô?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    // Draw L shape
    rect((0, 1), (1, 2), fill: rgb("E0F7FA"), stroke: 1.5pt + c-teal)
    rect((0, 0), (1, 1), fill: rgb("E0F7FA"), stroke: 1.5pt + c-teal)
    rect((1, 0), (2, 1), fill: rgb("E0F7FA"), stroke: 1.5pt + c-teal)
    content((0.5, 1.5), text(size: 11pt, weight: "bold")[A])
    content((0.5, 0.5), text(size: 11pt, weight: "bold")[B])
    content((1.5, 0.5), text(size: 11pt, weight: "bold")[C])
  })
]
#v(0.5em)

#theory-box[
  *Giải:* 
  Nếu bạn nhận ra hình chữ L này thực chất chỉ là một "hàng thẳng" bị bẻ cong, mọi thứ sẽ vô cùng đơn giản. Đồ thị tương đương của nó là: $A - B - C$.
  Áp dụng **Súng Lục (Hàng thẳng)**:
  - Chọn màu cho B (ô trung tâm): Có 4 cách.
  - Chọn màu cho A (kề B): Có 3 cách.
  - Chọn màu cho C (kề B): Có 3 cách.
  Vậy tổng số cách tô là: $4 times 3 times 3 = 36$ cách.
]

== 2. Đồ thị Bánh Xe (Wheel Graph)

#example-box(n: "3.2 — Cái Nhụy và Những Cánh Hoa")[
  *Đề bài:* Một vòng đu quay có 1 cabin trung tâm nối với 5 cabin xung quanh (tạo thành ngũ giác). Có 5 màu sơn. Yêu cầu hai cabin nối nhau bằng thanh kim loại phải khác màu sơn. Hỏi có bao nhiêu cách sơn?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    let r = 1.2
    // Draw outer ring edges
    for i in range(5) {
      let a1 = i * 72 * 1deg + 90deg
      let a2 = (i + 1) * 72 * 1deg + 90deg
      let p1 = (calc.cos(a1) * r, calc.sin(a1) * r)
      let p2 = (calc.cos(a2) * r, calc.sin(a2) * r)
      line(p1, p2, stroke: 1.5pt + c-navy)
      // Spoke to center
      line((0,0), p1, stroke: 1pt + rgb("90CAF9"))
    }
    // Draw center
    circle((0,0), radius: 0.25, fill: rgb("FFF9C4"), stroke: 1.5pt + c-amber)
    content((0,0), text(size: 10pt, weight: "bold")[T])
    // Draw outer nodes
    for i in range(5) {
      let a1 = i * 72 * 1deg + 90deg
      let p1 = (calc.cos(a1) * r, calc.sin(a1) * r)
      circle(p1, radius: 0.2, fill: white, stroke: 1.5pt + c-navy)
      content(p1, text(size: 9pt, weight: "bold")[#(i+1)])
    }
  })
]
#v(0.5em)

#theory-box[
  *Giải:* 
  Đây là một dạng đồ thị hỗn hợp cực kỳ nổi tiếng. Hãy dùng **tư duy bóc tách**:
  - *Bước 1:* Tô màu cái Nhụy $T$ trước. Do có 5 màu nên Nhụy $T$ có $5$ cách chọn.
  - *Bước 2:* Quan sát các cánh hoa. Tất cả 5 cánh hoa đều nối với $T$, nên không cánh hoa nào được trùng màu với $T$. Nghĩa là tập màu của các cánh hoa bị thu hẹp lại chỉ còn $5 - 1 = 4$ màu.
  - *Bước 3:* Nhìn lại các cánh hoa. Chúng tạo thành một *vòng tròn 5 đỉnh*. Bài toán trở thành: Tô vòng tròn 5 đỉnh bằng 4 màu.
  Áp dụng **Đại Bác Vòng Tròn** với $k = 4, n = 5$:
  $ P_"vòng" = (4-1)^5 + (-1)^5(4-1) = 3^5 - 3 = 243 - 3 = 240. $
  Vậy tổng số cách sơn là: $5 times 240 = 1200$ cách.
]

#pagebreak()

= Phần IV: Dự Đoán Các Biến Thể Khó Tuyển Sinh 12

Trong kỳ thi Tuyển sinh 12 sắp tới, đề bài có thể không chỉ yêu cầu "kề nhau khác màu" đơn thuần, mà còn thêm các "Ràng buộc oan nghiệt". 

== Dự Đoán 1: Ràng buộc màu "Kẻ thù"

#example-box(n: "4.1 — Hai màu cấm kỵ")[
  *Đề bài:* Có 4 màu sơn (Đỏ, Xanh, Vàng, Tím). Cần sơn một dãy 5 ngôi nhà. Yêu cầu:
  1) Kề nhau khác màu.
  2) Nhà màu Đỏ tuyệt đối không được ở kề nhà màu Xanh.
]

#theory-box[
  *Phân tích bằng Đại Bác Truy Hồi:*
  Bài này phá vỡ tính đối xứng của Súng Lục $k(k-1)^{n-1}$. Ta không thể nhân đơn giản vì nếu ô trước là Đỏ, ô sau mất đi 2 lựa chọn (Đỏ, Xanh). Nhưng nếu ô trước là Vàng, ô sau chỉ mất 1 lựa chọn (Vàng).
  
  Ta chia tập màu làm 2 nhóm:
  - Nhóm rắc rối $A = {\text{Đỏ, Xanh}}$.
  - Nhóm an toàn $B = {\text{Vàng, Tím}}$.
  Gọi $x_n$ là số cách sơn $n$ nhà mà nhà cuối màu thuộc nhóm A.
  Gọi $y_n$ là số cách sơn $n$ nhà mà nhà cuối màu thuộc nhóm B.
  
  Với $n=1$: Có 2 màu thuộc A $\Rightarrow x_1 = 2$. Có 2 màu thuộc B $\Rightarrow y_1 = 2$.
  
  Khi chuyển sang nhà thứ $n+1$:
  - Nếu nhà $n+1$ muốn sơn màu A (Đỏ hoặc Xanh):
    + Từ nhóm A sang A: Nếu trước là Đỏ, chỉ có 0 cách chọn màu A (vì cấm Xanh và cấm Đỏ). Nếu trước là Xanh, cũng có 0 cách chọn A. Vậy không thể A nối A.
    + Từ nhóm B sang A: Nếu trước là Vàng/Tím, ta tự do chọn Đỏ hoặc Xanh (2 lựa chọn). Vậy: $x_{n+1} = 2 dot y_n$.
  - Nếu nhà $n+1$ muốn sơn màu B (Vàng hoặc Tím):
    + Từ nhóm A sang B: Vàng/Tím chơi với mọi màu, nên có 2 lựa chọn. $\Rightarrow 2 dot x_n$.
    + Từ nhóm B sang B: Bắt buộc khác màu ngay trước (có 2 màu trong B, cấm 1 màu trùng, còn 1 lựa chọn). $\Rightarrow 1 dot y_n$.
    Vậy: $y_{n+1} = 2x_n + y_n$.
    
  Bảng tính nhanh:
  - $n=1: x_1 = 2, y_1 = 2 \Rightarrow \text{Tổng } 4$.
  - $n=2: x_2 = 2(2) = 4, y_2 = 2(2) + 2 = 6 \Rightarrow \text{Tổng } 10$.
  - $n=3: x_3 = 2(6) = 12, y_3 = 2(4) + 6 = 14 \Rightarrow \text{Tổng } 26$.
  - $n=4: x_4 = 2(14) = 28, y_4 = 2(12) + 14 = 38 \Rightarrow \text{Tổng } 66$.
  - $n=5: x_5 = 2(38) = 76, y_5 = 2(28) + 38 = 94 \Rightarrow \text{Tổng } 170$.
  
  *Kết luận:* Có 170 cách sơn.
]

== Dự Đoán 2: Giới hạn số lần xuất hiện của một màu

#example-box(n: "4.2 — Sự độc quyền của một màu")[
  *Đề bài:* Sơn một dãy 4 cột đèn bằng 3 màu (Đỏ, Trắng, Vàng). Kề nhau khác màu. Biết rằng màu Đỏ là màu đắt tiền nên chỉ được sử dụng đúng 1 lần. Hỏi có bao nhiêu cách?
]

#theory-box[
  *Phân tích:*
  Màu Đỏ xuất hiện đúng 1 lần. Ta có thể chọn vị trí cho màu Đỏ trước, rồi tô các vị trí còn lại bằng 2 màu (Trắng, Vàng).
  Có 4 trường hợp đặt màu Đỏ (Đ):
  - *TH 1: Đ - X - X - X.* Ô số 1 là Đỏ. Ô số 2 phải khác Đỏ $\Rightarrow$ chọn Trắng/Vàng (2 cách). Ô số 3 phải khác ô 2 (còn 1 cách). Ô số 4 khác ô 3 (còn 1 cách). $\Rightarrow 1 times 2 times 1 times 1 = 2$ cách.
  - *TH 2: X - Đ - X - X.* Ô 2 là Đỏ. Ô 1 khác Đỏ (2 cách). Ô 3 khác Đỏ (2 cách). Ô 4 khác ô 3 (1 cách). $\Rightarrow 2 times 1 times 2 times 1 = 4$ cách.
  - *TH 3: X - X - Đ - X.* Đối xứng với TH 2, có $4$ cách.
  - *TH 4: X - X - X - Đ.* Đối xứng với TH 1, có $2$ cách.
  
  *Tổng cộng:* $2 + 4 + 4 + 2 = 12$ cách. 
  *(Bài này dùng tư duy chia trường hợp kết hợp Súng Lục rút gọn cực nhanh!)*
]
"""

# Append to file
text += new_content

with codecs.open('CD-ToMau.typ', 'w', encoding='utf-8') as f:
    f.write(text)

print("Done appending to CD-ToMau.typ.")
