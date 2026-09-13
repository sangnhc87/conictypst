#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("059669") // Emerald

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG IX: TÍNH XÁC SUẤT THEO ĐỊNH NGHĨA CỔ ĐIỂN",
  exam-title: "CHUYÊN ĐỀ THỰC TẾ: BẢO HIỂM, RỦI RO TÀI CHÍNH & THỐNG KÊ SINH TỒN (ĐỀ SỐ 32E)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "198",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Bảng tỷ lệ sinh tồn cặp vợ chồng có CeTZ)
#tn([Theo bảng tỷ lệ sinh tồn của một công ty bảo hiểm nhân thọ, xác suất một người ở độ tuổi $30$ sống thêm ít nhất $10$ năm nữa là $p = 0.992$. Giả sử tình trạng sức khỏe của hai vợ chồng cùng ở độ tuổi $30$ là độc lập với nhau. Xác suất để cả hai vợ chồng cùng sống thọ thêm ít nhất $10$ năm nữa xấp xỉ bằng],
    (
        True([$0.9841$]),
        [$0.9920$],
        [$0.0160$],
        [$0.9800$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng quy tắc nhân xác suất cho hai biến cố độc lập:
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (5, 1.2), fill: rgb("d1fae5"), stroke: 1.2pt + accent)
          content((2.5, 0.6), [Sinh tồn 10 năm: $p_1 = 0.992$ và $p_2 = 0.992$])
        })
        ]
        Xác suất cả hai vợ chồng cùng sống thọ thêm ít nhất 10 năm:
        $ P = p^2 = (0.992)^2 = 0.984064 approx 0.9841 $
    ]
)

// TN 2 (Rủi ro danh mục cổ phiếu)
#tn([Một danh mục đầu tư tài chính gồm $5$ mã cổ phiếu hoạt động trên các ngành kinh tế hoàn toàn độc lập. Xác suất sụt giảm giá trong quý tới của mỗi cổ phiếu là $0.10$. Xác suất để trong quý tới có đúng một mã cổ phiếu trong danh mục bị sụt giảm giá xấp xỉ bằng],
    (
        True([$0.3281$]),
        [$0.5000$],
        [$0.1000$],
        [$0.0500$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức phân bố nhị thức với $n = 5, k = 1, p = 0.10$:
        $ P(X = 1) = C_5^1 (0.10)^1 (1 - 0.10)^(5 - 1) = 5 times (0.10) times (0.90)^4 $
        Ta có $(0.90)^4 = 0.6561$.
        $ P(X = 1) = 0.50 times 0.6561 = 0.32805 approx 0.3281 $
    ]
)

// TN 3 (Bảo hiểm rủi ro chuyến bay khứ hồi)
#tn([Một hành khách mua bảo hiểm hoãn chuyến bay cho một chuyến du lịch khứ hồi gồm $2$ chặng bay độc lập. Xác suất bị chậm chuyến ở mỗi chặng bay là $0.15$. Xác suất để hành khách gặp ít nhất một chặng bay bị chậm chuyến bằng],
    (
        True([$0.2775$]),
        [$0.3000$],
        [$0.0225$],
        [$0.7225$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng phương pháp biến cố đối: cả hai chặng bay đều đúng giờ.
        - Xác suất chặng bay đúng giờ: $1 - 0.15 = 0.85$.
        - Xác suất cả hai chặng đều đúng giờ:
          $ (0.85)^2 = 0.7225 $
        - Xác suất có ít nhất một chặng bị chậm chuyến:
          $ P = 1 - 0.7225 = 0.2775 $
    ]
)

// TN 4 (Danh mục trái phiếu vỡ nợ độc lập có CeTZ)
#tn([Một quỹ đầu tư mạo hiểm nắm giữ $3$ trái phiếu doanh nghiệp độc lập. Xác suất vỡ nợ trong năm của các trái phiếu lần lượt là $0.01$; $0.02$ và $0.05$. Xác suất để trong năm quỹ đầu tư không gặp bất kỳ rủi ro vỡ nợ nào xấp xỉ bằng],
    (
        True([$0.9217$]),
        [$0.0800$],
        [$0.9500$],
        [$0.0001$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng quy tắc nhân xác suất cho các biến cố độc lập.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for i in range(3) {
            rect((i * 1.8, 0), (i * 1.8 + 1.4, 0.9), fill: rgb("d1fae5"), stroke: 1pt + accent)
            content((i * 1.8 + 0.7, 0.45), text(size: 8pt, [Trái phiếu #str(i + 1)]))
          }
          content((2.5, -0.3), [3 Trái phiếu độc lập an toàn])
        })
        ]
        - Xác suất không vỡ nợ của từng trái phiếu là $0.99$; $0.98$ và $0.95$.
        - Xác suất cả 3 trái phiếu đều an toàn:
          $ P = (0.99) times (0.98) times (0.95) = 0.92169 approx 0.9217 $
    ]
)

// TN 5 (Rủi ro bão lũ trong 3 năm)
#tn([Tại một địa phương ven biển, xác suất xảy ra thiên tai bão lũ cấp độ mạnh trong một năm bất kỳ là $0.20$. Giả sử điều kiện thời tiết giữa các năm là độc lập. Xác suất để trong $3$ năm liên tiếp có ít nhất một năm xảy ra bão lũ cấp độ mạnh bằng],
    (
        True([$0.488$]),
        [$0.512$],
        [$0.600$],
        [$0.008$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp biến cố đối: trong cả 3 năm liên tiếp đều không xảy ra bão lũ mạnh.
        - Xác suất một năm không xảy ra bão lũ: $1 - 0.20 = 0.80$.
        - Xác suất cả 3 năm đều bình yên:
          $ (0.80)^3 = 0.512 $
        - Xác suất có ít nhất một năm xảy ra bão lũ:
          $ P = 1 - 0.512 = 0.488 $
    ]
)

// TN 6 (Kỳ vọng bồi thường bảo hiểm tài sản)
#tn([Một công ty bảo hiểm tài sản ký hợp đồng với chủ một kho hàng. Mức trách nhiệm bồi thường tối đa nếu xảy ra hỏa hoạn là $2$ tỷ đồng. Thống kê dữ liệu lịch sử cho thấy xác suất xảy ra hỏa hoạn tại kho hàng trong năm là $0.004$. Số tiền bồi thường kỳ vọng của công ty bảo hiểm cho kho hàng này trong năm bằng],
    (
        True([$8$ triệu đồng]),
        [$80$ triệu đồng],
        [$800$ nghìn đồng],
        [$4$ triệu đồng]
    ),
    loigiai: [
        *Phương pháp giải:* Số tiền bồi thường kỳ vọng bằng tích của mức bồi thường và xác suất xảy ra sự cố:
        $ E = 2000 times 0.004 = 8 text(" triệu đồng") $
    ]
)

// TN 7 (Chọn ngẫu nhiên trái phiếu theo xếp hạng)
#tn([Một quỹ tín thác sở hữu $10$ mã trái phiếu, trong đó có $4$ mã được xếp hạng tín nhiệm AAA (rất cao) và $6$ mã được xếp hạng AA (cao). Chuyên viên tài chính chọn ngẫu nhiên $3$ mã trái phiếu để phân tích chuyên sâu. Xác suất để trong $3$ mã trái phiếu được chọn có cả hai hạng xếp hạng tín nhiệm bằng],
    (
        True([$4 / 5$]),
        [$1 / 5$],
        [$3 / 5$],
        [$2 / 3$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp biến cố đối: cả 3 mã được chọn đều cùng một hạng tín nhiệm (chỉ toàn AAA hoặc chỉ toàn AA).
        - Không gian mẫu: $|Omega| = C_10^3 = 120$.
        - Chọn 3 mã toàn AAA: $C_4^3 = 4$.
        - Chọn 3 mã toàn AA: $C_6^3 = 20$.
        - Số cách chọn có cả hai hạng: $|A| = 120 - (4 + 20) = 96$.
        - Xác suất:
          $ P(A) = 96 / 120 = 4 / 5 $
    ]
)

// TN 8 (Bảo hiểm hàng hải 2 tàu cập cảng an toàn)
#tn([Hai con tàu vận tải hàng hóa viễn dương vận hành độc lập vượt đại dương. Xác suất gặp sự cố hàng hải phải kích hoạt bảo hiểm của tàu 1 là $0.04$ và của tàu 2 là $0.05$. Xác suất để cả hai con tàu đều cập cảng an toàn mà không phải kích hoạt bảo hiểm bằng],
    (
        True([$0.912$]),
        [$0.090$],
        [$0.002$],
        [$0.950$]
    ),
    loigiai: [
        *Phương pháp giải:* Xác suất cập cảng an toàn của từng tàu lần lượt là $0.96$ và $0.95$.
        $ P = (0.96) times (0.95) = 0.912 $
    ]
)

// TN 9 (Tỷ lệ nảy mầm hạt giống sinh tồn)
#tn([Một viện nghiên cứu nông nghiệp thử nghiệm gieo $3$ hạt giống quý hiếm độc lập. Xác suất nảy mầm thành công của mỗi hạt giống là $0.90$. Xác suất để có ít nhất một hạt giống nảy mầm thành công bằng],
    (
        True([$0.999$]),
        [$0.729$],
        [$0.001$],
        [$0.990$]
    ),
    loigiai: [
        *Phương pháp giải:* Biến cố đối: cả 3 hạt giống đều không nảy mầm.
        - Xác suất không nảy mầm của mỗi hạt: $1 - 0.9 = 0.1$.
        - Xác suất cả 3 hạt không nảy mầm: $(0.1)^3 = 0.001$.
        - Xác suất ít nhất 1 hạt nảy mầm: $1 - 0.001 = 0.999$.
    ]
)

// TN 10 (Kiểm toán độc lập 4 chi nhánh ngân hàng)
#tn([Một ngân hàng thương mại có $4$ chi nhánh hoạt động độc lập. Xác suất để một chi nhánh có sai lệch kiểm toán trong quý là $0.05$. Xác suất để không có bất kỳ chi nhánh nào bị sai lệch kiểm toán trong quý xấp xỉ bằng],
    (
        True([$0.8145$]),
        [$0.8000$],
        [$0.1855$],
        [$0.9500$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng quy tắc nhân xác suất cho 4 biến cố độc lập, mỗi chi nhánh không sai lệch với xác suất $0.95$:
        $ P = (0.95)^4 approx 0.81450625 approx 0.8145 $
    ]
)

// TN 11 (Bảo hiểm cháy nổ chung cư)
#tn([Một tòa nhà chung cư có $2$ hệ thống báo cháy tự động hoạt động độc lập. Xác suất cảm biến báo cháy hoạt động nhạy khi có khói của hệ thống 1 là $0.96$ và của hệ thống 2 là $0.95$. Khi có khói, xác suất có ít nhất một hệ thống phát tín hiệu báo động bằng],
    (
        True([$0.998$]),
        [$0.912$],
        [$0.002$],
        [$0.955$]
    ),
    loigiai: [
        *Phương pháp giải:* Biến cố đối: cả hai hệ thống cùng bị tê liệt không phát tín hiệu.
        - Xác suất cả hai cùng hỏng: $(1 - 0.96) times (1 - 0.95) = (0.04) times (0.05) = 0.002$.
        - Xác suất có ít nhất một hệ thống báo động:
          $ P = 1 - 0.002 = 0.998 $
    ]
)

// TN 12 (Bảo lãnh viện phí bảo hiểm y tế)
#tn([Một nhóm gồm $4$ người đồng nghiệp cùng mua bảo hiểm y tế cao cấp. Xác suất phải nằm viện điều trị trong năm của mỗi người là $0.10$ độc lập. Xác suất để trong năm có đúng $2$ người phải nằm viện điều trị bằng],
    (
        True([$0.0486$]),
        [$0.0500$],
        [$0.0090$],
        [$0.0100$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức phân bố nhị thức với $n = 4, k = 2, p = 0.10$:
        $ P(X = 2) = C_4^2 (0.10)^2 (0.90)^2 = 6 times 0.01 times 0.81 = 0.0486 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân tích sinh tồn cặp vợ chồng)
#ds([Theo thống kê bảo hiểm, xác suất một người $30$ tuổi sống thêm $10$ năm nữa là $0.992$. Hai vợ chồng $30$ tuổi có tình trạng sức khỏe độc lập.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Xác suất một người qua đời trong vòng $10$ năm tới bằng $0.008$.]),
    True([Xác suất cả hai vợ chồng cùng sống thọ thêm ít nhất $10$ năm bằng $(0.992)^2 approx 0.9841$.]),
    True([Xác suất cả hai vợ chồng cùng qua đời trong vòng $10$ năm tới bằng $0.000064$.]),
    [Xác suất có đúng một người qua đời trong $10$ năm tới lớn hơn $0.10$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Thống kê sinh tồn])
    - Qua đời: $1 - 0.992 = 0.008$. Mệnh đề a ĐÚNG.
    - Cả hai sống: $(0.992)^2 approx 0.9841$. Mệnh đề b ĐÚNG.
    - Cả hai mất: $(0.008)^2 = 0.000064$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Đúng 1 người qua đời])
    $2(0.992)(0.008) = 0.015872 < 0.10$. Khẳng định lớn hơn $0.10$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Danh mục đầu tư 5 cổ phiếu)
#ds([Xét danh mục đầu tư gồm $5$ cổ phiếu độc lập có xác suất giảm giá trong quý là $p = 0.10$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Xác suất tất cả $5$ cổ phiếu đều không giảm giá bằng $(0.90)^5 approx 0.5905$.]),
    True([Xác suất có đúng một cổ phiếu bị giảm giá bằng $0.32805$.]),
    True([Xác suất có ít nhất một cổ phiếu bị giảm giá bằng $1 - (0.90)^5 approx 0.4095$.]),
    [Xác suất cả $5$ cổ phiếu đều bị giảm giá lớn hơn $0.001$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Phân bố nhị thức])
    - Cả 5 không giảm: $(0.9)^5 = 0.59049$. Mệnh đề a ĐÚNG.
    - Đúng 1 cổ phiếu giảm: $C_5^1 (0.1)(0.9)^4 = 0.32805$. Mệnh đề b ĐÚNG.
    - Ít nhất 1 giảm: $1 - 0.59049 = 0.40951$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Cả 5 giảm])
    $(0.1)^5 = 0.00001 < 0.001$. Khẳng định lớn hơn là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Thiên tai bão lũ trong 3 năm)
#ds([Xét chuỗi $3$ năm liên tiếp với xác suất xảy ra bão lớn mỗi năm độc lập là $p = 0.20$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Xác suất cả $3$ năm đều không xảy ra bão lớn bằng $0.512$.]),
    True([Xác suất cả $3$ năm đều xảy ra bão lớn bằng $0.008$.]),
    True([Xác suất có ít nhất một năm xảy ra bão lớn bằng $0.488$.]),
    [Xác suất có đúng $2$ năm xảy ra bão lớn bằng $0.200$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Xác suất bão lũ])
    - 3 năm yên bình: $(0.8)^3 = 0.512$. Mệnh đề a ĐÚNG.
    - 3 năm bão: $(0.2)^3 = 0.008$. Mệnh đề b ĐÚNG.
    - Ít nhất 1 năm bão: $1 - 0.512 = 0.488$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Đúng 2 năm bão])
    $C_3^2 (0.2)^2 (0.8) = 3(0.04)(0.8) = 0.096 != 0.200$. Mệnh đề d SAI.
  ]
)

// DS 4 (Chọn trái phiếu xếp hạng)
#ds([Một quỹ tài chính có $4$ trái phiếu AAA và $6$ trái phiếu AA. Chọn ngẫu nhiên $3$ trái phiếu.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số cách chọn $3$ trái phiếu bất kỳ bằng $120$.]),
    True([Số cách chọn $3$ trái phiếu toàn hạng AAA bằng $4$.]),
    True([Xác suất chọn được $3$ trái phiếu có cả hai hạng bằng $4 / 5$.]),
    [Xác suất chọn được $3$ trái phiếu toàn hạng AA bằng $1 / 2$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Phân loại trái phiếu])
    - Không gian mẫu: $C_10^3 = 120$. Mệnh đề a ĐÚNG.
    - Toàn AAA: $C_4^3 = 4$. Mệnh đề b ĐÚNG.
    - Có cả hai hạng: $96 / 120 = 4 / 5$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Toàn AA])
    $C_6^3 / 120 = 20 / 120 = 1 / 6 != 1 / 2$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Hai người $30$ tuổi độc lập có xác suất sống thọ $10$ năm là $0.992$. Tính xác suất cả hai người cùng sống thọ thêm $10$ năm.],
    [0.9841],
    loigiai: [
        #step([Tích xác suất])
        $ (0.992)^2 approx 0.9841 $
    ]
)

// TLN 2
#tln([Một danh mục $5$ cổ phiếu độc lập có xác suất giảm giá là $0.10$. Tính xác suất có đúng $1$ cổ phiếu bị giảm giá.],
    [0.3281],
    loigiai: [
        #step([Nhị thức Bernoulli])
        $ C_5^1 (0.1)(0.9)^4 approx 0.3281 $
    ]
)

// TLN 3
#tln([Hai chuyến bay độc lập có xác suất chậm chuyến là $0.15$. Tính xác suất có ít nhất một chuyến bị chậm chuyến.],
    [0.2775],
    loigiai: [
        #step([Biến cố đối])
        $ 1 - (0.85)^2 = 0.2775 $
    ]
)

// TLN 4
#tln([Ba năm liên tiếp có xác suất bão lớn mỗi năm là $0.20$. Tính xác suất có ít nhất một năm xảy ra bão lớn.],
    [0.488],
    loigiai: [
        #step([Biến cố đối])
        $ 1 - (0.8)^3 = 0.488 $
    ]
)

// TLN 5
#tln([Chọn $3$ trái phiếu từ rổ $10$ trái phiếu ($4$ hạng AAA, $6$ hạng AA). Tính xác suất chọn được cả hai hạng (dưới dạng phân số tối giản).],
    [4/5],
    loigiai: [
        #step([Tính xác suất])
        $ 96 / 120 = 4 / 5 $
    ]
)

// TLN 6
#tln([Hai hệ thống báo cháy độc lập có xác suất hoạt động là $0.96$ và $0.95$. Tính xác suất có ít nhất một hệ thống báo động khi có khói.],
    [0.998],
    loigiai: [
        #step([Biến cố đối])
        $ 1 - (0.04)(0.05) = 0.998 $
    ]
)

] // end make-questions

#make-questions()
