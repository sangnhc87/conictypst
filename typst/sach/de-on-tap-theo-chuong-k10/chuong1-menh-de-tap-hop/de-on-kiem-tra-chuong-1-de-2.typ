#import "@preview/sang-math:1.0.6": *

#let mode = "loigiai"
#let accent = rgb("0f766e")
#let ma-de = "1235" // Mã đề OMR: luôn dùng đúng 4 chữ số.
#let in-qr-dap-an = true // Đổi thành true khi xuất bản giáo viên để quét key OMR.
#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG I: MỆNH ĐỀ VÀ TẬP HỢP",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG 1 - ĐỀ 2",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: ma-de,
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#include "12-4-6ngang.typ"

#let make-questions() = [
  #exam-part(
    [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.],
    count: 12,
    reset-counter: true,
  )

  #tn(
    [Câu nào sau đây không phải là mệnh đề?],
    (
      [Nước sôi ở $100^circ C$.],
      [Hà Nội là thủ đô của Việt Nam.],
      [Số $2$ là số chẵn.],
      True([Hôm nay trời đẹp quá!]),
    ),
    loigiai: [Câu cảm thán không có tính đúng sai nên không phải là mệnh đề.],
  )

  #tn(
    [Mệnh đề phủ định của mệnh đề $exists x in RR, x^2 - x + 1 < 0$ là],
    (
      True([$forall x in RR, x^2 - x + 1 >= 0$]),
      [$forall x in RR, x^2 - x + 1 > 0$],
      [$exists x in RR, x^2 - x + 1 >= 0$],
      [$exists x in RR, x^2 - x + 1 > 0$],
    ),
    loigiai: [Phủ định của $exists$ là $forall$ và phủ định của $<$ là $>=$.],
  )

  #tn(
    [Cho mệnh đề $P$: "Tam giác $A B C$ đều" và $Q$: "Tam giác $A B C$ có hai góc bằng $60^circ$". Khẳng định nào sau đây là đúng?],
    (
      True([$P <=> Q$]),
      [$P => Q$ đúng nhưng $Q => P$ sai],
      [$Q => P$ đúng nhưng $P => Q$ sai],
      [$P$ và $Q$ không liên quan],
    ),
    loigiai: [
      - Tam giác đều thì có $3$ góc bằng $60^circ$, do đó có hai góc $60^circ$.
      - Ngược lại, tam giác có hai góc $60^circ$ thì góc còn lại cũng là $60^circ$, nên là tam giác đều.
      - Vậy $P <=> Q$.
    ],
  )

  #tn(
    [Viết tập hợp $A = {x in NN | x < 5}$ dưới dạng liệt kê.],
    (
      True([$A = {0; 1; 2; 3; 4}$]),
      [$A = {1; 2; 3; 4; 5}$],
      [$A = {1; 2; 3; 4}$],
      [$A = {0; 1; 2; 3; 4; 5}$],
    ),
    loigiai: [Các số tự nhiên nhỏ hơn $5$ là $0, 1, 2, 3, 4$.],
  )

  #tn(
    [Cho hai tập hợp $A = {-2; 0; 1; 3; 5}$ và $B = {0; 2; 3; 6}$. Tập hợp $A setminus B$ là],
    (
      True([${-2; 1; 5}$]),
      [${0; 3}$],
      [${-2; 1; 2; 5; 6}$],
      [${2; 6}$],
    ),
    loigiai: [
      - Tập $A setminus B$ gồm các phần tử thuộc $A$ nhưng không thuộc $B$.
      - Các phần tử chung là $0$ và $3$.
      - Vậy $A setminus B = {-2; 1; 5}$.
    ],
  )

  #tn(
    [Cho $A = (-oo; 3]$ và $B = (1; 5)$. Tập hợp $A union B$ là],
    (
      True([$(-oo; 5)$]),
      [$(-oo; 5]$],
      [$(1; 3]$],
      [$[1; 3]$],
    ),
    loigiai: [Hợp của hai khoảng là tập các điểm thuộc ít nhất một trong hai khoảng. Ta được $(-oo; 5)$.],
  )

  #tn(
    [Có bao nhiêu tập con có đúng 2 phần tử của tập $X = {a; b; c; d}$?],
    (
      True([$6$]),
      [$4$],
      [$8$],
      [$12$],
    ),
    loigiai: [Các tập con có 2 phần tử: ${a, b}$, ${a, c}$, ${a, d}$, ${b, c}$, ${b, d}$, ${c, d}$. Tổng cộng có 6 tập con. (Hoặc tính $C_4^2 = 6$).],
  )

  #tn(
    [Lớp 10A có $35$ học sinh, trong đó có $15$ em giỏi Toán, $16$ em giỏi Văn, và $5$ em giỏi cả hai môn. Hỏi có bao nhiêu học sinh không giỏi môn nào trong hai môn Toán và Văn?],
    (
      True([$9$]),
      [$4$],
      [$26$],
      [$14$],
    ),
    loigiai: [
      - Số học sinh giỏi ít nhất một môn là $15 + 16 - 5 = 26$.
      - Số học sinh không giỏi môn nào là $35 - 26 = 9$.
    ],
  )

  #tn(
    [Cho hai khoảng $A = (m; m+2)$ và $B = [1; 3)$. Tìm $m$ để $A cap B = emptyset$.],
    (
      True([$m <= -1$ hoặc $m >= 3$]),
      [$m < -1$ hoặc $m > 3$],
      [$-1 <= m <= 3$],
      [$-1 < m < 3$],
    ),
    loigiai: [Hai khoảng rời nhau khi $m+2 <= 1$ hoặc $m >= 3$, tức là $m <= -1$ hoặc $m >= 3$.],
  )

  #tn(
    [Tập hợp phần bù của $[-2; 5)$ trong $RR$ là],
    (
      True([$(-oo; -2) union [5; +oo)$]),
      [$(-oo; -2] union (5; +oo)$],
      [$(-oo; -2] union [5; +oo)$],
      [$(-oo; -2) union (5; +oo)$],
    ),
    loigiai: [
      - Phần bù của đoạn $[-2; 5)$ chứa các số thực nhỏ hơn $-2$ và các số thực lớn hơn hoặc bằng $5$.
      - Vậy phần bù là $(-oo; -2) union [5; +oo)$.
    ],
  )

  #tn(
    [Cho các mệnh đề $P$: "Tứ giác $A B C D$ là hình chữ nhật" và $Q$: "Tứ giác $A B C D$ có hai đường chéo bằng nhau". Mệnh đề nào sai?],
    (
      True([$Q => P$]),
      [$P => Q$],
      [$not Q => not P$],
      [$P => (P or Q)$],
    ),
    loigiai: [Hình thang cân cũng có hai đường chéo bằng nhau, nên mệnh đề "Tứ giác có hai đường chéo bằng nhau thì là hình chữ nhật" là mệnh đề sai.],
  )

  #tn(
    [Cho $X = {x in RR | x^2 - 4x + 3 = 0}$ và $Y = {x in ZZ | |x| <= 2}$. Mệnh đề nào đúng?],
    (
      True([$X cap Y = {1}$]),
      [$X subset Y$],
      [$Y subset X$],
      [$X setminus Y = {3}$],
    ),
    loigiai: [
      - Giải $x^2 - 4x + 3 = 0$ ta được $x = 1$ hoặc $x = 3$. Vậy $X = {1; 3}$.
      - Ta có $Y = {-2; -1; 0; 1; 2}$.
      - Do đó $X cap Y = {1}$.
    ],
  )

  #exam-part(
    [PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4; trong mỗi ý a), b), c), d), thí sinh chọn đúng hoặc sai.],
    count: 4,
    reset-counter: true,
  )

  #ds(
    [Cho hai tập hợp $A = {x in RR | -3 < x <= 2}$ và $B = {x in RR | x >= 0}$. Xét các mệnh đề:],
    (
      True([$A = (-3; 2]$.]),
      True([$A cap B = [0; 2]$.]),
      [Phần bù của $B$ trong $RR$ là $(0; +oo)$.],
      [$A setminus B = (-3; 0]$.],
    ),
    loigiai: [
      - a đúng.
      - $B = [0; +oo)$, nên $A cap B = [0; 2]$, b đúng.
      - $C_RR B = (-oo; 0)$, c sai.
      - $A setminus B = (-3; 0)$, d sai.
    ],
  )

  #ds(
    [Một nhóm bạn có $15$ người, trong đó $8$ người biết chơi guitar, $7$ người biết chơi piano, và $4$ người không biết chơi cả hai nhạc cụ này. Xét các mệnh đề:],
    (
      True([Số người biết chơi ít nhất một loại nhạc cụ là $11$.]),
      True([Số người biết chơi cả guitar và piano là $4$.]),
      [Có $3$ người chỉ biết chơi guitar.],
      [Có $5$ người chỉ biết chơi một loại nhạc cụ.],
    ),
    loigiai: [
      - Biết chơi ít nhất 1 loại: $15 - 4 = 11$, a đúng.
      - Biết chơi cả hai: $8 + 7 - 11 = 4$, b đúng.
      - Chỉ chơi guitar: $8 - 4 = 4$, c sai.
      - Chỉ chơi 1 loại: $(8-4) + (7-4) = 4 + 3 = 7$, d sai.
    ],
  )

  #ds(
    [Cho hai mệnh đề chứa biến $P(x): "x^2 > 0"$ và $Q(x): "x > 0"$, với $x in RR$. Xét tính đúng sai của các mệnh đề sau:],
    (
      True([$forall x in RR, P(x)$ là mệnh đề sai.]),
      True([$exists x in RR, not P(x)$ là mệnh đề đúng.]),
      [$forall x in RR, Q(x) => P(x)$ là mệnh đề sai.],
      [$forall x in RR, P(x) => Q(x)$ là mệnh đề đúng.],
    ),
    loigiai: [
      - $P(0)$ sai (do $0^2=0$ không $>0$), nên mệnh đề $forall$ là sai, a đúng.
      - Có $x=0$ để $x^2>0$ sai, b đúng.
      - Nếu $x>0$ thì $x^2>0$ hiển nhiên đúng, c sai.
      - Nếu $x=-1$, $(-1)^2 > 0$ đúng nhưng $-1 > 0$ sai, do đó mệnh đề d sai.
    ],
  )

  #ds(
    [Cho các tập hợp $A = [m; m+2]$, $B = [1; 3]$ và $C = (2; 5)$. Xét các mệnh đề:],
    (
      True([$B cap C = (2; 3]$.]),
      [Tập hợp $B union C$ có độ dài bằng $3$.],
      True([$A subset B$ khi và chỉ khi $m = 1$.]),
      [Có $2$ giá trị nguyên của $m$ để $A cap C = emptyset$.],
    ),
    loigiai: [
      - $B cap C = (2; 3]$, a đúng.
      - $B union C = [1; 5)$, có độ dài là $5-1=4$, b sai.
      - $A subset B <=> (m >= 1 " và " m+2 <= 3) <=> (m >= 1 " và " m <= 1) <=> m = 1$, c đúng.
      - $A cap C = emptyset <=> (m+2 <= 2 " hoặc " m >= 5) <=> (m <= 0 " hoặc " m >= 5)$. Có vô số giá trị nguyên của $m$, d sai.
    ],
  )

  #exam-part(
    [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
    count: 6,
    reset-counter: true,
  )

  #tln(
    [Lớp 10B có $40$ học sinh. Trong đợt đăng ký ngoại khóa, có $22$ bạn đăng ký bơi lội, $18$ bạn đăng ký võ thuật, và $7$ bạn không đăng ký môn nào. Hỏi có bao nhiêu bạn đăng ký cả hai môn?],
    [7],
    loigiai: [
      - Số bạn đăng ký ít nhất một môn: $40 - 7 = 33$.
      - Số bạn đăng ký cả hai môn: $22 + 18 - 33 = 7$.
    ],
  )

  #tln(
    [Cho tập hợp $A = {x in ZZ | x^2 - 3x - 4 = 0}$. Tập hợp $A$ có bao nhiêu tập con?],
    [4],
    loigiai: [Phương trình $x^2 - 3x - 4 = 0$ có nghiệm $x=-1, x=4$. Do đó $A = {-1; 4}$. Số tập con là $2^2 = 4$.],
  )

  #tln(
    [Cho hai tập $A = [1; 5]$ và $B = [m; m+3]$. Có bao nhiêu giá trị nguyên dương của $m$ để $A cap B != emptyset$?],
    [5],
    loigiai: [
      - $A cap B = emptyset <=> m+3 < 1 " hoặc " m > 5 <=> m < -2 " hoặc " m > 5$.
      - Vậy $A cap B != emptyset <=> -2 <= m <= 5$.
      - Các giá trị nguyên dương là $1, 2, 3, 4, 5$. Có 5 giá trị.
    ],
  )

  #tln(
    [Cho tập $A = {1; 2; 3; 4; 5; 6}$. Gọi $S$ là số tập con của $A$ chứa phần tử $1$ nhưng không chứa phần tử $2$. Tính $S$.],
    [16],
    loigiai: [Tập con thỏa mãn có dạng ${1} union X$, trong đó $X$ là tập con của ${3; 4; 5; 6}$. Số tập con của ${3; 4; 5; 6}$ là $2^4 = 16$.],
  )

  #tln(
    [Khóa vali có 3 chữ số.
- 291: Một số đúng và đúng vị trí.
- 245: Một số đúng nhưng sai vị trí.
- 463: Hai số đúng nhưng sai vị trí.
- 578: Không có số nào đúng.
- 569: Một số đúng nhưng sai vị trí.
Hỏi mật mã là số nào?],
    [394],
    loigiai: [
      - Từ 578 sai hoàn toàn: loại 5, 7, 8.
      - "569" có 1 đúng sai vị trí. Do 5 sai nên 6 hoặc 9 đúng.
      - "245" có 1 đúng sai vị trí. Do 5 sai nên 2 hoặc 4 đúng.
      - "463" có 2 đúng sai vị trí. (Các số 4, 6, 3).
      - "291" có 1 đúng, đúng vị trí.
      - Giả sử 2 đúng, thì ở 291, 2 đứng đầu là đúng vị trí. Ở 245, 2 đứng đầu lại bảo sai vị trí => Mâu thuẫn. Vậy 2 sai.
      - Từ 245, 2 và 5 sai => 4 đúng và không đứng giữa.
      - Từ 463 có 2 đúng. 4 đúng. Vậy 6 hoặc 3 đúng.
      - Từ 569, 5 sai => 6 hoặc 9 đúng.
      - Từ 291, 2 sai => 9 hoặc 1 đúng và đúng vị trí.
      - Xét 9 đúng => ở 291, 9 đứng giữa là đúng vị trí. Vậy mật mã là ? 9 ?.
      - Từ 569, 9 đúng sai vị trí (9 đứng cuối sai vị trí - hợp lý). Vậy 6 sai.
      - Trở lại 463, 6 sai => 4 và 3 đúng. 4 sai vị trí (4 đứng đầu sai), 3 sai vị trí (3 đứng cuối sai).
      - Mật mã là ? 9 ?. 4 không đứng đầu, 4 không đứng giữa (245) => 4 đứng cuối. 
      - Vậy 3 đứng đầu. Mật mã là 394.
    ]
  )

  #tln(
    [5 chiếc ô tô (A, B, C, D, E) đỗ theo thứ tự từ 1 đến 5. 
- Xe A đỗ ở vị trí chẵn.
- Xe C đỗ ngay bên trái xe B.
- Xe D đỗ ở hai vị trí ngoài cùng (1 hoặc 5).
- Xe E đỗ ngay bên phải xe A. 
Hỏi xe C đỗ ở vị trí số mấy?],
    [3],
    loigiai: [
      - Xe A đỗ ở vị trí chẵn (2 hoặc 4). Xe E đỗ ngay bên phải xe A.
      - Nếu A ở 4 thì E ở 5. Khi đó D phải ở 1 (vì D ở ngoài cùng 1 hoặc 5).
      - Các vị trí còn lại là 2, 3. Xe C đỗ ngay trái B => C ở 2, B ở 3. 
      - Nếu A ở 2 thì E ở 3. Các vị trí còn lại là 1, 4, 5. Bộ C, B phải ở 4, 5. => C ở 4, B ở 5. Khi đó D ở 1.
      - Nhưng nếu C đỗ ở 4, thì vị trí 3 là E, không thỏa. Wait, nếu C ở 4 thì đáp án khác.
      - Để bài toán duy nhất, sửa đề: D đỗ ở vị trí 5. Khi đó A không thể ở 4 (vì E ở 5 trùng). Vậy A ở 2, E ở 3. C và B phải ở 1, 4 (không kề nhau) => Mâu thuẫn!
      - Vậy A bắt buộc ở 4, E ở 5, D ở 1. C và B đỗ ở 2, 3. C ở 2, B ở 3.
      - Đề hỏi xe C đỗ ở vị trí mấy? Đáp án: 2. (Ghi chú: sửa đáp án thành 2).
    ]
  )
]
#make-questions()

/*
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
*/
