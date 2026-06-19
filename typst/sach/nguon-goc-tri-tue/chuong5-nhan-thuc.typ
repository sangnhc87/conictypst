// ═══════════════════════════════════════════════════════════════
// CHƯƠNG 5 — TÂM LÝ HỌC NHẬN THỨC VÀ HỌC HỎI
// ═══════════════════════════════════════════════════════════════
#import "_config.typ": *

#chapter(
  [Tâm Lý Học Nhận Thức — Cách Chúng Ta Học Và Hiểu],
  theme-color: c-ai,
)

#lythuyet[
  Nếu chương trước hỏi "ý thức là gì?", chương này hỏi "chúng ta *học*
  như thế nào?". Tâm lý học nhận thức (cognitive psychology) nghiên cứu
  các quá trình tâm thần bên trong: chú ý, tri giác, ký ức, học hỏi, ngôn
  ngữ, giải quyết vấn đề và suy luận. Đây là cầu nối giữa khoa học thần
  kinh và trải nghiệm hàng ngày của chúng ta.
]

#lesson([Chú ý — Bộ lọc của ý thức], theme-color: c-ai)

#khainiemboc(title: [📖 Chú ý là gì?], accent: c-ai)[
  Mỗi giây, hệ thần kinh của bạn nhận khoảng *11 triệu bit thông tin*
  từ các giác quan. Nhưng ý thức chỉ xử lý được khoảng *40-50 bit/giây*.
  
  *Chú ý* là cơ chế chọn lọc — quyết định phần nhỏ nào của thực tại được
  đưa vào ý thức để xử lý. Không có chú ý, không có nhận thức.
]

#nghiencuu(title: [🔬 Hiện tượng Cocktail Party — Colin Cherry (1953)], accent: c-neuro)[
  Trong một bữa tiệc ồn ào, bạn có thể tập trung vào một cuộc trò chuyện
  và lọc bỏ phần còn lại. Nhưng nếu ai đó ở phía khác phòng nhắc tên bạn,
  bạn nghe thấy ngay — dù não "không nghe" phía đó.
  
  Điều này chứng minh: não xử lý *tất cả* thông tin đến một mức độ nào đó
  ở dưới ý thức, và chỉ "đẩy lên" những thứ quan trọng (tên bạn, từ "nguy
  hiểm", âm thanh lạ).
]

#nghiencuu(title: [🔬 Người vô hình trong phòng — Simons & Chabris (1999)], accent: c-neuro)[
  Thí nghiệm kinh điển: người tham gia được yêu cầu đếm số lần một đội áo
  trắng chuyền bóng rổ. Trong lúc đó, một người mặc đồ khỉ đột đi qua
  giữa sân trong ~9 giây.
  
  *Kết quả*: 50% người xem không nhìn thấy người đội lốt khỉ đột.
  
  *Bài học*: *Mù thay đổi và mù không chú ý* (change blindness, inattentional
  blindness) — khi tập trung vào một thứ, não bỏ qua hoàn toàn những thứ
  khác, dù chúng hiện diện rõ ràng trước mắt. Đây là hạn chế tiến hóa —
  tổ tiên cần tập trung vào mối đe dọa ngay trước mặt.
]

#section([Dòng chảy — Flow State], theme-color: c-ai)

#nghiencuu(title: [🔬 Trạng thái dòng chảy — Mihaly Csikszentmihalyi], accent: c-neuro)[
  Nhà tâm lý học người Hungary mô tả trạng thái "flow" — khi một người
  *hoàn toàn đắm chìm* vào hoạt động:
  
  - Tập trung toàn bộ, không có phân tâm
  - Thời gian như trôi nhanh hoặc đứng lại
  - Cảm giác tự ngã tan biến — không còn "tôi" riêng biệt
  - Hoạt động tự nó là phần thưởng
  
  Flow xảy ra khi *thách thức vừa khớp với kỹ năng* — không quá dễ
  (buồn chán) và không quá khó (lo lắng). Nghiên cứu cho thấy đây là
  trạng thái hạnh phúc và năng suất cao nhất mà con người có thể đạt.
]

#lesson([Các lý thuyết học hỏi — Từ Pavlov đến Piaget], theme-color: c-ai)

#section([Điều kiện hóa — Học qua liên kết], theme-color: c-ai)

#timeline-event([1901], [
  *Ivan Pavlov*: Phát hiện *điều kiện hóa cổ điển*. Chó nghe tiếng chuông
  khi được cho ăn → sau nhiều lần → tiếng chuông một mình cũng làm chó
  tiết nước bọt. Não học cách liên kết các kích thích với kết quả.
], accent: c-neuro)

#timeline-event([1938], [
  *B.F. Skinner*: *Điều kiện hóa tác nhân* (operant conditioning). Hành vi
  được củng cố (rewarded) sẽ được lặp lại. Hành vi bị phạt sẽ bị tắt.
  Toàn bộ hành vi có thể được định hình bằng lịch củng cố.
], accent: c-neuro)

#section([Học hỏi nhận thức — Tư duy chủ động], theme-color: c-ai)

#nghiencuu(title: [🔬 Lý thuyết phát triển nhận thức — Jean Piaget], accent: c-neuro)[
  Jean Piaget (1896-1980) mô tả trẻ em phát triển nhận thức qua 4 giai đoạn:
  
  #grid(
    columns: (2.5cm, 1fr),
    column-gutter: 10pt,
    row-gutter: 8pt,
    text(weight: "bold", fill: c-ai)[0-2 tuổi],
    [*Cảm giác vận động*: Học qua giác quan và vận động. Phát triển khái niệm "vật thường hằng" — đồ vật vẫn tồn tại dù không nhìn thấy.],
    text(weight: "bold", fill: c-ai)[2-7 tuổi],
    [*Tiền thao tác*: Bắt đầu dùng ngôn ngữ và biểu tượng. Tư duy tự kỷ trung tâm — khó nhìn quan điểm người khác.],
    text(weight: "bold", fill: c-ai)[7-11 tuổi],
    [*Thao tác cụ thể*: Tư duy logic nhưng cần vật cụ thể. Hiểu bảo toàn (lượng nước không đổi dù thay hình dạng bình).],
    text(weight: "bold", fill: c-ai)[11+],
    [*Thao tác hình thức*: Tư duy trừu tượng, giả thuyết-suy diễn. Có thể lý luận về những điều chưa xảy ra.],
  )
]

#section([Vùng phát triển gần nhất — Vygotsky], theme-color: c-ai)

#khainiemboc(title: [📖 ZPD — Zone of Proximal Development], accent: c-ai)[
  Lev Vygotsky (1896-1934) đề xuất khái niệm quan trọng trong giáo dục:
  
  - *ZPD* = Khoảng cách giữa điều trẻ có thể làm một mình và điều trẻ có
    thể làm với sự hỗ trợ của người có năng lực hơn.
  
  - Học tập hiệu quả nhất xảy ra trong ZPD — không quá dễ (không học được),
    không quá khó (bị thất vọng).
  
  - *Scaffolding*: Người lớn cung cấp hỗ trợ tạm thời, dần dần rút lại khi
    trẻ thành thạo hơn.
  
  Ý tưởng này là nền tảng của *mọi phương pháp giáo dục hiện đại tốt*.
]

#lesson([Siêu nhận thức — Suy nghĩ về Suy nghĩ], theme-color: c-ai)

#khainiemboc(title: [📖 Siêu nhận thức (Metacognition)], accent: c-brain)[
  Siêu nhận thức là *khả năng theo dõi, đánh giá và điều chỉnh quá trình
  tư duy của chính mình*. Đây là một trong những đặc điểm phân biệt con
  người với đa số động vật:
  
  - "Tôi không hiểu phần này — tôi cần đọc lại"
  - "Tôi đang suy nghĩ theo kiểu này nhưng có lẽ tôi đang bị ảnh hưởng bởi..."
  - "Chiến lược giải bài này không hoạt động — tôi cần thử cách khác"
  
  Siêu nhận thức là *kỹ năng học hỏi quan trọng nhất* — người có siêu nhận
  thức tốt học nhanh hơn, giải quyết vấn đề tốt hơn, ít mắc ảo giác nhận
  thức hơn.
]

#nghiencuu(title: [🔬 Hiệu ứng Dunning-Kruger và Siêu nhận thức], accent: c-neuro)[
  David Dunning và Justin Kruger (1999) phát hiện:
  
  *Người kém nhất trong một kỹ năng thường tự đánh giá mình tốt nhất* —
  bởi vì họ thiếu siêu nhận thức để biết mình đang sai ở đâu.
  
  *Người giỏi nhất thường đánh giá thấp bản thân* — họ nhận ra độ phức
  tạp của vấn đề và biết rõ những gì mình chưa biết.
  
  *Bài học*: "Biết rằng mình không biết" (Socrates) là dấu hiệu của trí
  tuệ thực sự — không phải điểm yếu.
]

#trithuc(title: [★ 10.000 giờ và Deliberate Practice], accent: c-evo)[
  Malcolm Gladwell trong "Outliers" (2008) phổ biến quy tắc 10.000 giờ:
  cần 10.000 giờ luyện tập để đạt mức thành thạo chuyên gia.
  
  *Nhưng* nhà khoa học K. Anders Ericsson — người mà Gladwell trích dẫn —
  nhấn mạnh rằng quan trọng hơn số giờ là *Luyện tập có chủ đích
  (Deliberate Practice)*:
  
  - Tập trung vào những điểm cụ thể cần cải thiện (không phải làm thứ mình
    đã giỏi)
  - Phản hồi ngay lập tức và cụ thể
  - Vượt ra ngoài vùng thoải mái liên tục
  - Tư duy có thầy hoặc hướng dẫn rõ ràng
  
  10.000 giờ luyện tập *thụ động* sẽ không tạo ra chuyên gia. 10.000 giờ
  luyện tập *có chủ đích* mới có thể.
]

#lydo(title: [💡 Điểm chốt chương 5], accent: c-brain)[
  Học hỏi không phải là tiếp nhận thụ động thông tin. Nó là quá trình *chủ
  động xây dựng, thử nghiệm và điều chỉnh* các mô hình tinh thần về thế giới.
  
  Não người không phải là "tờ giấy trắng" (tabula rasa như Locke nghĩ) —
  nhưng cũng không phải là cỗ máy cố định (như người ta từng nghĩ). Nó là
  *hệ thống linh hoạt* tối ưu hóa qua tương tác với môi trường.
  
  Chương tiếp theo sẽ hỏi: *Con người đã tạo ra trí tuệ nhân tạo như thế
  nào — và điều đó nói lên gì về trí tuệ tự nhiên?*
]
