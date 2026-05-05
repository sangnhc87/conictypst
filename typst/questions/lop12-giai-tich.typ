// ═══════════════════════════════════════════════════════════
// questions/lop12-giai-tich.typ
// Ngân hàng câu hỏi — Lớp 12 — Giải tích
// Dùng schema question-tn, question-ds, question-tln, question-tl
// từ modules/question-bank.typ
// ═══════════════════════════════════════════════════════════

#import "../modules/question-bank.typ": ds-item, question-tn, question-ds, question-tln, question-tl

#let q-lop12-giai-tich = (

// ─────────────────────────────────────────────────────────
// TÍCH PHÂN & NGUYÊN HÀM
// ─────────────────────────────────────────────────────────

"12GT-NH-01": question-tn(
  [Họ nguyên hàm của hàm số $f(x) = 1/(sin^2 x)$ là],
  (
    [$tan x + C$],
    [$cot x + C$],
    [$-cot x + C$],
    [$1/(sin x) + C$],
  ),
  correct: 3,
  solution: [
    Công thức nguyên hàm cơ bản: $integral 1/(sin^2 x) dif x = -cot x + C$.
    Vậy họ nguyên hàm cần tìm là $-cot x + C$.
  ],
  tags: ("nguyen-ham", "luong-giac"),
  difficulty: "NB",
  status: "ready",
  source: "de-01",
),

"12GT-TI-01": question-tn(
  [Tính tích phân $I = integral_0^(pi/2) cos x dif x$.],
  ([$-1$], [$1$], [$0$], [$pi/2$]),
  correct: 2,
  solution: [
    Áp dụng Newton--Leibniz:
    $ I = integral_0^(pi/2) cos x dif x = sin x |_0^(pi/2) = sin(pi/2) - sin(0) = 1 - 0 = 1. $
  ],
  tags: ("tich-phan", "luong-giac"),
  difficulty: "NB",
  status: "ready",
  source: "de-01",
),

"12GT-LOG-01": question-tn(
  [Nếu $log_a b = 3$ thì $log_a b^4$ bằng],
  ([$7$], [$12$], [$81$], [$6$]),
  correct: 2,
  solution: [
    Ta sử dụng công thức lũy thừa của logarit: $log_a (b^m) = m log_a b$.
    Vì $log_a b = 3$ nên $log_a b^4 = 4 dot 3 = 12$.
  ],
  tags: ("logarit", "mu-logarit"),
  difficulty: "NB",
  status: "ready",
  source: "de-01",
),

// ─────────────────────────────────────────────────────────
// HÀM SỐ — ĐƠN ĐIỆU, CỰC TRỊ
// ─────────────────────────────────────────────────────────

"12GT-DS-BBT-01": question-tn(
  [Cho hàm số $y = f(x)$ có bảng biến thiên như hình. Hàm số đã cho nghịch biến trong khoảng nào?],
  ([$(-1; 1)$], [$(4; +oo)$], [$(-oo; 2)$], [$(0; 1)$]),
  correct: 4,
  solution: [
    Từ bảng biến thiên, $y' < 0$ trên khoảng $(-1; 0)$ và $(0; 1)$.
    Trong bốn phương án, chỉ khoảng $(0; 1)$ là khoảng nghịch biến hoàn chỉnh (không đi qua điểm gián đoạn $x = 0$).
  ],
  tags: ("ham-so", "don-dieu", "bang-bien-thien"),
  difficulty: "TH",
  status: "ready",
  source: "de-01",
),

"12GT-TY-01": question-ds(
  [Cho hàm số $f(x) = (x-4)/(x-2)$ có đồ thị $(C)$.],
  (
    ds-item([Tập xác định hàm số là $D = RR backslash {2}$.], correct: true),
    ds-item([$f'(x) = 2/(x-2)^2 quad forall x != 2$.], correct: true),
    ds-item([$f(4) = 2$.], correct: false),
    ds-item([Gọi $M, m$ là GTLN và GTNN của $f$ trên $[4; 6]$. Khi đó $M + m = 2$.], correct: false),
  ),
  solution: [
    a) Đúng: mẫu $x - 2 = 0$ khi $x = 2$, nên $D = RR backslash {2}$.
    b) Đúng: $f'(x) = (1 dot (-2) - 1 dot (-4))/(x-2)^2 = 2/(x-2)^2$.
    c) Sai: $f(4) = 0/2 = 0$.
    d) Sai: $f$ đồng biến trên $[4;6]$ nên $m = f(4) = 0$, $M = f(6) = 1/2$, suy ra $M + m = 1/2$.
  ],
  tags: ("phan-thuc", "dao-ham", "gtln-gtnn"),
  difficulty: "TH",
  status: "ready",
  source: "de-01",
),

// ─────────────────────────────────────────────────────────
// TÍCH PHÂN ỨNG DỤNG — BÀI TOÁN THỰC TẾ
// ─────────────────────────────────────────────────────────

"12GT-UD-PIN-01": question-ds(
  [Một viên pin dự phòng $10000 \" mAh\"$ đang vừa sạc vừa cấp điện.
  Tốc độ nạp: $f(t) = 250 e^(-0.01t) \" (mAh/phút)\"$.
  Tốc độ tiêu hao: $g(t) = 10 e^(0.04t) \" (mAh/phút)\"$.
  Lượng điện tích $Q(t)$ thỏa mãn $Q'(t) = f(t) - g(t)$, $Q(0) = 0$.],
  (
    ds-item([$Q(t)$ là một nguyên hàm của $h(t) = 250 e^(-0.01t) - 10 e^(0.04t)$.], correct: true),
    ds-item([$Q(t) = -25000 e^(-0.01t) - 250 e^(0.04t) + C$, $C$ là hằng số.], correct: false),
    ds-item([Sạc trong 30 phút thì pin chưa được $60%$.], correct: true),
    ds-item([Lượng điện tích từ dây sạc thường lớn hơn dây sạc thông minh trên $1000 \" mAh\"$.], correct: true),
  ),
  solution: [
    a) Đúng: Theo định nghĩa nguyên hàm, $Q'(t) = h(t)$.
    b) Sai: Đây là họ nguyên hàm. $Q(t)$ là hàm xác định với $C = 25250$.
    c) Đúng: $Q(30) approx 5899.5 < 6000 \" mAh\"$ ($60%$ của $10000$).
    d) Đúng: $Delta Q = Q_max - Q_2 approx 1292.2 > 1000 \" mAh\"$.
  ],
  tags: ("tich-phan", "ung-dung", "mo-hinh-toan-hoc"),
  difficulty: "VDC",
  status: "ready",
  source: "de-01",
),

"12GT-UD-DON-01": question-tln(
  [Một nghệ nhân chế tác đôn đồng dạng khối tròn xoay, cao $40 \" cm\"$, đường kính trên-dưới $30 \" cm\"$, eo nhỏ nhất $24 \" cm\"$, mặt cắt qua trục là hai parabol đối xứng. Khối lượng riêng đồng $8960 \" kg/m\"^3$, giá $220 \" nghìn đồng/kg\"$, gia công $10 \" triệu\"$. Tổng chi phí (triệu đồng, làm tròn đến hàng phần mười)?],
  [$52,1$],
  solution: [
    Đường sinh parabol: $x = 3/400 y^2 + 12$, $y in [-20; 20]$.
    $V = 2pi integral_0^20 (3/400 y^2 + 12)^2 dif y = 6792pi \" cm\"^3$.
    $m = 8960 times 6792pi times 10^(-6) approx 191.45 \" kg\"$.
    Chi phí = $191.45 times 220 times 10^(-3) + 10 approx 52.1 \" triệu\"$.
  ],
  tags: ("tich-phan", "ung-dung", "khai-niem-trong-khong-gian"),
  difficulty: "VDC",
  status: "ready",
  source: "de-01",
),

)
