// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 16 Hàm số bậc hai",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được khái niệm #strong[hàm số bậc hai] $y = a x^2 + b x + c$
  ($a eq.not 0$).
- Xác định được tọa độ đỉnh, trục đối xứng, giao điểm với các trục tọa
  độ của đồ thị hàm số bậc hai.
- Nêu được tính chất và vẽ được #strong[đồ thị của hàm số bậc hai]
  $y = a x^2 + b x + c$ ($a eq.not 0$).
- Giải quyết được một số vấn đề thực tiễn liên quan đến hàm số bậc hai.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động, tích cực tìm hiểu, đọc
    tài liệu, và thực hiện nhiệm vụ học tập.
  - #strong[Năng lực giao tiếp và hợp tác:] Thảo luận, trình bày, và hợp
    tác hiệu quả trong làm việc nhóm để hoàn thành nhiệm vụ được giao.
- #strong[Năng lực đặc thù môn học (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Phân tích, so sánh để
    rút ra khái niệm, tính chất của hàm số bậc hai và đồ thị của nó.
  - #strong[Năng lực mô hình hóa toán học:] Dùng hàm số bậc hai để mô
    hình hóa và giải quyết các vấn đề thực tiễn (ví dụ: quỹ đạo bay của
    vật, tối ưu hóa diện tích/lợi nhuận).

- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tìm tòi, nghiên cứu, hoàn thành các nhiệm
  vụ học tập được giao một cách nghiêm túc.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ của bản thân và
  nhóm, chủ động chia sẻ, đóng góp ý kiến để hoàn thành công việc chung.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính có kết nối
  Internet, bảng.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống).
  - Phiếu học tập (Dạng giấy hoặc online - Google Form/Quizizz).
  - Tài liệu hướng dẫn sử dụng phần mềm GeoGebra cơ bản (để vẽ đồ thị).
  - Các hình ảnh, video về các vật thể có quỹ đạo parabol trong thực tế.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
#mt-hd[
Giúp học sinh xác định được vấn đề cần giải quyết: Mô tả và khảo sát
hình dạng đồ thị của hàm số có dạng $y = a x^2 + b x + c$
($a eq.not 0$), qua đó thấy được ứng dụng thực tiễn.

]
#nd-hd[
- Giáo viên (GV) trình chiếu một số hình ảnh/video về các hiện tượng
  thực tế có quỹ đạo là đường Parabol (ví dụ: cầu vòm, vòi nước, đường
  đi của vật bị ném). \* #strong[Nhiệm vụ:] Học sinh (HS) thảo luận nhóm
  3-4 người, quan sát các hình ảnh/video và trả lời câu hỏi:
  #block[
  #set enum(numbering: "a.", start: 1)
  + Nêu nhận xét về hình dạng của các vật thể/quỹ đạo được trình chiếu.
  + Trong Toán học, hình dạng này thường được mô tả bằng đồ thị của loại
    hàm số nào? Nêu công thức tổng quát của hàm số đó.
  ]

]
#sp-hd[
- HS trả lời: Hình dạng là #strong[đường Parabol].
- Công thức tổng quát của hàm số có đồ thị là Parabol là
  $y = a x^2 + b x + c$ ($a eq.not 0$).

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV chiếu Slide, phát nhiệm vụ thảo
  luận nhóm.
- #strong[Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ trợ):] HS
  quan sát và thảo luận. GV đi quanh lớp quan sát, gợi ý: \"Hình dạng
  này quen thuộc không? Nó có đối xứng không?\".
- #strong[Báo cáo, thảo luận (GV tổ chức, điều hành; HS báo cáo, thảo
  luận):] GV mời đại diện 2 nhóm báo cáo, các nhóm khác nhận xét, bổ
  sung.
- #strong[Kết luận, nhận định:] GV chốt lại vấn đề: Hàm số có công thức
  $y = a x^2 + b x + c$ ($a eq.not 0$) được gọi là #strong[Hàm số bậc
  hai]. Bài học hôm nay sẽ giúp chúng ta hiểu rõ về hàm số này và cách
  vẽ đồ thị của nó.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "85 phút")
Hoạt động này được chia thành 2 hoạt động thành phần:

==== 2.1. Hoạt động 2.1: Khái niệm hàm số bậc hai (25 phút)
#mt-hd[
HS nắm vững khái niệm, công thức tổng quát và nhận dạng được hàm số bậc
hai.

]
#nd-hd[
- GV đặt vấn đề: Từ kết quả Hoạt động 1, hãy xây dựng định nghĩa chính
  thức của hàm số bậc hai.
- HS làm việc cá nhân với SGK: Đọc mục Khái niệm và hoàn thành Phiếu học
  tập số 1 (PTHT1).
  - PTHT1: Nêu định nghĩa hàm số bậc hai. Cho các hàm số sau, hàm nào là
    hàm số bậc hai? $y = 2 x^2 + 3 x - 1$\; $y = 3 x - 1$\;
    $y = - x^2$\; $y = x^3 - 2 x + 1$.
- #strong[Ví dụ cụ thể (Mô hình hóa):] GV đưa ra bài toán thực tiễn đơn
  giản.
  - #strong[Bài toán:] Một mảnh vườn hình chữ nhật có chu vi
    $80 upright(" m")$. Gọi chiều rộng là $x$ ($upright("m")$). Hãy biểu
    diễn diện tích $S$ của mảnh vườn theo $x$.
- HS làm việc cá nhân, sau đó thảo luận nhanh nhóm đôi.

]
#sp-hd[
- #strong[Khái niệm:] Hàm số bậc hai là hàm số có công thức
  $y = a x^2 + b x + c$ ($a\,b\,c$ là hằng số, $a eq.not 0$).
- #strong[Nhận dạng:] Các hàm số bậc hai là: $y = 2 x^2 + 3 x - 1$\;
  $y = - x^2$.
- #strong[Ví dụ:]
  - Chiều dài là $40 - x$ ($upright("m")$).
  - Diện tích $S\(x\)= x\(40 - x\)= - x^2 + 40 x$. Đây là hàm số bậc hai
    với $a = - 1\,b = 40\,c = 0$.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao PTHT1 và Bài toán mô hình hóa.
- #strong[Thực hiện nhiệm vụ:] HS tự đọc sách, thực hiện nhiệm vụ. GV dự
  kiến khó khăn: HS quên điều kiện $a eq.not 0$. Biện pháp hỗ trợ: Gợi ý
  HS nhớ lại kiến thức về hàm số bậc nhất.
- #strong[Báo cáo, thảo luận:] GV mời 1-2 HS trình bày kết quả PTHT1 và
  lời giải Bài toán.
- #strong[Kết luận, nhận định:] GV chốt lại khái niệm, điều kiện
  $a eq.not 0$ và minh họa ứng dụng mô hình hóa trong thực tế.

==== 2.2. Hoạt động 2.2: Đồ thị của hàm số bậc hai (60 phút)
]
#mt-hd[
HS nắm vững các bước vẽ đồ thị hàm số bậc hai, xác định được đỉnh, trục
đối xứng và hướng bề lõm.

]
#nd-hd[
- #strong[Nhiệm vụ 1: Khảo sát các thành phần chính của đồ thị.]

  - HS làm việc nhóm 4, nghiên cứu SGK để xác định:
    #block[
    #set enum(numbering: "i.", start: 1)
    + Hình dạng đồ thị.
    + Hướng bề lõm (phụ thuộc vào $a$).
    + Tọa độ đỉnh $I\(- b\/2 a\;- Delta\/4 a\)$.
    + Trục đối xứng $x = - b\/2 a$.
    + Giao điểm với trục hoành và trục tung.
    ]

- #strong[Nhiệm vụ 2: Vẽ đồ thị (Kết hợp Năng lực số).]

  - HS sử dụng máy tính/điện thoại, truy cập phần mềm #strong[GeoGebra]
    (hoặc ứng dụng tương tự) để vẽ đồ thị hàm số $y = x^2 - 4 x + 3$ và
    $y = - x^2 - 2 x + 1$.
  - #strong[Biểu hiện về Năng lực số:] #strong[Sử dụng và quản lý các
    công cụ, ứng dụng số] để trực quan hóa kiến thức, kiểm tra lại kết
    quả tính toán đỉnh và trục đối xứng.

- #strong[Nhiệm vụ 3: Đúc kết các bước vẽ.]

  - Dựa trên kết quả khảo sát và kinh nghiệm vẽ bằng GeoGebra, nhóm đúc
    kết 4 bước vẽ đồ thị hàm số bậc hai.

- #strong[Ví dụ cụ thể:] #strong[Vẽ đồ thị hàm số] $y = x^2 - 2 x - 3$.

  - HS thực hiện các bước đã đúc kết để vẽ đồ thị này.

]
#sp-hd[
- #strong[Sản phẩm nhóm:] Báo cáo các thành phần chính của đồ thị, các
  bước vẽ, và đồ thị mẫu đã vẽ trên GeoGebra (chụp ảnh màn hình).
- #strong[Sản phẩm cá nhân:] Đồ thị hàm số $y = x^2 - 2 x - 3$ được vẽ
  chính xác.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao các nhiệm vụ 1, 2, 3 cho các
  nhóm. GV cần chuẩn bị trước link truy cập GeoGebra/tài liệu hướng dẫn.
- #strong[Thực hiện nhiệm vụ:] HS làm việc nhóm. GV theo dõi. #strong[Dự
  kiến khó khăn:] Tính toán sai tọa độ đỉnh. #strong[Biện pháp hỗ trợ:]
  GV nhắc lại công thức tính $Delta$, gợi ý cách tính giá trị $y_I$ bằng
  cách thay $x_I = - b\/2 a$ vào hàm số.
- #strong[Báo cáo, thảo luận:]
  - Mời một nhóm trình bày sơ đồ tư duy (mind map) tổng hợp các thành
    phần và các bước vẽ (Tăng cường kỹ năng thuyết trình, phân tích và
    tổng hợp thông tin).
  - Mời một HS lên bảng thực hiện đầy đủ các bước vẽ đồ thị
    $y = x^2 - 2 x - 3$.
- #strong[Kết luận, nhận định:] GV chốt lại các bước vẽ chuẩn, đặc biệt
  nhấn mạnh ý nghĩa của đỉnh, trục đối xứng và hướng bề lõm.

]
#hd("3", "Luyện tập", "25 phút")
#mt-hd[
Vận dụng kiến thức về hàm số bậc hai để giải bài tập nhận dạng, xác định
các yếu tố của đồ thị và vẽ đồ thị.

]
#nd-hd[
- #strong[Trò chơi học tập: \"Tiếp sức\"] (Tăng cường kĩ năng làm việc
  nhóm, tốc độ xử lý).
  - GV chuẩn bị hệ thống 3 bài tập (BT) tăng dần độ khó:
    - BT 1 (Nhận dạng): Cho các hàm số, hàm nào có đồ thị hướng bề lõm
      xuống dưới?
    - BT 2 (Xác định yếu tố): Tìm tọa độ đỉnh, trục đối xứng của hàm số
      $y = - 2 x^2 + 8 x - 5$.
    - BT 3 (Tổng hợp): Lập bảng biến thiên và vẽ đồ thị hàm số
      $y = x^2 + 4 x + 3$.
  - Các nhóm thi đua giải nhanh, nhóm nào có kết quả chính xác và nhanh
    nhất sẽ thắng cuộc.

]
#sp-hd[
- Đáp án, lời giải chính xác của 3 bài tập.

]
#tc-hd[
- #strong[Giao nhiệm vụ:] GV phổ biến luật chơi.
- #strong[Thực hiện nhiệm vụ:] HS làm việc nhóm, luân phiên nhau giải
  các bài tập.
- #strong[Kiểm tra, đánh giá kết quả:] GV và HS cùng chấm điểm, nhận
  xét, đánh giá kết quả.

]
#hd("4", "Vận dụng", "10 phút")
#mt-hd[
Phát triển năng lực mô hình hóa thông qua việc vận dụng kiến thức, kĩ
năng về hàm số bậc hai vào giải quyết các vấn đề thực tiễn.

]
#nd-hd[
- #strong[Nhiệm vụ:] Tìm kiếm và đề xuất các vấn đề/tình huống trong
  thực tiễn có thể giải quyết bằng mô hình hàm số bậc hai (ví dụ: tối đa
  hóa/tối thiểu hóa một đại lượng như lợi nhuận, chiều cao vật ném, diện
  tích...).
- #strong[Ví dụ cụ thể:] #strong[Bài toán tối đa hóa lợi nhuận.]
  - Một công ty sản xuất đồ dùng học tập xác định chi phí để sản xuất
    $x$ sản phẩm là $C\(x\)= 10 x + 15$ (triệu đồng) và doanh thu là
    $R\(x\)= - 0.1 x^2 + 50 x$ (triệu đồng). Hãy xác định số lượng sản
    phẩm $x$ mà công ty phải sản xuất để đạt được lợi nhuận tối đa? (Lợi
    nhuận $P\(x\)= R\(x\)- C\(x\)$).

]
#sp-hd[
- #strong[Báo cáo (Thực hiện ngoài giờ học):] Trình bày lời giải bài
  toán Vận dụng và ít nhất 1 vấn đề/tình huống thực tế tự đề xuất.

]
#tc-hd[
- GV giao nhiệm vụ Bài toán Vận dụng và yêu cầu HS thực hiện, viết báo
  cáo.
- Yêu cầu HS nộp báo cáo (có thể nộp file mềm qua Drive/Email) để GV
  kiểm tra, đánh giá và trao đổi, chia sẻ kết quả trong buổi học tiếp
  theo.

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
