// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 8 Tổng và Hiệu của hai vectơ",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[tổng của hai vectơ].
- Trình bày được quy tắc ba điểm (#strong[quy tắc cộng]) và quy tắc hình
  bình hành để xác định tổng của hai vectơ.
- Nêu được khái niệm #strong[hiệu của hai vectơ] thông qua #strong[vectơ
  đối].
- Vận dụng được các quy tắc và tính chất của phép cộng, trừ vectơ để
  giải các bài toán đơn giản trong mặt phẳng và thực tiễn.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, đọc tài liệu,
    và thực hiện nhiệm vụ học tập theo nhóm.
  - #strong[Năng lực giao tiếp và hợp tác:] Thảo luận, trình bày, và bảo
    vệ ý kiến cá nhân/nhóm một cách rõ ràng, mạch lạc.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích tình
    huống, đề xuất và lựa chọn phương án tối ưu để xác định tổng/hiệu
    của vectơ.
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận Toán học:] Hình thành quy tắc
    cộng vectơ thông qua quan sát và khái quát hóa; lập luận để chứng
    minh các tính chất của phép cộng vectơ.
  - #strong[Năng lực mô hình hóa Toán học:] Sử dụng vectơ để mô tả các
    đại lượng có hướng (lực, vận tốc, dịch chuyển) trong thực tiễn.
  - #strong[Năng lực sử dụng công cụ, phương tiện Toán học:] Sử dụng
    #strong[phần mềm hình học động (ví dụ: GeoGebra)] để trực quan hóa,
    kiểm chứng các quy tắc cộng/trừ vectơ và tính chất.
    (#emph[#strong[Tích hợp Năng lực số]]).

- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
  - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
    tin và nội dung trong môi trường số.
  - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin
    và nội dung này cũng như điều hướng giữa chúng.
  - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
  - 2.2.NC1a- Chia sẻ dữ liệu, thông tin và nội dung số thông qua nhiều
    công cụ số phù hợp,
  - 2.2.NC1b-Hướng dẫn người khác cách đóng vai trò trung gian để chia
    sẻ thông tin và nội dung thông qua công nghệ số.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Hoàn thành các nhiệm vụ học tập được giao một cách
  đầy đủ và đúng hạn.
- #strong[Trách nhiệm:] Có tinh thần xây dựng, hợp tác và chia sẻ trong
  làm việc nhóm.
- #strong[Trung thực:] Thể hiện sự trung thực trong việc trình bày kết
  quả cá nhân và nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính/laptop, phòng học có
  kết nối Internet.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập nhóm (PHT).
  - #strong[Phần mềm GeoGebra:] Dùng để minh họa và thực hành vẽ vectơ.
    (#emph[#strong[Tích hợp Năng lực số]]: Sử dụng công cụ số để học
    tập).
  - Video/hình ảnh mô phỏng lực kéo, vận tốc canô.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Nhiệm vụ học tập/Mở đầu", "10 phút")
- #strong[Tên hoạt động:] #strong[Khởi động với Vấn đề Thực tiễn]
  - #strong[Mục tiêu:] Giúp học sinh xác định được nhu cầu cần thiết
    phải thực hiện phép cộng vectơ, tạo hứng thú và kết nối kiến thức cũ
    với kiến thức mới.
  - #strong[Nội dung:]
    - #strong[GV] đặt vấn đề: Hai người cùng kéo một vật bằng hai sợi
      dây tạo thành một góc nhất định. Hỏi hợp lực tác dụng lên vật sẽ
      như thế nào (về độ lớn và hướng)?
    - #strong[HS] thảo luận nhanh (cặp đôi) và đưa ra dự đoán ban đầu về
      hướng di chuyển của vật.
    - #strong[GV] mô tả vấn đề dưới góc độ vectơ: Thay hai lực
      $arrow(F_1)$ và $arrow(F_2)$ bằng hai vectơ $arrow(a)$ và
      $arrow(b)$. Cần tìm vectơ $arrow(F)$ đại diện cho hợp lực/tổng của
      $arrow(a)$ và $arrow(b)$.
  - #strong[Sản phẩm:] Dự đoán và câu trả lời ban đầu của học sinh (nhận
    thấy sự cần thiết của phép cộng vectơ).
  - #strong[Tổ chức thực hiện:]
    - #strong[Giao nhiệm vụ học tập:] GV chiếu hình ảnh/video mô phỏng,
      đặt câu hỏi thực tiễn.
    - #strong[Thực hiện nhiệm vụ:] HS thảo luận cặp đôi (3 phút).
    - #strong[Báo cáo, thảo luận:] GV mời 1-2 cặp đôi báo cáo ý kiến.
    - #strong[Kết luận, nhận định:] GV ghi nhận các ý kiến, dẫn dắt vào
      bài học: \"Làm thế nào để xác định chính xác tổng của hai vectơ
      $arrow(a)$ và $arrow(b)$? Chúng ta sẽ tìm hiểu trong bài học hôm
      nay.\".

#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "60 phút")
- #strong[Mục tiêu:] Học sinh chiếm lĩnh kiến thức về tổng và hiệu của
  hai vectơ, nắm vững các quy tắc và tính chất.

===== 2.1. Hoạt động thành phần 2.1: Tổng của hai vectơ (30 phút)
- #strong[Tên hoạt động:] #strong[Khám phá và Lập luận Quy tắc Cộng
  Vectơ]
  - #strong[Mục tiêu:] Hình thành và vận dụng được #strong[quy tắc ba
    điểm] (quy tắc cộng) và #strong[quy tắc hình bình hành].
  - #strong[Nội dung:]
    - #strong[GV] chia lớp thành các nhóm nhỏ (4-5 HS).
    - #strong[Nhiệm vụ 1 (Quy tắc ba điểm):] #strong[HS] mở sách giáo
      khoa, nghiên cứu ví dụ về dịch chuyển/quãng đường. #strong[HS]
      thực hiện vẽ hình và dự đoán công thức
      $accent(A B, ⃗) + accent(B C, ⃗)$.
    - #strong[Nhiệm vụ 2 (Quy tắc hình bình hành):] #strong[HS] làm việc
      nhóm, sử dụng #strong[GeoGebra] (trên điện thoại/máy tính bảng) để
      vẽ hai vectơ chung gốc $accent(O A, ⃗)$và $accent(O B, ⃗)$và xác
      định tổng $accent(O C, ⃗)$sao cho $O A C B$là hình bình hành.
      (#emph[#strong[Tích hợp Năng lực số]]: #strong[Tìm kiếm, thu thập,
      xử lí thông tin số]: Thu thập kết quả trực quan từ GeoGebra để
      hình thành quy tắc. #strong[Hợp tác số]: Chia sẻ file GeoGebra
      giữa các thành viên để kiểm tra kết quả).

#quote(block: true)[
#strong[Sản phẩm:]
]

===== Báo cáo nhóm về #strong[Quy tắc ba điểm] ($accent(A B, ⃗) + accent(B C, ⃗) = accent(A C, ⃗)$).
===== Báo cáo nhóm về #strong[Quy tắc hình bình hành] ($accent(O A, ⃗) + accent(O B, ⃗) = accent(O C, ⃗)$).
===== Lời giải bài tập ví dụ: Cho hình vuông $A B C D$. Tính $accent(A B, ⃗) + accent(A D, ⃗)$. (Sử dụng quy tắc hình bình hành để ra $accent(A C, ⃗)$).
===== #strong[Tổ chức thực hiện:] 
===== #strong[Giao nhiệm vụ học tập:] GV giao PHT (có hướng dẫn sử dụng GeoGebra cơ bản) cho các nhóm.
===== #strong[Thực hiện nhiệm vụ:] HS làm việc nhóm (15 phút), GV theo dõi, hỗ trợ các nhóm gặp khó khăn trong việc sử dụng phần mềm GeoGebra hoặc lập luận.
===== #strong[Báo cáo, thảo luận:] GV mời đại diện 2 nhóm báo cáo, trình chiếu hình vẽ GeoGebra (trực quan hóa kiến thức).
===== #strong[Kết luận, nhận định:] GV chuẩn hóa kiến thức, tổng kết 2 quy tắc, và nhắc lại các tính chất của phép cộng vectơ.
===== 2.2. Hoạt động thành phần 2.2: Hiệu của hai vectơ (30 phút)
- #strong[Mục tiêu:] Hình thành khái niệm #strong[vectơ đối] và
  #strong[hiệu của hai vectơ].
- #strong[Nội dung:]
  - #strong[Nhiệm vụ 1 (Vectơ đối):] #strong[GV] giới thiệu khái niệm
    #strong[vectơ đối] qua ví dụ về $accent(A B, ⃗)$ và $accent(B A, ⃗)$.
    Yêu cầu #strong[HS] làm việc cá nhân xác định vectơ đối của các
    vectơ cho trước.
  - #strong[Nhiệm vụ 2 (Hiệu của hai vectơ):] #strong[HS] nghiên cứu
    công thức $arrow(a) - arrow(b) = arrow(a) +\(- arrow(b)\)$ và quy
    tắc trừ: $accent(O B, ⃗) - accent(O A, ⃗) = accent(A B, ⃗)$.
  - #strong[Ví dụ vận dụng:] Cho ba điểm $M\,N\,P$. Chứng minh
    $accent(M N, ⃗) = accent(P N, ⃗) - accent(P M, ⃗)$. #strong[HS] làm
    việc cá nhân/cặp đôi để chứng minh.
- #strong[Sản phẩm:]
  - Khái niệm và ví dụ minh họa về vectơ đối.
  - Khái niệm và công thức phép trừ vectơ.
  - Lời giải bài tập ví dụ:
    $accent(P N, ⃗) - accent(P M, ⃗) = accent(M N, ⃗)$ (sử dụng quy tắc
    trừ).
- #strong[Tổ chức thực hiện:]
  - #strong[Giao nhiệm vụ học tập:] GV đặt câu hỏi/yêu cầu HS nghiên cứu
    sách giáo khoa và chứng minh ví dụ.
  - #strong[Thực hiện nhiệm vụ:] HS làm việc cá nhân (10 phút), GV theo
    dõi, gợi ý.
  - #strong[Báo cáo, thảo luận:] GV mời 1 HS lên bảng trình bày.
  - #strong[Kết luận, nhận định:] GV chuẩn hóa kiến thức về vectơ đối và
    quy tắc trừ, nhấn mạnh việc chuyển phép trừ thành phép cộng với
    vectơ đối.

#hd("3", "Luyện tập", "15 phút")
- #strong[Mục tiêu:] Vận dụng kiến thức đã học để tính tổng, hiệu các
  vectơ và chứng minh các hệ thức vectơ đơn giản.
- #strong[Nội dung:]
  - #strong[Bài tập 1 (Tính toán):] Cho hình bình hành $A B C D$. Tính
    $accent(A B, ⃗) + accent(B C, ⃗)$ và $accent(A D, ⃗) - accent(A C, ⃗)$.
  - #strong[Bài tập 2 (Chứng minh):] Cho 4 điểm $A\,B\,C\,D$ bất kì.
    Chứng minh
    $accent(A C, ⃗) + accent(B D, ⃗) = accent(A D, ⃗) + accent(B C, ⃗)$.
- #strong[Sản phẩm:]
  - #strong[Bài 1:] $accent(A B, ⃗) + accent(B C, ⃗) = accent(A C, ⃗)$\;
    $accent(A D, ⃗) - accent(A C, ⃗) = accent(C D, ⃗)$.
  - #strong[Bài 2:] Chứng minh hệ thức
    $accent(A C, ⃗) + accent(B D, ⃗) = accent(A D, ⃗) + accent(B C, ⃗)$.
- #strong[Tổ chức thực hiện:]
  - #strong[Giao nhiệm vụ học tập:] GV giao 2 bài tập.
  - #strong[Thực hiện nhiệm vụ:] HS làm việc cá nhân (5 phút) và sau đó
    trao đổi nhanh (3 phút) với bạn bên cạnh để kiểm tra kết quả.
  - #strong[Báo cáo, thảo luận:] GV gọi 2 HS lên bảng trình bày giải
    pháp. #strong[GV] yêu cầu các nhóm khác nhận xét, đưa ra phương án
    tối ưu hơn (nếu có).
  - #strong[Kết luận, nhận định:] GV chốt đáp án, nhấn mạnh các lỗi sai
    thường gặp và cách trình bày hợp lý.

#hd("4", "Vận dụng", "5 phút")
- #strong[Tên hoạt động:] #strong[Áp dụng Vectơ vào thực tiễn]
  - #strong[Mục tiêu:] Phát triển năng lực mô hình hóa, đưa kiến thức
    vừa học vào giải quyết vấn đề thực tiễn.
  - #strong[Nội dung:]
    - #strong[GV] giao nhiệm vụ về nhà: #strong[\"Vận tốc tổng hợp\"]:
      Một chiếc thuyền di chuyển trên sông với vận tốc riêng (so với
      nước) là $arrow(v_1)$. Nước chảy với vận tốc $arrow(v_2)$ (so với
      bờ). #strong[Hãy tìm hiểu và giải thích bằng vectơ] công thức tính
      vận tốc của thuyền so với bờ ($arrow(v)$).
    - #strong[Yêu cầu:] Học sinh #strong[tìm kiếm thông tin] (qua Google
      hoặc tài liệu số khác), #strong[vẽ sơ đồ minh họa] (có thể vẽ tay
      hoặc dùng phần mềm GeoGebra), và giải thích bằng lời.
      (#emph[#strong[Tích hợp Năng lực số]]: #strong[Tìm kiếm, thu thập,
      xử lí thông tin số]: Tìm kiếm kiến thức vật lí liên quan.
      #strong[Sáng tạo nội dung số]: Lập sơ đồ, vẽ hình minh họa).
  - #strong[Sản phẩm:]
    - Bài báo cáo (viết tay/file số) trình bày công thức
      $arrow(v) = arrow(v_1) + arrow(v_2)$ cùng hình vẽ minh họa (quy
      tắc hình bình hành).
  - #strong[Tổ chức thực hiện:]
    - #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ, nhấn mạnh yêu
      cầu thực hiện ngoài giờ học trên lớp và nộp báo cáo.
    - #strong[Thực hiện nhiệm vụ:] HS thực hiện tại nhà, tìm kiếm, mô
      hình hóa.
    - #strong[Báo cáo, thảo luận:] Báo cáo được nộp để trao đổi, chia sẻ
      và đánh giá vào tiết học tiếp theo.

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

