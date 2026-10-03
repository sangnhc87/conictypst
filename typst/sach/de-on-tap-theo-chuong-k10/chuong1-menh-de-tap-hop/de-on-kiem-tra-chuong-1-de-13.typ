#import "@preview/sang-math:1.0.6": *

#let mode = "dethi"
#let accent = rgb("0f766e")
#let in-qr-dap-an = false
#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#let ten-de = "ĐỀ KIỂM TRA CHƯƠNG 1 - ĐỀ SỐ 13"
#let ma-de = "1097"

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG I: MỆNH ĐỀ VÀ TẬP HỢP",
  exam-title: ten-de,
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
    [Câu nào sau đây là một mệnh đề toán học?],
    (
      [$2x - 1 = 3$],
      [Tuyệt vời quá!],
      True([$sqrt(2)$ là số vô tỉ.]),
      [Chào bạn, bạn khỏe không?],
    ),
    loigiai: [- "$sqrt(2)$ là số vô tỉ" là khẳng định đúng, nên là mệnh đề toán học.],
  )

  #tn(
    [Mệnh đề phủ định của mệnh đề $P$: " $forall x in RR, x^2 + 2x + 3 > 0$ " là],
    (
      True([$overline(P)$: " $exists x in RR, x^2 + 2x + 3 <= 0$ "]),
      [$overline(P)$: " $forall x in RR, x^2 + 2x + 3 <= 0$ "],
      [$overline(P)$: " $exists x in RR, x^2 + 2x + 3 < 0$ "],
      [$overline(P)$: " $exists x in RR, x^2 + 2x + 3 != 0$ "],
    ),
    loigiai: [- Phủ định của $forall$ là $exists$, phủ định của $>$ là $<=$.],
  )

  #tn(
    [Cho hai mệnh đề $P$: "Tam giác $A B C$ cân tại $A$" và $Q$: "Tam giác $A B C$ có hai góc $B$ và $C$ bằng nhau". Phát biểu nào sau đây đúng?],
    (
      True([$P <=> Q$]),
      [$P => overline(Q)$],
      [$Q => overline(P)$],
      [Không có mối liên hệ nào.],
    ),
    loigiai: [- Tam giác cân tại A thì có hai góc ở đáy bằng nhau và ngược lại, do đó hai mệnh đề tương đương.],
  )

  #tn(
    [Cho tập hợp $X = {x in NN^* | x <= 4}$. Viết tập hợp $X$ dưới dạng liệt kê.],
    (
      [$X = {0, 1, 2, 3, 4}$],
      True([$X = {1, 2, 3, 4}$]),
      [$X = {1, 2, 3, 4, 5}$],
      [$X = {0, 1, 2, 3}$],
    ),
    loigiai: [- Các số tự nhiên khác 0 và nhỏ hơn hoặc bằng 4 là 1, 2, 3, 4.],
  )

  #tn(
    [Cho hai tập hợp $A = {2, 4, 6, 8}$ và $B = {4, 6, 7, 9}$. Tìm tập hợp $A union B$.],
    (
      [$A union B = {4, 6}$],
      [$A union B = {2, 8}$],
      True([$A union B = {2, 4, 6, 7, 8, 9}$]),
      [$A union B = {7, 9}$],
    ),
    loigiai: [- $A union B$ gồm các phần tử thuộc ít nhất một trong hai tập hợp $A$ hoặc $B$.],
  )

  #tn(
    [Một lớp học có $40$ học sinh. Trong đó có $25$ bạn thích môn Bóng đá, $18$ bạn thích môn Bóng chuyền và $8$ bạn thích cả hai môn. Số học sinh không thích môn nào trong hai môn trên là],
    (
      True([$5$]),
      [$8$],
      [$7$],
      [$10$],
    ),
    loigiai: [- Số học sinh thích ít nhất một môn là $25 + 18 - 8 = 35$.
      - Số học sinh không thích môn nào là $40 - 35 = 5$.],
  )

  #tn(
    [Phần bù của nửa khoảng $(-3; 4]$ trong $RR$ là],
    (
      [$(-oo; -3) union [4; +oo)$],
      True([$(-oo; -3] union (4; +oo)$]),
      [$(-oo; -3] union [4; +oo)$],
      [$(-oo; -3) union (4; +oo)$],
    ),
    loigiai: [- $C_RR (-3; 4] = RR setminus (-3; 4] = (-oo; -3] union (4; +oo)$.],
  )

  #tn(
    [Cho tập $A = [-1; 5)$ và $B = (2; 8]$. Tập hợp $A cap B$ là],
    (
      [$[-1; 8]$],
      [$(5; 8]$],
      [$(-1; 2)$],
      True([$(2; 5)$]),
    ),
    loigiai: [- $A cap B$ là tập các phần tử vừa thuộc $A$ vừa thuộc $B$, ta có $[-1; 5) cap (2; 8] = (2; 5)$.],
  )

  #tn(
    [Số phần tử của tập hợp $M = {x in ZZ | -2 <= x < 5}$ là],
    (
      True([$7$]),
      [$8$],
      [$6$],
      [$5$],
    ),
    loigiai: [- $M = {-2, -1, 0, 1, 2, 3, 4}$ nên có 7 phần tử.],
  )

  #tn(
    [Cho hai tập hợp $E = (-oo; 2m+1)$ và $F = [m+5; +oo)$. Điều kiện của tham số $m$ để $E cap F = emptyset$ là],
    (
      [$m >= 4$],
      [$m > 4$],
      True([$m <= 4$]),
      [$m < 4$],
    ),
    loigiai: [- Để $E cap F = emptyset$, ta phải có $2m+1 <= m+5 <=> m <= 4$.],
  )

  #tn(
    [Một tập hợp có $5$ phần tử. Số tập con có đúng $3$ phần tử của tập hợp đó là],
    (
      [$15$],
      [$20$],
      True([$10$]),
      [$5$],
    ),
    loigiai: [- Số tập con có 3 phần tử từ tập 5 phần tử là tổ hợp chập 3 của 5: $C_5^3 = 10$.],
  )

  #tn(
    [Cho tập $A = {x in RR | x^2 - 9 = 0}$ và $B = {x in RR | 3x - 9 = 0}$. Khẳng định nào sau đây đúng?],
    (
      True([$B subset A$]),
      [$A subset B$],
      [$A = B$],
      [$A cap B = emptyset$],
    ),
    loigiai: [- $A = {-3; 3}$, $B = {3}$, do đó $B subset A$.],
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
      True([Điều kiện cần và đủ để $n$ chia hết cho 10 là $n$ có chữ số tận cùng bằng 0.]),
      True([Nếu $n$ chia hết cho 10 thì $n$ chia hết cho 2 và 5.]),
      [Nếu $n$ chia hết cho 4 thì $n$ chia hết cho 8.],
    ),
    loigiai: [
      - a đúng (tính chất số chính phương lẻ).
      - b đúng, là dấu hiệu chia hết cho 10.
      - c đúng, vì 10 chia hết cho cả 2 và 5.
      - d sai, ví dụ $n=4$ chia hết cho 4 nhưng không chia hết cho 8.
    ],
  )

  #ds(
    [Cho các tập hợp $A = (-4; 6)$, $B = [2; +oo)$ và $C = (m; m+4]$. Xét tính đúng sai của các khẳng định:],
    (
      [Phần bù của $B$ trong $RR$ là $C_RR B = (-oo; 2]$.],
      [Có đúng 5 giá trị nguyên của $m$ để $C subset A$.],
      True([$A cap B = [2; 6)$.]),
      True([$A union B = (-4; +oo)$.]),
    ),
    loigiai: [
      - a sai, $C_RR B = (-oo; 2)$.
      - $C subset A <=> -4 <= m$ và $m+4 < 6 <=> -4 <= m < 2$. Các giá trị nguyên là -4, -3, -2, -1, 0, 1 (có 6 giá trị), nên b sai.
      - c đúng, d đúng.
    ],
  )

  #ds(
    [Một trung tâm năng khiếu có $100$ học viên. Trong đó có $60$ học viên học Piano, $45$ học viên học Guitar, và $15$ học viên không học môn nào trong hai môn trên. Xét các khẳng định sau:],
    (
      True([Có $85$ học viên tham gia học ít nhất một môn.]),
      [Có $45$ học viên học cả Piano và Guitar.],
      [Số học viên chỉ học Piano bằng số học viên chỉ học Guitar.],
      True([Có $20$ học viên học cả Piano và Guitar.]),
    ),
    loigiai: [
      - Số học viên học ít nhất 1 môn là $100 - 15 = 85$ (a đúng).
      - Số học viên học cả hai là $60 + 45 - 85 = 20$ (d đúng, b sai).
      - Chỉ học Piano là $60 - 20 = 40$. Chỉ học Guitar là $45 - 20 = 25$. Hai số khác nhau, c sai.
    ],
  )

  #ds(
    [Cho mệnh đề $P$: "Mọi số tự nhiên đều là số nguyên". Xét tính đúng sai của các khẳng định sau:],
    (
      [Tồn tại ít nhất một số vô tỉ là số tự nhiên.],
      True([Mệnh đề $P$ có thể viết lại bằng kí hiệu là: " $forall x in NN, x in ZZ$ ".]),
      [Mệnh đề phủ định của $P$ là: "Mọi số tự nhiên đều không là số nguyên".],
      True([Mệnh đề $P$ là một mệnh đề đúng.]),
    ),
    loigiai: [
      - a sai, số tự nhiên là số hữu tỉ.
      - b đúng.
      - c sai, phủ định của "mọi" là "tồn tại".
      - d đúng, $NN subset ZZ$.
    ],
  )

  #exam-part(
    [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
    count: 6,
    reset-counter: true,
  )

  #tln(
    [Một lớp có 28 học sinh thi học sinh giỏi Toán, 22 học sinh thi học sinh giỏi Văn, 12 học sinh thi cả Toán và Văn. Lớp có 4 học sinh không thi môn nào. Hỏi lớp đó có tổng cộng bao nhiêu học sinh?],
    [42],
    loigiai: [
      - Số học sinh thi ít nhất một môn là $n(T union V) = 28 + 22 - 12 = 38$.
      - Số học sinh của lớp là $38 + 4 = 42$.
    ],
  )

  #tln(
    [Cho $A = {1, 2, 3, 4, 5, 6}$. Có bao nhiêu tập con của $A$ chứa cả hai phần tử $1$ và $2$?],
    [16],
    loigiai: [
      - Số tập con của $A$ chứa $1$ và $2$ bằng số tập con của tập ${3, 4, 5, 6}$.
      - Số tập con đó là $2^4 = 16$.
    ],
  )

  #tln(
    [Trong một đợt kiểm tra, học sinh phải làm 3 bài là A, B, C. Có 60 học sinh đạt điểm giỏi môn A, 45 đạt giỏi môn B, 35 đạt giỏi môn C, 25 giỏi A và B, 20 giỏi A và C, 15 giỏi B và C, 8 giỏi cả ba môn. Hỏi có bao nhiêu học sinh đạt điểm giỏi đúng một môn?],
    [44],
    loigiai: [
      - Giỏi đúng môn A: $60 - (25 - 8) - (20 - 8) - 8 = 23$.
      - Giỏi đúng môn B: $45 - (25 - 8) - (15 - 8) - 8 = 13$.
      - Giỏi đúng môn C: $35 - (20 - 8) - (15 - 8) - 8 = 8$.
      - Tổng cộng = $23 + 13 + 8 = 44$.
    ],
  )

  #tln(
    [Biết $A = (-oo; m+2]$ và $B = [-1; +oo)$. Tìm số giá trị nguyên dương của $m$ không vượt quá 10 để $A cap B$ là một đoạn có độ dài lớn hơn hoặc bằng 4.],
    [10],
    loigiai: [
      - $A cap B = [-1; m+2]$ (để giao khác rỗng cần $m+2 >= -1 <=> m >= -3$).
      - Độ dài là $(m+2) - (-1) = m+3$.
      - Yêu cầu $m+3 >= 4 <=> m >= 1$.
      - Các giá trị nguyên dương $m <= 10$ là $1, 2, ..., 10$.
      - Có 10 giá trị.
    ],
  )

  #tln(
    [Cho hai tập hợp $A = [m; m+3]$ và $B = [2; 5)$. Có bao nhiêu giá trị nguyên của $m$ để tập hợp $A cap B$ chứa ít nhất hai số nguyên?],
    [4],
    loigiai: [
      - Các số nguyên thuộc tập hợp $B = [2; 5)$ là $2, 3$ và $4$.
      - Để $A cap B$ chứa ít nhất hai số nguyên thì $A$ phải chứa ít nhất 2 trong 3 số trên.
      - Do $A = [m; m+3]$ là một đoạn liền mạch, các số nguyên nó chứa phải liên tiếp nhau. Do đó $A$ chứa $2, 3$ hoặc chứa $3, 4$.
      - Nếu $A$ chứa $2$ và $3$: Ta cần $m <= 2$ và $m+3 >= 3 <=> 0 <= m <= 2$.
      - Nếu $A$ chứa $3$ và $4$: Ta cần $m <= 3$ và $m+3 >= 4 <=> 1 <= m <= 3$.
      - Hợp hai trường hợp lại, ta được $0 <= m <= 3$.
      - Vì $m$ nguyên nên $m in {0, 1, 2, 3}$. Vậy có $4$ giá trị nguyên của $m$ thỏa mãn.
    ],
  )

  #tln(
    [Khảo sát 37 người chơi một tựa game nhập vai về việc chọn vai trò nhân vật (Chiến binh, Pháp sư, Xạ thủ). Biết mỗi người chơi đều chọn ít nhất 1 vai trò và chọn nhiều nhất 2 vai trò khác nhau. Kết quả cho thấy:
    - Số người chỉ chọn Chiến binh bằng tổng số người chỉ chọn Pháp sư và số người chỉ chọn Xạ thủ cộng thêm 2 người.
    - Trong số những người không chọn Chiến binh, 4 lần số người có chọn Pháp sư bằng 3 lần số người có chọn Xạ thủ.
    - Số người chọn Chiến binh và một vai trò khác ít hơn số người chỉ chọn Chiến binh là 4 người.
    Hỏi có bao nhiêu người chơi chỉ chọn Pháp sư?],
    [5],
    loigiai: [
      - Gọi $x, y$ lần lượt là số người chỉ chọn Chiến binh và chỉ chọn Xạ thủ. Suy ra số người chỉ chọn Pháp sư là $w = x - y - 2$.
      - Gọi $z$ là số người chọn cả Pháp sư và Xạ thủ.
      - Số người chọn Chiến binh và 1 vai trò khác là $v = x - 4$.
      - Nhóm không chọn Chiến binh có 3 tập rời nhau: Chỉ Pháp sư ($w$), Chỉ Xạ thủ ($y$), và Pháp sư + Xạ thủ ($z$).
      - Dữ kiện thứ hai: $4(w + z) = 3(y + z) <=> 4(x - y - 2 + z) = 3y + 3z <=> 4x - 7y + z = 8 (*)$.
      - Tổng số người chơi: $x + y + w + z + v = 37 <=> x + y + (x - y - 2) + z + (x - 4) = 37 <=> 3x + z = 43 => z = 43 - 3x$.
      - Thay $z$ vào $(*)$, ta được: $4x - 7y + (43 - 3x) = 8 <=> x - 7y = -35 <=> x = 7y - 35$.
      - Tập xác định $w = x - y - 2 >= 0 => (7y - 35) - y - 2 >= 0 <=> 6y >= 37 => y >= 7$ (vì $y in ZZ$).
      - Tập xác định $z = 43 - 3x >= 0 => 3x <= 43 => x <= 14$.
      - Thử $y = 7 => x = 14$ (nhận). Suy ra $w = 14 - 7 - 2 = 5$ và $z = 43 - 42 = 1$.
      - Nếu $y >= 8 => x >= 56 - 35 = 21$ (loại vì $x <= 14$).
      - Vậy có $5$ người chỉ chọn Pháp sư.
    ],
  )
]
#make-questions()
#het
// -- QR ĐÁP ÁN OMR --
#import "de-on-kiem-tra-chuong-1-de-13-omr-key.typ": omr-key-qr
#align(center)[#omr-key-qr]
