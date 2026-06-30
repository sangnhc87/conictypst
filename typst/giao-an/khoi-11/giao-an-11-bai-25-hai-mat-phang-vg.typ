// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 25 Hai mặt phẳng VG",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nắm vững định nghĩa #strong[góc giữa hai mặt phẳng], #strong[hai mặt
  phẳng vuông góc].
- Nêu được #strong[điều kiện để hai mặt phẳng vuông góc].
- Trình bày được các #strong[tính chất cơ bản của hai mặt phẳng vuông
  góc].
- Hiểu và mô tả được khái niệm #strong[góc nhị diện].
- Nhận dạng, phân biệt và nêu được tính chất của #strong[một số hình
  lăng trụ đặc biệt] (Hình lăng trụ đứng, Hình lăng trụ đều, Hình hộp
  đứng, Hình hộp chữ nhật, Hình lập phương) và #strong[Hình chóp đều,
  hình chóp cụt đều].

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù môn Toán:]
  - #strong[Năng lực tư duy và lập luận Toán học:] Hình thành các giả
    thuyết, chứng minh được tính vuông góc của hai mặt phẳng dựa trên
    điều kiện và tính chất.
  - #strong[Năng lực mô hình hóa Toán học:] Vận dụng kiến thức về hai
    mặt phẳng vuông góc để mô tả và giải quyết các vấn đề thực tiễn liên
    quan đến hình học không gian (ví dụ: mô hình hóa mái nhà, bức
    tường,...)
  - #strong[Năng lực giải quyết vấn đề Toán học:] Giải các bài toán tính
    góc, chứng minh quan hệ vuông góc giữa các yếu tố trong không gian.
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu kiến thức qua
    tài liệu, tự đánh giá được kết quả học tập.
  - #strong[Năng lực giao tiếp và hợp tác:] Tham gia thảo luận nhóm,
    trình bày ý kiến, lập sơ đồ tư duy (khuyến khích sử dụng công cụ số)
    về mối quan hệ giữa các khái niệm.
- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
  - 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
    cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực trong hoạt động nhóm, chủ động hoàn thành
  nhiệm vụ học tập được giao.
- #strong[Trung thực:] Thẳng thắn nhìn nhận và sửa chữa sai sót trong
  quá trình giải bài tập, thực hiện các báo cáo thực hành (nếu có).
- #strong[Trách nhiệm:] Có trách nhiệm với nhiệm vụ được giao, đóng góp
  xây dựng bài học chung của nhóm và lớp.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính/laptop, các mô hình
  hình học không gian (lăng trụ, hình chóp) hoặc các vật dụng thực tế có
  mặt phẳng vuông góc (hộp, sách, góc tường,...)
- #strong[Học liệu:]
  - Sách giáo khoa Toán 11 - Kết nối tri thức với cuộc sống.
  - Phiếu học tập nhóm/cá nhân, bút lông, giấy A0/A4.
  - #strong[Công cụ số:] Phần mềm vẽ hình không gian
    (GeoGebra/SketchUp), công cụ làm sơ đồ tư duy trực tuyến
    (MindMeister/Canva), nền tảng trình chiếu (Google
    Slides/PowerPoint).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "15 phút")
==== a) Mục tiêu
Giúp học sinh #strong[kích thích sự tò mò], #strong[xác định được vấn đề
thực tiễn] liên quan đến khái niệm hai mặt phẳng vuông góc, từ đó
#strong[nhận diện nhiệm vụ học tập] của bài.

==== b) Nội dung
- #strong[Nhiệm vụ:] Giáo viên trình chiếu #strong[hình ảnh thực tế] về
  một công trình kiến trúc (ví dụ: góc nhà, mái nhà, lều cắm trại,...)
  và đặt câu hỏi gợi mở:
  - #strong[Câu hỏi 1:] Trong hình ảnh, các mặt phẳng nào (tường nhà,
    nền nhà, mái nhà) có quan hệ vuông góc với nhau?
  - #strong[Câu hỏi 2:] Làm thế nào để xác định được góc giữa mặt phẳng
    mái nhà và mặt phẳng tường nhà?
- #strong[Phương pháp tích cực:] Dạy học nêu vấn đề.
- #strong[Tích hợp năng lực số (nếu có):] Học sinh sử dụng điện
  thoại/máy tính bảng để #strong[tìm kiếm nhanh hình ảnh] các công trình
  có \"góc vuông\" trong không gian (Biểu hiện: Khai thác, tìm kiếm
  thông tin).

==== c) Sản phẩm
- Kết quả thảo luận nhanh của học sinh về các cặp mặt phẳng vuông góc
  trong hình ảnh.
- Học sinh #strong[phát biểu được vấn đề] cần giải quyết: Cần tìm hiểu
  về #strong[góc giữa hai mặt phẳng] và #strong[điều kiện để hai mặt
  phẳng vuông góc].

==== d) Tổ chức thực hiện
- #strong[Bước 1: Chuyển giao nhiệm vụ:] Giáo viên trình chiếu hình ảnh,
  đặt câu hỏi (5 phút).
- #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh #strong[thảo luận cặp
  đôi/nhóm nhỏ] (khoảng 3 phút).
- #strong[Bước 3: Báo cáo, thảo luận:] Mời 1-2 đại diện nhóm trình bày ý
  kiến. Giáo viên ghi nhận và dẫn dắt (5 phút).
- #strong[Bước 4: Kết luận, nhận định:] Giáo viên #strong[chính xác hóa
  vấn đề] và giới thiệu bài học.

#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "110 phút")
==== 2.1. Góc giữa hai mặt phẳng - Hai mặt phẳng vuông góc (20 phút)
- #strong[Mục tiêu:] Nắm được định nghĩa và cách xác định #strong[góc
  giữa hai mặt phẳng]. Phát biểu được định nghĩa #strong[hai mặt phẳng
  vuông góc].
- #strong[Nội dung:]
  - #strong[Nhiệm vụ:] Học sinh nghiên cứu SGK, kết hợp với mô hình thực
    tế (ví dụ: hai cuốn vở mở ra) để đề xuất cách xác định góc giữa hai
    mặt phẳng.
  - #strong[Ví dụ đề xuất:] Cho hình lập phương $A B C D . A' B' C' D'$.
    Hãy xác định góc giữa mặt phẳng $\(A B C D\)$ và mặt phẳng
    $\(B C C' B'\)$. (Gợi ý: góc $90^compose$).
- #strong[Sản phẩm:] Học sinh trình bày được định nghĩa bằng lời và công
  thức xác định góc.

==== 2.2. Điều kiện hai mặt phẳng vuông góc (20 phút)
- #strong[Mục tiêu:] Phát biểu được #strong[điều kiện cần và đủ] để hai
  mặt phẳng vuông góc.
- #strong[Nội dung:]
  - #strong[Nhiệm vụ:] Học sinh thảo luận nhóm để chứng minh/khám phá
    mệnh đề: \"Nếu một mặt phẳng chứa một đường thẳng vuông góc với mặt
    phẳng kia thì hai mặt phẳng đó vuông góc với nhau.\"
  - #strong[Ví dụ đề xuất:] Cho hình chóp $S . A B C D$ có đáy $A B C D$
    là hình vuông và $S A perp\(A B C D\)$. Chứng minh rằng mặt phẳng
    $\(S A D\)$ vuông góc với mặt phẳng $\(A B C D\)$.
- #strong[Sản phẩm:] Ghi nhận được điều kiện vuông góc:
  $alpha perp beta arrow.l.r.double$ tồn tại $a subset alpha$ sao cho
  $a perp beta$.

==== 2.3. Tính chất hai mặt phẳng vuông góc (20 phút)
- #strong[Mục tiêu:] Nắm được các #strong[tính chất cơ bản] liên quan
  đến hai mặt phẳng vuông góc.
- #strong[Nội dung:]
  - #strong[Nhiệm vụ:] Học sinh làm việc với mô hình hoặc phần mềm vẽ
    hình (GeoGebra - #strong[Tích hợp năng lực số: Sử dụng công cụ số để
    mô phỏng hình học]). Đề xuất và chứng minh các tính chất:
    - Nếu hai mặt phẳng cùng vuông góc với một mặt phẳng thứ ba thì giao
      tuyến của chúng (nếu có) vuông góc với mặt phẳng thứ ba đó.
    - Nếu hai mặt phẳng vuông góc với nhau, một đường thẳng nằm trong
      mặt phẳng này và vuông góc với giao tuyến thì đường thẳng đó vuông
      góc với mặt phẳng kia.
  - #strong[Ví dụ đề xuất:] Cho hai mặt phẳng $\(P\)$ và $\(Q\)$ cùng
    vuông góc với mặt phẳng $\(R\)$ và $\(P\)inter\(Q\)= d$. Chứng minh
    $d perp\(R\)$.
- #strong[Sản phẩm:] Học sinh tổng hợp các tính chất và ghi chép vào vở.

==== 2.4. Góc nhị diện (15 phút)
- #strong[Mục tiêu:] Hiểu và xác định được #strong[góc nhị diện].
- #strong[Nội dung:]
  - #strong[Nhiệm vụ:] Giáo viên giới thiệu góc nhị diện qua hình ảnh
    cánh cửa, góc sách. Học sinh phân biệt góc giữa hai mặt phẳng và góc
    nhị diện.
  - #strong[Ví dụ đề xuất:] Xác định góc nhị diện $\[P\,a\,Q\]$ trong
    không gian.
- #strong[Sản phẩm:] Nắm được: số đo góc nhị diện là số đo góc phẳng nhị
  diện.

==== 2.5. Một số hình lăng trụ đặc biệt (15 phút)
- #strong[Mục tiêu:] Nhận dạng và nêu được đặc điểm của #strong[Hình
  lăng trụ đứng, Hình lăng trụ đều, Hình hộp đứng, Hình hộp chữ nhật,
  Hình lập phương].
- #strong[Nội dung:]
  - #strong[Nhiệm vụ:] Học sinh #strong[sử dụng công cụ tìm kiếm số]
    (internet) để tìm hình ảnh/mô hình 3D của các hình lăng trụ đặc biệt
    và trình bày ngắn gọn đặc điểm nhận dạng. (Biểu hiện: Khai thác, tìm
    kiếm thông tin)
  - #strong[Ví dụ đề xuất:] So sánh đặc điểm của hình lăng trụ đứng và
    hình hộp chữ nhật.
- #strong[Sản phẩm:] Sơ đồ tóm tắt đặc điểm các hình.

==== 2.6. Hình chóp đều và hình chóp cụt đều (20 phút)
- #strong[Mục tiêu:] Nhận dạng và nêu được đặc điểm của #strong[Hình
  chóp đều và hình chóp cụt đều].
- #strong[Nội dung:]
  - #strong[Nhiệm vụ:] Học sinh #strong[thảo luận nhóm] về các yếu tố
    tạo nên hình chóp đều (đáy là đa giác đều, chân đường cao trùng tâm
    đáy) và hình chóp cụt đều (cắt hình chóp đều bởi mặt phẳng song song
    với đáy).
  - #strong[Ví dụ đề xuất:] Cho hình chóp tứ giác đều $S . A B C D$ có
    $O$ là tâm đáy. Chứng minh rằng $\(S A C\)perp\(S B D\)$. (Sử dụng
    kiến thức đã học).
- #strong[Sản phẩm:] Kết quả thảo luận và minh họa hình vẽ.

==== d) Tổ chức thực hiện (Hoạt động 2)
- #strong[Bước 1: Chuyển giao nhiệm vụ:] Giáo viên chia lớp thành các
  nhóm nhỏ (4-5 HS) và giao luân phiên các nhiệm vụ (2.1 - 2.6) cho các
  nhóm.
- #strong[Bước 2: Thực hiện nhiệm vụ:] Các nhóm #strong[đọc SGK, nghiên
  cứu, thảo luận và làm ví dụ] (có thể sử dụng GeoGebra để minh họa).
  Giáo viên #strong[quan sát, hỗ trợ] các nhóm gặp khó khăn.
- #strong[Bước 3: Báo cáo, thảo luận:] Từng nhóm cử đại diện
  #strong[thuyết trình] về nội dung được giao (khuyến khích sử dụng công
  cụ trình chiếu số). Các nhóm khác đặt câu hỏi và phản biện.
- #strong[Bước 4: Kết luận, nhận định:] Giáo viên #strong[chính xác hóa
  kiến thức, làm rõ các khái niệm] và chuyển sang hoạt động tiếp theo.

#hd("3", "Luyện tập", "40 phút")
==== a) Mục tiêu
Vận dụng kiến thức đã học vào #strong[giải quyết các bài tập cơ bản] và
#strong[phát triển kĩ năng tính toán, chứng minh].

==== b) Nội dung
- #strong[Nhiệm vụ:] Học sinh giải một hệ thống bài tập, câu hỏi trắc
  nghiệm và tự luận (Phân loại từ nhận biết đến vận dụng thấp) liên quan
  đến:
  - Tính góc giữa hai mặt phẳng.
  - Chứng minh hai mặt phẳng vuông góc.
  - Nhận dạng hình lăng trụ/hình chóp đặc biệt.
- #strong[Ví dụ cụ thể:]
  - Bài 1 (Trắc nghiệm): Cho hình lập phương $A B C D . A' B' C' D'$.
    Mặt phẳng $\(A A' B' B\)$ vuông góc với mặt phẳng nào sau đây? (Đáp
    án: $\(A B C D\)$, $\(A' B' C' D'\)$, $\(A D D' A'\)$,...).
  - Bài 2 (Tự luận): Cho hình chóp $S . A B C$ có đáy $A B C$ là tam
    giác vuông tại $B$, $S A perp\(A B C\)$. Chứng minh
    $\(S B C\)perp\(S A B\)$.
- #strong[Phương pháp tích cực:] #strong[Trò chơi học tập] (ví dụ: Đuổi
  hình bắt chữ Toán học, giải nhanh trắc nghiệm trên nền tảng số như
  Quizizz/Kahoot - #strong[Tích hợp năng lực số: Tương tác và đánh giá
  kết quả học tập qua công cụ số]).

==== c) Sản phẩm
- Đáp án, lời giải chi tiết cho các câu hỏi, bài tập.
- Báo cáo kết quả hoạt động nhóm/kết quả làm bài trên nền tảng số.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Chuyển giao nhiệm vụ:] Giáo viên chia bài tập và hướng
  dẫn học sinh làm bài cá nhân và thảo luận nhóm (20 phút).
- #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thực hiện bài tập. Giáo
  viên #strong[quan sát, giải đáp nhanh] thắc mắc.
- #strong[Bước 3: Báo cáo, thảo luận:] Tổ chức #strong[trò chơi học tập]
  để chữa bài nhanh. Học sinh trình bày (hoặc chiếu) lời giải các bài
  tập tự luận khó.
- #strong[Bước 4: Kết luận, nhận định:] Giáo viên #strong[chốt lại các
  lỗi sai phổ biến], #strong[tổng kết kiến thức] thông qua hệ thống sơ
  đồ tư duy (do giáo viên hoặc nhóm học sinh trình bày - #strong[Tích
  hợp năng lực số: Xử lí, tổng hợp thông tin]).

#hd("4", "Vận dụng", "15 phút")
==== a) Mục tiêu
Phát triển năng lực của học sinh thông qua #strong[vận dụng kiến thức
vào thực tiễn] và #strong[tìm tòi, mở rộng].

==== b) Nội dung
- #strong[Nhiệm vụ:]
  - #strong[Bài tập thực tiễn (Giao về nhà):] Hãy tìm kiếm và chụp ảnh
    một vật thể/công trình kiến trúc trong đời sống có chứa các cặp mặt
    phẳng vuông góc (hoặc có góc giữa hai mặt phẳng không vuông) và giải
    thích cách xác định/chứng minh tính vuông góc của chúng.
  - #strong[Yêu cầu tích hợp:] Học sinh sử dụng phần mềm #strong[chỉnh
    sửa ảnh] (ví dụ: vẽ thêm đường, góc) để minh họa trên ảnh chụp và
    #strong[viết báo cáo ngắn] (dạng file word hoặc trình chiếu). (Biểu
    hiện: Xử lí thông tin, giao tiếp, hợp tác bằng công cụ số).
- #strong[Ví dụ cụ thể:] Thiết kế một bản vẽ 3D (trên phần mềm miễn phí)
  về mô hình mái nhà (hình lăng trụ, chóp) và chỉ ra các cặp mặt phẳng
  vuông góc.

==== c) Sản phẩm
- Báo cáo (dạng văn bản hoặc trình chiếu) về tình huống/vấn đề thực
  tiễn.
- Hình ảnh minh họa có giải thích.

==== d) Tổ chức thực hiện
- #strong[Bước 1: Chuyển giao nhiệm vụ:] Giáo viên giao nhiệm vụ cụ thể
  và các tiêu chí đánh giá (có thể cho điểm miệng vào tiết học sau).
- #strong[Bước 2: Thực hiện nhiệm vụ:] Học sinh thực hiện nhiệm vụ
  #strong[ngoài giờ học trên lớp].
- #strong[Bước 3: Báo cáo, thảo luận:] Nộp báo cáo. Giáo viên chọn một
  vài báo cáo tốt nhất để #strong[trình chiếu và khen ngợi] trong tiết
  học tiếp theo.

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

