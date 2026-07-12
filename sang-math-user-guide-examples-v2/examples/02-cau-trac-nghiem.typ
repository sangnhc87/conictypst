#import "../lib.typ": *
#show: sang-setup

= 02. Câu trắc nghiệm nhiều phương án

Cú pháp chính:

```typ
#tn([Nội dung câu hỏi],
  ([$A$], True([$B$]), [$C$], [$D$]),
  loigiai: [Lời giải],
)
```

#let (tn, ds, tln, tl) = exam-mode(mode: "loigiai", opt-style: "plain", q-label-style: "plain")

== Dạng 1. Câu cơ bản

#tn([Đạo hàm của hàm số $f(x)=x^3-3x+2$ là],
  ([$3x^2$], True([$3x^2-3$]), [$x^2-3$], [$3x^2+2$]),
  loigiai: [Ta có $(x^3)'=3x^2$, $(-3x)'=-3$, nên $f'(x)=3x^2-3$.],
)

#tn([Tập xác định của hàm số $y=sqrt(x-1)$ là],
  ([$(-oo;1)$], [$(-oo;1]$], True([$[1;+oo)$]), [$RR$]),
  loigiai: [Điều kiện $x-1 >= 0$, suy ra $x >= 1$.],
)

#tn([Nghiệm của phương trình $log_2 x = 3$ là],
  ([$3$], [$6$], True([$8$]), [$9$]),
  loigiai: [$log_2 x=3 <=> x=2^3=8$.],
)

== Dạng 2. Tự chia cột đáp án

#tn([Giới hạn $lim_(x -> +oo) (2x^2-1)/(x^2+3)$ bằng],
  ([$0$], [$1$], True([$2$]), [$+oo$]),
  cols: 4,
  loigiai: [Chia tử và mẫu cho $x^2$, giới hạn bằng hệ số bậc cao nhất: $2/1=2$.],
)

#tn([Cho cấp số cộng có $u_1=2$, công sai $d=3$. Khi đó $u_5$ bằng],
  ([$11$], True([$14$]), [$15$], [$17$]),
  cols: 2,
  loigiai: [$u_5=u_1+4d=2+12=14$.],
)

== Dạng 3. Đổi kiểu nhãn A, B, C, D

#tn([Số phức liên hợp của $z=2-3i$ là],
  ([$-2+3i$], [$2-3i$], True([$2+3i$]), [$-2-3i$]),
  opt-style: "circle",
  loigiai: [Số phức liên hợp đổi dấu phần ảo, nên $bar(z)=2+3i$.],
)

#tn([Nếu $P(A)=0.4$ thì $P(overline(A))$ bằng],
  ([$0.4$], True([$0.6$]), [$1.4$], [$-0.4$]),
  opt-style: "solid-circle",
  loigiai: [$P(overline(A))=1-P(A)=0.6$.],
)

== Dạng 4. Câu có khung và dòng nháp

#tn([Tìm giá trị nhỏ nhất của $f(x)=x^2-4x+5$.],
  ([$0$], True([$1$]), [$2$], [$5$]),
  boxed: true,
  draft: true,
  draft-lines: 3,
  loigiai: [$f(x)=(x-2)^2+1 >= 1$.],
)

== Dạng 5. Nhiều câu liên tiếp để làm ngân hàng

#tn([Tính $C(5,2)$.], ([$5$], [$8$], True([$10$]), [$20$]), loigiai: [$C(5,2)=10$.])
#tn([Tính $A(4,2)$.], ([$6$], True([$12$]), [$16$], [$24$]), loigiai: [$A(4,2)=4 dot 3=12$.])
#tn([Nghiệm của $x^2-5x+6=0$ là], ([$1;6$], True([$2;3$]), [$-2;-3$], [$0;5$]), loigiai: [$x^2-5x+6=(x-2)(x-3)$.])
#tn([Hàm số $y=x^3$ đồng biến trên], ([$(-oo;0)$], [$ (0;+oo)$], True([$RR$]), [$RR \ {0}$]), loigiai: [$y'=3x^2 >=0$ với mọi $x$ và hàm số đồng biến trên $RR$.])
