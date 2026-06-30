// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 11 Nguyên hàm",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[nguyên hàm] của một hàm số trên một khoảng.
- Nêu được khái niệm #strong[họ nguyên hàm] của một hàm số và kí hiệu
  $integral f\(x\)d x$.
- Phát biểu và vận dụng được các #strong[tính chất cơ bản] của nguyên
  hàm (Tính chất tuyến tính, tính chất hằng số).
- Xác định được công thức nguyên hàm của #strong[một số hàm số thường
  gặp] (hàm số luỹ thừa, hàm số lượng giác: $sin x\,c o s x$, hàm số mũ:
  $e^x\,a^x$).

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm hiểu khái niệm, công thức
    nguyên hàm qua SGK và các học liệu điện tử.
  - #strong[Giao tiếp và hợp tác:] Thảo luận nhóm để giải quyết các bài
    toán tìm nguyên hàm và trình bày kết quả.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp thông
    tin để lập sơ đồ tư duy về các công thức nguyên hàm.
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận toán học:] Hình thành khái niệm
    nguyên hàm từ bài toán ngược của phép tính vi phân. Lập luận để
    chứng minh các tính chất và công thức nguyên hàm.
  - #strong[Năng lực mô hình hoá toán học:] Vận dụng công thức để giải
    quyết các bài toán thực tiễn đơn giản liên quan đến tốc độ thay đổi
    và quãng đường.
  - #strong[Năng lực tính toán:] Tính được nguyên hàm của các hàm số cơ
    bản và hàm số phức tạp hơn (sử dụng tính chất tuyến tính).
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Hoàn thành các nhiệm vụ học tập được giao, đặc biệt
  là các bài tập luyện tập và vận dụng.
- #strong[Trách nhiệm:] Có trách nhiệm trong hoạt động nhóm, đóng góp ý
  kiến xây dựng bài học.
- #strong[Trung thực:] Thể hiện sự trung thực trong quá trình làm bài
  tập và tự đánh giá.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính kết nối mạng, bảng
  phụ/giấy A0, phiếu học tập.
- #strong[Học liệu:] Sách giáo khoa Toán 12 (Kết nối tri thức với cuộc
  sống), tài liệu tham khảo, các app/web hỗ trợ vẽ đồ thị và tính toán
  (GeoGebra, Symbolab), các công cụ tạo trò chơi học tập (Kahoot!,
  Quizizz) hoặc file Word/PowerPoint chứa sơ đồ tư duy mẫu.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#strong[Phương pháp dạy học chủ đạo:] Dạy học giải quyết vấn đề, Phương
pháp Bàn tay nặn bột (cho HĐ mở đầu), Tổ chức hoạt động nhóm/Trò chơi
học tập, Tích hợp công nghệ số.

#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "1 tiết")
#mt-hd[
Tạo hứng thú, gợi động cơ học tập và giúp học
  sinh nhận diện được #strong[vấn đề ngược] của phép tính đạo hàm, từ đó
  dẫn đến nhu cầu tìm hiểu khái niệm #strong[Nguyên hàm].
]
#nd-hd[
Giáo viên đặt vấn đề thông qua một #strong[bài
  toán thực tiễn/vật lí] đơn giản.
  - #emph[Ví dụ minh họa:] Một vật chuyển động với #strong[vận tốc]
    $v\(t\)= 2 t + 1$ (m/s). Hãy tìm #strong[hàm biểu thị quãng đường]
    $s\(t\)$ vật đi được, biết rằng $s\(0\)= 0$.
  - #strong[Nhiệm vụ:] HS làm việc cá nhân/nhóm nhỏ, thảo luận và đề
    xuất hàm $s\(t\)$ bằng cách \"ngược\" lại phép tính đạo hàm đã học ở
    lớp 11.
]
#sp-hd[
  - Câu trả lời (dự đoán) về hàm $s\(t\)$ (ví dụ:
    $s\(t\)= t^2 + t + C$).
  - Xác định được rằng bài toán đang tìm kiếm một hàm số có đạo hàm là
    hàm $v\(t\)$ đã cho.
  - Xác định được #strong[vấn đề cần giải quyết]: Cần xây dựng một phép
    toán/khái niệm mới để tìm hàm số từ đạo hàm của nó.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV chiếu bài toán thực tiễn, yêu cầu HS đọc
    và thảo luận trong 5 phút.
  - #strong[Thực hiện nhiệm vụ:] HS làm việc. GV quan sát, gợi ý: \"Hàm
    số nào mà đạo hàm của nó là $2 t + 1$?\" (Dự kiến khó khăn: HS có
    thể quên hằng số $C$. GV gợi ý: Đạo hàm của $t^2 + t + 5$ là gì? Đạo
    hàm của $t^2 + t + 100$ là gì?).
  - #strong[Báo cáo, thảo luận:] GV mời 2-3 nhóm/cá nhân trình bày kết
    quả. GV điều hành thảo luận để HS nhận ra sự tồn tại của
    #strong[hằng số] $C$.
  - #strong[Kết luận, nhận định:] GV chuẩn hóa câu trả lời và dẫn dắt
    vào khái niệm \"Nguyên hàm\".

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "3 tiết")
==== Hoạt động thành phần 2.1: Nguyên hàm của một hàm số (Khái niệm nguyên hàm; Họ nguyên hàm) (1 tiết)
#mt-hd[
Giúp HS chiếm lĩnh kiến thức về #strong[khái
  niệm nguyên hàm] và #strong[họ nguyên hàm], hiểu rõ ý nghĩa của hằng
  số $C$.
]
#nd-hd[
HS làm việc với SGK, kết hợp với kết quả từ Hoạt
  động 1.
  - #strong[Nhiệm vụ 1:] HS đọc SGK, tự định nghĩa Nguyên hàm.
  - #strong[Nhiệm vụ 2:] Chứng minh nếu $F\(x\)$ là một nguyên hàm của
    $f\(x\)$ thì $F\(x\)+ C$ cũng là một nguyên hàm.
  - #strong[Nhiệm vụ 3:] Phát biểu định lí về mối liên hệ giữa các
    nguyên hàm của một hàm số.
  - #strong[Ví dụ minh họa:] Cho $f\(x\)= 1 / x^2$. Hãy tìm một nguyên
    hàm của $f\(x\)$ trên $\(0\;+ oo\)$.
]
#sp-hd[
  - Định nghĩa chính xác về Nguyên hàm.
  - Công thức của Họ nguyên hàm: $integral f\(x\)d x = F\(x\)+ C$.
  - Lời giải cho ví dụ: $F\(x\)= - 1 / x + C$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV yêu cầu HS làm việc cá nhân/nhóm nhỏ (5
    phút).
  - #strong[Thực hiện nhiệm vụ:] HS tự nghiên cứu SGK. GV theo dõi, hỗ
    trợ, nhấn mạnh sự cần thiết của điều kiện về #strong[khoảng]
    $\(a\;b\)$.
  - #strong[Báo cáo, thảo luận:] GV mời HS trình bày định nghĩa và định
    lí. GV yêu cầu HS #strong[vẽ minh họa] (sử dụng GeoGebra hoặc phác
    thảo) các đồ thị của hàm $y = - 1 / x + C$ với các giá trị $C$ khác
    nhau, để trực quan hóa khái niệm #strong[Họ nguyên hàm].

==== Hoạt động thành phần 2.2: Tính chất cơ bản của nguyên hàm (1 tiết)
]
#mt-hd[
Giúp HS nắm vững và vận dụng được #strong[tính
  chất tuyến tính] của nguyên hàm để giải quyết các bài toán phức hợp.
]
#nd-hd[
HS làm việc nhóm, rút ra các tính chất từ phép
  tính đạo hàm đã học.
  - #strong[Nhiệm vụ 1:] Từ công thức
    $\(k dot.op u\(x\)\)'= k dot.op u'\(x\)$ và
    $\(u\(x\)plus.minus v\(x\)\)'= u'\(x\)plus.minus v'\(x\)$, HS rút ra
    hai tính chất cơ bản của nguyên hàm.
  - #strong[Nhiệm vụ 2 (Áp dụng):] Tính
    $integral\(5 x^4 - 2 sin x\)d x$.
  - #strong[Ví dụ minh họa:] Tìm nguyên hàm của hàm số
    $f\(x\)= frac(x^2 - 2 x + 1, x)$. (Gợi ý: Phân tích tử số).
]
#sp-hd[
  - Tính chất 1:
    $integral k dot.op f\(x\)d x = k dot.op integral f\(x\)d x$ (với $k$
    là hằng số khác 0).
  - Tính chất 2:
    $integral\(f\(x\)plus.minus g\(x\)\)d x = integral f\(x\)d x plus.minus integral g\(x\)d x$.
  - Lời giải cho Ví dụ áp dụng:
    $integral\(5 x^4 - 2 sin x\)d x = 5 integral x^4 d x - 2 integral s i n x d x = x^5 + 2 cos x + C$.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV yêu cầu HS làm việc nhóm (7 phút) để rút
    ra tính chất và giải Ví dụ áp dụng.
  - #strong[Thực hiện nhiệm vụ:] HS thảo luận. GV quan sát, tập trung hỗ
    trợ các nhóm gặp khó khăn trong việc phân tích hàm số (Ví dụ minh
    họa).
  - #strong[Báo cáo, thảo luận:] GV mời đại diện nhóm lên trình bày,
    giải thích cách áp dụng tính chất 1 và 2. GV chuẩn hóa công thức.

==== Hoạt động thành phần 2.3: Nguyên hàm của một số hàm số thường gặp (1 tiết)
]
#mt-hd[
Giúp HS thiết lập và ghi nhớ các công thức
  nguyên hàm cơ bản để làm nền tảng cho việc tính toán.
]
#nd-hd[
HS nghiên cứu SGK để thiết lập bảng công thức,
  sau đó áp dụng giải bài tập nhanh.
  - #strong[Nhiệm vụ 1:] Thiết lập bảng công thức nguyên hàm cho hàm luỹ
    thừa ($integral x^alpha d x$), hàm mũ
    ($integral e^x d x\,integral a^x d x$), hàm lượng giác
    ($integral s i n x d x\,integral c o s x d x$).
  - #strong[Nhiệm vụ 2 (Trò chơi học tập):] #strong[\"Tiếp sức công
    thức\"] - Mỗi nhóm lần lượt điền một công thức vào bảng công thức
    chung.
  - #strong[Ví dụ minh họa:]
    - Tính $integral (1 / sqrt(x) - e^x) d x$ trên $\(0\;+ oo\)$.
    - Tính $integral\(s i n x - 4^x\)d x$.
]
#sp-hd[
Bảng công thức nguyên hàm cơ bản đầy đủ. Lời
  giải đúng cho các ví dụ minh họa.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV giao nhiệm vụ cho HS tự thiết lập bảng
    công thức (7 phút). Sau đó tổ chức #strong[Trò chơi học tập] (5
    phút).
  - #strong[Thực hiện nhiệm vụ:] HS làm việc. GV giám sát trò chơi, khen
    thưởng nhóm hoàn thành nhanh và chính xác nhất.
  - #strong[Báo cáo, thảo luận:] GV chiếu bảng công thức chuẩn, yêu cầu
    HS giải thích cách chuyển từ $1 / sqrt(x)$ thành $x^(- 1 / 2)$ để áp
    dụng công thức luỹ thừa.
  - #strong[Tích hợp năng lực số (TT 02/2025/TT-BGDĐT):] GV hướng dẫn HS
    sử dụng máy tính cầm tay (hoặc phần mềm) để #strong[kiểm tra] một
    công thức nguyên hàm bất kì bằng cách #strong[tính đạo hàm] của kết
    quả. #emph[\(Biểu hiện: Sử dụng chức năng tính đạo hàm của máy tính
    để kiểm tra công thức)]

]
#hd("3", "Luyện tập", "0.5 tiết")
#mt-hd[
Vận dụng linh hoạt các khái niệm, tính chất và
  công thức cơ bản để giải các bài tập tính nguyên hàm, rèn luyện kỹ
  năng tính toán.
]
#nd-hd[
Hệ thống các bài tập đa dạng, tập trung vào việc
  nhận dạng và biến đổi hàm số để áp dụng công thức.
  - #strong[Bài tập 1:] Tìm họ nguyên hàm của
    $f\(x\)= root(3, x) + frac(2, cos^2 x)$.
  - #strong[Bài tập 2:] Tìm hàm số $F\(x\)$ biết
    $F'\(x\)= 3 e^x - 4 x^3$ và $F\(0\)= 5$. (Bài toán xác định hằng số
    C).
  - #strong[Bài tập 3 (Thảo luận nhóm):] Tính
    $integral frac(\(x^2 + 1\)^2, x^2) d x$.
]
#sp-hd[
Lời giải chi tiết và đáp án chính xác của 3 bài
  tập.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV giao 3 bài tập (phiếu học tập). Bài 1, 2
    làm cá nhân (7 phút), Bài 3 làm việc nhóm (7 phút).
  - #strong[Thực hiện nhiệm vụ:] HS làm việc. GV quan sát, tập trung hỗ
    trợ các nhóm gặp khó khăn trong việc #strong[biến đổi] hàm số ở Bài
    3
    ($frac(\(x^2 + 1\)^2, x^2) = frac(x^4 + 2 x^2 + 1, x^2) = x^2 + 2 + x^(- 2)$).
  - #strong[Báo cáo, thảo luận:] GV mời đại diện 3 HS/nhóm lên bảng
    trình bày. HS khác nhận xét, góp ý. GV chuẩn hóa lời giải.

]
#hd("4", "Vận dụng", "0.5 tiết")
#mt-hd[
Phát triển năng lực mô hình hoá toán học, vận
  dụng kiến thức nguyên hàm để giải quyết các vấn đề thực tiễn.
]
#nd-hd[
Giao nhiệm vụ tìm tòi và báo cáo ngoài giờ học.
  - #strong[Nhiệm vụ:] Tìm kiếm các vấn đề thực tiễn (trong Vật lí, Kinh
    tế, Sinh học...) mà việc giải quyết đòi hỏi phải sử dụng phép tính
    nguyên hàm (ví dụ: Tính quãng đường từ vận tốc, tính tổng chi phí từ
    chi phí cận biên, tính dân số từ tốc độ tăng trưởng).
  - #strong[Yêu cầu:] Học sinh #strong[lập sơ đồ tư duy] (có thể sử dụng
    các công cụ số như MindMeister, Canva để phát triển #strong[năng lực
    số] - #emph[Biểu hiện: Sáng tạo và trình bày thông tin thông qua
    công cụ số]) hoặc viết báo cáo ngắn để mô tả vấn đề và trình bày
    cách thức giải quyết bằng công cụ nguyên hàm.
]
#sp-hd[
  - Sơ đồ tư duy/Báo cáo phát hiện vấn đề và đề xuất giải pháp (nội dung
    và hình thức báo cáo đa dạng: trình chiếu PowerPoint, báo cáo viết,
    sơ đồ tư duy).
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV giải thích rõ yêu cầu và tiêu chí đánh
    giá cho nhiệm vụ thực hiện ngoài giờ.
  - #strong[Thực hiện nhiệm vụ:] HS thực hiện ở nhà, nộp báo cáo (file
    mềm/ảnh chụp sơ đồ tư duy) vào buổi học kế tiếp hoặc thời điểm phù
    hợp. GV khuyến khích sự sáng tạo trong việc sử dụng công cụ số.

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
