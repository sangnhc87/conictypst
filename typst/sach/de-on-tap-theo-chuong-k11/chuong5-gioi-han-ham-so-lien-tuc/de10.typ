#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2": canvas, draw
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.equation: set text(fill: black)
#show math.frac: math.display

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// ĐỊNH NGHĨA CÁC HÌNH VẼ MINH HỌA (CETZ)
// ═══════════════════════════════════════════════════════════

// Hình 1: Quãng đường bóng nảy giảm dần
#let fig-bouncing-ball = canvas(length: 1cm, {
  import draw: *
  line((-0.5, 0), (5.5, 0), stroke: 1.5pt + black)
  
  line((0, 3.5), (0, 0), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  circle((0, 3.5), radius: 3pt, fill: rgb("#0057b8"))
  
  let pts1 = range(21).map(i => {
    let x = i * 0.05
    let y = 8/3 * x * (2 - x) 
    (x, y)
  })
  line(..pts1, stroke: 1.5pt + rgb("#cc2200"))
  circle((2, 0), radius: 2pt, fill: black)
  
  let pts2 = range(21).map(i => {
    let x = i * 0.05
    let y = 64/9 * x * (1 - x) 
    (2 + x, y)
  })
  line(..pts2, stroke: 1.3pt + rgb("#1a7a2e"))
  circle((3, 0), radius: 2pt, fill: black)
  
  let pts3 = range(21).map(i => {
    let x = i * 0.025
    let y = 19 * x * (0.5 - x) 
    (3 + x, y)
  })
  line(..pts3, stroke: 1.1pt + rgb("#e67e22"))
})

// Hình 2: Đồ thị nồng độ thuốc tích lũy qua nhiều liều
#let fig-drug-accumulation = canvas(length: 1cm, {
  import draw: *
  line((0, 4), (6.5, 4), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  content((5.2, 4.3), [Tích lũy tối đa])
  
  let levels = (0.0, 0.8, 1.44, 1.95, 2.36, 2.69, 2.95)
  for i in range(5) {
    let t_start = i
    let t_end = i + 1
    let val_start = levels.at(i)
    let val_peak = val_start + 1.5 
    
    line((t_start, val_start), (t_start, val_peak), stroke: 1.2pt + rgb("#cc2200"))
    
    let pts = range(11).map(j => {
      let t_rel = j * 0.1
      let t = t_start + t_rel
      let val = val_peak * calc.exp(-0.223 * t_rel) 
      (t, val)
    })
    line(..pts, stroke: 1.5pt + rgb("#0057b8"))
  }
  
  line((0,0), (6.5,0), stroke: 1.2pt + black)
  line((0,0), (0,4.5), stroke: 1.2pt + black)
  content((6.7, 0), [t])
  content((0, 4.8), [C])
})

// Hình 3: Biểu đồ tăng trưởng tài chính lãi kép liên tục
#let fig-compound-interest = canvas(length: 1cm, {
  import draw: *
  let pts = range(60).map(i => {
    let t = i * 0.1
    let y = 1 + 0.3 * calc.exp(0.4 * t)
    (t, y)
  })
  line(..pts, stroke: 1.8pt + rgb("#2ecc71"))
  
  line((0,0), (6,0), stroke: 1.2pt + black)
  line((0,0), (0,3.5), stroke: 1.2pt + black)
  content((6.2, 0), [t])
  content((0, 3.8), [A])
})

// Hình 4: Mô hình con lắc dao động giảm dần
#let fig-pendulum = canvas(length: 1cm, {
  import draw: *
  circle((0, 3.5), radius: 2pt, fill: black)
  line((-0.8, 3.5), (0.8, 3.5), stroke: 1.5pt + black)
  
  line((0, 3.5), (0, 1), stroke: 1.2pt + black)
  circle((0, 1), radius: 6pt, fill: rgb("#0057b8"))
  
  let theta1 = 25deg
  let p_left = (-2.5 * calc.sin(theta1), 3.5 - 2.5 * calc.cos(theta1))
  let p_right = (2.5 * calc.sin(theta1), 3.5 - 2.5 * calc.cos(theta1))
  line((0, 3.5), p_left, stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
  line((0, 3.5), p_right, stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
  circle(p_left, radius: 4pt, fill: rgb("#cc2200").lighten(50%))
  circle(p_right, radius: 4pt, fill: rgb("#cc2200").lighten(50%))
})

// Hình 5: Sơ đồ trạng thái Markov thị phần khách hàng
#let fig-markov-transition = canvas(length: 1.2cm, {
  import draw: *
  circle((0, 0), radius: 0.7, stroke: 1.5pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(90%))
  content((0, 0), [A])
  
  circle((3.5, 0), radius: 0.7, stroke: 1.5pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(90%))
  content((3.5, 0), [B])
  
  bezier((0.7, 0.2), (2.8, 0.2), (1.75, 0.6), stroke: 1.2pt + black)
  line((2.8, 0.2), (2.5, 0.35), stroke: 1.2pt + black)
  line((2.8, 0.2), (2.6, 0.1), stroke: 1.2pt + black)
  content((1.75, 0.9), [0.1])
  
  bezier((2.8, -0.2), (0.7, -0.2), (1.75, -0.6), stroke: 1.2pt + black)
  line((0.7, -0.2), (1.0, -0.35), stroke: 1.2pt + black)
  line((0.7, -0.2), (0.9, -0.1), stroke: 1.2pt + black)
  content((1.75, -0.9), [0.2])
  
  bezier((-0.5, 0.4), (-0.5, -0.4), (-1.5, 0), stroke: 1.2pt + black)
  line((-0.5, -0.4), (-0.7, -0.2), stroke: 1.2pt + black)
  content((-1.2, 0.4), [0.8])
  
  bezier((4.0, 0.4), (4.0, -0.4), (5.0, 0), stroke: 1.2pt + black)
  line((4.0, -0.4), (4.2, -0.2), stroke: 1.2pt + black)
  content((4.7, 0.4), [0.9])
})

// Hình 6: Mô hình rò rỉ khí bình chứa
#let fig-gas-leak = canvas(length: 1cm, {
  import draw: *
  rect((0, 0), (2, 3.2), stroke: 1.5pt + black, fill: rgb("#eaeaea"))
  rect((0.8, 3.2), (1.2, 3.5), stroke: 1.2pt + black, fill: gray)
  
  line((1, 3.5), (1, 4.1), stroke: 1.2pt + rgb("#e67e22"))
  line((1, 4.1), (0.8, 3.9), stroke: 1.2pt + rgb("#e67e22"))
  line((1, 4.1), (1.2, 3.9), stroke: 1.2pt + rgb("#e67e22"))
  
  circle((0.4, 0.5), radius: 3pt, fill: rgb("#0057b8"))
  circle((1.5, 0.8), radius: 3pt, fill: rgb("#0057b8"))
  circle((0.8, 1.2), radius: 3pt, fill: rgb("#0057b8"))
  circle((1.2, 2.0), radius: 3pt, fill: rgb("#0057b8"))
  circle((0.5, 2.5), radius: 3pt, fill: rgb("#0057b8"))
  circle((1.6, 2.8), radius: 3pt, fill: rgb("#0057b8"))
})

// Hình 7: Đồ thị hàm quần thể ổn định dưới đánh bắt
#let fig-growth-harvest = canvas(length: 1cm, {
  import draw: *
  line((0, 2.5), (6, 2.5), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  content((5.2, 2.8), [Giới hạn])
  
  let pts = range(60).map(i => {
    let t = i * 0.1
    let y = 2.5 * t / (t + 0.8)
    (t, y)
  })
  line(..pts, stroke: 1.8pt + rgb("#1a7a2e"))
  
  line((0,0), (6,0), stroke: 1.2pt + black)
  line((0,0), (0,3.2), stroke: 1.2pt + black)
  content((6.2, 0), [t])
  content((0, 3.5), [P])
})

// Hình 8: Thiết kế dốc cầu parabol trơn
#let fig-highway = canvas(length: 1cm, {
  import draw: *
  line((-2, 1), (0, 1), stroke: 2.5pt + gray)
  
  let pts = range(40).map(i => {
    let x = i * 0.1
    let y = 1 + 0.15 * x * x
    (x, y)
  })
  line(..pts, stroke: 2.5pt + rgb("#d35400"))
  
  circle((0, 1), radius: 3pt, fill: black)
  content((0, 1.4), [Điểm nối])
})

// Hình 9: Sơ đồ hệ thống màng lọc nước liên tiếp
#let fig-water-filter = canvas(length: 1.1cm, {
  import draw: *
  rect((0.2, 0.5), (1.4, 1.5), stroke: 1.2pt + black, fill: rgb("#dae8fc"))
  content((0.8, 1), [Màng 1])
  
  rect((2.1, 0.5), (3.3, 1.5), stroke: 1.2pt + black, fill: rgb("#dae8fc"))
  content((2.7, 1), [Màng 2])
  
  rect((4.0, 0.5), (5.2, 1.5), stroke: 1.2pt + black, fill: rgb("#dae8fc"))
  content((4.6, 1), [Màng 3])
  
  line((-0.5, 1), (0.2, 1), stroke: 1.2pt + black)
  line((1.4, 1), (2.1, 1), stroke: 1.2pt + black)
  line((3.3, 1), (4.0, 1), stroke: 1.2pt + black)
  line((5.2, 1), (5.9, 1), stroke: 1.2pt + black)
  
  line((0.2, 1), (0.0, 1.15), stroke: 1.2pt + black)
  line((2.1, 1), (1.9, 1.15), stroke: 1.2pt + black)
  line((4.0, 1), (3.8, 1.15), stroke: 1.2pt + black)
  line((5.9, 1), (5.7, 1.15), stroke: 1.2pt + black)
})

// Hình 10: Đồ thị hàm mật độ vi khuẩn Logistic
#let fig-logistic = canvas(length: 1cm, {
  import draw: *
  line((0, 3), (6, 3), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  content((5.2, 3.3), [Giới hạn])
  
  let pts = range(60).map(i => {
    let t = i * 0.1
    let y = 3 / (1 + 4 * calc.exp(-t))
    (t, y)
  })
  line(..pts, stroke: 1.8pt + rgb("#2ecc71"))
  
  line((0,0), (6,0), stroke: 1.2pt + black)
  line((0,0), (0,3.5), stroke: 1.2pt + black)
  content((6.2, 0), [t])
  content((0, 3.8), [P])
})

// Hình 11: Mạch điện nạp cuộn cảm RL
#let fig-rl-circuit = canvas(length: 0.8cm, {
  import draw: *
  circle((0, 2), radius: 0.5, stroke: 1.2pt + black)
  line((0, 1.5), (0, 0), stroke: 1.2pt + black)
  line((0, 2.5), (0, 3.5), stroke: 1.2pt + black)
  content((0, 2), [U])
  
  line((0, 3.5), (1, 3.5), stroke: 1.2pt + black)
  line((1, 3.5), (1.5, 4.0), stroke: 1.2pt + black)
  circle((1, 3.5), radius: 1.5pt, fill: black)
  circle((1.8, 3.5), radius: 1.5pt, fill: black)
  line((1.8, 3.5), (3, 3.5), stroke: 1.2pt + black)
  
  rect((3, 3.2), (4.5, 3.8), stroke: 1.2pt + black, fill: rgb("#fff2cc"))
  content((3.75, 4.1), [R])
  line((4.5, 3.5), (5.5, 3.5), stroke: 1.2pt + black)
  
  rect((5.3, 1.6), (5.7, 2.6), stroke: 1.2pt + black, fill: rgb("#d5e8d4"), radius: 0.1)
  content((6.2, 2.1), [L])
  line((5.5, 1.6), (5.5, 0), stroke: 1.2pt + black)
  
  line((5.5, 0), (0, 0), stroke: 1.2pt + black)
})

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 5",
  exam-title: "CHƯƠNG V. GIỚI HẠN. HÀM SỐ LIÊN TỤC (ĐỀ SỐ 10)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Một quả bóng cao su được thả từ độ cao $9$ m xuống một nền đất phẳng chịu lực. Mỗi lần chạm đất, quả bóng nảy ngược lên độ cao bằng $(2)/(3)$ độ cao của lần rơi ngay trước đó (như hình vẽ mô tả). Tính tổng quãng đường quả bóng di chuyển được (từ lúc thả cho đến khi dừng hẳn, tính bằng mét).],
    (
        [$27$ m.],
        [$36$ m.],
        True([$45$ m.]),
        [$54$ m.]
    ),
    fig: fig-bouncing-ball,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Quãng đường di chuyển của quả bóng gồm:
        - Quãng đường rơi ban đầu: $h_0 = 9$ m.
        - Các chu kỳ nảy lên và rơi xuống tiếp theo. Mỗi chu kỳ thứ $n$ có độ cao $h_n = 9 dot ((2)/(3))^n$. Vì bóng đi lên rồi lại đi xuống nên quãng đường đi trong chu kỳ này là $2 h_n$.
        Tổng quãng đường bóng đi được là:
        $ S = h_0 + 2 h_1 + 2 h_2 + 2 h_3 + ... = 9 + 2 dot [9 dot (2)/(3) + 9 dot ((2)/(3))^2 + ...] $.
        Biểu thức trong ngoặc là một cấp số nhân lùi vô hạn với $u_1 = 6$ và $q = (2)/(3)$.
        Tổng của cấp số nhân lùi vô hạn đó:
        $ S_("lùi") = (u_1)/(1 - q) = (6)/(1 - (2)/(3)) = 18 $.
        Do đó tổng quãng đường bóng đi được là:
        $ S = 9 + 2 dot 18 = 45 $ m.
    ]
)

// TN 2
#tn([Cứ sau đúng $24$ giờ, một bệnh nhân điều trị ngoại khoa được chỉ định uống $100$ mg một loại thuốc kháng sinh điều trị. Cơ thể hấp thụ và đào thải dần thuốc: sau mỗi $24$ giờ, lượng thuốc còn lại trong cơ thể chỉ bằng $80\%$ lượng thuốc có ở ngày trước đó. Tính lượng thuốc tối đa tích lũy bền vững trong cơ thể bệnh nhân khi thời gian điều trị kéo dài vô hạn (giới hạn nồng độ ổn định lâu dài).],
    (
        [$125$ mg.],
        [$250$ mg.],
        True([$500$ mg.]),
        [$800$ mg.]
    ),
    fig: fig-drug-accumulation,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Gọi $A_n$ là lượng thuốc trong cơ thể ngay sau khi uống liều thứ $n$:
        - $A_1 = 100$.
        - $A_2 = 100 + 100 dot 0.8 = 100(1 + 0.8)$.
        - $A_n = 100(1 + 0.8 + 0.8^2 + ... + 0.8^(n-1))$.
        Khi thời gian tiến tới vô hạn ($n -> +oo$), lượng thuốc tích lũy tối đa là tổng cấp số nhân lùi vô hạn có số hạng đầu $u_1 = 100$, công bội $q = 0.8$:
        $ A = limits(lim)_(n -> +oo) A_n = (u_1)/(1 - q) = (100)/(1 - 0.8) = 500 $ mg.
    ]
)

// TN 3
#tn([Nhà đầu tư tài chính gửi tiết kiệm $200$ triệu đồng vào ngân hàng với lãi suất suất ưu đãi $6\%$ một năm ghép lãi liên tục. Khi thời gian gửi tiền $t$ tăng lên, số tiền tích lũy tăng trưởng theo hàm số $A(t) = 200 e^(0.06 t)$ (triệu đồng) (như đồ thị minh họa). Số tiền nhà đầu tư nhận được sau đúng $10$ năm gửi tiết kiệm là bao nhiêu?],
    (
        [$200 e^(0.06)$ triệu đồng.],
        True([$200 e^(0.6)$ triệu đồng.]),
        [$200 e^(6)$ triệu đồng.],
        [$260$ triệu đồng.]
    ),
    fig: fig-compound-interest,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Số tiền tích lũy sau 10 năm gửi ghép lãi liên tục ($t = 10$) là:
        $ A(10) = 200 e^(0.06 dot 10) = 200 e^(0.6) $ triệu đồng.
    ]
)

// TN 4
#tn([Một con lắc vật lý dao động giảm dần từ vị trí ban đầu (như hình vẽ mô tả). Vòng dao động (cung tròn) đầu tiên của con lắc có chiều dài $30$ cm. Mỗi vòng dao động tiếp theo có chiều dài bằng $90\%$ vòng dao động ngay trước đó. Tính tổng quãng đường con lắc di chuyển được cho đến khi nó hoàn toàn dừng lại (tính bằng xăng-ti-mét).],
    (
        [$150$ cm.],
        [$200$ cm.],
        True([$300$ cm.]),
        [$450$ cm.]
    ),
    fig: fig-pendulum,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Quãng đường di chuyển của con lắc là tổng chuỗi chiều dài các vòng dao động:
        $ S = 30 + 30 dot 0.9 + 30 dot 0.9^2 + ... $
        Đây là tổng của cấp số nhân lùi vô hạn với số hạng đầu $u_1 = 30$ và công bội $q = 0.9$ (thỏa mãn $|q| < 1$).
        $ S = (u_1)/(1 - q) = (30)/(1 - 0.9) = 300 $ cm.
    ]
)

// TN 5
#tn([Trong mô hình chuyển dịch Markov về thị phần của một doanh nghiệp viễn thông (như sơ đồ trạng thái bên dưới): Mỗi tháng doanh nghiệp giữ lại được $80\%$ khách hàng cũ và giành thêm được $10\%$ khách hàng từ đối thủ cạnh tranh. Thị phần khách hàng của doanh nghiệp ở tháng thứ $n$ được xác định bởi công thức: $P_n = 0.8 P_(n-1) + 0.1 (1 - P_(n-1))$. Hãy tìm thị phần ổn định lâu dài tối đa (giới hạn của thị phần khi $n -> +oo$) của doanh nghiệp đó.],
    (
        [$25\%$],
        True([$(1)/(3)$ (tương đương khoảng $33.3\%$)]),
        [$50\%$],
        [$(2)/(3)$ (tương đương khoảng $66.7\%$)]
    ),
    fig: fig-markov-transition,
    fig-pos: "center",
    fig-width: 35%,
    loigiai: [
        Biến đổi công thức thị phần:
        $ P_n = 0.8 P_(n-1) + 0.1 - 0.1 P_(n-1) = 0.7 P_(n-1) + 0.1 $.
        Gọi $L = limits(lim)_(n -> +oo) P_n$. Lấy giới hạn hai vế của phương trình trạng thái ta được:
        $ L = 0.7 L + 0.1 => 0.3 L = 0.1 => L = (1)/(3) $.
        Vậy thị phần khách hàng ổn định dài hạn là $(1)/(3)$ (khoảng $33.3\%$).
    ]
)

// TN 6
#tn([Một bình chứa khí gas công nghiệp bị rò rỉ van xả áp suất (như hình vẽ). Mỗi giờ, lượng gas thoát ra ngoài bằng $5\%$ lượng gas còn lại trong bình chứa. Giả sử lượng gas ban đầu là $V_0$. Tìm tổng lượng gas đã thoát ra khỏi bình chứa sau thời gian vô hạn.],
    (
        [$0.05 V_0$],
        [$0.5 V_0$],
        True([$V_0$]),
        [Bình rò rỉ vô hạn gas.]
    ),
    fig: fig-gas-leak,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Lượng khí rò rỉ mỗi giờ là:
        - Giờ 1: $v_1 = 0.05 V_0$. Lượng khí còn lại: $0.95 V_0$.
        - Giờ 2: $v_2 = 0.05 (0.95 V_0)$. Lượng khí còn lại: $0.95^2 V_0$.
        - Giờ $n$: $v_n = 0.05 V_0 dot (0.95)^(n-1)$.
        Tổng lượng gas rò rỉ là tổng của cấp số nhân lùi vô hạn với $u_1 = 0.05 V_0$ và công bội $q = 0.95$ (thỏa mãn $|q| < 1$):
        $ V_("rò rỉ") = (u_1)/(1 - q) = (0.05 V_0)/(1 - 0.95) = (0.05 V_0)/(0.05) = V_0 $.
    ]
)

// TN 7
#tn([Một quần thể động vật quý hiếm trong khu bảo tồn sinh thái bị đánh bắt có mức sinh trưởng sau $t$ năm được mô phỏng theo hàm số: $P(t) = (3000 t + 500)/(t + 1)$ (con) (như đồ thị minh họa bên dưới). Hãy tìm giới hạn số lượng cá thể tối đa mà quần thể này có thể đạt được và duy trì ổn định dài hạn khi $t -> +oo$.],
    (
        [$500$ con.],
        [$1500$ con.],
        True([$3000$ con.]),
        [$3500$ con.]
    ),
    fig: fig-growth-harvest,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Giới hạn số lượng cá thể ổn định dài hạn là:
        $ limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (3000 t + 500)/(t + 1) = limits(lim)_(t -> +oo) (3000 + (500)/(t))/(1 + (1)/(t)) = 3000 $ con.
    ]
)

// TN 8
#tn([Kỹ sư thiết kế đường cong chuyển tiếp kết nối một mặt phẳng ngang cao độ $y = 3$ (khi $x <= 0$) với một đoạn đường cong dốc dạng parabol $y = a x^2 + b x + c$ (khi $x > 0$) (như hình vẽ tương tự). Để mặt đường liên tục tại vị trí nối $x = 0$, giá trị của tham số thiết kế $c$ phải bằng bao nhiêu?],
    (
        [$0$],
        [$1$],
        [$2$],
        True([$3$])
    ),
    fig: fig-highway,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Hàm mô tả cao độ dốc cầu là:
        $ f(x) = cases(3 "khi" x <= 0, a x^2 + b x + c "khi" x > 0) $.
        Để đường liên tục tại $x = 0$, ta phải có:
        $ limits(lim)_(x -> 0^-) f(x) = limits(lim)_(x -> 0^+) f(x) = f(0) $.
        Ta có:
        - $limits(lim)_(x -> 0^-) f(x) = 3$.
        - $limits(lim)_(x -> 0^+) f(x) = a(0)^2 + b(0) + c = c$.
        - $f(0) = 3$.
        Do đó $c = 3$.
    ]
)

// TN 9
#tn([Một hệ thống màng lọc nước liên tiếp gồm nhiều màng lọc (như sơ đồ bên dưới). Mỗi màng lọc loại bỏ được $80\%$ lượng tạp chất có trong nước đi qua nó. Hàm lượng tạp chất còn lại trong nước sau khi đi qua $n$ màng lọc là $A_n = A_0 dot (0.2)^n$ (với $A_0$ là hàm lượng tạp chất ban đầu). Khi số màng lọc tăng lên vô hạn ($n -> +oo$), lượng tạp chất còn lại tiến về giới hạn nào?],
    (
        [$A_0$],
        [$0.2 A_0$],
        True([$0$]),
        [$0.8 A_0$]
    ),
    fig: fig-water-filter,
    fig-pos: "center",
    fig-width: 35%,
    loigiai: [
        Ta có giới hạn tạp chất khi $n -> +oo$:
        $ limits(lim)_(n -> +oo) A_n = limits(lim)_(n -> +oo) [A_0 dot (0.2)^n] $.
        Vì cơ số $q = 0.2$ thỏa mãn $|q| < 1$, nên $limits(lim)_(n -> +oo) (0.2)^n = 0$.
        Do đó:
        $ limits(lim)_(n -> +oo) A_n = A_0 dot 0 = 0 $.
    ]
)

// TN 10
#tn([Mật độ vi khuẩn trong đĩa thí nghiệm sinh học phát triển theo thời gian $t$ (giờ) tuân theo mô hình giới hạn sức chứa (hàm số Logistic): $P(t) = (5000)/(1 + 4 e^(-0.3 t))$ (đơn vị/ml) (như đồ thị bên dưới). Tìm giới hạn mật độ vi khuẩn tối đa đạt được khi thời gian nuôi cấy kéo dài vô hạn ($t -> +oo$).],
    (
        [$1000$ đơn vị/ml.],
        [$1250$ đơn vị/ml.],
        True([$5000$ đơn vị/ml.]),
        [$25000$ đơn vị/ml.]
    ),
    fig: fig-logistic,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Mật độ vi khuẩn tối đa là giới hạn khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (5000)/(1 + 4 e^(-0.3 t)) $.
        Vì $limits(lim)_(t -> +oo) e^(-0.3 t) = 0$ nên:
        $ limits(lim)_(t -> +oo) P(t) = (5000)/(1 + 4 dot 0) = 5000 $ đơn vị/ml.
    ]
)

// TN 11
#tn([Trong một mạch điện xoay chiều RL (như sơ đồ vẽ bên dưới), khi đóng khóa điện, cường độ dòng điện $i(t)$ (ampe) tăng dần theo thời gian $t$ (giây) theo công thức: $i(t) = I_0 (1 - e^(-t / tau))$ (với $I_0, tau$ là các hằng số vật lý dương). Hãy tìm cường độ dòng điện giới hạn ổn định trong mạch khi thời gian đóng khóa điện kéo dài vô hạn ($t -> +oo$).],
    (
        [$0$ ampe.],
        [$0.5 I_0$ ampe.],
        True([$I_0$ ampe.]),
        [$2 I_0$ ampe.]
    ),
    fig: fig-rl-circuit,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Cường độ dòng điện giới hạn là:
        $ limits(lim)_(t -> +oo) i(t) = limits(lim)_(t -> +oo) I_0 (1 - e^(-t / tau)) $.
        Vì $tau > 0$, khi $t -> +oo$ ta có $-t / tau -> -oo$, dẫn tới $limits(lim)_(t -> +oo) e^(-t / tau) = 0$.
        Do đó:
        $ limits(lim)_(t -> +oo) i(t) = I_0 dot (1 - 0) = I_0 $ ampe.
    ]
)

// TN 12
#tn([Thiết kế đoạn đường ray tàu hỏa nối tiếp giữa hai khu vực địa hình có cao độ được mô phỏng bởi hàm số liên tục:
    $y(x) = cases(x + 2 "khi" x <= 1, x^2 - a x + 4 "khi" x > 1)$.
    Để đường ray được kết nối liên tục tại điểm chuyển tiếp $x = 1$, giá trị của tham số thiết kế $a$ phải bằng bao nhiêu?],
    (
        [$1$],
        True([$2$]),
        [$3$],
        [$4$]
    ),
    fig: fig-highway,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Để tuyến đường ray liên tục tại điểm $x = 1$, ta có điều kiện:
        $ limits(lim)_(x -> 1^-) y(x) = limits(lim)_(x -> 1^+) y(x) = y(1) $.
        Ta có:
        - $limits(lim)_(x -> 1^-) y(x) = 1 + 2 = 3$.
        - $limits(lim)_(x -> 1^+) y(x) = 1^2 - a(1) + 4 = 5 - a$.
        Do đó:
        $ 3 = 5 - a => a = 2 $.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Một quả bóng bàn được thả rơi tự do từ độ cao $6$ m xuống mặt bàn phẳng. Mỗi lần chạm mặt bàn, quả bóng bàn nảy ngược lên độ cao bằng $(1)/(2)$ độ cao rơi của lần trước đó (hình vẽ tương tự). Các phát biểu sau đúng hay sai?], (
        True([Quãng đường quả bóng bàn di chuyển ở lần nảy lên thứ nhất là $3$ m.]),
        True([Dãy số độ cao nảy lên $h_n$ của quả bóng lập thành một cấp số nhân lùi vô hạn với công bội $q = 0.5$.]),
        [Tổng quãng đường đi được của quả bóng từ lúc thả rơi đến khi chạm bàn lần thứ 4 là $15$ m.],
        True([Tổng quãng đường quả bóng bàn di chuyển được cho đến khi dừng hẳn là $18$ m.])
    ),
    fig: fig-bouncing-ball,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Độ cao nảy lần thứ nhất: $h_1 = 6 dot (1)/(2) = 3$ m.
        - *b)* Đúng. $h_n = 6 dot ((1)/(2))^n$ là cấp số nhân lùi vô hạn với $q = 0.5 < 1$.
        - *c)* Sai. Đến khi chạm bàn lần thứ 4, quãng đường đi được là:
          $ S_4 = h_0 + 2 h_1 + 2 h_2 + 2 h_3 = 6 + 2(3) + 2(1.5) + 2(0.75) = 6 + 6 + 3 + 1.5 = 16.5 $ m.
        - *d)* Đúng. Tổng quãng đường đến khi dừng hẳn:
          $ S = h_0 + 2 u_1 / (1 - q) = 6 + 2 dot 3 / (1 - 0.5) = 6 + 12 = 18 $ m.
    ]
)

// DS 2
#ds([Một bệnh nhân ngoại trú uống một liều kháng sinh điều trị định kỳ $80$ mg sau mỗi 24 giờ. Cơ thể hấp thụ và tự đào thải thuốc: sau mỗi chu kỳ 24 giờ lượng thuốc còn lưu lại trong máu giảm xuống còn một nửa ($50\%$) lượng thuốc hiện có (như mô hình vẽ bên dưới). Các phát biểu sau đúng hay sai?], (
        True([Lượng thuốc còn lại trong cơ thể ngay sau liều uống thứ hai là $120$ mg.]),
        [Dãy lượng thuốc tích lũy sau mỗi lần uống lập thành một cấp số nhân lùi vô hạn với công bội $q = 0.5$.],
        True([Lượng thuốc tích lũy tối đa ổn định lâu dài trong cơ thể bệnh nhân khi điều trị dài hạn là $160$ mg.]),
        True([Nếu liều dùng tăng lên thành $120$ mg mỗi ngày, lượng thuốc tích lũy tối đa ổn định dài hạn sẽ là $240$ mg.])
    ),
    fig: fig-drug-accumulation,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Ngay sau liều 2: $A_2 = 80 + 80 dot 0.5 = 120$ mg.
        - *b)* Sai. Dãy số $A_n = 80(1 + 0.5 + ... + 0.5^(n-1))$ không phải là cấp số nhân (nó là tổng riêng của cấp số nhân).
        - *c)* Đúng. Giới hạn tích lũy: $A = 80 / (1 - 0.5) = 160$ mg.
        - *d)* Đúng. Với liều $120$ mg: $A = 120 / (1 - 0.5) = 240$ mg.
    ]
)

// DS 3
#ds([Mô hình chuyển dịch thị phần viễn thông giữa hai nhà mạng A và B (hình vẽ sơ đồ trạng thái bên dưới) cho biết: Mỗi tháng nhà mạng A giữ lại được $70\%$ khách hàng cũ và giành được $20\%$ khách hàng từ nhà mạng B. Thị phần của nhà mạng A ở tháng thứ $n$ là: $P_n = 0.7 P_(n-1) + 0.2 (1 - P_(n-1))$. Các phát biểu sau đúng hay sai?], (
        True([Hàm chuyển dịch thị phần có thể rút gọn thành phương trình trạng thái: $P_n = 0.5 P_(n-1) + 0.2$.]),
        True([Dãy thị phần khách hàng $P_n$ của nhà mạng A tiến tới hội tụ về một giá trị giới hạn lâu dài ổn định.]),
        True([Thị phần ổn định lâu dài tối đa của nhà mạng A đạt được là $40\%$.]),
        [Nếu nhà mạng A nâng cao chất lượng dịch vụ để giữ lại $80\%$ khách hàng cũ (giành $20\%$ từ B), thị phần dài hạn mới sẽ là $60\%$.]
    ),
    fig: fig-markov-transition,
    fig-pos: "center",
    fig-width: 35%,
    loigiai: [
        - *a)* Đúng. $P_n = 0.7 P_(n-1) + 0.2 - 0.2 P_(n-1) = 0.5 P_(n-1) + 0.2$.
        - *b)* Đúng. Đây là hệ Markov hai trạng thái có tính chất ergodic nên luôn hội tụ về trạng thái cân bằng.
        - *c)* Đúng. Giới hạn thị phần: $L = 0.5 L + 0.2 => 0.5 L = 0.2 => L = 0.4 = 40\%$.
        - *d)* Sai. Khi giữ lại $80\%$ khách hàng cũ: $P_n = 0.8 P_(n-1) + 0.2(1 - P_(n-1)) = 0.6 P_(n-1) + 0.2$.
          Giới hạn thị phần dài hạn mới: $L = 0.6 L + 0.2 => 0.4 L = 0.2 => L = 0.5 = 50\%$ (không phải $60\%$).
    ]
)

// DS 4
#ds([Một dốc chuyển tiếp giao thông có thiết kế dạng hàm số ghép liên tục như sau:
    $f(x) = cases(1 "khi" x <= 0, a x^2 + b x + 1 "khi" x > 0)$.
    Các phát biểu sau đúng hay sai?], (
        True([Hàm số dốc cầu $f(x)$ luôn liên tục tại vị trí chuyển tiếp nối đường $x = 0$ với mọi giá trị thực của các tham số $a, b$.]),
        True([Nếu $a = 2, b = 1$ thì độ cao dốc cầu tại vị trí $x = 2$ là $11$.]),
        True([Độ dốc tiếp tuyến mặt đường liên tục trơn tại điểm nối $x = 0$ khi và chỉ khi hệ số góc tiếp tuyến phải $b = 0$.]),
        [Nếu chọn $a = 1, b = 0$, hàm số $f(x)$ không liên tục trên toàn bộ trục số thực $RR$.]
    ),
    fig: fig-highway,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Ta có $limits(lim)_(x -> 0^-) f(x) = 1$, $limits(lim)_(x -> 0^+) f(x) = a(0)^2 + b(0) + 1 = 1$ và $f(0) = 1$. Do đó hàm luôn liên tục tại $x = 0$.
        - *b)* Đúng. Với $a = 2, b = 1$, tại $x = 2 > 0$ ta có: $f(2) = 2(2^2) + 1(2) + 1 = 8 + 2 + 1 = 11$.
        - *c)* Đúng. Đạo hàm trái tại $x = 0$ là $0$, đạo hàm phải tại $x = 0$ là $b$. Để trơn tru thì $b = 0$.
        - *d)* Sai. Với $a = 1, b = 0$, hàm trở thành $f(x) = cases(1 "khi" x <= 0, x^2 + 1 "khi" x > 0)$. Hàm này liên tục trên toàn bộ $RR$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một quả bóng được thả rơi từ độ cao $12$ m xuống đất. Mỗi lần chạm đất, quả bóng nảy ngược lên độ cao bằng $(1)/(3)$ độ cao của lần rơi trước đó (như hình vẽ tương tự). Tính tổng quãng đường quả bóng di chuyển được cho đến khi dừng hẳn (tính bằng mét).],
    [24],
    fig: fig-bouncing-ball,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Quãng đường di chuyển của quả bóng là:
        $ S = h_0 + 2 h_1 / (1 - q) = 12 + 2 dot (12 dot 1/3) / (1 - 1/3) = 12 + (8) / (2/3) = 12 + 12 = 24 $ m.
    ]
)

// TL 2
#tln([Một bệnh nhân uống định kỳ $60$ mg thuốc điều trị sau mỗi $24$ giờ. Sau mỗi chu kỳ $24$ giờ, lượng thuốc còn lưu lại trong máu giảm xuống còn $40\%$ lượng thuốc hiện có (như hình vẽ tương tự). Tính lượng thuốc tích lũy tối đa ổn định lâu dài trong cơ thể bệnh nhân khi thời gian điều trị kéo dài vô hạn (tính bằng mg).],
    [100],
    fig: fig-drug-accumulation,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Giới hạn tích lũy tối đa là tổng cấp số nhân lùi vô hạn với $u_1 = 60$ và công bội $q = 0.4$:
        $ A = (u_1)/(1 - q) = (60)/(1 - 0.4) = (60)/(0.6) = 100 $ mg.
    ]
)

// TL 3
#tln([Một con lắc vật lý dao động giảm dần từ vị trí ban đầu (hình vẽ tương tự). Vòng dao động đầu tiên có chiều dài $50$ cm. Mỗi vòng dao động tiếp theo có chiều dài bằng $80\%$ vòng dao động ngay trước đó. Tính tổng quãng đường con lắc di chuyển được cho đến khi dừng hẳn (tính bằng xăng-ti-mét).],
    [250],
    fig: fig-pendulum,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Tổng quãng đường đi được là tổng cấp số nhân lùi vô hạn với số hạng đầu $u_1 = 50$ và công bội $q = 0.8$ (thỏa mãn $|q| < 1$).
        $ S = (u_1)/(1 - q) = (50)/(1 - 0.8) = (50)/(0.2) = 250 $ cm.
    ]
)

// TL 4
#tln([Trong mô hình chuyển dịch Markov về thị phần khách hàng giữa hai đối thủ A và B (hình vẽ sơ đồ trạng thái tương tự): Mỗi tháng doanh nghiệp A giữ lại được $60\%$ khách hàng cũ và giành được $30\%$ khách hàng từ đối thủ B. Thị phần của doanh nghiệp A ở tháng thứ $n$ thỏa mãn phương trình trạng thái: $P_n = 0.6 P_(n-1) + 0.3 (1 - P_(n-1))$. Tính giới hạn phần trăm thị phần lâu dài ổn định mà doanh nghiệp A đạt được khi thời gian tiến ra vô hạn (viết kết quả dưới dạng số phần trăm, ví dụ $50\% -> 50$).],
    [43],
    fig: fig-markov-transition,
    fig-pos: "center",
    fig-width: 35%,
    loigiai: [
        Biến đổi phương trình trạng thái:
        $ P_n = 0.6 P_(n-1) + 0.3 - 0.3 P_(n-1) = 0.3 P_(n-1) + 0.3 $.
        Lấy giới hạn $L = limits(lim)_(n -> +oo) P_n$:
        $ L = 0.3 L + 0.3 => 0.7 L = 0.3 => L = (3)/(7) approx 42.86\% $.
        Làm tròn đến hàng đơn vị của phần trăm ta được $43\%$.
    ]
)

// TL 5
#tln([Thiết kế đoạn dốc cầu parabol kết nối mặt phẳng ngang cao độ $y = 4$ có công thức cao độ liên tục:
    $f(x) = cases(4 "khi" x <= 2, x^2 - a x + 8 "khi" x > 2)$.
    Tìm giá trị của tham số thiết kế $a$ để bề mặt dốc cầu liên tục tại vị trí nối tiếp $x = 2$.],
    [4],
    fig: fig-highway,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Để cao độ dốc cầu liên tục tại điểm nối $x = 2$, ta cần:
        $ limits(lim)_(x -> 2^-) f(x) = limits(lim)_(x -> 2^+) f(x) = f(2) $.
        Ta có:
        - $limits(lim)_(x -> 2^-) f(x) = 4$.
        - $limits(lim)_(x -> 2^+) f(x) = 2^2 - a(2) + 8 = 12 - 2a$.
        Do đó:
        $ 4 = 12 - 2a => 2a = 8 => a = 4 $.
    ]
)

// TL 6
#tln([Một quần thể cá hồi di cư phát triển theo thời gian $t$ (năm) dưới tác động đánh bắt được mô phỏng bởi hàm số: $P(t) = (1600 t + 300)/(2 t + 1)$ (con) (hình vẽ đồ thị tương tự). Tìm giới hạn số lượng cá hồi tối đa mà quần thể đạt được khi thời gian $t -> +oo$.],
    [800],
    fig: fig-growth-harvest,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Số lượng cá hồi giới hạn khi $t -> +oo$ là:
        $ limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (1600 t + 300)/(2 t + 1) = limits(lim)_(t -> +oo) (1600 + (300)/(t))/(2 + (1)/(t)) = (1600)/(2) = 800 $ con.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
