// ═════════════════════════════════════════════════════════════════════════════════
// BẢN KHẾ ƯỚC TRÁCH NHIỆM & TRƯỞNG THÀNH (STUDENT HONOR CODE & COMMITMENT)
// Trường THPT Nguyễn Hữu Cảnh — TP. Hồ Chí Minh • Giáo viên: Thầy Nguyễn Văn Sang
// Thiết kế Hoàng Gia & Sư Phạm Đẳng Cấp — Chuẩn in ấn A4 (1 trang duy nhất)
// ═════════════════════════════════════════════════════════════════════════════════

#let c-primary = rgb("#0B4F37")      // Xanh ngọc lục bảo đậm (Imperial Emerald)
#let c-primary-light = rgb("#F0FDF4")// Nền ngọc nhạt
#let c-secondary = rgb("#15803D")    // Xanh lá thanh nhã
#let c-gold = rgb("#B48A3C")         // Vàng đồng hoàng gia (Noble Gold)
#let c-gold-dark = rgb("#926C27")    // Vàng sẫm viền
#let c-gold-light = rgb("#FDFBF7")   // Nền kem ánh vàng
#let c-dark = rgb("#0F172A")         // Đen than lịch lãm
#let c-text = rgb("#1E293B")         // Màu chữ chuẩn
#let c-muted = rgb("#64748B")        // Chữ phụ
#let c-border = rgb("#E2E8F0")       // Viền mờ
#let c-accent-blue = rgb("#0284C7")  // Xanh biển
#let c-accent-orange = rgb("#D97706")// Cam đất hoàng kim

#set page(
  paper: "a4",
  margin: (top: 15mm, bottom: 14mm, left: 16mm, right: 16mm),
  fill: rgb("#FCFDFB"),
  background: {
    // Khung viền vàng đồng ngoài cùng
    place(top + left, dx: 7mm, dy: 7mm,
      rect(
        width: 210mm - 14mm,
        height: 297mm - 14mm,
        stroke: 0.8pt + c-gold,
        radius: 5pt,
        fill: none,
      )
    )
    // Khung viền ngọc lục bảo hoàng gia bên trong
    place(top + left, dx: 9.5mm, dy: 9.5mm,
      rect(
        width: 210mm - 19mm,
        height: 297mm - 19mm,
        stroke: 1.8pt + c-primary,
        radius: 3.5pt,
        fill: none,
      )
    )
    // Họa tiết 4 góc chữ L nghệ thuật đối xứng hoàn hảo
    place(top + left, dx: 11.5mm, dy: 11.5mm,
      polygon(
        fill: c-gold,
        (0pt, 0pt), (14pt, 0pt), (14pt, 2.5pt), (2.5pt, 2.5pt), (2.5pt, 14pt), (0pt, 14pt)
      )
    )
    place(top + right, dx: -11.5mm, dy: 11.5mm,
      polygon(
        fill: c-gold,
        (0pt, 0pt), (-14pt, 0pt), (-14pt, 2.5pt), (-2.5pt, 2.5pt), (-2.5pt, 14pt), (0pt, 14pt)
      )
    )
    place(bottom + right, dx: -11.5mm, dy: -11.5mm,
      polygon(
        fill: c-gold,
        (0pt, 0pt), (-14pt, 0pt), (-14pt, -2.5pt), (-2.5pt, -2.5pt), (-2.5pt, -14pt), (0pt, -14pt)
      )
    )
    place(bottom + left, dx: 11.5mm, dy: -11.5mm,
      polygon(
        fill: c-gold,
        (0pt, 0pt), (14pt, 0pt), (14pt, -2.5pt), (2.5pt, -2.5pt), (2.5pt, -14pt), (0pt, -14pt)
      )
    )
  }
)

#set text(
  font: ("Times New Roman", "Georgia", "Avenir Next"),
  size: 9.2pt,
  lang: "vi",
  fill: c-text,
)

#set par(leading: 0.50em, justify: false)

// ─────────────────────────────────────────────────────────────────────────────
// PHẦN HEADER: SỞ GD&ĐT TP.HCM • TRƯỜNG THPT NGUYỄN HỮU CẢNH • GV THẦY NGUYỄN VĂN SANG
// ─────────────────────────────────────────────────────────────────────────────

#grid(
  columns: (1.3fr, 1.1fr),
  align: (left, right),
  [
    #text(size: 8.5pt, weight: "bold", fill: c-primary)[SỞ GIÁO DỤC VÀ ĐÀO TẠO TP. HỒ CHÍ MINH]\
    #text(size: 8.5pt, weight: "bold", fill: c-dark)[TRƯỜNG THPT NGUYỄN HỮU CẢNH]\
    #text(size: 8pt, weight: "bold", fill: c-secondary)[GIÁO VIÊN PHỤ TRÁCH: THẦY NGUYỄN VĂN SANG]
  ],
  [
    #text(size: 8.5pt, weight: "bold", fill: c-dark)[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM]\
    #text(size: 8.2pt, weight: "bold", fill: c-dark)[Độc lập – Tự do – Hạnh phúc]\
    #v(-2pt)
    #align(right)[#box(width: 80pt)[#line(length: 100%, stroke: 0.6pt + c-gold)]]
  ]
)

#v(4pt)

// Huy hiệu & Tiêu đề trung tâm
#align(center)[
  #block(
    fill: c-gold-light,
    inset: (x: 14pt, y: 3pt),
    radius: 12pt,
    stroke: 0.8pt + c-gold,
  )[
    #text(size: 8pt, weight: "bold", fill: c-gold-dark, font: ("Avenir Next", "Helvetica Neue", "Arial"))[
      🛡️ CHUẨN MỰC TỰ TRỌNG & Ý THỨC TRÁCH NHIỆM HỌC SINH 🛡️
    ]
  ]
  
  #v(2pt)
  #text(size: 16.5pt, weight: "bold", fill: c-primary)[KHẾ ƯỚC DANH DỰ & MỤC TIÊU HỌC TẬP]
  
  #v(-3pt)
  #text(size: 8.2pt, weight: "bold", style: "italic", fill: c-muted, font: ("Avenir Next", "Helvetica Neue"))[
    STUDENT HONOR CODE & ACADEMIC ACTION CONTRACT — GDPT 2018
  ]
  
  #v(2pt)
  #block(
    width: 92%,
    stroke: (y: 0.6pt + c-gold),
    inset: (y: 3.5pt),
  )[
    #text(size: 8.6pt, style: "italic", fill: rgb("#334155"))[
      "Kỷ luật tự giác là cội nguồn của tự do • Danh dự cá nhân tạo nên nhân cách • Nỗ lực kiên trì tạo nên kỳ tích."
    ]
  ]
]

#v(3pt)

// ─────────────────────────────────────────────────────────────────────────────
// THẺ HỒ SƠ HỌC SINH (STUDENT PROFILE)
// ─────────────────────────────────────────────────────────────────────────────

#block(
  fill: rgb("#F8FAFC"),
  inset: (x: 10pt, y: 5.5pt),
  radius: 4pt,
  stroke: 0.7pt + c-border,
  width: 100%,
)[
  #grid(
    columns: (1.8fr, 0.8fr, 0.8fr, 1fr),
    gutter: 8pt,
    [
      #text(weight: "bold", fill: c-primary)[Họ và tên học sinh:] #box(width: 1fr)[#line(length: 100%, stroke: (paint: rgb("#94A3B8"), dash: "dotted"))]
    ],
    [
      #text(weight: "bold", fill: c-primary)[Lớp:] #box(width: 1fr)[#line(length: 100%, stroke: (paint: rgb("#94A3B8"), dash: "dotted"))]
    ],
    [
      #text(weight: "bold", fill: c-primary)[Số TT:] #box(width: 1fr)[#line(length: 100%, stroke: (paint: rgb("#94A3B8"), dash: "dotted"))]
    ],
    [
      #text(weight: "bold", fill: c-primary)[Tổ / Bàn:] #box(width: 1fr)[#line(length: 100%, stroke: (paint: rgb("#94A3B8"), dash: "dotted"))]
    ]
  )
  #v(2pt)
  #grid(
    columns: (1fr, 1fr, 1.2fr),
    [#text(size: 8.2pt, fill: c-muted)[Năm học: *2025 — 2026*]],
    [#text(size: 8.2pt, fill: c-muted)[Thời gian áp dụng: *[ ] HK1    [ ] HK2*]],
    [#text(size: 8.2pt, fill: c-muted)[Theo dõi nề nếp: *Hệ Thống ConicClassroom*]]
  )
]

#v(4pt)

// ─────────────────────────────────────────────────────────────────────────────
// PHẦN I: MỤC TIÊU DANH DỰ CỦA BẢN THÂN
// ─────────────────────────────────────────────────────────────────────────────

#text(size: 9.6pt, weight: "bold", fill: c-primary)[I. MỤC TIÊU DANH DỰ CỦA BẢN THÂN TRONG HỌC KỲ]
#v(2.5pt)

#grid(
  columns: (1fr, 1fr, 1.25fr),
  gutter: 6pt,
  // Thẻ 1: Điểm số
  block(
    fill: rgb("#F0FDF4"),
    stroke: 0.7pt + rgb("#86EFAC"),
    inset: (x: 7pt, y: 5pt),
    radius: 4pt,
  )[
    #text(weight: "bold", size: 8.5pt, fill: c-secondary)[🎯 Mục Tiêu Điểm Số Môn Học]
    #v(2pt)
    #text(size: 8pt)[
      • Điểm ĐGTX tối thiểu: *........ / 10.0*\
      • Điểm Thi Giữa Kỳ: *........ / 10.0*\
      • Điểm Thi Cuối Kỳ: *........ / 10.0*\
      • ĐTB môn kỳ vọng: *........*
    ]
  ],
  // Thẻ 2: ConicClassroom
  block(
    fill: rgb("#EFF6FF"),
    stroke: 0.7pt + rgb("#93C5FD"),
    inset: (x: 7pt, y: 5pt),
    radius: 4pt,
  )[
    #text(weight: "bold", size: 8.5pt, fill: c-accent-blue)[⚡ Mục Tiêu ConicClassroom]
    #v(2pt)
    #text(size: 8pt)[
      • Tích lũy tối thiểu: *............ XP*\
      • Danh hiệu kỳ vọng đạt được:\
        #box(baseline: 1pt)[#box(width: 7pt, height: 7pt, stroke: 0.8pt + c-muted, radius: 1.5pt)] #text(size: 7.8pt)[Vàng] #h(4pt)
        #box(baseline: 1pt)[#box(width: 7pt, height: 7pt, stroke: 0.8pt + c-muted, radius: 1.5pt)] #text(size: 7.8pt)[Kim Cương] #h(4pt)
        #box(baseline: 1pt)[#box(width: 7pt, height: 7pt, stroke: 0.8pt + c-muted, radius: 1.5pt)] #text(size: 7.8pt)[Top 3]
    ]
  ],
  // Thẻ 3: Thói quen quyết tâm rèn
  block(
    fill: rgb("#FFFBEB"),
    stroke: 0.7pt + rgb("#FDE68A"),
    inset: (x: 7pt, y: 5pt),
    radius: 4pt,
  )[
    #text(weight: "bold", size: 8.5pt, fill: rgb("#B45309"))[💎 1 Thói Quen Quyết Tâm Rèn]
    #v(2pt)
    #text(size: 7.8pt, style: "italic", fill: rgb("#78350F"))[
      "Em cam kết khắc phục dứt điểm 1 điểm yếu:"\
      #v(2pt)
      #line(length: 100%, stroke: (paint: rgb("#D97706"), dash: "dotted"))\
      #v(4pt)
      #line(length: 100%, stroke: (paint: rgb("#D97706"), dash: "dotted"))
    ]
  ]
)

#v(4.5pt)

// ─────────────────────────────────────────────────────────────────────────────
// PHẦN II: BỐN TRỤ CỘT CAM KẾT HÀNH ĐỘNG
// ─────────────────────────────────────────────────────────────────────────────

#text(size: 9.6pt, weight: "bold", fill: c-primary)[II. BỐN TRỤ CỘT HÀNH ĐỘNG — CHUẨN MỰC TỰ TRỌNG HỌC SINH]
#v(2.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  // Trụ Cột 1
  block(
    fill: rgb("#FAFAFA"),
    stroke: (left: 3pt + c-primary, rest: 0.5pt + c-border),
    inset: (x: 8pt, y: 5pt),
    radius: (right: 4pt),
  )[
    #text(weight: "bold", size: 8.8pt, fill: c-primary)[1. CHỦ ĐỘNG & TỰ GIÁC (Self-Mastery)]\
    #text(size: 8.1pt, fill: rgb("#334155"))[
      Hoàn thành 100% bài tập và chuẩn bị đầy đủ sách vở, tài liệu, đồ dùng học tập trước giờ học. Tuyệt đối *không đến lớp với tâm thế thụ động*, không tìm lý do thoái thác trách nhiệm.
    ]
  ],
  // Trụ Cột 2
  block(
    fill: rgb("#FAFAFA"),
    stroke: (left: 3pt + c-gold, rest: 0.5pt + c-border),
    inset: (x: 8pt, y: 5pt),
    radius: (right: 4pt),
  )[
    #text(weight: "bold", size: 8.8pt, fill: c-gold-dark)[2. CẦU TIẾN & BẢN LĨNH (Growth Mindset)]\
    #text(size: 8.1pt, fill: rgb("#334155"))[
      Không né tránh câu hỏi khó, không giấu dốt. Chủ động giơ tay phát biểu, lên bảng giải bài. Luôn ghi nhớ: *"Sai lầm trong luyện tập chính là cơ hội quý giá nhất để hoàn thiện tư duy và bứt phá."*
    ]
  ],
  // Trụ Cột 3
  block(
    fill: rgb("#FAFAFA"),
    stroke: (left: 3pt + c-accent-orange, rest: 0.5pt + c-border),
    inset: (x: 8pt, y: 5pt),
    radius: (right: 4pt),
  )[
    #text(weight: "bold", size: 8.8pt, fill: c-accent-orange)[3. KỶ LUẬT & TẬP TRUNG (Focus & Discipline)]\
    #text(size: 8.1pt, fill: rgb("#334155"))[
      Trân quý từng phút học tập. Tuyệt đối *nói không với điện thoại, mạng xã hội và việc riêng* trong giờ học. Đi học đúng giờ, tác phong nghiêm túc, ngồi ngay ngắn và tập trung cao độ.
    ]
  ],
  // Trụ Cột 4
  block(
    fill: rgb("#FAFAFA"),
    stroke: (left: 3pt + c-accent-blue, rest: 0.5pt + c-border),
    inset: (x: 8pt, y: 5pt),
    radius: (right: 4pt),
  )[
    #text(weight: "bold", size: 8.8pt, fill: c-accent-blue)[4. CHÍNH TRỰC & ĐỒNG ĐỘI (Integrity & Respect)]\
    #text(size: 8.1pt, fill: rgb("#334155"))[
      Trung thực tuyệt đối trong kiểm tra. Tôn trọng lời giảng của Thầy Cô và ý kiến xây dựng của bạn bè. Tích cực tham gia hoạt động nhóm, sẵn sàng chia sẻ, giúp đỡ bạn bè cùng tiến bộ.
    ]
  ]
)

#v(4.5pt)

// ─────────────────────────────────────────────────────────────────────────────
// PHẦN III: KHẾ ƯỚC ĐỒNG HÀNH & BẢO HỘ TỪ THẦY CÔ
// ─────────────────────────────────────────────────────────────────────────────

#block(
  fill: rgb("#F0FDF4"),
  stroke: (left: 3.5pt + c-secondary, rest: 0.6pt + rgb("#BBF7D0")),
  inset: (x: 9pt, y: 5pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", size: 8.6pt, fill: c-primary)[🤝 KHẾ ƯỚC BẢO HỘ SƯ PHẠM TỪ THẦY CÔ (QUYỀN LỢI & CƠ CHẾ BÙ ĐIỂM TT22):]\
  #text(size: 8pt, fill: rgb("#166534"))[
    Khi học sinh giữ đúng lời hứa nỗ lực và tôn trọng cam kết, Giáo viên cam kết: *Bảo hộ quyền làm bài gỡ điểm (bù điểm ĐGTX theo Thông tư 22)*; kiên nhẫn hướng dẫn lại những phần kiến thức chưa vững; vinh danh danh dự trên ConicClassroom và đồng hành hết lòng vì sự tiến bộ thực chất của em.
  ]
]

#v(5pt)

// ─────────────────────────────────────────────────────────────────────────────
// PHẦN IV: LỄ KÝ KẾT TAM GIÁC GIÁO DỤC
// ─────────────────────────────────────────────────────────────────────────────

#align(center)[
  #text(size: 8.2pt, style: "italic", fill: c-muted)[
    "Bản khế ước được lập tự nguyện bằng danh dự cá nhân, dán trang trọng tại trang đầu Vở ghi / Vở bài tập để nhắc nhở mỗi ngày."
  ]
]

#v(4pt)

#grid(
  columns: (1fr, 1fr, 1fr),
  align: center,
  [
    #text(weight: "bold", size: 8.8pt, fill: c-primary)[HỌC SINH CAM KẾT]\
    #text(size: 7.5pt, style: "italic", fill: c-muted)[(Ký bằng danh dự & ghi rõ họ tên)]\
    #v(32pt)
    #text(size: 8.2pt, fill: c-muted)[Họ và tên: .......................................]
  ],
  [
    #text(weight: "bold", size: 8.8pt, fill: c-dark)[CHA MẸ ĐỒNG HÀNH]\
    #text(size: 7.5pt, style: "italic", fill: c-muted)[(Ký xác nhận, tin tưởng & hỗ trợ)]\
    #v(32pt)
    #text(size: 8.2pt, fill: c-muted)[Họ và tên: .......................................]
  ],
  [
    #text(weight: "bold", size: 8.8pt, fill: c-secondary)[GIÁO VIÊN BẢO HỘ]\
    #text(size: 7.5pt, style: "italic", fill: c-muted)[(Xác nhận đồng hành & bảo hộ)]\
    #v(32pt)
    #text(weight: "bold", size: 8.8pt, fill: c-dark)[Thầy Nguyễn Văn Sang]
  ]
)

#v(6pt)

// ─────────────────────────────────────────────────────────────────────────────
// FOOTER
// ─────────────────────────────────────────────────────────────────────────────

#line(length: 100%, stroke: 0.5pt + c-gold)
#v(1pt)
#grid(
  columns: (1.5fr, 1fr),
  [
    #text(size: 7.4pt, fill: rgb("#94A3B8"))[
      *MÃ LƯU TRỮ:* CONIC-HONOR-2026 • TRƯỜNG THPT NGUYỄN HỮU CẢNH
    ]
  ],
  [
    #align(right)[
      #text(size: 7.4pt, style: "italic", fill: rgb("#94A3B8"))[
        TP. Hồ Chí Minh, ngày ..... tháng ..... năm 202...
      ]
    ]
  ]
)
