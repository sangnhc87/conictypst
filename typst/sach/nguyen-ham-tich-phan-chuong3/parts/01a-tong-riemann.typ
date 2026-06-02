#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

== 10. Tổng Riemann: Khi Phép Cộng Học Cách Đi Tới Liên Tục

#why-box[
  Nếu muốn thực sự hiểu tích phân, ta phải đi qua một chiếc cầu mà nhiều sách phổ thông chỉ băng qua rất nhanh: *tổng Riemann*.

  Đây là nơi một ý tưởng tưởng như sơ cấp trở nên cực sâu. Ta không biết cộng trực tiếp vô số giá trị liên tục. Nhưng ta biết cộng hữu hạn. Vậy ta chia nhỏ thế giới liên tục thành nhiều mảnh hữu hạn, cộng gần đúng, rồi đẩy phép gần đúng ấy tới giới hạn.
]

#history-box("Riemann và việc đặt nền cho tích phân hiện đại")[
  Bernhard Riemann không phải người đầu tiên nghĩ về diện tích hay tích lũy. Nhưng ông cho một khuôn ngôn ngữ cực kỳ quan trọng: định nghĩa tích phân bằng giới hạn của các tổng hữu hạn.

  Ở đây điều đáng học không chỉ là tên Riemann. Điều đáng học là thái độ: không cần chạm trực tiếp vào cái vô hạn. Hãy tổ chức cái hữu hạn đủ tốt để vô hạn hiện ra như giới hạn của nó.
]

#vd-box("7", "Tại sao tổng các hình chữ nhật lại có thể sinh ra diện tích đường cong?")[
  #grid(
    columns: (1.3fr, 1.1fr),
    column-gutter: 15pt,
    align: horizon,
    [
      Xét một đồ thị $y = f(x)$ trên đoạn $[a,b]$. Chia đoạn ấy thành $n$ đoạn con bằng nhau có độ rộng $Delta x = (b-a)/n$. Trên mỗi đoạn con, ta dựng một hình chữ nhật có chiều cao bằng giá trị của hàm số tại đầu mút phải $f(x_i)$.

      Diện tích của hình chữ nhật thứ $i$ là $f(x_i) Delta x$. Tổng diện tích của cả $n$ cột hình chữ nhật:
      $ S_n = sum_(i=1)^n f(x_i) Delta x $

      Đây là một tổng hữu hạn đại diện cho xấp xỉ thô. Khi các đoạn con ngày càng ngắn ($n arrow.r +oo$ hay $Delta x arrow.r 0$), các cột chữ nhật ôm khít lấy đường cong và tổng $S_n$ hội tụ về giới hạn duy nhất, đó chính là tích phân xác định:
      $ I = integral_a^b f(x) dif x $
    ],
    [
      #align(center)[
        #canvas(length: 0.85cm, {
          import draw: *
          // Trục tọa độ
          line((-0.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.5pt + gray)
          line((0, -0.5), (0, 4.2), mark: (end: ">"), stroke: 0.5pt + gray)
          content((5.5, -0.3), $x$, size: 9pt)
          content((-0.3, 4.2), $y$, size: 9pt)
          
          // Hàm f(x) = -0.15 * (x - 2.5)^2 + 3.5
          let f(x) = -0.15 * (x - 2.5) * (x - 2.5) + 3.5
          
          let pts = ()
          for i in range(0, 101) {
            let x = 0.5 + i * 0.04
            pts.push((x, f(x)))
          }
          
          // Vẽ các hình chữ nhật trước (để nằm dưới đường cong)
          let a = 1.0
          let b = 5.0
          let n = 4
          let dx = (b - a) / n
          for i in range(0, n) {
            let x_left = a + i * dx
            let x_right = a + (i + 1) * dx
            let h = f(x_right)
            rect((x_left, 0), (x_right, h), fill: rgb("#0F766E1a"), stroke: 0.8pt + rgb("#0F766E"))
            circle((x_right, h), radius: 1.8pt, fill: rgb("#C9A227"))
          }
          
          // Vẽ đường cong f(x)
          line(..pts, stroke: 1.5pt + rgb("#1D4E89"))
          content((4.8, f(4.8) + 0.4), $y = f(x)$, fill: rgb("#1D4E89"), size: 9pt)
          
          // Cận a và b
          circle((a, 0), radius: 1.5pt, fill: black)
          content((a, -0.35), $a = x_0$, size: 8pt)
          
          circle((a + dx, 0), radius: 1.5pt, fill: black)
          content((a + dx, -0.35), $x_1$, size: 8pt)
          
          circle((a + 2*dx, 0), radius: 1.5pt, fill: black)
          content((a + 2*dx, -0.35), $x_2$, size: 8pt)
          
          circle((a + 3*dx, 0), radius: 1.5pt, fill: black)
          content((a + 3*dx, -0.35), $x_3$, size: 8pt)
          
          circle((b, 0), radius: 1.5pt, fill: black)
          content((b, -0.35), $b = x_4$, size: 8pt)
          
          // Chỉ ra độ rộng dx
          line((a + 1*dx, 0.4), (a + 2*dx, 0.4), mark: (start: "<", end: ">"), stroke: 0.6pt + rgb("#C9A227"))
          content((a + 1.5*dx, 0.75), $Delta x$, fill: rgb("#C9A227"), size: 8pt)
        })
      ]
    ]
  )
]

#essay-box("Một thay đổi lớn về nhận thức")[
  Rất nhiều học sinh học tích phân như thể họ đang gặp một lệnh máy tính mới. Nhưng khi thấy tổng Riemann, họ bắt đầu hiểu rằng tích phân là một triết học của xấp xỉ được đưa tới giới hạn.

  Từ đó, giải tích trở nên bớt giống ma thuật và giống một kiến trúc có móng hơn.
]

#bridge-box("Từ tổng Riemann tới mô hình hóa số")[
  Trong khoa học tính toán, người ta thường không có nguyên hàm đẹp để tính trực tiếp. Khi đó, tổng Riemann và các hậu duệ của nó như hình thang, Simpson, quadrature số lại xuất hiện như phiên bản thực dụng của cùng một tinh thần.
]
