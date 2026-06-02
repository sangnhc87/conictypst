#import "../sang-exam.typ": *
#import "../template.typ": *

#set page(paper: "a4", margin: (x: 1.45cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0B1F54"), rgb("0D47A1"), rgb("006064"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.7em,
  below: 1.1em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.35em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("006064")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("006064"), size: 12pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("0B1F54")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#let col-navy = rgb("0B1F54")
#let col-teal = rgb("006064")
#let col-green = rgb("2E7D32")
#let col-amber = rgb("E65100")

#let intro-box(title: none, body) = block(
  fill: rgb("EEF6FF"),
  stroke: (left: 4pt + col-navy, rest: 0.6pt + rgb("CFD8DC")),
  radius: (right: 7pt),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-navy, weight: "bold")[#title]
    #v(0.3em)
  ]
  #body
]

#let note-box(title: none, body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 4pt + col-amber, rest: 0.6pt + rgb("FFE082")),
  radius: (right: 7pt),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-amber, weight: "bold")[#title]
    #v(0.3em)
  ]
  #body
]

#let ans-box(body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + col-green, rest: 0.6pt + rgb("C8E6C9")),
  radius: (right: 7pt),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
)[
  #text(fill: col-green, weight: "bold")[Kết luận]
  #v(0.3em)
  #body
]

#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("09152E"), rgb("0B1F54"), rgb("0D47A1"), rgb("006064"), angle: 135deg),
    radius: 12pt,
    inset: (x: 20pt, y: 24pt),
  )[
    #text(fill: rgb("B3E5FC"), size: 11pt, weight: "bold", tracking: 2pt)[BỘ ĐỀ LUYỆN RIÊNG]
    #v(0.5em)
    #text(fill: white, size: 21pt, weight: "bold")[Tối Ưu Kinh Tế Đa Điều Kiện - 15 Câu]
    #v(0.35em)
    #text(fill: rgb("E1F5FE"), size: 12.5pt)[Bám đúng 5 nhóm dạng của file chính]
    #v(0.5em)
    #text(
      fill: rgb("B3E5FC"),
      size: 10.5pt,
      style: "italic",
    )[(Mỗi câu đều có một đáp án số duy nhất và lời giải ngắn, chuẩn chấm)]
  ]
]

#v(0.9em)

#intro-box(title: [Cách dùng nhanh])[
  - Bộ đề gồm đúng $15$ câu, chia đều thành $5$ nhóm dạng, mỗi nhóm $3$ câu.

  - Mỗi câu đều có *một đáp án duy nhất*, tránh kiểu kết luận hai phương án cùng đúng.

  - Nên dùng theo nhịp: dạy $1$ bài mẫu xong cho học sinh làm ngay $1$ đến $2$ câu cùng nhóm.

  - Khi chấm, ưu tiên kiểm tra đủ $4$ bước: đặt biến, chia miền, dựng hàm đúng, kết luận đúng đơn vị.
]

#note-box(title: [Phân bố nhóm dạng])[
  Nhóm $1$: doanh thu phân đoạn và miền không lỗ. \
  Nhóm $2$: giải phương trình trên hàm giá cước phân đoạn. \
  Nhóm $3$: tối ưu rời rạc với chi phí bậc thang. \
  Nhóm $4$: cực đại dưới thuế lũy tiến. \
  Nhóm $5$: cực trị biên với ràng buộc kỹ thuật.
]

#note-box(title: [Lưu ý về thuật ngữ "Hàm Đa Trị" (Hàm Phân Nhánh)])[
  Nhiều em thắc mắc: *Hàm phân nhánh có cần liên tục (giá trị hai nhánh chạm nhau) tại mốc không?*
  - *Loại LUÔN CHẠM NHAU:* Biểu cước lũy tiến (Nhóm 2) hoặc Thuế doanh thu lũy tiến (Nhóm 4). Ở đây phần dưới mốc vẫn tính mức cũ, phần vượt mốc mới bị áp mức mới cho đoạn dôi ra. Do đó đồ thị luôn dính liền tại mốc, việc định nghĩa hàm `cases` chạy liên tục là hiển nhiên.
  - *Loại KHÔNG TRÙNG NHAU (Nhảy Bậc):* Giảm giá sỉ cho *toàn bộ* đơn hàng (Nhóm 1) hoặc đổi định mức chi phí do quy mô (Nhóm 3). Khi đi qua mốc, chính sách tính toán bị áp ngược lại trên *toàn bộ* khối lượng, làm giá trị tổng bị nhảy bậc, đồ thị đứt đoạn.
  
  *Kinh nghiệm:* Thiết lập thành một hệ phương trình `cases` sẽ giúp nhìn thấy lập tức điều kiện mốc mà cấu trúc không bị rối.
]

#resetexamstate()

= Nhóm 1 — Doanh Thu Phân Đoạn Và Miền Không Lỗ

#tln(
  id: "KT-DL-01",
  [Một công ty tổ chức hoạt động trải nghiệm thông báo rằng $24$ học sinh đầu tiên đóng $34$ USD/người. Nếu có nhiều hơn $24$ học sinh đăng ký thì cứ thêm $1$ học sinh, mức phí sẽ giảm $1$ USD/người cho toàn bộ đoàn. Biết chi phí cố định để tổ chức chương trình là $720$ USD. Hỏi công ty nên giới hạn tối đa bao nhiêu học sinh để không bị lỗ?],
  [$40$],
  loigiai: [
    #ppgiai[
      - Gọi $x$ là số học sinh đăng ký, với $x$ nguyên dương.
      - Khi $1 <= x <= 24$, doanh thu là $R(x) = 34 x$.
      - Khi $x > 24$, đơn giá mới là $34 - (x - 24) = 58 - x$, nên $R(x) = x (58 - x)$.
      - Điều kiện không lỗ là $R(x) >= 720$.
    ]

    - *Đoạn $1 <= x <= 24$*:
      $34 x >= 720 => x >= 21","176...$
      nên trên đoạn này ta có $22 <= x <= 24$.

    - *Đoạn $x > 24$*:
      $x (58 - x) >= 720$
      $<=> x^2 - 58 x + 720 <= 0$
      $<=> (x - 18)(x - 40) <= 0.$

      Suy ra $18 <= x <= 40$. Kết hợp với điều kiện $x > 24$, ta được $25 <= x <= 40$.

    - Gộp hai đoạn: $22 <= x <= 40$.

    #ans-box[Công ty nên giới hạn tối đa *$40$ học sinh*.]
  ],
)

#tln(
  id: "KT-DL-02",
  [Một câu lạc bộ ngoại khóa bán vé tham quan như sau: $28$ học sinh đầu tiên trả $36$ nghìn đồng/người. Nếu số học sinh vượt quá $28$ thì cứ thêm $1$ người, giá vé giảm $1$ nghìn đồng/người cho toàn bộ đoàn. Chi phí trọn gói của chuyến đi là $828$ nghìn đồng. Hỏi số học sinh tối đa để câu lạc bộ không bị lỗ là bao nhiêu?],
  [$46$],
  loigiai: [
    #ppgiai[
      - Gọi $x$ là số học sinh tham gia, với $x$ nguyên dương.
      - Nếu $x <= 28$ thì $R(x) = 36 x$.
      - Nếu $x > 28$ thì đơn giá mới là $36 - (x - 28) = 64 - x$, nên $R(x) = x (64 - x)$.
      - Ta giải điều kiện $R(x) >= 828$ trên từng đoạn.
    ]

    - *Đoạn $1 <= x <= 28$*:
      $36 x >= 828 => x >= 23.$
      Vậy đoạn này cho $23 <= x <= 28$.

    - *Đoạn $x > 28$*:
      $x (64 - x) >= 828$
      $<=> x^2 - 64 x + 828 <= 0$
      $<=> (x - 18)(x - 46) <= 0.$

      Suy ra $18 <= x <= 46$. Kết hợp với $x > 28$, ta được $29 <= x <= 46$.

    - Gộp lại ta có $23 <= x <= 46$.

    #ans-box[Số học sinh tối đa để không lỗ là *$46$*.]
  ],
)

#pagebreak()


#tln(
  id: "KT-DL-03",
  [Một cửa hàng bán quà lưu niệm có chính sách như sau: $30$ hộp đầu tiên bán với giá $50$ nghìn đồng/hộp. Nếu mua nhiều hơn $30$ hộp thì cứ thêm $1$ hộp, giá bán sẽ giảm $1$ nghìn đồng/hộp cho *toàn bộ* số hộp trong đơn. Chuyến lấy hàng cố định chi phí là $1200$ nghìn đồng. Hỏi khách có thể mua số hộp tối đa là bao nhiêu để cửa hàng vẫn không bị lỗ?],
  [$60$],
  loigiai: [
    #ppgiai[
      - Gọi $x$ là số hộp cần mua, $x$ nguyên dương.
      - Thay vì tính mò, ta lập hàm doanh thu đa trị $R(x)$ chung và giải bất phương trình $R(x) >= 1200$ ở cả hai đoạn.
    ]

    Ta có hàm doanh thu biểu diễn thành hệ đa trị dễ nhìn:
    $
      R(x) = cases(
        50 x & "nếu" 1 <= x <= 30,
        x(50 - (x - 30)) = x(80 - x) & "nếu" x > 30
      )
    $
    
    - *Trên đoạn $1 <= x <= 30$*:
      $50 x >= 1200 => x >= 24.$ Kết hợp điều kiện miền nhánh này, ta có $24 <= x <= 30$.

    - *Trên đoạn $x > 30$*:
      $x(80 - x) >= 1200 <=> x^2 - 80 x + 1200 <= 0$
      $<=> (x - 20)(x - 60) <= 0 => 20 <= x <= 60.$
      Kết hợp với điều kiện giới hạn $x > 30$, ta thu được đoạn thỏa mãn là $31 <= x <= 60$.

    Gộp chung kết quả ở cả hai nhánh ta được miền an toàn $24 <= x <= 60$.

    #ans-box[Khách có thể mua tối đa mốc cao nhất là *$60$ hộp*.]
  ],
)
= Nhóm 2 — Giải Phương Trình Trên Hàm Giá Cước Phân Đoạn

#tln(
  id: "KT-DL-04",
  [Một dịch vụ giao hồ sơ hỏa tốc tính phí theo quãng đường $x$ km như sau:
    - $2$ km đầu tiên: $28$ nghìn đồng trọn gói;
    - từ km thứ $3$ đến km thứ $8$: thêm $14$ nghìn đồng/km;
    - từ km thứ $9$ trở đi: thêm $11$ nghìn đồng/km;
    - nếu chuyến giao dài hơn $12$ km thì phải cộng thêm phụ phí cầu đường $18$ nghìn đồng, đồng thời được giảm $5\%$ trên cước cơ bản (không tính phụ phí).

    Biết khách phải trả đúng $145$ nghìn đồng. Hãy tìm quãng đường $x$.],
  [$11$],
  loigiai: [
    #ppgiai[
      - Ta dựng hàm cước theo các mốc $2$, $8$, $12$ km.
      - Sau đó giải phương trình $T(x) = 145$ trên từng đoạn có khả năng.
    ]

    Ta có
    $
      T(x) = cases(
        28 & "nếu" 0 < x <= 2,
        28 + 14 (x - 2) = 14 x & "nếu" 2 < x <= 8,
        112 + 11 (x - 8) = 11 x + 24 & "nếu" 8 < x <= 12,
        0","95 (11 x + 24) + 18 = 10","45 x + 40","8 & "nếu" x > 12
      )
    $

    - Hai đoạn đầu cho giá lớn nhất chỉ đến $112$, nên không thể đạt $145$.

    - *Đoạn $8 < x <= 12$*:
      $11 x + 24 = 145 => 11 x = 121 => x = 11.$
      Giá trị này thuộc đúng đoạn đang xét nên *nhận*.

    - *Đoạn $x > 12$*:
      $10","45 x + 40","8 = 145 => x approx 9","97.$
      Giá trị này không thỏa $x > 12$ nên *loại*.

    #ans-box[Quãng đường giao hồ sơ là *$11$ km*.]
  ],
)

#tln(
  id: "KT-DL-05",
  [Một bãi đỗ xe áp dụng biểu phí theo thời gian $x$ giờ như sau:
    - giờ đầu tiên: $25$ nghìn đồng;
    - từ giờ thứ $2$ đến hết giờ thứ $4$: thêm $12$ nghìn đồng/giờ;
    - từ sau giờ thứ $4$ đến hết giờ thứ $6$: thêm $9$ nghìn đồng/giờ;
    - nếu gửi quá $6$ giờ thì khách phải trả thêm phí dịch vụ $18$ nghìn đồng, nhưng được giảm $10\%$ trên cước cơ bản.

    Biết tổng số tiền thực trả là $105","3$ nghìn đồng. Hỏi xe đã gửi trong bao nhiêu giờ?],
  [$8$],
  loigiai: [
    #ppgiai[
      - Đặt $x > 0$ là thời gian gửi xe, tính theo giờ.
      - Dựng hàm phí theo các mốc $1$, $4$, $6$ giờ.
      - Vì tổng phí đã lớn hơn mức tối đa ở đoạn $x <= 6$, ta chỉ cần xét đoạn cuối.
    ]

    Ta có
    $
      T(x) = cases(
        25 & "nếu" 0 < x <= 1,
        25 + 12 (x - 1) = 12 x + 13 & "nếu" 1 < x <= 4,
        61 + 9 (x - 4) = 9 x + 25 & "nếu" 4 < x <= 6,
        0","9 (9 x + 25) + 18 = 8","1 x + 40","5 & "nếu" x > 6
      )
    $

    Trên đoạn $4 < x <= 6$, giá lớn nhất là
    $T(6) = 9 dot 6 + 25 = 79,$
    nhỏ hơn $105","3$. Vậy chắc chắn $x > 6$.

    Khi đó
    $8","1 x + 40","5 = 105","3$
    $=> 8","1 x = 64","8$
    $=> x = 8.$

    #ans-box[Thời gian gửi xe là *$8$ giờ*.]
  ],
)

#pagebreak()


#tln(
  id: "KT-DL-06",
  [Biểu giá nước sinh hoạt quy định được chia mốc:
    - $10$ khối đầu tiên: $6$ nghìn đồng/khối;
    - từ khối thứ $11$ đến khối thứ $20$: $8$ nghìn đồng/khối;
    - từ khối thứ $21$ đến khối thứ $30$: $10$ nghìn đồng/khối;
    - từ khối thứ $31$ trở đi: $13$ nghìn đồng/khối.
    
    Trong tháng qua hóa đơn tiền nước của nhà Bình là $220$ nghìn đồng (chỉ tính thuần túy cước sử dụng). Dựa vào hàm đa trị, hãy lùi lại xem nhà Bình đã dùng bao nhiêu khối nước?],
  [$28$],
  loigiai: [
    #ppgiai[
      - Tương tự tính dồn lẻ tẻ, biểu diễn thẳng nó vào một hàm phân khối $T(x)$. Các nhánh sẽ tự động liền mạch do tính lũy tiến vượt mốc.
      - Khối lượng $x$ thỏa mãn ở nhánh nào thì sẽ giải phương trình tại nhánh đó.
    ]

    Hàm giá cước cấu trúc lũy tiến:
    $
      T(x) = cases(
        6 x & "nếu" 0 < x <= 10,
        60 + 8(x - 10) = 8 x - 20 & "nếu" 10 < x <= 20,
        140 + 10(x - 20) = 10 x - 60 & "nếu" 20 < x <= 30,
        240 + 13(x - 30) = 13 x - 150 & "nếu" x > 30
      )
    $

    - Mức cước lớn nhất nếu chỉ dùng chạm $20$ khối là $T(20) = 140$ nghìn, chưa chạm mức $220$.
    - Thử ở nhánh $20 < x <= 30$:
      $10 x - 60 = 220 => 10 x = 280 => x = 28.$
      Vì giá trị $28$ nằm ngoan trong miền giả định $(20, 30]$ nên là nghiệm cực kỳ chuẩn xác.

    #ans-box[Nhà Bình đã dùng lượng nước là *$28$ khối*.]
  ],
)
= Nhóm 3 — Tối Ưu Rời Rạc Với Chi Phí Bậc Thang

#tln(
  id: "KT-DL-07",
  [Một không gian làm việc chung có $40$ chỗ ngồi. Nếu giá thuê là $5$ triệu đồng/chỗ/tháng thì tất cả chỗ ngồi đều được thuê. Cứ mỗi lần tăng giá thêm $500$ nghìn đồng/chỗ/tháng thì sẽ có $2$ chỗ bị bỏ trống.

    Chi phí vận hành tính theo số chỗ đã thuê như sau:
    - nếu còn từ $32$ chỗ được thuê trở lên thì chi phí là $600$ nghìn đồng/chỗ/tháng;
    - nếu dưới $32$ chỗ được thuê thì chi phí tăng lên $1$ triệu đồng/chỗ/tháng.

    Hỏi nên tăng giá bao nhiêu lần để lợi nhuận ròng mỗi tháng lớn nhất?],
  [$4$],
  loigiai: [
    #ppgiai[
      - Gọi $x$ là số lần tăng giá ($x$ nguyên không âm, $0 <= x <= 20$).
      - Doanh thu: $R(x) = (40 - 2 x)(5 + 0","5 x)$.
      - Mốc đổi chi phí: $40 - 2 x = 32 <=> x = 4$. Ta dựng hàm lợi nhuận phân nhánh.
    ]

    Ta có hàm lợi nhuận ròng $L(x) = R(x) - C(x)$:
    $
      L(x) = cases(
        (40 - 2 x)(5 + 0","5 x) - 0","6 (40 - 2 x) = -x^2 + 11","2 x + 176 & "nếu" 0 <= x <= 4,
        (40 - 2 x)(5 + 0","5 x) - 1 (40 - 2 x) = -x^2 + 12 x + 160 & "nếu" 5 <= x <= 20
      )
    $

    - *Trên đoạn $0 <= x <= 4$*:
      Đạo hàm $L'(x) = -2 x + 11","2 > 0$ trên đoạn này, nên hàm đồng biến.
      Giá trị lớn nhất đạt tại $x = 4$:
      $L(4) = 204","8.$

    - *Trên đoạn $5 <= x <= 20$*:
      Parabol $y = -x^2 + 12 x + 160$ đạt cực đại tại đỉnh:
      $ x = -frac(12, 2 dot (-1)) = 6. $
      Giá trị tương ứng: $L(6) = 196.$

    - So sánh hai nhánh, ta thấy lợi nhuận lớn nhất đạt tại $x = 4$.

    #ans-box[Nên tăng giá *$4$ lần*.]
  ],
)

#tln(
  id: "KT-DL-08",
  [Một dãy căn hộ studio có $36$ phòng cho thuê. Nếu giá thuê là $3","6$ triệu đồng/phòng/tháng thì tất cả các phòng đều có người thuê. Cứ mỗi lần tăng giá thêm $250$ nghìn đồng/phòng/tháng thì sẽ có $2$ phòng bị bỏ trống.

    Chi phí quản lý tính theo số phòng có người ở:
    - nếu còn từ $30$ phòng trở lên thì chi phí là $500$ nghìn đồng/phòng/tháng;
    - nếu dưới $30$ phòng thì chi phí tăng lên $800$ nghìn đồng/phòng/tháng.

    Hỏi nên tăng giá bao nhiêu lần để lợi nhuận ròng lớn nhất?],
  [$3$],
  loigiai: [
    #ppgiai[
      - Gọi $x$ là số lần tăng giá ($x$ nguyên không âm, $0 <= x <= 18$).
      - Doanh thu: $R(x) = (36 - 2 x)(3","6 + 0","25 x)$.
      - Mốc đổi chi phí: $36 - 2 x = 30 <=> x = 3$. Lập hàm lợi nhuận phân nhánh.
    ]

    Ta có hàm lợi nhuận ròng $L(x) = R(x) - C(x)$:
    $
      L(x) = cases(
        (36 - 2 x)(3","6 + 0","25 x) - 0","5 (36 - 2 x) = -0","5 x^2 + 2","8 x + 111","6 & "nếu" 0 <= x <= 3,
        (36 - 2 x)(3","6 + 0","25 x) - 0","8 (36 - 2 x) = -0","5 x^2 + 3","4 x + 100","8 & "nếu" 4 <= x <= 18
      )
    $

    - *Trên đoạn $0 <= x <= 3$*:
      Đỉnh parabol nằm tại $x = -frac(2","8, 2 dot (-0","5)) = 2","8$.
      Vì $x$ nguyên, so sánh hai giá trị nguyên gần đỉnh nhất:
      $L(2) = 115","2, quad L(3) = 115","5.$
      Nhánh này lớn nhất tại $x = 3$.

    - *Trên đoạn $4 <= x <= 18$*:
      Đỉnh parabol nằm tại $x = 3","4$, nằm ngoài miền $[4, 18]$.
      Do đó hàm nghịch biến trên đoạn này, đạt lớn nhất tại biên trái $x = 4$:
      $L(4) = 106","4.$

    - So sánh $115","5$ và $106","4$, ta chọn $x = 3$.

    #ans-box[Nên tăng giá *$3$ lần*.]
  ],
)

#pagebreak()


#tln(
  id: "KT-DL-09",
  [Một công ty vận tải chạy chuyến nguyên tàu du lịch thiết kế $60$ ghế. Nếu giá thuê cố định ở mức $3$ triệu đồng/ghế thì tàu kín chỗ. Khảo sát chỉ ra cứ tăng thêm biên $0","2$ triệu đồng/ghế thì khách bớt đi $2$ người (trống $2$ ghế).
   
    Mặt khác, chi phí phục vụ tối thiểu trên khách là $0","8$ triệu đồng/ghế nếu tàu có từ $44$ hành khách trở lên. Nếu rơi xuống dưới $44$ khách, do hiệu suất suy giảm, chi phí vận hành đội lên $1$ triệu đồng/ghế. Hỏi công ty nên áp số lần tăng giá là bao nhiêu để kiếm lãi ròng nhiều nhất?],
  [$8$],
  loigiai: [
    #ppgiai[
      - Lượt tăng giá $x$ (nguyên không âm). Số hành khách có trên tàu biến đổi theo $60 - 2x$.
      - Khi hành khách giảm đến mốc $44$, chi phí từ trên xuống bị "nhảy mốc", đây không phải lũy tiến nên đồ thị sẽ chênh phô cực mạnh (không liền nét).
      - Hàm đa trị ở đây vô cùng thiết yếu.
    ]

    Mốc gãy chi phí xuất hiện khi: $60 - 2x = 44 <=> 2x = 16 <=> x = 8$.
    Vậy hàm lợi nhuận $L(x) = R(x) - C(x)$ nêm đủ thành hệ:
    $
      L(x) = cases(
        (60-2x)(3 + 0","2x) - 0","8(60-2x) = -0","4 x^2 + 7","6 x + 132 & "nếu" 0 <= x <= 8,
        (60-2x)(3 + 0","2x) - 1(60-2x) = -0","4 x^2 + 8 x + 120 & "nếu" 9 <= x <= 30
      )
    $

    - *Trên đoạn $0 <= x <= 8$*:
      Hàm có hình dạng parabol, đỉnh tại $x = 7","6 / 0","8 = 9","5$, nằm hẳn bên ngoài mốc đang xét. Nghĩa là đồ thị đang mải miết đi lên trên đoạn $[0, 8]$. Tính lớn nhất ăn ngay đuôi phải $x=8$:
      $L(8) = -0","4 dot 64 + 7","6 dot 8 + 132 = 167","2.$

    - *Trên đoạn $9 <= x <= 30$*:
      Đỉnh parabol của nhánh này lại lọt vào $x = 8 / 0","8 = 10$. Tính giá trị tại đây:
      $L(10) = -0","4 dot 100 + 8 dot 10 + 120 = 160.$

    So sánh $167","2$ và $160$, ta thấy lợi nhuận tối cao đạt ở thời điểm chưa bị gãy chi phí (tách biệt xa hẳn). Bám sát kịch $x=8$.

    #ans-box[Nên chọn điểm dừng tăng giá đúng *$8$ lần*.]
  ],
)
= Nhóm 4 — Cực Đại Dưới Thuế Lũy Tiến

#tln(
  id: "KT-DL-10",
  [Một doanh nghiệp khai thác quặng bán với giá cố định $50$ triệu đồng/tấn. Nếu khai thác $q$ tấn mỗi ngày thì chi phí là $C(q) = q^2 + 9 q + 90$ (triệu đồng).

    Chính phủ đánh thuế doanh thu như sau:
    - phần doanh thu không vượt quá $500$ triệu đồng chịu thuế suất $10\%$;
    - phần doanh thu vượt quá $500$ triệu đồng chịu thuế suất $26\%$.

    Hãy biểu diễn hàm dưới dạng đa trị phân nhánh để tìm ra doanh nghiệp nên khai thác bao nhiêu tấn quặng mỗi ngày nhằm giữ lợi nhuận ròng sau thuế lớn nhất?],
  [$14$],
  loigiai: [
    #ppgiai[
      - Hàm doanh thu: $50 q$. Ngưỡng đổi mức thuế vắt ngang tại $50 q = 500 <=> q = 10$.
      - Khi thiết lập dạng hàm đa trị, ta dễ dàng bảo vệ đạo hàm riêng ở phần dưới và phần trên ngách.
    ]

    Cơn lũy tiến của thuế biểu kiến bằng hàm $T(q)$:
    $
      T(q) = cases(
        0","1(50 q) = 5 q & "nếu" 0 <= q <= 10,
        50 + 0","26 (50 q - 500) = 13 q - 80 & "nếu" q > 10
      )
    $
    (Nhận xét: Tại $q=10$, cả hai nhánh đều ra tiền thuế $50$ triệu $	o$ đúng bản chất chạm nhau).

    Ráp thành hàm lợi nhuận ròng $P(q) = 50 q - C(q) - T(q)$:
    $
      P(q) = cases(
        50 q - (q^2 + 9 q + 90) - 5 q = -q^2 + 36 q - 90 & "nếu" 0 <= q <= 10,
        50 q - (q^2 + 9 q + 90) - (13 q - 80) = -q^2 + 28 q - 10 & "nếu" q > 10
      )
    $

    - *Ở vòm đoạn $0 <= q <= 10$*:
      Vì $P_1'(q) = -2 q + 36 > 0$, hàm tiếp tục trượt dốc đi lên nên đỉnh nhỏ trên nhánh chính là $P(10) = 170$.
    - *Ở đoạn không gian khoáng sản còn lại $(10, +oo)$*:
      Dáng điệu lồi quay xuống, với tọa độ cực đại chóp ở vị trí $q = -28 / (-2) = 14$. Giá tiền cực đại trên chóp bằng $P(14) = 186$. Xét toàn cục nó cũng thắng.

    #ans-box[Rất thuyết phục vì sản lượng cần là *$14$ tấn/ngày*.]
  ],
)

#tln(
  id: "KT-DL-11",
  [Một xưởng đóng gói nông sản bán sản phẩm với giá cố định $42$ triệu đồng/tấn. Nếu sản xuất $q$ tấn mỗi ngày thì chi phí là $C(q) = q^2 + 6 q + 120$ (triệu đồng).

    Thuế doanh thu được áp dụng như sau:
    - phần doanh thu không vượt quá $420$ triệu đồng chịu thuế suất $5\%$;
    - phần doanh thu vượt quá $420$ triệu đồng chịu thuế suất $25\%$.

    Dùng hàm đa trị giải minh bạch xem xưởng nên xuất mẻ sản lượng nào để bảo toàn lời lãi lớn nhất?],
  [$12","75$],
  loigiai: [
    #ppgiai[
      - Thử quy ngưỡng thuế: $42 q = 420 => q = 10$.
      - Dựng thẳng dạng đa trị vừa dễ kiểm soát dấu gián đoạn vừa hạn chế sai lầm trích nhầm hàm lượng.
    ]

    Tập hợp khung hàm đóng thuế:
    $
      T(q) = cases(
        0","05(42 q) = 2","1 q & "nếu" 0 <= q <= 10,
        21 + 0","25(42 q - 420) = 10","5 q - 84 & "nếu" q > 10
      )
    $

    Và lập hệ phương trình khối hàm báo lời $P(q) = 42 q - C(q) - T(q)$:
    $
      P(q) = cases(
        42 q - (q^2 + 6 q + 120) - 2","1 q = -q^2 + 33","9 q - 120 & "nếu" 0 <= q <= 10,
        42 q - (q^2 + 6 q + 120) - (10","5 q - 84) = -q^2 + 25","5 q - 36 & "nếu" q > 10
      )
    $

    - *Nhánh mốc 1 ($q <= 10$)*:
      Bấm đạo hàm nhẹ $-2 q + 33","9 > 0$. Chiều dốc đi lên làm giá trị cao nhất kẹt ở biên $P(10) = 119$.
    - *Nhánh mốc 2 ($q > 10$)*:
      Parabol lật nắp có vị trí chóp lồi rơi đúng xuống $q = 25","5 / 2 = 12","75$.
      Do điểm rơi lọt khe hoàn hảo trong khu vực hàm thứ hai nên nó mặc định áp đảo cấu trúc dưới mốc.

    #ans-box[Mục tiêu sản lượng được chốt ở *$12","75$ tấn/ngày*.]
  ],
)

#tln(
  id: "KT-DL-12",
  [Thương hiệu linh kiện X ghi nhận: giá bao tiêu xuất ra cố định $80$ nghìn đồng/bo mạch. Khi triển khai quy mô $x$ nghìn bo mạch thì hao tốn chi phí rực lên $C(x) = 2 x^2 + 20 x + 400$ (nghìn đồng).
  
    Khắc nghiệt là thuế môi trường xả thải bị bóp lũy tiến sâu:
    - Bán $0$ đến $10$ nghìn linh kiện thì bị trừ phí xả thải $20$ nghìn/linh kiện.
    - Phần xả thải bị dôi vượt hạn ngạch kích cầu ($x > 10$): thì phần phụ trội bị đánh ác liệt tới $40$ nghìn/linh kiện.
    
    Hỏi nhà phân phối nên ghim sản lượng bao nhiêu để đạt khoản hiệu quả tối ưu thực tế (cực đại hàm đa trị)?],
  [$10$],
  loigiai: [
    #ppgiai[
      - Định hình thuế lũy tiến dồn ngay cho chính số linh kiện (hàm này không thông qua trục doanh thu).
      - Hàm lợi nhuận bị ghép làm $2$ vế. Khi biên độ cực trị tiệm cận sát mốc thì cần kết luận sắc sảo.
    ]

    Thuế xả thải $x$ nghìn linh kiện:
    $
      T(x) = cases(
        20 x & "nếu" 0 <= x <= 10,
        200 + 40(x - 10) = 40 x - 200 & "nếu" x > 10
      )
    $

    Hệ lợi nhuận dòng $P(x) = 80x - C(x) - T(x)$ sinh thành nhánh:
    $
      P(x) = cases(
        80x - (2x^2 + 20x + 400) - 20x = -2x^2 + 40x - 400 & "nếu" 0 <= x <= 10,
        80x - (2x^2 + 20x + 400) - (40x - 200) = -2x^2 + 20x - 200 & "nếu" x > 10
      )
    $

    - *Tại nhánh nhịp $x <= 10$*:
      Parabol lật đáy tại $x = 40 / 4 = 10$. Tính nhanh $P(10) = -200 + 400 - 400 = -200$. Dù số thực hụt tài chính nhưng về mặt độ dốc là điểm lên đỉnh điểm vòm.

    - *Tại nhánh sau vòm $x > 10$*:
      Tọa độ đỉnh rơi ở $x = 20 / 4 = 5$. Đỉnh lý thuyết bên trái hoàn toàn văng khỏi miền của nhánh, khiến cho hàm của chúng ta bị nghịch biến hoàn toàn và đang rơi dốc ngửa. 

    #ans-box[Đáp án giữ ở chính mốc biên tiếp xúc: *$10$ nghìn linh kiện* (kẽ hở lớn của việc bị ép chiết quá sâu qua ranh). Cố ép ra xa sẽ chỉ thiệt hại.]
  ],
)

#pagebreak()

= Nhóm 5 — Cực Trị Biên Với Ràng Buộc Kỹ Thuật

#tln(
  id: "KT-DL-13",
  [Một trại điện mặt trời phát điện đều với công suất $90$ kW trong suốt $3$ giờ thấp điểm. Giá bán điện ở giờ thấp điểm là $1","100$ đồng/kWh, còn ở giờ cao điểm là $3","200$ đồng/kWh. Chủ trại dự định lắp pin lưu trữ dung lượng $E$ kWh, sạc hoàn toàn từ nguồn điện mặt trời trong giờ thấp điểm rồi xả hết vào giờ cao điểm. Chi phí khấu hao pin tính theo ngày là $C(E) = 150 E + 6000$ (đồng).

    Biết dung lượng pin không được vượt quá lượng điện có thể sạc trong $3$ giờ thấp điểm. Hỏi nên chọn dung lượng pin $E$ bằng bao nhiêu để lợi nhuận tăng thêm mỗi ngày lớn nhất?],
  [$270$],
  loigiai: [
    #ppgiai[
      - Trong $3$ giờ thấp điểm, lượng điện tối đa có thể nạp vào pin là $90 dot 3 = 270$ kWh.
      - Vì vậy miền xác định là $0 <= E <= 270$.
      - Ta chỉ cần tối ưu phần lợi nhuận *tăng thêm* do pin mang lại.
    ]

    Do chuyển $E$ kWh từ thấp điểm sang cao điểm nên phần doanh thu tăng thêm là
    $
      Delta R(E) = (3200 - 1100) E = 2100 E.
    $

    Lợi nhuận tăng thêm thực sự là
    $
      P(E) = Delta R(E) - C(E) = 2100 E - (150 E + 6000) = 1950 E - 6000.
    $

    Đạo hàm:
    $
      P'(E) = 1950 > 0.
    $

    Vậy $P(E)$ tăng trên toàn bộ đoạn $[0, 270]$, nên giá trị lớn nhất đạt tại biên phải $E = 270$.

    #ans-box[Dung lượng pin tối ưu là *$270$ kWh*.]
  ],
)

#tln(
  id: "KT-DL-14",
  [Một kho lạnh được phép thuê thêm không gian dự phòng $x$ mét khối, với ràng buộc kỹ thuật $0 <= x <= 150$. Nhờ đó, doanh thu tăng thêm mỗi ngày do giảm hao hụt hàng hóa được mô hình hóa bởi
    $R(x) = 260 x - 0","4 x^2$
    (nghìn đồng), còn chi phí vận hành phần kho dự phòng là
    $C(x) = 20 x + 4000$
    (nghìn đồng).

    Hỏi nên thuê thêm bao nhiêu mét khối để lợi nhuận tăng thêm mỗi ngày lớn nhất?],
  [$150$],
  loigiai: [
    #ppgiai[
      - Miền xác định đã cho sẵn là đoạn đóng $[0, 150]$.
      - Hàm lợi nhuận tăng thêm là $P(x) = R(x) - C(x)$.
      - Với dạng này, phải xét đạo hàm trên miền rồi kết luận tại biên nếu cần.
    ]

    Ta có
    $
      P(x) = (260 x - 0","4 x^2) - (20 x + 4000) = 240 x - 0","4 x^2 - 4000.
    $

    Đạo hàm:
    $
      P'(x) = 240 - 0","8 x.
    $

    Với mọi $x in [0, 150]$, ta có
    $
      P'(x) >= 240 - 0","8 dot 150 = 120 > 0.
    $

    Vậy $P(x)$ tăng trên toàn bộ đoạn $[0, 150]$, nên giá trị lớn nhất đạt tại biên phải $x = 150$.

    #ans-box[Nên thuê thêm *$150$ mét khối*.]
  ],
)

#pagebreak()

= Bảng Đáp Số Nhanh

#align(center)[
  #table(
    columns: 5,
    stroke: 0.45pt + rgb("B0BEC5"),
    inset: (x: 8pt, y: 7pt),
    fill: (x, y) => if y == 0 { rgb("E3F2FD") } else if calc.odd(y) { rgb("FAFAFA") } else { white },
    align: center,
    table.header([*Câu*], [*Đáp số*], [*Câu*], [*Đáp số*], [*Nhóm*]),
    [$1$], [$40$], [$9$], [$8$], [$1, 3$],
    [$2$], [$46$], [$10$], [$14$], [$1, 4$],
    [$3$], [$60$], [$11$], [$12","75$], [$1, 4$],
    [$4$], [$11$], [$12$], [$10$], [$2, 4$],
    [$5$], [$8$], [$13$], [$270$], [$2, 5$],
    [$6$], [$28$], [$14$], [$150$], [$2, 5$],
    [$7$], [$4$], [$15$], [$100$], [$3, 5$],
    [$8$], [$3$], [], [], [],
  )
]
