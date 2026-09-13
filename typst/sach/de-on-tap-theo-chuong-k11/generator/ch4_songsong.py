# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG IV: TỪ MẶT PHẲNG VƯƠN RA VŨ TRỤ — ĐƯỜNG THẲNG & MẶT PHẲNG SONG SONG

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 11, Bài 12, Bài 13, Bài 14 SGK Toán 11 cùng Chuyên đề Bí mật quân sự môn Hình học Họa hình của Gaspard Monge và Phép phối cảnh thời Phục hưng.
]

== BÀI 11: ĐIỂM, ĐƯỜNG THẲNG, MẶT PHẲNG & HAI ĐƯỜNG THẲNG CHÉO NHAU

Suốt 10 năm học trò trước đó, toàn bộ thế giới hình học của học sinh chỉ bị giam cầm trong chiếc lồng 2 chiều của tờ giấy tập phẳng lì! Các em quen với việc: Hai đường thẳng hoặc cắt nhau, hoặc song song, không còn trường hợp nào khác!

Nhưng vũ trụ thực tại mà chúng ta sống, hít thở và vận động là *KHÔNG GIAN 3 CHIỀU*! Bước chân vào Hình học Không gian lớp 11 là một *bước nhảy vọt về mặt tiến hóa nhận thức*: Bộ não học sinh buộc phải tự bẻ gãy chiếc khung phẳng để xây dựng năng lực tư duy thị giác 3D — năng lực phân biệt một kỹ sư trưởng thiết kế tàu vũ trụ với một người vẽ tranh nghiệp dư!

#story-box(
  title: "Albrecht Dürer, Girard Desargues & Bí mật Phép phối cảnh thời Phục Hưng",
  author: "Girard Desargues (1591 – 1661) & Albrecht Dürer (1471 – 1528)",
)[
  Vào thời kỳ Trung Cổ, các bức tranh của các danh họa châu Âu trông vô cùng ngô nghê và phẳng lì: Người đứng đằng xa lại to bằng người đứng đằng trước, các ngôi nhà méo mó, các bức tường như dán chặt vào nhau. Các họa sĩ không tài nào nắm bắt được chiều sâu của thực tại!
  
  Cuộc cách mạng chỉ bùng nổ vào thế kỷ XV – XVI khi thiên tài người Đức *Albrecht Dürer* và kiến trúc sư người Ý *Filippo Brunelleschi* bắt đầu áp dụng toán học vào hội họa. Dürer thậm chí đã chế tạo ra một khung gỗ căng lưới dây chỉ, nhìn người mẫu qua một lỗ ngắm cố định để vẽ từng điểm lên giấy! Đó chính là phôi thai sơ khai của *Phép chiếu xuyên tâm và Phép chiếu song song*!
  
  Đến thế kỷ XVII, nhà toán học kiêm kiến trúc sư người Pháp *Girard Desargues* đã chính thức nâng tầm hội họa thành một môn toán học đỉnh cao: *Hình học Xạ ảnh (Projective Geometry)*. Định lý Desargues bất hủ về hai tam giác thấu xạ ra đời, chỉ ra rằng:
  *Trong không gian 3 chiều, các đường thẳng song song thực chất là các đường thẳng cắt nhau tại một điểm ở vô tận (Điểm tụ - Vanishing Point)!*
  
  Nhờ Desargues và Dürer, nhân loại lần đầu tiên hiểu được cách mà mắt người nhìn thấy thế giới: Mọi cảnh vật 3D vĩ đại ngoài kia đều được "chiếu" lên võng mạc phẳng 2D của chúng ta! Học hình học không gian 11 chính là học cách bộ não giải mã chiều sâu của vũ trụ!
]

#hook-box(title: "Hai đường thẳng không cắt nhau mà cũng KHÔNG song song?")[
  Thầy cầm hai cây bút dạ trên tay. Thầy giơ một cây bút nằm ngang trên mặt bàn, cây bút còn lại giơ thẳng đứng lơ lửng trên không trung.
  
  Thầy hỏi cả lớp:
  *“Các em nhìn xem, hai cây bút này có cắt nhau không?”*
  Học sinh: *"Dạ không! Một cây ở dưới bàn, một cây ở trên cao, làm sao chạm vào nhau được ạ!"*
  
  Thầy: *“Vậy chúng có song song với nhau không?”*
  Học sinh: *"Dạ không song song, hướng của chúng vuông góc nhau mà thầy!"*
  
  Thầy: *“Vậy tại sao suốt từ lớp 1 đến lớp 10, các em được dạy rằng: 'Hai đường thẳng phân biệt không cắt nhau thì ắt phải song song'? Chẳng lẽ các thầy cô cấp 1, cấp 2 đã lừa dối các em?”*
  
  Cả lớp ồ lên ngạc nhiên, bắt đầu bối rối nhìn nhau.
  
  Thầy mỉm cười giải thích:
  *“Không, các thầy cô không hề lừa dối các em! Chỉ là suốt 10 năm qua, các em bị nhốt trong một 'thế giới phẳng' 2D của một tờ giấy! Trong mặt phẳng, hai đường thẳng không cắt nhau thì chắc chắn song song.*
  
  *Nhưng hôm nay, thầy chính thức mở toang cánh cửa đưa các em bước vào Không gian 3 chiều! Ở đây, hai đường thẳng có thể chẳng liên quan gì đến nhau, mỗi đứa nằm ở một tầng trời, không chung một mặt phẳng — người ta gọi đó là HAI ĐƯỜNG THẲNG CHÉO NHAU!*
  
  *Hãy nhìn lên trần nhà: Cạnh tường trên trần chạy dọc từ Bắc sang Nam, còn cạnh tường dưới sàn chạy ngang từ Đông sang Tây. Dù các em kéo dài chúng đến tận chân trời góc biển, chúng cũng không bao giờ gặp nhau, nhưng cũng không cùng chung một hướng đi! Đó chính là vẻ đẹp tự do của Không gian 3 chiều!”*
]

#tech-box(title: "Thuật toán Phép Chiếu 3D (Projection Matrix) trong Game 3D & Kính VR")[
  Mỗi khi các em chơi các tựa game 3D thế giới mở như Genshin Impact, Call of Duty hay đeo kính thực tế ảo Apple Vision Pro, đã bao giờ các em tự hỏi: *Làm thế nào một chiếc màn hình phẳng lì 2D lại có thể hiển thị một thế giới 3D sâu thẳm, chân thực đến nghẹt thở?*
  
  Bí mật nằm ở *Phép chiếu phối cảnh (Perspective Projection)* và *Phép chiếu song song (Orthographic Projection)* mà các em học trong Bài 14!
  
  Trong đồ họa máy tính (OpenGL, DirectX, Metal), mỗi vật thể trong game được định nghĩa bởi tọa độ $(x, y, z)$. Để hiển thị lên màn hình điện thoại $(x', y')$, GPU máy tính phải nhân vector tọa độ đó với một *Ma trận Phép chiếu (Projection Matrix)*:
  $ p' = bold(M)_(p r o j) times p $
  
  - Trong game xây dựng chiến thuật (như SimCity, Age of Empires, Clash of Clans), người ta dùng *Phép chiếu song song* để các tòa nhà ở xa không bị nhỏ lại, giúp người chơi dễ đo đạc khoảng cách chính xác!
  - Trong game góc nhìn thứ nhất (FPS), người ta dùng *Phép chiếu xuyên tâm* để mô phỏng chính xác mắt người: Vật càng ở xa càng thu nhỏ dần về điểm tụ!
  
  Nếu không hiểu định lý hình học không gian lớp 11, một kỹ sư đồ họa máy tính sẽ không bao giờ biết cách viết code để camera trong game di chuyển mượt mà mà không làm méo hình!
]

== BÀI 12 & 13: ĐƯỜNG THẲNG & MẶT PHẲNG SONG SONG — TỪ TẦNG NHÀ ĐẾN THIẾT KẾ KHÔNG GIAN

Làm thế nào để hai mặt phẳng không bao giờ đụng độ nhau? Tại sao người ta lại xây các tầng nhà cao ốc chọc trời song song với nhau?

Để kiểm tra hai đường thẳng song song trong mặt phẳng, ta có thể dùng góc so le trong hoặc tính chất vuông góc. Nhưng trong không gian, làm sao biết hai mặt phẳng có thực sự song song hay chúng sẽ giao nhau ở một nơi nào đó cách xa 10 cây số?

*Định lý chìa khóa:* Muốn chứng minh một mặt phẳng song song với một mặt phẳng khác, ta chỉ cần tìm trong mặt phẳng này hai đường thẳng cắt nhau cùng song song với mặt phẳng kia! Đây là một chiến lược tư duy kinh điển: *Quy cái vô hạn (cả một mặt phẳng bao la) về cái hữu hạn (chỉ 2 đường thẳng cắt nhau)!*

#story-box(
  title: "Gaspard Monge & Bí mật quân sự Hình học Họa hình cứu nguy nước Pháp thời Napoleon",
  author: "Gaspard Monge (1746 – 1818), Viện sĩ Viện Hàn lâm Pháp",
)[
  Năm 1768, một chàng trai trẻ 22 tuổi nghèo khó tên là *Gaspard Monge* được giao nhiệm vụ thiết kế một pháo đài phòng thủ tại Mézières. Vào thời đó, để tính toán các góc đắp lũy, hướng công sự và tầm bắn pháo tránh các điểm chết đạn pháo bắn thẳng, các kỹ sư quân sự Pháp phải thực hiện hàng tháng trời những phép tính lượng giác dài dằng dặc, cực kỳ mệt mỏi và dễ sai sót.
  
  Chàng trai trẻ Monge đã làm một điều điên rồ: Chàng không thèm tính toán bằng số! Chàng phát minh ra một phương pháp biểu diễn hình học không gian 3 chiều lên hai mặt phẳng chiếu vuông góc (Mặt phẳng đứng và Mặt phẳng nằm — tức hình chiếu đứng và hình chiếu bằng). 
  
  Chỉ bằng vài nhát compa và thước kẻ vẽ các đường dóng song song, Monge đã giải quyết xong toàn bộ bài toán pháo đài phức tạp chỉ trong vòng MỘT NGÀY!
  
  Ban chỉ huy quân đội Pháp bàng hoàng kinh ngạc. Họ không tin nổi một bài toán mất cả tháng lại có thể giải xong bằng hình vẽ chỉ trong vài tiếng! Họ kiểm tra thực địa và nhận thấy kết quả của Monge chính xác đến từng milimét!
  
  Ngay lập tức, Bộ Quốc phòng Pháp ra sắc lệnh: *Toàn bộ phương pháp Hình học Họa hình (Descriptive Geometry) của Gaspard Monge bị coi là BÍ MẬT QUÂN SỰ TỐI MẬT CỦA QUỐC GIA!* Monge bị cấm không được công bố hay tiết lộ cho bất kỳ ai ngoài các sĩ quan công binh cấp cao! Nhờ bí mật này, quân đội của Napoléon Bonaparte sau đó đã có được khả năng thiết kế công sự, súng đại bác và pháo hạm vượt trội hơn toàn bộ châu Âu! Mãi đến năm 1795, sau Cách mạng Pháp, bí mật này mới được giải mật và đưa vào giảng dạy đại chúng tại Trường Bách khoa Paris (École Polytechnique).
]

#hook-box(title: "Chiếc bàn 3 chân và 4 chân: Tại sao bàn quán cà phê luôn bập bênh?")[
  Thầy bước vào lớp, chỉ tay vào chiếc bàn học 4 chân:
  *“Các em có để ý thấy: Trong các quán cà phê vỉa hè hay quán ăn, những chiếc bàn 4 chân rất hay bị bập bênh không? Ta thường phải lấy một mẩu giấy gấp lại kê dưới chân bàn thì nó mới đứng yên được.*
  
  *Thế nhưng, các em có bao giờ thấy một chiếc kiềng 3 chân hay chiếc giá đỡ máy ảnh 3 chân bị bập bênh bao giờ chưa?”*
  
  Học sinh trầm trồ: *"Ơ đúng thật thầy ạ! Chân máy ảnh lúc nào cũng chỉ có 3 chân chứ không bao giờ có 4 chân!"*
  
  Thầy giải thích:
  *“Đó chính là Tiên đề 1 của Hình học không gian: QUA 3 ĐIỂM KHÔNG THẲNG HÀNG, LUÔN XÁC ĐỊNH ĐƯỢC MỘT VÀ CHỈ MỘT MẶT PHẲNG DUY NHẤT!*
  
  - 3 đầu mút chân bàn luôn luôn nằm gọn trong một mặt phẳng duy nhất, dù mặt đất có gồ ghề nghiêng ngả cỡ nào đi chăng nữa! Vì vậy chiếc kiềng 3 chân VĨNH VIỄN KHÔNG BAO GIỜ BẬP BÊNH!
  - Nhưng với 4 chân bàn, 4 điểm trong không gian chưa chắc đã đồng phẳng! Chỉ cần một chân bàn bị lệch 1 milimét, nó sẽ không thuộc vào mặt phẳng tạo bởi 3 chân còn lại, và chiếc bàn lập tức trở thành một con lật đật lắc lư!
  
  *Toán học không phải là những hình vẽ chết trên giấy — Toán học quyết định sự thăng bằng của cả thế giới vật chất quanh ta!”*
]

#tech-box(title: "Công nghệ In 3D (Slicing) & Bản vẽ CAD/CAM trong Công nghiệp Chế tạo")[
  Làm thế nào một chiếc máy in 3D có thể tạo ra một bức tượng rồng uốn lượn tinh xảo hay một chi tiết động cơ phản lực bằng titan nguyên khối từ một cuộn dây nhựa hoặc bột kim loại?
  
  Bản chất công nghệ in 3D (Additive Manufacturing) chính là ứng dụng tuyệt đối của *Các mặt phẳng song song cắt một khối hình*:
  1. Trong phần mềm đồ họa (như Blender, SolidWorks, AutoCAD), mô hình vật thể là một khối 3D liên tục.
  2. Phần mềm cắt lớp (Slicer - như Cura, PrusaSlicer) sẽ dùng hàng nghìn *mặt phẳng song song cách đều nhau* (mỗi lát cắt chỉ dày từ $0,05$ mm đến $0,2$ mm) để cắt xuyên qua mô hình 3D!
  3. Giao tuyến của mỗi mặt phẳng song song với khối 3D chính là một *hình phẳng 2D*.
  4. Đầu phun máy in 3D chỉ việc di chuyển trong mặt phẳng 2D đó để đùn nhựa. Sau khi in xong một lớp, bàn in hạ xuống một khoảng đúng bằng khoảng cách giữa 2 mặt phẳng song song, và tiếp tục in lớp tiếp theo!
  
  Nếu không có lý thuyết về các mặt phẳng song song và thiết diện cắt hình không gian của lớp 11, toàn bộ cuộc cách mạng In 3D của nhân loại ngày nay sẽ hoàn toàn sụp đổ!
]

#misconception-box(title: "Những Ảo giác Chết người khi chuyển từ Mặt phẳng sang Không gian")[
  1. *Cái bẫy 'Cùng vuông góc thì song song':*
  Trong hình học phẳng lớp 7, định lý kinh điển khẳng định: "Hai đường thẳng phân biệt cùng vuông góc với đường thẳng thứ ba thì song song với nhau ($a perp c, b perp c arrow a parallel b$)".
  Rất nhiều học sinh mang nguyên vẹn định lý này áp dụng vào hình học không gian 11!
  - *Phản chứng sư phạm:* Hãy chỉ vào góc phòng học: Mép sàn trục $O x$ vuông góc với mép tường thẳng đứng $O z$. Mép sàn trục $O y$ cũng vuông góc với $O z$. Nhưng rõ ràng hai trục $O x$ và $O y$ KHÔNG HỀ SONG SONG, mà chúng VUÔNG GÓC VỚI NHAU tại gốc $O$!
  
  2. *Cái bẫy 'Nhìn thấy cắt nhau trên hình vẽ':*
  Khi vẽ hình chóp $S.A B C D$ lên vở phẳng, hai đoạn thẳng chéo nhau (ví dụ $S A$ và $B D$) giao nhau tại một điểm trên trang giấy. Hàng loạt học sinh ngộ nhận điểm giao nhau đó là giao điểm thực tế trong không gian!
  - *Chiến lược sư phạm:* Luôn rèn cho học sinh thói quen đặt câu hỏi: "Hai đường thẳng này có cùng nằm trong một mặt phẳng nào không?". Nếu không có mặt phẳng chung, giao điểm trên hình vẽ chỉ là một "bóng ma thị giác" do phép chiếu 2D tạo ra!
]

#dialogue-box(title: "Định lý Giao tuyến Song song: Bí mật của Mái nhà Thái")[
  *Thầy:* “Các em hãy nhìn lên mái nhà hình chữ A (mái nhà kiểu Thái) ngoài phố:\
  - Hai mái ngói nghiêng tạo thành hai mặt phẳng $(P)$ và $(Q)$. Giao tuyến của chúng là chiếc đòn tay nóc nhà chạy dài ở trên đỉnh.\
  - Mép dưới của mái ngói bên trái song song với mép dưới của mái ngói bên phải.\
  - Thầy hỏi: Đòn tay nóc nhà có song song với hai mép dưới của mái ngói không?”\
  *Học sinh:* “Dạ chắc chắn song song thầy ạ, nhìn bằng mắt thấy chúng thẳng tắp song song nhau!”\
  *Thầy:* “Nhưng định lý hình học nào bảo đảm điều đó, hay chỉ là do bác thợ xây khéo tay?”\
  *Học sinh:* “Dạ định lý Giao tuyến song song ạ!”\
  *Thầy:* “Đúng! Định lý phát biểu: Nếu hai mặt phẳng lần lượt chứa hai đường thẳng song song, thì giao tuyến của chúng (nếu có) sẽ SONG SONG VỚI HAI ĐƯỜNG THẲNG ĐÓ! Nhờ định lý này, người thợ xây chỉ cần căn chỉnh mép móng nhà song song, là chiếc đòn dông trên nóc nhà sẽ tự động song song thăng bằng mà không cần phải trèo lên cao căng dây đo đạc mạo hiểm!”
]

#deep-dive-box(title: "Hình học Xạ ảnh (Projective Geometry) & Điểm tụ ở Vô tận")[
  Đối với giáo viên dạy Toán, Hình học không gian lớp 11 là cánh cửa dẫn vào *Hình học Xạ ảnh* — một trong những phân nhánh toán học đẹp nhất thế kỷ XIX do Jean-Victor Poncelet phát triển.
  
  Trong hình học Euclid cổ điển, tiên đề V khẳng định hai đường thẳng song song không bao giờ cắt nhau. Nhưng trong Hình học Xạ ảnh:
  - Người ta bổ sung vào mặt phẳng những *Điểm ở Vô tận (Ideal Points)*.
  - Mọi chùm đường thẳng song song đều CẮT NHAU TẠI MỘT ĐIỂM Ở VÔ TẬN!
  - Tập hợp tất cả các điểm ở vô tận tạo thành một *Đường thẳng ở Vô tận*.
  
  Khi các họa sĩ thời Phục hưng vẽ một con đường thẳng tắp chạy về phía chân trời, hai lề đường song song dần dần chụm lại tại một điểm duy nhất trên đường chân trời — đó chính là hình ảnh trực quan tuyệt mỹ của Điểm tụ ở vô tận! Hình học không gian 11 chính là nghệ thuật đại số hóa cách nhìn vũ trụ của đôi mắt con người!
]

#inquiry-box(title: "Nghệ Thuật Phối Cảnh Leonardo da Vinci & Thí Nghiệm GeoGebra 3D")[
  Dành cho các em học sinh yêu thích hội họa, kiến trúc và thiết kế đồ họa không gian:
  
  1. *Thí nghiệm thực địa: Tìm Điểm Tụ (Vanishing Point) của Hành lang Trường học:*
  - Hãy đứng ở đầu hành lang dài của trường học (hoặc một con phố thẳng tắp) và chụp một bức ảnh bằng điện thoại.
  - In bức ảnh ra giấy (hoặc mở trên máy tính) và dùng thước kẻ kéo dài:
    + Hai mép gạch chân tường hai bên hành lang.
    + Hai đường mép trần nhà hai bên hành lang.
    + Hai dãy tay vịn lan can hành lang.
  - *Hiện tượng kỳ diệu:* Dù ngoài đời thực 6 đường thẳng này hoàn toàn SONG SONG với nhau, nhưng trên bức ảnh 2D, TẤT CẢ CHÚNG ĐỀU ĐỒNG QUY TẠI ĐÚNG MỘT ĐIỂM DUY NHẤT nằm ngang tầm mắt của em! Đó chính là Điểm tụ mà Leonardo da Vinci đã áp dụng để vẽ nên kiệt tác bất hủ *"Bữa ăn tối cuối cùng"* (The Last Supper). Phép chiếu phối cảnh lớp 11 chính là cầu nối giữa Toán học và Đỉnh cao Mỹ thuật thế giới!
  
  2. *Thử thách Dựng hình 3D trên GeoGebra: Vạch trần 'Bóng ma thị giác':*
  - Tải và mở ứng dụng *GeoGebra 3D Calculator* (hoàn toàn miễn phí trên máy tính hoặc điện thoại).
  - Dựng 4 điểm $A, B, C, D$ tạo thành một khối tứ diện. Lấy điểm $M$ trên $A B$ và $N$ trên $C D$.
  - Khi nhìn từ một góc chiếu nhất định, đoạn $M N$ và đường cao $A H$ có vẻ như đang giao nhau và cắt nhau!
  - Hãy dùng chuột xoay khối không gian một góc $30^circle$: Các em sẽ giật mình nhận ra hai đoạn thẳng đó thực chất nằm cách xa nhau hàng dặm — chúng CHÉO NHAU hoàn toàn!
  - Thí nghiệm này sẽ rèn luyện cho các em một "trực giác không gian 3D" siêu phàm, không bao giờ bị các hình vẽ 2D đánh lừa trong các bài thi hình học!
  
  3. *Sách kinh điển gợi ý tìm đọc:*
  - *"Geometry and the Imagination"* (Hình học và Trí tưởng tượng) — Nhà toán học vĩ đại David Hilbert & Stephan Cohn-Vossen.
  - *"Perspective and Other Drawing Systems"* — Fred Dubery & John Willats.
]

#story-box(
  title: "Filippo Brunelleschi & Mái Vòm Duomo Florence: Kỳ Quan Hình Học Tự Chịu Lực Lớn Nhất Thế Giới",
  author: "Filippo Brunelleschi (Ý, 1377 – 1446), Kiến Trúc Sư Khai Sinh Thời Phục Hưng",
)[
  Năm 1418, hội đồng thành phố Florence nước Ý đối mặt với một cuộc khủng hoảng kiến trúc chưa từng có: Nhà thờ chính tòa Santa Maria del Fiore đã xây dựng gần xong, nhưng ở trung tâm là một khoảng trống khổng lồ đường kính lên tới $45$ mét không có mái che! Không một ai trên thế giới biết cách xây một mái vòm bằng gạch đá nặng $37.000$ tấn ở độ cao 55 mét mà không bị sụp đổ!
  
  Mọi thợ xây thời đó đều bó tay vì toàn bộ rừng cây của vùng Toscana cũng không đủ gỗ để làm giàn giáo đỡ bên dưới.
  
  Chàng kiến trúc sư kiêm thợ kim hoàn Filippo Brunelleschi đã bước ra nhận thử thách. Ông không dùng giàn giáo! Thay vào đó, ông sử dụng triệt để các định lý *Quan hệ song song và Mặt phẳng tiếp xúc trong không gian 3D*:
  - Ông thiết kế một *Mái vòm đôi* (gồm một vòm nhẹ bên trong và một vòm lớn bên ngoài song song với nhau).
  - Các hàng gạch được xếp theo mô hình *Xương cá (Spina di Pesce)*: Các viên gạch dọc đóng vai trò như những chiếc nêm khóa chặt các viên gạch nằm ngang, phân tán toàn bộ lực ép trọng trường ra các mặt phẳng xung quanh!
  
  Mái vòm Duomo Florence sừng sững hơn 600 năm qua chính là minh chứng sống động nhất cho thấy: Khi tư duy hình học không gian song song của con người đạt tới đỉnh cao, chúng ta có thể dựng nên những kỳ quan thách thức cả trọng lực của Trái Đất!
]

#story-box(
  title: "Auguste Bravais & 14 Mạng Tinh Thể Không Gian Định Hình Ngành Bán Dẫn Toàn Cầu",
  author: "Auguste Bravais (Pháp, 1811 – 1863), Nhà Vật Lý & Tinh Thể Học",
)[
  Tại sao kim cương lại là chất cứng nhất trong tự nhiên, có thể cắt xuyên qua mọi khối đá; trong khi than chì của ruột bút chì lại mềm mại đến mức chỉ cần ấn nhẹ là bong ra từng lớp trên trang giấy — dù cả hai đều được cấu tạo $100\%$ từ các nguyên tử Carbon ($C$)?
  
  Bí mật nằm ở *Cấu trúc Mạng Tinh thể Không gian (Crystal Lattice)* do nhà vật lý người Pháp Auguste Bravais chứng minh vào năm 1848:
  - Than chì gồm các lớp nguyên tử liên kết bền chặt trong từng mặt phẳng 2D, nhưng các mặt phẳng này lại xếp *SONG SONG VỚI NHAU* và liên kết với nhau bằng lực van der Waals cực kỳ yếu ớt, khiến các mặt phẳng dễ dàng trượt lên nhau!
  - Kim cương thì liên kết thành một mạng tứ diện 3 chiều vững chắc tuyệt đối!
  
  Bravais đã dùng lý thuyết đối xứng và phép tịnh tiến song song trong không gian để chứng minh một định lý chấn động: Trong toàn bộ vũ trụ bao la, *CHỈ CÓ ĐÚNG 14 KIỂU MẠNG TINH THỂ KHÔNG GIAN (14 Bravais Lattices)* có thể tồn tại!
  
  Ngày nay, ngành công nghiệp bán dẫn nghìn tỷ USD của TSMC, Intel và Nvidia dựa hoàn toàn vào việc nuôi cấy các đơn tinh thể Silicon có mạng lập phương tâm mặt (FCC) hoàn hảo không tì vết để khắc hàng tỷ bóng bán dẫn lên bề mặt các mặt phẳng song song của tấm Wafer!
]

#story-box(
  title: "Máy Chụp Cắt Lớp CT Scanner & Biến Đổi Radon: Cứu Sống Hàng Triệu Bệnh Nhân Nhờ Mặt Phẳng Song Song",
  author: "Allan Cormack & Godfrey Hounsfield (Giải Nobel Y Học 1979) — Cuộc Cách Mạng Chẩn Đoán Hình Ảnh",
)[
  Trước thập niên 1970, y học thế giới chỉ có chụp X-quang truyền thống. Nhưng phim X-quang chỉ là một *hình chiếu phẳng 2D*: Mọi cơ quan nội tạng, xương sườn, phổi và tim bị đè chồng lên nhau thành một bóng đen mờ mịt. Một khối u nhỏ ẩn sau xương sườn hoàn toàn vô hình đối với bác sĩ!
  
  Năm 1972, kỹ sư điện Godfrey Hounsfield và nhà vật lý Allan Cormack đã tạo ra bước đột phá vĩ đại nhất lịch sử y học: *Máy chụp cắt lớp vi tính (Computed Tomography - CT Scanner)*.
  
  Nguyên lý toán học của CT Scanner dựa hoàn toàn vào *Các Mặt phẳng Song song trong Không gian 3D*:
  1. Bệnh nhân nằm trên bàn trượt, từ từ đi xuyên qua một vòng xoay phát tia X.
  2. Vòng xoay phát tia X quét quanh cơ thể theo một *mặt phẳng lát cắt vuông góc với trục cơ thể*. Máy tính thu được hàng trăm nghìn tia X chiếu xuyên qua mô.
  3. Bằng công thức toán học *Biến đổi Radon nghịch đảo (Inverse Radon Transform)* do nhà toán học Áo Johann Radon phát minh năm 1917, máy tính giải mã mật độ mô tại từng pixel trong mặt phẳng đó.
  4. Bàn trượt nhích thêm một khoảng cách $Delta d = 0.5$ mm, và máy tiếp tục quét *mặt phẳng song song tiếp theo*!
  5. Khi ghép hàng trăm lát cắt mặt phẳng song song lại với nhau, máy tính dựng nên một *khối mô hình 3D hoàn hảo* của não bộ hay lục phủ ngũ tạng, cho phép bác sĩ phẫu thuật nhìn rõ từng mạch máu siêu nhỏ và định vị khối u chính xác đến từng milimét!
  
  Không cần phẫu thuật mở hộp sọ mạo hiểm, chỉ bằng tư duy hình học không gian của các mặt phẳng song song kết hợp với thuật toán giải tích, Cormack và Hounsfield đã cứu sống hàng triệu sinh mạng và vinh dự nhận Giải Nobel Y học năm 1979!
]

#hook-box(title: "M.C. Escher & Cầu Thang Bất Khả Thi: Khi Phép Chiếu Song Song Đánh Lừa Não Bộ")[
  Thầy chiếu lên màn hình bức tranh khắc gỗ nổi tiếng *"Ascending and Descending"* (Lên và Xuống, 1960) của danh họa người Hà Lan *Maurits Cornelis Escher*:
  
  *“Các em hãy nhìn những nhà sư bước đi trên chiếc cầu thang hình chữ nhật trên nóc tu viện: Các nhà sư ở hàng bên ngoài đang miệt mài leo lên bậc thang, còn các nhà sư ở hàng bên trong lại đang đi xuống. Nhưng điều kỳ quái là: Sau khi đi hết 4 cạnh của hình chữ nhật, họ lại quay trở về đúng bậc thang xuất phát ban đầu, tiếp tục leo lên mãi mãi không bao giờ tới đỉnh!*
  
  *Đây là chiếc cầu thang ma thuật hay là một trò lừa thị giác?”*
  
  Thầy giải thích cơ chế hình học:
  - Bức tranh của Escher sử dụng *Phép chiếu song song (Isometric Projection)* thay vì phép chiếu phối cảnh xuyên tâm!
  - Trong phép chiếu song song, các đoạn thẳng có độ dài bằng nhau trong không gian sẽ chiếu xuống thành các đoạn thẳng bằng nhau trên giấy, bất kể chúng ở gần hay ở xa người quan sát.
  - Não bộ con người vốn quen với việc suy đoán khoảng cách 3D từ các góc nhìn phẳng. Escher đã cố tình bẻ cong các quan hệ vuông góc và song song tại các góc chuyển tiếp: Bậc thang thực chất là một cấu trúc hở trong không gian 3 chiều, nhưng khi chiếu song song lên mặt giấy 2D, hai điểm đầu và cuối bị ép dính vào nhau thành một điểm duy nhất, tạo nên một *Nghịch lý Không gian (Impossible Object)* làm mê hoặc toàn bộ giới toán học và triết học!
]

#tech-box(title: "Quả Cầu Cản Dịu 660 Tấn Của Tòa Tháp Taipei 101 Chống Động Đất Nhờ Hình Học Không Gian")[
  - Tòa tháp Taipei 101 cao 508 mét tại Đài Loan nằm ngay trên vành đai lửa Thái Bình Dương, thường xuyên hứng chịu những trận động đất kinh hoàng và siêu bão cấp 16.
  - Để tòa tháp không bị gãy đổ khi các tầng nhà dao động, các kỹ sư đã treo một quả cầu thép khổng lồ nặng 660 tấn (được ghép từ 41 tấm thép tròn song song hàn chặt) lơ lửng giữa tầng 87 và tầng 92 — gọi là *Tuned Mass Damper (TMD)*.
  - Khi một trận động đất làm tòa nhà nghiêng sang phải, quả cầu quán tính khổng lồ sẽ vung sang trái, tạo ra một mô-men phản lực kéo các mặt sàn của các tầng nhà trở lại trạng thái song song ổn định, giảm tới $40\%$ độ rung lắc của tòa tháp!
]

#tech-box(title: "Công Nghệ In 3D (3D Slicing & G-Code): Hàng Vạn Mặt Phẳng Song Song Dựng Nên Thế Giới")[
  Làm thế nào một chiếc máy in 3D có thể chế tạo ra một quả tim nhân tạo, một turbine động cơ phản lực hay một ngôi nhà bê tông nguyên khối chỉ từ một file kỹ thuật số trên máy tính?
  
  Bí quyết nằm ở thuật toán *Cắt lớp 3D (3D Slicing)* — ứng dụng thuần khiết của Bài 13: Hai Mặt Phẳng Song Song!
  
  1. Mô hình 3D nguyên khối ban đầu được phần mềm cắt bằng một họ các *mặt phẳng song song cách đều nhau* một khoảng vi mô $Delta z$ (thường từ $0.05$ mm đến $0.2$ mm).
  2. Giao tuyến giữa mặt phẳng song song thứ $k$ và vật thể 3D tạo thành một *thiết diện phẳng 2D*.
  3. Đầu phun máy in di chuyển trên mặt phẳng đó, đùn nhựa hoặc bột kim loại nung chảy để vẽ nên lát cắt 2D.
  4. Sau khi hoàn thành một lớp, bàn in hạ xuống đúng một khoảng $Delta z$, và máy in tiếp tục in *mặt phẳng song song tiếp theo*!
  
  Bằng cách xếp chồng hàng chục nghìn lát cắt mặt phẳng song song lên nhau theo trục thẳng đứng, một vật thể không gian 3 chiều phức tạp được hình thành từ hư vô! Hình học không gian lớp 11 chính là ngôn ngữ lập trình của cuộc cách mạng chế tạo bồi đắp (Additive Manufacturing) toàn cầu!
]

#story-box(
  title: "Định Lý Thales Trong Không Gian & Kiến Trúc Cầu Dây Văng Mỹ Thuận - Cần Thơ",
  author: "Định Lý Thales Cổ Đại & Các Kỹ Sư Cầu Đường Việt Nam",
)[
  Khi lưu thông qua cầu Mỹ Thuận hay cầu Cần Thơ bắc qua dòng sông Hậu mênh mông, ai cũng phải trầm trồ trước vẻ đẹp hùng vĩ của hai hàng dây văng khổng lồ đan xéo nhau như những chiếc đàn hạc vươn lên trời xanh.
  
  Làm thế nào để hàng trăm sợi dây cáp thép dài hàng trăm mét chịu được sức căng hàng chục nghìn tấn mà mặt cầu không bị vặn xoắn gãy đôi dưới tác động của gió bão nhiệt đới?
  
  Các kỹ sư cầu đường áp dụng *Định lý Thales trong Không gian và Tính chất Mặt phẳng Song song*:
  - Hệ dây văng được bố trí nằm trong hai *Mặt phẳng nghiêng đối xứng nhau* qua mặt phẳng trung tâm thẳng đứng của cây cầu.
  - Các dây cáp được neo vào tháp cầu và dầm cầu sao cho các đoạn thẳng định vị tạo nên các tỷ lệ Thales đồng dạng:
  $ (A_1 A_2) / (B_1 B_2) = (A_2 A_3) / (B_2 B_3) $
  - Nhờ tính chất của các chùm đường thẳng đồng quy và các mặt phẳng chịu lực song song, toàn bộ tải trọng động của hàng nghìn chiếc xe tải nặng di chuyển trên cầu được phân bổ đều tăm tắp về hai trụ tháp bê tông cắm sâu 100 mét dưới lòng sông!
  
  Định lý Thales và quan hệ song song không gian từ thời cổ đại đã vượt qua thời gian để trở thành trụ cột nâng đỡ những huyết mạch giao thông phồn vinh của non sông đất nước!
]

#pagebreak()
'''

