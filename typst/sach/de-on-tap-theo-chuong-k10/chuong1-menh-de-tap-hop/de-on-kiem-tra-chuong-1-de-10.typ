#import "@preview/sang-math:1.0.6": *

#let mode = "dethi"
#let accent = rgb("0f766e")
#let ma-de = "1240"
#let in-qr-dap-an = true
#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG I: MỆNH ĐỀ VÀ TẬP HỢP",
  exam-title: "ĐỀ KIỂM TRA CHƯƠNG 1 - ĐỀ 10",
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
    [Khẳng định nào sau đây là Mệnh đề?],
    (
      [$3x + 1 > 5$],
      True([Hà Nội là thủ đô của Việt Nam.]),
      [Bạn có thích môn Toán không?],
      [Tuyệt vời!],
    ),
    loigiai: [
      - "Hà Nội là thủ đô của Việt Nam" là một câu khẳng định có tính đúng sai rõ ràng (là mệnh đề đúng).
    ]
  )

  #tn(
    [Tập hợp $M = {x in NN | 1 < x <= 5}$ có thể được viết dưới dạng liệt kê các phần tử là:],
    (
      [${1; 2; 3; 4; 5}$],
      True([${2; 3; 4; 5}$]),
      [${2; 3; 4}$],
      [${1; 2; 3; 4}$],
    ),
    loigiai: [
      - Vì $x in NN$ và $1 < x <= 5$ nên $x$ nhận các giá trị $2, 3, 4, 5$.
      - $M = {2; 3; 4; 5}$.
    ]
  )

  #tn(
    [Cho hai mệnh đề $P$: "Số 15 chia hết cho 3" và $Q$: "Số 15 chia hết cho 5". Mệnh đề $P land Q$ được phát biểu là:],
    (
      [Số 15 chia hết cho 3 hoặc chia hết cho 5.],
      [Nếu số 15 chia hết cho 3 thì nó chia hết cho 5.],
      [Số 15 chia hết cho 3 khi và chỉ khi nó chia hết cho 5.],
      True([Số 15 chia hết cho 3 và chia hết cho 5.]),
    ),
    loigiai: [
      - Ký hiệu $land$ (và) tương ứng với phép hội (liên kết hai mệnh đề bằng chữ "và").
    ]
  )

  #tn(
    [Cho các tập hợp $A = [-5; 1]$ và $B = (0; 3)$. Tập hợp $A cap B$ là:],
    (
      [$(0; 1)$],
      True([$(0; 1]$]),
      [$[-5; 3)$],
      [$[-5; 0)$],
    ),
    loigiai: [
      - $A cap B$ là phần chung của $[-5; 1]$ và $(0; 3)$.
      - Giá trị lớn hơn giữa $-5$ và $0$ là $0$ (ngoặc tròn).
      - Giá trị nhỏ hơn giữa $1$ và $3$ là $1$ (ngoặc vuông).
      - Vậy $A cap B = (0; 1]$.
    ]
  )

  #tn(
    [Cho tập hợp $X = {a; b; c}$. Số tập con của $X$ là:],
    (
      [$3$],
      [$6$],
      [$7$],
      True([$8$]),
    ),
    loigiai: [
      - Số tập con của tập hợp có $n$ phần tử là $2^n$.
      - Với $n = 3$, số tập con là $2^3 = 8$.
    ]
  )

  #tn(
    [Phủ định của mệnh đề "$exists x in RR, x^2 - x - 2 = 0$" là:],
    (
      [ $forall x in RR, x^2 - x - 2 > 0$ ],
      [ $exists x in RR, x^2 - x - 2 != 0$ ],
      True([ $forall x in RR, x^2 - x - 2 != 0$ ]),
      [ $forall x in RR, x^2 - x - 2 = 0$ ],
    ),
    loigiai: [
      - Phủ định của "tồn tại" ($exists$) là "với mọi" ($forall$).
      - Phủ định của "$=$" là "$!=$".
    ]
  )

  #tn(
    [Mệnh đề "$forall x in RR, x^2 > 0$" là sai. Phản ví dụ nào sau đây chứng minh điều đó?],
    (
      [$x = 1$],
      [$x = -1$],
      True([$x = 0$]),
      [$x = 1/2$],
    ),
    loigiai: [
      - Khi $x = 0$, ta có $0^2 = 0$, không thỏa mãn $x^2 > 0$. Do đó $x = 0$ là phản ví dụ.
    ]
  )

  #tn(
    [Tập hợp $C_RR [-3; 2)$ là:],
    (
      [$(-oo; -3) union [2; +oo)$],
      True([$(-oo; -3) union [2; +oo)$]),
      [$(-oo; -3] union (2; +oo)$],
      [$(-3; 2]$],
    ),
    loigiai: [
      - Phần bù của $[-3; 2)$ trong $RR$ là $RR setminus [-3; 2)$.
      - $RR setminus [-3; 2) = (-oo; -3) union [2; +oo)$.
      - Cần chú ý trong file latex 2 phương án A và B có thể giống nhau, nhưng đề sẽ tự động in.
    ]
  )

  #tn(
    [Lớp 10B có $42$ học sinh. Trong đợt kiểm tra sức khỏe, có $28$ em đạt chuẩn thị lực, $35$ em đạt chuẩn chiều cao. Có $3$ em không đạt chuẩn cả hai tiêu chí. Số em đạt chuẩn CẢ thị lực và chiều cao là:],
    (
      [$20$],
      True([$24$]),
      [$28$],
      [$39$],
    ),
    loigiai: [
      - Số học sinh đạt chuẩn ít nhất 1 tiêu chí: $42 - 3 = 39$.
      - Số học sinh đạt chuẩn cả hai tiêu chí: $28 + 35 - 39 = 24$.
    ]
  )

  #tn(
    [Cho hai tập hợp $A = [1; 4]$ và $B = (m; m+2)$. Điều kiện để $A cap B != emptyset$ là:],
    (
      [$m <= -1$ hoặc $m >= 4$],
      [$1 < m < 4$],
      True([$-1 < m < 4$]),
      [$-1 <= m <= 4$],
    ),
    loigiai: [
      - $A cap B = emptyset <=> m+2 <= 1$ hoặc $m >= 4 <=> m <= -1$ hoặc $m >= 4$.
      - Suy ra điều kiện để $A cap B != emptyset$ là $-1 < m < 4$.
    ]
  )

  #tn(
    [Mệnh đề "$P => Q$" sai khi nào?],
    (
      [$P$ đúng, $Q$ đúng],
      True([$P$ đúng, $Q$ sai]),
      [$P$ sai, $Q$ đúng],
      [$P$ sai, $Q$ sai],
    ),
    loigiai: [
      - Mệnh đề kéo theo $P => Q$ chỉ sai trong trường hợp duy nhất: Giả thiết $P$ đúng nhưng Kết luận $Q$ sai.
    ]
  )

  #tn(
    [Cho tập $A = (-oo; m-1]$ và $B = [2; +oo)$. Tìm $m$ để $A union B = RR$.],
    (
      [$m = 3$],
      [$m < 3$],
      True([$m >= 3$]),
      [$m <= 3$],
    ),
    loigiai: [
      - Để hợp hai tập là $RR$, phần kết thúc của $A$ phải lớn hơn hoặc bằng phần bắt đầu của $B$.
      - Tức là $m-1 >= 2 <=> m >= 3$.
    ]
  )

  #exam-part(
    [PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4; trong mỗi ý a), b), c), d), thí sinh chọn đúng hoặc sai.],
    count: 4,
    reset-counter: true,
  )

  #ds(
    [Cho tứ giác $A B C D$. Xét các mệnh đề sau:],
    (
      False([Mệnh đề "Nếu $A B C D$ là hình bình hành thì nó có hai đường chéo vuông góc" là mệnh đề đúng.]),
      True([Mệnh đề "Nếu $A B C D$ là hình thoi thì nó có hai đường chéo vuông góc" là mệnh đề đúng.]),
      True([Hình vuông là hình thoi có một góc vuông.]),
      False([Hình thang cân luôn có hai đường chéo vuông góc.]),
    ),
    loigiai: [
      - Hình bình hành nói chung không có 2 đường chéo vuông góc (chỉ hình thoi, hình vuông mới có). Vậy mệnh đề a sai.
      - Tính chất của hình thoi là có 2 đường chéo vuông góc. Vậy mệnh đề b đúng.
      - Hình vuông là hình thoi đặc biệt có 1 góc vuông. Vậy mệnh đề c đúng.
      - Hình thang cân có 2 đường chéo bằng nhau, không phải luôn vuông góc. Vậy mệnh đề d sai.
    ]
  )

  #ds(
    [Cho hai tập hợp $A = {x in ZZ | (x^2 - 1)(x^2 - 4x + 3) = 0}$ và $B = {x in NN | x < 4}$. Các phát biểu sau Đúng hay Sai?],
    (
      True([Tập hợp $A = {-1; 1; 3}$.]),
      False([Tập hợp $B = {1; 2; 3; 4}$.]),
      True([$A union B = {-1; 0; 1; 2; 3}$.]),
      True([Số tập con của tập hợp $A setminus B$ là 2.]),
    ),
    loigiai: [
      - $A$: $x^2 - 1 = 0 <=> x = +-1$. $x^2 - 4x + 3 = 0 <=> x=1, x=3$. $A = {-1; 1; 3}$. (Đúng)
      - $B = {0; 1; 2; 3}$. Khẳng định b liệt kê thiếu số 0 và dư số 4. (Sai)
      - $A union B = {-1; 0; 1; 2; 3}$. (Đúng)
      - $A setminus B = {-1}$. Tập này có 1 phần tử nên có $2^1 = 2$ tập con. (Đúng)
    ]
  )

  #ds(
    [Điều tra 50 học sinh về việc ăn sáng tại căng tin trường. Có 30 bạn thường ăn bánh mì, 25 bạn thường ăn bún, và 15 bạn thường ăn cả bánh mì và bún. Các phát biểu sau Đúng hay Sai?],
    (
      True([Số bạn chỉ ăn bánh mì (không ăn bún) là 15 bạn.]),
      True([Số bạn có ăn sáng (ít nhất 1 trong 2 món) là 40 bạn.]),
      False([Số bạn không ăn món nào trong hai món trên là 5 bạn.]),
      True([Nếu chọn ngẫu nhiên 1 bạn, có khả năng cao là bạn đó có ăn sáng tại trường.]),
    ),
    loigiai: [
      - Số bạn chỉ ăn bánh mì: $30 - 15 = 15$. (Đúng)
      - Số bạn có ăn ít nhất 1 món: $30 + 25 - 15 = 40$. (Đúng)
      - Số bạn không ăn món nào: $50 - 40 = 10$. Khẳng định c ghi 5 là sai.
      - 40/50 bạn có ăn sáng (80%), rất cao, nên khẳng định d đúng.
    ]
  )

  #ds(
    [Cho hai tập hợp $A = (m; m+5)$ và $B = (1; 8)$. Xét tính Đúng/Sai của các phát biểu về điều kiện của tham số $m$:],
    (
      True([Để $A subset B$ thì $1 <= m <= 3$.]),
      True([Để $A cap B = emptyset$ thì $m >= 8$ hoặc $m <= -4$.]),
      True([Có vô số giá trị thực $m$ để $A cap B != emptyset$.]),
      False([Để $B subset A$ thì $m = 1$.]),
    ),
    loigiai: [
      - $A subset B <=> m >= 1$ và $m+5 <= 8 <=> 1 <= m <= 3$. (Đúng)
      - $A cap B = emptyset <=> m+5 <= 1$ hoặc $m >= 8 <=> m <= -4$ hoặc $m >= 8$. (Đúng)
      - Có vô số $m$ thực thuộc khoảng $(-4; 8)$ để giao nhau khác rỗng. (Đúng)
      - $B subset A <=> m <= 1$ và $m+5 >= 8 <=> m <= 1$ và $m >= 3$. Vô nghiệm. Khẳng định d sai.
    ]
  )


  #exam-part(
    [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
    count: 6,
    reset-counter: true,
  )

  #tln(
    [Có bao nhiêu tập con của $A = {a; b; c; d; e}$ chứa đúng 2 phần tử và bắt buộc phải chứa phần tử $a$?],
    [4],
    loigiai: [
      - Các tập con gồm phần tử $a$ và 1 phần tử khác lấy từ ${b; c; d; e}$.
      - Số cách chọn 1 phần tử từ 4 phần tử là $C_4^1 = 4$.
    ]
  )

  #tln(
    [Một trường khảo sát 100 học sinh. 50 học sinh thích học Toán, 40 học sinh thích học Tiếng Anh, 30 học sinh thích học Lý. 15 học sinh thích cả Toán và Anh, 12 học sinh thích cả Toán và Lý, 10 học sinh thích cả Lý và Anh. Có 5 học sinh thích cả 3 môn. Hỏi có bao nhiêu học sinh không thích môn nào?],
    [12],
    loigiai: [
      - Số học sinh thích ít nhất 1 môn: $50 + 40 + 30 - 15 - 12 - 10 + 5 = 88$.
      - Số học sinh không thích môn nào: $100 - 88 = 12$.
    ]
  )

  #tln(
    [Cho phương trình $x^2 - 3x + m = 0$. Có bao nhiêu giá trị nguyên dương của $m$ để tồn tại $x in RR$ thỏa mãn phương trình?],
    [2],
    loigiai: [
      - Điều kiện để phương trình có nghiệm: $Delta = 9 - 4m >= 0 <=> m <= 9/4 = 2.25$.
      - Các giá trị nguyên dương của $m$ là $1, 2$. Có 2 giá trị.
    ]
  )

  #tln(
    [Tập hợp $S = {x in ZZ | -3 < (2x-1)/3 <= 2}$. Tính tổng bình phương các phần tử của tập hợp $S$.],
    [28],
    loigiai: [
      - $-3 < (2x-1)/3 <= 2 <=> -9 < 2x-1 <= 6 <=> -8 < 2x <= 7 <=> -4 < x <= 3.5$.
      - $x in ZZ => x in {-3, -2, -1, 0, 1, 2, 3}$.
      - Bình phương: $9, 4, 1, 0, 1, 4, 9$. Tổng: $9+4+1+0+1+4+9 = 28$.
    ]
  )

  

  

  #tln(
    [4 bạn có số bi là 3, 4, 5, 6.
- A và B có tổng số bi là 9.
- B và C có tổng số bi là 11.
- D có nhiều bi hơn A.
Hỏi D có bao nhiêu viên bi?],
    [4],
    loigiai: [
      - B + C = 11. Trong các số 3, 4, 5, 6, chỉ có 5 + 6 = 11. Nên (B, C) là (5, 6) hoặc (6, 5).
      - A + B = 9. Nếu B = 6 thì A = 3. Khi đó C = 5. Số bi còn lại cho D là 4. (Thỏa mãn D > A vì 4 > 3).
      - Nếu B = 5 thì A = 4. Khi đó C = 6. Số bi còn lại cho D là 3. (Không thỏa mãn D > A vì 3 < 4).
      - Vậy D có 4 viên bi.
    ]
  )

  #tln(
    [4 người dự đoán số quả bóng trong hộp.
- A: "Có 5 quả."
- B: "Có 6 quả."
- C: "Không phải 5 quả."
- D: "Nhiều hơn 4 quả."
Biết rằng có đúng 2 người đoán đúng, 2 người đoán sai. Số quả bóng thực sự là bao nhiêu (biết số bóng từ 4 đến 6)?],
    [6],
    loigiai: [
      - A và C là hai câu trái ngược nhau ("Có 5" và "Không phải 5"). Do đó chắc chắn 1 người đúng, 1 người sai.
      - Đề cho có 2 đúng, 2 sai. Vậy trong cặp B và D cũng phải có 1 đúng, 1 sai.
      - Giả sử số bóng là 6. B đúng ("Có 6"). D đúng ("Nhiều hơn 4"). Lúc này cả B và D đều đúng (mâu thuẫn, vì chỉ được 1 người đúng trong B, D).
      - Giả sử số bóng là 4. B sai ("Có 6"). D sai ("Nhiều hơn 4"). Cả B và D đều sai (mâu thuẫn).
      - Ủa? Nếu 6 thì B đúng, D đúng. Hai người đúng! A sai, C đúng. Vậy tổng cộng 3 đúng (B, C, D). Không thỏa.
      - Nếu 5 thì A đúng, C sai. B sai, D đúng. Tổng cộng 2 đúng (A, D), 2 sai (B, C).
      - Vậy số quả bóng thực sự là 5! 
      - (Đáp án 5).
    ]
  )
