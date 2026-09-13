#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("7c3aed") // Purple cho Đề 9A

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BA ĐƯỜNG CONIC & ỨNG DỤNG",
  exam-title: "BÀI 3: ỨNG DỤNG THỰC TẾ CỦA BA ĐƯỜNG CONIC (ĐỀ A - QUANG HỌC & ANTEN)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "325",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong đèn pha ô tô hay đèn pin, bóng đèn chiếu sáng thường được đặt tại vị trí nào của chóa gương parabol để tạo ra chùm tia sáng song song chiếu xa?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Parabola mirror
    let pts = ()
    for i in range(-15, 16) {
      let y = i * 0.1
      let x = (y * y) / 1.8
      pts.push((x, y))
    }
    line(..pts, stroke: 1.8pt + rgb("7c3aed"))
    // Focus F(0.45, 0)
    circle((0.45, 0), radius: 0.1, fill: rgb("eab308"), stroke: 1pt + rgb("ca8a04"))
    content((0.45, -0.35), text(size: 7.5pt, weight: "bold", fill: rgb("7c3aed"))[Bóng đèn ($F$)])
    // Parallel light rays
    let rays = (1.2, 0.6, -0.6, -1.2)
    for y in rays {
      let x = (y * y) / 1.8
      line((0.45, 0), (x, y), stroke: 1pt + rgb("f59e0b"))
      line((x, y), (3.5, y), stroke: 1.2pt + rgb("f59e0b"), mark: (end: "stealth"))
    }
  })
]
],
    (
        True([Tiêu điểm của parabol]),
        [Đỉnh của parabol],
        [Tâm đối xứng của parabol],
        [Một điểm bất kỳ trên đường chuẩn]
    ),
    loigiai: [
        #step([Nguyên lý hoạt động của đèn pha ô tô])
        Nhờ tính chất quang học của parabol, khi nguồn sáng đặt tại tiêu điểm $F$, mọi tia sáng tới mặt gương phản xạ đều biến đổi thành chùm tia sáng song song với trục đối xứng, giúp ánh sáng chiếu xa và không bị phân tán.
    ]
)

// TN 2
#tn([Trong anten chảo parabol thu tín hiệu truyền hình vệ tinh, thiết bị thu tín hiệu (LNB) được đặt tại vị trí nào để thu được tín hiệu mạnh nhất?],
    (
        True([Tiêu điểm của parabol]),
        [Đỉnh của parabol],
        [Mép viền ngoài của chảo],
        [Chính giữa đáy chảo]
    ),
    loigiai: [
        #step([Nguyên lý chảo thu vệ tinh])
        Sóng vô tuyến từ vệ tinh truyền đến Trái Đất xem như chùm tia song song với trục chảo. Sau khi phản xạ tại mặt cong parabol, toàn bộ năng lượng sóng hội tụ chính xác tại tiêu điểm $F$, nơi đặt đầu thu LNB.
    ]
)

// TN 3
#tn([Một chảo thu sóng parabol có đường kính miệng chảo là $D$ và chiều sâu đáy chảo là $h$. Khoảng cách từ đỉnh chảo đến tiêu điểm đặt đầu thu sóng được xác định bởi công thức nào sau đây?],
    (
        True([$f = D^2 / (16 h)$]),
        [$f = D^2 / (8 h)$],
        [$f = D^2 / (4 h)$],
        [$f = (4 h^2) / D$]
    ),
    loigiai: [
        #step([Xây dựng công thức tiêu cự chảo parabol])
        Chọn hệ trục $O x y$ có gốc $O$ tại đỉnh chảo, trục đối xứng là $O x$.
        Phương trình parabol: $y^2 = 2 p x$.
        Mép viền chảo có tọa độ $(h, D / 2)$. Thay vào:
        $ (D / 2)^2 = 2 p h <=> D^2 / 4 = 2 p h => 2 p = D^2 / (4 h) $
        Khoảng cách từ đỉnh đến tiêu điểm là:
        $ f = p / 2 = (2 p) / 4 = D^2 / (16 h) $
    ]
)

// TN 4
#tn([Một chảo thu sóng truyền hình vệ tinh có đường kính miệng $D = 120" cm"$ và chiều sâu $h = 20" cm"$. Khoảng cách từ đỉnh chảo đến vị trí gắn đầu thu tín hiệu bằng],
    (
        True([$45" cm"$]),
        [$30" cm"$],
        [$60" cm"$],
        [$90" cm"$]
    ),
    loigiai: [
        #step([Áp dụng công thức tính tiêu cự])
        $ f = D^2 / (16 h) = 120^2 / (16 times 20) = 14400 / 320 = 45" cm" $
    ]
)

// TN 5
#tn([Một đèn pha có chóa gương parabol với tiêu cự $f = 4" cm"$. Chiều sâu của chao đèn là $h = 9" cm"$. Đường kính miệng của chao đèn bằng],
    (
        True([$24" cm"$]),
        [$12" cm"$],
        [$36" cm"$],
        [$18" cm"$]
    ),
    loigiai: [
        #step([Tính đường kính miệng đèn])
        Từ $f = D^2 / (16 h) => D^2 = 16 f h$:
        $ D^2 = 16 times 4 times 9 = 576 => D = sqrt(576) = 24" cm" $
    ]
)

// TN 6
#tn([Bếp năng lượng mặt trời dạng chảo parabol thu nhiệt hiệu quả nhất để nấu chín thức ăn khi đặt dụng cụ nấu (xoong, nồi) tại vị trí nào?],
    (
        True([Tiêu điểm của chảo parabol]),
        [Đỉnh của chảo parabol],
        [Mặt phẳng đường chuẩn],
        [Mép ngoài của chảo]
    ),
    loigiai: [
        #step([Nguyên lý bếp mặt trời])
        Các tia nắng mặt trời chiếu song song tới bề mặt chảo phản xạ hội tụ toàn bộ năng lượng nhiệt tại tiêu điểm $F$, tạo nhiệt độ cực cao tại đây.
    ]
)

// TN 7
#tn([Một phòng hòa nhạc có trần vòm bán elip với chiều dài sàn là $20" m"$ và chiều cao trần nhà tại vị trí chính giữa cao nhất là $6" m"$. Khoảng cách giữa hai vị trí đặt mic và tai nghe để nghe rõ âm thanh thì thầm nhất (khoảng cách giữa hai tiêu điểm) bằng],
    (
        True([$16" m"$]),
        [$8" m"$],
        [$12" m"$],
        [$14" m"$]
    ),
    loigiai: [
        #step([Xác định các thông số của elip])
        Trần vòm bán elip có độ dài trục lớn $2 a = 20 => a = 10" m"$.
        Độ dài bán trục bé bằng chiều cao trần: $b = 6" m"$.
        Tiêu cự $c$:
        $ c = sqrt(a^2 - b^2) = sqrt(10^2 - 6^2) = sqrt(100 - 36) = 8" m" $
        Khoảng cách giữa hai tiêu điểm là $2 c = 2 times 8 = 16" m"$.
    ]
)

// TN 8
#tn([Một chảo anten parabol có phương trình mặt cắt là $y^2 = 40 x$ (đơn vị: cm). Đầu thu tín hiệu LNB phải đặt cách đỉnh chảo bao nhiêu xentimét?],
    (
        True([$10" cm"$]),
        [$20" cm"$],
        [$40" cm"$],
        [$5" cm"$]
    ),
    loigiai: [
        #step([Tìm khoảng cách từ đỉnh đến tiêu điểm])
        Phương trình $y^2 = 2 p x = 40 x => 2 p = 40 => p = 20$.
        Khoảng cách từ đỉnh $O$ đến tiêu điểm $F$ là:
        $ x_F = p / 2 = 20 / 2 = 10" cm" $
    ]
)

// TN 9
#tn([Trong kính thiên văn phản xạ Newton, gương phản xạ chính thu gom ánh sáng từ các thiên thể ở xa vô cực là],
    (
        True([Gương parabol lõm]),
        [Gương cầu lồi],
        [Gương phẳng],
        [Thấu kính phân kỳ]
    ),
    loigiai: [
        #step([Kính thiên văn phản xạ])
        Gương parabol lõm không bị hiện tượng cầu sai (spherical aberration) như gương cầu, giúp hội tụ mọi tia sáng song song từ các ngôi sao về một tiêu điểm sắc nét.
    ]
)

// TN 10
#tn([Khi lắp đặt chảo parabol thu sóng vệ tinh địa tĩnh ngoài trời, cần điều chỉnh góc phương vị và góc tà sao cho],
    (
        True([Trục đối xứng của chảo hướng thẳng tới vị trí vệ tinh]),
        [Mặt chảo nằm ngang song song mặt đất],
        [Trục chảo vuông góc với phương truyền sóng],
        [Đầu thu LNB quay về hướng Bắc địa từ]
    ),
    loigiai: [
        #step([Kỹ thuật định hướng anten chảo])
        Chỉ khi trục đối xứng của chảo hướng thẳng tới vệ tinh thì các tia sóng tới mới song song với trục parabol và phản xạ hội tụ trọn vẹn tại tiêu điểm LNB.
    ]
)

// TN 11
#tn([Một chao đèn pin hình parabol có đường kính miệng $60" cm"$ và chiều sâu $15" cm"$. Phương trình chính tắc của parabol trong mặt phẳng tọa độ đặt đỉnh tại gốc $O(0, 0)$ là],
    (
        True([$y^2 = 60 x$]),
        [$y^2 = 30 x$],
        [$y^2 = 120 x$],
        [$y^2 = 15 x$]
    ),
    loigiai: [
        #step([Tìm phương trình parabol])
        Phương trình có dạng $y^2 = 2 p x$.
        Mép chao đèn có tọa độ $(15, 30)$ (do đường kính $60 => y = 30$).
        Thay vào:
        $ 30^2 = 2 p times 15 <=> 900 = 30 p <=> 2 p = 60 $
        Vậy phương trình là $y^2 = 60 x$.
    ]
)

// TN 12
#tn([Hiện tượng "vòm thì thầm" không thể xảy ra trong một căn phòng có trần phẳng nằm ngang vì lý do nào sau đây?],
    (
        True([Sóng âm sau khi phản xạ tại trần phẳng sẽ phân kỳ và không hội tụ về một điểm]),
        [Trần phẳng hấp thụ $100%$ năng lượng sóng âm],
        [Sóng âm truyền qua trần phẳng mà không bị phản xạ],
        [Vận tốc âm thanh bị giảm về $0$ khi chạm trần phẳng]
    ),
    loigiai: [
        #step([Giải thích hiện tượng âm học])
        Trần phẳng phản xạ sóng âm theo định luật gương phẳng khiến các tia sóng loe rộng ra xung quanh, không có tiêu điểm hội tụ như trần cong elip.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Một chiếc chảo thu sóng vệ tinh hình parabol có đường kính miệng $D = 80" cm"$ và chiều sâu của chảo là $h = 10" cm"$. Chọn hệ trục tọa độ $O x y$ có gốc $O$ tại đỉnh chảo và trục hoành $O x$ là trục đối xứng của chảo.],
  (
    True([Tọa độ của mép trên chảo là $(10, 40)$.]),
    True([Phương trình parabol của mặt cắt chảo là $y^2 = 160 x$.]),
    True([Tham số tiêu của parabol là $p = 80$.]),
    [Đầu thu sóng LNB cần đặt cách đỉnh chảo một khoảng bằng $20" cm"$.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    Đường kính miệng $80 => y = 40" cm"$. Chiều sâu $x = 10" cm"$. Tọa độ mép là $(10, 40)$ (Ý a ĐÚNG).
    Phương trình $y^2 = 2 p x => 40^2 = 2 p times 10 <=> 1600 = 20 p => 2 p = 160$.
    Phương trình parabol là $y^2 = 160 x$ (Ý b ĐÚNG).

    #step([Xét ý c])
    $2 p = 160 => p = 80" cm"$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Vị trí đặt đầu thu sóng tại tiêu điểm $F(p / 2, 0)$:
    $ f = p / 2 = 80 / 2 = 40" cm" $.
    Khoảng cách là $40" cm"$, không phải $20" cm"$. Do đó ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Một hội trường có trần dạng bán elip với chiều dài sàn phòng là $26" m"$ (trục lớn) và chiều cao của trần tại điểm cao nhất là $5" m"$ (bán trục bé).],
  (
    True([Bán trục lớn của elip là $a = 13" m"$, bán trục nhỏ là $b = 5" m"$.]),
    True([Tiêu cự của elip là $2 c = 24" m"$.]),
    True([Hai vị trí thì thầm nghe rõ nhất nằm cách tâm phòng một khoảng $12" m"$ về hai phía đối xứng.]),
    [Một âm thanh phát ra từ tiêu điểm thứ nhất khi tới điểm cao nhất trên trần có quãng đường phản xạ tới tiêu điểm thứ hai dài hơn $26" m"$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    - $2 a = 26 => a = 13" m"$, chiều cao trần $b = 5" m"$ (Ý a ĐÚNG).
    - $c = sqrt(13^2 - 5^2) = sqrt(169 - 25) = 12" m" => 2 c = 24" m"$ (Ý b ĐÚNG).
    - Hai tiêu điểm cách gốc $O$ khoảng $c = 12" m"$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Theo tính chất elip, với mọi điểm $M$ trên trần elip, tổng quãng đường truyền sóng $M F_1 + M F_2 = 2 a = 26" m"$. Quãng đường luôn luôn đúng bằng $26" m"$, không thể dài hơn. Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Xét một chóa đèn pin có bề mặt phản xạ là hình parabol. Bóng đèn được thiết kế để đặt tại tiêu điểm $F$.],
  (
    True([Khi bóng đèn đặt đúng tại tiêu điểm $F$, chùm tia sáng phản xạ là chùm song song.]),
    True([Nếu kéo bóng đèn ra xa đỉnh chao đèn hơn vị trí tiêu điểm, chùm tia sáng phản xạ sẽ có xu hướng hội tụ.]),
    True([Nếu đẩy bóng đèn lại gần đỉnh chao đèn hơn vị trí tiêu điểm, chùm tia sáng phản xạ sẽ bị phân kỳ (loe rộng).]),
    [Độ sáng của chùm tia song song phản xạ tại mọi khoảng cách trong chân không đều suy giảm theo hàm mũ mũ ba.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    - Đặt tại tiêu điểm: Chùm tia phản xạ song song trục (Ý a ĐÚNG).
    - Nguồn ở ngoài tiêu điểm (xa hơn $F$): Các tia phản xạ hội tụ cắt nhau ở phía trước (Ý b ĐÚNG).
    - Nguồn ở trong tiêu điểm (gần đỉnh hơn $F$): Các tia phản xạ phân kỳ loe rộng (chế độ chiếu gần) (Ý c ĐÚNG).

    #step([Xét ý d])
    Chùm tia song song lý tưởng trong chân không bảo toàn mật độ quang thông theo khoảng cách, không suy giảm theo hàm mũ ba. Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Một trạm phát sóng radar bờ biển sử dụng một đĩa parabol có đường kính $2" m"$ ($200" cm"$) và tiêu cự $f = 50" cm"$.],
  (
    True([Tham số tiêu của parabol là $p = 100" cm"$.]),
    True([Phương trình mặt cắt parabol là $y^2 = 200 x$.]),
    True([Chiều sâu của đĩa radar này bằng $50" cm"$.]),
    [Tỉ số giữa độ sâu và đường kính của đĩa radar lớn hơn $0.5$.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    $f = p / 2 = 50 => p = 100" cm" => 2 p = 200$. Phương trình $y^2 = 200 x$ (Ý a và b ĐÚNG).

    #step([Xét ý c])
    Tại mép đĩa, $y = D / 2 = 200 / 2 = 100" cm"$.
    Thay vào: $100^2 = 200 x => 10000 = 200 x => x = 50" cm"$.
    Chiều sâu của đĩa là $h = 50" cm"$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Tỉ số $h / D = 50 / 200 = 0.25 < 0.5$. Khẳng định lớn hơn $0.5$ là SAI. Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Một anten chảo parabol có đường kính miệng $100" cm"$ và chiều sâu $25" cm"$. Tính khoảng cách từ đỉnh chảo đến đầu thu sóng LNB (đơn vị: cm).],
    [25],
    loigiai: [
        #step([Áp dụng công thức tính tiêu cự f])
        $ f = D^2 / (16 h) = 100^2 / (16 times 25) = 10000 / 400 = 25" cm" $
    ]
)

// TLN 2 (Câu 18)
#tln([Một gương parabol hội tụ nhiệt mặt trời có mặt cắt thỏa mãn phương trình $y^2 = 48 x$ (đơn vị đo: cm). Bình đun nước cần được đặt tại tiêu điểm của gương, cách đỉnh gương bao nhiêu xentimét?],
    [12],
    loigiai: [
        #step([Xác định tọa độ tiêu điểm])
        Phương trình $y^2 = 2 p x = 48 x => 2 p = 48 => p = 24$.
        Khoảng cách từ đỉnh đến tiêu điểm là:
        $ f = p / 2 = 24 / 2 = 12" cm" $
    ]
)

// TLN 3 (Câu 19)
#tln([Một phòng thì thầm có trần vòm elip với độ dài trục lớn là $30" m"$ và độ dài trục nhỏ là $18" m"$. Tính khoảng cách giữa hai vị trí nghe rõ tiếng thì thầm nhất (đơn vị: mét).],
    [24],
    loigiai: [
        #step([Tính c và tiêu cự])
        $2 a = 30 => a = 15" m"$, $2 b = 18 => b = 9" m"$.
        $ c = sqrt(a^2 - b^2) = sqrt(15^2 - 9^2) = sqrt(225 - 81) = sqrt(144) = 12" m" $
        Khoảng cách giữa hai vị trí (hai tiêu điểm) là:
        $ 2 c = 2 times 12 = 24" m" $
    ]
)

// TLN 4 (Câu 20)
#tln([Một chao đèn pha xe hơi hình parabol có đường kính miệng $16" cm"$ và chiều sâu $8" cm"$. Tiêu cự $f$ của gương parabol này bằng bao nhiêu xentimét?],
    [2],
    loigiai: [
        #step([Tính tiêu cự f])
        $ f = D^2 / (16 h) = 16^2 / (16 times 8) = 256 / 128 = 2" cm" $
    ]
)

// TLN 5 (Câu 21)
#tln([Một chảo parabol có phương trình mặt cắt là $y^2 = 32 x$ (đơn vị: cm). Tại vị trí cách đỉnh chảo $8" cm"$ theo trục đối xứng, đường kính mặt cắt ngang của chảo bằng bao nhiêu xentimét?],
    [32],
    loigiai: [
        #step([Tìm bán kính và đường kính])
        Tại $x = 8" cm"$:
        $ y^2 = 32 times 8 = 256 => y = 16" cm" $
        Đường kính mặt cắt ngang là:
        $ D = 2 y = 2 times 16 = 32" cm" $
    ]
)

// TLN 6 (Câu 22)
#tln([Một bếp năng lượng mặt trời dạng parabol có tiêu cự $f = 50" cm"$ và chiều sâu chảo là $h = 18" cm"$. Tính bán kính miệng chảo (đơn vị: cm).],
    [60],
    loigiai: [
        #step([Tính đường kính và bán kính miệng chảo])
        Từ công thức $f = D^2 / (16 h)$:
        $ D^2 = 16 f h = 16 times 50 times 18 = 14400 => D = sqrt(14400) = 120" cm" $
        Bán kính miệng chảo là:
        $ R = D / 2 = 120 / 2 = 60" cm" $
    ]
)

] // end make-questions

#make-questions()
