# -*- coding: utf-8 -*-

CONTENT = r'''// TOÀN THƯ KHAI MỞ SƯ PHẠM TOÁN 12
// Thiết kế mỹ thuật hoàng gia, chuẩn in ấn xuất bản sư phạm cao cấp

#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 2.2cm, left: 2.5cm, right: 2cm),
  header: context {
    let page-num = counter(page).get().first()
    if page-num > 2 [
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        text(size: 8pt, fill: rgb("64748b"), style: "italic")[
          Đại Toàn Thư Khai Mở Sư Phạm Toán 12 — Tại Sao Học Bài Này?
        ],
        text(size: 8pt, fill: rgb("94a3b8"))[
          Chương trình GDPT 2018
        ]
      )
      #v(-0.2cm)
      #line(length: 100%, stroke: 0.4pt + rgb("cbd5e1"))
    ]
  },
  footer: context {
    let page-num = counter(page).get().first()
    if page-num > 2 [
      #line(length: 100%, stroke: 0.4pt + rgb("cbd5e1"))
      #v(-0.1cm)
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        text(size: 8.5pt, fill: rgb("64748b"))[
          Tủ Sách Khai Minh Sư Phạm Toán Học THPT Thế Hệ Mới
        ],
        text(size: 9pt, weight: "bold", fill: rgb("1e3a8a"))[
          Trang #page-num
        ]
      )
    ]
  }
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
  fill: rgb("0f172a"),
  spacing: 120%,
  lang: "vi"
)

#set par(
  justify: true,
  leading: 0.75em,
  first-line-indent: 1.5em
)

#set heading(numbering: (..nums) => {
  let n = nums.pos()
  if n.len() == 1 { "Chương " + str(n.at(0)) + ": " }
  else if n.len() == 2 { str(n.at(0)) + "." + str(n.at(1)) + " " }
  else { str(n.at(0)) + "." + str(n.at(1)) + "." + str(n.at(2)) + " " }
})

#show heading.where(level: 1): it => {
  v(1.2cm)
  rect(
    width: 100%,
    fill: rgb("1e1b4b"),
    radius: 6pt,
    inset: (x: 16pt, y: 14pt),
    outset: 0pt,
    stroke: none
  )[
    #text(fill: rgb("fbbf24"), size: 10pt, weight: "bold", tracking: 2pt)[
      ĐẠI TOÀN THƯ KHAI MỞ TRI THỨC TOÁN 12
    ]
    #v(4pt)
    #text(fill: white, size: 16pt, weight: "bold")[
      #it.body
    ]
  ]
  v(0.6cm)
}

#show heading.where(level: 2): it => {
  v(0.6cm)
  block(
    width: 100%,
    stroke: (left: 4pt + rgb("b45309")),
    inset: (left: 12pt, y: 4pt),
  )[
    #text(fill: rgb("78350f"), size: 13pt, weight: "bold")[
      #it.body
    ]
  ]
  v(0.3cm)
}

#show heading.where(level: 3): it => {
  v(0.4cm)
  text(fill: rgb("0f766e"), size: 11.5pt, weight: "bold")[
    #it.body
  ]
  v(0.2cm)
}

// Khung câu chuyện lịch sử hoàng gia
#let story-box(title: "", author: "", body) = {
  v(0.5cm)
  rect(
    width: 100%,
    fill: rgb("fefce8"),
    stroke: 1pt + rgb("f59e0b"),
    radius: 6pt,
    inset: (x: 16pt, y: 14pt)
  )[
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align: (left, left),
      text(size: 20pt)[📜],
      [
        #text(weight: "bold", size: 11.5pt, fill: rgb("92400e"))[
          GIAI THOẠI LỊCH SỬ & NGUỒN GỐC PHÁT MINH: #title
        ]
        #if author != "" [
          \ #text(size: 9.5pt, style: "italic", fill: rgb("b45309"))[Nhân vật lịch sử: #author]
        ]
      ]
    )
    #v(6pt)
    #line(length: 100%, stroke: 0.5pt + rgb("fde68a"))
    #v(4pt)
    #set text(size: 10.5pt, fill: rgb("451a03"))
    #body
  ]
  v(0.5cm)
}

// Khung kịch bản Hook sư phạm 3 phút đầu giờ
#let hook-box(title: "", body) = {
  v(0.5cm)
  rect(
    width: 100%,
    fill: rgb("eff6ff"),
    stroke: 1.2pt + rgb("3b82f6"),
    radius: 6pt,
    inset: (x: 16pt, y: 14pt)
  )[
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align: (left, left),
      text(size: 20pt)[🎯],
      [
        #text(weight: "bold", size: 11.5pt, fill: rgb("1e40af"))[
          KỊCH BẢN HOOK SƯ PHẠM 3 PHÚT ĐẦU GIỜ: #title
        ]
        \ #text(size: 9.5pt, style: "italic", fill: rgb("2563eb"))[
          Chiến thuật đánh thức sự tò mò & phá vỡ trạng thái thụ động của học sinh
        ]
      ]
    )
    #v(6pt)
    #line(length: 100%, stroke: 0.5pt + rgb("bfdbfe"))
    #v(4pt)
    #set text(size: 10.5pt, fill: rgb("1e293b"))
    #body
  ]
  v(0.5cm)
}

// Khung ứng dụng kỷ nguyên số & AI
#let tech-box(title: "", body) = {
  v(0.5cm)
  rect(
    width: 100%,
    fill: rgb("f0fdf4"),
    stroke: 1pt + rgb("16a34a"),
    radius: 6pt,
    inset: (x: 16pt, y: 14pt)
  )[
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align: (left, left),
      text(size: 20pt)[🚀],
      [
        #text(weight: "bold", size: 11.5pt, fill: rgb("166534"))[
          TOÁN HỌC TRONG KỶ NGUYÊN SỐ & TRÍ TUỆ NHÂN TẠO (AI): #title
        ]
        \ #text(size: 9.5pt, style: "italic", fill: rgb("15803d"))[
          Từ giảng đường THPT vươn thẳng tới Thung lũng Silicon và Cuộc cách mạng 4.0
        ]
      ]
    )
    #v(6pt)
    #line(length: 100%, stroke: 0.5pt + rgb("bbf7d0"))
    #v(4pt)
    #set text(size: 10.5pt, fill: rgb("14532d"))
    #body
  ]
  v(0.5cm)
}

// Khung giải mã sai lầm kinh điển của học sinh
#let misconception-box(title: "", body) = {
  v(0.5cm)
  rect(
    width: 100%,
    fill: rgb("fef2f2"),
    stroke: 1.2pt + rgb("ef4444"),
    radius: 6pt,
    inset: (x: 16pt, y: 14pt)
  )[
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align: (left, left),
      text(size: 20pt)[⚠️],
      [
        #text(weight: "bold", size: 11.5pt, fill: rgb("991b1b"))[
          CẢNH BÁO SƯ PHẠM: GIẢI MÃ SAI LẦM KINH ĐIỂN CỦA HỌC SINH: #title
        ]
        \ #text(size: 9.5pt, style: "italic", fill: rgb("b91c1c"))[
          Những cái bẫy tư duy trực giác phổ biến & Phương pháp phản chứng bẻ gãy ngụy biện
        ]
      ]
    )
    #v(6pt)
    #line(length: 100%, stroke: 0.5pt + rgb("fca5a5"))
    #v(4pt)
    #set text(size: 10.5pt, fill: rgb("7f1d1d"))
    #body
  ]
  v(0.5cm)
}

// Khung kịch bản đối thoại lớp học Socrates
#let dialogue-box(title: "", body) = {
  v(0.5cm)
  rect(
    width: 100%,
    fill: rgb("faf5ff"),
    stroke: 1.2pt + rgb("a855f7"),
    radius: 6pt,
    inset: (x: 16pt, y: 14pt)
  )[
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align: (left, left),
      text(size: 20pt)[💬],
      [
        #text(weight: "bold", size: 11.5pt, fill: rgb("6b21a8"))[
          KỊCH BẢN ĐỐI THOẠI LỚP HỌC SOCRATES: #title
        ]
        \ #text(size: 9.5pt, style: "italic", fill: rgb("7e22ce"))[
          Chuỗi câu hỏi dẫn dắt học sinh tự khám phá và vỡ òa chân lý trên bục giảng
        ]
      ]
    )
    #v(6pt)
    #line(length: 100%, stroke: 0.5pt + rgb("d8b4fe"))
    #v(4pt)
    #set text(size: 10.5pt, fill: rgb("581c87"))
    #body
  ]
  v(0.5cm)
}

// Khung góc nhìn toán học cao cấp dành cho giáo viên
#let deep-dive-box(title: "", body) = {
  v(0.5cm)
  rect(
    width: 100%,
    fill: rgb("f8fafc"),
    stroke: 1.2pt + rgb("475569"),
    radius: 6pt,
    inset: (x: 16pt, y: 14pt)
  )[
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align: (left, left),
      text(size: 20pt)[🔭],
      [
        #text(weight: "bold", size: 11.5pt, fill: rgb("0f172a"))[
          GÓC NHÌN TOÁN CAO CẤP DÀNH CHO GIÁO VIÊN: #title
        ]
        \ #text(size: 9.5pt, style: "italic", fill: rgb("334155"))[
          Nâng tầm tri thức sư phạm: Từ bục giảng THPT nhìn ra bức tranh lớn của Toán học nhân loại
        ]
      ]
    )
    #v(6pt)
    #line(length: 100%, stroke: 0.5pt + rgb("cbd5e1"))
    #v(4pt)
    #set text(size: 10.5pt, fill: rgb("1e293b"))
    #body
  ]
  v(0.5cm)
}

// Khung Phòng Thí Nghiệm Tư Duy & Dự Án Tự Nghiên Cứu
#let inquiry-box(title: "", body) = {
  v(0.5cm)
  rect(
    width: 100%,
    fill: rgb("f0fdf4"),
    stroke: 1.2pt + rgb("0d9488"),
    radius: 6pt,
    inset: (x: 16pt, y: 14pt)
  )[
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align: (left, left),
      text(size: 20pt)[🧪],
      [
        #text(weight: "bold", size: 11.5pt, fill: rgb("115e59"))[
          PHÒNG THÍ NGHIỆM TƯ DUY & DỰ ÁN TỰ NGHIÊN CỨU: #title
        ]
        \ #text(size: 9.5pt, style: "italic", fill: rgb("0f766e"))[
          Thử thách dành cho Nhà toán học trẻ: Thí nghiệm tư duy · Code mô phỏng máy tính · Sách hay nên đọc
        ]
      ]
    )
    #v(6pt)
    #line(length: 100%, stroke: 0.5pt + rgb("99f6e4"))
    #v(4pt)
    #set text(size: 10.5pt, fill: rgb("134e4a"))
    #body
  ]
  v(0.5cm)
}

// TRANG BÌA HOÀNG GIA ĐỈNH CAO
#align(center)[
  #v(1.5cm)
  #text(size: 13pt, weight: "bold", fill: rgb("b45309"), tracking: 3pt)[
    BỘ GIÁO DỤC & ĐÀO TẠO — CHƯƠNG TRÌNH GDPT 2018
  ]
  #v(0.4cm)
  #text(size: 10.5pt, style: "italic", fill: rgb("64748b"))[
    Tài liệu khai phóng tư duy dành cho Giáo viên & Học sinh Chuyên sâu THPT
  ]
  
  #v(1.2cm)
  #rect(
    width: 95%,
    fill: rgb("0f172a"),
    radius: 12pt,
    inset: (x: 24pt, y: 30pt),
    stroke: 2pt + rgb("fbbf24")
  )[
    #text(size: 12pt, weight: "bold", fill: rgb("fbbf24"), tracking: 3pt)[
      ĐẠI TOÀN THƯ SƯ PHẠM TOÁN HỌC
    ]
    #v(0.6cm)
    #text(size: 27pt, weight: "bold", fill: white)[
      TẠI SAO HỌC BÀI NÀY?
    ]
    #v(0.4cm)
    #text(size: 18pt, weight: "bold", fill: rgb("38bdf8"))[
      TOÁN HỌC LỚP 12
    ]
    #v(0.6cm)
    #text(size: 11pt, style: "italic", fill: rgb("cbd5e1"))[
      Cẩm nang Khai mở Tri thức, Lịch sử Phát minh, Bản chất Toán học\
      và Ứng dụng Kỷ nguyên Trí tuệ Nhân tạo cho toàn bộ SGK Toán 12
    ]
  ]
  
  #v(1.8cm)
  
  #grid(
    columns: (1fr, 1fr),
    align: (center, center),
    [
      #text(weight: "bold", size: 11pt, fill: rgb("1e293b"))[CHỦ BIÊN & CỐ VẤN NỘI DUNG]\
      #v(2pt)
      #text(size: 10pt, fill: rgb("475569"))[Hội đồng Khoa học & Sư phạm ConicTypst\
      Chương trình Đổi mới Giảng dạy Toán THPT]
    ],
    [
      #text(weight: "bold", size: 11pt, fill: rgb("1e293b"))[ĐỐI TƯỢNG PHỤC VỤ]\
      #v(2pt)
      #text(size: 10pt, fill: rgb("475569"))[Giáo viên Toán, Sinh viên Sư phạm\
      Học sinh Lớp 12 luyện thi ĐH & Đánh giá năng lực]
    ]
  )
  
  #v(2.5cm)
  #text(size: 9.5pt, fill: rgb("94a3b8"))[
    XUẤT BẢN NĂM 2026 — LƯU HÀNH NỘI BỘ SƯ PHẠM TOÁN
  ]
]

#pagebreak()

= LỜI TỰA: BỨC THƯ GỬI NGƯỜI THẦY DẪN ĐƯỜNG TRẬN ĐÁNH CUỐI CÙNG

#align(center)[
  #text(size: 12pt, style: "italic", weight: "bold", fill: rgb("1e3a8a"))[
    “Trước khi đưa học trò bước qua cánh cổng trường phổ thông ra biển lớn cuộc đời,\
    hãy trao cho các em chiếc la bàn của Đạo hàm, Tích phân và Xác suất!”
  ]
]

#v(0.6cm)

*Kính gửi Quý Thầy Cô giáo dạy Toán lớp 12 trên khắp mọi miền đất nước,*

Lớp 12 là một năm học vô cùng đặc biệt và khốc liệt. Trong tâm thức của phần lớn học sinh và phụ huynh, đây là năm của những kỳ thi sinh tử: Thi Tốt nghiệp THPT, Thi Đánh giá năng lực ĐHQG Hà Nội và ĐHQG TP.HCM, Thi Đánh giá tư duy Bách Khoa...

Áp lực thi cử khổng lồ đó đã vô tình biến lớp 12 thành một *"công trường luyện đề"*:
- Học sinh học thuộc lòng các mẹo bấm máy tính Casio để tìm tiệm cận trong 5 giây mà không hiểu bản chất tiệm cận là hành vi bão hòa của thế giới tự nhiên!
- Học sinh giải hàng trăm bài toán tìm cực trị hàm hợp $g(x) = f(u(x))$ bằng các bảng biến thiên máy móc mà không hề biết Đạo hàm cực trị chính là linh hồn của thuật toán tối ưu hóa hàng nghìn tỷ USD tại Thung lũng Silicon!
- Học sinh cặm cụi tính tích phân từng phần $u dot v - integral v d u$ như một con robot giải mã, mà không biết rằng một công thức tích phân đó đã đưa con tàu vũ trụ Apollo của nhân loại đáp xuống Mặt Trăng!

*Nhưng nếu người thầy chỉ dạy mẹo làm bài trắc nghiệm:*
Sau ngày thi đại học, toàn bộ những mẹo bấm máy đó sẽ biến mất như bọt xà phòng! Học sinh bước chân vào giảng đường đại học, vào đời với một bộ não trống rỗng về mặt tư duy logic và mất đi hoàn toàn niềm tin vào vẻ đẹp của Toán học!

*Ngược lại, nếu Thầy Cô mở đầu mỗi tiết dạy Toán 12 bằng những câu hỏi chấn động:*
- Tại sao các công ty nước ngọt lại thiết kế lon coca có tỷ lệ chiều cao trên đường kính đáy nhất định mà không làm lùn tịt hay cao vút? (Bài toán Tối ưu hóa cực trị của Fermat).
- Tại sao một chiếc điện thoại nhỏ bé trong túi quần lại biết bạn đang đứng ở góc phố nào giữa lòng Hà Nội hay Sài Gòn? (Phương pháp tọa độ không gian Oxyz và bài toán giao 4 mặt cầu vệ tinh GPS).
- Tại sao hai quỹ đầu tư cùng có mức sinh lời $20\%$/năm, nhưng các chuyên gia tài chính phố Wall lại khuyên bạn ném tiền vào quỹ này mà tránh xa quỹ kia? (Phương sai và Độ lệch chuẩn đo lường rủi ro của Gauss).
- Làm thế nào các kỹ sư SpaceX tính toán được lượng nhiên liệu oxy lỏng cần nạp để đưa tên lửa Falcon 9 vượt thắng trọng lực Trái Đất? (Định lý cơ bản của Giải tích Tích phân Newton – Leibniz).

Cuốn *Đại Toàn Thư Khai Mở Sư Phạm Toán 12* này được viết ra như một *vũ khí sư phạm tối thượng*, cung cấp cho Thầy Cô đầy đủ chất liệu văn học, lịch sử và công nghệ để mỗi tiết dạy Toán 12 là một giờ thắp sáng ước mơ cho học trò trước ngưỡng cửa cuộc đời!

#v(1cm)

= BẢN ĐỒ TIẾN HÓA TƯ DUY TOÁN HỌC: CÂY ĐẠI THỤ TRI THỨC THPT

Để học sinh không cảm thấy các bài toán lớp 12 là những mảnh ghép rời rạc, thầy cô hãy chỉ cho các em thấy bức tranh toàn cảnh của *Cây Đại Thụ Toán Học THPT*:

#align(center)[
  #block(width: 95%, stroke: 1pt + rgb("cbd5e1"), radius: 8pt, fill: rgb("f8fafc"), inset: 16pt)[
    #text(weight: "bold", size: 12pt, fill: rgb("1e1b4b"))[
      CÂY ĐẠI THỤ TOÁN HỌC 3 NĂM THPT (CHƯƠNG TRÌNH 2018)
    ]
    
    #v(8pt)
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 12pt,
      align: (left, left, left),
      [
        #text(weight: "bold", fill: rgb("15803d"))[🌱 KHỐI 10: NỀN MÓNG & BỘ CÔNG CỤ]\
        #v(4pt)
        - *Mệnh đề & Tập hợp:* Logic tư duy chính xác, bản lề ngôn ngữ.\
        - *Hệ bất phương trình:* Khởi đầu của Quy hoạch tuyến tính.\
        - *Hệ thức lượng trong tam giác:* Đo đạc địa hình, thiên văn.\
        - *Vector 2D:* Lực học Newton, vận tốc và gia tốc cơ bản.\
        - *Xác suất cổ điển & Tổ hợp:* Quy tắc đếm, nhị thức Newton.
      ],
      [
        #text(weight: "bold", fill: rgb("0369a1"))[🌿 KHỐI 11: NHỊP ĐIỆU & BIẾN THIÊN]\
        #v(4pt)
        - *Hàm số lượng giác:* Âm thanh, sóng điện từ, dao động điều hòa.\
        - *Dãy số, Cấp số cộng/nhân:* Lãi kép, sinh thái, mô hình SIR.\
        - *Giới hạn & Liên tục:* Bước đệm vi mô vào thế giới vô hạn.\
        - *Đạo hàm lớp 11:* Tốc độ thay đổi tức thời, độ dốc tiếp tuyến.\
        - *Hình không gian:* Quan hệ song song và vuông góc 3D.
      ],
      [
        #text(weight: "bold", fill: rgb("7e22ce"))[🌳 KHỐI 12: ĐỈNH CAO & THẾ GIỚI THỰC]\
        #v(4pt)
        - *Khảo sát hàm số:* Điểm uốn kinh tế, cực trị tối ưu hóa.\
        - *Vector & Tọa độ Oxyz:* GPS, Robot Da Vinci, Đồ họa CGI 3D.\
        - *Độ phân tán mẫu ghép nhóm:* Quản trị rủi ro, Six Sigma bán dẫn.\
        - *Nguyên hàm & Tích phân:* Tính diện tích cong, công cơ học SpaceX.\
        - *Xác suất Bayes & Kỳ vọng:* Trí tuệ nhân tạo, xe tự lái Tesla.
      ]
    )
  ]
]

#v(0.8cm)

= TẠI SAO TOÁN 12 LÀ LINH HỒN CỦA TRÍ TUỆ NHÂN TẠO (AI)?

Các em học sinh thường tự hỏi: *"Em theo đuổi ngành Khoa học Máy tính và AI, tại sao lại phải học đạo hàm, tích phân và vector Oxyz nhiều đến thế?"*.

Thầy cô hãy chiếu bảng ma trận ánh xạ này lên màn hình máy chiếu ngay trong buổi khai giảng đầu năm:

#align(center)[
  #table(
    columns: (3.5cm, 5.5cm, 6.5cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e1b4b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    table.header(
      text(fill: rgb("fbbf24"), weight: "bold", size: 9pt)[Kiến thức Toán 12],
      text(fill: white, weight: "bold", size: 9pt)[Khái niệm cốt lõi trong AI],
      text(fill: white, weight: "bold", size: 9pt)[Ứng dụng thực tế định hình tương lai],
    ),
    [Khảo sát hàm số & Cực trị], [Hàm mất mát (Loss Function) & Lan truyền ngược (Backprop)], [Thuật toán Gradient Descent tối ưu hóa hàng nghìn tỷ trọng số của ChatGPT và Claude.],
    [Vector & Không gian Oxyz], [Không gian nhúng Vector (Vector Embeddings) & Attention], [Mô hình hóa ngôn ngữ: Các từ có nghĩa gần nhau sẽ có khoảng cách vector gần nhau trong không gian.],
    [Phương sai & Độ lệch chuẩn], [Batch Normalization & Z-Score Feature Scaling], [Ổn định hóa mạng nơ-ron sâu, ngăn ngừa hiện tượng bùng nổ hoặc tiêu biến gradient.],
    [Nguyên hàm & Tích phân], [Tích chập (Convolution) & Phân phối xác suất liên tục], [Mạng nơ-ron tích chập (CNN) xử lý thị giác máy tính cho xe tự lái Tesla nhận diện biển báo.],
    [Xác suất có điều kiện & Bayes], [Mô hình xác suất sinh (Generative AI) & Chuỗi Markov], [Học tăng cường (Reinforcement Learning) giúp AlphaGo và AlphaZero tự học chiến thuật chơi cờ.],
    [Chuyên đề Tối ưu hóa], [Quy hoạch tuyến tính & Vận tải mạng nơ-ron], [Tối ưu hóa hàng nghìn kho vận logistics của Amazon, Shopee và định tuyến chip bán dẫn.],
  )
]

Toán học không phải là lý thuyết cổ xưa của quá khứ; Toán 12 chính là hạt nhân công nghệ tối tân nhất đang kiến tạo nên kỷ nguyên mới của nhân loại!

#v(0.8cm)

= MA TRẬN ÁNH XẠ TOÁN 12 SANG 6 NGÀNH NGHỀ THỜI THƯỢNG THẾ KỶ XXI

Để các em học sinh lớp 12 định hướng nghề nghiệp và chọn ngành đại học chính xác nhất, dưới đây là bản đồ kết nối trực tiếp giữa các bài học Toán 12 với 6 ngành công nghiệp mũi nhọn có thu nhập cao nhất toàn cầu:

#align(center)[
  #table(
    columns: (3.2cm, 3.8cm, 4.2cm, 5cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e1b4b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    table.header(
      text(fill: rgb("fbbf24"), weight: "bold", size: 8.5pt)[Ngành Nghề Thời Thượng],
      text(fill: white, weight: "bold", size: 8.5pt)[Vị Trí Công Việc Thực Tế],
      text(fill: white, weight: "bold", size: 8.5pt)[Công Cụ Toán 12 Bắt Buộc],
      text(fill: white, weight: "bold", size: 8.5pt)[Vấn Đề Thực Tế Phải Giải Quyết],
    ),
    [1. Trí Tuệ Nhân Tạo & Khoa Học Dữ Liệu], [Kỹ sư Machine Learning, AI Research Scientist], [Khảo sát hàm số, Gradient Descent, Vector Oxyz, Bayes], [Tối ưu hóa hàm mất mát hàng nghìn tỷ trọng số, vector nhúng ngữ nghĩa.],
    [2. Tài Chính Định Lượng (Quants) & FinTech], [Quantitative Analyst, Quản lý Quỹ Phòng hộ], [Phương sai, Độ lệch chuẩn, Tích phân chuỗi thời gian], [Định giá hợp đồng quyền chọn Black-Scholes, kiểm soát rủi ro VaR.],
    [3. Hàng Không Vũ Trụ & Quốc Phòng], [Kỹ sư Điều khiển Tên lửa, Thiết kế Quỹ đạo Vệ tinh], [Vector Oxyz, Tích có hướng, Tích phân vận tốc/gia tốc], [Tính toán góc đón đánh chặn mục tiêu bay, xa lộ liên hành tinh NASA.],
    [4. Công Nghiệp Bán Dẫn & Vi Mạch], [Kỹ sư Quy trình TSMC/Intel, Thiết kế Chiplet], [Thống kê phân tán, Chuẩn Six Sigma, Phân bố Gauss], [Kiểm soát sai số chế tạo ở quy mô nanomet, tối ưu hóa năng suất wafer.],
    [5. Y Sinh Học Tính Toán & Hóa Dược], [Chuyên gia Tin sinh học, Thiết kế Thuốc Phân tử], [Tích phân đường cong AUC, Hình học phân tử Oxyz], [Mô hình hóa dược động học truyền hóa chất, khóa rãnh thụ thể virus.],
    [6. Đồ Họa Máy Tính, Game 3D & VR/AR], [Kỹ sư Đồ họa Unreal Engine, Kỹ xảo CGI Hollywood], [Phương trình đường thẳng, mặt cầu Oxyz, Tích vô hướng], [Thuật toán dò tia ánh sáng Ray-Tracing thời gian thực, khử va chạm hitbox.],
  )
]

#v(0.8cm)

= 10 CÔNG TRÌNH TOÁN HỌC ĐOẠT GIẢI NOBEL & FIELDS ĐỊNH HÌNH VĂN MINH HIỆN ĐẠI

Nhiều người nghĩ Toán học không có giải Nobel nên ít ảnh hưởng đến đời sống. Sự thật hoàn toàn ngược lại: Rất nhiều giải Nobel Kinh tế, Vật lý, Hóa học và Y học đều được trao cho các công trình có bản chất là TOÁN HỌC THUẦN TÚY:

#align(center)[
  #table(
    columns: (1.2cm, 3.8cm, 3.2cm, 8cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e1b4b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    table.header(
      text(fill: rgb("fbbf24"), weight: "bold", size: 8.5pt)[Năm],
      text(fill: white, weight: "bold", size: 8.5pt)[Nhà Khoa Học],
      text(fill: white, weight: "bold", size: 8.5pt)[Giải Thưởng],
      text(fill: white, weight: "bold", size: 8.5pt)[Bản Chất Toán Học & Đóng Góp Cho Nhân Loại],
    ),
    [1921], [Albert Einstein], [Nobel Vật Lý], [Giải thích Hiệu ứng quang điện bằng giải tích xác suất lượng tử photon.],
    [1954], [Max Born], [Nobel Vật Lý], [Diễn giải bình phương biên độ tích phân hàm sóng $|psi|^2$ là mật độ xác suất.],
    [1972], [Kenneth Arrow], [Nobel Kinh Tế], [Định lý Bất khả về bầu cử dựa trên lý thuyết tập hợp và quan hệ thứ tự.],
    [1973], [Wassily Leontief], [Nobel Kinh Tế], [Mô hình Cân đối Liên ngành Input-Output giải bằng ma trận nghịch đảo.],
    [1990], [Harry Markowitz], [Nobel Kinh Tế], [Lý thuyết Danh mục đầu tư hiện đại dùng Phương sai & Độ lệch chuẩn.],
    [1994], [John Forbes Nash], [Nobel Kinh Tế], [Điểm cân bằng Nash trong Lý thuyết trò chơi phi hợp tác (Định lý điểm bất động Kakutani).],
    [1997], [Myron Scholes & Robert Merton], [Nobel Kinh Tế], [Phương trình đạo hàm riêng Black-Scholes định giá chứng khoán phái sinh.],
    [2006], [Grigori Perelman], [Huy Chương Fields], [Giải mã Phỏng đoán Poincaré bằng phương trình dòng Ricci vi phân phi tuyến.],
    [2010], [Cédric Villani], [Huy Chương Fields], [Chứng minh hiện tượng Tắt dần Landau phi tuyến trong vật lý plasma bằng giải tích vi phân.],
    [2020], [Roger Penrose], [Nobel Vật Lý], [Dùng hình học vi phân tô-pô chứng minh sự hình thành tất yếu của Lỗ Đen.],
  )
]
'''
