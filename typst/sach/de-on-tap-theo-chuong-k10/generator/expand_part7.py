# -*- coding: utf-8 -*-
import sys
import os

target_path = "/Users/admin/conictypst/typst/sach/de-on-tap-theo-chuong-k10/generator/appendix.py"

with open(target_path, "r", encoding="utf-8") as f:
    orig = f.read()

part7_content = r'''
#pagebreak()

= PHẦN VII: MƯỜI CUỘC ĐẠI CHIẾN TƯ TƯỞNG LÀM THAY ĐỔI LỊCH SỬ TOÁN HỌC

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành tặng những ai yêu mến lịch sử tư tưởng nhân loại: Toán học không phải là một pho tượng đá tĩnh lặng được đúc sẵn từ trên trời rơi xuống. Nó được xây bằng mồ hôi, nước mắt, những cuộc tranh luận nảy lửa và thậm chí cả sự hy sinh bi tráng của những bộ óc vĩ đại nhất từng sống trên Trái Đất.
]

== 1. HIPPASUS XỨ METAPONTUM & CÁI CHẾT BÍ ẨN VÌ SỐ VÔ TỈ $sqrt(2)$ (THẾ KỶ V TCN)

#story-box(
  title: "Cuộc Khủng Hoảng Số Vô Tỉ Đầu Tiên Của Giáo Phái Pythagoras",
  author: "Hippasus xứ Metapontum (Khoảng 500 TCN)",
)[
  Vào thế kỷ V trước Công nguyên, giáo phái Pythagoras tại vùng Crotone nước Ý là một hội kín tôn giáo quyền lực. Tôn chỉ tối cao của họ được khắc trên đá: *"Mọi vật đều là Số!" (All is Number)*. Họ tin rằng toàn bộ vũ trụ từ âm nhạc, các vì sao đến tâm hồn con người đều được dệt nên từ các *Số tự nhiên* và *Tỉ số của hai số tự nhiên (Số hữu tỉ $a / b$)*.
  
  Thế nhưng, một môn đệ trẻ tuổi tài ba tên là *Hippasus xứ Metapontum* khi nghiên cứu một hình vuông đơn vị cạnh bằng $1$ đã đặt ra một câu hỏi định mệnh:
  *Độ dài đường chéo $d$ của hình vuông cạnh 1 bằng bao nhiêu?*
  
  Theo định lý Pythagoras: $d^2 = 1^2 + 1^2 = 2 arrow d = sqrt(2)$.
  Hippasus cố gắng tìm hai số nguyên $a$ và $b$ tối giản sao cho $(a / b)^2 = 2$, tức là $a^2 = 2 b^2$.
  - Nếu $a^2 = 2 b^2$, thì $a^2$ là số chẵn, suy ra $a$ bắt buộc phải là số chẵn: $a = 2k$.
  - Thế vào ta có: $(2k)^2 = 2 b^2 arrow 4 k^2 = 2 b^2 arrow b^2 = 2 k^2$.
  - Vậy $b^2$ cũng là số chẵn, suy ra $b$ cũng phải là số chẵn!
  - Nhưng nếu cả $a$ và $b$ đều là số chẵn, thì phân số $a / b$ CHƯA TỐI GIẢN (cả hai cùng chia hết cho 2), mâu thuẫn hoàn toàn với giả thiết ban đầu!
  
  Hippasus đã chứng minh một chân lý làm sụp đổ toàn bộ đức tin của giáo phái: *Độ dài đường chéo $sqrt(2)$ KHÔNG THỂ biểu diễn dưới dạng phân số của hai số nguyên!* Nó là một *Số vô tỉ (Irrational Number)*!
  
  Truyền thuyết kể rằng, vì hoảng sợ bí mật này bị tiết lộ làm lung lay uy quyền giáo phái, các thành viên Pythagoras đã đưa Hippasus lên một chiếc thuyền ra khơi xa rồi ném ông xuống biển sâu để chôn vùi sự thật. Nhưng chân lý toán học không bao giờ chết đuối dưới đáy biển: Sự xuất hiện của số vô tỉ $sqrt(2)$ đã mở ra một chân trời mới, buộc loài người phải mở rộng tập hợp số từ $QQ$ lên $RR$ như học sinh lớp 10 học hôm nay!
]

== 2. NGHỊCH LÝ ZENO XỨ ELEA: ACHILLES ĐUỔI RÙA & KHÁI NIỆM GIỚI HẠN (450 TCN)

#story-box(
  title: "Bốn Nghịch Lý Chuyển Động Của Zeno",
  author: "Zeno xứ Elea (Hy Lạp, khoảng 490 – 430 TCN)",
)[
  Để bảo vệ triết lý của người thầy Parmenides rằng thế giới là bất biến và chuyển động chỉ là ảo giác của các giác quan, triết gia *Zeno xứ Elea* đã đưa ra 4 nghịch lý nổi tiếng, trong đó kinh điển nhất là: *Achilles và Chú Rùa*.
  
  *Nghịch lý Achilles:* Dũng sĩ chạy nhanh nhất Hy Lạp Achilles chấp chú rùa chạy trước $100 "m"$. Achilles chạy nhanh gấp 10 lần rùa ($10 "m/s"$ so với $1 "m/s"$).
  - Khi Achilles chạy được $100 "m"$ đến vị trí ban đầu của rùa, rùa đã bò thêm được $10 "m"$.
  - Khi Achilles chạy tiếp $10 "m"$, rùa lại bò thêm được $1 "m"$.
  - Khi Achilles chạy thêm $1 "m"$, rùa lại nhích thêm được $0,1 "m"$...
  Quá trình này tiếp diễn vô tận! Mỗi khi Achilles đến được vị trí cũ của rùa, thì rùa đã bò được một đoạn phía trước. Do đó, *Achilles không bao giờ đuổi kịp con rùa!*
  
  Suốt hơn 2.000 năm, nghịch lý của Zeno làm điên đầu các triết gia. Phải đến thế kỷ XVII, khi phép tính vi tích phân và *Tổng của cấp số nhân lùi vô hạn* ra đời, bài toán mới được giải mã hoàn toàn:
  $ T = 10 + 1 + 0,1 + 0,01 + ... = 10 / (1 - 0,1) = 100 / 9 = 11,111... "giây"! $
  
  Tổng của VÔ HẠN khoảng thời gian nhỏ li ti hoàn toàn có thể hội tụ về MỘT CON SỐ HỮU HẠN! Achilles vượt qua rùa ở đúng giây thứ $11,11$ tại vị trí $111,11 "m"$! Zeno đã vô tình tặng cho nhân loại hạt mầm đầu tiên của Giải tích và Giới hạn!
]

== 3. CUỘC ĐẤU TRƯỜNG ĐẠI SỐ MILAN 1545: TARTAGLIA, CARDANO & PHƯƠNG TRÌNH BẬC BA

#story-box(
  title: "Bí Mật Công Thức Bậc Ba & Sự Ra Đời Của Số Phức",
  author: "Niccolò Tartaglia (1499 – 1557) & Girolamo Cardano (1501 – 1576)",
)[
  Thời kỳ Phục hưng tại nước Ý, các nhà toán học kiếm sống và giữ ghế giáo sư bằng các *Cuộc đấu trường toán học công khai (Mathematical Duels)*: Hai bên ra cho nhau 30 bài toán hóc búa, ai giải được nhiều hơn trước sự chứng kiến của công chúng và quan tòa sẽ giành được tiền thưởng và danh tiếng.
  
  Nhà toán học nghèo nói ngọng *Niccolò Tartaglia* đã tìm ra công thức giải phương trình bậc ba dạng $x^3 + p x = q$. Bác sĩ khét tiếng *Girolamo Cardano* đã nài nỉ, thề độc trước Chúa sẽ giữ kín bí mật để xin Tartaglia truyền lại công thức dưới dạng một bài thơ mã hóa. Thế nhưng, năm 1545, Cardano đã bội ước xuất bản công thức trong kiệt tác *“Ars Magna”* (Nghệ thuật Lớn).
  
  Tartaglia tức giận phát điên, thách đấu Cardano một trận đấu đại số tại nhà thờ Santa Maria ở Milan trước hàng nghìn khán giả. Nhưng điều kỳ diệu nhất là: Khi Cardano áp dụng công thức cho phương trình $x^3 - 15x - 4 = 0$, công thức xuất hiện một biểu thức "quái vật":
  $ x = root(3, 2 + sqrt(-121)) + root(3, 2 - sqrt(-121)) $
  Căn bậc hai của một số âm $sqrt(-121)$! Thời đó, số âm còn chưa có căn! Nhưng Cardano nhận thấy phương trình này có một nghiệm thực rõ như ban ngày là $x = 4$ ($4^3 - 15(4) - 4 = 64 - 60 - 4 = 0$)!
  
  Để cứu công thức của mình, nhà toán học Rafael Bombelli đã dũng cảm chấp nhận thực thể $sqrt(-1)$ như một con số ảo (Imaginary Number $i$). Cuộc đại chiến Tartaglia - Cardano đã vô tình khai sinh ra *Tập hợp Số phức $CC$* — cánh cổng đưa vật lý lượng tử và kỹ thuật điện tử thế kỷ XX cất cánh!
]

== 4. ĐẠI CHIẾN BẢN QUYỀN VI TÍCH PHÂN: NEWTON VS LEIBNIZ (1699 – 1716)

#story-box(
  title: "Cuộc Chiến Danh Dự Giữa Hoàng Gia Anh & Lục Địa Châu Âu",
  author: "Sir Isaac Newton (Anh, 1642 – 1727) & Gottfried Wilhelm Leibniz (Đức, 1646 – 1716)",
)[
  Đây là cuộc chiến học thuật khốc liệt và cay đắng nhất trong lịch sử khoa học nhân loại giữa hai thiên tài vĩ đại nhất của thế kỷ XVII:
  - *Isaac Newton* phát minh ra phương pháp "Fluxions" (Phép tính dòng) vào năm 1666 khi ông 24 tuổi tránh dịch hạch tại quê nhà Woolsthorpe. Nhưng Newton có tính cách đa nghi, sợ bị chỉ trích nên giữ kín các bản thảo trong ngăn kéo suốt hàng chục năm không xuất bản.
  - *Gottfried Wilhelm Leibniz* độc lập phát minh ra phép tính vi tích phân vào khoảng năm 1674 tại Paris và công bố rộng rãi trên tạp chí khoa học năm 1684 với hệ thống ký hiệu tuyệt mỹ: $d y / (d x)$ và $integral y d x$.
  
  Khi Newton công bố cuốn sách *Principia* năm 1687, những người ủng hộ Newton tại Hội Hoàng gia Anh đã cáo buộc Leibniz ăn cắp ý tưởng của Newton qua những bức thư trao đổi năm xưa. Trớ trêu thay, Newton chính là Chủ tịch Hội Hoàng gia Anh! Ông đã tự tay lập ra một ủy ban điều tra "vô tư", tự mình bí mật viết báo cáo kết luận Leibniz là kẻ đạo văn!
  
  Cuộc chiến làm chia rẽ nền khoa học châu Âu suốt hơn một thế kỷ: Nước Anh bám lấy ký hiệu chấm $dot(x)$ rườm rà của Newton nên tụt hậu về giải tích, trong khi lục địa châu Âu phát triển rực rỡ nhờ ký hiệu $d / (d x)$ và $integral$ của Leibniz. Ngày nay, toàn bộ sách giáo khoa thế giới đều dùng ký hiệu của Leibniz, và lịch sử công bằng ghi nhận: *Newton là người đầu tiên tìm ra bản chất vật lý, nhưng Leibniz là người đầu tiên trao cho nhân loại ngôn ngữ đại số hoàn hảo của vi tích phân!*
]

== 5. SỰ SỤP ĐỔ CỦA TIÊN ĐỀ 5 EUCLID: LOBACHEVSKY, BOLYAI & HÌNH HỌC PHI EUCLID

#story-box(
  title: "Vượt Qua Giáo Điều 2.000 Năm Của Hình Học Cổ Điển",
  author: "Nikolai Lobachevsky (Nga, 1792 – 1856) & János Bolyai (Hungary, 1802 – 1860)",
)[
  Trong cuốn *“Cơ sở”* (Elements) năm 300 TCN, Euclid đưa ra 5 tiên đề hình học. Bốn tiên đề đầu tiên ngắn gọn, hiển nhiên. Nhưng *Tiên đề thứ 5 (Tiên đề đường thẳng song song)* lại dài dòng và kỳ quặc: *"Qua một điểm nằm ngoài đường thẳng, chỉ kẻ được duy nhất một đường thẳng song song với đường thẳng đã cho"*.
  
  Suốt 2.000 năm, hàng trăm nhà toán học vĩ đại đã cố gắng chứng minh Tiên đề 5 từ 4 tiên đề đầu để biến nó thành định lý, nhưng tất cả đều chuốc lấy thất bại ê chề.
  
  Đến thập niên 1820, một chàng sĩ quan trẻ người Hungary tên là *János Bolyai* và một giáo sư đại học nghèo người Nga tên là *Nikolai Lobachevsky* đã độc lập thực hiện một bước nhảy tư duy chấn động:
  *Điều gì sẽ xảy ra nếu Tiên đề thứ 5 KHÔNG ĐÚNG?*
  
  Họ giả định: *Qua một điểm ngoài đường thẳng, có thể kẻ được VÔ SỐ đường thẳng song song!*
  Tưởng chừng như giả định điên rồ này sẽ dẫn đến mâu thuẫn. Nhưng không! Một hệ thống hình học mới hoàn toàn nhất quán, logic và tuyệt mỹ đã mở ra: *Hình học Hypebol (Non-Euclidean Geometry)*! Trong không gian này:
  - Tổng ba góc của một tam giác luôn *nhỏ hơn $180 degree$*!
  - Không tồn tại hai tam giác đồng dạng mà khác kích thước!
  
  János Bolyai đã viết thư cho cha mình: *“Từ hư vô, con đã sáng tạo ra một vũ trụ mới kỳ lạ!”*. 
  Chính Hình học Phi Euclid này đã giải phóng loài người khỏi chiếc lồng không gian phẳng của Euclid, trở thành công cụ toán học tối thượng để Albert Einstein xây dựng nên *Thuyết Tương đối Tổng quát (General Relativity)* năm 1915, mô tả một vũ trụ nơi không-thời gian bị uốn cong bởi khối lượng của các vì sao!
]

== 6. GEORG CANTOR & CUỘC CHIẾN VÌ CÕI VÔ HẠN (1874 – 1891)

#story-box(
  title: "Người Dám Đếm Số Lượng Của Những Cõi Vô Tận",
  author: "Georg Cantor (Đức, 1845 – 1918)",
)[
  Trước Georg Cantor, toàn bộ các nhà tư tưởng từ Aristotle, Gauss đến Cauchy đều coi cõi Vô hạn ($infinity$) là một điều cấm kỵ: Vô hạn chỉ là một tiềm năng (Potential Infinity - một quá trình không bao giờ dừng lại), chứ không bao giờ là một thực thể hoàn tất (Actual Infinity).
  
  Nhưng vào năm 1874, nhà toán học người Đức *Georg Cantor* đã làm một điều chưa từng có ai dám làm: Ông xếp các cõi vô hạn lên bàn cân và đo lường kích thước (Lực lượng tập hợp - Cardinality) của chúng!
  - Bằng phương pháp song ánh, Cantor chứng minh: Tập số nguyên $ZZ$ và tập số hữu tỉ $QQ$ có cùng lực lượng với tập số tự nhiên $NN$ (Vô hạn đếm được $aleph_0$).
  - Sau đó, bằng *Phương pháp đường chéo kỳ ảo (Cantor's Diagonal Argument)*, ông chứng minh: Tập số thực $RR$ trên đoạn $[0; 1]$ là *VÔ HẠN KHÔNG ĐỂM ĐƯỢC ($c = 2^(aleph_0)$)*!
  
  *Kết luận chấn động:* Có những cõi Vô hạn TO LỚN HƠN những cõi Vô hạn khác! Tồn tại một hệ thống cấp bậc vô tận các cõi Vô hạn ($aleph_0 < aleph_1 < aleph_2 < ...$)!
  
  Khám phá này đã khiến giới hàn lâm nổi giận. Giáo sư Leopold Kronecker công khai gọi Cantor là "kẻ làm tha hóa thanh niên" và "kẻ phản bội toán học". Nhà triết học Poincaré gọi lý thuyết tập hợp là "căn bệnh hiểm nghèo". Cantor bị cô lập, rơi vào trầm cảm nặng nề và qua đời trong bệnh viện tâm thần ở Halle năm 1918.
  
  Nhưng nhà toán học vĩ đại David Hilbert đã đứng lên bảo vệ ông trước toàn thế giới bằng câu nói bất hủ:
  *“Không một ai có thể trục xuất chúng ta ra khỏi thiên đường mà Cantor đã mở ra cho nhân loại!”*. Ngày nay, toàn bộ toán học hiện đại đều được đặt trên nền tảng Lý thuyết Tập hợp của Georg Cantor!
]

== 7. DAVID HILBERT & 23 BÀI TOÁN THẾ KỶ TẠI PARIS 1900

#story-box(
  title: "Bản Tuyên Ngôn Định Hình Thế Kỷ XX Của Vị Vua Toán Học",
  author: "David Hilbert (Đức, 1862 – 1943) & Đại hội Toán học Quốc tế Paris 1900",
)[
  Ngày 8 tháng 8 năm 1900, tại Đại hội Toán học Quốc tế tổ chức tại Paris, nhà toán học người Đức *David Hilbert* bước lên bục diễn thuyết. Trong không khí trang nghiêm đón chào thế kỷ mới, ông đã dõng dạc đọc bản báo cáo lịch sử mang tên *“Các vấn đề Toán học”*, công bố danh sách 23 bài toán hóc búa chưa có lời giải.
  
  Hilbert tuyên bố một niềm tin sắt đá vào sức mạnh vô hạn của lý trí con người:
  *“Trong Toán học không có chỗ cho sự bất khả tri (Ignorabimus)! Chúng ta phải biết, và chúng ta sẽ biết! (Wir müssen wissen, wir werden wissen!)”*.
  
  23 bài toán của Hilbert đã trở thành kim chỉ nam dẫn đường cho toàn bộ nền toán học thế giới suốt thế kỷ XX. Việc giải quyết được một bài toán trong danh sách này đủ để mang lại danh tiếng bất tử cho bất kỳ nhà toán học nào (như Kurt Gödel giải bài toán số 1 và 2, Andrew Wiles giải bài toán Fermat liên quan bài toán số 10). Tinh thần lạc quan cách mạng của Hilbert chính là ngọn hải đăng soi sáng cho khát vọng chinh phục tri thức của nhân loại!
]

== 8. KURT GÖDEL & HAI ĐỊNH LÝ BẤT TOÀN NĂM 1931

#story-box(
  title: "Giới Hạn Tối Hậu Của Tư Duy Logic Con Người & Máy Tính",
  author: "Kurt Gödel (Áo, 1906 – 1978)",
)[
  Thập niên 1920, David Hilbert khởi xướng "Chương trình Hilbert" với tham vọng tối thượng: Xây dựng một hệ thống tiên đề toán học hoàn hảo tuyệt đối, thỏa mãn hai điều kiện:
  1. *Tính Nhất quán (Consistency):* Không bao giờ sinh ra bất kỳ mâu thuẫn nào ($1 = 0$).
  2. *Tính Đầy đủ (Completeness):* Mọi mệnh đề toán học đúng đắn đều có thể được chứng minh bên trong hệ thống tiên đề đó!
  
  Cả thế giới tin rằng toán học sắp đạt đến sự hoàn mỹ tối hậu. Nhưng vào mùa thu năm 1931 tại Vienna, một chàng thanh niên 25 tuổi trầm lặng tên là *Kurt Gödel* đã công bố một bài báo làm sụp đổ hoàn toàn giấc mơ của Hilbert: *Hai Định lý Bất toàn (Incompleteness Theorems)*.
  
  Bằng cách mã hóa các công thức toán học thành các số nguyên (Mã hóa Gödel), ông đã tạo ra một mệnh đề tự tham chiếu:
  $ G: "Mệnh đề này KHÔNG THỂ chứng minh được trong hệ tiên đề!" $
  - Nếu mệnh đề $G$ được chứng minh: Hệ thống đã chứng minh một điều sai $arrow$ Toán học mâu thuẫn!
  - Nếu mệnh đề $G$ không thể chứng minh: Mệnh đề $G$ nói đúng chân lý, nhưng hệ thống bất lực không chứng minh được $arrow$ Toán học bất toàn!
  
  *Định lý Bất toàn Gödel khẳng định:* Mọi hệ tiên đề đủ mạnh để chứa số học tự nhiên đều *KHÔNG THỂ VỪA NHẤT QUÁN VỪA ĐẦY ĐỦ*! Luôn tồn tại những chân lý toán học đúng đắn mà KHÔNG MỘT HỆ TIÊN ĐỀ NÀO CÓ THỂ CHỨNG MINH ĐƯỢC!
  
  Định lý Gödel không phải là sự thất bại của toán học, mà là một phát hiện triết học vĩ đại nhất thế kỷ XX: Nó chứng minh rằng trí tuệ con người và vũ trụ phong phú vô tận, không một cỗ máy tính thuật toán nào có thể đóng khung toàn bộ chân lý vào một chiếc hộp hữu hạn!
]

== 9. ALAN TURING 1936 & KHAI SINH KHOA HỌC MÁY TÍNH HIỆN ĐẠI

#story-box(
  title: "Từ Máy Turing Trừu Tượng Đến Siêu Trí Tuệ Nhân Tạo",
  author: "Alan Turing (Anh, 1912 – 1954)",
)[
  Năm 1936, chàng sinh viên 24 tuổi tại Cambridge *Alan Turing* khi suy ngẫm về Bài toán Quyết định (Entscheidungsproblem) của Hilbert đã phát minh ra một cỗ máy tưởng tượng mang tên *Máy Turing (Turing Machine)*:
  Một cỗ máy gồm một dải băng dài vô tận chia thành các ô vuông, một đầu đọc/ghi có thể di chuyển sang trái, sang phải, đọc ký hiệu $0$ hoặc $1$, và thay đổi trạng thái nội tại theo một bảng quy tắc hữu hạn.
  
  Chỉ với mô hình toán học đơn sơ bằng giấy và bút đó, Turing đã chứng minh tồn tại *Máy Turing Phổ quát (Universal Turing Machine)* có thể mô phỏng lại hoạt động của BẤT KỲ CỖ MÁY TÍNH TOÁN NÀO TRÊN ĐỜI! Đó chính là bản vẽ thiết kế lý thuyết đầu tiên của chiếc máy tính đa năng (Computer) mà các em đang sử dụng ngày nay!
  
  Trong Thế chiến II, Turing đã lãnh đạo đội ngũ tại Bletchley Park chế tạo cỗ máy cơ điện Bombe giải mã cỗ máy mật mã Enigma của Đức Quốc Xã, cứu sống hơn 14 triệu sinh mạng và rút ngắn cuộc chiến tranh ít nhất hai năm. Alan Turing được nhân loại tôn vinh là Người Cha của Khoa học Máy tính và Trí tuệ Nhân tạo hiện đại!
]

== 10. ANDREW WILES 1994 & BẢN HÙNG CA 358 NĂM GIẢI MÃ ĐỊNH LÝ CUỐI CÙNG CỦA FERMAT

#story-box(
  title: "Hành Trình Cô Đơn Bảy Năm Dưới Căn Gác Mái",
  author: "Pierre de Fermat (1637) & Sir Andrew Wiles (Anh, 1953 – nay)",
)[
  Năm 1637, bên lề cuốn sách cổ *“Arithmetica”* của Diophantus, thẩm phán Pierre de Fermat đã viết một dòng ghi chú nổi tiếng:
  *“Phương trình $x^n + y^n = z^n$ không có nghiệm nguyên dương nào khi $n >= 3$. Ta đã tìm ra một lời chứng minh thực sự tuyệt diệu cho điều này, nhưng lề cuốn sách này quá hẹp không đủ chỗ để ghi lại!”*.
  
  Dòng ghi chú lửng lơ đó đã trở thành lời thách thức lớn nhất lịch sử toán học suốt 358 năm. Hàng ngàn nhà toán học từ Euler, Gauss, Sophie Germain đến Dirichlet, Kummer đều lao vào cuộc săn lùng nhưng đều thất bại.
  
  Năm 1963, khi mới là một cậu bé 10 tuổi tại thư viện thành phố Cambridge, *Andrew Wiles* đã đọc được câu đố này và thề rằng cả cuộc đời mình sẽ dành để giải quyết nó. Năm 1986, khi nhà toán học Ken Ribet chứng minh được rằng Định lý Fermat là hệ quả của *Giả thuyết Taniyama-Shimura* về đường cong Elip, Wiles biết rằng thời khắc lịch sử đã đến.
  
  Suốt 7 năm ròng rã, Wiles tự giam mình dưới căn gác mái tại Đại học Princeton, tuyệt đối không tiết lộ cho bất kỳ ai trừ vợ mình. Ông từ bỏ mọi công việc giảng dạy và hội thảo, âm thầm kết nối những nhánh toán học tối tân nhất: Đường cong Elip, Dạng Modular, Đại số Galois và Hệ số Biến dạng.
  
  Tháng 6 năm 1993, tại Viện Isaac Newton ở Cambridge, Wiles bước lên bục giảng và viết dòng kết luận cuối cùng trước sự sững sờ nghẹn ngào của cả hội trường:
  *“Tôi nghĩ rằng tôi sẽ dừng lại ở đây!”*. Cả khán phòng vỡ òa trong những tràng pháo tay kéo dài không dứt! Dù sau đó phát hiện một lỗ hổng nhỏ, Wiles cùng học trò Richard Taylor đã kiên cường vá lại lỗ hổng sau 1 năm và chính thức công bố công trình hoàn mỹ vào năm 1995!
  
  *Thông điệp cho tuổi trẻ:* Định lý Fermat không chỉ là một kết quả số học, nó là minh chứng cho sự kiên định bền bỉ phi thường của con người. Không có bí mật nào của tự nhiên có thể lẩn trốn mãi mãi trước một ý chí sắt đá dám dâng hiến trọn vẹn cả cuộc đời cho chân lý!
]
'''

# Chèn Phần VII vào trước Lời kết
end_pos = orig.find("// ══════════════════════════════════════════════════════════════\n// LỜI KẾT:")
if end_pos != -1:
    orig = orig[:end_pos] + part7_content + "\n\n" + orig[end_pos:]
    print("Inserted Part VII successfully before Conclusion!")
else:
    print("Warning: Could not find Conclusion tag!")

with open(target_path, "w", encoding="utf-8") as f:
    f.write(orig)

print(f"Finished updating appendix.py with Part VII -> {target_path}")
