// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "HĐTHTN 3 Một số nội dung cho HĐTN Hình học",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được các bước cơ bản để #strong[kiểm tra tính đúng đắn của một kết
  quả hình học] thông qua ví dụ.
- Trình bày được cách #strong[sử dụng kết quả hình học để tính toán
  trong đo đạc thực tế] (ví dụ: tính chiều cao).
- Mô tả được quy trình #strong[gấp giấy, đo đạc và xác định các yếu tố
  của ba đường conic] (Elip, Hypebol, Parabol) thông qua trải nghiệm
  thực hành.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù Toán học:]
  - #strong[Năng lực mô hình hóa Toán học:] Vận dụng kiến thức hình học
    phẳng và hình học không gian vào giải quyết các vấn đề thực tiễn
    (tính chiều cao, đo đạc).
  - #strong[Năng lực giải quyết vấn đề Toán học:] Phân tích, xác định
    các bước kiểm tra một kết quả hình học.
  - #strong[Năng lực giao tiếp Toán học:] Trình bày rõ ràng, mạch lạc
    kết quả thực hành, báo cáo quy trình gấp giấy và đo đạc.
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động thực hiện các nhiệm vụ
    được giao, hoàn thành sản phẩm trải nghiệm.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận, phân
    công công việc và hỗ trợ các thành viên trong nhóm để hoàn thành
    nhiệm vụ chung (nhóm 3-4 học sinh).
- #strong[Năng lực số (Theo Thông tư số 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tham gia các hoạt động trải nghiệm, hăng
  hái thực hành, đo đạc.
- #strong[Trách nhiệm:] Hoàn thành tốt nhiệm vụ nhóm được giao, nghiêm
  túc, cẩn thận trong quá trình đo đạc và gấp giấy.
- #strong[Trung thực:] Ghi chép, báo cáo kết quả đo đạc một cách chính
  xác, không gian lận.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính/laptop (của giáo viên
  và phòng máy), thước dây/thước kẹp, giác kế đơn giản tự chế (hoặc ứng
  dụng giác kế trên điện thoại), máy tính cầm tay.
- #strong[Học liệu:]
  - Giấy A4/giấy màu (để thực hành gấp giấy tạo hình conic), bút chì,
    compa, thước kẻ.
  - Phiếu giao nhiệm vụ cho từng hoạt động.
  - #strong[Phần mềm GeoGebra] (cài đặt trên máy tính phòng máy) để thực
    hành vẽ hình, kiểm tra kết quả và mô hình hóa đường conic (Tích hợp
    NL số).
  - Tài liệu hướng dẫn cách gấp giấy tạo các đường conic (Elip, Hypebol,
    Parabol).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "Khởi động")
#mt-hd[
  thức lượng, tỉ số lượng giác) và xác định nhiệm vụ cần giải quyết: Áp
  dụng kiến thức Toán học vào đo đạc, thực hành thực tế.
]
#nd-hd[
  xác định được chiều cao của một cột cờ hoặc một tòa nhà cao tầng mà ta
  không thể đo trực tiếp?\"]
  - #emph[Nhiệm vụ:] Học sinh thảo luận nhóm nhanh (3 phút) để đề xuất
    phương án giải quyết (cần dụng cụ gì, sử dụng kiến thức hình học
    nào).
// ]
#sp-hd[
  (giác kế), thước dây. Sử dụng kiến thức #strong[Hệ thức lượng trong
  tam giác vuông] hoặc #strong[Tỉ số lượng giác] để tính gián tiếp.
]
#tc-hd[
  - #emph[Giao nhiệm vụ:] Giáo viên trình bày tình huống thực tế và đặt
    câu hỏi.
  - #emph[Thực hiện nhiệm vụ:] Học sinh trao đổi nhóm. (Giáo viên quan
    sát, hỗ trợ, gợi ý nếu cần).
  - #emph[Báo cáo, thảo luận:] Mời 1-2 nhóm trình bày phương án.
  - #emph[Kết luận, nhận định:] Giáo viên nhận xét, chốt vấn đề cần giải
    quyết: Cần thực hành sử dụng kiến thức hình học để giải quyết các
    vấn đề thực tiễn (đo đạc, kiểm tra).

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "Thực hành Trải nghiệm")
#strong[Mục tiêu chung:] Học sinh thực hiện các nhiệm vụ trải nghiệm cụ
thể để củng cố, vận dụng kiến thức hình học vào thực tế và làm quen với
các công cụ số.

==== 2.1. Hoạt động thành phần 2.1: Kiểm tra tính đúng đắn của một kết quả hình học
#mt-hd[
  bằng phép đo thực tế hoặc bằng công cụ số (GeoGebra).
]
#nd-hd[
  - #emph[Ví dụ đề xuất:] Giáo viên đưa ra một #strong[Định lí/Tính
    chất] quen thuộc: #strong[\"Trong một tam giác vuông, đường trung
    tuyến ứng với cạnh huyền bằng một nửa cạnh huyền.\"]
  - #emph[Nhiệm vụ:] Học sinh sử dụng #strong[thước kẻ, compa] để vẽ một
    tam giác vuông bất kì. Đo độ dài cạnh huyền và đường trung tuyến
    tương ứng.
  - #emph[Tích hợp NL số:] Học sinh sử dụng #strong[phần mềm GeoGebra]
    để vẽ tam giác vuông, xác định đường trung tuyến và kiểm tra bằng
    công cụ đo đạc của phần mềm (kiểm tra lại kết quả đo thực tế). (Biểu
    hiện NL số: NL số 1 - Sử dụng công cụ số GeoGebra để tạo hình và đo
    đạc).
]
#sp-hd[
  GeoGebra (ghi vào phiếu học tập).
]
#tc-hd[
  Giáo viên hướng dẫn cách sử dụng công cụ đo đạc trong GeoGebra.

==== 2.2. Hoạt động thành phần 2.2: Sử dụng kết quả hình học để tính toán trong đo đạc thực tế
]
#mt-hd[
  thức lượng để tính toán gián tiếp các đại lượng trong thực tế.
]
#nd-hd[
  - #emph[Ví dụ đề xuất:] #strong[Xác định chiều cao (]$h$#strong[) của
    Cột cờ/Tháp nước] trong khuôn viên trường.
  - #emph[Nhiệm vụ:] Học sinh ra ngoài sân trường (hoặc phòng thực hành)
    thực hiện đo đạc theo nhóm:
    #block[
    #set enum(numbering: "i.", start: 1)
    + Đo khoảng cách ($d$) từ vị trí đặt giác kế đến chân cột cờ.
    + Đo góc nâng ($alpha$) từ giác kế (hoặc ứng dụng trên điện thoại)
      lên đỉnh cột cờ.
    + Đo chiều cao ($k$) từ mặt đất lên tâm giác kế.
    + Sử dụng công thức $h = d dot.op t a n alpha + k$ để tính chiều
      cao.
    ]
]
#sp-hd[
  ($d\,alpha\,k$) và kết quả tính toán cuối cùng ($h$).
]
#tc-hd[
  phỏng trong lớp). Giáo viên giám sát, hỗ trợ các nhóm về thao tác đo
  góc, đo khoảng cách.

==== 2.3. Hoạt động thành phần 2.3: Gấp giấy, đo đạc và xác định các yếu tố của ba đường conic
]
#mt-hd[
  bản (tiêu điểm, đường chuẩn) của các đường conic thông qua hoạt động
  thủ công.
]
#nd-hd[
  - #emph[Ví dụ đề xuất:] #strong[Gấp giấy tạo hình Parabol.]
  - #emph[Nhiệm vụ:] Học sinh thực hiện theo nhóm:
    #block[
    #set enum(numbering: "i.", start: 1)
    + Vẽ một đường thẳng $Delta$ (đường chuẩn) và một điểm $F$ (tiêu
      điểm) không nằm trên $Delta$ trên giấy A4.
    + Thực hiện gấp giấy sao cho hình chiếu của điểm $F$ lên nếp gấp nằm
      trên đường thẳng $Delta$.
    + Lặp lại thao tác nhiều lần để tạo ra bao hình (đường Parabol).
    + #strong[Thảo luận:] Nhận xét về hình dạng và xác định các yếu tố
      cơ bản của Parabol qua nếp gấp.
    ]
]
#sp-hd[
  gấp. Sơ đồ tư duy (vẽ tay hoặc công cụ số) tóm tắt quy trình gấp giấy
  và các yếu tố hình học của Parabol.
]
#tc-hd[
  cấp tài liệu hướng dẫn gấp giấy.

==== 2.4. Hoạt động thành phần 2.4: Thực hành trải nghiệm trong phòng máy
]
#mt-hd[
  hình hóa và khảo sát các yếu tố hình học.
]
#nd-hd[
  - #emph[Ví dụ đề xuất:] #strong[Mô hình hóa đường Elip trên GeoGebra.]
  - #emph[Nhiệm vụ:] Học sinh thực hành trên máy tính (nhóm đôi):
    #block[
    #set enum(numbering: "i.", start: 1)
    + Nhập phương trình chính tắc của Elip: $x^2 / a^2 + y^2 / b^2 = 1$.
    + Thay đổi giá trị của $a$ và $b$ (dùng thanh trượt #emph[Slider])
      để quan sát sự thay đổi hình dạng của Elip.
    + Xác định và hiển thị các yếu tố: Tiêu điểm ($F_1\,F_2$), trục lớn,
      trục bé.
    ]
  - #emph[Tích hợp NL số:] Sử dụng thành thạo GeoGebra để mô hình hóa,
    thay đổi tham số và quan sát hình học. (Biểu hiện NL số: NL số 3 -
    Giải quyết vấn đề và mô hình hóa bằng công nghệ số; NL số 4. Sáng
    tạo nội dung số).
]
#sp-hd[
  thanh trượt. Bản báo cáo ghi lại các nhận xét khi thay đổi $a\,b$.
]
#tc-hd[
  hướng dẫn thao tác cơ bản và đặt câu hỏi gợi mở về mối liên hệ giữa
  $a\,b\,c$ và hình dạng của Elip.

]
#hd("3", "Luyện tập", "Trò chơi học tập")
#mt-hd[
  qua các hoạt động trải nghiệm bằng hình thức trò chơi.
]
#nd-hd[
  (Dạng câu hỏi trắc nghiệm nhanh hoặc điền khuyết về công thức, quy
  trình, yếu tố của đường conic, hoặc các phép tính đo đạc).
  - #emph[Ví dụ:] \"Trong phép tính chiều cao cột cờ
    ($h = d dot.op t a n alpha + k$), $d$ là gì?\"
  - #emph[Tích hợp NL số:] Giáo viên sử dụng công cụ tạo trò chơi tương
    tác như #strong[Kahoot!] hoặc #strong[Quizizz] để tổ chức trò chơi.
    (Biểu hiện NL số: NL số 1 - Sử dụng công cụ công nghệ số cơ bản).
]
#sp-hd[
  sinh/nhóm.
]
#tc-hd[
  chơi), học sinh trả lời thông qua điện thoại/máy tính bảng. Giáo viên
  tổng hợp kết quả, công bố đội thắng cuộc và nhận xét.

]
#hd("4", "Vận dụng", "Nhiệm vụ về nhà")
#mt-hd[
  kĩ năng vào giải quyết các vấn đề thực tiễn ngoài phạm vi bài học.
]
#nd-hd[
  dụng phương pháp đo đạc đã học (sử dụng giác kế tự chế hoặc ứng dụng
  trên điện thoại) để #strong[xác định chiều rộng của một con sông/cái
  ao] hoặc #strong[chiều cao của một cây xanh] gần nhà bạn.\"
]
#sp-hd[
  bày:
  #block[
  #set enum(numbering: "a.", start: 1)
  + Tên đối tượng đo đạc.
  + Sơ đồ/hình vẽ mô tả quá trình đo đạc.
  + Các số liệu đo được.
  + Công thức tính toán và kết quả cuối cùng.
  ]

  - #emph[Tích hợp NL số:] Khuyến khích học sinh chụp ảnh quá trình đo
    đạc và sử dụng phần mềm soạn thảo văn bản để trình bày báo cáo
    (Word/PowerPoint/Google Docs). (Biểu hiện NL số: NL số 4 - Sáng tạo
    nội dung số).
]
#tc-hd[
  tại nhà và nộp báo cáo vào tiết học tiếp theo để trao đổi, chia sẻ và
  đánh giá.

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
