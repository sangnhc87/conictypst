#import "_config.typ": *

// Các hàm và cấu hình cục bộ được import trực tiếp từ _config.typ

#lesson([Tính đơn điệu của hàm số], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Tính đồng biến, nghịch biến của hàm số])

#block(breakable: false)[
  #dn(title: [Định nghĩa])[
    Kí hiệu $K$ là khoảng; đoạn; nửa khoảng. Giả sử hàm số $y = f(x)$ xác định trên $K$.

    Hàm số $y = f(x)$ được gọi là:
    - *Đồng biến* trên $K$ nếu với mọi $x_1, x_2 in K$ mà $x_1 < x_2$ thì $f(x_1) < f(x_2)$.
    - *Nghịch biến* trên $K$ nếu với mọi $x_1, x_2 in K$ mà $x_1 < x_2$ thì $f(x_1) > f(x_2)$.
  ]
]

#block(breakable: false)[
  #luuy(title: [▲ Chú ý])[
    - Hàm số $y = f(x)$ đồng biến trên $K$ thì đồ thị _đi lên_ từ trái sang phải (Hình 1a).
    - Hàm số $y = f(x)$ nghịch biến trên $K$ thì đồ thị _đi xuống_ từ trái sang phải (Hình 1b).

    #v(0.5em)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 20pt,
      align: center,
      [
        #canvas(length: 0.65cm, {
          import draw: *
          // Trục lưới nền nhạt
          for x in range(1, 6) {
            line((x, -0.2), (x, 4.2), stroke: 0.25pt + gray.lighten(70%))
          }
          for y in range(1, 5) {
            line((-0.2, y), (5.2, y), stroke: 0.25pt + gray.lighten(70%))
          }

          // Trục tọa độ
          line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt + black)
          line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt + black)
          content((5.5, -0.35), [$x$])
          content((0.35, 4.5), [$y$])
          content((-0.25, -0.25), [$O$])

          // Đồ thị hàm số đồng biến (đường cong mịn bậc hai)
          let pts = ()
          let n = 40
          let xmin = 1.2
          let xmax = 4.5
          for i in range(n + 1) {
            let x = xmin + i * (xmax - xmin) / n
            let y = 0.8 + (x - xmin) * 0.4 + 0.16 * calc.pow(x - xmin, 2)
            pts.push((x, y))
          }
          line(..pts, stroke: 1.5pt + c-book)

          // Đường dóng từ hai đầu mút
          line((xmin, 0), (xmin, 0.8), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
          line((xmax, 0), (xmax, 0.8 + (xmax - xmin) * 0.4 + 0.16 * calc.pow(xmax - xmin, 2)), stroke: (
            paint: gray,
            thickness: 0.5pt,
            dash: "dashed",
          ))

          // Điểm biểu diễn hai đầu mút
          circle((xmin, 0.8), radius: 1.8pt, fill: c-book)
          circle((xmax, 0.8 + (xmax - xmin) * 0.4 + 0.16 * calc.pow(xmax - xmin, 2)), radius: 1.8pt, fill: c-book)

          content((2.8, 2.5), [$y = f(x)$])

          // Biểu diễn tập K
          line((xmin, -0.4), (xmax, -0.4), mark: (start: ">", end: ">", fill: black), stroke: 0.6pt + black)
          content(((xmin + xmax) / 2, -0.75), [$K$])
        })
        #v(0.3em)
        *Hình 1a*
      ],
      [
        #canvas(length: 0.65cm, {
          import draw: *
          // Trục lưới nền nhạt
          for x in range(1, 6) {
            line((x, -0.2), (x, 4.2), stroke: 0.25pt + gray.lighten(70%))
          }
          for y in range(1, 5) {
            line((-0.2, y), (5.2, y), stroke: 0.25pt + gray.lighten(70%))
          }

          // Trục tọa độ
          line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt + black)
          line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt + black)
          content((5.5, -0.35), [$x$])
          content((0.35, 4.5), [$y$])
          content((-0.25, -0.25), [$O$])

          // Đồ thị hàm số nghịch biến (đường cong mịn nghịch biến)
          let pts = ()
          let n = 40
          let xmin = 1.2
          let xmax = 4.5
          for i in range(n + 1) {
            let x = xmin + i * (xmax - xmin) / n
            let y = 3.86 - (x - xmin) * 0.4 - 0.16 * calc.pow(x - xmin, 2)
            pts.push((x, y))
          }
          line(..pts, stroke: 1.5pt + rgb("#cc2200"))

          // Đường dóng từ hai đầu mút
          line((xmin, 0), (xmin, 3.86), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
          line((xmax, 0), (xmax, 3.86 - (xmax - xmin) * 0.4 - 0.16 * calc.pow(xmax - xmin, 2)), stroke: (
            paint: gray,
            thickness: 0.5pt,
            dash: "dashed",
          ))

          // Điểm biểu diễn hai đầu mút
          circle((xmin, 3.86), radius: 1.8pt, fill: rgb("#cc2200"))
          circle(
            (xmax, 3.86 - (xmax - xmin) * 0.4 - 0.16 * calc.pow(xmax - xmin, 2)),
            radius: 1.8pt,
            fill: rgb("#cc2200"),
          )

          content((2.8, 3.1), [$y = f(x)$])

          // Biểu diễn tập K
          line((xmin, -0.4), (xmax, -0.4), mark: (start: ">", end: ">", fill: black), stroke: 0.6pt + black)
          content(((xmin + xmax) / 2, -0.75), [$K$])
        })
        #v(0.3em)
        *Hình 1b*
      ],
    )
  ]
]

#pagebreak()

#muc([Tính đơn điệu của hàm số])

#block(breakable: false)[
  #dl(title: [Định lý])[
    Cho hàm số $y = f(x)$ có đạo hàm trên $K$.
    - Nếu $f'(x) > 0$ với mọi $x in K$ thì hàm số $y = f(x)$ đồng biến trên $K$.
    - Nếu $f'(x) < 0$ với mọi $x in K$ thì hàm số $y = f(x)$ nghịch biến trên $K$.
  ]
]

#block(breakable: false)[
  #luuy(title: [▲ Chú ý])[
    - Định lý vẫn đúng trong trường hợp $f'(x) = 0$ tại một số hữu hạn điểm trong $K$.
    - Nếu $f'(x) = 0$ với mọi $x in K$ thì hàm số $f(x)$ không đổi trên khoảng $K$.
  ]
]

#pagebreak()

#q-label([Tính đơn điệu trong bối cảnh thực tế], c-book)

#block(breakable: false)[
  #phuongphap(title: [Đọc xu hướng tăng - giảm của đại lượng thực])[
    Trong bài toán thực tế, biến số thường là *thời gian, giá bán, sản lượng, tốc độ, mức đầu tư*. Khi đó, dấu của đạo hàm cho ta biết xu hướng biến thiên của đại lượng đang xét.

    - Nếu $f'(x) > 0$ trên một khoảng thực tế thì đại lượng *tăng* trên khoảng đó.
    - Nếu $f'(x) < 0$ trên một khoảng thực tế thì đại lượng *giảm* trên khoảng đó.
    - Không được kết luận trên toàn $RR$ nếu mô hình chỉ có nghĩa trên miền như $t >= 0$, $x > 0$, $0 <= v <= 120$.
    - Khi đạo hàm đổi dấu, phải diễn giải bằng ngôn ngữ thực tế: từ mốc nào trở đi đại lượng bắt đầu giảm, hoặc đến ngưỡng nào thì đại lượng còn tăng.
  ]
]

#block(breakable: false)[
  #ghinho(title: [★ Ba câu hỏi phải trả lời trong bài toán đơn điệu])[
    1. Biến số biểu diễn đại lượng gì và miền thực tế của nó là gì?
    2. Đại lượng tăng trên khoảng nào, giảm trên khoảng nào?
    3. Mốc nào đánh dấu sự đổi xu hướng và ý nghĩa thực tế của mốc đó là gì?
  ]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c1-b1-de1.typ"
#include "c1-b1-de2.typ"
#include "c1-b1-de3.typ"
#include "c1-b1-de4.typ"
