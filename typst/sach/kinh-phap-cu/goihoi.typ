// ═══════════════════════════════════════════════════════════
// CÂU HỎI GỢI ĐÀM THOẠI — Kinh Pháp Cú
// Mỗi phẩm 1–2 câu để giáo viên kéo ý tưởng vào trao đổi với học sinh
// ═══════════════════════════════════════════════════════════

#let _pc-goihoi-notes = (
  [
    - Trước một bài khó, điều gì trong đầu em dễ kéo em xuống nhất: sợ sai, nóng vội hay bỏ cuộc sớm?
    - Nếu đổi tâm thế trước khi làm bài, em sẽ bắt đầu khác đi ở bước nào?
  ],
  [
    - Em hay mất điểm vì thiếu kiến thức hay vì sơ suất nhỏ?
    - Nếu chỉ giữ một thói quen tự kiểm trước khi nộp bài, em chọn thói quen nào?
  ],
  [
    - Khi đang làm Toán mà đầu óc nhảy sang chuyện khác, em thường kéo mình trở lại bằng cách nào?
    - Bước đầu nào giúp em tập trung hơn: đọc đề chậm, gạch dữ kiện hay viết hướng làm?
  ],
  [
    - Một lời giải đẹp theo em đẹp ở chỗ nào: ngắn, đúng hay làm sáng ý?
    - Khi học nhiều thứ cùng lúc, làm sao để giữ cái lõi thay vì chỉ nhặt bề mặt?
  ],
  [
    - Có khi nào em tưởng mình hiểu vì nhìn lời giải thấy quen, nhưng tự làm lại không được?
    - Em muốn lớp học phản ứng thế nào khi ai đó dám nói "em chưa hiểu"?
  ],
  [
    - Một người bạn học tốt giúp em tiến bộ ở chỗ nào nhất?
    - Khi được góp ý, điều gì làm em dễ nghe hơn: lời nói nhẹ hay chỉ ra đúng chỗ sai?
  ],
  [
    - Nếu bớt được một nỗi sợ trong giờ Toán, em muốn bớt điều gì nhất?
    - Theo em, học tốt hơn bắt đầu từ thêm thật nhiều hay bớt vài điều làm mình rối?
  ],
  [
    - Một bài thật hiểu khác gì với mười bài chép theo mẫu?
    - Trong một buổi học, đâu là lúc em thấy mình hiểu ra thật sự?
  ],
  [
    - Lỗi nhỏ nào em hay lặp lại nhất khi làm Toán?
    - Em nghĩ sửa một lỗi quen cần nhắc bằng trí nhớ hay cần thay đổi thói quen viết và soát?
  ],
  [
    - Khi bị gọi lên bảng sai, điều gì làm em sợ nhất?
    - Theo em, thầy cô và bạn bè nên góp ý thế nào để người sai vẫn còn muốn học tiếp?
  ],
  [
    - Có phần kiến thức nào em từng hiểu rồi nhưng để lâu lại quên mất?
    - Nếu ôn đều mỗi ngày 5 phút, em muốn cứu phần nào trước?
  ],
  [
    - Trong việc học Toán, chỗ nào em tự làm được và chỗ nào em còn lệ thuộc quá nhiều vào lời giải mẫu?
    - Một dấu hiệu nào cho thấy em đang tự học tốt hơn trước?
  ],
  [
    - Có khi nào một lời giải trông rất mượt nhưng em chưa thật hiểu nó?
    - Làm sao phân biệt "em thấy quen" với "em thật sự nắm được"?
  ],
  [
    - Theo em, bình tĩnh trước lỗi sai khó hơn hay nghĩ ra cách giải khó hơn?
    - Nếu gặp một lời chê không dễ nghe, em muốn xử lý nó thế nào để vẫn học được gì đó?
  ],
  [
    - Một tiết Toán khiến em thấy dễ thở thường có điều gì?
    - Khi gặp bài khó, làm sao để không hoảng trước khi kịp nghĩ?
  ],
  [
    - Em có đang bám quá chặt vào một kiểu giải quen tay nào không?
    - Khi đổi sang một cách làm mới, điều gì khiến em ngại nhất?
  ],
  [
    - Lúc làm mãi không ra, em phản ứng thế nào với chính mình?
    - Theo em, nói gì với bản thân để không biến bực bội thành bỏ cuộc?
  ],
  [
    - Thói quen trình bày nào của em cần gọt bớt trước tiên?
    - Nếu mỗi tuần chỉ sửa một nếp xấu trong vở, em chọn nếp nào?
  ],
  [
    - Một bài làm "có vẻ đúng" khác gì với một bài làm "thật sự chặt"?
    - Theo em, tiêu chí công bằng nhất khi chấm tự luận là gì?
  ],
  [
    - Khi nhìn một lời giải mẫu, em có thấy được các chỗ rẽ của con đường không?
    - Bước nào trong lời giải em thường làm theo mà chưa hiểu vì sao?
  ],
  [
    - Thói quen nhỏ nào giúp em học Toán ổn hơn mỗi ngày?
    - Nếu chỉ giữ lại ba routine trong giờ Toán, em muốn giữ ba điều gì?
  ],
  [
    - Học tủ hay chép mẫu giúp qua trước mắt nhưng để lại hậu quả gì lâu dài?
    - Theo em, làm sao để một lần làm sai trở thành một lần học thật chứ không chỉ bị trừ điểm?
  ],
  [
    - Khi bài khó kéo dài, em thường bỏ cuộc ở phút nào?
    - Điều gì giúp em "đứng vững" thêm một chút thay vì buông luôn?
  ],
  [
    - Em có từng gom quá nhiều công thức khiến càng học càng rối không?
    - Làm sao nhận ra cái gì là gốc, cái gì chỉ là cành lá?
  ],
  [
    - Nếu phải làm nhẹ việc học Toán của mình, em sẽ bỏ bớt điều gì?
    - Điều gì trong cách học hiện tại đang làm em nặng mà không giúp em hiểu hơn?
  ],
  [
    - Theo em, một học sinh tiến bộ thật được nhận ra bằng dấu hiệu nào?
    - Nếu không nhìn vào nhãn "giỏi" hay "yếu", em muốn được thầy cô nhìn mình qua điều gì?
  ],
)

#let pc-goihoi-note-for(number) = {
  if number >= 1 and number <= _pc-goihoi-notes.len() {
    _pc-goihoi-notes.at(number - 1)
  } else {
    none
  }
}
