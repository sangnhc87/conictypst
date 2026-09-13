# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG II: DÒNG THỜI GIAN RỜI RẠC — DÃY SỐ, CẤP SỐ CỘNG & CẤP SỐ NHÂN

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 5, Bài 6, Bài 7 SGK Toán 11 cùng Chuyên đề Tăng trưởng Lũy thừa & Lãi kép Tài chính (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 5: DÃY SỐ — BẢN TRƯỜNG CA RỜI RẠC CỦA VŨ TRỤ

Trong thế giới giải tích liên tục, thời gian trôi đi như một dòng sông mượt mà không có vết nứt. Nhưng trong thế giới của sinh học, kinh tế và máy tính số, *thực tế lại diễn ra theo từng bước nhảy rời rạc:*
- Từng thế hệ sinh vật nối tiếp nhau sinh sôi nảy nở: Thế hệ 1, Thế hệ 2, Thế hệ 3...
- Số dư tài khoản ngân hàng được tính lãi theo từng tháng: Tháng 1, Tháng 2, Tháng 3...
- Dân số một quốc gia được thống kê theo từng năm một.

Một *Dãy số* $(u_n)$ chính là một hàm số đặc biệt có tập xác định là tập hợp các số nguyên dương $NN^*$: $u_1, u_2, u_3, ..., u_n, ...$. Nó là chiếc đồng hồ đếm nhịp từng bước đi của tiến trình lịch sử, nơi mỗi con số là kết tinh của quá khứ và là hạt giống cho tương lai!

#story-box(
  title: "Leonardo Fibonacci & Đôi thỏ đẻ nhánh trong cuốn Liber Abaci năm 1202",
  author: "Leonardo Fibonacci (Ý, khoảng 1170 – 1250)",
)[
  Leonardo xứ Pisa (thường gọi là *Fibonacci*) là người có công lao vĩ đại nhất trong việc đưa hệ thống số thập phân Ấn Độ - Ả Rập ($0, 1, 2, ..., 9$) thay thế cho hệ thống số La Mã cồng kềnh tại châu Âu.
  
  Năm 1202, trong cuốn sách lịch sử *"Liber Abaci"* (Sách về Bàn tính), Fibonacci đã đặt ra một bài toán kinh điển về sự sinh sản của loài thỏ:
  *“Người ta nuôi một đôi thỏ (một đực, một cái) trong một mảnh đất có rào bọc kín. Giả sử mỗi tháng, mỗi đôi thỏ từ hai tháng tuổi trở lên sẽ sinh ra đúng một đôi thỏ mới (một đực, một cái), và không có con thỏ nào bị chết. Hỏi sau một năm, trong mảnh đất sẽ có tất cả bao nhiêu đôi thỏ?”*
  
  Fibonacci ngồi tính toán từng tháng:
  - Tháng 1: $1$ đôi ban đầu (chưa sinh).
  - Tháng 2: $1$ đôi (bắt đầu trưởng thành).
  - Tháng 3: Đôi thỏ mẹ sinh ra 1 đôi con mới $arrow$ Có $2$ đôi.
  - Tháng 4: Đôi thỏ mẹ tiếp tục sinh, đôi con chưa sinh $arrow$ Có $3$ đôi.
  - Tháng 5: Cả đôi mẹ và đôi con đầu lòng cùng sinh $arrow$ Có $5$ đôi.
  - Tháng 6: Có $8$ đôi...
  
  Từ bài toán đố giản dị ấy, *Dãy số Fibonacci* huyền thoại đã cất tiếng khóc chào đời:
  $ 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, ... $
  với công thức truy hồi đệ quy bất hủ:
  $ u_1 = 1, quad u_2 = 1, quad u_n = u_(n-1) + u_(n-2) quad (n >= 3) $
  
  Hơn 800 năm qua, dãy số Fibonacci không ngừng làm kinh ngạc các nhà khoa học: Nó ẩn giấu trong số cánh hoa của các loài hoa (hoa loa kèn có 3 cánh, hoa mao lương có 5 cánh, hoa phi yến có 8 cánh, hoa cúc vạn thọ có 13 cánh!), ẩn giấu trong các vòng xoắn ốc của quả thông, mắt quả dứa, vỏ ốc anh vũ, và thậm chí cả nhịp sóng điều chỉnh của thị trường chứng khoán phố Wall!
]

#hook-box(title: "Bài toán Tháp Hà Nội: Khi các nhà sư chuyển xong chiếc đĩa cuối cùng")[
  Thầy mang lên bục giảng một mô hình trò chơi Tháp Hà Nội gồm 3 chiếc cọc và 8 chiếc đĩa bằng gỗ có kích thước từ nhỏ đến lớn:
  
  *“Truyền thuyết Ấn Độ kể rằng tại ngôi đền Kashi Vishwanath ở thành phố Benares, có một chiếc tháp bằng đồng gắn 3 cây kim bằng kim cương. Khi vũ trụ khai sinh, Thần Brahma đã đặt 64 chiếc đĩa bằng vàng ròng lồng vào cây kim thứ nhất. Các nhà sư trong đền phải ngày đêm di chuyển 64 chiếc đĩa này sang cây kim thứ ba theo hai quy luật bất biến:*
  1. Mỗi lần chỉ được chuyển đúng một chiếc đĩa.
  2. Không bao giờ được đặt một chiếc đĩa lớn hơn lên trên chiếc đĩa nhỏ hơn.
  
  *Lời nguyền của Thần Brahma: Khi chiếc đĩa thứ 64 cuối cùng được chuyển sang cây kim thứ ba, toàn bộ ngôi đền sẽ sụp đổ và ngày tận thế của nhân loại sẽ điểm!*
  
  *Thầy hỏi các em: Các nhà sư phải mất tối thiểu bao nhiêu bước di chuyển để hoàn thành nhiệm vụ?”*
  
  Thầy thiết lập công thức truy hồi dãy số:
  Gọi $u_n$ là số bước di chuyển tháp $n$ đĩa.
  Muốn chuyển đĩa lớn nhất ở đáy, ta phải chuyển $n-1$ đĩa phía trên sang cọc trung gian ($u_(n-1)$ bước), chuyển đĩa đáy sang cọc đích ($1$ bước), rồi chuyển $n-1$ đĩa từ cọc trung gian về cọc đích ($u_(n-1)$ bước):
  $ u_n = 2 u_(n-1) + 1 quad ("với" space u_1 = 1) $
  Công thức số hạng tổng quát của dãy số này là:
  $ u_n = 2^n - 1 $
  
  Với $n = 64$ chiếc đĩa, tổng số bước di chuyển là:
  $ u_(64) = 2^(64) - 1 = 18.446.744.073.709.551.615 "bước"! $
  
  *Nếu mỗi giây các nhà sư chuyển được đúng 1 chiếc đĩa không ngừng nghỉ một giây nào, họ sẽ mất bao lâu?*
  $ T approx (18,45 times 10^(18)) / (60 times 60 times 24 times 365) approx 584 "TỶ NĂM"! $
  
  *Lời bình của Thầy:* Trong khi toàn bộ vũ trụ của chúng ta mới tồn tại được khoảng 13,8 tỷ năm! Ngày tận thế của Thần Brahma còn xa xôi vô tận! Đó chính là sức mạnh kỳ vĩ của Dãy số lũy thừa đệ quy lớp 11!"
]

#tech-box(title: "Thuật toán Đệ quy & Quy hoạch động trong Lập trình LeetCode")[
  - *Phương pháp Quy hoạch động (Dynamic Programming - DP)*: Khi các kỹ sư phần mềm đi phỏng vấn vào các tập đoàn công nghệ lớn như Google, Meta hay Microsoft, bài toán kinh điển nhất luôn là bài toán dãy số đệ quy Fibonacci. Nếu viết code đệ quy ngây thơ, máy tính sẽ tính lặp lại hàng triệu lần dẫn đến sụp đổ bộ nhớ. Các kỹ sư dùng kỹ thuật quy hoạch động (lưu trữ mảng $u_n$) để giảm độ phức tạp thời gian từ hàm mũ $O(2^n)$ xuống thời gian tuyến tính $O(n)$, giúp phần mềm phản hồi tức thì trong một phần triệu giây!
]

---

== BÀI 6: CẤP SỐ CỘNG — CẬU BÉ CARL FRIEDRICH GAUSS 7 TUỔI

Trong tất cả các dãy số, *Cấp số cộng* là dãy số giản dị, gần gũi và chuẩn mực nhất: Mỗi số hạng sau bằng số hạng trước cộng thêm một hằng số không đổi $d$ (công sai):
$ u_n = u_1 + (n - 1) d $

Nó mô tả quy luật tăng trưởng đều đặn của thế giới vật chất: mỗi năm cây cối cao thêm vài centimet, mỗi ngày bạn bỏ ống heo thêm 10.000 đồng, hay chiếc xe tăng tốc đều trên đường thẳng. Nhưng đằng sau sự giản dị ấy là một trong những giai thoại đẹp đẽ nhất về sự tỏa sáng của thiên tài thời thơ ấu.

#story-box(
  title: "Carl Friedrich Gauss 7 tuổi & Vụ cá cược chấn động lớp học tiểu học",
  author: "Carl Friedrich Gauss (Đức, 1777 – 1855)",
)[
  Năm 1784, tại một trường tiểu học nghèo ở thị trấn Braunschweig nước Đức, thầy giáo nghiêm khắc tên là J.G. Büttner bước vào lớp. Muốn học sinh ngồi im trật tự để mình có thời gian nghỉ ngơi uống trà, thầy Büttner đã ra một bài toán tính toán cơ bắp:
  *“Tất cả các trò hãy ngồi tính tổng của 100 số tự nhiên đầu tiên từ 1 đến 100:*
  $ S = 1 + 2 + 3 + 4 + ... + 98 + 99 + 100 $
  *Ai tính xong trước thì mang bảng con lên nộp trên bàn của thầy!”*
  
  Thầy Büttner đinh ninh lũ học trò nhỏ sẽ phải hì hục cộng từng con số vào bảng mất ít nhất một vài tiếng đồng hồ. Nhưng thầy vừa dứt lời chưa đầy vài giây, một cậu bé 7 tuổi có vóc dáng nhỏ thó tên là *Carl Friedrich Gauss* đã đứng dậy, đặt chiếc bảng con của mình lên bàn thầy và tự tin nói bằng tiếng Đức:
  *“Ligget se!” (Thưa thầy, kết quả nằm ở đây ạ!)*
  
  Thầy Büttner nhìn cậu bé với ánh mắt bực bội và khinh thường, nghĩ bụng đứa trẻ ngỗ nghịch này chỉ ghi bừa một con số vô nghĩa. Nhưng đến cuối buổi học, khi lật chiếc bảng của Gauss lên, thầy Büttner đã chết lặng người vì kinh ngạc: Trên bảng chỉ có duy nhất một con số chính xác tuyệt đối:
  $ 5050! $
  
  Cậu bé Gauss 7 tuổi đã không hề làm phép cộng cơ bắp. Cậu quan sát và nhìn thấy tính chất đối xứng hoàn hảo của *Cấp số cộng*:
  - Cặp số đầu và cuối: $1 + 100 = 101$.
  - Cặp số thứ hai: $2 + 99 = 101$.
  - Cặp số thứ ba: $3 + 98 = 101$...
  Có tất cả $50$ cặp số như vậy, mỗi cặp đều có tổng bằng $101$!
  Do đó, cậu chỉ việc làm một phép nhân nhẩm trong đầu:
  $ S = 50 times 101 = 5.050! $
  
  Thầy Büttner xúc động rơi nước mắt. Thầy tự bỏ tiền túi mua tặng Gauss cuốn sách toán hay nhất thời đó và nói trước cả lớp: *“Ta không còn gì để dạy cho cậu bé này nữa rồi!”*. Cậu bé 7 tuổi ấy sau này đã trở thành *"Hoàng tử của các nhà toán học"* — một trong ba tượng đài toán học vĩ đại nhất mọi thời đại của nhân loại cùng với Archimedes và Isaac Newton!
]

#hook-box(title: "Bài toán Xếp cọc gỗ & Kim tự tháp đồ chơi")[
  Thầy vẽ lên bảng một đống cọc gỗ xếp thành hình tam giác:
  
  *“Một lâm trường khai thác gỗ xếp các khúc gỗ tròn thành một đống hình tam giác cân: Hàng trên cùng có 1 khúc gỗ, hàng thứ hai có 2 khúc, hàng thứ ba có 3 khúc... Cứ như thế, hàng đáy dưới cùng có đúng 100 khúc gỗ.*
  *Hỏi: Đống gỗ này có tất cả bao nhiêu khúc gỗ?*
  
  *Nếu các em ngồi cộng từng hàng một, các em sẽ là những người thợ thủ công chậm chạp. Nhưng bằng công thức Cấp số cộng của cậu bé Gauss 7 tuổi:*
  $ S_n = (n(u_1 + u_n)) / 2 = (100 times (1 + 100)) / 2 = 5.050 "khúc gỗ"! $
  
  *Bằng tư duy phát hiện quy luật, các em giải quyết xong một bài toán quản lý kho bãi trị giá hàng tỷ đồng chỉ trong 3 giây nhẩm tính!”*
]

#tech-box(title: "Thuật toán Cấp phát Bộ nhớ & Băng thông Mạng máy tính")[
  - *Cấp phát bộ nhớ đệm (Memory Allocation)*: Trong hệ điều hành Linux và Android, khi các ứng dụng yêu cầu cấp phát bộ nhớ RAM cho các luồng xử lý (Threads), hệ thống sử dụng thuật toán phân đoạn theo cấp số cộng để chia sẻ bộ nhớ đồng đều, tránh phân mảnh RAM.
]

---

== BÀI 7: CẤP SỐ NHÂN — SỨC MẠNH HỦY DIỆT CỦA BÙNG NỔ LŨY THỪA & LÃI KÉP EINSTEIN

Nếu Cấp số cộng tăng trưởng theo bước chân người đi bộ, thì *Cấp số nhân* ($u_n = u_1 times q^(n-1)$) là một con quái vật bùng nổ với tốc độ ánh sáng! 

Khi công bội $q > 1$, sau một vài bước đầu tiên tưởng chừng như êm ả và chậm chạp, cấp số nhân sẽ bốc đầu tăng vọt lên những con số khổng lồ xé toạc mọi trực giác của con người. Đó là bí mật đằng sau sự lây lan của các đại dịch virus chết người, vụ nổ bom nguyên tử dây chuyền, và là cỗ máy sinh tiền vĩ đại nhất của nền tài chính thế giới: *Lãi kép!*

#story-box(
  title: "Hiền triết Sissa ben Dahir & Phần thưởng hạt thóc trên bàn cờ vua",
  author: "Vua Shirham & Hiền triết Sissa (Ấn Độ cổ đại)",
)[
  Truyền thuyết Ấn Độ kể rằng: Để giúp Vua Shirham giải sầu và rèn luyện mưu lược quân sự, vị hiền triết thông thái *Sissa ben Dahir* đã sáng tạo ra trò chơi Cờ vua. Nhà vua say mê trò chơi này đến mức tuyên bố:
  *“Ta sẽ ban cho khanh bất kỳ phần thưởng nào trên thế gian này! Khanh muốn vàng bạc châu báu, cung điện nguy nga hay đất đai trù phú?”*
  
  Vị hiền triết mỉm cười khiêm nhường thưa:
  *“Hạ thần chỉ là một kẻ bần hàn, không ham muốn vàng bạc. Hạ thần chỉ xin bệ hạ ban cho một số hạt thóc tính theo 64 ô của bàn cờ vua như sau: Ô thứ nhất xin bệ hạ đặt vào 1 hạt thóc, ô thứ hai đặt vào 2 hạt, ô thứ ba đặt vào 4 hạt, ô thứ tư đặt vào 8 hạt... Cứ như thế, mỗi ô sau xin gấp đôi số hạt thóc của ô liền trước cho đến ô thứ 64!”*
  
  Nhà vua cười lớn đầy hào sảng, nghĩ bụng: *"Kẻ này thật ngốc nghếch! Cả một bàn cờ nhỏ xíu thì cùng lắm chỉ mất vài bao thóc!"*. Nhà vua lập tức lệnh cho quan quản kho mang thóc ra ban thưởng.
  
  Nhưng chỉ sau vài tiếng đồng hồ, viên quan quản kho gương mặt cắt không còn giọt máu, hớt hải chạy vào quỳ rạp dưới chân nhà vua:
  *“Bệ hạ vạn tội! Toàn bộ kho thóc của hoàng gia đã cạn kiệt mà mới chỉ đếm đến ô thứ 30! Cho dù có vét sạch toàn bộ thóc lúa của cả vương quốc, thậm chí của toàn bộ Trái Đất này gieo trồng trong suốt 2.000 năm liên tục, cũng KHÔNG THỂ NÀO ĐỦ THÓC ĐỂ TRẢ CHO Ô THỨ 64!”*
  
  Tổng số hạt thóc trên bàn cờ vua là tổng của một cấp số nhân gồm 64 số hạng với $u_1 = 1$ và công bội $q = 2$:
  $ S_(64) = 1 + 2 + 4 + 8 + ... + 2^(63) = (1 times (2^(64) - 1)) / (2 - 1) = 2^(64) - 1 $
  $ S_(64) approx 18.446.744.073.709.551.615 "hạt thóc"! $
  
  Nếu đem rải đều số hạt thóc khổng lồ này ra, nó sẽ phủ kín toàn bộ bề mặt lục địa Trái Đất một lớp thóc dày tới *1 MÉT!* Nhà vua bàng hoàng nhận ra mình vừa đối mặt với một sức mạnh vô hình khủng khiếp hơn mọi đội quân xâm lược: Sức mạnh bùng nổ lũy thừa của Cấp số nhân!
]

#hook-box(title: "Gấp đôi tờ giấy A4 đúng 42 lần: Chạm tới Mặt Trăng?")[
  Thầy cầm một tờ giấy A4 mỏng tang giơ lên trước lớp:
  
  *“Độ dày của tờ giấy này là khoảng $0,1$ mm ($0,0001$ mét). Bây giờ thầy gấp đôi tờ giấy lại một lần: độ dày là $0,2$ mm. Gấp đôi lần 2: $0,4$ mm. Gấp đôi lần 3: $0,8$ mm.*
  
  *Thầy đố các em: Nếu thầy có một tờ giấy đủ lớn và có thể gấp đôi nó liên tục đúng 42 LẦN, độ dày của tập giấy sau 42 lần gấp sẽ cao đến đâu? Cao bằng tòa nhà Bitexco? Cao bằng đỉnh Fansipan? Hay cao bằng đỉnh Everest?”*
  
  Học sinh thi nhau đoán: chắc cao bằng đỉnh núi Everest là cùng thầy ạ!
  Thầy viết công thức Cấp số nhân lên bảng:
  $ h = 0,0001 times 2^(42) "mét" $
  Bấm máy tính: $2^(42) approx 4,398 times 10^(12)$!
  $ h approx 0,0001 times 4,398 times 10^(12) = 439.804.651 "mét" approx 440.000 "KILOMET"! $
  
  Cả lớp sẽ lặng người đi vì sốc!
  *Khoảng cách trung bình từ Trái Đất đến Mặt Trăng chỉ là $384.400$ km! Tập giấy sau 42 lần gấp đôi không chỉ vượt qua đỉnh Everest ($8,8$ km), mà nó đã phóng thẳng lên vũ trụ và ĐẬP VÀO MẶT TRĂNG!*
  
  *Bài học nhân sinh đúc kết:* Đừng bao giờ đánh giá thấp những nỗ lực nhỏ bé được lặp đi lặp lại mỗi ngày! Mỗi ngày các em tiến bộ thêm một chút theo cấp số nhân, sau một thời gian, các em sẽ tạo ra một kỳ tích làm thay đổi cả số phận!”
]

#tech-box(title: "Lãi kép Einstein: Cỗ máy tích lũy tài sản vĩ đại nhất lịch sử")[
  - *Albert Einstein và Lãi kép*: Nhà bác học Albert Einstein từng thốt lên câu nói bất hủ: *"Lãi kép là kỳ quan thứ 8 của thế giới. Những ai hiểu được nó sẽ kiếm được tiền; những ai không hiểu nó sẽ phải trả giá!"*. 
  - Khi các em đầu tư một số tiền $P$ với lãi suất $r$ mỗi năm, sau $n$ năm số tiền các em nhận được chính là một cấp số nhân:
    $ A = P times (1 + r)^n $
    Nếu một người 20 tuổi bắt đầu tiết kiệm 2 triệu đồng mỗi tháng với tỉ suất sinh lời $12\%$/năm, nhờ vào cấp số nhân lãi kép, đến năm 60 tuổi người đó sẽ sở hữu một khối tài sản khổng lồ lên tới hơn *23 TỶ ĐỒNG*! Cấp số nhân lớp 11 chính là bài học tự do tài chính quan trọng nhất của cuộc đời mỗi con người!
  - *Đại dịch lây lan cấp số nhân (Hệ số $R_0$)*: Trong đại dịch COVID-19, nếu một người nhiễm bệnh lây cho 2 người ($R_0 = 2$) trong 3 ngày, thì sau 10 chu kỳ (1 tháng), từ 1 ca bệnh ban đầu sẽ bùng phát thành $2^(10) = 1.024$ ca, và sau 2 tháng sẽ là $2^(20) approx 1,04$ triệu ca bệnh! Đó là lý do tại sao các quốc gia phải áp dụng lệnh giãn cách xã hội ngay từ những ca bệnh đầu tiên để chặt đứt chuỗi cấp số nhân!
]

#misconception-box(title: "Hiểu lầm Tăng đều vs Tăng Lũy thừa & Ngụy biện Dãy số Bị chặn")[
  1. *Chiếc bẫy trực giác tuyến tính:*
  Bộ não con người tiến hóa trong môi trường tự nhiên hàng triệu năm để quen với các chuyển động tuyến tính (đi bộ, săn bắt). Chúng ta rất nhạy bén với *Cấp số cộng* ($1, 2, 3, 4...$), nhưng hoàn toàn mù tịt trước *Cấp số nhân* ($1, 2, 4, 8, 16...$). Đó là lý do tại sao ở giai đoạn đầu của đại dịch hoặc lạm phát tài chính, mọi người đều thờ ơ nghĩ rằng: "Mới có vài ca bệnh / giá mới tăng một chút, chẳng có gì phải hoảng loạn!", cho đến khi con số bùng nổ vượt khỏi tầm kiểm soát thì đã quá muộn!
  
  2. *Sai lầm ngộ nhận về dãy số tăng:*
  Nhiều học sinh tin rằng: "Nếu một dãy số liên tục tăng ($u_(n+1) > u_n, forall n$), thì chắc chắn khi $n arrow infinity$, dãy số sẽ tiến ra dương vô cùng ($+infinity$)!".
  - *Phản chứng sư phạm kinh điển:* Hãy cho học sinh xem dãy số:
  $ u_n = 1 - 1/n quad (1/2, 2/3, 3/4, 4/5, ..., 99/100, ...) $
  Dãy số này rõ ràng tăng nghiêm ngặt ở mọi bước, nhưng dù $n$ có lớn đến hàng tỷ tỷ, giá trị của nó VĨNH VIỄN BỊ CHẶN LẠI VÀ KHÔNG BAO GIỜ VƯỢT QUA CON SỐ 1! Đây chính là chiếc cầu nối tư duy dẫn thẳng học sinh vào bài học tiếp theo: *Khái niệm Giới hạn và Dãy số Bị Chặn*!
]

#dialogue-box(title: "Bài toán Hạt thóc Bàn cờ vua: Phá tan ảo giác tuyến tính")[
  *Thầy:* “Các em hãy tưởng tượng: Hôm nay thầy cho các em chọn 1 trong 2 phần thưởng để tiêu vặt trong 30 ngày tới:\
  - Lựa chọn 1: Mỗi ngày thầy cho cố định 10 TRIỆU ĐỒNG tiền mặt!\
  - Lựa chọn 2: Ngày đầu tiên thầy cho đúng 1 ĐỒNG xu nhỏ. Mỗi ngày sau thầy nhân đôi số tiền của ngày hôm trước (ngày 2 cho 2 đồng, ngày 3 cho 4 đồng, ngày 4 cho 8 đồng...). Ai chọn Lựa chọn 1 giơ tay?”\
  *Cả lớp (gần như 100% học sinh giơ tay hò reo):* “Dạ chọn 10 triệu/ngày thầy ơi! 30 ngày là có 300 triệu tiêu thả ga rồi ạ! Chọn 1 đồng xu thì đến bao giờ mới đủ mua gói kẹo!”\
  *Thầy (mỉm cười):* “Tốt lắm! Bây giờ hãy cùng thầy tính xem người chọn 1 đồng xu sau 30 ngày sẽ nhận được bao nhiêu tiền nhé!\
  - Ngày 10: $2^9 = 512$ đồng (chưa mua nổi ổ bánh mì).\
  - Ngày 20: $2^(19) approx 524.288$ đồng (mới bằng nửa triệu đồng, người chọn 10 triệu đã có 200 triệu!).\
  - Nhưng hãy nhìn vào 10 ngày cuối cùng của Cấp số nhân:\
    - Ngày 25: $2^(24) approx 16,7$ triệu đồng/ngày!\
    - Ngày 28: $2^(27) approx 134$ triệu đồng/ngày!\
    - Ngày 30: $2^(29) approx 536$ TRIỆU ĐỒNG chỉ trong một ngày duy nhất!\
  - Tổng số tiền sau 30 ngày là:\
  $ S_(30) = 2^(30) - 1 = 1.073.741.823 "ĐỒNG" approx 1,07 "TỶ ĐỒNG"! $\
  Gấp gần 4 lần số tiền 300 triệu của Lựa chọn 1!”\
  *Cả lớp (há hốc mồm kinh ngạc):* “Trời ơi, không thể tin được ạ!”\
  *Thầy:* “Đó chính là ma thuật của Cấp số nhân! Kẻ có tầm nhìn ngắn hạn chỉ thấy 1 đồng xu ban đầu; nhưng người hiểu quy luật số học sẽ nhìn thấy cả một gia tài tỷ đồng đang bùng nổ ở phía chân trời!”
]

#deep-dive-box(title: "Dãy Fibonacci, Tỷ lệ Vàng & Trật tự Kiến tạo của Vũ trụ")[
  Dãy số nổi tiếng nhất trong lịch sử nhân loại là *Dãy Fibonacci*:
  $ 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ... $
  được định nghĩa bởi hệ thức truy hồi: $u_n = u_(n-1) + u_(n-2)$.
  
  Điều kỳ diệu nằm ở chỗ: Khi lấy tỷ số giữa hai số hạng liên tiếp $u_(n) / u_(n-1)$ khi $n arrow infinity$, giới hạn này hội tụ về *TỶ LỆ VÀNG (Golden Ratio)*:
  $ phi = (1 + sqrt(5)) / 2 approx 1,6180339887... $
  
  Tỷ lệ vàng này xuất hiện ở khắp mọi ngóc ngách của vũ trụ:
  - Số cánh hoa của hầu hết các loài hoa (hoa loa kèn có 3 cánh, hoa mao lương có 5 cánh, hoa phi yến có 8 cánh, cúc vạn thọ có 13 cánh...).
  - Các đường xoắn ốc của hạt hoa hướng dương, mắt quả dứa, vỏ ốc anh vũ Nautilus.
  - Tỷ lệ chuẩn mực trong bức họa nàng Mona Lisa của Leonardo da Vinci, Đền Parthenon ở Hy Lạp, và logo của tập đoàn công nghệ Apple!
  
  Dãy số lớp 11 không chỉ là một công cụ tính toán, nó là chiếc chìa khóa giải mã bản thiết kế mỹ thuật thiêng liêng mà Mẹ Tự Nhiên đã cài đặt vào lòng vạn vật!
]

#inquiry-box(title: "Bí Mật Đếm Mắt Quả Dứa & Lập Trình Fibonacci Tối Ưu Bằng Ma Trận")[
  Dành cho các em học sinh đam mê khám phá tự nhiên và lập trình thuật toán:
  
  1. *Thí nghiệm thực địa: Đếm đường xoắn ốc của Quả Dứa ngoài chợ:*
  - Cuối tuần, các em hãy cùng mẹ ra chợ và quan sát kỹ một quả dứa (trái thơm). Các mắt dứa xếp thành các đường rãnh xoắn ốc nghiêng chéo quanh thân quả.
  - Hãy dùng một chiếc bút dạ đánh dấu và đếm:
    + Số đường xoắn ốc dốc thoai thoải chạy từ dưới lên theo chiều kim đồng hồ.
    + Số đường xoắn ốc dốc đứng chạy theo chiều ngược kim đồng hồ.
  - *Kết quả chấn động:* Các em sẽ luôn đếm được một cặp số Fibonacci liên tiếp: Hoặc là $(5; 8)$, hoặc là $(8; 13)$, hoặc $(13; 21)$! Tự nhiên không bao giờ chọn cặp số $(7; 11)$ hay $(9; 14)$! Đó là cách tối ưu hóa không gian tế bào kỳ diệu mà thực vật tiến hóa qua hàng trăm triệu năm!
  
  2. *Thử thách Lập trình LeetCode: Từ $O(2^n)$ đến $O(log n)$:*
  - Hãy mở trình biên dịch Python và viết 3 hàm tính số Fibonacci thứ $n$:
    + *Cách 1 (Đệ quy ngây thơ):* `def fib(n): return fib(n-1) + fib(n-2)`. Thử chạy với $n = 40$, các em sẽ thấy máy tính quạt quay ù ù và mất gần 1 phút mới ra kết quả vì độ phức tạp hàm mũ $O(2^n)$!
    + *Cách 2 (Quy hoạch động DP):* Dùng một vòng lặp `for` lưu hai biến trước đó. Thời gian chạy tức thì với độ phức tạp tuyến tính $O(n)$!
    + *Cách 3 (Đỉnh cao Đại số Ma trận):* Sử dụng công thức ma trận lớp 11:
    $ mat(F_(n+1), F_n; F_n, F_(n-1)) = mat(1, 1; 1, 0)^n $
    Bằng giải thuật Lũy thừa nhị phân (Binary Exponentiation), máy tính tính được số Fibonacci thứ 1 triệu trong chưa đầy một phần trăm giây với độ phức tạp siêu tốc $O(log n)$!
  
  3. *Sách kinh điển gợi ý tìm đọc:*
  - *"The Golden Ratio: The Story of Phi, the World's Most Astonishing Number"* — Mario Livio (Nhà vật lý thiên văn NASA).
  - *"Gödel, Escher, Bach: An Eternal Golden Braid"* — Douglas Hofstadter (Tác phẩm đoạt Giải thưởng Pulitzer danh giá của Mỹ).
]

#story-box(
  title: "Leonhard Euler & Bài Toán Basel: Khi Tổng Nghịch Phương Sinh Ra Số Pi Kỳ Ảo",
  author: "Leonhard Euler (Thụy Sĩ, 1707 – 1783), Viện Hàn Lâm Berlin & Saint Petersburg",
)[
  Năm 1644, nhà toán học người Ý Pietro Mengoli đặt ra một bài toán hóc búa mang tên *Bài toán Basel*:
  *“Hãy tính tổng chính xác của chuỗi vô hạn các nghịch phương số tự nhiên:*
  $ S = 1/1^2 + 1/2^2 + 1/3^2 + 1/4^2 + ... + 1/n^2 + ... $
  
  Suốt gần một thế kỷ, gia tộc toán học lừng danh Bernoulli (từ Jacob Bernoulli đến Johann Bernoulli) và toàn bộ các thiên tài châu Âu đều bất lực! Ai cũng biết chuỗi này hội tụ về một con số hữu hạn xấp xỉ $1.64493$, nhưng không một ai có thể tìm ra giá trị chính xác tuyệt đối của nó!
  
  Năm 1734, chàng thanh niên 27 tuổi *Leonhard Euler* đã làm kinh ngạc toàn bộ viện hàn lâm khoa học thế giới khi tìm ra đáp số đẹp đến bàng hoàng:
  $ S = pi^2 / 6 $
  
  Làm thế nào mà số vô tỷ siêu việt $pi$ của hình tròn lại xuất hiện trong tổng của những phân số hữu tỷ đơn thuần của các số nguyên? Euler đã coi hàm số $sin x$ như một đa thức bậc vô hạn có vô số nghiệm tại $x = k pi$, khai triển đa thức thành nhân tử vô hạn và đồng nhất hệ số!
  
  Chiến thắng rực rỡ của Euler trước Bài toán Basel không chỉ đưa tên tuổi ông lên hàng vĩ nhân tối cao của toán học, mà còn khai sinh ra *Hàm Zeta Riemann* — bài toán trung tâm của Giả thuyết Riemann trị giá 1 triệu USD ngày nay!
]

#story-box(
  title: "Cấp Số Nhân & Bẫy Đa Cấp Ponzi: Khi Toán Học Vạch Trần Những Kẻ Lừa Đảo",
  author: "Charles Ponzi (1920) & Bernie Madoff (2008) — Những Bài Học Đắt Giá Về Cấp Số Nhân",
)[
  Năm 1920 tại Boston nước Mỹ, một người đàn ông gốc Ý tên là *Charles Ponzi* đã làm chấn động giới tài chính khi hứa hẹn trả lãi suất lên tới $50\%$ trong vòng 45 ngày cho bất kỳ ai gửi tiền cho ông ta. Hàng chục nghìn người từ công nhân đến cảnh sát đã đổ xô gửi hàng chục triệu USD tiền tiết kiệm cho Ponzi.
  
  Ponzi có kinh doanh gì sinh lời khủng khiếp như vậy không? Hoàn toàn không! Ông ta chỉ lấy tiền của người gửi sau trả lãi cho người gửi trước theo một cấu trúc CẤP SỐ NHÂN!
  
  Hãy cùng làm phép tính toán học lớp 11 để vạch trần bẫy lừa đảo này:
  - Tầng 1: 1 kẻ lừa đảo lôi kéo $5$ người.
  - Tầng 2: 5 người này muốn có lãi phải lôi kéo $5 times 5 = 25$ người tiếp theo.
  - Tầng 3: $125$ người.
  - Tầng 10: Đã cần tới $5^(10) approx 9.765.625$ người (gần 10 triệu người!).
  - Tầng 15: Cần tới $5^(15) approx 30.5$ TỶ NGƯỜI — gấp gần 4 lần TOÀN BỘ DÂN SỐ TRÁI ĐẤT!
  
  Do đó, về mặt toán học tất yếu: *Mọi mô hình tài chính đa cấp Ponzi đều BẮT BUỘC PHẢI SỤP ĐỔ* chỉ sau vài tầng vì tốc độ bùng nổ của Cấp số nhân nhanh chóng vượt qua giới hạn dân số của hành tinh! Năm 2008, vụ lừa đảo Ponzi lớn nhất lịch sử của Bernie Madoff tại phố Wall với quy mô 65 tỷ USD đã phát nổ chính xác theo định luật sụp đổ cấp số nhân này!
]

#story-box(
  title: "Nghịch Lý Bàn Cờ Vua Ấn Độ & Vị Vua Phá Sản: Cấp Số Nhân Đè Bẹp Cả Một Vương Quốc",
  author: "Truyền Thuyết Cổ Đại Ấn Độ Về Sissa ben Dahir & Vua Shirham",
)[
  Hàng nghìn năm trước tại Ấn Độ cổ đại, nhà thông thái Sissa ben Dahir đã sáng tạo ra trò chơi Cờ Vua (Chaturanga) để dâng lên Hoàng đế Shirham nhằm giúp nhà vua rèn luyện mưu lược quân sự và tính kiềm chế nóng nảy.
  
  Hoàng đế Shirham vô cùng say mê trò chơi và tuyên bố: *"Hỡi bậc hiền triết, khanh muốn phần thưởng gì ta cũng ban cho: Vàng bạc, cung điện, hay mỹ nữ?"*.
  
  Sissa ben Dahir cúi đầu khiêm nhường đáp:
  *“Muôn tâu Hoàng thượng, thần chỉ là một người học toán nghèo, thần không màng vàng bạc châu báu. Thần chỉ xin Người ban cho thần một ít hạt thóc trên bàn cờ 64 ô vuông này:*
  - *Ô thứ nhất, Người hãy đặt vào $1$ hạt thóc.*
  - *Ô thứ hai, xin Người đặt gấp đôi là $2$ hạt.*
  - *Ô thứ ba, xin đặt $4$ hạt... và cứ thế, ô sau gấp đôi ô liền trước cho đến ô thứ 64!”*
  
  Nhà vua cười lớn: *"Khanh thật ngây thơ và khiêm tốn lạ lùng! Tưởng gì chứ vài bao thóc thì đáng là bao!"*. Vua lập tức truyền cho quan quản kho lương mở kho mang thóc ra đếm.
  
  Thế nhưng, sau 3 ngày đêm đếm thóc, viên quan quản kho kinh hoàng chạy vào triều quỳ sụp xuống:
  *“Muôn tâu Hoàng thượng! Toàn bộ kho thóc của hoàng gia đã cạn kiệt! Toàn bộ cánh đồng lúa của cả vương quốc cũng không đủ thóc để trả nợ cho Sissa!”*
  
  Tổng số hạt thóc trên bàn cờ là tổng của một *CẤP SỐ NHÂN LỚP 11* có số hạng đầu $u_1 = 1$ và công bội $q = 2$:
  $ S_(64) = u_1 (q^(64) - 1) / (q - 1) = 2^(64) - 1 = 18.446.744.073.709.551.615 "hạt thóc"! $
  
  Nếu quy đổi ra trọng lượng, số thóc này nặng khoảng *461 TỶ TẤN* — nhiều gấp hơn *2.000 lần* tổng sản lượng lương thực thu hoạch của toàn bộ hành tinh Trái Đất trong cả một năm! Muốn chứa hết số thóc ấy, con người phải xây một kho thóc có chiều cao 4 mét, chiều rộng 10 mét và chạy dài suốt quãng đường từ Trái Đất đến tận Mặt Trời!
  
  Nhà vua bàng hoàng nhận ra: Sức mạnh của Cấp số nhân có thể dễ dàng nghiền nát sự giàu có của mọi đế chế vĩ đại nhất trần gian!
]

#tech-box(title: "Dãy Số Hồi Quy Logistic & Thuyết Hỗn Độn: Trật Tự Kỳ Diệu Của Hằng Số Feigenbaum")[
  Trong môn Toán 11, các em học về dãy số truy hồi dạng $u_(n+1) = f(u_n)$. Các em có tin rằng chỉ một công thức dãy số bậc hai đơn giản có thể sinh ra toàn bộ thế giới bí ẩn của *LÝ THUYẾT HỖN ĐỘN (Chaos Theory)*?
  
  Năm 1976, nhà sinh vật học Robert May nghiên cứu sự biến động số lượng cá thể của một loài sinh vật qua các thế hệ bằng *Dãy số Logistic Map*:
  $ x_(n+1) = r dot x_n (1 - x_n) $
  trong đó $x_n in [0, 1]$ là tỷ lệ dân số thế hệ thứ $n$, và tham số $r > 0$ là tốc độ sinh sản:
  
  1. Khi $r < 3$: Dãy số hội tụ êm ả về một trạng thái cân bằng dừng duy nhất.
  2. Khi $r$ vượt qua 3: Dãy số bắt đầu dao động giữa *2 giá trị* (chu kỳ 2).
  3. Khi $r$ tăng lên $3.45$: Chu kỳ nhân đôi thành *4 giá trị*, rồi *8 giá trị*, *16 giá trị*... (Hiện tượng Phân nhánh Nhân đôi Chu kỳ - Period Doubling).
  4. Và khi $r > 3.56995$: Sự tuần hoàn biến mất hoàn toàn! Dãy số rơi vào trạng thái *HỖN ĐỘN THỰC SỰ (Deterministic Chaos)*: Giá trị của các số hạng nhảy múa ngẫu nhiên điên cuồng, không bao giờ lặp lại!
  
  Kỳ diệu hơn nữa, năm 1978, nhà vật lý Mitchell Feigenbaum phát hiện ra rằng: Tỷ số khoảng cách giữa các điểm phân nhánh liên tiếp luôn tiến tới một hằng số phổ quát vĩnh cửu:
  $ delta = lim_(k -> infinity) (r_k - r_(k-1)) / (r_(k+1) - r_k) approx 4.6692016... $
  
  Hằng số Feigenbaum $delta$ này xuất hiện ở mọi hệ thống phi tuyến trong tự nhiên: Từ dòng chảy dung nham núi lửa, chuyển động của tim người khi loạn nhịp, đến sự hỗn loạn của thị trường chứng khoán! Dãy số lớp 11 chính là kính viễn vọng toán học giúp con người nhìn thấu ranh giới mong manh giữa trật tự và hỗn độn!
]

#story-box(
  title: "David Hilbert & Nghịch Lý Khách Sạn Vô Hạn: Bản Chất Kỳ Ảo Của Dãy Số Vô Tận",
  author: "David Hilbert (Đức, 1862 – 1943), Nhà Toán Học Lừng Danh Đại Học Göttingen",
)[
  Năm 1924, trong một bài giảng tại Đại học Göttingen, nhà toán học lỗi lạc David Hilbert đã đưa ra một thí nghiệm tư duy chấn động mang tên *Khách Sạn Vô Hạn của Hilbert (Hilbert's Grand Hotel)*:
  
  Hãy tưởng tượng một khách sạn có *VÔ HẠN PHÒNG* được đánh số theo chỉ số của một dãy số tự nhiên: Phòng 1, Phòng 2, Phòng 3, ..., Phòng $n$, ...
  Một buổi tối, tất cả các phòng trong khách sạn đều ĐÃ KÍN KHÁCH.
  
  1. *Trường hợp 1: Có 1 vị khách mới đến thuê phòng.*
     Ở một khách sạn hữu hạn, lễ tân sẽ lắc đầu từ chối vì hết phòng. Nhưng ở Khách Sạn Vô Hạn, người quản lý cầm loa thông báo:
     *“Xin mời vị khách ở phòng $n$ chuyển sang phòng liền kề $n + 1$!”*
     - Khách ở phòng 1 chuyển sang phòng 2.
     - Khách ở phòng 2 chuyển sang phòng 3...
     - Khách ở phòng $n$ chuyển sang phòng $n + 1$.
     *Kết quả:* Tất cả các vị khách cũ đều có phòng mới, và PHÒNG SỐ 1 TRỐNG RA để đón vị khách mới vào ở!
  
  2. *Trường hợp 2: Một đoàn xe buýt chở VÔ SỐ VỊ KHÁCH MỚI đến cùng lúc.*
     Người quản lý lại cầm loa thông báo:
     *“Xin mời vị khách ở phòng $n$ chuyển sang phòng có số phòng gấp đôi: $2n$!”*
     - Khách phòng 1 sang phòng 2, phòng 2 sang phòng 4, phòng 3 sang phòng 6...
     *Kết quả:* Toàn bộ khách cũ được chuyển vào các phòng mang SỐ CHẴN ($2, 4, 6, 8...$). Toàn bộ vô số các phòng mang SỐ LẺ ($1, 3, 5, 7...$) hoàn toàn để trống để đón đoàn khách vô hạn mới vào ở!
  
  Hilbert đã dùng dãy số tự nhiên để chứng minh một chân lý triết học sâu sắc: *Vô hạn không phải là một con số rất lớn, mà VÔ HẠN LÀ MỘT TRẠNG THÁI TỒN TẠI ĐẶC BIỆT!* Dãy số vô hạn lớp 11 chính là chiếc thang đưa tâm hồn con người vượt qua mọi giới hạn chật hẹp của thế giới vật chất để chạm tới cõi vĩnh hằng!
]

#pagebreak()
'''

