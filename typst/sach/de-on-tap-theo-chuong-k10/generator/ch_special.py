# -*- coding: utf-8 -*-

CONTENT = r'''= PHẦN CHUYÊN ĐỀ NÂNG CAO: BA ĐỈNH CAO TRI THỨC TOÁN HỌC LỚP 10

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: 3 Chuyên đề Học tập Toán 10 Chuyên sâu (Bộ sách Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo): Hệ ba phương trình bậc nhất ba ẩn, Phương pháp quy nạp toán học & Ba đường Conic mở rộng trong cơ học thiên thể.
]

== CHUYÊN ĐỀ 1: HỆ BA PHƯƠNG TRÌNH BẬC NHẤT BA ẨN & THUẬT TOÁN KHỬ GAUSS

Hệ hai phương trình bậc nhất hai ẩn cho ta giao điểm của hai đường thẳng trong mặt phẳng 2D. Nhưng khi bước lên không gian ba chiều với 3 ẩn số $(x, y, z)$, mỗi phương trình bậc nhất:
$ a x + b y + c z = d $
mô tả một *Mặt phẳng vô tận trong không gian!*

Giải hệ ba phương trình bậc nhất ba ẩn chính là bài toán tìm *Giao điểm chung duy nhất của 3 mặt phẳng* — giống như tìm điểm góc nơi hai bức tường và trần nhà gặp nhau trong căn phòng! Và vũ khí tối thượng để giải quyết hệ phương trình này chính là *Thuật toán khử Gauss (Gaussian Elimination)*.

#story-box(
  title: "Từ 'Cửu Chương Toán Thuật' cổ đại đến Thuật toán Khử Gauss",
  author: "Lưu Huy (Trung Quốc, thế kỷ III) & Carl Friedrich Gauss (Đức, 1777 – 1855)",
)[
  Hơn 2.000 năm trước, trong cuốn cổ thư kinh điển *“Cửu Chương Toán Thuật”* thời nhà Hán, các học giả phương Đông đã dùng những que tính màu đỏ (số dương) và màu đen (số âm) xếp thành một bảng ma trận vuông trên bàn cờ để giải bài toán về các loại lúa mùa. Đến thế kỷ III, nhà toán học *Lưu Huy* đã chú giải và hoàn thiện phương pháp khử dần các ẩn số từ trên xuống dưới — được gọi là phương pháp *“Phương trình”*.
  
  Mười lăm thế kỷ sau, nhà toán học thiên tài Carl Friedrich Gauss khi nghiên cứu quỹ đạo của tiểu hành tinh Ceres đã độc lập phát minh lại và hoàn thiện phương pháp này thành một thuật toán đại số ma trận chặt chẽ: *Dùng các phép biến đổi sơ cấp trên dòng để biến ma trận hệ số về dạng bậc thang tam giác!*
  
  Bằng cách đưa hệ phương trình về dạng tam giác, ẩn số cuối cùng $z$ sẽ hiển lộ ngay lập tức. Sau đó, ta chỉ việc thế ngược từ dưới lên trên để tìm $y$ và $x$ một cách êm ái nhẹ nhàng. Ngày nay, thuật toán khử Gauss là một trong 10 thuật toán có tầm ảnh hưởng lớn nhất đối với toàn bộ nền văn minh máy tính của thế kỷ XX và XXI!
]

#hook-box(title: "Cân bằng phản ứng Hóa học Oxy hóa - Khử siêu phức tạp")[
  Thầy viết lên bảng một phương trình phản ứng hóa học hữu cơ hoặc vô cơ phức tạp:
  $ x K_2 C r_2 O_7 + y F e S O_4 + z H_2 S O_4 arrow a K_2 S O_4 + b C r_2 (S O_4)_3 + c F e_2 (S O_4)_3 + d H_2 O $
  
  *“Nhiều bạn học sinh lớp 10 học Hóa thường ngồi 'đoán mò' hoặc nhẩm nhẩm hệ số cả tiếng đồng hồ mà vẫn sai be bét! Nhưng đối với một người học Toán Chuyên đề 1, đây chỉ là một bài toán con nít!*
  
  *Hãy thiết lập hệ phương trình bảo toàn nguyên tố:*
  - Bảo toàn Kali ($K$): $2x = 2a arrow x = a$.
  - Bảo toàn Crom ($C r$): $2x = 2b arrow x = b$.
  - Bảo toàn Sắt ($F e$): $y = 2c$.
  - Bảo toàn Lưu huỳnh ($S$): $y + z = a + 3b + 3c$.
  - Bảo toàn Hydro ($H$): $2z = 2d arrow z = d$.
  - Bảo toàn Oxy ($O$): $7x + 4y + 4z = 4a + 12b + 12c + d$.
  
  *Chọn $x = 1$, ta có ngay một hệ ba phương trình bậc nhất ba ẩn cho $y, z, c$! Bấm máy tính Casio hoặc chạy khử Gauss trong 3 giây, ta có ngay bộ hệ số nguyên tối giản: $(1, 6, 7, 1, 1, 3, 7)!$*
  
  *Đó chính là sức mạnh bá đạo của Toán học: Biến sự rối rắm của Hóa học thành sự tường minh của Đại số tuyến tính!”*
]

#tech-box(title: "Mô hình Leontief Nobel Kinh tế & Thuật toán Google PageRank")[
  - *Mô hình Cân bằng Kinh tế Vĩ mô của Wassily Leontief (Giải Nobel Kinh tế 1973)*: Làm sao một chính phủ biết được: Nếu ngành giao thông vận tải muốn tăng trưởng $10\%$, thì ngành điện lực phải tăng bao nhiêu megawatt, ngành khai thác than phải tăng bao nhiêu tấn, và ngành sản xuất thép phải tăng bao nhiêu để toàn bộ nền kinh tế quốc gia không bị khủng hoảng thiếu hụt? Nhà kinh tế học Wassily Leontief đã mô hình hóa toàn bộ nền kinh tế quốc gia thành một *Hệ phương trình ma trận Input-Output khổng lồ $(I - A) X = D$*. Giải hệ phương trình này bằng thuật toán khử Gauss giúp các quốc gia điều hành kế hoạch kinh tế vĩ mô tránh được các thảm họa lạm phát và đứt gãy chuỗi cung ứng!
  - *Thuật toán Google PageRank của Larry Page & Sergey Brin*: Năm 1998, hai chàng sinh viên đại học Stanford đã thành lập Google dựa trên thuật toán PageRank. Họ coi mỗi trang web là một biến số $x_i$, và mỗi liên kết (link) trỏ giữa các trang web là một phương trình bậc nhất. Giải hệ phương trình hàng tỷ ẩn số này bằng phương pháp lặp Gauss đã giúp Google xếp hạng đúng trang web uy tín nhất, biến Google thành tập đoàn công nghệ nghìn tỷ USD thống trị thế giới!
]

#deep-dive-box(title: "Mô Hình Nhập - Xuất Input - Output Leontief Trong Nền Kinh Tế Ba Ngành")[
  Xét một nền kinh tế quốc gia gồm 3 ngành mũi nhọn:
  1. Ngành Năng lượng ($X_1$)
  2. Ngành Nông nghiệp & Thực phẩm ($X_2$)
  3. Ngành Chế tạo Cơ khí ($X_3$)
  
  Để sản xuất ra 1 đơn vị giá trị sản phẩm của chính mình, mỗi ngành phải tiêu thụ một lượng sản phẩm đầu vào từ hai ngành kia và từ chính bản thân nó. Ta có Ma trận hệ số kỹ thuật đầu vào $A$:
  $ A = mat(
    0.2, 0.3, 0.1;
    0.1, 0.1, 0.2;
    0.2, 0.1, 0.3
  ) $
  Giả sử nhu cầu tiêu dùng cuối cùng của toàn xã hội đối với 3 ngành lần lượt là: $D = mat(100; 80; 120)$ (tỷ đồng).
  
  Phương trình cân bằng tổng sản lượng toàn ngành thỏa mãn hệ ma trận:
  $ X = A X + D quad arrow quad (I - A) X = D $
  với $I$ là ma trận đơn vị cấp 3:
  $ mat(
    0.8, -0.3, -0.1;
    -0.1, 0.9, -0.2;
    -0.2, -0.1, 0.7
  ) mat(X_1; X_2; X_3) = mat(100; 80; 120) $
  
  *Thực thi Thuật toán Khử Gauss giải hệ:*
  - Dòng 1: $0.8 X_1 - 0.3 X_2 - 0.1 X_3 = 100$
  - Dùng $X_1$ để triệt tiêu các hệ số ở Dòng 2 và Dòng 3, đưa ma trận về dạng bậc thang tam giác trên.
  - Sau đó giải ngược từ dưới lên ta thu được nghiệm chính xác: $X_1 approx 248.5$ tỷ, $X_2 approx 173.8$ tỷ, $X_3 approx 266.3$ tỷ đồng!
  
  Chính phủ dựa vào đáp số toán học này để phân bổ nguồn lực quốc gia, bảo đảm ngành năng lượng và cơ khí cung ứng đủ nhiên liệu cho nông nghiệp mà không xảy ra tình trạng thiếu hụt hay khủng hoảng thừa!
]

#misconception-box(
  title: "Cạm bẫy Hình học của Hệ 3 phương trình: Tại sao máy tính báo 'Vô nghiệm' hay 'Vô số nghiệm'?",
  misconception: "Hệ 3 phương trình 3 ẩn thì lúc nào cũng có đúng một nghiệm duy nhất $(x; y; z)$!",
  correction: "Mỗi phương trình là một mặt phẳng trong không gian 3D. 3 mặt phẳng có thể song song nhau (vô nghiệm), hoặc cùng cắt nhau theo một đường thẳng chung (vô số nghiệm phụ thuộc 1 tham số), hoặc tạo thành một hình lăng trụ tam giác không có điểm chung nào!"
)[
  Khi khử Gauss, nếu xuất hiện dòng $0x + 0y + 0z = k$ ($k != 0$), hệ vô nghiệm. Nếu xuất hiện dòng $0x + 0y + 0z = 0$, hệ có vô số nghiệm phụ thuộc tham số tự do.
  
  *Hình ảnh trực quan:*
  - Ba trang của một cuốn sách cùng dính vào chiếc gáy sách: Đó là trường hợp *Vô số nghiệm* — mọi điểm nằm trên đường thẳng gáy sách đều thỏa mãn cả 3 phương trình!
  - Ba mặt của một chiếc lều hình tam giác (hai mái lều và nền đất): Mỗi cặp 2 mặt cắt nhau theo một giao tuyến song song, nhưng cả 3 mặt KHÔNG CÓ ĐIỂM CHUNG NÀO! Đó là trường hợp hệ *Vô nghiệm* dù từng cặp phương trình vẫn có giao tuyến!
]

#dialogue-box(title: "Đối thoại Socrates: Bản chất của các Phép biến đổi Dòng Khử Gauss")[
  *Socrates:* Này bạn trẻ, khi ngươi nhân cả hai vế của một phương trình với số 5, mặt phẳng biểu diễn nó trong không gian có bị xoay đi hay dịch chuyển đi đâu không?
  
  *Học trò:* Dạ thưa thầy, phương trình $2x + y - z = 3$ và $10x + 5y - 5z = 15$ cùng biểu diễn đúng MỘT MẶT PHẲNG DUY NHẤT trong không gian!
  
  *Socrates:* Rất chính xác. Vậy khi ngươi lấy mặt phẳng thứ nhất cộng với mặt phẳng thứ hai để tạo thành một phương trình mới, điều gì xảy ra với giao tuyến của chúng?
  
  *Học trò:* Thưa thầy... mọi điểm nằm trên giao tuyến của hai mặt phẳng cũ đều thỏa mãn cả hai phương trình cũ, nên nó đương nhiên thỏa mãn phương trình tổng mới! Giao tuyến vẫn được giữ nguyên vẹn!
  
  *Socrates:* Xuất sắc! Phép biến đổi sơ cấp trên dòng của Gauss không hề làm xê dịch giao điểm chung của hệ. Nó chỉ xoay các mặt phẳng xung quanh giao tuyến chung đó sao cho các phương trình trở nên song song với các trục tọa độ, biến những mặt phẳng xiên xẹo phức tạp thành những mặt phẳng $z = c$, $y = b$, $x = a$ rõ như ban ngày!
]

#deep-dive-box(title: "Mạng lưới Điện Thông minh (Smart Grid) & Định luật Dòng Kirchhoff")[
  Trong ngành kỹ thuật điện, để tính toán cường độ dòng điện $I_1, I_2, I_3$ chạy qua các nhánh của một mạng lưới điện phức tạp có nhiều nguồn pin và điện trở, các kỹ sư sử dụng hai định luật của Gustav Kirchhoff:
  1. *Định luật Kirchhoff 1 (KCL - Bảo toàn điện tích tại nút):* Tổng các dòng điện đi vào một nút mạng bằng tổng các dòng điện đi ra khỏi nút đó:
     $ sum I_("vào") = sum I_("ra") $
  2. *Định luật Kirchhoff 2 (KVL - Bảo toàn năng lượng trong mắt lưới):* Tổng đại số các độ giảm thế dọc theo một vòng kín bằng tổng các suất điện động:
     $ sum E_k = sum I_j R_j $
  
  Áp dụng cho một mạch điện gồm 3 vòng kín, ta thu được chính xác một *Hệ 3 phương trình bậc nhất 3 ẩn*. Việc giải nhanh hệ này bằng thuật toán khử Gauss trên các vi điều khiển nhúng giúp các trạm biến áp tự động phân phối điện năng, tránh cháy nổ đường dây khi xảy ra sự cố ngắn mạch!
]

---

== CHUYÊN ĐỀ 2: PHƯƠNG PHÁP QUY NẠP TOÁN HỌC & NHỊ THỨC NEWTON MỞ RỘNG

Làm thế nào để một sinh vật hữu hạn như con người có thể chứng minh một chân lý đúng đắn cho *VÔ HẠN CÁC SỐ TỰ NHIÊN* $n in NN^+$ mà không cần phải kiểm tra từng số một đến hết đời?

*Phương pháp Quy nạp Toán học (Mathematical Induction)* chính là chiếc thang thần kỳ bắc lên vô tận của trí tuệ con người: Chỉ cần kiểm tra chân lý ở bậc thang đầu tiên ($n = 1$), rồi chứng minh rằng hễ bậc thang thứ $k$ đứng vững thì bậc thang thứ $k + 1$ tất yếu cũng phải đứng vững, toàn bộ vô hạn bậc thang phía sau sẽ tự động đổ sụp theo *Hiệu ứng Domino* hoàn hảo!

#story-box(
  title: "Francesco Maurolico & Nguồn gốc của Nguyên lý Domino",
  author: "Francesco Maurolico (Ý, 1494 – 1575)",
)[
  Francesco Maurolico là một tu sĩ dòng Biển Đức và là nhà toán học lừng danh tại đảo Sicilia nước Ý. Năm 1575, trong cuốn sách *“Arithmeticorum Libri Duo”*, ông cần chứng minh một định lý kỳ lạ do Pythagoras phát hiện: *Tổng của $n$ số lẻ đầu tiên luôn bằng một số chính phương:*
  $ 1 + 3 + 5 + ... + (2n - 1) = n^2 $
  
  Maurolico nhận thấy:
  - Với $n = 1$: $1 = 1^2$ (Đúng).
  - Với $n = 2$: $1 + 3 = 4 = 2^2$ (Đúng).
  - Với $n = 3$: $1 + 3 + 5 = 9 = 3^2$ (Đúng).
  
  Nhưng làm sao biết nó có đúng cho $n = 1.000.000$ hay không? Maurolico đã sáng tạo ra lập luận quy nạp chặt chẽ đầu tiên trong lịch sử: Giả sử định lý đúng cho số $k$, tức là tổng $k$ số lẻ đầu tiên bằng $k^2$. Khi ta cộng thêm số lẻ tiếp theo là $(2k + 1)$:
  $ k^2 + (2k + 1) = (k + 1)^2 $
  
  Công thức lập tức đúng cho số $k + 1$! Maurolico kết luận: Chân lý này giống như một hàng quân cờ domino dựng đứng nối tiếp nhau đến vô tận: hễ quân cờ đầu tiên ngã vào quân cờ thứ hai, và mỗi quân cờ đều ngã vào quân cờ kế tiếp, thì hàng triệu tỷ quân cờ phía sau đều phải ngã rạp! Bằng hai bước nhảy tư duy đơn sơ đó, Maurolico đã trao cho loài người quyền năng nắm trọn sự Vô hạn trong lòng bàn tay!
]

#story-box(
  title: "Nghịch lý 'Mọi con ngựa đều cùng màu' của George Pólya",
  author: "George Pólya (Hungary - Mỹ, 1887 – 1985)",
)[
  George Pólya — tác giả của cuốn sách kinh điển *“How to Solve It”* (Sáng tạo Toán học) — đã từng đưa ra một bài toán nghịch lý nổi tiếng để cảnh báo học sinh về cạm bẫy trong bước chuyển quy nạp:
  
  *“Chứng minh rằng: Mọi con ngựa trên Trái Đất đều có cùng một màu lông!*
  - Bước cơ sở ($n = 1$): Một đàn ngựa có 1 con thì đương nhiên con ngựa đó cùng màu với chính nó (Đúng hiển nhiên).
  - Bước quy nạp: Giả sử mọi đàn ngựa gồm $k$ con đều có cùng màu. Xét một đàn ngựa gồm $k + 1$ con: `{H_1, H_2, ..., H_k, H_(k+1)}`.
    + Bỏ con ngựa $H_(k+1)$ ra: Đàn còn lại $k$ con `{H_1, ..., H_k}` có cùng màu theo giả thiết quy nạp.
    + Bỏ con ngựa $H_1$ ra: Đàn còn lại $k$ con `{H_2, ..., H_(k+1)}` cũng có cùng màu.
    + Hai nhóm này giao nhau ở các con ngựa giữa `{H_2, ..., H_k}`. Do đó, con $H_1$ và con $H_(k+1)$ đều phải có cùng màu với các con ngựa ở giữa!
  $arrow$ Vậy mọi đàn $k + 1$ con đều cùng màu! Theo nguyên lý quy nạp, mọi con ngựa trên Trái Đất đều cùng màu!”
  
  Học sinh sẽ sững sờ: Lập luận nghe có vẻ rất chặt chẽ, nhưng rõ ràng ngựa ngoài đời có con màu trắng, con màu đen, con màu nâu! Sai lầm chết người nằm ở đâu?
  
  Pólya chỉ ra rằng: Lập luận chỉ đúng nếu hai nhóm ngựa có phần giao nhau ở giữa! Nhưng khi bước từ $k = 1$ sang $k = 2$: Đàn 2 con `{H_1, H_2}`, khi bỏ $H_2$ ra thì còn `{H_1}`, bỏ $H_1$ ra thì còn `{H_2}` — hai nhóm này HOÀN TOÀN KHÔNG CÓ CON NGỰA NÀO Ở GIỮA ĐỂ LÀM CẦU NỐI! Bước chuyển từ $1$ lên $2$ bị gãy gập!
  
  *Bài học sư phạm sâu sắc:* Quy nạp toán học là một cỗ máy kỳ diệu, nhưng chỉ cần một vết nứt nhỏ ở bước chuyển tiếp, toàn bộ chuỗi domino sẽ sụp đổ thành trò hề ngụy biện!
]

#deep-dive-box(title: "Quy Nạp Mạnh (Strong Induction) & Định Lý Cơ Bản Của Số Học")[
  Trong quy nạp thông thường, ta chỉ dùng giả thiết bước $k$ để suy ra bước $k+1$. Nhưng có những chân lý đòi hỏi ta phải mượn sức mạnh của *TOÀN BỘ CÁC BƯỚC ĐI TRƯỚC ĐÓ*:
  - Bước cơ sở: Mệnh đề đúng cho $n = 2$.
  - Bước quy nạp mạnh: Giả sử mệnh đề đúng cho MỌI số nguyên $m$ thỏa mãn $2 <= m <= k$. Chứng minh mệnh đề đúng cho $k + 1$.
  
  *Chứng minh Định lý Cơ bản của Số học (Mọi số nguyên $n >= 2$ đều phân tích được thành tích các số nguyên tố):*
  - Với $n = 2$: 2 là số nguyên tố (xong).
  - Giả sử mọi số từ 2 đến $k$ đều phân tích được thành số nguyên tố. Xét số $k + 1$:
    + Nếu $k + 1$ là số nguyên tố: xong!
    + Nếu $k + 1$ là hợp số: nó phân tích được thành $k + 1 = a times b$ với $2 <= a, b <= k$.
    + Theo giả thiết quy nạp mạnh, cả $a$ và $b$ đều phân tích được thành tích các số nguyên tố. Do đó, $k + 1 = a times b$ cũng phân tích được thành tích các số nguyên tố!
  
  Định lý cơ bản của Số học được chứng minh trọn vẹn chỉ trong vài dòng ngắn ngủi nhờ sức mạnh của Quy nạp mạnh!
]

#hook-box(title: "Dãy số Fibonacci & Tỉ lệ Vàng Phi trong Kiến trúc và Vũ trụ")[
  Thầy vẽ một chuỗi số lên bảng: $1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89...$
  
  *“Mỗi số sau bằng tổng hai số trước: $F_(n+1) = F_n + F_(n-1)$. Đây là Dãy số Fibonacci huyền thoại!*
  
  *Khi các em lấy tỉ số giữa hai số liên tiếp $F_(n+1) / F_n$, chuỗi tỉ số này sẽ hội tụ về một con số thần thánh:*
  $ phi = (1 + sqrt(5)) / 2 approx 1,6180339887... $
  
  *Đó chính là TỈ LỆ VÀNG (The Golden Ratio)!*
  - Các kiến trúc sư Hy Lạp cổ đại đã dùng tỉ lệ vàng để xây nên Đền Parthenon uy nghi trên đỉnh đồi Acropolis.
  - Họa sĩ thiên tài Leonardo da Vinci dùng tỉ lệ vàng để vẽ nên nụ cười bí ẩn của nàng Mona Lisa.
  - Các cánh hoa hướng dương, mắt quả dứa, vỏ ốc anh vũ Nautilus, và thậm chí các nhánh xoắn ốc của các thiên hà xa xôi hàng tỷ năm ánh sáng đều uốn lượn theo đúng tỉ số Fibonacci này!
  
  *Bằng phương pháp quy nạp toán học lớp 10, chúng ta có thể chứng minh Công thức Binet tuyệt mỹ để tìm số Fibonacci thứ $n$ mà không cần tính từng số trước đó:*
  $ F_n = 1/sqrt(5) [ ((1 + sqrt(5))/2)^n - ((1 - sqrt(5))/2)^n ] $
  *Toán học chính là mã nguồn bí mật mà Thượng đế đã dùng để lập trình nên vẻ đẹp của toàn bộ vũ trụ này!”*
]

#misconception-box(
  title: "Cạm bẫy 'Quy nạp không hoàn toàn' & Ảo tưởng Con thiên nga đen",
  misconception: "Kiểm tra thấy công thức đúng cho $n = 1, 2, 3, ..., 100$ thì chắc chắn nó sẽ đúng cho mọi số tự nhiên $n$!",
  correction: "Trong Toán học, hàng triệu ví dụ đúng KHÔNG THỂ thay thế một lời chứng minh quy nạp chặt chẽ! Chỉ cần một phản ví dụ duy nhất ở bước $n$ nào đó, mệnh đề sẽ sụp đổ hoàn toàn!"
)[
  *Ví dụ kinh điển của thiên tài Leonhard Euler:*
  Xét đa thức tạo số nguyên tố: $P(n) = n^2 + n + 41$.
  - Với $n = 0$: $P(0) = 41$ (Số nguyên tố).
  - Với $n = 1$: $P(1) = 43$ (Số nguyên tố).
  - Thử liên tục từ $n = 0$ đến $n = 39$: Tất cả $40$ số đầu tiên tạo ra ĐỀU LÀ SỐ NGUYÊN TỐ TUYỆT ĐỐI!
  
  Một người làm khoa học thực nghiệm có thể vội vã kết luận rằng công thức này luôn cho số nguyên tố. Nhưng đến $n = 40$:
  $ P(40) = 40^2 + 40 + 41 = 40(40 + 1) + 41 = 40 times 41 + 41 = 41 times 41 = 1.681 $
  đây là một hợp số chia hết cho 41! Và tại $n = 41$: $P(41) = 41^2 + 41 + 41 = 41 times 43$, lại là hợp số!
  
  *Bài học:* Kiểm tra cụ thể chỉ là thăm dò trực giác. Chỉ có quy nạp toán học với giả thiết bước $k$ suy ra bước $k+1$ mới bảo đảm được tính vĩnh cửu của chân lý!
]

#dialogue-box(title: "Đối thoại Socrates: Lát gạch Tromino khuyết Golomb bằng Quy nạp Hình học")[
  *Socrates:* Này bạn trẻ, ta có một bàn cờ kích thước $2^n times 2^n$ ô vuông. Ta rút bỏ ngẫu nhiên ĐÚNG 1 Ô VUÔNG ở bất kỳ vị trí nào trên bàn cờ. Ngươi có thể dùng các viên gạch hình chữ L (gồm 3 ô vuông ghép lại, gọi là Tromino) để lát kín khít toàn bộ phần bàn cờ còn lại mà không làm đè lên nhau không?
  
  *Học trò:* Thưa thầy, với bàn cờ $2 times 2$ (tức $n = 1$), có 4 ô mà bỏ 1 ô thì còn đúng 3 ô. Một viên gạch chữ L đặt vào là vừa khít luôn!
  
  *Socrates:* Đúng! Đó là bước cơ sở $n = 1$. Bây giờ giả sử ngươi đã lát được cho bàn cờ $2^k times 2^k$. Khi nâng lên bàn cờ $2^(k+1) times 2^(k+1)$, nó gấp 4 lần kích thước bàn cờ cũ. Ngươi chia nó thành 4 góc vuông bằng nhau, mỗi góc là một bàn cờ $2^k times 2^k$. Ô bị khuyết nằm ở 1 trong 4 góc đó. Vậy 3 góc còn lại chưa bị khuyết thì làm sao áp dụng giả thiết quy nạp?
  
  *Học trò:* Ôi... 3 góc đó còn nguyên vẹn, chúng đâu có ô khuyết nào để dùng viên gạch L!
  
  *Socrates:* Hãy nhìn vào TRUNG TÂM nơi 4 góc gặp nhau! Nếu ta đặt MỘT VIÊN GẠCH CHỮ L duy nhất chiếm đúng 3 ô trung tâm thuộc về 3 góc chưa bị khuyết đó... thì điều gì xảy ra?
  
  *Học trò:* TRỜI ƠI! Khi đó CẢ 4 GÓC đều có đúng một ô bị chiếm (một góc có ô khuyết ban đầu, 3 góc kia có 3 ô bị viên gạch trung tâm chiếm)! Mỗi góc trở thành một bài toán $2^k times 2^k$ có đúng một ô khuyết!
  
  *Socrates:* Và theo giả thiết quy nạp, cả 4 góc đều lát kín khít hoàn hảo! Ngươi thấy chưa: Quy nạp không chỉ là phép tính đại số khô khan, mà là nghệ thuật kiến trúc hình học siêu phàm!
]

#deep-dive-box(title: "Bài toán Tháp Hà Nội & Ngày Tận thế của Các Nhà Sư")[
  Năm 1883, nhà toán học Pháp Édouard Lucas phát minh ra trò chơi nổi tiếng mang tên *Tháp Hà Nội (Tower of Hanoi)*:
  
  Có 3 chiếc cọc $A, B, C$. Tại cọc $A$ có $n$ chiếc đĩa bằng vàng có đường kính khác nhau xếp chồng từ lớn đến nhỏ. Luật chơi:
  - Mỗi lần chỉ được chuyển đúng 1 chiếc đĩa từ cọc này sang cọc khác.
  - Không bao giờ được đặt đĩa lớn hơn lên trên đĩa nhỏ hơn.
  
  *Hỏi:* Cần tối thiểu bao nhiêu bước di chuyển để chuyển toàn bộ $n$ đĩa từ cọc $A$ sang cọc $C$?
  
  *Lời giải quy nạp tuyệt mỹ:*
  Gọi $H_n$ là số bước tối thiểu để chuyển $n$ đĩa.
  - Để chuyển được đĩa lớn nhất đáy cùng sang cọc $C$, ta bắt buộc phải chuyển $n - 1$ đĩa phía trên sang cọc trung gian $B$ (tốn $H_(n-1)$ bước).
  - Chuyển đĩa lớn nhất từ $A$ sang $C$ (tốn 1 bước).
  - Chuyển $n - 1$ đĩa từ cọc $B$ sang cọc $C$ chồng lên đĩa lớn nhất (tốn $H_(n-1)$ bước).
  $arrow$ Hệ thức truy hồi: $H_n = 2 H_(n-1) + 1$, với $H_1 = 1$.
  
  Bằng quy nạp toán học, ta chứng minh công thức đóng:
  $ H_n = 2^n - 1 $
  
  *Truyền thuyết về Ngày Tận Thế:* Các nhà sư ở một ngôi chùa cổ được giao nhiệm vụ di chuyển một tháp gồm $n = 64$ chiếc đĩa vàng ròng. Giả sử mỗi giây các nhà sư di chuyển được 1 đĩa không ngừng nghỉ ngày đêm:
  $ H_(64) = 2^(64) - 1 = 18.446.744.073.709.551.615 "bước"! $
  Thời gian cần thiết là:
  $ (2^(64) - 1) / (3600 times 24 times 365,25) approx 584.942.417.355 "năm (hơn 584 tỷ năm)!" $
  Trong khi tuổi của toàn bộ Vũ trụ chúng ta hiện nay mới chỉ khoảng $13,8$ tỷ năm! Khi các nhà sư chuyển xong chiếc đĩa cuối cùng thì Mặt Trời đã tàn lụi từ rất lâu. Đó chính là sự bùng nổ khủng khiếp của hàm số mũ $2^n$ được khám phá qua quy nạp toán học!
]

#tech-box(title: "Kiểm chứng Tính đúng đắn của Thuật toán Đệ quy trong Khoa học Máy tính")[
  - *Thuật toán Đệ quy trong phần mềm*: Khi các em viết một hàm đệ quy trong ngôn ngữ Python hay Java (như thuật toán sắp xếp nhanh QuickSort hay tìm kiếm nhị phân Binary Search), hàm số liên tục gọi lại chính nó với kích thước bài toán nhỏ hơn. Làm sao kỹ sư chứng minh được thuật toán đó sẽ dừng lại và cho kết quả đúng $100\%$ mà không gây tràn ngăn xếp (Stack Overflow)? Họ sử dụng chính xác *Phương pháp Quy nạp Toán học*: Bước neo chính là trường hợp dừng ($n = 1$), và bước đệ quy chính là bước chuyển quy nạp từ $k$ lên $k + 1$!
]

---

== CHUYÊN ĐỀ 3: BA ĐƯỜNG CONIC & CƠ HỌC THIÊN THỂ VŨ TRỤ

Chuyên đề 3 là khúc khải hoàn ca tráng lệ nhất của chương trình Toán lớp 10: đưa ba đường Conic từ mặt phẳng trang giấy bay thẳng vào không gian vũ trụ bao la, giải mã chuyển động của các hành tinh, tàu con thoi và kính viễn vọng không gian.

#story-box(
  title: "Lời trăn trối của Tycho Brahe & Vinh quang bất tử của Johannes Kepler",
  author: "Tycho Brahe (Đan Mạch, 1546 – 1601) & Johannes Kepler (Đức, 1571 – 1630)",
)[
  Tycho Brahe là nhà quý tộc thiên văn giàu có người Đan Mạch. Ông nổi tiếng với chiếc mũi giả bằng hợp kim vàng bạc (do bị chém đứt mũi trong một cuộc quyết đấu kiếm thời trẻ) và tòa lâu đài Uraniborg — đài quan sát thiên văn tối tân nhất châu Âu trước khi có kính viễn vọng. Suốt hơn 30 năm, đêm nào Tycho cũng đo đạc vị trí các vì sao với độ chính xác vô tiền khoáng hậu.
  
  Mùa thu năm 1601, trên giường hấp hối tại Prague, Tycho nắm chặt bàn tay của người trợ lý trẻ nghèo khó Johannes Kepler. Trong cơn mê sảng, ông liên tục lặp lại lời van nài tha thiết:
  *“Kepler à, xin con... Đừng để cuộc đời ta trôi qua vô ích! (Ne frustra vixisse videar!) Hãy dùng kho dữ liệu của ta để tìm ra quy luật của các vì sao!”*
  
  Kepler đã khóc và thề sẽ hoàn thành tâm nguyện của thầy. Suốt những năm tháng chiến tranh tôn giáo tàn khốc, mẹ bị vu là phù thủy suýt bị thiêu trên giàn lửa, con gái chết vì bệnh đậu mùa, bản thân sống trong cảnh bần hàn đói khát, Kepler vẫn kiên cường ngồi bên ánh nến giải mã dữ liệu của Tycho.
  
  Và đền đáp cho sự hy sinh bi tráng ấy là *Ba Định luật Kepler* bất tử:
  1. *Định luật I*: Các hành tinh quay quanh Mặt Trời theo quỹ đạo *Elip* với Mặt Trời nằm ở một tiêu điểm.
  2. *Định luật II*: Đoạn thẳng nối Mặt Trời và hành tinh quét những *diện tích bằng nhau* trong những khoảng thời gian bằng nhau.
  3. *Định luật III*: Bình phương chu kỳ quay tỉ lệ thuận với lập phương bán trục lớn: $T^2 / a^3 = "const"$.
  
  Lời trăn trối của Tycho Brahe đã không hề vô ích: Di sản của ông qua bàn tay Kepler đã khai sinh ra Cơ học Thiên thể hiện đại, mở đường trực tiếp để 80 năm sau Sir Isaac Newton khám phá ra *Định luật Vạn vật Hấp dẫn* vĩ đại!
]

#deep-dive-box(title: "Quả Cầu Dandelin 1822: Chứng Minh Thuần Khiết Giao Tuyến Nón Là Đường Elip")[
  Làm thế nào để chứng minh rằng khi ta lấy một mặt phẳng xiên cắt qua một hình nón tròn xoay, đường biên giao tuyến sinh ra CHÍNH XÁC là một đường Elip theo định nghĩa $M F_1 + M F_2 = 2a$?
  
  Năm 1822, nhà toán học người Bỉ *Germinal Pierre Dandelin* đã đưa ra một lời chứng minh hình học không gian đẹp đến mức nghẹt thở bằng hai quả cầu:
  - Thả một quả cầu nhỏ $S_1$ vào bên trong đỉnh nón, nó rơi xuống và tiếp xúc với mặt nón theo một đường tròn $C_1$, đồng thời tiếp xúc với mặt phẳng cắt tại điểm $F_1$.
  - Thả một quả cầu lớn $S_2$ phía dưới, nó nở to tiếp xúc với mặt nón theo đường tròn $C_2$, đồng thời tiếp xúc với mặt phẳng cắt tại điểm $F_2$.
  
  Xét một điểm $M$ bất kỳ nằm trên đường biên giao tuyến:
  - Đoạn $M F_1$ và đoạn tiếp tuyến từ $M$ tới đường tròn $C_1$ cùng là hai tiếp tuyến kẻ từ $M$ tới quả cầu $S_1$, nên chúng bằng nhau!
  - Đoạn $M F_2$ và đoạn tiếp tuyến từ $M$ tới đường tròn $C_2$ cùng là hai tiếp tuyến kẻ từ $M$ tới quả cầu $S_2$, nên chúng bằng nhau!
  
  Do đó:
  $ M F_1 + M F_2 = ("Khoảng cách giữa hai đường tròn song song" C_1 "và" C_2 "dọc theo đường sinh nón") = "hằng số"! $
  
  Tổng khoảng cách từ $M$ đến hai tiếp điểm $F_1, F_2$ là một HẰNG SỐ KHÔNG ĐỔI! Theo đúng định nghĩa nguyên thủy, giao tuyến đó BẮT BUỘC PHẢI LÀ MỘT ĐƯỜNG ELIP với hai tiêu điểm chính là hai tiếp điểm của hai quả cầu Dandelin! Một kiệt tác hình học không gian làm say đắm mọi trái tim yêu toán học!
]

#hook-box(title: "Quỹ đạo chuyển tiếp Hohmann: Làm sao bay lên Sao Hỏa tốn ít xăng nhất?")[
  Thầy vẽ hai đường tròn đồng tâm: vòng trong là quỹ đạo Trái Đất quanh Mặt Trời, vòng ngoài là quỹ đạo Sao Hỏa:
  
  *“Nếu NASA muốn phóng tàu thám hiểm Perseverance từ Trái Đất lên Sao Hỏa, liệu họ có thể bắn con tàu bay theo một đường thẳng tắp từ Trái Đất sang Sao Hỏa được không?*
  
  *Không bao giờ! Bởi vì cả Trái Đất và Sao Hỏa đều đang quay quanh Mặt Trời với vận tốc hàng chục kilomet mỗi giây! Hơn nữa, bay đường thẳng sẽ cần một lượng nhiên liệu khổng lồ bằng cả một quả núi, không một tên lửa nào chở nổi!*
  
  *Năm 1925, kỹ sư người Đức Walter Hohmann đã phát minh ra giải pháp tối ưu: QUỸ ĐẠO CHUYỂN TIẾP HOHMANN (Hohmann Transfer Orbit)!*
  - Con tàu không bay đường thẳng, mà bay theo *MỘT NỬA ĐƯỜNG ELIP KHỔNG LỒ* quanh Mặt Trời!
  - Điểm cận nhật (gần Mặt Trời nhất) của Elip tiếp xúc với quỹ đạo Trái Đất.
  - Điểm viễn nhật (xa Mặt Trời nhất) của Elip chạm trúng vào quỹ đạo Sao Hỏa!
  
  *Bằng cách mượn lực hấp dẫn của Mặt Trời và chuyển động Elip lớp 10, con tàu vũ trụ chỉ cần kích hoạt động cơ đẩy đúng 2 lần (lúc rời Trái Đất và lúc đến Sao Hỏa), còn lại toàn bộ hành trình 500 triệu km kéo dài 7 tháng con tàu trôi êm ả theo quán tính Elip mà không tốn một giọt nhiên liệu nào!*
  
  *Toán học Conic lớp 10 chính là tấm vé thông hành đưa nhân loại bước chân ra ngoài vũ trụ!”*
]

#misconception-box(
  title: "Cạm bẫy Tách rời 3 đường Conic: Bản chất Thống nhất qua Tâm sai e",
  misconception: "Đường Elip, Parabol và Hypebol là 3 loại đường cong hoàn toàn khác biệt nhau, không có mối liên hệ nào chung!",
  correction: "Cả ba đường Conic thực chất là CÙNG MỘT ĐỐI TƯỢNG HÌNH HỌC, sinh ra từ tập hợp các điểm $M$ có tỉ số khoảng cách tới một Tiêu điểm $F$ và một Đường chuẩn $Delta$ bằng hằng số Tâm sai $e$: $(M F) / (d(M, Delta)) = e$!"
)[
  - Khi $e = 0$: Ta có Đường tròn hoàn hảo (trường hợp suy biến đặc biệt của Elip).
  - Khi $0 < e < 1$: Quỹ đạo khép kín hình *Elip* (các hành tinh và vệ tinh quay tuần hoàn vĩnh cửu quanh thiên thể mẹ).
  - Khi $e = 1$: Ranh giới mong manh hình *Parabol* (vận tốc vũ trụ cấp hai $v_2 = sqrt(2) v_1$ — vật thể vừa đủ năng lượng thoát khỏi trường hấp dẫn để bay đi mất hút).
  - Khi $e > 1$: Quỹ đạo mở hình *Hypebol* (các thiên thể lạ từ không gian liên sao ghé thăm hệ Mặt Trời một lần rồi bay đi vĩnh viễn không bao giờ quay lại, như tiểu hành tinh 'Oumuamua năm 2017).
  
  Tâm sai $e$ chính là chiếc "núm vặn kỳ diệu" của vũ trụ: Vặn $e$ từ $0$ qua $1$ rồi lớn hơn $1$, vũ trụ biến đổi liên tục từ sự tuần hoàn khép kín sang tự do giải phóng vô tận!
]

#dialogue-box(title: "Đối thoại Socrates: Tại sao Đèn pha Ô tô lại có choá hình Parabol?")[
  *Socrates:* Này bạn trẻ, ban đêm lái xe trên đường quốc lộ, ngươi muốn ánh đèn pha ô tô tỏa ra tứ phía như một ngọn nến, hay muốn nó tụ thành một luồng sáng thẳng tắp rọi xa hàng trăm mét phía trước?
  
  *Học trò:* Thưa thầy, hiển nhiên ta cần luồng sáng thẳng tắp song song để nhìn rõ chướng ngại vật phía xa!
  
  *Socrates:* Nếu đặt bóng đèn tại tâm của một chiếc chóa hình cầu, các tia sáng phản xạ sẽ đi về đâu?
  
  *Học trò:* Dạ, tia sáng sẽ đập vào mặt cầu rồi dội ngược lại tâm cầu, không thể tạo thành chùm tia song song được!
  
  *Socrates:* Vậy hình dạng nào có tính chất: Mọi tia sáng xuất phát từ Tiêu điểm $F$, khi đập vào thành gương đều bị bật ra THEO CÙNG MỘT HƯỚNG SONG SONG VỚI TRỤC ĐỐI XỨNG?
  
  *Học trò:* Đó chính là ĐƯỜNG PARABOL!
  
  *Socrates:* Đúng thế! Tiếp tuyến tại mỗi điểm trên Parabol tạo thành một góc bằng nhau giữa đường nối từ tiêu điểm và đường song song trục. Đảo ngược lại: Mọi tín hiệu truyền hình vệ tinh từ vũ trụ bay song song tới đập vào lòng chảo Parabol đều sẽ phản xạ HỘI TỤ CHÍNH XÁC VÀO TIÊU ĐIỂM nơi ta đặt đầu thu LNB! Ngươi thấy chưa, chiếc đèn pha ô tô hay chiếc chảo vệ tinh trên mái nhà em chính là một bài toán Conic lớp 10 đang làm việc âm thầm mỗi ngày!
]

#deep-dive-box(title: "Kỳ tích Y học: Máy Tán sỏi thận ESWL dựa trên Hai Tiêu điểm của Elip")[
  Trong y học hiện đại, bệnh nhân bị sỏi thận kích thước lớn trước đây bắt buộc phải trải qua một cuộc đại phẫu thuật mổ xẻ đau đớn, để lại vết rạch dài và nguy cơ nhiễm trùng cao.
  
  Năm 1980, các bác sĩ và kỹ sư tại Munich (Đức) đã chế tạo thành công chiếc máy *Tán sỏi ngoài cơ thể (Extracorporeal Shock Wave Lithotripsy - ESWL)* cứu sống hàng triệu bệnh nhân mà không cần rạch một vết dao nào!
  
  *Bí mật nằm ở tính chất phản xạ quang học của Elip:*
  Đường Elip có hai tiêu điểm $F_1$ và $F_2$. Bất kỳ tia sóng nào (ánh sáng, âm thanh, sóng xung kích) xuất phát từ một tiêu điểm $F_1$, sau khi phản xạ qua thành cong Elip, *BẮT BUỘC ĐỀU PHẢI HỘI TỤ CHÍNH XÁC TẠI TIÊU ĐIỂM $F_2$*!
  
  *Cơ chế hoạt động của máy tán sỏi:*
  - Bồn chứa nước của máy có hình dạng một nửa khối *Elipsoid* tròn xoay.
  - Tại tiêu điểm $F_1$, người ta đặt một máy phát sóng xung kích năng lượng cao.
  - Bệnh nhân nằm trên bàn điều trị, được máy siêu âm định vị sao cho *viên sỏi thận nằm trùng khít vào tiêu điểm $F_2$*!
  - Khi máy phát nổ tại $F_1$, sóng xung kích lan tỏa ra mọi hướng, đi xuyên qua da thịt bệnh nhân một cách êm ái vì mật độ năng lượng trên diện tích còn rất nhỏ. Nhưng khi toàn bộ các tia sóng đập vào thành bồn Elip và dội ngược lại, chúng đồng loạt HỘI TỤ TẤT CẢ NĂNG LƯỢNG VÀO TIÊU ĐIỂM $F_2$!
  
  Áp lực khổng lồ hàng nghìn atmosphere hội tụ tại $F_2$ làm viên sỏi thận vỡ vụn thành cát mịn mà mô mỡ và cơ thịt xung quanh hoàn toàn lành lặn! Đây là một trong những ứng dụng nhân văn và rực rỡ nhất của Hình học Giải tích lớp 10 cứu giúp nhân loại!
]

#tech-box(title: "Kính viễn vọng Không gian James Webb tại Điểm Lagrange L2")[
  - *Kỳ quan công nghệ 10 tỷ USD của nhân loại*: Kính viễn vọng không gian James Webb (JWST) được phóng lên vũ trụ ngày Giáng sinh năm 2021. Nó không bay quanh Trái Đất mà bay đến *Điểm Lagrange L2* — một điểm cân bằng hấp dẫn kỳ diệu giữa Trái Đất và Mặt Trời cách chúng ta $1,5$ triệu km.
  - Tại điểm L2, kính James Webb bay trên một *quỹ đạo quầng (Halo Orbit)* có hình dạng kết hợp của các đường Conic. Chiếc gương khổng lồ mạ vàng của kính được ghép từ 18 tấm gương lục giác uốn cong theo bề mặt *Paraboloid* chuẩn xác đến từng nanomet, cho phép nó thu thập những tia sáng hồng ngoại cổ xưa nhất từ thuở bình minh của vũ trụ cách đây $13,5$ tỷ năm!
]

#pagebreak()
'''
