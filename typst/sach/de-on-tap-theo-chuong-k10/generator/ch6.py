# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG VI: BẢN GIAO HƯỞNG BIẾN THIÊN — HÀM SỐ, ĐỒ THỊ & ỨNG DỤNG

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 15, Bài 16, Bài 17, Bài 18 SGK Toán 10 cùng Chuyên đề Quỹ đạo Ném xiên Galileo, Cầu Cổng Vàng, Tối ưu hóa Kinh tế học & Thuật toán Gradient Descent AI (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 15: HÀM SỐ VÀ SỰ BIẾN THIÊN — BƯỚC CHUYỂN TỪ TĨNH HỌC SANG ĐỘNG HỌC

Trong hình học cổ điển của Euclid, mọi thứ đều đứng yên: một tam giác cố định, một đường tròn bất biến. Nhưng vũ trụ mà chúng ta đang sống là một dòng chảy vĩnh hằng không ngừng chuyển dịch:
- Trái Đất quay quanh Mặt Trời từng giây từng phút.
- Dân số thế giới tăng lên theo từng năm tháng.
- Nhiệt độ sôi của nước thay đổi theo áp suất độ cao.
- Nồng độ thuốc trong máu giảm dần theo thời gian đào thải của gan.

Làm thế nào để toán học nắm bắt được sự chuyển động không ngừng ấy? Câu trả lời là: *Khái niệm Hàm số!* Hàm số là cỗ máy thần kỳ liên kết hai đại lượng biến thiên: hễ cho một giá trị đầu vào $x$ (nguyên nhân), cỗ máy sẽ sản sinh ra một giá trị đầu ra duy nhất $y = f(x)$ (kết quả). Khái niệm hàm số đánh dấu thời khắc Toán học bước từ thế giới "Tĩnh" sang thế giới "Động"!

#story-box(
  title: "Gottfried Wilhelm Leibniz, Leonhard Euler & Sự ra đời của ký hiệu f(x)",
  author: "Gottfried Wilhelm Leibniz (1646 – 1716) & Leonhard Euler (1707 – 1783)",
)[
  Từ "Function" (Hàm số) xuất hiện lần đầu tiên trong một bản thảo viết tay năm 1692 của nhà bác học vĩ đại người Đức *Gottfried Wilhelm Leibniz* (người đồng phát minh ra phép tính vi tích phân cùng Isaac Newton). Trong tiếng Latin cổ, "Functio" có nghĩa là "thực hiện", "nhiệm vụ" hoặc "vai trò". Leibniz dùng từ này để chỉ một đại lượng hình học thay đổi vai trò phụ thuộc vào một đường cong chuyển động.
  
  Hơn 40 năm sau, vào năm 1734, "người thầy của mọi nhà toán học" — *Leonhard Euler* — đã làm một bước đột phá vĩ đại: ông chính thức đưa ra ký hiệu $f(x)$ trong cuốn sách kinh điển *“Introductio in Analysin Infinitorum”*. Euler đã biến hàm số từ một khái niệm hình học mơ hồ thành một thực thể đại số độc lập: $f$ là chiếc hộp chức năng, $x$ là biến số tự do được bơm vào, và $f(x)$ là sản phẩm tất yếu sinh ra. 
  
  Ký hiệu $f(x)$ tao nhã của Euler đã giải phóng toán học khỏi sự cồng kềnh của ngôn ngữ lời nói, trở thành cú pháp lập trình đầu tiên của nền văn minh, đặt nền móng cho mọi hàm số (`function`) trong ngôn ngữ máy tính Python, C++ và JavaScript ngày nay!
]

#hook-box(title: "Hòn đá rơi tự do & Giác quan thứ sáu của Hàm số")[
  Thầy cầm viên phấn giơ cao ngang trán rồi buông tay cho viên phấn rơi xuống đất:
  
  *“Viên phấn rơi mất bao lâu? Độ cao của nó thay đổi thế nào theo thời gian?*
  
  *Nếu các em đứng nhìn bằng mắt thường, các em chỉ thấy viên phấn rơi vèo một cái xuống sàn. Mắt người có tốc độ chụp ảnh rất chậm, chỉ khoảng 24 khung hình/giây. Nhưng Hàm số $y = f(t) = h_0 - 1/2 g t^2$ chính là chiếc kính hiển vi thời gian: nó cho phép các em biết chính xác viên phấn đang ở độ cao bao nhiêu milimet tại thời điểm $t = 0,1234$ giây!*
  
  *Hàm số chính là giác quan thứ sáu của loài người: Nó cho phép chúng ta nhìn thấu tương lai và tái hiện lại quá khứ của bất kỳ một chuyển động nào trong vũ trụ!”*
]

#tech-box(title: "Hàm kích hoạt (Activation Functions) trong Mạng nơ-ron Deep Learning")[
  - *Bộ não nhân tạo đập theo các hàm số*: Trong mạng nơ-ron sâu của ChatGPT, hàng tỷ tế bào thần kinh nhân tạo (Artificial Neurons) liên tục nhận tín hiệu đầu vào, nhân với trọng số rồi truyền qua một *Hàm kích hoạt (Activation Function)*. Các hàm số phổ biến nhất là:
    + Hàm ReLU: $f(x) = max(0, x)$ — đơn giản nhưng mô phỏng chính xác ngưỡng phát xung của nơ-ron sinh học não người.
    + Hàm Sigmoid: $f(x) = 1 / (1 + e^(-x))$ — nén toàn bộ giá trị từ âm vô cùng đến dương vô cùng về khoảng xác suất $[0; 1]$.
    Không có những hàm số biến thiên phi tuyến này, toàn bộ mô hình AI sẽ suy biến thành một hàm tuyến tính ngây thơ, không bao giờ có thể nhận diện được hình ảnh hay sáng tác thơ văn!
]

---

== BÀI 16: HÀM SỐ BẬC HAI — ĐƯỜNG CONG PARABOL LÀM THAY ĐỔI LỊCH SỬ CHIẾN TRANH

Trong tất cả các hàm số phi tuyến, *Hàm số bậc hai* $y = a x^2 + b x + c$ ($a != 0$) là hàm số đẹp đẽ, cân đối và quyền năng nhất. Đồ thị của nó là một đường cong hình chữ $U$ gọi là *Parabol*. Đường Parabol không phải là một phát minh tùy tiện của các nhà toán học trong phòng thí nghiệm, mà là *vết tích hình học mà Mẹ Tự Nhiên khắc lên bầu trời khi một vật thể bay trong trường trọng lực!*

#story-box(
  title: "Galileo Galilei & Cuộc lật đổ giáo điều 2.000 năm của Aristotle",
  author: "Galileo Galilei (Ý, 1564 – 1642)",
)[
  Suốt gần 2.000 năm từ thời Hy Lạp cổ đại đến thời Trung Cổ, toàn bộ giới học thuật châu Âu đều tin vào giáo lý của Aristotle: Khi một khẩu đại bác bắn ra một quả đạn, quả đạn sẽ bay theo một *đường thẳng tắp* cho đến khi hết "lực đẩy bên trong" (impetus), sau đó nó sẽ khựng lại trên không trung một giây rồi rơi *thẳng đứng xuống đất* theo góc vuông $90 degree$! Thậm chí các binh sĩ pháo thủ thời đó còn vẽ những bức tranh đạn pháo bay hình chữ nhật lên các sách giáo khoa quân sự!
  
  Chứng kiến sự vô lý đến nực cười đó, nhà bác học *Galileo Galilei* đã quyết định đi tìm chân lý. Tại thành phố Florence, ông thiết kế những máng trượt nghiêng bằng gỗ nhẵn thín, bôi trơn bằng dầu, cho những viên bi đồng lăn xuống và dùng đồng hồ nước để đo thời gian rơi với độ chính xác từng giọt nước.
  
  Năm 1638, trong cuốn sách kiệt tác *“Đối thoại về hai ngành khoa học mới”*, Galileo đã công bố một khám phá làm rung chuyển nền vật lý: Chuyển động ném xiên của một vật thể thực chất là sự *HỢP NHẤT CỦA HAI CHUYỂN ĐỘNG ĐỘC LẬP*:
  1. Theo phương ngang: Chuyển động thẳng đều với vận tốc không đổi $v_x = v_0 cos alpha$, quãng đường $x(t) = (v_0 cos alpha) t$.
  2. Theo phương thẳng đứng: Chuyển động biến đổi đều chịu gia tốc rơi tự do của trọng lực Trái Đất $y(t) = (v_0 sin alpha) t - 1/2 g t^2$.
  
  Rút thời gian $t = x / (v_0 cos alpha)$ từ phương trình thứ nhất thế vào phương trình thứ hai:
  $ y = (tan alpha) x - (g) / (2 v_0^2 cos^2 alpha) x^2 $
  
  Đó chính là phương trình của một *ĐƯỜNG PARABOL TUYỆT HẢO* có bề lõm quay xuống dưới! Galileo đã dùng một hàm số bậc hai đơn sơ để đập tan giáo điều ngàn năm của Aristotle, khai sinh ra ngành Cơ học hiện đại và nghệ thuật pháo binh chuẩn xác của nhân loại!
]

#story-box(
  title: "Cầu Cổng Vàng San Francisco: Parabol Cáp Treo vs Dây Xích Catenary",
  author: "Joseph Strauss (Mỹ, 1870 – 1938) & Các Kỹ Sư Kết Cấu Thế Kỷ XX",
)[
  Chiếc Cầu Cổng Vàng (Golden Gate Bridge) bắc qua vịnh San Francisco là một trong 7 kỳ quan của thế giới hiện đại. Hai sợi cáp thép khổng lồ đường kính gần $1$ mét uốn cong mềm mại giữa hai tòa tháp cao vút đỡ toàn bộ mặt cầu dài gần 3 km.
  
  Nhiều người lầm tưởng sợi cáp treo đó có hình dạng đường cong dây xích tự do (Catenary). Nhưng các kỹ sư kết cấu chỉ ra rằng:
  - Một sợi dây treo lơ lửng tự do chỉ chịu trọng lượng của chính nó thì tạo thành đường *Catenary* (hàm cosin hypebolic: $y = a cosh(x/a)$ do Huygens, Leibniz và Bernoulli tìm ra năm 1691).
  - Nhưng sợi cáp chính của Cầu Cổng Vàng phải gánh thêm *hàng vạn tấn dầm cầu bê tông cốt thép và xe cộ phân bố ĐỀU ĐẶN THEO PHƯƠNG NGANG* thông qua hàng trăm sợi dây cáp treo thẳng đứng!
  
  Phương trình vi phân cân bằng lực chịu tải phân bố đều theo phương ngang:
  $ (d^2 y) / (d x^2) = w / H = "hằng số" arrow y = (w) / (2 H) x^2 $
  
  Đường cong chịu lực hoàn hảo ấy bắt buộc phải là *MỘT ĐƯỜNG PARABOL BẬC HAI!* Hàm số bậc hai lớp 10 đã gánh vác an toàn cho hơn 2 tỷ lượt xe cộ qua lại suốt gần một thế kỷ qua mà không hề đứt gãy!
]

#hook-box(title: "Angry Birds: Căn góc bắn chim phá đảo bằng Đỉnh Parabol")[
  Thầy bật máy chiếu hiển thị màn hình trò chơi huyền thoại Angry Birds:
  
  *“Khi các em kéo căng dây súng cao su để bắn chú chim đỏ bay vút lên bầu trời phá vỡ lâu đài của những chú lợn xanh: Quỹ đạo bay của chú chim luôn luôn là một đường Parabol úp ngược.*
  
  *Làm sao để biết chú chim bay cao nhất được bao nhiêu mét để vượt qua bức tường thành?*
  *Chính là ĐỈNH PARABOL $I(-b / (2a); -Delta / (4a))$!*
  *Làm sao để biết chú chim sẽ rơi chạm đất ở vị trí nào?*
  *Chính là ĐIỂM CẮT TRỤC HOÀNH: Giải phương trình bậc hai $a x^2 + b x + c = 0$!*
  
  *Một trò chơi điện tử hàng tỷ lượt tải về thực chất chỉ là một bộ giải hàm số bậc hai lớp 10 đang chạy ngầm trong chip điện thoại của các em!”*
]

#tech-box(title: "Tối Ưu Hóa Doanh Thu & Điểm Hòa Vốn Trong Kinh Tế Học Vi Mô")[
  - *Mô hình Định giá Độc quyền (Monopoly Pricing)*:
    Một công ty công nghệ bán phần mềm bản quyền nhận thấy: Nếu đặt giá $P$ (nghìn đồng), số lượng khách mua $Q$ tuân theo hàm cầu tuyến tính: $Q(P) = 1.000 - 2P$.
    Hàm Tổng Doanh thu $T R$ là tích của giá bán và sản lượng:
    $ T R(P) = P times Q(P) = P times (1.000 - 2P) = -2P^2 + 1.000P $
    Đây là một hàm số bậc hai có hệ số $a = -2 < 0$, đồ thị là Parabol úp ngược bề lõm xuống dưới!
  - *Tìm mức giá tối ưu bằng Đỉnh Parabol*:
    $ P^* = - b / (2a) = - 1.000 / (2 times (-2)) = 250 "(nghìn đồng)" $
    Tại mức giá $250.000$ VNĐ, doanh thu đạt cực đại tuyệt đối:
    $ T R_("max") = -2(250)^2 + 1.000(250) = 125.000 "(nghìn đồng) = 125 triệu đồng!" $
  
  Nếu định giá rẻ hơn ($P = 100$), tuy bán được nhiều nhưng doanh thu thấp; nếu định giá quá đắt ($P = 400$), ế ẩm không ai mua. Đỉnh Parabol lớp 10 chính là điểm cân bằng hoàng kim cho mọi bài toán kinh doanh thực tế!
]

---

== BÀI 17: DẤU TAM THỨC BẬC HAI — QUY TẮC "TRONG TRÁI NGOÀI CÙNG"

Biệt thức $Delta = b^2 - 4 a c$ không chỉ là công thức tính nghiệm mà là "chiếc la bàn" định đoạt số phận của tam thức bậc hai $f(x) = a x^2 + b x + c$:
- Khi $Delta < 0$: Parabol bay lơ lửng không chạm trục hoành, tam thức mang một màu sắc duy nhất: luôn cùng dấu với hệ số $a$ trên toàn cõi $RR$.
- Khi $Delta = 0$: Parabol tiếp xúc một điểm duy nhất tại đỉnh.
- Khi $Delta > 0$: Parabol cắt đôi trục hoành tại hai nghiệm $x_1 < x_2$, chia mặt đất thành ba vùng: *Trong trái dấu, Ngoài cùng dấu với $a$*!

Quy tắc này là ranh giới phân định sống còn trong kỹ thuật: vùng ứng suất an toàn của thanh dầm, vùng tốc độ an toàn không bị trượt bánh xe, và vùng phân loại tín hiệu trong trí tuệ nhân tạo.

#deep-dive-box(title: "Chứng Minh Bất Đẳng Thức Cauchy-Schwarz Bằng Dấu Tam Thức Bậc Hai")[
  Bất đẳng thức Cauchy-Schwarz cho $n$ bộ số thực $(a_1, ..., a_n)$ và $(b_1, ..., b_n)$ phát biểu rằng:
  $ (a_1 b_1 + a_2 b_2 + ... + a_n b_n)^2 <= (a_1^2 + a_2^2 + ... + a_n^2)(b_1^2 + b_2^2 + ... + b_n^2) $
  
  Nhiều học sinh thường thấy bất đẳng thức này rất đáng sợ. Nhưng với Định lý Dấu tam thức bậc hai lớp 10, ta chứng minh nó chỉ trong 3 dòng biến đổi kỳ ảo:
  
  Xét hàm số theo biến $t in RR$:
  $ f(t) = sum_(i=1)^n (a_i t - b_i)^2 = (sum_(i=1)^n a_i^2) t^2 - 2 (sum_(i=1)^n a_i b_i) t + (sum_(i=1)^n b_i^2) $
  Vì $f(t)$ là tổng của các bình phương, nên hiển nhiên:
  $ f(t) >= 0 quad forall t in RR $
  
  Để một tam thức bậc hai $A t^2 + B t + C >= 0$ với mọi $t in RR$ (với $A = sum a_i^2 > 0$), điều kiện cần và đủ là biệt thức thu gọn phải không dương:
  $ Delta' = B'^2 - A C = (sum_(i=1)^n a_i b_i)^2 - (sum_(i=1)^n a_i^2)(sum_(i=1)^n b_i^2) <= 0 $
  $ arrow (sum_(i=1)^n a_i b_i)^2 <= (sum_(i=1)^n a_i^2)(sum_(i=1)^n b_i^2) $
  
  Dấu bằng xảy ra khi và chỉ khi $Delta' = 0$, tức là tồn tại $t_0$ sao cho $a_i t_0 - b_i = 0$ với mọi $i$, hay các bộ số tỉ lệ thuận với nhau! Một vẻ đẹp toán học thuần khiết và thanh tao tột độ!
]

---

== BÀI 18: PHƯƠNG TRÌNH QUY VỀ BẬC HAI — CẠM BẪY NGHIỆM MA

Khi giải phương trình vô tỉ dạng $sqrt(f(x)) = g(x)$, thao tác tự nhiên nhất của học sinh là: *Bình phương hai vế!*
$ f(x) = [g(x)]^2 $
Nhưng chính thao tác ngây thơ đó đã mở cửa cho những "Con số Ma" (Extraneous Roots) chui vào bài toán! Bởi vì trong toán học:
$ A = B arrow A^2 = B^2 quad ("Phép biến đổi một chiều, KHÔNG TƯƠNG ĐƯƠNG!") $
Bình phương làm mất dấu âm: $(-5)^2 = 5^2$ hoàn toàn đúng, nhưng $-5 = 5$ là một trò hề! Nếu không đặt điều kiện chặn $g(x) >= 0$ hoặc không thử lại nghiệm, học sinh sẽ rước những nghiệm ma vào bài làm và bị điểm 0 đau đớn!

#misconception-box(
  title: "Cạm bẫy Tham số m trong Hệ số a của Phương trình Bậc hai",
  misconception: "Gặp bài toán 'Tìm m để phương trình m x^2 - 2x + 1 = 0 có nghiệm duy nhất', học sinh vội vàng tính Delta' = 0 và tìm ra m = 1!",
  correction: "Khi hệ số a chứa tham số m, phương trình CHƯA CHẮC là bậc hai! BẮT BUỘC phải xét trường hợp a = 0 đầu tiên: Khi m = 0, phương trình trở thành -2x + 1 = 0 => x = 1/2 có nghiệm duy nhất! Đáp số đúng phải là m = 0 hoặc m = 1!"
)[
  Đây là cái bẫy kinh điển khiến hơn $80\%$ học sinh mất điểm trong các kỳ thi học kỳ và tuyển sinh. Hãy nhớ: *Hễ thấy tham số nằm ở đầu tàu $a$, việc đầu tiên phải làm là xét xem đoàn tàu có bị mất đầu tàu hay không ($a = 0$)!*
]

#dialogue-box(title: "Đối thoại Socrates: Tại sao Đỉnh Parabol lại nằm ở x = -b / (2a)?")[
  *Socrates:* Này bạn trẻ, Parabol $y = a x^2 + b x + c$ có tính chất đối xứng qua một đường thẳng đứng. Nếu nó cắt trục hoành tại hai nghiệm $x_1$ và $x_2$, trục đối xứng phải nằm ở đâu so với hai điểm đó?
  
  *Học trò:* Thưa thầy, trục đối xứng bắt buộc phải đi qua TRUNG ĐIỂM của đoạn thẳng nối hai nghiệm: $x_I = (x_1 + x_2) / 2$!
  
  *Socrates:* Rất thông minh! Và theo Định lý Viète của nhà toán học François Viète, tổng hai nghiệm $x_1 + x_2$ bằng gì?
  
  *Học trò:* Dạ, $x_1 + x_2 = - b / a$!
  
  *Socrates:* Vậy trung điểm $x_I$ bằng gì?
  
  *Học trò:* $x_I = (-b / a) / 2 = - b / (2a)$!
  
  *Socrates:* Tuyệt mỹ! Dù Parabol có chạm trục hoành hay bay lơ lửng không cắt trục hoành ($Delta < 0$), tâm đối xứng ấy không bao giờ thay đổi! Tọa độ đỉnh $-b / (2a)$ không phải là một công thức từ trên trời rơi xuống để học vẹt, nó chính là hiện thân của sự cân bằng đối xứng thiêng liêng nhất của tự nhiên!
]

#deep-dive-box(title: "Thuật toán Gradient Descent: Tối Ưu Hóa Bậc Hai Huấn Luyện AI GPT-4")[
  Khi các nhà khoa học máy tính tại OpenAI huấn luyện mô hình GPT-4 với hàng trăm tỷ tham số, làm thế nào máy tính tự động điều chỉnh các trọng số để mô hình trả lời ngày càng thông minh hơn?
  
  Họ sử dụng *Hàm mất mát bậc hai (Mean Squared Error)*:
  $ L(w) = 1/2 sum (y_("thực") - y_("dự đoán"))^2 $
  Hàm mất mát này có dạng một chiếc bát Parabol nhiều chiều (Paraboloid). Đáy sâu nhất của chiếc bát tương ứng với điểm lỗi bằng 0 (mô hình thông minh nhất).
  
  Thuật toán *Gradient Descent (Suy giảm độ dốc)* hoạt động như sau: Máy tính thả một hòn bi lăn từ miệng bát xuống đáy bát. Tại mỗi bước lặp, nó tính độ dốc (đạo hàm/hệ số góc bậc hai) và dịch chuyển trọng số một đoạn ngược chiều độ dốc:
  $ w_(t+1) = w_t - eta (d L) / (d w) $
  Toàn bộ cuộc cách mạng Trí tuệ Nhân tạo làm rung chuyển thế giới hôm nay thực chất là hành trình đi tìm Đáy của một chiếc bát Parabol lớp 10 trong không gian hàng tỷ chiều!
]

#inquiry-box(title: "Thực hành Python: Mô phỏng Quỹ Đạo Ném Xiên & Tối Ưu Góc Bắn 45°")[
  ```python
  import numpy as np

  def projectile_motion(v0, angle_deg, g=9.81):
      theta = np.radians(angle_deg)
      # Thời gian bay: t_flight = 2*v0*sin(theta)/g
      t_flight = 2 * v0 * np.sin(theta) / g
      # Tầm xa cực đại: R = v0^2 * sin(2*theta) / g
      range_max = (v0**2) * np.sin(2 * theta) / g
      # Đỉnh cao cực đại Parabol: H = (v0*sin(theta))^2 / (2g)
      h_max = ((v0 * np.sin(theta))**2) / (2 * g)
      return t_flight, range_max, h_max

  v0 = 20.0 # m/s
  for angle in [15, 30, 45, 60, 75]:
      t, r, h = projectile_motion(v0, angle)
      print(f"Góc {angle:2d}° -> Tầm xa: {r:6.2f}m | Đỉnh cao: {h:5.2f}m | Thời gian bay: {t:4.2f}s")
  ```
]

#pagebreak()
'''
