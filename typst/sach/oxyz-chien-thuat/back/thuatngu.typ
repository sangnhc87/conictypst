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
    [Vectơ chỉ phương], [Vectơ $arrow(u)$ dùng để xác định hướng của đường thẳng hay mặt phẳng.],
    [Vectơ pháp tuyến], [Vectơ $arrow(n)$ vuông góc với mặt phẳng $(P)$.],
    [Phương trình tham số], [Biểu diễn đường thẳng dạng $x = x_0 + a t,; y = y_0 + b t,; z = z_0 + c t$.],
    [Phương trình chính tắc], [Dạng $frac(x - x_0, a) = frac(y - y_0, b) = frac(z - z_0, c)$.],
    [Hình chiếu vuông góc], [Điểm $H$ trên mặt phẳng / đường thẳng gần điểm $M$ nhất.],
    [Điểm đối xứng], [Ảnh của $M$ qua phép đối xứng tâm hoặc đối xứng qua mặt phẳng.],
    [Khoảng cách hai đường chéo nhau], [Độ dài đoạn vuông góc chung giữa hai đường thẳng chéo nhau.],
    [Góc giữa hai mặt phẳng], [Góc giữa hai vectơ pháp tuyến (hoặc bù của nó), $theta in [0°, 90°]$.],
    [Giao tuyến], [Đường thẳng là giao của hai mặt phẳng phân biệt không song song.],
    [Mặt cầu], [Tập hợp các điểm cách đều tâm $I$ một khoảng $R$: $(x - a)^2 + (y - b)^2 + (z - c)^2 = R^2$.],
    [Ray Tracing], [Kỹ thuật dò tia sáng để tính màu sắc và đổ bóng trong đồ họa 3D.],
    [Target Interception], [Bài toán tìm thời điểm và vị trí hai vật chuyển động gặp nhau.],
    [Closest Approach], [Thời điểm $t$ để khoảng cách giữa hai điểm di động đạt giá trị nhỏ nhất.],
    [Line of Sight], [Đoạn thẳng nối từ mắt/camera đến mục tiêu; cần kiểm tra có bị chặn không.],
    [Blast Radius], [Bán kính sát thương của vụ nổ; bài toán điểm-khối cầu.],
  )
]
