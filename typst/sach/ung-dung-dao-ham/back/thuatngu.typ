#import "../_config.typ": *
// PHỤ LỤC
// ═══════════════════════════════════════════════════════════════════

#bangthuatngu(theme-color: c-book)[
  #table(
    columns: (auto, 1fr),
    stroke: 0.4pt + luma(180),
    inset: (x: 8pt, y: 6pt),
    fill: (col, row) => if row == 0 { c-book.lighten(88%) } else { white },
    [*Thuật ngữ*], [*Định nghĩa / Ghi chú*],
    [Hàm mục tiêu], [Hàm cần tối ưu hóa (max hoặc min) trong bài toán tối ưu.],
    [Ràng buộc], [Điều kiện cố định liên hệ các biến trong bài toán.],
    [Đạo hàm biên tế],
    [Đạo hàm của hàm chi phí $C'(x)$ hoặc doanh thu $R'(x)$ — giá trị tăng thêm khi sản xuất/bán thêm 1 đơn vị.],

    [Related Rates], [Kỹ thuật tìm tốc độ thay đổi của một đại lượng thông qua đạo hàm ẩn theo thời gian.],
    [EOQ], [Economic Order Quantity — lượng đặt hàng tối ưu trong mô hình quản lý tồn kho.],
    [Vi phân $upright(d)f$], [Xấp xỉ tuyến tính của độ thay đổi hàm số: $upright(d)f = f'(x_0)upright(d)x$.],
    [Sai số tương đối], [$|Delta f| / |f(x_0)|$ — sai số tính theo tỉ lệ phần trăm.],
    [Chu kỳ bán rã], [Thời gian để chất phóng xạ giảm còn một nửa; $T_(1/2) = ln 2 / k$.],
    [Điểm Fermat–Torricelli],
    [Điểm $T$ bên trong tam giác sao cho $|T A| + |T B| + |T C|$ nhỏ nhất; mỗi góc tại $T$ bằng $120°$.],

    [Nguyên lý Snell], [Trong bài toán thời gian ngắn nhất qua hai môi trường: $sin theta_1/v_1 = sin theta_2/v_2$.],
  )
]

#tailieuthamkhao(theme-color: c-book)[
  + *Nguyễn Văn Sang* — Bộ đề thi Toán THPT Quốc gia (Tổ Toán STEXGV).
  + *Stewart, J.* — _Calculus: Early Transcendentals_ (9th ed.), Cengage, 2020.
    (Nguồn tham khảo chính cho các bài toán Related Rates và Marginal Analysis.)
  + *Larson, R., Edwards, B.* — _Calculus_ (11th ed.), Cengage, 2018.
  + *Bộ GD&ĐT* — Sách giáo khoa Toán 12, Chương trình GDPT 2018.
  + *College Board* — _AP Calculus AB & BC Curriculum Framework_, 2024.
    (Tham khảo dạng bài related rates và data analysis theo chuẩn quốc tế.)
  + *Khan Academy* — https://www.khanacademy.org/math/ap-calculus-ab
    (Video minh họa trực quan cho người học lần đầu.)
]
