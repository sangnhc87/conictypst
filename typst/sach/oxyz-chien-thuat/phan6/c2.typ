#import "../_config.typ": *

#chapter([Hình Nón Tầm nhìn và Vùng Sáng — Cone of Light], theme-color: c-p6)

#phuongphap(theme-color: c-p6)[
  *Bản chất:* Tập hợp các điểm $M$ sao cho góc $angle(arrow(I M), arrow(u))$
  bằng $alpha$ (không đổi) là một *mặt nón* đỉnh $I$, trục $arrow(u)$:
  $
    cos alpha = frac(|arrow(I M) dot.c arrow(u)|, |arrow(I M)| dot.c |arrow(u)|)
  $
  Giao của mặt nón với mặt phẳng cho vùng chiếu sáng (hình elip, parabol
  hoặc hyperbola tùy góc nghiêng).

  *Bối cảnh thực tế:* Đèn pin, đèn pha ô tô, camera góc rộng chiếu xuống
  mặt đất; vùng phủ sóng hình nón của anten.
]

#topic([Đèn Pha Chiếu Xuống Mặt đường], prefix: "Bài", theme-color: c-p6)

#dang([Giao mặt nón với mặt phẳng $z = 0$], theme-color: c-p6)

#ghinho(theme-color: c-p6)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Đèn pha gắn tại $L(0; 0; h)$, hướng thẳng xuống, góc mở $alpha$.
  Tìm phương trình đường tròn vùng sáng trên mặt đất $z = 0$ và tính
  bán kính vùng chiếu.
]

#vd(
  [*(Khung)* Đèn tại $L(0; 0; 4)$ m, chiếu thẳng xuống $arrow(u) = (0; 0; -1)$,
    góc mở $30°$. Tính bán kính vùng sáng trên mặt đất $z = 0$.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p6,
)

#topic([Camera Góc rộng Trên UAV], prefix: "Bài", theme-color: c-p6)

#dang([Tính diện tích vùng quan sát khi UAV nghiêng góc], theme-color: c-p6)

#ghinho(theme-color: c-p6)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: UAV ở độ cao $h$, camera hướng theo vectơ $arrow(u)$
  nghiêng $theta$ so với phương thẳng đứng, góc mở $alpha$. Giao mặt nón
  với $z = 0$ là hình elip — tính diện tích.
]
