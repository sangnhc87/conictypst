#import "../sach/thong-ke-10-11-12/_theme.typ": *

#set page(
  paper: "a4",
  margin: (x: 1.6cm, top: 2.2cm, bottom: 2.6cm),
  header: context {
    let n = counter(page).get().first()
    if n > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[
          #text(size: 8pt, fill: rgb("#607D8B"), style: "italic")[Thong ke chan 9-10]
        ],
        align(right)[
          #text(size: 8pt, fill: rgb("#0F766E"), weight: "bold")[Doc du lieu va do phan tan]
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

#cover-box(
  [THONG KE CHAN 9-10],
  [Ban do doan de cho thong ke ghep nhom, do phan tan, va cach doc du lieu de khong mat diem vi ket luan voi],
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
    #text(fill: rgb("#8D6E00"), weight: "bold")[Loi nhan truoc khi vao thong ke]
    #v(0.4em)
    #text(size: 9.6pt, style: "italic")[
      Thong ke hiem khi danh do em bang thao tac bam may. No thuong danh do em bang viec nhin sai cau hoi: de dang hoi ve muc do dien hinh hay ve do bien dong, dang muon tim mot dai dien hay dang muon so sanh hai nhom. Trong de thi, thong ke la chu de lay diem chac neu em giu duoc quy trinh doc du lieu dung ngay tu dau.
    ]
  ]
]

#v(0.9em)

#why-box[
  Muc tieu cua tai lieu nay la gom lai nhung y tuong giup em doc dung du lieu ghep nhom va ket luan dung. Neu em chi nho cong thuc ma khong nho y nghia, em se rat de tinh dung nhung van ket luan sai.
]

#bridge-box("4 khung cau hoi hay gap", [
  - *Khung 1 - Dai luong dai dien:* trung binh, trung vi, tu phan vi.
  - *Khung 2 - Do phan tan:* khoang tu phan vi, phuong sai, do lech chuan.
  - *Khung 3 - So sanh hai nhom:* tam co giong nhau khong, do rong co giong nhau khong.
  - *Khung 4 - Ket luan boi canh:* on dinh, dong deu, phan hoa, hay rui ro.
])

#core-box[
  *Quy trinh 5 buoc de xu ly nhanh mot bai thong ke ghep nhom:*

  1. Xac dinh de dang hoi ve tam hay ve do phan tan.
  2. Neu la bai ghep nhom, luon ghi nho minh dang dung gia tri dai dien de xap xi.
  3. Neu la bai tu phan vi, phai xac dinh dung lop chua truoc khi noi suy.
  4. Neu la bai so sanh, phai nhin ca tam va do rong, khong ket luan tu mot con so.
  5. Cau cuoi cung phai viet theo nghia thuc te cua boi canh, khong chi lap lai gia tri so.
]

#tech-box[
  *Ba phan xa can co trong phong thi:*

  - Thay phuong sai, do lech chuan thi nghi ngay toi muc do bien dong.
  - Thay khoang tu phan vi thi nghi ngay toi nong do tap trung cua du lieu o 50 phan tram giua.
  - Thay so sanh hai mau thi dat ngay hai cau hoi: nhom nao cao hon ve mat bang, nhom nao deu hon ve do phan tan.
]

#mistake-box("Ba loi rat hay gap")[
  - Dung cong thuc nhung nham y nghia cua dai luong.
  - So sanh hai nhom bang mot con so duy nhat.
  - Quen rang du lieu ghep nhom la du lieu da bi nen, nen ket qua la xap xi co kiem soat.
]

= Phan I - Xuong thong ke ghep nhom

#include "../sach/thong-ke-10-11-12/parts/02b-phuong-sai-do-lech-chuan.typ"

= Phan II - Chot lai cho muc tieu 9-10

#meta-box[
  *5 cau hoi nen tu hoi trong 20 giay dau:*

  - De dang hoi ve tam hay ve do phan tan?
  - Du lieu la du lieu that hay da ghep nhom?
  - Ket luan cuoi cung dang noi ve on dinh, dong deu, hay phan hoa?
  - Em da giu boi canh khi so sanh hai nhom chua?
  - Con so cuoi cung co phan anh dung y nghia cua cau hoi khong?
]
