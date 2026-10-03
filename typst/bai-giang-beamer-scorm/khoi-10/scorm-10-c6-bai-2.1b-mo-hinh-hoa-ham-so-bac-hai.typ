#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "../../../public/hdsd/typst/sang-math-geom.typ": *

#show: lecture-theme.with(
  title: [Hàm Số Bậc Hai — Chuyên Sâu],
  subtitle: [TOÁN 10 — ỨNG DỤNG THỰC TẾ & MÔ HÌNH HOÁ PARABOL],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG MÔ HÌNH HOÁ])

// ════════════════════════════════════════════════
// PHẦN I: BÀI TOÁN TỐI ƯU HÓA KINH TẾ
// ════════════════════════════════════════════════
#lt-section-link("sec-kinh-te", "💰", [I. Tối Ưu Hóa Kinh Tế — Lợi Nhuận Cực Đại])

#lt-slide-back(title: "💰 Bài Toán Khách Sạn & Giá Phòng (Kinh Tế Vi Mô)")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Mô hình định giá")[
        *Thực tế:* Một khách sạn có $50$ phòng. Hiện tại cho thuê với giá $400,000$ VNĐ/ngày thì kín phòng. 
        Phân tích thị trường cho thấy: Cứ tăng giá thêm $20,000$ VNĐ/ngày, sẽ có *1 phòng bị bỏ trống*.
        *Câu hỏi:* Phải định giá phòng bao nhiêu để doanh thu cao nhất?
      ]
      #v(0.15em)
      #lt-important(title: "Thiết lập biến số")[
        - Gọi $x$ là số lần tăng giá $20,000$ VNĐ ($x > 0$).
        - Giá phòng mới: $P(x) = 400 + 20x$ (nghìn VNĐ).
        - Số phòng thuê: $Q(x) = 50 - x$ (phòng).
      ]
    ],
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#f97316"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#c2410c"), size: 10.5pt)[Hàm Doanh Thu $R(x)$]\
        #v(0.2em)
        #text(size: 8.5pt)[
          $ R(x) &= P(x) dot Q(x) \
               &= (400 + 20x)(50 - x) \
               &= -20x^2 + 600x + 20000 $
          Đây là parabol quay bề lõm xuống ($a = -20 < 0$).
          Đỉnh đạt tại: $x_I = - b / (2a) = - 600 / (-40) = 15$.
          
          *Kết luận:* Tăng giá $15$ lần.
          Giá phòng tối ưu: $400 + 15(20) = 700$ nghìn/ngày.
          Doanh thu Max: $24,500,000$ VNĐ.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: KIẾN TRÚC & VÒM CẦU
// ════════════════════════════════════════════════
#lt-section-link("sec-kien-truc", "🌉", [II. Kiến Trúc — Phân Tích Cầu Vòm Parabol])

#lt-slide-back(title: "🌉 Gắn Hệ Trục Tọa Độ Cầu Vòm Parabol")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "Bài toán cái cổng Bách Khoa")[
        Một cổng vòm trường Đại học Bách Khoa có hình Parabol. Chiều cao từ đỉnh vòm xuống mặt đất là $h = 8$ m. Bề rộng chân vòm là $d = 10$ m. 
        Một chiếc xe tải cao $5$ m cần chạy qua vòm. Hỏi chiều rộng của xe tối đa là bao nhiêu để không quẹt trúng cổng?
      ]
      #v(0.1em)
      #lt-tip(title: "Kỹ năng chọn hệ trục")[
        - *Cách 1:* Chọn gốc $O$ tại chân vòm trái.
        - *Cách 2:* Chọn gốc $O$ tại tâm mặt đất (Dễ nhất). 
          Khi đó đỉnh $I(0; 8)$ và chân vòm $(\pm 5; 0)$.
      ]
    ],
    [
      #align(center)[
        #context cetz.canvas({
          import cetz.draw: *
          line((-6, 0), (6, 0), stroke: 0.6pt, mark: (end: "stealth")) // Trục x
          line((0, -0.5), (0, 9), stroke: 0.6pt, mark: (end: "stealth")) // Trục y
          
          // Vẽ parabol y = -8/25 x^2 + 8
          line(..range(-50, 51).map(t => {
            let x = t / 10;
            (x, -8.0/25.0 * calc.pow(x, 2) + 8.0)
          }), stroke: 2pt + rgb("#b91c1c"))
          
          // Vẽ xe tải
          rect((-3.06, 0), (3.06, 5), fill: rgb(59, 130, 246, 128), stroke: 1pt + rgb("#2563eb"))
          
          // Điểm
          circle((0, 8), radius: 2.2pt, fill: black)
          content((0, 8.4), text(size: 8pt)[$I(0; 8)$])
          content((-5, -0.3), text(size: 8pt)[$-5$])
          content((5, -0.3), text(size: 8pt)[$5$])
          content((-3.06, 5.3), text(size: 8pt)[$A(-x; 5)$])
          content((3.06, 5.3), text(size: 8pt)[$B(x; 5)$])
        })
      ]
    ]
  )
]

#lt-slide-back(title: "🌉 Lời Giải Chi Tiết Cổng Bách Khoa")[
  #lt-definition(title: "Thực thi giải pháp")[
    1. *Phương trình Parabol:* Do đỉnh $I(0; 8)$ thuộc trục $O y$, parabol có dạng: $y = a x^2 + 8$.
    2. Chân cổng $M(5; 0)$ thuộc đồ thị nên: 
       $ a(5)^2 + 8 = 0 <=> 25a = -8 <=> a = - 8 / 25 $
       Vậy $(P): y = - 8 / 25 x^2 + 8$.
    3. *Xét xe tải:* Trần xe có y = 5. Giao điểm của xe với cổng là tọa độ $x$ thỏa mãn:
       $ 5 = - 8 / 25 x^2 + 8 <=> 8 / 25 x^2 = 3 <=> x^2 = 75 / 8 = 9.375 $
       $=> x approx 3.06$ m.
    4. *Bề rộng xe:* Bề rộng tối đa là $2x = 2(3.06) = 6.12$ m.
  ]
]

// ════════════════════════════════════════════════
// Luyện tập TN
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập Thực Tiễn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — MÔ HÌNH HÓA PARABOL],
  questions: (
    (num: 1, type: "TN", desc: [Quỹ đạo đạn bay]),
    (num: 2, type: "TN", desc: [Tối ưu năng suất cây trồng]),
    (num: 3, type: "TN", desc: [Cổng vòm Parabol]),
    (num: 4, type: "TN", desc: [Hàng rào hình chữ nhật]),
    (num: 5, type: "DS", desc: [Động học vật ném xiên]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Một quả đạn pháo bắn từ mặt đất với quỹ đạo $(P): y = -1/50 x^2 + 2x$, trong đó $x$ là tầm xa, $y$ là độ cao (tính bằng mét). Quả đạn đạt độ cao tối đa là bao nhiêu?],
  (
    [$50$ m],
    [$100$ m],
    [$40$ m],
    [$75$ m],
  ),
  correct: 0,
  num: 1,
  de: "Mô hình quỹ đạo vật lý",
  loigiai: [
    Parabol có $a = -1/50$, $b = 2$.
    - Hoành độ đỉnh: $x_I = - b / (2a) = - 2 / (-2/50) = 50$ (m).
    - Độ cao tối đa: $y_I = -1/50 (50)^2 + 2(50) = -50 + 100 = 50$ (m).
    Chọn đáp án *A*.
  ]
)

#lt-tn(
  [Một khu vườn đang trồng $40$ cây bưởi. Trung bình mỗi cây cho $300$ quả. Khảo sát sinh học cho thấy: Cứ trồng thêm 1 cây mới, do cạnh tranh dinh dưỡng, năng suất *mỗi cây* trong vườn giảm $5$ quả. Nên trồng thêm bao nhiêu cây để tổng sản lượng lớn nhất?],
  (
    [$10$ cây],
    [$15$ cây],
    [$5$ cây],
    [$20$ cây],
  ),
  correct: 0,
  num: 2,
  de: "Tối ưu hóa nông nghiệp",
  loigiai: [
    Gọi $x$ là số cây bưởi trồng thêm ($x > 0$).
    - Số cây trong vườn: $40 + x$.
    - Năng suất một cây: $300 - 5x$.
    - Sản lượng: $S(x) = (40 + x)(300 - 5x) = -5x^2 + 100x + 12000$.
    Parabol đạt đỉnh tại $x = - 100 / (2(-5)) = 10$.
    Nên trồng thêm 10 cây. Chọn *A*.
  ]
)

#lt-tn(
  [Một cái cổng hình parabol có bề rộng $6$ m và chiều cao $4$ m. Một chiếc xe tải có chiều ngang $2$ m đi qua cổng, xe phải đi chính giữa để an toàn. Chiều cao tối đa của xe tải là bao nhiêu để lọt qua cổng?],
  (
    [$35 / 9$ m],
    [$32 / 9$ m],
    [$3.5$ m],
    [$2.8$ m],
  ),
  correct: 1,
  num: 3,
  de: "Kiến trúc Parabol",
  loigiai: [
    Chọn hệ trục $O x y$ với đỉnh cổng là $I(0; 4)$ và chân cổng ở $(\pm 3; 0)$.
    Phương trình cổng: $y = a x^2 + 4$.
    Đi qua $(3; 0) => 9a + 4 = 0 => a = -4/9$.
    Vậy $y = -4/9 x^2 + 4$.
    Xe tải rộng 2m đi giữa, nên hai mép xe ở $x = -1$ và $x = 1$.
    Độ cao cổng tại $x = 1$ là $y = -4/9 (1)^2 + 4 = 32/9$ m.
    Chiều cao xe tối đa là $32/9$ m. Chọn *B*.
  ]
)

#lt-tn(
  [Bác An có $60$ m hàng rào, muốn rào một mảnh đất hình chữ nhật. Một cạnh của chữ nhật dựa vào bờ sông (không cần rào). Diện tích lớn nhất của mảnh đất là:],
  (
    [$450 m^2$],
    [$400 m^2$],
    [$900 m^2$],
    [$225 m^2$],
  ),
  correct: 0,
  num: 4,
  de: "Hình học và cực trị",
  loigiai: [
    Gọi chiều rộng là $x$, chiều dài là $y$. Ta có $2x + y = 60 => y = 60 - 2x$.
    Diện tích $S = x y = x(60 - 2x) = -2x^2 + 60x$.
    $x_I = -60 / (-4) = 15 => S_max = 15(60 - 30) = 450$.
    Chọn *A*.
  ]
)

#lt-ds(
  [Một vận động viên ném lao. Độ cao $h$ (m) của lao so với mặt đất sau $t$ giây bay được mô hình hóa bởi hàm số: $h(t) = -5t^2 + 20t + 1.8$.],
  (
    [Lao được ném ra từ độ cao $1.8$ mét so với mặt đất.],
    [Lao đạt độ cao cực đại tại thời điểm $t = 2$ giây.],
    [Độ cao lớn nhất của ngọn lao là $21.8$ mét.],
    [Sau $4$ giây kể từ khi ném, lao rơi chạm đất.],
  ),
  correct: "1110",
  num: 5,
  de: "Động học rơi tự do",
  loigiai: [
    - a) *Đúng:* Tại $t=0$, $h(0) = 1.8$ m.
    - b) *Đúng:* Đỉnh $t = -20 / (2(-5)) = 2$ giây.
    - c) *Đúng:* $h_max = h(2) = -5(4) + 20(2) + 1.8 = 21.8$ m.
    - d) *Sai:* Giải $h(t) = 0 <=> -5t^2 + 20t + 1.8 = 0$. Bấm máy $t approx 4.088$ s, không phải đúng $4$ giây. Tại $t=4$, $h(4) = 1.8$ m (lao trở lại độ cao ném).
  ]
)
