# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG III: THƯỚC ĐO TẦM VÓC VŨ TRỤ — HỆ THỨC LƯỢNG TRONG TAM GIÁC

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 5, Bài 6, Bài 7 SGK Toán 10 cùng Chuyên đề Trắc địa Al-Biruni, Góc sút Regiomontanus & Hệ thống Sonar Tàu ngầm (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 5: GIÁ TRỊ LƯỢNG GIÁC TỪ $0 degree$ ĐẾN $180 degree$ — BỨC PHÁ KHỎI TAM GIÁC VUÔNG

Ở lớp 9, học sinh chỉ biết đến lượng giác thông qua tam giác vuông: *“Sin đi học, Cos không hư, Tan đoàn kết, Cot kết đoàn”*. Định nghĩa đó tuy trực quan nhưng lại giam cầm tư duy của học sinh trong một chiếc hộp chật hẹp: góc lượng giác không bao giờ được chạm tới $90 degree$, và góc tù (lớn hơn $90 degree$) dường như không hề có giá trị lượng giác!

Bài học đầu tiên của Chương III đã làm nên một cuộc giải phóng tư duy ngoạn mục: *đưa góc lượng giác lên Nửa đường tròn đơn vị.* Bằng cách gắn góc với tọa độ điểm $M(x_0; y_0)$ trên hệ trục $O x y$, $sin alpha$ trở thành tung độ, $cos alpha$ trở thành hoành độ. Lần đầu tiên, học sinh chứng kiến điều kỳ diệu: khi góc vượt qua $90 degree$ sang góc tù, hoành độ đổi dấu sang âm ($cos alpha < 0$), nhưng tung độ vẫn kiêu hãnh giữ dấu dương ($sin alpha > 0$). Lượng giác đã thoát khỏi hình học tĩnh để bước vào đại số giải tích động!

#story-box(
  title: "Nguồn gốc bi hài của từ 'Sinus' & Cuộc hành trình 2.000 năm của Lượng giác",
  author: "Aryabhata (Ấn Độ, 476 – 550) & Robert of Chester (châu Âu, 1145)",
)[
  Từ "Sin" mà hàng triệu học sinh trên thế giới viết vào vở mỗi ngày thực chất là kết quả của một... *vụ dịch sai hài hước bậc nhất trong lịch sử khoa học!*
  
  Vào thế kỷ V, nhà thiên văn học vĩ đại người Ấn Độ *Aryabhata* cần một công cụ để tính toán quỹ đạo các vì sao. Ông vẽ một nửa dây cung trong vòng tròn và gọi nó bằng tiếng Phạn là *“Ardha-jya”* (nửa dây cung), sau rút gọn thành *“Jya”*.
  
  Đến thế kỷ VIII, nền văn minh Hồi giáo bước vào Thời kỳ Hoàng kim. Các học giả Ả Rập tại Baghdad dịch tác phẩm của Aryabhata sang tiếng Ả Rập. Vì tiếng Ả Rập không có nguyên âm nên từ *Jya* được phiên âm thành *J-Y-B*. Nhưng trong tiếng Ả Rập, từ *Jayb* lại có nghĩa là "vạt áo", "nếp gấp ngực" hoặc "vịnh biển"!
  
  Bốn trăm năm sau, vào năm 1145, học giả người Anh *Robert of Chester* ngồi dịch các tài liệu Ả Rập sang tiếng Latin tại Tây Ban Nha. Khi gặp chữ *Jayb*, ông không hề biết nguồn gốc thiên văn của nó từ Ấn Độ, mà đinh ninh đó là nghĩa "nếp gấp ngực/vịnh biển", nên đã dịch thẳng sang từ tiếng Latin là *“Sinus”* (có nghĩa là vạt áo, nếp gấp, ngực hay hõm vịnh)! Từ đó, từ viết tắt *sin* ra đời và lan tỏa khắp toàn cầu.
  
  Đằng sau một từ viết tắt ba chữ cái nhỏ bé là một cuộc tiếp sức văn hóa vĩ đại trải dài qua 3 nền văn minh: từ bờ sông Hằng của Ấn Độ, qua sa mạc Ả Rập huyền bí, đến các đại học cổ kính thời Trung Cổ ở châu Âu!
]

#hook-box(title: "Nửa vòng tròn thần bí & Bí mật góc tù")[
  Thầy bước vào lớp, vẽ một nửa đường tròn đơn vị bán kính $R = 1$ lên bảng:
  
  *“Hồi lớp 9, các em học sin và cos bằng tỉ số giữa các cạnh tam giác vuông. Cạnh thì không bao giờ âm, nên sin và cos luôn dương. Nhưng hôm nay, thầy nói với các em: Cosin của một góc có thể mang dấu ÂM! Tại sao $cos 120 degree = - 1/2$? Chẳng lẽ có một tam giác với độ dài cạnh mang giá trị âm?”*
  
  Thầy chỉ tay lên trục hoành $O x$:
  
  *“Không! Điểm $M$ trên nửa đường tròn đang khiêu vũ. Khi góc quay từ $0 degree$ đến $90 degree$, chiếc bóng của nó trên sàn nhà (trục hoành) nằm ở phần dương. Nhưng khi góc nghiêng quá $90 degree$ bước sang góc tù, chiếc bóng của nó đổ sang phần âm của trục tọa độ! Âm hay dương không phải là kích thước của cạnh, mà là HƯỚNG VÀ VỊ TRÍ của tâm hồn điểm chuyển động trong không gian!”*
]

#tech-box(title: "Xoay nhân vật 3D trong Game Liên Minh Huyền Thoại & Phim Pixar")[
  - *Ma trận xoay 2D/3D (Rotation Matrix)*: Khi các em chơi game nhập vai, nhân vật cầm kiếm xoay một góc $theta$ quanh trục. Làm sao GPU tính toán được tọa độ mới của thanh kiếm? Card đồ họa máy tính sử dụng trực tiếp công thức lượng giác trên đường tròn đơn vị:
    $ mat(x'; y') = mat(cos theta, -sin theta; sin theta, cos theta) mat(x; y) $
    Hàng triệu phép tính sin và cos được GPU xử lý trong mỗi phần nghìn giây để hiển thị từng cử động mượt mà của nhân vật trên màn hình 144Hz!
]

---

== BÀI 6: ĐỊNH LÍ CÔSIN VÀ ĐỊNH LÍ SIN — PHÁ BỎ XIỀNG XÍCH PYTHAGORAS

Định lý Pythagoras $a^2 + b^2 = c^2$ là biểu tượng vĩ đại của hình học cổ đại, nhưng nó mang một nhược điểm chí mạng: *chỉ đúng khi góc kẹp giữa đúng bằng $90 degree$!* Nếu góc ấy bị bẻ cong thành góc nhọn hay mở rộng thành góc tù, mối quan hệ giữa ba cạnh sẽ biến thiên như thế nào?

*Định lí Côsin* $a^2 = b^2 + c^2 - 2 b c cos A$ chính là câu trả lời toàn mỹ của nhân loại! Khi góc $A = 90 degree$, $cos 90 degree = 0$, số hạng thứ ba biến mất và công thức thu gọn tuyệt đẹp về Pythagoras. Định lý Côsin không phủ định Pythagoras, mà ôm trọn Pythagoras vào lòng như một trường hợp riêng đặc biệt!

#story-box(
  title: "Al-Biruni 1023: Đứng Trên Đỉnh Núi Đo Bán Kính Trái Đất Bằng Định Lý Sin",
  author: "Abu Rayhan Al-Biruni (Ba Tư, 973 – 1048)",
)[
  Hơn 1.000 năm trước, tại pháo đài Nandana (thuộc Pakistan ngày nay), nhà bác học Hồi giáo vĩ đại *Al-Biruni* đã thực hiện một kỳ tích đo đạc mà không một nhà khoa học phương Tây nào thời đó dám nghĩ tới: *Đo chính xác bán kính Trái Đất mà không cần phải đi bộ vòng quanh thế giới!*
  
  Phương pháp của Eratosthenes trước đó cần đo khoảng cách giữa hai thành phố cách nhau 800 km trên mặt đất — một việc vô cùng gian nan và dễ sai số do địa hình đồi núi. Al-Biruni đã nghĩ ra giải pháp lượng giác thanh nhã hơn ngàn lần:
  1. Ông trèo lên một ngọn núi cao có đỉnh nhìn ra một bình nguyên phẳng lì trải dài tới tận đường chân trời.
  2. Bằng phương pháp tam giác đạc, ông đo độ cao chính xác của ngọn núi là $h$.
  3. Từ đỉnh núi, ông dùng thước đo góc thiên văn (Astrolabe) đo góc nghiêng trầm $theta$ giữa đường ngắm nằm ngang và tia ngắm chạm vào đường chân trời xa xôi nơi mặt đất cong xuống.
  
  Tia ngắm từ đỉnh núi tiếp xúc với mặt cầu Trái Đất, tạo thành một *tam giác vuông khổng lồ* có cạnh góc vuông là tia ngắm, cạnh huyền là $R + h$, và cạnh góc vuông còn lại là bán kính Trái Đất $R$!
  Theo định nghĩa lượng giác:
  $ cos theta = R / (R + h) arrow R = (h cos theta) / (1 - cos theta) $
  
  Tại Nandana, với ngọn núi cao $h = 652,05$ mét và góc trầm $theta = 34'$, Al-Biruni tính ra bán kính Trái Đất là:
  $ R approx 6.335,72 "km"! $
  
  Con số của Al-Biruni chỉ sai lệch vỏn vẹn *0,9%* so với số liệu đo đạc bằng vệ tinh hiện đại của NASA ngày nay ($6.371 "km"$)! Bằng một công thức lượng giác lớp 10, một con người đứng trên đỉnh núi đã ôm trọn cả tinh cầu vào trong lòng bàn tay!
]

#story-box(
  title: "Regiomontanus 1471 & Bài toán Góc sút Bóng đá Tối ưu",
  author: "Regiomontanus (Johannes Müller von Königsberg, Đức, 1436 – 1476)",
)[
  Năm 1471, trong một bức thư gửi cho học trò, nhà toán học Regiomontanus đã đặt ra bài toán cực trị hình học đầu tiên trong lịch sử mang tên *“Bài toán tượng đài Regiomontanus”*:
  
  *“Một bức tượng cao dựng đứng trên một bệ tượng cách mặt đất một khoảng. Một người đứng ngắm tượng từ xa: Khi đứng quá gần, bức tượng bị nhìn xiên xẹo từ dưới lên; khi đứng quá xa, bức tượng thu nhỏ lại như một chấm tí hon. Hỏi: Người đó phải đứng ở cự ly nào trên mặt đất để góc nhìn ngắm bức tượng là LỚN NHẤT?”*
  
  Trong bóng đá hiện đại, đây chính là *Bài toán Góc sút của Tiền đạo chạy cánh*:
  - Một cầu thủ tiền đạo dẫn bóng dọc theo đường biên dọc (cách cột cọc gần $A$ một đoạn $d_1$, cột cọc xa $B$ một đoạn $d_2$).
  - Cầu thủ nên sút bóng ở vị trí $M$ nào trên đường biên để góc sút mở rộng $hat(A M B)$ hướng vào khung thành là cực đại?
  
  Áp dụng Định lý Côsin trong tam giác $M A B$:
  $ cos hat(A M B) = (M A^2 + M B^2 - A B^2) / (2 M A times M B) $
  Regiomontanus chỉ ra rằng: Góc nhìn cực đại đạt được khi và chỉ khi đường tròn đi qua ba điểm $A, B, M$ *TIẾP XÚC VỚI ĐƯỜNG DI CHUYỂN CỦA CẦU THỦ*!
  Khoảng cách tối ưu chính là trung bình nhân khoảng cách tới hai cột gôn:
  $ x_("opt") = sqrt(d_1 times d_2) $
  Một bài toán lượng giác lớp 10 từ thế kỷ XV đã trở thành cẩm nang chiến thuật cho các danh thủ bóng đá hàng đầu thế giới!
]

#hook-box(title: "Sonar Tàu Ngầm & Tên lửa Phòng không Iron Dome")[
  Thầy chiếu video một chiếc tàu ngầm hạt nhân lặn sâu dưới đáy biển tối đen như mực:
  
  *“Ở độ sâu 300 mét dưới đáy đại dương, ánh sáng mặt trời không thể xuyên tới, radar sóng điện từ bị nước biển nuốt chửng hoàn toàn. Làm sao một chiếc tàu ngầm biết được một tàu chiến đối phương đang áp sát cách mình 15 km?*
  
  *Họ sử dụng HỆ THỐNG SONAR THỤ ĐỘNG!*
  - Thân tàu ngầm được gắn hai micro thủy âm cực nhạy tại mũi tàu ($A$) và đuôi tàu ($B$).
  - Khoảng cách $A B = c$ được kỹ sư đo chuẩn xác từng milimet.
  - Khi chân vịt tàu đối phương quay phát ra tiếng động, micro $A$ nhận sóng ở góc $alpha$, micro $B$ nhận sóng ở góc $beta$.
  - Hai góc $alpha, beta$ và một cạnh $c$ lập tức tạo thành một bài toán GIẢI TAM GIÁC bằng Định lý Sin:
    $ a / (sin alpha) = b / (sin beta) = c / (sin(180 degree - alpha - beta)) $
  
  *Máy tính nhúng trên tàu chỉ mất 0,001 giây để giải Định lý Sin lớp 10, hiển thị ngay vị trí, hướng di chuyển và cự ly của mục tiêu lên màn hình hoa tiêu! Đó chính là vũ khí vô hình bảo vệ hòa bình của các siêu cường quốc!”*
]

#misconception-box(
  title: "Cạm bẫy 'Trường hợp Mơ hồ SSA' trong Định lý Sin",
  misconception: "Khi biết hai cạnh và một góc không xen giữa (ví dụ $a, b, hat(A)$), ta chỉ việc dùng định lý Sin là luôn tìm ra duy nhất một tam giác!",
  correction: "Trường hợp SSA (Cạnh - Cạnh - Góc không kề) là trường hợp cực kỳ nguy hiểm có thể cho ra HAI TAM GIÁC KHÁC NHAU (một tam giác nhọn và một tam giác tù) vì phương trình $sin B = k$ luôn có hai nghiệm bù nhau: $B$ và $180 degree - B$!"
)[
  *Ví dụ:* Cho tam giác $A B C$ có $a = 6$, $b = 8$, và $hat(A) = 30 degree$.
  Theo định lý Sin:
  $ (sin B) / b = (sin A) / a arrow sin B = (8 times sin 30 degree) / 6 = (8 times 0,5) / 6 = 4/6 = 2/3 $
  Bấm máy tính ta được góc nhọn: $B_1 approx 41,8 degree$.
  Nhưng trên nửa đường tròn đơn vị, góc tù $B_2 = 180 degree - 41,8 degree = 138,2 degree$ CŨNG CÓ $sin B_2 = 2/3$!
  Vì $hat(A) + B_2 = 30 degree + 138,2 degree = 168,2 degree < 180 degree$, nên góc tù $B_2$ HOÀN TOÀN HỢP LỆ!
  
  *Hậu quả:* Bài toán có HAI TAM GIÁC HOÀN TOÀN KHÁC NHAU thỏa mãn đề bài! Nếu kỹ sư trắc địa chỉ lấy nghiệm góc nhọn máy tính trả về, chiếc mố cầu sẽ bị xây lệch vị trí hàng chục mét và đổ sập!
]

---

== BÀI 7: CÁC CÔNG THỨC DIỆN TÍCH TAM GIÁC & CÔNG THỨC HERON

Tam giác là đa giác đơn giản nhất của hình học phẳng nhưng lại sở hữu tới 5 công thức tính diện tích độc lập phản ánh 5 góc nhìn toán học sâu sắc:
$ S = 1/2 a h_a = 1/2 a b sin C = (a b c) / (4 R) = p r = sqrt(p(p-a)(p-b)(p-c)) $

#story-box(
  title: "Heron xứ Alexandria & Bức thư tình tuyệt mỹ giữa Ba Cạnh và Diện Tích",
  author: "Heron xứ Alexandria (Ai Cập - Hy Lạp, khoảng 10 – 70 SCN)",
)[
  Heron xứ Alexandria là nhà phát minh thiên tài được mệnh danh là "Thomas Edison của thời cổ đại". Ông đã chế tạo ra chiếc máy bán nước thánh tự động đầu tiên bằng cách thả đồng xu vào khe, đền thờ có cửa tự động mở bằng áp suất hơi nước, và động cơ hơi nước quay tròn *Aeolipile* đi trước thời đại tận 1.700 năm.
  
  Trong cuốn sách *“Metrica”* (Đo lường), Heron đã giải quyết bài toán nhức nhối nhất của các quan lại trắc địa Ai Cập sau mỗi mùa lũ sông Nile: Các thửa ruộng hình tam giác bị bùn đất phủ lấp làm mất hết các cọc đo chiều cao. Làm sao tính diện tích mảnh đất khi chỉ có thể dùng dây đo được độ dài 3 cạnh $a, b, c$?
  
  Heron đã sáng tạo ra công thức mang tên ông:
  $ S = sqrt(p(p-a)(p-b)(p-c)) quad "với" quad p = (a + b + c) / 2 $
  
  Vẻ đẹp của công thức Heron nằm ở tính *đối xứng hoàn hảo*: không cần biết góc, không cần kẻ đường cao, chỉ cần 3 cạnh là diện tích hiển lộ. Nó giống như một bài thơ hình học thanh nhã nơi cả ba cạnh $a, b, c$ đều bình đẳng trước chân lý!
]

#dialogue-box(title: "Đối thoại Socrates: Tại sao Định lý Côsin lại chứa Định lý Pythagoras?")[
  *Socrates:* Này bạn trẻ, hãy nhìn vào công thức Định lý Côsin: $a^2 = b^2 + c^2 - 2 b c cos A$. Khi góc $A$ thu hẹp lại dần dần từ $90 degree$ về $0 degree$, cạnh $a$ sẽ dài ra hay ngắn lại?
  
  *Học trò:* Thưa thầy, hiển nhiên cạnh $a$ ngắn lại ạ!
  
  *Socrates:* Tại sao công thức lại thể hiện được điều đó?
  
  *Học trò:* Dạ, vì khi góc $A$ nhọn, $cos A > 0$, nên lượng trừ đi $- 2 b c cos A$ là một số dương bị trừ đi, làm cho $a^2 < b^2 + c^2$!
  
  *Socrates:* Đúng! Và khi góc $A$ mở rộng thành góc tù (lớn hơn $90 degree$), điều gì xảy ra?
  
  *Học trò:* Dạ, $cos A < 0$, phép trừ hai số âm trở thành phép CỘNG THÊM: $a^2 > b^2 + c^2$! Cạnh $a$ bị kéo dài ra vượt qua định lý Pythagoras!
  
  *Socrates:* Vậy định lý Pythagoras nằm ở đâu trong bức tranh vĩ đại đó?
  
  *Học trò:* Dạ, Pythagoras chính là Ranh Giới Cân Bằng hoàn hảo ở giữa: khi $A = 90 degree$, $cos 90 degree = 0$, phần bù trừ biến mất!
  
  *Socrates:* Ngươi đã thấy được sự tiếp nối của tư tưởng nhân loại rồi đó! Định lý Côsin không giết chết Pythagoras, mà mở rộng nó để ôm trọn mọi tam giác méo mó trong vũ trụ!
]

#deep-dive-box(title: "Từ Heron đến Brahmagupta: Vẻ Đẹp của Tứ giác Nội tiếp")[
  Vào thế kỷ VII, nhà toán học thiên tài Ấn Độ *Brahmagupta* đã nâng tầm công thức Heron lên cho một *Tứ giác nội tiếp đường tròn* có 4 cạnh $a, b, c, d$:
  $ S_("Brahmagupta") = sqrt((p-a)(p-b)(p-c)(p-d)) quad "với" quad p = (a+b+c+d)/2 $
  Nếu ta cho một cạnh $d$ co ngắn lại dần về $0$, tứ giác biến thành tam giác, số hạng $(p - d)$ biến thành $p$, và công thức Brahmagupta thu gọn chính xác về công thức Heron! Sự nhất quán kỳ vĩ này chứng minh rằng các định lý toán học không bao giờ đứng lẻ loi, mà luôn là các lát cắt của cùng một chân lý vũ trụ!
]

#inquiry-box(title: "Thực hành Python: Mô phỏng Góc sút Regiomontanus trên Sân Bóng")[
  ```python
  import numpy as np

  # Khung thành rộng 7.32m, cột gần cách biên 10m, cột xa cách biên 17.32m
  d1 = 10.0
  d2 = 17.32

  # Tìm vị trí sút x dọc đường biên từ 1m đến 30m
  x = np.linspace(1, 30, 300)
  angle_rad = np.arctan(d2 / x) - np.arctan(d1 / x)
  angle_deg = np.degrees(angle_rad)

  opt_idx = np.argmax(angle_deg)
  print(f"Vị trí sút tối ưu x: {x[opt_idx]:.2f} mét từ đường ngang khung thành")
  print(f"Góc sút cực đại:    {angle_deg[opt_idx]:.2f} độ")
  print(f"Kiểm tra lý thuyết sqrt(d1*d2): {np.sqrt(d1 * d2):.2f} mét")
  ```
]

#v(1em)

== CHUYÊN KHẢO MỞ RỘNG: ĐỊNH LÝ STEWART & BẢN GIAO HƯỞNG ĐỘ DÀI TRUNG TUYẾN, PHÂN GIÁC

#story-box(
  title: "Matthew Stewart 1746: Chiếc Cầu Nối Giữa Mọi Đoạn Thẳng Trong Tam Giác",
  author: "Matthew Stewart (Scotland, 1717 – 1785)",
)[
  Năm 1746, giáo sư toán học tại Đại học Edinburgh *Matthew Stewart* đã công bố một định lý hình học được coi là "viên ngọc quý" của lượng giác giải tích: Cho tam giác $A B C$, trên cạnh đáy $B C$ lấy một điểm $D$ bất kỳ, chia cạnh đáy thành hai đoạn $B D = m$ và $C D = n$ (với $m + n = a$). Độ dài đoạn thẳng $A D = d$ thỏa mãn hệ thức kinh điển:
  $ b^2 m + c^2 n = a (d^2 + m n) $
  
  *Câu thần chú ghi nhớ của các thế hệ học sinh Anh quốc:*
  *“A man and his dad put a bomb in the sink”* ($b m b + c n c = a d a + a m n$).
  
  *Sức mạnh thống nhất của Định lý Stewart:*
  1. Khi $D$ là *Trung điểm* của $B C$ ($m = n = a / 2$): Hệ thức Stewart lập tức suy ra công thức độ dài đường trung tuyến Apollonius:
     $ b^2 (a/2) + c^2 (a/2) = a (m_a^2 + a^2 / 4) arrow m_a^2 = (2 b^2 + 2 c^2 - a^2) / 4 $
  2. Khi $A D$ là *Đường phân giác trong* góc $A$: Theo tính chất đường phân giác, $m / n = c / b$. Thay vào hệ thức Stewart, ta suy ra công thức tính độ dài đường phân giác tuyệt đẹp:
     $ l_a^2 = b c (1 - a^2 / (b + c)^2) = (4 b c p (p - a)) / (b + c)^2 $
  
  Từ một định lý duy nhất được chứng minh bằng Định lý Côsin, toàn bộ các công thức tính trung tuyến, phân giác, đường cao đều được xâu chuỗi thành một khối chân lý thống nhất!
]

#deep-dive-box(title: "Từ Heron đến Bretschneider: Sự Tiến Hóa Của Công Thức Diện Tích Đa Giác")[
  Nhà toán học Đức *Carl Anton Bretschneider* (1842) đã hoàn tất bài toán tính diện tích tứ giác bất kỳ có 4 cạnh $a, b, c, d$ và hai góc đối diện $A, C$:
  $ S^2 = (p - a)(p - b)(p - c)(p - d) - a b c d cos^2((A + C) / 2) $
  với $p = (a + b + c + d) / 2$.
  
  *Chuỗi tiến hóa vĩ đại của tri thức:*
  - *Tứ giác bất kỳ (Bretschneider 1842):* Có số hạng hiệu chỉnh $- a b c d cos^2((A + C)/2)$.
  - *Tứ giác nội tiếp (Brahmagupta 628):* Tổng hai góc đối $A + C = 180 degree arrow (A + C)/2 = 90 degree arrow cos(90 degree) = 0$. Số hạng hiệu chỉnh biến mất, diện tích đạt cực đại!
  - *Tam giác (Heron thế kỷ I):* Cho cạnh $d arrow 0$, tứ giác suy biến thành tam giác, công thức trở về $S = sqrt(p(p-a)(p-b)(p-c))$!
  
  Học sinh lớp 10 khi nhìn thấy chuỗi liên kết này sẽ nhận ra: Toán học không phải là những mảnh ghép rời rạc để học vẹt, mà là một thực thể sống đang tiến hóa không ngừng!
]

#tech-box(title: "Nguyên Lý Tam Giác Đạc (Triangulation) Định Vị 24 Vệ Tinh GPS")[
  Làm sao chiếc điện thoại thông minh trong túi các em biết được các em đang đứng chính xác ở ngã tư phố nào với sai số dưới $3 "m"$?
  
  - Trên quỹ đạo Trái Đất ở độ cao $20.200 "km"$, mạng lưới gồm $24$ vệ tinh GPS quay quanh tinh cầu, mỗi vệ tinh liên tục phát tín hiệu mang thông tin thời gian từ đồng hồ nguyên tử.
  - Bộ thu GPS trong điện thoại ghi nhận thời gian nhận tín hiệu từ vệ tinh thứ nhất: Khoảng cách tới vệ tinh là $r_1 = c times Delta t_1$. Khi đó, điện thoại nằm trên một *Mặt cầu bán kính $r_1$* tâm là vệ tinh 1.
  - Vệ tinh thứ hai cho mặt cầu thứ hai: Giao của hai mặt cầu là một *Đường tròn*.
  - Vệ tinh thứ ba cho mặt cầu thứ ba: Cắt đường tròn tại đúng *Hai điểm duy nhất* trong không gian.
  - Vệ tinh thứ tư giải quyết sự sai lệch đồng hồ của điện thoại và loại bỏ một điểm nằm ngoài Trái Đất.
  
  Toàn bộ hệ thống giao thông thông minh, taxi công nghệ, máy bay không người lái (drone) giao hàng đều đang vận hành trên nền tảng của các hệ thức lượng và phép giải tam giác giải tích lớp 10!
]

#misconception-box(
  title: "Cạm Bẫy SSA (Cạnh - Cạnh - Góc Không Xen Giữa) & Ảo Tưởng Nghiệm Duy Nhất",
  misconception: "Nhiều học sinh tin rằng khi biết độ dài hai cạnh a, b và góc A, luôn luôn xác định được duy nhất một tam giác, tương tự như các trường hợp c-c-c hay c-g-c.",
  correction: "Trường hợp SSA (Cạnh - Cạnh - Góc) là trường hợp NHẬP NHẰNG (Ambiguous Case)! Nếu góc A nhọn và cạnh a nhỏ hơn cạnh b (a < b) nhưng lớn hơn chiều cao (a > b sin A), đường tròn tâm C bán kính a sẽ cắt cạnh đáy tại HAI ĐIỂM PHÂN BIỆT, sinh ra HAI TAM GIÁC HOÀN TOÀN KHÁC NHAU: một tam giác nhọn và một tam giác tù!",
  remedy: "Khi gặp bài toán giải tam giác với hai cạnh và một góc không xen giữa, luôn phải xét phương trình bậc hai theo cạnh thứ ba: c² - (2b cos A)c + (b² - a²) = 0. Nếu phương trình có hai nghiệm dương phân biệt, bài toán bắt buộc có HAI ĐÁP SỐ!"
)

#pagebreak()
'''
