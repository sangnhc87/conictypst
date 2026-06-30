// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 17 Hàm số liên tục",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
+ #strong[Về kiến thức:]

  - Nêu được định nghĩa #strong[hàm số liên tục tại một điểm] và
    #strong[hàm số liên tục trên một khoảng].
  - Nhận biết được một số tính chất cơ bản của hàm số liên tục.
  - Vận dụng định nghĩa để xét tính liên tục của hàm số tại một điểm,
    trên một khoảng.
  - Áp dụng tính chất cơ bản để xét tính liên tục và giải một số bài
    toán liên quan đến giá trị trung gian.

+ #strong[Về năng lực:]

  - #strong[Năng lực chung:]
    - #strong[Tự chủ và tự học:] Chủ động, tích cực tìm hiểu kiến thức
      về hàm số liên tục thông qua sách giáo khoa, học liệu được cung
      cấp.
    - #strong[Giao tiếp và hợp tác:] Tích cực tham gia thảo luận nhóm,
      trình bày ý kiến, hợp tác để hoàn thành nhiệm vụ học tập.
  - #strong[Năng lực đặc thù môn học (Năng lực toán học):]
    - #strong[Năng lực tư duy và lập luận toán học:] Thực hiện các bước
      lập luận để xét tính liên tục của hàm số.
    - #strong[Năng lực mô hình hóa toán học:] Mô tả khái niệm liên tục
      của hàm số bằng đồ thị.
    - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng kiến thức
      hàm số liên tục để giải các bài tập tìm tham số, chứng minh phương
      trình có nghiệm.
  - #strong[Năng lực số (Thông tư 02/2025/TT-BGDĐT):]
    - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
    - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp
      nhất cho một bối cảnh cụ thể.

+ #strong[Về phẩm chất:]

  - #strong[Chăm chỉ:] Tích cực tìm tòi, sáng tạo trong học tập, hoàn
    thành các nhiệm vụ được giao.
  - #strong[Trung thực:] Thẳng thắn, nghiêm túc báo cáo kết quả thực
    hiện nhiệm vụ, tôn trọng kết quả của cá nhân và tập thể.
  - #strong[Trách nhiệm:] Có trách nhiệm với hoạt động nhóm, hoàn thành
    tốt nhiệm vụ được phân công.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính giáo viên, phòng học có
  kết nối internet.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Tập 2, Kết nối tri thức với cuộc sống).
  - Phiếu học tập (in sẵn hoặc dạng điện tử).
  - Phần mềm vẽ đồ thị hàm số (ví dụ: GeoGebra, Desmos) để minh họa.
  - Tài liệu tham khảo về các ví dụ thực tiễn liên quan đến hàm số liên
    tục (ví dụ: tốc độ, quãng đường, sự thay đổi nhiệt độ).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#strong[a) Mục tiêu:] Tạo hứng thú, giúp học sinh nhận biết được sự khác
biệt giữa hàm số liên tục và không liên tục thông qua đồ thị, từ đó đặt
ra vấn đề cần giải quyết trong bài học.

#strong[b) Nội dung:]

- Giáo viên trình chiếu hình ảnh đồ thị của hai hàm số khác nhau. \*
  #strong[Ví dụ 1 (Hàm liên tục):] Đồ thị hàm số $y = x^2$.
  - #strong[Ví dụ 2 (Hàm gián đoạn):] Đồ thị hàm số
    $y = frac(x^2 - 1, x - 1)$ tại $x = 1$.
- #strong[Nhiệm vụ:] Học sinh quan sát, thảo luận nhóm đôi và nhận xét
  về đặc điểm của đồ thị: \"Đồ thị nào có thể vẽ được mà không cần nhấc
  bút lên? Sự khác biệt giữa hai đồ thị này là gì?\".

#strong[c) Sản phẩm:]

- Nhận xét của học sinh về đồ thị: Đồ thị 1 \"liền nét\", đồ thị 2 \"bị
  đứt đoạn/có lỗ hổng\".
- Xác định được vấn đề: Cần có một khái niệm toán học để mô tả tính chất
  \"liền nét\" (liên tục) của hàm số.

#strong[d) Tổ chức thực hiện:]

- #strong[Bước 1: Giao nhiệm vụ học tập:] Giáo viên trình chiếu hai đồ
  thị và nêu nhiệm vụ.
- #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh quan sát đồ thị và thảo
  luận nhóm đôi (2 phút). Giáo viên theo dõi, hỗ trợ gợi ý (ví dụ: dùng
  tay vẽ theo đường cong).
- #strong[Bước 3: Báo cáo, thảo luận:] Mời 2-3 nhóm trình bày nhận xét.
- #strong[Bước 4: Kết luận, nhận định:] Giáo viên ghi nhận ý kiến, chính
  thức đặt vấn đề: Khái niệm #strong[Hàm số liên tục] sẽ giúp chúng ta
  giải thích sự khác biệt này.

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "60 phút")
#strong[2.1. Hoạt động thành phần 2.1: Hàm số liên tục tại một điểm (25
phút)]

#mt-hd[
Nắm vững định nghĩa #strong[hàm số liên tục tại
  một điểm] thông qua giới hạn và giá trị hàm số, áp dụng để xét tính
  liên tục.
]
#nd-hd[
  - Nghiên cứu sách giáo khoa (Đọc/Xem) về định nghĩa và điều kiện để
    hàm số $f\(x\)$ liên tục tại $x_0$.
  - Thảo luận nhóm để rút ra điều kiện liên tục (phải xác định tại
    $x_0$, phải tồn tại $lim_(x arrow.r x_0) f\(x\)$, và
    $lim_(x arrow.r x_0) f\(x\)= f\(x_0\)$).
  - #strong[Ví dụ minh họa:] Xét tính liên tục của hàm số
    $f\(x\)= {frac(x^2 - 4, x - 2) & upright("khi ") x eq.not 2\
    4 & upright("khi ") x = 2 med$ tại $x_0 = 2$.
]
#sp-hd[
  - Định nghĩa hàm số liên tục tại $x_0$: $f\(x\)$ liên tục tại
    $x_0 arrow.l.r.double lim_(x arrow.r x_0) f\(x\)= f\(x_0\)$.
  - Lời giải chi tiết cho ví dụ minh họa: $f\(2\)= 4$\;
    $lim_(x arrow.r 2) f\(x\)= lim_(x arrow.r 2)\(x + 2\)= 4$. Vậy,
    $lim_(x arrow.r 2) f\(x\)= f\(2\)arrow.r.double$ Hàm số liên tục tại
    $x_0 = 2$.
]
#tc-hd[
  - Thực hiện theo 4 bước tổ chức hoạt động học tập: Giao nhiệm vụ
    (nghiên cứu SGK), Thực hiện nhiệm vụ (nhóm thảo luận), Báo cáo
    (trình bày kết quả, giải ví dụ), Kết luận (Giáo viên chuẩn hóa kiến
    thức).

#strong[2.2. Hoạt động thành phần 2.2: Hàm số liên tục trên một khoảng
(15 phút)]

]
#mt-hd[
Nắm được khái niệm #strong[hàm số liên tục trên
  một khoảng] (khoảng mở, đoạn, nửa khoảng).
]
#nd-hd[
  - Nghiên cứu SGK để định nghĩa hàm số liên tục trên $\(a\;b\)$,
    $\[a\;b\]$, $\(a\;b\]$, $\[a\;b\)$.
  - Nhận biết tính liên tục của các hàm số sơ cấp (đa thức, hữu tỉ,
    lượng giác) trên tập xác định của chúng.
  - #strong[Ví dụ minh họa:] Xét tính liên tục của hàm số
    $f\(x\)= x^3 - 2 x + 1$ trên $bb(R)$.
]
#sp-hd[
  - Phát biểu định nghĩa hàm số liên tục trên khoảng/đoạn.
  - Kết quả ví dụ: Hàm đa thức $f\(x\)= x^3 - 2 x + 1$ liên tục trên
    $bb(R)$ (hoặc bất kì khoảng nào) vì mọi hàm đa thức đều liên tục
    trên $bb(R)$.
]
#tc-hd[
  - #strong[Tích hợp năng lực số:] Giáo viên yêu cầu học sinh sử dụng
    phần mềm vẽ đồ thị (GeoGebra/Desmos) để vẽ đồ thị hàm số đa thức và
    nhận xét nhanh về tính liên tục của nó trên tập xác định.

#strong[2.3. Hoạt động thành phần 2.3: Một số tính chất cơ bản (20
phút)]

]
#mt-hd[
Nắm được tính chất về tổng, hiệu, tích, thương
  của hàm số liên tục và định lí giá trị trung gian (định lí Bôn-da-nô).
]
#nd-hd[
  - Học sinh làm việc cá nhân/nhóm để đọc SGK và tóm tắt các tính chất
    (T1, T2) và #strong[Định lí giá trị trung gian] (Định lí Bôn-da-nô).
  - #strong[Ví dụ minh họa:] Chứng minh rằng phương trình
    $x^3 + x - 1 = 0$ có ít nhất một nghiệm trong khoảng $\(0\;1\)$.
]
#sp-hd[
  - Tóm tắt các tính chất về hàm số liên tục (tổng, hiệu, tích, thương).
  - Trình bày chứng minh cho ví dụ minh họa:
    - $f\(x\)= x^3 + x - 1$ là hàm đa thức, liên tục trên $bb(R)$, nên
      liên tục trên đoạn $\[0\;1\]$.
    - $f\(0\)= - 1 < 0$.
    - $f\(1\)= 1^3 + 1 - 1 = 1 > 0$.
    - Vì $f\(0\)dot.op f\(1\)< 0$, theo Định lí giá trị trung gian,
      phương trình $f\(x\)= 0$ có ít nhất một nghiệm trong $\(0\;1\)$.
]
#tc-hd[
  - Giáo viên chú trọng vào việc hướng dẫn học sinh vận dụng định lí
    Bôn-da-nô để chứng minh phương trình có nghiệm, đây là một ứng dụng
    quan trọng.

]
#hd("3", "Luyện tập", "15 phút")
#strong[a) Mục tiêu:] Vận dụng kiến thức đã học để củng cố kỹ năng xét
tính liên tục và sử dụng tính chất để giải bài tập.

#strong[b) Nội dung:] Hệ thống các câu hỏi, bài tập được giao theo hình
thức #strong[Trò chơi học tập] (Đố vui/Giải mã).

- #strong[Bài tập 1 (Xét tính liên tục):] Cho hàm số
  $g\(x\)= {frac(x^2 - 3 x + 2, x - 2) & upright("khi ") x eq.not 2\
  m & upright("khi ") x = 2 med$. Tìm $m$ để hàm số liên tục tại
  $x = 2$.
- #strong[Bài tập 2 (Vận dụng tính chất):] Xét tính liên tục của hàm số
  $h\(x\)= frac(x + 1, x^2 - 4)$.

#strong[c) Sản phẩm:] Đáp án và lời giải chi tiết của các bài tập:

- #strong[Bài tập 1:] Cần $lim_(x arrow.r 2) g\(x\)= g\(2\)$. Ta có
  $lim_(x arrow.r 2) g\(x\)= lim_(x arrow.r 2)\(x - 1\)= 1$. Mà
  $g\(2\)= m$. Vậy $m = 1$.
- #strong[Bài tập 2:] Hàm số phân thức, liên tục trên tập xác định. Tập
//   xác định $bb(D = R without { -) 2\;2 }$. Hàm số liên tục trên các ]
  khoảng $\(- oo\;- 2\)$, $\(- 2\;2\)$, $\(2\;+ oo\)$.

#strong[d) Tổ chức thực hiện:]

- Giáo viên chia lớp thành các nhóm nhỏ (4-5 học sinh). Giao nhiệm vụ
  cho các nhóm giải quyết các bài tập theo hình thức thi đua.
- #strong[Tích hợp năng lực số:] Khuyến khích học sinh sử dụng máy tính
  bỏ túi hoặc công cụ trực tuyến để kiểm tra nhanh kết quả giới hạn.
- Giáo viên theo dõi, hướng dẫn hỗ trợ các nhóm gặp khó khăn. Mời đại
  diện nhóm lên trình bày lời giải.

#hd("4", "Vận dụng", "5 phút")
#strong[a) Mục tiêu:] Phát triển năng lực vận dụng kiến thức, kĩ năng
vào thực tiễn cuộc sống (thực hiện ngoài giờ học).

#strong[b) Nội dung:] #strong[Nhiệm vụ về nhà - Sơ đồ tư duy và Bài toán
thực tiễn.]

- #strong[Yêu cầu 1 (Sơ đồ tư duy):] Học sinh tóm tắt toàn bộ kiến thức
  về \"Hàm số liên tục\" (định nghĩa tại điểm, trên khoảng, các tính
  chất) bằng một #strong[sơ đồ tư duy] trên giấy hoặc sử dụng công cụ số
  (ví dụ: Canva, MindMeister).
- #strong[Yêu cầu 2 (Bài toán thực tiễn):] Tìm hiểu một ví dụ thực tế
  (trong vật lí, kinh tế,...) về một đại lượng được mô tả bằng
  #strong[hàm số liên tục] và một đại lượng được mô tả bằng #strong[hàm
  số gián đoạn].
  - #emph[Ví dụ gợi ý:] Sự thay đổi nhiệt độ theo thời gian (liên tục)
    so với giá cước taxi theo quãng đường (gián đoạn).

#strong[c) Sản phẩm:]

- Bản báo cáo (trên giấy hoặc file điện tử) của cá nhân/nhóm về sơ đồ tư
  duy và ví dụ thực tiễn.

#strong[d) Tổ chức thực hiện:]

- Giáo viên giao nhiệm vụ chi tiết và yêu cầu học sinh thực hiện
  #strong[ngoài giờ học trên lớp].
- Thu và đánh giá sản phẩm vào buổi học tiếp theo (có thể cho một số học
  sinh trình bày, chia sẻ sản phẩm tốt để tăng cường kĩ năng giao tiếp
  và thuyết trình).

#figure(
  align(center)[#table(
    columns: (32.22%, 45.62%),
    align: (auto,auto,),
    table.header(table.cell(align: left)[], table.cell(align: center)[Duyệt
      Kế hoạch bài dạy

      của tổ Khoa học tự nhiên

      Ngày \...... tháng \...... năm \......

      ],),
    table.hline(),
  )]
  , kind: table
  )

