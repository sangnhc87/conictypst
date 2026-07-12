#import "../lib.typ": *
#show: sang-setup

= 03. Câu đúng-sai và trả lời ngắn

#let (tn, ds, tln, tl) = exam-mode(mode: "loigiai", q-label-style: "plain")

== A. Câu đúng-sai

Cú pháp:

```typ
#ds([Nội dung chung],
  (True([Mệnh đề đúng]), [Mệnh đề sai]),
  loigiai: [Lời giải],
)
```

#ds([Cho hàm số $f(x)=x^2-2x+3$. Xét các mệnh đề sau.],
  (
    True([$f(1)=2$.]),
    [$f(0)=0$.],
    True([Giá trị nhỏ nhất của $f(x)$ bằng $2$.]),
    [Phương trình $f(x)=0$ có hai nghiệm phân biệt.],
  ),
  loigiai: [Ta có $f(x)=(x-1)^2+2$. Do đó $f(1)=2$, $f(0)=3$, giá trị nhỏ nhất bằng $2$ và phương trình $f(x)=0$ vô nghiệm.],
)

#ds([Cho cấp số nhân $(u_n)$ có $u_1=3$, công bội $q=2$.],
  (
    True([$u_2=6$.]),
    True([$u_4=24$.]),
    [Tổng ba số hạng đầu bằng $18$.],
    True([$u_n=3 dot 2^(n-1)$.]),
  ),
  ds-style: "table",
  loigiai: [Ba số hạng đầu là $3,6,12$, tổng bằng $21$.],
)

#ds([Cho biến cố $A$ có $P(A)=0.25$.],
  (
    True([$0 <= P(A) <= 1$.]),
    [$P(overline(A))=0.25$.],
    True([$P(overline(A))=0.75$.]),
    [$P(A)+P(overline(A))=0.75$.],
  ),
  boxed: true,
  loigiai: [Dùng công thức $P(overline(A))=1-P(A)$.],
)

// ── Kiểu danh sách (table: false) ─────────────────────────────
// Dùng khi muốn hiển thị gọn hơn, không cần bảng Đ/S
// Trong mode "loigiai": dòng Đúng tô nền xanh + dấu ✓, dòng Sai + dấu ✗

```typ
#ds([Nội dung chung], (...), table: false)
```

#ds([Cho hàm số $f(x)=x^3-3x+2$. Xét tính đúng sai của các mệnh đề.],
  (
    True([$f'(x)=3x^2-3$.]),
    [Hàm số đồng biến trên $(-oo; +oo)$.],
    True([Hàm số đạt cực tiểu tại $x=1$.]),
    [$f(1)=0$ là giá trị cực đại của hàm số.],
  ),
  table: false,
  loigiai: [Ta có $f'(x)=3x^2-3=3(x-1)(x+1)$. Hàm số đạt cực tiểu tại $x=1$ với $f(1)=0$ và cực đại tại $x=-1$ với $f(-1)=4$. Hàm số không đơn điệu trên $RR$.],
)

// ── Các kiểu danh sách Đ/S mới (ds-style) ────────────────────────
// Các lựa chọn ds-style cho kiểu danh sách: "list" (mặc định), "pill", "modern", "minimal"

== Kiểu danh sách Pill (ds-style: "pill")
#ds([Cho $x, y$ là các số thực dương.],
  (
    True([$log(x y) = log x + log y$.]),
    [$log(x + y) = log x + log y$.],
    True([$log(x/y) = log x - log y$.]),
    [$log(x^2) = (log x)^2$.],
  ),
  ds-style: "pill",
)

== Kiểu danh sách Modern (ds-style: "modern")
#ds([Xét tính đơn điệu của hàm số $y = sin x$.],
  (
    [$y$ đồng biến trên $RR$.],
    True([$y$ đồng biến trên $(-pi/2; pi/2)$.]),
    [$y$ nghịch biến trên $(0; pi)$.],
    True([Chu kì tuần hoàn là $2pi$.]),
  ),
  ds-style: "modern",
)

== Kiểu danh sách Minimal (ds-style: "minimal")
#ds([Một số tính chất của tích phân.],
  (
    True([$int_a^b f(x) d x = -int_b^a f(x) d x$.]),
    [$int_a^b f(x) g(x) d x = int_a^b f(x) d x cdot int_a^b g(x) d x$.],
  ),
  ds-style: "minimal",
)

== Kiểu danh sách Bookmark (ds-style: "bookmark")
#ds([Một số mệnh đề về số phức $z$.],
  (
    True([$z = a + b i$ thì phần thực là $a$.]),
    [$z = a + b i$ thì phần ảo là $b i$.],
  ),
  ds-style: "bookmark",
)

== Kiểu danh sách Folder (ds-style: "folder")
#ds([Một số tính chất của logarit.],
  (
    True([$ln e = 1$.]),
    [$ln(x y) = ln x cdot ln y$.],
  ),
  ds-style: "folder",
)

== Kiểu danh sách Diamond (ds-style: "diamond")
#ds([Về khối đa diện đều.],
  (
    True([Có đúng 5 khối đa diện đều.]),
    [Khối lập phương có 12 mặt.],
  ),
  ds-style: "diamond",
)

== Kiểu danh sách Gradient (ds-style: "gradient")
#ds([Các tính chất của hình chóp tứ giác đều.],
  (
    True([Đáy là hình vuông.]),
    [Các mặt bên là các tam giác đều.],
  ),
  ds-style: "gradient",
)

== Kiểu danh sách Checklist (ds-style: "checklist")
#ds([Xét tính chẵn lẻ của hàm số.],
  (
    [$y = x^3 - x$ là hàm số chẵn.],
    True([$y = cos x$ là hàm số chẵn.]),
  ),
  ds-style: "checklist",
)

== B. Câu trả lời ngắn

Cú pháp khuyến nghị:

```typ
#tln([Nội dung câu hỏi], [$Đáp án$], loigiai: [Lời giải])
```

#tln([Tính giá trị $f(2)$ với $f(x)=x^2+1$.],
  [$5$],
  loigiai: [$f(2)=2^2+1=5$.],
)

#tln([Giải phương trình $2^x=32$.],
  [$5$],
  box-count: 2,
  loigiai: [$32=2^5$, nên $x=5$.],
)

#tln([Tính $lim_(x -> +oo) (3x+1)/(x-2)$.],
  [$3$],
  loigiai: [Chia tử và mẫu cho $x$, giới hạn bằng $3/1=3$.],
)

#tln([Tìm tọa độ đỉnh của parabol $y=x^2-4x+1$. Ghi dạng $(a;b)$.],
  [$(2;-3)$],
  show-boxes: false,
  lines: 2,
  loigiai: [$y=(x-2)^2-3$, nên đỉnh là $(2;-3)$.],
)

#tln([Tính đạo hàm $f'(1)$ nếu $f(x)=x^3+x$.],
  [$4$],
  boxed: true,
  loigiai: [$f'(x)=3x^2+1$, suy ra $f'(1)=4$.],
)
