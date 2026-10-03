// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 26: BIẾN CỐ VÀ ĐỊNH NGHĨA CỔ ĐIỂN CỦA XÁC SUẤT (ĐỀ SỐ 30B - THỰC TIỄN & VẬN DỤNG)
// Lớp: Khối 10  ·  Mã đề: 189  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "../../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let notin = sym.in.not
#let cap = math.inter
#let cup = math.union
#let setminus = math.without
#let subset = math.subset
#let emptyset = math.emptyset
#let True(body) = ("true": true, body: body)
#let accent = rgb("#0057b8")



#show: lecture-theme.with(
  title: "BÀI 26: BIẾN CỐ VÀ ĐỊNH NGHĨA CỔ ĐIỂN CỦA XÁC SUẤT (ĐỀ SỐ 30B - THỰC TIỄN & VẬN DỤNG)",
  subtitle: "CHƯƠNG IX: TÍNH XÁC SUẤT THEO ĐỊNH NGHĨA CỔ ĐIỂN — MÃ ĐỀ: 189",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  base-size: 18pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#lt-toc(title: [🗺️ CẤU TRÚC ĐỀ THI & ĐIỀU HƯỚNG])

// ── BẢNG ĐIỀU HƯỚNG 22 CÂU HỎI ────────────────────────────
#slide(title: none)[
  #[#metadata(none) #label("sec-exercise-hub")]
  #context {
    let s = _lec-style.get()
    v(-0.4em)
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      box(fill: s.accent, inset: (x: 10pt, y: 5pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 11pt)[📋 MA TRẬN ĐIỀU HƯỚNG 22 CÂU HỎI]
      ],
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 189]],
      lt-nav-btn("lec-toc-main", icon: "◀", txt: "Mục lục chính")
    )
    v(0.4em)

    // Phần I: 12 câu TN (Lưới 6x2)
    block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#1d4ed8"))[🎯 PHẦN I: TRẮC NGHIỆM 4 LỰA CHỌN (Câu 1 -> 12)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#3b82f6"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#1d4ed8"))[Câu #i]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần II: 4 câu Đúng/Sai (Lưới 4x1)
    block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#e9d5ff"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#7e22ce"))[📝 PHẦN II: TRẮC NGHIỆM ĐÚNG / SAI (Câu 13 -> 16 — Mỗi câu 4 ý a, b, c, d)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        gutter: 6pt,
        ..(13, 14, 15, 16).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#a855f7"),
              inset: (y: 4.5pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#7e22ce"))[Câu #i (Đ/S)]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần III: 6 câu Trả lời ngắn (Lưới 6x1)
    block(fill: rgb("#ecfeff"), stroke: 1pt + rgb("#a5f3fc"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#0e7490"))[🔢 PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (Câu 17 -> 22)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(17, 18, 19, 20, 21, 22).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#06b6d4"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#0e7490"))[Câu #i]]
            )
          ]
        })
      )
    ]
  }
]

#let exam-part(title, count: none) = {
  slide(title: none)[
    #align(center + horizon)[
      #block(fill: rgb("#eff6ff"), stroke: 2pt + rgb("#2563eb"), inset: 18pt, radius: 10pt, width: 85%)[
        #text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[#title]
      ]
    ]
  ]
}

// ── NỘI DUNG 22 CÂU HỎI THỰC CHIẾN ─────────────────────────
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Kiểm soát chất lượng dược phẩm có CeTZ)
#lt-tn(num: 1, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Một lô thuốc gồm $20$ hộp thuốc viên, trong đó có $16$ hộp đạt chuẩn chất lượng cao và $4$ hộp có sai lệch nồng độ hoạt chất nhẹ. Đoàn thanh tra y tế lấy ngẫu nhiên đồng thời $3$ hộp thuốc từ lô để kiểm định độc lập. Xác suất để trong $3$ hộp thuốc lấy ra có đúng $1$ hộp bị sai lệch nồng độ bằng],
    (
        True([$8 / 19$]),
        [$4 / 19$],
        [$12 / 19$],
        [$1 / 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng tổ hợp tính số phần tử của không gian mẫu $C_20^3$ và số kết quả thuận lợi gồm 1 hộp sai lệch (từ 4 hộp) kết hợp với 2 hộp đạt chuẩn (từ 16 hộp).
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (6, 1.2), stroke: 1.2pt + gray, fill: rgb("f8fafc"))
          // 16 hộp đạt chuẩn (xanh)
          for i in range(16) {
            let row = calc.floor(i / 8)
            let col = calc.rem(i, 8)
            rect((0.3 + col * 0.45, 0.65 - row * 0.45), (0.65 + col * 0.45, 0.95 - row * 0.45), fill: rgb("ccfbf1"), stroke: 0.5pt + teal)
          }
          // 4 hộp sai lệch (đỏ)
          for i in range(4) {
            let row = calc.floor(i / 2)
            let col = calc.rem(i, 2)
            rect((4.3 + col * 0.6, 0.65 - row * 0.45), (4.75 + col * 0.6, 0.95 - row * 0.45), fill: rgb("fee2e2"), stroke: 0.5pt + red)
          }
          content((3.0, -0.3), [16 Hộp chuẩn (Teal) và 4 Hộp sai lệch (Đỏ)])
        })
        ]
        - Số phần tử không gian mẫu:
          $ |Omega| = C_20^3 = (20 times 19 times 18) / 6 = 1140 $
        - Số kết quả thuận lợi cho biến cố:
          $ |A| = C_4^1 times C_16^2 = 4 times ((16 times 15) / 2) = 4 times 120 = 480 $
        - Xác suất:
          $ P(A) = 480 / 1140 = 8 / 19 $
    ]
)

// TN 2 (Vé cào may mắn)
#lt-tn(num: 2, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Một siêu thị phát hành $100$ tấm vé cào trúng thưởng, trong đó có $5$ vé trúng giải Nhất, $15$ vé trúng giải Nhì và $80$ vé không trúng thưởng. Một khách hàng mua ngẫu nhiên $2$ vé cào. Xác suất để khách hàng đó trúng ít nhất một giải thưởng (Nhất hoặc Nhì) bằng],
    (
        True([$179 / 495$]),
        [$316 / 495$],
        [$1 / 5$],
        [$1 / 2$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp biến cố đối $overline(A)$: "Khách hàng không trúng bất kỳ giải thưởng nào trong cả 2 vé cào".
        - Tổng số vé trúng thưởng là $5 + 15 = 20$ vé; số vé không trúng là $80$ vé.
        - Không gian mẫu: $|Omega| = C_100^2 = (100 times 99) / 2 = 4950$.
        - Số cách chọn 2 vé đều không trúng thưởng:
          $ |overline(A)| = C_80^2 = (80 times 79) / 2 = 3160 $
        - Xác suất biến cố đối:
          $ P(overline(A)) = 3160 / 4950 = 316 / 495 $
        - Xác suất trúng ít nhất một giải:
          $ P(A) = 1 - 316 / 495 = 179 / 495 $
    ]
)

// TN 3 (Chậm chuyến bay độc lập)
#lt-tn(num: 3, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Ba thành viên trong một gia đình độc lập di chuyển trên $3$ chuyến bay của các hãng hàng không khác nhau. Xác suất bị chậm chuyến của mỗi chuyến bay lần lượt là $0.10$; $0.15$ và $0.20$. Xác suất để có đúng một người trong gia đình bị chậm chuyến bằng],
    (
        True([$0.329$]),
        [$0.450$],
        [$0.003$],
        [$0.285$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng quy tắc nhân cho các biến cố độc lập và quy tắc cộng cho 3 trường hợp xung khắc (chỉ người 1 chậm, chỉ người 2 chậm, hoặc chỉ người 3 chậm).
        Gọi $A, B, C$ lần lượt là biến cố người 1, 2, 3 bị chậm chuyến:
        $P(A) = 0.1 => P(overline(A)) = 0.9$
        $P(B) = 0.15 => P(overline(B)) = 0.85$
        $P(C) = 0.2 => P(overline(C)) = 0.8$
        Xác suất có đúng một người bị chậm:
        $ P = P(A) P(overline(B)) P(overline(C)) + P(overline(A)) P(B) P(overline(C)) + P(overline(A)) P(overline(B)) P(C) $
        $ = (0.1)(0.85)(0.8) + (0.9)(0.15)(0.8) + (0.9)(0.85)(0.2) $
        $ = 0.068 + 0.108 + 0.153 = 0.329 $
    ]
)

// TN 4 (Chu kỳ đèn giao thông có CeTZ)
#lt-tn(num: 4, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Tại một ngã tư, chu kỳ hoạt động của đèn tín hiệu giao thông kéo dài $60$ giây, bao gồm $30$ giây đèn xanh, $5$ giây đèn vàng và $25$ giây đèn đỏ. Một ô tô tiếp cận nút giao này tại một thời điểm hoàn toàn ngẫu nhiên. Xác suất để ô tô gặp tín hiệu đèn xanh bằng],
    (
        True([$1 / 2$]),
        [$5 / 12$],
        [$1 / 12$],
        [$7 / 12$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng mô hình xác suất hình học (xác suất theo độ dài thời gian). Tỉ số giữa khoảng thời gian đèn xanh và tổng chu kỳ đèn tín hiệu.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Biểu đồ tròn thời gian
          circle((0, 0), radius: 1.5, stroke: 1pt + gray)
          // 30s xanh (180°)
          arc((0, 0), radius: 1.5, start: 0deg, delta: 180deg, mode: "PIE", fill: rgb("d1fae5"), stroke: 1pt + green)
          content((0, 0.7), [Xanh 30s])
          // 5s vàng (30°)
          arc((0, 0), radius: 1.5, start: 180deg, delta: 30deg, mode: "PIE", fill: rgb("fef3c7"), stroke: 1pt + orange)
          // 25s đỏ (150°)
          arc((0, 0), radius: 1.5, start: 210deg, delta: 150deg, mode: "PIE", fill: rgb("fee2e2"), stroke: 1pt + red)
          content((0, -0.7), [Đỏ 25s])
        })
        ]
        - Thời gian đèn xanh là $30$ giây.
        - Tổng chu kỳ là $60$ giây.
        Xác suất gặp đèn xanh:
        $ P = 30 / 60 = 1 / 2 $
    ]
)

// TN 5 (Mã xác thực OTP không lặp số)
#lt-tn(num: 5, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Một ngân hàng gửi mã xác thực giao dịch OTP gồm $6$ chữ số ngẫu nhiên lấy từ tập ${0, 1, 2, ..., 9}$ (chữ số đầu tiên có thể bằng $0$). Xác suất để mã OTP nhận được có tất cả các chữ số đôi một khác nhau bằng],
    (
        True([$0.1512$]),
        [$0.1000$],
        [$0.3024$],
        [$0.0504$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu gồm tất cả các dãy 6 chữ số tùy ý. Biến cố thuận lợi là số chỉnh hợp chập 6 của 10 chữ số.
        - Số phần tử không gian mẫu:
          $ |Omega| = 10^6 = 1000000 $
        - Số mã OTP có 6 chữ số đôi một khác nhau:
          $ |A| = A_10^6 = 10 times 9 times 8 times 7 times 6 times 5 = 151200 $
        - Xác suất:
          $ P(A) = 151200 / 1000000 = 0.1512 $
    ]
)

// TN 6 (Lập nhóm phát triển ứng dụng)
#lt-tn(num: 6, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Một công ty công nghệ có $6$ lập trình viên Frontend và $4$ lập trình viên Backend. Ban giám đốc chọn ngẫu nhiên $3$ lập trình viên để thành lập một nhóm phát triển tính năng mới. Xác suất để nhóm phát triển có cả lập trình viên Frontend và lập trình viên Backend bằng],
    (
        True([$4 / 5$]),
        [$1 / 5$],
        [$3 / 5$],
        [$2 / 3$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp biến cố đối. Nhóm không có đủ cả 2 chuyên môn khi nhóm chỉ toàn Frontend hoặc chỉ toàn Backend.
        - Không gian mẫu: $|Omega| = C_10^3 = 120$.
        - Số nhóm chỉ toàn lập trình viên Frontend: $C_6^3 = 20$.
        - Số nhóm chỉ toàn lập trình viên Backend: $C_4^3 = 4$.
        - Số nhóm có cả Frontend và Backend:
          $ |A| = 120 - (20 + 4) = 96 $
        - Xác suất:
          $ P(A) = 96 / 120 = 4 / 5 $
    ]
)

// TN 7 (Hệ thống máy chủ dự phòng)
#lt-tn(num: 7, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Một hệ thống máy chủ ngân hàng sử dụng $3$ máy chủ hoạt động song song độc lập để sao lưu dữ liệu. Xác suất gặp sự cố trong ngày của các máy chủ lần lượt là $0.02$; $0.03$ và $0.05$. Hệ thống chỉ bị sập nếu cả $3$ máy chủ cùng gặp sự cố đồng thời trong ngày đó. Xác suất để hệ thống duy trì hoạt động bình thường trong ngày bằng],
    (
        True([$0.99997$]),
        [$0.00003$],
        [$0.90000$],
        [$0.99990$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng biến cố đối $overline(A)$: "Cả 3 máy chủ cùng gặp sự cố đồng thời". Áp dụng quy tắc nhân cho các biến cố độc lập.
        - Xác suất cả 3 máy chủ cùng hỏng:
          $ P(overline(A)) = (0.02) times (0.03) times (0.05) = 0.00003 $
        - Xác suất hệ thống hoạt động an toàn:
          $ P(A) = 1 - P(overline(A)) = 1 - 0.00003 = 0.99997 $
    ]
)

// TN 8 (Đoán ngẫu nhiên đề trắc nghiệm)
#lt-tn(num: 8, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Một học sinh trả lời ngẫu nhiên một đề kiểm tra gồm $4$ câu hỏi trắc nghiệm độc lập, mỗi câu có $4$ phương án lựa chọn và chỉ có duy nhất một phương án đúng. Xác suất để học sinh đó trả lời đúng ít nhất một câu bằng],
    (
        True([$175 / 256$]),
        [$81 / 256$],
        [$1 / 4$],
        [$3 / 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng biến cố đối: học sinh trả lời sai cả 4 câu hỏi.
        - Ở mỗi câu hỏi, xác suất trả lời sai là $3 / 4$.
        - Xác suất trả lời sai cả 4 câu:
          $ P(overline(A)) = (3 / 4)^4 = 81 / 256 $
        - Xác suất đúng ít nhất một câu:
          $ P(A) = 1 - 81 / 256 = 175 / 256 $
    ]
)

// TN 9 (Bốc thăm chia bảng bóng đá có CeTZ)
#lt-tn(num: 9, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Có $8$ đội bóng tham dự giải đấu (trong đó có hai đội hạt giống là Việt Nam và Thái Lan) được bốc thăm ngẫu nhiên chia đều vào hai bảng đấu $A$ và $B$ (mỗi bảng $4$ đội). Xác suất để hai đội Việt Nam và Thái Lan rơi vào hai bảng đấu khác nhau bằng],
    (
        True([$4 / 7$]),
        [$3 / 7$],
        [$1 / 2$],
        [$2 / 7$]
    ),
    loigiai: [
        *Phương pháp giải:* Cố định vị trí của đội tuyển Việt Nam (giả sử vào bảng $A$), sau đó tính xác suất để đội Thái Lan rơi vào các vị trí còn lại ở bảng $B$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (2.8, 1.2), stroke: 1.2pt + accent, fill: rgb("ccfbf1"))
          content((1.4, 0.9), [BẢNG A (4 đội)])
          content((1.4, 0.4), [Việt Nam + 3 vị trí])
          
          rect((3.5, 0), (6.3, 1.2), stroke: 1.2pt + blue, fill: rgb("dbeafe"))
          content((4.9, 0.9), [BẢNG B (4 đội)])
          content((4.9, 0.4), [4 vị trí trống])
        })
        ]
        - Giả sử đội Việt Nam đã được xếp vào một bảng đấu (ví dụ bảng $A$). Khi đó bảng $A$ còn lại $3$ vị trí trống, còn bảng $B$ có $4$ vị trí trống (tổng cộng còn $7$ vị trí cho $7$ đội còn lại).
        - Để Thái Lan nằm ở bảng đấu khác (bảng $B$), Thái Lan phải rơi vào một trong $4$ vị trí của bảng $B$.
        Xác suất cần tìm là:
        $ P = 4 / 7 $
    ]
)

// TN 10 (Gói tin vô tuyến phát lại)
#lt-tn(num: 10, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Xác suất truyền thành công một gói tin dữ liệu trên kênh vô tuyến ở mỗi lần gửi là $0.9$. Nếu truyền thất bại, bộ phát tự động gửi lại và cho phép gửi tối đa $3$ lần. Giao tiếp được coi là thất bại nếu cả $3$ lần truyền đều không thành công. Xác suất để gói tin được truyền thành công bằng],
    (
        True([$0.999$]),
        [$0.900$],
        [$0.001$],
        [$0.990$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng biến cố đối: cả 3 lần truyền đều thất bại.
        - Xác suất thất bại ở mỗi lần là: $1 - 0.9 = 0.1$.
        - Xác suất thất bại cả 3 lần liên tiếp:
          $ (0.1)^3 = 0.001 $
        - Xác suất truyền thành công (sau tối đa 3 lần):
          $ P = 1 - 0.001 = 0.999 $
    ]
)

// TN 11 (Tổ hợp mật khẩu wifi)
#lt-tn(num: 11, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Một điểm phát wifi có mật khẩu gồm $4$ chữ số khác nhau lấy từ tập ${1, 2, 3, 4, 5, 6, 7, 8}$. Một vị khách nhớ được rằng chữ số đầu tiên là $8$ và chữ số cuối cùng là $1$, nhưng quên mất hai chữ số ở giữa. Vị khách bấm ngẫu nhiên một mật khẩu thỏa mãn trí nhớ của mình. Xác suất để vị khách nhập đúng mật khẩu ngay trong lần thử đầu tiên bằng],
    (
        True([$1 / 30$]),
        [$1 / 60$],
        [$1 / 56$],
        [$1 / 42$]
    ),
    loigiai: [
        *Phương pháp giải:* Hai vị trí ở giữa được chọn có thứ tự từ 6 chữ số còn lại.
        - Chữ số đầu cố định là 8, chữ số cuối cố định là 1.
        - Còn lại $8 - 2 = 6$ chữ số để chọn vào 2 vị trí ở giữa:
          Số cách chọn: $A_6^2 = 6 times 5 = 30$ cách.
        - Xác suất bấm đúng ngay lần đầu:
          $ P = 1 / 30 $
    ]
)

// TN 12 (Hai người chọn cùng một quán ăn)
#lt-tn(num: 12, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Trên một con phố ẩm thực có $5$ nhà hàng chất lượng tương đương nhau. Hai người bạn An và Bình không hẹn trước, mỗi người độc lập chọn ngẫu nhiên một nhà hàng để ăn tối. Xác suất để hai người cùng chọn vào cùng một nhà hàng bằng],
    (
        True([$1 / 5$]),
        [$1 / 25$],
        [$2 / 5$],
        [$1 / 10$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu là số cặp nhà hàng $(A, B)$ có thể chọn ($5 times 5 = 25$). Biến cố thuận lợi là An và Bình cùng chọn 1 trong 5 nhà hàng (5 cách).
        - Không gian mẫu: $|Omega| = 5 times 5 = 25$.
        - Số kết quả hai người cùng quán: có $5$ cách.
        - Xác suất:
          $ P = 5 / 25 = 1 / 5 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân tích bốc thăm chia bảng bóng đá)
#lt-ds(num: 13, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Có $8$ đội bóng (trong đó có hai đội Việt Nam và Thái Lan) được bốc thăm ngẫu nhiên chia đều vào hai bảng $A$ và $B$ (mỗi bảng $4$ đội).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số cách chia $8$ đội vào hai bảng $A$ và $B$ bằng $70$ cách.]),
    True([Số cách chia sao cho Việt Nam và Thái Lan cùng nằm ở bảng $A$ bằng $15$ cách.]),
    True([Xác suất để hai đội Việt Nam và Thái Lan cùng nằm trong một bảng đấu bằng $3 / 7$.]),
    [Xác suất để hai đội Việt Nam và Thái Lan nằm ở hai bảng đấu khác nhau bằng $1 / 2$.]
  ),
  loigiai: [
    #step([Xét ý a: Số cách chia bảng])
    Chọn 4 đội cho bảng A: $C_8^4 = 70$ cách. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Cùng ở bảng A])
    Chọn thêm 2 đội từ 6 đội còn lại: $C_6^2 = 15$ cách. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Cùng một bảng đấu])
    Cùng bảng A (15 cách) hoặc cùng bảng B (15 cách): tổng 30 cách.
    Xác suất: $30 / 70 = 3 / 7$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Khác bảng đấu])
    Biến cố đối: $1 - 3 / 7 = 4 / 7$ (chứ không phải $1 / 2$). Mệnh đề d SAI.
  ]
)

// DS 2 (Kiểm soát chất lượng linh kiện)
#lt-ds(num: 14, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Một lô hàng gồm $15$ sản phẩm, trong đó có $10$ sản phẩm tốt và $5$ sản phẩm hỏng. Lấy ngẫu nhiên đồng thời $3$ sản phẩm để kiểm tra.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $455$.]),
    True([Số cách lấy được $3$ sản phẩm đều tốt bằng $120$.]),
    True([Xác suất để lấy được ít nhất một sản phẩm hỏng bằng $67 / 91$.]),
    [Xác suất để lấy được đúng $2$ sản phẩm tốt và $1$ sản phẩm hỏng bằng $1 / 2$.]
  ),
  loigiai: [
    #step([Xét ý a: Không gian mẫu])
    $|Omega| = C_15^3 = (15 times 14 times 13) / 6 = 455$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Cả 3 đều tốt])
    $C_10^3 = 120$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Ít nhất một sản phẩm hỏng])
    Xác suất cả 3 tốt: $120 / 455 = 24 / 91$.
    Xác suất ít nhất 1 hỏng: $1 - 24 / 91 = 67 / 91$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Đúng 2 tốt và 1 hỏng])
    $C_10^2 times C_5^1 = 45 times 5 = 225$.
    Xác suất: $225 / 455 = 45 / 91 approx 0.4945 != 1 / 2$. Mệnh đề d SAI.
  ]
)

// DS 3 (Hệ thống máy chủ dự phòng)
#lt-ds(num: 15, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Xét hệ thống $3$ máy chủ hoạt động độc lập có xác suất sự cố trong ngày lần lượt là $p_1 = 0.02$; $p_2 = 0.03$; $p_3 = 0.05$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Xác suất để cả $3$ máy chủ cùng gặp sự cố trong ngày bằng $0.00003$.]),
    True([Xác suất để cả $3$ máy chủ đều hoạt động bình thường trong ngày bằng $0.90307$.]),
    True([Xác suất để hệ thống duy trì hoạt động an toàn (không bị sập toàn bộ) bằng $0.99997$.]),
    [Xác suất để có đúng một máy chủ gặp sự cố lớn hơn $0.20$.]
  ),
  loigiai: [
    #step([Xét ý a: Cả 3 gặp sự cố])
    $(0.02)(0.03)(0.05) = 0.00003$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Cả 3 bình thường])
    $(0.98)(0.97)(0.95) = 0.90307$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: An toàn không sập])
    $1 - 0.00003 = 0.99997$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Đúng một máy chủ gặp sự cố])
    $0.02(0.97)(0.95) + 0.98(0.03)(0.95) + 0.98(0.97)(0.05) = 0.01843 + 0.02793 + 0.04753 = 0.09389 < 0.20$.
    Khẳng định lớn hơn $0.20$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Thi trắc nghiệm ngẫu nhiên)
#lt-ds(num: 16, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Một học sinh làm bài thi trắc nghiệm gồm $4$ câu hỏi độc lập, mỗi câu có $4$ phương án lựa chọn và chỉ có $1$ phương án đúng. Học sinh đánh ngẫu nhiên cả $4$ câu.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số cách trả lời $4$ câu hỏi của đề thi bằng $256$ cách.]),
    True([Xác suất để học sinh trả lời đúng cả $4$ câu hỏi bằng $1 / 256$.]),
    True([Xác suất để học sinh trả lời đúng ít nhất một câu hỏi bằng $175 / 256$.]),
    [Xác suất để học sinh trả lời sai cả $4$ câu hỏi bằng $1 / 4$.]
  ),
  loigiai: [
    #step([Xét ý a: Tổng số cách trả lời])
    $4^4 = 256$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Đúng cả 4 câu])
    $(1 / 4)^4 = 1 / 256$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Đúng ít nhất một câu])
    $1 - (3 / 4)^4 = 1 - 81 / 256 = 175 / 256$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Sai cả 4 câu])
    $(3 / 4)^4 = 81 / 256$ (chứ không phải $1 / 4$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Lấy ngẫu nhiên $3$ hộp thuốc từ $20$ hộp (trong đó có $4$ hộp sai lệch). Tính xác suất lấy được đúng $1$ hộp sai lệch (viết dưới dạng phân số tối giản $a / b$).],
    [8/19],
    loigiai: [
        #step([Tính xác suất])
        $ (C_4^1 times C_16^2) / C_20^3 = 480 / 1140 = 8 / 19 $
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Mua $2$ vé cào từ $100$ vé (có $20$ vé trúng thưởng). Tính xác suất trúng ít nhất một giải thưởng (viết dưới dạng phân số tối giản).],
    [179/495],
    loigiai: [
        #step([Biến cố đối])
        $ 1 - C_80^2 / C_100^2 = 1 - 3160 / 4950 = 179 / 495 $
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Ba người độc lập đi $3$ chuyến bay có xác suất chậm chuyến là $0.10$; $0.15$; $0.20$. Tính xác suất có đúng $1$ người bị chậm chuyến.],
    [0.329],
    loigiai: [
        #step([Tính xác suất])
        $ 0.068 + 0.108 + 0.153 = 0.329 $
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Một nhóm gồm $6$ Frontend và $4$ Backend. Chọn ngẫu nhiên $3$ người. Tính xác suất để nhóm có cả Frontend và Backend (viết dưới dạng phân số tối giản).],
    [4/5],
    loigiai: [
        #step([Tính xác suất])
        $ 96 / 120 = 4 / 5 $
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Chia ngẫu nhiên $8$ đội bóng vào hai bảng $A$ và $B$ (mỗi bảng $4$ đội). Tính xác suất để hai đội Việt Nam và Thái Lan ở hai bảng khác nhau (viết dưới dạng phân số tối giản).],
    [4/7],
    loigiai: [
        #step([Tính xác suất])
        $ 4 / 7 $
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 2 (B) — Mã 189], back-to: "sec-exercise-hub",[Tính xác suất để mã OTP gồm $6$ chữ số ngẫu nhiên nhận được có các chữ số đôi một khác nhau.],
    [0.1512],
    loigiai: [
        #step([Tính xác suất])
        $ A_10^6 / 10^6 = 151200 / 1000000 = 0.1512 $
    ]
)

// ── CỘT MỐC HOÀN THÀNH ─────────────────────────────────────
#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 24pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 26: BIẾN CỐ VÀ ĐỊNH NGHĨA CỔ ĐIỂN CỦA XÁC SUẤT (ĐỀ SỐ 30B - THỰC TIỄN & VẬN DỤNG)!]      #v(0.6em)
      #text(fill: white, size: 14pt)[
        Bạn đã hoàn thành xuất sắc toàn bộ 22 câu hỏi của đề thi!        Chúc các em tự tin đạt điểm số tối đa trong kỳ thi chính thức!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 12pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
      ]
      #v(0.8em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 11pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
