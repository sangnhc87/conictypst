#import "@preview/sang-math:1.0.6": *

#let mode = "dethi"
#let accent = rgb("0f766e")
#let ma-de = "1086"
#let in-qr-dap-an = false
#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
 
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG I: MỆNH ĐỀ VÀ TẬP HỢP",
  exam-title: "ĐỀ KIỂM TRA CHƯƠNG 1 - ĐỀ SỐ 14",
  subject: "TOÁN - 10A1",
  duration: "40 phút, không kể thời gian phát đề",
  structure: auto,
  code: ma-de,
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent, 
  show-topbar: false,
)

#state("sbd").update("1001")
#state("made").update(ma-de)
#include "12-4-6ngang.typ"
#pagebreak()
#let make-questions() = [
  #exam-part(
    [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.],
    count: 12,
    reset-counter: true,
  )

  #tn(
    [Câu nào dưới đây không là mệnh đề toán học?],
    (
      [$3 > 5$],
      True([Làm bài tập đi!]),
      [$3$ là số nguyên tố.],
      [Việt Nam thuộc Châu Á.],
    ),
    loigiai: [- Câu cảm thán/mệnh lệnh không có tính đúng sai nên không phải là mệnh đề.],
  )

  #tn(
    [Mệnh đề phủ định của mệnh đề "Mọi học sinh trong lớp đều thích học Toán" là],
    (
      [Không có học sinh nào trong lớp thích học Toán.],
      True([Có ít nhất một học sinh trong lớp không thích học Toán.]),
      [Mọi học sinh trong lớp đều không thích học Toán.],
      [Có ít nhất một học sinh trong lớp thích học Toán.],
    ),
    loigiai: [- Phủ định của "Mọi" là "Tồn tại ít nhất một" có tính chất ngược lại.],
  )

  #tn(
    [Mệnh đề nào sau đây đúng?],
    (
      [Nếu $a$ và $b$ là hai số chẵn thì $a + b$ là số lẻ.],
      [Nếu $a$ là số lẻ thì $a^2$ là số chẵn.],
      [Nếu $a$ chia hết cho $3$ thì $a$ chia hết cho $9$.],
      True([Nếu $a$ và $b$ là hai số lẻ thì $a + b$ là số chẵn.]),
    ),
    loigiai: [- Tổng của hai số lẻ là một số chẵn nên mệnh đề D đúng. Mệnh đề C sai (ví dụ $a=3$).],
  )

  #tn(
    [Liệt kê các phần tử của tập hợp $A = {x in ZZ | -2 < x <= 2}$.],
    (
      [$A = {-2, -1, 0, 1, 2}$],
      [$A = {0, 1, 2}$],
      True([$A = {-1, 0, 1, 2}$]),
      [$A = {-1, 1, 2}$],
    ),
    loigiai: [- Các số nguyên $x$ thỏa mãn là -1, 0, 1, 2.],
  )

  #tn(
    [Cho hai tập hợp $X = {1, 2, 3, 4, 5}$ và $Y = {2, 4, 6}$. Tìm tập hợp $X cap Y$.],
    (
      [$X cap Y = {1, 3, 5}$],
      [$X cap Y = {6}$],
      True([$X cap Y = {2, 4}$]),
      [$X cap Y = {1, 2, 3, 4, 5, 6}$],
    ),
    loigiai: [- Phần tử chung của $X$ và $Y$ là 2, 4.],
  )

  #tn(
    [Cho hai tập hợp $A = [-2; 5)$ và $B = [1; 7]$. Tìm tập hợp $A union B$.],
    (
      True([$[-2; 7]$]),
      [$(-2; 7]$],
      [$[-2; 7)$],
      [$[1; 5)$],
    ),
    loigiai: [- $A union B = [-2; 5) union [1; 7] = [-2; 7]$.],
  )

  #tn(
    [Cho tập $A = [-2; 6)$ và $B = [m; m+3]$. Điều kiện để $B subset A$ là],
    (
      [$-2 < m <= 3$],
      [$-2 <= m <= 3$],
      True([$-2 <= m < 3$]),
      [$-2 < m < 3$],
    ),
    loigiai: [- $B subset A <=> -2 <= m$ và $m+3 < 6 <=> -2 <= m < 3$.],
  )

  #tn(
    [Có bao nhiêu tập con của tập hợp $A = {a, b, c, d}$?],
    (
      [$8$],
      True([$16$]),
      [$12$],
      [$15$],
    ),
    loigiai: [- Số tập con là $2^4 = 16$.],
  )

  #tn(
    [Tập hợp $C_RR ((-4; 2])$ bằng],
    (
      True([$(-oo; -4] union (2; +oo)$]),
      [$(-oo; -4] union [2; +oo)$],
      [$(-oo; -4) union [2; +oo)$],
      [$(-oo; -4) union (2; +oo)$],
    ),
    loigiai: [- $RR setminus (-4; 2] = (-oo; -4] union (2; +oo)$.],
  )

  #tn(
    [Cho hai mệnh đề $P$: "$x = 2$" và $Q$: "$x^2 = 4$". Phát biểu nào dưới đây đúng?],
    (
      [$Q => P$],
      [$P <=> Q$],
      True([$P => Q$]),
      [$overline(P) => overline(Q)$],
    ),
    loigiai: [- Nếu $x=2$ thì chắc chắn $x^2=4$, nên $P => Q$ đúng. $Q => P$ sai vì $x^2=4 <=> x=2$ hoặc $x=-2$.],
  )

  #tn(
    [Trong các tập hợp sau, tập hợp nào là tập rỗng?],
    (
      True([$B = {x in RR | x^2 - x + 2 = 0}$]),
      [$C = {x in NN | x < 1}$],
      [$A = {x in ZZ | 2x^2 - x - 1 = 0}$],
      [$D = {x in QQ | x^2 - 4x + 3 = 0}$],
    ),
    loigiai: [- Phương trình $x^2-x+2=0$ vô nghiệm thực nên $B = emptyset$. $A = {1} != emptyset$.],
  )

  #tn(
    [Giao của hai nửa khoảng $(-oo; 3]$ và $(0; +oo)$ là],
    (
      [$(-oo; +oo)$],
      [$emptyset$],
      True([$(0; 3]$]),
      [$[0; 3]$],
    ),
    loigiai: [- $(-oo; 3] cap (0; +oo) = (0; 3]$.],
  )


  #exam-part(
    [PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4; trong mỗi ý a), b), c), d), thí sinh chọn đúng hoặc sai.],
    count: 4,
    reset-counter: true,
  )

  #ds(
    [Cho các mệnh đề về tính chất của tam giác trong hình học phẳng:],
    (
      True([Phủ định của mệnh đề "Tam giác có 3 góc nhọn" là "Tam giác có ít nhất một góc không nhọn".]),
      True([Nếu tam giác vuông thì bình phương một cạnh bằng tổng bình phương hai cạnh kia.]),
      True([Tam giác đều khi và chỉ khi có 3 góc bằng nhau.]),
      [Mệnh đề đảo "Nếu bình phương một cạnh bằng tổng bình phương hai cạnh kia thì tam giác đó là tam giác vuông" là mệnh đề sai.],
    ),
    loigiai: [
      - a, b, c đúng.
      - d sai vì định lý Pytago đảo là mệnh đề đúng.
    ],
  )

  #ds(
    [Cho hai tập hợp $A = {x in RR | x^2 - 5x + 6 = 0}$ và $B = {x in NN | x <= 4}$. Xét tính đúng sai của các khẳng định sau:],
    (
      [Tập hợp $B setminus A = {1, 4}$.],
      True([$A subset B$.]),
      True([$A = {2, 3}$.]),
      True([$B$ có $5$ phần tử.]),
    ),
    loigiai: [
      - $A = {2, 3}$, c đúng.
      - $B = {0, 1, 2, 3, 4}$ nên $B$ có 5 phần tử, d đúng.
      - $A subset B$, b đúng.
      - $B setminus A = {0, 1, 4}$, a sai (thiếu 0).
    ],
  )

  #ds(
    [Trong một đợt khảo sát sức khỏe, một nhóm gồm $50$ người. Có $30$ người bị ho, $20$ người bị sốt, và $10$ người bị cả ho lẫn sốt. Xét các khẳng định sau:],
    (
      True([Có $40$ người mắc ít nhất một trong hai triệu chứng trên.]),
      True([Số người chỉ bị ho là $20$.]),
      True([Có $10$ người không mắc triệu chứng nào trong hai triệu chứng trên.]),
      [Số người chỉ bị sốt là $15$.],
    ),
    loigiai: [
      - Mắc ít nhất 1: $30 + 20 - 10 = 40$, a đúng.
      - Không mắc: $50 - 40 = 10$, c đúng.
      - Chỉ ho: $30 - 10 = 20$, b đúng.
      - Chỉ sốt: $20 - 10 = 10$, d sai.
    ],
  )

  #ds(
    [Cho các khoảng $X = (-3; 5)$ và $Y = (m; m+3)$. Xét tính đúng sai của các khẳng định:],
    (
      [Với mọi $m$, $X union Y$ luôn là một khoảng.],
      True([Khi $m=0$, ta có $X cap Y = (0; 3)$.]),
      True([Có vô số giá trị nguyên của $m$ để $X cap Y = emptyset$.]),
      True([Để $Y subset X$, ta phải có $-3 <= m$ và $m <= 2$.]),
    ),
    loigiai: [
      - $m=0 => Y = (0; 3)$, $X cap Y = (0; 3)$, b đúng.
      - $Y subset X <=> -3 <= m$ và $m+3 <= 5 <=> -3 <= m <= 2$, d đúng.
      - $X cap Y = emptyset <=> m+3 <= -3$ hoặc $m >= 5 <=> m <= -6$ hoặc $m >= 5$, có vô số giá trị nguyên, c đúng.
      - $X union Y$ có thể là 2 khoảng rời nhau, a sai.
    ],
  )

  #exam-part(
    [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
    count: 6,
    reset-counter: true,
  )

  #tln(
    [Một lớp học có $40$ học sinh. Trong đó có $22$ học sinh học thêm Toán, $18$ học sinh học thêm Tiếng Anh, và $12$ học sinh học thêm cả hai môn. Hỏi có bao nhiêu học sinh trong lớp không học thêm môn nào trong hai môn Toán và Tiếng Anh?],
    [12],
    loigiai: [
      - Số học sinh học ít nhất 1 môn là $22 + 18 - 12 = 28$.
      - Số học sinh không học môn nào là $40 - 28 = 12$.
    ],
  )

  #tln(
    [Cho hai tập $A = (-2; 5]$ và $B = [m-2; m+4]$. Có bao nhiêu giá trị nguyên dương của tham số $m$ để $A cap B != emptyset$?],
    [7],
    loigiai: [
      - $A cap B = emptyset <=> m+4 <= -2$ hoặc $m-2 > 5 <=> m <= -6$ hoặc $m > 7$.
      - Vậy $A cap B != emptyset <=> -6 < m <= 7$.
      - Các giá trị nguyên dương của $m$ là 1, 2, ..., 7. Có 7 giá trị.
    ],
  )

  #tln(
    [Cho tập hợp $A = {1, 2, 3, 4, 5, 6, 7}$. Có bao nhiêu tập con của $A$ chứa cả hai phần tử 2 và 4?],
    [32],
    loigiai: [
      - Tập con chứa 2 và 4 được tạo ra bằng cách thêm các phần tử từ ${1, 3, 5, 6, 7}$.
      - Số tập con là $2^5 = 32$.
    ],
  )


  #tln(
    [Cho hai tập hợp $A = [m; m+2]$ và $B = [1; 4]$. Tính tổng các giá trị nguyên của tham số $m$ để tập hợp $A cup B$ là một đoạn có chiều dài bằng $5$.],
    [3],
    loigiai: [
      - Để $A cup B$ là một đoạn thì $A cap B != emptyset <=> m <= 4$ và $m+2 >= 1 <=> -1 <= m <= 4$.
      - Khi đó, $A cup B = [min(m, 1); max(m+2, 4)]$.
      - Chiều dài đoạn này bằng $5 <=> max(m+2, 4) - min(m, 1) = 5$.
      - Nếu $m in [-1; 1]$, ta có $4 - m = 5 <=> m = -1$ (nhận).
      - Nếu $m in (1; 2]$, ta có $4 - 1 = 3 != 5$ (loại).
      - Nếu $m in (2; 4]$, ta có $(m+2) - 1 = 5 <=> m = 4$ (nhận).
      - Vậy các giá trị nguyên $m$ thỏa mãn là $-1$ và $4$. Tổng của chúng bằng $3$.
    ],
  )

  #tln(
    [Trong một cuộc khảo sát 70 người về thói quen đọc 3 loại tạp chí A, B, C, kết quả thu được: 30 người đọc A, 35 người đọc B, 32 người đọc C; 12 người đọc cả A và C; 14 người đọc cả A và B; 10 người đọc cả B và C; 4 người đọc cả 3 loại. Hỏi có bao nhiêu người chỉ đọc đúng một loại tạp chí?],
    [37],
    loigiai: [
      - Chỉ đọc A và B (không C): $14 - 4 = 10$.
      - Chỉ đọc A và C (không B): $12 - 4 = 8$.
      - Chỉ đọc B và C (không A): $10 - 4 = 6$.
      - Chỉ đọc tạp chí A: $30 - (10 + 8 + 4) = 8$.
      - Chỉ đọc tạp chí B: $35 - (10 + 6 + 4) = 15$.
      - Chỉ đọc tạp chí C: $32 - (8 + 6 + 4) = 14$.
      - Số người chỉ đọc đúng 1 loại: $8 + 15 + 14 = 37$ người.
    ],
  )

  #tln(
    [Khảo sát 26 người chơi một tựa game nhập vai về việc chọn vai trò (Sát thủ, Đấu sĩ, Hỗ trợ). Mỗi người đều chọn ít nhất 1 vai trò và nhiều nhất 2 vai trò khác nhau. Kết quả cho thấy:
    - Số người chỉ chọn Sát thủ bằng tổng số người chỉ chọn Đấu sĩ và số người chỉ chọn Hỗ trợ cộng thêm 3 người.
    - Trong số những người không chọn Sát thủ, 4 lần số người có chọn Đấu sĩ bằng 3 lần số người có chọn Hỗ trợ.
    - Số người chọn Sát thủ và một vai trò khác ít hơn số người chỉ chọn Sát thủ là 2 người.
    Hỏi có bao nhiêu người chỉ chọn Đấu sĩ?],
    [2],
    loigiai: [
      - Gọi $x, y$ lần lượt là số người chỉ chọn Sát thủ và chỉ chọn Hỗ trợ. Suy ra số người chỉ chọn Đấu sĩ là $w = x - y - 3$.
      - Gọi $z$ là số người chọn cả Đấu sĩ và Hỗ trợ.
      - Số người chọn Sát thủ và 1 vai trò khác là $v = x - 2$.
      - Nhóm không chọn Sát thủ có 3 tập rời nhau: Chỉ Đấu sĩ ($w$), Chỉ Hỗ trợ ($y$), và Đấu sĩ + Hỗ trợ ($z$).
      - Dữ kiện thứ hai: $4(w + z) = 3(y + z) <=> 4(x - y - 3 + z) = 3y + 3z <=> 4x - 7y + z = 12 (*)$.
      - Tổng số người chơi: $x + y + w + z + v = 26 <=> x + y + (x - y - 3) + z + (x - 2) = 26 <=> 3x + z = 31 => z = 31 - 3x$.
      - Thay $z$ vào $(*)$, ta được: $4x - 7y + (31 - 3x) = 12 <=> x - 7y = -19 <=> x = 7y - 19$.
      - Tập xác định $w = x - y - 3 >= 0 => (7y - 19) - y - 3 >= 0 <=> 6y >= 22 => y >= 4$ (vì $y in ZZ$).
      - Tập xác định $z = 31 - 3x >= 0 => 3x <= 31 => x <= 10$.
      - Thử $y = 4 => x = 28 - 19 = 9$ (nhận). Suy ra $w = 9 - 4 - 3 = 2$ và $z = 31 - 27 = 4$.
      - Nếu $y >= 5 => x >= 35 - 19 = 16$ (loại vì $x <= 10$).
      - Vậy có $2$ người chỉ chọn Đấu sĩ.
    ],
  )
]
#make-questions()
#het
// -- QR ĐÁP ÁN OMR --
#import "de-on-kiem-tra-chuong-1-de-14-omr-key.typ": omr-key-qr
#align(center)[#omr-key-qr]
