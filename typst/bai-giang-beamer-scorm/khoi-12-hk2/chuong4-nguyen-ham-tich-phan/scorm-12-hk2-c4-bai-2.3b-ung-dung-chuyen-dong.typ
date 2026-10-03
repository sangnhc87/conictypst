// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C4-BÀI 2.3B: ỨNG DỤNG VẬT LÝ - CHUYỂN ĐỘNG & GIA TỐC
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 2.3B: ỨNG DỤNG VẬT LÝ (ĐỘNG HỌC)",
  subtitle:    "Phân tích Bài toán Kẹt xe & Phanh gấp Ô tô",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Khoảng cách an toàn")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Thực tế Giao thông:]
    
    Bạn đang lái xe trên cao tốc với vận tốc $100 "km/h"$. Đột nhiên, chiếc xe tải phía trước cách bạn $50"m"$ phanh gấp và dừng hẳn.
    
    Bạn đạp phanh ngay lập tức. Xe của bạn bắt đầu giảm tốc, nhưng không dừng lại ngay được mà trượt thêm một đoạn đường dài trước khi khét lẹt dừng hẳn.
    
    *Câu hỏi đặt ra:* Bạn có đâm vào đuôi chiếc xe tải kia không? Làm sao cảnh sát giao thông biết bạn đã chạy quá tốc độ từ vết trượt bánh xe?
    
    => *Giải pháp:* Tích phân hàm Vận tốc $v(t)$ sẽ cho ra Quãng đường trượt $S$!
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Mô hình Động học Cốt lõi")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Mối liên hệ giữa 3 đại lượng: Vị trí $s(t)$, Vận tốc $v(t)$, Gia tốc $a(t)$*
    1. *Đạo hàm (Đi tới):*
       $ v(t) = s'(t) $ (Vận tốc là tốc độ thay đổi vị trí)
       $ a(t) = v'(t) = s''(t) $ (Gia tốc là tốc độ thay đổi vận tốc)
       
    2. *Tích phân (Đi ngược):*
       $ v(t) = integral a(t) d t $ (Từ gia tốc suy ra vận tốc)
       $ s(t) = integral v(t) d t $ (Từ vận tốc suy ra quãng đường)
       
    *Lưu ý Quãng đường vs Độ dời:*
    - Độ dời (có thể âm): $integral_A^B v(t) d t$
    - Tổng Quãng đường thực tế (luôn dương): $integral_A^B |v(t)| d t$
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Bài toán Phanh gấp Ô tô")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *Ví dụ:* Ô tô đang chạy với vận tốc $20 "m/s"$ thì đạp phanh. Từ lúc đạp phanh, xe chuyển động chậm dần đều với gia tốc $a = -4 "m/s"^2$. Hỏi từ lúc đạp phanh đến khi dừng hẳn, xe đi thêm được bao nhiêu mét?
    
    *Giải:*
    - Gia tốc: $a(t) = -4$.
    - Vận tốc: $v(t) = integral (-4) d t = -4t + C$.
    - Lúc $t=0$ (bắt đầu phanh), $v(0) = 20 => C = 20$. Suy ra $v(t) = -4t + 20$.
    - Xe dừng hẳn khi $v(t) = 0 <=> -4t + 20 = 0 <=> t = 5$ (giây).
    - Quãng đường đi được trong 5s phanh:
      $ S = integral_0^5 v(t) d t = integral_0^5 (-4t + 20) d t = [-2t^2 + 20t]_0^5 = -50 + 100 = 50 ("m"). $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Một vật chuyển động với gia tốc $a(t) = 3t + 2 ("m/s"^2)$. Biết vận tốc ban đầu $v(0) = 5 "m/s"$. Hỏi hàm vận tốc $v(t)$ của vật là gì?],
  (
    [$v(t) = 3/2 t^2 + 2t + 5$],
    [$v(t) = 3$],
    [$v(t) = 3t^2 + 2t + 5$],
    [$v(t) = 3/2 t^2 + 2t$]
  ),
  correct: 1,
  num: 1,
  de: "Phần Luyện Tập Động Học",
  loigiai: [
    $v(t) = integral a(t) d t = integral (3t + 2) d t = 3/2 t^2 + 2t + C$.
    Do $v(0) = 5 => C = 5$.
    Vậy $v(t) = 3/2 t^2 + 2t + 5$.
  ]
)

#lt-tn(
  [Một con thỏ chạy với vận tốc $v(t) = cos(pi t) ("m/s")$. Từ lúc $t=0$ đến $t=2$ giây, độ dời của thỏ bằng bao nhiêu?],
  (
    [$0 " m"$],
    [$2 " m"$],
    [$4/pi " m"$],
    [$1/pi " m"$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập Động Học",
  loigiai: [
    Độ dời = $integral_0^2 v(t) d t = integral_0^2 cos(pi t) d t = [ (sin(pi t)) / pi ]_0^2 = (sin(2pi))/pi - (sin(0))/pi = 0$.
    *(Thỏ chạy tới rồi chạy lui về đúng vị trí ban đầu!)*
  ]
)

#lt-tn(
  [Tiếp tục bài toán thỏ ở trên: Từ $t=0$ đến $t=2$, độ dời là 0. Nhưng TỔNG QUÃNG ĐƯỜNG thực tế mà thỏ đã chạy mỏi chân là bao nhiêu?],
  (
    [$4/pi " m"$],
    [$0 " m"$],
    [$2 " m"$],
    [$2/pi " m"$]
  ),
  correct: 1,
  num: 3,
  de: "Phần Luyện Tập Động Học",
  loigiai: [
    Tổng quãng đường = $integral_0^2 |v(t)| d t = integral_0^2 |cos(pi t)| d t$.
    Bấm máy hoặc chia khoảng $0 -> 0.5$ (dương), $0.5 -> 1.5$ (âm), $1.5 -> 2$ (dương).
    Kết quả là $4/pi approx 1.27 " m"$. Thỏ có chạy, nên quãng đường phải lớn hơn 0!
  ]
)

#lt-tn(
  [Một tàu vũ trụ đang bay ở quỹ đạo bị hỏng động cơ. Tốc độ hiện tại là $1000 "m/s"$. Phi công kích hoạt tên lửa phụ để hãm phanh với gia tốc $a(t) = -20t ("m/s"^2)$. Sau bao lâu tàu sẽ dừng hẳn?],
  (
    [$10 " s"$],
    [$50 " s"$],
    [$100 " s"$],
    [$20 " s"$]
  ),
  correct: 1,
  num: 4,
  de: "Phần Luyện Tập Hàng Không",
  loigiai: [
    $v(t) = integral a(t) d t = -10 t^2 + C$.
    $v(0) = 1000 => C = 1000 => v(t) = -10 t^2 + 1000$.
    Tàu dừng khi $v(t) = 0 <=> -10 t^2 + 1000 = 0 <=> t^2 = 100 <=> t = 10 " s"$.
  ]
)

#lt-tn(
  [Trong 10 giây hãm phanh ở bài trên, tàu vũ trụ đã trượt thêm một quãng đường là bao nhiêu?],
  (
    [$20000/3 " m"$],
    [$5000 " m"$],
    [$10000 " m"$],
    [$15000 " m"$]
  ),
  correct: 1,
  num: 5,
  de: "Phần Luyện Tập Hàng Không",
  loigiai: [
    Quãng đường $S = integral_0^10 v(t) d t = integral_0^10 (-10 t^2 + 1000) d t$.
    $S = [-10/3 t^3 + 1000t]_0^10 = -10/3 (1000) + 10000 = 10000 - 3333.3 = 6666.67 = 20000/3 " m"$.
  ]
)
