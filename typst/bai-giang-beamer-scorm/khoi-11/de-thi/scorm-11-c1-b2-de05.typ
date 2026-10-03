// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHƯƠNG 1. LƯỢNG GIÁC (ĐỀ SỐ 05)
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

#show math.equation.where(block: true): it => math.display(it.body)

#show: lecture-theme.with(
  title: "CHƯƠNG 1. LƯỢNG GIÁC (ĐỀ SỐ 05)",
  subtitle: "ÔN TẬP CHƯƠNG 1 — MÃ ĐỀ: 101",
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
#lt-tn(num: 1, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Khi một vệ tinh quay quanh Trái Đất, góc định vị của nó thay đổi theo thời gian. Khẳng định nào sau đây diễn tả đúng tính chất tuần hoàn của hàm số lượng giác khi tính vị trí vệ tinh?],
    (
        True([Sau mỗi chu kì $2pi$, vị trí góc của vệ tinh lặp lại trạng thái ban đầu.]),
        [Sau mỗi chu kì $pi$, vị trí góc của vệ tinh lặp lại trạng thái ban đầu.],
        [Hàm số biểu diễn vị trí không có tính tuần hoàn.],
        [Chu kì lặp lại vị trí phụ thuộc vào vận tốc vệ tinh, không cố định.]
    ),
    loigiai: [
        Hàm số $sin x$ và $cos x$ tuần hoàn với chu kì $2pi$. Do đó, khi biểu diễn vị trí góc (tọa độ trên đường tròn), sau một góc $2pi$ vệ tinh sẽ trở lại vị trí ban đầu.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Độ dài cung tròn mà đầu kim phút của một đồng hồ (có độ dài $15$ cm) vạch ra trong thời gian $20$ phút là],
    (
        [$5pi$ cm],
        True([$10pi$ cm]),
        [$15pi$ cm],
        [$20pi$ cm]
    ),
    loigiai: [
        Trong $60$ phút kim phút quay được một góc $2pi$ rad.
        Trong $20$ phút kim phút quay được một góc:
        $
          alpha = (20)/(60) dot 2pi = (2pi)/3 " rad"
        $
        Độ dài cung tròn là:
        $
          l = R alpha = 15 dot (2pi)/3 = 10pi " (cm)"
        $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Huyết áp của một người được đo lường bởi hàm số $P(t) = 110 + 30 sin(160pi t)$ (mmHg), trong đó $t$ tính bằng phút. Số nhịp tim của người này (số chu kì dao động của huyết áp trong 1 phút) là],
    (
        [$60$],
        True([$80$]),
        [$100$],
        [$160$]
    ),
    loigiai: [
        Chu kì của hàm số $P(t)$ là:
        $
          T = (2pi)/omega = (2pi)/(160pi) = 1/80 " (phút)"
        $
        Số chu kì (số nhịp tim) trong 1 phút là:
        $
          f = 1/T = 80 " (nhịp/phút)"
        $
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Sự biến đổi của dòng điện xoay chiều được biểu diễn bởi hàm số $i = 4 cos(100pi t + pi/3)$ (A). Giá trị lớn nhất của cường độ dòng điện trong mạch là],
    (
        [$100pi$ A],
        [$2$ A],
        True([$4$ A]),
        [$8$ A]
    ),
    loigiai: [
        Hàm số $i(t) = 4 cos(100pi t + pi/3)$ có biên độ là $4$.
        Do $-1 <= cos(100pi t + pi/3) <= 1$, nên:
        $
          -4 <= i <= 4
        $
        Giá trị lớn nhất của cường độ dòng điện là $4$ A.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Một tua-bin gió có 3 cánh quạt đối xứng nhau. Quỹ đạo của một điểm ở mũi cánh quạt tạo thành đường tròn lượng giác. Khoảng cách góc giữa hai cánh quạt liền kề là],
    (
        [$90^circ$],
        [$100^circ$],
        True([$120^circ$]),
        [$150^circ$]
    ),
    loigiai: [
        Do 3 cánh quạt đối xứng nhau nên chúng chia đều đường tròn $360^circ$ thành 3 phần bằng nhau.
        Góc giữa hai cánh quạt liền kề là:
        $
          360^circ / 3 = 120^circ
        $
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Một con lắc lò xo dao động với phương trình $x(t) = 5 cos(4pi t - pi/2)$ (cm). Tại thời điểm $t = 0.5$ giây, vật đang ở vị trí nào?],
    (
        True([$0$ cm]),
        [$2.5$ cm],
        [$-5$ cm],
        [$5$ cm]
    ),
    loigiai: [
        Thay $t = 0.5$ vào phương trình dao động:
        $
          x(0.5) = 5 cos(4pi dot 0.5 - pi/2) = 5 cos(2pi - pi/2) = 5 cos(3pi/2) = 0 " (cm)"
        $
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Phương trình $cos x = 1$ có mô hình thực tế mô tả một vật dao động đi qua vị trí biên dương. Tập nghiệm của phương trình này là],
    (
        [$x = pi/2 + k pi, k in ZZ$],
        True([$x = k 2pi, k in ZZ$]),
        [$x = pi + k 2pi, k in ZZ$],
        [$x = k pi, k in ZZ$]
    ),
    loigiai: [
        Phương trình $cos x = 1$ có tập nghiệm là:
        $
          x = k 2pi (k in ZZ)
        $
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Thủy triều tại một bãi biển thay đổi độ cao theo hàm số $h(t) = 3 + 2 sin((pi t)/6)$ (mét), với $t$ là thời gian tính bằng giờ ($t>=0$). Độ cao lớn nhất của mực nước biển là],
    (
        [$3$ m],
        True([$5$ m]),
        [$2$ m],
        [$6$ m]
    ),
    loigiai: [
        Do $-1 <= sin((pi t)/6) <= 1$, nên độ cao mực nước biển đạt lớn nhất khi $sin((pi t)/6) = 1$.
        Lúc đó, $h_"max" = 3 + 2(1) = 5$ (m).
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Trong mô hình phân bố dân số $P(t) = 5000 + 2000 cos((pi t)/10)$ của một loài động vật, thời điểm $t$ tính bằng năm. Dân số đạt mức thấp nhất là bao nhiêu cá thể?],
    (
        [$5000$],
        [$2000$],
        True([$3000$]),
        [$7000$]
    ),
    loigiai: [
        Do $-1 <= cos((pi t)/10) <= 1$, dân số đạt mức thấp nhất khi $cos((pi t)/10) = -1$.
        $
          P_"min" = 5000 + 2000(-1) = 3000
        $
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Phương trình $sin(2x - pi/3) = 0$ dùng để tìm các thời điểm dòng điện bằng $0$. Nghiệm của phương trình là],
    (
        [$x = pi/6 + k pi, k in ZZ$],
        True([$x = pi/6 + (k pi)/2, k in ZZ$]),
        [$x = pi/3 + k pi, k in ZZ$],
        [$x = pi/6 + k pi/3, k in ZZ$]
    ),
    loigiai: [
        Ta có:
        $
          sin(2x - pi/3) = 0
        $
        $
          <=> 2x - pi/3 = k pi
        $
        $
          <=> 2x = pi/3 + k pi <=> x = pi/6 + (k pi)/2 (k in ZZ)
        $
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Cường độ ánh sáng tại một vị trí trong ngày được tính bằng $I(t) = 1500 + 500 sin((pi)/12 (t - 6))$ (Lux), với $t$ là số giờ tính từ nửa đêm. Cường độ ánh sáng cao nhất trong ngày đạt được vào lúc mấy giờ?],
    (
        [$6$ giờ],
        True([$12$ giờ]),
        [$15$ giờ],
        [$18$ giờ]
    ),
    loigiai: [
        Cường độ ánh sáng đạt cực đại khi:
        $
          sin((pi)/12 (t - 6)) = 1
        $
        $
          <=> (pi)/12 (t - 6) = pi/2 + k 2pi
        $
        $
          <=> t - 6 = 6 + 24k <=> t = 12 + 24k
        $
        Với $0 <= t <= 24$, ta có $k = 0 => t = 12$. Vậy ánh sáng mạnh nhất lúc $12$ giờ trưa.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Hàm số lượng giác $y = A sin(omega x + phi)$ được gọi là mô hình dao động điều hòa. Đại lượng $omega$ được gọi là gì trong vật lý?],
    (
        [Chu kì],
        [Pha ban đầu],
        [Biên độ],
        True([Tần số góc])
    ),
    loigiai: [
        Theo định nghĩa Vật lý, đại lượng $omega$ (đơn vị rad/s) được gọi là *tần số góc* của dao động.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#lt-ds(num: 13, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",
    [Mô hình nhịp tim của một người trưởng thành trong trạng thái nghỉ ngơi được đo đạc bởi máy điện tâm đồ. Áp suất máu (mmHg) tại các động mạch được mô phỏng xấp xỉ bởi đồ thị hàm số lượng giác dạng $P(t) = A + B cos(omega t)$.
#align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Scale: x = t * 2, y = (P - 70) * 0.1
      grid((0, 0), (8, 6), step: (1, 1), stroke: (dash: "dotted", paint: luma(200)))
      line((0, 0), (8.5, 0), mark: (end: ">"), stroke: 1.5pt)
      line((0, 0), (0, 6.5), mark: (end: ">"), stroke: 1.5pt)
      content((8.3, -0.4), [$t$ (s)])
      content((-0.8, 6.3), [$P$ (mmHg)])
      
      for i in (1, 2, 3, 4) {
        let xc = i * 2
        line((xc, -0.1), (xc, 0.1))
        content((xc, -0.4), str(i))
      }
      for i in (80, 100, 120) {
        let yc = (i - 70) * 0.1
        line((-0.1, yc), (0.1, yc))
        content((-0.6, yc), str(i))
      }
      
      let pts = range(0, 401).map(i => {
        let t_val = i / 100
        let p_val = 100 + 20 * calc.cos(360deg * t_val / 0.8)
        (t_val * 2, (p_val - 70) * 0.1)
      })
      line(..pts, stroke: 1.5pt + blue)
    })
]    
    Dựa vào đồ thị trên, các phát biểu sau đúng hay sai?], (
        True([Huyết áp tâm thu (áp suất tối đa) là $120$ mmHg.]),
        [Nhịp tim của người này là $60$ nhịp/phút.],
        True([Hàm số mô phỏng đồ thị trên là $P(t) = 100 + 20 cos(2.5pi t)$.]),
        True([Tại thời điểm $t = 1.2$ giây, huyết áp đang ở mức $80$ mmHg.])
    ), 
    loigiai: [
        - *a)* Đúng. Nhìn vào đồ thị, đỉnh cao nhất của đồ thị nằm ở vạch $120$. Do đó huyết áp lớn nhất (tâm thu) là $120$ mmHg.
        - *b)* Sai. Khoảng cách giữa 2 đỉnh liên tiếp trên đồ thị là từ $0$ đến $0.8$ (s). Do đó chu kì $T = 0.8$ giây. Số nhịp tim trong 1 phút là:
        $
          f = 60 / 0.8 = 75 " (nhịp/phút)"
        $
        - *c)* Đúng. Từ đồ thị, huyết áp dao động từ $80$ đến $120$, suy ra giá trị trung bình $A = (120+80)/2 = 100$. Biên độ $B = 120 - 100 = 20$.
        Chu kì $T = 0.8$ nên tần số góc $omega = (2pi)/0.8 = 2.5pi$.
        Tại $t=0$, $P = 120$ (đạt cực đại) nên hàm số là $P(t) = 100 + 20 cos(2.5pi t)$.
        - *d)* Đúng. Thay $t = 1.2$ vào phương trình:
        $
          P(1.2) = 100 + 20 cos(2.5pi dot 1.2) = 100 + 20 cos(3pi) = 100 - 20 = 80 " (mmHg)"
        $
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",
    [Độ sâu của mực nước tại một cảng biển (tính bằng mét) thay đổi theo chu kì thủy triều và được mô phỏng bởi phương trình $h(t) = 14 + 6 sin((pi t)/6 + pi/3)$, trong đó $t$ là thời gian tính bằng giờ ($0 <= t <= 24$). Các phát biểu sau đúng hay sai?], (
        True([Mực nước cao nhất trong ngày là $20$ mét.]),
        True([Mực nước thấp nhất trong ngày xuất hiện lần đầu tiên vào lúc $7$ giờ sáng.]),
        [Một tàu chở hàng nặng yêu cầu mực nước phải từ $17$ mét trở lên để cập cảng. Tàu có thể cập cảng an toàn bắt đầu từ lúc $2$ giờ sáng.],
        True([Tổng thời gian trong một ngày mà tàu nói trên có thể neo đậu an toàn trong cảng là $8$ giờ.])
    ), 
    loigiai: [
        - *a)* Đúng. Do $sin((pi t)/6 + pi/3) <= 1$ nên giá trị lớn nhất của $h(t)$ là:
        $
          h_"max" = 14 + 6(1) = 20 " (m)"
        $
        - *b)* Đúng. Mực nước thấp nhất khi:
        $
          sin((pi t)/6 + pi/3) = -1
        $
        $
          <=> (pi t)/6 + pi/3 = -pi/2 + k 2pi
        $
        $
          <=> (pi t)/6 = - (5pi)/6 + k 2pi <=> t = -5 + 12k
        $
        Với $t >= 0$, thời điểm nhỏ nhất ứng với $k=1$, suy ra $t = 7$. Vậy mực nước thấp nhất lần đầu vào lúc $7$ giờ.
        - *c)* Sai. Để tàu cập cảng, ta cần:
        $
          h(t) >= 17 <=> 14 + 6 sin((pi t)/6 + pi/3) >= 17 <=> sin((pi t)/6 + pi/3) >= 1/2
        $
        $
          <=> pi/6 + k 2pi <= (pi t)/6 + pi/3 <= (5pi)/6 + k 2pi
        $
        $
          <=> -pi/6 + k 2pi <= (pi t)/6 <= pi/2 + k 2pi <=> -1 + 12k <= t <= 3 + 12k
        $
        Với chu kỳ đầu $k=0$, ta có $-1 <= t <= 3$. Trong thực tế $t >= 0$ nên thời gian an toàn là $[0; 3]$.
        Tàu có thể cập cảng an toàn ngay từ $0$ giờ sáng (nửa đêm).
        - *d)* Đúng. Từ bất phương trình trên, các khoảng thời gian an toàn trong đoạn $[0; 24]$ là:
        Khi $k=0$: $t in [0; 3]$ (thời gian $3$ giờ).
        Khi $k=1$: $t in [11; 15]$ (thời gian $4$ giờ).
        Khi $k=2$: $t in [23; 24]$ (vì $t<=24$, thời gian $1$ giờ).
        Tổng thời gian là $3 + 4 + 1 = 8$ giờ.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",
    [Một quả bóng được treo trên một con lắc lò xo và dao động theo phương thẳng đứng. Vị trí của quả bóng so với điểm cân bằng ($x=0$) được xác định bởi phương trình $x(t) = 8 cos(2pi t - pi/4)$ (cm), trong đó chiều dương hướng xuống và $t$ tính bằng giây. Các phát biểu sau đúng hay sai?], (
        True([Quả bóng bắt đầu dao động từ vị trí có li độ $x = 4sqrt(2)$ cm và đang đi xuống.]),
        [Chu kì dao động của quả bóng là $2$ giây.],
        True([Vị trí cao nhất của quả bóng cách vị trí cân bằng $8$ cm.]),
        True([Trong $2.5$ giây đầu tiên, quả bóng đi qua vị trí cân bằng đúng $5$ lần.])
    ), 
    loigiai: [
        - *a)* Đúng. Tại $t=0$:
        $
          x(0) = 8 cos(-pi/4) = 8 dot sqrt(2)/2 = 4sqrt(2) " (cm)"
        $
        Vận tốc $v(t) = x'(t) = -16pi sin(2pi t - pi/4)$. Tại $t=0$:
        $
          v(0) = -16pi sin(-pi/4) = 8pi sqrt(2) > 0
        $
        Vận tốc dương nên quả bóng đang chuyển động theo chiều dương (đi xuống).
        - *b)* Sai. Chu kì dao động là:
        $
          T = (2pi)/omega = (2pi)/(2pi) = 1 " (giây)"
        $
        - *c)* Đúng. Biên độ $A = 8$ cm nên vị trí cao nhất (biên âm, vì chiều dương hướng xuống) cách vị trí cân bằng $8$ cm.
        - *d)* Đúng. Quả bóng đi qua vị trí cân bằng khi:
        $
          x(t) = 0 <=> cos(2pi t - pi/4) = 0
        $
        $
          <=> 2pi t - pi/4 = pi/2 + k pi <=> 2pi t = (3pi)/4 + k pi <=> t = 3/8 + k/2
        $
        Trong khoảng $t in [0; 2.5]$:
        $
          0 <= 3/8 + k/2 <= 2.5 <=> -0.75 <= k <= 4.25
        $
        Vì $k in ZZ$ nên $k in {0, 1, 2, 3, 4}$. Có đúng $5$ giá trị của $k$, suy ra quả bóng đi qua vị trí cân bằng $5$ lần.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",
    [Sự thay đổi nhiệt độ ngoài trời trong một ngày mùa hè tại một trạm quan trắc được mô hình hóa bởi $T(t) = 28 + 7 sin((pi)/12 (t - 9))$ (độ C), trong đó $t$ là thời gian tính bằng giờ ($0 <= t <= 24$). Các phát biểu sau đúng hay sai?], (
        True([Nhiệt độ lúc $9$ giờ sáng là $28$ độ C.]),
        True([Nhiệt độ cao nhất trong ngày là $35$ độ C.]),
        True([Nhiệt độ bắt đầu vượt ngưỡng $31.5$ độ C từ $11$ giờ sáng.]),
        [Phương trình $T(t) = 21$ có đúng $2$ nghiệm trong đoạn $[0; 24]$.]
    ), 
    loigiai: [
        - *a)* Đúng. Thay $t = 9$ vào phương trình:
        $
          T(9) = 28 + 7 sin((pi)/12 (9 - 9)) = 28 + 7 sin(0) = 28 " ("degree"C)"
        $
        - *b)* Đúng. Do $sin((pi)/12 (t - 9)) <= 1$ nên $T_"max" = 28 + 7(1) = 35 " ("degree"C)"$.
        - *c)* Đúng. Giải bất phương trình $T(t) > 31.5$:
        $
          28 + 7 sin((pi)/12 (t - 9)) > 31.5
        $
        $
          <=> 7 sin((pi)/12 (t - 9)) > 3.5 <=> sin((pi)/12 (t - 9)) > 1/2
        $
        Dẫn tới khoảng nghiệm trong $1$ chu kì:
        $
          pi/6 < (pi)/12 (t - 9) < (5pi)/6
        $
        $
          <=> 2 < t - 9 < 10 <=> 11 < t < 19
        $
        Vậy nhiệt độ vượt $31.5 degree$C bắt đầu từ $11$ giờ.
        - *d)* Sai. Giải phương trình $T(t) = 21$:
        $
          28 + 7 sin((pi)/12 (t - 9)) = 21 <=> sin((pi)/12 (t - 9)) = -1
        $
        $
          <=> (pi)/12 (t - 9) = -pi/2 + k 2pi <=> t - 9 = -6 + 24k <=> t = 3 + 24k
        $
        Trên đoạn $[0; 24]$, chỉ có $1$ nghiệm là $t = 3$ (khi $k=0$). Phương trình có đúng $1$ nghiệm.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TL 1
#lt-tln(num: 17, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",
    [Một guồng nước có bán kính $4$ mét và tâm quay đặt cách mặt nước $1$ mét. Một gàu nước ở mép guồng bắt đầu chuyển động từ vị trí cao nhất. Guồng quay đều với chu kì $20$ giây/vòng. Tính độ cao (tính bằng mét) của gàu nước so với mặt nước tại thời điểm $t = 15$ giây.],
    [1],
    loigiai: [
        Hàm số mô phỏng độ cao của gàu nước có dạng $h(t) = a + b cos(omega t)$.
        Tâm quay cách mặt nước $1$ m, biên độ (bán kính) là $4$ m nên:
        $
          h_"max" = 1 + 4 = 5 " (m)"; quad h_"min" = 1 - 4 = -3 " (m)"
        $
        Tại $t=0$, gàu ở vị trí cao nhất $h(0) = 5$, phương trình là:
        $
          h(t) = 1 + 4 cos(omega t)
        $
        Với chu kì $T = 20$ giây, tần số góc $omega = (2pi)/20 = pi/10$.
        Vậy $h(t) = 1 + 4 cos((pi t)/10)$.
        Tại $t = 15$ giây:
        $
          h(15) = 1 + 4 cos((15pi)/10) = 1 + 4 cos((3pi)/2) = 1 + 4 dot 0 = 1 " (m)"
        $
    ]
)

// TL 2
#lt-tln(num: 18, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",
    [Trong dao động điều hòa của một chất điểm, động năng $W_d$ (J) được tính bởi công thức $W_d = 2 cos^2(5pi t)$. Hãy tính thời gian ngắn nhất (tính bằng giây) từ lúc $t=0$ đến khi động năng đạt giá trị cực tiểu.],
    [0.1],
    loigiai: [
        Động năng cực tiểu khi $W_d = 0$, nghĩa là:
        $
          cos(5pi t) = 0
        $
        $
          <=> 5pi t = pi/2 + k pi <=> t = 1/10 + k/5 " (s)"
        $
        Vì $t > 0$, nghiệm nhỏ nhất đạt được khi $k=0$, suy ra $t = 1/10 = 0.1$ (giây).
    ]
)

// TL 3
#lt-tln(num: 19, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",
    [Phương trình li độ góc của một con lắc đồng hồ là $alpha(t) = 0.1 cos(pi t)$ (rad). Thời điểm $t$ tính bằng giây. Trong $10$ giây đầu tiên, con lắc đi qua vị trí cân bằng ($alpha = 0$) bao nhiêu lần?],
    [10],
    loigiai: [
        Ta giải phương trình $alpha(t) = 0$:
        $
          0.1 cos(pi t) = 0 <=> cos(pi t) = 0
        $
        $
          <=> pi t = pi/2 + k pi <=> t = 1/2 + k
        $
        Xét trong đoạn $0 <= t <= 10$:
        $
          0 <= 1/2 + k <= 10 <=> -0.5 <= k <= 9.5
        $
        Vì $k in ZZ$, ta có $k in {0, 1, 2, ..., 9}$. 
        Có tổng cộng $10$ giá trị của $k$, tương ứng với $10$ lần qua vị trí cân bằng.
    ]
)

// TL 4
#lt-tln(num: 20, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",
    [Công suất tiêu thụ của một đoạn mạch xoay chiều biến thiên theo phương trình $P(t) = 200 + 200 cos(100pi t - pi/4)$ (W). Kể từ lúc $t=0$, thời điểm lần thứ hai mạch điện đạt công suất cực đại là $a/b$ (giây), với $a/b$ là phân số tối giản. Tính $a - b$.],
    [-391],
    loigiai: [
        Mạch điện đạt công suất cực đại khi $cos(100pi t - pi/4) = 1$.
        $
          <=> 100pi t - pi/4 = k 2pi
        $
        $
          <=> 100pi t = pi/4 + k 2pi <=> t = 1/400 + k/50
        $
        Vì $t > 0$, thời điểm lần thứ nhất ứng với $k=0$ là $t_1 = 1/400$.
        Thời điểm lần thứ hai ứng với $k=1$ là:
        $
          t_2 = 1/400 + 1/50 = 9/400
        $
        Vậy $a = 9$, $b = 400 => a - b = 9 - 400 = -391$.
    ]
)

// TL 5
#lt-tln(num: 21, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",
    [Dân số của một thành phố trong giai đoạn 10 năm được ước tính bằng mô hình $S(t) = 20 + 2 sin((pi t)/5)$ (triệu người), trong đó $t$ là số năm tính từ 2020 ($0 <= t <= 10$). Theo mô hình này, vào năm nào dân số thành phố đạt mức cao nhất (đầu tiên)?],
    [2022],
    loigiai: [
        Dân số đạt mức cao nhất khi:
        $
          sin((pi t)/5) = 1
        $
        $
          <=> (pi t)/5 = pi/2 + k 2pi <=> t/5 = 1/2 + 2k <=> t = 2.5 + 10k
        $
        Trong giai đoạn $[0; 10]$, ứng với $k=0$ ta có $t = 2.5$.
        Năm đạt mức cao nhất là $2020 + 2.5 = 2022.5$. Do đó dân số đạt đỉnh vào năm 2022.
    ]
)

// TL 6
#lt-tln(num: 22, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",
    [Một ống sáo phát ra sóng âm với áp suất không khí biến thiên theo hàm số $p(t) = 0.5 sin(440pi t) + 0.5 cos(440pi t)$ (Pa), $t$ tính bằng giây. Biên độ dao động của sóng âm này có thể viết dưới dạng $a sqrt(b) / c$ (với $a, b, c$ là các số tự nhiên và phân số tối giản). Tính $a + b + c$.],
    [5],
    loigiai: [
        Ta biến đổi hàm số áp suất:
        $
          p(t) = 0.5 sin(440pi t) + 0.5 cos(440pi t) = sqrt(0.5^2 + 0.5^2) sin(440pi t + alpha)
        $
        Tính biên độ:
        $
          A = sqrt(0.25 + 0.25) = sqrt(0.5) = sqrt(1/2) = sqrt(2)/2
        $
        Vậy biên độ là $1 sqrt(2) / 2$. Suy ra $a = 1, b = 2, c = 2$.
        $
          => a + b + c = 1 + 2 + 2 = 5
        $
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHƯƠNG 1. LƯỢNG GIÁC (ĐỀ SỐ 05)!]      #v(0.6em)
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
