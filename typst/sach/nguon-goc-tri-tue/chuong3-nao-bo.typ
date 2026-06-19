// ═══════════════════════════════════════════════════════════════
// CHƯƠNG 3 — NÃO BỘ VÀ CƠ CHẾ TRÍ TUỆ
// ═══════════════════════════════════════════════════════════════
#import "_config.typ": *

#chapter(
  [Não Bộ — Cỗ Máy Kỳ Diệu Của Vũ Trụ],
  theme-color: c-neuro,
)

#lythuyet[
  Không có cơ quan nào trong vũ trụ được biết đến mà phức tạp hơn não
  người. Với khoảng *86 tỷ tế bào thần kinh* (nơ-ron) và xấp xỉ
  *100 nghìn tỷ kết nối synapse* — nhiều hơn số ngôi sao trong dải Ngân Hà
  — não người là hệ thống xử lý thông tin tinh vi nhất từng được biết đến.
  Nhưng cỗ máy này vận hành như thế nào để sinh ra trí tuệ?
]

#lesson([Kiến trúc não bộ — Ba tầng hành tinh], theme-color: c-neuro)

#nghiencuu(title: [🔬 Mô hình Ba Não (Triune Brain) — Paul MacLean], accent: c-neuro)[
  Nhà thần kinh học Paul MacLean đề xuất mô hình não tiến hóa theo 3 lớp,
  mỗi lớp thêm vào trong quá trình tiến hóa động vật có xương sống:
  
  #grid(
    columns: (0.5cm, 1fr),
    column-gutter: 10pt,
    row-gutter: 10pt,
    block(fill: c-philo, width: 0.5cm, height: 2cm, radius: 3pt)[],
    block(fill: c-philo.lighten(93%), inset: 12pt, radius: 6pt)[
      *Não bò sát (R-Complex)*: Thân não + tiểu não\
      Bản năng sinh tồn, hô hấp, nhịp tim, lãnh thổ, giao phối.\
      _Không thay đổi, không linh hoạt, phản ứng tự động._
    ],
    block(fill: c-brain, width: 0.5cm, height: 2.3cm, radius: 3pt)[],
    block(fill: c-brain.lighten(93%), inset: 12pt, radius: 6pt)[
      *Não thú (Hệ Viền - Limbic System)*: Hạch hạnh nhân, hải mã,
      vùng đồi thị\
      Cảm xúc, ký ức, gắn bó xã hội, học hỏi theo kinh nghiệm.\
      _Linh hoạt hơn, học được từ sai lầm._
    ],
    block(fill: c-book, width: 0.5cm, height: 2.5cm, radius: 3pt)[],
    block(fill: c-book.lighten(93%), inset: 12pt, radius: 6pt)[
      *Não linh trưởng (Tân vỏ não - Neocortex)*: Vỏ não 6 lớp\
      Ngôn ngữ, tư duy logic, lập kế hoạch, ý thức, sáng tạo.\
      _Cực kỳ linh hoạt, có thể học bất kỳ điều gì._
    ],
  )
]

#luuy(title: [▲ Phê bình khoa học], accent: rgb("#b45309"))[
  Mô hình ba não của MacLean rất hấp dẫn nhưng hiện đại quá đơn giản hóa.
  Thực tế, các vùng não không hoạt động độc lập mà *liên tục tương tác và
  điều chỉnh lẫn nhau*. Não không chia thành "cảm xúc" và "lý trí" riêng
  biệt — chúng đan xen phức tạp. Nhưng mô hình này vẫn hữu ích như một
  khung tổng quát.
]

#section([Nơ-ron — Đơn vị cơ bản của tư duy], theme-color: c-neuro)

#khainiemboc(title: [📖 Nơ-ron thần kinh (Neuron)], accent: c-neuro)[
  Nơ-ron là tế bào thần kinh — đơn vị cơ bản xây dựng nên não bộ. Một
  nơ-ron điển hình gồm:
  
  - *Thân tế bào (soma)*: Chứa nhân tế bào, trung tâm chuyển hóa
  - *Nhánh gai (dendrites)*: Nhận tín hiệu điện từ nơ-ron khác (đầu vào)
  - *Sợi trục (axon)*: Truyền tín hiệu đến nơ-ron tiếp theo (đầu ra)
  - *Khe synapse*: Khoảng cách nhỏ giữa hai nơ-ron, nơi tín hiệu hóa học
    (chất dẫn truyền thần kinh) đi qua
  
  *Quy tắc then chốt*: "Neurons that fire together, wire together"
  (Donald Hebb, 1949) — Các nơ-ron kích hoạt đồng thời sẽ tăng cường kết
  nối với nhau. Đây là cơ sở phân tử của học hỏi và ký ức.
]

#nghiencuu(title: [🔬 Tính dẻo dai thần kinh (Neuroplasticity)], accent: c-neuro)[
  Trong suốt thế kỷ 20, khoa học tin rằng não người là tĩnh — các tế bào
  thần kinh chết đi không được thay thế. Phát hiện cuối thế kỷ 20 đã đảo
  ngược hoàn toàn quan điểm này:
  
  - *Não có thể tự tái cấu trúc* trong suốt cuộc đời (neuroplasticity)
  - Người mù sử dụng vỏ não thị giác để xử lý thông tin xúc giác (Braille)
  - Thủ thư London có hippocampus (vùng định vị không gian) lớn hơn người
    bình thường sau nhiều năm ghi nhớ bản đồ đường phố
  - Thiền định 8 tuần có thể tăng độ dày vỏ não trước trán
  
  *Ý nghĩa*: Trí tuệ không cố định từ khi sinh ra. Não là cơ quan *phản
  ứng với kinh nghiệm*, không phải cỗ máy tĩnh.
]

#section([Hệ thống 1 và Hệ thống 2 — Hai tốc độ tư duy], theme-color: c-neuro)

#nghiencuu(title: [🔬 Thinking, Fast and Slow — Daniel Kahneman], accent: c-neuro)[
  Nhà tâm lý học Daniel Kahneman (Nobel Kinh tế 2002) mô tả hai hệ thống
  xử lý thông tin song song trong não:
  
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 14pt,
    block(
      fill: c-philo.lighten(93%), stroke: 0.6pt + c-philo,
      radius: 6pt, inset: 12pt,
    )[
      *Hệ thống 1 — Nhanh*
      - Tự động, không tốn công sức
      - Dựa trên trực giác và thói quen
      - Xử lý song song, dưới ý thức
      - Không mệt mỏi, luôn hoạt động
      - Dễ bị ảo giác nhận thức (cognitive biases)
      
      _Ví dụ_: Nhận ra khuôn mặt quen, lái xe quen đường, cảm giác nguy hiểm tức thì
    ],
    block(
      fill: c-ai.lighten(93%), stroke: 0.6pt + c-ai,
      radius: 6pt, inset: 12pt,
    )[
      *Hệ thống 2 — Chậm*
      - Chủ ý, tốn nỗ lực
      - Dựa trên suy luận logic
      - Xử lý tuần tự, trong ý thức
      - Dễ kiệt sức (ego depletion)
      - Có thể kiểm tra và sửa Hệ thống 1
      
      _Ví dụ_: Giải toán, học ngôn ngữ mới, đưa ra quyết định quan trọng
    ],
  )
]

#trithuc(title: [★ Tại sao chúng ta mắc sai lầm tư duy?], accent: c-brain)[
  Não người tiến hóa không phải để tư duy logic hoàn hảo, mà để *sống sót
  nhanh chóng trong môi trường tổ tiên*. Kết quả là chúng ta có hàng trăm
  "ảo giác nhận thức" (cognitive biases):
  
  - *Hiệu ứng neo (Anchoring)*: Số đầu tiên nghe được ảnh hưởng đến mọi
    ước lượng sau đó
  - *Thiên kiến xác nhận (Confirmation bias)*: Chỉ chú ý thông tin ủng hộ
    niềm tin có sẵn
  - *Hiệu ứng hào quang (Halo effect)*: Người đẹp bị cho là thông minh hơn
  - *Hiệu ứng Dunning-Kruger*: Người kém nhất thường tự tin nhất
  - *Sợ mất mát (Loss aversion)*: Đau khi mất 100€ gấp 2 lần vui khi được 100€
]

#lesson([Ký ức — Nơi trí tuệ được lưu trữ], theme-color: c-neuro)

#khainiemboc(title: [📖 Các loại ký ức trong não bộ], accent: c-neuro)[
  Ký ức không phải là "băng video" ghi lại thực tại. Nó là quá trình *tái
  cấu trúc tích cực* mỗi khi chúng ta nhớ lại. Não người có nhiều hệ thống
  ký ức khác nhau:
  
  - *Ký ức khai báo (Declarative)*: Ký ức về sự kiện (episodic) và về kiến
    thức (semantic). Được lưu trữ trong hải mã (hippocampus) và vỏ não.
  
  - *Ký ức thủ tục (Procedural)*: Kỹ năng vận động và thói quen. Lưu trong
    tiểu não và nhân nền. Không cần ý thức khi dùng.
  
  - *Ký ức làm việc (Working Memory)*: Bộ nhớ tạm thời, chứa 7±2 mục trong
    ~20 giây. Vỏ não trước trán là trung tâm.
  
  - *Ký ức cảm xúc*: Hạch hạnh nhân (amygdala) gắn thêm "nhãn cảm xúc"
    vào mọi ký ức. Đây là lý do ký ức đau khổ hay sung sướng in đậm hơn
    ký ức trung tính.
]

#nghiencuu(title: [🔬 Case H.M. — Bệnh nhân không thể ghi nhớ], accent: c-neuro)[
  Henry Molaison (1926–2008), được biết với tên "H.M.", là bệnh nhân thần
  kinh nổi tiếng nhất lịch sử y học.
  
  Năm 1953, phẫu thuật cắt bỏ hải mã hai bên để chữa động kinh khiến H.M.
  hoàn toàn mất khả năng tạo ra ký ức mới (anterograde amnesia). Ông nhớ
  mọi thứ trước phẫu thuật, nhưng mỗi ngày thức dậy ông không biết ngày
  hôm qua đã xảy ra gì.
  
  Điều kinh ngạc: H.M. vẫn *học được kỹ năng mới* (vẽ gương, chơi đàn)
  mà không biết mình đã học. Điều này chứng minh *ký ức khai báo và ký
  ức thủ tục được lưu ở hai nơi khác nhau trong não*.
  
  Nghiên cứu về H.M. trong 55 năm đã tạo ra toàn bộ nền tảng của khoa học
  ký ức hiện đại.
]

#section([Vỏ não trước trán — Bộ tư lệnh trí tuệ], theme-color: c-neuro)

#lydo(title: [💡 Điều gì làm cho con người đặc biệt?], accent: c-brain)[
  Vỏ não trước trán (Prefrontal Cortex - PFC) chiếm *29% tổng diện tích vỏ
  não người* — lớn hơn bất kỳ loài nào khác. So sánh:
  
  - Tinh tinh: ~17% vỏ não là PFC
  - Chó: ~7%
  - Mèo: ~3.5%
  - Chuột: ~3%
  
  PFC là trung tâm của những gì ta gọi là "chức năng điều hành" (executive
  functions): lập kế hoạch, kiểm soát xung động, ra quyết định, suy nghĩ
  về tương lai, nhận thức xã hội, và *ý thức về bản thân*.
  
  PFC phát triển chưa hoàn chỉnh đến năm *25 tuổi* ở người — đây là lý do
  khoa học giải thích tại sao thanh thiếu niên thường đưa ra quyết định
  liều lĩnh và không suy nghĩ dài hạn.
]

#lydo(title: [💡 Điểm chốt chương 3], accent: c-brain)[
  Não người không phải là một bộ máy logic lạnh lùng. Nó là *hệ sinh thái
  phức tạp* của các vùng chuyên biệt, các hệ thống cạnh tranh và hợp tác.
  Trí tuệ không phải là sản phẩm của một vùng não duy nhất, mà là *thuộc
  tính nổi lên (emergent property)* từ sự phối hợp của toàn bộ hệ thống.
  
  Câu hỏi tiếp theo: *Từ hoạt động điện-hóa học của não, ý thức và tư duy
  nảy sinh như thế nào?* Đây là địa hạt của triết học tâm trí.
]
