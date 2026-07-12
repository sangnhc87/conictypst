#import "../lib.typ": *
#show: sang-setup

= 01. Import, ID và chế độ hiển thị

File này giải thích các quy ước cơ bản nhất trước khi dùng các file mẫu khác.

== Import khi file nằm trong thư mục `examples/`

```typ
#import "../lib.typ": *
#show: sang-setup
```

Nếu đã cài package local bằng `install.sh`, có thể dùng:

```typ
#import "@local/sang-math:1.0.0": *
#show: sang-setup
```

== ID câu hỏi

Kiểu khuyến nghị:

#tn([Hàm số $y=x^2$ có đạo hàm là],
  ([$x$], True([$2x$]), [$x^2$], [$2$]),
  loigiai: [Ta có $(x^2)'=2x$.],
)

#tln([Tính $f(2)$ với $f(x)=x^2+1$.],
  [$5$],
  loigiai: [$f(2)=2^2+1=5$.],
)

Ghi chú cho người đọc code: kiểu `id:` nếu cần nhắc đến thì viết đúng cú pháp Typst và để trong comment, ví dụ:

```typ
// #tln(id: "TLN01",
//   [Tính giá trị $f(2)$ với $f(x)=x^2+1$.],
//   [$5$],
// )
```

== Tạo bộ lệnh theo mode

`exam-mode(mode: "dethi")` dùng để in đề cho học sinh. `exam-mode(mode: "loigiai")` dùng để in kèm lời giải.

#let q = exam-mode(mode: "dethi", q-label-style: "plain", opt-style: "plain")
#let tn_dethi = q.tn
#let tln_dethi = q.tln

#tn_dethi("TN-DE-01",
  [Số nghiệm của phương trình $x^2-1=0$ là],
  ([$0$], [$1$], True([$2$]), [$3$]),
)

#tln_dethi("TLN-DE-01",
  [Giải phương trình $2^x=8$.],
  [$3$],
)

#let qlg = exam-mode(mode: "loigiai", q-label-style: "plain", opt-style: "plain")
#let tn_lg = qlg.tn

#tn_lg("TN-LG-01",
  [Đạo hàm của $y=sin x$ là],
  (True([$cos x$]), [$-cos x$], [$sin x$], [$-sin x$]),
  loigiai: [Công thức cơ bản: $(sin x)'=cos x$.],
)
