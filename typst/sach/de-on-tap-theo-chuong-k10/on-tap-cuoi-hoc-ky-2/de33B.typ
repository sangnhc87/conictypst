#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0d9488") // Teal

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "ĐỀ ÔN TẬP KIỂM TRA CUỐI HỌC KỲ II",
  exam-title: "ĐỀ KIỂM TRA ĐÁNH GIÁ CUỐI HỌC KỲ II - TOÁN 10 (ĐỀ SỐ 33B)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "201",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Quỹ đạo bóng ném)
#tn([Một quả bóng được sút lên từ mặt đất với quỹ đạo chuyển động có dạng đường cong parabol $y = -0.05 x^2 + 1.2 x$ trong mặt phẳng tọa độ $O x y$ (với $x, y$ tính bằng mét). Tầm bay xa tối đa của quả bóng tính từ vị trí sút bóng ($x = 0$) đến khi chạm đất là],
    (
        True([$24" m"$]),
        [$12" m"$],
        [$7.2" m"$],
        [$48" m"$]
    ),
    loigiai: [
        *Phương pháp giải:* Tìm giao điểm của parabol với trục hoành $y = 0$:
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((-0.5, 0), (5.5, 0), stroke: 0.8pt, mark: (end: ">"))
          content((5.4, -0.25), [$x" (m)"$])
          line((0, -0.4), (0, 2.5), stroke: 0.8pt, mark: (end: ">"))
          content((-0.3, 2.3), [$y" (m)"$])
          content((-0.2, -0.2), [$O$])

          // Parabol quỹ đạo: x in [0; 24] -> vẽ thu nhỏ tỉ lệ chia 5
          line(..range(0, 241).map(t => {
            let x = t / 10;
            (x / 5, (-0.05 * calc.pow(x, 2) + 1.2 * x) / 4)
          }), stroke: 1.2pt + accent)

          circle((4.8, 0), radius: 0.05, fill: accent)
          content((4.8, -0.3), [$24$])
        })
        ]
        - Khi bóng chạm đất thì độ cao $y = 0$:
        $ -0.05 x^2 + 1.2 x = 0 <=> x(-0.05 x + 1.2) = 0 <=> cases(x = 0, x = 1.2 / 0.05 = 24) $
        Vậy tầm bay xa của quả bóng là $24" m"$.
    ]
)

// TN 2 (Điểm hòa vốn trong kinh tế)
#tn([Một doanh nghiệp sản xuất linh kiện có hàm tổng doanh thu $R(x) = -2x^2 + 120x$ và hàm tổng chi phí $C(x) = 20x + 800$ (đơn vị: triệu đồng, với $x$ là sản lượng tính bằng tấn, $0 < x < 50$). Khoảng sản lượng $x$ để doanh nghiệp không bị lỗ (lợi nhuận $L(x) = R(x) - C(x) >= 0$) là],
    (
        True([$10 <= x <= 40$]),
        [$x <= 10$ hoặc $x >= 40$],
        [$x >= 25$],
        [$0 < x <= 25$]
    ),
    loigiai: [
        *Phương pháp giải:* Giải bất phương trình bậc hai $L(x) >= 0$:
        - Hàm lợi nhuận:
        $ L(x) = R(x) - C(x) = (-2x^2 + 120x) - (20x + 800) = -2x^2 + 100x - 800 $
        - Doanh nghiệp không bị lỗ khi $L(x) >= 0$:
        $ -2x^2 + 100x - 800 >= 0 <=> x^2 - 50x + 400 <= 0 <=> (x - 10)(x - 40) <= 0 $
        Suy ra $10 <= x <= 40$.
    ]
)

// TN 3 (Chuyển động thẳng đều của tàu biển)
#tn([Một tàu đánh cá xuất phát từ vị trí $A(2; 3)$ trong mặt phẳng tọa độ $O x y$ và di chuyển thẳng đều với vectơ vận tốc không đổi $vec(v) = (4; 3)$ (đơn vị: hải lý/giờ). Phương trình tham số chuyển động của con tàu (với thời gian $t >= 0$ tính bằng giờ) là],
    (
        True([$cases(x = 2 + 4t, y = 3 + 3t)$]),
        [$cases(x = 4 + 2t, y = 3 + 3t)$],
        [$cases(x = 2 + 3t, y = 3 + 4t)$],
        [$cases(x = 2 - 4t, y = 3 - 3t)$]
    ),
    loigiai: [
        *Phương pháp giải:* Đường thẳng chuyển động đi qua điểm $A(2; 3)$ và có vectơ chỉ phương $vec(u) = vec(v) = (4; 3)$:
        $ cases(x = x_0 + u_1 t, y = y_0 + u_2 t) <=> cases(x = 2 + 4t, y = 3 + 3t) $
    ]
)

// TN 4 (Bán kính phủ sóng trạm phát Wi-Fi)
#tn([Một trạm phát sóng Wi-Fi công cộng đặt tại điểm $T(3; 4)$ trong mặt phẳng tọa độ $O x y$ có bán kính phủ sóng hiệu dụng là $R = 5" km"$. Một người sử dụng máy tính bảng đang ở vị trí $M(7; 1)$. Vị trí của người dùng đối với vùng phủ sóng là],
    (
        True([$T M = 5" km"$, người dùng ở ngay trên đường biên vùng phủ sóng]),
        [$T M = 7" km"$, người dùng nằm ngoài vùng phủ sóng],
        [$T M = 4" km"$, người dùng nằm sâu trong vùng phủ sóng],
        [$T M = 25" km"$, người dùng mất hoàn toàn tín hiệu sóng]
    ),
    loigiai: [
        *Phương pháp giải:* Tính khoảng cách hai điểm $T$ và $M$:
        $ T M = sqrt{(7 - 3)^2 + (1 - 4)^2} = sqrt{4^2 + (-3)^2} = sqrt{16 + 9} = 5" km" $
        Vì $T M = R = 5" km"$, người dùng nằm ngay trên đường biên ranh giới của vùng phủ sóng.
    ]
)

// TN 5 (Tiêu điểm chảo parabol)
#tn([Mặt cắt của một chảo anten parabol thu sóng truyền hình vệ tinh có phương trình chính tắc $y^2 = 16x$ ($x, y$ tính bằng centimet). Vị trí tối ưu để gắn đầu thu sóng là tại tiêu điểm $F$ của parabol. Tọa độ của tiêu điểm $F$ là],
    (
        True([$F(4; 0)$]),
        [$F(8; 0)$],
        [$F(2; 0)$],
        [$F(0; 4)$]
    ),
    loigiai: [
        *Phương pháp giải:* Parabol chính tắc $y^2 = 2p x$ có tham số tiêu $p$ và tiêu điểm $F(p/2; 0)$:
        - Ta có $2p = 16 <=> p = 8$.
        - Tọa độ tiêu điểm: $F(p/2; 0) = F(4; 0)$.
    ]
)

// TN 6 (Quỹ đạo vệ tinh elip)
#tn([Một vệ tinh nhân tạo quay quanh Trái Đất theo quỹ đạo elip $(E)$ có độ dài trục lớn là $18000" km"$ và độ dài trục nhỏ là $12000" km"$. Nửa tiêu cự $c$ của quỹ đạo elip này bằng],
    (
        True([$3000sqrt{5}" km"$]),
        [$6000" km"$],
        [$9000" km"$],
        [$15000" km"$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng hệ thức elip $c = sqrt{a^2 - b^2}$:
        - Bán trục lớn: $a = 18000 / 2 = 9000" km"$.
        - Bán trục nhỏ: $b = 12000 / 2 = 6000" km"$.
        - Nửa tiêu cự:
        $ c = sqrt{9000^2 - 6000^2} = sqrt{81 times 10^6 - 36 times 10^6} = sqrt{45 times 10^6} = 3000sqrt{5}" km" $
    ]
)

// TN 7 (Mật khẩu OTP ngân hàng)
#tn([Một hệ thống giao dịch ngân hàng tạo mã xác thực OTP gồm $6$ ký tự số từ tập hợp ${0, 1, 2, ..., 9}$. Có bao nhiêu mã OTP có chữ số đầu tiên khác $0$ và hai chữ số đứng cạnh nhau luôn khác nhau?],
    (
        True([$531441$]),
        [$1000000$],
        [$900000$],
        [$151200$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng quy tắc nhân cho từng vị trí ký tự:
        - Ký tự thứ 1: chọn từ ${1, 2, ..., 9}$ có $9$ cách.
        - Ký tự thứ 2: khác ký tự thứ 1 nên có $10 - 1 = 9$ cách.
        - Tương tự, mỗi ký tự thứ 3, 4, 5, 6 đều có $9$ cách chọn (khác ký tự liền trước).
        - Tổng số mã thỏa mãn:
        $ 9 times 9 times 9 times 9 times 9 times 9 = 9^6 = 531441 $
    ]
)

// TN 8 (Lịch trực ca bệnh viện)
#tn([Một phòng cấp cứu bệnh viện có $8$ bác sĩ và $12$ điều dưỡng. Mỗi ca trực đêm cần phân công $2$ bác sĩ và $3$ điều dưỡng. Số cách phân công một ca trực đêm là],
    (
        True([$6160$]),
        [$248$],
        [$31360$],
        [$15504$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng quy tắc nhân và tổ hợp:
        - Chọn $2$ bác sĩ từ $8$ bác sĩ: $C_8^2 = 28$ cách.
        - Chọn $3$ điều dưỡng từ $12$ điều dưỡng: $C_{12}^3 = 220$ cách.
        - Tổng số cách lập ca trực:
        $ 28 times 220 = 6160 text(" cách") $
    ]
)

// TN 9 (Đóng góp nhị thức Newton)
#tn([Khai triển $(1 + r)^4 = 1 + 4r + 6r^2 + 4r^3 + r^4$. Với mức lãi suất $r = 0.05$, số hạng bậc một $4r$ đóng góp xấp xỉ bao nhiêu phần trăm vào tổng mức tăng trưởng lũy kế $(1 + r)^4 - 1 approx 0.2155$?],
    (
        True([$92.8\%$]),
        [$80.0\%$],
        [$50.0\%$],
        [$99.9\%$]
    ),
    loigiai: [
        *Phương pháp giải:* So sánh tỷ số số hạng bậc một với tổng mức tăng:
        - Giá trị số hạng bậc một: $4 times 0.05 = 0.20$.
        - Mức tăng lũy kế: $(1.05)^4 - 1 approx 0.2155$.
        - Tỷ lệ đóng góp:
        $ (0.20) / (0.2155) times 100\% approx 92.8\% $
    ]
)

// TN 10 (Độ tin cậy máy chủ mạng)
#tn([Một máy chủ đám mây có hai cụm lưu trữ độc lập song song. Xác suất cụm 1 gặp sự cố là $0.02$, cụm 2 gặp sự cố là $0.03$. Xác suất để hệ thống vẫn đảm bảo an toàn truy cập (ít nhất một cụm hoạt động bình thường) là],
    (
        True([$0.9994$]),
        [$0.9500$],
        [$0.9990$],
        [$0.0006$]
    ),
    loigiai: [
        *Phương pháp giải:* Biến cố đối: cả hai cụm cùng gặp sự cố đồng thời.
        - Xác suất cả hai cụm cùng hỏng: $(0.02) times (0.03) = 0.0006$.
        - Xác suất hệ thống an toàn:
        $ P = 1 - 0.0006 = 0.9994 $
    ]
)

// TN 11 (Chọn ngẫu nhiên sản phẩm)
#tn([Một kiện hàng gồm $10$ sản phẩm trong đó có $2$ sản phẩm bị lỗi bao bì. Lấy ngẫu nhiên đồng thời $2$ sản phẩm từ kiện hàng. Xác suất để cả $2$ sản phẩm lấy ra đều có bao bì hoàn hảo bằng],
    (
        True([$28 / 45$]),
        [$8 / 10$],
        [$1 / 5$],
        [$17 / 45$]
    ),
    loigiai: [
        *Phương pháp giải:* Tính xác suất cổ điển:
        - Không gian mẫu: $n(Omega) = C_{10}^2 = 45$.
        - Số sản phẩm tốt là $8$. Số cách chọn $2$ sản phẩm tốt: $C_8^2 = 28$.
        - Xác suất cần tìm:
        $ P = 28 / 45 approx 0.6222 $
    ]
)

// TN 12 (Ném bóng rổ độc lập)
#tn([Một vận động viên thực hiện $3$ quả ném phạt bóng rổ độc lập, mỗi quả ném đều có xác suất vào rổ thành công là $0.75$. Xác suất để vận động viên ném vào rổ đúng $2$ quả xấp xỉ bằng],
    (
        True([$0.4219$]),
        [$0.7500$],
        [$0.5625$],
        [$0.1406$]
    ),
    loigiai: [
        *Phương pháp giải:* Công thức xác suất nhị thức với $n = 3, k = 2, p = 0.75$:
        $ P(X = 2) = C_3^2 times (0.75)^2 times (1 - 0.75)^1 = 3 times 0.5625 times 0.25 = 0.421875 approx 0.4219 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Mô hình quỹ đạo đạn pháo trong Vật lý)
#ds([Một khẩu pháo đặt tại vị trí có độ cao $15" m"$ so với mặt đất bằng phẳng bắn một viên đạn với phương trình quỹ đạo parabol $y = -0.01 x^2 + 0.6 x + 15$ trong mặt phẳng tọa độ $O x y$ ($x$ là khoảng cách ngang tính từ vị trí bắn, $y$ là độ cao viên đạn, cả hai tính bằng mét).
Xét tính đúng sai của các nhận định sau:],
    (
        True([Độ cao ban đầu của viên đạn tại thời điểm bắn ($x = 0$) là $15" m"$.]),
        True([Đỉnh quỹ đạo của viên đạn đạt được tại vị trí cách vị trí bắn theo phương ngang là $x = 30" m"$, với độ cao cực đại là $24" m"$.]),
        True([Tầm xa của viên đạn khi rơi chạm mặt đất ($y = 0$) xấp xỉ bằng $80.83" m"$.]),
        [Tại vị trí cách vị trí bắn $50" m"$ theo phương ngang, viên đạn đang ở độ cao lớn hơn $22" m"$.]
    ),
    loigiai: [
        *Phương pháp giải:* Khảo sát quỹ đạo ném bằng hàm số bậc hai:
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((-0.5, 0), (6, 0), stroke: 0.8pt, mark: (end: ">"))
          content((5.8, -0.25), [$x" (m)"$])
          line((0, -0.4), (0, 3.2), stroke: 0.8pt, mark: (end: ">"))
          content((-0.25, 3.0), [$y" (m)"$])
          content((-0.2, -0.2), [$O$])

          // Quỹ đạo parabol y = -0.01 x^2 + 0.6 x + 15: vẽ thu nhỏ chia 15 cho x, chia 10 cho y
          line(..range(0, 81).map(t => {
            let x = t * 1.0;
            (x / 16, (-0.01 * calc.pow(x, 2) + 0.6 * x + 15) / 10)
          }), stroke: 1.2pt + accent)

          // Đỉnh (30; 24) -> (30/16, 2.4)
          circle((30/16, 2.4), radius: 0.05, fill: accent)
          content((30/16, 2.7), [$I(30; 24)$])
        })
        ]
        #step([Xét ý a: Độ cao ban đầu])
        - Tại $x = 0$, $y = 15" m"$. Mệnh đề a ĐÚNG.
        #step([Xét ý b: Đỉnh parabol])
        - Hoành độ đỉnh: $x_I = -0.6 / (2 times (-0.01)) = 30" m"$.
        - Độ cao lớn nhất: $y_I = -0.01(30)^2 + 0.6(30) + 15 = -9 + 18 + 15 = 24" m"$. Mệnh đề b ĐÚNG.
        #step([Xét ý c: Tầm xa khi chạm đất])
        - Giải phương trình $y = 0 <=> -0.01 x^2 + 0.6 x + 15 = 0 <=> x^2 - 60x - 1500 = 0$.
        - Nghiệm dương: $x = (60 + sqrt{3600 + 6000}) / 2 = 30 + 10sqrt{15} approx 80.83" m"$. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Độ cao tại x = 50 m])
        - Tại $x = 50$: $y = -0.01(50)^2 + 0.6(50) + 15 = -25 + 30 + 15 = 20" m" < 22" m"$. Khẳng định lớn hơn $22" m"$ là SAI. Mệnh đề d SAI.
    ]
)

// DS 2 (Câu 14 - Vùng phủ sóng Radar không lưu)
#ds([Một trạm radar kiểm soát không lưu đặt tại gốc tọa độ $O(0; 0)$ có bán kính quét phát hiện mục tiêu tối đa là $R = 50" km"$. Một máy bay thương mại bay theo đường bay thẳng $d: 3x - 4y + 120 = 0$.
Xét tính đúng sai của các nhận định sau:],
    (
        True([Đường biên vùng quét của trạm radar là đường tròn $(C): x^2 + y^2 = 2500$.]),
        True([Khoảng cách ngắn nhất từ trạm radar $O$ đến đường bay $d$ của máy bay bằng $24" km"$.]),
        True([Máy bay đi xuyên qua vùng phủ sóng của radar và độ dài đoạn đường bay nằm trong vùng phát hiện bằng $87.73" km"$.]),
        [Khoảng cách từ trạm radar đến máy bay luôn không đổi trong suốt hành trình bay.]
    ),
    loigiai: [
        *Phương pháp giải:* Ứng dụng khoảng cách và vị trí tương đối giữa đường thẳng và đường tròn:
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 2.0, stroke: 1.2pt + accent)
          circle((0, 0), radius: 0.05, fill: accent)
          content((0, -0.3), [$O$])

          // Đường bay d cách O một đoạn 24/50 * 2 = 0.96
          line((-2.2, 1.8), (2.2, -0.5), stroke: 1pt + red)
          content((1.8, 0.2), [$d$])
          line((0, 0), (-0.48, 0.64), stroke: (dash: "dashed", paint: gray))
          content((-0.7, 0.35), [$24$])
        })
        ]
        #step([Xét ý a: Phương trình đường tròn phủ sóng])
        - Tâm $O(0; 0)$ bán kính $R = 50 => x^2 + y^2 = 50^2 = 2500$. Mệnh đề a ĐÚNG.
        #step([Xét ý b: Khoảng cách ngắn nhất])
        - $d(O, d) = (|3(0) - 4(0) + 120|) / sqrt{3^2 + (-4)^2} = 120 / 5 = 24" km"$. Mệnh đề b ĐÚNG.
        #step([Xét ý c: Độ dài đoạn đường bay trong vùng phủ sóng])
        - Vì $d(O, d) = 24 < R = 50$, máy bay đi qua vùng quét.
        - Độ dài đoạn dây cung:
        $ L = 2 sqrt{R^2 - d^2} = 2 sqrt{50^2 - 24^2} = 2 sqrt{2500 - 576} = 2 sqrt{1924} approx 87.73" km" $
        Mệnh đề c ĐÚNG.
        #step([Xét ý d: Khoảng cách khi máy bay di chuyển])
        - Do máy bay chuyển động trên đường thẳng $d$, khoảng cách từ $O$ đến máy bay thay đổi liên tục và chỉ đạt cực tiểu bằng $24" km"$ tại hình chiếu vuông góc. Khẳng định không đổi là SAI. Mệnh đề d SAI.
    ]
)

// DS 3 (Câu 15 - Tổ hợp & An ninh mạng)
#ds([Một hệ thống ngân hàng số yêu cầu mật khẩu đăng nhập gồm đúng $8$ ký tự, được chọn từ bảng gồm $26$ chữ cái tiếng Anh in thường và $10$ chữ số từ $0$ đến $9$ (tổng cộng $36$ ký tự).
Xét tính đúng sai của các nhận định sau:],
    (
        True([Tổng số mật khẩu có thể tạo thành là $36^8 approx 2.82 times 10^{12}$.]),
        True([Số mật khẩu chỉ chứa toàn chữ cái in thường là $26^8$.]),
        True([Số mật khẩu bắt buộc phải chứa ít nhất một chữ số bằng $36^8 - 26^8$.]),
        [Xác suất để một mật khẩu được sinh ngẫu nhiên chỉ chứa toàn chữ số lớn hơn $10^{-3}$.]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng quy tắc nhân và biến cố đối trong mã hóa mật khẩu:
        #step([Xét ý a, b, c: Các số lượng cấu hình mật khẩu])
        - Mỗi ký tự có 36 lựa chọn: $36^8$ mật khẩu. Mệnh đề a ĐÚNG.
        - Chỉ toàn chữ cái: $26^8$ mật khẩu. Mệnh đề b ĐÚNG.
        - Chứa ít nhất một chữ số: $36^8 - 26^8$ mật khẩu. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Xác suất toàn chữ số])
        - Số mật khẩu toàn chữ số: $10^8$.
        - Xác suất:
        $ P = 10^8 / 36^8 = (10 / 36)^8 approx 3.7 times 10^{-5} < 10^{-3} $
        Do đó khẳng định lớn hơn $10^{-3}$ là SAI. Mệnh đề d SAI.
    ]
)

// DS 4 (Câu 16 - KCS Bo mạch điện tử)
#ds([Một thùng hàng chứa $20$ bo mạch điện tử, trong đó có $16$ bo mạch đạt chuẩn và $4$ bo mạch có lỗi kỹ thuật hàn chip. Kỹ sư KCS chọn ngẫu nhiên đồng thời $3$ bo mạch để kiểm tra.
Xét tính đúng sai của các nhận định sau:],
    (
        True([Số phần tử của không gian mẫu chọn $3$ bo mạch là $n(Omega) = C_{20}^3 = 1140$.]),
        True([Xác suất để cả $3$ bo mạch được chọn đều đạt chuẩn bằng $28 / 57$.]),
        True([Xác suất để có đúng $1$ bo mạch bị lỗi kỹ thuật bằng $8 / 19$.]),
        [Xác suất để trong $3$ bo mạch được chọn có ít nhất $2$ bo mạch bị lỗi lớn hơn $0.15$.]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng giải tích tổ hợp tính xác suất cổ điển:
        #step([Xét ý a: Không gian mẫu])
        - $n(Omega) = C_{20}^3 = 1140$. Mệnh đề a ĐÚNG.
        #step([Xét ý b: Cả 3 đều đạt chuẩn])
        - Số cách chọn: $C_{16}^3 = 560$.
        - Xác suất: $P = 560 / 1140 = 28 / 57 approx 0.4912$. Mệnh đề b ĐÚNG.
        #step([Xét ý c: Đúng 1 bo mạch lỗi])
        - Số cách chọn 1 lỗi và 2 chuẩn: $C_4^1 times C_{16}^2 = 4 times 120 = 480$.
        - Xác suất: $P = 480 / 1140 = 8 / 19 approx 0.4211$. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Ít nhất 2 bo mạch lỗi])
        - Số cách chọn có từ 2 lỗi trở lên: $C_4^2 times C_{16}^1 + C_4^3 = 6 times 16 + 4 = 100$.
        - Xác suất: $P = 100 / 1140 = 5 / 57 approx 0.0877 < 0.15$. Khẳng định lớn hơn $0.15$ là SAI. Mệnh đề d SAI.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Một quả bóng được sút từ mặt đất có quỹ đạo parabol $y = -0.05 x^2 + 1.2 x$ (với $x, y$ tính bằng mét). Tính khoảng cách bay xa tối đa của quả bóng khi chạm đất (mét).],
    [24],
    loigiai: [
        *Phương pháp giải:* Tìm nghiệm dương của $y = 0$:
        #step([Giải phương trình])
        $ -0.05 x^2 + 1.2 x = 0 <=> x = 1.2 / 0.05 = 24 $
    ]
)

// TLN 2 (Câu 18)
#tln([Một công ty có hàm lợi nhuận theo sản lượng $x$ (tấn) là $L(x) = -2x^2 + 120x - 1000$ (triệu đồng). Tìm mức sản lượng $x$ (tấn) để lợi nhuận thu được đạt giá trị lớn nhất.],
    [30],
    loigiai: [
        *Phương pháp giải:* Tìm hoành độ đỉnh của parabol:
        #step([Tính tọa độ đỉnh])
        $ x = -120 / (2 times (-2)) = 30 $
    ]
)

// TLN 3 (Câu 19)
#tln([Trạm kiểm soát không lưu đặt tại gốc tọa độ $O(0; 0)$. Một máy bay di chuyển theo đường thẳng $3x - 4y + 120 = 0$. Tính khoảng cách ngắn nhất từ trạm kiểm soát đến đường bay của máy bay (km).],
    [24],
    loigiai: [
        *Phương pháp giải:* Công thức khoảng cách từ điểm đến đường thẳng:
        #step([Tính khoảng cách])
        $ d = (|120|) / sqrt{3^2 + (-4)^2} = 120 / 5 = 24 $
    ]
)

// TLN 4 (Câu 20)
#tln([Trong khai triển nhị thức Newton của $(x + 2)^5$, tìm hệ số của số hạng chứa $x^2$.],
    [80],
    loigiai: [
        *Phương pháp giải:* Công thức số hạng tổng quát của nhị thức:
        #step([Tính hệ số])
        - Số hạng chứa $x^2$ ứng với $k = 3$:
        $ C_5^3 times x^2 times 2^3 = 10 times 8 times x^2 = 80 x^2 $
        Vậy hệ số là $80$.
    ]
)

// TLN 5 (Câu 21)
#tln([Một kiện hàng gồm $8$ sản phẩm tốt và $2$ sản phẩm có khuyết tật. Chọn ngẫu nhiên đồng thời $2$ sản phẩm. Tính xác suất để cả $2$ sản phẩm được chọn đều là sản phẩm tốt (viết kết quả dưới dạng phân số tối giản $a/b$).],
    [28/45],
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức tổ hợp cổ điển:
        #step([Tính xác suất])
        $ P = (C_8^2) / (C_{10}^2) = 28 / 45 $
    ]
)

// TLN 6 (Câu 22)
#tln([Hai hệ thống máy chủ dự phòng độc lập có xác suất hỏng hóc trong tháng lần lượt là $0.02$ và $0.03$. Tính xác suất để hệ thống duy trì hoạt động an toàn (có ít nhất một máy chủ hoạt động, viết kết quả dưới dạng số thập phân).],
    [0.9994],
    loigiai: [
        *Phương pháp giải:* Áp dụng phương pháp biến cố đối:
        #step([Biến cố đối])
        $ P = 1 - (0.02) times (0.03) = 1 - 0.0006 = 0.9994 $
    ]
)

]

#make-questions()
