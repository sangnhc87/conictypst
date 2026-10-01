// Tình huống 02: Vẫn gõ tn/ds/tln/tl, chỉ thêm ID bank.json để lọc và trộn.
#import "@local/sang-math:1.1.0": *
#set page(paper: "a4", margin: 18mm)
#show: sang-setup

#let (tn, ds, tln, tl) = bank-mode()
#let bank = question-bank(
  tn(
    [Đạo hàm của $x^2$ là gì?],
    ([$x$], True([$2x$]), [$x^2$], [$2$]),
    id: "1D7N2-1", loigiai: [$(x^2)'=2x$.],
  ),
  ds(
    [Xét đúng/sai về đạo hàm của $f(x)=x^2$.],
    (True([$f'(x)=2x$]), [$f'(1)=1$], True([$f'(2)=4$]), [$f'(0)=2$]),
    id: "1D7H2-1",
  ),
  tln([Tính $f'(3)$ nếu $f(x)=x^2$.], 6, id: "1D7V2-1"),
  tl([Tính đạo hàm của $f(x)=x^2+3x$.], id: "1D7C2-1", loigiai: [$f'(x)=2x+3$.]),
)
#assert(bank.len() == 4)

= Đề học sinh
#for q in bank { render-question(q, mode: "student") }
