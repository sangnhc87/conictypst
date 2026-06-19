#import "_config.typ": *
#show: doc-setup
#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 04 - CỰC TRỊ TRONG BỐI CẢNH THỰC TẾ]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (6 câu)], count: 6)

#q-wrap(dir: "doc", tn(
  [Lượng truy cập vào một trang bán hàng trong ngày được mô hình bởi
    $N(t) = t^3 - 6t^2 + 9t + 120$ với $0 <= t <= 5$ (đơn vị của $t$ là giờ).
    Thời điểm lượng truy cập đạt cực đại địa phương là:],
  (
    True([$t = 1$]),
    [$t = 2$],
    [$t = 3$],
    [$t = 5$],
  ),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $N'(t) = 3t^2 - 12t + 9 = 3(t - 1)(t - 3)$.]
    #step[Đạo hàm đổi dấu từ dương sang âm khi qua $t = 1$, nên $t = 1$ là điểm cực đại địa phương.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Mức tồn kho của một kho hàng được mô hình bởi
    $I(t) = -t^3 + 6t^2 - 9t + 50$ với $0 <= t <= 5$.
    Thời điểm mức tồn kho đạt cực tiểu địa phương là:],
  (
    True([$t = 1$]),
    [$t = 2$],
    [$t = 3$],
    [$t = 4$],
  ),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $I'(t) = -3t^2 + 12t - 9 = -3(t - 1)(t - 3)$.]
    #step[Đạo hàm đổi dấu từ âm sang dương khi qua $t = 1$, nên $t = 1$ là điểm cực tiểu địa phương.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Mức tiêu hao nhiên liệu trên mỗi đơn vị quãng đường của một xe tải theo vận tốc $v$ được cho bởi
    $F(v) = v + 100/v$ với $v > 0$.
    Vận tốc tại đó mức tiêu hao đạt cực tiểu là:],
  (
    [$v = 5$],
    True([$v = 10$]),
    [$v = 20$],
    [$v = 50$],
  ),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $F'(v) = 1 - 100/v^2$.]
    #step[Giải $F'(v) = 0 <=> v^2 = 100 <=> v = 10$ vì $v > 0$.]
    #step[Đạo hàm đổi dấu từ âm sang dương khi qua $v = 10$, nên $v = 10$ là điểm cực tiểu.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Nồng độ một hoạt chất trong máu sau khi tiêm được mô hình bởi
    $C(t) = t e^(-t)$ với $t >= 0$.
    Thời điểm nồng độ đạt cực đại là:],
  (
    [$t = 0$],
    True([$t = 1$]),
    [$t = 2$],
    [$t = e$],
  ),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $C'(t) = e^(-t) - t e^(-t) = (1 - t)e^(-t)$.]
    #step[Giải $C'(t) = 0 <=> t = 1$.]
    #step[Vì $e^(-t) > 0$ và $1 - t$ đổi dấu từ dương sang âm khi qua $t = 1$, nên nồng độ đạt cực đại tại $t = 1$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Mức rung của một thiết bị theo thời gian được mô hình bởi
    $R(t) = t^4 - 8t^2 + 10$.
    Hàm số này có bao nhiêu điểm cực trị?],
  (
    [$1$],
    [$2$],
    True([$3$]),
    [$4$],
  ),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $R'(t) = 4t^3 - 16t = 4t(t - 2)(t + 2)$.]
    #step[Phương trình $R'(t) = 0$ có ba nghiệm đơn $t = -2, 0, 2$.]
    #step[Đạo hàm đổi dấu khi đi qua cả ba nghiệm này, nên hàm số có $3$ điểm cực trị.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Giả sử lợi nhuận $P(x)$ của một chiến dịch quảng cáo có bảng xét dấu đạo hàm:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $P'$,
        x-vals: ($-oo$, $1$, $3$, $+oo$),
        f-signs: ($+$, $0$, $-$, $0$, $+$),
      )
    ]
    Khi đó khẳng định nào sau đây đúng?],
  (
    [Lợi nhuận có cực tiểu tại $x = 1$ và cực đại tại $x = 3$],
    True([Lợi nhuận có cực đại tại $x = 1$ và cực tiểu tại $x = 3$]),
    [Lợi nhuận không có cực trị],
    [Lợi nhuận đạt cực đại tại cả $x = 1$ và $x = 3$],
  ),
  accent: c-book,
  loigiai: [
    #step[Từ bảng dấu, $P'(x)$ đổi từ dương sang âm tại $x = 1$, nên $x = 1$ là điểm cực đại.]
    #step[Tại $x = 3$, $P'(x)$ đổi từ âm sang dương, nên $x = 3$ là điểm cực tiểu.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng/Sai (2 câu)], count: 2)

#q-wrap(dir: "doc",lines: 3, ds(
  [Cho hàm số lượng truy cập
    $N(t) = t^3 - 6t^2 + 9t + 120$ trên đoạn $[0; 5]$.
    Xét các phát biểu sau:],
  (
    True([$t = 1$ là thời điểm đạt cực đại địa phương.]),
    True([$t = 3$ là thời điểm đạt cực tiểu địa phương.]),
    [$N(1)$ là giá trị lớn nhất trên toàn đoạn $[0; 5]$.],
    True([Trên khoảng $(0; 1)$, lượng truy cập đang tăng.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. $N'(t) = 3(t - 1)(t - 3)$ đổi dấu từ dương sang âm khi qua $t = 1$.
    - b) Đúng. Đạo hàm đổi dấu từ âm sang dương khi qua $t = 3$.
    - c) Sai. Đây chỉ là cực đại địa phương; trên đoạn đã cho, giá trị tại biên phải còn có thể lớn hơn.
    - d) Đúng. Với $0 < t < 1$ thì $N'(t) > 0$, nên lượng truy cập tăng.
  ],
))

#q-wrap(dir: "doc",lines: 3, ds(
  [Cho hàm số mức tiêu hao nhiên liệu
    $F(v) = v + 100/v$ với $v > 0$.
    Xét các phát biểu sau:],
  (
    True([$F'(10) = 0$.]),
    True([$v = 10$ là điểm cực tiểu của hàm số.]),
    True([Khi $v > 10$, mức tiêu hao tăng dần theo $v$.]),
    [Hàm số có một điểm cực đại.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. $F'(v) = 1 - 100/v^2$ nên $F'(10) = 0$.
    - b) Đúng. Đạo hàm đổi dấu từ âm sang dương khi qua $v = 10$.
    - c) Đúng. Với $v > 10$ ta có $F'(v) > 0$, nên hàm số tăng.
    - d) Sai. Hàm số chỉ có một điểm cực tiểu, không có cực đại.
  ],
))

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (4 câu)], count: 4)

#q-wrap(dir: "doc", tln(
  [Lượng truy cập của một trang tin được mô hình bởi
    $N(t) = t^3 - 6t^2 + 9t + 120$ trên đoạn $[0; 5]$.
    Hãy nêu các thời điểm đạt cực đại địa phương và cực tiểu địa phương.],
  [Cực đại địa phương tại $t = 1$, cực tiểu địa phương tại $t = 3$],
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm $N'(t) = 3(t - 1)(t - 3)$.]
    #step[Đạo hàm đổi dấu từ dương sang âm tại $t = 1$, nên đó là cực đại địa phương.]
    #step[Đạo hàm đổi dấu từ âm sang dương tại $t = 3$, nên đó là cực tiểu địa phương.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Với hàm số tiêu hao nhiên liệu $F(v) = v + 100/v$ ($v > 0$), vận tốc nào cho mức tiêu hao thấp nhất?],
  [$v = 10$],
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm $F'(v) = 1 - 100/v^2$.]
    #step[Giải $F'(v) = 0$ được $v = 10$ vì $v > 0$.]
    #step[Đạo hàm đổi dấu từ âm sang dương khi qua $v = 10$, nên đây là vận tốc cho mức tiêu hao thấp nhất theo nghĩa cực trị.]
  ],
))
  