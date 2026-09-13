#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1d4ed8") // Royal Blue cho Đề D / Chuyên đề ứng dụng 3A

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 1: HỆ PHƯƠNG TRÌNH BẬC NHẤT BA ẨN",
  exam-title: "BÀI 3: ỨNG DỤNG THỰC TẾ & CÂN BẰNG HÓA HỌC (ĐỀ A - HÓA HỌC & CƠ HỌC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "307",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Để cân bằng phản ứng hóa học đốt cháy quặng Pyrit sắt:
$ x"FeS"_2 + y"O"_2 -> z"Fe"_2"O"_3 + t"SO"_2 $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (-0.8, 0.6), fill: rgb("eff6ff"), stroke: 1.2pt + rgb("1d4ed8"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold", fill: rgb("1e40af"))[Chất tham gia:\ $"FeS"_2, "O"_2$])
    line((-0.6, 0), (0.6, 0), stroke: 1.5pt + rgb("dc2626"), mark: (end: "stealth"))
    content((0, 0.3), text(size: 7.5pt, fill: rgb("dc2626"))[$t^circ$])
    rect((0.8, -0.6), (2.5, 0.6), fill: rgb("fef2f2"), stroke: 1.2pt + rgb("dc2626"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold", fill: rgb("991b1b"))[Sản phẩm:\ $"Fe"_2"O"_3, "SO"_2$])
  })
]
Phương trình đại số bảo toàn nguyên tố Sắt (Fe) theo các hệ số $x, y, z, t$ là],
    (
        True([$x - 2z = 0$]),
        [$x - z = 0$],
        [$2x - z = 0$],
        [$x + 2z = 0$]
    ),
    loigiai: [
        #step([Bảo toàn nguyên tố Fe])
        - Vế trái: $x$ nguyên tử Fe trong $x"FeS"_2$.
        - Vế phải: $2z$ nguyên tử Fe trong $z"Fe"_2"O"_3$.
        Theo định luật bảo toàn khối lượng và nguyên tố:
        $ x = 2z <=> x - 2z = 0 $
    ]
)

// TN 2
#tn([Cũng trong phản ứng đốt quặng Pyrit sắt ở Câu 1:
$ x"FeS"_2 + y"O"_2 -> z"Fe"_2"O"_3 + t"SO"_2 $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1d4ed8"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Bảo toàn nguyên tố Lưu huỳnh S và Oxi O])
  })
]
Hệ phương trình bảo toàn nguyên tố S và O lần lượt là],
    (
        True([$cases(2x - t = 0, 2y - 3z - 2t = 0)$]),
        [$cases(x - 2t = 0, y - 3z - t = 0)$],
        [$cases(2x + t = 0, 2y + 3z + 2t = 0)$],
        [$cases(x - t = 0, 2y - 3z = 0)$]
    ),
    loigiai: [
        #step([Bảo toàn từng nguyên tố])
        - Bảo toàn Lưu huỳnh (S): $2x = t <=> 2x - t = 0$.
        - Bảo toàn Oxi (O): $2y = 3z + 2t <=> 2y - 3z - 2t = 0$.
        Vậy hệ phương trình là $cases(2x - t = 0, 2y - 3z - 2t = 0)$.
    ]
)

// TN 3
#tn([Bộ hệ số nguyên dương tối giản $(x; y; z; t)$ để cân bằng phản ứng đốt quặng Pyrit sắt ở Câu 1 và Câu 2 là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdf4"), stroke: 1pt + rgb("16a34a"))
    content((0, 0), text(size: 8pt, fill: rgb("15803d"), weight: "bold")[Chọn ẩn tự do nguyên dương nhỏ nhất])
  })
]],
    (
        True([$(4; 11; 2; 8)$]),
        [$(2; 5; 1; 4)$],
        [$(4; 10; 2; 8)$],
        [$(8; 22; 4; 16)$]
    ),
    loigiai: [
        #step([Giải hệ phương trình theo ẩn tự do z])
        Từ các phương trình bảo toàn:
        - $x = 2z$.
        - $t = 2x = 2(2z) = 4z$.
        - $2y = 3z + 2t = 3z + 2(4z) = 11z <=> y = 11/2 z$.
        Để $y$ là số nguyên dương thì $z$ phải chia hết cho 2.
        Chọn $z = 2$ (giá trị nguyên dương nhỏ nhất):
        - $z = 2$.
        - $x = 2(2) = 4$.
        - $y = 11/2 (2) = 11$.
        - $t = 4(2) = 8$.
        Phương trình hoàn chỉnh: $4"FeS"_2 + 11"O"_2 -> 2"Fe"_2"O"_3 + 8"SO"_2$.
        Bộ hệ số nguyên dương tối giản là $(4; 11; 2; 8)$.
    ]
)

// TN 4
#tn([Cân bằng phản ứng oxi hóa - khử giữa Đồng kim loại và Axit nitric đặc nóng:
$ x"Cu" + y"HNO"_3 -> z"Cu"("NO"_3)_2 + t"NO"_2 + u"H"_2"O" $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.5), (2.5, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1d4ed8"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Bảo toàn electron hoặc bảo toàn nguyên tố])
  })
]
Hệ số tối giản của $y$ trước phân tử $"HNO"_3$ bằng],
    (
        True([$4$]),
        [$2$],
        [$6$],
        [$8$]
    ),
    loigiai: [
        #step([Lập các phương trình bảo toàn nguyên tố])
        - Bảo toàn Cu: $x = z$.
        - Bảo toàn H: $y = 2u <=> u = y/2$.
        - Bảo toàn N: $y = 2z + t <=> t = y - 2z$.
        - Bảo toàn O: $3y = 6z + 2t + u$.
        Thay $t = y - 2z$ và $u = y/2$ vào:
        $ 3y = 6z + 2(y - 2z) + y/2 = 6z + 2y - 4z + y/2 = 2z + 5/2 y $
        $ <=> 1/2 y = 2z <=> y = 4z $
        Chọn $z = 1 => y = 4$.
        Khi đó: $x = 1, z = 1, t = 4 - 2 = 2, u = 4/2 = 2$.
        Phương trình: $"Cu" + 4"HNO"_3 -> "Cu"("NO"_3)_2 + 2"NO"_2 + 2"H"_2"O"$.
        Hệ số của $"HNO"_3$ là $y = 4$.
    ]
)

// TN 5
#tn([Một vật có khối lượng $m = 10" kg"$ được giữ cân bằng trên mặt phẳng nghiêng góc $alpha = 30^circ$ nhờ một lực kéo $vec(F)$ song song với mặt phẳng nghiêng.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Mặt phẳng nghiêng
    line((0, 0), (3, 0), stroke: 1pt)
    line((0, 0), (3, 1.73), stroke: 1.2pt + rgb("1d4ed8"))
    line((3, 0), (3, 1.73), stroke: 1pt)
    // Góc alpha
    content((0.8, 0.2), text(size: 7.5pt)[$30^circ$])
    // Vật trên dốc
    rect((1.3, 0.75), (1.9, 1.35), fill: rgb("dbeafe"), stroke: 1pt + rgb("1e40af"))
    // Trọng lực P
    line((1.6, 1.05), (1.6, -0.2), stroke: 1.2pt + rgb("dc2626"), mark: (end: "stealth"))
    content((1.8, 0.1), text(size: 7.5pt, fill: rgb("dc2626"))[$vec(P)$])
    // Lực F
    line((1.6, 1.05), (2.5, 1.57), stroke: 1.2pt + rgb("16a34a"), mark: (end: "stealth"))
    content((2.5, 1.8), text(size: 7.5pt, fill: rgb("16a34a"))[$vec(F)$])
  })
]
Lấy gia tốc trọng trường $g = 9.8" m/s"^2$, bỏ qua ma sát. Độ lớn của lực kéo $vec(F)$ là],
    (
        True([$49" N"$]),
        [$98" N"$],
        [$84.87" N"$],
        [$24.5" N"$]
    ),
    loigiai: [
        #step([Điều kiện cân bằng lực])
        Chiếu phương trình định luật II Newton lên phương song song với mặt phẳng nghiêng:
        $ F - P sin alpha = 0 <=> F = m g sin(30^circ) $
        Thay số:
        $ F = 10 times 9.8 times 1/2 = 49" N" $
    ]
)

// TN 6
#tn([Cân bằng phản ứng oxi hóa - khử nổi tiếng của thuốc tím $"KMnO"_4$ trong môi trường axit:
$ x"KMnO"_4 + y"FeSO"_4 + z"H"_2"SO"_4 -> t"K"_2"SO"_4 + u"MnSO"_4 + v"Fe"_2("SO"_4)_3 + w"H"_2"O" $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f3e8ff"), stroke: 1pt + rgb("7c3aed"))
    content((0, 0), text(size: 8pt, fill: rgb("6b21a8"), weight: "bold")[Chuẩn độ Oxi hóa - Khử Permanganat])
  })
]
Tỉ lệ giữa hệ số của $"FeSO"_4$ và $"KMnO"_4$ trong phương trình cân bằng là],
    (
        True([$y/x = 5$]),
        [$y/x = 2$],
        [$y/x = 3$],
        [$y/x = 10$]
    ),
    loigiai: [
        #step([Bảo toàn electron])
        - Quá trình khử: $"Mn"^(+7) + 5e -> "Mn"^(+2)$ (1 phân tử $"KMnO"_4$ nhận 5e).
        - Quá trình oxi hóa: $"Fe"^(+2) -> "Fe"^(+3) + 1e$ (1 phân tử $"FeSO"_4$ nhường 1e).
        Để tổng số e nhường bằng tổng số e nhận:
        $ 1 times y = 5 times x <=> y/x = 5 $
        Phương trình hoàn chỉnh:
        $ 2"KMnO"_4 + 10"FeSO"_4 + 8"H"_2"SO"_4 -> "K"_2"SO"_4 + 2"MnSO"_4 + 5"Fe"_2("SO"_4)_3 + 8"H"_2"O" $.
        Tỉ lệ $y/x = 10/2 = 5$.
    ]
)

// TN 7
#tn([Một quả cầu kim loại có khối lượng $m = 2" kg"$ được treo vào trần nhà bằng hai sợi dây nhẹ không dãn hợp với phương thẳng đứng các góc $alpha = 45^circ$ và $beta = 45^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, 1.5), (2, 1.5), stroke: 1.5pt)
    line((-1.2, 1.5), (0, 0), stroke: 1pt + rgb("1d4ed8"))
    line((1.2, 1.5), (0, 0), stroke: 1pt + rgb("1d4ed8"))
    line((0, 0), (0, -0.8), stroke: 1.2pt + rgb("dc2626"), mark: (end: "stealth"))
    circle((0, 0), radius: 4pt, fill: rgb("1e293b"))
    content((0.4, -0.4), text(size: 7.5pt)[$vec(P)$])
  })
]
Lấy $g = 9.8" m/s"^2$. Lực căng của mỗi sợi dây bằng],
    (
        True([$9.8 sqrt(2)" N"$]),
        [$19.6" N"$],
        [$9.8" N"$],
        [$19.6 sqrt(2)" N"$]
    ),
    loigiai: [
        #step([Điều kiện cân bằng lực])
        Do tính chất đối xứng, lực căng của hai sợi dây bằng nhau: $T_1 = T_2 = T$.
        Chiếu lên phương thẳng đứng:
        $ 2 T cos(45^circ) = P = m g $
        $ <=> 2 T (sqrt(2)/2) = 2 times 9.8 <=> T sqrt(2) = 19.6 <=> T = 19.6 / sqrt(2) = 9.8 sqrt(2)" N" $
    ]
)

// TN 8
#tn([Cân bằng phản ứng hóa học tạo muối phức chất:
$ x"Al" + y"NaOH" + z"H"_2"O" -> t"NaAl(OH)"_4 + u"H"_2 $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1d4ed8"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Kim loại nhôm tan trong dung dịch kiềm])
  })
]
Hệ số nguyên dương tối giản của khí $H_2$ ($u$) là],
    (
        True([$3$]),
        [$2$],
        [$1$],
        [$4$]
    ),
    loigiai: [
        #step([Bảo toàn electron])
        - $"Al"^0 -> "Al"^(+3) + 3e$.
        - $2"H"^(+1) + 2e -> "H"_2^0$.
        Bội chung nhỏ nhất của 3 và 2 là 6:
        Hệ số của Al là 2, hệ số của $H_2$ là $6/2 = 3$.
        Phương trình hoàn chỉnh:
        $ 2"Al" + 2"NaOH" + 6"H"_2"O" -> 2"NaAl(OH)"_4 + 3"H"_2 $
        Hệ số của $H_2$ là $u = 3$.
    ]
)

// TN 9
#tn([Một khung giàn thép tam giác chịu lực tại các nút giao như hình vẽ:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-1.5, 0), (1.5, 0), stroke: 1.5pt + rgb("1d4ed8"))
    line((-1.5, 0), (0, 1.5), stroke: 1.5pt + rgb("1d4ed8"))
    line((1.5, 0), (0, 1.5), stroke: 1.5pt + rgb("1d4ed8"))
    circle((-1.5, 0), radius: 2.5pt, fill: rgb("1e293b"))
    content((-1.8, -0.2), text(size: 7.5pt)[A])
    circle((1.5, 0), radius: 2.5pt, fill: rgb("1e293b"))
    content((1.8, -0.2), text(size: 7.5pt)[B])
    circle((0, 1.5), radius: 2.5pt, fill: rgb("1e293b"))
    content((0, 1.8), text(size: 7.5pt)[C])
  })
]
Nguyên lý cân bằng tĩnh học tại mỗi nút là tổng các vectơ lực tác dụng lên nút phải bằng vectơ không:
$ sum vec(F)_i = vec(0) $
Khi phân tích lực lên hai trục tọa độ $O x, O y$, mỗi nút cho ta bao nhiêu phương trình đại số độc lập?],
    (
        True([$2$ phương trình độc lập]),
        [$3$ phương trình độc lập],
        [$1$ phương trình độc lập],
        [$4$ phương trình độc lập]
    ),
    loigiai: [
        #step([Phân tích vectơ lực trên mặt phẳng])
        Một phương trình vectơ trong mặt phẳng $vec(F) = vec(0)$ tương đương với hai phương trình đại số vô hướng:
        $ cases(sum F_x = 0, sum F_y = 0) $
        Do đó mỗi nút cho ta đúng $2$ phương trình độc lập.
    ]
)

// TN 10
#tn([Cân bằng phản ứng điều chế khí Clo trong phòng thí nghiệm:
$ x"MnO"_2 + y"HCl" -> z"MnCl"_2 + t"Cl"_2 + u"H"_2"O" $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((0, 0), text(size: 8pt, fill: rgb("047857"), weight: "bold")[Bảo toàn nguyên tố Mn, O, H, Cl])
  })
]
Tổng các hệ số nguyên dương tối giản $S = x + y + z + t + u$ bằng],
    (
        True([$9$]),
        [$8$],
        [$10$],
        [$7$]
    ),
    loigiai: [
        #step([Cân bằng phản ứng])
        - Bảo toàn Mn: $x = z = 1$.
        - Bảo toàn O: $2x = u => u = 2$.
        - Bảo toàn H: $y = 2u = 2(2) = 4$.
        - Bảo toàn Cl: $y = 2z + 2t <=> 4 = 2(1) + 2t <=> 2t = 2 <=> t = 1$.
        Phương trình hoàn chỉnh:
        $ "MnO"_2 + 4"HCl" -> "MnCl"_2 + "Cl"_2 + 2"H"_2"O" $
        Tổng các hệ số:
        $ S = 1 + 4 + 1 + 1 + 2 = 9 $
    ]
)

// TN 11
#tn([Một khối gỗ hình hộp chữ nhật có trọng lượng $P = 50" N"$ nằm yên trên sàn nhà dưới tác dụng của lực kéo $vec(F)$ nghiêng góc $alpha = 30^circ$ so với phương ngang.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, 0), (2, 0), stroke: 1.5pt)
    rect((-0.8, 0), (0.8, 0.8), fill: rgb("dbeafe"), stroke: 1pt + rgb("1d4ed8"))
    line((0.4, 0.4), (1.8, 1.2), stroke: 1.2pt + rgb("dc2626"), mark: (end: "stealth"))
    content((1.8, 1.4), text(size: 7.5pt, fill: rgb("dc2626"))[$vec(F)$])
  })
]
Biết độ lớn của lực kéo là $F = 20" N"$. Phản lực $N$ của sàn tác dụng lên vật có độ lớn bằng],
    (
        True([$40" N"$]),
        [$50" N"$],
        [$30" N"$],
        [$60" N"$]
    ),
    loigiai: [
        #step([Cân bằng lực theo phương thẳng đứng])
        Các lực tác dụng lên vật theo phương thẳng đứng gồm:
        - Trọng lực $vec(P)$ hướng xuống dưới.
        - Phản lực $vec(N)$ hướng lên trên.
        - Thành phần thẳng đứng của lực kéo $F_y = F sin alpha$ hướng lên trên.
        Điều kiện cân bằng theo phương Oy:
        $ N + F sin(30^circ) - P = 0 $
        $ <=> N = P - F sin(30^circ) = 50 - 20 times 1/2 = 50 - 10 = 40" N" $
    ]
)

// TN 12
#tn([Khi lập hệ phương trình bảo toàn nguyên tố để cân bằng một phản ứng hóa học tổng quát có $n$ chất tham gia và sản phẩm nhưng chỉ có $m$ nguyên tố hóa học ($m < n$):
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.5), (2.5, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1d4ed8"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Số ẩn luôn nhiều hơn số phương trình: $n > m$])
  })
]
Hệ phương trình thuần nhất thu được luôn có đặc điểm gì?],
    (
        True([Luôn có vô số nghiệm và tồn tại ít nhất một ẩn tự do]),
        [Luôn luôn vô nghiệm],
        [Chỉ có duy nhất nghiệm bằng 0],
        [Luôn có đúng hai nghiệm]
    ),
    loigiai: [
        #step([Tính chất hệ phương trình thuần nhất])
        Hệ phương trình bảo toàn nguyên tố là hệ phương trình thuần nhất ($A X = 0$).
        Vì số ẩn $n$ lớn hơn số phương trình độc lập $m$ nên hệ luôn luôn có vô số nghiệm phụ thuộc vào ít nhất một ẩn tự do. Ta chọn ẩn tự do là số nguyên dương thích hợp để tìm được bộ hệ số nguyên dương tối giản.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Xét phản ứng hóa học oxi hóa - khử giữa kim loại Kẽm (Zn) và dung dịch Axit sunfuric đặc nóng sinh ra khí $"SO"_2$:
$ x"Zn" + y"H"_2"SO"_4 -> z"ZnSO"_4 + t"SO"_2 + u"H"_2"O" $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("eff6ff"), stroke: 1pt + rgb("1d4ed8"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Bảo toàn các nguyên tố Zn, H, S, O])
  })
]],
  (
    True([Phương trình bảo toàn nguyên tố Kẽm (Zn) là $x - z = 0$.]),
    True([Phương trình bảo toàn nguyên tố Hiđro (H) là $2y - 2u = 0 <=> y = u$.]),
    True([Phương trình bảo toàn nguyên tố Lưu huỳnh (S) là $y - z - t = 0$.]),
    [Bộ hệ số nguyên dương tối giản của phản ứng là $(x; y; z; t; u) = (1; 2; 1; 2; 2)$.]
  ),
  loigiai: [
    #step([Xét các mệnh đề bảo toàn nguyên tố])
    - Zn: $x = z <=> x - z = 0$ (Ý a ĐÚNG).
    - H: $2y = 2u <=> y = u$ (Ý b ĐÚNG).
    - S: $y = z + t <=> y - z - t = 0$ (Ý c ĐÚNG).
    - O: $4y = 4z + 2t + u$.
    #step([Tìm bộ hệ số nguyên dương tối giản])
    Thay $z = x, u = y$ vào:
    $ y = x + t <=> t = y - x $
    Thay vào phương trình Oxi:
    $ 4y = 4x + 2(y - x) + y = 4x + 2y - 2x + y = 2x + 3y <=> y = 2x $
    Chọn $x = 1 => y = 2$.
    Khi đó: $z = 1, t = 2 - 1 = 1, u = 2$.
    Phương trình cân bằng:
    $ "Zn" + 2"H"_2"SO"_4 -> "ZnSO"_4 + "SO"_2 + 2"H"_2"O" $
    Bộ hệ số tối giản là $(1; 2; 1; 1; 2)$ chứ không phải $(1; 2; 1; 2; 2)$.
    Do đó mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Một vật có trọng lượng $P = 100" N"$ được giữ cân bằng bởi ba lực căng dây $vec(T)_1, vec(T)_2, vec(T)_3$ tại nút thắt $O$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-1.5, 1.2), (0, 0), stroke: 1.2pt + rgb("1d4ed8"))
    content((-1.7, 1.3), text(size: 7.5pt)[$vec(T)_1$])
    line((1.5, 1.2), (0, 0), stroke: 1.2pt + rgb("1d4ed8"))
    content((1.7, 1.3), text(size: 7.5pt)[$vec(T)_2$])
    line((0, 0), (0, -1.2), stroke: 1.2pt + rgb("dc2626"))
    content((0.3, -1.0), text(size: 7.5pt, fill: rgb("dc2626"))[$vec(T)_3$])
    circle((0, 0), radius: 3pt, fill: rgb("1e293b"))
    content((0.2, 0.2), text(size: 8pt)[$O$])
  })
]
Dây 3 thẳng đứng nối trực tiếp với vật nặng. Hai dây 1 và 2 đối xứng nhau qua phương thẳng đứng và hợp với phương ngang một góc $30^circ$.],
  (
    True([Lực căng dây thứ ba có độ lớn bằng đúng trọng lượng vật: $T_3 = 100" N"$.]),
    True([Phương trình cân bằng lực theo phương ngang là $T_1 cos(30^circ) - T_2 cos(30^circ) = 0$.]),
    True([Lực căng của hai dây 1 và 2 bằng nhau: $T_1 = T_2 = 100" N"$.]),
    [Tổng độ lớn lực căng của ba sợi dây là $T_1 + T_2 + T_3 = 400" N"$.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    Dây 3 chịu trực tiếp trọng lượng vật nên $T_3 = P = 100" N"$. Ý a ĐÚNG.
    Chiếu lên phương ngang: $T_1 cos(30^circ) - T_2 cos(30^circ) = 0 <=> T_1 = T_2$. Ý b ĐÚNG.
    #step([Xét ý c và d])
    Chiếu lên phương thẳng đứng:
    $ T_1 sin(30^circ) + T_2 sin(30^circ) - T_3 = 0 $
    Vì $T_1 = T_2$ nên:
    $ 2 T_1 sin(30^circ) = T_3 <=> 2 T_1 (1/2) = 100 <=> T_1 = 100" N" $
    Vậy $T_1 = T_2 = 100" N"$. Ý c ĐÚNG.
    Tổng độ lớn ba lực căng là: $100 + 100 + 100 = 300" N"$ chứ không phải $400" N"$. Ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Xét phản ứng oxi hóa - khử phức tạp giữa Photpho ($P$) và axit Nitric ($"HNO"_3$) trong nước:
$ x"P" + y"HNO"_3 + z"H"_2"O" -> t"H"_3"PO"_4 + u"NO" $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1d4ed8"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Cân bằng phản ứng Oxi hóa - Khử])
  })
]],
  (
    True([Phương trình bảo toàn nguyên tố Photpho là $x - t = 0$.]),
    True([Phương trình bảo toàn nguyên tố Nitơ là $y - u = 0$.]),
    True([Hệ số nguyên dương tối giản của axit nitric là $y = 5$.]),
    [Số phân tử nước tham gia phản ứng là $z = 4$.]
  ),
  loigiai: [
    #step([Bảo toàn electron])
    - Quá trình oxi hóa: $"P"^0 -> "P"^(+5) + 5e$.
    - Quá trình khử: $"N"^(+5) + 3e -> "N"^(+2)$ (trong $"NO"$).
    Bội chung nhỏ nhất của 5 và 3 là 15:
    - Hệ số của P: $15/5 = 3 => x = t = 3$ (Ý a ĐÚNG).
    - Hệ số của N: $15/3 = 5 => y = u = 5$ (Ý b ĐÚNG, Ý c ĐÚNG).
    #step([Bảo toàn Hiđro và Oxi])
    - Bảo toàn H: $y + 2z = 3t <=> 5 + 2z = 3(3) = 9 <=> 2z = 4 <=> z = 2$.
    Phương trình hoàn chỉnh:
    $ 3"P" + 5"HNO"_3 + 2"H"_2"O" -> 3"H"_3"PO"_4 + 5"NO" $
    Số phân tử nước là $z = 2$ chứ không phải $4$. Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Ba lực đồng quy $vec(F)_1, vec(F)_2, vec(F)_3$ cùng tác dụng lên một chất điểm nằm cân bằng tại gốc tọa độ $O$ trong mặt phẳng $O x y$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, 0), (2, 0), stroke: 0.8pt, mark: (end: "stealth"))
    line((0, -1.5), (0, 1.5), stroke: 0.8pt, mark: (end: "stealth"))
    line((0, 0), (1.5, 0), stroke: 1.2pt + rgb("1d4ed8"), mark: (end: "stealth"))
    content((1.6, 0.25), text(size: 7.5pt)[$vec(F)_1$])
    line((0, 0), (0, 1.2), stroke: 1.2pt + rgb("16a34a"), mark: (end: "stealth"))
    content((0.25, 1.2), text(size: 7.5pt)[$vec(F)_2$])
    line((0, 0), (-1.2, -0.96), stroke: 1.2pt + rgb("dc2626"), mark: (end: "stealth"))
    content((-1.4, -1.0), text(size: 7.5pt, fill: rgb("dc2626"))[$vec(F)_3$])
  })
]
Biết rằng lực $vec(F)_1$ hướng theo trục $O x$ có độ lớn $F_1 = 30" N"$; lực $vec(F)_2$ hướng theo trục $O y$ có độ lớn $F_2 = 40" N"$.],
  (
    True([Hợp lực của $vec(F)_1$ và $vec(F)_2$ có độ lớn bằng $50" N"$.]),
    True([Để chất điểm cân bằng thì $vec(F)_3 = -(vec(F)_1 + vec(F)_2)$.]),
    True([Độ lớn của lực $vec(F)_3$ bằng đúng $50" N"$.]),
    [Góc hợp bởi vectơ lực $vec(F)_3$ và trục $O x$ bằng $45^circ$.]
  ),
  loigiai: [
    #step([Tính hợp lực])
    Vì $vec(F)_1$ vuông góc với $vec(F)_2$:
    $ F_12 = sqrt(F_1^2 + F_2^2) = sqrt(30^2 + 40^2) = sqrt(900 + 1600) = sqrt(2500) = 50" N" $ (Ý a ĐÚNG).
    #step([Điều kiện cân bằng])
    $ vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0) <=> vec(F)_3 = -(vec(F)_1 + vec(F)_2) $ (Ý b ĐÚNG).
    Độ lớn $F_3 = F_12 = 50" N"$ (Ý c ĐÚNG).
    Góc hợp bởi $vec(F)_12$ với trục $O x$ thỏa mãn $tan alpha = 40/30 = 4/3 != 1$, do đó góc không thể bằng $45^circ$. Ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cân bằng phản ứng oxi hóa - khử sau bằng hệ phương trình bảo toàn nguyên tố:
$ x"Al" + y"HCl" -> z"AlCl"_3 + t"H"_2 $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1d4ed8"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Kim loại nhôm phản ứng với axit HCl])
  })
]
Tổng các hệ số nguyên dương tối giản $S = x + y + z + t$ bằng bao nhiêu?],
    [13],
    loigiai: [
        #step([Bảo toàn electron và nguyên tố])
        - Al: $x = z = 2$.
        - Cl: $y = 3z = 3(2) = 6$.
        - H: $y = 2t <=> 6 = 2t <=> t = 3$.
        Phương trình hoàn chỉnh:
        $ 2"Al" + 6"HCl" -> 2"AlCl"_3 + 3"H"_2 $
        Tổng các hệ số:
        $ S = 2 + 6 + 2 + 3 = 13 $
    ]
)

// TLN 2 (Câu 18)
#tln([Một thanh đồng chất dài $2" m"$, khối lượng không đáng kể, được đặt cân bằng nằm ngang trên một điểm tựa $O$. Ở đầu bên trái treo vật nặng $m_1 = 6" kg"$, cách điểm tựa $O$ một khoảng $d_1 = 0.5" m"$. Ở đầu bên phải cách $O$ một khoảng $d_2 = 1.5" m"$ cần treo một vật nặng có khối lượng $m_2$ bằng bao nhiêu kg để đòn bẩy giữ trạng thái cân bằng nằm ngang?],
    [2],
    loigiai: [
        #step([Quy tắc mômen lực])
        Điều kiện cân bằng đòn bẩy (mômen lực):
        $ m_1 g d_1 = m_2 g d_2 <=> m_1 d_1 = m_2 d_2 $
        Thay số:
        $ 6 times 0.5 = m_2 times 1.5 <=> 3 = 1.5 m_2 <=> m_2 = 2" kg" $
        Vậy khối lượng vật cần treo là $2" kg"$.
    ]
)

// TLN 3 (Câu 19)
#tln([Cân bằng phản ứng oxi hóa - khử giữa sắt từ oxit và axit nitric loãng:
$ x"Fe"_3"O"_4 + y"HNO"_3 -> z"Fe"("NO"_3)_3 + t"NO" + u"H"_2"O" $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1d4ed8"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Tìm hệ số tối giản y của axit HNO3])
  })
]
Hệ số nguyên dương tối giản của phân tử $"HNO"_3$ ($y$) bằng bao nhiêu?],
    [28],
    loigiai: [
        #step([Bảo toàn electron])
        - Quá trình oxi hóa: $3"Fe"^(+8/3) -> 3"Fe"^(+3) + 1e$ (1 phân tử $"Fe"_3"O"_4$ nhường 1e).
        - Quá trình khử: $"N"^(+5) + 3e -> "N"^(+2)$ (1 phân tử NO nhận 3e).
        Do đó hệ số của $"Fe"_3"O"_4$ là $3$, hệ số của NO là $1$:
        $x = 3, t = 1$.
        - Bảo toàn Fe: $z = 3x = 3(3) = 9$.
        - Bảo toàn N: $y = 3z + t = 3(9) + 1 = 28$.
        - Bảo toàn H: $2u = y = 28 => u = 14$.
        Phương trình hoàn chỉnh:
        $ 3"Fe"_3"O"_4 + 28"HNO"_3 -> 9"Fe"("NO"_3)_3 + "NO" + 14"H"_2"O" $
        Hệ số của $"HNO"_3$ là $y = 28$.
    ]
)

// TLN 4 (Câu 20)
#tln([Một vật có trọng lượng $P = 120" N"$ được treo vào điểm chính giữa của một sợi dây cáp có chiều dài không đáng kể. Hai đầu dây gắn vào hai mốc cố định trên trần nằm ngang sao cho sợi dây bị võng xuống tạo thành góc $120^circ$ tại vị trí treo vật. Lực căng của mỗi nửa sợi dây bằng bao nhiêu Newton?],
    [120],
    loigiai: [
        #step([Tính lực căng dây])
        Góc giữa hai nửa sợi dây là $120^circ$, do đó mỗi nửa dây hợp với phương thẳng đứng một góc $60^circ$.
        Điều kiện cân bằng theo phương thẳng đứng:
        $ 2 T cos(60^circ) = P $
        Vì $cos(60^circ) = 1/2$ nên:
        $ 2 T (1/2) = P <=> T = P = 120" N" $
        Vậy lực căng dây bằng $120" N"$.
    ]
)

// TLN 5 (Câu 21)
#tln([Trong phản ứng nhiệt nhôm:
$ x"Al" + y"Fe"_2"O"_3 -> z"Al"_2"O"_3 + t"Fe" $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fee2e2"), stroke: 1pt + rgb("ef4444"))
    content((0, 0), text(size: 8pt, fill: rgb("b91c1c"), weight: "bold")[Phản ứng tỏa nhiệt mạnh sinh sắt nóng chảy])
  })
]
Nếu dùng hết $5.4" g"$ kim loại Nhôm ($M_"Al" = 27" g/mol"$), khối lượng Sắt ($M_"Fe" = 56" g/mol"$) thu được theo lý thuyết là bao nhiêu gam?],
    [11.2],
    loigiai: [
        #step([Cân bằng phản ứng])
        $ 2"Al" + "Fe"_2"O"_3 -> "Al"_2"O"_3 + 2"Fe" $
        Hệ số của Al và Fe bằng nhau ($x = t = 2$).
        #step([Tính khối lượng])
        Số mol Al phản ứng:
        $ n_"Al" = 5.4 / 27 = 0.2" mol" $
        Theo phương trình phản ứng:
        $ n_"Fe" = n_"Al" = 0.2" mol" $
        Khối lượng Sắt thu được:
        $ m_"Fe" = 0.2 times 56 = 11.2" g" $
    ]
)

// TLN 6 (Câu 22)
#tln([Cân bằng phản ứng oxi hóa - khử của Kali pemanganat với Axit clohiđric đặc sinh ra khí Clo:
$ x"KMnO"_4 + y"HCl" -> z"KCl" + t"MnCl"_2 + u"Cl"_2 + v"H"_2"O" $
Tổng số nguyên tử của các chất tham gia phản ứng trong hệ số nguyên dương tối giản ($x + y$) bằng bao nhiêu?],
    [18],
    loigiai: [
        #step([Bảo toàn electron])
        - $"Mn"^(+7) + 5e -> "Mn"^(+2)$ (1 phân tử nhận 5e).
        - $2"Cl"^(-1) -> "Cl"_2^0 + 2e$ (1 phân tử nhường 2e).
        Hệ số của $"KMnO"_4$ là $2$, hệ số của $"Cl"_2$ là $5$:
        $x = 2, u = 5$.
        - Bảo toàn K: $z = x = 2$.
        - Bảo toàn Mn: $t = x = 2$.
        - Bảo toàn O: $v = 4x = 4(2) = 8$.
        - Bảo toàn H: $y = 2v = 2(8) = 16$.
        Phương trình hoàn chỉnh:
        $ 2"KMnO"_4 + 16"HCl" -> 2"KCl" + 2"MnCl"_2 + 5"Cl"_2 + 8"H"_2"O" $
        Tổng hệ số chất tham gia:
        $ x + y = 2 + 16 = 18 $
    ]
)

] // end make-questions

#make-questions()
