// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 22 Ba đường Conic",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được định nghĩa ba đường conic: #strong[Elip], #strong[Hypebol],
  #strong[Parabol] theo tiêu điểm và đường chuẩn.
- Viết được phương trình chính tắc của ba đường conic.
- Xác định được các yếu tố cơ bản của ba đường conic (tiêu điểm, tiêu
  cự, trục lớn/thực, tâm sai, đỉnh, đường chuẩn) khi biết phương trình
  chính tắc và ngược lại.
- Mô tả được một số ứng dụng thực tiễn của ba đường conic.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu định nghĩa,
    công thức thông qua sách giáo khoa và tài liệu số hóa.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận, hợp tác
    nhóm để giải quyết nhiệm vụ học tập, báo cáo kết quả trước lớp.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Đề xuất được các
    phương án giải quyết bài toán và vận dụng kiến thức vào các tình
    huống thực tiễn.
- #strong[Năng lực đặc thù môn học:]
  - #strong[Năng lực tư duy và lập luận toán học:] Thực hiện được các
    thao tác tư duy (quan sát, phân tích, tổng hợp) để thiết lập và vận
    dụng phương trình các đường conic.
  - #strong[Năng lực mô hình hóa toán học:] Sử dụng phương trình chính
    tắc của conic để mô tả các đối tượng, hiện tượng thực tế (ví dụ: quỹ
    đạo hành tinh, chóa đèn pha).
  - #strong[Năng lực công cụ và phương tiện toán học:] Sử dụng hiệu quả
    phần mềm toán học (như GeoGebra) để vẽ, khảo sát các đường conic và
    giải quyết bài toán.
- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Hoàn thành các nhiệm vụ học tập được giao, tích cực
  tìm tòi, khám phá kiến thức về các đường conic.
- #strong[Trung thực:] Thể hiện thái độ nghiêm túc, trung thực trong quá
  trình thực hiện nhiệm vụ nhóm và cá nhân.
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ của bản thân và
  nhiệm vụ chung của nhóm; ý thức vận dụng kiến thức Toán học vào giải
  quyết các vấn đề thực tiễn.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy tính, máy chiếu, bảng phụ/màn hình
  tương tác.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (KNTT)
  - Phần mềm #strong[GeoGebra] (dùng cho cả GV và HS để vẽ, thay đổi
    tham số và quan sát các đường conic).
  - Video/hình ảnh về các ứng dụng thực tế của conic (ví dụ: cầu vòm,
    chảo Parabol vệ tinh, quỹ đạo hành tinh hình Elip).
  - Phiếu học tập, bộ câu hỏi trắc nghiệm tương tác (sử dụng
    Kahoot/Quizizz nếu có).
  - Dụng cụ vẽ hình elip, hypebol, parabol (dây, đinh ghim, thước).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Khởi động/Xác định vấn đề/nhiệm vụ học tập", "15 phút")
#mt-hd[
  quyết: Nhận biết sự tồn tại của ba đường conic trong thực tiễn và khơi
  gợi nhu cầu tìm hiểu về các tính chất toán học của chúng.

]
#nd-hd[

  - #strong[Nhiệm vụ 1:] Giáo viên trình chiếu các hình ảnh thực tế: Cầu
    Long Biên (dạng Elip/Parabol), chảo thu sóng vệ tinh (dạng Parabol),
    tháp đôi (dạng Hypebol), hoặc quỹ đạo chuyển động của Trái Đất quanh
    Mặt Trời. \* #strong[Nhiệm vụ 2 (Thảo luận cặp đôi):]
    - Quan sát các hình ảnh và cho biết chúng gợi lên hình dạng của
      đường cong nào đã học (nếu có)?
    - Nêu một vài nhận xét ban đầu về sự khác nhau giữa các đường cong
      này.
  - #strong[Nhiệm vụ 3:] Giáo viên đặt vấn đề: \"Các đường cong này đều
    được tạo ra khi cắt một hình nón bằng một mặt phẳng. Vậy, trong Toán
    học, chúng được định nghĩa và mô tả bằng công thức như thế nào?\"
    (Dẫn dắt vào bài học).

]
#sp-hd[

  - Các hình ảnh minh họa đường cong Elip, Hypebol, Parabol trong thực
    tế.
  - Nhận xét, mô tả ban đầu của học sinh về các đường cong.
  - Xác định được nhiệm vụ học tập: Tìm hiểu định nghĩa và phương trình
    toán học của ba đường conic.

]
#tc-hd[

  - #strong[Giao nhiệm vụ:] Giáo viên trình chiếu hình ảnh, yêu cầu HS
    quan sát và thảo luận cặp đôi. (10 phút)
  - #strong[Thực hiện nhiệm vụ:] HS trao đổi, ghi nhận xét sơ bộ.
  - #strong[Báo cáo, thảo luận:] Giáo viên gọi ngẫu nhiên một vài cặp
    đôi trình bày ý kiến.
  - #strong[Kết luận, nhận định:] Giáo viên chốt lại, khen ngợi các nhận
    xét đúng. Dẫn dắt: \"Chúng ta sẽ gọi chung ba đường cong này là
    #strong[Ba đường Conic] và đi tìm hiểu chi tiết về chúng.\"

]
#hd("2", "Hình thành kiến thức mới/Giải quyết vấn đề", "135 phút - Chia thành 4 hoạt động thành phần")
==== Hoạt động 2.1: Elip (30 phút)
- #strong[Tên hoạt động:] #strong[Khám phá Phương trình và Tính chất của
  Elip]

#mt-hd[

  - Nắm được định nghĩa và phương trình chính tắc của Elip.
  - Xác định được các yếu tố cơ bản của Elip (tiêu điểm, tiêu cự, trục
    lớn/nhỏ, tâm sai) từ phương trình.

]
#nd-hd[

  - #strong[Nhiệm vụ 1 (Sử dụng học liệu):] Học sinh đọc Sách giáo khoa
    (hoặc tài liệu số) để tìm hiểu định nghĩa Elip và cách thiết lập
    phương trình chính tắc $x^2 / a^2 + y^2 / b^2 = 1$.
  - #strong[Nhiệm vụ 2 (Tích hợp Năng lực số):] #strong[Thực hành với
    GeoGebra.]
    - Nhóm nhập phương trình mẫu $x^2 / 25 + y^2 / 9 = 1$ vào GeoGebra
      để vẽ Elip.
    - Sử dụng thanh trượt (slider) để thay đổi giá trị của $a$ và $b$,
      quan sát sự thay đổi hình dạng và vị trí của Elip, tiêu điểm
      $F_1\,F_2$.
    - Đề xuất mối liên hệ giữa $a\,b$ và $c$ (nửa tiêu cự).
  - #strong[Ví dụ cụ thể:] Cho Elip có phương trình
    $x^2 / 100 + y^2 / 36 = 1$. Xác định tọa độ tiêu điểm, độ dài trục
    lớn, trục nhỏ, tiêu cự và tâm sai.

]
#sp-hd[

  - Định nghĩa, phương trình chính tắc của Elip.
  - Mối liên hệ $a^2 = b^2 + c^2$ và các yếu tố cơ bản.
  - Lời giải cho ví dụ cụ thể.
  - Hình ảnh Elip được vẽ và khảo sát trên GeoGebra.

]
#tc-hd[

  - #strong[Giao nhiệm vụ (Hoạt động nhóm chuyên gia):] Giao nhiệm vụ
    tìm hiểu về Elip cho nhóm chuyên gia.
  - #strong[Thực hiện nhiệm vụ:] HS đọc tài liệu, thảo luận nhóm, thực
    hiện thao tác trên GeoGebra để rút ra kết luận. (Giáo viên theo dõi,
    hỗ trợ: dự kiến HS khó khăn trong việc thiết lập công thức
    $a^2 = b^2 + c^2$ cần gợi ý về mối liên hệ $a = R$ khi $F_1\,F_2$
    nằm trên trục hoành).
  - #strong[Báo cáo, thảo luận:] Nhóm chuyên gia Elip chuẩn bị nội dung
    để báo cáo với các nhóm khác ở phần sau.

==== Hoạt động 2.2: Hypebol (30 phút)
- #strong[Tên hoạt động:] #strong[Phân tích Phương trình và Đặc trưng
  của Hypebol]

]
#mt-hd[

  - Nắm được định nghĩa và phương trình chính tắc của Hypebol.
  - Xác định được các yếu tố cơ bản của Hypebol (tiêu điểm, tiêu cự,
    trục thực/ảo, tiệm cận) từ phương trình.

]
#nd-hd[

  - #strong[Nhiệm vụ 1:] Học sinh đọc Sách giáo khoa (hoặc tài liệu số)
    để tìm hiểu định nghĩa Hypebol và phương trình chính tắc
    $x^2 / a^2 - y^2 / b^2 = 1$.
  - #strong[Nhiệm vụ 2 (Tích hợp Năng lực số):] #strong[Thực hành với
    GeoGebra.]
    - Nhập phương trình mẫu $x^2 / 16 - y^2 / 9 = 1$ vào GeoGebra.
    - Quan sát và xác định các đường tiệm cận $y = plus.minus b / a x$.
      Sử dụng thanh trượt để thay đổi $a\,b$ và quan sát sự thay đổi của
      tiệm cận và hình dạng Hypebol.
    - Đề xuất mối liên hệ giữa $a\,b$ và $c$ (nửa tiêu cự).
  - #strong[Ví dụ cụ thể:] Cho Hypebol có phương trình
    $4 x^2 - 9 y^2 = 36$. Đưa về dạng chính tắc, xác định tiêu điểm, độ
    dài trục thực, trục ảo và phương trình hai đường tiệm cận.

]
#sp-hd[

  - Định nghĩa, phương trình chính tắc của Hypebol.
  - Mối liên hệ $c^2 = a^2 + b^2$ và các yếu tố cơ bản, đặc biệt là tiệm
    cận.
  - Lời giải cho ví dụ cụ thể.
  - Hình ảnh Hypebol được vẽ và khảo sát trên GeoGebra.

]
#tc-hd[

==== Hoạt động 2.3: Parabol (30 phút)
- #strong[Tên hoạt động:] #strong[Nghiên cứu Định nghĩa và Phương trình
  Parabol]

]
#mt-hd[

  - Nắm được định nghĩa và phương trình chính tắc của Parabol
    $y^2 = 2 p x$.
  - Xác định được các yếu tố cơ bản của Parabol (tiêu điểm, đường chuẩn)
    từ phương trình.

]
#nd-hd[

  - #strong[Nhiệm vụ 1:] Học sinh đọc Sách giáo khoa (hoặc tài liệu số)
    để tìm hiểu định nghĩa Parabol và phương trình chính tắc
    $y^2 = 2 p x$ (với $p > 0$).
  - #strong[Nhiệm vụ 2 (Tích hợp Năng lực số):] #strong[Thực hành với
    GeoGebra.]
    - Nhập phương trình mẫu $y^2 = 4 x$ vào GeoGebra.
    - Sử dụng thanh trượt $p$ để thay đổi giá trị của tham số tiêu $p$,
      quan sát sự thay đổi độ \"mở\" của Parabol và vị trí của tiêu điểm
      $F$, đường chuẩn $Delta$.
  - #strong[Ví dụ cụ thể:] Cho Parabol có phương trình $y^2 = 8 x$. Xác
    định tọa độ tiêu điểm $F$ và phương trình đường chuẩn $Delta$.

]
#sp-hd[

  - Định nghĩa, phương trình chính tắc của Parabol.
  - Mối liên hệ của tham số tiêu $p$ với tiêu điểm và đường chuẩn.
  - Lời giải cho ví dụ cụ thể.
  - Hình ảnh Parabol được vẽ và khảo sát trên GeoGebra.

]
#tc-hd[

==== Hoạt động 2.4: Báo cáo, Thuyết trình, Tổng hợp Kiến thức (45 phút)
- #strong[Tên hoạt động:] #strong[Tổng hợp kiến thức Ba đường Conic]

]
#mt-hd[

  - Giúp học sinh tổng hợp và so sánh kiến thức về định nghĩa, phương
    trình, và các yếu tố cơ bản của cả ba đường conic.
  - Phát triển kỹ năng giao tiếp, thuyết trình và phân tích, tổng hợp
    thông tin.

]
#nd-hd[

  - #strong[Nhiệm vụ 1 (Hoạt động nhóm ban đầu):] Các chuyên gia quay về
    nhóm ban đầu. Từng chuyên gia lần lượt trình bày, truyền đạt kiến
    thức chuyên sâu (Elip, Hypebol, Parabol) đã nghiên cứu cho các thành
    viên còn lại.
  - #strong[Nhiệm vụ 2 (Sơ đồ tư duy):] Cả nhóm cùng nhau lập một
    #strong[Sơ đồ tư duy] so sánh ba đường conic (Định nghĩa, Phương
    trình, Điều kiện, Yếu tố đặc trưng: tiêu điểm, tiệm cận/đường
    chuẩn).
  - #strong[Nhiệm vụ 3 (Luyện tập giao tiếp):] Đại diện các nhóm trình
    bày sơ đồ tư duy trước lớp.

]
#sp-hd[

  - Sơ đồ tư duy tổng hợp và so sánh ba đường conic.
  - Bài trình bày, giải thích rõ ràng của các thành viên nhóm về nội
    dung chuyên sâu.

]
#tc-hd[

  - #strong[Giao nhiệm vụ:] Giáo viên yêu cầu các chuyên gia quay về
    nhóm ban đầu để báo cáo và tổng hợp bằng Sơ đồ tư duy.
  - #strong[Thực hiện nhiệm vụ:] HS tiến hành trao đổi (chia sẻ kiến
    thức) và thiết lập Sơ đồ tư duy. (Giáo viên quan sát, hỗ trợ và đưa
    ra phản hồi kịp thời).
  - #strong[Báo cáo, thảo luận:] Đại diện 3-4 nhóm trình bày Sơ đồ tư
    duy. (Đánh giá kĩ năng thuyết trình, phân tích và tổng hợp).
  - #strong[Kết luận, nhận định:] Giáo viên nhận xét, đánh giá các Sơ đồ
    tư duy và củng cố lại các nội dung cốt lõi của bài học: sự khác biệt
    về dấu giữa $x^2\,y^2$ trong phương trình.

]
#hd("3", "Luyện tập", "15 phút")
- #strong[Tên hoạt động:] #strong[Trò chơi ôn tập: Ai nhanh hơn?]

#mt-hd[
  trình và xác định các yếu tố cơ bản của các đường conic, rèn luyện kỹ
  năng tính toán nhanh và chính xác.

]
#nd-hd[

  - #strong[Nhiệm vụ:] Giáo viên sử dụng hệ thống câu hỏi trắc nghiệm
    ngắn (có thể dùng Quizizz/Kahoot hoặc phiếu học tập) bao gồm các
    dạng bài tập:
    - Nhận dạng conic qua phương trình (Elip, Hypebol, Parabol).
    - Tìm tiêu điểm, tiêu cự, đỉnh từ phương trình.
    - Viết phương trình chính tắc khi biết một số yếu tố.
  - #strong[Ví dụ cụ thể:]
    - Phương trình nào sau đây là của Hypebol? (A)
      $x^2 / 4 + y^2 / 9 = 1$ (B) $x^2 / 4 - y^2 / 9 = 1$ (C)
      $y^2 = 4 x$ (D) $x^2 + y^2 = 9$.
    - Cho Elip có phương trình $x^2 / 16 + y^2 / 7 = 1$. Tiêu điểm $F_1$
      có tọa độ là: (A) $\(3\;0\)$ (B) $\(- 3\;0\)$ (C) $\(0\;3\)$ (D)
      $\(sqrt(7)\;0\)$.

]
#sp-hd[

]
#tc-hd[

  - #strong[Giao nhiệm vụ:] Giáo viên tổ chức trò chơi/giao phiếu học
    tập.
  - #strong[Thực hiện nhiệm vụ:] HS làm bài tập cá nhân hoặc nhóm trong
    thời gian ngắn (10 phút).
  - #strong[Kiểm tra, đánh giá:] Giáo viên gọi HS trình bày đáp án, nhận
    xét nhanh và chốt kiến thức.

]
#hd("4", "Vận dụng", "15 phút")
- #strong[Tên hoạt động:] #strong[Ứng dụng của Ba đường Conic và nhiệm
  vụ về nhà]

#mt-hd[
  vào thực tiễn; giúp học sinh thấy rõ vai trò của Toán học trong đời
  sống.

]
#nd-hd[

  - #strong[Nhiệm vụ 1:] Giáo viên trình chiếu hoặc mô tả các ứng dụng
    nổi bật của ba đường conic (ví dụ: gương hội tụ ánh sáng của Parabol
    trong chóa đèn ô tô/bếp năng lượng mặt trời, quỹ đạo vệ tinh hình
    Elip). \* #strong[Nhiệm vụ 2 (Nhiệm vụ Vận dụng ngoài giờ):] Học
    sinh thực hiện ngoài giờ học.
    - #strong[Đề xuất:] Hãy tìm kiếm (sử dụng Internet/sách báo) một ứng
      dụng cụ thể của Elip/Hypebol/Parabol trong lĩnh vực #strong[Khoa
      học hoặc Kĩ thuật] (ví dụ: kiến trúc, quang học, thiên văn học).
    - #strong[Yêu cầu:] Viết một báo cáo ngắn (có thể sử dụng các công
      cụ trình chiếu số như Powerpoint, Google Slides hoặc Mindmap) mô
      tả ứng dụng đó, có hình ảnh minh họa và giải thích tại sao đường
      conic lại được sử dụng trong ứng dụng đó (liên hệ đến tính chất
      toán học đã học).

]
#sp-hd[
  conic.

]
#tc-hd[

  - #strong[Giao nhiệm vụ:] Giáo viên giao nhiệm vụ Vận dụng, làm rõ yêu
    cầu về nội dung và hình thức báo cáo (khuyến khích sử dụng công cụ
    số).
  - #strong[Thực hiện nhiệm vụ:] HS thực hiện ngoài giờ học.
  - #strong[Trao đổi, chia sẻ và đánh giá:] (Dự kiến thực hiện vào đầu
    tiết học kế tiếp hoặc thời điểm phù hợp). Giáo viên chọn một vài báo
    cáo tiêu biểu để học sinh trình bày, chia sẻ và đánh giá.

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
