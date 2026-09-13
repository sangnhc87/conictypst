#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1d4ed8") // Royal Blue / Indigo

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG",
  exam-title: "CHUYÊN ĐỀ TOÁN THỰC TẾ: PARABOL & CÔNG TRÌNH KIẾN TRÚC (ĐỀ SỐ 20D)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "152",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cổng vòm Parabol Gateway Arch tại Saint Louis (Mỹ) có chiều cao khoảng $192 text(" m")$ và khoảng cách giữa hai chân cổng trên mặt đất cũng là $192 text(" m")$.
Chọn hệ trục tọa độ $O x y$ sao cho gốc $O$ là trung điểm khoảng cách giữa hai chân cổng, trục $O y$ hướng thẳng đứng lên trên đi qua đỉnh cổng.
Phương trình của vòm cổng parabol là],
    (
        True([$y = - 1 / 48 x^2 + 192$]),
        [$y = - 1 / 96 x^2 + 192$],
        [$y = - 1 / 192 x^2 + 192$],
        [$y = - 1 / 24 x^2 + 192$]
    ),
    loigiai: [
        Đỉnh cổng nằm trên trục tung nên có tọa độ $I(0; 192)$.
        Hai chân cổng đối xứng qua gốc $O$ nên có hoành độ là $x = - 192 / 2 = -96$ và $x = 96$.
        Phương trình parabol có dạng: $y = 192 - a x^2$.
        Thay điểm chân cổng $(96; 0)$ vào:
        $ 0 = 192 - a(96)^2 <=> 9216 a = 192 <=> a = 192 / 9216 = 1 / 48 $
        Vậy phương trình của vòm cổng là: $y = - 1 / 48 x^2 + 192$.
    ]
)

// TN 2
#tn([Một đài phun nước công viên có vòi phun đặt ở độ cao $1 text(" m")$ so with mặt nước hồ.
Tia nước phun lên theo quỹ đạo hình parabol có phương trình:
$ h(x) = -x^2 + 2x + 1 text(" (m)") $
trong đó $x text(" (m)")$ là khoảng cách theo phương ngang tính từ vị trí vòi phun.
Độ cao lớn nhất so với mặt nước hồ mà tia nước đạt được là],
    (
        True([$2 text(" m")$]),
        [$1 text(" m")$],
        [$3 text(" m")$],
        [$1.5 text(" m")$]
    ),
    loigiai: [
        Hàm số $h(x) = -x^2 + 2x + 1$ có hệ số $a = -1 < 0$.
        Đạt cực đại tại hoành độ đỉnh:
        $ x_I = - 2 / (2(-1)) = 1 text(" m") $
        Độ cao lớn nhất tia nước đạt được là:
        $ h(1) = -(1)^2 + 2(1) + 1 = 2 text(" m") $
    ]
)

// TN 3
#tn([Một cây cầu vòm thép có chiều dài nhịp cầu là $100 text(" m")$. Điểm cao nhất của vòm thép nằm ở chính giữa cầu và cách mặt cầu $25 text(" m")$.
Chọn hệ trục tọa độ $O x y$ có gốc $O$ tại tâm mặt cầu, đỉnh vòm thép là $I(0; 25)$, hai chân vòm cầu là $(-50; 0)$ và $(50; 0)$.
Một thanh giằng thẳng đứng treo sàn cầu tại vị trí cách tâm cầu $20 text(" m")$ có chiều dài bằng],
    (
        True([$21 text(" m")$]),
        [$20 text(" m")$],
        [$22 text(" m")$],
        [$18 text(" m")$]
    ),
    loigiai: [
        Phương trình parabol vòm thép: $y = 25 - a x^2$.
        Thay điểm $(50; 0)$ vào:
        $ 0 = 25 - a(50)^2 <=> 2500 a = 25 <=> a = 1 / 100 $
        Phương trình là: $y = 25 - 1 / 100 x^2$.
        Tại vị trí cách tâm $20 text(" m")$ ($x = 20$):
        $ y(20) = 25 - 1 / 100 (20)^2 = 25 - 400 / 100 = 25 - 4 = 21 text(" m") $
    ]
)

// TN 4
#tn([Một hầm chui đường bộ qua núi có mặt cắt là hình parabol với phương trình $y = -0.25 x^2 + 4 text(" (m)")$, trong đó mặt đường tương ứng với trục hoành $y = 0$.
Chiều rộng của mặt đường tại đáy hầm chui bằng],
    (
        True([$8 text(" m")$]),
        [$4 text(" m")$],
        [$16 text(" m")$],
        [$6 text(" m")$]
    ),
    loigiai: [
        Tại mặt đường ($y = 0$):
        $ -0.25 x^2 + 4 = 0 <=> 0.25 x^2 = 4 <=> x^2 = 16 <=> x = plus.minus 4 $
        Chiều rộng đáy hầm là khoảng cách giữa hai điểm chân hầm:
        $ d = 4 - (-4) = 8 text(" m") $
    ]
)

// TN 5
#tn([Một quả pháo hoa được bắn thẳng đứng lên không trung từ mặt đất, độ cao của quả pháo hoa sau $t$ giây được cho bởi hàm số:
$ h(t) = -5 t^2 + 40 t text(" (m)") $
Quả pháo hoa đạt độ cao lớn nhất sau khoảng thời gian là],
    (
        True([$4 text(" giây")$]),
        [$8 text(" giây")$],
        [$5 text(" giây")$],
        [$3 text(" giây")$]
    ),
    loigiai: [
        Hàm số bậc hai $h(t) = -5 t^2 + 40 t$ đạt giá trị lớn nhất tại thời điểm:
        $ t_I = - 40 / (2(-5)) = 40 / 10 = 4 text(" giây") $
    ]
)

// TN 6
#tn([Trong môn ném lao, độ cao của ngọn lao so với mặt đất phụ thuộc vào khoảng cách ngang $x text(" (m)")$ tính từ vị trí phóng theo công thức:
$ h(x) = -0.02 x^2 + 0.96 x + 2 text(" (m)") $
Khoảng cách ném xa nhất của vận động viên (từ vị trí ném đến khi ngọn lao chạm đất $h = 0$) là],
    (
        True([$50 text(" m")$]),
        [$48 text(" m")$],
        [$52 text(" m")$],
        [$45 text(" m")$]
    ),
    loigiai: [
        Khi ngọn lao chạm đất thì $h(x) = 0$:
        $ -0.02 x^2 + 0.96 x + 2 = 0 $
        Nhân hai vế với $-50$:
        $ x^2 - 48 x - 100 = 0 <=> (x - 50)(x + 2) = 0 <=> cases(x = 50 text(" (nhận)"), x = -2 text(" (loại)")) $
        Vậy khoảng cách ném xa nhất là $50 text(" m")$.
    ]
)

// TN 7
#tn([Một vận động viên nhảy cầu từ bục cao $10 text(" m")$ xuống hồ nước. Quỹ đạo nhảy của vận động viên được mô tả bởi:
$ y = -x^2 + 2x + 10 text(" (m)") $
trong đó $x text(" (m)")$ là khoảng cách ngang tính từ mép bục nhảy.
Độ cao lớn nhất so với mặt nước mà vận động viên đạt được là],
    (
        True([$11 text(" m")$]),
        [$10 text(" m")$],
        [$12 text(" m")$],
        [$10.5 text(" m")$]
    ),
    loigiai: [
        Hàm số $y = -x^2 + 2x + 10$ có $a = -1 < 0$.
        Đạt giá trị lớn nhất tại đỉnh $x_I = - 2 / (2(-1)) = 1 text(" m")$.
        Độ cao lớn nhất:
        $ y_text("max") = -(1)^2 + 2(1) + 10 = 11 text(" m") $
    ]
)

// TN 8
#tn([Một máng dẫn nước tưới tiêu bằng bê tông có mặt cắt ngang dạng parabol đối xứng.
Khoảng cách giữa hai mép trên của máng là $6 text(" m")$ và độ sâu lớn nhất của máng ở tâm là $1.8 text(" m")$.
Chọn hệ trục tọa độ $O x y$ với gốc $O$ tại điểm thấp nhất của đáy máng.
Phương trình của đường cong lòng máng là],
    (
        True([$y = 0.2 x^2$]),
        [$y = 0.05 x^2$],
        [$y = 0.3 x^2$],
        [$y = 0.1 x^2$]
    ),
    loigiai: [
        Parabol có đỉnh tại gốc $O(0; 0)$ nên phương trình có dạng $y = a x^2$.
        Khoảng cách giữa hai mép bờ máng là $6 text(" m")$ nên mép máng có hoành độ $x = 3$.
        Độ sâu của máng là $1.8 text(" m")$ nên điểm mép máng có tọa độ $(3; 1.8)$.
        Thay vào phương trình:
        $ 1.8 = a(3)^2 <=> 9a = 1.8 <=> a = 0.2 $
        Vậy phương trình lòng máng là: $y = 0.2 x^2$.
    ]
)

// TN 9
#tn([Một vòi phun nước tưới cỏ sân vận động xoay tròn phun ra tia nước theo quỹ đạo parabol:
$ y = -0.5 x^2 + 2x text(" (m)") $
với $x text(" (m)")$ là khoảng cách nằm ngang tính từ vòi.
Bán kính của vùng cỏ hình tròn được tia nước tưới tới trên mặt đất ($y = 0$) là],
    (
        True([$4 text(" m")$]),
        [$2 text(" m")$],
        [$3 text(" m")$],
        [$5 text(" m")$]
    ),
    loigiai: [
        Khi tia nước chạm đất ($y = 0$):
        $ -0.5 x^2 + 2x = 0 <=> x(-0.5 x + 2) = 0 <=> cases(x = 0 text(" (vòi phun)"), x = 4 text(" (điểm tiếp đất)")) $
        Vậy bán kính tưới nước là $R = 4 text(" m")$.
    ]
)

// TN 10
#tn([Chao đèn pha của một chiếc ô tô có mặt cắt là hình parabol. Bóng đèn được đặt tại tiêu điểm $F(0; 1.5)$ (đơn vị: cm) trên trục đối xứng của chao đèn.
Phương trình parabol của chao đèn là $y = 1 / 6 x^2$.
Nếu miệng chao đèn có đường kính là $12 text(" cm")$ thì độ sâu của chao đèn bằng],
    (
        True([$6 text(" cm")$]),
        [$4 text(" cm")$],
        [$8 text(" cm")$],
        [$5 text(" cm")$]
    ),
    loigiai: [
        Miệng chao đèn có đường kính $12 text(" cm")$ nên khoảng cách từ mép chao đèn đến trục đối xứng là $x = 12 / 2 = 6 text(" cm")$.
        Độ sâu của chao đèn là tung độ tương ứng:
        $ y(6) = 1 / 6 (6)^2 = 36 / 6 = 6 text(" cm") $
    ]
)

// TN 11
#tn([Một cổng chào trường học hình parabol có chiều rộng ở chân cổng là $10 text(" m")$ và chiều cao tại điểm cao nhất là $5 text(" m")$.
Chọn hệ trục $O x y$ với gốc $O$ là trung điểm chân cổng trên mặt đất.
Phương trình của cổng parabol là $y = -0.2 x^2 + 5$.
Người ta muốn treo một tấm biển chữ nhật trang trí có mép trên chạm vào đỉnh cổng, mép dưới ngang có chiều rộng $6 text(" m")$ gắn vào hai bên vòm cổng.
Chiều cao của tấm biển chữ nhật đó bằng],
    (
        True([$1.8 text(" m")$]),
        [$2 text(" m")$],
        [$1.5 text(" m")$],
        [$2.2 text(" m")$]
    ),
    loigiai: [
        Tấm biển rộng $6 text(" m")$ gắn đối xứng qua trục tung nên hai mép bên có hoành độ $x = plus.minus 3$.
        Độ cao của cổng tại $x = 3$:
        $ y(3) = -0.2(3)^2 + 5 = -0.2(9) + 5 = -1.8 + 5 = 3.2 text(" m") $
        Mép trên của tấm biển nằm tại đỉnh cổng cao $5 text(" m")$.
        Chiều cao của tấm biển chữ nhật là:
        $ h = 5 - 3.2 = 1.8 text(" m") $
    ]
)

// TN 12
#tn([Một người thợ cần uốn một thanh sắt dài $12 text(" m")$ thành một khung cửa sổ hình chữ nhật có diện tích lớn nhất.
Diện tích lớn nhất của khung cửa sổ đó bằng],
    (
        True([$9 text(" m"^2)$]),
        [$8 text(" m"^2)$],
        [$10 text(" m"^2)$],
        [$6 text(" m"^2)$]
    ),
    loigiai: [
        Nửa chu vi khung cửa sổ: $p = 12 / 2 = 6 text(" m")$.
        Gọi chiều rộng khung cửa là $x text(" m")$ ($0 < x < 6$), chiều dài là $6 - x text(" m")$.
        Diện tích khung cửa sổ:
        $ S(x) = x(6 - x) = -x^2 + 6x $
        Hàm số bậc hai đạt cực đại tại $x = - 6 / (2(-1)) = 3 text(" m")$ (hình vuông).
        Diện tích lớn nhất: $S_text("max") = 3(6 - 3) = 9 text(" m"^2)$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Mô hình hóa cầu vòm thép vượt sông có CeTZ)
#ds([Một nhịp cầu vòm thép vượt sông có dạng hình parabol. Khoảng cách giữa hai mố cầu ở mặt nước là $A B = 60 text(" m")$, đỉnh vòm cầu $I$ cao $15 text(" m")$ so với mặt nước.
Chọn hệ tọa độ $O x y$ sao cho gốc $O$ là trung điểm của $A B$ trên mặt nước, trục $O y$ hướng thẳng đứng lên trên đi qua đỉnh cầu $I$.
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-3.5, 0), (3.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -0.5), (0, 2.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((3.3, -0.25), [$x text(" (m)")$])
  content((-0.3, 2.3), [$y text(" (m)")$])
  content((-0.2, -0.2), [$O$])
  
  // Mặt nước y = 0
  line((-3.2, 0), (3.2, 0), stroke: 1pt + rgb("0284c7"))
  
  // Parabol y = -1/60 x^2 + 15  (tỉ lệ chia 10 cho x, chia 10 cho y: x in [-3; 3], y in [0; 1.5])
  line(..range(-30, 31).map(t => {
    let x = t / 10;
    (x, -1/6 * calc.pow(x, 2) + 1.5)
  }), stroke: 1.5pt + rgb("1d4ed8"))
  
  // Đỉnh I(0; 15)
  circle((0, 1.5), radius: 2.5pt, fill: rgb("1d4ed8"))
  content((0.4, 1.65), [$I(0; 15)$])
  
  // Chân A(-30; 0) và B(30; 0)
  circle((-3, 0), radius: 2pt, fill: rgb("1d4ed8"))
  circle((3, 0), radius: 2pt, fill: rgb("1d4ed8"))
  content((-3, -0.25), [$A(-30)$])
  content((3, -0.25), [$B(30)$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ hai mố cầu trên hệ trục là $A(-30; 0)$, $B(30; 0)$ và đỉnh vòm cầu là $I(0; 15)$.]),
    True([Phương trình parabol của vòm cầu là $y = - 1 / 60 x^2 + 15$.]),
    True([Tại vị trí cách tâm cầu một khoảng $15 text(" m")$, độ cao của vòm cầu so với mặt nước là $11.25 text(" m")$.]),
    [Một sà lan chở hàng có khoang lái cao $14 text(" m")$ so với mặt nước và rộng $20 text(" m")$ vẫn có thể đi qua an toàn dưới gầm cầu.]
  ),
  loigiai: [
    #step([Xác định tọa độ các điểm])
    Khoảng cách $A B = 60 text(" m")$ nên $x_A = -30, x_B = 30$. Đỉnh $I$ nằm trên trục tung cao $15 text(" m")$ nên $I(0; 15)$. Mệnh đề a ĐÚNG.

    #step([Thiết lập phương trình parabol])
    Parabol có dạng: $y = 15 - a x^2$.
    Đi qua $B(30; 0) => 0 = 15 - a(30)^2 <=> 900a = 15 <=> a = 15 / 900 = 1 / 60$.
    Phương trình là: $y = - 1 / 60 x^2 + 15$. Mệnh đề b ĐÚNG.

    #step([Độ cao tại vị trí x = 15m])
    $y(15) = - 1 / 60 (15)^2 + 15 = - 225 / 60 + 15 = - 3.75 + 15 = 11.25 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra sà lan đi qua gầm cầu])
    Sà lan rộng $20 text(" m")$ nên hai mép khoang lái nằm tại $x = plus.minus 10 text(" m")$.
    Độ cao của vòm cầu tại $x = 10 text(" m")$ là:
    $ y(10) = - 1 / 60 (10)^2 + 15 = - 100 / 60 + 15 = - 1.67 + 15 = 13.33 text(" m") $
    Vì sà lan cao $14 text(" m") > 13.33 text(" m")$ nên khoang lái sẽ bị va chạm vào vòm cầu, không thể đi qua an toàn.
    Khẳng định sà lan vẫn có thể đi qua an toàn là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Quỹ đạo quả bóng đá sút phạt hàng rào)
#ds([Một cầu thủ thực hiện quả sút phạt trực tiếp cách khung thành $25 text(" m")$. Quả bóng bay theo quỹ đạo parabol:
$ h(x) = -0.016 x^2 + 0.48 x text(" (m)") $
trong đó $x text(" (m)")$ là khoảng cách ngang tính từ vị trí sút phạt và $h(x) text(" (m)")$ là độ cao của bóng.
Hàng rào chắn của đối phương đứng cách điểm sút phạt $9.15 text(" m")$ (chuẩn FIFA) và có chiều cao khi bật nhảy là $2.2 text(" m")$.
Khung thành có xà ngang cao $2.44 text(" m")$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu không bị cản phá, quả bóng sẽ chạm đất sau khi bay được khoảng cách ngang $30 text(" m")$.]),
    True([Độ cao lớn nhất mà quả bóng đạt được trong suốt quỹ đạo là $3.6 text(" m")$ tại khoảng cách ngang $15 text(" m")$.]),
    True([Khi bóng bay qua vị trí hàng rào ($x = 9.15 text(" m")$), bóng vượt qua phía trên đầu của hàng rào chắn.]),
    [Khi bay tới vạch cầu môn ($x = 25 text(" m")$), bóng bay cao hơn xà ngang của khung thành.]
  ),
  loigiai: [
    #step([Tầm bay xa khi chạm đất])
    $h(x) = 0 <=> -0.016 x^2 + 0.48 x = 0 <=> x(-0.016 x + 0.48) = 0 <=> cases(x = 0 text(" (vị trí sút)"), x = 0.48 / 0.016 = 30 text(" m"))$. Mệnh đề a ĐÚNG.

    #step([Độ cao cực đại của bóng])
    Đỉnh parabol tại: $x_I = - 0.48 / (2(-0.016)) = 15 text(" m")$.
    Độ cao lớn nhất: $h(15) = -0.016(15)^2 + 0.48(15) = -3.6 + 7.2 = 3.6 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Độ cao tại hàng rào x = 9.15m])
    $h(9.15) = -0.016(9.15)^2 + 0.48(9.15) = -1.3396 + 4.392 approx 3.05 text(" m")$.
    Vì $3.05 text(" m") > 2.2 text(" m")$ nên bóng bay qua phía trên hàng rào chắn an toàn. Mệnh đề c ĐÚNG.

    #step([Độ cao khi tới cầu môn x = 25m])
    $h(25) = -0.016(25)^2 + 0.48(25) = -0.016(625) + 12 = -10 + 12 = 2 text(" m")$.
    Vì xà ngang khung thành cao $2.44 text(" m")$ nên quả bóng bay ở độ cao $2 text(" m") < 2.44 text(" m")$, tức là bóng bay lọt vào phía dưới xà ngang vào lưới.
    Khẳng định bóng bay cao hơn xà ngang là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Ăng-ten chảo parabol viễn thông)
#ds([Một trạm phát sóng viễn thông sử dụng chảo parabol để hội tụ tín hiệu sóng vô tuyến.
Mặt cắt ngang của chảo parabol có đường kính miệng chảo là $D = 2 text(" m")$ và độ sâu ở tâm chảo là $H = 0.5 text(" m")$.
Chọn hệ trục tọa độ $O x y$ có gốc $O$ tại đáy chảo, trục $O y$ hướng lên dọc theo trục đối xứng của chảo.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương trình mặt cắt parabol của chảo có dạng $y = 0.5 x^2$.]),
    True([Tiêu cự $f$ từ đáy chảo đến đầu thu sóng LNB được tính theo công thức $f = D^2 / (16H) = 0.5 text(" m")$.]),
    True([Vị trí đặt đầu thu tín hiệu LNB nằm ngang bằng với mặt phẳng miệng chảo.]),
    [Nếu giữ nguyên đường kính miệng chảo $D = 2 text(" m")$ mà tăng độ sâu của chảo lên gấp đôi ($H = 1 text(" m")$) thì tiêu cự $f$ sẽ tăng gấp đôi.]
  ),
  loigiai: [
    #step([Thiết lập phương trình])
    Miệng chảo có bán kính $R = D / 2 = 1 text(" m")$ và độ sâu $0.5 text(" m")$ nên mép chảo có tọa độ $(1; 0.5)$.
    Phương trình $y = a x^2 => 0.5 = a(1)^2 <=> a = 0.5$.
    Phương trình là: $y = 0.5 x^2$. Mệnh đề a ĐÚNG.

    #step([Tính tiêu cự])
    Ta có $y = 1 / (4f) x^2 => 1 / (4f) = 0.5 <=> 4f = 2 <=> f = 0.5 text(" m")$.
    Công thức: $f = D^2 / (16H) = 2^2 / (16 cdot 0.5) = 4 / 8 = 0.5 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Vị trí đầu thu LNB])
    Đầu thu đặt tại tiêu điểm $F(0; f) = (0; 0.5)$, có tung độ bằng đúng độ sâu của mép chảo ($y = 0.5 text(" m")$), tức là nằm trên mặt phẳng miệng chảo. Mệnh đề c ĐÚNG.

    #step([Khảo sát khi tăng độ sâu H])
    Từ công thức $f = D^2 / (16H)$, tiêu cự $f$ tỉ lệ nghịch với độ sâu $H$.
    Khi $H$ tăng gấp đôi thì tiêu cự $f$ giảm đi một nửa: $f' = 4 / (16 cdot 1) = 0.25 text(" m")$.
    Khẳng định tiêu cự tăng gấp đôi là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tên lửa khí tượng phóng thẳng đứng)
#ds([Một tên lửa mô hình nghiên cứu khí tượng được phóng thẳng đứng từ một bệ phóng cao $10 text(" m")$ so với mặt đất.
Độ cao của tên lửa sau $t$ giây kể từ khi phóng được mô tả bởi hàm số:
$ h(t) = -4.9 t^2 + 98 t + 10 text(" (m)") $ (với $t >= 0$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tại thời điểm phóng ($t = 0$), tên lửa ở độ cao $10 text(" m")$ so với mặt đất.]),
    True([Tên lửa đạt độ cao lớn nhất tại thời điểm $t = 10 text(" giây")$ sau khi phóng.]),
    True([Độ cao cực đại mà tên lửa đạt được so với mặt đất là $500 text(" m")$.]),
    [Sau đúng $20 text(" giây")$ kể từ khi phóng thì tên lửa chạm mặt đất.]
  ),
  loigiai: [
    #step([Độ cao ban đầu])
    $h(0) = -4.9(0) + 98(0) + 10 = 10 text(" m")$. Mệnh đề a ĐÚNG.

    #step([Thời điểm đạt độ cao cực đại])
    Hàm số bậc hai có $a = -4.9 < 0$ đạt cực đại tại:
    $ t_I = - 98 / (2(-4.9)) = 98 / 9.8 = 10 text(" giây") $
    Mệnh đề b ĐÚNG.

    #step([Độ cao cực đại])
    $h(10) = -4.9(10)^2 + 98(10) + 10 = -490 + 980 + 10 = 500 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Độ cao tại thời điểm t = 20s])
    Tại $t = 20 text(" giây")$:
    $ h(20) = -4.9(20)^2 + 98(20) + 10 = -4.9(400) + 1960 + 10 = -1960 + 1960 + 10 = 10 text(" m") > 0 $
    Tại $t = 20 text(" giây")$, tên lửa vẫn ở độ cao $10 text(" m")$ so với mặt đất chứ chưa chạm đất.
    Khẳng định chạm mặt đất là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Độ cao vòm cầu tại x = 15m)
#tln([Trong bài toán cầu vòm thép vượt sông có phương trình $y = - 1 / 60 x^2 + 15$, độ cao của vòm cầu tại vị trí cách tâm cầu một khoảng $15 text(" m")$ là bao nhiêu mét? (Nhập kết quả dưới dạng số thập phân)],
    [11.25],
    loigiai: [
        #step([Thay x = 15 vào phương trình vòm cầu])
        $ y(15) = - 1 / 60 (15)^2 + 15 = - 225 / 60 + 15 = - 3.75 + 15 = 11.25 text(" m") $
    ]
)

// TLN 2 (Độ cao lớn nhất bóng sút phạt)
#tln([Trong bài toán sút phạt bóng đá, độ cao lớn nhất mà quả bóng đạt được là bao nhiêu mét? (Nhập kết quả dưới dạng số thập phân)],
    [3.6],
    loigiai: [
        #step([Tính độ cao đỉnh quỹ đạo])
        Hàm số: $h(x) = -0.016 x^2 + 0.48 x$.
        Đỉnh parabol tại: $x = 15 text(" m")$.
        $ h(15) = -0.016(15)^2 + 0.48(15) = 3.6 text(" m") $
    ]
)

// TLN 3 (Tiêu cự chảo thu sóng)
#tln([Khoảng cách tiêu cự từ đầu thu tín hiệu LNB đến đáy chảo vệ tinh parabol có đường kính $2 text(" m")$ và độ sâu $0.5 text(" m")$ là bao nhiêu mét? (Nhập kết quả dưới dạng số thập phân)],
    [0.5],
    loigiai: [
        #step([Áp dụng công thức tiêu cự chảo parabol])
        $ f = D^2 / (16H) = 2^2 / (16 cdot 0.5) = 4 / 8 = 0.5 text(" m") $
    ]
)

// TLN 4 (Độ cao cực đại tên lửa)
#tln([Độ cao lớn nhất so với mặt đất mà tên lửa nghiên cứu khí tượng đạt được là bao nhiêu mét?],
    [500],
    loigiai: [
        #step([Tính cực đại hàm số])
        Hàm số: $h(t) = -4.9 t^2 + 98 t + 10$.
        Đạt giá trị lớn nhất tại $t = 10 text(" giây")$.
        $ h(10) = -4.9(100) + 98(10) + 10 = 500 text(" m") $
    ]
)

// TLN 5 (Độ sâu chao đèn pha ô tô)
#tln([Một chao đèn pha ô tô hình parabol có phương trình $y = 1 / 6 x^2$ (đơn vị: cm). Nếu đường kính miệng chao đèn là $12 text(" cm")$ thì độ sâu của chao đèn bằng bao nhiêu centimét?],
    [6],
    loigiai: [
        #step([Tính bán kính miệng chao])
        Bán kính miệng chao đèn: $R = 12 / 2 = 6 text(" cm")$.
        
        #step([Tính độ sâu])
        Độ sâu tương ứng với tung độ tại $x = 6$:
        $ y(6) = 1 / 6 (6)^2 = 36 / 6 = 6 text(" cm") $
    ]
)

// TLN 6 (Khoảng cách giữa hai thanh chống đứng vòm hầm)
#tln([Một vòm hầm đường sắt hình parabol có chiều rộng ở sàn hầm là $10 text(" m")$ và chiều cao tại đỉnh là $5 text(" m")$.
Người ta lắp đặt hai thanh thép chống đứng song song đối xứng qua trục tâm của hầm để gia cố, mỗi thanh có chiều cao $4.2 text(" m")$.
Khoảng cách giữa hai thanh thép chống đứng bằng bao nhiêu mét?],
    [4],
    loigiai: [
        #step([Thiết lập phương trình vòm hầm])
        Chọn hệ trục $O x y$ có gốc $O$ tại tâm sàn hầm, đỉnh vòm $I(0; 5)$, hai chân hầm tại $(-5; 0)$ và $(5; 0)$.
        Phương trình parabol có dạng: $y = 5 - a x^2$.
        Thay điểm $(5; 0)$ vào:
        $ 0 = 5 - a(5)^2 <=> 25a = 5 <=> a = 5 / 25 = 0.2 $
        Phương trình là: $y = 5 - 0.2 x^2$.
        
        #step([Tìm vị trí thanh chống cao 4.2m])
        Tại vị trí thanh chống có chiều cao $y = 4.2 text(" m")$:
        $ 5 - 0.2 x^2 = 4.2 <=> 0.2 x^2 = 0.8 <=> x^2 = 4 <=> x = plus.minus 2 $
        
        #step([Tính khoảng cách giữa hai thanh chống])
        Hai thanh chống đặt tại $x = -2$ và $x = 2$.
        Khoảng cách giữa hai thanh là:
        $ d = 2 - (-2) = 4 text(" m") $
    ]
)

] // end make-questions

#make-questions()
