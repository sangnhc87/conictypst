#import "_config.typ": *

// Các hàm và cấu hình cục bộ được import trực tiếp từ _config.typ

#lesson([Cực trị của hàm số], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Khái niệm cực đại và cực tiểu])

#block(breakable: false)[
  #dn(title: [Định nghĩa])[
    Giả sử hàm số $y = f(x)$ xác định trên tập hợp $D$ ($D subset RR$) và $x_0 in D$.

    - Nếu tồn tại một khoảng $(a; b)$ chứa $x_0$ sao cho $(a; b) subset D$ và với mọi $x in (a; b)$ khác $x_0$, ta có:
      $ f(x) < f(x_0) $
      thì $x_0$ được gọi là một *điểm cực đại* của hàm số $f(x)$. Giá trị $f(x_0)$ được gọi là *giá trị cực đại* (hoặc *cực đại*) của hàm số, kí hiệu là $y_"CĐ"$ hoặc $f_"CĐ"$.

    - Nếu tồn tại một khoảng $(a; b)$ chứa $x_0$ sao cho $(a; b) subset D$ và với mọi $x in (a; b)$ khác $x_0$, ta có:
      $ f(x) > f(x_0) $
      thì $x_0$ được gọi là một *điểm cực tiểu* của hàm số $f(x)$. Giá trị $f(x_0)$ được gọi là *giá trị cực tiểu* (hoặc *cực tiểu*) của hàm số, kí hiệu là $y_"CT"$ hoặc $f_"CT"$.
  ]
]

#block(breakable: false)[
  #luuy(title: [▲ Chú ý])[
    - Điểm cực đại $x_0$ và điểm cực tiểu $x_0$ gọi chung là *điểm cực trị* của hàm số.
    - Giá trị cực đại $f(x_0)$ và giá trị cực tiểu $f(x_0)$ gọi chung là *cực trị* của hàm số.
    - Điểm $M(x_0; f(x_0))$ trên mặt phẳng tọa độ $O x y$ được gọi là *điểm cực trị của đồ thị hàm số*.
    - Cực trị là khái niệm mang tính chất địa phương (chỉ xét trong một khoảng lân cận chứa $x_0$). Một hàm số có thể có nhiều điểm cực trị và giá trị cực tiểu có thể lớn hơn giá trị cực đại.
  ]
]

#pagebreak()

#muc([Điều kiện đủ để hàm số có cực trị])

#block(breakable: false)[
  #dl(title: [Định lý 1 (Quy tắc 1)])[
    Giả sử hàm số $y = f(x)$ liên tục trên khoảng $(a; b)$ chứa điểm $x_0$ và có đạo hàm trên các khoảng $(a; x_0)$ và $(x_0; b)$.
    - Nếu $f'(x) > 0$ trên khoảng $(a; x_0)$ và $f'(x) < 0$ trên khoảng $(x_0; b)$ (đạo hàm đổi dấu từ dương sang âm khi đi qua $x_0$) thì $x_0$ là một điểm cực đại của hàm số.
    - Nếu $f'(x) < 0$ trên khoảng $(a; x_0)$ and $f'(x) > 0$ trên khoảng $(x_0; b)$ (đạo hàm đổi dấu từ âm sang dương khi đi qua $x_0$) thì $x_0$ là một điểm cực tiểu của hàm số.
  ]
]

#block(breakable: false)[
  #dl(title: [Định lý 2 (Quy tắc 2)])[
    Giả sử hàm số $y = f(x)$ có đạo hàm cấp một trên khoảng $(a; b)$ chứa điểm $x_0$ sao cho $f'(x_0) = 0$ và có đạo hàm cấp hai $f''(x_0)$ khác $0$.
    - Nếu $f''(x_0) < 0$ thì hàm số đạt cực đại tại điểm $x_0$.
    - Nếu $f''(x_0) > 0$ thì hàm số đạt cực tiểu tại điểm $x_0$.
  ]
]

#v(1em)
#block(breakable: false)[
  #phuongphap(title: [⚙ Quy trình tìm cực trị của hàm số])[
    *Quy tắc 1 (Dựa vào bảng biến thiên):*
    1. Tìm tập xác định của hàm số.
    2. Tính đạo hàm $f'(x)$. Tìm các điểm tại đó $f'(x) = 0$ hoặc đạo hàm không xác định.
    3. Lập bảng xét dấu đạo hàm hoặc bảng biến thiên.
    4. Căn cứ vào bảng xét dấu đạo hàm để kết luận điểm cực trị.

    *Quy tắc 2 (Dựa vào đạo hàm cấp hai):*
    1. Tìm tập xác định. Tính đạo hàm $f'(x)$.
    2. Giải phương trình $f'(x) = 0$, tìm các nghiệm $x_i$ ($i = 1, 2, dots$).
    3. Tính đạo hàm cấp hai $f''(x)$ và tính các giá trị $f''(x_i)$.
    4. Dựa vào dấu của $f''(x_i)$ để kết luận điểm cực đại, cực tiểu.
  ]
]

#pagebreak()

#muc([Cực trị trong bối cảnh thực tế])

#block(breakable: false)[
  #phuongphap(title: [Đọc đúng ý nghĩa của cực trị địa phương])[
    Trong các bài toán thực tế, *điểm cực đại* thường là thời điểm đại lượng đang tăng rồi chuyển sang giảm; còn *điểm cực tiểu* là thời điểm đại lượng đang giảm rồi chuyển sang tăng.

    - Nếu $f'(x)$ đổi dấu từ dương sang âm khi qua $x_0$ thì tại $x_0$ ta có một *đỉnh cục bộ*: ví dụ doanh thu đạt đỉnh ngắn hạn, nồng độ thuốc đạt mức cao nhất trong một giai đoạn, lưu lượng truy cập tạm thời chạm đỉnh.
    - Nếu $f'(x)$ đổi dấu từ âm sang dương khi qua $x_0$ thì tại $x_0$ ta có một *đáy cục bộ*: ví dụ hao phí giảm đến mức thấp nhất rồi tăng trở lại, rủi ro chạm đáy rồi đi lên, hoặc lượng hàng tồn bắt đầu phục hồi.
    - Cần phân biệt rõ: *cực trị địa phương* chỉ đúng trong lân cận của điểm đang xét, nên chưa chắc là giá trị lớn nhất hoặc nhỏ nhất trên toàn bộ giai đoạn khảo sát.
  ]
]

#block(breakable: false)[
  #ghinho(title: [★ Ba bước diễn giải cực trị trong bài toán thực tế])[
    1. Xác định biến và miền ý nghĩa thực tế của biến.
    2. Tìm điểm mà đạo hàm bằng $0$ hoặc không xác định, rồi xét sự đổi dấu của đạo hàm.
    3. Kết luận bằng ngôn ngữ thực tế: nêu *thời điểm/mức biến*, *loại cực trị*, và *ý nghĩa của sự chuyển xu hướng*.
  ]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

// #include "c1-b2-de1.typ"
// #include "c1-b2-de2.typ"
// #include "c1-b2-de3.typ"
#include "c1-b2-de4.typ"
