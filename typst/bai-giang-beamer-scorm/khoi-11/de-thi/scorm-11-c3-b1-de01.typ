// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHƯƠNG III. CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM CỦA MẪU SỐ LIỆU GHÉP NHÓM (ĐỀ SỐ 01)
// Lớp: Khối 11  ·  Mã đề: 101  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

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

#show math.frac: math.display

#show: lecture-theme.with(
  title: "CHƯƠNG III. CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM CỦA MẪU SỐ LIỆU GHÉP NHÓM (ĐỀ SỐ 01)",
  subtitle: "ÔN TẬP CHƯƠNG 3 (TẬP 2) — MÃ ĐỀ: 101",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 101]],
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
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#lt-tn(num: 1, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho mẫu số liệu ghép nhóm về thời gian xem tivi trong một tuần (đơn vị: giờ) của 30 học sinh như sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Thời gian (giờ)], $[0; 5)$, $[5; 10)$, $[10; 15)$, $[15; 20)$,
        [Số học sinh], [4], [10], [12], [4]
      )
    ]
    Giá trị đại diện của nhóm $[10; 15)$ là bao nhiêu?],
    (
        [$10$],
        True([$12.5$]),
        [$15$],
        [$12$]
    ),
    loigiai: [
        Giá trị đại diện của nhóm $[a_i; a_(i+1))$ được tính bằng trung bình cộng hai đầu mút của nhóm:
        $ x_i = (a_i + a_(i+1))/(2) $.
        Do đó, giá trị đại diện của nhóm $[10; 15)$ là:
        $ x_3 = (10 + 15)/(2) = 12.5 $.
        Chọn đáp án B.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Khảo sát tuổi thọ (đơn vị: năm) của 50 bóng đèn do một nhà máy sản xuất thu được mẫu số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Tuổi thọ (năm)], $[3; 4)$, $[4; 5)$, $[5; 6)$, $[6; 7)$, $[7; 8)$,
        [Số bóng đèn], [5], [12], [20], [9], [4]
      )
    ]
    Nhóm chứa mốt của mẫu số liệu ghép nhóm trên là nhóm nào?],
    (
        [$[4; 5)$],
        True([$[5; 6)$]),
        [$[6; 7)$],
        [$[3; 4)$]
    ),
    loigiai: [
        Nhóm chứa mốt của mẫu số liệu ghép nhóm là nhóm có tần số lớn nhất.
        Trong bảng số liệu trên, tần số lớn nhất là $20$, tương ứng với nhóm $[5; 6)$.
        Chọn đáp án B.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Khảo sát điểm thi môn Toán học kỳ I của 40 học sinh lớp 11A thu được mẫu số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        [Điểm số], $[4; 5.5)$, $[5.5; 7)$, $[7; 8.5)$, $[8.5; 10)$,
        [Số học sinh], [6], [14], [12], [8]
      )
    ]
    Điểm số trung bình $overline(x)$ của 40 học sinh này là bao nhiêu?],
    (
        [$6.85$],
        [$7.00$],
        True([$7.075$]),
        [$7.25$]
    ),
    loigiai: [
        - Tính giá trị đại diện cho các nhóm:
          $x_1 = 4.75$, $x_2 = 6.25$, $x_3 = 7.75$, $x_4 = 9.25$.
        - Điểm số trung bình của mẫu số liệu ghép nhóm là:
          $ overline(x) = (6 dot 4.75 + 14 dot 6.25 + 12 dot 7.75 + 8 dot 9.25)/(40) = (28.5 + 87.5 + 93 + 74)/(40) = (283)/(40) = 7.075 $.
        Chọn đáp án C.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Khảo sát thời gian di chuyển từ nhà đến trường (đơn vị: phút) của 60 học sinh thu được bảng tần số ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Thời gian (phút)], $[5; 10)$, $[10; 15)$, $[15; 20)$, $[20; 25)$, $[25; 30)$,
        [Số học sinh], [8], [18], [20], [10], [4]
      )
    ]
    Nhóm chứa trung vị của mẫu số liệu ghép nhóm trên là nhóm nào?],
    (
        [$[10; 15)$],
        True([$[15; 20)$]),
        [$[20; 25)$],
        [$[5; 10)$]
    ),
    loigiai: [
        - Tổng số học sinh $n = 60 ==> (n)/(2) = 30$.
        - Lập bảng tần số tích lũy:
          + Tích lũy nhóm 1: $8 < 30$.
          + Tích lũy nhóm 2: $8 + 18 = 26 < 30$.
          + Tích lũy nhóm 3: $26 + 20 = 46 >= 30$.
        Do đó, nhóm đầu tiên có tần số tích lũy lớn hơn hoặc bằng $30$ là nhóm thứ 3: $[15; 20)$.
        Chọn đáp án B.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Khảo sát khối lượng (đơn vị: gram) của 40 quả cam thu hoạch tại một trang trại thu được bảng tần số ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Khối lượng (g)], $[100; 110)$, $[110; 120)$, $[120; 130)$, $[130; 140)$, $[140; 150)$,
        [Số quả cam], [3], [9], [16], [8], [4]
      )
    ]
    Trung vị $M_e$ của mẫu số liệu ghép nhóm trên bằng bao nhiêu?],
    (
        [$123.5$],
        True([$125$]),
        [$126.5$],
        [$128$]
    ),
    loigiai: [
        - Cỡ mẫu $n = 40 ==> (n)/(2) = 20$.
        - Tần số tích lũy các nhóm lượt là $3, 12, 28, 36, 40$. Nhóm chứa trung vị là nhóm $[120; 130)$.
        - Áp dụng công thức tính trung vị:
          $ M_e = r + ( (n/2 - C)/(n_m) ) dot h = 120 + ( (20 - 12)/(16) ) dot 10 = 120 + 5 = 125" g" $.
        Chọn đáp án B.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Khảo sát chiều cao (đơn vị: cm) của 50 học sinh nam lớp 11 thu được mẫu số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Chiều cao (cm)], $[150; 155)$, $[155; 160)$, $[160; 165)$, $[165; 170)$, $[170; 175)$,
        [Số học sinh], [5], [15], [18], [8], [4]
      )
    ]
    Mốt $M_o$ của mẫu số liệu ghép nhóm này xấp xỉ bằng bao nhiêu (làm tròn đến hàng phần trăm)?],
    (
        [$160.83$],
        True([$161.15$]),
        [$162.14$],
        [$162.50$]
    ),
    loigiai: [
        - Nhóm chứa mốt có tần số lớn nhất là $18 ==>$ nhóm $[160; 165)$.
        - Khi đó $a_j = 160$, độ dài nhóm $h = 5$, tần số nhóm mốt $n_j = 18$, tần số nhóm trước $n_(j-1) = 15$, tần số nhóm sau $n_(j+1) = 8$.
        - Áp dụng công thức mốt:
          $ M_o = a_j + (n_j - n_(j-1))/((n_j - n_(j-1)) + (n_j - n_(j+1))) dot h = 160 + (18 - 15)/((18 - 15) + (18 - 8)) dot 5 = 160 + (3)/(13) dot 5 approx 161.15" cm" $.
        Chọn đáp án B.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Thời gian (đơn vị: phút) để 80 học sinh giải xong một bài toán lập trình được ghi lại ở bảng sau:
    #align(center)[
      #table(
        columns: (2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        [Thời gian (phút)], $[1; 3)$, $[3; 5)$, $[5; 7)$, $[7; 9)$,
        [Số học sinh], [12], [28], [24], [16]
      )
    ]
    Nhóm chứa tứ phân vị thứ nhất $Q_1$ của mẫu số liệu ghép nhóm là nhóm nào?],
    (
        [$[1; 3)$],
        True([$[3; 5)$]),
        [$[5; 7)$],
        [$[7; 9)$]
    ),
    loigiai: [
        - Cỡ mẫu $n = 80 ==> (n)/(4) = 20$.
        - Lập tần số tích lũy: Nhóm 1 có $12 < 20$. Nhóm 2 có $12 + 28 = 40 >= 20$.
        - Do đó, nhóm đầu tiên có tần số tích lũy không nhỏ hơn $20$ là nhóm thứ 2: $[3; 5)$.
        Chọn đáp án B.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Thống kê tiền điện (đơn vị: nghìn đồng) tháng 5 của 40 hộ gia đình trong một xóm thu được mẫu số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        [Số tiền (nghìn đồng)], $[200; 400)$, $[400; 600)$, $[600; 800)$, $[800; 1000)$,
        [Số hộ gia đình], [6], [14], [12], [8]
      )
    ]
    Tứ phân vị thứ ba $Q_3$ của mẫu số liệu ghép nhóm này xấp xỉ bằng bao nhiêu?],
    (
        [$725.0$],
        [$750.0$],
        True([$766.67$]),
        [$783.33$]
    ),
    loigiai: [
        - Cỡ mẫu $n = 40 ==> (3n)/(4) = 30$.
        - Tần số tích lũy các nhóm lượt là $6, 20, 32, 40$. Nhóm chứa $Q_3$ là nhóm $[600; 800)$.
        - Áp dụng công thức tính $Q_3$:
          $ Q_3 = 600 + ( (30 - 20)/(12) ) dot 200 = 600 + (10)/(12) dot 200 = 600 + 166.67 = 766.67" nghìn đồng" $.
        Chọn đáp án C.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Trong các phát biểu sau đây về số đặc trưng đo xu thế trung tâm của mẫu số liệu ghép nhóm, phát biểu nào đúng?],
    (
        [Mốt là giá trị nằm chính giữa mẫu số liệu đã sắp xếp.],
        [Tứ phân vị thứ hai $Q_2$ luôn luôn bằng số trung bình $overline(x)$.],
        True([Trung vị $M_e$ chia mẫu số liệu thành hai phần, mỗi phần chứa khoảng 50% số giá trị.]),
        [Mốt của mẫu số liệu ghép nhóm là nhóm có tần số nhỏ nhất.]
    ),
    loigiai: [
        - Mốt của mẫu số liệu ghép nhóm là giá trị xuất hiện với mật độ/tần số lớn nhất (không phải nằm giữa).
        - Trung vị $M_e$ chính là tứ phân vị thứ hai $Q_2$, có vai trò chia mẫu số liệu thành 2 phần bằng nhau (mỗi phần khoảng 50% dữ liệu).
        - Trung vị và số trung bình nhìn chung không nhất thiết bằng nhau.
        Chọn đáp án C.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Người ta phân chia một mẫu số liệu thành 5 nhóm có độ dài bằng nhau từ khoảng $[10; 60)$. Khoảng của nhóm thứ 3 là nhóm nào?],
    (
        [$[20; 30)$],
        True([$[30; 40)$]),
        [$[40; 50)$],
        [$[25; 35)$]
    ),
    loigiai: [
        - Độ dài của mỗi nhóm là: $h = (60 - 10)/(5) = 10$.
        - Danh sách 5 nhóm lần lượt là: $[10; 20), [20; 30), [30; 40), [40; 50), [50; 60)$.
        - Nhóm thứ 3 là $[30; 40)$.
        Chọn đáp án B.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Bảng tần số tương đối ghép nhóm dưới đây biểu diễn năng suất lúa (đơn vị: tấn/ha) thu hoạch tại một địa phương:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Năng suất (tấn/ha)], $[4; 5)$, $[5; 6)$, $[6; 7)$, $[7; 8)$,
        [Tần số tương đối], [10%], [30%], [40%], [20%]
      )
    ]
    Năng suất lúa trung bình $overline(x)$ của địa phương đó là bao nhiêu?],
    (
        [$6.0$ tấn/ha],
        True([$6.2$ tấn/ha]),
        [$6.5$ tấn/ha],
        [$6.8$ tấn/ha]
    ),
    loigiai: [
        - Giá trị đại diện cho các nhóm lượt là: $4.5; 5.5; 6.5; 7.5$.
        - Số trung bình tính theo tần số tương đối $f_i$:
          $ overline(x) = f_1 x_1 + f_2 x_2 + f_3 x_3 + f_4 x_4 = 0.1 dot 4.5 + 0.3 dot 5.5 + 0.4 dot 6.5 + 0.2 dot 7.5 = 0.45 + 1.65 + 2.60 + 1.50 = 6.2" tấn/ha" $.
        Chọn đáp án B.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Khảo sát số giờ làm thêm trong một tuần của 20 sinh viên thu được bảng số liệu ghép nhóm sau (chưa hoàn chỉnh):
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Số giờ làm thêm], $[0; 4)$, $[4; 8)$, $[8; 12)$, $[12; 16)$,
        [Số sinh viên], [4], [$x$], [8], [2]
      )
    ]
    Giá trị của $x$ trong bảng tần số ghép nhóm trên là bao nhiêu?],
    (
        [$4$],
        [$5$],
        True([$6$]),
        [$7$]
    ),
    loigiai: [
        - Tổng số sinh viên được khảo sát là $n = 20$.
        - Ta có phương trình tổng tần số:
          $ 4 + x + 8 + 2 = 20 ==> x + 14 = 20 ==> x = 6 $.
        Chọn đáp án C.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#lt-ds(num: 13, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Khảo sát thời gian học trực tuyến trong ngày (đơn vị: phút) của 50 học sinh khối 11 thu được mẫu số liệu ghép nhóm như bảng sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Thời gian (phút)], $[30; 60)$, $[60; 90)$, $[90; 120)$, $[120; 150)$, $[150; 180)$,
        [Số học sinh], [6], [14], [18], [8], [4]
      )
    ]
    Các phát biểu sau đúng hay sai?],
    (
        True([Giá trị đại diện của nhóm $[90; 120)$ là $105$ phút.]),
        False([Thời gian học trực tuyến trung bình của mẫu số liệu trên bằng $110$ phút.]),
        True([Nhóm chứa trung vị của mẫu số liệu ghép nhóm là nhóm $[90; 120)$.]),
        True([Trung vị $M_e$ của mẫu số liệu ghép nhóm trên bằng $98.33$ phút (làm tròn đến hàng phần trăm).])
    ),
    loigiai: [
        - *a)* Đúng. Giá trị đại diện của nhóm $[90; 120)$ là $(90 + 120)/2 = 105$ phút.
        - *b)* Sai. Các giá trị đại diện là $45, 75, 105, 135, 165$. Thời gian trung bình:
          $ overline(x) = (6 dot 45 + 14 dot 75 + 18 dot 105 + 8 dot 135 + 4 dot 165)/(50) = (270 + 1050 + 1890 + 1080 + 660)/(50) = (4950)/(50) = 99" phút" != 110" phút" $.
        - *c)* Đúng. $n/2 = 25$. Tần số tích lũy: nhóm 1 là 6, nhóm 2 là 20, nhóm 3 là $38 >= 25 ==>$ nhóm chứa $M_e$ là $[90; 120)$.
        - *d)* Đúng. Trung vị: $M_e = 90 + ((25 - 20)/(18)) dot 30 = 90 + (25)/(3) approx 98.33$ phút.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Khảo sát thu nhập hằng tháng (đơn vị: triệu đồng) của 40 công nhân tại một xưởng sản xuất thu được mẫu số liệu ghép nhóm như sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Thu nhập (triệu đồng)], $[6; 8)$, $[8; 10)$, $[10; 12)$, $[12; 14)$, $[14; 16)$,
        [Số công nhân], [4], [12], [14], [7], [3]
      )
    ]
    Các phát biểu sau đúng hay sai?],
    (
        True([Nhóm chứa mốt của mẫu số liệu ghép nhóm là nhóm $[10; 12)$.]),
        False([Mốt $M_o$ của mẫu số liệu ghép nhóm bằng $10.8$ triệu đồng.]),
        True([Nhóm chứa tứ phân vị thứ nhất $Q_1$ là nhóm $[8; 10)$.]),
        True([Tứ phân vị thứ nhất $Q_1$ của mẫu số liệu ghép nhóm bằng $9$ triệu đồng.])
    ),
    loigiai: [
        - *a)* Đúng. Tần số lớn nhất là 14 thuộc nhóm $[10; 12) ==>$ Nhóm chứa mốt là $[10; 12)$.
        - *b)* Sai. Mốt $M_o = 10 + ((14 - 12)/((14 - 12) + (14 - 7))) dot 2 = 10 + (2)/(9) dot 2 = 10 + 0.44 = 10.44$ triệu đồng (chứ không phải 10.8).
        - *c)* Đúng. $n/4 = 10$. Tần số tích lũy: nhóm 1 có 4, nhóm 2 có $4+12=16 >= 10 ==>$ Nhóm chứa $Q_1$ là $[8; 10)$.
        - *d)* Đúng. $Q_1 = 8 + ((10 - 4)/(12)) dot 2 = 8 + 1 = 9$ triệu đồng.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Một công ty lâm nghiệp đo chiều cao (đơn vị: mét) của 100 cây bạch đàn trồng được 3 năm và thu được bảng tần số ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Chiều cao (m)], $[6; 8)$, $[8; 10)$, $[10; 12)$, $[12; 14)$, $[14; 16)$,
        [Số cây], [10], [25], [35], [20], [10]
      )
    ]
    Các phát biểu sau đúng hay sai?],
    (
        True([Tỉ lệ số cây có chiều cao từ $10$ m đến dưới $12$ m chiếm $35%$ tổng số cây.]),
        True([Chiều cao trung bình của mẫu số liệu ghép nhóm bằng $10.9$ mét.]),
        False([Tứ phân vị thứ ba $Q_3$ nằm ở nhóm $[14; 16)$.]),
        True([Tứ phân vị thứ ba $Q_3$ của mẫu số liệu ghép nhóm bằng $12.5$ mét.])
    ),
    loigiai: [
        - *a)* Đúng. Số cây nhóm $[10; 12)$ là 35 cây trên tổng số 100 cây $==> 35%$.
        - *b)* Đúng. Giá trị đại diện $7, 9, 11, 13, 15$. Chiều cao trung bình:
          $ overline(x) = (10 dot 7 + 25 dot 9 + 35 dot 11 + 20 dot 13 + 10 dot 15)/(100) = (70 + 225 + 385 + 260 + 150)/(100) = (1090)/(100) = 10.9" m" $.
        - *c)* Sai. $3n/4 = 75$. Tần số tích lũy: $10, 35, 70 < 75, 90 >= 75 ==>$ nhóm chứa $Q_3$ phải là nhóm $[12; 14)$.
        - *d)* Đúng. $Q_3 = 12 + ((75 - 70)/(20)) dot 2 = 12 + 0.5 = 12.5" m"$.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Thời gian (đơn vị: giây) hoàn thành cự ly chạy 800m của 30 vận động viên điền kinh được ghi lại ở bảng tần số ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        [Thời gian (giây)], $[120; 130)$, $[130; 140)$, $[140; 150)$, $[150; 160)$,
        [Số vận động viên], [5], [11], [10], [4]
      )
    ]
    Các phát biểu sau đúng hay sai?],
    (
        True([Có 16 vận động viên hoàn thành cự ly chạy dưới 140 giây.]),
        True([Nhóm chứa trung vị $M_e$ và nhóm chứa mốt $M_o$ trùng nhau và là nhóm $[130; 140)$.]),
        False([Trung vị $M_e$ của mẫu số liệu ghép nhóm trên bằng $138.5$ giây.]),
        True([Mốt $M_o$ của mẫu số liệu ghép nhóm trên bằng $138.57$ giây (làm tròn đến hàng phần trăm).])
    ),
    loigiai: [
        - *a)* Đúng. Số VĐV có thời gian dưới 140 giây là $5 + 11 = 16$ VĐV.
        - *b)* Đúng. $n/2 = 15$. Tần số tích lũy: nhóm 1 có 5, nhóm 2 có $16 >= 15 ==>$ nhóm trung vị là $[130; 140)$. Tần số max là 11 $==>$ nhóm mốt cũng là $[130; 140)$.
        - *c)* Sai. Trung vị $M_e = 130 + ((15 - 5)/(11)) dot 10 = 130 + (100)/(11) approx 139.09$ giây (chứ không phải 138.5).
        - *d)* Đúng. Mốt $M_o = 130 + ((11 - 5)/((11 - 5) + (11 - 10))) dot 10 = 130 + (6)/(7) dot 10 approx 138.57$ giây.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6. Điền kết quả là một số nguyên hoặc số thập phân.], count: 6)

// TLN 1
#lt-tln(num: 17, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Khảo sát khối lượng (đơn vị: gram) của 50 quả cà chua thu hoạch trong vườn thu được mẫu số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Khối lượng (g)], $[70; 80)$, $[80; 90)$, $[90; 100)$, $[100; 110)$, $[110; 120)$,
        [Số quả cà chua], [6], [12], [18], [10], [4]
      )
    ]
    Tính khối lượng trung bình của 50 quả cà chua này (tính bằng gram).],
    [93.8],
    loigiai: [
        - Giá trị đại diện cho các nhóm là: $75, 85, 95, 105, 115$.
        - Khối lượng trung bình là:
          $ overline(x) = (6 dot 75 + 12 dot 85 + 18 dot 95 + 10 dot 105 + 4 dot 115)/(50) = (450 + 1020 + 1710 + 1050 + 460)/(50) = (4690)/(50) = 93.8" g" $.
        Đáp số: $93.8$.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Khảo sát tuổi thọ (đơn vị: tháng) của 40 thiết bị điện tử hoạt động liên tục thu được mẫu số liệu ghép nhóm như sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Tuổi thọ (tháng)], $[10; 20)$, $[20; 30)$, $[30; 40)$, $[40; 50)$, $[50; 60)$,
        [Số thiết bị], [4], [8], [16], [8], [4]
      )
    ]
    Tính trung vị $M_e$ của mẫu số liệu ghép nhóm trên (tính bằng tháng).],
    [35],
    loigiai: [
        - Cỡ mẫu $n = 40 ==> (n)/(2) = 20$.
        - Tần số tích lũy các nhóm lượt là $4, 12, 28, 36, 40$. Nhóm chứa trung vị là nhóm $[30; 40)$.
        - Trung vị là:
          $ M_e = 30 + ( (20 - 12)/(16) ) dot 10 = 30 + (8)/(16) dot 10 = 30 + 5 = 35" tháng" $.
        Đáp số: $35$.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Khảo sát mức tiền thưởng (đơn vị: triệu đồng) cuối năm của 50 nhân viên trong một công ty thu được bảng số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Mức thưởng (triệu)], $[2; 4)$, $[4; 6)$, $[6; 8)$, $[8; 10)$, $[10; 12)$,
        [Số nhân viên], [5], [15], [20], [7], [3]
      )
    ]
    Tính mốt $M_o$ của mẫu số liệu ghép nhóm trên (tính bằng triệu đồng, làm tròn kết quả đến hai chữ số thập phân).],
    [6.56],
    loigiai: [
        - Nhóm chứa mốt là nhóm có tần số lớn nhất ($20 ==>$ nhóm $[6; 8)$).
        - Khi đó $a_j = 6, h = 2, n_j = 20, n_(j-1) = 15, n_(j+1) = 7$.
        - Mốt của mẫu số liệu ghép nhóm là:
          $ M_o = 6 + (20 - 15)/((20 - 15) + (20 - 7)) dot 2 = 6 + (5)/(18) dot 2 = 6 + (5)/(9) approx 6.56" triệu đồng" $.
        Đáp số: $6.56$.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Khảo sát thời gian chờ xe buýt (đơn vị: phút) của 60 hành khách tại một trạm xe buýt thu được bảng tần số ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Thời gian chờ (phút)], $[0; 5)$, $[5; 10)$, $[10; 15)$, $[15; 20)$, $[20; 25)$,
        [Số hành khách], [8], [20], [18], [10], [4]
      )
    ]
    Tính tứ phân vị thứ nhất $Q_1$ của mẫu số liệu ghép nhóm này (tính bằng phút, làm tròn đến hai chữ số thập phân).],
    [6.75],
    loigiai: [
        - Cỡ mẫu $n = 60 ==> (n)/(4) = 15$.
        - Tần số tích lũy nhóm 1 là 8, nhóm 2 là $28 >= 15 ==>$ Nhóm chứa $Q_1$ là nhóm $[5; 10)$.
        - Áp dụng công thức tính $Q_1$:
          $ Q_1 = 5 + ( (15 - 8)/(20) ) dot 5 = 5 + (7)/(20) dot 5 = 5 + 1.75 = 6.75" phút" $.
        Đáp số: $6.75$.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Khảo sát doanh thu hằng ngày (đơn vị: triệu đồng) của 80 cửa hàng bán lẻ trong một hệ thống thu được bảng số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Doanh thu (triệu)], $[10; 20)$, $[20; 30)$, $[30; 40)$, $[40; 50)$, $[50; 60)$,
        [Số cửa hàng], [10], [20], [25], [17], [8]
      )
    ]
    Tính tứ phân vị thứ ba $Q_3$ của mẫu số liệu ghép nhóm trên (tính bằng triệu đồng, làm tròn đến hai chữ số thập phân).],
    [42.94],
    loigiai: [
        - Cỡ mẫu $n = 80 ==> (3n)/(4) = 60$.
        - Tần số tích lũy các nhóm lượt là $10, 30, 55, 72, 80$. Nhóm đầu tiên có tần số tích lũy không nhỏ hơn $60$ là nhóm thứ 4: $[40; 50)$.
        - Áp dụng công thức tính $Q_3$:
          $ Q_3 = 40 + ( (60 - 55)/(17) ) dot 10 = 40 + (50)/(17) approx 42.94" triệu đồng" $.
        Đáp số: $42.94$.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho bảng mẫu số liệu ghép nhóm về thời gian hoàn thành một sản phẩm (đơn vị: phút) của 40 công nhân thuộc Tổ sản xuất B:
    #align(center)[
      #table(
        columns: (2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        [Thời gian (phút)], $[10; 20)$, $[20; 30)$, $[30; 40)$, $[40; 50)$,
        [Số công nhân Tổ B], [8], [20], [8], [4]
      )
    ]
    Biết rằng trung vị thời gian hoàn thành sản phẩm của Tổ sản xuất A là $M_("eA") = 24.5$ phút. Trung vị thời gian hoàn thành sản phẩm của Tổ B lớn hơn trung vị thời gian của Tổ A bao nhiêu phút?],
    [1.5],
    loigiai: [
        - Cỡ mẫu Tổ B là $n = 40 ==> (n)/(2) = 20$.
        - Tần số tích lũy Tổ B: nhóm 1 có 8, nhóm 2 có $8 + 20 = 28 >= 20 ==>$ Nhóm chứa trung vị của Tổ B là $[20; 30)$.
        - Trung vị của Tổ B là:
          $ M_("eB") = 20 + ( (20 - 8)/(20) ) dot 10 = 20 + 6 = 26" phút" $.
        - Độ chênh lệch trung vị giữa Tổ B và Tổ A là:
          $ Delta M_e = M_("eB") - M_("eA") = 26 - 24.5 = 1.5" phút" $.
        Đáp số: $1.5$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHƯƠNG III. CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM CỦA MẪU SỐ LIỆU GHÉP NHÓM (ĐỀ SỐ 01)!]      #v(0.6em)
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
