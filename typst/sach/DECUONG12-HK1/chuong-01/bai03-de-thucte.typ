#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display


#muc([Đề Luyện Tập — Ứng Dụng Thực Tế Bài Toán Tiệm Cận])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (10 câu)], count: 10)

#tn(
  dir: "ngang",
  [Một nhà máy sản xuất bóng đèn có chi phí cố định hàng ngày là $8$ triệu đồng. Chi phí nguyên liệu để sản xuất mỗi bóng đèn là $20$ nghìn đồng. Hàm chi phí trung bình để sản xuất một bóng đèn khi sản lượng là $x$ bóng mỗi ngày được cho bởi $C(x) = (8000 + 20x)/x$ (nghìn đồng). Khi sản lượng $x$ tăng lên không giới hạn, chi phí trung bình để sản xuất một bóng đèn tiến về giá trị nào?
  #align(center)[
    #canvas(length: 1cm, {
      draw.line((0, 0), (6, 0), mark: (end: ">")) // Trục Ox
      draw.line((0, 0), (0, 5), mark: (end: ">")) // Trục Oy
      draw.content((6.2, 0), [$x$])
      draw.content((0, 5.2), [$C(x)$])
      
      // Tiệm cận ngang y = 20 (scale lại thành y = 2)
      draw.line((0, 2), (5.5, 2), stroke: (paint: red, dash: "dashed"))
      draw.content((-0.4, 2), [$20$])
      
      // Đồ thị hàm số C(x) = 8000/x + 20
      draw.bezier((0.5, 4.5), (5, 2.1), (1.5, 2.3), stroke: blue)
    })
  ]
  ],
  (
    [$0$ nghìn đồng.],
    [$8000$ nghìn đồng.],
    True([$20$ nghìn đồng.]),
    [$28$ nghìn đồng.]
  ),
  loigiai: [
    #step[Khi sản lượng $x$ tăng không giới hạn có nghĩa là $x -> +oo$.]
    #step[Ta cần tìm giới hạn của $C(x)$ khi $x -> +oo$:]
    #step[$limits(lim)_(x -> +oo) C(x) = limits(lim)_(x -> +oo) (8000 + 20x)/x = limits(lim)_(x -> +oo) (8000/x + 20) = 20$.]
    #step[Điều này có nghĩa là khi sản xuất càng nhiều bóng đèn, phần chi phí cố định phân bổ cho mỗi bóng càng tiến gần đến $0$, và chi phí trung bình cho mỗi bóng tiệm cận với chi phí biên là $20$ nghìn đồng. Trên đồ thị, đường cong chi phí (màu xanh) tiệm cận đường ngang $y = 20$ (nét đứt màu đỏ).]
  ]
)

#tn(
  dir: "ngang",
  [Nồng độ của một loại thuốc trong máu bệnh nhân (mg/L) theo thời gian $t$ giờ sau khi tiêm được mô tả bởi hàm số $C(t) = (5t)/(t^2 + 4)$ ($t >= 0$). Hỏi nồng độ thuốc tiến về giá trị nào khi thời gian trôi đi rất lâu?],
  (
    [$5$ mg/L.],
    [$4$ mg/L.],
    [$1$ mg/L.],
    True([$0$ mg/L.])
  ),
  loigiai: [
    #step[Khi thời gian tiến đến vô cùng, ta cần tính $limits(lim)_(t -> +oo) C(t)$.]
    #step[$limits(lim)_(t -> +oo) (5t)/(t^2 + 4) = limits(lim)_(t -> +oo) (5/t)/(1 + 4/t^2) = 0/1 = 0$.]
    #step[Về mặt thực tế, điều này chứng tỏ thuốc sẽ bị cơ thể đào thải dần và nồng độ tiến về $0$ sau một thời gian dài. Đồ thị $C(t)$ nhận trục hoành $y = 0$ làm tiệm cận ngang.]
  ]
)

#tn(
  dir: "ngang",
  [Một mô hình học tập Ebbinghaus chỉ ra số lượng từ vựng $W$ (từ) một học sinh có thể ghi nhớ sau $t$ tháng ôn tập được tính bằng $W(t) = (1200t)/(t + 6)$. Ngưỡng bão hòa trí nhớ (số từ tối đa có thể ghi nhớ khi $t -> +oo$) là bao nhiêu từ?
  #align(center)[
    #canvas(length: 1cm, {
      draw.line((0, 0), (6, 0), mark: (end: ">")) // Trục Ox
      draw.line((0, 0), (0, 4), mark: (end: ">")) // Trục Oy
      draw.content((6.2, 0), [$t$])
      draw.content((0, 4.2), [$W(t)$])
      
      // Tiệm cận ngang y = 1200 (scale lại thành y = 3)
      draw.line((0, 3), (5.5, 3), stroke: (paint: red, dash: "dashed"))
      draw.content((-0.6, 3), [$1200$])
      
      // Đồ thị hàm số W(t) = 1200t/(t + 6)
      draw.bezier((0, 0), (5, 2.8), (2, 2.5), stroke: orange)
    })
  ]
  ],
  (
    [$6$ từ.],
    [$200$ từ.],
    True([$1200$ từ.]),
    [$1800$ từ.]
  ),
  loigiai: [
    #step[Ngưỡng bão hòa là giới hạn của số lượng từ vựng khi thời gian $t -> +oo$.]
    #step[Ta tính $limits(lim)_(t -> +oo) W(t) = limits(lim)_(t -> +oo) (1200t)/(t + 6) = limits(lim)_(t -> +oo) 1200/(1 + 6/t) = 1200$.]
    #step[Ngưỡng bão hòa là $1200$ từ. Đây chính là giá trị của đường tiệm cận ngang $W = 1200$ (đường nét đứt màu đỏ trên đồ thị).]
  ]
)

#tn(
  dir: "ngang",
  [Theo định luật Boyle, áp suất $P$ (atm) của một lượng khí lý tưởng không đổi ở nhiệt độ nhất định tỉ lệ nghịch với thể tích $V$ (lít) theo công thức $P(V) = 10/V$. Khi thể tích khí bị ép sát về $0$, áp suất $P$ thay đổi như thế nào, và đồ thị $P(V)$ có đường tiệm cận nào?],
  (
    [$P -> 0$; TCN là $P = 0$.],
    True([$P -> +oo$; TCĐ là $V = 0$.]),
    [$P -> 10$; TCN là $P = 10$.],
    [$P -> -oo$; TCĐ là $V = 0$.]
  ),
  loigiai: [
    #step[Ta tính giới hạn của hàm $P(V)$ khi $V -> 0^+$ (thể tích nén lại gần bằng $0$).]
    #step[$limits(lim)_(V -> 0^+) 10/V = +oo$ (do $10 > 0$ và $V > 0$).]
    #step[Điều này cho thấy, khi thể tích càng nhỏ, áp suất chất khí trong bình sẽ tăng mạnh mẽ không giới hạn. Đồ thị $P(V)$ sẽ có đường tiệm cận đứng là trục tung $V = 0$.]
  ]
)

#tn(
  dir: "ngang",
  [Doanh thu $R$ (triệu đồng) của một công ty phụ thuộc vào chi phí quảng cáo $x$ (triệu đồng) theo mô hình $R(x) = (400x)/(x + 50) + 200$ ($x >= 0$). Khi chi phí quảng cáo tăng không giới hạn, doanh thu tiến về ngưỡng giới hạn nào?],
  (
    [$400$ triệu đồng.],
    [$200$ triệu đồng.],
    True([$600$ triệu đồng.]),
    [$450$ triệu đồng.]
  ),
  loigiai: [
    #step[Khi chi phí quảng cáo tăng không giới hạn, ta xét giới hạn $x -> +oo$.]
    #step[$limits(lim)_(x -> +oo) R(x) = limits(lim)_(x -> +oo) ((400x)/(x + 50) + 200) = limits(lim)_(x -> +oo) (400/(1 + 50/x)) + 200 = 400 + 200 = 600$.]
    #step[Đồ thị hàm số có tiệm cận ngang là $R = 600$. Điều này cho thấy dung lượng thị trường bị giới hạn, dù chi bao nhiêu tiền quảng cáo thì doanh thu cũng không thể vượt quá $600$ triệu đồng.]
  ]
)

#tn(
  dir: "ngang",
  [Trong vật lý, công suất $P$ (W) sinh ra bởi một hệ thống tua-bin gió phụ thuộc vào vận tốc gió $v$ (m/s) theo hàm số $P(v) = (500v^3)/(v^3 + 200)$ ($v >= 0$). Công suất tối đa lý thuyết mà tua-bin có thể đạt được khi có gió bão cực mạnh là bao nhiêu?],
  (
    [$200$ W.],
    [$0$ W.],
    True([$500$ W.]),
    [Vô hạn.]
  ),
  loigiai: [
    #step[Khi có gió bão cực mạnh, ta xét giới hạn của $P(v)$ khi vận tốc gió $v -> +oo$.]
    #step[$limits(lim)_(v -> +oo) P(v) = limits(lim)_(v -> +oo) (500v^3)/(v^3 + 200) = limits(lim)_(v -> +oo) 500/(1 + 200/v^3) = 500$.]
    #step[Như vậy, công suất tối đa theo thiết kế của tua-bin sẽ tiệm cận giới hạn là $500$ W. Tiệm cận ngang của đồ thị là $P = 500$.]
  ]
)

#tn(
  dir: "ngang",
  [Số lượng cá trong một hồ nuôi (nghìn con) theo năm thứ $t$ được mô hình bởi hàm sinh trưởng Logistic $P(t) = 80/(1 + 15 e^(-0.4t))$ ($t >= 0$). Sức chứa tối đa của hồ (ngưỡng sinh thái) là bao nhiêu nghìn con?],
  (
    [$15$ nghìn con.],
    [$5$ nghìn con.],
    [$0$ nghìn con.],
    True([$80$ nghìn con.])
  ),
  loigiai: [
    #step[Ngưỡng sức chứa của môi trường chính là giá trị tiệm cận ngang của quần thể khi thời gian $t -> +oo$.]
    #step[Khi $t -> +oo$, ta có $-0.4t -> -oo$, do đó $limits(lim)_(t -> +oo) e^(-0.4t) = 0$.]
    #step[$limits(lim)_(t -> +oo) P(t) = 80/(1 + 15 dot 0) = 80/1 = 80$.]
    #step[Quần thể cá sẽ ổn định và không thể vượt quá mức sức chứa tối đa của hồ là $80$ nghìn con. Đường $P = 80$ là TCN của đồ thị.]
  ]
)

#tn(
  dir: "ngang",
  [Một vật rơi tự do có lực cản không khí, vận tốc $v(t)$ (m/s) phụ thuộc vào thời gian $t$ (s) ($t >= 0$) theo công thức $v(t) = 50(1 - e^(-0.2t))$. Vận tốc rơi cuối (vận tốc giới hạn) của vật đó là bao nhiêu?
  #align(center)[
    #canvas(length: 1cm, {
      draw.line((0, 0), (6, 0), mark: (end: ">")) 
      draw.line((0, 0), (0, 4), mark: (end: ">")) 
      draw.content((6.2, 0), [$t$])
      draw.content((0, 4.2), [$v(t)$])
      
      // Tiệm cận ngang v = 50 (scale lại thành y = 3)
      draw.line((0, 3), (5.5, 3), stroke: (paint: red, dash: "dashed"))
      draw.content((-0.4, 3), [$50$])
      
      // Đồ thị hàm số v(t)
      draw.bezier((0, 0), (5, 2.9), (1.5, 2.5), stroke: blue)
    })
  ]
  ],
  (
    [$0$ m/s.],
    [$25$ m/s.],
    True([$50$ m/s.]),
    [Vô hạn.]
  ),
  loigiai: [
    #step[Vận tốc giới hạn đạt được khi thời gian $t$ tiến ra vô cực ($t -> +oo$).]
    #step[Ta tính giới hạn: $limits(lim)_(t -> +oo) v(t) = limits(lim)_(t -> +oo) 50(1 - e^(-0.2t))$.]
    #step[Vì $limits(lim)_(t -> +oo) e^(-0.2t) = 0$, nên $limits(lim)_(t -> +oo) v(t) = 50(1 - 0) = 50$.]
    #step[Vận tốc rơi tiệm cận $50$ m/s do lực cản không khí sẽ cân bằng với trọng lực. Đường thẳng màu đỏ $y = 50$ là tiệm cận ngang của hàm vận tốc.]
  ]
)

#tn(
  dir: "ngang",
  [Mực nước của một con đập thủy điện vào tháng thứ $t$ được mô phỏng bởi hàm $h(t) = (10t^2 + 5t + 100)/(t^2 + 2)$ (mét). Hỏi sau rất nhiều năm, mực nước trung bình của con đập sẽ ổn định ở mức bao nhiêu mét?],
  (
    [$5$ mét.],
    [$100$ mét.],
    True([$10$ mét.]),
    [$0$ mét.]
  ),
  loigiai: [
    #step[Sau rất nhiều năm có nghĩa là $t -> +oo$.]
    #step[Ta tính giới hạn $limits(lim)_(t -> +oo) h(t) = limits(lim)_(t -> +oo) (10t^2 + 5t + 100)/(t^2 + 2) = limits(lim)_(t -> +oo) (10 + 5/t + 100/t^2)/(1 + 2/t^2) = 10$.]
    #step[Mực nước sẽ dao động và cuối cùng ổn định quanh mức $10$ mét. Đồ thị $h(t)$ nhận đường $y = 10$ làm tiệm cận ngang.]
  ]
)

#tn(
  dir: "ngang",
  [Số dân của một thành phố sau $t$ năm (kể từ năm 2000) được mô phỏng bởi hàm số $f(t) = (20t + 10)/(t + 1)$ (đơn vị: triệu người). Vào năm nào thì dân số của thành phố tiệm cận đến đúng 20 triệu người?],
  (
    [$2001$.],
    [$2020$.],
    True([Không bao giờ đạt được.]),
    [$2010$.]
  ),
  loigiai: [
    #step[Giới hạn của dân số khi thời gian tiến ra xa vô tận là $limits(lim)_(t -> +oo) f(t) = limits(lim)_(t -> +oo) (20t + 10)/(t + 1) = 20$.]
    #step[Tức là, đồ thị của $f(t)$ có tiệm cận ngang $y = 20$.]
    #step[Biến đổi $f(t) = (20(t + 1) - 10)/(t + 1) = 20 - 10/(t + 1)$. Với mọi $t >= 0$, ta có phân số $10/(t + 1) > 0$.]
    #step[Do đó $f(t) = 20 - 10/(t + 1) < 20$ với mọi $t >= 0$.]
    #step[Điều này chứng tỏ dân số thành phố luôn tăng dần và chỉ *tiến sát* tới mốc 20 triệu người chứ không bao giờ thực sự đạt được con số đúng 20 triệu.]
  ]
)

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  dir: "doc",
  [Nhiệt độ $T$ ($degree$C) của một tách cà phê sau $t$ phút kể từ khi pha được mô phỏng bởi định luật làm mát Newton có phương trình $T(t) = 25 + 65e^(-0.1t)$.
  #align(center)[
    #canvas(length: 1cm, {
      draw.line((0, 0), (6, 0), mark: (end: ">")) 
      draw.line((0, 0), (0, 4), mark: (end: ">")) 
      draw.content((6.2, 0), [$t$])
      draw.content((0, 4.2), [$T(t)$])
      
      // TCN y = 25 (tỉ lệ y=1)
      draw.line((0, 1), (5.5, 1), stroke: (paint: red, dash: "dashed"))
      draw.content((-0.4, 1), [$25$])
      
      // Nhiệt độ ban đầu y = 90 (tỉ lệ y=3.5)
      draw.content((-0.4, 3.5), [$90$])
      
      draw.bezier((0, 3.5), (5, 1.1), (1.5, 1.3), stroke: purple)
    })
  ]
  Xét tính đúng sai của các phát biểu sau:],
  (
    True([Nhiệt độ ban đầu của tách cà phê là $90degree$C.]),
    [Nhiệt độ của cà phê có thể giảm xuống dưới $25degree$C sau 30 phút.],
    True([Đồ thị hàm số $T(t)$ có một đường tiệm cận ngang là $T = 25$.]),
    [Đường tiệm cận ngang này đại diện cho nhiệt độ cực đại mà cà phê có thể đạt tới.]
  ),
  loigiai: [
    #step[a) Nhiệt độ ban đầu là lúc $t = 0$. Thay vào hàm số: $T(0) = 25 + 65e^0 = 25 + 65 = 90$ ($degree$C). Dựa vào hình vẽ, đường màu tím cũng xuất phát từ mốc 90. (Đúng)]
    #step[b) Vì $65e^(-0.1t) > 0$ với mọi $t$, nên $T(t) = 25 + 65e^(-0.1t) > 25$ với mọi $t >= 0$. Cà phê sẽ nguội dần nhưng không bao giờ giảm xuống dưới $25degree$C. (Sai)]
    #step[c) Xét khi $t -> +oo$, ta có $limits(lim)_(t -> +oo) e^(-0.1t) = 0$. Vậy $limits(lim)_(t -> +oo) T(t) = 25$. Đồ thị có tiệm cận ngang là $T = 25$ (đường đứt khúc màu đỏ). (Đúng)]
    #step[d) Tiệm cận ngang $T = 25$ đại diện cho nhiệt độ môi trường xung quanh (room temperature). Cà phê nóng hơn môi trường nên nguội dần và cân bằng với môi trường ở mức $25degree$C chứ không phải là nhiệt độ cực đại. (Sai)]
  ]
)

#ds(
  dir: "doc",
  [Một công ty tính toán rằng chi phí tổng cộng để làm sạch $p%$ lượng rác thải hóa học tại một dòng sông là $C(p) = (50000p)/(100 - p)$ (USD), với $0 <= p < 100$. Xét tính đúng sai của các nhận định:],
  (
    [Để làm sạch 50% rác thải, cần tốn đúng 25,000 USD.],
    True([Đồ thị của hàm số $C(p)$ có một đường tiệm cận đứng tại $p = 100$.]),
    [Sự xuất hiện của đường tiệm cận đứng cho thấy có thể làm sạch hoàn toàn 100% rác thải với chi phí rất rẻ.],
    True([Nếu công ty chỉ có ngân sách tối đa là 450,000 USD, họ có thể làm sạch được tối đa 90% lượng rác thải.])
  ),
  loigiai: [
    #step[a) $C(50) = (50000 dot 50)/(100 - 50) = 2500000 / 50 = 50000$ USD. (Sai, chi phí là $50,000$ chứ không phải $25,000$)]
    #step[b) Khi tỉ lệ làm sạch $p$ tiến tới $100%$, ta xét $p -> 100^-$. Mẫu số $100 - p -> 0^+$, tử số $50000p -> 5000000 > 0$. Vậy $limits(lim)_(p -> 100^-) C(p) = +oo$. Đồ thị có TCĐ $p = 100$. (Đúng)]
    #step[c) Ý nghĩa của đường tiệm cận đứng $p = 100$ là chi phí $C$ sẽ tiến tới vô cực (vô cùng tốn kém) khi tỷ lệ làm sạch tiến sát mức $100%$. Việc làm sạch triệt để là bất khả thi về mặt tài chính. Không hề rẻ. (Sai)]
    #step[d) Để tìm tỉ lệ với ngân sách 450,000 USD: $(50000p)/(100 - p) = 450000 <=> 50p = 450(100 - p) <=> 50p = 45000 - 450p <=> 500p = 45000 <=> p = 90$. Công ty chỉ làm sạch được $90%$ rác thải. (Đúng)]
  ]
)

#ds(
  dir: "doc",
  [Giá trị một chiếc ô tô hạng sang sau $t$ năm sử dụng được dự đoán bởi hàm số $V(t) = 500/(t + 2) + 50$ (triệu đồng), với $t >= 0$. Xét tính đúng sai:],
  (
    True([Lúc mới mua, giá trị ô tô là 300 triệu đồng.]),
    True([Đồ thị của hàm số giá trị xe có một tiệm cận ngang là đường $V = 50$.]),
    [Giá trị ô tô tăng dần theo thời gian sử dụng.],
    [Đường tiệm cận ngang cho biết xe sẽ hoàn toàn mất giá trị ($V = 0$) sau một thời gian dài.]
  ),
  loigiai: [
    #step[a) Khi mới mua tức lúc $t = 0$: $V(0) = 500/(0 + 2) + 50 = 250 + 50 = 300$ (triệu đồng). (Đúng)]
    #step[b) Khi $t -> +oo$, ta có $limits(lim)_(t -> +oo) V(t) = limits(lim)_(t -> +oo) (500/(t + 2) + 50) = 0 + 50 = 50$. Đồ thị có TCN là đường thẳng $V = 50$. (Đúng)]
    #step[c) Đạo hàm $V'(t) = -500/(t + 2)^2 < 0$ với mọi $t >= 0$. Hàm số nghịch biến nên giá trị xe liên tục giảm dần (khấu hao theo thời gian). (Sai)]
    #step[d) Tiệm cận ngang $V = 50$ mang ý nghĩa là sau rất nhiều năm sử dụng, chiếc xe không bao giờ rớt giá về $0$ mà sẽ còn giữ lại một "giá trị phế liệu" cố định là $50$ triệu đồng. (Sai)]
  ]
)

#ds(
  dir: "doc",
  [Dân số của một loài vi khuẩn trong phòng thí nghiệm sau $t$ giờ được đo bằng hàm số $N(t) = (100t^2 + 50t + 200)/(t^2 + 2t + 5)$ (nghìn con), với $t >= 0$. Xét tính đúng sai:],
  (
    [Dân số ban đầu là 200 nghìn con.],
    True([Hàm số sinh trưởng này không có tiệm cận đứng trên tập xác định của nó.]),
    True([Sau một khoảng thời gian vô tận, quần thể vi khuẩn duy trì ổn định ở mức 100 nghìn con.]),
    True([Dân số của loài vi khuẩn luôn nhỏ hơn 100 nghìn con tại mọi thời điểm $t >= 0$.])
  ),
  loigiai: [
    #step[a) Dân số ban đầu là khi $t = 0$, $N(0) = 200/5 = 40$ (nghìn con). (Sai)]
    #step[b) Xét phương trình mẫu số: $t^2 + 2t + 5 = 0 <=> (t + 1)^2 + 4 = 0$ (Vô nghiệm). Vì mẫu số luôn lớn hơn 0 nên đồ thị hàm số không bao giờ có tiệm cận đứng. (Đúng)]
    #step[c) Tính giới hạn bão hòa: $limits(lim)_(t -> +oo) N(t) = limits(lim)_(t -> +oo) (100 + 50/t + 200/t^2)/(1 + 2/t + 5/t^2) = 100/1 = 100$. Vậy quần thể ổn định và có đường TCN ở mức $N = 100$. (Đúng)]
    #step[d) Ta xét dấu hiệu số $N(t) - 100$:
    $N(t) - 100 = (100t^2 + 50t + 200)/(t^2 + 2t + 5) - 100 = (100t^2 + 50t + 200 - 100t^2 - 200t - 500)/(t^2 + 2t + 5) = (-150t - 300)/(t^2 + 2t + 5)$.
    Vì thời gian $t >= 0$ nên tử số $-150t - 300 < 0$, mẫu số dương. Suy ra $N(t) - 100 < 0 => N(t) < 100$ với mọi $t >= 0$. Quần thể tiệm cận lên 100 nhưng không bao giờ chạm tới. (Đúng)]
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  dir: "ngang",
  [Nồng độ oxy trong một hồ nước bị ô nhiễm sau $t$ ngày được đo bằng hàm số $O(t) = (15t^2 - 20t + 10)/(3t^2 + 5)$ (mg/L). Nồng độ oxy sẽ tiệm cận đến mức nào sau một khoảng thời gian vô tận?],
  [$5$],
  loigiai: [
    #step[Ta cần tính $limits(lim)_(t -> +oo) O(t) = limits(lim)_(t -> +oo) (15t^2 - 20t + 10)/(3t^2 + 5)$.]
    #step[Chia cả tử và mẫu cho $t^2$, ta được: $limits(lim)_(t -> +oo) (15 - 20/t + 10/t^2)/(3 + 5/t^2) = 15/3 = 5$.]
    #step[Vậy nồng độ oxy của hồ tiệm cận và phục hồi ở mức cân bằng là $5$ mg/L.]
  ]
)

#tln(
  dir: "ngang",
  [Khối lượng chất thải phóng xạ còn lại $M$ (gram) sau thời gian $t$ năm tuân theo quy luật phân rã $M(t) = 200 e^(-0.05t)$. Khi thời gian tiến đến vô cùng, khối lượng chất thải tiến đến bao nhiêu gram?],
  [$0$],
  loigiai: [
    #step[Khi thời gian tiến đến vô cực: $t -> +oo => -0.05t -> -oo$.]
    #step[Biết rằng giới hạn của hàm mũ cơ số $e$ với số mũ âm vô cùng là bằng 0: $limits(lim)_(t -> +oo) e^(-0.05t) = 0$.]
    #step[Do đó $limits(lim)_(t -> +oo) M(t) = 200 dot 0 = 0$.]
    #step[Dù quá trình rất chậm nhưng chất phóng xạ sẽ bị phân rã hoàn toàn, khối lượng tiệm cận $0$ gram. Đồ thị nhận trục hoành làm tiệm cận ngang.]
  ]
)

#tln(
  dir: "ngang",
  [Hiệu suất sản xuất $E$ (%) của một hệ thống pin quang điện phụ thuộc vào cường độ sáng $I$ (Lux) theo mô hình $E(I) = (80I)/(I + 500)$ với $I >= 0$. Giới hạn hiệu suất tối đa (tiệm cận ngang) mà tấm pin có thể đạt được là bao nhiêu phần trăm?],
  [$80$],
  loigiai: [
    #step[Hiệu suất tối đa lý thuyết đạt được khi cường độ sáng chiếu vào vô cùng mạnh, tức $I -> +oo$.]
    #step[Ta tính $limits(lim)_(I -> +oo) E(I) = limits(lim)_(I -> +oo) (80I)/(I + 500) = limits(lim)_(I -> +oo) 80/(1 + 500/I) = 80$.]
    #step[Vậy hiệu suất lý thuyết tiệm cận đến ngưỡng $80%$. Đây là rào cản vật lý (tiệm cận ngang) không thể vượt qua.]
  ]
)

#tln(
  dir: "ngang",
  [Lực tĩnh điện $F$ (Newton) giữa hai điện tích điểm thay đổi theo khoảng cách $d$ (mét) giữa chúng tuân theo định luật Coulomb với quy luật $F(d) = 100/d^2$. Lực tương tác sẽ tiến tới vô cực khi khoảng cách $d$ tiệm cận về giá trị nào?],
  [$0$],
  loigiai: [
    #step[Đường tiệm cận đứng của đồ thị lực $F$ biểu thị cho hiện tượng lực tiến tới vô cùng lớn.]
    #step[Ta thấy $F(d) -> +oo$ khi và chỉ khi mẫu số $d^2 -> 0 <=> d -> 0$.]
    #step[Vậy khi $d$ tiệm cận về $0$ (hai điện tích vô cùng gần nhau), lực tương tác sẽ hút hoặc đẩy lớn vô hạn.]
  ]
)

#tln(
  dir: "ngang",
  [Lợi nhuận lũy kế $P(x)$ (tỷ đồng) của một tập đoàn bất động sản khi đầu tư số vốn $x$ (ngàn tỷ đồng) vào một đại dự án được mô hình bởi $P(x) = (2x^2 + 5x + 1)/(x - 2)$ (với $x > 2$). Biết rằng khi nguồn vốn đầu tư mở rộng vô hạn, đường cong lợi nhuận sẽ bám sát một đường tiệm cận xiên $y = a x + b$. Tính giá trị của $a + b$.],
  [$11$],
  loigiai: [
    #step[Thực hiện phép chia đa thức tử cho đa thức mẫu để tìm phần thương, chính là đường tiệm cận xiên.]
    #step[$2x^2 + 5x + 1 = 2x(x - 2) + 9x + 1 = 2x(x - 2) + 9(x - 2) + 19$.]
    #step[Hàm số được viết lại dưới dạng: $P(x) = 2x + 9 + 19/(x - 2)$.]
    #step[Khi $x -> +oo$, phần dư $19/(x - 2) -> 0$. Do đó, đường tiệm cận xiên của mô hình là đường thẳng $y = 2x + 9$.]
    #step[Từ đó suy ra $a = 2, b = 9 => a + b = 2 + 9 = 11$.]
  ]
)

#tln(
  dir: "ngang",
  [Thời gian hoàn thành một vòng đua $T$ (phút) của các tay đua trong một giải đấu F1 phụ thuộc vào số tháng $m$ họ tập luyện chuyên nghiệp trước đó theo hàm $T(m) = 120 + 200/(m^2 + 2m - 15)$ với $m > 3$. Khi tay đua có kinh nghiệm tập luyện tiến đến vô hạn ($m -> +oo$), thời gian dự kiến họ hoàn thành vòng đua tốt nhất là bao nhiêu phút?],
  [$120$],
  loigiai: [
    #step[Kinh nghiệm tập luyện tiến đến vô hạn tương ứng với việc tính giới hạn của hàm $T(m)$ khi $m -> +oo$.]
    #step[$limits(lim)_(m -> +oo) T(m) = limits(lim)_(m -> +oo) (120 + 200/(m^2 + 2m - 15))$.]
    #step[Phân thức $200/(m^2 + 2m - 15)$ có tử số là hằng số và mẫu số bậc hai tiến ra vô cực, nên giới hạn của nó bằng 0.]
    #step[Do đó $limits(lim)_(m -> +oo) T(m) = 120 + 0 = 120$.]
    #step[Một tay đua cực kì lão luyện sẽ bám sát thành tích (tiệm cận ngang) là $120$ phút.]
  ]
)
