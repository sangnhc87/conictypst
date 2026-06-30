// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 29 Công thức cộng xác suất",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[biến cố xung khắc].
- Nêu và vận dụng được #strong[Công thức cộng xác suất cho hai biến cố
  xung khắc].
- Nêu và vận dụng được #strong[Công thức cộng xác suất].
- Hiểu được mối liên hệ giữa phép toán hợp biến cố và phép cộng xác
  suất.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù:]
  - Năng lực #strong[Tư duy và lập luận Toán học]: Phân tích được các
    tình huống ngẫu nhiên, lập luận để thiết lập và sử dụng các công
    thức xác suất.
  - Năng lực #strong[Mô hình hóa Toán học]: Mô hình hóa được một số tình
    huống thực tiễn bằng khái niệm biến cố xung khắc, biến cố hợp, và
    công thức cộng xác suất.
  - Năng lực #strong[Giải quyết vấn đề Toán học]: Vận dụng các công thức
    để tính xác suất trong các bài toán cụ thể.
- #strong[Năng lực chung:]
  - Năng lực #strong[Tự chủ và tự học]: Tự giác tìm hiểu kiến thức về
    xác suất, hoàn thành nhiệm vụ được giao.
  - Năng lực #strong[Giao tiếp và hợp tác]: Tích cực làm việc nhóm,
    trình bày ý tưởng và lắng nghe ý kiến của thành viên khác trong
    nhóm.
- #strong[Tích hợp Năng lực số] (theo Thông tư số 02/2025/TT-BGDĐT):
  - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
  - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
    tin và nội dung trong môi trường số.
  - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin
    và nội dung này cũng như điều hướng giữa chúng.
  - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ]: Tích cực tham gia các hoạt động học tập, hoàn thành
  các bài tập được giao.
- #strong[Trung thực]: Thật thà, nghiêm túc trong việc thu thập và tính
  toán kết quả xác suất.
- #strong[Trách nhiệm]: Hoàn thành tốt nhiệm vụ nhóm, có trách nhiệm với
  sản phẩm học tập của mình.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính giáo viên.
- #strong[Học liệu:] Sách giáo khoa Toán 11 (Tập 2), phiếu học tập, các
  câu hỏi/bài tập trắc nghiệm trực tuyến (ví dụ: Google Form, Quizizz),
  bảng phụ/giấy A0, bút dạ, một bộ thẻ ngẫu nhiên (hoặc xúc xắc, đồng
  xu) cho hoạt động Mở đầu.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Mở đầu", "15 phút")
#strong[Tên hoạt động:] #strong[Khám phá xác suất qua trò chơi]

#mt-hd[
Tạo hứng thú, giúp học sinh xác định được vấn đề
  cần giải quyết là #strong[tính xác suất của biến cố hợp] khi biết xác
  suất của các biến cố thành phần.
]
#nd-hd[
Tổ chức trò chơi #strong[\"Rút thăm may mắn\"].
  - Giáo viên chuẩn bị 10 thẻ đánh số từ 1 đến 10.
  - Yêu cầu học sinh rút ngẫu nhiên 1 thẻ.
  - #strong[Ví dụ cụ thể:] Đặt hai biến cố:
    - $A$: \"Rút được thẻ ghi số chẵn\" (tập hợp: ${ 2\,4\,6\,8\,10 }$).
    - $B$: \"Rút được thẻ ghi số có chữ số 1\" (tập hợp: ${ 1\,10 }$).
  - #strong[Nhiệm vụ:] Tính xác suất để xảy ra biến cố $C$:
    \"#strong[Rút được thẻ ghi số chẵn HOẶC số có chữ số 1]\" (tức
    $C = A union B$).
]
#sp-hd[
Câu trả lời dự kiến của học sinh về cách tính
  $P\(A union B\)$ và nhận xét về mối quan hệ giữa $A$ và $B$ (có chung
  phần tử 10).
]
#tc-hd[
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Giao nhiệm vụ (GV):] Trình bày luật chơi và nhiệm vụ cụ thể
    cho cả lớp.
  + #strong[Thực hiện nhiệm vụ (HS):] Học sinh làm việc cá nhân, tính
    $P\(A\)$, $P\(B\)$, và $P\(A union B\)$ theo kiến thức cũ.
  + #strong[Báo cáo, thảo luận (GV tổ chức):] Mời 2-3 học sinh trình bày
    kết quả và cách tính. Giáo viên đặt câu hỏi gợi mở: \"Liệu có công
    thức nào liên hệ $P\(A union B\)$ với $P\(A\)$ và $P\(B\)$ không?\".
  + #strong[Kết luận, nhận định (GV):] Ghi nhận ý kiến, nhấn mạnh vấn đề
    cần giải quyết trong bài học là xây dựng công thức tính
    $P\(A union B\)$.
  ]

  - #strong[Tích hợp Năng lực số:] Học sinh sử dụng #strong[máy tính cầm
    tay] để thực hiện phép tính xác suất và kiểm tra kết quả.
    - #emph[Biểu hiện:] #strong[Khai thác và xử lí thông tin số] (Sử
      dụng công cụ tính toán số học).

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "90 phút")
==== 2.1. Công thức cộng xác suất cho hai biến cố xung khắc (40 phút)
#mt-hd[
Giúp học sinh nắm vững khái niệm #strong[biến cố
  xung khắc] và xây dựng được #strong[Công thức cộng xác suất cho hai
  biến cố xung khắc].
]
#nd-hd[
Học sinh làm việc với SGK và phiếu học tập
  #strong[\(Kĩ thuật Khăn trải bàn)].
  - #strong[Ví dụ cụ thể 1 (Biến cố xung khắc):] Gieo một con xúc xắc
    cân đối.
    - $A$: \"Xuất hiện mặt số chẵn\" (${ 2\,4\,6 }$).
    - $B$: \"Xuất hiện mặt số lẻ\" (${ 1\,3\,5 }$).
    - $C$: \"Xuất hiện mặt số chia hết cho 3\" (${ 3\,6 }$).
  - #strong[Nhiệm vụ 1:]
    - Xác định $A inter B$, $A inter C$.
    - Rút ra định nghĩa #strong[Biến cố xung khắc].
  - #strong[Nhiệm vụ 2:] Tính $P\(A union B\)$ và so sánh với
    $P\(A\)+ P\(B\)$. Từ đó, xây dựng #strong[Công thức cộng xác suất
    cho hai biến cố xung khắc].
]
#sp-hd[
Định nghĩa biến cố xung khắc; Công thức
  $P\(A union B\)= P\(A\)+ P\(B\)$ (với $A\,B$ xung khắc).
]
#tc-hd[
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Giao nhiệm vụ (GV):] Chia nhóm, phát Phiếu học tập (áp dụng
    Kĩ thuật Khăn trải bàn).
  + #strong[Thực hiện nhiệm vụ (HS):] Cá nhân tự nghiên cứu SGK và làm
    bài tập vào phần riêng. Sau đó, trao đổi và thống nhất kết quả vào
    phần chung của nhóm.
  + #strong[Báo cáo, thảo luận (GV tổ chức):] Mời đại diện nhóm trình
    bày kết quả về Biến cố xung khắc và Công thức. Các nhóm khác nhận
    xét.
  + #strong[Kết luận, nhận định (GV):] Chuẩn hóa kiến thức, yêu cầu học
    sinh ghi nhận công thức.
  ]

  - #strong[Tích hợp Năng lực số:] Học sinh sử dụng #strong[máy ảnh điện
    thoại] (hoặc máy ảnh của thiết bị học tập) để chụp lại kết quả làm
    việc nhóm (Khăn trải bàn) và chia sẻ qua nhóm học tập trực tuyến (ví
    dụ: Zalo/Google Classroom).
    - #emph[Biểu hiện:] #strong[Sáng tạo và đổi mới trong môi trường số]
      (Sử dụng công nghệ để trình bày và chia sẻ sản phẩm).

==== 2.2. Công thức cộng xác suất (50 phút)
]
#mt-hd[
Giúp học sinh xây dựng được #strong[Công thức
  cộng xác suất tổng quát] cho hai biến cố bất kì và vận dụng công thức
  để giải quyết vấn đề Mở đầu.
]
#nd-hd[
Học sinh làm việc nhóm #strong[\(Phương pháp Dạy
  học giải quyết vấn đề)].
  - #strong[Ví dụ cụ thể 2:] Trở lại vấn đề Mở đầu: Rút thẻ từ 1 đến 10.
    - $A$: \"Rút được thẻ ghi số chẵn\".
    - $B$: \"Rút được thẻ ghi số có chữ số 1\".
    - Biến cố $A\,B$ #strong[không xung khắc] (vì $A inter B = { 10 }$).
  - #strong[Nhiệm vụ 3:]
    - Vận dụng phép biến đổi Đại số tập hợp để biểu diễn $A union B$
      thành hợp của các biến cố xung khắc:
      $A union B =\(A without B\)union\(A inter B\)union\(B without A\)$.
    - Áp dụng Công thức cộng cho biến cố xung khắc để thiết lập công
      thức tính $P\(A union B\)$ theo $P\(A\)\,P\(B\)\,P\(A inter B\)$.
]
#sp-hd[
Công thức cộng xác suất:
  $P\(A union B\)= P\(A\)+ P\(B\)- P\(A inter B\)$.
]
#tc-hd[
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Giao nhiệm vụ (GV):] Đặt vấn đề từ HĐ1 và giao nhiệm vụ 3.
  + #strong[Thực hiện nhiệm vụ (HS):] Các nhóm thảo luận sâu về cách
    biểu diễn biến cố $A union B$. Giáo viên quan sát, hỗ trợ, gợi ý học
    sinh sử dụng sơ đồ Ven để trực quan hóa.
  + #strong[Báo cáo, thảo luận (GV tổ chức):] Mời nhóm có lời giải tối
    ưu nhất lên trình bày cách thiết lập công thức. Nhóm khác đặt câu
    hỏi phản biện.
  + #strong[Kết luận, nhận định (GV):] Tổng hợp, chuẩn hóa công thức.
    Yêu cầu học sinh so sánh lại với trường hợp xung khắc để thấy được
    tính tổng quát của công thức.
  ]

  - #strong[Tích hợp Năng lực số:] Học sinh sử dụng #strong[phần mềm vẽ
    sơ đồ tư duy] (ví dụ: Canva, Mindmap) hoặc #strong[phần mềm trình
    chiếu] (ví dụ: Google Slides, PowerPoint) để trình bày quá trình lập
    luận và công thức đã thiết lập.
    - #emph[Biểu hiện:] #strong[Sử dụng công nghệ số để học tập và giải
      quyết vấn đề] (Trực quan hóa mô hình và lập luận).

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
Rèn luyện kĩ năng nhận dạng biến cố xung khắc và
  vận dụng thành thạo hai công thức cộng xác suất.
]
#nd-hd[
Hệ thống bài tập đa dạng, tập trung vào việc
  #strong[lựa chọn công thức phù hợp].
  - #strong[Ví dụ cụ thể:] Trong một lớp học, có 40% học sinh giỏi Toán,
    30% học sinh giỏi Lí, và 15% học sinh giỏi cả hai môn. Tính xác suất
    để một học sinh được chọn ngẫu nhiên giỏi ít nhất một trong hai môn
    (Toán hoặc Lí).
]
#sp-hd[
Lời giải chi tiết, chính xác của các bài tập.
  #strong[Sơ đồ tư duy] tóm tắt các công thức đã học và điều kiện áp
  dụng.
]
#tc-hd[
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Giao nhiệm vụ (GV):] Giao bài tập cá nhân và yêu cầu học
    sinh lập Sơ đồ tư duy cá nhân (hoặc nhóm) để tóm tắt kiến thức.
  + #strong[Thực hiện nhiệm vụ (HS):] Học sinh giải bài tập, giáo viên
    quan sát hỗ trợ các khó khăn.
  + #strong[Báo cáo, thảo luận (GV tổ chức):] Mời 1-2 học sinh trình bày
    lời giải. Sau đó, mời một nhóm trình bày Sơ đồ tư duy (thuyết
    trình).
  + #strong[Kết luận, nhận định (GV):] Nhận xét, đánh giá kết quả, đặc
    biệt chú trọng vào việc phân biệt biến cố xung khắc và không xung
    khắc.
  ]

  - #strong[Tích hợp Năng lực số:] Học sinh làm bài tập trắc nghiệm củng
    cố (5 câu) trên nền tảng #strong[Quizizz/Google Form].
    - #emph[Biểu hiện:] #strong[Khai thác và xử lí thông tin số] (Tương
      tác với bài kiểm tra trực tuyến, xem kết quả tức thì).

]
#hd("4", "Vận dụng", "15 phút - Giao nhiệm vụ về nhà")
#mt-hd[
Phát triển năng lực vận dụng kiến thức vào thực
  tiễn, thấy được ý nghĩa của xác suất trong cuộc sống.
]
#nd-hd[
#strong[Nhiệm vụ mở:] Yêu cầu học sinh tìm một
  tình huống/vấn đề trong thực tế có liên quan đến việc tính xác suất
  của biến cố hợp (ví dụ: dự báo thời tiết, khảo sát thị trường, y
  học,...).
  - #strong[Ví dụ cụ thể:] Khảo sát về việc sử dụng hai loại mạng xã hội
    (Facebook và Zalo) trong lớp/trường.
  - #strong[Nhiệm vụ:] Thu thập dữ liệu (khảo sát nhỏ), xác định các
    biến cố, tính xác suất để một học sinh #strong[sử dụng ít nhất một
    trong hai loại mạng xã hội].
]
#sp-hd[
Bài báo cáo #strong[\(powerpoint/video/word)] về
  tình huống thực tế đã chọn, có phân tích các biến cố, dữ liệu thu
  thập, và kết quả tính xác suất (nội dung và hình thức báo cáo đa
  dạng).
]
#tc-hd[
  #block[
  #set enum(numbering: "a.", start: 1)
  + #strong[Giao nhiệm vụ (GV):] Giao nhiệm vụ cho các nhóm thực hiện
    #strong[ngoài giờ học trên lớp]. Quy định thời gian nộp sản phẩm và
    lịch báo cáo.
  + #strong[Hướng dẫn (GV):] Gợi ý các công cụ, nguồn tài liệu số để học
    sinh thực hiện khảo sát và làm báo cáo (Ví dụ: Google Forms để khảo
    sát, Canva/PowerPoint để làm báo cáo).
  + #strong[Trao đổi (GV):] Sẽ tổ chức trao đổi, chia sẻ và đánh giá vào
    thời điểm phù hợp sau.
  ]

  - #strong[Tích hợp Năng lực số:] Học sinh sử dụng #strong[Google
    Forms] để thiết kế và triển khai khảo sát trực tuyến; sử dụng
    #strong[PowerPoint/Video] để thiết kế báo cáo.
    - #emph[Biểu hiện:] #strong[Khai thác và xử lí thông tin số] (Sử
      dụng công cụ khảo sát trực tuyến); #strong[Giao tiếp và hợp tác
      trong môi trường số] (Làm việc nhóm, chia sẻ tài liệu qua nền tảng
      số).

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
