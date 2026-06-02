#import "_config.typ": *

// Các hàm và cấu hình cục bộ được import trực tiếp từ _config.typ

#lesson([Giá trị lớn nhất và giá trị nhỏ nhất của hàm số], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Định nghĩa])

#block(breakable: false)[
  #dn(title: [Định nghĩa])[
    Cho hàm số $y = f(x)$ xác định trên tập hợp $D$ ($D subset RR$).

    - Số $M$ được gọi là *giá trị lớn nhất* của hàm số $y = f(x)$ trên $D$ nếu:
      - Với mọi $x in D$, ta có $f(x) <= M$.
      - Tồn tại ít nhất một điểm $x_0 in D$ sao cho $f(x_0) = M$.

      Kí hiệu: $M = max_(x in D) f(x)$ hoặc $M = max_D f(x)$.

    - Số $m$ được gọi là *giá trị nhỏ nhất* của hàm số $y = f(x)$ trên $D$ nếu:
      - Với mọi $x in D$, ta có $f(x) >= m$.
      - Tồn tại ít nhất một điểm $x_0 in D$ sao cho $f(x_0) = m$.

      Kí hiệu: $m = min_(x in D) f(x)$ hoặc $m = min_D f(x)$.
  ]
]

#block(breakable: false)[
  #luuy(title: [▲ Chú ý])[
    - Để kết luận số $M$ (hoặc $m$) là giá trị lớn nhất (hoặc giá trị nhỏ nhất) của hàm số $f(x)$ trên tập $D$, bắt buộc phải chỉ ra tồn tại điểm $x_0 in D$ sao cho $f(x_0) = M$ (hoặc $f(x_0) = m$).
    - Nếu tập $D$ không nói rõ thì ta hiểu là tìm trên toàn bộ tập xác định của hàm số.
  ]
]

#pagebreak()

#muc([Định lý về sự tồn tại])

#block(breakable: false)[
  #dl(title: [Định lý])[
    Nếu hàm số $y = f(x)$ liên tục trên đoạn $[a; b]$ thì nó luôn luôn có giá trị lớn nhất và giá trị nhỏ nhất trên đoạn đó.
  ]
]

#v(1em)
#block(breakable: false)[
  #phuongphap(title: [⚙ Quy trình tìm giá trị lớn nhất và nhỏ nhất])[
    *Phương pháp 1: Tìm trên khoảng, nửa khoảng hoặc khoảng vô hạn (Dùng BBT)*
    1. Tìm tập xác định của hàm số.
    2. Tính đạo hàm $f'(x)$. Tìm các điểm $x_i$ tại đó $f'(x) = 0$ hoặc đạo hàm không xác định.
    3. Lập bảng biến thiên của hàm số trên tập $D$.
    4. Căn cứ vào bảng biến thiên để đưa ra kết luận về giá trị lớn nhất và giá trị nhỏ nhất.

    *Phương pháp 2: Tìm trên đoạn $[a; b]$ (Không cần lập BBT)*
    1. Tìm các điểm $x_1, x_2, dots, x_n$ thuộc khoảng $(a; b)$ tại đó $f'(x_i) = 0$ hoặc đạo hàm không xác định.
    2. Tính các giá trị $f(a)$, $f(b)$ và $f(x_i)$ ($i = 1, dots, n$).
    3. So sánh các giá trị đã tính:
      - Số lớn nhất trong các giá trị đó là giá trị lớn nhất của hàm số trên $[a; b]$:
        $ max_([a; b]) f(x) = max { f(a); f(b); f(x_1); dots; f(x_n) } $
      - Số nhỏ nhất trong các giá trị đó là giá trị nhỏ nhất của hàm số trên $[a; b]$:
        $ min_([a; b]) f(x) = min { f(a); f(b); f(x_1); dots; f(x_n) } $
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ GTLN, GTNN trong bài toán thực tế])[
    Với bài toán thực tế, trước khi đạo hàm cần dựng đúng *hàm mục tiêu*. Những tình huống thường gặp nhất là:

    #table(
      columns: (1.4fr, 2.6fr),
      stroke: 0.4pt + gray,
      inset: 6pt,
      [*Bối cảnh*], [*Hàm mục tiêu cần tối ưu*],
      [Giá bán - giá thuê], [Doanh thu $R(x)$ hoặc lợi nhuận $L(x) = R(x) - C(x)$],
      [Sản xuất - chi phí], [Chi phí trung bình $A(x) = frac(C(x), x)$ hoặc sản lượng ròng],
      [Vận tốc - di chuyển], [Tổng chi phí $C(v)$ hoặc tổng thời gian $T(x)$],
      [Nông nghiệp - sinh học], [Năng suất ròng, quy mô quần thể, nồng độ, lượng thuốc, ...],
    )

    *Mẹo chọn ẩn:*
    - Nếu đề có cụm *"mỗi lần tăng ..."*, nên đặt $x$ là số lần tăng.
    - Nếu bài toán có tốc độ, quãng đường, chi phí theo giờ thì thường đặt trực tiếp $v$ là vận tốc.
    - Nếu bài toán có ràng buộc đoạn $[a; b]$, sau khi giải $f'(x) = 0$ vẫn phải *so sánh cả ở biên*.
  ]
]

#block(breakable: false)[
  #ghinho(title: [★ Ghi nhớ cho bài toán mô hình hóa])[
    Không nên lao ngay vào đạo hàm. Trước hết phải trả lời được ba câu hỏi: *biến điều khiển là gì*, *hàm mục tiêu là gì*, và *miền thực tế là gì*. Ba câu này đúng thì phần GTLN - GTNN phía sau mới đúng bản chất bài toán.
  ]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c1-b3-de1.typ"
#include "c1-b3-de2.typ"
#include "c1-b3-de3.typ"
#include "c1-b3-de4.typ"
#include "c1-b3-de5.typ"
