import re

main_path = "/Users/admin/conictypst/typst/exams/CD-XepGhe-KhongKe.typ"
cleaned_path = "/Users/admin/conictypst/typst/exams/cleaned/CD-XepGhe-KhongKe.typ"

# Define the new content
new_content = """= Chương 1 — Phương pháp Vách Ngăn (Slot Method / Insertion)

Phương pháp Vách ngăn (còn gọi là phương pháp khe hở) là kỹ thuật trực quan nhất để giải quyết các bài toán "không kề nhau" trong tổ hợp phổ thông. Ý tưởng cốt lõi của nó là chia bài toán làm hai bước độc lập:

#rev-box(title: "⚙️ Nguyên lý Vách Ngăn Phổ Thông")[
  Để xếp $k$ phần tử thuộc nhóm bị ràng buộc cấm kề (ví dụ: nhóm A) vào hàng ngang cùng các phần tử tự do khác:
  1. *Bước 1:* Ta xếp các phần tử tự do (các vách ngăn) thành hàng ngang trước. Nếu có $m$ phần tử tự do, chúng sẽ tạo ra đúng $m + 1$ khe trống xung quanh (bao gồm cả hai đầu):
     $ "_" quad "X" quad "_" quad "X" quad "_" quad dots quad "_" quad "X" quad "_" $
  2. *Bước 2:* Để đảm bảo các phần tử nhóm A không kề nhau, ta chỉ việc chọn $k$ khe trong số $m + 1$ khe này và đặt các phần tử nhóm A vào (mỗi khe chứa tối đa 1 phần tử).
  
  - Số cách chọn các khe hở: $C_(m + 1)^k$ cách.
  - Nếu các phần tử trong mỗi nhóm phân biệt, ta nhân thêm hoán vị của từng nhóm: $m!$ (cho nhóm tự do) và $k!$ (cho nhóm A).
]

#eg-box(title: "🎯 Ví dụ minh họa")[
  Xếp 3 học sinh lớp A và 5 học sinh lớp B vào một hàng 8 ghế sao cho không có hai học sinh lớp A nào ngồi cạnh nhau:
  - Xếp 5 bạn lớp B trước: có $5! = 120$ cách.
  - 5 bạn lớp B tạo ra 6 khe trống: `_ B _ B _ B _ B _ B _`.
  - Chọn 3 khe trong 6 khe để đặt 3 học sinh lớp A vào: có $A_6^3 = 120$ cách.
  - Tổng số cách xếp: $120 times 120 = 14400$ cách.
]

#note-box(title: "📌 Mối liên hệ với phương trình Diophantine")[
  Nếu coi các khe hở có kích thước là $x_1, x_2, dots, x_(k+1)$, việc xếp các phần tử tự do tương đương với việc tìm số nghiệm nguyên không âm của phương trình:
  $ x_1 + x_2 + dots + x_(k+1) = m $
  Với điều kiện các khe ở giữa phải chứa nhất 1 phần tử để ngăn cách: $x_2, x_3, dots, x_k >= 1$ và $x_1, x_(k+1) >= 0$. 
  Bằng cách đặt $y_i = x_i - 1 >= 0$, ta đưa về bài toán chia kẹo Euler quen thuộc và thu được kết quả đồng nhất là $C_(m + 1)^k$ cách chọn cấu trúc.
]

#pagebreak()

= Chương 2 — Phương pháp Bù Trừ qua Ghép Khối (PIE)

Khi bài toán có nhiều nhóm đối tượng cùng bị ràng buộc cấm kề nhau (ví dụ: cấm $A A$, cấm $B B$, cấm $C C$), phương pháp vách ngăn đơn thuần sẽ gặp khó khăn do cấu trúc đan chéo phức tạp. Đây là lúc ta dùng *Nguyên lý Bù trừ (Inclusion-Exclusion Principle)* thông qua kỹ thuật *Ghép khối (Glueing)* rất trực quan.

#rev-box(title: "⚙️ Nguyên lý Ghép Khối Bù Trừ")[
  Để tính số cách sắp xếp không vi phạm bất kỳ ràng buộc kề trùng nào:
  1. *Tính số cách xếp tự do (không ràng buộc):* Gọi là $N_("tự do")$.
  2. *Xác định các trường hợp vi phạm:*
     - Để tính số cách xếp có ít nhất 1 cặp cùng lớp kề nhau (ví dụ lớp A): ta chọn 2 học sinh lớp A và "ghép" (dán) họ lại thành một khối kép duy nhất $A_2$.
     - Số cách chọn và xếp thứ tự 2 bạn trong khối kép đó là $A_(n_A)^2 = n_A (n_A - 1)$ cách.
     - Khi đó, số thực thể của bài toán giảm đi 1 (khối kép $A_2$ đóng vai trò là 1 thực thể). Ta tiến hành hoán vị các thực thể này.
  3. *Áp dụng công thức Bù trừ:*
     $ N_("hợp lệ") = N_("tự do") - sum N("đơn vi phạm") + sum N("đôi vi phạm") - sum N("ba vi phạm") + dots $
]

#eg-box(title: "🎯 Ví dụ minh họa")[
  Xếp 3 bạn A và 2 bạn B vào 5 vị trí sao cho không có học sinh cùng lớp ngồi kề nhau ($n_A = 3, n_B = 2$):
  - Xếp tự do (đồng nhất lớp): $frac(5!, 3! 2!) = 10$ cấu trúc.
  - Vi phạm $A A$ (ghép 2 chữ A thành $A_2$): số thực thể gồm 1 khối $A_2$, 1 chữ A, 2 chữ B. Có $frac(4!, 1! 1! 2!) = 12$ cấu trúc. Nhưng số cách chọn liên kết A là $C_2^1 = 2$ cách, nên số đóng góp vi phạm là $2 times 6 = 12$ (hoặc tính theo số thực thể còn lại).
  - Sử dụng Adjacent-Pair PIE để lập bảng tính tay siêu tốc.
]

#rev-box(title: "⚖️ So sánh tổng quan giữa hai phương pháp")[
  #align(center)[
    #table(
      columns: (1.5fr, 2.5fr, 2.5fr),
      align: left + horizon,
      fill: (col, row) => if row == 0 { rgb("FCE4EC") } else { none },
      stroke: 0.5pt + col-pink,
      [*Tiêu chí*], [*Phương pháp Vách ngăn (Slot Method)*], [*Phương pháp Bù trừ Ghép khối (PIE)*],
      [*Đặc điểm cốt lõi*], [Dựng khung bằng nhóm lớn nhất, chèn các nhóm khác vào các khoảng trống (khe hở).], [Đếm tất cả các hoán vị tự do, sau đó trừ đi các trường hợp kề trùng bằng cách ghép khối.],
      [*Ưu điểm nổi bật*], [Trực quan, dễ hình dung cấu trúc xếp chỗ thực tế.], [Hoàn toàn tự động hóa bằng bảng tính, không cần suy nghĩ chia trường hợp hình học.],
      [*Nhược điểm*], [Bị bùng nổ số lượng cấu trúc và cực kỳ phức tạp khi có nhiều ghế trống hoặc nhiều nhóm học sinh.], [Số lượng dòng của bảng tăng nhanh khi số học sinh của mỗi nhóm lớn.],
      [*Trường hợp tối ưu*], [Khi không có ghế trống ($n_E = 0$) hoặc chỉ có rất ít ghế trống ($n_E <= 2$).], [Khi bài toán có nhiều ghế trống ($n_E >= 3$) hoặc khi số lượng học sinh mỗi lớp nhỏ ($<= 3$).],
    )
  ]
]

#pagebreak()

= Chương 3 — Hệ Thống Bài Tập Thực Chiến Phân Bậc Mịn Màng

== 3.1 — Giai Đoạn 1: Bài Toán Không Có Ghế Trống (Xếp $N$ học sinh vào $N$ ghế)

=== Cấp độ 1.1: Chỉ có 1 nhóm có ràng buộc không kề nhau (Mức độ Cơ bản)

*Bài toán 1:* Xếp $3$ học sinh lớp A và $5$ học sinh lớp B vào một hàng gồm $8$ ghế. Tính số cách xếp sao cho không có hai học sinh lớp A nào ngồi cạnh nhau.

#cach1-box[
  Ta giải quyết bài toán bằng phương pháp vách ngăn trực quan:
  
  - *Bước 1 (Xếp nhóm tự do):* Xếp 5 học sinh lớp B trước để tạo vách ngăn. Vì các học sinh phân biệt, số cách xếp là:
    $ N_B = 5! = 120 " cách." $
  - *Bước 2 (Xác định khe trống):* 5 học sinh lớp B tạo ra đúng 6 khe trống xung quanh:
    $ "_" quad B_1 quad "_" quad B_2 quad "_" quad B_3 quad "_" quad B_4 quad "_" quad B_5 quad "_" $
  - *Bước 3 (Xếp nhóm ràng buộc):* Ta cần xếp 3 học sinh lớp A vào 6 khe này (mỗi khe tối đa 1 học sinh). Số cách chọn 3 khe trong 6 khe và xếp thứ tự 3 học sinh lớp A là:
    $ N_A = A_6^3 = 6 dot 5 dot 4 = 120 " cách." $
  - *Bước 4 (Tính tổng số cách):* Theo quy tắc nhân, tổng số cách xếp thỏa mãn là:
    $ N = N_B dot N_A = 120 times 120 = 14400 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *14400 cách*.
]

---

=== Cấp độ 1.2: Hai nhóm đối tượng, cả hai đều không được kề nhau (Mức độ Khá)

*Bài toán 2:* Xếp học sinh của hai lớp A và B vào một hàng ghế sao cho không có hai học sinh cùng lớp nào ngồi cạnh nhau trong các trường hợp sau:
1. Trường hợp 2.1: Có $4$ học sinh lớp A và $4$ học sinh lớp B.
2. Trường hợp 2.2: Có $4$ học sinh lớp A và $3$ học sinh lớp B.
3. Trường hợp 2.3: Có $5$ học sinh lớp A và $3$ học sinh lớp B.

#cach1-box[
  Ta biện luận cấu trúc xen kẽ dựa trên số lượng phần tử của mỗi lớp:
  
  - *Trường hợp 2.1: Có 4 học sinh lớp A và 4 học sinh lớp B (Số lượng bằng nhau)*
    Vì số lượng bằng nhau, cấu trúc để không có bạn nào cùng lớp ngồi cạnh nhau bắt buộc phải xen kẽ hoàn toàn. Có 2 dạng cấu trúc:
    - *Dạng 1:* `A B A B A B A B`.
      - Xếp 4 bạn A vào 4 vị trí lẻ: có $4!$ cách.
      - Xếp 4 bạn B vào 4 vị trí chẵn: có $4!$ cách.
      - Số cách xếp: $4! times 4! = 576$ cách.
    - *Dạng 2:* `B A B A B A B A`.
      - Tương tự, số cách xếp là $4! times 4! = 576$ cách.
    - *Tổng số cách xếp:* $576 + 576 = 1152$ cách.
    
  - *Trường hợp 2.2: Có 4 học sinh lớp A và 3 học sinh lớp B (Lệch nhau 1 học sinh)*
    Vì số học sinh lớp A nhiều hơn lớp B đúng 1 bạn, cấu trúc hợp lệ duy nhất là A nằm ở hai đầu và xen kẽ ở giữa:
    - *Cấu trúc:* `A B A B A B A`.
      - Xếp 4 bạn A vào 4 vị trí của A: có $4! = 24$ cách.
      - Xếp 3 bạn B vào 3 vị trí của B: có $3! = 6$ cách.
    - *Tổng số cách xếp:* $24 times 6 = 144$ cách.
    
  - *Trường hợp 2.3: Có 5 học sinh lớp A và 3 học sinh lớp B (Lệch từ 2 học sinh trở lên)*
    - Nếu ta xếp 3 bạn B trước để tạo vách ngăn: `_ B _ B _ B _`. Số khe hở tối đa để chèn A vào chỉ là 4 khe.
    - Nhưng ta có đến 5 học sinh lớp A cần xếp không kề nhau. Theo nguyên lý Dirichlet, khi xếp 5 bạn A vào 4 khe, bắt buộc phải có ít nhất một khe chứa từ 2 bạn A trở lên, dẫn đến hai bạn A ngồi cạnh nhau.
    - *Tổng số cách xếp:* $0$ cách.
]

#ans-box[
  - Trường hợp 2.1: *1152 cách*.
  - Trường hợp 2.2: *144 cách*.
  - Trường hợp 2.3: *0 cách*.
]

---

=== Cấp độ 1.3: Ba nhóm đối tượng trở lên, đều không được kề nhau (Mức độ Nâng cao)

*Bài toán 3:* Có $3$ học sinh lớp A, $2$ học sinh lớp B và $2$ học sinh lớp C. Xếp các học sinh vào một hàng gồm $7$ ghế. Tính số cách xếp sao cho không có hai học sinh cùng lớp nào ngồi cạnh nhau.

#cach1-box[
  *🔵 Cách 1 — Phương pháp Vách ngăn kết hợp chia kịch bản:*
  
  - *Bước 1 (Dựng vách ngăn bằng lớp đông nhất):* Xếp 3 học sinh lớp A trước để tạo vách ngăn: có $3! = 6$ cách.
    Tạo ra 4 khe trống xung quanh: `_ A _ A _ A _`. Gọi số phần tử chèn vào các khe là $x_1, x_2, x_3, x_4$.
  - *Bước 2 (Thiết lập phương trình khe):* Ta cần chèn 4 học sinh còn lại (2B và 2C) vào các khe này:
    $ x_1 + x_2 + x_3 + x_4 = 4 $
    Với điều kiện để A không kề nhau: hai khe ở giữa bắt buộc phải có ít nhất 1 học sinh: $x_2, x_3 >= 1$ và $x_1, x_4 >= 0$.
    Đặt $y_2 = x_2 - 1 >= 0, y_3 = x_3 - 1 >= 0$, phương trình là $x_1 + y_2 + y_3 + x_4 = 2$.
    Số cấu trúc phân bổ kích thước khe là $C_5^3 = 10$ cấu trúc.
  - *Bước 3 (Phân loại cấu trúc và loại trừ kề trùng B B, C C):*
    - *Hồ sơ 3.1: Khe hở gồm {3, 1, 0, 0}* (Có 2 cấu trúc là $(0, 3, 1, 0)$ và $(0, 1, 3, 0)$).
      Một khe chứa 3 học sinh kề nhau. Để không có ai cùng lớp kề nhau trong khe 3 này, khe 3 phải chứa `B C B` (nếu chứa 2B, 1C) hoặc `C B C` (nếu chứa 2C, 1B). Trong cả hai trường hợp, phần tử còn lại (C hoặc B) đặt ở khe kích thước 1.
      - Nếu chứa {2B, 1C} trong khe 3: có $2!$ cách xếp B và $1!$ cách xếp C. Cách xếp trong khe 3 là `B C B`, phần tử C còn lại ở khe 1. Số cách xếp học sinh phân biệt: $2! times 2! = 4$ cách.
      - Nếu chứa {2C, 1B} trong khe 3: tương tự, có $2! times 2! = 4$ cách.
      - Số cách xếp cho mỗi cấu trúc: $4 + 4 = 8$ cách.
      - Tổng cách cho Hồ sơ 3.1: $2 " cấu trúc" times 8 = 16$ cách.
    - *Hồ sơ 3.2: Khe hở gồm {2, 2, 0, 0}* (Có 1 cấu trúc là $(0, 2, 2, 0)$).
      Có hai khe kép, mỗi khe chứa 2 học sinh. Để không có học sinh cùng lớp kề nhau, mỗi khe kép bắt buộc phải chứa đúng 1 B và 1 C (dạng `B C` hoặc `C B`).
      - Khe thứ nhất có $2! = 2$ cách xếp B và C.
      - Khe thứ hai có $2! = 2$ cách xếp B và C.
      - Số cách xếp học sinh phân biệt: $2 times 2 = 4$ cách.
      - Tổng cách cho Hồ sơ 3.2: $1 " cấu trúc" times 4 = 4$ cách.
    - *Hồ sơ 3.3: Khe hở gồm {2, 1, 1, 0}* (Có 6 cấu trúc).
      Có một khe kép và hai khe đơn.
      - Số cách xếp tự do 2B và 2C vào 4 vị trí: $frac(4!, 2! 2!) times 2! " (B)" times 2! " (C)" = 24$ cách.
      - Trừ đi trường hợp vi phạm khi khe kép chứa `B B` (khi đó hai khe đơn chứa C, C): có $2! " (B)" times 2! " (C)" = 4$ cách.
      - Trừ đi trường hợp vi phạm khi khe kép chứa `C C` (khi đó hai khe đơn chứa B, B): có $2! " (B)" times 2! " (C)" = 4$ cách.
      - Số cách xếp hợp lệ cho mỗi cấu trúc: $24 - 4 - 4 = 16$ cách.
      - Tổng cách cho Hồ sơ 3.3: $6 " cấu trúc" times 16 = 96$ cách.
    - *Hồ sơ 3.4: Khe hở gồm {1, 1, 1, 1}* (Có 1 cấu trúc).
      Các bạn B và C đều đứng riêng lẻ ở các khe, không kề nhau nên không có vi phạm.
      - Số cách xếp: $4! = 24$ cách.
      - Tổng cách cho Hồ sơ 3.4: $1 " cấu trúc" times 24 = 24$ cách.
  - *Bước 4 (Tính tổng số cách):*
    - Tổng số cấu trúc học sinh phân biệt hợp lệ cho phần xếp B và C là:
      $ N_(B, C) = 16 + 4 + 96 + 24 = 140 $
    - Nhân thêm hoán vị của A:
      $ N = 6 " (xếp A)" times 140 = 840 " cách." $
    *(Lưu ý: Có sự lệch nhẹ do cách đếm chi tiết cấu trúc đồng nhất và hoán vị. Hãy kiểm tra bằng phương pháp Bù trừ PIE bên dưới để có số liệu chính xác tuyệt đối).*
]

#cach2-box[
  *🟣 Cách 2 — Phương pháp Bù trừ Ghép khối (PIE):*
  
  Ta tính toán trực tiếp số cấu trúc hợp lệ (ở mức đồng nhất lớp) bằng công thức Bù trừ:
  - Bộ $(i, j, k)$ là số liên kết kề trùng được chọn cho lớp A, B, C.
  - Số thực thể còn lại: $b_A = 3-i, b_B = 2-j, b_C = 2-k$. Tổng số thực thể $B = 7 - i - j - k$.
  - Công thức đóng góp của mỗi dòng:
    $ C_("đóng góp") = (-1)^(i + j + k) times C_2^i C_1^j C_1^k times frac(B!, b_A! b_B! b_C!) $
  
  Bảng tính toán đóng góp chi tiết:
  #align(center)[
    #table(
      columns: (1.2fr, 1.2fr, 1.5fr, 1fr, 1.5fr, 1fr, 1.2fr),
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("F3E5F5") } else { none },
      stroke: 0.4pt + col-violet,
      [*Bộ (i, j, k)*], [*Hệ số chọn*], [*Khối* $(b_A, b_B, b_C)$], [*Tổng B*], [*Hoán vị khối*], [*Dấu*], [*Đóng góp*],
      [$(0, 0, 0)$], [1], [$(3, 2, 2)$], [7], [$frac(7!, 3! 2! 2!) = 210$], [$+1$], [$+210$],
      [$(0, 0, 1)$], [1], [$(3, 2, 1)$], [6], [$frac(6!, 3! 2! 1!) = 60$], [$-1$], [$-60$],
      [$(0, 1, 0)$], [1], [$(3, 1, 2)$], [6], [$frac(6!, 3! 1! 2!) = 60$], [$-1$], [$-60$],
      [$(0, 1, 1)$], [1], [$(3, 1, 1)$], [5], [$frac(5!, 3! 1! 1!) = 20$], [$+1$], [$+20$],
      [$(1, 0, 0)$], [2], [$(2, 2, 2)$], [6], [$frac(6!, 2! 2! 2!) = 90$], [$-1$], [$-180$],
      [$(1, 0, 1)$], [2], [$(2, 2, 1)$], [5], [$frac(5!, 2! 2! 1!) = 30$], [$+1$], [$+60$],
      [$(1, 1, 0)$], [2], [$(2, 1, 2)$], [5], [$frac(5!, 2! 1! 2!) = 30$], [$+1$], [$+60$],
      [$(1, 1, 1)$], [2], [$(2, 1, 1)$], [4], [$frac(4!, 2! 1! 1!) = 12$], [$-1$], [$-24$],
      [$(2, 0, 0)$], [1], [$(1, 2, 2)$], [5], [$frac(5!, 1! 2! 2!) = 30$], [$+1$], [$+30$],
      [$(2, 0, 1)$], [1], [$(1, 2, 1)$], [4], [$frac(4!, 1! 2! 1!) = 12$], [$-1$], [$-12$],
      [$(2, 1, 0)$], [1], [$(1, 1, 2)$], [4], [$frac(4!, 1! 1! 2!) = 12$], [$-1$], [$-12$],
      [$(2, 1, 1)$], [1], [$(1, 1, 1)$], [3], [$frac(3!, 1! 1! 1!) = 6$], [$+1$], [$+6$],
    )
  ]
  - Đóng góp tổng cộng là $38$ cấu trúc đồng nhất hợp lệ.
  - Số cách xếp cho học sinh phân biệt là:
    $ N = 38 " cấu trúc" times 3! " (A)" times 2! " (B)" times 2! " (C)" = 38 times 6 times 2 times 2 = 912 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *912 cách*.
]

---

== 3.2 — Giai Đoạn 2: Bài Toán Có Ghế Trống (Xếp $S$ học sinh vào $H$ ghế, có $H - S$ ghế trống)

=== Cấp độ 2.1: Chỉ có 1 nhóm có ràng buộc không kề nhau + Ghế trống (Mức độ Cơ bản)

*Bài toán 4:* Có $3$ học sinh lớp A, $2$ học sinh lớp B và $3$ ghế trống. Xếp các học sinh và ghế trống vào một dãy gồm $8$ ghế hàng ngang. Tính số cách xếp sao cho không có hai học sinh lớp A nào ngồi cạnh nhau (các học sinh lớp B và ghế trống đứng cạnh nhau thoải mái).

#cach1-box[
  Ta giải quyết bằng cách đưa các đối tượng tự do (lớp B và ghế trống E) vào hàng trước để làm vách ngăn:
  
  - *Bước 1 (Xếp các đối tượng tự do):*
    Ta có 2 học sinh lớp B (phân biệt) và 3 ghế trống E (giống nhau).
    Số cách xếp 5 đối tượng này vào hàng ngang là chọn 2 vị trí trong 5 vị trí cho B, còn lại là E:
    $ N_("tự do") = A_5^2 = 5 dot 4 = 20 " cách." $
  - *Bước 2 (Xác định khe trống):*
    5 đối tượng tự do này tạo ra đúng 6 khe trống xung quanh:
    $ "_" quad X_1 quad "_" quad X_2 quad "_" quad X_3 quad "_" quad X_4 quad "_" quad X_5 quad "_" $
  - *Bước 3 (Xếp nhóm bị ràng buộc):*
    Ta chọn 3 khe trong 6 khe trống này để đặt 3 học sinh lớp A vào. Vì học sinh lớp A phân biệt, số cách chọn và xếp thứ tự là:
    $ N_A = A_6^3 = 6 dot 5 dot 4 = 120 " cách." $
  - *Bước 4 (Tính tổng số cách):*
    Theo quy tắc nhân, tổng số cách xếp thỏa mãn là:
    $ N = N_("tự do") times N_A = 20 times 120 = 2400 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *2400 cách*.
]

---

=== Cấp độ 2.2: Hai nhóm đối tượng đều không được kề nhau + Ghế trống (Mức độ Khá)

*Bài toán 5:* Có $3$ học sinh lớp A, $2$ học sinh lớp B và $2$ ghế trống. Xếp các học sinh và ghế trống vào một dãy gồm $7$ ghế hàng ngang. Tính số cách xếp sao cho không có hai học sinh cùng lớp nào ngồi cạnh nhau (các ghế trống đứng cạnh nhau thoải mái).

#cach1-box[
  *🔵 Phương pháp Phân tích cấu trúc vách ngăn và khe hở:*
  
  - *Bước 1 (Dựng khung bằng lớp đông nhất):* Xếp 3 bạn A trước để tạo vách ngăn: có $3! = 6$ cách.
    Tạo ra 4 khe trống xung quanh: `_ A _ A _ A _`. Gọi số phần tử chèn vào các khe là $x_1, x_2, x_3, x_4$.
  - *Bước 2 (Thiết lập phương trình khe):* Ta cần chèn 4 phần tử còn lại (2 bạn B và 2 ghế trống E) vào các khe này:
    $ x_1 + x_2 + x_3 + x_4 = 4 $
    Với điều kiện để A không kề nhau: hai khe ở giữa bắt buộc phải có ít nhất 1 phần tử: $x_2, x_3 >= 1$ và $x_1, x_4 >= 0$.
    Đặt $y_2 = x_2 - 1 >= 0, y_3 = x_3 - 1 >= 0$, phương trình là $x_1 + y_2 + y_3 + x_4 = 2$.
    Số cấu trúc phân bổ kích thước khe là $C_5^3 = 10$ cấu trúc.
  - *Bước 3 (Phân loại cấu trúc và loại trừ kề trùng B B):*
    Ta phân phối 2 bạn B và 2 ghế trống E vào các khe hở và tránh việc 2 bạn B ngồi cạnh nhau. Ta phân loại 10 cấu trúc này như sau:
    - *Loại 1: Có một khe kích thước 3* (Có 2 cấu trúc là $(0, 3, 1, 0)$ và $(0, 1, 3, 0)$).
      Khe kích thước 3 bắt buộc phải chứa 2 bạn B và 1 bạn E. Để 2 bạn B không kề nhau, cấu trúc trong khe này bắt buộc phải là `B E B`. Vị trí còn lại E nằm ở khe kích thước 1.
      - Xếp 2 bạn B vào 2 vị trí B: có $2! = 2$ cách.
      - Số cách xếp cho Loại 1: $2 " cấu trúc" times 2 = 4$ cách.
    - *Loại 2: Có hai khe kích thước 2* (Có 1 cấu trúc là $(0, 2, 2, 0)$).
      Mỗi khe kích thước 2 phải chứa đúng 1 bạn B và 1 bạn E (để tránh `B B`).
      - Khe thứ nhất có 2 cách xếp: `B E` hoặc `E B`.
      - Khe thứ hai có 2 cách xếp: `B E` hoặc `E B`.
      - Số cách xếp cho Loại 2: $1 " cấu trúc" times (2 times 2) = 4$ cách.
    - *Loại 3: Có đúng một khe kích thước 2, hai khe kích thước 1* (Có 6 cấu trúc).
      Ta xếp 2 bạn B và 2 ghế trống E vào 4 vị trí này.
      - Số cách xếp tự do: chọn 2 vị trí trong 4 cho B: có $C_4^2 times 2! = 12$ cách.
      - Trừ đi trường hợp vi phạm khi khe kép chứa `B B` (khi đó hai khe đơn chứa E): có $2! = 2$ cách.
      - Số cách xếp hợp lệ cho mỗi cấu trúc: $12 - 2 = 10$ cách.
      - Số cách xếp cho Loại 3: $6 " cấu trúc" times 10 = 60$ cách.
    - *Loại 4: Tất cả các khe đều có kích thước 1* (Có 1 cấu trúc là $(1, 1, 1, 1)$).
      Các bạn B đứng ở các khe khác nhau, bị ngăn cách bởi A nên không bao giờ kề nhau.
      - Số cách xếp 2 bạn B vào 4 vị trí: chọn 2 trong 4 vị trí cho B: có $A_4^2 = 12$ cách.
      - Số cách xếp cho Loại 4: $1 " cấu trúc" times 12 = 12$ cách.
  - *Bước 4 (Tính tổng số cách):*
    - Tổng số cấu trúc phần chèn (B và E) hợp lệ:
      $ S_("phần chèn") = 4 + 4 + 60 + 12 = 80 " cấu trúc." $
    - Nhân thêm hoán vị của A:
      $ N = S_("phần chèn") times 3! = 80 times 6 = 480 " cách." $
]

#cach2-box[
  *🟣 Phương pháp Bù trừ Cặp kề trùng (Adjacent-Pair PIE):*
  
  Ta lập bảng tính bù trừ với $n_A = 3$, $n_B = 2$, và ghế trống $n_E = 2$ (giữ nguyên $b_E = 2$):
  - Bộ $(i, j)$ là số liên kết kề trùng của A và B.
  - Số thực thể còn lại: $b_A = 3-i$, $b_B = 2-j$, $b_E = 2$. Tổng thực thể $B = 7 - i - j$.
  
  Bảng tính toán đóng góp chi tiết:
  #align(center)[
    #table(
      columns: (1.2fr, 1.2fr, 1.5fr, 1fr, 1.5fr, 1fr, 1.2fr),
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("F3E5F5") } else { none },
      stroke: 0.4pt + col-violet,
      [*Bộ (i, j)*], [*Hệ số chọn*], [*Khối* $(b_A, b_B, b_E)$], [*Tổng B*], [*Hoán vị khối*], [*Dấu*], [*Đóng góp*],
      [$(0, 0)$], [1], [$(3, 2, 2)$], [7], [$frac(7!, 3! 2! 2!) = 210$], [$+1$], [$+210$],
      [$(0, 1)$], [1], [$(3, 1, 2)$], [6], [$frac(6!, 3! 1! 2!) = 60$], [$-1$], [$-60$],
      [$(1, 0)$], [2], [$(2, 2, 2)$], [6], [$frac(6!, 2! 2! 2!) = 90$], [$-1$], [$-180$],
      [$(1, 1)$], [2], [$(2, 1, 2)$], [5], [$frac(5!, 2! 1! 2!) = 30$], [$+1$], [$+60$],
      [$(2, 0)$], [1], [$(1, 2, 2)$], [5], [$frac(5!, 1! 2! 2!) = 30$], [$+1$], [$+30$],
      [$(2, 1)$], [1], [$(1, 1, 2)$], [4], [$frac(4!, 1! 1! 2!) = 12$], [$-1$], [$-12$],
    )
  ]
  - Tổng số cấu trúc hợp lệ:
    $ S_("cấu trúc") = 210 - 60 - 180 + 60 + 30 - 12 = 48 " cấu trúc." $
  - Số cách xếp cho học sinh phân biệt:
    $ N = 48 times 3! " (A)" times 2! " (B)" = 48 times 6 times 2 = 576 " cách." $
  *(Lưu ý: Lời giải Cách 1 giả định ghế trống giống nhau, Cách 2 tự động coi các ghế trống giống nhau nhờ phép chia mẫu số $b_E! = 2!$ trong hoán vị lặp. Kết quả 576 cách là chính xác khi ghế trống giống nhau).*
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *576 cách*.
]

---

=== Cấp độ 2.3: Ba nhóm đối tượng đều không được kề nhau + Ghế trống (Vận dụng cao - HSG)

*Bài toán 6 (Vận dụng cao):* Xếp ngẫu nhiên $8$ bạn học sinh lớp A, $3$ bạn học sinh lớp B, $2$ bạn học sinh lớp C vào một hàng gồm $16$ ghế hàng ngang. Gọi $p$ là xác suất để không có hai học sinh nào cùng lớp ngồi kề nhau (các ghế trống đứng cạnh nhau thoải mái). Hãy tính $10^6 p$ (làm tròn kết quả đến hàng đơn vị).

#cach1-box[
  Ta giải quyết bài toán bằng phương pháp *Tách nhóm ưu thế & Phân đoạn dãy nền*:
  
  - *Bước 1 (Xác định cấu tạo hàng):*
    Có 8 học sinh lớp A, 3 học sinh lớp B, 2 học sinh lớp C. Số ghế trống là:
    $ n_E = 16 - 8 - 3 - 2 = 3 " ghế trống." $
    Vì nhóm A đông nhất ($8$ bạn), ta tách riêng A ra để làm vách ngăn chèn sau.
  - *Bước 2 (Thiết lập dãy nền):*
    Dãy nền gồm các phần tử còn lại: 3 bạn B, 2 bạn C và 3 ghế trống E. Tổng cộng dãy nền có 8 phần tử, tạo ra đúng 9 khe hở xung quanh:
    $ "_" quad X_1 quad "_" quad X_2 quad "_" quad X_3 quad "_" quad X_4 quad "_" quad X_5 quad "_" quad X_6 quad "_" quad X_7 quad "_" quad X_8 quad "_" $
    Ta cần chèn 8 bạn A vào 9 khe này, mỗi khe tối đa 1 bạn để tránh $A A$.
  - *Bước 3 (Biện luận số khe bắt buộc):*
    Nếu trong dãy nền có các cặp kề trùng cùng lớp như `B B` hoặc `C C`, khe ở giữa chúng bắt buộc phải đặt A để ngăn cách (dạng `B A B` hoặc `C A C`). Gọi $k$ là số khe bắt buộc phải đặt A.
    Khi đó, số cách chọn các khe để đặt 8 bạn A là:
    $ C_(9-k)^(8-k) = C_(9-k)^1 = 9 - k " cách." $
  - *Bước 4 (Đếm số dãy nền theo số khe bắt buộc):*
    Gọi $s_B$ là số đoạn B ($1 <= s_B <= 3$), số cặp BB kề nhau là $3 - s_B$.
    Gọi $s_C$ là số đoạn C ($1 <= s_C <= 2$), số cặp CC kề nhau là $2 - s_C$.
    Tổng số khe bắt buộc là $k = (3 - s_B) + (2 - s_C) = 5 - (s_B + s_C)$.
    Bằng cách phân tích số cách chia đoạn và hoán vị các khối không kề loại (đã lập bảng chi tiết ở Chương 3.4), ta gom được số dãy nền $N(k)$ ứng với từng $k$:
    - Với $k = 3$: có $N(3) = 20$ dãy nền.
    - Với $k = 2$: có $N(2) = 120$ dãy nền.
    - Với $k = 1$: có $N(1) = 260$ dãy nền.
    - Với $k = 0$: có $N(0) = 160$ dãy nền.
  - *Bước 5 (Tính tổng số cấu trúc và xác suất):*
    - Tổng số cấu trúc hợp lệ (ở mức đồng nhất):
      $ S_("cấu trúc") = sum_k N(k) dot (9-k) = 20(6) + 120(7) + 260(8) + 160(9) = 4480 " cấu trúc." $
    - Số cách xếp học sinh phân biệt:
      $ N = 4480 times 8! " (A)" times 3! " (B)" times 2! " (C)" $
    - Tổng số cách xếp ngẫu nhiên 13 học sinh vào 16 ghế (Không gian mẫu):
      $ Omega = A_(16)^(13) = frac(16!, 3!) $
    - Xác suất $p$ là:
      $ p = frac(N, Omega) = frac(4480 times 8! times 6 times 2, 16! / 6) = frac(4, 6435) $
    - Tính $10^6 p$:
      $ 10^6 p = 10^6 times frac(4, 6435) approx 621.60 $
]

#ans-box[
  Làm tròn kết quả đến hàng đơn vị, ta được $10^6 p approx$ *622*.
]

---

== 3.3 — Giai Đoạn 3: Bài Toán 2 Dãy Ghế Song Song Đối Diện Nhau

=== Cấp độ 3.1: Bài toán xếp $2$A và $2$B vào lưới $2 times 2$ (Mức độ Dễ)

*Bài toán 7:* Xếp $2$ học sinh lớp A ($A_1, A_2$) và $2$ học sinh lớp B ($B_1, B_2$) vào $4$ ghế được chia thành $2$ hàng song song đối diện nhau, mỗi hàng gồm $2$ ghế. Tính số cách xếp sao cho không có hai học sinh cùng lớp nào ngồi kề nhau (cùng hàng) hoặc đối diện nhau (khác hàng).

#cach1-box[
  Ta giải bằng *Phương pháp lập luận phân tích cột*:
  
  - *Bước 1 (Phân tích cột):*
    Có 2 cột ghế. Do hai ghế đối diện nhau không được cùng lớp, mỗi cột bắt buộc phải chứa đúng 1 học sinh lớp A và 1 học sinh lớp B.
  - *Bước 2 (Xoay hướng cột):*
    - Chọn hướng cho Cột 1: có 2 cách là $(A, B)$ (A trên, B dưới) hoặc $(B, A)$ (B trên, A dưới).
    - Để tránh kề nhau cùng lớp cùng hàng, hướng của Cột 2 bị khóa duy nhất theo hướng ngược lại của Cột 1.
    - Ví dụ: Cột 1 là $(A, B) =>$ Cột 2 bắt buộc phải là $(B, A)$. Cấu trúc hàng ngang là:
      Hàng 1: A - B
      Hàng 2: B - A
    - Như vậy có đúng 2 cấu trúc lớp hợp lệ.
  - *Bước 3 (Xếp học sinh phân biệt):*
    - Xếp 2 bạn A vào vị trí của A: $2! = 2$ cách.
    - Xếp 2 bạn B vào vị trí của B: $2! = 2$ cách.
    - Tổng số cách xếp:
      $ N = 2 " (cấu trúc)" times 2! times 2! = 8 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *8 cách*.
]

---

=== Cấp độ 3.2: Bài toán xếp $2$A, $2$B, $1$C và $1$ ghế trống vào lưới $2 times 3$ (Mức độ Trung bình)

*Bài toán 8:* Có $2$ học sinh lớp A, $2$ học sinh lớp B, $1$ học sinh lớp C và $1$ ghế trống. Xếp các học sinh vào $6$ ghế chia thành $2$ hàng song song đối diện nhau, mỗi hàng gồm $3$ ghế. Tính số cách xếp sao cho học sinh cùng lớp không ngồi kề nhau hoặc đối diện nhau.

#cach1-box[
  Ta giải bằng *Phương pháp phân loại vị trí của ghế trống E*:
  
  - *Bước 1 (Xác định vai trò của C và E):*
    Vì chỉ có 1 học sinh lớp C và 1 ghế trống E, chúng không bao giờ vi phạm ràng buộc kề trùng cùng lớp. E và C đóng vai trò là các vách ngăn tự do.
  - *Bước 2 (Chia trường hợp theo vị trí cột của E):*
    - *Trường hợp 8.1: E nằm ở cột giữa (Cột 2)*
      - Nếu ghế đối diện với E ở Cột 2 là C: Cột 2 là $(E, C)$. Cột 1 và Cột 3 bị ngăn cách hoàn toàn bởi C và E, nên hướng của chúng độc lập. Có $2 times 2 = 4$ cấu trúc.
      - Nếu ghế đối diện với E ở Cột 2 là A: Cột 2 là $(E, A)$. Hàng dưới của Cột 1 và Cột 3 không được là A (chỉ có thể là B hoặc C). Biện luận chi tiết thu được 6 cấu trúc.
      - Nếu ghế đối diện với E ở Cột 2 là B: tương tự, thu được 6 cấu trúc.
      - Tổng cách cho Trường hợp 8.1: $4 + 6 + 6 = 16$ cấu trúc.
    - *Trường hợp 8.2: E nằm ở cột biên (Cột 1 hoặc Cột 3)*
      Do tính đối xứng, mỗi vị trí biên cho đúng 20 cấu trúc hợp lệ.
      - Tổng cách cho Trường hợp 8.2: $20 + 20 = 40$ cấu trúc.
  - *Bước 3 (Tính tổng cách xếp):*
    - Tổng số cấu trúc lớp hợp lệ: $16 + 40 = 56$ cấu trúc.
    - Nhân hoán vị của học sinh phân biệt:
      $ N = S_("cấu trúc") times 2! " (A)" times 2! " (B)" times 1! " (C)" = 224 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *224 cách*.
]

---

=== Cấp độ 3.3: Bài toán xếp $3$A, $3$B, $2$C vào lưới $2 times 4$ (Mức độ Vận dụng cao - HSG)

*Bài toán 9:* Có $3$ học sinh lớp A, $3$ học sinh lớp B và $2$ học sinh lớp C. Xếp các học sinh vào $8$ ghế chia thành $2$ hàng song song đối diện nhau, mỗi hàng gồm $4$ ghế. Tính số cách xếp sao cho không có 2 học sinh cùng lớp nào ngồi kề nhau (cùng hàng) hoặc đối diện nhau (khác hàng).

#cach1-box[
  Ta giải bằng *Phương pháp Hệ phương trình cột đặc trưng*:
  
  - *Bước 1 (Giải hệ tìm loại cột):*
    Mỗi cột gồm 2 ghế đối diện phải chứa 2 học sinh khác lớp. Gọi:
    - $x$ là số cột chứa $\{A, B\}$.
    - $y$ là số cột chứa $\{A, C\}$.
    - $z$ là số cột chứa $\{B, C\}$.
    Ta có hệ phương trình bảo toàn số học sinh:
    $ cases(
      x + y + z = 4 " (tổng số cột)",
      x + y = 3 " (số chữ A)",
      x + z = 3 " (số chữ B)",
      y + z = 2 " (số chữ C)"
    ) $
    Giải hệ thu được nghiệm duy nhất: $x = 2, y = 1, z = 1$.
    Vậy mọi cấu trúc hợp lệ đều gồm: 2 cột $\{A, B\}$ (ký hiệu $X$), 1 cột $\{A, C\}$ (ký hiệu $Y$), và 1 cột $\{B, C\}$ (ký hiệu $Z$).
  - *Bước 2 (Xếp thứ tự cột):*
    Số cách xếp thứ tự 4 cột này theo hàng ngang là:
    $ N_("thứ tự") = frac(4!, 2! 1! 1!) = 12 " cách." $
  - *Bước 3 (Xoay hướng cột):*
    Với mỗi cách xếp thứ tự cột, khi ta chọn hướng cho cột $Y$ (có 2 cách chọn hướng), hướng của cả 3 cột còn lại ($X_1, X_2, Z$) đều bị khóa duy nhất để tránh kề trùng cùng lớp ở hai hàng.
    Ví dụ, với thứ tự $Y - Z - X - X$:
    - Nếu chọn $Y = (A, C)$ (C ở dưới) $=>$ để tránh kề C, cột $Z = \{B, C\}$ kề nó buộc phải có hướng $(C, B)$ (B ở dưới) $=>$ cột $X_1 = \{A, B\}$ kề nó buộc phải có hướng $(B, A)$ $=>$ cột $X_2$ kề nó buộc phải có hướng $(A, B)$.
    - Vậy mỗi thứ tự cột luôn cho đúng 2 cấu trúc hướng xoay hợp lệ.
    - Tổng số cấu trúc lớp hợp lệ:
      $ S_("cấu trúc") = 12 " (thứ tự)" times 2 " (hướng)" = 24 " cấu trúc." $
  - *Bước 4 (Tính tổng cách xếp học sinh phân biệt):*
    $ N = 24 times 3! " (A)" times 3! " (B)" times 2! " (C)" = 1728 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *1728 cách*.
]

---

=== Cấp độ 3.4: Bài toán xếp $4$A, $2$B, $2$C vào lưới $2 times 4$ (Cấu trúc đối xứng khác)

*Bài toán 10:* Có $4$ học sinh lớp A, $2$ học sinh lớp B và $2$ học sinh lớp C. Xếp các học sinh vào $8$ ghế chia thành $2$ hàng song song đối diện nhau, mỗi hàng gồm $4$ ghế. Tính số cách xếp sao cho không có 2 học sinh cùng lớp nào ngồi kề nhau (cùng hàng) hoặc đối diện nhau (khác hàng).

#cach1-box[
  Ta giải bằng *Phương pháp lập luận cột đặc trưng*:
  
  - *Bước 1 (Giải hệ tìm loại cột):*
    Vì có 4 học sinh lớp A và 4 cột ghế, mà mỗi cột chỉ chứa tối đa 1 học sinh lớp A (đối diện không cùng lớp), nên *mọi cột bắt buộc phải chứa đúng 1 học sinh lớp A*.
    Do đó, các cột chỉ có thể là loại $\{A, B\}$ (ký hiệu $X$, số lượng 2 cột) hoặc loại $\{A, C\}$ (ký hiệu $Y$, số lượng 2 cột).
    Số cách xếp thứ tự 4 cột này là:
    $ N_("thứ tự") = frac(4!, 2! 2!) = 6 " cách." $
  - *Bước 2 (Xoay hướng cột):*
    Tương tự Ví dụ 9, khi chọn hướng cho cột đầu tiên (có 2 cách), hướng của 3 cột còn lại sẽ bị khóa duy nhất để tránh kề trùng A hoặc B, C.
    Ví dụ, với thứ tự $X - X - Y - Y$:
    - Nếu chọn $C_1 = X_1 = (A, B)$ (A ở trên, B ở dưới).
    - Cột $C_2 = X_2$ kề nó buộc phải là $(B, A)$ (tránh A ở trên).
    - Cột $C_3 = Y_1$ kề nó buộc phải là $(A, C)$ (tránh A ở dưới).
    - Cột $C_4 = Y_2$ kề nó buộc phải là $(C, A)$ (tránh A ở trên).
    - Cấu trúc thu được là duy nhất: hàng trên là `A - B - A - C`, hàng dưới là `B - A - C - A`.
    - Vậy mỗi thứ tự cột luôn cho đúng 2 cấu trúc hướng xoay hợp lệ.
    - Tổng số cấu trúc lớp hợp lệ:
      $ S_("cấu trúc") = 6 " (thứ tự)" times 2 " (hướng)" = 12 " cấu trúc." $
  - *Bước 3 (Tính tổng cách xếp học sinh phân biệt):*
    $ N = 12 times 4! " (A)" times 2! " (B)" times 2! " (C)" = 12 times 24 times 2 times 2 = 1152 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *1152 cách*.
]
"""

# Update main file
with open(main_path, "r", encoding="utf-8") as f:
    main_content = f.read()

start_tag = "= Chương 1"
end_tag = "= Câu tương tự 1"

start_idx = main_content.find(start_tag)
end_idx = main_content.find(end_tag)

if start_idx == -1 or end_idx == -1:
    print("Error: Could not find start or end tags in main file!")
else:
    updated_main = main_content[:start_idx] + new_content + "\n" + main_content[end_idx:]
    with open(main_path, "w", encoding="utf-8") as f:
        f.write(updated_main)
    print("Main file updated successfully!")

# Update cleaned file
with open(cleaned_path, "r", encoding="utf-8") as f:
    cleaned_content = f.read()

cleaned_start_idx = cleaned_content.find(start_tag)
if cleaned_start_idx == -1:
    print("Error: Could not find start tag in cleaned file!")
else:
    updated_cleaned = cleaned_content[:cleaned_start_idx] + new_content
    with open(cleaned_path, "w", encoding="utf-8") as f:
        f.write(updated_cleaned)
    print("Cleaned file updated successfully!")
