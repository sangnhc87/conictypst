#import "../../public/hdsd/typst/sang-exam.typ": *
#import "../../public/hdsd/typst/exam-templates.typ": *
#let theme = "teal-pro"
#let profile = "loigiai"
#let opt-style = auto
#let preset = exam-preset(theme: theme, profile: profile, opt-style: opt-style)
#let (tn, ds, tln, tl) = exam-mode(..preset.question)
#show: sang-setup.with(math-color: preset.accent)
#show: body => exam-theme(body, theme: preset.theme, department: "SỞ", school: "TRƯỜNG", exam-title: "TEST", subject: "TOÁN", duration: "20 phút", code: "101", ..preset.template)
#tn([Test $x^2$], ([$A$], True([$B$]), [$C$], [$D$]), loigiai: [OK])
