#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("000000"))

// Hàm vẽ biểu đồ Venn 3 tập hợp
#let venn-3(
  nameA: "A", nameB: "B", nameC: "C",
  valA: "", valB: "", valC: "",
  valAB: "", valAC: "", valBC: "",
  valABC: ""
) = align(center)[
  #cetz.canvas({
    import cetz.draw: *
    
    // Vị trí tâm 3 hình tròn
    let r = 1.6
    let cA = (0, 1.2)
    let cB = (-1.1, -0.7)
    let cC = (1.1, -0.7)
    
    // Vẽ 3 hình tròn
    circle(cA, radius: r, name: "A", stroke: 1.5pt + rgb("FF4136"), fill: rgb("FF4136").transparentize(70%))
    circle(cB, radius: r, name: "B", stroke: 1.5pt + rgb("0074D9"), fill: rgb("0074D9").transparentize(70%))
    circle(cC, radius: r, name: "C", stroke: 1.5pt + rgb("2ECC40"), fill: rgb("2ECC40").transparentize(70%))
    
    // Tên tập hợp
    content((0, 3.1), text(font: "Arial", weight: "bold", fill: rgb("FF4136"), size: 12pt)[#nameA])
    content((-2.6, -2.1), text(font: "Arial", weight: "bold", fill: rgb("0074D9"), size: 12pt)[#nameB])
    content((2.6, -2.1), text(font: "Arial", weight: "bold", fill: rgb("2ECC40"), size: 12pt)[#nameC])
    
    // Giá trị các vùng
    content((0, 1.8), text(weight: "bold")[#valA]) // Chỉ A
    content((-1.6, -1), text(weight: "bold")[#valB]) // Chỉ B
    content((1.6, -1), text(weight: "bold")[#valC]) // Chỉ C
    
    content((-1.1, 0.6), text(weight: "bold")[#valAB]) // Chỉ A, B
    content((1.1, 0.6), text(weight: "bold")[#valAC]) // Chỉ A, C
    content((0, -1.3), text(weight: "bold")[#valBC]) // Chỉ B, C
    
    content((0, -0.1), text(weight: "bold", fill: red)[#valABC]) // A, B, C
  })
]

= CHUYÊN ĐỀ: GIẢI TOÁN TẬP HỢP BẰNG SƠ ĐỒ VENN

== 1. Phương pháp giải

Biểu đồ Venn là công cụ trực quan mạnh mẽ để giải các bài toán đếm phần tử của tập hợp. Với bài toán 3 tập hợp $A$, $B$, $C$, ta biểu diễn bằng 3 vòng tròn giao nhau, chia mặt phẳng thành 8 vùng (kể cả vùng bên ngoài 3 tập hợp).

*Các công thức cơ bản (Nguyên lý Bù - Trừ):*
- Số phần tử của hợp 2 tập hợp: 
  $|A union B| = |A| + |B| - |A inter B|$
- Số phần tử của hợp 3 tập hợp:
  $|A union B union C| = |A| + |B| + |C| - |A inter B| - |A inter C| - |B inter C| + |A inter B inter C|$

*Kỹ năng sử dụng sơ đồ Venn:*
- Luôn ưu tiên điền số liệu từ *vùng giao chung lớn nhất* (giao của cả 3 tập hợp) ra ngoài.
- Khi có thông tin "chỉ thuộc tập $A$", ta điền trực tiếp vào vùng không giao với các tập khác.
- Lập hệ phương trình cho các vùng chưa biết dựa trên tổng số phần tử.

== 2. Bài tập vận dụng

#ds(
  [
    Lớp 10A có 35 học sinh thi học sinh giỏi. Mỗi học sinh thi ít nhất một môn trong ba môn Toán, Lý và Hóa. Biết có 12 học sinh chỉ thi môn Toán, có 14 học sinh thi môn Lý, có 15 học sinh thi môn Hóa và có 3 thí sinh chỉ thi môn Lý và môn Hóa. Xét tính đúng sai của các khẳng định sau:
  ],
  (
    False([Có 9 học sinh chỉ thi môn Lý mà không thi môn Hóa.]),
    False([Có 23 học sinh chỉ thi môn Hóa mà không thi môn Lý.]),
    False([Số học sinh chỉ thi môn Lý hoặc thi môn Hóa là 8 học sinh.]),
    True([Có 3 học sinh đi thi cả ba môn Toán, Lý và Hoá.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Phân tích bài toán:*
      - Gọi $T, L, H$ lần lượt là tập hợp học sinh thi Toán, Lý, Hóa.
      - Vì mỗi học sinh thi ít nhất 1 môn nên số phần tử của hợp 3 tập là tổng số học sinh:
        $|T union L union H| = 35$
      - Có $12$ học sinh *chỉ thi môn Toán*. Tức là số học sinh thuộc $T$ nhưng không thuộc $L$ và $H$. Vùng này chiếm một phần của tập $T$, không giao với $L$ và $H$.
      - Suy ra, số học sinh có thi Lý hoặc Hóa (có thể thi cả Toán) là phần còn lại của lớp:
        $|L union H| = 35 - 12 = 23$ học sinh.
        
      #align(center)[
        #venn-3(
          nameA: "Toán (T)", nameB: "Lý (L)", nameC: "Hóa (H)",
          valA: "12", valB: "?", valC: "?",
          valAB: "?", valAC: "?", valBC: "3",
          valABC: "?"
        )
      ]
    ]
    #step[
      *2. Tính số học sinh giao nhau:*
      - Theo nguyên lý bù trừ cho 2 tập hợp $L$ và $H$:
        $|L union H| = |L| + |H| - |L inter H|$
        $=> 23 = 14 + 15 - |L inter H| => |L inter H| = 6$
      - Tập hợp $L inter H$ (học sinh thi cả Lý và Hóa) bao gồm 2 nhóm:
        + Nhóm *chỉ thi Lý và Hóa* (không thi Toán)
        + Nhóm *thi cả 3 môn Toán, Lý, Hóa*
      - Theo đề, có 3 thí sinh *chỉ thi môn Lý và môn Hóa*. 
      - Suy ra số học sinh thi cả 3 môn là: $6 - 3 = 3$ học sinh.
      
      #align(center)[
        #venn-3(
          nameA: "Toán (T)", nameB: "Lý (L)", nameC: "Hóa (H)",
          valA: "12", valB: "?", valC: "?",
          valAB: "?", valAC: "?", valBC: "3",
          valABC: "3"
        )
      ]
    ]
    #step[
      *3. Biểu diễn sơ đồ Venn & Đối chiếu các vùng:*
      Dựa vào thông tin đã tính, ta có:
      - Số học sinh thi Lý mà không thi Hóa (Tập $L backslash H$): $|L| - |L inter H| = 14 - 6 = 8$.
      - Số học sinh thi Hóa mà không thi Lý (Tập $H backslash L$): $|H| - |L inter H| = 15 - 6 = 9$.
      
      #align(center)[
        #venn-3(
          nameA: "Toán (T)", nameB: "Lý (L)", nameC: "Hóa (H)",
          valA: "12", valB: "?", valC: "?",
          valAB: "?", valAC: "?", valBC: "3",
          valABC: "3"
        )
      ]
      
      *Xét các khẳng định:*
      - *a) SAI.* Số học sinh thi môn Lý mà không thi Hóa là $8$ (không phải $9$).
      - *b) SAI.* Số học sinh thi môn Hóa mà không thi Lý là $9$ (không phải $23$).
      - *c) SAI.* Số học sinh chỉ thi môn Lý (không Toán, Hóa) hoặc chỉ thi môn Hóa (không Toán, Lý) chắc chắn nhỏ hơn hoặc bằng tổng số học sinh (Lý không Hóa) + (Hóa không Lý) $= 8 + 9 = 17$. Câu khẳng định "là 8 học sinh" là sai dữ liệu.
      - *d) ĐÚNG.* Tính toán ở Bước 2 cho thấy có đúng 3 học sinh thi cả 3 môn.
    ]
    #reset-step()
  ]
)

#ds(
  [
    Các em học sinh lớp 10A làm bài thi khảo sát học sinh giỏi môn Toán. Đề thi có 3 câu. Sau khi chấm bài giáo viên tổng kết được như sau: Có 6 học sinh làm được câu 1, có 5 học sinh làm được câu 2, có 4 học sinh làm được câu 3. Có 2 học sinh làm được câu 1 và câu 2, có 2 học sinh làm được câu 1 và câu 3, có 1 học sinh làm được câu 2 và câu 3 và chỉ có 1 học sinh làm được cả 3 câu. Xét tính đúng sai của các khẳng định sau:
  ],
  (
    False([Có duy nhất một học sinh chỉ làm được câu 1.]),
    True([Không có học sinh nào chỉ làm được câu 2 và câu 3.]),
    True([Có 2 học sinh chỉ làm được câu 3.]),
    True([Có tất cả 8 học sinh chỉ làm được đúng một câu.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Phân tích bài toán:*
      Gọi $A, B, C$ lần lượt là tập hợp học sinh làm được câu 1, câu 2, câu 3.
      Theo giả thiết ta có số lượng phần tử của các tập hợp:
      - $|A| = 6$, $|B| = 5$, $|C| = 4$
      - $|A inter B| = 2$, $|A inter C| = 2$, $|B inter C| = 1$
      - Giao chung của cả 3 tập hợp (làm được cả 3 câu): $|A inter B inter C| = 1$
    ]
    #step[
      *2. Điền số liệu vào sơ đồ Venn (Từ trong ra ngoài):*
      - *Làm được cả 3 câu:* Điền số $1$ vào giao điểm trung tâm.
      - *Chỉ làm được câu 1 và câu 2* (không làm được câu 3): $|A inter B| - 1 = 2 - 1 = 1$.
      - *Chỉ làm được câu 1 và câu 3* (không làm được câu 2): $|A inter C| - 1 = 2 - 1 = 1$.
      - *Chỉ làm được câu 2 và câu 3* (không làm được câu 1): $|B inter C| - 1 = 1 - 1 = 0$.
      - *Chỉ làm được câu 1:* $|A| - (1 + 1 + 1) = 6 - 3 = 3$.
      - *Chỉ làm được câu 2:* $|B| - (1 + 0 + 1) = 5 - 2 = 3$.
      - *Chỉ làm được câu 3:* $|C| - (1 + 0 + 1) = 4 - 2 = 2$.
    ]
    #step[
      *3. Biểu diễn trực quan và Kết luận:*
      #align(center)[
        #venn-3(
          nameA: "Câu 1", nameB: "Câu 2", nameC: "Câu 3",
          valA: "3", valB: "3", valC: "2",
          valAB: "1", valAC: "1", valBC: "0",
          valABC: "1"
        )
      ]
      
      *Xét các khẳng định:*
      - *a) SAI.* Nhìn vào sơ đồ, số học sinh *chỉ làm được câu 1* là $3$ (không phải duy nhất $1$).
      - *b) ĐÚNG.* Vùng giao chỉ của câu 2 và câu 3 (không chứa câu 1) có giá trị là $0$.
      - *c) ĐÚNG.* Vùng chỉ thuộc câu 3 có giá trị là $2$.
      - *d) ĐÚNG.* Tổng số học sinh *chỉ làm được đúng một câu* bằng (Chỉ câu 1) + (Chỉ câu 2) + (Chỉ câu 3) $= 3 + 3 + 2 = 8$.
    ]
    #reset-step()
  ]
)

#ds(
  [
    Khảo sát 45 học sinh về việc tham gia ba câu lạc bộ ngoại khóa: Tiếng Anh, Thể thao và Nghệ thuật. Kết quả thu được như sau:
    - 22 học sinh tham gia CLB Tiếng Anh.
    - 18 học sinh tham gia CLB Thể thao.
    - 15 học sinh tham gia CLB Nghệ thuật.
    - 8 học sinh tham gia cả Tiếng Anh và Thể thao.
    - 6 học sinh tham gia cả Tiếng Anh và Nghệ thuật.
    - 5 học sinh tham gia cả Thể thao và Nghệ thuật.
    - 5 học sinh không tham gia bất kỳ câu lạc bộ nào.
    
    Xét tính đúng sai của các khẳng định sau:
  ],
  (
    False([Số học sinh tham gia ít nhất một câu lạc bộ là 45 học sinh.]),
    True([Có 4 học sinh tham gia cả ba câu lạc bộ.]),
    True([Số học sinh chỉ tham gia duy nhất CLB Tiếng Anh là 12 học sinh.]),
    True([Có tổng cộng 29 học sinh chỉ tham gia đúng một câu lạc bộ.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Tính số học sinh tham gia ít nhất 1 CLB & Số học sinh tham gia cả 3 CLB:*
      - Số học sinh tham gia ít nhất 1 CLB bằng tổng số học sinh trừ đi số học sinh không tham gia CLB nào:
        $45 - 5 = 40$ học sinh.
      - Đặt $A, B, C$ lần lượt là tập hợp học sinh tham gia Tiếng Anh, Thể thao, Nghệ thuật.
      - Áp dụng công thức hợp của 3 tập hợp:
        $|A union B union C| = |A| + |B| + |C| - |A inter B| - |A inter C| - |B inter C| + |A inter B inter C|$
        $=> 40 = 22 + 18 + 15 - 8 - 6 - 5 + |A inter B inter C|$
        $=> 40 = 36 + |A inter B inter C| => |A inter B inter C| = 4$
      - Vậy có $4$ học sinh tham gia cả 3 câu lạc bộ.
    ]
    #step[
      *2. Điền số liệu vào sơ đồ Venn (Từ trong ra ngoài):*
      - *Cả 3 CLB:* $4$
      - *Chỉ Tiếng Anh và Thể thao:* $|A inter B| - 4 = 8 - 4 = 4$.
      - *Chỉ Tiếng Anh và Nghệ thuật:* $|A inter C| - 4 = 6 - 4 = 2$.
      - *Chỉ Thể thao và Nghệ thuật:* $|B inter C| - 4 = 5 - 4 = 1$.
      - *Chỉ Tiếng Anh:* $|A| - (4 + 2 + 4) = 22 - 10 = 12$.
      - *Chỉ Thể thao:* $|B| - (4 + 1 + 4) = 18 - 9 = 9$.
      - *Chỉ Nghệ thuật:* $|C| - (2 + 1 + 4) = 15 - 7 = 8$.
    ]
    #step[
      *3. Biểu diễn trực quan và Kết luận:*
      #align(center)[
        #venn-3(
          nameA: "Tiếng Anh", nameB: "Thể thao", nameC: "Nghệ thuật",
          valA: "12", valB: "9", valC: "8",
          valAB: "4", valAC: "2", valBC: "1",
          valABC: "4"
        )
      ]
      
      *Xét các khẳng định:*
      - *a) SAI.* Số học sinh tham gia ít nhất 1 CLB là $40$ (do có 5 em không tham gia).
      - *b) ĐÚNG.* Tính toán ở Bước 1 cho thấy có đúng $4$ học sinh tham gia cả 3 CLB.
      - *c) ĐÚNG.* Số học sinh chỉ thuộc vòng tròn Tiếng Anh (không giao với vòng tròn khác) là $12$.
      - *d) ĐÚNG.* Số học sinh tham gia đúng 1 CLB là tổng của các vùng ngoài cùng: $12 + 9 + 8 = 29$.
    ]
    #reset-step()
  ]
)

#ds(
  [
    *(Bài toán không đầy đủ)* Khảo sát thói quen đọc sách của 50 người với ba thể loại: Tiểu thuyết (T), Kỹ năng (K) và Khoa học (H). Kết quả cho thấy:
    - 30 người đọc Tiểu thuyết.
    - 25 người đọc Kỹ năng.
    - 20 người đọc Khoa học.
    - 5 người đọc cả 3 thể loại.
    Biết rằng tất cả 50 người đều đọc ít nhất một thể loại sách. Xét tính đúng sai của các khẳng định sau:
  ],
  (
    True([Tổng số người chỉ đọc đúng 2 thể loại sách là 15 người.]),
    False([Chắc chắn có ít nhất 5 người chỉ đọc thể loại Tiểu thuyết và Kỹ năng.]),
    True([Tổng số người chỉ đọc đúng 1 thể loại là 30 người.]),
    False([Có thể tìm được chính xác số người chỉ đọc thể loại Tiểu thuyết.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Phân tích bài toán:*
      - Số người đọc ít nhất 1 thể loại: $|T union K union H| = 50$.
      - Dữ kiện từng tập hợp: $|T| = 30$, $|K| = 25$, $|H| = 20$.
      - Số người đọc cả 3 thể loại: $|T inter K inter H| = 5$.
    ]
    #step[
      *2. Thiết lập phương trình tổng quát:*
      - Theo nguyên lý bù trừ 3 tập hợp:
        $|T union K union H| = |T| + |K| + |H| - (|T inter K| + |K inter H| + |H inter T|) + |T inter K inter H|$
        $=> 50 = 30 + 25 + 20 - (|T inter K| + |K inter H| + |H inter T|) + 5$
        $=> |T inter K| + |K inter H| + |H inter T| = 80 - 50 = 30$.
      - Nhận xét: Ta chỉ tìm được tổng của các vùng giao 2 tập hợp, nhưng không thể tìm được số lượng chính xác của từng vùng giao $T inter K$, $K inter H$ hay $H inter T$. 
      - Do đó, bài toán này thuộc dạng *không đầy đủ dữ kiện* đối với từng vùng đơn lẻ, sơ đồ Venn sẽ có nhiều ẩn phụ thuộc nhau.
    ]
    #step[
      *3. Xét các khẳng định bằng các tổng đặc biệt:*
      - Đặt $a, b, c$ lần lượt là số người *chỉ đọc đúng 2 thể loại* (ví dụ: $a$ là số người chỉ đọc $T$ và $K$, không đọc $H$).
      - Ta có: $|T inter K| = a + 5$, $|K inter H| = b + 5$, $|H inter T| = c + 5$.
      - Thay vào tổng ở bước 2: $(a + 5) + (b + 5) + (c + 5) = 30 => a + b + c = 15$.
      
      - *a) ĐÚNG.* Tổng số người chỉ đọc đúng 2 thể loại chính là $a + b + c = 15$.
      - *b) SAI.* Phương trình $a + b + c = 15$ (với $a, b, c >= 0$) có rất nhiều nghiệm. Có thể xảy ra trường hợp $a = 0, b = 10, c = 5$. Do đó, không chắc chắn $a >= 5$.
      - *c) ĐÚNG.* Tổng số người đọc đúng 1 thể loại bằng tổng số người (50) trừ đi nhóm đọc 2 thể loại (15) và nhóm đọc 3 thể loại (5): $50 - 15 - 5 = 30$ người.
      - *d) SAI.* Vì các giá trị $a, b, c$ thay đổi linh hoạt nên số người *chỉ đọc Tiểu thuyết* ($30 - a - c - 5 = 25 - a - c$) cũng sẽ thay đổi. Không thể tìm được một con số chính xác.
    ]
    #reset-step()
  ]
)

#ds(
  [
    *(Bài toán không đầy đủ)* Khảo sát 100 khách du lịch nếm thử ba món đặc sản địa phương X, Y và Z. Kết quả thu được: 60 người nếm món X, 50 người nếm món Y, 40 người nếm món Z. Biết rằng tất cả 100 người đều nếm thử ít nhất 1 món và có đúng 10 người nếm thử cả 3 món. Xét tính đúng sai của các khẳng định sau:
  ],
  (
    False([Có 60 người nếm thử từ hai món trở lên.]),
    True([Tổng số người chỉ nếm thử đúng một món là 60 người.]),
    True([Số người nếm thử đúng hai món là 30 người.]),
    False([Có thể chắc chắn rằng vùng giao của chỉ món Y và món Z lớn hơn 0.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Phân tích tổng số người nếm giao nhau:*
      - Tương tự bài toán trước, ta dùng công thức Bù Trừ:
        $|X union Y union Z| = |X| + |Y| + |Z| - sum |"giao 2 món"| + |X inter Y inter Z|$
        $=> 100 = 60 + 50 + 40 - sum |"giao 2 món"| + 10$
        $=> sum |"giao 2 món"| = 160 - 100 = 60$.
      - Chú ý: $sum |"giao 2 món"| = |X inter Y| + |Y inter Z| + |Z inter X|$ bao gồm cả nhóm người nếm 3 món (được tính 3 lần).
    ]
    #step[
      *2. Trả lời các câu hỏi về nhóm (1 món, 2 món, 3 món):*
      - Gọi số người nếm đúng 2 món là $S_2$. Ta có: 
        $sum |"giao 2 món"| = S_2 + 3 times |X inter Y inter Z|$
        $=> 60 = S_2 + 3 times 10 => S_2 = 30$.
      - Vậy số người nếm *đúng hai món* là 30 người.
      - Số người nếm *từ hai món trở lên* = $S_2$ + (nhóm 3 món) = $30 + 10 = 40$.
      - Số người nếm *đúng một món* = Tổng số người - (nhóm nếm từ 2 món trở lên) = $100 - 40 = 60$.
    ]
    #step[
      *3. Xét các khẳng định:*
      - *a) SAI.* Số người nếm từ hai món trở lên là 40 (chứ không phải 60).
      - *b) ĐÚNG.* Tính toán ở Bước 2 cho kết quả 60 người.
      - *c) ĐÚNG.* Số người nếm đúng 2 món là 30.
      - *d) SAI.* Vì đây là bài toán không đầy đủ, vùng giao chỉ của Y và Z (ký hiệu $b$) thỏa mãn $a + b + c = 30$. Rất có thể $b = 0$ (vẫn tồn tại nghiệm hợp lệ), do đó không có gì đảm bảo $b > 0$.
    ]
    #reset-step()
  ]
)

#ds(
  [
    Khảo sát 200 người dùng mạng xã hội về việc sử dụng Facebook (F), Instagram (I) và Tiktok (T). Kết quả thu được: 
    - 120 người dùng F; 90 người dùng I; 80 người dùng T.
    - 40 người dùng cả F và I; 30 người dùng cả I và T; 50 người dùng cả F và T.
    - 10 người dùng cả 3 mạng xã hội.
    Xét tính đúng sai của các khẳng định sau:
  ],
  (
    True([Có 20 người không dùng mạng xã hội nào trong ba mạng trên.]),
    False([Có 100 người chỉ dùng đúng một mạng xã hội.]),
    True([Số người chỉ dùng duy nhất mạng Tiktok là 10 người.]),
    False([Số người dùng ít nhất 2 mạng xã hội là 90 người.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Tính số người không dùng mạng nào:*
      - Tính số người dùng ít nhất 1 mạng bằng công thức hợp 3 tập:
        $|F union I union T| = 120 + 90 + 80 - 40 - 30 - 50 + 10 = 180$ người.
      - Số người không dùng mạng nào: $200 - 180 = 20$ người.
    ]
    #step[
      *2. Biểu diễn sơ đồ Venn (Dạng đầy đủ):*
      - Điền vào giao 3 tập: *10*.
      - Giao 2 tập (Chỉ F và I): $40 - 10 = 30$.
      - Giao 2 tập (Chỉ I và T): $30 - 10 = 20$.
      - Giao 2 tập (Chỉ F và T): $50 - 10 = 40$.
      - Chỉ F: $120 - (30 + 10 + 40) = 40$.
      - Chỉ I: $90 - (30 + 10 + 20) = 30$.
      - Chỉ T: $80 - (40 + 10 + 20) = 10$.
      
      #align(center)[
        #venn-3(
          nameA: "Facebook (F)", nameB: "Instagram (I)", nameC: "Tiktok (T)",
          valA: "40", valB: "30", valC: "10",
          valAB: "30", valAC: "40", valBC: "20",
          valABC: "10"
        )
      ]
    ]
    #step[
      *3. Xét các khẳng định:*
      - *a) ĐÚNG.* Có đúng 20 người nằm ngoài cả 3 vòng tròn.
      - *b) SAI.* Số người dùng đúng 1 mạng là tổng các phần rìa ngoài: $40 + 30 + 10 = 80$ (không phải 100).
      - *c) ĐÚNG.* Vùng "chỉ Tiktok" có đúng 10 người.
      - *d) SAI.* Số người dùng ít nhất 2 mạng = (Đúng 2 mạng) + (Cả 3 mạng) = $(30 + 20 + 40) + 10 = 100$ người (không phải 90).
    ]
    #reset-step()
  ]
)

#ds(
  [
    Trong một cuộc khảo sát sở thích học tập của học sinh trường THPT, người ta thấy rằng: có $50%$ học sinh thích Toán, $40%$ thích Văn, $30%$ thích Anh. Ngoài ra có $20%$ thích Toán và Văn; $15%$ thích Văn và Anh; $10%$ thích Toán và Anh. Cuối cùng, có $5%$ học sinh yêu thích cả ba môn. Xét tính đúng sai của các khẳng định sau:
  ],
  (
    True([Có 20% học sinh không thích môn nào trong ba môn trên.]),
    False([Có 25% học sinh chỉ thích đúng một môn.]),
    True([Tỷ lệ học sinh thích Toán nhưng không thích Văn là 30%.]),
    False([Số học sinh thích ít nhất hai môn chiếm tỷ lệ 30%.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Điền tỷ lệ phần trăm vào sơ đồ Venn:*
      Coi tổng số học sinh toàn trường là $100%$. Bài toán có đầy đủ dữ kiện, ta phân rã từng vùng từ trong ra ngoài:
      - Cả 3 môn: *5%*
      - Chỉ Toán & Văn: $20% - 5% = 15%$.
      - Chỉ Văn & Anh: $15% - 5% = 10%$.
      - Chỉ Toán & Anh: $10% - 5% = 5%$.
      - Chỉ Toán: $50% - (15% + 5% + 5%) = 25%$.
      - Chỉ Văn: $40% - (15% + 5% + 10%) = 10%$.
      - Chỉ Anh: $30% - (5% + 5% + 10%) = 10%$.
      
      #align(center)[
        #venn-3(
          nameA: "Toán", nameB: "Văn", nameC: "Anh",
          valA: "25%", valB: "10%", valC: "10%",
          valAB: "15%", valAC: "5%", valBC: "10%",
          valABC: "5%"
        )
      ]
    ]
    #step[
      *2. Xét các khẳng định:*
      - *a) ĐÚNG.* Tổng tỷ lệ học sinh thích ít nhất 1 môn là: $25 + 10 + 10 + 15 + 5 + 10 + 5 = 80%$. Tỷ lệ học sinh không thích môn nào là $100% - 80% = 20%$.
      - *b) SAI.* Học sinh chỉ thích đúng một môn gồm 3 vùng rìa ngoài: $25% + 10% + 10% = 45%$ (chứ không phải 25%). Con số 25% chỉ là của riêng môn Toán.
      - *c) ĐÚNG.* Học sinh thích Toán nhưng không thích Văn tương đương tập $T backslash V$, là tổng của vùng "chỉ Toán" và "chỉ Toán & Anh" = $25% + 5% = 30%$. (Hoặc tính nhanh bằng $50% - 20% = 30%$).
      - *d) SAI.* Học sinh thích ít nhất 2 môn bao gồm vùng giao nhau 2 môn và giao nhau 3 môn: $15% + 10% + 5% + 5% = 35%$ (chứ không phải 30%).
    ]
    #reset-step()
  ]
)

#ds(
  [
    Trong đợt tổng kết cuối năm học, một lớp có 45 học sinh ghi nhận kết quả học tập xuất sắc ở ba môn khối Tự nhiên: Toán, Vật lí và Hóa học. Thống kê cho thấy có 20 em đạt điểm giỏi môn Toán, 18 em giỏi môn Vật lí và 17 em giỏi môn Hóa học. Biết rằng có 5 em đạt điểm giỏi ở cả ba môn; đồng thời có 7 em giỏi cả Toán và Vật lí, 6 em giỏi cả Toán và Hóa học, 8 em giỏi cả Vật lí và Hóa học. Xét tính đúng sai của các khẳng định sau:
  ],
  (
    True([Số học sinh không đạt điểm giỏi ở cả ba môn nói trên là 6 em.]),
    False([Số học sinh chỉ đạt điểm giỏi duy nhất một môn là 25 em.]),
    True([Có đúng 6 học sinh đạt điểm giỏi chính xác hai môn.]),
    True([Tỉ số giữa số học sinh giỏi ít nhất hai môn và số học sinh chỉ giỏi một môn là $11/28$.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Điền các giá trị vào Sơ đồ Venn:*
      Phân rã các dữ kiện từ vùng giao ba tập hợp ra ngoài:
      - Cả 3 môn: *5* em.
      - Chỉ giỏi Toán và Vật lí: $7 - 5 = 2$ em.
      - Chỉ giỏi Toán và Hóa học: $6 - 5 = 1$ em.
      - Chỉ giỏi Vật lí và Hóa học: $8 - 5 = 3$ em.
      
      Từ đó, tính số học sinh chỉ giỏi duy nhất một môn:
      - Chỉ giỏi Toán: $20 - (2 + 1 + 5) = 12$ em.
      - Chỉ giỏi Vật lí: $18 - (2 + 3 + 5) = 8$ em.
      - Chỉ giỏi Hóa học: $17 - (1 + 3 + 5) = 8$ em.
    ]
    #step[
      #align(center)[
        #venn-3(
          nameA: "Toán", nameB: "Vật lí", nameC: "Hóa học",
          valA: "12", valB: "8", valC: "8",
          valAB: "2", valAC: "1", valBC: "3",
          valABC: "5"
        )
      ]
    ]
    #step[
      *2. Xét các khẳng định:*
      - *a) ĐÚNG.* Tổng số học sinh đạt điểm giỏi ít nhất một môn là tổng tất cả các con số trong 3 vòng tròn: $12 + 8 + 8 + 2 + 1 + 3 + 5 = 39$ em. Số học sinh không giỏi môn nào (trong 3 môn này) là $45 - 39 = 6$ em.
      - *b) SAI.* Số học sinh chỉ đạt điểm giỏi đúng một môn là tổng các vùng nằm độc lập ở viền ngoài: $12 + 8 + 8 = 28$ em (chứ không phải 25).
      - *c) ĐÚNG.* Số học sinh giỏi đúng hai môn bằng tổng các vùng giao đôi nhưng trừ phần lõi (giao ba): $2 + 1 + 3 = 6$ em.
      - *d) ĐÚNG.* Số học sinh giỏi ít nhất hai môn bao gồm người giỏi đúng hai môn và giỏi cả ba môn: $6 + 5 = 11$ em. Số học sinh chỉ giỏi đúng một môn là $28$ em. Vậy tỉ số là $11/28$.
    ]
    #reset-step()
  ]
)
