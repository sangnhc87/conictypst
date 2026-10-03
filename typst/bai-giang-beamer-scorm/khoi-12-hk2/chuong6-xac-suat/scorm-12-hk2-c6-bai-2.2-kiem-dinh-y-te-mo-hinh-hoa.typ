// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C6-BÀI 2.2: MÔ HÌNH HOÁ XÁC SUẤT TRONG Y TẾ
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 2.2: ỨNG DỤNG Y TẾ & THỰC TẾ",
  subtitle:    "Nghịch lý Test nhanh, Bệnh hiếm & Máy phát hiện nói dối",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Ám ảnh từ tờ Giấy Xét Nghiệm")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Thực tế Lâm sàng:]
    
    Bạn đi khám sức khoẻ tổng quát và làm một cái Test nhanh tầm soát một căn Bệnh hiếm X (tỉ lệ mắc trong dân số chỉ là $1 / 10000$, tức là $0.01%$).
    
    Bác sĩ nói: "Cái Test này cực xịn! Độ nhạy là $99%$ (nếu có bệnh, test chắc chắn 99% ra Dương tính). Độ đặc hiệu là $99%$ (nếu khoẻ mạnh, test chắc chắn 99% ra Âm tính, tức là chỉ bị Dương tính giả 1%)."
    
    Hôm sau, bạn nhận giấy kết quả: *DƯƠNG TÍNH*. 
    Trời sụp đổ! Bạn hoảng sợ và nghĩ mình 99% sắp chết. 
    *Sự thật: Bác sĩ Toán học (Bayes) sẽ cứu bạn. Xác suất bạn THỰC SỰ mắc bệnh khi cầm kết quả Dương tính chỉ chưa tới 1%! Tại sao?*
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Phân tích Nghịch lý Bệnh hiếm (Base Rate Fallacy)")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Ta dùng Sơ đồ cây để bóc trần sự thật:*
    - Dân số $100%$. Bệnh: $0.0001$. Không Bệnh: $0.9999$.
    - Nếu Bệnh ($0.0001$) -> Test Dương tính ($99%$) -> Xác suất: $0.0001 times 0.99 = 0.000099$.
    - Nếu Không Bệnh ($0.9999$) -> Test Dương tính (Dương tính giả $1%$) -> Xác suất: $0.9999 times 0.01 = 0.009999$.
    
    *Tổng số người Test Dương Tính (Mọi trường hợp):*
    $P("Dương tính") = 0.000099 + 0.009999 = 0.010098$.
    
    *Xác suất Thực Sự Có Bệnh khi cầm kết quả Dương tính:*
    $P("Bệnh" | "Dương tính") = 0.000099 / 0.010098 approx 0.0098 (0.98%)$.
    
    => Tức là có tới $99.02%$ bạn KHÔNG HỀ CÓ BỆNH, đó chỉ là Dương tính Giả (False Positive) bị thổi phồng bởi tỉ lệ mắc bệnh tự nhiên quá thấp (Base Rate Fallacy)!
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Bài toán Máy phát hiện nói dối")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *Kịch bản Hình sự:* Trong một công ty có $1000$ nhân viên, có duy nhất 1 kẻ trộm ($0.1%$). 
    Cảnh sát dùng Máy phát hiện nói dối có độ chính xác $95%$ (nếu nói dối máy báo 95% đỏ, nếu nói thật máy báo 95% xanh). 
    Máy báo ĐỎ với anh nhân viên A. Xác suất anh ta LÀ KẺ TRỘM THỰC SỰ là bao nhiêu?
    
    *Giải bằng Bayes:*
    $P("Trộm") = 0.001$. $P("Oan") = 0.999$.
    - Nhánh 1 (Trộm -> Báo Đỏ): $0.001 times 0.95 = 0.00095$
    - Nhánh 2 (Oan -> Báo Đỏ sai): $0.999 times 0.05 = 0.04995$
    Xác suất là trộm: $0.00095 / (0.00095 + 0.04995) approx 0.0186 (1.86%)$.
    => Máy phát hiện nói dối VÔ DỤNG khi tìm kim đáy bể! Bắt oan $98%$ người vô tội!
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Trong y tế, thuật ngữ "Dương tính giả" (False Positive) nghĩa là gì?],
  (
    [Test chỉ ra bạn có bệnh, nhưng thực tế bạn đang khoẻ mạnh.],
    [Test chỉ ra bạn khoẻ mạnh, nhưng thực tế bạn đang mắc bệnh.],
    [Máy xét nghiệm bị hư hỏng 100%.],
    [Người bệnh giả vờ bệnh.]
  ),
  correct: 1,
  num: 1,
  de: "Phần Luyện Tập Y Tế",
  loigiai: [
    Dương (Positive) = Test báo Bệnh. Giả (False) = Báo sai. 
    Vậy Dương tính giả là trường hợp người hoàn toàn khoẻ mạnh nhưng xui xẻo máy lại "gạch 2 vạch".
  ]
)

#lt-tn(
  [Trong bài toán Bệnh hiếm (tỉ lệ $1/10000$), tại sao dù máy xét nghiệm đúng tới $99%$, nhưng cầm giấy Dương tính thì khả năng mắc bệnh chỉ chưa tới $1%$?],
  (
    [Vì số người khoẻ mạnh trong dân số quá ĐÔNG, $1%$ dương tính giả của số đông này áp đảo hoàn toàn số người thực sự mắc bệnh.],
    [Vì công thức Bayes tính sai.],
    [Vì bác sĩ đọc nhầm kết quả.],
    [Vì máy $99%$ thực ra là đồ dỏm.]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập Logic",
  loigiai: [
    Đây là cốt lõi của Base Rate Fallacy (Nguỵ biện tỉ lệ nền). $1%$ sai sót của $9999$ người khoẻ mạnh (sinh ra $100$ người bị báo bệnh oan) hoàn toàn "nuốt chửng" $1$ người thực sự có bệnh. Vậy trong $101$ người cầm giấy Dương tính, chỉ có $1$ người thực sự bệnh. Xác suất là $1/101 approx 0.99%$.
  ]
)

#lt-tn(
  [Để khắc phục nghịch lý trên và cứu bệnh nhân khỏi hoảng loạn, bác sĩ thường làm gì ngay sau khi có 1 kết quả Test nhanh Dương tính?],
  (
    [Yêu cầu làm Test chuyên sâu lần 2 (như PCR hoặc sinh thiết) để tính lại Bayes trên tập mẫu nhỏ hơn.],
    [Lập tức cho uống thuốc độc.],
    [Cách ly ngay lập tức.],
    [Vứt kết quả xét nghiệm đi.]
  ),
  correct: 1,
  num: 3,
  de: "Phần Luyện Tập Xử Lý Lâm Sàng",
  loigiai: [
    Lần 1 test dương tính, tỉ lệ mắc bệnh (Base rate mới) lúc này tăng lên $1%$. Nếu làm Test lần 2, tỉ lệ mắc bệnh nếu có kết quả dương tính sẽ nhảy vọt lên $50%$, lần 3 sẽ nhảy lên $99%$. Đó là lý do trong y tế luôn yêu cầu Xét Nghiệm Khẳng Định (Confirm Test)!
  ]
)

#lt-tn(
  [Một công ty kiểm định chất lượng tivi. Lô hàng có $5%$ tivi hỏng. Robot kiểm tra có độ chính xác $90%$ (báo đúng hỏng $90%$, báo đúng tốt $90%$). Robot vừa loại 1 tivi ra với kết quả "BÁO HỎNG". Tivi này hỏng thật với xác suất bao nhiêu?],
  (
    [$32.14%$],
    [$90%$],
    [$50%$],
    [$5%$]
  ),
  correct: 1,
  num: 4,
  de: "Phần Luyện Tập Quality Control",
  loigiai: [
    $P("Hỏng") = 0.05$; $P("Tốt") = 0.95$.
    Nhánh hỏng thật: $0.05 times 0.9 = 0.045$.
    Nhánh hỏng giả (Tốt nhưng báo hỏng): $0.95 times 0.1 = 0.095$.
    Tổng báo hỏng = $0.045 + 0.095 = 0.140$.
    Xác suất hỏng thật = $0.045 / 0.140 approx 0.3214$ (32.14%). Robot gạt oan rất nhiều tivi xịn!
  ]
)

#lt-tn(
  [Trong các ứng dụng phân tích rủi ro, "Âm tính giả" (False Negative) đặc biệt nguy hiểm trong trường hợp nào?],
  (
    [Sàng lọc ung thư, vì bệnh nhân ung thư bị máy báo khoẻ mạnh, dẫn đến lỡ thời gian vàng chữa trị.],
    [Hệ thống lọc thư rác, một email bình thường bị ném vào mục Spam.],
    [Bị test dương tính giả COVID và bắt phải cách ly ở nhà 14 ngày.],
    [Nhận diện khuôn mặt mở khoá điện thoại bị sai.]
  ),
  correct: 1,
  num: 5,
  de: "Phần Luyện Tập Ứng Dụng",
  loigiai: [
    Âm tính (Negative) = Báo không bệnh. Giả (False) = Báo sai. 
    Tức là Bị bệnh mà báo là Khoẻ. Đối với ung thư hoặc an ninh (bỏ lọt khủng bố), đây là thảm hoạ nghiêm trọng nhất! (Trong Thống kê gọi là Sai lầm loại II).
  ]
)
