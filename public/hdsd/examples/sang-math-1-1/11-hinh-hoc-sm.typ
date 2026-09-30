// Tình huống 11: Hình chóp có trung điểm và thiết diện bằng thư viện sm-*.
// ZIP đi kèm thư viện typst/sang-math-geom.typ và conic-toan/baigiang.typ.
#import "../../typst/sang-math-geom.typ": *
#set page(paper: "a4", margin: 20mm)

= Thiết diện của hình chóp $S.A B C$

Cho $M$ là trung điểm $S B$, $N$ thuộc $S C$ sao cho $S N=frac(2,3) S C$.
Mặt phẳng $(A M N)$ cắt hình chóp theo tam giác $A M N$.

#align(center)[#sm-chop-sabc(
  them: (ctx, d) => {
    let M = sm-trung-diem(d.S, d.B)
    let N = sm-ti-le(d.S, d.C, 2/3)
    sm-thiet-dien(ctx, (d.A, M, N), to: rgb(124, 58, 237, 40), mau: sm-purple)
    sm-doan(ctx, d.A, M, dut: true, mau: sm-purple)
    sm-doan(ctx, M, N, mau: sm-purple)
    sm-doan(ctx, d.A, N, dut: true, mau: sm-purple)
    sm-diem(ctx, M, ten: "M", huong: "tay")
    sm-diem(ctx, N, ten: "N", huong: "dong")
  },
)]
