#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1e293b") // Dark Slate cho Đề 9C

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BA ĐƯỜNG CONIC & ỨNG DỤNG",
  exam-title: "BÀI 3: ỨNG DỤNG THỰC TẾ CỦA BA ĐƯỜNG CONIC (ĐỀ C - VIỄN VỌNG & VDC TỔNG HỢP)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "327",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong hệ thống quang học của kính viễn vọng phản xạ Cassegrain nổi tiếng, gương sơ cấp lớn ở đáy và gương thứ cấp nhỏ phía trước lần lượt là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Primary mirror (parabola) with central hole
    line((-2.0, 1.6), (-2.4, 0.4), stroke: 2pt + rgb("1e293b"))
    line((-2.0, -1.6), (-2.4, -0.4), stroke: 2pt + rgb("1e293b"))
    content((-2.6, 1.2), text(size: 7.5pt, weight: "bold")[Gương sơ cấp])
    // Central hole eyepiece
    rect((-2.8, -0.3), (-2.3, 0.3), fill: rgb("e2e8f0"), stroke: 1pt + rgb("1e293b"))
    content((-3.2, 0), text(size: 7pt)[Thị kính])
    // Secondary mirror (hyperbola)
    line((1.5, 0.6), (1.3, 0), stroke: 2pt + rgb("dc2626"))
    line((1.3, 0), (1.5, -0.6), stroke: 2pt + rgb("dc2626"))
    content((1.8, 0.8), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold")[Gương thứ cấp])
    // Light rays
    line((2.5, 1.4), (-2.1, 1.4), stroke: 1pt + rgb("3b82f6"))
    line((-2.1, 1.4), (1.4, 0.3), stroke: 1pt + rgb("3b82f6"))
    line((1.4, 0.3), (-2.4, 0.05), stroke: 1pt + rgb("3b82f6"), mark: (end: "stealth"))
    line((2.5, -1.4), (-2.1, -1.4), stroke: 1pt + rgb("3b82f6"))
    line((-2.1, -1.4), (1.4, -0.3), stroke: 1pt + rgb("3b82f6"))
    line((1.4, -0.3), (-2.4, -0.05), stroke: 1pt + rgb("3b82f6"), mark: (end: "stealth"))
  })
]
],
    (
        True([Gương Parabol lõm và gương Hypebol lồi]),
        [Gương cầu lõm và gương phẳng],
        [Gương Elip và gương Parabol],
        [Hai gương phẳng đặt đối diện nhau]
    ),
    loigiai: [
        #step([Thiết kế kính viễn vọng Cassegrain])
        Kính thiên văn Cassegrain kết hợp gương sơ cấp dạng Parabol lõm (thu gom chùm sáng song song từ thiên thể hướng tới tiêu điểm $F_1$) và gương thứ cấp dạng Hypebol lồi (phản xạ tia sáng hội tụ về tiêu điểm thứ hai $F_2$ nằm ở lỗ khoét tâm gương sơ cấp).
    ]
)

// TN 2
#tn([Ưu điểm kỹ thuật nổi bật nhất của thiết kế kính viễn vọng kiểu Cassegrain so với các loại kính viễn vọng khúc xạ thông thường là],
    (
        True([Đạt được tiêu cự quang học rất dài trong một thân ống kính nhỏ gọn]),
        [Không cần sử dụng gương phản xạ],
        [Trọng lượng kính tăng lên gấp mười lần],
        [Hình ảnh quan sát luôn bị mờ và lộn ngược]
    ),
    loigiai: [
        #step([Ưu thế của cấu hình Cassegrain])
        Nhờ đường truyền ánh sáng bị gấp khúc qua lại giữa hai gương parabol và hypebol, thân ống kính có thể rất ngắn nhưng tiêu cự tương đương lại rất dài, mang lại độ phóng đại lớn và thiết kế nhỏ gọn, dễ điều khiển.
    ]
)

// TN 3
#tn([Tháp giải nhiệt làm mát (Cooling Tower) trong các nhà máy nhiệt điện và điện hạt nhân thường có bề mặt ngoài được thiết kế theo dạng hình học nào?],
    (
        True([Mặt Hypeboloid tròn xoay]),
        [Mặt nón cụt],
        [Mặt trụ tròn xoay],
        [Mặt cầu hoàn hảo]
    ),
    loigiai: [
        #step([Hình dạng tháp giải nhiệt])
        Tháp giải nhiệt có mặt cắt thẳng đứng là một đường Hypebol, tạo nên mặt tròn xoay gọi là mặt Hypeboloid một tầng. Hình dạng thắt ở giữa giúp tăng tốc độ gió đối lưu tự nhiên (hiệu ứng Venturi) và tạo độ bền cơ học vượt trội cho kết cấu bê tông mỏng.
    ]
)

// TN 4
#tn([Một cổng chào hình parabol có chiều rộng chân cổng ở mặt đất là $W = 8" m"$ và chiều cao tại đỉnh cổng là $H = 6" m"$. Chọn hệ trục tọa độ $O x y$ có gốc $O$ tại tâm đáy cổng (chính giữa hai chân cổng) và trục tung $O y$ là trục đối xứng. Phương trình của đường parabol cổng vòm là],
    (
        True([$y = 6 - (3 / 8) x^2$]),
        [$y = 6 - (3 / 4) x^2$],
        [$y = 6 - x^2$],
        [$y = 8 - (3 / 8) x^2$]
    ),
    loigiai: [
        #step([Thiết lập phương trình parabol])
        Đỉnh parabol tại $(0, 6) => y = 6 - a x^2$.
        Hai chân cổng tại mặt đất có hoành độ $x = plus.minus W / 2 = plus.minus 4$.
        Tại $x = 4, y = 0$:
        $ 0 = 6 - a(4^2) <=> 16 a = 6 <=> a = 6 / 16 = 3 / 8 $
        Vậy phương trình là $y = 6 - (3 / 8) x^2$.
    ]
)

// TN 5
#tn([Với cổng chào ở câu 4, một xe tải chở hàng dạng hình hộp chữ nhật có chiều rộng thùng xe là $4" m"$ muốn đi qua chính giữa cổng. Chiều cao tối đa của xe tải để chạm mép cổng vòm là],
    (
        True([$4.5" m"$]),
        [$4.0" m"$],
        [$5.0" m"$],
        [$3.5" m"$]
    ),
    loigiai: [
        #step([Tính chiều cao tối đa của xe])
        Xe rộng $4" m"$ đi chính giữa nên hai mép trên thùng xe có hoành độ $x = plus.minus 2$.
        Thay $x = 2$ vào phương trình parabol $y = 6 - (3 / 8) x^2$:
        $ y = 6 - (3 / 8) times 2^2 = 6 - (3 / 8) times 4 = 6 - 1.5 = 4.5" m" $
    ]
)

// TN 6
#tn([Một vòm cầu bắc qua sông có dạng nửa hình elip với chiều rộng nhịp cầu (trục lớn) là $24" m"$ và chiều cao đỉnh vòm là $8" m"$. Phương trình chính tắc của elip chứa vòm cầu này là],
    (
        True([$x^2 / 144 + y^2 / 64 = 1$]),
        [$x^2 / 576 + y^2 / 64 = 1$],
        [$x^2 / 24 + y^2 / 8 = 1$],
        [$x^2 / 144 + y^2 / 16 = 1$]
    ),
    loigiai: [
        #step([Xác định các bán trục])
        Chiều rộng nhịp cầu $2 a = 24 => a = 12 => a^2 = 144$.
        Chiều cao đỉnh vòm $b = 8 => b^2 = 64$.
        Phương trình là $x^2 / 144 + y^2 / 64 = 1$.
    ]
)

// TN 7
#tn([Với vòm cầu elip ở câu 6, tại vị trí cách tâm nhịp cầu một khoảng $6" m"$, chiều cao của vòm cầu bằng],
    (
        True([$4 sqrt(3)" m"$]),
        [$6" m"$],
        [$4" m"$],
        [$2 sqrt(7)" m"$]
    ),
    loigiai: [
        #step([Tính chiều cao tại x = 6])
        Thay $x = 6$ vào phương trình elip $x^2 / 144 + y^2 / 64 = 1$:
        $ 36 / 144 + y^2 / 64 = 1 <=> 1 / 4 + y^2 / 64 = 1 <=> y^2 / 64 = 3 / 4 $
        $ <=> y^2 = 48 => y = sqrt(48) = 4 sqrt(3)" m" $
    ]
)

// TN 8
#tn([Cổng parabol của một trường đại học có chiều rộng mặt đất là $8" m"$ và chiều cao ở đỉnh là $8" m"$. Chiều cao của cổng tại vị trí cách mép chân cổng $2" m"$ là],
    (
        True([$6" m"$]),
        [$4" m"$],
        [$5" m"$],
        [$7" m"$]
    ),
    loigiai: [
        #step([Tìm chiều cao tại vị trí cách chân cổng 2m])
        Chọn gốc tọa độ tại tâm chân cổng, bề rộng $8" m"$ nên hai chân tại $x = -4$ và $x = 4$.
        Cách chân cổng $2" m"$ tương ứng với vị trí có khoảng cách đến tâm là $|x| = 4 - 2 = 2" m"$.
        Phương trình cổng: $y = 8(1 - x^2 / 16)$.
        Tại $x = 2$:
        $ y = 8(1 - 4 / 16) = 8 times (3 / 4) = 6" m" $
    ]
)

// TN 9
#tn([Cây cầu vòm Sydney Harbour Bridge (Úc) nổi tiếng có vòm thép chịu lực mang hình dáng gần với đường cong nào sau đây?],
    (
        True([Đường Parabol]),
        [Đường Elip],
        [Đường Hypebol],
        [Đường tròn]
    ),
    loigiai: [
        #step([Vòm cầu Parabol trong kỹ thuật cầu đường])
        Cung vòm thép chịu lực dạng parabol giúp phân bố tải trọng đồng đều và chuyển lực nén chủ yếu dọc theo thân vòm xuống mố cầu hai bờ, tối ưu hóa khả năng chịu lực.
    ]
)

// TN 10
#tn([Trong một kính viễn vọng Cassegrain, tiêu điểm của gương sơ cấp parabol trùng với yếu tố nào của gương thứ cấp hypebol?],
    (
        True([Một trong hai tiêu điểm của gương hypebol]),
        [Đỉnh của gương hypebol],
        [Tâm đối xứng của hypebol],
        [Đường tiệm cận của hypebol]
    ),
    loigiai: [
        #step([Nguyên lý đồng tiêu điểm])
        Gương parabol và gương hypebol có một tiêu điểm chung $F_1$. Tia sáng hướng tới $F_1$ sẽ bị gương hypebol phản xạ hội tụ tại tiêu điểm còn lại $F_2$, nơi đặt thị kính quan sát.
    ]
)

// TN 11
#tn([Một tháp giải nhiệt hình hypeboloid có mặt cắt đứng là hypebol $x^2 / 400 - y^2 / 900 = 1$ (đơn vị: mét). Bán kính của tháp tại chỗ hẹp nhất (eo thắt) bằng],
    (
        True([$20" m"$]),
        [$40" m"$],
        [$30" m"$],
        [$15" m"$]
    ),
    loigiai: [
        #step([Tìm bán kính tại eo thắt])
        Eo thắt hẹp nhất ứng với $y = 0$, khi đó:
        $ x^2 / 400 = 1 <=> x^2 = 400 => x = 20" m" $
        Bán kính tại eo thắt là $R = a = 20" m"$.
    ]
)

// TN 12
#tn([Số lượng đường chuẩn của đường Elip, đường Parabol và đường Hypebol lần lượt là],
    (
        True([$2, 1, 2$]),
        [$2, 2, 2$],
        [$1, 1, 1$],
        [$2, 1, 1$]
    ),
    loigiai: [
        #step([Số đường chuẩn của ba đường conic])
        - Elip có $2$ đường chuẩn ($x = plus.minus a / e$).
        - Parabol có $1$ đường chuẩn ($x = -p / 2$).
        - Hypebol có $2$ đường chuẩn ($x = plus.minus a / e$).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Kính viễn vọng không gian Hubble (HST) bay trên quỹ đạo Trái Đất sử dụng thiết kế quang học Ritchey-Chrétien (một biến thể chuyên dụng của kính Cassegrain).],
  (
    True([Gương sơ cấp của Hubble là một gương lõm dạng Hypebol.]),
    True([Gương thứ cấp của Hubble là một gương lồi dạng Hypebol.]),
    True([Cả hai gương đều có dạng Hypebol giúp loại bỏ hoàn toàn hiện tượng cầu sai và hiện tượng coma trên toàn bộ trường nhìn rộng.]),
    [Ánh sáng từ các thiên thể xa xôi bị chặn lại hoàn toàn bởi gương thứ cấp nên không có tia sáng nào tới được cảm biến.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    Kính Ritchey-Chrétien cải tiến thiết kế Cassegrain bằng cách sử dụng hai gương đều có dạng Hypebol (thay vì parabol + hypebol), loại bỏ hiện tượng méo quang học coma trên toàn trường nhìn, đem lại ảnh chụp sâu thẳm vũ trụ cực kỳ sắc nét của kính Hubble (Ý a, b, c ĐÚNG).

    #step([Xét ý d])
    Gương thứ cấp chỉ che chắn một phần nhỏ diện tích ở tâm, phần lớn diện tích gương sơ cấp xung quanh vẫn thu gom trọn vẹn ánh sáng và phản xạ tới cảm biến. Khẳng định ánh sáng bị chặn hoàn toàn là SAI. Do đó ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Một cổng vòm parabol có chiều rộng chân cổng ở mặt đất là $12" m"$ và chiều cao ở đỉnh cổng là $9" m"$. Đặt gốc tọa độ $O$ tại tâm chân cổng, trục $O y$ là trục đối xứng.],
  (
    True([Phương trình của cổng vòm là $y = 9 - (1 / 4) x^2$.]),
    True([Tại vị trí cách tâm chân cổng $3" m"$, chiều cao của vòm là $6.75" m"$.]),
    True([Một xe tải chở hàng có chiều rộng $6" m"$ và chiều cao $6.5" m"$ có thể đi qua an toàn chính giữa cổng.]),
    [Chiều cao của cổng vòm tại hai mép chân cổng là $9" m"$.]
  ),
  loigiai: [
    #step([Xét ý a])
    $y = 9 - a x^2$. Chân cổng tại $x = 6, y = 0 => 0 = 9 - 36 a => a = 1 / 4$.
    Phương trình $y = 9 - (1 / 4) x^2$ (Ý a ĐÚNG).

    #step([Xét ý b])
    Tại $x = 3$: $y = 9 - (1 / 4) times 9 = 9 - 2.25 = 6.75" m"$ (Ý b ĐÚNG).

    #step([Xét ý c])
    Xe rộng $6" m"$ đi giữa cổng thì mép xe tại $x = 3$.
    Tại $x = 3$, chiều cao vòm là $6.75" m"$. Vì xe cao $6.5" m" < 6.75" m"$ nên xe lọt qua an toàn (Ý c ĐÚNG).

    #step([Xét ý d])
    Tại hai chân cổng ($x = plus.minus 6$), cổng tiếp đất nên chiều cao bằng $0" m"$, không phải $9" m"$. Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Một tháp làm mát bằng bê tông có mặt cắt thẳng đứng qua trục đối xứng là một đường Hypebol với phương trình $x^2 / 144 - y^2 / 400 = 1$ (đơn vị đo: mét, $-50 <= y <= 100$).],
  (
    True([Bán trục thực của hypebol là $a = 12" m"$.]),
    True([Đường kính eo thắt hẹp nhất của tháp làm mát là $24" m"$.]),
    True([Tại vị trí đỉnh tháp ($y = 100" m"$), bán kính mặt cắt ngang lớn hơn $60" m"$.]),
    [Độ dốc của thành tháp không đổi từ đáy lên đến đỉnh tháp.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    $a^2 = 144 => a = 12" m"$ (Ý a ĐÚNG).
    Eo thắt tại $y = 0$ có đường kính $2 a = 24" m"$ (Ý b ĐÚNG).

    #step([Xét ý c])
    Tại $y = 100$:
    $ x^2 / 144 = 1 + 100^2 / 400 = 1 + 25 = 26 => x^2 = 144 times 26 = 3744 $
    $ x = sqrt(3744) approx 61.19" m" > 60" m" $ (Ý c ĐÚNG).

    #step([Xét ý d])
    Đường hypebol có độ dốc (hệ số góc tiếp tuyến) thay đổi liên tục dọc theo thân tháp, uốn lượn cong cong chứ không phải đường thẳng có độ dốc không đổi. Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Xét các đặc trưng hình học tổng quát để phân loại ba đường conic (Elip, Parabol, Hypebol).],
  (
    True([Elip là đường conic duy nhất có hình dạng khép kín (giới hạn trong một miền hữu hạn).]),
    True([Parabol có đúng $1$ trục đối xứng, trong khi Elip và Hypebol đều có $2$ trục đối xứng.]),
    True([Hypebol có các đường tiệm cận, trong khi Elip và Parabol không có đường tiệm cận.]),
    [Đường parabol có hai tiêu điểm phân biệt nằm đối xứng nhau qua đỉnh của parabol.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    - Elip là đường cong kín, Parabol và Hypebol vươn ra vô cực (Ý a ĐÚNG).
    - Parabol chỉ có $1$ trục đối xứng, Elip và Hypebol có $2$ trục đối xứng vuông góc (Ý b ĐÚNG).
    - Hypebol có hai tiệm cận $y = plus.minus (b / a) x$, elip và parabol không có (Ý c ĐÚNG).

    #step([Xét ý d])
    Đường parabol chỉ có duy nhất $1$ tiêu điểm $F(p / 2, 0)$ và $1$ đường chuẩn, không có hai tiêu điểm đối xứng. Khẳng định có hai tiêu điểm là SAI. Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Một cổng vòm parabol có chiều rộng chân cổng là $10" m"$ và chiều cao ở đỉnh là $5" m"$. Tính chiều cao của cổng vòm tại vị trí cách tâm đường $3" m"$ (đơn vị: mét, viết dưới dạng số thập phân).],
    [3.2],
    loigiai: [
        #step([Thiết lập phương trình cổng vòm])
        Chọn gốc tại tâm đường, hai chân tại $x = plus.minus 5$.
        $ y = 5(1 - x^2 / 25) $
        #step([Tính chiều cao tại x = 3])
        $ y = 5(1 - 9 / 25) = 5 times (16 / 25) = 16 / 5 = 3.2" m" $
    ]
)

// TLN 2 (Câu 18)
#tln([Một vòm hầm đường bộ có dạng nửa elip với chiều rộng mặt đường là $20" m"$ và chiều cao đỉnh hầm là $8" m"$. Tính tiêu cự $2 c$ của đường elip chứa vòm hầm này (đơn vị: mét).],
    [12],
    loigiai: [
        #step([Xác định các thông số])
        Chiều rộng $2 a = 20 => a = 10" m"$.
        Chiều cao đỉnh hầm $b = 8" m"$.
        $ c = sqrt(a^2 - b^2) = sqrt(10^2 - 8^2) = sqrt(100 - 64) = 6" m" $
        Tiêu cự của elip là:
        $ 2 c = 2 times 6 = 12" m" $
    ]
)

// TLN 3 (Câu 19)
#tln([Một cổng vòm parabol có chiều rộng chân cổng là $12" m"$ và chiều cao ở đỉnh là $9" m"$. Một xe tải chở hàng có chiều rộng $4" m"$ và chiều cao $7" m"$ đi qua chính giữa cổng. Tính khoảng cách an toàn theo phương thẳng đứng từ nóc xe tải đến vòm cổng (đơn vị: mét).],
    [1],
    loigiai: [
        #step([Tính chiều cao vòm tại mép xe])
        Phương trình cổng: $y = 9(1 - x^2 / 36)$.
        Xe rộng $4" m"$ nên mép xe ở vị trí $x = 2" m"$.
        $ y = 9(1 - 4 / 36) = 9 times (32 / 36) = 8" m" $
        #step([Tính khoảng cách an toàn])
        Khoảng cách từ nóc xe ($7" m"$) đến đỉnh vòm tại mép ($8" m"$):
        $ d = 8 - 7 = 1" m" $
    ]
)

// TLN 4 (Câu 20)
#tln([Một tháp giải nhiệt có mặt cắt thẳng đứng là hypebol $x^2 / 400 - y^2 / 900 = 1$ (đơn vị: mét). Tính đường kính eo thắt hẹp nhất của tháp (đơn vị: mét).],
    [40],
    loigiai: [
        #step([Tính đường kính eo thắt])
        Eo thắt tại $y = 0$:
        $ x^2 / 400 = 1 <=> x = 20" m" $
        Đường kính eo thắt là:
        $ D = 2 x = 2 times 20 = 40" m" $
    ]
)

// TLN 5 (Câu 21)
#tln([Tiếp tục dữ kiện ở câu 20, tại vị trí có độ cao cách eo thắt $y = 30" m"$, tính đường kính mặt cắt ngang của thân tháp (đơn vị: mét, kết quả làm tròn đến hàng đơn vị).],
    [57],
    loigiai: [
        #step([Tính bán kính tại y = 30])
        Thay $y = 30$ vào phương trình hypebol:
        $ x^2 / 400 - 30^2 / 900 = 1 <=> x^2 / 400 - 1 = 1 <=> x^2 / 400 = 2 $
        $ x^2 = 800 => x = sqrt(800) = 20 sqrt(2) approx 28.284" m" $
        #step([Tính đường kính])
        $ D = 2 x = 40 sqrt(2) approx 56.57" m" $
        Làm tròn đến hàng đơn vị là $57" m"$.
    ]
)

// TLN 6 (Câu 22)
#tln([Trong kính viễn vọng phản xạ Cassegrain, gương thứ cấp hypebol có tiêu cự $c = 30" cm"$ và bán trục thực $a = 20" cm"$. Tính tâm sai $e$ của gương hypebol này (viết kết quả dưới dạng số thập phân).],
    [1.5],
    loigiai: [
        #step([Tính tâm sai e của gương hypebol])
        $ e = c / a = 30 / 20 = 1.5 $
    ]
)

] // end make-questions

#make-questions()
