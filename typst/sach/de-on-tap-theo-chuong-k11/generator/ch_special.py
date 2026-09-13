# -*- coding: utf-8 -*-

CONTENT = r'''= CÁC CHUYÊN ĐỀ HỌC TẬP NÂNG CAO LỚP 11: NHỮNG VÙNG ĐẤT KỲ QUAN CỦA TOÁN ỨNG DỤNG

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ 3 Chuyên đề học tập Toán 11 (Phép biến hình trong nghệ thuật & kiến trúc, Lý thuyết đồ thị trong mạng lưới giao thông & internet, Bản vẽ kỹ thuật & Hình học họa hình trong công nghiệp chế tạo).
]

== CHUYÊN ĐỀ 1: PHÉP BIẾN HÌNH & NGHỆ THUẬT LÁT MẶT PHẲNG CỦA M.C. ESCHER

Có bao giờ các em nhìn vào những bức tranh của danh họa người Hà Lan *M.C. Escher* — nơi những đàn chim trắng bay lượn biến thành đàn cá đen bơi lội, những hiệp sĩ cưỡi ngựa lồng vào nhau khít khao đến từng milimét — và tự hỏi: *Làm thế nào một nghệ sĩ có thể tạo ra những kiệt tác kỳ ảo đến như vậy?*

Câu trả lời không nằm ở cây cọ vẽ, mà nằm ở *HỆ THỐNG CÁC PHÉP DỜI HÌNH VÀ PHÉP ĐỒNG DẠNG TRONG MẶT PHẲNG*: Phép tịnh tiến, phép quay, phép đối xứng trục, và phép đối xứng trượt!

#story-box(
  title: "M.C. Escher, Cung điện Alhambra & Bí mật Nghệ thuật Lát mặt phẳng (Tessellation)",
  author: "Maurits Cornelis Escher (1898 – 1972) & Nghệ nhân Hồi giáo xứ Granada",
)[
  Năm 1922 và 1936, nghệ sĩ M.C. Escher đã đến thăm cung điện *Alhambra* ở Granada, Tây Ban Nha. Tại đây, ông đã hoàn toàn bị mê hoặc bởi những bức tường gạch men tráng lệ của các nghệ nhân Hồi giáo từ thế kỷ XIV. Theo luật Hồi giáo, nghệ nhân không được vẽ hình người hay muông thú, vì vậy họ đã dồn toàn bộ trí tuệ vào việc sáng tạo các họa tiết hình học đối xứng tuần hoàn phủ kín toàn bộ mặt phẳng không chừa một khe hở nào!
  
  Trở về Hà Lan, Escher đã đắm chìm vào nghiên cứu các bài báo toán học của George Pólya về 17 nhóm đối xứng hình nền phẳng (Wallpaper Groups). Ông bắt đầu thay thế các đa giác hình học khô khan bằng những sinh vật sống: Chim, cá, bò sát, thiên thần và ác quỷ!
  
  Mỗi bức tranh lát mặt phẳng của Escher là một bài tập toán học đỉnh cao: Một con cá được quay quanh một tâm đối xứng một góc $120^circle$, sau đó tịnh tiến theo một vector $arrow(v)$, rồi đối xứng qua một trục để khớp chính xác vào đuôi của một con chim khác! Escher từng tâm sự:
  *“Dù tôi không được học hành bài bản về toán học cao cấp, nhưng tôi nhận ra rằng những ý tưởng sâu sắc nhất của các nhà toán học lại có tiếng nói đồng điệu kỳ diệu với những giấc mơ trực quan của một nghệ sĩ!”*
]

#hook-box(title: "Làm thế nào để lát kín nền nhà mà không bị thừa một mảnh gạch nào?")[
  Thầy hỏi cả lớp:
  *“Nếu các em là kiến trúc sư lát sàn nhà bằng những viên gạch men hình đa giác đều có cùng kích thước:*
  - Tại sao người ta có thể lát sàn bằng gạch hình TAM GIÁC ĐỀU? (Vì góc ở mỗi đỉnh là $60^circle$, $6 times 60^circle = 360^circle$).
  - Tại sao người ta hay lát bằng gạch hình VUÔNG? (Vì góc là $90^circle$, $4 times 90^circle = 360^circle$).
  - Tại sao tổ ong và các lối đi công viên lại lát bằng gạch hình LỤC GIÁC ĐỀU? (Vì góc là $120^circle$, $3 times 120^circle = 360^circle$).
  
  *Nhưng tại sao TUYỆT ĐỐI KHÔNG MỘT AI TRÊN THẾ GIỚI LÁT SÀN BẰNG GẠCH HÌNH NGŨ GIÁC ĐỀU?”*
  
  Học sinh tính nhẩm:
  *"Dạ thưa thầy, góc của ngũ giác đều là $108^circle$. Nếu ghép 3 viên gạch thì được $3 times 108^circle = 324^circle$, vẫn còn hở một khe $36^circle$ không nhét vừa viên nào! Còn nếu cố nhét 4 viên thì $4 times 108^circle = 432^circle$, chúng sẽ chồm lên nhau vỡ nát ạ!"*
  
  Thầy mỉm cười:
  *“Chính xác! Phép biến hình và tính chất đối xứng dạy chúng ta một bài học về sự hài hòa: Không phải hình thù nào đẹp đẽ đứng một mình cũng có thể dung nạp và gắn kết với xã hội xung quanh! Muốn hòa nhập tạo nên một thể thống nhất, các góc cạnh của chúng ta phải bổ sung cho nhau để vừa tròn $360^circle$!”*
]

== CHUYÊN ĐỀ 2: LÝ THUYẾT ĐỒ THỊ (GRAPH THEORY) & THUẬT TOÁN GOOGLE MAPS

Đồ thị trong chuyên đề này không phải là đồ thị hàm số $y = f(x)$! 
Nó là một tập hợp các *Đỉnh (Vertices)* và các *Cạnh (Edges)* nối giữa các đỉnh đó: Mạng lưới các thành phố nối với nhau bằng các con đường cao tốc, mạng lưới hàng tỷ máy tính nối với nhau trên toàn cầu (Internet), mạng lưới kết nối bạn bè trên Facebook, hoặc mạng lưới các trạm biến áp điện quốc gia!

#story-box(
  title: "Leonhard Euler & Bài toán 7 cây cầu xứ Königsberg khai sinh Lý thuyết Đồ thị",
  author: "Leonhard Euler (Thụy Sĩ, 1707 – 1783), Viện Hàn lâm Saint Petersburg",
)[
  Thành phố cổ Königsberg của nước Phổ (nay là Kaliningrad, Nga) có dòng sông Pregel chảy qua, chia thành phố thành 4 vùng đất được nối với nhau bởi 7 cây cầu bắc qua sông. Người dân thành phố vào những buổi chiều chủ nhật thường đi dạo và tự đặt cho nhau một câu đố hóc búa:
  *“Liệu có ai có thể xuất phát từ một điểm bất kỳ trong thành phố, đi qua TẤT CẢ 7 CÂY CẦU, MỖI CẦU ĐÚNG MỘT LẦN DUY NHẤT, rồi trở về điểm xuất phát được không?”*
  
  Suốt nhiều thập kỷ, hàng nghìn người đã thử mọi lộ trình, vẽ hàng trăm bản đồ, nhưng chưa một ai làm được! Người ta gửi câu đố đó đến cho nhà toán học vĩ đại nhất châu Âu thời bấy giờ: *Leonhard Euler*.
  
  Năm 1736, Euler công bố bài báo khoa học giải quyết trọn vẹn bài toán. Ông làm một điều chưa ai từng nghĩ tới: Ông vứt bỏ toàn bộ bản đồ địa lý chi tiết! Chiều dài cây cầu, độ rộng dòng sông, hình dáng các hòn đảo... tất cả đều là vô nghĩa! 
  
  Euler thu gọn 4 vùng đất thành 4 ĐIỂM (Đỉnh), và 7 cây cầu thành 7 ĐƯỜNG NỐI (Cạnh). Ông phát biểu:
  *“Một đồ thị chỉ có thể vẽ được một nét khép kín (Chu trình Euler) nếu và chỉ nếu TẤT CẢ CÁC ĐỈNH ĐỀU CÓ BẬC CHẴN (số cạnh nối vào đỉnh là số chẵn)! Nếu có đỉnh bậc lẻ, thì chỉ được phép có đúng 2 đỉnh bậc lẻ (khi đó điểm xuất phát và điểm kết thúc phải là hai đỉnh bậc lẻ này).”*
  
  Tại Königsberg, cả 4 vùng đất đều có bậc lẻ (lần lượt là 3, 3, 3, 5 cây cầu nối vào)! Do đó, Euler khẳng định chắc nịch bằng toán học: *ĐIỀU ĐÓ LÀ TUYỆT ĐỐI BẤT KHẢ THI!* Không ai cần phải phí công đi bộ thử nữa!
  
  Từ bài báo giải một câu đố dạo chơi của Euler, một nhánh toán học hoàn toàn mới đã ra đời: *Lý thuyết Đồ thị (Graph Theory) và Tôpô học (Topology)* — ngành khoa học đang vận hành toàn bộ thế giới số ngày nay!
]

#tech-box(title: "Thuật toán Dijkstra trong Google Maps & Thuật toán PageRank của Google")[
  Mỗi khi các em mở ứng dụng Google Maps lên, gõ điểm đến, chỉ trong chưa đầy $0,1$ giây, ứng dụng đã tìm ra lộ trình ngắn nhất, né các điểm kẹt xe và dự báo thời gian đến chính xác đến từng phút!
  
  Thuật toán kỳ diệu nào đã làm được điều đó giữa hàng triệu ngã tư đường phố?
  Đó chính là *Thuật toán Dijkstra (Dijkstra's Algorithm)* — thuật toán tìm đường đi ngắn nhất trên đồ thị có trọng số, do nhà khoa học máy tính Edsger Dijkstra phát minh năm 1956!
  
  Bên cạnh đó, cỗ máy tìm kiếm của tập đoàn Google ra đời từ đâu?
  Hai nhà sáng lập Larry Page và Sergey Brin đã mô hình hóa toàn bộ mạng Internet thế giới thành một ĐỒ THỊ KHỔNG LỒ:
  - Mỗi trang web là một Đỉnh.
  - Mỗi đường link liên kết dẫn từ trang này sang trang khác là một Cạnh có hướng.
  - Thuật toán *PageRank* coi mỗi đường link như một phiếu bầu tín nhiệm. Trang web nào có nhiều đường link từ các trang uy tín khác trỏ về sẽ được Google xếp hạng đầu tiên!
  
  Nếu không học Chuyên đề Lý thuyết Đồ thị lớp 11, một lập trình viên sẽ không bao giờ hiểu được cơ chế vận hành của mạng xã hội Facebook (Đồ thị bạn bè) hay các hệ thống gợi ý hàng hóa của Shopee và TikTok!
]

#deep-dive-box(title: "Benoît Mandelbrot, Hình Học Fractal & 'Dấu Vân Tay Của Thượng Đế'")[
  Trước năm 1975, hình học Euclid thống trị thế giới: Các nhà khoa học chỉ biết dùng đường thẳng, hình cầu, hình trụ để mô tả tự nhiên. Nhưng nhà toán học Benoît Mandelbrot (1924 – 2010) tại phòng thí nghiệm IBM đã thốt lên một câu nói chấn động:
  *“Những đám mây không phải là hình cầu, những ngọn núi không phải là hình nón, những đường bờ biển không phải là đường tròn, vỏ cây không nhẵn nhụi, và tia chớp không bao giờ lan truyền theo một đường thẳng!”*
  
  Mandelbrot đã phát minh ra *Hình học Fractal (Fractal Geometry)* — hình học của sự tự đồng dạng (Self-similarity). Dù bạn phóng to một góc nhỏ của bờ biển, một nhánh của lá dương xỉ, một bông súp lơ xanh Romanesco hay một mạng lưới phế quản phổi người lên $1.000$ lần hay $1.000.000$ lần, bạn lại nhìn thấy chính cấu trúc ban đầu lặp lại bất tận!
  
  Bằng công thức đại số cực kỳ đơn giản trên mặt phẳng số phức:
  $ z_(n+1) = z_n^2 + c $
  Mandelbrot đã tạo ra *Tập Mandelbrot (Mandelbrot Set)* — cấu trúc toán học kỳ vĩ và phức tạp nhất từng được nhân loại biết đến, được mệnh danh là “Dấu vân tay của Thượng Đế”. 
  
  Phép biến hình trong chuyên đề 1 lớp 11 chính là nền tảng nguyên thủy nhất để hiểu về Fractal: Sự co dãn đồng dạng vô hạn và các phép biến đổi Affine lặp (Iterated Function Systems - IFS) đang tạo ra toàn bộ cây cỏ, núi non, hiệu ứng lửa cháy, khói sương trong các bộ phim hoạt hình 3D đỉnh cao của Pixar, Disney và trò chơi điện tử thế giới mở!
]

== CHUYÊN ĐỀ 4: ĐƯỜNG CONG BÉZIER — NÉT VẼ LINH HỒN CỦA ĐỒ HỌA VECTOR & THIẾT KẾ SIÊU XE

Làm thế nào để máy tính vẽ được một đường cong mượt mà quyến rũ — như đường viền thân xe siêu xe Ferrari, cánh máy bay tàng hình, hay chính những nét chữ font Times New Roman, Roboto trên màn hình điện thoại của các em?

Nếu dùng phương trình đa thức bậc cao $y = a_n x^n + ... + a_0$, đường cong sẽ bị rung lắc điên cuồng ở hai đầu (Hiện tượng Runge). Năm 1962, kỹ sư trưởng hãng ô tô Renault người Pháp *Pierre Bézier* đã phát minh ra một giải pháp toán học hoàn mỹ: *ĐƯỜNG CONG BÉZIER (Bézier Curves)*!

#story-box(
  title: "Pierre Bézier & Cuộc Cách Mạng Thiết Kế Thân Vỏ Ô Tô Renault Bằng Toán Học",
  author: "Pierre Étienne Bézier (Pháp, 1910 – 1999), Kỹ Sư Trưởng Hãng Ô Tô Renault",
)[
  Vào thập niên 1960, việc thiết kế kiểu dáng thân xe ô tô tại các hãng xe Pháp như Renault và Citroën là một quy trình thủ công vô cùng chậm chạp: Các nghệ nhân phải dùng đất sét nặn từng mô hình tỷ lệ $1:1$, rồi thợ tiện dùng compa và thước đo cơ khí để chế tạo khuôn dập kim loại. Bất kỳ một chỉnh sửa nhỏ nào cũng làm mất hàng tháng trời và hàng triệu Franc!
  
  Pierre Bézier nhận ra: Ngành công nghiệp ô tô bắt buộc phải được số hóa trên máy tính! Nhưng làm sao một kỹ sư có thể điều khiển một đường cong tự nhiên mà không cần phải giải các hệ phương trình vi phân phức tạp?
  
  Bézier đã sử dụng các *Đa thức Bernstein*: Thay vì ép đường cong đi qua mọi điểm, ông đưa ra một tập hợp các *Điểm Điều Khiển (Control Points)*:
  - Đường cong xuất phát tại điểm đầu $P_0$ và kết thúc tại điểm cuối $P_n$.
  - Các điểm điều khiển trung gian $P_1, P_2$ đóng vai trò như những thỏi nam châm vô hình kéo căng và uốn lượn đường cong theo ý muốn của nhà thiết kế!
  
  Công thức đường cong Bézier bậc 3 (Cubic Bézier) — chuẩn mực vàng của ngành đồ họa:
  $ bold(B)(t) = (1 - t)^3 bold(P)_0 + 3(1 - t)^2 t bold(P)_1 + 3(1 - t) t^2 bold(P)_2 + t^3 bold(P)_3 quad (t in [0, 1]) $
  
  Phát minh của Pierre Bézier đã khai sinh ra toàn bộ ngành *Mô hình hóa Hình học Máy tính (CAD/CAM)*: Từ công cụ Pen Tool trong Adobe Illustrator, Photoshop, Figma đến hệ thống dập khuôn tự động của mọi hãng ô tô từ Porsche, Tesla đến Boeing!
]

#tech-box(title: "Bí Mật Font Chữ Vector: Tại Sao Phóng To Cỡ Nào Chữ Vẫn Sắc Nét Tuyệt Đối?")[
  - Khi các em phóng to một bức ảnh JPEG chụp bằng điện thoại lên $1.000\%$, bức ảnh sẽ bị vỡ nát thành các ô vuông điểm ảnh (Pixel) răng cưa nhòe nhoẹt.
  - Nhưng tại sao một chữ cái $A$ trong file PDF hay font chữ TrueType/OpenType trên màn hình Retina khi phóng to lên kích thước bằng tòa nhà chọc trời VẪN HOÀN TOÀN MỊN MÀNG SẮC NÉT KHÔNG TÌ VẾT?
  - Bởi vì máy tính KHÔNG LƯU CHỮ CÁI DƯỚI DẠNG ĐIỂM ẢNH!
  - Nó lưu chữ cái dưới dạng *Một Chuỗi Các Đoạn Đường Cong Bézier*! Khi phóng to, máy tính chỉ việc nhân tọa độ các điểm điều khiển với hệ số phóng đại $k$, và tính toán lại công thức Bézier trong một phần triệu giây! Toán học giải tích vector đã giải phóng thị giác nhân loại khỏi sự giới hạn của độ phân giải màn hình!
]

== CHUYÊN ĐỀ 5: MẬT MÃ BẤT ĐỐI XỨNG RSA — KHI SỐ HỌC ĐỒNG DƯ BẢO VỆ TÀI CHÍNH TOÀN CẦU

#story-box(
  title: "Bộ Ba RSA: Rivest, Shamir, Adleman & Chiếc Khóa Vàng Bảo Vệ Kỷ Nguyên Internet",
  author: "Ron Rivest, Adi Shamir & Leonard Adleman (Viện MIT, 1977 — Giải thưởng Turing 2002)",
)[
  Làm thế nào để hai người hoàn toàn xa lạ ở hai đầu bán cầu Trái Đất có thể truyền cho nhau số thẻ tín dụng hoặc mật khẩu ngân hàng qua đường truyền Internet công cộng mà không sợ hàng nghìn hacker nghe lén đánh cắp?
  
  Trước năm 1976, mật mã học thế giới bị bế tắc: Muốn giải mã thì người gửi và người nhận phải dùng chung một "chiếc chìa khóa bí mật" (Mật mã đối xứng). Nhưng làm sao chuyển chiếc chìa khóa đó cho nhau mà không bị kẻ xấu chặn đường cướp mất?
  
  Năm 1977, ba nhà khoa học máy tính tại Viện Công nghệ Massachusetts (MIT) gồm Ron Rivest, Adi Shamir và Leonard Adleman đã làm nên cuộc cách mạng vĩ đại nhất lịch sử an ninh thông tin: *Hệ Mật Mã Bất Đối Xứng RSA*.
  
  Ý tưởng then chốt: Tách chiếc chìa khóa thành HAI NỬA RIÊNG BIỆT:
  1. *Khóa Công Khai (Public Key):* Treo công khai trên mạng cho cả thế giới thấy. Bất kỳ ai cũng có thể dùng nó để khóa thông điệp vào chiếc hộp sắt.
  2. *Khóa Bí Mật (Private Key):* Chỉ một mình người nhận giữ trong túi. Khi chiếc hộp được khóa lại, NGAY CẢ NGƯỜI VỪA KHÓA NÓ CŨNG KHÔNG THỂ MỞ RA ĐƯỢC! Chỉ có chiếc khóa bí mật mới mở được!
  
  Nền tảng toán học của RSA dựa hoàn toàn vào *Độ Bất Đối Xứng của Phép Nhân Số Nguyên Tố Lớn* và *Định Lý Fermat Nhỏ / Định Lý Euler*:
  - Một máy tính mất $0.00001$ giây để nhân hai số nguyên tố lớn $p$ và $q$ có 300 chữ số thành một hợp số $N = p times q$.
  - Nhưng nếu chỉ cho biết hợp số $N$, thì TOÀN BỘ CÁC SIÊU MÁY TÍNH MẠNH NHẤT TRÊN TRÁI ĐẤT PHẢI MẤT HÀNG TRIỆU NĂM MỚI TÌM LẠI ĐƯỢC HAI THỪA SỐ NGUYÊN TỐ BAN ĐẦU $p$ VÀ $q$!
  
  Cấp số nhân rời rạc và số học đồng dư đã dựng nên bức tường thành kiên cố nhất bảo vệ toàn bộ nền kinh tế số nghìn tỷ USD của nhân loại ngày nay!
]


#story-box(
  title: "Định Lý Bốn Màu: Cuộc Tranh Luận Lịch Sử Khi Máy Tính Lần Đầu Tiên Chứng Minh Toán Học",
  author: "Francis Guthrie (1852) & Kenneth Appel - Wolfgang Haken (1976)",
)[
  Năm 1852, chàng sinh viên Francis Guthrie khi đang ngồi tô màu bản đồ các hạt của nước Anh bỗng nhận ra: Chỉ cần đúng 4 màu là đủ để tô mọi bản đồ sao cho hai vùng có chung đường biên giới không bao giờ bị trùng màu!
  
  Ông gửi bài toán này cho thầy của mình là nhà toán học Augustus De Morgan. Suốt 124 năm sau đó, từ Arthur Cayley, Alfred Kempe cho tới các bộ óc vĩ đại nhất thế giới đều lao vào tìm cách chứng minh *Định lý Bốn Màu (Four Color Theorem)*, nhưng tất cả đều thất bại hoặc để lộ sơ hở!
  
  Mãi đến năm 1976 tại Đại học Illinois, hai nhà toán học Kenneth Appel và Wolfgang Haken đã làm nên một kỳ tích làm chấn động cộng đồng toán học: Họ quy bài toán về 1.936 cấu hình đồ thị cơ bản, và dùng một siêu máy tính chạy liên tục suốt 1.200 giờ đồng hồ để kiểm tra từng trường hợp!
  
  Đó là *định lý lớn đầu tiên trong lịch sử nhân loại được chứng minh bằng máy tính*! Khi đó, một cuộc tranh luận triết học dữ dội nổ ra: Liệu một chứng minh mà bộ não con người không thể tự mình đọc và kiểm tra hết từng trang giấy có được coi là toán học chân chính? Câu trả lời là: Máy tính không thay thế tư duy toán học, mà nó là chiếc kính viễn vọng mở rộng giới hạn nhận thức của con người!
]

== CHUYÊN ĐỀ 3: BẢN VẼ KỸ THUẬT, THIẾT DIỆN & CÔNG NGHỆ CHẾ TẠO 3D CAD/CAM

Làm thế nào để các kỹ sư của tập đoàn Boeing tại Mỹ, Rolls-Royce tại Anh và Mitsubishi tại Nhật Bản có thể cùng thiết kế và chế tạo hàng triệu bộ phận của chiếc siêu máy bay Boeing 787 Dreamliner để khi ghép lại tại nhà máy ở Seattle, mọi ốc vít đều ăn khớp chính xác tới từng micromét?

Bí quyết nằm ở *Bản vẽ Kỹ thuật và Mô hình hóa 3D CAD/CAM*:
1. Khả năng đọc hình chiếu đứng, hình chiếu bằng, hình chiếu cạnh.
2. Khả năng tưởng tượng mặt cắt không gian (Thiết diện) khi một mặt phẳng cắt xuyên qua chi tiết máy.
3. Kỹ năng chuyển dịch linh hoạt giữa tư duy hình học không gian trừu tượng và thực tế gia công cơ khí trên máy tiện, máy phay CNC và máy in kim loại 3D!

#story-box(
  title: "Gaspard Monge & Bí Mật Quốc Phòng Quân Sự Của Hình Học Họa Hình",
  author: "Gaspard Monge (1746 – 1818), Viện Sĩ Viện Hàn Lâm Khoa Học Pháp",
)[
  Năm 1765, chàng thanh niên 19 tuổi nghèo khó Gaspard Monge được giao nhiệm vụ thiết kế một công sự pháo binh phòng thủ cho trường quân sự Mézières. Theo phương pháp thông thường thời bấy giờ, các kỹ sư quân sự phải mất hàng tuần, thậm chí hàng tháng ròng rã thực hiện những phép tính số học phức tạp để xác định góc bắn và tầm nhìn pháo binh.
  
  Thế nhưng, Monge đã làm kinh ngạc toàn bộ ban giám hiệu khi nộp bản vẽ hoàn chỉnh chỉ sau... vài giờ đồng hồ! Vị sĩ quan chỉ huy lúc đầu tức giận từ chối xem bản vẽ vì cho rằng Monge vẽ ẩu. Nhưng khi kiểm tra thực địa, mọi tính toán hình học chiếu của Monge chính xác đến mức không một viên đạn pháo nào có thể lọt qua góc chết!
  
  Monge đã phát minh ra *Hình học họa hình (Descriptive Geometry)* — phương pháp biểu diễn các vật thể 3 chiều phức tạp lên một mặt phẳng 2 chiều thông qua hai phép chiếu trực giao vuông góc bổ sung cho nhau. 
  
  Nhận ra sức mạnh vượt trội của phương pháp này trong việc chế tạo súng đại bác, chiến hạm và thành lũy quân sự, Bộ Quốc phòng Pháp đã ngay lập tức ra lệnh: *Cấm xuất bản và coi Hình học họa hình của Monge là "BÍ MẬT QUỐC PHÒNG TUYỆT MẬT"!* Suốt 15 năm ròng rã, Monge không được phép tiết lộ phương pháp của mình cho bất kỳ ai ngoài các sĩ quan cao cấp của quân đội Pháp! Mãi đến năm 1795, sau Cách mạng Pháp, Monge mới được phép công khai xuất bản công trình và sáng lập nên trường Bách khoa Paris (École Polytechnique) lừng danh!
]

#inquiry-box(title: "Phòng Thí Nghiệm Tư Duy & Dự Án Tự Nghiên Cứu Chuyên Đề Nâng Cao 11")[
  Dành cho các nhà toán học, kiến trúc sư và kỹ sư công nghệ tương lai:
  
  1. *Thí nghiệm Tư duy: Bài toán bắt tay tại một bữa tiệc (Handshake Lemma):*
  - Tại một bữa tiệc có $n$ người, một số người bắt tay nhau (mỗi cái bắt tay là một cạnh nối 2 người). Hãy chứng minh bằng tư duy đồ thị rằng: *Số người có số lần bắt tay là số lẻ BẮT BUỘC PHẢI LÀ MỘT SỐ CHẴN!*
  - Gợi ý suy luận tự nghiên cứu: Tổng bậc của tất cả các đỉnh trong một đồ thị luôn bằng $2 times E$ (vì mỗi cạnh đóng góp 2 vào tổng bậc). Vì tổng bậc là số chẵn, nên tổng bậc của các đỉnh bậc lẻ bắt buộc phải chẵn, nghĩa là số lượng đỉnh bậc lẻ phải là số chẵn! Bạn thấy đấy, không cần biết ai bắt tay ai, chỉ bằng một định lý đồ thị thuần túy, ta đã khẳng định được một quy luật xã hội tất yếu!
  
  2. *Gợi ý Lập trình Mô phỏng (Python / GeoGebra):*
  - *Dự án 1 (Vẽ Fractal Mandelbrot):* Sử dụng thư viện `numpy` và `matplotlib` của Python. Chỉ với khoảng 20 dòng lệnh kiểm tra điều kiện lặp $|z_n| <= 2$ sau 100 bước, bạn có thể tự tay kết xuất bức ảnh tập Mandelbrot với độ phân giải 4K tuyệt mỹ ngay trên máy tính của mình!
  - *Dự án 2 (Mô phỏng Thuật toán Dijkstra trên GeoGebra):* Tạo 6 điểm làm các thành phố và nối chúng bằng các đoạn thẳng có gán độ dài. Lập bảng tìm đường đi ngắn nhất từ đỉnh đầu đến đỉnh cuối để hiểu cách các kỹ sư Google tối ưu hóa thuật toán điều hướng giao thông.
  
  3. *Vấn đề mở của nhân loại dành cho bạn tự đào sâu:*
  - *Bài toán Người Du Lịch (Traveling Salesperson Problem - TSP):* Một người giao hàng cần đi qua $N$ thành phố và quay về điểm ban đầu sao cho tổng quãng đường là ngắn nhất. Hiện nay, thế giới chưa tìm ra thuật toán thời gian đa thức (Polynomial time) nào giải quyết chính xác bài toán này khi $N$ lớn! Đây chính là bài toán trung tâm của Thiên niên kỷ: $P$ vs $"NP"$ (giải thưởng 1 triệu USD của Viện Toán Clay đang chờ bạn!).
  
  4. *Tủ sách dẫn lối khai minh (Sách kinh điển gợi ý đọc):*
  - *"Gödel, Escher, Bach: An Eternal Golden Braid"* — Douglas Hofstadter (Tuyệt tác đoạt giải Pulitzer kết hợp kỳ diệu giữa Toán học, Hội họa Escher và Âm nhạc Bach).
  - *"The Fractal Geometry of Nature"* — Benoît Mandelbrot (Cuốn sách làm thay đổi vĩnh viễn cách nhân loại nhìn nhận vẻ đẹp của thế giới tự nhiên).
  - *"Introduction to Graph Theory"* — Richard J. Trudeau (Nhập môn lý thuyết đồ thị trực quan, sâu sắc và đầy ắp tư duy triết học).
]

#hook-box(title: "Nghịch Lý Bờ Biển Nước Anh: Chu Vi Vô Hạn Bao Quanh Một Diện Tích Hữu Hạn?")[
  Thầy hỏi cả lớp một câu hỏi địa lý đơn giản:
  *“Đường bờ biển của đảo quốc Anh dài bao nhiêu kilômét?”*
  
  Học sinh: *"Dạ ta mở bản đồ địa lý hoặc hỏi Google là ra ngay một con số chính xác chứ thầy!"*
  
  Thầy mỉm cười:
  *“Nếu các em hỏi Bách khoa toàn thư Anh, câu trả lời là 12.500 km. Nhưng nếu hỏi Viện Thống kê Địa lý Pháp, con số là 17.800 km! Tại sao hai cơ quan khoa học uy tín lại lệch nhau tới hơn 5.000 km?”*
  
  Năm 1967, nhà toán học Benoit Mandelbrot đã công bố bài báo chấn động trên tạp chí *Science*: *"Đường bờ biển nước Anh dài bao nhiêu?"*.
  - Nếu bạn đo bằng cây thước dài 200 km: Bạn sẽ bỏ qua các vịnh nhỏ và mũi đá nhô ra biển.
  - Nếu bạn dùng cây thước 50 km: Độ dài bờ biển tăng lên vì bạn phải đo lượn vào từng khúc quanh của vịnh.
  - Nếu bạn dùng cây thước 1 mét, rồi 1 milimét, rồi kính hiển vi đo từng hạt cát ven bờ: Đường bờ biển tiếp tục gấp khúc vô hạn lần và độ dài TIẾN RA VÔ CÙNG LỚN!
  
  Đường bờ biển là một cấu trúc *Fractal*: Nó có *Chiều Hausdorff* không phải là 1 (như đường thẳng trơn) cũng không phải là 2 (như mặt phẳng), mà là $D approx 1.25$!
  Một đường cong có chu vi vô hạn nhưng lại bao bọc một diện tích đất liền hoàn toàn hữu hạn! Toán học lớp 11 nhắc nhở chúng ta: Khi thay đổi thang đo nhận thức, bản chất của thực tại sẽ mở ra những chiều kích kỳ vĩ khôn cùng!
]

#tech-box(title: "NURBS & Công Nghệ Điêu Khắc Mô Hình 3D Trong Hoạt Hình Pixar & Game Đỉnh Cao")[
  - Khi xem những bộ phim hoạt hình 3D đoạt giải Oscar của xưởng phim Pixar như *Toy Story, Đi tìm Nemo hay Nữ hoàng Băng giá (Frozen)*, bạn có bao giờ tự hỏi: Làm thế nào máy tính có thể mô phỏng chuyển động uốn lượn mượt mà từng sợi tóc, chiếc vảy cá voi hay lớp tuyết phủ chân thực đến nghẹt thở?
  - Bí mật nằm ở *Mặt cong NURBS (Non-Uniform Rational B-Splines)* — sự khái quát hóa bậc cao của đường cong Bézier và phép biến hình hình học:
    + Mỗi bề mặt nhân vật 3D được định nghĩa bởi một lưới các điểm điều khiển có trọng số $w_i$.
    + Thay vì phải xử lý hàng trăm triệu đa giác tam giác nặng nề làm sập nguồn máy tính, NURBS biểu diễn bề mặt bằng các hàm số hữu tỉ mượt mà liên tục:
    $ bold(S)(u, v) = (sum_(i) sum_(j) N_(i, p)(u) N_(j, q)(v) w_(i, j) bold(P)_(i, j)) / (sum_(i) sum_(j) N_(i, p)(u) N_(j, q)(v) w_(i, j)) $
  - Ngày nay, từ phần mềm thiết kế siêu xe Ferrari (CATIA, Autodesk Alias), máy bay tàng hình B-2 Spirit đến phần mềm dựng hình nhân vật Blender và Maya của Hollywood đều tôn thờ NURBS như một tiêu chuẩn toán học bất di bất dịch!
]

#pagebreak()
'''

