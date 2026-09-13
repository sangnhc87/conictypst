# -*- coding: utf-8 -*-

CONTENT = '''#import "@preview/cetz:0.5.2"

// ══════════════════════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ ĐỊNH DẠNG TÀI LIỆU TOÀN THƯ KHAI MỞ SƯ PHẠM LỚP 11
// ══════════════════════════════════════════════════════════════
#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 2.2cm, left: 2.0cm, right: 2.0cm),
  header: context {
    let page-num = counter(page).get().first()
    if page-num > 1 [
      #grid(
        columns: (1fr, auto),
        align(left)[#text(size: 8.5pt, fill: rgb("475569"), style: "italic")[Đại Toàn Thư Khai Mở Tri Thức Sư Phạm Toán 11 — Vô Hạn, Không Gian 3D & Kỷ Nguyên AI]],
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
        #text(size: 8pt, fill: rgb("94A3B8"))[Dự án Đề Ôn Tập Theo Chương Toán 11 · ConicTypst Master Pedagogical Series]
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

// Macro hộp mẩu chuyện lịch sử hấp dẫn (Story Box)
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

// Macro hộp kịch bản sư phạm trên lớp (Teacher Hook Box)
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

// Macro hộp ứng dụng Kỷ nguyên AI & Công nghệ cao (Tech Box)
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
      #text(size: 8.5pt, style: "italic", fill: c-blue)[Cầu nối từ kiến thức lớp 11 tới công nghệ hiện đại định hình tương lai]
    ]
  )
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("93C5FD"))
  #v(0.4em)
  #body
]

// Macro hộp giải mã sai lầm kinh điển của học sinh (Misconception Box)
#let misconception-box(title: "", body) = block(
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
      #text(size: 11pt, weight: "black", fill: rgb("991B1B"))[CẢNH BÁO SƯ PHẠM: GIẢI MÃ SAI LẦM KINH ĐIỂN CỦA HỌC SINH: #title]\\
      #text(size: 8.5pt, style: "italic", fill: rgb("B91C1C"))[Những cái bẫy tư duy trực giác phổ biến & Phương pháp phản chứng bẻ gãy ngụy biện]
    ]
  )
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("FCA5A5"))
  #v(0.4em)
  #body
]

// Macro hộp kịch bản đối thoại lớp học Socrates (Socratic Dialogue Box)
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

// Macro hộp góc nhìn toán học cao cấp (Deep Dive Box)
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

// Macro hộp Phòng Thí Nghiệm Tư Duy & Dự Án Tự Nghiên Cứu (Inquiry & Self-Study Lab)
#let inquiry-box(title: "", body) = block(
  fill: rgb("F0FDFA"),
  stroke: (left: 4.5pt + rgb("0D9488"), rest: 0.5pt + rgb("99F6E4")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 5pt),
  width: 100%,
  above: 1.2em,
  below: 1.2em,
)[
  #grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    text(size: 13pt)[🧪],
    [
      #text(size: 11pt, weight: "black", fill: rgb("115E59"))[PHÒNG THÍ NGHIỆM TƯ DUY & DỰ ÁN TỰ NGHIÊN CỨU: #title]\\
      #text(size: 8.5pt, style: "italic", fill: rgb("0F766E"))[Thử thách dành cho Nhà toán học trẻ: Thí nghiệm tư duy · Code mô phỏng máy tính · Sách hay nên đọc]
    ]
  )
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("5EEAD4"))
  #v(0.4em)
  #body
]

// ══════════════════════════════════════════════════════════════
// TRANG BÌA ĐẠI TOÀN THƯ NGHỆ THUẬT HOÀNG GIA LỚP 11
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
      BỘ SÁCH ĐỀ ÔN TẬP THEO CHƯƠNG TOÁN LỚP 11 (GDPT 2018)
    ]
    #v(1.0em)
    #text(size: 24pt, weight: "black", fill: rgb("F8FAFC"))[
      ĐẠI TOÀN THƯ KHAI MỞ\\
      TRI THỨC SƯ PHẠM TOÁN 11
    ]
    #v(0.8em)
    #text(size: 13pt, style: "italic", weight: "bold", fill: rgb("FCD34D"))[
      Chinh Phục Vô Hạn, Không Gian Đa Chiều & Khởi Nguyên Của Giải Tích\\
      Bảo Tàng Những Cuộc Chiến Tư Tưởng Vĩ Đại Giữa Các Thiên Tài Nhân Loại\\
      Từ Chiếc Cầu Tacoma Sụp Đổ, 20 Năm Bảng Logarit Đến Trái Tim Của Trí Tuệ Nhân Tạo (AI)
    ]
    #v(1.5em)

    // Hình vẽ CeTZ nghệ thuật hình học không gian 3D
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 2.2, stroke: 1.5pt + rgb("38BDF8"))
      circle((0, 0), radius: 1.6, stroke: (paint: rgb("F43F5E"), thickness: 1.2pt))
      circle((0, 0), radius: 1.0, stroke: (paint: rgb("FBBF24"), thickness: 1.0pt, dash: "dashed"))
      circle((0, 0), radius: 0.16, fill: rgb("FDE047"), stroke: none)
      line((-2.2, 0), (2.2, 0), stroke: 0.5pt + rgb("64748B"))
      line((0, -2.2), (0, 2.2), stroke: 0.5pt + rgb("64748B"))
      line((-1.5, -1.5), (1.5, 1.5), stroke: (paint: rgb("A855F7"), thickness: 0.8pt, dash: "dotted"))
      for a in (0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330) {
        line((0, 0), (2.2 * calc.cos(a * 1deg), 2.2 * calc.sin(a * 1deg)), stroke: 0.25pt + rgb("475569"))
      }
    })

    #v(1.2em)
    #text(size: 9.5pt, style: "italic", fill: rgb("CBD5E1"))[
      Bản Giao Hưởng Của Lượng Giác, Giới Hạn, Không Gian 3D, Mũ-Logarit & Đạo Hàm
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
// BỨC THƯ GỬI NGƯỜI ĐI DẠY TOÁN 11: BƯỚC VÀO VÙNG ĐẤT CỦA CÁC ĐẠI DANH HỌA
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 5pt + c-navy, rest: 0.5pt + rgb("E2E8F0")),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 6pt),
)[
  #text(size: 14pt, weight: "black", fill: c-navy)[
    BỨC THƯ GỬI NGƯỜI ĐI DẠY TOÁN 11: BƯỚC QUA CÁNH CỬA CỦA VÔ HẠN VÀ KHÔNG GIAN BA CHIỀU
  ]
  #v(0.6em)
  #text(size: 10pt, style: "italic", fill: rgb("334155"))[
    "Thưa quý Thầy Cô giáo kính mến,\\
    Nếu như chương trình Toán lớp 10 là chiếc nền móng kiên cố bằng đá tảng của Logic, Tập hợp, Tọa độ và Vectơ phẳng, thì bước sang Lớp 11, học sinh của chúng ta chính thức bước vào một cuộc đại viễn chinh trí tuệ làm thay đổi hoàn toàn cấu trúc não bộ:\\
    Các em bắt đầu phải đối mặt với những nghịch lý vô hạn của Giới hạn, sự vô tận của Dãy số, những đường cong uốn lượn tuần hoàn của Sóng Lượng giác, sự mở rộng ngạt thở lên Không gian 3 chiều đầy trừu tượng, và phát minh vĩ đại nhất của loài người: Đạo hàm!"
  ]
]

Lớp 11 là năm học có bước nhảy vọt về độ khó và tính trừu tượng cao nhất trong cả 3 năm cấp ba. Rất nhiều học sinh từng là "học sinh giỏi Toán" ở lớp 10 bỗng nhiên gục ngã, mất phương hướng khi bước vào Hình học không gian hay Phép tính Giới hạn và Đạo hàm. Các em cảm thấy bất lực vì không thể nhìn ra hình vẽ trong không gian ba chiều, không hiểu nổi tại sao con số $0,999...$ lại đúng bằng con số $1$, hay tại sao một chiếc xe hơi đang chạy lại có một "vận tốc tức thời" tại một thời điểm $t$ mà độ dài thời gian bằng $0$!

Nếu người thầy chỉ biết áp đặt công thức: *"Hãy chép thuộc lòng bảng đạo hàm này đi, hãy vẽ nét đứt nét liền như thế này đi, thi đại học sẽ có câu này đấy!"*, chúng ta sẽ bóp chết sự hào hứng và biến tiết học thành một cực hình tra tấn tinh thần.

*Nhưng nếu Thầy Cô kể cho học sinh nghe:*
- Đằng sau *Phương trình Lượng giác* là sự sụp đổ kinh hoàng của cây cầu treo Tacoma Narrows năm 1940 vì hiện tượng cộng hưởng sóng gió, hay phát minh biến đổi Fourier của Joseph Fourier giúp cứu sống hàng triệu bệnh nhân trong máy chụp cộng hưởng từ MRI.
- Đằng sau *Hàm số Logarit* là 20 năm ròng rã ngồi tính toán bằng tay trong buốt giá của Nam tước John Napier xứ Merchiston để cứu các nhà thiên văn học mù mắt vì tính toán.
- Đằng sau *Giới hạn* là những đêm trăn trở của Zeno thành Elea về chàng dũng sĩ Asin vĩnh viễn không đuổi kịp con rùa, và sự cứu rỗi của Cauchy, Weierstrass khi dựng nên định nghĩa $(epsilon, delta)$ thép gai bảo vệ nền văn minh.
- Đằng sau *Hình học không gian* là những bức tranh phối cảnh tuyệt mỹ thời Phục hưng của Leonardo da Vinci, và bí mật quân sự tối mật về Hình học họa hình của Gaspard Monge được Hoàng đế Napoleon bảo vệ cẩn mật.
- Đằng sau *Đạo hàm* là cuộc huyết chiến thư từ kéo dài suốt nhiều thập kỷ giữa hai bộ óc vĩ đại nhất lịch sử: Sir Isaac Newton và Gottfried Wilhelm Leibniz — cuộc chiến mà cả Hoàng gia Anh và Viện Hàn lâm Pháp đều bị cuốn vào vòng xoáy hận thù khoa học!
- Đằng sau *Xác suất có điều kiện* là bức thư tuyệt mệnh của Mục sư Thomas Bayes gửi lại cho đời sau, đặt nền móng cho toàn bộ thuật toán trí tuệ nhân tạo (Machine Learning) và bộ lọc thư rác của loài người hôm nay!

Khi đó, lớp học không còn là một phòng giam của các kỳ thi áp lực. Lớp học sẽ trở thành một thánh đường của tri thức, nơi học sinh được phiêu lưu qua những trang sử bi tráng nhất của nền văn minh loài người.

Cuốn Đại Toàn Thư Khai Mở Sư Phạm Toán 11 này được biên soạn công phu với quy mô đồ sộ chưa từng có, để trao vào tay Thầy Cô một kho báu giảng dạy vô giá. Kính chúc Quý Thầy Cô luôn dạt dào cảm hứng và tình yêu nghề trên bục giảng thiêng liêng!

#align(right)[
  #text(weight: "bold", fill: c-navy)[Thầy Nguyễn Văn Sang & Nhóm Biên Soạn ConicTypst]\
  #text(size: 9pt, style: "italic", fill: rgb("64748B"))[Cần Thơ & Hà Nội, Niên giám Sư phạm 2026]
]

#v(0.8cm)

= BẢN ĐỒ TỔNG THỂ TOÁN HỌC 11 TRONG TIẾN TRÌNH VĂN MINH NHÂN LOẠI

Chương trình Toán học Lớp 11 (GDPT 2018) là trục xoay bản lề, nơi học sinh chia tay tư duy hữu hạn tĩnh tại của thời Trung cổ để bước chân vào *KỶ NGUYÊN CỦA SỰ VÔ HẠN VÀ BIẾN THIÊN*:

#align(center)[
  #table(
    columns: (3.2cm, 3.8cm, 4.2cm, 5cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e1b4b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    table.header(
      text(fill: rgb("fbbf24"), weight: "bold", size: 8.5pt)[Chương Học Lớp 11],
      text(fill: white, weight: "bold", size: 8.5pt)[Bước Ngoặt Lịch Sử],
      text(fill: white, weight: "bold", size: 8.5pt)[Bộ Óc Thiên Tài Tiêu Biểu],
      text(fill: white, weight: "bold", size: 8.5pt)[Di Sản Định Hình Thế Giới Số],
    ),
    [Chương I: Hàm số Lượng giác], [Từ đo đạc tam giác thiên văn sang mô hình hóa dao động sóng.], [Hipparchus, Euler, Joseph Fourier], [Nén nhạc MP3, chụp cộng hưởng từ MRI, truyền sóng vô tuyến 5G.],
    [Chương II: Dãy số, Cấp số], [Khám phá sự bùng nổ theo cấp số và trật tự của sự sống.], [Fibonacci, Carl Friedrich Gauss], [Lãi kép ngân hàng, mô hình dịch bệnh SIR, thuật toán chia để trị AI.],
    [Chương III: Giới hạn & Liên tục], [Chinh phục bóng ma vô cùng bé, hợp lý hóa vi tích phân.], [Zeno, Cauchy, Karl Weierstrass], [Độ phân giải màn hình Retina, thuật toán đồ họa vector, chuyển động mượt mà.],
    [Chương IV: Đường thẳng & Mặt phẳng 3D], [Phá vỡ giới hạn phẳng 2D, mở toang không gian 3 chiều.], [Leonardo da Vinci, Girard Desargues], [Phối cảnh hội họa Phục hưng, kiến trúc đô thị, kính thực tế ảo VR.],
    [Chương V: Thống kê mẫu ghép nhóm], [Đo lường xu thế trung tâm của dữ liệu lớn quy mô quốc gia.], [Francis Galton, Karl Pearson], [Khảo sát nhân khẩu học, kiểm soát lạm phát, dữ liệu lớn Big Data.],
    [Chương VI: Hàm số Mũ & Logarit], [Biến phép nhân thành phép cộng, mở khóa thang đo tự nhiên.], [John Napier, Henry Briggs, Leonhard Euler], [Thang đo động đất Richter, độ pH hóa học, tuổi cổ vật Carbon-14.],
    [Chương VII: Đạo hàm], [Bắt giữ khoảnh khắc biến thiên tức thời, sinh ra Vật lý học.], [Pierre de Fermat, Sir Isaac Newton, Leibniz], [Vận tốc tức thời tên lửa vũ trụ, gia tốc xe điện, thuật toán Backprop AI.],
    [Chương VIII: Quan hệ Vuông góc 3D], [Đo khoảng cách và góc không gian, định hình kết cấu công trình.], [Euclid, Gaspard Monge], [Chịu lực tháp Eiffel, góc liên kết phân tử hóa học, định vị LiDAR.],
    [Chương IX: Xác suất Biến cố Giao], [Tính toán khả năng đồng thời, đo lường sự phụ thuộc.], [Blaise Pascal, Pierre de Fermat, Andrey Kolmogorov], [Đánh giá rủi ro bảo hiểm, chẩn đoán xét nghiệm y khoa, thuật toán game.],
  )
]

#v(0.8cm)

= MA TRẬN ÁNH XẠ TOÁN 11 VÀO KỶ NGUYÊN TRÍ TUỆ NHÂN TẠO & KHOA HỌC DỮ LIỆU

Rất nhiều học sinh thường hỏi: *"Toán lớp 11 trừu tượng thế này thì dùng làm gì trong thời đại số?"*. Bảng ma trận dưới đây trả lời dứt khoát câu hỏi đó:

#align(center)[
  #table(
    columns: (3.5cm, 5.5cm, 6.5cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e1b4b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    table.header(
      text(fill: rgb("fbbf24"), weight: "bold", size: 9pt)[Chủ Đề Toán 11],
      text(fill: white, weight: "bold", size: 9pt)[Khái Niệm Cốt Lõi Trong AI],
      text(fill: white, weight: "bold", size: 9pt)[Ứng Dụng Thực Tiễn Thời Đại 4.0],
    ),
    [Hàm số Lượng giác & Tuần hoàn], [Mã hóa Vị trí (Positional Encoding) trong Transformer], [Giúp ChatGPT và Large Language Models nhận biết thứ tự của từng từ trong câu văn dài.],
    [Cấp số nhân & Dãy số hồi quy], [Mạng nơ-ron hồi quy (RNN / LSTM), Tỷ lệ suy giảm Learning Rate], [Xử lý chuỗi thời gian, dự báo giá chứng khoán, nhận dạng giọng nói theo thời gian thực.],
    [Giới hạn & Sự hội tụ], [Sự hội tụ của Thuật toán Tối ưu hóa (Convergence Analysis)], [Xác định mô hình AI có học được tri thức hay bị bùng nổ gradient phân kỳ.],
    [Hình học Không gian 3D], [Đám mây điểm 3D (Point Cloud), Thị giác máy tính 3D], [Xe tự lái Tesla nhận diện chướng ngại vật trong không gian thực, Apple Vision Pro.],
    [Hàm số Mũ & Logarit], [Hàm Softmax, Hàm mất mát Cross-Entropy Loss], [Tính toán phân phối xác suất dự đoán của AI, đo độ bất định thông tin (Entropy).],
    [Phép tính Đạo hàm], [Giải thuật Lan truyền ngược (Backpropagation)], [Trái tim của Deep Learning: Tự động cập nhật hàng tỷ trọng số nơ-ron để máy tự học.],
    [Biến cố Độc lập & Xác suất giao], [Mạng Bayes, Naive Bayes Classifier, Markov Decision Process], [Hệ thống gợi ý video TikTok/YouTube, thuật toán phát hiện gian lận thẻ ngân hàng.],
  )
]

#v(0.8cm)

= HỆ NGUYÊN TẮC 5 CHÂN TRỜI TỰ HỌC & NGHIÊN CỨU DÀNH CHO HỌC SINH LỚP 11

Để làm chủ tri thức lớp 11 và chuẩn bị bước vào biển lớn, mỗi học sinh hãy rèn luyện 5 thói quen tư duy của một nhà nghiên cứu độc lập:

1. *Không bao giờ chấp nhận công thức mà không hiểu cội nguồn:* Khi nhìn thấy một công thức mới (như đạo hàm của $sin x$ là $cos x$, hay công thức cộng lượng giác), hãy tự hỏi: *"Tại sao lại như vậy? Ai là người đầu tiên tìm ra nó? Nếu không có nó thì nhân loại bế tắc ở đâu?"*.
2. *Rèn luyện năng lực trực quan hóa 3 chiều:* Đừng chỉ nhìn hình học không gian như những nét vẽ phẳng trên mặt giấy! Hãy nhắm mắt lại, xoay khối hình trong tâm trí, tự tay gấp những mô hình giấy bìa carton hay dựng hình trên GeoGebra 3D để xúc giác và thị giác hòa vào tư duy.
3. *Kết nối toán học với lập trình số:* Hãy học cách dùng Python để vẽ đồ thị hàm số, tính giới hạn dãy số, chạy thử nghiệm ngẫu nhiên Monte Carlo. Lập trình sẽ biến những công thức trừu tượng thành những chuyển động sống động trước mắt các em.
4. *Đối thoại phản biện cùng bạn bè và thầy cô:* Đừng sợ sai! Trong lịch sử, Euler, Gauss, Newton hay Fermat đều từng phạm vô số sai lầm trước khi chạm tay vào chân lý. Sự tranh luận sục sôi trong giờ học chính là nơi rèn đúc bộ não logic sắc bén nhất.
5. *Nuôi dưỡng tình yêu tri thức thuần khiết:* Hãy học không chỉ vì một bài kiểm tra 15 phút hay kỳ thi giữa kỳ. Hãy học vì niềm kiêu hãnh của một con người đang từng bước giải mã những mật mã vĩ đại nhất của vũ trụ!

#pagebreak()
'''
