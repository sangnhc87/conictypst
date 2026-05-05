// ═══════════════════════════════════════════════════════════
// MAIN-BEAMER.TYP — Trình chiếu CHỮA ĐỀ de-01 (full 12-4-6)
// Compile: typst compile typst/main-beamer.typ
// ═══════════════════════════════════════════════════════════

#import "sang-beamer.typ": *
#import "@preview/cetz:0.5.0"

#let accent = classic.blue

#show: sang-beamer-theme.with(
  title: "CHỮA ĐỀ THI THỬ THPT QG 2026",
  subtitle: "TOÁN - LỚP 12",
  author: "GV Nguyễn Văn Sang",
  institution: "Sở GD&ĐT Nghệ An",
  accent: accent,
  code: "101",
)

#let mode = "loigiai"
#let (mcq, tf, short) = exam-mode(mode: mode, accent: accent)
#include "exams/Sơ-Đồ-Cây-1-3-6-beamer.typ"
// ═══════════════════════════════════════════════════════════
// PHẦN I — Trắc nghiệm (12 câu)
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn])

#mcq(
  [Tính tích phân $I = integral_0^(pi/2) cos x dif x$.],
  ([$-1$], True([$1$]), [$0$], [$pi/2$]),
  num: 1,
  solution: [
    $I = integral_0^(pi/2) cos x dif x = sin x |_0^(pi/2) = 1 - 0 = 1.$ Chọn *B*.
  ],
)

#mcq(
  [Trong không gian $O x y z$, phương trình nào là phương trình mặt cầu?],
  (
    [$2x^2+y^2+z^2-2x-2y-4z-3=0$],
    True([$x^2+y^2+z^2-2x-2y-4z-3=0$]),
    [$x^2+y^2+2z^2-2x-2y-4z-3=0$],
    [$x^2+2y^2+z^2-2x-2y-4z-3=0$],
  ),
  num: 2,
  solution: [
    Chỉ *B* có hệ số $x^2, y^2, z^2$ đều bằng $1$:
    $(x-1)^2+(y-1)^2+(z-2)^2=9$. Mặt cầu tâm $I(1;1;2)$, $R=3$. Chọn *B*.
  ],
)

#mcq(
  [Trong các khẳng định sau, khẳng định nào đúng?],
  (
    [$cos(a-b)=cos a sin b - sin a cos b$],
    [$cos(a-b)=cos a cos b - sin a sin b$],
    [$cos(a-b)=cos a sin b + sin a cos b$],
    True([$cos(a-b)=cos a cos b + sin a sin b$]),
  ),
  num: 3,
  solution: [
    Công thức cộng: $cos(a-b) = cos a cos b + sin a sin b$. Chọn *D*.
  ],
)

#mcq(
  [Cho khối hộp chữ nhật $A B C D.A'B'C'D'$ có đáy $A B C D$ hình vuông cạnh $2$, $A C'$ tạo với $(A B C D)$ góc $60°$. Tính thể tích.],
  (True([$8 sqrt(6)$]), [$4 sqrt(6)$], [$8 sqrt(3)$], [$(8 sqrt(6))/3$]),
  num: 4,
  solution: [
    $A C = 2sqrt(2)$. $A A' = A C tan 60° = 2sqrt(6)$. $V = 4 dot 2sqrt(6) = 8sqrt(6)$. Chọn *A*.
  ],
)

#mcq(
  [Cho hàm số $y = (a x+b)/(c x+d)$ có đồ thị như hình. Tiệm cận đứng là:],
  ([$y=2$], [$y=1$], True([$x=1$]), [$x=2$]),
  num: 5,
  solution: [
    Đường thẳng đứng đồ thị tiến sát hai phía: $x = 1$. $y = 2$ là tiệm cận ngang. Chọn *C*.
  ],
)

#mcq(
  [Cho hàm số $y=f(x)$ có bảng biến thiên (BBT). Hàm số nghịch biến trong khoảng nào?],
  ([$(-1;1)$], [$(4;+infinity)$], [$(-infinity;2)$], True([$(0;1)$])),
  num: 6,
  solution: [
    Từ BBT: $y' < 0$ trên $(-1;0)$ và $(0;1)$. Tách riêng tại $x=0$ (gián đoạn). Chọn *D*.
  ],
)

#mcq(
  [Elip $x^2/25 + y^2/16 = 1$ có tiêu cự bằng:],
  ([$10$], [$3$], [$8$], True([$6$])),
  num: 7,
  solution: [
    $a^2=25, b^2=16 => c^2=9 => c=3$. Tiêu cự $= 2c = 6$. Chọn *D*.
  ],
)

#mcq(
  [Nếu $log_a b = 3$ thì $log_a b^4$ bằng:],
  ([$7$], True([$12$]), [$81$], [$6$]),
  num: 8,
  solution: [
    $log_a b^4 = 4 log_a b = 4 dot 3 = 12$. Chọn *B*.
  ],
)

#mcq(
  [Họ nguyên hàm của $f(x) = 1/(sin^2 x)$ là:],
  ([$tan x + C$], [$cot x + C$], True([$-cot x + C$]), [$1/(sin x) + C$]),
  num: 9,
  solution: [
    $integral 1/(sin^2 x) dif x = -cot x + C$. Chọn *C*.
  ],
)

#mcq(
  [Cho mẫu số liệu ghép nhóm. Độ lệch chuẩn (làm tròn 2 chữ số thập phân) là:],
  ([$2,57$], [$2,55$], True([$2,56$]), [$2,54$]),
  num: 10,
  solution: [
    Điểm giữa: $9,11,13,15,17$. $n=29$. $overline(x) = 385/29$. $s approx 2,56$. Chọn *C*.
  ],
)

#mcq(
  [Đường thẳng qua $M(1;-2;3)$ với $vect(u)(1;-2;1)$ có phương trình:],
  (
    [$(x-1)/1 = (y+2)/(-2) = (z-1)/3$],
    True([$(x-1)/1 = (y+2)/(-2) = (z-3)/1$]),
    [$(x+1)/1 = (y-2)/(-2) = (z+3)/1$],
    [$(x+1)/1 = (y+2)/(-2) = (z-3)/1$],
  ),
  num: 11,
  solution: [
    $(x-x_0)/a = (y-y_0)/b = (z-z_0)/c => (x-1)/1 = (y+2)/(-2) = (z-3)/1$. Chọn *B*.
  ],
)

#mcq(
  [Cho $(P): 2x - 3y + z + 5 = 0$. Vectơ pháp tuyến của $(P)$ là:],
  ([$vect(n)(2;-3;5)$], [$vect(n)(2;3;-1)$], True([$vect(n)(2;-3;1)$]), [$vect(n)(2;-3;-1)$]),
  num: 12,
  solution: [
    $a x + b y + c z + d = 0 => vect(n) = (a;b;c) = (2;-3;1)$. Chọn *C*.
  ],
)

// ═══════════════════════════════════════════════════════════
// PHẦN II — Đúng/Sai (4 câu)
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN II. Câu trắc nghiệm đúng/sai])

#tf(
  [Cho hàm số $f(x) = (x - 4)/(x - 2)$.],
  (
    True([Tập xác định là $D = RR backslash {2}$.]),
    True([Đạo hàm $f'(x) > 0$ với mọi $x != 2$.]),
    [$f(4) = 2$.],
    [$M + m = 2$ trên đoạn $[4; 6]$.],
  ),
  num: 1,
  solution: [
    - *a) Đúng.* $x != 2$. *b) Đúng.* $f'(x) = 2/(x-2)^2 > 0$.
    - *c) Sai.* $f(4) = 0$. *d) Sai.* $M + m = 1/2$.
  ],
)

#tf(
  [Một hệ thống bảo mật nhận dạng khuôn mặt. $P(N) = 0.9$, $P(K) = 0.1$. $P(M|N) = 0.99$, $P(M|K) = 0.15$.],
  (
    True([Xác suất hệ thống từ chối mở cửa cho khách là $0.85$.]),
    [Xác suất mở cửa cho người bất kỳ là $0.9$.],
    True([Xác suất người đó là khách khi đã mở cửa nhỏ hơn $0.02$.]),
    True([Xác suất nhận diện nhầm là $0.024$.]),
  ),
  num: 2,
  solution: [
    - *a) Đúng.* $P(overline(M)|K) = 0.85$.
    - *b) Sai.* $P(M) = 0.906 != 0.9$.
    - *c) Đúng.* $P(K|M) approx 0.0166 < 0.02$.
    - *d) Đúng.* $P("Nhầm") = 0.024$.
  ],
)

// ═══════════════════════════════════════════════════════════
// PHẦN III — Trả lời ngắn (6 câu — demo 3)
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn])

#short(
  [Tìm giá trị cực đại của hàm số $y = -x^2 + 4x + 1$.],
  [$5$],
  num: 1,
  solution: [$y' = -2x + 4 = 0 => x = 2$. Cực đại: $y(2) = 5$.],
)

#short(
  [Tổng các nghiệm của phương trình $x^2 - 5x + 6 = 0$.],
  [$5$],
  num: 2,
  solution: [Viète: $x_1 + x_2 = 5$.],
)

#het
