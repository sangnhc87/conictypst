#import "../lib.typ": *

// File này minh họa cách dùng exam-preset và exam-theme.
// Sửa nhanh các biến dưới đây để đổi giao diện.

#let theme = "royal"
// Các theme: classic, ocean, emerald, royal, violet, crimson, graphite, amber,
// teal-pro, sky, indigo-minimal, print-economy, aurora, lotus, navy-gold, jade, coral, plum.

#let profile = "loigiai"
// profile: "dethi" | "loigiai" | "compact" | "draft" | "beamer"

#let opt-style = "circle"
// opt-style: "plain", "circle", "solid-circle", "hexagon", "solid-hexagon", "badge", ...

#let preset = exam-preset(
  theme: theme,
  profile: profile,
  opt-style: opt-style,
  q-label-style: "pill",
)
#let (tn, ds, tln, tl) = exam-mode(..preset.question)

#show: sang-setup.with(math-color: preset.accent)
#show: exam-theme.with(
  theme: preset.theme,
  school: "TRƯỜNG THPT SANG-MATH",
  exam-title: "MẪU THEME VÀ PROFILE",
  subject: "TOÁN 12",
  duration: "45 phút",
  code: "201",
  footer-left: [Đổi theme/profile ở đầu file để xem giao diện khác.],
  ..preset.template,
)

#exam-part([PHẦN I. Trắc nghiệm], count: 5)

#tn([Đạo hàm của $y=x^4$ là], ([$x^3$], True([$4x^3$]), [$4x$], [$x^4$]), loigiai: [$(x^4)'=4x^3$.])
#tn([Nghiệm của $x^2-9=0$ là], ([$x=3$], [$x=-3$], True([$x=+-3$]), [$x=9$]), loigiai: [$x^2=9$, nên $x=+-3$.])
#tn([Tập xác định của $y=1/(x-2)$ là], ([$RR$], True([$RR setminus {2}$]), [$[2;+oo)$], [$(-oo;2)$]), loigiai: [Mẫu số khác $0$, nên $x != 2$.])
#tn([Tính $C(7,1)$.], ([$1$], True([$7$]), [$14$], [$21$]), loigiai: [$C(7,1)=7$.])
#tn([Giá trị lớn nhất của $-x^2+4x$ là], ([$2$], True([$4$]), [$0$], [$8$]), loigiai: [$-x^2+4x=-(x-2)^2+4 <= 4$.])

#exam-part([PHẦN II. Trả lời ngắn], count: 2)

#tln([Tính $f'(2)$ với $f(x)=x^3$.], [$12$], loigiai: [$f'(x)=3x^2$, nên $f'(2)=12$.])
#tln([Giải $3^x=81$.], [$4$], loigiai: [$81=3^4$.])

#exam-part([PHẦN III. Tự luận], count: 1)

#tl([Xét tính đơn điệu của $y=x^3-3x+1$.],
  lines: 7,
  loigiai: [
    $y'=3x^2-3=3(x-1)(x+1)$.
    #bbbt(x-vals: ($-oo$, $-1$, $1$, $+oo$), d-signs: ("+", 0, "-", 0, "+"), v-vals: ($-oo$, $3$, $-1$, $+oo$))
  ],
)

#if preset.template.at("answer-key") { print-answer-key() }
