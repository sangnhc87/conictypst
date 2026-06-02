#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../../bbt.typ": *

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG CHUNG
// ═══════════════════════════════════════════════

#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

// Định dạng đề mục (Heading) màu Navy & Emerald sang trọng
#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0D1B6E"), rgb("006064"), rgb("2E7D32"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("006064")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("006064"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("1565C0"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

#let mode = "loigiai"
#let accent = rgb("0D1B6E")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Bảng màu chuyên đề ─────────────────────────────────────────────
#let col-navy = rgb("0D1B6E")
#let col-teal = rgb("006064")
#let col-emerald = rgb("2E7D32")
#let col-amber = rgb("E65100")
#let col-red = rgb("C62828")
#let col-blue = rgb("1565C0")

// ─── Các hộp thành phần sư phạm ─────────────────────────────
#let rev-box(title: none, body) = block(
  fill: rgb("E0F2F1"), // Soft teal background
  stroke: (left: 4pt + col-teal, rest: 0.8pt + rgb("B2DFDB")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-teal, size: 11pt, weight: "bold")[#title]
    #v(0.4em)
  ]
  #body
]

#let eg-box(title: "🎯 Ví Dụ Trực Quan", body) = block(
  fill: rgb("E8F5E9"), // Soft green background
  stroke: (left: 4pt + col-emerald, rest: 0.6pt + rgb("C8E6C9")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-emerald, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let note-box(title: "📌 Nhận Xét", body) = block(
  fill: rgb("FFF8E1"), // Soft amber background
  stroke: (left: 4pt + col-amber, rest: 0.6pt + rgb("FFE082")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-amber, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let ans-box(body) = block(
  fill: rgb("F1F8E9"), // Light green background for final answer
  stroke: (left: 4pt + col-emerald, rest: 0.6pt + rgb("DCEDC8")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-emerald, weight: "bold")[✅ Kết Luận]
  #v(0.3em)
  #body
]

#let warn-box(body) = block(
  fill: rgb("FFEBEE"), // Light red background for warning
  stroke: (left: 4pt + col-red, rest: 0.6pt + rgb("FFCDD2")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-red, weight: "bold")[⚠️ Chú Ý — Bẫy Thường Gặp]
  #v(0.3em)
  #body
]

#let fig-panel(body) = block(
  fill: rgb("FAFAFA"),
  stroke: 0.8pt + rgb("E0E0E0"),
  radius: 8pt,
  inset: (x: 6pt, y: 6pt),
)[#body]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0A192F"), rgb("0D1B6E"), rgb("006064"), rgb("2E7D32"), angle: 135deg),
    inset: (x: 2cm, y: 1.8cm),
    radius: 14pt,
  )[
    #text(fill: rgb("B2DFDB"), size: 12pt, weight: "bold", tracking: 2pt)[
      TÀI LIỆU CHUYÊN SÂU & BDHSG
    ]
    #v(0.6em)
    #text(fill: white, size: 23pt, weight: "black")[Tối Ưu Hóa & Mô Hình Hóa Kinh Tế Đa Điều Kiện]
    #v(0.4em)
    #text(fill: rgb("E0F2F1"), size: 14pt)[🎯 Hàm Phân Đoạn · Cực Trị Biên · Thuế Lũy Tiến]
    #v(0.5em)
    #text(fill: rgb("B2DFDB"), size: 11pt, style: "italic")[
      "Toán Học Ứng Dụng Thực Tế" — Kiến Tạo Mô Hình Đại Số Cho Các Quyết Định Kinh Doanh
    ]
    #v(1.2em)
    #line(length: 70%, stroke: 1.5pt + rgb("B2DFDB"))
    #v(0.8em)
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      align: center,
      gutter: 0.5em,
      [
        #block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
          #text(fill: rgb("E0F2F1"), size: 9pt)[*Cấp độ* ĐGNL · HSG]
        ]
      ],
      [
        #block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
          #text(fill: rgb("E0F2F1"), size: 9pt)[*Dạng bài* Tự Luận & TLN]
        ]
      ],
      [
        #block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
          #text(fill: rgb("E0F2F1"), size: 9pt)[*Đồ thị* CetZ Mô Phỏng]
        ]
      ],
      [
        #block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
          #text(fill: rgb("E0F2F1"), size: 9pt)[*Biên soạn* GV Nguyễn Văn Sang]
        ]
      ],
    )
  ]
]

#v(1.5em)

// ═══════════════════════════════════════════════
// MỤC LỤC THU GỌN
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 95%,
    fill: rgb("E0F2F1").lighten(60%),
    stroke: 1pt + rgb("B2DFDB"),
    radius: 8pt,
    inset: (x: 16pt, y: 12pt),
  )[
    #text(fill: col-teal, size: 11pt, weight: "bold")[📚 Nội Dung Chuyên Đề]
    #v(0.5em)
    #grid(
      columns: (1fr, 1fr),
      gutter: 0.65em,
      align: left,
      [🗺️ *Phần I* — Bản đồ 5 nhóm dạng dễ thi], [🧭 *Quy trình* — 6 bước dựng hàm không lang mang],
      [📊 *Nhóm 1* — Doanh thu phân đoạn và miền không lỗ], [🚖 *Nhóm 2* — Giải phương trình trên hàm giá cước],
      [🏢 *Nhóm 3* — Tối ưu rời rạc với chi phí bậc thang], [⛏️ *Nhóm 4* — Cực đại dưới thuế lũy tiến],
      [☀️ *Nhóm 5* — Cực trị biên với ràng buộc kỹ thuật], [📝 *Phụ lục* — 3 mẫu BBT nên thuộc],
    )
  ]
]

#pagebreak()



// ═══════════════════════════════════════════════
// PHẦN I: LÝ THUYẾT NỀN TẢNG
// ═══════════════════════════════════════════════
= Phần I — Bản Đồ Dạng Toán & Quy Trình Lập Hàm

== 1.1 — Vì Sao Bài Toán Kinh Tế Thường Phải Chia Miền?
Ở các bài toán kinh tế kiểu tuyển sinh lớp $12$, khó nhất thường không nằm ở đạo hàm mà nằm ở chỗ *đọc đúng quy tắc của đề* rồi đổi nó thành công thức. Đề rất hay cài những mốc như:

- qua một ngưỡng thì đơn giá đổi,
- vượt mốc thì thuế suất đổi,
- dưới một quy mô nào đó thì chi phí quản lý nhảy bậc,
- hoặc biến bị chặn bởi điều kiện kỹ thuật, điều kiện nguyên.

Khi xuất hiện một trong các dấu hiệu đó, ta gần như chắc chắn phải làm việc với *hàm phân đoạn* hoặc phải xét riêng từng miền.

#rev-box(title: "🔍 Bốn dấu hiệu buộc phải chia miền")[
  - Có các cụm từ như: *20 khách đầu tiên*, *từ km thứ 11 trở đi*, *nếu vượt quá 600 triệu*, *nếu số căn thuê dưới 40*.

  - Có phụ phí hoặc giảm giá chỉ kích hoạt *sau một ngưỡng*.

  - Có chi phí, thuế, đơn giá không giữ nguyên trên toàn miền.

  - Biến bài toán có ràng buộc đặc biệt: số nguyên, không âm, không vượt quá công suất, không vượt quá số phòng.
]

== 1.2 — Bản Đồ 5 Nhóm Dạng Rất Dễ Gặp

#align(center)[
  #table(
    columns: (0.8fr, 1.55fr, 1.6fr, 1.85fr),
    stroke: 0.45pt + rgb("B0BEC5"),
    inset: (x: 8pt, y: 7pt),
    fill: (x, y) => if y == 0 { rgb("E0F2F1") } else if calc.odd(y) { rgb("FAFAFA") } else { white },
    align: (center, left, left, left),
    table.header([*Nhóm*], [*Dấu hiệu đề bài*], [*Hàm cần dựng*], [*Thao tác quyết định*]),
    [1],
    [Giảm giá toàn đoàn, giá đổi theo số lượng, hỏi không lỗ],
    [Doanh thu hoặc lợi nhuận phân đoạn],
    [Giải bất phương trình trên từng đoạn rồi giao với điều kiện thực tế.],

    [2],
    [Biểu phí taxi, điện, nước, cước vận tải, hỏi ngược lại đầu vào],
    [Hàm giá cước phân đoạn],
    [Giải phương trình $T(x) = m$ trên từng đoạn có khả năng.],

    [3],
    [Biến là số nguyên, chi phí bậc thang, hỏi tối đa lợi nhuận],
    [Lợi nhuận phân đoạn theo biến nguyên],
    [Xét hàm liên tục hỗ trợ, rồi quay lại so sánh vài giá trị nguyên ứng viên.],

    [4],
    [Thuế lũy tiến, quota, trợ giá theo ngưỡng],
    [Lợi nhuận ròng sau thuế dạng phân đoạn],
    [Lấy đạo hàm từng đoạn, kiểm tra điểm gãy, so sánh các giá trị đặc biệt.],

    [5],
    [Pin, kho bãi, công suất, ngân sách, giới hạn kỹ thuật],
    [Hàm mục tiêu trên đoạn đóng],
    [Đạo hàm và BBT, nhưng không quên xét luôn hai biên của miền.],
  )
]

== 1.3 — Quy Trình 6 Bước Dựng Hàm Không Lang Mang

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  [
    *Bước 1. Chọn biến thật đúng*  \
    Biến nên là đại lượng đề hỏi hoặc đại lượng điều khiển quyết định kinh doanh.

    *Bước 2. Chốt miền xác định*  \
    Xác định biến là liên tục hay nguyên, có bị chặn trên, chặn dưới hay không.

    *Bước 3. Tìm các mốc làm đổi công thức*  \
    Đây là bước tạo ra các phân đoạn.
  ],
  [
    *Bước 4. Dựng từng hàm thành phần*  \
    Thường đi theo thứ tự: giá bán → doanh thu → chi phí → lợi nhuận ròng.

    *Bước 5. Giải trên từng đoạn*  \
    Có thể là phương trình, bất phương trình, đạo hàm hoặc xét đơn điệu.

    *Bước 6. Kết luận bằng ngôn ngữ bài toán*  \
    Trả lời đúng đơn vị: người, km, lần tăng giá, tấn quặng, kWh.
  ],
)

== 1.4 — Khi Nào Dùng Đạo Hàm, Khi Nào Chỉ Cần Xét Miền?

#rev-box(title: "📌 Cách chọn công cụ đúng")[
  - Nếu bài hỏi *lớn nhất / nhỏ nhất* của một hàm trên một khoảng: thường dùng đạo hàm và bảng biến thiên.

  - Nếu bài hỏi *không lỗ*, *hòa vốn*, *biết số tiền thì tìm quãng đường*: thường giải phương trình hoặc bất phương trình trên từng đoạn, chưa cần đạo hàm.

  - Nếu biến là *số nguyên* thì đạo hàm chỉ giúp tìm vùng nghi ngờ tối ưu; đáp án cuối cùng vẫn phải quay về so sánh các giá trị nguyên gần điểm cực trị và các điểm biên.

  - Nếu bài có *điểm gãy* do thuế hay phụ phí, phải coi điểm gãy là một ứng viên đặc biệt, không được bỏ qua chỉ vì đạo hàm không tồn tại ở đó.
]

== 1.5 — Ba Mô Hình Hàm Xuất Hiện Nhiều Nhất

#align(center)[
  #table(
    columns: (1.2fr, 1.75fr, 1.85fr),
    stroke: 0.45pt + rgb("B0BEC5"),
    inset: (x: 8pt, y: 7pt),
    fill: (x, y) => if y == 0 { rgb("E8F5E9") } else if calc.odd(y) { rgb("FBFBFB") } else { white },
    align: (left, left, left),
    table.header([*Loại hàm*], [*Mẫu thường gặp*], [*Điều phải nhớ*]),
    [Hàm doanh thu], [$R(x) = x dot P(x)$], [Nếu $P(x)$ đổi theo ngưỡng thì $R(x)$ cũng phải đổi theo ngưỡng.],
    [Hàm lợi nhuận], [$L(x) = R(x) - C(x)$], [Nếu chi phí bậc thang hoặc thuế đổi, lợi nhuận phải viết theo từng đoạn.],
    [Lợi nhuận ròng sau thuế],
    [$L(x) = R(x) - C(x) - T(x)$],
    [Phần thuế vượt ngưỡng rất hay tạo ra điểm gãy trong đạo hàm.],
  )
]

== 1.6 — Năm Lỗi Học Sinh Rất Hay Mắc

#warn-box[
  1. Đặt biến đúng, nhưng quên ghi miền xác định nên kết luận ra giá trị vô nghĩa.

  2. Viết được doanh thu, nhưng lại quên trừ chi phí hoặc quên trừ thuế khi đề hỏi *lợi nhuận ròng*.

  3. Chỉ giải một đoạn rồi kết luận luôn, bỏ sót các đoạn còn lại.

  4. Tìm được điểm cực trị của hàm liên tục rồi quên rằng biến thực chất là số nguyên.

  5. Chỉ nhìn nghiệm $f'(x) = 0$ mà quên so sánh thêm giá trị tại điểm gãy và hai đầu mút của miền.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN II: TUYỂN CHỌN BÀI TOÁN KINH TẾ
// ═══════════════════════════════════════════════
= Phần II — 5 Nhóm Dạng Trọng Điểm Kiểu Tuyển Sinh 12

== Nhóm 1 — Tour Du Lịch: Miền Không Lỗ Với Chính Sách Giảm Giá Toàn Đoàn
#tln(
  id: "CD-KT-01",
  [Một công ty du lịch thông báo giá tiền cho chuyến đi tham quan của một nhóm khách du lịch như sau: $20$ khách đầu tiên có giá là $30$ USD/người; nếu có nhiều hơn $20$ người đăng kí thì cứ có thêm $1$ người, giá vé sẽ giảm $1$ USD/người cho toàn bộ hành khách. Hỏi công ty nên giới hạn số lượng hành khách tối đa là bao nhiêu để công ty không bị lỗ? Biết rằng chi phí tổ chức của chuyến đi cố định là $400$ USD.],
  [$40$],
  fig: fig-panel(cetz.canvas(length: 0.16cm, {
    import cetz.draw: *

    // Hệ trục tọa độ doanh thu R(x) theo số khách x (Kích thước to rõ hơn)
    let scx = 0.5
    let scy = 0.015

    // Vẽ lưới tọa độ mờ
    grid(
      (0, 0),
      (50 * scx, 700 * scy),
      stroke: 0.4pt + gray.lighten(60%),
      step: 2.5,
    )

    // Vẽ miền doanh thu R(x)
    // Phân đoạn 1: x in [0, 20], R(x) = 30x
    line((0, 0), (20 * scx, 600 * scy), stroke: 1.8pt + col-blue, label: "y=30x")

    // Phân đoạn 2: x in [20, 50], R(x) = 50x - x^2. Đỉnh tại x=25, R(25)=625
    let pts = ()
    for i in range(20, 51) {
      let r = 50 * i - i * i
      pts.push((i * scx, r * scy))
    }
    line(..pts, stroke: 1.8pt + col-blue)

    // Đường chi phí C = 400
    line((0, 400 * scy), (50 * scx, 400 * scy), stroke: (paint: col-red, dash: "dashed", thickness: 1.2pt))
    content((44 * scx, 440 * scy), text(size: 8pt, fill: col-red, weight: "bold")[$C = 400$])

    // Trục tọa độ
    line((-1, 0), (53 * scx, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -2 * scy), (0, 720 * scy), mark: (end: "stealth"), stroke: 0.8pt)

    content((52 * scx, -3.5), text(weight: "bold")[$x$])
    content((-3.5, 700 * scy), text(weight: "bold")[$R$])

    // Các mốc quan trọng
    circle((20 * scx, 600 * scy), radius: 2pt, fill: col-navy)
    content((20 * scx, 635 * scy), text(size: 7.5pt)[$(20; 600)$])

    // Giao điểm phân đoạn 1 với C=400: x = 13.33
    circle((13.33 * scx, 400 * scy), radius: 1.8pt, fill: black)
    line((13.33 * scx, 0), (13.33 * scx, 400 * scy), stroke: (paint: gray, dash: "dotted", thickness: 0.7pt))
    content((13.33 * scx, -5 * scy), text(size: 7pt)[$13.3$])

    // Giao điểm phân đoạn 2 với C=400: x = 40
    circle((40 * scx, 400 * scy), radius: 2.2pt, fill: col-emerald)
    line((40 * scx, 0), (40 * scx, 400 * scy), stroke: (paint: gray, dash: "dotted", thickness: 0.7pt))
    content((40 * scx, -6 * scy), text(size: 8.5pt, fill: col-emerald, weight: "bold")[*40*])

    // Điểm cực đại doanh thu x = 25
    circle((25 * scx, 625 * scy), radius: 1.8pt, fill: black)
    line((25 * scx, 0), (25 * scx, 625 * scy), stroke: (paint: gray, dash: "dotted", thickness: 0.7pt))
    content((25 * scx, -5 * scy), text(size: 7pt)[$25$])
  })),
  fig-pos: "right",
  fig-width: 42%,
  loigiai: [
    #reset-step()
    #step[
      *Nhận diện dạng toán.*

      Đây là dạng *doanh thu phân đoạn + điều kiện không lỗ*. Câu hỏi không yêu cầu tìm lợi nhuận lớn nhất, mà yêu cầu tìm *số khách tối đa* sao cho doanh thu vẫn không thấp hơn chi phí tổ chức $400$ USD.

      Hạt nhân của bài là:
      - tìm đúng công thức doanh thu trước mốc $20$ khách và sau mốc $20$ khách,
      - rồi giải bất phương trình $R(x) >= 400$ trên từng đoạn.
    ]
    #step[
      *Đặt biến và chốt miền xác định.*

      Gọi $x$ là số hành khách đăng ký.

      Khi đó:
      - $x$ là số nguyên dương, nên $x in NN^*$.
      - Với $x <= 20$, đơn giá giữ nguyên là $30$ USD/người.
      - Với $x > 20$, cứ thêm $1$ người thì giá giảm $1$ USD cho *toàn bộ đoàn*.

      Vì thế khi $x > 20$, đơn giá mới là:
      $
        30 - (x - 20) = 50 - x.
      $

      Đơn giá không thể âm, nên ta chỉ xét đến $x <= 50$.
    ]
    #step[
      *Dựng hàm doanh thu phân đoạn.*

      Doanh thu bằng số khách nhân với đơn giá áp dụng cho toàn đoàn, nên:
      $
        R(x) = cases(
          30x & "nếu" 1 <= x <= 20,
          x(50 - x) = 50x - x^2 & "nếu" 20 < x <= 50
        )
      $

      #note-box(title: "Điểm phải hiểu thật rõ")[
        Với $x > 20$, giá không phải chỉ giảm cho người thứ $21, 22, ...$, mà giảm cho *tất cả* hành khách. Vì vậy doanh thu ở đoạn sau mới có dạng $x(50 - x)$.
      ]
    ]
    #step[
      *Giải điều kiện không lỗ trên từng đoạn.*

      Ta cần:
      $
        R(x) >= 400.
      $

      - *Đoạn 1: $1 <= x <= 20$*
        $
          30x >= 400
          quad arrow.double quad
          x >= 13.33.
        $
        Vì $x$ nguyên nên trên đoạn này ta nhận được:
        $
          14 <= x <= 20.
        $

      - *Đoạn 2: $20 < x <= 50$*
        $
          50x - x^2 >= 400
          quad arrow.double quad
          x^2 - 50x + 400 <= 0.
        $
        Phương trình biên có nghiệm:
        $
          x_1 = 10, quad x_2 = 40.
        $
        Vậy bất phương trình đúng khi:
        $
          10 <= x <= 40.
        $
        Kết hợp với điều kiện của đoạn $20 < x <= 50$, ta được:
        $
          20 < x <= 40.
        $

      Gộp cả hai đoạn lại:
      $
        14 <= x <= 40.
      $

      Số khách tối đa để công ty không lỗ là $40$.

      #ans-box[Giới hạn số lượng hành khách tối đa là *40* người.]
    ]
  ],
)

#v(1em)

#pagebreak()

== Nhóm 2 — Taxi Công Nghệ: Giải Phương Trình Trên Hàm Giá Cước Phân Đoạn
#tln(
  id: "CD-KT-02",
  [Một ứng dụng gọi xe công nghệ áp dụng biểu phí chuyến đi dài (tính theo km) như sau:
    - $2$ km đầu tiên giá trọn gói là $30$ nghìn đồng.
    - Từ km thứ $3$ đến km thứ $10$, giá cước tăng thêm $15$ nghìn đồng/km.
    - Từ km thứ $11$ trở đi, giá cước tăng thêm $12$ nghìn đồng/km.
    - Đặc biệt, với chuyến đi trên $15$ km, hành khách phải chịu thêm phụ phí cao tốc là $20$ nghìn đồng, nhưng được giảm $10\%$ trên tổng cước cơ bản (không gồm phụ phí).

    Hãy xác định quãng đường di chuyển $x$ (km) biết số tiền cước thực tế hành khách phải trả là $209$ nghìn đồng. (Kết quả làm tròn đến chữ số thập phân thứ hai).],
  [$14.92$],
  fig: fig-panel(cetz.canvas(length: 0.22cm, {
    import cetz.draw: *

    // Trục x từ 0 đến 20 (scale lớn rõ nét hơn)
    let scx = 0.8
    let scy = 0.04

    // Vẽ lưới tọa độ mờ nền
    grid(
      (0, 0),
      (20 * scx, 260 * scy),
      stroke: 0.35pt + gray.lighten(70%),
      step: 1.5,
    )

    // T(x) biểu diễn số tiền cước
    // Phân đoạn 1: [0, 2], y = 30
    line((0, 30 * scy), (2 * scx, 30 * scy), stroke: 1.8pt + col-blue, label: "y=30")

    // Phân đoạn 2: (2, 10], y = 15x
    line((2 * scx, 30 * scy), (10 * scx, 150 * scy), stroke: 1.8pt + col-blue)

    // Phân đoạn 3: (10, 15], y = 12x + 30
    line((10 * scx, 150 * scy), (15 * scx, 210 * scy), stroke: 1.8pt + col-blue)

    // Phân đoạn 4: x > 15, y = 10.8x + 47
    line((15 * scx, 209 * scy), (20 * scx, 263 * scy), stroke: 1.8pt + col-emerald)

    // Đường ngang y = 209 chỉ mốc tiền cước
    line((0, 209 * scy), (18 * scx, 209 * scy), stroke: (paint: col-red, dash: "dashed", thickness: 0.9pt))
    content((3.5 * scx, 222 * scy), text(size: 8pt, fill: col-red, weight: "bold")[$T = 209$])

    // Trục tọa độ
    line((-0.5, 0), (21 * scx, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -8 * scy), (0, 275 * scy), mark: (end: "stealth"), stroke: 0.8pt)

    content((20.5 * scx, -8 * scy), text(weight: "bold")[$x$])
    content((-2.5 * scx, 268 * scy), text(weight: "bold")[$T$])

    // Giao điểm phân đoạn 3 với mốc cước: x = 14.92
    circle((14.917 * scx, 209 * scy), radius: 1.8pt, fill: col-navy)
    line((14.917 * scx, 0), (14.917 * scx, 209 * scy), stroke: (paint: gray, dash: "dotted", thickness: 0.6pt))
    content((14.917 * scx, -8 * scy), text(size: 7.5pt)[$14.92$])

    // Vị trí gián đoạn nhảy vọt x = 15
    circle((15 * scx, 210 * scy), radius: 2pt, fill: white, stroke: 1.2pt + col-blue)
    circle((15 * scx, 209 * scy), radius: 1.8pt, fill: col-emerald)

    // Nhãn mốc tiền cước trục tung
    content((-1.8 * scx, 209 * scy), text(size: 7.5pt)[$209$])
    content((-1.8 * scx, 150 * scy), text(size: 7.5pt)[$150$])
    content((-1.8 * scx, 30 * scy), text(size: 7.5pt)[$30$])
  })),
  fig-pos: "right",
  fig-width: 44%,
  loigiai: [
    #reset-step()
    #step[
      *Nhận diện dạng toán.*

      Đây không phải bài cực trị. Đây là dạng *biết số tiền phải trả, tìm lại quãng đường* trên một biểu phí phân đoạn.

      Muốn làm gọn và chắc, ta làm đúng hai việc:
      - dựng hàm cước $T(x)$ theo từng khoảng,
      - giải phương trình $T(x) = 209$ trên những khoảng có khả năng xảy ra.
    ]
    #step[
      *Đặt biến và chia các khoảng giá cước.*

      Gọi $x$ là quãng đường di chuyển của khách, tính bằng km, với $x > 0$.

      Do giá cước đổi quy tắc tại các mốc $2$ km, $10$ km và $15$ km, ta buộc phải chia thành bốn khoảng:
      $
        (0, 2], quad (2, 10], quad (10, 15], quad (15, +oo).
      $
    ]
    #step[
      *Dựng hàm cước theo từng đoạn.*

      Từ đề bài, ta có:
      $
        T(x) = cases(
          30 & "nếu" 0 < x <= 2,
          30 + 15(x - 2) = 15x & "nếu" 2 < x <= 10,
          150 + 12(x - 10) = 12x + 30 & "nếu" 10 < x <= 15,
          0.9(12x + 30) + 20 = 10.8x + 47 & "nếu" x > 15
        )
      $

      #note-box(title: [Mấu chốt của đoạn $x > 15$])[
        Khi đi quá $15$ km, hành khách vẫn trả *phụ phí* $20$ nghìn đồng, nhưng đồng thời được giảm $10\%$ trên *cước cơ bản*. Vì vậy phải viết đúng là:
        $
          T(x) = 0.9(12x + 30) + 20,
        $
        chứ không được giảm $10\%$ luôn cả phần phụ phí.
      ]
    ]
    #step[
      *Giải phương trình $T(x) = 209$.*

      Ta nhận thấy:
      - Trên $(0, 2]$, cước chỉ là $30$.
      - Trên $(2, 10]$, cước lớn nhất là $150$.

      Vì $209 > 150$, hai đoạn đầu chắc chắn không thể cho đáp án. Ta chỉ cần xét hai đoạn cuối.

      - *Đoạn $10 < x <= 15$*
        $
          12x + 30 = 209
          quad arrow.double quad
          12x = 179
          quad arrow.double quad
          x = 14.9167.
        $
        Giá trị này thuộc $(10, 15]$, nên *nhận*.

      - *Đoạn $x > 15$*
        $
          10.8x + 47 = 209
          quad arrow.double quad
          10.8x = 162
          quad arrow.double quad
          x = 15.
        $
        Nhưng $15$ không thỏa điều kiện $x > 15$, nên *loại*.

      Vậy khách đã đi khoảng $14.92$ km.

      #ans-box[Quãng đường di chuyển là *14,92* km.]
    ]
  ],
)

#v(1em)

#pagebreak()

== Nhóm 3 — Chung Cư Mini: Tối Ưu Rời Rạc Với Chi Phí Vận Hành Bậc Thang
#tln(
  id: "CD-KT-03",
  [Một tòa nhà chung cư mini có $50$ căn hộ cho thuê. Nếu giá thuê mỗi căn hộ là $4$ triệu đồng/tháng thì tất cả các căn hộ đều được thuê hết. Cứ mỗi lần tăng giá thuê thêm $200$ nghìn đồng/căn/tháng thì sẽ có thêm $2$ căn hộ bị bỏ trống. Để duy trì vận hành tòa nhà, ban quản lý phải chịu chi phí bảo trì hằng tháng phụ thuộc vào số căn hộ có người ở:
    - Nếu số căn hộ được thuê từ $40$ căn trở lên: Chi phí vận hành là $400$ nghìn đồng/căn/tháng cho mỗi căn hộ được thuê.
    - Nếu số căn hộ được thuê dưới $40$ căn: Chi phí vận hành tăng lên thành $600$ nghìn đồng/căn/tháng cho mỗi căn hộ được thuê (do số căn trống nhiều dẫn tới chi phí quản lý chia đều trên mỗi hộ tăng lên).

    Hỏi ban quản lý nên quyết định tăng giá thuê bao nhiêu lần để thu được lợi nhuận ròng hằng tháng là lớn nhất? (Số lần tăng giá phải là số nguyên không âm).],
  [$3$ hoặc $4$],
  fig: fig-panel(cetz.canvas(length: 0.55cm, {
    import cetz.draw: *

    // Trục x từ 0 đến 12 (số lần tăng giá)
    // Trục y từ 160 đến 190 (lợi nhuận triệu đồng)
    let scx = 0.8
    let scy = 0.35 // dịch gốc y xuống 160: y_plot = (y - 160) * scy

    // Lưới mờ
    grid(
      (0, 0),
      (12 * scx, 30 * scy),
      stroke: 0.35pt + gray.lighten(70%),
      step: 1.0,
    )

    // Vẽ Parabol 1: L1(x) = -0.4x^2 + 2.8x + 180 trên [0, 5]
    // Đỉnh tại 3.5, giá trị 184.9. Tại x=5, giá trị 184
    let pts1 = ()
    for i in range(0, 51) {
      let x = i * 0.1
      let y = -0.4 * x * x + 2.8 * x + 180
      pts1.push((x * scx, (y - 160) * scy))
    }
    line(..pts1, stroke: 1.8pt + col-blue, label: "L1(x)")

    // Vẽ Parabol 2: L2(x) = -0.4x^2 + 3.2x + 170 trên [6, 11]
    // Đỉnh tại 4 (ở ngoài miền), giá trị tại x=6 là 174.8
    let pts2 = ()
    for i in range(60, 111) {
      let x = i * 0.1
      let y = -0.4 * x * x + 3.2 * x + 170
      pts2.push((x * scx, (y - 160) * scy))
    }
    line(..pts2, stroke: 1.8pt + col-red, label: "L2(x)")

    // Nối nét đứt gián đoạn tại x=5 và x=6
    line((5 * scx, (184 - 160) * scy), (5 * scx, 0), stroke: (paint: gray, dash: "dotted", thickness: 0.6pt))
    line((6 * scx, (174.8 - 160) * scy), (6 * scx, 0), stroke: (paint: gray, dash: "dotted", thickness: 0.6pt))

    // Trục tọa độ
    line((-0.5, 0), (12.5 * scx, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -2 * scy), (0, 32 * scy), mark: (end: "stealth"), stroke: 0.8pt)

    content((12.2 * scx, -0.6), text(weight: "bold")[$x$])
    content((-1.5 * scx, 31 * scy), text(weight: "bold")[$L$])

    // Điểm cực đại
    circle((3 * scx, (184.8 - 160) * scy), radius: 2.2pt, fill: col-emerald)
    circle((4 * scx, (184.8 - 160) * scy), radius: 2.2pt, fill: col-emerald)

    content((3.5 * scx, (184.8 - 160) * scy + 1.8), text(size: 7.5pt, fill: col-emerald, weight: "bold")[Max = 184.8])

    // Nhãn trục tung
    content((-1.2 * scx, (180 - 160) * scy), text(size: 7.5pt)[$180$])
    content((-1.2 * scx, (184.8 - 160) * scy), text(size: 7.5pt)[$184.8$])
    content((-1.2 * scx, (170 - 160) * scy), text(size: 7.5pt)[$170$])

    // Nhãn trục hoành
    content((3 * scx, -0.6), text(size: 7.5pt)[$3$])
    content((4 * scx, -0.6), text(size: 7.5pt)[$4$])
    content((5 * scx, -0.6), text(size: 7.5pt)[$5$])
    content((6 * scx, -0.6), text(size: 7.5pt)[$6$])
  })),
  fig-pos: "right",
  fig-width: 44%,
  loigiai: [
    #reset-step()
    #step[
      *Nhận diện dạng toán.*

      Đây là dạng *cực trị rời rạc* vì số lần tăng giá $x$ phải là số nguyên. Đồng thời chi phí vận hành lại đổi tại ngưỡng $40$ căn hộ có người ở, nên hàm lợi nhuận phải chia thành hai nhánh.

      Cách làm chuẩn là:
      - dựng hai hàm lợi nhuận liên tục $L_1(x)$ và $L_2(x)$,
      - khảo sát từng nhánh bằng đạo hàm và BBT,
      - cuối cùng quay lại so sánh các giá trị *nguyên* ứng viên.
    ]
    #step[
      *Đặt biến và miền xác định.*

      Gọi $x$ là số lần tăng giá thuê thêm $200$ nghìn đồng. Khi đó:
      - giá thuê mỗi căn là $4 + 0.2x$ (triệu đồng),
      - số căn còn được thuê là $50 - 2x$.

      Vì số căn thuê không âm nên:
      $
        50 - 2x >= 0
        quad arrow.double quad
        x <= 25.
      $

      Do $x$ là số lần tăng giá, ta có:
      $
        x in \{0, 1, 2, ..., 25\}.
      $
    ]
    #step[
      *Dựng hàm lợi nhuận theo hai nhánh.*

      Số căn có người ở là $N(x) = 50 - 2x$.

      - *Nhánh 1: còn từ $40$ căn trở lên*
        Điều kiện $50 - 2x >= 40$ cho ta $x <= 5$.
        Khi đó chi phí vận hành là $0.4$ triệu đồng cho mỗi căn được thuê, nên:
        $
          L_1(x) = (50 - 2x)(4 + 0.2x) - 0.4(50 - 2x)
        $
        $
          = (50 - 2x)(3.6 + 0.2x) = -0.4x^2 + 2.8x + 180.
        $

      - *Nhánh 2: còn dưới $40$ căn*
        Điều kiện $50 - 2x < 40$ cho ta $x >= 6$.
        Khi đó chi phí vận hành tăng lên $0.6$ triệu đồng cho mỗi căn, nên:
        $
          L_2(x) = (50 - 2x)(4 + 0.2x) - 0.6(50 - 2x)
        $
        $
          = (50 - 2x)(3.4 + 0.2x) = -0.4x^2 + 3.2x + 170.
        $
    ]
    #step[
      *Khảo sát từng nhánh bằng đạo hàm và BBT.*

      - *Nhánh 1 trên đoạn $[0, 5]$*
        $
          L_1'(x) = -0.8x + 2.8.
        $
        $
          L_1'(x) = 0
          quad arrow.double quad
          x = 3.5.
        $

        #align(center)[
          #bbt-opt(
            var: $x$,
            der: $L_1'(x)$,
            func: $L_1(x)$,
            x-vals: ($0$, $3.5$, $5$),
            d-signs: ($+$, $0$, $-$),
            v-vals: ($180$, $184.9$, $184$),
            is-min: false,
          )
        ]

        Hàm liên tục đạt cực đại gần $x = 3.5$. Nhưng vì $x$ phải là số nguyên nên ta phải kiểm tra hai số nguyên gần nhất:
        $
          L_1(3) = 184.8, quad L_1(4) = 184.8.
        $

      - *Nhánh 2 trên đoạn $[6, 25]$*
        $
          L_2'(x) = -0.8x + 3.2.
        $
        Vì nghiệm $L_2'(x) = 0$ là $x = 4 < 6$, nên trên cả đoạn $[6, 25]$ ta luôn có $L_2'(x) < 0$.

        #align(center)[
          #bbbt(
            var: $x$,
            der: $L_2'(x)$,
            func: $L_2(x)$,
            x-vals: ($6$, $25$),
            d-signs: ($-$,),
            v-vals: ($174.8$, $0$),
          )
        ]

        Vậy trên nhánh này, lợi nhuận lớn nhất đạt tại biên trái $x = 6$ với:
        $
          L_2(6) = 174.8.
        $

      So sánh các ứng viên tốt nhất của hai nhánh:
      $
        184.8 > 174.8.
      $

      Vì thế lợi nhuận lớn nhất đạt khi $x = 3$ hoặc $x = 4$.

      #ans-box[Quyết định tăng giá thuê *3* hoặc *4* lần.]
    ]
  ],
)

#v(1em)

#pagebreak()

== Nhóm 4 — Doanh Nghiệp Khai Thác: Cực Đại Dưới Thuế Lũy Tiến
#tln(
  id: "CD-KT-04",
  [Một doanh nghiệp khai thác khoáng sản ước tính rằng nếu sản xuất $q$ tấn quặng mỗi ngày thì chi phí vận hành là $C(q) = q^2 + 10q + 100$ (triệu đồng). Giá bán quặng cố định trên thị trường là $50$ triệu đồng/tấn (tức doanh thu thô hằng ngày là $50q$ triệu đồng). Để kiểm soát tài nguyên môi trường, chính phủ áp dụng thuế suất lũy tiến lên doanh thu hằng ngày của doanh nghiệp như sau:
    - Đối với phần doanh thu không vượt quá $600$ triệu đồng: Thuế suất là $10\%$.
    - Đối với phần doanh thu vượt trên mức $600$ triệu đồng: Thuế suất cho phần vượt là $25\%$.

    Tìm sản lượng khai thác $q$ (tấn) hằng ngày để lợi nhuận ròng sau thuế của doanh nghiệp đạt giá trị lớn nhất.],
  [$13.75$],
  loigiai: [
    #reset-step()
    #step[
      *Nhận diện dạng toán.*

      Đây là dạng *lợi nhuận ròng phân đoạn có điểm gãy do thuế lũy tiến*. Với dạng này, ta luôn phải:
      - tìm mốc sản lượng làm đổi thuế suất,
      - lập hàm lợi nhuận theo từng đoạn,
      - đạo hàm từng đoạn,
      - rồi so sánh thêm tại chính điểm gãy.
    ]
    #step[
      *Đặt biến và tìm mốc chia miền.*

      Gọi $q$ là sản lượng quặng khai thác mỗi ngày, với $q >= 0$.

      Doanh thu là $50q$ (triệu đồng). Mốc thuế đổi tại doanh thu $600$ triệu nên ta giải:
      $
        50q = 600
        quad arrow.double quad
        q = 12.
      $

      Vì vậy, ta phải xét riêng hai miền:
      $
        [0, 12] quad "và" quad (12, +oo).
      $
    ]
    #step[
      *Lập hàm thuế và hàm lợi nhuận ròng.*

      Thuế phải nộp theo doanh thu là:
      - Nếu $q <= 12$:
        $
          T(q) = 10\% dot 50q = 5q.
        $
      - Nếu $q > 12$:
        $
          T(q) = 0.1 dot 600 + 0.25(50q - 600) = 12.5q - 90.
        $

      Do đó lợi nhuận ròng sau thuế là:
      $
        P(q) = 50q - (q^2 + 10q + 100) - T(q)
      $
      $
        = cases(
          -q^2 + 35q - 100 & "nếu" 0 <= q <= 12,
          -q^2 + 27.5q - 10 & "nếu" q > 12
        )
      $
    ]
    #step[
      *Khảo sát từng miền rồi so sánh toàn cục.*

      - *Trên đoạn $[0, 12]$*
        $
          P_1'(q) = -2q + 35.
        $
        Với mọi $q in [0, 12]$ ta có $P_1'(q) >= 11 > 0$, nên $P_1$ tăng trên $[0, 12]$.

        #align(center)[
          #bbbt(
            var: $q$,
            der: $P_1'(q)$,
            func: $P_1(q)$,
            x-vals: ($0$, $12$),
            d-signs: ($+$,),
            v-vals: ($-100$, $176$),
          )
        ]

        Vậy giá trị lớn nhất trên đoạn này là:
        $
          P_1(12) = 176.
        $

      - *Trên khoảng $(12, +oo)$*
        $
          P_2'(q) = -2q + 27.5.
        $
        $
          P_2'(q) = 0
          quad arrow.double quad
          q = 13.75.
        $

        #align(center)[
          #bbt-opt(
            var: $q$,
            der: $P_2'(q)$,
            func: $P_2(q)$,
            x-vals: ($12$, $13.75$, $+oo$),
            d-signs: ($+$, $0$, $-$),
            v-vals: ($176$, $179.0625$, $-oo$),
            is-min: false,
          )
        ]

        Do đó giá trị lớn nhất trên miền này là:
        $
          P_2(13.75) = 179.0625.
        $

      So sánh hai ứng viên toàn cục:
      $
        179.0625 > 176.
      $

      Vậy lợi nhuận ròng sau thuế đạt lớn nhất tại $q = 13.75$ tấn.

      #ans-box[Sản lượng khai thác tối ưu hằng ngày là *13,75* tấn.]
    ]
  ],
)

#v(1em)

#pagebreak()

== Nhóm 5 — Điện Mặt Trời: Cực Trị Biên Với Ràng Buộc Kỹ Thuật
#tln(
  id: "CD-KT-05",
  [Một trang trại điện mặt trời có công suất phát điện trung bình hằng ngày ổn định là $100$ kW trong suốt 10 giờ nắng (từ 8 giờ đến 18 giờ). Tập đoàn Điện lực mua điện của trang trại theo biểu phí chia giờ (Time-of-Use):
    - Khung giờ bình thường (8h - 9h và 11h - 16h, tổng 6 giờ): Giá điện là $2.000$ đồng/kWh.
    - Khung giờ thấp điểm (9h - 11h, tổng 2 giờ): Giá điện giảm còn $1.200$ đồng/kWh.
    - Khung giờ cao điểm (16h - 18h, tổng 2 giờ): Giá điện tăng lên $3.500$ đồng/kWh.

    Để gia tăng hiệu quả kinh tế, chủ trang trại lên kế hoạch lắp đặt hệ thống pin lưu trữ có dung lượng $E$ (kWh) với hiệu suất sạc/xả là $100\%$. Pin chỉ được sạc từ nguồn điện mặt trời tự phát trong 2 giờ thấp điểm, sau đó sẽ xả toàn bộ lượng điện tích lũy vào lưới điện trong 2 giờ cao điểm. Biết chi phí khấu hao pin lưu trữ phân bổ hằng ngày là $C(E) = 200E + 5.000$ (đồng).

    Tìm dung lượng pin lưu trữ $E$ (kWh) tối ưu để lợi nhuận tăng thêm hằng ngày đạt cực đại, biết dung lượng pin lắp đặt không vượt quá lượng điện phát ra trong giờ thấp điểm.],
  [$200$],
  loigiai: [
    #reset-step()
    #step[
      *Nhận diện dạng toán.*

      Đây là dạng *cực trị biên trên đoạn đóng*. Biến $E$ bị chặn bởi khả năng sạc trong giờ thấp điểm, nên dù hàm mục tiêu rất đơn giản, ta vẫn phải kết luận trên đoạn $[0, 200]$ chứ không được nói chung chung.
    ]
    #step[
      *Đặt biến và miền xác định kỹ thuật.*

      Gọi $E$ là dung lượng pin lưu trữ, tính bằng kWh.

      Trong $2$ giờ thấp điểm, hệ thống phát đều $100$ kW nên lượng điện tối đa có thể đưa vào pin là:
      $
        100 dot 2 = 200 " kWh".
      $

      Vì thế:
      $
        0 <= E <= 200.
      $
    ]
    #step[
      *Dựng hàm lợi nhuận tăng thêm.*

      Điều rất quan trọng ở bài này là: ta không cần tối ưu *toàn bộ doanh thu cơ sở* vì phần đó không phụ thuộc vào $E$. Chỉ cần tối ưu *phần lợi nhuận tăng thêm* do có pin.

      Mỗi $1$ kWh đưa vào pin sẽ tạo ra:
      - mất đi $1.200$ đồng vì không bán ở giờ thấp điểm,
      - nhưng thu thêm $3.500$ đồng khi bán ở giờ cao điểm.

      Vậy phần doanh thu tăng thêm là:
      $
        Delta R(E) = (3500 - 1200)E = 2300E.
      $

      Chi phí khấu hao hằng ngày là:
      $
        C(E) = 200E + 5000.
      $

      Do đó lợi nhuận tăng thêm thực sự là:
      $
        P(E) = Delta R(E) - C(E) = 2300E - (200E + 5000) = 2100E - 5000.
      $
    ]
    #step[
      *Xét đơn điệu trên đoạn $[0, 200]$.*

      Vì $P(E)$ là hàm bậc nhất nên:
      $
        P'(E) = 2100 > 0.
      $

      Vậy $P(E)$ tăng trên toàn bộ đoạn $[0, 200]$.

      #align(center)[
        #bbbt(
          var: $E$,
          der: $P'(E)$,
          func: $P(E)$,
          x-vals: ($0$, $200$),
          d-signs: ($+$,),
          v-vals: ($-5000$, $415000$),
        )
      ]

      Do đó, lợi nhuận tăng thêm lớn nhất đạt tại biên phải của miền, tức là $E = 200$.

      Khi ấy:
      $
        P(200) = 2100 dot 200 - 5000 = 415000.
      $

      #ans-box[Dung lượng pin lưu trữ tối ưu cần lắp đặt là *200* kWh.]
    ]
  ],
)

#v(1em)

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN PHỤ LỤC: HƯỚNG DẪN GIẢI QUA BBT
// ═══════════════════════════════════════════════
= Phụ Lục — 3 Mẫu Bảng Biến Thiên Nên Thuộc

== A. Mẫu 1 — Có Điểm Gãy Rồi Mới Có Cực Đại Ở Bên Phải
Đây là mẫu xuất hiện khi bài toán có *thuế lũy tiến* hoặc *phí nhảy bậc*. Ta minh họa bằng Bài 4:

#align(center)[
  #bbbt(
    var: $q$,
    der: $P'(q)$,
    func: $P(q)$,
    x-vals: ($0$, $12$, $13.75$, $+oo$),
    d-signs: ($+$, "||", $+$, $0$, $-$),
    v-vals: ($-100$, ($176$, $176$), $179.06$, $-oo$),
    w2: 11,
  )
]

#note-box(title: "Cách đọc mẫu 1")[
  - Dấu `||` báo rằng đạo hàm đổi công thức tại điểm gãy, chứ không có nghĩa hàm số bị đứt.

  - Điểm gãy vẫn phải được tính giá trị hàm và so sánh như một ứng viên nghiêm túc.

  - Sau điểm gãy, nếu vẫn còn tăng một đoạn rồi mới giảm, điểm tối ưu có thể nằm *sau* ngưỡng thuế chứ không nhất thiết nằm trước ngưỡng.
]

== B. Mẫu 2 — Đỉnh Nằm Ngoài Miền, Cực Trị Rơi Về Biên
Đây là mẫu rất hay gặp ở các bài chi phí bậc thang. Ta minh họa bằng nhánh thứ hai của Bài 3:

#align(center)[
  #bbbt(
    var: $x$,
    der: $L_2'(x)$,
    func: $L_2(x)$,
    x-vals: ($6$, $25$),
    d-signs: ($-$,),
    v-vals: ($174.8$, $0$),
  )
]

#note-box(title: "Cách đọc mẫu 2")[
  Nếu nghiệm của phương trình đạo hàm bằng $0$ nằm *ngoài đoạn đang xét*, thì ta không được giữ nghiệm đó. Khi đó, chỉ cần nhìn dấu của đạo hàm trên toàn đoạn để kết luận hàm tăng hay giảm, rồi chọn đầu mút thích hợp.
]

== C. Mẫu 3 — Hàm Đồng Biến Trên Đoạn Kín, Cực Đại Ở Biên Phải
Đây là mẫu tiêu biểu cho bài tối ưu có ràng buộc kỹ thuật như dung lượng pin, công suất kho, ngân sách trần. Ta minh họa bằng Bài 5:

#align(center)[
  #bbbt(
    var: $E$,
    der: $P'(E)$,
    func: $P(E)$,
    x-vals: ($0$, $200$),
    d-signs: ($+$,),
    v-vals: ($-5000$, $415000$),
  )
]

#note-box(title: "Cách đọc mẫu 3")[
  Khi đạo hàm luôn dương trên cả đoạn, hàm số tăng liên tục nên giá trị lớn nhất luôn đạt ở biên phải. Đây là dạng rất dễ thi vì lời giải ngắn, nhưng học sinh lại hay quên xét đúng miền $[0, E_max]$.
]

== D. Checklist Cuối Cùng Trước Khi Chốt Đáp Án

#warn-box[
  1. Đã viết hết các công thức của hàm phân đoạn chưa?

  2. Đã xét đủ mọi mốc đổi chính sách chưa?

  3. Nếu biến là số nguyên, đã quay lại so sánh các giá trị nguyên gần điểm cực trị chưa?

  4. Nếu bài có điểm gãy, đã so sánh giá trị tại điểm gãy chưa?

  5. Nếu miền là đoạn đóng, đã xét cả hai đầu mút chưa?
]
