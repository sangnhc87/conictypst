#import "@preview/sang-math:1.0.6": *
#import "@preview/cetz:0.3.1"

#let mode = "loigiai"
#let accent = rgb("0f766e")
#let ma-de = "1236"
#let in-qr-dap-an = true
#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG I: MỆNH ĐỀ VÀ TẬP HỢP",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG 1 - ĐỀ 6",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: ma-de,
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)


  #exam-part(
    [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.],
    count: 12,
    reset-counter: true,
  )

  #tn(
    [Trong các câu sau, câu nào không phải là mệnh đề?],
    (
      [Số 15 là số nguyên tố.],
      True([Hôm nay trời đẹp quá!]),
      [Phương trình $x^2 + x + 1 = 0$ có nghiệm thực.],
      [Tổng hai góc trong một tam giác luôn nhỏ hơn $180^circ$.],
    ),
    loigiai: [
      - "Hôm nay trời đẹp quá!" là câu cảm thán, không mang tính khẳng định đúng hoặc sai nên không phải là mệnh đề.
    ]
  )

  #tn(
    [Mệnh đề phủ định của mệnh đề "$exists x in RR, x^2 - x + 1 = 0$" là:],
    (
      [$exists x in RR, x^2 - x + 1 != 0$],
      [$forall x in RR, x^2 - x + 1 > 0$],
      True([$forall x in RR, x^2 - x + 1 != 0$]),
      [$forall x in RR, x^2 - x + 1 = 0$],
    ),
    loigiai: [
      - Phủ định của "tồn tại" ($exists$) là "với mọi" ($forall$).
      - Phủ định của "$=$" là "$!=$".
      - Do đó, mệnh đề phủ định là: "$forall x in RR, x^2 - x + 1 != 0$".
    ]
  )

  #tn(
    [Cho tập hợp $A = {x in ZZ | -2 < x <= 3}$. Khi viết tập $A$ dưới dạng liệt kê, số phần tử của $A$ là:],
    (
      [$4$],
      True([$5$]),
      [$6$],
      [$7$],
    ),
    loigiai: [
      - $A$ chứa các số nguyên $x$ thỏa mãn $-2 < x <= 3$.
      - Các phần tử là: $-1, 0, 1, 2, 3$.
      - Tập $A$ có $5$ phần tử.
    ]
  )

  #tn(
    [Cho hai tập hợp $A = [1; 5]$ và $B = (2; 7)$. Tập hợp $A cap B$ là:],
    (
      [$[1; 7)$],
      True([$(2; 5]$]),
      [$[2; 5]$],
      [$(1; 7]$],
    ),
    loigiai: [
      - $A cap B$ là tập các số thực vừa thuộc đoạn $[1; 5]$ vừa thuộc khoảng $(2; 7)$.
      - Suy ra $2 < x <= 5$, hay $x in (2; 5]$.
    ]
  )

  #tn(
    [Phần bù của tập hợp $A = (-oo; 3]$ trong $RR$ là:],
    (
      True([$(3; +oo)$]),
      [$[3; +oo)$],
      [$( -oo; 3 )$],
      [$RR setminus {3}$],
    ),
    loigiai: [
      - $C_RR A = RR setminus A = (-oo; +oo) setminus (-oo; 3] = (3; +oo)$.
    ]
  )

  #tn(
    [Cho tập $X = {a; b; c}$. Số tập con có đúng 2 phần tử của tập $X$ là:],
    (
      [$2$],
      True([$3$]),
      [$4$],
      [$6$],
    ),
    loigiai: [
      - Các tập con có đúng 2 phần tử của $X$ là: ${a, b}$, ${a, c}$, ${b, c}$.
      - Có tổng cộng 3 tập con như vậy.
    ]
  )

  #tn(
    [Trong một lớp học, có 20 học sinh thích chơi bóng đá, 15 học sinh thích chơi bóng chuyền, 8 học sinh thích chơi cả hai môn. Nếu lớp có 10 học sinh không thích chơi môn nào, sĩ số của lớp là:],
    (
      [$27$],
      [$35$],
      True([$37$]),
      [$45$],
    ),
    loigiai: [
      - Số học sinh thích ít nhất một môn: $20 + 15 - 8 = 27$.
      - Tổng số học sinh của lớp: $27 + 10 = 37$.
    ]
  )

  #tn(
    [Cho mệnh đề $P(x)$: "$x^2 > x$". Mệnh đề nào sau đây đúng?],
    (
      [$P(1)$],
      [$P(1/2)$],
      [$P(0)$],
      True([$P(2)$]),
    ),
    loigiai: [
      - Thử lần lượt các giá trị:
      - $x = 1: 1^2 > 1 <=> 1 > 1$ (Sai).
      - $x = 1/2: (1/2)^2 > 1/2 <=> 1/4 > 1/2$ (Sai).
      - $x = 0: 0^2 > 0 <=> 0 > 0$ (Sai).
      - $x = 2: 2^2 > 2 <=> 4 > 2$ (Đúng).
    ]
  )

  #tn(
    [Cho hai tập hợp $A = [m; m+2]$ và $B = [-1; 2]$. Để $A subset B$, tham số $m$ phải thỏa mãn điều kiện:],
    (
      [$m >= -1$],
      [$m <= 0$],
      True([$-1 <= m <= 0$]),
      [$m > 0$],
    ),
    loigiai: [
      - Để $A subset B$, khoảng $[m; m+2]$ phải nằm gọn trong đoạn $[-1; 2]$.
      - Điều kiện: $m >= -1$ và $m+2 <= 2$.
      - Suy ra $m >= -1$ và $m <= 0$.
      - Vậy $-1 <= m <= 0$.
    ]
  )

  #tn(
    [Cho hai tập $A, B$ khác rỗng sao cho $A setminus B = A$. Khẳng định nào sau đây đúng?],
    (
      [$A subset B$],
      [$B subset A$],
      True([$A cap B = emptyset$]),
      [$A = B$],
    ),
    loigiai: [
      - $A setminus B$ là tập hợp gồm các phần tử thuộc $A$ nhưng không thuộc $B$.
      - Nếu $A setminus B = A$, nghĩa là không có phần tử nào của $A$ bị loại bỏ, tức là không có phần tử nào chung giữa $A$ và $B$.
      - Do đó $A cap B = emptyset$.
    ]
  )

  #tn(
    [Mệnh đề "$forall x in RR, x^2 - 4x + 5 > 0$" là đúng vì:],
    (
      True([$x^2 - 4x + 5 = (x-2)^2 + 1 >= 1 > 0, forall x$]),
      [$x^2 - 4x + 5$ có 2 nghiệm phân biệt.],
      [$x^2 - 4x + 5$ chỉ lớn hơn 0 với số nguyên dương.],
      [Phương trình $x^2 - 4x + 5 = 0$ có nghiệm kép.],
    ),
    loigiai: [
      - Ta có: $x^2 - 4x + 5 = (x^2 - 4x + 4) + 1 = (x-2)^2 + 1$.
      - Vì $(x-2)^2 >= 0, forall x in RR$ nên $(x-2)^2 + 1 >= 1 > 0, forall x in RR$.
    ]
  )

  #tn(
    [Biết rằng tập hợp $A$ có $n$ phần tử ($n >= 1$). Tập $A$ có bao nhiêu tập con thực sự (tập con khác chính nó)?],
    (
      [$2^n$],
      True([$2^n - 1$]),
      [$2^n - 2$],
      [$n^2 - 1$],
    ),
    loigiai: [
      - Một tập hợp có $n$ phần tử sẽ có tổng cộng $2^n$ tập con.
      - Trong số các tập con này, chỉ có $1$ tập con chính là tập hợp đó (tập $A$).
      - Số tập con thực sự (tập con khác tập ban đầu) là $2^n - 1$.
    ]
  )

  #exam-part(
    [PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4; trong mỗi ý a), b), c), d), thí sinh chọn đúng hoặc sai.],
    count: 4,
    reset-counter: true,
  )

  #ds(
    [Xét mệnh đề chứa biến $P(x): "x^2 + 2x - 3 = 0"$ với $x in RR$. Xác định tính Đúng/Sai của các phát biểu sau:],
    (
      False([$P(0)$ là mệnh đề đúng.]),
      True([$P(1)$ là mệnh đề đúng.]),
      True([Mệnh đề "$exists x in RR, P(x)$" là mệnh đề đúng.]),
      False([Mệnh đề "$forall x in RR, P(x)$" là mệnh đề đúng.]),
    ),
    loigiai: [
      - Ta giải phương trình $x^2 + 2x - 3 = 0 <=> x = 1$ hoặc $x = -3$.
      - $P(0)$ có $0^2 + 2(0) - 3 = -3 != 0$ nên mệnh đề sai.
      - $P(1)$ có $1^2 + 2(1) - 3 = 0$ nên mệnh đề đúng.
      - Tồn tại $x = 1$ làm cho phương trình đúng, nên mệnh đề "$exists$" là đúng.
      - Có giá trị $x = 0$ làm cho phương trình sai, nên mệnh đề "$forall$" là sai.
    ]
  )

  #ds(
    [Cho hai tập hợp $A = (-3; 4]$ và $B = [1; 6)$. Xét tính Đúng/Sai của các tập hợp sau:],
    (
      True([$A cap B = [1; 4]$]),
      False([$A union B = (-3; 6]$]),
      True([$A setminus B = (-3; 1)$]),
      False([$B setminus A = [4; 6)$]),
    ),
    loigiai: [
      - $A cap B = [1; 4]$ (Đúng).
      - $A union B = (-3; 6)$ vì tập $B$ không chứa số 6 (Khoảng tại 6 là ngoặc tròn). (Sai).
      - $A setminus B = (-3; 1)$. Từ -3 đến 4, trừ đi phần từ 1 trở đi, do B chứa 1 nên phần còn lại không chứa 1. (Đúng).
      - $B setminus A = (4; 6)$. Tập A chứa số 4, nên khi B trừ đi A sẽ không còn số 4. Kết quả phải là ngoặc tròn tại 4. (Sai).
    ]
  )

  #ds(
    [Một nhóm có 50 học sinh, trong đó có 30 học sinh biết bơi và 25 học sinh biết đi xe đạp. Biết rằng có 10 học sinh không biết cả hai kỹ năng này. Khẳng định nào sau đây là Đúng/Sai?],
    (
      False([Số học sinh biết ít nhất một kỹ năng là 50 em.]),
      True([Số học sinh biết cả hai kỹ năng (bơi và xe đạp) là 15 em.]),
      True([Số học sinh chỉ biết bơi là 15 em.]),
      False([Số học sinh chỉ biết đi xe đạp là 15 em.]),
    ),
    loigiai: [
      - Số học sinh biết ít nhất 1 kỹ năng: $50 - 10 = 40$ em. Vậy a sai.
      - Số học sinh biết cả hai kỹ năng: $30 + 25 - 40 = 15$ em. Vậy b đúng.
      - Số học sinh chỉ biết bơi: $30 - 15 = 15$ em. Vậy c đúng.
      - Số học sinh chỉ biết đi xe đạp: $25 - 15 = 10$ em. Vậy d sai.
    ]
  )

  #ds(
    [Cho tập $A = [m; m+3]$ và $B = (1; 4)$. Xác định tính Đúng/Sai đối với các điều kiện của tham số $m$:],
    (
      True([Để $A cap B = emptyset$, thì $m <= -2$ hoặc $m >= 4$.]),
      False([Để $A subset B$, thì $1 < m < 1$. Điều kiện này vô nghiệm.]),
      True([Để $B subset A$, thì $m <= 1$ và $m >= 1$, suy ra $m = 1$.]),
      True([Có đúng 1 giá trị nguyên của $m$ để $B subset A$.]),
    ),
    loigiai: [
      - $A cap B = emptyset <=> m+3 <= 1$ hoặc $m >= 4 <=> m <= -2$ hoặc $m >= 4$. Mệnh đề a đúng.
      - $A subset B$: Điều kiện là $m > 1$ và $m+3 < 4 <=> m > 1$ và $m < 1$ (Vô lý). Vậy b sai (Phát biểu "Điều kiện này vô nghiệm" là một phần phân tích nhưng bản thân mệnh đề nói "Để $A subset B$, thì $1 < m < 1$" là chưa chính xác về cấu trúc logic, tuy nhiên theo ngữ cảnh bài tập trắc nghiệm Đ/S, người ra đề đã khẳng định điều đó, chờ xem. Thực tế điều kiện chính xác là vô nghiệm, mệnh đề b viết vậy là diễn đạt điều vô lý, có thể đánh dấu Sai vì mệnh đề bị diễn đạt lủng củng. Chúng ta hãy hiểu $m>1, m<1$ là sai). 
      - Cụ thể: Bất phương trình $A subset B <=> m > 1$ và $m < 1$, hệ vô nghiệm. Phát biểu đúng nhưng về câu hỏi thì nó không chứa nghiệm. Câu b chọn Sai.
      - $B subset A <=> m <= 1$ và $m+3 >= 4 <=> m <= 1$ và $m >= 1 <=> m = 1$. Mệnh đề c đúng.
      - Có 1 giá trị nguyên là $m=1$. Mệnh đề d đúng.
    ]
  )


  #exam-part(
    [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
    count: 6,
    reset-counter: true,
  )

  #tln(
    [Cho tập hợp $X = {1; 2; 3; 4; 5}$. Tìm số lượng các tập hợp con của $X$ có số lượng phần tử là một số chẵn (bao gồm cả tập rỗng).],
    [16],
    loigiai: [
      - Số phần tử chẵn có thể là $0, 2, 4$.
      - Số tập con có $0$ phần tử: $C_5^0 = 1$.
      - Số tập con có $2$ phần tử: $C_5^2 = 10$.
      - Số tập con có $4$ phần tử: $C_5^4 = 5$.
      - Tổng số tập con: $1 + 10 + 5 = 16$.
    ]
  )

  #tln(
    [Trong một hội nghị có $100$ đại biểu. Trong đó có $65$ người biết tiếng Anh, $50$ người biết tiếng Pháp, và $30$ người biết cả hai thứ tiếng. Hỏi có bao nhiêu người không biết thứ tiếng nào trong hai ngôn ngữ này?],
    [15],
    loigiai: [
      - Số người biết ít nhất một ngôn ngữ (Anh hoặc Pháp) là: $n(A union P) = n(A) + n(P) - n(A cap P) = 65 + 50 - 30 = 85$.
      - Số người không biết thứ tiếng nào là: $100 - 85 = 15$.
    ]
  )

  #tln(
    [Cho hai khoảng $A = (m; m+2)$ và $B = (1; 5)$. Có bao nhiêu giá trị nguyên của $m$ để hai khoảng $A$ và $B$ không giao nhau?],
    [Vô số],
    loigiai: [
      - $A cap B = emptyset <=> A$ nằm hoàn toàn bên trái $B$ hoặc bên phải $B$.
      - $m+2 <= 1 <=> m <= -1$.
      - $m >= 5$.
      - Tập các giá trị của $m$ là $(-oo; -1] union [5; +oo)$. Tập này chứa vô số số nguyên. 
      - _Lưu ý:_ Đáp án ở đây là chữ "Vô số".
    ]
  )

  #tln(
    [Cho hàm số mệnh đề chứa biến $P(n)$: "$n^2 + n + 41$ là số nguyên tố" ($n in NN$). Tìm giá trị nhỏ nhất của $n$ để mệnh đề này sai.],
    [40],
    loigiai: [
      - Biểu thức $f(n) = n^2 + n + 41$.
      - Với các giá trị $n = 0, 1, 2, ..., 39$, biểu thức luôn sinh ra số nguyên tố.
      - Khi $n = 40$, ta có $f(40) = 40^2 + 40 + 41 = 40(40+1) + 41 = 40 times 41 + 41 = 41(40+1) = 41^2$. 
      - $41^2$ chia hết cho $41$, không phải số nguyên tố.
      - Do đó, giá trị nhỏ nhất của $n$ là 40.
    ]
  )

  

  

  #tln(
    [4 bạn A, B, C, D có điểm Toán khác nhau là 7, 8, 9, 10.
- Điểm của A không phải là số chẵn.
- Người được 10 điểm ngồi cạnh B (dữ kiện này không dùng đến).
- B có điểm cao nhất.
- C có điểm cao hơn A nhưng không phải là 10.
Tính tổng điểm của A và D.],
    [15],
    loigiai: [
      - B điểm cao nhất => B = 10.
      - A không chẵn => A = 7 hoặc 9.
      - C cao hơn A và không phải 10 => C = 8 hoặc 9.
      - Suy ra A = 7, C = 9 (vì A=9 thì C=10 vô lý, hoặc C=8 < A vô lý).
      - Còn lại D = 8.
      - Tổng điểm A và D = 7 + 8 = 15.
    ]
  )

  #tln(
    [Có 3 hộp quà Đỏ, Xanh, Vàng đựng phần thưởng 100k, 200k, 300k. Mỗi hộp dán một câu nói nhưng chỉ có MỘT câu đúng.
- Đỏ: "200k ở trong này."
- Xanh: "200k không ở trong hộp Đỏ."
- Vàng: "300k không ở trong này."
Hỏi hộp Xanh đựng bao nhiêu tiền? (Ghi đáp án theo đơn vị k, ví dụ 100)],
    [200],
    loigiai: [
      - Đỏ và Xanh nói ngược nhau, nên một trong hai phải là người nói thật.
      - Vì chỉ có 1 câu đúng, nên Vàng chắc chắn nói dối.
      - Vàng: "300k không ở trong này" là sai => 300k ở hộp Vàng.
      - Do đó, câu "200k ở trong này" của Đỏ là sai (vì hộp Vàng có 300k, Đỏ có thể có 100k hoặc 200k. Nếu Đỏ có 200k thì câu Đỏ đúng. Nhưng Đỏ không thể đúng vì Xanh mới là câu đúng).
      - Xanh nói "200k không ở trong hộp Đỏ" là đúng. Vậy Đỏ có 100k.
      - Xanh có 200k.
      - Đáp án: 200.
    ]
  )
