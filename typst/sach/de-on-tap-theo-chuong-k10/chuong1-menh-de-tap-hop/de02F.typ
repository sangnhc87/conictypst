#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("e11d48") // Ruby / Rose

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// HÀM VẼ BIỂU ĐỒ VENN NHÓM MÁU ABO
// ═══════════════════════════════════════════════════════════
#let blood-abo() = align(center)[
  #box(
    stroke: 0.8pt + rgb("cbd5e1"),
    radius: 6pt,
    fill: rgb("f8fafc"),
    inset: 8pt,
  )[
    #text(weight: "bold", size: 9pt, fill: rgb("1e293b"))[Mô hình tập hợp kháng nguyên hệ nhóm máu ABO]
    #v(3pt)
    #cetz.canvas({
      import cetz.draw: *
      // Hình chữ nhật vũ trụ U (tất cả các nhóm máu)
      rect((-3.2, -1.8), (3.2, 1.8), stroke: 0.8pt + rgb("94a3b8"), fill: rgb("ffffff"))
      content((2.7, 1.5), text(size: 8pt, weight: "bold", fill: rgb("64748b"))[Quần thể $U$])
      
      // Vòng tròn A (Kháng nguyên A)
      circle((-0.8, 0), radius: 1.3, fill: rgb("fecdd3"), stroke: 1.2pt + rgb("e11d48"))
      content((-1.5, 1.1), text(size: 8.5pt, weight: "bold", fill: rgb("e11d48"))[Kháng nguyên A])
      content((-1.3, 0), text(size: 9pt, weight: "bold", fill: rgb("be123c"))[Nhóm A])
      
      // Vòng tròn B (Kháng nguyên B)
      circle((0.8, 0), radius: 1.3, fill: rgb("bfdbfe"), stroke: 1.2pt + rgb("2563eb"))
      content((1.5, 1.1), text(size: 8.5pt, weight: "bold", fill: rgb("2563eb"))[Kháng nguyên B])
      content((1.3, 0), text(size: 9pt, weight: "bold", fill: rgb("1d4ed8"))[Nhóm B])
      
      // Giao nhau (Có cả 2 kháng nguyên: Nhóm AB)
      content((0, 0), text(size: 9pt, weight: "bold", fill: rgb("7c3aed"))[Nhóm AB])
      
      // Bên ngoài (Không có cả 2 kháng nguyên: Nhóm O)
      content((0, -1.5), text(size: 8.5pt, weight: "bold", fill: rgb("059669"))[Nhóm O: $C_U (A union B)$ (Không có cả hai kháng nguyên)])
    })
  ]
]

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG I: MỆNH ĐỀ VÀ TẬP HỢP",
  exam-title: "CHUYÊN ĐỀ TOÁN THỰC TẾ (ĐỀ F: LOGIC Y SINH, TRUY VẾT DỊCH TỄ & ĐIỀU TRA PHÁP Y - VD, VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "106F",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong hệ thống nhóm máu ABO ở người, hồng cầu có thể mang kháng nguyên $A$ (tập $A$), kháng nguyên $B$ (tập $B$), mang cả hai kháng nguyên (nhóm máu AB) hoặc không mang kháng nguyên nào (nhóm máu O):
#blood-abo()
Người có nhóm máu AB tương ứng với phần tử thuộc tập hợp nào sau đây?],
    (
        True([$A inter B$]),
        [$A union B$],
        [$A setminus B$],
        [$C_U (A union B)$]
    ),
    loigiai: [
        Nhóm máu AB có cả hai loại kháng nguyên A và B, tương ứng với phần giao của hai tập hợp $A inter B$.
    ]
)

// TN 2
#tn([Trong điều tra dịch tễ học bệnh truyền nhiễm, gọi $U$ là toàn bộ cư dân của một khu vực phong tỏa. Gọi $E$ là tập hợp những người có tiếp xúc gần với ca bệnh dương tính ($F_0$). Tập hợp các cư dân an toàn không có tiếp xúc dịch tễ với ca bệnh ($F_0$) là],
    (
        True([$C_U E$]),
        [$U inter E$],
        [$E setminus U$],
        [$U union E$]
    ),
    loigiai: [
        Những người không tiếp xúc gần thuộc phần bù của tập tiếp xúc $E$ trong toàn bộ cư dân $U$: $C_U E = U setminus E$.
    ]
)

// TN 3
#tn([Một bệnh viện tiến hành lấy mẫu xét nghiệm tầm soát cho $80$ bệnh nhân có triệu chứng hô hấp:
- Có $50$ người có triệu chứng Sốt (tập $S$).
- Có $45$ người có triệu chứng Ho (tập $H$).
- Có $25$ người có cả hai triệu chứng Sốt và Ho.
Số bệnh nhân có ít nhất một trong hai triệu chứng trên là],
    (
        True([$70$ người]),
        [$75$ người],
        [$80$ người],
        [$95$ người]
    ),
    loigiai: [
        $ n(S union H) = n(S) + n(H) - n(S inter H) = 50 + 45 - 25 = 70 text(" người") $
    ]
)

// TN 4
#tn([Trong điều tra hiện trường vụ án, điều tra viên đưa ra nhận định logic: "Nếu nghi phạm $X$ có mặt tại hiện trường lúc gây án ($P$) thì nghi phạm $X$ phải có dấu vân tay trên tay nắm cửa ($Q$)". Cơ quan giám định xác nhận nghi phạm $X$ KHÔNG có dấu vân tay trên tay nắm cửa ($not Q$). Kết luận logic chắc chắn đúng là gì?],
    (
        True([Nghi phạm $X$ không có mặt tại hiện trường lúc gây án ($not P$)]),
        [Nghi phạm $X$ chắc chắn là thủ phạm],
        [Nghi phạm $X$ có mặt tại hiện trường nhưng đeo găng tay],
        [Chưa đủ chứng cứ để kết luận điều gì]
    ),
    loigiai: [
        Quy tắc phản chứng logic (Modus Tollens): Mệnh đề $P => Q$ tương đương với mệnh đề phản đảo $not Q => not P$. Vì $not Q$ đúng nên $not P$ đúng.
    ]
)

// TN 5
#tn([Khoảng trị liệu an toàn (Therapeutic window) của một loại thuốc kháng sinh trong máu được xác định:
- Nồng độ tối thiểu để đạt hiệu quả diệt khuẩn: $A = [15; +infinity)$ ($mu"g/ml"$).
- Nồng độ tối đa để không gây độc tính cho gan: $B = (-infinity; 40]$ ($mu"g/ml"$).
Khoảng nồng độ thuốc trong máu vừa đạt hiệu quả điều trị vừa an toàn cho bệnh nhân ($A inter B$) là],
    (
        True([$[15; 40]$ ($mu"g/ml"$)]),
        [$(15; 40)$ ($mu"g/ml"$)],
        [$[15; +infinity)$ ($mu"g/ml"$)],
        [$(-infinity; 40]$ ($mu"g/ml"$)]
    ),
    loigiai: [
        $ A inter B = [15; +infinity) inter (-infinity; 40] = [15; 40] $
    ]
)

// TN 6
#tn([Trong giám định ADN pháp y, một mẫu tóc tại hiện trường chứa $4$ đoạn alen đặc trưng. Để đối chiếu với tệp hồ sơ lưu trữ, kỹ sư phân tích các tổ hợp gồm đúng $3$ alen từ $4$ alen trên. Số tổ hợp $3$ alen có thể tạo ra từ mẫu tóc là],
    (
        True([$4$ tổ hợp]),
        [$6$ tổ hợp],
        [$12$ tổ hợp],
        [$24$ tổ hợp]
    ),
    loigiai: [
        Số tập con $3$ phần tử từ tập $4$ phần tử là:
        $ 4! / (3! times 1!) = 4 $
    ]
)

// TN 7
#tn([Thời gian ủ bệnh của một chủng virus cúm mùa dao động trong khoảng từ $2$ đến $8$ ngày ($A = [2; 8]$). Thời gian phát tán virus ra cộng đồng mạnh nhất dao động từ $5$ đến $12$ ngày ($B = [5; 12]$). Khoảng thời gian người bệnh vừa trong giai đoạn ủ bệnh vừa có khả năng lây nhiễm mạnh ($A inter B$) là],
    (
        True([$[5; 8]$ ngày]),
        [$[2; 12]$ ngày],
        [$[2; 5]$ ngày],
        [$[8; 12]$ ngày]
    ),
    loigiai: [
        $ [2; 8] inter [5; 12] = [5; 8] $
    ]
)

// TN 8
#tn([Một nghiên cứu di truyền học khảo sát trên $100$ gia đình:
- Có $60$ gia đình có người mang gen quy định mắt nâu.
- Có $50$ gia đình có người mang gen quy định tóc xoăn.
- Có $20$ gia đình không có ai mang cả hai đặc điểm trên.
Số gia đình có người mang cả hai đặc điểm gen mắt nâu và tóc xoăn là],
    (
        True([$30$ gia đình]),
        [$20$ gia đình],
        [$10$ gia đình],
        [$40$ gia đình]
    ),
    loigiai: [
        Số gia đình mang ít nhất một đặc điểm: $100 - 20 = 80$.
        Số gia đình mang cả hai đặc điểm:
        $ 60 + 50 - 80 = 30 text(" gia đình") $
    ]
)

// TN 9
#tn([Thang đo chỉ số khối cơ thể (BMI) của Tổ chức Y tế Thế giới (WHO) dành cho người châu Á:
- Nhóm cân nặng bình thường: $A = [18.5; 23)$.
- Nhóm thừa cân, tiền béo phì: $B = [23; 25)$.
Tập hợp các giá trị BMI thuộc diện $A union B$ (từ bình thường đến tiền béo phì) là],
    (
        True([$[18.5; 25)$]),
        [$[18.5; 23]$],
        [$(18.5; 25)$],
        [$[23; 25)$]
    ),
    loigiai: [
        Vì điểm mút $23$ thuộc $B$ nên:
        $ [18.5; 23) union [23; 25) = [18.5; 25) $
    ]
)

// TN 10
#tn([Mệnh đề đảo của phát biểu y khoa: "Nếu một người bị nhiễm virus SARS-CoV-2 thì người đó có kết quả xét nghiệm PCR dương tính" là:],
    (
        True([Nếu một người có kết quả xét nghiệm PCR dương tính thì người đó bị nhiễm virus SARS-CoV-2]),
        [Nếu một người không bị nhiễm virus SARS-CoV-2 thì kết quả PCR âm tính],
        [Nếu một người có kết quả PCR âm tính thì người đó không bị nhiễm virus SARS-CoV-2],
        [Một người bị nhiễm virus SARS-CoV-2 khi và chỉ khi kết quả PCR dương tính]
    ),
    loigiai: [
        Mệnh đề ban đầu $P => Q$. Mệnh đề đảo là $Q => P$: "Nếu một người có kết quả xét nghiệm PCR dương tính thì người đó bị nhiễm virus SARS-CoV-2".
    ]
)

// TN 11
#tn([Trong thí nghiệm phân lập vi khuẩn, một mẫu bệnh phẩm ban đầu chứa $n$ dòng vi khuẩn khác nhau. Biết rằng số cách chọn ra một cặp gồm đúng $2$ dòng vi khuẩn để thử nghiệm kháng sinh đồ là $15$ cách. Số lượng dòng vi khuẩn $n$ trong mẫu bệnh phẩm là],
    (
        True([$n = 6$]),
        [$n = 5$],
        [$n = 7$],
        [$n = 8$]
    ),
    loigiai: [
        Số tập con gồm 2 phần tử chọn từ $n$ phần tử:
        $ (n(n-1)) / 2 = 15 <=> n(n-1) = 30 <=> n = 6 $ (vì $n in NN^*$).
    ]
)

// TN 12
#tn([Mức đường huyết lúc đói an toàn cho người trưởng thành là $x in [3.9; 6.4]$ ($"mmol/L"$). Nếu lượng đường huyết $x > 7.0$ ($"mmol/L"$) trong hai lần đo liên tiếp thì được chẩn đoán mắc đái tháo đường. Tập hợp các mức đường huyết nằm ngoài khoảng an toàn ($C_RR [3.9; 6.4]$) là],
    (
        True([$(-infinity; 3.9) union (6.4; +infinity)$]),
        [$(-infinity; 3.9] union [6.4; +infinity)$],
        [$[3.9; 6.4]$],
        [$(3.9; 6.4)$]
    ),
    loigiai: [
        Phần bù của đoạn $[3.9; 6.4]$ trên trục số thực $RR$ là hợp của hai khoảng mở:
        $ C_RR [3.9; 6.4] = (-infinity; 3.9) union (6.4; +infinity) $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Điều tra dịch tễ học và truy vết tiếp xúc F1, F2)
#ds([Trung tâm y tế dự phòng truy vết dịch tễ $120$ người trong một tòa nhà có ca nhiễm bệnh:
- Có $60$ người tiếp xúc tại thang máy (Tập $M$).
- Có $50$ người ăn trưa tại căng tin chung (Tập $C$).
- Có $40$ người tham gia cuộc họp tại hội trường tầng 5 (Tập $H$).
Số liệu chi tiết về tiếp xúc đa địa điểm:
- Có $20$ người vừa đi thang máy vừa ăn căng tin ($M inter C$).
- Có $15$ người vừa đi thang máy vừa họp hội trường ($M inter H$).
- Có $15$ người vừa ăn căng tin vừa họp hội trường ($C inter H$).
- Có $5$ người có mặt ở cả ba địa điểm trên ($M inter C inter H$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số người có mặt ở ít nhất một trong ba khu vực có nguy cơ lây nhiễm là $105$ người.]),
    True([Số người trong tòa nhà không xuất hiện tại bất kỳ khu vực nguy cơ nào là $15$ người.]),
    True([Số người chỉ xuất hiện duy nhất tại khu vực thang máy là $30$ người.]),
    [Số người có mặt ở đúng hai trong ba khu vực nguy cơ nói trên là $45$ người.]
  ),
  loigiai: [
    #step([Lực lượng hợp của 3 tập hợp])
    $n(M union C union H) = 60 + 50 + 40 - (20 + 15 + 15) + 5 = 150 - 50 + 5 = 105$ người. Mệnh đề a ĐÚNG.

    #step([Số người không có mặt ở khu vực nào])
    $120 - 105 = 15$ người. Mệnh đề b ĐÚNG.

    #step([Số người chỉ đi thang máy])
    - Đi thang máy và căng tin (không họp): $20 - 5 = 15$.
    - Đi thang máy và họp (không ăn căng tin): $15 - 5 = 10$.
    - Có mặt cả ba: $5$.
    Số người chỉ đi thang máy: $60 - (15 + 10 + 5) = 60 - 30 = 30$ người. Mệnh đề c ĐÚNG.

    #step([Số người có mặt ở đúng 2 địa điểm])
    $15 + 10 + (15 - 5) = 15 + 10 + 10 = 35$ người.
    Khẳng định $45$ người là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Khoảng liều dùng thuốc và nồng độ huyết tương an toàn)
#ds([Một bệnh nhân suy thận cần điều chỉnh liều dùng thuốc theo độ thanh thải Creatinine $C_r$ ($"mL/phút"$):
- Khoảng thanh thải cần giảm $50%$ liều: $A = [10; 30]$.
- Khoảng thanh thải của bệnh nhân được theo dõi theo tham số $m$: $B = [m; m + 15]$ (với $m > 0$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu $m = 20$ thì khoảng thanh thải Creatinine chung của cả hai tập hợp $A inter B$ là đoạn $[20; 30]$.]),
    True([Để bệnh nhân chắc chắn không thuộc diện phải giảm liều ($A inter B = emptyset$) thì điều kiện là $m < -5$ hoặc $m > 30$. Do $m > 0$ nên điều kiện là $m > 30$.]),
    True([Để khoảng thanh thải của bệnh nhân nằm hoàn toàn trong diện giảm liều ($B subset A$) thì điều kiện là $10 <= m <= 15$.]),
    [Khi $m = 25$, hiệu hai tập hợp $A setminus B$ là một nửa khoảng có độ dài bằng $20$.]
  ),
  loigiai: [
    #step([Khi m = 20])
    $B = [20; 35]$. Khi đó $A inter B = [10; 30] inter [20; 35] = [20; 30]$. Mệnh đề a ĐÚNG.

    #step([Điều kiện giao bằng rỗng])
    $A inter B = emptyset <=> m + 15 < 10$ hoặc $m > 30 <=> m < -5$ hoặc $m > 30$. Vì $m > 0$ nên $m > 30$. Mệnh đề b ĐÚNG.

    #step([Điều kiện B là con của A])
    $B subset A <=> 10 <= m$ và $m + 15 <= 30 <=> 10 <= m <= 15$. Mệnh đề c ĐÚNG.

    #step([Khi m = 25])
    $B = [25; 40]$. $A setminus B = [10; 30] setminus [25; 40] = [10; 25)$. Độ dài khoảng này là $25 - 10 = 15 != 20$. Mệnh đề d SAI.
  ]
)

// DS 3 (Suy luận logic trong giám định dấu vết hiện trường vụ án)
#ds([Trong một vụ án mất trộm tài liệu mật tại viện nghiên cứu, có $3$ nghi phạm $A, B, C$. Cơ quan điều tra xác định được các sự thật logic sau:
1. "Có ít nhất một trong ba người $A, B, C$ đã thực hiện vụ trộm".
2. "Nếu $A$ phạm tội thì $B$ là đồng phạm" ($A => B$).
3. "Nếu $C$ phạm tội thì $B$ vô tội" ($C => not B$).
4. "Qua camera giám sát, xác nhận $B$ có bằng chứng ngoại phạm vững chắc (tức $B$ vô tội)".
Xét tính đúng sai của các kết luận logic sau:],
  (
    True([Nghi phạm $A$ chắc chắn vô tội.]),
    True([Nghi phạm $C$ chắc chắn là người đã thực hiện vụ trộm.]),
    True([Số lượng thủ phạm thực hiện vụ trộm trong nhóm trên đúng bằng $1$ người.]),
    [Nếu $B$ có tội thì bắt buộc cả $A$ và $C$ đều phải cùng có tội.]
  ),
  loigiai: [
    #step([Phân tích suy luận logic từ chứng cứ ngoại phạm])
    Biết rằng $B$ vô tội, tức mệnh đề $B = 0$ (Sai).
    - Từ giả thiết $A => B$: Vì $B = 0$, để mệnh đề $A => B$ đúng thì bắt buộc $A = 0$ (tức $A$ vô tội). Mệnh đề a ĐÚNG.
    - Giả thiết 1: Có ít nhất một người phạm tội ($A or B or C = 1$).
    Vì $A = 0$ và $B = 0$, bắt buộc $C = 1$ (tức $C$ là thủ phạm). Mệnh đề b ĐÚNG.
    - Kiểm tra tính tương thích: $C = 1 => not B = 1$ (hoàn toàn phù hợp với việc $B$ vô tội).
    Thủ phạm duy nhất là $C$, vậy số thủ phạm đúng bằng $1$. Mệnh đề c ĐÚNG.

    #step([Xét mệnh đề d])
    Giả thiết $C => not B$ tương đương với $B => not C$. Do đó nếu $B$ có tội thì $C$ phải vô tội. Khẳng định "cả A và C cùng có tội" là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Thử nghiệm lâm sàng thuốc mới và nhóm đối chứng)
#ds([Một thử nghiệm lâm sàng giai đoạn 3 đánh giá hiệu quả của thuốc mới trên $200$ bệnh nhân tăng huyết áp:
- Nhóm $T$ (Dùng thuốc mới): Gồm $100$ bệnh nhân.
- Nhóm $P$ (Dùng giả dược đối chứng Placebo): Gồm $100$ bệnh nhân.
Sau $8$ tuần theo dõi huyết áp tâm thu $x$ ($"mmHg"$):
- Tập bệnh nhân đạt huyết áp mục tiêu ($x <= 130$): Gồm $80$ người ở nhóm $T$ và $40$ người ở nhóm $P$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số bệnh nhân đạt huyết áp mục tiêu trong toàn bộ thử nghiệm là $120$ người.]),
    True([Tỷ lệ đạt huyết áp mục tiêu ở nhóm dùng thuốc mới là $80%$, cao gấp đôi so với nhóm dùng giả dược ($40%$).]),
    True([Số bệnh nhân không đạt huyết áp mục tiêu ở cả hai nhóm là $80$ người.]),
    [Tập hợp bệnh nhân của nhóm $T$ và nhóm $P$ có phần giao khác rỗng.]
  ),
  loigiai: [
    #step([Tổng số bệnh nhân đạt mục tiêu])
    Vì nhóm T và P là hai nhóm bệnh nhân độc lập rời nhau ($T inter P = emptyset$) nên tổng số người đạt mục tiêu là $80 + 40 = 120$ người. Mệnh đề a ĐÚNG.

    #step([Tỷ lệ đạt mục tiêu])
    - Nhóm thuốc mới: $80 / 100 = 80%$.
    - Nhóm giả dược: $40 / 100 = 40%$. Mệnh đề b ĐÚNG.

    #step([Số bệnh nhân không đạt mục tiêu])
    Tổng số bệnh nhân không đạt: $200 - 120 = 80$ người. Mệnh đề c ĐÚNG.

    #step([Giao của hai nhóm thử nghiệm])
    Mỗi bệnh nhân chỉ được phân ngẫu nhiên vào đúng một nhánh thử nghiệm nên $T inter P = emptyset$. Nhận định giao khác rỗng là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Số bệnh nhân có cả 2 triệu chứng)
#tln([Một phòng khám đa khoa tiếp nhận $350$ lượt khám bệnh trong ngày: có $210$ người có bảo hiểm y tế đúng tuyến, $180$ người có chỉ định làm xét nghiệm sinh hóa máu.
Biết rằng có $40$ người vừa không có bảo hiểm đúng tuyến vừa không có chỉ định xét nghiệm máu.
Hỏi có bao nhiêu bệnh nhân vừa có bảo hiểm y tế đúng tuyến vừa có chỉ định xét nghiệm máu?],
    [80],
    loigiai: [
        #step([Tính số bệnh nhân thuộc ít nhất một nhóm])
        $ n(A union B) = 350 - 40 = 310 text(" bệnh nhân") $
        
        #step([Tính số bệnh nhân thỏa mãn cả hai điều kiện])
        $ n(A inter B) = n(A) + n(B) - n(A union B) = 210 + 180 - 310 = 80 text(" bệnh nhân") $
    ]
)

// TLN 2 (Truy vết tiếp xúc 3 địa điểm bến xe, siêu thị, chợ)
#tln([Trong một đợt bùng phát dịch bệnh, cơ quan y tế điều tra lịch trình của $150$ ca nghi nhiễm qua ba địa điểm công cộng: Bến xe ($B$), Siêu thị ($S$) và Chợ dân sinh ($C$).
Số liệu tổng hợp:
- Có $80$ người từng đến $B$; $70$ người từng đến $S$; $60$ người từng đến $C$.
- Có $35$ người đến cả $B$ và $S$; $25$ người đến cả $B$ và $C$; $20$ người đến cả $S$ và $C$.
- Có $10$ người đã từng đến cả ba địa điểm trên.
Hỏi có bao nhiêu người không đến bất kỳ địa điểm nào trong ba địa điểm trên?],
    [10],
    loigiai: [
        #step([Tính số người đến ít nhất một địa điểm])
        $ n(B union S union C) = 80 + 70 + 60 - (35 + 25 + 20) + 10 = 210 - 80 + 10 = 140 text(" người") $
        
        #step([Tính số người không đến địa điểm nào])
        $ 150 - 140 = 10 text(" người") $
    ]
)

// TLN 3 (Số ca nghi nhiễm chỉ đến đúng một địa điểm)
#tln([Từ số liệu của bài toán truy vết trên, hãy tính số ca nghi nhiễm chỉ đến duy nhất đúng một địa điểm công cộng trong ba địa điểm $B, S, C$.],
    [80],
    loigiai: [
        #step([Tính số người đến đúng hai địa điểm])
        $ (35 - 10) + (25 - 10) + (20 - 10) = 25 + 15 + 10 = 50 text(" người") $
        
        #step([Tính số người chỉ đến đúng một địa điểm])
        $ 140 - 50 - 10 = 80 text(" người") $
    ]
)

// TLN 4 (Tìm tham số m để khoảng nồng độ thuốc an toàn)
#tln([Chỉ số xét nghiệm chức năng gan AST ($"U/L"$) của bệnh nhân được đánh giá:
Khoảng bình thường: $A = [10; 40]$.
Khoảng theo dõi điều trị đặc biệt: $B = [m; 120]$ (với $m <= 120$).
Tìm giá trị nguyên nhỏ nhất của tham số $m$ để hai khoảng này hoàn toàn không có điểm chung ($A inter B = emptyset$).],
    [41],
    loigiai: [
        #step([Điều kiện giao bằng rỗng])
        Để $[10; 40] inter [m; 120] = emptyset$ với $m <= 120$, ta cần:
        $ m > 40 $
        
        #step([Tìm m nguyên nhỏ nhất])
        Vì $m in ZZ$ và $m > 40$ nên $m = 41$.
    ]
)

// TLN 5 (Số cách ghép nhóm mẫu xét nghiệm Pool testing)
#tln([Để tiết kiệm sinh phẩm, phòng xét nghiệm chọn ra một nhóm gồm đúng $3$ mẫu máu từ một lô gồm $7$ mẫu bệnh phẩm khác nhau để thực hiện xét nghiệm gộp (Pool PCR).
Hỏi có bao nhiêu cách chọn ra một nhóm $3$ mẫu máu như vậy?],
    [35],
    loigiai: [
        #step([Tính số tập con gồm 3 phần tử từ 7 phần tử])
        $ (7 times 6 times 5) / (3 times 2 times 1) = 35 text(" cách") $
    ]
)

// TLN 6 (Khảo sát tỷ lệ kháng thuốc kháng sinh)
#tln([Khảo sát $100$ chủng vi khuẩn phân lập từ bệnh viện:
- Có $58$ chủng đề kháng kháng sinh Penicillin.
- Có $46$ chủng đề kháng kháng sinh Cephalosporin.
- Có $12$ chủng nhạy cảm hoàn toàn (không kháng cả hai loại kháng sinh trên).
Hỏi có bao nhiêu chủng vi khuẩn thuộc diện đa kháng thuốc (đề kháng đồng thời cả hai loại kháng sinh trên)?],
    [16],
    loigiai: [
        #step([Tính số chủng kháng ít nhất một loại kháng sinh])
        $ n(A union B) = 100 - 12 = 88 text(" chủng") $
        
        #step([Tính số chủng đa kháng])
        $ n(A inter B) = n(A) + n(B) - n(A union B) = 58 + 46 - 88 = 16 text(" chủng") $
    ]
)

] // end make-questions

#make-questions()
