// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 12 ĐT song song với MP",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nắm vững định nghĩa và kí hiệu về #strong[đường thẳng song song với
  mặt phẳng] (d /\/ $\(P\)$).
- Nắm vững #strong[điều kiện để đường thẳng song song với mặt phẳng].
- Nắm vững #strong[tính chất] của đường thẳng song song với mặt phẳng,
  đặc biệt là tính chất về giao tuyến song song.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung]:
  - #strong[Năng lực tự chủ và tự học]: Tự giác tìm tòi, nghiên cứu các
    kiến thức cơ bản về quan hệ song song giữa đường thẳng và mặt phẳng
    thông qua sách giáo khoa, học liệu số.
  - #strong[Năng lực giao tiếp và hợp tác]: Tích cực tham gia thảo luận
    nhóm, trình bày, bảo vệ ý kiến của mình, hợp tác hiệu quả trong hoạt
    động nhóm để hoàn thành nhiệm vụ học tập.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo]: Phân tích, tổng hợp
    thông tin để giải quyết các bài toán chứng minh đường thẳng song
    song với mặt phẳng.
- #strong[Năng lực đặc thù môn học]:
  - #strong[Năng lực tư duy và lập luận toán học]: Nhận biết và chứng
    minh được đường thẳng song song với mặt phẳng. Thiết lập được mối
    quan hệ giữa đường thẳng song song với mặt phẳng và các khái niệm
    liên quan.
  - #strong[Năng lực mô hình hóa toán học]: Vận dụng kiến thức vào việc
    mô tả, giải quyết các vấn đề thực tiễn có liên quan đến quan hệ song
    song trong không gian.
- #strong[Năng lực số] (Theo Thông tư số 02/2025/TT-BGDĐT):
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ]: Có tinh thần tự học, tìm tòi và hoàn thành tốt các
  nhiệm vụ học tập được giao.
- #strong[Trung thực]: Trung thực trong việc báo cáo kết quả làm việc
  nhóm và kết quả giải bài tập.
- #strong[Trách nhiệm]: Có ý thức xây dựng bài, nghiêm túc thực hiện
  nhiệm vụ nhóm, biết chịu trách nhiệm về sản phẩm học tập của bản thân
  và nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học]: Máy chiếu, máy tính, phiếu học tập.
- #strong[Học liệu]:
  - Sách giáo khoa Toán 11 (bộ Kết nối tri thức với cuộc sống).
  - Các mô hình trực quan về hình học không gian (khối hộp, kim tự tháp)
    để minh họa quan hệ song song.
  - Phiếu bài tập, video minh họa khái niệm đường thẳng song song với
    mặt phẳng.
  - Phần mềm vẽ hình học không gian (ví dụ: GeoGebra 3D) để minh họa.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "Khởi động")
#mt-hd[
Giúp học sinh xác định được vấn đề cần giải
  quyết: Nhận biết và thiết lập quan hệ song song giữa đường thẳng và
  mặt phẳng trong không gian.
]
#nd-hd[
#strong[Tình huống gợi mở]:
  - Giáo viên đặt câu hỏi: Trong thực tế, các em thường thấy các vật thể
    nào có hình ảnh đường thẳng và mặt phẳng song song với nhau? \*
    #strong[Nhiệm vụ]: Quan sát hình ảnh thực tế (như sàn nhà và thanh
    sắt thẳng đứng của lan can, mép bàn và mặt đất) và mô tả bằng lời
    xem đường thẳng và mặt phẳng có vị trí tương đối như thế nào, và dự
    đoán điều kiện để đường thẳng song song với mặt phẳng.
]
#sp-hd[
  - Mô tả bằng lời các vị trí tương đối giữa đường thẳng và mặt phẳng
    trong không gian (cắt, nằm trong, song song).
  - Phát biểu dự đoán ban đầu về điều kiện để đường thẳng song song với
    mặt phẳng.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ]: Giáo viên trình chiếu hình ảnh thực
    tế, yêu cầu học sinh thảo luận cặp đôi (3 phút) và ghi kết quả ra
    nháp.
  - #strong[Bước 2: Thực hiện nhiệm vụ]: Học sinh quan sát, thảo luận.
    Giáo viên theo dõi, gợi ý: \"Hai đối tượng đó có điểm chung nào
    không?\".
  - #strong[Bước 3: Báo cáo, thảo luận]: Gọi 2-3 cặp trình bày kết quả.
    Giáo viên ghi nhận các ý kiến, đặc biệt là ý kiến về \"không có điểm
    chung\".
  - #strong[Bước 4: Kết luận, nhận định]: Giáo viên dẫn dắt vào bài học:
    Vị trí đường thẳng và mặt phẳng không có điểm chung được gọi là
    #strong[song song]. Hôm nay chúng ta sẽ tìm hiểu kĩ hơn về khái niệm
    này và các tính chất liên quan.
  - #strong[Tích hợp năng lực số]: Học sinh có thể sử dụng điện thoại
    (nếu cho phép) để tìm kiếm nhanh một số hình ảnh thực tế khác minh
    họa quan hệ song song (Biểu hiện: #strong[Sử dụng và quản lí thông
    tin số]).

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "Nghiên cứu kiến thức")
==== 2.1. Hoạt động thành phần 2.1: Đường thẳng song song với mặt phẳng
#mt-hd[
Hình thành định nghĩa và điều kiện cần và đủ để
  đường thẳng song song với mặt phẳng.
]
#nd-hd[
  - #strong[Nhiệm vụ]: Nghiên cứu Sách giáo khoa (SGK), thảo luận nhóm
    (4 người) để:
    - Nêu #strong[định nghĩa] đường thẳng song song với mặt phẳng.
    - Phát biểu #strong[Định lí 1] (Điều kiện để đường thẳng song song
      với mặt phẳng).
    - Trình bày nội dung vào #strong[sơ đồ tư duy] trên giấy A3 hoặc sử
      dụng phần mềm Mindmap (Ví dụ: Canva, MindMeister). \* #strong[c)
      Sản phẩm]:
  - Định nghĩa: $d\/\/\(P\)arrow.l.r.double d inter\(P\)= diameter$.
  - Định lí 1: Nếu đường thẳng $d$ không nằm trong mặt phẳng $\(P\)$ và
    $d$ song song với một đường thẳng $a$ nằm trong $\(P\)$, thì $d$
    song song với $\(P\)$.
  - Sơ đồ tư duy tóm tắt nội dung chính của phần này.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ]: Chia nhóm, phát giấy A3 (hoặc hướng
    dẫn sử dụng công cụ Mindmap). Yêu cầu nghiên cứu SGK và hoàn thành
    sơ đồ tư duy trong 10 phút.
  - #strong[Bước 2: Thực hiện nhiệm vụ]: Các nhóm thảo luận, vẽ/thiết kế
    sơ đồ tư duy. Giáo viên quan sát, gợi ý, hỗ trợ.
  - #strong[Bước 3: Báo cáo, thảo luận]: Mời 1-2 nhóm trình bày sơ đồ tư
    duy. Các nhóm khác nhận xét, bổ sung.
  - #strong[Bước 4: Kết luận, nhận định]: Giáo viên chuẩn hóa kiến thức,
    chốt lại Định lí 1.
  - #strong[Ví dụ minh họa]: Cho tứ diện $A B C D$. Gọi $M\,N$ lần lượt
    là trung điểm của $A B$ và $A C$. Chứng minh $M N\/\/\(B C D\)$.
    (Gợi ý: Sử dụng Định lí đường trung bình để có $M N\/\/B C$, rồi áp
    dụng Định lí 1).
  - #strong[Tích hợp năng lực số]: Các nhóm sử dụng công cụ trực tuyến
    để vẽ sơ đồ tư duy (Biểu hiện: #strong[Vận dụng công nghệ số]).

==== 2.2. Hoạt động thành phần 2.2: Tính chất của đường thẳng song song với mặt phẳng
]
#mt-hd[
Nắm vững #strong[Tính chất 1] (hay Định lí 2) về
  giao tuyến song song.
]
#nd-hd[
  - #strong[Nhiệm vụ]: Nghiên cứu SGK, thảo luận nhóm để phát biểu
    #strong[Tính chất 1] (Định lí 2) và phân tích vai trò của nó trong
    việc giải toán.
  - #strong[Thử thách]: Làm thế nào để chứng minh được một đường thẳng
    song song với một mặt phẳng và #emph[qua nó] ta xác định được giao
    tuyến?
]
#sp-hd[
  - Phát biểu Tính chất 1: Nếu đường thẳng $a$ song song với mặt phẳng
    $\(P\)$, và mặt phẳng $\(Q\)$ chứa $a$ cắt $\(P\)$ theo giao tuyến
    $b$, thì $b$ song song với $a$.
  - Phân tích: Tính chất này cho phép suy ra quan hệ song song giữa hai
    đường thẳng khi đã có một đường thẳng song song với một mặt phẳng.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ]: Yêu cầu học sinh nghiên cứu độc lập
    (3 phút) và sau đó thảo luận nhóm (5 phút) để phát biểu tính chất và
    đưa ra ứng dụng chính của nó.
  - #strong[Bước 2: Thực hiện nhiệm vụ]: Học sinh nghiên cứu và thảo
    luận. Giáo viên dùng mô hình trực quan để minh họa Tính chất 1. \*
    #strong[Bước 3: Báo cáo, thảo luận]: Mời đại diện một nhóm lên bảng
    trình bày.
  - #strong[Bước 4: Kết luận, nhận định]: Giáo viên chốt kiến thức: Tính
    chất này là công cụ mạnh mẽ để tìm giao tuyến song song với một
    đường thẳng cho trước.
  - #strong[Ví dụ minh họa]: Cho hình chóp $S . A B C D$ có đáy
    $A B C D$ là hình bình hành. Gọi $M$ là trung điểm của $S C$. Chứng
    minh $A D\/\/\(S B C\)$ và tìm giao tuyến của mặt phẳng $\(A D M\)$
    và $\(S B C\)$. (Gợi ý: Do
    $A D\/\/B C subset\(S B C\)arrow.r.double A D\/\/\(S B C\)$. Gọi $I$
    là giao tuyến, $I$ phải song song với $A D$ và $B C$).

]
#hd("3", "Luyện tập", "Trò chơi học tập: Tiếp sức")
#mt-hd[
Củng cố kiến thức đã học, rèn luyện kĩ năng vận
  dụng định nghĩa, điều kiện và tính chất đường thẳng song song với mặt
  phẳng.
]
#nd-hd[
#strong[Trò chơi \"Tiếp sức\"] với hệ thống bài
  tập trắc nghiệm và tự luận ngắn.
  - #strong[Bài tập 1 (Trắc nghiệm)]: Cho hình chóp $S . A B C D$ có đáy
    $A B C D$ là hình thang ($A B\/\/C D$). $A B$ không song song với
    $\(S C D\)$. Đúng hay sai? (Đáp án: Đúng, vì nếu $A B\/\/\(S C D\)$
    thì $A B\/\/C D$ (giao tuyến) $arrow.r$ Vô lí vì đã cho
    $A B\/\/C D$).
  - #strong[Bài tập 2 (Tự luận ngắn)]: Cho hình chóp $S . A B C D$. $E$
    là trung điểm $A B$. Tìm giao tuyến của $\(S C D\)$ và $\(S C E\)$.
    (Đáp án: Giao tuyến là đường thẳng qua $S$ và song song với $C D$,
    $C E$).
]
#sp-hd[
Đáp án và lời giải đúng của các câu hỏi, bài
  tập.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ]: Chia lớp thành 4-5 đội. Các câu hỏi
    được đánh số và lần lượt chiếu lên màn hình.
  - #strong[Bước 2: Thực hiện nhiệm vụ]: Học sinh làm bài theo hình thức
    tiếp sức (mỗi người làm một bước/một câu, truyền phiếu cho người
    tiếp theo). Thời gian 10 phút. Giáo viên quan sát, hỗ trợ nếu có khó
    khăn.
  - #strong[Bước 3: Báo cáo, thảo luận]: Kết thúc thời gian, các nhóm
    nộp bài. Giáo viên chiếu đáp án và lời giải chi tiết. Các nhóm tự
    chấm chéo hoặc giáo viên công bố điểm.
  - #strong[Bước 4: Kết luận, nhận định]: Tuyên dương nhóm thắng cuộc.
    Giáo viên nhận xét chung về các lỗi sai thường gặp.
  - #strong[Tích hợp năng lực số]: Giáo viên sử dụng phần mềm tạo trò
    chơi (ví dụ: Kahoot, Quizizz) để tổ chức trò chơi, học sinh dùng
    thiết bị cá nhân để tham gia (Biểu hiện: #strong[Sử dụng và quản lí
    thông tin số] và #strong[Vận dụng công nghệ số]).

]
#hd("4", "Vận dụng", "Nhiệm vụ về nhà")
#mt-hd[
Phát triển năng lực vận dụng kiến thức, kĩ năng
  vào thực tiễn, khuyến khích sự sáng tạo.
]
#nd-hd[
  - #strong[Nhiệm vụ]: Quan sát, chụp ảnh hoặc quay video về một vật
    thể/kiến trúc trong cuộc sống thực tế (nhà cửa, cầu, đồ vật,...) có
    hình ảnh của #strong[đường thẳng song song với mặt phẳng].
  - #strong[Yêu cầu]: Mô tả và giải thích tại sao đó là quan hệ song
    song (dựa trên kiến thức đã học).
]
#sp-hd[
Báo cáo dưới hình thức #strong[ảnh kèm chú
  thích] hoặc #strong[video thuyết minh ngắn] (tối đa 2 phút), nộp qua
  email hoặc nền tảng học tập của trường.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ]: Giáo viên giao nhiệm vụ cụ thể và
    yêu cầu về hình thức sản phẩm (thực hiện ngoài giờ học).
  - #strong[Bước 2: Thực hiện nhiệm vụ]: Học sinh tự chủ tìm kiếm, thực
    hiện và hoàn thành báo cáo.
  - #strong[Bước 3: Báo cáo, thảo luận]: Giáo viên thu thập sản phẩm.
    Một số báo cáo tiêu biểu sẽ được trình chiếu, trao đổi, chia sẻ và
    đánh giá vào đầu tiết học tiếp theo.
  - #strong[Tích hợp năng lực số]: Học sinh sử dụng camera của điện
    thoại/máy tính bảng để ghi lại hình ảnh, sử dụng phần mềm chỉnh sửa
    ảnh/video đơn giản và gửi báo cáo qua các công cụ số (Biểu hiện:
    #strong[Sáng tạo và chia sẻ sản phẩm số]).

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
