// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 4 H BPT bậc nhất hai ẩn",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
=== Về kiến thức
- Nhận biết được #strong[hệ bất phương trình bậc nhất hai ẩn] và giải
  thích được thế nào là nghiệm của hệ bất phương trình bậc nhất hai ẩn.
- Xác định được miền nghiệm của hệ bất phương trình bậc nhất hai ẩn trên
  mặt phẳng tọa độ.
- Vận dụng được kiến thức về hệ bất phương trình bậc nhất hai ẩn vào
  giải quyết các bài toán thực tiễn đơn giản.

=== Về năng lực
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động, tích cực tìm hiểu,
    nghiên cứu tài liệu và hoàn thành nhiệm vụ học tập được giao.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực thảo luận, chia sẻ,
    hợp tác nhóm để thực hiện nhiệm vụ, trình bày ý tưởng/báo cáo sản
    phẩm học tập.
  - #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp
    thông tin để giải quyết các vấn đề liên quan đến hệ bất phương trình
    bậc nhất hai ẩn.
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận toán học:] Phát hiện và lập luận
    được quy trình tìm miền nghiệm của hệ bất phương trình.
  - #strong[Năng lực mô hình hoá toán học:] Thiết lập được hệ bất phương
    trình bậc nhất hai ẩn từ một bài toán thực tiễn.
  - #strong[Năng lực sử dụng công cụ, phương tiện toán học:] Sử dụng
    được dụng cụ học tập (thước, bút màu) và phần mềm hỗ trợ (ví dụ:
    GeoGebra, máy tính cầm tay) để biểu diễn miền nghiệm.
- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - #strong[Giải quyết vấn đề và sáng tạo trong môi trường số:] Tích
    hợp, tổng hợp thông tin, kiến thức từ các nguồn số để hoàn thành báo
    cáo, sơ đồ tư duy.
  - #strong[Tích hợp Năng lực số:] #strong[Sử dụng và quản lí các công
    cụ và thiết bị số & Giải quyết vấn đề và sáng tạo trong môi trường
    số:] HS sử dụng phần mềm (GeoGebra/Desmos) để biểu diễn miền nghiệm
    chính xác, hoặc sử dụng Word/PowerPoint để trình bày báo cáo một
    cách khoa học, tăng tính thuyết phục.

=== Về phẩm chất
- #strong[Phẩm chất chăm chỉ:] Tích cực tham gia các hoạt động học tập;
  hoàn thành nhiệm vụ được giao (cá nhân và nhóm) một cách cẩn thận,
  chính xác.
- #strong[Phẩm chất trách nhiệm:] Có trách nhiệm với bản thân, nhóm và
  cộng đồng; nghiêm túc trong việc học và thực hiện nhiệm vụ, tôn trọng
  ý kiến thành viên nhóm.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy chiếu, máy tính, tài liệu tham khảo, phiếu học
  tập, #strong[GeoGebra/Desmos] để minh họa miền nghiệm, đáp án chi
  tiết.
- #strong[Học sinh:] Sách giáo khoa, vở ghi, giấy A0/giấy note lớn, bút
  màu, thước kẻ, máy tính cầm tay.

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
- #strong[Tên hoạt động:] #strong[Bài toán tối ưu hóa nguồn lực]

#mt-hd[
  giải quyết bằng công cụ toán học (lập hệ bất phương trình bậc nhất hai
  ẩn).

]
#nd-hd[
  toán thực tiễn mở đầu\"]:

- #quote(block: true)[
  \"Một cơ sở sản xuất đồ thủ công mỹ nghệ dự định sản xuất hai loại sản
  phẩm $X$ và $Y$ để bán dịp Tết. Mỗi sản phẩm $X$ cần 2 giờ làm việc và
  3kg nguyên liệu. Mỗi sản phẩm $Y$ cần 3 giờ làm việc và 1kg nguyên
  liệu. Cơ sở chỉ có #strong[150 giờ làm việc] và #strong[90kg nguyên
  liệu]. Gọi $x$ là số sản phẩm $X$ và $y$ là số sản phẩm $Y$ được sản
  xuất. Hãy biểu diễn các điều kiện về thời gian và nguyên liệu qua các
  bất phương trình.\"
  ]

// ]
#sp-hd[

  - Các bất phương trình (điều kiện ràng buộc) học sinh lập được:
    - Về thời gian: $2 x + 3 y lt.eq 150$
    - Về nguyên liệu: $3 x + y lt.eq 90$
    - Điều kiện tự nhiên: $x gt.eq 0\;y gt.eq 0$
  - Mô tả được nhiệm vụ cần giải quyết trong bài học: #strong[Tìm hiểu
    cách giải một hệ gồm nhiều bất phương trình bậc nhất hai ẩn.]

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ học tập (GV giao):] GV trình bày bài
    toán (trên phiếu hoặc slide) và yêu cầu HS làm việc cá nhân (3 phút)
    để chuyển các điều kiện thành bất phương trình.

  - #strong[Bước 2: Thực hiện nhiệm vụ (HS thực hiện; GV theo dõi, hỗ
    trợ):] HS tự lập các bất phương trình. GV quan sát, gợi ý: \"Sản
    xuất thì số lượng có thể là số âm không?\", để HS bổ sung điều kiện
    $x gt.eq 0\,y gt.eq 0$.

  - #strong[Bước 3: Báo cáo, thảo luận (GV tổ chức; HS báo cáo):] Mời
    1-2 HS trình bày kết quả. HS khác nhận xét, bổ sung.

  - #strong[Bước 4: Kết luận, nhận định (GV kết luận):] GV tổng hợp 4
    bất phương trình thành một #strong[Hệ bất phương trình bậc nhất hai
    ẩn] và dẫn dắt: \"Để tìm được số lượng sản phẩm tối ưu, ta cần tìm
    hiểu về hệ bất phương trình này.\"

  - #strong[Tích hợp Năng lực số:] #strong[Không] (Hoạt động này chủ yếu
    là tư duy lập luận cá nhân).

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "80 phút - Chia thành 3 Hoạt động thành phần")
==== 2.1. Hoạt động 2.1: Hệ bất phương trình bậc nhất hai ẩn (15 phút)
#mt-hd[
  hệ bất phương trình bậc nhất hai ẩn.
]
#nd-hd[
  lời các câu hỏi:
  - Thế nào là #strong[Hệ bất phương trình bậc nhất hai ẩn]?
  - Cặp số $\(x_0\;y_0\)$ được gọi là nghiệm của hệ khi nào?
]
#sp-hd[
  trình bậc nhất hai ẩn] và #strong[Nghiệm của hệ].
// ]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV yêu cầu nhóm đọc SGK và lấy ví dụ
    về một hệ BPT bậc nhất hai ẩn, và kiểm tra xem cặp số $\(1\;1\)$ có
    là nghiệm của hệ đó hay không.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận nhóm, ghi kết quả
    ra nháp.
  - #strong[Bước 3: Báo cáo, thảo luận:] Đại diện 1 nhóm trình bày. Các
    nhóm khác phản biện, bổ sung.
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa kiến thức, làm rõ
    #strong[nghiệm của hệ] là nghiệm chung của #strong[tất cả] các bất
    phương trình trong hệ.

==== 2.2. Hoạt động 2.2: Biểu diễn miền nghiệm của hệ bất phương trình bậc nhất hai ẩn trên mặt phẳng toạ độ (45 phút)
]
#mt-hd[
  nghiệm) của một hệ BPT bậc nhất hai ẩn.

]
#nd-hd[
  trực quan và số hóa\"] với ví dụ từ Hoạt động 1.

- #quote(block: true)[
  #strong[Ví dụ:] Biểu diễn miền nghiệm của hệ: ${2 x + 3 y lt.eq 150\
  3 x + y lt.eq 90\
  x gt.eq 0\
  y gt.eq 0 med$
  ]

  - Nhóm tự nghiên cứu lại cách xác định miền nghiệm của #strong[một]
    BPT bậc nhất hai ẩn.
  - Thực hiện biểu diễn miền nghiệm của #strong[từng] BPT trên mặt phẳng
    tọa độ (dùng bút màu khác nhau cho mỗi BPT).
  - Xác định #strong[phần giao] của các miền nghiệm này.

// ]
#sp-hd[
  - Hình vẽ mặt phẳng tọa độ có biểu diễn miền nghiệm của hệ. \* Nêu
    được quy tắc chung: #strong[Miền nghiệm của hệ] là #strong[giao] của
    các miền nghiệm của từng bất phương trình.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV chia lớp thành 4 nhóm (Phân công
    nhiệm vụ: Nhóm 1 vẽ BPT 1, Nhóm 2 vẽ BPT 2, Nhóm 3, 4 tổng hợp). Các
    nhóm có thể sử dụng GeoGebra/Desmos để kiểm tra lại miền nghiệm của
    từng BPT.

  - #strong[Bước 2: Thực hiện nhiệm vụ:] Các nhóm làm việc trên giấy A0.
    GV theo dõi, hỗ trợ các nhóm gặp khó khăn trong việc xác định bờ và
    chọn điểm thử.

  - #strong[Bước 3: Báo cáo, thảo luận:] Mời đại diện một nhóm lên trình
    bày cách làm và kết quả. Sau đó, #strong[GV chiếu kết quả đã được vẽ
    bằng phần mềm GeoGebra/Desmos] để đối chiếu.

  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa quy tắc: 1. Vẽ
    các đường thẳng. 2. Xác định miền nghiệm của từng BPT (tô màu/gạch
    chéo phần bỏ đi). 3. Miền không bị tô màu/gạch chéo là miền nghiệm
    chung.

  - #strong[Tích hợp Năng lực số:] #strong[Sử dụng và quản lí các công
    cụ và thiết bị số:] HS sử dụng phần mềm #strong[GeoGebra/Desmos] để
    kiểm tra và minh họa trực quan miền nghiệm của từng bất phương trình
    và của cả hệ.

==== 2.3. Hoạt động 2.3: Ứng dụng của hệ bất phương trình bậc nhất hai ẩn (20 phút)
]
#mt-hd[
  quyết bài toán thực tiễn (Bài toán tối ưu hóa nguồn lực).

]
#nd-hd[
  vào #strong[Bài toán tối ưu hóa nguồn lực] từ Hoạt động 1.

- #quote(block: true)[
  #strong[Bài toán ứng dụng:] \"Xác định xem cơ sở sản xuất có thể sản
  xuất được 20 sản phẩm loại $X$ và 30 sản phẩm loại $Y$ hay không? (Tức
  là kiểm tra cặp $\(20\;30\)$ có thuộc miền nghiệm không).\"
  ]

]
#sp-hd[
  - Kết luận rõ ràng: Cặp $\(20\;30\)$ có thỏa mãn tất cả các BPT trong
    hệ hay không.
  - Khẳng định rằng: Mọi cặp $\(x\;y\)$ nằm trong miền nghiệm đều là một
    phương án sản xuất khả thi.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV yêu cầu HS làm việc cặp đôi, thay
    cặp số $\(20\;30\)$ vào hệ ${2 x + 3 y lt.eq 150\
    3 x + y lt.eq 90\
    x gt.eq 0\
    y gt.eq 0 med$ để kiểm tra tính đúng đắn.

  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS tính toán.

  - #strong[Bước 3: Báo cáo, thảo luận:] 1 cặp đôi trình bày lời giải.

    - $2\(20\)+ 3\(30\)= 40 + 90 = 130 lt.eq 150$ (Đúng)
    - $3\(20\)+ 30 = 60 + 30 = 90 lt.eq 90$ (Đúng)
    - $20 gt.eq 0\;30 gt.eq 0$ (Đúng) $arrow.r.double$ Khả thi.

  - #strong[Bước 4: Kết luận, nhận định:] GV nhấn mạnh tầm quan trọng
    của việc lập mô hình toán học và sử dụng miền nghiệm để tìm ra các
    giải pháp khả thi trong thực tiễn.

  - #strong[Tích hợp Năng lực số:] #strong[Giải quyết vấn đề và sáng tạo
    trong môi trường số:] HS có thể sử dụng công cụ máy tính cầm tay
    hoặc các ứng dụng số để thực hiện việc thay số và tính toán nhanh,
    chính xác.

]
#hd("3", "Luyện tập", "25 phút")
#mt-hd[
  bài tập toán học, rèn luyện kỹ năng vẽ hình và tính toán.

]
#nd-hd[
  hiện theo nhóm 4).

  - GV đưa ra 3 hệ bất phương trình khác nhau, tăng dần độ khó.
  - Mỗi nhóm thực hiện vẽ miền nghiệm của hệ bất phương trình.
  - #emph[Ví dụ Luyện tập:] Tìm miền nghiệm của hệ: ${x - 2 y < 0\
    x + 3 y lt.eq 6\
    y gt.eq 0 med$

]
#sp-hd[

  - Hình vẽ chính xác miền nghiệm của 3 hệ bất phương trình.
  - Đáp án, lời giải của các bài tập.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ:] GV chia lớp thành các nhóm 4 người,
    phát phiếu bài tập (gồm 3 hệ BPT) và quy định thời gian (20 phút).

  - #strong[Bước 2: Thực hiện nhiệm vụ:] Các nhóm phân chia công việc,
    cùng nhau giải quyết và vẽ hình. #strong[Khuyến khích] sử dụng sơ đồ
    tư duy (mindmap) để tóm tắt các bước giải.

  - #strong[Bước 3: Báo cáo, thảo luận:]

    - Sử dụng hình thức #strong[\"Tiếp sức\"]: Đại diện 3 nhóm lên trình
      bày miền nghiệm của 3 bài tập (1 bài/nhóm).
    - Các nhóm khác nhận xét, chấm điểm chéo theo tiêu chí: Chính xác
      đường thẳng bờ? Chính xác miền thử? Chính xác miền nghiệm chung?

  - #strong[Bước 4: Kết luận, nhận định:] GV chốt đáp án, nhận xét quá
    trình làm việc nhóm, nhấn mạnh các lỗi sai thường gặp (như không xác
    định rõ đường thẳng bờ, không xét điều kiện dấu bằng).

]
#hd("4", "Vận dụng", "15 phút - Giao nhiệm vụ về nhà")
#mt-hd[
  dụng kiến thức vào thực tiễn cuộc sống.

]
#nd-hd[
  #strong[ngoài giờ học trên lớp].

- #quote(block: true)[
  #strong[Nhiệm vụ Vận dụng:] \"Bạn đang có 200.000 VNĐ để mua hai loại
  đồ uống $A$ và $B$ cho một buổi sinh hoạt nhóm. Loại $A$ giá 15.000
  VNĐ/chai, loại $B$ giá 20.000 VNĐ/chai. Số lượng loại $A$ không được
  ít hơn loại $B$ và phải mua tối thiểu 5 chai mỗi loại. Hãy lập hệ bất
  phương trình biểu thị các điều kiện mua hàng và vẽ miền nghiệm trên
  mặt phẳng tọa độ để tìm ra tất cả các phương án mua hàng khả thi.\"
  ]

]
#sp-hd[

  - Báo cáo: #strong[Hệ bất phương trình] lập được và #strong[hình vẽ
    miền nghiệm] (có thể vẽ tay hoặc dùng GeoGebra/Desmos).
  - Đề xuất được ít nhất 3 phương án mua hàng cụ thể.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ:] GV giao nhiệm vụ, hướng dẫn HS xác
    định các ẩn ($x\,y$), các điều kiện ràng buộc.

  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS tự thực hiện, nộp báo cáo
    (dạng viết tay hoặc file trình chiếu) vào buổi học tiếp theo.

  - #strong[Bước 3: Báo cáo, thảo luận:] (Thực hiện vào đầu tiết học
    sau) Chọn một số báo cáo có sự sáng tạo (đặc biệt là báo cáo sử dụng
    công cụ số) để trình bày trước lớp.

  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét, đánh giá sản
    phẩm.

  - #strong[Tích hợp Năng lực số:] #strong[Sử dụng và quản lí các công
    cụ và thiết bị số & Giải quyết vấn đề và sáng tạo trong môi trường
    số:] HS sử dụng phần mềm (GeoGebra/Desmos) để biểu diễn miền nghiệm
    chính xác, hoặc sử dụng Word/PowerPoint để trình bày báo cáo một
    cách khoa học, tăng tính thuyết phục.

]
