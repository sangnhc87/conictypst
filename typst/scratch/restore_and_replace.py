import re

target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

# We will read the current content of the file
with open(target_file, 'r') as f:
    content = f.read()

idx_start = content.find('= Lý Thuyết Nền Tảng — Xây Dựng Từ Đầu')
idx_end = content.find('== 0.4 — Bảng Hàm Sinh Thường Gặp (OGF)')

if idx_start == -1 or idx_end == -1:
    print("Could not find delimiters. Let's list occurrences.")
    print("idx_start:", idx_start)
    print("idx_end:", idx_end)
    idx_end = content.find('Bảng Hàm Sinh Thường Gặp (OGF)')
    if idx_end != -1:
        idx_end = content.rfind('==', 0, idx_end)
        print("Found Bảng Hàm Sinh at idx_end:", idx_end)

if idx_start != -1 and idx_end != -1:
    new_block = """= Lý Thuyết Nền Tảng — Xây Dựng Từ Đầu

== 0.1 — Tiếp Cận Từ Các Bài Toán Đếm Phổ Thông (Bắt Đầu Từ Số Không)

Để hiểu được bản chất của Hàm sinh mà không bị ngợp bởi các công thức toán học trừu tượng, chúng ta hãy bắt đầu từ hai bài toán đếm vô cùng quen thuộc ở chương trình phổ thông.

#eg-box(title: "🎯 Ví dụ 1: Bài toán chọn táo và cam (Tổng số quả)")[
  *Đề bài:* Có 3 quả táo giống nhau và 2 quả cam giống nhau. Hỏi có bao nhiêu cách chọn ra một đĩa quả gồm đúng 3 quả (không phân biệt thứ tự)?
  
  *Cách giải phổ thông (Liệt kê):*
  Ta gọi số táo chọn ra là $x$ và số cam chọn ra là $y$ ($x, y >= 0$). Ta cần tìm số nghiệm nguyên của phương trình $x + y = 3$ với điều kiện $x <= 3$ (chỉ có tối đa 3 quả táo) và $y <= 2$ (chỉ có tối đa 2 quả cam).
  Các bộ nghiệm $(x, y)$ hợp lệ là:
  - $(3, 0)$: Chọn 3 táo, 0 cam.
  - $(2, 1)$: Chọn 2 táo, 1 cam.
  - $(1, 2)$: Chọn 1 táo, 2 cam.
  
  (Không thể chọn $(0, 3)$ vì chỉ có tối đa 2 quả cam). Tổng cộng có *3 cách chọn*.
  
  *Cách giải bằng Đại số (Ý tưởng Hàm sinh):*
  Ta gán cho việc chọn mỗi loại quả một đa thức đại diện, trong đó *số mũ* của biến $x$ thể hiện số lượng quả được chọn:
  - Đối với Táo (chỉ có thể chọn từ 0 đến 3 quả): ta gán đa thức:
    $ A(x) = x^0 + x^1 + x^2 + x^3 = 1 + x^1 + x^2 + x^3 $
  - Đối với Cam (chỉ có thể chọn từ 0 đến 2 quả): ta gán đa thức:
    $ B(x) = x^0 + x^1 + x^2 = 1 + x^1 + x^2 $
  
  Bây giờ, hãy thử làm một phép toán đại số đơn giản: *Nhân hai đa thức này lại với nhau*:
  $
    P(x) = A(x) dot.c B(x) = (1 + x^1 + x^2 + x^3) (1 + x^1 + x^2)
  $
  Khai triển phép nhân đa thức theo cách thủ công:
  $
    P(x) = 1(1 + x + x^2) + x(1 + x + x^2) + x^2(1 + x + x^2) + x^3(1 + x + x^2) \\
    P(x) = 1 + 2x^1 + 3x^2 + 3x^3 + 2x^4 + x^5
  $
  
  Hãy quan sát kỹ kết quả khai triển của $P(x)$:
  - Số mũ $k$ của số hạng $x^k$ biểu thị *tổng số quả* được chọn.
  - Hệ số đứng trước $x^k$ chính là *số cách* chọn ra đúng $k$ quả!
  - Với yêu cầu chọn đúng 3 quả, ta chỉ cần tìm hệ số của $x^3$ trong tích $P(x)$, hệ số này bằng *3* (tương ứng với số hạng $3x^3$).
  
  *Vì sao lại kỳ diệu như vậy?* Vì khi nhân hai đa thức, số mũ của các số hạng được cộng lại: $x^a dot.c x^b = x^(a+b)$. Việc này đã tự động tìm tất cả các cặp số mũ $(a, b)$ sao cho tổng $a+b=3$ và cộng dồn các hệ số lại cho chúng ta!
]

#v(0.5em)
#align(center)[
  #block(fill: rgb("F5F5F5"), stroke: 0.8pt + luma(180), radius: 6pt, inset: 10pt, width: 95%)[
    #text(fill: col-purple, weight: "bold", size: 9.5pt)[💡 Trực Quan Phép Nhân Tạo Hệ Số x³ (Táo & Cam)]
    #v(0.5em)
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      let apple-color = rgb("C62828")
      let orange-color = rgb("E65100")
      
      // Cột Táo
      content((-4, 2), text(size: 9.5pt, fill: apple-color, weight: "bold")[Tập chọn Táo: $A(x)$])
      let apples = ("1", "x^1", "x^2", "x^3")
      for (i, val) in apples.enumerate() {
        content((-4.5 + i * 1.8, 1.2), text(size: 10pt)[$#val$], name: "a" + str(i))
      }
      
      // Cột Cam
      content((-4, -2), text(size: 9.5pt, fill: orange-color, weight: "bold")[Tập chọn Cam: $B(x)$])
      let oranges = ("1", "x^1", "x^2")
      for (i, val) in oranges.enumerate() {
        content((-4.5 + i * 2.7, -1.2), text(size: 10pt)[$#val$], name: "b" + str(i))
      }
      
      // Các đường nối tạo x^3:
      // a3 * b0
      // a2 * b1
      // a1 * b2
      line("a3", "b0", stroke: (paint: col-blue, thickness: 1.2pt, dash: "dashed"))
      line("a2", "b1", stroke: (paint: col-green, thickness: 1.2pt, dash: "dashed"))
      line("a1", "b2", stroke: (paint: col-amber, thickness: 1.2pt, dash: "dashed"))
      
      // Hộp kết quả hội tụ
      rect((2.5, -0.6), (7.5, 0.6), fill: rgb("EDE7F6"), stroke: 1pt + col-purple, radius: 4pt)
      content((5.0, 0.2), text(size: 9pt, fill: col-purple, weight: "bold")[Hội tụ hệ số của $x^3$])
      content((5.0, -0.25), text(size: 9.5pt)[$(1 + 1 + 1)x^3 = 3x^3$])
      
      // Mũi tên từ các đường nối chỉ vào hộp
      line((0.8, 0), (2.3, 0), mark: (end: "stealth"), stroke: 1.2pt + col-purple)
    })
  ]
]

#eg-box(title: "🎯 Ví dụ 2: Bài toán gieo xúc xắc (Tổng số chấm)")[
  *Đề bài:* Gieo hai con xúc xắc 6 mặt cân đối và đồng chất. Có bao nhiêu cách để tổng số chấm trên hai mặt xuất hiện bằng 7?
  
  *Cách giải phổ thông:*
  Ta liệt kê các cặp số chấm $(i, j)$ của hai con xúc xắc sao cho $i + j = 7$ với $1 <= i, j <= 6$.
  Các cặp thỏa mãn là: $(1,6), (2,5), (3,4), (4,3), (5,2), (6,1)$.
  Vậy có đúng *6 cách*.
  
  *Cách giải bằng Đại số:*
  Mỗi con xúc xắc có 6 mặt từ 1 đến 6 chấm, ta gán cho mỗi con một đa thức hàm sinh biểu diễn các chấm khả dĩ:
  $
    S(x) = x^1 + x^2 + x^3 + x^4 + x^5 + x^6
  $
  Khi gieo hai con xúc xắc độc lập, số cách tạo ra tổng số chấm bằng $n$ chính là hệ số của $x^n$ trong tích hai đa thức của chúng:
  $
    P(x) = S(x) dot.c S(x) = (x^1 + x^2 + x^3 + x^4 + x^5 + x^6)^2
  $
  
  Để tìm hệ số của $x^7$, ta tìm tất cả các cách ghép cặp số hạng $x^i$ từ con thứ nhất và $x^j$ từ con thứ hai sao cho $x^i dot.c x^j = x^(i+j) = x^7$, tức là $i+j=7$.
  Vì mỗi số hạng từ $x^1$ đến $x^6$ đều có hệ số là 1, nên hệ số của $x^7$ trong tích là:
  $
    1 dot.c 1 + 1 dot.c 1 + 1 dot.c 1 + 1 dot.c 1 + 1 dot.c 1 + 1 dot.c 1 = 6
  $
  Kết quả là *6 cách*, hoàn toàn trùng khớp với việc liệt kê bằng tay!
]

#v(0.5em)
#align(center)[
  #block(fill: rgb("F0F4C3"), stroke: 0.8pt + col-green, radius: 6pt, inset: 10pt, width: 95%)[
    #text(fill: col-green, weight: "bold", size: 9.5pt)[🎲 Trực Quan Đại Số Hóa Phép Gieo Xúc Xắc]
    #v(0.5em)
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Xúc xắc A
      rect((-4, 0.5), (-2.5, 2.0), fill: white, stroke: 1.5pt + col-blue, radius: 4pt)
      circle((-3.25, 1.25), radius: 0.15, fill: col-blue) // mặt 1 chấm
      content((-3.25, 0), text(size: 9pt, fill: col-blue, weight: "bold")[Xúc xắc A])
      content((-3.25, -0.6), text(size: 8.5pt)[$x^1 + x^2 + ... + x^6$])
      
      // Dấu nhân
      content((0, 1.25), text(size: 15pt)[$times$])
      
      // Xúc xắc B
      rect((2.5, 0.5), (4, 2.0), fill: white, stroke: 1.5pt + col-red, radius: 4pt)
      circle((2.9, 1.65), radius: 0.1, fill: col-red) 
      circle((3.6, 0.85), radius: 0.1, fill: col-red) // mặt 2 chấm
      content((3.25, 0), text(size: 9pt, fill: col-red, weight: "bold")[Xúc xắc B])
      content((3.25, -0.6), text(size: 8.5pt)[$x^1 + x^2 + ... + x^6$])
      
      // Mũi tên hướng xuống tích
      line((0, -1.0), (0, -1.8), mark: (end: "stealth"), stroke: 1.2pt + col-green)
      
      // Hộp tích đại số
      rect((-5.2, -3.8), (5.2, -2.4), fill: rgb("E8F5E9"), stroke: 1pt + col-green, radius: 5pt)
      content((0, -2.9), text(size: 9.5pt, fill: col-green, weight: "bold")[Hệ số $[x^7]$ trong $(x^1 + x^2 + x^3 + x^4 + x^5 + x^6)^2$])
      content((0, -3.4), text(size: 8.5pt)[Tương ứng các cặp: $(1,6), (2,5), (3,4), (4,3), (5,2), (6,1) arrow.r 6$ cách])
    })
  ]
]

#note-box(title: "💡 Triết lý cốt lõi của Hàm Sinh")[
  Qua hai ví dụ trên, chúng ta rút ra một kết luận vô cùng quan trọng:
  - Để giải bài toán đếm, thay vì đếm thủ công, ta *gán đối tượng cần chọn với một biến hình thức $x$*, số lượng đối tượng được chọn sẽ trở thành *số mũ của $x$*.
  - Việc chọn các đối tượng độc lập và cộng số lượng của chúng lại tương đương với *phép nhân các đa thức* biểu diễn chúng.
  - Phép nhân đa thức (Đại số) sẽ tự động làm thay công việc liệt kê và phân loại (Tổ hợp) cho chúng ta.
]

== 0.2 — Ý Tưởng Ban Đầu: Tại Sao Cần Hàm Sinh?

#rev-box(title: "🤔 Vấn Đề Xuất Phát: Chia Kẹo Có Điều Kiện Phức Tạp")[
  *Bài toán cơ bản:* Chia 10 viên kẹo giống nhau cho 3 học sinh. Số cách chia là số nghiệm nguyên không âm của $x_1 + x_2 + x_3 = 10$. Theo phương pháp vách ngăn (Stars and Bars), ta tìm ngay được kết quả là $C_(10+3-1)^(3-1) = C_12^2 = 66$ cách.

  *Nhưng nếu thêm điều kiện:* 
  - Học sinh 1 chỉ nhận *số lẻ* viên kẹo ($x_1 in \{1, 3, 5, ...\}$).
  - Học sinh 2 chỉ nhận *số chẵn* viên kẹo ($x_2 in \{0, 2, 4, ...\}$).
  - Học sinh 3 chỉ nhận số kẹo là *bội của 3* ($x_3 in \{0, 3, 6, ...\}$).
  
  Khi đó, phương pháp vách ngăn hay bù trừ tổ hợp thuần túy sẽ trở nên vô cùng rắc rối. Hàm sinh chính là công cụ đại số giúp tự động hóa và cơ học hóa toàn bộ quá trình đếm phức tạp này.

  #v(0.5em)
  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *

      let bag-color = rgb("9C27B0")
      let candy-color = rgb("E91E63")

      // Túi 1 - lẻ
      circle((0, 0), radius: 0.8, fill: rgb("EDE7F6"), stroke: 1.5pt + bag-color)
      content((0, 0.1), text(size: 9pt, fill: bag-color)[*Học sinh 1*])
      content((0, -0.35), text(size: 8pt, fill: bag-color)[Lẻ: $x^1, x^3, x^5$])

      // Túi 2 - chẵn
      circle((3.2, 0), radius: 0.8, fill: rgb("E8F5E9"), stroke: 1.5pt + col-green)
      content((3.2, 0.1), text(size: 9pt, fill: col-green)[*Học sinh 2*])
      content((3.2, -0.35), text(size: 8pt, fill: col-green)[Chẵn: $1, x^2, x^4$])

      // Túi 3 - bội 3
      circle((6.4, 0), radius: 0.8, fill: rgb("E3F2FD"), stroke: 1.5pt + col-blue)
      content((6.4, 0.1), text(size: 9pt, fill: col-blue)[*Học sinh 3*])
      content((6.4, -0.35), text(size: 8pt, fill: col-blue)[Bội 3: $1, x^3, x^6$])

      // Mũi tên kẹo
      for i in range(3) {
        circle((-0.3 + i * 0.3, -1.3), radius: 0.12, fill: candy-color, stroke: none)
      }

      // Tổng quan phương trình
      content((3.2, -2.0), text(size: 10pt, weight: "bold", fill: rgb("4A148C"))[
        Phương trình đếm: $x_1 + x_2 + x_3 = 10$
      ])
      content((3.2, -2.6), text(size: 9pt, fill: col-amber)[
        Tương ứng phép nhân các chuỗi: $G(x) = (x^1 + x^3 + x^5 + ...) dot.c (1 + x^2 + x^4 + ...) dot.c (1 + x^3 + x^6 + ...)$
      ])

      content((1.6, -0.1), text(size: 14pt, fill: luma(100))[+])
      content((4.8, -0.1), text(size: 14pt, fill: luma(100))[+])
    })
  ]
]

== 0.3 — Định Nghĩa Hàm Sinh Thường (OGF)

#thm-box(title: "📐 Định Nghĩa — Hàm Sinh Thường (Ordinary Generating Function)")[
  Cho một dãy số vô hạn $(a_n)_(n=0)^(+oo) = (a_0, a_1, a_2, a_3, ...)$. Ta định nghĩa một chuỗi lũy thừa hình thức $G(x)$ như sau:
  $
    G(x) = sum_(n=0)^(+oo) a_n x^n = a_0 + a_1 x + a_2 x^2 + a_3 x^3 + ...
  $
  Chuỗi $G(x)$ được gọi là *hàm sinh thường* (OGF) của dãy số $(a_n)$.
  
  Ký hiệu trích hệ số của $x^n$ trong hàm sinh $G(x)$ là:
  $
    [x^n] G(x) = a_n
  $
  
  *Ý nghĩa quan trọng:* Trong toán học hình thức, $x$ chỉ đóng vai trò là một "vật giữ chỗ" (place-holder) để phân tách các hệ số của dãy. Chúng ta không cần quan tâm đến tính hội tụ của chuỗi lũy thừa này, mà chỉ thực hiện các phép toán đại số trên đó để tìm hệ số mong muốn.
]

#eg-box(title: "🎯 Ví Dụ Trực Quan — Xây dựng hàm sinh cho một lựa chọn đơn lẻ")[
  Nếu một biến số $x_i$ chỉ được phép nhận các giá trị trong tập hợp $S = \{1, 3, 5\}$, ta gán cho biến này một hàm sinh đại diện cho các khả năng chọn:
  $
    G_i(x) = sum_(s in S) x^s = x^1 + x^3 + x^5
  $
  Nếu biến số $x_j$ nhận giá trị nguyên không âm tùy ý ($x_j >= 0$), hàm sinh của nó là chuỗi hình thức vô hạn:
  $
    G_j(x) = 1 + x^1 + x^2 + x^3 + ... = frac(1, 1-x)   ("với " |x| < 1)
  $
]

== 0.4 — Nguyên Lý Convolution (Tích Chập)

#thm-box(title: "⚡ Nguyên Lý Tích — Cơ Sở Của Mọi Bài Toán Đếm")[
  Giả sử ta cần đếm số nghiệm nguyên của phương trình:
  $
    x_1 + x_2 + ... + x_k = n
  $
  trong đó mỗi biến $x_i$ có điều kiện ràng buộc riêng biệt và độc lập, đại diện bởi tập giá trị cho phép $S_i$. Gọi $G_i(x) = sum_(s in S_i) x^s$ là hàm sinh của biến thứ $i$. Khi đó, số nghiệm của phương trình chính là hệ số của $x^n$ trong tích các hàm sinh thành phần:
  $
    G(x) = G_1(x) dot.c G_2(x) dot.c ... dot.c G_k(x)
  $
  Tức là số nghiệm bằng $[x^n] G(x)$.
  
  *Giải thích đại số:* Khi nhân các đa thức hoặc chuỗi lũy thừa:
  $
    (a_0 + a_1 x + a_2 x^2 + ...) (b_0 + b_1 x + b_2 x^2 + ...) = a_0 b_0 + (a_0 b_1 + a_1 b_0) x + (a_0 b_2 + a_1 b_1 + a_2 b_0) x^2 + ...
  $
  Hệ số của $x^n$ trong tích là $sum_(i+j=n) a_i b_j$. Đây chính xác là tổng số cách ghép cặp $i$ và $j$ sao cho tổng của chúng bằng $n$.
]

#align(center)[
  #block(fill: rgb("F5F0FF"), stroke: 1pt + rgb("CE93D8"), radius: 8pt, inset: (x: 14pt, y: 12pt), width: 95%)[
    #text(fill: col-purple, weight: "bold")[💡 Trực Quan Phép Nhân Tích Chập (Convolution) 

      Khi nhân hai chuỗi, các số hạng có số mũ cộng lại tạo ra số mũ $n$ đích. Dưới đây là cách tạo ra số hạng chứa $x^3$:
    ]
    #v(0.6em)
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Hàng chuỗi 1: 1, x, x^2, x^3
      content((-3.5, 1.8), text(size: 9pt, fill: col-blue, weight: "bold")[Chuỗi 1: $1 + x^1 + x^2 + x^3 + ...$])
      let term_a = ("1", "x^1", "x^2", "x^3")
      for (i, val) in term_a.enumerate() {
        content((-4.0 + i * 1.8, 1.0), text(size: 10pt)[$#val$], name: "a" + str(i))
      }
      
      // Hàng chuỗi 2: x, x^3, x^5
      content((-3.5, -1.8), text(size: 9pt, fill: col-green, weight: "bold")[Chuỗi 2: $x^1 + x^3 + x^5 + ...$])
      let term_b = ("x^1", "x^3", "x^5")
      for (i, val) in term_b.enumerate() {
        let label = if i == 0 { "1" } else if i == 1 { "3" } else { "5" }
        content((-4.0 + i * 2.7, -1.0), text(size: 10pt)[$#val$], name: "b" + label)
      }
      
      // Các đường kết nối tạo ra x^3:
      // a0 * b3 = x^3
      // a2 * b1 = x^3
      line("a0", "b3", stroke: (paint: col-purple, thickness: 1.2pt, dash: "dashed"))
      line("a2", "b1", stroke: (paint: col-purple, thickness: 1.2pt, dash: "dashed"))
      
      // Mũi tên và hộp kết quả
      line((1.5, 0), (3.3, 0), mark: (end: "stealth"), stroke: 1.2pt + col-purple)
      
      rect((3.5, -0.6), (8.5, 0.6), fill: rgb("EDE7F6"), stroke: 1pt + col-purple, radius: 4pt)
      content((6.0, 0.25), text(size: 9pt, fill: col-purple, weight: "bold")[Hệ số của $x^3$ ở tích])
      content((6.0, -0.2), text(size: 9.5pt)[$(1 dot.c 1 + 1 dot.c 1)x^3 = 2x^3$])
    })
  ]
]

"""
    content_replaced = content[:idx_start] + new_block + content[idx_end:]
    with open(target_file, 'w') as f:
        f.write(content_replaced)
    print("Success: File restored and replaced successfully!")
else:
    print("Failed to replace block.")
