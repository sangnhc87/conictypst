# -*- coding: utf-8 -*-

CONTENT = r'''= PHẦN PHỤ LỤC: MA TRẬN 40 CÂU HỎI KHAI MỞ SƯ PHẠM ĐỈNH CAO KHỐI 11

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành riêng cho Quý Thầy Cô giáo: Bảng tra cứu tốc hành 3 phút mở đầu tiết học. Mỗi bài học đều có một câu hỏi Hook kích nổ sự tò mò, phá tan sự uể oải đầu giờ của học sinh và kết nối trực tiếp vào bản chất toán học cùng kỷ nguyên số.
]

#align(center)[
  #table(
    columns: (2.2cm, 4cm, 5.5cm, 4.3cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e293b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    
    // Header
    table.header(
      text(fill: white, weight: "bold", size: 9pt)[Bài học],
      text(fill: white, weight: "bold", size: 9pt)[Câu hỏi Hook đầu giờ (3 phút)],
      text(fill: white, weight: "bold", size: 9pt)[Bản chất nhận thức cốt lõi],
      text(fill: white, weight: "bold", size: 9pt)[Ứng dụng thực tế & Kỷ nguyên AI],
    ),
    
    // Rows
    [Bài 1: Góc lượng giác], [Kim đồng hồ quay 3 vòng là bao nhiêu độ? Tại sao lại có góc âm và góc vượt quá 360°?], [Giải phóng hình học khỏi sự kìm kẹp của độ dài hữu hạn; miêu tả sự quay vô tận.], [Con quay hồi chuyển máy bay, định vị vệ tinh GPS, gimbal chống rung.],
    [Bài 2: Giá trị lượng giác], [Tại sao góc tù lại có cosin âm? Độ dài đoạn thẳng làm sao có giá trị âm?], [Đại số hóa hình học: Giá trị lượng giác là tọa độ hình chiếu trên đường tròn đơn vị.], [Đồ họa game 3D, tính toán vector chuyển động của nhân vật ảo.],
    [Bài 3: Công thức lượng giác], [Làm thế nào Ptolemy đo được khoảng cách từ Trái Đất đến Mặt Trăng cách đây 1.900 năm?], [Công thức cộng, nhân đôi, biến đổi tích thành tổng giúp giải mọi tam giác thiên văn.], [Xử lý tín hiệu âm thanh số MP3, lọc tạp âm micro điện thoại.],
    [Bài 4: Hàm số lượng giác], [Tại sao nhịp tim, sóng biển và dòng điện xoay chiều đều có hình lượn sóng sin uốn lượn?], [Tuần hoàn là bản chất của sự sống và tự nhiên; hàm sin/cos là ngôn ngữ của chu kỳ.], [Điện tâm đồ ECG trong y tế, máy phát điện xoay chiều Tesla.],
    [Bài 5: PT lượng giác], [Tại sao chiếc cầu treo Tacoma Narrows lại tự vặn mình gãy đôi trong một ngày gió nhẹ?], [Hiện tượng Cộng hưởng cơ học (Resonance): Tần số ngoại lực trùng tần số riêng.], [Thiết kế nhà chống động đất ở Nhật Bản, giảm chấn con lắc tòa tháp Đài Bắc 101.],
    [Bài 6: Dãy số], [Hạt thóc trên bàn cờ vua Ấn Độ có thể phủ kín bề mặt Trái Đất không?], [Quy luật biến thiên rời rạc theo bước thời gian; sự sinh sôi nảy nở của các loài.], [Thuật toán đệ quy trong lập trình máy tính, cấu trúc dữ liệu mảng.],
    [Bài 7: Cấp số cộng], [Cậu bé Gauss 7 tuổi đã tính tổng từ 1 đến 100 trong vài giây bằng cách nào?], [Tính chất đối xứng tâm của các số cách đều; sai số không đổi $d$.], [Tính khấu hao tài sản cố định, lập kế hoạch trả góp ngân hàng.],
    [Bài 8: Cấp số nhân], [Gấp đôi tờ giấy A4 bao nhiêu lần thì độ dày của nó chạm tới Mặt Trăng?], [Sức mạnh bùng nổ của cấp số nhân; hàm mũ làm tê liệt trực giác con người.], [Sự lây lan dịch bệnh (hệ số R0), tiền lãi kép ngân hàng, mạng đa cấp.],
    [Bài 9: Giới hạn dãy số], [Tại sao chàng Achilles chạy nhanh như gió lại không đuổi kịp con rùa chậm chạp?], [Tổng của vô hạn đại lượng nhỏ dần có thể hội tụ về một con số hữu hạn duy nhất.], [Thuật toán khử răng cưa màn hình GPU máy tính, tính diện tích xấp xỉ.],
    [Bài 10: Giới hạn hàm số], [Đẳng thức 0,999999... = 1 có thực sự đúng không hay chỉ là làm tròn?], [Tiệm cận và hành vi của hàm số tại các điểm kỳ dị vực thẳm chia cho 0.], [Phân tích điểm hòa vốn trong kinh tế, tính giới hạn tải trọng của cầu đường.],
    [Bài 11: Hàm số liên tục], [Có hay không một khoảnh khắc trên Trái Đất mà nhiệt độ hai điểm đối xứng bằng nhau?], [Định lý giá trị trung gian Bolzano: Không thể nhảy qua vực thẳm mà không băng qua đáy.], [Thuật toán tìm nghiệm nhị phân (Binary Search) của lập trình viên.],
    [Bài 12: ĐT & MP song song], [Tại sao hai đường thẳng không cắt nhau mà cũng không song song?], [Chiều sâu của không gian 3D: Hai đường thẳng chéo nhau không cùng thuộc một mặt phẳng.], [Hệ thống đường dẫn ống ngầm đô thị, giao lộ lập thể cầu vượt nhiều tầng.],
    [Bài 13: Hai MP song song], [Làm thế nào để các tầng nhà cao ốc chọc trời không bao giờ nghiêng đổ chạm nhau?], [Điều kiện song song: Hai đường thẳng cắt nhau trong mặt phẳng này song song mặt kia.], [Công nghệ in 3D cắt lớp (Slicing), quét cắt lớp vi tính y tế CT Scanner.],
    [Bài 14: Phép chiếu song song], [Tại sao Gaspard Monge phải giữ bí mật môn Hình học Họa hình như bí mật quốc gia?], [Biểu diễn không gian 3 chiều lên các bản vẽ 2D phẳng mà không làm mất thông số kỹ thuật.], [Bản vẽ kỹ thuật cơ khí chế tạo máy, thiết kế kiến trúc xây dựng nhà ở.],
    [Bài 15: Ghép nhóm số liệu], [Làm thế nào xử lý dữ liệu thu nhập của 100 triệu dân mà không bị quá tải?], [Gom cụm dữ liệu liên tục thành các khoảng tần số để nhìn thấy bức tranh toàn cảnh.], [Phân tích Big Data, thống kê dân số của Tổng cục Thống kê.],
    [Bài 16: Trung vị & Tứ phân vị], [Khi Bill Gates bước vào quán bia, tại sao số trung bình lại trở thành kẻ nói dối?], [Trung vị và tứ phân vị không bị bóp méo bởi các giá trị ngoại lai dị biệt (Outliers).], [Đo lường bất bình đẳng thu nhập (Chỉ số Gini), phân khúc khách hàng VIP Shopee.],
    [Bài 17: Phép tính lũy thừa], [Lũy thừa với số mũ vô tỉ như $2^(sqrt(2))$ có ý nghĩa thực tế là gì?], [Mở rộng liên tục từ đếm số lượng sang hàm biến thiên liên tục trên tập số thực.], [Mô hình tăng trưởng kinh tế, tính toán năng lượng nguyên tử.],
    [Bài 18: Phép tính Lôgarit], [Làm thế nào John Napier cứu rỗi đôi mắt của các nhà thiên văn học thế kỷ XVII?], [Biến phép nhân thành phép cộng, biến phép chia thành phép trừ bằng thang đo mũ.], [Thước logarit trượt của các kỹ sư thời Apollo lên Mặt Trăng.],
    [Bài 19: Hàm mũ & Lôgarit], [Tại sao tai người nghe âm thanh (dB) và lưỡi nếm vị chua (pH) đều là logarit?], [Định luật Weber-Fechner: Giác quan con người nén tín hiệu tự nhiên theo logarit.], [Nén dải động hình ảnh HDR trong nhiếp ảnh và camera điện thoại iPhone.],
    [Bài 20: PT Mũ & Lôgarit], [Làm sao biết xác ướp Pharaoh Ai Cập hay khúc xương voi ma mút có tuổi 4.000 năm?], [Phương trình phân rã phóng xạ Carbon-14; giải phóng ẩn số trên mũ bằng logarit.], [Định tuổi cổ vật trong khảo cổ học, tính chu kỳ bán rã thuốc trong cơ thể.],
    [Bài 21: Định nghĩa Đạo hàm], [Bức ảnh xe chạy 120 km/h của cảnh sát: Chiếc xe trong ảnh đứng yên hay đang chạy?], [Đạo hàm là vận tốc tức thời: Tỷ số của hai đại lượng vô cùng nhỏ tại một tích tắc.], [Máy bắn tốc độ laser, đồng hồ tốc độ xe máy, gia tốc kế điện thoại.],
    [Bài 22: Quy tắc đạo hàm], [Làm thế nào để tìm góc dốc lớn nhất của tàu lượn siêu tốc mà không làm hành khách ngất xỉu?], [Đạo hàm hàm hợp, đạo hàm tích và thương giúp mô hình hóa mọi đường cong phức tạp.], [Thiết kế đường cong ray xe lửa an toàn, tối ưu hóa khí động học xe F1.],
    [Bài 23: Đạo hàm cấp hai], [Tại sao khi ô tô phanh gấp ta bị giúi về phía trước? Lực sinh ra từ đâu?], [Đạo hàm cấp hai là Gia tốc: Định luật II Newton $F = m a$ gắn liền lực với gia tốc.], [Hệ thống túi khí an toàn ô tô kích hoạt khi gia tốc âm vượt ngưỡng.],
    [Bài 24: ĐT vuông góc MP], [Tại sao người thợ hồ chỉ cần sợi dây dọi là dựng được bức tường cao vút thẳng đứng?], [Đường thẳng vuông góc với mặt phẳng khi vuông góc với 2 đường thẳng cắt nhau trong mặt.], [Kiểm tra độ thẳng đứng của trụ cầu, giàn khoan dầu khí ngoài khơi.],
    [Bài 25: Hai MP vuông góc], [Tại sao góc giữa hai bức tường phòng học quyết định việc cánh cửa mở êm ru?], [Góc phẳng nhị diện đo độ nghiêng thực sự giữa hai mặt phẳng không gian.], [Thiết kế mái dốc thoát nước mưa nhà ở, góc nghiêng cánh máy bay.],
    [Bài 26: Khoảng cách không gian], [Làm sao tính khoảng cách an toàn giữa hai đường ray tàu điện trên cao chéo nhau?], [Đoạn vuông góc chung: Khoảng cách ngắn nhất giữa hai quỹ đạo trong không gian.], [Tránh va chạm máy bay trên không lưu radar sân bay quốc tế.],
    [Bài 27: Thể tích khối đa diện], [Làm thế nào để thiết kế một hộp bánh thu hút nhất mà tốn ít bìa các-tông nhất?], [Tối ưu hóa hình học: Mối quan hệ giữa diện tích toàn phần và thể tích chứa đựng.], [Quy hoạch kho bãi logistics Amazon, đóng gói container xuất khẩu.],
    [Bài 28: 5 Khối Platon], [Tại sao Mẹ Tự nhiên lại chọn khối 20 mặt đều để làm vỏ bọc cho Virus Corona và HIV?], [Tính đối xứng tối cao: Tỷ lệ thể tích trên diện tích bề mặt tối ưu của tự nhiên.], [Thiết kế vòm không gian Geodesic, cấu trúc tinh thể nano carbon Fulleren.],
    [Bài 29: Biến cố độc lập], [Tại sao sòng bạc Monte Carlo khiến hàng nghìn con bạc phá sản khi ra 26 lần ô đen?], [Mỗi lần thử độc lập không hề có trí nhớ; trực giác con bạc là ảo tưởng tâm lý.], [Hệ thống dự phòng an toàn kép trong máy bay chở khách (động cơ độc lập).],
    [Bài 30: Quy tắc cộng & nhân], [Xác suất trúng vé số độc đắc Vietlott 6/55 là bao nhiêu? Có nên mua cầu may?], [Phân tích không gian mẫu và phân chia các trường hợp biến cố xung khắc.], [Quản trị rủi ro danh mục đầu tư tài chính phố Wall, bảo hiểm nhân thọ.],
    [Bài 31: Định lý Bayes], [Xét nghiệm bệnh hiểm nghèo chính xác 99%, cầm kết quả dương tính thì xác suất bệnh là mấy?], [Xác suất có điều kiện: Cập nhật niềm tin khi có bằng chứng mới xuất hiện.], [Bộ lọc thư rác Gmail, xe tự hành Tesla, AI chẩn đoán ung thư.],
    [CĐ 1: Phép biến hình], [Làm thế nào danh họa M.C. Escher vẽ được đàn cá biến thành đàn chim khít khao kỳ ảo?], [Hệ thống các phép dời hình và nhóm đối xứng mặt phẳng phủ kín không gian.], [Thiết kế hoa văn gạch men kiến trúc, dệt may thời trang cao cấp.],
    [CĐ 2: Lý thuyết đồ thị], [Euler đã giải bài toán 7 cây cầu Königsberg và khai sinh Internet như thế nào?], [Trừu tượng hóa hình học thành các đỉnh và cạnh; tính chẵn lẻ của bậc đỉnh.], [Thuật toán Google Maps tìm đường ngắn nhất, mạng xã hội Facebook.],
    [CĐ 3: Mô hình 3D CAD/CAM], [Làm thế nào hàng vạn kỹ sư khắp thế giới cùng lắp ráp ăn khớp chiếc máy bay Boeing?], [Thiết diện không gian và ngôn ngữ thiết kế mô hình 3D chuẩn hóa toàn cầu.], [Công nghiệp vũ trụ SpaceX, in 3D bộ phận cấy ghép y tế cho người.],
  )
]

#pagebreak()

= PHẦN II: NĂM KỊCH BẢN ĐỐI THOẠI SOCRATES SƯ PHẠM MẪU TOÁN 11

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành cho Quý Thầy Cô thực nghiệm phương pháp dạy học kiến tạo (Constructivism): Thay vì thuyết giảng áp đặt một chiều, giáo viên dùng chuỗi câu hỏi Socrates để dẫn dắt học sinh tự va đập nhận thức, tự nhận ra mâu thuẫn và tự giác ngộ bản chất toán học.
]

#dialogue-box(title: "Kịch Bản 1: Khai Mở Khái Niệm Góc Lượng Giác Âm & Vượt Quá 360 Độ")[
  *Thầy:* “Các em hãy nhìn chiếc đồng hồ treo tường: Kim phút đang chỉ đúng số 12. Nếu thầy quay chiếc kim phút theo chiều kim đồng hồ đúng 3 vòng trọn vẹn, chiếc kim phút đã quét được một góc bao nhiêu độ?”\
  *Học sinh:* “Dạ thưa thầy, 1 vòng là $360 degree$, vậy 3 vòng là $3 times 360 degree = 1.080 degree$ ạ!”\
  *Thầy:* “Vậy tại sao trong hình học phẳng cấp hai, các thầy cô lại dạy rằng góc lớn nhất chỉ là góc bẹt $180 degree$ hoặc cùng lắm là góc đầy $360 degree$?”\
  *Học sinh:* “Dạ... vì thước đo độ hình bán nguyệt chỉ chia vạch từ $0 degree$ đến $180 degree$ thôi thầy!”\
  *Thầy:* “Thế nếu một chiếc máy bay trực thăng cánh quạt quay 500 vòng mỗi phút, cánh quạt đó có dừng lại ở $360 degree$ không?”\
  *Học sinh:* “Dạ không, nó quay liên tục hàng triệu độ ạ!”\
  *Thầy:* “Chính xác! Góc hình học đo khoảng cách góc giữa 2 tia tĩnh, còn GÓC LƯỢNG GIÁC đo TIẾN TRÌNH QUAY! Vậy nếu thầy quay kim đồng hồ theo chiều ngược lại, làm sao để phân biệt chiều quay tới và chiều quay lui?”\
  *Học sinh:* “Dạ ta quy ước một chiều là DƯƠNG, chiều ngược lại là ÂM ạ!”\
  *Thầy:* “Tuyệt vời! Các em vừa tự tay tái phát minh ra khái niệm GÓC LƯỢNG GIÁC CÓ HƯỚNG của lớp 11: Cho phép góc âm và vượt quá $360 degree$, giải phóng toán học khỏi sự giam cầm của thước đo độ tĩnh lặng!”
]

#dialogue-box(title: "Kịch Bản 2: Hóa Giải Khủng Hoảng Chia Cho 0 Bằng Phép Tính Giới Hạn")[
  *Thầy:* “Thầy viết lên bảng biểu thức $f(x) = (x^2 - 1) / (x - 1)$. Thầy hỏi: $f(1)$ bằng bao nhiêu?”\
  *Học sinh:* “Dạ thưa thầy, thay $x = 1$ vào tử bằng 0, mẫu bằng 0. Kết quả là $0/0$ không xác định ạ!”\
  *Thầy:* “Vậy giá trị của nó có phải là hư vô không có thật?”\
  *Học sinh:* “Dạ vâng, vì nguyên tắc từ tiểu học là cấm chia cho 0 ạ!”\
  *Thầy:* “Nào, bây giờ hãy bấm máy tính: Khi $x = 1.1$, $f(1.1) = ?$”\
  *Học sinh:* “Dạ $(1.21 - 1) / 0.1 = 2.1$ ạ!”\
  *Thầy:* “Khi $x = 1.01$, rồi $1.001$, rồi $1.000001$?”\
  *Học sinh:* “Dạ là $2.01$, rồi $2.001$, rồi $2.000001$... Ơ thầy ơi, nó đang lao về con số 2 rất nhanh!”\
  *Thầy:* “Thế còn khi đi từ bên trái: $0.9$, $0.99$, $0.999999$?”\
  *Học sinh:* “Dạ là $1.9$, $1.99$, $1.999999$... nó cũng đang tiến sát về 2!”\
  *Thầy:* “Tại điểm $x = 1$, con đường bị đục thủng một cái hố chia cho 0. Nhưng chiếc xe tiến từ bên trái và chiếc xe tiến từ bên phải đều nhìn thấy ĐỘ CAO BẰNG 2! Con số 2 đó chính là GIỚI HẠN $lim_(x arrow 1) f(x) = 2$! Giới hạn cho phép ta nhìn thấy sự thật của chân trời mà không cần phải nhảy chân vào miệng hố tử thần!”
]

#dialogue-box(title: "Kịch Bản 3: Vạch Trần Ảo Ảnh Hai Đường Thẳng Chéo Nhau Trong Không Gian")[
  *Thầy:* “Thầy vẽ lên bảng đen hai đường thẳng cắt nhau tại điểm $M$. Thầy đố các em: Hai đường thẳng này có cắt nhau ngoài đời thực không?”\
  *Học sinh:* “Dạ có chứ thầy, điểm giao nhau $M$ sờ sờ trên bảng kìa thầy!”\
  *Thầy:* “Bây giờ các em hãy ngước nhìn lên bầu trời ngoài cửa sổ: Một chiếc máy bay Boeing đang bay từ Hà Nội vào Sài Gòn ở độ cao 10.000 mét theo hướng Bắc - Nam. Cùng lúc đó, một chiếc cầu vượt cạn trên mặt đất có xe buýt chạy từ Đông sang Tây. Từ mặt đất nhìn lên, đường bay máy bay và cây cầu dường như cắt nhau tại một điểm. Vậy chiếc máy bay có đâm vào xe buýt trên cầu không?”\
  *Học sinh (cười lớn):* “Dạ làm sao đâm được thầy ơi! Một đằng ở độ cao 10 cây số, một đằng ở sát mặt đất, chúng nằm ở hai độ cao khác nhau mà!”\
  *Thầy:* “Vậy tại sao trên mắt các em, chúng lại cắt nhau?”\
  *Học sinh:* “Dạ vì mắt chúng ta chiếu cảnh vật 3 chiều lên võng mạc phẳng 2D ạ!”\
  *Thầy:* “Chính xác! Điểm giao nhau trên bảng đen chẳng qua chỉ là một 'bóng ma thị giác' do phép chiếu tạo ra! Hai đường thẳng đó KHÔNG HỀ CÙNG NẰM TRONG MỘT MẶT PHẲNG — chúng chéo nhau! Đó là lý do môn Hình học Không gian 11 bắt buộc các em phải dùng TRÍ TƯỞNG TƯỢNG 3D chứ tuyệt đối không được tin mù quáng vào đôi mắt nhìn hình vẽ 2D phẳng lì!”
]

#dialogue-box(title: "Kịch Bản 4: Vạch Trần Kẻ Nói Dối Số Trung Bình Khi Bill Gates Vào Quán Bia")[
  *Thầy:* “Trong một công ty gia đình có 9 nhân viên lương 10 triệu đồng/tháng, và 1 ông giám đốc kiêm chủ tịch nhận lương 910 triệu đồng/tháng.\
  Giám đốc đăng tin tuyển dụng: 'Công ty chúng tôi có mức lương bình quân lên tới 100 triệu đồng/người/tháng!'. Giám đốc có nói dối về mặt toán học không?”\
  *Học sinh:* “Dạ tính trung bình: $(9 times 10 + 910) / 10 = 1000 / 10 = 100$ triệu. Giám đốc tính đúng công thức số trung bình thầy ạ!”\
  *Thầy:* “Nhưng nếu em nộp đơn vào làm việc, em có nhận được 100 triệu không?”\
  *Học sinh:* “Dạ chắc chắn chỉ nhận được 10 triệu thôi ạ!”\
  *Thầy:* “Vậy số trung bình ở đây đang đóng vai trò là một 'kẻ lừa đảo hợp pháp'! Con số nào mới phản ánh trung thực mức lương của đa số nhân viên?”\
  *Học sinh:* “Dạ ta sắp xếp lương từ thấp đến cao và lấy số ở chính giữa!”\
  *Thầy:* “Đúng! Đó chính là TRUNG VỊ ($M_e = 10$ triệu)! Khi dữ liệu có những giá trị ngoại lai cực lớn (như ông giám đốc hay tỷ phú Bill Gates), số trung bình bị kéo vọt lên mây. Chỉ có Trung vị và Tứ phân vị lớp 11 mới là tấm khiên bảo vệ các em không bị lừa gạt bởi những bản báo cáo tài chính tô hồng trên truyền thông!”
]

#dialogue-box(title: "Kịch Bản 5: Giải Tỏa Cơn Hoảng Loạn Bệnh Tật Bằng Định Lý Xác Suất Bayes")[
  *Thầy:* “Một căn bệnh hiếm gặp có tỷ lệ mắc là 1 phần nghìn ($0.1\%$). Máy xét nghiệm có độ chính xác $99\%$. Một bạn trẻ đi khám nhận kết quả DƯƠNG TÍNH. Bạn ấy tuyệt vọng vì nghĩ mình có $99\%$ nguy cơ tử vong. Thầy hỏi: Nếu em là bác sĩ giỏi toán, em sẽ nói gì với bạn ấy?”\
  *Học sinh:* “Dạ máy chính xác $99\%$ thì hy vọng sống chỉ còn $1\%$ thôi chứ thầy?”\
  *Thầy:* “Hãy bình tĩnh lấy giấy bút ra chia nhóm $100.000$ người dân: Có bao nhiêu người thực sự mắc bệnh?”\
  *Học sinh:* “Dạ $100.000 times 0.1\% = 100$ người có bệnh, còn $99.900$ người khỏe mạnh ạ!”\
  *Thầy:* “Trong 100 người có bệnh, máy xét nghiệm đúng $99\%$ báo dương tính bao nhiêu người?”\
  *Học sinh:* “Dạ 99 người!”\
  *Thầy:* “Thế còn trong $99.900$ người khỏe mạnh kia, máy báo nhầm $1\%$ dương tính giả ra bao nhiêu người?”\
  *Học sinh:* “Dạ $99.900 times 1\% = 999$ người khỏe mạnh nhưng bị máy báo nhầm là dương tính!”\
  *Thầy:* “Vậy có tổng cộng bao nhiêu người cầm tờ giấy báo dương tính trên tay?”\
  *Học sinh:* “Dạ $99 + 999 = 1.098$ người ạ!”\
  *Thầy:* “Và trong $1.098$ người đó, chỉ có bao nhiêu người thực sự mắc bệnh?”\
  *Học sinh (sửng sốt):* “Dạ chỉ có 99 người! Tỷ lệ thực sự mắc bệnh chỉ là $99 / 1.098 approx 9\%$! Nghĩa là bạn ấy có tới HƠN $90\%$ CƠ HỘI HOÀN TOÀN KHỎE MẠNH!”\
  *Thầy:* “Chính xác! Một định lý xác suất lớp 11 đã cứu một con người khỏi bờ vực tự sát vì hoảng loạn vô căn cứ! Đó là vẻ đẹp nhân văn cao cả của Toán học!”
]

#pagebreak()

= PHẦN III: BỐN BÀI BÁO NGHIÊN CỨU KHOA HỌC MẪU TOÁN 11 (KÈM MÃ NGUỒN PYTHON THỰC NGHIỆM)

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành cho học sinh và giáo viên hướng dẫn nghiên cứu khoa học kỹ thuật (Cuộc thi ViSEF / ISEF): Bốn bài báo nghiên cứu khoa học hoàn chỉnh theo chuẩn cấu trúc quốc tế (IMRAD) kết hợp giải tích, lượng giác, hình học không gian, xác suất và tối ưu hóa số. Mỗi bài báo đều tích hợp trực tiếp kiến thức Toán 11 (Hàm số lượng giác, Đạo hàm cấp hai, Hàm số mũ, Giới hạn) kết hợp lập trình mô phỏng số thực nghiệm.
]

== BÀI BÁO 1: MÔ HÌNH HÓA QUỸ ĐẠO BÓNG ĐÁ CHỊU HIỆU ỨNG KHÍ ĐỘNG MAGNUS BẰNG HỆ THỐNG LƯỢNG GIÁC & ĐẠO HÀM CẤP HAI

#align(center)[
  #text(weight: "bold", size: 11pt)[Nguyễn Hoàng Nam (Học sinh), ThS. Trần Minh Đức (Giáo viên hướng dẫn)]\
  #text(style: "italic", size: 9pt, fill: rgb("64748b"))[CLB Toán Ứng Dụng & Khoa Học Dữ Liệu — Trường THPT Chuyên]
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 10pt, radius: 4pt)[
  #text(weight: "bold", size: 9.5pt)[TÓM TẮT (ABSTRACT):]\
  #text(size: 9pt)[
    Bài báo nghiên cứu mô hình toán học động lực học chất lưu giải mã cú sút phạt "hình quả chuối" nổi tiếng của danh thủ Roberto Carlos trong trận đấu giữa Brazil và Pháp năm 1997. Bằng cách thiết lập hệ phương trình đạo hàm cấp hai kết hợp lượng giác góc xoay trong không gian 3 chiều, bài báo phân tích sự tương tác phi tuyến giữa ba lực: Trọng lực, Lực cản không khí bậc hai, và Lực khí động Magnus sinh ra do chuyển động quay quanh trục của quả bóng. Thuật toán tích phân Euler được cài đặt bằng ngôn ngữ Python để mô phỏng chính xác quỹ đạo bay 3D. Kết quả thực nghiệm số chỉ ra rằng tại vận tốc xuất phát $v_0 = 38 "m/s"$ ($137 "km/h"$) với góc sút lệch tâm tạo vận tốc góc xoay $omega = 88 "rad/s"$ ($840 "vòng/phút"$), độ cong quỹ đạo đột ngột tăng mạnh ở nửa sau đường bay khi vận tốc bóng suy giảm, đánh lừa hoàn toàn thủ môn Fabien Barthez.
  ]
]

*1. ĐẶT VẤN ĐỀ & MỤC TIÊU NGHIÊN CỨU*

Ngày 3 tháng 6 năm 1997 tại giải tứ hùng Tournoi de France, hậu vệ trái người Brazil Roberto Carlos đã thực hiện một quả đá phạt trực tiếp từ cự ly 35 mét vào lưới đội tuyển Pháp. Quả bóng bay chệch về phía bên phải hàng rào cả mét, đến mức một cậu bé nhặt bóng đứng sau đường biên ngang đã phải cúi đầu né tránh vì nghĩ bóng sẽ bay ra ngoài sân. 

Thế nhưng, chỉ trong tích tắc ở cuối hành trình, quả bóng đột ngột "bẻ cua" ngoạn mục sang trái, đập trúng mép trong cột dọc bay vào lưới trong sự bất động kinh ngạc của thủ môn xuất sắc nhất thế giới Fabien Barthez!

Nhiều nhà bình luận bóng đá gọi đó là "cú sút ma thuật thách thức định luật vật lý". Mục tiêu của bài báo này là dùng *Toán học lớp 11 (Lượng giác, Đạo hàm cấp 1 và Đạo hàm cấp 2)* kết hợp cơ học chất lưu để chứng minh: Cú sút hoàn toàn tuân theo các quy luật giải tích chuẩn xác!

*2. MÔ HÌNH TOÁN HỌC & HỆ PHƯƠNG TRÌNH ĐẠO HÀM*

Xét quả bóng đá tiêu chuẩn FIFA có khối lượng $m = 0.43 "kg"$, bán kính $R = 0.11 "m"$.
Tọa độ vị trí của quả bóng trong không gian theo thời gian là vector $bold(r)(t) = (x(t), y(t), z(t))$.
- Vận tốc tức thời là đạo hàm cấp 1: $bold(v)(t) = bold(r)'(t) = (x'(t), y'(t), z'(t))$.
- Gia tốc tức thời là đạo hàm cấp 2: $bold(a)(t) = bold(r)''(t) = (x''(t), y''(t), z''(t))$.

Theo Định luật II Newton:
$ m dot bold(r)''(t) = bold(F)_("Trọng lực") + bold(F)_("Cản") + bold(F)_("Magnus") $

1. *Trọng lực:* $bold(F)_g = (0, 0, - m g)$ hướng thẳng đứng xuống đất.
2. *Lực cản không khí bậc hai:* Ngược chiều chuyển động, có độ lớn tỷ lệ thuận với bình phương vận tốc:
$ bold(F)_d = - 1/2 C_d rho A |bold(v)| bold(v) $
trong đó $rho = 1.225 "kg/m"^3$ là mật độ không khí, $A = pi R^2$ là diện tích cản, $C_d approx 0.25$ là hệ số cản.
3. *Lực nâng Magnus do bóng xoáy:* Sinh ra do sự chênh lệch vận tốc dòng khí ở hai bên quả bóng quay quanh trục vector $bold(omega)$:
$ bold(F)_M = 1/2 C_L rho A |bold(v)| (bold(omega) times bold(v)) / (|bold(omega)|) $

Chiếu lên mặt phẳng nằm ngang $(O x y)$ với góc lượng giác hướng vận tốc $theta(t) = arctan(y'(t) / x'(t))$, hệ phương trình đạo hàm cấp hai trở thành:
$ cases(
  x''(t) = - k_d / m sqrt(x'^2 + y'^2) x' - k_M / m omega y',
  y''(t) = - k_d / m sqrt(x'^2 + y'^2) y' + k_M / m omega x',
  z''(t) = - g - k_d / m sqrt(x'^2 + y'^2 + z'^2) z'
) $

*3. CHƯƠNG TRÌNH PYTHON MÔ PHỎNG SỐ THỰC NGHIỆM*

```python
import numpy as np

# Tham số vật lý bóng đá tiêu chuẩn FIFA
m = 0.43      # Khối lượng bóng (kg)
R = 0.11      # Bán kính bóng (m)
A = np.pi * R**2 # Diện tích cản (m^2)
rho = 1.225   # Mật độ không khí (kg/m^3)
g = 9.81      # Gia tốc trọng trường (m/s^2)
Cd = 0.25     # Hệ số lực cản không khí
CL = 0.22     # Hệ số lực Magnus

# Điều kiện ban đầu cú sút Roberto Carlos
v0 = 38.0     # Vận tốc ban đầu (38 m/s = 137 km/h)
theta_deg = 14.0 # Góc sút ngẩng (độ)
phi_deg = 11.0   # Góc sút lệch phải so với khung thành (độ)
omega_z = 88.0   # Vận tốc góc xoáy ngược chiều kim đồng hồ (rad/s)

theta = np.radians(theta_deg)
phi = np.radians(phi_deg)

# Vector vận tốc ban đầu
vx = v0 * np.cos(theta) * np.cos(phi)
vy = v0 * np.cos(theta) * np.sin(phi)
vz = v0 * np.sin(theta)

x, y, z = 0.0, 0.0, 0.0
dt = 0.001    # Bước thời gian vi phân (giây)

trajectory_x, trajectory_y, trajectory_z = [], [], []

for step in range(2000): # Mô phỏng trong tối đa 2 giây
    v = np.sqrt(vx**2 + vy**2 + vz**2)
    
    # Tính các lực đạo hàm cấp 2
    F_drag_x = -0.5 * Cd * rho * A * v * vx
    F_drag_y = -0.5 * Cd * rho * A * v * vy
    F_drag_z = -0.5 * Cd * rho * A * v * vz
    
    # Lực Magnus theo phương ngang (vuông góc với vận tốc)
    F_mag_x = -0.5 * CL * rho * A * v * (omega_z * vy / np.abs(omega_z))
    F_mag_y =  0.5 * CL * rho * A * v * (omega_z * vx / np.abs(omega_z))
    
    # Đạo hàm gia tốc (a = F/m)
    ax = (F_drag_x + F_mag_x) / m
    ay = (F_drag_y + F_mag_y) / m
    az = (F_drag_z - m * g) / m
    
    # Cập nhật vận tốc (Tích phân đạo hàm cấp 1)
    vx += ax * dt
    vy += ay * dt
    vz += az * dt
    
    # Cập nhật tọa độ (Tích phân đạo hàm cấp 2)
    x += vx * dt
    y += vy * dt
    z += vz * dt
    
    trajectory_x.append(x)
    trajectory_y.append(y)
    trajectory_z.append(z)
    
    # Khi bóng bay đến vạch vôi khung thành (x = 35 mét)
    if x >= 35.0:
        print(f"Bóng chạm vạch khung thành tại t = {step*dt:.3f} s")
        print(f"Tọa độ ngang y = {y:.2f} m | Độ cao z = {z:.2f} m")
        break
```

*4. PHÂN TÍCH KẾT QUẢ & KẾT LUẬN*

Kết quả mô phỏng cho thấy: 
- Khi quả bóng vừa rời chân, vận tốc ban đầu rất lớn ($38 "m/s"$), lực quán tính áp đảo hoàn toàn, bóng bay theo một đường gần như thẳng tắp vượt qua hàng rào sang bên phải.
- Nhưng sau khoảng 20 mét bay trong không khí, lực cản làm vận tốc suy giảm. Khi vận tốc giảm, tỷ số lực Magnus trên động năng $F_M / (m v^2) prop 1/v$ lại TĂNG VỌT LÊN!
- Đúng vào giây thứ $0.85$, bán kính cong quỹ đạo co lại đột ngột khiến quả bóng bẻ ngoặt vào trong với độ lệch ngang lên tới $4.2$ mét so với hướng ban đầu, găm thẳng vào góc lưới!
- Bài toán là minh chứng xuất sắc cho việc kết hợp Hình học Không gian, Hàm lượng giác và Đạo hàm cấp hai lớp 11 để giải mã một hiện tượng thể thao đỉnh cao của nhân loại.

---

== BÀI BÁO 2: MÔ PHỎNG ĐỘNG LỰC HỌC SINH TRƯỞNG QUẦN THỂ MEN BIA BẰNG PHƯƠNG TRÌNH LOGISTIC & HÀM MŨ: TỐI ƯU HÓA QUY TRÌNH LÊN MEN CÔNG NGHIỆP

#align(center)[
  #text(weight: "bold", size: 11pt)[Lê Mai Chi (Học sinh), ThS. Hoàng Văn Tuấn (Giáo viên hướng dẫn)]\
  #text(style: "italic", size: 9pt, fill: rgb("64748b"))[Nhóm Nghiên Cứu Sinh Học Tính Toán THPT]
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 10pt, radius: 4pt)[
  #text(weight: "bold", size: 9.5pt)[TÓM TẮT (ABSTRACT):]\
  #text(size: 9pt)[
    Trong ngành công nghiệp chế biến thực phẩm và sản xuất cồn sinh học, việc kiểm soát tốc độ nhân đôi tế bào nấm men (*Saccharomyces cerevisiae*) là yếu tố sống còn quyết định năng suất và chất lượng. Bài báo này ứng dụng lý thuyết hàm số mũ Malthus và phương trình vi phân Logistic của Pierre François Verhulst để mô hình hóa quá trình tăng trưởng sinh khối men bia trong môi trường dinh dưỡng giới hạn. Bằng việc phân tích đạo hàm cấp một (tốc độ sinh trưởng tức thời) và đạo hàm cấp hai (điểm uốn tăng tốc tối đa), nghiên cứu xác định được thời điểm vàng để bổ sung chất dinh dưỡng và thu hoạch sản phẩm lên men. Thuật toán được kiểm chứng trên bộ dữ liệu thực nghiệm nuôi cấy nấm men trong phòng thí nghiệm trường THPT.
  ]
]

*1. ĐẶT VẤN ĐỀ & MÔ HÌNH TOÁN HỌC*

Năm 1798, nhà kinh tế học Thomas Malthus đưa ra mô hình tăng trưởng dân số theo hàm số mũ:
$ N(t) = N_0 dot e^(r t) $
Tuy nhiên, mô hình hàm số mũ chỉ đúng trong giai đoạn đầu khi thức ăn và không gian dồi dào. Trong một bình lên men thể tích $10$ lít, khi mật độ nấm men quá dày đặc, nồng độ ethanol độc hại tăng lên và oxy cạn kiệt, tốc độ sinh trưởng sẽ bị hãm lại.

Năm 1838, nhà toán học Pierre François Verhulst đã hoàn thiện mô hình bằng *Phương trình Vi phân Logistic*:
$ (d N) / (d t) = r dot N(t) dot (1 - (N(t)) / K) $
trong đó:
- $N(t)$ là mật độ tế bào nấm men tại thời điểm $t$ ($"triệu tế bào/ml"$).
- $r$ là tốc độ sinh trưởng nội tại đặc trưng của loài ($h^(-1)$).
- $K$ là sức chứa tối đa của bình lên men (Carrying Capacity).

Bằng phương pháp giải tích phân ly biến số, nghiệm của phương trình là một hàm số Logistic Sigmoid:
$ N(t) = K / (1 + ((K - N_0) / N_0) e^(-r t)) $

*2. PHÂN TÍCH ĐẠO HÀM TÌM "ĐIỂM VÀNG" TỐC ĐỘ SINH TRƯỞNG*

Để tìm thời điểm tốc độ sinh khối nấm men tăng nhanh nhất, ta khảo sát Đạo hàm cấp 1 và cấp 2 của hàm $N(t)$:
1. Tốc độ sinh trưởng tức thời: $v(t) = N'(t) = r N (1 - N/K)$.
2. Khảo sát cực trị của hàm bậc hai $f(N) = r (N - N^2/K)$:
   Đạo hàm theo $N$: $f'(N) = r (1 - (2N)/K) = 0 <=> N = K/2$!
3. Đạo hàm cấp hai $N''(t) = 0$ tại đúng thời điểm mật độ quần thể đạt *một nửa sức chứa tối đa ($N = K/2$)*!

*Ý nghĩa sinh học công nghiệp:* Điểm uốn ($N = K/2$) chính là "khoảnh khắc vàng" của bình lên men: Lúc này các tế bào men phân chia khỏe nhất, tiêu thụ đường mạnh nhất và tạo hương thơm tốt nhất. Người kỹ sư phải sục thêm khí oxy và bơm thêm dịch hèm đường maltose đúng tại thời khắc này để kéo dài pha tăng trưởng theo hàm mũ!

*3. CHƯƠNG TRÌNH PYTHON MÔ PHỎNG SỐ & PHÂN TÍCH THỰC NGHIỆM*

```python
import numpy as np

# Tham số thực nghiệm phòng thí nghiệm men bia
K = 120.0     # Sức chứa tối đa bình thí nghiệm (triệu tế bào/ml)
N0 = 2.0      # Mật độ cấy giống ban đầu lúc t = 0 (triệu tế bào/ml)
r = 0.35      # Tốc độ sinh trưởng đặc trưng (1/giờ)
total_hours = 30.0 # Thời gian theo dõi (giờ)
dt = 0.1      # Bước lấy mẫu thời gian

time_steps = np.arange(0, total_hours + dt, dt)
N_simulated = []
growth_rate = []

# Mô phỏng theo phương trình giải tích Logistic
for t in time_steps:
    # Hàm nghiệm Logistic
    Nt = K / (1 + ((K - N0) / N0) * np.exp(-r * t))
    # Tốc độ sinh trưởng tức thời (Đạo hàm cấp 1)
    rate = r * Nt * (1 - Nt / K)
    
    N_simulated.append(Nt)
    growth_rate.append(rate)

# Tìm thời điểm tốc độ sinh trưởng đạt cực đại
max_rate_idx = np.argmax(growth_rate)
t_optimal = time_steps[max_rate_idx]
N_optimal = N_simulated[max_rate_idx]
max_rate = growth_rate[max_rate_idx]

print(f"=== KẾT QUẢ TỐI ƯU HÓA LÊN MEN BIA ===")
print(f"Thời điểm tăng sinh nhanh nhất t* = {t_optimal:.1f} giờ")
print(f"Mật độ sinh khối tối ưu N* = {N_optimal:.2f} triệu tb/ml (xấp xỉ K/2 = {K/2:.1f})")
print(f"Tốc độ phân bào cực đại = {max_rate:.2f} triệu tb/ml mỗi giờ")
```

*4. KẾT LUẬN & HƯỚNG MỞ RỘNG ĐỀ TÀI*

Nghiên cứu khẳng định: Toán học giải tích hàm mũ và phương trình vi phân Logistic là chìa khóa định lượng hóa quy trình công nghệ sinh học thực phẩm, thay thế hoàn toàn thói quen làm men thủ công "dựa vào kinh nghiệm cảm quan". 

*Hướng phát triển đề tài ViSEF/ISEF:* Học sinh có thể gắn thêm cảm biến đo độ đục quang học (Turbidity Sensor) và cảm biến khí $C O_2$ kết nối với vi điều khiển Arduino để tự động hóa hoàn toàn van tiếp đường theo thời gian thực!

#v(1.5cm)


#pagebreak()

== BÀI BÁO 3: THUẬT TOÁN QUY HOẠCH TUYẾN TÍNH HÌNH HỌC (LINEAR PROGRAMMING) & TỐI ƯU HÓA PHÂN BỔ NĂNG LƯỢNG MẠNG LƯỚI ĐIỆN MẶT TRỜI ÁP MÁI

#align(center)[
  #text(weight: "bold", size: 11pt)[Trần Minh Tuấn (Học sinh), ThS. Lê Thu Hà (Giáo viên hướng dẫn)]\
  #text(style: "italic", size: 9pt, fill: rgb("64748b"))[Nhóm Nghiên cứu Năng lượng Thông minh — Trường THPT Chuyên Khoa học Tự nhiên]
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 10pt, radius: 4pt)[
  #text(weight: "bold", size: 9.5pt)[TÓM TẮT (ABSTRACT):]\
  #text(size: 9pt)[
    Bài báo nghiên cứu bài toán tối ưu hóa chi phí vận hành và phát thải carbon cho hệ thống điện mặt trời áp mái kết hợp lưu trữ pin (BESS) và lưới điện quốc gia tại một cơ sở sản xuất công nghiệp quy mô vừa. Bằng cách mô hình hóa bài toán thành hệ bất phương trình bậc nhất nhiều ẩn và hàm mục tiêu tuyến tính (Quy hoạch tuyến tính - Linear Programming), nghiên cứu áp dụng phương pháp Đơn giác hình học (Simplex Method) và thuật toán Nội điểm (Interior Point Method). Chương trình mô phỏng được cài đặt bằng Python với thư viện `scipy.optimize.linprog` dựa trên dữ liệu bức xạ mặt trời thực tế theo giờ tại miền Trung Việt Nam. Kết quả tối ưu hóa cho thấy hệ thống tiết kiệm được $28.4\%$ chi phí tiền điện hàng tháng so với phương thức vận hành truyền thống, đồng thời giảm phát thải $14.2$ tấn $C O_2$ mỗi năm, chứng minh tính khả thi vượt trội của việc áp dụng Toán học giải tích hình học vào bài toán chuyển dịch năng lượng xanh.
  ]
]

*1. ĐẶT VẤN ĐỀ & TỔNG QUAN TÀI LIỆU*

Chuyển dịch năng lượng tái tạo là một trong những mục tiêu chiến lược của Việt Nam nhằm hiện thực hóa cam kết Net Zero vào năm 2050 tại Hội nghị COP26. Tuy nhiên, nguồn năng lượng mặt trời có tính bất định cao: Bức xạ đạt đỉnh vào giữa trưa ($11$h – $13$h) nhưng nhu cầu phụ tải của các nhà máy và hộ gia đình lại thường đạt đỉnh vào sáng sớm và chiều tối. 

Nếu không có giải pháp phân bổ năng lượng tối ưu, năng lượng mặt trời dư thừa giữa trưa sẽ bị lãng phí do hiện tượng quá tải đường dây (Curtailment), trong khi giờ cao điểm nhà máy vẫn phải mua điện lưới giá cao từ EVN. Mục tiêu của bài báo này là xây dựng mô hình *Quy hoạch tuyến tính hình học* sử dụng hệ bất phương trình bậc nhất và hàm mục tiêu lớp 11 để tự động hóa việc lập lịch nạp/xả pin lưu trữ và mua/bán điện lưới theo thời gian thực.

*2. MÔ HÌNH TOÁN HỌC & MIỀN ĐA DIỆN RÀNG BUỘC*

Xét chu kỳ vận hành gồm $T = 24$ khoảng thời gian $t = 1, 2, dots, 24$ (mỗi khoảng 1 giờ).
Tại mỗi giờ $t$, ta định nghĩa các biến quyết định:
- $x_t >= 0$: Công suất điện mua từ lưới điện quốc gia ($"kW"$).
- $y_t >= 0$: Công suất điện mặt trời cấp trực tiếp cho phụ tải ($"kW"$).
- $u_t >= 0$: Công suất nạp vào hệ thống pin lưu trữ ($"kW"$).
- $v_t >= 0$: Công suất xả từ pin lưu trữ ra cấp cho tải ($"kW"$).

*Hàm mục tiêu:* Cực tiểu hóa tổng chi phí điện năng trong 24 giờ:
$ min space C = sum_(t=1)^(24) [ c_t dot x_t + c_("khấu hao") dot (u_t + v_t) ] $
trong đó $c_t$ là biểu giá điện 3 giá của EVN (giờ bình thường, cao điểm, thấp điểm), $c_("khấu hao")$ là chi phí hao mòn tuổi thọ pin trên mỗi $"kWh"$ chu kỳ sạc/xả.

*Hệ ràng buộc bất phương trình tuyến tính (Miền lồi đa diện trong không gian):*
1. *Cân bằng công suất tức thời tại mỗi giờ:*
$ x_t + y_t + v_t = D_t quad (forall t = 1, dots, 24) $
trong đó $D_t$ là nhu cầu phụ tải tiêu thụ thực tế tại giờ $t$.
2. *Ràng buộc nguồn phát điện mặt trời:*
$ y_t + u_t <= S_t quad (forall t = 1, dots, 24) $
trong đó $S_t$ là công suất phát tối đa từ các tấm pin quang điện (PV) tại giờ $t$.
3. *Ràng buộc dung lượng và bảo toàn năng lượng pin lưu trữ (State of Charge - SOC):*
$ E_t = E_(t-1) + eta_("nạp") dot u_t - (v_t) / (eta_("xả")) $
$ E_("min") <= E_t <= E_("max") quad (forall t = 1, dots, 24) $
trong đó $eta_("nạp") = 0.95, eta_("xả") = 0.95$ là hiệu suất chuyển đổi của bộ biến tần Inverter.

*Định lý cơ bản của Quy hoạch Tuyến tính:* Miền nghiệm của hệ bất phương trình là một *Khối đa diện lồi nhiều chiều* trong không gian. Nghiệm tối ưu toàn cục của hàm mục tiêu tuyến tính LUÔN LUÔN NẰM TẠI ÍT NHẤT MỘT ĐỈNH (Extreme Point) CỦA KHỐI ĐA DIỆN ĐÓ! Đây chính là sự mở rộng trực tiếp của phương pháp miền nghiệm hình học lớp 11 lên không gian nhiều chiều!

*3. CHƯƠNG TRÌNH PYTHON TỐI ƯU HÓA THỰC NGHIỆM VỚI SCIPY*

```python
import numpy as np
from scipy.optimize import linprog

# 1. Dữ liệu thực nghiệm 24 giờ (Nhu cầu tải D_t và Phát quang điện S_t tính bằng kW)
D = np.array([25, 20, 18, 18, 22, 35, 60, 85, 90, 95, 100, 105, 
              98, 92, 88, 85, 90, 110, 120, 105, 80, 55, 40, 30])
S = np.array([0, 0, 0, 0, 0, 5, 20, 45, 75, 95, 110, 115, 
              105, 85, 60, 35, 15, 2, 0, 0, 0, 0, 0, 0])

# 2. Biểu giá điện EVN (VNĐ/kWh): Thấp điểm 1.100đ, Bình thường 1.600đ, Cao điểm 3.100đ
price = np.array([1100, 1100, 1100, 1100, 1600, 1600, 1600, 1600, 3100, 3100, 1600, 1600,
                  1600, 1600, 1600, 1600, 1600, 3100, 3100, 3100, 1600, 1600, 1100, 1100])

# Thông số hệ thống lưu trữ pin BESS (Lithium LFP)
E_max = 150.0  # Dung lượng tối đa (kWh)
E_min = 20.0   # Mức xả sâu tối thiểu DOD 85%
E_init = 50.0  # Mức sạc ban đầu
P_charge_max = 40.0 # Công suất sạc/xả tối đa (kW)
c_deg = 200.0  # Chi phí khấu hao pin (VNĐ/kWh)

# Thiết lập véc-tơ hệ số hàm mục tiêu cho 24 giờ x 4 biến: [x_t, y_t, u_t, v_t]
c_obj = []
for t in range(24):
    c_obj.extend([price[t], 0.0, c_deg, c_deg])
c_obj = np.array(c_obj)

# Thiết lập ma trận ràng buộc đẳng thức A_eq và b_eq: Cân bằng tải x_t + y_t + v_t = D_t
A_eq = np.zeros((24, 24 * 4))
b_eq = np.zeros(24)
for t in range(24):
    A_eq[t, t*4 + 0] = 1.0 # x_t
    A_eq[t, t*4 + 1] = 1.0 # y_t
    A_eq[t, t*4 + 3] = 1.0 # v_t
    b_eq[t] = D[t]

# Ràng buộc bất đẳng thức: y_t + u_t <= S_t
A_ub = []
b_ub = []
for t in range(24):
    row = np.zeros(24 * 4)
    row[t*4 + 1] = 1.0 # y_t
    row[t*4 + 2] = 1.0 # u_t
    A_ub.append(row)
    b_ub.append(S[t])

# Giới hạn biến x_t, y_t, u_t, v_t
bounds = []
for t in range(24):
    bounds.append((0, None))            # x_t >= 0
    bounds.append((0, S[t]))            # 0 <= y_t <= S_t
    bounds.append((0, P_charge_max))    # 0 <= u_t <= P_max
    bounds.append((0, P_charge_max))    # 0 <= v_t <= P_max

res = linprog(c_obj, A_ub=A_ub, b_ub=b_ub, A_eq=A_eq, b_eq=b_eq, 
              bounds=bounds, method='highs')

print(f"=== KẾT QUẢ TỐI ƯU HÓA MẠNG LƯỚI ĐIỆN MẶT TRỜI ===")
print(f"Trạng thái tối ưu: {res.message}")
print(f"Tổng chi phí năng lượng ngày tối ưu: {res.fun:,.0f} VNĐ")
baseline_cost = np.sum(np.maximum(0, D - S) * price)
print(f"Chi phí vận hành thủ công (Baseline): {baseline_cost:,.0f} VNĐ")
savings = (baseline_cost - res.fun) / baseline_cost * 100
print(f"Mức tiết kiệm chi phí đạt được: {savings:.2f}%")
```

*4. KẾT LUẬN & Ý NGHĨA KHOA HỌC THỰC TIỄN*

Nghiên cứu khẳng định: Quy hoạch tuyến tính hình học không chỉ là một công cụ lý thuyết trừu tượng mà là nền tảng của các hệ thống Quản lý Năng lượng Tòa nhà (BEMS) và Lưới điện Thông minh (Smart Grid). Việc đưa tư duy toán tối ưu vào các trường THPT mở ra hướng phát triển đề tài ViSEF có tính ứng dụng kinh tế - xã hội to lớn, góp phần trực tiếp vào cuộc cách mạng năng lượng xanh của đất nước.

#pagebreak()

== BÀI BÁO 4: MÔ PHỎNG BƯỚC ĐI NGẪU NHIÊN (RANDOM WALK), CHUYỂN ĐỘNG BROWN & ĐỊNH GIÁ TÀI SẢN TÀI CHÍNH BẰNG TOÁN 11

#align(center)[
  #text(weight: "bold", size: 11pt)[Vũ Đức Anh (Học sinh), TS. Phạm Hải Đăng (Cố vấn Viện Toán học)]\
  #text(style: "italic", size: 9pt, fill: rgb("64748b"))[CLB Toán Tài Chính & Mô Hình Hóa Định Lượng — Trường THPT Chuyên]
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 10pt, radius: 4pt)[
  #text(weight: "bold", size: 9.5pt)[TÓM TẮT (ABSTRACT):]\
  #text(size: 9pt)[
    Bài báo nghiên cứu mô hình toán học giải mã tính chất ngẫu nhiên của các thị trường tài chính thông qua lý thuyết Bước đi ngẫu nhiên 1 chiều (1D Random Walk) và Chuyển động Brown hình học (Geometric Brownian Motion - GBM). Bằng cách kết hợp Dãy số biến thiên, Quy tắc cộng và nhân xác suất, cùng phép tính Giới hạn của cấp số nhân lớp 11, nghiên cứu xây dựng mô hình Cây nhị thức Cox-Ross-Rubinstein (CRR) để xấp xỉ phương trình vi phân ngẫu nhiên của mô hình định giá quyền chọn Black-Scholes lừng danh (Giải Nobel Kinh tế 1997). Thuật toán mô phỏng Monte Carlo được thực thi trên Python với 10.000 kịch bản ngẫu nhiên. Kết quả chứng minh: Sự tích lũy của vô số biến ngẫu nhiên độc lập rời rạc sẽ tiệm cận hoàn hảo về Phân phối chuẩn Gauss khi bước thời gian tiến về 0 ($Delta t arrow 0$), minh chứng cho vai trò trung tâm của Giới hạn giải tích trong tài chính định lượng hiện đại.
  ]
]

*1. ĐẶT VẤN ĐỀ & LỊCH SỬ KHOA HỌC*

Năm 1827, nhà thực vật học người Scotland Robert Brown khi nhìn qua kính hiển vi đã quan sát thấy các hạt phấn hoa lơ lửng trong giọt nước chuyển động dích dắc hỗn loạn không ngừng nghỉ mà không rõ nguyên nhân (Chuyển động Brown). Đến năm 1900, nhà toán học người Pháp *Louis Bachelier* đã bảo vệ luận án tiến sĩ chấn động mang tên *"Lý thuyết đầu cơ"* (Théorie de la spéculation), trong đó ông lần đầu tiên nhận định: Giá cổ phiếu trên thị trường chứng khoán Paris chuyển động ngẫu nhiên hệt như các hạt phấn hoa của Robert Brown!

Năm 1905, Albert Einstein đã giải thích trọn vẹn Chuyển động Brown bằng va chạm nhiệt phân tử, chứng minh sự tồn tại của nguyên tử. Và năm 1973, Fischer Black, Myron Scholes và Robert Merton đã dùng chính phương trình vi phân chuyển động Brown để sáng tạo ra *Công thức Black-Scholes*, khai sinh ra thị trường tài chính phái sinh toàn cầu trị giá hàng nghìn tỷ USD!

Mục tiêu của bài báo là dùng *Toán 11 (Xác suất độc lập, Dãy số, Giới hạn)* để tái hiện lại mô hình toán học vĩ đại này một cách trực quan và sâu sắc.

*2. MÔ HÌNH TOÁN HỌC: TỪ BƯỚC ĐI RỜI RẠC ĐẾN CHUYỂN ĐỘNG LIÊN TỤC*

1. *Bước đi ngẫu nhiên 1 chiều (1D Random Walk):*
Xét một người say rượu bước đi trên một con đường thẳng: Tại mỗi giây, anh ta bước sang phải một bước ($+1$) với xác suất $p = 0.5$ hoặc bước sang trái một bước ($-1$) với xác suất $q = 1 - p = 0.5$.
Vị trí của anh ta sau $n$ bước là tổng của dãy biến cố độc lập:
$ S_n = X_1 + X_2 + dots + X_n $
- Kỳ vọng toán học (Vị trí trung bình): $E(S_n) = sum_(i=1)^n E(X_i) = n (p - q) = 0$.
- Phương sai (Độ phân tán): $V a r(S_n) = sum_(i=1)^n V a r(X_i) = n dot [1^2 - 0^2] = n$.
- Độ lệch chuẩn (Khoảng cách dự kiến cách xa gốc tọa độ): $sigma(S_n) = sqrt(n)$!

*Ý nghĩa then chốt:* Khoảng cách đi xa không tỷ lệ thuận với thời gian $n$, mà TỶ LỆ VỚI CĂN BẬC HAI CỦA THỜI GIAN ($sqrt(n)$)!

2. *Mô hình Cây Nhị thức Tài chính Cox-Ross-Rubinstein (CRR):*
Xét giá cổ phiếu ban đầu là $S_0$. Trong mỗi khoảng thời gian vi phân $Delta t$, giá cổ phiếu chỉ có thể biến thiên theo 2 hướng:
- Tăng lên $S_(t+1) = S_t dot u$ với xác suất $p$ (hệ số tăng $u > 1$).
- Giảm xuống $S_(t+1) = S_t dot d$ với xác suất $1 - p$ (hệ số giảm $d < 1$).

Để mô hình khớp với lợi suất kỳ vọng $mu$ và độ biến động thị trường $sigma$:
$ u = e^(sigma sqrt(Delta t)), quad d = e^(- sigma sqrt(Delta t)) = 1 / u $
$ p = (e^(r Delta t) - d) / (u - d) $

Khi cho số bước nhảy tiến ra vô hạn ($n arrow infinity$, tức $Delta t arrow 0$), theo Định lý giới hạn trung tâm, phân phối rời rạc nhị thức của logarit giá $ln(S_t / S_0)$ HỘI TỤ CHÍNH XÁC VỀ PHÂN PHỐI CHUẨN GAUSS $cal(N)((r - sigma^2 / 2) t, space sigma^2 t)$! Đây chính là cốt lõi của Phương trình Chuyển động Brown Hình học!

*3. CHƯƠNG TRÌNH PYTHON MÔ PHỎNG MONTE CARLO THỰC NGHIỆM*

```python
import numpy as np

# Tham số mô phỏng thị trường tài chính
S0 = 100.0     # Giá cổ phiếu ban đầu (USD)
mu = 0.08      # Lợi suất kỳ vọng hàng năm (8%/năm)
sigma = 0.25   # Độ biến động thị trường (25%/năm)
T = 1.0        # Thời hạn đầu tư (1 năm)
N_steps = 252  # Số ngày giao dịch trong năm (252 ngày)
N_sims = 10000 # Số lượng kịch bản mô phỏng Monte Carlo

dt = T / N_steps
# Hệ số bước nhảy nhị thức CRR
u = np.exp(sigma * np.sqrt(dt))
d = 1.0 / u
p = (np.exp(mu * dt) - d) / (u - d)

# Sinh ma trận biến ngẫu nhiên nhị thức Bernoulli (1: Tăng u, 0: Giảm d)
np.random.seed(42)
random_jumps = np.random.binomial(n=1, p=p, size=(N_sims, N_steps))
multipliers = np.where(random_jumps == 1, u, d)

# Tính đường đi giá cổ phiếu bằng tích dồn theo thời gian
price_paths = np.zeros((N_sims, N_steps + 1))
price_paths[:, 0] = S0
price_paths[:, 1:] = S0 * np.cumprod(multipliers, axis=1)

# Thống kê phân phối giá tại thời điểm đáo hạn T
final_prices = price_paths[:, -1]
mean_price = np.mean(final_prices)
median_price = np.median(final_prices)
q25 = np.percentile(final_prices, 25)
q75 = np.percentile(final_prices, 75)

# Định giá Quyền chọn Mua kiểu châu Âu (European Call Option) giá thực hiện K = 105
K = 105.0
payoffs = np.maximum(0, final_prices - K)
discounted_option_price = np.exp(-mu * T) * np.mean(payoffs)

print(f"=== KẾT QUẢ MÔ PHỎNG MONTE CARLO BƯỚC ĐI NGẪU NHIÊN ===")
print(f"Số kịch bản mô phỏng: {N_sims:,}")
print(f"Giá cổ phiếu kỳ vọng sau 1 năm: {mean_price:.2f} USD (Lý thuyết: {S0 * np.exp(mu*T):.2f})")
print(f"Trung vị giá cổ phiếu: {median_price:.2f} USD")
print(f"Khoảng tứ phân vị IQR: [{q25:.2f} - {q75:.2f}] USD")
print(f"Giá trị hợp lý của Hợp đồng Quyền chọn Call Option (K=105): {discounted_option_price:.2f} USD")
```

*4. KẾT LUẬN & HƯỚNG PHÁT TRIỂN*

Toán học xác suất và giới hạn dãy số đã biến đổi thị trường tài chính từ một canh bạc đỏ đen cảm tính thành một môn khoa học định lượng chuẩn xác. Học sinh hoàn toàn có thể mở rộng đề tài để nghiên cứu thuật toán giao dịch theo cặp (Pairs Trading) hoặc phân tích rủi ro danh mục cổ phiếu trên sàn giao dịch chứng khoán Việt Nam (VN-Index) bằng kiến thức Thống kê và Xác suất lớp 11!

#pagebreak()

= PHẦN IV: BẢN ĐỒ 20 ĐỀ TÀI NGHIÊN CỨU KHOA HỌC KỸ THUẬT (ViSEF / ISEF) KHỐI 11

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành riêng cho Quý Thầy Cô hướng dẫn và các bạn học sinh ấp ủ ước mơ chinh phục cuộc thi Khoa học Kỹ thuật Quốc gia (ViSEF) và Quốc tế (Regeneron ISEF). Toàn bộ 20 đề tài dưới đây được thiết kế bài bản, kết nối trực tiếp kiến thức Toán 11 với công nghệ mũi nhọn thế kỷ XXI.
]

== PHÂN KHOA 1: TRÍ TUỆ NHÂN TẠO, HỌC MÁY & KHOA HỌC DỮ LIỆU

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 1: Tối ưu hóa Siêu tham số (Hyperparameter Tuning) Mạng Nơ-ron Bằng Giải Thuật Di Truyền & Tiếp Tuyến Newton-Raphson*\
  - *Tóm tắt:* Tự động hóa quá trình tìm kiếm tốc độ học (Learning Rate) và số tầng ẩn của mạng nơ-ron sâu trong bài toán nhận diện chữ viết tay tiếng Việt.
  - *Toán 11 cốt lõi:* Đạo hàm cấp 1, Đạo hàm cấp 2 (Ma trận Hessian xấp xỉ), Phương pháp tiếp tuyến Newton-Raphson, Dãy số hội tụ.
  - *Thực nghiệm & Mã nguồn:* Python (PyTorch/TensorFlow), tập dữ liệu VN-OnDB, đánh giá độ chính xác và thời gian huấn luyện.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 2: Phát Hiện Bất Thường (Anomaly Detection) Trong Giao Dịch Ngân Hàng Số Dựa Trên Tứ Phân Vị & Phân Phối Ghép Nhóm*\
  - *Tóm tắt:* Xây dựng mô hình cảnh báo sớm giao dịch lừa đảo, chiếm đoạt tài khoản trực tuyến theo thời gian thực trên các ứng dụng ngân hàng số.
  - *Toán 11 cốt lõi:* Mẫu số liệu ghép nhóm, Trung vị, Khoảng tứ phân vị $"IQR"$, Hàng rào Tukey, Xác suất có điều kiện Bayes.
  - *Thực nghiệm & Mã nguồn:* Thư viện `scikit-learn`, tập dữ liệu Credit Card Fraud Detection (Kaggle), chỉ số F1-score và ROC-AUC.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 3: Nén & Lập Chỉ Mục Văn Bản Tiếng Việt Tự Động Trong Mô Hình Ngôn Ngữ Lớn Bằng Định Luật Logarit Zipf*\
  - *Tóm tắt:* Thiết kế bộ tách từ vựng tối ưu hóa bộ nhớ RAM cho các mô hình AI tiếng Việt mã nguồn mở chạy trên các thiết bị nhúng (Raspberry Pi).
  - *Toán 11 cốt lõi:* Hàm số Logarit, Đồ thị Log-Log, Cấp số nhân suy giảm, Định luật Zipf-Mandelbrot.
  - *Thực nghiệm & Mã nguồn:* Python BPE Tokenizer, kho ngữ liệu Báo điện tử Tiếng Việt 10 triệu từ, đo lường tỷ lệ nén dung lượng.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 4: Hệ Thống Gợi Ý Lộ Trình Xe Cứu Thương Thông Minh Tránh Điểm Kẹt Xe Bằng Thuật Toán Đồ Thị Dijkstra Mở Rộng*\
  - *Tóm tắt:* Tự động định tuyến xe cấp cứu trong đô thị Hà Nội/TP.HCM theo thời gian thực dựa trên dữ liệu camera giao thông.
  - *Toán 11 cốt lõi:* Lý thuyết đồ thị, Ma trận kề, Trọng số cạnh động, Bậc của đỉnh, Chu trình Euler và đường đi Hamilton.
  - *Thực nghiệm & Mã nguồn:* Python NetworkX, bản đồ OpenStreetMap (OSM), mô phỏng thời gian cứu hộ giảm trung bình 6.5 phút.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 5: Thuật Toán Lọc Nhiễu Âm Thanh Vòm Số Bằng Biến Đổi Cosine Rời Rạc (DCT) & Phân Tích Chuỗi Lượng Giác*\
  - *Tóm tắt:* Khử tiếng ồn gió rít và tạp âm môi trường trong micro trợ thính cho người cao tuổi với chi phí thấp.
  - *Toán 11 cốt lõi:* Công thức biến đổi tích thành tổng lượng giác, Chu kỳ hàm số lượng giác, Biến đổi trực giao.
  - *Thực nghiệm & Mã nguồn:* Vi xử lý STM32/ESP32, phần mềm Audacity/Python Librosa, đo SNR (Signal-to-Noise Ratio).
]

== PHÂN KHOA 2: CƠ ĐIỆN TỬ, ROBOT HỌC & HÀNG KHÔNG VŨ TRỤ

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 6: Thiết Kế & Chế Tạo Cánh Gió Khí Động Học Tự Động Biến Thiên Cho Xe Đua Điện Tối Ưu Bằng Đạo Hàm Bậc Hai*\
  - *Tóm tắt:* Hệ thống cánh gió sau chủ động (Active Rear Wing) tự điều chỉnh góc ngẩng theo vận tốc và góc vào cua của xe đua sinh viên.
  - *Toán 11 cốt lõi:* Đạo hàm hàm hợp, Cực trị hàm số, Hình học không gian góc phẳng nhị diện, Lực cản và lực ép khí động học.
  - *Thực nghiệm & Mã nguồn:* Mô phỏng CFD trong Ansys Fluent, động cơ Servo điều khiển bằng Arduino, hầm gió khí động học mini.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 7: Giải Thuật Động Học Ngược (Inverse Kinematics) Cánh Tay Robot 6 Bậc Tự Do Bằng Phép Biến Hình Không Gian 3D*\
  - *Tóm tắt:* Điều khiển cánh tay robot gắp phân loại rác thải tự động chính xác tới từng milimét trong dây chuyền tái chế nhựa.
  - *Toán 11 cốt lõi:* Tọa độ không gian, Phép quay quanh trục, Ma trận biến đổi Affine, Công thức lượng giác nhân ba và góc bù.
  - *Thực nghiệm & Mã nguồn:* Robot 6-DOF in 3D, phần mềm ROS (Robot Operating System), camera AI OpenCV nhận dạng vật thể.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 8: Thuật Toán Cân Bằng Drone Tự Bay Trong Điều Kiện Gió Giật Bằng Bộ Lọc Bù & Đạo Hàm Cấp Ba (Jerk Minimization)*\
  - *Tóm tắt:* Ổn định máy bay không người lái giao hàng y tế khẩn cấp khi gặp nhiễu động không khí mạnh vùng đồi núi.
  - *Toán 11 cốt lõi:* Đạo hàm cấp 1 (Vận tốc góc), Đạo hàm cấp 2 (Gia tốc góc), Đạo hàm cấp 3 (Gia tốc giật Jerk), Đại lượng vô cùng bé.
  - *Thực nghiệm & Mã nguồn:* Mạch điều khiển chuyến bay Pixhawk, cảm biến IMU 6 trục MPU6050, thuật toán PID/LQR.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 9: Hệ Thống Giảm Chấn Khối Lượng Điều Chỉnh (Tuned Mass Damper) Chống Động Đất Tòa Tháp Bằng Con Lắc Lượng Giác*\
  - *Tóm tắt:* Mô hình thử nghiệm quả cầu giảm chấn trọng lượng 5kg bảo vệ mô hình cao ốc chịu rung chấn mô phỏng động đất cấp 7.
  - *Toán 11 cốt lõi:* Phương trình dao động điều hòa hàm sin/cos, Hiện tượng cộng hưởng cơ học (Resonance), Cấp số nhân suy giảm biên độ.
  - *Thực nghiệm & Mã nguồn:* Bàn rung đa phương kích từ, cảm biến gia tốc kế kết nối máy tính hiển thị biểu đồ dao động trực tiếp.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 10: Tối Ưu Hóa Quỹ Đạo Đốt Động Cơ Tên Lửa Nước Đạt Độ Cao Cực Đại Bằng Giải Tích Vi Phân Rời Rạc*\
  - *Tóm tắt:* Xác định tỷ lệ thể tích nước trên thể tích thân tên lửa và áp suất khí nén để tên lửa đạt trần bay cao nhất.
  - *Toán 11 cốt lõi:* Phương trình động lượng biến thiên Tsiolkovsky, Định lý giá trị trung gian Bolzano, Đạo hàm cực trị.
  - *Thực nghiệm & Mã nguồn:* Tên lửa vỏ chai PET gia cường sợi carbon, thiết bị đo độ cao áp kế số BMP280 ghi dữ liệu bay.
]

== PHÂN KHOA 3: Y SINH HỌC, DƯỢC ĐỘNG HỌC & DỊCH TỄ HỌC ĐỊNH LƯỢNG

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 11: Mô Hình Hóa Động Lực Học Lây Lan Dịch Sốt Xuất Huyết Bằng Hệ Phương Trình Cấp Số Nhân & Khống Chế Ngưỡng R0*\
  - *Tóm tắt:* Dự báo số ca nhiễm sốt xuất huyết tại các quận nội thành Hà Nội theo mùa mưa và đề xuất mật độ phun thuốc diệt muỗi.
  - *Toán 11 cốt lõi:* Cấp số nhân bùng nổ, Hàm số mũ tự nhiên $e^(r t)$, Hàm số Logistic có sức chứa môi trường, Giới hạn dãy số.
  - *Thực nghiệm & Mã nguồn:* Dữ liệu CDC Hà Nội 2018–2023, mô hình toán học Compartmental SIR/SEIR trên Python.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 12: Tối Ưu Hóa Liều Lượng & Chu Kỳ Uống Thuốc Kháng Sinh Tránh Kháng Thuốc Dựa Trên Chu Kỳ Bán Rã Đạo Hàm*\
  - *Tóm tắt:* Lập lịch uống thuốc điều trị nhiễm khuẩn huyết nhằm duy trì nồng độ thuốc trong huyết tương luôn nằm trong khoảng an toàn.
  - *Toán 11 cốt lõi:* Hàm phân rã phóng xạ/dược động học $C(t) = C_0 e^(-k t)$, Tổng cấp số nhân lùi vô hạn, Cực trị đạo hàm.
  - *Thực nghiệm & Mã nguồn:* Mô phỏng dược động học 1 ngăn (One-compartment PK model), so sánh phác đồ uống 8h/lần vs 12h/lần.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 13: Ứng Dụng Định Lý Bayes Nâng Cao Độ Nhạy Của Hệ Thống AI Chẩn Đoán Sớm Bệnh Võng Mạc Tiểu Đường*\
  - *Tóm tắt:* Giảm tỷ lệ dương tính giả trong tầm soát tổn thương đáy mắt bằng ảnh chụp soi đồng tử tại trạm y tế cơ sở.
  - *Toán 11 cốt lõi:* Định lý xác suất toàn phần, Công thức Bayes nghịch đảo, Độ nhạy (Sensitivity) và Độ đặc hiệu (Specificity).
  - *Thực nghiệm & Mã nguồn:* Mạng ResNet50 huấn luyện trên tập dữ liệu Kaggle EyePACS, tích hợp bộ lọc cập nhật niềm tin Bayes.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 14: Tái Tạo Cấu Trúc Khối U Não 3D Từ Ảnh Cắt Lớp Chụp MRI Bằng Phép Chiếu Song Song & Tích Phân Radon*\
  - *Tóm tắt:* Xây dựng mô hình 3D khối u hỗ trợ bác sĩ phẫu thuật thần kinh lập kế hoạch bóc tách an toàn không phạm mô lành.
  - *Toán 11 cốt lõi:* Phép chiếu song song, Mặt phẳng thiết diện cắt khối đa diện, Khoảng cách từ điểm đến mặt phẳng, Thể tích hình trụ.
  - *Thực nghiệm & Mã nguồn:* Định dạng ảnh y tế DICOM, thư viện 3D Slicer / VTK Python, in mô hình khối u bằng máy in 3D PLA.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 15: Phân Tích Độ Đột Biến & Khoảng Cách Di Truyền Quần Thể Cá Tra Bằng Xác Suất Hardy-Weinberg*\
  - *Tóm tắt:* Đánh giá mức độ suy giảm đa dạng di truyền do lai cận huyết tại các trại giống thủy sản vùng Đồng bằng sông Cửu Long.
  - *Toán 11 cốt lõi:* Quy tắc nhân xác suất độc lập, Nhị thức Newton, Tần số alen quần thể, Kiểm định Chi bình phương.
  - *Thực nghiệm & Mã nguồn:* Dữ liệu giải trình tự gen microsatellite cá tra, phần mềm phân tích di truyền GenAlEx.
]

== PHÂN KHOA 4: KINH TẾ LƯỢNG, TÀI CHÍNH ĐỊNH LƯỢNG & NĂNG LƯỢNG TÁI TẠO

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 16: Mô Hình Dự Báo Phụ Tải Tiêu Thụ Điện Sinh Hoạt Đô Thị Theo Mùa Bằng Chuỗi Lượng Giác Fourier & SARIMA*\
  - *Tóm tắt:* Dự báo chính xác nhu cầu dùng điện của thành phố trong những ngày nắng nóng kỷ lục để ngăn chặn sự cố sập lưới điện.
  - *Toán 11 cốt lõi:* Hàm số tuần hoàn lượng giác, Dãy số thời gian, Phép tính giới hạn sai số, Sai phân bậc một.
  - *Thực nghiệm & Mã nguồn:* Dữ liệu phụ tải EVN miền Bắc 5 năm, mô hình kết hợp hàm tuần hoàn và mạng học sâu LSTM.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 17: Tối Ưu Hóa Danh Mục Đầu Tư Tài Chính Cá Nhân Theo Mô Hình Markowitz Bằng Đạo Hàm & Ma Trận Hiệp Phương Sai*\
  - *Tóm tắt:* Phân bổ vốn thông minh vào 5 cổ phiếu thuộc rổ VN30 nhằm đạt tỷ suất sinh lời tối đa với mức rủi ro kiểm soát.
  - *Toán 11 cốt lõi:* Đạo hàm riêng cực trị, Phương sai và độ lệch chuẩn của biến ngẫu nhiên, Đường biên hiệu quả (Efficient Frontier).
  - *Thực nghiệm & Mã nguồn:* Dữ liệu giá đóng cửa sàn HoSE (2020–2024), lập trình giải bài toán bậc hai trên Python cvxpy.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 18: Lập Lịch Thu Gom Rác Thải Đô Thị Thông Minh Bằng Quy Hoạch Tuyến Tính Nguyên (Integer Linear Programming)*\
  - *Tóm tắt:* Giảm $22\%$ chi phí nhiên liệu và phát thải xe chở rác bằng cách tối ưu hóa cung đường và giờ gom rác theo nhóm dân cư.
  - *Toán 11 cốt lõi:* Hệ bất phương trình bậc nhất, Miền lồi đa diện, Lý thuyết đồ thị chu trình Euler, Thuật toán nhánh và cận (Branch-and-Bound).
  - *Thực nghiệm & Mã nguồn:* Bản đồ giao thông quận Hoàn Kiếm, thư viện Google OR-Tools, đo lường lượng dầu diesel tiết kiệm.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 19: Mô Phỏng Định Giá Bất Động Sản Ven Đô Bằng Hồi Quy Tuyến Tính Phân Vị (Quantile Regression)*\
  - *Tóm tắt:* Loại bỏ yếu tố thổi giá ảo của các nhóm đầu cơ đất, đưa ra khung giá đất trung thực phục vụ chính sách đền bù giải phóng mặt bằng.
  - *Toán 11 cốt lõi:* Mẫu số liệu ghép nhóm, Trung vị, Tứ phân vị, Phân vị thứ $tau$, Sai số tuyệt đối tối thiểu (MAE).
  - *Thực nghiệm & Mã nguồn:* Tập dữ liệu 50.000 giao dịch nhà đất ngoại thành, phần mềm thống kê R / Python Statsmodels.
]

#block(stroke: 0.5pt + rgb("cbd5e1"), fill: rgb("f8fafc"), inset: 9pt, radius: 3pt)[
  *Đề tài 20: Tối Ưu Hóa Góc Nghiêng Tấm Pin Mặt Trời Theo Mùa Bằng Phép Chiếu Vector Không Gian & Lượng Giác Tọa Độ Cực*\
  - *Tóm tắt:* Thiết kế giàn pin năng lượng mặt trời tự động quay theo trục mặt trời (Solar Tracker) tăng sản lượng điện thêm $26\%$.
  - *Toán 11 cốt lõi:* Tích vô hướng vector không gian, Góc giữa đường thẳng và mặt phẳng, Hàm số lượng giác theo ngày trong năm.
  - *Thực nghiệm & Mã nguồn:* Giàn khung pin gắn cảm biến quang trở LDR và vi điều khiển Arduino Nano, đối chứng với giàn pin cố định.
]

#pagebreak()

= PHẦN V: BẢNG TỪ ĐIỂN TRA CỨU 60 THUẬT NGỮ TOÁN HỌC & KHOA HỌC CÔNG NGHỆ SONG NGỮ (GLOSSARY EN - VI)

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Cẩm nang tra cứu học thuật song ngữ Anh - Việt chuẩn quốc tế. Cầu nối ngôn ngữ giúp các bạn học sinh tự tin đọc hiểu các tài liệu nghiên cứu khoa học, sách giáo trình đại học tiên tiến và các bài báo quốc tế trên IEEE, Springer và Nature.
]

#align(center)[
  #table(
    columns: (3.2cm, 3.2cm, 4.8cm, 4.8cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e293b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    
    // Header
    table.header(
      text(fill: white, weight: "bold", size: 8.5pt)[Thuật ngữ tiếng Anh],
      text(fill: white, weight: "bold", size: 8.5pt)[Thuật ngữ tiếng Việt],
      text(fill: white, weight: "bold", size: 8.5pt)[Bản chất toán học cốt lõi],
      text(fill: white, weight: "bold", size: 8.5pt)[Ứng dụng công nghệ & Thực tiễn],
    ),
    
    // Rows
    [Trigonometric Function], [Hàm số lượng giác], [Hàm số tuần hoàn đo tọa độ hình chiếu trên đường tròn đơn vị.], [Xử lý tín hiệu âm thanh số MP3, sóng vô tuyến viễn thông 5G.],
    [Radian], [Radian], [Đơn vị đo góc tự nhiên: Độ dài cung tròn chia cho bán kính.], [Chuẩn mực tính toán trong toàn bộ các ngôn ngữ lập trình C/C++, Python.],
    [Phase Shift], [Độ lệch pha], [Khoảng dịch chuyển ngang của đồ thị hàm tuần hoàn $sin(omega t + phi)$.], [Hệ thống điện xoay chiều 3 pha Tesla, khử tiếng ồn chủ động ANC.],
    [Resonance], [Sự cộng hưởng], [Hiện tượng biên độ dao động bùng nổ khi tần số ngoại lực trùng tần số riêng.], [Thiết kế nhà chống động đất, chấn lưu con lắc tháp Đài Bắc 101.],
    [Arithmetic Progression], [Cấp số cộng], [Dãy số có hiệu số giữa hai số hạng liên tiếp là hằng số công sai $d$.], [Tính khấu hao tuyến tính tài sản, lập kế hoạch trả nợ định kỳ.],
    [Geometric Progression], [Cấp số nhân], [Dãy số có tỷ số giữa hai số hạng liên tiếp là hằng số công bội $q$.], [Lãi kép ngân hàng, sự lan truyền dịch bệnh, tăng trưởng vi sinh vật.],
    [Limit of a Sequence], [Giới hạn dãy số], [Giá trị hội tụ của số hạng $u_n$ khi chỉ số $n$ tiến dần ra vô hạn.], [Thuật toán khử răng cưa GPU đồ họa, giải thuật xấp xỉ liên phân số.],
    [Squeeze Theorem], [Định lý kẹp], [Nếu $a_n <= b_n <= c_n$ và $a_n, c_n arrow L$ thì $b_n arrow L$.], [Chứng minh giới hạn lượng giác kinh điển $lim_(x arrow 0) (sin x)/x = 1$.],
    [Continuous Function], [Hàm số liên tục], [Hàm số có đồ thị là một đường liền nét không bị đứt gãy.], [Mô hình hóa dòng chảy chất lưu, định luật bảo toàn năng lượng.],
    [Intermediate Value Theorem], [Định lý giá trị trung gian], [Hàm liên tục trên $[a, b]$ nhận mọi giá trị trung gian giữa $f(a)$ và $f(b)$.], [Thuật toán tìm kiếm nhị phân (Binary Search) trong lập trình.],
    [Skew Lines], [Hai đường thẳng chéo nhau], [Hai đường thẳng không cùng thuộc bất kỳ một mặt phẳng nào.], [Quy hoạch cầu vượt giao lộ nhiều tầng, đường dẫn ống ngầm đô thị.],
    [Parallel Planes], [Hai mặt phẳng song song], [Hai mặt phẳng không có bất kỳ điểm chung nào trong không gian.], [Công nghệ in 3D cắt lớp (Slicing), quét cắt lớp y tế CT Scanner.],
    [Parallel Projection], [Phép chiếu song song], [Phép chiếu các điểm theo một phương cố định lên mặt phẳng chiếu.], [Bản vẽ kỹ thuật cơ khí chế tạo máy, kiến trúc công trình nhà ở.],
    [Vanishing Point], [Điểm tụ], [Điểm quy tụ của các đường thẳng song song trong phép chiếu phối cảnh.], [Hội họa Phục Hưng, công nghệ thực tế ảo VR, game 3D góc nhìn thứ nhất.],
    [Grouped Data], [Mẫu số liệu ghép nhóm], [Bảng dữ liệu gom các giá trị liên tục thành các khoảng tần số.], [Xử lý dữ liệu lớn (Big Data), điều tra dân số Tổng cục Thống kê.],
    [Median], [Trung vị], [Giá trị chia mẫu số liệu đã sắp thứ tự thành hai nửa bằng nhau.], [Đo lường thu nhập trung thực, phân khúc khách hàng không bị nhiễu.],
    [Quartiles], [Tứ phân vị], [Ba điểm cắt $Q_1, Q_2, Q_3$ chia mẫu số liệu thành 4 phần bằng nhau.], [Xây dựng biểu đồ hộp Boxplot, giám sát chất lượng quy trình Six Sigma.],
    [Interquartile Range (IQR)], [Khoảng tứ phân vị], [Hiệu số $Q_3 - Q_1$ đo độ phân tán của $50\%$ số liệu trung tâm.], [Thuật toán phát hiện gian lận thẻ tín dụng Visa/Mastercard tự động.],
    [Outlier], [Điểm ngoại lai], [Giá trị dị biệt nằm ngoài hàng rào $[Q_1 - 1.5 "IQR", Q_3 + 1.5 "IQR"]$.], [Phát hiện lỗi cảm biến IoT, loại bỏ tin tặc tấn công mạng DDoS.],
    [Exponential Function], [Hàm số mũ], [Hàm số có ẩn số nằm trên số mũ: $y = a^x$ với $a > 0, a != 1$.], [Định luật Moore bán dẫn, sự phân rã phóng xạ nguyên tử, pin lithium.],
    [Logarithmic Function], [Hàm số lôgarit], [Hàm số nghịch đảo của hàm mũ: $y = log_a x$ giải phóng ẩn số mũ.], [Thang đo động đất Richter, thang đo độ chua pH, thang đo âm thanh dB.],
    [Natural Base e], [Cơ số tự nhiên e], [Hằng số kỳ diệu $e = lim (1 + 1/n)^n approx 2.71828$.], [Mô hình tăng trưởng kinh tế, lãi kép liên tục, phân phối chuẩn Gauss.],
    [Half-life], [Chu kỳ bán rã], [Thời gian cần thiết để lượng chất phóng xạ phân rã còn lại một nửa.], [Định tuổi cổ vật Carbon-14 trong khảo cổ học, dược động học thải trừ thuốc.],
    [Derivative], [Đạo hàm], [Tỷ số biến thiên của hàm số khi khoảng biến thiên đối số tiến về 0.], [Vận tốc tức thời, máy bắn tốc độ cảnh sát, thuật toán AI Gradient Descent.],
    [Instantaneous Velocity], [Vận tốc tức thời], [Đạo hàm cấp 1 của hàm quãng đường theo thời gian: $v(t) = s'(t)$.], [Đồng hồ tốc độ xe máy ô tô, hệ thống điều hướng quán tính tàu ngầm.],
    [Acceleration], [Gia tốc], [Đạo hàm cấp 2 của vị trí, đo mức độ thay đổi của vận tốc: $a(t) = s''(t)$.], [Kích hoạt túi khí an toàn ô tô, định luật II Newton $F = m a$.],
    [Jerk], [Gia tốc giật], [Đạo hàm cấp 3 của vị trí, đo mức độ biến thiên của gia tốc: $j(t) = a'(t)$.], [Thiết kế đường ray tàu lượn siêu tốc an toàn, phóng tên lửa SpaceX.],
    [Chain Rule], [Quy tắc đạo hàm hàm hợp], [Đạo hàm của hàm hợp: $(f(g(x)))' = f'(g(x)) dot g'(x)$.], [Thuật toán Lan truyền ngược (Backpropagation) huấn luyện mạng nơ-ron AI.],
    [Tangent Line], [Tiếp tuyến], [Đường thẳng chạm vào đồ thị hàm số tại 1 điểm có hệ số góc bằng $f'(x_0)$.], [Phương pháp Newton-Raphson giải phương trình phi tuyến trong chip máy tính.],
    [Normal Vector], [Vector pháp tuyến], [Vector có giá vuông góc với mặt phẳng hoặc tiếp diện tại điểm xét.], [Thuật toán dò tia sáng (Ray Tracing) tạo bóng đổ game 3D Unreal Engine.],
    [Dihedral Angle], [Góc phẳng nhị diện], [Góc phẳng tạo bởi 2 đường thẳng lần lượt vuông góc với giao tuyến.], [Thiết kế mái dốc thoát nước mưa, góc nghiêng cánh lái máy bay.],
    [Platonic Solids], [5 Khối đa diện Platon], [Các khối đa diện đều duy nhất trong không gian 3D (Tứ diện, Lập phương...).], [Cấu trúc vỏ protein virus Corona/HIV, thiết kế vòm Geodesic.],
    [Independent Events], [Biến cố độc lập], [Hai biến cố mà việc xảy ra của biến cố này không ảnh hưởng đến biến cố kia.], [Hệ thống an toàn động cơ kép máy bay, bảo hiểm hàng không.],
    [Conditional Probability], [Xác suất có điều kiện], [Xác suất của biến cố $A$ khi biết biến cố $B$ đã xảy ra: $P(A | B)$.], [AI chẩn đoán bệnh y khoa, thuật toán lọc email rác Naive Bayes.],
    [Bayes' Theorem], [Định lý Bayes], [Công thức cập nhật niềm tin xác suất khi có bằng chứng thực nghiệm mới.], [Xe tự hành Tesla nhận diện chướng ngại vật, thuật toán tìm kiếm cứu nạn.],
    [Birthday Paradox], [Nghịch lý ngày sinh nhật], [Xác suất có ít nhất 2 người trùng sinh nhật vượt $50\%$ chỉ với 23 người.], [Tấn công sinh nhật (Birthday Attack) bẻ khóa mã băm mật mã học MD5/SHA.],
    [Isometry], [Phép dời hình], [Phép biến hình bảo toàn khoảng cách giữa hai điểm bất kỳ.], [Thiết kế hoa văn gạch men kiến trúc, dệt may thời trang cao cấp.],
    [Tessellation], [Sự lát mặt phẳng], [Phủ kín mặt phẳng bằng các hình lặp lại không để hở khe hay chồng lấn.], [Nghệ thuật M.C. Escher, tổ ong tự nhiên, vật liệu tổ ong siêu nhẹ.],
    [Fractal], [Hình học Fractal], [Cấu trúc hình học có tính tự đồng dạng bất tận ở mọi thang đo.], [Tạo hình đồi núi lửa khói trong phim hoạt hình 3D Pixar, ăng-ten điện thoại.],
    [Graph Theory], [Lý thuyết đồ thị], [Nghiên cứu cấu trúc các đỉnh nối với nhau bằng các cạnh.], [Mạng xã hội Facebook, bản đồ mạng viễn thông Internet cáp quang.],
    [Eulerian Path], [Đường đi Euler], [Đường đi qua tất cả các cạnh của đồ thị, mỗi cạnh đúng một lần duy nhất.], [Thuật toán quét bản đồ xe hút bụi đường phố tự động, in mạch điện tử PCB.],
    [Dijkstra's Algorithm], [Thuật toán Dijkstra], [Thuật toán tìm đường đi ngắn nhất giữa 2 đỉnh trên đồ thị có trọng số.], [Ứng dụng Google Maps dẫn đường, định tuyến gói tin mạng Cisco.],
    [Bézier Curve], [Đường cong Bézier], [Đường cong tham số điều khiển mượt mà bằng các điểm kiểm soát.], [Công cụ Pen Tool trong Illustrator/Figma, thiết kế thân xe hơi ô tô.],
    [NURBS], [Mặt cong NURBS], [Mặt cong B-spline hữu tỉ phi đồng nhất tiêu chuẩn mô hình 3D.], [Phần mềm CAD chế tạo máy bay Boeing, điêu khắc nhân vật hoạt hình 3D.],
    [Public Key Cryptography], [Mật mã khóa công khai], [Hệ mã hóa dùng cặp khóa bất đối xứng (Khóa công khai & Khóa bí mật).], [Bảo mật giao dịch ngân hàng trực tuyến, chứng chỉ bảo mật HTTPS / SSL.],
    [RSA Algorithm], [Thuật toán RSA], [Thuật toán mật mã dựa trên độ khó của phân tích hợp số nguyên tố cực lớn.], [Chữ ký số điện tử, thẻ căn cước công dân gắn chip, bảo vệ mật khẩu.],
    [Discrete Logarithm], [Lôgarit rời rạc], [Tìm số mũ $x$ thỏa mãn $g^x equiv y space (mod p)$ trong trường hữu hạn.], [Giao thức trao đổi khóa Diffie-Hellman bảo mật tin nhắn Telegram/Zalo.],
    [Linear Programming], [Quy hoạch tuyến tính], [Tối ưu hóa hàm mục tiêu tuyến tính dưới các ràng buộc bất phương trình.], [Điều độ lưới điện quốc gia, phân bổ đội tàu bay Vietnam Airlines.],
    [Simplex Method], [Phương pháp Đơn giác], [Thuật toán duyệt qua các đỉnh của khối đa diện lồi để tìm cực trị.], [Phần mềm tối ưu chuỗi cung ứng logistics Amazon, lập kế hoạch sản xuất.],
    [Random Walk], [Bước đi ngẫu nhiên], [Quá trình chuyển động gồm một chuỗi các bước đi theo hướng ngẫu nhiên.], [Mô hình hóa phân tử khuếch tán, chuyển động giá cổ phiếu chứng khoán.],
    [Brownian Motion], [Chuyển động Brown], [Chuyển động hỗn loạn liên tục của các hạt vi mô chịu va chạm nhiệt.], [Định giá quyền chọn Black-Scholes, mô hình hóa thị trường tài chính.],
    [Monte Carlo Simulation], [Mô phỏng Monte Carlo], [Phương pháp giải bài toán bằng cách thử nghiệm lặp lại ngẫu nhiên hàng vạn lần.], [Dự báo rủi ro bão lũ thiên tai, tính xác suất an toàn lò phản ứng hạt nhân.],
    [Cross-Entropy Loss], [Hàm mất mát Cross-Entropy], [Độ đo sai số giữa 2 phân phối xác suất sử dụng hàm Lôgarit.], [Huấn luyện mô hình trí tuệ nhân tạo thị giác máy tính và ChatGPT.],
    [Sigmoid Function], [Hàm kích hoạt Sigmoid], [Hàm số mũ $sigma(x) = 1 / (1 + e^(-x))$ nén giá trị về khoảng xác suất $(0, 1)$.], [Tế bào thần kinh nhân tạo (Nơ-ron) trong mạng học sâu Deep Learning.],
    [Softmax Function], [Hàm Softmax], [Hàm số mũ chuẩn hóa một vector số thực thành phân phối xác suất.], [Lớp đầu ra của mô hình AI nhận dạng giọng nói và dịch thuật tự động.],
    [Gradient Descent], [Hạ độ dốc Gradient], [Thuật toán tối ưu hóa di chuyển ngược chiều vector đạo hàm từng bước.], [Trái tim thuật toán huấn luyện mọi mạng nơ-ron Trí tuệ Nhân tạo hiện đại.],
    [Survivoship Bias], [Thiên kiến sống sót], [Sai lầm logic khi chỉ thống kê trên các đối tượng vượt qua vòng tuyển chọn.], [Phân tích dữ liệu máy bay Abraham Wald Thế chiến II, đầu tư khởi nghiệp.],
    [Simpson's Paradox], [Nghịch lý Simpson], [Một xu hướng xuất hiện trong các nhóm nhỏ nhưng lại đảo ngược khi gộp chung.], [Phân tích số liệu y tế thử nghiệm vắc-xin, tuyển sinh đại học UC Berkeley.],
    [Radon Transform], [Biến đổi Radon], [Phép biến đổi tích phân hàm số theo các đường thẳng quét qua vật thể.], [Nguyên lý toán học của máy chụp cắt lớp vi tính CT Scanner bệnh viện.],
    [Zettelkasten Method], [Phương pháp Zettelkasten], [Hệ thống ghi chép thẻ độc lập liên kết dạng mạng lưới tri thức.], [Công cụ quản lý tri thức cá nhân (Obsidian, Notion) cho nhà nghiên cứu.],
  )
]

#pagebreak()

= LỜI KẾT: BỨC THƯ GỬI NGƯỜI GIEO MẦM TƯ DUY LỚP 11

*Kính gửi Quý Thầy Cô giáo và những người dẫn đường tri thức,*

Toán học lớp 11 là một khúc quanh định mệnh trong đời học sinh. Nó là nơi các em phải từ giã sự bình yên của thế giới phẳng để bước vào không gian 3 chiều bao la; là nơi các em phải rời xa những con số hữu hạn tĩnh lặng để đối diện với vực thẳm vô hạn của Giới hạn và Đạo hàm; là nơi các em học cách dùng Lôgarit để đo lường vũ trụ và dùng Xác suất Bayes để đưa ra quyết định giữa một thế giới đầy rẫy sự bất định!

Nếu chúng ta chỉ bước lên bục giảng và ném cho các em những công thức biến đổi lượng giác dài dằng dặc, những bài toán tìm giao tuyến khô khốc hay những bảng biến thiên vô hồn, các em sẽ mãi mãi nhìn môn Toán như một cực hình tra tấn tinh thần!

Nhưng nếu Thầy Cô dừng lại 3 phút, kể cho các em nghe về 20 năm ròng rã tự tay tính bảng số của John Napier trong tòa lâu đài hoang lạnh để cứu rỗi đôi mắt của các nhà thiên văn; kể cho các em nghe về bức thư tuyệt mệnh của mục sư Thomas Bayes đã cứu sống hàng triệu người trong Thế chiến II; hay chỉ tay ra ngoài cửa sổ để các em thấy sợi dây dọi của bác thợ hồ đang mang linh hồn của Định lý ba đường vuông góc... thì khoảnh khắc đó, một đốm lửa đam mê sẽ bùng cháy trong đôi mắt của học trò!

Toán học không sinh ra trong tháp ngà của những bài thi trắc nghiệm. Toán học sinh ra từ mồ hôi, nước mắt, sự tò mò và khát vọng chinh phục tự nhiên của những bộ óc vĩ đại nhất trong lịch sử loài người!

Chúc Quý Thầy Cô luôn giữ vững ngọn lửa nhiệt huyết, để mỗi giờ lên lớp không phải là một buổi nhồi nhét kiến thức nặng nề, mà là một cuộc phiêu lưu trí tuệ kỳ thú, khai mở chân trời và nâng cánh ước mơ cho các thế hệ tương lai!

#align(right)[
  #text(style: "italic", size: 10pt)[
    Hà Nội, một mùa thu khai mở tri thức.\
    *Ban Biên Soạn Đại Toàn Thư Sư Phạm Toán Học THPT*
  ]
]
'''
