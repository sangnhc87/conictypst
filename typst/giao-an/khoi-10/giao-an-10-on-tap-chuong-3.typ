// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Ôn tập chương 3",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- #strong[Hệ thức lượng:] Hệ thống hóa các kiến thức về định lí
  #strong[cosin], định lí #strong[sin], công thức tính độ dài đường
  trung tuyến.
- #strong[Giải tam giác:] Vận dụng linh hoạt các định lí cosin, sin để
  #strong[giải tam giác] (tính các cạnh, góc còn lại) trong các trường
  hợp cụ thể.
- #strong[Diện tích tam giác:] Củng cố các công thức tính #strong[diện
  tích tam giác] (theo cạnh và chiều cao, theo hai cạnh và sin góc xen
  giữa, theo bán kính đường tròn ngoại tiếp, công thức Heron).
- #strong[Ứng dụng:] Vận dụng kiến thức để giải quyết một số bài toán
  thực tế.

#muc("2", "NĂNG LỰC")
===== Năng lực chung
- #strong[Năng lực tự chủ và tự học:] Chủ động tìm hiểu, tổng hợp và hệ
  thống hóa kiến thức đã học trong chương; tự đánh giá được mức độ nắm
  vững kiến thức của bản thân.
- #strong[Năng lực giao tiếp và hợp tác:] Tích cực trao đổi, thảo luận,
  đóng góp ý kiến khi thực hiện nhiệm vụ nhóm; chia sẻ được kết quả học
  tập của cá nhân và nhóm.
- #strong[Năng lực giải quyết vấn đề và sáng tạo:] Phân tích, tổng hợp
  thông tin, đề xuất được giải pháp giải quyết các bài toán liên quan
  đến hệ thức lượng trong tam giác.

===== Năng lực đặc thù (Năng lực Toán học)
- #strong[Năng lực tư duy và lập luận Toán học:] Nhận biết, phân tích,
  so sánh các công thức và định lí. Thực hiện được việc lập luận, chứng
  minh một kết quả hay công thức đơn giản.
- #strong[Năng lực mô hình hóa Toán học:] Mô hình hóa các tình huống
  thực tế liên quan đến tam giác thành bài toán Toán học.
- #strong[Năng lực giải quyết vấn đề Toán học:] Vận dụng linh hoạt các
  công thức để tìm cạnh, góc, diện tích... của tam giác.
- #strong[Năng lực giao tiếp Toán học:] Sử dụng đúng, chính xác các
  thuật ngữ Toán học, kí hiệu toán học.

===== Năng lực số (Tích hợp theo TT 02/2025/TT-BGDĐT)
- 2.1.NC1a- Sử dụng được nhiều công nghệ số để tương tác.
- 2.1.NC1b- Cho người khác thấy phương tiện giao tiếp số phù hợp nhất
  cho một bối cảnh cụ thể.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực chủ động tham gia các hoạt động học tập,
  tìm tòi và hoàn thành các nhiệm vụ được giao.
- #strong[Trung thực:] Thẳng thắn nhìn nhận kết quả làm việc của bản
  thân và nhóm.
- #strong[Trách nhiệm:] Có ý thức trách nhiệm trong việc hoàn thành
  nhiệm vụ được giao, đóng góp xây dựng bài.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Giáo viên:] Máy chiếu, máy tính có kết nối mạng, phiếu học
  tập, bảng phụ, các ví dụ thực tế có sử dụng hình ảnh minh họa.
- #strong[Học sinh:] Sách giáo khoa, vở ghi, máy tính cầm tay, điện
  thoại thông minh/máy tính bảng (để sử dụng công cụ số nếu cần), giấy
  A4/giấy roki để làm Sơ đồ tư duy (tùy theo hình thức).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
==== Hoạt động 1: Tổng hợp kiến thức (15 phút)
- #strong[Mục tiêu:] Hệ thống hóa và sơ đồ hóa toàn bộ kiến thức quan
  trọng của chương III.

- #strong[Phương pháp:] #strong[Dạy học hợp tác] (Làm việc nhóm) kết hợp
  #strong[Kĩ thuật Sơ đồ tư duy (Mind Map)].

- #strong[Nội dung:]

  - #block[
    #set enum(numbering: "i.", start: 1)
    + #strong[Phân công nhiệm vụ (2 phút):] Giáo viên chia lớp thành 4
      nhóm ngẫu nhiên (hoặc chia theo 4 nội dung chính) và giao nhiệm vụ
      thiết kế Sơ đồ tư duy.
    ]

    - #emph[Nhóm 1:] Định lí Cosin và công thức độ dài đường trung
      tuyến.
    - #emph[Nhóm 2:] Định lí Sin và công thức bán kính đường tròn ngoại
      tiếp ($R$).
    - #emph[Nhóm 3:] Công thức tính Diện tích tam giác và bán kính đường
      tròn nội tiếp ($r$).
    - #emph[Nhóm 4:] Ứng dụng thực tế và cách giải tam giác.

  - #block[
    #set enum(numbering: "i.", start: 2)
    + #strong[Thực hiện nhiệm vụ (8 phút):] Các nhóm thực hiện Sơ đồ tư
      duy trên giấy A4 hoặc sử dụng #strong[công cụ số] (Google Slides,
      PowerPoint, hoặc các phần mềm Mind Map online) để tổng hợp kiến
      thức.
    ]

    - #emph[\(Tích hợp Năng lực số: Học sinh sử dụng công cụ số để thiết
      kế Sơ đồ tư duy một cách trực quan, khoa học).]

  - #block[
    #set enum(numbering: "i.", start: 3)
    + #strong[Trình bày và đánh giá (5 phút):]
    ]

    - Giáo viên mời đại diện 1-2 nhóm (ưu tiên nhóm sử dụng công cụ số
      hoặc nhóm trình bày sáng tạo) lên #strong[thuyết trình] Sơ đồ tư
      duy của mình.
    - Các nhóm khác nhận xét, bổ sung.
    - Giáo viên chốt lại các nội dung cốt lõi: Định lí Cosin, Định lí
      Sin, các công thức Diện tích (ít nhất 3 công thức) và công thức
      trung tuyến.

==== Hoạt động 2: Luyện tập -- Vận dụng và Phát triển (30 phút)
- #strong[Mục tiêu:] Vận dụng linh hoạt các công thức để giải quyết các
  dạng bài tập khác nhau, rèn luyện kỹ năng giải quyết vấn đề và năng
  lực tính toán.

- #strong[Phương pháp:] #strong[Dạy học giải quyết vấn đề], #strong[Trò
  chơi học tập] (Đấu trường kiến thức/Tiếp sức).

- #strong[Nội dung:]

  - #block[
    #set enum(numbering: "i.", start: 1)
    + #strong[Khởi động và Phân dạng bài tập (3 phút):] Giáo viên chiếu
      4-5 bài tập mẫu (cơ bản đến nâng cao, có cả bài toán thực tế) lên
      màn hình.
    ]

    - Giáo viên mời 1-2 học sinh #strong[phân tích] và #strong[phân
      loại] các bài tập này thuộc dạng nào (Giải tam giác, Tính diện
      tích, Ứng dụng thực tế).

  - #block[
    #set enum(numbering: "i.", start: 2)
    + #strong[Thực hành -- Trò chơi \"Tiếp sức\" (20 phút):]
    ]

    - Giáo viên giữ nguyên 4 nhóm từ Hoạt động 1. Phát 4 phiếu bài tập
      tương ứng với 4 mức độ/dạng khác nhau (hoặc cùng dạng nhưng khác
      số liệu).
    - #strong[Luật chơi:] Các nhóm luân phiên giải quyết các bài tập.
      Mỗi thành viên chỉ thực hiện một bước tính toán/lập luận/ghi chép
      rồi chuyển tiếp cho thành viên tiếp theo.
    - #emph[Bài tập mẫu (ví dụ):]
      - #emph[Bài 1 (Dễ):] Cho $triangle.stroked.t A B C$ có $b = 10$,
        $c = 12$ và $hat(A) = 60^compose$. Tính cạnh $a$ và diện tích
        $S$.
      - #emph[Bài 2 (Trung bình):] Cho $triangle.stroked.t A B C$ có
        $a = 5$, $b = 6$, $c = 7$. Tính $cos A$ và bán kính đường tròn
        nội tiếp $r$.
      - #emph[Bài 3 (Vận dụng):] Cho $triangle.stroked.t A B C$ có
        $a = 8$, $R = 5$, $hat(B) = 45^compose$. Tính góc $C$.
      - #emph[Bài 4 (Thực tế):] Một người muốn đo khoảng cách giữa hai
        điểm $A$ và $B$ không tới được. Họ chọn điểm $C$ sao cho
        $A C = 20 m$, $B C = 30 m$ và góc
        $accent(A C B, ̂) = 75^compose$. Tính khoảng cách $A B$.
    - #emph[\(Tích hợp Năng lực số: Học sinh được phép sử dụng máy tính
      cầm tay hoặc các công cụ tính toán số (ví dụ: máy tính online,
      GeoGebra) để kiểm tra kết quả tính toán cuối cùng một cách nhanh
      chóng và chính xác).]

  - #block[
    #set enum(numbering: "i.", start: 3)
    + #strong[Đánh giá và Chữa bài (7 phút):]
    ]

    - Giáo viên mời đại diện nhóm có tốc độ và độ chính xác cao nhất
      trình bày lời giải của nhóm mình trên bảng (hoặc chiếu lời giải
      của nhóm lên màn hình).
    - Các nhóm khác #strong[phân tích] và nhận xét bài làm. Giáo viên bổ
      sung và chốt kiến thức, nhấn mạnh các lỗi sai phổ biến và cách
      chọn công thức tối ưu.

=== IV. DẶN DÒ VÀ KẾT THÚC
- Giáo viên giao bài tập về nhà (3-5 bài tập tổng hợp) và yêu cầu học
  sinh chuẩn bị bài mới.
- #emph[Lời kết:] Giáo viên khen ngợi tinh thần làm việc nhóm và khả
  năng #strong[phân tích, tổng hợp] kiến thức của học sinh trong buổi ôn
  tập.

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

