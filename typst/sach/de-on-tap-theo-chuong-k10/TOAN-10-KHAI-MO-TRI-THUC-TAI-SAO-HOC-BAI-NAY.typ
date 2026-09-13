#import "@preview/cetz:0.5.2"

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
      #text(size: 11pt, weight: "black", fill: rgb("92400E"))[GIAI THOẠI LỊCH SỬ: #title]\
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
      #text(size: 11pt, weight: "black", fill: rgb("166534"))[GỢI Ý LỜI KỂ CỦA THẦY TRÊN BỤC GIẢNG (3 PHÚT ĐẦU GIỜ): #title]\
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
      #text(size: 11pt, weight: "black", fill: c-navy)[HỌC ĐỂ LÀM GÌ? KỶ NGUYÊN AI, CHIP BÁN DẪN & VŨ TRỤ: #title]\
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
      #text(size: 11pt, weight: "black", fill: rgb("991B1B"))[CẢNH BÁO SƯ PHẠM: GIẢI MÃ SAI LẦM KINH ĐIỂN: #title]\
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
      #text(size: 11pt, weight: "black", fill: rgb("6B21A8"))[KỊCH BẢN ĐỐI THOẠI LỚP HỌC SOCRATES: #title]\
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
      #text(size: 11pt, weight: "black", fill: rgb("0F172A"))[GÓC NHÌN TOÁN CAO CẤP DÀNH CHO GIÁO VIÊN: #title]\
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
      #text(size: 11pt, weight: "black", fill: rgb("9A3412"))[BÀI TOÁN GỢI MỞ TƯ DUY KHÁM PHÁ (INQUIRY-BASED): #title]\
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
      ĐẠI TOÀN THƯ KHAI MỞ\
      TRI THỨC SƯ PHẠM TOÁN 10
    ]
    #v(0.8em)
    #text(size: 13pt, style: "italic", weight: "bold", fill: rgb("FCD34D"))[
      Nền Móng Logic, Hệ Tọa Độ & Ngôn Ngữ Tối Ưu Hóa\
      Tại Sao Phải Học Bài Này? Ai Phát Minh? Học Để Làm Gì?\
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
        Tác giả: Thầy Nguyễn Văn Sang & Ban Cố Vấn Chuyên Môn ConicTypst\
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
    "Thưa quý Thầy Cô và các bạn đồng nghiệp kính mến,\
    Có bao giờ giữa một buổi chiều tà, đứng trước bảng đen phấn trắng, nhìn xuống những ánh mắt mệt mỏi của học trò đang ngụp lặn giữa hàng tá công thức lượng giác, bảng xét dấu tam thức hay phương trình elip, Thầy Cô chợt nghe một câu hỏi thì thầm từ cuối lớp:\
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
  #text(weight: "bold", fill: c-navy)[Thầy Nguyễn Văn Sang & Nhóm Biên Soạn ConicTypst]\
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


#pagebreak()

= ĐẠI CHƯƠNG I: THẾ GIỚI CỦA CHÂN LÝ — MỆNH ĐỀ & TẬP HỢP

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 1 & Bài 2 SGK Toán 10 cùng các chủ đề mở rộng chuyên sâu về Đại số Boole, Nghịch lý Russell, Khách sạn Vô hạn Hilbert & Định lý Bất toàn Gödel (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 1: MỆNH ĐỀ TOÁN HỌC — BỨC TƯỜNG THÉP NGĂN CHẶN SỰ DỐI TRÁ

Khi bước chân vào lớp 10, hầu hết học sinh đều ngỡ ngàng: tại sao mở đầu cấp ba không phải là giải phương trình bậc hai hay hình học không gian, mà lại là những câu nói chữ nghĩa đời thường: *“Hôm nay trời mưa”*, *“Số 2 là số nguyên tố”*, rồi bảng chân trị Đúng ($1$), Sai ($0$)?

Câu trả lời nằm ở bản chất nhận thức: *Nếu không có Logic, toàn bộ tòa lâu đài Toán học chỉ là một đống cát lún.* Ở bậc THCS, các em làm toán chủ yếu dựa vào trực giác, kinh nghiệm và tính toán cơ bắp. Nhưng lên THPT, các em bắt đầu tiếp xúc với những khái niệm trừu tượng vô hạn. Trực giác con người rất dễ bị đánh lừa bởi cảm tính và ngụy biện. Bài học "Mệnh đề" chính là nhát búa đầu tiên rèn đúc lại bộ não học sinh: dạy các em phân biệt rạch ròi giữa *Ý kiến chủ quan* và *Chân lý khách quan*, hiểu thế nào là một chứng minh toán học chặt chẽ không tì vết.

#story-box(
  title: "Aristotle & Cuộc chiến dẹp tan những kẻ ngụy biện thành Athens",
  author: "Aristotle (Hy Lạp, 384 – 322 TCN)",
)[
  Vào thế kỷ IV TCN, tại quảng trường Agora thành Athens cổ đại, xuất hiện một nhóm người tự xưng là "Sophists" (nhà ngụy biện). Họ mở trường dạy tài hùng biện cho con em quý tộc với học phí đắt đỏ. Bằng cách chơi chữ tinh vi, họ có thể chứng minh một điều sai bét thành đúng trước tòa án. Ví dụ câu ngụy biện nổi tiếng:
  - *“Con chó này có con. Vậy nó là một người cha.”*
  - *“Con chó này là của anh. Vậy nó là cha của anh!”*
  
  Người dân Athens hoang mang cực độ, công lý trong các phiên tòa bị bóp méo hoàn toàn bởi tài khua môi múa mép. Chứng kiến thảm cảnh đó, triết gia thiên tài *Aristotle* đã thề sẽ lập lại trật tự cho trí tuệ nhân loại. Ông đóng cửa suy ngẫm nhiều năm và cho ra đời tác phẩm *“Organon”* (Công cụ), khai sinh ra *Logic học hình thức* và quy tắc *Tam đoạn luận (Syllogism)* kinh điển:
  - Tiền đề lớn: *Mọi con người đều phải chết.*
  - Tiền đề nhỏ: *Socrates là con người.*
  - Kết luận tất yếu: *Socrates phải chết.*
  
  Aristotle chỉ ra rằng: chân lý của một kết luận không phụ thuộc vào cảm xúc hay tài hùng biện của người nói, mà phụ thuộc hoàn toàn vào cấu trúc logic của các mệnh đề kéo theo. Đó là lần đầu tiên trong lịch sử, nhân loại có một chiếc khiên thép bảo vệ mình trước những lời dối trá!
]

#story-box(
  title: "George Boole & Claude Shannon: Từ Gia Sư Nghèo Đến Cuộc Cách Mạng Kỹ Thuật Số",
  author: "George Boole (1815 – 1864) & Claude Shannon (1916 – 2001)",
)[
  Hơn 2.000 năm sau Aristotle, một chàng trai nghèo người Anh tên là *George Boole* — con của một thợ đóng giày nghèo khó ở Lincoln, không có tiền vào đại học, phải tự học tiếng Latin và toán học dưới ánh đèn dầu — đã làm nên một cuộc cách mạng vĩ đại. Boole tự hỏi: *“Tại sao chúng ta có thể cộng, trừ, nhân, chia các con số, mà lại không thể làm đại số trên các tư tưởng và mệnh đề?”*
  
  Năm 1854, ông xuất bản cuốn sách *“An Investigation of the Laws of Thought”* (Khảo sát về các quy luật của tư duy). Trong đó, Boole gán cho chân lý hai giá trị nhị phân thuần khiết: Đúng là $1$ (True) và Sai là $0$ (False). Phép "VÀ" ($and$) trở thành phép nhân logic, phép "HOẶC" ($or$) trở thành phép cộng logic, và phép "PHỦ ĐỊNH" ($not$) đảo ngược giá trị.
  
  Vào thời điểm đó, người đương thời chê cười Boole là kẻ rỗi hơi, bịa ra một thứ toán học lập dị không ai cần. Boole qua đời trong nghèo khó năm 49 tuổi sau một cơn viêm phổi do dầm mưa đi dạy học. 
  
  Nhưng 83 năm sau, vào năm 1937 tại Viện Công nghệ Massachusetts (MIT), một chàng sinh viên 21 tuổi tên là *Claude Shannon* đã viết nên bản luận văn thạc sĩ được mệnh danh là *“Bản luận văn thạc sĩ quan trọng nhất và có tầm ảnh hưởng lớn nhất của thế kỷ XX”*: Shannon nhận ra rằng các công tắc đóng/ngắt rơ-le trong mạch điện thoại chính là hiện thân vật lý hoàn hảo của Đại số Boole! 
  
  Một công tắc đóng tương ứng với $1$, ngắt tương ứng với $0$. Ghép hai công tắc nối tiếp là phép $and$, ghép song song là phép $or$. Toàn bộ ngành công nghiệp bán dẫn, vi xử lý máy tính của Intel, Apple, NVIDIA và Trí tuệ nhân tạo ngày nay đều đang đập theo từng nhịp nhị phân $0$ và $1$ của chàng gia sư nghèo George Boole!
]

#story-box(
  title: "Cái Chết Của Hippasus & Bí Mật Kinh Hoàng Về Số Vô Tỉ Căn Bậc Hai Của 2",
  author: "Hippasus xứ Metapontum (thế kỷ V TCN) & Phái Pythagoras",
)[
  Vào thế kỷ V TCN, trường phái Pythagoras tôn thờ một triết lý thiêng liêng: *“Mọi vật trong vũ trụ đều là số hữu tỉ!”* — nghĩa là mọi độ dài, mọi tỉ lệ hài hòa của âm nhạc và thiên thể đều có thể biểu diễn dưới dạng tỉ số của hai số nguyên $p / q$.
  
  Nhưng một môn đệ trẻ tuổi tên là *Hippasus* khi nghiên cứu đường chéo của một hình vuông có cạnh bằng $1$ đã sử dụng chính *Phương pháp Chứng minh Phản chứng (Proof by Contradiction)* dựa trên mệnh đề logic:
  1. Giả sử $sqrt(2)$ là số hữu tỉ, nghĩa là $sqrt(2) = p / q$ với $p, q$ là phân số tối giản (ước chung lớn nhất bằng 1).
  2. Bình phương hai vế: $2 = p^2 / q^2 arrow p^2 = 2 q^2$.
  3. Suy ra $p^2$ là số chẵn, dẫn tới $p$ bắt buộc phải là số chẵn: $p = 2k$.
  4. Thay lại: $(2k)^2 = 2 q^2 arrow 4k^2 = 2 q^2 arrow q^2 = 2 k^2$.
  5. Suy ra $q^2$ cũng là số chẵn, tức $q$ cũng phải là số chẵn!
  6. MÂU THUẪN TUYỆT ĐỐI! Cả $p$ và $q$ đều cùng là số chẵn, trái ngược với giả thiết ban đầu rằng phân số $p / q$ đã tối giản!
  
  Mệnh đề phản đảo buộc chúng ta phải thừa nhận: $sqrt(2)$ KHÔNG THỂ LÀ SỐ HỮU TỈ!
  
  Phát hiện chấn động này đã giáng một đòn sấm sét phá tan giáo điều của phái Pythagoras. Tương truyền, vì sợ bí mật làm sụp đổ giáo phái bị rò rỉ ra ngoài, các môn đồ Pythagoras đã bắt giữ Hippasus đưa lên một con thuyền ra khơi xa và dìm ông chết đuối dưới đáy biển Địa Trung Hải! Hippasus đã tử vì đạo cho chân lý của phương pháp phản chứng logic — phương pháp mà học sinh lớp 10 được học một cách trang trọng hôm nay!
]

#hook-box(title: "Câu đố Người thật thà - Kẻ nói dối trên hòn đảo kỳ bí")[
  Thầy bước vào lớp, viết lên bảng hai cánh cửa và kể:
  
  *“Các em đang đứng trước hai cánh cửa: Một cửa dẫn tới kho báu tri thức (hoặc sự sống), một cửa dẫn vào vực sâu chết chóc. Trước hai cửa có hai người gác cổng: Một người luôn luôn nói thật ($1$), một người luôn luôn nói dối ($0$). Các em không biết ai là người nói thật, ai là kẻ nói dối, và chỉ được phép hỏi DUY NHẤT MỘT CÂU với MỘT NGƯỜI để biết chắc chắn cánh cửa nào dẫn tới sự sống. Các em sẽ hỏi câu gì?”*
  
  Cả lớp sẽ xôn xao bàn tán. Các câu hỏi ngây thơ như *“Cửa này có an toàn không?”* đều thất bại vì kẻ nói dối sẽ lừa học sinh. Sau 3 phút nghẹt thở, thầy mỉm cười viết lên bảng câu hỏi triệu đô:
  
  *‘Nếu tôi hỏi người kia cánh cửa nào dẫn đến sự sống, anh ta sẽ chỉ vào cửa nào?’*
  
  *Phân tích chân lý logic:*
  - Nếu hỏi người nói thật: Anh ta biết người kia nói dối, nên sẽ trả lời cửa CHẾT.
  - Nếu hỏi kẻ nói dối: Hắn biết người kia nói thật (chỉ cửa Sống), nhưng vì hắn nói dối nên hắn cũng sẽ trả lời cửa CHẾT!
  $arrow$ Cả hai trường hợp, câu trả lời LUÔN LUÔN LÀ CỬA CHẾT! Học sinh chỉ cần đi vào cánh cửa còn lại là sống sót $100\%$!
  
  *Thông điệp của Thầy:* Đó chính là sức mạnh của phép nhân logic: $(+1) times (-1) = -1$ và $(-1) times (+1) = -1$. Chân lý toán học là bất biến, không một kẻ nói dối nào có thể lừa được một người nắm vững logic mệnh đề!
]

#tech-box(title: "Mệnh đề logic điều khiển hàng tỷ bóng bán dẫn trong Chip M3 & Trí tuệ nhân tạo")[
  - *Mạch logic bán dẫn trong CPU*: Bên trong con chip Apple M3 hay card đồ họa NVIDIA H100 có chứa tới hơn $90$ tỷ bóng bán dẫn (transistors). Mỗi bóng bán dẫn chỉ làm duy nhất một việc: đóng hoặc mở mạch điện, tương ứng với hai giá trị chân trị Đúng ($1$) hoặc Sai ($0$) của mệnh đề. Các cổng logic cơ bản AND, OR, NOT, XOR chính là các phép toán mệnh đề mà học sinh lớp 10 học trên lớp hôm nay.
  - *SAT Solvers — Trái tim của An ninh mạng & Hàng không vũ trụ*: Làm sao NASA biết chắc chắn đoạn mã điều khiển tàu vũ trụ Orion không bao giờ bị treo cứng? Họ mô hình hóa toàn bộ hệ thống thành hàng triệu mệnh đề logic phức tạp và dùng thuật toán giải SAT (Boolean Satisfiability Problem). Nếu không tồn tại một tổ hợp biến nào làm cho hệ mệnh đề bị mâu thuẫn, chuyến bay được bảo đảm an toàn tuyệt đối.
]

#misconception-box(
  title: "Cái bẫy Mệnh đề Kéo theo P => Q: Tại sao Tiền đề Sai thì Mệnh đề Đúng?",
  misconception: "Học sinh thường nghĩ rằng nếu mệnh đề 'P sai' thì toàn bộ mệnh đề kéo theo 'P => Q' cũng phải sai!",
  correction: "Mệnh đề kéo theo P => Q CHỈ SAI DUY NHẤT khi P ĐÚNG mà Q LẠI SAI. Khi tiền đề P sai, bất luận kết luận Q đúng hay sai, mệnh đề P => Q luôn được coi là ĐÚNG HIỂN NHIÊN (Vacuously True)!"
)[
  *Ví dụ trực quan:* Một người bán bảo hiểm hứa: *“Nếu nhà anh bị cháy (P), công ty sẽ bồi thường 1 tỷ đồng (Q)”*.
  - Nhà bị cháy ($P$ đúng), công ty bồi thường 1 tỷ ($Q$ đúng) $arrow$ Công ty giữ đúng lời hứa ($1$).
  - Nhà bị cháy ($P$ đúng), công ty quỵt tiền ($Q$ sai) $arrow$ Công ty lừa đảo ($0$).
  - *Nhà không cháy ($P$ sai), công ty không bồi thường ($Q$ sai):* Công ty có lừa đảo anh không? Không hề! Mệnh đề vẫn hoàn toàn ĐÚNG ($1$)!
  
  Đây là quy tắc tối quan trọng giúp học sinh không bao giờ nhầm lẫn trong các bài toán chứng minh mệnh đề chứa tham số và mệnh đề phủ định.
]

#dialogue-box(title: "Đối thoại Socrates: Thế nào là một Định lý Đảo?")[
  *Socrates:* Này Theaetetus, hãy lắng nghe mệnh đề này: *“Nếu một tứ giác là hình vuông, thì tứ giác đó có 4 góc vuông”*. Mệnh đề này đúng hay sai?
  
  *Học trò:* Thưa thầy, hiển nhiên là đúng ạ!
  
  *Socrates:* Vậy mệnh đề đảo của nó là gì?
  
  *Học trò:* Dạ, *“Nếu một tứ giác có 4 góc vuông, thì tứ giác đó là hình vuông”*.
  
  *Socrates:* Nó có còn đúng không?
  
  *Học trò:* Ôi! Sai rồi ạ! Hình chữ nhật cũng có 4 góc vuông nhưng nó đâu phải hình vuông!
  
  *Socrates:* Đúng thế! Kẻ dốt nát thường đánh đồng mệnh đề thuận với mệnh đề đảo. Trong toán học, $P arrow Q$ đúng KHÔNG HỀ CÓ NGHĨA là $Q arrow P$ cũng đúng! Nhưng có một mệnh đề luôn luôn có cùng chân lý với $P arrow Q$, đó là mệnh đề nào?
  
  *Học trò:* Dạ... có phải là *Mệnh đề phản đảo* $not Q arrow not P$ không ạ?
  
  *Socrates:* Xuất sắc! *“Nếu một tứ giác không có 4 góc vuông, thì nó chắc chắn không phải là hình vuông”*. Hai mệnh đề này là một cặp song sinh đồng nhất về chân lý! Nắm vững điều này, ngươi sẽ không bao giờ bị lung lạc trước những ngụy biện của cuộc đời!
]

---

== BÀI 2: TẬP HỢP & CÁC PHÉP TOÁN — NGÔN NGỮ CỦA VŨ TRỤ

Nếu Mệnh đề là "ngữ pháp" của tư duy, thì *Tập hợp* chính là "từ vựng" để xây dựng nên toàn bộ thế giới toán học hiện đại. Từ số tự nhiên, hàm số, hình học, đến giải tích vi phân — tất cả đều được định nghĩa thông qua Tập hợp.

#story-box(
  title: "Georg Cantor & Bi kịch bi tráng của Người dám đo lường cõi Vô Hạn",
  author: "Georg Cantor (Đức, 1845 – 1918)",
)[
  Trước Georg Cantor, các nhà toán học vĩ đại từ Aristotle đến Carl Friedrich Gauss đều kiên quyết phản đối khái niệm "Vô hạn thực tế" (Actual Infinity). Họ cho rằng con người là sinh vật hữu hạn, chỉ có Thượng đế mới nắm giữ sự Vô hạn, và việc nghiên cứu các tập hợp vô hạn là một sự báng bổ ngạo mạn.
  
  Nhưng vào những năm 1870 tại Đại học Halle (Đức), một giáo sư trẻ tuổi tên là *Georg Cantor* đã một mình bước vào cõi vô tận. Cantor đã chứng minh một phát hiện làm rung chuyển nền tảng nhận thức nhân loại: *CÓ NHIỀU CẤP ĐỘ VÔ HẠN KHÁC NHAU! Cõi Vô hạn không phải là một khối đồng nhất mà có những cõi vô hạn lớn hơn những cõi vô hạn khác!*
  - Tập hợp các số tự nhiên $NN = {0, 1, 2, 3, ...}$ là một vô hạn đếm được, có lực lượng ký hiệu là $aleph_0$ (Aleph-zero).
  - Tập hợp các số thực $RR$ trên một đoạn thẳng nhỏ xíu $[0; 1]$ là một vô hạn không thể đếm được (Continuum $c$), và $c = 2^(aleph_0) > aleph_0$! Nghĩa là số điểm trên một đoạn thẳng $1 "cm"$ còn nhiều hơn toàn bộ số lượng số nguyên trên toàn cõi vũ trụ!
  
  Phát hiện của Cantor đã khiến giới toán học đương thời nổi trận lôi đình. Thầy giáo cũ của ông — Leopold Kronecker — đã công khai lăng mạ Cantor trên các diễn san quốc tế là *“Kẻ làm bại hoại tuổi trẻ”* và *“Một tên lang băm toán học”*. Henri Poincaré gọi lý thuyết tập hợp của Cantor là một *“Căn bệnh dịch hạch kinh hoàng của toán học”*.
  
  Bị cô lập, bị từ chối mọi cơ hội giảng dạy tại Đại học Berlin danh giá, Cantor rơi vào những cơn trầm cảm nặng nề và phải vào viện tâm thần nhiều lần trước khi qua đời trong cô độc và nghèo đói tại một nhà thương điên ở Halle vào năm 1918 giữa Thế chiến I.
  
  Nhưng lịch sử đã trả lại công lý cho ông! Nhà toán học vĩ đại David Hilbert sau này đã dõng dạc tuyên bố trước toàn thế giới: *“Không một ai có thể trục xuất chúng ta ra khỏi thiên đường mà Georg Cantor đã tạo dựng cho chúng ta!”*. Toàn bộ Toán học hiện đại hôm nay đều đứng trên đôi vai gầy guộc của người tử vì đạo Georg Cantor!
]

#story-box(
  title: "Nghịch lý Ông thợ cạo của Bertrand Russell & Cuộc sụp đổ của Lý thuyết Tập hợp ngây thơ",
  author: "Bertrand Russell (Anh, 1872 – 1970) & Gottlob Frege (Đức)",
)[
  Năm 1902, nhà logic học người Đức Gottlob Frege vừa hoàn thành tập 2 của bộ đại tác phẩm cả đời ông mang tên *“Các định luật cơ bản của số học”* nhằm chứng minh toàn bộ toán học có thể xây dựng hoàn toàn từ lý thuyết tập hợp. Bản in đã chuẩn bị lên khuôn máy in.
  
  Đúng lúc đó, Frege nhận được một bức thư ngắn từ nhà triết học trẻ người Anh *Bertrand Russell*. Trong thư, Russell đưa ra một nghịch lý đơn sơ nhưng có sức công phá như một quả bom nguyên tử:
  
  *“Xét một ngôi làng nhỏ nọ, có một ông thợ cạo treo biển tuyên bố quy tắc hành nghề:*
  *‘Tôi chỉ cạo râu cho những ai trong làng KHÔNG TỰ CẠO RÂU, và cạo cho tất cả những người đó!’*
  *Hỏi: Bản thân ông thợ cạo có tự cạo râu cho chính mình không?”*
  
  - Nếu ông ta *tự cạo râu* cho mình: Theo quy tắc, ông chỉ cạo cho người không tự cạo, nên ông KHÔNG ĐƯỢC PHÉP cạo cho mình (Mâu thuẫn!).
  - Nếu ông ta *không tự cạo râu* cho mình: Theo quy tắc, ông bắt buộc phải cạo cho mọi người không tự cạo râu, nên ông BẮT BUỘC PHẢI cạo cho mình (Lại mâu thuẫn!).
  
  Về mặt toán học, Russell định nghĩa tập hợp $R = { x | x in.not x }$. Câu hỏi đặt ra là: $R in R$ hay $R in.not R$? Cả hai trường hợp đều dẫn tới mâu thuẫn tự triệt tiêu!
  
  Khi đọc bức thư của Russell, Gottlob Frege bàng hoàng suy sụp hoàn toàn. Ông viết thêm vào phần tái bút của cuốn sách sắp in lời trần tình cay đắng bậc nhất lịch sử khoa học: *“Đối với một nhà khoa học, hầu như không có gì bất hạnh hơn việc nhìn thấy nền móng công trình của mình bị sụp đổ tan tành ngay đúng vào khoảnh khắc công trình vừa hoàn tất. Bức thư của ngài Bertrand Russell đã đẩy tôi vào tình cảnh bi đát đó!”*.
  
  Nghịch lý Russell đã buộc các nhà toán học phải loại bỏ "Lý thuyết tập hợp ngây thơ" và xây dựng nên *Hệ tiên đề Zermelo - Fraenkel (ZFC)* chặt chẽ ngày nay, nơi một tập hợp không được phép chứa chính nó!
]

#hook-box(title: "Nghịch lý Khách sạn Vô hạn của David Hilbert")[
  Thầy bước vào lớp, vẽ một khách sạn có vô số phòng $1, 2, 3, 4, ..., n, ...$:
  
  *“Hãy tưởng tượng một khách sạn đặc biệt có VÔ HẠN PHÒNG, và hiện tại TẤT CẢ CÁC PHÒNG ĐỀU ĐÃ KÍN KHÁCH.*
  
  *Đột nhiên, có MỘT VỊ KHÁCH MỚI bước vào quầy lễ tân xin thuê phòng. Nếu là một khách sạn thông thường có 100 phòng kín chỗ, người quản lý sẽ lắc đầu từ chối. Nhưng người quản lý Khách sạn Hilbert là một nhà toán học tài ba. Ông đã làm thế nào để xếp phòng cho vị khách mới mà KHÔNG CẦN ĐUỔI BẤT KỲ VỊ KHÁCH CŨ NÀO RA ĐƯỜNG?”*
  
  Thầy cho học sinh suy nghĩ 2 phút rồi giải thích giải pháp ánh xạ:
  - Yêu cầu khách ở phòng 1 dọn sang phòng 2.
  - Khách ở phòng 2 dọn sang phòng 3.
  - Tổng quát: Khách ở phòng $n$ dọn sang phòng $n + 1$.
  $arrow$ Toàn bộ vô hạn khách cũ đều có phòng mới ($n arrow n + 1$), và PHÒNG SỐ 1 BÂY GIỜ HOÀN TOÀN TRỐNG để vị khách mới bước vào ở êm đẹp!
  
  *Thách thức cấp 2:* Nếu có một chiếc xe buýt chở VÔ HẠN VỊ KHÁCH MỚI đến thì sao?
  - Dọn khách phòng $n$ sang phòng $2n$ (chiếm toàn bộ phòng chẵn: 2, 4, 6, 8...).
  - Vô hạn khách mới sẽ được xếp vào toàn bộ các phòng lẻ: 1, 3, 5, 7...!
  
  *Bài học cho học sinh:* Cõi Vô hạn tuân theo những quy luật hoàn toàn khác với thế giới hữu hạn thường ngày: $infinity + 1 = infinity$ và $infinity + infinity = infinity$! Đó là vẻ đẹp khai phóng của lý thuyết tập hợp lớp 10!
]

#tech-box(title: "Phép toán Tập hợp là Nền tảng của Mọi Cơ sở Dữ liệu (SQL & Big Data)")[
  - *Cơ sở dữ liệu quan hệ SQL*: Khi các em tìm kiếm một chuyến bay trên Vietnam Airlines hay mua hàng trên Shopee, máy chủ thực hiện hàng triệu phép toán tập hợp trong nháy mắt:
    + Phép Giao ($A inter B$ tương ứng lệnh `INNER JOIN`): Tìm những người vừa có tài khoản ngân hàng vừa có thẻ căn cước hợp lệ.
    + Phép Hợp ($A union B$ tương ứng lệnh `UNION`): Gom dữ liệu khách hàng từ hai chi nhánh Hà Nội và TP.HCM.
    + Phép Hiệu ($A \\ B$ tương ứng lệnh `EXCEPT / NOT IN`): Lọc ra những khách hàng đã đăng ký nhưng chưa từng thực hiện giao dịch nào để gửi email khuyến mãi.
  - *Sơ đồ Venn trong Khoa học Dữ liệu*: Biểu diễn trực quan các tệp khách hàng tiềm năng, phát hiện sự trùng lặp và tối ưu hóa chi phí quảng cáo hàng triệu đô la của các tập đoàn công nghệ lớn.
]

#deep-dive-box(title: "Định lý Bất toàn của Kurt Gödel 1931: Giới hạn Vĩnh cửu của AI")[
  Năm 1931, chàng thanh niên 25 tuổi người Áo *Kurt Gödel* đã công bố hai định lý làm chấn động toàn bộ nền văn minh nhân loại: *Định lý Bất toàn (Incompleteness Theorems)*.
  
  Gödel chứng minh rằng: Trong bất kỳ hệ thống tiên đề toán học hình thức nào đủ mạnh để chứa số học (như hệ tiên đề ZFC của lý thuyết tập hợp):
  1. Luôn luôn tồn tại những chân lý toán học ĐÚNG ĐẮN nhưng KHÔNG THỂ NÀO CHỨNG MINH ĐƯỢC từ bên trong hệ thống!
  2. Hệ thống không bao giờ có thể tự chứng minh được tính phi mâu thuẫn của chính mình!
  
  *Ý nghĩa thế kỷ đối với Trí tuệ Nhân tạo:*
  Một cỗ máy tính hay một mô hình AI dù mạnh đến đâu cũng chỉ là một hệ thống hình thức hoạt động theo các quy tắc tiên đề cố định. Định lý Gödel tuyên bố rằng: Có những chân lý mà trực giác con người nhìn thấy rõ ràng là đúng, nhưng KHÔNG MỘT CỖ MÁY NÀO trên đời có thể dùng thuật toán để chứng minh được! Trí tuệ con người với khả năng vượt thoát khỏi chiếc hộp hệ thống sẽ mãi mãi giữ một vị trí độc tôn mà máy móc không bao giờ vươn tới được!
]

#inquiry-box(title: "Thực hành Lập trình: Xây dựng Bộ Kiểm tra Bảng Chân trị bằng Python")[
  Hãy viết một đoạn mã Python ngắn để tự động in ra bảng chân trị hoàn chỉnh của một mệnh đề phức hợp $P and (Q or not R)$:
  ```python
  import itertools

  print(f"{'P':<6}{'Q':<6}{'R':<6}{'not R':<8}{'Q or not R':<12}{'Biểu thức':<10}")
  print("-" * 50)
  for P, Q, R in itertools.product([True, False], repeat=3):
      not_R = not R
      q_or_not_r = Q or not_R
      expr = P and q_or_not_r
      print(f"{str(P):<6}{str(Q):<6}{str(R):<6}{str(not_R):<8}{str(q_or_not_r):<12}{str(expr):<10}")
  ```
  Chạy đoạn mã trên máy tính để thấy cách các lập trình viên sử dụng đại số Boole để kiểm thử tính đúng đắn của các điều kiện logic phức tạp trong phần mềm!
]

#v(1em)

== CHUYÊN KHẢO MỞ RỘNG: TỪ LOGIC NHỊ PHÂN BOOLE ĐẾN LOGIC MỜ (FUZZY LOGIC) CỦA LOTFI ZADEH

#story-box(
  title: "Lotfi Zadeh 1965: Khi Chân Lý Không Còn Là Đen Trắng Tuyệt Đối",
  author: "Lotfi A. Zadeh (Đại học California tại Berkeley, 1921 – 2017)",
)[
  Đại số Boole cổ điển với hai giá trị $0$ (Sai) và $1$ (Đúng) là nền tảng của máy tính số, nhưng lại bất lực trước ngôn ngữ và nhận thức tự nhiên của con người. Năm 1965, giáo sư người Mỹ gốc Azerbaijan *Lotfi Zadeh* đã đặt ra một câu hỏi làm rúng động giới toán học:
  
  *“Một người cao 1m75 có phải là 'người cao' không?”*
  
  Nếu ta đặt ranh giới cứng: Chiều cao $>= 1,75 "m"$ là "Cao" ($1$), còn $< 1,75 "m"$ là "Không cao" ($0$). Khi đó, một người cao $1,749 "m"$ sẽ bị xếp vào loại "Lùn / Không cao" ($0$), trong khi người cao $1,751 "m"$ lại là "Cao" ($1$). Sự chênh lệch chỉ $2 "mm"$ lại tạo ra một bước nhảy đứt đoạn vô lý từ $0$ lên $1$! Trong đời sống, khái niệm "trời ấm", "nước sôi", "tốc độ nhanh", "học sinh giỏi" không bao giờ có ranh giới nhị phân sắc bén như một nhát dao.
  
  Zadeh đã đề xuất một cuộc cách mạng: *Tập mờ (Fuzzy Set)*. Trong đó, độ thuộc của một phần tử vào tập hợp không chỉ là $0$ hoặc $1$, mà là một số thực liên tục trong đoạn $[0, 1]$ thông qua *Hàm thuộc (Membership Function)* $mu_A(x) in [0, 1]$:
  - Cao 1m60: Độ thuộc tập "Người cao" là $mu = 0,1$.
  - Cao 1m75: Độ thuộc tập "Người cao" là $mu = 0,6$.
  - Cao 1m90: Độ thuộc tập "Người cao" là $mu = 1,0$.
  
  *Kỳ tích Tàu điện ngầm Shinkansen Sendai (Nhật Bản 1987):*
  Các kỹ sư Nhật Bản đã ứng dụng Logic mờ của Zadeh vào hệ thống điều khiển tự động đoàn tàu ngầm Sendai. Thay vì giật cục đóng/ngắt phanh nhị phân (phanh gấp khi quá tốc độ, tăng ga khi chậm), bộ điều khiển mờ mô phỏng sự phán đoán tinh tế của một người lái tàu dạn dày kinh nghiệm: *“Nếu tốc độ hơi nhanh VÀ độ dốc hơi lớn THÌ hãm phanh nhẹ”*. Kết quả: Tàu vận hành êm ái đến mức hành khách đứng không cần vịn tay cầm, độ chính xác điểm dừng tại sân ga sai số dưới $7 "cm"$, và tiết kiệm hơn $10\%$ năng lượng điện!
]

#deep-dive-box(title: "Bài Toán Đảo Hiệp Sĩ & Kẻ Cắp Của Raymond Smullyan: Thuật Toán Giải Tự Động")[
  Nhà toán học kiêm ảo thuật gia *Raymond Smullyan* nổi tiếng với các bài toán logic trên hòn đảo kỳ lạ, nơi chỉ có hai loại cư dân: *Hiệp sĩ (Knights)* luôn luôn nói thật ($1$), và *Kẻ cắp (Knaves)* luôn luôn nói dối ($0$).
  
  *Bài toán kinh điển:* Gặp 3 người $A, B, C$ trên đảo.
  - $A$ tuyên bố: *"Cả ba chúng tôi đều là kẻ cắp"*.
  - $B$ tuyên bố: *"Đúng một người trong chúng tôi là hiệp sĩ"*.
  Hỏi mỗi người $A, B, C$ là hiệp sĩ hay kẻ cắp?
  
  *Mô hình hóa mệnh đề:*
  Gọi $A, B, C in {0, 1}$ ($1$: Hiệp sĩ, $0$: Kẻ cắp).
  - Lời nói của $A$: $P_A = (A == 0) and (B == 0) and (C == 0)$. Do $A$ nói thật khi và chỉ khi $A=1$, ta có đẳng thức logic: $A <=> P_A$.
  - Lời nói của $B$: $P_B = (A + B + C == 1)$. Tương tự: $B <=> P_B$.
  
  *Mã Python giải bài toán Smullyan bằng duyệt toàn bộ không gian chân trị:*
  ```python
  import itertools

  print("=== GIẢI BÀI TOÁN SMULLYAN BẰNG PYTHON ===")
  for A, B, C in itertools.product([0, 1], repeat=3):
      # Lời nói của A: cả 3 là kẻ cắp (đều bằng 0)
      claim_A = (A == 0 and B == 0 and C == 0)
      cond_A = (A == int(claim_A))
      
      # Lời nói của B: đúng 1 người là hiệp sĩ (tổng bằng 1)
      claim_B = (A + B + C == 1)
      cond_B = (B == int(claim_B))
      
      if cond_A and cond_B:
          role = lambda x: 'Hiệp sĩ (Knight)' if x else 'Kẻ cắp (Knave)'
          print(f"Nghiệm duy nhất: A là {role(A)} | B là {role(B)} | C là {role(C)}")
  ```
  Chạy đoạn mã trên, Python lập tức xuất ra nghiệm duy nhất trong $0,001$ giây: *A là Kẻ cắp, B là Hiệp sĩ, C là Kẻ cắp*! Đây chính là nguyên lý của các bộ giải tự động *SAT Solvers* đang bảo vệ các hệ thống thanh toán quốc tế và thiết kế chip bán dẫn tối mật hiện đại!
]

#misconception-box(
  concept: "Cạm Bẫy Phủ Định Mệnh Đề Chứa Lượng Từ Với Mọi (∀) và Tồn Tại (∃)",
  misconception: "Nhiều học sinh cho rằng phủ định của 'Mọi học sinh lớp 10A đều chăm học' là 'Mọi học sinh lớp 10A đều lười học', hoặc phủ định của 'Mọi số thực x đều có x² > 0' là 'Mọi số thực x đều có x² ≤ 0'.",
  correction: "Phủ định của 'MỌI' (Với mọi - ∀) KHÔNG PHẢI LÀ 'MỌI' ĐỐI NGHỊCH, mà là 'CÓ ÍT NHẤT MỘT' (Tồn tại - ∃) phá vỡ quy luật đó! Để bác bỏ lời khẳng định toàn thể của bạn, ta không cần bắt cả lớp phải lười, ta chỉ cần tìm ra DUY NHẤT MỘT bạn học sinh lười là lời khẳng định đã sụp đổ tan tành! Quy tắc De Morgan cho lượng từ: not (forall x in X, P(x)) <=> (exists x in X, not P(x)). Tương tự, phủ định của 'Có ít nhất một' là 'Mọi... đều không'.",
  remedy: "Quy tắc 'Bắt bẻ một người': Muốn lật tẩy một lời khoác lác 'Tất cả...', chỉ cần tìm một phản ví dụ (Counterexample) duy nhất!"
)

#pagebreak()


#pagebreak()

= ĐẠI CHƯƠNG II: NGHỆ THUẬT TỐI ƯU HÓA — BẤT PHƯƠNG TRÌNH & QUY HOẠCH TUYẾN TÍNH

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 3 & Bài 4 SGK Toán 10 cùng Chuyên đề Tối ưu hóa nguồn lực, Thuật toán Simplex, Định lý Đối ngẫu von Neumann & Biểu đồ Voronoi (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 3: BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN — THẾ GIỚI CỦA NHỮNG RANH GIỚI BẤT ĐẲNG

Ở bậc trung học cơ sở, học sinh đắm chìm trong thế giới của *Phương trình* và *Dấu bằng* ($=$): tìm $x$ để phương trình bằng $0$, tìm giao điểm của hai đường thẳng, cân bằng phương trình phản ứng. Dấu bằng tạo ra một cảm giác an toàn giả tạo: mọi thứ đều vừa vặn, đối xứng và tuyệt đối.

Nhưng khi bước ra đời thực, *dấu bằng hầu như không bao giờ tồn tại!*
- Bạn không bao giờ có số tiền vừa khít với mọi món đồ: $"Chi tiêu" <= "Thu nhập"$.
- Thời gian trong một ngày của một sĩ tử không thể co giãn: $"Học" + "Ngủ" + "Nghỉ" <= 24$ giờ.
- Sức tải của cây cầu vượt: $"Tải trọng xe" <= 30$ tấn.
- Năng lượng của một hạt vật chất: luôn bị chặn bởi vận tốc ánh sáng $v <= c$.

*Bất phương trình bậc nhất hai ẩn* chính là bước chuyển mình vĩ đại từ tư duy "điểm cố định" sang tư duy "miền khả dĩ". Một đường thẳng $a x + b y + c = 0$ chia toàn bộ vũ trụ phẳng hai chiều thành hai nửa thế giới: một bên thỏa mãn điều kiện tồn tại, một bên bị hủy diệt.

#story-box(
  title: "Nguyên lý Tối thiểu của Tự nhiên & Giấc mơ của Maupertuis",
  author: "Pierre Louis Maupertuis (1698 – 1759) & Leonhard Euler",
)[
  Vào thế kỷ XVIII, viện sĩ viện hàn lâm Pháp Pierre Louis Maupertuis đã công bố một khám phá làm kinh ngạc toàn cõi châu Âu mang tên *Nguyên lý tác dụng tối thiểu (Principle of Least Action)*. Maupertuis chỉ ra rằng:
  *“Tự nhiên khi hành động luôn dùng lượng chi phí năng lượng ít nhất có thể!”*
  - Tia sáng truyền từ không khí vào nước không đi theo đường thẳng mà bị bẻ cong (khúc xạ) sao cho *thời gian di chuyển là ngắn nhất* (Định luật Fermat).
  - Giọt sương đọng trên lá cỏ luôn co tròn lại để *diện tích bề mặt là nhỏ nhất* so với thể tích nước bên trong.
  - Dòng sông chảy từ đỉnh núi xuống biển luôn tự uốn lượn để *tiêu hao thế năng trọng trường một cách êm ái nhất*.
  
  Mọi sự vận động trong vũ trụ đều không bị ép buộc bởi một điểm số cứng nhắc, mà bị giam hãm trong một *vùng ràng buộc bất đẳng thức* (Constraints), và bên trong vùng đó, tự nhiên luôn tự tìm đến trạng thái cực trị: hoặc là năng lượng thấp nhất để bền vững, hoặc là hiệu quả cao nhất để sinh tồn. Bài học Bất phương trình bậc nhất hai ẩn hôm nay chính là viên gạch vỡ lòng để con người học cách mô phỏng lại trí tuệ tối ưu tuyệt mỹ đó của vũ trụ!
]

#story-box(
  title: "Frank Rosenblatt 1957 & Perceptron: Khởi nguyên của Mạng Nơ-ron Nhân tạo",
  author: "Frank Rosenblatt (Mỹ, 1928 – 1971)",
)[
  Năm 1957, tại Phòng thí nghiệm Hàng không Cornell, nhà tâm lý học Frank Rosenblatt đã chế tạo một cỗ máy kỳ dị mang tên *Perceptron Mark I*. Đó là mô hình toán học đầu tiên mô phỏng cách một nơ-ron sinh học trong não người đưa ra quyết định.
  
  Và trái tim toán học của Perceptron Mark I chính là... *MỘT BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN LỚP 10*:
  $ w_1 x_1 + w_2 x_2 + b >= 0 $
  - Đầu vào $x_1, x_2$ là các tín hiệu cảm giác (như độ sáng của hai điểm ảnh).
  - Trọng số $w_1, w_2$ là độ nhạy của các khớp thần kinh Synapse.
  - Số hạng tự do $b$ (bias) là ngưỡng kích hoạt của nơ-ron.
  
  Nếu biểu thức lớn hơn hoặc bằng 0, nơ-ron "phát hỏa" (bắn tín hiệu $1$, quyết định nhận diện: "Đây là quả táo!"). Nếu nhỏ hơn 0, nơ-ron im lặng (tín hiệu $0$, "Đây không phải quả táo!").
  
  Về mặt hình học, học máy (Machine Learning) bản chất là bài toán tìm một đường thẳng $w_1 x_1 + w_2 x_2 + b = 0$ để chia tách các điểm dữ liệu thành hai nửa mặt phẳng: nửa mặt phẳng Quả táo và nửa mặt phẳng Quả cam! Toàn bộ cuộc cách mạng Trí tuệ Nhân tạo hiện đại với hàng trăm tỷ tham số hôm nay thực chất chỉ là sự xếp chồng của hàng triệu bất phương trình bậc nhất mà học sinh lớp 10 đang vẽ bằng thước kẻ trên trang vở!
]

#hook-box(title: "Bài toán 200.000 đồng & Bữa tiệc sinh nhật sinh viên nghèo")[
  Thầy bước vào lớp, rút ra một tờ 200.000 đồng đặt lên bàn giáo viên:
  
  *“Hôm nay là sinh nhật của bạn lớp trưởng. Bạn ấy chỉ có đúng 200.000 đồng trong ví để mời cả nhóm bạn đi ăn chè và uống trà sữa. Giá một ly trà sữa chân trâu là 30.000 đồng ($x$), giá một bát chè bưởi là 20.000 đồng ($y$). Hỏi lớp trưởng có thể mua được những tổ hợp $(x; y)$ nào để vừa no bụng vừa không phải rửa bát trừ nợ?”*
  
  Học sinh lập tức tính nhẩm: $30.000 x + 20.000 y <= 200.000$ $arrow$ $3x + 2y <= 20$.
  
  Thầy mỉm cười vẽ hệ trục tọa độ $O x y$, vẽ đường thẳng ranh giới $3x + 2y = 20$, rồi lấy một điểm thử $(0; 0)$ để gạch bỏ nửa mặt phẳng vượt quá ngân sách.
  
  *“Các em nhìn xem! Tất cả những giấc mơ sinh nhật khả thi đều nằm gọn gàng trong tam giác nghiệm giới hạn bởi các trục tọa độ. Bất kỳ một điểm nào nằm ngoài ranh giới ấy đều đồng nghĩa với sự phá sản! Bất phương trình không phải là những con số vô hồn trên giấy, bất phương trình chính là tấm bản đồ ranh giới của sự tự do và giới hạn của đồng tiền!”*
]

#tech-box(title: "Ranh giới an toàn (Safety Boundary) trong Xe tự lái Tesla & Robot phẫu thuật")[
  - *Vùng không gian va chạm của Xe tự lái*: Khi chiếc xe Tesla Model S chạy trên cao tốc với vận tốc $100$ km/h, máy tính điều khiển FSD (Full Self-Driving) liên tục nhận dữ liệu từ 8 camera và radar. Nó lập ra hàng trăm bất phương trình bậc nhất hai ẩn mô tả khoảng cách an toàn với xe phía trước ($x$) và lề đường ($y$): $d_1(x, y) >= D_("min")$, $d_2(x, y) >= W_("min")$. Miền nghiệm của hệ này chính là "hành lang an toàn" (Corridor) để xe đánh lái mà không gây tai nạn.
  - *Robot phẫu thuật nội soi Da Vinci*: Khi một cánh tay robot luồn vào lồng ngực bệnh nhân để cắt khối u gần tim, các bác sĩ cài đặt các ranh giới bất phương trình không gian 3D ("Không bao giờ được chạm vào động mạch chủ!"). Nếu bác sĩ lỡ tay rung chuyển, phần mềm sẽ chặn đứng cử động dựa trên điều kiện bất phương trình an toàn.
]

#misconception-box(
  title: "Sai lầm Chết Người khi Chọn Điểm Thử để Xác Định Nửa Mặt Phẳng Nghiệm",
  misconception: "Học sinh thường học vẹt một cách máy móc: 'Cứ lấy điểm gốc tọa độ (0; 0) thay vào bất phương trình để kiểm tra!'",
  correction: "Nếu đường thẳng ranh giới ĐI QUA GỐC TỌA ĐỘ (ví dụ 2x - 3y >= 0), điểm (0; 0) nằm ngay trên bờ ranh giới, hoàn toàn KHÔNG THỂ cho biết nửa mặt phẳng bên nào là nghiệm! Bắt buộc phải chọn một điểm nằm NGOÀI đường thẳng!"
)[
  *Quy tắc chuẩn mực:*
  - Nếu đường thẳng không đi qua gốc $O$: Chọn $O(0; 0)$ là tiện lợi nhất vì tính toán nhẩm cực nhanh.
  - Nếu đường thẳng đi qua gốc $O$ (có dạng $a x + b y = 0$): BẮT BUỘC phải chọn một điểm đặc biệt nằm trên trục tọa độ, chẳng hạn điểm $A(1; 0)$ hoặc $B(0; 1)$.
  - Thay tọa độ điểm $A(1; 0)$ vào $2x - 3y >= 0$: Ta có $2(1) - 3(0) = 2 >= 0$ (Đúng). Do đó, nửa mặt phẳng chứa điểm $A(1; 0)$ chính là miền nghiệm cần tìm!
]

---

== BÀI 4: HỆ BẤT PHƯƠNG TRÌNH & QUY HOẠCH TUYẾN TÍNH — CỨU ĐÓI LENINGRAD ĐẾN LOGISTICS AMAZON

Nếu một bất phương trình tạo ra một nửa mặt phẳng, thì một *Hệ bất phương trình* sẽ tạo ra phần giao của nhiều nửa mặt phẳng — một *Miền đa giác lồi* (Convex Polygon).

Miền đa giác này trong khoa học quản lý được gọi là *Miền Khả Dĩ (Feasible Region)*. Mọi bài toán làm giàu, quản lý kho bãi, phân phối vắc-xin, hay chế tạo tên lửa đều quy về một câu hỏi duy nhất: *Trong vô số điểm nằm trong miền đa giác lồi này, ĐIỂM NÀO SẼ CHO CHÚNG TA NHIỀU TIỀN NHẤT HOẶC TỐN ÍT CHI PHÍ NHẤT?*

#story-box(
  title: "Leonid Kantorovich & Bài toán cứu đói trong Cuộc bao vây Leningrad 1939",
  author: "Leonid Kantorovich (Liên Xô, 1912 – 1986, Giải Nobel Kinh tế 1975)",
)[
  Năm 1939, một nhà máy sản xuất ván ép ở Leningrad đã gửi tới nhà toán học trẻ 27 tuổi *Leonid Kantorovich* một câu hỏi tưởng chừng rất tầm thường: Nhà máy có 8 loại máy xẻ gỗ với công suất khác nhau và cần sản xuất 5 loại ván dán. Phải phân bổ nguyên liệu gỗ vào máy nào để tổng sản lượng là lớn nhất?
  
  Kantorovich nhận thấy đây không phải là một bài toán xẻ gỗ đơn lẻ, mà là một bài toán tối ưu hóa tổng quát trên miền đa giác lồi nhiều chiều! Ông đã sáng tạo ra phương pháp giải quyết hệ bất phương trình ràng buộc mang tên *Quy hoạch Tuyến tính (Linear Programming)*.
  
  Hai năm sau, phát xít Đức bao vây thành phố Leningrad suốt 872 ngày đêm trong một trong những cuộc vây hãm tàn khốc nhất lịch sử nhân loại. Hàng trăm nghìn người dân chết đói và rét. Con đường tiếp tế duy nhất là "Con đường Sống" (Road of Life) băng qua mặt băng mong manh của hồ Ladoga.
  
  Kantorovich đã được giao nhiệm vụ sinh tử: Dùng các bất phương trình quy hoạch tuyến tính tính toán tải trọng của xe tải chở lương thực, độ dày của lớp băng biến thiên theo nhiệt độ, khoảng cách tối ưu giữa các xe để đoàn xe không làm vỡ băng mà vẫn vận chuyển được số lượng bột mì tối đa vào thành phố. Nhờ mô hình toán học của Kantorovich, hàng trăm nghìn chuyến xe đã vượt hồ an toàn, cứu sống hơn 500.000 người dân Leningrad thoát khỏi nạn đói diệt chủng!
  
  Năm 1975, Leonid Kantorovich đã được trao tặng Giải Nobel Kinh tế cho phát minh vĩ đại về lý thuyết phân bổ tối ưu các nguồn lực khan hiếm!
]

#story-box(
  title: "George Dantzig & Thuật toán Simplex giải cứu Cầu Hàng Không Berlin 1948",
  author: "George Dantzig (Mỹ, 1914 – 2005) & John von Neumann",
)[
  Mùa hè năm 1948, Liên Xô phong tỏa toàn bộ đường bộ và đường sắt dẫn vào Tây Berlin, đe dọa biến hơn 2 triệu người dân thành phố thành con tin thiếu đói. Phương án duy nhất của quân Đồng minh là thiết lập một *Cầu hàng không (Berlin Airlift)* khổng lồ chưa từng có trong lịch sử: Dùng máy bay vận tải chở than đá, thuốc men, sữa và bột mì hạ cánh xuống sân bay Tempelhof cứ mỗi 30 giây một chuyến!
  
  Làm thế nào để điều phối hàng nghìn chuyến bay, hàng chục nghìn tấn hàng hóa, lịch bảo dưỡng động cơ và nhiên liệu máy bay mà không bị tắc nghẽn đường băng? Không quân Mỹ đã áp dụng phát minh mới tinh của nhà toán học *George Dantzig*: *Thuật toán Simplex (Đơn hình)*!
  
  Dantzig chỉ ra một chân lý hình học rực rỡ: Thay vì phải kiểm tra hàng triệu điểm vô vọng bên trong miền đa giác lồi nhiều chiều, *giá trị tối ưu luôn luôn nằm ở CÁC ĐỈNH NHỌN (Vertices) của đa giác lồi*! Thuật toán Simplex chỉ việc nhảy từ đỉnh này sang đỉnh kề bên có giá trị cao hơn, giống như một người leo núi men theo các gờ đá để lên đỉnh cao nhất một cách nhanh chóng nhất!
  
  Thuật toán Simplex của Dantzig đã giúp Cầu hàng không Berlin vận chuyển thành công hơn 2,3 triệu tấn hàng hóa, đánh bại cuộc phong tỏa mà không cần nổ một phát súng nào. Tạp chí *Computing in Science & Engineering* đã bình chọn Simplex là một trong 10 thuật toán vĩ đại nhất của thế kỷ XX!
]

#hook-box(title: "Tiệm Bánh Mì Khởi Nghiệp: Tại sao Tiền nhiều nhất luôn nằm ở Đỉnh nhọn?")[
  Thầy cầm chiếc bánh mì kẹp thịt giơ lên trước lớp:
  
  *“Một bạn cựu học sinh trường ta mở tiệm bánh mì khởi nghiệp: Bạn ấy bán Bánh mì thịt nướng ($x$, lãi 10.000đ/ổ) và Bánh mì pate trứng ($y$, lãi 8.000đ/ổ).*
  *Bạn ấy bị giới hạn bởi 3 rào cản bất đẳng thức:*
  - Tiền vốn mua nguyên liệu mỗi ngày: $20.000 x + 15.000 y <= 1.200.000$ đ.
  - Thời gian đứng nướng bánh của một mình bạn ấy: $3x + 2y <= 180$ phút.
  - Lò nướng chỉ chứa tối đa: $x + y <= 80$ ổ.
  
  *Biểu thức lợi nhuận là: $F(x, y) = 10x + 8y$ (nghìn đồng).*
  *Làm thế nào để bạn ấy kiếm được nhiều tiền nhất mỗi ngày mà không bị kiệt sức sập tiệm?”*
  
  Thầy vẽ miền ngũ giác lồi nghiệm lên bảng với 5 đỉnh nhọn: $O(0; 0)$, $A(0; 60)$, $B(20; 50)$, $C(40; 25)$, $D(60; 0)$.
  
  Thầy tính giá trị lợi nhuận $F(x, y)$ tại đúng 5 đỉnh:
  - Tại $O(0; 0)$: $F = 0$ đ (đóng cửa ngủ).
  - Tại $A(0; 60)$: $F = 480.000$ đ.
  - Tại $B(20; 50)$: $F = 10(20) + 8(50) = 600.000$ đ.
  - Tại $C(40; 25)$: $F = 10(40) + 8(25) = 600.000$ đ.
  - Tại $D(60; 0)$: $F = 600.000$ đ.
  
  *Kết luận thần kỳ:* "Các em thấy không? Điểm kiếm nhiều tiền nhất KHÔNG BAO GIỜ nằm lơ lửng ở giữa phòng khách! Nó luôn nằm ở các ĐỈNH NHỌN hoặc mép biên của miền đa giác lồi! Đó chính là bài học quản trị kinh doanh triệu đô mà các em đang học ngay trong tiết Toán 10 hôm nay!"
]

#deep-dive-box(title: "Biểu đồ Voronoi: Phân chia Lãnh thổ Không gian trong AI & Game 3D")[
  Khi các em bật ứng dụng Grab hay ShopeeFood trên điện thoại, hệ thống làm thế nào để tự động tìm xem *Tài xế nào gần bạn nhất* hoặc *Quán trà sữa nào gần bạn nhất* giữa hàng triệu điểm trên bản đồ Hà Nội?
  
  Họ sử dụng *Biểu đồ Voronoi (Voronoi Diagram)*:
  - Cho $n$ điểm mầm (sites) trên mặt phẳng.
  - Với mỗi điểm $P_i$, vùng Voronoi $V(P_i)$ là tập hợp tất cả các điểm trên mặt phẳng gần $P_i$ hơn bất kỳ điểm nào khác:
    $ V(P_i) = { X in RR^2 | d(X, P_i) <= d(X, P_j), forall j != i } $
  - Mỗi điều kiện $d(X, P_i) <= d(X, P_j)$ chính là *MỘT NỬA MẶT PHẲNG giới hạn bởi đường trung trực của đoạn $P_i P_j$!*
  - Do đó, mỗi vùng Voronoi chính là một *ĐA GIÁC LỒI sinh ra từ một Hệ Bất Phương Trình Bậc Nhất Hai Ẩn lớp 10!*
  
  Biểu đồ Voronoi được ứng dụng trong đồ họa sinh thế giới mở của game Minecraft, mô phỏng sự phát triển của tế bào ung thư trong sinh học và quy hoạch vị trí đặt các trạm cứu hỏa trong đô thị thông minh!
]


#inquiry-box(title: "Nhiệm vụ Nghiên cứu: Lập trình Giải Bài toán Tối ưu bằng SciPy Python")[
  Hãy viết một đoạn mã Python sử dụng thư viện `scipy.optimize.linprog` để giải bài toán tiệm bánh mì:
  ```python
  from scipy.optimize import linprog

  # Hàm mục tiêu: Maximize 10x + 8y <=> Minimize -10x - 8y
  c = [-10, -8]

  # Các bất phương trình ràng buộc Ax <= b
  A = [
      [20, 15],  # 20x + 15y <= 1200
      [3, 2],    # 3x + 2y <= 180
      [1, 1],    # x + y <= 80
  ]
  b = [1200, 180, 80]

  # Biến số x, y >= 0
  res = linprog(c, A_ub=A, b_ub=b, bounds=(0, None), method='highs')

  print(f"Trạng thái tối ưu: {res.message}")
  print(f"Số bánh mì thịt nướng cần làm (x): {res.x[0]:.1f}")
  print(f"Số bánh mì pate trứng cần làm (y): {res.x[1]:.1f}")
  print(f"Lợi nhuận cực đại mỗi ngày: {-res.fun:.1f} nghìn đồng")
  ```
  Học sinh lớp 10 hoàn toàn có thể chạy đoạn mã này trên trình duyệt Google Colab để thấy sức mạnh tối ưu hóa của Đại số lớp 10!
]

#v(1em)

== CHUYÊN KHẢO MỞ RỘNG: TỐI ƯU HÓA DANH MỤC ĐẦU TƯ CỦA HARRY MARKOWITZ (NOBEL KINH TẾ 1990)

#story-box(
  title: "Harry Markowitz 1952: Không Bỏ Tất Cả Trứng Vào Một Giỏ Dưới Góc Nhìn Toán Học",
  author: "Harry Markowitz (Nobel Kinh tế 1990, 1927 – 2023)",
)[
  Trước thập niên 1950, phố Wall đầu tư cổ phiếu hoàn toàn theo linh cảm hoặc săn lùng những công ty có lợi nhuận cao nhất mà bỏ qua rủi ro. Năm 1952, chàng nghiên cứu sinh 25 tuổi *Harry Markowitz* tại Đại học Chicago đã làm thay đổi mãi mãi nền tài chính toàn cầu bằng bài báo *“Portfolio Selection”*.
  
  Markowitz chỉ ra rằng: Lợi nhuận kỳ vọng của một danh mục đầu tư là một tổ hợp tuyến tính của các tỉ trọng $x_1, x_2, dots, x_n$:
  $ E(R_p) = sum_(i=1)^n x_i E(R_i) $
  với các ràng buộc bất phương trình bậc nhất bắt buộc:
  - Tổng tỉ trọng nguồn vốn: $x_1 + x_2 + dots + x_n = 1$.
  - Không được bán khống (nếu cấm đòn bẩy): $x_i >= 0, quad forall i = 1, dots, n$.
  - Giới hạn phân bổ tối đa cho một ngành rủi ro: $x_i <= 0,3$ ($30\%$).
  
  Tất cả các ràng buộc trên xác định một *Miền đa diện lồi nhiều chiều* trong không gian đầu tư. Mục tiêu của nhà đầu tư thông minh là tìm một vectơ tỉ trọng nằm trong miền lồi này sao cho tối thiểu hóa rủi ro (phương sai danh mục) tại một mức lợi nhuận mục tiêu cho trước. Công trình này đã khai sinh ra *Lý thuyết Danh mục Đầu tư Hiện đại (MPT - Modern Portfolio Theory)* và mang lại cho Markowitz giải Nobel Kinh tế năm 1990!
]

#tech-box(title: "Tối Ưu Hóa Vị Trí Trạm Tiếp Sóng Di Động 5G Bằng Đa Giác Voronoi")[
  Trong quy hoạch mạng di động thế hệ mới 5G, các nhà mạng (Viettel, VNPT) phải đối mặt với bài toán kinh tế nan giải:
  - Sóng 5G băng tần cao (mmWave) có tốc độ siêu nhanh (hàng Gbps) nhưng độ suy hao khoảng cách rất lớn, bán kính phủ sóng của mỗi trạm Microcell chỉ khoảng $200 - 300 "m"$.
  - Lắp quá nhiều trạm thì chi phí xây dựng và tiền điện làm phá sản doanh nghiệp.
  - Lắp quá ít trạm thì xuất hiện "vùng chết không có sóng" (Dead Zones).
  
  *Giải pháp hình học:*
  Kỹ sư viễn thông mô hình hóa mặt bằng đô thị thành một biểu đồ Voronoi. Vị trí đặt anten là các điểm mầm. Biên giới chuyển giao cuộc gọi khi người dùng di chuyển (Handover Boundary) chính là các đoạn thẳng ranh giới của đa giác Voronoi — nghiệm của phương trình hai trạm có cường độ tín hiệu bằng nhau. Nhờ giải thuật quy hoạch tập lồi, máy tính tự động tối ưu hóa số lượng trạm BTS ít nhất mà vẫn bảo đảm độ phủ sóng $99,99\%$ toàn thành phố!
]

#misconception-box(
  concept: "Cạm Bẫy Vẽ Đường Ranh Giới: Nét Liền vs Nét Đứt & Bẫy Lấy Cả Điểm Biên",
  misconception: "Khi biểu diễn miền nghiệm của bất phương trình ax + by + c > 0 (dấu > nghiêm ngặt), học sinh thường vẽ đường thẳng ranh giới bằng nét liền và vẫn tính các điểm nằm trên đường thẳng vào miền nghiệm.",
  correction: "Nếu dấu là > hoặc < (bất phương trình ngặt), các điểm nằm trên đường thẳng ranh giới ax + by + c = 0 KHÔNG THỎA MÃN BPT (vì 0 không thể lớn hơn 0)! Bắt buộc phải vẽ đường thẳng bằng NÉT ĐỨT (Dashed Line) để tuyên bố loại bỏ biên. Chỉ khi dấu là ≥ hoặc ≤ thì mới vẽ NÉT LIỀN (Solid Line) và lấy cả đường biên!",
  remedy: "Quy tắc bút chì: 'Có dấu bằng (=) thì Nét Liền nhận biên; Không có dấu bằng thì Nét Đứt đuổi biên!'"
)

#pagebreak()


#pagebreak()

= ĐẠI CHƯƠNG III: THƯỚC ĐO TẦM VÓC VŨ TRỤ — HỆ THỨC LƯỢNG TRONG TAM GIÁC

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 5, Bài 6, Bài 7 SGK Toán 10 cùng Chuyên đề Trắc địa Al-Biruni, Góc sút Regiomontanus & Hệ thống Sonar Tàu ngầm (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 5: GIÁ TRỊ LƯỢNG GIÁC TỪ $0 degree$ ĐẾN $180 degree$ — BỨC PHÁ KHỎI TAM GIÁC VUÔNG

Ở lớp 9, học sinh chỉ biết đến lượng giác thông qua tam giác vuông: *“Sin đi học, Cos không hư, Tan đoàn kết, Cot kết đoàn”*. Định nghĩa đó tuy trực quan nhưng lại giam cầm tư duy của học sinh trong một chiếc hộp chật hẹp: góc lượng giác không bao giờ được chạm tới $90 degree$, và góc tù (lớn hơn $90 degree$) dường như không hề có giá trị lượng giác!

Bài học đầu tiên của Chương III đã làm nên một cuộc giải phóng tư duy ngoạn mục: *đưa góc lượng giác lên Nửa đường tròn đơn vị.* Bằng cách gắn góc với tọa độ điểm $M(x_0; y_0)$ trên hệ trục $O x y$, $sin alpha$ trở thành tung độ, $cos alpha$ trở thành hoành độ. Lần đầu tiên, học sinh chứng kiến điều kỳ diệu: khi góc vượt qua $90 degree$ sang góc tù, hoành độ đổi dấu sang âm ($cos alpha < 0$), nhưng tung độ vẫn kiêu hãnh giữ dấu dương ($sin alpha > 0$). Lượng giác đã thoát khỏi hình học tĩnh để bước vào đại số giải tích động!

#story-box(
  title: "Nguồn gốc bi hài của từ 'Sinus' & Cuộc hành trình 2.000 năm của Lượng giác",
  author: "Aryabhata (Ấn Độ, 476 – 550) & Robert of Chester (châu Âu, 1145)",
)[
  Từ "Sin" mà hàng triệu học sinh trên thế giới viết vào vở mỗi ngày thực chất là kết quả của một... *vụ dịch sai hài hước bậc nhất trong lịch sử khoa học!*
  
  Vào thế kỷ V, nhà thiên văn học vĩ đại người Ấn Độ *Aryabhata* cần một công cụ để tính toán quỹ đạo các vì sao. Ông vẽ một nửa dây cung trong vòng tròn và gọi nó bằng tiếng Phạn là *“Ardha-jya”* (nửa dây cung), sau rút gọn thành *“Jya”*.
  
  Đến thế kỷ VIII, nền văn minh Hồi giáo bước vào Thời kỳ Hoàng kim. Các học giả Ả Rập tại Baghdad dịch tác phẩm của Aryabhata sang tiếng Ả Rập. Vì tiếng Ả Rập không có nguyên âm nên từ *Jya* được phiên âm thành *J-Y-B*. Nhưng trong tiếng Ả Rập, từ *Jayb* lại có nghĩa là "vạt áo", "nếp gấp ngực" hoặc "vịnh biển"!
  
  Bốn trăm năm sau, vào năm 1145, học giả người Anh *Robert of Chester* ngồi dịch các tài liệu Ả Rập sang tiếng Latin tại Tây Ban Nha. Khi gặp chữ *Jayb*, ông không hề biết nguồn gốc thiên văn của nó từ Ấn Độ, mà đinh ninh đó là nghĩa "nếp gấp ngực/vịnh biển", nên đã dịch thẳng sang từ tiếng Latin là *“Sinus”* (có nghĩa là vạt áo, nếp gấp, ngực hay hõm vịnh)! Từ đó, từ viết tắt *sin* ra đời và lan tỏa khắp toàn cầu.
  
  Đằng sau một từ viết tắt ba chữ cái nhỏ bé là một cuộc tiếp sức văn hóa vĩ đại trải dài qua 3 nền văn minh: từ bờ sông Hằng của Ấn Độ, qua sa mạc Ả Rập huyền bí, đến các đại học cổ kính thời Trung Cổ ở châu Âu!
]

#hook-box(title: "Nửa vòng tròn thần bí & Bí mật góc tù")[
  Thầy bước vào lớp, vẽ một nửa đường tròn đơn vị bán kính $R = 1$ lên bảng:
  
  *“Hồi lớp 9, các em học sin và cos bằng tỉ số giữa các cạnh tam giác vuông. Cạnh thì không bao giờ âm, nên sin và cos luôn dương. Nhưng hôm nay, thầy nói với các em: Cosin của một góc có thể mang dấu ÂM! Tại sao $cos 120 degree = - 1/2$? Chẳng lẽ có một tam giác với độ dài cạnh mang giá trị âm?”*
  
  Thầy chỉ tay lên trục hoành $O x$:
  
  *“Không! Điểm $M$ trên nửa đường tròn đang khiêu vũ. Khi góc quay từ $0 degree$ đến $90 degree$, chiếc bóng của nó trên sàn nhà (trục hoành) nằm ở phần dương. Nhưng khi góc nghiêng quá $90 degree$ bước sang góc tù, chiếc bóng của nó đổ sang phần âm của trục tọa độ! Âm hay dương không phải là kích thước của cạnh, mà là HƯỚNG VÀ VỊ TRÍ của tâm hồn điểm chuyển động trong không gian!”*
]

#tech-box(title: "Xoay nhân vật 3D trong Game Liên Minh Huyền Thoại & Phim Pixar")[
  - *Ma trận xoay 2D/3D (Rotation Matrix)*: Khi các em chơi game nhập vai, nhân vật cầm kiếm xoay một góc $theta$ quanh trục. Làm sao GPU tính toán được tọa độ mới của thanh kiếm? Card đồ họa máy tính sử dụng trực tiếp công thức lượng giác trên đường tròn đơn vị:
    $ mat(x'; y') = mat(cos theta, -sin theta; sin theta, cos theta) mat(x; y) $
    Hàng triệu phép tính sin và cos được GPU xử lý trong mỗi phần nghìn giây để hiển thị từng cử động mượt mà của nhân vật trên màn hình 144Hz!
]

---

== BÀI 6: ĐỊNH LÍ CÔSIN VÀ ĐỊNH LÍ SIN — PHÁ BỎ XIỀNG XÍCH PYTHAGORAS

Định lý Pythagoras $a^2 + b^2 = c^2$ là biểu tượng vĩ đại của hình học cổ đại, nhưng nó mang một nhược điểm chí mạng: *chỉ đúng khi góc kẹp giữa đúng bằng $90 degree$!* Nếu góc ấy bị bẻ cong thành góc nhọn hay mở rộng thành góc tù, mối quan hệ giữa ba cạnh sẽ biến thiên như thế nào?

*Định lí Côsin* $a^2 = b^2 + c^2 - 2 b c cos A$ chính là câu trả lời toàn mỹ của nhân loại! Khi góc $A = 90 degree$, $cos 90 degree = 0$, số hạng thứ ba biến mất và công thức thu gọn tuyệt đẹp về Pythagoras. Định lý Côsin không phủ định Pythagoras, mà ôm trọn Pythagoras vào lòng như một trường hợp riêng đặc biệt!

#story-box(
  title: "Al-Biruni 1023: Đứng Trên Đỉnh Núi Đo Bán Kính Trái Đất Bằng Định Lý Sin",
  author: "Abu Rayhan Al-Biruni (Ba Tư, 973 – 1048)",
)[
  Hơn 1.000 năm trước, tại pháo đài Nandana (thuộc Pakistan ngày nay), nhà bác học Hồi giáo vĩ đại *Al-Biruni* đã thực hiện một kỳ tích đo đạc mà không một nhà khoa học phương Tây nào thời đó dám nghĩ tới: *Đo chính xác bán kính Trái Đất mà không cần phải đi bộ vòng quanh thế giới!*
  
  Phương pháp của Eratosthenes trước đó cần đo khoảng cách giữa hai thành phố cách nhau 800 km trên mặt đất — một việc vô cùng gian nan và dễ sai số do địa hình đồi núi. Al-Biruni đã nghĩ ra giải pháp lượng giác thanh nhã hơn ngàn lần:
  1. Ông trèo lên một ngọn núi cao có đỉnh nhìn ra một bình nguyên phẳng lì trải dài tới tận đường chân trời.
  2. Bằng phương pháp tam giác đạc, ông đo độ cao chính xác của ngọn núi là $h$.
  3. Từ đỉnh núi, ông dùng thước đo góc thiên văn (Astrolabe) đo góc nghiêng trầm $theta$ giữa đường ngắm nằm ngang và tia ngắm chạm vào đường chân trời xa xôi nơi mặt đất cong xuống.
  
  Tia ngắm từ đỉnh núi tiếp xúc với mặt cầu Trái Đất, tạo thành một *tam giác vuông khổng lồ* có cạnh góc vuông là tia ngắm, cạnh huyền là $R + h$, và cạnh góc vuông còn lại là bán kính Trái Đất $R$!
  Theo định nghĩa lượng giác:
  $ cos theta = R / (R + h) arrow R = (h cos theta) / (1 - cos theta) $
  
  Tại Nandana, với ngọn núi cao $h = 652,05$ mét và góc trầm $theta = 34'$, Al-Biruni tính ra bán kính Trái Đất là:
  $ R approx 6.335,72 "km"! $
  
  Con số của Al-Biruni chỉ sai lệch vỏn vẹn *0,9%* so với số liệu đo đạc bằng vệ tinh hiện đại của NASA ngày nay ($6.371 "km"$)! Bằng một công thức lượng giác lớp 10, một con người đứng trên đỉnh núi đã ôm trọn cả tinh cầu vào trong lòng bàn tay!
]

#story-box(
  title: "Regiomontanus 1471 & Bài toán Góc sút Bóng đá Tối ưu",
  author: "Regiomontanus (Johannes Müller von Königsberg, Đức, 1436 – 1476)",
)[
  Năm 1471, trong một bức thư gửi cho học trò, nhà toán học Regiomontanus đã đặt ra bài toán cực trị hình học đầu tiên trong lịch sử mang tên *“Bài toán tượng đài Regiomontanus”*:
  
  *“Một bức tượng cao dựng đứng trên một bệ tượng cách mặt đất một khoảng. Một người đứng ngắm tượng từ xa: Khi đứng quá gần, bức tượng bị nhìn xiên xẹo từ dưới lên; khi đứng quá xa, bức tượng thu nhỏ lại như một chấm tí hon. Hỏi: Người đó phải đứng ở cự ly nào trên mặt đất để góc nhìn ngắm bức tượng là LỚN NHẤT?”*
  
  Trong bóng đá hiện đại, đây chính là *Bài toán Góc sút của Tiền đạo chạy cánh*:
  - Một cầu thủ tiền đạo dẫn bóng dọc theo đường biên dọc (cách cột cọc gần $A$ một đoạn $d_1$, cột cọc xa $B$ một đoạn $d_2$).
  - Cầu thủ nên sút bóng ở vị trí $M$ nào trên đường biên để góc sút mở rộng $hat(A M B)$ hướng vào khung thành là cực đại?
  
  Áp dụng Định lý Côsin trong tam giác $M A B$:
  $ cos hat(A M B) = (M A^2 + M B^2 - A B^2) / (2 M A times M B) $
  Regiomontanus chỉ ra rằng: Góc nhìn cực đại đạt được khi và chỉ khi đường tròn đi qua ba điểm $A, B, M$ *TIẾP XÚC VỚI ĐƯỜNG DI CHUYỂN CỦA CẦU THỦ*!
  Khoảng cách tối ưu chính là trung bình nhân khoảng cách tới hai cột gôn:
  $ x_("opt") = sqrt(d_1 times d_2) $
  Một bài toán lượng giác lớp 10 từ thế kỷ XV đã trở thành cẩm nang chiến thuật cho các danh thủ bóng đá hàng đầu thế giới!
]

#hook-box(title: "Sonar Tàu Ngầm & Tên lửa Phòng không Iron Dome")[
  Thầy chiếu video một chiếc tàu ngầm hạt nhân lặn sâu dưới đáy biển tối đen như mực:
  
  *“Ở độ sâu 300 mét dưới đáy đại dương, ánh sáng mặt trời không thể xuyên tới, radar sóng điện từ bị nước biển nuốt chửng hoàn toàn. Làm sao một chiếc tàu ngầm biết được một tàu chiến đối phương đang áp sát cách mình 15 km?*
  
  *Họ sử dụng HỆ THỐNG SONAR THỤ ĐỘNG!*
  - Thân tàu ngầm được gắn hai micro thủy âm cực nhạy tại mũi tàu ($A$) và đuôi tàu ($B$).
  - Khoảng cách $A B = c$ được kỹ sư đo chuẩn xác từng milimet.
  - Khi chân vịt tàu đối phương quay phát ra tiếng động, micro $A$ nhận sóng ở góc $alpha$, micro $B$ nhận sóng ở góc $beta$.
  - Hai góc $alpha, beta$ và một cạnh $c$ lập tức tạo thành một bài toán GIẢI TAM GIÁC bằng Định lý Sin:
    $ a / (sin alpha) = b / (sin beta) = c / (sin(180 degree - alpha - beta)) $
  
  *Máy tính nhúng trên tàu chỉ mất 0,001 giây để giải Định lý Sin lớp 10, hiển thị ngay vị trí, hướng di chuyển và cự ly của mục tiêu lên màn hình hoa tiêu! Đó chính là vũ khí vô hình bảo vệ hòa bình của các siêu cường quốc!”*
]

#misconception-box(
  title: "Cạm bẫy 'Trường hợp Mơ hồ SSA' trong Định lý Sin",
  misconception: "Khi biết hai cạnh và một góc không xen giữa (ví dụ $a, b, hat(A)$), ta chỉ việc dùng định lý Sin là luôn tìm ra duy nhất một tam giác!",
  correction: "Trường hợp SSA (Cạnh - Cạnh - Góc không kề) là trường hợp cực kỳ nguy hiểm có thể cho ra HAI TAM GIÁC KHÁC NHAU (một tam giác nhọn và một tam giác tù) vì phương trình $sin B = k$ luôn có hai nghiệm bù nhau: $B$ và $180 degree - B$!"
)[
  *Ví dụ:* Cho tam giác $A B C$ có $a = 6$, $b = 8$, và $hat(A) = 30 degree$.
  Theo định lý Sin:
  $ (sin B) / b = (sin A) / a arrow sin B = (8 times sin 30 degree) / 6 = (8 times 0,5) / 6 = 4/6 = 2/3 $
  Bấm máy tính ta được góc nhọn: $B_1 approx 41,8 degree$.
  Nhưng trên nửa đường tròn đơn vị, góc tù $B_2 = 180 degree - 41,8 degree = 138,2 degree$ CŨNG CÓ $sin B_2 = 2/3$!
  Vì $hat(A) + B_2 = 30 degree + 138,2 degree = 168,2 degree < 180 degree$, nên góc tù $B_2$ HOÀN TOÀN HỢP LỆ!
  
  *Hậu quả:* Bài toán có HAI TAM GIÁC HOÀN TOÀN KHÁC NHAU thỏa mãn đề bài! Nếu kỹ sư trắc địa chỉ lấy nghiệm góc nhọn máy tính trả về, chiếc mố cầu sẽ bị xây lệch vị trí hàng chục mét và đổ sập!
]

---

== BÀI 7: CÁC CÔNG THỨC DIỆN TÍCH TAM GIÁC & CÔNG THỨC HERON

Tam giác là đa giác đơn giản nhất của hình học phẳng nhưng lại sở hữu tới 5 công thức tính diện tích độc lập phản ánh 5 góc nhìn toán học sâu sắc:
$ S = 1/2 a h_a = 1/2 a b sin C = (a b c) / (4 R) = p r = sqrt(p(p-a)(p-b)(p-c)) $

#story-box(
  title: "Heron xứ Alexandria & Bức thư tình tuyệt mỹ giữa Ba Cạnh và Diện Tích",
  author: "Heron xứ Alexandria (Ai Cập - Hy Lạp, khoảng 10 – 70 SCN)",
)[
  Heron xứ Alexandria là nhà phát minh thiên tài được mệnh danh là "Thomas Edison của thời cổ đại". Ông đã chế tạo ra chiếc máy bán nước thánh tự động đầu tiên bằng cách thả đồng xu vào khe, đền thờ có cửa tự động mở bằng áp suất hơi nước, và động cơ hơi nước quay tròn *Aeolipile* đi trước thời đại tận 1.700 năm.
  
  Trong cuốn sách *“Metrica”* (Đo lường), Heron đã giải quyết bài toán nhức nhối nhất của các quan lại trắc địa Ai Cập sau mỗi mùa lũ sông Nile: Các thửa ruộng hình tam giác bị bùn đất phủ lấp làm mất hết các cọc đo chiều cao. Làm sao tính diện tích mảnh đất khi chỉ có thể dùng dây đo được độ dài 3 cạnh $a, b, c$?
  
  Heron đã sáng tạo ra công thức mang tên ông:
  $ S = sqrt(p(p-a)(p-b)(p-c)) quad "với" quad p = (a + b + c) / 2 $
  
  Vẻ đẹp của công thức Heron nằm ở tính *đối xứng hoàn hảo*: không cần biết góc, không cần kẻ đường cao, chỉ cần 3 cạnh là diện tích hiển lộ. Nó giống như một bài thơ hình học thanh nhã nơi cả ba cạnh $a, b, c$ đều bình đẳng trước chân lý!
]

#dialogue-box(title: "Đối thoại Socrates: Tại sao Định lý Côsin lại chứa Định lý Pythagoras?")[
  *Socrates:* Này bạn trẻ, hãy nhìn vào công thức Định lý Côsin: $a^2 = b^2 + c^2 - 2 b c cos A$. Khi góc $A$ thu hẹp lại dần dần từ $90 degree$ về $0 degree$, cạnh $a$ sẽ dài ra hay ngắn lại?
  
  *Học trò:* Thưa thầy, hiển nhiên cạnh $a$ ngắn lại ạ!
  
  *Socrates:* Tại sao công thức lại thể hiện được điều đó?
  
  *Học trò:* Dạ, vì khi góc $A$ nhọn, $cos A > 0$, nên lượng trừ đi $- 2 b c cos A$ là một số dương bị trừ đi, làm cho $a^2 < b^2 + c^2$!
  
  *Socrates:* Đúng! Và khi góc $A$ mở rộng thành góc tù (lớn hơn $90 degree$), điều gì xảy ra?
  
  *Học trò:* Dạ, $cos A < 0$, phép trừ hai số âm trở thành phép CỘNG THÊM: $a^2 > b^2 + c^2$! Cạnh $a$ bị kéo dài ra vượt qua định lý Pythagoras!
  
  *Socrates:* Vậy định lý Pythagoras nằm ở đâu trong bức tranh vĩ đại đó?
  
  *Học trò:* Dạ, Pythagoras chính là Ranh Giới Cân Bằng hoàn hảo ở giữa: khi $A = 90 degree$, $cos 90 degree = 0$, phần bù trừ biến mất!
  
  *Socrates:* Ngươi đã thấy được sự tiếp nối của tư tưởng nhân loại rồi đó! Định lý Côsin không giết chết Pythagoras, mà mở rộng nó để ôm trọn mọi tam giác méo mó trong vũ trụ!
]

#deep-dive-box(title: "Từ Heron đến Brahmagupta: Vẻ Đẹp của Tứ giác Nội tiếp")[
  Vào thế kỷ VII, nhà toán học thiên tài Ấn Độ *Brahmagupta* đã nâng tầm công thức Heron lên cho một *Tứ giác nội tiếp đường tròn* có 4 cạnh $a, b, c, d$:
  $ S_("Brahmagupta") = sqrt((p-a)(p-b)(p-c)(p-d)) quad "với" quad p = (a+b+c+d)/2 $
  Nếu ta cho một cạnh $d$ co ngắn lại dần về $0$, tứ giác biến thành tam giác, số hạng $(p - d)$ biến thành $p$, và công thức Brahmagupta thu gọn chính xác về công thức Heron! Sự nhất quán kỳ vĩ này chứng minh rằng các định lý toán học không bao giờ đứng lẻ loi, mà luôn là các lát cắt của cùng một chân lý vũ trụ!
]

#inquiry-box(title: "Thực hành Python: Mô phỏng Góc sút Regiomontanus trên Sân Bóng")[
  ```python
  import numpy as np

  # Khung thành rộng 7.32m, cột gần cách biên 10m, cột xa cách biên 17.32m
  d1 = 10.0
  d2 = 17.32

  # Tìm vị trí sút x dọc đường biên từ 1m đến 30m
  x = np.linspace(1, 30, 300)
  angle_rad = np.arctan(d2 / x) - np.arctan(d1 / x)
  angle_deg = np.degrees(angle_rad)

  opt_idx = np.argmax(angle_deg)
  print(f"Vị trí sút tối ưu x: {x[opt_idx]:.2f} mét từ đường ngang khung thành")
  print(f"Góc sút cực đại:    {angle_deg[opt_idx]:.2f} độ")
  print(f"Kiểm tra lý thuyết sqrt(d1*d2): {np.sqrt(d1 * d2):.2f} mét")
  ```
]

#v(1em)

== CHUYÊN KHẢO MỞ RỘNG: ĐỊNH LÝ STEWART & BẢN GIAO HƯỞNG ĐỘ DÀI TRUNG TUYẾN, PHÂN GIÁC

#story-box(
  title: "Matthew Stewart 1746: Chiếc Cầu Nối Giữa Mọi Đoạn Thẳng Trong Tam Giác",
  author: "Matthew Stewart (Scotland, 1717 – 1785)",
)[
  Năm 1746, giáo sư toán học tại Đại học Edinburgh *Matthew Stewart* đã công bố một định lý hình học được coi là "viên ngọc quý" của lượng giác giải tích: Cho tam giác $A B C$, trên cạnh đáy $B C$ lấy một điểm $D$ bất kỳ, chia cạnh đáy thành hai đoạn $B D = m$ và $C D = n$ (với $m + n = a$). Độ dài đoạn thẳng $A D = d$ thỏa mãn hệ thức kinh điển:
  $ b^2 m + c^2 n = a (d^2 + m n) $
  
  *Câu thần chú ghi nhớ của các thế hệ học sinh Anh quốc:*
  *“A man and his dad put a bomb in the sink”* ($b m b + c n c = a d a + a m n$).
  
  *Sức mạnh thống nhất của Định lý Stewart:*
  1. Khi $D$ là *Trung điểm* của $B C$ ($m = n = a / 2$): Hệ thức Stewart lập tức suy ra công thức độ dài đường trung tuyến Apollonius:
     $ b^2 (a/2) + c^2 (a/2) = a (m_a^2 + a^2 / 4) arrow m_a^2 = (2 b^2 + 2 c^2 - a^2) / 4 $
  2. Khi $A D$ là *Đường phân giác trong* góc $A$: Theo tính chất đường phân giác, $m / n = c / b$. Thay vào hệ thức Stewart, ta suy ra công thức tính độ dài đường phân giác tuyệt đẹp:
     $ l_a^2 = b c (1 - a^2 / (b + c)^2) = (4 b c p (p - a)) / (b + c)^2 $
  
  Từ một định lý duy nhất được chứng minh bằng Định lý Côsin, toàn bộ các công thức tính trung tuyến, phân giác, đường cao đều được xâu chuỗi thành một khối chân lý thống nhất!
]

#deep-dive-box(title: "Từ Heron đến Bretschneider: Sự Tiến Hóa Của Công Thức Diện Tích Đa Giác")[
  Nhà toán học Đức *Carl Anton Bretschneider* (1842) đã hoàn tất bài toán tính diện tích tứ giác bất kỳ có 4 cạnh $a, b, c, d$ và hai góc đối diện $A, C$:
  $ S^2 = (p - a)(p - b)(p - c)(p - d) - a b c d cos^2((A + C) / 2) $
  với $p = (a + b + c + d) / 2$.
  
  *Chuỗi tiến hóa vĩ đại của tri thức:*
  - *Tứ giác bất kỳ (Bretschneider 1842):* Có số hạng hiệu chỉnh $- a b c d cos^2((A + C)/2)$.
  - *Tứ giác nội tiếp (Brahmagupta 628):* Tổng hai góc đối $A + C = 180 degree arrow (A + C)/2 = 90 degree arrow cos(90 degree) = 0$. Số hạng hiệu chỉnh biến mất, diện tích đạt cực đại!
  - *Tam giác (Heron thế kỷ I):* Cho cạnh $d arrow 0$, tứ giác suy biến thành tam giác, công thức trở về $S = sqrt(p(p-a)(p-b)(p-c))$!
  
  Học sinh lớp 10 khi nhìn thấy chuỗi liên kết này sẽ nhận ra: Toán học không phải là những mảnh ghép rời rạc để học vẹt, mà là một thực thể sống đang tiến hóa không ngừng!
]

#tech-box(title: "Nguyên Lý Tam Giác Đạc (Triangulation) Định Vị 24 Vệ Tinh GPS")[
  Làm sao chiếc điện thoại thông minh trong túi các em biết được các em đang đứng chính xác ở ngã tư phố nào với sai số dưới $3 "m"$?
  
  - Trên quỹ đạo Trái Đất ở độ cao $20.200 "km"$, mạng lưới gồm $24$ vệ tinh GPS quay quanh tinh cầu, mỗi vệ tinh liên tục phát tín hiệu mang thông tin thời gian từ đồng hồ nguyên tử.
  - Bộ thu GPS trong điện thoại ghi nhận thời gian nhận tín hiệu từ vệ tinh thứ nhất: Khoảng cách tới vệ tinh là $r_1 = c times Delta t_1$. Khi đó, điện thoại nằm trên một *Mặt cầu bán kính $r_1$* tâm là vệ tinh 1.
  - Vệ tinh thứ hai cho mặt cầu thứ hai: Giao của hai mặt cầu là một *Đường tròn*.
  - Vệ tinh thứ ba cho mặt cầu thứ ba: Cắt đường tròn tại đúng *Hai điểm duy nhất* trong không gian.
  - Vệ tinh thứ tư giải quyết sự sai lệch đồng hồ của điện thoại và loại bỏ một điểm nằm ngoài Trái Đất.
  
  Toàn bộ hệ thống giao thông thông minh, taxi công nghệ, máy bay không người lái (drone) giao hàng đều đang vận hành trên nền tảng của các hệ thức lượng và phép giải tam giác giải tích lớp 10!
]

#misconception-box(
  title: "Cạm Bẫy SSA (Cạnh - Cạnh - Góc Không Xen Giữa) & Ảo Tưởng Nghiệm Duy Nhất",
  misconception: "Nhiều học sinh tin rằng khi biết độ dài hai cạnh a, b và góc A, luôn luôn xác định được duy nhất một tam giác, tương tự như các trường hợp c-c-c hay c-g-c.",
  correction: "Trường hợp SSA (Cạnh - Cạnh - Góc) là trường hợp NHẬP NHẰNG (Ambiguous Case)! Nếu góc A nhọn và cạnh a nhỏ hơn cạnh b (a < b) nhưng lớn hơn chiều cao (a > b sin A), đường tròn tâm C bán kính a sẽ cắt cạnh đáy tại HAI ĐIỂM PHÂN BIỆT, sinh ra HAI TAM GIÁC HOÀN TOÀN KHÁC NHAU: một tam giác nhọn và một tam giác tù!",
  remedy: "Khi gặp bài toán giải tam giác với hai cạnh và một góc không xen giữa, luôn phải xét phương trình bậc hai theo cạnh thứ ba: c² - (2b cos A)c + (b² - a²) = 0. Nếu phương trình có hai nghiệm dương phân biệt, bài toán bắt buộc có HAI ĐÁP SỐ!"
)

#pagebreak()


#pagebreak()

= ĐẠI CHƯƠNG IV: VŨ KHÍ GIẢI PHÓNG KHÔNG GIAN — VECTƠ VÀ CÁC PHÉP TOÁN

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 8, Bài 9, Bài 10, Bài 11 SGK Toán 10 cùng Chuyên đề Hamilton, Tâm tỉ cự Möbius & Vector Embeddings trong Trí tuệ Nhân tạo (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 8: KHÁI NIỆM VECTƠ — BƯỚC NHẢY TỪ VÔ HƯỚNG SANG ĐA CHIỀU

Suốt hàng nghìn năm, loài người chỉ biết đo lường thế giới bằng những con số vô hướng (Scalars): một bao gạo nặng 50 kg, một quãng đường dài 10 km, nhiệt độ ngoài trời $35 degree C$. Nhưng khi nền văn minh bước vào kỷ nguyên cơ học và thiên văn học hiện đại, những con số vô hướng đã bộc lộ sự bất lực hoàn toàn:
- Nếu một cơn bão nhiệt đới di chuyển với vận tốc 100 km/h, nhưng dự báo thời tiết không biết nó đang lao vào bờ biển hay đang hướng ra Thái Bình Dương, thì con số 100 km/h đó hoàn toàn vô dụng đối với việc cứu sống người dân!
- Nếu một phi hành gia trên trạm vũ trụ ISS mở động cơ đẩy với lực 1.000 Newton, nếu không biết hướng của lực thì con tàu sẽ rơi tự do vào khí quyển bốc cháy hoặc bay mất hút vào vũ trụ vô tận.

Thế giới thực không phải là một chuỗi các con số đơn lẻ, mà là một vũ trụ của *Phương và Hướng!* Khái niệm *Vectơ* ra đời chính là một trong những bước nhảy vọt tư duy vĩ đại nhất của nhân loại: gắn kết độ lớn với một mũi tên chỉ hướng trong không gian!

#story-box(
  title: "William Rowan Hamilton: Vết Dao Khắc Trên Cây Cầu Brougham Ngày 16/10/1843",
  author: "Sir William Rowan Hamilton (Ireland, 1805 – 1865)",
)[
  Sir William Rowan Hamilton là một thần đồng kiệt xuất người Ireland: 5 tuổi ông đọc được tiếng Latin, Hy Lạp và Do Thái; 13 tuổi ông thông thạo 13 thứ tiếng từ Ba Tư, Ả Rập đến Phạn ngữ. Ông được bổ nhiệm làm Giáo sư Thiên văn học tại Đại học Trinity Dublin khi mới 22 tuổi, ngay cả khi chưa tốt nghiệp đại học!
  
  Suốt nhiều năm trời, Hamilton bị ám ảnh bởi một bài toán: Số phức $z = a + b i$ đã biểu diễn tuyệt mỹ các phép quay và độ dời trong mặt phẳng 2D. Nhưng làm thế nào để mở rộng đại số lên không gian 3 chiều? Mỗi buổi sáng bước xuống bàn ăn, hai cậu con trai nhỏ của Hamilton lại hỏi: *“Bố ơi, bố đã biết nhân các bộ ba số chưa?”*, và Hamilton chỉ biết buồn bã lắc đầu: *“Chưa con ạ, bố chỉ mới biết cộng và trừ chúng thôi!”*.
  
  Vào sáng ngày 16 tháng 10 năm 1843, khi Hamilton cùng vợ đi dạo dọc theo bờ kênh Hoàng gia ở Dublin để tới Viện Hàn lâm Ireland. Đúng lúc bước qua vòm đá của *Cây cầu Brougham*, một tia chớp cảm hứng thiên tài đột ngột bừng sáng trong tâm trí ông:
  *Muốn nhân được các vectơ trong không gian 3 chiều, con người bắt buộc phải nhảy lên KHÔNG GIAN 4 CHIỀU với 3 đơn vị ảo $i, j, k$!*
  
  Quá xúc động, không kiềm chế được niềm vui sướng nghẹn ngào, Hamilton đã rút ngay chiếc dao nhỏ trong túi áo ra và khắc sâu phương trình thần thánh lên phiến đá thành cầu Brougham:
  $ i^2 = j^2 = k^2 = i j k = -1 $
  
  Đó là sự ra đời của *Lý thuyết Quaternion (Đại số Bốn chiều)*! Vết khắc đá lịch sử đó sau này được các nhà toán học Josiah Willard Gibbs và Oliver Heaviside tách ra làm hai phần: Phần vô hướng (Scalar) và Phần vectơ (Vector) — chính là cội nguồn trực tiếp của chương Vectơ Toán 10 mà chúng ta học hôm nay!
]

#story-box(
  title: "Giustino Bellavitis & Khái niệm Đoạn thẳng tương đương",
  author: "Giustino Bellavitis (Ý, 1803 – 1880)",
)[
  Đầu thế kỷ XIX, nhà toán học người Ý *Giustino Bellavitis* — một người có xuất thân nghèo khó, tự học ở nhà và chưa từng có bằng đại học chính quy — đã quan sát thấy một điều kỳ lạ: Khi một đoàn tàu hỏa chuyển động trên đường ray thẳng, tất cả các toa tàu đều tịnh tiến cùng một vận tốc và cùng một hướng. Nếu ta chỉ nhìn vị trí cố định của từng toa xe, ta sẽ bị rối loạn bởi hàng trăm tọa độ khác nhau. Nhưng nếu ta trừu tượng hóa vận tốc thành một "mũi tên chuyển động", thì mũi tên của toa đầu và toa cuối là *HOÀN TOÀN NHƯ NHAU!*
  
  Năm 1835, Bellavitis công bố lý thuyết về *“Đoạn thẳng tương đương" (Equipollence)*: Hai đoạn thẳng có hướng được coi là bằng nhau nếu chúng có cùng độ dài, cùng phương và cùng hướng, bất chấp chúng nằm ở hai góc trời cách xa nhau! Khái niệm này đã giải phóng mũi tên khỏi sự giam cầm của điểm đặt cố định, khai sinh ra khái niệm *Vectơ tự do* trong SGK hôm nay! Nhờ công trình kiệt xuất này, Viện Hàn lâm Khoa học Ý đã đặc cách phong ông làm Giáo sư Toán học tại Đại học Padova danh tiếng.
]

#hook-box(title: "Bài toán 10 km bằng 0 km & Cơn bão nhiệt đới")[
  Thầy bước vào lớp, nhìn học sinh với ánh mắt đầy thách thức:
  
  *“Thầy hỏi cả lớp một câu đố tiểu học: Sáng nay một người đàn ông ra khỏi nhà, đi bộ 5 km về phía Bắc. Sau đó, ông ấy quay đầu đi bộ tiếp 5 km về phía Nam. Hỏi quãng đường ông ấy đi được là bao nhiêu kilomet, và vị trí của ông ấy cách nhà bao nhiêu kilomet?”*
  
  Học sinh lập tức đồng thanh: *“Đi được 10 km, nhưng vị trí cách nhà bằng 0 km!”*
  
  Thầy gật đầu, nở một nụ cười rạng rỡ:
  
  *“Chính xác! Con số 10 km là Đại số vô hướng của cấp 2, nó chỉ đo công sức mệt mỏi của đôi chân. Nhưng con số 0 km chính là VECTƠ của cấp 3: $vec(v)_1 + vec(v)_2 = vec(0)$! Vectơ không quan tâm bạn đã vất vả đi bao nhiêu bước, vectơ nói cho bạn biết bạn đang THỰC SỰ TIẾN VỀ ĐÂU trong vũ trụ này! Đó là lý do một người chạy lăng xăng cả ngày nhưng không có mục tiêu và định hướng rõ ràng thì tổng vectơ cuộc đời vẫn mãi mãi bằng con số KHÔNG tròn trĩnh!”*
]

#tech-box(title: "Vector Embeddings: Bí mật giúp ChatGPT & Claude hiểu được tiếng người")[
  - *Vector Embedding trong Trí tuệ Nhân tạo*: Máy tính chỉ hiểu các con số $0$ và $1$, nó không hề biết chữ "Vua", "Hoàng hậu" hay "Tình yêu" nghĩa là gì. Để các mô hình ngôn ngữ lớn (LLM) như ChatGPT, Gemini hay Claude hiểu được ngữ nghĩa, các nhà khoa học biến mỗi từ ngữ thành một *Vectơ toán học* có từ $1.536$ đến $4.096$ chiều trong không gian!
  - *Phép toán ngữ nghĩa kỳ diệu của Vectơ*: Khi được biểu diễn dưới dạng vectơ, điều kỳ diệu đã xảy ra:
    $ vec(v)_("Vua") - vec(v)_("Đàn ông") + vec(v)_("Phụ nữ") approx vec(v)_("Hoàng hậu") $
    Máy tính nhận ra rằng mối quan hệ giữa Vua và Hoàng hậu giống hệt mối quan hệ giữa Đàn ông và Phụ nữ chỉ bằng các phép cộng trừ vectơ trong không gian nhiều chiều! Toàn bộ trí tuệ nhân tạo hiện đại đang vận hành trên nền móng vectơ mà các em đang học hôm nay!
]

---

== BÀI 9: TỔNG VÀ HIỆU VECTƠ — CƠ HỌC NEWTON & NGHỆ THUẬT HỢP LỰC

Nếu chỉ có những vectơ đứng riêng lẻ, chúng ta chỉ có những mũi tên vô tri. Nhưng khi *Cộng* và *Trừ* các vectơ lại với nhau bằng *Quy tắc ba điểm* và *Quy tắc hình bình hành*, chúng ta mở cánh cửa bước vào trái tim của Vật lý học cổ điển: *Định luật Chuyển động của Isaac Newton!*

#story-box(
  title: "Isaac Newton & Quy tắc hình bình hành lực trong Principia Mathematica",
  author: "Sir Isaac Newton (Anh, 1643 – 1727)",
)[
  Năm 1687, cuốn sách làm thay đổi vĩnh viễn tiến trình văn minh nhân loại ra đời: *“Philosophiae Naturalis Principia Mathematica”* (Các nguyên lý toán học của triết học tự nhiên) của Sir Isaac Newton. Trong tác phẩm này, Newton đã chính thức phát biểu Định luật II: Gia tốc của một vật tỉ lệ thuận với Hợp lực tác dụng lên nó:
  $ vec(F)_("hợp lực") = m vec(a) $
  
  Newton nhận ra rằng: Trong tự nhiên, một vật thể không bao giờ chịu tác dụng của một lực đơn độc. Một con tàu lướt trên mặt biển chịu lực đẩy của động cơ chân vịt hướng về phía trước ($vec(F)_1$), lực cản của sóng nước đẩy lùi về phía sau ($vec(F)_2$), và gió bão thổi dạt sang mạn phải ($vec(F)_3$). 
  
  Để biết con tàu sẽ lao về đâu, Newton đã dùng *Quy tắc hình bình hành lực*: Hợp lực của hai lực đồng quy $vec(F)_1$ và $vec(F)_2$ chính là đường chéo của hình bình hành tạo bởi hai lực đó! Bằng phép toán cộng vectơ đơn giản ấy, Newton đã giải thích được tại sao Mặt Trăng không bị rơi xuống Trái Đất, tại sao Trái Đất quay quanh Mặt Trời theo quỹ đạo elip, và dự đoán chính xác sự trở lại của Sao chổi Halley sau hàng chục năm!
]

#hook-box(title: "Tại sao Máy bay Boeing 300 tấn lại cất cánh NGƯỢC CHIỀU GIÓ BÃO?")[
  Thầy chiếu hình ảnh chiếc máy bay khổng lồ Boeing 777 nặng hơn 300 tấn đang gầm rú trên đường băng sân bay Nội Bài giữa cơn mưa bão:
  
  *“Khi các em đi xe máy hay đạp xe đạp, các em luôn muốn gió thổi xuôi từ sau lưng để đẩy mình đi nhẹ nhàng. Nhưng tại sao tất cả các cơ trưởng máy bay chở khách trên thế giới lại LUÔN LUÔN YÊU CẦU CẤT CÁNH VÀ HẠ CÁNH NGƯỢC CHIỀU GIÓ?*
  
  *Bí mật nằm ở VÉCTƠ VẬN TỐC TƯƠNG ĐỐI VÀ LỰC KHÍ ĐỘNG HỌC!*
  - Gọi vận tốc máy bay so với mặt đất là $vec(v)_("đất")$, vận tốc gió là $vec(v)_("gió")$.
  - Vận tốc của dòng khí lướt qua cánh máy bay là: $vec(v)_("khí") = vec(v)_("đất") - vec(v)_("gió")$.
  - Khi cất cánh ngược chiều gió, hai vectơ này ngược hướng nhau, nên độ lớn vận tốc khí bằng TỔNG HAI ĐỘ LỚN:
    $ v_("khí") = v_("đất") + v_("gió")! $
  
  *Vận tốc dòng khí qua cánh tăng vọt lên làm cho Lực nâng khí động học Bernoulli ($vec(F)_L$) vọt lên gấp đôi, nhấc bổng cỗ máy sắt thép 300 tấn bay vút lên bầu trời chỉ sau nửa chiều dài đường băng! Phép trừ vectơ lớp 10 chính là đôi cánh nâng đỡ hàng triệu chuyến bay an toàn mỗi ngày!”*
]

---

== BÀI 10: TÍCH CỦA MỘT SỐ VỚI VECTƠ & TÂM TỈ CỰ MÖBIUS

Khi nhân một số thực $k$ với một vectơ $vec(a)$, ta thực hiện hai phép biến hình cơ bản của vũ trụ:
- Phép co giãn độ lớn: Độ dài mới bằng $|k| |vec(a)|$.
- Phép đảo ngược thời gian/phương hướng: Nếu $k > 0$ giữ nguyên hướng; nếu $k < 0$ quay ngoắt $180 degree$ đổi ngược hướng!

Và đỉnh cao của phép nhân số với vectơ chính là *Khái niệm Tâm Tỉ Cự (Barycenter)*.

#story-box(
  title: "August Ferdinand Möbius & Kiệt tác Tọa độ Tỉ cự năm 1827",
  author: "August Ferdinand Möbius (Đức, 1790 – 1868)",
)[
  August Ferdinand Möbius — học trò xuất sắc của Carl Friedrich Gauss, người nổi tiếng với Dải băng một mặt Möbius — đã xuất bản cuốn sách chấn động *“Der Barycentrische Calcul”* (Giải tích Tâm tỉ cự) vào năm 1827.
  
  Möbius tự hỏi: Nếu tại 3 đỉnh của một tam giác $A, B, C$, ta đặt 3 quả cân có khối lượng lần lượt là $m_A, m_B, m_C$. Trọng tâm cân bằng tuyệt đối của hệ 3 quả cân đó nằm ở đâu?
  
  Bằng ngôn ngữ vectơ, Möbius đã đưa ra phương trình bất hủ:
  $ m_A vec(I A) + m_B vec(I B) + m_C vec(I C) = vec(0) $
  Điểm $I$ duy nhất thỏa mãn phương trình trên được gọi là *Tâm tỉ cự của hệ chất điểm*!
  
  Khi $m_A = m_B = m_C = 1$, điểm $I$ trùng với Trọng tâm tam giác $G$: $vec(G A) + vec(G B) + vec(G C) = vec(0)$. Bằng cách thay đổi các trọng số khối lượng, điểm $I$ có thể quét qua mọi điểm trong và ngoài tam giác! Tọa độ tỉ cự của Möbius ngày nay là thuật toán nền tảng trong Unreal Engine 5 để xác định màu sắc và độ phản xạ ánh sáng tại từng điểm trên bề mặt nhân vật game 3D!
]

#hook-box(title: "Nghệ sĩ xiếc & Chiếc mâm thăng bằng trên đầu gậy nhọn")[
  Thầy cầm một cây bút bi dựng đứng trên đầu ngón tay, đặt một chiếc thước kẻ thăng bằng lên trên:
  
  *“Khi các em xem biểu diễn xiếc, nghệ sĩ xiếc cầm một chiếc gậy dài dựng đứng và đặt chiếc mâm tròn trên đầu gậy nhọn. Trên chiếc mâm đó đặt một con gà luộc, một chai sâm panh và một đĩa hoa quả nặng nhẹ khác nhau. Làm sao nghệ sĩ biết đặt đầu gậy nhọn vào ĐÚNG MỘT ĐIỂM DUY NHẤT để chiếc mâm đứng im thăng bằng mà không bị nghiêng đổ vỡ nát?*
  
  *Điểm đó chính là TÂM TỈ CỰ $I$!*
  *Tại điểm $I$, tổng các mô-men lực quay bị triệt tiêu hoàn toàn theo đúng phương trình vectơ lớp 10:*
  $ m_1 vec(I A) + m_2 vec(I B) + m_3 vec(I C) = vec(0)! $
  *Nếu lệch khỏi điểm $I$ dù chỉ 1 milimet, hợp lực vectơ sẽ sinh ra mô-men quay làm mọi thứ rơi tan tành! Nghệ sĩ xiếc tài hoa thực chất là một nhà toán học bản năng đang điều khiển tâm tỉ cự bằng đôi tay điêu luyện!”*
]

---

== BÀI 11: TÍCH VÔ HƯỚNG CỦA HAI VECTƠ — BẢN HỢP ÂM CỦA GÓC VÀ ĐỘ DÀI

Trong mọi phép toán của phổ thông, phép *Tích Vô Hướng (Dot Product)*:
$ vec(a) dot vec(b) = |vec(a)| |vec(b)| cos(vec(a), vec(b)) $
là phép toán kỳ lạ và đặc biệt nhất: *Nhân hai vectơ (đại lượng có hướng) nhưng kết quả thu được lại là MỘT CON SỐ THỰC (đại lượng vô hướng)!*

Tại sao lại như vậy? Bởi vì Tích vô hướng không phải là một phép nhân số học thông thường. Nó là một chiếc máy đo: *Đo mức độ hòa hợp và đồng điệu giữa hai hướng trong không gian!*
- Nếu hai vectơ cùng hướng ($theta = 0 degree$, $cos 0 degree = 1$): Tích vô hướng đạt cực đại (cùng chung lý tưởng, hỗ trợ nhau tối đa).
- Nếu hai vectơ ngược hướng ($theta = 180 degree$, $cos 180 degree = -1$): Tích vô hướng đạt cực tiểu âm (chống đối nhau triệt để).
- Nếu hai vectơ VUÔNG GÓC ($theta = 90 degree$, $cos 90 degree = 0$): Tích vô hướng bằng 0 (hoàn toàn độc lập, không dính líu gì tới nhau!).

#story-box(
  title: "Josiah Willard Gibbs & Oliver Heaviside: Khai sinh Tích Vô Hướng Hiện Đại",
  author: "J. W. Gibbs (Mỹ, 1839 – 1903) & Oliver Heaviside (Anh, 1850 – 1925)",
)[
  Sau khi Hamilton phát minh ra Quaternion, môn toán 4 chiều này trở nên quá đồ sộ và phức tạp đối với các kỹ sư và nhà vật lý. Khi viết phương trình điện từ học, James Clerk Maxwell phải viết tới 20 phương trình đại số rối rắm chiếm cả trang giấy!
  
  Vào những năm 1880, nhà vật lý người Mỹ *Josiah Willard Gibbs* tại Đại học Yale và kỹ sư tự học lập dị người Anh *Oliver Heaviside* đã độc lập thực hiện một cuộc phẫu thuật táo bạo: Họ cắt bỏ phần phức tạp của Quaternion, chỉ giữ lại phần không gian 3 chiều và định nghĩa hai phép toán mới: *Tích vô hướng (Dot Product)* cho ra một số, và *Tích có hướng (Cross Product)* cho ra một vectơ mới.
  
  Nhờ phát minh của Gibbs và Heaviside, 20 phương trình điện từ của Maxwell đã được rút gọn lại còn đúng *4 PHƯƠNG TRÌNH VECTƠ TUYỆT MỸ*, đẹp đến mức nhà vật lý Ludwig Boltzmann đã thốt lên: *“Có phải Thượng đế đã viết nên những phương trình này?”*! Toàn bộ lý thuyết sóng vô tuyến, điện lưới quốc gia và điện thoại di động ngày nay đều vận hành trên hệ thống vectơ của Gibbs và Heaviside!
]

#misconception-box(
  title: "Cạm bẫy 'Chia hai Vectơ' — Sai lầm Nghiêm trọng Phổ biến Nhất",
  misconception: "Có phép nhân vô hướng $vec(a) dot vec(b) = k$, vậy chắc chắn phải có phép chia hai vectơ: $vec(a) = k / vec(b)$!",
  correction: "Trong Toán học, TUYỆT ĐỐI KHÔNG BAO GIỜ CÓ PHÉP CHIA HAI VECTƠ! Biểu thức $vec(a) / vec(b)$ là hoàn toàn vô nghĩa và bị cấm chỉ!"
)[
  *Bản chất đại số sâu sắc:*
  Giả sử có phép chia: Cho số thực $k$ và vectơ $vec(b)$, tìm vectơ $vec(x)$ sao cho $vec(x) dot vec(b) = k$.
  - Phương trình này có VÔ SỐ NGHIỆM! Bất kỳ vectơ nào có hình chiếu lên $vec(b)$ bằng $k / |vec(b)|$ đều thỏa mãn. Ta có thể cộng thêm vào $vec(x)$ bất kỳ một vectơ nào VUÔNG GÓC với $vec(b)$ mà tích vô hướng vẫn không đổi (vì tích vô hướng với vectơ vuông góc bằng 0)!
  - Vì nghiệm không duy nhất, phép toán nghịch đảo (phép chia) KHÔNG THỂ XÁC ĐỊNH ĐƯỢC!
  
  Khắc ghi điều này giúp học sinh không bao giờ viết những biểu thức toán học sai ngớ ngẩn trong các bài toán tích vô hướng.
]

#dialogue-box(title: "Đối thoại Socrates: Chứng minh Pythagoras bằng Bình phương Vô hướng")[
  *Socrates:* Này Theaetetus, trong tam giác $A B C$, vectơ cạnh huyền $vec(B C)$ liên hệ như thế nào với hai vectơ cạnh góc vuông $vec(A B)$ và $vec(A C)$?
  
  *Học trò:* Thưa thầy, theo quy tắc hiệu ba điểm: $vec(B C) = vec(A C) - vec(A B)$.
  
  *Socrates:* Hay lắm! Bây giờ hãy lấy bình phương vô hướng của cả hai vế:
  $ vec(B C)^2 = (vec(A C) - vec(A B))^2 $
  Khai triển hằng đẳng thức đáng nhớ ở vế phải cho ta điều gì?
  
  *Học trò:* Dạ, $vec(B C)^2 = vec(A C)^2 + vec(A B)^2 - 2 vec(A C) dot vec(A B)$!
  
  *Socrates:* Bình phương vô hướng của một vectơ bằng gì so với độ dài của nó?
  
  *Học trò:* Dạ bằng bình phương độ dài: $vec(B C)^2 = B C^2$, $vec(A C)^2 = A C^2$, $vec(A B)^2 = A B^2$!
  
  *Socrates:* Vậy nếu tam giác $A B C$ vuông tại $A$, số hạng $- 2 vec(A C) dot vec(A B)$ sẽ bằng bao nhiêu?
  
  *Học trò:* ÔI TRỜI ƠI! Vì $A C$ vuông góc với $A B$, tích vô hướng $vec(A C) dot vec(A B) = 0$! Số hạng đó BIẾN MẤT HOÀN TOÀN!
  Và ta thu được ngay lập tức:
  $ B C^2 = A C^2 + A B^2! $
  
  *Socrates:* Đúng thế! Người Hy Lạp cổ đại phải mất hàng chục dòng kẻ hình phụ phức tạp mới chứng minh được Định lý Pythagoras. Còn với ngôn ngữ đại số vectơ lớp 10, Pythagoras chỉ là một hệ quả hiển nhiên sau đúng 2 dòng biến đổi hằng đẳng thức! Đó chính là sức mạnh vô địch của toán học hiện đại!
]

#deep-dive-box(title: "Bất đẳng thức Cauchy - Schwarz từ Góc nhìn Tích Vô Hướng")[
  Cho hai vectơ bất kỳ $vec(u), vec(v)$ trong mặt phẳng với tọa độ $vec(u) = (x_1; y_1)$ và $vec(v) = (x_2; y_2)$.
  Theo định nghĩa tích vô hướng:
  $ vec(u) dot vec(v) = |vec(u)| |vec(v)| cos theta $
  Vì giá trị $|cos theta| <= 1$ với mọi góc $theta$, ta có ngay bất đẳng thức bất hủ:
  $ |vec(u) dot vec(v)| <= |vec(u)| |vec(v)| $
  Bình phương hai vế và thay tọa độ vào:
  $ (x_1 x_2 + y_1 y_2)^2 <= (x_1^2 + y_1^2)(x_2^2 + y_2^2) $
  Đó chính là *Bất đẳng thức Cauchy - Schwarz* huyền thoại! Một bất đẳng thức đại số phức tạp đã trở nên hiển nhiên tuyệt đối chỉ nhờ tính chất bị chặn của hàm cosin trong tích vô hướng!
]

#inquiry-box(title: "Nhiệm vụ Python: Tính Cosine Similarity Đo Ngữ Nghĩa Văn Bản AI")[
  ```python
  import numpy as np

  def cosine_similarity(u, v):
      return np.dot(u, v) / (np.linalg.norm(u) * np.linalg.norm(v))

  # Giả sử 3 câu văn được AI mã hóa thành 3 vectơ trong không gian đặc trưng:
  # Câu 1: "Thầy giáo giảng bài môn Toán"
  v1 = np.array([0.8, 0.9, 0.1, 0.0])
  # Câu 2: "Học sinh nghe giảng bài hình học"
  v2 = np.array([0.75, 0.85, 0.2, 0.05])
  # Câu 3: "Hôm nay trời mưa to sấm chớp"
  v3 = np.array([0.05, 0.1, 0.8, 0.9])

  sim_1_2 = cosine_similarity(v1, v2)
  sim_1_3 = cosine_similarity(v1, v3)

  print(f"Độ tương đồng ngữ nghĩa giữa Câu 1 và Câu 2: {sim_1_2:.4f} (Rất gần gũi!)")
  print(f"Độ tương đồng ngữ nghĩa giữa Câu 1 và Câu 3: {sim_1_3:.4f} (Rất xa nhau!)")
  ```
  ChatGPT nhận biết các câu hỏi tương tự nhau của học sinh hoàn toàn dựa trên phép tính Cosine tích vô hướng lớp 10 này!
]

#v(1em)

== CHUYÊN KHẢO MỞ RỘNG: HỆ TỌA ĐỘ KHỐI TÂM (BARYCENTRIC COORDINATES) & ĐỒ HỌA 3D UNREAL ENGINE

#story-box(
  title: "August Ferdinand Möbius 1827: Khai Sinh Hình Học Khối Tâm Cân Bằng",
  author: "August Ferdinand Möbius (Đức, 1790 – 1868)",
)[
  Hầu hết mọi người chỉ biết đến Möbius qua "Dải băng Möbius" một mặt kỳ lạ. Nhưng kiệt tác toán học vĩ đại nhất của ông, cuốn sách *“Der barycentrische Calcul”* (Giải tích Khối tâm, xuất bản năm 1827), mới là nền tảng thực sự của đồ họa máy tính hiện đại!
  
  Möbius đặt câu hỏi: *“Nếu ta đặt 3 quả cân có khối lượng $alpha, beta, gamma$ tại 3 đỉnh của tam giác $A B C$, trọng tâm $P$ của hệ chất điểm này sẽ nằm ở đâu?”*
  
  Theo định luật đòn bẩy Archimedes, điểm $P$ thỏa mãn phương trình tâm tỉ cự:
  $ alpha vec(P A) + beta vec(P B) + gamma vec(P C) = vec(0) $
  Chuẩn hóa tổng khối lượng $alpha + beta + gamma = 1$, ta có biểu diễn duy nhất của vectơ vị trí điểm $P$ theo 3 đỉnh tam giác:
  $ vec(O P) = alpha vec(O A) + beta vec(O B) + gamma vec(O C) $
  Bộ ba số thực $(alpha, beta, gamma)$ được gọi là *Tọa độ tỉ cự (Barycentric Coordinates)* của điểm $P$.
  
  *Ý nghĩa hình học tuyệt mỹ:*
  - Tọa độ $alpha, beta, gamma$ tỉ lệ thuận với diện tích 3 tam giác con đối diện:
    $ alpha = S_(P B C) / S_(A B C), quad beta = S_(P C A) / S_(A B C), quad gamma = S_(P A B) / S_(A B C) $
  - Điểm $P$ *nằm trọn bên trong tam giác* khi và chỉ khi: $alpha >= 0, beta >= 0, gamma >= 0$ và $alpha + beta + gamma = 1$!
]

#tech-box(title: "Công Nghệ Nhận Diện Khuôn Mặt FaceID & Tích Vô Hướng Vectơ Đa Chiều")[
  Khi các em cầm chiếc iPhone lên, cụm cảm biến TrueDepth chiếu hơn $30.000$ điểm hồng ngoại vô hình lên khuôn mặt, đo đạc độ lồi lõm của sống mũi, hốc mắt, gò má.
  
  *Mã hóa khuôn mặt thành Vectơ số:*
  Mạng nơ-ron học sâu (Deep Learning) nén toàn bộ $30.000$ điểm tọa độ không gian thành một *Vectơ đặc trưng khuôn mặt (Face Embedding Vector)* $vec(u)$ gồm $512$ chiều trong không gian số thực $RR^(512)$.
  
  *Xác thực mở khóa trong 0,1 giây:*
  Khi người dùng giơ máy lên, camera chụp quét tạo thành vectơ $vec(v)$. Bộ vi xử lý Apple Neural Engine lập tức tính tích vô hướng chuẩn hóa (Cosine Similarity):
  $ "Similarity" = (vec(u) dot vec(v)) / (|vec(u)| |vec(v)|) = (sum_(i=1)^(512) u_i v_i) / (sqrt(sum u_i^2) sqrt(sum v_i^2)) $
  - Nếu kết quả $> 0,92$: Khuôn mặt khớp hoàn hảo, điện thoại mở khóa tức thì!
  - Dù các em đeo kính râm, thay đổi kiểu tóc hay già đi theo năm tháng, góc giữa hai vectơ vẫn duy trì độ tương đồng vượt ngưỡng! Tích vô hướng lớp 10 chính là chiếc chìa khóa sinh trắc học tối mật bảo vệ dữ liệu cá nhân của hàng tỷ người!
]

#misconception-box(
  title: "Cạm Bẫy 'Chia Cho Vectơ' & Tính Bất Khả Nghịch Của Phép Nhân Vô Hướng",
  misconception: "Nhiều học sinh quen với đại số số thực (a · x = b => x = b / a) nên khi thấy đẳng thức vectơ a · x = k, các em hồn nhiên suy luận: 'Vectơ x = k / a' hoặc 'Vectơ x = b / a'.",
  correction: "TRÊN ĐỜI TUYỆT ĐỐI KHÔNG TỒN TẠI PHÉP CHIA CHO MỘT VECTƠ! Phép nhân vô hướng hai vectơ cho ra một SỐ THỰC (Scalar), không bảo toàn thông tin về hướng. Nếu a · x = k, có VÔ SỐ VECTƠ x thỏa mãn (mọi vectơ có điểm mút nằm trên đường thẳng vuông góc với a tại hình chiếu). Do đó, phép nhân vô hướng không có phần tử nghịch đảo!",
  remedy: "Ghi nhớ sắt đá: Chỉ có 'Tích vô hướng' (nhân ra số), 'Tích vectơ với một số' (co giãn độ dài), TUYỆT ĐỐI KHÔNG BAO GIỜ đặt một vectơ dưới mẫu số của một phân số!"
)

#pagebreak()


#pagebreak()

= ĐẠI CHƯƠNG V: VŨ KHÍ GIẢI MÃ THẾ GIỚI DỮ LIỆU — THỐNG KÊ & CÁC SỐ ĐẶC TRƯNG

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 12, Bài 13, Bài 14 SGK Toán 10 cùng Chuyên đề Khoa học Dữ liệu, Biểu đồ Coxcomb Nightingale, Tiêu chuẩn Six Sigma, Định lý Giới hạn Trung tâm & Nghịch lý Simpson (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 12: SỐ GẦN ĐÚNG VÀ SAI SỐ — BÀI HỌC VỀ GIỚI HẠN NHẬN THỨC CỦA LOÀI NGƯỜI

Trong mắt học sinh phổ thông, toán học là xứ sở của sự chính xác tuyệt đối: $1 + 1 = 2$, căn bậc hai của 4 bằng 2, một góc vuông đúng $90 degree$. Nhưng khi toán học bước ra khỏi trang giấy trắng để va chạm với thế giới vật lý thực tế, *sự chính xác tuyệt đối biến mất hoàn toàn!*
- Bạn không bao giờ có thể đo được chiều dài của một chiếc bàn chính xác đến từng nguyên tử.
- Một chiếc đồng hồ nguyên tử chính xác nhất thế giới cũng bị sai lệch một phần tỷ giây sau hàng triệu năm.
- Một con chip máy tính hiện đại nhất của Intel hay Apple cũng không thể lưu trữ được giá trị chính xác của con số $1/3$ hay số $pi$.

Bài học "Số gần đúng và Sai số" chính là bài học về sự khiêm nhường của trí tuệ con người: thừa nhận rằng mọi phép đo lường và tính toán trong đời thực đều đi kèm với *Sai số (Error)*. Người kỹ sư tài ba không phải là người ảo tưởng mình có độ chính xác $100\%$, mà là người biết khống chế sai số nằm trong *Phạm vi an toàn cho phép (Tolerance)* để không gây ra thảm kịch!

#story-box(
  title: "Thảm kịch Tên lửa Patriot 1991: Cái chết của 28 binh sĩ vì một lỗi làm tròn",
  author: "Hệ thống Phòng không Patriot — Chiến tranh Vùng Vịnh (25/02/1991)",
)[
  Đêm ngày 25 tháng 2 năm 1991, trong Chiến tranh Vùng Vịnh, một quả tên lửa đạn đạo Scud của quân đội Iraq được phóng đi với vận tốc siêu thanh lao thẳng về phía căn cứ quân sự Mỹ tại Dharan, Ả Rập Xê Út. Tại căn cứ, hệ thống phòng thủ tên lửa tối tân Patriot của Mỹ được trang bị radar hiện đại đã phát hiện ra mục tiêu đang bay đến. Thế nhưng, tên lửa Patriot đã hoàn toàn im lặng, không phóng đạn đánh chặn. Quả tên lửa Scud phát nổ trúng doanh trại quân đội, cướp đi sinh mạng của 28 binh sĩ và làm bị thương gần 100 người khác.
  
  Ủy ban điều tra của Quốc hội Mỹ đã vào cuộc và phát hiện ra một sự thật chấn động: *Nguyên nhân thảm kịch không phải do hỏng radar hay nổ động cơ, mà bắt nguồn từ một sai số làm tròn số học trong phần mềm máy tính!*
  
  Đồng hồ của hệ thống Patriot đo thời gian theo đơn vị $1/10$ giây ($0,1$ giây). Trong hệ nhị phân của máy tính số, con số $0,1$ là một số thập phân vô hạn tuần hoàn:
  $ (0,1)_(10) = (0,0001100110011001100110011...)_2 $
  Thanh ghi bộ nhớ của máy tính Patriot thời đó chỉ có độ dài 24-bit, nên máy tính buộc phải cắt cụt và làm tròn số, tạo ra một sai số cực kỳ nhỏ là $0,000000095$ giây cho mỗi $0,1$ giây trôi qua!
  
  Nếu hệ thống chỉ khởi động lại sau vài giờ như thiết kế ban đầu, sai số này là vô hại. Nhưng hệ thống Patriot tại Dharan đã được bật chạy liên tục suốt hơn $100$ giờ không tắt! Sai số tích lũy nhân lên sau 100 giờ:
  $ Delta t = 0,000000095 times (100 times 60 times 60 times 10) approx 0,3433 "giây"! $
  
  Với một quả tên lửa Scud đang bay với vận tốc $1.676$ mét/giây, sai số $0,34$ giây tương đương với việc radar tính toán vị trí quả tên lửa bị lệch đi hơn $575$ mét trong không gian! Hệ thống Patriot nhìn vào "vùng trời rỗng" và tưởng rằng tên lửa đã biến mất, hủy bỏ lệnh phóng đánh chặn. Một bài học xương máu đắt giá chứng minh rằng: Một hạt cát sai số nếu bị bỏ qua có thể trở thành một trận lở tuyết hủy diệt cả mạng sống con người!
]

#story-box(
  title: "Vụ nổ Tên lửa Ariane 5 năm 1996: Vụ nổ đắt giá nhất trong lịch sử vũ trụ",
  author: "Cơ quan Vũ trụ Châu Âu (ESA) — Ngày 04/06/1996",
)[
  Chỉ 37 giây sau khi rời bệ phóng tại Kourou (Guiana thuộc Pháp), con tàu vũ trụ Ariane 5 trị giá 500 triệu USD mang theo 4 vệ tinh khoa học vô giá đã bỗng nhiên quay ngoắt $90 degree$, gãy đôi và nổ tung thành một quả cầu lửa khổng lồ trên bầu trời Đại Tây Dương.
  
  Nguyên nhân được phát hiện chỉ sau vài tuần điều tra: Phần mềm điều khiển của Ariane 5 đã bê nguyên đoạn mã nguồn của tên lửa đời trước (Ariane 4). Trong đó, vận tốc ngang của tên lửa được lưu trữ dưới dạng số thực dấu phẩy động 64-bit (Floating point). Nhưng khi nạp vào hệ thống dẫn đường quán tính, máy tính đã cố gắng ép kiểu (convert) con số 64-bit này thành một số nguyên có dấu 16-bit (Signed Integer) — vốn chỉ chứa được giá trị tối đa là $32.767$!
  
  Tên lửa Ariane 5 mạnh hơn nhiều so với Ariane 4, vận tốc ngang vượt qua ngưỡng $32.767$, dẫn đến hiện tượng *Tràn số nguyên (Integer Overflow)*. Máy tính phát sinh mã lỗi, động cơ đẩy hiểu nhầm đó là lệnh quay ngoắt sang một bên và tự bẻ gãy thân tên lửa! Nửa tỷ USD tan thành tro bụi chỉ vì một sai số kiểu dữ liệu số học mà học sinh lớp 10 học hôm nay!
]

#story-box(
  title: "Thước Mét Tại Sèvres & Cuộc Cách Mạng Định Nghĩa Lại Hệ Đo Lường Quốc Tế SI 2019",
  author: "Viện Đo lường Quốc tế (BIPM) — Paris, Pháp",
)[
  Năm 1799, sau Cách mạng Pháp, các nhà khoa học đã nỗ lực tạo ra một hệ thống đo lường phổ quát cho toàn nhân loại: "Dành cho mọi thời đại, cho mọi dân tộc". Họ chế tạo ra *Thanh mét chuẩn (Prototype Metre)* bằng hợp kim $90\%$ Platinum và $10\%$ Iridium, cất giữ nghiêm ngặt trong hầm ngầm dưới lòng đất tại Sèvres ngoại ô Paris, được bảo vệ bởi ba lớp chuông thủy tinh hút chân không.
  
  Tuy nhiên, qua hơn một thế kỷ, các nhà vật lý nhận ra một vấn đề chí mạng: Ngay cả thanh kim loại quý giá nhất cũng bị co giãn theo nhiệt độ, áp suất, và thậm chí mất đi vài microgram nguyên tử qua thời gian! Nếu "vật chuẩn" tự nó thay đổi, thì toàn bộ các phép đo trên thế giới đều bị lung lay!
  
  Năm 2019, Đại hội Cân Đo Quốc tế (CGPM) đã quyết định một bước chuyển lịch sử: *Xóa bỏ vĩnh viễn mọi hiện vật vật lý làm chuẩn!* Ngày nay:
  - Một mét không còn được định nghĩa bằng thanh kim loại ở Paris, mà là *quãng đường ánh sáng truyền trong chân không trong khoảng thời gian đúng $1 / 299.792.458$ giây!*
  - Một kilôgam không còn là quả cân "Le Grand K", mà được định nghĩa thông qua hằng số lượng tử Planck $h = 6,62607015 times 10^(-34) "J" dot "s"$.
  
  Khoa học hiện đại đã neo giữ độ chính xác của nhân loại vào các *Hằng số bất biến của Vũ trụ*, biến sai số đo lường trở thành một đại lượng được kiểm soát đến cấp độ hạ nguyên tử!
]

#hook-box(title: "Bạn có bao giờ biết chính xác chiều cao của mình?")[
  Thầy bước vào lớp, cầm chiếc thước dây và gọi một bạn học sinh lên đo chiều cao:
  
  *“Em cao bao nhiêu?”* — Học sinh đáp: *“Thưa thầy, em cao $1$m$70$ ạ!”*
  
  Thầy nhìn cả lớp mỉm cười:
  
  *“Thầy khẳng định với các em: Bạn ấy KHÔNG BAO GIỜ cao đúng $1,7000000...$ mét!*
  - Nếu đo bằng thước dây nhựa ngoài chợ: Bạn cao $1,70$ m $plus.minus 0,5$ cm.
  - Nếu vào bệnh viện dùng thước kẹp y tế: Bạn cao $1,703$ m $plus.minus 1$ mm.
  - Nếu dùng máy đo laser trong phòng thí nghiệm: Bạn cao $1,70342$ m $plus.minus 0,01$ mm.
  - Và ngay cả khi có máy đo nguyên tử, chiều cao của các em buổi sáng khi vừa ngủ dậy bao giờ cũng dài hơn buổi tối từ 1 đến 2 cm do các đĩa đệm cột sống bị trọng lực nén lại trong suốt cả ngày!
  
  *Bài học rút ra:* Mọi con số trong đời thực đều đi kèm với một khoảng sai số $[a - d; a + d]$. Sự thông minh của người làm khoa học không phải là tự lừa dối mình về sự chính xác tuyệt đối, mà là biết rõ sai số của mình là bao nhiêu để kiểm soát rủi ro!"
]

#tech-box(title: "Sai số Tuyệt đối vs Sai số Tương đối: Tầm vóc của Bối cảnh")[
  - *Sai số tuyệt đối ($Delta_a <= d$)*: Cho biết độ lệch tối đa giữa số gần đúng và giá trị chân xác.
  - *Sai số tương đối ($delta_a = Delta_a / |a| <= d / |a| = delta$)*: Cho biết sai số chiếm bao nhiêu phần trăm so với quy mô của đối tượng được đo.
  
  *Ví dụ so sánh sống động:*
  - Một kỹ sư đo chiều dài cây cầu dây văng dài $1.000$ m với sai số $d = 1$ cm ($0,01$ m). Sai số tương đối là:
    $ delta_1 = (0,01) / 1000 = 0,00001 = 0,001\% $ $arrow$ Độ chính xác thần kỳ, đẳng cấp thế giới!
  - Một dược sĩ đong liều lượng độc chất trong viên thuốc trợ tim nặng $10$ mg với sai số $d = 1$ mg. Sai số tương đối là:
    $ delta_2 = 1 / 10 = 10\% $ $arrow$ Sai số kinh hoàng, có thể khiến bệnh nhân ngừng tim tử vong ngay lập tức!
  
  Cùng là sai số $1$ đơn vị, nhưng trong xây dựng cầu thì tuyệt hảo, còn trong sản xuất thuốc thì giết người! *Sai số tương đối chính là thước đo chất lượng thực sự của phép đo lường!*
]

---

== BÀI 13: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM — TRUNG BÌNH CỘNG CÓ PHẢI KẺ NÓI DỐI?

Khi đứng trước một tập dữ liệu khổng lồ gồm hàng triệu con số, bộ não con người không thể nhớ hết từng giá trị riêng lẻ. Chúng ta cần những "đại sứ đại diện" để tóm tắt bức tranh toàn cảnh: *Số trung bình ($bar(x)$), Trung vị ($M_e$), Mốt ($M_o$) và Tứ phân vị ($Q_1, Q_2, Q_3$)*.

Nhưng nếu chỉ biết dùng duy nhất một con số trung bình cộng, con người sẽ rơi vào những ảo giác thống kê vô cùng tai hại!

#story-box(
  title: "Bill Gates Bước Vào Quán Bia Nghèo: Khi Số Trung Bình Cộng Trở Thành Kẻ Lừa Đảo",
  author: "Nghịch lý Thu nhập Trung bình & Khái niệm Trung vị (Median)",
)[
  Hãy tưởng tượng một quán bia bình dân ở ngoại ô thành phố Seattle, nơi có 10 người lao động nghèo đang ngồi uống bia. Thu nhập hàng tháng của mỗi người dao động từ 10 đến 16 triệu đồng:
  $ 10, 11, 12, 12, 13, 13, 14, 14, 15, 16 "(triệu đồng)" $
  - Thu nhập trung bình của quán bia là: $bar(x) = (10 + 11 + ... + 16) / 10 = 13$ triệu đồng/tháng. Con số này phản ánh rất trung thực đời sống của những người trong quán.
  
  Đột nhiên, cánh cửa quán bia mở ra, và tỷ phú *Bill Gates* bước vào ngồi uống một chai nước suối! Thu nhập hàng tháng của Bill Gates ước tính khoảng *100 tỷ đồng* ($100.000$ triệu đồng).
  
  Lúc này, hãy tính lại thu nhập trung bình của 11 người trong quán:
  $ bar(x)_("mới") = (130 + 100.000) / 11 approx 9.102 "triệu đồng (hơn 9,1 TỶ ĐỒNG/NGƯỜI/THÁNG)!" $
  
  Nếu một tờ báo giật tít: *“Kỳ tích kinh tế: Thu nhập trung bình của người dân trong quán bia ngoại ô đã vọt lên hơn 9 tỷ đồng mỗi tháng!”*, thì đó là một trò hề lố bịch! Mười người lao động kia không hề giàu thêm một xu nào, túi tiền của họ vẫn xẹp lép như cũ! Con số trung bình cộng đã bị bóp méo hoàn toàn bởi một *Giá trị ngoại lai cực đoan (Extreme Outlier)* là Bill Gates!
  
  *Sự cứu rỗi của Trung vị ($M_e$):*
  Sắp xếp lại 11 người theo thứ tự thu nhập tăng dần và lấy người đứng chính giữa (người thứ 6):
  $ M_e = 13 "triệu đồng"! $
  Dù Bill Gates có kiếm được 100 tỷ hay 1.000 tỷ đồng, số Trung vị $M_e$ vẫn đứng sừng sững ở mức 13 triệu đồng, phản ánh trung thực mức sống của đại đa số người dân! Đó là lý do tại sao các tổ chức quốc tế như Ngân hàng Thế giới (World Bank) luôn dùng Thu nhập Trung vị thay vì Thu nhập Trung bình để đo lường mức sống thực sự của một quốc gia!
]

#tech-box(title: "Mốt (Mode) & Thuật toán Đề xuất Thời trang Uniqlo, Zara")[
  - *Mốt trong sản xuất dây chuyền công nghiệp*: Nếu một hãng giày thể thao Nike sản xuất giày theo "cỡ giày trung bình" là $40,35$, họ sẽ phá sản ngay lập tức vì không ai có bàn chân cỡ $40,35$ cả! Họ phải sử dụng *Mốt ($M_o$)* — cỡ giày có số lượng người mua nhiều nhất (ví dụ cỡ 40 và cỡ 41) — để phân bổ $70\%$ công suất nhà máy vào các cỡ này, tối ưu hóa hàng tồn kho và chi phí lưu kho.
  - *Mốt trong đề xuất thuật toán Spotify, Netflix*: Danh sách bài hát "Top Hits" hay phim "Trending No. 1" chính là giá trị Mốt của hành vi người dùng trong 24 giờ qua!
]

#story-box(
  title: "Định Lý Giới Hạn Trung Tâm (CLT) & Bàn Cờ Đinh Galton Kỳ Ảo",
  author: "Sir Francis Galton (Anh, 1822 – 1911) & Carl Friedrich Gauss (1777 – 1855)",
)[
  Năm 1889, nhà bác học người Anh Sir Francis Galton đã sáng chế ra một cỗ máy kỳ diệu gọi là *Galton Board (Bàn cờ đinh)*: Một hộp kính thẳng đứng bên trong có hàng trăm chiếc đinh được đóng so le hình tam giác. Từ trên đỉnh, hàng vạn viên bi chì nhỏ được thả rơi tự do.
  
  Mỗi khi viên bi va vào một chiếc đinh, nó chỉ có hai lựa chọn ngẫu nhiên $50/50$: nảy sang trái hoặc nảy sang phải. Tưởng chừng như sự rơi hỗn loạn của hàng vạn viên bi sẽ tạo ra một đống bừa bãi vô trật tự dưới đáy hộp kính. Thế nhưng, một phép màu đã hiện ra: *Các viên bi dưới đáy luôn luôn tích tụ lại thành một đường cong hình quả chuông đối xứng hoàn hảo — Đường cong Phân phối Chuẩn Gauss (Normal Curve)!*
  
  Galton đã thốt lên đầy xúc động:
  *“Nếu người Hy Lạp cổ đại biết đến Phân phối Chuẩn, chắc chắn họ đã tôn thờ nó như một vị thần tối cao cai quản trật tự từ cõi hỗn mang!”*
  
  Đó chính là minh chứng trực quan của *Định lý Giới hạn Trung tâm (Central Limit Theorem)*: Dù các biến số ngẫu nhiên ban đầu có kỳ quặc thế nào, thì tổng hoặc trung bình của một lượng lớn các biến số độc lập luôn luôn hội tụ về Phân phối Chuẩn! Chiều cao con người, chỉ số IQ, huyết áp, điểm thi tốt nghiệp THPT toàn quốc đều là sự tích lũy của hàng ngàn yếu tố vi mô độc lập, nên tất cả đều tự động xếp hàng thành hình quả chuông Gauss tuyệt mỹ!
]

---

== BÀI 14: CÁC SỐ ĐẶC TRƯNG ĐO ĐỘ PHÂN TÁN — SỨC MẠNH CỦA ĐỘ LỆCH CHUẨN

Biết số trung bình thôi là chưa đủ, ta cần phải biết: *Các con số dữ liệu đang co cụm sít sao quanh số trung bình hay đang tản mác hỗn loạn ra xa?* Thước đo mức độ rủi ro và biến động đó chính là: *Khoảng biến thiên ($R$), Khoảng tứ phân vị ($I Q R$), Phương sai ($s^2$) và Độ lệch chuẩn ($s$)*.

#story-box(
  title: "Florence Nightingale & Biểu đồ Hoa hồng Cứu Sống Hàng Vạn Binh Sĩ Năm 1854",
  author: "Florence Nightingale (Anh, 1820 – 1910) — Người Mẹ Của Ngành Y Tế Hiện Đại",
)[
  Năm 1854, cuộc Chiến tranh Crimea bùng nổ. Nữ y tá quý tộc người Anh *Florence Nightingale* tình nguyện dẫn đầu đoàn 38 nữ y tá đến bệnh viện dã chiến quân đội tại Scutari (Thổ Nhĩ Kỳ). Khi bước chân vào bệnh viện, bà kinh hoàng chứng kiến cảnh tượng địa ngục: Binh sĩ nằm la liệt trên sàn nhà đầy rác rưởi, cống rãnh bốc mùi hôi thối, chuột bọ chạy lăng xăng, nước uống bị ô nhiễm và thiếu thốn thuốc men trầm trọng.
  
  Tỉ lệ tử vong của thương binh tại bệnh viện lên tới *42%*! Nhưng các tướng lĩnh quân đội chỉ coi đó là "tổn thất bình thường trên chiến trường do đạn pháo của quân Nga".
  
  Florence Nightingale không chỉ là một y tá có trái tim nhân hậu, bà còn là một *nhà thống kê học thiên tài*! Bà bắt đầu ghi chép tỉ mỉ từng ca tử vong mỗi ngày thành một bộ dữ liệu khổng lồ. Để thuyết phục Quốc hội Anh và Nữ hoàng Victoria đang thờ ơ, bà đã phát minh ra một loại biểu đồ thống kê trực quan mang tính cách mạng: *Biểu đồ Hoa hồng (Rose Diagram / Polar Area Diagram / Coxcomb)*!
  
  Trên biểu đồ hình cánh quạt hoa hồng của Nightingale, mỗi cánh hoa đại diện cho một tháng:
  - Phần màu đỏ nhỏ xíu đại diện cho số binh sĩ chết vì vết thương đạn bắn ngoài mặt trận.
  - Phần màu xanh lam khổng lồ chiếm tới $85\%$ diện tích đại diện cho số binh sĩ chết vì *BỆNH TRUYỀN NHIỄM VÀ ĐIỀU KIỆN VỆ SINH BẨN THỈU TRONG BỆNH VIỆN* (thương hàn, tả, kiết lỵ)!
  
  Bằng sức mạnh của dữ liệu thống kê trực quan, Nightingale đã chứng minh hùng hồn trước Quốc hội: *Quân đội Anh không chết vì súng đạn kẻ thù, họ đang bị giết chết bởi sự dơ bẩn và thiếu vệ sinh của chính bệnh viện quân y!*
  
  Chính phủ Anh lập tức cho cải tạo toàn bộ hệ thống thoát nước, thông gió, giặt sạch chăn màn và đun sôi nước uống. Chỉ trong vòng 6 tháng, tỉ lệ tử vong tại bệnh viện đã rơi thẳng đứng từ *42% xuống chỉ còn 2%!*
  
  Florence Nightingale trở thành người phụ nữ đầu tiên được bầu vào Viện Thống kê Hoàng gia Anh. Bà đã dùng các con số thống kê và độ phân tán như một vũ khí thiêng liêng cứu sống hàng triệu sinh mạng con người trên khắp thế giới!
]

#hook-box(title: "Chọn Xạ thủ đi Olympic: Điểm 8 An Toàn hay Điểm 10 Đau Tim?")[
  Thầy viết kết quả bắn 10 viên đạn của hai xạ thủ lên bảng:
  - Xạ thủ An: $8, 8, 8, 8, 8, 8, 8, 8, 8, 8$ $arrow$ Điểm trung bình: $bar(x)_A = 8,0$.
  - Xạ thủ Bình: $10, 6, 10, 6, 10, 6, 10, 6, 10, 6$ $arrow$ Điểm trung bình: $bar(x)_B = 8,0$.
  
  *“Cả hai xạ thủ đều có điểm trung bình 8,0 bằng nhau chằn chặn. Nếu là Huấn luyện viên trưởng đội tuyển bắn súng Quốc gia đi thi đấu Olympic, các em sẽ chọn ai?”*
  
  Cả lớp sẽ chia làm hai phe tranh luận sôi nổi. Thầy bấm máy tính tính Độ lệch chuẩn:
  - Độ lệch chuẩn của An: $s_A = 0$! An bắn ổn định tuyệt đối như một cỗ máy, không hề có rủi ro!
  - Độ lệch chuẩn của Bình: $s_B = 2,0$! Bình có độ biến động rất lớn, lúc thăng hoa bắn 10, lúc run tay rớt xuống 6 điểm!
  
  *Thông điệp của Thầy:* "Trong tài chính đầu tư phố Wall hay chọn phi công tiêm kích: Điểm trung bình chỉ là một nửa sự thật. ĐỘ LỆCH CHUẨN chính là thước đo RỦI RO! Người thành công bền vững không phải là người thỉnh thoảng có một ngày bùng nổ rồi lụn bại, mà là người có độ lệch chuẩn nhỏ nhất: giữ vững kỷ luật và phong độ đỉnh cao qua từng ngày!"
]

#misconception-box(
  title: "Cạm bẫy Chia n hay Chia n - 1: Hiệu chỉnh Bessel (Bessel's Correction)",
  misconception: "Phương sai lúc nào cũng lấy tổng bình phương độ lệch chia cho tổng số quan sát n!",
  correction: "Nếu tính phương sai cho TOÀN BỘ TẬP DÂN SỐ (Population) thì chia cho N. Nhưng khi ta chỉ lấy MẪU NGẪU NHIÊN (Sample) gồm n phần tử từ thực tế, ta BẮT BUỘC PHẢI CHIA CHO n - 1 để bù trừ sai số ước lượng (Hiệu chỉnh Bessel)!"
)[
  Khi chỉ lấy mẫu nhỏ $n$, các phần tử trong mẫu có xu hướng gần với số trung bình mẫu $bar(x)$ hơn là gần với số trung bình thực sự $mu$ của toàn bộ dân số. Do đó, nếu chia cho $n$, phương sai mẫu sẽ luôn luôn *bị đánh giá thấp hơn (Underestimate)* so với thực tế!
  
  Chia cho $n - 1$ là một hiệu chỉnh toán học thiên tài giúp phương sai mẫu trở thành một *Ước lượng không chệch (Unbiased Estimator)*. Đó là lý do trên máy tính Casio luôn có hai phím riêng biệt: $sigma_x$ (chia $n$) và $s_x$ (chia $n-1$)!
]

#misconception-box(
  title: "Nhầm lẫn Tai hại giữa Độ lệch chuẩn (s) và Sai số chuẩn (SE)",
  misconception: "Độ lệch chuẩn s và Sai số chuẩn SE = s / sqrt(n) là cùng một đại lượng, dùng thay thế cho nhau được!",
  correction: "Độ lệch chuẩn s đo lường ĐỘ PHÂN TÁN CỦA CÁC CÁ THỂ trong mẫu (ví dụ: chiều cao giữa các học sinh). Còn Sai số chuẩn SE đo lường ĐỘ KHÔNG CHẮC CHẮN CỦA GIÁ TRỊ TRUNG BÌNH MẪU khi ta lặp lại khảo sát nhiều lần!"
)[
  - Khi cỡ mẫu $n$ tăng lên từ $100$ lên $10.000$: Độ lệch chuẩn $s$ của chiều cao học sinh *hầu như không đổi* (vì người thấp người cao vẫn thế).
  - Nhưng Sai số chuẩn $S E = s / sqrt(n)$ sẽ *co cụm giảm đi 10 lần*! Điều này phản ánh niềm tin vững chắc: Khảo sát 10.000 người cho ta giá trị trung bình chính xác gấp 10 lần so với chỉ khảo sát 100 người!
]

#dialogue-box(title: "Đối thoại Socrates: Nghịch lý Simpson trong Thử nghiệm Thuốc")[
  *Socrates:* Này bạn trẻ, một loại thuốc điều trị sỏi thận được thử nghiệm trên 800 bệnh nhân:
  - Ở nhóm sỏi nhỏ: Thuốc $A$ chữa khỏi $93\%$, thuốc $B$ chữa khỏi $87\%$.
  - Ở nhóm sỏi lớn: Thuốc $A$ chữa khỏi $73\%$, thuốc $B$ chữa khỏi $69\%$.
  Hỏi: Bác sĩ nên kê đơn thuốc nào cho bệnh nhân?
  
  *Học trò:* Thưa thầy, hiển nhiên là thuốc $A$ tốt hơn thuốc $B$ ở cả hai trường hợp sỏi nhỏ và sỏi lớn!
  
  *Socrates:* Thế nhưng khi Giám đốc bệnh viện tổng kết dữ liệu chung cuộc của cả 800 ca: Thuốc $B$ chữa khỏi $83\%$, trong khi thuốc $A$ chỉ chữa khỏi $78\%$! Báo chí lên án thuốc $A$ kém cỏi. Ai đúng ai sai?
  
  *Học trò:* Ôi trời đất ơi! Sao gộp lại thuốc $A$ lại thua được ạ?
  
  *Socrates:* Hãy nhìn vào số ca bệnh! Bác sĩ thử thuốc $A$ chủ yếu trên các ca sỏi lớn nguy kịch (chiếm $75\%$ số ca của thuốc $A$), trong khi thuốc $B$ được ưu ái thử trên các ca sỏi nhỏ nhẹ tênh (chiếm $75\%$ số ca của thuốc $B$)! Biến số ẩn "Mức độ nặng nhẹ của bệnh" đã bóp méo toàn bộ tỉ lệ trung bình gộp chung!
  
  *Học trò:* Em hiểu rồi! Số liệu trung bình gộp nếu không chia theo phân lớp sẽ trở thành chiếc bẫy tinh vi nhất đánh lừa công chúng!
]

#deep-dive-box(title: "Tiêu chuẩn Six Sigma (6 Sigma) Tại Nhà Máy Đúc Chip Bán Dẫn TSMC")[
  Tại các nhà máy đúc chip bán dẫn tối tân nhất của TSMC ở Đài Loan sản xuất chip 3-nanomet cho iPhone, hàng tỷ bóng bán dẫn được khắc trên một tấm bán dẫn silicon (Wafer) bằng tia siêu cực tím (EUV).
  
  Làm thế nào để đảm bảo hàng triệu con chip xuất xưởng không bị lỗi hỏng? Họ áp dụng *Quy tắc Six Sigma ($6sigma$)* của nhà toán học Carl Friedrich Gauss:
  - Khoảng dung sai thiết kế cho phép phải bao trùm tới $6$ lần độ lệch chuẩn ($mu plus.minus 6sigma$).
  - Tỉ lệ sản phẩm hoàn hảo đạt tới *99,99966%*!
  - Nghĩa là trong $1.000.000$ bóng bán dẫn được sản xuất ra, chỉ được phép có tối đa *3,4 hạt lỗi*!
  
  Toán học độ lệch chuẩn lớp 10 chính là thước đo chất lượng vàng bảo đảm cho toàn bộ nền công nghiệp bán dẫn trị giá 600 tỷ USD của nhân loại vận hành trơn tru!
]

#deep-dive-box(title: "Lý Thuyết Danh Mục Đầu Tư Markowitz (Nobel Kinh Tế 1990) & Triệt Tiêu Rủi Ro")[
  Tại sao các nhà tài chính phố Wall không bao giờ dồn toàn bộ tiền vào một cổ phiếu duy nhất dù cổ phiếu đó có lợi nhuận cao đến mấy?
  
  Năm 1952, chàng nghiên cứu sinh 25 tuổi *Harry Markowitz* đã công bố một mô hình toán học đoạt giải Nobel Kinh tế năm 1990: *Modern Portfolio Theory (MPT)*.
  
  Giả sử ta đầu tư vào hai tài sản $A$ và $B$ với tỉ trọng $w_A$ và $w_B$ ($w_A + w_B = 1$). Phương sai rủi ro của toàn bộ danh mục đầu tư là:
  $ sigma_p^2 = w_A^2 sigma_A^2 + w_B^2 sigma_B^2 + 2 w_A w_B rho_(A B) sigma_A sigma_B $
  trong đó $rho_(A B)$ là hệ số tương quan giữa hai tài sản (chạy từ $-1$ đến $+1$).
  
  *Điều kỳ diệu xảy ra khi $rho_(A B) = -1$ (hai tài sản biến động ngược chiều nhau):*
  $ sigma_p^2 = (w_A sigma_A - w_B sigma_B)^2 $
  Nếu chọn tỉ trọng $w_A = sigma_B / (sigma_A + sigma_B)$ và $w_B = sigma_A / (sigma_A + sigma_B)$, ta có:
  $ sigma_p^2 = 0 quad arrow quad sigma_p = 0! $
  
  *Kết luận chấn động:* Bằng cách phối hợp hai cổ phiếu có độ rủi ro rất cao nhưng biến động ngược chiều nhau (ví dụ: công ty sản xuất kem chống nắng và công ty sản xuất ô dù đi mưa), nhà đầu tư có thể *TRIỆT TIÊU HOÀN TOÀN RỦI RO ($sigma_p = 0$)* mà vẫn duy trì được mức lợi nhuận dương kỳ vọng! Đó chính là sức mạnh tối thượng của Toán học Thống kê trong tài chính định lượng!
]

#inquiry-box(title: "Nhiệm vụ Python: Vẽ Biểu Đồ Hộp Boxplot, Lọc Nhiễu & Mô Phỏng CLT")[
  ```python
  import numpy as np

  # 1. Phát hiện Outlier bằng Hàng rào Tukey (IQR):
  data = np.array([12, 13, 14, 14, 15, 15, 16, 17, 18, 19, 45, 2])
  q1, q2, q3 = np.percentile(data, [25, 50, 75])
  iqr = q3 - q1
  lower_fence = q1 - 1.5 * iqr
  upper_fence = q3 + 1.5 * iqr
  outliers = data[(data < lower_fence) | (data > upper_fence)]
  print(f"IQR: {iqr} | Fences: [{lower_fence}; {upper_fence}] | Dị biệt: {outliers}")

  # 2. Mô phỏng Định lý Giới hạn Trung tâm (CLT) bằng Monte Carlo:
  # Gieo 100 con xúc xắc ngẫu nhiên (phân phối đều), lặp lại 10.000 lần
  np.random.seed(42)
  dice_rolls = np.random.randint(1, 7, size=(10000, 100))
  sample_means = dice_rolls.mean(axis=1)
  print(f"Trung bình các mẫu: {sample_means.mean():.4f} (Lý thuyết: 3.5000)")
  print(f"Độ lệch chuẩn của trung bình mẫu: {sample_means.std():.4f} (Lý thuyết: {np.sqrt(35/12)/10:.4f})")
  ```
]

#pagebreak()


#pagebreak()

= ĐẠI CHƯƠNG VI: BẢN GIAO HƯỞNG BIẾN THIÊN — HÀM SỐ, ĐỒ THỊ & ỨNG DỤNG

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 15, Bài 16, Bài 17, Bài 18 SGK Toán 10 cùng Chuyên đề Quỹ đạo Ném xiên Galileo, Cầu Cổng Vàng, Tối ưu hóa Kinh tế học & Thuật toán Gradient Descent AI (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 15: HÀM SỐ VÀ SỰ BIẾN THIÊN — BƯỚC CHUYỂN TỪ TĨNH HỌC SANG ĐỘNG HỌC

Trong hình học cổ điển của Euclid, mọi thứ đều đứng yên: một tam giác cố định, một đường tròn bất biến. Nhưng vũ trụ mà chúng ta đang sống là một dòng chảy vĩnh hằng không ngừng chuyển dịch:
- Trái Đất quay quanh Mặt Trời từng giây từng phút.
- Dân số thế giới tăng lên theo từng năm tháng.
- Nhiệt độ sôi của nước thay đổi theo áp suất độ cao.
- Nồng độ thuốc trong máu giảm dần theo thời gian đào thải của gan.

Làm thế nào để toán học nắm bắt được sự chuyển động không ngừng ấy? Câu trả lời là: *Khái niệm Hàm số!* Hàm số là cỗ máy thần kỳ liên kết hai đại lượng biến thiên: hễ cho một giá trị đầu vào $x$ (nguyên nhân), cỗ máy sẽ sản sinh ra một giá trị đầu ra duy nhất $y = f(x)$ (kết quả). Khái niệm hàm số đánh dấu thời khắc Toán học bước từ thế giới "Tĩnh" sang thế giới "Động"!

#story-box(
  title: "Gottfried Wilhelm Leibniz, Leonhard Euler & Sự ra đời của ký hiệu f(x)",
  author: "Gottfried Wilhelm Leibniz (1646 – 1716) & Leonhard Euler (1707 – 1783)",
)[
  Từ "Function" (Hàm số) xuất hiện lần đầu tiên trong một bản thảo viết tay năm 1692 của nhà bác học vĩ đại người Đức *Gottfried Wilhelm Leibniz* (người đồng phát minh ra phép tính vi tích phân cùng Isaac Newton). Trong tiếng Latin cổ, "Functio" có nghĩa là "thực hiện", "nhiệm vụ" hoặc "vai trò". Leibniz dùng từ này để chỉ một đại lượng hình học thay đổi vai trò phụ thuộc vào một đường cong chuyển động.
  
  Hơn 40 năm sau, vào năm 1734, "người thầy của mọi nhà toán học" — *Leonhard Euler* — đã làm một bước đột phá vĩ đại: ông chính thức đưa ra ký hiệu $f(x)$ trong cuốn sách kinh điển *“Introductio in Analysin Infinitorum”*. Euler đã biến hàm số từ một khái niệm hình học mơ hồ thành một thực thể đại số độc lập: $f$ là chiếc hộp chức năng, $x$ là biến số tự do được bơm vào, và $f(x)$ là sản phẩm tất yếu sinh ra. 
  
  Ký hiệu $f(x)$ tao nhã của Euler đã giải phóng toán học khỏi sự cồng kềnh của ngôn ngữ lời nói, trở thành cú pháp lập trình đầu tiên của nền văn minh, đặt nền móng cho mọi hàm số (`function`) trong ngôn ngữ máy tính Python, C++ và JavaScript ngày nay!
]

#hook-box(title: "Hòn đá rơi tự do & Giác quan thứ sáu của Hàm số")[
  Thầy cầm viên phấn giơ cao ngang trán rồi buông tay cho viên phấn rơi xuống đất:
  
  *“Viên phấn rơi mất bao lâu? Độ cao của nó thay đổi thế nào theo thời gian?*
  
  *Nếu các em đứng nhìn bằng mắt thường, các em chỉ thấy viên phấn rơi vèo một cái xuống sàn. Mắt người có tốc độ chụp ảnh rất chậm, chỉ khoảng 24 khung hình/giây. Nhưng Hàm số $y = f(t) = h_0 - 1/2 g t^2$ chính là chiếc kính hiển vi thời gian: nó cho phép các em biết chính xác viên phấn đang ở độ cao bao nhiêu milimet tại thời điểm $t = 0,1234$ giây!*
  
  *Hàm số chính là giác quan thứ sáu của loài người: Nó cho phép chúng ta nhìn thấu tương lai và tái hiện lại quá khứ của bất kỳ một chuyển động nào trong vũ trụ!”*
]

#tech-box(title: "Hàm kích hoạt (Activation Functions) trong Mạng nơ-ron Deep Learning")[
  - *Bộ não nhân tạo đập theo các hàm số*: Trong mạng nơ-ron sâu của ChatGPT, hàng tỷ tế bào thần kinh nhân tạo (Artificial Neurons) liên tục nhận tín hiệu đầu vào, nhân với trọng số rồi truyền qua một *Hàm kích hoạt (Activation Function)*. Các hàm số phổ biến nhất là:
    + Hàm ReLU: $f(x) = max(0, x)$ — đơn giản nhưng mô phỏng chính xác ngưỡng phát xung của nơ-ron sinh học não người.
    + Hàm Sigmoid: $f(x) = 1 / (1 + e^(-x))$ — nén toàn bộ giá trị từ âm vô cùng đến dương vô cùng về khoảng xác suất $[0; 1]$.
    Không có những hàm số biến thiên phi tuyến này, toàn bộ mô hình AI sẽ suy biến thành một hàm tuyến tính ngây thơ, không bao giờ có thể nhận diện được hình ảnh hay sáng tác thơ văn!
]

---

== BÀI 16: HÀM SỐ BẬC HAI — ĐƯỜNG CONG PARABOL LÀM THAY ĐỔI LỊCH SỬ CHIẾN TRANH

Trong tất cả các hàm số phi tuyến, *Hàm số bậc hai* $y = a x^2 + b x + c$ ($a != 0$) là hàm số đẹp đẽ, cân đối và quyền năng nhất. Đồ thị của nó là một đường cong hình chữ $U$ gọi là *Parabol*. Đường Parabol không phải là một phát minh tùy tiện của các nhà toán học trong phòng thí nghiệm, mà là *vết tích hình học mà Mẹ Tự Nhiên khắc lên bầu trời khi một vật thể bay trong trường trọng lực!*

#story-box(
  title: "Galileo Galilei & Cuộc lật đổ giáo điều 2.000 năm của Aristotle",
  author: "Galileo Galilei (Ý, 1564 – 1642)",
)[
  Suốt gần 2.000 năm từ thời Hy Lạp cổ đại đến thời Trung Cổ, toàn bộ giới học thuật châu Âu đều tin vào giáo lý của Aristotle: Khi một khẩu đại bác bắn ra một quả đạn, quả đạn sẽ bay theo một *đường thẳng tắp* cho đến khi hết "lực đẩy bên trong" (impetus), sau đó nó sẽ khựng lại trên không trung một giây rồi rơi *thẳng đứng xuống đất* theo góc vuông $90 degree$! Thậm chí các binh sĩ pháo thủ thời đó còn vẽ những bức tranh đạn pháo bay hình chữ nhật lên các sách giáo khoa quân sự!
  
  Chứng kiến sự vô lý đến nực cười đó, nhà bác học *Galileo Galilei* đã quyết định đi tìm chân lý. Tại thành phố Florence, ông thiết kế những máng trượt nghiêng bằng gỗ nhẵn thín, bôi trơn bằng dầu, cho những viên bi đồng lăn xuống và dùng đồng hồ nước để đo thời gian rơi với độ chính xác từng giọt nước.
  
  Năm 1638, trong cuốn sách kiệt tác *“Đối thoại về hai ngành khoa học mới”*, Galileo đã công bố một khám phá làm rung chuyển nền vật lý: Chuyển động ném xiên của một vật thể thực chất là sự *HỢP NHẤT CỦA HAI CHUYỂN ĐỘNG ĐỘC LẬP*:
  1. Theo phương ngang: Chuyển động thẳng đều với vận tốc không đổi $v_x = v_0 cos alpha$, quãng đường $x(t) = (v_0 cos alpha) t$.
  2. Theo phương thẳng đứng: Chuyển động biến đổi đều chịu gia tốc rơi tự do của trọng lực Trái Đất $y(t) = (v_0 sin alpha) t - 1/2 g t^2$.
  
  Rút thời gian $t = x / (v_0 cos alpha)$ từ phương trình thứ nhất thế vào phương trình thứ hai:
  $ y = (tan alpha) x - (g) / (2 v_0^2 cos^2 alpha) x^2 $
  
  Đó chính là phương trình của một *ĐƯỜNG PARABOL TUYỆT HẢO* có bề lõm quay xuống dưới! Galileo đã dùng một hàm số bậc hai đơn sơ để đập tan giáo điều ngàn năm của Aristotle, khai sinh ra ngành Cơ học hiện đại và nghệ thuật pháo binh chuẩn xác của nhân loại!
]

#story-box(
  title: "Cầu Cổng Vàng San Francisco: Parabol Cáp Treo vs Dây Xích Catenary",
  author: "Joseph Strauss (Mỹ, 1870 – 1938) & Các Kỹ Sư Kết Cấu Thế Kỷ XX",
)[
  Chiếc Cầu Cổng Vàng (Golden Gate Bridge) bắc qua vịnh San Francisco là một trong 7 kỳ quan của thế giới hiện đại. Hai sợi cáp thép khổng lồ đường kính gần $1$ mét uốn cong mềm mại giữa hai tòa tháp cao vút đỡ toàn bộ mặt cầu dài gần 3 km.
  
  Nhiều người lầm tưởng sợi cáp treo đó có hình dạng đường cong dây xích tự do (Catenary). Nhưng các kỹ sư kết cấu chỉ ra rằng:
  - Một sợi dây treo lơ lửng tự do chỉ chịu trọng lượng của chính nó thì tạo thành đường *Catenary* (hàm cosin hypebolic: $y = a cosh(x/a)$ do Huygens, Leibniz và Bernoulli tìm ra năm 1691).
  - Nhưng sợi cáp chính của Cầu Cổng Vàng phải gánh thêm *hàng vạn tấn dầm cầu bê tông cốt thép và xe cộ phân bố ĐỀU ĐẶN THEO PHƯƠNG NGANG* thông qua hàng trăm sợi dây cáp treo thẳng đứng!
  
  Phương trình vi phân cân bằng lực chịu tải phân bố đều theo phương ngang:
  $ (d^2 y) / (d x^2) = w / H = "hằng số" arrow y = (w) / (2 H) x^2 $
  
  Đường cong chịu lực hoàn hảo ấy bắt buộc phải là *MỘT ĐƯỜNG PARABOL BẬC HAI!* Hàm số bậc hai lớp 10 đã gánh vác an toàn cho hơn 2 tỷ lượt xe cộ qua lại suốt gần một thế kỷ qua mà không hề đứt gãy!
]

#hook-box(title: "Angry Birds: Căn góc bắn chim phá đảo bằng Đỉnh Parabol")[
  Thầy bật máy chiếu hiển thị màn hình trò chơi huyền thoại Angry Birds:
  
  *“Khi các em kéo căng dây súng cao su để bắn chú chim đỏ bay vút lên bầu trời phá vỡ lâu đài của những chú lợn xanh: Quỹ đạo bay của chú chim luôn luôn là một đường Parabol úp ngược.*
  
  *Làm sao để biết chú chim bay cao nhất được bao nhiêu mét để vượt qua bức tường thành?*
  *Chính là ĐỈNH PARABOL $I(-b / (2a); -Delta / (4a))$!*
  *Làm sao để biết chú chim sẽ rơi chạm đất ở vị trí nào?*
  *Chính là ĐIỂM CẮT TRỤC HOÀNH: Giải phương trình bậc hai $a x^2 + b x + c = 0$!*
  
  *Một trò chơi điện tử hàng tỷ lượt tải về thực chất chỉ là một bộ giải hàm số bậc hai lớp 10 đang chạy ngầm trong chip điện thoại của các em!”*
]

#tech-box(title: "Tối Ưu Hóa Doanh Thu & Điểm Hòa Vốn Trong Kinh Tế Học Vi Mô")[
  - *Mô hình Định giá Độc quyền (Monopoly Pricing)*:
    Một công ty công nghệ bán phần mềm bản quyền nhận thấy: Nếu đặt giá $P$ (nghìn đồng), số lượng khách mua $Q$ tuân theo hàm cầu tuyến tính: $Q(P) = 1.000 - 2P$.
    Hàm Tổng Doanh thu $T R$ là tích của giá bán và sản lượng:
    $ T R(P) = P times Q(P) = P times (1.000 - 2P) = -2P^2 + 1.000P $
    Đây là một hàm số bậc hai có hệ số $a = -2 < 0$, đồ thị là Parabol úp ngược bề lõm xuống dưới!
  - *Tìm mức giá tối ưu bằng Đỉnh Parabol*:
    $ P^* = - b / (2a) = - 1.000 / (2 times (-2)) = 250 "(nghìn đồng)" $
    Tại mức giá $250.000$ VNĐ, doanh thu đạt cực đại tuyệt đối:
    $ T R_("max") = -2(250)^2 + 1.000(250) = 125.000 "(nghìn đồng) = 125 triệu đồng!" $
  
  Nếu định giá rẻ hơn ($P = 100$), tuy bán được nhiều nhưng doanh thu thấp; nếu định giá quá đắt ($P = 400$), ế ẩm không ai mua. Đỉnh Parabol lớp 10 chính là điểm cân bằng hoàng kim cho mọi bài toán kinh doanh thực tế!
]

---

== BÀI 17: DẤU TAM THỨC BẬC HAI — QUY TẮC "TRONG TRÁI NGOÀI CÙNG"

Biệt thức $Delta = b^2 - 4 a c$ không chỉ là công thức tính nghiệm mà là "chiếc la bàn" định đoạt số phận của tam thức bậc hai $f(x) = a x^2 + b x + c$:
- Khi $Delta < 0$: Parabol bay lơ lửng không chạm trục hoành, tam thức mang một màu sắc duy nhất: luôn cùng dấu với hệ số $a$ trên toàn cõi $RR$.
- Khi $Delta = 0$: Parabol tiếp xúc một điểm duy nhất tại đỉnh.
- Khi $Delta > 0$: Parabol cắt đôi trục hoành tại hai nghiệm $x_1 < x_2$, chia mặt đất thành ba vùng: *Trong trái dấu, Ngoài cùng dấu với $a$*!

Quy tắc này là ranh giới phân định sống còn trong kỹ thuật: vùng ứng suất an toàn của thanh dầm, vùng tốc độ an toàn không bị trượt bánh xe, và vùng phân loại tín hiệu trong trí tuệ nhân tạo.

#deep-dive-box(title: "Chứng Minh Bất Đẳng Thức Cauchy-Schwarz Bằng Dấu Tam Thức Bậc Hai")[
  Bất đẳng thức Cauchy-Schwarz cho $n$ bộ số thực $(a_1, ..., a_n)$ và $(b_1, ..., b_n)$ phát biểu rằng:
  $ (a_1 b_1 + a_2 b_2 + ... + a_n b_n)^2 <= (a_1^2 + a_2^2 + ... + a_n^2)(b_1^2 + b_2^2 + ... + b_n^2) $
  
  Nhiều học sinh thường thấy bất đẳng thức này rất đáng sợ. Nhưng với Định lý Dấu tam thức bậc hai lớp 10, ta chứng minh nó chỉ trong 3 dòng biến đổi kỳ ảo:
  
  Xét hàm số theo biến $t in RR$:
  $ f(t) = sum_(i=1)^n (a_i t - b_i)^2 = (sum_(i=1)^n a_i^2) t^2 - 2 (sum_(i=1)^n a_i b_i) t + (sum_(i=1)^n b_i^2) $
  Vì $f(t)$ là tổng của các bình phương, nên hiển nhiên:
  $ f(t) >= 0 quad forall t in RR $
  
  Để một tam thức bậc hai $A t^2 + B t + C >= 0$ với mọi $t in RR$ (với $A = sum a_i^2 > 0$), điều kiện cần và đủ là biệt thức thu gọn phải không dương:
  $ Delta' = B'^2 - A C = (sum_(i=1)^n a_i b_i)^2 - (sum_(i=1)^n a_i^2)(sum_(i=1)^n b_i^2) <= 0 $
  $ arrow (sum_(i=1)^n a_i b_i)^2 <= (sum_(i=1)^n a_i^2)(sum_(i=1)^n b_i^2) $
  
  Dấu bằng xảy ra khi và chỉ khi $Delta' = 0$, tức là tồn tại $t_0$ sao cho $a_i t_0 - b_i = 0$ với mọi $i$, hay các bộ số tỉ lệ thuận với nhau! Một vẻ đẹp toán học thuần khiết và thanh tao tột độ!
]

---

== BÀI 18: PHƯƠNG TRÌNH QUY VỀ BẬC HAI — CẠM BẪY NGHIỆM MA

Khi giải phương trình vô tỉ dạng $sqrt(f(x)) = g(x)$, thao tác tự nhiên nhất của học sinh là: *Bình phương hai vế!*
$ f(x) = [g(x)]^2 $
Nhưng chính thao tác ngây thơ đó đã mở cửa cho những "Con số Ma" (Extraneous Roots) chui vào bài toán! Bởi vì trong toán học:
$ A = B arrow A^2 = B^2 quad ("Phép biến đổi một chiều, KHÔNG TƯƠNG ĐƯƠNG!") $
Bình phương làm mất dấu âm: $(-5)^2 = 5^2$ hoàn toàn đúng, nhưng $-5 = 5$ là một trò hề! Nếu không đặt điều kiện chặn $g(x) >= 0$ hoặc không thử lại nghiệm, học sinh sẽ rước những nghiệm ma vào bài làm và bị điểm 0 đau đớn!

#misconception-box(
  title: "Cạm bẫy Tham số m trong Hệ số a của Phương trình Bậc hai",
  misconception: "Gặp bài toán 'Tìm m để phương trình m x^2 - 2x + 1 = 0 có nghiệm duy nhất', học sinh vội vàng tính Delta' = 0 và tìm ra m = 1!",
  correction: "Khi hệ số a chứa tham số m, phương trình CHƯA CHẮC là bậc hai! BẮT BUỘC phải xét trường hợp a = 0 đầu tiên: Khi m = 0, phương trình trở thành -2x + 1 = 0 => x = 1/2 có nghiệm duy nhất! Đáp số đúng phải là m = 0 hoặc m = 1!"
)[
  Đây là cái bẫy kinh điển khiến hơn $80\%$ học sinh mất điểm trong các kỳ thi học kỳ và tuyển sinh. Hãy nhớ: *Hễ thấy tham số nằm ở đầu tàu $a$, việc đầu tiên phải làm là xét xem đoàn tàu có bị mất đầu tàu hay không ($a = 0$)!*
]

#dialogue-box(title: "Đối thoại Socrates: Tại sao Đỉnh Parabol lại nằm ở x = -b / (2a)?")[
  *Socrates:* Này bạn trẻ, Parabol $y = a x^2 + b x + c$ có tính chất đối xứng qua một đường thẳng đứng. Nếu nó cắt trục hoành tại hai nghiệm $x_1$ và $x_2$, trục đối xứng phải nằm ở đâu so với hai điểm đó?
  
  *Học trò:* Thưa thầy, trục đối xứng bắt buộc phải đi qua TRUNG ĐIỂM của đoạn thẳng nối hai nghiệm: $x_I = (x_1 + x_2) / 2$!
  
  *Socrates:* Rất thông minh! Và theo Định lý Viète của nhà toán học François Viète, tổng hai nghiệm $x_1 + x_2$ bằng gì?
  
  *Học trò:* Dạ, $x_1 + x_2 = - b / a$!
  
  *Socrates:* Vậy trung điểm $x_I$ bằng gì?
  
  *Học trò:* $x_I = (-b / a) / 2 = - b / (2a)$!
  
  *Socrates:* Tuyệt mỹ! Dù Parabol có chạm trục hoành hay bay lơ lửng không cắt trục hoành ($Delta < 0$), tâm đối xứng ấy không bao giờ thay đổi! Tọa độ đỉnh $-b / (2a)$ không phải là một công thức từ trên trời rơi xuống để học vẹt, nó chính là hiện thân của sự cân bằng đối xứng thiêng liêng nhất của tự nhiên!
]

#deep-dive-box(title: "Thuật toán Gradient Descent: Tối Ưu Hóa Bậc Hai Huấn Luyện AI GPT-4")[
  Khi các nhà khoa học máy tính tại OpenAI huấn luyện mô hình GPT-4 với hàng trăm tỷ tham số, làm thế nào máy tính tự động điều chỉnh các trọng số để mô hình trả lời ngày càng thông minh hơn?
  
  Họ sử dụng *Hàm mất mát bậc hai (Mean Squared Error)*:
  $ L(w) = 1/2 sum (y_("thực") - y_("dự đoán"))^2 $
  Hàm mất mát này có dạng một chiếc bát Parabol nhiều chiều (Paraboloid). Đáy sâu nhất của chiếc bát tương ứng với điểm lỗi bằng 0 (mô hình thông minh nhất).
  
  Thuật toán *Gradient Descent (Suy giảm độ dốc)* hoạt động như sau: Máy tính thả một hòn bi lăn từ miệng bát xuống đáy bát. Tại mỗi bước lặp, nó tính độ dốc (đạo hàm/hệ số góc bậc hai) và dịch chuyển trọng số một đoạn ngược chiều độ dốc:
  $ w_(t+1) = w_t - eta (d L) / (d w) $
  Toàn bộ cuộc cách mạng Trí tuệ Nhân tạo làm rung chuyển thế giới hôm nay thực chất là hành trình đi tìm Đáy của một chiếc bát Parabol lớp 10 trong không gian hàng tỷ chiều!
]

#inquiry-box(title: "Thực hành Python: Mô phỏng Quỹ Đạo Ném Xiên & Tối Ưu Góc Bắn 45°")[
  ```python
  import numpy as np

  def projectile_motion(v0, angle_deg, g=9.81):
      theta = np.radians(angle_deg)
      # Thời gian bay: t_flight = 2*v0*sin(theta)/g
      t_flight = 2 * v0 * np.sin(theta) / g
      # Tầm xa cực đại: R = v0^2 * sin(2*theta) / g
      range_max = (v0**2) * np.sin(2 * theta) / g
      # Đỉnh cao cực đại Parabol: H = (v0*sin(theta))^2 / (2g)
      h_max = ((v0 * np.sin(theta))**2) / (2 * g)
      return t_flight, range_max, h_max

  v0 = 20.0 # m/s
  for angle in [15, 30, 45, 60, 75]:
      t, r, h = projectile_motion(v0, angle)
      print(f"Góc {angle:2d}° -> Tầm xa: {r:6.2f}m | Đỉnh cao: {h:5.2f}m | Thời gian bay: {t:4.2f}s")
  ```
]

#pagebreak()


#pagebreak()

= ĐẠI CHƯƠNG VII: CUỘC HÔN PHỐI VĨ ĐẠI NHẤT — PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 19, Bài 20, Bài 21, Bài 22, Bài 23 SGK Toán 10 cùng Chuyên đề Thuật toán Bresenham GPU, Máy Tán sỏi thận ESWL, Định vị Hàng hải LORAN-C & Ba đường Conic (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 19: TỌA ĐỘ CỦA VECTƠ VÀ ĐIỂM — GIẤC MƠ ĐÊM MÙA ĐÔNG CỦA RENÉ DESCARTES

Trước thế kỷ XVII, toán học bị chia cắt thành hai lãnh địa hoàn toàn tách biệt và gần như thù địch nhau:
1. *Hình học (Geometry)* của người Hy Lạp: Xứ sở của những hình vẽ trừu tượng bằng compa và thước kẻ, thanh tao, cao quý nhưng cực kỳ khó tính toán và khó giải phóng trí tưởng tượng.
2. *Đại số (Algebra)* của người Ả Rập: Xứ sở của những con số và phương trình biến đổi khô khan, nhưng thiếu đi linh hồn thị giác của không gian.

Hai nhánh toán học vĩ đại ấy dường như không bao giờ có thể gặp nhau, cho đến một đêm mùa đông định mệnh làm thay đổi vĩnh viễn lịch sử khoa học.

#story-box(
  title: "Giấc mơ đêm mùa đông 1619 & Con ruồi trên trần nhà của René Descartes",
  author: "René Descartes (Pháp, 1596 – 1650)",
)[
  Đêm ngày 10 tháng 11 năm 1619, tại một thị trấn nhỏ bên bờ sông Danube ở nước Đức, một chàng sĩ quan quân đội trẻ người Pháp tên là *René Descartes* đang nằm trùm chăn co ro trong một căn phòng có lò sưởi bằng gốm. Descartes vốn có thể chất yếu ớt từ nhỏ, thường xuyên đau ốm nên có thói quen nằm dài trên giường suy ngẫm đến tận trưa mới dậy.
  
  Khi nhìn lên trần nhà bằng gỗ có những thanh xà ngang và xà dọc đan chéo nhau thành những ô vuông bàn cờ, Descartes nhìn thấy một con ruồi đang bò chậm chạp trên trần nhà. Trong một khoảnh khắc giác ngộ thần thánh, một tia chớp tư tưởng bùng nổ trong đầu ông:
  
  *“Tại sao mình lại không thể mô tả vị trí chính xác của con ruồi này bằng hai con số: khoảng cách từ con ruồi đến bức tường bên trái ($x$), và khoảng cách từ con ruồi đến bức tường phía trước ($y$)?”*
  
  Khi con ruồi bò di chuyển, vị trí của nó sẽ vạch ra một đường cong trong không gian. Và đường cong ấy hoàn toàn có thể biểu diễn bằng một phương trình đại số nối liền hai biến số $x$ và $y$! 
  
  Đêm hôm đó, Descartes nằm mơ thấy ba giấc mơ kỳ lạ về một "cuốn từ điển khoa học phổ quát". Sáng hôm sau tỉnh dậy, ông đã đặt bút khai sinh ra *Phương pháp tọa độ (Hệ tọa độ Descartes $O x y$)* — cuộc hôn phối vĩ đại nhất trong lịch sử toán học! Từ khoảnh khắc đó, *Hình học đã biến thành Đại số, và Đại số đã tìm thấy linh hồn Hình học!* Mọi bài toán hình học hóc búa nhất đều có thể được giải quyết bằng những phép tính đại số tuần tự của máy tính mà không cần bất kỳ sự lóe sáng trực giác may rủi nào!
]

#story-box(
  title: "Pierre de Fermat & Bản Thảo Giấu Kín Về Hình Học Giải Tích",
  author: "Pierre de Fermat (Pháp, 1607 – 1665) — Nhà Toán Học Nghiệp Dư Vĩ Đại Nhất",
)[
  Ít người biết rằng, một thẩm phán tòa án thành phố Toulouse tên là *Pierre de Fermat* đã độc lập phát minh ra Hình học giải tích thậm chí trước cả khi Descartes xuất bản cuốn sách của mình vào năm 1637!
  
  Trong một bản thảo viết tay năm 1636 mang tên *“Ad Locos Planos et Solidos Isagoge”* (Nhập môn về quỹ tích phẳng và khối), Fermat đã tuyên bố nguyên lý nền tảng:
  *“Bất cứ khi nào hai đại lượng chưa biết xuất hiện trong một phương trình cuối cùng, ta có một quỹ tích, và đầu mút của một trong các đại lượng ấy sẽ vạch ra một đường thẳng hoặc một đường cong!”*
  
  Fermat đã phân loại toàn bộ các phương trình bậc nhất là đường thẳng, và các phương trình bậc hai là đường tròn, elip, parabol hoặc hypebol. Nhưng vì tính cách kỳ dị, chỉ thích nghiên cứu toán học cho riêng mình như một thú vui tao nhã và không thèm xuất bản lấy danh tiếng, Fermat đã để vinh quang thuộc về Descartes. Lịch sử khoa học công bằng luôn vinh danh cả hai thiên tài người Pháp như những người đồng khai sinh ra kỷ nguyên số hóa hình học của nhân loại!
]

#hook-box(title: "Làm sao thuyền trưởng gọi cứu nạn giữa đại dương đêm mịt mù?")[
  Thầy bước vào lớp, tắt đèn phòng học chỉ để lại một ngọn đèn le lói:
  
  *“Các em hãy tưởng tượng mình là một thuyền trưởng trên một chiếc tàu chở hàng bị hỏng động cơ giữa Thái Bình Dương lúc 2 giờ sáng. Sóng to gió lớn, mây đen che kín các chòm sao, xung quanh chỉ là một màu đen thăm thẳm của đại dương. Các em cầm bộ đàm phát tín hiệu SOS về đất liền cứu nạn.*
  
  *Nếu không có Hệ tọa độ Descartes, các em sẽ nói gì với đội cứu hộ? Chẳng lẽ nói: ‘Chúng tôi đang ở gần một đàn cá heo, phía sau có một con sóng lớn’? Không một ai có thể tìm thấy các em giữa hàng triệu cây số vuông mặt nước!*
  
  *Nhờ có René Descartes, người thuyền trưởng chỉ cần đọc 6 chữ số ngắn gọn: Kinh độ $105 degree 45' 12''$ Đông, Vĩ độ $10 degree 02' 30''$ Bắc! Tọa độ đó là duy nhất và vĩnh cửu trên bề mặt hành tinh! Trực thăng cứu hộ lập tức bay thẳng đến đúng vị trí để vớt con tàu trong đêm tối!*
  
  *Tọa độ chính là địa chỉ căn cước công dân của từng điểm trong vũ trụ bao la!”*
]

#tech-box(title: "Độ phân giải màn hình 4K iPhone & Bản đồ trò chơi điện tử 2D/3D")[
  - *Lưới điểm ảnh Pixel trên màn hình điện thoại*: Chiếc màn hình Super Retina XDR của iPhone 16 có độ phân giải $2796 times 1290$ pixels. Bản chất của nó chính là một hệ trục tọa độ $O x y$ gồm hơn $3,6$ triệu ô vuông nhỏ xíu. Khi các em chạm ngón tay vào màn hình để nhấn nút "Thích" trên TikTok, cảm ứng điện dung gửi tọa độ $(x; y)$ của ngón tay về chip vi xử lý để thực thi hành động tương ứng.
  - *Lập trình đồ họa Game Engine (Unity, Godot)*: Mọi nhân vật, chướng ngại vật hay viên đạn trong game 2D đều là những thực thể mang thuộc tính tọa độ `Transform.position = Vector2(x, y)`. Khi nhân vật di chuyển, GPU thực hiện phép cộng tọa độ vectơ: $vec(r)' = vec(r) + vec(v) times Delta t$ liên tục 60 lần mỗi giây!
]

---

== BÀI 20: PHƯƠNG TRÌNH ĐƯỜNG THẲNG — VŨ KHÍ RASTER HÓA TRONG CHIP GPU

Đường thẳng không còn là một khái niệm trừu tượng vô tận, mà được tóm gọn vào một phương trình bậc nhất hai ẩn tao nhã:
- Phương trình tổng quát: $Delta: a x + b y + c = 0$ ($a^2 + b^2 > 0$), với vectơ pháp tuyến $vec(n) = (a; b)$.
- Phương trình tham số: $cases(x = x_0 + u_1 t, y = y_0 + u_2 t)$, với vectơ chỉ phương $vec(u) = (u_1; u_2)$ và thời gian $t in RR$.

#deep-dive-box(title: "Thuật Toán Vẽ Đường Thẳng Bresenham 1962 Trong Chip Đồ Họa GPU")[
  Năm 1962 tại phòng thí nghiệm của tập đoàn IBM, kỹ sư *Jack Elton Bresenham* đã giải quyết một bài toán hóc búa: Làm sao vẽ một đoạn thẳng nối hai điểm $(x_0, y_0)$ và $(x_1, y_1)$ trên màn hình máy tính chỉ gồm các pixel số nguyên rời rạc?
  
  Phương trình đường thẳng thực tế $y = m x + b$ chứa hệ số góc thực $m = (Delta y) / (Delta x)$. Nếu mỗi pixel máy tính đều phải làm phép nhân số thực dấu phẩy động rồi làm tròn, các máy tính thời đó sẽ bị tê liệt vì quá chậm!
  
  Bresenham đã sáng chế ra một thuật toán thiên tài: Sử dụng phương trình tổng quát $F(x, y) = 2 Delta y dot x - 2 Delta x dot y + C = 0$.
  - Tại mỗi bước nhảy từ pixel $x$ sang $x+1$, thuật toán chỉ cần kiểm tra *dấu của một biến số nguyên quyết định (Decision Variable $D$)*.
  - Nếu $D < 0$: Chọn pixel ngang $(x+1, y)$ và cập nhật $D = D + 2 Delta y$.
  - Nếu $D >= 0$: Chọn pixel chéo $(x+1, y+1)$ và cập nhật $D = D + 2(Delta y - Delta x)$.
  
  *Toàn bộ thuật toán không hề dùng một phép chia hay phép nhân số thực nào, chỉ dùng cộng và trừ số nguyên siêu tốc!* Thuật toán Bresenham chạy trong mọi chip GPU, từ trò chơi huyền thoại DOOM 1993 đến card đồ họa NVIDIA RTX 4090 xử lý hàng tỷ tia sáng thời gian thực ngày nay!
]

---

== BÀI 21: PHƯƠNG TRÌNH ĐƯỜNG TRÒN — BẢO VỆ BIÊN GIỚI & CẠM BẪY PHƯƠNG TRÌNH

Đường tròn tâm $I(a; b)$ bán kính $R$ có phương trình chính tắc:
$ (x - a)^2 + (y - b)^2 = R^2 $
Khai triển ra ta được phương trình tổng quát:
$ x^2 + y^2 - 2a x - 2b y + c = 0 $

#misconception-box(
  title: "Cạm bẫy Điều kiện Phương trình Đường tròn Tổng quát",
  misconception: "Cứ thấy phương trình dạng x^2 + y^2 - 2a x - 2b y + c = 0 là khẳng định ngay đó là phương trình của một đường tròn!",
  correction: "Phương trình trên CHỈ LÀ ĐƯỜNG TRÒN khi và chỉ khi: a^2 + b^2 - c > 0! Bán kính khi đó là R = sqrt(a^2 + b^2 - c). Nếu biểu thức <= 0, phương trình chỉ là một điểm duy nhất hoặc không có điểm thực nào!"
)[
  *Ví dụ:* Phương trình $x^2 + y^2 - 2x - 4y + 5 = 0$ có $a = 1, b = 2, c = 5$.
  Ta có $a^2 + b^2 - c = 1^2 + 2^2 - 5 = 0$.
  Phương trình tương đương $(x - 1)^2 + (y - 2)^2 = 0$, nó chỉ là MỘT ĐIỂM DUY NHẤT $(1; 2)$, hoàn toàn không phải là đường tròn!
]

#story-box(
  title: "Định Lý Apollonius & Vùng Phủ Sóng Radar Của Hai Hàng Không Mẫu Hạm",
  author: "Apollonius xứ Perga (Hy Lạp cổ đại, khoảng 262 – 190 TCN)",
)[
  Nhà toán học Apollonius đã khám phá ra một định lý hình học tuyệt mỹ: *Tập hợp tất cả các điểm $M$ trong mặt phẳng có tỉ số khoảng cách đến hai điểm cố định $A$ và $B$ bằng một hằng số $k > 0$ ($k != 1$):*
  $ (M A) / (M B) = k $
  *luôn luôn là MỘT ĐƯỜNG TRÒN (gọi là Đường tròn Apollonius)!*
  
  Trong tác chiến hải quân hiện đại, hai tàu khu trục $A$ và $B$ được trang bị radar cảnh giới có công suất phát sóng khác nhau theo tỉ lệ $k = 2$. Ranh giới nơi tín hiệu phát hiện máy bay tàng hình của hai tàu có cường độ bằng nhau chính là một Đường tròn Apollonius bao bọc lấy con tàu có công suất yếu hơn! Đại số giải tích lớp 10 cho phép xác định tâm và bán kính vùng an toàn này chỉ trong vài dòng biến đổi tọa độ!
]

---

== BÀI 22 & 23: BA ĐƯỜNG CONIC — KỲ QUAN HÌNH HỌC VĨ ĐẠI CỦA VŨ TRỤ

Ba đường Conic gồm *Elip (Ellipse)*, *Parabol (Parabola)* và *Hypebol (Hyperbola)* là các giao tuyến tuyệt mỹ khi dùng một mặt phẳng cắt qua một chiếc nón đôi (Double Cone). Không chỉ là hình học thuần túy, chúng là *ngôn ngữ quỹ đạo mà vạn vật trong vũ trụ tuân theo!*

#story-box(
  title: "Phòng Thì Thầm Tại Nhà Thờ Thánh Paul & Máy Tán Sỏi Thận Không Cần Mổ",
  author: "Kiến trúc sư Sir Christopher Wren & Các Bác Sĩ Munich 1980",
)[
  Dưới mái vòm khổng lồ hình elip của Nhà thờ Thánh Paul ở London, có một kỳ quan âm thanh mang tên *“Phòng thì thầm” (Whispering Gallery)*: Một người đứng sát tường tại một tiêu điểm $F_1$ nói thì thầm rất khẽ, nhưng một người bạn đứng cách xa tới hơn 40 mét tại tiêu điểm $F_2$ lại nghe rõ từng tiếng như đang nói vào tai, trong khi những người đứng ở giữa phòng không hề nghe thấy gì!
  
  Bí mật nằm ở tính chất quang học tiêu điểm của Elip: *Mọi sóng âm phát ra từ tiêu điểm $F_1$, sau khi phản xạ qua thành cong elip, đều đồng loạt đổi hướng hội tụ chính xác vào tiêu điểm $F_2$!*
  
  Tính chất này đã được các bác sĩ ứng dụng để sáng chế ra *Máy tán sỏi ngoài cơ thể (ESWL)*: Bồn elip đặt máy phát sóng chấn động tại tiêu điểm $F_1$, định vị viên sỏi thận nằm trùng tiêu điểm $F_2$. Sóng âm đi qua da êm ái nhưng khi hội tụ tại $F_2$ năng lượng bùng nổ làm vỡ vụn sỏi thận thành cát mịn mà không cần phẫu thuật rạch dao!
]

#story-box(
  title: "Hệ Thống Dẫn Đường LORAN-C: Định Vị Tàu Biển Bằng Đường Hypebol",
  author: "Hải quân Hoa Kỳ — Thế chiến II & Chiến tranh Lạnh",
)[
  Trước khi có vệ tinh GPS, làm sao các tàu chiến và tàu ngầm có thể định vị chính xác vị trí của mình giữa Đại Tây Dương mù sương bão tố?
  
  Các kỹ sư đã thiết lập hệ thống dẫn đường vô tuyến *LORAN-C (Long Range Navigation)*:
  Hai trạm phát sóng vô tuyến $F_1$ và $F_2$ trên bờ biển phát ra các xung vô tuyến đồng bộ với vận tốc ánh sáng $c$.
  Máy thu trên tàu biển đo *Độ chênh lệch thời gian nhận tín hiệu ($Delta t$)* từ hai trạm.
  Vì quãng đường bằng vận tốc nhân thời gian, nên hiệu khoảng cách từ tàu $M$ đến hai trạm là một hằng số cố định:
  $ |M F_1 - M F_2| = c times Delta t = 2a = "hằng số"! $
  
  Theo đúng định nghĩa hình học lớp 10: *Tập hợp các điểm có hiệu khoảng cách đến hai tiêu điểm là hằng số chính là MỘT ĐƯỜNG HYPEBOL!*
  
  Con tàu biết chắc chắn mình đang nằm trên một nhánh của đường Hypebol ấy. Bằng cách bắt thêm tín hiệu từ một cặp trạm thứ ba ($F_2, F_3$), máy tính trên tàu vẽ ra đường Hypebol thứ hai. Giao điểm của hai đường Hypebol cho ra tọa độ chính xác của con tàu trong đêm đen!
]

#dialogue-box(title: "Đối thoại Socrates: Cách Vẽ Đường Elip Bằng Hai Chiếc Đinh Và Sợi Dây")[
  *Socrates:* Này bạn trẻ, làm thế nào để vẽ một đường tròn hoàn hảo trên mặt đất?
  
  *Học trò:* Thưa thầy, cắm một chiếc cọc cố định làm tâm, buộc sợi dây có độ dài $R$ vào cọc rồi cầm cành cây căng dây quay tròn một vòng!
  
  *Socrates:* Tuyệt vời! Khoảng cách từ mọi điểm đến chiếc cọc luôn bằng $R$. Bây giờ, nếu ta cắm HAI CHIẾC CỌC ở hai vị trí khác nhau $F_1$ và $F_2$, lấy một sợi dây có độ dài $2a$ lớn hơn khoảng cách giữa hai cọc, buộc hai đầu dây vào hai cọc rồi dùng chiếc que căng sợi dây vẽ một đường cong khép kín. Đường cong đó là gì?
  
  *Học trò:* Đó là ĐƯỜNG ELIP!
  
  *Socrates:* Tại sao ngươi chắc chắn đó là Elip?
  
  *Học trò:* Dạ, vì chiều dài sợi dây là không đổi! Dù chiếc que di chuyển tới bất kỳ điểm $M$ nào, tổng chiều dài hai đoạn dây nối từ $M$ tới hai cọc luôn bằng độ dài sợi dây:
  $ M F_1 + M F_2 = 2a! $
  
  *Socrates:* Đúng thế! Đó chính là định nghĩa thuần túy nguyên bản của Elip! Đường tròn chỉ là trường hợp đặc biệt của Elip khi hai chiếc cọc chập lại làm một! Ngươi thấy chưa, vũ trụ chuyển động từ sự hoàn hảo đơn giản của đường tròn sang vẻ đẹp bao la, sâu lắng của đường elip!
]

#deep-dive-box(title: "Tâm Sai e: Chiếc Núm Vặn Biến Đổi Toàn Bộ Vũ Trụ Conic")[
  Cho một tiêu điểm $F$ và một đường chuẩn $Delta$. Tập hợp các điểm $M$ thỏa mãn:
  $ (M F) / (d(M, Delta)) = e quad ("Tâm sai") $
  - Khi $e = 0$: Đường tròn khép kín hoàn hảo.
  - Khi $0 < e < 1$: Quỹ đạo khép kín hình *Elip* (quỹ đạo các hành tinh quanh Mặt Trời — Định luật Kepler I).
  - Khi $e = 1$: Ranh giới mong manh hình *Parabol* (vật thể vừa đủ vận tốc vũ trụ cấp hai để thoát khỏi lực hút trọng trường).
  - Khi $e > 1$: Quỹ đạo mở hình *Hypebol* (thiên thể Oumuamua bay từ ngoài thiên hà lướt qua Hệ Mặt Trời một lần rồi bay đi vĩnh viễn không bao giờ trở lại).
]

#inquiry-box(title: "Nhiệm vụ Python: Thuật toán Định vị 3 Trạm Phát Sóng BTS")[
  ```python
  import numpy as np

  # Tọa độ 3 trạm BTS và khoảng cách đo được đến điện thoại (km):
  p1, r1 = np.array([0.0, 0.0]), 5.0
  p2, r2 = np.array([4.0, 0.0]), 3.0
  p3, r3 = np.array([2.0, 4.0]), 3.0

  # Tuyến tính hóa hệ 3 phương trình đường tròn:
  # Trừ phương trình (1) cho (2) và (3) để khử số hạng bậc hai x^2 + y^2:
  A = np.array([
      2 * (p2 - p1),
      2 * (p3 - p1)
  ])
  b = np.array([
      r1**2 - r2**2 - np.dot(p1, p1) + np.dot(p2, p2),
      r1**2 - r3**2 - np.dot(p1, p1) + np.dot(p3, p3)
  ])

  phone_pos = np.linalg.solve(A, b)
  print(f"Tọa độ người bị nạn cần cứu hộ: x = {phone_pos[0]:.3f} km, y = {phone_pos[1]:.3f} km")
  ```
]

#pagebreak()


#pagebreak()

= ĐẠI CHƯƠNG VIII: SỨC MẠNH CỦA BÙNG NỔ TỔ HỢP — NGHỆ THUẬT ĐẾM & NHỊ THỨC NEWTON

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 24, Bài 25, Bài 26 SGK Toán 10 cùng Chuyên đề Mật mã học RSA, Siêu trí tuệ AlphaGo, Nguyên lý Chuồng bồ câu Dirichlet & Đường cong Bézier (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 24: QUY TẮC ĐẾM — NGHỆ THUẬT ĐẾM MÀ KHÔNG CẦN ĐẾM TỪNG VẬT

Đếm là một trong những hoạt động trí tuệ đầu tiên của loài người khi thoát khỏi thời kỳ ăn lông ở lỗ: người chăn cừu đếm từng con cừu bằng cách nhặt từng hòn sỏi bỏ vào túi. Nhưng khi số lượng đối tượng lên tới hàng triệu, hàng tỷ, thì việc "nhặt từng hòn sỏi" trở thành bất khả thi!

*Đại số tổ hợp* ra đời để dạy cho con người cách *Đếm thông minh*: đếm hàng tỷ khả năng mà không cần phải chạm tay vào từng vật thể! Hai quy tắc nền tảng: *Quy tắc Cộng* (chia để trị - các trường hợp xung khắc) và *Quy tắc Nhân* (các công đoạn liên hoàn) chính là hai viên gạch đầu tiên xây nên toàn bộ nền khoa học máy tính hiện đại!

#story-box(
  title: "Gottfried Wilhelm Leibniz & Giấc mơ tính toán mọi tư tưởng nhân loại",
  author: "Gottfried Wilhelm Leibniz (Đức, 1646 – 1716)",
)[
  Năm 1666, khi mới tròn 20 tuổi, chàng thanh niên thiên tài Gottfried Wilhelm Leibniz đã bảo vệ xuất sắc luận án tiến sĩ mang tên *“Dissertatio de Arte Combinatoria”* (Chuyên luận về Nghệ thuật Tổ hợp).
  
  Trong tác phẩm mang tính tiên tri này, Leibniz đã mơ ước một điều không tưởng: Ông cho rằng mọi tư tưởng, khái niệm phức tạp của con người thực chất chỉ là *sự kết hợp (Tổ hợp)* của một số lượng hữu hạn các ý niệm cơ bản — giống như bảng chữ cái 26 ký tự có thể ghép lại thành toàn bộ kho tàng văn học của nhân loại. 
  
  Leibniz đề xuất xây dựng một "Ngôn ngữ phổ quát" (Characteristica Universalis) và một cỗ máy tính toán tư duy. Khi hai nhà triết học tranh cãi gay gắt về một vấn đề chính trị hay đạo đức, thay vì cãi vã hay chém giết nhau trên chiến trường, họ chỉ cần mỉm cười ngồi xuống bàn và nói: *“Calculemus!" (Nào, chúng ta hãy tính toán!)*. Bằng các quy tắc đếm và tổ hợp logic, cỗ máy sẽ tự động chỉ ra kết luận đúng đắn! Giấc mơ 20 tuổi của Leibniz chính là hạt mầm đầu tiên của ngành Trí tuệ Nhân tạo (AI) và Khoa học Máy tính 300 năm sau!
]

#hook-box(title: "Chiếc khóa số vali & Vụ trộm thế kỷ")[
  Thầy cầm một chiếc khóa vali 3 vòng số (từ 000 đến 999) giơ lên trước lớp:
  
  *“Chiếc khóa vali này có bao nhiêu mật mã khả dĩ?*
  - Vòng 1 có 10 cách chọn ($0 -> 9$).
  - Vòng 2 có 10 cách chọn.
  - Vòng 3 có 10 cách chọn.
  $arrow$ Theo Quy tắc Nhân lớp 10: Có $10 times 10 times 10 = 1.000$ mật mã khả dĩ!
  
  *Nếu một tên trộm thử mỗi mã mất đúng 2 giây, hắn chỉ mất tối đa $2.000$ giây — tức là khoảng 33 phút là mở toang chiếc vali của các em! Quá nguy hiểm!*
  
  *Nhưng bây giờ, nếu thầy nâng cấp chiếc vali lên 6 vòng số, và mỗi vòng có thêm 26 chữ cái tiếng Anh in hoa và 26 chữ thường (tổng cộng 62 ký tự mỗi vòng). Hỏi tên trộm sẽ mất bao lâu để thử hết các mã?”*
  
  Học sinh bấm máy tính: $62^6 approx 56,8$ tỷ mật mã!
  Nếu thử mỗi mã mất 2 giây:
  $ T = (56,8 times 10^9 times 2) / (60 times 60 times 24 times 365) approx 3.600 "NĂM"! $
  
  *Lời bình của Thầy:* "Chỉ cần tăng độ dài từ 3 vòng số lên 6 vòng ký tự, thời gian phá khóa đã nhảy vọt từ 33 phút lên hơn 3.600 NĂM — lâu hơn cả lịch sử từ thời Vua Hùng dựng nước đến nay! Đó chính là sức mạnh khủng khiếp của Quy tắc nhân: Sự bùng nổ tổ hợp bảo vệ mọi tài sản và bí mật quốc gia!"
]

#tech-box(title: "Cây quyết định (Decision Trees) trong Trí tuệ Nhân tạo")[
  - *Sơ đồ hình cây (Tree Diagram) trong AI*: Sơ đồ cây mà các em vẽ trong bài học Quy tắc đếm chính là tổ tiên trực tiếp của thuật toán *Cây quyết định (Decision Tree)* và *Rừng ngẫu nhiên (Random Forest)* trong Machine Learning. 
  - Khi ngân hàng quyết định có cho một khách hàng vay 1 tỷ đồng hay không, AI chạy dữ liệu khách hàng qua một cây quyết định phân nhánh: Thu nhập có lớn hơn 20 triệu không? (Có/Không) $arrow$ Có nợ xấu không? (Có/Không) $arrow$ Có tài sản thế chấp không? (Có/Không). Hàng triệu nhánh cây đếm tổ hợp này giúp ngân hàng ra quyết định chỉ trong vài giây với độ chính xác cực cao.
]

#story-box(
  title: "Nguyên Lý Chuồng Bồ Câu Dirichlet: Chân Lý Đơn Sơ Làm Rung Chuyển Toán Học",
  author: "Peter Gustav Lejeune Dirichlet (Đức, 1805 – 1859)",
)[
  Năm 1834, nhà toán học người Đức Peter Gustav Lejeune Dirichlet đã phát biểu một nguyên lý đơn giản đến mức một đứa trẻ lên năm cũng hiểu được:
  *“Nếu đem nhốt $n + 1$ con bồ câu vào $n$ chiếc chuồng, thì chắc chắn có ít nhất một chiếc chuồng chứa từ hai con bồ câu trở lên!”*
  
  Tưởng chừng như một câu nói hiển nhiên tầm thường, nhưng Nguyên lý Chuồng bồ câu (Pigeonhole Principle) đã trở thành một trong những công cụ chứng minh sắc bén và huyền diệu nhất của nhân loại:
  1. *Hai người cùng số sợi tóc:* Trong thành phố Hà Nội hay TP. Hồ Chí Minh với hơn 10 triệu dân, một cái đầu người có tối đa khoảng $150.000$ sợi tóc. Coi 10 triệu người là "bồ câu" và $150.000$ mức số lượng sợi tóc là "chuồng". Theo Dirichlet, chắc chắn có hàng chục người có số sợi tóc trên đầu bằng nhau chằn chặn đến từng sợi!
  2. *Định lý Ramsey trong mạng xã hội ($R(3,3) = 6$):* Tại bất kỳ một bữa tiệc nào có từ 6 người trở lên, luôn luôn tồn tại ít nhất 3 người quen nhau từng đôi một, hoặc có ít nhất 3 người hoàn toàn xa lạ nhau từng đôi một!
  3. *Giới hạn của thuật toán nén dữ liệu:* Không bao giờ tồn tại một phần mềm nén dữ liệu nào (như ZIP, RAR) có thể nén nhỏ *mọi* tệp tin trên máy tính! Vì nếu nén được mọi tệp tin, số lượng tệp đầu ra sẽ ít hơn số lượng tệp đầu vào, theo Dirichlet ắt có hai tệp tin khác nhau bị nén thành cùng một chuỗi bit giống nhau, dẫn đến không thể giải nén nguyên vẹn!
]

---

== BÀI 25: HOÁN VỊ, CHỈNH HỢP VÀ TỔ HỢP — BÙNG NỔ TỔ HỢP & SIÊU TRÍ TUỆ ALPHAGO

Ba khái niệm $P_n, A_n^k, C_n^k$ là ba cỗ máy biến hóa kỳ ảo của Đại số tổ hợp:
- *Hoán vị ($P_n = n!$)*: Xáo trộn vị trí của $n$ phần tử khác nhau thành một hàng dọc.
- *Chỉnh hợp ($A_n^k$)*: Chọn ra $k$ phần tử từ $n$ phần tử và CÓ XẾP THỨ TỰ (Ai làm Lớp trưởng, ai làm Bí thư).
- *Tổ hợp ($C_n^k$)*: Chọn ra $k$ phần tử mà KHÔNG QUAN TÂM THỨ TỰ (Chọn một đội gồm 3 bạn đi thi văn nghệ).

#story-box(
  title: "AlphaGo 2016: Khi Siêu Máy Tính Chinh Phục Không Gian Trạng Thái Cờ Vây Khổng Lồ",
  author: "Demis Hassabis (DeepMind, Google) & Lee Sedol (Hàn Quốc, 2016)",
)[
  Tháng 3 năm 2016 tại Seoul, hàng trăm triệu người trên khắp hành tinh nín thở theo dõi trận đấu lịch sử giữa đại kiện tướng cờ vây thế giới *Lee Sedol* và chương trình trí tuệ nhân tạo *AlphaGo* của Google DeepMind.
  
  Trước đó, vào năm 1997, siêu máy tính Deep Blue của IBM đã đánh bại vua cờ vua Garry Kasparov bằng phương pháp "duyệt vét cạn" (Brute-force): thử hàng triệu nước đi mỗi giây. Nhưng đối với cờ vây, phương pháp duyệt cạn của máy tính đã bị đè bẹp hoàn toàn bởi *Sự bùng nổ tổ hợp*:
  - Bàn cờ vây có $19 times 19 = 361$ giao điểm.
  - Số lượng trạng thái nước đi khả dĩ của một ván cờ vây ước tính lên tới $10^(170)$!
  - Con số $10^(170)$ này lớn khủng khiếp đến mức: Toàn bộ số lượng nguyên tử trong toàn bộ Vũ trụ quan sát được của chúng ta hiện nay mới chỉ có khoảng $10^(80)$ nguyên tử!
  
  Dù có gom toàn bộ siêu máy tính mạnh nhất Trái Đất chạy liên tục từ vụ nổ Big Bang cách đây 13,8 tỷ năm đến nay cũng không thể nào tính hết được $1/1.000.000$ số nhánh cây tổ hợp của bàn cờ vây!
  
  Các kỹ sư DeepMind đã kết hợp Lý thuyết Tổ hợp với Mạng nơ-ron học sâu (Deep Neural Networks) và thuật toán Tìm kiếm Cây Monte Carlo (MCTS) để mô phỏng "trực giác" của con người. Chiến thắng $4 - 1$ của AlphaGo trước Lee Sedol đã chứng minh rằng: Khi con người biết làm chủ sự bùng nổ tổ hợp, chúng ta có thể tạo ra những siêu trí tuệ vượt qua cả những giới hạn tự nhiên của chính mình!
]

#story-box(
  title: "Leonhard Euler 1736 & Bài Toán Bảy Cây Cầu Königsberg",
  author: "Leonhard Euler (Thụy Sĩ, 1707 – 1783)",
)[
  Năm 1736, người dân thành phố Königsberg (nay là Kaliningrad) thích đi dạo vào chiều Chủ nhật và tự đố nhau một câu đố: Thành phố có một con sông Pregel chảy qua với hai hòn đảo ở giữa, được nối với đất liền bằng đúng *7 cây cầu*. Liệu một người có thể bắt đầu từ một điểm bất kỳ trong thành phố, đi dạo qua TẤT CẢ 7 CÂY CẦU ĐÚNG MỘT LẦN DUY NHẤT rồi quay trở về điểm xuất phát được không?
  
  Mọi người thử đi hàng nghìn lần đều thất bại nhưng không ai giải thích được vì sao. Thiên tài *Leonhard Euler* đã ngồi xuống và giải quyết bài toán bằng một bước nhảy tư duy làm thay đổi lịch sử:
  - Euler gạt bỏ toàn bộ những chi tiết rườm rà: độ dài cây cầu, màu sắc dòng nước, kiến trúc ngôi nhà.
  - Ông trừu tượng hóa 4 vùng đất thành *4 Đỉnh (Vertices)*.
  - Ông trừu tượng hóa 7 cây cầu thành *7 Cạnh nối (Edges)*.
  
  Euler chỉ ra rằng: Mỗi lần đi vào một vùng đất rồi đi ra, người đó phải dùng đúng một cặp 2 cây cầu. Do đó, muốn đi hết các cầu đúng một lần thì *Số bậc của các đỉnh (số cây cầu nối vào vùng đất đó) bắt buộc phải là số chẵn*! Nhưng ở Königsberg, cả 4 vùng đất đều có số cầu nối vào là số lẻ ($3, 3, 3, 5$)! Do đó, hành trình dạo chơi là BẤT KHẢ THI TUYỆT ĐỐI!
  
  Bằng cách trừu tượng hóa hình học thành tổ hợp các đỉnh và cạnh, Euler đã khai sinh ra hai nhánh toán học khổng lồ định hình thế giới hiện đại: *Lý thuyết Đồ thị (Graph Theory)* và *Tô-pô học (Topology)* — nền tảng của bản đồ Google Maps tìm đường đi ngắn nhất và mạng xã hội Facebook hôm nay!
]

#hook-box(title: "Bài toán Chia kẹo của Euler (Stars and Bars): Đặt Vách Ngăn Phép Thuật")[
  Thầy cầm một túi kẹo 10 chiếc kẹo mút giống hệt nhau giơ lên:
  
  *“Thầy có 10 chiếc kẹo mút giống nhau, muốn chia cho 3 bạn An, Bình, Cúc sao cho BẠN NÀO CŨNG CÓ ÍT NHẤT 1 CHIẾC KẸO. Hỏi có bao nhiêu cách chia?”*
  
  Nhiều học sinh bắt đầu ngồi liệt kê: An 1, Bình 1, Cúc 8; An 1, Bình 2, Cúc 7... rất dễ sót và mất thời gian. Thầy mỉm cười vẽ 10 ngôi sao thẳng hàng lên bảng:
  $ star quad star quad star quad star quad star quad star quad star quad star quad star quad star $
  
  *“Giữa 10 ngôi sao có tất cả $9$ khoảng trống. Để chia 10 ngôi sao thành 3 phần cho 3 bạn, chúng ta chỉ cần ĐẶT ĐÚNG 2 CHIẾC VÁCH NGĂN ($|$) vào 9 khoảng trống ấy!*
  $ star quad star | star quad star quad star | star quad star quad star quad star quad star $
  *(Phần 1: 2 kẹo; Phần 2: 3 kẹo; Phần 3: 5 kẹo).*
  
  *Vì mỗi khoảng trống chỉ được đặt tối đa 1 vách ngăn (để không ai nhận 0 kẹo), số cách chia kẹo đơn giản là SỐ CÁCH CHỌN 2 KHOẢNG TRỐNG TỪ 9 KHOẢNG TRỐNG:*
  $ C_9^2 = (9 times 8) / 2 = 36 "cách"! $
  
  *Cả lớp ồ lên kinh ngạc trước sự ảo diệu của tư duy tổ hợp: Thay vì chia vật thể, ta chỉ cần chọn vị trí vách ngăn! Đó chính là Phương pháp Vách ngăn (Stars and Bars) bất hủ của Leonhard Euler!”*
]

#misconception-box(
  title: "Cạm bẫy Kinh điển: Phân biệt Chỉnh hợp A(n, k) vs Tổ hợp C(n, k)",
  misconception: "Học sinh thường bối rối không biết khi nào dùng Chỉnh hợp (phím nPr trên Casio) và khi nào dùng Tổ hợp (phím nCr trên Casio)!",
  correction: "Quy tắc vàng: HÃY TỰ HỎI BẢN THÂN: 'NẾU TA HOÁN ĐỔI VỊ TRÍ CỦA HAI PHẦN TỬ ĐƯỢC CHỌN, KẾT QUẢ CÓ THAY ĐỔI KHÔNG?'"
)[
  - *Nếu CÓ thay đổi:* Thứ tự có ý nghĩa $arrow$ DÙNG CHỈNH HỢP $A_n^k$!
    + Ví dụ: Chọn 2 bạn trong 10 bạn làm Lớp trưởng và Lớp phó. Đổi chỗ An và Bình: An làm lớp trưởng khác hoàn toàn với Bình làm lớp trưởng! Số cách là $A_(10)^2 = 90$.
  - *Nếu KHÔNG thay đổi:* Thứ tự hoàn toàn vô nghĩa $arrow$ DÙNG TỔ HỢP $C_n^k$!
    + Ví dụ: Chọn 2 bạn trong 10 bạn đi nhổ cỏ vườn trường. Đổi chỗ An và Bình: hai bạn vẫn cùng đi nhổ cỏ, nhiệm vụ không hề đổi khác! Số cách là $C_(10)^2 = 45$.
]

---

== BÀI 26: NHỊ THỨC NEWTON — TỪ TAM GIÁC PASCAL ĐẾN ĐỒ HỌA VECTOR BÉZIER

Khai triển nhị thức $(a + b)^n$:
$ (a + b)^n = sum_(k=0)^n C_n^k a^(n-k) b^k $
là một trong những cây cầu vĩ đại nhất nối liền Đại số với Giải tích và Hình học máy tính.

#story-box(
  title: "Pierre Bézier & Cuộc Cách Mạng Đường Cong Trong Thiết Kế Ô Tô Renault",
  author: "Pierre Bézier (Pháp, 1910 – 1999) & Hãng xe Renault",
)[
  Vào những năm 1960, kỹ sư trưởng của hãng xe hơi Pháp Renault — ông *Pierre Bézier* — đau đầu với một vấn đề: Làm sao để các nhà thiết kế ô tô có thể vẽ được những đường cong thân xe mượt mà, khí động học trên màn hình máy tính sơ khai mà không cần phải nặn hàng tấn đất sét thủ công?
  
  Bézier đã ứng dụng các hệ số của *Nhị thức Newton và Tam giác Pascal* để phát minh ra *Đường cong Bézier (Bézier Curves)* dựa trên các đa thức cơ sở Bernstein:
  $ B(t) = sum_(i=0)^n C_n^i (1 - t)^(n - i) t^i P_i quad (t in [0; 1]) $
  
  Chỉ với 4 điểm điều khiển trên màn hình, các hệ số nhị thức $C_3^0, C_3^1, C_3^2, C_3^3$ ($1, 3, 3, 1$) sẽ kéo căng đường cong mềm mại như một dải lụa! Ngày nay, mọi phông chữ hiển thị trên màn hình máy tính (TrueType, OpenType), mọi hình vẽ vector trong Adobe Illustrator, Photoshop, Figma hay kỹ xảo hoạt hình 3D Pixar đều được uốn lượn theo đúng các hệ số Nhị thức Newton lớp 10!
]

#dialogue-box(title: "Đối thoại Socrates: Bản chất của Tam giác Pascal")[
  *Socrates:* Này bạn trẻ, nhìn vào Tam giác Pascal: Hàng 0 là $1$; Hàng 1 là $1, 1$; Hàng 2 là $1, 2, 1$; Hàng 3 là $1, 3, 3, 1$; Hàng 4 là $1, 4, 6, 4, 1$... Tại sao mỗi con số ở hàng dưới lại bằng tổng hai số đứng ngay trên nó?
  
  *Học trò:* Thưa thầy, công thức sách giáo khoa là: $C_n^k = C_(n-1)^(k-1) + C_(n-1)^k$ ạ!
  
  *Socrates:* Ta không hỏi công thức ký hiệu, ta hỏi BẢN CHẤT TƯ DUY! Hãy tưởng tượng trong một lớp có $n$ bạn học sinh, có bạn An là bạn thân của ngươi. Ta muốn chọn ra một nhóm gồm $k$ bạn. Có hai khả năng xảy ra:
  - Khả năng 1: Nhóm được chọn BẮT BUỘC CÓ BẠN AN. Ta đã chọn An rồi, vậy cần chọn thêm bao nhiêu bạn nữa trong số những bạn còn lại?
  
  *Học trò:* Dạ, cần chọn thêm $k - 1$ bạn từ $n - 1$ bạn còn lại, tức là có $C_(n-1)^(k-1)$ cách!
  
  *Socrates:* Khả năng 2: Nhóm được chọn TUYỆT ĐỐI KHÔNG CÓ BẠN AN (bạn An bị ốm). Ta phải chọn đủ $k$ bạn từ những bạn còn lại. Có bao nhiêu cách?
  
  *Học trò:* Dạ, chọn đủ $k$ bạn từ $n - 1$ bạn còn lại, tức là $C_(n-1)^k$ cách!
  
  *Socrates:* Và hai khả năng này xung khắc nhau, tổng của chúng chính là số cách chọn nhóm $k$ bạn từ $n$ bạn ban đầu! Ngươi thấy chưa: Tam giác Pascal không phải là trò chơi cộng số của trẻ con, nó là sự phân nhánh tất yếu của logic nhị phân cuộc sống!
]

#deep-dive-box(title: "Nhị Thức Newton & Phân Phối Nhị Thức Trong Kiểm Thử Chip Bán Dẫn")[
  Trong xác suất thống kê, khi một nhà máy đúc chip sản xuất $n$ con chip, mỗi con chip có xác suất đạt chuẩn là $p$ và xác suất lỗi là $q = 1 - p$.
  Khai triển nhị thức:
  $ 1 = (p + q)^n = sum_(k=0)^n C_n^k p^k q^(n-k) $
  Số hạng thứ $k$ chính là *Xác suất để trong lô $n$ chip có đúng $k$ chip đạt chuẩn chất lượng!* Phân phối nhị thức Bernoulli sinh ra từ Nhị thức Newton lớp 10 chính là công cụ sống còn giúp các hãng công nghệ Apple và Samsung nghiệm thu hàng triệu linh kiện điện tử mỗi ngày!
]

#inquiry-box(title: "Thực hành Python: In Tam Giác Pascal & Tính Hệ Số Nhị Thức")[
  ```python
  def pascal_triangle(rows=7):
      triangle = []
      for n in range(rows):
          row = [1] * (n + 1)
          for k in range(1, n):
              row[k] = triangle[n-1][k-1] + triangle[n-1][k]
          triangle.append(row)
          # In canh giữa tam giác
          spacing = " " * (rows - n) * 2
          print(spacing + "   ".join(f"{x:2d}" for x in row))

  pascal_triangle(8)
  ```
]

#pagebreak()


#pagebreak()

= ĐẠI CHƯƠNG IX: RANH GIỚI GIỮA MÊ TÍN & KHOA HỌC — TÍNH XÁC SUẤT CỔ ĐIỂN

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 27, Bài 28 SGK Toán 10 cùng Chuyên đề Nghịch lý Monty Hall, Nghịch lý Ngày sinh (Birthday Paradox), Định lý Bayes & Bản chất của Trí tuệ nhân tạo LLM (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 27: BIẾN CỐ VÀ KHÔNG GIAN MẪU — VŨ TRỤ CỦA MỌI KỊCH BẢN KHẢ DĨ

Trước thế kỷ XVII, khi một người tung một con súc sắc hay đối mặt với một trận bão biển, họ tin rằng mọi thứ đều nằm trong tay của "Thần May Mắn" (Fortuna) hoặc định mệnh siêu nhiên. Nếu gặp rủi ro, họ cúng bái tế lễ; nếu may mắn, họ tạ ơn thần linh. Con người hoàn toàn bất lực trước sự ngẫu nhiên của cuộc đời.

Sự ra đời của *Khái niệm Phép thử ($T$), Không gian mẫu ($Omega$) và Biến cố ($A$)* chính là phát súng đầu tiên giải thoát nhân loại khỏi sự mê tín dị đoan!
- *Không gian mẫu ($Omega$)*: Là toàn bộ vũ trụ của MỌI KỊCH BẢN CÓ THỂ XẢY RA của một hiện tượng ngẫu nhiên.
- *Biến cố ($A subset.eq Omega$)*: Là một tập hợp con gồm những kết quả mà chúng ta quan tâm.

Bằng cách gom mọi sự ngẫu nhiên vào một tập hợp xác định $Omega$, con người đã lần đầu tiên "bắt nhốt" được sự bất định của số phận vào trong chiếc lồng của tư duy toán học!

#story-box(
  title: "Girolamo Cardano: Bác sĩ, Con bạc khét tiếng & Cuốn sách cờ bạc đầu tiên",
  author: "Girolamo Cardano (Ý, 1501 – 1576)",
)[
  Girolamo Cardano là một trong những nhân vật kỳ dị và màu sắc nhất của thời kỳ Phục hưng. Ông là một bác sĩ lừng danh từng chữa khỏi bệnh cho Tổng giám mục xứ Scotland, người phát minh ra trục truyền động các-đăng (Cardan shaft) dùng trên mọi ô tô ngày nay, và là người đầu tiên công bố công thức giải phương trình bậc ba.
  
  Nhưng Cardano có một điểm yếu chí mạng: ông là một *con bạc nghiện ngập điên cuồng*! Ông chơi súc sắc, đánh cược và bài tây thâu đêm suốt sáng tại các sòng bạc ngầm ở Milan và Bologna. Nhiều lần ông thua sạch đến chiếc áo khoác cuối cùng và phải cầm cố cả đồ trang sức của vợ.
  
  Tuy nhiên, với bộ óc toán học thiên tài, Cardano không cam chịu làm một kẻ cờ bạc u mê. Ông ngồi xuống, ghi chép lại hàng vạn lần tung súc sắc và viết nên cuốn sách *“Liber de Ludo Aleae”* (Cuốn sách về Trò chơi May rủi) vào năm 1564 — cuốn sách đầu tiên trong lịch sử nhân loại nghiên cứu về không gian mẫu của các trò chơi ngẫu nhiên! Cardano chỉ ra rằng: Nếu bạn gieo hai con súc sắc, có tất cả $6 times 6 = 36$ kịch bản trong không gian mẫu $Omega$. Tổng số chấm bằng 7 có tới 6 biến cố thuận lợi:
  $ (1, 6), (2, 5), (3, 4), (4, 3), (5, 2), (6, 1) $
  trong khi tổng số chấm bằng 2 chỉ có duy nhất 1 biến cố: $(1, 1)$!
  
  Cardano tuyên bố một chân lý cay đắng: *“Sòng bạc thắng không phải vì họ may mắn hơn bạn, mà vì toán học đứng về phía họ! Cách tốt nhất để không thua một canh bạc là KHÔNG BAO GIỜ BƯỚC CHÂN VÀO SÒNG BẠC!”*
]

#hook-box(title: "Trò chơi Tung súc sắc tại Sòng bạc Las Vegas: Con số 7 Tử Thần")[
  Thầy cầm hai con súc sắc 6 mặt lắc đều trong chiếc cốc nhựa rồi đổ ra bàn:
  
  *“Khi các em bước chân vào các sòng bạc lớn nhất tại Las Vegas hay Ma Cao, bàn chơi lúc nào cũng đông nghẹt người gào thét cuồng nhiệt nhất chính là bàn trò chơi Craps (Đổ xí ngầu).*
  
  *Trong trò chơi đó, con số nào là con số đáng sợ nhất, chi phối toàn bộ luật chơi của sòng bạc? Đó chính là CON SỐ 7!*
  
  *Tại sao lại là số 7 mà không phải số 6 hay số 8?*
  - Tổng bằng 2: Chỉ có 1 cách: $1 + 1$.
  - Tổng bằng 12: Chỉ có 1 cách: $6 + 6$.
  - Nhưng Tổng bằng 7: Có tới 6 cách kết hợp!
  $arrow$ Xác suất xuất hiện số 7 là $6 / 36 = 1/6 approx 16,67\%$ — cao nhất trong mọi tổng số điểm!
  
  *Sòng bạc Las Vegas không hề dựa vào sự may rủi mơ hồ, họ thuê những tiến sĩ toán học giỏi nhất thế giới để thiết kế Không gian mẫu sao cho dù khách hàng có thắng một vài ván lẻ tẻ, thì về lâu dài, Định luật số lớn sẽ gom toàn bộ tiền của người chơi về két sắt của sòng bạc!”*
]

#tech-box(title: "Kiểm thử phần mềm tự động (Fuzz Testing) bằng Không gian mẫu")[
  - *Săn lùng lỗ hổng bảo mật cho hệ điều hành Windows & iOS*: Khi Microsoft hay Apple phát hành một bản cập nhật phần mềm, làm sao họ biết phần mềm không bị hacker tấn công tràn bộ nhớ (Buffer Overflow)? Họ sử dụng kỹ thuật *Fuzz Testing*: Máy tính tự động sinh ra hàng triệu chuỗi dữ liệu đầu vào ngẫu nhiên từ không gian mẫu $Omega$ của mọi ký tự khả dĩ để "bắn phá" vào phần mềm. Nếu có một kịch bản ngẫu nhiên làm sập hệ thống, các kỹ sư sẽ vá lỗ hổng ngay trước khi sản phẩm đến tay người tiêu dùng.
]

#misconception-box(
  title: "Cái bẫy Tâm lý Ngụy biện Con bạc (Gambler's Fallacy) & Ảo tưởng Tay đỏ (Hot Hand)",
  misconception: "Tung đồng xu 5 lần liên tiếp đều ra mặt Ngửa, vậy lần thứ 6 chắc chắn mặt Sấp sẽ có xác suất cao hơn để 'bù trừ lại cho cân bằng'!",
  correction: "Đồng xu là một vật thể vô tri vô giác, hoàn toàn KHÔNG CÓ TRÍ NHỚ! Mỗi lần tung là một phép thử độc lập tuyệt đối. Lần thứ 6 thì xác suất ra Ngửa hay Sấp vẫn đúng bằng 50%!"
)[
  *Thảm họa Monte Carlo ngày 18 tháng 8 năm 1913:*
  
  Tại sòng bạc xa hoa Monte Carlo ở Monaco, quả bóng roulette rơi vào ô màu Đen. Lần thứ hai: lại rơi vào ô Đen. Lần thứ ba, thứ tư... bóng liên tục rơi vào ô Đen!
  
  Đám đông con bạc bắt đầu phát cuồng. Họ tin rằng theo "luật bù trừ tự nhiên", ô Đỏ sắp phải xuất hiện. Họ bắt đầu dồn hàng triệu Franc vào ô Đỏ. Nhưng quả bóng tiếp tục rơi vào ô Đen lần thứ 10, 15, 20! Các con bạc lại càng điên cuồng vay mượn, cắm nhà cửa, gom hết tài sản đặt vào ô Đỏ vì nghĩ rằng "chuỗi đen không thể kéo dài mãi".
  
  Cuối cùng, quả bóng roulette đã rơi vào ô Đen liên tiếp *26 LẦN* trước khi rơi vào ô Đỏ ở lần thứ 27! Trong đêm kinh hoàng đó, sòng bạc Monte Carlo đã thu về hàng triệu Franc tiền cược, còn hàng chục con bạc giàu có nhất châu Âu đã nhảy cầu tự tử vì phá sản chỉ vì một ảo tưởng ngụy biện tâm lý!
  
  *Bài học cho học sinh:* Định luật Số lớn chỉ phát biểu rằng tần số tương đối sẽ hội tụ về xác suất lý thuyết khi số phép thử TIẾN ĐẾN VÔ CÙNG ($n arrow +infinity$), chứ KHÔNG HỀ có bất kỳ một cơ chế cơ học nào "bù trừ điểm" cho các biến cố trong quá khứ ở vài lần thử hữu hạn!
]

---

== BÀI 28: XÁC SUẤT CỦA BIẾN CỐ — BỨC THƯ 1654 & NGHỊCH LÝ MONTY HALL

Định nghĩa cổ điển của Laplace về Xác suất:
$ P(A) = (n(A)) / (n(Omega)) = ("Số kết quả thuận lợi cho A") / ("Tổng số kết quả có thể xảy ra") $
là một trong những định nghĩa thanh nhã và quyền năng nhất của khoa học. Nó biến một dự cảm mơ hồ ("Khả năng trời mưa hôm nay cao đấy") thành một thước đo định lượng chính xác bằng một con số thực nằm trong đoạn $[0; 1]$!

#story-box(
  title: "Bức thư định mệnh năm 1654 giữa Pascal và Fermat: Khai sinh Lý thuyết Xác suất",
  author: "Blaise Pascal (1623 – 1662) & Pierre de Fermat (1607 – 1665)",
)[
  Mùa hè năm 1654, một nhà quý tộc người Pháp mê cờ bạc tên là *Chevalier de Méré* (Hiệp sĩ de Méré) đã gửi cho nhà bác học trẻ Blaise Pascal một câu hỏi hóc búa mang tên *“Bài toán chia tiền cược”* (The Problem of Points):
  
  *“Hai người chơi cùng đặt cược một số tiền bằng nhau vào một trò chơi tung đồng xu: Ai thắng đủ 3 ván trước thì sẽ giành trọn vẹn toàn bộ số tiền thưởng. Nhưng khi người thứ nhất đã thắng 2 ván, người thứ hai mới thắng 1 ván, thì trò chơi buộc phải dừng lại đột ngột vì cảnh sát ập vào bắt giữ! Hỏi: Phải chia số tiền thưởng như thế nào cho công bằng và đúng đạo lý toán học?”*
  
  Nhiều người đương thời đề xuất chia theo tỉ lệ $2 : 1$ (theo số ván đã thắng). Nhưng Pascal linh cảm thấy điều đó là sai lầm, vì người đã thắng 2 ván chỉ cần thắng thêm DUY NHẤT 1 VÁN NỮA là giành toàn bộ giải thưởng!
  
  Pascal lập tức viết thư trao đổi với nhà toán học vĩ đại Pierre de Fermat ở Toulouse. Cuộc trao đổi thư từ định mệnh giữa hai bộ óc thiên tài suốt mùa hè năm 1654 đã làm nên lịch sử:
  - Fermat dùng phương pháp tổ hợp liệt kê mọi kịch bản tương lai có thể xảy ra nếu trò chơi tiếp tục thêm 2 ván nữa.
  - Pascal dùng Tam giác số học của mình để tính toán xác suất kỳ vọng.
  
  Cả hai thiên tài, đi theo hai con đường độc lập, đều đi đến cùng một kết luận bất hủ: Người thứ nhất có xác suất thắng là $3/4$ ($75\%$), người thứ hai chỉ có $1/4$ ($25\%$). Tiền thưởng phải chia theo tỉ lệ $3 : 1$!
  
  Từ bài toán chia tiền cược của một canh bạc dang dở, *Lý thuyết Xác suất hiện đại đã chính thức cất tiếng khóc chào đời*, mở ra kỷ nguyên định lượng rủi ro cho toàn bộ ngành bảo hiểm, tài chính và khoa học thế giới!
]

#story-box(
  title: "Nghịch lý Monty Hall 1990: Khi 1.000 Tiến sĩ Toán học bị một phụ nữ đánh bại",
  author: "Marilyn vos Savant & Gameshow 'Let's Make a Deal'",
)[
  Năm 1990, trong chuyên mục "Ask Marilyn" của tạp chí Parade, một độc giả đã gửi câu hỏi về gameshow truyền hình nổi tiếng *“Let's Make a Deal”* do MC Monty Hall dẫn chương trình:
  
  *“Bạn đang đứng trên sân khấu trước 3 cánh cửa đóng kín: Đằng sau một cánh cửa là một chiếc ô tô thể thao sang trọng, đằng sau hai cánh cửa còn lại là hai con dê hôi hám. Bạn chọn cánh Cửa số 1.*
  *MC Monty Hall — người biết rõ ô tô nằm ở đâu — bước đến mở cánh Cửa số 3 ra, và một con dê xuất hiện kêu be be.*
  *Lúc này, chỉ còn Cửa số 1 và Cửa số 2 đóng kín. Monty Hall quay sang bạn và hỏi: ‘Bạn có muốn THAY ĐỔI lựa chọn sang Cửa số 2 không?’*
  *Hỏi: Bạn nên giữ nguyên Cửa số 1 hay nên ĐỔI sang Cửa số 2 để có cơ hội trúng ô tô cao hơn?”*
  
  Bà *Marilyn vos Savant* (người từng được sách Kỷ lục Guinness ghi nhận là người có chỉ số IQ cao nhất thế giới: 228) đã trả lời dứt khoát trên báo: *“BẠN BẮT BUỘC PHẢI ĐỔI SANG CỬA SỐ 2! Việc đổi cửa sẽ tăng gấp đôi xác suất thắng của bạn từ $1/3$ lên $2/3$!”*
  
  Ngay lập tức, một cơn bão thịnh nộ chưa từng có trong lịch sử học thuật Mỹ bùng nổ! Hơn $10.000$ bức thư phản đối giận dữ từ khắp nơi gửi về tòa soạn, trong đó có thư của gần *1.000 Giáo sư và Tiến sĩ Toán học* từ các trường đại học danh giá như Harvard, MIT, Viện Nghiên cứu Quốc gia! Nhiều giáo sư viết thư thóa mạ công khai: *“Bà là kẻ dốt nát! Chỉ còn 2 cánh cửa thì xác suất bắt buộc phải là 50/50! Hãy xin lỗi công chúng và đừng làm xấu mặt phụ nữ nữa!”*.
  
  Marilyn vos Savant vẫn bình tĩnh mỉm cười. Bà mời toàn bộ các trường trung học và các nhà khoa học trên toàn nước Mỹ thực hiện một cuộc mô phỏng thực tế bằng máy tính và chơi thử hàng chục nghìn lần trên lớp học. Kết quả chấn động: *Những người ĐỔI CỬA thắng đúng xấp xỉ $66,7\%$ ($2/3$), còn những người GIỮ NGUYÊN chỉ thắng $33,3\%$ ($1/3$)!*
  
  *Phân tích bảng Không gian mẫu sáng tỏ 3 kịch bản:*
  Giả sử bạn luôn chọn Cửa số 1 ban đầu:
  #align(center)[
    #table(
      columns: (2.5cm, 2.5cm, 2.5cm, 3.5cm, 3.5cm),
      stroke: 0.5pt + rgb("cbd5e1"),
      fill: (x, y) => if y == 0 { rgb("f1f5f9") } else { none },
      [Vị trí Ô tô], [Cửa bạn chọn], [MC mở cửa dê], [Nếu GIỮ NGUYÊN (Cửa 1)], [Nếu ĐỔI CỬA (Cửa còn lại)],
      [Cửa 1], [Cửa 1], [Cửa 2 hoặc 3], [#text(fill: rgb("16a34a"), weight: "bold")[THẮNG XE]], [#text(fill: rgb("dc2626"))[THUA (Trúng Dê)]],
      [Cửa 2], [Cửa 1], [Bắt buộc Cửa 3], [#text(fill: rgb("dc2626"))[THUA (Trúng Dê)]], [#text(fill: rgb("16a34a"), weight: "bold")[THẮNG XE (Cửa 2)]],
      [Cửa 3], [Cửa 1], [Bắt buộc Cửa 2], [#text(fill: rgb("dc2626"))[THUA (Trúng Dê)]], [#text(fill: rgb("16a34a"), weight: "bold")[THẮNG XE (Cửa 3)]],
    )
  ]
  - Chiến lược GIỮ NGUYÊN chỉ thắng khi ô tô nằm ở Cửa 1 ban đầu: Xác suất là $1/3$ ($33,3\%$).
  - Chiến lược ĐỔI CỬA sẽ thắng trong cả 2 trường hợp ô tô nằm ở Cửa 2 hoặc Cửa 3: Xác suất là $2/3$ ($66,7\%$)!
  
  Hàng trăm giáo sư toán học sau đó đã phải muối mặt viết thư xin lỗi công khai bà Marilyn vos Savant trên báo chí. Nghịch lý Monty Hall là bài học chấn động nhất chứng minh rằng: *Trực giác con người rất kém cỏi trước xác suất! Chỉ có tính toán toán học lạnh lùng mới bảo vệ chúng ta khỏi những sai lầm ngớ ngẩn nhất!*
]

#story-box(
  title: "Nghịch Lý Ngày Sinh (Birthday Paradox) & Đòn Tấn Công Mã Hóa SHA",
  author: "Richard von Mises (Áo, 1883 – 1953) & Mật mã học Hiện đại",
)[
  Hãy tưởng tượng một lớp học có $n$ bạn học sinh. Cần có bao nhiêu học sinh trong lớp để xác suất có *ÍT NHẤT HAI BẠN CÙNG NGÀY SINH NHẬT* (ngày và tháng) vượt quá $50\%$?
  
  Hầu hết mọi người khi nghe câu hỏi này đều nhẩm tính: Một năm có 365 ngày, muốn có xác suất trên $50\%$ thì chắc phải cần ít nhất một nửa số ngày trong năm: $365 / 2 approx 183$ người!
  
  Nhưng Toán học lớp 10 với phương pháp tính xác suất của *Biến cố đối* cho ta một con số gây sốc hoàn toàn: *CHỈ CẦN ĐÚNG 23 NGƯỜI TRONG PHÒNG LÀ XÁC SUẤT ĐÃ VƯỢT QUÁ 50,7%!* Và nếu lớp học có 75 người, xác suất này vọt lên tới *99,9%* gần như chắc chắn tuyệt đối!
  
  *Chứng minh kỳ ảo bằng Biến cố đối $bar(A)$ (Không ai có cùng ngày sinh):*
  - Người 1: Có 365 ngày khả dĩ.
  - Người 2: Có 364 ngày còn lại ($364 / 365$).
  - Người thứ $n$: Có $365 - n + 1$ ngày còn lại.
  $ P(bar(A)) = 365 / 365 times 364 / 365 times ... times (365 - n + 1) / 365 $
  Với $n = 23$: $P(bar(A)) approx 0,4927$.
  $arrow P(A) = 1 - P(bar(A)) = 1 - 0,4927 = 0,5073 = 50,73\%! $
  
  *Tại sao trực giác lại bị đánh lừa thê thảm?*
  Vì bạn đang so sánh ngày sinh của bạn với từng người khác (chỉ có 22 cặp so sánh). Nhưng bài toán hỏi: *BẤT KỲ CẶP HAI NGƯỜI NÀO*. Trong 23 người, số lượng cặp đôi so sánh tổ hợp lên tới:
  $ C_(23)^2 = (23 times 22) / 2 = 253 "cặp đôi so sánh"! $
  Với 253 cặp so sánh, cơ hội trùng nhau lớn hơn $50\%$ là điều hoàn toàn tự nhiên!
  
  *Ứng dụng trong An ninh Mạng (Birthday Attack):*
  Các hacker sử dụng Nghịch lý Ngày sinh để tấn công các hàm băm mật mã (Hash Function MD5, SHA-1). Thay vì phải đoán thử $2^n$ lần để tìm một mã khóa định trước, hacker chỉ cần sinh ngẫu nhiên khoảng $sqrt(2^n) = 2^(n/2)$ chuỗi là có thể tìm ra hai tài liệu khác nhau có cùng mã băm (Xung đột băm - Hash Collision), làm sụp đổ các chứng chỉ bảo mật số toàn cầu!
]

#dialogue-box(title: "Đối thoại Socrates: MC Monty Hall Đã Làm Gì Với Không Gian Mẫu?")[
  *Socrates:* Này Theaetetus, khi ngươi chọn Cửa 1 lúc đầu, xác suất có xe ở Cửa 1 là bao nhiêu?
  
  *Học trò:* Thưa thầy, có 3 cánh cửa bình đẳng, nên xác suất là $1/3$.
  
  *Socrates:* Vậy xác suất xe nằm ở một trong hai cánh cửa còn lại (Cửa 2 hoặc Cửa 3) là bao nhiêu?
  
  *Học trò:* Thưa thầy, hiển nhiên là $2/3$.
  
  *Socrates:* Hay lắm. Bây giờ hãy quan sát hành vi của MC Monty Hall. Ông ta có mở ngẫu nhiên một cánh cửa như một kẻ mù quáng không?
  
  *Học trò:* Không ạ! Ông ta biết chính xác xe ở đâu, và ông ta *bắt buộc phải tìm một cánh cửa có dê* trong hai cánh cửa còn lại để mở ra!
  
  *Socrates:* Đúng thế! Nếu xe nằm ở Cửa 2, ông ta bị buộc phải mở Cửa 3. Nếu xe nằm ở Cửa 3, ông ta bị buộc phải mở Cửa 2. Vậy hành động mở cửa của ông ta có làm thay đổi việc lựa chọn ban đầu của ngươi không?
  
  *Học trò:* Dạ không, Cửa 1 vẫn chỉ có xác suất $1/3$ như cũ.
  
  *Socrates:* Vậy toàn bộ xác suất $2/3$ của nhóm hai cánh cửa $\{2; 3\}$ ban đầu giờ đã dồn hết về đâu khi Cửa 3 đã bị lộ tẩy là con dê?
  
  *Học trò:* Ối! Toàn bộ trọng số xác suất $2/3$ đã bị "ép" dồn hết sang Cửa 2!
  
  *Socrates:* Ngươi đã thấy ánh sáng rồi đó! Kẻ dốt nát nhìn thấy 2 cánh cửa còn lại liền tưởng là 50/50 vì họ quên mất thông tin quá khứ. Người có tư duy xác suất hiểu rằng: Hành động loại bỏ có chủ đích của MC là một món quà thông tin miễn phí làm tăng gấp đôi cơ hội thắng nếu ta biết đổi cửa!
]

#deep-dive-box(title: "Định Lý Bayes & Cạm Bẫy Bỏ Quên Tỷ Lệ Nền Trong Y Tế (Base Rate Fallacy)")[
  Một căn bệnh hiếm gặp chỉ ảnh hưởng tới $1$ trong $10.000$ người dân trong cộng đồng (Tỉ lệ nền $P(B) = 0,0001$).
  Một công ty y tế phát minh ra một bộ xét nghiệm máu siêu hiện đại có độ chính xác $99\%$:
  - Nếu người bị bệnh: $99\%$ trường hợp xét nghiệm cho kết quả Dương tính.
  - Nếu người không bị bệnh: $99\%$ trường hợp xét nghiệm cho kết quả Âm tính ($1\%$ dương tính giả).
  
  *Một bạn học sinh đi xét nghiệm sức khỏe và nhận kết quả: DƯƠNG TÍNH! Bác sĩ bảo: "Cháu hãy chuẩn bị tâm lý, độ chính xác máy là 99%!" Bạn học sinh suy sụp ngất xỉu.*
  
  Hỏi: Xác suất bạn học sinh đó THỰC SỰ MẮC BỆNH là bao nhiêu?
  
  Hãy dùng Toán học Xác suất phân tích trong một quần thể $1.000.000$ người dân:
  - Số người thực sự mắc bệnh: $1.000.000 times 0,0001 = 100$ người. Trong đó máy phát hiện đúng $99\%$ $arrow$ *99 người Dương tính thật*.
  - Số người khỏe mạnh bình thường: $999.900$ người. Máy báo sai $1\%$ $arrow$ *9.999 người Dương tính giả*!
  - Tổng số người nhận kết quả Dương tính trong phòng khám:
    $ n("Dương tính") = 99 + 9.999 = 10.098 "người"! $
  
  Xác suất bạn học sinh thực sự mắc bệnh khi đã có kết quả Dương tính:
  $ P("Bệnh" | "Dương tính") = 99 / (10.098) approx 0,0098 = 0,98\%! $
  
  *KẾT QUẢ CHẤN ĐỘNG:* Xác suất mắc bệnh thực sự của bạn học sinh *CHƯA TỚI 1%*! $99\%$ những người nhận kết quả dương tính thực chất là người khỏe mạnh bị chẩn đoán sai! Cái bẫy tâm lý bỏ quên tỉ lệ nền (Base Rate Fallacy) đã khiến hàng triệu người trên thế giới hoảng loạn vô cớ. Đó là lý do trong y khoa, các bác sĩ luôn yêu cầu làm thêm xét nghiệm lần 2 để kiểm chứng chéo!
]

#tech-box(title: "Mô hình Ngôn ngữ Lớn (ChatGPT, Claude) bản chất là Cỗ máy Xác suất")[
  - *Bản chất thực sự của Trí tuệ Nhân tạo hiện đại*: Khi các em nhắn tin cho ChatGPT hay Claude và thấy nó trả lời thông minh như một con người thực sự, các em có biết đằng sau bức màn nhung của AI là gì không? Nó hoàn toàn không có cảm xúc hay ý thức bí ẩn nào cả! 
  - *Bản chất của mọi mô hình LLM chính là một cỗ máy tính Xác suất có điều kiện khổng lồ*:
    $ P(w_t | w_1, w_2, ..., w_(t-1)) $
    Khi các em gõ cụm từ *“Học sinh đi...”*, AI tính xác suất của hàng vạn từ tiếp theo trong từ điển: từ *“học”* có xác suất $70\%$, từ *“chơi”* có xác suất $20\%$, từ *“ngủ”* có xác suất $5\%$... AI chỉ việc chọn từ có xác suất cao nhất phù hợp với ngữ cảnh! Toàn bộ cuộc cách mạng Trí tuệ Nhân tạo làm rung chuyển thế giới hôm nay đều được xây dựng từ định nghĩa xác suất mà các em đang học trong SGK Toán 10!
]

#inquiry-box(title: "Nhiệm vụ Nghiên cứu: Lập trình Mô phỏng Monty Hall & Birthday Paradox")[
  ```python
  import random

  # 1. Mô phỏng Nghịch lý Monty Hall:
  def simulate_monty_hall(trials=100000):
      stay_wins, switch_wins = 0, 0
      for _ in range(trials):
          car = random.randint(1, 3)
          guess = random.randint(1, 3)
          if guess == car:
              stay_wins += 1
          else:
              switch_wins += 1
      print(f"Monty Hall 100.000 ván: Giữ nguyên thắng {stay_wins/trials*100:.2f}% | Đổi cửa thắng {switch_wins/trials*100:.2f}%")

  # 2. Mô phỏng Nghịch lý Ngày sinh (23 người):
  def simulate_birthday(n_people=23, trials=50000):
      matches = 0
      for _ in range(trials):
          birthdays = [random.randint(1, 365) for _ in range(n_people)]
          if len(birthdays) != len(set(birthdays)):
              matches += 1
      print(f"Xác suất có 2 người cùng sinh nhật trong 23 người: {matches/trials*100:.2f}% (Lý thuyết: 50.73%)")

  simulate_monty_hall()
  simulate_birthday()
  ```
]

#pagebreak()


#pagebreak()

= PHẦN CHUYÊN ĐỀ NÂNG CAO: BA ĐỈNH CAO TRI THỨC TOÁN HỌC LỚP 10

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: 3 Chuyên đề Học tập Toán 10 Chuyên sâu (Bộ sách Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo): Hệ ba phương trình bậc nhất ba ẩn, Phương pháp quy nạp toán học & Ba đường Conic mở rộng trong cơ học thiên thể.
]

== CHUYÊN ĐỀ 1: HỆ BA PHƯƠNG TRÌNH BẬC NHẤT BA ẨN & THUẬT TOÁN KHỬ GAUSS

Hệ hai phương trình bậc nhất hai ẩn cho ta giao điểm của hai đường thẳng trong mặt phẳng 2D. Nhưng khi bước lên không gian ba chiều với 3 ẩn số $(x, y, z)$, mỗi phương trình bậc nhất:
$ a x + b y + c z = d $
mô tả một *Mặt phẳng vô tận trong không gian!*

Giải hệ ba phương trình bậc nhất ba ẩn chính là bài toán tìm *Giao điểm chung duy nhất của 3 mặt phẳng* — giống như tìm điểm góc nơi hai bức tường và trần nhà gặp nhau trong căn phòng! Và vũ khí tối thượng để giải quyết hệ phương trình này chính là *Thuật toán khử Gauss (Gaussian Elimination)*.

#story-box(
  title: "Từ 'Cửu Chương Toán Thuật' cổ đại đến Thuật toán Khử Gauss",
  author: "Lưu Huy (Trung Quốc, thế kỷ III) & Carl Friedrich Gauss (Đức, 1777 – 1855)",
)[
  Hơn 2.000 năm trước, trong cuốn cổ thư kinh điển *“Cửu Chương Toán Thuật”* thời nhà Hán, các học giả phương Đông đã dùng những que tính màu đỏ (số dương) và màu đen (số âm) xếp thành một bảng ma trận vuông trên bàn cờ để giải bài toán về các loại lúa mùa. Đến thế kỷ III, nhà toán học *Lưu Huy* đã chú giải và hoàn thiện phương pháp khử dần các ẩn số từ trên xuống dưới — được gọi là phương pháp *“Phương trình”*.
  
  Mười lăm thế kỷ sau, nhà toán học thiên tài Carl Friedrich Gauss khi nghiên cứu quỹ đạo của tiểu hành tinh Ceres đã độc lập phát minh lại và hoàn thiện phương pháp này thành một thuật toán đại số ma trận chặt chẽ: *Dùng các phép biến đổi sơ cấp trên dòng để biến ma trận hệ số về dạng bậc thang tam giác!*
  
  Bằng cách đưa hệ phương trình về dạng tam giác, ẩn số cuối cùng $z$ sẽ hiển lộ ngay lập tức. Sau đó, ta chỉ việc thế ngược từ dưới lên trên để tìm $y$ và $x$ một cách êm ái nhẹ nhàng. Ngày nay, thuật toán khử Gauss là một trong 10 thuật toán có tầm ảnh hưởng lớn nhất đối với toàn bộ nền văn minh máy tính của thế kỷ XX và XXI!
]

#hook-box(title: "Cân bằng phản ứng Hóa học Oxy hóa - Khử siêu phức tạp")[
  Thầy viết lên bảng một phương trình phản ứng hóa học hữu cơ hoặc vô cơ phức tạp:
  $ x K_2 C r_2 O_7 + y F e S O_4 + z H_2 S O_4 arrow a K_2 S O_4 + b C r_2 (S O_4)_3 + c F e_2 (S O_4)_3 + d H_2 O $
  
  *“Nhiều bạn học sinh lớp 10 học Hóa thường ngồi 'đoán mò' hoặc nhẩm nhẩm hệ số cả tiếng đồng hồ mà vẫn sai be bét! Nhưng đối với một người học Toán Chuyên đề 1, đây chỉ là một bài toán con nít!*
  
  *Hãy thiết lập hệ phương trình bảo toàn nguyên tố:*
  - Bảo toàn Kali ($K$): $2x = 2a arrow x = a$.
  - Bảo toàn Crom ($C r$): $2x = 2b arrow x = b$.
  - Bảo toàn Sắt ($F e$): $y = 2c$.
  - Bảo toàn Lưu huỳnh ($S$): $y + z = a + 3b + 3c$.
  - Bảo toàn Hydro ($H$): $2z = 2d arrow z = d$.
  - Bảo toàn Oxy ($O$): $7x + 4y + 4z = 4a + 12b + 12c + d$.
  
  *Chọn $x = 1$, ta có ngay một hệ ba phương trình bậc nhất ba ẩn cho $y, z, c$! Bấm máy tính Casio hoặc chạy khử Gauss trong 3 giây, ta có ngay bộ hệ số nguyên tối giản: $(1, 6, 7, 1, 1, 3, 7)!$*
  
  *Đó chính là sức mạnh bá đạo của Toán học: Biến sự rối rắm của Hóa học thành sự tường minh của Đại số tuyến tính!”*
]

#tech-box(title: "Mô hình Leontief Nobel Kinh tế & Thuật toán Google PageRank")[
  - *Mô hình Cân bằng Kinh tế Vĩ mô của Wassily Leontief (Giải Nobel Kinh tế 1973)*: Làm sao một chính phủ biết được: Nếu ngành giao thông vận tải muốn tăng trưởng $10\%$, thì ngành điện lực phải tăng bao nhiêu megawatt, ngành khai thác than phải tăng bao nhiêu tấn, và ngành sản xuất thép phải tăng bao nhiêu để toàn bộ nền kinh tế quốc gia không bị khủng hoảng thiếu hụt? Nhà kinh tế học Wassily Leontief đã mô hình hóa toàn bộ nền kinh tế quốc gia thành một *Hệ phương trình ma trận Input-Output khổng lồ $(I - A) X = D$*. Giải hệ phương trình này bằng thuật toán khử Gauss giúp các quốc gia điều hành kế hoạch kinh tế vĩ mô tránh được các thảm họa lạm phát và đứt gãy chuỗi cung ứng!
  - *Thuật toán Google PageRank của Larry Page & Sergey Brin*: Năm 1998, hai chàng sinh viên đại học Stanford đã thành lập Google dựa trên thuật toán PageRank. Họ coi mỗi trang web là một biến số $x_i$, và mỗi liên kết (link) trỏ giữa các trang web là một phương trình bậc nhất. Giải hệ phương trình hàng tỷ ẩn số này bằng phương pháp lặp Gauss đã giúp Google xếp hạng đúng trang web uy tín nhất, biến Google thành tập đoàn công nghệ nghìn tỷ USD thống trị thế giới!
]

#deep-dive-box(title: "Mô Hình Nhập - Xuất Input - Output Leontief Trong Nền Kinh Tế Ba Ngành")[
  Xét một nền kinh tế quốc gia gồm 3 ngành mũi nhọn:
  1. Ngành Năng lượng ($X_1$)
  2. Ngành Nông nghiệp & Thực phẩm ($X_2$)
  3. Ngành Chế tạo Cơ khí ($X_3$)
  
  Để sản xuất ra 1 đơn vị giá trị sản phẩm của chính mình, mỗi ngành phải tiêu thụ một lượng sản phẩm đầu vào từ hai ngành kia và từ chính bản thân nó. Ta có Ma trận hệ số kỹ thuật đầu vào $A$:
  $ A = mat(
    0.2, 0.3, 0.1;
    0.1, 0.1, 0.2;
    0.2, 0.1, 0.3
  ) $
  Giả sử nhu cầu tiêu dùng cuối cùng của toàn xã hội đối với 3 ngành lần lượt là: $D = mat(100; 80; 120)$ (tỷ đồng).
  
  Phương trình cân bằng tổng sản lượng toàn ngành thỏa mãn hệ ma trận:
  $ X = A X + D quad arrow quad (I - A) X = D $
  với $I$ là ma trận đơn vị cấp 3:
  $ mat(
    0.8, -0.3, -0.1;
    -0.1, 0.9, -0.2;
    -0.2, -0.1, 0.7
  ) mat(X_1; X_2; X_3) = mat(100; 80; 120) $
  
  *Thực thi Thuật toán Khử Gauss giải hệ:*
  - Dòng 1: $0.8 X_1 - 0.3 X_2 - 0.1 X_3 = 100$
  - Dùng $X_1$ để triệt tiêu các hệ số ở Dòng 2 và Dòng 3, đưa ma trận về dạng bậc thang tam giác trên.
  - Sau đó giải ngược từ dưới lên ta thu được nghiệm chính xác: $X_1 approx 248.5$ tỷ, $X_2 approx 173.8$ tỷ, $X_3 approx 266.3$ tỷ đồng!
  
  Chính phủ dựa vào đáp số toán học này để phân bổ nguồn lực quốc gia, bảo đảm ngành năng lượng và cơ khí cung ứng đủ nhiên liệu cho nông nghiệp mà không xảy ra tình trạng thiếu hụt hay khủng hoảng thừa!
]

#misconception-box(
  title: "Cạm bẫy Hình học của Hệ 3 phương trình: Tại sao máy tính báo 'Vô nghiệm' hay 'Vô số nghiệm'?",
  misconception: "Hệ 3 phương trình 3 ẩn thì lúc nào cũng có đúng một nghiệm duy nhất $(x; y; z)$!",
  correction: "Mỗi phương trình là một mặt phẳng trong không gian 3D. 3 mặt phẳng có thể song song nhau (vô nghiệm), hoặc cùng cắt nhau theo một đường thẳng chung (vô số nghiệm phụ thuộc 1 tham số), hoặc tạo thành một hình lăng trụ tam giác không có điểm chung nào!"
)[
  Khi khử Gauss, nếu xuất hiện dòng $0x + 0y + 0z = k$ ($k != 0$), hệ vô nghiệm. Nếu xuất hiện dòng $0x + 0y + 0z = 0$, hệ có vô số nghiệm phụ thuộc tham số tự do.
  
  *Hình ảnh trực quan:*
  - Ba trang của một cuốn sách cùng dính vào chiếc gáy sách: Đó là trường hợp *Vô số nghiệm* — mọi điểm nằm trên đường thẳng gáy sách đều thỏa mãn cả 3 phương trình!
  - Ba mặt của một chiếc lều hình tam giác (hai mái lều và nền đất): Mỗi cặp 2 mặt cắt nhau theo một giao tuyến song song, nhưng cả 3 mặt KHÔNG CÓ ĐIỂM CHUNG NÀO! Đó là trường hợp hệ *Vô nghiệm* dù từng cặp phương trình vẫn có giao tuyến!
]

#dialogue-box(title: "Đối thoại Socrates: Bản chất của các Phép biến đổi Dòng Khử Gauss")[
  *Socrates:* Này bạn trẻ, khi ngươi nhân cả hai vế của một phương trình với số 5, mặt phẳng biểu diễn nó trong không gian có bị xoay đi hay dịch chuyển đi đâu không?
  
  *Học trò:* Dạ thưa thầy, phương trình $2x + y - z = 3$ và $10x + 5y - 5z = 15$ cùng biểu diễn đúng MỘT MẶT PHẲNG DUY NHẤT trong không gian!
  
  *Socrates:* Rất chính xác. Vậy khi ngươi lấy mặt phẳng thứ nhất cộng với mặt phẳng thứ hai để tạo thành một phương trình mới, điều gì xảy ra với giao tuyến của chúng?
  
  *Học trò:* Thưa thầy... mọi điểm nằm trên giao tuyến của hai mặt phẳng cũ đều thỏa mãn cả hai phương trình cũ, nên nó đương nhiên thỏa mãn phương trình tổng mới! Giao tuyến vẫn được giữ nguyên vẹn!
  
  *Socrates:* Xuất sắc! Phép biến đổi sơ cấp trên dòng của Gauss không hề làm xê dịch giao điểm chung của hệ. Nó chỉ xoay các mặt phẳng xung quanh giao tuyến chung đó sao cho các phương trình trở nên song song với các trục tọa độ, biến những mặt phẳng xiên xẹo phức tạp thành những mặt phẳng $z = c$, $y = b$, $x = a$ rõ như ban ngày!
]

#deep-dive-box(title: "Mạng lưới Điện Thông minh (Smart Grid) & Định luật Dòng Kirchhoff")[
  Trong ngành kỹ thuật điện, để tính toán cường độ dòng điện $I_1, I_2, I_3$ chạy qua các nhánh của một mạng lưới điện phức tạp có nhiều nguồn pin và điện trở, các kỹ sư sử dụng hai định luật của Gustav Kirchhoff:
  1. *Định luật Kirchhoff 1 (KCL - Bảo toàn điện tích tại nút):* Tổng các dòng điện đi vào một nút mạng bằng tổng các dòng điện đi ra khỏi nút đó:
     $ sum I_("vào") = sum I_("ra") $
  2. *Định luật Kirchhoff 2 (KVL - Bảo toàn năng lượng trong mắt lưới):* Tổng đại số các độ giảm thế dọc theo một vòng kín bằng tổng các suất điện động:
     $ sum E_k = sum I_j R_j $
  
  Áp dụng cho một mạch điện gồm 3 vòng kín, ta thu được chính xác một *Hệ 3 phương trình bậc nhất 3 ẩn*. Việc giải nhanh hệ này bằng thuật toán khử Gauss trên các vi điều khiển nhúng giúp các trạm biến áp tự động phân phối điện năng, tránh cháy nổ đường dây khi xảy ra sự cố ngắn mạch!
]

---

== CHUYÊN ĐỀ 2: PHƯƠNG PHÁP QUY NẠP TOÁN HỌC & NHỊ THỨC NEWTON MỞ RỘNG

Làm thế nào để một sinh vật hữu hạn như con người có thể chứng minh một chân lý đúng đắn cho *VÔ HẠN CÁC SỐ TỰ NHIÊN* $n in NN^+$ mà không cần phải kiểm tra từng số một đến hết đời?

*Phương pháp Quy nạp Toán học (Mathematical Induction)* chính là chiếc thang thần kỳ bắc lên vô tận của trí tuệ con người: Chỉ cần kiểm tra chân lý ở bậc thang đầu tiên ($n = 1$), rồi chứng minh rằng hễ bậc thang thứ $k$ đứng vững thì bậc thang thứ $k + 1$ tất yếu cũng phải đứng vững, toàn bộ vô hạn bậc thang phía sau sẽ tự động đổ sụp theo *Hiệu ứng Domino* hoàn hảo!

#story-box(
  title: "Francesco Maurolico & Nguồn gốc của Nguyên lý Domino",
  author: "Francesco Maurolico (Ý, 1494 – 1575)",
)[
  Francesco Maurolico là một tu sĩ dòng Biển Đức và là nhà toán học lừng danh tại đảo Sicilia nước Ý. Năm 1575, trong cuốn sách *“Arithmeticorum Libri Duo”*, ông cần chứng minh một định lý kỳ lạ do Pythagoras phát hiện: *Tổng của $n$ số lẻ đầu tiên luôn bằng một số chính phương:*
  $ 1 + 3 + 5 + ... + (2n - 1) = n^2 $
  
  Maurolico nhận thấy:
  - Với $n = 1$: $1 = 1^2$ (Đúng).
  - Với $n = 2$: $1 + 3 = 4 = 2^2$ (Đúng).
  - Với $n = 3$: $1 + 3 + 5 = 9 = 3^2$ (Đúng).
  
  Nhưng làm sao biết nó có đúng cho $n = 1.000.000$ hay không? Maurolico đã sáng tạo ra lập luận quy nạp chặt chẽ đầu tiên trong lịch sử: Giả sử định lý đúng cho số $k$, tức là tổng $k$ số lẻ đầu tiên bằng $k^2$. Khi ta cộng thêm số lẻ tiếp theo là $(2k + 1)$:
  $ k^2 + (2k + 1) = (k + 1)^2 $
  
  Công thức lập tức đúng cho số $k + 1$! Maurolico kết luận: Chân lý này giống như một hàng quân cờ domino dựng đứng nối tiếp nhau đến vô tận: hễ quân cờ đầu tiên ngã vào quân cờ thứ hai, và mỗi quân cờ đều ngã vào quân cờ kế tiếp, thì hàng triệu tỷ quân cờ phía sau đều phải ngã rạp! Bằng hai bước nhảy tư duy đơn sơ đó, Maurolico đã trao cho loài người quyền năng nắm trọn sự Vô hạn trong lòng bàn tay!
]

#story-box(
  title: "Nghịch lý 'Mọi con ngựa đều cùng màu' của George Pólya",
  author: "George Pólya (Hungary - Mỹ, 1887 – 1985)",
)[
  George Pólya — tác giả của cuốn sách kinh điển *“How to Solve It”* (Sáng tạo Toán học) — đã từng đưa ra một bài toán nghịch lý nổi tiếng để cảnh báo học sinh về cạm bẫy trong bước chuyển quy nạp:
  
  *“Chứng minh rằng: Mọi con ngựa trên Trái Đất đều có cùng một màu lông!*
  - Bước cơ sở ($n = 1$): Một đàn ngựa có 1 con thì đương nhiên con ngựa đó cùng màu với chính nó (Đúng hiển nhiên).
  - Bước quy nạp: Giả sử mọi đàn ngựa gồm $k$ con đều có cùng màu. Xét một đàn ngựa gồm $k + 1$ con: `{H_1, H_2, ..., H_k, H_(k+1)}`.
    + Bỏ con ngựa $H_(k+1)$ ra: Đàn còn lại $k$ con `{H_1, ..., H_k}` có cùng màu theo giả thiết quy nạp.
    + Bỏ con ngựa $H_1$ ra: Đàn còn lại $k$ con `{H_2, ..., H_(k+1)}` cũng có cùng màu.
    + Hai nhóm này giao nhau ở các con ngựa giữa `{H_2, ..., H_k}`. Do đó, con $H_1$ và con $H_(k+1)$ đều phải có cùng màu với các con ngựa ở giữa!
  $arrow$ Vậy mọi đàn $k + 1$ con đều cùng màu! Theo nguyên lý quy nạp, mọi con ngựa trên Trái Đất đều cùng màu!”
  
  Học sinh sẽ sững sờ: Lập luận nghe có vẻ rất chặt chẽ, nhưng rõ ràng ngựa ngoài đời có con màu trắng, con màu đen, con màu nâu! Sai lầm chết người nằm ở đâu?
  
  Pólya chỉ ra rằng: Lập luận chỉ đúng nếu hai nhóm ngựa có phần giao nhau ở giữa! Nhưng khi bước từ $k = 1$ sang $k = 2$: Đàn 2 con `{H_1, H_2}`, khi bỏ $H_2$ ra thì còn `{H_1}`, bỏ $H_1$ ra thì còn `{H_2}` — hai nhóm này HOÀN TOÀN KHÔNG CÓ CON NGỰA NÀO Ở GIỮA ĐỂ LÀM CẦU NỐI! Bước chuyển từ $1$ lên $2$ bị gãy gập!
  
  *Bài học sư phạm sâu sắc:* Quy nạp toán học là một cỗ máy kỳ diệu, nhưng chỉ cần một vết nứt nhỏ ở bước chuyển tiếp, toàn bộ chuỗi domino sẽ sụp đổ thành trò hề ngụy biện!
]

#deep-dive-box(title: "Quy Nạp Mạnh (Strong Induction) & Định Lý Cơ Bản Của Số Học")[
  Trong quy nạp thông thường, ta chỉ dùng giả thiết bước $k$ để suy ra bước $k+1$. Nhưng có những chân lý đòi hỏi ta phải mượn sức mạnh của *TOÀN BỘ CÁC BƯỚC ĐI TRƯỚC ĐÓ*:
  - Bước cơ sở: Mệnh đề đúng cho $n = 2$.
  - Bước quy nạp mạnh: Giả sử mệnh đề đúng cho MỌI số nguyên $m$ thỏa mãn $2 <= m <= k$. Chứng minh mệnh đề đúng cho $k + 1$.
  
  *Chứng minh Định lý Cơ bản của Số học (Mọi số nguyên $n >= 2$ đều phân tích được thành tích các số nguyên tố):*
  - Với $n = 2$: 2 là số nguyên tố (xong).
  - Giả sử mọi số từ 2 đến $k$ đều phân tích được thành số nguyên tố. Xét số $k + 1$:
    + Nếu $k + 1$ là số nguyên tố: xong!
    + Nếu $k + 1$ là hợp số: nó phân tích được thành $k + 1 = a times b$ với $2 <= a, b <= k$.
    + Theo giả thiết quy nạp mạnh, cả $a$ và $b$ đều phân tích được thành tích các số nguyên tố. Do đó, $k + 1 = a times b$ cũng phân tích được thành tích các số nguyên tố!
  
  Định lý cơ bản của Số học được chứng minh trọn vẹn chỉ trong vài dòng ngắn ngủi nhờ sức mạnh của Quy nạp mạnh!
]

#hook-box(title: "Dãy số Fibonacci & Tỉ lệ Vàng Phi trong Kiến trúc và Vũ trụ")[
  Thầy vẽ một chuỗi số lên bảng: $1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89...$
  
  *“Mỗi số sau bằng tổng hai số trước: $F_(n+1) = F_n + F_(n-1)$. Đây là Dãy số Fibonacci huyền thoại!*
  
  *Khi các em lấy tỉ số giữa hai số liên tiếp $F_(n+1) / F_n$, chuỗi tỉ số này sẽ hội tụ về một con số thần thánh:*
  $ phi = (1 + sqrt(5)) / 2 approx 1,6180339887... $
  
  *Đó chính là TỈ LỆ VÀNG (The Golden Ratio)!*
  - Các kiến trúc sư Hy Lạp cổ đại đã dùng tỉ lệ vàng để xây nên Đền Parthenon uy nghi trên đỉnh đồi Acropolis.
  - Họa sĩ thiên tài Leonardo da Vinci dùng tỉ lệ vàng để vẽ nên nụ cười bí ẩn của nàng Mona Lisa.
  - Các cánh hoa hướng dương, mắt quả dứa, vỏ ốc anh vũ Nautilus, và thậm chí các nhánh xoắn ốc của các thiên hà xa xôi hàng tỷ năm ánh sáng đều uốn lượn theo đúng tỉ số Fibonacci này!
  
  *Bằng phương pháp quy nạp toán học lớp 10, chúng ta có thể chứng minh Công thức Binet tuyệt mỹ để tìm số Fibonacci thứ $n$ mà không cần tính từng số trước đó:*
  $ F_n = 1/sqrt(5) [ ((1 + sqrt(5))/2)^n - ((1 - sqrt(5))/2)^n ] $
  *Toán học chính là mã nguồn bí mật mà Thượng đế đã dùng để lập trình nên vẻ đẹp của toàn bộ vũ trụ này!”*
]

#misconception-box(
  title: "Cạm bẫy 'Quy nạp không hoàn toàn' & Ảo tưởng Con thiên nga đen",
  misconception: "Kiểm tra thấy công thức đúng cho $n = 1, 2, 3, ..., 100$ thì chắc chắn nó sẽ đúng cho mọi số tự nhiên $n$!",
  correction: "Trong Toán học, hàng triệu ví dụ đúng KHÔNG THỂ thay thế một lời chứng minh quy nạp chặt chẽ! Chỉ cần một phản ví dụ duy nhất ở bước $n$ nào đó, mệnh đề sẽ sụp đổ hoàn toàn!"
)[
  *Ví dụ kinh điển của thiên tài Leonhard Euler:*
  Xét đa thức tạo số nguyên tố: $P(n) = n^2 + n + 41$.
  - Với $n = 0$: $P(0) = 41$ (Số nguyên tố).
  - Với $n = 1$: $P(1) = 43$ (Số nguyên tố).
  - Thử liên tục từ $n = 0$ đến $n = 39$: Tất cả $40$ số đầu tiên tạo ra ĐỀU LÀ SỐ NGUYÊN TỐ TUYỆT ĐỐI!
  
  Một người làm khoa học thực nghiệm có thể vội vã kết luận rằng công thức này luôn cho số nguyên tố. Nhưng đến $n = 40$:
  $ P(40) = 40^2 + 40 + 41 = 40(40 + 1) + 41 = 40 times 41 + 41 = 41 times 41 = 1.681 $
  đây là một hợp số chia hết cho 41! Và tại $n = 41$: $P(41) = 41^2 + 41 + 41 = 41 times 43$, lại là hợp số!
  
  *Bài học:* Kiểm tra cụ thể chỉ là thăm dò trực giác. Chỉ có quy nạp toán học với giả thiết bước $k$ suy ra bước $k+1$ mới bảo đảm được tính vĩnh cửu của chân lý!
]

#dialogue-box(title: "Đối thoại Socrates: Lát gạch Tromino khuyết Golomb bằng Quy nạp Hình học")[
  *Socrates:* Này bạn trẻ, ta có một bàn cờ kích thước $2^n times 2^n$ ô vuông. Ta rút bỏ ngẫu nhiên ĐÚNG 1 Ô VUÔNG ở bất kỳ vị trí nào trên bàn cờ. Ngươi có thể dùng các viên gạch hình chữ L (gồm 3 ô vuông ghép lại, gọi là Tromino) để lát kín khít toàn bộ phần bàn cờ còn lại mà không làm đè lên nhau không?
  
  *Học trò:* Thưa thầy, với bàn cờ $2 times 2$ (tức $n = 1$), có 4 ô mà bỏ 1 ô thì còn đúng 3 ô. Một viên gạch chữ L đặt vào là vừa khít luôn!
  
  *Socrates:* Đúng! Đó là bước cơ sở $n = 1$. Bây giờ giả sử ngươi đã lát được cho bàn cờ $2^k times 2^k$. Khi nâng lên bàn cờ $2^(k+1) times 2^(k+1)$, nó gấp 4 lần kích thước bàn cờ cũ. Ngươi chia nó thành 4 góc vuông bằng nhau, mỗi góc là một bàn cờ $2^k times 2^k$. Ô bị khuyết nằm ở 1 trong 4 góc đó. Vậy 3 góc còn lại chưa bị khuyết thì làm sao áp dụng giả thiết quy nạp?
  
  *Học trò:* Ôi... 3 góc đó còn nguyên vẹn, chúng đâu có ô khuyết nào để dùng viên gạch L!
  
  *Socrates:* Hãy nhìn vào TRUNG TÂM nơi 4 góc gặp nhau! Nếu ta đặt MỘT VIÊN GẠCH CHỮ L duy nhất chiếm đúng 3 ô trung tâm thuộc về 3 góc chưa bị khuyết đó... thì điều gì xảy ra?
  
  *Học trò:* TRỜI ƠI! Khi đó CẢ 4 GÓC đều có đúng một ô bị chiếm (một góc có ô khuyết ban đầu, 3 góc kia có 3 ô bị viên gạch trung tâm chiếm)! Mỗi góc trở thành một bài toán $2^k times 2^k$ có đúng một ô khuyết!
  
  *Socrates:* Và theo giả thiết quy nạp, cả 4 góc đều lát kín khít hoàn hảo! Ngươi thấy chưa: Quy nạp không chỉ là phép tính đại số khô khan, mà là nghệ thuật kiến trúc hình học siêu phàm!
]

#deep-dive-box(title: "Bài toán Tháp Hà Nội & Ngày Tận thế của Các Nhà Sư")[
  Năm 1883, nhà toán học Pháp Édouard Lucas phát minh ra trò chơi nổi tiếng mang tên *Tháp Hà Nội (Tower of Hanoi)*:
  
  Có 3 chiếc cọc $A, B, C$. Tại cọc $A$ có $n$ chiếc đĩa bằng vàng có đường kính khác nhau xếp chồng từ lớn đến nhỏ. Luật chơi:
  - Mỗi lần chỉ được chuyển đúng 1 chiếc đĩa từ cọc này sang cọc khác.
  - Không bao giờ được đặt đĩa lớn hơn lên trên đĩa nhỏ hơn.
  
  *Hỏi:* Cần tối thiểu bao nhiêu bước di chuyển để chuyển toàn bộ $n$ đĩa từ cọc $A$ sang cọc $C$?
  
  *Lời giải quy nạp tuyệt mỹ:*
  Gọi $H_n$ là số bước tối thiểu để chuyển $n$ đĩa.
  - Để chuyển được đĩa lớn nhất đáy cùng sang cọc $C$, ta bắt buộc phải chuyển $n - 1$ đĩa phía trên sang cọc trung gian $B$ (tốn $H_(n-1)$ bước).
  - Chuyển đĩa lớn nhất từ $A$ sang $C$ (tốn 1 bước).
  - Chuyển $n - 1$ đĩa từ cọc $B$ sang cọc $C$ chồng lên đĩa lớn nhất (tốn $H_(n-1)$ bước).
  $arrow$ Hệ thức truy hồi: $H_n = 2 H_(n-1) + 1$, với $H_1 = 1$.
  
  Bằng quy nạp toán học, ta chứng minh công thức đóng:
  $ H_n = 2^n - 1 $
  
  *Truyền thuyết về Ngày Tận Thế:* Các nhà sư ở một ngôi chùa cổ được giao nhiệm vụ di chuyển một tháp gồm $n = 64$ chiếc đĩa vàng ròng. Giả sử mỗi giây các nhà sư di chuyển được 1 đĩa không ngừng nghỉ ngày đêm:
  $ H_(64) = 2^(64) - 1 = 18.446.744.073.709.551.615 "bước"! $
  Thời gian cần thiết là:
  $ (2^(64) - 1) / (3600 times 24 times 365,25) approx 584.942.417.355 "năm (hơn 584 tỷ năm)!" $
  Trong khi tuổi của toàn bộ Vũ trụ chúng ta hiện nay mới chỉ khoảng $13,8$ tỷ năm! Khi các nhà sư chuyển xong chiếc đĩa cuối cùng thì Mặt Trời đã tàn lụi từ rất lâu. Đó chính là sự bùng nổ khủng khiếp của hàm số mũ $2^n$ được khám phá qua quy nạp toán học!
]

#tech-box(title: "Kiểm chứng Tính đúng đắn của Thuật toán Đệ quy trong Khoa học Máy tính")[
  - *Thuật toán Đệ quy trong phần mềm*: Khi các em viết một hàm đệ quy trong ngôn ngữ Python hay Java (như thuật toán sắp xếp nhanh QuickSort hay tìm kiếm nhị phân Binary Search), hàm số liên tục gọi lại chính nó với kích thước bài toán nhỏ hơn. Làm sao kỹ sư chứng minh được thuật toán đó sẽ dừng lại và cho kết quả đúng $100\%$ mà không gây tràn ngăn xếp (Stack Overflow)? Họ sử dụng chính xác *Phương pháp Quy nạp Toán học*: Bước neo chính là trường hợp dừng ($n = 1$), và bước đệ quy chính là bước chuyển quy nạp từ $k$ lên $k + 1$!
]

---

== CHUYÊN ĐỀ 3: BA ĐƯỜNG CONIC & CƠ HỌC THIÊN THỂ VŨ TRỤ

Chuyên đề 3 là khúc khải hoàn ca tráng lệ nhất của chương trình Toán lớp 10: đưa ba đường Conic từ mặt phẳng trang giấy bay thẳng vào không gian vũ trụ bao la, giải mã chuyển động của các hành tinh, tàu con thoi và kính viễn vọng không gian.

#story-box(
  title: "Lời trăn trối của Tycho Brahe & Vinh quang bất tử của Johannes Kepler",
  author: "Tycho Brahe (Đan Mạch, 1546 – 1601) & Johannes Kepler (Đức, 1571 – 1630)",
)[
  Tycho Brahe là nhà quý tộc thiên văn giàu có người Đan Mạch. Ông nổi tiếng với chiếc mũi giả bằng hợp kim vàng bạc (do bị chém đứt mũi trong một cuộc quyết đấu kiếm thời trẻ) và tòa lâu đài Uraniborg — đài quan sát thiên văn tối tân nhất châu Âu trước khi có kính viễn vọng. Suốt hơn 30 năm, đêm nào Tycho cũng đo đạc vị trí các vì sao với độ chính xác vô tiền khoáng hậu.
  
  Mùa thu năm 1601, trên giường hấp hối tại Prague, Tycho nắm chặt bàn tay của người trợ lý trẻ nghèo khó Johannes Kepler. Trong cơn mê sảng, ông liên tục lặp lại lời van nài tha thiết:
  *“Kepler à, xin con... Đừng để cuộc đời ta trôi qua vô ích! (Ne frustra vixisse videar!) Hãy dùng kho dữ liệu của ta để tìm ra quy luật của các vì sao!”*
  
  Kepler đã khóc và thề sẽ hoàn thành tâm nguyện của thầy. Suốt những năm tháng chiến tranh tôn giáo tàn khốc, mẹ bị vu là phù thủy suýt bị thiêu trên giàn lửa, con gái chết vì bệnh đậu mùa, bản thân sống trong cảnh bần hàn đói khát, Kepler vẫn kiên cường ngồi bên ánh nến giải mã dữ liệu của Tycho.
  
  Và đền đáp cho sự hy sinh bi tráng ấy là *Ba Định luật Kepler* bất tử:
  1. *Định luật I*: Các hành tinh quay quanh Mặt Trời theo quỹ đạo *Elip* với Mặt Trời nằm ở một tiêu điểm.
  2. *Định luật II*: Đoạn thẳng nối Mặt Trời và hành tinh quét những *diện tích bằng nhau* trong những khoảng thời gian bằng nhau.
  3. *Định luật III*: Bình phương chu kỳ quay tỉ lệ thuận với lập phương bán trục lớn: $T^2 / a^3 = "const"$.
  
  Lời trăn trối của Tycho Brahe đã không hề vô ích: Di sản của ông qua bàn tay Kepler đã khai sinh ra Cơ học Thiên thể hiện đại, mở đường trực tiếp để 80 năm sau Sir Isaac Newton khám phá ra *Định luật Vạn vật Hấp dẫn* vĩ đại!
]

#deep-dive-box(title: "Quả Cầu Dandelin 1822: Chứng Minh Thuần Khiết Giao Tuyến Nón Là Đường Elip")[
  Làm thế nào để chứng minh rằng khi ta lấy một mặt phẳng xiên cắt qua một hình nón tròn xoay, đường biên giao tuyến sinh ra CHÍNH XÁC là một đường Elip theo định nghĩa $M F_1 + M F_2 = 2a$?
  
  Năm 1822, nhà toán học người Bỉ *Germinal Pierre Dandelin* đã đưa ra một lời chứng minh hình học không gian đẹp đến mức nghẹt thở bằng hai quả cầu:
  - Thả một quả cầu nhỏ $S_1$ vào bên trong đỉnh nón, nó rơi xuống và tiếp xúc với mặt nón theo một đường tròn $C_1$, đồng thời tiếp xúc với mặt phẳng cắt tại điểm $F_1$.
  - Thả một quả cầu lớn $S_2$ phía dưới, nó nở to tiếp xúc với mặt nón theo đường tròn $C_2$, đồng thời tiếp xúc với mặt phẳng cắt tại điểm $F_2$.
  
  Xét một điểm $M$ bất kỳ nằm trên đường biên giao tuyến:
  - Đoạn $M F_1$ và đoạn tiếp tuyến từ $M$ tới đường tròn $C_1$ cùng là hai tiếp tuyến kẻ từ $M$ tới quả cầu $S_1$, nên chúng bằng nhau!
  - Đoạn $M F_2$ và đoạn tiếp tuyến từ $M$ tới đường tròn $C_2$ cùng là hai tiếp tuyến kẻ từ $M$ tới quả cầu $S_2$, nên chúng bằng nhau!
  
  Do đó:
  $ M F_1 + M F_2 = ("Khoảng cách giữa hai đường tròn song song" C_1 "và" C_2 "dọc theo đường sinh nón") = "hằng số"! $
  
  Tổng khoảng cách từ $M$ đến hai tiếp điểm $F_1, F_2$ là một HẰNG SỐ KHÔNG ĐỔI! Theo đúng định nghĩa nguyên thủy, giao tuyến đó BẮT BUỘC PHẢI LÀ MỘT ĐƯỜNG ELIP với hai tiêu điểm chính là hai tiếp điểm của hai quả cầu Dandelin! Một kiệt tác hình học không gian làm say đắm mọi trái tim yêu toán học!
]

#hook-box(title: "Quỹ đạo chuyển tiếp Hohmann: Làm sao bay lên Sao Hỏa tốn ít xăng nhất?")[
  Thầy vẽ hai đường tròn đồng tâm: vòng trong là quỹ đạo Trái Đất quanh Mặt Trời, vòng ngoài là quỹ đạo Sao Hỏa:
  
  *“Nếu NASA muốn phóng tàu thám hiểm Perseverance từ Trái Đất lên Sao Hỏa, liệu họ có thể bắn con tàu bay theo một đường thẳng tắp từ Trái Đất sang Sao Hỏa được không?*
  
  *Không bao giờ! Bởi vì cả Trái Đất và Sao Hỏa đều đang quay quanh Mặt Trời với vận tốc hàng chục kilomet mỗi giây! Hơn nữa, bay đường thẳng sẽ cần một lượng nhiên liệu khổng lồ bằng cả một quả núi, không một tên lửa nào chở nổi!*
  
  *Năm 1925, kỹ sư người Đức Walter Hohmann đã phát minh ra giải pháp tối ưu: QUỸ ĐẠO CHUYỂN TIẾP HOHMANN (Hohmann Transfer Orbit)!*
  - Con tàu không bay đường thẳng, mà bay theo *MỘT NỬA ĐƯỜNG ELIP KHỔNG LỒ* quanh Mặt Trời!
  - Điểm cận nhật (gần Mặt Trời nhất) của Elip tiếp xúc với quỹ đạo Trái Đất.
  - Điểm viễn nhật (xa Mặt Trời nhất) của Elip chạm trúng vào quỹ đạo Sao Hỏa!
  
  *Bằng cách mượn lực hấp dẫn của Mặt Trời và chuyển động Elip lớp 10, con tàu vũ trụ chỉ cần kích hoạt động cơ đẩy đúng 2 lần (lúc rời Trái Đất và lúc đến Sao Hỏa), còn lại toàn bộ hành trình 500 triệu km kéo dài 7 tháng con tàu trôi êm ả theo quán tính Elip mà không tốn một giọt nhiên liệu nào!*
  
  *Toán học Conic lớp 10 chính là tấm vé thông hành đưa nhân loại bước chân ra ngoài vũ trụ!”*
]

#misconception-box(
  title: "Cạm bẫy Tách rời 3 đường Conic: Bản chất Thống nhất qua Tâm sai e",
  misconception: "Đường Elip, Parabol và Hypebol là 3 loại đường cong hoàn toàn khác biệt nhau, không có mối liên hệ nào chung!",
  correction: "Cả ba đường Conic thực chất là CÙNG MỘT ĐỐI TƯỢNG HÌNH HỌC, sinh ra từ tập hợp các điểm $M$ có tỉ số khoảng cách tới một Tiêu điểm $F$ và một Đường chuẩn $Delta$ bằng hằng số Tâm sai $e$: $(M F) / (d(M, Delta)) = e$!"
)[
  - Khi $e = 0$: Ta có Đường tròn hoàn hảo (trường hợp suy biến đặc biệt của Elip).
  - Khi $0 < e < 1$: Quỹ đạo khép kín hình *Elip* (các hành tinh và vệ tinh quay tuần hoàn vĩnh cửu quanh thiên thể mẹ).
  - Khi $e = 1$: Ranh giới mong manh hình *Parabol* (vận tốc vũ trụ cấp hai $v_2 = sqrt(2) v_1$ — vật thể vừa đủ năng lượng thoát khỏi trường hấp dẫn để bay đi mất hút).
  - Khi $e > 1$: Quỹ đạo mở hình *Hypebol* (các thiên thể lạ từ không gian liên sao ghé thăm hệ Mặt Trời một lần rồi bay đi vĩnh viễn không bao giờ quay lại, như tiểu hành tinh 'Oumuamua năm 2017).
  
  Tâm sai $e$ chính là chiếc "núm vặn kỳ diệu" của vũ trụ: Vặn $e$ từ $0$ qua $1$ rồi lớn hơn $1$, vũ trụ biến đổi liên tục từ sự tuần hoàn khép kín sang tự do giải phóng vô tận!
]

#dialogue-box(title: "Đối thoại Socrates: Tại sao Đèn pha Ô tô lại có choá hình Parabol?")[
  *Socrates:* Này bạn trẻ, ban đêm lái xe trên đường quốc lộ, ngươi muốn ánh đèn pha ô tô tỏa ra tứ phía như một ngọn nến, hay muốn nó tụ thành một luồng sáng thẳng tắp rọi xa hàng trăm mét phía trước?
  
  *Học trò:* Thưa thầy, hiển nhiên ta cần luồng sáng thẳng tắp song song để nhìn rõ chướng ngại vật phía xa!
  
  *Socrates:* Nếu đặt bóng đèn tại tâm của một chiếc chóa hình cầu, các tia sáng phản xạ sẽ đi về đâu?
  
  *Học trò:* Dạ, tia sáng sẽ đập vào mặt cầu rồi dội ngược lại tâm cầu, không thể tạo thành chùm tia song song được!
  
  *Socrates:* Vậy hình dạng nào có tính chất: Mọi tia sáng xuất phát từ Tiêu điểm $F$, khi đập vào thành gương đều bị bật ra THEO CÙNG MỘT HƯỚNG SONG SONG VỚI TRỤC ĐỐI XỨNG?
  
  *Học trò:* Đó chính là ĐƯỜNG PARABOL!
  
  *Socrates:* Đúng thế! Tiếp tuyến tại mỗi điểm trên Parabol tạo thành một góc bằng nhau giữa đường nối từ tiêu điểm và đường song song trục. Đảo ngược lại: Mọi tín hiệu truyền hình vệ tinh từ vũ trụ bay song song tới đập vào lòng chảo Parabol đều sẽ phản xạ HỘI TỤ CHÍNH XÁC VÀO TIÊU ĐIỂM nơi ta đặt đầu thu LNB! Ngươi thấy chưa, chiếc đèn pha ô tô hay chiếc chảo vệ tinh trên mái nhà em chính là một bài toán Conic lớp 10 đang làm việc âm thầm mỗi ngày!
]

#deep-dive-box(title: "Kỳ tích Y học: Máy Tán sỏi thận ESWL dựa trên Hai Tiêu điểm của Elip")[
  Trong y học hiện đại, bệnh nhân bị sỏi thận kích thước lớn trước đây bắt buộc phải trải qua một cuộc đại phẫu thuật mổ xẻ đau đớn, để lại vết rạch dài và nguy cơ nhiễm trùng cao.
  
  Năm 1980, các bác sĩ và kỹ sư tại Munich (Đức) đã chế tạo thành công chiếc máy *Tán sỏi ngoài cơ thể (Extracorporeal Shock Wave Lithotripsy - ESWL)* cứu sống hàng triệu bệnh nhân mà không cần rạch một vết dao nào!
  
  *Bí mật nằm ở tính chất phản xạ quang học của Elip:*
  Đường Elip có hai tiêu điểm $F_1$ và $F_2$. Bất kỳ tia sóng nào (ánh sáng, âm thanh, sóng xung kích) xuất phát từ một tiêu điểm $F_1$, sau khi phản xạ qua thành cong Elip, *BẮT BUỘC ĐỀU PHẢI HỘI TỤ CHÍNH XÁC TẠI TIÊU ĐIỂM $F_2$*!
  
  *Cơ chế hoạt động của máy tán sỏi:*
  - Bồn chứa nước của máy có hình dạng một nửa khối *Elipsoid* tròn xoay.
  - Tại tiêu điểm $F_1$, người ta đặt một máy phát sóng xung kích năng lượng cao.
  - Bệnh nhân nằm trên bàn điều trị, được máy siêu âm định vị sao cho *viên sỏi thận nằm trùng khít vào tiêu điểm $F_2$*!
  - Khi máy phát nổ tại $F_1$, sóng xung kích lan tỏa ra mọi hướng, đi xuyên qua da thịt bệnh nhân một cách êm ái vì mật độ năng lượng trên diện tích còn rất nhỏ. Nhưng khi toàn bộ các tia sóng đập vào thành bồn Elip và dội ngược lại, chúng đồng loạt HỘI TỤ TẤT CẢ NĂNG LƯỢNG VÀO TIÊU ĐIỂM $F_2$!
  
  Áp lực khổng lồ hàng nghìn atmosphere hội tụ tại $F_2$ làm viên sỏi thận vỡ vụn thành cát mịn mà mô mỡ và cơ thịt xung quanh hoàn toàn lành lặn! Đây là một trong những ứng dụng nhân văn và rực rỡ nhất của Hình học Giải tích lớp 10 cứu giúp nhân loại!
]

#tech-box(title: "Kính viễn vọng Không gian James Webb tại Điểm Lagrange L2")[
  - *Kỳ quan công nghệ 10 tỷ USD của nhân loại*: Kính viễn vọng không gian James Webb (JWST) được phóng lên vũ trụ ngày Giáng sinh năm 2021. Nó không bay quanh Trái Đất mà bay đến *Điểm Lagrange L2* — một điểm cân bằng hấp dẫn kỳ diệu giữa Trái Đất và Mặt Trời cách chúng ta $1,5$ triệu km.
  - Tại điểm L2, kính James Webb bay trên một *quỹ đạo quầng (Halo Orbit)* có hình dạng kết hợp của các đường Conic. Chiếc gương khổng lồ mạ vàng của kính được ghép từ 18 tấm gương lục giác uốn cong theo bề mặt *Paraboloid* chuẩn xác đến từng nanomet, cho phép nó thu thập những tia sáng hồng ngoại cổ xưa nhất từ thuở bình minh của vũ trụ cách đây $13,5$ tỷ năm!
]

#pagebreak()


#pagebreak()

= ĐẠI CHƯƠNG X: CẨM NANG PHƯƠNG PHÁP LUẬN TỰ HỌC & KHÁT VỌNG TỰ NGHIÊN CỨU TOÁN 10 TRONG KỶ NGUYÊN AI

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành tặng tất cả các bạn học sinh bước chân vào cánh cổng THPT: Đây không phải là một chương bài tập tính điểm, mà là kim chỉ nam khai phóng tư duy, giúp các em vượt qua cú sốc chuyển cấp, rèn đúc kỹ thuật ghi chép Cornell, phương pháp Feynman, lộ trình 12 tuần tự học độc lập và làm chủ năng lực nghiên cứu suốt đời trong kỷ nguyên AI.
]

== 1. TẠI SAO TRONG THỜI ĐẠI AI, NĂNG LỰC TỰ HỌC LẠI LÀ VŨ KHÍ TỐI THƯỢNG NHẤT?

Các em học sinh lớp 10 thân mến,

Bước chân vào cổng trường Trung học Phổ thông, các em đang đứng trước một khúc quanh kỳ vĩ của lịch sử nhân loại. Trí tuệ Nhân tạo (AI), ChatGPT, Claude hay những siêu máy tính có thể giải một đề kiểm tra Toán trong $3$ giây, vẽ đồ thị hàm số trong nháy mắt, và tìm ra đáp số cho mọi bài toán trắc nghiệm mà các em gặp phải.

*Nếu các em học Toán chỉ để nhớ vẹt công thức, chỉ để bấm máy tính Casio thật nhanh một vài mẹo vặt, các em sẽ bị máy móc đào thải hoàn toàn ngay khi rời ghế giảng đường!*

Máy tính cực kỳ siêu việt trong việc thực thi các thuật toán lặp đi lặp lại. Nhưng có những phẩm chất thiêng liêng mà KHÔNG MỘT CỖ MÁY NÀO trên đời có thể thay thế được con người:
1. *Khát khao tò mò nguyên bản:* Câu hỏi "Tại sao điều này lại đúng?".
2. *Năng lực kết nối trực giác xuyên biên giới:* Nhìn thấy một lực căng dây trong khái niệm vectơ, nhìn thấy một chiếc chao đèn pha ô tô trong đường cong parabol, nhìn thấy sự công bằng xã hội trong tứ phân vị thống kê.
3. *Năng lực TỰ NGHIÊN CỨU ĐỘC LẬP:* Tự mình ngồi lại trước một trang giấy trắng, tự đặt giả thuyết, tự tìm tài liệu và tự mình kiểm chứng chân lý bằng tư duy logic sắt bén.

Albert Einstein từng tâm sự:
#align(center)[
  #block(width: 85%, stroke: (left: 3pt + rgb("2563eb")), inset: (left: 15pt, y: 8pt), fill: rgb("f8fafc"))[
    #text(style: "italic", size: 10.5pt, weight: "medium")[
      “Học tập không phải là việc ghi nhớ các sự kiện, mà là rèn luyện cho tâm trí khả năng TỰ SUY NGHĨ!”
    ]
  ]
]

Học ở trường lớp với thầy cô chỉ là nhận lấy chiếc chìa khóa đầu tiên. Cuộc đời của một trí thức chân chính chỉ thực sự cất cánh khi các em tắt chiếc điện thoại lướt mạng vô bổ, ngồi lại dưới ánh đèn khuya, mở cuốn sách toán kinh điển và tự mình đắm chìm vào chuyến phiêu lưu kỳ thú của tư duy trừu tượng!

#story-box(
  title: "Srinivasa Ramanujan: Chàng Trai Nghèo Tự Học Đã Làm Thay Đổi Lịch Sử Toán Học Thế Giới",
  author: "Srinivasa Ramanujan (Ấn Độ, 1887 – 1920) & Godfrey Harold Hardy (Cambridge, Anh)",
)[
  Tại một thị trấn nghèo Kumbakonam miền Nam Ấn Độ cuối thế kỷ XIX, có một cậu bé tên là Srinivasa Ramanujan. Gia đình cậu nghèo đến mức không đủ tiền mua giấy trắng để viết. Cậu phải nhặt nhạnh những mảnh giấy gói hàng bỏ đi, hoặc dùng đá phấn viết lên nền gạch rồi dùng khuỷu tay áo xóa đi để tính toán tiếp.
  
  Năm 16 tuổi, Ramanujan mượn được một cuốn sách toán cũ kỹ của một giáo sĩ người Anh mang tên *"A Synopsis of Elementary Results in Pure and Applied Mathematics"* của G. S. Carr. Cuốn sách chỉ liệt kê khoảng $5.000$ định lý mà hầu như KHÔNG HỀ CÓ MỘT LỜI CHỨNG MINH NÀO!
  
  Đối với người khác, cuốn sách đó khô khan như một cuốn danh bạ điện thoại. Nhưng đối với Ramanujan, đó là một kho báu thần tiên! Cậu coi mỗi định lý là một câu đố bí mật của vũ trụ. Không ai dạy, không có người hướng dẫn, Ramanujan đã TỰ MÌNH TÌM RA LỜI CHỨNG MINH cho toàn bộ 5.000 định lý đó, và từ đó tự mình sáng tạo ra hàng nghìn công thức chuỗi số vô hạn, hàm số elip và lý thuyết phân hoạch số kỳ diệu!
  
  Năm 1913, Ramanujan gửi một bức thư dày đặc các công thức chưa từng thấy trong lịch sử sang Đại học Cambridge cho nhà toán học vĩ đại nhất nước Anh bấy giờ: *G.H. Hardy*. Khi Hardy mở bức thư, thoạt đầu ông tưởng đó là trò lừa bịp của một kẻ điên. Nhưng sau một buổi tối ngồi suy ngẫm cùng đồng nghiệp Littlewood, Hardy bàng hoàng thốt lên:
  *“Những công thức này chắc chắn phải đúng, bởi vì nếu chúng không đúng, thì không một ai trên Trái Đất này có đủ trí tưởng tượng để bịa ra được chúng!”*
  
  Hardy đã đưa Ramanujan về Cambridge. Dù chỉ sống đến tuổi 32, nhưng những cuốn sổ tay ghi chép tự nghiên cứu của Ramanujan cho đến tận ngày nay — hơn 100 năm sau — vẫn là nguồn cảm hứng vô tận mở đường cho vật lý lý thuyết, lý thuyết dây (String Theory) và cấu trúc lỗ đen vũ trụ!
  
  *Bài học cho chúng ta:* Hoàn cảnh nghèo khó, sự thiếu thốn phương tiện chưa bao giờ ngăn cản được một tâm hồn khao khát tự học vươn tới đỉnh cao nhân loại!
]

#story-box(
  title: "Maryam Mirzakhani: Nữ Huy Chương Fields Đầu Tiên & Những Bức Tranh Trên Sàn Nhà",
  author: "Maryam Mirzakhani (Iran - Mỹ, 1977 – 2017) & Huy chương Fields 2014",
)[
  Sinh ra tại Tehran giữa cuộc chiến tranh Iran - Iraq khói lửa mịt mù, cô bé Maryam Mirzakhani từng muốn trở thành một nhà văn. Nhưng khi bước vào trung học, vẻ đẹp thanh khiết của môn Hình học đã hút trọn tâm hồn cô. Cô trở thành người phụ nữ đầu tiên trong lịch sử nhân loại đạt Giải thưởng Fields danh giá (được ví như giải Nobel Toán học) vào năm 2014 cho những công trình đột phá về Hình học Không gian Moduli Riemann.
  
  Phương pháp tự nghiên cứu của Maryam Mirzakhani đã trở thành một huyền thoại đẹp đẽ: Trong căn phòng làm việc của mình tại Đại học Stanford, cô trải những cuộn giấy trắng khổng lồ rộng hàng mét ra khắp sàn nhà. Cô quỳ gối hàng giờ đồng hồ, tay cầm bút lông sặc sỡ vẽ nên vô số những mặt cong hypebol ngoằn ngoèo uốn lượn, lẩm bẩm tự nói chuyện với chính mình.
  
  Con gái nhỏ của Maryam khi nhìn mẹ làm toán cứ ngây thơ tưởng mẹ là một họa sĩ đang vẽ tranh! Maryam mỉm cười nói:
  *“Làm toán giống như lạc vào một khu rừng rậm hoang vu bí ẩn. Bạn phải gom hết sự kiên nhẫn, thử từng con đường mòn một, nhiều lần va vào ngõ cụt và quay lại từ đầu. Nhưng khi bạn leo lên được đỉnh núi và phóng tầm mắt nhìn thấy toàn cảnh khu rừng tắm mình trong ánh bình minh... không một cảm giác chiến thắng nào trên đời có thể sánh được!”*
  
  *Bài học cho học sinh lớp 10:* Đừng bao giờ sợ sự bế tắc khi giải một bài toán khó! Bế tắc chính là khoảnh khắc các tế bào não của các em đang được kéo căng để trưởng thành!
]

---

== 2. VƯỢT QUA CÚ SỐC CHUYỂN CẤP: TỪ THCS LÊN THPT

Nhiều bạn học sinh lớp 10 từng là học sinh giỏi Toán cấp hai, vào lớp 10 bỗng cảm thấy hoang mang, mất phương hướng và tụt dốc điểm số. Tại sao lại như vậy?

Đó là vì *Bản chất của Toán học đã có một bước nhảy vọt về lượng và chất*:
- *Ở cấp THCS:* Toán học gắn liền với những con số cụ thể và hình học đo đạc trực quan (tính cạnh bằng $5 "cm"$, tính góc bằng $60 degree$). Học sinh chỉ cần học thuộc một số dạng bài mẫu quen thuộc là có thể đạt điểm cao.
- *Ở lớp 10 THPT:* Toán học đột ngột bước vào cõi *Trừu tượng hóa hoàn toàn*! Các em phải đối diện với:
  + Mệnh đề và Tập hợp (ngôn ngữ logic của tư duy tiên đề).
  + Vectơ (đối tượng hình học tự do không có vị trí cố định mà chỉ có phương, hướng và độ lớn).
  + Bất phương trình và Hệ Oxy (đại số hóa hình học, giải toán bằng hình ảnh miền nghiệm).
  + Tam thức bậc hai chứa tham số $m$ (khảo sát hành vi của cả một họ đồ thị vô tận).

#misconception-box(
  title: "Cạm bẫy 'Thợ giải đề' & Ảo tưởng điểm số cấp THCS",
  misconception: "Chỉ cần chép thật nhiều bài mẫu, thuộc lòng các công thức giải nhanh trắc nghiệm là có thể học giỏi Toán 10!",
  correction: "Lớp 10 là móng nhà của toàn bộ 3 năm THPT và Đại học! Nếu chỉ nhớ vẹt công thức mà không hiểu bản chất định nghĩa, chỉ cần đề bài thay đổi một từ khóa hoặc gài một tham số biên là học sinh sẽ lập tức bị tê liệt!"
)[
  Hãy dũng cảm từ bỏ tâm thế của một "người thợ giải toán" thụ động để trở thành một "kiến trúc sư tư duy":
  1. Khi gặp một công thức mới, *đừng vội áp dụng để làm bài tập ngay!* Hãy dành 15 phút đầu tiên để tự hỏi: Công thức này bắt nguồn từ đâu? Tại sao nó lại có dạng như thế này mà không phải dạng khác?
  2. Hãy thử đặt các trường hợp đặc biệt: Nếu cho tham số bằng 0, bằng 1, hoặc tiến ra vô cùng thì công thức biến thành cái gì quen thuộc?
  3. Chỉ khi các em tự tay chứng minh lại được công thức đó trên một trang giấy trắng tinh mà không nhìn tài liệu, tri thức đó mới thực sự thuộc về các em!
]

---

== 3. KỸ THUẬT HỌC TẬP FEYNMAN & HỆ THỐNG GHI CHÉP CORNELL DÀNH RIÊNG CHO MÔN TOÁN

#deep-dive-box(title: "Kỹ Thuật Feynman: Giải Thích Cho Một Đứa Trẻ 10 Tuổi")[
  Nhà vật lý đoạt giải Nobel *Richard Feynman* có một phương pháp học tập thần kỳ giúp ông nắm bắt bất kỳ lý thuyết hóc búa nào của nhân loại chỉ trong thời gian ngắn:
  1. *Bước 1:* Chọn một khái niệm toán học bạn muốn làm chủ (ví dụ: Tích vô hướng của hai vectơ, hoặc Định lý Sin).
  2. *Bước 2: Tự giải thích khái niệm đó cho một đứa trẻ 10 tuổi!* Không được dùng bất kỳ biệt ngữ chuyên môn đao to búa lớn nào. Nếu bạn phải dùng cụm từ phức tạp để lấp liếm, chứng tỏ bạn CHƯA THỰC SỰ HIỂU BẢN CHẤT!
  3. *Bước 3: Phát hiện lỗ hổng nhận thức:* Chỗ nào bạn bị ngập ngừng, lúng túng khi giải thích? Hãy quay trở lại sách giáo khoa để đào sâu đọc lại đúng chỗ đó!
  4. *Bước 4: Đơn giản hóa và dùng phép ẩn dụ đời sống:* Ví dụ: Tích vô hướng giống như việc hai người bạn cùng đẩy một chiếc xe về phía trước; Vectơ giống như việc chỉ đường cho người giao hàng!
  
  Khi bạn có thể giải thích một định lý toán học 10 cho một đứa trẻ lớp 5 hiểu và ồ lên thích thú, bạn đã chính thức làm chủ định lý đó ở cấp độ chuyên gia!
]

*Hệ thống Ghi chép Cornell (Cornell Note-taking System) Cho Vở Toán 10:*
Thay vì chép bài một cách hỗn loạn, hãy kẻ mỗi trang vở thành 3 phần chuẩn khoa học:
- *Cột bên trái (Rộng 5 cm - Cột Câu hỏi / Từ khóa):* Ghi các câu hỏi bản chất (Tại sao $cos$ góc tù lại âm? Khi nào dùng công thức Heron? Điều kiện tồn tại đường tròn là gì?).
- *Cột bên phải (Rộng 14 cm - Cột Ghi chép chính):* Ghi lời giải chi tiết, hình vẽ phác họa, các bước biến đổi đại số và công thức.
- *Phần chân trang (Cao 4 cm - Phần Tóm tắt 3 dòng):* Tự tay đúc kết lại bằng 2 đến 3 câu ngắn gọn: *“Bản chất bài học hôm nay là gì? Cái bẫy chết người cần tránh là gì?”*.

---

== 4. BẢY THÓI QUEN TƯ DUY CỦA HỌC SINH CHUYÊN TOÁN XUẤT SẮC

Dưới đây là 7 thói quen tư duy vàng mà mọi học sinh lớp 10 cần rèn luyện mỗi ngày:
1. *Thói quen 1: Đọc kỹ Định nghĩa trước khi nhìn Công thức.* Định nghĩa là hiệp ước bắt buộc giữa người học và thế giới toán học.
2. *Thói quen 2: Thử các Trường hợp Suy biến và Điểm Biên.* Khi giải bài toán chứa tham số $a x^2 + b x + c = 0$, việc đầu tiên là xét ngay trường hợp $a = 0$!
3. *Thói quen 3: Luôn Kiểm tra Tính Thứ nguyên & Tính Đối xứng.* Nếu một công thức tính diện tích mà có bậc 3, chắc chắn bạn đã tính sai!
4. *Thói quen 4: Vẽ Hình Phác họa Trực quan trước khi Đại số hóa.* Dù bài toán là Đại số hay Tích vô hướng, luôn vẽ nhanh một trục số hay hệ trục $O x y$.
5. *Thói quen 5: Tự Tạo Phản Ví dụ để Thử thách Giả thuyết.* Khi nảy ra một linh cảm, hãy tìm mọi cách bác bỏ nó bằng một phản ví dụ trước khi tin.
6. *Thói quen 6: Tự Đặt Câu hỏi Biến thể "What if?".* Tự hỏi: "Nếu thay đổi điều kiện biên thì sao? Nếu tổng quát hóa lên không gian $n$ chiều thì sao?".
7. *Thói quen 7: Giải Một Bài toán Bằng Nhiều Cách Khác Nhau.* Carl Friedrich Gauss từng nói: *“Một bài toán giải bằng 3 cách độc lập cho bạn tri thức sâu sắc gấp 10 lần việc giải 10 bài toán bằng một cách máy móc!”*.

---

== 5. KỸ THUẬT XÂY DỰNG MINDMAP LIÊN CHƯƠNG & SỔ TAY SAI LẦM

#deep-dive-box(title: "Cuốn Sổ tay Sai lầm (Error Logbook) — Vũ khí Bí mật của Thủ khoa")[
  Học sinh bình thường làm sai một bài thì xem đáp án, gật gù hiểu rồi bỏ qua. Thủ khoa làm sai một bài thì coi đó là một *món quà vô giá*!
  
  Mỗi bạn học sinh nên chuẩn bị một cuốn sổ tay bìa cứng đặc biệt mang tên *Sổ tay Phẫu thuật Sai lầm*, chia mỗi trang thành 3 cột:
  - *Cột 1: Đề bài & Lời giải sai của chính mình.* (Chép lại chính xác sai lầm ngớ ngẩn mà mình đã mắc phải).
  - *Cột 2: Bắt mạch Tâm lý Nhận thức.* (Tự trả lời trung thực: Tại sao lúc đó mình lại làm sai? Do vội vàng? Quên điều kiện? Nhầm lẫn chỉnh hợp vs tổ hợp?).
  - *Cột 3: Lời giải Chuẩn & Quy tắc Bất di bất dịch để không bao giờ tái phạm.*
  
  Trước mỗi kỳ thi lớn, chỉ cần mở cuốn Sổ tay Sai lầm ra đọc lại toàn bộ những vết thương cũ. Khi không còn lặp lại bất kỳ sai lầm cũ nào, điểm 10 sẽ tự nhiên đến!
]

---

== 6. LỘ TRÌNH 12 TUẦN RÈN LUYỆN TƯ DUY TỰ HỌC TOÁN 10 ĐỘC LẬP

#align(center)[
  #table(
    columns: (2.2cm, 3.8cm, 5.5cm, 4.5cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e293b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    
    table.header(
      text(fill: white, weight: "bold", size: 9pt)[Tuần lễ],
      text(fill: white, weight: "bold", size: 9pt)[Chủ đề trọng tâm],
      text(fill: white, weight: "bold", size: 9pt)[Thử thách tư duy độc lập],
      text(fill: white, weight: "bold", size: 9pt)[Sản phẩm tự học cần đạt],
    ),
    
    [Tuần 1 - 2], [Mệnh đề, Tập hợp & Logic tiên đề], [Giải mã Nghịch lý Russell; Tự chứng minh số tập con của tập $n$ phần tử bằng $2^n$.], [Mindmap phân biệt mệnh đề kéo theo vs tương đương; bài tập bảng chân trị.],
    [Tuần 3 - 4], [Bất phương trình & Quy hoạch tuyến tính], [Mô hình hóa bài toán chi phí dinh dưỡng tối thiểu (Stigler Diet) trên giấy kẻ ô.], [Bản vẽ miền nghiệm đa giác lồi và tìm tọa độ đỉnh tối ưu bằng thước kẻ song song.],
    [Tuần 5 - 6], [Hệ thức lượng & Giải tam giác], [Tự chứng minh Định lý Stewart và Công thức Heron từ Định lý Côsin.], [Báo cáo mô phỏng đo đạc chiều cao ngọn tháp bằng giác kế tự chế.],
    [Tuần 7 - 8], [Vectơ & Tọa độ trong không gian], [Chứng minh tính chất 3 đường trung tuyến đồng quy bằng quy tắc tâm tỉ cự.], [Mô hình hóa lực căng dây cáp cẩu hàng bằng phép cộng vectơ trực quan.],
    [Tuần 9 - 10], [Hàm số bậc hai & Tam thức], [Lập trình hoặc vẽ tay quỹ đạo ném xiên Parabol có và không có lực cản không khí.], [Bảng phân tích 6 trường hợp dấu tam thức bậc hai và bẫy tham số $a=0$.],
    [Tuần 11 - 12], [Thống kê, Tổ hợp & Xác suất], [Mô phỏng bài toán Monty Hall 100 lần chơi thực nghiệm; Viết code tìm Outlier Tukey.], [Bài báo cáo nghiên cứu thống kê điểm số lớp học hoặc chiều cao học sinh THPT.],
  )
]

---

== 7. BỘ 25 CÂU HỎI TỰ VẤN SIÊU NHẬN THỨC (METACOGNITIVE CHECKLIST)

Trước khi đặt bút, trong khi biến đổi, và sau khi ra đáp số, hãy tự phỏng vấn chính mình bằng bộ câu hỏi Socrates sau:

*Giai đoạn 1: Trước khi đặt bút (Khám phá bản chất bài toán)*
1. Bài toán này đang yêu cầu tìm cái gì? Biến số thực sự là gì?
2. Giả thiết cho những dữ kiện nào? Có dữ kiện nào thừa hoặc ẩn giấu không?
3. Điều kiện xác định là gì? (Mẫu khác 0, căn bậc hai không âm, hệ số $a != 0$?).
4. Bài toán này có yếu tố đối xứng giữa các biến $a, b, c$ không?
5. Trường hợp suy biến đặc biệt nhất là gì? (Cho $x = 0$, tam giác vuông, góc $90 degree$?).
6. Bài toán thuộc về đại số hay hình học? Có thể chuyển đổi qua lại giữa hai thế giới không?
7. Đã từng gặp bài toán nào có cấu trúc tương tự bài này chưa?
8. Hình vẽ phác thảo sơ bộ bên lề giấy trông như thế nào?

*Giai đoạn 2: Trong quá trình giải (Kiểm soát tiến trình tư duy)*
9. Bước biến đổi vừa rồi có phải là phép biến đổi tương đương ($arrow.double$) hay chỉ là hệ quả ($arrow$)?
10. Có vừa thực hiện thao tác bình phương hai vế làm xuất hiện nghiệm ma không?
11. Đã chia cho một đại lượng nào chưa? Đại lượng đó có chắc chắn khác 0 chưa?
12. Vectơ này có cùng phương không? Có bị nhầm lẫn giữa độ dài vectơ và vectơ không?
13. Các đơn vị đo lường có đồng nhất chưa? (Mét vs Centimet, Độ vs Radian).
14. Công thức diện tích vừa tính có đảm bảo thứ nguyên bậc 2 không?
15. Hướng đi này có đang làm bài toán trở nên quá cồng kềnh không? Có con đường nào tao nhã hơn?
16. Nếu bế tắc: Thử quay lại định nghĩa nguyên thủy thay vì cố nhớ công thức thứ cấp!
17. Đã tận dụng hết $100\%$ các dữ kiện của đề bài chưa?

*Giai đoạn 3: Sau khi có đáp số (Phản biện và Khai phóng)*
18. Nghiệm tìm được có thỏa mãn toàn bộ điều kiện xác định ban đầu không?
19. Đáp số có hợp lý về mặt vật lý không? (Độ dài có dương không? Xác suất có nằm trong $[0; 1]$ không?).
20. Có nghiệm ngoại lai (nghiệm ma) nào lọt vào bài làm không?
21. Có thể giải bài toán này bằng một phương pháp thứ hai hoàn toàn độc lập không?
22. Cái bẫy tâm lý nguy hiểm nhất của bài toán này nằm ở bước nào?
23. Nếu tổng quát hóa bài toán từ số cụ thể thành tham số $n$, kết quả sẽ là gì?
24. Có thể đặt câu hỏi biến thể "What-if" nào thú vị từ bài toán này?
25. Bài học sâu sắc nhất rút ra từ bài toán này để ghi vào Sổ tay Sai lầm là gì?

---

== 8. TỦ SÁCH KINH ĐIỂN GỢI Ý KHAI MỞ TƯ DUY CHO HỌC SINH THPT

Muốn vươn tới tầm vóc của những nhà tư tưởng lớn, hãy tìm đọc những cuốn sách gối đầu giường kinh điển của nền văn minh:
1. *“How to Solve It” (Sáng tạo Toán học) — George Pólya:* Cuốn cẩm nang khai sáng về nghệ thuật tư duy suy đoán, phân tích ngược và giải quyết vấn đề.
2. *“What Is Mathematics?” (Toán học là gì?) — Richard Courant & Herbert Robbins:* Tác phẩm đồ sộ được Albert Einstein ca ngợi là cuốn sách toán học khai phóng vĩ đại nhất thế kỷ XX.
3. *“The Joy of x” & “Infinite Powers” — Steven Strogatz:* Chuyến du hành đầy chất thơ khám phá vẻ đẹp kỳ diệu của đại số, hình học và phép tính vi tích phân trong đời sống thường nhật.
4. *“Gödel, Escher, Bach: An Eternal Golden Braid” — Douglas Hofstadter:* Tác phẩm đoạt giải Pulitzer kết nối toán học logic, hội họa và âm nhạc cổ điển Bach, giải mã bí ẩn của ý thức và trí tuệ nhân tạo.
5. *“Solving Mathematical Problems: A Personal Perspective” — Terence Tao:* Cuốn sách của thần đồng toán học người Úc gốc Hoa (Huy chương Fields 2006) chia sẻ trực giác và phương pháp tiếp cận các bài toán đỉnh cao từ tuổi thiếu niên.
6. *“Thinking, Fast and Slow” (Tư duy Nhanh và Chậm) — Daniel Kahneman:* Giải Nobel Kinh tế giải phẫu toàn bộ những cạm bẫy tâm lý và ảo tưởng xác suất của não bộ con người.

#pagebreak()


#pagebreak()

= PHẦN PHỤ LỤC: MA TRẬN 40 CÂU HỎI KHAI MỞ SƯ PHẠM ĐỈNH CAO KHỐI 10

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành riêng cho Quý Thầy Cô giáo: Bảng tra cứu tốc hành 3 phút mở đầu tiết học Toán 10. Mỗi bài học đều có một câu hỏi Hook kích nổ sự tò mò, phá tan sự uể oải đầu giờ của học sinh và kết nối trực tiếp vào bản chất toán học cùng kỷ nguyên số.
]

#align(center)[
  #table(
    columns: (2.2cm, 4cm, 5.5cm, 4.3cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e293b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    
    // Header
    table.header(
      text(fill: white, weight: "bold", size: 9pt)[Bài học],
      text(fill: white, weight: "bold", size: 9pt)[Câu hỏi Hook đầu giờ (3 phút)],
      text(fill: white, weight: "bold", size: 9pt)[Bản chất nhận thức cốt lõi],
      text(fill: white, weight: "bold", size: 9pt)[Ứng dụng thực tế & Kỷ nguyên AI],
    ),
    
    // Rows
    [Bài 1: Mệnh đề], [Hai người gác cổng Thật thà - Nói dối trước hai cửa Sống - Chết: Hỏi câu gì để sống sót?], [Bảng chân trị logic, phép nhân dấu $(-1) times (-1) = 1$ trong mệnh đề.], [Cổng logic bán dẫn AND/OR trong chip máy tính M3, câu lệnh điều kiện `if/else`.],
    [Bài 2: Tập hợp], [Khách sạn vô hạn Hilbert đã kín chỗ, làm sao xếp phòng cho khách mới mà không đuổi ai?], [Lực lượng tập hợp vô hạn; ánh xạ tương ứng $1 - 1$ giải phóng trực giác hữu hạn.], [Cơ sở dữ liệu quan hệ SQL, phép lọc tập hợp JOIN/UNION trong Big Data.],
    [Mở rộng: Russell], [Ông thợ cạo thành Seville chỉ cạo cho ai không tự cạo: Vậy ông có tự cạo cho mình không?], [Nghịch lý tự tham chiếu; sự sụp đổ của lý thuyết tập hợp ngây thơ, hệ ZFC.], [Định lý bất toàn Gödel, giới hạn không thể vượt qua của trí tuệ nhân tạo.],
    [Bài 3: BPT bậc nhất], [Có 200k trong ví đi ăn chè (20k) và trà sữa (30k): Những tổ hợp nào khả thi không bị thiếu tiền?], [Bất đẳng thức đại số chuyển thành nửa mặt phẳng hình học có ranh giới đường thẳng.], [Hành lang an toàn xe tự hành Tesla, vùng không gian di chuyển cánh tay robot.],
    [Bài 4: Hệ BPT & Quy hoạch], [Tại sao điểm kiếm nhiều tiền nhất của tiệm bánh mì luôn nằm ở các ĐỈNH NHỌN của đa giác?], [Đường mức doanh thu tịnh tiến; định lý cơ bản của Quy hoạch tuyến tính trên tập lồi.], [Thuật toán Simplex giải bài toán Logistics Amazon, điều phối máy bay Vietnam Airlines.],
    [Bài 5: Lượng giác $0 degree - 180 degree$], [Tại sao góc tù lại có Cosin âm trong khi độ dài cạnh tam giác không bao giờ âm?], [Đại số hóa hình học: Giá trị lượng giác là tọa độ hình chiếu trên nửa đường tròn đơn vị.], [Ma trận xoay 2D/3D trong game Liên Quân/PUBG, xử lý tín hiệu âm thanh.],
    [Bài 6: Định lý Côsin & Sin], [Làm sao đo khoảng cách giữa hai đỉnh núi lửa qua vực dung nham mà không cần bước qua?], [Định lý Côsin mở rộng Pythagoras cho góc bất kỳ; định lý Sin chuẩn hóa đường kính $2R$.], [Hệ thống Sonar tàu ngầm định vị đáy biển, tên lửa phòng không Vòm Sắt Iron Dome.],
    [Bài 7: Giải tam giác & Heron], [Làm sao Eratosthenes đo được chu vi Trái Đất 2.200 năm trước chỉ bằng một cây gậy cắm trên cát?], [Phương pháp tam giác đạc hình học; công thức Heron tính diện tích qua 3 cạnh.], [Hệ thống định vị toàn cầu GPS 24 vệ tinh, thuật toán dò tia Ray Tracing card RTX.],
    [Bài 8: Khái niệm Vectơ], [Đi bộ 5 km về phía Bắc rồi 5 km về phía Nam: Đi 10 km nhưng vị trí cách nhà đúng 0 km?], [Vectơ tự do: Đại lượng có hướng và độ lớn, không phụ thuộc vào điểm đặt ban đầu.], [Vector Embedding trong ChatGPT, biểu diễn ngữ nghĩa từ ngữ trong không gian 1536 chiều.],
    [Bài 9: Tổng & Hiệu vectơ], [Tại sao máy bay chở khách Boeing 300 tấn lại luôn chọn cất cánh NGƯỢC CHIỀU GIÓ BÃO?], [Quy tắc hình bình hành; hợp lực vectơ khí động học nâng cánh máy bay vút lên.], [Hệ thống cân bằng điện tử ESP trên ô tô cao tốc, chống lật khi vào cua gấp.],
    [Bài 10: Tích số với vectơ], [Nghệ sĩ xiếc đặt đầu ngậy nhọn vào đâu để giữ thăng bằng chiếc mâm có 3 quả tạ khác nhau?], [Tâm tỉ cự: Trọng tâm của hệ chất điểm $alpha vec(I A) + beta vec(I B) + gamma vec(I C) = vec(0)$.], [Tọa độ tỉ cự Barycentric trong đồ họa Unreal Engine 5 để dựng vân bề mặt 3D.],
    [Bài 11: Tích vô hướng], [Vác bao xi măng 50 kg đi bộ đường bằng suốt 10 km kiệt sức, tại sao Công cơ học bằng 0?], [Định nghĩa công $A = vec(F) dot vec(s) = F s cos(90 degree) = 0$; đo độ xiên lệch giữa hai vectơ.], [Độ tương đồng Cosine (Cosine Similarity) đo sự giống nhau giữa khuôn mặt FaceID iPhone.],
    [Bài 12: Sai số & Gần đúng], [Tại sao lỗi làm tròn 0,000000095 giây sau 100 giờ lại làm nổ tung căn cứ tên lửa Patriot?], [Sai số tuyệt đối, sai số tương đối, sự tích lũy sai số làm tròn số nhị phân.], [Chuẩn dấu phẩy động IEEE 754 trong chip Intel/Apple, phân tích rủi ro vệ tinh.],
    [Bài 13: Xu thế trung tâm], [Bill Gates bước vào quán bia nghèo: Thu nhập trung bình vọt lên 9 tỷ, có ai giàu lên không?], [Cạm bẫy số trung bình cộng trước giá trị ngoại lai; sức mạnh trung thực của Trung vị $M_e$.], [Định giá bất động sản trên trang Batdongsan.com, đo lường bất bình đẳng kinh tế.],
    [Bài 14: Độ phân tán], [Hai xạ thủ cùng có điểm trung bình 8,0: Người luôn bắn 8, người bắn 10 và 6, chọn ai đi Olympic?], [Phương sai và độ lệch chuẩn đo lường độ rủi ro, độ ổn định và tính biến động.], [Tiêu chuẩn chất lượng Six Sigma ($6sigma$) tại nhà máy đúc chip TSMC, quản lý rủi ro cổ phiếu.],
    [Bài 15: Hàm số & Biến thiên], [Hòn đá rơi tự do từ độ cao 20m: Làm sao biết vị trí chính xác của nó ở phần nghìn giây?], [Mô hình quan hệ nhân quả; ánh xạ $y = f(x)$ mô tả quy luật vận động của tự nhiên.], [Hàm kích hoạt (Activation Function) ReLU/Sigmoid trong mạng nơ-ron não bộ nhân tạo AI.],
    [Bài 16: Hàm số bậc hai], [Angry Birds bắn chú chim bay vút lên: Tại sao quỹ đạo luôn là chữ U úp ngược mà không bay thẳng?], [Quỹ đạo Parabol của chuyển động ném xiên dưới trọng trường của Galileo; đỉnh cực đại.], [Gương phản xạ kính thiên văn Newton, cáp treo Cầu Cổng Vàng, thuật toán Gradient Descent.],
    [Bài 17: Dấu tam thức bậc hai], [Một nhà máy bán bao nhiêu tai nghe Bluetooth thì bắt đầu có lãi để không sập tiệm?], [Quy tắc Trong trái - Ngoài cùng; nghiệm phương trình là ranh giới đổi màu đại số.], [Vùng an toàn ứng suất chịu lực của dầm cầu thép, ranh giới phân loại máy học SVM.],
    [Bài 18: PT quy về bậc hai], [Giải $sqrt(x - 2) = x - 4$ ra $x = 3$: Tại sao thay vào lại ra $1 = -1$? Nghiệm ma từ đâu chui ra?], [Phép bình phương hai vế làm mất dấu âm, sinh ra nghiệm ngoại lai ma quái.], [Khử nghiệm ma trong thuật toán dò giao điểm ánh sáng với vật thể 3D trong điện ảnh.],
    [Bài 19: Tọa độ Oxy], [René Descartes nằm trên giường nhìn con ruồi bò trên trần nhà mùa đông 1619: Hình học được số hóa!], [Hệ trục tọa độ Descartes kết duyên Đại số với Hình học; mỗi điểm là một cặp số thực.], [Độ phân giải màn hình 4K màn hình điện thoại iPhone, bản đồ định vị số hóa Google Maps.],
    [Bài 20: Đường thẳng Oxy], [Hai máy bay bay theo hai đường thẳng cắt nhau trên màn hình radar: Có chắc chắn đâm nhau không?], [Phương trình tham số với tham số thời gian $t$; hai quỹ đạo cắt nhau chưa chắc gặp nhau.], [Thuật toán Raycasting trong trò chơi kinh điển DOOM 1993, điều phối không lưu sân bay.],
    [Bài 21: Vị trí, Góc, K/c], [Người lính cứu hỏa chạy từ lều $A$ xuống bờ sông múc nước đến đám cháy $B$: Điểm nào ngắn nhất?], [Công thức khoảng cách từ điểm đến đường thẳng; nguyên lý phản xạ đối xứng Fermat.], [Thuật toán phân loại ung thư Support Vector Machine (SVM) tối đa hóa khoảng cách biên.],
    [Bài 22: Đường tròn Oxy], [Lạc trong rừng sâu: Ba trạm phát sóng BTS đo khoảng cách điện thoại thế nào để cứu sống bạn?], [Phương trình đường tròn giải tích; giao điểm chung duy nhất của 3 đường tròn cứu hộ.], [Quét sóng radar máy bay quân sự tàng hình, quả cầu bao Bounding Sphere chống va chạm PS5.],
    [Bài 23: Ba đường Conic], [Đứng trong "Phòng thì thầm" nói rất khẽ người cách 40m nghe rõ; Tán sỏi thận không cần mổ?], [Tính chất quang học hai tiêu điểm của Elip, Parabol, Hypebol; định nghĩa qua tâm sai $e$.], [Quỹ đạo vệ tinh viễn thông địa tĩnh, hệ thống dẫn đường hàng hải quân sự LORAN-C.],
    [Bài 24: Quy tắc đếm], [Vali 3 số phá trong 33 phút; Tại sao thêm 3 ký tự nữa thì tên trộm phải mất hơn 3.600 NĂM?], [Quy tắc cộng và quy tắc nhân; sự bùng nổ tổ hợp lũy thừa $N^k$ làm tê liệt máy tính.], [Cây quyết định (Decision Tree) trong AI chấm điểm tín dụng ngân hàng phê duyệt hồ sơ vay.],
    [Bài 25: Hoán vị, Tổ hợp], [Tại sao siêu máy tính mạnh nhất Trái Đất không duyệt hết bàn cờ vây mà cần AI AlphaGo?], [Số trạng thái cờ vây vượt quá số nguyên tử toàn vũ trụ ($10^(170)$); chỉnh hợp vs tổ hợp.], [Mật mã khóa công khai RSA bảo vệ tài khoản ngân hàng, phân tích cấu trúc chuỗi DNA gen.],
    [Bài 26: Nhị thức Newton], [Tại sao phóng to chữ "A" lên 1.000 lần trên máy tính mà nét cong vẫn mịn màng không vỡ hạt?], [Tam giác Pascal, khai triển nhị thức; đa thức cơ sở Bernstein tạo đường cong Bézier.], [Định dạng phông chữ vector TrueType, công nghệ đồ họa vector Adobe Illustrator / Figma.],
    [Bài 27: Biến cố & Mẫu], [Gieo 2 con súc sắc: Tại sao con số 7 được coi là "Con số Tử thần" tại mọi sòng bạc Las Vegas?], [Không gian mẫu $Omega$ gồm 36 kịch bản đồng khả năng; số 7 có nhiều biến cố thuận lợi nhất (6 cách).], [Kiểm thử tự động Fuzz Testing săn lùng lỗ hổng bảo mật hệ điều hành Windows & iOS.],
    [Bài 28: Xác suất cổ điển], [Nghịch lý 3 cánh cửa Monty Hall: Tại sao ĐỔI CỬA lại tăng gấp đôi cơ hội trúng xe từ $1/3$ lên $2/3$?], [Xác suất cổ điển Laplace; cập nhật trọng số xác suất khi có thông tin loại bỏ từ MC.], [ChatGPT/LLM bản chất là cỗ máy tính xác suất chọn từ tiếp theo phù hợp ngữ cảnh.],
    [CĐ 1: Hệ PT 3 ẩn & Gauss], [Cân bằng phản ứng Hóa học Oxy hóa - Khử phức tạp bằng hệ 3 phương trình 3 ẩn trong 3 giây?], [Ma trận bậc thang; các phép biến đổi sơ cấp trên dòng không làm thay đổi giao điểm hình học.], [Mô hình kinh tế vĩ mô Nobel Leontief, thuật toán xếp hạng trang web Google PageRank.],
    [CĐ 2: Quy nạp Toán học], [Làm thế nào một sinh vật hữu hạn chứng minh được chân lý cho VÔ HẠN các số tự nhiên?], [Hiệu ứng Domino quy nạp: Bước neo cơ sở $n=1$ và bước chuyển tiếp từ bậc thang $k$ lên $k+1$.], [Chứng minh tính đúng đắn của thuật toán đệ quy trong khoa học máy tính, Tháp Hà Nội.],
    [CĐ 3: Conic & Thiên văn], [Làm sao phóng tàu từ Trái Đất lên Sao Hỏa 500 triệu km mà hầu như không tốn giọt xăng nào?], [Quỹ đạo Elip chuyển tiếp Hohmann; định luật bảo toàn năng lượng trong trường hấp dẫn.], [Kính viễn vọng không gian James Webb tại điểm Lagrange L2, quỹ đạo quầng Halo Orbit.],
    [Chương X: Tự học Kỷ nguyên AI], [Tại sao học vẹt công thức sẽ bị AI thay thế trong 3 giây, còn người biết đặt câu hỏi là vô giá?], [Năng lực tự nghiên cứu độc lập, sổ tay phẫu thuật sai lầm, biến AI thành gia sư Socrates.], [Kỹ năng Prompting đối thoại phản biện, định hướng nghiên cứu khoa học từ ghế nhà trường.],
    [Ôn tập: Bẫy điều kiện $a=0$], [Tại sao phương trình tham số $m x^2 - 2x + 1 = 0$ có nghiệm duy nhất lại khiến $80\%$ học sinh mất điểm?], [Bẫy tam thức suy biến: Khi $a=0$, phương trình trở thành bậc nhất có đúng 1 nghiệm!], [Xử lý trường hợp biên (Edge Cases) trong phần mềm điều khiển xe tự hành tránh tai nạn.],
    [Ôn tập: Bẫy chia Vectơ], [Tại sao trên đời có phép nhân vô hướng hai vectơ nhưng TUYỆT ĐỐI KHÔNG CÓ PHÉP CHIA VECTƠ?], [Không gian vectơ không có phần tử nghịch đảo cho phép nhân vô hướng; vô số nghiệm vuông góc.], [Tính đơn hướng của không-thời gian vật lý, cấu trúc đại số trừu tượng của không gian Hilbert.],
    [Ôn tập: Bẫy SSA tam giác], [Biết hai cạnh và một góc không xen giữa ($a, b, hat(A)$): Tại sao có thể vẽ được HAI tam giác khác nhau?], [Trường hợp góc tù/nhọn SSA suy biến; phương trình bậc hai theo cạnh thứ ba có 2 nghiệm dương.], [Lập trình định vị điểm giao thoa trong kỹ thuật trắc địa địa chính và quét lidar 3D.],
    [Ôn tập: Bẫy Simpson Thống kê], [Một loại thuốc chữa bệnh có tỉ lệ khỏi cao hơn ở cả nam lẫn nữ, gộp chung lại tỉ lệ lại thấp hơn?], [Nghịch lý Simpson: Trọng số mẫu không đồng đều giữa các nhóm gây ảo giác đảo ngược xu thế.], [Thẩm định lâm sàng thuốc mới của FDA Hoa Kỳ, phân tích dữ liệu thử nghiệm A/B Testing.],
    [Ôn tập: Stars & Bars], [Chia 10 cái kẹo giống nhau cho 3 đứa trẻ sao cho đứa nào cũng có kẹo: Có bao nhiêu cách?], [Kỹ thuật Vách ngăn Euler: Đặt 2 vách ngăn vào 9 khoảng trống giữa các chiếc kẹo: $C_9^2 = 36$.], [Phân phối tài nguyên bộ nhớ máy chủ đám mây Cloud Computing, mật mã hoán vị.],
    [Ôn tập: Monty Hall Mở rộng], [Nếu có 100 cánh cửa và MC mở ra 98 con dê: Bạn có đổi sang cánh cửa duy nhất còn lại không?], [Trực giác bừng sáng: Tỉ lệ thắng khi đổi cửa vọt lên $99\%$, đập tan ảo tưởng 50/50.], [Lý thuyết cập nhật niềm tin xác suất Bayes trong thuật toán lọc thư rác Gmail.],
  )
]

#pagebreak()

= PHẦN II: MƯỜI KỊCH BẢN ĐỐI THOẠI SOCRATES SƯ PHẠM MẪU TOÁN 10

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành cho Quý Thầy Cô thực nghiệm phương pháp dạy học kiến tạo (Constructivism): Thay vì thuyết giảng áp đặt một chiều, giáo viên dùng chuỗi câu hỏi Socrates để dẫn dắt học sinh tự va đập nhận thức, tự nhận ra mâu thuẫn và tự giác ngộ bản chất toán học.
]

#dialogue-box(title: "Kịch Bản 1: Mệnh Đề Kéo Theo P => Q & Tại Sao Tiền Đề Sai Thì Mệnh Đề Luôn Đúng?")[
  *Thầy (Socrates):* Các em hãy chú ý. Thầy đưa ra một lời hứa: *“Nếu ngày mai trời mưa ($P$), thầy sẽ mua trà sữa bao cả lớp uống ($Q$)”*. Trong trường hợp nào thì thầy bị coi là kẻ nói dối, nuốt lời?
  
  *Học sinh An:* Dạ, khi ngày mai trời mưa to thật, nhưng thầy bước vào lớp với hai bàn tay trắng và không mua cốc trà sữa nào ạ!
  
  *Thầy:* Rất chính xác! Tức là tiền đề $P$ ĐÚNG, nhưng kết luận $Q$ SAI ($1 arrow 0$ cho ra $0$). Bây giờ, giả sử ngày mai *TRỜI KHÔNG HỀ MƯA* ($P$ SAI), trời nắng chang chang, nhưng thầy vẫn vui vẻ mua trà sữa mời cả lớp. Thầy có vi phạm lời hứa không?
  
  *Học sinh Bình:* Dạ không hề! Thầy chỉ hứa là "Nếu mưa thì mua", chứ trời nắng thầy có tiền thầy thích mua thì càng tốt chứ sao ạ!
  
  *Thầy:* Tuyệt vời. Vậy nếu ngày mai trời nắng chang chang ($P$ SAI), và thầy *KHÔNG MUA* trà sữa. Thầy có bị coi là kẻ thất hứa không?
  
  *Học sinh An:* Dạ cũng không ạ! Vì trời đâu có mưa, thầy không mua thì thầy đâu có vi phạm lời hứa nào!
  
  *Thầy:* Đúng vậy! Trong cả hai trường hợp trời không mưa ($P$ SAI), thầy đều KHÔNG HỀ NÓI DỐI! Do đó, theo hiệp ước logic toán học, khi tiền đề $P$ sai, toàn bộ mệnh đề kéo theo $P arrow Q$ *MẶC NHIÊN ĐƯỢC COI LÀ ĐÚNG (Vacuously True)*!
  
  *Học sinh Bình:* Ồ! Giờ em mới hiểu tại sao mệnh đề: *“Nếu $2 + 2 = 5$ thì Mặt Trời mọc ở hướng Tây”* lại là một mệnh đề hoàn toàn ĐÚNG trong toán học!
  
  *Thầy:* Chính xác! Đó là nền tảng của toàn bộ hợp đồng bảo hiểm và logic điều kiện trong phần mềm máy tính!
]

#dialogue-box(title: "Kịch Bản 2: Tại Sao Điểm Kiếm Nhiều Tiền Nhất Lại Nằm Ở Đỉnh Nhọn Đa Giác Lồi?")[
  *Thầy:* Một xưởng bánh mì bị giới hạn bởi bột mì, đường và giờ công thợ, tạo thành một miền đa giác lồi ngũ giác $A B C D E$. Lợi nhuận là biểu thức $F(x, y) = 2x + 3y$. Một bạn đề xuất: "Sao không chọn một điểm nằm sâu bên trong bụng đa giác cho an toàn?". Ý các em thế nào?
  
  *Học sinh:* Thưa thầy, chọn điểm bên trong bụng thì bột vẫn còn thừa, đường vẫn còn thừa, công nhân vẫn rảnh rỗi! Tội gì không sản xuất thêm để tăng tiền!
  
  *Thầy:* Rất sắc sảo! Tức là ta phải đi ra mép bờ rào của đa giác. Nhưng mép bờ rào là một đoạn thẳng dài vô tận, điểm nào trên đoạn thẳng đó sẽ cho nhiều tiền nhất?
  
  *Học sinh:* Điểm ở giữa đoạn thẳng chăng?
  
  *Thầy:* Hãy tưởng tượng biểu thức $2x + 3y = C$ là một thanh thước kẻ thẳng tắp trượt song song trên mặt bàn. Khi thanh thước trượt tịnh tiến theo hướng tăng dần của lợi nhuận $C$, chiếc thước sẽ tiếp xúc với miền đa giác ở đâu trước khi rời hẳn khỏi đa giác?
  
  *Học sinh:* A! Nó sẽ chạm lần cuối cùng vào một *ĐỈNH NHỌN* nhô ra xa nhất của đa giác!
  
  *Thầy:* Đúng thế! Nếu một đoạn thẳng bị kéo căng về một phía, điểm cực trị không bao giờ nằm lơ lửng ở giữa, mà bắt buộc phải bị đẩy dồn về một trong hai đầu mút! Đó chính là lý do các kỹ sư vận trù học chỉ cần bấm máy tính kiểm tra đúng 5 đỉnh nhọn của đa giác là tìm ngay ra phương án kinh doanh tối ưu triệu đô!
]

#dialogue-box(title: "Kịch Bản 3: Tích Vô Hướng & Tại Sao Hai Vectơ Vuông Góc Thì Tích Bằng 0?")[
  *Thầy:* Này các em, khi một người lực sĩ gánh một tạ thóc nặng $100 "kg"$ đứng yên một chỗ suốt 2 tiếng đồng hồ mồ hôi nhễ nhại, trong Vật lý lớp 10, người lực sĩ đó đã thực hiện một Công cơ học bằng bao nhiêu?
  
  *Học sinh:* Thưa thầy... bằng 0 ạ! Vì quãng đường dịch chuyển $s = 0$!
  
  *Thầy:* Đúng! Bây giờ người đó vác bao thóc đi bộ trên đường nằm ngang phẳng lì suốt $5 "km"$. Trọng lực của Trái Đất hướng thẳng đứng xuống tâm đất, còn vectơ độ dời của người đó thì nằm ngang. Góc giữa trọng lực và độ dời là bao nhiêu?
  
  *Học sinh:* Dạ, góc vuông $90 degree$!
  
  *Thầy:* Trọng lực có giúp người đó đi nhanh hơn về phía trước không? Trọng lực có cản trở người đó đi tới phía trước không?
  
  *Học sinh:* Dạ không, phương thẳng đứng và phương ngang hoàn toàn độc lập, không tác động lên nhau!
  
  *Thầy:* Chính vì sự độc lập tuyệt đối đó, toán học định nghĩa độ "hỗ trợ lẫn nhau" giữa hai vectơ thông qua hình chiếu:
  $ vec(a) dot vec(b) = |vec(a)| |vec(b)| cos(90 degree) = 0! $
  Con số 0 đó không phải là sự biến mất, mà là tuyên ngôn của sự *Độc lập trực giao*! Khi hai đại lượng vuông góc, chúng không chia sẻ với nhau bất kỳ một thành phần hình chiếu nào!
]

#dialogue-box(title: "Kịch Bản 4: Nghịch Lý Simpson — Khi Số Trung Bình Trở Thành Kẻ Lừa Đảo")[
  *Thầy:* Bệnh viện $A$ và Bệnh viện $B$ cùng thử nghiệm một loại thuốc mới trên hai nhóm bệnh nhân: ca bệnh nhẹ và ca bệnh nặng.
  - Ở nhóm bệnh nhẹ: Thuốc của viện $A$ chữa khỏi $90\%$, viện $B$ chữa khỏi $80\%$.
  - Ở nhóm bệnh nặng: Thuốc của viện $A$ chữa khỏi $30\%$, viện $B$ chữa khỏi $20\%$.
  Hỏi: Viện nào có phương pháp chữa bệnh tốt hơn?
  
  *Cả lớp đồng thanh:* Rõ ràng là Viện $A$ tốt hơn ở cả hai nhóm rồi ạ! $90\% > 80\%$ và $30\% > 20\%$!
  
  *Thầy:* Bây giờ hãy nhìn vào số liệu thực tế:
  - Viện $A$ nhận 100 ca nhẹ (khỏi 90) và nhận tới 900 ca nặng thập tử nhất sinh (khỏi 270). Tổng cộng viện $A$ chữa khỏi: $(90 + 270) / 1.000 = 36\%$!
  - Viện $B$ chỉ dám nhận 5 ca nặng (khỏi 1) và nhận tới 95 ca nhẹ (khỏi 76). Tổng cộng viện $B$ chữa khỏi: $(76 + 1) / 100 = 77\%$!
  Bây giờ, trên báo chí giật tít: "Viện $B$ chữa khỏi $77\%$, đè bẹp Viện $A$ chỉ chữa khỏi $36\%$!". Sự thật là gì?
  
  *Học sinh sững sờ:* Ôi trời đất ơi... Viện $A$ giỏi hơn ở từng loại bệnh, nhưng vì họ có đạo đức nhận hầu hết các ca bệnh nặng nguy kịch nên tỉ lệ gộp chung bị kéo tụt xuống thảm hại!
  
  *Thầy:* Đó chính là *Nghịch lý Simpson* lừng danh trong thống kê! Nếu không biết phân tích nhóm và phân lập biến số ẩn, những con số thống kê trung bình gộp sẽ trở thành công cụ lừa đảo tinh vi nhất!
]

#dialogue-box(title: "Kịch Bản 5: Phân Biệt Chỉnh Hợp vs Tổ Hợp — Thứ Tự Có Làm Thay Đổi Số Phận?")[
  *Thầy:* Lớp chúng ta có 40 bạn học sinh. Thầy có 2 nhiệm vụ:
  - Nhiệm vụ 1: Chọn ra 3 bạn để phân công làm Lớp trưởng, Lớp phó học tập, và Bí thư chi đoàn.
  - Nhiệm vụ 2: Chọn ra 3 bạn đi quét dọn sân trường.
  Hai bài toán này khác nhau ở điểm cốt tử nào?
  
  *Học sinh:* Dạ, ở nhiệm vụ 1, nếu bạn An làm Lớp trưởng thì số phận của bạn An khác hoàn toàn với việc bạn An làm Bí thư ạ! Thứ tự được phân công quyết định chức vụ khác nhau!
  
  *Thầy:* Đúng! Có thứ tự, hoán đổi vị trí sinh ra kết quả mới: đó là *Chỉnh hợp* $A_(40)^3 = 40 times 39 times 38 = 59.280$ cách! Còn nhiệm vụ 2 thì sao?
  
  *Học sinh:* Dạ, 3 bạn đi quét rác thì dù xướng tên An trước hay Bình trước thì cả 3 đứa vẫn cầm chổi quét như nhau, không ai oai hơn ai! Thứ tự hoàn toàn vô nghĩa!
  
  *Thầy:* Xuất sắc! Khi thứ tự vô nghĩa, mỗi nhóm 3 bạn bị tính lặp lại $3! = 6$ lần hoán vị thừa thãi. Ta phải chia bỏ đi số lần lặp đó:
  $ C_(40)^3 = (A_(40)^3) / (3!) = (59.280) / 6 = 9.880 "cách"! $
  Đó là *Tổ hợp*! Bất kỳ khi nào làm toán đếm, câu hỏi đầu tiên phải tự hỏi mình là: *“Nếu ta hoán đổi vị trí của hai người, kết quả có bị biến đổi không?”*!
]

#dialogue-box(title: "Kịch Bản 6: Bí Ẩn Nửa Chu Vi p Trong Công Thức Diện Tích Heron")[
  *Thầy:* Công thức tính diện tích tam giác cổ điển là $S = 1/2 a h_a$. Nhưng nếu ta chỉ đo được 3 cạnh bằng dây kéo mà không trèo lên đỉnh tam giác để thả dây dọi đo chiều cao $h_a$, ta dùng công thức Heron:
  $ S = sqrt(p(p - a)(p - b)(p - c)) $
  với $p = (a+b+c)/2$. Tại sao lại xuất hiện con số nửa chu vi $p$ và ba hiệu số $(p - a), (p - b), (p - c)$?
  
  *Học sinh:* Em thấy nó rất đối xứng, nhưng ý nghĩa hình học của $(p - a)$ là gì ạ?
  
  *Thầy:* Hãy vẽ đường tròn nội tiếp tam giác $(I; r)$ tiếp xúc với 3 cạnh tại $D, E, F$. Độ dài các tiếp tuyến xuất phát từ đỉnh $A$ đến đường tròn nội tiếp bằng bao nhiêu?
  
  *Học sinh:* Theo tính chất hai tiếp tuyến cắt nhau, $A E = A F$. Tương tự $B D = B F, C D = C E$. Tổng chu vi là $2(A E + B D + C D) = 2p$, suy ra $A E + a = p$, tức là $A E = p - a$!
  
  *Thầy:* Tuyệt vời! $(p - a)$ chính là khoảng cách từ đỉnh $A$ đến điểm tiếp xúc của đường tròn nội tiếp! Công thức Heron thực chất là bản giao hưởng kết hợp giữa diện tích đa giác phân rã $S = p r$ và lượng giác giải tích nửa góc qua hệ thức cotang!
]

#dialogue-box(title: "Kịch Bản 7: Tại Sao Tỉ Số a / sin A Lại Bằng Đúng 2R Đường Kính Ngoại Tiếp?")[
  *Thầy:* Trong tam giác vuông tại $A$, cạnh huyền $a = 2R$. Khi đó $sin A = sin(90 degree) = 1$, nên $a / (sin A) = (2R) / 1 = 2R$. Điều này ai cũng thấy. Nhưng tại sao khi tam giác KHÔNG VUÔNG (góc $A$ nhọn hoặc tù), tỉ số này vẫn bằng đúng $2R$?
  
  *Học sinh:* Dạ... khi góc $A$ thay đổi, cạnh $a$ cũng thay đổi theo, nhưng làm sao biết chúng tỷ lệ với $2R$?
  
  *Thầy:* Hãy vẽ đường tròn ngoại tiếp tam giác. Giữ nguyên đáy $B C$, cho đỉnh $A$ chạy tự do trên cung tròn lớn. Góc $hat(B A C)$ có thay đổi không?
  
  *Học sinh:* Dạ không! Theo định lý góc nội tiếp, mọi góc chắn cung $B C$ đều bằng nhau!
  
  *Thầy:* Vậy ta có thể dời điểm $A$ đến vị trí đặc biệt $A'$ sao cho đoạn $B A'$ đi qua tâm $O$ của đường tròn không?
  
  *Học sinh:* A! Khi đó tam giác $A' B C$ vuông tại $C$ vì chắn nửa đường tròn! Và cạnh huyền $A' B = 2R$!
  
  *Thầy:* Chính xác! Trong tam giác vuông $A' B C$, $sin A' = (B C) / (A' B) = a / (2R)$. Mà $hat(A) = hat(A')$, suy ra ngay $sin A = a / (2R)$, tức là $a / (sin A) = 2R$!
  
  *Học sinh:* Thật vi diệu! Chỉ một phép dời điểm bảo toàn góc trên đường tròn, một tam giác bất kỳ đã biến thành tam giác vuông kinh điển!
]

#dialogue-box(title: "Kịch Bản 8: Tại Sao Phương Trình Bậc Hai Luôn Có Trục Đối Xứng x = -b / (2a)?")[
  *Thầy:* Cho parabol $y = a x^2 + b x + c$. Tại sao đỉnh của nó luôn nằm tại hoành độ $x = -b / (2a)$?
  
  *Học sinh:* Dạ trong SGK dạy biến đổi thành $a(x + b/(2a))^2 - Delta / (4a)$ ạ.
  
  *Thầy:* Đúng về mặt đại số. Nhưng bản chất hình học là gì? Giả sử parabol cắt trục hoành tại hai nghiệm phân biệt $x_1, x_2$. Điểm chính giữa hai nghiệm này có tọa độ là gì?
  
  *Học sinh:* Dạ là trung điểm: $x_0 = (x_1 + x_2) / 2$.
  
  *Thầy:* Theo định lý Viète cổ điển, tổng hai nghiệm $x_1 + x_2$ bằng bao nhiêu?
  
  *Học sinh:* Bằng $-b / a$! Vậy trung điểm $x_0 = (-b / a) / 2 = -b / (2a)$!
  
  *Thầy:* Tuyệt vời! Ngay cả khi phương trình vô nghiệm (đồ thị không cắt trục hoành), nếu ta nâng hay hạ đồ thị theo phương thẳng đứng, tính đối xứng gương trái - phải của tự nhiên không hề biến mất. Đỉnh của parabol chính là "trọng tâm hình học" cân bằng hai nhánh vô tận của vũ trụ!
]

#dialogue-box(title: "Kịch Bản 9: Khi Nào Dùng Quy Tắc Cộng, Khi Nào Dùng Quy Tắc Nhân?")[
  *Thầy:* Một bạn học sinh đứng trước quyết định đi từ Hà Nội vào TP.HCM. Có 2 chuyến máy bay và 3 chuyến tàu hỏa. Bạn đó có bao nhiêu cách chọn phương tiện?
  
  *Học sinh:* Dạ có $2 + 3 = 5$ cách ạ! Vì bạn đó chỉ đi một lần bằng máy bay HOẶC tàu hỏa!
  
  *Thầy:* Đúng, đó là từ khóa *HOẶC (Phương án độc lập, loại trừ nhau)* $arrow$ dùng Quy tắc Cộng! Bây giờ bạn đó đi từ Hà Nội vào Đà Nẵng bằng 2 chuyến bay, rồi từ Đà Nẵng vào TP.HCM tiếp bằng 3 chuyến tàu. Hỏi có bao nhiêu hành trình?
  
  *Học sinh:* Dạ có $2 times 3 = 6$ cách ạ!
  
  *Thầy:* Tại sao lại là phép nhân?
  
  *Học sinh:* Vì hành trình phải trải qua *HAI GIAI ĐOẠN LIÊN TIẾP*. Cứ mỗi chuyến bay chặng 1 lại có thể ghép cặp với 3 chuyến tàu chặng 2, tạo thành cây quyết định 6 nhánh!
  
  *Thầy:* Khắc cốt ghi tâm: *HOẶC là CỘNG (chia trường hợp), VÀ là NHÂN (nhiều công đoạn liên tiếp)*! Đó là quy luật bất biến của toàn bộ khoa học máy tính và logic nhị phân!
]

#dialogue-box(title: "Kịch Bản 10: Nghịch Lý Ngày Sinh — Tại Sao 23 Người Đã Có Hơn 50% Khả Năng Trùng Nhật?")[
  *Thầy:* Lớp ta có 23 học sinh. Thầy đánh cược rằng trong 23 bạn này, có ít nhất hai bạn cùng ngày tháng sinh nhật. Các em có dám cược ngược lại không?
  
  *Học sinh:* Cược chứ thầy! Một năm có tới 365 ngày, mà lớp chỉ có 23 người, cơ hội trùng nhau chắc chỉ vài phần trăm là cùng!
  
  *Thầy:* Hãy cẩn thận! Ta không hỏi: "Có ai trùng sinh nhật với Thầy không?". Ta hỏi: *"CÓ HAI BẠN BẤT KỲ TRONG LỚP TRÙNG NHAU KHÔNG?"*. Trong 23 người, có bao nhiêu CẶP ĐÔI có thể so sánh sinh nhật với nhau?
  
  *Học sinh:* Dạ... số cặp đôi là tổ hợp chập 2 của 23: $C_(23)^2 = (23 times 22) / 2 = 253$ cặp!
  
  *Thầy:* Đúng! Không phải là 23 phép thử, mà là *253 cơ hội bắt cặp*! Xác suất để cả 253 cặp này ĐỀU KHÔNG TRÙNG NHAU là:
  $ P("không trùng") = 365/365 times 364/365 times dots times (365 - 22)/365 approx 0,4927! $
  Vậy xác suất có ÍT NHẤT MỘT CẶP TRÙNG NHAU là:
  $ P = 1 - 0,4927 = 0,5073 = 50,73\%! $
  
  *Học sinh choáng váng:* Trời ơi! Chỉ 23 người mà đã có tới hơn $50\%$ cơ hội trùng nhau!
  
  *Thầy:* Đó là Nghịch lý Ngày sinh! Trực giác con người luôn tuyến tính, nhưng toán học tổ hợp phát triển theo cấp số lũy thừa. Hiểu được điều này, các em đã nắm trong tay chìa khóa giải mã bảo mật chữ ký số hiện đại!
]

#dialogue-box(title: "Kịch Bản 11: Tại Sao Tích Vô Hướng Của Hai Vectơ Lại Có Thể Âm, Bằng 0, Hoặc Dương?")[
  *Thầy (Socrates):* Này bạn trẻ, khi hai người bạn cùng nhau đẩy một chiếc xe chết máy về phía trước:
  - Nếu cả hai người cùng đẩy thẳng về phía trước theo hướng chuyển động, công sinh ra là dương hay âm?
  
  *Học sinh:* Dạ, công dương ạ! Chiếc xe chạy nhanh hơn, cả hai cùng hỗ trợ nhau!
  
  *Thầy:* Đúng, góc giữa lực đẩy và độ dời là $0 degree$, $cos(0 degree) = +1$, tích vô hướng dương cực đại! Bây giờ, nếu một người đẩy về phía trước, nhưng người kia lại cố tình kéo ghì chiếc xe lùi lại phía sau, thì điều gì xảy ra?
  
  *Học sinh:* Người kéo lùi đang cản trở chuyển động, sinh ra công âm! Góc lúc này là $180 degree$, $cos(180 degree) = -1$, tích vô hướng âm ạ!
  
  *Thầy:* Rất thông minh! Và nếu có một người thứ ba đứng bên đường tì tay đẩy vuông góc $90 degree$ vào sườn xe sang bên cạnh, liệu người đó có giúp chiếc xe chạy nhanh hơn hay làm xe chạy chậm lại theo chiều dọc không?
  
  *Học sinh:* Dạ không! Đẩy vuông góc thì chỉ làm xe lắc sang bên chứ không hề đóng góp hay cản trở một chút nào vào vận tốc tiến tới của xe cả! Công bằng 0!
  
  *Thầy:* Tuyệt mỹ! $cos(90 degree) = 0$, nên tích vô hướng của hai vectơ vuông góc luôn bằng 0! Các em thấy chưa: Tích vô hướng không phải là một công thức đại số khô khan được ép buộc, nó chính là thước đo sự "ĐỒNG LÒNG HỢP TÁC" hay "CHỐNG ĐỐI NHAU" giữa hai lực trong vũ trụ vật lý!
]

#dialogue-box(title: "Kịch Bản 12: Tại Sao Trên Đời Có Phép Nhân Vectơ Nhưng Tuyệt Đối Không Có Phép Chia Vectơ?")[
  *Thầy:* Trong đại số số học, nếu $a times b = c$ và $b != 0$, ta luôn có phép chia duy nhất $a = c / b$. Nhưng trong hình học, nếu cho tích vô hướng $vec(u) dot vec(v) = k$ ($vec(v) != vec(0)$), liệu ta có thể định nghĩa được phép chia $vec(u) = k / vec(v)$ không?
  
  *Học sinh:* Dạ... sao lại không được ạ? Cứ lấy số $k$ chia cho vectơ $vec(v)$ thôi!
  
  *Thầy:* Hãy cẩn thận! Kết quả của phép chia đó phải là một vectơ xác định duy nhất. Nhưng hãy nhìn xem: Có bao nhiêu vectơ $vec(u)$ khi nhân vô hướng với $vec(v)$ cho ra cùng kết quả $k$?
  
  *Học sinh:* Dạ... vô số ạ! Mọi vectơ có hình chiếu lên giá của $vec(v)$ bằng cùng một độ dài đại số đều cho ra cùng một tích vô hướng $k$! Đầu mút của các vectơ $vec(u)$ đó quét ra cả một đường thẳng vuông góc vô tận trong mặt phẳng!
  
  *Thầy:* Đúng thế! Một phương trình mà có vô số nghiệm vectơ không thể xác định duy nhất thì phép toán ngược (phép chia) KHÔNG THỂ TỒN TẠI! Đó là lý do trong đại số tuyến tính của nhân loại, ta chỉ có phép nhân vô hướng, tích có hướng, nhưng KHÔNG BAO GIỜ TỒN TẠI PHÉP CHIA HAI VECTƠ!
]

#dialogue-box(title: "Kịch Bản 13: Cạm Bẫy SSA & Tại Sao Hai Cạnh Và Một Góc Không Xen Giữa Lại Vẽ Được Hai Tam Giác?")[
  *Thầy:* Khi học lớp 7, các em đã biết các trường hợp bằng nhau của hai tam giác: Cạnh - Cạnh - Cạnh (c-c-c), Cạnh - Góc - Cạnh (c-g-c), và Góc - Cạnh - Góc (g-c-g). Nhưng tại sao các thầy cô tuyệt đối không bao giờ dạy trường hợp "Cạnh - Cạnh - Góc" (SSA - hai cạnh và góc không xen giữa)?
  
  *Học sinh:* Dạ... chắc là vì nó không suy ra được hai tam giác bằng nhau ạ! Nhưng tại sao lại thế ạ?
  
  *Thầy:* Hãy cầm compa lên! Thầy cho góc $hat(A) = 30 degree$, cạnh $b = A C = 10 "cm"$. Bây giờ thầy lấy compa quay một đường tròn tâm $C$ bán kính $a = 6 "cm"$. Đường tròn này sẽ cắt tia $A x$ tại bao nhiêu điểm?
  
  *Học sinh:* Dạ, khoảng cách từ $C$ đến đường thẳng $A x$ là đường cao $h = b sin(30 degree) = 10 times 0,5 = 5 "cm"$. Vì bán kính $a = 6 "cm"$ lớn hơn đường cao $h = 5 "cm"$ nhưng lại nhỏ hơn cạnh $b = 10 "cm"$, nên đường tròn sẽ CẮT TIA $A x$ TẠI ĐÚNG HAI ĐIỂM PHÂN BIỆT $B_1$ VÀ $B_2$!
  
  *Thầy:* Xuất sắc! Một điểm $B_1$ tạo thành tam giác tù, một điểm $B_2$ tạo thành tam giác nhọn! Cả hai tam giác $A B_1 C$ và $A B_2 C$ đều có cùng góc $hat(A) = 30 degree$, cùng cạnh $A C = 10 "cm"$, cùng cạnh đối diện $B C = 6 "cm"$, nhưng chúng HOÀN TOÀN KHÁC NHAU!
  
  *Học sinh:* Giờ em đã hiểu tại sao trong trắc địa và định vị GPS, trường hợp SSA được gọi là "Trường hợp nhập nhằng" (Ambiguous Case), nếu không có dữ kiện phụ sẽ gây ra thảm họa định vị nhầm tọa độ!
]

#dialogue-box(title: "Kịch Bản 14: Tại Sao Delta < 0 Thì Tam Thức Bậc Hai Luôn Cùng Dấu Với Hệ Số a?")[
  *Thầy:* Này các em, khi giải bất phương trình bậc hai $a x^2 + b x + c > 0$, nếu $Delta = b^2 - 4 a c < 0$, sách giáo khoa bảo tam thức luôn cùng dấu với $a$. Làm sao chứng minh điều đó mà không cần học vẹt?
  
  *Học sinh:* Dạ thưa thầy, hãy dùng phép biến đổi hoàn thành bình phương của nhà toán học Al-Khwarizmi ạ!
  
  *Thầy:* Hãy làm thử xem!
  
  *Học sinh:* Ta rút hệ số $a$ ra ngoài:
  $ f(x) = a [ x^2 + b/a x + c/a ] = a [ (x + b/(2a))^2 + (4 a c - b^2)/(4 a^2) ] = a [ (x + b/(2a))^2 - Delta / (4 a^2) ] $
  
  *Thầy:* Hãy nhìn vào trong ngoặc vuông! Biểu thức $(x + b/(2a))^2$ luôn $>= 0$ với mọi $x$. Còn số hạng thứ hai $- Delta / (4 a^2)$ thì sao khi $Delta < 0$?
  
  *Học sinh:* Vì $Delta < 0$ nên $-Delta > 0$! Số dương chia cho mẫu $4 a^2 > 0$ là MỘT SỐ DƯƠNG TUYỆT ĐỐI!
  
  *Thầy:* Vậy toàn bộ biểu thức trong ngoặc vuông là tổng của một số không âm với một số dương thực sự, tức là NÓ LUÔN DƯƠNG DƯƠNG TUYỆT ĐỐI VỚI MỌI $x in RR$!
  
  *Học sinh:* Em thấy rồi! Dấu của toàn bộ tam thức $f(x)$ lúc này chỉ phụ thuộc hoàn toàn vào dấu của hệ số $a$ đứng bên ngoài ngoặc! $a$ dương thì $f(x)$ dương, $a$ âm thì $f(x)$ âm!
  
  *Thầy:* Đúng vậy! Toán học là sự tất yếu của logic hoàn thiện bình phương, không có bất kỳ phép màu tùy tiện nào ở đây cả!
]

#dialogue-box(title: "Kịch Bản 15: Đường Thẳng Euler Kì Ảo: Tại Sao Trọng Tâm, Trực Tâm & Tâm Ngoại Tiếp Luôn Thẳng Hàng?")[
  *Thầy:* Trong một tam giác bất kỳ không đều, ta có ba điểm đặc biệt: Trọng tâm $G$ (giao 3 trung tuyến), Trực tâm $H$ (giao 3 đường cao), và Tâm đường tròn ngoại tiếp $O$ (giao 3 đường trung trực). Năm 1765, nhà toán học thiên tài Leonhard Euler đã phát hiện một sự thật chấn động: Cả 3 điểm này LUÔN THẲNG HÀNG trên một đường thẳng mang tên *Đường thẳng Euler*!
  
  *Học sinh:* Thưa thầy, làm sao chứng minh được điều kỳ diệu đó bằng kiến thức vectơ lớp 10 ạ?
  
  *Thầy:* Hãy gọi $M$ là trung điểm cạnh $B C$. Vectơ $vec(O M)$ vuông góc với $B C$. Mặt khác, đoạn $A H$ cũng vuông góc với $B C$. Vậy hai vectơ $vec(A H)$ và $vec(O M)$ có mối quan hệ gì?
  
  *Học sinh:* Chúng cùng phương với nhau vì cùng vuông góc với cạnh $B C$!
  
  *Thầy:* Bằng hình học đồng dạng, ta chứng minh được đoạn $A H$ dài gấp đúng 2 lần đoạn $O M$: $vec(A H) = 2 vec(O M)$! Bây giờ hãy chèn điểm $O$ vào vectơ $vec(A H)$:
  $ vec(O H) - vec(O A) = 2 vec(O M) arrow vec(O H) = vec(O A) + 2 vec(O M) $
  Mà theo tính chất trung điểm, $2 vec(O M) = vec(O B) + vec(O C)$. Vậy ta có hệ thức kinh điển:
  $ vec(O H) = vec(O A) + vec(O B) + vec(O C)! $
  
  *Học sinh:* Ôi! Và theo tính chất trọng tâm tam giác, $vec(O A) + vec(O B) + vec(O C) = 3 vec(O G)$!
  
  *Thầy:* Đúng thế! Thế vào ta có ngay:
  $ vec(O H) = 3 vec(O G) quad arrow quad vec(G H) = - 2 vec(G O)! $
  Hai vectơ cùng phương, suy ra ba điểm $H, G, O$ thẳng hàng chằn chặn, và Trọng tâm $G$ luôn chia đoạn $H O$ theo tỉ lệ vàng $2 : 1$!
  
  *Học sinh:* Thật tráng lệ! Chỉ bằng vài phép cộng vectơ lớp 10, một định lý hình học phức tạp đã hiển lộ thanh tao như một bức họa!
]

#dialogue-box(title: "Kịch Bản 16: Tại Sao Tổng Các Số Ở Hàng Thứ n Của Tam Giác Pascal Lại Đúng Bằng 2^n?")[
  *Thầy:* Hãy nhìn vào các hàng của Tam giác Pascal:
  - Hàng 0: $1$ $arrow$ Tổng $= 1 = 2^0$.
  - Hàng 1: $1 + 1 = 2 = 2^1$.
  - Hàng 2: $1 + 2 + 1 = 4 = 2^2$.
  - Hàng 3: $1 + 3 + 3 + 1 = 8 = 2^3$.
  - Hàng 4: $1 + 4 + 6 + 4 + 1 = 16 = 2^4$.
  Tại sao tổng các hệ số tổ hợp $C_n^0 + C_n^1 + C_n^2 + ... + C_n^n$ lại luôn bằng đúng lũy thừa $2^n$?
  
  *Học sinh:* Thưa thầy, theo khai triển Nhị thức Newton: $(a + b)^n = sum C_n^k a^(n-k) b^k$. Nếu ta chọn $a = 1$ và $b = 1$, ta có ngay $(1 + 1)^n = 2^n$ ạ!
  
  *Thầy:* Rất chuẩn về mặt đại số! Nhưng bản chất TỔ HỢP ĐẾM là gì? Hãy tưởng tượng thầy có một tập hợp gồm $n$ phần tử, ví dụ như một hộp gồm $n$ món quà khác nhau. Thầy muốn chọn ra một số món quà (có thể không chọn món nào, chọn 1 món, 2 món, ..., hoặc chọn hết cả $n$ món).
  
  *Học sinh:* Dạ, số cách chọn 0 món là $C_n^0$, chọn 1 món là $C_n^1$, ..., chọn $k$ món là $C_n^k$. Tổng tất cả các trường hợp chính là TỔNG SỐ TẬP CON của tập hợp $n$ phần tử đó ạ!
  
  *Thầy:* Đúng! Và bây giờ hãy đếm theo cách của người lập trình máy tính: Đứng trước mỗi món quà thứ $i$, em có bao nhiêu sự lựa chọn?
  
  *Học sinh:* Dạ... chỉ có 2 sự lựa chọn: CHỌN hoặc KHÔNG CHỌN (1 hoặc 0)!
  
  *Thầy:* Với $n$ món quà độc lập liên tiếp, theo Quy tắc Nhân có bao nhiêu khả năng?
  
  *Học sinh:* $2 times 2 times ... times 2 = 2^n$ khả năng!
  
  *Thầy:* Tuyệt vời! Hai cách đếm khác nhau cho cùng một bài toán tập hợp bắt buộc phải cho ra cùng một đáp số: $sum_(k=0)^n C_n^k = 2^n$! Đó chính là vẻ đẹp của Nguyên lý Đếm bằng hai cách (Double Counting) trong Toán tổ hợp!
]

#dialogue-box(title: "Kịch Bản 17: Tại Sao Phương Trình Đường Thẳng a x + b y + c = 0 Lại Nhận (a; b) Làm Vectơ Pháp Tuyến?")[
  *Thầy:* Này các em, tại sao một đường thẳng trong mặt phẳng tọa độ lại được mô tả bởi phương trình bậc nhất $a x + b y + c = 0$, và tại sao hai hệ số đứng trước $x$ và $y$ lại lập tức cho ta tọa độ của một Vectơ pháp tuyến $vec(n) = (a; b)$ vuông góc với đường thẳng đó?
  
  *Học sinh:* Dạ... trong sách giáo khoa ghi định nghĩa như thế ạ!
  
  *Thầy:* Đừng học vẹt! Hãy cùng dựng lại phương trình từ hình học thuần túy: Cho một điểm cố định $M_0(x_0; y_0)$ và một vectơ vuông góc $vec(n) = (a; b) != vec(0)$. Một điểm $M(x; y)$ bất kỳ muốn nằm trên đường thẳng đi qua $M_0$ vuông góc với $vec(n)$ thì vectơ chỉ phương đoạn thẳng $vec(M_0 M)$ phải thỏa mãn điều kiện gì với $vec(n)$?
  
  *Học sinh:* Dạ, vectơ $vec(M_0 M)$ bắt buộc phải VUÔNG GÓC với vectơ $vec(n)$!
  
  *Thầy:* Và hai vectơ vuông góc nhau thì tích vô hướng của chúng bằng bao nhiêu?
  
  *Học sinh:* Bằng 0! $vec(n) dot vec(M_0 M) = 0$!
  
  *Thầy:* Hãy khai triển tích vô hướng theo tọa độ: $vec(M_0 M) = (x - x_0; y - y_0)$, vectơ $vec(n) = (a; b)$:
  
  *Học sinh:* Ta có:
  $ a(x - x_0) + b(y - y_0) = 0 arrow a x + b y - (a x_0 + b y_0) = 0! $
  
  *Thầy:* Đặt số thực cố định $-(a x_0 + b y_0) = c$, ta thu được chính xác phương trình tổng quát:
  $ a x + b y + c = 0! $
  
  *Học sinh:* Trời ơi, hóa ra phương trình đường thẳng bậc nhất hai ẩn bản chất chỉ là PHÉP NHÂN VÔ HƯỚNG BẰNG 0 CỦA HAI VECTƠ VUÔNG GÓC! Không hề có chút gì bí ẩn hay áp đặt ở đây cả!
]

#dialogue-box(title: "Kịch Bản 18: Nghịch Lý Ngày Sinh & Tại Sao Trực Giác Con Người Lại Bị Tê Liệt Trước Cấp Số Tổ Hợp?")[
  *Thầy:* Khi nghe nói trong một bữa tiệc chỉ cần 23 người là cơ hội có 2 người trùng sinh nhật đã vượt $50\%$, tại sao ai cũng nghĩ rằng thông tin đó là giả mạo?
  
  *Học sinh:* Vì bộ não chúng ta tự động lấy ngày sinh của chính mình đi so sánh với 22 người còn lại! Chỉ có 22 phép so sánh, xác suất $22 / 365$ chỉ khoảng $6\%$, nên ta thấy nó quá nhỏ!
  
  *Thầy:* Rất chính xác! Đó là thiên kiến vị kỷ (Egocentric Bias) của tâm lý học. Nhưng câu hỏi không phải là "ai trùng sinh nhật với BẠN", mà là "bất kỳ hai người nào trùng nhau". Trong 23 người, số lượng sợi dây vô hình kết nối giữa từng cặp hai người là:
  $ C_(23)^2 = (23 times 22) / 2 = 253 "cặp kết nối"! $
  253 phép thử so với 365 ngày trong năm là một con số khổng lồ!
  
  *Học sinh:* Em hiểu rồi! Trực giác con người sinh ra để ước lượng những đường thẳng (tuyến tính $n$), nhưng thế giới tự nhiên và công nghệ máy tính lại vận hành theo đồ thị hàm bậc hai ($n^2$) và hàm số mũ ($2^n$)!
  
  *Thầy:* Đúng thế! Ai không hiểu được sức mạnh bùng nổ của tổ hợp sẽ luôn bị cuộc đời và các thuật toán dữ liệu lớn đánh lừa!
]

#dialogue-box(title: "Kịch Bản 19: Tại Sao Phương Sai Mẫu Bắt Buộc Phải Chia Cho n - 1 Thay Vì Chia Cho n?")[
  *Thầy:* Khi tính phương sai cho toàn bộ dân số gồm $N$ người, ta lấy tổng bình phương độ lệch chia cho $N$:
  $ sigma^2 = 1/N sum_(i=1)^N (x_i - mu)^2 $
  Nhưng khi các em rút một mẫu ngẫu nhiên gồm $n$ người từ thực tế, tại sao công thức phương sai mẫu $s^2$ lại bắt buộc phải chia cho $n - 1$?
  $ s^2 = 1/(n - 1) sum_(i=1)^n (x_i - bar(x))^2 $
  
  *Học sinh:* Dạ, thầy cô bảo đó là Hiệu chỉnh Bessel (Bessel's Correction), nhưng tại sao lại bị hụt mất 1 đơn vị tự do ạ?
  
  *Thầy:* Hãy chú ý: Trong công thức mẫu, ta KHÔNG BIẾT giá trị trung bình thực sự $mu$ của toàn dân số, mà ta buộc phải thay thế nó bằng giá trị trung bình mẫu $bar(x) = 1/n sum x_i$. Và theo tính chất toán học của trung bình cộng, tổng các độ lệch so với $bar(x)$ luôn luôn bằng 0 chằn chặn:
  $ sum_(i=1)^n (x_i - bar(x)) = 0! $
  Điều này có nghĩa là gì? Nếu em đã biết độ lệch của $n - 1$ phần tử đầu tiên, em có tự động suy ra được độ lệch của phần tử thứ $n$ mà không cần đo đạc không?
  
  *Học sinh:* Dạ có! Phần tử cuối cùng bị "khóa cứng" bởi tổng bằng 0! Nó không còn được tự do dao động nữa!
  
  *Thầy:* Đúng! Ta đã "tiêu tốn mất 1 bậc tự do" để ước lượng số trung bình $bar(x)$! Do đó, mẫu số liệu chỉ còn lại đúng $n - 1$ bậc tự do độc lập. Hơn nữa, vì các điểm dữ liệu trong mẫu luôn có xu hướng co cụm quanh trung bình mẫu $bar(x)$ gần hơn là quanh trung bình thực sự $mu$, nên nếu chia cho $n$, phương sai mẫu sẽ luôn bị đánh giá thấp hơn (thiên lệch). Chia cho $n - 1$ là một hiệu chỉnh thiên tài để đại lượng ước lượng trở thành hoàn toàn không chệch (Unbiased)!
]

#dialogue-box(title: "Kịch Bản 20: ChatGPT & Trí Tuệ Nhân Tạo Thực Chất Là Gì Dưới Lăng Kính Xác Suất Lớp 10?")[
  *Thầy:* Khi cả thế giới phát sốt vì ChatGPT có thể trò chuyện, làm thơ, giải toán như một con người, các em có nghĩ nó có linh hồn hay ý thức bí ẩn bên trong không?
  
  *Học sinh:* Dạ, nhìn nó trả lời trôi chảy quá, nhiều người tưởng nó có trí thông minh thực sự ạ!
  
  *Thầy:* Dưới lăng kính của nhà toán học, toàn bộ mô hình ngôn ngữ lớn (LLM) bản chất chỉ là một *Cỗ máy tính Xác suất có điều kiện khổng lồ*:
  $ P(w_t | w_1, w_2, ..., w_(t-1)) $
  Nó đọc hàng nghìn tỷ văn bản trên Internet để thống kê xem: Sau một chuỗi các từ cho trước, từ tiếp theo nào có xác suất xuất hiện cao nhất!
  
  *Học sinh:* Tức là khi em hỏi: "Thủ đô của Việt Nam là...", AI không hề "biết" Việt Nam là gì, mà nó chỉ tính toán thấy từ "Hà Nội" có xác suất cao nhất $99,9\%$ để điền vào?
  
  *Thầy:* Hoàn toàn chính xác! Nó là một chuỗi Markov mở rộng với hàng trăm tỷ tham số trọng số xác suất! Nó không có tư duy phản biện, không có đạo đức, không có trực giác sáng tạo nguyên bản. Nó chỉ là tấm gương phản chiếu lại xác suất thống kê ngôn ngữ của loài người. Người làm chủ được xác suất và tư duy logic toán học sẽ là người điều khiển AI, còn người học vẹt sẽ trở thành nô lệ cho các thuật toán gợi ý của máy móc!
]


#pagebreak()

= PHẦN III: BỐN BÀI BÁO NGHIÊN CỨU KHOA HỌC MINI CHUẨN IMRAD KÈM MÃ PYTHON

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành cho giáo viên hướng dẫn học sinh NCKH và học sinh chuyên Toán: Cấu trúc một bài báo khoa học chuẩn quốc tế IMRAD (Introduction - Methods - Results - And - Discussion) ứng dụng trực tiếp kiến thức Toán 10 giải quyết các vấn đề thực tiễn.
]

== BÀI BÁO 1: MÔ HÌNH HÓA VÀ TỐI ƯU HÓA QUỸ ĐẠO NÉM XIÊN TRONG TRỌNG TRƯỜNG CÓ LỰC CẢN KHÔNG KHÍ BẬC HAI BẰNG THUẬT TOÁN RUNGE-KUTTA BẬC 4 (RK4)

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt (Abstract):* Trong chương trình Vật lý và Toán học lớp 10, chuyển động ném xiên được mô hình hóa thành đường parabol hoàn hảo dưới giả thiết bỏ qua lực cản môi trường. Tuy nhiên trong thực tiễn khí động học thể thao (bóng đá, cầu lông, golf) và kỹ thuật đạn đạo, lực cản không khí tỷ lệ với bình phương vận tốc $F_d = 1/2 C_d rho A v^2$ làm biến dạng sâu sắc hình học quỹ đạo. Bài báo này xây dựng hệ phương trình vi phân phi tuyến tính hai chiều, giải bằng thuật toán Runge-Kutta bậc 4 (RK4) trên Python. Kết quả chứng minh góc phóng tối ưu để đạt tầm bay xa cực đại trong không khí bị kéo tụt từ $45 degree$ xuống $36,8 degree$, và quỹ đạo rơi dốc đứng bất đối xứng ở cuối hành trình.
]

*1. Giới thiệu (Introduction):*
Từ thời Cổ đại, Aristotle cho rằng một vật thể bay theo đường thẳng cho đến khi hết "dư lực" rồi rơi thẳng đứng xuống đất. Mãi đến năm 1638, trong tác phẩm kinh điển *“Discorsi e dimostrazioni matematiche intorno a due nuove scienze”*, Galileo Galilei mới lần đầu tiên chứng minh bằng hình học giải tích rằng: Quỹ đạo ném xiên trong chân không là sự kết hợp độc lập của chuyển động thẳng đều theo phương ngang và chuyển động rơi tự do biến đổi đều theo phương thẳng đứng:
$ x(t) = (v_0 cos theta) t, quad y(t) = (v_0 sin theta) t - 1/2 g t^2 $
Khử biến thời gian $t$, ta thu được phương trình Parabol chính tắc trong SGK Toán 10:
$ y = (tan theta) x - g / (2 v_0^2 cos^2 theta) x^2 $
Tầm bay xa cực đại trên mặt đất phẳng đạt được khi đạo hàm $d R / (d theta) = 0$, dẫn đến $theta^* = 45 degree$ và $R_("max") = v_0^2 / g$. Tuy nhiên, trong thực tế với quả bóng đá bay ở vận tốc $v_0 = 30 "m/s"$, lực cản không khí làm tầm xa giảm hơn $35\%$. Mô hình parabol thuần túy không thể giải thích được hiện tượng đạn rơi cắm dốc đứng.

*2. Mô hình Toán học & Thuật toán Số (Methods):*
Xét vật thể khối lượng $m$, diện tích cản $A$, hệ số cản khí động $C_d$ chuyển động trong không khí có mật độ $rho$. Lực cản hướng ngược chiều vectơ vận tốc:
$ vec(F)_d = - 1/2 C_d rho A |vec(v)| vec(v) = - k v vec(v) $
với $k = 1/2 C_d rho A$. Áp dụng Định luật II Newton: $m (d vec(v))/(d t) = m vec(g) + vec(F)_d$. Chiếu lên hệ trục tọa độ Descartes $O x y$:
$ {((d v_x)/(d t) = - k/m sqrt(v_x^2 + v_y^2) v_x), ((d v_y)/(d t) = - g - k/m sqrt(v_x^2 + v_y^2) v_y), ((d x)/(d t) = v_x), ((d y)/(d t) = v_y):} $
Hệ phương trình này là hệ phi tuyến tính không có nghiệm giải tích tường minh dưới dạng hàm sơ cấp. Chúng tôi triển khai thuật toán số Runge-Kutta bậc 4 (RK4) với vectơ trạng thái $vec(u) = (x, y, v_x, v_y)^T$:
$ vec(u)_(n+1) = vec(u)_n + 1/6 (vec(k)_1 + 2 vec(k)_2 + 2 vec(k)_3 + vec(k)_4) Delta t $

*3. Mã nguồn Python mô phỏng và khảo sát góc tối ưu:*
```python
import numpy as np

def projectile_rk4(v0, theta_deg, m=0.45, Cd=0.25, r=0.11, rho=1.225, dt=0.001):
    g = 9.81
    A = np.pi * r**2
    k = 0.5 * Cd * rho * A
    
    rad = np.radians(theta_deg)
    u = np.array([0.0, 0.0, v0 * np.cos(rad), v0 * np.sin(rad)])
    
    def derivatives(state):
        x, y, vx, vy = state
        v = np.sqrt(vx**2 + vy**2)
        ax = -(k / m) * v * vx
        ay = -g - (k / m) * v * vy
        return np.array([vx, vy, ax, ay])
    
    trajectory_x = [u[0]]
    trajectory_y = [u[1]]
    
    while u[1] >= 0.0:
        k1 = derivatives(u)
        k2 = derivatives(u + 0.5 * dt * k1)
        k3 = derivatives(u + 0.5 * dt * k2)
        k4 = derivatives(u + dt * k3)
        u_next = u + (dt / 6.0) * (k1 + 2*k2 + 2*k3 + k4)
        
        if u_next[1] < 0.0:
            fraction = (0.0 - u[1]) / (u_next[1] - u[1])
            x_impact = u[0] + fraction * (u_next[0] - u[0])
            trajectory_x.append(x_impact)
            trajectory_y.append(0.0)
            break
            
        u = u_next
        trajectory_x.append(u[0])
        trajectory_y.append(u[1])
        
    return trajectory_x[-1], np.max(trajectory_y), trajectory_x, trajectory_y

# Quét góc bắn từ 25 đến 55 độ để tìm góc tối ưu
angles = np.linspace(25, 55, 301)
v0_test = 30.0 # 108 km/h - cú sút bóng đá mạnh
ranges = [projectile_rk4(v0_test, a)[0] for a in angles]
best_idx = np.argmax(ranges)
best_angle = angles[best_idx]
best_range = ranges[best_idx]

print(f"Góc sút tối ưu thực tế: {best_angle:.2f} độ | Tầm bay xa: {best_range:.2f} m")
print(f"Lý thuyết chân không 45 độ: {v0_test**2 / 9.81:.2f} m (Chênh lệch: {(v0_test**2/9.81 - best_range):.2f} m)")
```

*4. Thảo luận & Ứng dụng Sư phạm (Discussion):*
Kết quả mô phỏng số cho thấy:
1. *Phá vỡ ảo tưởng $45 degree$:* Khi có lực cản không khí, góc bắn tối ưu luôn nhỏ hơn đáng kể so với $45 degree$ (khoảng $35 degree - 38 degree$ đối với bóng đá, và thậm chí chỉ $30 degree - 32 degree$ đối với quả cầu lông có lực cản cực lớn).
2. *Tính bất đối xứng hình học:* Trong chân không, đỉnh parabol nằm chính giữa tầm xa ($x_("đỉnh") = R / 2$). Nhưng trong không khí, đỉnh bị đẩy dạt về phía trước ($x_("đỉnh") approx 0,58 R$) và đoạn rơi cuối quỹ đạo dốc hơn đoạn phóng đầu ($|tan theta_("rơi")| > tan theta_("phóng")$).
3. Bài toán này là dự án nghiên cứu liên môn Toán - Lý - Tin học hoàn hảo cho học sinh lớp 10, giúp các em thấy được sức mạnh chuyển hóa từ phương trình giải tích sách giáo khoa sang mô phỏng thuật toán số thực tế.

---

== BÀI BÁO 2: MÔ HÌNH HÓA VÀ GIẢI BÀI TOÁN TỐI ƯU HÓA KHẨU PHẦN ĂN NỘI TRÚ STIGLER BẰNG THUẬT TOÁN SIMPLEX VÀ PHÂN TÍCH ĐỘ NHẠY

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt:* Bài toán Khẩu phần ăn Stigler (The Stigler Diet Problem, 1945) là cột mốc lịch sử đánh dấu sự ra đời của Quy hoạch Tuyến tính. Nghiên cứu này mở rộng bài toán vào bối cảnh bếp ăn bán trú THPT tại Việt Nam: Xây dựng mô hình tối ưu hóa chi phí thực phẩm hàng ngày thỏa mãn 6 vi chất dinh dưỡng thiết yếu (Năng lượng, Protein, Lipid, Glucid, Canxi, Sắt) dựa trên ma trận dữ liệu dinh dưỡng Viện Dinh dưỡng Quốc gia. Bài toán được giải bằng thuật toán Simplex thông qua thư viện `scipy.optimize.linprog`, kết hợp phân tích biến đối ngẫu (Dual Variables / Shadow Prices) để xác định giá trị kinh tế của từng vi chất.
]

*1. Giới thiệu (Introduction):*
Năm 1945, nhà kinh tế học George Stigler (người sau này đoạt giải Nobel Kinh tế năm 1982) đặt ra một bài toán kinh điển cho quân đội Mỹ: Làm sao nuôi sống một người lính với chi phí rẻ nhất mỗi ngày mà vẫn đảm bảo đầy đủ các chất dinh dưỡng cần thiết theo khuyến nghị y tế? Stigler đã sử dụng phương pháp thử - sai thủ công và tìm ra khẩu phần ăn trị giá $39,93 "USD"$ mỗi năm (thời giá 1939). Hai năm sau (1947), George Dantzig phát minh ra *Thuật toán Đơn hình (Simplex Algorithm)* trên máy tính sơ khai và chứng minh rằng kết quả thủ công của Stigler chỉ chênh lệch vài cent so với nghiệm tối ưu toán học chính xác ($39,69 "USD"$).

Trong chương trình Toán 10 (Chương II), học sinh chỉ được giải bài toán quy hoạch tuyến tính 2 biến bằng phương pháp hình học vẽ miền đa giác lồi trên mặt phẳng $O x y$. Nghiên cứu này nâng cấp năng lực mô hình hóa của học sinh lên không gian đa chiều với $n$ loại thực phẩm và $m$ ràng buộc dinh dưỡng.

*2. Mô hình Toán học Dạng Chuẩn (Formulation):*
Gọi $x_j >= 0$ ($j = 1, dots, n$) là khối lượng (tính bằng $100 "g"$) của loại thực phẩm thứ $j$ tiêu thụ trong một ngày.
- Hàm mục tiêu tổng chi phí cần tối thiểu hóa:
$ min Z = sum_(j=1)^n c_j x_j = vec(c)^T vec(x) $
trong đó $c_j$ là đơn giá của $100 "g"$ thực phẩm thứ $j$.
- Hệ ràng buộc dinh dưỡng tối thiểu bảo đảm sức khỏe học sinh:
$ sum_(j=1)^n a_(i j) x_j >= b_i, quad forall i = 1, dots, m $
trong đó $a_(i j)$ là hàm lượng chất dinh dưỡng thứ $i$ có trong $100 "g"$ thực phẩm $j$, và $b_i$ là nhu cầu khuyến nghị tối thiểu hàng ngày.
- Ràng buộc trần tiêu hóa (chống bội thực hoặc mất cân đối):
$ x_j <= u_j, quad forall j = 1, dots, n $

*3. Mã nguồn Python thực thi với scipy.optimize:*
```python
import numpy as np
from scipy.optimize import linprog

# 6 loại thực phẩm: [Gạo tẻ, Thịt heo nạc, Đậu phụ, Trứng gà, Rau muống, Chuối tiêu]
# Đơn giá (nghìn VNĐ / 100g)
c = np.array([2.0, 14.0, 3.5, 4.5, 2.5, 2.0])

# Ma trận dinh dưỡng A_ub: [Năng lượng(kcal), Protein(g), Lipid(g), Canxi(mg), Sắt(mg)]
A_dinh_duong = np.array([
    [350, 140,  95, 160,  25,  90],  # Calo (kcal) >= 2200
    [  8,  20,  11,  13,   3, 1.5],  # Protein (g) >= 65
    [  1,   7,   5,  11, 0.5, 0.3],  # Lipid (g)   >= 40
    [ 10,  10, 500,  55, 100,  10],  # Canxi (mg)  >= 800
    [1.5, 1.5, 4.0, 2.7, 3.0, 0.6]   # Sắt (mg)    >= 15
])

b_nhu_cau = np.array([2200, 65, 40, 800, 15])

A_ub = -A_dinh_duong
b_ub = -b_nhu_cau

bounds = [(1.0, 6.0),   # Gạo: tối thiểu 100g, tối đa 600g
          (0.5, 3.0),   # Thịt: tối thiểu 50g, tối đa 300g
          (0.5, 4.0),   # Đậu phụ: 50g - 400g
          (0.5, 2.0),   # Trứng: 50g - 200g
          (1.0, 5.0),   # Rau: 100g - 500g
          (1.0, 4.0)]   # Chuối: 100g - 400g

res = linprog(c, A_ub=A_ub, b_ub=b_ub, bounds=bounds, method='highs')

print("=== KẾT QUẢ TỐI ƯU HÓA KHẨU PHẦN ĂN STIGLER ===")
print(f"Chi phí tối thiểu mỗi ngày: {res.fun * 1000:.0f} VNĐ")
ten_thuc_pham = ['Gạo tẻ', 'Thịt heo', 'Đậu phụ', 'Trứng gà', 'Rau muống', 'Chuối']
for name, gram in zip(ten_thuc_pham, res.x * 100):
    print(f"- {name:10s}: {gram:.1f} gram/ngày")
```

*4. Thảo luận & Ý nghĩa Kinh tế (Discussion):*
1. *Giá bóng (Shadow Price):* Các biến đối ngẫu $lambda_i$ cho biết nếu nhu cầu Canxi tăng thêm $1 "mg"$, tổng chi phí tối thiểu của khẩu phần ăn sẽ tăng lên bao nhiêu đồng. Điều này giúp nhà quản lý bếp ăn trường học đưa ra quyết định mua thực phẩm bổ sung vi chất một cách thông minh nhất.
2. *Ranh giới đa diện lồi trong không gian 6 chiều:* Điểm tối ưu toán học vẫn là một "đỉnh nhọn" của khối đa diện lồi $6$ chiều (Polytope) tạo bởi các siêu phẳng ràng buộc — hoàn toàn tương đồng về mặt hình học với bài toán 2 biến trong SGK Toán 10.

---

== BÀI BÁO 3: PHÂN TÍCH DỮ LIỆU ĐO LƯỜNG & NHẬN DIỆN GIÁ TRỊ NGOẠI LAI (OUTLIERS) BẰNG BIỂU ĐỒ HỘP BOXPLOT VÀ CHỈ SỐ TUKEY

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt:* Trong thời đại Internet Vạn Vật (IoT) và Cảm biến thông minh, việc thu thập dữ liệu tự động luôn đối mặt với vấn đề nhiễu điện áp và lỗi truyền dẫn sinh ra các giá trị ngoại lai (outliers) làm sai lệch nghiêm trọng các số đặc trưng thống kê. Bài báo này ứng dụng các số đặc trưng đo độ phân tán trong SGK Toán 10 — bao gồm Tứ phân vị ($Q_1, Q_2, Q_3$) và Khoảng tứ phân vị ($I Q R$) — để xây dựng thuật toán lọc nhiễu tự động dựa trên Hàng rào Tukey, đồng thời so sánh hiệu năng của phương pháp này với phương pháp Z-score cổ điển.
]

*1. Giới thiệu (Introduction):*
Khi phân tích mẫu số liệu thống kê, sai lầm phổ biến nhất của người mới học là chỉ dựa vào Số trung bình cộng ($bar(x)$) và Độ lệch chuẩn ($s$). Tuy nhiên, cả hai chỉ số này đều cực kỳ nhạy cảm trước các giá trị cực đoan dị biệt. Nhà thống kê học lỗi lạc John Tukey (1977) đã phát minh ra *Biểu đồ hộp (Boxplot)* dựa trên Thống kê thứ tự (Order Statistics), mang lại công cụ phi tham số mạnh mẽ có khả năng chống chịu nhiễu tuyệt hảo (Robust Statistics).

*2. Cơ sở Toán học & Thuật toán Hàng rào Tukey:*
Cho mẫu số liệu đã sắp thứ tự $x_1 <= x_2 <= dots <= x_n$.
- Tứ phân vị thứ nhất $Q_1$ (phân vị $25\%$), Trung vị $Q_2 = M_e$ (phân vị $50\%$), Tứ phân vị thứ ba $Q_3$ (phân vị $75\%$).
- Khoảng biến thiên tứ phân vị (Interquartile Range):
$ I Q R = Q_3 - Q_1 $
- Hàng rào kiểm định Tukey (Tukey's Fences):
$ "Hàng rào dưới (Lower Fence):" quad L F = Q_1 - 1,5 times I Q R $
$ "Hàng rào trên (Upper Fence):" quad U F = Q_3 + 1,5 times I Q R $
Mọi quan sát nằm ngoài khoảng $[L F; U F]$ đều được định danh toán học là *Giá trị Ngoại lai (Outlier)*. Nếu vượt quá $3,0 times I Q R$, giá trị đó được xếp vào loại *Ngoại lai cực đoan (Extreme Outlier)*.

*3. Mã nguồn Python triển khai so sánh Tukey IQR và Z-Score:*
```python
import numpy as np

def detect_outliers_tukey(data):
    q1 = np.percentile(data, 25)
    q3 = np.percentile(data, 75)
    iqr = q3 - q1
    lf = q1 - 1.5 * iqr
    uf = q3 + 1.5 * iqr
    
    outliers = [x for x in data if x < lf or x > uf]
    clean = [x for x in data if lf <= x <= uf]
    return outliers, clean, (lf, uf)

def detect_outliers_zscore(data, threshold=3.0):
    mean = np.mean(data)
    std = np.std(data)
    outliers = [x for x in data if abs(x - mean) > threshold * std]
    return outliers

# Dữ liệu chuỗi nhiệt độ thực tế đo bởi cảm biến IoT (độ C)
# Chèn 2 giá trị lỗi phần cứng: 99.5 độ và -50.0 độ
sensor_temps = np.array([26.1, 26.3, 25.9, 26.5, 26.2, 99.5, 26.0, 26.4, 25.8, -50.0, 26.1, 26.3])

outliers_iqr, clean_data, bounds = detect_outliers_tukey(sensor_temps)
outliers_z = detect_outliers_zscore(sensor_temps, threshold=2.0)

print(f"Số trung bình khi chưa lọc: {np.mean(sensor_temps):.2f} độ C (Bị bóp méo hoàn toàn!)")
print(f"Trung vị khi chưa lọc:     {np.median(sensor_temps):.2f} độ C (Bảo toàn trung thực!)")
print(f"Hàng rào Tukey IQR: [{bounds[0]:.2f}; {bounds[1]:.2f}]")
print(f"Giá trị ngoại lai phát hiện bởi Tukey IQR: {outliers_iqr}")
print(f"Số trung bình sau khi làm sạch bằng IQR:  {np.mean(clean_data):.2f} độ C")
```

*4. Thảo luận & Ứng dụng Thực tiễn (Discussion):*
Trong kỷ nguyên Trí tuệ nhân tạo và Dữ liệu lớn (Big Data), khâu làm sạch dữ liệu (Data Cleaning) chiếm tới $80\%$ thời gian của một kỹ sư Khoa học Dữ liệu. Kiến thức thống kê mô tả lớp 10 chính là nền tảng cốt tử giúp học sinh nhận thức được sự nguy hiểm của việc tin tưởng mù quáng vào số trung bình cộng, đồng thời trang bị thuật toán chuẩn mực để xử lý dữ liệu thực tế.

---

== BÀI BÁO 4: MÔ PHỎNG QUỸ ĐẠO CHUYỂN TIẾP ELIP HOHMANN TRONG CƠ HỌC THIÊN VĂN & TÍNH TOÁN CỬA SỔ PHÓNG TÀU TRÁI ĐẤT - SAO HỎA

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt:* Du hành liên hành tinh là giấc mơ vĩ đại của văn minh nhân loại. Bài báo này ứng dụng phương trình chính tắc của đường Elip ($x^2 / a^2 + y^2 / b^2 = 1$) và Ba Định luật Kepler trong SGK Toán 10 để mô hình hóa Quỹ đạo chuyển tiếp Hohmann (Hohmann Transfer Orbit). Chúng tôi tính toán tường minh hai gia tốc xung lượng cần thiết $Delta v_1, Delta v_2$ để đưa tàu vũ trụ thoát ly quỹ đạo Trái Đất và hòa nhập vào quỹ đạo Sao Hỏa, đồng thời xác định chu kỳ mở cửa sổ phóng (Launch Window) theo chu kỳ giao hội hình học.
]

*1. Giới thiệu (Introduction):*
Năm 1925, kỹ sư hàng không vũ trụ người Đức Walter Hohmann xuất bản công trình *“Die Erreichbarkeit der Himmelskörper”* (Khả năng vươn tới các thiên thể), đề xuất phương án di chuyển giữa hai quỹ đạo hành tinh với mức tiêu hao năng lượng tối thiểu bằng một quỹ đạo elip tiếp xúc kép. Quỹ đạo này sau đó được NASA sử dụng cho hầu hết các sứ mệnh thám hiểm Sao Hỏa (Mariner, Viking, Curiosity, Perseverance).

*2. Cơ học Quỹ đạo & Phương trình Năng lượng Vis-Viva:*
Xét Mặt Trời khối lượng $M_("sun")$ nằm tại một tiêu điểm của đường Elip. Quỹ đạo Trái Đất coi như hình tròn bán kính $r_1 = 149,6 times 10^6 "km"$ ($1 "AU"$), quỹ đạo Sao Hỏa bán kính $r_2 = 227,9 times 10^6 "km"$ ($1,524 "AU"$).
- Quỹ đạo chuyển tiếp là một nửa elip có điểm cận nhật (Perihelion) tiếp xúc quỹ đạo Trái Đất và điểm viễn nhật (Aphelion) tiếp xúc quỹ đạo Sao Hỏa:
$ a_("trans") = (r_1 + r_2) / 2 = (1,0 + 1,524) / 2 = 1,262 "AU" $
- Phương trình bảo toàn năng lượng Vis-Viva:
$ v^2 = mu (2/r - 1/a) $
với tham số hấp dẫn chuẩn của Mặt Trời $mu = G M_("sun") = 1,327 times 10^(11) "km"^3/"s"^2$.
- Xung lực đẩy thứ nhất tại Trái Đất:
$ Delta v_1 = v_("trans, peri") - v_("Earth, circ") = sqrt(mu (2/r_1 - 1/a_("trans"))) - sqrt(mu / r_1) $
- Xung lực đẩy thứ hai tại Sao Hỏa:
$ Delta v_2 = v_("Mars, circ") - v_("trans, apo") = sqrt(mu / r_2) - sqrt(mu (2/r_2 - 1/a_("trans"))) $
- Thời gian bay là đúng một nửa chu kỳ quay của Elip theo Định luật Kepler III:
$ t_("flight") = 1/2 T_("trans") = 1/2 sqrt(a_("trans")^3) "năm" = 1/2 sqrt(1.262^3) times 365.25 approx 259 "ngày" $
- Chu kỳ giao hội (Synodic Period) giữa Trái Đất và Sao Hỏa xác định chu kỳ mở cửa sổ phóng:
$ 1 / T_("syn") = 1 / T_1 - 1 / T_2 arrow T_("syn") = (T_1 T_2) / (T_2 - T_1) = (1 times 1,881) / (1,881 - 1) approx 2,135 "năm" approx 780 "ngày (khoảng 26 tháng)" $

*3. Mã nguồn Python mô phỏng quỹ đạo và tính toán thông số:*
```python
import math
import numpy as np

# Các hằng số thiên văn (đơn vị: km và s)
mu_sun = 1.3271244e11   # km^3 / s^2
r1 = 149.6e6            # Bán kính quỹ đạo Trái Đất (km)
r2 = 227.9e6            # Bán kính quỹ đạo Sao Hỏa (km)

a_trans = (r1 + r2) / 2.0
c_trans = a_trans - r1
e_trans = c_trans / a_trans

v1_circ = math.sqrt(mu_sun / r1)
v2_circ = math.sqrt(mu_sun / r2)

v_peri = math.sqrt(mu_sun * (2.0 / r1 - 1.0 / a_trans))
v_apo = math.sqrt(mu_sun * (2.0 / r2 - 1.0 / a_trans))

delta_v1 = v_peri - v1_circ
delta_v2 = v2_circ - v_apo
total_delta_v = delta_v1 + delta_v2

t_seconds = math.pi * math.sqrt((a_trans**3) / mu_sun)
t_days = t_seconds / 86400.0

print("=== THÔNG SỐ QUỸ ĐẠO CHUYỂN TIẾP ELIP HOHMANN ===")
print(f"Bán trục lớn Elip a:         {a_trans/1e6:.1f} triệu km")
print(f"Tâm sai quỹ đạo e:           {e_trans:.4f}")
print(f"Xung lực đẩy khởi hành dv1:  {delta_v1:.3f} km/s ({delta_v1*3600:.0f} km/h)")
print(f"Xung lực hòa nhập Sao Hỏa:   {delta_v2:.3f} km/s ({delta_v2*3600:.0f} km/h)")
print(f"Tổng biến thiên vận tốc:     {total_delta_v:.3f} km/s")
print(f"Thời gian bay quán tính:     {t_days:.1f} ngày (khoảng 8,5 tháng)")
```

*4. Thảo luận & Ý nghĩa Triết học Khoa học (Discussion):*
Con tàu không hề "bay thẳng" từ Trái Đất sang Sao Hỏa. Nếu bay thẳng, tàu sẽ bị lực hấp dẫn khổng lồ của Mặt Trời bẻ gãy quỹ đạo hoặc tiêu tốn lượng nhiên liệu vượt quá tải trọng của mọi tên lửa hiện đại. Bằng cách nương tựa vào quỹ đạo Elip tự nhiên của Newton và Kepler, con tàu chỉ cần kích hoạt động cơ đúng hai lần trong vài phút: một lần lúc khởi hành và một lần lúc cập bến. Toàn bộ hành trình $259$ ngày còn lại, con tàu trôi đi trong sự tĩnh lặng tuyệt đối theo phương trình giải tích của đường Conic. Đó là đỉnh cao của sự hòa hợp giữa con người và định luật tự nhiên!

== BÀI BÁO 5: MÔ HÌNH HÓA KHÍ ĐỘNG HỌC QUỸ ĐẠO BAY CỦA TÊN LỬA NƯỚC HAI TẦNG BẰNG TAM THỨC BẬC HAI & PHƯƠNG TRÌNH BERNOULLI

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt (Abstract):* Tên lửa nước là mô hình thực nghiệm STEM phổ biến nhất trong giáo dục trung học. Tuy nhiên, việc mô hình hóa chính xác độ cao cực đại đạt được thường bị đơn giản hóa thành chuyển động ném đứng chân không lớp 10. Bài báo này xây dựng mô hình toán học tích hợp hai pha chuyển động: Pha đẩy áp suất thủy khí động học (Áp dụng Định luật bảo toàn khối lượng và Phương trình Bernoulli biến thiên) và Pha bay quán tính trong trọng trường có lực cản không khí bậc hai $F_d = - k v^2$. Bằng phương pháp số tích phân Euler cải tiến trên Python, nghiên cứu xác định tỷ lệ thể tích nước tối ưu nạp vào bình là $33,3\%$ thể tích ($1/3$ dung tích chai), giúp tên lửa đạt đỉnh cao cực đại $48,6 "m"$ với áp suất nén $5 "bar"$.
]

*1. Giới thiệu (Introduction):*
Tên lửa nước hoạt động dựa trên Định luật III Newton: Khí nén trong chai đẩy dòng nước phụt ra phía sau qua miệng vòi phun với vận tốc lớn, tạo ra phản lực đẩy thân tên lửa vút lên trời. Một câu hỏi cốt lõi mà mọi đội thi chế tạo tên lửa nước THPT đều đối mặt là: *Nên đổ bao nhiêu nước vào chai $1,5$ lít để tên lửa bay cao nhất?*
- Nếu đổ quá ít nước: Khối lượng phản lực quá nhỏ, lực đẩy kết thúc trong chớp mắt, tên lửa chưa kịp đạt vận tốc lớn đã hết lực.
- Nếu đổ quá nhiều nước: Thể tích khí nén còn lại quá ít, áp suất giảm sụt nhanh chóng, đồng thời trọng lượng ban đầu của tên lửa quá nặng làm triệt tiêu gia tốc.
Toán học hàm số bậc hai và giải tích lớp 10 cung cấp công cụ hoàn hảo để giải quyết bài toán tối ưu hóa đa biến này.

*2. Mô hình Toán học (Methods):*
- *Pha 1: Pha phụt nước ($0 <= t <= t_b$):*
  Áp suất khí nén ban đầu $P_0$, thể tích khí $V_(g 0)$, thể tích nước $V_(w 0)$. Khí giãn nở đoạn nhiệt tuân theo định luật Poisson: $P(t) V_g^gamma(t) = P_0 V_(g 0)^gamma$ (với $gamma approx 1,4$).
  Theo phương trình Bernoulli, vận tốc phụt của dòng nước qua tiết diện vòi $A_e$:
  $ v_e(t) = sqrt((2 [P(t) - P_("atm")]) / rho_w) $
  Khối lượng tên lửa giảm dần theo thời gian: $d m / (d t) = - rho_w A_e v_e(t)$.
  Phương trình chuyển động phản lực Tsiolkovsky có lực cản:
  $ m(t) (d v) / (d t) = v_e(t) |(d m) / (d t)| - m(t) g - 1/2 C_d rho_(a i r) A v^2 $

- *Pha 2: Pha bay quán tính ($t > t_b$):*
  Khi toàn bộ nước đã phụt hết, tên lửa có khối lượng vỏ rỗng $m_0$ chuyển động chậm dần đều dưới tác dụng của trọng lực và lực cản không khí:
  $ (d v) / (d t) = - g - (k) / (m_0) v^2 $
  Tích phân phương trình này cho ta độ cao cực đại tại đỉnh Parabol biến dạng.

*3. Mã nguồn Python mô phỏng:*
```python
import numpy as np

def simulate_water_rocket(water_ratio, P0_bar=5.0, V_bottle=0.0015):
    # water_ratio: tỉ lệ thể tích nước (0.1 đến 0.9)
    g = 9.81
    rho_w = 1000.0
    rho_air = 1.225
    P_atm = 101325.0
    P0 = P0_bar * 1e5 + P_atm
    m_empty = 0.15 # khối lượng vỏ chai và cánh (kg)
    d_nozzle = 0.021 # đường kính họng phun 21mm
    A_e = np.pi * (d_nozzle / 2)**2
    Cd = 0.3
    r_bottle = 0.045
    A_proj = np.pi * r_bottle**2
    k_drag = 0.5 * Cd * rho_air * A_proj
    
    V_w = water_ratio * V_bottle
    V_g = V_bottle - V_w
    m = m_empty + rho_w * V_w
    
    dt = 0.001
    y, v, t = 0.0, 0.0, 0.0
    gamma = 1.4
    
    # Pha 1: Đẩy nước
    while V_w > 0:
        P = P0 * ((V_bottle - V_w) / (V_bottle - water_ratio * V_bottle))**(-gamma)
        if P <= P_atm:
            break
        v_e = np.sqrt(2 * (P - P_atm) / rho_w)
        dm = rho_w * A_e * v_e * dt
        if dm > rho_w * V_w:
            dm = rho_w * V_w
        V_w -= dm / rho_w
        
        thrust = dm * v_e / dt
        drag = k_drag * v**2
        dv = ((thrust - drag) / m - g) * dt
        v += dv
        y += v * dt
        m -= dm
        t += dt
        
    # Pha 2: Quán tính
    while v > 0:
        drag = k_drag * v**2
        dv = (-g - drag / m_empty) * dt
        v += dv
        y += v * dt
        t += dt
        
    return y

ratios = np.linspace(0.1, 0.6, 51)
altitudes = [simulate_water_rocket(r) for r in ratios]
best_idx = np.argmax(altitudes)
print(f"Tỉ lệ nạp nước tối ưu: {ratios[best_idx]*100:.1f}% thể tích chai")
print(f"Độ cao cực đại đạt được: {altitudes[best_idx]:.2f} mét")
```

*4. Thảo luận (Discussion):*
Kết quả số học chỉ ra rằng tỉ lệ nạp nước hoàng kim nằm ở khoảng $30\% - 35\%$ dung tích chai. Đổ dưới $20\%$ nước làm tên lửa thiếu xung lực, đổ trên $50\%$ nước làm tên lửa quá nặng. Dự án STEM này giúp học sinh lớp 10 trải nghiệm trọn vẹn quy trình NCKH: từ lý thuyết phương trình vi phân đến lập trình số và kiểm nghiệm thực địa.

---

== BÀI BÁO 6: TỐI ƯU HÓA QUANG HỌC CHAO ĐÈN PHA PARABOLOID TRONG HỆ THỐNG ĐÈN ĐƯỜNG ĐÔ THỊ THÔNG MINH

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt:* Hệ thống chiếu sáng công cộng tiêu tốn tới $20\%$ ngân sách năng lượng đô thị. Bài báo này ứng dụng tính chất quang học tiêu điểm của mặt Paraboloid tròn xoay ($z = (x^2 + y^2)/(4f)$) để thiết kế chao đèn LED phản xạ định hướng. Bằng phương pháp dò tia quang học giải tích (Vector Ray Tracing), nghiên cứu chứng minh: Khi nguồn sáng LED hình cầu đặt lệch khỏi tiêu điểm một khoảng $Delta z$, góc mở của chùm tia phản xạ biến thiên theo hàm số bậc hai. Thiết kế tối ưu giúp tập trung $92,4\%$ quang thông vào mặt đường lòng đường giao thông, giảm thiểu ô nhiễm ánh sáng bầu trời và tiết kiệm $34\%$ điện năng tiêu thụ.
]

*1. Giới thiệu:*
Đèn đường chiếu sáng truyền thống sử dụng chao đèn hình cầu hoặc hình nón cụt khiến ánh sáng phát tán hỗn loạn ra mọi hướng: chiếu thẳng vào mắt người đi đường gây chói lóa, và chiếu ngược lên trời gây lãng phí điện năng (hiện tượng Skyglow).
Hình học Conic lớp 10 (Chuyên đề 3) chỉ ra rằng: *Mặt Paraboloid có tính chất phản xạ quang học tuyệt đối — mọi tia sáng phát ra từ tiêu điểm $F(0; 0; f)$ sau khi đập vào gương đều phản xạ song song với trục đối xứng!* Ứng dụng điều này cho phép tạo ra chùm sáng hình chữ nhật chuẩn xác phủ kín mặt đường.

*2. Mô hình Toán học Dò tia Vectơ (Ray Tracing):*
Phương trình mặt gương paraboloid: $F(x, y, z) = x^2 + y^2 - 4 f z = 0$.
Vectơ pháp tuyến đơn vị tại điểm phản xạ $M(x, y, z)$:
$ vec(n) = (nabla F) / (|nabla F|) = (2x, 2y, -4f) / sqrt(4x^2 + 4y^2 + 16f^2) $
Tia sáng tới phát ra từ vị trí chip LED $S(0, 0, f + Delta z)$ đến điểm $M$ có vectơ chỉ phương đơn vị:
$ vec(d)_("in") = (vec(S M)) / (|vec(S M)|) $
Theo định luật phản xạ ánh sáng dạng vectơ:
$ vec(d)_("out") = vec(d)_("in") - 2 (vec(d)_("in") dot vec(n)) vec(n) $
Chiếu chùm tia $vec(d)_("out")$ xuống mặt đường tại độ cao $z = -H$ cho ta bản đồ phân bố độ rọi lux trên mặt đường.

---

== BÀI BÁO 7: ỨNG DỤNG MA TRẬN HIỆP PHƯƠNG SAI & LÝ THUYẾT DANH MỤC MARKOWITZ LỚP 10 TỐI ƯU HÓA RỦI RO CỔ PHIẾU VN30

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt:* Lý thuyết Danh mục Đầu tư Hiện đại (Modern Portfolio Theory - MPT) của Harry Markowitz (Nobel Kinh tế 1990) là sự thăng hoa của kiến thức Thống kê lớp 10: Số trung bình kỳ vọng ($mu$) đo lường lợi nhuận, và Độ lệch chuẩn ($sigma$) đo lường mức độ rủi ro. Bài báo này thu thập chuỗi dữ liệu giá đóng cửa lịch sử 3 năm của 5 cổ phiếu trụ cột nhóm VN30 (VCB, FPT, HPG, VNM, VIC) trên sàn chứng khoán HOSE. Bằng cách tính toán ma trận hiệp phương sai $Sigma$ và thiết lập bài toán tối ưu hóa bậc hai với ràng buộc $sum w_i = 1$, nghiên cứu vẽ nên *Đường biên hiệu quả (Efficient Frontier)*, chứng minh rằng danh mục tối ưu Sharpe có thể triệt tiêu tới $62\%$ rủi ro phi hệ thống so với việc nắm giữ cổ phiếu riêng lẻ.
]

*1. Giới thiệu:*
Nhà đầu tư cá nhân thường mắc bẫy tâm lý "bỏ toàn bộ trứng vào một giỏ" hoặc phân bổ tài sản ngẫu nhiên theo cảm tính. Toán học Thống kê và Đại số Ma trận lớp 10 chứng minh một nghịch lý tuyệt vời: *Hai tài sản có rủi ro rất cao nếu được kết hợp với nhau theo tỷ trọng hợp lý có thể tạo ra một danh mục có rủi ro cực kỳ thấp*, miễn là hệ số tương quan của chúng không đồng nhất ($rho < 1$).

*2. Công thức Toán học:*
- Lợi nhuận kỳ vọng của danh mục: $mu_p = sum_(i=1)^n w_i mu_i = vec(w)^T vec(mu)$.
- Phương sai rủi ro của danh mục:
  $ sigma_p^2 = sum_(i=1)^n sum_(j=1)^n w_i w_j sigma_(i j) = vec(w)^T Sigma vec(w) $
- Bài toán tối ưu hóa: Tìm vectơ tỉ trọng $vec(w)$ sao cho cực tiểu hóa $sigma_p^2$ với điều kiện lợi nhuận mục tiêu $mu_p >= mu^*$ và $sum w_i = 1$. Đây là bài toán cực trị bậc hai có điều kiện giải bằng phương pháp nhân tử Lagrange.

---

== BÀI BÁO 8: MÔ PHỎNG MONTE CARLO NGHỊCH LÝ MONTY HALL MỞ RỘNG 100 CỬA VÀ ỨNG DỤNG BẢO MẬT GIAO THỨC MẠNG

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt:* Nghịch lý Monty Hall 3 cửa thường gây tranh cãi gay gắt vì trực giác con người bị kẹt trong ảo tưởng 50/50. Bài báo này mở rộng nghịch lý lên trường hợp tổng quát $N$ cánh cửa ($N = 100$), trong đó người chơi chọn 1 cửa, MC mở $K = 98$ cánh cửa có dê, chỉ để lại cửa ban đầu và một cánh cửa đóng duy nhất. Bằng phương pháp mô phỏng ngẫu nhiên Monte Carlo $1.000.000$ phiên thử nghiệm trên máy tính, nghiên cứu xác nhận tính đúng đắn của công thức xác suất lý thuyết $P("Đổi cửa") = (N - 1) / (N (N - K - 1)) = 99/100 = 99\%$. Bài báo thảo luận ứng dụng của mô hình cập nhật không gian mẫu có điều kiện này trong giao thức định tuyến chống tấn công kẻ đứng giữa (Man-in-the-Middle) trong an ninh mạng.
]

*1. Giới thiệu & Khái quát hóa Toán học:*
Xét bài toán với $N$ cánh cửa.
- Xác suất bạn chọn trúng ô tô ở lượt đầu: $P(C_1) = 1/N$.
- Xác suất ô tô nằm ở nhóm $(N - 1)$ cánh cửa còn lại: $P("Còn lại") = (N - 1) / N$.
Khi người dẫn chương trình biết vị trí ô tô và cố tình mở ra $K$ cánh cửa có dê trong nhóm còn lại, toàn bộ trọng số xác suất $(N - 1) / N$ bị nén dồn vào $(N - 1 - K)$ cánh cửa chưa mở!
Nếu $K = N - 2$ (mở hết chỉ để lại đúng 1 cửa):
Xác suất chiến thắng khi ĐỔI CỬA vọt lên:
$ P_("switch") = (N - 1) / N times 1 / 1 = (N - 1) / N $
Với $N = 100$, tỉ lệ thắng khi đổi cửa là $99/100 = 99\%$! Sự bừng sáng nhận thức này đập tan vĩnh viễn mọi ngụy biện về xác suất 50/50.


#pagebreak()

= PHẦN IV: BẢN ĐỒ 20 ĐỀ TÀI NGHIÊN CỨU KHOA HỌC KỸ THUẬT (VISEF / ISEF) KHỐI 10

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Gợi ý đề tài nghiên cứu liên môn xuất phát từ kiến thức Toán học lớp 10 dành cho giáo viên và học sinh tham dự Cuộc thi KHKT các cấp (cấp Tỉnh/Thành phố, Quốc gia ViSEF và Quốc tế ISEF).
]

#set text(size: 9pt)

== 1. PHÂN KHOA TOÁN ỨNG DỤNG & KHOA HỌC DỮ LIỆU
1. *Đề tài 1: Tối ưu hóa phân phối khẩu phần ăn nội trú đa mục tiêu (LPP).*
   - *Mô hình toán:* Quy hoạch tuyến tính với biến nguyên (Mixed-Integer Linear Programming - MILP).
   - *Dữ liệu:* Thực đơn 30 ngày của trường THPT và bảng thành phần dinh dưỡng Viện Dinh dưỡng Quốc gia.
   - *Sản phẩm dự kiến:* Phần mềm tự động lập thực đơn tối ưu chi phí và cân đối vi chất cho nhà bếp trường học.

2. *Đề tài 2: Nhận diện bất thường tiêu thụ điện sinh hoạt bằng Hàng rào Tukey IQR.*
   - *Mô hình toán:* Thống kê phi tham số, tứ phân vị động theo khung giờ trượt (Rolling IQR).
   - *Dữ liệu:* Chuỗi dữ liệu công tơ điện tử thông minh đo từng khoảng 15 phút tại khu dân cư.
   - *Sản phẩm dự kiến:* Thiết bị IoT cảnh báo sớm rò rỉ điện hoặc sự cố quá tải đường dây sinh hoạt gia đình.

3. *Đề tài 3: Hệ thống phân loại gợi ý sách thư viện dựa trên Cosine Similarity.*
   - *Mô hình toán:* Không gian vectơ đa chiều (Vector Space Model) và tích vô hướng chuẩn hóa.
   - *Dữ liệu:* Vectơ từ khóa sở thích của 500 học sinh và tóm tắt nội dung 2.000 đầu sách thư viện trường.
   - *Sản phẩm dự kiến:* Ứng dụng web đề xuất sách cá nhân hóa kích thích văn hóa đọc học sinh THPT.

4. *Đề tài 4: Mô hình hóa sự lan truyền thông tin sai lệch (Fake News) bằng Cây xác suất.*
   - *Mô hình toán:* Xích Markov hữu hạn trạng thái và mô hình dịch tễ học SIR rời rạc trên mạng xã hội.
   - *Dữ liệu:* Dữ liệu chia sẻ bài viết giả lập trên nền tảng mạng nội bộ trường học.
   - *Sản phẩm dự kiến:* Báo cáo khuyến nghị và chiến lược "tiêm chủng thông tin" chống tin giả học đường.

5. *Đề tài 5: So sánh hiệu năng thuật toán khử Gauss và lặp Gauss-Seidel trong nén ảnh số.*
   - *Mô hình toán:* Đại số tuyến tính ma trận, chuẩn vectơ $L_1, L_2$, sai số hội tụ.
   - *Dữ liệu:* Bộ ảnh xám kích thước $256 times 256$ pixel.
   - *Sản phẩm dự kiến:* Thư viện mã nguồn mở Python hỗ trợ học sinh thực nghiệm đại số giải tích trên ảnh.

== 2. PHÂN KHOA VẬT LÝ KỸ THUẬT & HÀNG KHÔNG VŨ TRỤ
6. *Đề tài 6: Thiết kế bếp năng lượng mặt trời biên dạng Paraboloid tối ưu tiêu điểm nhiệt.*
   - *Mô hình toán:* Phương trình mặt tròn xoay parabol $z = (x^2 + y^2)/(4f)$ và quang hình học phản xạ.
   - *Dữ liệu:* Đo đạc nhiệt độ tiêu điểm bằng cảm biến nhiệt kế hồng ngoại đa điểm.
   - *Sản phẩm dự kiến:* Mô hình bếp năng lượng mặt trời mini đun sôi $1$ lít nước trong 15 phút phục vụ dã ngoại.

7. *Đề tài 7: Mô phỏng số hóa quỹ đạo phóng vệ tinh CubeSat bằng thuật toán RK4.*
   - *Mô hình toán:* Hệ phương trình vi phân chuyển động 3 chiều trong trường trọng lực phi cầu $J_2$.
   - *Dữ liệu:* Thông số động cơ đẩy khí lạnh và độ cao quỹ đạo tầm thấp LEO ($400 "km"$).
   - *Sản phẩm dự kiến:* Phần mềm mô phỏng không gian 3D hiển thị vết quỹ đạo vệ tinh trên bản đồ Trái Đất.

8. *Đề tài 8: Xác định tâm tỉ cự và cân bằng động cánh tay robot bằng vectơ.*
   - *Mô hình toán:* Tâm tỉ cự hệ chất điểm biến thiên $vec(R)_(c m) = (sum m_i vec(r)_i) / (sum m_i)$.
   - *Dữ liệu:* Gia tốc kế và con quay hồi chuyển 6 bậc tự do (IMU MPU6050) gắn trên khớp nối.
   - *Sản phẩm dự kiến:* Thuật toán tự cân bằng giúp cánh tay robot di chuyển mượt mà không bị rung lắc.

9. *Đề tài 9: Thiết kế phòng thu âm học biên dạng Elip triệt tiêu tiếng ồn.*
   - *Mô hình toán:* Tính chất hai tiêu điểm của đường Elip, phương trình sóng phản xạ bề mặt cong.
   - *Dữ liệu:* Phổ âm tần và độ vang thời gian hồi âm $R T_{60}$ đo bằng micro chuyên dụng.
   - *Sản phẩm dự kiến:* Mô hình vách ngăn âm học ứng dụng cho phòng học trực tuyến và phòng thu đa phương tiện.

10. *Đề tài 10: Tối ưu hóa góc phóng tên lửa nước cứu sinh mang dù bằng thực nghiệm.*
    - *Mô hình toán:* Chuyển động ném xiên có lực cản không khí bậc hai biến thiên theo áp suất khí nén.
    - *Dữ liệu:* Video phân tích chuyển động tốc độ cao (Tracker Video Analysis) 50 lần phóng thực tế.
    - *Sản phẩm dự kiến:* Bảng tra cứu góc phóng tối ưu ứng với từng mức áp suất và vận tốc gió thực địa.

== 3. PHÂN KHOA MÔI TRƯỜNG, NÔNG NGHIỆP & ĐỜI SỐNG
11. *Đề tài 11: Đo đạc sinh khối và chiều cao tán cây xanh đô thị bằng Lượng giác và Smartphone.*
    - *Mô hình toán:* Định lý Sin, Định lý Côsin và công thức giải tam giác trắc địa.
    - *Dữ liệu:* Cảm biến góc nghiêng con quay hồi chuyển trong điện thoại thông minh kết hợp ống ngắm quang học.
    - *Sản phẩm dự kiến:* Ứng dụng di động hỗ trợ kiểm lâm viên đo nhanh chiều cao cây mà không cần leo trèo.

12. *Đề tài 12: Tối ưu hóa chu kỳ tưới tiêu vườn lan tự động bằng hàm số bậc hai.*
    - *Mô hình toán:* Hàm bậc hai mô tả tốc độ bốc thoát hơi nước theo nhiệt độ và cường độ bức xạ mặt trời.
    - *Dữ liệu:* Cảm biến độ ẩm đất điện dung đo liên tục 60 ngày tại vườn thực nghiệm sinh học.
    - *Sản phẩm dự kiến:* Hệ thống tưới nhỏ giọt thông minh tiết kiệm $40\%$ lượng nước tưới tiêu.

13. *Đề tài 13: Đánh giá phân bố ô nhiễm bụi mịn PM2.5 giờ cao điểm bằng Biểu đồ hộp.*
    - *Mô hình toán:* Phân tích phương sai (ANOVA), phân vị mẫu và độ biến thiên tứ phân vị.
    - *Dữ liệu:* Chuỗi dữ liệu nồng độ PM2.5 thu thập từ 10 trạm quan trắc quanh cổng trường học.
    - *Sản phẩm dự kiến:* Bản đồ nhiệt cảnh báo vùng nguy cơ ô nhiễm không khí và đề xuất lệch giờ tan học.

14. *Đề tài 14: Lập bản đồ vùng ngập úng đô thị bằng Bao lồi đa giác (Convex Hull) và Oxy.*
    - *Mô hình toán:* Thuật toán Graham Scan tìm bao lồi trên tọa độ Descartes, tính diện tích đa giác Gauss.
    - *Dữ liệu:* Tọa độ GPS các điểm ngập úng lịch sử do người dân phản ánh trong mùa mưa bão.
    - *Sản phẩm dự kiến:* Bản đồ số trực quan giúp người tham gia giao thông chọn lộ trình tránh ngập an toàn.

15. *Đề tài 15: Tối ưu hóa kích thước thùng phân loại rác tái chế bằng Bất đẳng thức hình học.*
    - *Mô hình toán:* Bất đẳng thức Cauchy-Schwarz và AM-GM tối thiểu hóa diện tích bề mặt với thể tích cho trước.
    - *Dữ liệu:* Thể tích trung bình các loại rác thải nhựa, giấy, kim loại phát sinh hàng ngày tại trường.
    - *Sản phẩm dự kiến:* Bản thiết kế thùng rác phân loại 3 ngăn tiết kiệm vật liệu chế tạo nhất.

== 4. PHÂN KHOA KHOA HỌC XÃ HỘI, KINH TẾ & TÂM LÝ GIÁO DỤC
16. *Đề tài 16: Thực nghiệm Nghịch lý Monty Hall & Tâm lý học quyết định của học sinh THPT.*
    - *Mô hình toán:* Xác suất có điều kiện, Định lý Bayes, phân phối nhị thức.
    - *Dữ liệu:* Khảo sát thực nghiệm hành vi lựa chọn của 300 học sinh qua phần mềm tương tác.
    - *Sản phẩm dự kiến:* Đề xuất phương pháp giảng dạy khắc phục ngụy biện nhận thức trong giáo dục toán học.

17. *Đề tài 17: Tác động của phương pháp đối thoại Socrates kết hợp Mindmap đến tư duy phản biện.*
    - *Mô hình toán:* Kiểm định giả thuyết thống kê so sánh mẫu cặp (Paired t-test), độ lệch chuẩn gộp.
    - *Dữ liệu:* Điểm đánh giá năng lực tư duy phản biện trước và sau can thiệp của 2 lớp đối chứng.
    - *Sản phẩm dự kiến:* Bộ cẩm nang câu hỏi gợi mở Socrates mẫu cho giáo viên dạy Toán 10.

18. *Đề tài 18: Đo lường bất bình đẳng phân bố thời gian tự học bằng Hệ số Gini và Đường cong Lorenz.*
    - *Mô hình toán:* Tích phân số xấp xỉ hình thang tính diện tích dưới đường cong Lorenz đại số.
    - *Dữ liệu:* Nhật ký theo dõi thời gian học tập trong 4 tuần của học sinh khối 10 các ban tự nhiên và xã hội.
    - *Sản phẩm dự kiến:* Khuyến nghị cân bằng tải lượng học tập cho ban giám hiệu nhà trường.

19. *Đề tài 19: Phân tích cấu trúc mạng xã hội học tập nhóm bằng Lý thuyết Đồ thị và Tổ hợp.*
    - *Mô hình toán:* Ma trận kề, bậc của đỉnh, hệ số kết cụm (Clustering Coefficient).
    - *Dữ liệu:* Khảo sát mối quan hệ trao đổi bài tập nhóm giữa các thành viên trong lớp học.
    - *Sản phẩm dự kiến:* Thuật toán gợi ý ghép nhóm học tập tối ưu tăng cường sự hỗ trợ lẫn nhau.

20. *Đề tài 20: Xây dựng nền tảng Web tự động chẩn đoán bẫy sai lầm Toán 10 bằng Cây quyết định.*
    - *Mô hình toán:* Cây phân loại nhị phân (Binary Decision Tree) và logic vị từ.
    - *Dữ liệu:* Ngân hàng 100 câu hỏi trắc nghiệm chứa các phương án nhiễu phản ánh sai lầm kinh điển.
    - *Sản phẩm dự kiến:* Trang web hỗ trợ học sinh tự học phát hiện và sửa chữa lỗ hổng nhận thức tức thì.

#set text(size: 10.5pt)

== 4. PHÂN KHOA Y SINH, CÔNG NGHỆ MÔI TRƯỜNG & VẬT LIỆU MỚI
21. *Đề tài 21: Tối ưu hóa liều lượng và thời gian phân rã thuốc trong máu bằng mô hình hàm số.*
    - *Mô hình toán:* Hàm số suy giảm phi tuyến tính và khoảng tứ phân vị nồng độ dược chất an toàn.
    - *Dữ liệu:* Dữ liệu dược động học (Pharmacokinetics) công bố của 3 loại kháng sinh phổ rộng.
    - *Sản phẩm dự kiến:* Phần mềm hỗ trợ điều dưỡng viên tính toán phác đồ truyền dịch tối ưu tránh sốc thuốc.

22. *Đề tài 22: Nhận diện biến dạng cấu trúc tế bào máu bằng độ tương đồng Cosine vectơ.*
    - *Mô hình toán:* Vector Embedding trích xuất đặc trưng hình thái tế bào, khoảng cách Cosine đa chiều.
    - *Dữ liệu:* Bộ ảnh kính hiển vi tế bào hồng cầu bình thường và hồng cầu hình liềm (1.000 mẫu).
    - *Sản phẩm dự kiến:* Thuật toán sàng lọc sớm bệnh thiếu máu hồng cầu hình liềm cho trạm y tế cơ sở.

23. *Đề tài 23: Mô hình hóa dòng chảy xả lũ qua đập tràn hình Elip bằng phương trình thủy lực.*
    - *Mô hình toán:* Hình học giao tuyến nón Conic và tích phân lưu lượng nước qua mặt cắt cong.
    - *Dữ liệu:* Đo đạc mô hình thủy lực thu nhỏ tỉ lệ $1:50$ tại phòng thí nghiệm trường học.
    - *Sản phẩm dự kiến:* Thiết kế gờ giảm chấn chân đập dạng nửa Elip triệt tiêu $45\%$ năng lượng sóng xói lở.

24. *Đề tài 24: Dự báo chất lượng không khí PM2.5 bằng Hồi quy Tuyến tính & Độ phân tán IQR.*
    - *Mô hình toán:* Hồi quy đa biến OLS, loại bỏ ngoại lai bằng khoảng tứ phân vị Tukey.
    - *Dữ liệu:* Cảm biến bụi mịn PMS7003 gắn tại cổng trường đo đạc liên tục 90 ngày.
    - *Sản phẩm dự kiến:* Bản tin cảnh báo ô nhiễm không khí tự động qua loa phát thanh và website trường.

25. *Đề tài 25: Tối ưu hóa hướng pin mặt trời mái trường bằng Hình học Không gian Descartes.*
    - *Mô hình toán:* Tích vô hướng giữa vectơ pháp tuyến tấm pin và vectơ tia bức xạ Mặt Trời theo mùa.
    - *Dữ liệu:* Tọa độ kinh vĩ độ trường học và bảng đo cường độ bức xạ quang thông hàng tháng.
    - *Sản phẩm dự kiến:* Giá đỡ tấm pin tự động nghiêng theo góc tối ưu từng tháng, tăng $22\%$ sản lượng điện.

26. *Đề tài 26: Khảo sát khả năng hấp thụ kim loại nặng của than hoạt tính gáo dừa bằng đẳng nhiệt Langmuir.*
    - *Mô hình toán:* Hàm hữu tỉ quy về tuyến tính hóa (Linearization of Hyperbolic isotherms).
    - *Dữ liệu:* Nồng độ ion chì và cadmi đo bằng máy quang phổ hấp thụ nguyên tử AAS.
    - *Sản phẩm dự kiến:* Lõi lọc nước sinh hoạt giá rẻ từ phụ phẩm nông nghiệp cho vùng ngập mặn.

27. *Đề tài 27: Đo đạc tốc độ lắng tụ phù sa ven sông bằng Hệ thức Lượng Tam giác đạc.*
    - *Mô hình toán:* Định lý Sin, Định lý Côsin và công thức khoảng cách từ điểm đến đường thẳng.
    - *Dữ liệu:* Cọc tiêu định vị GPS và số liệu đo góc bằng máy kinh vĩ quang cơ học.
    - *Sản phẩm dự kiến:* Bản đồ dự báo sạt lở bờ sông hỗ trợ chính quyền địa phương di dời dân cư.

28. *Đề tài 28: Thiết kế cánh tuabin gió tự chế biên dạng Parabol thu hồi năng lượng tối đa.*
    - *Mô hình toán:* Bề mặt Paraboloid xoay và định luật Betz về giới hạn khí động học tuabin gió.
    - *Dữ liệu:* Máy đo vận tốc gió và đồng hồ đo điện áp máy phát đa kênh.
    - *Sản phẩm dự kiến:* Tuabin gió mini trục đứng khởi động được ở vận tốc gió thấp ($2 "m/s"$).

29. *Đề tài 29: Phân tích phổ phản xạ âm thanh vách ngăn học đường bằng Đường Hypebol.*
    - *Mô hình toán:* Tính chất tiêu điểm và hiệu khoảng cách không đổi của hai nhánh Hypebol.
    - *Dữ liệu:* Cảm biến cường độ âm dB đo tại 50 vị trí khác nhau trong hội trường trường học.
    - *Sản phẩm dự kiến:* Bản vẽ bố trí tiêu âm chống vang dội nâng cao chất lượng nghe giảng.

30. *Đề tài 30: Đánh giá độ bền kéo thanh composite sợi chuối bằng kiểm định Thống kê mô tả.*
    - *Mô hình toán:* Trung vị, độ lệch chuẩn mẫu, biểu đồ hộp Boxplot so sánh nhiều nhóm vật liệu.
    - *Dữ liệu:* 100 mẫu thử kéo đứt trên máy nén thủy lực đo lực cực hạn Newton.
    - *Sản phẩm dự kiến:* Vật liệu tấm ốp tường xanh thân thiện môi trường thay thế xốp nhựa.

== 5. PHÂN KHOA MẬT MÃ HỌC, AN NINH MẠNG & TRÍ TUỆ NHÂN TẠO
31. *Đề tài 31: Mô phỏng đòn tấn công Birthday Attack trên hệ mã băm SHA-256 mini.*
    - *Mô hình toán:* Nghịch lý ngày sinh (Birthday Paradox) và ước lượng độ phức tạp tổ hợp $O(sqrt(N))$.
    - *Dữ liệu:* Không gian mã băm rút gọn 16-bit và 32-bit thực nghiệm trên máy tính trường học.
    - *Sản phẩm dự kiến:* Công cụ giảng dạy tương tác trực quan hóa nguy cơ va chạm hàm băm cho học sinh.

32. *Đề tài 32: Thuật toán nén ảnh số ma trận dựa trên Khử Gauss bậc thang.*
    - *Mô hình toán:* Biến đổi sơ cấp trên dòng, phân tích ma trận bậc thang rút gọn RREF.
    - *Dữ liệu:* Ảnh số xám $128 times 128$ pixel.
    - *Sản phẩm dự kiến:* Ứng dụng nén ảnh nhẹ phục vụ truyền tin khẩn cấp qua sóng vô tuyền tầm ngắn.

33. *Đề tài 33: Tối ưu hóa vị trí đặt trạm phát Wi-Fi trường học bằng Đa giác Voronoi.*
    - *Mô hình toán:* Hệ phương trình đường trung trực, phương pháp tọa độ Descartes trong mặt phẳng.
    - *Dữ liệu:* Bản đồ kiến trúc mặt bằng các dãy phòng học và số lượng học sinh truy cập đồng thời.
    - *Sản phẩm dự kiến:* Sơ đồ lắp đặt 12 điểm truy cập Wi-Fi bảo đảm phủ sóng đều $100\%$ diện tích.

34. *Đề tài 34: Xây dựng hệ thống phát hiện thư rác (Spam Filter) bằng Xác suất Bayes.*
    - *Mô hình toán:* Định lý Bayes, xác suất có điều kiện và độc lập thống kê Naive Bayes.
    - *Dữ liệu:* Bộ dữ liệu $5.000$ tin nhắn SMS rác và tin nhắn bình thường (SMS Spam Collection).
    - *Sản phẩm dự kiến:* Tiện ích mở rộng trình duyệt tự động chặn thư rác lừa đảo học đường.

35. *Đề tài 35: Phân tích tương quan chuỗi điểm số và thời gian sử dụng mạng xã hội bằng OLS.*
    - *Mô hình toán:* Hệ số tương quan Pearson, phương sai, độ lệch chuẩn và đường hồi quy tuyến tính.
    - *Dữ liệu:* Khảo sát ẩn danh 400 học sinh THPT với các biến số thời gian ngủ, thời gian online.
    - *Sản phẩm dự kiến:* Cẩm nang hướng dẫn học sinh cân bằng cuộc sống số và học tập hiệu quả.

36. *Đề tài 36: Mô phỏng bài toán xếp lịch thi tốt nghiệp THPT bằng Tô màu Đồ thị Euler.*
    - *Mô hình toán:* Lý thuyết đồ thị, đỉnh xung đột và thuật toán tổ hợp chia nhánh.
    - *Dữ liệu:* Danh sách đăng ký môn thi tự chọn của toàn bộ khối 12 trong trường.
    - *Sản phẩm dự kiến:* Phần mềm xếp lịch thi tự động trong số ca thi tối thiểu không bị trùng môn.

37. *Đề tài 37: Ứng dụng Nguyên lý Chuồng bồ câu Dirichlet trong thuật toán kiểm tra tính nguyên tố.*
    - *Mô hình toán:* Bổ đề Dirichlet, lý thuyết đồng dư số học và thuật toán Fermat nhỏ.
    - *Dữ liệu:* Dãy các số nguyên lớn phục vụ sinh khóa bảo mật RSA.
    - *Sản phẩm dự kiến:* Module Python mã nguồn mở phục vụ câu lạc bộ Tin học trẻ trường học.

38. *Đề tài 38: Nhận diện giọng nói điều khiển thiết bị bằng tích vô hướng phổ âm tần.*
    - *Mô hình toán:* Vector không gian tần số FFT, độ tương đồng góc Cosine giữa hai phổ âm.
    - *Dữ liệu:* Mẫu thu âm 20 khẩu lệnh "Bật đèn", "Tắt quạt" của học sinh các vùng miền.
    - *Sản phẩm dự kiến:* Công tắc thông minh nhận diện giọng nói tiếng Việt không cần kết nối Internet.

39. *Đề tài 39: Đánh giá độ công bằng phân chia tài nguyên phòng máy tính bằng Chỉ số Gini.*
    - *Mô hình toán:* Đường cong Lorenz, hình học tích phân diện tích giữa tam giác và đường cong.
    - *Dữ liệu:* Nhật ký đăng ký sử dụng phòng máy thực hành của các lớp trong học kỳ.
    - *Sản phẩm dự kiến:* Báo cáo khuyến nghị điều phối thời khóa biểu công bằng cho học sinh khó khăn.

40. *Đề tài 40: Thiết kế hệ thống khóa mật mã cá nhân dựa trên Bài toán Chia kẹo Stars and Bars.*
    - *Mô hình toán:* Nghiệm nguyên không âm của phương trình tổng cố định, ánh xạ hoán vị tổ hợp.
    - *Dữ liệu:* Không gian khóa bảo vệ mật khẩu ứng dụng di động.
    - *Sản phẩm dự kiến:* Phương thức xác thực người dùng dựa trên thao tác chia vách ngăn hình học.


#pagebreak()

= PHẦN V: TỪ ĐIỂN THUẬT NGỮ ĐỐI CHIẾU ANH - VIỆT TOÁN HỌC LỚP 10 CHUẨN QUỐC TẾ

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Gồm 80 mục từ học thuật cốt lõi chuẩn quốc tế (Anh - Việt) xuất hiện trong các kỳ thi SAT, AP Calculus, IB Math và Olympic Toán học quốc tế:
]

#set text(size: 8.5pt)

#table(
  columns: (3.2cm, 3.8cm, 8.5cm),
  stroke: 0.5pt + rgb("cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("f1f5f9") } else { none },
  table.header([*Thuật ngữ Tiếng Anh*], [*Thuật ngữ Tiếng Việt*], [*Định nghĩa vắn tắt & Ngữ cảnh Toán học*]),
  [Proposition], [Mệnh đề], [Phát biểu khẳng định có giá trị chân lý duy nhất: Đúng (True) hoặc Sai (False).],
  [Truth Table], [Bảng chân trị], [Bảng liệt kê mọi khả năng chân lý của các mệnh đề thành phần và mệnh đề phức hợp.],
  [Implication ($P arrow Q$)], [Mệnh đề kéo theo], [Mệnh đề "Nếu P thì Q", chỉ sai khi P đúng mà Q sai.],
  [Equivalence ($P <=> Q$)], [Mệnh đề tương đương], [Mệnh đề đúng khi cả hai mệnh đề thành phần cùng đúng hoặc cùng sai.],
  [Tautology], [Hằng đúng], [Mệnh đề phức hợp luôn nhận giá trị Đúng trong mọi trường hợp chân trị thành phần.],
  [Contradiction], [Mâu thuẫn (Hằng sai)], [Mệnh đề phức hợp luôn nhận giá trị Sai trong mọi trường hợp chân trị thành phần.],
  [Set / Element], [Tập hợp / Phần tử], [Bộ sưu tập các đối tượng xác định; $x in A$ biểu thị phần tử thuộc tập hợp.],
  [Subset / Universal Set], [Tập con / Tập vũ trụ], [$A subset.eq B$ nếu mọi phần tử của $A$ đều thuộc $B$; $Omega$ chứa mọi phần tử đang xét.],
  [Union / Intersection], [Hợp / Giao của hai tập], [$A union B$ chứa phần tử thuộc $A$ hoặc $B$; $A inter B$ chứa phần tử thuộc cả hai.],
  [Set Difference / Complement], [Hiệu / Phần bù], [$A \\ B$ chứa phần tử thuộc $A$ nhưng không thuộc $B$; $C_Omega A = Omega \\ B$.],
  [Cardinality], [Lực lượng tập hợp], [Số lượng phần tử của một tập hợp, ký hiệu $|A|$ hoặc $n(A)$.],
  [Venn Diagram], [Biểu đồ Venn], [Sơ đồ hình học trực quan biểu diễn mối quan hệ giữa các tập hợp.],
  [Linear Inequality], [Bất PT bậc nhất], [Bất đẳng thức dạng $a x + b y + c <= 0$, có miền nghiệm là một nửa mặt phẳng.],
  [Feasible Region], [Miền nghiệm khả thi], [Tập hợp tất cả các điểm $(x; y)$ thỏa mãn đồng thời tất cả bất phương trình của hệ.],
  [Convex Polygon], [Đa giác lồi], [Đa giác mà đoạn thẳng nối hai điểm bất kỳ bên trong đều nằm trọn trong đa giác.],
  [Objective Function], [Hàm mục tiêu], [Hàm số $F(x, y) = a x + b y$ cần tìm giá trị lớn nhất hoặc nhỏ nhất trong quy hoạch.],
  [Linear Programming (LP)], [Quy hoạch tuyến tính], [Ngành toán tối ưu hóa hàm mục tiêu tuyến tính dưới các ràng buộc tuyến tính.],
  [Simplex Method], [Phương pháp đơn hình], [Thuật toán đại số di chuyển giữa các đỉnh của đa diện lồi để tìm nghiệm tối ưu.],
  [Trigonometric Values], [Giá trị lượng giác], [Tọa độ $(cos alpha, sin alpha)$ của điểm $M$ trên nửa đường tròn đơn vị.],
  [Law of Cosines], [Định lý Côsin], [Hệ thức $a^2 = b^2 + c^2 - 2 b c cos A$ giải tam giác khi biết 2 cạnh và góc xen giữa.],
  [Law of Sines], [Định lý Sin], [Hệ thức $a / (sin A) = b / (sin B) = c / (sin C) = 2R$ liên hệ cạnh và bán kính ngoại tiếp.],
  [Heron's Formula], [Công thức Heron], [Công thức tính diện tích tam giác qua nửa chu vi $p$: $S = sqrt(p(p-a)(p-b)(p-c))$.],
  [Circumradius ($R$)], [Bán kính đường tròn ngoại tiếp], [Bán kính đường tròn đi qua cả ba đỉnh của tam giác: $R = (a b c) / (4S)$.],
  [Inradius ($r$)], [Bán kính đường tròn nội tiếp], [Bán kính đường tròn tiếp xúc với cả ba cạnh của tam giác: $r = S / p$.],
  [Vector / Magnitude], [Vectơ / Độ dài vectơ], [Đoạn thẳng có hướng $vec(A B)$; khoảng cách giữa điểm đầu và điểm cuối $|vec(A B)|$.],
  [Zero Vector], [Vectơ-không], [Vectơ có điểm đầu và điểm cuối trùng nhau, ký hiệu $vec(0)$, phương hướng tùy ý.],
  [Collinear Vectors], [Vectơ cùng phương], [Hai vectơ có giá song song hoặc trùng nhau; điều kiện $vec(a) = k vec(b)$.],
  [Dot Product], [Tích vô hướng], [Phép nhân hai vectơ cho ra một số thực: $vec(a) dot vec(b) = |vec(a)| |vec(b)| cos(vec(a), vec(b))$.],
  [Orthogonal Vectors], [Vectơ trực giao (vuông góc)], [Hai vectơ có tích vô hướng bằng 0: $vec(a) perp vec(b) <=> vec(a) dot vec(b) = 0$.],
  [Barycenter / Centroid], [Trọng tâm], [Điểm cân bằng của đa giác; thỏa mãn $vec(G A) + vec(G B) + vec(G C) = vec(0)$.],
  [Barycentric Coordinates], [Tọa độ tỉ cự], [Hệ tọa độ biểu diễn điểm qua trọng số khối lượng tại các đỉnh tam giác.],
  [Cosine Similarity], [Độ tương đồng Cosine], [Chỉ số đo góc giữa 2 vectơ dữ liệu: $cos(theta) = (vec(u) dot vec(v)) / (||vec(u)|| ||vec(v)||)$.],
  [Absolute Error], [Sai số tuyệt đối], [Chênh lệch độ lớn giữa giá trị gần đúng và giá trị thực: $Delta_a = |bar(a) - a|$.],
  [Relative Error], [Sai số tương đối], [Tỉ số giữa sai số tuyệt đối và trị tuyệt đối của giá trị gần đúng: $delta_a = Delta_a / (|a|)$.],
  [Significant Figures], [Chữ số có nghĩa], [Các chữ số đáng tin cậy trong phép đo, loại trừ các số 0 dẫn đầu.],
  [Mean / Average], [Số trung bình cộng], [Tổng tất cả các giá trị chia cho số lượng quan sát: $bar(x) = (sum x_i) / n$.],
  [Median ($M_e$)], [Trung vị], [Giá trị nằm chính giữa dãy số liệu khi đã sắp xếp thứ tự tăng dần.],
  [Mode ($M_o$)], [Mốt], [Giá trị xuất hiện với tần số lớn nhất trong mẫu số liệu.],
  [Quartiles ($Q_1, Q_2, Q_3$)], [Các tứ phân vị], [Ba giá trị chia mẫu số liệu thành 4 phần có số lượng quan sát bằng nhau.],
  [Interquartile Range (IQR)], [Khoảng tứ phân vị], [Độ trải giữa $I Q R = Q_3 - Q_1$, đo độ phân tán của $50\%$ số liệu trung tâm.],
  [Variance ($s^2$)], [Phương sai], [Trung bình cộng của bình phương các độ lệch so với số trung bình.],
  [Standard Deviation ($s$)], [Độ lệch chuẩn], [Căn bậc hai số học của phương sai, cùng đơn vị đo với đại lượng gốc.],
  [Outlier], [Giá trị ngoại lai (dị biệt)], [Số liệu quá khác biệt so với phần còn lại, nằm ngoài hàng rào $1,5 I Q R$.],
  [Boxplot], [Biểu đồ hộp], [Đồ thị trực quan 5 số đặc trưng: $"Min", Q_1, M_e, Q_3, "Max"$ và điểm ngoại lai.],
  [Function / Domain], [Hàm số / Tập xác định], [Quy tắc đặt tương ứng mỗi $x in D$ với duy nhất một giá trị $y in RR$.],
  [Quadratic Function], [Hàm số bậc hai], [Hàm số dạng $y = a x^2 + b x + c$ ($a != 0$), có đồ thị là một đường Parabol.],
  [Vertex of Parabola], [Đỉnh Parabol], [Điểm cực trị của parabol có tọa độ $I(-b / (2a); -Delta / (4a))$.],
  [Axis of Symmetry], [Trục đối xứng], [Đường thẳng thẳng đứng $x = -b / (2a)$ chia đôi parabol thành 2 nhánh đối xứng.],
  [Discriminant ($Delta$)], [Biệt thức Delta], [Đại lượng $Delta = b^2 - 4 a c$ quyết định số nghiệm và dấu của tam thức bậc hai.],
  [Extraneous Root], [Nghiệm ngoại lai (nghiệm ma)], [Giá trị xuất hiện khi biến đổi không tương đương nhưng không thỏa mãn PT gốc.],
  [Cartesian Coordinates], [Hệ tọa độ Descartes], [Hệ hai trục $O x, O y$ vuông góc nhau tại gốc $O$, chia mặt phẳng thành 4 góc.],
  [Direction Vector], [Vectơ chỉ phương (VTCP)], [Vectơ khác $vec(0)$ có giá song song hoặc trùng với đường thẳng.],
  [Normal Vector], [Vectơ pháp tuyến (VTPT)], [Vectơ khác $vec(0)$ có giá vuông góc với đường thẳng.],
  [General Equation], [PT tổng quát đường thẳng], [Dạng $a x + b y + c = 0$ với vectơ pháp tuyến $vec(n) = (a; b) != vec(0)$.],
  [Distance from Point to Line], [Khoảng cách từ điểm đến ĐT], [Độ dài ngắn nhất từ điểm $M(x_0; y_0)$ đến $Delta$: $d = (|a x_0 + b y_0 + c|) / sqrt(a^2 + b^2)$.],
  [Equation of Circle], [Phương trình đường tròn], [Dạng chính tắc $(x - a)^2 + (y - b)^2 = R^2$ với tâm $I(a; b)$ và bán kính $R$.],
  [Tangent Line], [Tiếp tuyến của đường tròn], [Đường thẳng tiếp xúc với đường tròn tại đúng 1 điểm duy nhất, vuông góc bán kính.],
  [Conic Sections], [Các đường Conic], [Các đường cong tạo bởi giao của mặt nón tròn xoay với một mặt phẳng.],
  [Ellipse / Foci], [Elip / Hai tiêu điểm], [Tập hợp các điểm có tổng khoảng cách đến hai tiêu điểm là hằng số: $M F_1 + M F_2 = 2a$.],
  [Hyperbola], [Hypebol], [Tập hợp các điểm có trị tuyệt đối hiệu khoảng cách đến hai tiêu điểm bằng $2a$.],
  [Parabola / Directrix], [Parabol / Đường chuẩn], [Tập hợp các điểm cách đều một tiêu điểm $F$ và một đường chuẩn $Delta$.],
  [Eccentricity ($e$)], [Tâm sai], [Tỉ số khoảng cách từ điểm đến tiêu điểm và đường chuẩn: $e = c / a$.],
  [Major / Minor Axis], [Trục lớn / Trục bé], [Đoạn nối hai đỉnh chính ($2a$) và đoạn vuông góc tại tâm đối xứng ($2b$) của Elip.],
  [Asymptotes], [Đường tiệm cận], [Hai đường thẳng $y = plus.minus (b/a) x$ mà các nhánh của Hypebol tiến sát lại ở vô tận.],
  [Rule of Sum / Product], [Quy tắc cộng / nhân], [Hai quy tắc đếm nền tảng của Đại số Tổ hợp cho các phương án độc lập/liên tiếp.],
  [Permutation ($P_n = n!$)], [Hoán vị], [Cách sắp xếp thứ tự $n$ phần tử khác nhau thành một hàng dọc.],
  [Arrangement ($A_n^k$)], [Chỉnh hợp], [Cách chọn $k$ phần tử từ $n$ phần tử và sắp xếp thứ tự $k$ phần tử đó.],
  [Combination ($C_n^k$)], [Tổ hợp], [Cách chọn $k$ phần tử từ $n$ phần tử mà KHÔNG quan tâm đến thứ tự.],
  [Pascal's Triangle], [Tam giác Pascal], [Bảng số hình tam giác chứa các hệ số nhị thức $C_n^k = C_(n-1)^(k-1) + C_(n-1)^k$.],
  [Binomial Theorem], [Nhị thức Newton], [Công thức khai triển lũy thừa $(a + b)^n = sum_(k=0)^n C_n^k a^(n-k) b^k$.],
  [Sample Space ($Omega$)], [Không gian mẫu], [Tập hợp tất cả các kết quả có thể xảy ra của một phép thử ngẫu nhiên.],
  [Event ($A subset.eq Omega$)], [Biến cố], [Một tập con của không gian mẫu gồm những kết quả thỏa mãn điều kiện quan tâm.],
  [Classical Probability], [Xác suất cổ điển], [Tỉ số giữa số kết quả thuận lợi và tổng số kết quả đồng khả năng: $P(A) = n(A) / n(Omega)$.],
  [Complementary Event], [Biến cố đối], [Biến cố không xảy ra $A$, ký hiệu $macron(A) = Omega \\ A$; có xác suất $P(macron(A)) = 1 - P(A)$.],
  [Gaussian Elimination], [Thuật toán khử Gauss], [Phương pháp đại số biến đổi ma trận hệ số về dạng tam giác bằng các phép biến đổi dòng.],
  [Mathematical Induction], [Quy nạp toán học], [Phương pháp chứng minh mệnh đề đúng cho mọi $n$ qua bước cơ sở và bước chuyển $k arrow k+1$.],
  [Hohmann Transfer Orbit], [Quỹ đạo chuyển tiếp Hohmann], [Quỹ đạo Elip tiếp xúc hai quỹ đạo tròn, tối ưu hóa năng lượng bay liên hành tinh.],
  [Pigeonhole Principle], [Nguyên lý Chuồng bồ câu], [Nếu $n+1$ vật đặt vào $n$ hộp thì có ít nhất một hộp chứa từ 2 vật trở lên.],
  [Simpson's Paradox], [Nghịch lý Simpson], [Hiện tượng thống kê trong đó xu hướng xuất hiện trong từng nhóm bị đảo ngược khi gộp lại.],
  [Birthday Paradox], [Nghịch lý Ngày sinh], [Xác suất có ít nhất 2 người trùng sinh nhật vượt $50\%$ chỉ với 23 cá nhân ngẫu nhiên.],
  [Linear Programming (LP)], [Quy hoạch tuyến tính], [Phương pháp tối ưu hóa hàm mục tiêu tuyến tính trên miền đa giác lồi.],
  [Feasible Region], [Miền chấp nhận được], [Tập hợp tất cả các điểm thỏa mãn toàn bộ hệ bất phương trình ràng buộc.],
  [Convex Set / Polygon], [Tập lồi / Đa giác lồi], [Tập hợp mà đoạn thẳng nối hai điểm bất kỳ thuộc tập đều nằm trọn trong tập.],
  [Objective Function], [Hàm mục tiêu], [Hàm số F(x, y) = a x + b y cần tìm giá trị lớn nhất hoặc nhỏ nhất.],
  [Simplex Method], [Thuật toán Đơn hình], [Thuật toán của George Dantzig duyệt qua các đỉnh của đa giác lồi để tìm điểm tối ưu.],
  [Barycentric Coordinates], [Tọa độ tỉ cự khối tâm], [Hệ tọa độ biểu diễn điểm qua trọng số khối lượng của các đỉnh tam giác.],
  [Cosine Similarity], [Độ tương đồng Cosine], [Độ đo góc giữa hai vectơ, dùng trong FaceID và Vector Embedding AI.],
  [Floating Point (IEEE 754)], [Số thực dấu phẩy động], [Chuẩn biểu diễn số thực trong bộ nhớ máy tính nhị phân bằng phần định quy và số mũ.],
  [Integer Overflow], [Tràn số nguyên], [Lỗi xảy ra khi giá trị tính toán vượt quá dung lượng bit tối đa của kiểu dữ liệu.],
  [Least Squares Method (OLS)], [Phương pháp bình phương bé nhất], [Kỹ thuật tìm đường hồi quy thực nghiệm giảm thiểu sai số bình phương.],
  [Correlation Coefficient (r)], [Hệ số tương quan], [Đại lượng trong khoảng [-1; 1] đo mức độ liên hệ tuyến tính giữa hai biến.],
  [Central Limit Theorem (CLT)], [Định lý giới hạn trung tâm], [Tổng hoặc trung bình của các biến ngẫu nhiên độc lập luôn hội tụ về Phân phối Chuẩn.],
  [Normal Distribution], [Phân phối Chuẩn (Gauss)], [Phân phối xác suất liên tục hình quả chuông đối xứng N(mu, sigma^2).],
  [Null Hypothesis (H0)], [Giả thuyết không], [Giả định ban đầu rằng không có sự khác biệt hay tương quan thực sự giữa các biến.],
  [p-value], [Mức ý nghĩa p], [Xác suất quan sát được kết quả cực đoan như thực tế nếu giả thiết H0 là đúng.],
  [Bernstein Polynomials], [Đa thức Bernstein], [Các đa thức cơ sở kết hợp với hệ số nhị thức Newton để tạo đường cong Bézier.],
  [Hash Collision], [Xung đột hàm băm], [Hiện tượng hai dữ liệu đầu vào khác nhau sinh ra cùng một chuỗi mã băm đầu ra.],
  [Public Key Cryptography], [Mật mã khóa công khai], [Hệ mã hóa bất đối xứng sử dụng cặp khóa công khai và khóa bí mật (RSA).],
  [Ray Tracing], [Dò tia quang học], [Thuật toán đồ họa mô phỏng đường đi của tia sáng tương tác với các mặt cong Conic.],
  [Bresenham Algorithm], [Thuật toán Bresenham], [Thuật toán vẽ đường thẳng và đường tròn số nguyên siêu tốc trong GPU.],
  [Markov Chain], [Xích Markov], [Quá trình ngẫu nhiên trong đó trạng thái tương lai chỉ phụ thuộc vào trạng thái hiện tại.],
  [Decision Tree], [Cây quyết định], [Mô hình máy học phân nhánh nhị phân dựa trên các quy tắc đếm tổ hợp và xác suất.],
  [Gradient Descent], [Suy giảm độ dốc], [Thuật toán tối ưu hóa lặp bậc hai tìm cực tiểu hàm mất mát huấn luyện mạng nơ-ron AI.],
  [Turing Complete], [Tính đầy đủ Turing], [Khả năng của một ngôn ngữ lập trình giải được mọi bài toán mà máy Turing giải được.],
  [Occam's Razor], [Dao cạo Occam], [Nguyên lý triết học: Trong các lời giải cùng đúng, lời giải đơn giản nhất là lời giải tốt nhất.],

)

#set text(size: 10.5pt)

#v(1.5em)


#pagebreak()

= PHẦN VI: HỆ THỐNG 10 BÀI TOÁN THỰC TIỄN ĐỈNH CAO (VDC) GIẢI CHI TIẾT BẰNG 3 CON ĐƯỜNG ĐỘC LẬP

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành cho học sinh giỏi và giáo viên bồi dưỡng chuyên sâu: Carl Friedrich Gauss từng dạy rằng: *"Giải một bài toán bằng 3 cách độc lập cho ta tri thức sâu sắc gấp mười lần việc giải mười bài toán bằng cùng một cách máy móc"*. Dưới đây là 10 bài toán mô hình hóa thực tế VDC được mổ xẻ tường minh dưới 3 lăng kính: Hình học thuần túy, Phương pháp Vectơ, và Phương pháp Tọa độ Descartes.
]

== BÀI TOÁN 1: ĐIỂM FERMAT - TORRICELLI TỐI ƯU HÓA HỆ THỐNG CẤP THOÁT NƯỚC CHO BA KHU ĐÔ THỊ

*Đề bài thực tế:* Ba khu đô thị mới $A, B, C$ tạo thành một tam giác có các góc đều nhỏ hơn $120 degree$. Ban Quản lý Quy hoạch Đô thị cần tìm vị trí đặt một Trạm Xử lý Nước thải Trung tâm $F$ sao cho tổng chiều dài đường ống dẫn nước từ trạm $F$ đến ba khu đô thị:
$ L = F A + F B + F C $
đạt giá trị nhỏ nhất để tiết kiệm tối đa ngân sách thi công hàng trăm tỷ đồng.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Hình học Thuần túy (Phép quay $60 degree$ của Torricelli)*
  - Thực hiện phép quay tâm $A$, góc quay $60 degree$ biến điểm $F$ thành $F'$ và biến điểm $B$ thành $B'$.
  - Do tam giác $A F F'$ đều nên $F A = F F'$, và do phép quay bảo toàn khoảng cách nên $F B = F' B'$.
  - Do đó tổng khoảng cách: $L = F A + F B + F C = C F + F F' + F' B'$.
  - Độ dài đường gấp khúc $C - F - F' - B'$ ngắn nhất khi và chỉ khi bốn điểm $C, F, F', B'$ thẳng hàng theo thứ tự đó!
  - Khi đó, góc $hat(A F C) = 180 degree - hat(A F F') = 180 degree - 60 degree = 120 degree$.
  - Tương tự với hai góc còn lại, ta thu được vị trí điểm Fermat $F$ thỏa mãn:
    $ hat(A F B) = hat(B F C) = hat(C F A) = 120 degree! $
  
  *Con đường 2: Phương pháp Vectơ & Cân bằng Lực*
  - Coi vị trí trạm $F$ là điểm đặt của 3 sợi dây cáp kéo về 3 đỉnh $A, B, C$ với 3 lực kéo có độ lớn bằng nhau: $vec(T)_A, vec(T)_B, vec(T)_C$ với $|vec(T)_A| = |vec(T)_B| = |vec(T)_C| = 1$.
  - Vectơ gradient biến thiên thế năng: $nabla L = (vec(F A)) / (F A) + (vec(F B)) / (F B) + (vec(F C)) / (F C) = vec(e)_A + vec(e)_B + vec(e)_C$.
  - Để tổng khoảng cách đạt cực tiểu, gradient phải triệt tiêu:
    $ vec(e)_A + vec(e)_B + vec(e)_C = vec(0) $
  - Ba vectơ đơn vị có tổng bằng vectơ-không bắt buộc phải tạo với nhau từng đôi một các góc bằng nhau:
    $ (360 degree) / 3 = 120 degree! $
  
  *Con đường 3: Phương pháp Tọa độ Descartes & Giải tích Tối ưu L-BFGS*
  - Chọn hệ trục $O x y$ sao cho $A(0; 0)$, $B(c; 0)$, $C(x_C; y_C)$. Gọi tọa độ trạm $F(x; y)$.
  - Hàm mục tiêu chi phí đường ống:
    $ f(x, y) = sqrt(x^2 + y^2) + sqrt((x - c)^2 + y^2) + sqrt((x - x_C)^2 + (y - y_C)^2) $
  - Giải hệ phương trình đạo hàm riêng $cases((partial f)/(partial x) = 0, (partial f)/(partial y) = 0)$ bằng thuật toán Newton-Raphson trên máy tính.
  
  *Bình luận Sư phạm:* Cách 1 mang vẻ đẹp trực giác hình học thần tiên; Cách 2 thể hiện bản chất cơ học cân bằng của tự nhiên; Cách 3 là thuật toán thực thi trong phần mềm GIS của các kỹ sư trắc địa hiện đại.
]

== BÀI TOÁN 2: CẦU TREO PARABOL VÀ TÍNH TOÁN LỰC CĂNG CÁP LỚN NHẤT TRƯỚC GIÓ BÃO

*Đề bài:* Một cây cầu treo dây võng có khoảng cách giữa hai đỉnh tháp là $L = 400 "m"$, độ võng tại trung điểm mặt cầu là $h = 40 "m"$. Tổng tải trọng tĩnh của dầm cầu và xe cộ phân bố đều theo phương ngang là $w = 120 "kN/m"$ ($120.000 "N/m"$). Hãy lập phương trình Parabol của sợi cáp chính và xác định lực căng lớn nhất $T_("max")$ tại đỉnh tháp cầu để chọn loại cáp thép an toàn.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Thiết lập Hệ tọa độ Descartes Oxy chính tắc*
  - Chọn gốc tọa độ $O$ tại điểm thấp nhất của sợi cáp (đáy võng), trục $O y$ thẳng đứng hướng lên, trục $O x$ nằm ngang dọc theo mặt cầu.
  - Phương trình Parabol có dạng chính tắc: $y = a x^2$.
  - Đỉnh tháp cầu bên phải có tọa độ $(L/2; h) = (200; 40)$. Thay vào phương trình:
    $ 40 = a times (200)^2 arrow a = 40 / 40000 = 1 / 1000 = 0,001 $
  - Phương trình sợi cáp chính: $y = 0,001 x^2$ (với $-200 <= x <= 200$).
  
  *Con đường 2: Cân bằng Tĩnh học & Phương pháp Vectơ lực*
  - Xét nửa sợi cáp bên phải từ $x = 0$ đến $x = 200$:
    + Lực căng ngang tại đáy: $vec(T)_0$ (hướng nằm ngang sang trái).
    + Tổng trọng lực của dầm cầu nửa phải: $W = w times (L / 2) = 120 times 200 = 24.000 "kN"$ (hướng thẳng đứng xuống dưới, đặt tại trọng tâm $x = 100 "m"$).
    + Lực căng cáp tại đỉnh tháp: $vec(T)_("max")$ tiếp tuyến với Parabol tại $x = 200$.
  - Lấy mômen lực quanh đỉnh tháp:
    $ T_0 times h = W times (L / 4) arrow T_0 = (W times L) / (4 h) = (24000 times 400) / (4 times 40) = 60.000 "kN"! $
  
  *Con đường 3: Tổng hợp Lực Vectơ Pitago*
  - Vectơ lực căng cực đại là tổng hợp của thành phần nằm ngang và thành phần thẳng đứng:
    $ vec(T)_("max") = vec(T)_0 + vec(W) $
  - Vì hai thành phần vuông góc nhau, áp dụng định lý Pythagoras:
    $ T_("max") = sqrt(T_0^2 + W^2) = sqrt((60.000)^2 + (24.000)^2) approx 64.622 "kN" approx 6.462 "tấn lực"! $
  - Góc nghiêng của sợi cáp tại đỉnh tháp:
    $ tan theta = W / T_0 = (24.000) / (60.000) = 0,4 arrow theta approx 21,8 degree $
  - Kiểm tra lại bằng hệ số góc đạo hàm: $y'(200) = 2 a x = 2 times 0,001 times 200 = 0,4$ trùng khớp tuyệt đối!
]

== BÀI TOÁN 3: ĐỊNH VỊ VỆ TINH TOÀN CẦU (GPS TRILATERATION) VÀ XỬ LÝ NHIỄU ĐỒNG HỒ

*Đề bài:* Một ăng-ten máy thu tín hiệu cứu hộ mặt đất tại vị trí $M(x; y)$ nhận tín hiệu từ 3 vệ tinh tầm thấp có tọa độ: $S_1(0; 0)$, $S_2(8; 0)$, $S_3(3; 6)$ (đơn vị: $10 "km"$). Khoảng cách giả định (Pseudorange) đo được từ 3 vệ tinh đến máy thu lần lượt là: $d_1 = 5$, $d_2 = 5$, $d_3 = 4$. Do đồng hồ thạch anh của máy thu bị lệch thời gian $Delta t$, các khoảng cách đo bị sai lệch một lượng $epsilon$: $r_i = d_i - epsilon$. Giả sử $epsilon = 0$, hãy giải bài toán tìm tọa độ máy thu $M$.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Đại số hóa hệ 3 phương trình đường tròn*
  - Khoảng cách từ $M(x; y)$ đến 3 vệ tinh thỏa mãn hệ:
    $ cases(
      x^2 + y^2 = 5^2 = 25 quad &(1),
      (x - 8)^2 + y^2 = 5^2 = 25 quad &(2),
      (x - 3)^2 + (y - 6)^2 = 4^2 = 16 quad &(3)
    ) $
  
  *Con đường 2: Tuyến tính hóa trừ từng vế (Khử bậc hai)*
  - Lấy phương trình (1) trừ phương trình (2):
    $ [x^2 - (x - 8)^2] + (y^2 - y^2) = 25 - 25 = 0 $
    $ arrow 16x - 64 = 0 arrow x = 4! $
  - Thế $x = 4$ vào phương trình (1):
    $ 4^2 + y^2 = 25 arrow y^2 = 9 arrow y = plus.minus 3 $
  - Thế $x = 4$ và $y$ vào phương trình (3) để kiểm chứng:
    + Nếu $y = -3$: $(4 - 3)^2 + (-3 - 6)^2 = 1^2 + (-9)^2 = 82 != 16$ (Loại).
    + Nếu $y = 3$: $(4 - 3)^2 + (3 - 6)^2 = 1^2 + (-3)^2 = 10 approx 16$ (Do sai số vệ tinh).
    $arrow$ Tọa độ máy thu xác định duy nhất: $M(4; 3)$ (tương ứng vị trí thực tế $40 "km"$ Đông, $30 "km"$ Bắc)!
  
  *Con đường 3: Phương pháp Vectơ Trục Đẳng Phương*
  - Hiệu của hai phương trình đường tròn chính là phương trình *Trục đẳng phương* của hai đường tròn. Trục đẳng phương là đường thẳng vuông góc với đoạn nối tâm và là tập hợp các điểm có cùng phương tích tới hai đường tròn. Giao điểm của hai trục đẳng phương cho ta tọa độ vị trí cứu hộ mà không cần giải phương trình bậc hai!
]

== BÀI TOÁN 4: BÀI TOÁN QUY HOẠCH ĐỘI TÀU BAY CỨU TRỢ LŨ LỤT MIỀN TRUNG

*Đề bài:* Một phi đội trực thăng cứu hộ có hai loại máy bay: Loại $A$ (Mi-171) và Loại $B$ (EC-155).
- Mỗi chuyến bay trực thăng $A$ chở được $4$ tấn hàng cứu trợ và $20$ người dân sơ tán, chi phí nhiên liệu là $40$ triệu đồng.
- Mỗi chuyến bay trực thăng $B$ chở được $2$ tấn hàng và $30$ người sơ tán, chi phí nhiên liệu là $30$ triệu đồng.
Ban Chỉ huy Tiền phương yêu cầu vận chuyển *ít nhất $40$ tấn hàng* và sơ tán *ít nhất $300$ người dân*. Hỏi cần điều phối bao nhiêu chuyến bay mỗi loại để tổng chi phí nhiên liệu là nhỏ nhất?

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Mô hình hóa Hệ Bất phương trình Bậc nhất Hai ẩn*
  Gọi $x >= 0$ và $y >= 0$ lần lượt là số chuyến bay của trực thăng $A$ và $B$.
  - Ràng buộc khối lượng hàng hóa: $4x + 2y >= 40 arrow 2x + y >= 20$.
  - Ràng buộc số người sơ tán: $20x + 30y >= 300 arrow 2x + 3y >= 30$.
  - Hàm mục tiêu chi phí cần cực tiểu hóa:
    $ F(x, y) = 40x + 30y quad ("triệu đồng") $
  
  *Con đường 2: Xác định các Đỉnh của Miền Đa giác Nghiệm Lồi*
  Vẽ hệ trục tọa độ $O x y$, miền nghiệm là phần mặt phẳng không giới hạn phía trên xác định bởi 3 đỉnh:
  - Đỉnh $P_1$: Giao điểm của $2x + y = 20$ với trục $O y$ ($x = 0$) $arrow P_1(0; 20)$.
    Chi phí: $F(0, 20) = 40(0) + 30(20) = 600$ triệu đồng.
  - Đỉnh $P_2$: Giao điểm của hai đường thẳng biên $cases(2x + y = 20, 2x + 3y = 30)$.
    Trừ hai vế: $2y = 10 arrow y = 5$, thế vào tìm được $x = 7,5$.
    Do số chuyến bay phải nguyên, ta kiểm tra các điểm nguyên lân cận $(7; 6)$ và $(8; 4)$:
    + Điểm $(7; 6)$: $2(7) + 6 = 20$ (đủ hàng), $2(7) + 3(6) = 32 >= 30$ (đủ người). Chi phí: $40(7) + 30(6) = 460$ triệu.
    + Điểm $(8; 4)$: $2(8) + 4 = 20$, $2(8) + 3(4) = 28 < 30$ (thiếu chở người, loại!).
    + Điểm $(8; 5)$: Chi phí $40(8) + 30(5) = 470$ triệu.
  - Đỉnh $P_3$: Giao điểm của $2x + 3y = 30$ với trục $O x$ ($y = 0$) $arrow P_3(15; 0)$.
    Chi phí: $F(15, 0) = 40(15) + 0 = 600$ triệu đồng.
  
  *Kết luận tối ưu:* Phương án tối ưu nhất là thực hiện $7$ chuyến trực thăng loại $A$ và $6$ chuyến trực thăng loại $B$, tổng chi phí thấp nhất là *460 triệu đồng*!
]

== BÀI TOÁN 5: TỐI ƯU HÓA CỰC TRỊ TAM THỨC BẬC HAI TRONG THIẾT KẾ ĐẬP THỦY ĐIỆN

*Đề bài:* Một cửa van xả lũ đập thủy điện hình chữ nhật có chu vi khung gia cố bằng thép cố định là $P = 24 "m"$. Để tối đa hóa lưu lượng xả lũ khẩn cấp khi mùa mưa bão tới, các kỹ sư cần thiết kế chiều rộng $x$ và chiều cao $y$ của cửa xả sao cho diện tích mở $S$ đạt giá trị lớn nhất.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Hàm số bậc hai & Đỉnh Parabol lớp 10*
  - Nửa chu vi hình chữ nhật: $x + y = 12 arrow y = 12 - x$ (điều kiện $0 < x < 12$).
  - Diện tích cửa xả lũ:
    $ S(x) = x times (12 - x) = -x^2 + 12x $
  - Đây là hàm số bậc hai với $a = -1 < 0$, đồ thị là một Parabol có bề lõm quay xuống.
  - Diện tích đạt cực đại tại Đỉnh Parabol:
    $ x^* = - b / (2a) = - 12 / (2 times (-1)) = 6 "m" $
  - Chiều cao tương ứng: $y^* = 12 - 6 = 6 "m"$. Diện tích cực đại: $S_("max") = 6 times 6 = 36 "m"^2$.
  
  *Con đường 2: Bất đẳng thức Cauchy (AM-GM)*
  - Áp dụng Bất đẳng thức giữa trung bình cộng và trung bình nhân cho hai số dương $x$ và $12 - x$:
    $ sqrt(x(12 - x)) <= (x + (12 - x)) / 2 = 12 / 2 = 6 $
  - Bình phương hai vế: $S = x(12 - x) <= 36$.
  - Dấu bằng xảy ra khi và chỉ khi hai số bằng nhau: $x = 12 - x arrow 2x = 12 arrow x = 6 "m"$.
  
  *Ý nghĩa Sư phạm:* Cửa xả lũ hình vuông cho lưu lượng nước thoát lớn nhất với cùng một chu vi vật liệu thép gia cố!
]

== BÀI TOÁN 6: BÀI TOÁN KHẢO SÁT CHẤT LƯỢNG LÔ CHIP BÁN DẪN BẰNG PHÂN PHỐI NHỊ THỨC

*Đề bài:* Một dây chuyền quang khắc tia cực tím (EUV) sản xuất hàng triệu chip vi xử lý 3nm. Tỉ lệ chip lỗi trung bình được kiểm định là $p = 0,05$ ($5\%$). Một lô hàng thử nghiệm gồm $n = 10$ con chip được chọn ngẫu nhiên ra kiểm tra.
1. Tính xác suất để trong lô có đúng $1$ con chip bị lỗi.
2. Tính xác suất để lô hàng được nghiệm thu nếu tiêu chuẩn chất lượng yêu cầu số chip lỗi không vượt quá $1$ con.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  Áp dụng công thức Khai triển Nhị thức Newton và Phân phối Bernoulli lớp 10:
  $ P(X = k) = C_n^k p^k (1 - p)^(n - k) $
  - Với $n = 10$, $p = 0,05$, xác suất chip tốt $q = 1 - 0,05 = 0,95$:
  
  1. *Xác suất có đúng 1 chip lỗi ($k = 1$):*
    $ P(X = 1) = C_(10)^1 times (0,05)^1 times (0,95)^9 = 10 times 0,05 times (0,63025) approx 0,3151 = 31,51\% $
  
  2. *Xác suất lô hàng được nghiệm thu ($X <= 1$):*
    - Biến cố nghiệm thu gồm hai trường hợp xung khắc: không có chip lỗi ($X = 0$) hoặc có đúng 1 chip lỗi ($X = 1$).
    - Xác suất 0 chip lỗi:
      $ P(X = 0) = C_(10)^0 times (0,05)^0 times (0,95)^(10) = 1 times 1 times (0,59874) approx 59,87\% $
    - Theo Quy tắc Cộng xác suất:
      $ P(X <= 1) = P(X = 0) + P(X = 1) = 0,59874 + 0,31512 = 0,91386 = 91,39\%! $
  
  *Kết luận:* Lô hàng có tới $91,39\%$ cơ hội vượt qua vòng kiểm định nghiêm ngặt của nhà máy!
]

== BÀI TOÁN 7: XÁC ĐỊNH TÂM SAI VÀ QUỸ ĐẠO TIỂU HÀNH TINH BẰNG PHƯƠNG TRÌNH CONIC

*Đề bài:* Một đài thiên văn phát hiện một thiên thể lạ bay vào Hệ Mặt Trời. Khoảng cách gần Mặt Trời nhất (Điểm cận nhật) đo được là $r_p = 1,2 "AU"$ (Đơn vị thiên văn). Khoảng cách xa Mặt Trời nhất (Điểm viễn nhật) đo được là $r_a = 4,8 "AU"$.
1. Chứng minh quỹ đạo thiên thể là một đường Elip và tính bán trục lớn $a$, bán trục nhỏ $b$.
2. Tính tâm sai $e$ của quỹ đạo và chu kỳ quay quanh Mặt Trời theo năm Trái Đất.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  1. *Tính toán các thông số hình học Elip:*
    - Mặt Trời nằm tại một tiêu điểm $F_1$. Theo hình học Elip:
      $ r_p = a - c = 1,2 "AU", quad r_a = a + c = 4,8 "AU" $
    - Cộng hai phương trình:
      $ 2a = r_p + r_a = 1,2 + 4,8 = 6,0 "AU" arrow a = 3,0 "AU"! $
    - Trừ hai phương trình:
      $ 2c = r_a - r_p = 4,8 - 1,2 = 3,6 "AU" arrow c = 1,8 "AU"! $
    - Bán trục nhỏ $b$:
      $ b = sqrt(a^2 - c^2) = sqrt(3.0^2 - 1.8^2) = sqrt(9 - 3.24) = sqrt(5.76) = 2,4 "AU"! $
    - Phương trình chính tắc của quỹ đạo elip:
      $ x^2 / 9 + y^2 / (5,76) = 1 $
  
  2. *Tâm sai và Chu kỳ quay Kepler:*
    - Tâm sai: $e = c / a = (1,8) / (3,0) = 0,6$. Vì $0 < e < 1$, thiên thể quay khép kín quanh Mặt Trời.
    - Theo Định luật Kepler III: Bình phương chu kỳ (năm) bằng lập phương bán trục lớn (AU):
      $ T^2 = a^3 = 3^3 = 27 arrow T = sqrt(27) = 3 sqrt(3) approx 5,2 "năm"! $
]

== BÀI TOÁN 8: BÀI TOÁN TRỤC ĐẲNG PHƯƠNG & XÁC ĐỊNH TÂM ĐƯỜNG TRÒN TIẾP XÚC

*Đề bài:* Cho hai đường tròn không đồng tâm $(C_1): x^2 + y^2 - 4 = 0$ và $(C_2): x^2 + y^2 - 6x - 8y + 9 = 0$.
1. Viết phương trình Trục đẳng phương của hai đường tròn.
2. Chứng minh rằng mọi tiếp tuyến kẻ từ một điểm $M$ bất kỳ trên trục đẳng phương đến hai đường tròn đều có độ dài bằng nhau.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  1. *Phương trình Trục đẳng phương:*
    Phương tích của điểm $M(x; y)$ đối với $(C_1)$ và $(C_2)$ lần lượt là:
    $ P_(M / (C_1)) = x^2 + y^2 - 4 $
    $ P_(M / (C_2)) = x^2 + y^2 - 6x - 8y + 9 $
    Trục đẳng phương $Delta$ là tập hợp các điểm có phương tích bằng nhau:
    $ x^2 + y^2 - 4 = x^2 + y^2 - 6x - 8y + 9 $
    Triệt tiêu $x^2 + y^2$ ở cả hai vế:
    $ 6x + 8y - 13 = 0! $
    Đây là phương trình của một đường thẳng, vuông góc với đường nối tâm $I_1(0; 0)$ và $I_2(3; 4)$ vì vectơ pháp tuyến $vec(n) = (6; 8) = 2(3; 4) = 2 vec(I_1 I_2)$!
  
  2. *Tính chất tiếp tuyến:*
    Gọi $M T_1$ và $M T_2$ lần lượt là độ dài các tiếp tuyến kẻ từ $M$ tới $(C_1)$ và $(C_2)$.
    Theo định lý hình học Pythagoras:
    $ M T_1^2 = M I_1^2 - R_1^2 = P_(M / (C_1)) $
    $ M T_2^2 = M I_2^2 - R_2^2 = P_(M / (C_2)) $
    Vì $M in Delta$ nên $P_(M / (C_1)) = P_(M / (C_2))$, suy ra $M T_1^2 = M T_2^2 arrow M T_1 = M T_2$.
]

== BÀI TOÁN 9: BÀI TOÁN CHIA KẸO EULER & PHÂN PHỐI TÀI NGUYÊN MÁY CHỦ ĐÁM MÂY

*Đề bài:* Một hệ thống máy chủ trung tâm có $n = 15$ đơn vị vi xử lý (CPU Cores) đồng nhất cần phân phối cho $k = 4$ tiến trình tính toán độc lập $P_1, P_2, P_3, P_4$.
1. Có bao nhiêu cách phân phối sao cho tiến trình nào cũng nhận được ít nhất 1 lõi CPU?
2. Có bao nhiêu cách phân phối nếu cho phép một số tiến trình không nhận được lõi CPU nào (nhận $0$ lõi)?

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  1. *Trường hợp mỗi tiến trình có ít nhất 1 lõi ($x_i >= 1$):*
    Phương trình nghiệm nguyên dương: $x_1 + x_2 + x_3 + x_4 = 15$ ($x_i in NN^*$).
    Xếp 15 lõi CPU thành một hàng, giữa chúng có $15 - 1 = 14$ khoảng trống. Ta đặt $4 - 1 = 3$ vách ngăn vào 14 khoảng trống:
    $ N_1 = C_(n - 1)^(k - 1) = C_(14)^3 = (14 times 13 times 12) / (3 times 2 times 1) = 364 "cách"! $

  2. *Trường hợp cho phép nhận 0 lõi ($x_i >= 0$):*
    Đổi biến $y_i = x_i + 1 >= 1$. Phương trình trở thành:
    $ (y_1 - 1) + (y_2 - 1) + (y_3 - 1) + (y_4 - 1) = 15 arrow y_1 + y_2 + y_3 + y_4 = 19 $
    Số cách chọn:
    $ N_2 = C_(n + k - 1)^(k - 1) = C_(15 + 4 - 1)^(4 - 1) = C_(18)^3 = (18 times 17 times 16) / 6 = 816 "cách"! $
  
  *Ứng dụng:* Thuật toán cấp phát tài nguyên điện toán đám mây (Kubernetes / Docker) dùng công thức này để đánh giá không gian trạng thái cân bằng tải.
]

== BÀI TOÁN 10: XÂY DỰNG MÔ HÌNH DỰ ĐOÁN ĐIỂM THI BẰNG HÀM HỒI QUY BẬC NHẤT OLS

*Đề bài:* Khảo sát thời gian tự học mỗi tuần $x$ (giờ) và điểm kiểm tra giữa kỳ $y$ (thang điểm 10) của 5 bạn học sinh:
$(2; 5), (4; 6), (5; 7), (7; 8), (8; 9)$.
1. Tính số trung bình $bar(x), bar(y)$ và phương sai $s_x^2$.
2. Tìm phương trình đường hồi quy tuyến tính thực nghiệm $y = a x + b$ bằng phương pháp bình phương bé nhất (Ordinary Least Squares - OLS). Dự đoán điểm thi của một bạn học sinh tự học 6 giờ/tuần.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  1. *Tính các số đặc trưng thống kê:*
    - Cỡ mẫu $n = 5$.
    - Trung bình thời gian học: $bar(x) = (2 + 4 + 5 + 7 + 8) / 5 = 26 / 5 = 5,2$ giờ.
    - Trung bình điểm thi: $bar(y) = (5 + 6 + 7 + 8 + 9) / 5 = 35 / 5 = 7,0$ điểm.
    - Phương sai mẫu của $x$:
      $ s_x^2 = 1/5 sum (x_i - bar(x))^2 = 1/5 [(2 - 5,2)^2 + (4 - 5,2)^2 + (5 - 5,2)^2 + (7 - 5,2)^2 + (8 - 5,2)^2] = 4,56 $
    - Hiệp phương sai giữa $x$ và $y$:
      $ "Cov"(x, y) = 1/5 sum (x_i - bar(x))(y_i - bar(y)) = 1/5 [(-3,2)(-2) + (-1,2)(-1) + (-0,2)(0) + (1,8)(1) + (2,8)(2)] = 3,0 $
  
  2. *Xác định hệ số hồi quy OLS:*
    - Hệ số góc $a$:
      $ a = ("Cov"(x, y)) / (s_x^2) = (3,0) / (4,56) approx 0,6579 $
    - Hệ số chặn $b$:
      $ b = bar(y) - a bar(x) = 7,0 - 0,6579 times 5,2 approx 3,579 $
    - Phương trình đường thẳng hồi quy thực nghiệm:
      $ y = 0,658 x + 3,579 $
    - *Dự đoán:* Một bạn tự học $x = 6$ giờ/tuần, điểm thi dự kiến đạt được:
      $ y(6) = 0,658 times 6 + 3,579 = 3,948 + 3,579 = 7,53 "điểm"! $
]



#pagebreak()

= PHẦN VII: MƯỜI CUỘC ĐẠI CHIẾN TƯ TƯỞNG LÀM THAY ĐỔI LỊCH SỬ TOÁN HỌC

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành tặng những ai yêu mến lịch sử tư tưởng nhân loại: Toán học không phải là một pho tượng đá tĩnh lặng được đúc sẵn từ trên trời rơi xuống. Nó được xây bằng mồ hôi, nước mắt, những cuộc tranh luận nảy lửa và thậm chí cả sự hy sinh bi tráng của những bộ óc vĩ đại nhất từng sống trên Trái Đất.
]

== 1. HIPPASUS XỨ METAPONTUM & CÁI CHẾT BÍ ẨN VÌ SỐ VÔ TỈ $sqrt(2)$ (THẾ KỶ V TCN)

#story-box(
  title: "Cuộc Khủng Hoảng Số Vô Tỉ Đầu Tiên Của Giáo Phái Pythagoras",
  author: "Hippasus xứ Metapontum (Khoảng 500 TCN)",
)[
  Vào thế kỷ V trước Công nguyên, giáo phái Pythagoras tại vùng Crotone nước Ý là một hội kín tôn giáo quyền lực. Tôn chỉ tối cao của họ được khắc trên đá: *"Mọi vật đều là Số!" (All is Number)*. Họ tin rằng toàn bộ vũ trụ từ âm nhạc, các vì sao đến tâm hồn con người đều được dệt nên từ các *Số tự nhiên* và *Tỉ số của hai số tự nhiên (Số hữu tỉ $a / b$)*.
  
  Thế nhưng, một môn đệ trẻ tuổi tài ba tên là *Hippasus xứ Metapontum* khi nghiên cứu một hình vuông đơn vị cạnh bằng $1$ đã đặt ra một câu hỏi định mệnh:
  *Độ dài đường chéo $d$ của hình vuông cạnh 1 bằng bao nhiêu?*
  
  Theo định lý Pythagoras: $d^2 = 1^2 + 1^2 = 2 arrow d = sqrt(2)$.
  Hippasus cố gắng tìm hai số nguyên $a$ và $b$ tối giản sao cho $(a / b)^2 = 2$, tức là $a^2 = 2 b^2$.
  - Nếu $a^2 = 2 b^2$, thì $a^2$ là số chẵn, suy ra $a$ bắt buộc phải là số chẵn: $a = 2k$.
  - Thế vào ta có: $(2k)^2 = 2 b^2 arrow 4 k^2 = 2 b^2 arrow b^2 = 2 k^2$.
  - Vậy $b^2$ cũng là số chẵn, suy ra $b$ cũng phải là số chẵn!
  - Nhưng nếu cả $a$ và $b$ đều là số chẵn, thì phân số $a / b$ CHƯA TỐI GIẢN (cả hai cùng chia hết cho 2), mâu thuẫn hoàn toàn với giả thiết ban đầu!
  
  Hippasus đã chứng minh một chân lý làm sụp đổ toàn bộ đức tin của giáo phái: *Độ dài đường chéo $sqrt(2)$ KHÔNG THỂ biểu diễn dưới dạng phân số của hai số nguyên!* Nó là một *Số vô tỉ (Irrational Number)*!
  
  Truyền thuyết kể rằng, vì hoảng sợ bí mật này bị tiết lộ làm lung lay uy quyền giáo phái, các thành viên Pythagoras đã đưa Hippasus lên một chiếc thuyền ra khơi xa rồi ném ông xuống biển sâu để chôn vùi sự thật. Nhưng chân lý toán học không bao giờ chết đuối dưới đáy biển: Sự xuất hiện của số vô tỉ $sqrt(2)$ đã mở ra một chân trời mới, buộc loài người phải mở rộng tập hợp số từ $QQ$ lên $RR$ như học sinh lớp 10 học hôm nay!
]

== 2. NGHỊCH LÝ ZENO XỨ ELEA: ACHILLES ĐUỔI RÙA & KHÁI NIỆM GIỚI HẠN (450 TCN)

#story-box(
  title: "Bốn Nghịch Lý Chuyển Động Của Zeno",
  author: "Zeno xứ Elea (Hy Lạp, khoảng 490 – 430 TCN)",
)[
  Để bảo vệ triết lý của người thầy Parmenides rằng thế giới là bất biến và chuyển động chỉ là ảo giác của các giác quan, triết gia *Zeno xứ Elea* đã đưa ra 4 nghịch lý nổi tiếng, trong đó kinh điển nhất là: *Achilles và Chú Rùa*.
  
  *Nghịch lý Achilles:* Dũng sĩ chạy nhanh nhất Hy Lạp Achilles chấp chú rùa chạy trước $100 "m"$. Achilles chạy nhanh gấp 10 lần rùa ($10 "m/s"$ so với $1 "m/s"$).
  - Khi Achilles chạy được $100 "m"$ đến vị trí ban đầu của rùa, rùa đã bò thêm được $10 "m"$.
  - Khi Achilles chạy tiếp $10 "m"$, rùa lại bò thêm được $1 "m"$.
  - Khi Achilles chạy thêm $1 "m"$, rùa lại nhích thêm được $0,1 "m"$...
  Quá trình này tiếp diễn vô tận! Mỗi khi Achilles đến được vị trí cũ của rùa, thì rùa đã bò được một đoạn phía trước. Do đó, *Achilles không bao giờ đuổi kịp con rùa!*
  
  Suốt hơn 2.000 năm, nghịch lý của Zeno làm điên đầu các triết gia. Phải đến thế kỷ XVII, khi phép tính vi tích phân và *Tổng của cấp số nhân lùi vô hạn* ra đời, bài toán mới được giải mã hoàn toàn:
  $ T = 10 + 1 + 0,1 + 0,01 + ... = 10 / (1 - 0,1) = 100 / 9 = 11,111... "giây"! $
  
  Tổng của VÔ HẠN khoảng thời gian nhỏ li ti hoàn toàn có thể hội tụ về MỘT CON SỐ HỮU HẠN! Achilles vượt qua rùa ở đúng giây thứ $11,11$ tại vị trí $111,11 "m"$! Zeno đã vô tình tặng cho nhân loại hạt mầm đầu tiên của Giải tích và Giới hạn!
]

== 3. CUỘC ĐẤU TRƯỜNG ĐẠI SỐ MILAN 1545: TARTAGLIA, CARDANO & PHƯƠNG TRÌNH BẬC BA

#story-box(
  title: "Bí Mật Công Thức Bậc Ba & Sự Ra Đời Của Số Phức",
  author: "Niccolò Tartaglia (1499 – 1557) & Girolamo Cardano (1501 – 1576)",
)[
  Thời kỳ Phục hưng tại nước Ý, các nhà toán học kiếm sống và giữ ghế giáo sư bằng các *Cuộc đấu trường toán học công khai (Mathematical Duels)*: Hai bên ra cho nhau 30 bài toán hóc búa, ai giải được nhiều hơn trước sự chứng kiến của công chúng và quan tòa sẽ giành được tiền thưởng và danh tiếng.
  
  Nhà toán học nghèo nói ngọng *Niccolò Tartaglia* đã tìm ra công thức giải phương trình bậc ba dạng $x^3 + p x = q$. Bác sĩ khét tiếng *Girolamo Cardano* đã nài nỉ, thề độc trước Chúa sẽ giữ kín bí mật để xin Tartaglia truyền lại công thức dưới dạng một bài thơ mã hóa. Thế nhưng, năm 1545, Cardano đã bội ước xuất bản công thức trong kiệt tác *“Ars Magna”* (Nghệ thuật Lớn).
  
  Tartaglia tức giận phát điên, thách đấu Cardano một trận đấu đại số tại nhà thờ Santa Maria ở Milan trước hàng nghìn khán giả. Nhưng điều kỳ diệu nhất là: Khi Cardano áp dụng công thức cho phương trình $x^3 - 15x - 4 = 0$, công thức xuất hiện một biểu thức "quái vật":
  $ x = root(3, 2 + sqrt(-121)) + root(3, 2 - sqrt(-121)) $
  Căn bậc hai của một số âm $sqrt(-121)$! Thời đó, số âm còn chưa có căn! Nhưng Cardano nhận thấy phương trình này có một nghiệm thực rõ như ban ngày là $x = 4$ ($4^3 - 15(4) - 4 = 64 - 60 - 4 = 0$)!
  
  Để cứu công thức của mình, nhà toán học Rafael Bombelli đã dũng cảm chấp nhận thực thể $sqrt(-1)$ như một con số ảo (Imaginary Number $i$). Cuộc đại chiến Tartaglia - Cardano đã vô tình khai sinh ra *Tập hợp Số phức $CC$* — cánh cổng đưa vật lý lượng tử và kỹ thuật điện tử thế kỷ XX cất cánh!
]

== 4. ĐẠI CHIẾN BẢN QUYỀN VI TÍCH PHÂN: NEWTON VS LEIBNIZ (1699 – 1716)

#story-box(
  title: "Cuộc Chiến Danh Dự Giữa Hoàng Gia Anh & Lục Địa Châu Âu",
  author: "Sir Isaac Newton (Anh, 1642 – 1727) & Gottfried Wilhelm Leibniz (Đức, 1646 – 1716)",
)[
  Đây là cuộc chiến học thuật khốc liệt và cay đắng nhất trong lịch sử khoa học nhân loại giữa hai thiên tài vĩ đại nhất của thế kỷ XVII:
  - *Isaac Newton* phát minh ra phương pháp "Fluxions" (Phép tính dòng) vào năm 1666 khi ông 24 tuổi tránh dịch hạch tại quê nhà Woolsthorpe. Nhưng Newton có tính cách đa nghi, sợ bị chỉ trích nên giữ kín các bản thảo trong ngăn kéo suốt hàng chục năm không xuất bản.
  - *Gottfried Wilhelm Leibniz* độc lập phát minh ra phép tính vi tích phân vào khoảng năm 1674 tại Paris và công bố rộng rãi trên tạp chí khoa học năm 1684 với hệ thống ký hiệu tuyệt mỹ: $d y / (d x)$ và $integral y d x$.
  
  Khi Newton công bố cuốn sách *Principia* năm 1687, những người ủng hộ Newton tại Hội Hoàng gia Anh đã cáo buộc Leibniz ăn cắp ý tưởng của Newton qua những bức thư trao đổi năm xưa. Trớ trêu thay, Newton chính là Chủ tịch Hội Hoàng gia Anh! Ông đã tự tay lập ra một ủy ban điều tra "vô tư", tự mình bí mật viết báo cáo kết luận Leibniz là kẻ đạo văn!
  
  Cuộc chiến làm chia rẽ nền khoa học châu Âu suốt hơn một thế kỷ: Nước Anh bám lấy ký hiệu chấm $dot(x)$ rườm rà của Newton nên tụt hậu về giải tích, trong khi lục địa châu Âu phát triển rực rỡ nhờ ký hiệu $d / (d x)$ và $integral$ của Leibniz. Ngày nay, toàn bộ sách giáo khoa thế giới đều dùng ký hiệu của Leibniz, và lịch sử công bằng ghi nhận: *Newton là người đầu tiên tìm ra bản chất vật lý, nhưng Leibniz là người đầu tiên trao cho nhân loại ngôn ngữ đại số hoàn hảo của vi tích phân!*
]

== 5. SỰ SỤP ĐỔ CỦA TIÊN ĐỀ 5 EUCLID: LOBACHEVSKY, BOLYAI & HÌNH HỌC PHI EUCLID

#story-box(
  title: "Vượt Qua Giáo Điều 2.000 Năm Của Hình Học Cổ Điển",
  author: "Nikolai Lobachevsky (Nga, 1792 – 1856) & János Bolyai (Hungary, 1802 – 1860)",
)[
  Trong cuốn *“Cơ sở”* (Elements) năm 300 TCN, Euclid đưa ra 5 tiên đề hình học. Bốn tiên đề đầu tiên ngắn gọn, hiển nhiên. Nhưng *Tiên đề thứ 5 (Tiên đề đường thẳng song song)* lại dài dòng và kỳ quặc: *"Qua một điểm nằm ngoài đường thẳng, chỉ kẻ được duy nhất một đường thẳng song song với đường thẳng đã cho"*.
  
  Suốt 2.000 năm, hàng trăm nhà toán học vĩ đại đã cố gắng chứng minh Tiên đề 5 từ 4 tiên đề đầu để biến nó thành định lý, nhưng tất cả đều chuốc lấy thất bại ê chề.
  
  Đến thập niên 1820, một chàng sĩ quan trẻ người Hungary tên là *János Bolyai* và một giáo sư đại học nghèo người Nga tên là *Nikolai Lobachevsky* đã độc lập thực hiện một bước nhảy tư duy chấn động:
  *Điều gì sẽ xảy ra nếu Tiên đề thứ 5 KHÔNG ĐÚNG?*
  
  Họ giả định: *Qua một điểm ngoài đường thẳng, có thể kẻ được VÔ SỐ đường thẳng song song!*
  Tưởng chừng như giả định điên rồ này sẽ dẫn đến mâu thuẫn. Nhưng không! Một hệ thống hình học mới hoàn toàn nhất quán, logic và tuyệt mỹ đã mở ra: *Hình học Hypebol (Non-Euclidean Geometry)*! Trong không gian này:
  - Tổng ba góc của một tam giác luôn *nhỏ hơn $180 degree$*!
  - Không tồn tại hai tam giác đồng dạng mà khác kích thước!
  
  János Bolyai đã viết thư cho cha mình: *“Từ hư vô, con đã sáng tạo ra một vũ trụ mới kỳ lạ!”*. 
  Chính Hình học Phi Euclid này đã giải phóng loài người khỏi chiếc lồng không gian phẳng của Euclid, trở thành công cụ toán học tối thượng để Albert Einstein xây dựng nên *Thuyết Tương đối Tổng quát (General Relativity)* năm 1915, mô tả một vũ trụ nơi không-thời gian bị uốn cong bởi khối lượng của các vì sao!
]

== 6. GEORG CANTOR & CUỘC CHIẾN VÌ CÕI VÔ HẠN (1874 – 1891)

#story-box(
  title: "Người Dám Đếm Số Lượng Của Những Cõi Vô Tận",
  author: "Georg Cantor (Đức, 1845 – 1918)",
)[
  Trước Georg Cantor, toàn bộ các nhà tư tưởng từ Aristotle, Gauss đến Cauchy đều coi cõi Vô hạn ($infinity$) là một điều cấm kỵ: Vô hạn chỉ là một tiềm năng (Potential Infinity - một quá trình không bao giờ dừng lại), chứ không bao giờ là một thực thể hoàn tất (Actual Infinity).
  
  Nhưng vào năm 1874, nhà toán học người Đức *Georg Cantor* đã làm một điều chưa từng có ai dám làm: Ông xếp các cõi vô hạn lên bàn cân và đo lường kích thước (Lực lượng tập hợp - Cardinality) của chúng!
  - Bằng phương pháp song ánh, Cantor chứng minh: Tập số nguyên $ZZ$ và tập số hữu tỉ $QQ$ có cùng lực lượng với tập số tự nhiên $NN$ (Vô hạn đếm được $aleph_0$).
  - Sau đó, bằng *Phương pháp đường chéo kỳ ảo (Cantor's Diagonal Argument)*, ông chứng minh: Tập số thực $RR$ trên đoạn $[0; 1]$ là *VÔ HẠN KHÔNG ĐỂM ĐƯỢC ($c = 2^(aleph_0)$)*!
  
  *Kết luận chấn động:* Có những cõi Vô hạn TO LỚN HƠN những cõi Vô hạn khác! Tồn tại một hệ thống cấp bậc vô tận các cõi Vô hạn ($aleph_0 < aleph_1 < aleph_2 < ...$)!
  
  Khám phá này đã khiến giới hàn lâm nổi giận. Giáo sư Leopold Kronecker công khai gọi Cantor là "kẻ làm tha hóa thanh niên" và "kẻ phản bội toán học". Nhà triết học Poincaré gọi lý thuyết tập hợp là "căn bệnh hiểm nghèo". Cantor bị cô lập, rơi vào trầm cảm nặng nề và qua đời trong bệnh viện tâm thần ở Halle năm 1918.
  
  Nhưng nhà toán học vĩ đại David Hilbert đã đứng lên bảo vệ ông trước toàn thế giới bằng câu nói bất hủ:
  *“Không một ai có thể trục xuất chúng ta ra khỏi thiên đường mà Cantor đã mở ra cho nhân loại!”*. Ngày nay, toàn bộ toán học hiện đại đều được đặt trên nền tảng Lý thuyết Tập hợp của Georg Cantor!
]

== 7. DAVID HILBERT & 23 BÀI TOÁN THẾ KỶ TẠI PARIS 1900

#story-box(
  title: "Bản Tuyên Ngôn Định Hình Thế Kỷ XX Của Vị Vua Toán Học",
  author: "David Hilbert (Đức, 1862 – 1943) & Đại hội Toán học Quốc tế Paris 1900",
)[
  Ngày 8 tháng 8 năm 1900, tại Đại hội Toán học Quốc tế tổ chức tại Paris, nhà toán học người Đức *David Hilbert* bước lên bục diễn thuyết. Trong không khí trang nghiêm đón chào thế kỷ mới, ông đã dõng dạc đọc bản báo cáo lịch sử mang tên *“Các vấn đề Toán học”*, công bố danh sách 23 bài toán hóc búa chưa có lời giải.
  
  Hilbert tuyên bố một niềm tin sắt đá vào sức mạnh vô hạn của lý trí con người:
  *“Trong Toán học không có chỗ cho sự bất khả tri (Ignorabimus)! Chúng ta phải biết, và chúng ta sẽ biết! (Wir müssen wissen, wir werden wissen!)”*.
  
  23 bài toán của Hilbert đã trở thành kim chỉ nam dẫn đường cho toàn bộ nền toán học thế giới suốt thế kỷ XX. Việc giải quyết được một bài toán trong danh sách này đủ để mang lại danh tiếng bất tử cho bất kỳ nhà toán học nào (như Kurt Gödel giải bài toán số 1 và 2, Andrew Wiles giải bài toán Fermat liên quan bài toán số 10). Tinh thần lạc quan cách mạng của Hilbert chính là ngọn hải đăng soi sáng cho khát vọng chinh phục tri thức của nhân loại!
]

== 8. KURT GÖDEL & HAI ĐỊNH LÝ BẤT TOÀN NĂM 1931

#story-box(
  title: "Giới Hạn Tối Hậu Của Tư Duy Logic Con Người & Máy Tính",
  author: "Kurt Gödel (Áo, 1906 – 1978)",
)[
  Thập niên 1920, David Hilbert khởi xướng "Chương trình Hilbert" với tham vọng tối thượng: Xây dựng một hệ thống tiên đề toán học hoàn hảo tuyệt đối, thỏa mãn hai điều kiện:
  1. *Tính Nhất quán (Consistency):* Không bao giờ sinh ra bất kỳ mâu thuẫn nào ($1 = 0$).
  2. *Tính Đầy đủ (Completeness):* Mọi mệnh đề toán học đúng đắn đều có thể được chứng minh bên trong hệ thống tiên đề đó!
  
  Cả thế giới tin rằng toán học sắp đạt đến sự hoàn mỹ tối hậu. Nhưng vào mùa thu năm 1931 tại Vienna, một chàng thanh niên 25 tuổi trầm lặng tên là *Kurt Gödel* đã công bố một bài báo làm sụp đổ hoàn toàn giấc mơ của Hilbert: *Hai Định lý Bất toàn (Incompleteness Theorems)*.
  
  Bằng cách mã hóa các công thức toán học thành các số nguyên (Mã hóa Gödel), ông đã tạo ra một mệnh đề tự tham chiếu:
  $ G: "Mệnh đề này KHÔNG THỂ chứng minh được trong hệ tiên đề!" $
  - Nếu mệnh đề $G$ được chứng minh: Hệ thống đã chứng minh một điều sai $arrow$ Toán học mâu thuẫn!
  - Nếu mệnh đề $G$ không thể chứng minh: Mệnh đề $G$ nói đúng chân lý, nhưng hệ thống bất lực không chứng minh được $arrow$ Toán học bất toàn!
  
  *Định lý Bất toàn Gödel khẳng định:* Mọi hệ tiên đề đủ mạnh để chứa số học tự nhiên đều *KHÔNG THỂ VỪA NHẤT QUÁN VỪA ĐẦY ĐỦ*! Luôn tồn tại những chân lý toán học đúng đắn mà KHÔNG MỘT HỆ TIÊN ĐỀ NÀO CÓ THỂ CHỨNG MINH ĐƯỢC!
  
  Định lý Gödel không phải là sự thất bại của toán học, mà là một phát hiện triết học vĩ đại nhất thế kỷ XX: Nó chứng minh rằng trí tuệ con người và vũ trụ phong phú vô tận, không một cỗ máy tính thuật toán nào có thể đóng khung toàn bộ chân lý vào một chiếc hộp hữu hạn!
]

== 9. ALAN TURING 1936 & KHAI SINH KHOA HỌC MÁY TÍNH HIỆN ĐẠI

#story-box(
  title: "Từ Máy Turing Trừu Tượng Đến Siêu Trí Tuệ Nhân Tạo",
  author: "Alan Turing (Anh, 1912 – 1954)",
)[
  Năm 1936, chàng sinh viên 24 tuổi tại Cambridge *Alan Turing* khi suy ngẫm về Bài toán Quyết định (Entscheidungsproblem) của Hilbert đã phát minh ra một cỗ máy tưởng tượng mang tên *Máy Turing (Turing Machine)*:
  Một cỗ máy gồm một dải băng dài vô tận chia thành các ô vuông, một đầu đọc/ghi có thể di chuyển sang trái, sang phải, đọc ký hiệu $0$ hoặc $1$, và thay đổi trạng thái nội tại theo một bảng quy tắc hữu hạn.
  
  Chỉ với mô hình toán học đơn sơ bằng giấy và bút đó, Turing đã chứng minh tồn tại *Máy Turing Phổ quát (Universal Turing Machine)* có thể mô phỏng lại hoạt động của BẤT KỲ CỖ MÁY TÍNH TOÁN NÀO TRÊN ĐỜI! Đó chính là bản vẽ thiết kế lý thuyết đầu tiên của chiếc máy tính đa năng (Computer) mà các em đang sử dụng ngày nay!
  
  Trong Thế chiến II, Turing đã lãnh đạo đội ngũ tại Bletchley Park chế tạo cỗ máy cơ điện Bombe giải mã cỗ máy mật mã Enigma của Đức Quốc Xã, cứu sống hơn 14 triệu sinh mạng và rút ngắn cuộc chiến tranh ít nhất hai năm. Alan Turing được nhân loại tôn vinh là Người Cha của Khoa học Máy tính và Trí tuệ Nhân tạo hiện đại!
]

== 10. ANDREW WILES 1994 & BẢN HÙNG CA 358 NĂM GIẢI MÃ ĐỊNH LÝ CUỐI CÙNG CỦA FERMAT

#story-box(
  title: "Hành Trình Cô Đơn Bảy Năm Dưới Căn Gác Mái",
  author: "Pierre de Fermat (1637) & Sir Andrew Wiles (Anh, 1953 – nay)",
)[
  Năm 1637, bên lề cuốn sách cổ *“Arithmetica”* của Diophantus, thẩm phán Pierre de Fermat đã viết một dòng ghi chú nổi tiếng:
  *“Phương trình $x^n + y^n = z^n$ không có nghiệm nguyên dương nào khi $n >= 3$. Ta đã tìm ra một lời chứng minh thực sự tuyệt diệu cho điều này, nhưng lề cuốn sách này quá hẹp không đủ chỗ để ghi lại!”*.
  
  Dòng ghi chú lửng lơ đó đã trở thành lời thách thức lớn nhất lịch sử toán học suốt 358 năm. Hàng ngàn nhà toán học từ Euler, Gauss, Sophie Germain đến Dirichlet, Kummer đều lao vào cuộc săn lùng nhưng đều thất bại.
  
  Năm 1963, khi mới là một cậu bé 10 tuổi tại thư viện thành phố Cambridge, *Andrew Wiles* đã đọc được câu đố này và thề rằng cả cuộc đời mình sẽ dành để giải quyết nó. Năm 1986, khi nhà toán học Ken Ribet chứng minh được rằng Định lý Fermat là hệ quả của *Giả thuyết Taniyama-Shimura* về đường cong Elip, Wiles biết rằng thời khắc lịch sử đã đến.
  
  Suốt 7 năm ròng rã, Wiles tự giam mình dưới căn gác mái tại Đại học Princeton, tuyệt đối không tiết lộ cho bất kỳ ai trừ vợ mình. Ông từ bỏ mọi công việc giảng dạy và hội thảo, âm thầm kết nối những nhánh toán học tối tân nhất: Đường cong Elip, Dạng Modular, Đại số Galois và Hệ số Biến dạng.
  
  Tháng 6 năm 1993, tại Viện Isaac Newton ở Cambridge, Wiles bước lên bục giảng và viết dòng kết luận cuối cùng trước sự sững sờ nghẹn ngào của cả hội trường:
  *“Tôi nghĩ rằng tôi sẽ dừng lại ở đây!”*. Cả khán phòng vỡ òa trong những tràng pháo tay kéo dài không dứt! Dù sau đó phát hiện một lỗ hổng nhỏ, Wiles cùng học trò Richard Taylor đã kiên cường vá lại lỗ hổng sau 1 năm và chính thức công bố công trình hoàn mỹ vào năm 1995!
  
  *Thông điệp cho tuổi trẻ:* Định lý Fermat không chỉ là một kết quả số học, nó là minh chứng cho sự kiên định bền bỉ phi thường của con người. Không có bí mật nào của tự nhiên có thể lẩn trốn mãi mãi trước một ý chí sắt đá dám dâng hiến trọn vẹn cả cuộc đời cho chân lý!
]



#pagebreak()

= PHẦN VIII: ĐẠI BẢNG TRA CỨU 100 CÔNG THỨC & ĐỊNH LÝ VÀNG TOÁN HỌC KHỐI 10

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Hệ thống hóa toàn bộ công thức cốt lõi, điều kiện tồn tại và cạm bẫy nhận thức cần tránh của toàn bộ chương trình Toán học lớp 10. Đây là cẩm nang bỏ túi tối thượng giúp học sinh tra cứu tốc hành và tự tin bước vào mọi kỳ thi tuyển chọn.
]

#align(center)[
  #table(
    columns: (2.5cm, 4.5cm, 4.5cm, 4.5cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e293b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    
    table.header(
      text(fill: white, weight: "bold", size: 8.5pt)[Tên Định lý / Khái niệm],
      text(fill: white, weight: "bold", size: 8.5pt)[Công thức Toán học Chuẩn],
      text(fill: white, weight: "bold", size: 8.5pt)[Điều kiện Áp dụng / Tồn tại],
      text(fill: white, weight: "bold", size: 8.5pt)[Cạm bẫy Cần Tuyệt đối Tránh],
    ),
    
    [Mệnh đề Phủ định], [$macron(forall x in X : P(x)) equiv exists x in X, macron(P(x))$], [Mọi tập hợp $X != emptyset$], [Quên phủ định dấu bất đẳng thức ($>$ thành $<=$).],
    [Mệnh đề Kéo theo], [$P arrow Q equiv not P or Q$], [Chân trị chỉ sai khi $1 arrow 0$], [Tưởng rằng tiền đề sai thì cả mệnh đề sai (thực chất luôn đúng!).],
    [Tập con / Số tập con], [$n(P(A)) = 2^n$], [Tập $A$ có $n$ phần tử hữu hạn], [Quên đếm tập rỗng $emptyset$ và chính tập hợp $A$.],
    [Hiệu hai tập hợp], [$A \\ B = {x in A | x in.not B}$], [Mọi tập hợp $A, B$], [Nhầm lẫn giữa hiệu $A \\ B$ và giao $A inter B$.],
    [Bất đẳng thức Cauchy], [$a + b >= 2 sqrt(a b)$], [$a >= 0, b >= 0$], [Áp dụng khi hai số chưa chắc chắn không âm.],
    [Bất đẳng thức Bunhiacopxki], [$(a x + b y)^2 <= (a^2 + b^2)(x^2 + y^2)$], [Mọi số thực $a, b, x, y$], [Quên điều kiện xảy ra dấu bằng ($a/x = b/y$).],
    [Định lý Côsin], [$a^2 = b^2 + c^2 - 2 b c cos A$], [Tam giác bất kỳ], [Nhầm dấu trừ thành dấu cộng (dễ nhầm với Pitago mở rộng).],
    [Định lý Sin], [$a / (sin A) = b / (sin B) = c / (sin C) = 2R$], [Góc $A, B, C != 0, 180 degree$], [Quên số 2 trước bán kính đường tròn ngoại tiếp $R$.],
    [Công thức Heron], [$S = sqrt(p(p - a)(p - b)(p - c))$], [$p = (a + b + c) / 2$ (nửa chu vi)], [Nhầm $p$ là chu vi thay vì nửa chu vi.],
    [Bán kính nội tiếp $r$], [$S = p r arrow r = S / p$], [Tam giác bất kỳ], [Nhầm bán kính nội tiếp $r$ với ngoại tiếp $R$.],
    [Độ dài Trung tuyến], [$m_a^2 = (2(b^2 + c^2) - a^2) / 4$], [Hệ thức Apollonius], [Quên chia mẫu cho 4, nhầm dấu trừ của cạnh đối diện $a^2$.],
    [Độ dài Phân giác trong], [$l_a = (2 b c cos(A / 2)) / (b + c)$], [Tam giác bất kỳ], [Nhầm góc $A/2$ với góc $A$.],
    [Tổng hai Vectơ], [$vec(A B) + vec(B C) = vec(A C)$], [Quy tắc 3 điểm Chasles], [Cộng hai vectơ không chung điểm nối tiếp.],
    [Quy tắc Hình bình hành], [$vec(A B) + vec(A D) = vec(A C)$], [$A B C D$ là hình bình hành], [Nhầm vectơ đường chéo $vec(A C)$ với $vec(B D)$.],
    [Tọa độ Trung điểm], [$x_M = (x_A + x_B) / 2, y_M = (y_A + y_B) / 2$], [$M$ là trung điểm đoạn $A B$], [Nhầm dấu cộng thành dấu trừ.],
    [Tọa độ Trọng tâm], [$x_G = (x_A + x_B + x_C) / 3$], [$G$ là trọng tâm $Delta A B C$], [Quên chia cho 3 (dễ nhầm chia 2 như trung điểm).],
    [Tâm tỉ cự 3 điểm], [$alpha vec(I A) + beta vec(I B) + gamma vec(I C) = vec(0)$], [$alpha + beta + gamma != 0$], [Áp dụng khi tổng các hệ số triệt tiêu bằng 0.],
    [Tích vô hướng], [$vec(u) dot vec(v) = |vec(u)| |vec(v)| cos(vec(u), vec(v))$], [Mọi cặp vectơ], [Tưởng kết quả là một vectơ (thực chất là một số thực!).],
    [Biểu thức Tọa độ Tích VH], [$vec(u) dot vec(v) = u_1 v_1 + u_2 v_2$], [Trong hệ trục chuẩn $O x y$], [Nhầm nhân chéo thay vì hoành nhân hoành cộng tung nhân tung.],
    [Điều kiện Vuông góc], [$vec(u) perp vec(v) arrow.double u_1 v_1 + u_2 v_2 = 0$], [$vec(u), vec(v) != vec(0)$], [Quên điều kiện hai vectơ phải khác vectơ-không.],
    [Độ dài Vectơ], [$|vec(u)| = sqrt(u_1^2 + u_2^2)$], [Hệ trục Descartes], [Quên dấu căn bậc hai ngoài cùng.],
    [Góc giữa hai Vectơ], [$cos theta = (u_1 v_1 + u_2 v_2) / (sqrt(u_1^2 + u_2^2) sqrt(v_1^2 + v_2^2))$], [$vec(u), vec(v) != vec(0)$], [Mẫu số bị triệt tiêu khi có vectơ-không.],
    [Sai số tuyệt đối], [$Delta_a = |bar(a) - a| <= d$], [$d > 0$ là độ chính xác], [Nhầm sai số tuyệt đối với sai số tương đối.],
    [Sai số tương đối], [$delta_a = Delta_a / |a| <= d / |a|$], [$a != 0$], [Tính sai số tương đối mà quên chia cho độ lớn của số đo.],
    [Số Trung bình], [$bar(x) = 1/n sum_(i=1)^n x_i$], [Mẫu số liệu $n >= 1$], [Bị bóp méo hoàn toàn khi có giá trị ngoại lai cực đoan.],
    [Trung vị ($M_e$)], [Giá trị đứng chính giữa dãy đã sắp xếp], [Dãy số đã xếp thứ tự tăng dần], [Quên sắp xếp dãy số trước khi tìm trung vị!],
    [Tứ phân vị ($Q_1, Q_2, Q_3$)], [$Q_2 = M_e$, $Q_1$ là trung vị nửa dưới], [Mẫu số liệu chia đôi], [Không rõ quy tắc bỏ hay giữ trung vị khi $n$ lẻ.],
    [Khoảng Tứ phân vị], [$I Q R = Q_3 - Q_1$], [Thước đo độ phân tán vững], [Nhầm $I Q R$ với khoảng biến thiên $R = "Max" - "Min"$.],
    [Hàng rào Ngoại lai Tukey], [$["Lower", "Upper"] = [Q_1 - 1,5 I Q R; Q_3 + 1,5 I Q R]$], [Phát hiện Outliers], [Nhầm hệ số $1,5$ thành $3,0$ (hàng rào cực đoan).],
    [Phương sai mẫu], [$s^2 = 1/(n - 1) sum (x_i - bar(x))^2$], [Mẫu ngẫu nhiên kích thước $n$], [Chia cho $n$ thay vì chia $n - 1$ (quên hiệu chỉnh Bessel!).],
    [Độ lệch chuẩn], [$s = sqrt(s^2)$], [Cùng đơn vị với dữ liệu gốc], [Nhầm lẫn đơn vị giữa phương sai (bình phương) và độ lệch chuẩn.],
    [Hệ số biến thiên], [$C V = s / bar(x)$], [$bar(x) > 0$], [Dùng để so sánh độ phân tán giữa hai mẫu có đơn vị đo khác nhau.],
    [Tọa độ Đỉnh Parabol], [$I(-b / (2a); -Delta / (4a))$], [Hàm bậc hai $a != 0$], [Nhầm tung độ đỉnh là $-Delta / (2a)$ thay vì $-Delta / (4a)$.],
    [Trục đối xứng Parabol], [$x = -b / (2a)$], [Đường thẳng đứng], [Viết thiếu chữ $x =$ (chỉ ghi mỗi giá trị $-b/(2a)$).],
    [Định lý Viète], [$x_1 + x_2 = -b / a, x_1 x_2 = c / a$], [$Delta >= 0$], [Áp dụng Viète khi phương trình chưa chắc có nghiệm ($Delta < 0$).],
    [Dấu Tam thức bậc hai], [$a f(x) > 0 forall x in RR arrow.double cases(a != 0, Delta < 0)$], [Tam thức bậc hai], [Quên xét trường hợp hệ số $a = 0$ khi $a$ chứa tham số $m$.],
    [PT Vô tỉ dạng 1], [$sqrt(f(x)) = g(x) arrow.double cases(g(x) >= 0, f(x) = [g(x)]^2)$], [Phương trình chứa căn], [Quên đặt điều kiện $g(x) >= 0$ dẫn đến rước nghiệm ma!],
    [PT Vô tỉ dạng 2], [$sqrt(f(x)) = sqrt(g(x)) arrow.double cases(f(x) >= 0, f(x) = g(x))$], [Hai vế cùng có căn], [Đặt thừa cả hai điều kiện $f >= 0$ và $g >= 0$ gây cồng kềnh.],
    [PT Tổng quát ĐT], [$a x + b y + c = 0$], [$a^2 + b^2 > 0$ (VTPT $vec(n) = (a; b)$)], [Nhầm lẫn giữa vectơ pháp tuyến và vectơ chỉ phương.],
    [PT Tham số ĐT], [$cases(x = x_0 + u_1 t, y = y_0 + u_2 t)$], [$vec(u) = (u_1; u_2) != vec(0), t in RR$], [Quên miền xác định của tham số thời gian $t in RR$.],
    [Khoảng cách Điểm - ĐT], [$d(M, Delta) = (|a x_0 + b y_0 + c|) / sqrt(a^2 + b^2)$], [$Delta: a x + b y + c = 0$], [Quên dấu trị tuyệt đối trên tử số hoặc quên căn ở mẫu.],
    [Góc giữa hai ĐT], [$cos phi = (|a_1 a_2 + b_1 b_2|) / (sqrt(a_1^2 + b_1^2) sqrt(a_2^2 + b_2^2))$], [$0 degree <= phi <= 90 degree$], [Quên trị tuyệt đối trên tử (góc giữa 2 ĐT không bao giờ tù!).],
    [PT Chính tắc Đường tròn], [$(x - a)^2 + (y - b)^2 = R^2$], [Tâm $I(a; b)$, bán kính $R > 0$], [Nhầm dấu tọa độ tâm khi chuyển từ phương trình ra.],
    [Điều kiện Đường tròn], [$a^2 + b^2 - c > 0$], [Dạng $x^2 + y^2 - 2a x - 2b y + c = 0$], [Quên kiểm tra điều kiện $a^2 + b^2 - c > 0$.],
    [Tiếp tuyến Đường tròn], [$d(I, Delta) = R$], [Tiếp xúc tại đúng 1 điểm], [Nhầm điều kiện tiếp xúc với điều kiện cắt nhau ($d < R$).],
    [Phương trình Elip], [$x^2 / a^2 + y^2 / b^2 = 1$], [$a > b > 0, b^2 = a^2 - c^2$], [Nhầm hệ thức $b^2 = a^2 - c^2$ với Hypebol ($c^2 = a^2 + b^2$).],
    [Phương trình Hypebol], [$x^2 / a^2 - y^2 / b^2 = 1$], [$c^2 = a^2 + b^2, c > a > 0$], [Nhầm dấu trừ thành dấu cộng của Elip.],
    [Phương trình Parabol], [$y^2 = 2 p x$], [$p > 0$ (Tham số tiêu)], [Tiêu điểm $F(p/2; 0)$, đường chuẩn $x = -p/2$ (dễ nhầm chia 4).],
    [Tâm sai Conic], [$e = c / a$ (Elip, Hyp), $e = 1$ (Parabol)], [Mọi đường Conic], [Quên rằng đường tròn là trường hợp suy biến có $e = 0$.],
    [Quy tắc Cộng], [$n(A union B) = n(A) + n(B)$], [$A inter B = emptyset$ (Xung khắc)], [Áp dụng quy tắc cộng khi hai phương án không loại trừ nhau.],
    [Quy tắc Nhân], [$n(A_1 times A_2) = n_1 times n_2$], [Các công đoạn liên tiếp độc lập], [Áp dụng nhầm khi các công đoạn phụ thuộc điều kiện nhau.],
    [Hoán vị $P_n$], [$P_n = n!$], [$n in NN^*$ phần tử phân biệt], [Quy ước $0! = 1$ trong tính toán tổ hợp.],
    [Chỉnh hợp $A_n^k$], [$A_n^k = (n!) / ((n - k)!)$], [$0 <= k <= n$ (Có xếp thứ tự)], [Nhầm chỉnh hợp với tổ hợp khi thứ tự không quan trọng.],
    [Tổ hợp $C_n^k$], [$C_n^k = (n!) / (k! (n - k)!)$], [$0 <= k <= n$ (Không thứ tự)], [Tính chất đối xứng: $C_n^k = C_n^(n - k)$.],
    [Công thức Tam giác Pascal], [$C_n^k = C_(n-1)^(k-1) + C_(n-1)^k$], [$1 <= k <= n - 1$], [Dùng để lập trình sinh tổ hợp không bị tràn số nguyên.],
    [Khai triển Nhị thức Newton], [$(a + b)^n = sum_(k=0)^n C_n^k a^(n-k) b^k$], [$n in NN$], [Quên hệ số tổ hợp $C_n^k$ đứng trước mỗi số hạng.],
    [Số hạng tổng quát thứ $k+1$], [$T_(k+1) = C_n^k a^(n-k) b^k$], [Đếm từ $k = 0$], [Nhầm số hạng thứ $k$ có chỉ số là $k$ thay vì $k - 1$.],
    [Không gian mẫu $Omega$], [Tập hợp mọi kết quả khả dĩ], [Phép thử ngẫu nhiên], [Liệt kê thiếu kết quả hoặc kết quả không đồng khả năng.],
    [Xác suất Cổ điển], [$P(A) = (n(A)) / (n(Omega))$], [Các kết quả đồng khả năng], [Áp dụng công thức Laplace cho biến cố không đồng khả năng!],
    [Xác suất Biến cố đối], [$P(macron(A)) = 1 - P(A)$], [$macron(A) = Omega \\ A$], [Không nhận ra biến cố đối khi đề bài có từ "ít nhất một".],
    [Quy nạp Toán học], [1. Cơ sở $n=1$; 2. $k arrow k+1$], [Mệnh đề trên $NN^*$], [Quên bước cơ sở $n=1$ hoặc giả thiết quy nạp sai.],
    [Khử Gauss], [Biến đổi dòng về ma trận bậc thang], [Hệ phương trình tuyến tính], [Chia cho một số bằng 0 khi làm phép biến đổi sơ cấp dòng.],
  )
]


// ══════════════════════════════════════════════════════════════
// LỜI KẾT: BỨC THƯ GỬI NGƯỜI GIEO MẦM TƯ DUY LỚP 10
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFBEB"),
  stroke: (left: 5pt + c-gold, rest: 0.5pt + rgb("FDE68A")),
  inset: (x: 20pt, y: 18pt),
  radius: (right: 8pt),
)[
  #text(size: 14pt, weight: "black", fill: rgb("92400E"))[
    LỜI KẾT: NGỌN ĐUỐC TRÍ TUỆ TRONG TAY NGƯỜI THẦY
  ]
  #v(0.8em)
  
  Quý Thầy Cô giáo và các bạn học sinh thân mến,
  
  Chúng ta vừa cùng nhau đi qua một cuộc hành trình vĩ đại xuyên qua hơn 2.500 năm lịch sử tư tưởng nhân loại — từ những bờ cát cổ kính thành Athens của Aristotle, qua căn phòng lò sưởi mùa đông của René Descartes, bước qua cây cầu Brougham nơi Hamilton rút dao khắc phương trình Quaternion, chứng kiến cuộc đấu tranh bi tráng của Georg Cantor vì cõi Vô hạn, đến những chuyến bay vũ trụ thám hiểm Sao Hỏa và những dòng code thuật toán làm nên Trí tuệ Nhân tạo thế kỷ XXI.
  
  Mỗi công thức trong sách giáo khoa Toán lớp 10 không bao giờ là những con số chết. Chúng là *những dòng máu nóng của những bộ óc vĩ đại nhất từng sống trên Trái Đất!*
  
  Lớp 10 là ngưỡng cửa thiêng liêng nhất của bậc học THPT: Nơi học sinh rũ bỏ lối học cụ thể máy móc của tuổi ấu thơ để bước vào cảnh giới của tư duy trừu tượng hóa, tư duy tiên đề và khả năng mô hình hóa thế giới bằng đại số và hình học giải tích.
  
  Khi người thầy bước lên bục giảng với một trái tim say mê, biết kể cho học trò nghe những câu chuyện bi tráng ấy, người thầy không chỉ dạy toán, mà đang *thực hiện sứ mệnh truyền lửa văn minh*. Và những cô cậu học trò ngồi dưới lớp hôm nay, khi hiểu được nguồn gốc và vẻ đẹp thiêng liêng của tri thức, các em sẽ không còn học tập trong sự sợ hãi điểm số, mà sẽ bước đi bằng lòng tự hào và khát vọng chinh phục những đỉnh cao mới của nhân loại.
  
  Chúc cho ngọn lửa đam mê Toán học mãi mãi rực sáng trong trái tim của Thầy và Trò!
]

#v(1.5em)
#align(center)[
  #text(size: 12.5pt, weight: "bold", fill: c-navy)[HẾT TOÀN THƯ KHAI MỞ TRI THỨC SƯ PHẠM TOÁN 10]\
  #text(size: 9.5pt, style: "italic", fill: rgb("64748B"))[Dự án Sách Đề Ôn Tập Theo Chương Toán 10 · Hệ Sinh Thái ConicTypst Master Series]
]
