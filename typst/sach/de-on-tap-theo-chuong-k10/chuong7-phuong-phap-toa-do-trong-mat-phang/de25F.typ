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
  school: "CHƯƠNG VII: PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG",
  exam-title: "CHUYÊN ĐỀ TOÁN THỰC TẾ 3: THIÊN VĂN HỌC, QUANG HỌC & KIẾN TRÚC CONIC (ĐỀ SỐ 25F - MÃ ĐỀ 172)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "172",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Theo Định luật 1 Kepler, quỹ đạo của Trái Đất quanh Mặt Trời là một Elip có Mặt Trời nằm tại một tiêu điểm.
Biết bán trục lớn là $a = 150$ triệu kilômét và tâm sai $e = 0.016$.
Tiêu cự của quỹ đạo Trái Đất quanh Mặt Trời bằng],
    (
        True([$4.8$ triệu kilômét]),
        [$2.4$ triệu kilômét],
        [$9.6$ triệu kilômét],
        [$1.2$ triệu kilômét]
    ),
    loigiai: [
        Nửa tiêu cự: $c = a e = 150 times 0.016 = 2.4$ triệu kilômét.
        Tiêu cự của quỹ đạo: $2c = 2(2.4) = 4.8$ triệu kilômét.
    ]
)

// TN 2
#tn([Khoảng cách ngắn nhất từ Trái Đất đến Mặt Trời (điểm cận nhật) là],
    (
        True([$147.6$ triệu kilômét]),
        [$152.4$ triệu kilômét],
        [$148.8$ triệu kilômét],
        [$145.2$ triệu kilômét]
    ),
    loigiai: [
        Khoảng cách cận nhật ngắn nhất:
        $ r_1 = a - c = 150 - 2.4 = 147.6 text(" triệu kilômét") $
    ]
)

// TN 3
#tn([Khoảng cách xa nhất từ Trái Đất đến Mặt Trời (điểm viễn nhật) là],
    (
        True([$152.4$ triệu kilômét]),
        [$147.6$ triệu kilômét],
        [$154.8$ triệu kilômét],
        [$150.0$ triệu kilômét]
    ),
    loigiai: [
        Khoảng cách viễn nhật xa nhất:
        $ r_2 = a + c = 150 + 2.4 = 152.4 text(" triệu kilômét") $
    ]
)

// TN 4
#tn([Một sao chổi bay qua Hệ Mặt Trời theo quỹ đạo Hypebol có phương trình $x^2 / 16 - y^2 / 9 = 1$ ($x > 0$, đơn vị: Đơn vị Thiên văn AU).
Mặt Trời nằm tại tiêu điểm $F_1(c; 0)$. Khoảng cách gần Mặt Trời nhất của sao chổi bằng],
    (
        True([$1 text(" AU")$]),
        [$2 text(" AU")$],
        [$3 text(" AU")$],
        [$4 text(" AU")$]
    ),
    loigiai: [
        $a = 4, b = 3 => c = sqrt(16 + 9) = 5 text(" AU")$.
        Mặt Trời tại $F_1(5; 0)$, đỉnh gần nhất của nhánh Hypebol là $A(4; 0)$.
        Khoảng cách gần Mặt Trời nhất:
        $ d_text("min") = c - a = 5 - 4 = 1 text(" AU") $
    ]
)

// TN 5
#tn([Tháp làm mát của một nhà máy điện nhiệt hạch có mặt cắt thẳng đứng là một đường Hypebol $(H): x^2 / 100 - y^2 / 400 = 1$ (đơn vị: mét).
Bề rộng nhỏ nhất tại eo thắt giữa tháp (tại $y = 0$) bằng],
    (
        True([$20 text(" m")$]),
        [$10 text(" m")$],
        [$40 text(" m")$],
        [$25 text(" m")$]
    ),
    loigiai: [
        Tại $y = 0 => x^2 / 100 = 1 => x = 10 text(" m")$.
        Bề rộng eo thắt giữa tháp: $2x = 2(10) = 20 text(" m")$.
    ]
)

// TN 6
#tn([Tại đỉnh miệng tháp ở độ cao $y = 40 text(" m")$, đường kính miệng tháp làm mát bằng],
    (
        True([$20 sqrt(5) text(" m")$]),
        [$10 sqrt(5) text(" m")$],
        [$40 text(" m")$],
        [$50 text(" m")$]
    ),
    loigiai: [
        Thay $y = 40$ vào phương trình $(H)$:
        $ x^2 / 100 - 40^2 / 400 = 1 <=> x^2 / 100 - 4 = 1 <=> x^2 = 500 => x = 10 sqrt(5) text(" m") $
        Đường kính miệng tháp là $2x = 20 sqrt(5) text(" m")$.
    ]
)

// TN 7
#tn([Một đèn pin có chóa phản xạ dạng Parabol $y^2 = 8x$ (đơn vị: cm).
Chiều sâu của lòng chóa đèn là $x = 4.5 text(" cm")$. Bán kính miệng chóa đèn pin bằng],
    (
        True([$6 text(" cm")$]),
        [$12 text(" cm")$],
        [$8 text(" cm")$],
        [$4 text(" cm")$]
    ),
    loigiai: [
        Tại $x = 4.5 text(" cm")$:
        $ y^2 = 8(4.5) = 36 => y = 6 text(" cm") $
    ]
)

// TN 8
#tn([Mặt bàn của một bàn bi-a đặc biệt có hình dạng Elip $(E): x^2 / 25 + y^2 / 16 = 1$ (đơn vị: mét).
Hai lỗ bi được bố trí chính xác tại hai tiêu điểm $F_1, F_2$.
Khoảng cách giữa hai lỗ bi bằng],
    (
        True([$6 text(" m")$]),
        [$8 text(" m")$],
        [$10 text(" m")$],
        [$3 text(" m")$]
    ),
    loigiai: [
        $a = 5, b = 4 => c = sqrt(25 - 16) = 3 text(" m")$.
        Khoảng cách giữa hai lỗ bi: $F_1 F_2 = 2c = 2(3) = 6 text(" m")$.
    ]
)

// TN 9
#tn([Mái vòm của một nhà hát kịch có mặt cắt là nửa trên của Elip $x^2 / 400 + y^2 / 144 = 1$ ($y >= 0$, đơn vị: mét).
Chiều cao lớn nhất của vòm nhà hát tại vị trí trung tâm bằng],
    (
        True([$12 text(" m")$]),
        [$20 text(" m")$],
        [$144 text(" m")$],
        [$16 text(" m")$]
    ),
    loigiai: [
        $b^2 = 144 => b = 12 text(" m")$.
        Chiều cao lớn nhất tại tâm chính là $b = 12 text(" m")$.
    ]
)

// TN 10
#tn([Chiều rộng nhịp vòm của nhà hát kịch nói trên trên sàn sân khấu bằng],
    (
        True([$40 text(" m")$]),
        [$20 text(" m")$],
        [$24 text(" m")$],
        [$50 text(" m")$]
    ),
    loigiai: [
        $a^2 = 400 => a = 20 text(" m")$.
        Chiều rộng nhịp vòm: $2a = 2(20) = 40 text(" m")$.
    ]
)

// TN 11
#tn([Một tấm pin năng lượng mặt trời hình Elip có bán trục lớn $a = 2 text(" m")$ và bán trục nhỏ $b = 1 text(" m")$.
Diện tích hấp thụ ánh sáng của tấm pin bằng ($S = pi a b$)],
    (
        True([$2 pi text(" m")^2$]),
        [$4 pi text(" m")^2$],
        [$pi text(" m")^2$],
        [$3 pi text(" m")^2$]
    ),
    loigiai: [
        $S = pi a b = pi (2)(1) = 2pi text(" m")^2$.
    ]
)

// TN 12
#tn([Một gương phản xạ hội tụ nhiệt Parabol có phương trình $y^2 = 20x$ (đơn vị: cm).
Khoảng cách từ đỉnh gương đến điểm tập trung nhiệt độ cao nhất (tiêu điểm $F$) bằng],
    (
        True([$5 text(" cm")$]),
        [$10 text(" cm")$],
        [$20 text(" cm")$],
        [$2.5 text(" cm")$]
    ),
    loigiai: [
        $2p = 20 => p = 10 text(" cm")$.
        Tiêu cự: $O F = p / 2 = 10 / 2 = 5 text(" cm")$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Tháp tản nhiệt Hypebol có CeTZ)
#ds([Một tháp tản nhiệt nhà máy điện hạt nhân có mặt cắt thẳng đứng là hai nhánh của Hypebol $(H): x^2 / 100 - y^2 / 400 = 1$ với giới hạn chiều cao $-30 <= y <= 50$ (đơn vị: mét) như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-3, 0), (3, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -2), (0, 3.2), stroke: 0.8pt, mark: (end: "stealth"))
  content((2.8, -0.3), [$x$])
  content((-0.3, 3), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Nhánh phải: x = 10 sqrt(1 + y^2/400) (scale x: 0.08, y: 0.05)
  line((1.44, 2.5), (1.17, 1.5), (1.0, 0), (1.17, -1.5), stroke: 1.5pt + rgb("7c3aed"))
  // Nhánh trái
  line((-1.44, 2.5), (-1.17, 1.5), (-1.0, 0), (-1.17, -1.5), stroke: 1.5pt + rgb("7c3aed"))
  
  // Nét đứt eo thắt
  line((-1.0, 0), (1.0, 0), stroke: (dash: "dashed", paint: blue))
  content((0, 0.25), [$20 text(" m")$])
  
  // Miệng trên và đáy dưới
  line((-1.44, 2.5), (1.44, 2.5), stroke: (dash: "dashed", paint: gray))
  line((-1.17, -1.5), (1.17, -1.5), stroke: (dash: "dashed", paint: gray))
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Chiều rộng thắt hẹp nhất tại eo tháp (tại $y = 0$) bằng $2a = 20 text(" m")$.]),
    True([Chiều cao toàn bộ của tháp tản nhiệt bằng $80 text(" m")$.]),
    True([Bán kính miệng tháp tại độ cao $y = 40 text(" m")$ bằng $10 sqrt(5) text(" m")$ ($approx 22.36 text(" m")$).]),
    [Tại đáy tháp $y = -30 text(" m")$, đường kính đáy tháp bằng $30 text(" m")$.]
  ),
  loigiai: [
    #step([Chiều rộng eo tháp])
    Tại $y = 0 => x = 10$, bề rộng $2x = 20 text(" m")$. Mệnh đề a ĐÚNG.

    #step([Chiều cao tháp])
    $h = 50 - (-30) = 80 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Bán kính miệng tháp])
    Tại $y = 40$: $x^2 = 100(1 + 1600 / 400) = 500 => x = 10 sqrt(5) text(" m")$. Mệnh đề c ĐÚNG.

    #step([Đường kính đáy tháp])
    Tại $y = -30$:
    $ x^2 = 100(1 + 900 / 400) = 100(13 / 4) = 325 => x = 5 sqrt(13) approx 18.03 text(" m") $
    Đường kính đáy tháp: $2x = 10 sqrt(13) approx 36.06 text(" m")$ (chứ không phải $30 text(" m")$).
    Khẳng định bằng $30 text(" m")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Quỹ đạo Trái Đất)
#ds([Trái Đất quay quanh Mặt Trời theo quỹ đạo Elip có bán trục lớn $a = 150$ triệu kilômét và tâm sai $e = 0.016$.
Mặt Trời nằm tại một trong hai tiêu điểm của Elip.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nửa tiêu cự của quỹ đạo bằng $c = 2.4$ triệu kilômét.]),
    True([Khoảng cách ngắn nhất từ Trái Đất đến Mặt Trời (điểm cận nhật) là $147.6$ triệu kilômét.]),
    True([Khoảng cách xa nhất từ Trái Đất đến Mặt Trời (điểm viễn nhật) là $152.4$ triệu kilômét.]),
    [Độ dài trục nhỏ của quỹ đạo Trái Đất ngắn hơn trục lớn tới $10$ triệu kilômét.]
  ),
  loigiai: [
    #step([Nửa tiêu cự])
    $c = a e = 150 times 0.016 = 2.4$ triệu kilômét. Mệnh đề a ĐÚNG.

    #step([Khoảng cách cận nhật và viễn nhật])
    $r_1 = a - c = 147.6$ triệu kilômét. Mệnh đề b ĐÚNG.
    $r_2 = a + c = 152.4$ triệu kilômét. Mệnh đề c ĐÚNG.

    #step([Bán trục nhỏ b])
    $b = sqrt(a^2 - c^2) = sqrt(150^2 - 2.4^2) = sqrt(22494.24) approx 149.98$ triệu kilômét.
    Độ chênh lệch giữa hai trục $2a - 2b approx 2(0.02) = 0.04$ triệu kilômét (rất nhỏ, chưa tới $0.1$ triệu kilômét).
    Khẳng định ngắn hơn tới $10$ triệu kilômét là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Bàn bida Elip)
#ds([Mép băng của một bàn bida có dạng Elip $(E): x^2 / 25 + y^2 / 16 = 1$ (đơn vị: mét).
Hai lỗ bi được đặt tại hai tiêu điểm $F_1, F_2$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ của hai lỗ bi là $F_1(-3; 0)$ và $F_2(3; 0)$.]),
    True([Khoảng cách giữa hai lỗ bi bằng $6 text(" m")$.]),
    True([Một bi bida xuất phát từ $F_1$ đập vào băng tại $M in (E)$ rồi nảy vào lỗ $F_2$ có tổng quãng đường lăn luôn bằng $10 text(" m")$.]),
    [Nếu bi đập vào băng tại đỉnh trục nhỏ $N(0; 4)$ thì tam giác $N F_1 F_2$ là tam giác vuông.]
  ),
  loigiai: [
    #step([Tọa độ tiêu điểm])
    $a = 5, b = 4 => c = 3$. Tiêu điểm $F_1(-3; 0), F_2(3; 0)$. Mệnh đề a ĐÚNG.

    #step([Khoảng cách hai lỗ])
    $F_1 F_2 = 2c = 6 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Tổng quãng đường])
    Theo định nghĩa Elip: $M F_1 + M F_2 = 2a = 10 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra tam giác N F1 F2])
    $N F_1 = sqrt(0^2 + 4^2 + 3^2) = 5$, $N F_2 = 5$, $F_1 F_2 = 6$.
    $N F_1^2 + N F_2^2 = 25 + 25 = 50 != 6^2 = 36$.
    Tam giác $N F_1 F_2$ là tam giác cân chứ không phải tam giác vuông.
    Khẳng định là tam giác vuông là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Gương hội tụ nhiệt Parabol)
#ds([Một gương parabol hội tụ nhiệt mặt trời có phương trình $y^2 = 20x$ ($0 <= x <= 5$, đơn vị: mét).
Bộ thu nhiệt đặt tại tiêu điểm $F$ của gương.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tham số tiêu của Parabol là $p = 10 text(" m")$.]),
    True([Tiêu điểm $F$ có tọa độ là $F(5; 0)$.]),
    True([Bán kính miệng gương tại độ sâu $x = 5 text(" m")$ bằng $10 text(" m")$.]),
    [Khoảng cách từ một điểm trên mép miệng gương ($x = 5; y = 10$) đến tiêu điểm $F$ bằng $15 text(" m")$.]
  ),
  loigiai: [
    #step([Tham số tiêu và tiêu điểm])
    $2p = 20 => p = 10 text(" m")$. Tiêu điểm $F(p / 2; 0) = F(5; 0)$. Mệnh đề a và b ĐÚNG.

    #step([Bán kính miệng gương])
    Tại $x = 5$: $y^2 = 20(5) = 100 => y = 10 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Bán kính qua tiêu])
    Theo công thức bán kính qua tiêu của Parabol:
    $ M F = x_M + p / 2 = 5 + 5 = 10 text(" m") $ (chứ không phải $15 text(" m")$).
    Khẳng định khoảng cách bằng $15 text(" m")$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Bề rộng hẹp nhất eo tháp Hypebol)
#tln([Trong bài toán tháp tản nhiệt Hypebol $x^2 / 100 - y^2 / 400 = 1$, bề rộng nhỏ nhất tại eo tháp bằng bao nhiêu mét?],
    [20],
    loigiai: [
        #step([Tính bề rộng eo])
        Tại $y = 0 => x = 10$.
        Bề rộng eo: $2x = 2(10) = 20 text(" m")$.
    ]
)

// TLN 2 (Khoảng cách cận nhật Trái Đất)
#tln([Trong bài toán quỹ đạo Trái Đất quanh Mặt Trời ($a = 150$ triệu km, $e = 0.016$), khoảng cách cận nhật ngắn nhất từ Trái Đất đến Mặt Trời bằng bao nhiêu triệu kilômét?],
    [147.6],
    loigiai: [
        #step([Tính khoảng cách cận nhật])
        $ c = 150 times 0.016 = 2.4 $
        $ r_1 = a - c = 150 - 2.4 = 147.6 text(" triệu km") $
    ]
)

// TLN 3 (Khoảng cách hai lỗ bi-a Elip)
#tln([Trong bài toán bàn bi-a Elip $x^2 / 25 + y^2 / 16 = 1$, khoảng cách giữa hai lỗ bi tiêu điểm $F_1, F_2$ bằng bao nhiêu mét?],
    [6],
    loigiai: [
        #step([Tính tiêu cự])
        $ c = sqrt(25 - 16) = 3 $
        $ 2c = 2(3) = 6 text(" m") $
    ]
)

// TLN 4 (Tổng quãng đường bi lăn trên bàn bi-a)
#tln([Trong bài toán bàn bi-a Elip, tổng quãng đường bi lăn từ lỗ $F_1$ đập vào băng rồi nảy vào lỗ $F_2$ bằng bao nhiêu mét?],
    [10],
    loigiai: [
        #step([Tính 2a])
        Theo định nghĩa Elip:
        $ M F_1 + M F_2 = 2a = 2(5) = 10 text(" m") $
    ]
)

// TLN 5 (Đường kính miệng gương Parabol)
#tln([Trong bài toán gương Parabol $y^2 = 20x$ sâu $x = 5 text(" m")$, đường kính của miệng gương bằng bao nhiêu mét?],
    [20],
    loigiai: [
        #step([Tính bán kính và đường kính])
        Bán kính $R = sqrt(20(5)) = 10 text(" m")$.
        Đường kính miệng gương: $2R = 2(10) = 20 text(" m")$.
    ]
)

// TLN 6 (Chiều cao lớn nhất vòm nhà hát Elip)
#tln([Trong bài toán vòm nhà hát kịch Elip $x^2 / 400 + y^2 / 144 = 1$, chiều cao lớn nhất của vòm nhà hát tại tâm bằng bao nhiêu mét?],
    [12],
    loigiai: [
        #step([Tính bán trục nhỏ b])
        $ b = sqrt(144) = 12 text(" m") $
    ]
)

] // end make-questions

#make-questions()
