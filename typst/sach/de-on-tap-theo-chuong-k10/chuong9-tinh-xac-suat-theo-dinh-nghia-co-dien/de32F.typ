#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("7c3aed") // Violet

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG IX: TÍNH XÁC SUẤT THEO ĐỊNH NGHĨA CỔ ĐIỂN",
  exam-title: "CHUYÊN ĐỀ THỰC TẾ: KIỂM THỬ CHẤT LƯỢNG SẢN PHẨM, Y TẾ & DỊCH TỄ HỌC (ĐỀ SỐ 32F)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "199",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Độ đặc hiệu và dương tính giả)
#tn([Một que test nhanh kháng nguyên virus có độ nhạy $95\%$ (người có bệnh test dương tính với xác suất $0.95$) và độ đặc hiệu $98\%$ (người không có bệnh test âm tính với xác suất $0.98$). Một người hoàn toàn khỏe mạnh (không mang mầm bệnh) đi thực hiện test nhanh này. Xác suất để người đó nhận kết quả xét nghiệm dương tính giả là],
    (
        True([$0.02$]),
        [$0.05$],
        [$0.95$],
        [$0.98$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng định nghĩa biến cố đối trong đánh giá độ đặc hiệu y khoa:
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (6, 1.3), fill: rgb("ede9fe"), stroke: 1.2pt + accent)
          content((3, 0.65), [Người khỏe mạnh: Âm tính ($0.98$) | Dương tính giả ($1 - 0.98 = 0.02$)])
        })
        ]
        Đối với người không có bệnh, kết quả xét nghiệm chỉ có thể là âm tính (đúng) hoặc dương tính (dương tính giả). Do độ đặc hiệu là $98\% = 0.98$, xác suất nhận kết quả dương tính giả là:
        $ P = 1 - 0.98 = 0.02 $
    ]
)

// TN 2 (Kiểm tra KCS chọn linh kiện)
#tn([Một lô hàng gồm $50$ linh kiện vi mạch điện tử, trong đó có đúng $4$ linh kiện bị lỗi kỹ thuật. Kỹ sư kiểm soát chất lượng (KCS) chọn ngẫu nhiên đồng thời $3$ linh kiện để kiểm tra. Xác suất để cả $3$ linh kiện được chọn đều không bị lỗi kỹ thuật là],
    (
        True([$759 / 980$]),
        [$46 / 50$],
        [$3 / 50$],
        [$221 / 980$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức tính xác suất cổ điển thông qua tổ hợp:
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (2.8, 1.2), fill: rgb("f3e8ff"), stroke: 1pt + accent)
          content((1.4, 0.6), [$46$ Tốt])
          rect((3.2, 0), (5.5, 1.2), fill: rgb("fee2e2"), stroke: 1pt + red)
          content((4.35, 0.6), [$4$ Lỗi])
        })
        ]
        - Số phần tử không gian mẫu: $n(Omega) = C_{50}^3 = 19600$.
        - Số cách chọn $3$ linh kiện đạt chuẩn từ $46$ linh kiện tốt: $n(A) = C_{46}^3 = 15180$.
        - Xác suất cần tìm:
        $ P(A) = (C_{46}^3) / (C_{50}^3) = 15180 / 19600 = 759 / 980 approx 0.7745 $
    ]
)

// TN 3 (Dây chuyền 2 trạm kiểm soát độc lập)
#tn([Một sản phẩm vi cơ điện tử sau khi lắp ráp phải đi qua hai trạm kiểm soát chất lượng độc lập. Trạm thứ nhất có xác suất phát hiện sản phẩm lỗi là $0.90$, trạm thứ hai có xác suất phát hiện lỗi là $0.85$. Nếu một sản phẩm bị lỗi đi qua dây chuyền, xác suất để sản phẩm lỗi này bị phát hiện bởi ít nhất một trạm kiểm soát là],
    (
        True([$0.985$]),
        [$0.765$],
        [$0.900$],
        [$0.015$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp biến cố đối: cả hai trạm đều bỏ sót sản phẩm lỗi.
        - Xác suất trạm 1 bỏ sót lỗi: $1 - 0.90 = 0.10$.
        - Xác suất trạm 2 bỏ sót lỗi: $1 - 0.85 = 0.15$.
        - Vì hai trạm hoạt động độc lập, xác suất cả hai cùng bỏ sót:
        $ P(macron(A)) = (0.10) times (0.15) = 0.015 $
        - Xác suất lỗi bị phát hiện bởi ít nhất một trạm:
        $ P(A) = 1 - 0.015 = 0.985 $
    ]
)

// TN 4 (Dịch tễ học lây nhiễm gia đình)
#tn([Trong một đợt bùng phát dịch cúm mùa, xác suất một người nhiễm bệnh lây truyền cho một thành viên sống cùng nhà khi tiếp xúc gần là $0.30$. Xét một gia đình có $3$ thành viên cùng tiếp xúc với một ca nhiễm và việc lây nhiễm giữa các thành viên là độc lập. Xác suất để có ít nhất một thành viên trong gia đình bị lây bệnh bằng],
    (
        True([$0.657$]),
        [$0.343$],
        [$0.900$],
        [$0.027$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng biến cố đối: không có thành viên nào bị lây nhiễm.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 0.4, fill: rgb("fee2e2"), stroke: 1.2pt + red)
          content((0, 0), [F0])
          line((0.4, 0.3), (2, 0.9), stroke: 1pt + accent, mark: (end: ">"))
          line((0.4, 0), (2, 0), stroke: 1pt + accent, mark: (end: ">"))
          line((0.4, -0.3), (2, -0.9), stroke: 1pt + accent, mark: (end: ">"))
          circle((2.5, 0.9), radius: 0.35, fill: rgb("ede9fe"), stroke: 1pt + accent)
          content((2.5, 0.9), [F1])
          circle((2.5, 0), radius: 0.35, fill: rgb("ede9fe"), stroke: 1pt + accent)
          content((2.5, 0), [F1])
          circle((2.5, -0.9), radius: 0.35, fill: rgb("ede9fe"), stroke: 1pt + accent)
          content((2.5, -0.9), [F1])
        })
        ]
        - Xác suất một thành viên không bị lây nhiễm: $1 - 0.30 = 0.70$.
        - Xác suất cả $3$ thành viên đều không bị lây: $(0.70)^3 = 0.343$.
        - Xác suất có ít nhất một thành viên bị lây:
        $ P = 1 - 0.343 = 0.657 $
    ]
)

// TN 5 (Kiểm định bảo quản vắc-xin)
#tn([Một kho y tế bảo quản $20$ thùng vắc-xin, trong đó có $3$ thùng bị gián đoạn nhiệt độ bảo quản tiêu chuẩn. Đoàn thanh tra chọn ngẫu nhiên $4$ thùng để kiểm tra chất lượng. Xác suất để đoàn thanh tra chọn được đúng $1$ thùng bị gián đoạn nhiệt độ là],
    (
        True([$136 / 323$]),
        [$3 / 20$],
        [$187 / 323$],
        [$3 / 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Dùng tổ hợp tính số biến cố thuận lợi:
        - Số phần tử của không gian mẫu: $n(Omega) = C_{20}^4 = 4845$.
        - Chọn đúng 1 thùng bị lỗi từ 3 thùng lỗi: $C_3^1 = 3$ cách.
        - Chọn 3 thùng đạt chuẩn từ 17 thùng bình thường: $C_{17}^3 = 680$ cách.
        - Số kết quả thuận lợi: $n(A) = 3 times 680 = 2040$.
        $ P(A) = 2040 / 4845 = 136 / 323 approx 0.4211 $
    ]
)

// TN 6 (Tỷ lệ phế phẩm bóng đèn)
#tn([Một nhà máy sản xuất bóng đèn LED với tỷ lệ phế phẩm là $2\%$. Một kỹ sư KCS kiểm tra ngẫu nhiên một hộp chứa $5$ bóng đèn được đóng gói từ dây chuyền. Xác suất để trong hộp có đúng $1$ bóng đèn phế phẩm xấp xỉ bằng],
    (
        True([$0.0922$]),
        [$0.0200$],
        [$0.1000$],
        [$0.9078$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức phân bố nhị thức Bernoulli với $n = 5, k = 1, p = 0.02$:
        $ P(X = 1) = C_5^1 times (0.02)^1 times (1 - 0.02)^{5 - 1} = 5 times 0.02 times (0.98)^4 approx 0.0922 $
    ]
)

// TN 7 (Tỷ lệ kháng thể cộng đồng)
#tn([Tại một cộng đồng dân cư, tỷ lệ người dân đã có kháng thể bảo vệ chống lại một chủng virus là $80\%$. Chọn ngẫu nhiên độc lập $4$ người dân để khảo sát huyết thanh. Xác suất để cả $4$ người này đều đã có kháng thể bảo vệ là],
    (
        True([$0.4096$]),
        [$0.8000$],
        [$0.3200$],
        [$0.5904$]
    ),
    loigiai: [
        *Phương pháp giải:* Quy tắc nhân xác suất cho 4 biến cố độc lập:
        $ P = (0.80)^4 = 0.4096 $
    ]
)

// TN 8 (Màng lọc an toàn sinh học HEPA)
#tn([Một phòng thí nghiệm an toàn sinh học cấp 3 trang bị hệ thống gồm $3$ màng lọc không khí HEPA hoạt động độc lập song song. Mỗi màng lọc ngăn chặn được vi khuẩn thoát ra với xác suất $0.99$. Hệ thống được xem là an toàn nếu có ít nhất một màng lọc hoạt động hiệu quả. Xác suất để hệ thống đảm bảo an toàn tuyệt đối là],
    (
        True([$0.999999$]),
        [$0.990000$],
        [$0.970299$],
        [$0.000001$]
    ),
    loigiai: [
        *Phương pháp giải:* Biến cố đối: cả 3 màng lọc đều gặp sự cố rò rỉ.
        - Xác suất một màng lọc hỏng: $1 - 0.99 = 0.01$.
        - Xác suất cả 3 màng lọc cùng hỏng: $(0.01)^3 = 0.000001 = 10^{-6}$.
        - Xác suất hệ thống an toàn:
        $ P = 1 - 10^{-6} = 0.999999 $
    ]
)

// TN 9 (Pin Lithium hỏng)
#tn([Một bộ $12$ khối pin Lithium chuyên dụng của thiết bị y tế có đúng $2$ khối pin bị suy giảm dung lượng. Kỹ thuật viên đo kiểm tra lần lượt từng khối pin (không hoàn lại) cho đến khi tìm thấy khối pin suy giảm dung lượng đầu tiên. Xác suất để khối pin suy giảm dung lượng đầu tiên được phát hiện ở ngay lần đo thứ hai là],
    (
        True([$5 / 33$]),
        [$1 / 6$],
        [$2 / 11$],
        [$5 / 66$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức nhân xác suất tuần tự:
        - Lần 1 đo được pin tốt: xác suất là $10 / 12 = 5 / 6$.
        - Lần 2 đo được pin suy giảm dung lượng (trong số 11 khối pin còn lại): xác suất là $2 / 11$.
        - Xác suất cần tìm:
        $ P = 5 / 6 times 2 / 11 = 10 / 66 = 5 / 33 approx 0.1515 $
    ]
)

// TN 10 (Sàng lọc mẫu gộp y tế Pool Testing)
#tn([Trong xét nghiệm dịch tễ cộng đồng, kỹ thuật xét nghiệm mẫu gộp $5$ người vào một ống nghiệm được áp dụng. Giả sử xác suất một người bất kỳ nhiễm mầm bệnh là $0.01$ và các cá nhân độc lập với nhau. Ống nghiệm gộp chỉ cho kết quả âm tính khi toàn bộ $5$ mẫu thành phần đều âm tính. Xác suất để một ống nghiệm gộp có kết quả âm tính xấp xỉ bằng],
    (
        True([$0.9510$]),
        [$0.9900$],
        [$0.0490$],
        [$0.0500$]
    ),
    loigiai: [
        *Phương pháp giải:* Tính tích xác suất độc lập:
        - Xác suất một người âm tính: $1 - 0.01 = 0.99$.
        - Xác suất cả 5 người cùng âm tính:
        $ P = (0.99)^5 = 0.95099 approx 0.9510 $
    ]
)

// TN 11 (Chẩn đoán hình ảnh 2 bác sĩ)
#tn([Một bác sĩ chuyên khoa chẩn đoán hình ảnh có xác suất phát hiện chính xác khối u nhỏ trên phim chụp CT là $0.92$. Nếu có $2$ bác sĩ độc lập cùng đọc một phim chụp của bệnh nhân có khối u, xác suất để có ít nhất một bác sĩ phát hiện ra khối u là],
    (
        True([$0.9936$]),
        [$0.8464$],
        [$0.9200$],
        [$0.0064$]
    ),
    loigiai: [
        *Phương pháp giải:* Biến cố đối: cả hai bác sĩ đều bỏ sót khối u.
        - Xác suất mỗi bác sĩ bỏ sót: $1 - 0.92 = 0.08$.
        - Xác suất cả hai cùng bỏ sót: $(0.08)^2 = 0.0064$.
        - Xác suất ít nhất một bác sĩ phát hiện được:
        $ P = 1 - 0.0064 = 0.9936 $
    ]
)

// TN 12 (Bao bì kim tiêm vô trùng)
#tn([Một dây chuyền đóng gói kim tiêm y tế vô trùng có tỷ lệ bao bì bị rò rỉ khí là $0.005$. Một hộp kiểm tra gồm $100$ chiếc kim tiêm độc lập. Xác suất để trong hộp không có bất kỳ chiếc kim tiêm nào bị hở bao bì xấp xỉ bằng],
    (
        True([$0.6058$]),
        [$0.5000$],
        [$0.3942$],
        [$0.9950$]
    ),
    loigiai: [
        *Phương pháp giải:* Quy tắc nhân xác suất cho $100$ biến cố độc lập:
        - Xác suất một chiếc kim tiêm đạt chuẩn kín khí: $1 - 0.005 = 0.995$.
        - Xác suất cả 100 chiếc đều kín khí:
        $ P = (0.995)^{100} approx 0.6058 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Kiểm tra AQL màn hình OLED)
#ds([Một lô hàng gồm $100$ màn hình điện thoại OLED xuất khẩu, trong đó qua kiểm định sơ bộ có $8$ màn hình bị lỗi điểm chết. Ban kiểm tra chất lượng chọn ngẫu nhiên một mẫu gồm $4$ màn hình để nghiệm thu lô hàng.
Xét tính đúng sai của các nhận định sau:],
    (
        True([Số phần tử của không gian mẫu chọn ngẫu nhiên $4$ màn hình là $n(Omega) = C_{100}^4 = 3921225$.]),
        True([Số cách chọn được $4$ màn hình đều đạt chuẩn không có điểm chết là $C_{92}^4 = 2794155$.]),
        True([Xác suất để mẫu nghiệm thu không chứa bất kỳ màn hình lỗi nào xấp xỉ bằng $0.7126$.]),
        [Xác suất để trong mẫu nghiệm thu có ít nhất một màn hình bị lỗi điểm chết nhỏ hơn $0.20$.]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng giải tích tổ hợp cho nghiệm thu chất lượng sản phẩm (AQL):
        #step([Xét ý a, b, c: Không gian mẫu và biến cố])
        - Không gian mẫu: $n(Omega) = C_{100}^4 = 3921225$. Mệnh đề a ĐÚNG.
        - Số màn hình tốt: $100 - 8 = 92$. Số cách chọn 4 màn hình tốt: $C_{92}^4 = 2794155$. Mệnh đề b ĐÚNG.
        - Xác suất cả 4 màn hình đều tốt: $P_0 = 2794155 / 3921225 approx 0.7126$. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Biến cố đối])
        - Xác suất có ít nhất một màn hình lỗi: $1 - P_0 = 1 - 0.7126 = 0.2874 > 0.20$. Do đó mệnh đề d SAI.
    ]
)

// DS 2 (Câu 14 - Cây xác suất trong chẩn đoán y tế)
#ds([Một bệnh viện xét nghiệm sàng lọc cho một quần thể có tỷ lệ nhiễm một loại vi khuẩn là $2\%$ ($p = 0.02$). Kỹ thuật xét nghiệm có độ nhạy $98\%$ (người có bệnh test dương tính với xác suất $0.98$) và độ đặc hiệu $95\%$ (người không bệnh test âm tính với xác suất $0.95$). Chọn ngẫu nhiên một người trong quần thể đi xét nghiệm.
Xét tính đúng sai của các nhận định sau:],
    (
        True([Xác suất người được chọn thực sự mắc bệnh và có kết quả xét nghiệm dương tính bằng $0.0196$.]),
        True([Xác suất người được chọn không mắc bệnh nhưng nhận kết quả xét nghiệm dương tính giả bằng $0.0490$.]),
        True([Xác suất để một người bất kỳ khi đi xét nghiệm nhận kết quả dương tính bằng $0.0686$.]),
        [Trong số những người có kết quả xét nghiệm dương tính, xác suất thực sự mắc bệnh lớn hơn $0.50$.]
    ),
    loigiai: [
        *Phương pháp giải:* Dựng sơ đồ nhánh (Cây xác suất) phân tích kết quả xét nghiệm:
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          content((0, 0), [Quần thể])
          line((0.8, 0.4), (2.8, 1.2), stroke: 1pt + accent)
          content((1.8, 1.1), [$0.02$], anchor: "south")
          content((3.5, 1.2), [Bệnh ($0.02$)])

          line((0.8, -0.4), (2.8, -1.2), stroke: 1pt + accent)
          content((1.8, -1.1), [$0.98$], anchor: "north")
          content((3.8, -1.2), [Không bệnh ($0.98$)])

          line((4.5, 1.2), (6.5, 1.7), stroke: 0.8pt)
          content((7.5, 1.7), [Dương ($0.98$)])
          line((4.5, 1.2), (6.5, 0.7), stroke: 0.8pt)
          content((7.5, 0.7), [Âm ($0.02$)])

          line((5, -1.2), (6.5, -0.7), stroke: 0.8pt)
          content((7.5, -0.7), [Dương ($0.05$)])
          line((5, -1.2), (6.5, -1.7), stroke: 0.8pt)
          content((7.5, -1.7), [Âm ($0.95$)])
        })
        ]
        #step([Xét ý a, b, c: Tính các xác suất thành phần])
        - Người mắc bệnh và test dương tính: $P(B inter D) = 0.02 times 0.98 = 0.0196$. Mệnh đề a ĐÚNG.
        - Người không bệnh nhưng test dương tính giả: $P(macron(B) inter D) = 0.98 times 0.05 = 0.0490$. Mệnh đề b ĐÚNG.
        - Tổng xác suất nhận kết quả dương tính: $P(D) = 0.0196 + 0.0490 = 0.0686$. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Giá trị dự đoán dương tính PPV])
        - Xác suất có bệnh khi đã biết test dương tính:
        $ P(B mid D) = 0.0196 / 0.0686 approx 0.2857 < 0.50 $
        Do đó mệnh đề d SAI.
    ]
)

// DS 3 (Câu 15 - Mô hình lây nhiễm tiếp xúc gần F0 - F1)
#ds([Một bệnh nhân F0 tiếp xúc gần với $4$ người lành độc lập trong cùng một không gian kín. Xác suất lây nhiễm mầm bệnh cho mỗi người trong một buổi tiếp xúc là $p = 0.25$.
Xét tính đúng sai của các nhận định sau:],
    (
        True([Xác suất cả $4$ người tiếp xúc đều không bị lây nhiễm mầm bệnh bằng $(0.75)^4 approx 0.3164$.]),
        True([Xác suất có đúng $1$ người bị lây nhiễm mầm bệnh xấp xỉ bằng $0.4219$.]),
        True([Xác suất có ít nhất $1$ người bị lây nhiễm mầm bệnh xấp xỉ bằng $0.6836$.]),
        [Xác suất có ít nhất $2$ người bị lây nhiễm mầm bệnh lớn hơn $0.50$.]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức phân bố Bernoulli với $n = 4, p = 0.25, q = 0.75$:
        #step([Xét ý a, b, c: Các xác suất nhị thức])
        - Không ai nhiễm: $P(X = 0) = (0.75)^4 approx 0.3164$. Mệnh đề a ĐÚNG.
        - Đúng 1 người nhiễm: $P(X = 1) = C_4^1 (0.25)(0.75)^3 approx 0.4219$. Mệnh đề b ĐÚNG.
        - Ít nhất 1 người nhiễm: $P(X >= 1) = 1 - P(X = 0) = 1 - 0.3164 = 0.6836$. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Xác suất có từ 2 người trở lên])
        $ P(X >= 2) = 1 - P(X = 0) - P(X = 1) = 1 - 0.3164 - 0.4219 = 0.2617 < 0.50 $
        Do đó mệnh đề d SAI.
    ]
)

// DS 4 (Câu 16 - Thử nghiệm lâm sàng thuốc mới)
#ds([Một loại thuốc kháng sinh mới được thử nghiệm lâm sàng trên $5$ bệnh nhân độc lập có cùng mức độ bệnh lý. Xác suất điều trị khỏi bệnh thành công của mỗi bệnh nhân là $p = 0.80$.
Xét tính đúng sai của các nhận định sau:],
    (
        True([Xác suất cả $5$ bệnh nhân đều được điều trị khỏi bệnh thành công bằng $(0.8)^5 = 0.32768$.]),
        True([Xác suất không có bệnh nhân nào được điều trị khỏi bệnh bằng $(0.2)^5 = 0.00032$.]),
        True([Xác suất có đúng $4$ bệnh nhân được điều trị khỏi bệnh bằng $C_5^4 (0.8)^4 (0.2)^1 = 0.4096$.]),
        [Xác suất có ít nhất $4$ bệnh nhân được điều trị khỏi bệnh nhỏ hơn $0.70$.]
    ),
    loigiai: [
        *Phương pháp giải:* Phân tích hiệu quả điều trị bằng mô hình nhị thức:
        #step([Xét ý a, b, c: Các trường hợp cơ sở])
        - Khỏi cả 5 người: $P(5) = (0.8)^5 = 0.32768$. Mệnh đề a ĐÚNG.
        - Không ai khỏi: $P(0) = (0.2)^5 = 0.00032$. Mệnh đề b ĐÚNG.
        - Đúng 4 người khỏi: $P(4) = C_5^4 (0.8)^4 (0.2) = 0.4096$. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Xác suất đạt từ 4 người khỏi trở lên])
        $ P(X >= 4) = P(4) + P(5) = 0.4096 + 0.32768 = 0.73728 > 0.70 $
        Do đó mệnh đề d SAI.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Tại một cộng đồng dân cư, tỷ lệ người có kháng thể bảo vệ tự nhiên là $0.80$. Khảo sát ngẫu nhiên $4$ người dân độc lập. Tính xác suất để cả $4$ người này đều đã có kháng thể bảo vệ (viết kết quả dưới dạng số thập phân).],
    [0.4096],
    loigiai: [
        *Phương pháp giải:* Nhân xác suất 4 biến cố độc lập:
        #step([Tính xác suất])
        $ P = (0.80)^4 = 0.4096 $
    ]
)

// TLN 2 (Câu 18)
#tln([Một dây chuyền sản xuất có hai trạm kiểm soát chất lượng độc lập với xác suất phát hiện lỗi lần lượt là $0.90$ và $0.85$. Tính xác suất để một sản phẩm lỗi đi qua dây chuyền bị phát hiện bởi ít nhất một trạm kiểm soát (viết kết quả dưới dạng số thập phân).],
    [0.985],
    loigiai: [
        *Phương pháp giải:* Sử dụng biến cố đối (cả hai trạm đều bỏ sót):
        #step([Biến cố đối])
        $ P = 1 - (1 - 0.90)(1 - 0.85) = 1 - (0.10)(0.15) = 1 - 0.015 = 0.985 $
    ]
)

// TLN 3 (Câu 19)
#tln([Trong một ổ dịch, xác suất lây nhiễm cho mỗi người tiếp xúc gần là $0.30$. Ba người cùng tiếp xúc độc lập với một ca nhiễm. Tính xác suất để có ít nhất một người trong số họ bị lây nhiễm (viết kết quả dưới dạng số thập phân).],
    [0.657],
    loigiai: [
        *Phương pháp giải:* Dùng biến cố đối không có ai bị lây:
        #step([Biến cố đối])
        $ P = 1 - (1 - 0.30)^3 = 1 - (0.70)^3 = 1 - 0.343 = 0.657 $
    ]
)

// TLN 4 (Câu 20)
#tln([Một lô hàng gồm $50$ vi mạch điện tử có đúng $4$ vi mạch bị lỗi. Chọn ngẫu nhiên đồng thời $3$ vi mạch để kiểm định. Tính xác suất để cả $3$ vi mạch được chọn đều không bị lỗi (viết kết quả dưới dạng phân số tối giản $a / b$).],
    [759/980],
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức tổ hợp cổ điển:
        #step([Tính xác suất])
        $ P = (C_{46}^3) / (C_{50}^3) = 15180 / 19600 = 759 / 980 $
    ]
)

// TLN 5 (Câu 21)
#tln([Hệ thống phòng thí nghiệm có $3$ màng lọc HEPA độc lập, mỗi màng lọc ngăn chặn vi sinh vật đạt xác suất $0.99$. Tính xác suất để hệ thống đảm bảo an toàn tuyệt đối (có ít nhất một màng lọc hoạt động hiệu quả, viết dưới dạng số thập phân).],
    [0.999999],
    loigiai: [
        *Phương pháp giải:* Áp dụng biến cố đối cả 3 màng lọc cùng hỏng:
        #step([Biến cố đối])
        $ P = 1 - (1 - 0.99)^3 = 1 - (0.01)^3 = 1 - 0.000001 = 0.999999 $
    ]
)

// TLN 6 (Câu 22)
#tln([Trong xét nghiệm sàng lọc y tế, tỷ lệ người mắc bệnh trong quần thể là $2\%$ ($0.02$). Độ nhạy của test là $98\%$ ($0.98$) và độ đặc hiệu là $95\%$ ($0.95$). Tính xác suất để một người được chọn ngẫu nhiên trong quần thể khi đi xét nghiệm nhận kết quả dương tính (viết kết quả dưới dạng số thập phân).],
    [0.0686],
    loigiai: [
        *Phương pháp giải:* Tính tổng xác suất dương tính thực và dương tính giả:
        #step([Tổng xác suất])
        $ P = (0.02 times 0.98) + (0.98 times 0.05) = 0.0196 + 0.0490 = 0.0686 $
    ]
)

]

#make-questions()
