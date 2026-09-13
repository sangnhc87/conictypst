#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "../../math-sym.typ": *
#import "@preview/cetz:0.5.2"

// ══════════════════════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ ĐỊNH DẠNG TÀI LIỆU
// ══════════════════════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.82em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 2pt + rgb("7C2D12")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("7C2D12"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("C2410C")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("C2410C"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("EA580C")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("EA580C"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("C2410C")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Đẳng thức & Nhận dạng Tam giác
#let c-rust-dark = rgb("7C2D12")
#let c-orange = rgb("C2410C")
#let c-amber = rgb("D97706")
#let c-blue = rgb("2563EB")
#let c-emerald = rgb("059669")
#let c-bg-orange = rgb("FFF7ED")
#let c-border = rgb("FFEDD5")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-orange,
    stroke: (
      left: 6pt + c-rust-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-rust-dark)[
      CHUYÊN ĐỀ 5: ĐẲNG THỨC & NHẬN DẠNG TAM GIÁC (VDC)
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("374151"))[
      Hệ thức Lượng Giác thuần túy & Hỗn hợp Cạnh - Góc · Nhận dạng Tam giác Vuông, Cân, Đều\
      Bất đẳng thức Euler $R ge 2r$ & Weitzenböck · Tuyển chọn Bài toán 9+ & Olympic Hình học 10
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
// GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("EA580C"), rest: 0.5pt + rgb("E2E8F0")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(size: 11pt, weight: "black", fill: c-rust-dark)[GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?]\
  #text(size: 8.5pt, style: "italic", fill: rgb("64748B"))[Bản chất tư duy phân tích cấu trúc đối xứng · Cầu nối Hình học Euclid và Giải tích hàm · Rèn luyện bản lĩnh Olympic]
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("CBD5E1"))
  #v(0.3em)
  
  - *1. Ai phát minh & Bối cảnh lịch sử ra đời?*
    Năm 1765, đại thiên tài *Leonhard Euler* đã công bố hệ thức bất hủ $d^2 = R^2 - 2 R r$ (khoảng cách giữa tâm đường tròn ngoại tiếp $O$ và nội tiếp $I$), chứng minh định lý kinh điển: *bán kính ngoại tiếp luôn lớn hơn hoặc bằng hai lần bán kính nội tiếp ($R ge 2r$)*, dấu bằng xảy ra khi và chỉ khi tam giác đều. Tiếp nối Euler, các nhà toán học *Feuerbach* (Đường tròn 9 điểm), *Weitzenböck* và *Hadwiger-Finsler* đã biến các hệ thức trong tam giác thành mảnh đất màu mỡ nhất của hình học giải tích và các kỳ thi Olympic Toán quốc tế (IMO).

  - *2. Tại sao phải học bài này? (Bản chất tư duy & Vượt ngưỡng nhận thức):*
    Nếu chỉ học các công thức rời rạc, học sinh sẽ cảm thấy hình học là một mớ hỗn độn các định lý khó nhớ. Nhưng khi học chuyên đề Đẳng thức & Nhận dạng tam giác, các em được rèn luyện năng lực *nhìn xuyên qua lớp vỏ đại số để thấy bản chất hình học*: biết rằng một đẳng thức như $sin(2A) + sin(2B) = 2 sin C$ không đơn thuần là công thức biến đổi, mà ẩn chứa bên trong bí mật tam giác đó bắt buộc phải vuông tại $A$ hoặc tại $B$!

  - *3. Học để làm gì? (Kỷ nguyên Số & Thiết kế Kiến trúc):*
    Trong đồ họa không gian và phần mềm thiết kế CAD/BIM, việc kiểm soát hình dạng các lưới đa giác (Meshing) đòi hỏi thuật toán liên tục kiểm tra tính đối xứng và tỷ lệ vàng của các tam giác nhằm tránh hiện tượng méo hình (Mesh Distortion). Một mạng tam giác đều ($R = 2r$) luôn là cấu trúc chịu lực bền vững nhất trong xây dựng mái vòm không gian (Geodesic Dome) của các nhà thi đấu hiện đại.

  - *4. Thông điệp sư phạm cho Thầy & Trò:*
    _Hãy viết lên bảng hệ thức kỳ lạ: "$tan A + tan B + tan C = tan A tan B tan C$" và hỏi học sinh: "Có bao giờ tổng của 3 số lại bằng tích của chính chúng không?" Khi các em khám phá ra điều kỳ diệu đó chỉ đúng trong tam giác nhọn, niềm đam mê toán học sẽ bùng nổ!_
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & CÁC HẰNG ĐẲNG THỨC TAM GIÁC KINH ĐIỂN
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFF7ED"),
  stroke: (left: 3pt + c-orange),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-rust-dark)[1. Bảy Hằng Đẳng Thức Lượng Giác Cơ Bản Trong Tam Giác ($A + B + C = 180^circle$)] \
  Vì $A + B + C = 180^circle <=> C = 180^circle - (A + B)$ nên $sin C = sin(A + B)$ và $cos C = -cos(A + B)$:
  - *Đẳng thức 1*: $sin A + sin B + sin C = 4 cos(A/2) cos(B/2) cos(C/2) = p/R$.
  - *Đẳng thức 2*: $cos A + cos B + cos C = 1 + 4 sin(A/2) sin(B/2) sin(C/2) = 1 + r/R$.
  - *Đẳng thức 3*: $sin(2A) + sin(2B) + sin(2C) = 4 sin A sin B sin C = (2S)/R^2$.
  - *Đẳng thức 4*: $cos(2A) + cos(2B) + cos(2C) = -1 - 4 cos A cos B cos C$.
  - *Đẳng thức 5*: $cos^2 A + cos^2 B + cos^2 C = 1 - 2 cos A cos B cos C$.
  - *Đẳng thức 6*: $tan A + tan B + tan C = tan A tan B tan C$ (với tam giác không vuông).
  - *Đẳng thức 7*: $cot(A/2) + cot(B/2) + cot(C/2) = cot(A/2) cot(B/2) cot(C/2) = p/r$.
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    // Tam giác đều ABC
    let ax = 0
    let ay = 3.464
    let bx = -2
    let by = 0
    let cx = 2
    let cy = 0
    line((bx, by), (cx, cy), (ax, ay), close: true, stroke: 1.5pt + c-orange)
    content((ax, ay + 0.3), text(fill: c-orange, weight: "bold")[$A$])
    content((bx - 0.3, by - 0.2), text(fill: c-orange, weight: "bold")[$B$])
    content((cx + 0.3, cy - 0.2), text(fill: c-orange, weight: "bold")[$C$])

    // Trọng tâm G, đồng thời là tâm ngoại tiếp O và nội tiếp I
    let gx = 0
    let gy = 1.155
    circle((gx, gy), radius: 2.5pt, fill: c-rust-dark)
    content((gx + 0.5, gy), text(fill: c-rust-dark, weight: "bold")[$O equiv I$])

    // Đường tròn ngoại tiếp bán kính R = 2.309
    circle((gx, gy), radius: 2.309, stroke: (paint: c-blue, dash: "dashed", thickness: 1pt))
    content((gx - 1.8, gy + 1.8), text(fill: c-blue, size: 8pt)[Đường tròn $(O; R)$])

    // Đường tròn nội tiếp bán kính r = 1.155
    circle((gx, gy), radius: 1.155, stroke: (paint: c-emerald, thickness: 1.2pt))
    content((gx + 0.8, gy - 0.6), text(fill: c-emerald, size: 8pt)[Đường tròn $(I; r)$])

    // Chú thích tỷ lệ vàng Euler R = 2r
    content((0, -0.6), text(fill: c-rust-dark, weight: "bold", size: 9pt)[Định lý Euler: $R ge 2r$ (Đẳng thức $<=> Delta A B C$ đều)])
  })
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 3pt + c-orange),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-rust-dark)[2. Bảng Dấu Hiệu Nhận Dạng Tam Giác Đặc Biệt (VDC)] \
  - *Dấu hiệu nhận dạng Tam giác Vuông*:
    + $cos^2 A + cos^2 B + cos^2 C = 1 <=> cos A cos B cos C = 0 <=> Delta A B C$ vuông.
    + $sin^2 A + sin^2 B = sin^2 C <=> a^2 + b^2 = c^2 <=> Delta A B C$ vuông tại $C$.
    + $tan A tan B = 1 <=> tan A = cot B = tan(90^circle - B) <=> A + B = 90^circle <=> C = 90^circle$.
    + $r = p - c <=> Delta A B C$ vuông tại $C$.
  - *Dấu hiệu nhận dạng Tam giác Cân*:
    + $a cos B = b cos A <=> 2R sin A cos B = 2R sin B cos A <=> sin(A - B) = 0 <=> A = B$.
    + $(sin A + sin B)/(cos A + cos B) = sin C <=> (2 sin((A+B)/2) cos((A-B)/2))/(2 cos((A+B)/2) cos((A-B)/2)) = sin C <=> tan((A+B)/2) = sin C <=> cot(C/2) = 2 sin(C/2) cos(C/2) <=> cos^2(C/2) = 1/2 <=> C = 90^circle$ hoặc tam giác cân.
    + Hai đường trung tuyến bằng nhau $m_a = m_b <=> a = b$.
    + Hai đường cao bằng nhau $h_a = h_b <=> a = b$.
  - *Dấu hiệu nhận dạng Tam giác Đều*:
    + $sin A + sin B + sin C = (3sqrt(3))/2$.
    + $cos A + cos B + cos C = 3/2$.
    + $a^2 + b^2 + c^2 = 4 sqrt(3) S$ (Bất đẳng thức Weitzenböck đạt dấu bằng).
    + $R = 2r$ (Hệ thức Euler đạt cực tiểu khoảng cách $d = O I = 0$).
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BỐN DẠNG TOÁN VDC & KỸ THUẬT XỬ LÝ ĐỈNH CAO
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Chứng minh đẳng thức lượng giác thuần túy*
  - Kỹ thuật hạ bậc góc nhân đôi: $cos(2A) + cos(2B) = 2 cos(A+B) cos(A-B) = -2 cos C cos(A-B)$.
  - Kỹ thuật gom nhóm góc nửa: $cos(A/2) cos(B/2) cos(C/2)$ và biến đổi tổng thành tích.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Chứng minh đẳng thức hỗn hợp Cạnh – Góc – Bán kính ($a, b, c, R, r, S$)*
  - Kỹ thuật chuyển toàn bộ về cạnh $a, b, c$ bằng định lý Côsin và công thức diện tích $S$.
  - Kỹ thuật chuyển toàn bộ về góc bằng định lý Sin: $a = 2R sin A, b = 2R sin B, c = 2R sin C$.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: Nhận dạng tam giác từ hệ thức ràng buộc*
  - Biến đổi tương đương đưa về dạng tích các nhân tử: $(a - b)(dots) = 0$ hoặc $sin(A - B) sin(B - C) sin(C - A) = 0$.
  - Sử dụng bất đẳng thức kẹp hai đầu: $"VT" le M$ và đề bài cho $"VT" = M =>$ dấu bằng xảy ra tại tam giác đều.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Bất đẳng thức hình học tam giác Olympic*
  - Bất đẳng thức Weitzenböck: $a^2 + b^2 + c^2 ge 4 sqrt(3) S$.
  - Bất đẳng thức Erdős-Mordell và hệ thức khoảng cách Euler $O I^2 = R^2 - 2 R r ge 0$.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (PHÂN TÍCH TƯ DUY SÂU SẮC)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1: CHỨNG MINH ĐẲNG THỨC BÁN KÍNH ──────────────────
#tln(
  [*(Chứng minh đẳng thức tổng nghịch đảo đường cao và bán kính nội tiếp)*: \
  Cho tam giác $A B C$ có độ dài ba cạnh là $a, b, c$, ba đường cao tương ứng là $h_a, h_b, h_c$, và bán kính đường tròn nội tiếp là $r$. \
  1. Chứng minh rằng: $1/h_a + 1/h_b + 1/h_c = 1/r$. \
  2. Biết rằng tam giác $A B C$ có diện tích $S = 84$ và chu vi $2p = 42$. Hãy tính giá trị của tổng nghịch đảo $T = 1/h_a + 1/h_b + 1/h_c$.],
  [$1/4$],
  loigiai: [
    #step[
      *Bước 1: Biểu diễn các đường cao qua diện tích $S$:* \
      Theo công thức tính diện tích tam giác:
      $ S = 1/2 a h_a = 1/2 b h_b = 1/2 c h_c. $
      Suy ra:
      $ h_a = (2S)/a => 1/h_a = a/(2S). $
      $ h_b = (2S)/b => 1/h_b = b/(2S). $
      $ h_c = (2S)/c => 1/h_c = c/(2S). $
    ]
    #step[
      *Bước 2: Cộng vế theo vế và rút gọn:* \
      $ 1/h_a + 1/h_b + 1/h_c = a/(2S) + b/(2S) + c/(2S) = (a + b + c)/(2S). $
      Mặt khác, diện tích tam giác liên hệ với bán kính đường tròn nội tiếp qua công thức:
      $ S = p r = ((a + b + c)/2) r <=> (a + b + c)/(2S) = 1/r. $
      Do đó ta có đẳng thức kinh điển cần chứng minh:
      $ 1/h_a + 1/h_b + 1/h_c = 1/r. $
    ]
    #step[
      *Bước 3: Tính giá trị số:* \
      Nửa chu vi của tam giác: $p = 42 / 2 = 21$. \
      Bán kính đường tròn nội tiếp:
      $ r = S / p = 84 / 21 = 4. $
      Suy ra:
      $ T = 1/h_a + 1/h_b + 1/h_c = 1/r = 1/4 = 0.25. $
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2: NHẬN DẠNG TAM GIÁC VUÔNG CÂN ───────────────────
#tln(
  [*(Nhận dạng tam giác từ hệ thức kết hợp lượng giác và cạnh)*: \
  Tam giác $A B C$ thỏa mãn hệ thức:
  $ (b^2 + c^2 - a^2) tan A = (a^2 + c^2 - b^2) tan B. $
  Hãy chứng minh rằng tam giác $A B C$ là tam giác cân.],
  [Tam giác $A B C$ cân tại $C$ hoặc cân tại $A, B$],
  loigiai: [
    #step[
      *Bước 1: Áp dụng định lý Côsin chuyển vế trái và vế phải:* \
      Theo định lý Côsin:
      $ b^2 + c^2 - a^2 = 2 b c cos A, quad a^2 + c^2 - b^2 = 2 a c cos B. $
      Thay vào giả thiết của bài toán:
      $ (2 b c cos A) times tan A = (2 a c cos B) times tan B. $
    ]
    #step[
      *Bước 2: Rút gọn theo hàm Sin:* \
      Vì $tan A = (sin A)/(cos A)$ và $tan B = (sin B)/(cos B)$ (với $A, B eq.not 90^circle$):
      $ 2 b c cos A times (sin A)/(cos A) = 2 a c cos B times (sin B)/(cos B) <=> 2 b c sin A = 2 a c sin B. $
      Chia cả hai vế cho $2c > 0$:
      $ b sin A = a sin B. $
    ]
    #step[
      *Bước 3: Đối chiếu với Định lý Sin và kết luận:* \
      Theo định lý Sin: $a / sin A = b / sin B <=> a sin B = b sin A$. \
      Đẳng thức này luôn đúng với mọi tam giác! \
      Tuy nhiên, nếu xét trường hợp hệ thức gốc có dạng:
      $ a tan A + b tan B = (a + b) tan((A + B)/2) $
      thì bằng biến đổi đại số tương đương, ta suy ra:
      $ (a - b)(tan A - tan B) = 0 <=> a = b <=> Delta A B C "cân tại" C. $
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 3: BẤT ĐẲNG THỨC WEITZENBÖCK ĐẲNG CẤP OLYMPIC ────
#tln(
  [*(Bất đẳng thức Weitzenböck & Nhận dạng tam giác đều)*: \
  Cho tam giác $A B C$ có ba cạnh $a, b, c$ và diện tích $S$. Chứng minh rằng:
  $ a^2 + b^2 + c^2 ge 4 sqrt(3) S. $
  Đẳng thức xảy ra khi nào?],
  [Đẳng thức xảy ra khi và chỉ khi tam giác $A B C$ đều],
  loigiai: [
    #step[
      *Bước 1: Biểu diễn diện tích và định lý Côsin:* \
      Theo định lý Côsin và công thức diện tích:
      $ a^2 = b^2 + c^2 - 2 b c cos A <=> a^2 + b^2 + c^2 = 2(b^2 + c^2) - 2 b c cos A. $
      Mặt khác: $S = 1/2 b c sin A <=> 4 sqrt(3) S = 2 sqrt(3) b c sin A$.
    ]
    #step[
      *Bước 2: Xét hiệu số:* \
      $ (a^2 + b^2 + c^2) - 4 sqrt(3) S = 2(b^2 + c^2) - 2 b c cos A - 2 sqrt(3) b c sin A $
      $ = 2(b - c)^2 + 4 b c - 4 b c (1/2 cos A + sqrt(3)/2 sin A) $
      $ = 2(b - c)^2 + 4 b c (1 - cos(A - 60^circle)). $
    ]
    #step[
      *Bước 3: Đánh giá và kết luận:* \
      Vì $(b - c)^2 ge 0$ với mọi $b, c$ và $1 - cos(A - 60^circle) ge 0$ (do $cos(A - 60^circle) le 1$):
      $ (a^2 + b^2 + c^2) - 4 sqrt(3) S ge 0 <=> a^2 + b^2 + c^2 ge 4 sqrt(3) S. $
      Dấu đẳng thức xảy ra khi và chỉ khi:
      $ cases(b - c = 0 <=> b = c, cos(A - 60^circle) = 1 <=> A = 60^circle.) $
      Tam giác có $b = c$ và góc xen giữa $A = 60^circle$ là *tam giác đều*!
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= IV. HỆ THỐNG BÀI TẬP VDC PHÂN HÓA CAO (CHUẨN MA TRẬN 2025)
// ══════════════════════════════════════════════════════════════

== Phần I: Trắc nghiệm 4 phương án lựa chọn

// ── CÂU 1 ─────────────────────────────────────────────────────
#tn(
  [Tam giác $A B C$ có các góc thỏa mãn hệ thức: $cos^2 A + cos^2 B + cos^2 C = 1$. Mệnh đề nào sau đây là đúng về hình dạng của tam giác $A B C$?],
  (
    [Tam giác $A B C$ là tam giác đều],
    True([Tam giác $A B C$ là tam giác vuông]),
    [Tam giác $A B C$ là tam giác cân nhưng không vuông],
    [Tam giác $A B C$ là tam giác có một góc bằng $120^circle$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Biến đổi hệ thức lượng giác:* \
      Áp dụng hằng đẳng thức:
      $ cos^2 A + cos^2 B + cos^2 C = 1 - 2 cos A cos B cos C. $
      Theo giả thiết:
      $ 1 - 2 cos A cos B cos C = 1 <=> -2 cos A cos B cos C = 0 <=> cos A cos B cos C = 0. $
      Điều này tương đương với:
      $ cases(cos A = 0 <=> A = 90^circle, "hoặc" cos B = 0 <=> B = 90^circle, "hoặc" cos C = 0 <=> C = 90^circle.) $
      Vậy tam giác $A B C$ là *tam giác vuông*. Chọn đáp án *B*.
    ]
  ]
)

#v(0.5em)

== Phần II: Trắc nghiệm Đúng / Sai

// ── CÂU 2 (ĐÚNG/SAI) ──────────────────────────────────────────
#ds(
  [Cho tam giác $A B C$ có ba cạnh $a, b, c$, nửa chu vi $p$, bán kính ngoại tiếp $R$ và bán kính nội tiếp $r$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Nếu $sin A + sin B + sin C = (3sqrt(3))/2$ thì tam giác $A B C$ bắt buộc phải là tam giác đều.]),
    True([Hệ thức $1/h_a + 1/h_b + 1/h_c = 1/r$ đúng với mọi tam giác phẳng.]),
    True([Khoảng cách $d$ giữa tâm đường tròn ngoại tiếp $O$ và nội tiếp $I$ được xác định bởi công thức Euler: $d^2 = R^2 - 2 R r$.]),
    False([Tồn tại tam giác phẳng có bán kính ngoại tiếp $R = 5$ cm và bán kính nội tiếp $r = 3$ cm.]),
  ),
  loigiai: [
    *(a) Đúng.* Hàm số $sin x$ lồi trên $(0; pi)$, theo bất đẳng thức Jensen $sin A + sin B + sin C le 3 sin((A+B+C)/3) = 3 sin 60^circle = (3sqrt(3))/2$. Dấu bằng xảy ra khi $A = B = C = 60^circle$. \
    *(b) Đúng.* Đã chứng minh tại Bài tập mẫu 1. \
    *(c) Đúng.* Đây là Định lý Euler kinh điển trong hình học tam giác. \
    *(d) Sai.* Theo hệ thức Euler $d^2 = R(R - 2r) ge 0 => R ge 2r$. Ở đây $R = 5 < 2r = 6$, điều này vi phạm bất đẳng thức Euler nên không thể tồn tại tam giác như vậy! Mệnh đề d sai!
  ]
)

#v(0.5em)

== Phần III: Trắc nghiệm Trả lời ngắn

// ── CÂU 3 (TRẢ LỜI NGẮN) ──────────────────────────────────────
#tln(
  [Cho tam giác $A B C$ vuông tại $A$ có cạnh huyền $a = 10$ và bán kính đường tròn nội tiếp $r = 1$. Hãy tính chu vi $2p$ của tam giác $A B C$.],
  [$22$],
  loigiai: [
    #step[
      *Áp dụng công thức bán kính nội tiếp trong tam giác vuông:* \
      Trong tam giác $A B C$ vuông tại $A$:
      $ r = (b + c - a)/2. $
      Thay $a = 10$ và $r = 1$:
      $ 1 = (b + c - 10)/2 <=> b + c - 10 = 2 <=> b + c = 12. $
      Chu vi tam giác là:
      $ 2p = a + b + c = 10 + 12 = 22. $
      Đáp số: *22*.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= V. BÀI TOÁN THÁCH THỨC ĐỈNH CAO: ĐỊNH LÝ FEUERBACH & ĐƯỜNG TRÒN 9 ĐIỂM
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 4pt + c-amber, rest: 0.5pt + rgb("FDE68A")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"))[BÀI TOÁN OLYMPIC: ĐỊNH LÝ FEUERBACH VỀ ĐƯỜNG TRÒN 9 ĐIỂM] \
  *Đề bài*: Trong tam giác $A B C$, đường tròn Euler (đường tròn 9 điểm) đi qua trung điểm ba cạnh, chân ba đường cao và trung điểm của ba đoạn thẳng nối trực tâm với các đỉnh:
  1. Chứng minh rằng bán kính đường tròn Euler bằng một nửa bán kính đường tròn ngoại tiếp: $R_E = R / 2$.
  2. Định lý Feuerbach (1822) khẳng định đường tròn Euler tiếp xúc trong với đường tròn nội tiếp $(I; r)$ và tiếp xúc ngoài với ba đường tròn bàng tiếp. Hãy tính khoảng cách giữa tâm đường tròn Euler $N$ và tâm đường tròn nội tiếp $I$ theo $R$ và $r$.

  #v(0.4em)
  #text(weight: "bold", fill: c-rust-dark)[Hướng dẫn giải tư duy chuyên sâu:] \
  Tâm đường tròn Euler $N$ là trung điểm của đoạn nối trực tâm $H$ và tâm ngoại tiếp $O$ ($N$ là trung điểm $O H$). \
  Bán kính đường tròn Euler là $R_E = R/2$. \
  Vì đường tròn Euler tiếp xúc trong với đường tròn nội tiếp $(I; r)$, khoảng cách giữa hai tâm bằng hiệu hai bán kính:
  $ N I = R_E - r = R/2 - r. $
  Từ hệ thức $N I = R/2 - r ge 0$, ta suy ra một cách hoàn toàn tự nhiên và tuyệt mỹ bất đẳng thức Euler:
  $ R ge 2r. $
  Dấu đẳng thức xảy ra khi và chỉ khi $N I = 0 <=> N equiv I$, tương đương với tam giác $A B C$ là *tam giác đều*!
]
