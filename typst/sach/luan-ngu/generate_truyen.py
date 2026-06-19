import sys

content = """#let ln-truyen-note-for(ch) = {
"""

stories = [
  # 1 Học Nhi
  "*1. Lão Bành Khuyên Học:* Một học trò già đến xin học chữ. Khổng Tử nói: \"Học không bao giờ muộn, như thắp một ngọn đuốc đi trong đêm\". Học mà thường ôn tập, tìm thấy niềm vui trong chính sự tiến bộ của mình.\n\n    *2. Sự Thành Tín:* Tăng Tử mỗi ngày xét mình ba lần: làm việc cho người có hết lòng chưa? Kết giao bạn bè có thành tín không? Lời thầy dạy có ôn tập không? Học đạo làm người cốt ở chỗ tự sửa mình trước.",
  # 2 Vi Chính
  "*1. Cai Trị Bằng Đức:* Khổng Tử ví người cai trị bằng đức như ngôi sao Bắc Thần. Nó đứng yên một chỗ nhưng các vì sao khác đều chầu về. Dùng đạo đức để cảm hóa thì người ta tự giác phục tùng.\n\n    *2. Ba Mươi Tuổi Lập Thân:* Khổng Tử tự kể về đời mình: \"Mười lăm tuổi dốc chí học, ba mươi tuổi lập thân, bốn mươi tuổi không nghi ngờ, năm mươi tuổi biết mệnh trời\". Đời người là một quá trình liên tục vươn lên.",
  # 3 Bát Dật
  "*1. Bản Chất Của Lễ:* Lâm Phóng hỏi về gốc của Lễ. Khổng Tử khen: \"Câu hỏi hay thay! Lễ bề ngoài phô trương không bằng tiết kiệm; tang lễ chuộng nghi thức rườm rà không bằng thật lòng thương xót\".\n\n    *2. Không Có Nhân Thì Lễ Để Làm Gì:* Khổng Tử than: \"Người mà không có lòng Nhân, thì Lễ để làm gì? Nhạc để làm gì?\". Hình thức trống rỗng không thay thế được phẩm chất bên trong.",
  # 4 Lý Nhân
  "*1. Người Nhân Chọn Chỗ Ở:* Khổng Tử khuyên nên chọn nơi có phong tục tốt đẹp để sống. Ở gần người có đức thì bản thân cũng được thơm lây. Sống không chọn nơi nhân đức, sao gọi là khôn ngoan?\n\n    *2. Đạo Nhất Dĩ Quán Chi:* Khổng Tử nói với Tăng Tử: \"Đạo của ta chỉ dùng một lẽ mà thông suốt tất cả\". Tăng Tử hiểu ngay đó là chữ \"Trung\" (hết lòng) và \"Thứ\" (suy bụng ta ra bụng người).",
  # 5 Công Dã Tràng
  "*1. Xem Xét Con Người:* Tử Cống tự nhận mình thông minh. Khổng Tử bảo: \"Nhan Hồi nghe một biết mười, còn trò nghe một chỉ biết hai\". Việc tự biết mình kém người khác chính là khởi đầu của trí tuệ.\n\n    *2. Không Ngại Hỏi Kẻ Dưới:* Khổng Tử giải thích việc Khổng Văn Tử được ban thụy hiệu \"Văn\": \"Vì ông ấy thông minh, ham học và không xấu hổ khi hỏi người kém hơn mình\".",
  # 6 Ung Dã
  "*1. Đức Của Nhan Hồi:* Khổng Tử khen Nhan Hồi: \"Một giỏ cơm, một bầu nước, sống trong ngõ hẻm nghèo nàn, người khác không chịu nổi sự ưu sầu, mà Hồi không đổi niềm vui. Hiền thay Nhan Hồi!\".\n\n    *2. Chất Và Văn:* Nếu chất phác quá thì thô kệch, nếu văn vẻ quá thì hào nhoáng. Chỉ khi Văn và Chất hòa hợp cân đối, mới tạo nên người quân tử đích thực.",
  # 7 Thuật Nhi
  "*1. Thuật Chứ Không Tác:* Khổng Tử nói: \"Ta thuật lại cái cũ chứ không sáng tác cái mới, vì ta tin tưởng và yêu thích văn hóa cổ đại\". Sự khiêm tốn của người thầy vĩ đại.\n\n    *2. Ba Người Đi Cùng:* Khổng Tử nói: \"Ba người cùng đi, tất có người là thầy ta. Chọn cái tốt của họ để theo, lấy cái xấu của họ để tự sửa mình\". Học hỏi ở khắp mọi nơi.",
  # 8 Thái Bá
  "*1. Thái Bá Nhường Ngôi:* Thái Bá nhường ngôi vua cho em, trốn đi ở ẩn, nhân dân không biết lấy lời gì để ca ngợi. Đức hạnh cao nhất là hy sinh vì đại cục mà không màng danh tiếng.\n\n    *2. Học Như Kẻ Đuổi Không Kịp:* Khổng Tử dạy: \"Học giống như người chạy đuổi theo không kịp, lại còn lo sẽ bị mất đi\". Tinh thần cầu học không bao giờ được phép tự mãn.",
  # 9 Tử Hãn
  "*1. Dòng Sông Chảy Mãi:* Đứng trên bờ sông, Khổng Tử cảm thán: \"Sự trôi qua của thời gian cũng giống như dòng nước này, ngày đêm không ngừng nghỉ\". Một lời nhắc nhở quý trọng thời gian.\n\n    *2. Cây Tùng Bách Mùa Đông:* \"Khi trời lạnh lẽo, ta mới biết cây tùng cây bách là những loài rụng lá sau cùng\". Thử thách gian nan mới thử được lòng kiên trung của con người.",
  # 10 Hương Đảng
  "*1. Khổng Tử Về Làng:* Khổng Tử khi ở trong làng thì khiêm nhường như người không biết ăn nói; nhưng ở triều đình thì ăn nói trôi chảy, chỉ là rất cẩn trọng. Lễ nghi tùy nơi mà ứng biến.\n\n    *2. Ăn Uống Không Cẩu Thả:* Ông không ăn thịt thái không vuông vức, không ngồi chiếu trải không ngay ngắn. Sự chỉnh chu trong sinh hoạt hằng ngày phản ánh sự ngay thẳng của nội tâm.",
  # 11 Tiên Tiến
  "*1. Bốn Môn Sinh Bàn Chí Hướng:* Tử Lộ, Tăng Tích, Nhiễm Hữu, Công Tây Hoa hầu ngồi. Mỗi người nói một chí hướng làm quan, làm tướng. Chỉ có Tăng Tích muốn đi tắm sông, hóng mát, ca hát rồi về. Khổng Tử lại khen Tăng Tích, vì Đạo không chỉ là trị quốc mà còn là hòa điệu với tự nhiên.\n\n    *2. Quá Mức Và Bất Cập:* Khổng Tử nhận xét Tử Trương làm hơi quá, còn Tử Hạ lại làm chưa tới. Cả hai đều không đạt đến chữ \"Trung dung\" (sự vừa vặn hoàn hảo).",
  # 12 Nhan Uyên
  "*1. Khắc Kỷ Phục Lễ:* Nhan Uyên hỏi về lòng Nhân. Khổng Tử đáp: \"Khắc chế bản thân, quay về với Lễ gọi là Nhân. Không nhìn bậy, không nghe bậy, không nói bậy, không làm bậy.\".\n\n    *2. Quân Tử Thành Tựu Người Khác:* Khổng Tử dạy: \"Người quân tử vun đắp điều tốt cho người, không hùa theo điều xấu của người. Kẻ tiểu nhân thì làm ngược lại\".",
  # 13 Tử Lộ
  "*1. Dục Tốc Bất Đạt:* Tử Lộ đi làm quan tể tướng, hỏi cách cai trị. Khổng Tử bảo: \"Đừng muốn nhanh chóng, đừng nhìn lợi nhỏ. Muốn nhanh thì không đạt, nhìn lợi nhỏ thì việc lớn không thành\".\n\n    *2. Cha Giấu Tội Cho Con:* Có người khoe làng mình có người ngay thẳng, cha ăn trộm cừu con ra làm chứng. Khổng Tử bảo: \"Ngay thẳng chỗ ta khác thế: cha giấu tội cho con, con giấu tội cho cha, sự ngay thẳng tự có ở trong đó\".",
  # 14 Hiến Vấn
  "*1. Báo Oán Bằng Gì:* Có người hỏi: \"Lấy ân báo oán thì sao?\". Khổng Tử đáp: \"Thế lấy gì báo ân? Hãy lấy sự ngay thẳng (trực) để báo oán, và lấy ân để báo ân\".\n\n    *2. Kẻ Sĩ Và Sự Thoải Mái:* Khổng Tử nói: \"Kẻ sĩ mà quyến luyến sự an nhàn, thoải mái thì không xứng đáng gọi là kẻ sĩ\".",
  # 15 Vệ Linh Công
  "*1. Kỷ Sở Bất Dục:* Tử Cống hỏi: \"Có một chữ nào có thể giữ làm chuẩn mực suốt đời không?\". Khổng Tử đáp: \"Đó là chữ Thứ. Điều gì mình không muốn thì đừng làm cho người khác\".\n\n    *2. Quá Mà Không Sửa:* Khổng Tử cảnh báo: \"Có lỗi mà không chịu sửa, đó mới thực sự là có lỗi\".",
  # 16 Quý Thị
  "*1. Ít Chứ Không Lo Nghèo:* Khổng Tử bàn về cai trị: \"Không lo thiếu của cải mà lo phân chia không đều; không lo dân ít mà lo dân không được an bình. Vì chia đều thì không ai nghèo, hòa thuận thì không lo dân ít\".\n\n    *2. Ba Điều Ích Lợi:* Kết bạn có ba hạng có ích: bạn ngay thẳng, bạn chân thực, bạn nghe nhiều biết rộng. Chơi với bạn xiểm nịnh, a dua, khéo nói thì sẽ chịu họa.",
  # 17 Dương Hóa
  "*1. Gần Mực Thì Đen:* Khổng Tử nói: \"Bản tính con người lúc sinh ra vốn gần giống nhau, nhưng do tập nhiễm thói quen mà trở nên xa cách nhau\".\n\n    *2. Dùng Dao Mổ Trâu Cắt Cổ Gà:* Khổng Tử đến ấp Vũ Thành nghe tiếng đàn hát, liền cười trêu Tử Du: \"Giết gà sao phải dùng dao mổ trâu?\". Nhưng Tử Du đáp: \"Học đạo thì dân dễ sai khiến\". Khổng Tử vội nhận mình nói đùa.",
  # 18 Vi Tử
  "*1. Người Cuồng Nước Sở:* Tiếp Dư hát trêu Khổng Tử: \"Phượng hoàng ơi phượng hoàng, sao đức nhà ngươi suy đồi thế! Việc đã qua không can gián được, việc sắp tới còn có thể theo đuổi kịp. Thôi đi, thôi đi! Kẻ tòng chính ngày nay nguy mất!\".\n\n    *2. Cày Cấy Chốn Tị Thế:* Tử Lộ bị lạc, gặp hai ẩn sĩ Trường Cừ và Kiệt Nịch. Họ khuyên Tử Lộ nên theo người lánh đời thay vì lánh kẻ xấu. Nhưng Khổng Tử bảo: \"Trách nhiệm của ta là cứu vớt con người, không thể đi chung bầy với chim thú\".",
  # 19 Tử Trương
  "*1. Lỗi Của Quân Tử:* Tử Cống nói: \"Lỗi lầm của người quân tử giống như nhật thực, nguyệt thực. Khi có lỗi, mọi người đều nhìn thấy; khi sửa đổi, mọi người đều ngưỡng vọng\".\n\n    *2. Đạo Của Văn Vương:* Tử Cống bảo Khổng Tử học ở khắp mọi nơi, bất cứ đâu có dấu tích đạo đức của Văn Vương, Võ Vương còn sót lại, ông đều tiếp thu, không cần học ở một vị thầy cố định.",
  # 20 Nghiêu Viết
  "*1. Biết Mệnh Trời:* Khổng Tử tổng kết: \"Không biết mệnh trời thì không thể làm người quân tử. Không biết Lễ thì không có chỗ đứng trong đời. Không biết lời nói thì không hiểu được con người\".\n\n    *2. Việc Chính Sự:* Vua Nghiêu truyền ngôi cho Thuấn, nhắc nhở hãy nắm giữ đạo Trung dung. Lòng dân an thì nước được trị.",
]

for i, s in enumerate(stories, 1):
    content += f"  if ch == {i} [\n    {s}\n  ] else "

content += "{\n    none\n  }\n}\n"

with open("/Users/admin/conictypst/typst/sach/luan-ngu/truyen.typ", "w") as f:
    f.write(content)
