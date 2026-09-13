#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0284c7") // Sky Blue cho Đề 6A

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 2: QUY NẠP TOÁN HỌC & NHỊ THỨC NEWTON",
  exam-title: "BÀI 3: THÁP HÀ NỘI & PHÂN CHIA HÌNH HỌC (ĐỀ A - THUẬT TOÁN QUY NẠP)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "316",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trò chơi Tháp Hà Nội (Tower of Hanoi) được nhà toán học Pháp Édouard Lucas phát minh vào năm 1883. Trò chơi gồm ba cọc $A, B, C$ và $n$ đĩa có kích thước đôi một khác nhau xếp chồng lên cọc $A$ theo thứ tự đĩa nhỏ nằm trên đĩa lớn.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Đế
    line((-2.5, 0), (2.5, 0), stroke: 2pt + rgb("0284c7"))
    // 3 cọc
    line((-1.6, 0), (-1.6, 1.5), stroke: 1.5pt + rgb("0284c7"))
    content((-1.6, -0.3), text(size: 7.5pt, weight: "bold")[$A$])
    line((0, 0), (0, 1.5), stroke: 1.5pt + rgb("0284c7"))
    content((0, -0.3), text(size: 7.5pt, weight: "bold")[$B$])
    line((1.6, 0), (1.6, 1.5), stroke: 1.5pt + rgb("0284c7"))
    content((1.6, -0.3), text(size: 7.5pt, weight: "bold")[$C$])
    // 3 đĩa ở cọc A
    rect((-2.2, 0.05), (-1.0, 0.3), fill: rgb("e0f2fe"), stroke: 1pt + rgb("0284c7"))
    rect((-2.0, 0.3), (-1.2, 0.55), fill: rgb("bae6fd"), stroke: 1pt + rgb("0284c7"))
    rect((-1.8, 0.55), (-1.4, 0.8), fill: rgb("7dd3fc"), stroke: 1pt + rgb("0284c7"))
  })
]
Quy tắc chuyển đĩa hợp lệ trong trò chơi là],
    (
        True([Mỗi lần chỉ được chuyển $1$ đĩa và không bao giờ được đặt đĩa lớn lên trên đĩa nhỏ]),
        [Mỗi lần được chuyển nhiều đĩa tùy ý],
        [Có thể đặt đĩa có kích thước bất kỳ lên trên bất kỳ đĩa nào],
        [Chỉ được chuyển đĩa giữa hai cọc $A$ và $B$]
    ),
    loigiai: [
        #step([Quy tắc Tháp Hà Nội])
        Quy tắc nghiêm ngặt: Mỗi lần chỉ chuyển một đĩa trên cùng từ một cọc sang cọc khác, và không bao giờ được đặt một đĩa lớn hơn lên trên một đĩa nhỏ hơn.
    ]
)

// TN 2
#tn([Gọi $H_n$ là số bước chuyển tối thiểu để di chuyển toàn bộ $n$ chiếc đĩa từ cọc $A$ sang cọc $C$. Hệ thức truy hồi liên hệ giữa $H_n$ và $H_(n-1)$ là],
    (
        True([$H_n = 2 H_(n-1) + 1$]),
        [$H_n = H_(n-1) + 2$],
        [$H_n = 2 H_(n-1)$],
        [$H_n = 3 H_(n-1) + 1$]
    ),
    loigiai: [
        #step([Thuật toán quy nạp chuyển n đĩa])
        - Bước 1: Chuyển $n - 1$ đĩa trên cùng từ cọc $A$ sang cọc trung gian $B$ (mất $H_(n-1)$ bước).
        - Bước 2: Chuyển $1$ đĩa lớn nhất ở đáy từ cọc $A$ sang cọc đích $C$ (mất $1$ bước).
        - Bước 3: Chuyển $n - 1$ đĩa từ cọc $B$ sang cọc $C$ đè lên đĩa lớn nhất (mất $H_(n-1)$ bước).
        Tổng số bước: $H_n = H_(n-1) + 1 + H_(n-1) = 2 H_(n-1) + 1$.
    ]
)

// TN 3
#tn([Công thức tổng quát tính số bước chuyển tối thiểu $H_n$ để giải bài toán Tháp Hà Nội với $n$ đĩa là],
    (
        True([$H_n = 2^n - 1$]),
        [$H_n = 2^n$],
        [$H_n = 2^(n-1)$],
        [$H_n = n^2 - 1$]
    ),
    loigiai: [
        #step([Chứng minh công thức bằng quy nạp])
        - Với $n = 1$: $H_1 = 2^1 - 1 = 1$ (đúng).
        - Giả sử $H_k = 2^k - 1$.
        - Với $n = k + 1$: $H_(k+1) = 2 H_k + 1 = 2(2^k - 1) + 1 = 2^(k+1) - 2 + 1 = 2^(k+1) - 1$.
        Vậy $H_n = 2^n - 1$ với mọi $n in NN^*$.
    ]
)

// TN 4
#tn([Để di chuyển một tháp gồm $3$ đĩa sang cọc đích, số bước chuyển tối thiểu cần thực hiện là],
    (
        True([$7$ bước]),
        [$6$ bước],
        [$8$ bước],
        [$9$ bước]
    ),
    loigiai: [
        #step([Tính H3])
        Áp dụng công thức: $H_3 = 2^3 - 1 = 8 - 1 = 7$ bước.
    ]
)

// TN 5
#tn([Để di chuyển một tháp gồm $4$ đĩa sang cọc đích, số bước chuyển tối thiểu cần thực hiện là],
    (
        True([$15$ bước]),
        [$14$ bước],
        [$16$ bước],
        [$12$ bước]
    ),
    loigiai: [
        #step([Tính H4])
        $ H_4 = 2^4 - 1 = 16 - 1 = 15 $ bước.
    ]
)

// TN 6
#tn([Theo truyền thuyết, ngôi đền Benares ở Ấn Độ có một tháp gồm $64$ chiếc đĩa bằng vàng ròng. Các nhà sư chuyển đĩa ngày đêm không ngừng nghỉ, mỗi giây chuyển được đúng $1$ đĩa. Khi hoàn thành toàn bộ công việc, vũ trụ sẽ chấm dứt.
Tổng số bước chuyển cần thiết để hoàn thành $64$ đĩa vàng là],
    (
        True([$2^(64) - 1$ bước]),
        [$64^2 - 1$ bước],
        [$2^(63)$ bước],
        [$64!$ bước]
    ),
    loigiai: [
        #step([Số bước chuyển 64 đĩa])
        $ H_(64) = 2^(64) - 1 approx 1.84 times 10^(19) $ bước.
        Thời gian để hoàn thành xấp xỉ $584$ tỷ năm (lớn hơn nhiều so với tuổi của vũ trụ hiện tại khoảng $13.8$ tỷ năm).
    ]
)

// TN 7
#tn([Bài toán cắt bánh pizza: Số miếng bánh tối đa $P_n$ có thể nhận được từ một chiếc bánh tròn sau $n$ nhát cắt thẳng là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    circle((0, 0), radius: 1.2, fill: rgb("fefce8"), stroke: 1.5pt + rgb("ca8a04"))
    line((-1.3, -0.4), (1.3, 0.4), stroke: 1pt + rgb("dc2626"))
    line((-0.5, -1.3), (0.5, 1.3), stroke: 1pt + rgb("dc2626"))
    line((-1.2, 0.8), (1.2, -0.8), stroke: 1pt + rgb("dc2626"))
    content((0, -1.45), text(size: 7.5pt, fill: rgb("ca8a04"), weight: "bold")[Bánh pizza với 3 nhát cắt])
  })
]
Công thức tính số miếng bánh $P_n$ là],
    (
        True([$P_n = (n(n + 1)) / 2 + 1$]),
        [$P_n = 2^n$],
        [$P_n = (n(n - 1)) / 2 + 1$],
        [$P_n = 2n$]
    ),
    loigiai: [
        #step([Dãy số Lazy Caterer])
        Mỗi nhát cắt thứ $n$ đi qua tối đa $n - 1$ nhát cắt trước, chia thêm $n$ miếng mới:
        $ P_n = P_(n-1) + n $
        Với $P_0 = 1$ (chiếc bánh nguyên vẹn ban đầu):
        $ P_n = 1 + (1 + 2 + ... + n) = (n(n + 1)) / 2 + 1 $
    ]
)

// TN 8
#tn([Sau khi thực hiện đúng $4$ nhát cắt thẳng trên một chiếc bánh pizza, số miếng bánh tối đa có thể thu được là],
    (
        True([$11$ miếng]),
        [$8$ miếng],
        [$16$ miếng],
        [$10$ miếng]
    ),
    loigiai: [
        #step([Tính P4])
        $ P_4 = (4(4 + 1)) / 2 + 1 = (4 times 5) / 2 + 1 = 10 + 1 = 11 $ miếng.
    ]
)

// TN 9
#tn([Số giao điểm tối đa của $n$ đường tròn phân biệt trên mặt phẳng là],
    (
        True([$n(n - 1)$]),
        [$C_n^2$],
        [$2n$],
        [$n^2$]
    ),
    loigiai: [
        #step([Số giao điểm tối đa giữa các cặp đường tròn])
        Hai đường tròn phân biệt cắt nhau tại tối đa $2$ điểm.
        Có $C_n^2 = (n(n-1))/2$ cặp đường tròn.
        Số giao điểm tối đa:
        $ 2 times C_n^2 = 2 times (n(n - 1)) / 2 = n(n - 1) $
    ]
)

// TN 10
#tn([Số miền mặt phẳng tối đa $C_n$ được tạo ra bởi $n$ đường tròn phân biệt thỏa mãn công thức tổng quát là],
    (
        True([$C_n = n^2 - n + 2$]),
        [$C_n = n^2 + 1$],
        [$C_n = 2^n$],
        [$C_n = n^2 - n + 1$]
    ),
    loigiai: [
        #step([Hệ thức truy hồi cho đường tròn])
        Đường tròn thứ $n$ cắt $n - 1$ đường tròn trước tại tối đa $2(n - 1)$ điểm, các điểm này chia đường tròn mới thành $2(n - 1)$ cung. Mỗi cung chia đôi một miền cũ:
        $ C_n = C_(n-1) + 2(n - 1) $
        Với $C_1 = 2$ (trong và ngoài đường tròn 1):
        $ C_n = 2 + 2(1 + 2 + ... + (n - 1)) = 2 + 2 (((n - 1)n) / 2) = n^2 - n + 2 $
    ]
)

// TN 11
#tn([Trong khoa học máy tính, thuật toán đệ quy giải bài toán Tháp Hà Nội có độ phức tạp thời gian tính toán là],
    (
        True([$O(2^n)$ (độ phức tạp hàm mũ)]),
        [$O(n^2)$ (độ phức tạp đa thức)],
        [$O(n)$ (độ phức tạp tuyến tính)],
        [$O(n log n)$]
    ),
    loigiai: [
        #step([Độ phức tạp thuật toán])
        Vì số thao tác cơ bản tỉ lệ thuận với số bước chuyển $2^n - 1$, nên thuật toán đệ quy Tháp Hà Nội có độ phức tạp hàm mũ $O(2^n)$.
    ]
)

// TN 12
#tn([Một chiếc bánh hình lập phương được cắt bởi $3$ nhát cắt phẳng song song với $3$ mặt vuông góc đôi một. Số miếng bánh nhỏ thu được là],
    (
        True([$8$ miếng]),
        [$6$ miếng],
        [$4$ miếng],
        [$7$ miếng]
    ),
    loigiai: [
        #step([Cắt khối lập phương])
        Mỗi nhát cắt theo một chiều vuông góc chia đôi số miếng bánh hiện có:
        $ 2 times 2 times 2 = 8 $ miếng.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Xét trò chơi Tháp Hà Nội với $n$ chiếc đĩa. Gọi $H_n$ là số bước chuyển tối thiểu.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("e0f2fe"), stroke: 1.2pt + rgb("0284c7"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("0284c7"))[Thuật toán đệ quy Tháp Hà Nội $H_n = 2^n - 1$])
  })
]],
  (
    True([Với $n = 1$, chỉ cần đúng $1$ bước chuyển đĩa từ cọc $A$ sang cọc $C$.]),
    True([Với $n = 2$, cần tối thiểu $3$ bước chuyển.]),
    True([Với $n = 5$, số bước chuyển tối thiểu là $31$ bước.]),
    [Khi số đĩa tăng từ $k$ lên $k + 1$, số bước chuyển tối thiểu tăng thêm đúng gấp đôi ($H_(k+1) = 2 H_k$).]
  ),
  loigiai: [
    #step([Kiểm tra các giá trị cụ thể])
    - $H_1 = 2^1 - 1 = 1$ (Ý a ĐÚNG).
    - $H_2 = 2^2 - 1 = 3$ (Ý b ĐÚNG).
    - $H_5 = 2^5 - 1 = 32 - 1 = 31$ (Ý c ĐÚNG).
    #step([Xét hệ thức tăng trưởng])
    Ta có $H_(k+1) = 2 H_k + 1$. Do có số $+1$ nên số bước chuyển không phải tăng gấp đôi mà tăng hơn gấp đôi ($2 H_k + 1 != 2 H_k$). Ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Xét bài toán cắt một chiếc bánh pizza hình tròn bởi $n$ nhát cắt thẳng. Gọi $P_n$ là số miếng bánh tối đa nhận được.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("e0f2fe"), stroke: 1.2pt + rgb("0284c7"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("0284c7"))[Số miếng bánh tối đa $P_n = (n^2 + n + 2)/2$])
  })
]],
  (
    True([Với $n = 1$, nhát cắt chia bánh làm $P_1 = 2$ miếng.]),
    True([Với $n = 2$, hai nhát cắt cắt nhau chia bánh làm $P_2 = 4$ miếng.]),
    True([Với $n = 3$, ba nhát cắt đôi một cắt nhau không đồng quy chia bánh làm $P_3 = 7$ miếng.]),
    [Năm nhát cắt thẳng có thể chia chiếc bánh thành tối đa $20$ miếng.]
  ),
  loigiai: [
    #step([Kiểm tra các giá trị nhỏ])
    Áp dụng công thức $P_n = (n^2 + n + 2) / 2$:
    - $P_1 = (1 + 1 + 2) / 2 = 2$ (Ý a ĐÚNG).
    - $P_2 = (4 + 2 + 2) / 2 = 4$ (Ý b ĐÚNG).
    - $P_3 = (9 + 3 + 2) / 2 = 7$ (Ý c ĐÚNG).
    #step([Tính P5])
    $ P_5 = (5^2 + 5 + 2) / 2 = (25 + 5 + 2) / 2 = 32 / 2 = 16 != 20 $ miếng.
    Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Trên mặt phẳng cho $n$ đường tròn phân biệt ở vị trí tổng quát (mỗi cặp đường tròn cắt nhau tại $2$ điểm phân biệt và không có $3$ đường tròn nào cùng đi qua một điểm). Gọi $C_n$ là số miền mặt phẳng tạo thành.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("e0f2fe"), stroke: 1.2pt + rgb("0284c7"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("0284c7"))[Công thức phân chia mặt phẳng bởi đường tròn: $C_n = n^2 - n + 2$])
  })
]],
  (
    True([Một đường tròn chia mặt phẳng thành $2$ miền (miền trong và miền ngoài).]),
    True([Hai đường tròn cắt nhau chia mặt phẳng thành $4$ miền.]),
    True([Ba đường tròn ở vị trí tổng quát chia mặt phẳng thành $8$ miền.]),
    [Bốn đường tròn ở vị trí tổng quát chia mặt phẳng thành $16$ miền.]
  ),
  loigiai: [
    #step([Tính số miền cụ thể])
    Công thức $C_n = n^2 - n + 2$:
    - $C_1 = 1 - 1 + 2 = 2$ (Ý a ĐÚNG).
    - $C_2 = 4 - 2 + 2 = 4$ (Ý b ĐÚNG).
    - $C_3 = 9 - 3 + 2 = 8$ (Ý c ĐÚNG).
    - $C_4 = 16 - 4 + 2 = 14 != 16$.
    Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Tam giác Sierpinski là một hình fractal nổi tiếng. Bắt đầu từ một tam giác đều màu đen ở bước $0$. Ở mỗi bước tiếp theo, chia mỗi tam giác đen thành $4$ tam giác nhỏ bằng nhau rồi xóa bỏ tam giác ở chính giữa (thay bằng màu trắng).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("e0f2fe"), stroke: 1.2pt + rgb("0284c7"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("0284c7"))[Tam giác Sierpinski: mô hình quy nạp Fractal])
  })
]],
  (
    True([Ở bước $0$, số lượng tam giác đen là $1$.]),
    True([Ở bước $1$, sau khi khoét tam giác giữa, còn lại đúng $3$ tam giác đen.]),
    True([Ở bước thứ $n$, số lượng tam giác đen còn lại là $3^n$.]),
    [Tổng diện tích của các tam giác đen không đổi qua các bước.]
  ),
  loigiai: [
    #step([Phân tích quy luật số lượng tam giác])
    - Bước 0: $1 = 3^0$ tam giác đen (Ý a ĐÚNG).
    - Bước 1: Mỗi tam giác sinh ra 3 tam giác đen con, tổng cộng $3^1 = 3$ tam giác (Ý b ĐÚNG).
    - Bước $n$: Số lượng tam giác đen bằng $3^n$ (Ý c ĐÚNG).
    #step([Xét diện tích])
    Ở mỗi bước, diện tích còn lại bằng $3/4$ diện tích bước trước đó.
    Sau $n$ bước, diện tích là $S_n = (3/4)^n S_0$.
    Khi $n -> oo$, diện tích tiến dần về $0$. Diện tích giảm dần chứ không giữ nguyên không đổi. Ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1 (Câu 17)
#tln([Cần thực hiện tối thiểu bao nhiêu bước chuyển đĩa để hoàn thành trò chơi Tháp Hà Nội với $6$ chiếc đĩa?],
    [63],
    loigiai: [
        #step([Áp dụng công thức số bước chuyển])
        $ H_6 = 2^6 - 1 = 64 - 1 = 63 $ bước.
    ]
)

// TLN 2 (Câu 18)
#tln([Cần thực hiện tối thiểu bao nhiêu nhát cắt thẳng để chia một chiếc bánh pizza hình tròn thành ít nhất $22$ miếng?],
    [6],
    loigiai: [
        #step([Thiết lập bất phương trình])
        Số miếng bánh tối đa sau $n$ nhát cắt là:
        $ P_n = (n(n + 1)) / 2 + 1 >= 22 <=> (n(n + 1)) / 2 >= 21 <=> n(n + 1) >= 42 $
        #step([Tìm n nguyên dương nhỏ nhất])
        Vì $6 times 7 = 42$, nên với $n = 6$ ta có $P_6 = (6 times 7)/2 + 1 = 22$.
        Vậy cần tối thiểu $6$ nhát cắt.
    ]
)

// TLN 3 (Câu 19)
#tln([Cho $5$ đường tròn phân biệt trên mặt phẳng. Số giao điểm tối đa có thể có giữa $5$ đường tròn này bằng bao nhiêu?],
    [20],
    loigiai: [
        #step([Tính số giao điểm tối đa])
        $ N = n(n - 1) $
        Với $n = 5$:
        $ N = 5(5 - 1) = 5 times 4 = 20 $
    ]
)

// TLN 4 (Câu 20)
#tln([Hỏi $5$ đường tròn phân biệt ở vị trí tổng quát chia mặt phẳng thành tối đa bao nhiêu miền?],
    [22],
    loigiai: [
        #step([Áp dụng công thức số miền mặt phẳng của đường tròn])
        $ C_n = n^2 - n + 2 $
        Với $n = 5$:
        $ C_5 = 5^2 - 5 + 2 = 25 - 5 + 2 = 22 $
    ]
)

// TLN 5 (Câu 21)
#tln([Nếu một người chuyển mỗi chiếc đĩa mất đúng $1$ giây, thì người đó cần bao nhiêu giây để hoàn thành trò chơi Tháp Hà Nội gồm $10$ chiếc đĩa theo phương án tối ưu?],
    [1023],
    loigiai: [
        #step([Tính số bước chuyển và thời gian])
        Số bước chuyển tối thiểu cho $10$ đĩa:
        $ H_(10) = 2^(10) - 1 = 1024 - 1 = 1023 $ bước.
        Vì mỗi bước mất $1$ giây, tổng thời gian cần là $1023$ giây.
    ]
)

// TLN 6 (Câu 22)
#tln([Tìm số lượng đĩa nhỏ nhất $n$ ($n in NN^*$) trong trò chơi Tháp Hà Nội sao cho số bước chuyển tối thiểu vượt quá $500$ bước.],
    [9],
    loigiai: [
        #step([Thiết lập bất phương trình])
        Yêu cầu:
        $ H_n > 500 <=> 2^n - 1 > 500 <=> 2^n > 501 $
        #step([Tìm lũy thừa của 2])
        - $n = 8: 2^8 = 256 < 501$.
        - $n = 9: 2^9 = 512 > 501$.
        Vậy số lượng đĩa nhỏ nhất là $n = 9$.
    ]
)

] // end make-questions

#make-questions()
