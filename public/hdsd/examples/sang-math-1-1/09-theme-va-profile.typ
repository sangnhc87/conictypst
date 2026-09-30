// Tình huống 09: Đổi theme và profile mà không sửa từng câu hỏi.
// Biên dịch thêm: typst compile --input profile=loigiai ...
#import "@local/sang-math:1.1.0": *

#let profile = sys.inputs.at("profile", default: "dethi")
#let preset = exam-preset(theme: "ocean", profile: profile)
#let (tn, ds, tln, tl) = exam-mode(..preset.question)
#show: sang-setup
#show: exam-theme.with(
  theme: preset.theme,
  school: "TRƯỜNG THPT SANG MATH",
  exam-title: "KIỂM TRA TOÁN",
  subject: "TOÁN 12",
  duration: "45 phút",
  code: "101",
  ..preset.template,
)

#tn([Tính $1+1$.], ([$1$], True([$2$]), [$3$], [$4$]), loigiai: [$1+1=2$.])
#ds([Xét số $2$.], (True([$2$ chẵn.]), [$2$ lẻ.], True([$2>0$]), [$2<0$])))
#tln([Tính $3+4$.], [7], loigiai: [$3+4=7$.])
#het
