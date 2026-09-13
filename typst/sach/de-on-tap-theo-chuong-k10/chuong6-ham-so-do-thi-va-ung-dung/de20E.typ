#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("be123c") // Rose / Ruby

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG",
  exam-title: "CHUYÊN ĐỀ TOÁN THỰC TẾ: KINH TẾ HỌC TOÁN & TỐI ƯU HÓA LỢI NHUẬN (ĐỀ SỐ 20E)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "153",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một xưởng may áo sơ mi xuất khẩu bán ra thị trường với hàm cầu tuyến tính:
$ p(x) = 300 - 2x text(" (nghìn đồng/áo)") $
trong đó $x$ là số lượng áo bán ra mỗi ngày ($0 < x < 150$).
Hàm doanh thu mỗi ngày $R(x)$ của xưởng may theo sản lượng $x$ là],
    (
        True([$R(x) = -2x^2 + 300x text(" (nghìn đồng)")$]),
        [$R(x) = 2x^2 - 300x text(" (nghìn đồng)")$],
        [$R(x) = -2x + 300 text(" (nghìn đồng)")$],
        [$R(x) = -x^2 + 150x text(" (nghìn đồng)")$]
    ),
    loigiai: [
        Doanh thu bằng số lượng bán nhân với đơn giá:
        $ R(x) = x cdot p(x) = x(300 - 2x) = -2x^2 + 300x text(" (nghìn đồng)") $
    ]
)

// TN 2
#tn([Doanh thu hàng ngày lớn nhất mà xưởng may trên có thể đạt được bằng],
    (
        True([$11.250 text(" nghìn đồng")$]),
        [$10.000 text(" nghìn đồng")$],
        [$12.500 text(" nghìn đồng")$],
        [$9.000 text(" nghìn đồng")$]
    ),
    loigiai: [
        Hàm số doanh thu $R(x) = -2x^2 + 300x$ có $a = -2 < 0$.
        Đạt giá trị lớn nhất tại hoành độ đỉnh:
        $ x_I = - 300 / (2(-2)) = 75 text(" chiếc áo") $
        Doanh thu tối đa:
        $ R(75) = -2(75)^2 + 300(75) = -11250 + 22500 = 11250 text(" nghìn đồng") $
    ]
)

// TN 3
#tn([Để doanh thu mỗi ngày đạt mức tối đa, xưởng may nên ấn định giá bán của mỗi chiếc áo sơ mi là],
    (
        True([$150 text(" nghìn đồng")$]),
        [$180 text(" nghìn đồng")$],
        [$120 text(" nghìn đồng")$],
        [$200 text(" nghìn đồng")$]
    ),
    loigiai: [
        Doanh thu lớn nhất khi sản lượng bán ra là $x = 75$ chiếc áo.
        Giá bán tương ứng:
        $ p(75) = 300 - 2(75) = 300 - 150 = 150 text(" nghìn đồng/áo") $
    ]
)

// TN 4
#tn([Biết chi phí sản xuất mỗi ngày của xưởng may được cho bởi hàm số:
$ C(x) = 60x + 4000 text(" (nghìn đồng)") $
Công thức hàm lợi nhuận hàng ngày $L(x) = R(x) - C(x)$ của xưởng may là],
    (
        True([$L(x) = -2x^2 + 240x - 4000 text(" (nghìn đồng)")$]),
        [$L(x) = -2x^2 + 360x - 4000 text(" (nghìn đồng)")$],
        [$L(x) = -2x^2 + 240x + 4000 text(" (nghìn đồng)")$],
        [$L(x) = 2x^2 - 240x + 4000 text(" (nghìn đồng)")$]
    ),
    loigiai: [
        Lợi nhuận bằng doanh thu trừ đi chi phí:
        $ L(x) = R(x) - C(x) = (-2x^2 + 300x) - (60x + 4000) = -2x^2 + 240x - 4000 text(" (nghìn đồng)") $
    ]
)

// TN 5
#tn([Xưởng may trên bắt đầu sinh lời ($L(x) > 0$) khi số lượng áo bán ra mỗi ngày thỏa mãn điều kiện],
    (
        True([$20 < x < 100$]),
        [$x > 100$],
        [$x < 20$],
        [$0 < x < 50$]
    ),
    loigiai: [
        Xưởng may có lãi khi và chỉ khi:
        $ L(x) > 0 <=> -2x^2 + 240x - 4000 > 0 <=> x^2 - 120x + 2000 < 0 $
        Phương trình bậc hai $x^2 - 120x + 2000 = 0 <=> (x - 20)(x - 100) = 0 <=> cases(x = 20, x = 100)$.
        Do hệ số $a = 1 > 0$ nên bất phương trình có tập nghiệm là: $20 < x < 100$.
    ]
)

// TN 6
#tn([Lợi nhuận hàng ngày lớn nhất mà xưởng may có thể đạt được bằng],
    (
        True([$3.200 text(" nghìn đồng")$]),
        [$3.000 text(" nghìn đồng")$],
        [$3.500 text(" nghìn đồng")$],
        [$2.800 text(" nghìn đồng")$]
    ),
    loigiai: [
        Hàm lợi nhuận $L(x) = -2x^2 + 240x - 4000$ có $a = -2 < 0$.
        Đạt cực đại tại đỉnh:
        $ x_I = - 240 / (2(-2)) = 60 text(" chiếc áo") $
        Lợi nhuận tối đa:
        $ L(60) = -2(60)^2 + 240(60) - 4000 = -7200 + 14400 - 4000 = 3200 text(" nghìn đồng") $
    ]
)

// TN 7
#tn([Một chủ khách sạn có $50$ phòng nghỉ. Nếu giá thuê mỗi phòng là $400$ nghìn đồng/ngày thì tất cả các phòng đều được thuê hết.
Cứ tăng giá thuê thêm $20$ nghìn đồng/phòng/ngày thì sẽ có $1$ phòng bị bỏ trống.
Gọi $x$ là số lần tăng giá $20$ nghìn đồng ($x in NN, 0 <= x <= 50$).
Hàm doanh thu mỗi ngày $R(x)$ của khách sạn là],
    (
        True([$R(x) = -20x^2 + 600x + 20000 text(" (nghìn đồng)")$]),
        [$R(x) = -20x^2 + 400x + 20000 text(" (nghìn đồng)")$],
        [$R(x) = 20x^2 - 600x + 20000 text(" (nghìn đồng)")$],
        [$R(x) = -x^2 + 30x + 1000 text(" (nghìn đồng)")$]
    ),
    loigiai: [
        - Giá phòng sau $x$ lần tăng: $400 + 20x$ (nghìn đồng).
        - Số phòng được thuê: $50 - x$ (phòng).
        - Doanh thu:
        $ R(x) = (50 - x)(400 + 20x) = 20000 + 1000x - 400x - 20x^2 = -20x^2 + 600x + 20000 text(" (nghìn đồng)") $
    ]
)

// TN 8
#tn([Trong bài toán khách sạn trên, chủ khách sạn nên tăng giá phòng bao nhiêu lần để doanh thu mỗi ngày là lớn nhất?],
    (
        True([$15 text(" lần")$]),
        [$10 text(" lần")$],
        [$20 text(" lần")$],
        [$12 text(" lần")$]
    ),
    loigiai: [
        Hàm doanh thu $R(x) = -20x^2 + 600x + 20000$ có $a = -20 < 0$.
        Đạt giá trị lớn nhất tại đỉnh:
        $ x_I = - 600 / (2(-20)) = 15 text(" lần") $
    ]
)

// TN 9
#tn([Một hợp tác xã trồng bưởi Da Xanh có mật độ tiêu chuẩn là $40$ cây/héc-ta, mỗi cây cho sản lượng trung bình $300$ quả/năm.
Cứ trồng thêm $1$ cây trên mỗi héc-ta thì do mật độ tăng lên làm năng suất bình quân mỗi cây giảm đi $5$ quả/năm.
Gọi $x$ là số cây trồng thêm trên $1$ ha ($x in NN$).
Công thức tính tổng sản lượng bưởi $Y(x)$ trên $1$ ha là],
    (
        True([$Y(x) = -5x^2 + 100x + 12000 text(" (quả)")$]),
        [$Y(x) = -5x^2 + 200x + 12000 text(" (quả)")$],
        [$Y(x) = 5x^2 - 100x + 12000 text(" (quả)")$],
        [$Y(x) = -x^2 + 20x + 2400 text(" (quả)")$]
    ),
    loigiai: [
        - Số cây trên $1$ ha: $40 + x$ (cây).
        - Sản lượng mỗi cây: $300 - 5x$ (quả).
        - Tổng sản lượng:
        $ Y(x) = (40 + x)(300 - 5x) = 12000 - 200x + 300x - 5x^2 = -5x^2 + 100x + 12000 text(" (quả)") $
    ]
)

// TN 10
#tn([Để thu được tổng sản lượng bưởi trên mỗi héc-ta là lớn nhất, người nông dân nên trồng thêm bao nhiêu cây trên $1$ ha?],
    (
        True([$10 text(" cây")$]),
        [$8 text(" cây")$],
        [$12 text(" cây")$],
        [$15 text(" cây")$]
    ),
    loigiai: [
        Hàm sản lượng $Y(x) = -5x^2 + 100x + 12000$ đạt cực đại tại:
        $ x_I = - 100 / (2(-5)) = 10 text(" cây") $
    ]
)

// TN 11
#tn([Một công ty vận tải hành khách tuyến Hà Nội - Hải Phòng có giá vé hiện tại là $100$ nghìn đồng/lượt và phục vụ trung bình $600$ lượt khách mỗi ngày.
Khảo sát thị trường cho thấy cứ mỗi lần giảm giá vé $5$ nghìn đồng thì số lượng khách mỗi ngày tăng thêm $50$ lượt.
Gọi $x$ là số lần giảm giá vé ($x in NN, 0 <= x <= 15$).
Hàm doanh thu mỗi ngày $R(x)$ của công ty là],
    (
        True([$R(x) = -250x^2 + 2000x + 60000 text(" (nghìn đồng)")$]),
        [$R(x) = -250x^2 + 1000x + 60000 text(" (nghìn đồng)")$],
        [$R(x) = 250x^2 - 2000x + 60000 text(" (nghìn đồng)")$],
        [$R(x) = -5x^2 + 50x + 60000 text(" (nghìn đồng)")$]
    ),
    loigiai: [
        - Giá vé sau $x$ lần giảm: $100 - 5x$ (nghìn đồng).
        - Số lượt khách mỗi ngày: $600 + 50x$ (lượt).
        - Doanh thu hàng ngày:
        $ R(x) = (100 - 5x)(600 + 50x) = 60000 + 5000x - 3000x - 250x^2 = -250x^2 + 2000x + 60000 text(" (nghìn đồng)") $
    ]
)

// TN 12
#tn([Để doanh thu mỗi ngày đạt mức cao nhất, công ty vận tải trên nên ấn định giá vé mỗi lượt là],
    (
        True([$80 text(" nghìn đồng")$]),
        [$85 text(" nghìn đồng")$],
        [$75 text(" nghìn đồng")$],
        [$90 text(" nghìn đồng")$]
    ),
    loigiai: [
        Hàm doanh thu $R(x) = -250x^2 + 2000x + 60000$ có $a = -250 < 0$.
        Đạt giá trị lớn nhất tại hoành độ đỉnh:
        $ x_I = - 2000 / (2(-250)) = 4 text(" lần giảm giá") $
        Giá vé tối ưu khi đó là:
        $ p = 100 - 5(4) = 80 text(" nghìn đồng") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Mô hình chip bán dẫn có CeTZ)
#ds([Một doanh nghiệp công nghệ độc quyền sản xuất vi xử lý thế hệ mới.
Hàm cầu của thị trường đối với loại chip này là:
$ p = 120 - 0.5x text(" (triệu đồng/nghìn chip)") $
trong đó $x$ là sản lượng chip tiêu thụ hàng tháng ($0 < x < 240$ nghìn chip).
Doanh thu hàng tháng là: $R(x) = x p = -0.5x^2 + 120x$ (triệu đồng).
Chi phí sản xuất hàng tháng được cho bởi: $C(x) = 20x + 3200$ (triệu đồng).
Lợi nhuận hàng tháng của doanh nghiệp là:
$ L(x) = R(x) - C(x) = -0.5x^2 + 100x - 3200 text(" (triệu đồng)") $
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-0.5, 0), (5.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -2), (0, 3.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((5.2, -0.3), [$x text(" (nghìn)") $])
  content((-0.4, 3.2), [$L(x)$])
  content((-0.25, -0.25), [$O$])
  
  // Parabol lợi nhuận L(x) = -0.5x^2 + 100x - 3200 (scale: x chia 40, L chia 1000)
  // x = 40 -> 1, x = 100 -> 2.5, x = 160 -> 4. L(100) = 1800 -> 1.8
  line(..range(5, 45).map(t => {
    let x_real = t * 4;
    let x_plot = x_real / 40;
    let y_real = -0.5 * calc.pow(x_real, 2) + 100 * x_real - 3200;
    let y_plot = y_real / 1000;
    (x_plot, y_plot)
  }), stroke: 1.5pt + rgb("be123c"))
  
  // Đỉnh I(100; 1800) -> (2.5; 1.8)
  circle((2.5, 1.8), radius: 2.5pt, fill: rgb("be123c"))
  line((2.5, 0), (2.5, 1.8), stroke: (dash: "dashed", paint: gray))
  line((0, 1.8), (2.5, 1.8), stroke: (dash: "dashed", paint: gray))
  content((2.5, -0.3), [$100$])
  content((-0.4, 1.8), [$1800$])
  content((2.5, 2.1), [$I(100; 1800)$])
  
  // Hòa vốn tại 40 (1.0) và 160 (4.0)
  circle((1, 0), radius: 2pt, fill: rgb("be123c"))
  circle((4, 0), radius: 2pt, fill: rgb("be123c"))
  content((1, -0.3), [$40$])
  content((4, -0.3), [$160$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Doanh thu hàng tháng đạt cực đại khi sản lượng sản xuất là $120$ nghìn chip.]),
    True([Doanh nghiệp đạt trạng thái hòa vốn ($L(x) = 0$) tại hai mức sản lượng $x = 40$ nghìn chip và $x = 160$ nghìn chip/tháng.]),
    True([Mức lợi nhuận hàng tháng lớn nhất doanh nghiệp có thể đạt được là $1.800$ triệu đồng khi sản xuất $100$ nghìn chip.]),
    [Khi sản lượng sản xuất vượt quá $160$ nghìn chip mỗi tháng thì doanh nghiệp vẫn có lãi.]
  ),
  loigiai: [
    #step([Cực đại doanh thu])
    $R(x) = -0.5x^2 + 120x$ đạt cực đại tại $x = - 120 / (2(-0.5)) = 120$ nghìn chip. Mệnh đề a ĐÚNG.

    #step([Điểm hòa vốn])
    $L(x) = 0 <=> -0.5x^2 + 100x - 3200 = 0 <=> x^2 - 200x + 6400 = 0 <=> (x - 40)(x - 160) = 0 <=> cases(x = 40, x = 160)$. Mệnh đề b ĐÚNG.

    #step([Lợi nhuận cực đại])
    $L(x)$ có $a = -0.5 < 0$ đạt cực đại tại $x_I = - 100 / (2(-0.5)) = 100$ nghìn chip.
    Lợi nhuận tối đa: $L(100) = -0.5(100)^2 + 100(100) - 3200 = -5000 + 10000 - 3200 = 1800$ triệu đồng. Mệnh đề c ĐÚNG.

    #step([Kiểm tra khi sản lượng vượt quá 160])
    Khi $x > 160$, do tam thức bậc hai $L(x)$ có $a = -0.5 < 0$ nên nằm ngoài khoảng hai nghiệm, $L(x) < 0$.
    Doanh nghiệp bị thua lỗ chứ không hề có lãi.
    Khẳng định vẫn có lãi là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Biệt thự nghỉ dưỡng resort)
#ds([Một khu resort có $100$ biệt thự cao cấp. Nếu cho thuê với giá $2.000$ nghìn đồng/đêm thì toàn bộ $100$ căn đều được thuê kín.
Cứ mỗi lần tăng giá thuê thêm $100$ nghìn đồng/đêm thì sẽ có $2$ căn bị bỏ trống.
Chi phí vận hành, dọn dẹp và tiện ích cho mỗi căn có khách là $400$ nghìn đồng/đêm.
Gọi $x$ là số lần tăng giá $100$ nghìn đồng ($x in NN, 0 <= x <= 50$).
- Giá thuê mỗi căn: $2000 + 100x$ (nghìn đồng/đêm).
- Số căn được thuê: $100 - 2x$ (căn).
- Doanh thu: $R(x) = (100 - 2x)(2000 + 100x)$ (nghìn đồng).
- Chi phí vận hành: $C(x) = 400(100 - 2x)$ (nghìn đồng).
- Lợi nhuận mỗi đêm: $L(x) = R(x) - C(x) = -200x^2 + 6800x + 160000$ (nghìn đồng).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu tăng giá $5$ lần ($x = 5$, giá thuê $2.500$ nghìn đồng/đêm) thì có đúng $90$ căn biệt thự được thuê.]),
    True([Công thức hàm lợi nhuận mỗi đêm theo $x$ là $L(x) = -200x^2 + 6800x + 160000 text(" (nghìn đồng)")$.]),
    True([Resort nên tăng giá $17$ lần (tức giá thuê là $3.700$ nghìn đồng/đêm) để thu được lợi nhuận mỗi đêm là lớn nhất.]),
    [Mức lợi nhuận lớn nhất mỗi đêm mà resort có thể đạt được là vượt quá $230.000.000 text(" đồng")$.]
  ),
  loigiai: [
    #step([Kiểm tra khi x = 5])
    Giá thuê: $2000 + 100(5) = 2500$ nghìn đồng.
    Số căn thuê: $100 - 2(5) = 90$ căn. Mệnh đề a ĐÚNG.

    #step([Hàm lợi nhuận])
    $L(x) = (100 - 2x)(2000 + 100x) - 400(100 - 2x) = (100 - 2x)(1600 + 100x) = 160000 + 10000x - 3200x - 200x^2 = -200x^2 + 6800x + 160000$ (nghìn đồng). Mệnh đề b ĐÚNG.

    #step([Tìm số lần tăng giá tối ưu])
    Hàm số $L(x)$ đạt cực đại tại:
    $ x_I = - 6800 / (2(-200)) = 17 text(" lần") $
    Giá thuê tương ứng: $2000 + 100(17) = 3700$ nghìn đồng/đêm. Mệnh đề c ĐÚNG.

    #step([Tính lợi nhuận cực đại])
    $L(17) = -200(17)^2 + 6800(17) + 160000 = -57800 + 115600 + 160000 = 217800 text(" nghìn đồng") = 217.800.000 text(" đồng") $.
    Vì $217.800.000 text(" đồng") < 230.000.000 text(" đồng")$ nên khẳng định vượt quá $230$ triệu đồng là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Năng suất cam sành nông nghiệp)
#ds([Một trang trại cam sành canh tác trên diện tích $2$ héc-ta.
Mật độ chuẩn là $50$ cây/ha (toàn trang trại có $100$ cây), năng suất trung bình mỗi cây là $120 text(" kg")$ quả/năm.
Cứ trồng thêm $1$ cây trên mỗi héc-ta thì năng suất trung bình mỗi cây trên cả trang trại giảm đi $1 text(" kg")$ quả/năm.
Gọi $x$ là số cây trồng thêm trên mỗi héc-ta ($x in NN, 0 <= x <= 40$).
Tổng số cây trên trang trại là $100 + 2x$ cây.
Năng suất mỗi cây là $120 - x text(" kg")$ quả.
Tổng sản lượng cam thu hoạch mỗi năm của trang trại là:
$ P(x) = (100 + 2x)(120 - x) = -2x^2 + 140x + 12000 text(" (kg)") $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu không trồng thêm cây nào ($x = 0$) thì sản lượng thu hoạch hàng năm là $12.000 text(" kg")$ cam.]),
    True([Công thức tổng sản lượng theo số cây trồng thêm trên mỗi ha là $P(x) = -2x^2 + 140x + 12000 text(" (kg)")$.]),
    True([Trang trại đạt tổng sản lượng cam lớn nhất khi trồng thêm $35$ cây trên mỗi héc-ta (tức trồng $85$ cây/ha).]),
    [Tổng sản lượng cam lớn nhất hàng năm mà trang trại có thể đạt được là $15.000 text(" kg")$.]
  ),
  loigiai: [
    #step([Sản lượng khi x = 0])
    $P(0) = 100(120) = 12000 text(" kg")$. Mệnh đề a ĐÚNG.

    #step([Công thức sản lượng])
    $P(x) = (100 + 2x)(120 - x) = 12000 - 100x + 240x - 2x^2 = -2x^2 + 140x + 12000$. Mệnh đề b ĐÚNG.

    #step([Số cây trồng thêm tối ưu])
    Đỉnh parabol tại: $x_I = - 140 / (2(-2)) = 35 text(" cây/ha")$.
    Mật độ mới: $50 + 35 = 85$ cây/ha. Mệnh đề c ĐÚNG.

    #step([Sản lượng tối đa])
    $P(35) = -2(35)^2 + 140(35) + 12000 = -2450 + 4900 + 12000 = 14450 text(" kg")$.
    Vì $14450 text(" kg") != 15000 text(" kg")$ nên khẳng định đạt $15.000 text(" kg")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Định giá xuất bản sách tham khảo)
#ds([Một nhà xuất bản ấn hành cuốn sách "Cẩm nang chinh phục Toán 10".
Chi phí chế bản, bản quyền cố định ban đầu là $50.000$ nghìn đồng.
Chi phí in ấn cho mỗi cuốn sách là $30$ nghìn đồng.
Bộ phận tiếp thị ước tính hàm cầu của thị trường theo giá bán $p$ (nghìn đồng/cuốn) là:
$ N(p) = 5000 - 40p text(" (cuốn)") $
Tổng doanh thu là $R(p) = p cdot N(p) = -40p^2 + 5000p$ (nghìn đồng).
Tổng chi phí xuất bản là $C(p) = 50000 + 30(5000 - 40p) = -1200p + 200000$ (nghìn đồng).
Lợi nhuận của nhà xuất bản là:
$ L(p) = R(p) - C(p) = -40p^2 + 6200p - 200000 text(" (nghìn đồng)") $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu giá bán mỗi cuốn là $50$ nghìn đồng thì nhà xuất bản tiêu thụ được $3.000$ cuốn sách.]),
    True([Công thức hàm lợi nhuận theo giá bán $p$ là $L(p) = -40p^2 + 6200p - 200000 text(" (nghìn đồng)")$.]),
    True([Nhà xuất bản nên định giá bán là $77.5$ nghìn đồng/cuốn để đạt lợi nhuận lớn nhất.]),
    [Mức lợi nhuận lớn nhất mà nhà xuất bản có thể đạt được là dưới $30$ triệu đồng.]
  ),
  loigiai: [
    #step([Số lượng tiêu thụ khi p = 50])
    $N(50) = 5000 - 40(50) = 5000 - 2000 = 3000$ cuốn. Mệnh đề a ĐÚNG.

    #step([Công thức lợi nhuận])
    $L(p) = (-40p^2 + 5000p) - (-1200p + 200000) = -40p^2 + 6200p - 200000$ (nghìn đồng). Mệnh đề b ĐÚNG.

    #step([Giá bán tối ưu])
    Đỉnh parabol tại:
    $ p_I = - 6200 / (2(-40)) = 6200 / 80 = 77.5 text(" nghìn đồng") $
    Mệnh đề c ĐÚNG.

    #step([Tính lợi nhuận cực đại])
    $L(77.5) = -40(77.5)^2 + 6200(77.5) - 200000 = -240250 + 480500 - 200000 = 40250 text(" nghìn đồng") = 40.25 text(" triệu đồng") $.
    Vì $40.25 text(" triệu đồng") > 30 text(" triệu đồng")$ nên khẳng định dưới $30$ triệu đồng là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Lợi nhuận xưởng may)
#tln([Trong bài toán xưởng may áo sơ mi xuất khẩu, mức lợi nhuận hàng ngày lớn nhất mà xưởng có thể đạt được là bao nhiêu nghìn đồng?],
    [3200],
    loigiai: [
        #step([Tính lợi nhuận tối đa])
        Hàm lợi nhuận: $L(x) = -2x^2 + 240x - 4000$.
        Đạt cực đại tại $x = 60$ chiếc áo.
        $ L(60) = -2(60)^2 + 240(60) - 4000 = 3200 text(" nghìn đồng") $
    ]
)

// TLN 2 (Lợi nhuận chip vi xử lý)
#tln([Trong bài toán sản xuất chip bán dẫn vi xử lý, mức lợi nhuận hàng tháng lớn nhất doanh nghiệp đạt được là bao nhiêu triệu đồng?],
    [1800],
    loigiai: [
        #step([Tính lợi nhuận cực đại])
        Hàm lợi nhuận: $L(x) = -0.5x^2 + 100x - 3200$.
        Đạt cực đại tại $x = 100$ nghìn chip.
        $ L(100) = -0.5(100)^2 + 100(100) - 3200 = 1800 text(" triệu đồng") $
    ]
)

// TLN 3 (Số lần tăng giá phòng resort)
#tln([Trong bài toán kinh doanh biệt thự nghỉ dưỡng, ban quản lý nên tăng giá thuê bao nhiêu lần để đạt lợi nhuận mỗi đêm là lớn nhất?],
    [17],
    loigiai: [
        #step([Xác định đỉnh parabol lợi nhuận])
        Hàm lợi nhuận: $L(x) = -200x^2 + 6800x + 160000$.
        Đạt cực đại tại:
        $ x = - 6800 / (2(-200)) = 17 text(" lần") $
    ]
)

// TLN 4 (Sản lượng cam tối đa)
#tln([Trong bài toán trang trại cam sành, tổng sản lượng cam lớn nhất hàng năm mà trang trại có thể thu hoạch được là bao nhiêu kilôgam?],
    [14450],
    loigiai: [
        #step([Tính sản lượng cực đại])
        Hàm sản lượng: $P(x) = -2x^2 + 140x + 12000$.
        Đạt cực đại tại $x = 35$ cây trồng thêm trên mỗi hecta.
        $ P(35) = -2(35)^2 + 140(35) + 12000 = 14450 text(" kg") $
    ]
)

// TLN 5 (Giá bán tối ưu sách)
#tln([Trong bài toán xuất bản sách tham khảo, mức giá bán tối ưu của mỗi cuốn sách để nhà xuất bản thu được lợi nhuận cao nhất là bao nhiêu nghìn đồng? (Nhập kết quả dưới dạng số thập phân)],
    [77.5],
    loigiai: [
        #step([Tìm giá bán tại đỉnh parabol])
        Hàm lợi nhuận: $L(p) = -40p^2 + 6200p - 200000$.
        Đạt cực đại tại:
        $ p = - 6200 / (2(-40)) = 77.5 text(" nghìn đồng") $
    ]
)

// TLN 6 (Doanh thu xe khách tối đa)
#tln([Trong bài toán công ty xe khách tuyến Hà Nội - Hải Phòng, doanh thu lớn nhất mỗi ngày mà công ty có thể thu về là bao nhiêu nghìn đồng?],
    [64000],
    loigiai: [
        #step([Tính doanh thu tối đa])
        Hàm doanh thu: $R(x) = -250x^2 + 2000x + 60000$.
        Đạt cực đại tại $x = 4$ lần giảm giá.
        $ R(4) = -250(4)^2 + 2000(4) + 60000 = -4000 + 8000 + 60000 = 64000 text(" nghìn đồng") $
    ]
)

] // end make-questions

#make-questions()
