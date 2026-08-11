#import "@preview/sang-math:1.0.4": *
#let tn = tn.with(mode: "solcolor", opt-style: "circle")
#let ds = ds.with(mode: "solcolor")
#let tln = tln.with(mode: "solcolor")
#let tl = tl.with(mode: "solcolor")

#show box: it => {
  if it.has("stroke") and it.has("radius") and it.radius == 50% {
    if it.stroke == 0.7pt + black {
      let b = box(
        width: 1.3em,
        height: 1.3em,
        {
          show text.where(weight: "bold"): t => text(weight: "regular", size: 1em, fill: black)[*#t.text*]
          it.body
        }
      )
      [#b.]
    } else {
      [#it.]
    }
  } else {
    it
  }
}

#set page(
  paper: "a4",
  margin: (top: 2cm, bottom: 2cm, left: 3cm, right: 2cm),
)
#set text(
  font: "Times New Roman",
  size: 14pt,
)
#set par(
  justify: true,
  leading: 0.65em,
  first-line-indent: 1cm,
)

#grid(
  columns: (1fr, 1fr),
  align: (center, center), 
  [
    PHƯỜNG BÌNH TRỊ ĐÔNG \
    *TRƯỜNG THPT NGUYỄN HỮU CẢNH* \
    #v(-0.5em)
    -------------
  ],
  [
    *CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM* \
    *Độc lập - Tự do - Hạnh phúc* \
    #v(-0.5em)
    -------------
  ]
)

#v(1.5cm)

#align(center)[
  #text(weight: "bold", size: 16pt)[
    BÀI THU HOẠCH LỚP BỒI DƯỠNG, \
    TẬP HUẤN LÝ LUẬN CHÍNH TRỊ HÈ NĂM 2026
  ]
]

#v(1cm)

#pad(left: 1cm)[
  - *Đơn vị công tác:* Trường THPT Nguyễn Hữu Cảnh
  - *Họ và tên:* Nguyễn Văn Sang
  - *Ngày, tháng, năm sinh:* 27/01/1987
  - *Tổ chuyên môn:* Toán
  - *Chức vụ:* Giáo viên
]

#v(1cm)

#text(weight: "bold", size: 14pt)[I. PHẦN TRẮC NGHIỆM]

#set par(first-line-indent: 0pt)
#v(0.5em)

#tn(
  [Kế hoạch số 101-KH/TU về việc bồi dưỡng, tập huấn lý luận chính trị hè năm 2026 do cơ quan nào ban hành?],
  (
    [Ủy ban nhân dân Thành phố Hồ Chí Minh.],
    True([Ban Thường vụ Thành ủy Thành phố Hồ Chí Minh.]),
    [Sở Giáo dục và Đào tạo Thành phố Hồ Chí Minh.],
    [Ban Tuyên giáo và Dân vận Trung ương.]
  )
)

#tn(
  [Kế hoạch số 101-KH/TU được triển khai thực hiện căn cứ vào văn bản hướng dẫn nào của Trung ương?],
  (
    True([Hướng dẫn số 23-HD/BTGDVTW ngày 05/6/2026.]),
    [Hướng dẫn số 19-HD/BTGDVTW ngày 08/4/2026.],
    [Hướng dẫn số 57-HD/BTGDVTW ngày 22/12/2024.],
    [Hướng dẫn số 71-HD/BTGDVTW ngày 22/8/2025.]
  )
)

#tn(
  [Theo Kế hoạch số 101-KH/TU, thời gian bồi dưỡng, tập huấn lý luận chính trị hè năm 2026 cho đội ngũ giảng viên, giáo viên diễn ra trong khoảng thời gian nào?],
  (
    [Từ 01 - 02 ngày.],
    True([Từ 03 - 04 ngày.]),
    [Từ 05 - 07 ngày.],
    [Đúng 01 tuần.]
  )
)

#tn(
  [Đối tượng nào sau đây KHÔNG thuộc diện tham gia bồi dưỡng, tập huấn lý luận chính trị hè năm 2026 theo Kế hoạch 101-KH/TU?],
  (
    [Giáo viên các trường phổ thông và trung tâm giáo dục thường xuyên - giáo dục nghề nghiệp.],
    [Giảng viên 05 môn lý luận chính trị tại các cơ sở giáo dục đại học.],
    [Giáo viên môn giáo dục chính trị và cán bộ làm công tác học sinh, sinh viên các cơ sở giáo dục cao đẳng, trung cấp nghề.],
    True([Toàn thể học sinh, sinh viên năm thứ hai trở đi.])
  )
)

#tn(
  [Nghị quyết số 57-NQ/TW ngày 22/12/2024 của Bộ Chính trị (một trong 10 nghị quyết trụ cột) tập trung vào nội dung gì?],
  (
    True([Đột phá phát triển khoa học, công nghệ, đổi mới sáng tạo và chuyển đổi số quốc gia.]),
    [Đổi mới công tác xây dựng và thi hành pháp luật.],
    [Phát triển kinh tế tư nhân.],
    [Phát triển văn hóa Việt Nam.]
  )
)

#tn(
  [Nghị quyết số 71-NQ/TW ngày 22/08/2025 của Bộ Chính trị quán triệt trong đợt tập huấn hè đề cập đến lĩnh vực trọng tâm nào?],
  (
    [Đảm bảo an ninh năng lượng quốc gia.],
    True([Đột phá phát triển giáo dục và đào tạo.]),
    [Phát triển kinh tế Nhà nước.],
    [Hội nhập quốc tế trong tình hình mới.]
  )
)

#tn(
  [Ngày 08/04/2026, Ban Chấp hành Trung ương đã ban hành văn bản nào về công tác chính trị trong Đảng?],
  (
    True([Quy định số 19-QĐ/TW.]),
    [Nghị quyết số 09-NQ/TW.],
    [Nghị quyết số 80-NQ/TW.],
    [Quyết định số 68-QĐ/TW.]
  )
)

#tn(
  [Hoạt động sinh hoạt chính trị đầu khóa cho học sinh, sinh viên năm học 2026 - 2027 được quy định tổ chức vào thời gian nào?],
  (
    [Tháng cuối cùng của năm học trước.],
    True([Trong tuần đầu của năm học thứ nhất.]),
    [Giữa học kỳ I của năm học.],
    [Vào dịp tổng kết năm học.]
  )
)

#tn(
  [Nghị quyết số 09-NQ/TW ngày 19/05/2026 của Bộ Chính trị gắn liền với định hướng phát triển của địa phương nào?],
  (
    [Thủ đô Hà Nội.],
    [Thành phố Đà Nẵng.],
    True([Thành phố Hồ Chí Minh.]),
    [Thành phố Cần Thơ.]
  )
)

#tn(
  [Nghị quyết số 80-NQ/TW ngày 07/01/2026 của Bộ Chính trị tập trung vào nội dung cốt lõi nào?],
  (
    [Phát triển kinh tế tư nhân.],
    [Bảo đảm an ninh năng lượng quốc gia.],
    True([Phát triển văn hóa Việt Nam.]),
    [Đổi mới công tác xây dựng và thi hành pháp luật.]
  )
)

#v(1em)
#print-answer-key()

#v(1em)
#pagebreak()
#text(weight: "bold", size: 14pt)[II. PHẦN TỰ LUẬN]

#set par(first-line-indent: 1cm)

Qua các chuyên đề học tập và nghiên cứu tại lớp bồi dưỡng, tập huấn lý luận chính trị hè năm 2026, nội dung tôi tâm đắc nhất là tinh thần đổi mới mạnh mẽ trong *Nghị quyết số 71-NQ/TW ngày 22/08/2025 của Bộ Chính trị về đột phá phát triển giáo dục và đào tạo*, gắn liền với *Nghị quyết số 57-NQ/TW ngày 22/12/2024 về phát triển khoa học, công nghệ, đổi mới sáng tạo và chuyển đổi số quốc gia*.

Hai nghị quyết trên không chỉ khẳng định vai trò then chốt của giáo dục trong tiến trình hiện đại hóa đất nước mà còn đặt ra yêu cầu cấp thiết về việc chuyển đổi số toàn diện. Trong bối cảnh công nghệ thông tin và trí tuệ nhân tạo (AI) đang thay đổi mọi mặt của đời sống, giáo dục không thể đứng ngoài cuộc. Định hướng đổi mới không chỉ giới hạn ở việc thay đổi nội dung sách giáo khoa mà cốt lõi là thay đổi phương pháp truyền đạt, đánh giá, biến công nghệ thành đòn bẩy để phát triển tối đa phẩm chất, năng lực của học sinh. Là một giáo viên bộ môn Toán tại Trường THPT Nguyễn Hữu Cảnh, tôi nhận thức rõ trách nhiệm của mình trong việc áp dụng những tinh thần này vào thực tiễn bài giảng, giúp các em học sinh làm chủ kiến thức, tư duy logic và kỹ năng giải quyết vấn đề bằng các công cụ hiện đại.

Từ những kiến thức thu nhận được và thực tiễn giảng dạy, nhằm nâng cao chất lượng giáo dục toàn diện và đổi mới phương pháp dạy học cho năm học 2026 - 2027, tôi xin đề xuất một số giải pháp sau:

*Thứ nhất, tiên phong ứng dụng công nghệ số và AI vào thiết kế học liệu.*
Nhà trường và các tổ chuyên môn cần đẩy mạnh việc sử dụng các công cụ công nghệ mới trong giảng dạy. Điển hình như việc ứng dụng Typst và các nền tảng AI để số hóa bài giảng, tạo ra hệ thống ngân hàng câu hỏi, đề thi trắc nghiệm trực quan, sinh động. Việc này không chỉ giúp giáo viên giảm bớt thời gian hành chính, nâng cao chất lượng tài liệu mà còn giúp cá nhân hóa lộ trình học tập, kích thích sự hứng thú và khả năng tự học của học sinh.

*Thứ hai, đổi mới phương pháp kiểm tra, đánh giá theo hướng phát triển năng lực.*
Thay vì đánh giá năng lực học sinh qua những bài thi nặng về tính toán máy móc, cần lồng ghép các bài toán thực tiễn, yêu cầu học sinh ứng dụng kiến thức Toán học để xử lý dữ liệu và giải quyết vấn đề thực tế. Cần kết hợp giữa đánh giá quá trình và đánh giá tổng kết, đảm bảo đo lường được sự tiến bộ toàn diện của các em.

*Thứ ba, tăng cường bồi dưỡng năng lực số cho đội ngũ giáo viên.*
Đề xuất nhà trường và các cấp quản lý thường xuyên tổ chức các buổi sinh hoạt chuyên đề, tập huấn kỹ năng chuyển đổi số, kỹ năng sử dụng công cụ AI tạo sinh an toàn và hiệu quả cho giáo viên. Chỉ khi giáo viên làm chủ được công nghệ, việc ứng dụng vào giảng dạy mới thực sự đi vào chiều sâu và mang lại hiệu quả thực chất.

*Thứ tư, đẩy mạnh phối hợp giữa Gia đình - Nhà trường.*
Sử dụng hiệu quả các nền tảng giao tiếp điện tử để kịp thời trao đổi thông tin với phụ huynh, đồng hành cùng gia đình trong việc giáo dục đạo đức, tư tưởng chính trị và định hướng nghề nghiệp tương lai cho học sinh.

Năm học 2026 - 2027 đặt ra nhiều yêu cầu mới nhưng cũng là cơ hội để bứt phá. Với vai trò là một giáo viên, tôi sẽ luôn không ngừng tự học tập, rèn luyện, ứng dụng công nghệ để nâng cao chất lượng giảng dạy, góp phần vào sự nghiệp đổi mới giáo dục của nhà trường và thành phố.

#v(1cm)
#grid(
  columns: (1fr, 1.3fr),
  [],
  [
    #align(center)[
      _Bình Trị Đông, ngày 10 tháng 08 năm 2026_ \
      *Người viết thu hoạch* \
      #v(2.5cm) \
      *Nguyễn Văn Sang*
    ]
  ]
)
