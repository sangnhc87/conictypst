#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme.typ": *

// ═══════════════════════════════════════════════════════════════════
// TƯ DUY ĐẠI BÁC DIỆT RUỒI — TẬP 2: ĐẠI SỐ TỔ HỢP ĐẾN XÁC SUẤT
// CHƯƠNG 2: KIẾN TRÚC CỦA KHẢ NĂNG
// BẢN KHAI MỞ + XƯỞNG CHIỀU SÂU
// ═══════════════════════════════════════════════════════════════════

#set page(
  paper: "a4",
  margin: (x: 1.6cm, top: 2.2cm, bottom: 2.6cm),
  header: context {
    let n = counter(page).get().first()
    if n > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[
          #text(size: 8pt, fill: rgb("#607D8B"), style: "italic")[
            Tư Duy Đại Bác Diệt Ruồi — Tập 2: Đại Số Tổ Hợp Đến Xác Suất
          ]
        ],
        align(right)[
          #text(size: 8pt, fill: rgb("#1B5E20"), weight: "bold")[
            Chương 2: Kiến Trúc Của Khả Năng
          ]
        ],
      )
      v(2pt)
      line(length: 100%, stroke: 0.4pt + rgb("#CFD8DC"))
    }
  },
  footer: align(center, context {
    let n = counter(page).get().first()
    if n > 1 {
      text(size: 9pt, fill: rgb("#607D8B"))[— #counter(page).display() —]
    }
  }),
)

#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.92em, first-line-indent: 1.2em)
#set list(indent: 1.2em, body-indent: 0.6em)
#set enum(indent: 1.2em, body-indent: 0.6em)
#show math.equation: set text(fill: rgb("#0A0A0A"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display
#show heading: it => {
  set par(first-line-indent: 0em)
  it
}

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  block(
    fill: gradient.linear(C-FOREST, C-TEAL, angle: 90deg),
    inset: (x: 16pt, y: 10pt),
    radius: 5pt,
    width: 100%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: white, weight: "black", size: 14pt)[#it.body]
  ]
  v(0.9em)
}

#show heading.where(level: 2): it => block(
  fill: rgb("#F0FDF4"),
  stroke: (left: 4pt + C-EMERALD),
  inset: (x: 14pt, y: 10pt),
  radius: (right: 5pt),
  width: 100%,
  above: 1.2em,
  below: 0.6em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-FOREST, weight: "bold", size: 12pt)[#it.body]
]

// ═══════════════════════════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════════════════════════

#cover-box(
  [TẬP 2: ĐẠI SỐ TỔ HỢP ĐẾN XÁC SUẤT],
  [Một Con Đường Khai Mở Từ Việc Đếm Tới Kiến Trúc Sâu Của Khả Năng],
)

#v(1em)

#align(center)[
  #block(
    fill: rgb("#FFF9C4"),
    stroke: 0.8pt + rgb("#FBC02D"),
    inset: 12pt,
    radius: 6pt,
    width: 92%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: rgb("#8D6E00"), weight: "bold")[Lời mở đầu của Tập 2]
    #v(0.4em)
    #text(size: 9.6pt, style: "italic")[
      "Nếu Chương 1 là ngôn ngữ của sự thay đổi, thì Chương 2 là ngôn ngữ của khả năng.#linebreak()
      Chương 1 dạy ta hỏi: một đại lượng đang biến thiên ra sao?#linebreak()
      Chương 2 dạy ta hỏi: có bao nhiêu thế giới có thể xảy ra, các thế giới ấy có cấu trúc gì, và khi bất định bước vào, ta nên suy nghĩ thế nào để không chìm trong hỗn loạn.#linebreak()
      Đây không phải một chương đếm mẹo. Đây là một cánh cửa đi từ tư duy rời rạc, đối xứng, song ánh, truy hồi, hàm sinh, đến xác suất và kỳ vọng như những ý tưởng thống nhất của toán học sâu."
    ]
  ]
]

#v(0.9em)

#quote-block[
  Toán rời rạc không hề là phần phụ của toán học. Nó là nơi trí óc học cách nhìn một không gian khả năng khổng lồ mà không cần liệt kê từng trường hợp. Và khi xác suất xuất hiện, ta không rời khỏi việc đếm; ta chỉ bắt đầu gắn cho các khả năng ấy một hình học mới của thông tin và bất định.
]

#v(1em)

#outline(title: [Mục Lục Tập 2], depth: 2)

#pagebreak()

= PHẦN I — KHAI MỞ: TỪ ĐẾM ĐẾN KIẾN TRÚC CỦA KHẢ NĂNG

== 1. Vì Sao Đếm Lại Là Một Cánh Cửa Của Toán Học Sâu?

#why-box[
  Khi còn nhỏ, ta tưởng đếm chỉ là một hoạt động sơ cấp: đếm ngón tay, đếm quả táo, đếm số học sinh trong lớp. Nhưng càng trưởng thành trong toán học, ta càng thấy "đếm" không còn là việc đọc tên từng phần tử. Đếm trở thành nghệ thuật hiểu một *không gian khả năng* quá lớn để nhìn trực tiếp.

  Hãy nghĩ tới vài tình huống quen thuộc nhưng sâu một cách đáng sợ:

  - Có bao nhiêu cách xếp $10$ người vào $10$ ghế?
  - Có bao nhiêu mật khẩu dài $12$ ký tự?
  - Có bao nhiêu cách chọn một tập con từ một tập $n$ phần tử?
  - Có bao nhiêu chuỗi nhị phân không chứa hai số $1$ liên tiếp?
  - Có bao nhiêu thế giới có thể xảy ra trong một thí nghiệm ngẫu nhiên nhiều bước?

  Trong tất cả những câu hỏi ấy, ta hiếm khi có cơ hội liệt kê thô. Không gian khả năng bùng nổ quá nhanh. Vì vậy, bài toán thật không phải là "đếm từng cái". Bài toán thật là: *ta thấy cấu trúc nào đủ mạnh để việc đếm tự xảy ra?*
]

#eye-box[
  Chương 1 nói: đạo hàm là thiết bị đo biến thiên cục bộ để hiểu hành vi toàn cục.

  Chương 2 nói điều song song: tổ hợp là thiết bị nén các khả năng cục bộ để hiểu không gian khả năng toàn cục.

  Nếu đạo hàm hỏi "khoảnh khắc này thay đổi ra sao?" thì tổ hợp hỏi "toàn bộ sân chơi của các khả năng được xây từ những viên gạch nào?".

  Nếu giải tích là khoa học của cái liên tục, thì tổ hợp là khoa học của *cái có thể*. Và xác suất là khoa học của việc đi lại trong cái có thể ấy khi thông tin không đầy đủ.
]

#core-box[
  Có bốn lý do khiến tổ hợp và xác suất là một cánh cửa mở vào toán học sâu:

  - Nó buộc ta nhìn *cấu trúc* thay cho liệt kê.
  - Nó rèn luyện khả năng nhận ra *đối xứng* và *bất biến*.
  - Nó dạy cách dịch một bài toán đời thường thành *mô hình không gian khả năng*.
  - Nó là chiếc cầu nối đại số, số học, hình học rời rạc, khoa học dữ liệu, xác suất, và thuật toán.

  Vì thế, học chủ đề này đúng cách không phải là đi học vài công thức hoán vị, chỉnh hợp, tổ hợp. Đó là học cách điều khiển một vũ trụ lựa chọn mà không bị ngập trong số lượng trường hợp.
]

#vd-box("1", "Ba bối cảnh, một linh hồn")[
  Hãy so sánh ba bài toán sau:

  - Xếp $5$ cuốn sách khác nhau lên một kệ.
  - Chọn $3$ học sinh từ một nhóm $10$ học sinh.
  - Tính xác suất khi tung $6$ đồng xu có đúng $2$ mặt ngửa.

  Bề mặt của chúng rất khác nhau: một bài là sắp xếp, một bài là chọn lựa, một bài là xác suất. Nhưng dưới đáy, cả ba đều đang làm cùng một việc: xác định một không gian khả năng, rồi dùng cấu trúc của không gian ấy để đếm.

  Học sâu là nhìn ra cái linh hồn chung ấy trước khi bị đánh lừa bởi quần áo bối cảnh.
]

#meta-box[
  Trong giải tích, trực giác nền là "phóng đại để thấy cấu trúc vi mô". Trong tổ hợp, trực giác nền là "nén để thấy cấu trúc vĩ mô". Một bên quan sát bằng kính hiển vi. Một bên quan sát bằng nghệ thuật gấp và mã hóa.
]

#open-q[
  Khi một bài toán có quá nhiều trường hợp để liệt kê, đó không phải lúc trí óc đầu hàng. Đó là lúc nó buộc phải trưởng thành và đi tìm cấu trúc.
]

== 2. Đếm Không Phải Là Đếm — Đếm Là Nén Một Không Gian Khả Năng

#why-box[
  Điều làm người mới học bối rối là câu sau nghe có vẻ nghịch lý: *muốn đếm lớn, phải bỏ thói quen đếm từng cái.*

  Một nhà toán học giỏi không nhìn $2^n$ tập con rồi thử kể từng tập. Họ nhìn thấy rằng mỗi phần tử có hai quyết định độc lập: vào hoặc không vào. Một người làm xác suất giỏi không liệt kê toàn bộ chuỗi sự kiện quá dài; họ tìm ra quy luật phân nhánh, đối xứng, hay truy hồi để nén toàn bộ không gian mẫu.

  Đếm, theo nghĩa sâu, là tìm một *biểu diễn* nhỏ cho một vũ trụ lớn.
]

#eye-box[
  Một tập con của một tập $n$ phần tử có thể được mã hóa bằng một chuỗi nhị phân độ dài $n$:

  - chữ số $1$ nghĩa là phần tử được chọn,
  - chữ số $0$ nghĩa là phần tử bị bỏ.

  Đột nhiên, câu hỏi "có bao nhiêu tập con?" biến thành câu hỏi "có bao nhiêu chuỗi nhị phân độ dài $n$?".

  Và câu trả lời hiện ra tức khắc: mỗi vị trí có $2$ chọn lựa, nên tổng số là $2^n$.

  Đây chính là một phép nén. Ta không đếm tập con nữa. Ta đếm mã của tập con.
]

#vd-box("2", "Bản chất của công thức $2^n$")[
  Nhiều học sinh thuộc rất nhanh mệnh đề: một tập $n$ phần tử có $2^n$ tập con. Nhưng nếu chỉ dừng ở việc thuộc, em mất điều đẹp nhất.

  Điều đẹp nhất là ở đây có một phép dịch cực mạnh:

  - một đối tượng hình học rời rạc: *tập con*,
  - được chuyển thành một đối tượng mã hóa: *chuỗi 0–1*,
  - rồi được đếm bằng nguyên lý nhân.

  Khi một định lý hiện ra qua hai lần thay quần áo như vậy, em đang đứng rất gần linh hồn của tổ hợp hiện đại.
]

#core-box[
  Hầu hết các lời giải tổ hợp trưởng thành đều làm một trong ba việc sau:

  - *Mã hóa* đối tượng cần đếm thành một đối tượng dễ đếm hơn.
  - *Chia* không gian lớn thành những lớp nhỏ có cấu trúc rõ.
  - *Đổi ngôn ngữ* của bài toán sang đại số, truy hồi, hình học lưới, hay xác suất.

  Nếu em chỉ nhớ công thức mà không biết mình đang làm một trong ba động tác trên, thì em mới chỉ thao tác. Khi em nhìn ra động tác, em bắt đầu hiểu.
]

#link-box[
  Trong khoa học máy tính, nén trạng thái là cốt lõi của quy hoạch động. Trong lý thuyết mã, một đối tượng được thay bằng chuỗi ký hiệu. Trong xác suất, một thí nghiệm được thay bằng không gian mẫu. Tổ hợp là nơi rất nhiều ngành gặp nhau trên cùng một bản năng: *biến cái lớn thành cái có thể điều khiển*.
]

== 3. Song Ánh — Nghệ Thuật Thay Áo Mà Không Đổi Linh Hồn

#why-box[
  Có một vũ khí cực mạnh trong tổ hợp mà người mới học thường chỉ thấy như một mẹo: *song ánh*.

  Song ánh không chỉ là một hàm một-một-và-lên. Trong tổ hợp, song ánh là lời tuyên bố rằng hai thế giới nhìn bề ngoài khác hẳn nhau thật ra có cùng một bộ xương.
]

#quote-block[
  Một bài toán đếm đẹp là bài toán trong đó ta không đếm trực tiếp đối tượng gốc, mà tìm được một thế giới khác nơi việc đếm tự trở nên hiển nhiên.
]

#vd-box("3", "Tập con và chuỗi nhị phân")[
  Mỗi tập con của tập $\{1, 2, dots.c, n\}$ tương ứng đúng một chuỗi nhị phân độ dài $n$.

  Đây không phải chỉ là một sự tương ứng tiện lợi. Nó là một song ánh thật sự. Không hai tập con nào có cùng mã, và mỗi chuỗi mã hóa đúng một tập con.

  Vì vậy, khi em đếm chuỗi nhị phân, em đã đếm tập con. Một lời giải song ánh tốt có sức mạnh kỳ lạ này: nó cho phép em *quên hoàn toàn bài toán cũ* sau khi đã bước qua cây cầu.
]

#vd-box("4", "Đường đi trên lưới và từ nhị phân")[
  Hãy tưởng tượng các đường đi từ góc trái dưới tới góc phải trên của một lưới ô vuông, chỉ được đi sang phải hoặc đi lên.

  Mỗi đường đi như thế có thể được mã bằng một từ gồm hai chữ cái, chẳng hạn:

  - $P$ cho bước sang phải,
  - $L$ cho bước đi lên.

  Đột nhiên, bài toán hình học biến thành bài toán sắp chữ. Nếu cần đi $a$ bước sang phải và $b$ bước đi lên, ta chỉ việc hỏi: có bao nhiêu từ độ dài $a+b$ chứa đúng $a$ chữ $P$ và $b$ chữ $L$?

  Song ánh ở đây biến hình học thành đại số của vị trí. Và bài toán trở nên đếm được ngay.
]

#meta-box[
  Người mới học hỏi: công thức nào dùng ở đây? Người học sâu hỏi: thế giới này có thể được biến thành thế giới nào dễ nhìn hơn không? Câu hỏi thứ hai sinh ra song ánh, và song ánh là một trong những nơi đẹp nhất mà sáng tạo tổ hợp bộc lộ.
]

== 4. Phân Biệt, Không Phân Biệt, Thứ Tự, Không Thứ Tự

#why-box[
  Phần lớn nhầm lẫn ở mảng tổ hợp không đến từ việc công thức khó. Nó đến từ việc người học chưa phân biệt rõ bốn loại câu hỏi căn bản:

  - đối tượng có phân biệt hay không,
  - hộp chứa có phân biệt hay không,
  - thứ tự có quan trọng hay không,
  - và việc lặp lại có được phép hay không.

  Chỉ cần lẫn một tiêu chí, cả lời giải sẽ trượt khỏi cấu trúc thật của bài toán.
]

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  row-gutter: 10pt,
  [
    #block(fill: rgb("#EEF7F0"), inset: 12pt, radius: 6pt, stroke: 1pt + C-EMERALD)[
      #set par(first-line-indent: 0em)
      #text(fill: C-FOREST, weight: "bold")[Thứ tự quan trọng]
      Xếp sách lên kệ, tạo mật khẩu, lập dãy ký tự.
    ]
  ],
  [
    #block(fill: rgb("#FFF7E8"), inset: 12pt, radius: 6pt, stroke: 1pt + C-AMBER)[
      #set par(first-line-indent: 0em)
      #text(fill: C-AMBER, weight: "bold")[Thứ tự không quan trọng]
      Chọn đội, chọn tập con, chọn nhóm học sinh.
    ]
  ],

  [
    #block(fill: rgb("#EEF4FF"), inset: 12pt, radius: 6pt, stroke: 1pt + rgb("#2563EB"))[
      #set par(first-line-indent: 0em)
      #text(fill: rgb("#1D4ED8"), weight: "bold")[Đối tượng phân biệt]
      Người, sách, chữ số, ghế đánh số, phòng đánh số.
    ]
  ],
  [
    #block(fill: rgb("#FDF2F8"), inset: 12pt, radius: 6pt, stroke: 1pt + rgb("#BE185D"))[
      #set par(first-line-indent: 0em)
      #text(fill: rgb("#9D174D"), weight: "bold")[Đối tượng không phân biệt]
      Kẹo giống nhau, bóng cùng màu không đánh số, phần thưởng đồng chất.
    ]
  ],
)

#v(0.8em)

#core-box[
  Rất nhiều bài toán tổ hợp có thể được mở khóa chỉ bằng cách hỏi đúng bốn câu:

  - Tôi đang sắp xếp hay đang chọn?
  - Thứ tự có tạo ra hai cấu hình khác nhau không?
  - Các vật có tên riêng hay hoàn toàn đồng chất?
  - Các hộp chứa có được gắn nhãn hay chỉ là những ngăn vô danh?

  Khi bốn câu này sáng rõ, công thức thường chỉ còn là phần kỹ thuật đi sau.
]

#vd-box("5", "Vì sao chọn đội khác với xếp hàng?")[
  Một đội bóng gồm $5$ người và một hàng người gồm $5$ vị trí có cùng số lượng thành viên, nhưng hoàn toàn khác nhau về cấu trúc.

  Trong đội bóng, đổi chỗ hai bạn vẫn là cùng một đội. Trong hàng người, đổi chỗ hai bạn tạo thành một cấu hình mới.

  Cả sự khác biệt giữa tổ hợp và hoán vị được nén trong một câu hỏi triết học rất đơn giản: *cái gì làm nên bản sắc của một cấu hình?*
]

== 5. Tại Sao Phép Nhân Lại Đếm Được?

#why-box[
  Một trong những nguyên lý nền của tổ hợp là nguyên lý nhân. Nó trông quá hiển nhiên nên thường bị dạy như điều không cần suy nghĩ: nếu có $a$ cách chọn bước đầu và $b$ cách chọn bước sau thì có $a b$ cách thực hiện cả hai bước.

  Nhưng nguyên lý này sâu hơn nhiều. Nó là tuyên bố rằng *một cấu hình phức hợp có thể được xây bằng các quyết định cục bộ độc lập*.
]

#eye-box[
  Hãy hình dung một cây lựa chọn.

  - Ở tầng đầu, ta có $a$ nhánh.
  - Từ mỗi nhánh đó, lại mọc ra $b$ nhánh con.

  Toàn bộ số lá ở cuối cây là $a b$.

  Đây là hình học thật sự của phép nhân trong tổ hợp. Nhân không còn là thao tác số học khô cứng. Nó là cấu trúc phân nhánh của lựa chọn.
]

#vd-box("6", "Từ nguyên lý nhân tới đa thức")[
  Khi ta nhân hai đa thức, số mũ cộng lại và hệ số chập vào nhau. Đó không phải ngẫu nhiên đại số. Nó là hình bóng của nguyên lý nhân trên một thế giới mã hóa.

  Một số hạng $x^a$ có thể được hiểu là "chọn ra một cấu hình cỡ $a$". Một số hạng $x^b$ là một cấu hình cỡ $b$. Khi nhân, ta thu được $x^(a+b)$: hai cấu hình nhỏ được ghép thành một cấu hình tổng.

  Chính ở đây, đại số bắt đầu nói tiếng tổ hợp. Và hàm sinh sẽ đi vào từ cánh cửa này.
]

#tech-box[
  Có thể xem hàm sinh như một *cỗ máy ghi sổ* cho các khả năng:

  - hệ số ghi số cách,
  - số mũ ghi kích thước,
  - phép nhân ghi thao tác ghép cấu hình,
  - phép khai triển ghi toàn bộ lịch sử kết hợp.

  Khi thấy điều đó, em sẽ không còn cảm giác hàm sinh là một mẹo đại số rơi từ trời xuống. Nó chỉ là việc đưa nguyên lý nhân vào một ngôn ngữ ghi chép mạnh hơn.
]

== 6. Truy Hồi — Quy Luật Cục Bộ Sinh Ra Hình Dạng Toàn Cục

#why-box[
  Nhiều đối tượng rời rạc không được mô tả tốt nhất bằng một công thức tường minh. Chúng được mô tả tốt hơn bằng cách trả lời câu hỏi: *muốn xây đối tượng cỡ $n$, ta phải ghép nó từ những đối tượng nhỏ hơn như thế nào?*

  Đây là nơi tư duy truy hồi xuất hiện. Nó là một trong những hình thức tự nhiên nhất của tư duy toán học: hiểu cái lớn qua quy luật tạo sinh của cái nhỏ.
]

#vd-box("7", "Fibonacci không chỉ là dãy số")[
  Dãy Fibonacci thường được giới thiệu như một công thức:
  $ F_n = F_(n-1) + F_(n-2) $

  Nhưng nếu chỉ nhìn như một công thức, em sẽ bỏ lỡ điều đáng giá nhất: đây là lời kể về một *cơ chế sinh*.

  Trong bài toán lát một dải gạch bằng domino, ô cuối cùng hoặc được phủ bởi một domino đứng, hoặc thuộc về một cặp domino ngang ở cuối. Hai trường hợp này đưa ta về bài toán nhỏ hơn. Truy hồi sinh ra ngay từ cấu trúc hình học của đối tượng.

  Vì vậy, truy hồi không phải là kỹ thuật biến đổi. Nó là cách đọc bộ khung của một quá trình tạo hình.
]

#core-box[
  Truy hồi dạy ba bài học lớn:

  - một quy luật địa phương có thể đủ để sinh cả một thế giới,
  - hiểu cách xây quan trọng không kém hiểu công thức đếm,
  - và nhiều đối tượng đẹp nhất của tổ hợp sống ở giao điểm giữa đếm, truy hồi, và hàm sinh.
]

#link-box[
  Trong giải thuật, truy hồi dẫn tới quy hoạch động. Trong hình học rời rạc, truy hồi đếm đường đi và lát gạch. Trong xác suất, truy hồi mô tả chuỗi Markov, cây phân nhánh, và nhiều quá trình ngẫu nhiên. Một ý tưởng, rất nhiều đời sống.
]

== 7. Xác Suất Không Bắt Đầu Từ Công Thức, Mà Từ Không Gian Mẫu

#why-box[
  Sai lầm rất phổ biến khi học xác suất là học luôn công thức mà chưa xây hình ảnh. Nhưng xác suất không bắt đầu ở các phân số. Nó bắt đầu ở việc dựng đúng *không gian khả năng* mà ta đang sống trong đó.

  Mỗi phép tung đồng xu, bốc bi, rút thẻ, chọn đường đi, sắp xếp người vào ghế, đều là một vũ trụ khả năng. Một biến cố chỉ là một miền con trong vũ trụ ấy.
]

#eye-box[
  Nếu tổ hợp hỏi "có bao nhiêu cấu hình?" thì xác suất hỏi thêm một tầng nữa: *ta đang đứng ở đâu bên trong biển cấu hình ấy, và thông tin hiện có làm co giãn biển ấy ra sao?*

  Với các mô hình đều khả năng như tung xúc xắc hay chọn ngẫu nhiên một phần tử từ một tập hữu hạn, xác suất chỉ là tỷ lệ:
  $ P(A) = frac("số trường hợp thuận lợi", "số trường hợp có thể") $

  Nhưng đừng để công thức ngắn đó đánh lừa. Toàn bộ khó khăn nằm ở chỗ đếm đúng hai không gian: tổng thể và thuận lợi.
]

#vd-box("8", "Vì sao bài xác suất tốt thường chỉ là bài tổ hợp đội mũ mới?")[
  Khi tung $6$ đồng xu và hỏi xác suất có đúng $2$ mặt ngửa, ta không làm gì thần bí cả.

  Ta chỉ hỏi:

  - toàn bộ có bao nhiêu chuỗi sấp–ngửa độ dài $6$,
  - trong số đó, bao nhiêu chuỗi chứa đúng $2$ chữ ngửa.

  Bài toán xác suất ở đây không phải một chủ đề tách rời khỏi tổ hợp. Nó là một bài đếm chia cho một bài đếm khác.

  Tư duy này cực kỳ quan trọng. Nó ngăn xác suất biến thành việc bấm công thức rời rạc mà không biết mình đang chia cái gì cho cái gì.
]

#core-box[
  Muốn học xác suất sâu, hãy giữ ba nguyên tắc:

  - Dựng đúng không gian mẫu trước.
  - Hiểu biến cố như một miền cấu hình, không chỉ là một dòng chữ.
  - Nếu bài toán hữu hạn và đều khả năng, hãy luôn thử đưa nó về một bài đếm có cấu trúc.
]

== 8. Xác Suất Có Điều Kiện — Khi Thông Tin Bẻ Cong Không Gian Khả Năng

#why-box[
  Có lẽ bước trưởng thành đầu tiên trong xác suất là nhận ra: biết thêm thông tin không chỉ "thêm một dữ kiện". Nó *thay đổi hoàn toàn sân chơi*.

  Xác suất có điều kiện không phải một biến thể kỹ thuật. Nó là toán học của việc cập nhật thế giới sau khi một mẩu thông tin mới xuất hiện.
]

#eye-box[
  Hãy tưởng tượng toàn bộ không gian khả năng là một vùng lớn. Khi điều kiện $B$ được công bố, vùng lớn ấy bị cắt xuống chỉ còn phần nằm trong $B$.

  Từ lúc đó, câu hỏi không còn là "xác suất của $A$ trong thế giới cũ là bao nhiêu", mà là "xác suất của $A$ trong thế giới mới đã bị cắt bởi $B$ là bao nhiêu".

  Đây là ý nghĩa thật sự của xác suất có điều kiện: *thông tin làm biến dạng không gian mẫu*.
]

#vd-box("9", "Bayes không phải phép màu, mà là phép đổi góc nhìn")[
  Định lý Bayes làm nhiều học sinh sợ vì ký hiệu dày đặc. Nhưng nếu cởi nó ra tới lõi, Bayes chỉ nói một điều rất nhân bản:

  - trước khi có bằng chứng, ta có một niềm tin ban đầu,
  - sau khi có bằng chứng, ta phải điều chỉnh niềm tin ấy,
  - và mức điều chỉnh phụ thuộc vào việc bằng chứng đó tương thích với từng giả thuyết đến đâu.

  Bayes vì thế không chỉ là công thức. Nó là logic của học hỏi dưới bất định.
]

#meta-box[
  Từ y khoa, học máy, nhận diện khuôn mặt, lọc thư rác, đến suy luận khoa học, xác suất có điều kiện là nơi toán học chạm vào hành vi trí tuệ của con người: thay đổi niềm tin khi thế giới tiết lộ thêm dữ liệu.
]

== 9. Kỳ Vọng — Giá Trị Trung Bình, Nhưng Sâu Hơn Thế Rất Nhiều

#why-box[
  Kỳ vọng thường được dạy như trung bình có trọng số. Điều đó đúng, nhưng quá nghèo. Kỳ vọng thực sự đẹp ở chỗ nó là một *phép nén tuyến tính* cho toàn bộ không gian ngẫu nhiên.

  Trong một biển khả năng hỗn loạn, kỳ vọng cho ta một đại lượng rất trật tự. Nó không nói mọi thứ, nhưng nó nói một điều cực mạnh và ổn định.
]

#vd-box("10", "Phép màu tuyến tính của kỳ vọng")[
  Một trong những điều đẹp nhất của xác suất sơ cấp là tính tuyến tính của kỳ vọng: kỳ vọng của tổng bằng tổng các kỳ vọng.

  Điều đẹp là ở chỗ điều này vẫn đúng ngay cả khi các biến không độc lập. Nói cách khác, có một đại lượng đủ mềm dẻo để cộng được qua rất nhiều phụ thuộc phức tạp.

  Đây là lý do kỳ vọng là một công cụ tư duy lớn chứ không chỉ là một đại lượng thống kê. Nó cho phép ta đếm gián tiếp, ước lượng gián tiếp, và suy luận gián tiếp ở những nơi đếm trực tiếp rất đau đớn.
]

#eye-box[
  Có thể hình dung kỳ vọng như *trọng tâm* của một đám mây khả năng. Mỗi khả năng kéo trọng tâm về phía nó với lực tỉ lệ với xác suất của nó.

  Nhìn như vậy, kỳ vọng không còn là công thức. Nó là hình học của sự cân bằng trong ngẫu nhiên.
]

#link-box[
  Trong tổ hợp xác suất, kỳ vọng dẫn tới phương pháp biến chỉ báo. Trong giải thuật ngẫu nhiên, nó đo chi phí trung bình. Trong xác suất liên tục, nó trở thành tích phân. Và trong thống kê, nó là chiếc xương sống của suy luận ước lượng.
]

== 10. Hàm Sinh — Cây Cầu Nơi Đại Số Bắt Đầu Nói Tiếng Tổ Hợp

#why-box[
  Khi số lượng cấu hình trở nên quá lớn, ngay cả các kỹ thuật tổ hợp sơ cấp cũng bắt đầu hụt hơi. Ta cần một ngôn ngữ mạnh hơn — một nơi mà việc ghép cấu hình được biến thành phép nhân, việc cộng khả năng được biến thành phép cộng, và việc rút thông tin đếm được giao cho hệ số của một chuỗi.

  Đó chính là hàm sinh.
]

#eye-box[
  Hãy tưởng tượng mỗi kiểu cấu hình được gói lại trong một đơn thức. Khi nhiều cấu hình cùng cỡ xuất hiện, ta gom chúng vào hệ số. Khi ghép hai cấu hình, số mũ cộng lại. Toàn bộ thế giới đếm bỗng được nạp vào một biểu thức đại số.

  Ở khoảnh khắc ấy, đại số không còn là môn học khác. Nó trở thành thiết bị mô phỏng tổ hợp.
]

#core-box[
  Đây là bản đồ tư duy của cây cầu này:

  - *Tổ hợp* cung cấp đối tượng cần đếm.
  - *Đại số* cung cấp bộ máy thao tác.
  - *Hàm sinh* là giao diện nối hai thế giới.
  - *Xác suất* bước vào khi ta chuẩn hóa hoặc gắn trọng số cho các cấu hình.

  Một khi nhìn được cây cầu đó, em sẽ hiểu tại sao một cuốn sách về hàm sinh không hề là chuyện hẹp. Nó là một bản nhạc nơi đại số, tổ hợp, xác suất, và truy hồi chơi cùng một điệu.
]

#vd-box("11", "Nếu Chương 1 có đạo hàm, thì Chương 2 có hàm sinh")[
  Ở Chương 1, đạo hàm là công cụ thống nhất: từ tiếp tuyến, đơn điệu, cực trị, tới tối ưu và xấp xỉ.

  Ở Chương 2, hàm sinh đóng một vai tương tự. Từ bài toán chia kẹo, đổi tiền, phân hoạch, truy hồi, Catalan, đếm ánh xạ, tới xác suất tổ hợp, cùng một thiết bị đại số liên tục xuất hiện.

  Vì vậy, phần kỹ thuật sâu của cuốn này sẽ đi qua hàm sinh không phải vì đó là một mẹo cao siêu, mà vì nó là *chiếc cầu thống nhất* đẹp nhất giữa đại số tổ hợp và xác suất rời rạc.
]

== 11. Bản Đồ Tư Duy Thống Nhất Của Tập 2

#block(
  fill: rgb("#F8FAFC"),
  inset: 20pt,
  radius: 10pt,
  stroke: 0.8pt + rgb("#B0BEC5"),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (1fr, 18pt, 1fr, 18pt, 1fr),
    align: top,
    [
      #align(center)[
        #block(fill: C-NAVY, inset: 8pt, radius: 6pt)[
          #text(fill: white, weight: "bold", size: 10pt)[ĐẦU VÀO]
          #v(0.2em)
          #text(fill: rgb("#D7F9F1"), size: 9pt)[Các khả năng thô]
        ]
      ]
      #v(0.4em)
      - Đối tượng cần đếm.
      - Cấu hình, lựa chọn, vị trí, nhãn.
      - Câu hỏi: có bao nhiêu thế giới?
    ],
    [
      #v(3.2em)
      #align(center)[#text(fill: C-AMBER, size: 18pt)[→]]
    ],
    [
      #align(center)[
        #block(fill: C-TEAL, inset: 8pt, radius: 6pt)[
          #text(fill: white, weight: "bold", size: 10pt)[CÔNG CỤ]
          #v(0.2em)
          #text(fill: rgb("#E0F2F1"), size: 9pt)[Nén cấu trúc]
        ]
      ]
      #v(0.4em)
      - Song ánh, chia trường hợp, đối xứng.
      - Nguyên lý cộng, nguyên lý nhân.
      - Truy hồi, hàm sinh, chỉ báo, kỳ vọng.
    ],
    [
      #v(3.2em)
      #align(center)[#text(fill: C-AMBER, size: 18pt)[→]]
    ],
    [
      #align(center)[
        #block(fill: C-WINE, inset: 8pt, radius: 6pt)[
          #text(fill: white, weight: "bold", size: 10pt)[ĐẦU RA]
          #v(0.2em)
          #text(fill: rgb("#FFEBEE"), size: 9pt)[Kiến trúc sâu]
        ]
      ]
      #v(0.4em)
      - Công thức đếm.
      - Quy luật truy hồi.
      - Xác suất, điều kiện, kỳ vọng.
      - Một bản đồ của khả năng.
    ],
  )

  #v(1em)
  #line(length: 100%, stroke: 0.6pt + rgb("#B0BEC5"))
  #v(0.8em)

  #align(center)[
    #text(fill: rgb("#455A64"), size: 9.5pt, style: "italic")[
      *Nguyên lý thống nhất của Tập 2:* Không gian khả năng thô → Nén bằng cấu trúc → Công thức, xác suất, kỳ vọng, và quy luật sâu
      #linebreak()
      Mọi bài toán lớn của chương này rốt cuộc đều là biến thể của một trong bốn câu hỏi:
      "Ta đang đếm cái gì?" · "Cấu trúc nào nén được nó?" · "Thông tin nào làm đổi không gian mẫu?" · "Đại lượng trung bình nào vẫn còn ổn định trong hỗn loạn?"
    ]
  ]
]

#v(1em)

#meta-box[
  Nếu Chương 1 rèn cho ta con mắt giải tích để nhìn sự thay đổi, thì Chương 2 rèn cho ta con mắt tổ hợp–xác suất để nhìn khả năng.

  Một người học trưởng thành cần cả hai con mắt ấy. Một mắt nhìn thế giới đang chảy. Một mắt nhìn thế giới có thể xảy ra theo những cách nào.
]

#include "parts/02-khai-mo-sau.typ"

#include "parts/03-bao-ham-loai-tru.typ"

#include "parts/04-nguyen-ly-bat-bien.typ"

#include "parts/05-do-thi-roi-rac.typ"

#include "parts/06-phuong-phap-xac-suat.typ"

#include "parts/07-martingale-so-cap.typ"

= PHẦN VIII — XƯỞNG CHIỀU SÂU: TỪ HÀM SINH ĐẾN XÁC SUẤT TỔ HỢP

#why-box[
  Phần khai mở ở trên dựng bản đồ tư duy. Phần dưới đây là xưởng kỹ thuật sâu của cả cuốn. Nó đi vào những nơi mà bản đồ cần được hiện thực hóa bằng công cụ mạnh: hàm sinh thường, tích chập, vách ngăn, ràng buộc số học, đổi tiền và phân hoạch, truy hồi, Catalan, các bài toán đếm–xác suất tổ hợp, và tuyển tập bài hay ở mức chuyên sâu.

  Đây không còn là phần "gợi cảm hứng" đơn thuần. Đây là xương cơ bắp của cuốn sách.
]

#tech-box[
  *Cách đọc phần sâu bên dưới để không bị ngợp:*

  - Đọc mỗi mảng như một biến thể của bản đồ tư duy ở Phần I.
  - Luôn tự hỏi bài toán đang được nén bằng cơ chế nào: song ánh, truy hồi, hay hàm sinh.
  - Khi một bài chuyển sang xác suất, hãy tách riêng việc đếm không gian tổng và việc đếm không gian thuận lợi.
  - Đừng đọc như kho bài luyện. Hãy đọc như một xưởng nơi cùng một cỗ máy đại số liên tục hiện hình dưới nhiều lớp áo.
]

#open-q[
  Nếu Phần I trả lời câu hỏi "vì sao chủ đề này sâu?", thì Phần II sẽ trả lời bằng hành động: "sâu như thế nào, và sâu tới đâu?"
]

#pagebreak()

#include "../../exams/CD-HamSinh-GeneratingFunction-content.typ"
