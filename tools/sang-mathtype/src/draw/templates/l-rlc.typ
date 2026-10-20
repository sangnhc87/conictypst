// @nhom Vật lí
// @muc Mạch điện
// @ten Mạch RLC nối tiếp (xoay chiều)
// @mota Nguồn xoay chiều, R, L, C nối tiếp; vôn kế đo từng đoạn
// @tu rlc xoay chieu cuon cam tu dien
#import "/sm-draw.typ": *
#sm-canvas({
  import draw: *
  sym((0, 0), (0, 3.2), "ac", lbl: $u = U_0 cos omega t$, side: 1, len: 1.2)
  day((0, 3.2), (0.8, 3.2))
  sym((0.8, 3.2), (3.6, 3.2), "R", lbl: $R$)
  sym((3.6, 3.2), (6.8, 3.2), "cuon", lbl: $L$, len: 1.8)
  sym((6.8, 3.2), (9.2, 3.2), "tu", lbl: $C$)
  day((9.2, 3.2), (10.2, 3.2), (10.2, 0), (0, 0))
  // các điểm A, M, N, B
  nutd((0.8, 3.2), (3.6, 3.2), (6.8, 3.2), (9.2, 3.2))
  lab((0.8, 3.45), [A], at: "south", size: 10pt)
  lab((3.6, 3.45), [M], at: "south", size: 10pt)
  lab((6.8, 3.45), [N], at: "south", size: 10pt)
  lab((9.2, 3.45), [B], at: "south", size: 10pt)
  // vôn kế đo U_AB
  day((0.8, 3.2), (0.8, 5.0))
  sym((0.8, 5.0), (9.2, 5.0), "V", len: 1.0)
  day((9.2, 5.0), (9.2, 3.2))
  lab((5.0, 5.6), [$U_(A B)$], size: 10pt)
})
