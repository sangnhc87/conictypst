// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 10 ĐT và MP trong KG",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được các khái niệm cơ bản: mặt phẳng, điểm thuộc mặt phẳng, đường
  thẳng nằm trong mặt phẳng, giao tuyến của hai mặt phẳng.
- Nắm vững các tính chất thừa nhận của hình học không gian.
- Trình bày được các cách xác định một mặt phẳng trong không gian.
- Nhận dạng được hình chóp và hình tứ diện.
- Mô tả được các yếu tố cơ bản (đỉnh, cạnh, mặt bên, mặt đáy) của hình
  chóp và hình tứ diện.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm kiếm thông tin về kiến thức
    mới qua sách giáo khoa, tài liệu tham khảo và các nguồn tài nguyên
    số.
  - #strong[Giao tiếp và hợp tác:] Thảo luận, trao đổi kiến thức, giải
    quyết các bài tập nhóm một cách hiệu quả.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích tình huống thực tế
    để đưa ra mô hình không gian và tìm ra lời giải cho các vấn đề hình
    học.
- #strong[Năng lực đặc thù:]
  - #strong[Năng lực tư duy và lập luận toán học:] Phát hiện và lập luận
    được các mối quan hệ không gian giữa điểm, đường thẳng và mặt phẳng.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa các đối tượng,
    tình huống thực tế bằng hình học không gian (ví dụ: mô hình mái nhà,
    kim tự tháp).
  - #strong[Năng lực sử dụng công cụ, phương tiện học toán:] Sử dụng
    thành thạo các dụng cụ học tập (thước, bút, compa, mô hình trực
    quan) và công cụ số (ví dụ: phần mềm vẽ hình 3D, sơ đồ tư duy trực
    tuyến).

- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - #strong[NL2. Sáng tạo và cộng tác bằng công nghệ số:] Học sinh
    #strong[sử dụng công cụ số] (ví dụ: phần mềm vẽ hình 3D, sơ đồ tư
    duy trực tuyến).

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Hoàn thành đầy đủ các nhiệm vụ học tập được giao
  (bài tập cá nhân, bài tập nhóm, nhiệm vụ vận dụng).
- #strong[Trung thực:] Trình bày kết quả làm việc nhóm, báo cáo sản phẩm
  một cách chính xác, trung thực.
- #strong[Trách nhiệm:] Có ý thức hợp tác, xây dựng ý kiến trong nhóm,
  bảo vệ ý kiến cá nhân.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính, bảng phụ, phấn
  màu, mô hình trực quan các hình chóp/tứ diện (hoặc bộ mô hình lắp
  ghép).
- #strong[Học liệu:] Sách giáo khoa Toán 11, phiếu học tập, giấy A0, bút
  dạ, các vật dụng mô hình hóa hình học không gian (ví dụ: hộp giấy, que
  kem, dây chun), phần mềm vẽ hình 3D (ví dụ: GeoGebra).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
Tên hoạt động: #strong[Khám phá không gian qua thực tế]

#mt-hd[
Giúp học sinh xác định được nhu cầu tìm hiểu về
  các yếu tố cơ bản trong không gian (điểm, đường, mặt) và vai trò của
  mặt phẳng trong việc xác định vị trí của các đối tượng.
]
#nd-hd[
Học sinh quan sát, xử lý tình huống/hình ảnh
  thực tế.
  - #strong[Nhiệm vụ:] Giáo viên trình chiếu hình ảnh #strong[Tháp
    Eiffel] hoặc #strong[Kim tự tháp Giza] và đặt câu hỏi:
    - Các mặt bên của Tháp Eiffel có phải là mặt phẳng không?
    - Các cạnh của Kim tự tháp thể hiện hình ảnh của đối tượng hình học
      nào?
    - Làm thế nào để xác định chính xác một mặt phẳng trong không gian
      (ví dụ: mặt bàn, mặt tường) mà nó không bị rung lắc?
]
#sp-hd[
  - Học sinh nêu được các đối tượng hình học cơ bản (điểm, đường thẳng,
    mặt phẳng) được thể hiện qua các hình ảnh thực tế.
  - Học sinh bước đầu đưa ra các ý kiến/dự đoán về cách xác định một mặt
    phẳng (ví dụ: dùng 3 chân bàn, 3 điểm).
]
#tc-hd[
  - #strong[Bước 1: Chuyển giao nhiệm vụ:] Giáo viên trình chiếu hình
    ảnh/video về các công trình kiến trúc (Tháp Eiffel, mái nhà,...) và
    nêu các câu hỏi khám phá.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh suy nghĩ cá nhân (3
    phút), sau đó thảo luận nhóm đôi (5 phút) để đưa ra câu trả lời.
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời đại diện 2-3 nhóm trình bày
    ý kiến. Giáo viên tổng hợp các ý kiến, dẫn dắt học sinh đến nhận ra
    sự cần thiết phải nghiên cứu các khái niệm và tính chất cơ bản của
    hình học không gian.
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên nhận xét, đặt vấn đề
    cho bài học: \"Làm thế nào để chính xác hóa các nhận định vừa rồi và
    xây dựng cơ sở toán học cho hình học không gian?\"

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "85 phút")
==== 2.1. Hoạt động thành phần 1: Khái niệm mở đầu (20 phút)
Tên hoạt động: #strong[Vẽ sơ đồ tư duy về các khái niệm cơ bản]

#mt-hd[
Hình thành khái niệm về mặt phẳng và mối quan hệ
  giữa điểm, đường thẳng với mặt phẳng.
]
#nd-hd[
Học sinh đọc SGK và tài liệu để rút ra khái
  niệm, sau đó sử dụng công cụ số để trình bày.
  - #strong[Nhiệm vụ:] Nhóm nghiên cứu SGK phần Khái niệm mở đầu, thống
    nhất về: #strong[Khái niệm mặt phẳng, Điểm thuộc/không thuộc mặt
    phẳng, Hình biểu diễn của mặt phẳng.]
]
#sp-hd[
  - Học sinh ghi nhớ ký hiệu mặt phẳng
    $\(alpha\)\,\(beta\)\,\(P\)\,. . .$ và ký hiệu quan hệ thuộc/không
    thuộc.
  - Các nhóm hoàn thành #strong[sơ đồ tư duy trực tuyến] (ví dụ: sử dụng
    MindMeister hoặc công cụ vẽ sơ đồ) tóm tắt các khái niệm và hình ảnh
    biểu diễn.
  - #strong[Ví dụ cụ thể:]
    - Cho mặt phẳng $\(P\)$ và ba điểm $A\,B\,C$. Ký hiệu quan hệ
      thuộc/không thuộc giữa các điểm này với $\(P\)$ (Giáo viên cung
      cấp hình vẽ minh họa).
  - #strong[Tích hợp Năng lực số:] #strong[Sử dụng công nghệ số để tạo
    và trình bày sản phẩm học tập.] (Biểu hiện: Sử dụng phần mềm tạo sơ
    đồ tư duy trực tuyến).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Học sinh làm việc nhóm (4-5 người)
    đọc SGK, phân công người tìm kiếm, người vẽ.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Các nhóm tạo sơ đồ tư duy tóm
    tắt kiến thức trong 10 phút.
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời 1-2 nhóm trình chiếu sơ đồ
    tư duy của mình (thông qua máy chiếu) và trình bày. Các nhóm khác
    đặt câu hỏi phản biện.
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên chốt kiến thức, hoàn
    thiện sơ đồ tư duy chung và chuẩn hóa ký hiệu.

==== 2.2. Hoạt động thành phần 2: Các tính chất thừa nhận (20 phút)
Tên hoạt động: #strong[Trò chơi học tập: \"Đúng - Sai - Giải thích\"]

]
#mt-hd[
Nắm vững và hiểu rõ ý nghĩa hình học của ba tính
  chất thừa nhận (T1, T2, T3).
]
#nd-hd[
Học sinh vận dụng kiến thức từ SGK để phán đoán
  và giải thích.
  - #strong[Nhiệm vụ:] Nhóm thảo luận các nhận định (Đúng/Sai) do giáo
    viên đưa ra liên quan đến 3 tính chất thừa nhận.
]
#sp-hd[
  - Học sinh viết ra các tính chất T1, T2, T3.
  - #strong[Ví dụ cụ thể:] Giáo viên đưa ra các nhận định sau:
    - #strong[Nhận định 1:] Bất kì mặt phẳng nào cũng chứa ít nhất một
      đường thẳng. (Dựa trên T1)
    - #strong[Nhận định 2:] Hai đường thẳng phân biệt có điểm chung $I$,
      thì $I$ là giao tuyến của hai đường thẳng đó. (Sai -- Phân biệt
      đường thẳng và mặt phẳng)
    - #strong[Nhận định 3:] Nếu $A$ và $B$ là hai điểm chung của hai mặt
      phẳng phân biệt $\(P\)$ và $\(Q\)$, thì mọi điểm thuộc đoạn thẳng
      $A B$ đều là điểm chung của $\(P\)$ và $\(Q\)$. (Dựa trên T2)
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Giáo viên phát phiếu có các nhận
    định liên quan đến T1, T2, T3 (4-5 nhận định).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Các nhóm thảo luận (7 phút) để
    quyết định #strong[Đúng/Sai] và đưa ra lời #strong[Giải thích] hoặc
    #strong[Phản ví dụ] cho mỗi nhận định.
  - #strong[Bước 3: Báo cáo, thảo luận:] Các nhóm lần lượt giơ bảng
    \"Đúng\" hoặc \"Sai\". Giáo viên mời nhóm giải thích và các nhóm
    khác phản biện.
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên chuẩn hóa lại nội
    dung 3 tính chất, nhấn mạnh T2 về #strong[Giao tuyến của hai mặt
    phẳng].

==== 2.3. Hoạt động thành phần 3: Cách xác định một mặt phẳng (20 phút)
Tên hoạt động: #strong[Thực hành với mô hình trực quan/phần mềm
GeoGebra]

]
#mt-hd[
Nêu được 3 cách xác định duy nhất một mặt phẳng
  (3 điểm không thẳng hàng, đường thẳng và điểm không thuộc nó, 2 đường
  thẳng cắt nhau).
]
#nd-hd[
Học sinh sử dụng mô hình/phần mềm để trực quan
  hóa 3 cách xác định.
  - #strong[Nhiệm vụ:] Cá nhân sử dụng các que thẳng và dây chun (hoặc
    phần mềm GeoGebra) để thực hành tạo ra một mặt phẳng cố định theo 3
    cách xác định đã học.
]
#sp-hd[
  - Học sinh trình bày được 3 cách xác định mặt phẳng bằng lời và ký
    hiệu.
  - #strong[Ví dụ cụ thể:]
    - #strong[Cách 1:] Lấy 3 điểm $A\,B\,C$ không thẳng hàng và cố định
      chúng.
    - #strong[Cách 2:] Lấy đường thẳng $d$ và điểm $M in.not d$. Cố định
      $d$ và $M$.
    - #strong[Cách 3:] Lấy hai đường thẳng $a\,b$ cắt nhau tại $I$. Cố
      định $a$ và $b$.
  - #strong[Tích hợp Năng lực số:] #strong[Sử dụng công nghệ số để mô
    phỏng và thực hành.] (Biểu hiện: Sử dụng phần mềm GeoGebra 3D để vẽ
    và xoay hình, minh họa tính duy nhất của mặt phẳng).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Giáo viên giới thiệu 3 cách xác
    định. Yêu cầu học sinh thực hành.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thực hành cá nhân với
    mô hình hoặc làm việc nhóm nhỏ với phần mềm GeoGebra. (10 phút) \*
    #strong[Bước 3: Báo cáo, thảo luận:] Mời 2-3 học sinh trình bày mô
    hình/hình vẽ GeoGebra của mình. Các học sinh khác nhận xét tính cố
    định và duy nhất của mặt phẳng tạo ra.
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên chuẩn hóa lại nội
    dung kiến thức, đặc biệt là ký hiệu cách xác định:
    $upright("mp")\(A B C\)\,upright("mp")\(d\,M\)\,upright("mp")\(a\,b\)$.

==== 2.4. Hoạt động thành phần 4: Hình chóp và hình tứ diện (25 phút)
Tên hoạt động: #strong[Phân tích và Tổng hợp thông tin qua Trò chơi ghép
hình]

]
#mt-hd[
Nhận dạng và mô tả được các yếu tố cơ bản của
  hình chóp và hình tứ diện.
]
#nd-hd[
Học sinh quan sát mô hình và phân tích cấu trúc
  của hình chóp, hình tứ diện.
  - #strong[Nhiệm vụ:] Nhóm quan sát mô hình trực quan (hoặc hình vẽ) và
    hoàn thành phiếu học tập/trò chơi ghép tên các yếu tố.
]
#sp-hd[
  - Học sinh phân biệt được #strong[Hình chóp] và #strong[Hình tứ diện]
    (Hình tứ diện là hình chóp có đáy là tam giác).
  - Học sinh gọi tên và xác định được: #strong[Đỉnh, Cạnh bên, Mặt bên,
    Mặt đáy] của hình chóp và hình tứ diện.
  - #strong[Ví dụ cụ thể:]
    - Cho #strong[Hình chóp] $S . A B C D$ và #strong[Hình tứ diện]
      $A B C D$. Liệt kê tất cả các mặt phẳng tạo thành.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Giáo viên trình chiếu/đưa mô hình và
    yêu cầu nhóm thảo luận để hoàn thành phiếu điền tên các yếu tố của
    hình chóp và hình tứ diện. \* #strong[Bước 2: Thực hiện nhiệm vụ:]
    Các nhóm thảo luận, điền vào phiếu học tập (hoặc chơi trò chơi ghép
    các thẻ tên \"Đỉnh\", \"Mặt bên\", \"Cạnh đáy\" vào đúng vị trí trên
    hình vẽ lớn). (10 phút)
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời đại diện một nhóm lên trình
    bày kết quả. Giáo viên đặt câu hỏi: \"Tứ diện có phải là hình chóp
    không? Tại sao?\".
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên chốt kiến thức, nhấn
    mạnh quy ước gọi tên và các yếu tố cấu thành.

]
#hd("3", "Luyện tập", "25 phút")
#mt-hd[
Vận dụng kiến thức về giao tuyến, cách xác định
  mặt phẳng, và các yếu tố của hình chóp để giải các bài tập cơ bản.
]
#nd-hd[
Học sinh thực hiện các bài tập trắc nghiệm và tự
  luận ngắn.
  - #strong[Nhiệm vụ 1 (Cá nhân - Trắc nghiệm):] Các câu hỏi nhận biết
    và thông hiểu về tính chất thừa nhận và cách xác định mặt phẳng.
  - #strong[Nhiệm vụ 2 (Nhóm - Tự luận):] Bài toán tìm giao tuyến của
    hai mặt phẳng trong hình chóp.
    - #strong[Ví dụ cụ thể:] Cho hình chóp $S . A B C D$ có đáy
      $A B C D$ là tứ giác, $M$ là một điểm thuộc $S A$. Tìm giao tuyến
      của hai mặt phẳng $\(S A C\)$ và $\(S B D\)$.
]
#sp-hd[
  - Đáp án chính xác cho các câu trắc nghiệm.
  - Lời giải bài tập tự luận, xác định giao tuyến là đường thẳng đi qua
    hai điểm chung $S$ và $O$ ($O$ là giao điểm của $A C$ và $B D$).
  - #strong[Tích hợp Năng lực số:] #strong[Sử dụng các công cụ số để
    kiểm tra kết quả.] (Biểu hiện: Học sinh sử dụng điện thoại/máy tính
    để vẽ lại hình trong GeoGebra, đối chiếu với kết quả tìm được).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Giáo viên giao Bài tập 1 (trắc
    nghiệm - 5 phút) và Bài tập 2 (tự luận nhóm - 15 phút).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh làm việc cá nhân (trắc
    nghiệm). Thảo luận nhóm (tự luận) để tìm lời giải.
  - #strong[Bước 3: Báo cáo, thảo luận:]
    - Kiểm tra đáp án trắc nghiệm nhanh.
    - Mời một nhóm trình bày chi tiết lời giải Bài tập 2 lên bảng. Các
      nhóm khác nhận xét, bổ sung.
  - #strong[Bước 4: Kết luận, nhận định:] Giáo viên tổng kết, sửa sai và
    nhấn mạnh phương pháp tìm giao tuyến (Tìm hai điểm chung).

]
#hd("4", "Vận dụng", "10 phút - Giao về nhà")
#mt-hd[
Phát triển năng lực mô hình hóa, vận dụng kiến
  thức vào thực tiễn cuộc sống.
]
#nd-hd[
Yêu cầu học sinh phát hiện/đề xuất các vấn
  đề/tình huống trong thực tiễn gắn với nội dung bài học.
  - #strong[Nhiệm vụ:] Tìm một vật thể trong đời sống có hình dạng là
    hình chóp hoặc tứ diện (ví dụ: lều cắm trại, chóp nón giao thông,
    một chi tiết kiến trúc).
]
#sp-hd[
  - Bài báo cáo (trình bày dưới dạng Word hoặc Slide) có ảnh chụp/video
    về vật thể thực tế và phân tích:
    - Tên gọi của hình khối đó (Hình chóp, tứ diện).
    - Phân tích cấu trúc của vật thể đó (có bao nhiêu mặt phẳng, các mặt
      phẳng đó cắt nhau theo các giao tuyến nào?).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] Giáo viên giao nhiệm vụ vận dụng
    thực tế cho học sinh và yêu cầu nộp báo cáo vào buổi học tiếp theo.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thực hiện ngoài giờ
    học trên lớp.
  - #strong[Bước 3: Báo cáo, chia sẻ:] Giáo viên dành 5 phút đầu buổi
    học tiếp theo để mời 1-2 học sinh trình bày và chia sẻ sản phẩm.
  - #strong[Tích hợp Năng lực số:] #strong[Sử dụng công cụ số để nghiên
    cứu, thu thập và xử lý thông tin, và tạo ra sản phẩm thông tin.]
    (Biểu hiện: Học sinh sử dụng điện thoại/máy tính để chụp ảnh, quay
    video, tìm kiếm thông tin trên mạng, và sử dụng Powerpoint/Word để
    làm báo cáo).

]
