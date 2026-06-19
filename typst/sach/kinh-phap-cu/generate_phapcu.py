import sys

content = """#let pc-phapcu-note-for(ch) = {
"""

stories = [
  # 1. Phẩm Song Yếu
  "  *Pháp Cú 1:* Ý dẫn đầu các pháp,\n  Ý làm chủ, ý tạo;\n  Nếu với ý ô nhiễm,\n  Nói lên hay hành động,\n  Khổ não bước theo sau,\n  Như xe, chân vật kéo.\n\n  *Pháp Cú 5:* Hận thù diệt hận thù,\n  Đời này không có được.\n  Từ bi diệt hận thù,\n  Là định luật ngàn thu.",
  # 2. Phẩm Không Phóng Dật
  "  *Pháp Cú 21:* Không phóng dật, đường sống,\n  Phóng dật là đường chết.\n  Không phóng dật, không chết,\n  Phóng dật như chết rồi.\n\n  *Pháp Cú 24:* Người nỗ lực, chánh niệm,\n  Làm sạch, ở cẩn thận,\n  Tự chế, sống đúng pháp,\n  Danh xưng luôn tăng trưởng.",
  # 3. Phẩm Tâm
  "  *Pháp Cú 33:* Tâm hoảng hốt, dao động,\n  Khó hộ trì, khó nhiếp,\n  Người trí làm tâm thẳng,\n  Như thợ tên nắn tên.\n\n  *Pháp Cú 42:* Kẻ thù hại kẻ thù,\n  Oan gia hại oan gia,\n  Không bằng tâm hướng ác,\n  Gây ác quả cho mình.",
  # 4. Phẩm Hoa
  "  *Pháp Cú 50:* Không nên nhìn lỗi người,\n  Người làm hay không làm;\n  Nên nhìn tự chính mình,\n  Có làm hay không làm.\n\n  *Pháp Cú 54:* Hương các loại hoa thơm,\n  Không ngược bay chiều gió,\n  Hương người đức hạnh tốt,\n  Ngược gió bay muôn phương.",
  # 5. Phẩm Ngu
  "  *Pháp Cú 61:* Đường dài cho kẻ mệt,\n  Đêm dài cho kẻ thức,\n  Luân hồi dài, kẻ ngu,\n  Không biết chân diệu pháp.\n\n  *Pháp Cú 62:* \"Con tôi, tài sản tôi\",\n  Kẻ ngu ôm sầu não.\n  Tự mình không của mình,\n  Con đâu, tài sản đâu?",
  # 6. Phẩm Hiền Trí
  "  *Pháp Cú 76:* Nếu thấy bậc Hiền trí,\n  Chỉ lỗi và khiển trách,\n  Như chỉ chỗ chôn vàng,\n  Hãy kết hợp người trí!\n\n  *Pháp Cú 80:* Người tưới nước dẫn nước,\n  Kẻ làm tên nắn tên,\n  Người thợ mộc uốn gỗ,\n  Bậc hiền trí nhiếp tâm.",
  # 7. Phẩm A-La-Hán
  "  *Pháp Cú 90:* Trình độ đã vượt qua,\n  Hành trình đã kết thúc,\n  Mọi hệ lụy xả bỏ,\n  Khổ não không còn nữa.\n\n  *Pháp Cú 98:* Làng mạc hay rừng núi,\n  Thung lũng hay đồi cao,\n  La-hán trú chỗ nào,\n  Đất ấy thật khả ái.",
  # 8. Phẩm Ngàn
  "  *Pháp Cú 100:* Tốt hơn một tiếng có nghĩa,\n  Làm cho người nghe an tịnh;\n  Hơn ngàn tiếng vô nghĩa,\n  Chỉ gây thêm phiền toái.\n\n  *Pháp Cú 103:* Tự chiến thắng chính mình,\n  Hơn ngàn vạn lần chiến thắng;\n  Chiến thắng bản thân mình,\n  Là chiến công oanh liệt nhất.",
  # 9. Phẩm Ác
  "  *Pháp Cú 116:* Hãy gấp làm điều thiện,\n  Ngăn tâm làm điều ác.\n  Ai chậm làm việc lành,\n  Tâm ưa thích việc ác.\n\n  *Pháp Cú 121:* Chớ khinh thường điều ác,\n  Cho rằng \"chưa đến mình\",\n  Như bình nước nhỏ giọt,\n  Lâu ngày cũng đầy tràn.",
  # 10. Phẩm Hình Phạt
  "  *Pháp Cú 129:* Ai cũng sợ gươm đao,\n  Ai cũng sợ sự chết.\n  Suy ta ra lòng người,\n  Chớ giết, chớ bảo giết.\n\n  *Pháp Cú 133:* Chớ nói lời thô ác,\n  Người nghe sẽ trả lời.\n  Khổ thay lời phẫn nộ,\n  Gươm trượng sẽ chạm nhau.",
  # 11. Phẩm Già
  "  *Pháp Cú 146:* Cười gì, hân hoan gì,\n  Khi đời cứ cháy mòn?\n  Bị tối tăm bao bọc,\n  Sao không tìm ngọn đèn?\n\n  *Pháp Cú 152:* Người ít nghe ít học,\n  Lớn lên như trâu con,\n  Thịt nó tuy lớn lên,\n  Trí tuệ không tăng trưởng.",
  # 12. Phẩm Tự Ngã
  "  *Pháp Cú 159:* Nếu tự mình làm được,\n  Điều mình dạy người khác,\n  Tự nhiếp, mới nhiếp người,\n  Tự nhiếp thật là khó.\n\n  *Pháp Cú 160:* Tự mình làm chỗ nương,\n  Ai khác làm chỗ nương?\n  Tự mình khéo điều phục,\n  Được chỗ nương khó được.",
  # 13. Phẩm Thế Gian
  "  *Pháp Cú 167:* Chớ theo pháp hạ liệt,\n  Chớ sống với buông lung,\n  Chớ theo tà kiến vọng,\n  Chớ tăng trưởng thế gian.\n\n  *Pháp Cú 170:* Hãy nhìn như bọt nước,\n  Hãy nhìn như cảnh huyễn,\n  Quán nhìn thế gian vậy,\n  Thần chết không thấy hình.",
  # 14. Phẩm Phật
  "  *Pháp Cú 183:* Không làm mọi điều ác,\n  Thành tựu các hạnh lành,\n  Tâm ý giữ trong sạch,\n  Chính lời chư Phật dạy.\n\n  *Pháp Cú 188:* Loài người sợ hiểm nguy,\n  Đi tìm nhiều chỗ trú,\n  Vào rừng hay đền tháp,\n  Cội cây hay núi non...",
  # 15. Phẩm An Lạc
  "  *Pháp Cú 197:* Vui thay, chúng ta sống,\n  Không hận, giữa hận thù;\n  Giữa những người ân oán,\n  Ta sống không hận thù.\n\n  *Pháp Cú 204:* Vô bệnh, lợi tối thượng,\n  Bằng lòng, giàu tối thượng,\n  Thành tín, bạn tối thượng,\n  Niết-bàn, lạc tối thượng.",
  # 16. Phẩm Hỷ Ái
  "  *Pháp Cú 211:* Chớ dính dấp vật gì,\n  Với ác hay với thiện.\n  Không thấy vật mình thích,\n  Và thấy vật không thích,\n  Cả hai đều sinh khổ.\n\n  *Pháp Cú 212:* Từ hỷ ái sinh sầu,\n  Từ hỷ ái sinh sợ.\n  Ai giải thoát hỷ ái,\n  Không sầu, đâu có sợ?",
  # 17. Phẩm Phẫn Nộ
  "  *Pháp Cú 223:* Lấy không giận thắng giận,\n  Lấy thiện thắng bất thiện.\n  Lấy thí thắng xan tham,\n  Lấy chân thắng hư ngụy.\n\n  *Pháp Cú 227:* Xưa vậy, nay cũng vậy:\n  Ngồi im bị người chê,\n  Nói nhiều bị người chê,\n  Nói vừa bị người chê.\n  Làm người, ai không bị chê?",
  # 18. Phẩm Cấu Uế
  "  *Pháp Cú 235:* Giờ đây ngươi như lá úa,\n  Sứ giả Thần chết kề cận,\n  Ngươi đang đứng ở cửa tử,\n  Hành trang ngươi chưa có gì!\n\n  *Pháp Cú 239:* Bậc trí theo từng bậc,\n  Từng lúc, từng sát-na,\n  Trừ cấu uế của mình,\n  Như thợ vàng rèn bạc.",
  # 19. Phẩm Pháp Trụ
  "  *Pháp Cú 256:* Người xử sự gấp gáp,\n  Không phải người Pháp trụ.\n  Bậc trí suy xét kỹ,\n  Cả hai, chánh và tà.\n\n  *Pháp Cú 268:* Không phải do im lặng,\n  Trở thành bậc ẩn sĩ;\n  Người cầm cân tội phước,\n  Nắm giữ điều tốt lành.",
  # 20. Phẩm Đạo
  "  *Pháp Cú 273:* Trong các đường, Bát chánh,\n  Trong các sự, Tứ đế,\n  Trong các pháp, Vô tham,\n  Trong các loài, Chánh giác.\n\n  *Pháp Cú 277:* \"Tất cả hành vô thường\",\n  Với tuệ quán thấy vậy,\n  Nhàm chán đối với khổ,\n  Đó là đường thanh tịnh.",
  # 21. Phẩm Tạp Loại
  "  *Pháp Cú 290:* Nếu từ bỏ chút vui,\n  Nhìn thấy được vui lớn,\n  Bậc trí xả vui nhỏ,\n  Để hướng đến vui lớn.\n\n  *Pháp Cú 292:* Việc đáng làm không làm,\n  Việc không đáng lại làm,\n  Người ngạo mạn phóng dật,\n  Lậu hoặc ngày càng tăng.",
  # 22. Phẩm Địa Ngục
  "  *Pháp Cú 306:* Người nói láo đọa địa ngục,\n  Người làm nói không làm.\n  Cả hai, sau khi chết,\n  Đều chịu khổ như nhau.\n\n  *Pháp Cú 313:* Nếu có việc đáng làm,\n  Hãy làm với hết lòng.\n  Kẻ tu hành lỏng lẻo,\n  Chỉ khuấy thêm bụi đời.",
  # 23. Phẩm Voi
  "  *Pháp Cú 320:* Như voi giữa trận mạc,\n  Chịu đựng cung tên bắn,\n  Ta chịu đựng phỉ báng,\n  Giữa những người ác tâm.\n\n  *Pháp Cú 328:* Nếu tìm được bạn hiền,\n  Đồng hành, khéo trú trí,\n  Hãy vượt mọi hiểm nguy,\n  Đi cùng tâm hoan hỷ.",
  # 24. Phẩm Tham Ái
  "  *Pháp Cú 334:* Của người sống buông lung,\n  Ái dục tăng như sừng.\n  Người ấy chạy đây đó,\n  Như vượn tìm trái cây.\n\n  *Pháp Cú 348:* Buông quá khứ, buông tương lai,\n  Buông luôn cả hiện tại,\n  Đến bờ kia cuộc đời,\n  Ý giải thoát mọi phần.",
  # 25. Phẩm Tỷ Kheo
  "  *Pháp Cú 360:* Khéo thay phòng hộ mắt,\n  Khéo thay phòng hộ tai.\n  Khéo thay phòng hộ mũi,\n  Khéo thay phòng hộ lưỡi.\n\n  *Pháp Cú 365:* Chớ khinh điều mình được,\n  Chớ ganh điều người được.\n  Tỷ kheo ganh tỵ người,\n  Không thể đạt định tâm.",
  # 26. Phẩm Bà La Môn
  "  *Pháp Cú 383:* Hãy tinh tấn dứt dòng,\n  Từ bỏ mọi dục lạc.\n  Biết các hành diệt tận,\n  Ngươi sẽ biết Vô vi.\n\n  *Pháp Cú 391:* Ai ý, thân, và khẩu,\n  Không làm việc ác sai,\n  Ba nghiệp được phòng hộ,\n  Ta gọi Bà-la-môn.",
]

for i, s in enumerate(stories, 1):
    content += f"  if ch == {i} [\n{s}\n  ] else "

content += "{\n    none\n  }\n}\n"

with open("/Users/admin/conictypst/typst/sach/kinh-phap-cu/phapcu.typ", "w") as f:
    f.write(content)
