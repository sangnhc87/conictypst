#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

// ── Heading styles ───────────────────────────────────────
#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0D47A1"), rgb("1565C0"), rgb("1976D2"), angle: 90deg),
  stroke: none,
  inset: (x: 16pt, y: 12pt),
  radius: 6pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("C62828")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("C62828"), size: 12.5pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("2E7D32")),
  inset: (left: 8pt, y: 4pt),
  text(fill: rgb("2E7D32"), size: 11.5pt, weight: "bold", it.body),
)

// ── Chế độ in ─────────────────────────────────────────────
#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ── Màu chủ đề ───────────────────────────────────────────
#let col-blue = rgb("0D47A1")
#let col-red = rgb("C62828")
#let col-green = rgb("2E7D32")
#let col-amber = rgb("E65100")
#let col-teal = rgb("00695C")
#let col-bg-lt = rgb("E3F2FD")
#let col-bg-red = rgb("FFEBEE")
#let col-bg-grn = rgb("E8F5E9")
#let col-bg-amb = rgb("FFF3E0")

// ── Hộp lý thuyết tùy chỉnh ───────────────────────────────
#let theory-box(title: none, color: col-blue, bg: col-bg-lt, body) = block(
  fill: bg,
  stroke: (left: 4pt + color, rest: 0.7pt + color.lighten(50%)),
  radius: (right: 6pt),
  inset: (x: 15pt, y: 13pt),
  width: 100%,
  below: 1em,
)[
  #if title != none [
    #text(weight: "bold", fill: color, size: 11pt)[#title]
    #v(0.5em)
  ]
  #body
]

#let ppgiai(title: none, body) = theory-box(title: title, color: col-amber, bg: col-bg-amb, body)
#let lythuyet(title: none, body) = theory-box(title: title, color: col-teal, bg: col-bg-lt, body)

// ═══════════════════════════════════════════════════════════
// PHẦN CHUYÊN ĐỀ LÃI SUẤT
// ═══════════════════════════════════════════════════════════
= Chuyên đề: Đại Bác Vạn Năng - Chinh Phục Mọi Bài Toán Lãi Suất

== I. Lý Thuyết "Đại Bác Vạn Năng" (Bản Chất Dòng Tiền)

#lythuyet(title: [1. Bản chất Lãi đẻ Lãi (Quy tắc Nuôi Heo Đất)])[
  Bí kíp để không bao giờ phải học thuộc công thức là hãy coi ngân hàng giống như một chuồng nuôi heo.
  - Mỗi khi bạn ném một cục tiền $P$ vào ngân hàng, nó tự động "ăn" lãi suất $r$ và béo lên theo thời gian. Sau $n$ tháng, nó sẽ phình to thành:
  #align(center)[$ A = P (1 + r)^n $]
  
  *Vũ khí tối thượng (Đại Bác Vạn Năng):* 
  #align(center)[
    #text(fill: red, weight: "bold", size: 12pt)[
      "Cứ có tiền đưa vào ngân hàng là nó TỰ ĐỘNG sinh lãi tính từ lúc gửi cho đến ngày chốt sổ."
    ]
  ]
  
  Khi làm bài toán vay mượn hay trả góp, ta chỉ cần "chốt sổ" ở tháng cuối cùng và lập phương trình:
  #align(center)[*Tổng cục Nợ đã phình to* $=$ *Tổng các cục tiền Trả Góp đã phình to*]
  
  *SƠ ĐỒ VẠN NĂNG (Bức tranh duy nhất cần nhớ)*
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      // Dòng tiền vay (Bên trên)
      line((0, 0), (12, 0), mark: (end: ">"))
      for (i, label) in ((0, "T0"), (2, "T1"), (4, "T2"), (10, "Tn-1"), (12, "Tn")) {
        line((i, 0.2), (i, -0.2))
        content((i, 0), anchor: "north", padding: 0.2, [*#label*])
      }
      content((7, 0), [.....])
      
      content((0, 0.5), text(blue)[$+P$ (Cục Nợ)])
      line((0, 1), (12, 1), stroke: (paint: blue, dash: "dashed"), mark: (end: ">"))
      content((13.2, 1), text(blue)[$P(1+r)^n$])
      
      // Dòng tiền trả (Bên dưới)
      content((2, -0.8), text(red)[$-X$ (Trả)])
      content((4, -0.8), text(red)[$-X$ (Trả)])
      content((10, -0.8), text(red)[$-X$ (Trả)])
      content((12, -0.8), text(red)[$-X$ (Trả)])
      
      line((2, -1.3), (12, -1.3), stroke: (paint: red, dash: "dashed"), mark: (end: ">"))
      content((13.5, -1.3), text(red)[$X(1+r)^(n-1)$])
      
      line((4, -1.9), (12, -1.9), stroke: (paint: red, dash: "dashed"), mark: (end: ">"))
      content((13.5, -1.9), text(red)[$X(1+r)^(n-2)$])
      
      line((10, -2.5), (12, -2.5), stroke: (paint: red, dash: "dashed"), mark: (end: ">"))
      content((13.5, -2.5), text(red)[$X(1+r)^1$])
      
      circle((12, -3.1), radius: 0)
      content((13.5, -3.1), text(red)[$X(1+r)^0 = X$])
      
      content((13.5, 0), [*= Chốt Sổ =*])
    })
  ]
]

#ppgiai(title: [2. Công cụ gom tiền: Tổng của Cấp số nhân])[
  Khi bạn trả góp hay gửi tiết kiệm, mỗi tháng bạn lại ném thêm 1 cục tiền mới vào. Gom tất cả chúng lại ở ngày chốt sổ, ta sẽ luôn thu được một dãy tổng cấp số nhân:
  $ S = 1 + q + q^2 + ... + q^(n-1) = (q^n - 1)/(q - 1) $
  Với toán ngân hàng, công bội luôn là $q = 1 + r$ (vì tiền cứ nhân thêm $1+r$ mỗi tháng). Do đó mẫu số $(q - 1) = r$.
]

#lythuyet(title: [3. TỪ SƠ ĐỒ SUY RA CÔNG THỨC VẠN NĂNG])[
  Nhìn vào Sơ đồ Vạn năng ở trên, ta thấy rõ ràng có $n$ dòng tiền trả góp (mũi tên màu đỏ) chạy về điểm "Chốt Sổ".
  Tổng các dòng tiền này tạo thành một cấp số nhân (đọc từ dưới lên):
  $ T = X + X(1+r)^1 + X(1+r)^2 + ... + X(1+r)^(n-1) $
  Áp dụng công thức tổng cấp số nhân (ở mục 2), ta lập tức rút gọn được $T$:
  #align(center)[$ T = X dot ( (1+r)^n - 1 ) / r $]
  
  Từ sự "giác ngộ" biểu thức $T$ ở trên, ta đúc kết ra đúng 2 công thức giải nhanh mọi bài toán trắc nghiệm:
  
  *1. Công thức GỬI ĐỀU (Gửi tiết kiệm mỗi đầu tháng)*
  Vì nộp tiền ở đầu tháng, nên mỗi cục tiền đều được cộng thêm $1$ kỳ hạn sinh lãi so với $T$, ta chỉ việc lấy $T$ nhân thêm $(1+r)$:
  #align(center)[$ A = T (1+r) = X dot (1+r)/r dot [ (1+r)^n - 1 ] $]
  
  *2. Công thức TRẢ ĐỀU (Vay trả góp / Rút hưu trí mỗi cuối tháng)*
  Vì nộp/rút tiền ở cuối tháng nên tổng số tiền tích luỹ y hệt như $T$. 
  Thiết lập phương trình cân bằng với cục Nợ (Mũi tên màu xanh): *Nợ phình to = Tổng tiền nộp phình to*:
  #align(center)[$ P(1+r)^n = X dot ( (1+r)^n - 1 ) / r $]
]

#theory-box(title: [Mẹo CASIO cực hay cho bài toán Trả góp], color: col-red, bg: col-bg-red)[
  Khi vào phòng thi, ta có thể dùng phím `SOLVE` trên máy tính CASIO để tìm nhanh số tiền trả góp hàng tháng $X$ hoặc lãi suất $r$.
  Chỉ cần nhập nguyên xi công thức *Vạn năng 2*:
  $P (1+r)^n = X ( (1+r)^n - 1 ) / r$
  Bấm `SHIFT + CALC (SOLVE)` $->$ ra kết quả ngay lập tức mà không cần biến đổi đại số rút $X$ ra.
]

== II. Năm Dạng Toán Kinh Điển

=== Dạng 1: Gửi tiền một lần (Lãi kép cơ bản)

#tln(
  [Một người gửi tiết kiệm $100$ triệu đồng vào ngân hàng với lãi suất $6%$/năm, kỳ hạn $1$ năm và không rút lãi ra (lãi nhập vốn). Hỏi sau ít nhất bao nhiêu năm thì người đó có được số tiền lớn hơn hoặc bằng $150$ triệu đồng?],
  [7 năm],
  loigiai: [
    #step[Sau $n$ năm, tổng số tiền cả gốc lẫn lãi được tích luỹ là: $A_n = 100(1 + 0.06)^n = 100(1.06)^n$ (triệu đồng).]
    #step[Theo bài ra, ta cần $A_n >= 150 <=> 100(1.06)^n >= 150 <=> (1.06)^n >= 1.5$]
    #step[Lấy logarit cơ số $1.06$ hai vế: $n >= log_(1.06) (1.5) approx 6.958$. \
    Vì $n$ là số nguyên (đại diện cho số năm), ta chọn số nguyên tiếp theo là $n = 7$.]
    #step[Vậy sau ít nhất $7$ năm, người đó sẽ có trên $150$ triệu đồng.]
  ]
)

=== Dạng 2: Gửi tích lũy định kỳ (Gửi góp đầu tháng)

#tln(
  [Một kỹ sư mỗi đầu tháng đều trích $5$ triệu đồng từ tiền lương để gửi tiết kiệm ngân hàng với lãi suất $0.5%$/tháng. Hỏi sau đúng $2$ năm ($24$ tháng) gửi liên tục, người đó nhận được tổng số tiền gốc và lãi là bao nhiêu (làm tròn đến hàng nghìn)?],
  [127.796.000 VNĐ],
  loigiai: [
    #step[*Phân tích bản chất (Đại bác vạn năng):*\
    Tách $24$ khoản tiền nộp ra thành $24$ cục tiền độc lập và tính xem mỗi cục phình to ra sao ở cuối tháng 24:
    - Cục $5$ triệu nộp ở đầu tháng 1: Ở trong ngân hàng đủ $24$ tháng $-> 5(1.005)^24$.\
    - Cục $5$ triệu nộp ở đầu tháng 2: Ở trong ngân hàng $23$ tháng $-> 5(1.005)^23$.\
    - ...\
    - Cục $5$ triệu nộp ở đầu tháng thứ 24: Ở trong ngân hàng đúng $1$ tháng $-> 5(1.005)^1$.]
    #step[
      *Sơ đồ Timeline biến thiên dòng tiền:*
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((0,0), (12,0), mark: (end: ">"))
          for (i, label) in ((0, "T1"), (2, "T2"), (8, "T23"), (10, "T24")) {
            line((i, 0.2), (i, -0.2))
            content((i, -0.6), [*#label*])
            content((i, 0.6), text(red)[$+5"tr"$])
          }
          content((5, 0), [.....])
          content((12.5, -0.6), [*Chốt sổ*])
          
          line((0, 1), (12, 1), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
          content((13.5, 1), [$5(1.005)^24$])
          line((2, 1.6), (12, 1.6), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
          content((13.5, 1.6), [$5(1.005)^23$])
          line((10, 2.2), (12, 2.2), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
          content((13.5, 2.2), [$5(1.005)^1$])
        })
      ]
    ]
    #step[Cộng dồn tất cả lại ở điểm "Chốt sổ", tổng số tiền là một cấp số nhân có $24$ số hạng:\
    $A = 5(1.005)^1 + 5(1.005)^2 + ... + 5(1.005)^24$\
    Sử dụng công thức tổng cấp số nhân: $A = 5(1.005) ( (1.005)^24 - 1 ) / (1.005 - 1) $]
    #step[Bấm máy tính: $A approx 127.7956$ triệu đồng. Làm tròn được $127.796.000$ VNĐ.]
  ]
)

=== Dạng 3: Vay trả góp (Mua nhà, mua xe)

#tln(
  [Anh Bình vay ngân hàng $500$ triệu đồng để mua ô tô với lãi suất $0.8%$/tháng. Anh dự định trả góp hàng tháng, số tiền mỗi tháng như nhau, bắt đầu trả vào cuối tháng thứ nhất. Hỏi anh Bình phải trả bao nhiêu tiền mỗi tháng (làm tròn đến hàng nghìn) để trả hết nợ sau đúng $3$ năm ($36$ tháng)?],
  [16.040.000 VNĐ],
  loigiai: [
    #step[*Phân tích phương trình cân bằng (Đại bác vạn năng):*\
    Ghi nhớ: Quy tất cả tiền về ngày chốt sổ (tháng 36). \
    Phương trình: *Tổng cục Nợ phình to = Tổng các cục tiền Trả phình to*.]
    #step[
    *Vế Trái (Cục nợ phình to):*\
    Ngân hàng đưa anh Bình $500$ triệu. Sau $36$ tháng, cục nợ này tự sinh lãi phình to thành: $N_36 = 500(1.008)^36$.
    ]
    #step[
    *Vế Phải (Tiền trả góp phình to):*\
    Gọi $X$ là số tiền anh Bình nộp vào mỗi *cuối* tháng. 
    - Cục $X$ nộp cuối tháng 1: Nằm trong ngân hàng $35$ tháng còn lại $-> X(1.008)^35$.
    - Cục $X$ nộp cuối tháng 2: Nằm trong ngân hàng $34$ tháng còn lại $-> X(1.008)^34$.
    - ...
    - Cục $X$ nộp cuối tháng 36: Vừa nộp xong là chốt sổ luôn (không kịp sinh thêm lãi) $-> X$.
    
    *Sơ đồ minh hoạ dòng tiền:*
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        line((0, 0), (12, 0), mark: (end: ">"))
        for (i, label) in ((0, "T0"), (2, "T1"), (4, "T2"), (10, "T35"), (12, "T36")) {
          line((i, 0.2), (i, -0.2))
          content((i, -0.5), [*#label*])
        }
        content((7, 0), [.....])
        
        content((0, 0.6), text(blue)[$500$tr (Vay)])
        line((0, 1.2), (12, 1.2), stroke: (paint: blue, dash: "dashed"), mark: (end: ">"))
        content((14, 1.2), text(blue)[$500(1.008)^36$])
        
        content((2, -1.2), text(red)[$X$ (Trả)])
        line((2, -1.8), (12, -1.8), stroke: (paint: red, dash: "dashed"), mark: (end: ">"))
        content((14, -1.8), text(red)[$X(1.008)^35$])
        
        content((4, -2.4), text(red)[$X$ (Trả)])
        line((4, -3.0), (12, -3.0), stroke: (paint: red, dash: "dashed"), mark: (end: ">"))
        content((14, -3.0), text(red)[$X(1.008)^34$])
        
        content((12, -3.6), text(red)[$X$ (Trả)])
        content((14, -3.6), text(red)[$X$])
      })
    ]

    Tổng giá trị các khoản đã trả tích luỹ tại tháng 36 là tổng của cấp số nhân:\
    $T = X + X(1.008)^1 + ... + X(1.008)^35 = X ( (1.008)^36 - 1 ) / 0.008$
    ]
    #step[Thiết lập phương trình cân bằng ($N_36 = T$): \
    $ 500(1.008)^36 = X ( (1.008)^36 - 1 ) / 0.008 => X = (500(1.008)^36 dot 0.008) / ( (1.008)^36 - 1 ) $]
    #step[Bấm máy tính (hoặc gõ Shift SOLVE phương trình ban đầu): $X approx 16.0399$ triệu đồng. Vậy mỗi tháng cần trả khoảng $16.040.000$ VNĐ.]
  ]
)

=== Dạng 4: Quỹ Hưu Trí (Rút tiền đều đặn)

#tln(
  [Bác Cường vừa nghỉ hưu và nhận được khoản tiền trợ cấp $1$ tỷ đồng. Bác gửi toàn bộ vào ngân hàng với lãi suất $0.6%$/tháng. Mỗi cuối tháng, bác rút ra $10$ triệu đồng để chi tiêu sinh hoạt. Hỏi bác Cường có thể rút trọn vẹn số tiền $10$ triệu đồng trong tối đa bao nhiêu tháng?],
  [153 tháng],
  loigiai: [
    #step[Bản chất bài này giống hệt bài Vay trả góp, chỉ đảo ngược vị trí: Ta coi $1$ tỷ đồng là "cục nợ ngân hàng đang nợ bác Cường", và $10$ triệu là "ngân hàng đang trả góp cho bác Cường mỗi tháng".]
    #step[Sau $n$ tháng, cục tiền $1$ tỷ ngân hàng giữ tự sinh lãi thành: $N_n = 1000(1.006)^n$ (triệu đồng).\
    Sau $n$ tháng, tổng các cục tiền $10$ triệu bác Cường đã rút gom lại bằng:\
    $T_n = 10 + 10(1.006) + ... + 10(1.006)^(n-1) = 10 ( (1.006)^n - 1 ) / 0.006$]
    #step[
      *Sơ đồ minh hoạ Quỹ hưu trí:*
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((0, 0), (12, 0), mark: (end: ">"))
          for (i, label) in ((0, "T0"), (2, "T1"), (4, "T2"), (10, "Tn-1"), (12, "Tn")) {
            line((i, 0.2), (i, -0.2))
            content((i, -0.5), [*#label*])
          }
          content((7, 0), [.....])
          
          content((0, 0.6), text(blue)[$1000$tr (Giữ)])
          line((0, 1.2), (12, 1.2), stroke: (paint: blue, dash: "dashed"), mark: (end: ">"))
          content((14.5, 1.2), text(blue)[$1000(1.006)^n$])
          
          content((2, -1.2), text(red)[$10$tr (Rút)])
          line((2, -1.8), (12, -1.8), stroke: (paint: red, dash: "dashed"), mark: (end: ">"))
          content((14.5, -1.8), text(red)[$10(1.006)^(n-1)$])
          
          content((12, -2.4), text(red)[$10$tr (Rút)])
          content((14.5, -2.4), text(red)[$10$])
        })
      ]
    ]
    #step[Ngân hàng cạn kiệt tiền khi $T_n = N_n$:\
    $ 1000(1.006)^n = 10 ( (1.006)^n - 1 ) / 0.006 $
    $ <=> 1000(1.006)^n = 1666.67(1.006)^n - 1666.67 $
    $ <=> 666.67(1.006)^n = 1666.67 <=> 1.006^n = 2.5 $]
    #step[Giải phương trình mũ (lấy logarit): $n = log_(1.006) (2.5) approx 153.17$.\
    Vì bác Cường muốn rút "trọn vẹn" 10 triệu, bác chỉ có thể rút được $153$ tháng (sang tháng 154 số dư sẽ nhỏ hơn 10 triệu).]
  ]
)

=== Dạng 5 (Thực tiễn): Bẫy Lãi Suất Phẳng mua trả góp
Đây là một dạng bài nâng cao giúp học sinh ứng dụng Toán học vào đời sống thực tế để không bị "lùa gà" bởi các chiêu trò quảng cáo.

#tln(
  [Tại một cửa hàng xe máy điện, chiếc xe có giá $50$ triệu. Cửa hàng cho phép trả trước $10$ triệu và nợ lại $40$ triệu đồng trả góp trong $12$ tháng với "lãi suất siêu rẻ chỉ $1.5%$/tháng". Nhân viên tư vấn tính tiền phải đóng mỗi tháng theo phương pháp "Lãi phẳng" (Flat rate) như sau: Tiền gốc $40/12 = 3.333$ triệu + Tiền lãi $40 dot 1.5% = 0.6$ triệu = Tổng đóng $3.933$ triệu đồng/tháng. \ \ Bằng kiến thức Toán tài chính, hãy tính Lãi suất thực tế dư nợ giảm dần (theo tháng) mà cửa hàng đang áp dụng đối với khoản nợ $40$ triệu đồng này.],
  [2.64%/tháng],
  loigiai: [
    #step[Dòng tiền thực tế: Khách hàng đang vay thực chất là $P = 40$ triệu đồng, và trả góp đều đặn $X = 3.933$ triệu đồng mỗi cuối tháng trong $12$ tháng.]
    #step[Gọi $r$ là lãi suất thực tế trên dư nợ giảm dần. Theo "Đại bác vạn năng", ta thiết lập phương trình cân bằng tại tháng 12:\
    Tổng nợ sinh lãi = Tổng khoản trả sinh lãi\
    $ 40(1+r)^12 = 3.933 ( (1+r)^12 - 1 ) / r $]
    #step[Vì phương trình ẩn $r$ này là đa thức bậc 12, không thể giải tay bằng đại số. Sử dụng máy tính CASIO, nhập phương trình: $40(1+X)^12 = 3.933 ((1+X)^12 - 1) / X$. \
    Bấm `SHIFT SOLVE` (nhập giá trị dự đoán ban đầu $X = 0.02$), máy tính sẽ tìm ra nghiệm $X approx 0.02643$.]
    #step[Kết luận: Lãi suất thực tế mà cửa hàng thu của khách lên tới $2.643%$/tháng (hay tương đương $31.7%$/năm), cao gần gấp đôi so với lời quảng cáo "$1.5%$/tháng". Đây là "bẫy" cực kỳ phổ biến trong tín dụng tiêu dùng mà học sinh cần biết để tránh.]
  ]
)

=== Dạng 6: Bài toán Quỹ Mua Nhà (Tìm mức gửi X)
Một trong những bài toán thiết thực nhất: Cần chắt chiu bao nhiêu mỗi tháng để đạt được mục tiêu lớn?

#tln(
  [Anh Tâm có dự định mua một căn hộ chung cư sau $3$ năm nữa và cần tích luỹ đủ số tiền là $1$ tỷ đồng. Anh bắt đầu mở một tài khoản tiết kiệm và đều đặn mỗi tháng gửi vào đó một số tiền cố định $X$ đồng. Lãi suất ngân hàng là $0.5%$/tháng và anh gửi tiền vào mỗi ngày đầu tháng. Hỏi để có đủ $1$ tỷ đồng sau $3$ năm (36 tháng), mỗi tháng anh Tâm phải gửi ngân hàng bao nhiêu tiền? (Làm tròn đến nghìn đồng).],
  [25.296.000 VNĐ],
  loigiai: [
    #step[Bài toán Gửi Đều mỗi đầu tháng. Đọc kỹ Sơ đồ vạn năng, ta nhớ ngay công thức (Vạn năng 1):]
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        line((0, 0), (12, 0), mark: (end: ">"))
        for (i, label) in ((0, "T1"), (2, "T2"), (4, "T3"), (10, "T35"), (12, "T36")) {
          line((i, 0.2), (i, -0.2))
          content((i, -0.5), [*#label*])
        }
        content((7, 0), [.....])
        
        content((0, 0.6), text(blue)[$X$ (Gửi)])
        line((0, 1.2), (12, 1.2), stroke: (paint: blue, dash: "dashed"), mark: (end: ">"))
        content((14.5, 1.2), text(blue)[$X(1.005)^36$])
        
        content((2, 0.6), text(blue)[$X$ (Gửi)])
        line((2, 1.8), (12, 1.8), stroke: (paint: blue, dash: "dashed"), mark: (end: ">"))
        content((14.5, 1.8), text(blue)[$X(1.005)^35$])
      })
    ]
    #note[
      *Lưu ý sai lầm thường gặp*: Học sinh hay nhầm lẫn số mốc thời gian $n$. Ở đây gửi đều đặn "mỗi ngày đầu tháng" trong 3 năm (36 tháng), nên khoản cuối cùng gửi vào đầu tháng 36 vẫn sinh lãi 1 tháng. Tổng số dư phải là cấp số nhân bắt đầu từ $X(1+r)$ chứ không phải $X$.
    ]
    #step[Tổng tiền rút về (Phương trình Vạn năng 1): \
    $ A = X dot (1+r)/r dot [ (1+r)^n - 1 ] $]
    #step[Thay số: $A = 1000$ (triệu đồng), $n = 36$, $r = 0.005$. \
    $ 1000 = X dot (1.005)/0.005 dot ( 1.005^36 - 1 ) $]
    #step[Tính cụm hằng số và rút ra: $ X = 1000 / 39.5328 approx 25.2955 $ (triệu đồng). \
    Vậy anh Tâm cần gửi khoảng $25.296.000$ VNĐ mỗi tháng.]
  ]
)

=== Dạng 7: Bài toán Hai Giai Đoạn (Gửi tích luỹ rồi Rút dần)
Đây là câu hỏi phân loại cực kỳ "ác" trong đề thi vì học sinh phải nắm vững bản chất dòng tiền để nối 2 quy trình ngược nhau lại thành một.

#tln(
  [Để chuẩn bị cho con trai vào đại học, vợ chồng chú Toàn bắt đầu kế hoạch tiết kiệm từ khi con học lớp 8. Đều đặn mỗi tháng hai vợ chồng trích ra một khoản tiền $X$ để gửi tiết kiệm với lãi suất $0.6%$/tháng (gửi đầu tháng). Sau đúng $5$ năm (60 tháng), con trai đỗ đại học, hai vợ chồng ngừng gửi tiền. Khi đó, tài khoản ngân hàng được chuyển sang chế độ "rút dần". Đều đặn mỗi cuối tháng, người con rút ra $10$ triệu đồng để trang trải học phí và sinh hoạt. Biết rằng số tiền này vừa đủ để người con rút trong suốt $4$ năm học đại học (48 tháng) thì tài khoản hết nhẵn. Hỏi khoản tiền $X$ mà vợ chồng chú Toàn đã chắt chiu gửi ngân hàng mỗi tháng trong suốt 5 năm trước đó là bao nhiêu? (Lãi suất không đổi qua các năm).],
  [5.746.000 VNĐ],
  loigiai: [
    #step[Đây là bài toán cắt làm 2 khúc (Giai đoạn Rút tiền và Giai đoạn Gửi tiền). \
    *Mẹo giải "Bách chiến bách thắng"*: Đi ngược dòng thời gian! Ta vẽ sơ đồ và giải Giai đoạn 2 (lúc học đại học) trước để tìm số tiền cần có ban đầu, sau đó mới tính Giai đoạn 1 (lúc gửi tiền).]
    
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        // Giai đoạn 1
        line((-10, 0), (-2, 0), mark: (end: ">"), stroke: blue)
        content((-6, -0.6), text(blue)[*GĐ 1: Gửi (60 tháng)*])
        content((-10, 0.4), text(blue)[$X$])
        content((-8, 0.4), text(blue)[$X$])
        content((-2, 0.4), text(blue)[Cục tiền $A$])
        
        // Giai đoạn 2
        line((0, 0), (10, 0), mark: (end: ">"), stroke: red)
        content((5, -0.6), text(red)[*GĐ 2: Rút (48 tháng)*])
        content((0, 0.4), text(red)[Cục tiền $A$])
        content((2, 0.4), text(red)[$-10$])
        content((4, 0.4), text(red)[$-10$])
        content((10, 0.4), text(red)[$0$ (Hết sạch)])
      })
    ]
    
    #step[*Giai đoạn 2 (4 năm Đại học - Bài toán Rút Hưu Trí)*: \
    Gọi $A$ là "Cục tiền" bố mẹ đã tích cóp được giao cho con. Con rút đều mỗi cuối tháng $10$ triệu, rút $48$ tháng thì cạn kiệt. Ốp công thức (Vạn năng 2): \
    $ A (1+r)^48 = 10 dot ( (1+r)^48 - 1 ) / r $ \
    Thay $r = 0.006$, bấm máy tính ta giải ra được "Quỹ đại học" cần thiết: $A approx 415.988$ (triệu đồng).]
    
    #step[*Giai đoạn 1 (5 năm trước Đại học - Bài toán Gửi Đều)*: \
    Bố mẹ gửi tiền mỗi đầu tháng $X$ đồng trong $60$ tháng để đạt được mục tiêu $A = 415.988$ triệu đồng. Ốp công thức (Vạn năng 1): \
    $ A = X dot (1+r)/r dot [ (1+r)^60 - 1 ] $ \
    Thay $A = 415.988$, $r = 0.006$ vào: \
    $ 415.988 = X dot (1.006)/0.006 dot [ 1.006^60 - 1 ] $ \
    Bấm máy tính `SOLVE`, ta tìm được: $X approx 5.746$ (triệu đồng). \ \
    Vậy suốt 5 năm ròng rã, mỗi tháng vợ chồng chú Toàn đã chắt chiu tiết kiệm $5.746.000$ VNĐ.]
  ]
)

=== Dạng 8 (Sáng tạo - Đề chuyên): Lãi suất thay đổi theo từng chu kỳ
Đây là dạng bài "anti-hack", bóp nghẹt mọi công thức giải nhanh học thuộc lòng. Yêu cầu học sinh phải dùng đúng nguyên lý dòng tiền (kéo giá trị về tương lai hoặc hiện tại).

#tln(
  [Chị Hương vay ngân hàng $1$ tỷ đồng để mua nhà. Khế ước quy định: trong $2$ năm đầu, lãi suất ưu đãi là $0.6%$/tháng. Bắt đầu từ năm thứ $3$, lãi suất thả nổi và tăng lên mức $0.8%$/tháng. Chị Hương trả nợ đều đặn mỗi cuối tháng một số tiền là $X$. Sau đúng $5$ năm (60 tháng) thì chị trả hết nợ. Tính số tiền $X$ chị Hương phải trả mỗi tháng (giả sử $X$ không đổi trong suốt 5 năm).],
  [21.688.000 VNĐ],
  loigiai: [
    #step[Bài toán không thể áp dụng 1 công thức vì lãi suất gãy làm đôi ($r_1 = 0.006$ cho $24$ tháng đầu, $r_2 = 0.008$ cho $36$ tháng sau).]
    #note[
      *Bí kíp ĐẠI BÁC VẠN NĂNG:* Phương trình Cân Bằng tại Tháng 60. \
      *Tổng số nợ (bị ngân hàng tính lãi tới T60) = Tổng số tiền đã trả (mang đi gửi sinh lãi tới T60)*
    ]
    #step[*Vế Trái (Tổng nợ)*: Số tiền 1 tỷ bị tính lãi $0.6%$ trong 24 tháng, rồi cục tiền đó lại tiếp tục bị tính lãi $0.8%$ trong 36 tháng. \
    $ "Nợ" = 1000 dot (1.006)^24 dot (1.008)^36 $]
    #step[*Vế Phải (Tổng trả)*: Gồm 2 phần. \
    - Phần 1 ($24$ khoản trả $X$ đầu tiên): Nó sinh lãi nội bộ với nhau ra cục tiền $A_1 = X / 0.006 ((1.006)^24 - 1)$. Cục $A_1$ này nằm ở tháng thứ 24. Để kéo nó tới tháng 60, nó phải đi qua 36 tháng lãi suất $0.8%$. Giá trị của nó tại T60 là: $A_1 dot (1.008)^36$. \
    - Phần 2 ($36$ khoản trả $X$ sau): Nó sinh lãi bình thường với $r_2 = 0.008$. Cục tiền này là $A_2 = X / 0.008 ((1.008)^36 - 1)$.]
    #step[*Cân bằng phương trình*: \
    $ 1000 dot (1.006)^24 dot (1.008)^36 = X / 0.006 ((1.006)^24 - 1) dot (1.008)^36 + X / 0.008 ((1.008)^36 - 1) $]
    #step[Nhập nguyên xi phương trình vào máy tính CASIO và `SHIFT SOLVE` tìm $X$: \
    Vế trái $approx 1537.49$. Vế phải có nhân tử $X$, hệ số của $X$ là: \
    $ 25.718 dot 1.332 + 41.522 approx 70.88 $ \
    $ => X approx 1537.49 / 70.88 approx 21.688 $ (triệu đồng).]
  ]
)

=== Dạng 9 (Thực tế nâng cao): Yếu tố lạm phát (hoặc Tăng mức đóng)
Thường xuất hiện ở các bài toán Hưu trí hoặc Gửi tích luỹ có tính đến trượt giá.

#tln(
  [Anh Bình bắt đầu đi làm và gửi tiết kiệm mỗi cuối năm. Năm đầu tiên (năm 1) anh gửi $50$ triệu. Do lạm phát và thăng tiến, anh dự định mỗi năm tiếp theo sẽ gửi số tiền tăng thêm $10%$ so với năm liền trước. Lãi suất ngân hàng cố định là $7%$/năm. Hỏi sau đúng $10$ năm, tổng số tiền cả gốc lẫn lãi anh Bình nhận được là bao nhiêu?],
  [835.450.000 VNĐ],
  loigiai: [
    #step[Đây không phải là Gửi Đều $X$, mà là Gửi theo Cấp Số Nhân. Ta dùng ĐẠI BÁC VẠN NĂNG (Dòng tiền độc lập).]
    #note[
      *Mẹo đặt biến:* Số tiền gửi năm thứ $k$ là $50 dot (1.1)^(k-1)$. \
      Khoản tiền này nằm trong ngân hàng $(10 - k)$ năm nên sinh lãi thành $50 dot (1.1)^(k-1) dot (1.07)^(10-k)$.
    ]
    #step[Tổng tiền nhận được sau 10 năm là tổng của 10 khoản: \
    $ S = sum_(k=1)^10 50 dot (1.1)^(k-1) dot (1.07)^(10-k) $]
    #step[Tách phần chung ra ngoài: \
    $ S = 50 / 1.1 dot (1.07)^10 sum_(k=1)^10 (1.1 / 1.07)^k $]
    #step[Cụm trong tổng là một Cấp số nhân với $u_1 = 1.1/1.07$ và công bội $q = 1.1/1.07$. \
    Máy tính có nút `Sigma` ($sum$), học sinh chỉ cần bấm trực tiếp: \
    `Sum( 50 * 1.1^(x-1) * 1.07^(10-x), x, 1, 10 )` \
    Kết quả: $S approx 835.45$ (triệu đồng).]
  ]
)
