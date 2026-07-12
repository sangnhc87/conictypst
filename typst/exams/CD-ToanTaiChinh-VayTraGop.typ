#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG & ĐỊNH DẠNG CHUNG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12.5pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("117A65"), size: 11.5pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ═══════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ
// ═══════════════════════════════════════════════
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      Chuyên Đề: Toán Tài Chính & Vay Trả Góp\
      Bản Chất Dòng Tiền, Bẫy Lãi Suất & Cân Bằng Tài Chính Chuyên Sâu
    ]
    #v(0.3em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Lãi kép liên tục · Phương pháp EMI · Gốc đều lãi giảm dần · Bẫy Lãi suất phẳng Flat Rate · Hiện giá ròng NPV
    ]
  ]
]

// ═══════════════════════════════════════════════
// I. LÝ THUYẾT TRỌNG TÂM & BẢN CHẤT DÒNG TIỀN
// ═══════════════════════════════════════════════
= I. Bản chất lý thuyết & Các công cụ cốt lõi

== 1. Bản chất Lãi đẻ Lãi (Quy luật nuôi heo đất)
#lythuyet(title: [Lãi kép cơ bản & Lãi kép liên tục])[
  Để không bao giờ phải học thuộc lòng công thức tài chính một cách máy móc, hãy tưởng tượng ngân hàng giống như một chuồng nuôi heo đất đặc biệt.
  
  - *Lãi kép cơ bản:* Mỗi khi bạn ném một cục tiền $A$ vào ngân hàng với lãi suất $r$/kỳ hạn, ngân hàng sẽ cho cục tiền này "ăn" lãi suất đó và phình to lên. Sau $n$ kỳ hạn, nếu bạn không rút tiền lãi ra (lãi nhập vốn), cục tiền sẽ biến thành:
    $ T_n = A(1 + r)^n $
  - *Lãi kép liên tục:* Là trường hợp kỳ hạn tính lãi được chia nhỏ đến vô cùng bé (từng giây, từng khoảnh khắc lãi suất đều được cộng dồn vào gốc). Nếu bạn gửi số tiền $P$ với lãi suất danh nghĩa là $r$/năm, sau $t$ năm số tiền tích lũy được tính bằng giới hạn:
    $ A(t) = lim_(m -> oo) P (1 + r/m)^(m t) = P dot e^(r t) $
    Công thức lãi kép liên tục mô tả quy luật tăng trưởng (hoặc suy giảm) tự nhiên, xuất hiện trong các bài toán thực tế như sự phân rã phóng xạ, sự sinh trưởng của vi khuẩn, sự tăng trưởng dân số, và các mô hình tài chính định lượng cao cấp.
]

== 2. Vũ khí tối thượng: Phương pháp "Đại bác vạn năng" (Cân bằng dòng tiền)
#lythuyet(title: [Nguyên lý dòng tiền độc lập])[
  Trong thực tế, các bài toán vay trả góp hay gửi tiết kiệm định kỳ có rất nhiều khoản tiền phát sinh ở các thời điểm khác nhau. Học sinh thường bối rối vì có quá nhiều công thức cho từng trường hợp. Tuy nhiên, tất cả đều tuân theo một nguyên lý dòng tiền duy nhất:
  
  #align(center)[
    #text(fill: rgb("C62828"), weight: "bold")[
      "Cứ mỗi khoản tiền nộp vào hoặc rút ra khỏi ngân hàng, nó sẽ tự động sinh lãi kép độc lập kể từ thời điểm đó cho đến ngày chốt sổ."
    ]
  ]

  Để giải quyết mọi bài toán tài chính phức tạp:
  1. *Chọn mốc Chốt sổ:* Thường chọn thời điểm kết thúc kỳ hạn cuối cùng (thời điểm thứ $n$).
  2. *Quy đổi giá trị:* Sử dụng công thức lãi kép cơ bản để kéo giá trị của tất cả các khoản tiền (tiền vay ban đầu, các khoản trả từng tháng) về mốc Chốt sổ này.
  3. *Lập phương trình cân bằng:*
    #align(center)[$ "Tổng dòng tiền vào ngân hàng (quy về kỳ" n")" = "Tổng dòng tiền ra khỏi ngân hàng (quy về kỳ" n")" $]
]

== 3. Công cụ gom tiền: Tổng của Cấp số nhân
#lythuyet(title: [Chứng minh công thức tích lũy định kỳ])[
  Khi bạn trả nợ hoặc gửi tiết kiệm đều đặn mỗi kỳ một số tiền $X$, các khoản tiền này quy về thời điểm chốt sổ ở kỳ thứ $n$ sẽ có thời gian sinh lãi khác nhau. Tổng giá trị của chúng tại kỳ thứ $n$ là:
  $ S_n = X + X(1+r) + X(1+r)^2 + ... + X(1+r)^(n-1) $
  Đây là tổng của một cấp số nhân gồm $n$ số hạng, với số hạng đầu $u_1 = X$ và công bội $q = 1 + r$. 
  
  *Chứng minh đại số:*
  Nhân hai vế của $S_n$ với $(1+r)$, ta được:
  $ (1+r)S_n = X(1+r) + X(1+r)^2 + ... + X(1+r)^n $
  Lấy phương trình dưới trừ phương trình trên:
  $ (1+r)S_n - S_n = X(1+r)^n - X $
  $ r dot S_n = X[(1+r)^n - 1] $
  Từ đó ta rút ra công thức rút gọn kinh điển:
  $ S_n = X dot ((1+r)^n - 1)/r $
  Mẫu số luôn là $r$ vì $(q - 1) = (1+r) - 1 = r$.
]

== 4. Hai phương thức trả nợ phổ biến trong đời sống thực tế
#ppgiai(title: [Phân biệt EMI và Dư nợ gốc chia đều])[
  Khi đi vay ngân hàng mua nhà hoặc mua xe, người vay thường được lựa chọn giữa 2 phương thức trả nợ chính dưới đây. Bản chất toán học của chúng hoàn toàn khác nhau:

  *A. Phương thức Niên kim cố định (EMI - Trả góp đều):*
  - Hàng tháng, người vay trả ngân hàng một khoản tiền cố định $X$ (gồm cả gốc và lãi). Số tiền này không đổi suốt thời gian vay.
  - *Thiết lập phương trình:* Cục nợ gốc $P$ phình to sau $n$ tháng phải bằng tổng các khoản trả $X$ phình to:
    $ P(1+r)^n = X dot ((1+r)^n - 1)/r => X = (P r (1+r)^n) / ((1+r)^n - 1) $
  - *Tổng tiền lãi phải trả:* $S_"lãi" = (n dot X) - P$.
  
  *B. Phương thức Dư nợ gốc chia đều (Linear Principal - Gốc đều, lãi giảm dần):*
  - Hàng tháng, người vay trả một phần gốc cố định bằng $G = P/n$.
  - Tiền lãi của tháng thứ $k$ được tính trên số dư nợ thực tế còn lại: $I_k = [P - (k-1)G] dot r$.
  - Số tiền phải trả của tháng thứ $k$ giảm dần: $T_k = G + I_k = P/n + [P - (k-1)P/n] dot r$.
  
  *Chứng minh công thức tổng tiền lãi:*
  Tổng số tiền lãi phải trả sau $n$ tháng là tổng của một dãy số giảm dần:
  $ S_"lãi" = I_1 + I_2 + ... + I_n = [P + (P-G) + (P-2G) + ... + G] dot r $
  Dãy số trong ngoặc vuông là một cấp số cộng có $n$ số hạng, số hạng đầu là $P$, số hạng cuối là $G = P/n$. Tổng của cấp số cộng này là:
  $ S_"ngoặc" = n dot (P + P/n)/2 = (n P + P)/2 = P dot (n + 1)/2 $
  Do đó, tổng tiền lãi của phương thức gốc đều được rút gọn cực kỳ đẹp mắt thành:
  $ S_"lãi" = P dot r dot (n + 1)/2 $
]

== 5. Cảnh giác: Bẫy Lãi Suất Phẳng (Flat Rate) trong tín dụng tiêu dùng
#luuy(title: [Nhận diện chiêu trò lôi kéo khách hàng])[
  Nhiều cửa hàng điện máy hoặc công ty tài chính thường quảng cáo gói trả góp với "lãi suất siêu rẻ chỉ $1.5%$/tháng tính trên giá trị sản phẩm". Đây chính là *Lãi suất phẳng (Flat Rate)*.
  
  - *Cách tính lãi suất phẳng:* Tiền lãi mỗi tháng được tính cố định dựa trên số tiền vay ban đầu, mặc dù qua từng tháng bạn đã trả bớt tiền gốc rồi.
  - *Bẫy tài chính:* Vì số tiền nợ thực tế của bạn giảm dần theo thời gian, nhưng bạn vẫn phải trả tiền lãi dựa trên khoản vay ban đầu, nên *Lãi suất thực tế trên dư nợ giảm dần (Effective Rate) luôn cao gấp khoảng 1.8 lần so với lãi suất phẳng công bố*.
  
  *Bí kíp quy đổi tìm lãi suất thực tế bằng CASIO:*
  Nếu vay số tiền $P$ trong $n$ tháng, trả góp mỗi cuối tháng số tiền $X$ (gồm gốc phẳng + lãi phẳng). Lãi suất thực tế $r$ chính là nghiệm của phương trình:
  $ P(1+r)^n = X dot ((1+r)^n - 1)/r $
  Nhập nguyên xi phương trình này vào máy tính CASIO (thay $r$ bằng biến $X$) và bấm `SHIFT SOLVE`, máy tính sẽ tìm ra lãi suất thực tế chính xác trong vài giây.
]

#meo(title: [Mẹo CASIO vạn năng để tính toán nhanh])[
  Trong phòng thi, đối với các bài toán tài chính phức tạp, hãy hạn chế rút các đại lượng biến đổi đại số phức tạp bằng tay dễ gây nhầm lẫn. 
  Hãy viết đúng phương trình dòng tiền cân bằng ban đầu, nhập nguyên văn vào màn hình máy tính (sử dụng phím $X$ cho đại lượng chưa biết) rồi nhấn tổ hợp phím `SHIFT + CALC (SOLVE)`. Máy tính sẽ tự động giải phương trình phi tuyến tính này một cách chính xác tuyệt đối.
]

// ═══════════════════════════════════════════════
// II. CÁC SIÊU PHẨM TOÁN TÀI CHÍNH THỰC TẾ
// ═══════════════════════════════════════════════
= II. Các siêu phẩm toán tài chính thực tế

#tln(
  id: "TC-01",
  [Một cặp vợ chồng trẻ mua một căn hộ chung cư trị giá $2$ tỷ đồng. Họ trả trước $20%$, số tiền còn lại đi vay ngân hàng với lãi suất $0.8%$/tháng. Thoả thuận trả góp đều đặn vào cuối mỗi tháng trong vòng $15$ năm. Tính số tiền họ phải trả cho ngân hàng mỗi tháng (làm tròn đến hàng nghìn đồng).],
  [$15.548.000$ VNĐ],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Người vay trả một khoản tiền cố định hàng tháng $X$, đây là hình thức trả góp đều (EMI).
      2. Cục nợ ban đầu là 1.6 tỷ đồng (sau khi đã trừ đi 20% tiền trả trước).
      3. Ta chốt sổ tại tháng thứ 180. Để xóa nợ, tổng giá trị tương lai của 180 khoản trả góp $X$ phải bù đắp được giá trị tương lai của khoản nợ gốc 1.6 tỷ đồng bị ngân hàng tính lãi kép liên tục 180 tháng.
    ]

    *Sơ đồ Dòng tiền (Cashflow Timeline):*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // Trục thời gian
        line((0, 0), (12, 0), mark: (end: ">"), stroke: 1.5pt)
        content((12.5, 0), [*Thời gian (tháng)*])

        // Nút thời gian
        for i in (0, 2, 4, 10) {
          circle((i, 0), radius: 0.1, fill: black)
        }
        content((0, -0.5), [$T_0$])
        content((2, -0.5), [$T_1$])
        content((4, -0.5), [$T_2$])
        content((7, -0.5), [$...$])
        content((10, -0.5), [$T_180$])

        // Mũi tên Vay (Tiền vào)
        line((0, 0), (0, 2), mark: (start: ">"), stroke: 1.5pt + rgb("4CAF50"))
        content((0, 2.5), text(fill: rgb("4CAF50"))[*Vay gốc A = 1.6 tỷ*])

        // Mũi tên Trả (Tiền ra)
        line((2, 0), (2, -1.5), mark: (end: ">"), stroke: 1.5pt + rgb("F44336"))
        content((2, -1.8), text(fill: rgb("F44336"))[Trả $X$])
        
        line((4, 0), (4, -1.5), mark: (end: ">"), stroke: 1.5pt + rgb("F44336"))
        content((4, -1.8), text(fill: rgb("F44336"))[Trả $X$])

        line((10, 0), (10, -1.5), mark: (end: ">"), stroke: 1.5pt + rgb("F44336"))
        content((10, -1.8), text(fill: rgb("F44336"))[Trả $X$])
      })
    ]

    #step([Xác định các thông số và tóm tắt])
    - Giá trị căn hộ: $2$ tỷ $= 2.000.000.000$ VNĐ.
    - Số tiền trả trước: $2.000.000.000 dot 20% = 400.000.000$ VNĐ.
    - Số tiền nợ gốc cần vay $P$: $P = 2.000.000.000 - 400.000.000 = 1.600.000.000$ VNĐ.
    - Lãi suất hàng tháng: $r = 0.8% = 0.008$.
    - Tổng thời gian trả góp: $15$ năm $= 15 dot 12 = 180$ tháng.

    #step([Thiết lập phương trình dòng tiền chốt sổ])
    - Giá trị cục nợ $P$ tại tháng thứ 180:
      $ A_{180} = P(1+r)^180 = 1.600.000.000 dot (1.008)^180 $
    - Giá trị của 180 khoản tiền trả $X$ tích lũy tại tháng thứ 180:
      - Khoản trả tháng 1 sinh lãi 179 tháng: $X(1.008)^179$
      - Khoản trả tháng 2 sinh lãi 178 tháng: $X(1.008)^178$
      - ...
      - Khoản trả tháng 180 vừa đóng xong chốt sổ: $X$
      
      Tổng tiền trả tích lũy là tổng cấp số nhân:
      $ S = X + X(1.008) + ... + X(1.008)^179 = X dot ((1.008)^180 - 1) / 0.008 $
    - Phương trình cân bằng nợ:
      $ 1.600.000.000 dot (1.008)^180 = X dot ((1.008)^180 - 1) / 0.008 $

    #step([Tính kết quả])
    Biến đổi rút $X$:
    $ X = (1.600.000.000 dot 0.008 dot (1.008)^180) / ((1.008)^180 - 1) $
    Bấm máy tính ta có:
    $ X approx 15.547.962 " (VNĐ)" $
    Làm tròn đến hàng nghìn đồng, số tiền vợ chồng phải trả mỗi tháng là *15.548.000 VNĐ*.
  ]
)

#tln(
  id: "TC-02",
  [Anh Bình bắt đầu đi làm ở tuổi 25. Để chuẩn bị cho hưu trí lúc 60 tuổi, mỗi tháng anh quyết định trích đúng $5$ triệu đồng đưa vào quỹ ETF. Giả sử tỷ suất sinh lời của quỹ ETF này là $12%$/năm (tương đương $1%$/tháng) và không đổi. Khi anh Bình tròn 60 tuổi (đóng tròn 35 năm), tổng số tiền trong quỹ hưu trí của anh là bao nhiêu?],
  [$32.4$ tỷ đồng],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Đây là bài toán Tích lũy định kỳ đầu tháng (Annuity Future Value).
      2. Mốc chốt sổ là tháng thứ 420 (khi tròn 60 tuổi). Khoản tiền đầu tiên gửi năm 25 tuổi sẽ sinh lãi suốt 420 tháng, khoản cuối cùng gửi ở đầu tháng thứ 420 vẫn kịp sinh lãi đúng 1 tháng trước khi chốt sổ.
      3. Dùng tổng cấp số nhân bắt đầu từ số hạng $u_1 = a(1+r)$.
    ]

    *Biểu đồ Lãi kép tăng trưởng tích lũy qua 35 năm:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // Hệ trục tọa độ
        line((0, 0), (10, 0), mark: (end: ">"), stroke: 1.2pt)
        content((10.3, 0), [*Năm*])
        line((0, 0), (0, 5.5), mark: (end: ">"), stroke: 1.2pt)
        content((0, 5.8), [*Tỷ VNĐ*])

        // Đường biểu diễn gốc tích lũy (tuyến tính)
        line((0, 0), (9, 0.6), stroke: (paint: gray, thickness: 1.2pt), name: "goc")
        content((9.2, 0.4), text(fill: gray, size: 8pt)[Gốc: 2.1 tỷ])

        // Đường cong tăng trưởng lãi kép (exponential)
        bezier((0, 0), (9, 5), (6, 0.5), stroke: 2pt + rgb("E91E63"), name: "laikep")
        content((9.5, 5.2), text(fill: rgb("E91E63"), weight: "bold")[*32.45 Tỷ*])
        
        // Kẻ gióng từ mốc 35 năm
        line((9, 0), (9, 5), stroke: (paint: rgb("555"), dash: "dashed", thickness: 0.8pt))
        circle((9, 5), radius: 0.08, fill: rgb("E91E63"))

        for i in (1, 3, 5, 7, 9) {
          line((i, -0.1), (i, 0.1))
        }
        content((3, -0.4), [10])
        content((6, -0.4), [20])
        content((9, -0.4), [35])
      })
    ]

    #step([Tóm tắt thông số])
    - Số tiền tích lũy mỗi tháng: $a = 5.000.000$ VNĐ.
    - Lãi suất hàng tháng: $r = 1% = 0.01$.
    - Thời gian tích lũy: $35$ năm $= 35 dot 12 = 420$ tháng.

    #step([Thiết lập tổng tiền quy về mốc chốt sổ])
    Vì gửi tiền vào đầu mỗi tháng:
    - Khoản gửi tháng 1 sinh lãi 420 tháng: $a(1+r)^420$
    - Khoản gửi tháng 2 sinh lãi 419 tháng: $a(1+r)^419$
    - ...
    - Khoản gửi tháng 420 sinh lãi 1 tháng: $a(1+r)^1$
    
    Cộng dồn toàn bộ dòng tiền tại tháng thứ 420:
    $ S = a(1+r)^1 + a(1+r)^2 + ... + a(1+r)^420 $
    Đây là tổng cấp số nhân có $u_1 = a(1+r) = 5.000.000 dot 1.01 = 5.050.000$ VNĐ, công bội $q = 1.01$, số số hạng $n = 420$:
    $ S = 5.050.000 dot ((1.01)^420 - 1) / (1.01 - 1) = 505.000.000 dot ((1.01)^420 - 1) $

    #step([Tính kết quả])
    Bấm máy tính ta có:
    $ S approx 505.000.000 dot (65.2039 - 1) approx 32.422.970.000 " (VNĐ)" $
    *(Nếu tính toán chính xác tuyệt đối không làm tròn trung gian, kết quả là $S = 32.457.575.000$ VNĐ).*
    
    Vậy sau 35 năm tích lũy đều đặn, anh Bình sẽ có khoảng *32.4 tỷ đồng*.
    *Lưu ý tử huyệt:* Học sinh hay nhầm lẫn công thức gửi tiền đầu tháng với gửi cuối tháng. Nếu gửi cuối tháng, tổng tiền tích lũy chỉ là $a dot ((1+r)^420 - 1)/r approx 32.1$ tỷ đồng. Khoản chênh lệch do 1 tháng sinh lãi của toàn bộ dòng tiền lên tới hơn 300 triệu đồng.
  ]
)

#tln(
  id: "TC-03",
  [Sinh viên Minh vay ngân hàng $200$ triệu đồng để đi học Đại học với lãi suất $0.5%$/tháng. Ngân hàng cho Minh *thời gian ân hạn 4 năm* (48 tháng) trong lúc đi học không phải trả lãi và gốc. Tuy nhiên, tiền lãi vẫn được cộng dồn vào vốn gốc. Ngay sau khi ra trường (tháng thứ 49), Minh bắt đầu trả góp đều đặn hàng tháng để thanh toán hết nợ trong $5$ năm tiếp theo. Hỏi mỗi tháng Minh phải trả bao nhiêu tiền?],
  [$4.945.000$ VNĐ],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Bài toán gồm 2 giai đoạn nối tiếp nhau.
      2. *Giai đoạn 1 (48 tháng học đại học):* Minh không đóng tiền gốc lẫn lãi, nhưng nợ cũ vẫn đẻ lãi kép bình thường. Ta tính số nợ tích lũy $A'$ ở cuối tháng 48.
      3. *Giai đoạn 2 (60 tháng trả nợ):* Minh bắt đầu đi làm và trả góp đều đặn hàng tháng (EMI) để thanh toán dứt điểm số nợ mới $A'$ này.
    ]

    *Sơ đồ dòng tiền 2 giai đoạn:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // Trục thời gian
        line((0, 0), (12, 0), mark: (end: ">"), stroke: 1.5pt)
        
        // Mốc Vay ban đầu
        line((0, 0), (0, 1.8), mark: (start: ">"), stroke: 1.5pt + rgb("4CAF50"))
        content((0, 2.2), text(fill: rgb("4CAF50"))[*Vay gốc A = 200tr*])
        content((0, -0.5), [$T_0$])

        // Giai đoạn 1 (Ân hạn)
        rect((0, -0.1), (5, 0.1), fill: rgb("ffe0b2").lighten(50%), stroke: none)
        content((2.5, 0.5), text(fill: rgb("E65100"), size: 9pt)[*GĐ 1: Ân hạn (48 th)*])
        circle((5, 0), radius: 0.1, fill: black)
        content((5, -0.5), [$T_48$])
        content((5, 1.2), text(fill: rgb("D32F2F"), size: 9pt)[*Nợ gốc mới: A'*])

        // Giai đoạn 2 (Trả góp)
        rect((5, -0.1), (11, 0.1), fill: rgb("c8e6c9").lighten(50%), stroke: none)
        content((8, 0.5), text(fill: rgb("2E7D32"), size: 9pt)[*GĐ 2: Trả góp (60 th)*])
        
        for i in (6.5, 8.5, 11) {
          line((i, 0), (i, -1.2), mark: (end: ">"), stroke: 1.2pt + rgb("F44336"))
          content((i, -1.5), text(fill: rgb("F44336"), size: 8pt)[$X$])
        }
        content((11, 0.5), [$T_108$])
      })
    ]

    #step([Giai đoạn 1: Tính số dư nợ phình to sau 4 năm ân hạn])
    - Tiền vay ban đầu: $A = 200$ triệu VNĐ.
    - Lãi suất hàng tháng: $r = 0.5% = 0.005$.
    - Thời gian ân hạn: $48$ tháng.
    - Số dư nợ tích lũy tại cuối tháng 48 là:
      $ A' = A(1+r)^48 = 200.000.000 dot (1.005)^48 approx 254.097.300 " (VNĐ)" $

    #step([Giai đoạn 2: Tính số tiền trả góp hàng tháng])
    - Từ tháng thứ 49, Minh nợ ngân hàng số tiền gốc mới là $A' approx 254.097.300$ VNĐ.
    - Thời gian trả góp: $5$ năm $= 60$ tháng.
    - Áp dụng công thức trả góp đều (EMI):
      $ X = (A' dot r (1+r)^60) / ((1+r)^60 - 1) = (254.097.300 dot 0.005 dot (1.005)^60) / ((1.005)^60 - 1) $
    - Bấm máy tính ta được:
      $ X approx 4.944.975 " (VNĐ)" $
      Làm tròn đến hàng nghìn đồng, mỗi tháng Minh phải trả khoảng *4.945.000 VNĐ*.
  ]
)

#tln(
  id: "TC-04",
  [Một nhà đầu tư vay ngân hàng $2$ tỷ đồng để mua một mảnh đất. Thời hạn vay là $10$ năm ($120$ tháng), trả góp đều đặn vào cuối mỗi tháng. Lãi suất trong $2$ năm đầu tiên cố định là $0.8%$/tháng. Kể từ tháng thứ $25$ trở đi, lãi suất thả nổi tăng lên thành $1.0%$/tháng. Tính số tiền nhà đầu tư này phải trả cho ngân hàng mỗi tháng kể từ tháng thứ $25$ trở đi (giả sử lãi suất thả nổi không đổi đến hết chu kỳ vay, làm tròn đến hàng nghìn đồng).],
  [$28.229.000$ VNĐ],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Khoản vay có lãi suất thay đổi đột ngột giữa chừng. Ta không thể áp dụng một công thức trả góp đều cho cả 120 tháng được.
      2. *Giai đoạn 1 (24 tháng đầu):* Người vay trả góp mức tiền $X_1$ tương ứng với lãi suất $0.8\%$/tháng.
      3. *Thời điểm chuyển giao (tháng thứ 24):* Ta phải tính xem sau khi đã trả góp 24 tháng, số nợ thực tế còn lại tại ngân hàng là bao nhiêu ($P_{24}$).
      4. *Giai đoạn 2 (96 tháng cuối):* Coi số nợ $P_{24}$ này là một khoản vay mới hoàn toàn, trả góp trong 96 tháng còn lại với lãi suất mới $1.0\%$/tháng để tìm ra số tiền trả góp hàng tháng $X_2$.
    ]

    *Sơ đồ Dòng tiền Lãi suất Biến động:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // Trục thời gian
        line((0, 0), (12, 0), mark: (end: ">"), stroke: 1.5pt)
        content((12.5, 0), [*Tháng*])

        // Nút thời gian
        for i in (0, 3, 4, 11) {
          circle((i, 0), radius: 0.1, fill: black)
        }
        content((0, -0.5), [$0$])
        content((3, -0.5), [$24$])
        content((4, -0.5), [$25$])
        content((11, -0.5), [$120$])

        // Tiền vay gốc ban đầu
        line((0, 0), (0, 1.8), mark: (start: ">"), stroke: 1.5pt + rgb("4CAF50"))
        content((0, 2.2), text(fill: rgb("4CAF50"))[*Vay 2 tỷ*])

        // Giai đoạn 1 (Lãi suất r1 = 0.8%)
        rect((0, -0.1), (3, 0.1), fill: rgb("bbdefb").lighten(50%), stroke: none)
        content((1.5, 0.5), text(fill: rgb("1976D2"), size: 9.5pt)[$r_1 = 0.8\%$])
        
        // Giai đoạn 2 (Lãi suất r2 = 1.0%)
        rect((3, -0.1), (11, 0.1), fill: rgb("ffecb3").lighten(50%), stroke: none)
        content((7, 0.5), text(fill: rgb("FF8F00"), size: 9.5pt)[$r_2 = 1.0\%$])

        // Mũi tên trả góp
        line((1.5, 0), (1.5, -1.2), mark: (end: ">"), stroke: 1.2pt + rgb("F44336"))
        content((1.5, -1.5), text(fill: rgb("F44336"), size: 8pt)[$X_1$])
        
        line((5, 0), (5, -1.2), mark: (end: ">"), stroke: 1.2pt + rgb("E91E63"))
        content((5, -1.5), text(fill: rgb("E91E63"), size: 8pt)[$X_2$])

        line((9, 0), (9, -1.2), mark: (end: ">"), stroke: 1.2pt + rgb("E91E63"))
        content((9, -1.5), text(fill: rgb("E91E63"), size: 8pt)[$X_2$])
      })
    ]

    #step([Tính số tiền phải trả mỗi tháng trong 2 năm đầu ($X_1$)])
    - Số tiền vay ban đầu: $A = 2$ tỷ $= 2.000.000.000$ VNĐ.
    - Lãi suất ban đầu: $r_1 = 0.8% = 0.008$.
    - Tổng số tháng vay: $n = 120$ tháng.
    - Số tiền trả mỗi tháng $X_1$:
      $ X_1 = (A dot r_1 (1 + r_1)^120) / ((1 + r_1)^120 - 1) = (2.000.000.000 dot 0.008 dot (1.008)^120) / ((1.008)^120 - 1) $
      $ X_1 approx 25.989.138 " (VNĐ)" $

    #step([Tính dư nợ thực tế còn lại sau 24 tháng ($P_{24}$)])
    Số dư nợ còn lại tại tháng thứ 24 được tính bằng chênh lệch giữa cục nợ gốc tích lũy lãi và tổng các khoản tiền đã trả tích lũy lãi tại thời điểm này:
    $ P_{24} = A(1 + r_1)^24 - X_1 dot ((1 + r_1)^24 - 1)/r_1 $
    Thay số:
    $ P_{24} = 2.000.000.000 dot (1.008)^24 - 25.989.138 dot ((1.008)^24 - 1)/0.008 $
    Bấm máy tính thu được:
    $ P_{24} approx 1.736.854.579 " (VNĐ)" $

    #step([Tính số tiền phải trả mỗi tháng kể từ tháng thứ 25 ($X_2$)])
    Từ tháng thứ 25, số dư nợ $P_{24} = 1.736.854.579$ VNĐ được trả góp trong $120 - 24 = 96$ tháng còn lại, với lãi suất mới $r_2 = 1% = 0.01$:
    $ X_2 = (P_{24} dot r_2 (1 + r_2)^96) / ((1 + r_2)^96 - 1) $
    Thay số:
    $ X_2 = (1.736.854.579 dot 0.01 dot (1.01)^96) / ((1.01)^96 - 1) $
    Bấm máy tính ta có:
    $ X_2 approx 28.228.822 " (VNĐ)" $
    Làm tròn đến hàng nghìn đồng, số tiền phải trả mỗi tháng kể từ tháng thứ 25 là *28.229.000 VNĐ*.
  ]
)

#tln(
  id: "TC-05",
  [Một doanh nghiệp vay ngân hàng $1$ tỷ đồng trong $5$ năm ($60$ tháng) với lãi suất $0.6%$/tháng. Hãy tính và so sánh số tiền lãi chênh lệch mà doanh nghiệp phải trả cho ngân hàng giữa 2 phương án: \
  Phương án 1: Trả góp đều hàng tháng (EMI). \
  Phương án 2: Gốc trả đều hàng tháng, lãi tính trên dư nợ thực tế (Linear Principal).],
  [Phương án 1 chịu nhiều lãi hơn Phương án 2 là $10.742.000$ VNĐ],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. *Phương án 1 (EMI - Trả góp đều):* Số tiền đóng mỗi tháng cố định. Tổng số tiền lãi là tổng tiền đã đóng trừ đi nợ gốc ban đầu.
      2. *Phương án 2 (Linear Principal - Gốc trả đều):* Tiền gốc đóng mỗi tháng cố định $G = P/60$. Tiền lãi tháng đầu cao nhất, giảm dần về tháng thứ 60. Tổng tiền lãi được tính cực nhanh bằng công thức cấp số cộng đã chứng minh ở phần lý thuyết: $S_"lãi" = P r (n + 1)/2$.
    ]

    *So sánh Số tiền thanh toán hàng tháng của 2 phương án:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // Hệ trục
        line((0, 0), (8, 0), mark: (end: ">"), stroke: 1.2pt)
        content((8.3, 0), [*Tháng*])
        line((0, 0), (0, 5), mark: (end: ">"), stroke: 1.2pt)
        content((0, 5.3), [*Tr. đồng*])

        // Phương án 1 (EMI) - Đường nằm ngang cố định tại 19.9tr
        line((0, 3.32), (7, 3.32), stroke: 2pt + rgb("1976D2"), name: "emi")
        content((7.2, 3.32), text(fill: rgb("1976D2"), size: 8pt)[EMI (19.9 tr)])

        // Phương án 2 (Linear) - Đường dốc xuống từ 22.7tr xuống 16.8tr
        line((0, 3.78), (7, 2.79), stroke: 2pt + rgb("E65100"), name: "linear")
        content((7.2, 2.6), text(fill: rgb("E65100"), size: 8pt)[Gốc đều (Lãi giảm dần)])
        
        // Điểm đầu và cuối phương án 2
        circle((0, 3.78), radius: 0.06, fill: rgb("E65100"))
        content((-0.6, 3.78), [22.7])
        
        circle((7, 2.79), radius: 0.06, fill: rgb("E65100"))
        content((7, 2.1), [16.8])

        for i in (0, 7) {
          line((i, -0.1), (i, 0.1))
        }
        content((0, -0.4), [1])
        content((7, -0.4), [60])
      })
    ]

    #step([Phương án 1: Tính tổng tiền lãi trả góp đều (EMI)])
    - Khoản vay gốc $P = 1.000.000.000$ VNĐ, lãi suất $r = 0.6% = 0.006$, kỳ hạn $n = 60$ tháng.
    - Số tiền trả đều mỗi tháng $X$:
      $ X = (P r (1+r)^60) / ((1+r)^60 - 1) = (1.000.000.000 dot 0.006 dot (1.006)^60) / ((1.006)^60 - 1) approx 19.895.695 " (VNĐ)" $
    - Tổng tiền doanh nghiệp phải trả sau 60 tháng:
      $ T_1 = 60 times 19.895.695 = 1.193.741.700 " (VNĐ)" $
    - Tổng tiền lãi phải trả:
      $ S_("lãi 1") = T_1 - P = 193.741.700 " (VNĐ)" $

    #step([Phương án 2: Tính tổng tiền lãi gốc trả đều (Linear Principal)])
    - Gốc trả cố định mỗi tháng:
      $ G = P / 60 = 1.000.000.000 / 60 = 16.666.667 " (VNĐ)" $
    - Tiền lãi giảm dần theo từng tháng:
      - Tháng 1: $I_1 = P dot r = 1.000.000.000 dot 0.006 = 6.000.000$ VNĐ.
      - Tháng 2: $I_2 = (P - G) dot r = 983.333.333 dot 0.006 = 5.900.000$ VNĐ.
      - ...
      - Tháng 60: $I_{60} = G dot r = 16.666.667 dot 0.006 = 100.000$ VNĐ.
    - Tổng tiền lãi là tổng của cấp số cộng có số hạng đầu $u_1 = 6.000.000$, số hạng cuối $u_{60} = 100.000$ và có $60$ số hạng:
      $ S_("lãi 2") = 60 dot (u_1 + u_{60})/2 = P r (n + 1)/2 $
      $ S_("lãi 2") = 1.000.000.000 dot 0.006 dot (60 + 1)/2 = 6.000.000 dot 30.5 = 183.000.000 " (VNĐ)" $

    #step([So sánh kết quả])
    Hiệu số tiền lãi chênh lệch giữa hai phương án là:
    $ Delta S = S_("lãi 1") - S_("lãi 2") = 193.741.700 - 183.000.000 = 10.741.700 " (VNĐ)" $
    Hiệu số thực tế chính xác hơn khi không làm tròn trung gian là: *10.742.000 VNĐ*.
    Vậy Phương án 1 (EMI) phải chịu nhiều tiền lãi hơn Phương án 2 khoảng *10.742.000 VNĐ*.
  ]
)

#tln(
  id: "TC-06",
  [Một doanh nghiệp dự kiến đầu tư mua một dây chuyền sản xuất trị giá $500$ triệu đồng. Doanh nghiệp ước tính doanh thu ròng thu về vào cuối các năm từ năm thứ nhất đến năm thứ 5 lần lượt là: $100$ triệu đồng, $150$ triệu đồng, $200$ triệu đồng, $200$ triệu đồng và $150$ triệu đồng. Biết lãi suất chiết khấu (tính theo năm) của dự án cố định là $8%$/năm. Hãy tính hiện giá thuần (NPV) của dự án này và đưa ra khuyến nghị doanh nghiệp có nên đầu tư hay không.],
  [$N P V approx 129,05$ triệu đồng, khuyên nên đầu tư],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Đây là bài toán đánh giá hiệu quả đầu tư dự án sử dụng chỉ số NPV (Net Present Value).
      2. Chúng ta chiết khấu tất cả các dòng tiền ròng thu về trong tương lai (từ năm 1 đến năm 5) về giá trị hiện tại ở thời điểm năm 0 ($T_0$) bằng công thức chia cho $(1 + r)^t$.
      3. So sánh tổng hiện giá thu về (PV) với vốn đầu tư ban đầu ($C_0 = 500$ triệu) để tính NPV.
      4. Quy tắc ra quyết định: Nếu $N P V > 0$, dự án có lãi ròng sau khi đã trừ chi phí cơ hội vốn, nên đầu tư.
    ]

    *Sơ đồ Dòng tiền chiết khấu NPV:*
    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *

        // Trục thời gian
        line((0, 0), (6.5, 0), mark: (end: ">"), stroke: 1.5pt)
        content((7, 0), [*Năm*])

        // Các mốc
        for i in (0, 1, 2, 3, 4, 5) {
          circle((i, 0), radius: 0.08, fill: black)
          content((i, -0.4), [*#i*])
        }

        // Chi phí đầu tư ban đầu
        line((0, 0), (0, -1.5), mark: (end: ">"), stroke: 1.5pt + rgb("D32F2F"))
        content((0, -1.8), text(fill: rgb("D32F2F"), size: 8.5pt)[Vốn: -500tr])

        // Các khoản thu về hàng năm
        let flows = (100, 150, 200, 200, 150)
        for (i, val) in flows.enumerate() {
          let idx = i + 1
          let h_val = val / 100
          line((idx, 0), (idx, h_val), mark: (end: ">"), stroke: 1.2pt + rgb("388E3C"))
          content((idx, h_val + 0.3), text(fill: rgb("388E3C"), size: 8pt)[+#val])
        }

        // Mũi tên chiết khấu quay về 0
        bezier((1, -0.7), (0.2, -0.7), (0.6, -0.2), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
        bezier((3, -0.9), (0.2, -0.9), (1.6, -0.2), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
        bezier((5, -1.1), (0.2, -1.1), (2.6, -0.2), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
      })
    ]

    #step([Tính hiện giá (PV) của các dòng tiền tương lai])
    Chiết khấu từng khoản doanh thu về năm 0 với lãi suất chiết khấu $r = 8% = 0.08$:
    - Năm 1: $P V_1 = 100 / (1 + 0.08)^1 approx 92.59$ triệu đồng.
    - Năm 2: $P V_2 = 150 / (1 + 0.08)^2 approx 128.60$ triệu đồng.
    - Năm 3: $P V_3 = 200 / (1 + 0.08)^3 approx 158.77$ triệu đồng.
    - Năm 4: $P V_4 = 200 / (1 + 0.08)^4 approx 147.01$ triệu đồng.
    - Năm 5: $P V_5 = 150 / (1 + 0.08)^5 approx 102.09$ triệu đồng.

    Tổng hiện giá (PV) dòng tiền thu về:
    $ P V = 92.59 + 128.60 + 158.77 + 147.01 + 102.09 = 629.06 " (triệu đồng)" $

    #step([Tính hiện giá thuần (NPV) của dự án])
    Khấu trừ số vốn đầu tư ban đầu $C_0 = 500$ triệu đồng:
    $ N P V = P V - C_0 = 629.06 - 500 = 129.06 " (triệu đồng)" $
    *(Nếu bấm máy tính chuẩn xác không làm tròn trung gian, kết quả thu được là $N P V approx 129.05$ triệu đồng).*

    #step([Đánh giá và đưa ra khuyến nghị])
    Vì $N P V approx 129.05 > 0$, điều này chứng tỏ dự án không chỉ hoàn được số vốn đầu tư ban đầu mà còn sinh lời ròng thêm $129.05$ triệu đồng (sau khi đã tính đến chi phí cơ hội vốn $8\%$).
    *Khuyến nghị:* Doanh nghiệp nên quyết định đầu tư vào dây chuyền sản xuất này.
  ]
)

#tln(
  id: "TC-07",
  [Tại một cửa hàng xe máy điện, chiếc xe có giá $50$ triệu đồng. Cửa hàng cho phép khách hàng trả trước $10$ triệu và nợ lại $40$ triệu đồng trả góp trong $12$ tháng với "lãi suất siêu rẻ chỉ $1.5%$/tháng tính theo dư nợ ban đầu (lãi suất phẳng)". Nhân viên tư vấn tính tiền phải đóng mỗi tháng như sau: Tiền gốc $40 / 12 = 3.333$ triệu + Tiền lãi $40 dot 1.5% = 0.6$ triệu = Tổng đóng $3.933$ triệu đồng/tháng. Bằng kiến thức Toán tài chính, hãy tính Lãi suất thực tế dư nợ giảm dần (theo tháng) mà cửa hàng đang áp dụng đối với khoản nợ $40$ triệu đồng này (làm tròn đến hai chữ số thập phân).],
  [2.64%/tháng],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. *Flat Rate (Lãi phẳng):* Khách hàng bị tính lãi dựa trên khoản gốc $40$ triệu đồng ban đầu suốt 12 tháng, mặc dù nợ gốc thực tế giảm dần sau mỗi tháng đóng tiền.
      2. *Dòng tiền thực tế:* Bản chất là khách hàng đang vay thực chất số tiền $P = 40.000.000$ VNĐ và trả góp đều đặn số tiền $X = 3.933.333$ VNĐ mỗi cuối tháng trong $12$ tháng.
      3. *Mục tiêu:* Tìm lãi suất thực tế hàng tháng $r$ (lãi suất trên dư nợ giảm dần) thỏa mãn phương trình cân bằng EMI.
    ]

    *Trực quan hóa sự chênh lệch dư nợ tính lãi:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // Trục tọa độ
        line((0, 0), (7, 0), mark: (end: ">"))
        content((7.3, 0), [*Tháng*])
        line((0, 0), (0, 4), mark: (end: ">"))
        content((0, 4.3), [*Nợ gốc tính lãi (Tr. đồng)*])

        // Nợ phẳng (luôn giữ ở 40 triệu)
        line((0, 3.2), (6, 3.2), stroke: 2pt + rgb("D32F2F"), name: "flat")
        content((4.5, 3.5), text(fill: rgb("D32F2F"), size: 8pt)[Nợ tính lãi phẳng (luôn là 40tr)])

        // Nợ thực tế giảm dần về 0
        line((0, 3.2), (6, 0), stroke: 2pt + rgb("388E3C"), name: "real")
        content((3, 1), text(fill: rgb("388E3C"), size: 8pt)[Nợ thực tế giảm dần])

        for i in (0, 6) {
          line((i, -0.1), (i, 0.1))
        }
        content((0, -0.4), [0])
        content((6, -0.4), [12])
      })
    ]

    #step([Xác định dòng tiền thực tế])
    - Khoản vay thực tế ban đầu: $P = 40.000.000$ VNĐ.
    - Số tiền thực tế phải trả vào cuối mỗi tháng:
      $ X = 3.933.333 " (VNĐ)" $
    - Thời gian vay: $n = 12$ tháng.

    #step([Thiết lập phương trình dòng tiền])
    Gọi $r$ là lãi suất thực tế hàng tháng cần tìm. Thiết lập phương trình cân bằng tài chính:
    $ P(1+r)^12 = X dot ((1+r)^12 - 1)/r $
    Thay số:
    $ 40.000.000 dot (1+r)^12 = 3.933.333 dot ((1+r)^12 - 1)/r $

    #step([Giải phương trình bằng máy tính CASIO])
    - Nhập nguyên văn phương trình vào máy tính:
      $ 40(1+x)^12 = 3.933333 dot ((1+x)^12 - 1)/x $
    - Bấm tổ hợp phím `SHIFT SOLVE` (Nhập giá trị phỏng đoán ban đầu $x = 0.02$).
    - Máy tính giải ra kết quả:
      $ x approx 0.02643 $
      Tương đương với $r approx 2.64\%$/tháng.
    - *Nhận xét kinh tế:* Lãi suất thực tế người mua xe phải gánh chịu lên tới $2.64\%$/tháng (tương đương khoảng $31.7\%$/năm), cao gấp gần 1.8 lần so với lãi suất phẳng quảng cáo là $1.5\%$/tháng. Đây là kiến thức tài chính cực kỳ quan trọng trong đời sống thực tế.
  ]
)

#tln(
  id: "TC-08",
  [Bác Cường vừa nghỉ hưu và nhận được khoản tiền trợ cấp một lần là $1$ tỷ đồng. Bác gửi toàn bộ số tiền này vào ngân hàng với lãi suất ổn định là $0.6%$/tháng. Mỗi cuối tháng, bác rút ra $10$ triệu đồng để chi tiêu sinh hoạt. Hỏi bác Cường có thể rút trọn vẹn số tiền $10$ triệu đồng đó trong tối đa bao nhiêu tháng?],
  [153 tháng],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Bản chất bài toán rút tiền chi tiêu hàng tháng hoàn toàn giống bài toán Vay trả góp nhưng đảo ngược đối tượng.
      2. Ta coi $1$ tỷ đồng bác gửi là "cục nợ ngân hàng đang nợ bác Cường", và $10$ triệu rút ra hàng tháng là "tiền ngân hàng trả góp cho bác Cường".
      3. Chốt sổ tại tháng thứ $n$. Cục tiền 1 tỷ ban đầu phình to phải bằng tổng các khoản đã rút $10$ triệu phình to. Giải phương trình tìm số kỳ hạn tối đa $n$.
    ]

    *Sơ đồ dòng tiền quỹ hưu trí rút dần:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // Trục thời gian
        line((0, 0), (12, 0), mark: (end: ">"), stroke: 1.5pt)
        content((12.5, 0), [*Tháng*])

        for (i, label) in ((0, "0"), (2, "1"), (4, "2"), (10, "n")) {
          circle((i, 0), radius: 0.1, fill: black)
          content((i, -0.5), [*#label*])
        }
        content((7, 0), [.....])

        // Cục tiền ban đầu gửi vào
        line((0, 0), (0, 1.8), mark: (start: ">"), stroke: 1.5pt + rgb("4CAF50"))
        content((0, 2.2), text(fill: rgb("4CAF50"))[*Gửi gốc P = 1 tỷ*])

        // Dòng tiền rút ra
        for i in (2, 4, 10) {
          line((i, 0), (i, -1.2), mark: (end: ">"), stroke: 1.2pt + rgb("F44336"))
          content((i, -1.5), text(fill: rgb("F44336"), size: 8pt)[Rút 10tr])
        }
      })
    ]

    #step([Thiết lập phương trình cân bằng tài chính])
    - Tiền gốc ban đầu: $P = 1.000.000.000$ VNĐ $= 1000$ triệu VNĐ.
    - Lãi suất tháng: $r = 0.6% = 0.006$.
    - Số tiền rút mỗi cuối tháng: $X = 10$ triệu VNĐ.
    - Gọi $n$ là số tháng tối đa bác rút tiền. Tại mốc chốt sổ ở tháng thứ $n$:
      - Trị giá cục tiền ban đầu phình to thành:
        $ P_n = 1000 dot (1.006)^n $
      - Tổng các khoản rút về chốt sổ tích lũy thành:
        $ S_n = 10 dot ((1.006)^n - 1) / 0.006 $
      - Khi rút hết sạch tiền, hai giá trị này bằng nhau:
        $ 1000 dot (1.006)^n = 10 dot ((1.006)^n - 1) / 0.006 $

    #step([Giải phương trình mũ tìm số tháng $n$])
    Biến đổi đại số:
    $ 1000 dot (1.006)^n = 1666.67 dot ((1.006)^n - 1) $
    $ 1000 dot (1.006)^n = 1666.67 dot (1.006)^n - 1666.67 $
    $ 666.67 dot (1.006)^n = 1666.67 $
    $ (1.006)^n = 1666.67 / 666.67 = 2.5 $
    Lấy logarit tự nhiên hai vế:
    $ n = log_(1.006) (2.5) = ln(2.5) / ln(1.006) approx 153.17 $

    #step([Kết luận])
    Vì thời gian $n$ phải là số nguyên và bác Cường muốn rút trọn vẹn số tiền $10$ triệu đồng, bác chỉ có thể rút được tối đa là *153 tháng* (đến tháng thứ 154 số tiền còn lại trong tài khoản sẽ nhỏ hơn 10 triệu đồng).
  ]
)

#tln(
  id: "TC-09",
  [Để chuẩn bị cho con trai vào Đại học, chú Toàn lập kế hoạch tiết kiệm tiền. Đều đặn mỗi đầu tháng, chú gửi vào ngân hàng số tiền là $X$ đồng với lãi suất ổn định là $0.6%$/tháng. Sau đúng $5$ năm (60 tháng) gửi liên tục, chú dừng gửi tiền. Khi đó, tài khoản ngân hàng của chú tự động chuyển sang chế độ rút tiền đều đặn để chi trả cho con học đại học. Hằng tháng, vào cuối tháng, người con rút ra đúng $10$ triệu đồng. Khoản tiền này vừa đủ để rút liên tục trong suốt 4 năm học Đại học (48 tháng) thì tài khoản vừa vặn hết sạch tiền. Hãy tính số tiền $X$ chú Toàn đã gửi tiết kiệm hàng tháng ở giai đoạn trước (làm tròn đến hàng nghìn đồng).],
  [5.746.000 VNĐ],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:*
      1. Đây là bài toán tài chính 2 giai đoạn ngược nhau: Giai đoạn 1 là gửi tích lũy đều đặn đầu tháng, Giai đoạn 2 là rút dần đều đặn cuối tháng.
      2. *Bí kíp giải quyết:* Hãy đi ngược dòng thời gian! 
         - Giải Giai đoạn 2 trước: Tìm xem ở thời điểm đỗ đại học (tháng 60), tài khoản cần có một "cục tiền" $A$ là bao nhiêu để vừa đủ rút 10 triệu/tháng trong 48 tháng.
         - Giải Giai đoạn 1 sau: Biết số tiền đích cần đạt được là $A$, tính xem bố mẹ cần gửi tiết kiệm hàng tháng bao nhiêu trong 60 tháng để tích lũy được cục tiền $A$ này.
    ]

    *Sơ đồ Dòng tiền 2 Giai đoạn Nối tiếp:*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // Giai đoạn 1 (Gửi tiền)
        line((0, 0), (5, 0), stroke: 1.5pt + rgb("1976D2"), mark: (end: ">"))
        content((2.5, -0.6), text(fill: rgb("1976D2"))[*GĐ 1: Gửi X (60 th)*])
        
        // Mốc chốt quỹ
        circle((5, 0), radius: 0.1, fill: black)
        content((5, 0.8), text(fill: rgb("2E7D32"))[*Quỹ A*])
        content((5, -0.5), [Tháng 60])

        // Giai đoạn 2 (Rút tiền)
        line((5, 0), (10, 0), stroke: 1.5pt + rgb("D32F2F"), mark: (end: ">"))
        content((7.5, -0.6), text(fill: rgb("D32F2F"))[*GĐ 2: Rút 10tr (48 th)*])
        circle((10, 0), radius: 0.1, fill: black)
        content((10, -0.5), [Tháng 108])
      })
    ]

    #step([Giai đoạn 2: Tính số quỹ cần có lúc nhập học ($A$)])
    - Gọi $A$ là số tiền cần tích lũy được sau 60 tháng gửi tiết kiệm.
    - Người con rút đều mỗi cuối tháng $10$ triệu đồng trong $48$ tháng với lãi suất $r = 0.6\% = 0.006$.
    - Áp dụng công thức rút hưu trí (phương trình trả góp EMI):
      $ A dot (1+r)^48 = 10.000.000 dot ((1+r)^48 - 1) / r $
      $ A = (10.000.000 dot ((1.006)^48 - 1)) / (0.006 dot (1.006)^48) $
    - Bấm máy tính ta có:
      $ A approx 415.987.568 " (VNĐ)" $
      Đây chính là số tiền bố mẹ cần chuẩn bị sẵn sàng lúc con nhập học.

    #step([Giai đoạn 1: Tính số tiền gửi hàng tháng ($X$)])
    - Bố mẹ cần gửi tiết kiệm hàng tháng số tiền $X$ vào mỗi đầu tháng, trong 60 tháng để tích lũy được số tiền mục tiêu $A = 415.987.568$ VNĐ. Lãi suất tích lũy là $r = 0.6\% = 0.006$.
    - Áp dụng công thức tích lũy gửi đầu tháng:
      $ A = X dot (1+r)/r dot [(1+r)^60 - 1] $
    - Thay số:
      $ 415.987.568 = X dot 1.006/0.006 dot [(1.006)^60 - 1] $
    - Rút $X$:
      $ X = (415.987.568 dot 0.006) / (1.006 dot ((1.006)^60 - 1)) $
    - Bấm máy tính thu được:
      $ X approx 5.745.543 " (VNĐ)" $

    #step([Kết luận])
    Làm tròn đến hàng nghìn đồng, số tiền vợ chồng chú Toàn đã chắt chiu tiết kiệm gửi ngân hàng đều đặn mỗi tháng là *5.746.000 VNĐ*.
  ]
)
