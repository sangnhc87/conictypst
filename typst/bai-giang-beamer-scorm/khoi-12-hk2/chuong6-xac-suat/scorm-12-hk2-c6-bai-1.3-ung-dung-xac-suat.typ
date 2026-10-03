// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C6-BÀI 1.3: ỨNG DỤNG XÁC SUẤT TRONG THỰC TẾ
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 1.3: ỨNG DỤNG XÁC SUẤT THỰC TẾ",
  subtitle:    "Từ Kinh Doanh đến Khoa Học Máy Tính",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Bộ lọc Spam Email")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Bài toán Khoa học máy tính:]
    
    Làm sao Gmail biết được một bức thư bạn vừa nhận là "Thư rác" (Spam) để tự động bỏ vào thùng rác?
    
    Nó không có mắt để đọc hiểu! Thay vào đó, AI của Google sử dụng *Định lý Bayes* (gọi là Naive Bayes Classifier). Nó thống kê:
    - Xác suất xuất hiện từ "Trúng thưởng" trong thư rác là $90%$.
    - Xác suất xuất hiện từ "Trúng thưởng" trong thư bình thường là $1%$.
    
    Khi có một bức thư mới chứa từ "Trúng thưởng", máy tính dùng định lý Bayes lật ngược lại: Tính xác suất đây là thư rác *biết rằng* nó có từ "Trúng thưởng".
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Ứng dụng trong Bảo hiểm và Kinh doanh")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Công ty Bảo hiểm định giá bồi thường:*
    Một công ty bảo hiểm xe máy thống kê:
    - Khách hàng nam trẻ tuổi ($<25$ tuổi) chiếm $20%$ tổng lượng khách.
    - Nhóm này có xác suất gây tai nạn trong năm là $15%$.
    - Các nhóm khác chiếm $80%$, xác suất gây tai nạn chỉ là $3%$.
    
    Dùng *Xác suất Toàn phần*, công ty tính được Xác suất một khách hàng bất kỳ gây tai nạn là: 
    $ P("Tai nạn") = 0.20 times 0.15 + 0.80 times 0.03 = 0.03 + 0.024 = 0.054 (5.4%) $
    Từ con số $5.4%$ này, họ sẽ tính toán mức thu phí bảo hiểm để có lãi!
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Mô hình Đánh giá Rủi ro Tín dụng")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    Ngân hàng muốn duyệt hồ sơ vay tiền.
    - $P("Trễ nợ") = 5%$. 
    - Nếu một người hay "Trả trễ", xác suất họ từng có "Lịch sử tín dụng xấu" là $80%$.
    - Nếu một người "Trả đúng hạn", xác suất họ có "Lịch sử tín dụng xấu" (do xui xẻo trước đây) là $10%$.
    
    *Câu hỏi của ngân hàng:* Một ông khách mới bước vào, tra hệ thống thấy "Lịch sử xấu". Xác suất ổng sẽ "Trễ nợ" là bao nhiêu?
    
    *Dùng Bayes để ra quyết định sinh tử cho khoản vay!*
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Thuật toán "Naive Bayes" được sử dụng cực kỳ phổ biến trong lĩnh vực nào sau đây?],
  (
    [Xử lý hình ảnh 3D],
    [Phân loại văn bản (như lọc thư rác, phân tích cảm xúc tin nhắn)],
    [Lập trình game],
    [Mã hoá bảo mật]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập Ứng Dụng",
  loigiai: [
    Thuật toán Naive Bayes là nền tảng của Machine Learning sơ khai để phân loại văn bản (Text Classification) bằng cách dựa vào xác suất xuất hiện của các từ khóa.
  ]
)

#lt-tn(
  [Trở lại bài toán Ngân hàng: $P("Trễ") = 0.05$, $P("Xấu" | "Trễ") = 0.8$, $P("Xấu" | "Đúng hạn") = 0.10$. Tính xác suất gặp khách "Lịch sử Xấu" nói chung (Toàn phần)?],
  (
    [$0.135$],
    [$0.20$],
    [$0.90$],
    [$0.05$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập Ngân Hàng",
  loigiai: [
    $P("Xấu") = P("Trễ") dot P("Xấu"|"Trễ") + P("Đúng hạn") dot P("Xấu"|"Đúng hạn")$
    $= 0.05 times 0.8 + 0.95 times 0.10 = 0.04 + 0.095 = 0.135$ (tức 13.5%).
  ]
)

#lt-tn(
  [Tiếp tục bài toán: Một khách bị tra ra "Lịch sử Xấu". Tính xác suất khách này sẽ "Trễ nợ"? (Dùng Bayes)],
  (
    [$80%$],
    [$29.6%$],
    [$13.5%$],
    [$40%$]
  ),
  correct: 2,
  num: 3,
  de: "Phần Luyện Tập Ngân Hàng",
  loigiai: [
    $P("Trễ" | "Xấu") = (P("Trễ") dot P("Xấu"|"Trễ")) / P("Xấu")$
    $= 0.04 / 0.135 approx 0.2963$ (tức 29.6%).
    Mặc dù có lịch sử xấu, xác suất thực sự bùm nợ chỉ khoảng $30%$.
  ]
)

#lt-tn(
  [Một công ty có 3 kho hàng A, B, C. Tỉ lệ hàng lỗi từ các kho lần lượt là 1%, 2%, 3%. Kho A cung cấp 50% hàng, Kho B 40%, Kho C 10%. Nếu mua 1 món hàng bị lỗi, khả năng cao nhất nó xuất phát từ kho nào?],
  (
    [Kho A],
    [Kho B],
    [Kho C],
    [Không xác định được]
  ),
  correct: 2,
  num: 4,
  de: "Phần Luyện Tập Kinh Doanh",
  loigiai: [
    So sánh tử số của công thức Bayes (Phần đóng góp rủi ro của từng kho):
    A: $0.50 times 0.01 = 0.005$
    B: $0.40 times 0.02 = 0.008$ (Cao nhất)
    C: $0.10 times 0.03 = 0.003$
    Vậy Kho B là nơi có khả năng xuất phát món hàng lỗi cao nhất.
  ]
)

#lt-tn(
  [Điều gì khiến Định lý Bayes trở thành công cụ quan trọng nhất trong Kỷ nguyên Trí tuệ Nhân tạo (AI)?],
  (
    [Nó có thể tính toán nhanh hơn máy tính.],
    [Nó cho phép máy tính "cập nhật" lại niềm tin (xác suất) mỗi khi nhận được "dữ liệu mới" (điều kiện mới).],
    [Nó là định lý duy nhất dùng trong toán học.],
    [Nó giúp vẽ đồ thị 3D đẹp hơn.]
  ),
  correct: 2,
  num: 5,
  de: "Phần Luyện Tập AI",
  loigiai: [
    Cốt lõi của AI và Machine Learning là "Học từ dữ liệu". Định lý Bayes chính là công thức toán học mô tả quá trình học đó: Xác suất (niềm tin ban đầu) sẽ được điều chỉnh/cập nhật liên tục khi có Evidence (chứng cứ/dữ liệu) mới.
  ]
)
