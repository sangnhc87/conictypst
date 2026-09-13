#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("be123c") // Rose/Ruby cho Đề 8C

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 3: BA ĐƯỜNG CONIC & ỨNG DỤNG",
  exam-title: "BÀI 2: BÁN KÍNH QUA TIÊU VÀ TÍNH CHẤT HÌNH HỌC (ĐỀ C - QUANG HỌC & CỰC TRỊ VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "324",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Tính chất quang học của đường parabol khẳng định rằng: Mọi tia sáng xuất phát từ tiêu điểm $F$ sau khi phản xạ tại bề mặt của gương parabol sẽ tạo thành
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Axis
    line((-0.5, 0), (4.0, 0), stroke: (paint: rgb("94a3b8"), dash: "dashed"))
    // Parabola curve y^2 = 2*1*x -> x = y^2 / 2
    let pts = ()
    for i in range(-16, 17) {
      let y = i * 0.1
      let x = (y * y) / 2.0
      pts.push((x, y))
    }
    line(..pts, stroke: 1.5pt + rgb("be123c"))
    // Focus F(0.5, 0)
    circle((0.5, 0), radius: 0.08, fill: rgb("be123c"))
    content((0.5, -0.3), text(size: 7.5pt, weight: "bold")[$F$])
    // Rays from F
    let rays = (1.2, -1.2, 0.8, -0.8)
    for y in rays {
      let x = (y * y) / 2.0
      line((0.5, 0), (x, y), stroke: 1pt + rgb("ea580c"), mark: (end: "stealth"))
      line((x, y), (3.8, y), stroke: 1pt + rgb("ea580c"), mark: (end: "stealth"))
    }
  })
]
],
    (
        True([Chùm tia sáng song song với trục đối xứng của parabol]),
        [Chùm tia sáng hội tụ tại đỉnh của parabol],
        [Chùm tia sáng phân kỳ đi qua đường chuẩn],
        [Chùm tia sáng quay ngược lại tiêu điểm $F$]
    ),
    loigiai: [
        #step([Tính chất quang học của gương parabol])
        Tiếp tuyến tại $M$ là phân giác của góc tạo bởi bán kính qua tiêu $M F$ và tia song song trục đối xứng. Do đó mọi tia sáng từ tiêu điểm $F$ phản xạ theo chùm song song với trục đối xứng.
    ]
)

// TN 2
#tn([Tính chất quang học của đường elip khẳng định rằng: Một tia sáng hoặc sóng âm phát xuất từ tiêu điểm $F_1$ sau khi phản xạ tại thành elip sẽ],
    (
        True([Đi qua tiêu điểm còn lại $F_2$]),
        [Song song với trục lớn của elip],
        [Song song với trục nhỏ của elip],
        [Hội tụ tại gốc tọa độ $O$]
    ),
    loigiai: [
        #step([Tính chất quang học của Elip])
        Tiếp tuyến tại $M$ là phân giác ngoài của góc $hat(F_1 M F_2)$, pháp tuyến là phân giác trong. Do đó góc tới bằng góc phản xạ, tia sáng từ $F_1$ phản xạ luôn hội tụ tại $F_2$.
    ]
)

// TN 3
#tn([Tính chất quang học của hypebol khẳng định rằng: Một tia sáng hướng về tiêu điểm $F_2$ sau khi phản xạ tại gương hypebol sẽ có đường kéo dài đi qua],
    (
        True([Tiêu điểm $F_1$]),
        [Đỉnh của hypebol],
        [Tâm đối xứng $O$],
        [Đường tiệm cận]
    ),
    loigiai: [
        #step([Tính chất quang học của Hypebol])
        Tiếp tuyến tại $M$ của hypebol là phân giác trong của góc $hat(F_1 M F_2)$. Do đó tia sáng hướng tới tiêu điểm $F_2$ phản xạ sẽ có phương đi qua tiêu điểm $F_1$.
    ]
)

// TN 4
#tn([Cho elip $(E): x^2 / 25 + y^2 / 9 = 1$. Tích các khoảng cách từ hai tiêu điểm $F_1, F_2$ đến một tiếp tuyến bất kỳ của elip luôn bằng],
    (
        True([$9$]),
        [$25$],
        [$16$],
        [$15$]
    ),
    loigiai: [
        #step([Định lý về tích khoảng cách từ hai tiêu điểm đến tiếp tuyến])
        Với mọi elip $x^2 / a^2 + y^2 / b^2 = 1$, tích khoảng cách từ hai tiêu điểm $F_1, F_2$ đến tiếp tuyến bất kỳ $d$ luôn bằng $b^2$.
        Ở đây $b^2 = 9$.
    ]
)

// TN 5
#tn([Cho hypebol $(H): x^2 / 16 - y^2 / 9 = 1$. Tích khoảng cách từ hai tiêu điểm $F_1, F_2$ đến một tiếp tuyến bất kỳ của $(H)$ luôn bằng],
    (
        True([$9$]),
        [$16$],
        [$25$],
        [$7$]
    ),
    loigiai: [
        #step([Định lý tích khoảng cách đối với Hypebol])
        Tương tự elip, với hypebol $x^2 / a^2 - y^2 / b^2 = 1$, tích khoảng cách từ hai tiêu điểm đến tiếp tuyến bất kỳ cũng luôn bằng $b^2 = 9$.
    ]
)

// TN 6
#tn([Điểm $M$ thuộc elip $(E): x^2 / a^2 + y^2 / b^2 = 1$ sao cho diện tích của tam giác tiêu điểm $M F_1 F_2$ đạt giá trị lớn nhất là],
    (
        True([Một trong hai đỉnh trên trục nhỏ $B_1(0, -b)$ hoặc $B_2(0, b)$]),
        [Một trong hai đỉnh trên trục lớn $A_1(-a, 0)$ hoặc $A_2(a, 0)$],
        [Điểm nhìn hai tiêu điểm dưới góc vuông],
        [Gốc tọa độ $O(0, 0)$]
    ),
    loigiai: [
        #step([Cực trị diện tích tam giác tiêu điểm])
        Diện tích tam giác $M F_1 F_2$:
        $ S = 1 / 2 times F_1 F_2 times |y_M| = c times |y_M| $
        Vì $-b <= y_M <= b$, diện tích đạt cực đại khi $|y_M| = b$, tức tại hai đỉnh trên trục nhỏ $B_1(0, -b)$ và $B_2(0, b)$. Giá trị cực đại là $S_(max) = b c$.
    ]
)

// TN 7
#tn([Cho elip $(E): x^2 / 25 + y^2 / 16 = 1$. Diện tích lớn nhất của tam giác tiêu điểm $M F_1 F_2$ bằng],
    (
        True([$12$]),
        [$20$],
        [$15$],
        [$16$]
    ),
    loigiai: [
        #step([Tính diện tích cực đại])
        $a = 5, b = 4 => c = sqrt(25 - 16) = 3$.
        $ S_(max) = b c = 4 times 3 = 12 $
    ]
)

// TN 8
#tn([Trong một phòng hòa nhạc có trần thiết kế dạng vòm bán elip (vòm thì thầm), một ca sĩ đứng ở vị trí tiêu điểm $F_1$. Âm thanh phát ra từ ca sĩ sau khi phản xạ tại vòm trần sẽ truyền tập trung rõ nhất tới vị trí nào?],
    (
        True([Tiêu điểm còn lại $F_2$]),
        [Chính giữa tâm sàn sân khấu],
        [Góc tường đối diện],
        [Tất cả các vị trí đều nghe nhỏ như nhau]
    ),
    loigiai: [
        #step([Ứng dụng thực tế của tính chất quang học Elip])
        Nhờ tính chất quang học của elip, mọi chùm sóng âm từ tiêu điểm $F_1$ đập vào trần elip đều phản xạ hội tụ về tiêu điểm $F_2$, làm âm thanh tại $F_2$ nghe to và rõ nét nhất dù ca sĩ chỉ thì thầm.
    ]
)

// TN 9
#tn([Cho elip $(E): x^2 / 16 + y^2 / 9 = 1$. Pháp tuyến tại điểm $M$ bất kỳ trên elip là đường phân giác trong của góc nào?],
    (
        True([Góc $hat(F_1 M F_2)$]),
        [Góc $hat(A_1 M A_2)$],
        [Góc $hat(B_1 M B_2)$],
        [Góc $hat(O M F_1)$]
    ),
    loigiai: [
        #step([Tính chất pháp tuyến của Elip])
        Tại điểm $M$ trên elip, tiếp tuyến là phân giác ngoài của góc $hat(F_1 M F_2)$, do đó pháp tuyến (vuông góc tiếp tuyến) chính là đường phân giác trong của góc $hat(F_1 M F_2)$.
    ]
)

// TN 10
#tn([Tiếp tuyến tại điểm bất kỳ của hypebol $x^2 / a^2 - y^2 / b^2 = 1$ cắt hai đường tiệm cận tạo thành một tam giác có diện tích không đổi bằng],
    (
        True([$a b$]),
        [$2 a b$],
        [$a^2 + b^2$],
        [$(a b) / 2$]
    ),
    loigiai: [
        #step([Định lý về diện tích tạo bởi tiếp tuyến và hai tiệm cận])
        Tiếp tuyến tại điểm bất kỳ của hypebol cắt hai đường tiệm cận $y = plus.minus (b / a) x$ tại hai điểm $P, Q$. Tam giác $O P Q$ luôn có diện tích không đổi $S = a b$.
    ]
)

// TN 11
#tn([Cho parabol $(P): y^2 = 4 x$. Điểm $M$ trên parabol có tung độ $y = 2$. Góc tạo bởi bán kính qua tiêu $M F$ và tiếp tuyến tại $M$ bằng],
    (
        True([$45 degree$]),
        [$30 degree$],
        [$60 degree$],
        [$90 degree$]
    ),
    loigiai: [
        #step([Tính góc giữa tiếp tuyến và tia qua tiêu])
        $p = 2$. Với $y = 2 => x = 1 => M(1, 2)$. Tiêu điểm $F(1, 0)$.
        Tiếp tuyến tại $M$: $2 y = 2(x + 1) <=> y = x + 1$ có hệ số góc $k = 1$, tạo với $O x$ góc $45 degree$.
        Đoạn $M F$ nối $(1, 2)$ và $(1, 0)$ là đường thẳng đứng song song $O y$.
        Góc giữa đường thẳng đứng và đường thẳng góc $45 degree$ chính là $45 degree$.
    ]
)

// TN 12
#tn([Cho elip $(E): x^2 / 100 + y^2 / 64 = 1$. Góc nhìn hai tiêu điểm $hat(F_1 M F_2)$ đạt giá trị lớn nhất khi điểm $M$ ở vị trí nào?],
    (
        True([Tại các đỉnh trên trục nhỏ $B_1(0, -8)$ và $B_2(0, 8)$]),
        [Tại các đỉnh trên trục lớn $A_1(-10, 0)$ và $A_2(10, 0)$],
        [Tại điểm nhìn hai tiêu điểm dưới góc $45 degree$],
        [Góc nhìn hai tiêu điểm luôn là một hằng số không đổi]
    ),
    loigiai: [
        #step([Cực trị góc nhìn tiêu điểm])
        Ta có $tan(hat(F_1 M F_2) / 2) = c / b$ khi $M$ ở đỉnh trục nhỏ. Tại đây góc nhìn $hat(F_1 M F_2)$ đạt cực đại.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Trong y học, máy tán sỏi thận ngoài cơ thể (ESWL) hoạt động dựa trên nguyên lý buồng phản xạ có dạng nửa hình bầu dục (nửa elip tròn xoay).],
  (
    True([Nguồn phát sóng xung kích (shockwave) được đặt tại tiêu điểm thứ nhất $F_1$.]),
    True([Vị trí viên sỏi thận trong cơ thể bệnh nhân được định vị trùng với tiêu điểm thứ hai $F_2$.]),
    True([Các tia sóng xung kích phát ra theo nhiều hướng đều hội tụ chính xác vào viên sỏi sau khi phản xạ tại thành buồng elip.]),
    [Năng lượng sóng xung kích bị phân tán đều trên toàn cơ thể bệnh nhân nên viên sỏi không bị vỡ.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    Máy tán sỏi thận ứng dụng tính chất phản xạ quang học/sóng của elip: Nguồn phát đặt tại tiêu điểm $F_1$, viên sỏi đặt tại tiêu điểm $F_2$. Mọi sóng xung kích phản xạ từ thành gương elip đều hội tụ tại $F_2$, tập trung mật độ năng lượng cực cao để phá vỡ sỏi mà không cần phẫu thuật (Ý a, b, c ĐÚNG).

    #step([Xét ý d])
    Nhờ hội tụ tại $F_2$, năng lượng chỉ tập trung cực đại tại viên sỏi, các mô xung quanh chỉ chịu năng lượng nhỏ nên không bị tổn thương. Khẳng định năng lượng bị phân tán đều là SAI. Do đó ý d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Cho elip $(E): x^2 / 25 + y^2 / 16 = 1$. Gọi $d$ là một tiếp tuyến bất kỳ của elip $(E)$, và $F_1, F_2$ là hai tiêu điểm của $(E)$.],
  (
    True([Tích hai khoảng cách $d(F_1, d) times d(F_2, d) = 16$.]),
    True([Hình chiếu vuông góc của hai tiêu điểm $F_1, F_2$ lên tiếp tuyến $d$ luôn nằm trên đường tròn phụ $x^2 + y^2 = 25$.]),
    True([Độ dài bán kính qua tiêu của elip thỏa mãn $M F_1 + M F_2 = 10$.]),
    [Tích $d(F_1, d) times d(F_2, d)$ phụ thuộc vào hệ số góc của tiếp tuyến $d$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    - Tích khoảng cách từ hai tiêu điểm đến tiếp tuyến bất kỳ bằng $b^2 = 16$ (Ý a ĐÚNG).
    - Tập hợp hình chiếu của tiêu điểm lên các tiếp tuyến là đường tròn đỉnh $x^2 + y^2 = a^2 = 25$ (Ý b ĐÚNG).
    - $M F_1 + M F_2 = 2 a = 10$ (Ý c ĐÚNG).

    #step([Xét ý d])
    Tích $d(F_1, d) times d(F_2, d) = b^2 = 16$ là một hằng số không đổi, không phụ thuộc vào tiếp tuyến hay hệ số góc. Do đó ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Cho parabol $(P): y^2 = 8 x$ và đường thẳng $Delta: x - y + 4 = 0$.],
  (
    True([Tham số tiêu của parabol là $p = 4$.]),
    True([Tiếp tuyến của $(P)$ song song với đường thẳng $Delta$ tiếp xúc tại điểm $M_0(2, 4)$.]),
    True([Khoảng cách nhỏ nhất từ một điểm trên parabol đến đường thẳng $Delta$ bằng $sqrt(2)$.]),
    [Đường thẳng $Delta$ cắt parabol $(P)$ tại hai điểm phân biệt.]
  ),
  loigiai: [
    #step([Xét ý a])
    $2 p = 8 => p = 4$ (Ý a ĐÚNG).

    #step([Xét ý b])
    Đường thẳng $Delta$ có hệ số góc $k = 1$.
    Tiếp tuyến song song có hệ số góc $k = 1$.
    Với parabol, hệ số góc tiếp tuyến $k = p / y_0 => 1 = 4 / y_0 => y_0 = 4$.
    Hoành độ tiếp điểm: $x_0 = y_0^2 / 8 = 16 / 8 = 2 => M_0(2, 4)$ (Ý b ĐÚNG).

    #step([Xét ý c])
    Khoảng cách nhỏ nhất từ parabol đến $Delta$ là khoảng cách từ tiếp điểm $M_0(2, 4)$ đến $Delta$:
    $ d(M_0, Delta) = |2 - 4 + 4| / sqrt(1^2 + (-1)^2) = 2 / sqrt(2) = sqrt(2) $ (Ý c ĐÚNG).

    #step([Xét ý d])
    Vì khoảng cách nhỏ nhất giữa parabol và $Delta$ là $sqrt(2) > 0$, nên $Delta$ không cắt parabol. Do đó ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Cho hypebol $(H): x^2 / 16 - y^2 / 9 = 1$.],
  (
    True([Hai đường tiệm cận của hypebol có phương trình là $y = plus.minus (3 / 4) x$.]),
    True([Một tiếp tuyến bất kỳ của hypebol cắt hai đường tiệm cận tại hai điểm $P$ và $Q$.]),
    True([Tiếp điểm $M$ luôn là trung điểm của đoạn thẳng $P Q$.]),
    [Diện tích của tam giác $O P Q$ thay đổi tùy theo vị trí của tiếp điểm $M$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c])
    $a = 4, b = 3$. Hai đường tiệm cận $y = plus.minus (b / a) x = plus.minus (3 / 4) x$ (Ý a ĐÚNG).
    Theo tính chất hình học kinh điển của hypebol, đoạn thẳng nối hai giao điểm của tiếp tuyến với hai tiệm cận luôn nhận tiếp điểm $M$ làm trung điểm (Ý b và c ĐÚNG).

    #step([Xét ý d])
    Diện tích tam giác $O P Q$ tạo bởi tiếp tuyến và hai tiệm cận luôn bằng một hằng số không đổi:
    $ S = a b = 4 times 3 = 12 $.
    Diện tích không đổi. Do đó ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho elip $(E): x^2 / 100 + y^2 / 36 = 1$. Tính tích khoảng cách từ hai tiêu điểm $F_1, F_2$ đến một tiếp tuyến bất kỳ của elip này.],
    [36],
    loigiai: [
        #step([Định lý tích khoảng cách])
        Với elip $x^2 / a^2 + y^2 / b^2 = 1$, tích khoảng cách từ hai tiêu điểm đến mọi tiếp tuyến luôn bằng $b^2$.
        Ở đây $b^2 = 36$.
    ]
)

// TLN 2 (Câu 18)
#tln([Cho elip $(E): x^2 / 169 + y^2 / 25 = 1$. Tính diện tích lớn nhất của tam giác tiêu điểm $M F_1 F_2$ (với $M$ là một điểm bất kỳ trên elip).],
    [60],
    loigiai: [
        #step([Tính các thông số và diện tích cực đại])
        $a = 13, b = 5 => c = sqrt(169 - 25) = sqrt(144) = 12$.
        Diện tích tam giác tiêu điểm $M F_1 F_2$ đạt cực đại khi $M$ là đỉnh trên trục nhỏ:
        $ S_(max) = b c = 5 times 12 = 60 $
    ]
)

// TLN 3 (Câu 19)
#tln([Cho parabol $(P): y^2 = 4 x$. Tìm hoành độ của điểm $M$ thuộc parabol sao cho tiếp tuyến tại $M$ tạo với trục hoành một góc $45 degree$.],
    [1],
    loigiai: [
        #step([Tìm hệ số góc và tọa độ điểm M])
        Hệ số góc của tiếp tuyến: $k = tan 45 degree = 1$.
        Parabol có $2 p = 4 => p = 2$.
        Hệ số góc tiếp tuyến tại $M(x_0, y_0)$ là:
        $ k = p / y_0 <=> 1 = 2 / y_0 => y_0 = 2 $
        Thay vào phương trình parabol:
        $ 2^2 = 4 x_0 <=> x_0 = 1 $
    ]
)

// TLN 4 (Câu 20)
#tln([Một tiếp tuyến bất kỳ của hypebol $(H): x^2 / 16 - y^2 / 9 = 1$ cắt hai đường tiệm cận tại hai điểm $P$ và $Q$. Tính diện tích của tam giác $O P Q$ (với $O$ là gốc tọa độ).],
    [12],
    loigiai: [
        #step([Tính diện tích tam giác OPQ])
        Diện tích tam giác tạo bởi tiếp tuyến và hai đường tiệm cận của hypebol $x^2 / a^2 - y^2 / b^2 = 1$ luôn là một hằng số bằng:
        $ S = a b = 4 times 3 = 12 $
    ]
)

// TLN 5 (Câu 21)
#tln([Trong một máy tán sỏi thận ngoài cơ thể, buồng phản xạ có dạng nửa elip với độ dài trục lớn là $160" cm"$ và độ dài trục nhỏ là $96" cm"$. Khoảng cách giữa nguồn phát sóng xung kích (tiêu điểm $F_1$) và vị trí viên sỏi thận (tiêu điểm $F_2$) bằng bao nhiêu xentimét?],
    [128],
    loigiai: [
        #step([Tính tiêu cự của elip])
        Độ dài trục lớn: $2 a = 160 => a = 80" cm"$.
        Độ dài trục nhỏ: $2 b = 96 => b = 48" cm"$.
        Tiêu cự $c$:
        $ c = sqrt(a^2 - b^2) = sqrt(80^2 - 48^2) = sqrt(6400 - 2304) = sqrt(4096) = 64" cm" $
        Khoảng cách giữa hai tiêu điểm $F_1$ và $F_2$ là:
        $ 2 c = 2 times 64 = 128" cm" $
    ]
)

// TLN 6 (Câu 22)
#tln([Cho parabol $(P): y^2 = 8 x$ và đường thẳng $d: x - y + 6 = 0$. Tìm giá trị của biểu thức $T = d_(min) times sqrt(2)$, trong đó $d_(min)$ là khoảng cách ngắn nhất từ một điểm $M$ thuộc parabol đến đường thẳng $d$.],
    [4],
    loigiai: [
        #step([Tìm tiếp điểm gần đường thẳng d nhất])
        Đường thẳng $d$ có hệ số góc $k = 1$.
        Tiếp tuyến của $(P)$ song song với $d$ có hệ số góc $k = 1$.
        Với $p = 4$, tung độ tiếp điểm là $y_0 = p / k = 4 / 1 = 4$.
        Hoành độ tiếp điểm: $x_0 = y_0^2 / 8 = 16 / 8 = 2 => M_0(2, 4)$.
        #step([Tính khoảng cách và biểu thức T])
        $ d_(min) = d(M_0, d) = |2 - 4 + 6| / sqrt(1^2 + (-1)^2) = 4 / sqrt(2) $
        Vậy $T = d_(min) times sqrt(2) = 4$.
    ]
)

] // end make-questions

#make-questions()
