# -*- coding: utf-8 -*-

CONTENT = '''#import "@preview/cetz:0.5.2"

// ══════════════════════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ ĐỊNH DẠNG TÀI LIỆU TOÀN THƯ KHAI MỞ SƯ PHẠM TOÁN 10
// ══════════════════════════════════════════════════════════════
#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 2.2cm, left: 2.0cm, right: 2.0cm),
  header: context {
    let page-num = counter(page).get().first()
    if page-num > 1 [
      #grid(
        columns: (1fr, auto),
        align(left)[#text(size: 8.5pt, fill: rgb("475569"), style: "italic")[Đại Toàn Thư Khai Mở Tri Thức Sư Phạm Toán 10 — Nền Tảng, Logic & Kỷ Nguyên AI]],
        align(right)[#text(size: 8.5pt, fill: rgb("475569"), weight: "bold")[Trang #page-num]]
      )
      #v(-0.3em)
      #line(length: 100%, stroke: 0.5pt + rgb("CBD5E1"))
    ]
  },
  footer: context {
    let page-num = counter(page).get().first()
    if page-num > 1 [
      #align(center)[
        #text(size: 8pt, fill: rgb("94A3B8"))[Dự án Đề Ôn Tập Theo Chương Toán 10 · ConicTypst Master Pedagogical Series]
      ]
    ]
  }
)

#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em, first-line-indent: 1.5em)

// Bảng màu nhận diện hoàng gia & sư phạm đỉnh cao
#let c-royal = rgb("0F172A")
#let c-navy = rgb("1E3A8A")
#let c-blue = rgb("2563EB")
#let c-gold = rgb("D97706")
#let c-amber = rgb("B45309")
#let c-teal = rgb("0D9488")
#let c-emerald = rgb("059669")
#let c-crimson = rgb("BE123C")
#let c-purple = rgb("7E22CE")
#let c-border = rgb("CBD5E1")

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 2.5pt + c-navy),
  inset: (bottom: 0.5em),
  above: 2.2em,
  below: 1.3em,
  text(fill: c-navy, size: 14pt, weight: "black", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.6em,
  below: 0.9em,
  stroke: (left: 4.5pt + c-blue),
  inset: (left: 10pt, y: 4pt),
  text(fill: c-navy, size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.3em,
  below: 0.6em,
  stroke: (left: 3.5pt + c-amber),
  inset: (left: 8pt, y: 3pt),
  text(fill: c-amber, size: 11pt, weight: "bold", it.body),
)

// Macro 1: Hộp mẩu chuyện lịch sử hấp dẫn (Story Box)
#let story-box(title: "", author: "", body) = block(
  fill: rgb("FFFDF5"),
  stroke: (left: 4.5pt + c-gold, rest: 0.5pt + rgb("FDE68A")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 5pt),
  width: 100%,
  above: 1.2em,
  below: 1.2em,
)[
  #grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    text(size: 13pt)[📜],
    [
      #text(size: 11pt, weight: "black", fill: rgb("92400E"))[GIAI THOẠI LỊCH SỬ: #title]\\
      #if author != "" [#text(size: 8.5pt, style: "italic", fill: rgb("B45309"))[Nhân vật trung tâm: #author]]
    ]
  )
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("FCD34D"))
  #v(0.4em)
  #body
]

// Macro 2: Hộp kịch bản sư phạm trên lớp (Teacher Hook Box)
#let hook-box(title: "", body) = block(
  fill: rgb("F0FDF4"),
  stroke: (left: 4.5pt + c-emerald, rest: 0.5pt + rgb("BBF7D0")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 5pt),
  width: 100%,
  above: 1.2em,
  below: 1.2em,
)[
  #grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    text(size: 13pt)[🎤],
    [
      #text(size: 11pt, weight: "black", fill: rgb("166534"))[GỢI Ý LỜI KỂ CỦA THẦY TRÊN BỤC GIẢNG (3 PHÚT ĐẦU GIỜ): #title]\\
      #text(size: 8.5pt, style: "italic", fill: rgb("15803D"))[Phương pháp đánh thức trí tò mò & biến tiết học thành chuyến phiêu lưu trí tuệ]
    ]
  )
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("86EFAC"))
  #v(0.4em)
  #body
]

// Macro 3: Hộp ứng dụng Kỷ nguyên AI & Công nghệ cao (Tech Box)
#let tech-box(title: "", body) = block(
  fill: rgb("EFF6FF"),
  stroke: (left: 4.5pt + c-blue, rest: 0.5pt + rgb("BFDBFE")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 5pt),
  width: 100%,
  above: 1.2em,
  below: 1.2em,
)[
  #grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    text(size: 13pt)[🚀],
    [
      #text(size: 11pt, weight: "black", fill: c-navy)[HỌC ĐỂ LÀM GÌ? KỶ NGUYÊN AI, CHIP BÁN DẪN & VŨ TRỤ: #title]\\
      #text(size: 8.5pt, style: "italic", fill: c-blue)[Cầu nối từ kiến thức lớp 10 tới công nghệ hiện đại định hình tương lai]
    ]
  )
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("93C5FD"))
  #v(0.4em)
  #body
]

// Macro 4: Hộp giải mã sai lầm kinh điển của học sinh (Misconception Box)
#let misconception-box(title: "", misconception: "", correction: "", remedy: "", ..sink) = block(
  fill: rgb("FEF2F2"),
  stroke: (left: 4.5pt + rgb("DC2626"), rest: 0.5pt + rgb("FECACA")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 5pt),
  width: 100%,
  above: 1.2em,
  below: 1.2em,
)[
  #grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    text(size: 13pt)[⚠️],
    [
      #text(size: 11pt, weight: "black", fill: rgb("991B1B"))[CẢNH BÁO SƯ PHẠM: GIẢI MÃ SAI LẦM KINH ĐIỂN: #title]\\
      #text(size: 8.5pt, style: "italic", fill: rgb("B91C1C"))[Những cái bẫy tư duy trực giác phổ biến & Phương pháp phản chứng bẻ gãy ngụy biện]
    ]
  )
  #if misconception != "" [
    #v(0.4em)
    #text(weight: "bold", fill: rgb("991B1B"))[Cạm bẫy ngộ nhận:] #misconception
  ]
  #if correction != "" [
    #v(0.2em)
    #text(weight: "bold", fill: rgb("15803D"))[Bản chất đúng đắn:] #correction
  ]
  #if remedy != "" [
    #v(0.2em)
    #text(weight: "bold", fill: rgb("1E40AF"))[Giải pháp khắc phục:] #remedy
  ]
  #if sink.pos().len() > 0 [
    #v(0.4em)
    #line(length: 100%, stroke: 0.5pt + rgb("FCA5A5"))
    #v(0.4em)
    #sink.pos().first()
  ]
]


// Macro 5: Hộp kịch bản đối thoại lớp học Socrates (Socratic Dialogue Box)
#let dialogue-box(title: "", body) = block(
  fill: rgb("FAF5FF"),
  stroke: (left: 4.5pt + rgb("9333EA"), rest: 0.5pt + rgb("E9D5FF")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 5pt),
  width: 100%,
  above: 1.2em,
  below: 1.2em,
)[
  #grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    text(size: 13pt)[💬],
    [
      #text(size: 11pt, weight: "black", fill: rgb("6B21A8"))[KỊCH BẢN ĐỐI THOẠI LỚP HỌC SOCRATES: #title]\\
      #text(size: 8.5pt, style: "italic", fill: rgb("7E22CE"))[Chuỗi câu hỏi dẫn dắt học sinh tự khám phá và vỡ òa chân lý trên bục giảng]
    ]
  )
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("D8B4FE"))
  #v(0.4em)
  #body
]

// Macro 6: Hộp góc nhìn toán học cao cấp (Deep Dive Box)
#let deep-dive-box(title: "", body) = block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4.5pt + rgb("334155"), rest: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 5pt),
  width: 100%,
  above: 1.2em,
  below: 1.2em,
)[
  #grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    text(size: 13pt)[🔭],
    [
      #text(size: 11pt, weight: "black", fill: rgb("0F172A"))[GÓC NHÌN TOÁN CAO CẤP DÀNH CHO GIÁO VIÊN: #title]\\
      #text(size: 8.5pt, style: "italic", fill: rgb("475569"))[Nâng tầm tri thức sư phạm: Từ bục giảng THPT nhìn ra bức tranh lớn của Toán học nhân loại]
    ]
  )
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("94A3B8"))
  #v(0.4em)
  #body
]

// Macro 7: Hộp bài toán gợi mở tư duy khám phá (Inquiry Box)
#let inquiry-box(title: "", body) = block(
  fill: rgb("FFF7ED"),
  stroke: (left: 4.5pt + rgb("EA580C"), rest: 0.5pt + rgb("FED7AA")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 5pt),
  width: 100%,
  above: 1.2em,
  below: 1.2em,
)[
  #grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    text(size: 13pt)[💡],
    [
      #text(size: 11pt, weight: "black", fill: rgb("9A3412"))[BÀI TOÁN GỢI MỞ TƯ DUY KHÁM PHÁ (INQUIRY-BASED): #title]\\
      #text(size: 8.5pt, style: "italic", fill: rgb("C2410C"))[Thử thách học sinh tự kiến tạo tri thức trước khi tiếp cận định lý chính thức]
    ]
  )
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("FDBA74"))
  #v(0.4em)
  #body
]

// ══════════════════════════════════════════════════════════════
// TRANG BÌA ĐẠI TOÀN THƯ NGHỆ THUẬT HOÀNG GIA KHỐI 10
// ══════════════════════════════════════════════════════════════

#align(center)[
  #rect(
    fill: c-royal,
    stroke: 3pt + c-gold,
    inset: (x: 20pt, y: 26pt),
    radius: 10pt,
    width: 100%,
  )[
    #text(size: 11pt, tracking: 0.25em, weight: "bold", fill: rgb("93C5FD"))[
      BỘ SÁCH ĐỀ ÔN TẬP THEO CHƯƠNG TOÁN LỚP 10 (GDPT 2018)
    ]
    #v(1.0em)
    #text(size: 24pt, weight: "black", fill: rgb("F8FAFC"))[
      ĐẠI TOÀN THƯ KHAI MỞ\\
      TRI THỨC SƯ PHẠM TOÁN 10
    ]
    #v(0.8em)
    #text(size: 13pt, style: "italic", weight: "bold", fill: rgb("FCD34D"))[
      Nền Móng Logic, Hệ Tọa Độ & Ngôn Ngữ Tối Ưu Hóa\\
      Tại Sao Phải Học Bài Này? Ai Phát Minh? Học Để Làm Gì?\\
      Bảo Tàng Những Khủng Hoảng Nhận Thức Lịch Sử & Sứ Mệnh Định Hình Trí Tuệ Nhân Tạo (AI)
    ]
    #v(1.5em)

    // Hình vẽ CeTZ nghệ thuật hình học vũ trụ & tọa độ Descartes
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 2.2, stroke: 1.5pt + rgb("38BDF8"))
      circle((0, 0), radius: 1.7, stroke: (paint: rgb("F43F5E"), thickness: 1.2pt))
      circle((0, 0), radius: 1.1, stroke: (paint: rgb("FBBF24"), thickness: 1.0pt, dash: "dashed"))
      circle((0, 0), radius: 0.18, fill: rgb("FDE047"), stroke: none)
      line((-2.2, 0), (2.2, 0), stroke: 0.6pt + rgb("94A3B8"))
      line((0, -2.2), (0, 2.2), stroke: 0.6pt + rgb("94A3B8"))
      // Vẽ parabol minh họa
      for a in (-15, -10, -5, 0, 5, 10, 15) {
        let x = a * 0.1
        let y = x * x * 0.8 - 1.2
        circle((x, y), radius: 0.04, fill: rgb("38BDF8"), stroke: none)
      }
      for a in (0, 45, 90, 135, 180, 225, 270, 315) {
        line((0, 0), (2.2 * calc.cos(a * 1deg), 2.2 * calc.sin(a * 1deg)), stroke: 0.3pt + rgb("475569"))
      }
    })

    #v(1.2em)
    #text(size: 9.5pt, style: "italic", fill: rgb("CBD5E1"))[
      Từ Nghịch Lý Russell, Quỹ Đạo Ném Xiên Galileo Đến Siêu Phẳng Phân Chia Machine Learning
    ]
    #v(1.5em)
    #block(
      fill: rgb("1E293B"),
      stroke: 0.8pt + rgb("475569"),
      inset: (x: 16pt, y: 10pt),
      radius: 6pt,
    )[
      #text(size: 10.5pt, weight: "bold", fill: rgb("F1F5F9"))[
        Tác giả: Thầy Nguyễn Văn Sang & Ban Cố Vấn Chuyên Môn ConicTypst\\
      ]
      #text(size: 9.5pt, fill: rgb("94A3B8"))[
        *Đặc biệt*: Bộ Cẩm Nang Chuyên Khảo Đồ Sộ Dành Riêng Cho Người Thầy Khát Khao Thắp Lửa
      ]
    ]
  ]
]

#pagebreak()

// ══════════════════════════════════════════════════════════════
// BỨC THƯ GỬI NGƯỜI ĐI DẠY: TẠI SAO CHÚNG TA ĐỨNG TRÊN BỤC GIẢNG?
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 5pt + c-navy, rest: 0.5pt + rgb("E2E8F0")),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 6pt),
)[
  #text(size: 14pt, weight: "black", fill: c-navy)[
    BỨC THƯ GỬI NGƯỜI ĐI DẠY TOÁN 10: TẠI SAO CHÚNG TA ĐỨNG TRÊN BỤC GIẢNG?
  ]
  #v(0.6em)
  #text(size: 10pt, style: "italic", fill: rgb("334155"))[
    "Thưa quý Thầy Cô và các bạn đồng nghiệp kính mến,\\
    Có bao giờ giữa một buổi chiều tà, đứng trước bảng đen phấn trắng, nhìn xuống những ánh mắt mệt mỏi của học trò đang ngụp lặn giữa hàng tá công thức lượng giác, bảng xét dấu tam thức hay phương trình elip, Thầy Cô chợt nghe một câu hỏi thì thầm từ cuối lớp:\\
    — ‘Thưa thầy, chúng con học những thứ này để làm gì? Sau này ra đời con đâu có dùng đến sin, cos hay tọa độ vectơ?’"
  ]
]

Đó là câu hỏi nhức nhối nhất của nền giáo dục hiện đại. Nếu người thầy lúng túng trả lời: *“Học để thi đại học, học vì chương trình bắt buộc, học để lấy điểm 9 điểm 10”*, thì ngay khoảnh khắc đó, chúng ta đã biến Toán học thành một nhà tù của những ký hiệu vô hồn. Học sinh sẽ biến thành những người "thợ giải toán cơ học": thuộc lòng vài mẹo bấm máy tính Casio, giải hàng trăm bài tập rập khuôn, và rồi sau kỳ thi, các em sẽ quên sạch sẽ không còn một vết tích.

Nhưng *Toán học thực sự không phải như vậy!*

Toán học là bảo tàng tư tưởng vĩ đại nhất của nền văn minh loài người. Mỗi định lý, mỗi khái niệm trong sách giáo khoa lớp 10 hôm nay đều từng là *kết quả của một cuộc chiến tư tưởng bi tráng, một cuộc khủng hoảng nhận thức làm rung chuyển thế giới, hoặc một phát minh sinh tử cứu sống hàng vạn con người*:
- Đằng sau *Mệnh đề Logic* của George Boole là giấc mơ biến tư duy con người thành ngôn ngữ số, mở đường cho toàn bộ thế giới máy tính và Trí tuệ nhân tạo (AI).
- Đằng sau *Lý thuyết Tập hợp* là bi kịch đau đớn của Georg Cantor, người đã dám nhìn thẳng vào sự Vô hạn của Thượng đế để rồi bị cả giới hàn lâm ruồng bỏ đến mức trầm cảm.
- Đằng sau *Hệ bất phương trình quy hoạch tuyến tính* là cuộc phong tỏa Leningrad năm 1939, nơi nhà toán học Leonid Kantorovich đã dùng toán học để tối ưu hóa từng chuyến xe chở lương thực cứu đói hàng vạn thường dân qua hồ Ladoga đóng băng.
- Đằng sau *Hệ thức lượng và phương pháp tọa độ* là ước mơ cháy bỏng của con người: đứng trên mặt đất nhưng đo được bán kính Trái Đất, khoảng cách tới Mặt Trời, và điều khiển con tàu vũ trụ bay trúng hồng tâm Sao Hỏa xa xôi hàng trăm triệu kilomet.
- Đằng sau *Đại số tổ hợp & Xác suất* là những lá thư sinh tử giữa Blaise Pascal và Pierre de Fermat năm 1654, giúp nhân loại từ bỏ mê tín dị đoan để xây dựng nền văn minh quản trị rủi ro tài chính và y tế hiện đại.

*Cái hay lớn nhất của người đi dạy là làm sống dậy những linh hồn ấy.* Khi người thầy biết mở đầu bài học bằng một câu chuyện lịch sử kịch tính, chỉ ra công thức này đang vận hành ở đâu trong chiếc iPhone, thuật toán TikTok hay tên lửa vũ trụ, ánh mắt học trò sẽ bừng sáng. Các em sẽ học không phải vì sợ điểm kém, mà học vì *lòng tự hào được tiếp nối ngọn đuốc trí tuệ của nhân loại*.

Cuốn Toàn thư Khai mở Sư phạm này được viết ra để trao vào tay Thầy Cô thứ vũ khí truyền cảm hứng mạnh mẽ nhất. Chúc Thầy Cô có những tiết dạy thăng hoa, nơi Toán học được trả lại vẻ đẹp kiêu hãnh và linh thiêng vốn có của nó!

#align(right)[
  #text(weight: "bold", fill: c-navy)[Thầy Nguyễn Văn Sang & Nhóm Biên Soạn ConicTypst]\\
  #text(size: 9pt, style: "italic", fill: rgb("64748B"))[Cần Thơ & Hà Nội, Niên giám Sư phạm 2026]
]

#v(0.6cm)

= BẢN ĐỒ TỔNG THỂ TOÁN HỌC 10 TRONG TIẾN TRÌNH VĂN MINH NHÂN LOẠI

Chương trình Toán học Lớp 10 (GDPT 2018) là nền móng của toàn bộ giáo dục phổ thông, nơi học sinh chuyển giao từ *Tư duy số học cụ thể* sang *Tư duy cấu trúc và mô hình hóa trừu tượng*:

#align(center)[
  #table(
    columns: (3.2cm, 3.8cm, 4.0cm, 5.2cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e1b4b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    table.header(
      text(fill: rgb("fbbf24"), weight: "bold", size: 8.5pt)[Chương Học Lớp 10],
      text(fill: white, weight: "bold", size: 8.5pt)[Bước Ngoặt Lịch Sử],
      text(fill: white, weight: "bold", size: 8.5pt)[Bộ Óc Thiên Tài Tiêu Biểu],
      text(fill: white, weight: "bold", size: 8.5pt)[Di Sản Định Hình Thế Giới Số],
    ),
    [Chương I: Mệnh đề & Tập hợp], [Xây dựng nền móng thép cho tư duy logic, chinh phục các cấp độ vô hạn.], [Aristotle, Boole, Cantor, Russell], [Cổng logic chip vi xử lý bán dẫn, ngôn ngữ lập trình, SAT Solvers AI.],
    [Chương II: BPT Bậc nhất 2 ẩn], [Khai sinh toán học tối ưu hóa nguồn lực trong thế giới khan hiếm.], [Leonid Kantorovich, George Dantzig], [Thuật toán Simplex, chuỗi cung ứng Amazon, logistics toàn cầu.],
    [Chương III: Hệ thức lượng tam giác], [Đo đạc thiên văn, định vị không gian và thám hiểm địa hình Trái Đất.], [Eratosthenes, Hipparchus, Al-Biruni], [Hệ thống định vị GPS, trắc địa bản đồ số, bay vũ trụ NASA.],
    [Chương IV: Vectơ & Tích vô hướng], [Hợp nhất Hình học và Vật lý học, mô tả lực và chuyển động không gian.], [Hermann Grassmann, Hamilton, Möbius], [Công cụ đổ bóng Shading đồ họa game 3D, mô phỏng vật lý Unreal Engine.],
    [Chương V: Thống kê mô tả], [Rút trích chân lý từ mớ hỗn độn dữ liệu thực tế, đo lường sự biến thiên.], [Florence Nightingale, Karl Pearson, Tukey], [Kiểm soát chất lượng Six Sigma TSMC, phát hiện gian lận tài chính ngân hàng.],
    [Chương VI: Hàm số bậc hai], [Khám phá quy luật rơi tự do và đường cong ném xiên đạn đạo.], [Galileo Galilei, Archimedes, Chebyshev], [Thiết kế cầu treo vòm, ăng-ten chảo parabol, cực trị kinh tế vi mô.],
    [Chương VII: Phương pháp tọa độ Oxy], [Cầu nối vĩ đại số hóa hình học: Biến hình vẽ thành phương trình số.], [René Descartes, Pierre de Fermat, Kepler], [Đồ họa vector màn hình máy tính, quỹ đạo vệ tinh elip, kính James Webb.],
    [Chương VIII: Đại số tổ hợp], [Nắm bắt nghệ thuật đếm các khả năng trong thế giới cấu trúc phức tạp.], [Chu Thế Kiệt, Blaise Pascal, Leonhard Euler], [Mật mã học RSA, phân tích chuỗi xoắn kép DNA, giải thuật đệ quy máy tính.],
    [Chương IX: Xác suất cổ điển], [Lượng hóa sự may rủi, đưa ra quyết định tối ưu giữa sự bất định.], [Chevalier de Méré, Pascal, Fermat, Nash], [Định phí bảo hiểm nhân thọ, thử nghiệm vaccine, lý thuyết trò chơi kinh tế.],
    [3 Chuyên đề Học tập nâng cao], [Mở rộng ma trận khử Gauss, quy nạp toán học và quang học Conic.], [Carl Friedrich Gauss, Maurolico, Apollonius], [Mạng lưới điện thông minh Kirchhoff, tán sỏi thận sóng âm, quỹ đạo Hohmann.],
  )
]

#v(0.8cm)

= MA TRẬN ÁNH XẠ TOÁN 10 VÀO KỶ NGUYÊN TRÍ TUỆ NHÂN TẠO & KHOA HỌC DỮ LIỆU

Rất nhiều học sinh thường hỏi: *"Toán lớp 10 cơ bản thế này thì liên quan gì đến Trí tuệ Nhân tạo hiện đại?"*. Bảng ma trận dưới đây trả lời dứt khoát câu hỏi đó:

#align(center)[
  #table(
    columns: (3.5cm, 5.5cm, 6.5cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e1b4b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    table.header(
      text(fill: rgb("fbbf24"), weight: "bold", size: 9pt)[Chủ Đề Toán 10],
      text(fill: white, weight: "bold", size: 9pt)[Khái Niệm Cốt Lõi Trong AI],
      text(fill: white, weight: "bold", size: 9pt)[Ứng Dụng Thực Tiễn Thời Đại 4.0],
    ),
    [Mệnh đề & Đại số Boole], [Cổng logic bán dẫn, SAT Solvers, Ràng buộc logic trong Prompt], [Kiểm chứng phần mềm tự động (Formal Verification), mạch chip xử lý AI GPU NVIDIA H100.],
    [Lý thuyết Tập hợp], [Biểu diễn không gian mẫu, Phép lọc dữ liệu trong Vector Database], [Hệ thống truy xuất tăng cường tìm kiếm RAG (Retrieval-Augmented Generation) cho LLM.],
    [Hệ BPT & Quy hoạch tuyến tính], [Hàm mục tiêu ràng buộc, Tối ưu hóa đa chiều (Linear Programming)], [Điều phối máy chủ đám mây AWS/Google Cloud, Logistics kho vận tự động hóa robot.],
    [Vectơ & Tích vô hướng], [Vector Embeddings, Độ tương đồng Cosine (Cosine Similarity)], [Cốt lõi của tìm kiếm ngữ nghĩa, nhận diện khuôn mặt FaceID và gợi ý nội dung TikTok.],
    [Thống kê mô tả & Độ phân tán], [Chuẩn hóa dữ liệu (Z-score), Phát hiện ngoại lai (Outlier Detection)], [Tiền xử lý dữ liệu huấn luyện mô hình Machine Learning, lọc nhiễu tín hiệu cảm biến xe Tesla.],
    [Hàm số bậc hai & Parabol], [Thuật toán Tối ưu hóa suy giảm độ dốc (Gradient Descent)], [Hàm mất mát bình phương (Mean Squared Error), cập nhật trọng số trong mạng nơ-ron sâu.],
    [Phương pháp Tọa độ Oxy], [Không gian đặc trưng 2D, Ranh giới phân loại Siêu phẳng (Hyperplane)], [Thuật toán máy học Support Vector Machine (SVM), phân loại u bướu y tế tự động.],
    [Đại số Tổ hợp & Hoán vị], [Không gian trạng thái bài toán (Search Space), Cây quyết định], [Thuật toán Minimax và cây tìm kiếm Monte Carlo Tree Search trong AI vô địch cờ vây AlphaGo.],
    [Xác suất cổ điển & Không gian mẫu], [Mô hình Ngôn ngữ Lớn (LLM), Xác suất chuyển từ tiếp theo (Next Token)], [Cơ chế cốt lõi của ChatGPT: Dự đoán từ có xác suất cao nhất dựa trên phân phối ngữ cảnh.],
    [Chuyên đề: Thuật toán Khử Gauss], [Đại số tuyến tính, Nghịch đảo ma trận và Giải hệ ma trận lớn], [Huấn luyện mạng nơ-ron tích chập (CNN) nhận diện hình ảnh trong thị giác máy tính.],
  )
]

#v(0.8cm)

= HỆ NGUYÊN TẮC 5 CHÂN TRỜI TỰ HỌC & NGHIÊN CỨU DÀNH CHO HỌC SINH LỚP 10

Để chuyển hóa từ lối học vẹt cấp THCS sang phong thái của một nhà nghiên cứu độc lập lớp 10, mỗi học sinh hãy rèn luyện 5 thói quen tư duy kim cương:

1. *Luôn truy vấn cội nguồn lịch sử của từng định lý:* Khi học một định lý mới (như Định lý Côsin, Công thức Heron hay Nhị thức Newton), đừng bao giờ vội vàng lao vào bấm máy tính! Hãy tự hỏi: *"Ai là người đầu tiên phát minh ra công thức này? Họ đối mặt với bài toán bế tắc nào của đời sống mà buộc phải sáng tạo ra nó?"*.
2. *Luyện tập tư duy mô hình hóa trực quan:* Trước khi viết bất kỳ một phương trình đại số nào, hãy cầm bút vẽ nhanh một hình phác họa: một miền đa giác gạch sọc, một hệ trục tọa độ, hoặc một mũi tên vectơ. Trực quan hình ảnh là cầu nối mạnh nhất kích hoạt trí tuệ sáng tạo.
3. *Biến máy tính cầm tay thành công cụ thăm dò, không biến nó thành nạng đỡ:* Dùng máy tính Casio để quét bảng giá trị Table, kiểm tra giả thuyết, nhưng lời giải chặt chẽ và lập luận nhân quả bắt buộc phải sinh ra từ bộ não của các em.
4. *Dũng cảm đối mặt với sai lầm và bế tắc:* Người học sinh tầm thường sợ hãi điểm kém khi làm sai; nhà nghiên cứu chân chính coi mỗi bài toán sai là một cơ hội vàng để bóc tách cái bẫy tâm lý và hoàn thiện tư duy phản biện.
5. *Học tập với khát vọng cống hiến cho tương lai:* Đừng chỉ học để vượt qua một bài kiểm tra 45 phút. Hãy học vì niềm kiêu hãnh của một người trẻ Việt Nam đang chuẩn bị làm chủ công nghệ bán dẫn, trí tuệ nhân tạo và hàng không vũ trụ đưa đất nước bước vào kỷ nguyên mới!

#pagebreak()
'''

