// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 16 Công thức tính góc trong KG",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được công thức tính #strong[góc giữa hai đường thẳng] trong không
  gian Oxyz.
- Nêu được công thức tính #strong[góc giữa đường thẳng và mặt phẳng]
  trong không gian Oxyz.
- Nêu được công thức tính #strong[góc giữa hai mặt phẳng] trong không
  gian Oxyz.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực giải quyết vấn đề Toán học:] Vận dụng linh hoạt các
    công thức tính góc để giải quyết các bài toán liên quan đến hình học
    không gian tọa độ.
  - #strong[Năng lực tư duy và lập luận Toán học:] Phân tích, tổng hợp
    thông tin từ bài toán để lựa chọn công thức và phương pháp giải
    quyết tối ưu.
  - #strong[Năng lực mô hình hóa Toán học:] Sử dụng tọa độ hóa để chuyển
    các bài toán hình học không gian về bài toán đại số (tính toán tọa
    độ vectơ).
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động nghiên cứu, hoàn thành
    nhiệm vụ được giao (như đọc sách giáo khoa, chuẩn bị bài tập vận
    dụng).
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận, trình
    bày và bảo vệ ý kiến cá nhân/nhóm; phân công công việc hiệu quả
    trong nhóm.
- #strong[Năng lực số] (Tích hợp theo Thông tư số 02/2025/TT-BGDĐT):
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, tự giác hoàn thành các nhiệm vụ học tập
  được giao (bài tập cá nhân và nhóm).
- #strong[Trách nhiệm:] Hoàn thành tốt phần việc được phân công trong
  hoạt động nhóm; có ý thức kiểm tra, đối chiếu kết quả để đảm bảo độ
  chính xác.
- #strong[Trung thực:] Nghiêm túc, trung thực trong quá trình tự đánh
  giá và đánh giá kết quả của nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị:] Máy chiếu, máy tính kết nối Internet, máy tính cầm
  tay (Casio/Vinacal).
- #strong[Học liệu:]
  - Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập (in sẵn hoặc phiếu điện tử).
  - Phần mềm #strong[GeoGebra 3D] (dùng để minh họa trực quan các góc và
    kiểm tra kết quả).
  - Tài liệu hướng dẫn sử dụng công cụ số (ví dụ: hướng dẫn tính tích vô
    hướng, độ dài vectơ trên máy tính Casio).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
=== 1. #strong[Hoạt động 1: Khởi động/Xác định vấn đề (10 phút)]
Tên hoạt động: #strong[Hồi tưởng và Đặt vấn đề]

#mt-hd[
Giúp học sinh xác định được vấn đề cụ thể cần
  giải quyết là xây dựng các công thức tính góc trong không gian Oxyz.
]
#nd-hd[
  - #strong[Nhiệm vụ 1:] Giáo viên trình chiếu một bài toán hình học
    không gian cần tính góc giữa hai đường thẳng và đã biết tọa độ các
    vectơ chỉ phương.
  - #strong[Nhiệm vụ 2 (Thảo luận cặp đôi):] Giáo viên đặt câu hỏi:
    \"Nhắc lại công thức tính góc $alpha$ giữa hai vectơ
    $arrow(u)_1\,arrow(u)_2$. Góc giữa hai đường thẳng $d_1\,d_2$ có mối
    quan hệ gì với $alpha$? Công thức tính $c o s\(d_1\,d_2\)$ là gì?\"
]
#sp-hd[
  - Công thức tính góc giữa hai vectơ $arrow(u)_1\,arrow(u)_2$:
    $cos alpha = frac(arrow(u)_1 dot.op arrow(u)_2, \|arrow(u)_1\|dot.op\|arrow(u)_2\|)$.
  - Học sinh xác định được công thức tính góc giữa hai đường thẳng cần
    lấy giá trị tuyệt đối của $cos alpha$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] Giáo viên trình chiếu và giao nhiệm
    vụ 2. (2 phút)
  - #strong[Thực hiện nhiệm vụ:] Học sinh thảo luận theo cặp đôi, ghi
    nhanh câu trả lời. Giáo viên theo dõi, hỗ trợ. (4 phút)
  - #strong[Báo cáo, thảo luận:] Mời 1-2 cặp đôi trình bày kết quả. Giáo
    viên dẫn dắt để học sinh nhận ra vấn đề cần giải quyết là xây dựng
    công thức cho các loại góc trong không gian (đường-đường, đường-mặt,
    mặt-mặt). (3 phút)
  - #strong[Kết luận, nhận định:] Giáo viên chốt lại mục tiêu bài học.
    (1 phút)

=== 2. #strong[Hoạt động 2: Hình thành kiến thức mới/Giải quyết vấn đề (60 phút)]
==== #strong[2.1. Hoạt động thành phần 2.1: Công thức tính góc giữa hai đường thẳng (20 phút)]
Tên hoạt động: #strong[Khám phá và Thiết lập Công thức Đường - Đường]

]
#mt-hd[
Học sinh xây dựng và nắm vững công thức tính góc
  giữa hai đường thẳng.
]
#nd-hd[
  - #strong[Nhiệm vụ nhóm (4-5 HS):] Nghiên cứu SGK và thảo luận về mối
    liên hệ giữa góc giữa hai đường thẳng $phi$ và góc giữa hai vectơ
    chỉ phương $arrow(u)_1\,arrow(u)_2$.
  - #strong[Ví dụ cụ thể:] Cho hai đường thẳng
    $d_1 : frac(x - 1, 2) = frac(y, - 1) = frac(z + 2, 1)$ và $d_2$ qua
    $M\(1\;1\;1\)$ và có VTCP $arrow(u)_2 =\(3\;1\;- 1\)$. Hãy tính góc
    giữa $d_1$ và $d_2$.
]
#sp-hd[
  - Công thức:
    $cos phi = frac(\|arrow(u)_1 dot.op arrow(u)_2\|, \|arrow(u)_1\|dot.op\|arrow(u)_2\|)$.
  - Lời giải chính xác cho ví dụ minh họa.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] Giáo viên giao nhiệm vụ nhóm, yêu
    cầu nhóm #strong[phân tích và tổng hợp thông tin] để tìm công thức
    và giải ví dụ. (2 phút)
  - #strong[Thực hiện nhiệm vụ:] Học sinh hoạt động nhóm. Giáo viên
    hướng dẫn sử dụng máy tính Casio để tính tích vô hướng và độ dài
    vectơ. (10 phút)
  - #strong[Báo cáo, thảo luận:] Mời một nhóm trình bày kết quả. Các
    nhóm khác phản biện. (6 phút)
  - #strong[Kết luận, nhận định:] Giáo viên chốt kiến thức, hoàn thiện
    công thức và lời giải ví dụ. (2 phút)
  - #strong[Tích hợp Năng lực số:] Học sinh sử dụng máy tính Casio để
    tính tích vô hướng và độ dài vectơ #strong[\(Sử dụng công cụ kĩ
    thuật số)].

==== #strong[2.2. Hoạt động thành phần 2.2: Công thức tính góc giữa đường thẳng và mặt phẳng (20 phút)]
Tên hoạt động: #strong[Khám phá và Thiết lập Công thức Đường - Mặt]

]
#mt-hd[
Học sinh xây dựng và nắm vững công thức tính góc
  giữa đường thẳng và mặt phẳng.
]
#nd-hd[
  - #strong[Nhiệm vụ cá nhân - Thảo luận nhóm:] Nghiên cứu SGK và thảo
    luận về mối liên hệ giữa góc $phi$ giữa $d$ và $\(P\)$ và góc giữa
    VTCP $arrow(u)$ của $d$ và VTPT $arrow(n)$ của $\(P\)$.
  - #strong[Ví dụ cụ thể:] Cho đường thẳng $d$ qua $A\(1\,0\,1\)$ và
    $B\(0\,1\,0\)$, và mặt phẳng $\(P\): x - y + 2 z - 1 = 0$. Tính góc
    giữa $d$ và $\(P\)$.
]
#sp-hd[
  - Công thức:
    $sin phi = frac(\|arrow(u) dot.op arrow(n)\|, \|arrow(u)\|dot.op\|arrow(n)\|)$.
  - Lời giải chính xác cho ví dụ minh họa.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] Giáo viên giao nhiệm vụ cá nhân (tìm
    VTCP $arrow(u)$) sau đó chuyển sang thảo luận nhóm (tìm công thức và
    giải ví dụ). (2 phút)
  - #strong[Thực hiện nhiệm vụ:] Học sinh hoạt động cá nhân/nhóm. Giáo
    viên gợi ý sự liên hệ $phi$ và $gamma =\(arrow(u)\,arrow(n)\)$. (10
    phút)
  - #strong[Báo cáo, thảo luận (Trò chơi học tập):] Tổ chức \"Ai nhanh
    hơn\" với 2-3 cặp nhóm lên bảng trình bày, nhấn mạnh tại sao lại
    dùng $sin$. (6 phút)
  - #strong[Kết luận, nhận định:] Giáo viên chốt kiến thức. (2 phút)
  - #strong[Tích hợp Năng lực số:] Học sinh sử dụng #strong[GeoGebra 3D]
    (trên máy chiếu) để minh họa mối quan hệ giữa góc $phi$ và vectơ
    pháp tuyến $arrow(n)$ #strong[\(Tương tác trong môi trường số)].

==== #strong[2.3. Hoạt động thành phần 2.3: Công thức tính góc giữa hai mặt phẳng (20 phút)]
Tên hoạt động: #strong[Khám phá và Thiết lập Công thức Mặt - Mặt]

]
#mt-hd[
Học sinh xây dựng và nắm vững công thức tính góc
  giữa hai mặt phẳng.
]
#nd-hd[
  - #strong[Nhiệm vụ nhóm (4-5 HS):] Nghiên cứu SGK và thảo luận về mối
    liên hệ giữa góc $phi$ giữa $\(P\)$ và $\(Q\)$ và góc giữa hai VTPT
    $arrow(n)_P\,arrow(n)_Q$.
  - #strong[Ví dụ cụ thể:] Tính góc giữa hai mặt phẳng
    $\(P\): x + 2 y - z + 3 = 0$ và $\(Q\): 2 x - y + 2 z - 1 = 0$.
]
#sp-hd[
  - Công thức:
    $cos phi = frac(\|arrow(n)_P dot.op arrow(n)_Q\|, \|arrow(n)_P\|dot.op\|arrow(n)_Q\|)$.
  - Lời giải chính xác cho ví dụ minh họa.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] Giáo viên giao nhiệm vụ nhóm, yêu
    cầu nhóm hoàn thành giải ví dụ và chuẩn bị #strong[Sơ đồ tư duy] tóm
    tắt cả 3 công thức đã học. (2 phút)
  - #strong[Thực hiện nhiệm vụ:] Học sinh hoạt động nhóm. (10 phút)
  - #strong[Báo cáo, thảo luận (Sơ đồ tư duy/Thuyết trình):] Mời một
    nhóm trình chiếu sơ đồ tư duy (qua máy chiếu) và #strong[phân tích,
    tổng hợp] điểm giống/khác nhau của 3 công thức. (6 phút)
  - #strong[Kết luận, nhận định:] Giáo viên tổng kết kiến thức, hoàn
    thiện công thức. (2 phút)
  - #strong[Tích hợp Năng lực số:] Nhóm trình bày sử dụng công cụ số (ví
    dụ: #strong[Canva, MindMap Online]) để tạo sơ đồ tư duy
    #strong[\(Sáng tạo nội dung số, Sử dụng công cụ kĩ thuật số)].

=== 3. #strong[Hoạt động 3: Luyện tập (15 phút)]
Tên hoạt động: #strong[Thực hành Tính góc Tổng hợp]

]
#mt-hd[
Vận dụng linh hoạt cả 3 công thức đã học để giải
  quyết các bài toán tổng hợp, phát triển các kĩ năng vận dụng kiến
  thức.
]
#nd-hd[
  - #strong[Bài tập 1 (Đường-Đường):] Cho 4 điểm
    $A\(1\,1\,0\)\,B\(1\,- 1\,1\)\,C\(0\,2\,- 1\)\,D\(1\,0\,1\)$. Tính
    góc giữa đường thẳng $A B$ và $C D$.
  - #strong[Bài tập 2 (Đường-Mặt):] Tính góc giữa trục $O z$ và mặt
    phẳng $\(P\): x - y + sqrt(2) z - 5 = 0$.
  - #strong[Bài tập 3 (Mặt-Mặt):] Tính góc giữa hai mặt phẳng
    $\(O x y\)$ và $\(P\): x - y + sqrt(2) z - 5 = 0$.
]
#sp-hd[
  - Đáp án và lời giải chi tiết cho 3 bài tập.
]
#tc-hd[
  - #strong[Giao nhiệm vụ học tập:] Giáo viên giao 3 bài tập, yêu cầu
    học sinh làm việc cá nhân. (2 phút)
  - #strong[Thực hiện nhiệm vụ:] Học sinh thực hiện nhiệm vụ, tập trung
    #strong[phân tích] để chọn đúng vectơ và công thức. (5 phút)
  - #strong[Báo cáo, thảo luận:] Mời 3 học sinh lên trình bày lời giải.
    Học sinh khác nhận xét, đối chiếu. (8 phút)

=== 4. #strong[Hoạt động 4: Vận dụng (5 phút)]
Tên hoạt động: #strong[Góc nhìn thực tiễn và Kết nối]

]
#mt-hd[
Phát triển năng lực của học sinh thông qua nhiệm
  vụ/yêu cầu vận dụng kiến thức, kĩ năng vào thực tiễn.
]
#nd-hd[
  - #strong[Nhiệm vụ cá nhân (Thực hiện ngoài giờ):] Hãy tìm kiếm (trên
    Internet hoặc thực tế) một mô hình kiến trúc hoặc kỹ thuật (ví dụ:
    giàn không gian, cầu thang xoắn) có thể mô hình hóa thành tọa độ
    Oxyz. Mô tả tình huống và đề xuất công thức tính góc cần thiết
    (đường-đường, đường-mặt, hoặc mặt-mặt) để giải quyết một vấn đề kỹ
    thuật nào đó trong mô hình đó.
]
#sp-hd[
  - Báo cáo ngắn (Word, ảnh/chú thích, hoặc PowerPoint) trình bày kết
    quả tìm kiếm, mô tả và đề xuất.
]
#tc-hd[
  - Giáo viên giao nhiệm vụ về nhà và hướng dẫn cách thức nộp báo cáo.
  - #strong[Tích hợp Năng lực số:] Học sinh sử dụng công cụ tìm kiếm và
    các ứng dụng văn phòng/trình chiếu để tạo báo cáo (ví dụ: Google
    Docs, PowerPoint) #strong[\(Sáng tạo nội dung số, Sử dụng công cụ kĩ
    thuật số)].

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
