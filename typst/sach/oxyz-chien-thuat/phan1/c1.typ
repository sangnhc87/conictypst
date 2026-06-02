#import "../_config.typ": *

#chapter([Tĩnh lực học Đa điểm — Truss Structures & Tension], theme-color: c-p1)

#phuongphap(theme-color: c-p1)[
  *Bản chất:* Mỗi nút của hệ giàn chịu tác dụng của nhiều lực
  $arrow(F_1), arrow(F_2), dots$ Điều kiện cân bằng tĩnh:
  $
    sum arrow(F_i) = arrow(0)
    <==> cases(
      sum F_(i x) = 0,
      sum F_(i y) = 0,
      sum F_(i z) = 0
    )
  $
  *Bối cảnh thực tế:* Hệ giàn giáo thi công, cẩu tháp, flycam bị tác dụng
  bởi sức gió, cáp treo cầu chịu tải.
]

#topic([Cẩu tháp và Hệ dây cáp Đa điểm], prefix: "Bài", theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Cho các lực treo tại một điểm qua các dây cáp có hướng cho trước.
  Tìm độ lớn lực căng mỗi dây để hệ cân bằng.
]

#vd(
  [*(Khung — chưa có đề bài)* Một điểm nút của giàn giáo $O$ chịu tác dụng
    của ba lực treo qua ba dây cáp $O A$, $O B$, $O C$ và lực trọng lực
    $arrow(P)$ hướng xuống. Tìm lực căng mỗi dây.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p1,
)

#topic([Flycam Đa điểm — Cân bằng dưới Tác động Gió], prefix: "Bài", theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Flycam 4 cánh được giữ bởi 4 dây cáp; gió tác dụng lực ngang.
  Tìm điều kiện để flycam không bị lệch quỹ đạo.
]
