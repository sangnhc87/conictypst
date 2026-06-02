#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

= PHẦN I — KHAI MỞ: TOÁN HỌC CỦA SỰ TÍCH LŨY

== 1. Vì Sao Nguyên Hàm Và Tích Phân Xứng Đáng Thành Một Quyển Riêng?

#why-box[
  Nếu đạo hàm là ngôn ngữ của *sự thay đổi tức thời*, thì nguyên hàm và tích phân là ngôn ngữ của *sự tích lũy*. Đây không chỉ là một chương tiếp theo của giải tích. Đây là nửa còn lại của một cặp đối ngẫu rất lớn.

  Nhiều học sinh từng thấy đạo hàm khá có hình ảnh: độ dốc, vận tốc, tốc độ thay đổi. Nhưng đến nguyên hàm và tích phân, cảm giác thường sụp xuống thành các kỹ thuật bấm công thức. Điều đó xảy ra khi người học mất hình ảnh trung tâm: *một đại lượng nhỏ đang được cộng dồn liên tục thành một đại lượng lớn*.
]

#eye-box[
  Hãy nghĩ đến vài tình huống rất đời thường:

  - biết vận tốc theo thời gian, muốn biết quãng đường đi được,
  - biết tốc độ rò rỉ nước, muốn biết tổng lượng nước thất thoát,
  - biết bề rộng của một dải đất theo từng vị trí, muốn biết diện tích toàn bộ,
  - biết diện tích thiết diện của một vật thể theo chiều cao, muốn biết thể tích của nó,
  - biết chi phí biên, muốn biết tổng chi phí.

  Trong mọi bài toán ấy, công thức tích phân chỉ là lớp vỏ. Lõi của chúng là cùng một câu hỏi: *tổng cộng bao nhiêu khi một đại lượng nhỏ biến đổi liên tục?*
]

#history-box("Archimedes, Cavalieri, Newton, Leibniz")[
  Lịch sử của tích phân không bắt đầu từ ký hiệu $integral$. Archimedes đã dùng phương pháp vét kiệt để tiến gần diện tích và thể tích từ rất lâu trước giải tích hiện đại. Bonaventura Cavalieri phát triển tư duy "cắt lát". Isaac Newton nhìn bài toán dưới góc độ các đại lượng biến thiên theo thời gian. Gottfried Wilhelm Leibniz cho ngôn ngữ ký hiệu làm nổi bật ý tưởng cộng vô số vi phân nhỏ.

  Nhìn từ xa, lịch sử ấy kể đúng một câu chuyện: toán học học cách đi từ *cục bộ rất nhỏ* tới *toàn cục rất lớn* mà không bị chìm trong vô hạn.
]

== 2. Nguyên Hàm Không Chỉ Là "Làm Ngược Đạo Hàm"

#why-box[
  Câu nói "nguyên hàm là phép tính ngược của đạo hàm" đúng nhưng chưa đủ. Nếu dừng ở đó, người học sẽ tưởng nguyên hàm chỉ là một kỹ thuật đảo công thức. Điều ấy quá nghèo.

  Nguyên hàm thật sự trả lời câu hỏi này: *nếu ta biết tốc độ thay đổi của một đại lượng, ta có thể phục hồi đại lượng ấy đến mức nào?*
]

#vd-box("1", "Gia tốc biết rồi, vận tốc từ đâu mà ra?")[
  Nếu một vật chuyển động với gia tốc $a(t)$, thì vận tốc $v(t)$ là một hàm thỏa mãn:
  $ v'(t) = a(t) $

  Tức là vận tốc là một nguyên hàm của gia tốc. Nhưng chưa xong. Vì mọi nguyên hàm chỉ xác định tới một hằng số, nên để biết chính xác vận tốc, ta còn cần một điều kiện đầu như $v(0) = v_0$.

  Đây là điểm rất sâu: nguyên hàm không chỉ là một công thức. Nó là một *gia đình khả dĩ* cho một câu chuyện biến thiên. Muốn chốt câu chuyện thật, ta cần dữ kiện ban đầu.
]

#core-box[
  Bởi vậy, có hai tầng tư duy khác nhau nhưng thường bị trộn lẫn:

  - *tầng họ nguyên hàm:* tìm tất cả các hàm có cùng đạo hàm,
  - *tầng bài toán tích lũy cụ thể:* dùng điều kiện đầu để xác định đúng hàm của hiện tượng đang xét.

  Khi tách hai tầng này ra, người học hiểu vì sao ký hiệu $+ C$ không phải thủ tục máy móc, mà là dấu vết của thông tin còn thiếu.
]

== 3. Tích Phân Xác Định: Khi Việc Cộng Trở Thành Hình Học

#eye-box[
  Một trong những cửa ngõ đẹp nhất vào tích phân là diện tích. Nhưng phải cẩn thận: tích phân không phải chỉ là công thức tính diện tích. Nó là một *quy trình giới hạn hóa việc cộng*.

  Ta chia đoạn $[a, b]$ thành những mảnh nhỏ, dựng các hình chữ nhật mảnh có chiều cao gần bằng $f(x)$, cộng diện tích các hình ấy lại, rồi làm các mảnh ngày càng nhỏ. Tích phân là giới hạn của quá trình ấy.
]

#vd-box("2", "Diện tích dưới đồ thị $y = x$ từ $0$ đến $1$")[
  Ở mức hình học, ai cũng biết diện tích là tam giác vuông cạnh $1$, nên bằng $1/2$.

  Nhưng bài toán này quan trọng vì nó cho thấy tích phân xác định không sinh ra để phục vụ những bài dễ. Nó sinh ra để *định nghĩa nghiêm túc* điều mà trực giác hình học ở bài dễ đã thấy trước.

  Một khi định nghĩa ấy đã có, ta có thể áp dụng cho những đường cong không còn là tam giác, hình thang hay hình tròn quen thuộc nữa.
]

#essay-box("Điều đẹp ở đây là gì?")[
  Tích phân là một chiến thắng triết học của toán học: thay vì đòi một công thức kín ngay từ đầu, ta chấp nhận xấp xỉ, rồi tổ chức xấp xỉ ấy thành một giới hạn đủ tốt để biến cái gần đúng thành một chân lý chính xác.
]

== 4. Định Lý Cơ Bản Của Giải Tích: Cây Cầu Lớn

#why-box[
  Nếu phải chọn một định lý làm trục xương sống cho cả quyển này, đó là định lý cơ bản của giải tích. Nó nói rằng hai thế giới tưởng tách biệt thực ra là một:

  - thế giới của đạo hàm, của cục bộ, của tốc độ thay đổi,
  - và thế giới của tích phân, của toàn cục, của sự tích lũy.
]

#vd-box("3", "Nếu $F'(x) = f(x)$ thì $integral_a^b f(x) dif x = F(b) - F(a)$")[
  Công thức này thường được học như một mẹo tính. Nhưng ý nghĩa của nó lớn hơn nhiều.

  Nó nói rằng: *muốn biết tổng tích lũy của tốc độ thay đổi trên một đoạn, ta không cần cộng từng mẩu vô hạn. Chỉ cần nhìn độ chênh lệch của một hàm nguyên thủy ở hai đầu đoạn.*

  Đây là một kỳ tích nén thông tin. Một đại lượng toàn cục được đọc ra chỉ từ dữ liệu biên.
]

#meta-box[
  Rất nhiều lần trong toán học, một công cụ mạnh xuất hiện khi hai thế giới ngôn ngữ khác nhau được nối lại bằng một chiếc cầu. Với giải tích, chiếc cầu ấy chính là định lý cơ bản.
]

== 5. Dấu Tích Phân Mang Dấu Của Sự Định Hướng

#why-box[
  Một hiểu lầm rất phổ biến là nghĩ tích phân xác định luôn là diện tích theo nghĩa hình học sơ cấp, nên phải luôn dương. Sai. Tích phân xác định trước hết là *tích lũy có định hướng*.
]

#vd-box("4", "Vì sao phần dưới trục hoành mang dấu âm?")[
  Nếu $f(x)$ âm trên một đoạn, thì mỗi hình chữ nhật vi phân nhỏ góp một lượng âm vào tổng. Tức là tích phân ghi nhận một sự tích lũy có hướng, chứ không phải diện tích hình học thuần túy.

  Nhờ vậy tích phân mới mô tả được nhiều đại lượng vật lý và kinh tế: lãi/lỗ ròng, dòng chảy ra/vào, tăng/giảm dân số, năng lượng thu vào hay tiêu hao.
]

#core-box[
  Muốn tính *diện tích hình phẳng*, ta thường phải lấy trị tuyệt đối hoặc tách miền theo những nơi hàm đổi dấu. Muốn tính *độ thay đổi ròng* của một đại lượng, ta giữ nguyên dấu của tích phân.

  Đây là một phân biệt nhỏ về kỹ thuật nhưng rất lớn về tư duy.
]

== 6. Tích Phân Là Ngôn Ngữ Của Mô Hình Hóa

#eye-box[
  Khi người học bắt đầu chạm các bài toán thực tế, họ gặp một mẫu tư duy lặp đi lặp lại:

  - xác định đại lượng đang tích lũy,
  - xác định biến mà theo đó sự tích lũy đang xảy ra,
  - xác định đơn vị nhỏ $dif x$, $dif t$, $dif y$,
  - xác định cận tích phân,
  - rồi mới tính toán.

  Nếu thiếu bốn bước đầu, tích phân biến thành thủ tục rỗng. Nếu làm đúng bốn bước đầu, công thức tích phân trở thành gần như hiển nhiên.
]

#vd-box("5", "Quãng đường từ vận tốc")[
  Nếu biết vận tốc $v(t)$ trên khoảng thời gian từ $t=a$ đến $t=b$, thì quãng đường có hướng tích lũy là:
  $ integral_a^b v(t) dif t $

  Không có gì thần bí. Mỗi lát thời gian cực nhỏ $dif t$ góp gần đúng một đoạn đường $v(t) dif t$. Tổng liên tục của vô số đóng góp nhỏ ấy chính là quãng đường.
]

#link-box[
  Cùng một logic này đi sang công cơ học $integral_a^b F(x) dif x$, tổng chi phí từ chi phí biên, thể tích từ diện tích thiết diện, lượng chất lỏng từ lưu lượng, và xác suất liên tục như diện tích dưới mật độ.
]

== 7. Cắt Lát: Từ Diện Tích Sang Thể Tích

#why-box[
  Một trong những cú mở rộng đẹp nhất của tích phân là tư duy cắt lát (slicing). Thay vì cộng những thanh nhỏ một chiều dưới đường cong, ta cộng các lát diện tích hai chiều để nhận ra một thể tích ba chiều. Đây chính là chiếc cầu nối kéo giải tích phẳng bay lên không gian.
]

#vd-box("6", "Nếu biết diện tích thiết diện $S(x)$ thì thể tích là gì?")[
  #grid(
    columns: (1.25fr, 1fr),
    column-gutter: 15pt,
    align: horizon,
    [
      Giả sử một vật thể nằm dọc theo trục $O x$ từ $a$ đến $b$. Cắt vật thể bởi một mặt phẳng vuông góc với trục $O x$ tại hoành độ $x$. Thiết diện thu được là một hình phẳng có diện tích $S(x)$ thay đổi liên tục theo $x$.

      Để tính thể tích vật thể, ta chia nhỏ nó thành $n$ lát cắt bằng các mặt phẳng vuông góc với trục $O x$. Lát cắt thứ $i$ giới hạn giữa $x_(i-1)$ và $x_i$ có độ dày $d x$. Khi $d x$ cực kỳ nhỏ, lát cắt này xấp xỉ một khối trụ có diện tích đáy $S(x_i)$ và chiều cao $d x$, thể tích vi phân của nó là:
      $ dif V = S(x) dif x $

      Tổng thể tích của vật thể là tổng liên tục (tích phân) của tất cả các đĩa vi phân này từ $a$ đến $b$:
      $ V = integral_a^b S(x) dif x $
    ],
    [
      #align(center)[
        #canvas(length: 1.1cm, {
          import draw: *
          let sx = -0.35
          let sy = -0.25
          let proj(x, y, z) = (x + y * sx, z + y * sy)
          
          // Trục Ox, Oy, Oz
          line(proj(-0.5, 0, 0), proj(5.5, 0, 0), mark: (end: ">"), stroke: 0.5pt + gray)
          line(proj(0, -0.5, 0), proj(0, 3.2, 0), mark: (end: ">"), stroke: 0.5pt + gray)
          line(proj(0, 0, -0.5), proj(0, 0, 3.0), mark: (end: ">"), stroke: 0.5pt + gray)
          content(proj(5.5, 0, 0), $x$, size: 9pt, anchor: "north-west")
          content(proj(0, 3.2, 0), $y$, size: 9pt, anchor: "south-east")
          content(proj(0, 0, 3.0), $z$, size: 9pt, anchor: "south")
          
          // Hàm bán kính cho hình khối: R(x) = 0.5 + 0.12 * x * (5 - x)
          let R(x) = 0.5 + 0.12 * x * (5 - x)
          
          // Cận a và b
          let a = 1.0
          let b = 4.5
          
          // Vẽ đường biên sau và dưới (để tạo chiều sâu)
          let upper-pts = ()
          let lower-pts = ()
          for i in range(0, 51) {
            let x = a + i * (b - a) / 50
            let r = R(x)
            upper-pts.push(proj(x, 0, r))
            lower-pts.push(proj(x, 0, -r))
          }
          
          // Vẽ elip ở hai đầu
          // Đầu a
          let ell-a = ()
          for i in range(0, 41) {
            let phi = i * 2 * calc.pi / 40
            ell-a.push(proj(a, R(a) * calc.cos(phi), R(a) * calc.sin(phi)))
          }
          line(..ell-a, stroke: 0.8pt + gray)
          
          // Đầu b
          let ell-b = ()
          for i in range(0, 41) {
            let phi = i * 2 * calc.pi / 40
            ell-b.push(proj(b, R(b) * calc.cos(phi), R(b) * calc.sin(phi)))
          }
          line(..ell-b, stroke: 0.8pt + gray)
          
          // Silhouette của khối
          line(..upper-pts, stroke: 1pt + rgb("#1D4E89"))
          line(..lower-pts, stroke: 1pt + rgb("#1D4E89"))
          
          // Lát cắt tại x = 2.6
          let xs = 2.6
          let dx = 0.25
          let rs = R(xs)
          
          // Vẽ đĩa cắt lát (cylinder vi phân)
          // Đĩa có 2 mặt elip tại xs và xs + dx
          let ell-s1 = ()
          let ell-s2 = ()
          for i in range(0, 41) {
            let phi = i * 2 * calc.pi / 40
            ell-s1.push(proj(xs, rs * calc.cos(phi), rs * calc.sin(phi)))
            ell-s2.push(proj(xs + dx, R(xs+dx) * calc.cos(phi), R(xs+dx) * calc.sin(phi)))
          }
          
          // Vẽ màu fill cho đĩa vi phân
          line(..ell-s1, close: true, fill: rgb("#0F766E2a"), stroke: 0.5pt + rgb("#0F766E"))
          
          // Đường nối đỉnh và đáy của lát cắt
          line(proj(xs, 0, rs), proj(xs + dx, 0, R(xs+dx)), stroke: 0.8pt + rgb("#0F766E"))
          line(proj(xs, 0, -rs), proj(xs + dx, 0, -R(xs+dx)), stroke: 0.8pt + rgb("#0F766E"))
          
          // Gióng lát cắt xuống trục Ox
          line(proj(xs, 0, 0), proj(xs, 0, -rs), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
          circle(proj(xs, 0, 0), radius: 1.5pt, fill: black)
          content(proj(xs, 0, 0), $x$, anchor: "north", padding: 3pt, size: 8pt)
          
          line(proj(xs+dx, 0, 0), proj(xs+dx, 0, -R(xs+dx)), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
          circle(proj(xs+dx, 0, 0), radius: 1.5pt, fill: black)
          
          // Đoạn dx trên trục Ox
          line(proj(xs, -0.4, 0), proj(xs+dx, -0.4, 0), stroke: 0.5pt + rgb("#C9A227"))
          content(proj(xs + dx/2, -0.7, 0), $d x$, fill: rgb("#C9A227"), size: 8pt)
          
          // Chú thích thiết diện S(x)
          let label-pt = proj(xs, rs * calc.cos(calc.pi/4), rs * calc.sin(calc.pi/4))
          let dest-pt = (label-pt.at(0) + 1.2, label-pt.at(1) + 0.8)
          line(label-pt, dest-pt, stroke: 0.5pt + gray)
          circle(label-pt, radius: 1.5pt, fill: gray)
          content(dest-pt, text(size: 8.5pt, fill: rgb("#0F766E"))[Thiết diện $S(x)$], anchor: "west")
          
          // Ghi cận a và b
          circle(proj(a, 0, 0), radius: 1.5pt, fill: black)
          content(proj(a, 0.2, 0), $a$, anchor: "south-east", size: 8pt)
          circle(proj(b, 0, 0), radius: 1.5pt, fill: black)
          content(proj(b, 0.2, 0), $b$, anchor: "south-west", size: 8pt)
        })
      ]
    ]
  )
]

#essay-box("Tư duy nhảy vọt: Tại sao diện tích nhân vi phân lại ra thể tích?")[
  Một trong những chỗ gây bối rối nhất cho học sinh là cảm giác "nhầm lẫn số chiều".
  
  Diện tích thiết diện $S(x)$ rõ ràng là một đại lượng $2$D. Làm sao ta có thể cộng dồn các đại lượng $2$D để tạo ra một vật thể $3$D? Nếu ta chỉ xếp các tấm bìa phẳng mỏng dính có độ dày bằng đúng $0$ chồng lên nhau, thể tích của chúng sẽ mãi mãi bằng $0$!
  
  Giải tích giải quyết nghịch lý này bằng khái niệm *vi phân* $dif x$. Ta không cộng các diện tích $2$D. Ta cộng các khối trụ vi phân $3$D có thể tích là $S(x) dif x$. Độ dày $dif x$ tuy vô cùng nhỏ nhưng khác không, đóng vai trò như hạt bụi kích thước vật lý. Tích phân là quá trình gom vô số hạt bụi $3$D ấy thành một lâu đài $3$D hoàn chỉnh.
]

#history-box("Bonaventura Cavalieri và Nguyên lý lượng không phân chia")[
  Vào thế kỷ 17, trước khi Newton và Leibniz định hình giải tích, Bonaventura Cavalieri (học trò của Galileo Galilei) đã đề xuất một phương pháp mang tính cách mạng: *Nguyên lý Cavalieri*.
  
  Ông tưởng tượng một hình phẳng được tạo thành từ vô số đoạn thẳng song song (lượng không phân chia của diện tích), và một khối 3D được tạo thành từ vô số thiết diện song song (lượng không phân chia của thể tích).
  
  *Trực giác chồng tiền xu:* Hãy tưởng tượng một xấp tiền xu xếp thẳng đứng thành một hình trụ hoàn hảo. Nếu ta xô lệch xấp tiền đó đi để tạo thành một hình trụ nghiêng xiên xẹo, thể tích của cả xấp tiền có thay đổi không? Rõ ràng là không, vì mỗi đồng xu vẫn giữ nguyên diện tích và độ dày của nó.
  
  *Nguyên lý Cavalieri phát biểu:* Nếu hai vật thể có chiều cao bằng nhau, và tại mọi độ cao tương ứng, các thiết diện cắt song song với đáy có diện tích bằng nhau, thì hai vật thể đó có thể tích bằng nhau. Trực giác đơn giản này đã giúp nhân loại tính được thể tích hình cầu, hình nón nghiêng mà không cần dùng đến các công thức tích phân phức tạp của thời đại sau.
]

== 7a. Khối Tròn Xoay: Khi Sự Đối Xứng Tròn Tạo Ra Thế Giới

#why-box[
  Khối tròn xoay là một avatar vô cùng phổ biến của tích phân trong đời sống thực tế: từ những chiếc bình gốm được chuốt trên bàn xoay, chiếc lốp xe, cho tới các chi tiết máy cơ khí chính xác tiện từ phôi kim loại.
  
  Về bản chất tư duy, đây không phải là một bài toán mới. Nó chỉ là một phiên bản đặc biệt của bài toán thiết diện khi vật thể có tính đối xứng trục.
]

#vd-box("6a", "Đồng nhất công thức: Từ thiết diện tròn đến thể tích tròn xoay")[
  #grid(
    columns: (1.25fr, 1.1fr),
    column-gutter: 15pt,
    align: horizon,
    [
      Xét một hình phẳng giới hạn bởi đường cong $y = f(x)$ ($f(x) >= 0$), trục hoành $O x$ và hai đường thẳng $x=a, x=b$. Quay hình phẳng này quanh trục $O x$ một vòng $360^degree$, ta thu được một *khối tròn xoay*.
      
      Nếu cắt khối này bằng một mặt phẳng vuông góc với trục $O x$ tại hoành độ $x$, thiết diện thu được luôn luôn là một *hình tròn* có bán kính $R(x)$ bằng đúng tung độ của đường sinh tại điểm đó:
      $ R(x) = f(x) $
      
      Do đó, diện tích thiết diện tại vị trí $x$ là:
      $ S(x) = pi R(x)^2 = pi [f(x)]^2 $
      
      Ráp công thức diện tích này vào công thức thiết diện tổng quát $V = integral_a^b S(x) dif x$, ta thu được công thức thể tích khối tròn xoay huyền thoại:
      $ V = integral_a^b pi [f(x)]^2 dif x = pi integral_a^b [f(x)]^2 dif x $
    ],
    [
      #align(center)[
        #canvas(length: 1.1cm, {
          import draw: *
          let sx = -0.35
          let sy = -0.25
          let proj(x, y, z) = (x + y * sx, z + y * sy)
          
          // Trục Ox, Oy, Oz
          line(proj(-0.5, 0, 0), proj(5.5, 0, 0), mark: (end: ">"), stroke: 0.5pt + gray)
          line(proj(0, -0.5, 0), proj(0, 3.2, 0), mark: (end: ">"), stroke: 0.5pt + gray)
          line(proj(0, 0, -0.5), proj(0, 0, 3.0), mark: (end: ">"), stroke: 0.5pt + gray)
          content(proj(5.5, 0, 0), $x$, size: 9pt, anchor: "north-west")
          content(proj(0, 3.2, 0), $y$, size: 9pt, anchor: "south-east")
          content(proj(0, 0, 3.0), $z$, size: 9pt, anchor: "south")
          
          // Hàm f(x) = 0.4 + 0.35 * x
          let f(x) = 0.4 + 0.35 * x
          let a = 1.0
          let b = 4.2
          
          // Vẽ các đường bao silhouette
          let upper-pts = ()
          let lower-pts = ()
          for i in range(0, 51) {
            let x = a + i * (b - a) / 50
            let r = f(x)
            upper-pts.push(proj(x, 0, r))
            lower-pts.push(proj(x, 0, -r))
          }
          
          // Elip biên a
          let ell-a = ()
          for i in range(0, 41) {
            let phi = i * 2 * calc.pi / 40
            ell-a.push(proj(a, f(a) * calc.cos(phi), f(a) * calc.sin(phi)))
          }
          line(..ell-a, stroke: 0.8pt + gray)
          
          // Elip biên b
          let ell-b = ()
          for i in range(0, 41) {
            let phi = i * 2 * calc.pi / 40
            ell-b.push(proj(b, f(b) * calc.cos(phi), f(b) * calc.sin(phi)))
          }
          line(..ell-b, stroke: 0.8pt + gray)
          
          // Silhouette
          line(..upper-pts, stroke: 1.2pt + rgb("#1D4E89"))
          line(..lower-pts, stroke: 1.2pt + rgb("#1D4E89"))
          
          // Lát đĩa tròn tại xs = 2.4
          let xs = 2.4
          let dx = 0.25
          let rs = f(xs)
          
          // Vẽ đĩa tròn
          let ell-s1 = ()
          let ell-s2 = ()
          for i in range(0, 41) {
            let phi = i * 2 * calc.pi / 40
            ell-s1.push(proj(xs, rs * calc.cos(phi), rs * calc.sin(phi)))
            ell-s2.push(proj(xs + dx, f(xs+dx) * calc.cos(phi), f(xs+dx) * calc.sin(phi)))
          }
          
          // Fill đĩa vi phân
          line(..ell-s1, close: true, fill: rgb("#B453091a"), stroke: 0.5pt + rgb("#B45309"))
          
          line(proj(xs, 0, rs), proj(xs + dx, 0, f(xs+dx)), stroke: 0.8pt + rgb("#B45309"))
          line(proj(xs, 0, -rs), proj(xs + dx, 0, -f(xs+dx)), stroke: 0.8pt + rgb("#B45309"))
          
          // Gióng bán kính R(x) = f(x)
          line(proj(xs, 0, 0), proj(xs, 0, rs), stroke: (paint: rgb("#B45309"), thickness: 1pt))
          circle(proj(xs, 0, 0), radius: 1.5pt, fill: black)
          circle(proj(xs, 0, rs), radius: 1.5pt, fill: rgb("#B45309"))
          content(proj(xs, -0.4, rs/2), text(fill: rgb("#B45309"), size: 8.5pt)[$R(x)=f(x)$], anchor: "east")
          
          // Ghi hoành độ x
          content(proj(xs, 0.2, 0), $x$, anchor: "south", size: 8pt)
          
          // Ký hiệu xoay vòng
          let rot-arc = ()
          for i in range(0, 21) {
            let phi = -calc.pi/3 + i * (2 * calc.pi / 3) / 20
            rot-arc.push(proj(b + 0.3, 0.4 * calc.cos(phi), 0.4 * calc.sin(phi)))
          }
          line(..rot-arc, stroke: 0.8pt + rgb("#C9A227"), mark: (end: ">"))
          content(proj(b + 0.6, 0, 0), text(fill: rgb("#C9A227"), size: 8pt)[$360^degree$])
        })
      ]
    ]
  )
]

#history-box("Johannes Kepler và các thùng rượu vang năm 1615")[
  Vào mùa thu năm 1613, nhà thiên văn học vĩ đại Johannes Kepler chuẩn bị làm đám cưới lần thứ hai tại Linz, Áo. Để phục vụ tiệc cưới, ông quyết định mua vài thùng rượu vang. 

  Khi người bán rượu đến đo thể tích của các thùng, họ chỉ sử dụng một cây thước sắt dài. Họ thọc cây thước chéo qua lỗ nạp ở sườn thùng cho tới khi chạm vào góc đáy đối diện, rồi đọc vạch chia trên cây thước để tính tiền.

  Kepler vô cùng kinh ngạc trước phương pháp này. Ông nhận ra rằng hai chiếc thùng có hình dạng hoàn toàn khác nhau — một chiếc mập mạp phình to ở giữa, chiếc kia thon dài thuôn đều — nếu có cùng chiều dài đường chéo chọc thước sẽ được tính cùng một thể tích và cùng một số tiền! Điều này rõ ràng là cực kỳ bất công và phi khoa học.

  Quá tức giận và tò mò, Kepler bắt tay vào nghiên cứu. Ông tưởng tượng thùng rượu được cấu tạo bằng cách xoay một đường cong quanh một trục. Sau đó, ông cắt lát thùng rượu thành vô số các đĩa tròn mỏng song song dọc theo trục, tính thể tích từng đĩa rồi cộng dồn chúng lại. 

  Năm 1615, ông công bố công trình nổi tiếng *Stereometria Doliorum* (Hình học lập thể của các thùng rượu vang). Đây được coi là một trong những cột mốc quan trọng nhất đặt nền móng cho phép tính tích phân hiện đại, chứng minh rằng những câu hỏi thực tế "rất đời thường" đôi khi chính là chất xúc tác mạnh mẽ nhất cho các phát kiến toán học vĩ đại.
]

== 8. Từ Kỹ Thuật Sang Cái Nhìn Hệ Thống

#tech-box[
  Ở tầng kỹ thuật, học sinh phải biết:

  - các công thức nguyên hàm cơ bản,
  - đổi biến,
  - tích phân từng phần,
  - xử lý diện tích hình phẳng,
  - xử lý thể tích khối tròn xoay,
  - và các bài toán ứng dụng thực tế.

  Nhưng ở tầng sâu hơn, mọi kỹ thuật ấy chỉ là biến thể của một vài câu hỏi nền:

  - cái gì đang tích lũy,
  - tích lũy theo biến nào,
  - cận tích phân đến từ hiện tượng nào,
  - và có thể thay bài toán hình học hay vật lý này về một hàm số nào để tích lũy không.
]

#essay-box("Một người học tốt khác gì một người chỉ làm bài nhiều?")[
  Người làm bài nhiều có thể nhớ rất nhiều mẫu. Người học sâu thì thấy một bộ xương chung lặp lại bên dưới nhiều mẫu khác nhau.

  Với nguyên hàm và tích phân, bộ xương ấy là: *đại lượng vi mô + quy luật cộng dồn + miền tích lũy = đại lượng toàn cục*.
]

== 9. Bản Đồ Tư Duy Của Quyển 3

#core-box[
  Nếu phải nén cả quyển vào chín mệnh đề, tôi sẽ nén như sau:

  - Đạo hàm đo thay đổi cục bộ.
  - Nguyên hàm phục hồi một đại lượng từ quy luật thay đổi.
  - Hằng số tích phân là dấu vết của dữ kiện ban đầu còn thiếu.
  - Tích phân xác định là giới hạn của việc cộng dồn liên tục.
  - Định lý cơ bản nối nguyên hàm với tích phân xác định.
  - Tích phân có dấu là tích lũy có định hướng.
  - Diện tích chỉ là một avatar của tích phân.
  - Thể tích bằng thiết diện là một avatar khác.
  - Mô hình hóa bằng tích phân là nơi giải tích chạm vào thế giới thực.
]

#bridge-box("Từ phần khai mở tới xưởng kỹ thuật sâu")[
  Phần dưới của quyển này không chỉ là phần bài tập. Nó là xưởng hiện thực hóa toàn bộ bản đồ trên:

  - từ nguyên hàm cơ bản đến điều kiện đầu,
  - từ tích lũy trong động học đến công cơ học,
  - từ diện tích hình phẳng đến thể tích bằng thiết diện,
  - từ khối tròn xoay đến các bài toán mô hình thực tế.

  Nếu phần khai mở ở đây làm đúng việc của nó, thì khi sang phần xưởng sâu, em sẽ không còn thấy mình đang xử lý một loạt công thức rời rạc. Em sẽ thấy mình đang theo đuổi cùng một ý tưởng dưới nhiều lớp áo.
]

#open-q[
  Nếu đạo hàm trả lời câu hỏi "nó đang thay đổi ra sao ngay lúc này", thì nguyên hàm và tích phân trả lời câu hỏi gì về lịch sử tích lũy của cả một quá trình?
]

#include "01a-tong-riemann.typ"

#include "01b-dinh-ly-co-ban.typ"

#include "01c-doi-bien-phan-tung-phan.typ"

#include "01d-dien-tich-the-tich-mat-do.typ"

#include "01e-ham-tich-luy.typ"

#include "01f-ngo-nhan-thuong-gap.typ"

#include "01g-gia-tri-trung-binh.typ"

#include "01h-dieu-kien-dau.typ"

#include "01i-tich-phan-so.typ"

#include "01j-can-di-dong.typ"

#include "01k-doi-xung-triet-tieu.typ"

#include "01l-lich-su-tu-tuong.typ"

#include "01m-bai-luan-tu-duy.typ"

#include "01n-ban-do-lien-mon.typ"

#include "01o-thay-doi-rong.typ"

#include "01p-tich-phan-suy-rong.typ"

#include "01q-ky-vong-lien-tuc.typ"

#include "01r-dinh-ly-gia-tri-trung-binh.typ"

#include "01s-bo-ba-thong-nhat.typ"
