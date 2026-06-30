// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 14 Các số đặc trưng đo độ phân tán",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được ý nghĩa của việc đo độ phân tán của mẫu số liệu.
- Trình bày được cách xác định #strong[khoảng biến thiên
  (]$R$#strong[)], #strong[khoảng tứ phân vị (]$Delta_Q$#strong[)],
  #strong[phương sai (]$s^2$ #strong[hoặc] $sigma^2$#strong[)] và
  #strong[độ lệch chuẩn (]$s$ #strong[hoặc] $sigma$#strong[)].
- Sử dụng được biểu đồ hộp để xác định sự bất thường hoặc không chính
  xác của số liệu.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm kiếm thông tin, tài
    liệu về các số đo độ phân tán.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận nhóm,
    chia sẻ ý kiến và phân công nhiệm vụ trong nhóm để hoàn thành các
    nhiệm vụ học tập.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Đề xuất và thực
    hiện các giải pháp tính toán, giải quyết các bài toán thực tiễn liên
    quan đến độ phân tán của dữ liệu.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực tư duy và lập luận toán học:] Phân tích và giải
    thích ý nghĩa của các số đo độ phân tán trong các tình huống cụ thể.
  - #strong[Năng lực mô hình hóa toán học:] Lựa chọn và sử dụng các số
    đo độ phân tán phù hợp để mô tả các tập dữ liệu thực tế.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  đầy đủ các nhiệm vụ được giao.
- #strong[Trung thực:] Trình bày kết quả tính toán và báo cáo một cách
  khách quan, chính xác.
- #strong[Trách nhiệm:] Có ý thức hợp tác, xây dựng ý kiến đóng góp cho
  hoạt động nhóm và vận dụng kiến thức vào thực tiễn cuộc sống.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính kết nối mạng, bảng
  phụ/giấy A0, bút dạ.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 - Bộ Kết nối tri thức với cuộc sống.
  - Phiếu học tập (in sẵn hoặc dạng file số).
  - Máy tính cầm tay cá nhân (Casio/Vinacal) hoặc laptop/tablet có cài
    đặt phần mềm bảng tính (Excel/Google Sheets) để thực hiện tính toán
    thống kê (Tích hợp Năng lực số).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Nhiệm vụ học tập/Mở đầu", "10 phút")
#mt-hd[
- Giúp học sinh nhận ra được sự hạn chế của số đo xu thế trung tâm (Số
  trung bình, Trung vị, Mốt) trong việc mô tả đầy đủ đặc điểm của mẫu số
  liệu.
- Xác định được nhu cầu cần thiết phải tìm hiểu các số đo về độ phân
  tán.

]
#nd-hd[
- #strong[Giáo viên (GV) giao nhiệm vụ:] Đưa ra hai mẫu số liệu về điểm
  kiểm tra Toán của hai lớp 10A và 10B (giả định có cùng số trung bình).
  - #strong[Ví dụ minh họa:] Điểm thi thử môn Toán (thang điểm 10) của
    hai nhóm học sinh:
    - Nhóm A: ${ 5\,5\,5\,5\,5 }$
    - Nhóm B: ${ 1\,3\,5\,7\,9 }$
  - #strong[Nhiệm vụ:]
    - Yêu cầu học sinh tính #strong[số trung bình cộng] của điểm hai
      nhóm A và B (Học sinh thực hiện).
    - GV đặt câu hỏi: #emph["Nếu chỉ dựa vào điểm trung bình (cả hai
      nhóm đều là 5), ta có thể kết luận rằng kết quả học tập của hai
      nhóm là như nhau không? Cần thêm số đặc trưng nào để mô tả sự khác
      biệt?"] (Thảo luận cặp đôi/nhóm nhỏ).

]
#sp-hd[
- Kết quả tính toán: $overline(x_A) = 5$\; $overline(x_B) = 5$.
- Phát hiện và kết luận: Dù có cùng số trung bình, nhưng #strong[mức độ
  phân tán] (mức độ chênh lệch) của điểm số giữa hai nhóm là rất khác
  nhau (Nhóm A không có sự chênh lệch, Nhóm B có sự chênh lệch lớn). Cần
  các số đặc trưng đo độ phân tán.
- Đề xuất nhu cầu: Cần nghiên cứu các đại lượng như khoảng biến thiên,
  phương sai, độ lệch chuẩn.

]
#tc-hd[
- #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình chiếu ví dụ về hai
  nhóm số liệu và yêu cầu học sinh tính giá trị trung bình, sau đó thảo
  luận câu hỏi gợi mở trong 3 phút.
- #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh tính toán cá nhân, sau
  đó thảo luận cặp đôi để thống nhất câu trả lời và ghi nhận sự khác
  biệt. (GV quan sát, hỗ trợ nếu cần).
- #strong[Bước 3: Báo cáo, thảo luận:] GV mời đại diện 1-2 học sinh
  trình bày kết quả tính toán và nhận định của mình.
- #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa câu trả lời, nhận
  xét sự khác biệt giữa hai mẫu số liệu và dẫn dắt vào bài học:
  #emph["Để mô tả mức độ chênh lệch này, chúng ta cần tìm hiểu các số
  đặc trưng đo độ phân tán."]

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "60 phút")
#strong[GV chia Hoạt động 2 thành 3 hoạt động thành phần để dễ dàng
chiếm lĩnh kiến thức.]

==== Hoạt động 2.1: Khoảng biến thiên và Khoảng tứ phân vị (20 phút)
#emph[Phương pháp: Dạy học giải quyết vấn đề, Thảo luận nhóm nhỏ.]

#mt-hd[
  khoảng biến thiên ($R$) và khoảng tứ phân vị ($Delta_Q$), hiểu được ý
  nghĩa của chúng.
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] Học sinh đọc SGK, thảo luận nhóm 4 để xác định
    định nghĩa và công thức tính #strong[Khoảng biến thiên
    (]$R$#strong[)] và #strong[Tứ phân vị (]$Q_1\,Q_2\,Q_3$#strong[)]
    (Ôn lại cách tính tứ phân vị).
  - #strong[Nhiệm vụ 2:] Vận dụng công thức.
    - #strong[Ví dụ:] Cho mẫu số liệu về chiều cao (cm) của 9 vận động
      viên: ${ 170\,185\,175\,190\,168\,175\,180\,195\,178 }$.
    - Yêu cầu học sinh tính $R$, $Q_1$, $Q_2$, $Q_3$, và $Delta_Q$ cho
      mẫu số liệu trên.
]
#sp-hd[
  - Định nghĩa, công thức tính $R$ và $Delta_Q$.
  - Kết quả tính toán ví dụ: Sắp xếp mẫu số liệu:
    ${ 168\,170\,175\,175\,178\,180\,185\,190\,195 }$.
    - $R = 195 - 168 = 27$ (cm).
    - $Q_1 = 172.5$ (cm), $Q_2 = 178$ (cm), $Q_3 = 187.5$ (cm).
    - $Delta_Q = Q_3 - Q_1 = 187.5 - 172.5 = 15$ (cm).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV yêu cầu học sinh đọc SGK và thực
    hiện Nhiệm vụ 1 & 2 trong 10 phút.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh làm việc cá nhân, sau
    đó thảo luận nhóm. (GV theo dõi, hướng dẫn cách xác định
    $Q_1\,Q_2\,Q_3$ nếu học sinh gặp khó khăn).
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời đại diện 1 nhóm trình
    bày.
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa kiến thức về $R$
    và $Delta_Q$.

==== Hoạt động 2.2: Phương sai và Độ lệch chuẩn (25 phút)
#emph[Phương pháp: Thuyết trình kết hợp minh họa, Thực hành Năng lực
số.]

]
#mt-hd[
  ý nghĩa của Phương sai ($s^2$) và Độ lệch chuẩn ($s$).
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] GV giới thiệu Phương sai và Độ lệch chuẩn (độ
    phân tán xung quanh giá trị trung bình) bằng công thức và ý nghĩa.
  - #strong[Nhiệm vụ 2 (Thực hành - Tích hợp Năng lực số):]
    - #strong[Ví dụ:] Tính phương sai và độ lệch chuẩn cho mẫu số liệu
      về nhiệt độ đo được tại hai thành phố A và B (Đã tính
      $overline(x_A) = overline(x_B) = 25^compose C$).
      - TP A: ${ 24\,25\,26 }$
      - TP B: ${ 20\,25\,30 }$
    - Yêu cầu học sinh sử dụng #strong[máy tính cầm tay] hoặc
      #strong[phần mềm Excel/Google Sheets] để tính $s^2$ và $s$ cho cả
      hai mẫu số liệu trên.
]
#sp-hd[
  - Công thức $s^2$ và $s$.
  - Kết quả tính toán ví dụ (Sử dụng công cụ số):
    - TP A: $s_A^2 approx 0.67$, $s_A approx 0.82^compose C$.
    - TP B: $s_B^2 approx 16.67$, $s_B approx 4.08^compose C$.
    - #emph[Kết luận:] TP B có độ lệch chuẩn lớn hơn, tức là nhiệt độ có
      mức độ phân tán (dao động) lớn hơn.
  - #emph[Biểu hiện Năng lực số:] #strong[Sử dụng các thiết bị và phần
    mềm số để thực hiện các nhiệm vụ học tập] (Học sinh sử dụng máy
    tính/phần mềm để tính Phương sai và Độ lệch chuẩn).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV trình bày định nghĩa, công thức
    $s^2\,s$. Sau đó giao Nhiệm vụ 2 (thực hành tính toán) trong 10
    phút.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thực hành tính toán.
    #strong[GV hỗ trợ] học sinh sử dụng đúng các hàm thống kê trên máy
    tính cầm tay hoặc phần mềm bảng tính.
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời một vài học sinh/nhóm
    chia sẻ kết quả và cách sử dụng công cụ số.
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa kiến thức, nhấn
    mạnh ý nghĩa của $s$ trong thực tiễn (độ lớn của $s$ phản ánh mức độ
    phân tán).

==== Hoạt động 2.3: Phát hiện số liệu bất thường hoặc không chính xác bằng Biểu đồ hộp (15 phút)
#emph[Phương pháp: Trình bày trực quan, Thảo luận nhóm.]

]
#mt-hd[
  để nhận biết các giá trị bất thường (Outliers).
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] GV giới thiệu về Biểu đồ hộp, cách xây dựng và
    quy tắc xác định giá trị bất thường ($Q_1 - 1.5 Delta_Q$ và
    $Q_3 + 1.5 Delta_Q$).
  - #strong[Nhiệm vụ 2:]
    - #strong[Ví dụ:] Quay lại mẫu số liệu chiều cao ở Hoạt động 2.1 và
      thêm một số liệu bất thường:
      ${ 168\,170\,175\,175\,178\,180\,185\,190\,195\,upright(bold(220)) }$.
    - Yêu cầu học sinh sử dụng kết quả $Q_1\,Q_3\,Delta_Q$ đã tính được
      để xác định giá trị bất thường.
]
#sp-hd[
  - Nguyên tắc xác định giá trị bất thường.
  - Kết quả tính toán: $Delta_Q = 15$.
    - Giới hạn dưới: $172.5 - 1.5 times 15 = 150$.
    - Giới hạn trên: $187.5 + 1.5 times 15 = 210$.
    - #emph[Kết luận:] Giá trị #strong[220] nằm ngoài giới hạn trên
      (210), do đó là #strong[số liệu bất thường (Outlier)].
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV giới thiệu Biểu đồ hộp và công
    thức Outliers, sau đó giao Nhiệm vụ 2 (phát hiện số liệu bất thường)
    trong 5 phút.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh tính toán, xác định.
  - #strong[Bước 3: Báo cáo, thảo luận:] Mời học sinh trình bày kết quả,
    GV trình chiếu hình ảnh Biểu đồ hộp để minh họa trực quan.
  - #strong[Bước 4: Kết luận, nhận định:] GV tổng kết, nhấn mạnh Biểu đồ
    hộp là công cụ trực quan hữu hiệu.

]
#hd("3", "Luyện tập", "15 phút")
#emph[Phương pháp: Trò chơi học tập (Đua tốc độ), Làm việc cá
nhân/nhóm.]

#mt-hd[
  $Delta_Q$, $s^2$, $s$ và giải thích ý nghĩa.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Trò chơi #strong[\"Ai nhanh hơn?\"]. GV đưa ra 2
    bài tập tổng hợp (1 bài tính toán đơn giản, 1 bài giải thích ý
    nghĩa).
    - #strong[Bài tập 1 (Tính toán):] Cho hai mẫu số liệu A và B (khác
      nhau). Yêu cầu tính $R$ và $s$ cho cả hai mẫu. (Sử dụng công cụ
      số).
    - #strong[Bài tập 2 (Giải thích):] Cho $s_1 = 2.5$ và $s_2 = 5.0$.
      Giải thích mẫu số liệu nào có độ phân tán lớn hơn và ý nghĩa thực
      tiễn.
]
#sp-hd[
  - Đáp án, lời giải và kết quả tính toán chính xác của Bài tập 1.
  - Lời giải thích của Bài tập 2: Mẫu số liệu 2 có độ lệch chuẩn $s_2$
    lớn hơn $s_1$, do đó mẫu 2 có độ phân tán lớn hơn (các giá trị cách
    xa giá trị trung bình nhiều hơn).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV trình chiếu 2 bài tập. Yêu cầu
    học sinh làm việc cá nhân trong 7 phút.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh làm bài tập.
  - #strong[Bước 3: Báo cáo, thảo luận:] Sau 7 phút, GV mời 2 học sinh
    lên trình bày lời giải và mời cả lớp nhận xét, sửa chữa.
  - #strong[Bước 4: Kết luận, nhận định:] GV tổng kết, khen ngợi những
    học sinh hoàn thành tốt.

]
#hd("4", "Vận dụng", "5 phút")
#emph[Phương pháp: Giao nhiệm vụ dự án nhỏ ngoài giờ lên lớp, Phát triển
kĩ năng giao tiếp/báo cáo.]

#mt-hd[
  vụ vận dụng kiến thức, kĩ năng vào thực tiễn cuộc sống.
]
#nd-hd[
  - #strong[Nhiệm vụ:] #strong[Nghiên cứu thị trường.]
    - Học sinh tự chọn 2 siêu thị (hoặc 2 cửa hàng, 2 nhãn hiệu sản
      phẩm,...) và thu thập giá bán của cùng một loại mặt hàng (ví dụ:
      10 lần giá bán của cùng một loại nước giải khát ở 2 siêu thị khác
      nhau).
    - Sử dụng kiến thức đã học (Số trung bình, Độ lệch chuẩn, Khoảng
      biến thiên) và #strong[công cụ số (Excel/Google Sheets)] để phân
      tích:
      - Siêu thị nào có #strong[giá trung bình] thấp hơn?
      - Siêu thị nào có #strong[độ phân tán (sự ổn định) về giá] thấp
        hơn?
    - #emph[Biểu hiện Năng lực số:] #strong[Sử dụng các thiết bị và phần
      mềm số để phân tích dữ liệu, tạo báo cáo trực quan] (Sử dụng
      Excel/Google Sheets để tính toán và trình bày kết quả).
]
#sp-hd[
  Powerpoint/Word] (Tích hợp Năng lực số) trình bày kết quả thu thập,
  tính toán và nhận xét về sự khác biệt giữa hai siêu thị.
// ]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV giao nhiệm vụ rõ ràng và định
    hướng thời gian thực hiện (1 tuần).
  - #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thực hiện ngoài giờ
    học trên lớp.
  - #strong[Bước 3: Thu nhận, chia sẻ và đánh giá:] Học sinh nộp báo cáo
    (file mềm hoặc in). GV có thể chọn một số báo cáo xuất sắc để chia
    sẻ, trao đổi và đánh giá vào đầu buổi học tiếp theo.

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
