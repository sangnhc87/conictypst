// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "HĐTHTN 5 Vẽ đồ hoạ 3D với Geogebra",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Nhận biết] và #strong[vận dụng] được một số công cụ cơ bản
  trên phần mềm GeoGebra 3D để biểu diễn các đối tượng hình học không
  gian (điểm, đường, mặt, hình khối) và đồ thị hàm số trong không gian
  $O x y z$.
- #strong[Thực hiện] được các thao tác để tạo ra và điều chỉnh các hình
  khối 3D, đặc biệt là các đối tượng hình học phức tạp như #strong[Tam
  giác Penrose] và #strong[Mặt Mobius] qua công thức tham số hoặc công
  cụ sẵn có.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực mô hình hoá Toán học:] Thực hiện mô hình hóa các
    đối tượng hình học không gian vào môi trường số 3D.
  - #strong[Năng lực giải quyết vấn đề Toán học:] Sử dụng GeoGebra để
    kiểm chứng, khám phá các tính chất hình học 3D.
- #strong[Năng lực chung:]
  - #strong[Năng lực tự học:] Chủ động tìm hiểu, khám phá công cụ trên
    phần mềm GeoGebra để hoàn thành nhiệm vụ.
  - #strong[Năng lực giao tiếp và hợp tác:] Hợp tác hiệu quả trong nhóm
    để thực hiện các nhiệm vụ vẽ đồ họa 3D, trình bày và thảo luận về
    sản phẩm.
- #strong[Năng lực số (Theo TT 02/2025/TT-BGDĐT):]
  - #strong[Sử dụng và quản lí các công cụ và phương tiện kĩ thuật số:]
    Lựa chọn và sử dụng thành thạo phần mềm GeoGebra để thực hiện các
    thao tác vẽ và điều chỉnh hình 3D (#strong[Biểu hiện:] #emph[Sử dụng
    các ứng dụng, phần mềm để giải quyết các nhiệm vụ học tập và làm
    việc]).
  - #strong[Tạo lập và xử lí thông tin số:] Tạo ra sản phẩm đồ hoạ 3D
    (hình ảnh, video quay màn hình) từ GeoGebra và lưu trữ, chia sẻ sản
    phẩm dưới định dạng số (#strong[Biểu hiện:] #emph[Sản xuất được sản
    phẩm số cơ bản (văn bản, bảng tính, hình ảnh, âm thanh, video)]).

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, kiên trì thực hiện các thao tác trên phần
  mềm để hoàn thành các hình vẽ 3D.
- #strong[Trách nhiệm:] Có trách nhiệm trong hoạt động nhóm, chủ động
  báo cáo và chia sẻ kết quả với các thành viên.
- #strong[Trung thực:] Thể hiện sự trung thực khi báo cáo kết quả thực
  hành, tôn trọng sản phẩm của bản thân và nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Phòng máy tính/Máy tính xách tay có cài đặt
  hoặc truy cập trực tuyến GeoGebra 3D Calculator. Máy chiếu/Màn hình
  tương tác.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 12 (Bộ KNTT).
  - Tài liệu hướng dẫn sử dụng cơ bản GeoGebra 3D (do GV chuẩn bị hoặc
    đường link tham khảo).
  - Phiếu giao nhiệm vụ nhóm (có in sẵn các bước và công thức).
  - Sản phẩm mẫu 3D của Tam giác Penrose và Mặt Mobius (ảnh/video) để
    học sinh quan sát.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "5 phút")
Tên thể hiện kết quả hoạt động: #strong[Khám phá và kết nối]

#mt-hd[
Tạo hứng thú, giúp học sinh nhận biết được tính
  ứng dụng của đồ họa 3D trong thực tiễn và xác định nhiệm vụ cần đạt
  trong bài học.
]
#nd-hd[
  - #strong[GV] chiếu một số hình ảnh/video về đồ hoạ 3D sử dụng trong
    kiến trúc, thiết kế, phim ảnh hoặc các đối tượng hình học đặc biệt
    như Tam giác Penrose (ảo giác) và Mặt Mobius (một mặt, một biên).
  - #strong[HS] quan sát và trả lời câu hỏi: #emph["Những hình ảnh này
    được tạo ra bằng cách nào? Trong Toán học, chúng ta có thể mô hình
    hóa chúng bằng công cụ nào?"]
]
#sp-hd[
  - Các câu trả lời của HS về ứng dụng của đồ họa 3D.
  - HS xác định được nhiệm vụ học tập: Sử dụng phần mềm GeoGebra để tạo
    ra các hình 3D đặc biệt.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] GV trình chiếu và đặt câu hỏi mở (sử
    dụng Slide Powerpoint có tích hợp hình ảnh/video).
  - #strong[Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ trợ):] HS
    quan sát, suy nghĩ cá nhân (1 phút).
  - #strong[Báo cáo, thảo luận (GV tổ chức, điều hành; HS báo cáo, thảo
    luận):] GV gọi 1-2 HS trả lời nhanh. GV nhấn mạnh vai trò của phần
    mềm GeoGebra 3D trong việc mô hình hoá.
  - #strong[Kết luận, nhận định:] GV chốt vấn đề và giới thiệu bài học:
    #emph["Hôm nay, chúng ta sẽ dùng GeoGebra để vẽ và khám phá một số
    hình học không gian thú vị."]
- #strong[Tích hợp năng lực số:] #strong[Không áp dụng] trong hoạt động
  này.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "30 phút")
Tên thể hiện kết quả hoạt động: #strong[Thực hành vẽ đồ họa 3D với
GeoGebra] #strong[Phương pháp dạy học chủ đạo:] Dạy học theo nhóm, thực
hành có hướng dẫn, kết hợp thảo luận.

#mt-hd[
Giúp học sinh chiếm lĩnh được các thao tác cơ
  bản và nâng cao trên GeoGebra 3D qua việc thực hành vẽ hai hình học
  đặc biệt: Tam giác Penrose và Mặt Mobius.
]
#nd-hd[
HS chia nhóm (3-4 HS/nhóm). Mỗi nhóm thực hiện 2
  nhiệm vụ thành phần:

==== Hoạt động thành phần 2.1: Vẽ Tam giác Penrose (15 phút)
- #strong[Nội dung yêu cầu/nhiệm vụ:] HS làm việc với máy tính, thực
  hiện các bước để tạo ra mô hình Tam giác Penrose (một hình không thể
  tồn tại trong không gian Euclid 3 chiều thông thường, nhưng có thể
  biểu diễn qua các khối lăng trụ).
- #strong[Ví dụ cụ thể (Nhiệm vụ):]
  - #strong[Bước 1:] Khởi động GeoGebra 3D.
  - #strong[Bước 2:] Vẽ một #strong[lăng trụ đứng] (dạng khối hộp chữ
    nhật) $A$ với kích thước cơ bản.
  - #strong[Bước 3:] Vẽ thêm hai lăng trụ đứng $B$ và $C$ sao cho chúng
    tạo thành một góc vuông 90 độ với lăng trụ liền kề và tạo cảm giác
    #emph[kết nối] ở góc nhìn cụ thể. (Sử dụng lệnh #strong[Prism] hoặc
    công cụ #strong[Extrude to Prism]).
  - #strong[Bước 4:] Dùng các thao tác #strong[xoay, dịch chuyển, tô
    màu] và #strong[điều chỉnh góc nhìn] để tạo ra ảo giác thị giác của
    Tam giác Penrose (Tam giác bất khả thi).

==== Hoạt động thành phần 2.2: Vẽ Mặt Mobius (15 phút)
- #strong[Nội dung yêu cầu/nhiệm vụ:] HS làm việc với máy tính, sử dụng
  các lệnh tham số hoặc công cụ chuyên dụng của GeoGebra để tạo ra Mặt
  Mobius.

- #strong[Ví dụ cụ thể (Nhiệm vụ):]

  - #strong[Bước 1:] Sử dụng lệnh #strong[Surface] (Mặt) để tạo mặt tham
    số.
  - #strong[Bước 2:] Nhập công thức tham số cho Mặt Mobius. Ví dụ, sử
    dụng tham số $u in\[0\,2 pi\]$ và $v in\[- 1\,1\]$ (độ rộng):
    $x\(u\,v\)= (1 + v / 2 cos (u / 2)) c o s\(u\)$
    $y\(u\,v\)= (1 + v / 2 cos (u / 2)) s i n\(u\)$
    $z\(u\,v\)= v / 2 sin (u / 2)$
  - #strong[Bước 3:] Điều chỉnh màu sắc, độ trong suốt và thực hiện
    #strong[thao tác quay] để kiểm tra tính chất #strong[\"một mặt\"]
    của dải Mobius (Ví dụ: vẽ một đường cong trên dải và quan sát nó
    chạy hết cả hai mặt của dải ban đầu).

]
#sp-hd[

  - Mô hình Tam giác Penrose 3D đã hoàn thiện và được căn chỉnh góc nhìn
    (file GeoGebra hoặc ảnh chụp màn hình).
  - Mô hình Mặt Mobius 3D đã hoàn thiện (file GeoGebra hoặc ảnh chụp màn
    hình).
  - Các ghi chú về lệnh/công cụ đã sử dụng.

]
#tc-hd[

  - #strong[Giao nhiệm vụ học tập:] GV chiếu các bước hướng dẫn cụ thể
    và công thức tham số (nếu cần), giao nhiệm vụ thực hành theo nhóm.
  - #strong[Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ trợ):]
    - Các nhóm thực hành trên máy tính.
    - #strong[GV theo dõi, đi lại các nhóm:] Hướng dẫn cách sử dụng lệnh
      #emph[Surface] hoặc #emph[Extrude], cách điều chỉnh trục tọa
      độ/góc nhìn.
    - #strong[Dự kiến khó khăn & Hỗ trợ:]
      - #emph[Khó khăn:] HS nhập sai cú pháp lệnh tham số; khó căn chỉnh
        góc nhìn Tam giác Penrose.
      - #emph[Biện pháp:] GV cung cấp cú pháp chuẩn qua màn hình chiếu;
        gợi ý sử dụng công cụ #strong[Rotate 3D View].
    - #strong[Mức độ hoàn thành:] Tối thiểu phải hoàn thành mô hình
      #strong[Mặt Mobius] hoặc #strong[Tam giác Penrose]. Khuyến khích
      hoàn thành cả hai.
  - #strong[Báo cáo, thảo luận:] Do thời gian hạn hẹp, GV có thể mời
    #strong[1-2 nhóm tiêu biểu] trình chiếu nhanh sản phẩm của mình, sử
    dụng chức năng #strong[chia sẻ màn hình].
  - #strong[Kết luận, nhận định:] GV chốt lại kiến thức, nhấn mạnh
    GeoGebra là công cụ mạnh mẽ để #strong[mô hình hóa] và #strong[khám
    phá] các đối tượng Toán học không gian.

- #strong[Tích hợp năng lực số (Theo TT 02/2025/TT-BGDĐT):]

  - Sử dụng lệnh tham số (code) để tạo ra đồ hoạ 3D (Mặt Mobius)
    (#strong[Biểu hiện:] #emph[Sử dụng được các ứng dụng, phần mềm để
    giải quyết các nhiệm vụ học tập và làm việc]).
  - Làm việc nhóm trực tuyến/trao đổi dữ liệu (file GeoGebra) trong quá
    trình thực hành (#strong[Biểu hiện:] #emph[Tương tác và trao đổi
    thông tin với người khác thông qua các công cụ kĩ thuật số]).

]
#hd("3", "Luyện tập", "5 phút")
Tên thể hiện kết quả hoạt động: #strong[Trưng bày và tổng hợp]

#mt-hd[
Vận dụng kiến thức đã học vào việc nhận diện các
  thành phần hình học và phát triển kĩ năng giao tiếp, thuyết trình.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Mỗi nhóm cử đại diện thuyết trình nhanh (1 phút)
    về sản phẩm 3D của mình, tập trung vào:
    - Sản phẩm của nhóm là gì (Penrose hay Mobius)?
    - Ý nghĩa toán học nổi bật của hình đó (ví dụ: ảo giác, một mặt).
    - Lệnh hoặc công cụ quan trọng nhất đã sử dụng.
  - #strong[Phương pháp:] Kết hợp #strong[Sơ đồ tư duy] (nhóm có thể
    nhanh chóng phác thảo) hoặc #strong[Trò chơi học tập] (Đố vui nhanh
    về lệnh GeoGebra).
]
#sp-hd[
Bài trình bày ngắn gọn, súc tích của nhóm.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV yêu cầu HS chuẩn bị nhanh phần trình bày
    (1 phút).
  - #strong[Thực hiện:] HS thảo luận nhanh trong nhóm.
  - #strong[Báo cáo, thảo luận:] GV mời #strong[2-3 nhóm] trình bày. Các
    nhóm khác đặt câu hỏi giao lưu. GV nhận xét, khen ngợi.
  - #strong[Kiểm tra, đánh giá:] GV đánh giá bằng #strong[nhận xét] về
    sự rõ ràng, sáng tạo, và tính chính xác của sản phẩm nhóm.
- #strong[Tích hợp năng lực số:] #strong[Không áp dụng] trong hoạt động
  này.

]
#hd("4", "Vận dụng", "5 phút")
Tên thể hiện kết quả hoạt động: #strong[Mở rộng khám phá và Sáng tạo]

#mt-hd[
Phát triển năng lực vận dụng kiến thức, kĩ năng
  vào thực tiễn và khuyến khích sự sáng tạo cá nhân/nhóm.
]
#nd-hd[
Mô tả rõ yêu cầu học sinh phát hiện/đề xuất các
  vấn đề/tình huống trong thực tiễn gắn với nội dung bài học và vận dụng
  kiến thức mới học để giải quyết.
  - #strong[Nhiệm vụ:] GV giao bài tập về nhà:
    - #strong[Yêu cầu 1:] Tìm kiếm một vật thể/kiến trúc/đồ vật trong
      thực tế có hình dạng đặc biệt (ví dụ: Xoắn ốc, Lăng kính, Tòa nhà)
      và đề xuất #strong[phương án vẽ mô hình 3D] của nó bằng GeoGebra.
    - #strong[Yêu cầu 2:] Hoàn thiện và #strong[ghi lại video] (quay màn
      hình) sản phẩm Tam giác Penrose hoặc Mặt Mobius (tùy chọn) và chia
      sẻ lên nền tảng lớp học (Google Drive/Classroom).
]
#sp-hd[
  - Báo cáo/Kế hoạch mô hình hóa một vật thể thực tế.
  - Video sản phẩm 3D đã hoàn thiện (nộp ngoài giờ học).
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV trình bày rõ yêu cầu và hướng dẫn cách
    thức nộp sản phẩm (ngoài giờ học).
  - #strong[Kiểm tra, đánh giá:] GV thu thập và đánh giá sản phẩm
    (video, kế hoạch) vào buổi học tiếp theo.
- #strong[Tích hợp năng lực số (Theo TT 02/2025/TT-BGDĐT):]
  - Ghi lại video, cắt/chỉnh sửa video (sản phẩm số) và lưu trữ trên nền
    tảng đám mây (#strong[Biểu hiện:] #emph[Sản xuất được sản phẩm số cơ
    bản (hình ảnh, video)]\; #emph[Lưu trữ được dữ liệu trên thiết bị cá
    nhân hoặc trên môi trường mạng]).

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
