#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Hệ Phương Trình Bậc Nhất Ba Ẩn],
  subtitle: [TOÁN 10 — CHUYÊN ĐỀ HỌC TẬP: CHUYÊN ĐỀ 1],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#1e40af"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC BÀI HỌC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG BÀI HỌC])

// ════════════════════════════════════════════════
// PHẦN I: KHÁI NIỆM CƠ BẢN
// ════════════════════════════════════════════════
#lt-section-link("sec-khai-niem", "🎯", [I. Phương Trình và Hệ Phương Trình Bậc Nhất Ba Ẩn])

#lt-slide-back(title: "🎯 Định nghĩa: Phương trình bậc nhất ba ẩn")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Phương trình bậc nhất ba ẩn")[
        Phương trình bậc nhất ba ẩn $x, y, z$ có dạng tổng quát:
        $ a x + b y + c z = d $
        Trong đó:
        - $a, b, c, d$ là các số thực cho trước.
        - Điều kiện: $a^2 + b^2 + c^2 != 0$ (nghĩa là $a, b, c$ không đồng thời bằng $0$).
        
        *Nghiệm của phương trình:*
        Mỗi bộ ba số thực $(x_0; y_0; z_0)$ thỏa mãn $a x_0 + b y_0 + c z_0 = d$ được gọi là một *nghiệm* của phương trình.
      ]
    ],
    [
      #block(fill: rgb("#f8fafc"), stroke: 1.5pt + rgb("#cbd5e1"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#0f172a"), size: 10.5pt)[Ý Nghĩa Hình Học]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Trong không gian tọa độ $O x y z$, mỗi phương trình bậc nhất ba ẩn $a x + b y + c z = d$ biểu diễn một *mặt phẳng*.
          
          Vì một mặt phẳng chứa vô số điểm, nên phương trình bậc nhất ba ẩn luôn có *vô số nghiệm*.
        ]
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            line((0, 0), (2, 0), stroke: 1pt, mark: (end: "stealth"))
            line((0, 0), (0, 1.5), stroke: 1pt, mark: (end: "stealth"))
            line((0, 0), (-1.2, -0.8), stroke: 1pt, mark: (end: "stealth"))
            // plane
            line((-0.6, -0.4), (1.3, 0), stroke: 1.2pt + rgb("dc2626"))
            line((1.3, 0), (0, 1.2), stroke: 1.2pt + rgb("dc2626"))
            line((0, 1.2), (-0.6, -0.4), stroke: 1.2pt + rgb("dc2626"))
            content((0.5, 0.5), text(size: 8pt, fill: rgb("dc2626"))[Mặt phẳng $(alpha)$])
          })
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📐 Hệ Phương Trình Bậc Nhất Ba Ẩn")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Định nghĩa Hệ Phương Trình")[
        Hệ phương trình bậc nhất ba ẩn có dạng:
        $ cases(
            a_1 x + b_1 y + c_1 z = d_1 quad &(1),
            a_2 x + b_2 y + c_2 z = d_2 quad &(2),
            a_3 x + b_3 y + c_3 z = d_3 quad &(3)
        ) $
        *Nghiệm của hệ* là bộ ba số $(x_0; y_0; z_0)$ đồng thời là nghiệm của cả ba phương trình (1), (2) và (3).
      ]
    ],
    [
      #block(fill: rgb("#ecfdf5"), stroke: 1.5pt + rgb("#10b981"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#065f46"), size: 10.5pt)[Ý Nghĩa Hình Học Giao Tuyến]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Nghiệm của hệ phương trình chính là *tọa độ giao điểm* của 3 mặt phẳng $(P_1), (P_2), (P_3)$ trong không gian.
          - *Nghiệm duy nhất:* 3 mặt phẳng cắt nhau tại đúng 1 điểm.
          - *Vô nghiệm:* 3 mặt phẳng không có điểm chung (ví dụ: song song, tạo thành lăng trụ,...).
          - *Vô số nghiệm:* 3 mặt phẳng cắt nhau theo 1 đường thẳng chung hoặc trùng nhau.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: PHƯƠNG PHÁP KHỬ GAUSS & HỆ TAM GIÁC
// ════════════════════════════════════════════════
#lt-section-link("sec-gauss", "📈", [II. Phương Pháp Khử Gauss & Giải Hệ Phương Trình])

#lt-slide-back(title: "📈 Dạng Hệ Tam Giác & Phép Thế Lùi")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#3b82f6"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10.5pt)[Hệ Phương Trình Bậc Thang (Tam Giác)]\
        #v(0.2em)
        #text(size: 8.5pt)[
          Hệ phương trình có dạng "bậc thang":
          $ cases(
            a_1 x + b_1 y + c_1 z = d_1,
            b_2 y + c_2 z = d_2,
            c_3 z = d_3
          ) $
          *(với $a_1 != 0, b_2 != 0, c_3 != 0$)*
        ]
        #lt-important(title: "Thuật toán Thế Lùi (Back-Substitution)")[
          - Từ PT (3) giải tìm $z$.
          - Thế $z$ vào PT (2) giải tìm $y$.
          - Thế $y, z$ vào PT (1) giải tìm $x$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10.5pt)[Phương Pháp Khử Gauss]\
        #v(0.2em)
        #text(size: 8.5pt)[
          Mục tiêu: Đưa một hệ phương trình bất kỳ về *dạng bậc thang* bằng các phép biến đổi tương đương:
          - *Nhân/chia* một phương trình với hằng số $k != 0$.
          - *Cộng/trừ* hai phương trình vế theo vế.
          - *Đổi chỗ* hai phương trình cho nhau.
        ]
        #v(0.1em)
        #text(size: 8pt, style: "italic")[
          Trong thực tế học tập, học sinh có thể sử dụng *Máy tính cầm tay* (Casio fx-580VN X, fx-880BTG) để bấm giải nhanh các hệ phương trình này.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM & ỨNG DỤNG
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Trắc nghiệm & Ứng dụng Thực tiễn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHUYÊN ĐỀ 1],
  questions: (
    ( type: "TN", desc: [Định nghĩa phương trình bậc nhất 3 ẩn]),
    ( type: "TN", desc: [Kiểm tra nghiệm của hệ phương trình]),
    ( type: "TN", desc: [Giải hệ phương trình tam giác (thế lùi)]),
    ( type: "TN", desc: [Ý nghĩa hình học của hệ có nghiệm duy nhất]),
    ( type: "TN", desc: [Ứng dụng: Xác định hàm số bậc hai Parabol]),
    ( type: "TN", desc: [Ứng dụng: Bài toán thực tế mua bán vở]),
    ( type: "DS", desc: [Kiểm tra tính đúng/sai nghiệm và tính chất]),
    ( type: "TLN", desc: [Bài toán tính số đo 3 góc của tam giác]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(num: 1, [Trong không gian với hệ tọa độ $O x y z$, phương trình nào sau đây là phương trình bậc nhất ba ẩn?],
    (
        [$x^2 + y + z = 4$],
        [$2x - 3y + 5z = 7$],
        [$x y - 2z = 1$],
        [$2/x + 3y - z = 5$]
    ),
    correct: 2,
    loigiai: [
        Phương trình bậc nhất ba ẩn $x, y, z$ có dạng tổng quát $a x + b y + c z = d$, trong đó các biến $x, y, z$ đều có bậc 1, không chứa tích các biến hoặc phân thức, căn thức chứa biến.
        Chỉ có phương trình $2x - 3y + 5z = 7$ thỏa mãn định nghĩa.
    ]
)

#lt-tn(num: 2, [Cho hệ phương trình bậc nhất ba ẩn:
$ cases(x + y + z = 6, 2x - y + z = 3, x + 2y - z = 2) $
Bộ ba số $(x_0; y_0; z_0)$ nào sau đây là nghiệm của hệ phương trình đã cho?],
    (
        [$(1; 2; 3)$],
        [$(2; 1; 3)$],
        [$(3; 2; 1)$],
        [$(1; 3; 2)$]
    ),
    correct: 1,
    loigiai: [
        Thay bộ ba số $(x; y; z) = (1; 2; 3)$ vào từng phương trình của hệ:
        - PT1: $1 + 2 + 3 = 6$ (Đúng).
        - PT2: $2(1) - 2 + 3 = 3$ (Đúng).
        - PT3: $1 + 2(2) - 3 = 2$ (Đúng).
        Vậy $(1; 2; 3)$ là nghiệm của hệ phương trình. Hoặc có thể sử dụng máy tính cầm tay để giải trực tiếp.
    ]
)

#lt-tn(num: 3, [Cho hệ phương trình ba ẩn có dạng tam giác (đã khử Gauss):
$ cases(2x - y + 3z = 8, 3y - z = 4, 2z = 4) $
Tổng các giá trị $x + y + z$ của nghiệm hệ phương trình là],
    (
        [$6$],
        [$5$],
        [$7$],
        [$8$]
    ),
    correct: 1,
    loigiai: [
        Thực hiện phép thế lùi từ dưới lên trên:
        - Từ PT (3): $2z = 4 => z = 2$.
        - Thay $z = 2$ vào PT (2): $3y - 2 = 4 => 3y = 6 => y = 2$.
        - Thay $y = 2, z = 2$ vào PT (1): $2x - 2 + 3(2) = 8 => 2x + 4 = 8 => x = 2$.
        Nghiệm của hệ là $(2; 2; 2)$. Vậy tổng $x + y + z = 2 + 2 + 2 = 6$.
    ]
)

#lt-tn(num: 4, [Nếu hệ ba phương trình bậc nhất ba ẩn có *nghiệm duy nhất*, thì vị trí tương đối của ba mặt phẳng biểu diễn ba phương trình đó trong không gian là],
    (
        [Ba mặt phẳng đôi một song song với nhau],
        [Ba mặt phẳng cùng đi qua một đường thẳng chung],
        [Ba mặt phẳng cắt nhau tại một điểm duy nhất],
        [Ba mặt phẳng hoàn toàn trùng nhau]
    ),
    correct: 3,
    loigiai: [
        Mỗi phương trình bậc nhất ba ẩn biểu diễn một mặt phẳng. Tập nghiệm của hệ phương trình chính là giao điểm chung của ba mặt phẳng đó. Nếu hệ có nghiệm duy nhất, điều đó có nghĩa là ba mặt phẳng cắt nhau tại đúng một điểm duy nhất trong không gian.
    ]
)

#lt-tn(num: 5, [Đồ thị hàm số bậc hai $y = a x^2 + b x + c$ đi qua ba điểm phân biệt $A(0; -1)$, $B(1; 2)$ và $C(2; 7)$. Hệ ba phương trình bậc nhất ba ẩn để xác định các hệ số $a, b, c$ là],
    (
        [$cases(c = -1, a + b + c = 1, 2a + b + c = 7)$],
        [$cases(c = 0, a + b = 2, 4a + 2b = 7)$],
        [$cases(a = -1, b = 2, c = 7)$],
        [$cases(c = -1, a + b + c = 2, 4a + 2b + c = 7)$]
    ),
    correct: 4,
    loigiai: [
        Thay tọa độ các điểm $A, B, C$ vào phương trình parabol $y = a x^2 + b x + c$:
        - Với $A(0; -1): a(0)^2 + b(0) + c = -1 => c = -1$.
        - Với $B(1; 2): a(1)^2 + b(1) + c = 2 => a + b + c = 2$.
        - Với $C(2; 7): a(2)^2 + b(2) + c = 7 => 4a + 2b + c = 7$.
        Ta được hệ phương trình bậc nhất 3 ẩn $a, b, c$.
    ]
)

#lt-tn(num: 6, [Một cửa hàng văn phòng phẩm bán ba loại vở: Vở 96 trang (giá $x$ nghìn), vở 120 trang (giá $y$ nghìn) và vở 200 trang (giá $z$ nghìn). Biết:
- Bạn An mua 3 quyển 96 tr, 2 quyển 120 tr, 1 quyển 200 tr hết 65 nghìn đồng.
- Bạn Bình mua 2 quyển 96 tr, 4 quyển 120 tr, 2 quyển 200 tr hết 98 nghìn đồng.
- Bạn Cúc mua 1 quyển 96 tr, 1 quyển 120 tr, 3 quyển 200 tr hết 77 nghìn đồng.
Giá tiền một quyển vở loại 96 trang là],
    (
        [$10$ nghìn đồng],
        [$9$ nghìn đồng],
        [$8$ nghìn đồng],
        [$11$ nghìn đồng]
    ),
    correct: 2,
    loigiai: [
        Dựa vào số lượng vở mỗi bạn mua và tổng số tiền trả, ta lập được hệ phương trình:
        $ cases(
            3x + 2y + z = 65,
            2x + 4y + 2z = 98,
            x + y + 3z = 77
        ) $
        Giải hệ phương trình này bằng máy tính cầm tay, ta được:
        $x = 9, y = 14, z = 18$.
        Vậy giá tiền 1 quyển vở loại 96 trang là 9 nghìn đồng.
    ]
)

#lt-ds(num: 7, 
  [Cho hệ phương trình bậc nhất ba ẩn:
  $ cases(x - 2y + z = 1, 2x + y - 3z = 4, x + 3y - 4z = 3) $
  Xét tính đúng/sai của các phát biểu sau:],
  (
    ([Hệ phương trình trên có nghiệm duy nhất.], false),
    ([Bộ ba số $(3; 2; 2)$ là một nghiệm của hệ phương trình.], true),
    ([Hệ phương trình có vô số nghiệm.], true),
    ([Biểu diễn hình học của hệ là 3 mặt phẳng cắt nhau tại 1 điểm duy nhất.], false),
  ),
  correct: "0110",
  loigiai: [
    Thực hiện phép biến đổi Gauss hoặc dùng Casio:
    - Rút $x$ từ phương trình (1): $x = 1 + 2y - z$.
    - Thay vào (2): $2(1 + 2y - z) + y - 3z = 4 => 5y - 5z = 2$.
    - Thay vào (3): $(1 + 2y - z) + 3y - 4z = 3 => 5y - 5z = 2$.
    Hai phương trình sau giống hệt nhau, do đó hệ có *vô số nghiệm*. Các mặt phẳng giao nhau theo một đường thẳng.
    Thử bộ số $(3; 2; 2)$:
    - PT1: $3 - 2(2) + 2 = 1$ (Đúng).
    - PT2: $2(3) + 2 - 3(2) = 4$ (Đúng).
    - PT3: $3 + 3(2) - 4(2) = 3$ (Đúng).
    Vậy $(3; 2; 2)$ là một nghiệm của hệ.
  ]
)

#lt-tln(num: 8, 
  [Trong một tam giác $A B C$, số đo các góc $hat(A), hat(B), hat(C)$ (tính bằng độ) thỏa mãn: góc $hat(A)$ lớn hơn góc $hat(B)$ $20^degree$, và tổng số đo góc $hat(A)$ và góc $hat(B)$ bằng $2$ lần số đo góc $hat(C)$. Tìm số đo góc $hat(A)$ (tính bằng độ).],
  [70],
  loigiai: [
    Gọi $x, y, z$ lần lượt là số đo (độ) của các góc $hat(A), hat(B), hat(C)$. Điểu kiện $x, y, z > 0$.
    Từ giả thiết bài toán và định lý tổng 3 góc trong tam giác, ta lập được hệ phương trình:
    $ cases(
        x + y + z = 180 quad &text("(tổng 3 góc của tam giác)"),
        x - y = 20 quad &text("(góc A lớn hơn góc B 20 độ)"),
        x + y - 2z = 0 quad &text("(tổng góc A và B bằng 2 lần góc C)")
    ) $
    Giải hệ phương trình này:
    Lấy (1) trừ (3) vế theo vế: $3z = 180 => z = 60$.
    Thay $z = 60$ vào hệ: $cases(x + y = 120, x - y = 20)$
    Cộng hai phương trình ta được $2x = 140 => x = 70$. Trừ hai phương trình: $2y = 100 => y = 50$.
    Vậy $x = 70, y = 50, z = 60$. Số đo góc $hat(A)$ là $70^degree$.
  ]
)
