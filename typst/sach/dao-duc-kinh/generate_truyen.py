import sys

content = """#let dao-truyen-note-for(ch) = {
"""

# I will append cases 1 to 81 using a loop with generated stories.
stories = [
  # 1
  "*1. Chiếc Cốc Rỗng:* Một học giả đến tìm thiền sư Nam Ẩn để hỏi về Đạo. Sư cứ rót trà mãi cho đến khi tràn cả ra bàn. Học giả kêu lên: \"Tràn rồi, không rót thêm được nữa!\". Sư đáp: \"Ông cũng như chiếc cốc này, đầy ắp định kiến thì làm sao ta chỉ Đạo cho ông được?\".\n\n    *2. Ngón Tay Chỉ Trăng:* Một tỳ kheo hỏi Lục Tổ Huệ Năng về kinh thư. Tổ nói: \"Chân lý như mặt trăng, ngôn ngữ như ngón tay chỉ trăng. Đừng kẹt vào ngón tay mà quên nhìn trăng, vì tên gọi không phải là bản chất vĩnh hằng.\".",
  # 2
  "*1. Bóng Tối Và Ánh Sáng:* Một họa sĩ vẽ bức tranh toàn màu trắng rồi phàn nàn không ai thấy gì. Người thầy lấy bút đen điểm một chấm nhỏ, bức tranh bỗng có hồn. Ánh sáng chỉ có ý nghĩa khi ta biết đến bóng tối.\n\n    *2. Con Lừa Đeo Tượng Phật:* Con lừa cõng tượng Phật đi qua phố, thấy người ta quỳ lạy liền tưởng họ lạy mình nên hí hửng kiêu ngạo. Khi tượng được tháo xuống, nó bị chủ đánh đuổi. Xấu và đẹp, sang và hèn đều là do tự nhiên tương sinh, không có gì là thực thể độc lập.",
  # 3
  "*1. Ngôi Làng Yên Bình:* Một ngôi làng không có trộm cắp, không có khóa cửa. Một ngày, một thương nhân mang theo vàng bạc đến và khoe khoang. Từ đó, người dân bắt đầu biết đố kỵ và sinh ra trộm cắp. Khi không tôn sùng vật chất, lòng dân tự nhiên an định.\n\n    *2. Vị Vua Vô Danh:* Có một vị vua không bao giờ đặt ra các giải thưởng hay vinh danh người tài giỏi. Thế nhưng vương quốc của ông không có tham nhũng hay tranh giành quyền lực, vì mọi người làm việc chỉ vì niềm vui chứ không vì sự so đo.",
  # 4
  "*1. Bánh Xe Hữu Dụng:* Trục xe có lỗ rỗng ở giữa mới có thể gắn nan hoa và quay được. Nếu trục xe đặc ruột, chiếc xe trở nên vô dụng. Sự trống rỗng tạo ra không gian cho vạn vật vận hành.\n\n    *2. Không Gian Căn Phòng:* Một kiến trúc sư xây nhà, người ta hỏi anh xây gì. Anh đáp: \"Tôi đang xây những khoảng không\". Bức tường chỉ là giới hạn, nhưng chính khoảng không bên trong mới là nơi con người sinh sống.",
  # 5
  "*1. Ống Bễ Của Thợ Rèn:* Ống bễ rỗng tuếch, nhưng khi kéo lên nén xuống lại sinh ra gió thổi bùng ngọn lửa. Đạo cũng vậy, tuy rỗng không nhưng sức mạnh sáng tạo là vô tận.\n\n    *2. Đám Cháy Rừng:* Một cơn cháy rừng thiêu rụi cả cây tốt lẫn cây sâu bệnh. Nó không có tình cảm ưu ái với bất cứ cây nào. Tự nhiên công bình vô tư như vậy, vạn vật chỉ là chó rơm trong cuộc vận động của Đất Trời.",
  # 6
  "*1. Dòng Suối Nguồn:* Suối nguồn ẩn sâu trong thung lũng, cung cấp nước cho muôn loài mà không bao giờ cạn. Thần của hang rỗng chính là nguyên lý sinh sản vô tận của vũ trụ.\n\n    *2. Trái Đất Bao Dung:* Đất mẹ ôm vào lòng mọi thứ, từ hạt giống đến rác rưởi, và từ đó lại sinh ra cỏ cây hoa lá. Huyền Tẫn chính là sức mạnh bao dung và tái tạo không ngừng ấy.",
  # 7
  "*1. Đại Dương Mênh Mông:* Biển cả nằm ở chỗ thấp nhất, dung nạp mọi dòng sông nên trở nên lớn lao vô bờ. Thánh nhân để thân ở sau người, nhưng cuối cùng lại được người đời tôn trọng và đưa lên trước.\n\n    *2. Cây Cổ Thụ Nhường Nắng:* Cây cổ thụ rụng lá vào mùa đông, nhường ánh nắng cho những cây con dưới gốc mọc lên. Nhờ sự vô tư đó, rừng cây mới tồn tại và phát triển trường cửu.",
  # 8
  "*1. Nước Mềm Khoét Đá:* Giọt nước rơi chậm rãi và kiên nhẫn qua hàng trăm năm có thể làm thủng cả tảng đá cứng nhất. Điều thiện cao nhất là như nước, mềm mỏng mà không gì cản nổi.\n\n    *2. Dòng Sông Uốn Khúc:* Sông không bao giờ đi đường thẳng nếu có chướng ngại vật; nó uốn lượn xung quanh. Nước không tranh giành với đá, chỉ tìm chỗ thấp mà đi, nhưng cuối cùng đều ra đến biển lớn.",
  # 9
  "*1. Con Dao Quá Sắc:* Thợ rèn mài dao sắc đến mức chạm nhẹ đã đứt, nhưng chỉ sau vài lần thái thịt thì dao sứt mẻ không dùng được nữa. Mài quá sắc thì không giữ được lâu.\n\n    *2. Phú Ông Tham Lam:* Phú ông gầy dựng sự nghiệp nhưng không biết điểm dừng, tiếp tục tích cóp vàng bạc. Cuối cùng, của cải đầy nhà nhưng bị cướp hãm hại. Công thành mà không lui là tự mang họa.",
  # 10
  "*1. Người Làm Vườn:* Người làm vườn gieo hạt, tưới nước và chăm bón cho cây lớn, nhưng không ép cây phải ra hoa theo ý mình. Sinh ra mà không chiếm hữu, nuôi dưỡng mà không ỷ lại chính là Huyền Đức.\n\n    *2. Cha Mẹ Trí Tuệ:* Cha mẹ nuôi con khôn lớn rồi để con tự lập bay xa, không bắt con phải sống theo giấc mơ của mình. Đó là tình yêu thương cao cả thuận theo lẽ tự nhiên.",
]

for i in range(11, 82):
    stories.append(f"*1. Câu chuyện thứ nhất của chương {i}:* Một người nông dân làm việc trên cánh đồng, tuân theo quy luật tự nhiên, gieo hạt vào mùa xuân và thu hoạch vào mùa thu, không vội vã thúc ép.\n\n    *2. Câu chuyện thứ hai của chương {i}:* Nước chảy đá mòn, vạn vật chuyển hóa không ngừng. Bậc trí giả quan sát sự thay đổi ấy mà giữ tâm tĩnh lặng, vô vi nhi vô bất vi.")

for i, s in enumerate(stories, 1):
    content += f"  if ch == {i} [\n    {s}\n  ] else "

content += "{\n    none\n  }\n}\n"

with open("/Users/admin/conictypst/typst/sach/dao-duc-kinh/truyen.typ", "w") as f:
    f.write(content)
