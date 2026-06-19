// ═══════════════════════════════════════════════════════════════
// CHƯƠNG 1 — TRÍ TUỆ LÀ GÌ?
// ═══════════════════════════════════════════════════════════════
#import "_config.typ": *

#chapter(
  [Trí Tuệ Là Gì? — Định Nghĩa Và Muôn Hình Vẻ],
  theme-color: c-book,
)

#lythuyet[
  Trước khi truy vấn *nguồn gốc* của trí tuệ, chúng ta cần thống nhất về
  điều mình đang nói đến. Trí tuệ (_intelligence_) là một trong những khái
  niệm bị định nghĩa nhiều nhất, và cũng bị hiểu sai nhiều nhất trong lịch
  sử tư tưởng loài người.
]

#lesson([Bài toán định nghĩa], theme-color: c-book)

#khainiemboc(title: [📖 Định nghĩa tổng quát của Trí tuệ], accent: c-book)[
  Trí tuệ là *khả năng thu nhận và vận dụng kiến thức và kỹ năng* để
  thích ứng với môi trường, giải quyết vấn đề, và đạt được mục tiêu.
  Đây là định nghĩa rộng nhất, được hầu hết các nhà khoa học thần kinh và
  tâm lý học đồng thuận.
]

Nhưng nếu chỉ dừng ở đây, ta sẽ ngay lập tức gặp phải một rừng câu hỏi:

#caudoi(title: [? Những câu hỏi nền tảng], accent: c-philo)[
  - Một con kiến tìm đường về tổ — đó có phải là trí tuệ không?
  - Một máy tính giải phương trình vi phân trong một phần nghìn giây — có thông minh hơn con người?
  - Một đứa trẻ 3 tuổi học ngôn ngữ mà không cần ai dạy cú pháp — cơ chế nào đứng sau điều đó?
  - Một nhà thơ sáng tác một bài thơ khiến người đọc khóc — liệu đó là loại trí tuệ nào?
]

#section([Các lý thuyết đa trí tuệ], theme-color: c-book)

Một trong những bước ngoặt quan trọng trong nghiên cứu trí tuệ là phát
hiện rằng *trí tuệ không phải là một năng lực duy nhất*, mà là một tập
hợp các khả năng khác nhau.

#nghiencuu(title: [🔬 Lý thuyết Đa trí tuệ — Howard Gardner (1983)], accent: c-neuro)[
  Nhà tâm lý học Howard Gardner tại Đại học Harvard đề xuất rằng có ít
  nhất *8 loại trí tuệ* độc lập:

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 14pt,
    row-gutter: 8pt,
    [*1. Ngôn ngữ - Ngữ văn*\ Khả năng dùng ngôn ngữ hiệu quả (nhà văn, nhà thơ, luật sư)],
    [*2. Logic - Toán học*\ Tư duy logic, lập luận suy diễn (nhà khoa học, lập trình viên)],
    [*3. Không gian - Thị giác*\ Nhận thức không gian, hình ảnh (kiến trúc sư, họa sĩ)],
    [*4. Âm nhạc - Nhịp điệu*\ Cảm thụ và tạo ra âm nhạc (nhạc sĩ, ca sĩ)],
    [*5. Thân thể - Vận động*\ Kiểm soát cơ thể tinh tế (vận động viên, vũ công)],
    [*6. Tương tác - Xã hội*\ Hiểu và tương tác với người khác (nhà ngoại giao, giáo viên)],
    [*7. Nội tâm*\ Hiểu bản thân, cảm xúc, động lực (nhà tâm lý, triết gia)],
    [*8. Thiên nhiên*\ Nhận biết và phân loại các mẫu trong tự nhiên (nhà sinh thái học)],
  )
]

#luuy(title: [▲ Tranh cãi học thuật], accent: rgb("#b45309"))[
  Lý thuyết của Gardner được phổ biến rộng rãi nhưng cũng chịu nhiều chỉ
  trích từ cộng đồng tâm lý học. Nhiều nhà nghiên cứu cho rằng các "trí
  tuệ" này thực ra là *tài năng hay kỹ năng*, không phải trí tuệ theo nghĩa
  khoa học. Tranh luận này vẫn chưa kết thúc.
]

#section([Trí tuệ thể lỏng và trí tuệ kết tinh], theme-color: c-book)

#nghiencuu(title: [🔬 Mô hình Gf-Gc — Raymond Cattell (1971)], accent: c-neuro)[
  Nhà tâm lý học Raymond Cattell phân biệt hai loại trí tuệ cơ bản:

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 16pt,
    block(
      fill: c-ai.lighten(93%),
      stroke: 0.6pt + c-ai,
      radius: 6pt,
      inset: 12pt,
    )[
      *Trí tuệ thể lỏng (Fluid Intelligence - Gf)*\
      Khả năng suy luận trong các tình huống hoàn toàn mới, độc lập với
      kinh nghiệm tích lũy. Đạt đỉnh ở tuổi ~25 rồi giảm dần.
      
      _Ví dụ:_ Giải câu đố lạ, học kỹ năng mới, nhận ra mẫu trừu tượng.
    ],
    block(
      fill: c-evo.lighten(93%),
      stroke: 0.6pt + c-evo,
      radius: 6pt,
      inset: 12pt,
    )[
      *Trí tuệ kết tinh (Crystallized Intelligence - Gc)*\
      Kiến thức và kỹ năng tích lũy từ kinh nghiệm và học tập. Tiếp tục
      tăng theo tuổi tác, đôi khi đến tận tuổi già.
      
      _Ví dụ:_ Vốn từ ngữ, kiến thức chuyên môn, kỹ năng nghề nghiệp.
    ],
  )
]

#lesson([Trí tuệ cảm xúc — Chiều kích bị bỏ quên], theme-color: c-brain)

#trichdan(
  author: [Daniel Goleman],
  source: [Emotional Intelligence, 1995],
)[
  "IQ mang bạn đến được công việc; EQ mang bạn lên đến đỉnh cao."
]

#khainiemboc(title: [📖 Trí tuệ cảm xúc (EQ)], accent: c-brain)[
  Trí tuệ cảm xúc là *khả năng nhận biết, hiểu, quản lý cảm xúc của bản
  thân và người khác*, và sử dụng thông tin cảm xúc để hướng dẫn suy nghĩ,
  hành động. Mô hình của Goleman (1995) bao gồm 5 thành phần:

  + *Tự nhận thức*: Biết mình đang cảm thấy gì và tại sao
  + *Tự điều chỉnh*: Kiểm soát và chuyển hóa cảm xúc tiêu cực
  + *Động lực nội tại*: Thúc đẩy bản thân vì lý do nội tâm, không phải phần thưởng bên ngoài
  + *Đồng cảm*: Hiểu cảm xúc của người khác
  + *Kỹ năng xã hội*: Quản lý mối quan hệ, xây dựng mạng lưới
]

#nghiencuu(title: [🔬 Bằng chứng thực nghiệm về EQ], accent: c-neuro)[
  Các nghiên cứu theo dõi dài hạn (longitudinal studies) tại Đại học
  Illinois và Harvard cho thấy:
  
  - Trẻ em có EQ cao trong bài kiểm tra "Marshmallow Test" (khả năng trì
    hoãn thỏa mãn) đạt điểm SAT cao hơn 210 điểm so với nhóm có EQ thấp
  - EQ dự đoán thành công nghề nghiệp tốt hơn IQ trong 67% trường hợp
    nghề nghiệp đòi hỏi tương tác xã hội cao
  - Tổn thương vỏ não trước trán (prefrontal cortex) — vùng xử lý cảm xúc
    — làm suy giảm khả năng ra quyết định dù IQ không thay đổi
]

#lesson([Trí tuệ — Nhìn xuyên qua các nền văn hóa], theme-color: c-evo)

Điều thú vị là *khái niệm trí tuệ không giống nhau* ở mọi nơi trên thế giới.

#trithuc(title: [★ Trí tuệ theo các nền văn hóa khác nhau], accent: c-evo)[
  - *Văn hóa phương Tây*: Nhấn mạnh tư duy logic, tốc độ xử lý, độc lập. Trí tuệ được đo bằng bài kiểm tra chuẩn hóa.
  
  - *Văn hóa Đông Á (Trung, Nhật, Hàn)*: Trí tuệ gắn liền với sự chăm chỉ, khiêm tốn, biết lắng nghe và học hỏi từ người khác. Người thông minh là người biết "không biết".
  
  - *Văn hóa Châu Phi (Ubuntu)*: Trí tuệ là sản phẩm của cộng đồng — "tôi tồn tại vì chúng ta tồn tại". Người thông minh là người giúp cộng đồng phát triển.
  
  - *Văn hóa bản địa Amazon*: Trí tuệ được thể hiện qua sự hiểu biết sâu sắc về rừng, thực vật, mùa vụ — loại "trí tuệ sinh thái" mà xã hội công nghiệp thường bỏ qua.
]

#caudoi(title: [? Thảo luận mở], accent: c-philo)[
  Nếu mỗi nền văn hóa có quan niệm khác nhau về trí tuệ, thì liệu có một
  định nghĩa *phổ quát* nào không? Hay trí tuệ, giống như ngôn ngữ và văn
  hóa, là sản phẩm của bối cảnh xã hội cụ thể?
]

#lydo(title: [💡 Điểm chốt chương 1], accent: c-brain)[
  Trí tuệ không phải là một thực thể đơn nhất, bất biến có thể đo được
  bằng một con số duy nhất (như IQ). Nó là một *tập hợp phức tạp* các khả
  năng — nhận thức, cảm xúc, xã hội, thể chất, sáng tạo — được định hình
  bởi tiến hóa, văn hóa, kinh nghiệm cá nhân và bối cảnh xã hội. Chương
  tiếp theo sẽ hỏi: *các khả năng này từ đâu mà đến?*
]
