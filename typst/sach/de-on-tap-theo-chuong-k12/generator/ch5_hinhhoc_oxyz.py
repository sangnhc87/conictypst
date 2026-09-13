# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG V: PHÁO ĐÀI CỦA THỰC TẠI — PHƯƠNG TRÌNH MẶT PHẲNG, ĐƯỜNG THẲNG & MẶT CẦU OXYZ

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 12, Bài 13, Bài 14 SGK Toán 12 cùng Chuyên đề Thuật toán Hitbox trong Game 3D, Radar Tên lửa Phòng không và Kính thực tế ảo Apple Vision Pro.
]

== BÀI 12, 13 & 14: ĐẠI SỐ HÓA KHÔNG GIAN 3D — KHI HÌNH HỌC TRỞ THÀNH MÃ NGUỒN

Trong thế giới thực, mọi vật thể kiên cố đều được tạo thành từ 3 yếu tố hình học nền tảng:
- Những bức tường, mặt sàn, mặt bàn phẳng lặng: Đó là *MẶT PHẲNG*: $A x + B y + C z + D = 0$.
- Những tia laser, đường đạn bay, tia sáng, quỹ đạo rơi: Đó là *ĐƯỜNG THẲNG*: $(x - x_0)/a = (y - y_0)/b = (z - z_0)/c$.
- Những bong bóng xà phòng, quả địa cầu, tầm quét sóng radar: Đó là *MẶT CẦU*: $(x - a)^2 + (y - b)^2 + (z - c)^2 = R^2$.

Khi đưa cả 3 thực thể này vào hệ tọa độ $O x y z$, vẻ đẹp tối thượng của Toán học 12 phát tiết rực rỡ: *MỌI BÀI TOÁN TƯƠNG TÁC KHÔNG GIAN ĐỀU BIẾN THÀNH BÀI TOÁN GIẢI HỆ PHƯƠNG TRÌNH ĐẠI SỐ TUYỆT ĐẸP!*

#story-box(
  title: "Hệ Thống Đánh Chặn Vòm Sắt (Iron Dome) & Giao Điểm Đường Thẳng - Mặt Cầu Thời Gian Thực",
  author: "Tổ Chức Nghiên Cứu Quốc Phòng Rafael & Lực Lượng Phòng Không Israel",
)[
  Khi một quả đạn pháo hoặc tên lửa tầm ngắn bất ngờ phóng vút lên không trung hướng về các khu dân cư, hệ thống radar đa chùm tia EL/M-2084 của tổ hợp *Vòm Sắt (Iron Dome)* chỉ có vẻn vẹn từ $15$ đến $45$ giây để phát hiện, khóa mục tiêu và ra quyết định sinh tử.
  
  Làm thế nào mà máy tính chiến thuật có thể biết quả đạn sẽ rơi trúng bãi đất trống hay một trường học?
  
  Nó lập tức kích hoạt thuật toán Hình học Giải tích Không gian Oxyz:
  1. Từ 3 điểm phản xạ ban đầu thu được từ radar, máy tính ngoại suy ra *PHƯƠNG TRÌNH ĐƯỜNG THẲNG / PARABOL QUỸ ĐẠO CỦA MỤC TIÊU*:
  $ cases(x = x_0 + v_x t, y = y_0 + v_y t, z = z_0 + v_z t - 1/2 g t^2) $
  2. Bán kính bảo vệ của khu dân cư được mô hình hóa bằng một *MẶT CẦU AN TOÀN TRONG KHÔNG GIAN*:
  $ (S): (x - a)^2 + (y - b)^2 + (z - c)^2 <= R^2 $
  3. Nếu quỹ đạo cắt mặt cầu khu dân cư, tên lửa đánh chặn Tamir lập tức được khai hỏa! Máy tính giải bài toán tìm điểm giao nhau giữa hai đường bay trong không gian 3 chiều và kích nổ đầu đạn tiếp cận ở khoảng cách chỉ vài mét, bảo vệ tính mạng cho hàng triệu người dân!
]

#hook-box(title: "Thuật toán Hitbox trong Game CS:GO: Làm sao máy tính biết bạn bắn trúng đầu?")[
  Thầy hỏi cả lớp — đặc biệt là những học sinh mê chơi game bắn súng 3D (như CS:GO, Valorant, PUBG, Free Fire):
  *“Khi các em cầm chuột ngắm bắn vào một đối thủ đang chạy nhảy ở khoảng cách xa 200 mét trong game 3D:*
  - Phát súng vang lên! 
  - Chưa đầy một phần nghìn giây ($1$ mili-giây) sau, trên màn hình hiện lên dòng chữ đỏ: 'HEADSHOT — Tiêu diệt mục tiêu!'
  
  *Thầy hỏi các em: Làm thế nào mà máy chủ game có thể biết chính xác viên đạn ảo có bắn trúng đầu đối thủ hay chỉ sượt qua tai áo?”*
  
  Cả lớp vô cùng phấn khích, nhiều bạn giơ tay phát biểu: *"Dạ máy tính đo tọa độ chạm nhau ạ!"*
  
  Thầy giải thích:
  *“Chính xác! Nhưng nó dùng đúng công thức Toán 12 trong bài hôm nay:*
  1. Đầu của nhân vật game được máy tính bọc lại bằng một *MẶT CẦU OXYZ (Hitbox)*:
  $ (S): (x - a)^2 + (y - b)^2 + (z - c)^2 <= R^2 $
  2. Tia đạn bay từ nòng súng của các em là một *ĐƯỜNG THẲNG THAM SỐ TRONG KHÔNG GIAN*:
  $ (d): cases(x = x_0 + a_1 t, y = y_0 + a_2 t, z = z_0 + a_3 t) $
  3. Máy tính chỉ việc thay tọa độ tham số $(x, y, z)$ của đường thẳng vào phương trình mặt cầu! Ta thu được một phương trình bậc hai theo thời gian $t$:
  $ A t^2 + B t + C = 0 $
  - Nếu $Delta < 0$: Đường thẳng không cắt mặt cầu $arrow$ Bắn trượt!
  - Nếu $Delta >= 0$ và có nghiệm $t > 0$: Viên đạn xuyên qua mặt cầu $arrow$ HEADSHOT TRÚNG ĐẦU!
  
  *Hàng tỷ phát súng trong thế giới game ảo mỗi ngày đều được quyết định bởi biệt số $Delta$ của phương trình đường thẳng giao mặt cầu Oxyz lớp 12! Nếu không có phương pháp tọa độ không gian, toàn bộ ngành công nghiệp game 3D trị giá 300 tỷ USD của thế giới sẽ chỉ là con số không tròn trĩnh!”*
]

#tech-box(title: "Quét LiDAR của Kính Apple Vision Pro & Radar Tên lửa S-400")[
  1. *Kính thực tế ảo Apple Vision Pro:*
  Khi các em đeo kính Apple Vision Pro, làm sao kính có thể đặt một chiếc màn hình ảo lơ lửng nằm thăng bằng ngay trên mặt bàn uống nước ngoài đời thực?
  Cảm biến LiDAR trên kính liên tục bắn hàng triệu tia laser xung quanh phòng. Thuật toán gom cụm các điểm phản xạ đồng phẳng để giải ra *PHƯƠNG TRÌNH MẶT PHẲNG OXYZ CỦA MẶT BÀN*:
  $ A x + B y + C z + D = 0 $
  Vector pháp tuyến $arrow(n) = (A, B, C)$ cho kính biết độ nghiêng của mặt bàn để đặt vật thể ảo nằm áp sát phẳng lì lên mặt bàn thực mà không bị chìm xuống dưới hay lơ lửng trên trời!
  
  2. *Hệ thống Phòng không Tên lửa Đánh chặn (S-400, Patriot):*
  Khi một tên lửa đạn đạo của đối phương bay tới, radar quét quỹ đạo đường thẳng của mục tiêu. Máy tính quân sự giải bài toán *Khoảng cách giữa hai đường thẳng chéo nhau trong không gian Oxyz* để tính toán thời điểm và tọa độ điểm nghẽn mà tên lửa đánh chặn phóng tới phá hủy mục tiêu với độ chính xác từng mét!
]

#misconception-box(title: "Cái bẫy 'Sin hay Cos' khi tính Góc giữa Đường thẳng và Mặt phẳng")[
  Trong hình học không gian Oxyz, có 3 bài toán tính góc kinh điển:
  1. Góc giữa hai đường thẳng: Dùng *COS* ($cos phi = (|arrow(u)_1 dot arrow(u)_2|) / (|arrow(u)_1| |arrow(u)_2|)$).
  2. Góc giữa hai mặt phẳng: Dùng *COS* ($cos phi = (|arrow(n)_1 dot arrow(n)_2|) / (|arrow(n)_1| |arrow(n)_2|)$).
  3. Nhưng góc giữa ĐƯỜNG THẲNG VÀ MẶT PHẲNG lại phải dùng *SIN*:
  $ sin phi = (|arrow(u) dot arrow(n)|) / (|arrow(u)| |arrow(n)|)! $
  
  *Nguyên nhân học sinh hay nhầm lẫn:* Vector pháp tuyến $arrow(n)$ của mặt phẳng vuông góc với mặt phẳng. Do đó, góc giữa vector chỉ phương $arrow(u)$ và vector pháp tuyến $arrow(n)$ là góc phụ ($90^circle - phi$) của góc giữa đường thẳng và mặt phẳng! Vì $cos(90^circle - phi) = sin phi$, nên công thức bắt buộc phải dùng SIN! Cứ 10 học sinh thì có tới 4 học sinh viết nhầm thành COS và mất điểm oan uổng trong kỳ thi tốt nghiệp!
]

#dialogue-box(title: "Vết dầu loang trên biển: Mặt phẳng tiếp xúc Mặt cầu Oxyz")[
  *Thầy:* “Một chiếc tàu chở dầu bị rò rỉ tạo thành một vệt dầu loang trên mặt biển phẳng $(P): 2x - 2y + z - 9 = 0$. Một tàu ngầm cứu hộ hình cầu có phương trình $(S): x^2 + y^2 + z^2 - 4x + 6y - 2z + 5 = 0$.\
  Thầy hỏi: Tàu ngầm có bị dính vào vệt dầu loang trên mặt nước không?”\
  *Học sinh:* “Dạ ta tính khoảng cách từ tâm tàu ngầm đến mặt phẳng vệt dầu rồi so sánh với bán kính ạ!”\
  *Thầy:* “Chính xác! Tâm tàu ngầm là $I(2; -3; 1)$, bán kính $R = sqrt(2^2 + (-3)^2 + 1^2 - 5) = sqrt(9) = 3$.\
  - Khoảng cách từ tâm $I$ đến mặt phẳng $(P)$:\
  $ d(I, (P)) = (|2(2) - 2(-3) + 1(1) - 9|) / sqrt(2^2 + (-2)^2 + 1^2) = (|4 + 6 + 1 - 9|) / 3 = 2 / 3 < 3! $\
  Vì $d < R$, mặt phẳng vệt dầu cắt xuyên qua tàu ngầm theo một giao tuyến ĐƯỜNG TRÒN! Tàu ngầm đã nổi một phần lên mặt biển và bị vệt dầu bao quanh!”\
  *Học sinh:* “Tính toán vị trí tương đối bằng công thức Oxyz nhanh và chính xác đến từng centimet luôn thầy ạ!”
]

#deep-dive-box(title: "Ma trận MVP (Model - View - Projection) trong Công nghệ Game 3D")[
  Mọi tựa game bom tấn thế giới mở như Grand Theft Auto (GTA V) hay Black Myth: Wukong đều sử dụng Phương pháp Tọa độ Không gian Oxyz thông qua chuỗi nhân 3 ma trận $4 times 4$ mang tên *Chuỗi Ma trận MVP*:
  
  1. *Model Matrix:* Đặt vật thể vào tọa độ thế giới thực $(x, y, z)$.
  2. *View Matrix:* Chuyển đổi tọa độ thế giới sang hệ tọa độ của Camera (mắt người chơi) dựa trên vị trí camera và vector hướng nhìn.
  3. *Projection Matrix:* Chiếu toàn bộ không gian 3D hình chóp cụt tầm nhìn (Frustum) lên mặt phẳng 2D của màn hình máy tính!
  
  Phương trình mặt phẳng và mặt cầu lớp 12 chính là thuật toán *Frustum Culling*: Máy tính chỉ vẽ những vật thể nằm bên trong các mặt phẳng giới hạn của tầm mắt, loại bỏ hàng triệu vật thể phía sau lưng người chơi để game chạy mượt mà $120$ khung hình/giây!
]

== BÀI 15: VỊ TRÍ TƯƠNG ĐỐI, KHOẢNG CÁCH OXYZ & BẢO VỆ KHÔNG PHẬN QUỐC GIA

Khoảng cách trong không gian 3D không chỉ là bài toán thi cử. Trong ngành hàng không dân dụng và quốc phòng không quân, *KHOẢNG CÁCH GIỮA HAI ĐƯỜNG THẲNG CHÉO NHAU CHÍNH LÀ LẰN RANH SINH TỬ GIỮA BÌNH YÊN VÀ THẢM HỌA KHÔNG TẶC!*

#story-box(
  title: "Gaspard Monge & Hình học Họa hình: Bí mật Quân sự Tối mật của Napoléon",
  author: "Gaspard Monge (Pháp, 1746 – 1818), Viện sĩ Viện Hàn lâm, Bạn thân của Napoléon Bonaparte",
)[
  Năm 1765, chàng thiếu niên 19 tuổi Gaspard Monge làm việc tại trường Quân sự Mézières nước Pháp. Khi được giao nhiệm vụ tính toán các phương án bố trí công sự pháo binh phòng thủ — một công việc vốn đòi hỏi hàng trăm sĩ quan phải tính toán thủ công hàng tháng trời bằng số học — Monge đã phát minh ra *Hình học Họa hình (Descriptive Geometry)*: Chiếu không gian 3D lên các mặt phẳng tọa độ trực giao!
  
  Nhờ phương pháp của Monge, một sĩ quan có thể hoàn thành bản thiết kế pháo đài phức tạp chỉ trong vài giờ với độ chính xác tuyệt đối!
  
  Quân đội Pháp lập tức phong tỏa toàn bộ công trình của Monge, liệt nó vào hàng *Bí mật Quân sự Cấp Quốc gia Tối mật* suốt 15 năm trời, cấm không được tiết lộ cho bất kỳ nước nào! Chính công cụ hình học giải tích không gian này đã giúp các cánh quân pháo binh cơ động của Hoàng đế Napoléon Bonaparte bách chiến bách thắng khắp các chiến trường châu Âu!
]

#hook-box(title: "Hệ thống TCAS Tránh Va Chạm Máy Bay: Lằn ranh 300 mét trên bầu trời")[
  Thầy chiếu video mô phỏng hai chiếc máy bay chở khách Boeing 787 và Airbus A350 chở gần 600 hành khách đang bay trong đêm tối mù mịt qua vùng trời biển Đông với vận tốc 900 km/h:
  *“Ở tốc độ 250 mét/giây, hai chiếc máy bay lao về phía nhau nhanh hơn cả viên đạn! Phi công hoàn toàn không thể nhìn thấy nhau bằng mắt thường.*
  
  - Máy bay 1 bay theo đường thẳng $d_1: (x - 10)/2 = (y + 5)/3 = (z - 11)/1$ (đang ở độ cao 11.000 mét).
  - Máy bay 2 bay theo đường thẳng $d_2: (x - 20)/(-1) = (y - 8)/2 = (z - 10.8)/(-0.5)$ (đang ở độ cao 10.800 mét).
  
  *Thầy hỏi các em: Làm thế nào mà Hệ thống Máy tính Cảnh báo Va chạm Giao thông (TCAS) trên buồng lái biết được hai đường bay có nguy cơ va chạm nhau hay không?”*
  
  Cả lớp nín thở dõi theo bài toán sinh tử.
  
  Thầy giải thích bằng công thức *Khoảng cách giữa hai đường thẳng chéo nhau trong không gian Oxyz lớp 12*:
  $ d(d_1, d_2) = (|[arrow(u)_1, arrow(u)_2] dot arrow(M_1 M_2)|) / (|[arrow(u)_1, arrow(u)_2]|) $
  
  - Máy tính TCAS liên tục tính toán khoảng cách này mỗi 0,1 giây.
  - Theo quy chuẩn an toàn hàng không quốc tế (ICAO), nếu khoảng cách tính được $d < 300$ mét và thời gian tiếp cận $t < 40$ giây:
  - Máy tính trên máy bay 1 sẽ phát lệnh tự động bằng giọng nói: *“CLIMB! CLIMB NOW!”* (Bay vút lên cao!).
  - Đồng thời phát lệnh cho máy bay 2: *“DESCEND! DESCEND NOW!”* (Hạ độ cao khẩn cấp!).
  
  *Chỉ bằng một công thức tích vô hướng và có hướng vector lớp 12, chiếc máy bay tự động thoát khỏi thảm họa trong gang tấc, cứu sống hàng trăm sinh mạng mỗi ngày!”*
]

#tech-box(title: "Cây Phân Cấp Thể Tích Bao BVH trong Công nghệ Unreal Engine 5")[
  Trong các game thế giới thực tế ảo siêu chi tiết của Unreal Engine 5 (như game Black Myth: Wukong), cảnh quay có thể chứa tới hàng chục triệu đa giác tam giác. Nếu mỗi lần người chơi vung gậy, máy tính đều phải kiểm tra va chạm với từng tam giác thì máy tính sẽ bốc cháy vì quá tải!
  
  Các kỹ sư đồ họa sử dụng cấu trúc dữ liệu *Cây Thể Tích Bao (Bounding Volume Hierarchy - BVH)*:
  1. Gom các cụm đồ vật vào các *MẶT HỘP OXYZ (AABB)* hoặc *MẶT CẦU OXYZ*:
  $ (x - a)^2 + (y - b)^2 + (z - c)^2 <= R^2 $
  2. Tia va chạm chỉ cần kiểm tra xem có cắt mặt cầu bao ngoài hay không bằng phương pháp tọa độ Oxyz. Nếu không cắt mặt cầu bao ngoài ($d(I, d) > R$), máy tính loại bỏ ngay lập tức hàng triệu tam giác con bên trong chỉ trong một phép tính!
  
  Nhờ có phương pháp tọa độ mặt cầu và mặt phẳng lớp 12, game 3D thế giới mở mới có thể đạt được đồ họa siêu thực với tốc độ xử lý tức thời!
]

#misconception-box(title: "Cái bẫy Hai đường thẳng không cắt nhau thì song song")[
  Trong hình học phẳng cấp hai, hai đường thẳng không có điểm chung thì CHẮC CHẮN SONG SONG.
  
  Nhưng trong không gian 3D $O x y z$, một chân trời mới mở ra: *HAI ĐƯỜNG THẲNG CHÉO NHAU (Skew Lines)*!
  - Chúng không cắt nhau.
  - Nhưng chúng cũng KHÔNG HỀ SONG SONG! Chúng nằm trên hai mặt phẳng song song khác nhau và vĩnh viễn không bao giờ gặp nhau!
  
  *Cách kiểm tra chuẩn xác lớp 12:*
  1. Kiểm tra hai vector chỉ phương $arrow(u)_1$ và $arrow(u)_2$:
     - Nếu cùng phương: Hai đường thẳng *Song song* hoặc *Trùng nhau*.
     - Nếu không cùng phương: Tính tích hỗn tạp $[arrow(u)_1, arrow(u)_2] dot arrow(M_1 M_2)$:
        + Bằng 0: Cắt nhau tại 1 điểm.
        + Khác 0: CHÉO NHAU HOÀN TOÀN!
]

#story-box(
  title: "Kính Viễn Vọng James Webb & Điểm Cân Bằng Lagrange L2 Cách 1,5 Triệu Km",
  author: "Joseph-Louis Lagrange (1736 – 1813) & Kính Viễn Vọng Vũ Trụ NASA / ESA",
)[
  Ngày 25 tháng 12 năm 2021, chiếc kính viễn vọng không gian trị giá 10 tỷ USD *James Webb* được phóng lên quỹ đạo. Nhưng thay vì bay quanh Trái Đất như kính Hubble, James Webb phải bay thẳng tới một vị trí kỳ bí trong không gian cách Trái Đất $1.5$ triệu km mang tên *Điểm Lagrange $L_2$*!
  
  Điểm Lagrange là gì? Năm 1772, nhà toán học vĩ đại Joseph-Louis Lagrange khi giải bài toán chuyển động của 3 vật thể (Mặt Trời, Trái Đất và một vệ tinh) trong không gian tọa độ 3 chiều đã phát hiện ra: Có đúng 5 ĐIỂM CÂN BẰNG LỰC ĐẶC BIỆT trong không gian! Tại điểm $L_2$, lực hấp dẫn của Mặt Trời cộng với lực hấp dẫn của Trái Đất cân bằng hoàn hảo với lực ly tâm của vệ tinh!
  
  Ở vị trí đó, James Webb luôn luôn nằm trên đường thẳng nối Mặt Trời - Trái Đất, được Trái Đất che chắn ánh nắng chói chang, và có thể mở tấm khiên chắn nhiệt bằng kích thước một sân tennis để nhìn sâu vào quá khứ của vũ trụ cách đây 13,5 tỷ năm!
  
  Mọi phép tính đưa kính viễn vọng James Webb vào quỹ đạo quanh điểm $L_2$ đều dựa trên các phương trình mặt phẳng, đường thẳng và mặt cầu không gian Oxyz mà học sinh lớp 12 đang được học trên ghế nhà trường!
]

#story-box(
  title: "Rosalind Franklin & Bức Ảnh Số 51: Tọa Độ Nguyên Tử 3D Giải Mã Chuỗi Xoắn Kép DNA",
  author: "Rosalind Elsie Franklin (Anh, 1920 – 1958), Nhà Tinh Thể Học Tia X",
)[
  Mùa xuân năm 1952, tại phòng thí nghiệm King's College London, nhà nữ khoa học tài ba *Rosalind Franklin* đã thực hiện một kỳ tích thực nghiệm sau hơn 100 giờ chiếu tia X liên tục: Chụp được *Bức ảnh Số 51 (Photograph 51)* — bức ảnh nhiễu xạ tia X lịch sử ghi lại cấu trúc phân tử DNA!
  
  Bức ảnh trên phim chỉ là những đốm đen mờ nhạt xếp theo hình chữ $X$. Làm thế nào từ những đốm đen 2D phẳng đó, James Watson và Francis Crick có thể suy ra được cấu trúc xoắn kép 3 chiều kỳ diệu của toàn bộ sự sống?
  
  Họ đã dùng phương pháp Tinh thể học hình học không gian (X-ray Crystallography):
  - Ánh sáng tia X nhiễu xạ qua các nguyên tử Carbon, Nitơ, Phốtpho theo các góc phản xạ Bragg.
  - Bằng cách đặt mỗi nguyên tử vào hệ tọa độ không gian $O x y z$ với tọa độ $(x_i, y_i, z_i)$, Watson và Crick tính toán khoảng cách giữa các cặp base ($3.4$ Angstrom), bán kính vòng xoắn ($10$ Angstrom) và góc nghiêng của đường trục.
  
  Khi toàn bộ hệ phương trình khoảng cách và góc giữa các liên kết hóa học trong không gian Oxyz thỏa mãn, bí mật vĩ đại nhất của sự sống muôn loài — Chuỗi xoắn kép DNA — đã chính thức bước ra ánh sáng, mang về Giải Nobel Y học năm 1962!
]

#tech-box(title: "Hệ Thống Tránh Va Chạm Máy Bay TCAS: Khoảng Cách Hai Đường Thẳng Chéo Nhau")[
  Mỗi ngày có hơn 100.000 chuyến bay thương mại chở hàng triệu hành khách bay đan xen nhau trên bầu trời toàn cầu. Trong đêm tối dày đặc hoặc sương mù bao phủ, các phi công không thể nhìn thấy máy bay khác bằng mắt thường.
  
  Điều gì ngăn cản hai chiếc máy bay đang bay với vận tốc $900 "km/h"$ không đâm vào nhau trên không?
  
  Đó là hệ thống điện tử bắt buộc trên mọi máy bay thương mại: *TCAS (Traffic Alert and Collision Avoidance System)*:
  1. Hai máy bay $A$ và $B$ liên tục phát sóng hỏi đáp vị trí và độ cao cho nhau, tạo thành hai đường thẳng tham số trong không gian $O x y z$:
  $ (d_1): arrow(r)_1(t) = arrow(r)_(10) + arrow(v)_1 t, quad (d_2): arrow(r)_2(t) = arrow(r)_(20) + arrow(v)_2 t $
  2. Hai đường thẳng này hầu hết là *CHÉO NHAU TRONG KHÔNG GIAN*. Máy tính TCAS liên tục tính toán *Khoảng cách ngắn nhất giữa hai đường thẳng*:
  $ d = (| [arrow(v)_1, arrow(v)_2] dot arrow(M_1 M_2) |) / (| [arrow(v)_1, arrow(v)_2] |) $
  3. Nếu khoảng cách $d$ nhỏ hơn ngưỡng an toàn ($approx 300$ mét) và thời gian đến điểm tiếp cận gần nhất (CPA) dưới 25 giây, hệ thống TCAS sẽ tự động ghi đè mệnh lệnh của trạm không lưu và phát lệnh khẩn cấp bằng giọng nói trong buồng lái: *"CLIMB, CLIMB!"* (Yêu cầu phi cơ A bay vọt lên) và *"DESCEND, DESCEND!"* (Yêu cầu phi cơ B chúc mũi bay xuống)!
  
  Công thức khoảng cách giữa hai đường thẳng chéo nhau lớp 12 chính là lá bùa hộ mệnh thầm lặng bảo vệ an toàn cho mọi chuyến bay trên toàn thế giới!
]

#story-box(
  title: "Thiết Kế Thuốc Bằng Cấu Trúc (Molecular Docking): Thuật Toán Oxyz Khóa Chặt Virus",
  author: "Ngành Hóa Dược Tính Toán (Computational Chemistry) & Đại Học California, San Francisco",
)[
  Khi đại dịch toàn cầu bùng phát (như virus SARS-CoV-2 hay virus HIV), các nhà khoa học không thể ngồi thử nghiệm mò mẫm hàng triệu hóa chất trong ống nghiệm — việc đó sẽ mất hàng chục năm và hàng trăm nghìn người sẽ chết!
  
  Họ sử dụng phương pháp *Thiết kế Thuốc Dựa trên Cấu trúc 3D (Structure-Based Drug Design)*:
  - Máy quét tinh thể học tia X hoặc kính hiển vi điện tử lạnh Cryo-EM giải mã cấu trúc không gian của protein gai virus, biến nó thành một "ổ khóa" gồm hàng chục nghìn nguyên tử với tọa độ $(x_i, y_i, z_i)$ trong không gian $O x y z$.
  - Thuật toán máy tính *Molecular Docking* mô hình hóa hàng triệu phân tử thuốc tiềm năng như những chiếc "chìa khóa 3D" có thể xoay và co dãn các góc liên kết.
  - Máy tính liên tục tính toán *Khoảng cách Euclid Oxyz* và lực tương tác tĩnh điện Coulomb giữa các nguyên tử của thuốc và vùng rãnh hoạt động của protein:
  $ d_(i j) = sqrt((x_i - x_j)^2 + (y_i - y_j)^2 + (z_i - z_j)^2) $
  
  Khi tìm ra một phân tử thuốc có bề mặt không gian khớp khít hoàn hảo vào rãnh thụ thể của virus với khoảng cách cực tiểu $d_(i j)$, viên thuốc sẽ khóa chặt virus và vô hiệu hóa khả năng lây nhiễm của nó!
  Toán học tọa độ không gian $O x y z$ chính là chiến hào tuyến đầu bảo vệ sức khỏe của toàn thể nhân loại trước những dịch bệnh hiểm nghèo!
]

#tech-box(title: "Định Vị Vệ Tinh GPS & Bài Học Hiệu Chỉnh Thời Gian Tương Đối Tính")[
  Mỗi ngày khi các em mở ứng dụng Google Maps hay gọi xe Grab, hệ thống định vị GPS trên điện thoại giải bài toán: *Tìm giao điểm của 4 MẶT CẦU TRONG KHÔNG GIAN OXYZ* phát ra từ 4 vệ tinh quay quanh Trái Đất ở độ cao 20.000 km:
  $ (x - x_i)^2 + (y - y_i)^2 + (z - z_i)^2 = (c (t - t_i))^2 quad (i = 1, 2, 3, 4) $
  
  Với $c = 300.000 "km/s"$ là vận tốc ánh sáng, và $(x_i, y_i, z_i)$ là tọa độ của vệ tinh thứ $i$.
  
  Thế nhưng, nếu các kỹ sư chỉ dùng hình học Oxyz cổ điển của Newton mà quên mất *Thuyết Tương Đối của Einstein*, sai số vị trí sẽ là bao nhiêu?
  1. *Thuyết Tương Đối Hẹp:* Vì các vệ tinh chuyển động với vận tốc cực nhanh ($14.000 "km/h"$), đồng hồ nguyên tử trên vệ tinh chạy *chậm hơn* đồng hồ mặt đất khoảng $7$ micro-giây mỗi ngày!
  2. *Thuyết Tương Đối Rộng:* Vì vệ tinh ở trên cao có trường hấp dẫn yếu hơn, đồng hồ trên vệ tinh lại chạy *nhanh hơn* đồng hồ mặt đất khoảng $45$ micro-giây mỗi ngày!
  
  Tổng cộng: Đồng hồ trên vệ tinh chạy nhanh hơn mặt đất đúng:
  $ Delta t = 45 - 7 = +38 "micro-giây mỗi ngày"! $
  
  Nếu máy tính không hiệu chỉnh $38$ micro-giây này vào phương trình mặt cầu $O x y z$, thì chỉ sau một ngày duy nhất, sai số khoảng cách sẽ bị nhân lên:
  $ Delta s = c times Delta t = (3 times 10^8) times (38 times 10^(-6)) approx 11.400 "mét" = 11.4 "km"! $
  
  Chiếc điện thoại của các em sẽ chỉ điểm bạn đang đứng ở giữa sông Hồng thay vì trong lớp học!
]

#tech-box(title: "Đồ Họa 3D & Ray-Tracing Hollywood: Giao Điểm Đường Thẳng & Mặt Cầu Oxyz")[
  Khi các em xem những bộ phim bom tấn hoạt hình 3D của Pixar (*Toy Story, Coco, Frozen*) hay các tựa game đồ họa siêu thực (*Cyberpunk 2077*), làm thế nào card đồ họa NVIDIA có thể tạo ra những tia sáng lung linh, bóng đổ mềm mại và ánh phản chiếu trên mặt nước chân thực đến ngỡ ngàng?
  
  Bí mật cốt lõi chính là thuật toán *DÒ TIA ÁNH SÁNG (Ray-Tracing)* — ứng dụng thuần túy của Hình học Giải tích $O x y z$ lớp 12:
  
  1. *Mô hình hóa Tia nhìn của Camera:*
  Từ mắt người xem (tọa độ camera $arrow(E)$) qua mỗi điểm ảnh (pixel) trên màn hình ảo, máy tính bắn ra một tia nhìn là một *Đường thẳng tham số không gian*:
  $ arrow(R)(t) = arrow(E) + t dot arrow(D), quad (t > 0) $
  trong đó $arrow(D) = (d_x, d_y, d_z)$ là vector chỉ phương đơn vị.
  
  2. *Tìm Giao điểm với Vật thể 3D (Phương trình Mặt Cầu):*
  Vật thể tròn (như nhãn cầu mắt nhân vật, giọt nước hay quả cầu thủy tinh) có tâm $C(x_c, y_c, z_c)$ và bán kính $R$:
  $ |arrow(P) - arrow(C)|^2 = R^2 $
  Thay phương trình đường thẳng tia sáng $arrow(P) = arrow(E) + t arrow(D)$ vào phương trình mặt cầu, ta thu được một *Phương trình bậc hai theo thời gian $t$*:
  $ A t^2 + B t + C = 0 $
  với $A = |arrow(D)|^2 = 1$, $B = 2 arrow(D) dot (arrow(E) - arrow(C))$, $C = |arrow(E) - arrow(C)|^2 - R^2$.
  - Nếu $Delta = B^2 - 4 A C < 0$: Tia sáng bay trượt qua quả cầu.
  - Nếu $Delta >= 0$: Nghiệm dương nhỏ nhất $t_1$ cho ta chính xác tọa độ va chạm đầu tiên $arrow(P) = arrow(E) + t_1 arrow(D)$!
  
  3. *Tích Vô Hướng & Độ Sáng Chiếu Rọi:*
  Tại điểm va chạm $arrow(P)$, vector pháp tuyến mặt cầu là $arrow(N) = (arrow(P) - arrow(C)) / R$. 
  Độ sáng của bề mặt được tính bằng *Tích vô hướng* giữa vector pháp tuyến $arrow(N)$ và vector hướng nguồn sáng Mặt Trời $arrow(L)$:
  $ "Độ sáng" = I_0 dot max(0, arrow(N) dot arrow(L)) $
  
  Hàng tỷ phép tính đường thẳng, mặt cầu và tích vô hướng $O x y z$ được xử lý song song trong mỗi khung hình 1/60 giây để dệt nên thế giới điện ảnh kỳ ảo của nhân loại!
]

#story-box(
  title: "Tàu Lặn Đáy Vực Mariana: Định Vị Âm Học 3D Dưới Áp Suất 1.000 Khí Quyển",
  author: "Đạo Diễn James Cameron & Tàu Lặn Deepsea Challenger (2012)",
)[
  Năm 2012, đạo diễn phim Avatar và Titanic, James Cameron, đã thực hiện một kỳ tích thám hiểm lịch sử: Một mình lái chiếc tàu lặn *Deepsea Challenger* lặn sâu $10.908$ mét xuống đáy Vực thẳm Mariana — điểm sâu nhất của vỏ Trái Đất.
  
  Ở độ sâu kinh hoàng ấy, áp suất nước biển lên tới hơn $1.000$ atmospheres (tương đương sức nặng của một chiếc xe bọc thép đè lên mỗi đầu ngón tay). Nước biển dày đặc hấp thụ hoàn toàn mọi sóng vô tuyến và tín hiệu vệ tinh GPS. Không gian xung quanh tối đen như mực.
  
  Làm thế nào tàu mẹ trên mặt biển biết được chính xác chiếc tàu lặn đang ở vị trí nào dưới vực thẳm?
  
  Các kỹ sư đã triển khai hệ thống *Tam giác đạc Thủy âm đường đáy cực dài (USBL - Ultra-Short Baseline Acoustic Positioning)* dựa trên Hệ tọa độ $O x y z$:
  - Ba phao phát đáp sóng âm (transponders) thả nổi trên mặt biển có tọa độ được định vị GPS tuyệt đối: $A(x_1, y_1, 0)$, $B(x_2, y_2, 0)$, $C(x_3, y_3, 0)$.
  - Tàu lặn ở dưới đáy vực phát ra các xung sóng âm siêu thanh. Do vận tốc sóng âm trong nước biển là $v_s approx 1.500 "m/s"$, thời gian sóng truyền đến từng phao ($t_1, t_2, t_3$) giúp tính ra bán kính khoảng cách: $R_i = v_s dot t_i$.
  - Tọa độ $(x, y, z)$ của tàu lặn dưới đáy vực Mariana là nghiệm duy nhất của *Hệ 3 phương trình Mặt Cầu trong không gian Oxyz*:
  $ cases((x - x_1)^2 + (y - y_1)^2 + z^2 = R_1^2, (x - x_2)^2 + (y - y_2)^2 + z^2 = R_2^2, (x - x_3)^2 + (y - y_3)^2 + z^2 = R_3^2) $
  
  Bằng cách trừ từng cặp phương trình mặt cầu cho nhau, hệ phương trình phi tuyến lập tức biến thành *Hệ phương trình mặt phẳng trực giao tuyến tính* — dạng toán quen thuộc mà bất kỳ học sinh lớp 12 nào cũng giải được bằng phương pháp khử Gauss! Toán học hình học không gian $O x y z$ đã dẫn đường cho con người chinh phục ranh giới tột cùng của hành tinh xanh!
]

#inquiry-box(title: "Phòng Thí Nghiệm Tư Duy & Dự Án Tự Nghiên Cứu Hình Học Giải Tích Oxyz 12")[
  Dành cho các kỹ sư Hàng hải, Điều hành Không lưu và Lập trình viên Đồ họa Game:
  
  1. *Thí nghiệm Tư duy: Điểm Gần Nhau Nhất Của Hai Chiếc Tàu Thủy:*
  - Hai con tàu chở hàng di chuyển trên biển (coi như mặt phẳng $O x y$) với vận tốc không đổi:
    + Tàu $A$ xuất phát từ $A_0(0, 10)$ với vận tốc $arrow(v)_A = (3, -4)$ hải lý/giờ.
    + Tàu $B$ xuất phát từ $B_0(5, -5)$ với vận tốc $arrow(v)_B = (-1, 2)$ hải lý/giờ.
  - Hãy thiết lập phương trình khoảng cách $d(t) = |arrow(A(t) B(t))|$ theo thời gian $t$, và dùng khảo sát hàm số hoặc bình phương vô hướng để tìm khoảnh khắc $t$ hai con tàu tiến gần nhau nhất! Có nguy cơ đâm nhau không?
  
  2. *Gợi ý Lập trình Mô phỏng (Python Tính Khoảng Cách Hai Đường Thẳng Chéo Nhau):*
    ```python
    import numpy as np
    # Đường thẳng 1 qua M1 với vector u1
    M1 = np.array([1.0, 0.0, -1.0])
    u1 = np.array([2.0, 1.0, 3.0])
    # Đường thẳng 2 qua M2 với vector u2
    M2 = np.array([0.0, 2.0, 1.0])
    u2 = np.array([1.0, -1.0, 1.0])
    
    cross_u = np.cross(u1, u2)
    M1M2 = M2 - M1
    dist = np.abs(np.dot(cross_u, M1M2)) / np.linalg.norm(cross_u)
    print(f"Khoảng cách giữa hai đường bay: {dist:.3f} km")
    ```
    Hãy thử thay đổi tọa độ để phát hiện khi nào hai đường thẳng cắt nhau ($d = 0$)!
  
  3. *Vấn đề mở của nhân loại dành cho bạn tự đào sâu:*
  - *Phỏng đoán Kepler Về Đóng Gói Hình Cầu (Kepler Conjecture):* Năm 1611, Johannes Kepler dự đoán rằng cách xếp cam hay xếp đạn đại bác chặt khít nhất trong không gian 3 chiều sẽ chiếm tỷ lệ thể tích $pi / (3 sqrt(2)) approx 74.05\%$. Phải mất tới gần 400 năm, năm 1998 nhà toán học Thomas Hales mới chứng minh được phỏng đoán này bằng sự trợ giúp của máy tính chạy qua 3 gigabyte dữ liệu mã nguồn!
  
  4. *Tủ sách dẫn lối khai minh (Sách kinh điển gợi ý đọc):*
  - *"Geometry and the Imagination"* — David Hilbert & S. Cohn-Vossen (Cuốn sách kinh điển thế giới đưa bạn vào thế giới tưởng tượng trực quan kỳ vĩ của hình học không gian).
  - *"Practical Linear Algebra: A Geometry Toolbox"* — Gerald Farin & Dianne Hansford (Cẩm nang cầu nối giữa hình học giải tích và công nghệ đồ họa máy tính 3D).
]
'''
