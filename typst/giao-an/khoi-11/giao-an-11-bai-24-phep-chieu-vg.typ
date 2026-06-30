// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 24 Phép chiếu VG",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được #strong[định nghĩa phép chiếu vuông góc] và hình chiếu vuông
  góc của một điểm, một đường thẳng, một đoạn thẳng, một hình lên mặt
  phẳng (theo yêu cầu cần đạt của chương trình).
- Nêu được #strong[định nghĩa và xác định được góc giữa đường thẳng và
  mặt phẳng] (theo yêu cầu cần đạt của chương trình).
- Nhận biết và sử dụng được tính chất của phép chiếu vuông góc.
- Vận dụng được các kiến thức đã học để giải một số bài toán thực tế đơn
  giản có liên quan.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Tự chủ và tự học:] Chủ động tìm hiểu, khám phá kiến thức mới
    về phép chiếu vuông góc và góc giữa đường thẳng và mặt phẳng thông
    qua SGK và học liệu.
  - #strong[Giao tiếp và hợp tác:] Tích cực thảo luận nhóm, trình bày ý
    kiến, báo cáo kết quả trước lớp, sử dụng ngôn ngữ toán học chính
    xác.
  - #strong[Giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp thông
    tin, đưa ra lời giải cho các bài tập từ cơ bản đến nâng cao.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực tư duy và lập luận toán học:] Hình thành các khái
    niệm qua trực quan và suy luận, thực hiện các thao tác tư duy như
    phân tích, tổng hợp, khái quát hóa, đặc biệt trong việc xác định
    hình chiếu và góc.
  - #strong[Năng lực mô hình hóa toán học:] Thiết lập mô hình hóa (ví
    dụ: hình chiếu của vật thể lên mặt phẳng, góc nghiêng của thanh
    chống) để giải quyết các vấn đề thực tiễn liên quan đến kiến thức đã
    học.
  - #strong[Năng lực sử dụng công cụ, phương tiện học toán (Tích hợp
    Năng lực số - Thông tư 02/2025/TT-BGDĐT):] Sử dụng phần mềm hình học
    động (như #strong[GeoGebra] hoặc các ứng dụng vẽ hình 3D) để vẽ
    hình, minh họa, quan sát các khái niệm về phép chiếu vuông góc và
    góc giữa đường thẳng và mặt phẳng, giúp trực quan hóa kiến thức.
- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động học tập, hoàn thành
  đầy đủ các nhiệm vụ cá nhân và nhóm.
- #strong[Trách nhiệm:] Có ý thức hợp tác, xây dựng ý kiến trong nhóm;
  bảo vệ và chấp nhận ý kiến đúng đắn; có trách nhiệm với sản phẩm của
  mình và của nhóm.
- #strong[Trung thực:] Thẳng thắn, trung thực trong quá trình giải bài
  tập, làm thí nghiệm và báo cáo kết quả.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, bảng phụ (hoặc màn
  hình tương tác), thước kẻ, ê-ke.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 (Tập 2 - Kết nối tri thức với cuộc sống).
  - Phiếu học tập (in sẵn hoặc trực tuyến).
  - #strong[Phần mềm GeoGebra hoặc mô hình hình học không gian] (trực
    quan hóa phép chiếu và góc).
  - Hình ảnh thực tế minh họa phép chiếu vuông góc (ví dụ: bóng của cột
    đèn trên mặt đất, góc nghiêng của mái nhà, v.v.).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/Mở đầu", "10 phút")
- #strong[Tên hoạt động:] Khởi động - Nhìn hình, đoán góc.
#mt-hd[
Tạo hứng thú, huy động kiến thức thực tiễn và
  xác định được vấn đề cần giải quyết: #strong[Làm thế nào để xác định
  góc nghiêng và hình chiếu của một vật thể lên một mặt phẳng?]
]
#nd-hd[
  - GV đặt vấn đề bằng hình ảnh/video thực tế (ví dụ: #strong[Bóng của
    một cái cây/cột điện trên mặt đất] hoặc #strong[Góc nghiêng của một
    thanh chống lên tường]). \* GV đặt câu hỏi gợi mở:
    - Cái bóng trên mặt đất được hình thành như thế nào? (Gợi mở về hình
      chiếu).
    - Chúng ta cần xác định góc nào để biết thanh chống nghiêng bao
      nhiêu độ so với mặt đất? (Gợi mở về góc giữa đường thẳng và mặt
      phẳng).
  - HS làm việc cá nhân, suy nghĩ và trả lời nhanh.
]
#sp-hd[
Câu trả lời của HS về cách hình thành bóng (hình
  chiếu) và dự đoán về cách xác định góc.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập (GV):] Chiếu hình ảnh và yêu
    cầu HS quan sát, suy nghĩ trong 2 phút.
  - #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
    trợ):] HS ghi nhanh câu trả lời ra nháp.
  - #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức, điều hành):] Mời 1-2
    HS trình bày ý kiến.
  - #strong[Bước 4: Kết luận, nhận định (GV):] GV nhận xét, dẫn dắt vào
    bài học: Để giải quyết các vấn đề này, chúng ta cần tìm hiểu về
    #strong[phép chiếu vuông góc] và #strong[góc giữa đường thẳng và mặt
    phẳng].

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "60 phút")
===== Hoạt động thành phần 2.1: Phép chiếu vuông góc (30 phút)
- #strong[Tên hoạt động:] Khám phá định nghĩa và tính chất.
#mt-hd[
Giúp HS #strong[chiếm lĩnh kiến thức] về định
  nghĩa, tính chất của phép chiếu vuông góc và hình chiếu vuông góc của
  các hình lên mặt phẳng.
]
#nd-hd[
  - #strong[Nhiệm vụ 1: Khái niệm (Nhóm/Cặp đôi):] GV yêu cầu HS làm
    việc với SGK và phiếu học tập (PHT số 1).
    - #emph[PHT 1:] Đọc mục 1 SGK (Phép chiếu vuông góc).
    - #emph[Yêu cầu:] Thảo luận và điền vào chỗ trống: Phép chiếu vuông
      góc là phép chiếu song song với phương chiếu #strong[như thế nào]
      so với mặt phẳng chiếu $\(P\)$? Hình chiếu vuông góc của điểm $M$
      lên mặt phẳng $\(P\)$ là gì?
  - #strong[Nhiệm vụ 2: Hình chiếu của hình (Cá nhân/Nhóm):] GV yêu cầu
    HS sử dụng #strong[GeoGebra] (hoặc mô hình hình học) để quan sát
    hình chiếu vuông góc của đoạn thẳng, đường thẳng lên mặt phẳng.
    #strong[\(Tích hợp Năng lực số)]
    - #emph[Yêu cầu:] Quan sát hình chiếu của đoạn thẳng và đường thẳng
      (song song, cắt, vuông góc) lên mặt phẳng và đưa ra nhận xét về
      tính chất của phép chiếu.
    - #emph[Ví dụ cụ thể (cho GeoGebra):] Vẽ đoạn thẳng $A B$ song song
      với mặt phẳng $\(P\)$ và một đoạn thẳng $C D$ cắt $\(P\)$. Quan
      sát hình chiếu $A' B'$ và $C' D'$.
  - #strong[Nhiệm vụ 3: Vận dụng cơ bản:] Áp dụng xác định hình chiếu
    vuông góc của cạnh và mặt bên trong hình chóp, hình lăng trụ.
    - #emph[Ví dụ cụ thể:] Cho hình chóp $S . A B C$ có
      $S A perp\(A B C\)$. Xác định hình chiếu vuông góc của cạnh $S C$
      và mặt bên $S A B$ lên mặt phẳng $\(A B C\)$.
]
#sp-hd[
  - #strong[Kiến thức mới:] Định nghĩa phép chiếu vuông góc (Phương
    chiếu $d perp\(P\)$); Định nghĩa hình chiếu vuông góc.
  - #strong[Vận dụng:] Câu trả lời chính xác cho Ví dụ cụ thể (Hình
    chiếu của $S C$ là $A C$, hình chiếu của mặt bên $S A B$ là cạnh
    $A B$).
  - #strong[Biểu hiện Năng lực số:] HS vẽ hình minh họa phép chiếu trên
    GeoGebra hoặc báo cáo các quan sát thu được từ phần mềm.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ (GV):] Phát PHT 1 và giao nhiệm vụ 1,
    2, 3.
  - #strong[Bước 2: Thực hiện nhiệm vụ (HS):] HS làm việc cặp đôi/nhóm
    nhỏ (5-7 phút/Nhiệm vụ). GV theo dõi, hỗ trợ các nhóm gặp khó khăn
    (dự kiến: HS nhầm lẫn giữa phép chiếu vuông góc và phép chiếu song
    song chung; biện pháp hỗ trợ: gợi ý về phương chiếu).
  - #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức):] Mời đại diện các
    nhóm #strong[trình bày] kết quả PHT 1 và các nhận xét từ quan sát
    GeoGebra/mô hình.
  - #strong[Bước 4: Kết luận, nhận định (GV):] Chuẩn hóa kiến thức, chốt
    lại định nghĩa và các tính chất quan trọng, yêu cầu HS ghi nhận vào
    vở.

===== Hoạt động thành phần 2.2: Góc giữa đường thẳng và mặt phẳng (30 phút)
- #strong[Tên hoạt động:] Xây dựng khái niệm và phương pháp xác định
  góc.
]
#mt-hd[
Giúp HS #strong[chiếm lĩnh kiến thức] về định
  nghĩa góc giữa đường thẳng và mặt phẳng, và nắm vững #strong[phương
  pháp 3 bước] để xác định góc.
]
#nd-hd[
  - #strong[Nhiệm vụ 1: Khái niệm (Nhóm):] GV yêu cầu HS làm việc với
    SGK và PHT số 2.
    - #emph[PHT 2:] Đọc mục 2 SGK (Góc giữa đường thẳng và mặt phẳng).
    - #emph[Yêu cầu:] Hoàn thành sơ đồ tư duy nhỏ: #strong[Góc giữa
      đường thẳng] $d$ #strong[và mặt phẳng] $\(P\)$ là góc giữa đường
      thẳng $d$ và #strong[cái gì]? (d\' là hình chiếu vuông góc của d
      lên (P)). Góc này nằm ở đâu?
  - #strong[Nhiệm vụ 2: Phương pháp xác định (Thuyết trình nhóm):] Yêu
    cầu các nhóm đề xuất #strong[quy trình 3 bước] xác định góc $phi$
    giữa đường thẳng $d$ và mặt phẳng $\(P\)$.
    - #strong[Bước 1:] Tìm giao điểm $I = d inter\(P\)$.
    - #strong[Bước 2:] Lấy điểm $M in d$ ($M eq.not I$), tìm hình chiếu
      $H$ của $M$ lên $\(P\)$.
    - #strong[Bước 3:] Góc cần tìm là $accent(M I H, ̂)$.
  - #strong[Nhiệm vụ 3: Ví dụ minh họa và củng cố (Luyện tập tại chỗ):]
    Áp dụng quy tắc vừa xây dựng.
    - #emph[Ví dụ cụ thể:] Cho hình lập phương $A B C D . A' B' C' D'$.
      Xác định góc giữa đường thẳng $A C'$ và mặt phẳng $\(A B C D\)$.
]
#sp-hd[
  - #strong[Kiến thức mới:] Định nghĩa góc giữa đường thẳng và mặt phẳng
    ($0^compose lt.eq phi lt.eq 90^compose$); Phương pháp xác định góc
    (3 bước).
  - #strong[Vận dụng:] Lời giải chi tiết cho Ví dụ cụ thể (Góc cần tìm
    là $accent(C' A C, ̂)$).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ (GV):] Phát PHT 2 (Sơ đồ tư duy) và
    giao nhiệm vụ 1, 2, 3.
  - #strong[Bước 2: Thực hiện nhiệm vụ (HS):] HS làm việc nhóm (10
    phút). GV khuyến khích các nhóm sử dụng hình vẽ tay hoặc GeoGebra để
    minh họa quy trình.
  - #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức):] Mời 1 nhóm trình
    bày sơ đồ tư duy (định nghĩa), 1 nhóm trình bày quy trình 3 bước.
    Mời 1-2 HS lên bảng trình bày lời giải Ví dụ minh họa.
  - #strong[Bước 4: Kết luận, nhận định (GV):] Chuẩn hóa kiến thức, nhấn
    mạnh trường hợp đặc biệt (đường thẳng vuông góc hoặc song song với
    mặt phẳng), yêu cầu HS ghi chép.

]
#hd("3", "Luyện tập", "15 phút")
- #strong[Tên hoạt động:] Thực hành tính toán và phân tích.
#mt-hd[
Vận dụng kiến thức đã học để #strong[giải quyết
  các bài tập toán học] cơ bản và nâng cao kĩ năng phân tích hình không
  gian, rèn luyện tính toán.
]
#nd-hd[
Hệ thống các bài tập đa dạng.
  - #strong[Bài tập 1 (Phép chiếu):] Cho hình chóp $S . A B C D$ có đáy
    $A B C D$ là hình vuông. Nếu $S A perp\(A B C D\)$, hãy xác định
    hình chiếu của tam giác $S C D$ lên $\(A B C D\)$ và tính diện tích
    hình chiếu đó (theo $a$).
  - #strong[Bài tập 2 (Góc):] Cho hình chóp $S . A B C$ có đáy $A B C$
    là tam giác đều cạnh $a$, $S A perp\(A B C\)$ và $S A = a sqrt(3)$.
    Tính góc giữa đường thẳng $S C$ và mặt phẳng $\(A B C\)$.
  - #strong[Hình thức:] Giao bài tập qua #strong[Kahoot! Quiz] hoặc
    #strong[Quizizz] (Trò chơi học tập kết hợp #strong[Năng lực số]).
]
#sp-hd[
Đáp án, lời giải chi tiết của các bài tập.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ (GV):] Giao 2 bài tập (hoặc thiết lập
    trò chơi học tập trên nền tảng số).
  - #strong[Bước 2: Thực hiện nhiệm vụ (HS):] Cá nhân hoặc cặp đôi thực
    hiện, sử dụng máy tính cá nhân/điện thoại để tham gia trò chơi (5-7
    phút).
  - #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức):] GV hiển thị kết
    quả/thứ hạng của trò chơi. Mời 1-2 HS lên bảng trình bày chi tiết
    lời giải Bài tập 2.
  - #strong[Bước 4: Kết luận, nhận định (GV):] Nhận xét, củng cố phương
    pháp giải, đặc biệt là Bài tập 2 (sử dụng tỉ số lượng giác trong tam
    giác vuông để tính góc).

]
#hd("4", "Vận dụng", "5 phút")
- #strong[Tên hoạt động:] Liên hệ thực tiễn và mở rộng.
#mt-hd[
Phát triển năng lực #strong[vận dụng kiến thức
  vào thực tiễn] thông qua nhiệm vụ liên hệ thực tế, nâng cao năng lực
  giải quyết vấn đề.
]
#nd-hd[
  - #strong[Nhiệm vụ:] Tìm kiếm và đề xuất 1-2 tình huống/vấn đề thực tế
    có sử dụng phép chiếu vuông góc hoặc xác định góc giữa đường thẳng
    và mặt phẳng.
  - #emph[Ví dụ:] Góc giữa tia nắng mặt trời và mặt đất để tính chiều
    cao vật thể thông qua bóng của nó (đo đạc gián tiếp).
]
#sp-hd[
Báo cáo dưới hình thức #strong[ảnh chụp thực tế
  kèm lời giải thích] (trình bày trên giấy hoặc file mềm).
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ (GV):] Giao nhiệm vụ cho HS thực hiện
    #strong[ngoài giờ học trên lớp].
  - #strong[Bước 2: Thực hiện nhiệm vụ (HS):] HS thực hiện, có thể chụp
    ảnh/quay video.
  - #strong[Bước 3: Báo cáo, trao đổi (GV):] Nộp báo cáo vào buổi học
    tiếp theo để trao đổi, chia sẻ và đánh giá (dưới hình thức trưng bày
    sản phẩm hoặc báo cáo ngắn).

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
