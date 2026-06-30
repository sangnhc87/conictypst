// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 7 Các khái niệm mở đầu",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[vectơ].
- Xác định được điểm đầu, điểm cuối, phương, hướng và độ dài của vectơ.
- Nhận biết được hai vectơ #strong[cùng phương], #strong[ngược hướng],
  #strong[cùng hướng].
- Nhận biết được hai vectơ #strong[bằng nhau].
- Nhận biết được khái niệm #strong[vectơ-không].

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu khái niệm
    vectơ qua sách giáo khoa và video (Hoạt động 1, Hoạt động 2.1).
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm để
    giải quyết các nhiệm vụ học tập, chia sẻ và báo cáo kết quả (Hoạt
    động 2, Hoạt động 3).
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình
    huống thực tế để nhận biết ứng dụng của vectơ, đề xuất giải pháp cho
    các bài tập (Hoạt động 4).
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Hình thành khái niệm
    vectơ từ các tình huống vật lí (lực, dịch chuyển).
  - #strong[Năng lực mô hình hoá toán học:] Sử dụng vectơ để mô tả các
    đại lượng có hướng trong thực tiễn (ví dụ: chuyển động của vật, lực
    kéo).
  - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng định nghĩa
    hai vectơ bằng nhau, cùng phương để giải các bài tập đơn giản.
- #strong[Năng lực số (theo Thông tư 02/2025/TT-BGDĐT):]
  - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
  - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
    tin và nội dung trong môi trường số.
  - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin
    và nội dung này cũng như điều hướng giữa chúng.
  - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực hoàn thành các nhiệm vụ học tập, bài tập
  được giao.
- #strong[Trách nhiệm:] Có trách nhiệm trong hoạt động nhóm, trung thực
  khi báo cáo kết quả.
- #strong[Tư duy mở:] Sẵn sàng tiếp thu ý kiến của bạn bè và điều chỉnh
  cách tiếp cận vấn đề.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính, bảng phụ (hoặc
  bảng tương tác), bộ dụng cụ vẽ hình học, thước kẻ, compa.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - #strong[Video/Hình ảnh] minh hoạ các chuyển động có hướng trong thực
    tế (ví dụ: máy bay cất cánh, kéo co).
  - Phiếu học tập (có sẵn các bài tập luyện tập).
  - Phần mềm vẽ hình học động #strong[GeoGebra] (cho giáo viên và khuyến
    khích học sinh sử dụng).
  - Công cụ lập #strong[Sơ đồ tư duy] trực tuyến (như MindMup, Canva).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
  quyết: Mô tả và tính toán các đại lượng có cả độ lớn và hướng trong
  thực tế.
]
#nd-hd[
  - Giáo viên đặt vấn đề thông qua #strong[tình huống thực tiễn] hoặc
    một #strong[video ngắn] về chuyển động.
  - #strong[Ví dụ:] Một máy bay cất cánh từ điểm A đến điểm B. Để mô tả
    chuyển động này, ta cần biết những yếu tố nào? (Cụ thể: Quãng đường
    bay, hướng bay).
  - Giáo viên yêu cầu học sinh thảo luận cặp đôi để tìm ra sự khác biệt
    giữa các đại lượng chỉ có độ lớn (ví dụ: khối lượng, nhiệt độ) và
    các đại lượng có cả độ lớn và hướng (ví dụ: vận tốc, lực).
]
#sp-hd[
  - Học sinh trả lời được: Để mô tả chuyển động của máy bay cần có
    #strong[độ dài] quãng đường và #strong[hướng] bay.
  - Học sinh nêu được sự khác biệt giữa hai loại đại lượng.
  - Học sinh nhận thấy cần một công cụ toán học để biểu diễn các đại
    lượng có hướng (dẫn đến khái niệm vectơ).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] Giáo viên trình chiếu tình
    huống/video và đặt câu hỏi. (2 phút)
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thảo luận cặp đôi. (5
    phút)
    - #emph[Dự kiến khó khăn:] Học sinh có thể nhầm lẫn giữa hướng và
      phương.
    - #emph[Biện pháp hỗ trợ:] Giáo viên gợi ý bằng cách dùng ví dụ đơn
      giản như: \"Cùng một con đường, xe đi lên hay đi xuống là
      cùng...?\"
  - #strong[Bước 3: Báo cáo, thảo luận:] Giáo viên mời 2-3 cặp đôi trình
    bày kết quả. (2 phút)
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên nhận xét, dẫn dắt
    vào bài học: Để nghiên cứu các đại lượng này, ta cần công cụ toán
    học gọi là #strong[Vectơ]. (1 phút)
  - #strong[Tích hợp năng lực số:] #emph[Không có biểu hiện rõ rệt trong
    hoạt động này.]

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "60 phút")
===== 2.1. Hoạt động thành phần 1: Khái niệm Vectơ (25 phút)
#mt-hd[
  phần: điểm đầu, điểm cuối, phương, hướng, độ dài.
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] Học sinh làm việc với SGK (hoặc tài liệu số).
  - Giáo viên yêu cầu học sinh #strong[đọc] (hoặc #strong[xem video minh
    hoạ] được cung cấp qua link) phần định nghĩa vectơ và các thành phần
    của nó.
  - #strong[Nhiệm vụ 2:] Học sinh quan sát hình vẽ mô tả vectơ
    $accent(A B, ⃗)$ và $accent(B A, ⃗)$.
  - Giáo viên yêu cầu học sinh xác định: điểm đầu, điểm cuối, phương,
    hướng, độ dài của các vectơ này.
  - #strong[Ví dụ:] Cho hai điểm $A\,B$.
    #block[
    #set enum(numbering: "i.", start: 1)
    + Vẽ vectơ $accent(A B, ⃗)$.
    + Vectơ $accent(A B, ⃗)$ được kí hiệu như thế nào? Điểm đầu, điểm
      cuối là gì?
    + Thế nào là #strong[giá] của vectơ? Độ dài của vectơ được kí hiệu
      như thế nào?
    + Giáo viên giới thiệu khái niệm #strong[vectơ-không].
    ]
]
#sp-hd[
  - Học sinh nêu được định nghĩa vectơ là một #strong[đoạn thẳng có
    hướng].
  - Học sinh nhận biết và xác định đúng các thành phần của vectơ
    $accent(A B, ⃗)$ (điểm đầu A, điểm cuối B, phương là đường thẳng AB,
    hướng từ A đến B, độ dài $\|accent(A B, ⃗)\|= A B$).
  - Học sinh hiểu $\|accent(A A, ⃗)\|= 0$.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Giáo viên yêu cầu học sinh tự đọc
    SGK hoặc xem video. (5 phút)
  - #strong[Bước 2: Thực hiện nhiệm vụ (Học sinh làm việc cá nhân):] Học
    sinh ghi chép, tóm tắt khái niệm. (10 phút)
    - #emph[Dự kiến khó khăn:] Học sinh dễ nhầm lẫn giữa \"phương\"
      (đường thẳng chứa vectơ) và \"hướng\" (chiều đi).
    - #emph[Biện pháp hỗ trợ:] Giáo viên dùng ví dụ trực quan trên hình
      vẽ và nhấn mạnh: #strong[Phương] là #strong[đường thẳng],
      #strong[Hướng] là #strong[chiều] đi trên đường thẳng đó.
  - #strong[Bước 3: Báo cáo, thảo luận:] Giáo viên gọi 1-2 học sinh
    trình bày khái niệm. Giáo viên chốt kiến thức, nhấn mạnh ký hiệu và
    các yếu tố của vectơ. (5 phút)
  - #strong[Bước 4: Luyện tập nhanh:] Cho hình bình hành $A B C D$, xác
    định các vectơ có điểm đầu/cuối là các đỉnh A, B, C, D. Xác định độ
    dài $\|accent(A C, ⃗)\|$. (5 phút)
  - #strong[Tích hợp năng lực số:]
    - Giáo viên cung cấp link video/tài liệu số để học sinh tự học (Khai
      thác và xử lý thông tin số).
    - #emph[Biểu hiện:] Học sinh sử dụng thiết bị số (điện thoại/máy
      tính) để truy cập và xem tài liệu.

===== 2.2. Hoạt động thành phần 2: Hai vectơ cùng phương, cùng hướng, bằng nhau (35 phút)
]
#mt-hd[
  vectơ: cùng phương, cùng hướng, ngược hướng, và bằng nhau.
]
#nd-hd[
  - #strong[Nhiệm vụ 1: Khảo sát mối quan hệ phương/hướng.] Giáo viên vẽ
    trên bảng (hoặc dùng phần mềm GeoGebra) bốn vectơ
    $arrow(a)\,arrow(b)\,arrow(c)\,arrow(d)$ trong đó:
    - $arrow(a)\,arrow(b)$ cùng phương, cùng hướng.
    - $arrow(a)\,arrow(c)$ cùng phương, ngược hướng.
    - $arrow(a)\,arrow(d)$ không cùng phương.
  - Giáo viên yêu cầu học sinh #strong[thảo luận nhóm 4] để rút ra định
    nghĩa:
    #block[
    #set enum(numbering: "i.", start: 1)
    + Thế nào là hai vectơ #strong[cùng phương]? (Giá của chúng song
      song hoặc trùng nhau).
    + Thế nào là hai vectơ #strong[cùng hướng/ngược hướng]? (Cùng phương
      và có chiều đi giống/khác nhau).
    ]
  - #strong[Nhiệm vụ 2: Khái niệm hai vectơ bằng nhau.]
  - Giáo viên vẽ hai vectơ $arrow(u)$ và $arrow(v)$ #strong[bằng nhau].
  - Học sinh thảo luận để trả lời: Hai vectơ bằng nhau cần thoả mãn
    những điều kiện nào? (Cùng hướng #strong[và] cùng độ dài).
  - #strong[Ví dụ minh hoạ:] Cho hình bình hành $A B C D$.
    #block[
    #set enum(numbering: "i.", start: 1)
    + Tìm các cặp vectơ cùng phương, ngược hướng. (Ví dụ:
      $accent(A B, ⃗)$ và $accent(C D, ⃗)$ cùng phương, ngược hướng).
    + Tìm các cặp vectơ bằng nhau. (Ví dụ:
      $accent(A D, ⃗) = accent(B C, ⃗)$).
    ]
]
#sp-hd[
  - Các nhóm trình bày được định nghĩa về cùng phương, cùng hướng, ngược
    hướng.
  - Học sinh nêu được điều kiện để hai vectơ $arrow(u)$ và $arrow(v)$
    bằng nhau: $arrow(u)$ và $arrow(v)$ #strong[cùng hướng] và
    $\|arrow(u)\|=\|arrow(v)\|$.
  - Các nhóm hoàn thành bài tập ví dụ về hình bình hành.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ (Nhiệm vụ 1):] Giáo viên trình
    chiếu/vẽ hình và giao nhiệm vụ thảo luận nhóm 4. (5 phút)
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thảo luận nhóm, ghi
    kết quả ra giấy/bảng phụ. (10 phút)
    - #emph[Dự kiến khó khăn:] Học sinh quên điều kiện về độ dài khi
      định nghĩa vectơ bằng nhau.
    - #emph[Biện pháp hỗ trợ:] Giáo viên đặt câu hỏi gợi ý: Hai đoạn
      thẳng bằng nhau có chắc chắn là hai vectơ bằng nhau không?
  - #strong[Bước 3: Báo cáo, thảo luận:] Giáo viên mời đại diện 2 nhóm
    lên bảng trình bày/giải thích kết quả thảo luận. Sử dụng phương pháp
    #strong[Sơ đồ tư duy] nhóm, khuyến khích nhóm vẽ sơ đồ tư duy tóm
    tắt kiến thức vừa học. (10 phút)
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên chuẩn hoá kiến thức,
    nhấn mạnh lại sự khác biệt giữa phương và hướng. (5 phút)
  - #strong[Luyện tập cá nhân:] Cho tam giác đều $A B C$. Tìm các vectơ
    bằng $accent(A B, ⃗)$ có điểm đầu là $C$. (Không có). (5 phút)
  - #strong[Tích hợp năng lực số:]
    - Giáo viên sử dụng #strong[GeoGebra] để minh hoạ trực quan (Tạo và
      tương tác với nội dung số).
    - Khuyến khích học sinh dùng công cụ lập #strong[Sơ đồ tư duy trực
      tuyến] để tóm tắt kiến thức (Tạo và tương tác với nội dung số).
    - #emph[Biểu hiện:] Học sinh trình bày Sơ đồ tư duy điện tử trên máy
      chiếu.

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
  cùng hướng, bằng nhau để giải quyết các bài tập cơ bản.
]
#nd-hd[
  ngắn.
  - #strong[Bài tập 1 (Trắc nghiệm):] Cho ba điểm $A\,B\,C$ thẳng hàng,
    $B$ nằm giữa $A$ và $C$. Các cặp vectơ nào sau đây cùng hướng? (A.
    $accent(A B, ⃗)$ và $accent(C A, ⃗)$\; B. $accent(B C, ⃗)$ và
    $accent(B A, ⃗)$\; C. $accent(A B, ⃗)$ và $accent(B C, ⃗)$\; D.
    $accent(A C, ⃗)$ và $accent(C B, ⃗)$).
  - #strong[Bài tập 2 (Tự luận):] Cho hình chữ nhật $A B C D$ có
    $A B = 3\,B C = 4$.
    #block[
    #set enum(numbering: "i.", start: 1)
    + Tìm các cặp vectơ bằng nhau có điểm đầu/cuối là các đỉnh.
    + Tính độ dài của $accent(A C, ⃗)$ và $\|accent(D B, ⃗)\|$.
    ]
]
#sp-hd[
  bài tập.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Giáo viên phát phiếu học tập/trình
    chiếu bài tập. (1 phút)
  - #strong[Bước 2: Thực hiện nhiệm vụ (Cá nhân làm bài/Nhóm kiểm tra
    chéo):] Học sinh tự làm Bài tập 1 và Bài tập 2. (8 phút)
  - #strong[Bước 3: Báo cáo, thảo luận:]
    - #strong[Trò chơi học tập:] Giáo viên tổ chức trò chơi \"Ai nhanh
      hơn\" (hoặc dùng Quizizz/Kahoot) cho Bài tập 1.
    - Giáo viên mời một học sinh lên bảng giải Bài tập 2. (4 phút)
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên chữa bài, nhận xét
    quá trình làm việc của học sinh, nhấn mạnh cách chứng minh hai vectơ
    bằng nhau. (2 phút)
  - #strong[Tích hợp năng lực số:]
    - Sử dụng Quizizz/Kahoot để kiểm tra nhanh (Khai thác và xử lý thông
      tin số, An toàn và trách nhiệm trong môi trường số - biết sử dụng
      công cụ học tập).

]
#hd("4", "Vận dụng", "5 phút")
#mt-hd[
  vụ vận dụng kiến thức vào thực tiễn.
]
#nd-hd[
  - #strong[Yêu cầu:] Hãy tìm kiếm trong thực tế hoặc các môn học khác
    (Vật lí, Địa lí,...) một ví dụ minh hoạ cho các đại lượng được mô tả
    bằng vectơ (ví dụ: lực, vận tốc, gia tốc, từ trường,...).
  - Yêu cầu học sinh trình bày ví dụ đó dưới dạng #strong[poster điện
    tử] hoặc #strong[PowerPoint] và xác định các yếu tố: điểm đặt,
    phương, hướng, độ lớn.
]
#sp-hd[
  ảnh/video thực tế.
]
#tc-hd[
  - Giáo viên giao nhiệm vụ về nhà và thông báo thời gian nộp/trình bày
    (có thể là tiết học tiếp theo hoặc một buổi sinh hoạt chuyên đề).
  - #strong[Tích hợp năng lực số:]
    - Học sinh sử dụng công cụ thiết kế, trình chiếu (PowerPoint/Canva)
      (Tạo và tương tác với nội dung số).
    - Học sinh tìm kiếm thông tin về ứng dụng của vectơ trên Internet
      (Khai thác và xử lý thông tin số).

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

]
