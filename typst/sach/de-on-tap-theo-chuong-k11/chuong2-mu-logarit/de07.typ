#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.equation: set text(fill: black)
#show math.equation.where(block: true): it => math.display(it.body)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 2",
  exam-title: "CHƯƠNG 2. MŨ VÀ LOGARIT (ĐỀ SỐ 07 - BÀI TOÁN TIỀN TỆ & LÃI SUẤT)",
  duration: 90,
)

// ═══════════════════════════════════════════════════════════
// HÀM VẼ SƠ ĐỒ TRỤC THỜI GIAN (DÒNG TIỀN)
// ═══════════════════════════════════════════════════════════
#let draw-timeline-single(P, A, n, r) = align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (8, 0), mark: (end: ">", fill: black))
    line((0, -0.2), (0, 0.2)); content((0, -0.6), [Kỳ $0$])
    content((0, 0.6), [#text(fill: blue)[Gửi $#P$]])
    
    line((7, -0.2), (7, 0.2)); content((7, -0.6), [Kỳ $#n$])
    content((7, 0.6), [#text(fill: red)[Nhận $#A$]])
    
    content((3.5, 0.4), [Lãi suất: $#r$ / kỳ])
  })
]

#let draw-timeline-annuity-due(a, A, n) = align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (10, 0), mark: (end: ">", fill: black))
    line((0, -0.2), (0, 0.2)); content((0, -0.6), [$0$]); content((0, 0.6), [#text(fill: blue)[$+#a$]])
    line((2, -0.2), (2, 0.2)); content((2, -0.6), [$1$]); content((2, 0.6), [#text(fill: blue)[$+#a$]])
    line((4, -0.2), (4, 0.2)); content((4, -0.6), [$2$]); content((4, 0.6), [#text(fill: blue)[$+#a$]])
    content((6, -0.6), [$...$])
    line((8, -0.2), (8, 0.2)); content((8, -0.6), [$#n$]); content((8, 0.6), [#text(fill: red)[Nhận $#A$]])
  })
]

#let draw-timeline-annuity-ord(a, A, n) = align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (10, 0), mark: (end: ">", fill: black))
    line((0, -0.2), (0, 0.2)); content((0, -0.6), [$0$])
    line((2, -0.2), (2, 0.2)); content((2, -0.6), [$1$]); content((2, 0.6), [#text(fill: blue)[$+#a$]])
    line((4, -0.2), (4, 0.2)); content((4, -0.6), [$2$]); content((4, 0.6), [#text(fill: blue)[$+#a$]])
    content((6, -0.6), [$...$])
    line((8, -0.2), (8, 0.2)); content((8, -0.6), [$#n$]); content((8, 0.6), [#text(fill: blue)[$+#a$]]); content((8, 1.2), [#text(fill: red)[Nhận $#A$]])
  })
]

#let draw-timeline-loan(P, a, n) = align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (10, 0), mark: (end: ">", fill: black))
    line((0, -0.2), (0, 0.2)); content((0, -0.6), [$0$]); content((0, 0.6), [#text(fill: red)[Vay $#P$]])
    line((2, -0.2), (2, 0.2)); content((2, -0.6), [$1$]); content((2, -1.2), [#text(fill: blue)[Trả $#a$]])
    line((4, -0.2), (4, 0.2)); content((4, -0.6), [$2$]); content((4, -1.2), [#text(fill: blue)[Trả $#a$]])
    content((6, -0.6), [$...$])
    line((8, -0.2), (8, 0.2)); content((8, -0.6), [$#n$]); content((8, -1.2), [#text(fill: blue)[Trả $#a$]])
    content((8, -1.8), [(Hết nợ)])
  })
]

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Ông A gửi tiết kiệm $100$ triệu đồng vào ngân hàng với lãi suất $6\%$/năm theo hình thức lãi kép. Hỏi sau đúng $5$ năm, số tiền cả gốc lẫn lãi ông A nhận được là bao nhiêu? (Giả sử lãi suất không đổi và ông A không rút tiền ra trong suốt quá trình gửi, kết quả làm tròn đến hàng nghìn đồng).],
    (
        [$130 000 000$ đồng.],
        True([$133 823 000$ đồng.]),
        [$134 000 000$ đồng.],
        [$135 220 000$ đồng.]
    ),
    loigiai: [
        *Bài toán gửi tiền 1 lần (Lãi kép).*
        - *Công thức:* $A = P(1+r)^n$.
        - *Sơ đồ trục thời gian:*
        #draw-timeline-single("P", "A", "n", "r")
        Ta có $P = 100$, $r = 0.06$, $n = 5$.
        Số tiền nhận được sau $5$ năm là:
        $
          A = 100(1 + 0.06)^5 = 100(1.06)^5 approx 133.822557 " (triệu đồng)"
        $
        Làm tròn đến hàng nghìn, số tiền là $133 823 000$ đồng.
    ]
)

// TN 2
#tn([Một khoản tiền $50$ triệu đồng được gửi tiết kiệm lãi kép. Sau $3$ năm, người gửi nhận được tổng cộng $59.55$ triệu đồng. Lãi suất tiền gửi hàng năm (làm tròn đến một chữ số thập phân) là bao nhiêu?],
    (
        [$5.5\%$.],
        True([$6.0\%$.]),
        [$6.5\%$.],
        [$7.0\%$.]
    ),
    loigiai: [
        *Bài toán tìm lãi suất trong gửi tiền 1 lần.*
        - *Công thức:* $A = P(1+r)^n$.
        - *Sơ đồ trục thời gian:*
        #draw-timeline-single("50", "59.55", "3", "?")
        Ta có phương trình:
        $
          50(1+r)^3 = 59.55 <=> (1+r)^3 = 59.55 / 50 = 1.191
        $
        $
          <=> 1+r = root(3, 1.191) approx 1.05999 <=> r approx 0.05999 = 6.0\%
        $
        Vậy lãi suất là $6.0\%$/năm.
    ]
)

// TN 3
#tn([Bạn B muốn gửi tiết kiệm một số tiền theo thể thức lãi kép với lãi suất $7.2\%$/năm. Cần gửi ít nhất bao nhiêu năm để số tiền ban đầu tăng gấp đôi? (Biết lãi suất không đổi).],
    (
        [$8$ năm.],
        [$9$ năm.],
        True([$10$ năm.]),
        [$11$ năm.]
    ),
    loigiai: [
        *Bài toán tìm thời gian gửi tiền 1 lần.*
        - *Công thức:* $A = P(1+r)^n$.
        - *Sơ đồ trục thời gian:*
        #draw-timeline-single("P", "2P", "n", "7.2%")
        Yêu cầu bài toán $A = 2P$.
        $
          P(1 + 0.072)^n = 2P <=> (1.072)^n = 2
        $
        $
          <=> n = log_1.072 (2) = (ln 2) / (ln 1.072) approx 9.96
        $
        Vì gửi theo kỳ hạn năm nguyên, cần gửi ít nhất $10$ năm.
    ]
)

// TN 4
#tn([Một người có $200$ triệu đồng đem gửi ngân hàng với lãi suất $6\%$/năm. Nếu ngân hàng tính lãi theo hình thức lãi kép liên tục, thì sau $10$ năm người đó thu được số tiền (làm tròn đến triệu đồng) là bao nhiêu?],
    (
        [$358$ triệu đồng.],
        True([$364$ triệu đồng.]),
        [$370$ triệu đồng.],
        [$380$ triệu đồng.]
    ),
    loigiai: [
        *Bài toán tính lãi kép liên tục.*
        - *Công thức:* $A = P e^(r t)$.
        - *Giải chi tiết:* Lãi suất gộp liên tục có dòng tiền gia tăng mọi thời điểm theo hàm số mũ.
        Ta có $P = 200$, $r = 0.06$, $t = 10$.
        $
          A = 200 e^(0.06 dot 10) = 200 e^0.6 approx 200 dot 1.8221 = 364.42 " (triệu đồng)"
        $
        Làm tròn đến triệu đồng là $364$ triệu đồng.
    ]
)

// TN 5
#tn([Ngân hàng A niêm yết lãi suất gửi tiết kiệm là $8\%$/năm. Bạn C muốn gửi $100$ triệu đồng. Hãy so sánh số tiền thu được sau $1$ năm nếu C chọn gửi kì hạn $1$ tháng (lãi nhập gốc hàng tháng) so với chọn gửi kì hạn $1$ năm (lãi nhập gốc cuối năm). Số tiền chênh lệch xấp xỉ là bao nhiêu?],
    (
        [$150 000$ đồng.],
        True([$300 000$ đồng.]),
        [$450 000$ đồng.],
        [$600 000$ đồng.]
    ),
    loigiai: [
        *Bài toán so sánh kỳ hạn.*
        - *Phương án 1 (Gửi kì hạn 1 năm):* $A_1 = 100(1 + 0.08)^1 = 108$ (triệu đồng).
        - *Phương án 2 (Gửi kì hạn 1 tháng):* Lãi suất $1$ tháng là $r = 8\% / 12 = 0.08/12$. 
          Thời gian gửi là $n = 12$ tháng.
          $
            A_2 = 100(1 + 0.08/12)^12 approx 100(1.006667)^12 approx 108.29995 " (triệu đồng)"
          $
        Số tiền chênh lệch:
        $
          108.300 - 108.000 = 0.300 " (triệu đồng)" = 300 000 " (đồng)"
        $
    ]
)

// TN 6
#tn([Đầu mỗi tháng, anh D đều gửi đều đặn vào ngân hàng $5$ triệu đồng với lãi suất $0.5\%$/tháng theo hình thức lãi kép. Hỏi sau đúng $2$ năm (24 tháng), số tiền cả gốc và lãi anh D thu được là bao nhiêu? (Làm tròn đến hàng nghìn đồng).],
    (
        [$125 400 000$ đồng.],
        [$126 800 000$ đồng.],
        True([$127 797 000$ đồng.]),
        [$128 500 000$ đồng.]
    ),
    loigiai: [
        *Bài toán gửi tiền định kì đầu kỳ (Annuity Due).*
        - *Công thức:* $A = a/r (1+r) [(1+r)^n - 1]$.
        - *Sơ đồ trục thời gian:*
        #draw-timeline-annuity-due("a", "A", "n")
        Ở đây $a = 5$, $r = 0.005$, $n = 24$.
        $
          A = 5/0.005 (1+0.005) [(1+0.005)^24 - 1] = 1000 dot 1.005 dot [1.005^24 - 1]
        $
        Bấm máy tính:
        $
          A = 1005 dot [1.1271597 - 1] = 1005 dot 0.1271597 approx 127.7955 " (triệu đồng)"
        $
        Tính chính xác hơn trên máy tính sẽ ra $127 796 900$ đồng, làm tròn là $127 797 000$ đồng.
    ]
)

// TN 7
#tn([Thay vì gửi đầu tháng, nếu anh D trong Câu 6 gửi $5$ triệu đồng vào *cuối* mỗi tháng với cùng mức lãi suất $0.5\%$/tháng, thì sau $2$ năm anh thu được số tiền là bao nhiêu? (Làm tròn đến hàng nghìn đồng).],
    (
        [$125 400 000$ đồng.],
        [$126 800 000$ đồng.],
        True([$127 160 000$ đồng.]),
        [$127 797 000$ đồng.]
    ),
    loigiai: [
        *Bài toán gửi tiền định kì cuối kỳ (Ordinary Annuity).*
        - *Công thức:* $A = a/r [(1+r)^n - 1]$.
        - *Sơ đồ trục thời gian:*
        #draw-timeline-annuity-ord("a", "A", "n")
        Sự khác biệt so với gửi đầu kỳ là khoản tiền cuối cùng không được sinh lãi.
        $
          A = 5/0.005 [(1+0.005)^24 - 1] = 1000 dot [1.005^24 - 1]
        $
        Bấm máy tính:
        $
          A = 1000 dot 0.1271597 approx 127.1597 " (triệu đồng)"
        $
        Kết quả làm tròn là $127 160 000$ đồng.
    ]
)

// TN 8
#tn([Chị E muốn có $500$ triệu đồng sau $5$ năm để mua ô tô. Chị quyết định lập quỹ bằng cách mỗi tháng gửi một khoản tiền không đổi $a$ vào ngân hàng vào cuối mỗi tháng với lãi suất $0.6\%$/tháng. Giá trị của $a$ (làm tròn đến nghìn đồng) là bao nhiêu?],
    (
        [$6 700 000$ đồng.],
        True([$6 942 000$ đồng.]),
        [$7 100 000$ đồng.],
        [$7 500 000$ đồng.]
    ),
    loigiai: [
        *Bài toán tìm mức gửi định kì (gửi cuối kỳ).*
        - *Công thức:* $A = a/r [(1+r)^n - 1] => a = (A dot r) / [(1+r)^n - 1]$.
        - *Sơ đồ dòng tiền:* Tương tự gửi cuối kỳ.
        Ta có $A = 500$, $r = 0.006$, $n = 5 dot 12 = 60$ (tháng).
        $
          a = (500 dot 0.006) / [(1+0.006)^60 - 1] = 3 / [1.006^60 - 1]
        $
        Bấm máy tính: $1.006^60 approx 1.43213$.
        $
          a = 3 / 0.43213 approx 6.9423 " (triệu đồng)"
        $
        Vậy cần gửi khoảng $6 942 000$ đồng/tháng.
    ]
)

// TN 9
#tn([Anh F mua trả góp một chiếc xe máy giá $60$ triệu đồng. Anh trả trước $20$ triệu đồng, phần còn lại $40$ triệu đồng anh vay ngân hàng trả góp hàng tháng trong $12$ tháng (trả vào cuối mỗi tháng) với lãi suất $1\%$/tháng. Số tiền anh F phải trả đều đặn mỗi tháng là bao nhiêu? (Làm tròn đến nghìn đồng).],
    (
        [$3 333 000$ đồng.],
        [$3 450 000$ đồng.],
        True([$3 554 000$ đồng.]),
        [$3 650 000$ đồng.]
    ),
    loigiai: [
        *Bài toán vay trả góp (Amortized Loan).*
        - *Công thức:* Vay $P$, trả đều đặn cuối kì số tiền $a$. 
          Mối quan hệ khi trả hết nợ: $P(1+r)^n = a/r [(1+r)^n - 1] => a = (P dot r(1+r)^n)/((1+r)^n - 1)$.
        - *Sơ đồ trục thời gian:*
        #draw-timeline-loan("P", "a", "n")
        Số tiền vay thực tế $P = 40$ triệu. $r = 0.01$, $n = 12$.
        $
          a = (40 dot 0.01(1+0.01)^12) / ((1+0.01)^12 - 1) = (0.4(1.01)^12) / ((1.01)^12 - 1)
        $
        Bấm máy tính:
        $
          a = (0.4 dot 1.126825) / (1.126825 - 1) = 0.45073 / 0.126825 approx 3.55395 " (triệu đồng)"
        $
        Làm tròn là $3 554 000$ đồng.
    ]
)

// TN 10
#tn([Một người vay $1$ tỷ đồng mua nhà trả góp trong $10$ năm ($120$ tháng) với lãi suất $0.8\%$/tháng. Mỗi tháng trả một số tiền cố định. Sau đúng $5$ năm (60 tháng) trả nợ, người đó trúng số và muốn tất toán (trả dứt điểm) phần nợ còn lại. Số dư nợ ngay sau lần đóng thứ 60 xấp xỉ là bao nhiêu?],
    (
        [$500$ triệu đồng.],
        [$550$ triệu đồng.],
        [$608$ triệu đồng.],
        True([$617$ triệu đồng.])
    ),
    loigiai: [
        *Bài toán dư nợ trong vay trả góp.*
        - *Công thức dư nợ sau kì $k$:* Giá trị hiện tại của $(n-k)$ kỳ còn lại chưa đóng.
          $ S_k = a/r [1 - (1+r)^(-(n-k))] $
        Tính số tiền đóng hằng tháng $a$:
        $
          a = (P dot r) / (1 - (1+r)^(-n)) = (1000 dot 0.008) / (1 - (1.008)^(-120)) approx 12.9884 " (triệu đồng)"
        $
        Dư nợ sau $60$ tháng ($k=60, n-k = 60$):
        $
          S_60 = 12.9884 / 0.008 [1 - (1.008)^(-60)] = 1623.55 [1 - 0.61984] approx 617.2 " (triệu đồng)"
        $
    ]
)

// TN 11
#tn([Một người về hưu có $2$ tỷ đồng tiền tiết kiệm gửi ngân hàng với lãi suất $0.5\%$/tháng. Mỗi cuối tháng người đó rút ra $15$ triệu đồng để chi tiêu sinh hoạt. Hỏi sau bao nhiêu tháng thì người đó rút hết toàn bộ số tiền?],
    (
        [$150$ tháng.],
        True([$220$ tháng.]),
        [$240$ tháng.],
        [$300$ tháng.]
    ),
    loigiai: [
        *Bài toán rút tiền từ quỹ (Tương đương vay trả góp).*
        - *Mô hình:* Coi ngân hàng vay $P=2000$ của người này và mỗi tháng trả nợ $a=15$.
        - *Công thức:* $P(1+r)^n = a/r [(1+r)^n - 1]$.
        Ta có $2000(1.005)^n = 15/0.005 [(1.005)^n - 1] = 3000(1.005)^n - 3000$.
        Chuyển vế:
        $
          3000 - 2000(1.005)^n = 0 <=> 3000 = 1000(1.005)^n <=> 3 = (1.005)^n
        $
        $
          <=> n = log_1.005 (3) = (ln 3) / (ln 1.005) approx 220.27
        $
        Khoảng $220$ tháng người đó sẽ rút hết tiền.
    ]
)

// TN 12
#tn([Một sinh viên vay quỹ hỗ trợ học tập số tiền $50$ triệu đồng. Ngân hàng cho hưởng "ân hạn" trong $4$ năm học (nghĩa là trong 4 năm này sinh viên không phải đóng bất kì khoản tiền nào, tiền lãi mỗi năm được cộng gộp vào gốc). Lãi suất là $5\%$/năm. Ngay sau khi ra trường (tròn 4 năm kể từ lúc vay), sinh viên bắt đầu trả góp mỗi năm một khoản cố định để trả hết nợ trong $5$ năm tiếp theo. Số tiền sinh viên phải đóng mỗi năm là bao nhiêu?],
    (
        [$11 500 000$ đồng.],
        [$12 800 000$ đồng.],
        True([$14 037 000$ đồng.]),
        [$15 200 000$ đồng.]
    ),
    loigiai: [
        *Bài toán vay vốn có ân hạn.*
        - *Giai đoạn 1 (Ân hạn 4 năm):* Tiền gốc sinh lãi kép.
        $
          P' = P(1 + r)^4 = 50(1 + 0.05)^4 = 50(1.05)^4 approx 60.7753 " (triệu đồng)"
        $
        - *Giai đoạn 2 (Trả góp 5 năm):* Coi $P'$ là khoản vay mới, trả trong $n=5$ năm.
        $
          a = (P' dot r) / (1 - (1+r)^(-5)) = (60.7753 dot 0.05) / (1 - 1.05^(-5)) = 3.0387 / 0.21647 approx 14.037 " (triệu đồng)"
        $
        Vậy sinh viên phải trả $14 037 000$ đồng mỗi năm.
    ]
)


#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Ông G gửi $200$ triệu đồng vào ngân hàng. Lãi suất ngân hàng trong $2$ năm đầu là $7\%$/năm, sang $3$ năm tiếp theo lãi suất giảm còn $6\%$/năm. Lãi được gộp vào gốc mỗi cuối năm. Các phát biểu sau đúng hay sai?], (
        [Sau $2$ năm đầu, số tiền của ông G là $228$ triệu đồng.],
        [Tiền lãi phát sinh trong năm thứ 3 được tính trên phần gốc $200$ triệu đồng ban đầu.],
        True([Sau $5$ năm tổng cộng, ông G thu được số tiền là $200(1.07)^2 (1.06)^3$ triệu đồng.]),
        [Tổng số tiền lãi ông G thu được sau $5$ năm ít hơn $70$ triệu đồng.]
    ), 
    loigiai: [
        - *a)* Sai. Số tiền sau $2$ năm đầu: $A_2 = 200(1+0.07)^2 = 200(1.1449) = 228.98$ triệu đồng.
        - *b)* Sai. Trong thể thức lãi kép, lãi năm thứ 3 được tính trên tổng gốc và lãi sau 2 năm (tức là $228.98$ triệu).
        - *c)* Đúng. Công thức tính cho giai đoạn thay đổi lãi suất:
          $ A_5 = 200(1.07)^2 (1.06)^3 $
        - *d)* Sai. Tính cụ thể số tiền $A_5$:
          $ A_5 = 228.98 dot (1.06)^3 = 228.98 dot 1.191016 approx 272.7 " (triệu đồng)" $
          Tiền lãi = $272.7 - 200 = 72.7$ triệu đồng. Con số này lớn hơn $70$ triệu.
    ]
)

// DS 2
#ds([Một gia đình vay $2$ tỷ đồng để mua nhà với lãi suất $0.6\%$/tháng, thời hạn $20$ năm ($240$ tháng), trả góp cuối mỗi tháng một khoản $a$. Các phát biểu sau đúng hay sai?], (
        True([Số tiền $a$ phải trả mỗi tháng là $a = (2000 dot 0.006) / (1 - 1.006^(-240))$ triệu đồng.]),
        True([Tháng đầu tiên, tiền lãi gia đình này phải trả cho ngân hàng là $12$ triệu đồng.]),
        [Phần lớn số tiền $a$ đóng trong những tháng đầu tiên được dùng để trừ vào nợ gốc.],
        True([Nếu lãi suất giảm xuống $0.5\%$/tháng thì số tiền đóng $a$ hàng tháng sẽ giảm xuống.])
    ), 
    loigiai: [
        *Phân tích bài toán mua nhà trả góp.*
        - *a)* Đúng. Đây là công thức chuẩn của bài toán vay trả góp.
        - *b)* Đúng. Tháng đầu tiên, tiền lãi được tính trên dư nợ gốc ban đầu:
          $ L_1 = P dot r = 2000 dot 0.006 = 12 " (triệu đồng)" $
        - *c)* Sai. Bấm máy tính tính $a$:
          $ a = 12 / (1 - 1.006^(-240)) approx 12 / 0.762 = 15.74 " (triệu đồng)" $
          Vì đóng $15.74$ triệu mà tiền lãi đã chiếm $12$ triệu, nên phần trừ vào nợ gốc chỉ là $3.74$ triệu. Nghĩa là trong những năm đầu, phần lớn tiền đóng là trả lãi, chứ không phải trừ gốc.
        - *d)* Đúng. Lãi suất giảm thì tiền lãi hàng tháng giảm, dẫn đến số tiền $a$ đóng hàng tháng sẽ nhỏ lại.
    ]
)

// DS 3
#ds([Bà H dự tính mỗi đầu năm sẽ gửi $20$ triệu đồng vào quỹ tiết kiệm giáo dục cho con với lãi suất $8\%$/năm trong vòng $15$ năm. Các phát biểu sau đúng hay sai?], (
        True([Đây là bài toán gửi tiền định kì đầu kỳ.]),
        [Khoản $20$ triệu đồng gửi vào năm đầu tiên sẽ sinh lãi $14$ năm.],
        True([Tổng số tiền thu được sau $15$ năm là $20/0.08 (1.08) [(1.08)^15 - 1]$.]),
        [Nếu gửi vào *cuối* năm thay vì đầu năm, bà H sẽ nhận được số tiền nhiều hơn so với gửi đầu năm.]
    ), 
    loigiai: [
        - *a)* Đúng. Gửi đầu mỗi năm là chuỗi gửi định kì đầu kỳ.
        - *b)* Sai. Khoản tiền gửi vào ngay năm đầu tiên sẽ nằm trong ngân hàng trọn vẹn $15$ kỳ hạn, nên nó sinh lãi $15$ năm (nhân với $(1+r)^15$).
        - *c)* Đúng. Công thức chuẩn của gửi định kì đầu kỳ.
        - *d)* Sai. Gửi đầu năm thì tiền có nhiều thời gian sinh lãi hơn trong ngân hàng. Gửi cuối năm thì số tiền thu được sẽ ít hơn.
    ]
)

// DS 4
#ds([Một khoản vốn đầu tư tăng trưởng liên tục. Lãi suất danh nghĩa hàng năm là $10\%$. Người ta so sánh hai phương pháp tính lãi: (I) Ghép lãi liên tục và (II) Ghép lãi theo ngày (1 năm = 365 ngày). Các phát biểu sau đúng hay sai?], (
        True([Công thức tính tiền theo (I) là $A = P e^(0.1 t)$.]),
        True([Công thức tính tiền theo (II) là $A = P (1 + 0.1/365)^(365 t)$.]),
        [Giá trị của phương pháp (I) luôn nhỏ hơn phương pháp (II).],
        True([Lãi suất thực tế của cả hai phương pháp đều lớn hơn mức danh nghĩa $10\%$.])
    ), 
    loigiai: [
        - *a)* Đúng. Công thức lãi kép liên tục.
        - *b)* Đúng. Công thức lãi kép ghép theo kỳ hạn ngày.
        - *c)* Sai. Bản chất $e^r = lim_(n -> +oo) (1 + r/n)^n$. Dãy số $(1 + r/n)^n$ là dãy tăng. Do đó khi ghép lãi liên tục ($n -> oo$), số tiền sinh ra luôn lớn hơn việc ghép lãi hữu hạn số kỳ.
        - *d)* Đúng.
          - Lãi suất thực phương pháp (I): $e^0.1 - 1 approx 0.10517 = 10.517\%$.
          - Lãi suất thực phương pháp (II): $(1 + 0.1/365)^365 - 1 approx 0.10515 = 10.515\%$.
          Cả hai đều lớn hơn $10\%$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một phụ huynh muốn con mình khi đủ $18$ tuổi sẽ có một khoản tiền $500$ triệu đồng để học đại học. Hiện tại con vừa tròn $10$ tuổi. Phụ huynh quyết định gửi ngay một cục tiền duy nhất vào ngân hàng (lãi kép $7\%$/năm). Hỏi phụ huynh cần gửi bao nhiêu triệu đồng? (Làm tròn kết quả đến một chữ số thập phân).],
    [291.0],
    loigiai: [
        *Bài toán tính giá trị hiện tại (Gửi 1 lần).*
        - *Sơ đồ trục thời gian:*
        #draw-timeline-single("P", "500", "8", "7%")
        - *Giải chi tiết:* Thời gian gửi là $n = 18 - 10 = 8$ năm.
        $ A = P(1+r)^n <=> 500 = P(1.07)^8 $
        $ <=> P = 500 / 1.07^8 approx 500 / 1.718186 approx 291.004 " (triệu đồng)" $
        Làm tròn đến một chữ số thập phân, phụ huynh cần gửi $291.0$ triệu đồng.
    ]
)

// TL 2
#tln([Nhân dịp đi làm thêm được trả lương, mỗi tháng cuối tháng sinh viên T đều trích ra $2$ triệu đồng để gửi tiết kiệm với lãi suất $0.4\%$/tháng. Sau $12$ tháng, T sẽ có bao nhiêu tiền (triệu đồng)? (Làm tròn đến hai chữ số thập phân).],
    [24.54],
    loigiai: [
        *Bài toán gửi định kì cuối kỳ.*
        - *Sơ đồ dòng tiền:*
        #draw-timeline-annuity-ord("2", "A", "12")
        - *Giải chi tiết:* 
        $ A = a/r [(1+r)^n - 1] = 2/0.004 [(1.004)^12 - 1] $
        $ A = 500 [1.04907 - 1] = 500 dot 0.04907 = 24.535 " (triệu đồng)" $
        Làm tròn đến hai chữ số thập phân là $24.54$.
    ]
)

// TL 3
#tln([Một người trúng độc đắc $5$ tỷ đồng. Anh ta lập tức gửi toàn bộ vào ngân hàng với lãi suất $6\%$/năm (kì hạn 1 năm). Anh ta lên kế hoạch mỗi cuối năm rút ra đúng $400$ triệu đồng để chi tiêu. Số tiền còn lại trong ngân hàng sau lần rút ở cuối năm thứ 3 là bao nhiêu (triệu đồng)? (Làm tròn đến hàng đơn vị).],
    [4682],
    loigiai: [
        *Bài toán rút tiền.*
        - *Công thức:* Số dư sau năm thứ $k$ là $S_k = P(1+r)^k - a/r [(1+r)^k - 1]$.
        Ở đây $P = 5000$ (triệu đồng), $a = 400$ (triệu đồng), $r = 0.06$, $k = 3$.
        $ S_3 = 5000(1.06)^3 - 400/0.06 [(1.06)^3 - 1] $
        $ S_3 = 5000(1.191016) - 6666.667 dot 0.191016 $
        $ S_3 = 5955.08 - 1273.44 = 4681.64 " (triệu đồng)" $
        Làm tròn đến hàng đơn vị, kết quả là $4682$ triệu đồng.
    ]
)

// TL 4
#tln([Một công ty cần vay $500$ triệu đồng để mở rộng sản xuất. Ngân hàng cho vay với lãi suất $0.7\%$/tháng trong thời gian $5$ năm (60 tháng), trả góp gốc và lãi định kì hàng tháng. Hỏi tổng số tiền lãi mà công ty phải chịu trong suốt $5$ năm vay là bao nhiêu triệu đồng? (Làm tròn kết quả đến một chữ số thập phân).],
    [113.8],
    loigiai: [
        *Bài toán tổng tiền lãi trả góp.*
        - Bước 1: Tính số tiền phải đóng hằng tháng $a$.
        $ a = (P dot r) / (1 - (1+r)^(-n)) = (500 dot 0.007) / (1 - 1.007^(-60)) = 3.5 / 0.34215 approx 10.2294 " (triệu đồng)" $
        - Bước 2: Tính tổng tiền phải trả trong $60$ tháng.
        $ "Tổng đóng" = 60 dot a = 60 dot 10.2294 = 613.764 " (triệu đồng)" $
        - Bước 3: Tính tổng số tiền lãi.
        $ "Tiền lãi" = 613.764 - 500 = 113.764 " (triệu đồng)" $
        Làm tròn đến một chữ số thập phân là $113.8$.
    ]
)

// TL 5
#tln([Năm 2024, một kg gạo giá $20$ nghìn đồng. Do lạm phát, giá trị đồng tiền giảm dần tương đương với mức tăng giá hàng hóa là $4\%$/năm. Nếu lương của bạn không đổi, để mua được số gạo trị giá $20$ nghìn đồng của năm 2024 vào năm 2034 ($10$ năm sau), bạn phải tốn bao nhiêu nghìn đồng? (Giả định quy mô lạm phát tác động theo lãi kép liên tục, làm tròn đến một chữ số thập phân).],
    [29.8],
    loigiai: [
        *Bài toán lạm phát (lãi kép liên tục).*
        - *Công thức:* $P(t) = P_0 e^(r t)$.
        $ P_0 = 20, r = 0.04, t = 10 $
        $ P(10) = 20 e^(0.04 dot 10) = 20 e^0.4 approx 20 dot 1.4918 = 29.836 " (nghìn đồng)" $
        Làm tròn đến một chữ số thập phân là $29.8$ nghìn đồng.
    ]
)

// TL 6
#tln([Kế hoạch tài chính 2 giai đoạn: Chú I gửi ngay vào ngân hàng $300$ triệu đồng, sau đó từ cuối tháng thứ nhất chú gửi thêm mỗi tháng $3$ triệu đồng. Lãi suất không đổi $0.6\%$/tháng. Hỏi sau đúng $2$ năm (24 tháng), tổng số tiền chú I thu được là bao nhiêu triệu đồng? (Làm tròn đến hàng đơn vị).],
    [424],
    loigiai: [
        *Bài toán kết hợp.*
        Số tiền cuối cùng bằng tổng số tiền sinh ra từ cục $300$ triệu và dòng tiền đều $3$ triệu.
        - Số tiền từ $300$ triệu gửi 1 lần:
        $ A_1 = 300(1.006)^24 approx 300 dot 1.15443 = 346.33 " (triệu đồng)" $
        - Số tiền từ dòng chuỗi gửi định kì cuối tháng:
        $ A_2 = 3/0.006 [(1.006)^24 - 1] = 500[1.15443 - 1] = 500 dot 0.15443 = 77.215 " (triệu đồng)" $
        Tổng số tiền:
        $ A = A_1 + A_2 = 346.33 + 77.215 = 423.545 " (triệu đồng)" $
        Làm tròn đến hàng đơn vị là $424$ triệu đồng.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
