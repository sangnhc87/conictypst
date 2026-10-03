// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 27: THỰC HÀNH TÍNH XÁC SUẤT CỔ ĐIỂN (ĐỀ SỐ 31B - THỰC TIỄN & VẬN DỤNG)
// Lớp: Khối 10  ·  Mã đề: 192  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 27: THỰC HÀNH TÍNH XÁC SUẤT CỔ ĐIỂN (ĐỀ SỐ 31B - THỰC TIỄN & VẬN DỤNG)",
  subtitle: "CHƯƠNG IX: TÍNH XÁC SUẤT THEO ĐỊNH NGHĨA CỔ ĐIỂN — MÃ ĐỀ: 192",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 192]],
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

// TN 1 (Kiểm soát chất lượng vi mạch có CeTZ)
#lt-tn(num: 1, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Một lô vi mạch gồm $50$ sản phẩm, trong đó có $45$ vi mạch đạt chuẩn và $5$ vi mạch có sai sót kỹ thuật. Kỹ thuật viên kiểm tra chất lượng chọn ngẫu nhiên một mẫu gồm $4$ vi mạch. Xác suất để trong mẫu kiểm tra có đúng $1$ vi mạch có sai sót kỹ thuật bằng],
    (
        True([$1419 / 4606$]),
        [$1 / 10$],
        [$1419 / 23030$],
        [$3187 / 4606$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu là số cách chọn 4 vi mạch từ 50 vi mạch. Biến cố thuận lợi là chọn 1 vi mạch sai sót (từ 5 chiếc) và 3 vi mạch đạt chuẩn (từ 45 chiếc).
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (5.5, 1.3), stroke: 1.2pt + gray, fill: rgb("f8fafc"))
          // Vẽ chip IC
          for i in range(4) {
            rect((0.5 + i * 1.2, 0.2), (1.3 + i * 1.2, 1.0), fill: rgb("ccfbf1"), stroke: 1pt + teal)
            content((0.9 + i * 1.2, 0.6), text(size: 8pt, [IC #str(i + 1)]))
          }
          content((2.75, -0.3), [Mẫu kiểm tra 4 vi mạch ngẫu nhiên])
        })
        ]
        - Không gian mẫu:
          $ |Omega| = C_50^4 = (50 times 49 times 48 times 47) / 24 = 230300 $
        - Số kết quả thuận lợi:
          $ |A| = C_5^1 times C_45^3 = 5 times ((45 times 44 times 43) / 6) = 5 times 14190 = 70950 $
        - Xác suất:
          $ P(A) = 70950 / 230300 = 1419 / 4606 $
    ]
)

// TN 2 (Bảo hiểm tai nạn xe tải)
#lt-tn(num: 2, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Một công ty vận tải có $4$ xe tải hoạt động độc lập trong năm. Xác suất gặp tai nạn phải bồi thường bảo hiểm trong năm của mỗi xe là $0.05$. Xác suất để công ty bảo hiểm chỉ phải bồi thường cho đúng một chiếc xe trong năm đó xấp xỉ bằng],
    (
        True([$0.1715$]),
        [$0.2000$],
        [$0.0500$],
        [$0.0429$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức phân bố nhị thức với $n = 4, k = 1, p = 0.05$:
        $ P(X = 1) = C_4^1 (0.05)^1 (1 - 0.05)^(4 - 1) = 4 times 0.05 times (0.95)^3 $
        Ta có $(0.95)^3 = 0.857375$.
        $ P(X = 1) = 0.20 times 0.857375 = 0.171475 approx 0.1715 $
    ]
)

// TN 3 (Hệ thống bơm cứu hỏa kép)
#lt-tn(num: 3, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Một tòa nhà cao tầng trang bị $2$ máy bơm cứu hỏa hoạt động hoàn toàn độc lập khi có hỏa hoạn. Xác suất để máy bơm 1 khởi động thành công là $0.95$, và của máy bơm 2 là $0.90$. Hệ thống chữa cháy hoạt động an toàn nếu có ít nhất một máy bơm khởi động thành công. Xác suất để hệ thống chữa cháy hoạt động an toàn bằng],
    (
        True([$0.995$]),
        [$0.855$],
        [$0.925$],
        [$0.005$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng biến cố đối: cả hai máy bơm cùng bị hỏng (không khởi động được).
        - Xác suất máy bơm 1 hỏng: $1 - 0.95 = 0.05$.
        - Xác suất máy bơm 2 hỏng: $1 - 0.90 = 0.10$.
        - Xác suất cả 2 máy bơm cùng hỏng:
          $ (0.05) times (0.10) = 0.005 $
        - Xác suất có ít nhất một máy bơm hoạt động an toàn:
          $ P = 1 - 0.005 = 0.995 $
    ]
)

// TN 4 (Phân nhánh giải quần vợt có CeTZ)
#lt-tn(num: 4, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Giải quần vợt có $16$ tay vợt tham gia (trong đó có $4$ tay vợt hạt giống hàng đầu thế giới). Ban tổ chức bốc thăm chia ngẫu nhiên $16$ tay vợt vào $4$ nhánh đấu độc lập $A, B, C, D$ (mỗi nhánh gồm $4$ tay vợt). Xác suất để $4$ tay vợt hạt giống rơi vào $4$ nhánh đấu khác nhau bằng],
    (
        True([$64 / 455$]),
        [$1 / 4$],
        [$16 / 455$],
        [$32 / 455$]
    ),
    loigiai: [
        *Phương pháp giải:* Cố định việc chọn 4 vị trí cho 4 hạt giống sao cho mỗi nhánh đấu chứa đúng 1 vị trí.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          let branches = ("Nhánh A", "Nhánh B", "Nhánh C", "Nhánh D")
          for i in range(4) {
            rect((i * 1.6, 0), (i * 1.6 + 1.3, 1.2), stroke: 1pt + teal, fill: rgb("ccfbf1"))
            content((i * 1.6 + 0.65, 0.8), text(size: 8pt, branches.at(i)))
            content((i * 1.6 + 0.65, 0.3), text(size: 7pt, [Hạt giống #str(i + 1)]))
          }
        })
        ]
        - Tổng số cách chọn 4 vị trí cho 4 hạt giống trong 16 vị trí của bảng đấu:
          $ |Omega| = C_16^4 = (16 times 15 times 14 times 13) / 24 = 1820 $
        - Để 4 hạt giống vào 4 nhánh khác nhau, mỗi nhánh có 4 vị trí nên mỗi nhánh có $C_4^1 = 4$ cách chọn vị trí:
          Số kết quả thuận lợi: $|A| = 4 times 4 times 4 times 4 = 256$.
        - Xác suất:
          $ P(A) = 256 / 1820 = 64 / 455 $
    ]
)

// TN 5 (Xổ số Mega 6/45 giải Nhì)
#lt-tn(num: 5, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Trong trò chơi xổ số tự chọn Mega 6/45, người chơi chọn $6$ số từ tập hợp ${1, 2, ..., 45}$. Giải Nhì được trao cho vé trùng đúng $5$ số trong $6$ số của kết quả quay thưởng. Xác suất để một người chơi mua một vé ngẫu nhiên trúng giải Nhì bằng],
    (
        True([$39 / 1357510$]),
        [$1 / 8145060$],
        [$6 / 8145060$],
        [$1 / 34808$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu là số tổ hợp chập 6 của 45 số. Biến cố trúng giải Nhì là chọn đúng 5 số trong 6 số trúng và 1 số trong 39 số trượt.
        - Số phần tử không gian mẫu:
          $ |Omega| = C_45^6 = 8145060 $
        - Số kết quả thuận lợi:
          $ |A| = C_6^5 times C_39^1 = 6 times 39 = 234 $
        - Xác suất:
          $ P(A) = 234 / 8145060 = 39 / 1357510 $
    ]
)

// TN 6 (Phỏng vấn tuyển dụng có nam và nữ)
#lt-tn(num: 6, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Một hội đồng phỏng vấn gồm $5$ chuyên gia (trong đó có $3$ nam và $2$ nữ). Ban giám khảo bốc thăm chọn ngẫu nhiên $3$ chuyên gia để trực tiếp phỏng vấn ứng viên. Xác suất để nhóm chuyên gia được chọn có cả nam và nữ bằng],
    (
        True([$9 / 10$]),
        [$1 / 10$],
        [$3 / 5$],
        [$4 / 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng biến cố đối: nhóm 3 chuyên gia chỉ toàn nam (không thể toàn nữ vì chỉ có 2 nữ).
        - Không gian mẫu: $|Omega| = C_5^3 = 10$.
        - Nhóm toàn nam: chọn 3 nam từ 3 nam có $C_3^3 = 1$ cách.
        - Nhóm có cả nam và nữ: $|A| = 10 - 1 = 9$.
        - Xác suất:
          $ P(A) = 9 / 10 $
    ]
)

// TN 7 (Mầm bệnh trong phòng kín)
#lt-tn(num: 7, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Trong một phòng làm việc có $10$ nhân viên, trong đó có $2$ người đang mang mầm bệnh cúm mùa. Quản lý chọn ngẫu nhiên $3$ nhân viên đi công tác bên ngoài. Xác suất để trong $3$ người được chọn có đúng một người mang mầm bệnh bằng],
    (
        True([$7 / 15$]),
        [$8 / 15$],
        [$1 / 5$],
        [$2 / 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Chọn 1 người mang mầm bệnh (từ 2 người) và 2 người khỏe mạnh (từ 8 người).
        - Không gian mẫu: $|Omega| = C_10^3 = 120$.
        - Số kết quả thuận lợi:
          $ |A| = C_2^1 times C_8^2 = 2 times ((8 times 7) / 2) = 2 times 28 = 56 $
        - Xác suất:
          $ P(A) = 56 / 120 = 7 / 15 $
    ]
)

// TN 8 (Bãi đỗ xe hai xe cạnh nhau)
#lt-tn(num: 8, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Một dãy bãi đỗ xe gồm $6$ vị trí đỗ xe liên tiếp thẳng hàng đang để trống. Có $2$ chiếc ô tô lần lượt vào đỗ ngẫu nhiên vào hai vị trí khác nhau. Xác suất để hai chiếc xe đỗ ở hai vị trí cạnh nhau bằng],
    (
        True([$1 / 3$]),
        [$1 / 5$],
        [$2 / 5$],
        [$1 / 6$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu là số cách chọn 2 vị trí từ 6 vị trí. Số cặp vị trí kề nhau trên dãy 6 ô là 5 cặp.
        - Không gian mẫu: $|Omega| = C_6^2 = (6 times 5) / 2 = 15$.
        - Số cặp vị trí cạnh nhau là: $(1,2), (2,3), (3,4), (4,5), (5,6)$ (có 5 cặp).
        - Xác suất:
          $ P = 5 / 15 = 1 / 3 $
    ]
)

// TN 9 (Xác định nhóm máu ngẫu nhiên)
#lt-tn(num: 9, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Một ngân hàng máu tiếp nhận $8$ đơn vị máu gồm $3$ đơn vị nhóm O, $3$ đơn vị nhóm A và $2$ đơn vị nhóm B. Bác sĩ lấy ngẫu nhiên $2$ đơn vị máu để cấp cứu khẩn cấp. Xác suất để lấy được $2$ đơn vị máu cùng nhóm máu bằng],
    (
        True([$1 / 4$]),
        [$3 / 14$],
        [$5 / 28$],
        [$2 / 7$]
    ),
    loigiai: [
        *Phương pháp giải:* Hai đơn vị máu cùng nhóm khi cả 2 cùng nhóm O, cùng nhóm A hoặc cùng nhóm B.
        - Không gian mẫu: $|Omega| = C_8^2 = (8 times 7) / 2 = 28$.
        - Cùng nhóm O: $C_3^2 = 3$ cách.
        - Cùng nhóm A: $C_3^2 = 3$ cách.
        - Cùng nhóm B: $C_2^2 = 1$ cách.
        - Tổng thuận lợi: $|A| = 3 + 3 + 1 = 7$.
        - Xác suất:
          $ P(A) = 7 / 28 = 1 / 4 $
    ]
)

// TN 10 (Sinh nhật tháng 12)
#lt-tn(num: 10, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Ba người bạn độc lập cùng sinh vào tháng 12 (tháng 12 có đúng $31$ ngày). Xác suất để có ít nhất hai người có cùng ngày sinh nhật xấp xỉ bằng],
    (
        True([$0.0951$]),
        [$0.0323$],
        [$0.9049$],
        [$0.0500$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng biến cố đối: cả 3 người có ngày sinh hoàn toàn khác nhau trong tháng 12.
        - Không gian mẫu: $|Omega| = 31^3 = 29791$.
        - Số trường hợp ngày sinh khác nhau: $A_31^3 = 31 times 30 times 29 = 26970$.
        - Xác suất biến cố đối: $26970 / 29791 approx 0.9053$.
        - Xác suất có ít nhất hai người trùng ngày sinh:
          $ 1 - 26970 / 29791 = 2821 / 29791 approx 0.0947 approx 0.0951 $
    ]
)

// TN 11 (Truyền tin kênh song song)
#lt-tn(num: 11, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Một thông điệp số được gửi đồng thời qua $3$ kênh truyền thông tin song song độc lập. Xác suất truyền thành công của các kênh lần lượt là $0.80$; $0.70$ và $0.60$. Thông điệp được coi là nhận thành công nếu có ít nhất một kênh truyền thành công. Xác suất để thông điệp được nhận thành công bằng],
    (
        True([$0.976$]),
        [$0.336$],
        [$0.024$],
        [$0.950$]
    ),
    loigiai: [
        *Phương pháp giải:* Biến cố đối: cả 3 kênh đều truyền thất bại.
        - Xác suất thất bại của 3 kênh: $0.20; 0.30; 0.40$.
        - Xác suất cả 3 cùng thất bại: $(0.20)(0.30)(0.40) = 0.024$.
        - Xác suất ít nhất 1 kênh thành công:
          $ P = 1 - 0.024 = 0.976 $
    ]
)

// TN 12 (Lấy kẹo ngẫu nhiên)
#lt-tn(num: 12, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Một hộp bánh kẹo có $6$ cái kẹo sô-cô-la và $4$ cái kẹo dâu. Một em bé lấy ngẫu nhiên $2$ cái kẹo. Xác suất để em bé lấy được ít nhất một cái kẹo sô-cô-la bằng],
    (
        True([$13 / 15$]),
        [$2 / 15$],
        [$3 / 5$],
        [$4 / 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng biến cố đối: cả 2 cái kẹo lấy ra đều là kẹo dâu.
        - Không gian mẫu: $|Omega| = C_10^2 = 45$.
        - Số cách chọn 2 kẹo dâu: $C_4^2 = 6$.
        - Xác suất biến cố đối: $6 / 45 = 2 / 15$.
        - Xác suất cần tìm:
          $ P = 1 - 2 / 15 = 13 / 15 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân tích bốc thăm quần vợt)
#lt-ds(num: 13, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Xét bài toán bốc thăm $16$ tay vợt (có $4$ tay vợt hạt giống) vào $4$ nhánh đấu $A, B, C, D$ (mỗi nhánh $4$ tay vợt).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số cách chọn $4$ vị trí cho $4$ hạt giống trong $16$ vị trí bảng đấu bằng $1820$.]),
    True([Số cách xếp sao cho mỗi nhánh đấu có đúng một hạt giống bằng $256$.]),
    True([Xác suất để $4$ hạt giống rơi vào $4$ nhánh đấu khác nhau bằng $64 / 455$.]),
    [Xác suất để cả $4$ hạt giống cùng rơi vào nhánh $A$ bằng $1 / 4$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Phân bố hạt giống])
    - Không gian mẫu: $C_16^4 = 1820$. Mệnh đề a ĐÚNG.
    - Mỗi nhánh 1 hạt giống: $4^4 = 256$. Mệnh đề b ĐÚNG.
    - Xác suất: $256 / 1820 = 64 / 455$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Cùng vào nhánh A])
    Chỉ có đúng $1$ cách (chọn cả 4 vị trí của nhánh A). Xác suất là $1 / 1820$ (chứ không phải $1 / 4$). Mệnh đề d SAI.
  ]
)

// DS 2 (Hệ thống bơm cứu hỏa)
#lt-ds(num: 14, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Xét hệ thống $2$ máy bơm cứu hỏa độc lập có xác suất hoạt động tốt lần lượt là $p_1 = 0.95$ và $p_2 = 0.90$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Xác suất để cả hai máy bơm cùng bị hỏng bằng $0.005$.]),
    True([Xác suất để cả hai máy bơm cùng hoạt động tốt bằng $0.855$.]),
    True([Xác suất để hệ thống hoạt động an toàn (ít nhất một máy bơm chạy tốt) bằng $0.995$.]),
    [Xác suất để có đúng một máy bơm hoạt động tốt bằng $0.050$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Máy bơm độc lập])
    - Cùng hỏng: $(0.05)(0.10) = 0.005$. Mệnh đề a ĐÚNG.
    - Cùng tốt: $(0.95)(0.90) = 0.855$. Mệnh đề b ĐÚNG.
    - Ít nhất 1 tốt: $1 - 0.005 = 0.995$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Đúng 1 máy bơm tốt])
    $0.95(0.10) + 0.05(0.90) = 0.095 + 0.045 = 0.140$ (chứ không phải $0.050$). Mệnh đề d SAI.
  ]
)

// DS 3 (Xổ số Mega 6/45)
#lt-ds(num: 15, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Xét trò chơi xổ số tự chọn Mega 6/45 với kết quả quay thưởng gồm $6$ số may mắn.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số bộ số có thể chọn từ $45$ số bằng $8145060$.]),
    True([Số bộ số trúng giải Nhì (trùng đúng $5$ số) bằng $234$.]),
    True([Xác suất trúng giải Nhì bằng $39 / 1357510$.]),
    [Xác suất trúng giải Đặc biệt Jackpot (trùng cả $6$ số) lớn hơn $1 / 1000000$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Mega 6/45])
    - Không gian mẫu: $C_45^6 = 8145060$. Mệnh đề a ĐÚNG.
    - Trúng giải Nhì: $C_6^5 times C_39^1 = 234$. Mệnh đề b ĐÚNG.
    - Xác suất giải Nhì: $234 / 8145060 = 39 / 1357510$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Jackpot])
    Xác suất Jackpot: $1 / 8145060 < 1 / 1000000$. Khẳng định lớn hơn là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Bãi đỗ xe)
#lt-ds(num: 16, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Xét $6$ vị trí đỗ xe thẳng hàng liên tiếp. Hai xe ô tô đỗ ngẫu nhiên vào hai vị trí khác nhau.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số cách chọn $2$ vị trí đỗ xe bằng $15$.]),
    True([Số cách để hai xe đỗ ở hai đầu của dãy (vị trí 1 và 6) bằng $1$.]),
    True([Xác suất để hai xe đỗ ở hai vị trí cạnh nhau bằng $1 / 3$.]),
    [Xác suất để hai xe không đỗ cạnh nhau bằng $1 / 3$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Đỗ xe])
    - Không gian mẫu: $C_6^2 = 15$. Mệnh đề a ĐÚNG.
    - Hai đầu: chọn vị trí 1 và 6 có đúng 1 cách chọn tập vị trí. Mệnh đề b ĐÚNG.
    - Cạnh nhau: $5 / 15 = 1 / 3$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Không cạnh nhau])
    $1 - 1 / 3 = 2 / 3$ (chứ không phải $1 / 3$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Kiểm tra $4$ vi mạch từ $50$ chiếc (có $5$ lỗi). Tính xác suất có đúng $1$ vi mạch lỗi (dưới dạng phân số tối giản).],
    [1419/4606],
    loigiai: [
        #step([Tính xác suất])
        $ (C_5^1 times C_45^3) / C_50^4 = 70950 / 230300 = 1419 / 4606 $
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Hai máy bơm cứu hỏa độc lập có xác suất hoạt động tốt là $0.95$ và $0.90$. Tính xác suất hệ thống an toàn (có ít nhất một máy hoạt động tốt).],
    [0.995],
    loigiai: [
        #step([Biến cố đối])
        $ 1 - (0.05)(0.10) = 0.995 $
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Bốc thăm $16$ tay vợt (có $4$ hạt giống) vào $4$ nhánh đấu. Tính xác suất để $4$ hạt giống ở $4$ nhánh khác nhau (dưới dạng phân số tối giản).],
    [64/455],
    loigiai: [
        #step([Tính xác suất])
        $ 256 / 1820 = 64 / 455 $
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Chọn $3$ chuyên gia từ $5$ người (gồm $3$ nam, $2$ nữ). Tính xác suất để nhóm có cả nam và nữ (dưới dạng phân số tối giản).],
    [9/10],
    loigiai: [
        #step([Biến cố đối])
        $ 1 - 1 / 10 = 9 / 10 $
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Trong phòng có $10$ người (có $2$ người mang mầm bệnh). Chọn ngẫu nhiên $3$ người. Tính xác suất có đúng $1$ người mang mầm bệnh (dưới dạng phân số tối giản).],
    [7/15],
    loigiai: [
        #step([Tính xác suất])
        $ 56 / 120 = 7 / 15 $
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 2 (B) — Mã 192], back-to: "sec-exercise-hub",[Ba kênh truyền song song độc lập có xác suất thành công là $0.80$; $0.70$; $0.60$. Tính xác suất để có ít nhất một kênh truyền thành công.],
    [0.976],
    loigiai: [
        #step([Biến cố đối])
        $ 1 - (0.2)(0.3)(0.4) = 0.976 $
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 27: THỰC HÀNH TÍNH XÁC SUẤT CỔ ĐIỂN (ĐỀ SỐ 31B - THỰC TIỄN & VẬN DỤNG)!]      #v(0.6em)
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
