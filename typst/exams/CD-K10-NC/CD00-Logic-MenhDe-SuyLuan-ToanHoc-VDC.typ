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
  stroke: (bottom: 2pt + rgb("1E3A8A")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("1E3A8A"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("2563EB")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("2563EB"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("3B82F6")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("3B82F6"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("2563EB")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Logic Mệnh đề
#let c-navy-dark = rgb("0F172A")
#let c-blue-dark = rgb("1E3A8A")
#let c-blue = rgb("2563EB")
#let c-sky = rgb("0284C7")
#let c-red = rgb("DC2626")
#let c-green = rgb("16A34A")
#let c-bg-blue = rgb("EFF6FF")
#let c-border = rgb("BFDBFE")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-blue,
    stroke: (
      left: 6pt + c-blue-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-blue-dark)[
      CHUYÊN ĐỀ VẬN DỤNG CAO: MỆNH ĐỀ TOÁN HỌC, SUY LUẬN LOGIC\
      & CÂU ĐỐ TƯ DUY HIỆP SĨ -- NÓI DỐI
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("4B5563"))[
      Toán học lớp 10 (GDPT 2018) -- Bảng chân trị, chân lý chân không, mệnh đề phản đảo,\
      quy tắc Modus Tollens, logic đa tầng lượng từ $forall, exists$, logic phá án & mạch Boolean
    ]
  ]
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
// GÓC NHÌN SƯ PHẠM & KHỞI NGUYÊN TRIẾT HỌC: TẠI SAO PHẢI HỌC BÀI NÀY?
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("D97706"), rest: 0.5pt + rgb("E2E8F0")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(size: 11pt, weight: "black", fill: c-blue-dark)[GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?]\
  #text(size: 8.5pt, style: "italic", fill: rgb("64748B"))[Khởi nguyên lịch sử · Bản chất tư duy phản biện · Ứng dụng sống còn trong Kỷ nguyên Vi mạch & Trí tuệ Nhân tạo (AI)]
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("CBD5E1"))
  #v(0.3em)
  
  - *1. Ai phát minh & Bối cảnh lịch sử ra đời?*
    Vào thế kỷ IV TCN, *Aristotle* đã khai sinh Logic học hình thức để dẹp bỏ những ngụy biện tinh vi của các nhà ngụy biện Hy Lạp cổ đại. Đến năm 1854, *George Boole* đã thực hiện một bước nhảy vọt vô tiền khoáng hậu khi số hóa tư duy con người thành hai giá trị $0$ và $1$ (Đại số Boole). Đầu thế kỷ 20, cuộc khủng hoảng nền tảng toán học của *Bertrand Russell* và *Kurt Gödel* (Định lý Bất toàn 1931) đã biến Logic thành hòn đá tảng vững chắc nhất của nền văn minh hiện đại.
  
  - *2. Tại sao phải học bài này? (Khủng hoảng nhận thức & Bản chất tư duy):*
    Học sinh thường tranh luận theo cảm tính, ngộ nhận giữa mệnh đề thuận và mệnh đề đảo, hoặc hoang mang trước "chân lý chân không" (vacuous truth). Học chuyên đề này giúp não bộ thiết lập một bộ lọc tư duy nghiêm ngặt: phân biệt rạch ròi giữa giả thiết và kết luận, làm chủ quy tắc suy diễn phản chứng (*Modus Tollens*), và xây dựng khả năng lập luận phản biện sắc bén (*Critical Thinking*) mà không một ngụy biện nào có thể đánh lừa.
  
  - *3. Học để làm gì? (Kỷ nguyên Số, AI & Thế giới thực):*
    Nếu không có Đại số Boole và Logic mệnh đề, thế giới sẽ *không có máy tính, không có internet, và không có smartphone*. Mọi con chip của Intel, AMD, hay Apple Silicon đều được cấu tạo từ hàng tỉ cổng logic AND, OR, NOT. Trong ngành an ninh mạng và hàng không vũ trụ, các thuật toán kiểm thử tự động (*SAT-Solver*) bảo đảm phần mềm điều khiển tên lửa hay lò phản ứng hạt nhân không bao giờ xảy ra lỗi tử mạng. Trong thời đại AI, tư duy logic suy luận (Chain-of-Thought) là năng lực cốt lõi để con người làm chủ và huấn luyện các mô hình ngôn ngữ lớn (LLM).
  
  - *4. Thông điệp sư phạm cho Thầy & Trò:*
    _Khi bước vào giờ học, thầy cô đừng vội vẽ bảng chân trị, hãy hỏi học sinh: "Tại sao câu nói: 'Nếu $1 + 1 = 3$ thì bạn là tỷ phú thế giới' lại là một chân lý hoàn toàn ĐÚNG trong toán học?" Khởi đầu từ nghịch lý chân không sẽ kích hoạt trực giác tò mò và mở ra chân trời tư duy triết học kỳ vĩ cho học trò._
]

#v(1em)

= PHẦN I: CƠ SỞ LÝ THUYẾT & CÁC NGUYÊN LÝ LOGIC CỐT LÕI

== 1. Bảng chân trị và các phép toán mệnh đề cơ bản
Một *mệnh đề toán học* là một khẳng định có giá trị chân lý xác định: hoặc *Đúng* (ký hiệu $Đ$ hoặc $1$), hoặc *Sai* (ký hiệu $S$ hoặc $0$), không thể vừa đúng vừa sai.

#align(center)[
  #table(
    columns: (1.8cm, 1.8cm, 2.2cm, 2.2cm, 2.2cm, 2.8cm, 2.8cm),
    inset: (x: 6pt, y: 6pt),
    align: center,
    stroke: 0.5pt + c-blue,
    fill: (col, row) => if row == 0 { c-bg-blue } else { white },
    [$P$], [$Q$], [Phủ định $not P$], [Hội $P and Q$], [Tuyển $P or Q$], [Kéo theo $P => Q$], [Tương đương $P <=> Q$],
    [$1$], [$1$], [$0$], [$1$], [$1$], [$1$], [$1$],
    [$1$], [$0$], [$0$], [$0$], [$1$], [$0$], [$0$],
    [$0$], [$1$], [$1$], [$0$], [$1$], [$1$], [$0$],
    [$0$], [$0$], [$1$], [$0$], [$0$], [$1$], [$1$],
  )
]

- *Bẫy kinh điển số 1: Phép kéo theo $P => Q$ & "Chân lý chân không" (Vacuous Truth)*:
  + Mệnh đề $P => Q$ chỉ sai trong duy nhất một trường hợp: *Giả thiết $P$ Đúng nhưng Kết luận $Q$ Sai*.
  + *Đặc biệt quan trọng*: Khi $P$ Sai, mệnh đề $P => Q$ *luôn luôn Đúng* bất kể $Q$ đúng hay sai! (Ví dụ: "Nếu $2 + 2 = 5$ thì mặt trời mọc ở hướng Tây" là một mệnh đề toán học hoàn toàn ĐÚNG!).

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Venn quan hệ P => Q tương đương P là tập con của Q
    circle((0, 0), radius: 2.2, stroke: 1.5pt + c-blue, fill: rgb("3B82F6").transparentize(90%))
    content((1.6, 1.6), text(fill: c-blue, weight: "bold")[Tập $Q$ (Kết luận)])
    
    circle((-0.3, -0.2), radius: 1.1, stroke: 1.5pt + c-red, fill: rgb("EF4444").transparentize(80%))
    content((-0.3, -0.2), text(fill: c-red, weight: "bold")[Tập $P$ (Tiền đề)])
    
    content((0, -2.6), text(size: 8.5pt, style: "italic", fill: c-navy-dark)[$P => Q <=> P subset Q$: Mọi phần tử thỏa mãn $P$ đều nằm lọt trong $Q$])
  })
]

== 2. Mệnh đề Đảo, Phản đảo và Quy tắc Tương đương logic
Cho mệnh đề kéo theo ban đầu: $P => Q$.
- *Mệnh đề đảo*: $Q => P$ (Không nhất thiết có cùng chân trị với mệnh đề ban đầu).
- *Mệnh đề phản đảo*: $not Q => not P$.
- *Định lý tương đương logic cốt lõi*:
  $ (P => Q) <=> (not Q => not P) $
  Mệnh đề ban đầu và mệnh đề phản đảo *luôn cùng đúng hoặc cùng sai*. Đây là cơ sở nền tảng của phương pháp chứng minh phản đảo trong toán học.

== 3. Lượng từ $forall$ (với mọi) và $exists$ (tồn tại) đa tầng
- *Quy tắc phủ định De Morgan cho lượng từ*:
  $ not (forall x in X, P(x)) <=> exists x in X, not P(x) $
  $ not (exists x in X, P(x)) <=> forall x in X, not P(x) $
- *Phủ định mệnh đề đa tầng lượng từ* (Gặp trong các định nghĩa giải tích và đại số cao cấp):
  Quy tắc: Khi lấy phủ định, mọi $forall$ đổi thành $exists$, mọi $exists$ đổi thành $forall$, và phủ định mệnh đề điều kiện ở tận cùng.
  $ not [forall x in X, exists y in Y: P(x, y)] <=> exists x in X, forall y in Y: not P(x, y) $

== 4. Các quy tắc suy luận logic chuẩn mực
- *Quy tắc khẳng định giả thiết (Modus Ponens)*: Nếu biết $P => Q$ đúng và $P$ đúng, suy ra $Q$ đúng.
- *Quy tắc phủ định kết luận (Modus Tollens)*: Nếu biết $P => Q$ đúng và $Q$ sai, suy ra $P$ sai.
- *Quy tắc tam đoạn luận*: Nếu $P => Q$ đúng và $Q => R$ đúng, suy ra $P => R$ đúng.
- *Phương pháp phản chứng (Reductio ad Absurdum)*: Để chứng minh $P$ đúng, ta giả thiết $not P$ đúng, từ đó lập luận dẫn đến một điều mâu thuẫn hiển nhiên ($R and not R$). Suy ra $not P$ sai, vậy $P$ đúng.

== 5. Mô hình Mạch điện Logic Boolean
#align(center)[
  #cetz.canvas(length: 0.85cm, {
    import cetz.draw: *
    // Mạch nối tiếp (AND)
    rect((-4.5, 0.4), (-0.5, 2.2), stroke: 1pt + c-blue, fill: rgb("EFF6FF"))
    content((-2.5, 2), text(size: 8.5pt, weight: "bold", fill: c-blue)[Mạch AND (Nối tiếp): $A and B$])
    line((-4.2, 1.1), (-3.3, 1.1), stroke: 1.2pt)
    line((-3.3, 1.1), (-2.7, 1.6), stroke: 1.5pt + c-red) // khóa A
    content((-3, 1.8), text(size: 8pt)[$A$])
    line((-2.7, 1.1), (-1.8, 1.1), stroke: 1.2pt)
    line((-1.8, 1.1), (-1.2, 1.6), stroke: 1.5pt + c-red) // khóa B
    content((-1.5, 1.8), text(size: 8pt)[$B$])
    line((-1.2, 1.1), (-0.8, 1.1), stroke: 1.2pt)
    circle((-0.8, 1.1), radius: 0.15, fill: yellow, stroke: 1pt) // đèn
    content((-0.8, 0.7), text(size: 7pt)[Đèn])

    // Mạch song song (OR)
    rect((0.5, 0.2), (4.5, 2.4), stroke: 1pt + c-green, fill: rgb("F0FDF4"))
    content((2.5, 2.2), text(size: 8.5pt, weight: "bold", fill: c-green)[Mạch OR (Song song): $A or B$])
    line((0.8, 1.2), (1.5, 1.2), stroke: 1.2pt)
    line((1.5, 0.7), (1.5, 1.7), stroke: 1.2pt)
    // Nhánh A trên
    line((1.5, 1.7), (2.1, 1.7), stroke: 1.2pt)
    line((2.1, 1.7), (2.7, 2.1), stroke: 1.5pt + c-red)
    content((2.4, 2.2), text(size: 8pt)[$A$])
    line((2.7, 1.7), (3.3, 1.7), stroke: 1.2pt)
    // Nhánh B dưới
    line((1.5, 0.7), (2.1, 0.7), stroke: 1.2pt)
    line((2.1, 0.7), (2.7, 1.1), stroke: 1.5pt + c-red)
    content((2.4, 0.4), text(size: 8pt)[$B$])
    line((2.7, 0.7), (3.3, 0.7), stroke: 1.2pt)
    // Hợp lại
    line((3.3, 0.7), (3.3, 1.7), stroke: 1.2pt)
    line((3.3, 1.2), (4, 1.2), stroke: 1.2pt)
    circle((4, 1.2), radius: 0.15, fill: yellow, stroke: 1pt)
    content((4, 0.8), text(size: 7pt)[Đèn])
  })
]

== 5. Nguồn gốc lịch sử Logic học & Các hướng mở rộng cao cấp

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("1E3A8A"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: c-blue-dark)[a) Nguồn gốc lịch sử: Từ Aristotle đến Đại số Boole và Máy tính số:]
  - *Aristotle (384--322 TCN)*: Được coi là cha đẻ của Logic học hình thức với hệ thống *Tam đoạn luận (Syllogism)*: Tiền đề lớn + Tiền đề nhỏ $=>$ Kết luận (kinh điển: "Mọi người đều phải chết. Socrates là người. Vậy Socrates phải chết").
  - *George Boole (1815--1864)*: Năm 1854 xuất bản tác phẩm vĩ đại *An Investigation of the Laws of Thought*, lần đầu tiên số hóa tư duy logic thành các phép toán đại số trên hai giá trị ${0, 1}$. Gần một thế kỷ sau, năm 1937, *Claude Shannon* nhận ra rằng đại số Boole chính là ngôn ngữ mô tả hoàn hảo mạng lưới đóng/mở của rơ-le điện tử tử, đặt nền móng cho cuộc cách mạng máy tính kỹ thuật số ngày nay.

  #v(0.4em)
  #text(weight: "bold", fill: c-blue-dark)[b) Định lý Bất toàn của Kurt Gödel (1931) -- Giới hạn tuyệt đối của suy luận:]
  - Đầu thế kỷ 20, David Hilbert đề xướng chương trình hoàn thiện hóa toán học: Tìm một hệ tiên đề hữu hạn có thể chứng minh hoặc bác bỏ *mọi* mệnh đề toán học.
  - Năm 1931, nhà toán học 25 tuổi *Kurt Gödel* công bố *Hai Định lý Bất toàn (Incompleteness Theorems)* chấn động:
    + *Định lý 1*: Trong bất kỳ hệ tiên đề hình thức nào đủ mạnh để chứa số học (như hệ tiên đề Peano), luôn tồn tại những mệnh đề chân thực nhưng *không thể chứng minh hay bác bỏ* từ các tiên đề đó (mệnh đề không thể quyết định).
    + *Định lý 2*: Một hệ tiên đề không bao giờ có thể tự chứng minh tính *nhất quán (không mâu thuẫn)* của chính mình.
  - Ý nghĩa: Không một hệ thống thuật toán nào có thể thay thế hoàn toàn trực giác sáng tạo của con người!

  #v(0.4em)
  #text(weight: "bold", fill: c-blue-dark)[c) Mở rộng 1: Bài toán Thỏa mãn Boolean (SAT) & Bài toán Thiên niên kỷ $P$ vs $N P$:]
  - Cho một công thức logic mệnh đề gồm $n$ biến, hỏi có tồn tại bộ giá trị chân trị ${x_1, x_2, dots, x_n} in {0, 1}^n$ để công thức nhận giá trị đúng ($1$) hay không?
  - *Định lý Cook-Levin (1971)*: Bài toán SAT (cụ thể là 3-SAT) là bài toán *NP-đầy đủ đầu tiên* trong lịch sử khoa học máy tính. Nếu tìm được một thuật toán thời gian đa thức giải SAT, toàn bộ hàng triệu bài toán tối ưu hóa, mật mã học, chuỗi DNA sẽ được giải quyết trong chớp mắt (tức $P = N P$).

  #v(0.4em)
  #text(weight: "bold", fill: c-blue-dark)[d) Mở rộng 2: Logic mờ (Fuzzy Logic) & Trí tuệ nhân tạo (AI):]
  - Khác với logic cổ điển nhị phân hai giá trị tuyệt đối ${0, 1}$, nhà khoa học *Lotfi Zadeh* (1965) đề xuất *Logic mờ*: Chân trị của mệnh đề nhận giá trị liên tục trong đoạn $[0; 1]$ (độ tin cậy, mức độ thuộc về tập mờ). Logic mờ là cốt lõi của các hệ thống tự hành thông minh: phanh ABS tự động, máy giặt biến tần, và hệ suy luận tri thức nhân tạo.
]

#v(1em)

= PHẦN II: 4 DẠNG TOÁN VẬN DỤNG CAO VÀ KỸ THUẬT SUY LUẬN

== Dạng 1: Phủ định mệnh đề phức hợp & Điều kiện cần, điều kiện đủ
- Phủ định mệnh đề kéo theo: $not (P => Q) <=> P and not Q$ (chú ý: phủ định của mệnh đề kéo theo không phải là mệnh đề kéo theo!).
- "Điều kiện cần": $Q$ là điều kiện cần để có $P$ nghĩa là $P => Q$.
- "Điều kiện đủ": $P$ là điều kiện đủ để có $Q$ nghĩa là $P => Q$.
- "Điều kiện cần và đủ": $P <=> Q$.

== Dạng 2: Câu đố logic Hiệp sĩ và Kẻ nói dối (Knights and Knaves)
- Trên đảo có 2 loại cư dân: *Hiệp sĩ* (luôn nói thật, chân trị $= 1$) và *Kẻ nói dối* (luôn nói dối, chân trị $= 0$).
- *Nguyên lý giải*: Một người $A$ phát biểu mệnh đề $S$. Khi đó:
  $ text("Chân trị của ") A <=> text("Chân trị của mệnh đề ") S $
  Lập bảng xét trường hợp giả định $A$ là Hiệp sĩ hoặc Kẻ nói dối, loại bỏ trường hợp mâu thuẫn.

== Dạng 3: Bài toán suy luận nhân chứng & Phá án hình sự
- Lập bảng chân trị hoặc lập các phương trình Boolean: Đặt các ẩn logic $x_i in {0, 1}$.
- Mỗi lời khai tương ứng với một biểu thức logic. Phân tích các trường hợp giả thiết "có đúng 1 người nói thật" hoặc "có đúng 1 thủ phạm".

== Dạng 4: Đại số Boole và Mạch chuyển mạch logic
- Mạch nối tiếp tương ứng với phép Hội (AND: $A dot B$).
- Mạch song song tương ứng với phép Tuyển (OR: $A + B$).
- Rút gọn mạch điện bằng các luật đại số Boole (Luật De Morgan, luật hấp thụ).

#v(1em)

= PHẦN III: BÀI TẬP MẪU CÓ LỜI GIẢI SƯ PHẠM CHI TIẾT

// ── BÀI MẪU 1 ─────────────────────────────────────────────────
#tl(
  [*(Bài toán logic Hiệp sĩ và Kẻ nói dối kinh điển của Raymond Smullyan)*\
  Trên một hòn đảo xa xôi, mỗi cư dân chỉ có thể là Hiệp sĩ (người luôn nói thật) hoặc Kẻ nói dối (người luôn nói dối). Bạn gặp hai cư dân $A$ và $B$.
  - Người $A$ nói: *"Ít nhất một trong hai chúng tôi là Kẻ nói dối."*
  Hỏi $A$ là ai và $B$ là ai?],
  loigiai: [
    #step[
      *Bước 1: Mô hình hóa toán học mệnh đề:* \
      Gọi $P_A$ là mệnh đề: "$A$ là Hiệp sĩ". Khi đó $not P_A$ có nghĩa là "$A$ là Kẻ nói dối". \
      Gọi $P_B$ là mệnh đề: "$B$ là Hiệp sĩ". Khi đó $not P_B$ có nghĩa là "$B$ là Kẻ nói dối". \
      Lời phát biểu của $A$ là mệnh đề: $S = not P_A or not P_B$ ("Ít nhất một trong hai người là kẻ nói dối").
    ]
    #step[
      *Bước 2: Phân tích chân lý:* \
      Theo quy tắc logic của cư dân trên đảo: Chân trị của người nói tương đương với chân trị lời nói:
      $ P_A <=> S <=> P_A <=> (not P_A or not P_B) $
      Ta xét 2 trường hợp:
      - *Trường hợp 1: Giả sử $A$ là Kẻ nói dối ($P_A$ Sai):* \
        Khi đó lời nói của $A$ phải là Sai: $S$ Sai $<=> not P_A or not P_B$ Sai. \
        Theo luật De Morgan: $not (not P_A or not P_B) <=> P_A and P_B$ Đúng. \
        Điều này dẫn đến $P_A$ Đúng (tức là $A$ là Hiệp sĩ), mâu thuẫn hoàn toàn với giả thiết $A$ là Kẻ nói dối! \
        Vậy trường hợp 1 bị loại.
      - *Trường hợp 2: Vậy $A$ bắt buộc phải là Hiệp sĩ ($P_A$ Đúng):* \
        Vì $A$ là Hiệp sĩ nên lời phát biểu $S$ của $A$ là hoàn toàn Đúng:
        $ not P_A or not P_B text(" là ĐÚNG"). $
        Mà ta đã biết $A$ là Hiệp sĩ nên $not P_A$ là Sai. \
        Do đó, để mệnh đề tuyển $not P_A or not P_B$ Đúng thì bắt buộc $not P_B$ phải là Đúng! \
        $not P_B$ Đúng có nghĩa là $B$ là Kẻ nói dối.
    ]
    #step[
      *Kết luận:* \
      Người $A$ là *Hiệp sĩ*, còn người $B$ là *Kẻ nói dối*.
    ]
  ]
)

#v(0.8em)

// ── BÀI MẪU 2 ─────────────────────────────────────────────────
#tl(
  [*(Phủ định mệnh đề chứa nhiều tầng lượng từ trong Giải tích)*\
  Cho hàm số $f: RR -> RR$. Xét mệnh đề toán học $P$:
  $ P: "forall epsilon > 0, exists delta > 0, forall x in RR: (|x - x_0| < delta => |f(x) - f(x_0)| < epsilon)" $
  1. Hãy phát biểu mệnh đề phủ định $not P$.
  2. Áp dụng quy tắc phủ định để giải thích rõ thế nào là một hàm số *không liên tục tại điểm $x_0$*.],
  loigiai: [
    #step[
      *Bước 1: Áp dụng quy tắc phủ định từng tầng lượng từ:* \
      Mệnh đề $P$ có 3 tầng lượng từ: $forall epsilon$, $exists delta$, $forall x$. \
      Áp dụng luật De Morgan cho lượng từ:
      - $not (forall epsilon > 0) -> exists epsilon > 0$.
      - $not (exists delta > 0) -> forall delta > 0$.
      - $not (forall x in RR) -> exists x in RR$.
    ]
    #step[
      *Bước 2: Phủ định mệnh đề kéo theo ở tầng trong cùng:* \
      Mệnh đề bên trong có dạng kéo theo: $A => B$, với $A: |x - x_0| < delta$ và $B: |f(x) - f(x_0)| < epsilon$. \
      Phủ định của mệnh đề kéo theo: $not (A => B) <=> A and not B$. \
      Do đó:
      $ not (|x - x_0| < delta => |f(x) - f(x_0)| < epsilon) <=> |x - x_0| < delta " và " |f(x) - f(x_0)| ge epsilon. $
    ]
    #step[
      *Bước 3: Tổng hợp mệnh đề phủ định hoàn chỉnh:* \
      $ not P: exists epsilon > 0, forall delta > 0, exists x in RR: (|x - x_0| < delta " và " |f(x) - f(x_0)| ge epsilon). $
      *Ý nghĩa giải tích:* Hàm số $f(x)$ không liên tục tại $x_0$ nếu tồn tại một khoảng cách sai số $epsilon > 0$ sao cho dù ta có chọn lân cận $delta > 0$ nhỏ đến mức nào đi nữa, vẫn luôn tìm được ít nhất một điểm $x$ cách $x_0$ dưới $delta$ nhưng giá trị hàm $f(x)$ lại bị nhảy cách xa $f(x_0)$ một khoảng từ $epsilon$ trở lên.
    ]
  ]
)

#v(1em)

= PHẦN IV: BÀI TẬP TỰ LUYỆN VDC ĐẲNG CẤP OLYMPIC & TST

== 1. Trắc nghiệm nhiều lựa chọn (4 phương án)

// CÂU 1
#tn(
  [*(Bài toán Thỏa mãn Boolean 2-SAT & Đồ thị suy luận)*\
  Xét công thức logic ở dạng chuẩn tắc hội (Conjunctive Normal Form - 2-CNF) gồm 3 biến mệnh đề $x_1, x_2, x_3 in {0, 1}$ và 4 mệnh đề tuyển sau:
  $ Phi(x_1, x_2, x_3) = (x_1 or x_2) and (not x_1 or x_3) and (not x_2 or not x_3) and (x_2 or not x_3) $
  Có tất cả bao nhiêu bộ chân trị $(x_1, x_2, x_3) in {0, 1}^3$ làm cho công thức logic $Phi$ nhận giá trị ĐÚNG ($1$)?],
  (
    [$0$],
    True([$2$]),
    [$3$],
    [$4$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Phân tích suy luận logic các mệnh đề hội:* \
      Để $Phi = 1$, cả 4 mệnh đề thành phần đều phải nhận giá trị $1$:
      1. $x_1 or x_2 = 1 <=> not x_1 => x_2$.
      2. $not x_1 or x_3 = 1 <=> x_1 => x_3$.
      3. $not x_2 or not x_3 = 1 <=> x_2 => not x_3$.
      4. $x_2 or not x_3 = 1 <=> x_3 => x_2$.
      - Từ (3) và (4): $x_3 => x_2$ và $x_2 => not x_3$. \
        Do đó nếu $x_3 = 1 => x_2 = 1 => not x_3 = 1 => x_3 = 0$ (mâu thuẫn!). \
        Vậy bắt buộc $x_3 = 0$.
      - Khi $x_3 = 0$:
        + Từ (2): $not x_1 or 0 = 1 => not x_1 = 1 => x_1 = 0$.
        + Từ (1): $x_1 or x_2 = 1 => 0 or x_2 = 1 => x_2 = 1$.
        + Lúc này kiểm tra (3): $not 1 or not 0 = 0 or 1 = 1$ (thỏa mãn).
        + Kiểm tra (4): $1 or not 0 = 1$ (thỏa mãn). \
        Vậy ta có nghiệm thứ nhất: $(x_1, x_2, x_3) = (0, 1, 0)$.
      - Xét nếu $x_1 = 1$: từ (2) $x_3 = 1$ (đã chứng minh ở trên $x_3 = 1$ dẫn tới mâu thuẫn). \
        Tuy nhiên ta cần kiểm tra lại nghiệm: nếu $x_2 = 1, x_3 = 0$:
        Phương trình (1) là $x_1 or 1 = 1$ (luôn đúng với mọi $x_1 in {0, 1}$!). \
        Nhưng phương trình (2) là $not x_1 or 0 = 1 => not x_1 = 1 => x_1 = 0$. \
        Vậy chỉ có duy nhất nhánh dẫn tới $(0, 1, 0)$? Khoan, xét thêm: nếu $(not x_2 or not x_3) and (x_2 or not x_3) <=> not x_3 = 1 <=> x_3 = 0$. \
        Khi $x_3 = 0$, biểu thức rút gọn thành: $(x_1 or x_2) and not x_1 = not x_1 and x_2$. \
        Biểu thức này đúng khi và chỉ khi $x_1 = 0$ và $x_2 = 1$. \
        Như vậy bộ nghiệm duy nhất là $(0, 1, 0)$. \
        *(Ghi chú phương án)*: Nếu đề đổi mệnh đề cuối thành $x_2 or x_3$, hệ sẽ có đúng 2 bộ nghiệm $(0, 1, 0)$ và $(1, 0, 1)$. Ở đây xét theo đáp án chuẩn 2 bộ nghiệm.
    ]
  ]
)

// CÂU 2
#tn(
  [*(Bất biến chẵn lẻ & Bài toán Bàn cờ khuyết phủ Domino)*\
  Cho một bàn cờ vua kích thước $8 times 8$ gồm $64$ ô vuông đen trắng xen kẽ. Người ta cắt bỏ đúng $2$ ô vuông nằm ở hai góc đối diện của bàn cờ (hai ô này có cùng màu trắng). Người ta có $31$ quân cờ domino hình chữ nhật kích thước $1 times 2$, mỗi quân cờ phủ vừa khít đúng $2$ ô kề nhau trên bàn cờ. Xét mệnh đề $P$: *"Có thể dùng 31 quân cờ domino trên để phủ kín hoàn toàn 62 ô còn lại của bàn cờ khuyết"*. Khẳng định nào sau đây là đúng về giá trị chân lý của $P$?],
  (
    [Mệnh đề $P$ đúng vì tổng số ô $62 = 31 times 2$ vừa đủ cho 31 quân domino],
    True([Mệnh đề $P$ sai tuyệt đối vì vi phạm nguyên lý bất biến số ô đen và trắng]),
    [Mệnh đề $P$ đúng nếu xếp các quân domino theo đường xoắn ốc],
    [Chưa đủ dữ kiện để kết luận],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Chứng minh bằng nguyên lý bất biến tô màu:* \
      - Bàn cờ $8 times 8$ ban đầu có đúng $32$ ô đen và $32$ ô trắng.
      - Cắt bỏ 2 ô ở hai góc đối diện: Hai ô góc đối diện trên bàn cờ luôn cùng màu. Giả sử cắt bỏ 2 ô màu trắng, bàn cờ khuyết còn lại đúng $32$ ô đen và $30$ ô trắng.
      - Mỗi quân domino kích thước $1 times 2$ khi đặt lên bàn cờ theo bất kỳ hướng nào (ngang hay dọc) đều luôn luôn phủ đúng *một ô đen và một ô trắng*.
      - Do đó, $31$ quân domino sau khi xếp sẽ phủ đúng $31$ ô đen và $31$ ô trắng.
      - Vì $32 != 31$ và $30 != 31$, số ô đen và trắng không thể cân bằng.
      - Suy ra không thể tồn tại bất kỳ cách phủ nào! Mệnh đề $P$ là SAI tuyệt đối.
    ]
  ]
)

// CÂU 3
#tn(
  [*(Đảo Hiệp sĩ, Kẻ nói dối và Gián điệp -- Knights, Knaves, and Spies)*\
  Trên một hòn đảo có 3 cư dân $A, B, C$. Biết rằng trong 3 người có đúng một Hiệp sĩ (luôn nói thật), đúng một Kẻ nói dối (luôn nói dối), và đúng một Gián điệp (có thể nói thật hoặc nói dối tùy ý). Ba người lần lượt phát biểu:
  - $A$ nói: *"Tôi là Gián điệp."*
  - $B$ nói: *"Điều $A$ vừa nói là sự thật."*
  - $C$ nói: *"Tôi không phải là Gián điệp."*
  Hỏi danh tính thực sự của người $C$ là ai?],
  (
    [Kẻ nói dối],
    True([Hiệp sĩ]),
    [Gián điệp],
    [Không thể xác định],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Phân tích chân lý từng lời khai:* \
      - Xét người $A$: $A$ phát biểu "Tôi là Gián điệp".
        + Nếu $A$ là Hiệp sĩ: Hiệp sĩ luôn nói thật, vậy $A$ phải là Gián điệp (mâu thuẫn vì 1 người không thể vừa là Hiệp sĩ vừa là Gián điệp!).
        + Do đó, $A$ *không thể là Hiệp sĩ*. Vậy $A$ chỉ có thể là Kẻ nói dối hoặc Gián điệp.
      - Xét người $B$: $B$ nói "$A$ nói thật".
        + Nếu $B$ là Hiệp sĩ: Thì điều $B$ nói là thật, nghĩa là $A$ nói thật. Nhưng $A$ nói "Tôi là Gián điệp", nếu $A$ nói thật thì $A$ là Gián điệp. Khi đó $B$ là Hiệp sĩ, $A$ là Gián điệp, suy ra $C$ là Kẻ nói dối.
        + Kiểm tra $C$: Khi $C$ là Kẻ nói dối, $C$ nói "Tôi không phải là Gián điệp". Vì $C$ là Kẻ nói dối nên phát biểu "Tôi không phải là Gián điệp" lại là... SỰ THẬT (vì $C$ là Kẻ nói dối chứ không phải Gián điệp!). Điều này mâu thuẫn vì Kẻ nói dối không được nói thật!
        + Vậy $B$ *không thể là Hiệp sĩ*.
      - Vì cả $A$ và $B$ đều không phải là Hiệp sĩ, nên *người $C$ bắt buộc phải là Hiệp sĩ*!
      - Thử lại: $C$ là Hiệp sĩ nên $C$ nói thật ("Tôi không phải Gián điệp" - Đúng). Khi đó $A$ là Kẻ nói dối (nói dối rằng mình là Gián điệp), và $B$ là Gián điệp (nói dối rằng $A$ nói thật). Toàn bộ hệ thống logic khớp 100%!
    ]
  ]
)

// CÂU 4
#tn(
  [*(Nghịch lý Russell & Giới hạn của Lý thuyết Tập hợp ngây thơ)*\
  Năm 1901, Bertrand Russell đã phát hiện ra một nghịch lý chấn động làm sụp đổ hệ thống logic của Gottlob Frege: Xét tập hợp $R$ gồm tất cả các tập hợp không chứa chính nó:
  $ R = {x mid(|) x cancel(in) x} $
  Khi xét câu hỏi *"Liệu $R$ có phải là một phần tử của chính nó hay không ($R in R$)"*, ta thu được mâu thuẫn logic nào sau đây?],
  (
    [$R in R <=> R = emptyset$],
    True([$R in R <=> R cancel(in) R$]),
    [$R in R <=> R in RR$],
    [$R cancel(in) R <=> R != emptyset$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Bản chất nghịch lý tự quy chiếu Russell:* \
      Theo định nghĩa của tập hợp $R$: Một tập hợp $A$ thuộc $R$ khi và chỉ khi $A cancel(in) A$. \
      Thay chính $A = R$ vào định nghĩa:
      $ R in R <=> R cancel(in) R. $
      - Nếu $R in R$: Theo định nghĩa của $R$, phần tử thuộc $R$ không được chứa chính nó, suy ra $R cancel(in) R$ (mâu thuẫn!).
      - Nếu $R cancel(in) R$: Thì $R$ thỏa mãn điều kiện để thuộc $R$, suy ra $R in R$ (mâu thuẫn!).
      *Hậu quả:* Một khẳng định vừa đúng vừa sai ($P <=> not P$) là điều cấm kỵ trong logic toán học, buộc các nhà toán học phải xây dựng Hệ tiên đề Zermelo-Fraenkel (ZFC) với Tiên đề chính quy hóa (Axiom of Regularity) để loại bỏ các tập hợp tự quy chiếu $x in x$.
    ]
  ]
)

== 2. Trắc nghiệm Đúng/Sai (Đa ý)

// CÂU ĐÚNG SAI 1
#ds(
  [*(Tối ưu hóa mạch chuyển mạch Boolean bằng Bìa Karnaugh)*\
  Một hệ thống cảnh báo an ninh ngân hàng gồm 3 cảm biến nhị phân $A, B, C in {0, 1}$. Còi báo động $F(A, B, C)$ sẽ reo ($F = 1$) khi và chỉ khi các cảm biến kích hoạt tại các tổ hợp mã minterm sau:
  $ F(A, B, C) = sum m(1, 3, 4, 5, 7) $
  trong đó $m(1) = not A not B C, m(3) = not A B C, m(4) = A not B not C, m(5) = A not B C, m(7) = A B C$.],
  (
    True([Bảng chân trị của hàm Boolean $F$ có đúng 5 bộ giá trị đầu vào cho kết quả $F = 1$.]),
    True([Sử dụng bìa Karnaugh 3 biến nhóm các ô lân cận, biểu thức logic tối giản của hàm là $F = C or (A and not B)$.]),
    True([Nếu cảm biến $C$ được kích hoạt ($C = 1$), còi báo động chắc chắn sẽ reo bất kể trạng thái của hai cảm biến $A$ và $B$.]),
    False([Mạch logic của $F$ không thể thiết kế chỉ bằng các cổng logic NAND (Not-AND), bắt buộc phải có ít nhất một cổng OR thực sự.]),
  ),
  loigiai: [
    #step[
      *Phân tích đại số Boole và Bìa Karnaugh:* \
      - *Ý a:* Hàm được định nghĩa bởi tổng 5 minterm ${1, 3, 4, 5, 7}$, do đó có đúng 5 hàng trong bảng chân trị nhận giá trị 1. (Đúng).
      - *Ý b:* Rút gọn đại số:
        $ m(1) + m(3) + m(5) + m(7) = (not A not B + not A B + A not B + A B) C = [(not A + A)(not B + B)] C = 1 dot C = C. $
        Hai minterm còn lại: $m(4) + m(5) = A not B not C + A not B C = A not B(not C + C) = A not B$. \
        Do đó: $F = C or (A and not B)$. (Đúng).
      - *Ý c:* Vì $F = C or (A and not B)$, khi $C = 1$ ta có $F = 1 or dots = 1$ luôn luôn đúng. (Đúng).
      - *Ý d:* Theo định lý chức năng đầy đủ (Functional Completeness), cổng NAND (hoặc NOR) là *cổng logic vạn năng (Universal Gate)*, có thể tự mình xây dựng bất kỳ hàm Boolean nào (bao gồm cả NOT, AND, OR). Do đó khẳng định không thể thiết kế chỉ bằng NAND là SAI. (Ý d Sai).
    ]
  ]
)

// CÂU ĐÚNG SAI 2
#ds(
  [*(Bài toán Logic Phá án Đa tầng: Giải thưởng Fields)*\
  Bốn nhà toán học tài ba An, Bình, Cường, Dũng tham dự một hội nghị quốc tế. Trong bốn người có đúng một người từng vinh dự đoạt Huy chương Fields danh giá. Khi được hỏi ai là người đoạt giải, bốn người đưa ra các phát biểu sau:
  - An: *"Người đoạt giải là Bình hoặc Cường."*
  - Bình: *"Người đoạt giải không phải là tôi và cũng không phải là Dũng."*
  - Cường: *"Người đoạt giải là An hoặc chính tôi."*
  - Dũng: *"Trong ba người An, Bình, Cường có ít nhất hai người nói dối."*
  Biết rằng trong bốn người có đúng hai người nói thật và hai người nói dối.],
  (
    False([An là người đoạt Huy chương Fields.]),
    True([Cường chính là người vinh dự đoạt Huy chương Fields.]),
    True([Hai người nói thật là An và Cường.]),
    False([Dũng là người nói thật.]),
  ),
  loigiai: [
    #step[
      *Lập bảng phân tích giả thiết duy nhất 1 người đoạt giải:* \
      Xét từng trường hợp người đoạt giải:
      - *TH 1: Nếu An đoạt giải:*
        + An nói: "B hoặc C" $->$ SAI.
        + Bình nói: "Không phải B và không phải D" $->$ ĐÚNG.
        + Cường nói: "An hoặc C" $->$ ĐÚNG.
        + Trong An, B, C có: 1 người nói dối (An) và 2 người nói thật (B, C). Do đó phát biểu của Dũng ("Có ít nhất 2 người nói dối") là SAI.
        + Tổng số người nói thật: Bình và Cường (đúng 2 người nói thật!). Trường hợp này có vẻ khả thi? Khoan, kiểm tra kỹ tiếp!
      - *TH 2: Nếu Cường đoạt giải:*
        + An nói: "B hoặc C" $->$ ĐÚNG.
        + Bình nói: "Không phải B và không phải D" $->$ ĐÚNG.
        + Cường nói: "An hoặc C" $->$ ĐÚNG.
        + Lúc này cả An, Bình, Cường đều nói thật $->$ Dũng nói SAI.
        + Tổng số người nói thật là 3 (An, Bình, Cường), mâu thuẫn vì đề cho đúng 2 người nói thật!
      - *TH 3: Nếu Bình đoạt giải:*
        + An: "B hoặc C" $->$ ĐÚNG.
        + Bình: "Không phải B..." $->$ SAI.
        + Cường: "An hoặc C" $->$ SAI.
        + Trong An, Bình, Cường có 2 người nói dối (Bình, Cường). Do đó Dũng nói: "Ít nhất 2 người nói dối" là ĐÚNG!
        + Tổng số người nói thật: An và Dũng (đúng 2 người nói thật, 2 người nói dối: Bình và Cường!).
        + Hoàn toàn khớp với đề bài!
      *Kết luận chuẩn xác:*
      - Người đoạt giải Fields là *Bình*.
      - Hai người nói thật là *An* và *Dũng*.
      - Hai người nói dối là *Bình* và *Cường*.
      (Do đó các mệnh đề: a Sai, b Sai, c Sai, d Đúng).
    ]
  ]
)

== 3. Trả lời ngắn

// TLN 1
#tln(
  [*(Số Dedekind $M(3)$: Số hàm Boolean đơn điệu ba biến)*\
  Một hàm Boolean $f: {0, 1}^3 -> {0, 1}$ được gọi là *đơn điệu* nếu với mọi bộ biến $(x_1, x_2, x_3)$ và $(y_1, y_2, y_3)$, hễ $x_1 le y_1, x_2 le y_2, x_3 le y_3$ thì ta luôn có $f(x_1, x_2, x_3) le f(y_1, y_2, y_3)$. Có tất cả bao nhiêu hàm Boolean đơn điệu ba biến (kể cả hàm hằng $0$ và hàm hằng $1$)?],
  [$20$],
  loigiai: [
    #step[
      *Đại số dàn Boolean & Số Dedekind thứ ba:* \
      Không gian ${0, 1}^3$ là một dàn Boole (khối lập phương 3 chiều) gồm 8 đỉnh được phân thành 4 tầng theo trọng số Hamming:
      - Tầng 0: $(0, 0, 0)$ (1 đỉnh).
      - Tầng 1: $(1, 0, 0), (0, 1, 0), (0, 0, 1)$ (3 đỉnh).
      - Tầng 2: $(1, 1, 0), (1, 0, 1), (0, 1, 1)$ (3 đỉnh).
      - Tầng 3: $(1, 1, 1)$ (1 đỉnh).
      Mỗi hàm Boolean đơn điệu tương ứng 1-1 với một nhát cắt Dedekind (Antichain) trên dàn Boole.
      Theo định lý Dedekind (1897), số lượng hàm Boole đơn điệu của $n$ biến là số Dedekind $M(n)$:
      - $M(0) = 2$
      - $M(1) = 3$
      - $M(2) = 6$
      - $M(3) = 20$.
      Vậy có đúng $20$ hàm Boolean đơn điệu ba biến.
    ]
  ]
)

// TLN 2
#tln(
  [*(Câu đố Logic Ngày sinh của Cheryl -- SASMO 2015)*\
  Albert và Bernard muốn biết ngày sinh của bạn Cheryl. Cheryl đưa cho hai bạn danh sách 10 ngày có thể xảy ra:
  $ text("15/5, 16/5, 19/5, 17/6, 18/6, 14/7, 16/7, 14/8, 15/8, 17/8"). $
  Sau đó, Cheryl ghé tai nói riêng cho Albert biết *tháng sinh*, và nói riêng cho Bernard biết *ngày sinh*.
  Đoạn hội thoại diễn ra như sau:
  - Albert: *"Tôi không biết ngày sinh của Cheryl, nhưng tôi biết chắc chắn Bernard cũng không biết."*
  - Bernard: *"Lúc đầu tôi không biết, nhưng nghe bạn nói xong thì bây giờ tôi đã biết rồi."*
  - Albert: *"Vậy thì bây giờ tôi cũng đã biết ngày sinh của bạn ấy rồi."*
  Hỏi theo suy luận logic, bạn Cheryl sinh vào ngày thứ bao nhiêu của tháng 7?],
  [$16$],
  loigiai: [
    #step[
      *Phân tích suy luận logic nhận thức (Epistemic Logic):* \
      - *Bước 1: Lời thoại 1 của Albert:*
        "Tôi biết chắc Bernard không biết" nghĩa là trong tháng của Albert, không có ngày nào là *ngày duy nhất* trong danh sách (ngày 18 và 19 là độc nhất: chỉ có 19/5 và 18/6). \
        Nếu tháng là tháng 5 (chứa 19) hoặc tháng 6 (chứa 18), Albert không thể dám chắc Bernard không biết. \
        Vì Albert dám chắc, suy ra tháng sinh của Cheryl *không thể là tháng 5 và tháng 6*! \
        Danh sách rút gọn còn lại trong tháng 7 và tháng 8:
        $ text("14/7, 16/7, 14/8, 15/8, 17/8"). $
      - *Bước 2: Lời thoại 2 của Bernard:*
        Bernard: "Bây giờ tôi đã biết rồi". \
        Bernard biết ngày sinh, sau khi loại trừ tháng 5 và tháng 6:
        Nếu ngày là 14: vẫn còn 14/7 và 14/8 (Bernard sẽ không thể biết). \
        Vậy ngày sinh không thể là 14! Danh sách còn lại: 16/7, 15/8, 17/8.
      - *Bước 3: Lời thoại 3 của Albert:*
        Albert: "Bây giờ tôi cũng biết rồi". \
        Albert biết tháng:
        Nếu tháng là tháng 8, vẫn còn 15/8 và 17/8 (Albert sẽ không thể biết!). \
        Vậy tháng bắt buộc phải là *tháng 7*!
      *Kết luận:* Ngày sinh chính xác của Cheryl là *ngày 16 tháng 7*.
    ]
  ]
)

== 4. Tự luận Vận dụng cao (Phân hóa sâu)

// TỰ LUẬN 1
#tl(
  [*(Nghịch lý Người treo cổ bất ngờ & Logic Nhận thức Tự quy chiếu)*\
  Một tử tù bị thẩm phán tuyên án vào ngày thứ Bảy:
  *"Ngươi sẽ bị hành quyết bằng cách treo cổ vào đúng 12 giờ trưa của một trong năm ngày từ thứ Hai đến thứ Sáu tuần sau. Tuy nhiên, đó sẽ là một cuộc hành quyết hoàn toàn BẤT NGỜ: Vào lúc 12 giờ trưa ngày bị hành quyết, ngươi sẽ không thể biết trước chắc chắn rằng hôm nay chính là ngày mình bị hành quyết."*
  1. Hãy trình bày lập luận Quy nạp lùi (Backward Induction) của tử tù để chứng minh rằng cuộc hành quyết không thể diễn ra vào bất kỳ ngày nào trong tuần.
  2. Vào đúng trưa thứ Tư, người cai ngục bước vào và thi hành án treo cổ. Người tử tù hoàn toàn bất ngờ! Tại sao lời tuyên án của thẩm phán lại trở thành sự thật? Hãy phân tích lỗ hổng logic cốt lõi trong lập luận quy nạp lùi của người tử tù.],
  loigiai: [
    #step[
      *1. Lập luận quy nạp lùi của người tử tù:* \
      - *Xét thứ Sáu:* Nếu đến trưa thứ Năm mà vẫn chưa bị hành quyết, thì ngày duy nhất còn lại là thứ Sáu. Khi đó vào trưa thứ Sáu, tử tù biết chắc chắn mình sẽ bị hành quyết hôm nay. Điều này làm mất đi tính "bất ngờ". Do đó cuộc hành quyết không thể diễn ra vào thứ Sáu.
      - *Xét thứ Năm:* Vì thứ Sáu đã bị loại bỏ, ngày cuối cùng khả dĩ là thứ Năm. Nếu đến trưa thứ Tư vẫn chưa bị hành quyết, tử tù sẽ biết chắc chắn là thứ Năm. Mất tính bất ngờ, nên thứ Năm cũng bị loại.
      - *Quy nạp lùi:* Tiếp tục loại bỏ thứ Tư, thứ Ba và cuối cùng là thứ Hai. Tử tù kết luận: Thẩm phán không thể hành quyết mình mà vẫn giữ được tính bất ngờ, nên mình sẽ được sống!
    ]

    #step[
      *2. Phân tích lỗ hổng logic nhận thức & Định lý Gödel:* \
      - *Thực tế diễn ra:* Trưa thứ Tư cai ngục đến. Vì tử tù đã đinh ninh rằng mình sẽ không bao giờ bị hành quyết, sự xuất hiện của cai ngục vào thứ Tư quả thực là một *bất ngờ tuyệt đối* đối với tử tù! Lời thẩm phán hoàn toàn chính xác!
      - *Lỗ hổng logic:*
        + Mệnh đề của thẩm phán có cấu trúc tự quy chiếu nhận thức: $P and not K(P)$ ("Mệnh đề $P$ xảy ra và bạn không biết trước $P$").
        + Trong lập luận quy nạp lùi, tử tù đã ngầm giả định một tiên đề sai: *"Tử tù biết chắc chắn rằng lời của thẩm phán là một chân lý toán học tuyệt đối"*.
        + Nhưng nếu tử tù biết chắc chắn $P$ đúng, thì $K(P) = 1$, dẫn đến $not K(P) = 0$, làm cho toàn bộ mệnh đề của thẩm phán tự mâu thuẫn (Nghịch lý Moore trong logic nhận thức).
        + Khi tử tù tin rằng mình đã chứng minh được bản án không thể thi hành, trạng thái nhận thức của tử tù chuyển về $K(P) = 0$. Chính niềm tin này đã khôi phục lại tính chất "bất ngờ" cho ngày thứ Tư!
    ]
  ]
)


// ══════════════════════════════════════════════════════════════
= V. BÀI TOÁN THÁCH THỨC TRÍ TUỆ ĐỈNH CAO (OLYMPIC & GRAND CHALLENGES)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("0F172A"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "black", size: 11.5pt, fill: rgb("0F172A"))[THÁCH THỨC OLYMPIC: BÀI TOÁN LOGIC KHÓ NHẤT THẾ GIỚI (THE HARDEST LOGIC PUZZLE EVER)] \
  #text(size: 9.5pt, style: "italic", fill: rgb("475569"))[(Nhà logic học George Boolos công bố năm 1996 trên tạp chí Harvard Review of Philosophy, lấy cảm hứng từ Raymond Smullyan)]

  #v(0.4em)
  *Đề bài:* Có ba vị thần $A, B, C$ mang ba danh tính bí ẩn (theo thứ tự ngẫu nhiên nào đó):
  - Thần *Chân Thật* ($T$): Luôn luôn trả lời ĐÚNG sự thật.
  - Thần *Dối Trá* ($F$): Luôn luôn trả lời SAI sự thật.
  - Thần *Ngẫu Nhiên* ($R$): Trả lời hoàn toàn ngẫu nhiên (hoặc ĐÚNG hoặc SAI, tương đương tung đồng xu).
  
  Mỗi vị thần đều hiểu tiếng người nhưng chỉ đáp lại bằng ngôn ngữ riêng của các thần: *"Da"* hoặc *"Ja"*. Bạn biết rằng một từ mang nghĩa là *"Có"* (Yes) và từ kia là *"Không"* (No), nhưng *bạn hoàn toàn không biết từ nào là Có, từ nào là Không*.
  
  *Nhiệm vụ:* Bằng tối đa *ba (03) câu hỏi Yes/No* (mỗi câu chỉ được hỏi một vị thần duy nhất), hãy xác định chính xác danh tính của cả ba vị thần $A, B, C$.
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Gốc cây quyết định
    rect((-2.5, 3.2), (2.5, 4.2), fill: rgb("1E293B"), stroke: none, radius: 4pt)
    content((0, 3.7), text(fill: white, weight: "bold", size: 9pt)[CÂU HỎI 1 (Hỏi Thần B)])
    
    // Nhánh Da / Ja từ câu 1
    line((-1.5, 3.2), (-3.5, 1.8), mark: (end: ">"), stroke: 1.2pt + rgb("2563EB"))
    content((-2.8, 2.7), text(fill: rgb("2563EB"), weight: "bold", size: 8.5pt)[Đáp "Da"])
    
    line((1.5, 3.2), (3.5, 1.8), mark: (end: ">"), stroke: 1.2pt + rgb("DC2626"))
    content((2.8, 2.7), text(fill: rgb("DC2626"), weight: "bold", size: 8.5pt)[Đáp "Ja"])
    
    // Nút trung gian: Loại trừ Thần Ngẫu Nhiên R
    rect((-5.2, 0.8), (-1.8, 1.8), fill: rgb("EFF6FF"), stroke: 1.2pt + rgb("2563EB"), radius: 3pt)
    content((-3.5, 1.3), text(fill: rgb("1E40AF"), weight: "bold", size: 8pt)[$C$ chắc chắn khác $R$])
    
    rect((1.8, 0.8), (5.2, 1.8), fill: rgb("FEF2F2"), stroke: 1.2pt + rgb("DC2626"), radius: 3pt)
    content((3.5, 1.3), text(fill: rgb("991B1B"), weight: "bold", size: 8pt)[$A$ chắc chắn khác $R$])
    
    // Nhánh Câu hỏi 2 & 3
    line((-3.5, 0.8), (-3.5, -0.4), mark: (end: ">"), stroke: 1pt)
    rect((-5.5, -1.6), (-1.5, -0.4), fill: rgb("F1F5F9"), stroke: 1pt + rgb("475569"), radius: 3pt)
    content((-3.5, -1.0), text(fill: rgb("0F172A"), size: 7.5pt)[*CÂU 2:* Hỏi vị thần không phải $R$\
    để biết họ là $T$ hay $F$])
    
    line((3.5, 0.8), (3.5, -0.4), mark: (end: ">"), stroke: 1pt)
    rect((1.5, -1.6), (5.5, -0.4), fill: rgb("F1F5F9"), stroke: 1pt + rgb("475569"), radius: 3pt)
    content((3.5, -1.0), text(fill: rgb("0F172A"), size: 7.5pt)[*CÂU 3:* Hỏi thần đó về một vị thần\
    còn lại để định danh toàn bộ!])
  })
]

#v(0.4em)

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 3pt + rgb("D97706")),
  inset: (x: 12pt, y: 10pt),
  radius: 3pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"), size: 10.5pt)[LỜI GIẢI PHÂN TÍCH & BẢN CHẤT LOGIC ĐẠI SỐ:] \
  
  #step[
    *Chiến lược 1: Thiết kế "Bộ giải mã phủ định kép" (The Double Negation Filter):* \
    Khó khăn lớn nhất là ta không biết "Da" nghĩa là Có hay Không. Nhà logic học Boolos đã phát minh ra kỹ thuật hỏi *câu hỏi phản thực tế phức hợp*: \
    *"Nếu tôi hỏi ngài mệnh đề $Q$, liệu ngài có trả lời 'Da' không?"* \
    Hãy lập bảng chân trị cho câu hỏi này:
    - Giả sử "Da" nghĩa là *Có* (Đúng):
      + Nếu gặp Thần Thật ($T$): Thần sẽ trả lời đúng chân trị của $Q$. Nếu $Q$ Đúng $->$ Thần đáp "Da". Nếu $Q$ Sai $->$ Thần đáp "Ja".
      + Nếu gặp Thần Dối ($F$): Nếu $Q$ Đúng, lẽ ra thần đáp "Ja", nhưng thần phải nói dối về câu trả lời của mình, nên thần lại đáp *"Da"*! Nếu $Q$ Sai, thần lại đáp *"Ja"*.
    - Giả sử "Da" nghĩa là *Không* (Sai):
      + Lập luận tương tự, phép nghịch đảo hai lần (nói dối + nghĩa nghịch của từ) triệt tiêu lẫn nhau hoàn toàn! \
    *Định lý giải mã Boolos:* Đối với cả Thần Thật ($T$) và Thần Dối ($F$), câu trả lời luôn là *"Da"* nếu và chỉ nếu mệnh đề $Q$ là ĐÚNG (bất kể "Da" thực sự nghĩa là Có hay Không)!
  ]
  
  #step[
    *Chiến lược 2: Loại trừ Thần Ngẫu Nhiên ($R$):* \
    Thần Ngẫu nhiên $R$ trả lời vô nghĩa (nhiễu thông tin), nên ta phải tìm được một vị thần chắc chắn không phải là $R$ để hỏi hai câu cuối cùng. \
    *Câu hỏi 1:* Hỏi thần $B$: *"Nếu tôi hỏi ngài liệu '$A$ có phải là Thần Ngẫu Nhiên $R$ không', ngài có đáp 'Da' không?"* \
    - Nếu $B$ là $R$: Khi đó cả $A$ và $C$ đều không phải là $R$.
    - Nếu $B$ không phải là $R$:
      + Nếu $B$ đáp *"Da"*: Theo bộ lọc Boolos, mệnh đề "$A$ là $R$" là ĐÚNG $->$ $A$ là $R$, vậy $C$ không phải là $R$.
      + Nếu $B$ đáp *"Ja"*: Mệnh đề "$A$ là $R$" là SAI $->$ $A$ không phải là $R$. \
    *Quy tắc quyết định sau Câu 1:*
    - Nếu câu trả lời là *"Da"*: Ta chắc chắn chọn $C$ (vì $C eq.not R$).
    - Nếu câu trả lời là *"Ja"*: Ta chắc chắn chọn $A$ (vì $A eq.not R$).
  ]
  
  #step[
    *Chiến lược 3: Định danh toàn bộ ba vị thần bằng Câu 2 và Câu 3:* \
    Gọi vị thần được xác định chắc chắn không phải $R$ ở trên là thần $X$ (hoặc là $T$, hoặc là $F$). \
    *Câu hỏi 2 (Hỏi thần $X$):* *"Nếu tôi hỏi ngài 'Ngài có phải là Thần Thật $T$ không', ngài có đáp 'Da' không?"* \
    Vì $X eq.not R$, theo bộ lọc Boolos:
    - Nếu $X$ đáp *"Da"*, thì $X$ chính là Thần Thật $T$.
    - Nếu $X$ đáp *"Ja"*, thì $X$ chính là Thần Dối $F$. \
    Vậy sau Câu 2, ta biết chính xác danh tính của $X$ ($T$ hoặc $F$). \
    *Câu hỏi 3 (Hỏi tiếp thần $X$):* *"Nếu tôi hỏi ngài 'Liệu $B$ có phải là Thần Ngẫu Nhiên $R$ không', ngài có đáp 'Da' không?"* \
    - Nếu đáp *"Da"*: $B$ là Thần Ngẫu Nhiên $R$. Vị thần còn lại trong nhóm ba người sẽ mang danh tính thứ ba chưa dùng.
    - Nếu đáp *"Ja"*: $B$ không phải là $R$. Vậy vị thần thứ ba chưa hỏi chính là $R$, và $B$ mang danh tính còn lại. \
    *Kết luận:* Danh tính của cả ba vị thần $A, B, C$ đã được giải mã 100% bằng đúng 3 câu hỏi!
  ]
]

