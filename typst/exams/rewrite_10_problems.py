import codecs

with codecs.open('CD-ToMau.typ', 'r', encoding='utf-8') as f:
    text = f.read()

split_str_start = "= Phần III: Tư Duy Lắt Léo Trên \"Lưới Lạ\""
split_str_end = "= Phần IV: Dự Đoán Các Biến Thể Khó Tuyển Sinh 12"

start_idx = text.find(split_str_start)
end_idx = text.find(split_str_end)

if start_idx == -1 or end_idx == -1:
    print("Could not find boundaries")
    exit(1)

new_content = r"""= Phần III: Tư Duy Lắt Léo Trên "Lưới Lạ"

Khi đề bài không cho các hình dáng chuẩn (đường thẳng, vòng tròn, lưới chữ nhật trọn vẹn) mà lại "khoét" đi một số ô, học sinh thường hoảng loạn. Tuy nhiên, chỉ cần nắm vững bản chất đồ thị, mọi "Lưới Lạ" đều có thể giải quyết gọn gàng. Hãy cùng phân tích 10 "Trận Đánh" kinh điển sau:

== 1. Lưới Khuyết Góc (Chữ L)

#example-box(n: "3.1 — Lưới chữ L cơ bản")[
  *Đề bài:* Có $k$ màu để tô vào một lưới gồm 3 ô vuông xếp thành hình chữ L như hình vẽ. Hai ô kề nhau (chung cạnh) phải khác màu. Hỏi có bao nhiêu cách tô?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    rect((0, 1), (1, 2), fill: white, stroke: 1.5pt + c-teal)
    rect((0, 0), (1, 1), fill: rgb("FFCDD2"), stroke: 2pt + red) 
    rect((1, 0), (2, 1), fill: white, stroke: 1.5pt + c-teal)
    content((0.5, 1.5), text(size: 11pt, weight: "bold")[A])
    content((0.5, 0.5), text(size: 11pt, weight: "bold")[B])
    content((1.5, 0.5), text(size: 11pt, weight: "bold")[C])
  })
]
#v(0.5em)

#note-box(title: "Công thức sử dụng: Súng Lục (Đường thẳng)")[
  *Lý thuyết gốc:* Nếu các ô nối tiếp nhau thành một đường không khép kín (như con rắn), ta dùng Súng Lục:
  Số cách tô = $k times (k-1)^{n-1}$.
]

#theory-box[
  *Giải chi tiết:* 
  #step[Bước 1: Bóc lớp ngụy trang]
  Nhìn bằng mắt thường, hình dáng này là một góc vuông (chữ L). Tuy nhiên, về mặt toán học (lý thuyết đồ thị), ô A chỉ nối với ô B, và ô C cũng chỉ nối với ô B. Ô A và ô C hoàn toàn không kề nhau. Đồ thị tương đương chỉ là một sợi dây: $A - B - C$.
  
  #step[Bước 2: Ráp công thức]
  Đây chính là mô hình Súng Lục với $n=3$ đỉnh.
  - Ta chọn màu cho đỉnh đầu tiên (đỉnh A): Có $k$ cách tự do.
  - Chọn màu cho B (kề A): Bắt buộc né màu của A, nên B có $k-1$ cách.
  - Chọn màu cho C (kề B): Bắt buộc né màu của B, C có $k-1$ cách.
  
  #step[Bước 3: Chốt hạ]
  Số cách tô bằng: $k times (k-1) times (k-1) = k(k-1)^2$ cách.
]

== 2. Lưới Chữ Thập (Dấu Cộng)

#example-box(n: "3.2 — Cái rốn của vũ trụ")[
  *Đề bài:* Lưới gồm 5 ô xếp thành hình dấu cộng. Có 4 mã màu. Yêu cầu hai ô chung cạnh phải khác màu. Hỏi có bao nhiêu cách tô?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    rect((1, 2), (2, 3), fill: white, stroke: 1.5pt + c-navy) 
    rect((0, 1), (1, 2), fill: white, stroke: 1.5pt + c-navy) 
    rect((1, 1), (2, 2), fill: rgb("FFF9C4"), stroke: 2pt + rgb("F57F17")) 
    rect((2, 1), (3, 2), fill: white, stroke: 1.5pt + c-navy) 
    rect((1, 0), (2, 1), fill: white, stroke: 1.5pt + c-navy) 
    content((1.5, 1.5), text(size: 11pt, weight: "bold")[Tâm])
  })
]
#v(0.5em)

#note-box(title: "Chiến thuật: Khống chế con đầu đàn")[
  *Lý thuyết gốc:* Nếu có một đỉnh trung tâm (Tâm) nối với nhiều nhánh nhỏ, và các nhánh nhỏ *không kề nhau*, ta chỉ cần khóa chặt cái Tâm lại. Bọn nhánh con sẽ trở nên hoàn toàn tự do!
]

#theory-box[
  *Giải chi tiết:* 
  #step[Bước 1: Tìm điểm yếu của đồ thị]
  Lưới dấu cộng nhìn tỏa ra 4 hướng, nhưng "tử huyệt" duy nhất của nó là ô *Tâm (màu vàng)*. Bốn ô xung quanh (Trên, Dưới, Trái, Phải) đều phụ thuộc vào ô Tâm, nhưng chúng lại không hề chạm vào nhau.
  
  #step[Bước 2: Xử lý theo thứ tự khống chế]
  - *Đóng băng ô Tâm:* Vì có 4 màu nên ô Tâm có đúng $4$ cách chọn tự do.
  - *Giải phóng đàn em:* Khi ô Tâm đã chốt màu (ví dụ Đỏ), thì 4 ô xung quanh chỉ có một nhiệm vụ duy nhất: "Tránh màu Đỏ ra". 
  - Ô Trên có $4 - 1 = 3$ cách.
  - Ô Dưới có $4 - 1 = 3$ cách.
  - Ô Trái có 3 cách, Ô Phải có 3 cách.
  - Vì chúng không kề nhau nên không phụ thuộc nhau, ta cứ việc nhân thẳng!
  
  #step[Bước 3: Chốt hạ]
  Tổng số cách tô: $4 times 3 times 3 times 3 times 3 = 4 times 3^4 = 324$ cách.
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
    
    // Khối Trái
    for r in range(1, 4) {
      for c in range(1, 3) {
        rect((c - 1, 4 - r), (c, 5 - r), fill: yellow, stroke: 1pt + black)
      }
    }
    rect((1, 0), (2, 1), fill: yellow, stroke: 1pt + black)
    
    // Khối Phải
    for r in range(3, 5) {
      for c in range(3, 5) {
        rect((c - 1, 4 - r), (c, 5 - r), fill: blue, stroke: 1pt + black)
      }
    }
    
    // Cut set
    rect((1, 1), (2, 2), stroke: (paint: red, thickness: 2.5pt, dash: "dashed"))
    rect((1, 0), (2, 1), stroke: (paint: red, thickness: 2.5pt, dash: "dashed"))
    
    content((0.5, 2.5), text(size: 9pt, weight: "bold")[Khối L'])
    content((3.5, 1.5), text(size: 9pt, weight: "bold")[Khối R])
  })
]
#v(0.5em)

#note-box(title: "Vũ khí: Hệ số chuyển đổi (Ma trận Cắt Lớp)")[
  *Lý thuyết gốc:* Đối với bảng $2 times n$, khi dịch chuyển từ cột này sang cột kế tiếp, số cách chọn màu sẽ luôn được nhân thêm một "Hệ số chuyển đổi" là: 
  $H = k^2 - 3k + 3$.
  Với $k=4$ màu, hệ số $H = 4^2 - 12 + 3 = 7$.
]

#theory-box[
  *Giải chi tiết:* 
  #step[Bước 1: Chẻ đồ thị bằng dao phẫu thuật]
  Nhìn hình, ta phải cắt ngay lưới này ra làm 2 khối tại vị trí có **hai ô viền đỏ đứt nét**:
  - **Khối R (Màu xanh):** Là một bảng $2 times 2$ chuẩn mực.
  - **Khối L' (Màu vàng):** Gồm một bảng $3 times 2$ và lòi ra một cái "đuôi" tự do.
  
  #step[Bước 2: Xử lý Khối R (Nơi đẻ ra số 49)]
  Khối R có 2 cột. Theo công thức cắt lớp bảng $2 times n$, đi từ Cột 2 sang Cột 3 mất 1 lần hệ số $H=7$. Đi từ Cột 3 sang Cột 4 mất thêm 1 lần $H=7$. 
  Vậy sự hiện diện của khối Xanh đã nhân tổng số cách lên: $7 times 7 = 49$ lần. *(Đó là lý do tác giả hỏi $p/49$, họ muốn triệt tiêu đi khối R!)*

  #step[Bước 3: Xử lý Khối L' (Khối gốc rễ)]
  Tạm che cái "đuôi" (cột 2 dòng 4) lại, khối Vàng chỉ còn là bảng $3 times 2$. 
  Số cách tô bảng $3 times 2$ theo công thức gốc là: $C = k(k-1) times (k^2 - 3k + 3)^2 = 4 times 3 times 7^2 = 588$ cách.
  Bây giờ thả cái đuôi ra. Cái đuôi này là một ô tự do, chỉ dính duy nhất vào cái ô ở trên nó. Vì dính 1 ô, nó phải né 1 màu, nên nó có $k-1 = 3$ cách.
  Vậy số cách tô Khối Vàng là: $588 times 3 = 1764$ cách.
  
  #step[Bước 4: Chốt hạ]
  Tổng số cách phát đề là $p = 1764 times 49$.
  Nên $\frac{p}{49} = 1764$. Một sự sắp xếp con số đầy ý đồ nghệ thuật của người ra đề!
]

== 4. Lưới Tổ Ong (Mạng Lục Giác Khép Vòng)

#example-box(n: "3.4 — Tổ ong lục giác")[
  *Đề bài:* Có 6 phòng học hình lục giác đều xếp khép kín tạo thành một vòng "tổ ong" như hình vẽ. Giám thị có $k$ mã đề. Hai phòng sát vách nhau phải khác mã đề. Hỏi có bao nhiêu cách?
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
      line(..pts, close: true, fill: white, stroke: 1.5pt + c-teal)
      content((cx, cy), text(weight: "bold")[#(i+1)])
    }
    circle((0,0), radius: r * 1.5, stroke: (paint: red, thickness: 2pt, dash: "dashed"))
  })
]
#v(0.5em)

#note-box(title: "Công thức sử dụng: Đại Bác Vòng Tròn")[
  *Lý thuyết gốc:* Bất cứ khi nào đồ thị là một tập hợp các ô xếp thành 1 vòng tròn khép kín (đỉnh 1 nối với đỉnh 2, 2 nối 3... và n nối lại với 1). Ta dùng Đại Bác:
  $P_n = (k-1)^n + (-1)^n(k-1)$
]

#theory-box[
  *Giải chi tiết:* 
  #step[Bước 1: Bóc lớp ngụy trang]
  Vỏ bọc hình lục giác là để hù doạ học sinh yếu bóng vía. Thực chất, phòng 1 sát phòng 2, phòng 2 sát phòng 3... và phòng 6 lại sát vòng lại phòng 1. Ở giữa "tổ ong" này không có phòng nào cả. 
  Hãy nhìn vòng nét đứt màu đỏ: Đồ thị này hoàn toàn tương đương với một Vòng tròn có $n=6$ đỉnh.
  
  #step[Bước 2: Ráp công thức]
  Thay số đỉnh $n=6$ vào công thức Đại Bác Vòng Tròn, ta được ngay số cách.
  
  #step[Bước 3: Chốt hạ]
  Số cách tô là: $P_6 = (k-1)^6 + (k-1)$. 
  Chỉ một dòng là xong bài!
]

== 5. Đồ Thị Nơ Bướm (Nút Thắt Cổ Chai)

#example-box(n: "3.5 — Đồ thị Nơ Bướm")[
  *Đề bài:* Có hai khu vực triển lãm hình tam giác. Hai khu này chung nhau đúng 1 đỉnh ở giữa (tạo thành hình nơ bướm). Có $k$ màu sơn, 2 đỉnh nối nhau phải khác màu. Hỏi có bao nhiêu cách sơn?
]

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    line((-1, 1), (-1, -1), (0,0), close: true, fill: rgb("E3F2FD"), stroke: 1.5pt + c-navy)
    line((1, 1), (1, -1), (0,0), close: true, fill: rgb("E3F2FD"), stroke: 1.5pt + c-navy)
    circle((0,0), radius: 0.15, fill: rgb("FFF9C4"), stroke: 2pt + red)
    content((0, 0.4), text(weight: "bold", fill: red)[Tâm (Nút thắt)])
  })
]
#v(0.5em)

#note-box(title: "Chiến thuật: Bóp nghẹt Nút thắt cổ chai")[
  *Lý thuyết gốc:* Khi hai đồ thị (hay hai khối) khổng lồ chỉ dính nhau qua đúng MỘT ĐỈNH duy nhất, hãy gán màu cho đỉnh đó trước. Ngay lập tức, hai đồ thị sẽ bị "chặt đứt" và hoàn toàn không còn liên quan gì đến nhau nữa!
]

#theory-box[
  *Giải chi tiết:* 
  #step[Bước 1: Tìm điểm yếu]
  Điểm yếu chí mạng của đồ thị này là đỉnh ở giữa (Tâm màu vàng). Nó chính là nút thắt cổ chai giao tiếp duy nhất giữa tam giác Trái và tam giác Phải.
  
  #step[Bước 2: Khống chế nút thắt]
  Ta lấy $k$ màu, chọn ra 1 màu để cố định cho đỉnh Tâm. Lúc này, Tâm có $k$ lựa chọn.
  Khi Tâm đã bị đóng băng (có màu cố định), đồ thị nơ bướm bị bẻ làm đôi thành 2 nửa hoàn toàn độc lập (Trái và Phải). Nhiệm vụ của mỗi nửa bây giờ chỉ là: "Tô màu cho 2 đỉnh còn lại sao cho né cái màu của Tâm ra".
  
  #step[Bước 3: Xử lý nhánh tự do]
  - Tam giác Trái: Còn lại 2 đỉnh nối với nhau. Cả 2 đỉnh đều phải né màu của Tâm, nên tập màu bị giảm đi 1, chỉ còn $k' = k-1$ màu. Tô 2 đỉnh nối nhau bằng $k-1$ màu, ta có $(k-1) times (k-2)$ cách.
  - Tam giác Phải: Lập luận tương tự, có $(k-1) times (k-2)$ cách.
  
  #step[Bước 4: Chốt hạ]
  Nhân tất cả lại với nhau:
  Tổng số cách là $k times (k-1)(k-2) times (k-1)(k-2) = k (k-1)^2 (k-2)^2$.
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

#note-box(title: "Công thức sử dụng: Đại Bác Vòng Tròn")[
  *Lý thuyết gốc:* $P_n = (k-1)^n + (-1)^n(k-1)$. 
  Áp dụng ngay khi đồ thị "trông có vẻ lằng nhằng" nhưng thực chất là một sợi xích khép kín.
]

#theory-box[
  *Giải chi tiết:* 
  #step[Bước 1: Phá vỡ ngụy trang]
  Bảng $3 times 3$ bình thường là một lưới cực kỳ phức tạp (phải dùng ma trận vuông góc). Tuy nhiên, khi bị "khoét" lỗ ở giữa, 8 ô viền hoàn toàn mất đi lõi trung tâm. 
  Hãy nhìn đường nét đứt màu đỏ trên hình: 8 ô này thực chất chỉ là một sợi xích khép kín vòng tròn, đỉnh đầu nối với đỉnh cuối.
  
  #step[Bước 2: Ráp công thức]
  Đây chính là mô hình Vòng Tròn với $n=8$ đỉnh, số màu $k=3$.
  Lắp vào công thức: $P_8 = (3-1)^8 + (-1)^8(3-1)$.
  
  #step[Bước 3: Tính toán chốt hạ]
  $P_8 = 2^8 + 1 times 2 = 256 + 2 = 258$ cách. Giải quyết một lưới phức tạp chỉ bằng một thao tác tính nhẩm!
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

#note-box(title: "Chiến thuật: Cắt lớp Tam giác (Từ đỉnh xuống đáy)")[
  *Lý thuyết gốc:* Lưới tam giác là một tổ hợp các hình tam giác lồng vào nhau. Với 1 tam giác 3 ô, ô thứ 3 luôn kề với 2 ô trước. Cách tô tối ưu là tô xuôi chiều từ trên xuống dưới, gỡ dần từng lớp gạch.
]

#theory-box[
  *Giải chi tiết:* 
  #step[Bước 1: Chọn hướng tấn công]
  Khối gạch này được xếp lớp rất chuẩn xác. Cứ 1 ô ở trên đè lên 2 ô ở dưới. Ta sẽ giải quyết bài này theo luồng đi từ Đỉnh tháp (Tầng 1) xuống Đáy tháp (Tầng 3).
  
  #step[Bước 2: Phá vỡ Tầng 1 và Tầng 2]
  - Tầng 1 (Ô số 1) tự do, có $k$ cách chọn.
  - Tầng 2 (Ô 2, Ô 3): Ô 2 kề Ô 1 nên khác Ô 1. Ô 3 kề Ô 1 nên khác Ô 1. Đồng thời Ô 2 và Ô 3 kề nhau. Nói cách khác, 3 ô (1, 2, 3) tạo thành một khối tam giác trọn vẹn $K_3$.
  Số cách tô cho chóp tháp 3 ô này là: $k times (k-1) times (k-2)$.
  
  #step[Bước 3: Lan truyền xuống Tầng 3 (Quy luật cực vi diệu)]
  - Lúc này, Ô 2 và Ô 3 đã bị cố định màu (gọi là màu A và màu B). (Lưu ý A khác B vì chúng kề nhau).
  - Xuống tầng 3: Hãy xem **Ô số 5** (nằm ngay giữa). Ô 5 kề với ai? Nó kề với cả Ô 2(màu A) và Ô 3(màu B). Vậy Ô 5 phải né cả A và B. Nó có đúng $k-2$ cách chọn màu! Giả sử chọn màu C cho Ô 5.
  - Sang **Ô số 4**: Kề với Ô 2(màu A) và Ô 5(màu C). Nó phải né A và C. Cũng có đúng $k-2$ cách!
  - Sang **Ô số 6**: Kề với Ô 3(màu B) và Ô 5(màu C). Lại né 2 màu, có đúng $k-2$ cách!
  
  #step[Bước 4: Chốt hạ]
  Chóp tam giác đóng góp: $k(k-1)(k-2)$. 
  Tầng đáy 3 ô đóng góp: $(k-2) times (k-2) times (k-2) = (k-2)^3$.
  Tổng cộng: $k(k-1)(k-2)^4$.
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

#note-box(title: "Công thức sử dụng: Súng Lục (Cây không khép vòng)")[
  *Lý thuyết gốc:* Mọi đồ thị "Cây" (có nhánh đâm tủa ra nhưng không bao giờ khép lại thành hình vòng tròn) đều có thể giải bằng cách nhân liên tiếp hệ số tự do $(k-1)$.
]

#theory-box[
  *Giải chi tiết:* 
  #step[Bước 1: Nhận diện Đồ Thị Cây]
  Hãy quan sát đồ thị này. Nó không hề có bất kỳ một vòng khép kín nào. Nếu ta nhỏ một giọt nước từ gốc lên, nước sẽ chảy tủa ra các nhánh mà không bao giờ chảy ngược về chỗ cũ. Đây là đặc tính thuần túy của Đồ thị Cây.
  
  #step[Bước 2: Xử lý đoạn Xương Sống]
  Đầu tiên ta giải quyết cái trục đứng 4 ô (được viền đỏ). Nó là một Súng Lục thẳng băng 4 đỉnh.
  Số cách tô xương sống là: $k(k-1)^3$. 
  Với $k=4$, ta có: $4 times 3^3 = 4 times 27 = 108$ cách.
  
  #step[Bước 3: Xử lý các Nhánh vây cá]
  Sau khi xương sống đã tô xong. Hãy nhìn vào 4 ô nhánh lồi ra. 
  Mỗi cái nhánh đó chỉ kề với đúng 1 ô trên xương sống! Nó như một cái nụ chỉ dính đúng 1 cuống lá.
  Do đó, mỗi ô nhánh chỉ cần "né" đúng 1 màu của cái ô xương sống sinh ra nó. Mỗi ô sẽ có $4-1 = 3$ lựa chọn độc lập.
  Vì có 4 nhánh, số cách là: $3 times 3 times 3 times 3 = 3^4 = 81$ cách.
  
  #step[Bước 4: Chốt hạ]
  Tổng số cách = (Cách tô xương sống) $times$ (Cách tô nhánh) = $108 times 81 = 8748$ cách. (Quá nhẹ nhàng!)
]

== 9. Đồ Thị Bipartite $K_{3,3}$ (Chia Phe Chiến Tuyến)

#example-box(n: "3.9 — Ba Nam, Ba Nữ")[
  *Đề bài:* Có 6 đỉnh chia làm 2 phe: Trái (3 đỉnh) và Phải (3 đỉnh). Mọi đỉnh Trái đều nối với mọi đỉnh Phải. Nội bộ phe Trái KHÔNG nối nhau. Nội bộ phe Phải KHÔNG nối nhau. Có 4 màu. Hai đỉnh nối nhau phải khác màu. Hỏi có bao nhiêu cách?
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

#note-box(title: "Chiến thuật: Chia tổ hợp theo lượng màu (Phân mảnh)")[
  *Lý thuyết gốc:* Với đồ thị 2 phe (Bipartite), phe A hoàn toàn tự do chọn màu vì không kề nhau. Nhưng tập hợp các màu mà phe A đã lấy sẽ tạo thành một "Lệnh cấm tập thể" dội thẳng xuống phe B. 
  Giải pháp: Chia trường hợp dựa trên việc phe A dùng bao nhiêu màu.
]

#theory-box[
  *Giải chi tiết:* 
  #step[Bước 1: Phân tích chiến tuyến]
  Các đỉnh Phe Trái (Xanh) hoàn toàn không nối với nhau. Nghĩa là bạn có thể tô 3 đỉnh Trái này cùng 1 màu cũng được, hoặc mỗi đỉnh 1 màu cũng được. Tuy nhiên, nếu Phe Trái dùng nhiều màu, Phe Phải (Đỏ) sẽ bị cấm đi bấy nhiêu màu (vì Phe Phải kề với mọi đỉnh Trái). Ta phải phân 3 trường hợp.
  
  #step[Bước 2: Chia trường hợp (Theo số màu được dùng ở Phe Trái)]
  Có tổng 4 màu. Phe Trái có 3 đỉnh.
  - *TH1: Phe Trái dùng tiết kiệm đúng 1 màu.*
    - Chọn 1 màu cho Phe Trái: Có 4 cách. (Cả 3 đỉnh Xanh đều xài màu này).
    - Phe Phải bị cấm 1 màu này, nên mỗi đỉnh Đỏ đều có $4-1 = 3$ cách chọn. Vì Phe Phải cũng không kề nội bộ, ta nhân thẳng: $3^3 = 27$ cách.
    - $=>$ Kết quả TH1: $4 times 27 = 108$ cách.
  
  - *TH2: Phe Trái dùng đúng 2 màu.*
    - Cần chọn ra 2 màu từ 4 màu gốc: Tổ hợp $C_4^2 = 6$ cách.
    - Dùng 2 màu đó để tô cho 3 đỉnh Xanh (đảm bảo màu nào cũng xuất hiện). Có công thức: $2^3 - 2 = 6$ cách. Vậy Phe Trái có $6 times 6 = 36$ cách sắp xếp.
    - Phe Phải khóc thét vì bị cấm mất 2 màu. Nên mỗi đỉnh Đỏ chỉ còn $4-2 = 2$ cách chọn: $2^3 = 8$ cách.
    - $=>$ Kết quả TH2: $36 times 8 = 288$ cách.
    
  - *TH3: Phe Trái xài sang dùng đúng 3 màu.*
    - Chọn ra 3 màu và xếp cho 3 đỉnh Xanh: Chỉnh hợp $A_4^3 = 24$ cách.
    - Phe Phải bị cấm 3 màu, nên mỗi đỉnh Đỏ chỉ còn thoi thóp $4-3 = 1$ lựa chọn duy nhất. Số cách Phe Phải: $1^3 = 1$ cách.
    - $=>$ Kết quả TH3: $24 times 1 = 24$ cách.
  
  #step[Bước 3: Chốt hạ]
  Tổng hợp lại ta được đáp số cuối cùng: $108 + 288 + 24 = 420$ cách. Một tư duy sắc bén tuyệt đối!
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

#note-box(title: "Công thức sử dụng: Đồ thị Đầy Đủ (K_n)")[
  *Lý thuyết gốc:* Khi một khối n ô bị nối vằn vện TẤT CẢ các cặp đỉnh với nhau, khối đó được gọi là đồ thị đầy đủ $K_n$. Nó ép buộc n ô đó bắt buộc phải lấy n màu phân biệt khác nhau hoàn toàn.
]

#theory-box[
  *Giải chi tiết:* 
  #step[Bước 1: Hiểu bản chất ràng buộc chéo]
  Trong một khối vuông $2 times 2$ (gồm 4 ô). Yêu cầu cơ bản đã cấm 4 cạnh xung quanh. Bây giờ lại cấm thêm 2 đường chéo (vạch đỏ). Điều này biến 4 ô của khối vuông $2 times 2$ thành đồ thị Đầy Đủ $K_4$!
  Tính chất sống còn: 4 ô của một hình vuông $2 times 2$ bất kỳ phải xài 4 màu khác nhau hoàn toàn!
  
  #step[Bước 2: Cắt lớp theo từng cột]
  - *Xử lý Cột 1 (2 ô đứng trái cùng):* Chỉ kề nhau 1 cạnh, nên có $k times (k-1)$ cách tô. Gọi 2 màu này là Tập X.
  - *Xử lý Cột 2 (2 ô đứng ở giữa):* Vì Cột 2 dính liền với Cột 1 để tạo thành 1 hình vuông $2 times 2$. Mà khối này ép buộc phải có 4 màu phân biệt, nên Cột 2 *phải dùng 2 màu hoàn toàn mới*, né hoàn toàn cái Tập X của Cột 1.
    Nghĩa là Cột 2 chỉ được chọn từ $k-2$ màu còn lại. Số cách lấy ra và tô cho 2 ô của Cột 2 là: $(k-2) times (k-3)$. Gọi tập màu này là Tập Y.
  - *Xử lý Cột 3 (2 ô đứng phải cùng):* Lập luận tương tự, Cột 3 dính với Cột 2 tạo thành hình vuông thứ hai. Do đó, Cột 3 phải né hoàn toàn Tập Y của Cột 2. Vậy Cột 3 cũng chỉ còn dư $k-2$ màu. Số cách tô là $(k-2) times (k-3)$.
  
  *(Bất ngờ sư phạm: Bạn sẽ hỏi, Cột 3 có phải né Tập X của Cột 1 không? Câu trả lời là KHÔNG. Cột 3 và Cột 1 không chạm nhau, chúng bị ngăn bởi Cột 2. Cột 3 chỉ cần né Cột 2 là xong!)*
  
  #step[Bước 3: Chốt hạ]
  Nhân kết quả từng cột lại, ta có đáp án siêu đẹp: 
  Tổng số cách tô là: $k(k-1) times (k-2)^2 (k-3)^2$. Rất gọn gàng và đầy chất trí tuệ!
]

"""

final_text = text[:start_idx] + new_content + text[end_idx:]

with codecs.open('CD-ToMau.typ', 'w', encoding='utf-8') as f:
    f.write(final_text)

print("Rewrote 10 problems.")
