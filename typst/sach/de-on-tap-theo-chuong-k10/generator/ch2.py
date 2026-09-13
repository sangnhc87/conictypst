# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG II: NGHỆ THUẬT TỐI ƯU HÓA — BẤT PHƯƠNG TRÌNH & QUY HOẠCH TUYẾN TÍNH

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 3 & Bài 4 SGK Toán 10 cùng Chuyên đề Tối ưu hóa nguồn lực, Thuật toán Simplex, Định lý Đối ngẫu von Neumann & Biểu đồ Voronoi (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 3: BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN — THẾ GIỚI CỦA NHỮNG RANH GIỚI BẤT ĐẲNG

Ở bậc trung học cơ sở, học sinh đắm chìm trong thế giới của *Phương trình* và *Dấu bằng* ($=$): tìm $x$ để phương trình bằng $0$, tìm giao điểm của hai đường thẳng, cân bằng phương trình phản ứng. Dấu bằng tạo ra một cảm giác an toàn giả tạo: mọi thứ đều vừa vặn, đối xứng và tuyệt đối.

Nhưng khi bước ra đời thực, *dấu bằng hầu như không bao giờ tồn tại!*
- Bạn không bao giờ có số tiền vừa khít với mọi món đồ: $"Chi tiêu" <= "Thu nhập"$.
- Thời gian trong một ngày của một sĩ tử không thể co giãn: $"Học" + "Ngủ" + "Nghỉ" <= 24$ giờ.
- Sức tải của cây cầu vượt: $"Tải trọng xe" <= 30$ tấn.
- Năng lượng của một hạt vật chất: luôn bị chặn bởi vận tốc ánh sáng $v <= c$.

*Bất phương trình bậc nhất hai ẩn* chính là bước chuyển mình vĩ đại từ tư duy "điểm cố định" sang tư duy "miền khả dĩ". Một đường thẳng $a x + b y + c = 0$ chia toàn bộ vũ trụ phẳng hai chiều thành hai nửa thế giới: một bên thỏa mãn điều kiện tồn tại, một bên bị hủy diệt.

#story-box(
  title: "Nguyên lý Tối thiểu của Tự nhiên & Giấc mơ của Maupertuis",
  author: "Pierre Louis Maupertuis (1698 – 1759) & Leonhard Euler",
)[
  Vào thế kỷ XVIII, viện sĩ viện hàn lâm Pháp Pierre Louis Maupertuis đã công bố một khám phá làm kinh ngạc toàn cõi châu Âu mang tên *Nguyên lý tác dụng tối thiểu (Principle of Least Action)*. Maupertuis chỉ ra rằng:
  *“Tự nhiên khi hành động luôn dùng lượng chi phí năng lượng ít nhất có thể!”*
  - Tia sáng truyền từ không khí vào nước không đi theo đường thẳng mà bị bẻ cong (khúc xạ) sao cho *thời gian di chuyển là ngắn nhất* (Định luật Fermat).
  - Giọt sương đọng trên lá cỏ luôn co tròn lại để *diện tích bề mặt là nhỏ nhất* so với thể tích nước bên trong.
  - Dòng sông chảy từ đỉnh núi xuống biển luôn tự uốn lượn để *tiêu hao thế năng trọng trường một cách êm ái nhất*.
  
  Mọi sự vận động trong vũ trụ đều không bị ép buộc bởi một điểm số cứng nhắc, mà bị giam hãm trong một *vùng ràng buộc bất đẳng thức* (Constraints), và bên trong vùng đó, tự nhiên luôn tự tìm đến trạng thái cực trị: hoặc là năng lượng thấp nhất để bền vững, hoặc là hiệu quả cao nhất để sinh tồn. Bài học Bất phương trình bậc nhất hai ẩn hôm nay chính là viên gạch vỡ lòng để con người học cách mô phỏng lại trí tuệ tối ưu tuyệt mỹ đó của vũ trụ!
]

#story-box(
  title: "Frank Rosenblatt 1957 & Perceptron: Khởi nguyên của Mạng Nơ-ron Nhân tạo",
  author: "Frank Rosenblatt (Mỹ, 1928 – 1971)",
)[
  Năm 1957, tại Phòng thí nghiệm Hàng không Cornell, nhà tâm lý học Frank Rosenblatt đã chế tạo một cỗ máy kỳ dị mang tên *Perceptron Mark I*. Đó là mô hình toán học đầu tiên mô phỏng cách một nơ-ron sinh học trong não người đưa ra quyết định.
  
  Và trái tim toán học của Perceptron Mark I chính là... *MỘT BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN LỚP 10*:
  $ w_1 x_1 + w_2 x_2 + b >= 0 $
  - Đầu vào $x_1, x_2$ là các tín hiệu cảm giác (như độ sáng của hai điểm ảnh).
  - Trọng số $w_1, w_2$ là độ nhạy của các khớp thần kinh Synapse.
  - Số hạng tự do $b$ (bias) là ngưỡng kích hoạt của nơ-ron.
  
  Nếu biểu thức lớn hơn hoặc bằng 0, nơ-ron "phát hỏa" (bắn tín hiệu $1$, quyết định nhận diện: "Đây là quả táo!"). Nếu nhỏ hơn 0, nơ-ron im lặng (tín hiệu $0$, "Đây không phải quả táo!").
  
  Về mặt hình học, học máy (Machine Learning) bản chất là bài toán tìm một đường thẳng $w_1 x_1 + w_2 x_2 + b = 0$ để chia tách các điểm dữ liệu thành hai nửa mặt phẳng: nửa mặt phẳng Quả táo và nửa mặt phẳng Quả cam! Toàn bộ cuộc cách mạng Trí tuệ Nhân tạo hiện đại với hàng trăm tỷ tham số hôm nay thực chất chỉ là sự xếp chồng của hàng triệu bất phương trình bậc nhất mà học sinh lớp 10 đang vẽ bằng thước kẻ trên trang vở!
]

#hook-box(title: "Bài toán 200.000 đồng & Bữa tiệc sinh nhật sinh viên nghèo")[
  Thầy bước vào lớp, rút ra một tờ 200.000 đồng đặt lên bàn giáo viên:
  
  *“Hôm nay là sinh nhật của bạn lớp trưởng. Bạn ấy chỉ có đúng 200.000 đồng trong ví để mời cả nhóm bạn đi ăn chè và uống trà sữa. Giá một ly trà sữa chân trâu là 30.000 đồng ($x$), giá một bát chè bưởi là 20.000 đồng ($y$). Hỏi lớp trưởng có thể mua được những tổ hợp $(x; y)$ nào để vừa no bụng vừa không phải rửa bát trừ nợ?”*
  
  Học sinh lập tức tính nhẩm: $30.000 x + 20.000 y <= 200.000$ $arrow$ $3x + 2y <= 20$.
  
  Thầy mỉm cười vẽ hệ trục tọa độ $O x y$, vẽ đường thẳng ranh giới $3x + 2y = 20$, rồi lấy một điểm thử $(0; 0)$ để gạch bỏ nửa mặt phẳng vượt quá ngân sách.
  
  *“Các em nhìn xem! Tất cả những giấc mơ sinh nhật khả thi đều nằm gọn gàng trong tam giác nghiệm giới hạn bởi các trục tọa độ. Bất kỳ một điểm nào nằm ngoài ranh giới ấy đều đồng nghĩa với sự phá sản! Bất phương trình không phải là những con số vô hồn trên giấy, bất phương trình chính là tấm bản đồ ranh giới của sự tự do và giới hạn của đồng tiền!”*
]

#tech-box(title: "Ranh giới an toàn (Safety Boundary) trong Xe tự lái Tesla & Robot phẫu thuật")[
  - *Vùng không gian va chạm của Xe tự lái*: Khi chiếc xe Tesla Model S chạy trên cao tốc với vận tốc $100$ km/h, máy tính điều khiển FSD (Full Self-Driving) liên tục nhận dữ liệu từ 8 camera và radar. Nó lập ra hàng trăm bất phương trình bậc nhất hai ẩn mô tả khoảng cách an toàn với xe phía trước ($x$) và lề đường ($y$): $d_1(x, y) >= D_("min")$, $d_2(x, y) >= W_("min")$. Miền nghiệm của hệ này chính là "hành lang an toàn" (Corridor) để xe đánh lái mà không gây tai nạn.
  - *Robot phẫu thuật nội soi Da Vinci*: Khi một cánh tay robot luồn vào lồng ngực bệnh nhân để cắt khối u gần tim, các bác sĩ cài đặt các ranh giới bất phương trình không gian 3D ("Không bao giờ được chạm vào động mạch chủ!"). Nếu bác sĩ lỡ tay rung chuyển, phần mềm sẽ chặn đứng cử động dựa trên điều kiện bất phương trình an toàn.
]

#misconception-box(
  title: "Sai lầm Chết Người khi Chọn Điểm Thử để Xác Định Nửa Mặt Phẳng Nghiệm",
  misconception: "Học sinh thường học vẹt một cách máy móc: 'Cứ lấy điểm gốc tọa độ (0; 0) thay vào bất phương trình để kiểm tra!'",
  correction: "Nếu đường thẳng ranh giới ĐI QUA GỐC TỌA ĐỘ (ví dụ 2x - 3y >= 0), điểm (0; 0) nằm ngay trên bờ ranh giới, hoàn toàn KHÔNG THỂ cho biết nửa mặt phẳng bên nào là nghiệm! Bắt buộc phải chọn một điểm nằm NGOÀI đường thẳng!"
)[
  *Quy tắc chuẩn mực:*
  - Nếu đường thẳng không đi qua gốc $O$: Chọn $O(0; 0)$ là tiện lợi nhất vì tính toán nhẩm cực nhanh.
  - Nếu đường thẳng đi qua gốc $O$ (có dạng $a x + b y = 0$): BẮT BUỘC phải chọn một điểm đặc biệt nằm trên trục tọa độ, chẳng hạn điểm $A(1; 0)$ hoặc $B(0; 1)$.
  - Thay tọa độ điểm $A(1; 0)$ vào $2x - 3y >= 0$: Ta có $2(1) - 3(0) = 2 >= 0$ (Đúng). Do đó, nửa mặt phẳng chứa điểm $A(1; 0)$ chính là miền nghiệm cần tìm!
]

---

== BÀI 4: HỆ BẤT PHƯƠNG TRÌNH & QUY HOẠCH TUYẾN TÍNH — CỨU ĐÓI LENINGRAD ĐẾN LOGISTICS AMAZON

Nếu một bất phương trình tạo ra một nửa mặt phẳng, thì một *Hệ bất phương trình* sẽ tạo ra phần giao của nhiều nửa mặt phẳng — một *Miền đa giác lồi* (Convex Polygon).

Miền đa giác này trong khoa học quản lý được gọi là *Miền Khả Dĩ (Feasible Region)*. Mọi bài toán làm giàu, quản lý kho bãi, phân phối vắc-xin, hay chế tạo tên lửa đều quy về một câu hỏi duy nhất: *Trong vô số điểm nằm trong miền đa giác lồi này, ĐIỂM NÀO SẼ CHO CHÚNG TA NHIỀU TIỀN NHẤT HOẶC TỐN ÍT CHI PHÍ NHẤT?*

#story-box(
  title: "Leonid Kantorovich & Bài toán cứu đói trong Cuộc bao vây Leningrad 1939",
  author: "Leonid Kantorovich (Liên Xô, 1912 – 1986, Giải Nobel Kinh tế 1975)",
)[
  Năm 1939, một nhà máy sản xuất ván ép ở Leningrad đã gửi tới nhà toán học trẻ 27 tuổi *Leonid Kantorovich* một câu hỏi tưởng chừng rất tầm thường: Nhà máy có 8 loại máy xẻ gỗ với công suất khác nhau và cần sản xuất 5 loại ván dán. Phải phân bổ nguyên liệu gỗ vào máy nào để tổng sản lượng là lớn nhất?
  
  Kantorovich nhận thấy đây không phải là một bài toán xẻ gỗ đơn lẻ, mà là một bài toán tối ưu hóa tổng quát trên miền đa giác lồi nhiều chiều! Ông đã sáng tạo ra phương pháp giải quyết hệ bất phương trình ràng buộc mang tên *Quy hoạch Tuyến tính (Linear Programming)*.
  
  Hai năm sau, phát xít Đức bao vây thành phố Leningrad suốt 872 ngày đêm trong một trong những cuộc vây hãm tàn khốc nhất lịch sử nhân loại. Hàng trăm nghìn người dân chết đói và rét. Con đường tiếp tế duy nhất là "Con đường Sống" (Road of Life) băng qua mặt băng mong manh của hồ Ladoga.
  
  Kantorovich đã được giao nhiệm vụ sinh tử: Dùng các bất phương trình quy hoạch tuyến tính tính toán tải trọng của xe tải chở lương thực, độ dày của lớp băng biến thiên theo nhiệt độ, khoảng cách tối ưu giữa các xe để đoàn xe không làm vỡ băng mà vẫn vận chuyển được số lượng bột mì tối đa vào thành phố. Nhờ mô hình toán học của Kantorovich, hàng trăm nghìn chuyến xe đã vượt hồ an toàn, cứu sống hơn 500.000 người dân Leningrad thoát khỏi nạn đói diệt chủng!
  
  Năm 1975, Leonid Kantorovich đã được trao tặng Giải Nobel Kinh tế cho phát minh vĩ đại về lý thuyết phân bổ tối ưu các nguồn lực khan hiếm!
]

#story-box(
  title: "George Dantzig & Thuật toán Simplex giải cứu Cầu Hàng Không Berlin 1948",
  author: "George Dantzig (Mỹ, 1914 – 2005) & John von Neumann",
)[
  Mùa hè năm 1948, Liên Xô phong tỏa toàn bộ đường bộ và đường sắt dẫn vào Tây Berlin, đe dọa biến hơn 2 triệu người dân thành phố thành con tin thiếu đói. Phương án duy nhất của quân Đồng minh là thiết lập một *Cầu hàng không (Berlin Airlift)* khổng lồ chưa từng có trong lịch sử: Dùng máy bay vận tải chở than đá, thuốc men, sữa và bột mì hạ cánh xuống sân bay Tempelhof cứ mỗi 30 giây một chuyến!
  
  Làm thế nào để điều phối hàng nghìn chuyến bay, hàng chục nghìn tấn hàng hóa, lịch bảo dưỡng động cơ và nhiên liệu máy bay mà không bị tắc nghẽn đường băng? Không quân Mỹ đã áp dụng phát minh mới tinh của nhà toán học *George Dantzig*: *Thuật toán Simplex (Đơn hình)*!
  
  Dantzig chỉ ra một chân lý hình học rực rỡ: Thay vì phải kiểm tra hàng triệu điểm vô vọng bên trong miền đa giác lồi nhiều chiều, *giá trị tối ưu luôn luôn nằm ở CÁC ĐỈNH NHỌN (Vertices) của đa giác lồi*! Thuật toán Simplex chỉ việc nhảy từ đỉnh này sang đỉnh kề bên có giá trị cao hơn, giống như một người leo núi men theo các gờ đá để lên đỉnh cao nhất một cách nhanh chóng nhất!
  
  Thuật toán Simplex của Dantzig đã giúp Cầu hàng không Berlin vận chuyển thành công hơn 2,3 triệu tấn hàng hóa, đánh bại cuộc phong tỏa mà không cần nổ một phát súng nào. Tạp chí *Computing in Science & Engineering* đã bình chọn Simplex là một trong 10 thuật toán vĩ đại nhất của thế kỷ XX!
]

#hook-box(title: "Tiệm Bánh Mì Khởi Nghiệp: Tại sao Tiền nhiều nhất luôn nằm ở Đỉnh nhọn?")[
  Thầy cầm chiếc bánh mì kẹp thịt giơ lên trước lớp:
  
  *“Một bạn cựu học sinh trường ta mở tiệm bánh mì khởi nghiệp: Bạn ấy bán Bánh mì thịt nướng ($x$, lãi 10.000đ/ổ) và Bánh mì pate trứng ($y$, lãi 8.000đ/ổ).*
  *Bạn ấy bị giới hạn bởi 3 rào cản bất đẳng thức:*
  - Tiền vốn mua nguyên liệu mỗi ngày: $20.000 x + 15.000 y <= 1.200.000$ đ.
  - Thời gian đứng nướng bánh của một mình bạn ấy: $3x + 2y <= 180$ phút.
  - Lò nướng chỉ chứa tối đa: $x + y <= 80$ ổ.
  
  *Biểu thức lợi nhuận là: $F(x, y) = 10x + 8y$ (nghìn đồng).*
  *Làm thế nào để bạn ấy kiếm được nhiều tiền nhất mỗi ngày mà không bị kiệt sức sập tiệm?”*
  
  Thầy vẽ miền ngũ giác lồi nghiệm lên bảng với 5 đỉnh nhọn: $O(0; 0)$, $A(0; 60)$, $B(20; 50)$, $C(40; 25)$, $D(60; 0)$.
  
  Thầy tính giá trị lợi nhuận $F(x, y)$ tại đúng 5 đỉnh:
  - Tại $O(0; 0)$: $F = 0$ đ (đóng cửa ngủ).
  - Tại $A(0; 60)$: $F = 480.000$ đ.
  - Tại $B(20; 50)$: $F = 10(20) + 8(50) = 600.000$ đ.
  - Tại $C(40; 25)$: $F = 10(40) + 8(25) = 600.000$ đ.
  - Tại $D(60; 0)$: $F = 600.000$ đ.
  
  *Kết luận thần kỳ:* "Các em thấy không? Điểm kiếm nhiều tiền nhất KHÔNG BAO GIỜ nằm lơ lửng ở giữa phòng khách! Nó luôn nằm ở các ĐỈNH NHỌN hoặc mép biên của miền đa giác lồi! Đó chính là bài học quản trị kinh doanh triệu đô mà các em đang học ngay trong tiết Toán 10 hôm nay!"
]

#deep-dive-box(title: "Biểu đồ Voronoi: Phân chia Lãnh thổ Không gian trong AI & Game 3D")[
  Khi các em bật ứng dụng Grab hay ShopeeFood trên điện thoại, hệ thống làm thế nào để tự động tìm xem *Tài xế nào gần bạn nhất* hoặc *Quán trà sữa nào gần bạn nhất* giữa hàng triệu điểm trên bản đồ Hà Nội?
  
  Họ sử dụng *Biểu đồ Voronoi (Voronoi Diagram)*:
  - Cho $n$ điểm mầm (sites) trên mặt phẳng.
  - Với mỗi điểm $P_i$, vùng Voronoi $V(P_i)$ là tập hợp tất cả các điểm trên mặt phẳng gần $P_i$ hơn bất kỳ điểm nào khác:
    $ V(P_i) = { X in RR^2 | d(X, P_i) <= d(X, P_j), forall j != i } $
  - Mỗi điều kiện $d(X, P_i) <= d(X, P_j)$ chính là *MỘT NỬA MẶT PHẲNG giới hạn bởi đường trung trực của đoạn $P_i P_j$!*
  - Do đó, mỗi vùng Voronoi chính là một *ĐA GIÁC LỒI sinh ra từ một Hệ Bất Phương Trình Bậc Nhất Hai Ẩn lớp 10!*
  
  Biểu đồ Voronoi được ứng dụng trong đồ họa sinh thế giới mở của game Minecraft, mô phỏng sự phát triển của tế bào ung thư trong sinh học và quy hoạch vị trí đặt các trạm cứu hỏa trong đô thị thông minh!
]


#inquiry-box(title: "Nhiệm vụ Nghiên cứu: Lập trình Giải Bài toán Tối ưu bằng SciPy Python")[
  Hãy viết một đoạn mã Python sử dụng thư viện `scipy.optimize.linprog` để giải bài toán tiệm bánh mì:
  ```python
  from scipy.optimize import linprog

  # Hàm mục tiêu: Maximize 10x + 8y <=> Minimize -10x - 8y
  c = [-10, -8]

  # Các bất phương trình ràng buộc Ax <= b
  A = [
      [20, 15],  # 20x + 15y <= 1200
      [3, 2],    # 3x + 2y <= 180
      [1, 1],    # x + y <= 80
  ]
  b = [1200, 180, 80]

  # Biến số x, y >= 0
  res = linprog(c, A_ub=A, b_ub=b, bounds=(0, None), method='highs')

  print(f"Trạng thái tối ưu: {res.message}")
  print(f"Số bánh mì thịt nướng cần làm (x): {res.x[0]:.1f}")
  print(f"Số bánh mì pate trứng cần làm (y): {res.x[1]:.1f}")
  print(f"Lợi nhuận cực đại mỗi ngày: {-res.fun:.1f} nghìn đồng")
  ```
  Học sinh lớp 10 hoàn toàn có thể chạy đoạn mã này trên trình duyệt Google Colab để thấy sức mạnh tối ưu hóa của Đại số lớp 10!
]

#v(1em)

== CHUYÊN KHẢO MỞ RỘNG: TỐI ƯU HÓA DANH MỤC ĐẦU TƯ CỦA HARRY MARKOWITZ (NOBEL KINH TẾ 1990)

#story-box(
  title: "Harry Markowitz 1952: Không Bỏ Tất Cả Trứng Vào Một Giỏ Dưới Góc Nhìn Toán Học",
  author: "Harry Markowitz (Nobel Kinh tế 1990, 1927 – 2023)",
)[
  Trước thập niên 1950, phố Wall đầu tư cổ phiếu hoàn toàn theo linh cảm hoặc săn lùng những công ty có lợi nhuận cao nhất mà bỏ qua rủi ro. Năm 1952, chàng nghiên cứu sinh 25 tuổi *Harry Markowitz* tại Đại học Chicago đã làm thay đổi mãi mãi nền tài chính toàn cầu bằng bài báo *“Portfolio Selection”*.
  
  Markowitz chỉ ra rằng: Lợi nhuận kỳ vọng của một danh mục đầu tư là một tổ hợp tuyến tính của các tỉ trọng $x_1, x_2, dots, x_n$:
  $ E(R_p) = sum_(i=1)^n x_i E(R_i) $
  với các ràng buộc bất phương trình bậc nhất bắt buộc:
  - Tổng tỉ trọng nguồn vốn: $x_1 + x_2 + dots + x_n = 1$.
  - Không được bán khống (nếu cấm đòn bẩy): $x_i >= 0, quad forall i = 1, dots, n$.
  - Giới hạn phân bổ tối đa cho một ngành rủi ro: $x_i <= 0,3$ ($30\%$).
  
  Tất cả các ràng buộc trên xác định một *Miền đa diện lồi nhiều chiều* trong không gian đầu tư. Mục tiêu của nhà đầu tư thông minh là tìm một vectơ tỉ trọng nằm trong miền lồi này sao cho tối thiểu hóa rủi ro (phương sai danh mục) tại một mức lợi nhuận mục tiêu cho trước. Công trình này đã khai sinh ra *Lý thuyết Danh mục Đầu tư Hiện đại (MPT - Modern Portfolio Theory)* và mang lại cho Markowitz giải Nobel Kinh tế năm 1990!
]

#tech-box(title: "Tối Ưu Hóa Vị Trí Trạm Tiếp Sóng Di Động 5G Bằng Đa Giác Voronoi")[
  Trong quy hoạch mạng di động thế hệ mới 5G, các nhà mạng (Viettel, VNPT) phải đối mặt với bài toán kinh tế nan giải:
  - Sóng 5G băng tần cao (mmWave) có tốc độ siêu nhanh (hàng Gbps) nhưng độ suy hao khoảng cách rất lớn, bán kính phủ sóng của mỗi trạm Microcell chỉ khoảng $200 - 300 "m"$.
  - Lắp quá nhiều trạm thì chi phí xây dựng và tiền điện làm phá sản doanh nghiệp.
  - Lắp quá ít trạm thì xuất hiện "vùng chết không có sóng" (Dead Zones).
  
  *Giải pháp hình học:*
  Kỹ sư viễn thông mô hình hóa mặt bằng đô thị thành một biểu đồ Voronoi. Vị trí đặt anten là các điểm mầm. Biên giới chuyển giao cuộc gọi khi người dùng di chuyển (Handover Boundary) chính là các đoạn thẳng ranh giới của đa giác Voronoi — nghiệm của phương trình hai trạm có cường độ tín hiệu bằng nhau. Nhờ giải thuật quy hoạch tập lồi, máy tính tự động tối ưu hóa số lượng trạm BTS ít nhất mà vẫn bảo đảm độ phủ sóng $99,99\%$ toàn thành phố!
]

#misconception-box(
  concept: "Cạm Bẫy Vẽ Đường Ranh Giới: Nét Liền vs Nét Đứt & Bẫy Lấy Cả Điểm Biên",
  misconception: "Khi biểu diễn miền nghiệm của bất phương trình ax + by + c > 0 (dấu > nghiêm ngặt), học sinh thường vẽ đường thẳng ranh giới bằng nét liền và vẫn tính các điểm nằm trên đường thẳng vào miền nghiệm.",
  correction: "Nếu dấu là > hoặc < (bất phương trình ngặt), các điểm nằm trên đường thẳng ranh giới ax + by + c = 0 KHÔNG THỎA MÃN BPT (vì 0 không thể lớn hơn 0)! Bắt buộc phải vẽ đường thẳng bằng NÉT ĐỨT (Dashed Line) để tuyên bố loại bỏ biên. Chỉ khi dấu là ≥ hoặc ≤ thì mới vẽ NÉT LIỀN (Solid Line) và lấy cả đường biên!",
  remedy: "Quy tắc bút chì: 'Có dấu bằng (=) thì Nét Liền nhận biên; Không có dấu bằng thì Nét Đứt đuổi biên!'"
)

#pagebreak()
'''
