// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C6-BÀI 2.1: SƠ ĐỒ CÂY CHUYÊN SÂU
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 2.1: SƠ ĐỒ CÂY CHUYÊN SÂU",
  subtitle:    "Mô hình hoá Quy trình Đa Bước & Phân nhánh Xác suất",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Tại sao phải vẽ cây?")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Thực tế Chuỗi Sự kiện:]
    
    Hãy tưởng tượng quá trình sản xuất một con chip điện thoại:
    - Bước 1: Máy cắt Silicon (Có 95% thành công, 5% lỗi mẻ góc).
    - Bước 2: Máy khắc Laser (Nếu mẻ góc, 80% sẽ bị gãy; Nếu không mẻ, chỉ có 1% gãy).
    - Bước 3: Đóng gói (Tỉ lệ hỏng lúc đóng gói là 2%).
    
    *Câu hỏi:* Xác suất để ra được một con chip hoàn hảo là bao nhiêu?
    => *Giải pháp:* Một rừng các nhánh rẽ. Bạn không thể tính nhẩm! Phải dùng *Sơ đồ cây (Tree Diagram)* để theo dấu từng số phận của con chip.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Nguyên lý Vẽ & Tính Sơ đồ Cây")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Quy tắc Xây dựng Cây:*
    1. *Nút (Node):* Thể hiện một trạng thái hoặc biến cố.
    2. *Nhánh (Branch):* Từ một nút tẽ ra nhiều nhánh cho các trường hợp tiếp theo. Trọng số trên nhánh là *Xác suất có điều kiện*!
    3. *Quy tắc NHÂN (Dọc theo nhánh):* Để đi từ Gốc đến Ngọn (hoàn thành chuỗi sự kiện), ta *NHÂN* tất cả xác suất trên đường đi đó.
       $P(A cap B cap C) = P(A) dot P(B|A) dot P(C | A cap B)$
    4. *Quy tắc CỘNG (Các ngọn cây):* Nếu có nhiều ngọn cùng dẫn đến một kết quả (VD: "Chip lỗi" xuất hiện ở nhiều ngọn khác nhau), ta *CỘNG* các ngọn đó lại.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Bài toán: Giải cứu Con tin (SWAT)")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *Kịch bản Hành động:* Đội SWAT chuẩn bị đột kích. Có 2 lối vào: Cửa chính (30%) và Cửa hậu (70%).
    - Nếu vào Cửa chính, có 60% bị phát hiện ngay, 40% an toàn.
    - Nếu vào Cửa hậu, có 20% bị phát hiện ngay, 80% an toàn.
    - Nếu "An toàn", xác suất giải cứu thành công là 90%.
    - Nếu "Bị phát hiện", xác suất giải cứu thành công chỉ còn 40%.
    
    *Tỉ lệ Giải cứu thành công Toàn cuộc?*
    *(Hãy phân nhánh: Cửa -> Trạng thái -> Kết quả)*
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Tại mỗi nút chia nhánh của sơ đồ cây, tổng các xác suất trên các nhánh con tỏa ra từ nút đó phải bằng bao nhiêu?],
  (
    [$100%$ (hay $1.0$)],
    [Bất kỳ giá trị nào tuỳ đề bài],
    [$0%$],
    [Phải bằng xác suất của nhánh trước đó]
  ),
  correct: 1,
  num: 1,
  de: "Phần Luyện Tập Lý Thuyết Cây",
  loigiai: [
    Tổng các nhánh con sinh ra từ một nút đại diện cho một Hệ đầy đủ các biến cố (ví dụ: Trúng / Trượt, Tốt / Xấu / Vừa). Tổng xác suất của chúng luôn phải bằng $1.0$ (100%).
  ]
)

#lt-tn(
  [Quay lại bài toán SWAT: Nhánh "Cửa Hậu -> Bị phát hiện -> Cứu Thành Công" có xác suất bằng bao nhiêu?],
  (
    [$0.70 times 0.20 times 0.40 = 0.056$ (5.6%)],
    [$0.70 + 0.20 + 0.40 = 1.3$],
    [$0.70 times 0.20 = 0.14$],
    [$0.40$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập Sơ Đồ Nhánh",
  loigiai: [
    Đi dọc theo nhánh:
    - Vào cửa hậu: $P("Hậu") = 0.7$
    - Bị phát hiện (khi đã vào cửa hậu): $P("Bị lộ" | "Hậu") = 0.2$
    - Cứu thành công (khi đã bị phát hiện): $P("Cứu" | "Bị lộ") = 0.4$
    Quy tắc nhân dọc nhánh: $0.7 times 0.2 times 0.4 = 0.056$.
  ]
)

#lt-tn(
  [Bạn được cấp một số liệu: "Nhánh Cửa Chính -> An toàn -> Cứu Thành Công" có xác suất là $0.3 times 0.4 times 0.9 = 0.108$. Kịch bản SWAT này có tổng cộng bao nhiêu nhánh dẫn đến kết quả "Cứu Thành Công"?],
  (
    [2 nhánh],
    [3 nhánh],
    [4 nhánh],
    [1 nhánh]
  ),
  correct: 3,
  num: 3,
  de: "Phần Luyện Tập Sơ Đồ Nhánh",
  loigiai: [
    Cây này có 4 ngọn cùng dẫn đến "Cứu thành công":
    1. Chính -> Lộ -> Cứu ($0.3 times 0.6 times 0.4 = 0.072$)
    2. Chính -> An toàn -> Cứu ($0.3 times 0.4 times 0.9 = 0.108$)
    3. Hậu -> Lộ -> Cứu ($0.7 times 0.2 times 0.4 = 0.056$)
    4. Hậu -> An toàn -> Cứu ($0.7 times 0.8 times 0.9 = 0.504$)
  ]
)

#lt-tn(
  [Tổng xác suất Giải cứu thành công toàn cuộc của đội SWAT là bao nhiêu? (Cộng 4 ngọn cây ở câu trên lại)],
  (
    [$0.072 + 0.108 + 0.056 + 0.504 = 0.740$ (74%)],
    [$100%$],
    [$50%$],
    [$90%$]
  ),
  correct: 1,
  num: 4,
  de: "Phần Luyện Tập SWAT",
  loigiai: [
    Áp dụng Quy tắc Cộng cho các ngọn cây (Xác suất Toàn phần):
    $P("Thành công") = 0.072 + 0.108 + 0.056 + 0.504 = 0.740$.
    Kết luận: Đội SWAT có $74%$ cơ hội hoàn thành nhiệm vụ!
  ]
)

#lt-tn(
  [Một bệnh nhân đi khám có $30%$ mắc bệnh A, $70%$ mắc bệnh B (không thể mắc cả 2). Bệnh A có tỉ lệ chữa khỏi là $90%$, bệnh B tỉ lệ chữa khỏi là $50%$. Nếu bệnh nhân ĐÃ CHỮA KHỎI, xác suất người này từng mắc bệnh B là bao nhiêu? (Dùng Bayes)],
  (
    [$(0.7 times 0.5) / (0.3 times 0.9 + 0.7 times 0.5) = 0.35 / 0.62 approx 56.45%$],
    [$70%$],
    [$50%$],
    [$0.35$]
  ),
  correct: 1,
  num: 5,
  de: "Phần Luyện Tập Cây Ngược (Bayes)",
  loigiai: [
    $P("Khỏi") = 0.3 times 0.9 + 0.7 times 0.5 = 0.27 + 0.35 = 0.62$.
    $P("Bệnh B" | "Khỏi") = (P("Bệnh B") dot P("Khỏi" | "Bệnh B")) / P("Khỏi") = (0.7 times 0.5) / 0.62 = 0.35 / 0.62 approx 0.5645$.
  ]
)
