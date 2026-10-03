#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-UDDH-PHAN1-C2
// Toán 12 — Ứng Dụng Đạo Hàm  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../../giao-an/modules/lecture-beamer.typ": *
#import "../../bbt.typ": *
#import "../../modules/fractals.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)

#let c-p1 = rgb("#3b82f6") // blue
#let c-p2 = rgb("#8b5cf6") // violet
#let c-p3 = rgb("#ec4899") // pink
#let c-p4 = rgb("#f97316") // orange
#let c-p5 = rgb("#10b981") // emerald

#show: lecture-theme.with(
  title:       "P1.C2: ĐỘNG HỌC TUYẾN TÍNH - ĐẠO HÀM THEO THỜI GIAN",
  subtitle:    "TOÁN 12 — Chuyên đề: Ứng Dụng Đạo Hàm & Thực Tế",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   24pt,                                
  math-color:  rgb("#d81b60"),                      // Magenta
  math-size:   1.05em,                              
  body-font:   ("Arial", "Times New Roman"),        
)

#lec-reset()
#lt-toc()

#let c-book = rgb("#4338CA")
#let resetexamstate() = none
#let khoitao() = none
#let resetcau() = none
#let exam-part(title, ..args) = slide[= #title]
#let q-wrap(..args) = args.pos().at(0)
#let mybox(fill, stroke, ..args) = {
  let pos = args.pos()
  let title = if pos.len() > 1 { pos.at(0) } else { none }
  let body = if pos.len() > 1 { pos.at(1) } else { pos.at(0) }
  block(fill: fill, stroke: 1pt + stroke, inset: 10pt, width: 100%, radius: 4pt, [*#title* #body])
}
#let dn(..args) = mybox(luma(240), black, ..args)
#let vd(..args) = mybox(rgb("#e8f4f8"), blue, ..args)
#let tc(..args) = mybox(rgb("#fcf4cd"), orange, ..args)
#let kl(..args) = mybox(rgb("#eaf8e6"), green, ..args)
#let nx(..args) = mybox(rgb("#fce4ec"), red, ..args)
#let hq = kl
#let luuy = nx
#let ch = nx
#let ntkq = tc
#let chame = kl
#let ghinho = kl
#let phuongphap = tc
#let nhanxet = nx

#let my-tn(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tn(final-stem, options, loigiai: loigiai, de: de)
}

#let my-ds(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-ds(final-stem, options, loigiai: loigiai, de: de)
}

#let my-tln(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let answer = pos.at(1, default: none)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tln(final-stem, answer, loigiai: loigiai, de: de)
}
#let my-bbbt = bbbt
#let my-bxd = bxd
#let tn = my-tn
#let ds = my-ds
#let tln = my-tln
#let tl = my-tln
#let tlu = my-tln
#let chapter = exam-part
#let topic = exam-part
#let ppgiai = phuongphap
#let bt-header(color) = none
#let bt(..args) = none
#let resetstep() = none


#slide[ = Khám phá: Mọi thứ đều đang chuyển động! ]
- Quãng đường $s(t)$, vận tốc $v(t)$, gia tốc $a(t)$ - Tất cả đều được liên kết chặt chẽ bởi các nấc thang đạo hàm.
- Từ việc tính toán vận tốc của một chiếc xe máy trên đường cao tốc, đến việc dự báo tốc độ lây lan của một đại dịch, đạo hàm theo thời gian cho ta biết mọi thứ đang diễn biến nhanh hay chậm thế nào!



#chapter([Động Học Tuyến Tính — Đạo Hàm theo Thời Gian], theme-color: c-p1)

#phuongphap(theme-color: c-p1)[
  *Bộ ba $s -> v -> a$:*
  - *Quãng đường/vị trí:* $s = s(t)$ (đơn vị: m, km, ...)
  - *Vận tốc tức thời:* $v(t) = s'(t)$ — vật đứng yên khi $v = 0$, chuyển
    động theo chiều dương khi $v > 0$.
  - *Gia tốc:* $a(t) = v'(t) = s''(t)$ — gia tốc dương: vật tăng tốc (cùng
    chiều $v$); gia tốc âm: vật giảm tốc.
  - *Quãng đường thực đi* (không phải độ dịch chuyển!) $=$ tổng $|s(t_i)|$
    trên từng đoạn vật không đổi chiều.
]

#vd(
  [Một vật chuyển động theo quy luật $s(t) = t^3 - 6t^2 + 9t + 2$ (m),
    với $t$ tính bằng giây ($t >= 0$).
    _(a)_ Tìm thời điểm vật đứng yên.
    _(b)_ Tìm vận tốc lớn nhất của vật trên đoạn $[0; 4]$.
    _(c)_ Tính quãng đường vật đi được trong 4 giây đầu.],
  loigiai: [
    #ppgiai[
      - Từ hàm vị trí suy ra vận tốc và gia tốc.
      - Xét đạo hàm của vận tốc để tìm giá trị lớn nhất của vận tốc trên đoạn đóng.
      - Dùng dấu của vận tốc để tách các khoảng chuyển động khi tính quãng đường.
    ]

    #step[Ta có vận tốc của vật là:
      $ v(t) = s'(t) = 3t^2 - 12t + 9 = 3(t - 1)(t - 3). $]

    #step[Câu _(a)_. Vật đứng yên khi $v(t) = 0$.
      $ 3(t - 1)(t - 3) = 0 <=> hoac(t = 1, t = 3). $
      Vậy vật đứng yên tại các thời điểm $t = 1$ s và $t = 3$ s.]

    #step[Câu _(b)_. Để tìm vận tốc lớn nhất trên đoạn $[0; 4]$, ta xét đạo hàm của $v$:
      $ v'(t) = 6t - 12. $
      Cho $v'(t) = 0 <=> t = 2$.]

    #step[Bảng biến thiên của $v(t)$ trên đoạn $[0; 4]$ là:
      #align(center)[
        #bbt-opt(
          var: $t$,
          der: $v'$,
          func: $v$,
          x-vals: ($0$, $2$, $4$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($9$, $-3$, $9$),
          is-min: true,
        )
      ]]

    #step[Từ bảng biến thiên, $v_(max) = 9$ m/s, đạt tại $t = 0$ s và $t = 4$ s.]

    #step[Câu _(c)_. Vì $v(t) > 0$ trên $(0; 1)$, $v(t) < 0$ trên $(1; 3)$ và $v(t) > 0$ trên $(3; 4)$ nên quãng đường trong 4 giây đầu là tổng độ biến thiên của $s$ trên từng khoảng không đổi chiều.]

    #step[Tính các vị trí đặc biệt:
      $ s(0) = 2, quad s(1) = 6, quad s(3) = 2, quad s(4) = 6. $
      Vậy quãng đường vật đi được là:
      $ (6 - 2) + (6 - 2) + (6 - 2) = 12 $ m.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#vd(
  [Một vật được ném thẳng đứng lên với vận tốc đầu $v_0 = 30$ m/s từ
    độ cao $h_0 = 20$ m so với mặt đất. Phương trình độ cao (lấy $g = 10$ m/s²):
    $h(t) = -5t^2 + 30t + 20$.
    *(a)* Vật đạt độ cao lớn nhất vào lúc nào? Độ cao đó là bao nhiêu?
    *(b)* Vật chạm đất vào lúc nào?],
  loigiai: [
    #ppgiai[
      - Xét đạo hàm của hàm độ cao để tìm thời điểm đạt cực đại.
      - Dùng phương trình $h(t) = 0$ để xác định thời điểm chạm đất.
      - Kết luận qua bảng biến thiên của hàm độ cao.
    ]

    #step[Ta có đạo hàm của hàm độ cao:
      $ h'(t) = -10t + 30. $]

    #step[Câu _(a)_. Vật đạt độ cao cực đại khi $h'(t) = 0$:
      $ -10t + 30 = 0 <=> t = 3. $]

    #step[Câu _(b)_. Vật chạm đất khi $h(t) = 0$:
      $ -5t^2 + 30t + 20 = 0 <=> t^2 - 6t - 4 = 0. $
      Giải ra:
      $ t = 3 +- sqrt(13). $
      Vì $t >= 0$ nên nhận $t = 3 + sqrt(13) approx 6{,}6$ s.]

    #step[Bảng biến thiên của $h(t)$ trên đoạn $[0; 3 + sqrt(13)]$ là:
      #align(center)[
        #bbt-opt(
          var: $t$,
          der: $h'$,
          func: $h$,
          x-vals: ($0$, $3$, $3 + sqrt(13)$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($20$, $65$, $0$),
          is-min: false,
        )
      ]]

    #step[Từ bảng biến thiên, vật đạt độ cao lớn nhất là $65$ m tại thời điểm $t = 3$ s, và chạm đất tại thời điểm $t = 3 + sqrt(13)$ s.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#luuy(theme-color: c-p1)[
  - *Quãng đường ≠ Độ dịch chuyển*: Nếu vật đổi chiều (có $t$ mà $v(t) = 0$),
    quãng đường phải cộng từng đoạn theo trị tuyệt đối.
  - *$v_(max)$ ≠ $a = 0$*: Cực trị của $v(t)$ xảy ra khi $a(t) = v'(t) = 0$.
    Nhưng giá trị lớn nhất của $|v(t)|$ trên đoạn đóng có thể ở biên!
]

#bt(
  [Một xe máy chuyển động theo quy luật $s(t) = 2t^3 - 9t^2 + 12t$ (m).
    Tìm gia tốc tại thời điểm vận tốc bằng $3$ m/s. Vật đang tăng hay giảm tốc?],
  loigiai: [
    #ppgiai[
      - Lấy đạo hàm để tìm vận tốc và gia tốc.
      - Giải phương trình $v(t) = 3$ để xác định các thời điểm cần xét.
      - Dựa vào dấu của $v$ và $a$ để kết luận tăng tốc hay giảm tốc.
    ]

    #step[Từ $s(t) = 2t^3 - 9t^2 + 12t$, ta có:
      $ v(t) = s'(t) = 6t^2 - 18t + 12 $ và $ a(t) = v'(t) = 12t - 18. $]

    #step[Giải phương trình $v(t) = 3$:
      $ 6t^2 - 18t + 12 = 3 <=> 2t^2 - 6t + 3 = 0. $
      Suy ra:
      $ t = (3 +- sqrt(3))/2. $]

    #step[Tại $t_1 = (3 - sqrt(3))/2$, ta có:
      $ a(t_1) = 12 dot.c (3 - sqrt(3))/2 - 18 = -6 sqrt(3) < 0. $
      Vì $v(t_1) = 3 > 0$ và $a(t_1) < 0$ nên vật đang *giảm tốc*.]

    #step[Tại $t_2 = (3 + sqrt(3))/2$, ta có:
      $ a(t_2) = 12 dot.c (3 + sqrt(3))/2 - 18 = 6 sqrt(3) > 0. $
      Vì $v(t_2) = 3 > 0$ và $a(t_2) > 0$ nên vật đang *tăng tốc*.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#bt(
  [Một quả bóng được ném thẳng đứng từ mặt đất với phương trình độ cao
    $h(t) = -5t^2 + 40t$ (m), trong đó $t$ tính bằng giây. Tìm độ cao lớn nhất của quả bóng và thời điểm quả bóng chạm đất.],
  loigiai: [
    #ppgiai[
      - Đạo hàm hàm độ cao để tìm thời điểm đạt cực đại.
      - Giải phương trình $h(t) = 0$ để tìm thời điểm chạm đất.
      - Dùng BBT để kết luận hai kết quả.
    ]

    #step[Tính đạo hàm:
      $ h'(t) = -10t + 40. $
      Cho $h'(t) = 0 <=> t = 4$.]

    #step[Độ cao lớn nhất là:
      $ h(4) = -5 dot.c 16 + 40 dot.c 4 = 80 $ m.]

    #step[Quả bóng chạm đất khi $h(t) = 0$:
      $ -5t^2 + 40t = 0 <=> -5t(t - 8) = 0. $
      Ngoài thời điểm ném lên $t = 0$, ta lấy thời điểm chạm đất là $t = 8$ s.]

    #step[Bảng biến thiên của $h(t)$ trên đoạn $[0; 8]$ là:
      #align(center)[
        #bbt-opt(
          var: $t$,
          der: $h'$,
          func: $h$,
          x-vals: ($0$, $4$, $8$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $80$, $0$),
          is-min: false,
        )
      ]]

    #step[Vậy quả bóng đạt độ cao lớn nhất $80$ m tại $t = 4$ s và chạm đất tại $t = 8$ s.]
    #resetstep()
  ],
  theme-color: c-p1,
)

// ─── Chủ đề 1.3 ────────────────────────────────────────────────


// ════════════════════════════════════════════════════════════
#bt-header(c-p1)
#resetexamstate()



#tn(
  [Vật chuyển động với phương trình $s(t) = t^3 - 6t^2 + 9t$ (m, s). Vận tốc tức thời tại $t = 2$ s bằng],
  ([$-3$ m/s], [$0$ m/s], [$3$ m/s], [$6$ m/s]),
  correct: (1,),
  accent: c-p1,
  loigiai: [
    #step[Ta có $v(t) = s'(t) = 3t^2 - 12t + 9$.]
    #step[Tại $t = 2$: $v(2) = 12 - 24 + 9 = -3$ m/s.]
  ],
)

#tn(
  [Vật dừng lại ($v = 0$) lần đầu tại thời điểm $t$ nào nếu $v(t) = 3t^2 - 12t + 9$?],
  ([$t = 1$ s], [$t = 2$ s], [$t = 3$ s], [$t = 4$ s]),
  correct: (1,),
  accent: c-p1,
  loigiai: [
    #step[Giải phương trình $3t^2 - 12t + 9 = 0 <=> (t - 1)(t - 3) = 0$.]
    #step[Vật dừng lại tại $t = 1$ s và $t = 3$ s, nên lần đầu là $t = 1$ s.]
  ],
)

#tn(
  [Gia tốc $a(t) = v'(t)$. Nếu $v(t) = 6t - 12$, gia tốc tại $t = 3$ s bằng],
  ([$-6$ m/s²], [$0$ m/s²], [$6$ m/s²], [$12$ m/s²]),
  correct: (3,),
  accent: c-p1,
  loigiai: [
    #step[Vì $v(t) = 6t - 12$ nên $a(t) = v'(t) = 6$.]
    #step[Do đó tại mọi thời điểm, đặc biệt là $t = 3$ s, gia tốc đều bằng $6$ m/s².]
  ],
)

#tn(
  [Một quả bóng có độ cao $h(t) = -5t^2 + 40t$ (m). Độ cao lớn nhất mà quả bóng đạt được là],
  ([$60$ m], True([$80$ m]), [$100$ m], [$120$ m]),
  accent: c-p1,
  loigiai: [
    #step[Ta có $h'(t) = -10t + 40 = 0 <=> t = 4$.]
    #step[Độ cao lớn nhất là $h(4) = -5 dot.c 16 + 40 dot.c 4 = 80$ m.]
  ],
)


#resetexamstate()

#ds(
  [Vật ném thẳng đứng lên với $h(t) = -5t^2 + 30t + 20$ (m, s, gốc mặt đất).],
  (
    [Vận tốc ban đầu của vật là $30$ m/s.],
    [Vật đạt độ cao cực đại tại $t = 3$ s.],
    [Độ cao cực đại là $h(3) = 65$ m.],
    [Vật rơi xuống đất khi $t > 3$ s.],
  ),
  accent: c-p1,
  loigiai: [
    #step[Tính đạo hàm: $h'(t) = -10t + 30$, nên vận tốc ban đầu là $h'(0) = 30$ m/s. Phát biểu $1$ đúng.]
    #step[Giải $h'(t) = 0 <=> -10t + 30 = 0 <=> t = 3$. Vậy phát biểu $2$ đúng.]
    #step[Tính $h(3) = -45 + 90 + 20 = 65$, nên phát biểu $3$ đúng.]
    #step[Giải $h(t) = 0$ được $t = 3 +- sqrt(13)$. Nghiệm dương là $3 + sqrt(13) > 3$, nên phát biểu $4$ đúng.]
  ],
)

#ds(
  [Một chất điểm chuyển động theo quy luật $s(t) = t^3 - 12t^2 + 45t$ (m), $0 <= t <= 6$.],
  (
    True([Vận tốc của chất điểm là $v(t) = 3t^2 - 24t + 45$.]),
    True([Chất điểm đứng yên tại $t = 3$ s và $t = 5$ s.]),
    True([Trên khoảng $(3; 5)$, chất điểm chuyển động theo chiều âm.]),
    [Quãng đường chất điểm đi được trong 6 giây đầu là $58$ m.],
  ),
  accent: c-p1,
  loigiai: [
    #step[Lấy đạo hàm ta được $v(t) = s'(t) = 3t^2 - 24t + 45 = 3(t - 3)(t - 5)$, nên phát biểu $1$ đúng.]
    #step[Từ $v(t) = 0 <=> hoac(t = 3, t = 5)$, suy ra phát biểu $2$ đúng.]
    #step[Vì $v(t) < 0$ trên $(3; 5)$ nên chất điểm chuyển động theo chiều âm trên khoảng đó. Phát biểu $3$ đúng.]
    #step[Tính $s(0) = 0$, $s(3) = 54$, $s(5) = 50$, $s(6) = 54$. Quãng đường đi được là $54 + 4 + 4 = 62$ m, nên phát biểu $4$ sai.]
  ],
)


#resetexamstate()

#tln(
  [Vật chuyển động với $s(t) = 2t^3 - 9t^2 + 12t$ (m, s). Vận tốc tại $t = 2$ s bằng (m/s).],
  [0],
  accent: c-p1,
  loigiai: [
    #step[Ta có $v(t) = s'(t) = 6t^2 - 18t + 12$.]
    #step[Suy ra $v(2) = 24 - 36 + 12 = 0$.]
  ],
)

#tln(
  [Vật ném lên từ mặt đất với $h(t) = -5t^2 + 20t$ (m, s). Thời điểm $t$ (giây) vật đạt độ cao cực đại là.],
  [2],
  accent: c-p1,
  loigiai: [
    #step[Tính đạo hàm $h'(t) = -10t + 20$.]
    #step[Cho $h'(t) = 0 <=> t = 2$, nên vật đạt độ cao cực đại tại $t = 2$ s.]
  ],
)

#tln(
  [Một chất điểm chuyển động theo quy luật $s(t) = t^3 - 12t^2 + 45t$ (m). Quãng đường chất điểm đi được trong $6$ giây đầu là bao nhiêu mét?],
  [62],
  accent: c-p1,
  loigiai: [
    #step[Ta có $v(t) = s'(t) = 3(t - 3)(t - 5)$ nên vật đổi chiều tại $t = 3$ và $t = 5$.]
    #step[Tính $s(0) = 0$, $s(3) = 54$, $s(5) = 50$, $s(6) = 54$.]
    #step[Quãng đường là $(54 - 0) + (54 - 50) + (54 - 50) = 62$ m.]
  ],
)


