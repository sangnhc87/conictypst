// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "HĐTHTN 4 Ước tính số cá thể trong quần thể",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nắm được #strong[mục đích, ý nghĩa] của việc ước tính số lượng cá thể
  trong một quần thể sinh vật.
- Trình bày được #strong[phương pháp đánh dấu và tái bắt
  (Capture-Recapture)] để ước tính số lượng cá thể trong quần thể.
- Vận dụng được #strong[công thức] để tính toán ước lượng số lượng cá
  thể ($N$) dựa trên số liệu thu thập được.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực mô hình hóa toán học:] Thiết lập được mô hình toán
    học (công thức tỉ lệ thức) để ước tính số lượng cá thể.
  - #strong[Năng lực giải quyết vấn đề toán học:] Thực hiện các bước
    giải bài toán thực tiễn bằng phương pháp đánh dấu và tái bắt.
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động đọc, tìm hiểu tài liệu
    về phương pháp đánh dấu.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực làm việc nhóm, phân
    công nhiệm vụ, thảo luận, trình bày kết quả.
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
- #strong[Chăm chỉ:] Tích cực tham gia hoạt động thực hành, nhập liệu và
  tính toán cẩn thận, chính xác.
- #strong[Trách nhiệm:] Hoàn thành tốt nhiệm vụ được giao trong nhóm,
  đảm bảo tính trung thực và khách quan khi thu thập dữ liệu và báo cáo
  kết quả.
- #strong[Trung thực:] Thể hiện sự trung thực khi ghi chép số liệu,
  không làm tròn hay thay đổi kết quả tùy tiện.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính/laptop, điện thoại
  thông minh (có kết nối Internet), phiếu học tập in sẵn, giấy A0, bút
  dạ.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 (Kết nối tri thức với cuộc sống), tài liệu
    tham khảo về phương pháp đánh dấu và tái bắt (Capture-Recapture).
  - Một thùng/hộp lớn (đại diện cho quần thể), một số lượng lớn các vật
    liệu nhỏ (ví dụ: hạt đậu, bi ve, kẹp giấy) đại diện cho các cá thể.
  - Bút đánh dấu/màu (để đánh dấu \"cá thể\" bị bắt lần đầu).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "5 phút")
#mt-hd[
  tiễn cần giải quyết: #strong[Làm thế nào để đếm số lượng cá thể trong
  một quần thể lớn mà không cần đếm từng con?]
]
#nd-hd[
  - GV đưa ra một chiếc hộp kín đựng một lượng lớn các vật thể nhỏ (ví
    dụ: hạt đậu).
  - #strong[Nhiệm vụ:] HS quan sát và thảo luận cặp đôi/nhóm nhỏ để
    #strong[ước lượng] tổng số lượng vật thể trong hộp (quần thể).
  - GV đặt câu hỏi: \"Làm thế nào để ước lượng số lượng này một cách
    khoa học và chính xác hơn mà không cần đổ ra đếm hết?\"
]
#sp-hd[
  - Các con số ước lượng ban đầu của các nhóm.
  - HS trình bày được ý tưởng về #strong[nhu cầu] cần một phương pháp
    ước lượng đáng tin cậy.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV trình bày hộp đồ vật, yêu
    cầu HS thảo luận và đưa ra con số ước lượng.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS thảo luận, ghi ra con số.
  - #strong[Bước 3: Báo cáo, thảo luận:] Một vài nhóm báo cáo con số và
    cách họ ước lượng.
  - #strong[Bước 4: Kết luận, nhận định:] GV dẫn dắt, nhận xét về sự
    khác biệt giữa các ước lượng và kết luận: Cần một phương pháp toán
    học để ước tính khoa học hơn $arrow.r$ Giới thiệu bài học: Phương
    pháp đánh dấu và tái bắt.
  - #emph[Tích hợp năng lực số (Nếu có):] Không

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "15 phút")
#mt-hd[
  - HS tìm hiểu, nắm vững và trình bày được #strong[Phương pháp đánh dấu
    và tái bắt].
  - HS thiết lập được #strong[Mô hình toán học] (công thức ước tính).
]
#nd-hd[
  (Làm việc nhóm).
  - #strong[Nhiệm vụ 1 (Tự học/Tìm kiếm):] GV giao nhiệm vụ cho HS
    #strong[đọc SGK] (nếu có) hoặc #strong[tìm kiếm nhanh] trên điện
    thoại/máy tính (có kết nối Internet) về #strong[\"Phương pháp đánh
    dấu và tái bắt\"] (Capture-Recapture) và #strong[công thức ước
    lượng] số lượng quần thể $N$.
  - #strong[Nhiệm vụ 2 (Thảo luận/Mô hình hóa):] Dựa trên kết quả tìm
    kiếm, nhóm thảo luận để #strong[thiết lập công thức] dưới dạng tỉ lệ
    thức, giải thích ý nghĩa của các biến số: $N$ (tổng quần thể), $M$
    (số cá thể đánh dấu lần 1), $n$ (số cá thể bắt lần 2), $m$ (số cá
    thể được đánh dấu trong lần bắt 2).
  - #strong[Công thức cần thiết lập:]
    $M / N approx m / n arrow.r.double N approx frac(M dot.op n, m)$
]
#sp-hd[
  - Các nhóm trình bày #strong[quy trình] của phương pháp đánh dấu (2
    lần bắt).
  - #strong[Công thức ước lượng] $N approx frac(M dot.op n, m)$ được
    viết ra giấy A0 hoặc trên file trình chiếu.
  - Giải thích ý nghĩa của các đại lượng trong công thức.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ học tập:] GV yêu cầu HS tìm kiếm và
    thiết lập công thức, ghi ra giấy A0 trong 10 phút.
  - #strong[Bước 2: Thực hiện nhiệm vụ:]
    - HS làm việc nhóm (4-5 người).
    - GV theo dõi, hỗ trợ các nhóm gặp khó khăn trong việc tìm kiếm công
      thức hoặc giải thích tỉ lệ. (Dự kiến khó khăn: HS nhầm lẫn các
      biến số; Biện pháp hỗ trợ: GV gợi ý về mối quan hệ #strong[tỉ lệ
      mẫu] và #strong[tỉ lệ tổng thể]).
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 1-2 nhóm trình bày (có
    thể bằng cách chụp ảnh sản phẩm giấy A0 và chiếu lên màn hình). Các
    nhóm khác nhận xét.
  - #strong[Bước 4: Kết luận, nhận định:] GV chuẩn hóa công thức
    $N approx frac(M dot.op n, m)$, làm rõ điều kiện áp dụng và ý nghĩa
    thống kê của việc ước lượng.
  - #emph[Tích hợp năng lực số:]
    - HS sử dụng #strong[công cụ tìm kiếm] trên Internet để tìm hiểu về
      phương pháp và công thức. (Năng lực: #strong[Tìm kiếm và chọn lọc
      thông tin số])
    - HS có thể gõ công thức ra máy tính để trình bày (nếu sử dụng trình
      chiếu). (Năng lực: #strong[Tạo và trình bày sản phẩm số])

]
#hd("3", "Luyện tập", "15 phút")
#mt-hd[
  tính số lượng \"cá thể\" trong hộp đồ vật (Hoạt động thực hành trải
  nghiệm).
]
#nd-hd[
  - GV chuẩn bị các hộp đồ vật (quần thể) cho mỗi nhóm.
  - #strong[Nhiệm vụ 1 (Đánh dấu):] Nhóm tiến hành bắt lần 1 (ngẫu
    nhiên), đếm số lượng $M$ (ví dụ: 20 cá thể), đánh dấu (bằng bút màu)
    và thả lại vào hộp.
  - #strong[Nhiệm vụ 2 (Tái bắt):] Sau khi trộn đều, nhóm tiến hành bắt
    lần 2 (ngẫu nhiên), đếm số lượng $n$ (ví dụ: 30 cá thể), và đếm số
    lượng $m$ (số cá thể đã được đánh dấu trong lần bắt 2).
  - #strong[Nhiệm vụ 3 (Tính toán):] Sử dụng phần mềm bảng tính (Google
    Sheets/Excel) để #strong[nhập liệu] $\(M\,n\,m\)$ và #strong[tính
    toán] kết quả $N$.
]
#sp-hd[
  - Bảng số liệu thu thập được của mỗi nhóm: $M\,n\,m$.
  - Kết quả tính toán $N$ từ phần mềm bảng tính.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV hướng dẫn cụ thể các bước thực
    hành trên \"quần thể\" đồ vật và yêu cầu nhóm sử dụng máy tính/điện
    thoại để nhập công thức tính.
  - #strong[Bước 2: Thực hiện nhiệm vụ:]
    - HS thực hiện theo quy trình: bắt 1 $arrow.r$ đánh dấu $arrow.r$
      thả $arrow.r$ trộn $arrow.r$ bắt 2 $arrow.r$ thống kê.
    - HS sử dụng hàm tính toán cơ bản (nhân, chia) trong phần mềm bảng
      tính.
    - GV quan sát, hỗ trợ kỹ thuật sử dụng công cụ số.
  - #strong[Bước 3: Báo cáo, thảo luận:]
    - Các nhóm chia sẻ kết quả $N$ ước tính được và so sánh với ước
      lượng ban đầu (Hoạt động 1).
    - Các nhóm thảo luận về sự khác biệt giữa kết quả ước tính và kết
      quả thực tế (nếu có thời gian đếm thực tế hoặc GV tiết lộ số lượng
      thực tế), phân tích các yếu tố ảnh hưởng.
  - #strong[Bước 4: Kết luận, nhận định:] GV nhận xét về quy trình thực
    hành, độ chính xác của phương pháp và kết quả tính toán.
  - #emph[Tích hợp năng lực số:]
    - HS sử dụng phần mềm bảng tính để nhập liệu và thực hiện tính toán
      $N approx frac(M dot.op n, m)$. (Năng lực: #strong[Xử lí thông tin
      số])

]
#hd("4", "Vận dụng", "10 phút")
#mt-hd[
  tính toán và tổng hợp thông tin vào thực tiễn, củng cố kỹ năng trình
  bày.
]
#nd-hd[
  bày\"].
  - #strong[Nhiệm vụ:] Nhóm #strong[tổng hợp] kiến thức (Mục đích, Quy
    trình 4 bước, Công thức) thành một #strong[Sơ đồ tư duy] (có thể sử
    dụng sơ đồ tư duy trực tuyến hoặc giấy A0) và chuẩn bị
    #strong[thuyết trình] nhanh (2 phút/nhóm) về kết quả thực hành và
    ứng dụng thực tiễn của phương pháp.
  - #strong[Mở rộng:] Đề xuất một tình huống thực tiễn khác (ví dụ: ước
    tính số chim trong khu bảo tồn, số xe đạp bị mất cắp trong thành
    phố) có thể áp dụng phương pháp này.
// ]
#sp-hd[
  - Sơ đồ tư duy về #strong[Phương pháp đánh dấu và tái bắt]. \* Báo cáo
    trình bày/thuyết trình nhanh của các nhóm.
]
#tc-hd[
  - #strong[Bước 1: Giao nhiệm vụ:] GV yêu cầu HS hoàn thành sơ đồ tư
    duy và chuẩn bị báo cáo thuyết trình.
  - #strong[Bước 2: Thực hiện nhiệm vụ:] HS làm việc nhóm để tổng hợp và
    thiết kế sơ đồ (3 phút).
  - #strong[Bước 3: Báo cáo, thảo luận:] GV mời 2-3 nhóm #strong[thuyết
    trình] sơ đồ tư duy và kết quả của nhóm mình. Các nhóm khác đặt câu
    hỏi phản biện. (Đánh giá bằng nhận xét).
  - #strong[Bước 4: Kết luận, nhận định:]
    - GV tổng kết, khen ngợi tinh thần làm việc nhóm và kỹ năng trình
      bày, đặc biệt là khả năng mô hình hóa và xử lý số liệu.
    - Giao nhiệm vụ về nhà: Tìm kiếm ví dụ thực tế khác về ứng dụng
      phương pháp đánh dấu trong sinh học, xã hội học (ví dụ: ước tính
      số người mắc bệnh).
  - #emph[Tích hợp năng lực số:]
    - HS sử dụng #strong[phần mềm sơ đồ tư duy] hoặc #strong[phần mềm
      trình chiếu] để tạo sản phẩm báo cáo. (Năng lực: #strong[Tạo và
      trình bày sản phẩm số])
    - GV có thể dùng công cụ số để ghi nhận nhanh các nhận xét/đánh giá
      (ví dụ: Google Form/Quizizz).

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
