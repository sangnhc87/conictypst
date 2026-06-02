#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 03 - CHUYÊN ĐỀ ĐIỂM CÓ TỌA ĐỘ NGUYÊN]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Có bao nhiêu điểm có tọa độ nguyên thuộc đồ thị hàm số $y = (x + 2)/(x - 1)$?],
  (
    [$2$],
    [$3$],
    True([$4$]),
    [$0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Điều kiện xác định: $x != 1$.]
    #step[Viết lại hàm số: $y = 1 + frac(3, x - 1)$ (với $x in ZZ$).]
    #step[Để $y$ nhận giá trị nguyên thì $x - 1$ phải là ước nguyên của $3$.]
    #step[Ước nguyên của $3$ là $U(3) = \{+-1; +-3\}$. Ta có bảng giá trị:]
    #step[
      - $x - 1 = -3 => x = -2 => y = 0$ (thỏa mãn).
      - $x - 1 = -1 => x = 0 => y = -2$ (thỏa mãn).
      - $x - 1 = 1 => x = 2 => y = 4$ (thỏa mãn).
      - $x - 1 = 3 => x = 4 => y = 2$ (thỏa mãn).
    ]
    #step[Vậy có đúng 4 điểm có tọa độ nguyên.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm số điểm có tọa độ nguyên thuộc đồ thị hàm số $y = (2x + 5)/(x + 1)$.],
  (
    [$2$],
    [$3$],
    True([$4$]),
    [$6$],
  ),
  accent: c-book,
  loigiai: [
    #step[Điều kiện: $x != -1$.]
    #step[Chia tử cho mẫu: $y = frac(2(x + 1) + 3, x + 1) = 2 + frac(3, x + 1)$.]
    #step[Với $x$ nguyên, $y$ nguyên khi và chỉ khi $x + 1$ là ước nguyên của $3$.]
    #step[Do $U(3) = \{+-1; +-3\}$ nên có đúng 4 giá trị của $x$ nguyên cho tọa độ nguyên tương ứng. Vậy có 4 điểm nguyên.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm số điểm có tọa độ nguyên thuộc đồ thị hàm số $y = (x - 3)/(x - 2)$.],
  (
    True([$2$]),
    [$4$],
    [$0$],
    [$1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Điều kiện: $x != 2$.]
    #step[Chia tử cho mẫu: $y = 1 - frac(1, x - 2)$.]
    #step[Với $x$ nguyên, $y$ nguyên khi và chỉ khi $x - 2$ là ước nguyên của $1$.]
    #step[Các ước của $1$ là $U(1) = \{+-1\}$. Do đó có đúng 2 điểm có tọa độ nguyên.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm số điểm có tọa độ nguyên thuộc đồ thị hàm số $y = (x^2 + 2x + 3)/(x + 1)$.],
  (
    [$2$],
    True([$4$]),
    [$0$],
    [Vô số],
  ),
  accent: c-book,
  loigiai: [
    #step[Điều kiện: $x != -1$.]
    #step[Chia tử cho mẫu: $y = x + 1 + frac(2, x + 1)$.]
    #step[Với $x$ nguyên, $y$ nguyên khi và chỉ khi $x + 1$ là ước nguyên của $2$.]
    #step[Tập các ước nguyên của $2$ là $U(2) = \{+-1; +-2\}$. Do đó có đúng 4 điểm thỏa mãn.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị hàm số nào sau đây không có bất kỳ điểm nào có tọa độ nguyên?],
  (
    [$y = (2x + 1)/(2x - 1)$],
    [$y = (x^2 + 1)/x$],
    True([$y = (2x + 1)/(2x - 2)$]),
    [$y = (x + 3)/(x - 1)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Xét hàm số $y = (2x + 1)/(2x - 2) = frac(2x - 2 + 3, 2(x - 1)) = 1 + frac(3, 2(x - 1))$.]
    #step[Để $y$ nguyên thì $2(x - 1)$ phải là ước nguyên của $3$.]
    #step[Nhưng $2(x - 1)$ luôn là số chẵn với mọi $x$ nguyên, trong khi các ước nguyên của $3$ là $\{+-1; +-3\}$ đều là số lẻ.]
    #step[Do đó không tồn tại $x$ nguyên để $2(x - 1)$ là ước của $3$. Vậy đồ thị hàm số này có đúng $0$ điểm nguyên.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm số điểm có tọa độ nguyên thuộc đồ thị hàm số $y = (x^2 - 3x + 5)/(x - 2)$.],
  (
    [$2$],
    True([$4$]),
    [$6$],
    [$0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Điều kiện: $x != 2$.]
    #step[Phân tích tử số: $x^2 - 3x + 5 = (x - 1)(x - 2) + 3$.]
    #step[Chia tử cho mẫu ta được: $y = x - 1 + frac(3, x - 2)$.]
    #step[Để $x, y in ZZ$ thì $x - 2$ phải là ước nguyên của $3$, gồm $\{+-1; +-3\}$.]
    #step[Vậy có đúng 4 điểm thỏa mãn.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị hàm số $y = (2x - 3)/(x - 1)$ có bao nhiêu điểm nguyên?],
  (
    True([$2$]),
    [$4$],
    [$0$],
    [$1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Điều kiện: $x != 1$.]
    #step[Chia tử cho mẫu: $y = 2 - frac(1, x - 1)$.]
    #step[Để tọa độ điểm nguyên thì $x - 1$ phải là ước nguyên của $1$, gồm $\{+-1\}$.]
    #step[Vậy đồ thị có đúng 2 điểm nguyên.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tổng hoành độ các điểm có tọa độ nguyên thuộc đồ thị hàm số $y = (x + 3)/(x + 1)$.],
  (
    [$0$],
    [$-2$],
    True([$-4$]),
    [$4$],
  ),
  accent: c-book,
  loigiai: [
    #step[Viết lại hàm số: $y = 1 + frac(2, x + 1)$ (với $x != -1$).]
    #step[Để $y$ nguyên thì $x + 1$ phải là ước nguyên của $2$, gồm $\{+-1; +-2\}$.]
    #step[Giải các trường hợp:
      - $x + 1 = -2 => x = -3$.
      - $x + 1 = -1 => x = -2$.
      - $x + 1 = 1 => x = 0$.
      - $x + 1 = 2 => x = 1$.
    ]
    #step[Tổng hoành độ là: $-3 - 2 + 0 + 1 = -4$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tổng tung độ các điểm có tọa độ nguyên thuộc đồ thị hàm số $y = (x + 2)/(x - 2)$.],
  (
    [$0$],
    [$4$],
    True([$6$]),
    [$8$],
  ),
  accent: c-book,
  loigiai: [
    #step[Viết lại hàm số: $y = 1 + frac(4, x - 2)$ (với $x != 2$).]
    #step[Các ước nguyên của $4$ gồm: $\{+-1; +-2; +-4\}$.]
    #step[Các giá trị tung độ tương ứng:
      - $x - 2 = -4 => y = 1 - 1 = 0$.
      - $x - 2 = -2 => y = 1 - 2 = -1$.
      - $x - 2 = -1 => y = 1 - 4 = -3$.
      - $x - 2 = 1 => y = 1 + 4 = 5$.
      - $x - 2 = 2 => y = 1 + 2 = 3$.
      - $x - 2 = 4 => y = 1 + 1 = 2$.
    ]
    #step[Tổng các tung độ là: $0 - 1 - 3 + 5 + 3 + 2 = 6$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Các điểm có tọa độ nguyên của đồ thị hàm số $y = (2x^2 + x - 2)/(x + 1)$ là:],
  (
    [$(0; -2)$],
    [$(-2; -4)$],
    True([$(0; -2)$ và $(-2; -4)$]),
    [Không có điểm nguyên nào],
  ),
  accent: c-book,
  loigiai: [
    #step[Điều kiện: $x != -1$.]
    #step[Chia tử cho mẫu: $y = 2x - 1 - frac(1, x + 1)$.]
    #step[Để tọa độ điểm nguyên thì $x + 1$ phải là ước nguyên của $1$, gồm $\{+-1\}$.]
    #step[Với $x + 1 = 1 => x = 0 => y = -2 => (0; -2)$.]
    #step[Với $x + 1 = -1 => x = -2 => y = -4 => (-2; -4)$.]
    #step[Vậy đồ thị có hai điểm nguyên là $(0; -2)$ và $(-2; -4)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Có bao nhiêu điểm có tọa độ nguyên thuộc đồ thị hàm số $y = x^3 - 3x^2 + 2x$ với hoành độ $x$ thuộc đoạn $[-2; 2]$?],
  (
    [$3$],
    [$4$],
    True([$5$]),
    [$0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Với hàm số đa thức có các hệ số nguyên, mọi hoành độ $x$ nguyên đều cho tung độ $y$ tương ứng nguyên.]
    #step[Các giá trị nguyên của $x$ thuộc đoạn $[-2; 2]$ là $\{-2; -1; 0; 1; 2\}$.]
    #step[Tương ứng ta có 5 điểm có tọa độ nguyên.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm số điểm có tọa độ nguyên thuộc đồ thị hàm số $y = (x^2 + x + 1)/(x - 1)$.],
  (
    [$2$],
    True([$4$]),
    [$6$],
    [$0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Điều kiện: $x != 1$.]
    #step[Chia tử cho mẫu: $y = x + 2 + frac(3, x - 1)$.]
    #step[Để điểm có tọa độ nguyên thì $x - 1$ phải là ước nguyên của $3$, gồm $\{+-1; +-3\}$.]
    #step[Tương ứng ta tìm được 4 điểm nguyên.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng - Sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = (2x + 3)/(x - 1)$ có đồ thị $(C)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    [Đồ thị $(C)$ cắt đường tiệm cận đứng tại một điểm có tọa độ nguyên.],
    True([Đồ thị $(C)$ có đúng 4 điểm có tọa độ nguyên.]),
    True([Tổng tung độ của tất cả các điểm có tọa độ nguyên đó bằng $8$.]),
    True([Tích hoành độ của tất cả các điểm có tọa độ nguyên đó bằng $0$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Sai. Đồ thị không bao giờ cắt các tiệm cận của nó.
    - b) Đúng. Ta có $y = 2 + 5/(x - 1)$. Các điểm nguyên ứng với $x - 1 in U(5) = \{+-1; +-5\}$, có đúng 4 giá trị.
    - c) Đúng. Các tung độ là $y in \{2-1; 2-5; 2+5; 2+1\} = \{1; -3; 7; 3\}$. Tổng bằng $1 - 3 + 7 + 3 = 8$.
    - d) Đúng. Các hoành độ tương ứng là $x in \{-4; 0; 2; 6\}$. Tích hoành độ bằng $0$ do có thừa số $0$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = (x^2 + x - 1)/(x - 2)$ có đồ thị $(C)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Hàm số viết được dưới dạng: $y = x + 3 + frac(5, x - 2)$.]),
    True([Đồ thị có tiệm cận đứng $x = 2$ và tiệm cận xiên $y = x + 3$.]),
    True([Đồ thị hàm số $(C)$ có đúng 4 điểm có tọa độ nguyên.]),
    [Không có điểm nguyên nào của đồ thị $(C)$ nằm ở góc phần tư thứ nhất.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Thực hiện phép chia đa thức tử cho mẫu.
    - b) Đúng. Dựa vào phép chia ở ý a, tiệm cận xiên là phần đa thức bậc nhất $y = x + 3$.
    - c) Đúng. Mẫu số $x - 2$ phải là ước của $5$, có 4 ước.
    - d) Sai. Với $x - 2 = 1 => x = 3 => y = 11$, điểm $(3; 11)$ có tọa độ dương nên nằm ở góc phần tư thứ nhất.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = (2x + 1)/(2x - 2)$ có đồ thị $(C)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Tập xác định của hàm số là $D = RR without \\{1\\}$.]),
    True([Đồ thị hàm số có tiệm cận ngang là đường thẳng $y = 1$.]),
    True([Số điểm có tọa độ nguyên của đồ thị $(C)$ là $0$.]),
    True([Giao điểm của hai đường tiệm cận có tọa độ là $I(1; 1)$, đây là một điểm có tọa độ nguyên.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Mẫu số $2x - 2 != 0 <=> x != 1$.
    - b) Đúng. Giới hạn khi $x -> oo$ bằng $1$.
    - c) Đúng. Như đã chứng minh ở Phần I, phương trình ước số $2(x-1) in U(3)$ không có nghiệm nguyên chẵn.
    - d) Đúng. Giao điểm tiệm cận là $I(1; 1)$, tọa độ là các số nguyên.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = x^3 - 3x + m$ (với $m$ là số nguyên). Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Với mọi giá trị $x$ nguyên, tung độ tương ứng $y$ luôn là một số nguyên.]),
    [Nếu $m = 1$, đồ thị hàm số cắt các trục tọa độ tại đúng 3 điểm có tọa độ nguyên.],
    True([Nếu $m = 2$, đồ thị cắt trục hoành tại đúng 2 điểm có tọa độ nguyên.]),
    True([Điểm uốn của đồ thị luôn có tọa độ nguyên với mọi số nguyên $m$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Vì các hệ số của đa thức đều nguyên.
    - b) Sai. Giao Oy là $(0; 1)$ nguyên. Giao Ox giải phương trình $x^3 - 3x + 1 = 0$ không có nghiệm nguyên.
    - c) Đúng. Với $m = 2$, giải phương trình hoành độ giao điểm: $x^3 - 3x + 2 = 0 <=> (x - 1)^2(x + 2) = 0$. Có 2 nghiệm nguyên là $x = 1, x = -2$. Các giao điểm tương ứng $(1; 0)$ và $(-2; 0)$ đều là điểm nguyên.
    - d) Đúng. Đạo hàm cấp 2: $y'' = 6x = 0 <=> x = 0 => y_I = m$. Điểm uốn $I(0; m)$ luôn có tọa độ nguyên với mọi $m$ nguyên.
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Tìm số điểm có tọa độ nguyên của đồ thị hàm số $y = (3x + 7)/(x - 1)$.],
  [$8$],
  accent: c-book,
  loigiai: [
    #step[Điều kiện: $x != 1$.]
    #step[Chia tử cho mẫu: $y = 3 + frac(10, x - 1)$.]
    #step[Để $y$ nguyên thì $x - 1$ phải là ước nguyên của $10$.]
    #step[Tập các ước nguyên của $10$ là $U(10) = \{+-1; +-2; +-5; +-10\}$, có tất cả 8 phần tử.]
    #step[Tương ứng ta tìm được đúng 8 điểm có tọa độ nguyên.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y = (x^2 - x + 2)/(x - 1)$. Tìm tổng hoành độ của tất cả các điểm có tọa độ nguyên của đồ thị hàm số.],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Điều kiện: $x != 1$.]
    #step[Chia tử cho mẫu: $y = x + frac(2, x - 1)$.]
    #step[Để tọa độ điểm nguyên thì $x - 1$ phải là ước của $2$.]
    #step[Các ước của $2$ là $U(2) = \{+-1; +-2\}$. Giải các hoành độ tương ứng:
      - $x - 1 = -2 => x = -1$.
      - $x - 1 = -1 => x = 0$.
      - $x - 1 = 1 => x = 2$.
      - $x - 1 = 2 => x = 3$.
    ]
    #step[Tổng hoành độ: $-1 + 0 + 2 + 3 = 4$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Có bao nhiêu điểm có tọa độ nguyên thuộc đồ thị hàm số $y = (3x - 1)/(2x + 1)$?],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Điều kiện: $x != -1/2$.]
    #step[Ta nhân hai vế với 2 để dễ biện luận ước: $2y = frac(6x - 2, 2x + 1) = 3 - frac(5, 2x + 1)$.]
    #step[Để $y$ nguyên thì $2y$ phải nguyên, dẫn tới $2x + 1$ phải là ước của $5$.]
    #step[Tập các ước của $5$ là $U(5) = \{+-1; +-5\}$. Giải các trường hợp:
      - $2x + 1 = -5 => x = -3 => y = 2$ (thỏa mãn).
      - $2x + 1 = -1 => x = -1 => y = 4$ (thỏa mãn).
      - $2x + 1 = 1 => x = 0 => y = -1$ (thỏa mãn).
      - $2x + 1 = 5 => x = 2 => y = 1$ (thỏa mãn).
    ]
    #step[Cả 4 giá trị $x$ nguyên đều cho tung độ $y$ nguyên. Vậy có đúng 4 điểm nguyên.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm hoành độ lớn nhất của điểm có tọa độ nguyên thuộc đồ thị hàm số $y = (x^2 + 3x - 1)/(x - 2)$.],
  [$11$],
  accent: c-book,
  loigiai: [
    #step[Điều kiện: $x != 2$.]
    #step[Chia tử cho mẫu: $y = x + 5 + frac(9, x - 2)$.]
    #step[Để $y$ nguyên thì $x - 2$ phải là ước nguyên của $9$.]
    #step[Ước lớn nhất của $9$ là $9$. Do đó để hoành độ $x$ lớn nhất thì $x - 2$ phải lớn nhất.]
    #step[Đặt $x - 2 = 9 <=> x = 11$.]
    #step[Tung độ tương ứng khi đó là $y = 11 + 5 + 1 = 17$ (nguyên). Vậy hoành độ lớn nhất là $11$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho đồ thị $(C): y = (x^2 + 4x - 2)/(x + 1)$. Gọi $S$ là tổng các hoành độ của các điểm có tọa độ nguyên thuộc $(C)$. Tính $S$.],
  [$-4$],
  accent: c-book,
  loigiai: [
    #step[Điều kiện: $x != -1$.]
    #step[Chia tử cho mẫu: $y = x + 3 - frac(5, x + 1)$.]
    #step[Điểm nguyên khi $x + 1$ là ước nguyên của $5$, gồm $\{+-1; +-5\}$.]
    #step[Các hoành độ thỏa mãn là:
      - $x + 1 = -5 => x = -6$.
      - $x + 1 = -1 => x = -2$.
      - $x + 1 = 1 => x = 0$.
      - $x + 1 = 5 => x = 4$.
    ]
    #step[Tính tổng hoành độ: $S = -6 - 2 + 0 + 4 = -4$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Có bao nhiêu giá trị nguyên của tham số $m$ thuộc đoạn $[-5; 5]$ để đồ thị hàm số $y = (x + m)/(x - 1)$ có ít nhất một điểm có tọa độ nguyên?],
  [$11$],
  accent: c-book,
  loigiai: [
    #step[Xét hàm số: $y = 1 + frac(m + 1, x - 1)$ (với $x != 1$).]
    #step[Trường hợp 1: $m + 1 = 0 <=> m = -1$. Khi đó hàm số trở thành $y = 1$ (với $x != 1$). Với mọi $x$ nguyên khác 1, ta đều được điểm nguyên $(x; 1)$. Vậy luôn có điểm nguyên.]
    #step[Trường hợp 2: $m + 1 != 0 <=> m != -1$. Khi đó $m + 1$ là một số nguyên khác 0, nên nó luôn có ít nhất các ước nguyên là $1$ và $-1$.]
    #step[Do đó ta luôn tìm được ít nhất 2 hoành độ nguyên thỏa mãn là $x - 1 = 1 => x = 2$ hoặc $x - 1 = -1 => x = 0$.]
    #step[Vậy với mọi $m$ nguyên, đồ thị luôn có ít nhất một điểm nguyên.]
    #step[Số các giá trị nguyên của $m$ thuộc đoạn $[-5; 5]$ là $5 - (-5) + 1 = 11$.]
  ],
))

#pagebreak()

#exam-part([PHẦN IV. Bài toán thực tế bổ sung - Mức vận dụng cao (2 câu)], count: 2)

#q-wrap(dir: "doc", tln(
  [Một rạp chiếu phim có $200$ ghế. Nếu giá vé là $80$ nghìn đồng thì kín rạp. Cứ mỗi lần tăng thêm $5$ nghìn đồng thì giảm $8$ khán giả. Chi phí phục vụ cho mỗi khán giả là $20$ nghìn đồng, còn chi phí vệ sinh và duy tu cho mỗi ghế trống là $5$ nghìn đồng. Gọi $x$ là số lần tăng giá. Tìm giá vé để lợi nhuận của rạp lớn nhất.],
  [$110$ nghìn đồng/vé],
  accent: c-book,
  loigiai: [
    #step[Đặt $x$ là số lần tăng giá. Khi đó giá vé là $80 + 5 x$ (nghìn đồng), số khán giả là $200 - 8 x$, số ghế trống là $8 x$.]
    #step[Doanh thu: $R(x) = (80 + 5 x)(200 - 8 x) = 16000 + 360 x - 40 x^2$ (nghìn đồng).]
    #step[Chi phí: $C(x) = 20(200 - 8 x) + 5(8 x) = 4000 - 120 x$ (nghìn đồng).]
    #step[Lợi nhuận: $L(x) = R(x) - C(x) = 12000 + 480 x - 40 x^2$.]
    #step[$L'(x) = 480 - 80 x = 0 <=> x = 6$. Do đó giá vé tối ưu là $80 + 5 dot 6 = 110$ nghìn đồng.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một giàn khoan dầu cách bờ biển thẳng $6$ km tại điểm $H$. Kho dầu $B$ nằm trên bờ và cách $H$ đoạn $18$ km. Đặt điểm cập bờ là $C$ sao cho $H C = x$ km, $0 <= x <= 18$. Chi phí ống dẫn dưới biển là $4$ tỉ đồng/km, còn chi phí đi trên bờ là $2$ tỉ đồng/km. Tìm vị trí $C$ để tổng chi phí nhỏ nhất.],
  [$H C = 2 sqrt(3)$ km],
  accent: c-book,
  loigiai: [
    #step[Độ dài ống dưới biển là $A C = sqrt(x^2 + 6^2) = sqrt(x^2 + 36)$, còn đoạn trên bờ là $C B = 18 - x$.]
    #step[Tổng chi phí là $T(x) = 4 sqrt(x^2 + 36) + 2(18 - x)$ với $0 <= x <= 18$.]
    #step[$T'(x) = frac(4 x, sqrt(x^2 + 36)) - 2 = 0 <=> 2 x = sqrt(x^2 + 36)$.]
    #step[Bình phương hai vế: $4 x^2 = x^2 + 36 <=> 3 x^2 = 36 <=> x = 2 sqrt(3)$ do $x >= 0$.]
    #step[Vậy vị trí cập bờ tối ưu thỏa mãn $H C = 2 sqrt(3)$ km.]
  ],
))
