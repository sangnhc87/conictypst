# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG IV: VŨ KHÍ GIẢI PHÓNG KHÔNG GIAN — VECTƠ VÀ CÁC PHÉP TOÁN

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 8, Bài 9, Bài 10, Bài 11 SGK Toán 10 cùng Chuyên đề Hamilton, Tâm tỉ cự Möbius & Vector Embeddings trong Trí tuệ Nhân tạo (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 8: KHÁI NIỆM VECTƠ — BƯỚC NHẢY TỪ VÔ HƯỚNG SANG ĐA CHIỀU

Suốt hàng nghìn năm, loài người chỉ biết đo lường thế giới bằng những con số vô hướng (Scalars): một bao gạo nặng 50 kg, một quãng đường dài 10 km, nhiệt độ ngoài trời $35 degree C$. Nhưng khi nền văn minh bước vào kỷ nguyên cơ học và thiên văn học hiện đại, những con số vô hướng đã bộc lộ sự bất lực hoàn toàn:
- Nếu một cơn bão nhiệt đới di chuyển với vận tốc 100 km/h, nhưng dự báo thời tiết không biết nó đang lao vào bờ biển hay đang hướng ra Thái Bình Dương, thì con số 100 km/h đó hoàn toàn vô dụng đối với việc cứu sống người dân!
- Nếu một phi hành gia trên trạm vũ trụ ISS mở động cơ đẩy với lực 1.000 Newton, nếu không biết hướng của lực thì con tàu sẽ rơi tự do vào khí quyển bốc cháy hoặc bay mất hút vào vũ trụ vô tận.

Thế giới thực không phải là một chuỗi các con số đơn lẻ, mà là một vũ trụ của *Phương và Hướng!* Khái niệm *Vectơ* ra đời chính là một trong những bước nhảy vọt tư duy vĩ đại nhất của nhân loại: gắn kết độ lớn với một mũi tên chỉ hướng trong không gian!

#story-box(
  title: "William Rowan Hamilton: Vết Dao Khắc Trên Cây Cầu Brougham Ngày 16/10/1843",
  author: "Sir William Rowan Hamilton (Ireland, 1805 – 1865)",
)[
  Sir William Rowan Hamilton là một thần đồng kiệt xuất người Ireland: 5 tuổi ông đọc được tiếng Latin, Hy Lạp và Do Thái; 13 tuổi ông thông thạo 13 thứ tiếng từ Ba Tư, Ả Rập đến Phạn ngữ. Ông được bổ nhiệm làm Giáo sư Thiên văn học tại Đại học Trinity Dublin khi mới 22 tuổi, ngay cả khi chưa tốt nghiệp đại học!
  
  Suốt nhiều năm trời, Hamilton bị ám ảnh bởi một bài toán: Số phức $z = a + b i$ đã biểu diễn tuyệt mỹ các phép quay và độ dời trong mặt phẳng 2D. Nhưng làm thế nào để mở rộng đại số lên không gian 3 chiều? Mỗi buổi sáng bước xuống bàn ăn, hai cậu con trai nhỏ của Hamilton lại hỏi: *“Bố ơi, bố đã biết nhân các bộ ba số chưa?”*, và Hamilton chỉ biết buồn bã lắc đầu: *“Chưa con ạ, bố chỉ mới biết cộng và trừ chúng thôi!”*.
  
  Vào sáng ngày 16 tháng 10 năm 1843, khi Hamilton cùng vợ đi dạo dọc theo bờ kênh Hoàng gia ở Dublin để tới Viện Hàn lâm Ireland. Đúng lúc bước qua vòm đá của *Cây cầu Brougham*, một tia chớp cảm hứng thiên tài đột ngột bừng sáng trong tâm trí ông:
  *Muốn nhân được các vectơ trong không gian 3 chiều, con người bắt buộc phải nhảy lên KHÔNG GIAN 4 CHIỀU với 3 đơn vị ảo $i, j, k$!*
  
  Quá xúc động, không kiềm chế được niềm vui sướng nghẹn ngào, Hamilton đã rút ngay chiếc dao nhỏ trong túi áo ra và khắc sâu phương trình thần thánh lên phiến đá thành cầu Brougham:
  $ i^2 = j^2 = k^2 = i j k = -1 $
  
  Đó là sự ra đời của *Lý thuyết Quaternion (Đại số Bốn chiều)*! Vết khắc đá lịch sử đó sau này được các nhà toán học Josiah Willard Gibbs và Oliver Heaviside tách ra làm hai phần: Phần vô hướng (Scalar) và Phần vectơ (Vector) — chính là cội nguồn trực tiếp của chương Vectơ Toán 10 mà chúng ta học hôm nay!
]

#story-box(
  title: "Giustino Bellavitis & Khái niệm Đoạn thẳng tương đương",
  author: "Giustino Bellavitis (Ý, 1803 – 1880)",
)[
  Đầu thế kỷ XIX, nhà toán học người Ý *Giustino Bellavitis* — một người có xuất thân nghèo khó, tự học ở nhà và chưa từng có bằng đại học chính quy — đã quan sát thấy một điều kỳ lạ: Khi một đoàn tàu hỏa chuyển động trên đường ray thẳng, tất cả các toa tàu đều tịnh tiến cùng một vận tốc và cùng một hướng. Nếu ta chỉ nhìn vị trí cố định của từng toa xe, ta sẽ bị rối loạn bởi hàng trăm tọa độ khác nhau. Nhưng nếu ta trừu tượng hóa vận tốc thành một "mũi tên chuyển động", thì mũi tên của toa đầu và toa cuối là *HOÀN TOÀN NHƯ NHAU!*
  
  Năm 1835, Bellavitis công bố lý thuyết về *“Đoạn thẳng tương đương" (Equipollence)*: Hai đoạn thẳng có hướng được coi là bằng nhau nếu chúng có cùng độ dài, cùng phương và cùng hướng, bất chấp chúng nằm ở hai góc trời cách xa nhau! Khái niệm này đã giải phóng mũi tên khỏi sự giam cầm của điểm đặt cố định, khai sinh ra khái niệm *Vectơ tự do* trong SGK hôm nay! Nhờ công trình kiệt xuất này, Viện Hàn lâm Khoa học Ý đã đặc cách phong ông làm Giáo sư Toán học tại Đại học Padova danh tiếng.
]

#hook-box(title: "Bài toán 10 km bằng 0 km & Cơn bão nhiệt đới")[
  Thầy bước vào lớp, nhìn học sinh với ánh mắt đầy thách thức:
  
  *“Thầy hỏi cả lớp một câu đố tiểu học: Sáng nay một người đàn ông ra khỏi nhà, đi bộ 5 km về phía Bắc. Sau đó, ông ấy quay đầu đi bộ tiếp 5 km về phía Nam. Hỏi quãng đường ông ấy đi được là bao nhiêu kilomet, và vị trí của ông ấy cách nhà bao nhiêu kilomet?”*
  
  Học sinh lập tức đồng thanh: *“Đi được 10 km, nhưng vị trí cách nhà bằng 0 km!”*
  
  Thầy gật đầu, nở một nụ cười rạng rỡ:
  
  *“Chính xác! Con số 10 km là Đại số vô hướng của cấp 2, nó chỉ đo công sức mệt mỏi của đôi chân. Nhưng con số 0 km chính là VECTƠ của cấp 3: $vec(v)_1 + vec(v)_2 = vec(0)$! Vectơ không quan tâm bạn đã vất vả đi bao nhiêu bước, vectơ nói cho bạn biết bạn đang THỰC SỰ TIẾN VỀ ĐÂU trong vũ trụ này! Đó là lý do một người chạy lăng xăng cả ngày nhưng không có mục tiêu và định hướng rõ ràng thì tổng vectơ cuộc đời vẫn mãi mãi bằng con số KHÔNG tròn trĩnh!”*
]

#tech-box(title: "Vector Embeddings: Bí mật giúp ChatGPT & Claude hiểu được tiếng người")[
  - *Vector Embedding trong Trí tuệ Nhân tạo*: Máy tính chỉ hiểu các con số $0$ và $1$, nó không hề biết chữ "Vua", "Hoàng hậu" hay "Tình yêu" nghĩa là gì. Để các mô hình ngôn ngữ lớn (LLM) như ChatGPT, Gemini hay Claude hiểu được ngữ nghĩa, các nhà khoa học biến mỗi từ ngữ thành một *Vectơ toán học* có từ $1.536$ đến $4.096$ chiều trong không gian!
  - *Phép toán ngữ nghĩa kỳ diệu của Vectơ*: Khi được biểu diễn dưới dạng vectơ, điều kỳ diệu đã xảy ra:
    $ vec(v)_("Vua") - vec(v)_("Đàn ông") + vec(v)_("Phụ nữ") approx vec(v)_("Hoàng hậu") $
    Máy tính nhận ra rằng mối quan hệ giữa Vua và Hoàng hậu giống hệt mối quan hệ giữa Đàn ông và Phụ nữ chỉ bằng các phép cộng trừ vectơ trong không gian nhiều chiều! Toàn bộ trí tuệ nhân tạo hiện đại đang vận hành trên nền móng vectơ mà các em đang học hôm nay!
]

---

== BÀI 9: TỔNG VÀ HIỆU VECTƠ — CƠ HỌC NEWTON & NGHỆ THUẬT HỢP LỰC

Nếu chỉ có những vectơ đứng riêng lẻ, chúng ta chỉ có những mũi tên vô tri. Nhưng khi *Cộng* và *Trừ* các vectơ lại với nhau bằng *Quy tắc ba điểm* và *Quy tắc hình bình hành*, chúng ta mở cánh cửa bước vào trái tim của Vật lý học cổ điển: *Định luật Chuyển động của Isaac Newton!*

#story-box(
  title: "Isaac Newton & Quy tắc hình bình hành lực trong Principia Mathematica",
  author: "Sir Isaac Newton (Anh, 1643 – 1727)",
)[
  Năm 1687, cuốn sách làm thay đổi vĩnh viễn tiến trình văn minh nhân loại ra đời: *“Philosophiae Naturalis Principia Mathematica”* (Các nguyên lý toán học của triết học tự nhiên) của Sir Isaac Newton. Trong tác phẩm này, Newton đã chính thức phát biểu Định luật II: Gia tốc của một vật tỉ lệ thuận với Hợp lực tác dụng lên nó:
  $ vec(F)_("hợp lực") = m vec(a) $
  
  Newton nhận ra rằng: Trong tự nhiên, một vật thể không bao giờ chịu tác dụng của một lực đơn độc. Một con tàu lướt trên mặt biển chịu lực đẩy của động cơ chân vịt hướng về phía trước ($vec(F)_1$), lực cản của sóng nước đẩy lùi về phía sau ($vec(F)_2$), và gió bão thổi dạt sang mạn phải ($vec(F)_3$). 
  
  Để biết con tàu sẽ lao về đâu, Newton đã dùng *Quy tắc hình bình hành lực*: Hợp lực của hai lực đồng quy $vec(F)_1$ và $vec(F)_2$ chính là đường chéo của hình bình hành tạo bởi hai lực đó! Bằng phép toán cộng vectơ đơn giản ấy, Newton đã giải thích được tại sao Mặt Trăng không bị rơi xuống Trái Đất, tại sao Trái Đất quay quanh Mặt Trời theo quỹ đạo elip, và dự đoán chính xác sự trở lại của Sao chổi Halley sau hàng chục năm!
]

#hook-box(title: "Tại sao Máy bay Boeing 300 tấn lại cất cánh NGƯỢC CHIỀU GIÓ BÃO?")[
  Thầy chiếu hình ảnh chiếc máy bay khổng lồ Boeing 777 nặng hơn 300 tấn đang gầm rú trên đường băng sân bay Nội Bài giữa cơn mưa bão:
  
  *“Khi các em đi xe máy hay đạp xe đạp, các em luôn muốn gió thổi xuôi từ sau lưng để đẩy mình đi nhẹ nhàng. Nhưng tại sao tất cả các cơ trưởng máy bay chở khách trên thế giới lại LUÔN LUÔN YÊU CẦU CẤT CÁNH VÀ HẠ CÁNH NGƯỢC CHIỀU GIÓ?*
  
  *Bí mật nằm ở VÉCTƠ VẬN TỐC TƯƠNG ĐỐI VÀ LỰC KHÍ ĐỘNG HỌC!*
  - Gọi vận tốc máy bay so với mặt đất là $vec(v)_("đất")$, vận tốc gió là $vec(v)_("gió")$.
  - Vận tốc của dòng khí lướt qua cánh máy bay là: $vec(v)_("khí") = vec(v)_("đất") - vec(v)_("gió")$.
  - Khi cất cánh ngược chiều gió, hai vectơ này ngược hướng nhau, nên độ lớn vận tốc khí bằng TỔNG HAI ĐỘ LỚN:
    $ v_("khí") = v_("đất") + v_("gió")! $
  
  *Vận tốc dòng khí qua cánh tăng vọt lên làm cho Lực nâng khí động học Bernoulli ($vec(F)_L$) vọt lên gấp đôi, nhấc bổng cỗ máy sắt thép 300 tấn bay vút lên bầu trời chỉ sau nửa chiều dài đường băng! Phép trừ vectơ lớp 10 chính là đôi cánh nâng đỡ hàng triệu chuyến bay an toàn mỗi ngày!”*
]

---

== BÀI 10: TÍCH CỦA MỘT SỐ VỚI VECTƠ & TÂM TỈ CỰ MÖBIUS

Khi nhân một số thực $k$ với một vectơ $vec(a)$, ta thực hiện hai phép biến hình cơ bản của vũ trụ:
- Phép co giãn độ lớn: Độ dài mới bằng $|k| |vec(a)|$.
- Phép đảo ngược thời gian/phương hướng: Nếu $k > 0$ giữ nguyên hướng; nếu $k < 0$ quay ngoắt $180 degree$ đổi ngược hướng!

Và đỉnh cao của phép nhân số với vectơ chính là *Khái niệm Tâm Tỉ Cự (Barycenter)*.

#story-box(
  title: "August Ferdinand Möbius & Kiệt tác Tọa độ Tỉ cự năm 1827",
  author: "August Ferdinand Möbius (Đức, 1790 – 1868)",
)[
  August Ferdinand Möbius — học trò xuất sắc của Carl Friedrich Gauss, người nổi tiếng với Dải băng một mặt Möbius — đã xuất bản cuốn sách chấn động *“Der Barycentrische Calcul”* (Giải tích Tâm tỉ cự) vào năm 1827.
  
  Möbius tự hỏi: Nếu tại 3 đỉnh của một tam giác $A, B, C$, ta đặt 3 quả cân có khối lượng lần lượt là $m_A, m_B, m_C$. Trọng tâm cân bằng tuyệt đối của hệ 3 quả cân đó nằm ở đâu?
  
  Bằng ngôn ngữ vectơ, Möbius đã đưa ra phương trình bất hủ:
  $ m_A vec(I A) + m_B vec(I B) + m_C vec(I C) = vec(0) $
  Điểm $I$ duy nhất thỏa mãn phương trình trên được gọi là *Tâm tỉ cự của hệ chất điểm*!
  
  Khi $m_A = m_B = m_C = 1$, điểm $I$ trùng với Trọng tâm tam giác $G$: $vec(G A) + vec(G B) + vec(G C) = vec(0)$. Bằng cách thay đổi các trọng số khối lượng, điểm $I$ có thể quét qua mọi điểm trong và ngoài tam giác! Tọa độ tỉ cự của Möbius ngày nay là thuật toán nền tảng trong Unreal Engine 5 để xác định màu sắc và độ phản xạ ánh sáng tại từng điểm trên bề mặt nhân vật game 3D!
]

#hook-box(title: "Nghệ sĩ xiếc & Chiếc mâm thăng bằng trên đầu gậy nhọn")[
  Thầy cầm một cây bút bi dựng đứng trên đầu ngón tay, đặt một chiếc thước kẻ thăng bằng lên trên:
  
  *“Khi các em xem biểu diễn xiếc, nghệ sĩ xiếc cầm một chiếc gậy dài dựng đứng và đặt chiếc mâm tròn trên đầu gậy nhọn. Trên chiếc mâm đó đặt một con gà luộc, một chai sâm panh và một đĩa hoa quả nặng nhẹ khác nhau. Làm sao nghệ sĩ biết đặt đầu gậy nhọn vào ĐÚNG MỘT ĐIỂM DUY NHẤT để chiếc mâm đứng im thăng bằng mà không bị nghiêng đổ vỡ nát?*
  
  *Điểm đó chính là TÂM TỈ CỰ $I$!*
  *Tại điểm $I$, tổng các mô-men lực quay bị triệt tiêu hoàn toàn theo đúng phương trình vectơ lớp 10:*
  $ m_1 vec(I A) + m_2 vec(I B) + m_3 vec(I C) = vec(0)! $
  *Nếu lệch khỏi điểm $I$ dù chỉ 1 milimet, hợp lực vectơ sẽ sinh ra mô-men quay làm mọi thứ rơi tan tành! Nghệ sĩ xiếc tài hoa thực chất là một nhà toán học bản năng đang điều khiển tâm tỉ cự bằng đôi tay điêu luyện!”*
]

---

== BÀI 11: TÍCH VÔ HƯỚNG CỦA HAI VECTƠ — BẢN HỢP ÂM CỦA GÓC VÀ ĐỘ DÀI

Trong mọi phép toán của phổ thông, phép *Tích Vô Hướng (Dot Product)*:
$ vec(a) dot vec(b) = |vec(a)| |vec(b)| cos(vec(a), vec(b)) $
là phép toán kỳ lạ và đặc biệt nhất: *Nhân hai vectơ (đại lượng có hướng) nhưng kết quả thu được lại là MỘT CON SỐ THỰC (đại lượng vô hướng)!*

Tại sao lại như vậy? Bởi vì Tích vô hướng không phải là một phép nhân số học thông thường. Nó là một chiếc máy đo: *Đo mức độ hòa hợp và đồng điệu giữa hai hướng trong không gian!*
- Nếu hai vectơ cùng hướng ($theta = 0 degree$, $cos 0 degree = 1$): Tích vô hướng đạt cực đại (cùng chung lý tưởng, hỗ trợ nhau tối đa).
- Nếu hai vectơ ngược hướng ($theta = 180 degree$, $cos 180 degree = -1$): Tích vô hướng đạt cực tiểu âm (chống đối nhau triệt để).
- Nếu hai vectơ VUÔNG GÓC ($theta = 90 degree$, $cos 90 degree = 0$): Tích vô hướng bằng 0 (hoàn toàn độc lập, không dính líu gì tới nhau!).

#story-box(
  title: "Josiah Willard Gibbs & Oliver Heaviside: Khai sinh Tích Vô Hướng Hiện Đại",
  author: "J. W. Gibbs (Mỹ, 1839 – 1903) & Oliver Heaviside (Anh, 1850 – 1925)",
)[
  Sau khi Hamilton phát minh ra Quaternion, môn toán 4 chiều này trở nên quá đồ sộ và phức tạp đối với các kỹ sư và nhà vật lý. Khi viết phương trình điện từ học, James Clerk Maxwell phải viết tới 20 phương trình đại số rối rắm chiếm cả trang giấy!
  
  Vào những năm 1880, nhà vật lý người Mỹ *Josiah Willard Gibbs* tại Đại học Yale và kỹ sư tự học lập dị người Anh *Oliver Heaviside* đã độc lập thực hiện một cuộc phẫu thuật táo bạo: Họ cắt bỏ phần phức tạp của Quaternion, chỉ giữ lại phần không gian 3 chiều và định nghĩa hai phép toán mới: *Tích vô hướng (Dot Product)* cho ra một số, và *Tích có hướng (Cross Product)* cho ra một vectơ mới.
  
  Nhờ phát minh của Gibbs và Heaviside, 20 phương trình điện từ của Maxwell đã được rút gọn lại còn đúng *4 PHƯƠNG TRÌNH VECTƠ TUYỆT MỸ*, đẹp đến mức nhà vật lý Ludwig Boltzmann đã thốt lên: *“Có phải Thượng đế đã viết nên những phương trình này?”*! Toàn bộ lý thuyết sóng vô tuyến, điện lưới quốc gia và điện thoại di động ngày nay đều vận hành trên hệ thống vectơ của Gibbs và Heaviside!
]

#misconception-box(
  title: "Cạm bẫy 'Chia hai Vectơ' — Sai lầm Nghiêm trọng Phổ biến Nhất",
  misconception: "Có phép nhân vô hướng $vec(a) dot vec(b) = k$, vậy chắc chắn phải có phép chia hai vectơ: $vec(a) = k / vec(b)$!",
  correction: "Trong Toán học, TUYỆT ĐỐI KHÔNG BAO GIỜ CÓ PHÉP CHIA HAI VECTƠ! Biểu thức $vec(a) / vec(b)$ là hoàn toàn vô nghĩa và bị cấm chỉ!"
)[
  *Bản chất đại số sâu sắc:*
  Giả sử có phép chia: Cho số thực $k$ và vectơ $vec(b)$, tìm vectơ $vec(x)$ sao cho $vec(x) dot vec(b) = k$.
  - Phương trình này có VÔ SỐ NGHIỆM! Bất kỳ vectơ nào có hình chiếu lên $vec(b)$ bằng $k / |vec(b)|$ đều thỏa mãn. Ta có thể cộng thêm vào $vec(x)$ bất kỳ một vectơ nào VUÔNG GÓC với $vec(b)$ mà tích vô hướng vẫn không đổi (vì tích vô hướng với vectơ vuông góc bằng 0)!
  - Vì nghiệm không duy nhất, phép toán nghịch đảo (phép chia) KHÔNG THỂ XÁC ĐỊNH ĐƯỢC!
  
  Khắc ghi điều này giúp học sinh không bao giờ viết những biểu thức toán học sai ngớ ngẩn trong các bài toán tích vô hướng.
]

#dialogue-box(title: "Đối thoại Socrates: Chứng minh Pythagoras bằng Bình phương Vô hướng")[
  *Socrates:* Này Theaetetus, trong tam giác $A B C$, vectơ cạnh huyền $vec(B C)$ liên hệ như thế nào với hai vectơ cạnh góc vuông $vec(A B)$ và $vec(A C)$?
  
  *Học trò:* Thưa thầy, theo quy tắc hiệu ba điểm: $vec(B C) = vec(A C) - vec(A B)$.
  
  *Socrates:* Hay lắm! Bây giờ hãy lấy bình phương vô hướng của cả hai vế:
  $ vec(B C)^2 = (vec(A C) - vec(A B))^2 $
  Khai triển hằng đẳng thức đáng nhớ ở vế phải cho ta điều gì?
  
  *Học trò:* Dạ, $vec(B C)^2 = vec(A C)^2 + vec(A B)^2 - 2 vec(A C) dot vec(A B)$!
  
  *Socrates:* Bình phương vô hướng của một vectơ bằng gì so với độ dài của nó?
  
  *Học trò:* Dạ bằng bình phương độ dài: $vec(B C)^2 = B C^2$, $vec(A C)^2 = A C^2$, $vec(A B)^2 = A B^2$!
  
  *Socrates:* Vậy nếu tam giác $A B C$ vuông tại $A$, số hạng $- 2 vec(A C) dot vec(A B)$ sẽ bằng bao nhiêu?
  
  *Học trò:* ÔI TRỜI ƠI! Vì $A C$ vuông góc với $A B$, tích vô hướng $vec(A C) dot vec(A B) = 0$! Số hạng đó BIẾN MẤT HOÀN TOÀN!
  Và ta thu được ngay lập tức:
  $ B C^2 = A C^2 + A B^2! $
  
  *Socrates:* Đúng thế! Người Hy Lạp cổ đại phải mất hàng chục dòng kẻ hình phụ phức tạp mới chứng minh được Định lý Pythagoras. Còn với ngôn ngữ đại số vectơ lớp 10, Pythagoras chỉ là một hệ quả hiển nhiên sau đúng 2 dòng biến đổi hằng đẳng thức! Đó chính là sức mạnh vô địch của toán học hiện đại!
]

#deep-dive-box(title: "Bất đẳng thức Cauchy - Schwarz từ Góc nhìn Tích Vô Hướng")[
  Cho hai vectơ bất kỳ $vec(u), vec(v)$ trong mặt phẳng với tọa độ $vec(u) = (x_1; y_1)$ và $vec(v) = (x_2; y_2)$.
  Theo định nghĩa tích vô hướng:
  $ vec(u) dot vec(v) = |vec(u)| |vec(v)| cos theta $
  Vì giá trị $|cos theta| <= 1$ với mọi góc $theta$, ta có ngay bất đẳng thức bất hủ:
  $ |vec(u) dot vec(v)| <= |vec(u)| |vec(v)| $
  Bình phương hai vế và thay tọa độ vào:
  $ (x_1 x_2 + y_1 y_2)^2 <= (x_1^2 + y_1^2)(x_2^2 + y_2^2) $
  Đó chính là *Bất đẳng thức Cauchy - Schwarz* huyền thoại! Một bất đẳng thức đại số phức tạp đã trở nên hiển nhiên tuyệt đối chỉ nhờ tính chất bị chặn của hàm cosin trong tích vô hướng!
]

#inquiry-box(title: "Nhiệm vụ Python: Tính Cosine Similarity Đo Ngữ Nghĩa Văn Bản AI")[
  ```python
  import numpy as np

  def cosine_similarity(u, v):
      return np.dot(u, v) / (np.linalg.norm(u) * np.linalg.norm(v))

  # Giả sử 3 câu văn được AI mã hóa thành 3 vectơ trong không gian đặc trưng:
  # Câu 1: "Thầy giáo giảng bài môn Toán"
  v1 = np.array([0.8, 0.9, 0.1, 0.0])
  # Câu 2: "Học sinh nghe giảng bài hình học"
  v2 = np.array([0.75, 0.85, 0.2, 0.05])
  # Câu 3: "Hôm nay trời mưa to sấm chớp"
  v3 = np.array([0.05, 0.1, 0.8, 0.9])

  sim_1_2 = cosine_similarity(v1, v2)
  sim_1_3 = cosine_similarity(v1, v3)

  print(f"Độ tương đồng ngữ nghĩa giữa Câu 1 và Câu 2: {sim_1_2:.4f} (Rất gần gũi!)")
  print(f"Độ tương đồng ngữ nghĩa giữa Câu 1 và Câu 3: {sim_1_3:.4f} (Rất xa nhau!)")
  ```
  ChatGPT nhận biết các câu hỏi tương tự nhau của học sinh hoàn toàn dựa trên phép tính Cosine tích vô hướng lớp 10 này!
]

#v(1em)

== CHUYÊN KHẢO MỞ RỘNG: HỆ TỌA ĐỘ KHỐI TÂM (BARYCENTRIC COORDINATES) & ĐỒ HỌA 3D UNREAL ENGINE

#story-box(
  title: "August Ferdinand Möbius 1827: Khai Sinh Hình Học Khối Tâm Cân Bằng",
  author: "August Ferdinand Möbius (Đức, 1790 – 1868)",
)[
  Hầu hết mọi người chỉ biết đến Möbius qua "Dải băng Möbius" một mặt kỳ lạ. Nhưng kiệt tác toán học vĩ đại nhất của ông, cuốn sách *“Der barycentrische Calcul”* (Giải tích Khối tâm, xuất bản năm 1827), mới là nền tảng thực sự của đồ họa máy tính hiện đại!
  
  Möbius đặt câu hỏi: *“Nếu ta đặt 3 quả cân có khối lượng $alpha, beta, gamma$ tại 3 đỉnh của tam giác $A B C$, trọng tâm $P$ của hệ chất điểm này sẽ nằm ở đâu?”*
  
  Theo định luật đòn bẩy Archimedes, điểm $P$ thỏa mãn phương trình tâm tỉ cự:
  $ alpha vec(P A) + beta vec(P B) + gamma vec(P C) = vec(0) $
  Chuẩn hóa tổng khối lượng $alpha + beta + gamma = 1$, ta có biểu diễn duy nhất của vectơ vị trí điểm $P$ theo 3 đỉnh tam giác:
  $ vec(O P) = alpha vec(O A) + beta vec(O B) + gamma vec(O C) $
  Bộ ba số thực $(alpha, beta, gamma)$ được gọi là *Tọa độ tỉ cự (Barycentric Coordinates)* của điểm $P$.
  
  *Ý nghĩa hình học tuyệt mỹ:*
  - Tọa độ $alpha, beta, gamma$ tỉ lệ thuận với diện tích 3 tam giác con đối diện:
    $ alpha = S_(P B C) / S_(A B C), quad beta = S_(P C A) / S_(A B C), quad gamma = S_(P A B) / S_(A B C) $
  - Điểm $P$ *nằm trọn bên trong tam giác* khi và chỉ khi: $alpha >= 0, beta >= 0, gamma >= 0$ và $alpha + beta + gamma = 1$!
]

#tech-box(title: "Công Nghệ Nhận Diện Khuôn Mặt FaceID & Tích Vô Hướng Vectơ Đa Chiều")[
  Khi các em cầm chiếc iPhone lên, cụm cảm biến TrueDepth chiếu hơn $30.000$ điểm hồng ngoại vô hình lên khuôn mặt, đo đạc độ lồi lõm của sống mũi, hốc mắt, gò má.
  
  *Mã hóa khuôn mặt thành Vectơ số:*
  Mạng nơ-ron học sâu (Deep Learning) nén toàn bộ $30.000$ điểm tọa độ không gian thành một *Vectơ đặc trưng khuôn mặt (Face Embedding Vector)* $vec(u)$ gồm $512$ chiều trong không gian số thực $RR^(512)$.
  
  *Xác thực mở khóa trong 0,1 giây:*
  Khi người dùng giơ máy lên, camera chụp quét tạo thành vectơ $vec(v)$. Bộ vi xử lý Apple Neural Engine lập tức tính tích vô hướng chuẩn hóa (Cosine Similarity):
  $ "Similarity" = (vec(u) dot vec(v)) / (|vec(u)| |vec(v)|) = (sum_(i=1)^(512) u_i v_i) / (sqrt(sum u_i^2) sqrt(sum v_i^2)) $
  - Nếu kết quả $> 0,92$: Khuôn mặt khớp hoàn hảo, điện thoại mở khóa tức thì!
  - Dù các em đeo kính râm, thay đổi kiểu tóc hay già đi theo năm tháng, góc giữa hai vectơ vẫn duy trì độ tương đồng vượt ngưỡng! Tích vô hướng lớp 10 chính là chiếc chìa khóa sinh trắc học tối mật bảo vệ dữ liệu cá nhân của hàng tỷ người!
]

#misconception-box(
  title: "Cạm Bẫy 'Chia Cho Vectơ' & Tính Bất Khả Nghịch Của Phép Nhân Vô Hướng",
  misconception: "Nhiều học sinh quen với đại số số thực (a · x = b => x = b / a) nên khi thấy đẳng thức vectơ a · x = k, các em hồn nhiên suy luận: 'Vectơ x = k / a' hoặc 'Vectơ x = b / a'.",
  correction: "TRÊN ĐỜI TUYỆT ĐỐI KHÔNG TỒN TẠI PHÉP CHIA CHO MỘT VECTƠ! Phép nhân vô hướng hai vectơ cho ra một SỐ THỰC (Scalar), không bảo toàn thông tin về hướng. Nếu a · x = k, có VÔ SỐ VECTƠ x thỏa mãn (mọi vectơ có điểm mút nằm trên đường thẳng vuông góc với a tại hình chiếu). Do đó, phép nhân vô hướng không có phần tử nghịch đảo!",
  remedy: "Ghi nhớ sắt đá: Chỉ có 'Tích vô hướng' (nhân ra số), 'Tích vectơ với một số' (co giãn độ dài), TUYỆT ĐỐI KHÔNG BAO GIỜ đặt một vectơ dưới mẫu số của một phân số!"
)

#pagebreak()
'''
