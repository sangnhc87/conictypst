#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0891b2") // Cyan/Sky cho Đề 9B

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BA ĐƯỜNG CONIC & ỨNG DỤNG",
  exam-title: "BÀI 3: ỨNG DỤNG THỰC TẾ CỦA BA ĐƯỜNG CONIC (ĐỀ B - KEPLER & ĐỊNH VỊ LORAN)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "326",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Định luật thứ nhất của Johannes Kepler về chuyển động của các thiên thể trong Hệ Mặt Trời khẳng định rằng: Quỹ đạo của mỗi hành tinh quay quanh Mặt Trời là một
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Major axis line
    line((-3.2, 0), (3.2, 0), stroke: (paint: rgb("94a3b8"), dash: "dashed"))
    // Orbit ellipse
    circle((0, 0), radius: (2.4, 1.4), stroke: 1.5pt + rgb("0891b2"))
    // Sun at Focus F1
    circle((-1.2, 0), radius: 0.18, fill: rgb("f59e0b"), stroke: 1pt + rgb("d97706"))
    content((-1.2, -0.4), text(size: 7.5pt, weight: "bold", fill: rgb("d97706"))[Mặt Trời ($F_1$)])
    // Perihelion
    circle((-2.4, 0), radius: 0.08, fill: rgb("0284c7"))
    content((-2.4, 0.3), text(size: 7pt, weight: "bold")[$P$ (Cận nhật)])
    // Aphelion
    circle((2.4, 0), radius: 0.08, fill: rgb("0284c7"))
    content((2.4, 0.3), text(size: 7pt, weight: "bold")[$A$ (Viễn nhật)])
  })
]
],
    (
        True([Đường elip với Mặt Trời nằm ở một trong hai tiêu điểm]),
        [Đường tròn với Mặt Trời nằm ở tâm quỹ đạo],
        [Đường parabol với Mặt Trời nằm ở tiêu điểm],
        [Đường hypebol với Mặt Trời nằm ở tâm đối xứng]
    ),
    loigiai: [
        #step([Định luật 1 Kepler])
        Năm 1609, nhà thiên văn học Johannes Kepler công bố định luật: "Mọi hành tinh đều chuyển động quanh Mặt Trời theo các quỹ đạo hình elip, trong đó Mặt Trời chiếm một trong hai tiêu điểm".
    ]
)

// TN 2
#tn([Gọi $a$ là bán trục lớn và $e$ là tâm sai của quỹ đạo elip của một hành tinh quanh Mặt Trời. Khoảng cách ngắn nhất từ hành tinh đến Mặt Trời (khoảng cách cận nhật $r_(min)$) được tính bởi công thức],
    (
        True([$r_(min) = a(1 - e)$]),
        [$r_(min) = a(1 + e)$],
        [$r_(min) = a e$],
        [$r_(min) = a / e$]
    ),
    loigiai: [
        #step([Công thức khoảng cách cận nhật])
        Khoảng cách cận nhật là khoảng cách từ tiêu điểm $F_1(-c, 0)$ đến đỉnh gần nhất $A_1(-a, 0)$:
        $ r_(min) = a - c = a - a e = a(1 - e) $
    ]
)

// TN 3
#tn([Khoảng cách xa nhất từ một hành tinh đến Mặt Trời (khoảng cách viễn nhật $r_(max)$) được tính bởi công thức],
    (
        True([$r_(max) = a(1 + e)$]),
        [$r_(max) = a(1 - e)$],
        [$r_(max) = a e + c$],
        [$r_(max) = 2 a(1 + e)$]
    ),
    loigiai: [
        #step([Công thức khoảng cách viễn nhật])
        Khoảng cách viễn nhật là khoảng cách từ $F_1(-c, 0)$ đến đỉnh xa nhất $A_2(a, 0)$:
        $ r_(max) = a + c = a + a e = a(1 + e) $
    ]
)

// TN 4
#tn([Trái Đất quay quanh Mặt Trời theo quỹ đạo elip có bán trục lớn $a approx 149.6$ triệu km và tâm sai $e approx 0.0167$. Khoảng cách từ Trái Đất đến Mặt Trời tại điểm cận nhật xấp xỉ bằng],
    (
        True([$147.1$ triệu km]),
        [$152.1$ triệu km]),
        [$149.6$ triệu km],
        [$144.5$ triệu km]
    ),
    loigiai: [
        #step([Tính khoảng cách cận nhật của Trái Đất])
        $ r_(min) = a(1 - e) approx 149.6 times (1 - 0.0167) = 149.6 times 0.9833 approx 147.1 $ triệu km.
    ]
)

// TN 5
#tn([Sao chổi Halley nổi tiếng chuyển động quanh Mặt Trời trên một quỹ đạo elip có tâm sai $e approx 0.967$. Giá trị tâm sai xấp xỉ $1$ này phản ánh hình dạng quỹ đạo của sao chổi Halley như thế nào?],
    (
        True([Rất dẹt và kéo dài, điểm viễn nhật ở rất xa so với điểm cận nhật]),
        [Gần như tròn đều giống quỹ đạo của Trái Đất],
        [Là một đường thẳng đi qua tâm Mặt Trời],
        [Có dạng hình vuông]
    ),
    loigiai: [
        #step([Ý nghĩa của tâm sai quỹ đạo thiên thể])
        Khi $e$ càng gần $1$, elip càng trở nên hẹp và dẹt (kéo dài). Điểm viễn nhật của sao chổi Halley ở xa tới tận quỹ đạo sao Hải Vương, trong khi điểm cận nhật nằm gần Mặt Trời hơn cả Trái Đất.
    ]
)

// TN 6
#tn([Một tàu thăm dò vũ trụ được phóng từ Trái Đất. Khi vận tốc của tàu tại độ cao quy chiếu đạt đúng bằng vận tốc vũ trụ cấp hai ($v = v_("II") approx 11.2" km/s"$), quỹ đạo của con tàu so với Trái Đất sẽ là đường gì?],
    (
        True([Đường Parabol (vừa đủ để thoát khỏi lực hấp dẫn của Trái Đất)]),
        [Đường tròn quanh Trái Đất],
        [Đường elip khép kín],
        [Đường xoắn ốc rơi về tâm Trái Đất]
    ),
    loigiai: [
        #step([Vận tốc vũ trụ cấp II và quỹ đạo Parabol])
        Vận tốc vũ trụ cấp II là vận tốc thoát ly tối thiểu. Khi $v = v_("II")$, năng lượng toàn phần bằng $0$, tâm sai của quỹ đạo đúng bằng $e = 1$, con tàu chuyển động theo quỹ đạo Parabol rời khỏi Trái Đất và không bao giờ rơi lại.
    ]
)

// TN 7
#tn([Khi một thiên thể lạ từ không gian sâu bay vào Hệ Mặt Trời với vận tốc lớn hơn vận tốc vũ trụ cấp hai ($v > v_("II")$) và lướt qua Trái Đất, quỹ đạo của thiên thể đối với Trái Đất là đường nào?],
    (
        True([Đường Hypebol ($e > 1$)]),
        [Đường Parabol ($e = 1$)],
        [Đường Elip ($e < 1$)],
        [Đường tròn ($e = 0$)]
    ),
    loigiai: [
        #step([Quỹ đạo bay ngang Hypebol])
        Khi $v > v_("II")$, cơ năng toàn phần dương, tâm sai $e > 1$. Thiên thể chuyển động theo quỹ đạo Hypebol, chỉ lướt qua một lần rồi bay vĩnh viễn ra xa vô cực.
    ]
)

// TN 8
#tn([Hệ thống định vị vô tuyến hàng hải đường dài LORAN (Long Range Navigation) xác định vị trí tàu thuyền trên biển dựa trên việc xác định giao điểm của các đường nào sau đây?],
    (
        True([Các đường Hypebol]),
        [Các đường Parabol],
        [Các đường Elip],
        [Các đường tròn đồng tâm]
    ),
    loigiai: [
        #step([Nguyên lý định vị LORAN])
        Hai trạm phát sóng phát tín hiệu đồng bộ. Tàu thu tín hiệu và đo độ chênh lệch thời gian $Delta t$. Độ chênh lệch khoảng cách đến hai trạm là không đổi ($Delta d = c times Delta t = "hằng số"$). Quỹ tích các điểm có hiệu khoảng cách không đổi đến hai điểm cố định là một nhánh của đường Hypebol.
    ]
)

// TN 9
#tn([Trong hệ thống định vị LORAN, hai trạm phát sóng vô tuyến đóng vai trò hình học là yếu tố nào của đường hypebol định vị?],
    (
        True([Hai tiêu điểm của hypebol]),
        [Hai đỉnh của hypebol],
        [Tâm đối xứng của hypebol],
        [Hai điểm trên đường tiệm cận]
    ),
    loigiai: [
        #step([Vai trò của hai trạm phát])
        Hiệu khoảng cách từ con tàu $M$ đến hai trạm $A$ và $B$ không đổi ($|M A - M B| = 2 a$). Theo định nghĩa hình học của hypebol, hai trạm $A$ và $B$ chính là hai tiêu điểm $F_1, F_2$ của hypebol.
    ]
)

// TN 10
#tn([Một tiểu hành tinh có khoảng cách cận nhật là $2" AU"$ và khoảng cách viễn nhật là $6" AU"$ (đơn vị thiên văn). Bán trục lớn $a$ của quỹ đạo tiểu hành tinh bằng],
    (
        True([$4" AU"$]),
        [$3" AU"$],
        [$8" AU"$],
        [$2" AU"$]
    ),
    loigiai: [
        #step([Tính bán trục lớn a])
        Độ dài trục lớn là tổng khoảng cách cận nhật và viễn nhật:
        $ 2 a = r_(min) + r_(max) = 2 + 6 = 8" AU" => a = 4" AU" $
    ]
)

// TN 11
#tn([Tâm sai $e$ của quỹ đạo tiểu hành tinh trong câu 10 bằng],
    (
        True([$0.5$]),
        [$0.25$],
        [$0.75$],
        [$0.33$]
    ),
    loigiai: [
        #step([Tính tâm sai e])
        $c = r_(max) - a = 6 - 4 = 2" AU"$.
        Tâm sai của quỹ đạo là:
        $ e = c / a = 2 / 4 = 0.5 $
    ]
)

// TN 12
#tn([Theo Định luật thứ hai của Kepler (định luật bảo toàn mômen động lượng), trong quá trình hành tinh chuyển động trên quỹ đạo elip quanh Mặt Trời, tốc độ chuyển động của hành tinh đạt giá trị lớn nhất tại vị trí nào?],
    (
        True([Điểm cận nhật (vị trí gần Mặt Trời nhất)]),
        [Điểm viễn nhật (vị trí xa Mặt Trời nhất)],
        [Đỉnh của trục nhỏ elip],
        [Tốc độ luôn không đổi trên toàn quỹ đạo]
    ),
    loigiai: [
        #step([Định luật 2 Kepler và tốc độ cực đại])
        Đoạn thẳng nối Mặt Trời và hành tinh quét những diện tích bằng nhau trong những khoảng thời gian bằng nhau. Do bán kính qua tiêu $r$ nhỏ nhất tại điểm cận nhật, nên vận tốc chuyển động tại điểm cận nhật phải lớn nhất để quét cùng diện tích.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Xét mô hình chuyển động của Trái Đất quanh Mặt Trời theo quỹ đạo elip với bán trục lớn $a = 150$ triệu km và tâm sai $e = 0.017$. Đặt Mặt Trời tại tiêu điểm $F_1$.],
  (
    True([Khoảng cách từ tâm elip đến Mặt Trời là $c = 2.55$ triệu km.]),
    True([Khoảng cách từ Trái Đất đến Mặt Trời tại điểm cận nhật là $147.45$ triệu km.]),
    True([Khoảng cách từ Trái Đất đến Mặt Trời tại điểm viễn nhật là $152.55$ triệu km.]),
    [Chênh lệch giữa khoảng cách xa nhất và gần nhất từ Trái Đất đến Mặt Trời bằng $2.55$ triệu km.]
  ),
  loigiai: [
    #step([Xét ý a])
    $c = a e = 150 times 0.017 = 2.55$ triệu km (Ý a ĐÚNG).

    #step([Xét ý b và c])
    - Cận nhật: $r_(min) = a - c = 150 - 2.55 = 147.45$ triệu km (Ý b ĐÚNG).
    - Viễn nhật: $r_(max) = a + c = 150 + 2.55 = 152.55$ triệu km (Ý c ĐÚNG).

    #step([Xét ý d])
    Chênh lệch giữa khoảng cách xa nhất và gần nhất:
    $ r_(max) - r_(min) = (a + c) - (a - c) = 2 c = 2 times 2.55 = 5.10 $ triệu km.
    Con số $2.55$ triệu km chỉ là $c$, không phải $2 c$. Do đó ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Trong một hệ thống dẫn đường hàng hải LORAN, hai trạm phát sóng vô tuyến $A$ và $B$ đặt cách nhau $300" km"$ trên bờ biển. Đặt hệ trục tọa độ $O x y$ sao cho $A(-150, 0)$ và $B(150, 0)$ (đơn vị: km). Một con tàu nhận được tín hiệu từ trạm $B$ sớm hơn từ trạm $A$, tương ứng hiệu khoảng cách từ tàu đến hai trạm là $d(M, A) - d(M, B) = 180" km"$.],
  (
    True([Con tàu $M$ di chuyển trên một nhánh của đường hypebol có hai tiêu điểm là $A$ và $B$.]),
    True([Bán trục thực của hypebol là $a = 90" km"$.]),
    True([Tiêu cự của hypebol là $2 c = 300" km"$.]),
    [Phương trình của đường hypebol quỹ tích con tàu là $x^2 / 8100 - y^2 / 14400 = -1$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    - Hiệu khoảng cách $|M A - M B| = 180" km" = 2 a => a = 90" km"$ (Ý b ĐÚNG).
    - Hai trạm là tiêu điểm $A(-150, 0), B(150, 0) => c = 150" km" => 2 c = 300" km"$ (Ý c ĐÚNG).
    - Tàu di chuyển trên nhánh phải của hypebol (gần $B$ hơn $A$) (Ý a ĐÚNG).

    #step([Xét ý d])
    $b^2 = c^2 - a^2 = 150^2 - 90^2 = 22500 - 8100 = 14400$.
    Phương trình chính tắc của hypebol nằm ngang có hai tiêu điểm trên $O x$ là:
    $ x^2 / 8100 - y^2 / 14400 = 1 $ (với $x >= 90$).
    Vế phải bằng $-1$ là sai. Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Xét chuyển động của một thiên thể nhỏ trong trường hấp dẫn của Mặt Trời (Mặt Trời đặt tại gốc tọa độ hoặc tiêu điểm).],
  (
    True([Nếu năng lượng cơ học toàn phần $E < 0$, quỹ đạo của thiên thể là một đường Elip (thiên thể bị giữ lại quanh Mặt Trời).]),
    True([Nếu năng lượng cơ học toàn phần $E = 0$, quỹ đạo của thiên thể là một đường Parabol.]),
    True([Nếu năng lượng cơ học toàn phần $E > 0$, quỹ đạo của thiên thể là một đường Hypebol.]),
    [Mọi sao chổi trong Hệ Mặt Trời đều có quỹ đạo tròn hoàn hảo.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    Theo định luật vạn vật hấp dẫn của Newton:
    - $E < 0 => e < 1$: Quỹ đạo elip (hành tinh, sao chổi chu kỳ) (Ý a ĐÚNG).
    - $E = 0 => e = 1$: Quỹ đạo parabol (vận tốc thoát ly) (Ý b ĐÚNG).
    - $E > 0 => e > 1$: Quỹ đạo hypebol (thiên thể bay ngang) (Ý c ĐÚNG).

    #step([Xét ý d])
    Hầu như tất cả các sao chổi đều có quỹ đạo elip rất dẹt (tâm sai $e$ từ $0.5$ đến $0.999$) hoặc parabol, hoàn toàn không có sao chổi nào có quỹ đạo tròn hoàn hảo ($e = 0$). Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Xét các cấp vận tốc vũ trụ được tính toán từ bề mặt Trái Đất (bỏ qua sức cản của khí quyển).],
  (
    True([Vận tốc vũ trụ cấp I ($v_I approx 7.9" km/s"$) giúp vệ tinh bay theo quỹ đạo tròn quanh Trái Đất.]),
    True([Khi vận tốc phóng $v$ thỏa mãn $7.9" km/s" < v < 11.2" km/s"$, vệ tinh chuyển động theo quỹ đạo Elip quanh Trái Đất.]),
    True([Vận tốc vũ trụ cấp II ($v_("II") approx 11.2" km/s"$) giúp tàu vũ trụ thoát khỏi trường hấp dẫn của Trái Đất theo quỹ đạo Parabol.]),
    [Để tàu vũ trụ thoát hoàn toàn khỏi Hệ Mặt Trời bay ra không gian liên sao, vận tốc phóng chỉ cần đạt $5" km/s"$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    - $v_I approx 7.9" km/s"$: Quỹ đạo tròn (Ý a ĐÚNG).
    - $v_I < v < v_("II")$: Quỹ đạo elip (Ý b ĐÚNG).
    - $v_("II") approx 11.2" km/s"$: Quỹ đạo parabol thoát Trái Đất (Ý c ĐÚNG).

    #step([Xét ý d])
    Để thoát khỏi Hệ Mặt Trời cần vận tốc vũ trụ cấp III ($v_("III") approx 16.7" km/s"$). Vận tốc $5" km/s"$ quá nhỏ, thậm chí không thể bay vào quỹ đạo quanh Trái Đất mà rơi ngay trở lại mặt đất. Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Một hành tinh chuyển động quanh một ngôi sao theo quỹ đạo elip có khoảng cách cận nhật là $100$ triệu km và khoảng cách viễn nhật là $300$ triệu km. Tính tâm sai $e$ của quỹ đạo hành tinh này (viết kết quả dưới dạng số thập phân).],
    [0.5],
    loigiai: [
        #step([Tính bán trục lớn a và tiêu cự c])
        $a = (r_(min) + r_(max)) / 2 = (100 + 300) / 2 = 200$ triệu km.
        $c = r_(max) - a = 300 - 200 = 100$ triệu km.
        #step([Tính tâm sai e])
        $ e = c / a = 100 / 200 = 0.5 $
    ]
)

// TLN 2 (Câu 18)
#tln([Một vệ tinh nhân tạo quay quanh Trái Đất theo quỹ đạo elip. Khoảng cách từ tâm Trái Đất đến điểm gần nhất của quỹ đạo là $7000" km"$, đến điểm xa nhất là $9000" km"$. Tính độ dài bán trục lớn $a$ của quỹ đạo (đơn vị: nghìn kilômét).],
    [8],
    loigiai: [
        #step([Tính bán trục lớn a])
        Độ dài trục lớn là tổng khoảng cách gần nhất và xa nhất:
        $ 2 a = 7000 + 9000 = 16000" km" => a = 8000" km" = 8 $ nghìn kilômét.
    ]
)

// TLN 3 (Câu 19)
#tln([Trong hệ thống dẫn đường LORAN, hai đài phát vô tuyến $A$ và $B$ đặt cách nhau $200" km"$. Một con tàu đo được hiệu khoảng cách đến hai đài phát là $120" km"$. Tính khoảng cách $c$ từ trung điểm đoạn nối hai đài phát đến một đài phát (đơn vị: km).],
    [100],
    loigiai: [
        #step([Tính tiêu cự c])
        Hai đài phát đóng vai trò là hai tiêu điểm $F_1, F_2$ của hypebol.
        Khoảng cách giữa hai đài phát là tiêu cự:
        $ 2 c = 200" km" => c = 100" km" $
    ]
)

// TLN 4 (Câu 20)
#tln([Tiếp tục dữ kiện ở câu 19, tính độ dài bán trục ảo $b$ của đường hypebol định vị nói trên (đơn vị: km).],
    [80],
    loigiai: [
        #step([Tính a và b])
        Hiệu khoảng cách: $2 a = 120" km" => a = 60" km"$.
        Tiêu cự $c = 100" km"$.
        Bán trục ảo $b$:
        $ b = sqrt(c^2 - a^2) = sqrt(100^2 - 60^2) = sqrt(10000 - 3600) = sqrt(6400) = 80" km" $
    ]
)

// TLN 5 (Câu 21)
#tln([Một sao chổi chuyển động trên một quỹ đạo parabol với Mặt Trời ở tiêu điểm $F$. Khoảng cách ngắn nhất từ sao chổi đến Mặt Trời là $0.5" AU"$. Tính tham số tiêu $p$ của quỹ đạo parabol này (đơn vị: AU).],
    [1],
    loigiai: [
        #step([Tính tham số tiêu p])
        Khoảng cách ngắn nhất từ một điểm trên parabol $y^2 = 2 p x$ đến tiêu điểm $F(p / 2, 0)$ là khoảng cách từ đỉnh $O$ đến tiêu điểm:
        $ r_(min) = p / 2 $
        Theo đề bài $r_(min) = 0.5" AU"$, suy ra:
        $ p = 2 times 0.5 = 1" AU" $
    ]
)

// TLN 6 (Câu 22)
#tln([Một vệ tinh địa tĩnh chuyển động tròn đều quanh Trái Đất ở độ cao khoảng $35786" km"$ so với mặt đất (bán kính quỹ đạo khoảng $42164" km"$). Tâm sai $e$ của quỹ đạo tròn này bằng bao nhiêu?],
    [0],
    loigiai: [
        #step([Tâm sai của đường tròn])
        Đường tròn là trường hợp riêng đặc biệt của đường elip khi hai tiêu điểm trùng nhau ($c = 0$), do đó tâm sai của đường tròn luôn bằng $e = c / a = 0$.
    ]
)

] // end make-questions

#make-questions()
