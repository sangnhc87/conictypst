# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG I: BẢN GIAO HƯỞNG TUẦN HOÀN — HÀM SỐ & PHƯƠNG TRÌNH LƯỢNG GIÁC

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 1, Bài 2, Bài 3, Bài 4 SGK Toán 11 cùng Chuyên đề Phân tích Sóng Fourier trong Xử lý Tín hiệu Số (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 1: GÓC LƯỢNG GIÁC & ĐƯỜNG TRÒN LƯỢNG GIÁC — PHÁ VỠ GIỚI HẠN MỘT VÒNG QUAY

Ở lớp 10, góc lượng giác chỉ mới dừng lại ở nửa đường tròn từ $0 degree$ đến $180 degree$. Một góc không bao giờ được phép âm, và một góc không bao giờ vượt quá $360 degree$. Nhưng khi chiếc bánh xe ô tô lăn hàng nghìn vòng trên cao tốc, khi cánh quạt tuabin gió quay hàng triệu vòng trên đồi cát, hay khi Mặt Trăng quay quanh Trái Đất hàng thế kỷ, khái niệm góc "bị chặn dưới 360 độ" trở nên hoàn toàn bất lực!

Bài học đầu tiên của lớp 11 đã mở tung xiềng xích đó: *Góc lượng giác là một quá trình quay liên tục không có điểm dừng!*
- Quay theo chiều ngược kim đồng hồ là chiều dương ($+$).
- Quay theo chiều thuận kim đồng hồ là chiều âm ($-$).
- Một góc có thể là $720 degree$ (quay 2 vòng), $3.600 degree$ (quay 10 vòng), hoặc $-1.080 degree$ (lùi lại 3 vòng).

Đường tròn lượng giác với bán kính $R = 1$ trở thành một "chiếc đồng hồ thời gian vĩnh cửu", nơi mỗi điểm trên đường tròn lặp lại vị trí cũ sau mỗi chu kỳ $2 pi$ radian. Lượng giác chính thức trở thành ngôn ngữ toán học mô tả mọi hiện tượng tuần hoàn của vũ trụ!

#story-box(
  title: "Claudius Ptolemy & Kiệt tác Almagest đo lường chuyển động các vì sao",
  author: "Claudius Ptolemy (Alexandria, khoảng 100 – 170 SCN)",
)[
  Vào thế kỷ II SCN tại thành phố Alexandria bên bờ Địa Trung Hải, nhà thiên văn học vĩ đại *Claudius Ptolemy* đã hoàn thành bộ bách khoa toàn thư 13 tập mang tên *"Almagest"* (tiếng Ả Rập có nghĩa là *Kiệt tác Vĩ đại*).
  
  Ptolemy cần một công cụ toán học để mô tả chuyển động kỳ lạ của các hành tinh: Đôi khi chúng chuyển động tiến lên phía trước, nhưng bỗng nhiên lại đi chậm lại, đứng yên rồi đi giật lùi (hiện tượng chuyển động nghịch hành - Retrograde motion)! Để giải thích điều này, Ptolemy đã xây dựng một mô hình hình học phức tạp gồm các "Vòng tròn phụ" (Epicycle) quay tròn xung quanh các "Vòng tròn chính" (Deferent).
  
  Để tính toán vị trí của các vì sao trên bầu trời đêm, Ptolemy đã lập ra *Bảng dây cung (Table of Chords)* — tiền thân trực tiếp của bảng giá trị lượng giác sin và cos ngày nay — với độ chính xác đến từng phần sáu mươi (hệ đếm lục thập phân của người Babylon cổ đại). Cuốn sách Almagest của Ptolemy đã trở thành "kinh thánh khoa học" thống trị toàn bộ nền thiên văn học phương Tây và Hồi giáo suốt hơn 1.400 năm cho đến tận thời kỳ của Nicolaus Copernicus!
]

#hook-box(title: "Bánh xe lăn trên đường & Vết bùn bắn lên trời")[
  Thầy bước vào lớp, vẽ một bánh xe đạp có bán kính $R = 30$ cm đang lăn trên mặt đường:
  
  *“Một buổi sáng trời mưa lầy lội, một vết bùn màu đỏ dính vào mép ngoài của lốp xe đạp. Khi xe bắt đầu lăn bánh từ vạch xuất phát, vết bùn chuyển động quay tròn trong không gian.*
  *Thầy hỏi các em:*
  - Khi xe đạp đi được một góc quay $alpha = 90 degree$, độ cao của vết bùn cách mặt đất là bao nhiêu?
  - Khi xe quay được $alpha = 180 degree$?
  - Khi xe quay được $alpha = 720 degree$?
  - Và khi xe phanh lại lùi xe một góc $alpha = -90 degree$ thì vết bùn đang ở đâu?
  
  Nếu góc chỉ nằm từ 0 đến 180 độ như lớp 10, các em hoàn toàn không thể trả lời được câu hỏi này! Nhưng trên Đường tròn lượng giác lớp 11, độ cao của vết bùn theo góc quay $alpha$ được mô hình hóa chính xác bằng công thức:
  $ h(alpha) = R - R cos(alpha) = 30 - 30 cos(alpha) "(cm)" $
  
  *Đường tròn lượng giác không phải là một hình vẽ tĩnh, nó là cỗ máy ghi lại lịch sử quay của mọi bánh xe, mọi cánh quạt máy bay và mọi hành tinh trong vũ trụ!”*
]

#story-box(
  title: "Eratosthenes & Cây Gậy Đo Chu Vi Trái Đất Năm 240 TCN: Kỳ Tích Lượng Giác Cổ Đại",
  author: "Eratosthenes xứ Cyrene (276 – 194 TCN), Giám đốc Thư viện Alexandria",
)[
  Hơn 2.200 năm trước, khi phần lớn nhân loại vẫn còn nghĩ rằng Trái Đất là một chiếc đĩa phẳng dẹt, một học giả người Hy Lạp tên là *Eratosthenes* tại thành phố Alexandria đã làm được một điều không tưởng: *Đo chính xác chu vi của toàn bộ quả cầu Trái Đất chỉ bằng một chiếc cọc gỗ cắm trên mặt đất!*
  
  Eratosthenes đọc được một ghi chép thú vị: Vào đúng giữa trưa ngày Hạ chí (ngày 21 tháng 6), tại thành phố Syene (nay là Aswan, miền Nam Ai Cập), ánh nắng Mặt Trời chiếu thẳng đứng xuống đáy giếng sâu mà không để lại bất kỳ bóng râm nào. 
  
  Cùng thời điểm trưa ngày Hạ chí ấy tại Alexandria (cách Syene khoảng 800 km về phía Bắc), Eratosthenes cắm một chiếc cọc thẳng đứng và đo độ dài bóng râm của nó. Dùng hệ thức lượng giác góc nhọn cơ bản:
  $ tan theta = ("Độ dài bóng") / ("Chiều cao chiếc cọc") $
  ông tính ra góc lệch của tia sáng Mặt Trời là $theta approx 7.2^circle$!
  
  Vì $7.2^circle = 360^circle / 50$ (đúng bằng $1/50$ của một vòng tròn đầy đủ), Eratosthenes suy luận với tư duy hình học sắc bén: Khoảng cách giữa hai thành phố Alexandria và Syene bắt buộc phải bằng $1/50$ chu vi của toàn bộ Trái Đất!
  
  Ông thuê người bước đều đếm khoảng cách giữa hai thành phố là $5.000$ stadia (khoảng $800$ km). Nhân với 50, ông thu được chu vi Trái Đất là $40.000$ km! Con số này chỉ lệch chưa đầy $1.5\%$ so với phép đo hiện đại bằng vệ tinh không gian của NASA ($40.075$ km)!
  
  *Một bài học lịch sử bất hủ:* Không cần tàu vũ trụ, không cần vệ tinh đắt tiền, chỉ với một cây gậy cắm trên cát và một bộ óc tự học khao khát suy luận lượng giác, con người đã có thể ôm trọn cả hành tinh trong lòng bàn tay!
]

#tech-box(title: "Hệ thống Bơm nhiên liệu Động cơ Đốt trong & Cảm biến Trục khuỷu Ô tô")[
  - *Cảm biến vị trí trục khuỷu (Crankshaft Position Sensor)*: Trong động cơ xe hơi hiện đại, trục khuỷu quay với tốc độ từ $1.000$ đến $6.000$ vòng mỗi phút (RPM). Để bugi đánh lửa và kim phun xăng phun vào buồng đốt chính xác đến từng micro-giây, máy tính động cơ (ECU) sử dụng cảm biến từ trường đọc liên tục góc lượng giác $theta$ của trục khuỷu tính theo radian. Nếu góc lượng giác bị lệch chỉ $1 degree$, động cơ sẽ bị giật cục, hao xăng hoặc nổ vỡ pít-tông ngay lập tức!
]

---

== BÀI 2: CÁC CÔNG THỨC LƯỢNG GIÁC & BẢN GIAO HƯỞNG PYTHAGORAS

#story-box(
  title: "Pythagoras, Âm Nhạc & Bí Mật Cây Đàn Piano 12 Phím Của J.S. Bach",
  author: "Pythagoras xứ Samos (khoảng 570 – 495 TCN) & Johann Sebastian Bach (1685 – 1750)",
)[
  Một ngày nọ, nhà toán học cổ đại Pythagoras đi ngang qua một xưởng rèn. Ông nghe thấy tiếng búa đập đe phát ra những âm thanh lúc thì chát chúa khó chịu, lúc lại ngân nga hòa hợp êm tai như một giai điệu thần tiên!
  
  Tò mò, Pythagoras bước vào xưởng và cân trọng lượng của từng chiếc búa. Ông phát hiện ra một định luật chấn động: Những chiếc búa tạo ra âm thanh hòa âm tuyệt mỹ với nhau luôn có tỷ lệ trọng lượng là những phân số nguyên đơn giản: $2/1$ (quãng tám), $3/2$ (quãng năm), và $4/3$ (quãng tư)! 
  
  Pythagoras thốt lên: *“Vạn vật đều là những con số! Vũ trụ là một bản hòa âm lượng giác vĩ đại!”*.
  
  Tuy nhiên, khi nhân liên tiếp tỷ lệ quãng năm $(3/2)^12$ và so sánh với 7 lần quãng tám $2^7$, các nhà toán học phát hiện một sự lệch pha nhỏ xíu: $(3/2)^12 approx 129.746 != 2^7 = 128$! Khe hở sai số này được gọi là *Dấu phẩy Pythagoras (Pythagorean Comma)*. Suốt hơn 2.000 năm, các nhạc cụ cổ điển không thể chuyển giọng mượt mà vì sai số này!
  
  Mãi đến thế kỷ XVIII, nhà soạn nhạc thiên tài Johann Sebastian Bach đã ủng hộ một hệ thống toán học mới mang tên *Hệ thống Bình quân Luật (Equal Temperament)*: Chia một quãng tám thành đúng 12 nửa cung bằng nhau với công bội cấp số lượng giác:
  $ r = root(12, 2) approx 1.059463 $
  
  Để chứng minh vẻ đẹp tuyệt đỉnh của toán học giải phóng âm nhạc, Bach đã sáng tác kiệt tác bất hủ *"The Well-Tempered Clavier"* gồm 48 bản khúc dạo đầu và phú-gơ trên toàn bộ 24 giọng trưởng và thứ! Mỗi khi các em nhìn vào bàn phím đàn piano với 7 phím trắng và 5 phím đen, các em đang chiêm ngưỡng một công trình kiến trúc toán học lượng giác tinh xảo nhất của nhân loại!
]


Học sinh lớp 11 thường than thở: *"Tại sao lại có quá nhiều công thức lượng giác đến vậy? Công thức cộng, công thức nhân đôi, công thức hạ bậc, công thức biến đổi tích thành tổng, tổng thành tích... Làm sao nhớ hết được?"*.

Nếu học vẹt từng công thức như một kẻ nô lệ, lượng giác sẽ là một cơn ác mộng. Nhưng nếu hiểu được *nguồn gốc vật lý và sự giao thoa sóng*, học sinh sẽ nhận ra: *Các công thức lượng giác chính là bản hòa âm của tự nhiên!* Khi hai nốt nhạc vang lên cùng lúc, khi hai chùm sóng điện thoại giao thoa trong không gian, chúng không cộng đại số đơn giản, mà hòa quyện vào nhau thông qua các công thức lượng giác!

#story-box(
  title: "Định luật Nhịp Phách (Beats) trong Âm nhạc & Hiện tượng giao thoa",
  author: "Hermann von Helmholtz (Đức, 1821 – 1894)",
)[
  Hermann von Helmholtz là một trong những nhà vật lý và sinh lý học vĩ đại nhất thế kỷ XIX. Ông là người đầu tiên giải mã cơ chế cảm thụ âm nhạc của ốc tai con người trong kiệt tác *"Die Lehre von den Tonempfindungen"* (Lý thuyết về cảm giác âm thanh).
  
  Helmholtz đã làm một thí nghiệm nổi tiếng: Gõ hai chiếc âm thoa bằng thép có tần số gần bằng nhau: một chiếc phát ra âm có tần số $f_1 = 440$ Hz (nốt La chuẩn quốc tế), chiếc kia bị dán thêm một mẩu sáp nhỏ nên tần số bị giảm nhẹ còn $f_2 = 436$ Hz.
  
  Khi hai âm thanh phát ra riêng lẻ, tai người nghe thấy tiếng u u đều đặn. Nhưng khi hai âm thoa cùng rung lên một lúc, một hiện tượng kỳ lạ xảy ra: Âm thanh không còn đều nữa, mà bỗng nhiên *ngân nga to dần rồi nhỏ dần, dập dềnh như tiếng thở* với chu kỳ 4 lần mỗi giây! Hiện tượng này trong âm nhạc gọi là *Tiếng phách (Beats)*.
  
  Bản chất toán học của tiếng phách chính là *Công thức Biến đổi Tổng thành Tích* mà học sinh lớp 11 học hôm nay:
  $ cos(omega_1 t) + cos(omega_2 t) = 2 cos((omega_1 - omega_2) / 2 t) times cos((omega_1 + omega_2) / 2 t) $
  Số hạng thứ nhất dao động rất chậm với tần số hiệu $(f_1 - f_2)/2 = 2$ Hz — chính là lớp vỏ bao bọc làm âm lượng to lên rồi nhỏ lại! Các nhạc công đàn piano và violin chuyên nghiệp suốt hàng trăm năm qua đều dựa vào tiếng phách lượng giác này để lên dây đàn chuẩn xác đến từng phần mười Hertz mà không cần bất kỳ chiếc máy đo điện tử nào!
]

#hook-box(title: "Bí mật đằng sau Chiếc Tai nghe Chống ồn Chủ động (ANC) của Apple")[
  Thầy bước vào lớp, đeo chiếc tai nghe AirPods Pro lên tai rồi bật chế độ Chống ồn (Active Noise Cancellation):
  
  *“Khi các em ngồi trên xe buýt ầm ĩ hay đi máy bay gầm rú, chỉ cần đeo chiếc tai nghe chống ồn chủ động lên, toàn bộ tiếng ồn xung quanh bỗng nhiên BIẾN MẤT HOÀN TOÀN như một phép màu! Làm sao một chiếc tai nghe nhỏ xíu lại có thể nuốt chửng được tiếng ồn của cả động cơ máy bay phản lực?*
  
  *Có phải chiếc tai nghe đã bịt kín tai các em như một nút cao su không? Không hề!*
  
  *Bí mật nằm ở CÔNG THỨC CỘNG LƯỢNG GIÁC: $cos(x) + cos(x + pi) = 0$!*
  - Micro bên ngoài tai nghe thu lại sóng âm tiếng ồn của môi trường: $y_1 = A cos(omega t)$.
  - Con chip Apple H2 bên trong tai nghe xử lý trong 0,001 giây và phát ra một sóng âm ĐẢO PHA CHÍNH XÁC $180 degree$ ($pi$ radian): $y_2 = A cos(omega t + pi) = - A cos(omega t)$.
  - Hai sóng âm va chạm vào màng nhĩ cùng lúc và triệt tiêu nhau hoàn toàn:
  $ y_("tổng") = y_1 + y_2 = A cos(omega t) - A cos(omega t) = 0! $
  
  *Toán học lượng giác lớp 11 đã dùng chính âm thanh để tiêu diệt âm thanh, tạo ra sự tĩnh lặng tuyệt đối cho đôi tai của các em!”*
]

#tech-box(title: "Bộ điều chế Tần số FM & Sóng Wifi không dây")[
  - *Điều chế tần số FM (Frequency Modulation) trong Đài phát thanh*: Làm sao một bài hát từ đài phát thanh VOV có thể truyền qua hàng trăm kilomet đến chiếc radio của các em mà không bị méo tiếng? Các kỹ sư viễn thông áp dụng trực tiếp công thức lượng giác hàm hợp $y(t) = A cos(omega_c t + k sin(omega_m t))$. Phép nhân và cộng tần số lượng giác giúp nén toàn bộ thông tin âm nhạc vào sóng mang cao tần, truyền đi xuyên qua các tòa nhà cao tầng và đồi núi!
]

---

== BÀI 3: HÀM SỐ LƯỢNG GIÁC — NHỊP TIM CỦA SỰ SỐNG & SÓNG TRIỀU ĐẠI DƯƠNG

Bốn hàm số lượng giác cơ bản: $y = sin x$, $y = cos x$, $y = tan x$, $y = cot x$ là bốn kỳ quan giải tích. Chúng là những hàm số tuần hoàn duy nhất có khả năng mô hình hóa sự lặp đi lặp lại của thời gian:
- Đồ thị của $sin x$ và $cos x$ là những đường hình sin mềm mại, lượn sóng nhịp nhàng giữa hai ranh giới $-1$ và $+1$.
- Đồ thị của $tan x$ và $cot x$ vươn lên vô tận, bị chia cắt bởi những đường tiệm cận đứng như những cột mốc ranh giới của cõi vô cực.

Không có một hiện tượng tuần hoàn nào trong tự nhiên — từ nhịp đập của quả tim người, chu kỳ giấc ngủ REM, chuyển động của con lắc đồng hồ, đến sự lên xuống của thủy triều biển cả — mà không được viết bằng ngôn ngữ của Hàm số Lượng giác!

#story-box(
  title: "Jean Bernard Léon Foucault & Con lắc chứng minh Trái Đất tự quay năm 1851",
  author: "Léon Foucault (Pháp, 1819 – 1868)",
)[
  Năm 1851, tại điện Panthéon ở thủ đô Paris, nhà vật lý học người Pháp *Léon Foucault* đã thực hiện một thí nghiệm làm kinh ngạc hàng vạn người dân và chính Hoàng đế Napoleon III.
  
  Foucault treo một quả cầu bằng đồng nặng 28 kg vào một sợi dây thép dài tới 67 mét thả từ đỉnh mái vòm khổng lồ của điện Panthéon xuống sàn nhà. Dưới đáy quả cầu có gắn một ngòi bút nhọn, và trên sàn nhà phủ một lớp cát mịn. Foucault kéo quả cầu sang một bên rồi thả cho nó lắc lư tự do.
  
  Theo định luật quán tính của Newton, một con lắc khi đã dao động sẽ giữ nguyên mặt phẳng dao động của nó trong không gian. Nhưng sau vài giờ, mọi người kinh ngạc nhìn thấy: Vết vạch của ngòi bút trên lớp cát mịn đang *chậm rãi quay tròn theo chiều kim đồng hồ*!
  
  Foucault dõng dạc tuyên bố: Không phải con lắc đang quay, mà chính là *TOÀN BỘ NGÔI ĐIỆN PANTHÉON VÀ TOÀN BỘ TRÁI ĐẤT ĐANG TỰ QUAY TRÒN DƯỚI CHÂN CỦA CON LẮC!*
  
  Và chu kỳ quay của mặt phẳng con lắc tại một vĩ độ $phi$ bất kỳ trên Trái Đất được tính chính xác bằng một hàm số lượng giác tuyệt mỹ:
  $ T(phi) = (24 "giờ") / (sin phi) $
  Tại hai địa cực ($phi = 90 degree$, $sin 90 degree = 1$), con lắc quay đúng một vòng sau 24 giờ. Tại Xích đạo ($phi = 0 degree$, $sin 0 degree = 0$), $T = infinity$, mặt phẳng con lắc đứng yên vĩnh viễn! Bằng một hàm sin lượng giác đơn sơ, Foucault đã chứng minh chuyển động tự quay của hành tinh bằng trực quan thị giác lần đầu tiên trong lịch sử loài người!
]

#hook-box(title: "Đồ thị Điện tâm đồ (ECG): Giây phút đường cong biến thành đường thẳng")[
  Thầy chiếu lên màn hình một biểu đồ Điện tâm đồ (ECG) đang nhấp nhô nhịp nhàng từng nhịp tim đập:
  
  *“Các em hãy nhìn những đường cong uốn lượn hình sin này. Khi trái tim của chúng ta co bóp, nó phát ra các xung điện tuần hoàn theo chu kỳ khoảng 0,8 giây/nhịp: Sóng P, phức bộ QRS, và sóng T. Bản chất của đồ thị điện tâm đồ chính là sự tổng hòa của các hàm số lượng giác tuần hoàn $y = A sin(omega t + phi)$!*
  
  *Khi đồ thị còn uốn lượn hình sin, có nghĩa là sự sống vẫn đang đập rộn rã trong lồng ngực. Nhưng nếu một ngày kia, các hàm lượng giác ngừng dao động, đồ thị chuyển thành một ĐƯỜNG THẲNG TẮP nằm ngang kèm theo một tiếng bíp kéo dài vô tận... Đó là thời khắc của cái chết!*
  
  *Hàm số lượng giác không phải là một bài toán thi cử khô khốc, hàm số lượng giác chính là giai điệu của sự sống, là nhịp đập của trái tim mỗi con người chúng ta!”*
]

#tech-box(title: "Dự báo Thủy triều cho Cảng biển & Năng lượng Sóng biển")[
  - *Mô hình Dự báo Thủy triều của các Cảng biển Quốc tế*: Khi một con tàu container siêu trọng tải 20.000 TEU muốn cập cảng Hải Phòng hay Rotterdam, mớn nước của tàu sâu tới 16 mét. Tàu chỉ có thể vào cảng an toàn khi thủy triều dâng lên mức cao nhất. Cơ quan khí tượng hải văn lập phương trình độ sâu nước biển theo thời gian bằng tổng của hàng chục hàm số lượng giác:
    $ h(t) = h_0 + sum A_i cos(omega_i t + phi_i) $
    mô tả lực hấp dẫn tuần hoàn của Mặt Trăng và Mặt Trời, giúp điều phối hàng vạn chuyến tàu hàng hải an toàn mỗi năm!
]

---

== BÀI 4: PHƯƠNG TRÌNH LƯỢNG GIÁC — CỘNG HƯỞNG DAO ĐỘNG & THẢM HỌA TACOMA

Khi giải phương trình lượng giác cơ bản như $sin x = m$ hay $cos x = m$, học sinh thường thấy bối rối vì nghiệm của nó không phải là một hay hai con số đơn lẻ như phương trình đại số, mà là *vô số nghiệm trải dài theo họ góc:*
$ x = alpha + k 2pi quad (k in ZZ) $

Chữ cái $k$ đại diện cho số vòng quay thời gian vô hạn của tự nhiên. Và khi tần số dao động của ngoại lực bên ngoài trùng khớp với tần số dao động riêng của một phương trình lượng giác, một hiện tượng vật lý khủng khiếp nhất sẽ xảy ra: *Hiện tượng Cộng hưởng (Resonance)* — có sức mạnh bẻ gãy cả những cây cầu thép kiên cố nhất!

#story-box(
  title: "Thảm họa Cầu Tacoma Narrows 1940: Khi cơn gió bẻ gãy cây cầu thép 6 triệu USD",
  author: "Cầu treo Tacoma Narrows (Washington, Hoa Kỳ — Ngày 07/11/1940)",
)[
  Sáng ngày 7 tháng 11 năm 1940, cây cầu treo Tacoma Narrows dài 1,6 km tại bang Washington — công trình cầu treo dài thứ 3 thế giới thời đó vừa khánh thành được 4 tháng — bất ngờ rung lắc dữ dội.
  
  Tốc độ gió sáng hôm đó chỉ ở mức trung bình khoảng $68$ km/h — một cơn gió hoàn toàn bình thường không phải bão lớn. Thế nhưng, luồng gió thổi qua các thanh dầm thép của cây cầu đã tạo ra các xoáy khí xoay tròn tuần hoàn (hiện tượng xoáy Von Kármán). Tần số của luồng xoáy khí này vô tình trùng khớp hoàn hảo với tần số dao động xoắn riêng của cây cầu!
  
  Phương trình vi phân lượng giác mô tả góc xoắn của mặt cầu bị cộng hưởng:
  $ theta''(t) + omega_0^2 theta(t) = F_0 cos(omega t) quad ("với" space omega approx omega_0) $
  
  Nghiệm của phương trình này chứa số hạng biên độ tăng dần theo thời gian: $theta(t) approx (F_0 / (2 omega_0)) t sin(omega_0 t)$! Biên độ dao động không ngừng tăng vọt! Mặt cầu bằng bê tông cốt thép nặng hàng chục nghìn tấn bị uốn lượn như một dải lụa mềm, nghiêng một góc tới $45 degree$, xe cộ trượt dạt sang hai bên. Sau hơn một giờ oằn mình dữ dội, các dây cáp thép đứt tung và toàn bộ nhịp cầu chính gãy đôi đổ sụp xuống eo biển Puget Sound trong tiếng gầm rú kinh hoàng!
  
  Thảm họa Tacoma Narrows đã trở thành bài học xương máu kinh điển nhất trong lịch sử kỹ thuật xây dựng toàn cầu, buộc mọi kỹ sư cầu đường từ đó về sau phải giải thành thạo phương trình dao động lượng giác để tránh hiện tượng cộng hưởng tử thần!
]

#hook-box(title: "Cây cầu Thiên niên kỷ London (Millennium Bridge) bị lắc lư ngày khánh thành")[
  Thầy kể một câu chuyện hiện đại hấp dẫn:
  
  *“Ngày 10 tháng 6 năm 2000, cây cầu đi bộ Thiên niên kỷ bắc qua sông Thames ở London được khánh thành với sự tham gia của hàng vạn người đi bộ. Nhưng chỉ vài phút sau khi mở cửa, cây cầu bỗng nhiên bị lắc lư sang hai bên một cách điên cuồng, khiến người đi bộ lảo đảo như say rượu và phải bám chặt vào thành cầu! Chính quyền thành phố hoảng sợ phải đóng cửa cây cầu ngay lập tức!*
  
  *Các nhà khoa học vào cuộc điều tra và phát hiện một sự thật thú vị:*
  - Con người khi đi bộ tự nhiên có tần số bước chân lắc lư sang hai bên khoảng $1$ Hz (1 bước/giây).
  - Cây cầu Millennium có tần số dao động ngang tự nhiên đúng bằng $1$ Hz!
  - Khi hàng nghìn người cùng bước đi, một cách vô thức, mọi người đều tự động điều chỉnh bước chân đồng nhịp để giữ thăng bằng. Hàng nghìn người vô tình trở thành một máy phát sóng lượng giác khổng lồ làm khuếch đại biên độ của phương trình dao động!
  
  *Thành phố London đã phải chi thêm 5 triệu Bảng Anh để lắp đặt 91 bộ giảm chấn thủy lực dưới gầm cầu nhằm triệt tiêu nghiệm của phương trình cộng hưởng lượng giác trước khi mở cửa lại!”*
]

#tech-box(title: "Bộ lọc Dao động Thạch anh trong Đồng hồ & Vi xử lý Máy tính")[
  - *Bộ dao động tinh thể thạch anh (Quartz Oscillator)*: Bên trong chiếc đồng hồ đeo tay hay con chip CPU máy tính của các em có một miếng tinh thể thạch anh siêu nhỏ. Khi có dòng điện chạy qua, miếng thạch anh rung lên với tần số lượng giác cực kỳ ổn định: đúng $32.768$ chu kỳ mỗi giây ($32.768 = 2^(15)$ Hz). Mạch đếm điện tử giải phương trình chu kỳ lượng giác này để chia đôi tần số 15 lần liên tiếp, cho ra đúng xung nhịp 1 giây chuẩn xác của đồng hồ!
]

---

== CHUYÊN ĐỀ CHUYÊN SÂU: JOSEPH FOURIER & BIẾN ĐỔI FOURIER LÀM RUNG CHUYỂN THẾ GIỚI

#story-box(
  title: "Jean-Baptiste Joseph Fourier & Bản thảo bị Viện Hàn lâm Pháp bác bỏ",
  author: "Jean-Baptiste Joseph Fourier (Pháp, 1768 – 1830)",
)[
  Joseph Fourier là một đứa trẻ mồ côi cả cha lẫn mẹ từ năm 9 tuổi tại thị trấn Auxerre nước Pháp. Nhờ tài năng toán học xuất chúng, ông được Napoléon Bonaparte trọng dụng và cử làm Thống đốc vùng Hạ Ai Cập trong cuộc viễn chinh lịch sử năm 1798.
  
  Năm 1807, Fourier trở về Pháp và nộp lên Viện Hàn lâm Khoa học Paris một bản thảo làm chấn động toàn bộ giới học thuật mang tên *"Théorie analytique de la chaleur"* (Lý thuyết giải tích về nhiệt). Trong đó, Fourier đưa ra một tuyên bố táo bạo đến mức điên rồ:
  *MỌI HÀM SỐ TUẦN HOÀN BẤT KỲ — DÙ NÓ CÓ GẪY GÓC, ĐỨT ĐOẠN HAY KỲ DỊ ĐẾN ĐÂU — ĐỀU CÓ THỂ PHÂN TÍCH THÀNH TỔNG CỦA CÁC HÀM LƯỢNG GIÁC SIN VÀ COS:*
  $ f(x) = a_0/2 + sum_(n=1)^infinity [a_n cos(n x) + b_n sin(n x)] $
  
  Ba nhà toán học quyền lực tối cao thời đó là *Laplace, Lagrange và Legendre* đã thẳng thừng bác bỏ bản thảo của Fourier! Lagrange đứng lên tuyên bố: Làm sao những đường cong sin mềm mại, khả vi vô hạn lại có thể ghép lại thành một đường cong gấp khúc vuông vức hình răng cưa được? Bản thảo của Fourier bị giam cầm suốt 15 năm ròng không được in ấn!
  
  Nhưng Fourier không hề nản lòng. Ông kiên trì hoàn thiện chứng minh toán học và xuất bản cuốn sách vào năm 1822. Lịch sử đã chứng minh Fourier hoàn toàn đúng đắn! *Chuỗi Fourier và Biến đổi Fourier (Fourier Transform)* đã trở thành một trong những công cụ toán học quyền lực nhất từng được loài người sáng tạo ra, mở đường cho toàn bộ kỷ nguyên truyền thông kỹ thuật số và công nghệ y tế hiện đại!
]

#tech-box(title: "Máy chụp Cộng hưởng từ MRI & Thuật toán Nén nhạc MP3 / Ảnh JPEG")[
  - *Máy chụp Cộng hưởng từ hạt nhân (MRI) trong bệnh viện*: Khi bệnh nhân nằm vào lồng máy MRI khổng lồ, từ trường làm các hạt proton trong cơ thể phát ra các tín hiệu sóng vô tuyến hỗn độn. Máy tính bệnh viện sử dụng thuật toán *Biến đổi Fourier nhanh (Fast Fourier Transform - FFT)* để bóc tách chùm sóng phức tạp này thành hàng triệu thành phần sin, cos lượng giác, từ đó tái tạo lại hình ảnh cắt lớp não bộ và các khối u với độ sắc nét từng milimet mà không cần mổ một nhát dao nào!
  - *Nén âm thanh MP3 và hình ảnh JPEG*: Khi các em nghe một bản nhạc trên Spotify, file nhạc gốc có dung lượng rất lớn. Thuật toán MP3 dùng chuỗi Fourier lượng giác phân tích bài hát thành các dải tần số sin/cos. Nó loại bỏ những tần số siêu âm mà tai người không nghe thấy được, nén dung lượng file bài hát giảm đi 10 lần mà chất lượng âm thanh vẫn tuyệt hảo!
]
#misconception-box(title: "Cái bẫy chia hai vế làm mất nghiệm & Nhầm lẫn Radian - Độ")[
  Trong suốt nhiều năm chấm thi THPT và thi học sinh giỏi, các thầy cô đều chứng kiến hai "thảm họa" sư phạm phổ biến nhất của học sinh khi làm bài lượng giác:
  
  1. *Cái bẫy triệt tiêu làm bay màu họ nghiệm:*
  Khi giải phương trình $sin 2x = sin x$, một số lượng lớn học sinh vội vã khai triển $2 sin x cos x = sin x$, sau đó hồn nhiên chia cả hai vế cho $sin x$ để thu được $cos x = 1/2$. Các em đã vô tình vứt bỏ hoàn toàn trường hợp $sin x = 0$, làm mất đi một nửa số nghiệm của phương trình!
  - *Chiến lược sư phạm:* Luôn nhắc nhở học sinh: *Chỉ được chia khi đã chắc chắn đại lượng đó khác 0 tuyệt đối!* Hãy tập phản xạ chuyển vế đặt nhân tử chung: $sin x (2 cos x - 1) = 0$.
  
  2. *Thảm họa bấm máy tính Casio nhầm hệ Đơn vị (Deg vs Rad):*
  Bao nhiêu học sinh đi thi làm bài đúng phương pháp từ đầu đến cuối nhưng kết quả ra sai số kỳ dị chỉ vì quên không chuyển máy tính cầm tay từ chế độ `D` (Degree) sang `R` (Radian) khi tính đạo hàm hoặc giải phương trình lượng giác? Radian là tỷ số độ dài thực sự (thuần số thực không đơn vị), còn Độ chỉ là quy ước nhân tạo chia vòng tròn thành 360 phần của người Babylon cổ đại!
]

#dialogue-box(title: "Khám phá Bản chất Pythagoras trên Đường tròn Đơn vị")[
  *Thầy:* “Nam ơi, em hãy đọc cho thầy công thức cơ bản nhất của Lượng giác mà em học từ lớp 9 đến giờ nào?”\
  *Nam:* “Dạ thưa thầy, $sin^2 x + cos^2 x = 1$ ạ!”\
  *Thầy:* “Tốt lắm! Thế em có bao giờ tự hỏi: Tại sao tổng bình phương của chúng luôn luôn bằng đúng 1 mà không phải là một con số nào khác không?”\
  *Nam:* “Dạ... chắc là các nhà toán học chứng minh bằng định nghĩa cạnh đối trên cạnh huyền thôi ạ.”\
  *Thầy:* “Hãy nhìn lên bảng! Thầy chấm một điểm $M$ bất kỳ trên đường tròn lượng giác có bán kính $R = 1$. Tọa độ của điểm $M$ là gì?”\
  *Nam:* “Dạ hoành độ là $x_M = cos alpha$, tung độ là $y_M = sin alpha$ ạ!”\
  *Thầy:* “Khoảng cách từ gốc tọa độ $O(0, 0)$ đến điểm $M$ bằng bao nhiêu?”\
  *Nam:* “Dạ bằng đúng bán kính $R = 1$ của đường tròn đơn vị ạ!”\
  *Thầy:* “Vậy theo định lý Pythagoras trong tam giác vuông tạo bởi hình chiếu của $M$ lên hai trục tọa độ, bình phương khoảng cách $O M^2$ bằng gì?”\
  *Nam (mắt sáng rực):* “A! $x_M^2 + y_M^2 = O M^2$, tức là $(cos alpha)^2 + (sin alpha)^2 = 1^2 = 1$! Nó chính là Định lý Pythagoras viết dưới dạng tọa độ!”\
  *Thầy (mỉm cười):* “Chính xác! Lượng giác không phải là một môn học từ trên trời rơi xuống. Nó chính là Định lý Pythagoras cổ xưa của người Hy Lạp được khoác lên tấm áo động lực học của đường tròn xoay!”
]

#deep-dive-box(title: "Công thức Euler $e^(i x) = cos x + i sin x$ — Nơi Hợp nhất Vĩ đại")[
  Đối với người giáo viên dạy Toán, việc hiểu sâu bản chất toán học cao cấp đằng sau lượng giác phổ thông là chìa khóa để truyền tải sự mê hoặc trí tuệ cho học trò.
  
  Đỉnh cao tối thượng của Lượng giác nằm ở *Công thức Euler* (được Richard Feynman gọi là "công thức toán học kỳ diệu nhất trần gian"):
  $ e^(i x) = cos x + i sin x $
  
  Công thức này tiết lộ rằng:
  - Hàm số mũ $e^x$ và các hàm lượng giác tuần hoàn $sin x, cos x$ thực chất là MỘT THỰC THỂ DUY NHẤT khi bước vào mặt phẳng số phức!
  - Chuyển động tròn đều lượng giác chính là quỹ đạo của hàm mũ ảo $e^(i omega t)$ quay quanh gốc tọa độ.
  - Khi thay $x = pi$, ta thu được *Đẳng thức Euler*:
  $ e^(i pi) + 1 = 0 $
  nơi 5 hằng số nền tảng nhất của toàn bộ nền văn minh loài người: Số 0 (Số học), Số 1 (Đơn vị), Số $pi$ (Hình học), Số $e$ (Giải tích) và Đơn vị ảo $i$ (Đại số) hội ngộ trong một phương trình duy nhất đẹp đến nghẹt thở!
]

#story-box(
  title: "Gauss Năm 19 Tuổi & Đa Giác Đều 17 Cạnh: Phát Minh Lượng Giác Thay Đổi Cuộc Đời Hoàng Tử Toán Học",
  author: "Carl Friedrich Gauss (Đức, 1777 – 1855), 'Hoàng Tử Của Các Nhà Toán Học' (Princeps Mathematicorum)",
)[
  Suốt hơn 2.000 năm kể từ thời Hy Lạp cổ đại của Euclid, toàn bộ các nhà toán học trên thế giới đều tin rằng: Chỉ có thể dùng thước kẻ và compa cổ điển để dựng các đa giác đều có số cạnh là $3, 4, 5, 15$ và các số cạnh nhân đôi của chúng. Mọi nỗ lực dựng đa giác đều $7, 11, 13, 17$ cạnh đều rơi vào bế tắc tuyệt đối.
  
  Buổi sáng ngày 29 tháng 3 năm 1796, chàng thanh niên 19 tuổi Carl Friedrich Gauss thức dậy trong căn phòng trọ sinh viên tại Đại học Göttingen. Trong đầu chàng sinh viên nghèo khi ấy đang có một cuộc giằng xé dữ dội: Nên theo đuổi ngành Ngôn ngữ học Cổ điển mà mình rất giỏi, hay dấn thân vào Toán học đầy gian truân?
  
  Chính trong buổi sáng định mệnh ấy, bằng việc nghiên cứu nghiệm phức của phương trình lượng giác chia đường tròn:
  $ z^(17) - 1 = 0 quad <=> quad cos((2 k pi) / 17) + i sin((2 k pi) / 17) $
  Gauss đã khám phá ra một công thức lượng giác chấn động lịch sử: Giá trị $cos(2 pi / 17)$ hoàn toàn có thể biểu diễn được bằng các phép cộng, trừ, nhân, chia và *CĂN BẬC HAI LỒNG NHAU*:
  $ cos((2 pi) / 17) = - 1/16 + 1/16 sqrt(17) + 1/16 sqrt(34 - 2 sqrt(17)) + 1/8 sqrt(17 + 3 sqrt(17) - sqrt(34 - 2 sqrt(17)) - 2 sqrt(34 + 2 sqrt(17))) $
  
  Vì biểu thức chỉ chứa căn bậc hai, nó đồng nghĩa với việc: *ĐA GIÁC ĐỀU 17 CẠNH HOÀN TOÀN CÓ THỂ DỰNG ĐƯỢC CHỈ BẰNG THƯỚC VÀ COMPA!*
  
  Kỳ tích lượng giác và đại số này đã làm rung chuyển toàn bộ giới học thuật châu Âu. Quá xúc động trước vẻ đẹp tối thượng của toán học, Gauss quyết định từ bỏ vĩnh viễn ngành ngôn ngữ để cống hiến trọn đời cho toán học, mở ra kỷ nguyên rực rỡ nhất của toán học hiện đại. 
  
  Trước khi qua đời, Gauss đã di chúc một nguyện vọng tha thiết: *Hãy khắc lên bia mộ của ông hình một đa giác đều 17 cạnh nội tiếp trong đường tròn!*
]

#tech-box(title: "Kiến Trúc Âm Học Elbphilharmonie Hamburg: 10.000 Tấm Thạch Cao Lượng Giác Tiêu Biến Tiếng Vang")[
  Nhà hát giao hưởng Elbphilharmonie tại thành phố Hamburg (Đức) — công trình kiến trúc trị giá 866 triệu Euro được mệnh danh là kỳ quan âm học hiện đại của thế kỷ XXI.
  
  Làm thế nào để một khán phòng khổng lồ 2.100 chỗ ngồi có được chất lượng âm thanh hoàn hảo tuyệt đối: Dù khán giả ngồi ở hàng ghế đầu sát sân khấu hay ngồi tít trên tầng cao nhất xa 50 mét, họ đều nghe rõ từng tiếng gảy dây đàn violin thì thầm với âm lượng và độ trong trẻo y hệt nhau, không hề có tiếng vọng dội lại gây chói tai?
  
  Bí mật nằm ở *"Tấm Da Trắng (White Skin)"* bao phủ toàn bộ khán phòng gồm đúng *10.000 tấm sợi thạch cao* được cắt gọt riêng biệt bằng máy CNC:
  1. Mỗi tấm thạch cao có bề mặt lồi lõm với hàng triệu vết lõm hình parabol và sóng sin tuần hoàn có độ sâu từ $4$ đến $100$ mm.
  2. Các kỹ sư âm học đã sử dụng thuật toán *Mô phỏng Giao thoa Sóng Lượng giác 3D*:
  $ p(x, y, z, t) = P_0 cos(k_x x + k_y y + k_z z - omega t) $
  để tính toán chính xác hướng phản xạ của từng bước sóng âm thanh.
  3. Khi một sóng âm thanh đập vào bề mặt lượng giác này, thay vì dội thẳng lại thành tiếng vang khó chịu, sóng âm bị tán xạ khuếch tán đều ra mọi hướng trong không gian như một đám sương mù âm thanh êm dịu!
  
  Nếu không có các phương trình sóng lượng giác và chuỗi Fourier, các kiến trúc sư vĩ đại nhất hành tinh sẽ vĩnh viễn không bao giờ có thể tạo nên những thánh đường âm nhạc làm rung động hàng triệu trái tim như Elbphilharmonie!
]

#inquiry-box(title: "Hòa Âm Bằng Đôi Tai & Mô Phỏng Chuỗi Sóng Vuông Fourier Bằng Máy Tính")[
  Dành cho các em học sinh có đam mê khám phá khoa học và muốn biến trang sách thành phòng thí nghiệm sống động:
  
  1. *Thí nghiệm 1: Lắng nghe Công thức Biến đổi Tổng thành Tích bằng đôi tai (Acoustic Beats):*
  - Tải ứng dụng phát tần số âm thanh miễn phí trên điện thoại (như *Tone Generator* hoặc dùng phần mềm *Audacity* trên máy tính).
  - Bật đồng thời hai âm thanh: Tần số $f_1 = 440 "Hz"$ (nốt La chuẩn của dàn nhạc giao hưởng) và $f_2 = 444 "Hz"$.
  - *Hiện tượng quan sát:* Các em sẽ không nghe thấy hai âm thanh tách rời, mà nghe thấy một âm thanh duy nhất đang "đập nhịp, thở hổn hển" to nhỏ tuần hoàn đúng $4$ lần mỗi giây ($|f_1 - f_2| = 4 "Hz"$)!
  - *Giải mã toán học:* Chính công thức lượng giác lớp 11 đã giải thích điều đó:
  $ cos(2 pi f_1 t) + cos(2 pi f_2 t) = 2 cos(2 pi ((f_1 - f_2) / 2) t) dot cos(2 pi ((f_1 + f_2) / 2) t) $
  Âm thanh đập nhịp to nhỏ chính là tần số bao hình $(f_1 - f_2)/2 = 2 "Hz"$! Lượng giác không còn là chữ viết chết trên bảng, nó vang lên sống động trong không gian!
  
  2. *Thí nghiệm 2: Tự tạo Sóng Vuông từ những Đường cong Sin trên GeoGebra:*
  - Mở phần mềm GeoGebra (trực tuyến tại geogebra.org), tạo một thanh trượt số nguyên $N$ từ $1$ đến $50$.
  - Nhập hàm số tổng Fourier sau:
  $ f(x) = sum_(k=1)^N (sin((2k - 1)x)) / (2k - 1) = sin x + (sin 3x)/3 + (sin 5x)/5 + ... + (sin((2N - 1)x))/(2N - 1) $
  - Khi kéo thanh trượt $N$ tăng dần từ 1 lên 20 rồi 50, các em sẽ kinh ngạc chứng kiến: Những đường cong sin uốn lượn mềm mại dần dần tự uốn thẳng và dựng vách đứng, biến hình thành một *SÓNG XUNG VUÔNG* hoàn hảo của tín hiệu kỹ thuật số vi mạch!
  - Hãy quan sát kỹ hai góc nhọn ở mép sóng vuông: Chúng luôn nhô cao vượt quá mép khoảng $9\%$ — đó chính là *Hiện tượng Gibbs (Gibbs Phenomenon)* nổi tiếng mà các giáo sư hàng đầu thế giới từng tranh luận suốt nửa thế kỷ!
  
  3. *Sách kinh điển gợi ý tìm đọc để mở rộng tầm mắt:*
  - *"Trigonometric Delights"* (Những niềm say mê Lượng giác) — GS. Eli Maor, Nhà xuất bản Đại học Princeton.
  - *"The Feynman Lectures on Physics"* (Tập 1, Chương 48: Nhịp phách và Sóng) — Nhà vật lý đoạt giải Nobel Richard Feynman.
]

#story-box(
  title: "Al-Biruni & Phép Đo Bán Kính Trái Đất Trên Đỉnh Núi Bằng Lượng Giác",
  author: "Abu Rayhan al-Biruni (973 – 1048), Nhà Bác Học Hồi Giáo Xứ Khwarezm",
)[
  Vào thế kỷ XI tại pháo đài Nandana (nay thuộc Pakistan), nhà thiên văn học Hồi giáo vĩ đại *Abu Rayhan al-Biruni* đã thực hiện một kỳ tích đo đạc làm kinh ngạc toàn bộ nhân loại: Ông tính ra bán kính của Trái Đất mà không cần phải đi bộ hàng nghìn cây số qua sa mạc như Eratosthenes thời cổ đại!
  
  Al-Biruni chỉ đứng trên đỉnh một ngọn núi nhìn ra bờ biển phẳng lặng bao la:
  1. Đầu tiên, ông đo độ cao của ngọn núi ($h$) bằng phương pháp tam giác lượng giác thông thường (đo góc ngẩng từ hai điểm cách nhau trên mặt đất bằng thước trắc tinh Astrolabe).
  2. Sau đó, ông trèo lên đỉnh núi và dùng thước đo chính xác *Góc hạ đường chân trời* $alpha$ (góc giữa phương nằm ngang và tia nhìn tiếp xúc với mặt biển cong của Trái Đất).
  
  Trong tam giác vuông tạo bởi tâm Trái Đất ($O$), đỉnh núi ($T$) và tiếp điểm chân trời ($H$):
  $ cos alpha = (O H) / (O T) = R / (R + h) $
  $ <=> R cos alpha + h cos alpha = R <=> R(1 - cos alpha) = h cos alpha $
  $ <=> R = (h cos alpha) / (1 - cos alpha) $
  
  Bằng công thức lượng giác thanh nhã này, với ngọn núi cao $h = 650.5$ mét và góc hạ $alpha = 34'$, Al-Biruni đã tính ra bán kính Trái Đất là $R = 6.335,7$ km!
  
  Con số này chỉ lệch chưa đầy $0.9\%$ so với kết quả đo đạc bằng vệ tinh hiện đại của NASA ($6.371$ km)! Cách đây một thiên niên kỷ, chỉ bằng một chiếc thước đo góc và công thức lượng giác lớp 11, bộ não con người đã có thể ôm trọn cả hành tinh xanh bao la!
]

#tech-box(title: "Thuật Toán CORDIC: Cách Máy Tính Bỏ Túi Tính Sin/Cos Mà Không Cần Phép Nhân")[
  Khi các em bấm phím `sin(37°)` trên máy tính Casio, chiếc máy tính chỉ mất một phần nghìn giây để hiện ra kết quả. Nhưng một con chip máy tính cầm tay chạy bằng pin mặt trời nhỏ bé không hề có bộ xử lý đồ họa mạnh mẽ để tính chuỗi đa thức Taylor phức tạp!
  
  Làm thế nào máy tính có thể tính hàm lượng giác siêu tốc mà không tốn pin?
  Năm 1959, kỹ sư Jack Volder đã phát minh ra *Thuật toán CORDIC (Coordinate Rotation Digital Computer)*:
  - Để tính góc xoay $theta$, thuật toán phân tích $theta$ thành tổng các góc xoay cơ sở:
  $ theta = sum_(i=0)^n d_i dot alpha_i quad (d_i in {-1, +1}) $
  trong đó các góc cơ sở được chọn khéo léo sao cho $tan alpha_i = 2^(-i)$ ($alpha_0 = 45 degree, alpha_1 approx 26.56 degree, alpha_2 approx 14.04 degree...$).
  - Khi đó, công thức xoay vector lượng giác:
  $ cases(x_(i+1) = x_i - d_i dot 2^(-i) y_i, y_(i+1) = y_i + d_i dot 2^(-i) x_i) $
  Phép nhân với $2^(-i)$ trong hệ nhị phân máy tính CHỈ ĐƠN GIẢN LÀ PHÉP DỊCH BIT (Bit-shift) sang phải $i$ vị trí — không cần thực hiện bất kỳ phép nhân hay chia nào!
  
  Ngày nay, thuật toán CORDIC lớp 11 chạy trong trái tim của mọi máy tính bỏ túi Casio, hệ thống radar quân sự, con quay hồi chuyển trên máy bay chiến đấu phản lực và hệ thống định vị tên lửa hành trình Tomahawk!
]

#story-box(
  title: "Hipparchus Xứ Nicaea & Bảng Dây Cung Thiên Văn Đầu Tiên Của Nhân Loại",
  author: "Hipparchus (190 – 120 TCN), Cha Đẻ Ngành Lượng Giác Học Cổ Đại",
)[
  Hơn 2.100 năm trước trên hòn đảo Rhodes đầy nắng gió ở Địa Trung Hải, nhà thiên văn học Hy Lạp cổ đại Hipparchus đã ngước nhìn lên bầu trời đêm và trăn trở:
  *Làm thế nào để đo lường khoảng cách từ Trái Đất đến Mặt Trăng và các vì sao khi không một ai có thể cầm một sợi thước dây vươn tới thiên đường?*
  
  Ông nhận ra: Mọi tam giác thiên văn trên vòm trời đều có thể quy về một hình tròn lớn bao quanh người quan sát.
  Năm 140 TCN, Hipparchus đã lập nên *Bảng Dây Cung Đầu Tiên trong Lịch Sử (Table of Chords)* — tổ phụ của hàm Sin ngày nay:
  - Ông chia đường tròn thành $360 degree$, và đường kính thành $120$ phần bằng nhau.
  - Với mỗi góc ở tâm $alpha$ (cách nhau mỗi bước $7.5 degree$), ông tính độ dài đoạn dây cung chắn cung đó:
  $ "crd"(alpha) = 2 R sin(alpha / 2) $
  - Bằng bảng dây cung này và định lý nhật thực toàn phần ngày 14 tháng 3 năm 190 TCN (quan sát được ở Hellespont nhưng chỉ che khuất $4/5$ ở Alexandria), Hipparchus đã tính ra khoảng cách từ Trái Đất đến Mặt Trăng bằng *63 lần bán kính Trái Đất*!
  
  Con số của ông (khoảng $384.000$ km) chính xác đến kinh ngạc so với phép đo phản xạ laser hiện đại ($384.400$ km, chỉ lệch dưới $1\%$)! Lượng giác không sinh ra từ bàn giấy của các kỳ thi — nó sinh ra từ khát vọng vươn tới các vì sao của những bộ óc vĩ đại nhất thời cổ đại!
]

#pagebreak()
'''
