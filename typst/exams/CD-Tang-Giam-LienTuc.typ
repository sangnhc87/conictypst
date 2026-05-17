#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"


#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm),
)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

// ==========================================
// THIẾT KẾ GIAO DIỆN TIÊU ĐỀ
// ==========================================
#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body),
)

// ==========================================
// HÀM VẼ ĐA GIÁC CƠ BẢN (DÙNG CHUNG)
// ==========================================
#let draw-poly(n, r: 1.2) = {
  import cetz.draw: *
  degreele((0, 0), radius: r, stroke: luma(200) + 0.5pt)
  for i in range(n) {
    degreele((90deg - i * 360deg / n, r), radius: 1.2pt, fill: gray)
  }
}
// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill: math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display
// ==========================================
// NỘI DUNG TÀI LIỆU
// ==========================================
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
    [
      #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
        CHỦ ĐỀ TĂNG GIẢM LIÊN TỤC
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
        Vấn đề tốc độ thay đổi liên tục tăng và giảm.
      ]
    ],
  )
]

#tln(
  [
    _Câu chuyện về mối tình đầu của giới trẻ thì nó rất là thú vị và hấp dẫn, yêu thì nồng nhiệt hết mình mà chia tay thì cũng phũ phàng quyết liệt không kém. Thế nhưng dù có như thế nào thì mối tình đầu cũng rất là khó phai._ \
    Giả sử có một mối tình đầu giữa hai bạn *Huỳnh Thanh Nam* và *Nguyễn Minh Thư* khi còn yêu nhau ta coi như có $100$ điểm tình cảm. Vào một ngày nọ, vì một số lí do hiểu lầm không thể nào giải thích giữa đôi nam nữ này mà dẫn tới họ quyết định chia tay nhau. Ở những ngày sau đó coi như họ gặp nhau mỗi ngày một lần, coi như sau một ngày không gặp nhau thì tình cảm giảm đi $30%$ so với lúc vừa gặp nhau xong, mỗi lần gặp nhau lại hâm nóng tình cảm và tăng lên $12%$ so với ngày trước đó. Với giả sử điểm tình cảm nhỏ hơn $10$ thì coi như quên hẳn được nhau và khi gặp sẽ không còn hâm nóng lên được nữa. Hỏi sau tối thiểu bao nhiêu ngày kể từ lúc chia tay thì hai bạn này quên được nhau (_làm tròn kết quả đến hàng đơn vị_)?
  ],
  [$10$],
  loigiai: [
    #ppgiai[
      - Bài toán liên quan đến tăng trưởng / suy giảm kép.
      - Nếu một đại lượng $A$ ban đầu, qua mỗi chu kỳ (mỗi ngày) bị giảm $a%$ rồi ngay lập tức tăng $b%$ (trên nền lượng vừa giảm), thì sau một chu kỳ đại lượng đó trở thành:
        $ A_1 = A dot (1 - a%) dot (1 + b%) $
      - Lặp lại quá trình này $n$ chu kỳ, ta thu được dãy số là một cấp số nhân với công thức số hạng tổng quát:
        $ A_n = A dot q^n quad "với công bội " q = (1 - a%) dot (1 + b%) $
    ]

    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Vẽ hệ trục tọa độ
        line((-0.5, 0), (11.5, 0), mark: (end: ">"), stroke: 1pt)
        content((11.5, -0.4), $n$ + " (ngày)", anchor: "north")
        line((0, -0.5), (0, 11), mark: (end: ">"), stroke: 1pt)
        content((-0.4, 11), $u_n$ + " (điểm)", anchor: "east")
        content((-0.3, -0.3), $O$)

        // Vẽ đồ thị hàm số mũ y = 10 * (0.784)^x (scale y xuống 10 lần)
        let pts = ()
        for i in range(0, 113) {
          let x = i / 10
          pts.push((x, 10 * calc.pow(0.784, x)))
        }
        line(..pts, stroke: (paint: red, thickness: 1.2pt))

        // Đánh dấu điểm khởi đầu
        circle((0, 10), radius: 2pt, fill: red)
        content((-0.2, 10), text(weight: "bold")[$100$], anchor: "east", fill: black)

        // Đường ranh giới "Quên nhau" tại mức 10 điểm (y=1)
        line((-0.5, 1), (11.5, 1), stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
        content((6, 1.3), [Ngưỡng quên nhau ($< 10$ điểm)], fill: blue)
        content((-0.2, 1), text(weight: "bold")[$10$], anchor: "east", fill: blue)

        // Vị trí giao điểm lý thuyết n ~ 9.47
        line((9.47, 0), (9.47, 1), stroke: (dash: "dashed", paint: gray))
        content((9.47, -0.4), $9","47$)
        circle((9.47, 1), radius: 2pt, fill: blue)

        // Vị trí ngày thứ 10
        let y10 = 10 * calc.pow(0.784, 10)
        line((10, 0), (10, y10), stroke: (dash: "dashed", paint: rgb("008080"), thickness: 1.2pt))
        content((10, -0.4), text(weight: "bold")[$10$], fill: rgb("008080"))
        circle((10, y10), radius: 2pt, fill: rgb("008080"))

        // Chú thích hàm số
        content((3.5, 6.5), $u_n = 100 dot (0","784)^n$, fill: red)
      })
    ]

    *Phân tích và giải chi tiết từng bước:*
    - Gọi $u_n$ là điểm tình cảm của hai bạn sau ngày thứ $n$ ($n in NN^*$). Khởi điểm khi vừa chia tay, ta có $u_0 = 100$.
    - Trong một ngày, điểm tình cảm trải qua hai giai đoạn biến đổi liên tiếp:
      + *Giai đoạn 1 (Không gặp nhau):* Tình cảm giảm đi $30%$, tức là lượng còn lại được nhân với hệ số $(100% - 30%) = 0","7$.
      + *Giai đoạn 2 (Gặp nhau cuối ngày):* Tình cảm được hâm nóng tăng $12%$ so với mức vừa bị giảm, tức là nhân tiếp với hệ số $(100% + 12%) = 1","12$.
    - Tổng hợp lại, sau mỗi ngày trôi qua, điểm tình cảm bị biến đổi theo một tỷ lệ chung (công bội):
      $ q = 0","7 dot 1","12 = 0","784 $
    - Điều này có nghĩa là dãy số $(u_n)$ lập thành một cấp số nhân lùi vô hạn. Số hạng tổng quát tính điểm tình cảm ở ngày thứ $n$ là:
      $ u_n = u_0 dot q^n = 100 dot (0","784)^n $
    - Theo giả thiết, hai người sẽ chính thức "quên hẳn được nhau" khi điểm tình cảm sụt giảm xuống dưới mức $10$. Ta thiết lập bất phương trình:
      $ u_n < 10 <=> 100 dot (0","784)^n < 10 $
      $ <=> (0","784)^n < 10/100 <=> (0","784)^n < 0","1 $
    - Do cơ số $q = 0","784 < 1$, khi lấy logarit hai vế ta bắt buộc phải *đảo chiều bất đẳng thức*:
      $ n > log_(0","784) (0","1) $
    - Sử dụng máy tính cầm tay để tính giá trị gần đúng:
      $ n > 9","471... $
    - Vì $n$ phải là số nguyên dương (đại diện cho số ngày) và bài toán yêu cầu tìm số ngày *tối thiểu* để thỏa mãn điều kiện, ta cần tìm số nguyên nhỏ nhất lớn hơn $9","471$.
    - Vậy ta chọn $n = 10$. Nghĩa là sau $10$ ngày kể từ lúc chia tay, điểm tình cảm mới chính thức tụt xuống dưới mức $10$ và hai bạn quên được nhau.

    #luuy[
      Khi giải bất phương trình logarit hoặc mũ dạng $q^n < C$. Nếu cơ số $0 < q < 1$, ta bắt buộc phải *đổi chiều bất phương trình* ($n > log_q C$).
    ]
  ],
)

#tln(
  [
    Tại một khu bảo tồn thiên nhiên, một quần thể chim quý hiếm ban đầu được ghi nhận có $500$ cá thể. Khí hậu ở đây chia làm hai mùa rõ rệt trong một năm. Theo thống kê của các nhà sinh học, trải qua mỗi mùa khô khắc nghiệt, số lượng cá thể của quần thể bị sụt giảm $15%$. Tuy nhiên, ngay sau đó bước vào mùa sinh sản, số lượng cá thể lại được gia tăng $20%$ so với số lượng còn sống sót sau mùa khô. Giả sử chu kỳ này lặp lại đều đặn và các tỷ lệ biến động là không đổi qua các năm. Hỏi sau ít nhất bao nhiêu năm (tính trọn vẹn cả hai mùa) thì số lượng cá thể của quần thể chim quý này vượt mức $700$ cá thể?
  ],
  [$17$],
  loigiai: [
    #ppgiai[
      - Bài toán thực tế liên quan đến mô hình tăng trưởng/suy giảm kép.
      - Nếu một đại lượng $A$ ban đầu, qua mỗi chu kỳ bị giảm $a%$ rồi ngay lập tức tăng $b%$ (trên nền lượng vừa giảm), thì sau một chu kỳ đại lượng đó trở thành:
        $ A_1 = A dot (1 - a%) dot (1 + b%) $
      - Lặp lại quá trình này $n$ chu kỳ, ta thu được dãy số là một cấp số nhân với công thức số hạng tổng quát:
        $ A_n = A dot q^n quad "với công bội " q = (1 - a%) dot (1 + b%) $
    ]

    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        // Hệ trục tọa độ
        line((-1, 0), (20, 0), mark: (end: ">"), stroke: 1pt)
        content((20, -0.5), $n$ + " (năm)", anchor: "north")
        line((0, -1), (0, 10), mark: (end: ">"), stroke: 1pt)
        content((-0.4, 10), $u_n$ + " (trăm cá thể)", anchor: "east")
        content((-0.3, -0.3), $O$)

        // Đồ thị u_n = 5 * 1.02^n
        let pts = ()
        for i in range(0, 190) {
          let x = i / 10
          pts.push((x, 5 * calc.pow(1.02, x)))
        }
        line(..pts, stroke: (paint: rgb("008080"), thickness: 1.5pt))

        // Điểm khởi đầu
        circle((0, 5), radius: 2pt, fill: rgb("008080"))
        content((-0.2, 5), text(weight: "bold")[$500$], anchor: "east")

        // Đường mục tiêu 700
        line((-0.5, 7), (20, 7), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((10, 7.3), [Ngưỡng $700$ cá thể], fill: red)
        content((-0.2, 7), text(weight: "bold")[$700$], anchor: "east", fill: red)

        // Điểm cắt lý thuyết
        let n_val = 16.99
        line((n_val, 0), (n_val, 7), stroke: (dash: "dashed", paint: gray))
        content((n_val, -0.5), $16","99$)
        circle((n_val, 7), radius: 2pt, fill: red)

        // Điểm thực tế (n=17)
        let y17 = 5 * calc.pow(1.02, 17)
        line((17, 0), (17, y17), stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
        content((17.5, -0.5), text(weight: "bold")[$17$], fill: blue)
        circle((17, y17), radius: 2pt, fill: blue)
      })
    ]

    *Phân tích và giải chi tiết từng bước:*
    - Gọi $u_n$ là số lượng cá thể của quần thể chim sau $n$ năm ($n in NN^*$). Số lượng ban đầu là $u_0 = 500$.
    - Trong một năm, số lượng chim trải qua hai đợt biến đổi liên tiếp:
      + *Giai đoạn 1 (Mùa khô):* Quần thể giảm $15%$, lượng chim còn lại được tính bằng cách nhân với hệ số $(100% - 15%) = 85% = 0","85$.
      + *Giai đoạn 2 (Mùa sinh sản):* Quần thể tăng $20%$ so với số lượng vừa sụt giảm, tức là lượng chim lại được nhân với hệ số $(100% + 20%) = 120% = 1","2$.
    - Tổng hợp lại, sau mỗi năm trôi qua, số lượng cá thể bị biến đổi theo một tỷ lệ chung (công bội) là:
      $ q = 0","85 dot 1","2 = 1","02 $
    - Dãy số $(u_n)$ lập thành một cấp số nhân. Công thức tính tổng số lượng cá thể ở năm thứ $n$ là:
      $ u_n = u_0 dot q^n = 500 dot (1","02)^n $
    - Đề bài yêu cầu tìm số năm $n$ tối thiểu để số lượng cá thể vượt mức $700$, ta thiết lập bất phương trình:
      $ u_n > 700 <=> 500 dot (1","02)^n > 700 $
      $ <=> (1","02)^n > 700/500 <=> (1","02)^n > 1","4 $
    - Do cơ số $q = 1","02 > 1$, khi lấy logarit hai vế ta giữ nguyên chiều bất phương trình:
      $ n > log_(1","02) (1","4) $
    - Sử dụng máy tính cầm tay để tính giá trị gần đúng:
      $ n > 16","989... $
    - Vì $n$ phải là số nguyên dương (đại diện cho số năm trọn vẹn) và bài toán yêu cầu tìm số năm *ít nhất*, ta cần tìm số nguyên nhỏ nhất lớn hơn $16","989$.
    - Vậy chọn $n = 17$. 

    #luuy[
      Nhiều học sinh thường mắc sai lầm khi cộng trừ trực tiếp các số phần trăm: lấy tăng $20%$ trừ đi giảm $15%$ thành tăng $5%$ (tương ứng $q=1","05$). Đây là tư duy sai lầm trong bài toán biến động kép. Phải tính chính xác theo hệ số nhân: $(1 - 15%) dot (1 + 20%) = 1","02$ (tức là thực chất quần thể chỉ tăng $2%$ sau mỗi chu kỳ một năm).
    ]
  ],
)

#tln(
  [
    Một nền tảng học trực tuyến vừa mới ra mắt và đạt được $50 000$ tài khoản người dùng hoạt động. Theo dữ liệu phân tích hành vi, mỗi năm lượng người dùng của nền tảng này biến động theo hai giai đoạn đặc thù. Vào giai đoạn nghỉ hè, lượng người dùng giảm $25%$ so với đầu năm do học sinh ít có nhu cầu học tập. Sau đó, bước vào giai đoạn năm học mới, nhờ các chiến dịch truyền thông và nhu cầu học tăng cao, lượng người dùng lại tăng $40%$ so với số lượng còn lại ngay sau kỳ nghỉ hè. Giả sử chu kỳ biến động này lặp lại đều đặn hàng năm và xu hướng không thay đổi. Hỏi sau ít nhất bao nhiêu năm thì nền tảng này sẽ cán mốc vượt $100 000$ tài khoản hoạt động?
  ],
  [$15$],
  loigiai: [
    #ppgiai[
      - Bài toán thực tế liên quan đến mô hình tăng trưởng/suy giảm kép.
      - Gọi đại lượng ban đầu là $A$. Qua mỗi chu kỳ, nếu đại lượng bị giảm $a%$ rồi ngay lập tức tăng $b%$ (trên nền lượng vừa giảm), thì sau một chu kỳ đại lượng đó trở thành:
        $ A_1 = A dot (1 - a%) dot (1 + b%) $
      - Lặp lại quá trình này $n$ chu kỳ, ta thu được dãy số là một cấp số nhân với công thức số hạng tổng quát:
        $ A_n = A dot q^n quad "với công bội " q = (1 - a%) dot (1 + b%) $
    ]

    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        // Hệ trục tọa độ
        line((-1, 0), (18, 0), mark: (end: ">"), stroke: 1pt)
        content((18, -0.5), $n$ + " (năm)", anchor: "north")
        line((0, -1), (0, 13), mark: (end: ">"), stroke: 1pt)
        content((-0.4, 13), $u_n$ + " (chục nghìn)", anchor: "east")
        content((-0.3, -0.3), $O$)

        // Đồ thị u_n = 5 * 1.05^n
        let pts = ()
        for i in range(0, 165) {
          let x = i / 10
          pts.push((x, 5 * calc.pow(1.05, x)))
        }
        line(..pts, stroke: (paint: rgb("d81b60"), thickness: 1.5pt))

        // Điểm khởi đầu
        circle((0, 5), radius: 2pt, fill: rgb("d81b60"))
        content((-0.2, 5), text(weight: "bold")[$50$], anchor: "east")

        // Đường mục tiêu 100k (y=10)
        line((-0.5, 10), (18, 10), stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
        content((6, 10.5), [Ngưỡng $100 000$ tài khoản], fill: blue)
        content((-0.2, 10), text(weight: "bold")[$100$], anchor: "east", fill: blue)

        // Điểm cắt lý thuyết
        let n_val = 14.206
        line((n_val, 0), (n_val, 10), stroke: (dash: "dashed", paint: gray))
        content((n_val, -0.5), $14","2$)
        circle((n_val, 10), radius: 2pt, fill: blue)

        // Điểm thực tế (n=15)
        let y15 = 5 * calc.pow(1.05, 15)
        line((15, 0), (15, y15), stroke: (dash: "dashed", paint: rgb("008080"), thickness: 1.2pt))
        content((15.5, -0.5), text(weight: "bold")[$15$], fill: rgb("008080"))
        circle((15, y15), radius: 2pt, fill: rgb("008080"))
      })
    ]

    *Phân tích và giải chi tiết từng bước:*
    - Gọi $u_n$ là số lượng tài khoản người dùng của nền tảng sau $n$ năm ($n in NN^*$). Số lượng ban đầu là $u_0 = 50 000$.
    - Trong một năm, lượng người dùng trải qua hai đợt biến đổi liên tiếp:
      + *Giai đoạn 1 (Nghỉ hè):* Lượng người dùng giảm $25%$, tức là nhân với hệ số $(100% - 25%) = 0","75$.
      + *Giai đoạn 2 (Năm học mới):* Lượng người dùng tăng $40%$ so với số lượng vừa sụt giảm, tức là nhân tiếp với hệ số $(100% + 40%) = 1","4$.
    - Tổng hợp lại, sau mỗi năm trôi qua, lượng người dùng bị biến đổi theo một tỷ lệ chung (công bội) là:
      $ q = 0","75 dot 1","4 = 1","05 $
    - Vậy dãy số $(u_n)$ lập thành một cấp số nhân. Công thức tính lượng người dùng ở năm thứ $n$ là:
      $ u_n = u_0 dot q^n = 50 000 dot (1","05)^n $
    - Đề bài yêu cầu tìm số năm $n$ tối thiểu để lượng người dùng vượt mức $100 000$, ta thiết lập bất phương trình:
      $ u_n > 100 000 <=> 50 000 dot (1","05)^n > 100 000 $
      $ <=> (1","05)^n > 100 000/50 000 <=> (1","05)^n > 2 $
    - Lấy logarit cơ số $1","05$ hai vế (do $1","05 > 1$ nên giữ nguyên chiều bất phương trình):
      $ n > log_(1","05) 2 $
    - Sử dụng máy tính cầm tay để tính giá trị gần đúng:
      $ n > 14","206... $
    - Vì $n$ là số nguyên (đại diện cho số năm) và cần tìm số năm *ít nhất*, ta chọn số nguyên dương nhỏ nhất lớn hơn $14","206$.
    - Vậy ta chọn $n = 15$. Nghĩa là sau trọn vẹn $15$ năm, nền tảng này sẽ vượt mốc $100 000$ tài khoản.

    #nhanxet[
      Nhiều bạn có thói quen cộng trừ trực tiếp các tỷ lệ phần trăm: lấy tăng $40%$ trừ đi giảm $25%$ thì nghĩ rằng sau một năm lượng người dùng tăng $15%$. Tuy nhiên, do nền giá bị thay đổi sau đợt giảm, mức tăng thực tế chỉ là $5%$ mỗi năm ($q = 1","05$). Đây là bẫy phổ biến nhất trong các bài toán tăng trưởng/suy giảm liên tục!
    ]
  ],
)
#tln(
  [
    Một kênh YouTube giáo dục hiện đang có $50 000$ người đăng ký (subscribers). Theo thuật toán định kỳ của nền tảng, vào ngày đầu tiên của mỗi tháng, hệ thống sẽ tự động quét và xóa đi $10%$ số lượng tài khoản ảo hoặc không hoạt động so với tháng trước đó. Tuy nhiên, nhờ việc đăng tải video đều đặn và chất lượng, trong suốt tháng đó kênh lại thu hút thêm được một lượng người đăng ký mới bằng $15%$ số lượng người đăng ký còn lại ngay sau đợt quét. Giả sử biến động này lặp lại đều đặn mỗi tháng. Hỏi sau ít nhất bao nhiêu tháng thì kênh YouTube này sẽ nhận được Nút Bạc (đạt mốc $100 000$ người đăng ký, _làm tròn kết quả đến hàng đơn vị_)?
  ],
  [$21$],
  loigiai: [
    #ppgiai[
      - Đây là bài toán thực tế vận dụng mô hình tăng trưởng và suy giảm kép trên cùng một chu kỳ.
      - Gọi lượng ban đầu là $A$. Qua mỗi chu kỳ, đại lượng sụt giảm $a%$ rồi lập tức tăng trưởng $b%$ trên nền số lượng vừa giảm.
      - Sau chu kỳ thứ nhất, đại lượng là: $A_1 = A dot (1 - a%) dot (1 + b%)$.
      - Sau $n$ chu kỳ, ta thu được cấp số nhân có số hạng tổng quát:
        $ A_n = A dot q^n quad "với công bội " q = (1 - a%) dot (1 + b%) $
    ]

    #align(center)[
      #cetz.canvas(length: 0.5cm, {
        import cetz.draw: *
        // Hệ trục tọa độ
        line((-1, 0), (25, 0), mark: (end: ">"), stroke: 1pt)
        content((25, -0.5), $n$ + " (tháng)", anchor: "north")
        line((0, -1), (0, 13), mark: (end: ">"), stroke: 1pt)
        content((-0.4, 13), $u_n$ + " (chục nghìn sub)", anchor: "east")
        content((-0.3, -0.3), $O$)

        // Đồ thị u_n = 5 * 1.035^n
        let pts = ()
        for i in range(0, 240) {
          let x = i / 10
          pts.push((x, 5 * calc.pow(1.035, x)))
        }
        line(..pts, stroke: (paint: rgb("FF0000"), thickness: 1.5pt))

        // Điểm khởi đầu (5 chục nghìn)
        circle((0, 5), radius: 2pt, fill: rgb("FF0000"))
        content((-0.2, 5), text(weight: "bold")[$50$], anchor: "east")

        // Đường mục tiêu 10 chục nghìn (100k)
        line((-0.5, 10), (25, 10), stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
        content((8, 10.6), [Ngưỡng Nút Bạc ($100 000$ sub)], fill: blue)
        content((-0.2, 10), text(weight: "bold")[$100$], anchor: "east", fill: blue)

        // Điểm cắt lý thuyết
        let n_val = 20.148
        line((n_val, 0), (n_val, 10), stroke: (dash: "dashed", paint: gray))
        content((n_val, -0.6), $20","14$)
        circle((n_val, 10), radius: 2pt, fill: blue)

        // Điểm thực tế (n=21)
        let y21 = 5 * calc.pow(1.035, 21)
        line((21, 0), (21, y21), stroke: (dash: "dashed", paint: rgb("008080"), thickness: 1.2pt))
        content((21.8, -0.6), text(weight: "bold")[$21$], fill: rgb("008080"))
        circle((21, y21), radius: 2pt, fill: rgb("008080"))
      })
    ]

    *Phân tích và giải chi tiết từng bước:*
    - Gọi $u_n$ là số lượng người đăng ký kênh sau $n$ tháng ($n in NN^*$). Số lượng ban đầu quy đổi ra "nghìn" là $u_0 = 50$ (tức $50 000$).
    - Trong một tháng, lượng người đăng ký trải qua hai biến động:
      + *Giai đoạn 1 (Quét tài khoản ảo):* Giảm $10%$, tức là nhân với hệ số $(100% - 10%) = 0","9$.
      + *Giai đoạn 2 (Người dùng mới):* Tăng $15%$ so với số lượng vừa sụt giảm, tức là nhân tiếp với hệ số $(100% + 15%) = 1","15$.
    - Tổng hợp lại, sau mỗi tháng trôi qua, lượng người đăng ký thực tế tăng theo công bội:
      $ q = 0","9 dot 1","15 = 1","035 $
      _(Thực tế kênh chỉ tăng $3","5%$ mỗi tháng, không phải $15% - 10% = 5%$)._
    - Ta có công thức tính số lượng người đăng ký ở tháng thứ $n$ là:
      $ u_n = u_0 dot q^n = 50 dot (1","035)^n $
    - Để kênh nhận được Nút Bạc, lượng người đăng ký phải đạt tối thiểu $100 000$ (tức là $100$). Ta thiết lập bất phương trình:
      $ u_n >= 100 <=> 50 dot (1","035)^n >= 100 $
      $ <=> (1","035)^n >= 2 $
    - Lấy logarit cơ số $1","035$ hai vế (vì $1","035 > 1$ nên giữ nguyên chiều bất phương trình):
      $ n >= log_(1","035) 2 $
    - Sử dụng máy tính cầm tay, ta được:
      $ n >= 20","1487... $
    - Do $n$ phải là số nguyên dương (số tháng trọn vẹn), ta cần tìm số nguyên nhỏ nhất lớn hơn $20","1487$.
    - Vậy ta chọn $n = 21$. Suy ra, sau $21$ tháng thì kênh sẽ chính thức đạt mốc $100 000$ lượt đăng ký.

    #meo[
      Khi giải bài toán có điều kiện "sau ít nhất bao nhiêu kỳ", kết quả logarit thường ra số thập phân. Ta luôn luôn phải *làm tròn lên* (hàm trần - ceiling) số nguyên gần nhất. Ví dụ $n >= 20","14$ thì dù phần thập phân rất nhỏ, ta vẫn phải chọn $n=21$ vì ở tháng thứ $20$ mục tiêu vẫn chưa hoàn thành!
    ]
  ],
)
#tln(
  [
    Tại một trang trại chăn nuôi thủy sản, ban đầu người chủ thả $10 \ 000$ con cá giống vào hồ. Hàng năm, quy trình chăn nuôi được chia làm hai đợt rõ rệt. Đợt 1 là mùa thu hoạch tỉa, nhà vườn tiến hành đánh bắt làm giảm $20%$ tổng đàn cá hiện có trong hồ. Ngay sau đó bước vào đợt 2 là mùa sinh sản và thả bổ sung giống, lượng cá trong hồ tăng thêm $30%$ so với số lượng vừa còn lại sau đợt thu hoạch. Biết rằng chu kỳ này lặp lại đều đặn hàng năm và tỉ lệ hao hụt do các nguyên nhân khác là không đáng kể. Hỏi sau ít nhất bao nhiêu năm thì tổng đàn cá trong hồ vượt mức $20 \ 000$ con?
  ],
  [$18$],
  loigiai: [
    #ppgiai[
      - Bài toán thực tế sử dụng mô hình cấp số nhân với sự biến thiên kép (tăng/giảm liên tiếp) trong cùng một chu kỳ.
      - Gọi số lượng ban đầu là $A$. Trong mỗi chu kỳ, nếu đại lượng giảm $a%$ rồi lập tức tăng $b%$ trên nền số lượng vừa sụt giảm, thì đại lượng mới sau một chu kỳ là:
        $ A_1 = A dot (1 - a%) dot (1 + b%) $
      - Sau $n$ chu kỳ, số lượng tuân theo công thức cấp số nhân:
        $ A_n = A dot q^n quad "với công bội " q = (1 - a%) dot (1 + b%) $
    ]

    #align(center)[
      #cetz.canvas(length: 0.5cm, {
        import cetz.draw: *
        // Hệ trục tọa độ
        line((-1, 0), (22, 0), mark: (end: ">"), stroke: 1pt)
        content((22, -0.6), $n$ + " (năm)", anchor: "north")
        line((0, -1), (0, 25), mark: (end: ">"), stroke: 1pt)
        content((-0.4, 25), $u_n$ + " (nghìn con)", anchor: "east")
        content((-0.3, -0.4), $O$)

        // Đồ thị u_n = 10 * 1.04^n
        let pts = ()
        for i in range(0, 210) {
          let x = i / 10
          pts.push((x, 10 * calc.pow(1.04, x)))
        }
        line(..pts, stroke: (paint: rgb("FF8C00"), thickness: 1.5pt))

        // Điểm khởi đầu (10 nghìn)
        circle((0, 10), radius: 2pt, fill: rgb("FF8C00"))
        content((-0.2, 10), text(weight: "bold")[$10$], anchor: "east")

        // Đường mục tiêu (20 nghìn)
        line((-0.5, 20), (22, 20), stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
        content((7, 20.7), [Ngưỡng $20 \ 000$ con], fill: blue)
        content((-0.2, 20), text(weight: "bold")[$20$], anchor: "east", fill: blue)

        // Điểm cắt lý thuyết
        let n_val = 17.67
        line((n_val, 0), (n_val, 20), stroke: (dash: "dashed", paint: gray))
        content((n_val, -0.6), $17","67$)
        circle((n_val, 20), radius: 2pt, fill: blue)

        // Điểm thực tế (n=18)
        let y18 = 10 * calc.pow(1.04, 18)
        line((18, 0), (18, y18), stroke: (dash: "dashed", paint: rgb("008080"), thickness: 1.2pt))
        content((18.8, -0.6), text(weight: "bold")[$18$], fill: rgb("008080"))
        circle((18, y18), radius: 2pt, fill: rgb("008080"))
      })
    ]

    *Phân tích và giải chi tiết từng bước:*
    - Gọi $u_n$ là tổng số lượng cá trong hồ sau $n$ năm ($n in NN^*$). Số lượng ban đầu quy đổi ra "nghìn con" là $u_0 = 10$ (tương đương $10 \ 000$ con).
    - Trong mỗi năm, số cá trải qua hai đợt biến động liên tiếp:
      + *Giai đoạn 1 (Thu hoạch):* Lượng cá giảm $20%$, tức là nhân với hệ số $(100% - 20%) = 80% = 0","8$.
      + *Giai đoạn 2 (Sinh sản & Thả thêm):* Lượng cá tăng $30%$ so với phần còn lại, tức là nhân tiếp với hệ số $(100% + 30%) = 130% = 1","3$.
    - Tổng hợp lại, sau mỗi năm, đàn cá biến đổi theo một tỷ lệ chung (công bội) là:
      $ q = 0","8 dot 1","3 = 1","04 $
    - Dãy số $(u_n)$ là một cấp số nhân. Công thức tính tổng đàn cá ở năm thứ $n$ là:
      $ u_n = u_0 dot q^n = 10 dot (1","04)^n $
    - Đề bài yêu cầu tìm số năm tối thiểu để lượng cá vượt mức $20 \ 000$ con (tương ứng với $20$ nghìn con), ta thiết lập bất phương trình:
      $ u_n > 20 <=> 10 dot (1","04)^n > 20 $
      $ <=> (1","04)^n > 2 $
    - Lấy logarit cơ số $1","04$ hai vế (vì $1","04 > 1$ nên giữ nguyên chiều bất phương trình):
      $ n > log_(1","04) 2 $
    - Bấm máy tính, ta được kết quả:
      $ n > 17","6729... $
    - Vì $n$ phải là số nguyên dương (đại diện cho số năm trọn vẹn) và bài toán hỏi "sau ít nhất bao nhiêu năm", ta cần tìm số nguyên nhỏ nhất lớn hơn $17","67$.
    - Vậy ta chọn $n = 18$. Nghĩa là sau $18$ năm thì đàn cá sẽ vượt mức $20 \ 000$ con.

    #luuy[
      Cần đặc biệt lưu ý học sinh về "Ảo giác %". Nhìn lướt qua bài toán: giảm $20%$ rồi lại tăng $30%$, nhiều người sẽ nhầm tưởng rằng mỗi năm đàn cá tăng $10%$ ($30% - 20% = 10%$). Tuy nhiên, phép toán phần trăm không có tính chất cộng trừ trực tiếp. Sự sụt giảm $20%$ đã làm *giảm nền cơ sở* trước khi tăng. Do đó, mức tăng trưởng thực tế mỗi năm chỉ là $4%$ (vì $0,8 times 1,3 = 1,04$). Việc phân tích rõ ràng công bội $q$ giúp tránh sai lầm chết người này!
    ]
  ],
)
// CÂU SÁNG TÁC 1: BÀI TOÁN BẢO TỒN RỪNG
#tln(
  [
    Một khu bảo tồn sinh thái hiện có $20 000$ hecta rừng nguyên sinh. Do tác động của biến đổi khí hậu, mỗi năm khu rừng trải qua một mùa hanh khô kéo dài. Qua thống kê nhiều năm, các chuyên gia lâm nghiệp nhận thấy: sau mỗi mùa hanh khô, nạn cháy rừng và hạn hán làm mất đi $8%$ diện tích rừng hiện có. Tuy nhiên, ngay sau đó vào mùa mưa, nhờ nỗ lực trồng rừng thay thế và sự phục hồi tự nhiên, diện tích rừng lại tăng thêm $12%$ so với diện tích vừa còn sót lại. Giả sử chu kỳ này lặp lại đều đặn hàng năm. Hỏi sau ít nhất bao nhiêu năm thì diện tích rừng của khu bảo tồn này phục hồi và vượt mức $25 000$ hecta?
  ],
  [$8$],
  loigiai: [
    #ppgiai[
      - Đây là dạng toán tăng giảm liên tiếp trong cùng một chu kỳ (kép).
      - Diện tích rừng ban đầu là $A_0$.
      - Hệ số thay đổi sau mỗi năm (bao gồm cả giảm và tăng) là công bội $q$:
        $ q = (1 - a%) dot (1 + b%) $
      - Diện tích rừng sau $n$ năm lập thành cấp số nhân: $A_n = A_0 dot q^n$.
      - Giải bất phương trình mũ $A_0 dot q^n > M$ để tìm $n$.
    ]

    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        // Hệ trục tọa độ
        line((-1, 0), (12, 0), mark: (end: ">"), stroke: 1pt)
        content((12, -0.6), $n$ + " (năm)", anchor: "north")
        line((0, -1), (0, 32), mark: (end: ">"), stroke: 1pt)
        content((-0.4, 32), $u_n$ + " (nghìn ha)", anchor: "east")
        content((-0.3, -0.4), $O$)

        // Đồ thị u_n = 20 * 1.0304^n
        let pts = ()
        for i in range(0, 110) {
          let x = i / 10
          pts.push((x, 20 * calc.pow(1.0304, x)))
        }
        line(..pts, stroke: (paint: rgb("2E8B57"), thickness: 1.5pt))

        // Điểm khởi đầu (20 nghìn ha)
        circle((0, 20), radius: 2pt, fill: rgb("2E8B57"))
        content((-0.2, 20), text(weight: "bold")[$20$], anchor: "east")

        // Đường mục tiêu (25 nghìn ha)
        line((-0.5, 25), (12, 25), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((4, 25.8), [Ngưỡng $25 000$ ha], fill: red)
        content((-0.2, 25), text(weight: "bold")[$25$], anchor: "east", fill: red)

        // Điểm cắt lý thuyết
        let n_val = 7.43
        line((n_val, 0), (n_val, 25), stroke: (dash: "dashed", paint: gray))
        content((n_val, -0.6), $7","43$)
        circle((n_val, 25), radius: 2pt, fill: red)

        // Điểm thực tế (n=8)
        let y8 = 20 * calc.pow(1.0304, 8)
        line((8, 0), (8, y8), stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
        content((8.6, -0.6), text(weight: "bold")[$8$], fill: blue)
        circle((8, y8), radius: 2pt, fill: blue)
      })
    ]

    *Phân tích và giải chi tiết từng bước:*
    - Gọi $u_n$ là diện tích rừng sau $n$ năm ($n in NN^*$). Ta quy đổi đơn vị sang "nghìn hecta", suy ra $u_0 = 20$.
    - Trong mỗi năm, diện tích rừng trải qua hai giai đoạn:
      + *Mùa hanh khô (Giảm):* Mất đi $8%$, phần còn lại được nhân với hệ số $(100% - 8%) = 0","92$.
      + *Mùa mưa (Tăng):* Tăng thêm $12%$ trên nền diện tích vừa giảm, tức là nhân tiếp với hệ số $(100% + 12%) = 1","12$.
    - Công bội $q$ biểu diễn sự thay đổi sau một năm trọn vẹn là:
      $ q = 0","92 dot 1","12 = 1","0304 $
    - Ta có công thức tính diện tích rừng ở năm thứ $n$ là:
      $ u_n = u_0 dot q^n = 20 dot (1","0304)^n $
    - Để diện tích rừng vượt mức $25 000$ hecta (tức là $25$), ta có bất phương trình:
      $ 20 dot (1","0304)^n > 25 $
      $ <=> (1","0304)^n > 25/20 = 1","25 $
    - Lấy logarit cơ số $1","0304$ hai vế:
      $ n > log_(1","0304) (1","25) $
    - Bấm máy tính, ta thu được:
      $ n > 7","433... $
    - Vì $n$ phải là số nguyên dương (đại diện cho số năm), ta chọn số nguyên nhỏ nhất thỏa mãn là $n = 8$.
    - Vậy sau ít nhất *$8$* năm thì diện tích rừng sẽ vượt mức $25 000$ hecta.

    #nhanxet[
      Để ý rằng mức tăng $12%$ dường như bù đắp dư sức cho mức giảm $8%$ (chênh lệch $4%$). Nhưng thực tế hệ số $q = 1,0304$ cho thấy rừng chỉ tăng khoảng $3,04%$ mỗi năm. Việc giảm đi trước làm cho "cái gốc" để tăng lên bị bé lại, nên tốc độ phục hồi sẽ chậm hơn trực giác suy nghĩ thông thường.
    ]
  ],
)

// CÂU SÁNG TÁC 2: BÀI TOÁN QUẢN LÝ DỮ LIỆU ĐÁM MÁY
#tln(
  [
    Một công ty cung cấp dịch vụ lưu trữ đám mây (Cloud Storage) hiện đang lưu trữ tổng cộng $5000$ Terabyte (TB) dữ liệu người dùng. Để tối ưu hóa không gian máy chủ, công ty thiết lập một quy trình tự động quét và dọn dẹp theo từng quý ($3$ tháng một lần). Ở đầu mỗi quý, hệ thống tự động xóa đi $15%$ dữ liệu rác, tệp tin tạm và tài khoản không hoạt động. Tuy nhiên, trong suốt phần còn lại của quý đó, lượng khách hàng mới đăng ký và tải dữ liệu lên làm cho tổng dung lượng tăng thêm $25%$ so với lượng dữ liệu vừa còn lại ngay sau khi dọn dẹp. Hỏi sau ít nhất bao nhiêu quý thì tổng dung lượng dữ liệu trên máy chủ của công ty này sẽ chạm ngưỡng $10 000$ TB (gấp đôi sức chứa ban đầu)?
  ],
  [$12$],
  loigiai: [
    #ppgiai[
      - Bài toán mô hình hóa sự tăng trưởng dữ liệu với hai tác động ngược chiều trong một khoảng thời gian (một quý).
      - Dữ liệu bị xóa $a%$ $=> "Nhân với " (1 - a%)$.
      - Dữ liệu tăng thêm $b%$ $=> "Nhân với " (1 + b%)$.
      - Công bội của chu kỳ là $q = (1 - a%) dot (1 + b%)$.
      - Áp dụng công thức $A_n = A_0 dot q^n$ để thiết lập bất phương trình tìm số kỳ $n$.
    ]

    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        // Hệ trục tọa độ
        line((-1, 0), (16, 0), mark: (end: ">"), stroke: 1pt)
        content((16, -0.6), $n$ + " (quý)", anchor: "north")
        line((0, -1), (0, 15), mark: (end: ">"), stroke: 1pt)
        content((-0.4, 15), $u_n$ + " (nghìn TB)", anchor: "east")
        content((-0.3, -0.4), $O$)

        // Đồ thị u_n = 5 * 1.0625^n
        let pts = ()
        for i in range(0, 150) {
          let x = i / 10
          pts.push((x, 5 * calc.pow(1.0625, x)))
        }
        line(..pts, stroke: (paint: rgb("8A2BE2"), thickness: 1.5pt))

        // Điểm khởi đầu (5 nghìn TB)
        circle((0, 5), radius: 2pt, fill: rgb("8A2BE2"))
        content((-0.2, 5), text(weight: "bold")[$5$], anchor: "east")

        // Đường mục tiêu (10 nghìn TB)
        line((-0.5, 10), (16, 10), stroke: (dash: "dashed", paint: orange, thickness: 1.2pt))
        content((6, 10.6), [Ngưỡng $10 000$ TB], fill: orange)
        content((-0.2, 10), text(weight: "bold")[$10$], anchor: "east", fill: orange)

        // Điểm cắt lý thuyết
        let n_val = 11.43
        line((n_val, 0), (n_val, 10), stroke: (dash: "dashed", paint: gray))
        content((n_val, -0.6), $11","43$)
        circle((n_val, 10), radius: 2pt, fill: orange)

        // Điểm thực tế (n=12)
        let y12 = 5 * calc.pow(1.0625, 12)
        line((12, 0), (12, y12), stroke: (dash: "dashed", paint: rgb("0000CD"), thickness: 1.2pt))
        content((12.6, -0.6), text(weight: "bold")[$12$], fill: rgb("0000CD"))
        circle((12, y12), radius: 2pt, fill: rgb("0000CD"))
      })
    ]

    *Phân tích và giải chi tiết từng bước:*
    - Gọi $u_n$ là lượng dữ liệu lưu trữ sau $n$ quý ($n in NN^*$). Sử dụng đơn vị "nghìn TB", ta có $u_0 = 5$.
    - Xét sự biến đổi trong một quý:
      + *Giai đoạn dọn dẹp:* Giảm $15%$, tương đương nhân với $(1 - 0","15) = 0","85$.
      + *Giai đoạn tải lên:* Tăng $25%$ trên số liệu mới, tương đương nhân với $(1 + 0","25) = 1","25$.
    - Công bội $q$ đại diện cho sự tăng trưởng tịnh tiến sau một quý là:
      $ q = 0","85 dot 1","25 = 1","0625 $
    - Lượng dữ liệu trên máy chủ sau $n$ quý được tính bởi:
      $ u_n = 5 dot (1","0625)^n $
    - Ta cần tìm $n$ sao cho lượng dữ liệu chạm ngưỡng $10 000$ TB (tức là $10$):
      $ 5 dot (1","0625)^n >= 10 $
      $ <=> (1","0625)^n >= 2 $
    - Giải bất phương trình lôgarit cơ số $1","0625$:
      $ n >= log_(1","0625) 2 $
    - Bấm máy tính tính giá trị xấp xỉ:
      $ n >= 11","433... $
    - Vì $n$ phải là số nguyên đại diện cho số quý, ta chọn $n$ nguyên nhỏ nhất lớn hơn hoặc bằng $11","433$.
    - Do đó, $n = 12$.
    - Kết luận: Cần ít nhất *$12$* quý (tương đương $3$ năm) để hệ thống máy chủ bị đẩy lên mức $10 000$ TB.

    #luuy[
      Dữ kiện "3 tháng một lần" chỉ là thông tin gây nhiễu để giải thích chữ "Quý". Học sinh khi đặt $n$ là "số quý" thì không cần chia hay nhân $n$ với $3$. Việc hiểu rõ đại lượng $n$ đại diện cho chu kỳ nào (năm, tháng, quý) là rất quan trọng để không bị kết luận nhầm.
    ]
  ],
)

// CÂU SÁNG TÁC 3: BÀI TOÁN QUẢN LÝ TỒN KHO CHUỖI CUNG ỨNG
#tln(
  [
    Một tổng kho phân phối thiết bị điện tử hiện đang lưu trữ $100 000$ sản phẩm. Nhằm tối ưu hóa dòng tiền và không gian lưu trữ, ban giám đốc áp dụng mô hình xuất – nhập kho theo chu kỳ mỗi tháng. Dữ liệu phân tích cho thấy: trong nửa đầu tháng, hệ thống đại lý sẽ lấy đi $20%$ số lượng sản phẩm hiện có trong kho. Để bù đắp, vào nửa cuối tháng, tổng kho sẽ nhập một lô hàng mới có số lượng bằng $30%$ số sản phẩm vừa còn lại sau đợt xuất kho. Giả sử mô hình biến động này lặp lại đều đặn mỗi tháng và sức mua của thị trường không đổi. Hỏi sau ít nhất bao nhiêu tháng thì tổng lượng hàng tồn trong kho sẽ vượt mức $150 000$ sản phẩm?
  ],
  [$11$],
  loigiai: [
    #ppgiai[
      - Bài toán vận dụng mô hình tăng trưởng/suy giảm kép trên một chu kỳ kinh doanh.
      - Gọi lượng hàng ban đầu là $A_0$. Qua mỗi chu kỳ, nếu lượng hàng giảm $a%$ rồi lập tức nhập thêm $b%$ dựa trên lượng vừa giảm, thì hệ số thay đổi của toàn chu kỳ là:
        $ q = (1 - a%) dot (1 + b%) $
      - Số lượng hàng sau $n$ tháng sẽ tạo thành một cấp số nhân: $u_n = A_0 dot q^n$.
      - Lập bất phương trình $u_n > M$ và dùng logarit cơ số $q$ để giải tìm $n$.
    ]

    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        // Hệ trục tọa độ
        line((-1, 0), (16, 0), mark: (end: ">"), stroke: 1pt)
        content((16, -0.6), $n$ + " (tháng)", anchor: "north")
        line((0, -1), (0, 18), mark: (end: ">"), stroke: 1pt)
        content((-0.4, 18), $u_n$ + " (chục nghìn SP)", anchor: "east")
        content((-0.3, -0.4), $O$)

        // Đồ thị u_n = 10 * 1.04^n
        let pts = ()
        for i in range(0, 150) {
          let x = i / 10
          pts.push((x, 10 * calc.pow(1.04, x)))
        }
        line(..pts, stroke: (paint: rgb("FF4500"), thickness: 1.5pt))

        // Điểm khởi đầu (10 chục nghìn = 100k)
        circle((0, 10), radius: 2pt, fill: rgb("FF4500"))
        content((-0.2, 10), text(weight: "bold")[$10$], anchor: "east")

        // Đường mục tiêu (15 chục nghìn = 150k)
        line((-0.5, 15), (16, 15), stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
        content((6, 15.6), [Ngưỡng $150 000$ SP], fill: blue)
        content((-0.2, 15), text(weight: "bold")[$15$], anchor: "east", fill: blue)

        // Điểm cắt lý thuyết
        let n_val = 10.34
        line((n_val, 0), (n_val, 15), stroke: (dash: "dashed", paint: gray))
        content((n_val, -0.6), $10","34$)
        circle((n_val, 15), radius: 2pt, fill: blue)

        // Điểm thực tế (n=11)
        let y11 = 10 * calc.pow(1.04, 11)
        line((11, 0), (11, y11), stroke: (dash: "dashed", paint: rgb("008080"), thickness: 1.2pt))
        content((11.6, -0.6), text(weight: "bold")[$11$], fill: rgb("008080"))
        circle((11, y11), radius: 2pt, fill: rgb("008080"))
      })
    ]

    *Phân tích và giải chi tiết từng bước:*
    - Gọi $u_n$ là lượng sản phẩm tồn kho sau $n$ tháng ($n in NN^*$). Quy đổi đơn vị sang "chục nghìn sản phẩm", ta có $u_0 = 10$.
    - Trong mỗi tháng, lượng tồn kho trải qua hai giai đoạn biến động:
      + *Xuất kho (Giảm):* Mất đi $20%$, số lượng còn lại tương ứng với hệ số $(100% - 20%) = 0","8$.
      + *Nhập kho (Tăng):* Tăng thêm $30%$ trên nền lượng hàng vừa bị rút đi, tương ứng hệ số $(100% + 30%) = 1","3$.
    - Như vậy, sau mỗi tháng trọn vẹn, hệ thống tồn kho biến đổi theo công bội:
      $ q = 0","8 dot 1","3 = 1","04 $
      _(Mỗi tháng kho hàng chỉ thực sự phình to thêm $4%$)._
    - Lượng hàng trong kho ở tháng thứ $n$ tuân theo công thức:
      $ u_n = u_0 dot q^n = 10 dot (1","04)^n $
    - Để tổng lượng hàng vượt mức $150 000$ (tức là $15$ chục nghìn), ta thiết lập bất phương trình:
      $ 10 dot (1","04)^n > 15 <=> (1","04)^n > 1","5 $
    - Giải bất phương trình mũ (lấy logarit cơ số $1","04$ hai vế, giữ nguyên chiều do $1","04 > 1$):
      $ n > log_(1","04) (1","5) $
    - Sử dụng máy tính cầm tay, ta được:
      $ n > 10","338... $
    - Vì $n$ phải là số nguyên dương (đại diện cho số tháng trọn vẹn), ta cần lấy số nguyên nhỏ nhất lớn hơn $10","338$.
    - Do đó, ta chọn $n = 11$.
    - Kết luận: Cần ít nhất *$11$* tháng để lượng tồn kho của công ty vượt mốc $150 000$ sản phẩm.

    #meo[
      Khi thiết lập công bội $q$, cần đọc kỹ câu chữ "tăng thêm ... % so với phần *còn lại*". Khác biệt ở đây là lượng tăng $30%$ không tính trên mốc $100 000$ ban đầu, mà tính trên $80 000$ hàng còn lại. Đây là điểm mấu chốt để phân biệt bài toán lãi kép và bài toán tăng trưởng đơn thông thường.
    ]
  ],
)

// CÂU SÁNG TÁC 4: BÀI TOÁN DƯỢC ĐỘNG HỌC (ĐIỀU TRỊ KHÁNG SINH)
#tln(
  [
    Một bệnh nhân bị nhiễm một loại vi khuẩn với số lượng ban đầu trong cơ thể được xác định là $500 000$ cá thể. Bác sĩ chỉ định phác đồ điều trị bằng kháng sinh đặc hiệu, mỗi ngày uống một liều. Các nghiên cứu dược động học cho thấy: mỗi liều kháng sinh khi đưa vào cơ thể sẽ tiêu diệt được $50%$ số lượng vi khuẩn hiện có. Tuy nhiên, trong thời gian giữa hai liều thuốc, do đặc tính sinh học, lượng vi khuẩn sống sót sẽ sinh sôi và tăng thêm $10%$ so với số lượng ngay sau khi bị tiêu diệt. Giả sử quá trình này lặp lại đều đặn mỗi ngày. Hỏi sau ít nhất bao nhiêu ngày (tương ứng với bao nhiêu liều thuốc) thì số lượng vi khuẩn trong cơ thể bệnh nhân giảm xuống dưới mức an toàn là $10 000$ cá thể?
  ],
  [$7$],
  loigiai: [
    #ppgiai[
      - Bài toán sử dụng cấp số nhân lùi vô hạn có điều kiện (sự suy giảm có xen kẽ phục hồi).
      - Số lượng ban đầu $A_0$.
      - Khi bị tiêu diệt $a%$ rồi sinh sôi $b%$ trên lượng sống sót, hệ số sinh tồn sau mỗi ngày là:
        $ q = (1 - a%) dot (1 + b%) $
      - Số vi khuẩn sau $n$ ngày là $u_n = A_0 dot q^n$.
      - Thiết lập bất phương trình $u_n < M$ để tìm $n$. Lưu ý bắt buộc đảo chiều bất đẳng thức khi lấy logarit nếu cơ số $0 < q < 1$.
    ]

    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        // Hệ trục tọa độ
        line((-1, 0), (10, 0), mark: (end: ">"), stroke: 1pt)
        content((10, -0.6), $n$ + " (ngày)", anchor: "north")
        line((0, -1), (0, 7), mark: (end: ">"), stroke: 1pt)
        content((-0.4, 7), $u_n$ + " (trăm nghìn)", anchor: "east")
        content((-0.3, -0.4), $O$)

        // Đồ thị u_n = 5 * 0.55^n (trục y quy đổi ra trăm nghìn)
        let pts = ()
        for i in range(0, 90) {
          let x = i / 10
          pts.push((x, 5 * calc.pow(0.55, x)))
        }
        line(..pts, stroke: (paint: rgb("8A2BE2"), thickness: 1.5pt))

        // Điểm khởi đầu (5 trăm nghìn)
        circle((0, 5), radius: 2pt, fill: rgb("8A2BE2"))
        content((0.2, 5), text(weight: "bold")[$5$], anchor: "south-west")

        // Đường mục tiêu (0.1 trăm nghìn = 10 nghìn)
        line((-0.5, 0.1), (10, 0.1), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        content((5, 0.7), [Ngưỡng an toàn ($10 000$)], fill: red)
        content((-0.2, 0.1), text(weight: "bold")[$0","1$], anchor: "east", fill: red)

        // Điểm cắt lý thuyết
        let n_val = 6.549
        line((n_val, 0), (n_val, 0.1), stroke: (dash: "dashed", paint: gray))
        content((n_val, -0.6), $6","55$)
        circle((n_val, 0.1), radius: 2pt, fill: red)

        // Điểm thực tế (n=7)
        let y7 = 5 * calc.pow(0.55, 7)
        line((7, 0), (7, y7), stroke: (dash: "dashed", paint: blue, thickness: 1.2pt))
        content((7.3, -0.6), text(weight: "bold")[$7$], fill: blue)
        circle((7, y7), radius: 2pt, fill: blue)
      })
    ]

    *Phân tích và giải chi tiết từng bước:*
    - Gọi $u_n$ là lượng vi khuẩn còn lại sau $n$ ngày điều trị ($n in NN^*$). Ta chọn đơn vị tính là "trăm nghìn cá thể", suy ra $u_0 = 5$.
    - Biến động của số lượng vi khuẩn trong một ngày gồm hai pha:
      + *Pha tiêu diệt:* Giảm đi $50%$, lượng vi khuẩn sống sót nhân với hệ số $(100% - 50%) = 0","5$.
      + *Pha sinh sôi:* Tăng thêm $10%$ trên nền số vi khuẩn sống sót, tương ứng nhân với hệ số $(100% + 10%) = 1","1$.
    - Công bội $q$ biểu diễn tỷ lệ vi khuẩn còn lại sau một ngày trọn vẹn là:
      $ q = 0","5 dot 1","1 = 0","55 $
      _(Thực chất mỗi ngày phác đồ chỉ làm giảm được $45%$ tổng lượng vi khuẩn)._
    - Hàm số lượng vi khuẩn ở ngày thứ $n$ là:
      $ u_n = 5 dot (0","55)^n $
    - Bác sĩ yêu cầu hạ lượng vi khuẩn xuống dưới mức an toàn là $10 000$ cá thể (tức là $0","1$ trăm nghìn). Ta có bất phương trình:
      $ 5 dot (0","55)^n < 0","1 <=> (0","55)^n < 0","02 $
    - Lấy logarit cơ số $0","55$ hai vế. *Chú ý: do cơ số $0 < 0","55 < 1$, ta bắt buộc phải đảo chiều bất phương trình:*
      $ n > log_(0","55) (0","02) $
    - Dùng máy tính tính giá trị xấp xỉ:
      $ n > 6","549... $
    - Do $n$ phải là số nguyên dương để tương ứng với số liều thuốc trọn vẹn, ta chọn số nguyên nhỏ nhất lớn hơn $6","549$.
    - Suy ra $n = 7$.
    - Kết luận: Cần ít nhất *$7$* ngày (tương ứng với $7$ liều thuốc) để số vi khuẩn hạ xuống dưới ngưỡng an toàn.

    #luuy[
      Cần hết sức cẩn thận khi giải bất phương trình mũ dạng $q^n < C$. Lỗi sai thường gặp nhất của học sinh là khi bấm máy ra $6","549$, các em lại viết $n < 6","549$ dẫn đến việc chọn đáp án $n=6$. Hãy luôn nhớ quy tắc bất biến: "Nếu cơ số nhỏ hơn 1, lập tức đảo chiều bất đẳng thức".
    ]
  ],
)
// Câu 1
#tn(
  [Giả sử điểm tình cảm $P(t)$ của Nam dành cho Thư tại thời điểm $t$ ngày kể từ lúc chia tay ($t >= 0$) biến thiên liên tục. Qua nghiên cứu tâm lý, tốc độ lãng quên tự nhiên tỉ lệ thuận với lượng tình cảm đang có với hệ số $0","2$ (điểm/ngày). Đồng thời, những kỷ niệm hiển thị trên mạng xã hội giúp hâm nóng tình cảm với tốc độ không đổi $2$ (điểm/ngày). Phương trình vi phân nào sau đây mô tả đúng tốc độ biến thiên điểm tình cảm $P(t)$ của Nam?],
  (
    [$P'(t) = 0","2 P(t) + 2$],
    [$P'(t) = -0","2 P(t) - 2$],
    [$P'(t) = 0","2 P(t) - 2$],
    True([$P'(t) = -0","2 P(t) + 2$])
  ),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    // Thùng chứa tình cảm
    rect((-1.5, 0), (1.5, 3), radius: 0.2, stroke: (paint: blue, thickness: 1.5pt))
    rect((-1.5, 0), (1.5, 2), radius: 0.2, fill: rgb("ffcccc"), stroke: none)
    content((0, 1), text(weight: "bold", fill: red)[$P(t)$])
    
    // Nguồn thêm vào (hâm nóng)
    line((-3, 2.5), (-1.6, 2.5), mark: (end: ">"), stroke: (paint: green, thickness: 1.5pt))
    content((-2.3, 3), [Nhớ kỉ niệm], fill: green, size: 9pt)
    content((-2.3, 2), [$+2$], fill: green, weight: "bold")

    // Nguồn vơi đi (lãng quên)
    line((1.6, 0.5), (3, 0.5), mark: (end: ">"), stroke: (paint: gray, thickness: 1.5pt))
    content((2.3, 1), [Lãng quên], fill: gray, size: 9pt)
    content((2.3, 0), [$-0","2 P(t)$], fill: gray, weight: "bold")
  }),
  fig-pos: "center",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Tốc độ biến thiên của một đại lượng $P(t)$ chính là đạo hàm bậc nhất $P'(t)$.
      - Tốc độ này bằng tổng các yếu tố làm tăng đại lượng trừ đi tổng các yếu tố làm giảm đại lượng (mô hình bài toán bể chứa).
    ]
    *Phân tích các yếu tố:*
    - Yếu tố làm giảm (lãng quên): Tỉ lệ thuận với $P(t)$ theo hệ số $0","2$, tức là $-0","2 P(t)$.
    - Yếu tố làm tăng (hâm nóng): Tốc độ không đổi là $+2$.
    - Do đó, phương trình mô tả tốc độ biến thiên điểm tình cảm là:
      $ P'(t) = -0","2 P(t) + 2 $
    Vậy chọn đáp án *D*.
    
    #luuy[
      Dấu âm thể hiện sự suy giảm (tiêu hao), dấu dương thể hiện sự gia tăng (tích lũy). Cần phân biệt rõ tốc độ thay đổi liên tục ($P'(t)$) và sự thay đổi rời rạc ($Delta P$).
    ]
  ]
)

// Câu 2
#ds(
  [Điểm tình cảm của Nam dành cho Thư sau $t$ ngày chia tay ($t >= 0$) biến thiên liên tục và thỏa mãn phương trình vi phân $P'(t) = -0","2 P(t) + 2$. Biết rằng ngay tại thời điểm chia tay, điểm tình cảm là $P(0) = 100$.],
  (
    True([Hàm số thể hiện điểm tình cảm của Nam theo thời gian là $P(t) = 10 + 90 e^(-0","2 t)$.]),
    [Điểm tình cảm của Nam luôn giảm nhưng có thể tụt về mức $0$ điểm nếu thời gian đủ lâu ($t -> +oo$).],
    True([Sau đúng $5$ ngày, điểm tình cảm của Nam đã giảm đi hơn một nửa so với lúc vừa chia tay.]),
    [Tốc độ giảm tình cảm lớn nhất xảy ra vào thời điểm $t = 5$ ngày.]
  ),
  loigiai: [
    #ppgiai[
      - Giải phương trình vi phân tuyến tính cấp 1 dạng $y' = a y + b$ có nghiệm tổng quát $y(t) = -b/a + C e^(a t)$.
      - Tìm hằng số $C$ nhờ điều kiện ban đầu $P(0)$.
      - Khảo sát giới hạn $lim_(t -> +oo) P(t)$ để xét mức độ tiệm cận.
      - Tốc độ giảm là đại lượng $|P'(t)| = -P'(t)$. Hàm số suy giảm theo quy luật mũ sẽ có tốc độ biến thiên lớn nhất tại thời điểm ban đầu $t=0$.
    ]

    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        line((0, 0), (15, 0), mark: (end: ">"), stroke: 1pt)
        content((15, -0.6), $t$)
        line((0, 0), (0, 11), mark: (end: ">"), stroke: 1pt)
        content((-0.6, 11), $P(t)$)
        content((-0.4, -0.4), $O$)

        line((0, 1), (14, 1), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
        content((-0.6, 1), $10$, fill: gray)

        let pts = ()
        for i in range(0, 140) {
          let x = i / 10
          let y = 1 + 9 * calc.exp(-0.2 * x)
          pts.push((x, y))
        }
        line(..pts, stroke: (paint: red, thickness: 1.5pt))
        circle((0, 10), radius: 2.5pt, fill: red)
        content((-0.8, 10), $100$, fill: red)

        // Điểm t = 5
        let y5 = 1 + 9 * calc.exp(-1)
        line((5, 0), (5, y5), stroke: (dash: "dashed", paint: blue))
        line((0, y5), (5, y5), stroke: (dash: "dashed", paint: blue))
        circle((5, y5), radius: 2.5pt, fill: blue)
        content((5, -0.6), $5$, fill: blue)
        content((-1.2, y5), $43","1$, fill: blue)
      })
    ]

    - *Ý a) Đúng.* Phương trình $P'(t) = -0","2 P(t) + 2$ có nghiệm:
      $ P(t) = -2/(-0","2) + C e^(-0","2 t) = 10 + C e^(-0","2 t) $
      Tại $t = 0, P(0) = 100 => 10 + C e^0 = 100 => C = 90$.
      Vậy $P(t) = 10 + 90 e^(-0","2 t)$.
    - *Ý b) Sai.* Ta có giới hạn khi $t -> +oo$:
      $ lim_(t -> +oo) P(t) = lim_(t -> +oo) (10 + 90 e^(-0","2 t)) = 10 + 0 = 10 $
      Điểm tình cảm chỉ tiệm cận về mức $10$ điểm chứ không bao giờ tụt về $0$.
    - *Ý c) Đúng.* Sau $5$ ngày ($t = 5$), điểm tình cảm còn lại là:
      $ P(5) = 10 + 90 e^(-0","2 times 5) = 10 + 90 e^(-1) approx 10 + 90 times 0","3678 = 43","1 " (điểm)" $
      Vì $43","1 < 50$ (một nửa ban đầu), nên tình cảm đã giảm đi hơn một nửa.
    - *Ý d) Sai.* Tốc độ biến thiên là $P'(t) = -18 e^(-0","2 t)$. 
      Vì hàm $e^(-0","2 t)$ nghịch biến và luôn dương trên $[0; +oo)$, giá trị lớn nhất của $|P'(t)|$ (tốc độ giảm mạnh nhất) đạt được tại $t = 0$ (với $|P'(0)| = 18$ điểm/ngày), chứ không phải tại $t = 5$.

    #nhanxet[
      Trong tâm lý học, những cú sốc tình cảm thường có tốc độ "nguội lạnh" nhanh nhất ở giai đoạn đầu tiên (ngay sau khi chia tay), sau đó tốc độ quên sẽ chậm dần và chuyển sang trạng thái chai sạn (tiệm cận).
    ]
  ]
)

// Câu 3
#tln(
  [Điểm tình cảm của Nam dành cho Thư biến thiên liên tục theo phương trình $P'(t) = -0","2 P(t) + 2$ với điều kiện ban đầu $P(0) = 100$. Nam được khuyên rằng chỉ nên tìm kiếm một mối quan hệ mới khi điểm tình cảm dành cho người cũ giảm xuống mức đúng $15$ điểm. Hỏi sau khoảng bao nhiêu ngày kể từ lúc chia tay, điểm tình cảm của Nam đạt được mức này? (_làm tròn kết quả đến hàng phần mười_).],
  [$14","5$],
  fig: cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    // Hệ trục toạ độ
    line((0, 0), (18, 0), mark: (end: ">"), stroke: 1pt)
    content((18, -0.6), $t$)
    line((0, 0), (0, 11), mark: (end: ">"), stroke: 1pt)
    content((-0.6, 11), $P(t)$)
    content((-0.4, -0.4), $O$)

    // Đường tiệm cận
    line((0, 1), (17, 1), stroke: (dash: "dashed", paint: gray))
    
    // Đồ thị
    let pts = ()
    for i in range(0, 170) {
      let x = i / 10
      let y = 1 + 9 * calc.exp(-0.2 * x)
      pts.push((x, y))
    }
    line(..pts, stroke: (paint: red, thickness: 1.5pt))
    
    // Ngưỡng 15 điểm
    line((0, 1.5), (17, 1.5), stroke: (dash: "dashed", paint: blue, thickness: 1pt))
    content((-0.6, 1.5), $15$, fill: blue)
    content((15, 2), [Ngưỡng $15$ điểm], fill: blue)

    // Giao điểm
    line((14.45, 0), (14.45, 1.5), stroke: (dash: "dashed", paint: rgb("008080")))
    circle((14.45, 1.5), radius: 2.5pt, fill: rgb("008080"))
    content((14.45, -0.6), $t_0$, fill: rgb("008080"))
  }),
  fig-pos: "center",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Xây dựng hàm số $P(t)$ từ phương trình vi phân và điều kiện ban đầu.
      - Giải phương trình $P(t) = 15$ để tìm thời gian $t$.
      - Dùng hàm logarit tự nhiên (ln) để giải phương trình mũ và làm tròn đúng yêu cầu.
    ]
    
    *Phân tích và giải chi tiết:*
    - Từ quá trình giải phương trình vi phân $P'(t) = -0","2 P(t) + 2$ với $P(0) = 100$, ta đã tìm được hàm số điểm tình cảm:
      $ P(t) = 10 + 90 e^(-0","2 t) $
    - Nam cần thời điểm $t$ sao cho điểm tình cảm bằng $15$, ta có phương trình:
      $ 10 + 90 e^(-0","2 t) = 15 $
      $ <=> 90 e^(-0","2 t) = 5 $
      $ <=> e^(-0","2 t) = 5/90 = 1/18 $
    - Lấy logarit tự nhiên (ln) hai vế, ta được:
      $ -0","2 t = ln(1/18) <=> -0","2 t = -ln 18 $
    - Rút $t$ ta được:
      $ t = (ln 18)/(0","2) = 5 ln 18 $
    - Sử dụng máy tính cầm tay:
      $ t approx 5 times 2","89037... approx 14","4518... " (ngày)" $
    - Bài toán yêu cầu làm tròn kết quả đến hàng phần mười. Do chữ số hàng phần trăm là $5$, ta làm tròn lên:
      $ t approx 14","5 $
    - Vậy sau khoảng *$14","5$* ngày, Nam sẽ đạt được trạng thái sẵn sàng cho mối quan hệ mới.

    #meo[
      Khi giải tự luận hoặc trắc nghiệm điền khuyết, tuyệt đối không làm tròn các con số trung gian (như $ln 18$). Hãy giữ nguyên biểu thức chính xác nhất $t = 5 ln 18$ cho đến bước cuối cùng mới bấm máy tính để tránh sai số tích lũy. Việc dùng `","` cho số thập phân ở kết quả cuối cùng đảm bảo đúng chuẩn trình bày toán học Việt Nam.
    ]
  ]
)

