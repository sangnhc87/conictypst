// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "HĐTHTN 1 KS và VĐT với phần mền Geogebra",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được các bước cơ bản để #strong[khảo sát và vẽ đồ thị hàm số] bậc
  ba, bậc bốn trùng phương và hàm phân thức bậc nhất trên bậc nhất.
- Trình bày được cách sử dụng các lệnh cơ bản trong #strong[phần mềm
  GeoGebra] (hoặc phần mềm Toán học tương tự) để thực hiện các bước khảo
  sát hàm số như: tính đạo hàm, tìm cực trị, tìm tiệm cận, vẽ đồ thị.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực mô hình hóa Toán học:] Mô hình hóa các bước khảo
    sát hàm số bằng quy trình làm việc trên phần mềm.
  - #strong[Năng lực giải quyết vấn đề Toán học:] Vận dụng linh hoạt các
    lệnh của GeoGebra để giải quyết các vấn đề liên quan đến hàm số (cực
    trị, GTLN-GTNN, tiệm cận).
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động #strong[nghiên cứu tài
    liệu], tìm hiểu các lệnh của GeoGebra và tự thực hiện các nhiệm vụ
    được giao.
  - #strong[Năng lực giao tiếp và hợp tác:] #strong[Thảo luận nhóm] hiệu
    quả, phân công nhiệm vụ, #strong[trình bày, báo cáo] kết quả rõ
    ràng, mạch lạc, sử dụng các công cụ số để tạo báo cáo (ví dụ: Google
    Docs, PowerPoint, \...).
- #strong[Năng lực số:]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực, nghiêm túc #strong[thực hiện đầy đủ] các
  nhiệm vụ thực hành, trải nghiệm.
- #strong[Trách nhiệm:] Hoàn thành tốt nhiệm vụ được giao trong nhóm,
  #strong[trung thực] trong việc trình bày kết quả.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, Máy tính kết nối mạng, Hệ
  thống máy tính/Laptop/Máy tính bảng cho học sinh (hoặc điện thoại
  thông minh có cài GeoGebra Classic).
- #strong[Học liệu:]
  - Phần mềm #strong[GeoGebra Classic] (hoặc GeoGebra Graphing
    Calculator).
  - Tài liệu hướng dẫn sử dụng GeoGebra cơ bản (dạng file PDF hoặc
    video).
  - Phiếu giao nhiệm vụ thực hành trải nghiệm theo nhóm (bản in hoặc bản
    số).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Khởi động và Xác định vấn đề", "10 phút")
#mt-hd[
Tạo hứng thú và xác định rõ vấn đề học tập:
  \"Làm thế nào để khảo sát và vẽ đồ thị hàm số một cách nhanh chóng,
  trực quan và chính xác bằng công nghệ?\".
]
#nd-hd[
  - Giáo viên (GV) đưa ra một #strong[đồ thị hàm số phức tạp] (ví dụ:
    $y = frac(x^3 - 3 x^2 + 2, x - 1)$) và yêu cầu học sinh (HS) mô tả
    nhanh các đặc điểm (cực trị, tiệm cận, khoảng đồng biến/nghịch biến)
    chỉ bằng cách quan sát.
  - GV đặt câu hỏi: \"Nếu không có công cụ, việc khảo sát và vẽ đồ thị
    này sẽ mất bao nhiêu thời gian? Liệu có công cụ nào giúp chúng ta
    thực hiện việc này nhanh hơn và trực quan hơn không?\".
]
#sp-hd[
HS trả lời miệng về các đặc điểm của đồ thị và
  xác nhận #strong[GeoGebra] là công cụ hữu ích.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV chiếu đồ thị hàm số và đặt câu hỏi gợi
    mở.
  - #strong[Thực hiện nhiệm vụ:] HS quan sát, suy nghĩ cá nhân (1 phút).
  - #strong[Báo cáo, thảo luận:] GV mời 1-2 HS trình bày nhận xét. GV
    dẫn dắt vào bài học.
  - #strong[Kết luận, nhận định:] GV giới thiệu GeoGebra và nêu rõ nhiệm
    vụ: Sử dụng GeoGebra để khảo sát chi tiết và vẽ đồ thị hàm số, biến
    quá trình phức tạp thành thao tác trực quan, nhanh chóng.
  - #emph[Tích hợp Năng lực số:] #strong[Tìm kiếm thông tin] (HS tìm
    kiếm nhanh trên điện thoại/máy tính các lợi ích của GeoGebra).
    #emph[Biểu hiện:] #strong[Tìm kiếm, chọn lọc] và #strong[lưu trữ]
    thông tin.

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "50 phút")
#strong[a) Mục tiêu:] HS chiếm lĩnh kiến thức và kỹ năng sử dụng
GeoGebra để thực hiện từng bước trong quy trình khảo sát hàm số, giải
quyết vấn đề đã đặt ra từ Hoạt động 1.

#strong[b) Nội dung:] Các nhóm HS thực hành trên GeoGebra theo quy trình
đã được phân chia thành các hoạt động thành phần dưới đây.

#strong[c) Sản phẩm:] Các file GeoGebra, các kết quả tính toán, đồ thị,
sơ đồ tư duy (mindmap) của nhóm về các bước khảo sát hàm số và cách dùng
lệnh trong GeoGebra.

#strong[d) Tổ chức thực hiện:] GV giao nhiệm vụ, hướng dẫn, hỗ trợ từng
nhóm. GV khuyến khích HS quay video/chụp màn hình để làm tư liệu báo
cáo. #emph[Tích hợp Năng lực số:] #strong[Xử lí thông tin,] #strong[Sử
dụng công cụ số] (sử dụng các lệnh của GeoGebra, quay phim/chụp ảnh màn
hình). #emph[Biểu hiện:] #strong[Sử dụng các ứng dụng] và #strong[thiết
bị số], #strong[Thao tác] và #strong[xử lí] dữ liệu.

==== 2.1. Hoạt động thành phần 2.1: Tính đạo hàm của hàm số (10 phút)
- #strong[Nội dung:] HS thực hiện các lệnh để tính: Đạo hàm của hàm số
  trên một khoảng; Đạo hàm của hàm số tại một điểm; Đạo hàm cấp cao.
- #strong[Ví dụ đề xuất:] Cho hàm số $f\(x\)= x^4 - 2 x^2 + 3$.
  - Sử dụng lệnh #strong[Derivative(f)] để tính đạo hàm $f'\(x\)$.
  - Sử dụng lệnh #strong[f\'(1)] để tính đạo hàm tại $x = 1$.
  - Sử dụng lệnh #strong[Derivative(f, 2)] hoặc #strong[f\'\'(x)] để
    tính đạo hàm cấp hai.
- #strong[Sản phẩm:] Kết quả tính đạo hàm $f'\(x\)$, $f''\(x\)$ và giá
  trị $f'\(1\)$ hiển thị trên GeoGebra.

==== 2.2. Hoạt động thành phần 2.2: Tìm cực trị của hàm số (10 phút)
- #strong[Nội dung:] HS sử dụng GeoGebra để tìm các điểm cực trị (cực
  đại, cực tiểu) của hàm số.
- #strong[Ví dụ đề xuất:] Cho hàm số $f\(x\)= x^3 - 3 x + 2$.
  - Nhập hàm số vào GeoGebra.
  - Sử dụng lệnh #strong[Extremum(f)] để tìm tọa độ các điểm cực trị.
- #strong[Sản phẩm:] Tọa độ các điểm cực trị $\(1\;0\)$ và $\(- 1\;4\)$
  hiển thị rõ ràng trên đồ thị và Cửa sổ Đại số.

==== 2.3. Hoạt động thành phần 2.3: Tìm giá trị lớn nhất, giá trị nhỏ nhất của hàm số (10 phút)
- #strong[Nội dung:] HS sử dụng chức năng của GeoGebra để tìm GTLN, GTNN
  của hàm số trên đoạn hoặc khoảng xác định.
- #strong[Ví dụ đề xuất:] Cho hàm số $g\(x\)= frac(x - 1, x + 1)$ trên
  đoạn $\[- 3\;0\]$.
  - Sử dụng lệnh #strong[Min(g, -3, 0)] và #strong[Max(g, -3, 0)] để tìm
    GTNN và GTLN.
- #strong[Sản phẩm:] Giá trị $M i n\(g\)$ và $M a x\(g\)$ hiển thị, cùng
  với vị trí đạt được các giá trị đó.

==== 2.4. Hoạt động thành phần 2.4: Tìm các đường tiệm cận của đồ thị hàm số (10 phút)
- #strong[Nội dung:] HS sử dụng lệnh để tìm các đường tiệm cận (đứng,
  ngang, xiên) của đồ thị hàm số.
- #strong[Ví dụ đề xuất:] Cho hàm số $h\(x\)= frac(2 x + 3, x - 1)$
  (Tiệm cận đứng, ngang).
  - Sử dụng lệnh #strong[Asymptote(h)].
- #strong[Sản phẩm:] Các đường tiệm cận $x = 1$ và $y = 2$ được vẽ và
  hiển thị rõ trên đồ thị.

==== 2.5. Hoạt động thành phần 2.5: Vẽ đồ thị hàm số (10 phút)
- #strong[Nội dung:] HS vẽ đồ thị hàm số và tùy chỉnh hiển thị (màu sắc,
  độ dày, lưới, \...).
- #strong[Ví dụ đề xuất:] Vẽ đồ thị hàm số bậc bốn trùng phương
  $k\(x\)= x^4 - 4 x^2 + 1$.
- #strong[Sản phẩm:] Đồ thị hàm số $k\(x\)$ được vẽ chính xác, kèm theo
  các điểm cực trị đã tìm được ở bước 2.2.

#hd("3", "Luyện tập", "20 phút")
#mt-hd[
Vận dụng kiến thức, kĩ năng GeoGebra vừa học để
  thực hành khảo sát và vẽ một hàm số hoàn chỉnh, củng cố các lệnh và
  quy trình.
]
#nd-hd[
Thực hành khảo sát chi tiết và vẽ đồ thị
  #strong[hàm số phân thức] $y = frac(x + 2, x - 1)$.
  - #strong[Nhiệm vụ nhóm:] Mỗi nhóm thực hiện #strong[toàn bộ quy
    trình] khảo sát (Đạo hàm, Cực trị, Tiệm cận, Vẽ đồ thị) cho hàm số
    trên, sử dụng GeoGebra và #strong[hoàn thành Sơ đồ tư duy] tóm tắt
    quy trình (bản giấy hoặc bản số).
]
#sp-hd[
  - Đồ thị hàm số $y = frac(x + 2, x - 1)$ trên GeoGebra, có hiển thị
    tiệm cận và điểm giao trục.
  - Báo cáo/Sơ đồ tư duy về quy trình khảo sát bằng GeoGebra. \*
    #strong[d) Tổ chức thực hiện:]
  - #strong[Giao nhiệm vụ:] GV giao nhiệm vụ thực hành hoàn chỉnh.
    Khuyến khích HS sử dụng công cụ số để thiết kế Sơ đồ tư duy (ví dụ:
    MindMeister, Canva).
  - #strong[Thực hiện nhiệm vụ:] HS làm việc nhóm, phân công nhiệm vụ,
    hỗ trợ lẫn nhau. GV quan sát, hướng dẫn các nhóm gặp khó khăn.
  - #strong[Kiểm tra, đánh giá:] GV kiểm tra nhanh sản phẩm GeoGebra và
    sơ đồ tư duy của 1-2 nhóm.
  - #emph[Tích hợp Năng lực số:] #strong[Giao tiếp và hợp tác trong môi
    trường số] (làm việc nhóm bằng công cụ số). #emph[Biểu hiện:]
    #strong[Hợp tác] và #strong[chia sẻ] thông tin trong môi trường số.

]
#hd("4", "Vận dụng", "10 phút")
#mt-hd[
Phát triển năng lực vận dụng kiến thức, kĩ năng
  vào thực tiễn, củng cố kĩ năng thuyết trình, phân tích.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Tìm một #strong[tình huống thực tế] có thể mô
    hình hóa bằng một hàm số bậc ba hoặc bậc bốn (ví dụ: mô hình hóa dân
    số, lợi nhuận công ty, độ cao của vật thể ném đi, \...) .
  - #strong[Yêu cầu:] Vận dụng GeoGebra để khảo sát hàm số đó và giải
    thích ý nghĩa của các yếu tố #strong[cực trị] (cực đại/cực tiểu)
    hoặc #strong[GTNN/GTLN] trong bối cảnh thực tế đã chọn.
]
#sp-hd[
Báo cáo (file Word/PDF/PowerPoint) trình bày rõ:
  Tình huống thực tế -\> Hàm số mô hình -\> Kết quả khảo sát bằng
  GeoGebra -\> Giải thích ý nghĩa của kết quả.
]
#tc-hd[
  - #strong[Giao nhiệm vụ:] GV giao nhiệm vụ về nhà (thực hiện ngoài giờ
    học).
  - #strong[Yêu cầu báo cáo:] Báo cáo nộp qua email/Google Classroom
    (hoặc các hệ thống quản lí học tập). GV sẽ lựa chọn một số báo cáo
    tốt để chia sẻ và đánh giá vào đầu tiết học tiếp theo.
  - #emph[Tích hợp Năng lực số:] #strong[Giải quyết vấn đề và sáng tạo
    trong môi trường số] (tìm kiếm tình huống thực tế, tạo báo cáo số).
    #emph[Biểu hiện:] #strong[Sáng tạo nội dung số], #strong[Giải quyết]
    các vấn đề kĩ thuật và #strong[vận dụng] công cụ số vào cuộc sống.

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
