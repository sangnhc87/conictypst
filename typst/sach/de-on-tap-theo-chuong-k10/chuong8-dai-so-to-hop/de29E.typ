#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("059669") // Emerald

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP",
  exam-title: "CHUYÊN ĐỀ THỰC TẾ: MÃ VẠCH EAN-13, QR CODE & MẠNG VIỄN THÔNG (ĐỀ SỐ 29E)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "186",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Mã vạch EAN-13 có CeTZ)
#tn([Mã vạch tiêu chuẩn quốc tế EAN-13 gồm $13$ chữ số $c_1 c_2 ... c_12 c_13$. Chữ số cuối cùng $c_13$ là chữ số kiểm tra (checksum) thỏa mãn phương trình đồng dư:
$ (c_1 + c_3 + c_5 + c_7 + c_9 + c_11) + 3(c_2 + c_4 + c_6 + c_8 + c_10 + c_12) + c_13 equiv 0 (mod 10) $
Một sản phẩm có $12$ chữ số đầu tiên là $8 9 3 8 5 0 5 9 7 4 1 9$. Chữ số kiểm tra $c_13$ của mã vạch này là],
    (
        True([$4$]),
        [$6$],
        [$2$],
        [$8$]
    ),
    loigiai: [
        *Phương pháp giải:* Tính tổng các chữ số ở vị trí lẻ và tổng các chữ số ở vị trí chẵn từ 12 chữ số đầu, sau đó giải phương trình đồng dư theo modulo 10 để tìm chữ số kiểm tra $c_13 in {0, 1, ..., 9}$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Vẽ mô phỏng mã vạch
          let widths = (1, 2, 1, 3, 2, 1, 2, 1, 3, 1, 2, 1, 2, 3, 1, 2, 1, 1, 2, 3)
          let x = 0.0
          for w in widths {
            rect((x, 0), (x + w * 0.08, 1.2), fill: black, stroke: none)
            x += w * 0.08 + 0.08
          }
          content((1.8, -0.3), [EAN-13: 893850597419-?])
        })
        ]
        - Tổng các chữ số ở vị trí lẻ:
          $ S_1 = c_1 + c_3 + c_5 + c_7 + c_9 + c_11 = 8 + 3 + 5 + 5 + 7 + 1 = 29 $
        - Tổng các chữ số ở vị trí chẵn:
          $ S_2 = c_2 + c_4 + c_6 + c_8 + c_10 + c_12 = 9 + 8 + 0 + 9 + 4 + 9 = 39 $
        - Tổng trọng số:
          $ S = S_1 + 3 S_2 = 29 + 3(39) = 29 + 117 = 146 $
        Ta có $146 + c_13 equiv 0 (mod 10) <=> 6 + c_13 equiv 0 (mod 10) => c_13 = 4$.
    ]
)

// TN 2 (Lưới QR Code phục hồi dữ liệu)
#tn([Một mã phản hồi nhanh (QR Code) phiên bản 1 có dạng ma trận vuông kích thước $21 times 21$ ô vuông (module). Sau khi trừ các mẫu định vị cố định, có đúng $208$ module dành cho việc mã hóa dữ liệu nhị phân (mỗi module nhận màu Đen hoặc Trắng, tương ứng với bit $1$ hoặc $0$). Khi quét mã, do góc tem bị rách, máy quét bị mất tín hiệu tại đúng $4$ module dữ liệu. Để giải mã thành công, hệ thống cần thử quét vét cạn tối đa bao nhiêu trường hợp kết hợp của $4$ module này?],
    (
        True([$16$]),
        [$8$],
        [$32$],
        [$64$]
    ),
    loigiai: [
        *Phương pháp giải:* Mỗi module dữ liệu bị mất tín hiệu là một biến nhị phân độc lập chỉ nhận 1 trong 2 trạng thái (0 hoặc 1). Áp dụng quy tắc nhân cho 4 module độc lập.
        Số trường hợp kết hợp khả dĩ của 4 module bị mất là:
        $ 2 times 2 times 2 times 2 = 2^4 = 16 text(" trường hợp") $
    ]
)

// TN 3 (Định tuyến gói tin Routing Paths tránh nghẽn có CeTZ)
#tn([Trong một mạng máy tính, gói tin di chuyển trên lưới định tuyến từ router nguồn $S(0, 0)$ đến router đích $D(4, 3)$ bằng các bước chuyển tiếp sang router bên phải ($+x$) hoặc router phía trên ($+y$). Router trung gian tại $R(2, 1)$ đang bị nghẽn mạng nghiêm trọng nên gói tin không được đi qua. Có bao nhiêu lộ trình định tuyến hợp lệ từ $S$ đến $D$?],
    (
        True([$17$]),
        [$35$],
        [$18$],
        [$24$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp đếm bằng phần bù. Lấy tổng số lộ trình từ $S$ đến $D$ trừ đi số lộ trình đi qua nút mạng bị nghẽn $R(2, 1)$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for x in range(5) {
            line((x, 0), (x, 3), stroke: 0.5pt + gray)
          }
          for y in range(4) {
            line((0, y), (4, y), stroke: 0.5pt + gray)
          }
          circle((0, 0), radius: 0.12, fill: accent)
          content((0, -0.3), [$S(0,0)$])
          circle((4, 3), radius: 0.12, fill: accent)
          content((4, 3.3), [$D(4,3)$])
          circle((2, 1), radius: 0.15, fill: red)
          content((2, 1.35), [$R(2,1)$ (Nghẽn)], fill: red)
        })
        ]
        - Tổng số lộ trình định tuyến từ $S(0, 0)$ đến $D(4, 3)$ (4 bước phải, 3 bước lên):
          $ C_7^3 = (7 times 6 times 5) / (3 times 2 times 1) = 35 text(" lộ trình") $
        - Số lộ trình đi qua router nghẽn $R(2, 1)$:
          + Từ $S(0, 0)$ đến $R(2, 1)$ (2 bước phải, 1 bước lên): $C_3^1 = 3$ cách.
          + Từ $R(2, 1)$ đến $D(4, 3)$ (2 bước phải, 2 bước lên): $C_4^2 = 6$ cách.
          Số lộ trình qua $R$ là: $3 times 6 = 18$ lộ trình.
        - Số lộ trình hợp lệ tránh router nghẽn $R$:
          $ 35 - 18 = 17 text(" lộ trình") $
    ]
)

// TN 4 (Cấp phát địa chỉ IPv4 Subnetting)
#tn([Một mạng nội bộ doanh nghiệp được cấp một dải mạng con IPv4 sử dụng mặt nạ mạng `/28`, nghĩa là có $32 - 28 = 4$ bit dành cho phần định danh thiết bị (Host ID). Mỗi bit có thể nhận giá trị $0$ hoặc $1$. Theo giao thức mạng chuẩn, địa chỉ có phần Host ID toàn bit $0$ (Network ID) và toàn bit $1$ (Broadcast ID) được giữ lại cho hệ thống, không được cấp phát cho máy trạm. Có bao nhiêu địa chỉ IP khả dụng để cấp phát cho các máy tính trong mạng con này?],
    (
        True([$14$]),
        [$16$],
        [$15$],
        [$12$]
    ),
    loigiai: [
        *Phương pháp giải:* Tổng số địa chỉ IP được tạo bởi $k = 4$ bit là $2^k$. Số địa chỉ IP khả dụng bằng tổng số trừ đi 2 địa chỉ đặc biệt dành riêng cho mạng và quảng bá.
        - Tổng số địa chỉ IP tạo thành từ 4 bit là:
          $ 2^4 = 16 text(" địa chỉ") $
        - Trừ đi 2 địa chỉ dành riêng (Network ID và Broadcast ID), số IP khả dụng là:
          $ 16 - 2 = 14 text(" địa chỉ") $
    ]
)

// TN 5 (Mã kiểm tra lỗi Hamming (7, 4))
#tn([Trong lý thuyết thông tin, mã Hamming $(7, 4)$ mã hóa mỗi khối dữ liệu gốc gồm $4$ bit thông tin thành một từ mã gồm $7$ bit bằng cách bổ sung $3$ bit kiểm tra chẵn lẻ (Parity bits). Biết mỗi khối $4$ bit thông tin tương ứng với duy nhất một từ mã $7$ bit hợp lệ. Có tất cả bao nhiêu từ mã $7$ bit hợp lệ trong hệ thống mã Hamming này?],
    (
        True([$16$]),
        [$128$],
        [$64$],
        [$32$]
    ),
    loigiai: [
        *Phương pháp giải:* Do phép ánh xạ mã hóa từ khối 4 bit dữ liệu gốc sang từ mã 7 bit là một đơn ánh (mỗi chuỗi dữ liệu gốc cho đúng 1 từ mã hợp lệ), số từ mã hợp lệ bằng số chuỗi dữ liệu 4 bit.
        Mỗi bit trong 4 bit nhận giá trị 0 hoặc 1, số chuỗi là:
        $ 2^4 = 16 text(" từ mã") $
    ]
)

// TN 6 (Phân bổ gói tin vào kênh cáp quang)
#tn([Một tệp dữ liệu dung lượng lớn được chia thành $6$ gói tin phân biệt $P_1, P_2, P_3, P_4, P_5, P_6$ để truyền đồng thời qua $3$ kênh cáp quang độc lập $A, B, C$. Kỹ thuật cân bằng tải phân bổ $3$ gói tin vào kênh $A$, $2$ gói tin vào kênh $B$ và $1$ gói tin vào kênh $C$. Số cách phân bổ các gói tin vào $3$ kênh truyền là],
    (
        True([$60$]),
        [$120$],
        [$30$],
        [$90$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng quy tắc nhân và tổ hợp phân nhóm có thứ tự.
        - Chọn 3 gói tin trong 6 gói cho kênh A: có $C_6^3 = 20$ cách.
        - Chọn 2 gói tin trong 3 gói còn lại cho kênh B: có $C_3^2 = 3$ cách.
        - Gói tin cuối cùng truyền trên kênh C: có $C_1^1 = 1$ cách.
        Theo quy tắc nhân:
        $ 20 times 3 times 1 = 60 text(" cách") $
    ]
)

// TN 7 (Xác suất nhị thức truyền tin không lỗi)
#tn([Khi truyền dữ liệu trên kênh truyền vô tuyến số, xác suất để mỗi bit truyền đi bị lỗi là $p = 0.01$. Một khung dữ liệu gồm $5$ bit được truyền đi độc lập. Xác suất để toàn bộ khung dữ liệu được truyền thành công mà không có bất kỳ bit nào bị lỗi xấp xỉ bằng],
    (
        True([$0.9510$]),
        [$0.9900$],
        [$0.9500$],
        [$0.9044$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng khai triển nhị thức và quy tắc nhân xác suất cho 5 biến cố độc lập, mỗi bit không lỗi có xác suất $q = 1 - p = 0.99$.
        Xác suất để cả 5 bit đều không bị lỗi là:
        $ P = (1 - p)^5 = (0.99)^5 $
        Áp dụng xấp xỉ nhị thức $(1 - x)^5 approx 1 - 5x + 10x^2$:
        $ (1 - 0.01)^5 approx 1 - 5(0.01) + 10(0.0001) = 1 - 0.05 + 0.001 = 0.9510 $
    ]
)

// TN 8 (Đồ thị mạng viễn thông)
#tn([Một mạng cục bộ (LAN) gồm $6$ máy chủ. Để đảm bảo khả năng dự phòng tối đa, người quản trị muốn nối trực tiếp giữa từng cặp máy chủ bằng một tuyến cáp quang riêng biệt (tạo thành đồ thị đầy đủ $K_6$). Có tất cả bao nhiêu tuyến cáp quang cần lắp đặt?],
    (
        True([$15$]),
        [$30$],
        [$36$],
        [$12$]
    ),
    loigiai: [
        *Phương pháp giải:* Mỗi tuyến cáp quang kết nối 2 máy chủ tương ứng với việc chọn 2 đỉnh từ 6 đỉnh của mạng.
        Số tuyến cáp là:
        $ C_6^2 = (6 times 5) / 2 = 15 text(" tuyến cáp") $
    ]
)

// TN 9 (Hàng đợi gói tin có ưu tiên)
#tn([Một bộ định tuyến tiếp nhận $7$ gói tin đang chờ gửi đi, trong đó có $2$ gói tin thoại ưu tiên cao (VoIP) và $5$ gói tin dữ liệu thường. Để đảm bảo chất lượng cuộc gọi, hai gói tin VoIP bắt buộc phải được xếp ở hai vị trí đầu tiên trong hàng đợi xuất phát. Có bao nhiêu cách sắp xếp thứ tự gửi $7$ gói tin này?],
    (
        True([$240$]),
        [$5040$],
        [$120$],
        [$720$]
    ),
    loigiai: [
        *Phương pháp giải:* Phân công 2 vị trí đầu tiên cho 2 gói tin ưu tiên VoIP, sau đó xếp 5 gói tin dữ liệu thường vào 5 vị trí còn lại.
        - Xếp 2 gói tin VoIP vào 2 vị trí đầu: có $2! = 2$ cách.
        - Xếp 5 gói tin thường vào 5 vị trí sau: có $5! = 120$ cách.
        Theo quy tắc nhân:
        $ 2 times 120 = 240 text(" cách") $
    ]
)

// TN 10 (Chùm kênh tần số 5G)
#tn([Một trạm phát sóng di động 5G được phân bổ $8$ dải tần số khả dụng. Trạm cần cấp phát đồng thời một chùm gồm $3$ dải tần số phân biệt cho một cụm thiết bị công nghiệp thông minh. Số cách cấp phát chùm tần số là],
    (
        True([$56$]),
        [$336$],
        [$24$],
        [$112$]
    ),
    loigiai: [
        *Phương pháp giải:* Chọn chùm 3 tần số không phân biệt thứ tự từ 8 dải tần số là một tổ hợp chập 3 của 8.
        Số cách cấp phát là:
        $ C_8^3 = (8 times 7 times 6) / 6 = 56 text(" cách") $
    ]
)

// TN 11 (Chu kỳ bit kiểm tra CRC)
#tn([Một khung truyền thông tin sử dụng mã kiểm tra độ dư tuần hoàn (CRC) bổ sung $5$ bit kiểm tra nhị phân vào cuối thông điệp. Có tất cả bao nhiêu chuỗi bit kiểm tra CRC khả dĩ?],
    (
        True([$32$]),
        [$10$],
        [$64$],
        [$16$]
    ),
    loigiai: [
        *Phương pháp giải:* Mỗi bit trong chuỗi 5 bit nhận giá trị 0 hoặc 1.
        Số chuỗi nhị phân 5 bit là:
        $ 2^5 = 32 text(" chuỗi") $
    ]
)

// TN 12 (Hệ số nhị thức)
#tn([Hệ số của số hạng chứa $x^4$ trong khai triển nhị thức Newton của biểu thức $(1 + 2x)^5$ bằng],
    (
        True([$80$]),
        [$40$],
        [$32$],
        [$160$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức số hạng tổng quát của nhị thức Newton: $T_(k + 1) = C_5^k 1^(5 - k) (2x)^k = C_5^k 2^k x^k$.
        Với số hạng chứa $x^4$, ta chọn $k = 4$:
        $ T_5 = C_5^4 2^4 x^4 = 5 times 16 times x^4 = 80 x^4 $
        Vậy hệ số cần tìm là $80$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân tích mã vạch EAN-13)
#ds([Xét cấu trúc và nguyên lý kiểm tra lỗi của mã vạch EAN-13 gồm $13$ chữ số $c_1 c_2 ... c_13$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Chữ số cuối cùng $c_13$ được xác định duy nhất bởi $12$ chữ số đứng trước nó.]),
    True([Nếu mã vạch có $12$ chữ số đầu là $8 9 3 8 5 0 5 9 7 4 1 9$ thì chữ số kiểm tra $c_13 = 4$.]),
    True([Nếu máy quét nhận diện sai đúng một chữ số bất kỳ ở một vị trí thì mã kiểm tra sẽ phát hiện được lỗi.]),
    [Mã vạch EAN-13 có thể phát hiện được mọi lỗi khi hai chữ số kề nhau bị đổi chỗ cho nhau.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Tính chất mã EAN-13])
    - Chữ số $c_13$ bù 10 của tổng trọng số nên xác định duy nhất. Mệnh đề a ĐÚNG.
    - Đã tính ở TN 1: $c_13 = 4$. Mệnh đề b ĐÚNG.
    - Trọng số vị trí lẻ là 1, vị trí chẵn là 3 (nguyên tố cùng nhau với 10), nên sai 1 chữ số chắc chắn làm tổng thay đổi modulo 10. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Đổi chỗ hai chữ số kề nhau])
    Nếu hiệu hai chữ số kề nhau bằng 5 (ví dụ đổi chỗ 0 và 5), sai số là $3(0 - 5) + (5 - 0) = -10 equiv 0 (mod 10)$, mã không phát hiện được.
    Khẳng định phát hiện được mọi lỗi đổi chỗ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Định tuyến mạng và chuyển tiếp)
#ds([Xét mạng lưới router từ nguồn $S(0, 0)$ đến đích $D(4, 3)$ với router nghẽn tại $R(2, 1)$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số lộ trình chuyển tiếp không điều kiện cấm từ $S$ đến $D$ bằng $35$.]),
    True([Số lộ trình chuyển tiếp từ $S(0, 0)$ đến router $R(2, 1)$ bằng $3$.]),
    True([Số lộ trình chuyển tiếp từ $S(0, 0)$ đến $D(4, 3)$ đi qua router nghẽn $R(2, 1)$ bằng $18$.]),
    [Số lộ trình hợp lệ tránh được router nghẽn $R(2, 1)$ bằng $20$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Số lộ trình])
    - Tổng: $C_7^3 = 35$. Mệnh đề a ĐÚNG.
    - Đến R: $C_3^1 = 3$. Mệnh đề b ĐÚNG.
    - Qua R: $3 times C_4^2 = 3 times 6 = 18$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tránh R])
    $35 - 18 = 17$ (chứ không phải $20$). Mệnh đề d SAI.
  ]
)

// DS 3 (Mạng con IPv4 và phân chia)
#ds([Xét mạng con IPv4 sử dụng mặt nạ mạng `/28` có $4$ bit cho phần Host ID.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số địa chỉ IP được biểu diễn bởi $4$ bit Host ID bằng $16$.]),
    True([Có đúng $2$ địa chỉ IP đặc biệt được dành riêng cho Network ID và Broadcast ID.]),
    True([Số địa chỉ IP khả dụng để cấp phát cho máy tính trong mạng con bằng $14$.]),
    [Nếu doanh nghiệp có $15$ máy tính cần kết nối mạng thì dải mạng con này đủ để cấp phát cho mỗi máy tính một IP riêng biệt.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Cấp phát IPv4 /28])
    - Tổng IP: $2^4 = 16$. Mệnh đề a ĐÚNG.
    - Dành riêng: 2 IP. Mệnh đề b ĐÚNG.
    - Khả dụng: $16 - 2 = 14$ IP. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Nhu cầu 15 máy tính])
    Chỉ có 14 IP khả dụng nên không đủ cấp cho 15 máy tính.
    Mệnh đề d SAI.
  ]
)

// DS 4 (Truyền gói tin và xác suất không lỗi)
#ds([Xét việc truyền $5$ bit dữ liệu độc lập trên kênh truyền có xác suất lỗi mỗi bit $p = 0.01$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Xác suất để cả $5$ bit truyền đi không có bit nào bị lỗi bằng $(0.99)^5$.]),
    True([Giá trị xấp xỉ tuyến tính của xác suất không lỗi là $1 - 5(0.01) = 0.95$.]),
    True([Xác suất để có đúng $1$ bit trong $5$ bit bị lỗi bằng $C_5^1 (0.01)^1 (0.99)^4$.]),
    [Xác suất để có ít nhất một bit bị lỗi lớn hơn $0.10$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Phân bố nhị thức])
    - Không lỗi: $(0.99)^5$. Mệnh đề a ĐÚNG.
    - Xấp xỉ tuyến tính: $1 - 5(0.01) = 0.95$. Mệnh đề b ĐÚNG.
    - Đúng 1 bit lỗi: $C_5^1 (0.01) (0.99)^4$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Có ít nhất 1 bit lỗi])
    Xác suất ít nhất 1 lỗi: $1 - (0.99)^5 approx 1 - 0.9510 = 0.0490 < 0.10$.
    Khẳng định lớn hơn $0.10$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Cho mã vạch EAN-13 có $12$ chữ số đầu là $8 9 3 8 5 0 5 9 7 4 1 9$. Tìm chữ số kiểm tra $c_13$.],
    [4],
    loigiai: [
        #step([Tính tổng trọng số])
        $ 29 + 3(39) = 146 => 146 + c_13 equiv 0 (mod 10) => c_13 = 4 $
    ]
)

// TLN 2
#tln([Một máy quét QR Code bị mất tín hiệu tại đúng $4$ module dữ liệu nhị phân. Cần thử tối đa bao nhiêu trường hợp để giải mã vét cạn?],
    [16],
    loigiai: [
        #step([Lũy thừa nhị phân])
        $ 2^4 = 16 text(" trường hợp") $
    ]
)

// TLN 3
#tln([Trên lưới định tuyến từ $S(0, 0)$ đến $D(4, 3)$, có bao nhiêu lộ trình hợp lệ tránh được router nghẽn tại $R(2, 1)$?],
    [17],
    loigiai: [
        #step([Phần bù])
        $ C_7^3 - C_3^1 times C_4^2 = 35 - 18 = 17 text(" lộ trình") $
    ]
)

// TLN 4
#tln([Một mạng con IPv4 sử dụng mặt nạ `/28` ($4$ bit Host ID). Có bao nhiêu địa chỉ IP khả dụng cho các máy trạm?],
    [14],
    loigiai: [
        #step([Trừ 2 địa chỉ hệ thống])
        $ 2^4 - 2 = 14 text(" địa chỉ") $
    ]
)

// TLN 5
#tln([Có bao nhiêu cách phân bổ $6$ gói tin phân biệt vào $3$ kênh cáp quang $A, B, C$ sao cho kênh $A$ có $3$ gói, kênh $B$ có $2$ gói và kênh $C$ có $1$ gói?],
    [60],
    loigiai: [
        #step([Tích tổ hợp])
        $ C_6^3 times C_3^2 times C_1^1 = 20 times 3 times 1 = 60 text(" cách") $
    ]
)

// TLN 6
#tln([Một mạng LAN gồm $6$ máy chủ kết nối trực tiếp từng cặp với nhau. Cần lắp đặt tất cả bao nhiêu tuyến cáp mạng?],
    [15],
    loigiai: [
        #step([Tổ hợp C_6^2])
        $ C_6^2 = 15 text(" tuyến cáp") $
    ]
)

] // end make-questions

#make-questions()
