// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 1 Mệnh đề",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nhận biết được một câu là một #strong[mệnh đề] hay không phải là mệnh
  đề.
- Xác định được #strong[mệnh đề chứa biến] và tập xác định của biến.
- Lập được #strong[mệnh đề phủ định] của một mệnh đề.
- Nhận biết được mệnh đề kéo theo, mệnh đề đảo, mệnh đề tương đương và
  xác định được tính đúng sai của chúng.
- Sử dụng được các ký hiệu $forall$ (với mọi) và $exists$ (tồn tại) để
  viết các mệnh đề.
- Lập được mệnh đề phủ định của mệnh đề có chứa ký hiệu
  $forall\,exists$.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến thức mới
    về mệnh đề qua SGK và tài liệu tham khảo.
  - #strong[Giao tiếp và hợp tác:] Tích cực thảo luận nhóm, trình bày ý
    kiến, lập luận toán học.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp thông
    tin, vận dụng kiến thức mệnh đề để giải quyết các bài toán logic.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực tư duy và lập luận toán học:] Thực hiện các thao
    tác tư duy (so sánh, phân tích, tổng hợp, khái quát hóa) để hình
    thành khái niệm mệnh đề và các phép toán mệnh đề.
  - #strong[Năng lực mô hình hóa toán học:] Mô hình hóa các phát biểu
    trong đời sống thực tiễn bằng ngôn ngữ mệnh đề.
  - #strong[Năng lực giao tiếp toán học:] Diễn đạt chính xác các khái
    niệm, quy tắc về mệnh đề.
- #strong[Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT):]
  - #strong[Tìm kiếm và xử lí thông tin] một mệnh đề Toán học bất kỳ (ví
    dụ: trong hình học, đại số) và viết mệnh đề phủ định của nó lên một
    #strong[phiếu trả lời trực tuyến] (Google Form) hoặc #strong[bảng
    tương tác trực tuyến] (ví dụ: Padlet).

  - #strong[Sử dụng và khai thác công nghệ số:] Sử dụng các công cụ số
    (ví dụ: Google Forms, Quizizz để làm bài tập, Mindmap online để tổng
    hợp kiến thức) để hỗ trợ quá trình học tập.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập cá nhân và
  nhóm.
- #strong[Trung thực:] Thẳng thắn, trung thực trong quá trình tự đánh
  giá và đánh giá kết quả của nhóm.
- #strong[Trách nhiệm:] Hoàn thành các nhiệm vụ học tập được giao, có
  trách nhiệm với kết quả của nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, màn chiếu, máy tính, phiếu học
  tập, bảng phụ, bút lông.
- #strong[Học liệu:] Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc
  sống), tài liệu tham khảo, các bài tập trực tuyến (Quizizz, Kahoot) để
  luyện tập và kiểm tra nhanh, phần mềm vẽ sơ đồ tư duy (ví dụ:
  MindMeister, XMind) hoặc dụng cụ vẽ Mindmap.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
- #strong[Tên hoạt động:] Khởi động: Phân loại câu và Dự đoán tính đúng
  sai
- #strong[Phương pháp/Kĩ thuật:] #strong[Đàm thoại gợi mở, Trò chơi \"Ai
  nhanh hơn\"].

#mt-hd[
- Giúp học sinh xác định được vấn đề cốt lõi: Phân biệt được câu nào là
  phát biểu có thể xác định tính đúng/sai và câu nào không.
- Tạo hứng thú, kết nối kiến thức thực tiễn với kiến thức Toán học.

]
#nd-hd[
- Giáo viên (GV) đưa ra một số câu/phát biểu và yêu cầu học sinh (HS)
  phân loại (Câu cảm thán? Câu hỏi? Câu kể?) và xác định tính đúng/sai
  (nếu có).
  - #emph[Ví dụ:]
    #block[
    #set enum(numbering: "i.", start: 1)
    + \"Hà Nội là thủ đô của Việt Nam.\"
    + \"Bạn có thích học môn Toán không?\"
    + \"Cố lên!\"
    + \"Số 2025 chia hết cho 5.\"
    ]

]
#sp-hd[
- HS trả lời miệng các câu hỏi của GV.
- #strong[Dự kiến sản phẩm:]
  - Câu 1, 4 là các câu khẳng định có thể xác định tính đúng/sai.
  - Câu 2, 3 là câu hỏi, câu cảm thán, không thể xác định tính đúng/sai.
- HS nêu được #strong[yêu cầu cần giải quyết] tiếp theo: Tìm hiểu về
  loại câu khẳng định có tính đúng/sai (chính là mệnh đề).

]
#tc-hd[
- #strong[Bước 1: Giao nhiệm vụ:] GV chiếu 4 câu ví dụ, yêu cầu HS thảo
  luận nhanh trong 2 phút (cặp đôi) để phân loại và nhận xét về tính
  đúng/sai của từng câu.
- #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận. GV quan sát, gợi ý.
- #strong[Bước 3: Báo cáo, thảo luận:] GV mời đại diện 2-3 cặp đôi báo
  cáo.
- #strong[Bước 4: Kết luận, nhận định:] GV dẫn dắt, tổng kết các câu 1,
  4 là những phát biểu ta có thể khẳng định tính đúng/sai, từ đó giới
  thiệu #strong[\"Mệnh đề\"] là nội dung cần tìm hiểu trong bài học.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "140 phút - Chia thành 5 hoạt động thành phần")
==== 2.1. Hoạt động thành phần 2.1: Mệnh đề. Mệnh đề chứa biến (25 phút)
- #strong[Tên hoạt động:] Khám phá khái niệm Mệnh đề và Mệnh đề chứa
  biến

- #strong[Mục tiêu:] HS nắm vững khái niệm mệnh đề, tính đúng sai của
  mệnh đề, và nhận biết được mệnh đề chứa biến.

- #strong[Nội dung:] HS làm việc cá nhân, sau đó thảo luận nhóm để trả
  lời các câu hỏi:

  #block[
  #set enum(numbering: "a.", start: 1)
  + Thế nào là một #strong[mệnh đề]? (Đúc kết từ HĐ1).
  + Xác định tính đúng/sai của các mệnh đề: \"5 là số chẵn.\", \"Số 3 là
    số nguyên tố.\"
  + Quan sát câu: \"$x > 2$\". Câu này có phải là mệnh đề không? Tại
    sao? (Dẫn đến khái niệm Mệnh đề chứa biến).
  ]

- #strong[Ví dụ minh họa:]

  - #strong[Mệnh đề:] \"$2^2 + 1 = 5$\" (Mệnh đề đúng).
  - #strong[Mệnh đề chứa biến:] \"$n$ chia hết cho 3\" (Với $n$ là số tự
    nhiên).

- #strong[Sản phẩm:] Khái niệm Mệnh đề và Mệnh đề chứa biến, xác định
  được tính đúng/sai của ví dụ.

- #strong[Tổ chức thực hiện:]

  - #strong[Bước 1:] GV yêu cầu HS đọc SGK, #strong[ghép đôi] thảo luận
    để xây dựng khái niệm Mệnh đề (5 phút).
  - #strong[Bước 2:] GV đưa ví dụ về #strong[Mệnh đề chứa biến] và yêu
    cầu HS tự đặt ví dụ khác.
  - #strong[Bước 3:] HS báo cáo. GV chốt kiến thức và giới thiệu cách ký
    hiệu mệnh đề ($P\,Q\,. . .$).

==== 2.2. Hoạt động thành phần 2.2: Mệnh đề phủ định (25 phút)
- #strong[Tên hoạt động:] Lập luận phủ định và Biểu hiện của Năng lực số
- #strong[Mục tiêu:] HS biết cách lập mệnh đề phủ định ($macron(P)$) và
  mối quan hệ về tính đúng sai giữa $P$ và $macron(P)$.
- #strong[Nội dung:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + GV đưa mệnh đề $P$: \"Số 6 là số chẵn.\" Yêu cầu HS tìm cách phát
    biểu ngược lại. (Dẫn đến $macron(P)$).
  + Nêu quy tắc lập $macron(P)$ và nhận xét về tính đúng sai của $P$ và
    $macron(P)$.
  + Thực hành lập mệnh đề phủ định của các mệnh đề chứa dấu bằng, lớn
    hơn, nhỏ hơn, v.v.
  ]
- #strong[Ví dụ minh họa:]
  - $P$: \"Số $sqrt(2)$ là số hữu tỉ.\" $arrow.r.double macron(P)$: \"Số
    $sqrt(2)$ không phải là số hữu tỉ.\"
- #strong[Sản phẩm:] Quy tắc lập mệnh đề phủ định, bài tập thực hành.
- #strong[Tổ chức thực hiện:]
  - #strong[Bước 1:] GV giao nhiệm vụ lập mệnh đề phủ định cho 3-4 ví dụ
    khác nhau.
  - #strong[Bước 2 (Tích hợp Năng lực số):] GV yêu cầu HS sử dụng
    #strong[điện thoại/máy tính cá nhân] để #strong[tìm kiếm nhanh]
    (biểu hiện #strong[Năng lực số: Tìm kiếm và xử lí thông tin]) một
    mệnh đề Toán học bất kỳ (ví dụ: trong hình học, đại số) và viết mệnh
    đề phủ định của nó lên một #strong[phiếu trả lời trực tuyến] (Google
    Form) hoặc #strong[bảng tương tác trực tuyến] (ví dụ: Padlet).
  - #strong[Bước 3:] GV chọn ngẫu nhiên vài câu trả lời trực tuyến của
    HS để chiếu lên và phân tích, đánh giá, chốt kiến thức.

==== 2.3. Hoạt động thành phần 2.3: Mệnh đề kéo theo. Mệnh đề đảo (30 phút)
- #strong[Tên hoạt động:] Phân tích cấu trúc \"Nếu... thì...\"
- #strong[Mục tiêu:] HS nhận biết, phát biểu và xác định tính đúng sai
  của mệnh đề kéo theo ($P arrow.r.double Q$), mệnh đề đảo, và hiểu ý
  nghĩa của điều kiện cần, điều kiện đủ.
- #strong[Nội dung:] Phân tích cấu trúc #strong[\"Nếu] $P$ #strong[thì]
  $Q$#strong[\"] (Mệnh đề kéo theo) qua ví dụ thực tiễn để xác định khi
  nào $P arrow.r.double Q$ là sai (chỉ sai khi $P$ đúng và $Q$ sai).
  - Phát biểu #strong[Mệnh đề đảo] ($Q arrow.r.double P$).
  - Giới thiệu khái niệm #strong[Điều kiện cần] và #strong[Điều kiện
    đủ].
- #strong[Ví dụ minh họa:]
  - $P$: \"Số $n$ chia hết cho 6.\" $Q$: \"Số $n$ chia hết cho 3.\"
  - $P arrow.r.double Q$: \"Nếu số $n$ chia hết cho 6 thì $n$ chia hết
    cho 3.\" (Đúng)
  - Mệnh đề đảo $Q arrow.r.double P$: \"Nếu số $n$ chia hết cho 3 thì
    $n$ chia hết cho 6.\" (Sai, ví dụ $n = 9$).
- #strong[Sản phẩm:] Khái niệm Mệnh đề kéo theo, Mệnh đề đảo, Điều kiện
  cần và đủ.
- #strong[Tổ chức thực hiện:]
  - #strong[Bước 1:] GV đưa ví dụ thực tiễn để dẫn dắt. HS #strong[làm
    việc nhóm] (4-5 HS) để thảo luận về tính đúng sai của
    $P arrow.r.double Q$ trong các trường hợp.
  - #strong[Bước 2:] Các nhóm trình bày (ghi bảng/chiếu slide), phân
    tích rõ trường hợp $P arrow.r.double Q$ sai.
  - #strong[Bước 3:] GV chốt kiến thức, giới thiệu khái niệm
    #strong[Điều kiện cần/đủ].

==== 2.4. Hoạt động thành phần 2.4: Mệnh đề tương đương (30 phút)
- #strong[Tên hoạt động:] Nhận biết sự tương đương Logic
- #strong[Mục tiêu:] HS nhận biết, phát biểu và xác định tính đúng sai
  của mệnh đề tương đương ($P arrow.l.r.double Q$), và hiểu ý nghĩa của
  điều kiện cần và đủ.
- #strong[Nội dung:] Phân tích cấu trúc #strong[\"]$P$ #strong[khi và
  chỉ khi] $Q$#strong[\"] (Mệnh đề tương đương) qua ví dụ và nhận xét về
  mối quan hệ giữa $P arrow.r.double Q$ và $Q arrow.r.double P$.
  - Khi nào $P arrow.l.r.double Q$ đúng (khi $P$ và $Q$ cùng đúng hoặc
    cùng sai).
  - $P arrow.l.r.double Q$ còn được phát biểu là: $P$ #strong[là điều
    kiện cần và đủ để có] $Q$.
- #strong[Ví dụ minh họa:]
  - $P$: \"Tứ giác $A B C D$ là hình vuông.\" $Q$: \"Tứ giác $A B C D$
    là hình chữ nhật có hai cạnh kề bằng nhau.\"
  - $P arrow.l.r.double Q$: \"Tứ giác $A B C D$ là hình vuông khi và chỉ
    khi nó là hình chữ nhật có hai cạnh kề bằng nhau.\"
- #strong[Sản phẩm:] Khái niệm Mệnh đề tương đương, phát biểu
  #strong[\"Điều kiện cần và đủ\"].
- #strong[Tổ chức thực hiện:]
  - #strong[Bước 1:] GV dẫn dắt từ ví dụ về Mệnh đề đảo (HĐ 2.3) mà cả
    $P arrow.r.double Q$ và $Q arrow.r.double P$ đều đúng.
  - #strong[Bước 2:] HS #strong[thảo luận nhóm] để tìm thêm 2-3 ví dụ về
    mệnh đề tương đương trong Hình học.
  - #strong[Bước 3:] GV tổng kết, nhấn mạnh $P arrow.l.r.double Q$ đúng
    khi và chỉ khi $P$ và $Q$ có cùng tính đúng/sai.

==== 2.5. Hoạt động thành phần 2.5: Mệnh đề có chứa ký hiệu với mọi, tồn tại (30 phút)
- #strong[Tên hoạt động:] Khám phá Ký hiệu Lượng từ
- #strong[Mục tiêu:] HS nhận biết và sử dụng đúng các ký hiệu $forall$
  (với mọi) và $exists$ (tồn tại) và biết cách lập mệnh đề phủ định của
  chúng.
- #strong[Nội dung:]
  #block[
  #set enum(numbering: "a.", start: 1)
  + Giới thiệu ký hiệu $forall$ và $exists$ (Lượng từ).
  + Thực hành viết lại các phát biểu thành mệnh đề sử dụng ký hiệu.
  + Lập quy tắc phủ định: $overline((forall x\,P\(x\)))$ và
    $overline((exists x\,P\(x\)))$.
  ]
- #strong[Ví dụ minh họa:]
  - #strong[Mệnh đề:] \"Bình phương của mọi số thực đều không âm.\"
    $arrow.r.double forall x bb(in R\,) x^2 gt.eq 0$.
  - #strong[Mệnh đề phủ định:]
    $overline((forall x bb(in R\,) x^2 gt.eq 0))$ là
    $exists x bb(in R\,) x^2 < 0$.
- #strong[Sản phẩm:] Quy tắc sử dụng $forall\,exists$, quy tắc lập mệnh
  đề phủ định của chúng.
- #strong[Tổ chức thực hiện:]
  - #strong[Bước 1:] GV giới thiệu ký hiệu. HS #strong[làm việc cá nhân]
    viết lại các câu phát biểu bằng ký hiệu $forall\,exists$.
  - #strong[Bước 2:] GV yêu cầu HS thảo luận (cặp đôi) để đưa ra quy tắc
    lập mệnh đề phủ định cho loại mệnh đề này.
  - #strong[Bước 3:] HS báo cáo. GV chốt quy tắc và cho bài tập nhanh.

#hd("3", "Luyện tập", "20 phút")
- #strong[Tên hoạt động:] Vận dụng và Tổng hợp kiến thức
- #strong[Phương pháp/Kĩ thuật:] #strong[Trò chơi học tập
  (Quizizz/Kahoot), Kĩ thuật Khăn trải bàn, Sơ đồ tư duy].

#mt-hd[
- Vận dụng kiến thức đã học để giải quyết các dạng bài tập cơ bản về
  mệnh đề.
- Phát triển kĩ năng phân tích, tổng hợp thông tin, làm việc nhóm, và sử
  dụng công nghệ số.

]
#nd-hd[
- #strong[Phần 1: Trò chơi học tập (10 phút):] HS tham gia trò chơi trực
  tuyến (Quizizz/Kahoot) gồm các câu hỏi trắc nghiệm nhanh về tính đúng
  sai, lập mệnh đề phủ định, mệnh đề kéo theo và tương đương.
  - #strong[Tích hợp Năng lực số:] Sử dụng nền tảng số để #strong[kiểm
    tra, đánh giá] (biểu hiện #strong[Năng lực số: Tạo và sử dụng sản
    phẩm số]).
- #strong[Phần 2: Sơ đồ tư duy (10 phút):] HS #strong[thảo luận nhóm]
  tóm tắt toàn bộ kiến thức về Mệnh đề (các loại mệnh đề, phép toán, ký
  hiệu) bằng #strong[sơ đồ tư duy] (Mindmap) trên giấy A0 hoặc phần mềm
  online.

]
#sp-hd[
- Kết quả trả lời các câu hỏi trong trò chơi học tập.
- Sơ đồ tư duy tổng hợp kiến thức của bài \"Mệnh đề\" (đủ các nhánh).

]
#tc-hd[
- #strong[Bước 1:] GV hướng dẫn HS truy cập đường link trò chơi. HS thực
  hiện (cá nhân). GV theo dõi.
- #strong[Bước 2:] Sau trò chơi, GV nhận xét, giải đáp nhanh các câu hỏi
  khó.
- #strong[Bước 3:] GV chia nhóm, phát dụng cụ/hướng dẫn sử dụng phần mềm
  Mindmap. Các nhóm thực hiện việc tổng hợp kiến thức. GV quan sát, hỗ
  trợ.
- #strong[Bước 4:] GV lựa chọn 1-2 nhóm trình bày nhanh Sơ đồ tư duy.

]
#hd("4", "Vận dụng", "5 phút - Giao nhiệm vụ về nhà")
- #strong[Tên hoạt động:] Ứng dụng Logic vào thực tiễn
- #strong[Phương pháp/Kĩ thuật:] #strong[Bài tập dự án nhỏ].

#mt-hd[
- Phát triển năng lực của học sinh thông qua việc vận dụng kiến thức, kĩ
  năng về Mệnh đề vào thực tiễn.

]
#nd-hd[
- #strong[Nhiệm vụ:] Tìm kiếm 3 phát biểu trong đời sống (thời sự, luật
  pháp, quảng cáo, châm ngôn...) có dạng #strong[Mệnh đề kéo theo
  (]$P arrow.r.double Q$#strong[)] hoặc #strong[Mệnh đề tương đương
  (]$P arrow.l.r.double Q$#strong[)]. Phân tích và viết lại các phát
  biểu đó bằng ngôn ngữ Toán học (sử dụng
  $P\,Q\,arrow.r.double\,arrow.l.r.double$). Sau đó, lập mệnh đề phủ
  định (nếu có thể).
  - #emph[Ví dụ:] \"Nếu trời mưa to thì học sinh được nghỉ học.\"
- #strong[Tích hợp Năng lực số:] HS có thể trình bày sản phẩm dưới dạng
  báo cáo điện tử (file Word/PDF/PowerPoint), video ngắn, hoặc hình ảnh
  sơ đồ (biểu hiện #strong[Năng lực số: Tạo và sử dụng sản phẩm số]).

]
#sp-hd[
- Báo cáo (viết tay/điện tử) phân tích 3 ví dụ thực tiễn theo yêu cầu,
  có sử dụng ngôn ngữ và ký hiệu mệnh đề.

]
#tc-hd[
- GV giao nhiệm vụ, hướng dẫn HS về yêu cầu nội dung và hình thức báo
  cáo.
- GV thông báo thời hạn nộp bài (ngoài giờ học trên lớp) và tiêu chí
  đánh giá (chú trọng tính sáng tạo và tính chính xác logic).

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
