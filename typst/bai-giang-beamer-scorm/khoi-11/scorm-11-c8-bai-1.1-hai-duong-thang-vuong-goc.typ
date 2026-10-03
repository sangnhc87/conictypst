#import "../../giao-an/modules/lecture-beamer.typ": *
#import "../../../public/hdsd/typst/sang-math-geom.typ": *

#show: lecture-theme.with(
  title: [Đường Thẳng Vuông Góc Mặt Phẳng],
  subtitle: [TOÁN 11 — QUAN HỆ VUÔNG GÓC TRONG KHÔNG GIAN],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG CHUYÊN SÂU])

// ════════════════════════════════════════════════
// PHẦN I: LÝ THUYẾT
// ════════════════════════════════════════════════
#lt-section-link("sec-ly-thuyet", "📚", [I. Đường thẳng vuông góc với mặt phẳng])

#lt-slide-back(title: "📚 1. Định nghĩa và Điều kiện vuông góc")[
  #lt-definition(title: "Định nghĩa")[
    Đường thẳng $d$ được gọi là vuông góc với mặt phẳng $(alpha)$ nếu $d$ vuông góc với *mọi* đường thẳng nằm trong $(alpha)$.
    Ký hiệu: $d perp (alpha)$.
  ]
  #lt-theorem(title: "Điều kiện vuông góc (Định lý)")[
    Nếu đường thẳng $d$ vuông góc với *hai đường thẳng cắt nhau* $a$ và $b$ cùng nằm trong mặt phẳng $(alpha)$ thì $d perp (alpha)$.
    $ cases(
      d perp a,
      d perp b,
      a subset (alpha) ", " b subset (alpha),
      a inter b = {M}
    ) => d perp (alpha) $
  ]
]

#lt-slide-back(title: "🚀 Trực quan hóa hình học")[
  #lt-two-col(
    ratio: (45%, 55%),
    [
      #lt-important(title: "Mô hình Chóp S.ABCD")[
        Cho chóp tứ giác $S.A B C D$ có đáy là hình vuông và cạnh bên $S A$ vuông góc với đáy.
        - $S A perp (A B C D)$.
        - Do $S A perp (A B C D)$ nên $S A$ vuông góc với mọi đường trong mặt đáy: $S A perp A B, S A perp A D, S A perp B D, S A perp A C...$
      ]
    ],
    [
      #align(center)[
        #sm-chop-sabcd-sa(
          them: (ctx, d) => {
            // Thêm đường chéo BD và AC để thể hiện SA vuông góc với chúng
            sm-doan(ctx, d.A, d.C, dut: true, mau: blue)
            sm-doan(ctx, d.B, d.D, dut: true, mau: blue)
            
            // Ký hiệu vuông góc SA với đáy
            sm-ve-goc-vuong(ctx, d.S, d.A, d.B)
            sm-ve-goc-vuong(ctx, d.S, d.A, d.D)
            
            // Gắn điểm
            sm-diem(ctx, d.S, ten: "S", huong: "tren")
            sm-diem(ctx, d.A, ten: "A", huong: "trai")
            sm-diem(ctx, d.B, ten: "B", huong: "duoi")
            sm-diem(ctx, d.C, ten: "C", huong: "phai")
            sm-diem(ctx, d.D, ten: "D", huong: "phai")
          }
        )
      ]
    ]
  )
]

#lt-slide-back(title: "⚡ Định lý 3 đường vuông góc")[
  #lt-theorem(title: "Định lý 3 đường vuông góc")[
    Cho đường thẳng $a$ nằm trong mặt phẳng $(P)$ và đường thẳng $b$ không nằm trong $(P)$, đồng thời $b$ không vuông góc với $(P)$. Gọi $b'$ là hình chiếu vuông góc của $b$ trên $(P)$.
    Khi đó: $a perp b <=> a perp b'$.
  ]
  #lt-tip(title: "Mẹo nhớ")[
    Đường thẳng nằm trong mặt phẳng sẽ vuông góc với đường xiên khi và chỉ khi nó vuông góc với hình chiếu của đường xiên đó.
  ]
]

// ════════════════════════════════════════════════
// TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-quiz", "✏️", [II. Luyện tập Trắc Nghiệm])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — QUAN HỆ VUÔNG GÓC],
  questions: (
    (num: 1, type: "TN", desc: [Điều kiện đường vuông góc mặt]),
    (num: 2, type: "TN", desc: [Tính chất vuông góc S.ABCD]),
    (num: 3, type: "TN", desc: [Chứng minh vuông góc]),
    (num: 4, type: "TN", desc: [Sử dụng định lý 3 đường]),
    (num: 5, type: "TN", desc: [Mệnh đề sai về vuông góc]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Để chứng minh đường thẳng $d$ vuông góc với mặt phẳng $(alpha)$, ta cần chứng minh $d$ vuông góc với:],
  (
    [Mọi đường thẳng nằm trong $(alpha)$.],
    [Hai đường thẳng song song nằm trong $(alpha)$.],
    [Hai đường thẳng cắt nhau nằm trong $(alpha)$.],
    [Một đường thẳng bất kỳ nằm trong $(alpha)$.]
  ),
  correct: 2,
  num: 1,
  de: "Điều kiện vuông góc cơ bản",
  loigiai: [
    Theo định lý điều kiện vuông góc: Đường thẳng $d$ vuông góc với $(alpha)$ nếu nó vuông góc với hai đường thẳng cắt nhau nằm trong $(alpha)$.
  ]
)

#lt-tn(
  [Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình vuông, $S A perp (A B C D)$. Khẳng định nào sau đây là SAI?],
  (
    [$S A perp A B$],
    [$S A perp B D$],
    [$S A perp S C$],
    [$S A perp A C$]
  ),
  correct: 2,
  num: 2,
  de: "Tính chất chóp SA vuông góc đáy",
  loigiai: [
    Vì $S A perp (A B C D)$ nên $S A$ vuông góc với mọi đường thẳng nằm trong mặt đáy $(A B C D)$, bao gồm $A B, A C, B D$. Tuy nhiên $S C$ không nằm trong đáy nên khẳng định $S A perp S C$ không có cơ sở đúng. Thực tế tam giác $S A C$ vuông tại $A$ nên $S A$ không thể vuông góc với cạnh huyền $S C$.
  ]
)

#lt-tn(
  [Cũng cho hình chóp $S.A B C D$ có đáy là hình vuông, $S A perp (A B C D)$. Khẳng định nào sau đây là ĐÚNG?],
  (
    [$B C perp (S A B)$],
    [$C D perp (S A D)$],
    [$B D perp (S A C)$],
    [Cả A, B, C đều đúng]
  ),
  correct: 3,
  num: 3,
  de: "Chứng minh đường vuông góc mặt",
  loigiai: [
    - Ta có $B C perp A B$ (đáy là hình vuông) và $B C perp S A$ (do $S A perp (A B C D)$). Suy ra $B C perp (S A B)$.
    - Tương tự $C D perp A D$ và $C D perp S A => C D perp (S A D)$.
    - $B D perp A C$ (đáy hình vuông) và $B D perp S A => B D perp (S A C)$.
    Do đó cả 3 khẳng định đều đúng.
  ]
)

#lt-tn(
  [Cho tứ diện $O A B C$ có $O A, O B, O C$ đôi một vuông góc. Gọi $H$ là hình chiếu vuông góc của $O$ trên $(A B C)$. Khẳng định nào ĐÚNG?],
  (
    [$H$ là trọng tâm tam giác $A B C$.],
    [$H$ là trực tâm tam giác $A B C$.],
    [$H$ là tâm đường tròn ngoại tiếp tam giác $A B C$.],
    [$H$ trùng với đỉnh $A$.]
  ),
  correct: 1,
  num: 4,
  de: "Tính chất tứ diện vuông",
  loigiai: [
    Trong tứ diện vuông $O A B C$ (với 3 cạnh tại $O$ đôi một vuông góc), hình chiếu vuông góc $H$ của đỉnh $O$ xuống mặt đáy đối diện $(A B C)$ luôn là **trực tâm** của tam giác $A B C$.
  ]
)

#lt-tn(
  [Khẳng định nào sau đây là SAI?],
  (
    [Nếu mặt phẳng $(P)$ chứa hai đường thẳng cùng vuông góc với $(Q)$ thì $(P) parallel (Q)$.],
    [Hai đường thẳng phân biệt cùng vuông góc với một mặt phẳng thì song song với nhau.],
    [Hai mặt phẳng phân biệt cùng vuông góc với một đường thẳng thì song song với nhau.],
    [Đường thẳng $d$ vuông góc với $(P)$, nếu $d$ song song với $d'$ thì $d'$ cũng vuông góc với $(P)$.]
  ),
  correct: 0,
  num: 5,
  de: "Mệnh đề tính chất vuông góc và song song",
  loigiai: [
    Câu A sai. Nếu $(P)$ chứa hai đường thẳng phân biệt $a, b$ cắt nhau và cùng vuông góc với $(Q)$, điều này vô lý (vì qua một điểm chỉ có duy nhất 1 đường thẳng vuông góc với mặt phẳng).
  ]
)
