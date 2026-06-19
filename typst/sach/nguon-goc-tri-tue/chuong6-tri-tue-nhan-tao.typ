// ═══════════════════════════════════════════════════════════════
// CHƯƠNG 6 — TRÍ TUỆ NHÂN TẠO VÀ BÀI HỌC VỀ TÂM TRÍ
// ═══════════════════════════════════════════════════════════════
#import "_config.typ": *

#chapter(
  [Trí Tuệ Nhân Tạo — Gương Phản Chiếu Tâm Trí],
  theme-color: c-ai,
)

#lythuyet[
  Khi con người cố gắng *tạo ra* trí tuệ, chúng ta buộc phải làm rõ trí
  tuệ *là gì*. Lịch sử Trí tuệ nhân tạo (AI) do đó không chỉ là lịch sử
  kỹ thuật — nó là lịch sử của sự hiểu biết về tâm trí con người, với mỗi
  thất bại và thành công đều tiết lộ điều gì đó sâu sắc về bản chất của
  tư duy.
]

#lesson([Nguồn gốc của AI — Alan Turing và câu hỏi bất tử], theme-color: c-ai)

#trichdan(
  author: [Alan Turing],
  source: [Computing Machinery and Intelligence, 1950],
)[
  "Tôi đề xuất câu hỏi: Máy móc có thể suy nghĩ không?"
]

#nghiencuu(title: [🔬 Bài kiểm tra Turing (1950)], accent: c-neuro)[
  Alan Turing không cố gắng định nghĩa "tư duy" — ông biết điều đó là bất
  khả thi. Thay vào đó, ông đề xuất *Trò chơi bắt chước* (Imitation Game):
  
  Một người thẩm vấn giao tiếp bằng văn bản với một người và một máy tính.
  Nếu thẩm vấn không phân biệt được ai là máy, ai là người — máy "đã qua"
  bài kiểm tra.
  
  *Ý nghĩa*: Thay vì hỏi "máy có *thực sự* suy nghĩ không?" (không thể trả
  lời), Turing hỏi "máy có thể *hoạt động như thể* nó suy nghĩ không?"
  — câu hỏi thực nghiệm được.
]

#timeline-event([1956], [
  *Hội nghị Dartmouth* — John McCarthy, Marvin Minsky, Allen Newell, Herbert
  Simon: "AI" được đặt tên. Kỳ vọng lạc quan: máy tính sẽ vượt con người
  trong mọi nhiệm vụ trí tuệ trong vòng 20 năm.
], accent: c-ai)

#timeline-event([1957-1974], [
  *Kỷ nguyên vàng đầu tiên*: Chương trình chứng minh định lý, giải quyết
  bài toán đại số. Mùa đông AI đầu tiên (1974) do kỳ vọng thực tế không
  đạt được.
], accent: c-ai)

#timeline-event([1980s], [
  *Hệ chuyên gia (Expert Systems)*: Mã hóa kiến thức chuyên gia thành
  quy tắc if-then. Thành công giới hạn trong y tế (MYCIN), địa chất
  (PROSPECTOR). Mùa đông AI thứ hai (1987).
], accent: c-ai)

#timeline-event([1997], [
  *Deep Blue* (IBM) đánh bại Garry Kasparov ở cờ vua. Nhưng Deep Blue không
  "hiểu" cờ vua — nó tìm kiếm brute-force 200 triệu vị trí/giây. Trí tuệ
  hẹp (narrow AI) vs. trí tuệ tổng quát (AGI).
], accent: c-ai)

#timeline-event([2006-2012], [
  *Cuộc cách mạng Deep Learning*: Geoffrey Hinton phục hồi mạng nơ-ron nhân
  tạo sâu. GPU thay thế CPU. ImageNet 2012: AlexNet giảm tỷ lệ lỗi nhận
  dạng hình ảnh từ 26% xuống 15% — cách mạng AI bắt đầu.
], accent: c-ai)

#timeline-event([2017], [
  *Attention Is All You Need*: Kiến trúc Transformer ra đời. Cơ sở của GPT,
  BERT và mọi mô hình ngôn ngữ lớn (LLM) sau này.
], accent: c-ai)

#timeline-event([2022], [
  *ChatGPT*: 100 triệu người dùng trong 2 tháng. AI trở thành đề tài của
  mọi bàn ăn. Câu hỏi về trí tuệ, ý thức và tương lai loài người trở nên
  cấp thiết hơn bao giờ hết.
], accent: c-ai)

#lesson([Các phương pháp AI và những gì chúng tiết lộ về tâm trí], theme-color: c-ai)

#section([AI biểu tượng — Tư duy như quy tắc], theme-color: c-ai)

#khainiemboc(title: [📖 AI biểu tượng (Symbolic AI / GOFAI)], accent: c-book)[
  *Ý tưởng cốt lõi*: Tâm trí là *xử lý biểu tượng* (symbol manipulation).
  Tư duy = thao tác các ký hiệu theo quy tắc.
  
  *Triết học nền*: Functionalism — tâm trí là phần mềm chạy trên phần cứng
  (não bộ). Nếu máy tính chạy đúng phần mềm, nó sẽ có tâm trí.
  
  *Giới hạn*: Không thể xử lý tốt sự mơ hồ, ngữ cảnh, và học hỏi từ dữ
  liệu thô. Con người không suy nghĩ bằng quy tắc rõ ràng — chúng ta học
  bằng ví dụ và trực giác.
]

#section([Mạng nơ-ron nhân tạo — Tư duy như mẫu], theme-color: c-ai)

#khainiemboc(title: [📖 Mạng nơ-ron nhân tạo (ANN)], accent: c-ai)[
  Lấy cảm hứng từ não sinh học nhưng không mô phỏng chính xác:
  
  - *Nơ-ron nhân tạo*: Nhận đầu vào số học, tính tổng có trọng số, qua hàm
    kích hoạt phi tuyến, tạo ra đầu ra
  - *Học*: Điều chỉnh trọng số bằng gradient descent + backpropagation dựa
    trên sai lầm (loss function)
  - *Mạng sâu (Deep learning)*: Nhiều lớp nơ-ron, mỗi lớp học biểu diễn
    trừu tượng hơn
  
  *Điều kỳ diệu*: Mạng nơ-ron không được lập trình quy tắc — chúng tự rút
  ra quy tắc từ dữ liệu. Giống cách trẻ em học ngôn ngữ hơn là cách học
  theo sách giáo khoa.
]

#nghiencuu(title: [🔬 LLM — Mô hình ngôn ngữ lớn hoạt động như thế nào?], accent: c-neuro)[
  GPT-4, Claude, Gemini — các mô hình ngôn ngữ lớn được huấn luyện để
  *dự đoán từ tiếp theo* trong văn bản. Đơn giản như vậy.
  
  Nhưng để làm tốt việc đó với hàng nghìn tỷ từ văn bản, mô hình phải học:
  ngữ pháp, ngữ nghĩa, logic, kiến thức thế giới, phong cách viết, lý luận,
  thậm chí một mức độ "common sense" nào đó.
  
  *Câu hỏi triết học*: Đây có phải là "hiểu" (understanding) hay chỉ là
  "mô phỏng" (simulation)? Có sự khác biệt thực sự không?
]

#section([Phòng Trung Quốc — AI có hiểu không?], theme-color: c-ai)

#nghiencuu(title: [🔬 Thí nghiệm tư duy: Phòng Trung Quốc — John Searle (1980)], accent: c-neuro)[
  Một người không biết tiếng Trung ngồi trong phòng với một cuốn sách quy
  tắc: "Khi nhận được ký hiệu X, trả về ký hiệu Y". Từ bên ngoài, người
  nhận thấy "phòng" trả lời tiếng Trung hoàn hảo — vượt qua bài kiểm tra Turing.
  
  *Luận điểm của Searle*: Người trong phòng không *hiểu* tiếng Trung —
  họ chỉ thao tác ký hiệu theo quy tắc. Do đó, không chương trình nào,
  dù phức tạp đến đâu, thực sự *hiểu* hay có ý thức.
  
  *Phản bác*: "Cả hệ thống" (người + sách) có thể hiểu, dù người không hiểu.
  Giống như từng nơ-ron không hiểu nhưng não hiểu.
  
  *Tranh luận này vẫn tiếp tục* — và ngày càng cấp thiết hơn với các LLM.
]

#lydo(title: [💡 Những gì AI dạy chúng ta về Tâm trí], accent: c-brain)[
  Mỗi bước tiến của AI tiết lộ một điều về tâm trí con người:
  
  + *AI chơi cờ vua giỏi hơn người* → Cờ vua không phải đỉnh cao của trí
    tuệ — chỉ là tìm kiếm trong không gian lớn.
    
  + *AI nhận dạng hình ảnh giỏi hơn người* → Nhận dạng hình ảnh ở cấp độ
    thụ động có thể là tính toán thống kê thuần túy.
    
  + *AI viết văn bản thuyết phục* → Nhiều "trí tuệ ngôn ngữ" có thể là
    mô phỏng mẫu, không phải hiểu nghĩa.
    
  + *AI vẫn thất bại ở common sense cơ bản* → Có gì đó trong trí tuệ con
    người — kinh nghiệm thể xác, cảm xúc, bối cảnh sống — mà dữ liệu văn
    bản không thể thay thế.
]

#caudoi(title: [? Câu hỏi lớn nhất của thời đại], accent: c-philo)[
  - Nếu một AI trả lời mọi câu hỏi như người thật, cảm ơn khi được khen,
    "buồn" khi bị phủ nhận — liệu nó có *cảm thấy* điều gì không?
  
  - Chúng ta có thể *biết* được không? Hay câu hỏi về ý thức AI vĩnh viễn
    không thể kiểm chứng — như chúng ta không thể kiểm chứng ý thức của
    người khác, ngoại trừ bằng hành vi?
  
  - Nếu AI có thể thay thế con người trong mọi công việc trí tuệ, điều đó
    có nghĩa gì đối với *giá trị* của trí tuệ con người?
]

#lydo(title: [💡 Điểm chốt chương 6], accent: c-brain)[
  AI là kính lúp đặt vào tâm trí con người. Mỗi lần chúng ta cố gắng tạo
  ra trí tuệ nhân tạo, chúng ta học được điều gì đó sâu sắc hơn về trí tuệ
  tự nhiên. Và mỗi lần AI thất bại, chúng ta phát hiện ra một chiều kích
  mới của những gì *là* con người.
  
  Chương cuối sẽ nhìn về phía trước: *Tương lai của trí tuệ — con người,
  máy móc, và có thể là điều gì đó vượt ra ngoài cả hai.*
]
