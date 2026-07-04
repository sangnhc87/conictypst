// ═══════════════════════════════════════════════════════════
// questions/lop12-hinh-hoc.typ
// Ngân hàng câu hỏi — Lớp 12 — Hình học không gian & Oxyz
// ═══════════════════════════════════════════════════════════

#import "../math-sym.typ": *
#import "../sang-exam.typ": vect
#import "../modules/question-bank.typ": ds-item, question-tn, question-ds, question-tln, question-tl

#let q-lop12-hinh-hoc = (

// ─────────────────────────────────────────────────────────
// HÌNH HỌC KHÔNG GIAN — KHỐI ĐA DIỆN
// ─────────────────────────────────────────────────────────

"12HH-HOP-01": question-tn(
  [Cho khối hộp chữ nhật $A B C D . A' B' C' D'$ có đáy $A B C D$ là hình vuông cạnh $2$, đoạn $A C'$ tạo với mặt phẳng $(A B C D)$ một góc $60^degree$. Tính thể tích của khối hộp.],
  ([$8 sqrt(6)$], [$4 sqrt(6)$], [$8 sqrt(3)$], [$(8 sqrt(6))/3$]),
  correct: 1,
  solution: [
    $A C = 2sqrt(2)$. Góc $angle(A C', (A B C D)) = angle A C A' = 60^degree$.
    $A A' = A C dot tan 60^degree = 2sqrt(2) dot sqrt(3) = 2sqrt(6)$.
    $V = S_("đáy") times A A' = 4 times 2sqrt(6) = 8sqrt(6)$.
  ],
  tags: ("khoi-hop-chu-nhat", "the-tich", "hinh-hoc-khong-gian"),
  difficulty: "TH",
  status: "ready",
  source: "de-01",
),

// ─────────────────────────────────────────────────────────
// OXYZ — ĐƯỜNG THẲNG, MẶT PHẲNG, MẶT CẦU
// ─────────────────────────────────────────────────────────

"12HH-MC-01": question-tn(
  [Phương trình nào dưới đây là phương trình của một mặt cầu trong không gian $O x y z$?],
  (
    [$2x^2+y^2+z^2-2x-2y-4z-3=0$],
    [$x^2+y^2+z^2-2x-2y-4z-3=0$],
    [$x^2+y^2+2z^2-2x-2y-4z-3=0$],
    [$x^2+2y^2+z^2-2x-2y-4z-3=0$],
  ),
  correct: 2,
  solution: [
    Mặt cầu cần hệ số của $x^2, y^2, z^2$ bằng nhau.
    Phương án B: hoàn thành bình phương được $(x-1)^2 + (y-1)^2 + (z-2)^2 = 9$ — mặt cầu tâm $I(1;1;2)$, $R = 3$.
  ],
  tags: ("mat-cau", "oxyz"),
  difficulty: "NB",
  status: "ready",
  source: "de-01",
),

"12HH-DT-01": question-tn(
  [Phương trình đường thẳng đi qua $M(1; -2; 3)$, vectơ chỉ phương $vect(u)(1; -2; 1)$ là],
  (
    [$(x-1)/1 = (y+2)/(-2) = (z-1)/3$],
    [$(x-1)/1 = (y+2)/(-2) = (z-3)/1$],
    [$(x+1)/1 = (y-2)/(-2) = (z+3)/1$],
    [$(x+1)/1 = (y+2)/(-2) = (z-3)/1$],
  ),
  correct: 2,
  solution: [
    Dạng chính tắc: $(x - x_0)/a = (y - y_0)/b = (z - z_0)/c$.
    Với $M(1; -2; 3)$ và $vect(u)(1;-2;1)$: $(x-1)/1 = (y+2)/(-2) = (z-3)/1$.
  ],
  tags: ("duong-thang", "oxyz"),
  difficulty: "NB",
  status: "ready",
  source: "de-01",
),

"12HH-MP-01": question-tn(
  [Vectơ pháp tuyến của mặt phẳng $(P): 2x - 3y + z + 5 = 0$ là],
  (
    [$vect(n)(2; -3; 5)$],
    [$vect(n)(2; 3; -1)$],
    [$vect(n)(2; -3; 1)$],
    [$vect(n)(2; -3; -1)$],
  ),
  correct: 3,
  solution: [
    Mặt phẳng $a x + b y + c z + d = 0$ có vectơ pháp tuyến $vect(n) = (a; b; c)$.
    Với $2x - 3y + z + 5 = 0$: $vect(n) = (2; -3; 1)$.
  ],
  tags: ("mat-phang", "phap-tuyen", "oxyz"),
  difficulty: "NB",
  status: "ready",
  source: "de-01",
),

"12HH-RADAR-01": question-ds(
  [Trong hệ $O x y z$ (đơn vị km), mặt phẳng $(O x y)$ là mặt đất. Trạm ra-đa đặt tại $A(1; 2; 0)$, bán kính quét $R = 100 " km"$. Vật thể xuất phát từ $B(2; -1; 0)$, vận tốc $v(t) = 10 + 1/2 t - 1/1200 t^2 " (m/s)"$, bay theo hướng $vect(u) = (2; 2; 1)$, đến vị trí $C$ độ cao $6 " km"$.],
  (
    ds-item([Phương trình mặt cầu giám sát của ra-đa là $(x-1)^2 + (y-2)^2 + (z-1)^2 = 100$.], correct: false),
    ds-item([Phương trình đường thẳng $B C$ là $(x-2)/2 = (y+1)/2 = z/1$.], correct: true),
    ds-item([Quãng đường từ $B$ đến $C$ là $18 " km"$.], correct: true),
    ds-item([Thời gian từ khi xuất phát đến khi thoát vùng giám sát bé hơn 21 phút.], correct: false),
  ),
  solution: [
    a) Sai: $(x-1)^2 + (y-2)^2 + z^2 = 10000$ (bán kính 100 km, tâm $z = 0$).
    b) Đúng: Đường $B C$ qua $B(2;-1;0)$, $vect(u) = (2;2;1)$.
    c) Đúng: $t = 6$, $C = (14;11;6)$, $B C = sqrt(144+144+36) = 18 " km"$.
    d) Sai: Tổng thời gian $approx 21.29 > 21$ phút.
  ],
  tags: ("mat-cau", "duong-thang", "tich-phan-ung-dung", "oxyz"),
  difficulty: "VDC",
  status: "ready",
  source: "de-01",
),

// ─────────────────────────────────────────────────────────
// LƯỢNG GIÁC (dùng trong Oxyz / hình học)
// ─────────────────────────────────────────────────────────

"12HH-LG-01": question-tn(
  [Trong các khẳng định sau, khẳng định nào đúng?],
  (
    [$cos(a-b)=cos a sin b - sin a cos b$],
    [$cos(a-b)=cos a cos b - sin a sin b$],
    [$cos(a-b)=cos a sin b + sin a cos b$],
    [$cos(a-b)=cos a cos b + sin a sin b$],
  ),
  correct: 4,
  solution: [
    Công thức cộng: $cos(a - b) = cos a cos b + sin a sin b$.
  ],
  tags: ("luong-giac", "cong-thuc-cong"),
  difficulty: "NB",
  status: "ready",
  source: "de-01",
),

// ─────────────────────────────────────────────────────────
// ELIP, CONIC (Hình học giải tích phẳng)
// ─────────────────────────────────────────────────────────

"12HH-ELIP-01": question-tn(
  [Elip $x^2/25 + y^2/16 = 1$ có tiêu cự bằng],
  ([$10$], [$3$], [$8$], [$6$]),
  correct: 4,
  solution: [
    $a^2 = 25, b^2 = 16$. $c^2 = a^2 - b^2 = 9 => c = 3$.
    Tiêu cự $= 2c = 6$.
  ],
  tags: ("elip", "conic", "tiep-can"),
  difficulty: "NB",
  status: "ready",
  source: "de-01",
),

"12HH-TC-01": question-tn(
  [Cho hàm số $y = (a x + b)/(c x + d)$ có đồ thị như hình. Đường tiệm cận đứng là],
  ([$y=2$], [$y=1$], [$x=1$], [$x=2$]),
  correct: 3,
  solution: [
    Tiệm cận đứng là đường thẳng đứng mà đồ thị tiến tới. Quan sát hình: tiệm cận đứng là $x = 1$ (tiệm cận ngang là $y = 2$).
  ],
  tags: ("ham-phan-thuc", "tiem-can"),
  difficulty: "NB",
  status: "ready",
  source: "de-01",
),

)
