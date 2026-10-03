#import "@preview/sang-math:1.0.6": *

#let mode = "dethi"
#let accent = rgb("0f766e")
#let ma-de = "1357" // Mã đề OMR: luôn dùng đúng 4 chữ số.
#let in-qr-dap-an = true // Đổi thành true khi xuất bản giáo viên để quét key OMR.
#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG I: MỆNH ĐỀ VÀ TẬP HỢP",
  exam-title: "ĐỀ KIỂM TRA CHƯƠNG 1 - ĐỀ A",
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
    [Câu nào sau đây là một mệnh đề toán học?],
    (
      [$x + 5 = 10$],
      [Hôm nay trời đẹp quá!],
      [Hãy làm bài tập đi!],
      True([Tổng các góc trong một tam giác bằng $180^circ$.]),
    ),
    loigiai: [- "Tổng các góc trong một tam giác bằng $180^circ$" là khẳng định đúng, nên là mệnh đề toán học.],
  )

  #tn(
    [Mệnh đề phủ định của mệnh đề $P$: " $exists x in RR, x^2 - x + 1 = 0$ " là],
    (
      [$overline(P)$: " $forall x in RR, x^2 - x + 1 = 0$ "],
      [$overline(P)$: " $forall x in RR, x^2 - x + 1 > 0$ "],
      True([$overline(P)$: " $forall x in RR, x^2 - x + 1 != 0$ "]),
      [$overline(P)$: " $exists x in RR, x^2 - x + 1 != 0$ "],
    ),
    loigiai: [- Phủ định của $exists$ là $forall$, phủ định của $=$ là $!=$.],
  )

  #tn(
    [Cho hai mệnh đề $P$: "Tam giác $A B C$ đều" và $Q$: "Tam giác $A B C$ có hai góc bằng $60^circ$". Phát biểu nào sau đây đúng?],
    (
      [$P => overline(Q)$],
      [Không có mối liên hệ nào.],
      [$Q => overline(P)$],
      True([$P <=> Q$]),
    ),
    loigiai: [- Tam giác đều thì có hai góc $60^circ$ và ngược lại, do đó hai mệnh đề tương đương.],
  )

  #tn(
    [Cho tập hợp $X = {x in NN | x < 5}$. Viết tập hợp $X$ dưới dạng liệt kê.],
    (
      [$X = {1, 2, 3, 4, 5}$],
      [$X = {1, 2, 3, 4}$],
      True([$X = {0, 1, 2, 3, 4}$]),
      [$X = {0, 1, 2, 3, 4, 5}$],
    ),
    loigiai: [- Các số tự nhiên nhỏ hơn 5 là 0, 1, 2, 3, 4.],
  )

  #tn(
    [Cho hai tập hợp $A = {1, 3, 5, 7, 9}$ và $B = {3, 4, 5, 6, 7}$. Tìm tập hợp $A union B$.],
    (
      [$A union B = {3, 5, 7}$],
      [$A union B = {1, 9}$],
      [$A union B = {4, 6}$],
      True([$A union B = {1, 3, 4, 5, 6, 7, 9}$]),
    ),
    loigiai: [- $A union B$ gồm các phần tử thuộc $A$ hoặc $B$.],
  )

  #tn(
    [Một lớp học có $45$ học sinh. Trong đó có $28$ bạn thích môn Toán, $20$ bạn thích môn Văn và $12$ bạn thích cả hai môn. Số học sinh không thích môn nào trong hai môn trên là],
    (
      [$8$],
      [$12$],
      [$10$],
      True([$9$]),
    ),
    loigiai: [- Số học sinh thích ít nhất một môn là $28 + 20 - 12 = 36$.
      - Số học sinh không thích môn nào là $45 - 36 = 9$.],
  )

  #tn(
    [Phần bù của đoạn $[-2; 5)$ trong $RR$ là],
    (
      [$(-oo; -2] union [5; +oo)$],
      [$(-oo; -2] union (5; +oo)$],
      True([$(-oo; -2) union [5; +oo)$]),
      [$(-oo; -2) union (5; +oo)$],
    ),
    loigiai: [- $C_RR [-2; 5) = RR setminus [-2; 5) = (-oo; -2) union [5; +oo)$.],
  )

  #tn(
    [Cho tập $A = (-3; 4]$ và $B = [1; 7)$. Tập hợp $A cap B$ là],
    (
      [$(-3; 7)$],
      [$(4; 7)$],
      True([$[1; 4]$]),
      [$(-3; 1)$],
    ),
    loigiai: [- $A cap B$ là tập các phần tử vừa thuộc $A$ vừa thuộc $B$, ta có $[-3; 4] cap [1; 7) = [1; 4]$.],
  )

  #tn(
    [Số phần tử của tập hợp $M = {x in ZZ | -3 < x <= 4}$ là],
    (
      True([$7$]),
      [$8$],
      [$6$],
      [$5$],
    ),
    loigiai: [- $M = {-2, -1, 0, 1, 2, 3, 4}$ nên có 7 phần tử.],
  )

  #tn(
    [Cho hai tập hợp $E = (-oo; m)$ và $F = [3m - 4; +oo)$. Điều kiện của $m$ để $E cap F = emptyset$ là],
    (
      [$m < 2$],
      [$m > 2$],
      [$m <= 2$],
      True([$m >= 2$]),
    ),
    loigiai: [- Để $E cap F = emptyset$, ta phải có $m <= 3m - 4 <=> 2m >= 4 <=> m >= 2$.],
  )

  #tn(
    [Một tập hợp có $6$ phần tử. Số tập con có đúng $2$ phần tử của tập hợp đó là],
    (
      [$20$],
      [$12$],
      [$30$],
      True([$15$]),
    ),
    loigiai: [- Số tập con có 2 phần tử từ tập 6 phần tử là tổ hợp chập 2 của 6: $C_6^2 = (6 times 5) / 2 = 15$.],
  )

  #tn(
    [Cho tập $A = {x in RR | x^2 - 4 = 0}$ và $B = {x in RR | 2x - 4 = 0}$. Khẳng định nào sau đây đúng?],
    (
      [$A cap B = emptyset$],
      [$A subset B$],
      [$A = B$],
      True([$B subset A$]),
    ),
    loigiai: [- $A = {-2; 2}$, $B = {2}$, do đó $B subset A$.],
  )

  #exam-part(
    [PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4; trong mỗi ý a), b), c), d), thí sinh chọn đúng hoặc sai.],
    count: 4,
    reset-counter: true,
  )

  #ds(
    [Cho các mệnh đề về tính chia hết của số nguyên $n$ (với $n in ZZ$):],
    (
      True([Nếu $n^2$ là một số lẻ thì $n$ là số lẻ.]),
      True([Điều kiện cần và đủ để $n$ chia hết cho 5 là $n$ có chữ số tận cùng bằng 0 hoặc 5.]),
      True([Nếu $n$ chia hết cho 6 thì $n$ chia hết cho 2 và 3.]),
      [Nếu $n$ chia hết cho 3 thì $n$ chia hết cho 9.],
    ),
    loigiai: [
      - a đúng (Mệnh đề phản đảo: nếu $n$ chẵn thì $n=2k$, suy ra $n^2=4k^2$ chẵn).
      - b đúng (đây là dấu hiệu chia hết cho 5).
      - c đúng vì $6 = 2 times 3$ và $(2,3)=1$.
      - d sai, ví dụ $n=6$ chia hết cho 3 nhưng không chia hết cho 9.
    ],
  )

  #ds(
    [Cho các tập hợp $A = (-3; 5)$, $B = [1; +oo)$ và $C = (m; m+3]$. Xét tính đúng sai của các khẳng định:],
    (
      [Phần bù của $B$ trong $RR$ là $C_RR B = (-oo; 1]$.],
      [Có đúng 2 giá trị nguyên của $m$ để $C subset A$.],
      True([$A cap B = [1; 5)$.]),
      True([$A union B = (-3; +oo)$.]),
    ),
    loigiai: [
      - a sai, $C_RR B = (-oo; 1)$.
      - b sai. $C subset A <=> -3 <= m$ và $m+3 < 5 <=> -3 <= m < 2$. Các giá trị nguyên là -3, -2, -1, 0, 1 (có 5 giá trị).
      - c đúng, $A cap B = (-3; 5) cap [1; +oo) = [1; 5)$.
      - d đúng, $A union B = (-3; 5) union [1; +oo) = (-3; +oo)$.
    ],
  )

  #ds(
    [Một trung tâm ngoại ngữ có $80$ học viên. Trong đó có $50$ học viên học tiếng Anh, $35$ học viên học tiếng Trung, và $20$ học viên không học ngôn ngữ nào trong hai ngôn ngữ trên. Xét các khẳng định sau:],
    (
      True([Có $60$ học viên tham gia học ít nhất một ngôn ngữ.]),
      [Có $35$ học viên học cả tiếng Anh và tiếng Trung.],
      [Số học viên chỉ học tiếng Anh gấp đôi số học viên chỉ học tiếng Trung.],
      True([Có $25$ học viên học cả tiếng Anh và tiếng Trung.]),
    ),
    loigiai: [
      - a đúng. Số học viên tham gia học ít nhất một ngôn ngữ là $80 - 20 = 60$.
      - b sai. Số học viên học cả hai ngôn ngữ là $50 + 35 - 60 = 25$.
      - c sai. Chỉ học tiếng Anh: $50 - 25 = 25$. Chỉ học tiếng Trung: $35 - 25 = 10$.
      - d đúng. Số học viên học cả hai ngôn ngữ là 25.
    ],
  )

  #ds(
    [Cho mệnh đề $P$: "Mọi số nguyên đều là số hữu tỉ". Xét tính đúng sai của các khẳng định sau:],
    (
      [Tồn tại ít nhất một số vô tỉ là số nguyên.],
      True([Mệnh đề $P$ có thể viết lại là: " $forall x in ZZ, x in QQ$ ".]),
      [Mệnh đề phủ định của $P$ là: "Mọi số nguyên đều không là số hữu tỉ".],
      True([Mệnh đề $P$ là một mệnh đề đúng.]),
    ),
    loigiai: [
      - a sai, vì tập số vô tỉ và số hữu tỉ (chứa số nguyên) giao nhau bằng rỗng.
      - b đúng, kí hiệu lại mệnh đề $P$.
      - c sai, mệnh đề phủ định là "Tồn tại ít nhất một số nguyên không là số hữu tỉ".
      - d đúng, vì $ZZ subset QQ$.
    ],
  )

  #exam-part(
    [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
    count: 6,
    reset-counter: true,
  )


  #tln(
    [Một lớp có 30 học sinh thi học sinh giỏi Toán, 25 học sinh thi học sinh giỏi Lý, 10 học sinh thi cả Toán và Lý. Lớp có 5 học sinh không thi môn nào. Hỏi lớp đó có tổng cộng bao nhiêu học sinh?],
    [50],
    loigiai: [
      - Số học sinh thi ít nhất một môn là $n(T union L) = 30 + 25 - 10 = 45$.
      - Số học sinh của lớp là $45 + 5 = 50$.
    ],
  )

  #tln(
    [Cho $A = {1, 2, 3, 4, 5}$. Có bao nhiêu tập con của $A$ chứa cả hai phần tử $1$ và $2$?],
    [8],
    loigiai: [
      - Số tập con của $A$ chứa $1$ và $2$ bằng số tập con của tập ${3, 4, 5}$.
      - Số tập con đó là $2^3 = 8$.
    ],
  )

  #tln(
    [Trong một kỳ thi, mỗi học sinh phải làm 3 bài kiểm tra là A, B, C. Có 50 học sinh đạt điểm giỏi môn A, 40 học sinh đạt giỏi môn B, 30 học sinh đạt giỏi môn C, 20 giỏi A và B, 15 giỏi A và C, 10 giỏi B và C, 5 giỏi cả ba môn. Hỏi có bao nhiêu học sinh đạt điểm giỏi đúng một môn?],
    [45],
    loigiai: [
      - Giỏi đúng môn A: $50 - (20 - 5) - (15 - 5) - 5 = 20$.
      - Giỏi đúng môn B: $40 - (20 - 5) - (10 - 5) - 5 = 15$.
      - Giỏi đúng môn C: $30 - (15 - 5) - (10 - 5) - 5 = 10$.
      - Tổng cộng = $20 + 15 + 10 = 45$.
    ],
  )

  #tln(
    [Biết $A = (-oo; m+1]$ và $B = [-2; +oo)$. Tìm số giá trị nguyên dương của $m$ nhỏ hơn 10 để $A cap B$ là một đoạn có độ dài lớn hơn hoặc bằng 3.],
    [9],
    loigiai: [
      - $A cap B = [-2; m+1]$ (để giao khác rỗng cần $m+1 >= -2 <=> m >= -3$).
      - Độ dài là $(m+1) - (-2) = m+3$.
      - Yêu cầu $m+3 >= 3 <=> m >= 0$.
      - Các giá trị nguyên dương $m < 10$ là $1, 2, ..., 9$.
      - Có 9 giá trị.
    ],
  )

  #tln(
    [Một lớp có 40 học sinh đăng ký tham gia các câu lạc bộ Thể thao, Âm nhạc và Mỹ thuật. Biết rằng có 20 em tham gia Thể thao, 18 em tham gia Âm nhạc, 16 em tham gia Mỹ thuật, 8 em tham gia cả Thể thao và Âm nhạc, 7 em tham gia cả Thể thao và Mỹ thuật, 6 em tham gia cả Âm nhạc và Mỹ thuật, và 3 em tham gia cả ba câu lạc bộ. Hỏi có bao nhiêu em không tham gia bất kỳ câu lạc bộ nào?],
    [4],
    loigiai: [
      - Gọi $A, B, C$ lần lượt là tập hợp học sinh tham gia Thể thao, Âm nhạc, Mỹ thuật.
      - Số học sinh tham gia ít nhất 1 câu lạc bộ là:
        $|A union B union C| = |A| + |B| + |C| - |A inter B| - |A inter C| - |B inter C| + |A inter B inter C|$
        $=> |A union B union C| = 20 + 18 + 16 - 8 - 7 - 6 + 3 = 36$.
      - Số học sinh không tham gia bất kỳ câu lạc bộ nào là: $40 - 36 = 4$ em.
    ],
  )

  #tln(
    [Trong một đợt quyên góp sách, có 27 học sinh tham gia, mỗi học sinh quyên góp nhiều nhất 2 cuốn sách khác nhau trong 3 loại: Toán, Lý, Hóa. Biết rằng:
    - Số học sinh chỉ quyên góp sách Toán bằng tổng số học sinh chỉ quyên góp sách Lý và số học sinh chỉ quyên góp sách Hóa.
    - Trong số học sinh không quyên góp sách Toán, số học sinh có quyên góp sách Lý nhiều gấp hai lần số học sinh có quyên góp sách Hóa.
    - Số học sinh quyên góp sách Toán và một cuốn khác ít hơn số học sinh chỉ quyên góp sách Toán là 2 em.
    Hỏi có bao nhiêu học sinh chỉ quyên góp sách Toán?],
    [8],
    loigiai: [
      - Gọi số học sinh chỉ quyên góp sách Toán là $x$. Suy ra nhóm quyên góp Toán và 1 cuốn khác là $x - 2$.
      - Gọi số học sinh chỉ quyên góp sách Hóa là $y$. Do (Chỉ Toán) = (Chỉ Lý) + (Chỉ Hóa) nên nhóm chỉ Lý là $x - y$.
      - Nhóm quyên góp Lý và Hóa đặt là $z$.
      - Tổng học sinh không quyên góp Toán là các nhóm: Chỉ Lý, Chỉ Hóa, Lý + Hóa. Số người có góp Lý là $(x - y) + z$, số người có góp Hóa là $y + z$.
      - Theo giả thiết thứ hai: $(x - y) + z = 2(y + z) => z = x - 3y$.
      - Tổng số học sinh: $x + (x - 2) + (x - y) + y + z = 27 => 3x - 2 + z = 27 => 3x + z = 29$.
      - Thay $z = x - 3y => 4x - 3y = 29$. Với $y = 1 => 4x = 32 => x = 8$, khi đó $z = 5$.
      - Kết luận số học sinh chỉ quyên góp sách Toán là 8.
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

// #print-answer-key()

// -- QR ĐÁP ÁN OMR --
#import "de-on-kiem-tra-chuong-1-de-11-omr-key.typ": omr-key-qr
#align(center)[#omr-key-qr]
