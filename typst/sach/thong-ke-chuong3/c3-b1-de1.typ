#import "_config.typ": *

#muc([Đề Luyện Tập Số 01])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "ngang", tn(
  [Cho mẫu số liệu ghép nhóm về thời gian tự học trong ngày (giờ) của học sinh lớp 12:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Thời gian], $[0; 2)$, $[2; 4)$, $[4; 6)$, $[6; 8)$,
        [Số học sinh], [5], [15], [12], [8]
      )
    ]
    Khoảng biến thiên $R$ của mẫu số liệu ghép nhóm này là bao nhiêu?],
  ([$R = 6$], [$R = 4$], True([$R = 8$]), [$R = 2$]),
  accent: c-book,
  loigiai: [
    #step[
      - Đầu mút trái của nhóm đầu tiên chứa số liệu:
        $u_1 = 0$
      - Đầu mút phải của nhóm cuối cùng chứa số liệu:
        $u_5 = 8$
    ]
    #step[
      - Khoảng biến thiên của mẫu số liệu ghép nhóm:
        $R = u_5 - u_1 = 8 - 0 = 8$
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Chiều cao (cm) của 40 cây non sau một tháng trồng được biểu diễn qua biểu đồ cột tần số ghép nhóm (Histogram) dưới đây:
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        // Trục tọa độ
        line((0, 0), (6.5, 0), stroke: 1pt + rgb("#5b21b6"), mark: (end: ">"))
        line((0, 0), (0, 4.2), stroke: 1pt + rgb("#5b21b6"), mark: (end: ">"))
        
        // Nhãn trục
        content((6.3, -0.35), text(size: 8pt)[$x$ (cm)])
        content((-0.6, 4.0), text(size: 8pt)[Tần số])
        
        // Màu sắc
        let fill-col = rgb("#a78bfa").transparentize(50%)
        let stroke-col = 1.2pt + rgb("#5b21b6")
        
        // Vẽ các cột của biểu đồ
        rect((1, 0), (2, 0.8), fill: fill-col, stroke: stroke-col)  // [10; 15): 4
        rect((2, 0), (3, 2.0), fill: fill-col, stroke: stroke-col)  // [15; 20): 10
        rect((3, 0), (4, 2.8), fill: fill-col, stroke: stroke-col)  // [20; 25): 14
        rect((4, 0), (5, 1.6), fill: fill-col, stroke: stroke-col)  // [25; 30): 8
        rect((5, 0), (6, 0.8), fill: fill-col, stroke: stroke-col)  // [30; 35): 4
        
        // Nhãn tần số
        content((1.5, 0.8 + 0.25), text(size: 8pt, weight: "bold")[4])
        content((2.5, 2.0 + 0.25), text(size: 8pt, weight: "bold")[10])
        content((3.5, 2.8 + 0.25), text(size: 8pt, weight: "bold")[14])
        content((4.5, 1.6 + 0.25), text(size: 8pt, weight: "bold")[8])
        content((5.5, 0.8 + 0.25), text(size: 8pt, weight: "bold")[4])
        
        // Nhãn trục hoành
        content((1.0, -0.25), text(size: 7.5pt)[10])
        content((2.0, -0.25), text(size: 7.5pt)[15])
        content((3.0, -0.25), text(size: 7.5pt)[20])
        content((4.0, -0.25), text(size: 7.5pt)[25])
        content((5.0, -0.25), text(size: 7.5pt)[30])
        content((6.0, -0.25), text(size: 7.5pt)[35])
        
        // Nhãn trục tung
        line((-0.05, 0.8), (0.05, 0.8))
        content((-0.3, 0.8), text(size: 7.5pt)[4])
        line((-0.05, 1.6), (0.05, 1.6))
        content((-0.3, 1.6), text(size: 7.5pt)[8])
        line((-0.05, 2.0), (0.05, 2.0))
        content((-0.3, 2.0), text(size: 7.5pt)[10])
        line((-0.05, 2.8), (0.05, 2.8))
        content((-0.3, 2.8), text(size: 7.5pt)[14])
      })
    ]
    Tứ phân vị thứ nhất $Q_1$ của mẫu số liệu ghép nhóm này thuộc nhóm nào dưới đây?],
  ([$[10; 15)$], True([$[15; 20)$]), [$[20; 25)$], [$[25; 30)$]),
  accent: c-book,
  loigiai: [
    #step[
      - Đọc số liệu từ biểu đồ cột:
        - Nhóm $[10; 15)$ có tần số $n_1 = 4$.
        - Nhóm $[15; 20)$ có tần số $n_2 = 10$.
        - Nhóm $[20; 25)$ có tần số $n_3 = 14$.
        - Nhóm $[25; 30)$ có tần số $n_4 = 8$.
        - Nhóm $[30; 35)$ có tần số $n_5 = 4$.
    ]
    #step[
      - Tổng cỡ mẫu:
        $n = 4 + 10 + 14 + 8 + 4 = 40$
      - Vị trí phân vị thứ nhất cần tìm:
        $n/4 = 40/4 = 10$
    ]
    #step[
      - Tính tần số tích lũy:
        - Nhóm 1: $C_1 = n_1 = 4 < 10$.
        - Nhóm 2: $C_2 = n_1 + n_2 = 4 + 10 = 14 >= 10$.
      - Do đó, nhóm đầu tiên có tần số tích lũy lớn hơn hoặc bằng 10 là nhóm thứ hai: $[15; 20)$.
      - Vậy nhóm chứa tứ phân vị thứ nhất $Q_1$ là $[15; 20)$.
    ]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Công thức xác định tứ phân vị thứ ba $Q_3$ của mẫu số liệu ghép nhóm $[u_j; u_(j+1))$ là gì?],
  (
    [$Q_3 = u_j + (frac(n/2 - C_(j-1), n_j)) dot.c (u_(j+1) - u_j)$],
    True([$Q_3 = u_j + (frac((3n)/4 - C_(j-1), n_j)) dot.c (u_(j+1) - u_j)$]),
    [$Q_3 = u_j + (frac(n/4 - C_(j-1), n_j)) dot.c (u_(j+1) - u_j)$],
    [$Q_3 = u_j + (frac((3n)/4 - C_j, n_(j-1))) dot.c (u_(j+1) - u_j)$],
  ),
  accent: c-book,
  loigiai: [
    #step[
      - Tứ phân vị thứ ba $Q_3$ là giá trị chia mẫu số liệu thành hai phần:
        - 75% số liệu nằm bên trái (nhỏ hơn).
        - 25% số liệu nằm bên phải (lớn hơn).
      - Do đó, vị trí phân vị tương ứng là $(3n)/4$.
    ]
    #step[
      - Công thức chính xác là phương án B với $C_(j-1)$ là tần số tích lũy của nhóm trước nhóm chứa $Q_3$, $n_j$ là tần số của nhóm chứa $Q_3$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho mẫu số liệu ghép nhóm về thời gian sử dụng Internet mỗi tuần của 40 học sinh:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Thời gian (giờ)], $[0; 5)$, $[5; 10)$, $[10; 15)$, $[15; 20)$, $[20; 25)$,
        [Số học sinh], [5], [12], [15], [6], [2]
      )
    ]
    Tứ phân vị thứ nhất $Q_1$ của mẫu số liệu này có giá trị là bao nhiêu (làm tròn đến hai chữ số thập phân)?],
  ([$6.25$], [$6.67$], True([$7.08$]), [$7.50$]),
  accent: c-book,
  loigiai: [
    #step[
      - Cỡ mẫu: $n = 40$. Ta tính vị trí: $n/4 = 10$.
      - Tần số tích lũy:
        - Nhóm 1: $C_1 = 5 < 10$.
        - Nhóm 2: $C_2 = 5 + 12 = 17 >= 10$.
      - Vậy nhóm chứa $Q_1$ là nhóm thứ hai: $[5; 10)$.
    ]
    #step[
      - Xác định các thông số:
        - Đầu mút trái nhóm chứa $Q_1$: $u_m = 5$.
        - Tần số nhóm chứa $Q_1$: $n_2 = 12$.
        - Tần số tích lũy nhóm trước: $C_1 = 5$.
        - Độ rộng nhóm: $h = 5$.
    ]
    #step[
      - Áp dụng công thức nội suy:
        $Q_1 = u_m + (frac(n/4 - C_1, n_2)) dot.c h$
        $Q_1 = 5 + (frac(10 - 5, 12)) dot.c 5 = 5 + 25/12 approx 7.08$ (giờ).
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Sử dụng cùng mẫu số liệu về thời gian sử dụng Internet ở câu trên, giá trị tứ phân vị thứ ba $Q_3$ của mẫu là bao nhiêu?],
  ([$13.33$], [$13.75$], [$14.00$], True([$14.33$])),
  accent: c-book,
  loigiai: [
    #step[
      - Cỡ mẫu: $n = 40$. Ta tính vị trí: $(3n)/4 = 30$.
      - Tần số tích lũy:
        - Nhóm 2: $C_2 = 17 < 30$.
        - Nhóm 3: $C_3 = 17 + 15 = 32 >= 30$.
      - Vậy nhóm chứa $Q_3$ là nhóm thứ ba: $[10; 15)$.
    ]
    #step[
      - Xác định các thông số:
        - Đầu mút trái: $u_j = 10$.
        - Tần số nhóm chứa $Q_3$: $n_3 = 15$.
        - Tần số tích lũy nhóm trước: $C_2 = 17$.
        - Độ rộng nhóm: $h = 5$.
    ]
    #step[
      - Áp dụng công thức nội suy:
        $Q_3 = u_j + (frac((3n)/4 - C_2, n_3)) dot.c h$
        $Q_3 = 10 + (frac(30 - 17, 15)) dot.c 5 = 10 + 13/3 approx 14.33$ (giờ).
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Dựa vào hai kết quả tính toán tứ phân vị ở hai câu trên, khoảng tứ phân vị $Delta_Q$ của thời gian sử dụng Internet là bao nhiêu?],
  ([$R = 25$], True([$Delta_Q = 7.25$]), [$Delta_Q = 6.25$], [$Delta_Q = 7.50$]),
  accent: c-book,
  loigiai: [
    #step[
      - Lấy kết quả từ các câu trước:
        - Tứ phân vị thứ nhất: $Q_1 = 5 + 25/12 = 85/12$.
        - Tứ phân vị thứ ba: $Q_3 = 10 + 13/3 = 172/12$.
    ]
    #step[
      - Tính khoảng tứ phân vị:
        $Delta_Q = Q_3 - Q_1 = 172/12 - 85/12 = 87/12 = 7.25$ (giờ).
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Ưu điểm chính của khoảng tứ phân vị $Delta_Q$ so với khoảng biến thiên $R$ trong đo độ phân tán dữ liệu là gì?],
  (
    [Dễ tính toán và không cần chia nhóm dữ liệu.],
    [Sử dụng toàn bộ các giá trị của dữ liệu mẫu.],
    True([Không bị ảnh hưởng bởi các giá trị bất thường (outliers).]),
    [Luôn có giá trị lớn hơn khoảng biến thiên.],
  ),
  accent: c-book,
  loigiai: [
    #step[
      - Khoảng tứ phân vị $Delta_Q = Q_3 - Q_1$ chỉ đo độ phân tán của 50% dữ liệu ở vùng trung tâm của mẫu số liệu.
    ]
    #step[
      - Do đó, các giá trị cực biên (quá lớn hoặc quá nhỏ - outliers) hoàn toàn không ảnh hưởng đến giá trị của $Delta_Q$. Đây là ưu điểm vượt trội so với khoảng biến thiên $R$ (phụ thuộc duy nhất vào hai đầu mút biên).
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho mẫu số liệu ghép nhóm về điểm kiểm tra của 40 học sinh nhưng có một số nhóm bị ẩn tần số $x, y$:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Điểm số], $[0; 20)$, $[20; 40)$, $[40; 60)$, $[60; 80)$, $[80; 100)$,
        [Số học sinh], [4], [$x$], [12], [$y$], [6]
      )
    ]
    Biết rằng mẫu số liệu này có tứ phân vị thứ nhất $Q_1 = 32$. Hãy xác định giá trị của tần số $x$.],
  ([$x = 8$], True([$x = 10$]), [$x = 12$], [$x = 6$]),
  accent: c-book,
  loigiai: [
    #step[
      - Tổng cỡ mẫu là $n = 40$. Ta tính vị trí của tứ phân vị thứ nhất $Q_1$:
        $n/4 = 40/4 = 10$.
      - Vì $Q_1 = 32 in [20; 40)$ nên nhóm chứa $Q_1$ là nhóm thứ hai $[20; 40)$.
      - Tần số tích lũy của nhóm trước đó: $C_1 = 4$.
    ]
    #step[
      - Áp dụng công thức tính tứ phân vị thứ nhất $Q_1$:
        $Q_1 = u_2 + (frac(n/4 - C_1, n_2)) dot.c h_2$
        $32 = 20 + (frac(10 - 4, x)) dot.c 20$
    ]
    #step[
      - Giải phương trình tìm $x$:
        $12 = frac(6, x) dot.c 20$
        $12 = frac(120, x) ==> x = 10$.
    ]
  ],
))
#q-wrap(dir: "doc", tn(
  [Sử dụng cùng mẫu số liệu điểm kiểm tra ở câu trên, biết thêm rằng hiệu của hai tần số ẩn là $x - y = 2$. Tính khoảng tứ phân vị $Delta_Q$ của mẫu số liệu này (làm tròn đến hai chữ số thập phân).],
  ([$32.00$], [$35.00$], True([$38.00$]), [$41.00$]),
  accent: c-book,
  loigiai: [
    #step[
      - Từ câu trước ta có $x = 10$. Do $x - y = 2 ==> y = 8$.
      - Bảng tần số hoàn chỉnh:
        - $[0; 20)$ có 4 học sinh (tích lũy: 4).
        - $[20; 40)$ có 10 học sinh (tích lũy: 14).
        - $[40; 60)$ có 12 học sinh (tích lũy: 26).
        - $[60; 80)$ có 8 học sinh (tích lũy: 34).
        - $[80; 100)$ có 6 học sinh (tích lũy: 40).
    ]
    #step[
      - Ta có $Q_1 = 32$. Bây giờ cần tính tứ phân vị thứ ba $Q_3$:
        - Vị trí: $(3n)/4 = 30$.
        - Tần số tích lũy nhóm 3 là $26 < 30$, nhóm 4 là $34 >= 30$.
        - Vậy nhóm chứa $Q_3$ là nhóm thứ tư $[60; 80)$.
        - Các thông số: $u_4 = 60, n_4 = 8, C_3 = 26, h_4 = 20$.
    ]
    #step[
      - Áp dụng công thức tính $Q_3$:
        $Q_3 = 60 + (frac(30 - 26, 8)) dot.c 20 = 60 + 4/8 dot.c 20 = 60 + 10 = 70$.
      - Tính khoảng tứ phân vị:
        $Delta_Q = Q_3 - Q_1 = 70 - 32 = 38$.
        Vậy khoảng tứ phân vị thu được là $38.00$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hai lớp 12A và 12B làm bài kiểm tra. Điểm kiểm tra lớp 12A có khoảng tứ phân vị $Delta_Q = 2.5$, lớp 12B có khoảng tứ phân vị $Delta_Q = 4.2$. Phát biểu nào sau đây đúng?],
  (
    [Điểm số của lớp 12B đồng đều hơn lớp 12A.],
    True([50% số học sinh ở giữa của lớp 12A có điểm số tập trung hơn lớp 12B.]),
    [Lớp 12B có điểm trung bình cao hơn lớp 12A.],
    [Khoảng biến thiên của lớp 12A chắc chắn nhỏ hơn lớp 12B.],
  ),
  accent: c-book,
  loigiai: [
    #step[
      - Khoảng tứ phân vị $Delta_Q$ phản ánh độ phân tán của 50% số liệu ở vùng trung tâm.
    ]
    #step[
      - Lớp 12A có $Delta_Q = 2.5$ nhỏ hơn lớp 12B ($4.2$), chứng tỏ điểm của 50% học sinh trung tâm lớp 12A có độ chênh lệch ít hơn, tức là tập trung sát nhau hơn lớp 12B.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho mẫu số liệu ghép nhóm có khoảng tứ phân vị là $Delta_Q$. Nếu ta cộng thêm vào mỗi số liệu thô trong mẫu một hằng số $c = 10$, thì khoảng tứ phân vị mới của mẫu sẽ như thế nào?],
  (
    [Tăng thêm 10 đơn vị.],
    [Giảm đi 10 đơn vị.],
    True([Không thay đổi.]),
    [Tăng lên gấp 10 lần.],
  ),
  accent: c-book,
  loigiai: [
    #step[
      - Khi cộng thêm một hằng số $c$ vào tất cả giá trị số liệu thô, các giá trị phân vị $Q_1$ và $Q_3$ đều dịch chuyển tịnh tiến lên một lượng $c$.
    ]
    #step[
      - Khi đó khoảng tứ phân vị mới:
        $Delta_Q' = (Q_3 + c) - (Q_1 + c) = Q_3 - Q_1 = Delta_Q$.
      - Vậy khoảng tứ phân vị hoàn toàn không thay đổi.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một nhóm nghiên cứu đo tuổi thọ của 100 bóng đèn LED và thu được bảng tần số ghép nhóm. Người ta tính được $Q_1 = 8000$ giờ và $Q_3 = 12000$ giờ. Khoảng tứ phân vị $Delta_Q = 4000$ giờ cho biết điều gì?],
  (
    [Tuổi thọ của tất cả bóng đèn nằm trong khoảng từ 8000 đến 12000 giờ.],
    [Có đúng 50 bóng đèn có tuổi thọ chính xác bằng 10000 giờ.],
    True([Có khoảng 50% số bóng đèn có tuổi thọ chênh lệch nhau không quá 4000 giờ ở vùng trung tâm.]),
    [Tuổi thọ trung bình của bóng đèn là 10000 giờ.],
  ),
  accent: c-book,
  loigiai: [
    #step[
      - Khoảng tứ phân vị $Delta_Q = Q_3 - Q_1 = 4000$ biểu diễn độ rộng của khoảng giá trị trung tâm chứa 50% cỡ mẫu.
    ]
    #step[
      - Nghĩa là khoảng 50% số bóng đèn ở giữa có tuổi thọ nằm trong khoảng từ $8000$ đến $12000$ giờ, tức là độ lệch tuổi thọ giữa chúng không vượt quá $4000$ giờ.
    ]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "doc", ds(
  [Để khảo sát cân nặng (kg) của học sinh khối 12, nhà trường thu được bảng số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (1.8fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Cân nặng (kg)], $[40; 45)$, $[45; 50)$, $[50; 55)$, $[55; 60)$, $[60; 65)$,
        [Số học sinh], [10], [22], [35], [25], [8]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Cỡ mẫu khảo sát của khối 12 là $n = 100$.]),
    True([Khoảng biến thiên của mẫu số liệu ghép nhóm này là $R = 25$ kg.]),
    [Nhóm chứa tứ phân vị thứ nhất $Q_1$ là nhóm $[40; 45)$.],
    True([Giá trị của tứ phân vị thứ ba $Q_3$ là $56.6$ kg.]),
  ),
  accent: c-book,
  loigiai: [
    - a) *Đúng*: Cỡ mẫu $n = 10 + 22 + 35 + 25 + 8 = 100$.
    - b) *Đúng*: Nhóm đầu chứa dữ liệu là $[40; 45)$ (mút trái $40$), nhóm cuối chứa dữ liệu là $[60; 65)$ (mút phải $65$). Khoảng biến thiên $R = 65 - 40 = 25$ kg.
    - c) *Sai*: Vì $n/4 = 25$.
      - Tần số tích lũy nhóm 1: $C_1 = 10 < 25$.
      - Tần số tích lũy nhóm 2: $C_2 = 10 + 22 = 32 >= 25$.
      - Do đó nhóm chứa $Q_1$ là nhóm thứ hai $[45; 50)$.
    - d) *Đúng*: Ta có $(3n)/4 = 75$.
      - Tần số tích lũy đến nhóm 3 là $C_3 = 67 < 75$.
      - Tích lũy nhóm 4 là $C_4 = 67 + 25 = 92 >= 75 ==> $ nhóm chứa $Q_3$ là $[55; 60)$.
      - Áp dụng công thức: $Q_3 = 55 + (frac(75 - 67, 25)) dot.c 5 = 55 + 8/5 = 56.6$ kg.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho mẫu số liệu ghép nhóm về thời gian chạy cự ly 100m của các vận động viên (giây):
    #align(center)[
      #table(
        columns: (1.8fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Thời gian (giây)], $[10.0; 10.5)$, $[10.5; 11.0)$, $[11.0; 11.5)$, $[11.5; 12.0)$,
        [Số vận động viên], [3], [12], [20], [5]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    [Khoảng biến thiên của mẫu số liệu là $R = 1.5$ giây.],
    True([Nhóm chứa tứ phân vị thứ nhất $Q_1$ là nhóm $[10.5; 11.0)$ và chứa tứ phân vị thứ ba $Q_3$ là nhóm $[11.0; 11.5)$.]),
    True([Tứ phân vị thứ nhất của mẫu số liệu là $Q_1 = 10.79$ giây (làm tròn đến hai chữ số thập phân).]),
    True([Khoảng tứ phân vị của mẫu số liệu là $Delta_Q = 0.58$ giây (làm tròn đến hai chữ số thập phân).]),
  ),
  accent: c-book,
  loigiai: [
    - a) *Sai*: Khoảng biến thiên $R = 12.0 - 10.0 = 2.0$ giây.
    - b) *Đúng*: Cỡ mẫu $n = 3 + 12 + 20 + 5 = 40$.
      - Vị trí $Q_1$: $n/4 = 10 ==> $ thuộc nhóm thứ hai $[10.5; 11.0)$ (vì tích lũy nhóm 1 là 3, nhóm 2 là 15).
      - Vị trí $Q_3$: $(3n)/4 = 30 ==> $ thuộc nhóm thứ ba $[11.0; 11.5)$ (vì tích lũy nhóm 2 là 15, nhóm 3 là 35).
    - c) *Đúng*: Ta tính $Q_1 = 10.5 + (frac(10 - 3, 12)) dot.c 0.5 = 10.5 + 7/24 approx 10.79$ giây.
    - d) *Đúng*: Ta tính $Q_3 = 11.0 + (frac(30 - 15, 20)) dot.c 0.5 = 11.0 + 15/40 = 11.375$ giây.
      - Khoảng tứ phân vị: $Delta_Q = Q_3 - Q_1 = 11.375 - 10.7917 = 0.5833 approx 0.58$ giây.
  ],
))

#q-wrap(dir: "doc", ds(
  [Khảo sát doanh thu bán hàng hàng ngày (triệu đồng) của một cửa hàng trong 30 ngày. Số liệu được ghép nhóm với các tần số ẩn $a, b$:
    #align(center)[
      #table(
        columns: (2.0fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Doanh thu], $[5; 7)$, $[7; 9)$, $[9; 11)$, $[11; 13)$, $[13; 15)$,
        [Số ngày], [2], [$a$], [15], [$b$], [1]
      )
    ]
    Biết rằng tứ phân vị thứ nhất của mẫu số liệu là $Q_1 = 8.57$ triệu đồng. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Số ngày doanh thu trong nhóm $[7; 9)$ là $a = 7$.]),
    True([Số ngày doanh thu trong nhóm $[11; 13)$ là $b = 5$.]),
    [Nếu ta thay đổi giá trị tần số ẩn $b$ từ $5$ thành $6$ (và giảm nhóm $[9; 11)$ xuống 14 ngày để giữ nguyên cỡ mẫu), tứ phân vị thứ nhất $Q_1$ sẽ thay đổi.],
    True([Khoảng tứ phân vị của mẫu số liệu ban đầu là $Delta_Q = 2.23$ triệu đồng (làm tròn đến hai chữ số thập phân).]),
  ),
  accent: c-book,
  loigiai: [
    - a) *Đúng*:
      - Cỡ mẫu $n = 30$. Vị trí của $Q_1$ là $n/4 = 7.5$.
      - Vì $Q_1 = 8.57 in [7; 9)$ nên nhóm chứa $Q_1$ là $[7; 9)$.
      - Áp dụng công thức: $Q_1 = 7 + (frac(7.5 - 2, a)) dot.c 2 = 8.57 ==> frac(5.5, a) dot.c 2 = 1.57$
      - Suy ra $frac(11, a) approx 1.57 ==> a = 7$ ngày.
    - b) *Đúng*:
      - Tổng số ngày là $30 ==> 2 + a + 15 + b + 1 = 30$
      - Thay $a = 7$ ta được: $25 + b = 30 ==> b = 5$ ngày.
    - c) *Sai*:
      - Tứ phân vị thứ nhất $Q_1$ chỉ phụ thuộc vào cơ cấu tích lũy của các nhóm từ đầu đến nhóm chứa nó (nhóm 1 và nhóm 2).
      - Nhóm $[11; 13)$ ở phía sau nên sự thay đổi tần số $b$ (khi nhóm $[9; 11)$ giảm tương ứng) không làm thay đổi tần số tích lũy của nhóm 1 và nhóm 2. Do đó $Q_1$ giữ nguyên.
    - d) *Đúng*:
      - Ta tìm $Q_3$: Vị trí $(3n)/4 = 22.5$.
      - Tích lũy nhóm 2 là $9$, tích lũy nhóm 3 là $24 >= 22.5 ==> $ nhóm chứa $Q_3$ là $[9; 11)$.
      - Tính $Q_3 = 9 + (frac(22.5 - 9, 15)) dot.c 2 = 9 + 1.8 = 10.8$ triệu đồng.
      - Khoảng tứ phân vị: $Delta_Q = Q_3 - Q_1 = 10.8 - 8.57 = 2.23$ triệu đồng.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho mẫu số liệu ghép nhóm không liên tục về lượng nước mưa đo được (mm) tại một trạm khí tượng:
    #align(center)[
      #table(
        columns: (1.8fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Lượng mưa], $[10; 14]$, $[15; 19]$, $[20; 24]$, $[25; 29]$,
        [Số ngày], [5], [10], [12], [3]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Để tính các tứ phân vị, ta phải hiệu chỉnh mẫu số liệu về dạng ghép nhóm liên tục là: $[9.5; 14.5), [14.5; 19.5), [19.5; 24.5), [24.5; 29.5)$.]),
    True([Cỡ mẫu sau khi hiệu chỉnh liên tục là $n = 30$.]),
    True([Tứ phân vị thứ nhất $Q_1 = 15.75$ mm.]),
    [Khoảng tứ phân vị của mẫu số liệu sau hiệu chỉnh là $Delta_Q = 5.0$ mm.],
  ),
  accent: c-book,
  loigiai: [
    - a) *Đúng*: Do khoảng hở giữa các nhóm kế tiếp là $15 - 14 = 1$, ta chia đôi khoảng hở này được $0.5$. Do đó hiệu chỉnh giảm mút trái đi $0.5$ và tăng mút phải lên $0.5$.
    - b) *Đúng*: Cỡ mẫu không đổi $n = 5 + 10 + 12 + 3 = 30$.
    - c) *Đúng*: Ta tính vị trí $n/4 = 7.5$.
      - Tích lũy nhóm 1 là $5$, nhóm 2 là $15 >= 7.5 ==> $ nhóm chứa $Q_1$ là $[14.5; 19.5)$.
      - $Q_1 = 14.5 + (frac(7.5 - 5, 10)) dot.c 5 = 14.5 + 1.25 = 15.75$ mm.
    - d) *Sai*: Vị trí $Q_3$: $(3n)/4 = 22.5$.
      - Tích lũy nhóm 2 là $15$, nhóm 3 là $27 >= 22.5 ==> $ nhóm chứa $Q_3$ là $[19.5; 24.5)$.
      - $Q_3 = 19.5 + (frac(22.5 - 15, 12)) dot.c 5 = 19.5 + 3.125 = 22.625$ mm.
      - Khoảng tứ phân vị thực tế: $Delta_Q = Q_3 - Q_1 = 22.625 - 15.75 = 6.875$ mm.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "ngang", tln(
  [Khảo sát thời gian xem tivi trong một ngày của 50 trẻ em thu được bảng số liệu ghép nhóm với nhóm đầu tiên chứa dữ liệu là $[0; 1)$ và nhóm cuối cùng chứa dữ liệu là $[4; 5)$ (giờ). Tìm khoảng biến thiên $R$ của mẫu số liệu này (theo đơn vị giờ).],
  [$5$],
  accent: c-book,
  loigiai: [
    #step[
      - Mẫu số liệu ghép nhóm có nhóm đầu tiên chứa dữ liệu là $[0; 1)$, suy ra đầu mút trái nhỏ nhất:
        $u_1 = 0$
    ]
    #step[
      - Nhóm cuối cùng chứa dữ liệu là $[4; 5)$, suy ra đầu mút phải lớn nhất:
        $u_6 = 5$
    ]
    #step[
      - Khoảng biến thiên của mẫu số liệu ghép nhóm:
        $R = u_6 - u_1 = 5 - 0 = 5$ (giờ).
    ]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho mẫu số liệu ghép nhóm về số tiền điện tiêu thụ hàng tháng của các hộ gia đình:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Số tiền (trăm nghìn)], $[0; 2)$, $[2; 4)$, $[4; 6)$, $[6; 8)$,
        [Số hộ gia đình], [8], [15], [20], [7]
      )
    ]
    Tính tứ phân vị thứ nhất $Q_1$ của mẫu số liệu này (làm tròn kết quả đến hai chữ số thập phân).],
  [$2.6$],
  accent: c-book,
  loigiai: [
    #step[
      - Cỡ mẫu: $n = 8 + 15 + 20 + 7 = 50$.
      - Tính vị trí: $n/4 = 12.5$.
      - Tần số tích lũy nhóm 1: $C_1 = 8 < 12.5$.
      - Tần số tích lũy nhóm 2: $C_2 = 8 + 15 = 23 >= 12.5$.
      - Nhóm chứa $Q_1$ là nhóm thứ hai $[2; 4)$.
    ]
    #step[
      - Các thông số: $u_m = 2, n_2 = 15, C_1 = 8, h = 2$.
    ]
    #step[
      - Áp dụng công thức nội suy:
        $Q_1 = 2 + (frac(12.5 - 8, 15)) dot.c 2 = 2 + 0.6 = 2.6$.
    ]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Sử dụng cùng mẫu số liệu về tiền điện tiêu thụ ở câu trên, tính giá trị tứ phân vị thứ ba $Q_3$ của mẫu số liệu (làm tròn kết quả đến hai chữ số thập phân).],
  [$5.45$],
  accent: c-book,
  loigiai: [
    #step[
      - Cỡ mẫu: $n = 50$. Ta có vị trí: $(3n)/4 = 37.5$.
      - Tần số tích lũy:
        - Đến nhóm 2: $C_2 = 23 < 37.5$.
        - Đến nhóm 3: $C_3 = 23 + 20 = 43 >= 37.5$.
      - Nhóm chứa $Q_3$ là nhóm thứ ba $[4; 6)$.
    ]
    #step[
      - Các thông số: $u_j = 4, n_3 = 20, C_2 = 23, h = 2$.
    ]
    #step[
      - Áp dụng công thức nội suy:
        $Q_3 = 4 + (frac(37.5 - 23, 20)) dot.c 2 = 4 + 1.45 = 5.45$.
    ]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Dựa trên kết quả tính toán $Q_1$ và $Q_3$ ở hai câu trên, tìm khoảng tứ phân vị $Delta_Q$ của mẫu số liệu tiêu thụ tiền điện (làm tròn kết quả đến hai chữ số thập phân).],
  [$2.85$],
  accent: c-book,
  loigiai: [
    #step[
      - Sử dụng các giá trị đã tính:
        - Tứ phân vị thứ nhất: $Q_1 = 2.6$.
        - Tứ phân vị thứ ba: $Q_3 = 5.45$.
    ]
    #step[
      - Khoảng tứ phân vị của mẫu số liệu:
        $Delta_Q = Q_3 - Q_1 = 5.45 - 2.6 = 2.85$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho mẫu số liệu ghép nhóm về năng suất lúa (tấn/ha) của 80 hợp tác xã:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Năng suất], $[4.0; 4.5)$, $[4.5; 5.0)$, $[5.0; 5.5)$, $[5.5; 6.0)$, $[6.0; 6.5)$,
        [Số HTX], [6], [14], [30], [22], [8]
      )
    ]
    Tìm khoảng tứ phân vị $Delta_Q$ của mẫu số liệu này (làm tròn kết quả đến hai chữ số thập phân).],
  [$0.73$],
  accent: c-book,
  loigiai: [
    #step[
      - Cỡ mẫu $n = 80$.
      - Tìm $Q_1$: vị trí $n/4 = 20$.
        - Tích lũy nhóm 2 là $6 + 14 = 20 >= 20 ==> $ nhóm chứa $Q_1$ là $[4.5; 5.0)$.
        - Tính $Q_1 = 4.5 + (frac(20 - 6, 14)) dot.c 0.5 = 5.0$.
    ]
    #step[
      - Tìm $Q_3$: vị trí $(3n)/4 = 60$.
        - Tích lũy nhóm 3 là $20 + 30 = 50 < 60$.
        - Tích lũy nhóm 4 là $50 + 22 = 72 >= 60 ==> $ nhóm chứa $Q_3$ là $[5.5; 6.0)$.
        - Tính $Q_3 = 5.5 + (frac(60 - 50, 22)) dot.c 0.5 = 5.5 + frac(5, 22) approx 5.73$.
    ]
    #step[
      - Tính khoảng tứ phân vị:
        $Delta_Q = Q_3 - Q_1 = 5.7273 - 5.0 = 0.7273 approx 0.73$ (tấn/ha).
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho mẫu số liệu ghép nhóm không liên tục về thời gian đàm thoại của khách hàng (phút):
    #align(center)[
      #table(
        columns: (1.8fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Thời gian], $[1; 5]$, $[6; 10]$, $[11; 15]$,
        [Số khách hàng], [12], [28], [10]
      )
    ]
    Tính khoảng tứ phân vị $Delta_Q$ của mẫu số liệu sau khi đã được hiệu chỉnh liên tục (làm tròn kết quả đến hai chữ số thập phân).],
  [$4.46$],
  accent: c-book,
  loigiai: [
    #step[
      - Hiệu chỉnh liên tục các nhóm:
        - Nhóm 1: $[0.5; 5.5)$ có 12 khách hàng.
        - Nhóm 2: $[5.5; 10.5)$ có 28 khách hàng (tích lũy: 40).
        - Nhóm 3: $[10.5; 15.5)$ có 10 khách hàng (tích lũy: 50).
      - Cỡ mẫu $n = 50$.
    ]
    #step[
      - Tìm $Q_1$: vị trí $n/4 = 12.5$.
        - Tích lũy nhóm 1: $12 < 12.5$, nhóm 2: $40 >= 12.5 ==> $ nhóm chứa $Q_1$ là $[5.5; 10.5)$.
        - Tính $Q_1 = 5.5 + (frac(12.5 - 12, 28)) dot.c 5 approx 5.59$ phút.
    ]
    #step[
      - Tìm $Q_3$: vị trí $(3n)/4 = 37.5$.
        - Tích lũy nhóm 1: $12 < 37.5$, nhóm 2: $40 >= 37.5 ==> $ nhóm chứa $Q_3$ là $[5.5; 10.5)$.
        - Tính $Q_3 = 5.5 + (frac(37.5 - 12, 28)) dot.c 5 approx 10.05$ phút.
      - Tính khoảng tứ phân vị:
        $Delta_Q = Q_3 - Q_1 = 10.0536 - 5.5893 = 4.4643 approx 4.46$ phút.
    ]
  ],
))
