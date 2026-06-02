#import "../sach/nguyen-ham-tich-phan-chuong3/_theme.typ": *

#set page(
  paper: "a4",
  margin: (x: 1.6cm, top: 2.2cm, bottom: 2.6cm),
  header: context {
    let n = counter(page).get().first()
    if n > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[
          #text(size: 8pt, fill: rgb("#607D8B"), style: "italic")[Tich phan ung dung chan 9-10]
        ],
        align(right)[
          #text(size: 8pt, fill: rgb("#1D4E89"), weight: "bold")[Doan de va bo khung giai]
        ],
      )
      v(2pt)
      line(length: 100%, stroke: 0.4pt + rgb("#CFD8DC"))
    }
  },
  footer: align(center, context {
    let n = counter(page).get().first()
    if n > 1 {
      text(size: 9pt, fill: rgb("#607D8B"))[-- #counter(page).display() --]
    }
  }),
)

#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.92em, first-line-indent: 1.2em)
#set list(indent: 1.2em, body-indent: 0.6em)
#set enum(indent: 1.2em, body-indent: 0.6em)
#show math.equation: set text(fill: rgb("#0A0A0A"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display
#show heading: it => {
  set par(first-line-indent: 0em)
  it
}

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  block(
    fill: gradient.linear(C-FOREST, C-EMERALD, angle: 90deg),
    inset: (x: 16pt, y: 10pt),
    radius: 5pt,
    width: 100%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: white, weight: "black", size: 14pt)[#it.body]
  ]
  v(0.9em)
}

#show heading.where(level: 2): it => block(
  fill: rgb("#F0FDFA"),
  stroke: (left: 4pt + C-EMERALD),
  inset: (x: 14pt, y: 10pt),
  radius: (right: 5pt),
  width: 100%,
  above: 1.2em,
  below: 0.6em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-FOREST, weight: "bold", size: 12pt)[#it.body]
]

#let warn-box(body) = block(
  fill: rgb("#FEF2F2"),
  stroke: (left: 4pt + rgb("#DC2626")),
  inset: (x: 14pt, y: 11pt),
  radius: (right: 6pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#B91C1C"), weight: "bold")[Bay mat diem thuong gap]
  #v(0.3em)
  #body
]

#cover-box(
  [TICH PHAN UNG DUNG CHAN 9-10],
  [Ban do doan de cho bai toan tich luy, ham tich luy, dieu kien dau, dong hoc va cac dai luong chay theo thoi gian],
)

#v(1em)

#align(center)[
  #block(
    fill: rgb("#FFF9C4"),
    stroke: 0.8pt + rgb("#FBC02D"),
    inset: 12pt,
    radius: 6pt,
    width: 92%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: rgb("#8D6E00"), weight: "bold")[Loi nhan truoc khi vao tich phan ung dung]
    #v(0.4em)
    #text(size: 9.6pt, style: "italic")[
      Cac cau tich phan ung dung chan diem cao thuong khong kho o buoc lay nguyen ham. Chung kho o buoc doc nghia dai luong: dau cua van toc, y nghia cua dien tich, su khac nhau giua tong luong va gia tri tai mot thoi diem, hay viec co phai cong them dieu kien dau hay khong. Tai lieu nay gom nhung y tuong de thi hay doi vo nhat.
    ]
  ]
]

#v(0.9em)

#quote-block[
  Neu mot bai tich phan ung dung ma em moi cham vao da vo van lay nguyen ham, rat co the em sap giai nham bai. Viec can lam truoc la dat ten dung cho dai luong: toc do hay tong luong, quang duong hay do doi, gia tri hien tai hay gia tri tich luy.
]

#v(1em)

#outline(title: [Muc luc chuyen de], depth: 2)

#pagebreak()

= Phan 0 - Ban do doan de tich phan ung dung

#why-box[
  Neu coi tich phan chi la thao tac ky thuat, em se bi roi khi de doi vo tu doanh thu sang luu luong, tu van toc sang quang duong, tu do thi sang ham tich luy. Neu coi tich phan la ngon ngu cua su tich luy, em se nhin ra cau truc chung dang an sau nhieu bai khac nhau.
]

#bridge-box("5 khung bai rat hay ra", [
  - *Khung 1 - Toc do ra tong luong:* doanh thu, dan so, luu luong, dien nang, luong mua.
  - *Khung 2 - Ham tich luy:* cho $F(x) = integral_a^x f(t) dif t$, hoi tinh don dieu, cuc tri, gia tri lon nhat nho nhat.
  - *Khung 3 - Bai toan nguoc tim tham so:* du lieu tong luong hoac gia tri cuoi, tim he so chua biet trong toc do.
  - *Khung 4 - Dong hoc va vat ly:* tu van toc ra do doi, tu luc ra cong, tu cong suat ra nang luong.
  - *Khung 5 - Tach khoang va doc dau:* quang duong, dien tich, gia tri tuyet doi, va cac moc ma ham doi dau.
])

#core-box[
  *Quy trinh 5 buoc xu ly nhanh bai tich phan ung dung:*

  1. Dat ten dung cho dai luong dang cho va dai luong can tim.
  2. Kiem tra don vi de biet can tich phan hay can cong them gia tri dau.
  3. Neu la bai quang duong hay dien tich thuc, kiem tra dau va cac moc doi dau truoc khi tinh.
  4. Neu la bai nguoc, viet phuong trinh tich luy roi moi giai tham so.
  5. Sau cung moi ket luan bang ngon ngu thuc te: tang bao nhieu, tong duoc bao nhieu, trong bao lau, hay gia tri tai thoi diem nao.
]

#tech-box[
  *Ba phan xa thi cu can co:*

  - Thay "toc do", "luu luong", "muc tang" thi nghi ngay toi tich luy.
  - Thay $F(x) = integral_a^x f(t) dif t$ thi nho ngay $F'(x) = f(x)$.
  - Thay quang duong hoac tong luong thuc thi phai xem co can tri tuyet doi hay tach khoang khong.
]

#warn-box[
  - Nham giua do doi va quang duong.
  - Quen cong them dieu kien dau khi de cho gia tri ban dau.
  - Coi ket qua tich phan la gia tri tai mot thoi diem thay vi tong luong tren mot khoang.
]

= Phan I - Ham tich luy va dieu kien dau

#include "../sach/nguyen-ham-tich-phan-chuong3/parts/01e-ham-tich-luy.typ"

#include "../sach/nguyen-ham-tich-phan-chuong3/parts/01h-dieu-kien-dau.typ"

= Phan II - Xuong bai tich luy va bien thien theo thoi gian

#include "../sach/nguyen-ham-tich-phan-chuong3/parts/02b-tich-luy-thay-doi.typ"

= Phan III - Chot lai cho muc tieu 9-10

#meta-box[
  *5 cau hoi nen tu hoi trong 20 giay dau:*

  - De dang cho mot toc do, mot tong luong, hay mot ham tich luy?
  - Ket qua can tim la tong luong tren khoang, hay gia tri tai cuoi khoang?
  - Co gia tri ban dau de cong them khong?
  - Ham co doi dau khong, va co can tach khoang hay lay tri tuyet doi khong?
  - Don vi cuoi cung co khop voi y nghia thuc te cua bai toan khong?
]

#essay-box("Thu tu on nuoc rut", [
  Neu can rut gon thoi gian on, hay di tu toc do ra tong luong, sang ham tich luy, sang bai toan nguoc tim tham so, roi moi den dong hoc va cong co hoc. Moi khung can nam mot y nghia vat ly, mot cong thuc goc, va mot cho de mat diem nhat.
])
