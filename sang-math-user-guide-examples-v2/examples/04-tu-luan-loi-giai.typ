#import "../lib.typ": *
#show: sang-setup

= 04. Câu tự luận và lời giải

#let (tn, ds, tln, tl) = exam-mode(mode: "loigiai", q-label-style: "plain")

== Cú pháp cơ bản

```typ
#tl([Nội dung câu hỏi],
  lines: 6,
  loigiai: [Lời giải],
)
```

#tl([Giải phương trình $x^2-5x+6=0$.],
  lines: 5,
  loigiai: [
    Ta có $x^2-5x+6=(x-2)(x-3)$.
    Do đó phương trình có hai nghiệm $x=2$ và $x=3$.
  ],
)

#tl([Xét tính đơn điệu của hàm số $y=x^3-3x+1$.],
  lines: 8,
  loigiai: [
    Ta có $y'=3x^2-3=3(x-1)(x+1)$.

    #bbbt(
      x-vals: ($-oo$, $-1$, $1$, $+oo$),
      d-signs: ("+", 0, "-", 0, "+"),
      v-vals: ($-oo$, $3$, $-1$, $+oo$),
    )

    Vậy hàm số đồng biến trên $(-oo;-1)$ và $(1;+oo)$, nghịch biến trên $(-1;1)$.
  ],
)

#tl([Tìm giá trị lớn nhất và nhỏ nhất của $f(x)=x^2-2x+3$ trên đoạn $[0;3]$.],
  lines: 8,
  boxed: true,
  loigiai: [
    Ta có $f'(x)=2x-2$, $f'(x)=0 <=> x=1$.
    Tính $f(0)=3$, $f(1)=2$, $f(3)=6$.
    Vậy $min f=2$ tại $x=1$ và $max f=6$ tại $x=3$.
  ],
)

== Dùng hộp phương pháp trong lời giải

#tl([Giải bất phương trình $(x-1)(x+2) >= 0$.],
  lines: 7,
  loigiai: [
    #ppgiai[
      Với tích hai nhân tử bậc nhất, ta lập bảng xét dấu theo các nghiệm $x=-2$ và $x=1$.
    ]

    #bxd(
      x-vals: ($-oo$, $-2$, $1$, $+oo$),
      func: ($(x+2)(x-1)$),
      f-signs: ("+", 0, "-", 0, "+"),
    )

    Suy ra nghiệm là $x <= -2$ hoặc $x >= 1$.
  ],
)
