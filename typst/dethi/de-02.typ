#import "../sang-exam.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill: math-color)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  school: "Sở GD&ĐT Nghệ An Lần 2",
  exam-title: "THI THỬ THPT QUỐC GIA 2026",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto, // tự đếm số câu mỗi phần
  code: "101",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false, // tắt thanh xanh trên đỉnh
  header-border: true,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

// ═══════════════════════════════════════════════════════════
// PHẦN I — Trắc nghiệm (12 câu)
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 12)

#tln(
  [Hai dây xích $"AC"$ và $"BD"$ giữ khúc gỗ $"CD"$ dài $2,5" m"$ nằm ngang, cách mặt đất $1,2" m"$.
    Cột $A$ cao $9" m"$, cột $B$ cao $4" m"$, khoảng cách hai cột $13" m"$.
    Chi phí: $"AC"$ là $0,4$ triệu VNĐ/$1" m"$, $"BD"$ là $0,1$ triệu VNĐ/$1" m"$.
    Tìm tổng chi phí nhỏ nhất (làm tròn đến hàng phần trăm)?

    #align(center)[
      #cetz.canvas(length: 0.65cm, {
        import cetz.draw: *
        line((-1, 0), (14, 0), stroke: 1pt)
        content((1, 0.3), [Mặt đất])
        line((0, 0), (0, 9), stroke: 1pt)
        line((13, 0), (13, 4), stroke: 1pt)
        content((0, 9.4), $A$)
        content((13, 4.4), $B$)
        let x = 4
        let y = 1.2
        let C = (x, y)
        let D = (x + 2.5, y)
        line((0, 9), C, stroke: (paint: blue, thickness: 1pt))
        line((13, 4), D, stroke: (paint: blue, thickness: 1pt))
        line(C, D, stroke: (paint: rgb("8B4513"), thickness: 4pt, cap: "round"))
        content((x - 0.4, y), $C$, anchor: "south-west", padding: 5pt)
        content((x + 2.9, y), $D$, anchor: "south-east", padding: 5pt)
        content((x + 1.25, y + 0.5), $2,5" m"$)
        line((x + 0.4, 0), (x + 0.6, y - 0.1), (x + 0.8, 0), close: true, fill: black)
        line((x + 1.7, 0), (x + 1.9, y - 0.1), (x + 2.1, 0), close: true, fill: black)
        line((x + 2.5, 0), (x + 2.5, y), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((x + 3.7, y / 2), $1,2" m"$)
        line((-0.5, 0), (-0.5, 9), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((-1.15, 4.5), $9" m"$)
        line((13.5, 0), (13.5, 4), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((14.2, 2), $4" m"$)
        bezier((0, -0.3), (6.5, -0.9), (0, -0.9), (2, -0.9), stroke: 0.5pt)
        bezier((13, -0.3), (6.5, -0.9), (13, -0.9), (11, -0.9), stroke: 0.5pt)
        content((6.5, -1.4), $13" m"$)
      })
    ]
  ],
  [$3,12$],
  loigiai: [
    #ppgiai[
      - Gọi $x$ là hình chiếu ngang của $"AC"$ ($0 <= x <= 10,5$).
      - Biểu diễn độ dài dây theo Pythagore.
      - Lập hàm chi phí, lập BBT để tìm GTNN.
    ]

    Gọi $x$ ($"m"$) là hình chiếu ngang của $"AC"$ ($0 <= x <= 10,5$).
    Hình chiếu của $"BD"$: $13 - 2,5 - x = 10,5 - x$.

    Chênh lệch chiều cao: $h_A = 9 - 1,2 = 7,8" m"$; $h_B = 4 - 1,2 = 2,8" m"$.

    Độ dài dây:
    - $"AC" = sqrt(x^2 + 7.8^2) = sqrt(x^2 + 60.84)$
    - $"BD" = sqrt((10.5-x)^2 + 2.8^2) = sqrt((10.5-x)^2 + 7.84)$

    Hàm chi phí (triệu VNĐ):
    $ f(x) = 0.4 sqrt(x^2 + 60.84) + 0.1 sqrt((10.5-x)^2 + 7.84) $

    Đạo hàm:
    $ f'(x) = (0.4x)/sqrt(x^2+60.84) - (0.1(10.5-x))/sqrt((10.5-x)^2+7.84) $

    Giải $f'(x)=0$ bằng máy tính: $x_0 approx 2.137$

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // Kích thước các hàng và cột của BBT
        let w1 = 2
        let w2 = 6
        let h1 = 0.8
        let h2 = 0.8
        let h3 = 2
        let tw = w1 + w2
        let th = h1 + h2 + h3

        // Khung ngoài và các đường kẻ ngang
        rect((0, 0), (tw, -th), stroke: 1pt)
        line((0, -h1), (tw, -h1), stroke: 1pt)
        line((0, -h1 - h2), (tw, -h1 - h2), stroke: 1pt)

        // Kẻ dọc ngăn cách nhãn và nội dung
        line((w1, 0), (w1, -th), stroke: 1pt)

        // Nhãn cột 1
        content((w1 / 2, -h1 / 2), $x$)
        content((w1 / 2, -h1 - h2 / 2), $T'(x)$)
        content((w1 / 2, -h1 - h2 - h3 / 2), $T(x)$)

        // Tọa độ x
        let x1 = w1 + 0.5
        let x2 = w1 + w2 / 2
        let x3 = tw - 0.5

        content((x1, -h1 / 2), $0$)
        content((x2, -h1 / 2), $x_0 approx 7.68$)
        content((x3, -h1 / 2), $15$)

        // Dấu đạo hàm
        content(((x1 + x2) / 2, -h1 - h2 / 2), $-$)
        content((x2, -h1 - h2 / 2), $0$)
        content(((x2 + x3) / 2, -h1 - h2 / 2), $+$)

        // Giá trị hàm số
        let y_top = -h1 - h2 - 0.4
        let y_bot = -th + 0.4

        content((x1, y_top), $3.65$, name: "v1", padding: 0.1)
        content((x2, y_bot), $3.479$, name: "v2", padding: 0.1)
        content((x3, y_top), $3.82$, name: "v3", padding: 0.1)

        // Mũi tên biến thiên (chỉn chu như tkz-tab)
        line("v1", "v2", mark: (end: ">", fill: black), stroke: 0.8pt)
        line("v2", "v3", mark: (end: ">", fill: black), stroke: 0.8pt)
      })
    ]

    Tính chính xác:
    $ f(2.137) approx 0.4 dot sqrt(2.137^2 + 60.84) + 0.1 dot sqrt(8.363^2 + 7.84) approx 3.118 $

    So sánh: $f(0) approx 3.48$; $f(10.5) approx 4.25$

    Vậy chi phí nhỏ nhất là *$3.12$* triệu VNĐ (làm tròn).
    #meo[
      - Dây $"AC"$ đắt gấp 4 lần → điểm tối ưu kéo về phía $A$ để giảm độ dài $"AC"$.
      - BBT giúp trình bày khoa học, dễ kiểm tra tính đơn điệu.
      - Luôn kiểm tra biên khi tìm GTNN trên đoạn đóng.
    ]
  ],
)
#tln(
  [Để lắp khung gỗ $"CD"$ dài $5" m"$ cách mặt đất $1" m"$, công nhân dùng dây $"AC"$ và $"BD"$ nối với cột $A$ ($12" m"$) và $B$ ($6" m"$).
    Khoảng cách hai cột $20" m"$. Do địa hình, thời gian kéo dây $"AC"$ là $0,1$ phút/$1" m"$, còn $"BD"$ là $0,15$ phút/$1" m"$.
    Tìm tổng thời gian lắp đặt nhỏ nhất (làm tròn đến hàng phần trăm)?

    #align(center)[
      #cetz.canvas(length: 0.7cm, {
        import cetz.draw: *
        line((-1, 0), (21, 0), stroke: 1pt)
        content((1, 0.3), [Mặt đất])
        line((0, 0), (0, 12), stroke: 1pt)
        line((20, 0), (20, 6), stroke: 1pt)
        content((0, 12.4), $A$)
        content((20, 6.4), $B$)
        let x = 7
        let y = 1
        let C = (x, y)
        let D = (x + 5, y)
        line((0, 12), C, stroke: (paint: blue, thickness: 1pt))
        line((20, 6), D, stroke: (paint: blue, thickness: 1pt))
        line(C, D, stroke: (paint: rgb("8B4513"), thickness: 4pt, cap: "round"))
        content((x - 0.4, y), $C$, anchor: "south-west", padding: 5pt)
        content((x + 5.4, y), $D$, anchor: "south-east", padding: 5pt)
        content((x + 2.5, y + 0.6), $5" m"$)
        line((x + 0.5, 0), (x + 0.7, y - 0.1), (x + 0.9, 0), close: true, fill: black)
        line((x + 1.75, 0), (x + 1.95, y - 0.1), (x + 2.15, 0), close: true, fill: black)
        line((x + 3.0, 0), (x + 3.2, y - 0.1), (x + 3.4, 0), close: true, fill: black)
        line((x + 4.25, 0), (x + 4.45, y - 0.1), (x + 4.65, 0), close: true, fill: black)
        line((x + 5.5, 0), (x + 5.5, y), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((x + 6.5, y / 2), $1" m"$)
        line((-0.5, 0), (-0.5, 12), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((-1.2, 6), $12" m"$)
        line((20.5, 0), (20.5, 6), mark: (start: "<", end: ">"), stroke: 0.5pt)
        content((21.2, 3), $6" m"$)
        bezier((0, -0.3), (10, -1), (0, -1), (2, -1), stroke: 0.5pt)
        bezier((20, -0.3), (10, -1), (20, -1), (18, -1), stroke: 0.5pt)
        content((10, -1.5), $20" m"$)
      })
    ]
  ],
  [$3,48$],
  loigiai: [
    #ppgiai[
      - Bài toán tối ưu thời gian thay vì chi phí, mô hình toán học tương đương.
      - Gọi $x$ là hình chiếu $"AC"$ ($0 <= x <= 15$).
      - Lập hàm thời gian $T(x)$, khảo sát tìm GTNN.
    ]

    Gọi $x$ ($"m"$) là hình chiếu ngang của $"AC"$ ($0 <= x <= 15$).
    Hình chiếu $"BD"$: $20 - 5 - x = 15 - x$.
    Chênh lệch chiều cao: $h_A = 12 - 1 = 11" m"$; $h_B = 6 - 1 = 5" m"$.

    Hàm thời gian (phút):
    $ T(x) = 0,1 sqrt(x^2 + 11^2) + 0,15 sqrt((15-x)^2 + 5^2) $

    Đạo hàm:
    $ T'(x) = (0,1x)/sqrt(x^2+121) - (0,15(15-x))/sqrt((15-x)^2+25) $

    Giải $T'(x)=0$: $x_0 approx 7,68$

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // Khai báo kích thước các hàng, cột cho bảng biến thiên
        let w1 = 1.5
        let w2 = 7
        let h1 = 0.8
        let h2 = 0.8
        let h3 = 2.2
        let tw = w1 + w2
        let th = h1 + h2 + h3

        // Kẻ khung ngoài và các đường ngang
        rect((0, 0), (tw, -th), stroke: 1pt)
        line((0, -h1), (tw, -h1), stroke: 1pt)
        line((0, -h1 - h2), (tw, -h1 - h2), stroke: 1pt)
        // Kẻ đường dọc ngăn cách nhãn và nội dung
        line((w1, 0), (w1, -th), stroke: 1pt)

        // Nhãn cột 1
        content((w1 / 2, -h1 / 2), $x$)
        content((w1 / 2, -h1 - h2 / 2), $T'(x)$)
        content((w1 / 2, -h1 - h2 - h3 / 2), $T(x)$)

        // Vị trí các mốc x
        let x1 = w1 + 0.6
        let x2 = w1 + w2 / 2
        let x3 = tw - 0.6

        // Hàng x
        content((x1, -h1 / 2), $0$)
        content((x2, -h1 / 2), $x_0 approx 7,68$)
        content((x3, -h1 / 2), $15$)

        // Hàng dấu đạo hàm
        content(((x1 + x2) / 2, -h1 - h2 / 2), $-$)
        content((x2, -h1 - h2 / 2), $0$)
        content(((x2 + x3) / 2, -h1 - h2 / 2), $+$)

        // Hàng sự biến thiên (căn chỉnh tọa độ cho mũi tên)
        let y_top = -h1 - h2 - 0.5
        let y_bot = -th + 0.4

        content((x1, y_top), $3,65$, name: "v1", padding: 0.1)
        content((x2, y_bot), $3,479$, name: "v2", padding: 0.1)
        content((x3, y_top), $3,82$, name: "v3", padding: 0.1)

        // Vẽ mũi tên biến thiên
        line("v1", "v2", mark: (end: ">", fill: black), stroke: 0.8pt)
        line("v2", "v3", mark: (end: ">", fill: black), stroke: 0.8pt)
      })
    ]

    Tính: $T(7,68) approx 3,479$. Biên: $T(0) approx 3,65$; $T(15) approx 3,82$.
    Vậy thời gian nhỏ nhất là *$3,48$* phút.
    #meo[
      - "Chi phí", "thời gian", "lực căng" đều quy về mô hình: $k_1 sqrt(x^2+a^2) + k_2 sqrt((L-x)^2+b^2)$.
      - Hệ số $k$ càng lớn, nghiệm tối ưu càng kéo về phía dây đó để rút ngắn độ dài.
    ]
  ],
)
#tln(
  [Người ta dùng hai đoạn dây xích sắt $A C$ và $B D$ để giữ chắc thăng bằng nằm ngang cho khúc gỗ nặng $C D$ như hình vẽ. Biết khúc gỗ dài $3" m"$ và hai đầu dây $C, D$ đều cao so với mặt đất là $1" m"$, hai đầu $C D$ có thể di chuyển dọc theo phương ngang. Nếu biết chi phí đoạn dây $A C$ là $0,2$ triệu VNĐ/$1" m"$ còn chi phí đoạn $B D$ là $0,1$ triệu VNĐ/$1" m"$. Hãy xác định tổng chi phí nhỏ nhất tính theo đơn vị triệu VNĐ để dùng cho công việc trên (làm tròn kết quả đến hàng phần trăm)?

    #align(center)[
      #cetz.canvas(length: 0.65cm, {
        import cetz.draw: *

        // Mặt đất
        line((-1, 0), (12, 0), stroke: 1pt)
        content((1, 0.3), [Mặt đất])

        // Cột A và B
        line((0, 0), (0, 6), stroke: 1pt)
        line((11, 0), (11, 4), stroke: 1pt)

        content((0, 6.4), $A$)
        content((11, 4.4), $B$)

        // Khúc gỗ CD
        let x = 3.5
        let y = 1
        let C = (x, y)
        let D = (x + 3, y)

        // Dây xích
        line((0, 6), C, stroke: (paint: blue, thickness: 1pt))
        line((11, 4), D, stroke: (paint: blue, thickness: 1pt))

        // Khúc gỗ
        line(C, D, stroke: (paint: rgb("8B4513"), thickness: 4pt, cap: "round"))
        content((x - 0.4, y), $C$, anchor: "south-west", padding: 5pt)
        content((x + 3.4, y), $D$, anchor: "south-east", padding: 5pt)
        content((x + 1.5, y + 0.5), $3" m"$)

        // Giá đỡ (tam giác)
        line((x + 0.5, 0), (x + 0.8, y - 0.1), (x + 1.1, 0), close: true, fill: black)
        line((x + 1.9, 0), (x + 2.2, y - 0.1), (x + 2.5, 0), close: true, fill: black)

        // Kích thước 1m
        line((x + 3.5, 0), (x + 3.5, y), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((x + 4.5, y / 2), $1" m"$)

        // Kích thước 6m
        line((-0.5, 0), (-0.5, 6), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((-1, 3), $6" m"$)

        // Kích thước 4m
        line((11.5, 0), (11.5, 4), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((12, 2), $4" m"$)

        // Kích thước 11m (Ngoặc)
        bezier((0, -0.3), (5.5, -0.8), (0, -0.8), (2, -0.8), stroke: 0.5pt)
        bezier((11, -0.3), (5.5, -0.8), (11, -0.8), (9, -0.8), stroke: 0.5pt)
        content((5.5, -1.3), $11" m"$)
      })
    ]
  ],
  [$1,74$],
  loigiai: [
    #ppgiai[
      - Gọi $x$ là khoảng cách hình chiếu nằm ngang của dây xích $A C$ lên mặt đất.
      - Biểu diễn các độ dài dây xích $A C, B D$ theo $x$ dựa vào định lý Pythagore.
      - Lập hàm chi phí $f(x)$ và khảo sát hàm số để tìm giá trị nhỏ nhất trên tập xác định.
    ]

    Gọi $x$ ($"m"$) là khoảng cách hình chiếu nằm ngang của dây xích $A C$ lên mặt đất ($0 <= x <= 8$).
    Vì khúc gỗ $C D$ dài $3" m"$ và tổng khoảng cách hai cột là $11" m"$, khoảng cách hình chiếu nằm ngang của dây xích $B D$ sẽ là: $11 - 3 - x = 8 - x$ ($"m"$).

    Chiều cao chênh lệch từ đầu dây $C$ đến $A$ là $h_A = 6 - 1 = 5" m"$.
    Chiều cao chênh lệch từ đầu dây $D$ đến $B$ là $h_B = 4 - 1 = 3" m"$.

    Theo định lý Pythagore, chiều dài các dây xích là:
    - $A C = sqrt(x^2 + 5^2) = sqrt(x^2 + 25)$.
    - $B D = sqrt((8 - x)^2 + 3^2) = sqrt((8 - x)^2 + 9)$.

    Tổng chi phí cho hai đoạn dây (đơn vị: triệu VNĐ) là:
    $ f(x) = 0,2 sqrt(x^2 + 25) + 0,1 sqrt((8 - x)^2 + 9) $
    Xét hàm số $f(x)$ trên đoạn $[0; 8]$:
    $ f'(x) = (0,2 x) / sqrt(x^2 + 25) - (0,1 (8 - x)) / sqrt((8 - x)^2 + 9) $
    Cho $f'(x) = 0$, ta có:
    $ (2 x) / sqrt(x^2 + 25) = (8 - x) / sqrt((8 - x)^2 + 9) $
    $ <=> 4 x^2 ((8 - x)^2 + 9) = (x^2 + 25) (8 - x)^2 $
    $ <=> 3 x^2 (8 - x)^2 + 36 x^2 - 25 (8 - x)^2 = 0 $
    $ <=> 3 x^4 - 48 x^3 + 203 x^2 + 400 x - 1600 = 0 $
    Sử dụng máy tính cầm tay giải phương trình trên khoảng $(0; 8)$, ta thu được nghiệm duy nhất $x approx 2,449$.

    Thay $x approx 2,449$ vào hàm chi phí:
    $ f(2,449) approx 0,2 sqrt(2","449^2 + 25) + 0,1 sqrt((8 - 2,449)^2 + 9) approx 1,744 " (triệu VNĐ)". $
    Ngoài ra, kiểm tra các giá trị tại biên:
    $ f(0) = 0,2 sqrt(25) + 0,1 sqrt(64 + 9) approx 1 + 0,854 = 1,854 $
    $ f(8) = 0,2 sqrt(64 + 25) + 0,1 sqrt(9) approx 1,886 + 0,3 = 2,186 $

    So sánh các giá trị, ta thấy chi phí nhỏ nhất là khoảng $1,744$ triệu VNĐ.
    Làm tròn kết quả đến hàng phần trăm, ta được kết quả là *$1,74$*.
    #meo[
      - Nhận ra đây là bài toán cực tiểu hàm chi phí.
      - Đặt ẩn theo hình chiếu ngang để biểu diễn hai độ dài bằng Pythagore.
      - Xét đạo hàm để tìm giá trị nhỏ nhất.
    ]
  ],
)
#tln(
  [Người ta dùng hai đoạn dây xích sắt AC và $B D$ để giữ khúc gỗ nặng $C D$ nằm ngang như hình vẽ.
    Biết khúc gỗ dài $2" m"$, hai đầu $C, D$ cách mặt đất $1,5" m"$ và có thể di chuyển ngang.
    Cột $A$ cao $8" m"$, cột $B$ cao $5" m"$, khoảng cách giữa hai cột là $12" m"$.
    Chi phí dây $A C$: $0,3$ triệu VNĐ/$1" m"$, dây $B D$: $0,15$ triệu VNĐ/$1" m"$.
    Tìm tổng chi phí nhỏ nhất (làm tròn đến hàng phần trăm)?

    #align(center)[
      #cetz.canvas(length: 0.65cm, {
        import cetz.draw: *

        // Mặt đất
        line((-1, 0), (13, 0), stroke: 1pt)
        content((1, 0.3), [Mặt đất])

        // Cột A và B
        line((0, 0), (0, 8), stroke: 1pt)
        line((12, 0), (12, 5), stroke: 1pt)

        content((0, 8.4), $A$)
        content((12, 5.4), $B$)

        // Khúc gỗ CD
        let x = 4
        let y = 1.5
        let C = (x, y)
        let D = (x + 2, y)

        // Dây xích
        line((0, 8), C, stroke: (paint: blue, thickness: 1pt))
        line((12, 5), D, stroke: (paint: blue, thickness: 1pt))

        // Khúc gỗ
        line(C, D, stroke: (paint: rgb("8B4513"), thickness: 4pt, cap: "round"))
        content((x - 0.4, y), $C$, anchor: "south-west", padding: 5pt)
        content((x + 2.4, y), $D$, anchor: "south-east", padding: 5pt)
        content((x + 1, y + 0.5), $2" m"$)

        // Giá đỡ
        line((x + 0.3, 0), (x + 0.5, y - 0.1), (x + 0.7, 0), close: true, fill: black)
        line((x + 1.3, 0), (x + 1.5, y - 0.1), (x + 1.7, 0), close: true, fill: black)

        // Kích thước
        line((x + 2.5, 0), (x + 2.5, y), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((x + 3.5, y / 2), $1,5" m"$)

        line((-0.5, 0), (-0.5, 8), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((-1, 4), $8" m"$)

        line((12.5, 0), (12.5, 5), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((13, 2.5), $5" m"$)

        // Khoảng cách 12m
        bezier((0, -0.3), (6, -0.9), (0, -0.9), (2, -0.9), stroke: 0.5pt)
        bezier((12, -0.3), (6, -0.9), (12, -0.9), (10, -0.9), stroke: 0.5pt)
        content((6, -1.4), $12" m"$)
      })
    ]
  ],
  [$2,89$],
  loigiai: [
    #ppgiai[
      - Gọi $x$ là hình chiếu ngang của $A C$ ($0 <= x <= 10$).
      - Dùng Pythagore biểu diễn $A C, B D$ theo $x$.
      - Lập hàm chi phí $f(x)$, khảo sát tìm GTNN.
    ]

    Gọi $x$ ($"m"$) là khoảng cách hình chiếu ngang của $A C$ ($0 <= x <= 10$).
    Hình chiếu ngang của $B D$: $12 - 2 - x = 10 - x$ ($"m"$).

    Chênh lệch chiều cao: $h_A = 8 - 1,5 = 6,5" m"$; $h_B = 5 - 1,5 = 3,5" m"$.

    Độ dài dây xích:
    - $A C = sqrt(x^2 + 6.5^2) = sqrt(x^2 + 42.25)$
    - $B D = sqrt((10-x)^2 + 3.5^2) = sqrt((10-x)^2 + 12.25)$

    Hàm chi phí (triệu VNĐ):
    $ f(x) = 0,3 sqrt(x^2 + 42.25) + 0,15 sqrt((10-x)^2 + 12.25) $

    Đạo hàm:
    $ f'(x) = (0,3x)/sqrt(x^2+42.25) - (0,15(10-x))/sqrt((10-x)^2+12.25) $

    Giải $f'(x)=0$ bằng máy tính: $x approx 3,124$

    Tính giá trị:
    $ f(3,124) approx 0,3*sqrt(3.124^2 + 42.25) + 0,15*sqrt(6.876^2 + 12.25) approx 2,886 $

    Kiểm tra biên: $f(0) approx 3,15$; $f(10) approx 3,42$

    Vậy chi phí nhỏ nhất là *$2,89$* triệu VNĐ (làm tròn).
    #meo[
      - Bài toán cùng dạng: thay số, giữ phương pháp.
      - Luôn kiểm tra giá trị tại biên khi tìm GTNN trên đoạn.
    ]
  ],
)

Bảng biến thiên:
#align(center)[
  #bbt-opt(
    var: $x$,
    der: $T'(x)$,
    func: $T(x)$,
    x-vals: ($0$, $x_0 approx 7.68$, $15$),
    d-signs: ($-$, $0$, $+$),
    v-vals: ($3.65$, $3.479$, $3.82$),
    is-min: true,
  )
]
#pagebreak()









#align(center)[
  #bbbt(
    var: $x$,
    der: $y'$,
    func: $y$,
    x-vals: ($-oo$, $-1$, $3$, $3$, $+oo$),
    d-signs: ("+", "0", "-", "0", "-", "0", ""),
    v-vals: ($-oo$, $7$, $5$, $5$, $+oo$),
    w2: 8,
  )
]
#align(center)[
  #bbbt(
    var: $x$,
    der: $y'$,
    func: $y$,
    x-vals: ($-oo$, $0$, $1$, $2$, $+oo$),
    // Đan xen: Dấu dưới x và dấu trên khoảng
    d-signs: ("-", "0", "+", "||", "-", "0", "+"),
    // Tại x=1 truyền mảng 2 pt để báo hiệu đồ thị bị đứt gãy
    v-vals: ($-oo$, $-1$, ($-oo$, $+oo$), $3$, $+oo$),
  )
]
#het
// ==========================================
// MACRO PRO: BẢNG BIẾN THIÊN ĐA NĂNG (AUTO RANK & ASYMPTOTE)
// Hỗ trợ: Liên tục (+ 0 +), (- 0 -) và Gián đoạn (- || -)
// ==========================================
#let bbt(
  var: $x$,
  der: $y'$,
  func: $y$,
  x-vals: (),
  d-signs: (),
  v-vals: (),
  w1: 1.5,
  w2: 8.5,
  h1: 0.8,
  h2: 0.8,
  h3: 2.2,
) = {
  cetz.canvas(length: 1cm, {
    import cetz.draw: *

    let n = x-vals.len()
    let tw = w1 + w2
    let th = h1 + h2 + h3

    rect((0, 0), (tw, -th), stroke: 1pt)
    line((0, -h1), (tw, -h1), stroke: 1pt)
    line((0, -h1 - h2), (tw, -h1 - h2), stroke: 1pt)
    line((w1, 0), (w1, -th), stroke: 1pt)

    content((w1 / 2, -h1 / 2), var)
    content((w1 / 2, -h1 - h2 / 2), der)
    content((w1 / 2, -h1 - h2 - h3 / 2), func)

    let render-sign(s) = {
      if s == "-" { $-$ } else if s == "+" { $+$ } else if s == "0" { $0$ } else if s == "||" { none } else { s }
    }

    let x-pos = ()
    for i in range(n) {
      let px = w1 + 0.6 + (w2 - 1.2) * i / (n - 1)
      x-pos.push(px)
      content((px, -h1 / 2), x-vals.at(i))
    }

    let ranks = ()
    let cur = 0
    ranks.push((cur,))

    for i in range(n - 1) {
      let sign = d-signs.at(2 * i + 1)
      if sign == "+" { cur += 1 } else if sign == "-" { cur -= 1 }

      let next_idx = 2 * (i + 1)
      if next_idx < d-signs.len() and d-signs.at(next_idx) == "||" {
        let next_sign = if next_idx + 1 < d-signs.len() { d-signs.at(next_idx + 1) } else { "+" }
        let left_rank = cur
        cur = if next_sign == "-" { left_rank + 2 } else { left_rank - 2 }
        ranks.push((left_rank, cur))
      } else {
        ranks.push((cur,))
      }
    }

    let flat-ranks = ()
    for r in ranks { for v in r { flat-ranks.push(v) } }
    let min-r = calc.min(..flat-ranks)
    let max-r = calc.max(..flat-ranks)

    let y-top = -h1 - h2 - 0.5
    let y-bot = -th + 0.4

    let map-y(r) = {
      if max-r == min-r { return (y-top + y-bot) / 2 }
      let factor = (r - min-r) / (max-r - min-r)
      return y-bot + factor * (y-top - y-bot)
    }

    let node-points = ()

    for i in range(n) {
      if d-signs.len() > 2 * i and d-signs.at(2 * i) == "||" {
        let px = x-pos.at(i)
        line((px - 0.05, -h1), (px - 0.05, -th), stroke: 0.8pt)
        line((px + 0.05, -h1), (px + 0.05, -th), stroke: 0.8pt)
      } else {
        content((x-pos.at(i), -h1 - h2 / 2), render-sign(d-signs.at(2 * i)))
      }

      if i < n - 1 {
        let mid-x = (x-pos.at(i) + x-pos.at(i + 1)) / 2
        content((mid-x, -h1 - h2 / 2), render-sign(d-signs.at(2 * i + 1)))
      }

      let rv = ranks.at(i)
      let val = v-vals.at(i)
      let px = x-pos.at(i)

      if rv.len() == 1 {
        let y = map-y(rv.at(0))
        let v-text = if type(val) == array { val.at(0) } else { val }
        content((px, y), v-text, name: "v" + str(i), padding: 0.15)
        node-points.push(("v" + str(i), "v" + str(i)))
      } else {
        let yL = map-y(rv.at(0))
        let yR = map-y(rv.at(1))
        let vL-text = if type(val) == array and val.len() > 0 { val.at(0) } else { val }
        let vR-text = if type(val) == array and val.len() > 1 { val.at(1) } else { val }

        let off = 0.35
        content((px - off, yL), vL-text, name: "v" + str(i) + "L", padding: 0.15)
        content((px + off, yR), vR-text, name: "v" + str(i) + "R", padding: 0.15)
        node-points.push(("v" + str(i) + "L", "v" + str(i) + "R"))
      }
    }

    for i in range(n - 1) {
      let start-node = node-points.at(i).at(1)
      let end-node = node-points.at(i + 1).at(0)
      line(start-node, end-node, mark: (end: ">", fill: black), stroke: 0.8pt)
    }
  })
}

// ==========================================
// VÍ DỤ MINH HỌA
// ==========================================

#tl(
  [
    Khảo sát và lập bảng biến thiên cho hàm phân thức có tiệm cận đứng: $y = (x+1)/(x-2)$.

    #align(center)[
      #cetz.canvas(length: 0.5cm, {
        import cetz.draw: *
        line((-2, 0), (6, 0), mark: (end: ">"), stroke: 0.8pt)
        line((0, -4), (0, 4), mark: (end: ">"), stroke: 0.8pt)
        content((5.5, -0.6), $x$)
        content((-0.6, 3.5), $y$)
        content((-0.4, -0.4), $O$)

        line((2, -4), (2, 4), stroke: (dash: "dashed", paint: red))
        line((-2, 1), (6, 1), stroke: (dash: "dashed", paint: blue))
      })
    ]
  ],
  loigiai: [
    #ppgiai[
      - Xác định tập xác định của hàm số (loại bỏ điểm làm mẫu số bằng 0).
      - Tính đạo hàm $y'$, đánh giá dấu của đạo hàm trên từng khoảng xác định.
      - Sử dụng macro `bbt` để tự động chia nhánh giới hạn tại điểm tiệm cận đứng.
    ]

    Bảng biến thiên:
    #align(center)[
      #bbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $2$, $+oo$),
        d-signs: ("", "-", "||", "-", ""),
        v-vals: ($1$, ($-oo$, $+oo$), $1$),
      )
    ]

    Đồ thị hàm số có tiệm cận đứng là đường thẳng $x = 2$ và tiệm cận ngang là đường thẳng $y = 1$.

    #align(center)[
      #cetz.canvas(length: 0.5cm, {
        import cetz.draw: *
        line((-2, 0), (6, 0), mark: (end: ">"), stroke: 0.8pt)
        line((0, -4), (0, 4), mark: (end: ">"), stroke: 0.8pt)
        content((5.5, -0.6), $x$)
        content((-0.6, 3.5), $y$)
        content((-0.4, -0.4), $O$)

        line((2, -4), (2, 4), stroke: (dash: "dashed", paint: red))
        line((-2, 1), (6, 1), stroke: (dash: "dashed", paint: blue))

        bezier((-2, 1.5), (1.5, 4), (0, 2), (1, 3), stroke: 1pt)
        bezier((2.5, -4), (6, 0.5), (3, -2), (4, -1), stroke: 1pt)
      })
    ]

    #luuy[
      Cảm ơn bạn đã nhắc nhở. Trong Typst, ký hiệu tập hợp hiệu là `$RR \setminus {2}$` và khác là `$forall x != 2$`, không dùng cú pháp LaTeX như `\mathbb{R}` hay `
eq`. Macro `bbt` cũng đã xử lý hoàn hảo nét gạch đôi `||` và tự động đứt gãy đồ thị mũi tên cho tiệm cận đứng.
    ]
  ],
)


#align(center)[
  #bbtv2(
    var: $x$,
    der: $y'$,
    func: $y$,
    x-vals: ($-oo$, $-2$, $2$, $+oo$),
    // Index 1 là x=-2, Index 2 là x=2.
    // Vùng ở giữa đạo hàm không có dấu, ta để chuỗi rỗng ""
    d-signs: ("-", "||", "", "||", "+"),
    // Hàm số y vẫn xác định tại biên, do đó v-vals tại biên là giá trị 0
    v-vals: ($+oo$, $0$, $0$, $+oo$),
    shade: ((1, 2),), // Gạch chéo miền từ Index 1 đến Index 2
  )
]



]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  
  // ═══════════════════════════════════════════════════════════
  // BẢNG ĐÁP ÁN (3 loại — tự động)
  // ═══════════════════════════════════════════════════════════
  pagebreak()
  print-answer-key()
}
