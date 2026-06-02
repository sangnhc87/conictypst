import codecs

with codecs.open('CD-ToMau.typ', 'r', encoding='utf-8') as f:
    text = f.read()

start_idx = text.find('= Phần III:')
end_idx = text.find('= Phần IV:')

new_section3 = r"""= Phần III: Tư Duy Lắt Léo Trên "Lưới Lạ"

Khi đề bài không cho các hình dáng chuẩn (đường thẳng, vòng tròn, lưới chữ nhật trọn vẹn) mà lại "khoét" đi một số ô, Đại Bác Xoá - Chập sẽ tỏa sáng. Hãy cùng phân tích một loạt các "Lưới Lạ" sau:

== 1. Lưới Khuyết Góc (Chữ L)

#example-box(n: "3.1 — Lưới chữ L cơ bản")[
  *Đề bài:* Có $k$ màu để tô vào một lưới gồm 3 ô vuông xếp thành hình chữ L như hình vẽ. Hai ô kề nhau (chung cạnh) phải khác màu. Hỏi có bao nhiêu cách tô?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    // Draw L shape
    rect((0, 1), (1, 2), fill: white, stroke: 1.5pt + c-teal)
    rect((0, 0), (1, 1), fill: rgb("FFCDD2"), stroke: 2pt + red) // Highlight corner
    rect((1, 0), (2, 1), fill: white, stroke: 1.5pt + c-teal)
    content((0.5, 1.5), text(size: 11pt, weight: "bold")[A])
    content((0.5, 0.5), text(size: 11pt, weight: "bold")[B])
    content((1.5, 0.5), text(size: 11pt, weight: "bold")[C])
  })
]
#v(0.5em)

#theory-box[
  *Giải:* 
  Nếu bạn nhận ra hình chữ L này thực chất chỉ là một "hàng thẳng" bị bẻ cong, mọi thứ sẽ vô cùng đơn giản. 
  Hãy nhìn vào ô *B (tô màu đỏ)*. Nó là ô "góc vuông" nối giữa A và C.
  Tuy nhiên, A và C lại *không hề kề nhau*! Đồ thị tương đương của nó chỉ là một đường thẳng: $A - B - C$.
  
  Áp dụng *Súng Lục (Hàng thẳng)*:
  - Chọn màu cho B (ô trung tâm): Có $k$ cách.
  - Chọn màu cho A (kề B): Có $k-1$ cách.
  - Chọn màu cho C (kề B): Có $k-1$ cách.
  Vậy tổng số cách tô là: $k(k-1)^2$ cách.
]

== 2. Lưới Chữ Thập (Dấu Cộng)

#example-box(n: "3.2 — Cái rốn của vũ trụ")[
  *Đề bài:* Lưới gồm 5 ô xếp thành hình dấu cộng. Có 4 mã màu. Yêu cầu hai ô chung cạnh phải khác màu. Hỏi có bao nhiêu cách tô?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    rect((1, 2), (2, 3), fill: white, stroke: 1.5pt + c-navy) // Top
    rect((0, 1), (1, 2), fill: white, stroke: 1.5pt + c-navy) // Left
    rect((1, 1), (2, 2), fill: rgb("FFF9C4"), stroke: 2pt + rgb("F57F17")) // Center
    rect((2, 1), (3, 2), fill: white, stroke: 1.5pt + c-navy) // Right
    rect((1, 0), (2, 1), fill: white, stroke: 1.5pt + c-navy) // Bottom
    content((1.5, 1.5), text(size: 11pt, weight: "bold")[Tâm])
  })
]
#v(0.5em)

#theory-box[
  *Giải:* 
  Lưới dấu cộng nhìn thì toả ra 4 hướng, nhưng điểm huyệt duy nhất của nó là ô *Tâm (màu vàng)*.
  
  - *Bước 1:* Tô ô Tâm trước. Vì có 4 màu nên ô Tâm có $4$ cách chọn.
  - *Bước 2:* Quan sát 4 ô xung quanh (Trên, Dưới, Trái, Phải). Chúng đều kề với ô Tâm, nhưng *tuyệt đối không kề nhau*.
  - Do đó, 4 ô này hoàn toàn độc lập! Mỗi ô chỉ cần "né" màu của ô Tâm là được.
  - Ô Trên có 3 cách. Ô Dưới có 3 cách. Ô Trái có 3 cách. Ô Phải có 3 cách.
  
  Tổng số cách tô: $4 \times 3^4 = 4 \times 81 = 324$ cách.
  *(Tuyệt chiêu: "Khống chế con đầu đàn, đàn em tự do sinh hoạt")*
]

== 3. Trùm Cuối: Lưới Ghép 11 Ô (Dự Đoán Đề Thi Thử)

#example-box(n: "3.3 — Lưới Khuyết Đa Khối (Đỉnh cao cắt lớp)")[
  *Đề bài:* Có 11 thí sinh ngồi vào phòng thi như hình vẽ. Giám thị có 4 mã đề. Yêu cầu 2 thí sinh ngồi kề nhau (chung cạnh) phải khác mã đề. Số cách phát đề là $p$. Hãy tính $p/49$.
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    let yellow = rgb("FFF9C4")
    let blue = rgb("E3F2FD")
    
    // Khối Trái (Cột 1, Cột 2) - Màu Vàng
    for r in range(1, 4) {
      for c in range(1, 3) {
        rect((c - 1, 4 - r), (c, 5 - r), fill: yellow, stroke: 1pt + black)
      }
    }
    // Đuôi khối trái (Dòng 4, Cột 2)
    rect((1, 0), (2, 1), fill: yellow, stroke: 1pt + black)
    
    // Khối Phải (Cột 3, Cột 4) - Màu Xanh
    for r in range(3, 5) {
      for c in range(3, 5) {
        rect((c - 1, 4 - r), (c, 5 - r), fill: blue, stroke: 1pt + black)
      }
    }
    
    // Viền đỏ nét đứt đánh dấu mặt cắt tại Cột 2 (Dòng 3 và 4)
    rect((1, 1), (2, 2), stroke: (paint: red, thickness: 2.5pt, dash: "dashed"))
    rect((1, 0), (2, 1), stroke: (paint: red, thickness: 2.5pt, dash: "dashed"))
    
    content((0.5, 2.5), text(size: 9pt, weight: "bold")[Khối L'])
    content((3.5, 1.5), text(size: 9pt, weight: "bold")[Khối R])
  })
]
#v(0.5em)

#theory-box[
  *Giải:* 
  Nhìn hình, ta dùng ngay tuyệt kỹ **"Cắt Lớp"** chẻ lưới ra làm 2 khúc:
  - **Khối bên phải (Màu xanh - R):** Là một bảng $2 \times 2$ vuông vức.
  - **Khối bên trái (Màu vàng - L'):** Gồm 1 bảng $3 \times 2$ (phía trên) và lòi ra một cái "đuôi" ở góc dưới.

  Chỗ dính nhau của hai khối này chính là **hai ô viền đỏ đứt nét** (thuộc cột 2, dòng 3 và 4). 
  
  *Tiến hành bẻ khóa:*
  - **Bước 1 (Xử lý Khối R):** Theo định lý "Chuyển trạng thái" của lưới $2 \times n$, khi bạn bước từ Cột 2 sang Cột 3, số cách chọn màu luôn là $k^2 - 3k + 3 = 4^2 - 12 + 3 = 7$ cách. 
    Từ Cột 3 sang Cột 4 lại có $7$ cách nữa. 
    Vậy Khối Xanh R đóng góp hệ số: $7 \times 7 = \mathbf{49}$ **cách**. *(Tác giả bắt tính $p/49$ chính là vì cái đuôi 49 này sinh ra từ khối bên phải!)*

  - **Bước 2 (Xử lý Khối L'):** Nếu bạn bịt cái "đuôi" (dòng 4) lại, khối màu vàng là bảng $3 \times 2$.
    Công thức số cách tô bảng $3 \times 2$ là: $k(k-1) \times (k^2 - 3k + 3)^2 = 4 \times 3 \times 7^2 = \mathbf{588}$ cách.
    Bây giờ mở cái đuôi ra. Cái đuôi chỉ dính duy nhất vào ô phía trên nó. Nên cái đuôi có đúng $k-1 = 3$ cách tự do chọn màu.
    Số cách tô Khối Vàng L' là: $588 \times 3 = \mathbf{1764}$ **cách**.
    
  *Chốt hạ:*
  Tổng số cách phát đề là $p = 1764 \times 49$.
  Vậy $\frac{p}{49} = \mathbf{1764}$.
]

#pagebreak()

"""

final_text = text[:start_idx] + new_section3 + text[end_idx:]

with codecs.open('CD-ToMau.typ', 'w', encoding='utf-8') as f:
    f.write(final_text)

print("Section III updated successfully.")
