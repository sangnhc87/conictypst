// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "Bài 9 Tích của một VT với một số",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "KIẾN THỨC")
- Nêu được #strong[định nghĩa] tích của một vectơ với một số $k$ khác 0.
- Xác định được #strong[hướng] và #strong[độ dài] của vectơ $arrow(u)$
  sau khi nhân với một số $k$ (bao gồm $k > 0$ và $k < 0$).
- Nắm vững và vận dụng được các #strong[tính chất] của phép nhân vectơ
  với một số (tính chất phân phối, tính chất kết hợp, tính chất 1 và
  tính chất 0).
- Nhận biết và vận dụng được #strong[điều kiện cùng phương] của hai
  vectơ.
- Nhận biết và vận dụng được #strong[biểu diễn một vectơ] theo hai vectơ
  không cùng phương.

#muc("2", "NĂNG LỰC")
- #strong[Năng lực đặc thù (Năng lực Toán học):]
  - #strong[Năng lực tư duy và lập luận toán học:] Phân tích định nghĩa,
    nhận ra quy luật (hướng, độ dài) của phép nhân vectơ với một số,
    chứng minh các tính chất cơ bản.
  - #strong[Năng lực mô hình hóa toán học:] Sử dụng vectơ và phép nhân
    vectơ với một số để mô tả và giải quyết các vấn đề thực tiễn (ví dụ:
    chuyển động, lực, tỉ lệ).
  - #strong[Năng lực giải quyết vấn đề toán học:] Vận dụng linh hoạt các
    tính chất và điều kiện cùng phương để giải các bài toán chứng minh,
    tìm tọa độ, biểu diễn vectơ.
- #strong[Năng lực chung:]
  - #strong[Năng lực tự chủ và tự học:] Chủ động đọc, nghiên cứu SGK,
    tài liệu tham khảo để tìm kiếm và chiếm lĩnh kiến thức.
  - #strong[Năng lực giao tiếp và hợp tác:] Tích cực tham gia thảo luận
    nhóm, trình bày ý kiến, lắng nghe và phản biện một cách xây dựng.
- #strong[Năng lực số (theo TT 02/2025/TT-BGDĐT):]
  - 3.1.NC1a- Áp dụng được các cách tạo và chỉnh sửa nội dung ở các định
    dạng khác nhau,
  - 3.1.NC1b- Chỉ ra được những cách thể hiện bản thân thông qua việc
    tạo ra các nội dung số.
  - 2.4.NC1a-Đề xuất được các công cụ và công nghệ số khác nhau cho các
    quá trình hợp tác.

#muc("3", "PHẨM CHẤT")
- #strong[Chăm chỉ:] Tích cực tìm tòi, nghiên cứu tài liệu, hoàn thành
  các nhiệm vụ học tập được giao.
- #strong[Trách nhiệm:] Hoàn thành tốt nhiệm vụ được phân công khi làm
  việc nhóm; có trách nhiệm với kết quả học tập của bản thân và nhóm.
- #strong[Trung thực:] Thẳng thắn, nghiêm túc trong quá trình báo cáo và
  đánh giá kết quả học tập.

#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")
- #strong[Thiết bị dạy học:] Máy chiếu, máy tính, bảng nhóm, giấy A0/A4,
  bút dạ.
- #strong[Học liệu:]
  - Sách giáo khoa Toán 10 - Bộ Kết nối tri thức với cuộc sống.
  - Phiếu học tập (in ấn hoặc bản mềm sử dụng Google Forms/Quizizz).
  - Tài liệu hướng dẫn sử dụng phần mềm #strong[GeoGebra] (hoặc phần mềm
    vẽ vectơ khác) để trực quan hóa phép nhân vectơ với một số.
  - Công cụ tạo sơ đồ tư duy trực tuyến (ví dụ: MindMeister, Canva).

#phan("III", "TIẾN TRÌNH DẠY HỌC")
#hd("1", "Xác định vấn đề/nhiệm vụ học tập/Mở đầu", "10 phút")
- #strong[Tên hoạt động:] Khởi động - Đi tìm \"Bản sao\" của Vectơ

#mt-hd[
  vectơ, độ dài, hướng của vectơ và bước đầu nhận ra nhu cầu về một phép
  toán mới (nhân vectơ với một số).

]
#nd-hd[

  - Giáo viên (GV) đưa ra tình huống thực tiễn/câu hỏi gợi mở.
  - #strong[Tình huống:] Một chiếc xe máy di chuyển trên đoạn đường
    thẳng từ A đến B được biểu diễn bằng vectơ $accent(A B, ⃗)$. Nếu
    chiếc xe đó di chuyển #strong[gấp đôi] quãng đường đó theo cùng
    hướng, vectơ biểu diễn chuyển động mới sẽ như thế nào so với
    $accent(A B, ⃗)$?
  - #strong[Nhiệm vụ:]
    - Cá nhân học sinh (HS) suy nghĩ và trả lời câu hỏi: Vectơ mới có
      mối quan hệ gì về #strong[hướng] và #strong[độ dài] so với
      $accent(A B, ⃗)$?
    - HS dùng bút, thước kẻ để phác họa nhanh mối quan hệ đó.

]
#sp-hd[
  thảo):

  - Vectơ mới: cùng hướng với $accent(A B, ⃗)$ và có độ dài bằng
    $2\|accent(A B, ⃗)\|$.
  - GV chuẩn hóa: Vectơ mới chính là
    $upright(bold(2)) arrow(upright(bold(A B)))$.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (1 phút):] GV trình bày tình huống và
    yêu cầu HS suy nghĩ.
  - #strong[Bước 2: Thực hiện nhiệm vụ (5 phút):] HS tự nghiên cứu và
    đưa ra câu trả lời. GV theo dõi, gợi ý: Phép cộng vectơ có giải
    quyết được vấn đề này không? (Dự kiến khó khăn: HS có thể nhầm lẫn
    với phép cộng vectơ).
  - #strong[Bước 3: Báo cáo, thảo luận (3 phút):] GV mời 1-2 HS trình
    bày. GV nhận xét, dẫn dắt: Để biểu diễn mối quan hệ \"gấp $k$ lần\"
    này, ta cần một phép toán mới, đó chính là #strong[Tích của một
    vectơ với một số].
  - #strong[Bước 4: Kết luận, nhận định (1 phút):] GV chốt vấn đề, ghi
    tên bài học, chuyển sang Hoạt động 2.

]
#hd("2", "Hình thành kiến thức mới/giải quyết vấn đề", "60 phút")
#strong[Hoạt động thành phần 2.1: Tích của một vectơ với một số (30
phút)]

- #strong[Tên hoạt động:] Khám phá Định nghĩa và Tính chất cơ bản

#mt-hd[
  với số thực $k eq.not 0$, xác định được hướng và độ dài của
  $k arrow(a)$.

]
#nd-hd[

  - HS làm việc nhóm (4-5 HS/nhóm).
  - #strong[Nhiệm vụ 1 (Định nghĩa):] HS đọc SGK (hoặc tài liệu số do GV
    cung cấp) về định nghĩa vectơ $k arrow(a)$. Thảo luận để nêu rõ
    #strong[hướng] và #strong[độ dài] của $k arrow(a)$ trong hai trường
    hợp: $k > 0$ và $k < 0$.
  - #strong[Nhiệm vụ 2 (Ví dụ trực quan và tích hợp Năng lực số):]
    - Mỗi nhóm sử dụng phần mềm #strong[GeoGebra] trên máy tính/điện
      thoại (hoặc một công cụ vẽ vectơ khác) để vẽ minh họa các vectơ:
      $arrow(u)$, $2 arrow(u)$, $- 1 / 2 arrow(u)$. \* #strong[Tích hợp
      Năng lực số:] #emph[Tạo được nội dung số] (tạo hình vẽ vectơ bằng
      GeoGebra) và #emph[Trao đổi, hợp tác với người khác bằng công cụ
      số] (chia sẻ link/ảnh hình vẽ trong nhóm học tập Zalo/Padlet).

]
#sp-hd[

  - #strong[Nội dung:] Định nghĩa, kết luận về hướng và độ dài của vectơ
    $k arrow(a)$.
  - #strong[Hình thức:] Hình vẽ minh họa bằng GeoGebra và bài trình bày
    nhóm.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (2 phút):] GV chiếu yêu cầu của 2
    Nhiệm vụ, hướng dẫn HS truy cập GeoGebra và chia nhóm.

  - #strong[Bước 2: Thực hiện nhiệm vụ (15 phút):] HS thảo luận, đọc SGK
    và thực hiện vẽ trên GeoGebra. GV quan sát, hỗ trợ kỹ thuật số và
    kiến thức.

  - #strong[Bước 3: Báo cáo, thảo luận (8 phút):] GV mời đại diện 2 nhóm
    (một nhóm $k > 0$, một nhóm $k < 0$) trình bày sản phẩm GeoGebra
    (chiếu lên màn hình).

  - #strong[Bước 4: Kết luận, nhận định (5 phút):] GV chuẩn hóa kiến
    thức, chốt Định nghĩa, Hướng, Độ dài, và #strong[Ví dụ minh họa:]

  - #quote(block: true)[
    Cho tam giác $A B C$. Gọi $M$ là trung điểm của $B C$. Vectơ
    $accent(B C, ⃗)$ và vectơ $accent(C M, ⃗)$ có mối quan hệ gì? (Đáp án:
    $accent(C M, ⃗) = - 1 / 2 accent(B C, ⃗)$).
    ]

#strong[Hoạt động thành phần 2.2: Các tính chất của phép nhân vectơ với
một số (30 phút)]

- #strong[Tên hoạt động:] Chứng minh và Vận dụng Tính chất

]
#mt-hd[
  vận dụng thành thạo 4 tính chất cơ bản của phép nhân vectơ với một số.

]
#nd-hd[

  - HS làm việc nhóm (4-5 HS/nhóm).
  - #strong[Nhiệm vụ:] Mỗi nhóm được giao nghiên cứu một hoặc hai tính
    chất trong 4 tính chất (Phân phối với số, Phân phối với vectơ, Kết
    hợp, Tính chất 1 và 0).
    - Nhóm 1: $k\(arrow(u) + arrow(v)\)= k arrow(u) + k arrow(v)$
    - Nhóm 2: $\(k + m\)arrow(u) = k arrow(u) + m arrow(u)$
    - Nhóm 3: $k\(m arrow(u)\)=\(k m\)arrow(u)$
    - Nhóm 4: $1 arrow(u) = arrow(u)$, $\(- 1\)arrow(u) = - arrow(u)$,
      $0 arrow(u) = arrow(0)$, $k arrow(0) = arrow(0)$
  - #strong[Yêu cầu:] Trình bày tóm tắt nội dung tính chất và đưa ra một
    #strong[Ví dụ áp dụng] (hoặc chứng minh đơn giản) để minh họa tính
    chất đó.
  - #strong[Tích hợp Năng lực số:] Mỗi nhóm dùng công cụ vẽ sơ đồ tư duy
    trực tuyến (ví dụ: MindMeister) để tóm tắt các tính chất vừa nghiên
    cứu.

]
#sp-hd[

  - #strong[Nội dung:] Bản tóm tắt/Chứng minh/Ví dụ minh họa các tính
    chất.
  - #strong[Hình thức:] Bản trình bày PowerPoint/Sơ đồ tư duy trực
    tuyến.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (2 phút):] GV phân công nhiệm vụ cho
    các nhóm và hướng dẫn cách thức trình bày (Sơ đồ tư duy).

  - #strong[Bước 2: Thực hiện nhiệm vụ (15 phút):] HS làm việc nhóm,
    nghiên cứu SGK, thảo luận, tìm ví dụ và thiết kế sơ đồ tư duy. GV
    quan sát, hỗ trợ và định hướng cách chứng minh/giải thích.

  - #strong[Bước 3: Báo cáo, thảo luận (10 phút):] Đại diện các nhóm lần
    lượt trình bày sơ đồ tư duy (tăng cường kỹ năng thuyết trình, phân
    tích và tổng hợp thông tin). Các nhóm khác đặt câu hỏi, phản biện.

  - #strong[Bước 4: Kết luận, nhận định (3 phút):] GV chuẩn hóa lại các
    tính chất, nhấn mạnh các tính chất thường dùng, và chốt #strong[Ví
    dụ minh họa:]

  - #quote(block: true)[
    #strong[Ví dụ:] Cho biểu thức
    $arrow(x) = 3\(arrow(a) + 2 arrow(b)\)- 2\(3 arrow(b) - arrow(a)\)$.
    Hãy rút gọn biểu thức $arrow(x)$ bằng cách áp dụng các tính chất
    (Đáp án: $arrow(x) = 5 arrow(a)$).
    ]

]
#hd("3", "Luyện tập", "15 phút")
- #strong[Tên hoạt động:] Củng cố và Phát triển Kỹ năng Vận dụng

#mt-hd[
  chất để giải các bài tập cơ bản, đặc biệt là bài toán điều kiện cùng
  phương.

]
#nd-hd[
  học tập (hoặc công cụ Quizizz/Google Forms) với các dạng:

  - #strong[Dạng 1 (Nhận biết):] Xác định vectơ $arrow(u)$ và $arrow(v)$
    cùng phương, ngược hướng, độ dài.

  - #quote(block: true)[
    #strong[Bài 1:] Cho $\|arrow(a)\|= 2$. Tính $\|- 3 arrow(a)\|$. (Đáp
    án: 6)
    ]

  - #strong[Dạng 2 (Vận dụng tính chất):] Rút gọn biểu thức vectơ, chứng
    minh đẳng thức.

  - #quote(block: true)[
    #strong[Bài 2:] Cho tứ giác $A B C D$. Chứng minh rằng nếu
    $accent(A B, ⃗) = 3 accent(C D, ⃗)$ thì $A B\/\/C D$ và $A B = 3 C D$.
    ]

  - #strong[Dạng 3 (Điều kiện cùng phương):] Tìm số $k$ để hai vectơ
    cùng phương.

  - #quote(block: true)[
    #strong[Bài 3 (Mức độ vận dụng):] Cho hai vectơ $arrow(u)$ và
    $arrow(v)$ không cùng phương. Tìm số thực $x$ thỏa mãn
    $2 arrow(u) -\(x + 1\)arrow(v) = arrow(0)$. (Đáp án: $x = - 1$)
    ]

]
#sp-hd[

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (1 phút):] GV giao phiếu học tập (hoặc
    link Quizizz) và yêu cầu HS làm việc cá nhân trong 8 phút.
  - #strong[Bước 2: Thực hiện nhiệm vụ (8 phút):] HS tự lực giải quyết
    các bài tập. GV theo dõi, nhắc nhở về thời gian và gợi ý khi cần.
  - #strong[Bước 3: Báo cáo, thảo luận (6 phút):] GV mời 3 HS lên trình
    bày lời giải chi tiết cho 3 bài tập. HS khác nhận xét, bổ sung.
  - #strong[Tích hợp Năng lực số:] #emph[Tạo được nội dung số] (Sản phẩm
    bài tập trên Google Forms/Quizizz).

]
#hd("4", "Vận dụng", "5 phút")
- #strong[Tên hoạt động:] Khám phá ứng dụng thực tiễn và mở rộng

#mt-hd[
  được ứng dụng của phép nhân vectơ với một số trong thực tiễn và mở
  rộng kiến thức.

]
#nd-hd[

  - #strong[Nhiệm vụ:]
    - Tìm hiểu về ứng dụng của phép nhân vectơ với một số trong lĩnh vực
      #strong[Vật lí] (Ví dụ: Định luật II Newton
      $arrow(F) = m arrow(a)$, trong đó $m$ là số thực dương).
    - Tìm hiểu về #strong[biểu diễn một vectơ theo hai vectơ không cùng
      phương] (kiến thức mở rộng).
  - #strong[Yêu cầu:] Học sinh phát hiện/đề xuất vấn đề trong thực tiễn
    có liên quan đến phép nhân vectơ với một số (ví dụ: mô hình hóa lực,
    gia tốc, vận tốc trong chuyển động).

]
#sp-hd[
  bản tóm tắt công thức biểu diễn một vectơ theo hai vectơ không cùng
  phương.

]
#tc-hd[

  - #strong[Bước 1: Giao nhiệm vụ (1 phút):] GV giao nhiệm vụ tìm hiểu
    ngoài giờ học.
  - #strong[Bước 2: Thực hiện nhiệm vụ (Thời gian ở nhà):] HS thực hiện
    ngoài giờ học, tìm kiếm thông tin trên mạng (sử dụng công cụ số),
    tổng hợp kiến thức.
  - #strong[Bước 3: Nộp báo cáo (Thời điểm phù hợp):] GV yêu cầu HS nộp
    sản phẩm (báo cáo ngắn gọn, video, hoặc hình ảnh) vào buổi học tiếp
    theo để trao đổi, chia sẻ và đánh giá.
  - #strong[Tích hợp Năng lực số:] #emph[Tìm kiếm và xử lí dữ liệu số]
    (tìm kiếm thông tin ứng dụng trên Internet).

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
