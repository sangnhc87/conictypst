#import "@preview/sang-math:1.0.6": *

#let mode = "dethi"
#let accent = rgb("0f766e")
#let ma-de = "2468" // Mã đề OMR: luôn dùng đúng 4 chữ số.
#let in-qr-dap-an = true // Đổi thành true khi xuất bản giáo viên để quét key OMR.
#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG I: MỆNH ĐỀ VÀ TẬP HỢP",
  exam-title: "ĐỀ KIỂM TRA CHƯƠNG 1 - ĐỀ B",
  subject: "TOÁN - 10A8",
  duration: "40 phút, không kể thời gian phát đề",
  structure: auto, 
  code: ma-de,
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#include "12-4-6ngang.typ"
#pagebreak()
#let make-questions() = [
  #exam-part(
    [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.],
    count: 12,
    reset-counter: true,
  )

  #tn(
    [Phát biểu nào sau đây không phải là mệnh đề?],
    (
      True([Hôm nay học môn gì vậy?]),
      [Số $2024$ chia hết cho $2$.],
      [$3 > 5$],
      [Hà Nội là thủ đô của Việt Nam.],
    ),
    loigiai: [- Câu hỏi không có tính đúng sai nên không phải là mệnh đề.],
  )

  #tn(
    [Mệnh đề phủ định của mệnh đề "Mọi số thực bình phương đều không âm" là],
    (
      True([Có một số thực bình phương âm.]),
      [Không có số thực nào bình phương âm.],
      [Có một số thực bình phương không dương.],
      [Mọi số thực bình phương đều âm.],
    ),
    loigiai: [- Phủ định của "Mọi số $x, x^2 >= 0$" là "Tồn tại số $x, x^2 < 0$" tức là có số thực bình phương âm.],
  )

  #tn(
    [Mệnh đề nào sau đây đúng?],
    (
      [Nếu $a + b = 0$ thì $a = 0$ và $b = 0$.],
      True([Nếu $a > 0, b > 0$ thì $a + b > 0$.]),
      [Nếu $a > 0, b < 0$ thì $a + b > 0$.],
      [Nếu $a + b > 0$ thì $a > 0$ và $b > 0$.],
    ),
    loigiai: [- Tổng của hai số dương là một số dương nên mệnh đề A đúng. 
      - Mệnh đề B sai, ví dụ $a=1, b=-2$.
      - Mệnh đề C sai, ví dụ $a=3, b=-1$.
      - Mệnh đề D sai, ví dụ $a=1, b=-1$.],
  )

  #tn(
    [Liệt kê các phần tử của tập hợp $A = {x in ZZ | -1 <= x < 3}$.],
    (
      [$A = {-1, 0, 1, 2, 3}$],
      [$A = {0, 1, 2}$],
      [$A = {-1, 1, 2}$],
      True([$A = {-1, 0, 1, 2}$]),
    ),
    loigiai: [- Các số nguyên $x$ thỏa mãn là -1, 0, 1, 2.],
  )

  #tn(
    [Cho hai tập hợp $X = {a, b, c, d}$ và $Y = {c, d, e, f}$. Tìm tập hợp $X cap Y$.],
    (
      [$X cap Y = {a, b, e, f}$],
      [$X cap Y = {e, f}$],
      True([$X cap Y = {c, d}$]),
      [$X cap Y = {a, b, c, d, e, f}$],
    ),
    loigiai: [- Phần tử chung của $X$ và $Y$ là $c, d$.],
  )

  #tn(
    [Cho hai tập hợp $A = [-3; 6]$ và $B = (2; 8)$. Tìm tập hợp $A union B$.],
    (
      [$(-3; 8)$],
      [$(2; 6]$],
      True([$[-3; 8)$]),
      [$[-3; 8]$],
    ),
    loigiai: [- $A union B = [-3; 6] union (2; 8) = [-3; 8)$.],
  )

  #tn(
    [Cho tập $A = (-1; 5]$ và $B = (m; m+2)$. Điều kiện để $B subset A$ là],
    (
      [$-1 < m <= 3$],
      [$-1 <= m < 3$],
      True([$-1 <= m <= 3$]),
      [$-1 < m < 3$],
    ),
    loigiai: [- $B subset A <=> -1 <= m$ và $m+2 <= 5 <=> -1 <= m <= 3$.],
  )

  #tn(
    [Có bao nhiêu tập con của tập hợp $A = {1, 2, 3}$?],
    (
      True([$8$]),
      [$7$],
      [$9$],
      [$6$],
    ),
    loigiai: [- Số tập con là $2^3 = 8$.],
  )

  #tn(
    [Tập hợp $C_RR ([-2; 3))$ bằng],
    (
      [$(-oo; -2] union [3; +oo)$],
      [$(-oo; -2] union (3; +oo)$],
      True([$(-oo; -2) union [3; +oo)$]),
      [$(-oo; -2) union (3; +oo)$],
    ),
    loigiai: [- $RR setminus [-2; 3) = (-oo; -2) union [3; +oo)$.],
  )

  #tn(
    [Cho hai mệnh đề $P$: "$x > 3$" và $Q$: "$x^2 > 9$". Phát biểu nào dưới đây đúng?],
    (
      True([$P => Q$]),
      [$Q => P$],
      [$P <=> Q$],
      [$overline(P) => overline(Q)$],
    ),
    loigiai: [- Nếu $x>3$ thì chắc chắn $x^2>9$, nên $P => Q$ đúng. $Q => P$ sai vì $x^2>9 <=> x>3$ hoặc $x<-3$.],
  )

  #tn(
    [Trong các tập hợp sau, tập hợp nào là tập rỗng?],
    (
      [$B = {x in ZZ | x^2 = 4}$],
      [$C = {x in NN | x < 1}$],
      True([$A = {x in RR | x^2 + x + 1 = 0}$]),
      [$D = {x in QQ | x^2 - 4x + 3 = 0}$],
    ),
    loigiai: [- Phương trình $x^2+x+1=0$ vô nghiệm thực nên $A = emptyset$. $C = {0} != emptyset$.],
  )

  #tn(
    [Giao của hai khoảng $(-oo; 5)$ và $(2; +oo)$ là],
    (
      [$(-oo; +oo)$],
      [$emptyset$],
      True([$(2; 5)$]),
      [$[2; 5]$],
    ),
    loigiai: [- $(-oo; 5) cap (2; +oo) = (2; 5)$.],
  )


  #exam-part(
    [PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4; trong mỗi ý a), b), c), d), thí sinh chọn đúng hoặc sai.],
    count: 4,
    reset-counter: true,
  )

  #ds(
    [Cho các mệnh đề về phương trình bậc hai $a x^2 + b x + c = 0$ ($a != 0$):],
    (
      [Phủ định của mệnh đề "Phương trình vô nghiệm" là "Phương trình có 2 nghiệm phân biệt".],
      True([Nếu $Delta > 0$ thì phương trình có 2 nghiệm phân biệt.]),
      [Phương trình có nghiệm kép khi và chỉ khi $Delta < 0$.],
      True([Mệnh đề đảo của mệnh đề "Nếu $Delta > 0$ thì phương trình có 2 nghiệm phân biệt" cũng đúng.]),
    ),
    loigiai: [
      - a sai, vì phủ định của "Phương trình vô nghiệm" là "Phương trình có nghiệm" (có thể có 1 hoặc 2 nghiệm).
      - b đúng.
      - c sai, vì phương trình có nghiệm kép khi và chỉ khi $Delta = 0$.
      - d đúng, vì mệnh đề đảo là "Nếu phương trình có 2 nghiệm phân biệt thì $Delta > 0$" là mệnh đề đúng.
    ],
  )

  #ds(
    [Cho hai tập hợp $A = {x in RR | x^2 - 3x + 2 = 0}$ và $B = {x in NN | x <= 3}$. Xét tính đúng sai của các khẳng định sau:],
    (
      [Tập hợp $B setminus A = {3}$.],
      True([$A subset B$.]),
      True([$A = {1, 2}$.]),
      True([$B$ có $4$ phần tử.]),
    ),
    loigiai: [
      - a sai, vì $A = {1, 2}$ và $B = {0, 1, 2, 3}$, do đó $B setminus A = {0, 3}$.
      - b đúng, vì mọi phần tử của $A$ đều thuộc $B$.
      - c đúng, giải phương trình ta được $A = {1, 2}$.
      - d đúng, vì $B = {0, 1, 2, 3}$ có 4 phần tử.
    ],
  )

  #ds(
    [Trong một đợt kiểm tra sức khỏe, một nhóm gồm $60$ người. Có $40$ người bị sâu răng, $25$ người bị cận thị, và $15$ người bị cả sâu răng lẫn cận thị. Xét các khẳng định sau:],
    (
      True([Có $50$ người mắc ít nhất một trong hai bệnh trên.]),
      True([Số người chỉ bị sâu răng là $25$.]),
      True([Có $10$ người không mắc bệnh nào trong hai bệnh trên.]),
      [Có $15$ người không mắc bệnh nào trong hai bệnh trên.],
    ),
    loigiai: [
      - a đúng. Số người mắc ít nhất một trong hai bệnh là $40 + 25 - 15 = 50$.
      - b đúng. Số người chỉ bị sâu răng là $40 - 15 = 25$.
      - c đúng. Số người không mắc bệnh nào là $60 - 50 = 10$.
      - d sai. Vì có 10 người không mắc bệnh nào (không phải 15).
    ],
  )

  #ds(
    [Cho các khoảng $X = (-2; 4)$ và $Y = (m; m+2)$. Xét tính đúng sai của các khẳng định:],
    (
      [Với mọi $m$, $X union Y$ luôn là một khoảng.],
      True([Khi $m=1$, ta có $X cap Y = (1; 3)$.]),
      True([Có vô số giá trị nguyên của $m$ để $X cap Y = emptyset$.]),
      True([Để $Y subset X$, ta phải có $-2 <= m$ và $m <= 2$.]),
    ),
    loigiai: [
      - a sai, vì $X union Y$ không phải luôn là một khoảng (nó có thể là hợp của 2 khoảng rời nhau khi $m > 4$).
      - b đúng, khi $m=1$ thì $Y = (1; 3)$, suy ra $X cap Y = (-2; 4) cap (1; 3) = (1; 3)$.
      - c đúng, $X cap Y = emptyset <=> m+2 <= -2$ hoặc $m >= 4 <=> m <= -4$ hoặc $m >= 4$, do đó có vô số giá trị nguyên của $m$.
      - d đúng, $Y subset X <=> -2 <= m$ và $m+2 <= 4 <=> -2 <= m <= 2$.
    ],
  )

  #exam-part(
    [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
    count: 6,
    reset-counter: true,
  )


  #tln(
    [Một lớp học có $42$ học sinh. Trong đó có $20$ học sinh học thêm Toán, $16$ học sinh học thêm Tiếng Anh, và $10$ học sinh học thêm cả hai môn. Hỏi có bao nhiêu học sinh trong lớp không học thêm môn nào trong hai môn Toán và Tiếng Anh?],
    [16],
    loigiai: [
      - Số học sinh học ít nhất 1 môn là $20 + 16 - 10 = 26$.
      - Số học sinh không học môn nào là $42 - 26 = 16$.
    ],
  )

  #tln(
    [Cho hai tập $A = (-3; 4]$ và $B = [m-1; m+3]$. Có bao nhiêu giá trị nguyên dương của $m$ để $A cap B != emptyset$?],
    [5],
    loigiai: [
      - $A cap B = emptyset <=> m+3 <= -3$ hoặc $m-1 > 4 <=> m <= -6$ hoặc $m > 5$.
      - Vậy $A cap B != emptyset <=> -6 < m <= 5$.
      - Các giá trị nguyên dương của $m$ là 1, 2, 3, 4, 5. Có 5 giá trị.
    ],
  )

  #tln(
    [Cho tập hợp $A = {1, 2, 3, 4, 5, 6, 7}$. Có bao nhiêu tập con của $A$ chứa cả ba phần tử 1, 3, 5?],
    [16],
    loigiai: [
      - Tập con chứa 1, 3, 5 được tạo ra bằng cách thêm các phần tử từ ${2, 4, 6, 7}$.
      - Số tập con là $2^4 = 16$.
    ],
  )


  #tln(
    [Trong một đội thanh niên tình nguyện có $120$ người, $70$ người biết nói tiếng Anh, $45$ người biết nói tiếng Pháp và $25$ người không biết nói tiếng Anh cũng không biết nói tiếng Pháp. Hỏi có bao nhiêu người biết nói cả tiếng Anh và tiếng Pháp?],
    [20],
    loigiai: [
      - Số người biết ít nhất 1 ngoại ngữ: $120 - 25 = 95$.
      - Số người biết cả hai: $70 + 45 - 95 = 20$.
    ],
  )

  #tln(
    [Trong một cuộc khảo sát 60 người về thói quen đọc 3 loại tạp chí A, B, C, kết quả thu được: 25 người đọc A, 26 người đọc B, 26 người đọc C; 9 người đọc cả A và C; 11 người đọc cả A và B; 8 người đọc cả B và C; 3 người đọc cả 3 loại. Hỏi có bao nhiêu người chỉ đọc đúng một loại tạp chí?],
    [30],
    loigiai: [
      - Số người đọc ít nhất 1 loại tạp chí: $|A union B union C| = 25 + 26 + 26 - 11 - 9 - 8 + 3 = 52$.
      - Số người chỉ đọc A và B (không C): $11 - 3 = 8$.
      - Số người chỉ đọc A và C (không B): $9 - 3 = 6$.
      - Số người chỉ đọc B và C (không A): $8 - 3 = 5$.
      - Số người chỉ đọc tạp chí A: $25 - (8 + 6 + 3) = 8$.
      - Số người chỉ đọc tạp chí B: $26 - (8 + 5 + 3) = 10$.
      - Số người chỉ đọc tạp chí C: $26 - (6 + 5 + 3) = 12$.
      - Số người chỉ đọc đúng 1 loại: $8 + 10 + 12 = 30$ người.
    ],
  )

  #tln(
    [Khảo sát 37 sinh viên về việc học ngoại ngữ (Anh, Pháp, Trung). Biết mỗi sinh viên học nhiều nhất 2 ngôn ngữ. 
    - Số sinh viên chỉ học tiếng Anh bằng tổng số sinh viên chỉ học tiếng Pháp và số sinh viên chỉ học tiếng Trung.
    - Trong số sinh viên không học tiếng Anh, số sinh viên có học tiếng Pháp gấp hai lần số sinh viên có học tiếng Trung.
    - Số sinh viên học tiếng Anh và một ngôn ngữ khác bằng đúng số sinh viên chỉ học tiếng Anh.
    Hỏi có bao nhiêu sinh viên chỉ học tiếng Pháp?],
    [9],
    loigiai: [
      - Gọi $x$ là số sinh viên chỉ học tiếng Anh. Suy ra số sinh viên học tiếng Anh + 1 ngôn ngữ là $x$.
      - Gọi $y$ là số sinh viên chỉ học tiếng Trung. Do (Chỉ Anh) = (Chỉ Pháp) + (Chỉ Trung) nên số sinh viên chỉ học tiếng Pháp là $x - y$.
      - Số sinh viên học cả Pháp và Trung (không Anh) gọi là $z$.
      - Trong nhóm không học Anh: Số người có học Pháp là $(x - y) + z$, số người có học Trung là $y + z$.
      - Theo giả thiết: $(x - y) + z = 2(y + z) => z = x - 3y$.
      - Tổng số sinh viên: $x + x + (x - y) + y + z = 37 => 3x + z = 37$.
      - Thay $z = x - 3y => 4x - 3y = 37$. Với $y = 1$, ta có $4x = 40 => x = 10, z = 7$.
      - Yêu cầu tìm số sinh viên chỉ học tiếng Pháp là $x - y = 10 - 1 = 9$.
    ],
  )
]
#make-questions()

#if in-qr-dap-an [
  #pagebreak()
  #align(center)[
    #text(weight: "bold", size: 15pt, fill: accent)[QR ĐÁP ÁN OMR - BẢN GIÁO VIÊN]
    #v(0.5em)
    #text(size: 10pt)[Mã đề #ma-de. Mở Sang Math OMR, chọn “Quét QR trực tiếp” để nạp key và chấm bài.]
    #v(1em)
    #sang-omr-qr(
      ma-de: ma-de, 
      show-info: true, 
      pts: (mcq: 0.25, tf: 0.1, tf-full: 0.5, sh: 0.5)
    )
  ]
]

#print-answer-key()

// -- QR ĐÁP ÁN OMR --
#import "de-on-kiem-tra-chuong-1-de-12-omr-key.typ": omr-key-qr
#align(center)[#omr-key-qr]
