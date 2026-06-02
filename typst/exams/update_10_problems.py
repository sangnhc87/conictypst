import codecs

with codecs.open('CD-ToMau.typ', 'r', encoding='utf-8') as f:
    text = f.read()

split_str = "= Phần IV: Dự Đoán Các Biến Thể Khó Tuyển Sinh 12"
parts = text.split(split_str)

if len(parts) < 2:
    print("Could not find split string")
    exit(1)

new_content = r"""
== 4. Lưới Tổ Ong (Mạng Lục Giác Khép Vòng)

#example-box(n: "3.4 — Tổ ong lục giác")[
  *Đề bài:* Có 6 phòng học hình lục giác đều xếp thành một vòng khép kín tạo thành một "tổ ong" như hình vẽ. Giám thị có $k$ mã đề. Hai phòng sát vách nhau phải khác mã đề. Hỏi có bao nhiêu cách phát đề?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    let r = 0.8
    for i in range(6) {
      let a = i * 60 * 1deg
      let cx = calc.cos(a) * r * 1.5
      let cy = calc.sin(a) * r * 1.5
      let pts = ()
      for j in range(6) {
        let ha = j * 60 * 1deg + 30deg
        pts.push((cx + calc.cos(ha) * r * 0.5, cy + calc.sin(ha) * r * 0.5))
      }
      polygon(..pts, fill: white, stroke: 1.5pt + c-teal)
      content((cx, cy), text(weight: "bold")[#(i+1)])
    }
    // Highlight inner circle
    circle((0,0), radius: r * 1.5, stroke: (paint: red, thickness: 2pt, dash: "dashed"))
  })
]
#v(0.5em)

#theory-box[
  *Giải:* 
  #step[Bước 1: Nhận diện cấu trúc] Nhìn thì giống lưới tổ ong phức tạp, nhưng thực chất 6 lục giác này chỉ nối với nhau thành một "vòng tròn" khép kín được vẽ bằng nét đứt màu đỏ. Không có phòng nào ở giữa!
  
  #step[Bước 2: Bóc lớp vỏ ngụy trang] Đồ thị tương đương của nó chính là một vòng tròn gồm 6 đỉnh. 
  
  #step[Bước 3: Dùng Đại Bác Vòng Tròn] Áp dụng công thức Đại Bác Vòng Tròn với $n=6$:
  Số cách tô là: $P = (k-1)^6 + (k-1)$.
]

== 5. Đồ Thị Nơ Bướm (Nút thắt cổ chai)

#example-box(n: "3.5 — Đồ thị Nơ Bướm")[
  *Đề bài:* Có hai khu vực triển lãm hình tam giác. Hai khu này chung nhau đúng 1 đỉnh ở giữa (tạo thành hình nơ bướm). Có $k$ màu sơn, 2 đỉnh nối nhau (chung cạnh) phải khác màu. Hỏi có bao nhiêu cách sơn?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    polygon((-1, 1), (-1, -1), (0,0), fill: rgb("E3F2FD"), stroke: 1.5pt + c-navy)
    polygon((1, 1), (1, -1), (0,0), fill: rgb("E3F2FD"), stroke: 1.5pt + c-navy)
    circle((0,0), radius: 0.15, fill: rgb("FFF9C4"), stroke: 2pt + red)
    content((0, 0.4), text(weight: "bold", fill: red)[Tâm (Nút thắt)])
  })
]
#v(0.5em)

#theory-box[
  *Giải:* 
  #step[Bước 1: Tìm điểm yếu] Điểm yếu chí mạng của đồ thị này là đỉnh ở giữa. Nó là "nút thắt cổ chai" duy nhất nối 2 nửa tam giác.
  
  #step[Bước 2: Khống chế nút thắt] Ta chọn màu cho đỉnh Tâm trước. Vì có $k$ màu nên đỉnh Tâm có $k$ cách chọn.
  
  #step[Bước 3: Phân rã đồ thị] Khi Tâm đã bị cố định màu (coi như bị "đóng băng"), đồ thị đứt làm 2 nửa trái và phải hoàn toàn độc lập. Mỗi nửa đều kề với Tâm (nên phải khác màu Tâm).
  - Nửa trái: Hai đỉnh còn lại tạo thành đoạn thẳng 2 đỉnh, sơn bằng $k-1$ màu. Bắn Súng Lục $k' = k-1$. Số cách: $(k-1)(k-2)$.
  - Nửa phải: Tương tự, số cách là $(k-1)(k-2)$.
  
  *Chốt hạ:* Tổng số cách là $k times (k-1)^2 (k-2)^2$.
]

== 6. Lưới Bảng 3x3 Bị Thủng Ở Giữa (Donut Grid)

#example-box(n: "3.6 — Donut Grid")[
  *Đề bài:* Một bảng $3 times 3$ bị khoét mất ô trung tâm (chỉ còn 8 ô viền xung quanh). Có 3 màu sơn. Kề nhau (chung cạnh) khác màu. Hỏi có bao nhiêu cách?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    for r in range(3) {
      for c in range(3) {
        if not (r == 1 and c == 1) {
          rect((c, r), (c+1, r+1), fill: white, stroke: 1.5pt + black)
        } else {
          content((c+0.5, r+0.5), text(weight: "bold", fill: red)[Thủng])
        }
      }
    }
    line((0.5, 2.5), (1.5, 2.5), (2.5, 2.5), (2.5, 1.5), (2.5, 0.5), (1.5, 0.5), (0.5, 0.5), (0.5, 1.5), (0.5, 2.5), stroke: (paint: red, thickness: 2pt, dash: "dashed"))
  })
]
#v(0.5em)

#theory-box[
  *Giải:* 
  #step[Bước 1: Nhận diện đồ thị] Bảng $3 times 3$ bình thường thì rất phức tạp (như mạng nhện), nhưng khi bị khoét ô trung tâm, đồ thị mất đi sự giằng xé bên trong.
  
  #step[Bước 2: Vẽ đường nối] Nhìn đường đứt nét màu đỏ: 8 ô viền thực chất chỉ nối với nhau thành đúng một vòng tròn 8 đỉnh khép kín!
  
  #step[Bước 3: Bắn Đại Bác] Áp dụng công thức Đại Bác Vòng Tròn với $n=8, k=3$:
  $P = (3-1)^8 + (-1)^8(3-1) = 2^8 + 2 = 256 + 2 = 258$ cách.
]

== 7. Đồ Thị Kim Tự Tháp (Tam Giác Phân Tầng)

#example-box(n: "3.7 — Kim tự tháp")[
  *Đề bài:* Xếp 6 ô vuông thành hình kim tự tháp (tầng 1 có 1 ô, tầng 2 có 2 ô, tầng 3 có 3 ô). Có $k$ màu. Tô các ô sao cho 2 ô kề cạnh nhau khác màu. Tính số cách.
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    rect((0, 2), (1, 3), fill: rgb("FFCDD2"), stroke: 1.5pt + black)
    content((0.5, 2.5), [1])
    
    rect((-0.5, 1), (0.5, 2), fill: rgb("FFF9C4"), stroke: 1.5pt + black)
    rect((0.5, 1), (1.5, 2), fill: rgb("FFF9C4"), stroke: 1.5pt + black)
    content((0, 1.5), [2])
    content((1, 1.5), [3])
    
    rect((-1, 0), (0, 1), fill: rgb("E3F2FD"), stroke: 1.5pt + black)
    rect((0, 0), (1, 1), fill: rgb("E3F2FD"), stroke: 1.5pt + black)
    rect((1, 0), (2, 1), fill: rgb("E3F2FD"), stroke: 1.5pt + black)
    content((-0.5, 0.5), [4])
    content((0.5, 0.5), [5])
    content((1.5, 0.5), [6])
  })
]
#v(0.5em)

#theory-box[
  *Giải:* 
  #step[Bước 1: Chọn hướng tấn công] Đồ thị này nhìn rối, nhưng tính phân tầng rất rõ rệt. Ta sẽ dùng thuật toán Cắt Lớp tô từ đỉnh tháp đổ xuống đáy.
  
  #step[Bước 2: Cắt lớp theo tầng]
  - Tầng 1 (Ô số 1): Có $k$ cách chọn màu.
  - Tầng 2 (Ô 2, Ô 3): Ô 2 phải khác Ô 1, Ô 3 phải khác Ô 1. Và Ô 2, Ô 3 kề nhau. Vậy Tầng 1 và Tầng 2 gộp lại thành một khối tam giác. Số cách tô Tầng 1 & 2 là: $k(k-1)(k-2)$.
  - Tầng 3 (Ô 4, 5, 6): 
    - Để giải cực nhanh, ta nhận thấy: Khi Ô 2 và Ô 3 đã tô (khác màu nhau, gọi là A và B).
    - Ô 5 kề cả Ô 2(A) và Ô 3(B), nên Ô 5 có $k-2$ cách.
    - Khi Ô 5 đã tô (màu C), Ô 4 kề Ô 2(A) và Ô 5(C), nên Ô 4 có $k-2$ cách.
    - Tương tự, Ô 6 kề Ô 3(B) và Ô 5(C), nên Ô 6 có $k-2$ cách.
    
  #step[Bước 3: Chốt hạ] Khối 3 tầng này có số cách là: $k(k-1)(k-2) times (k-2)^3$.
]

== 8. Lưới Xương Cá (Cây Phân Nhánh)

#example-box(n: "3.8 — Bộ xương cá")[
  *Đề bài:* Cho một lưới gồm 1 trục dọc 4 ô, từ mỗi ô trên trục mọc ra 1 ô nhánh phụ (tổng 8 ô). Có 4 màu. Hỏi có bao nhiêu cách tô?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    for i in range(4) {
      rect((0, i), (1, i+1), fill: rgb("FFF9C4"), stroke: 2pt + red)
      rect((1, i), (2, i+1), fill: white, stroke: 1.5pt + black)
    }
  })
]
#v(0.5em)

#theory-box[
  *Giải:* 
  #step[Bước 1: Nhận diện Cây] Đồ thị này hoàn toàn không có bất kỳ vòng khép kín nào. Đây là đồ thị Cây (Tree Graph).
  
  #step[Bước 2: Khống chế xương sống] Trục dọc 4 ô (viền đỏ) là một đường thẳng đứng. Dùng Súng Lục: $k(k-1)^3$. Với $k=4$, ta có $4 times 3^3 = 108$ cách.
  
  #step[Bước 3: Bắn nhánh phụ] Từ mỗi ô xương sống đẻ ra 1 nhánh phụ. Mỗi ô nhánh phụ chỉ kề với đúng 1 ô trên xương sống. Cứ như một mầm cây mọc ra chỉ dính 1 điểm. Do đó, mỗi ô nhánh có tự do $k-1 = 3$ lựa chọn. Có 4 ô nhánh, nên nhân thêm $3^4 = 81$.
  
  *Chốt hạ:* Tổng số cách: $108 times 81 = 8748$ cách. (Sức mạnh của Đồ thị Cây).
]

== 9. Đồ Thị Bipartite $K_{3,3}$ (Chia Phe Chiến Tuyến)

#example-box(n: "3.9 — Ba Nam, Ba Nữ")[
  *Đề bài:* Có 6 đỉnh chia làm 2 phe: Trái (3 đỉnh) và Phải (3 đỉnh). Mọi đỉnh Trái đều nối với mọi đỉnh Phải. Nội bộ các đỉnh Trái không nối nhau. Nội bộ Phải không nối nhau. Có 4 màu. Hai đỉnh nối nhau phải khác màu. Hỏi có bao nhiêu cách?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    let lefts = ((0, 2), (0, 1), (0, 0))
    let rights = ((2, 2), (2, 1), (2, 0))
    for l in lefts {
      for r in rights {
        line(l, r, stroke: 0.5pt + gray)
      }
      circle(l, radius: 0.15, fill: rgb("E3F2FD"), stroke: 1.5pt + c-navy)
    }
    for r in rights {
      circle(r, radius: 0.15, fill: rgb("FFCDD2"), stroke: 1.5pt + red)
    }
  })
]
#v(0.5em)

#theory-box[
  *Giải:* 
  #step[Bước 1: Phân mảnh tư duy] Phe Trái không nối nội bộ, nghĩa là 3 đỉnh Phe Trái có thể tô màu tùy ý, *thậm chí trùng màu nhau*! Nhưng tập màu của Phe Trái sẽ áp đặt "lệnh cấm" lên Phe Phải (vì Phe Phải kề với mọi đỉnh Trái).
  
  #step[Bước 2: Chia trường hợp (Theo số màu được dùng ở Phe Trái)]
  - *TH1: Phe Trái dùng đúng 1 màu.* Có 4 cách chọn màu này. Khi đó, Phe Phải bị cấm 1 màu. Phe Phải còn 3 màu tự do. 3 đỉnh Phải không kề nhau nên mỗi đỉnh Phải có 3 cách: $3^3 = 27$ cách. $=>$ TH1: $4 times 27 = 108$.
  - *TH2: Phe Trái dùng đúng 2 màu.* Chọn 2 màu từ 4 màu: $C_4^2 = 6$ cách. Phân phối 2 màu này cho 3 đỉnh Trái (với đk cả 2 màu đều phải xuất hiện): Tổng số hàm là $2^3 - 2 = 6$ cách. Vậy Phe Trái có $6 times 6 = 36$ cách. Phe Phải bị cấm 2 màu, còn 2 màu tự do. $=>$ Phe Phải có $2^3 = 8$ cách. $=>$ TH2: $36 times 8 = 288$.
  - *TH3: Phe Trái dùng đúng 3 màu.* Chọn 3 màu từ 4 màu rồi hoán vị cho 3 đỉnh Trái: $A_4^3 = 24$ cách. Phe Phải bị cấm 3 màu, còn 1 màu duy nhất. $=>$ Phe Phải có $1^3 = 1$ cách. $=>$ TH3: $24 times 1 = 24$.
  
  #step[Bước 3: Chốt hạ] Tổng cộng: $108 + 288 + 24 = 420$ cách.
]

== 10. Bảng 2x3 Bị Ràng Buộc Kẻ Chéo

#example-box(n: "3.10 — Lưới cấm chéo")[
  *Đề bài:* Cho bảng $2 times 3$ (6 ô). Yêu cầu: Hai ô chung cạnh phải khác màu. THÊM NỮA: Hai ô nằm trên đường chéo của bất kỳ hình vuông $2 times 2$ nào cũng phải khác màu. Có $k$ màu. Tính số cách.
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    for c in range(3) {
      rect((c, 0), (c+1, 1), fill: white, stroke: 1.5pt + black)
      rect((c, 1), (c+1, 2), fill: white, stroke: 1.5pt + black)
    }
    line((0,0), (1,1), stroke: (paint: red, thickness: 1.5pt))
    line((0,1), (1,0), stroke: (paint: red, thickness: 1.5pt))
    line((1,0), (2,1), stroke: (paint: red, thickness: 1.5pt))
    line((1,1), (2,0), stroke: (paint: red, thickness: 1.5pt))
    line((2,0), (3,1), stroke: (paint: red, thickness: 1.5pt))
    line((2,1), (3,0), stroke: (paint: red, thickness: 1.5pt))
  })
]
#v(0.5em)

#theory-box[
  *Giải:* 
  #step[Bước 1: Hiểu bản chất ràng buộc chéo] Khi cấm kề chéo, nghĩa là 4 ô trong bất kỳ hình vuông $2 times 2$ nào đều bị nối tất cả các cạnh và đường chéo với nhau. Đó là một Đồ thị đầy đủ $K_4$! Bốn ô này *bắt buộc phải lấy 4 màu đôi một khác nhau*.
  
  #step[Bước 2: Cắt lớp theo cột]
  - Cột 1 (2 ô đứng): Có $k(k-1)$ cách chọn.
  - Cột 2 (2 ô đứng): Vì 2 ô Cột 2 tạo với 2 ô Cột 1 thành hình vuông $2 times 2$ (chứa 4 màu khác biệt), nên 2 ô Cột 2 bắt buộc phải lấy 2 màu *khác hoàn toàn* với 2 tập màu đã xài ở Cột 1. Tức là lấy từ tập $k-2$ màu còn lại. Số cách chọn và sắp xếp 2 màu cho Cột 2 là: $(k-2)(k-3)$.
  - Cột 3 (2 ô đứng): Lập luận tương tự, Cột 3 tạo với Cột 2 thành hình vuông $2 times 2$. Nên Cột 3 phải né hoàn toàn tập màu của Cột 2. Số cách là: $(k-2)(k-3)$.
  *(Bất ngờ chưa: Cột 3 không bị ép phải khác Cột 1, vì chúng ở xa nhau, chướng ngại vật ở giữa đã bảo vệ chúng!)*
  
  #step[Bước 3: Chốt hạ] Tổng số cách tô là: $k(k-1) times (k-2)^2 (k-3)^2$. Một kết quả đẹp ngỡ ngàng!
]

#pagebreak()
"""

final_text = parts[0] + new_content + split_str + parts[1]

with codecs.open('CD-ToMau.typ', 'w', encoding='utf-8') as f:
    f.write(final_text)

print("Added 7 new grid problems.")
