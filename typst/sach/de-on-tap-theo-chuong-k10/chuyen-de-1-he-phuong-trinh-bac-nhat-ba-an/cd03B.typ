#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("059669") // Emerald Green cho Đề 3B

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 1: HỆ PHƯƠNG TRÌNH BẬC NHẤT BA ẨN",
  exam-title: "BÀI 3: ỨNG DỤNG MẠCH ĐIỆN KIRCHHOFF & ĐIỆN TRỞ TƯƠNG ĐƯƠNG (ĐỀ B)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "308",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Định luật nút mạng Kirchhoff thứ nhất (KCL) phát biểu: "Tại bất kỳ một nút phân nhánh nào của mạch điện, tổng các cường độ dòng điện đi vào nút bằng tổng các cường độ dòng điện đi ra khỏi nút".
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    circle((0, 0), radius: 0.1, fill: rgb("059669"), stroke: 1.5pt + rgb("047857"))
    content((0, -0.3), text(size: 8pt, weight: "bold", fill: rgb("047857"))[Nút $A$])
    // Nhánh vào I1, I2
    line((-2, 1), (-0.1, 0.05), stroke: 1.2pt + rgb("059669"), mark: (end: "stealth"))
    content((-1.2, 0.8), text(size: 8pt)[$I_1$])
    line((-2, -1), (-0.1, -0.05), stroke: 1.2pt + rgb("059669"), mark: (end: "stealth"))
    content((-1.2, -0.8), text(size: 8pt)[$I_2$])
    // Nhánh ra I3
    line((0.1, 0), (2, 0), stroke: 1.2pt + rgb("dc2626"), mark: (end: "stealth"))
    content((1.2, 0.3), text(size: 8pt)[$I_3$])
  })
]
Nếu dòng điện $I_1$ và $I_2$ đi vào nút $A$, dòng điện $I_3$ đi ra khỏi nút $A$, phương trình đại số tương ứng là],
    (
        True([$I_1 + I_2 - I_3 = 0$]),
        [$I_1 - I_2 + I_3 = 0$],
        [$I_1 + I_2 + I_3 = 0$],
        [$I_1 - I_2 - I_3 = 0$]
    ),
    loigiai: [
        #step([Áp dụng định luật nút mạng Kirchhoff I])
        Tổng dòng điện đi vào bằng tổng dòng điện đi ra:
        $ I_1 + I_2 = I_3 <=> I_1 + I_2 - I_3 = 0 $
    ]
)

// TN 2
#tn([Định luật mắt lưới Kirchhoff thứ hai (KVL) phát biểu: "Đi dọc theo một vòng kín của mạch điện theo một chiều quy ước xác định, tổng các độ giảm thế trên các điện trở bằng tổng các suất điện động trong vòng đó":
$ sum I_k R_k = sum E_k $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-1.8, -1), (1.8, 1), stroke: 1.2pt + rgb("059669"))
    // Nguồn E1
    rect((-0.5, 0.85), (0.5, 1.15), fill: white, stroke: none)
    content((0, 1), text(size: 7.5pt, weight: "bold")[$E$])
    // Điện trở R
    rect((-0.5, -1.15), (0.5, -0.85), fill: white, stroke: none)
    rect((-0.4, -1.15), (0.4, -0.85), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((0, -1), text(size: 7.5pt)[$R$])
    // Chiều kim đồng hồ
    arc((0, 0), start: 45deg, stop: 315deg, radius: 0.5, stroke: (dash: "densely-dotted", paint: rgb("047857")), mark: (end: "stealth"))
  })
]
Định luật mắt lưới Kirchhoff thực chất là hệ quả trực tiếp của],
    (
        True([Định luật bảo toàn năng lượng]),
        [Định luật bảo toàn điện tích],
        [Định luật vạn vật hấp dẫn],
        [Định lý động lượng]
    ),
    loigiai: [
        #step([Ý nghĩa vật lý của hai định luật Kirchhoff])
        - Định luật nút KCL là hệ quả của *định luật bảo toàn điện tích*.
        - Định luật mắt lưới KVL là hệ quả của *định luật bảo toàn năng lượng* (công của lực điện trường dịch chuyển một điện tích theo một đường cong kín bằng không).
    ]
)

// TN 3
#tn([Cho mạch điện hai mắt lưới gồm ba nhánh như hình vẽ.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.2, -1.2), (2.2, 1.2), stroke: 1pt + rgb("059669"))
    line((0, -1.2), (0, 1.2), stroke: 1pt + rgb("059669"))
    // Nguồn E1 nhánh trái
    rect((-2.2, -0.2), (-2.2, 0.2), fill: white, stroke: none)
    content((-2.2, 0), text(size: 7pt, weight: "bold")[$E_1$])
    // R1 nhánh trên trái
    rect((-1.4, 1.05), (-0.8, 1.35), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((-1.1, 1.2), text(size: 7pt)[$R_1$])
    // R2 nhánh giữa
    rect((-0.25, -0.3), (0.25, 0.3), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((0, 0), text(size: 7pt)[$R_2$])
    // R3 nhánh phải
    rect((0.8, 1.05), (1.4, 1.35), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((1.1, 1.2), text(size: 7pt)[$R_3$])
    // Nguồn E2 nhánh phải
    rect((2.2, -0.2), (2.2, 0.2), fill: white, stroke: none)
    content((2.2, 0), text(size: 7pt, weight: "bold")[$E_2$])
    content((0, 1.4), text(size: 7pt, fill: rgb("047857"))[Nút $A$])
    content((0, -1.4), text(size: 7pt, fill: rgb("047857"))[Nút $B$])
  })
]
Biết $R_1 = 2 Omega, R_2 = 4 Omega, R_3 = 2 Omega$, $E_1 = 12" V", E_2 = 6" V"$. Giả sử dòng điện $I_1$ chạy từ $B$ qua $E_1, R_1$ đến $A$; dòng điện $I_2$ chạy từ $A$ xuống $B$ qua $R_2$; dòng điện $I_3$ chạy từ $B$ qua $E_2, R_3$ đến $A$. Phương trình KCL tại nút $A$ là],
    (
        True([$I_1 - I_2 + I_3 = 0$]),
        [$I_1 + I_2 + I_3 = 0$],
        [$I_1 + I_2 - I_3 = 0$],
        [$-I_1 + I_2 + I_3 = 0$]
    ),
    loigiai: [
        #step([Lập phương trình KCL tại nút A])
        - Dòng điện đi vào nút $A$: $I_1$ và $I_3$.
        - Dòng điện đi ra khỏi nút $A$: $I_2$.
        Theo định luật nút:
        $ I_1 + I_3 = I_2 <=> I_1 - I_2 + I_3 = 0 $
    ]
)

// TN 4
#tn([Trong mạch cầu Wheatstone cân bằng, điện kế $G$ mắc ở cầu giữa chỉ cường độ dòng điện $I_G = 0$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Cầu kim cương
    line((-1.8, 0), (0, 1.2), stroke: 1.2pt + rgb("059669"))
    line((0, 1.2), (1.8, 0), stroke: 1.2pt + rgb("059669"))
    line((-1.8, 0), (0, -1.2), stroke: 1.2pt + rgb("059669"))
    line((0, -1.2), (1.8, 0), stroke: 1.2pt + rgb("059669"))
    // Cầu giữa nối G
    line((0, 1.2), (0, -1.2), stroke: 1.2pt + rgb("dc2626"))
    circle((0, 0), radius: 0.25, fill: white, stroke: 1.2pt + rgb("dc2626"))
    content((0, 0), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"))[$G$])
    // Nhãn R
    content((-1.1, 0.8), text(size: 7.5pt)[$R_1$])
    content((1.1, 0.8), text(size: 7.5pt)[$R_2$])
    content((-1.1, -0.8), text(size: 7.5pt)[$R_3$])
    content((1.1, -0.8), text(size: 7.5pt)[$R_4$])
  })
]
Hệ thức liên hệ giữa bốn điện trở $R_1, R_2, R_3, R_4$ khi cầu cân bằng là],
    (
        True([$R_1 R_4 = R_2 R_3$]),
        [$R_1 R_2 = R_3 R_4$],
        [$R_1 + R_4 = R_2 + R_3$],
        [$R_1 / R_4 = R_2 / R_3$]
    ),
    loigiai: [
        #step([Điều kiện cân bằng cầu Wheatstone])
        Khi cầu cân bằng, điện thế tại hai nút của điện kế bằng nhau ($V_C = V_D$).
        Khi đó:
        $ U_1 / U_3 = U_2 / U_4 <=> (I_1 R_1) / (I_3 R_3) = (I_2 R_2) / (I_4 R_4) $
        Do $I_1 = I_2$ và $I_3 = I_4$, suy ra:
        $ R_1 / R_3 = R_2 / R_4 <=> R_1 R_4 = R_2 R_3 $
    ]
)

// TN 5
#tn([Cho một mạch điện gồm ba điện trở $R_1, R_2, R_3$ mắc song song với nhau vào hiệu điện thế không đổi $U = 12" V"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, 0), (-1.2, 0), stroke: 1pt + rgb("059669"))
    line((-1.2, -0.8), (-1.2, 0.8), stroke: 1pt + rgb("059669"))
    // 3 nhánh
    line((-1.2, 0.8), (-0.4, 0.8), stroke: 1pt + rgb("059669"))
    rect((-0.4, 0.65), (0.4, 0.95), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((0, 0.8), text(size: 7pt)[$R_1$])
    line((0.4, 0.8), (1.2, 0.8), stroke: 1pt + rgb("059669"))

    line((-1.2, 0), (-0.4, 0), stroke: 1pt + rgb("059669"))
    rect((-0.4, -0.15), (0.4, 0.15), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((0, 0), text(size: 7pt)[$R_2$])
    line((0.4, 0), (1.2, 0), stroke: 1pt + rgb("059669"))

    line((-1.2, -0.8), (-0.4, -0.8), stroke: 1pt + rgb("059669"))
    rect((-0.4, -0.95), (0.4, -0.65), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((0, -0.8), text(size: 7pt)[$R_3$])
    line((0.4, -0.8), (1.2, -0.8), stroke: 1pt + rgb("059669"))

    line((1.2, -0.8), (1.2, 0.8), stroke: 1pt + rgb("059669"))
    line((1.2, 0), (2, 0), stroke: 1pt + rgb("059669"))
  })
]
Biết $R_1 = 3 Omega, R_2 = 6 Omega, R_3 = 4 Omega$. Cường độ dòng điện tổng cộng chạy trong mạch chính là],
    (
        True([$9" A"$]),
        [$6" A"$],
        [$12" A"$],
        [$3" A"$]
    ),
    loigiai: [
        #step([Tính điện trở tương đương hoặc tổng dòng qua các nhánh])
        Dòng qua nhánh 1: $I_1 = U / R_1 = 12 / 3 = 4" A"$.
        Dòng qua nhánh 2: $I_2 = U / R_2 = 12 / 6 = 2" A"$.
        Dòng qua nhánh 3: $I_3 = U / R_3 = 12 / 4 = 3" A"$.
        Dòng điện mạch chính theo KCL:
        $ I = I_1 + I_2 + I_3 = 4 + 2 + 3 = 9" A" $
    ]
)

// TN 6
#tn([Trong một mạch điện kín gồm nguồn điện có suất điện động $E$, điện trở trong $r$ và điện trở mạch ngoài $R$. Cường độ dòng điện $I$ được xác định theo định luật Ohm cho toàn mạch là
$ I = E / (R + r) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-1.8, -0.8), (1.8, 0.8), stroke: 1.2pt + rgb("059669"))
    rect((-0.4, 0.65), (0.4, 0.95), fill: white, stroke: none)
    content((0, 0.8), text(size: 7.5pt, weight: "bold")[$E, r$])
    rect((-0.4, -0.95), (0.4, -0.65), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((0, -0.8), text(size: 7.5pt)[$R$])
  })
]
Hiệu điện thế giữa hai cực của nguồn điện (đoạn mạch ngoài) $U = V_+ - V_-$ thỏa mãn công thức nào sau đây?],
    (
        True([$U = E - I r$]),
        [$U = E + I r$],
        [$U = I r - E$],
        [$U = E / (I r)$]
    ),
    loigiai: [
        #step([Độ giảm thế qua nguồn điện])
        Theo định luật Ohm cho toàn mạch:
        $ E = I(R + r) = I R + I r = U + I r $
        Suy ra hiệu điện thế mạch ngoài:
        $ U = E - I r $
    ]
)

// TN 7
#tn([Chuyển đổi mạng điện trở tam giác ($Delta$) gồm $R_a, R_b, R_c$ sang mạng sao ($Y$) gồm $R_1, R_2, R_3$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Tam giác
    line((-1.5, -0.8), (1.5, -0.8), stroke: 1.2pt + rgb("059669"))
    line((1.5, -0.8), (0, 1.2), stroke: 1.2pt + rgb("059669"))
    line((0, 1.2), (-1.5, -0.8), stroke: 1.2pt + rgb("059669"))
    content((0, -1.05), text(size: 7pt, fill: rgb("059669"))[$R_c$])
    content((1, 0.3), text(size: 7pt, fill: rgb("059669"))[$R_a$])
    content((-1, 0.3), text(size: 7pt, fill: rgb("059669"))[$R_b$])
    // Sao bên trong
    circle((0, -0.1), radius: 0.08, fill: rgb("dc2626"))
    line((0, -0.1), (0, 1.2), stroke: (dash: "densely-dashed", paint: rgb("dc2626")))
    line((0, -0.1), (-1.5, -0.8), stroke: (dash: "densely-dashed", paint: rgb("dc2626")))
    line((0, -0.1), (1.5, -0.8), stroke: (dash: "densely-dashed", paint: rgb("dc2626")))
    content((0.2, 0.5), text(size: 7pt, fill: rgb("dc2626"))[$R_1$])
    content((-0.6, -0.2), text(size: 7pt, fill: rgb("dc2626"))[$R_2$])
    content((0.6, -0.2), text(size: 7pt, fill: rgb("dc2626"))[$R_3$])
  })
]
Công thức tính điện trở $R_1$ nối với đỉnh trên của tam giác là],
    (
        True([$R_1 = (R_a R_b) / (R_a + R_b + R_c)$]),
        [$R_1 = (R_a + R_b) / R_c$],
        [$R_1 = (R_b R_c) / (R_a + R_b + R_c)$],
        [$R_1 = (R_a R_c) / (R_a + R_b + R_c)$]
    ),
    loigiai: [
        #step([Công thức chuyển đổi Delta sang Y])
        Điện trở của một nhánh trong mạng sao bằng tích hai điện trở kề cận ở mạng tam giác chia cho tổng ba điện trở tam giác:
        $ R_1 = (R_a R_b) / (R_a + R_b + R_c) $
    ]
)

// TN 8
#tn([Một mạng điện phẳng có $n$ nút và $b$ nhánh (mỗi nhánh chứa các phần tử điện). Số phương trình độc lập tối đa viết theo định luật nút KCL là],
    (
        True([$n - 1$]),
        [$n$],
        [$n + 1$],
        [$b - n$]
    ),
    loigiai: [
        #step([Tính độc lập của các phương trình KCL])
        Nếu viết phương trình KCL cho tất cả $n$ nút trong mạch kín, tổng của tất cả $n$ phương trình này bằng 0 (vì mỗi nhánh nối giữa hai nút, dòng điện đi ra khỏi một nút sẽ đi vào nút kia).
        Do đó chỉ có đúng $n - 1$ phương trình là độc lập tuyến tính.
    ]
)

// TN 9
#tn([Trong một mạng điện phẳng có $b$ nhánh và $n$ nút. Số phương trình độc lập tối đa viết theo định luật mắt lưới KVL bằng số mắt lưới cơ bản (vòng độc lập) $m$, được tính bằng],
    (
        True([$m = b - n + 1$]),
        [$m = b + n - 1$],
        [$m = b - n$],
        [$m = b - 2n + 1$]
    ),
    loigiai: [
        #step([Công thức Euler cho đồ thị mạch điện phẳng])
        Theo lý thuyết mạch điện và công thức topo đồ thị:
        Tổng số ẩn dòng điện trong các nhánh là $b$.
        Số phương trình nút độc lập là $n - 1$.
        Số phương trình mắt lưới độc lập cần thiết để hệ xác định duy nhất nghiệm là:
        $ m = b - (n - 1) = b - n + 1 $
    ]
)

// TN 10
#tn([Cho mạch điện như hình vẽ, biết nguồn điện có suất điện động $E = 18" V"$, các điện trở $R_1 = 3 Omega, R_2 = 6 Omega$ mắc nối tiếp.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.8), (2, 0.8), stroke: 1.2pt + rgb("059669"))
    rect((-0.5, 0.65), (0.5, 0.95), fill: white, stroke: none)
    content((0, 0.8), text(size: 7.5pt, weight: "bold")[$E = 18" V"$])
    // Hai điện trở R1, R2 phía dưới
    rect((-1.5, -0.95), (-0.7, -0.65), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((-1.1, -0.8), text(size: 7.5pt)[$R_1$])
    rect((0.7, -0.95), (1.5, -0.65), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((1.1, -0.8), text(size: 7.5pt)[$R_2$])
  })
]
Hiệu điện thế đo được ở hai đầu điện trở $R_2$ là],
    (
        True([$12" V"$]),
        [$6" V"$],
        [$9" V"$],
        [$18" V"$]
    ),
    loigiai: [
        #step([Định luật phân thế])
        Cường độ dòng điện trong mạch:
        $ I = E / (R_1 + R_2) = 18 / (3 + 6) = 18 / 9 = 2" A" $
        Hiệu điện thế trên $R_2$:
        $ U_2 = I R_2 = 2 times 6 = 12" V" $
    ]
)

// TN 11
#tn([Để đo dòng điện rất nhỏ trong một nhánh mạch, người ta sử dụng một Ampe kế lý tưởng. Ampe kế lý tưởng có đặc tính là],
    (
        True([Điện trở nội bằng $0$ ($R_A = 0$)]),
        [Điện trở nội vô cùng lớn ($R_A -> oo$)],
        [Suất điện động nội rất lớn],
        [Cho dòng điện đi qua theo một chiều duy nhất]
    ),
    loigiai: [
        #step([Đặc tính dụng cụ đo lý tưởng])
        - Ampe kế mắc nối tiếp vào mạch cần đo, để không làm ảnh hưởng đến dòng điện ban đầu thì điện trở của nó phải triệt tiêu: $R_A = 0$.
        - Vôn kế mắc song song với đoạn mạch cần đo, để không làm rẽ dòng thì điện trở của nó phải vô cùng lớn: $R_V -> oo$.
    ]
)

// TN 12
#tn([Khi phân tích một mạng mạch điện gồm 3 vòng độc lập bằng phương pháp dòng điện mắt lưới, ta thu được hệ phương trình ma trận $R I = E$, trong đó ma trận điện trở $R$ có kích thước $3 times 3$. Đặc điểm quan trọng nhất của ma trận điện trở $R$ là],
    (
        True([Luôn là ma trận đối xứng ($R = R^T$)]),
        [Luôn là ma trận chéo],
        [Có định thức bằng $0$],
        [Có tất cả các phần tử đều âm]
    ),
    loigiai: [
        #step([Tính chất đối xứng của ma trận trở kháng])
        Điện trở chung giữa vòng $i$ và vòng $j$ là $R_(i j)$, và giữa vòng $j$ và vòng $i$ là $R_(j i)$.
        Vì điện trở là phần tử hai cực tuyến tính thụ động, ta luôn có $R_(i j) = R_(j i)$. Do đó ma trận điện trở mắt lưới luôn là ma trận đối xứng thực.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Cho mạch điện gồm 2 mắt lưới với 3 nhánh như hình vẽ.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -1.2), (2.5, 1.2), stroke: 1.2pt + rgb("059669"))
    line((0, -1.2), (0, 1.2), stroke: 1.2pt + rgb("059669"))
    // Nguồn E1 nhánh trái
    rect((-2.5, -0.3), (-2.5, 0.3), fill: white, stroke: none)
    content((-2.5, 0), text(size: 7.5pt, weight: "bold")[$E_1$])
    // R1 nhánh trên trái
    rect((-1.6, 1.05), (-0.8, 1.35), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((-1.2, 1.2), text(size: 7.5pt)[$R_1$])
    // R2 nhánh giữa
    rect((-0.3, -0.3), (0.3, 0.3), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((0, 0), text(size: 7.5pt)[$R_2$])
    // R3 nhánh trên phải
    rect((0.8, 1.05), (1.6, 1.35), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((1.2, 1.2), text(size: 7.5pt)[$R_3$])
    // Nguồn E2 nhánh phải
    rect((2.5, -0.3), (2.5, 0.3), fill: white, stroke: none)
    content((2.5, 0), text(size: 7.5pt, weight: "bold")[$E_2$])
    // Điểm nút
    circle((0, 1.2), radius: 0.08, fill: rgb("059669"))
    content((0, 1.45), text(size: 7.5pt, weight: "bold", fill: rgb("047857"))[Nút $A$])
    circle((0, -1.2), radius: 0.08, fill: rgb("059669"))
    content((0, -1.45), text(size: 7.5pt, weight: "bold", fill: rgb("047857"))[Nút $B$])
  })
]
Biết các thông số: $R_1 = 2 Omega, R_2 = 3 Omega, R_3 = 6 Omega$, các nguồn điện có suất điện động $E_1 = 12" V", E_2 = 6" V"$, điện trở trong không đáng kể. Chiều dòng điện quy ước: $I_1$ đi từ dưới lên qua $E_1$, $I_2$ đi từ $A$ xuống $B$ qua $R_2$, $I_3$ đi từ dưới lên qua $E_2$.],
  (
    True([Phương trình KCL tại nút $A$ là $I_1 - I_2 + I_3 = 0$.]),
    True([Phương trình KVL cho mắt lưới bên trái theo chiều kim đồng hồ là $2 I_1 + 3 I_2 = 12$.]),
    True([Phương trình KVL cho mắt lưới bên phải theo chiều ngược kim đồng hồ là $6 I_3 + 3 I_2 = 6$.]),
    [Dòng điện chạy qua điện trở $R_2$ có cường độ bằng $I_2 = 4" A"$.]
  ),
  loigiai: [
    #step([Lập hệ phương trình Kirchhoff])
    - Nút $A$: $I_1 + I_3 = I_2 <=> I_1 - I_2 + I_3 = 0$ (Ý a ĐÚNG).
    - Vòng trái (theo chiều kim đồng hồ):
      $ I_1 R_1 + I_2 R_2 = E_1 <=> 2 I_1 + 3 I_2 = 12 $ (Ý b ĐÚNG).
    - Vòng phải (theo chiều ngược kim đồng hồ từ $B$ lên qua $E_2, R_3$ rồi xuống $R_2$):
      $ I_3 R_3 + I_2 R_2 = E_2 <=> 6 I_3 + 3 I_2 = 6 $ (Ý c ĐÚNG).
    #step([Giải hệ phương trình ba ẩn])
    Từ phương trình KVL:
    $ I_1 = (12 - 3 I_2) / 2 = 6 - 1.5 I_2 $
    $ I_3 = (6 - 3 I_2) / 6 = 1 - 0.5 I_2 $
    Thay vào phương trình KCL:
    $ (6 - 1.5 I_2) - I_2 + (1 - 0.5 I_2) = 0 $
    $ <=> 7 - 3 I_2 = 0 <=> 3 I_2 = 7 <=> I_2 = 7/3" A" approx 2.33" A" $
    Do đó $I_2 = 7/3" A" != 4" A"$. Ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Xét mạch cầu Wheatstone không cân bằng được mắc vào nguồn điện một chiều $U = 10" V"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Cầu hình thoi
    line((-2, 0), (0, 1.2), stroke: 1.2pt + rgb("059669"))
    line((0, 1.2), (2, 0), stroke: 1.2pt + rgb("059669"))
    line((-2, 0), (0, -1.2), stroke: 1.2pt + rgb("059669"))
    line((0, -1.2), (2, 0), stroke: 1.2pt + rgb("059669"))
    line((0, 1.2), (0, -1.2), stroke: 1.2pt + rgb("dc2626"))
    // Nhãn điểm
    content((-2.2, 0), text(size: 7.5pt, weight: "bold")[$A$])
    content((2.2, 0), text(size: 7.5pt, weight: "bold")[$B$])
    content((0, 1.45), text(size: 7.5pt, weight: "bold")[$C$])
    content((0, -1.45), text(size: 7.5pt, weight: "bold")[$D$])
    // Nhãn R
    content((-1.2, 0.8), text(size: 7.5pt)[$R_1$])
    content((1.2, 0.8), text(size: 7.5pt)[$R_2$])
    content((-1.2, -0.8), text(size: 7.5pt)[$R_3$])
    content((1.2, -0.8), text(size: 7.5pt)[$R_4$])
    content((0.3, 0), text(size: 7.5pt, fill: rgb("dc2626"))[$R_5$])
  })
]
Cho biết giá trị các điện trở: $R_1 = 1 Omega, R_2 = 2 Omega, R_3 = 2 Omega, R_4 = 1 Omega, R_5 = 1 Omega$. Dòng điện vào từ đỉnh $A$ và ra ở đỉnh $B$.],
  (
    True([Do $R_1 R_4 = 1 times 1 = 1 != R_2 R_3 = 2 times 2 = 4$, cầu Wheatstone này không cân bằng.]),
    True([Do tính chất đối xứng của mạch, điện thế tại hai nút thỏa mãn $V_A - V_C = V_D - V_B$.]),
    True([Cường độ dòng điện qua nhánh giữa $R_5$ chạy từ nút $C$ xuống nút $D$.]),
    [Dòng điện chạy qua nhánh giữa $R_5$ có cường độ bằng $2" A"$.]
  ),
  loigiai: [
    #step([Kiểm tra điều kiện cân bằng])
    Tích chéo: $R_1 R_4 = 1 != R_2 R_3 = 4$. Do đó cầu không cân bằng (Ý a ĐÚNG).
    #step([Tính đối xứng của mạch điện])
    Vì $R_1 = R_4 = 1 Omega$ và $R_2 = R_3 = 2 Omega$, mạch có tính đối xứng phản đảo:
    $V_A - V_C = V_D - V_B$ và $V_C - V_B = V_A - V_D$ (Ý b ĐÚNG).
    #step([Xác định chiều và độ lớn dòng qua nhánh giữa])
    Chọn mốc điện thế $V_B = 0" V" => V_A = 10" V"$.
    Gọi điện thế nút $C$ là $V_C$, nút $D$ là $V_D$.
    Phương trình tại nút $C$:
    $ (10 - V_C)/1 = (V_C - 0)/2 + (V_C - V_D)/1 $
    $ <=> 10 - V_C = 0.5 V_C + V_C - V_D <=> 2.5 V_C - V_D = 10 $ (1)
    Phương trình tại nút $D$:
    $ (10 - V_D)/2 + (V_C - V_D)/1 = (V_D - 0)/1 $
    $ <=> 5 - 0.5 V_D + V_C - V_D = V_D <=> -V_C + 2.5 V_D = 5 $ (2)
    Cộng (1) và (2):
    $ 1.5 V_C + 1.5 V_D = 15 <=> V_C + V_D = 10 $
    Thay $V_D = 10 - V_C$ vào (1):
    $ 2.5 V_C - (10 - V_C) = 10 <=> 3.5 V_C = 20 <=> V_C = 20 / 3.5 = 40/7" V" $
    Suy ra: $V_D = 10 - 40/7 = 30/7" V"$.
    Vì $V_C = 40/7 > V_D = 30/7$, dòng điện chạy từ $C$ xuống $D$ (Ý c ĐÚNG).
    Độ lớn dòng điện qua $R_5$:
    $ I_5 = (V_C - V_D) / R_5 = (40/7 - 30/7) / 1 = 10/7" A" approx 1.43" A" != 2" A" $
    Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Một mạch phân dòng gồm ba điện trở $R_1, R_2, R_3$ mắc song song với nhau vào nguồn điện có suất điện động $E = 24" V"$, điện trở trong $r = 1 Omega$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -1.2), (2.4, 1.2), stroke: 1.2pt + rgb("059669"))
    // Nguồn
    rect((-2.4, -0.3), (-2.4, 0.3), fill: white, stroke: none)
    content((-2.4, 0), text(size: 7.5pt, weight: "bold")[$E, r$])
    // 3 nhánh song song bên phải
    line((0.8, -0.8), (0.8, 0.8), stroke: 1pt + rgb("059669"))
    line((0.8, 0.8), (1.4, 0.8), stroke: 1pt + rgb("059669"))
    rect((1.4, 0.65), (2.1, 0.95), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((1.75, 0.8), text(size: 7pt)[$R_1$])

    line((0.8, 0), (1.4, 0), stroke: 1pt + rgb("059669"))
    rect((1.4, -0.15), (2.1, 0.15), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((1.75, 0), text(size: 7pt)[$R_2$])

    line((0.8, -0.8), (1.4, -0.8), stroke: 1pt + rgb("059669"))
    rect((1.4, -0.95), (2.1, -0.65), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((1.75, -0.8), text(size: 7pt)[$R_3$])
  })
]
Biết rằng $R_1 = 6 Omega, R_2 = 12 Omega, R_3 = 4 Omega$.],
  (
    True([Điện trở tương đương của bộ ba điện trở mắc song song là $R_(n g) = 2 Omega$.]),
    True([Cường độ dòng điện trong mạch chính chạy qua nguồn là $I = 8" A"$.]),
    True([Hiệu điện thế giữa hai đầu bộ điện trở ngoài là $U = 16" V"$.]),
    [Cường độ dòng điện chạy qua điện trở $R_1$ là $I_1 = 4" A"$.]
  ),
  loigiai: [
    #step([Tính điện trở tương đương mạch ngoài])
    $ 1 / R_(n g) = 1 / R_1 + 1 / R_2 + 1 / R_3 = 1/6 + 1/12 + 1/4 = 2/12 + 1/12 + 3/12 = 6/12 = 1/2 $
    $ => R_(n g) = 2 Omega $ (Ý a ĐÚNG).
    #step([Tính dòng mạch chính và hiệu điện thế])
    Theo định luật Ohm toàn mạch:
    $ I = E / (R_(n g) + r) = 24 / (2 + 1) = 24 / 3 = 8" A" $ (Ý b ĐÚNG).
    Hiệu điện thế mạch ngoài:
    $ U = I R_(n g) = 8 times 2 = 16" V" $ (Ý c ĐÚNG).
    #step([Tính dòng qua nhánh R1])
    $ I_1 = U / R_1 = 16 / 6 = 8/3" A" approx 2.67" A" != 4" A" $
    Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Xét mạch điện ba vòng kín độc lập được mô tả bởi hệ phương trình dòng điện mắt lưới sau:
$ mat(
  5, -2, 0;
  -2, 6, -1;
  0, -1, 4
) mat(i_1; i_2; i_3) = mat(12; 0; 8) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.6), (2, 0.6), fill: rgb("ecfdf5"), stroke: 1.2pt + rgb("059669"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("047857"))[Mô hình dòng điện mắt lưới $R I = E$])
  })
]],
  (
    True([Ma trận điện trở mắt lưới là ma trận vuông cấp 3 đối xứng.]),
    True([Định thức của ma trận điện trở bằng $|R| = 99$.]),
    True([Hệ phương trình có nghiệm duy nhất vì định thức khác $0$.]),
    [Dòng điện mắt lưới thứ hai có giá trị bằng $0" A"$.]
  ),
  loigiai: [
    #step([Kiểm tra ma trận điện trở])
    Ma trận $R = mat(5, -2, 0; -2, 6, -1; 0, -1, 4)$ thỏa mãn $R = R^T$, nên là ma trận đối xứng (Ý a ĐÚNG).
    #step([Tính định thức ma trận R])
    Khai triển định thức theo dòng 1:
    $ |R| = 5(6 times 4 - (-1)^2) - (-2)((-2) times 4 - 0) + 0 $
    $ = 5(24 - 1) + 2(-8) = 115 - 16 = 99 $ (Ý b ĐÚNG).
    Vì $|R| = 99 != 0$, theo quy tắc Cramer hệ phương trình có nghiệm duy nhất (Ý c ĐÚNG).
    #step([Xét ý d])
    Từ phương trình thứ hai: $-2 i_1 + 6 i_2 - i_3 = 0 <=> i_2 = (2 i_1 + i_3)/6$.
    Vì các nguồn $E_1 = 12" V" > 0, E_3 = 8" V" > 0$, dòng điện mắt lưới $i_1, i_3 > 0$, suy ra $i_2 > 0 != 0$. Ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho mạch điện gồm hai mắt lưới như hình vẽ:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -1), (2.4, 1), stroke: 1.2pt + rgb("059669"))
    line((0, -1), (0, 1), stroke: 1.2pt + rgb("059669"))
    // E1
    rect((-2.4, -0.2), (-2.4, 0.2), fill: white, stroke: none)
    content((-2.4, 0), text(size: 7.5pt, weight: "bold")[$E_1 = 20" V"$])
    // R1
    rect((-1.5, 0.85), (-0.7, 1.15), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((-1.1, 1), text(size: 7.5pt)[$R_1 = 4 Omega$])
    // R2
    rect((-0.3, -0.2), (0.3, 0.2), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((0, 0), text(size: 7.5pt)[$R_2 = 2 Omega$])
    // R3
    rect((0.7, 0.85), (1.5, 1.15), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((1.1, 1), text(size: 7.5pt)[$R_3 = 4 Omega$])
    // E2
    rect((2.4, -0.2), (2.4, 0.2), fill: white, stroke: none)
    content((2.4, 0), text(size: 7.5pt, weight: "bold")[$E_2 = 12" V"$])
  })
]
Biết các nguồn điện $E_1 = 20" V", E_2 = 12" V"$. Dòng điện nhánh trái $I_1$ chạy từ dưới lên, nhánh giữa $I_2$ chạy từ trên xuống, nhánh phải $I_3$ chạy từ dưới lên. Cường độ dòng điện $I_1$ bằng bao nhiêu Ampe?],
    [3],
    loigiai: [
        #step([Lập hệ phương trình Kirchhoff])
        - Nút trên: $I_1 - I_2 + I_3 = 0 <=> I_2 = I_1 + I_3$.
        - Vòng trái: $4 I_1 + 2 I_2 = 20 <=> 4 I_1 + 2(I_1 + I_3) = 20 <=> 6 I_1 + 2 I_3 = 20 <=> 3 I_1 + I_3 = 10$.
        - Vòng phải: $4 I_3 + 2 I_2 = 12 <=> 4 I_3 + 2(I_1 + I_3) = 12 <=> 2 I_1 + 6 I_3 = 12 <=> I_1 + 3 I_3 = 6$.
        #step([Giải hệ hai ẩn I1, I3])
        Từ $I_3 = 10 - 3 I_1$, thay vào phương trình thứ hai:
        $ I_1 + 3(10 - 3 I_1) = 6 <=> I_1 + 30 - 9 I_1 = 6 <=> -8 I_1 = -24 <=> I_1 = 3" A" $
        Suy ra $I_3 = 10 - 3(3) = 1" A"$, $I_2 = 3 + 1 = 4" A"$.
        Cường độ dòng điện $I_1 = 3" A"$.
    ]
)

// TLN 2 (Câu 18)
#tln([Một mạch điện gồm nguồn điện $E = 36" V"$ có điện trở trong $r = 0 Omega$ cung cấp cho ba điện trở $R_1, R_2, R_3$ mắc nối tiếp.
Biết hiệu điện thế đo trên $R_1$ là $U_1 = 6" V"$, trên $R_2$ là $U_2 = 12" V"$. Nếu điện trở $R_1 = 5 Omega$, thì điện trở $R_3$ bằng bao nhiêu Ôm ($Omega$)?],
    [15],
    loigiai: [
        #step([Tính dòng điện trong đoạn mạch nối tiếp])
        Dòng điện qua mạch:
        $ I = U_1 / R_1 = 6 / 5 = 1.2" A" $
        #step([Tính hiệu điện thế và điện trở R3])
        Hiệu điện thế trên $R_3$:
        $ U_3 = E - U_1 - U_2 = 36 - 6 - 12 = 18" V" $
        Giá trị của điện trở $R_3$:
        $ R_3 = U_3 / I = 18 / 1.2 = 15 Omega $
    ]
)

// TLN 3 (Câu 19)
#tln([Trong một mạng điện hình sao gồm ba điện trở bằng nhau $R_a = R_b = R_c = 12 Omega$ nối với ba đỉnh của mạng tam giác.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    circle((0, 0), radius: 0.08, fill: rgb("059669"))
    line((0, 0), (0, 1), stroke: 1.2pt + rgb("059669"))
    line((0, 0), (-0.86, -0.5), stroke: 1.2pt + rgb("059669"))
    line((0, 0), (0.86, -0.5), stroke: 1.2pt + rgb("059669"))
    content((0, 1.2), text(size: 7.5pt)[Đỉnh $1$])
    content((-1.1, -0.6), text(size: 7.5pt)[Đỉnh $2$])
    content((1.1, -0.6), text(size: 7.5pt)[Đỉnh $3$])
  })
]
Khi chuyển đổi mạng hình sao này sang mạng hình tam giác tương đương, giá trị của mỗi điện trở trong mạch tam giác tương đương bằng bao nhiêu Ôm ($Omega$)?],
    [36],
    loigiai: [
        #step([Công thức chuyển đổi Sao sang Tam giác])
        Khi ba điện trở hình sao bằng nhau $R_Y = 12 Omega$, điện trở tương đương của mạch tam giác $R_Delta$ được tính bằng:
        $ R_Delta = 3 R_Y = 3 times 12 = 36 Omega $
    ]
)

// TLN 4 (Câu 20)
#tln([Một khối lập phương gồm 12 cạnh, mỗi cạnh là một điện trở có giá trị $R = 12 Omega$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Khung lập phương
    rect((-1, -1), (0.6, 0.6), stroke: 1pt + rgb("059669"))
    rect((-0.6, -0.6), (1, 1), stroke: 1pt + rgb("059669"))
    line((-1, -1), (-0.6, -0.6), stroke: 1pt + rgb("059669"))
    line((0.6, -1), (1, -0.6), stroke: 1pt + rgb("059669"))
    line((-1, 0.6), (-0.6, 1), stroke: 1pt + rgb("059669"))
    line((0.6, 0.6), (1, 1), stroke: 1pt + rgb("059669"))
    // Hai đỉnh đối diện
    circle((-1, -1), radius: 0.1, fill: rgb("dc2626"))
    content((-1.3, -1.2), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"))[$A$])
    circle((1, 1), radius: 0.1, fill: rgb("dc2626"))
    content((1.3, 1.2), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"))[$B$])
  })
]
Điện trở tương đương giữa hai đỉnh đối diện xa nhất $A$ và $B$ của khối lập phương bằng bao nhiêu Ôm ($Omega$)?],
    [10],
    loigiai: [
        #step([Phân tích tính đối xứng của mạch điện lập phương])
        Giả sử có dòng điện $I$ đi vào đỉnh $A$ và đi ra ở đỉnh $B$.
        - Tại đỉnh $A$, dòng điện chia đều vào 3 nhánh cạnh xuất phát từ $A$, mỗi nhánh có dòng $I/3$.
        - Sau đó mỗi nhánh lại chia thành 2 nhánh ở tầng giữa, tổng cộng 6 nhánh, mỗi nhánh có dòng $I/6$.
        - Cuối cùng, 6 nhánh gom lại thành 3 nhánh đi vào đỉnh $B$, mỗi nhánh có dòng $I/3$.
        #step([Tính hiệu điện thế và điện trở tương đương])
        Hiệu điện thế giữa hai đỉnh $A$ và $B$:
        $ U_(A B) = (I/3) R + (I/6) R + (I/3) R = (5/6) I R $
        Điện trở tương đương:
        $ R_(A B) = U_(A B) / I = 5/6 R = 5/6 times 12 = 10 Omega $
    ]
)

// TLN 5 (Câu 21)
#tln([Cho đoạn mạch gồm ba điện trở $R_1 = 4 Omega, R_2 = 6 Omega, R_3 = 12 Omega$ mắc song song với nhau. Một nguồn điện một chiều cung cấp dòng điện có cường độ $I = 6" A"$ vào mạch chính.
Nhiệt lượng tỏa ra trên điện trở $R_1$ trong thời gian $t = 10$ giây bằng bao nhiêu Jun ($"J"$)?],
    [360],
    loigiai: [
        #step([Tính điện trở tương đương và hiệu điện thế])
        $ 1 / R_(t d) = 1/4 + 1/6 + 1/12 = 3/12 + 2/12 + 1/12 = 6/12 = 1/2 => R_(t d) = 2 Omega $
        Hiệu điện thế giữa hai đầu bộ điện trở:
        $ U = I R_(t d) = 6 times 2 = 12" V" $
        #step([Tính dòng qua R1 và nhiệt lượng tỏa ra])
        Cường độ dòng điện qua $R_1$:
        $ I_1 = U / R_1 = 12 / 4 = 3" A" $
        Nhiệt lượng tỏa ra theo định luật Joule - Lenz:
        $ Q_1 = R_1 I_1^2 t = 4 times 3^2 times 10 = 4 times 9 times 10 = 360" J" $
    ]
)

// TLN 6 (Câu 22)
#tln([Trong mạch điện cầu Wheatstone, các điện trở có giá trị $R_1 = 10 Omega, R_2 = 20 Omega, R_3 = 15 Omega$ và một biến trở $R_x$ mắc ở nhánh thứ tư.
Để cầu Wheatstone cân bằng (không có dòng điện chạy qua điện kế ở giữa), giá trị của biến trở $R_x$ phải được điều chỉnh bằng bao nhiêu Ôm ($Omega$)?],
    [30],
    loigiai: [
        #step([Áp dụng điều kiện cân bằng cầu Wheatstone])
        Cầu cân bằng khi tích các điện trở đối diện bằng nhau:
        $ R_1 R_x = R_2 R_3 $
        Thay các giá trị vào:
        $ 10 times R_x = 20 times 15 <=> 10 R_x = 300 <=> R_x = 30 Omega $
    ]
)

] // end make-questions

#make-questions()
