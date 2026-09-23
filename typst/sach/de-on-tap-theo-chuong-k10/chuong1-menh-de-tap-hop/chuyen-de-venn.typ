#import "@preview/sang-math:1.0.6": *

#let mode = (loigiai: true)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: rgb("#0284c7"))

// ═══════════════════════════════════════════════════════════
// HÀM VẼ BIỂU ĐỒ VENN CE-TZ
// ═══════════════════════════════════════════════════════════
#let venn2-box(
  title: "Khảo sát",
  name-a: "Tập A",
  name-b: "Tập B",
  only-a: "0",
  both: "0",
  only-b: "0",
  outside: none,
) = align(center)[
  #box(
    stroke: 0.8pt + rgb("cbd5e1"),
    radius: 6pt,
    fill: rgb("f8fafc"),
    inset: 8pt,
  )[
    #text(weight: "bold", size: 9pt, fill: rgb("1e293b"))[#title]
    #v(3pt)
    #cetz.canvas({
      import cetz.draw: *
      rect((-3.0, -1.8), (3.0, 1.8), stroke: 0.8pt + rgb("94a3b8"), fill: rgb("ffffff"))
      content((2.6, 1.5), text(size: 8pt, weight: "bold", fill: rgb("64748b"))[$U$])
      
      circle((-0.8, 0), radius: 1.3, fill: rgb("dbeafe80"), stroke: 1.2pt + rgb("1d4ed8"))
      content((-1.5, 1.1), text(size: 8.5pt, weight: "bold", fill: rgb("1d4ed8"))[#name-a])
      content((-1.3, 0), text(size: 9pt, weight: "bold")[#only-a])
      
      circle((0.8, 0), radius: 1.3, fill: rgb("fee2e280"), stroke: 1.2pt + rgb("b91c1c"))
      content((1.5, 1.1), text(size: 8.5pt, weight: "bold", fill: rgb("b91c1c"))[#name-b])
      content((1.3, 0), text(size: 9pt, weight: "bold")[#only-b])
      
      content((0, 0), text(size: 9pt, weight: "bold")[#both])
      
      if outside != none {
        content((2.4, -1.3), text(size: 8.5pt, weight: "bold")[#outside])
      }
    })
  ]
]

#let venn3-box(
  title: "Khảo sát",
  name-a: "Tập A",
  name-b: "Tập B",
  name-c: "Tập C",
  only-a: "0",
  only-b: "0",
  only-c: "0",
  ab-only: "0",
  bc-only: "0",
  ca-only: "0",
  abc: "0",
  outside: none,
) = align(center)[
  #box(
    stroke: 0.8pt + rgb("cbd5e1"),
    radius: 6pt,
    fill: rgb("f8fafc"),
    inset: 8pt,
  )[
    #text(weight: "bold", size: 9pt, fill: rgb("1e293b"))[#title]
    #v(3pt)
    #cetz.canvas({
      import cetz.draw: *
      rect((-3.5, -2.5), (3.5, 2.5), stroke: 0.8pt + rgb("94a3b8"), fill: rgb("ffffff"))
      content((3.1, 2.2), text(size: 8pt, weight: "bold", fill: rgb("64748b"))[$U$])
      
      circle((-1.0, 0.5), radius: 1.5, fill: rgb("dbeafe80"), stroke: 1.2pt + rgb("1d4ed8"))
      content((-2.0, 1.8), text(size: 8.5pt, weight: "bold", fill: rgb("1d4ed8"))[#name-a])
      content((-1.6, 0.9), text(size: 9pt, weight: "bold")[#only-a])
      
      circle((1.0, 0.5), radius: 1.5, fill: rgb("fee2e280"), stroke: 1.2pt + rgb("b91c1c"))
      content((2.0, 1.8), text(size: 8.5pt, weight: "bold", fill: rgb("b91c1c"))[#name-b])
      content((1.6, 0.9), text(size: 9pt, weight: "bold")[#only-b])
      
      circle((0, -1.0), radius: 1.5, fill: rgb("dcfce780"), stroke: 1.2pt + rgb("15803d"))
      content((1.5, -2.0), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"))[#name-c])
      content((0, -1.6), text(size: 9pt, weight: "bold")[#only-c])
      
      content((0, 1.0), text(size: 8pt, weight: "bold")[#ab-only])
      content((0.8, -0.3), text(size: 8pt, weight: "bold")[#bc-only])
      content((-0.8, -0.3), text(size: 8pt, weight: "bold")[#ca-only])
      content((0, 0.2), text(size: 8pt, weight: "bold")[#abc])
      
      if outside != none {
        content((2.8, -2.0), text(size: 8.5pt, weight: "bold")[#outside])
      }
    })
  ]
]


#align(center)[
  #text(size: 16pt, weight: "bold", fill: rgb("#dc2626"))[CHUYÊN ĐỀ SÂU: DẠNG 3 - BIỂU ĐỒ VENN & TẬP HỢP] \
  #v(0.5em)
  #text(size: 12pt, style: "italic")[Tổng hợp các dạng toán thực tế HAY - LẠ - KHÓ]
]

#v(1em)

#let dang(title) = {
  v(1em)
  block(
    fill: rgb("eff6ff"), 
    stroke: (left: 4pt + rgb("2563eb")), 
    inset: 10pt, 
    width: 100%, 
    radius: (right: 4pt)
  )[
    #text(weight: "bold", size: 12pt, fill: rgb("1e40af"))[#title]
  ]
  v(0.5em)
}

#dang("Công thức tính số phần tử và cách dùng sơ đồ Venn")
*1. Quy tắc cộng và biểu đồ Venn cho hai tập hợp*
Cho $A$ và $B$ là hai tập hợp hữu hạn. Số phần tử của $A union B$ được tính bởi:
$ n(A union B) = n(A) + n(B) - n(A sect B) $
Trong biểu đồ Venn, ta chia làm 3 vùng không giao nhau:
- Vùng chỉ thuộc $A$: $n(A setminus B) = n(A) - n(A sect B)$
- Vùng chỉ thuộc $B$: $n(B setminus A) = n(B) - n(A sect B)$
- Vùng thuộc cả $A$ và $B$: $n(A sect B)$

*2. Quy tắc cộng và biểu đồ Venn cho ba tập hợp*
Cho ba tập hợp hữu hạn $A, B, C$. Công thức tính:
$ n(A union B union C) = n(A) + n(B) + n(C) - n(A sect B) - n(B sect C) - n(C sect A) + n(A sect B sect C) $
Khi giải các bài toán thực tế phức tạp, ta thường vẽ biểu đồ Venn 3 vòng và gọi ẩn số cho các vùng bị chia cắt (đặc biệt là vùng lõi $A sect B sect C$).

---

#v(1em)
#dang("Bài tập Trắc nghiệm HAY - LẠ - KHÓ")

#tn([Một cuộc khảo sát thói quen tiêu dùng trên $100$ gia đình ở một khu phố cho kết quả: Có $70$ gia đình sử dụng ví điện tử Momo, $60$ gia đình sử dụng ZaloPay. Biết rằng có ít nhất $x$ gia đình sử dụng cả hai loại ví điện tử này. Giá trị nhỏ nhất của $x$ là bao nhiêu?],
  (
    [$30$],
    True([$30$]),
    [$10$],
    [$40$]
  ),
  loigiai: [
    Gọi $A$ là tập các gia đình dùng Momo, $B$ là tập các gia đình dùng ZaloPay.
    Ta có $n(U) = 100$, $n(A) = 70$, $n(B) = 60$.
    Số gia đình sử dụng ít nhất một trong hai ví là:
    $ n(A union B) = n(A) + n(B) - n(A sect B) = 70 + 60 - x = 130 - x $
    Vì số gia đình dùng ít nhất một ví không thể vượt quá tổng số gia đình được khảo sát, nên:
    $ n(A union B) <= 100 => 130 - x <= 100 => x >= 30 $
    Vậy có ít nhất $30$ gia đình sử dụng cả hai loại ví.
    
    #venn2-box(
      title: "Khảo sát Ví điện tử",
      name-a: "Momo (70)",
      name-b: "ZaloPay (60)",
      only-a: "70-x",
      both: "x",
      only-b: "60-x",
      outside: "x-30"
    )
  ]
)

#tn([Trong một đợt khảo sát $500$ sinh viên về sở thích đồ uống. Có $320$ sinh viên thích trà sữa, $250$ sinh viên thích cà phê, và $180$ sinh viên thích nước ép. Biết rằng có $120$ sinh viên thích cả trà sữa và cà phê, $90$ sinh viên thích trà sữa và nước ép, $70$ sinh viên thích cà phê và nước ép. Nếu có $30$ sinh viên không thích đồ uống nào trong ba loại trên, thì số sinh viên thích cả ba loại đồ uống là bao nhiêu?],
  (
    [$30$],
    [$40$],
    [$20$],
    True([$0$])
  ),
  loigiai: [
    Gọi $A, B, C$ lần lượt là tập hợp các sinh viên thích trà sữa, cà phê, nước ép.
    Ta có $n(A) = 320$, $n(B) = 250$, $n(C) = 180$.
    $n(A sect B) = 120$, $n(A sect C) = 90$, $n(B sect C) = 70$.
    Số sinh viên thích ít nhất một loại đồ uống là:
    $ n(A union B union C) = 500 - 30 = 470 $
    Theo công thức bao hàm - loại trừ:
    $ n(A union B union C) &= n(A) + n(B) + n(C) - n(A sect B) - n(B sect C) - n(C sect A) + n(A sect B sect C) \
    470 &= 320 + 250 + 180 - 120 - 70 - 90 + n(A sect B sect C) \
    470 &= 470 + n(A sect B sect C) \
    => n(A sect B sect C) &= 0 $
    Vậy không có sinh viên nào thích cả ba loại đồ uống.
    
    #venn3-box(
      title: "Sở thích đồ uống",
      name-a: "Trà sữa",
      name-b: "Cà phê",
      name-c: "Nước ép",
      only-a: "110",
      only-b: "60",
      only-c: "20",
      ab-only: "120",
      bc-only: "70",
      ca-only: "90",
      abc: "0",
      outside: "30"
    )
  ]
)

#tn([Lớp 10A có $45$ học sinh. Trong đó có $25$ học sinh giỏi Toán, $20$ học sinh giỏi Lý, $18$ học sinh giỏi Hóa. Biết rằng số học sinh giỏi cả ba môn là $5$, và có $8$ học sinh không giỏi môn nào trong ba môn trên. Tổng số học sinh giỏi đúng hai môn (trong ba môn) là bao nhiêu?],
  (
    [$10$],
    [$11$],
    True([$16$]),
    [$21$]
  ),
  loigiai: [
    Gọi $A, B, C$ lần lượt là tập hợp học sinh giỏi Toán, Lý, Hóa.
    Số học sinh giỏi ít nhất một môn:
    $ n(A union B union C) = 45 - 8 = 37 $
    Theo công thức:
    $ n(A union B union C) &= n(A) + n(B) + n(C) - (n(A sect B) + n(B sect C) + n(C sect A)) + n(A sect B sect C) $
    Thay số:
    $ 37 &= 25 + 20 + 18 - (n(A sect B) + n(B sect C) + n(C sect A)) + 5 $
    $ => n(A sect B) + n(B sect C) + n(C sect A) &= 68 - 37 = 31 $
    Số học sinh giỏi ĐÚNG hai môn là:
    $ &= n(A sect B) + n(B sect C) + n(C sect A) - 3 dot n(A sect B sect C) \
    &= 31 - 3 dot 5 = 16 $
    Vậy có $16$ học sinh giỏi đúng hai môn.
  ]
)

#tn([Trong một hội nghị có $100$ đại biểu tham dự. Qua khảo sát, ban tổ chức thu được các số liệu sau: có $45$ đại biểu biết tiếng Anh, $40$ đại biểu biết tiếng Pháp, $35$ đại biểu biết tiếng Nga. Hơn nữa, có $15$ đại biểu biết cả tiếng Anh và Pháp; $10$ đại biểu biết tiếng Pháp và Nga; $12$ đại biểu biết tiếng Anh và Nga; và $5$ đại biểu biết cả ba thứ tiếng. Tính số đại biểu không biết thứ tiếng nào trong ba tiếng trên.],
  (
    True([$12$]),
    [$15$],
    [$18$],
    [$10$]
  ),
  loigiai: [
    Gọi $A, B, C$ lần lượt là tập các đại biểu biết tiếng Anh, Pháp, Nga.
    Ta có: 
    $n(A)=45, n(B)=40, n(C)=35$.
    $n(A sect B)=15, n(B sect C)=10, n(C sect A)=12$.
    $n(A sect B sect C)=5$.
    
    Số đại biểu biết ít nhất một trong 3 thứ tiếng là:
    $ n(A union B union C) &= n(A) + n(B) + n(C) - n(A sect B) - n(B sect C) - n(C sect A) + n(A sect B sect C) \
    &= 45 + 40 + 35 - 15 - 10 - 12 + 5 = 88 $
    Vậy số đại biểu không biết thứ tiếng nào là:
    $ n(U) - n(A union B union C) = 100 - 88 = 12 $
    
    #venn3-box(
      title: "Ngôn ngữ Đại biểu",
      name-a: "Tiếng Anh",
      name-b: "Tiếng Pháp",
      name-c: "Tiếng Nga",
      only-a: "23",
      only-b: "20",
      only-c: "18",
      ab-only: "10",
      bc-only: "5",
      ca-only: "7",
      abc: "5",
      outside: "12"
    )
  ]
)

#print-answer-key()
