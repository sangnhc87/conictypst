# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG VII: CUỘC HÔN PHỐI VĨ ĐẠI NHẤT — PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 19, Bài 20, Bài 21, Bài 22, Bài 23 SGK Toán 10 cùng Chuyên đề Thuật toán Bresenham GPU, Máy Tán sỏi thận ESWL, Định vị Hàng hải LORAN-C & Ba đường Conic (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 19: TỌA ĐỘ CỦA VECTƠ VÀ ĐIỂM — GIẤC MƠ ĐÊM MÙA ĐÔNG CỦA RENÉ DESCARTES

Trước thế kỷ XVII, toán học bị chia cắt thành hai lãnh địa hoàn toàn tách biệt và gần như thù địch nhau:
1. *Hình học (Geometry)* của người Hy Lạp: Xứ sở của những hình vẽ trừu tượng bằng compa và thước kẻ, thanh tao, cao quý nhưng cực kỳ khó tính toán và khó giải phóng trí tưởng tượng.
2. *Đại số (Algebra)* của người Ả Rập: Xứ sở của những con số và phương trình biến đổi khô khan, nhưng thiếu đi linh hồn thị giác của không gian.

Hai nhánh toán học vĩ đại ấy dường như không bao giờ có thể gặp nhau, cho đến một đêm mùa đông định mệnh làm thay đổi vĩnh viễn lịch sử khoa học.

#story-box(
  title: "Giấc mơ đêm mùa đông 1619 & Con ruồi trên trần nhà của René Descartes",
  author: "René Descartes (Pháp, 1596 – 1650)",
)[
  Đêm ngày 10 tháng 11 năm 1619, tại một thị trấn nhỏ bên bờ sông Danube ở nước Đức, một chàng sĩ quan quân đội trẻ người Pháp tên là *René Descartes* đang nằm trùm chăn co ro trong một căn phòng có lò sưởi bằng gốm. Descartes vốn có thể chất yếu ớt từ nhỏ, thường xuyên đau ốm nên có thói quen nằm dài trên giường suy ngẫm đến tận trưa mới dậy.
  
  Khi nhìn lên trần nhà bằng gỗ có những thanh xà ngang và xà dọc đan chéo nhau thành những ô vuông bàn cờ, Descartes nhìn thấy một con ruồi đang bò chậm chạp trên trần nhà. Trong một khoảnh khắc giác ngộ thần thánh, một tia chớp tư tưởng bùng nổ trong đầu ông:
  
  *“Tại sao mình lại không thể mô tả vị trí chính xác của con ruồi này bằng hai con số: khoảng cách từ con ruồi đến bức tường bên trái ($x$), và khoảng cách từ con ruồi đến bức tường phía trước ($y$)?”*
  
  Khi con ruồi bò di chuyển, vị trí của nó sẽ vạch ra một đường cong trong không gian. Và đường cong ấy hoàn toàn có thể biểu diễn bằng một phương trình đại số nối liền hai biến số $x$ và $y$! 
  
  Đêm hôm đó, Descartes nằm mơ thấy ba giấc mơ kỳ lạ về một "cuốn từ điển khoa học phổ quát". Sáng hôm sau tỉnh dậy, ông đã đặt bút khai sinh ra *Phương pháp tọa độ (Hệ tọa độ Descartes $O x y$)* — cuộc hôn phối vĩ đại nhất trong lịch sử toán học! Từ khoảnh khắc đó, *Hình học đã biến thành Đại số, và Đại số đã tìm thấy linh hồn Hình học!* Mọi bài toán hình học hóc búa nhất đều có thể được giải quyết bằng những phép tính đại số tuần tự của máy tính mà không cần bất kỳ sự lóe sáng trực giác may rủi nào!
]

#story-box(
  title: "Pierre de Fermat & Bản Thảo Giấu Kín Về Hình Học Giải Tích",
  author: "Pierre de Fermat (Pháp, 1607 – 1665) — Nhà Toán Học Nghiệp Dư Vĩ Đại Nhất",
)[
  Ít người biết rằng, một thẩm phán tòa án thành phố Toulouse tên là *Pierre de Fermat* đã độc lập phát minh ra Hình học giải tích thậm chí trước cả khi Descartes xuất bản cuốn sách của mình vào năm 1637!
  
  Trong một bản thảo viết tay năm 1636 mang tên *“Ad Locos Planos et Solidos Isagoge”* (Nhập môn về quỹ tích phẳng và khối), Fermat đã tuyên bố nguyên lý nền tảng:
  *“Bất cứ khi nào hai đại lượng chưa biết xuất hiện trong một phương trình cuối cùng, ta có một quỹ tích, và đầu mút của một trong các đại lượng ấy sẽ vạch ra một đường thẳng hoặc một đường cong!”*
  
  Fermat đã phân loại toàn bộ các phương trình bậc nhất là đường thẳng, và các phương trình bậc hai là đường tròn, elip, parabol hoặc hypebol. Nhưng vì tính cách kỳ dị, chỉ thích nghiên cứu toán học cho riêng mình như một thú vui tao nhã và không thèm xuất bản lấy danh tiếng, Fermat đã để vinh quang thuộc về Descartes. Lịch sử khoa học công bằng luôn vinh danh cả hai thiên tài người Pháp như những người đồng khai sinh ra kỷ nguyên số hóa hình học của nhân loại!
]

#hook-box(title: "Làm sao thuyền trưởng gọi cứu nạn giữa đại dương đêm mịt mù?")[
  Thầy bước vào lớp, tắt đèn phòng học chỉ để lại một ngọn đèn le lói:
  
  *“Các em hãy tưởng tượng mình là một thuyền trưởng trên một chiếc tàu chở hàng bị hỏng động cơ giữa Thái Bình Dương lúc 2 giờ sáng. Sóng to gió lớn, mây đen che kín các chòm sao, xung quanh chỉ là một màu đen thăm thẳm của đại dương. Các em cầm bộ đàm phát tín hiệu SOS về đất liền cứu nạn.*
  
  *Nếu không có Hệ tọa độ Descartes, các em sẽ nói gì với đội cứu hộ? Chẳng lẽ nói: ‘Chúng tôi đang ở gần một đàn cá heo, phía sau có một con sóng lớn’? Không một ai có thể tìm thấy các em giữa hàng triệu cây số vuông mặt nước!*
  
  *Nhờ có René Descartes, người thuyền trưởng chỉ cần đọc 6 chữ số ngắn gọn: Kinh độ $105 degree 45' 12''$ Đông, Vĩ độ $10 degree 02' 30''$ Bắc! Tọa độ đó là duy nhất và vĩnh cửu trên bề mặt hành tinh! Trực thăng cứu hộ lập tức bay thẳng đến đúng vị trí để vớt con tàu trong đêm tối!*
  
  *Tọa độ chính là địa chỉ căn cước công dân của từng điểm trong vũ trụ bao la!”*
]

#tech-box(title: "Độ phân giải màn hình 4K iPhone & Bản đồ trò chơi điện tử 2D/3D")[
  - *Lưới điểm ảnh Pixel trên màn hình điện thoại*: Chiếc màn hình Super Retina XDR của iPhone 16 có độ phân giải $2796 times 1290$ pixels. Bản chất của nó chính là một hệ trục tọa độ $O x y$ gồm hơn $3,6$ triệu ô vuông nhỏ xíu. Khi các em chạm ngón tay vào màn hình để nhấn nút "Thích" trên TikTok, cảm ứng điện dung gửi tọa độ $(x; y)$ của ngón tay về chip vi xử lý để thực thi hành động tương ứng.
  - *Lập trình đồ họa Game Engine (Unity, Godot)*: Mọi nhân vật, chướng ngại vật hay viên đạn trong game 2D đều là những thực thể mang thuộc tính tọa độ `Transform.position = Vector2(x, y)`. Khi nhân vật di chuyển, GPU thực hiện phép cộng tọa độ vectơ: $vec(r)' = vec(r) + vec(v) times Delta t$ liên tục 60 lần mỗi giây!
]

---

== BÀI 20: PHƯƠNG TRÌNH ĐƯỜNG THẲNG — VŨ KHÍ RASTER HÓA TRONG CHIP GPU

Đường thẳng không còn là một khái niệm trừu tượng vô tận, mà được tóm gọn vào một phương trình bậc nhất hai ẩn tao nhã:
- Phương trình tổng quát: $Delta: a x + b y + c = 0$ ($a^2 + b^2 > 0$), với vectơ pháp tuyến $vec(n) = (a; b)$.
- Phương trình tham số: $cases(x = x_0 + u_1 t, y = y_0 + u_2 t)$, với vectơ chỉ phương $vec(u) = (u_1; u_2)$ và thời gian $t in RR$.

#deep-dive-box(title: "Thuật Toán Vẽ Đường Thẳng Bresenham 1962 Trong Chip Đồ Họa GPU")[
  Năm 1962 tại phòng thí nghiệm của tập đoàn IBM, kỹ sư *Jack Elton Bresenham* đã giải quyết một bài toán hóc búa: Làm sao vẽ một đoạn thẳng nối hai điểm $(x_0, y_0)$ và $(x_1, y_1)$ trên màn hình máy tính chỉ gồm các pixel số nguyên rời rạc?
  
  Phương trình đường thẳng thực tế $y = m x + b$ chứa hệ số góc thực $m = (Delta y) / (Delta x)$. Nếu mỗi pixel máy tính đều phải làm phép nhân số thực dấu phẩy động rồi làm tròn, các máy tính thời đó sẽ bị tê liệt vì quá chậm!
  
  Bresenham đã sáng chế ra một thuật toán thiên tài: Sử dụng phương trình tổng quát $F(x, y) = 2 Delta y dot x - 2 Delta x dot y + C = 0$.
  - Tại mỗi bước nhảy từ pixel $x$ sang $x+1$, thuật toán chỉ cần kiểm tra *dấu của một biến số nguyên quyết định (Decision Variable $D$)*.
  - Nếu $D < 0$: Chọn pixel ngang $(x+1, y)$ và cập nhật $D = D + 2 Delta y$.
  - Nếu $D >= 0$: Chọn pixel chéo $(x+1, y+1)$ và cập nhật $D = D + 2(Delta y - Delta x)$.
  
  *Toàn bộ thuật toán không hề dùng một phép chia hay phép nhân số thực nào, chỉ dùng cộng và trừ số nguyên siêu tốc!* Thuật toán Bresenham chạy trong mọi chip GPU, từ trò chơi huyền thoại DOOM 1993 đến card đồ họa NVIDIA RTX 4090 xử lý hàng tỷ tia sáng thời gian thực ngày nay!
]

---

== BÀI 21: PHƯƠNG TRÌNH ĐƯỜNG TRÒN — BẢO VỆ BIÊN GIỚI & CẠM BẪY PHƯƠNG TRÌNH

Đường tròn tâm $I(a; b)$ bán kính $R$ có phương trình chính tắc:
$ (x - a)^2 + (y - b)^2 = R^2 $
Khai triển ra ta được phương trình tổng quát:
$ x^2 + y^2 - 2a x - 2b y + c = 0 $

#misconception-box(
  title: "Cạm bẫy Điều kiện Phương trình Đường tròn Tổng quát",
  misconception: "Cứ thấy phương trình dạng x^2 + y^2 - 2a x - 2b y + c = 0 là khẳng định ngay đó là phương trình của một đường tròn!",
  correction: "Phương trình trên CHỈ LÀ ĐƯỜNG TRÒN khi và chỉ khi: a^2 + b^2 - c > 0! Bán kính khi đó là R = sqrt(a^2 + b^2 - c). Nếu biểu thức <= 0, phương trình chỉ là một điểm duy nhất hoặc không có điểm thực nào!"
)[
  *Ví dụ:* Phương trình $x^2 + y^2 - 2x - 4y + 5 = 0$ có $a = 1, b = 2, c = 5$.
  Ta có $a^2 + b^2 - c = 1^2 + 2^2 - 5 = 0$.
  Phương trình tương đương $(x - 1)^2 + (y - 2)^2 = 0$, nó chỉ là MỘT ĐIỂM DUY NHẤT $(1; 2)$, hoàn toàn không phải là đường tròn!
]

#story-box(
  title: "Định Lý Apollonius & Vùng Phủ Sóng Radar Của Hai Hàng Không Mẫu Hạm",
  author: "Apollonius xứ Perga (Hy Lạp cổ đại, khoảng 262 – 190 TCN)",
)[
  Nhà toán học Apollonius đã khám phá ra một định lý hình học tuyệt mỹ: *Tập hợp tất cả các điểm $M$ trong mặt phẳng có tỉ số khoảng cách đến hai điểm cố định $A$ và $B$ bằng một hằng số $k > 0$ ($k != 1$):*
  $ (M A) / (M B) = k $
  *luôn luôn là MỘT ĐƯỜNG TRÒN (gọi là Đường tròn Apollonius)!*
  
  Trong tác chiến hải quân hiện đại, hai tàu khu trục $A$ và $B$ được trang bị radar cảnh giới có công suất phát sóng khác nhau theo tỉ lệ $k = 2$. Ranh giới nơi tín hiệu phát hiện máy bay tàng hình của hai tàu có cường độ bằng nhau chính là một Đường tròn Apollonius bao bọc lấy con tàu có công suất yếu hơn! Đại số giải tích lớp 10 cho phép xác định tâm và bán kính vùng an toàn này chỉ trong vài dòng biến đổi tọa độ!
]

---

== BÀI 22 & 23: BA ĐƯỜNG CONIC — KỲ QUAN HÌNH HỌC VĨ ĐẠI CỦA VŨ TRỤ

Ba đường Conic gồm *Elip (Ellipse)*, *Parabol (Parabola)* và *Hypebol (Hyperbola)* là các giao tuyến tuyệt mỹ khi dùng một mặt phẳng cắt qua một chiếc nón đôi (Double Cone). Không chỉ là hình học thuần túy, chúng là *ngôn ngữ quỹ đạo mà vạn vật trong vũ trụ tuân theo!*

#story-box(
  title: "Phòng Thì Thầm Tại Nhà Thờ Thánh Paul & Máy Tán Sỏi Thận Không Cần Mổ",
  author: "Kiến trúc sư Sir Christopher Wren & Các Bác Sĩ Munich 1980",
)[
  Dưới mái vòm khổng lồ hình elip của Nhà thờ Thánh Paul ở London, có một kỳ quan âm thanh mang tên *“Phòng thì thầm” (Whispering Gallery)*: Một người đứng sát tường tại một tiêu điểm $F_1$ nói thì thầm rất khẽ, nhưng một người bạn đứng cách xa tới hơn 40 mét tại tiêu điểm $F_2$ lại nghe rõ từng tiếng như đang nói vào tai, trong khi những người đứng ở giữa phòng không hề nghe thấy gì!
  
  Bí mật nằm ở tính chất quang học tiêu điểm của Elip: *Mọi sóng âm phát ra từ tiêu điểm $F_1$, sau khi phản xạ qua thành cong elip, đều đồng loạt đổi hướng hội tụ chính xác vào tiêu điểm $F_2$!*
  
  Tính chất này đã được các bác sĩ ứng dụng để sáng chế ra *Máy tán sỏi ngoài cơ thể (ESWL)*: Bồn elip đặt máy phát sóng chấn động tại tiêu điểm $F_1$, định vị viên sỏi thận nằm trùng tiêu điểm $F_2$. Sóng âm đi qua da êm ái nhưng khi hội tụ tại $F_2$ năng lượng bùng nổ làm vỡ vụn sỏi thận thành cát mịn mà không cần phẫu thuật rạch dao!
]

#story-box(
  title: "Hệ Thống Dẫn Đường LORAN-C: Định Vị Tàu Biển Bằng Đường Hypebol",
  author: "Hải quân Hoa Kỳ — Thế chiến II & Chiến tranh Lạnh",
)[
  Trước khi có vệ tinh GPS, làm sao các tàu chiến và tàu ngầm có thể định vị chính xác vị trí của mình giữa Đại Tây Dương mù sương bão tố?
  
  Các kỹ sư đã thiết lập hệ thống dẫn đường vô tuyến *LORAN-C (Long Range Navigation)*:
  Hai trạm phát sóng vô tuyến $F_1$ và $F_2$ trên bờ biển phát ra các xung vô tuyến đồng bộ với vận tốc ánh sáng $c$.
  Máy thu trên tàu biển đo *Độ chênh lệch thời gian nhận tín hiệu ($Delta t$)* từ hai trạm.
  Vì quãng đường bằng vận tốc nhân thời gian, nên hiệu khoảng cách từ tàu $M$ đến hai trạm là một hằng số cố định:
  $ |M F_1 - M F_2| = c times Delta t = 2a = "hằng số"! $
  
  Theo đúng định nghĩa hình học lớp 10: *Tập hợp các điểm có hiệu khoảng cách đến hai tiêu điểm là hằng số chính là MỘT ĐƯỜNG HYPEBOL!*
  
  Con tàu biết chắc chắn mình đang nằm trên một nhánh của đường Hypebol ấy. Bằng cách bắt thêm tín hiệu từ một cặp trạm thứ ba ($F_2, F_3$), máy tính trên tàu vẽ ra đường Hypebol thứ hai. Giao điểm của hai đường Hypebol cho ra tọa độ chính xác của con tàu trong đêm đen!
]

#dialogue-box(title: "Đối thoại Socrates: Cách Vẽ Đường Elip Bằng Hai Chiếc Đinh Và Sợi Dây")[
  *Socrates:* Này bạn trẻ, làm thế nào để vẽ một đường tròn hoàn hảo trên mặt đất?
  
  *Học trò:* Thưa thầy, cắm một chiếc cọc cố định làm tâm, buộc sợi dây có độ dài $R$ vào cọc rồi cầm cành cây căng dây quay tròn một vòng!
  
  *Socrates:* Tuyệt vời! Khoảng cách từ mọi điểm đến chiếc cọc luôn bằng $R$. Bây giờ, nếu ta cắm HAI CHIẾC CỌC ở hai vị trí khác nhau $F_1$ và $F_2$, lấy một sợi dây có độ dài $2a$ lớn hơn khoảng cách giữa hai cọc, buộc hai đầu dây vào hai cọc rồi dùng chiếc que căng sợi dây vẽ một đường cong khép kín. Đường cong đó là gì?
  
  *Học trò:* Đó là ĐƯỜNG ELIP!
  
  *Socrates:* Tại sao ngươi chắc chắn đó là Elip?
  
  *Học trò:* Dạ, vì chiều dài sợi dây là không đổi! Dù chiếc que di chuyển tới bất kỳ điểm $M$ nào, tổng chiều dài hai đoạn dây nối từ $M$ tới hai cọc luôn bằng độ dài sợi dây:
  $ M F_1 + M F_2 = 2a! $
  
  *Socrates:* Đúng thế! Đó chính là định nghĩa thuần túy nguyên bản của Elip! Đường tròn chỉ là trường hợp đặc biệt của Elip khi hai chiếc cọc chập lại làm một! Ngươi thấy chưa, vũ trụ chuyển động từ sự hoàn hảo đơn giản của đường tròn sang vẻ đẹp bao la, sâu lắng của đường elip!
]

#deep-dive-box(title: "Tâm Sai e: Chiếc Núm Vặn Biến Đổi Toàn Bộ Vũ Trụ Conic")[
  Cho một tiêu điểm $F$ và một đường chuẩn $Delta$. Tập hợp các điểm $M$ thỏa mãn:
  $ (M F) / (d(M, Delta)) = e quad ("Tâm sai") $
  - Khi $e = 0$: Đường tròn khép kín hoàn hảo.
  - Khi $0 < e < 1$: Quỹ đạo khép kín hình *Elip* (quỹ đạo các hành tinh quanh Mặt Trời — Định luật Kepler I).
  - Khi $e = 1$: Ranh giới mong manh hình *Parabol* (vật thể vừa đủ vận tốc vũ trụ cấp hai để thoát khỏi lực hút trọng trường).
  - Khi $e > 1$: Quỹ đạo mở hình *Hypebol* (thiên thể Oumuamua bay từ ngoài thiên hà lướt qua Hệ Mặt Trời một lần rồi bay đi vĩnh viễn không bao giờ trở lại).
]

#inquiry-box(title: "Nhiệm vụ Python: Thuật toán Định vị 3 Trạm Phát Sóng BTS")[
  ```python
  import numpy as np

  # Tọa độ 3 trạm BTS và khoảng cách đo được đến điện thoại (km):
  p1, r1 = np.array([0.0, 0.0]), 5.0
  p2, r2 = np.array([4.0, 0.0]), 3.0
  p3, r3 = np.array([2.0, 4.0]), 3.0

  # Tuyến tính hóa hệ 3 phương trình đường tròn:
  # Trừ phương trình (1) cho (2) và (3) để khử số hạng bậc hai x^2 + y^2:
  A = np.array([
      2 * (p2 - p1),
      2 * (p3 - p1)
  ])
  b = np.array([
      r1**2 - r2**2 - np.dot(p1, p1) + np.dot(p2, p2),
      r1**2 - r3**2 - np.dot(p1, p1) + np.dot(p3, p3)
  ])

  phone_pos = np.linalg.solve(A, b)
  print(f"Tọa độ người bị nạn cần cứu hộ: x = {phone_pos[0]:.3f} km, y = {phone_pos[1]:.3f} km")
  ```
]

#pagebreak()
'''
