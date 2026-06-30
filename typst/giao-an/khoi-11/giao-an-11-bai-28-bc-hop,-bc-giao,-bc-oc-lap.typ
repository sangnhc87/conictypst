// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 28 BC hợp, BC giao, BC độc lập",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Trình bày được khái niệm và tính chất của #strong[Biến cố hợp].
- Trình bày được khái niệm và tính chất của #strong[Biến cố giao].
- Nêu được định nghĩa và các điều kiện để hai #strong[biến cố độc lập].
- Vận dụng được các khái niệm để tính xác suất trong một số bài toán đơn
  giản.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù (Năng lực mô hình hóa toán học):] Học sinh
  xác định được các biến cố trong các tình huống thực tiễn và mô hình
  hóa chúng bằng ngôn ngữ của tập hợp (biến cố hợp, biến cố giao).
- #strong[Năng lực giải quyết vấn đề toán học:] Học sinh vận dụng công
  thức tính xác suất của biến cố hợp, biến cố giao (với biến cố độc lập)
  để giải quyết các bài tập.
- #strong[Năng lực giao tiếp toán học:] Học sinh sử dụng thuật ngữ chính
  xác, trình bày rõ ràng, logic các khái niệm và kết quả tính toán.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - 1.1.NC1a- Đáp ứng được nhu cầu thông tin.
  - 1.1.NC1b- Áp dụng được kỹ thuật tìm kiếm để lấy được dữ liệu, thông
    tin và nội dung trong môi trường số.
  - 1.1.NC1c- Chỉ cho người khác cách truy cập những dữ liệu, thông tin
    và nội dung này cũng như điều hướng giữa chúng.
  - 1.1.NC1d- Tự đề xuất được chiến lược tìm kiếm.
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Có ý thức tự giác, tích cực tìm tòi, khám phá và
  hoàn thành tốt nhiệm vụ học tập được giao.
- #strong[Trách nhiệm:] Có thái độ nghiêm túc, hợp tác tích cực trong
  các hoạt động nhóm, có trách nhiệm với sản phẩm của bản thân và nhóm.
- #strong[Trung thực:] Thể hiện tính trung thực trong quá trình giải bài
  tập và báo cáo kết quả.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu/Tivi, máy tính giáo viên, bảng,
  phấn/bút.
- #strong[Học liệu:] Sách giáo khoa Toán 11, phiếu học tập (in/điện tử),
  phần mềm trình chiếu, tài liệu tham khảo về xác suất, #strong[bộ thẻ
  bài/hình ảnh] cho trò chơi học tập (Hoạt động 3), các ứng dụng tạo sơ
  đồ tư duy trực tuyến.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Nhiệm vụ học tập/Mở đầu", "15 phút")
#mt-hd[
Giúp học sinh xác định được vấn đề cần giải quyết: #strong[Làm thế nào
để tính xác suất của các biến cố phức tạp hơn (hợp, giao) và khi nào hai
biến cố ảnh hưởng/không ảnh hưởng đến nhau?].

]
#nd-hd[
- #strong[Nhiệm vụ:] Học sinh xử lí tình huống thực tiễn và thảo luận
  nhóm 4 về cách tính xác suất.
- #strong[Tình huống:] Gieo một con xúc xắc cân đối, đồng chất. Gọi
  $Omega$ là không gian mẫu.
  - $A$: \"Mặt xuất hiện là số lẻ\" ($A = { 1\,3\,5 }$).
  - $B$: \"Mặt xuất hiện là số nguyên tố\" ($B = { 2\,3\,5 }$).
- #strong[Câu hỏi thảo luận:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + Mặt xuất hiện là #strong[số lẻ HOẶC số nguyên tố] là tập hợp các kết
    quả nào? (Hướng đến Biến cố hợp).
  + Mặt xuất hiện vừa là #strong[số lẻ VÀ vừa là số nguyên tố] là tập
    hợp các kết quả nào? (Hướng đến Biến cố giao).
  + #emph[Nâng cao (Gợi mở):] Nếu ta gieo thêm một đồng xu sau khi gieo
    xúc xắc, thì kết quả của đồng xu có ảnh hưởng đến kết quả của xúc
    xắc không? (Gợi mở Biến cố độc lập).
  ]

]
#sp-hd[
- Kết quả thảo luận nhóm ghi trên giấy A4 hoặc báo cáo miệng.
- Đề xuất được tập hợp kết quả cho các biến cố \"A hoặc B\", \"A và B\":
  - \"A hoặc B\" $arrow.r { 1\,2\,3\,5 }$.
  - \"A và B\" $arrow.r { 3\,5 }$.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] Giáo viên (GV) trình bày tình huống,
  yêu cầu học sinh thảo luận nhóm (4 HS) trong 5 phút.
- #strong[Thực hiện nhiệm vụ (học sinh thực hiện; giáo viên theo dõi, hỗ
  trợ):] HS thảo luận. GV quan sát, theo dõi, hỗ trợ, gợi ý (nếu cần).
  - #emph[Dự kiến khó khăn:] HS có thể nhầm lẫn giữa \"hoặc\" và \"và\"
    trong ngôn ngữ tập hợp. #emph[Biện pháp hỗ trợ:] GV gợi ý liên tưởng
    đến phép toán Hợp ($union$) và Giao ($inter$) trong tập hợp.
- #strong[Báo cáo, thảo luận (giáo viên tổ chức, điều hành; học sinh báo
  cáo, thảo luận):] GV mời đại diện 2 nhóm báo cáo kết quả cho câu hỏi 1
  và 2.
- #strong[Kết luận, nhận định:] GV nhận xét, chuẩn hóa kết quả, kết nối
  các khái niệm #strong[\"hoặc\"] và #strong[\"và\"] với Biến cố hợp và
  Biến cố giao. GV đặt vấn đề: #strong[Làm thế nào để tính xác suất của
  các biến cố này một cách chính xác?].
- #strong[Tích hợp năng lực số:] Không áp dụng rõ ràng trong bước này.

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "80 phút")
==== Hoạt động 2.1: Biến cố hợp (25 phút)
#mt-hd[
Học sinh nắm vững định nghĩa, kí hiệu, biểu diễn và công thức tính xác
suất của #strong[Biến cố hợp].

]
#nd-hd[
- Học sinh đọc SGK và tài liệu để trả lời các câu hỏi sau:
  - Thế nào là #strong[Biến cố hợp] của hai biến cố $A$ và $B$? Kí hiệu
    là gì?
  - Biểu diễn biến cố hợp bằng #strong[biểu đồ Venn].
  - Nêu công thức tính $P\(A union B\)$ (Công thức cộng xác suất).
- #strong[Ví dụ minh họa:] Lấy ngẫu nhiên một lá bài từ bộ bài tú lơ khơ
  52 lá. Gọi $A$ là biến cố \"Lá bài là lá Át (A)\", $B$ là biến cố \"Lá
  bài là lá Cơ\". Tính xác suất của biến cố $A union B$: \"Lá bài lấy ra
  là lá Át HOẶc lá Cơ\".

]
#sp-hd[
- Ghi chép đầy đủ khái niệm, công thức: $A union B$ (là biến cố \"A xảy
  ra hoặc B xảy ra\"), $P\(A union B\)= P\(A\)+ P\(B\)- P\(A inter B\)$.
- Giải được ví dụ minh họa: $P\(A union B\)= 16\/52$.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ tìm hiểu cá nhân kết
  hợp nhóm đôi (5 phút).
- #strong[Thực hiện nhiệm vụ (học sinh thực hiện; giáo viên theo dõi, hỗ
  trợ):] HS tự nghiên cứu và trao đổi. GV theo dõi, hỗ trợ, đặc biệt là
  việc biểu diễn trên Biểu đồ Venn.
- #strong[Báo cáo, thảo luận (giáo viên tổ chức, điều hành; học sinh báo
  cáo, thảo luận):] GV mời một vài HS trình bày khái niệm và công thức.
  GV sử dụng máy chiếu chiếu Biểu đồ Venn để làm rõ công thức.
- #strong[Kết luận, nhận định:] GV chuẩn hóa kiến thức, nhấn mạnh ý
  nghĩa của việc trừ đi $P\(A inter B\)$ để tránh đếm lặp.
- #strong[Tích hợp năng lực số:] GV sử dụng công cụ trình chiếu
  (PowerPoint/Canva) để minh họa Biểu đồ Venn và công thức.

==== Hoạt động 2.2: Biến cố giao (25 phút)
]
#mt-hd[
Học sinh nắm vững định nghĩa, kí hiệu, biểu diễn và công thức tính xác
suất của #strong[Biến cố giao].

]
#nd-hd[
- Học sinh đọc SGK và tài liệu để trả lời các câu hỏi sau:
  - Thế nào là #strong[Biến cố giao] của hai biến cố $A$ và $B$? Kí hiệu
    là gì?
  - Thế nào là #strong[hai biến cố xung khắc]? Mối liên hệ với Biến cố
    giao?
- #strong[Ví dụ minh họa:] Tung hai đồng xu cân đối, đồng chất. Gọi $A$
  là biến cố \"Đồng xu thứ nhất ra mặt Sấp\", $B$ là biến cố \"Đồng xu
  thứ hai ra mặt Ngửa\". Tính xác suất của biến cố $A inter B$: \"Cả hai
  điều kiện của A VÀ B đều xảy ra\".

]
#sp-hd[
- Ghi chép đầy đủ khái niệm: $A inter B$ (là biến cố \"A xảy ra và B xảy
  ra\"). Hai biến cố $A\,B$ xung khắc nếu $A inter B = diameter$.
- Giải được ví dụ minh họa: $P\(A inter B\)= 1\/4$.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ nghiên cứu cá nhân (5
  phút).
- #strong[Thực hiện nhiệm vụ (học sinh thực hiện; giáo viên theo dõi, hỗ
  trợ):] HS tự nghiên cứu. GV theo dõi, nhấn mạnh mối liên hệ với Biến
  cố xung khắc.
- #strong[Báo cáo, thảo luận (giáo viên tổ chức, điều hành; học sinh báo
  cáo, thảo luận):] GV mời HS trình bày, chú trọng phân biệt biến cố
  giao và biến cố xung khắc (khi $A inter B = diameter$).
- #strong[Kết luận, nhận định:] GV chuẩn hóa kiến thức, nhấn mạnh
  $P\(A inter B\)= 0$ khi $A$ và $B$ xung khắc.
- #strong[Tích hợp năng lực số:] Không áp dụng rõ ràng trong bước này.

==== Hoạt động 2.3: Biến cố độc lập (30 phút)
]
#mt-hd[
Học sinh nắm vững định nghĩa và điều kiện để hai #strong[biến cố độc
lập], vận dụng công thức nhân xác suất cho biến cố độc lập.

]
#nd-hd[
- Học sinh đọc SGK và tài liệu, thảo luận nhóm 4 về khái niệm
  #strong[Độc lập] trong xác suất:
  - Thế nào là #strong[Hai biến cố độc lập]? (Sự xảy ra của biến cố này
    không ảnh hưởng đến xác suất xảy ra của biến cố kia).
  - Nêu #strong[Công thức nhân xác suất] cho hai biến cố độc lập:
    $P\(A inter B\)= P\(A\)dot.op P\(B\)$.
- #strong[Ví dụ minh họa:] Một hộp có 5 bi xanh và 3 bi đỏ. Lấy ngẫu
  nhiên một viên bi, ghi màu và #strong[hoàn lại]. Sau đó, lấy ngẫu
  nhiên tiếp một viên bi nữa. Gọi $A$ là biến cố \"Lần 1 lấy được bi
  xanh\", $B$ là biến cố \"Lần 2 lấy được bi xanh\".
  - Hai biến cố $A$ và $B$ có độc lập không? Tại sao?
  - Tính xác suất $P\(A inter B\)$ (Lần 1 và lần 2 đều lấy được bi
    xanh).

]
#sp-hd[
- Ghi chép đầy đủ: Hai biến cố $A\,B$ độc lập khi
  $P\(A inter B\)= P\(A\)dot.op P\(B\)$.
- Phân tích được: Vì có hoàn lại nên $P\(B\|A\)= P\(B\)$ (Độc lập).
- Giải được ví dụ minh họa: $P\(A inter B\)= 25\/64$.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ thảo luận nhóm (5
  phút) và làm ví dụ (5 phút).
- #strong[Thực hiện nhiệm vụ (học sinh thực hiện; giáo viên theo dõi, hỗ
  trợ):] HS nghiên cứu và thảo luận. GV theo dõi, #strong[lưu ý phân
  biệt] trường hợp có hoàn lại (Độc lập) và không hoàn lại (Không độc
  lập/Phụ thuộc).
- #strong[Báo cáo, thảo luận (giáo viên tổ chức, điều hành; học sinh báo
  cáo, thảo luận):] GV mời đại diện nhóm trình bày định nghĩa, công thức
  và giải ví dụ. GV nhấn mạnh điều kiện độc lập.
- #strong[Kết luận, nhận định:] GV chuẩn hóa, nhấn mạnh $A\,B$ độc lập
  $eq.not$ $A\,B$ xung khắc.
- #strong[Tích hợp năng lực số:] GV có thể sử dụng video ngắn (Youtube)
  minh họa một thí nghiệm thực tế về độc lập/không độc lập nếu cần
  thiết.

]
#hd("3", "Luyện tập", "30 phút")
#mt-hd[
Học sinh vận dụng kiến thức đã học và yêu cầu phát triển các kĩ năng vận
dụng kiến thức cho học sinh.

]
#nd-hd[
- #strong[Luyện tập 1: Trò chơi học tập \"Nhanh tay lẹ mắt\" (Cá
  nhân/Nhóm):]
  - GV chuẩn bị các thẻ bài (hoặc phiếu bài tập) bao gồm các câu hỏi
    trắc nghiệm/tự luận ngắn về Biến cố hợp, Biến cố giao, Biến cố độc
    lập.
  - #strong[Ví dụ câu hỏi:]
    - Cho $P\(A\)= 0.3$, $P\(B\)= 0.5$, $A\,B$ xung khắc. Tính
      $P\(A union B\)$.
    - Cho $P\(A\)= 0.4$, $P\(B\)= 0.6$, $A\,B$ độc lập. Tính
      $P\(A inter B\)$.
    - Phân biệt Biến cố hợp và Biến cố giao bằng ngôn ngữ tự nhiên.
- #strong[Luyện tập 2: Bài tập tổng hợp (Cá nhân):]
  - HS làm 2-3 bài tập trong SGK (hoặc phiếu bài tập) có tính tổng hợp
    về cả 3 loại biến cố.

]
#sp-hd[
- Đáp án nhanh, chính xác cho các câu hỏi trong trò chơi học tập.
- Lời giải chi tiết và chính xác của các bài tập tổng hợp.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV chia lớp thành 4 nhóm, phổ biến
  luật chơi \"Nhanh tay lẹ mắt\". Mỗi câu trả lời đúng được điểm. (15
  phút).
- #strong[Thực hiện nhiệm vụ (học sinh thực hiện; giáo viên theo dõi, hỗ
  trợ):] HS thảo luận nhóm nhanh/cá nhân để trả lời câu hỏi. GV quan
  sát, điều hành trò chơi, ghi nhận điểm số.
- #strong[Báo cáo, thảo luận (giáo viên tổ chức, điều hành; học sinh báo
  cáo, thảo luận):] Sau mỗi câu hỏi, GV mời nhóm/cá nhân trình bày đáp
  án và giải thích ngắn gọn.
- #strong[Kết luận, nhận định:] GV tổng kết điểm, chữa nhanh các bài tập
  tổng hợp, khen ngợi, động viên học sinh.
- #strong[Tích hợp năng lực số:] GV có thể sử dụng các ứng dụng tạo bài
  kiểm tra/trò chơi tương tác trực tuyến (Quizizz, Kahoot) để tổ chức
  trò chơi, giúp học sinh thực hiện nhiệm vụ học tập trên môi trường số
  (NLSDT 1.2).

]
#hd("4", "Vận dụng", "10 phút")
#mt-hd[
Phát triển năng lực của học sinh thông qua nhiệm vụ/yêu cầu vận dụng
kiến thức, kĩ năng vào thực tiễn.

]
#nd-hd[
- #strong[Nhiệm vụ:] Vận dụng kiến thức mới học, học sinh #strong[về
  nhà] tìm kiếm thông tin trên internet và đề xuất #strong[một tình
  huống thực tế] có sử dụng một trong các khái niệm: Biến cố hợp, Biến
  cố giao, hoặc Biến cố độc lập. Sau đó, xây dựng một bài toán xác suất
  nhỏ từ tình huống đó.
- #emph[Ví dụ gợi ý:] Xác suất bệnh nhân mắc bệnh A (biến cố $A$), mắc
  bệnh B (biến cố $B$). Tính xác suất mắc cả hai (Biến cố giao) hay mắc
  ít nhất một bệnh (Biến cố hợp).

]
#sp-hd[
Báo cáo (trên giấy hoặc file trình chiếu) về:

+ Mô tả tình huống thực tế.
+ Xác định các Biến cố liên quan.
+ Xây dựng bài toán và giải.

]
#tc-hd[
- #strong[Giao nhiệm vụ học tập:] GV giao nhiệm vụ về nhà và yêu cầu nộp
  sản phẩm sau 1 tuần. GV cung cấp tiêu chí đánh giá rõ ràng (tính sáng
  tạo, tính thực tiễn, tính chính xác).
- #strong[Kết luận, nhận định:] GV khuyến khích học sinh sử dụng công cụ
  số (tạo nội dung số) để trình bày báo cáo.
- #strong[Tích hợp năng lực số (NLSDT 1.3 và 2.2):] Học sinh sử dụng
  công cụ tìm kiếm (Google) để thu thập thông tin và sử dụng các công cụ
  tạo nội dung số (Word/Slide) để làm báo cáo, thể hiện năng lực khai
  thác, xử lý và tạo ra nội dung số.

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
