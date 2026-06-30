// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 15 PT ĐT trong KG",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm và xác định được #strong[vectơ chỉ phương] của
  đường thẳng $d$.
- Lập được #strong[phương trình tham số] của đường thẳng $d$ khi biết
  một điểm thuộc $d$ và một vectơ chỉ phương của $d$.
- Lập được #strong[phương trình chính tắc] của đường thẳng $d$ (trong
  trường hợp phù hợp).
- Lập được phương trình đường thẳng đi qua #strong[hai điểm] cho trước.
- Nêu được điều kiện để #strong[hai đường thẳng vuông góc] trong không
  gian.
- Xác định được #strong[vị trí tương đối] giữa hai đường thẳng trong
  không gian (cắt nhau, song song, chéo nhau, trùng nhau).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận Toán học:] Phân tích giả thiết
    để lập luận tìm ra vectơ chỉ phương, thiết lập các dạng phương trình
    đường thẳng.
  - #strong[Năng lực mô hình hóa Toán học:] Vận dụng kiến thức về đường
    thẳng trong không gian để mô tả, giải quyết các bài toán thực tiễn.
  - #strong[Năng lực giải quyết vấn đề Toán học:] Giải các bài toán về
    tìm giao điểm, khoảng cách (liên quan), vị trí tương đối giữa hai
    đường thẳng.
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến thức mới
    qua việc đọc SGK, làm việc nhóm, tự nghiên cứu tài liệu.
  - #strong[Giao tiếp và hợp tác:] Hợp tác hiệu quả để thực hiện các
    nhiệm vụ nhóm, trao đổi, thảo luận để thống nhất kiến thức.
  - #strong[Giải quyết vấn đề và sáng tạo:] Đề xuất được các giải pháp
    giải quyết vấn đề toán học và thực tiễn liên quan.
- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
  - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
    tin và nội dung trong môi trường số.
  - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin
    và nội dung này cũng như điều hướng giữa chúng.
  - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tìm tòi, nghiên cứu tài liệu và hoàn thành
  nhiệm vụ học tập.
- #strong[Trung thực:] Nghiêm túc trong việc thực hiện nhiệm vụ cá nhân
  và nhóm, tôn trọng kết quả thực hành/thí nghiệm.
- #strong[Trách nhiệm:] Hoàn thành các nhiệm vụ được giao, có trách
  nhiệm với kết quả học tập của bản thân và nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:]
  - Máy tính, máy chiếu, bảng phụ, phấn màu.
  - Phần mềm #strong[GeoGebra] (để minh họa đường thẳng, vectơ chỉ
    phương và vị trí tương đối).
  - Phiếu bài tập in sẵn/trình chiếu (cho Hoạt động Luyện tập).
  - Sơ đồ tư duy mẫu về các bước lập phương trình đường thẳng (chuẩn bị
    để trình chiếu sau Hoạt động 2).
- #strong[Học sinh:]
  - Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc sống).
  - Vở ghi, bút, máy tính cầm tay.
  - Điện thoại thông minh/máy tính bảng (có cài đặt phần mềm/ứng dụng hỗ
    trợ học tập như GeoGebra, Padlet, ứng dụng tạo sơ đồ tư duy -
    #strong[Tích hợp NL Số]).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút - Tiết 1")
#mt-hd[
Tạo hứng thú, giúp học sinh huy động kiến thức
  đã học về vectơ trong không gian và nhận ra nhu cầu cần thiết phải
  thiết lập phương trình của đường thẳng để giải quyết các vấn đề hình
  học và thực tiễn.
]
#nd-hd[
  - Giáo viên đặt vấn đề thông qua một tình huống thực tiễn có yếu tố
    không gian, ví dụ:

  - #quote(block: true)[
    #strong[Tình huống mở đầu:] Trong thiết kế không gian kiến trúc hoặc
    mô hình robot, cần xác định chính xác vị trí và hướng di chuyển của
    một cánh tay robot (biểu diễn là một đoạn thẳng $d$) trong hệ tọa độ
    $O x y z$. Làm thế nào để mô tả chính xác đường đi của cánh tay
    robot đó bằng một \"ngôn ngữ\" toán học (phương trình) để máy tính
    có thể xử lí?
    ]

  - Học sinh thảo luận nhóm nhanh (2 phút) về các yếu tố cần thiết để
    xác định một đường thẳng trong không gian (ví dụ: điểm đi qua,
    hướng).
]
#sp-hd[
Câu trả lời của học sinh: Đường thẳng được xác
  định khi biết #strong[một điểm] nó đi qua và #strong[hướng] của nó
  (vectơ chỉ phương). Đây chính là nội dung cần giải quyết trong bài
  học.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Giáo viên trình chiếu/đọc tình huống
    mở đầu, yêu cầu học sinh thảo luận cặp đôi/nhóm nhỏ và ghi ra các
    yếu tố cần thiết để xác định đường thẳng.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thảo luận (Giáo viên
    quan sát, gợi ý: Nhắc lại cách xác định đường thẳng trong mặt
    phẳng/mặt phẳng trong không gian).
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời 1-2 nhóm trình bày nhanh ý
    kiến.
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên chốt lại, dẫn dắt
    vào bài mới: \"Để mô tả chính xác đường thẳng trong không gian, ta
    cần công cụ là #strong[Phương trình đường thẳng]. Bài học này sẽ
    giúp chúng ta xây dựng công cụ đó.\"

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "165 phút - Tiết 1, 2, 3, 4")
Giáo viên tổ chức các hoạt động thành phần dưới hình thức #strong[Học
tập hợp tác], giao nhiệm vụ cho các nhóm sử dụng SGK, thiết bị học tập
và công cụ số (GeoGebra) để tự chiếm lĩnh kiến thức.

===== 2.1. Vectơ chỉ phương của đường thẳng (30 phút - Tiết 1)
#mt-hd[
Học sinh xác định được định nghĩa và tính chất
  của vectơ chỉ phương.
]
#nd-hd[
Học sinh làm việc với SGK và trả lời câu hỏi:
  - #strong[Định nghĩa:] Vectơ chỉ phương $arrow(u)$ của đường thẳng $d$
    là gì?
  - #strong[Tính chất:] Một đường thẳng $d$ có bao nhiêu vectơ chỉ
    phương? Nếu $arrow(u)$ là VTCP thì $k arrow(u)$ ($k eq.not 0$) có là
    VTCP không?
  - #strong[Ví dụ:] Cho đường thẳng $d$ đi qua $A\(1\;2\;3\)$ và song
    song với trục $O x$. Hãy xác định một VTCP của $d$.
]
#sp-hd[
  - Định nghĩa đúng VTCP: là vectơ khác $arrow(0)$ và có giá song song
    hoặc trùng với đường thẳng $d$.
  - VTCP của $d$ song song với $O x$ là $arrow(i) =\(1\;0\;0\)$ hoặc
    $k arrow(i)$.
]
#tc-hd[
Giáo viên giao nhiệm vụ đọc SGK kết hợp
  sử dụng #strong[GeoGebra] để mô phỏng một đường thẳng và các vectơ chỉ
  phương của nó. #strong[\(Tích hợp NL Số: Sáng tạo sản phẩm số - Biểu
  diễn hình học)]

===== 2.2. Phương trình tham số của đường thẳng (35 phút - Tiết 2)
]
#mt-hd[
Học sinh thiết lập được Phương trình tham số
  (PTTS) của đường thẳng.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Cho đường thẳng $d$ đi qua $M_0\(x_0\;y_0\;z_0\)$
    và có vectơ chỉ phương $arrow(u) =\(a\;b\;c\)$. Hãy tìm điều kiện về
    tọa độ của một điểm $M\(x\;y\;z\)$ bất kì thuộc $d$.
  - #strong[Ví dụ:] Lập PTTS của đường thẳng $d$ đi qua điểm
    $A\(2\;- 1\;3\)$ và có VTCP $arrow(u) =\(1\;5\;- 2\)$.
]
#sp-hd[
Công thức PTTS: ${x = x_0 + a t\
  y = y_0 + b t\
  z = z_0 + c t med quad\(t bb(in R\))$ Và PTTS của đường thẳng trong ví
  dụ: ${x = 2 + t\
  y = - 1 + 5 t\
  z = 3 - 2 t med quad\(t bb(in R\))$
]
#tc-hd[
#strong[Dạy học khám phá.] Giáo viên
  gợi ý mối liên hệ giữa $accent(M_0 M, ⃗)$ và $arrow(u)$ (cùng phương)
  để học sinh tự suy luận ra công thức PTTS.

===== 2.3. Phương trình chính tắc của đường thẳng (20 phút - Tiết 2)
]
#mt-hd[
Học sinh xác định được Phương trình chính tắc
  (PTCT) và điều kiện để có PTCT.
]
#nd-hd[
Từ PTTS ở trên, rút tham số $t$ từ mỗi phương
  trình và cho bằng nhau (với điều kiện $a\,b\,c eq.not 0$).
  - #strong[Ví dụ:] Viết PTCT của đường thẳng $d$ đi qua
    $A\(1\;- 2\;4\)$ và có VTCP $arrow(u) =\(3\;1\;- 5\)$.
]
#sp-hd[
Công thức PTCT:
  $frac(x - x_0, a) = frac(y - y_0, b) = frac(z - z_0, c)$ (với
  $a\,b\,c eq.not 0$).
]
#tc-hd[
#strong[Thuyết trình kết hợp vấn đáp]
  để làm rõ điều kiện tồn tại của PTCT (khi $a\,b\,c$ khác 0).

===== 2.4. Lập phương trình đường thẳng đi qua hai điểm (20 phút - Tiết 3)
]
#mt-hd[
Học sinh vận dụng kiến thức VTCP để lập PT đường
  thẳng khi biết hai điểm.
]
#nd-hd[
Cho đường thẳng $d$ đi qua $A\(x_A\;y_A\;z_A\)$
  và $B\(x_B\;y_B\;z_B\)$.
  - #strong[Nhiệm vụ:] Tìm một VTCP của đường thẳng $d$ và viết PTTS của
    $d$.
  - #strong[Ví dụ:] Lập PTTS của đường thẳng $A B$ với $A\(1\;0\;- 1\)$
    và $B\(2\;- 3\;1\)$.
]
#sp-hd[
VTCP chính là
  $accent(A B, ⃗) =\(x_B - x_A\;y_B - y_A\;z_B - z_A\)$.
]
#tc-hd[
#strong[Hoạt động nhóm (Kĩ năng giao
  tiếp, hợp tác).] Các nhóm tự giải quyết nhiệm vụ, sau đó trình bày kết
  quả (thuyết trình).

===== 2.5. Hai đường thẳng vuông góc (30 phút - Tiết 3)
]
#mt-hd[
Học sinh nắm được điều kiện để hai đường thẳng
  vuông góc.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Cho hai đường thẳng $d_1$ có VTCP $arrow(u)_1$ và
    $d_2$ có VTCP $arrow(u)_2$. Phát biểu điều kiện để $d_1 perp d_2$.
  - #strong[Ví dụ:] Xét xem hai đường thẳng sau có vuông góc không:
    $d_1$: ${x = 1 + t\
    y = 2 - t\
    z = 3 + 2 t med$ và $d_2$: ${x = 2 + 2 s\
    y = 3 + 4 s\
    z = 1 - 3 s med$
]
#sp-hd[
  $d_1 perp d_2 arrow.l.r.double arrow(u)_1 dot.op arrow(u)_2 = 0$.
  - Trong ví dụ, $arrow(u)_1 =\(1\;- 1\;2\)$,
    $arrow(u)_2 =\(2\;4\;- 3\)$.
    $arrow(u)_1 dot.op arrow(u)_2 = 1 dot.op 2 +\(- 1\)dot.op 4 + 2 dot.op\(- 3\)= 2 - 4 - 6 = - 8 eq.not 0$.
    Kết luận $d_1$ không vuông góc với $d_2$.
]
#tc-hd[
#strong[Trò chơi học tập (Game hóa -
  Tăng cường hứng thú).] Chia lớp thành các đội, đưa ra 3-4 cặp đường
  thẳng, đội nào tính toán và trả lời nhanh, chính xác nhất về tính
  vuông góc thì thắng.

===== 2.6. Vị trí tương đối giữa hai đường thẳng (30 phút - Tiết 4)
]
#mt-hd[
Học sinh xác định được các trường hợp vị trí
  tương đối và phương pháp xét vị trí tương đối giữa hai đường thẳng.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Xét vị trí tương đối giữa $d_1$ đi qua $M_1$,
    VTCP $arrow(u)_1$ và $d_2$ đi qua $M_2$, VTCP $arrow(u)_2$. Phân
    tích các trường hợp dựa trên mối quan hệ giữa
    $arrow(u)_1\,arrow(u)_2$ và $accent(M_1 M_2, ⃗)$.
    - Song song/Trùng nhau: $arrow(u)_1\,arrow(u)_2$ cùng phương.
    - Cắt nhau/Chéo nhau: $arrow(u)_1\,arrow(u)_2$ không cùng phương.
  - #strong[Ví dụ:] Xét vị trí tương đối của $d_1$ và $d_2$ (giáo viên
    chuẩn bị ví dụ có 4 trường hợp).
]
#sp-hd[
Quy trình xét vị trí tương đối (Sơ đồ tư duy).
]
#tc-hd[
#strong[Phân tích và tổng hợp thông tin
  qua sơ đồ tư duy (Kĩ năng phân tích, tổng hợp).] Giáo viên hướng dẫn
  các nhóm xây dựng Sơ đồ tư duy về các bước xét VTTĐ. Khuyến khích sử
  dụng phần mềm tạo sơ đồ tư duy (#strong[Tích hợp NL Số: Sáng tạo sản
  phẩm số]).

]
#hd("3", "Luyện tập", "30 phút - Tiết 4, 5")
#mt-hd[
Vận dụng thành thạo kiến thức đã học để giải các
  bài tập cơ bản và nâng cao, phát triển kỹ năng tính toán và lập luận.
]
#nd-hd[
Hệ thống bài tập đa dạng, từ cơ bản đến nâng
  cao:
  - #strong[Bài 1 (Cơ bản):] Lập phương trình đường thẳng $d$ đi qua
    $A\(1\;2\;3\)$ và song song với trục $O z$.
  - #strong[Bài 2 (Tổng hợp):] Lập phương trình đường thẳng $Delta$ đi
    qua điểm $A\(1\;- 1\;0\)$, vuông góc với
    $d_1 : frac(x - 2, 1) = frac(y - 1, 2) = frac(z, - 1)$ và cắt
    $d_2 : {x = 1 + s\
    y = 2 s\
    z = 1 - s med$.
  - #strong[Bài 3 (VTTĐ):] Xét vị trí tương đối của $d_1$ và $d_2$.
]
#sp-hd[
Lời giải chi tiết của các bài tập, đặc biệt là
  cách xác định VTCP trong bài tập tổng hợp.
]
#tc-hd[
#strong[Thực hành tại chỗ và chữa bài.]
  Giáo viên giao nhiệm vụ qua phiếu học tập/trình chiếu. Học sinh làm
  việc cá nhân/nhóm. Giáo viên quan sát, hỗ trợ, và chọn một số học
  sinh/nhóm lên bảng trình bày, giải thích (tăng cường kĩ năng thuyết
  trình).

]
#hd("4", "Vận dụng", "15 phút - Tiết 5, giao nhiệm vụ về nhà")
#mt-hd[
Phát triển năng lực vận dụng kiến thức, kĩ năng
  vào thực tiễn, củng cố sự hứng thú và hiểu biết sâu sắc về vai trò của
  Toán học.

]
#nd-hd[
Học sinh phát hiện/đề xuất vấn đề/tình huống
  thực tiễn có liên quan đến đường thẳng trong không gian.

- #quote(block: true)[
  #strong[Nhiệm vụ Vận dụng:] #strong[Thiết kế mô hình 3D:] Sử dụng phần
  mềm #strong[GeoGebra 3D] hoặc các công cụ thiết kế 3D khác
  (#strong[Tích hợp NL Số: Sáng tạo sản phẩm số]) để mô hình hóa một vật
  thể có các đường thẳng (ví dụ: giàn giáo, một phần của cầu, đường bay
  của máy bay, cánh tay robot). #strong[Yêu cầu:] Gán tọa độ cho các
  đường thẳng đó, viết phương trình đường thẳng mô tả các thành phần
  chính và giải thích ứng dụng của các phương trình này trong thực tế
  (ví dụ: kiểm tra tính song song/vuông góc của các thanh đỡ, tính toán
  giao điểm).
  ]

]
#sp-hd[
Bài báo cáo (có thể là bài viết, video clip,
  hoặc trình chiếu) mô tả tình huống thực tiễn, kèm theo các phương
  trình đường thẳng đã lập và giải pháp giải quyết vấn đề.
]
#tc-hd[
#strong[Giao nhiệm vụ về nhà.]
  - Giáo viên giao nhiệm vụ, hướng dẫn cách tìm kiếm tài liệu (sử dụng
    công cụ tìm kiếm, thư viện số - #strong[Tích hợp NL Số: Khai thác
    thông tin]) và cách thức làm báo cáo.
  - Học sinh thực hiện ngoài giờ học trên lớp và nộp báo cáo (dạng số)
    vào buổi học tiếp theo để trao đổi, chia sẻ và đánh giá.

#figure(
  align(center)[#table(
    columns: (45.34%, 45.62%),
    align: (auto,auto,),
    table.header(table.cell(align: center)[#strong[DUYỆT KHBD CỦA
      BGH]], table.cell(align: center)[#strong[DUYỆT KHBD CỦA TỔ KHTN]],),
    table.hline(),
  )]
  , kind: table
  )

]
