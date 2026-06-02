#import "../_config.typ": *

#chapter([Quỹ đạo Pháo binh và Ném xiên 3D — Parabolic Trajectory], theme-color: c-p2)

#phuongphap(theme-color: c-p2)[
  *Bản chất:* Chuyển động ném xiên trong không gian có gia tốc trọng trường
  $g$ theo trục $O z$ hướng xuống:
  $
    cases(
      x(t) = x_0 + v_x t,
      y(t) = y_0 + v_y t,
      z(t) = z_0 + v_z t - frac(1, 2) g t^2
    )
  $
  Đây là đường parabol 3D. Điểm rơi khi $z(t) = 0$ (hoặc $z = z_"đích"$).

  *Bối cảnh thực tế:* Bắn pháo cối qua rặng núi (mặt phẳng chắn); tính
  tầm xa và kiểm tra đạn có vướng địa hình không.
]

#topic([Bắn Pháo Cối Qua Rặng Núi], prefix: "Bài", theme-color: c-p2)

#dang([Tìm điểm rơi và tầm xa], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Cho góc bắn, tốc độ đầu nòng. Tính tọa độ điểm rơi và
  kiểm tra xem đạn có bay qua đỉnh núi (điểm cố định) hay không.
]

#vd(
  [*(Khung)* Pháo đặt tại $O$, bắn theo hướng tạo góc $45°$ với mặt đất,
    vận tốc đầu nòng $v_0 = 300$ m/s. Xác định tầm xa và chiều cao tối
    đa của đạn. Kiểm tra đạn có vượt qua sườn núi có phương trình mặt
    phẳng $P: 2x + z = 600$ không.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p2,
)

#dang([Xác định góc bắn để đạn trúng mục tiêu tại tọa độ cho trước], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài ngược: Biết điểm đích $B(x_B, y_B, z_B)$, tìm góc bắn
  $theta$ để quỹ đạo đi qua $B$.
]
