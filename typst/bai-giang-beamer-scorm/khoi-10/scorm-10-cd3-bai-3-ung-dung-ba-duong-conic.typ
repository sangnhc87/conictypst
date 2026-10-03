#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Ứng Dụng Thực Tế Của Ba Đường Conic],
  subtitle: [TOÁN 10 — CHUYÊN ĐỀ HỌC TẬP: CHUYÊN ĐỀ 3],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#7c3aed"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC BÀI HỌC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG BÀI HỌC])

// ════════════════════════════════════════════════
// PHẦN I: ỨNG DỤNG CỦA PARABOL (QUANG HỌC & ANTEN)
// ════════════════════════════════════════════════
#lt-section-link("sec-parabol", "📡", [I. Ứng Dụng Của Parabol (Quang Học & Anten)])

#lt-slide-back(title: "📡 Tính chất quang học của Parabol")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Tính chất hội tụ")[
        Mặt phẳng phản xạ hình Parabol có một tính chất quang học vô cùng đặc biệt liên quan đến *Tiêu điểm* $F$:
        - Mọi tia sáng phát ra từ tiêu điểm $F$ khi đến mặt gương parabol sẽ phản xạ thành một chùm tia *song song* với trục đối xứng.
        - Ngược lại, mọi chùm tia sáng song song với trục đối xứng khi chiếu tới mặt gương parabol sẽ hội tụ tại *tiêu điểm* $F$.
      ]
      #lt-tip(title: "Ứng dụng")[
        - *Đèn pha ô tô, đèn pin:* Đặt bóng đèn tại $F$ để chiếu xa.
        - *Anten Parabol, chảo vệ tinh:* Đặt bộ thu tín hiệu LNB tại $F$ để thu sóng mạnh nhất.
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 9pt, radius: 7pt)[
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            set-style(stroke: 0.8pt)
            // Parabola mirror
            let pts = ()
            for i in range(-15, 16) {
              let y = i * 0.1
              let x = (y * y) / 1.8
              pts.push((x, y))
            }
            line(..pts, stroke: 1.8pt + rgb("7c3aed"))
            // Focus F
            circle((0.45, 0), radius: 0.1, fill: rgb("eab308"), stroke: 1pt + rgb("ca8a04"))
            content((0.45, -0.35), text(size: 7.5pt, weight: "bold", fill: rgb("7c3aed"))[Bóng đèn ($F$)])
            // Parallel light rays
            let rays = (1.2, 0.6, -0.6, -1.2)
            for y in rays {
              let x = (y * y) / 1.8
              line((0.45, 0), (x, y), stroke: 1pt + rgb("f59e0b"))
              line((x, y), (3.5, y), stroke: 1.2pt + rgb("f59e0b"), mark: (end: "stealth"))
            }
          })
        ]
        #text(size: 8.5pt)[
          *Công thức thực hành:* Chảo Parabol có đường kính miệng $D$ và chiều sâu $h$. Tiêu cự $f$ (khoảng cách từ đỉnh chảo đến bộ thu) tính bởi:
          $ f = D^2 / (16 h) $
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: ỨNG DỤNG CỦA ELIP (ÂM HỌC & KIẾN TRÚC)
// ════════════════════════════════════════════════
#lt-section-link("sec-elip", "🏛️", [II. Ứng Dụng Của Elip (Âm Học & Kiến Trúc)])

#lt-slide-back(title: "🏛️ Hiệu ứng phòng thì thầm (Whispering Gallery)")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Tính chất phản xạ của Elip")[
        Tương tự parabol, Elip cũng có tính chất phản xạ cực kì đặc biệt:
        - Mọi sóng âm thanh phát ra từ *tiêu điểm thứ nhất* ($F_1$), sau khi đập vào vòm trần hình elip, sẽ phản xạ và *hội tụ toàn bộ* tại *tiêu điểm thứ hai* ($F_2$).
        - Do đó, hai người đứng tại hai tiêu điểm có thể nói thì thầm mà vẫn nghe rõ tiếng nhau dù đứng rất xa.
      ]
      #lt-important(title: "Quãng đường truyền sóng")[
        Tổng quãng đường truyền đi luôn bằng hằng số $2a$.
        $ M F_1 + M F_2 = 2 a $
      ]
    ],
    [
      #block(fill: rgb("#fff1f2"), stroke: 1.5pt + rgb("#e11d48"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#be123c"), size: 10.5pt)[Ví dụ: Phòng hòa nhạc trần Elip]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Một hội trường có trần bán elip với chiều dài sàn $2a = 26"m"$. Chiều cao cao nhất của trần $b = 5"m"$.
          
          - Nửa trục lớn: $a = 13"m"$. Bán trục bé: $b = 5"m"$.
          - Tiêu cự: $c = sqrt(13^2 - 5^2) = 12"m"$.
          - Khoảng cách giữa hai tiêu điểm (hai người thì thầm): $2c = 24"m"$.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Ứng Dụng Thực Tế])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHUYÊN ĐỀ 3 BÀI 3],
  questions: (
    ( type: "TN", desc: [Vị trí đặt bóng đèn trong chóa Parabol]),
    ( type: "TN", desc: [Tính tiêu cự chảo anten D và h]),
    ( type: "TN", desc: [Đường kính chóa đèn từ tiêu cự và chiều sâu]),
    ( type: "TN", desc: [Phòng hòa nhạc trần Elip (Khoảng cách thì thầm)]),
    ( type: "TN", desc: [Phương trình Parabol của đèn pin]),
    ( type: "DS", desc: [Đĩa Radar Parabol]),
    ( type: "DS", desc: [Hội trường trần bán Elip 26m]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(num: 1, [Trong đèn pha ô tô hay đèn pin, bóng đèn chiếu sáng thường được đặt tại vị trí nào của chóa gương parabol để tạo ra chùm tia sáng song song chiếu xa?],
    (
        [Đỉnh của parabol],
        [Một điểm bất kỳ trên đường chuẩn],
        [Tiêu điểm của parabol],
        [Tâm đối xứng của parabol]
    ),
    correct: 3,
    loigiai: [
        Nhờ tính chất quang học của parabol, khi nguồn sáng đặt tại tiêu điểm $F$, mọi tia sáng tới mặt gương phản xạ đều biến đổi thành chùm tia sáng song song với trục đối xứng, giúp ánh sáng chiếu xa và không bị phân tán.
    ]
)

#lt-tn(num: 2, [Một chảo thu sóng truyền hình vệ tinh có đường kính miệng $D = 120" cm"$ và chiều sâu $h = 20" cm"$. Khoảng cách từ đỉnh chảo đến vị trí gắn đầu thu tín hiệu bằng],
    (
        [$45" cm"$],
        [$30" cm"$],
        [$60" cm"$],
        [$90" cm"$]
    ),
    correct: 1,
    loigiai: [
        Khoảng cách từ đỉnh chảo đến vị trí gắn đầu thu (tiêu điểm) là:
        $ f = D^2 / (16 h) = 120^2 / (16 times 20) = 14400 / 320 = 45" cm" $
    ]
)

#lt-tn(num: 3, [Một đèn pha có chóa gương parabol với tiêu cự $f = 4" cm"$. Chiều sâu của chao đèn là $h = 9" cm"$. Đường kính miệng của chao đèn bằng],
    (
        [$12" cm"$],
        [$24" cm"$],
        [$36" cm"$],
        [$18" cm"$]
    ),
    correct: 2,
    loigiai: [
        Từ $f = D^2 / (16 h) => D^2 = 16 f h$:
        $ D^2 = 16 times 4 times 9 = 576 => D = sqrt(576) = 24" cm" $
    ]
)

#lt-tn(num: 4, [Một phòng hòa nhạc có trần vòm bán elip với chiều dài sàn là $20" m"$ và chiều cao trần nhà tại vị trí chính giữa cao nhất là $6" m"$. Khoảng cách giữa hai vị trí đặt mic và tai nghe để nghe rõ âm thanh thì thầm nhất (khoảng cách giữa hai tiêu điểm) bằng],
    (
        [$16" m"$],
        [$8" m"$],
        [$12" m"$],
        [$14" m"$]
    ),
    correct: 1,
    loigiai: [
        Trần vòm bán elip có độ dài trục lớn $2 a = 20 => a = 10" m"$.
        Bán trục bé bằng chiều cao trần: $b = 6" m"$.
        Tiêu cự $c = sqrt(a^2 - b^2) = sqrt(10^2 - 6^2) = 8" m"$.
        Khoảng cách giữa hai tiêu điểm là $2 c = 2 times 8 = 16" m"$.
    ]
)

#lt-tn(num: 5, [Một chao đèn pin hình parabol có đường kính miệng $60" cm"$ và chiều sâu $15" cm"$. Phương trình chính tắc của parabol trong mặt phẳng tọa độ đặt đỉnh tại gốc $O(0, 0)$ là],
    (
        [$y^2 = 30 x$],
        [$y^2 = 120 x$],
        [$y^2 = 60 x$],
        [$y^2 = 15 x$]
    ),
    correct: 3,
    loigiai: [
        Phương trình có dạng $y^2 = 2 p x$.
        Mép chao đèn có tọa độ $(15, 30)$ (do $D = 60 => y = 30, x = h = 15$).
        Thay vào:
        $ 30^2 = 2 p times 15 <=> 900 = 30 p <=> 2 p = 60 $
        Vậy phương trình là $y^2 = 60 x$.
    ]
)

#lt-ds(num: 6, [Một trạm phát sóng radar bờ biển sử dụng một đĩa parabol có đường kính $2" m"$ ($200" cm"$) và tiêu cự $f = 50" cm"$.],
  (
    [Tham số tiêu của parabol là $p = 100" cm"$.],
    [Phương trình mặt cắt parabol là $y^2 = 200 x$.],
    [Chiều sâu của đĩa radar này bằng $50" cm"$.],
    [Tỉ số giữa độ sâu và đường kính của đĩa radar lớn hơn $0.5$.]
  ),
  correct: "1110",
  loigiai: [
    a) $f = p / 2 = 50 => p = 100" cm" => 2 p = 200$ (ĐÚNG).
    b) Phương trình parabol là $y^2 = 2 p x = 200 x$ (ĐÚNG).
    c) Tại mép đĩa, $y = D / 2 = 100" cm"$. Thay vào: $100^2 = 200 x => x = 50" cm"$ (ĐÚNG).
    d) Tỉ số $h / D = 50 / 200 = 0.25 < 0.5$ (SAI).
  ]
)

#lt-ds(num: 7, [Một hội trường có trần dạng bán elip với chiều dài sàn phòng là $26" m"$ (trục lớn) và chiều cao của trần tại điểm cao nhất là $5" m"$ (bán trục bé).],
  (
    [Bán trục lớn của elip là $a = 13" m"$, bán trục nhỏ là $b = 5" m"$.],
    [Tiêu cự của elip là $2 c = 24" m"$.],
    [Hai vị trí thì thầm nghe rõ nhất nằm cách tâm phòng một khoảng $12" m"$ về hai phía đối xứng.],
    [Một âm thanh phát ra từ tiêu điểm $F_1$ phản xạ tới $F_2$ có quãng đường truyền sóng dài hơn $26" m"$.]
  ),
  correct: "1110",
  loigiai: [
    a) $2 a = 26 => a = 13" m"$, chiều cao $b = 5" m"$ (ĐÚNG).
    b) $c = sqrt(13^2 - 5^2) = 12" m" => 2 c = 24" m"$ (ĐÚNG).
    c) Hai tiêu điểm cách tâm $12" m"$ về 2 phía (ĐÚNG).
    d) Mọi sóng âm đi từ $F_1$ đến $F_2$ qua trần phản xạ luôn có chiều dài $2a = 26"m"$ (SAI).
  ]
)
