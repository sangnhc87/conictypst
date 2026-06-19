// ═══════════════════════════════════════════════════════════
// CÂU HỎI GỢI ĐÀM THOẠI — Luận Ngữ
// Mỗi thiên 1–2 câu để giáo viên kéo ý tưởng vào trao đổi với học sinh
// ═══════════════════════════════════════════════════════════

#let _ln-goihoi-notes = (
  [
    - Em thấy niềm vui trong việc học đến từ lúc nào: lúc hiểu ra, lúc nhớ được, hay lúc làm xong?
    - Nếu ôn tập không chỉ để thi, theo em nó còn giúp mình ở chỗ nào?
  ],
  [
    - Một người dẫn dắt khiến em muốn đi theo thường có phẩm chất gì?
    - Trong lớp học, điều gì làm nên uy tín thật của thầy cô hoặc lớp trưởng?
  ],
  [
    - Quy tắc nào trong lớp là cần thật, và quy tắc nào chỉ đang làm mọi người mệt?
    - Làm sao để giữ nề nếp mà không biến lớp học thành chỗ chỉ lo hình thức?
  ],
  [
    - Trong việc học, em thường bị kéo bởi điều lợi trước mắt nào?
    - Theo em, một lớp học "có nhân" sẽ khác lớp học chỉ chạy điểm ở điểm nào?
  ],
  [
    - Có khi nào em bị đánh giá quá sớm chỉ vì một biểu hiện bề ngoài không?
    - Nếu muốn hiểu một người bạn học thật hơn, em nên nhìn vào điều gì ngoài lời nói?
  ],
  [
    - Em đang học Toán ở mức biết, thích hay vui?
    - Điều gì có thể kéo em từ chỗ "học cho xong" sang chỗ thấy thật sự thú vị?
  ],
  [
    - Em đã từng học được điều quan trọng từ một bạn cùng lớp chưa?
    - Làm sao để vừa học từ người khác vừa không thấy mình bị thấp đi?
  ],
  [
    - Có lúc nào một câu nói của người khác làm em mất chí học không?
    - Theo em, làm sao giữ được quyết tâm khi kết quả chưa tốt ngay?
  ],
  [
    - Khi gặp bài khó, em thường bỏ ở bước nào?
    - Điều gì cho thấy một người bền thật chứ không chỉ cố gồng?
  ],
  [
    - Em nghĩ nết học lộ ra nhiều nhất ở việc lớn hay việc nhỏ hằng ngày?
    - Một thay đổi rất nhỏ nào trong sinh hoạt lớp có thể làm việc học tốt lên?
  ],
  [
    - Em thích được dạy cùng một nhịp với cả lớp hay có đường đi riêng vừa sức hơn?
    - Khi nhìn bạn học khác mình, em thấy đó là bất công hay là khác nhu cầu?
  ],
  [
    - Điều gì trong lớp học khiến em phải "thắng mình" nhiều nhất?
    - Theo em, một nguyên tắc tốt là nguyên tắc làm mình sợ hay nguyên tắc giúp mình đứng thẳng?
  ],
  [
    - Có từ ngữ Toán nào em dùng quen mà chưa thật hiểu rõ nghĩa không?
    - Vì sao gọi đúng tên vấn đề lại quan trọng với việc giải đúng?
  ],
  [
    - Em đang học vì muốn hiểu thật hay vì muốn người khác nhìn mình là giỏi?
    - Một dấu hiệu nào cho thấy lời nói của mình đang chạy trước việc làm?
  ],
  [
    - Điều gì em không muốn nhận từ bạn bè trong lớp?
    - Nếu đổi chỗ cho bạn, em muốn mình được góp ý theo cách nào?
  ],
  [
    - Một lớp học bất ổn thường bắt đầu từ chuyện rất nhỏ nào?
    - Theo em, công bằng trong lớp có nghĩa là gì?
  ],
  [
    - Thói quen học nào đang kéo em đi lên, và thói quen nào đang kéo em xuống?
    - Nếu chỉ sửa đúng một nếp học trong tháng này, em sẽ sửa gì?
  ],
  [
    - Có khi nào giữ cái đúng làm em thấy mình thiệt hơn trước mắt không?
    - Theo em, vì sao người ta dễ đi lệch khi ai xung quanh cũng đang đi lệch?
  ],
  [
    - Em học rộng nhưng đã làm điều gì thật sự thành của mình chưa?
    - Sửa một lỗi cũ khó hơn học một mẹo mới ở chỗ nào?
  ],
  [
    - Một người có trách nhiệm mà không kiêu sẽ cư xử khác ra sao?
    - Nếu được giao việc chung của lớp, em nghĩ điều khó nhất là gì?
  ],
)

#let ln-goihoi-note-for(number) = {
  if number >= 1 and number <= _ln-goihoi-notes.len() {
    _ln-goihoi-notes.at(number - 1)
  } else {
    none
  }
}
