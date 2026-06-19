#import "_config.typ": *

#lesson([Ứng Dụng Thực Tế Của Mũ và Logarit], theme-color: c-book)

#q-label([A. LÝ THUYẾT VÀ CÁC MÔ HÌNH TRỌNG TÂM], c-book)

#muc([1. Toán Tài Chính: Lãi kép và Lạm phát])

#block(breakable: false)[
  #phuongphap(title: [⚙ Bài toán gửi tiền lãi kép cơ bản])[
    - Khách hàng gửi số tiền ban đầu $A$ vào ngân hàng với lãi suất $r$ / kỳ hạn (không rút lãi ra).
    - Số tiền thu được (cả vốn lẫn lãi) sau $n$ kỳ hạn là:
      $ T = A(1 + r)^n $
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Gửi tiền định kỳ (Trả góp / Tích lũy)])[
    - Mỗi kỳ hạn gửi đều đặn số tiền $M$ vào ngân hàng, lãi suất $r$ / kỳ hạn.
    - Số tiền thu được sau $n$ kỳ hạn là tổng cấp số nhân:
      $ T = M / r ( (1+r)^n - 1 ) (1+r) $
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Sự lạm phát và Giá trị thực của tiền])[
    - Nếu tỷ lệ lạm phát trung bình là $i$ mỗi năm, sức mua của dòng tiền $A$ sau $n$ năm chỉ còn tương đương với giá trị hiện tại là:
      $ T_(t h u c) = A / (1 + i)^n $
  ]
]

#muc([2. Bài toán Tăng trưởng và Suy giảm (Sinh học & Vật lý)])

#block(breakable: false)[
  #phuongphap(title: [⚙ Tăng trưởng vi khuẩn / Dân số])[
    - Số lượng quần thể tại thời điểm $t$ là:
      $ N(t) = N_0 dot e^(r t) $
      Trong đó $N_0$ là số lượng ban đầu, $r$ là tỷ lệ tăng trưởng.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Chu kỳ bán rã (Phóng xạ đồng vị Carbon-14)])[
    - Khối lượng chất phóng xạ còn lại sau thời gian $t$ là:
      $ m(t) = m_0 dot (1/2)^(t/T) = m_0 dot e^(-lambda t) $
      Trong đó $T$ là chu kỳ bán rã, $lambda = (ln 2) / T$ là hằng số phân rã.
    - *Ứng dụng khảo cổ:* Đo lượng $C-14$ còn lại trong hóa thạch xương để suy ra thời gian sinh vật tử vong.
  ]
]

#muc([3. Thang đo Logarit trong Địa lý và Âm thanh])

#block(breakable: false)[
  #phuongphap(title: [⚙ Thang độ Richter (Động đất)])[
    - Độ lớn (độ Richter) của động đất: $M = log (I / I_0)$, trong đó $I$ là biên độ địa chấn tối đa.
    - Nếu động đất tăng 1 độ Richter, biên độ dao động sẽ tăng gấp $10$ lần, và năng lượng tỏa ra tăng xấp xỉ $31.6$ lần ($10^(1.5)$).
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Mức cường độ âm thanh (Decibel - dB)])[
    - Mức cường độ âm thanh: $L = 10 log (I / I_0) (d B)$, trong đó $I_0 = 10^(-12) W \/ m^2$ là ngưỡng nghe.
    - Nhờ dùng thang logarit, tai người cảm nhận âm lượng $100 d B$ (nhạc rock) lớn hơn $50 d B$ (nói chuyện) theo cấp số cộng chứ không phải là tiếng ồn mạnh hơn theo cấp số nhân.
  ]
]

#pagebreak()

#q-label([B. BÀI TẬP SIÊU ỨNG DỤNG], c-book)

#include "c2-b6-de1.typ"
