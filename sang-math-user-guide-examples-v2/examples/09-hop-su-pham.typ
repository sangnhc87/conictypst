#import "../lib.typ": *
#show: sang-setup

= 09. Các hộp sư phạm

File này minh họa các hộp dùng trong lời giải, giáo án, chuyên đề hoặc tài liệu học sinh.

Cách viết an toàn nhất là gọi dạng hàm rõ ràng:

```typ
#lythuyet([Nội dung hộp])
#ppgiai([Nội dung hộp])
#luuy([Nội dung hộp])
```

Có thể đổi tiêu đề bằng tham số `title:`.

== A. Hộp lý thuyết

#lythuyet([
  Nếu $f'(x)>0$ trên khoảng $I$ thì hàm số $f$ đồng biến trên $I$.
])

#lythuyet(
  title: [Quy tắc đạo hàm],
  [
    Với $u=u(x)$ và $v=v(x)$, ta có $(u+v)'=u'+v'$.
  ],
)

== B. Hộp định nghĩa, định lý, tính chất, bổ đề

#dn([
  Hàm số bậc hai là hàm số có dạng $y=ax^2+bx+c$ với $a neq 0$.
])

#dl([
  Với mọi $a>0$, $a neq 1$, ta có $log_a a^x=x$.
])

#tc([
  Nếu $A$ là một biến cố thì $P(overline(A))=1-P(A)$.
])

#bode([
  Nếu $a,b,c$ là ba số thực dương thì $a+b+c >= 3 root(3, a b c)$.
])

== C. Hộp phương pháp, lưu ý, mẹo, nhận xét

#ppgiai([
  Khi giải bất phương trình tích, hãy đưa về dạng tích các nhân tử bậc nhất rồi lập bảng xét dấu.
])

#luuy([
  Với hàm phân thức, trước khi lập bảng biến thiên cần loại các giá trị làm mẫu bằng $0$.
])

#meo([
  Với tam thức bậc hai $a x^2+b x+c$, nếu $Delta < 0$ thì tam thức luôn cùng dấu với $a$.
])

#nhanxet([
  Một lời giải tốt nên nêu rõ điều kiện xác định trước khi biến đổi tương đương.
])

#note([
  Các hộp có thể đặt trực tiếp trong phần lời giải của `#tl(...)` hoặc trong tài liệu chuyên đề.
])

== D. Dùng hộp trong câu tự luận

#let (tn, ds, tln, tl) = exam-mode(mode: "loigiai")

#tl([Giải bất phương trình $(x-2)(x+1) <= 0$.],
  loigiai: [
    #ppgiai([
      Đưa bất phương trình về dạng tích rồi xét dấu trên các khoảng tạo bởi nghiệm của từng nhân tử.
    ])

    Ta có các nghiệm của hai nhân tử là $x=-1$ và $x=2$.

    #bxd(
      x-vals: ($-oo$, $-1$, $2$, $+oo$),
      func: ($(x+1)(x-2)$),
      f-signs: ("+", $0$, "-", $0$, "+"),
    )

    #nhanxet([
      Biểu thức không dương trên đoạn giữa hai nghiệm.
    ])

    Vậy tập nghiệm là $[-1;2]$.
  ],
)

== E. Dùng hộp trong chuyên đề

#lythuyet(
  title: [Tóm tắt kiến thức],
  [
    Với phương trình bậc hai $a x^2+b x+c=0$, biệt thức là $Delta=b^2-4 a c$.
  ],
)

#ppgiai(
  title: [Quy trình giải],
  [
    1. Tính $Delta$. \
    2. Xét dấu $Delta$. \
    3. Kết luận số nghiệm và viết nghiệm nếu có.
  ],
)

#luuy(
  title: [Lỗi học sinh hay gặp],
  [
    Không được quên điều kiện $a neq 0$ khi gọi phương trình là phương trình bậc hai.
  ],
)

== F. Mẫu không nên dùng trong file hướng dẫn

Không nên để ví dụ sai chạy trực tiếp trong tài liệu. Nếu cần nhắc lỗi, hãy đặt trong comment hoặc code block như dưới đây:

```typ
// Không nên viết thiếu ngoặc nội dung nếu người mới dễ nhầm.
// #lythuyet[
//   Nội dung hộp.
// ]

// Nên viết rõ:
#lythuyet([
  Nội dung hộp.
])
```
