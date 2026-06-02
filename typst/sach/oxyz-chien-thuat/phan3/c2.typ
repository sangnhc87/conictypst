#import "../_config.typ": *

#chapter([Chuyển đổi Dữ liệu Địa lý và Định vị GPS], theme-color: c-p3)

#phuongphap(theme-color: c-p3)[
  *Bản chất:* Trong thực tế, dữ liệu GPS cho tọa độ cầu $(lambda, phi, h)$
  (kinh độ, vĩ độ, cao độ). Để giải bài toán hình học, ta chiếu về một hệ
  phẳng cục bộ:
  $
    cases(
      x = R cos(phi) Delta lambda,
      y = R Delta phi,
      z = h
    )
  $
  với $R approx 6371$ km. Khi khoảng cách nhỏ ($< 100$ km), phép chiếu này
  cho sai số không đáng kể.

  *Bối cảnh thực tế:* Tính chiều dài cáp treo xuyên thung lũng; xác định
  khoảng cách thực giữa hai trạm thu phát sóng đặt trên địa hình đồi núi.
]

#topic([Cáp Treo Xuyên Thung lũng — Dữ liệu GPS], prefix: "Bài", theme-color: c-p3)

#dang([Chuyển GPS sang tọa độ $O x y z$ cục bộ, tính khoảng cách], theme-color: c-p3)

#ghinho(theme-color: c-p3)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Cho tọa độ GPS của hai điểm neo cáp. Chuyển về $O x y z$, tính
  chiều dài cáp và độ võng tối đa nếu biết tải trọng.
]

#vd(
  [*(Khung)* Điểm neo $A$ ở độ cao $850$ m, điểm neo $B$ ở độ cao $920$ m,
    khoảng cách ngang $A B$ là $1200$ m (đã tính từ GPS). Tính chiều dài
    cáp thẳng $A B$ và góc nghiêng so với mặt nằm ngang.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p3,
)

#topic([Tam Giác Định vị từ 3 Trạm Phát sóng], prefix: "Bài", theme-color: c-p3)

#ghinho(theme-color: c-p3)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Ba trạm phát sóng biết tọa độ $A$, $B$, $C$. Biết cường độ
  tín hiệu (quy về khoảng cách $r_1, r_2, r_3$). Xác định tọa độ thiết
  bị thu (bài toán giao ba mặt cầu).
]
