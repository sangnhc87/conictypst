#import "../_config.typ": *
// PHỤ LỤC — THUẬT NGỮ
// ═══════════════════════════════════════════════════════════════════

#bangthuatngu(theme-color: c-book)[
  #table(
    columns: (auto, 1fr),
    stroke: 0.4pt + luma(180),
    inset: (x: 8pt, y: 6pt),
    fill: (col, row) => if row == 0 { c-book.lighten(88%) } else { white },
    [*Thuật ngữ*], [*Định nghĩa / Ghi chú*],
    [Nguyên hàm], [Hàm $F(x)$ sao cho $F'(x) = f(x)$. Họ nguyên hàm là $F(x) + C$.],
    [Tích phân xác định], [$integral_a^b f(x) d x = F(b) - F(a)$ — một số thực, không phụ thuộc $C$.],
    [Chi phí biên], [$C'(x)$ — chi phí tăng thêm khi sản xuất thêm 1 đơn vị. $C(x) = integral C'(x) d x$.],
    [Doanh thu biên], [$R'(x)$ — doanh thu tăng thêm khi bán thêm 1 đơn vị.],
    [Lợi nhuận biên], [$P'(x) = R'(x) - C'(x)$. Sản xuất có lãi khi $P'(x) > 0$.],
    [Quãng đường], [$s = integral_0^T |v(t)| d t$ — luôn dùng trị tuyệt đối để tính quãng đường thực tế.],
    [Độ dời], [$Delta x = integral_0^T v(t) d t$ — có thể âm nếu vật quay đầu.],
    [Công cơ học], [$W = integral_a^b F(x) d x$ (đơn vị: J) khi lực $F(x)$ thay đổi theo vị trí $x$.],
    [Diện tích vùng phẳng], [Diện tích giữa $f$ và $g$ ($f >= g$) trên $[a,b]$: $S = integral_a^b (f(x) - g(x)) d x$.],
    [Quy tắc hình thang],
    [Xấp xỉ $integral_a^b f(x) d x approx frac(h, 2)(y_0 + 2y_1 + dots + 2y_(n-1) + y_n)$ với $h = (b-a)/n$.],

    [Thiết diện], [Mặt cắt của vật thể bởi một mặt phẳng. $V = integral_a^b S(x) d x$.],
    [Khối tròn xoay],
    [Vật thể tạo ra khi quay đường cong $y = f(x)$ quanh trục $O x$: $V = pi integral_a^b f^2(x) d x$.],

    [Phương pháp vòng rỗng],
    [Khi quay vùng giữa $f$ và $g$ (với $f >= g >= 0$): $V = pi integral_a^b (f^2(x) - g^2(x)) d x$.],
  )
]
