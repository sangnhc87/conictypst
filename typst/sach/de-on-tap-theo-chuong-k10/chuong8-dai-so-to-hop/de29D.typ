#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("e11d48") // Rose

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP",
  exam-title: "CHUYÊN ĐỀ THỰC TẾ: MẬT MÃ HỌC, AN NINH MẠNG & KHÓA BẢO MẬT (ĐỀ SỐ 29D)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "185",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Độ phức tạp mật khẩu Brute-force)
#tn([Một hệ thống ngân hàng quy định mật khẩu đăng nhập gồm đúng $8$ ký tự được chọn từ bảng ký tự gồm $26$ chữ cái in hoa, $26$ chữ cái in thường, $10$ chữ số và $10$ ký tự đặc biệt (tổng cộng $72$ ký tự khả dĩ). Các ký tự được phép lặp lại. Tổng số mật khẩu khác nhau có thể tạo thành là],
    (
        True([$72^8$]),
        [$8^72$],
        [$A_72^8$],
        [$C_72^8$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng quy tắc nhân cho dãy 8 vị trí độc lập, mỗi vị trí có thể nhận bất kỳ ký tự nào trong số 72 ký tự của bảng mã.
        Mỗi vị trí trong mật khẩu 8 ký tự có đúng $72$ cách chọn.
        Số mật khẩu tối đa có thể thiết lập là:
        $ 72 times 72 times ... times 72 = 72^8 approx 7.22 times 10^14 text(" mật khẩu") $
    ]
)

// TN 2 (Mật mã Caesar có CeTZ)
#tn([Mật mã Caesar cổ điển hoạt động bằng cách thay thế mỗi chữ cái trong bảng chữ cái tiếng Anh gồm $26$ chữ cái bằng chữ cái đứng sau nó $k$ vị trí theo vòng tròn ($1 <= k <= 25$). Hỏi có tất cả bao nhiêu khóa dịch chuyển Caesar khác nhau?],
    (
        True([$25$]),
        [$26$],
        [$24$],
        [$52$]
    ),
    loigiai: [
        *Phương pháp giải:* Khóa dịch chuyển $k$ trong mật mã Caesar là số nguyên thỏa mãn $1 <= k <= 25$ (vì $k = 0$ hoặc $k = 26$ sẽ đưa chữ cái về chính nó, không làm thay đổi bản rõ).
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.6, stroke: 1.2pt + gray)
          circle((0, 0), radius: 1.1, stroke: 1pt + accent)
          content((0, 0), [Caesar])
          let letters = ("A", "B", "C", "D", "E", "F", "G", "H")
          for i in range(8) {
            let a = 90deg - i * 45deg
            content((1.8 * calc.cos(a), 1.8 * calc.sin(a)), text(fill: black, letters.at(i)))
            // Dịch k = 3: A -> D
            let next_letter = letters.at(calc.rem(i + 3, 8))
            content((1.3 * calc.cos(a), 1.3 * calc.sin(a)), text(fill: accent, next_letter))
          }
        })
        ]
        Mỗi giá trị của $k in {1, 2, ..., 25}$ tương ứng với một phép biến đổi mã hóa duy nhất.
        Số khóa giải mã hợp lệ là: $25$ khóa.
    ]
)

// TN 3 (Mã PIN biến thiên độ dài không lặp chữ số)
#tn([Một khóa điện tử thông minh cho phép người dùng tạo mã PIN có độ dài từ $4$ đến $6$ chữ số lấy từ tập ${0, 1, 2, ..., 9}$. Để nâng cao độ an toàn, hệ thống yêu cầu trong mỗi mã PIN không được có chữ số nào xuất hiện quá một lần (chữ số đầu tiên có thể là số $0$). Có tất cả bao nhiêu mã PIN hợp lệ?],
    (
        True([$186480$]),
        [$151200$],
        [$35280$],
        [$1111100$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng chỉnh hợp và quy tắc cộng chia bài toán theo 3 độ dài mã PIN: 4 chữ số, 5 chữ số và 6 chữ số.
        - Mã PIN gồm 4 chữ số đôi một khác nhau:
          $ A_10^4 = 10 times 9 times 8 times 7 = 5040 text(" mã") $
        - Mã PIN gồm 5 chữ số đôi một khác nhau:
          $ A_10^5 = 10 times 9 times 8 times 7 times 6 = 30240 text(" mã") $
        - Mã PIN gồm 6 chữ số đôi một khác nhau:
          $ A_10^6 = 10 times 9 times 8 times 7 times 6 times 5 = 151200 text(" mã") $
        Theo quy tắc cộng:
        $ 5040 + 30240 + 151200 = 186480 text(" mã PIN") $
    ]
)

// TN 4 (Mô-đun RSA)
#tn([Trong hệ mật mã khóa công khai RSA, khóa công khai bao gồm một mô-đun $n = p times q$, trong đó $p$ và $q$ là hai số nguyên tố phân biệt lớn. Cho một tập hợp gồm $10$ số nguyên tố phân biệt. Hỏi có thể tạo ra bao nhiêu mô-đun RSA phân biệt từ tập hợp các số nguyên tố này?],
    (
        True([$45$]),
        [$90$],
        [$100$],
        [$20$]
    ),
    loigiai: [
        *Phương pháp giải:* Vì phép nhân có tính chất giao hoán ($p times q = q times p$), mỗi mô-đun $n$ tương ứng với một cách chọn ra $2$ số nguyên tố bất kỳ từ $10$ số nguyên tố (không phân biệt thứ tự).
        Số mô-đun RSA phân biệt là:
        $ C_10^2 = (10 times 9) / 2 = 45 text(" mô-đun") $
    ]
)

// TN 5 (Tổ hợp phân quyền truy cập)
#tn([Một trung tâm dữ liệu an ninh mạng có $7$ cấp độ quyền hạn từ Cấp 1 đến Cấp 7. Để giải mã một tập tin tuyệt mật, giao thức bảo mật yêu cầu phải có chữ ký điện tử của đúng $3$ chuyên viên thuộc $3$ cấp độ quyền hạn khác nhau. Có bao nhiêu cách chọn ra bộ $3$ cấp độ quyền hạn để phê duyệt lệnh giải mã?],
    (
        True([$35$]),
        [$210$],
        [$42$],
        [$84$]
    ),
    loigiai: [
        *Phương pháp giải:* Việc chọn 3 cấp độ quyền hạn từ 7 cấp độ là bài toán chọn tổ hợp chập 3 của 7 phần tử (không phân biệt thứ tự).
        Số cách chọn là:
        $ C_7^3 = (7 times 6 times 5) / (3 times 2 times 1) = 35 text(" cách") $
    ]
)

// TN 6 (Tấn công mạng qua cổng Honeypot)
#tn([Một tường lửa giám sát ghi nhận một chuỗi gồm $5$ gói tin độc hại liên tiếp tấn công vào hệ thống. Mỗi gói tin có thể nhắm vào một trong $4$ cổng dịch vụ: Cổng 80 (HTTP), Cổng 443 (HTTPS), Cổng 22 (SSH) hoặc Cổng 8080. Hỏi có bao nhiêu kịch bản tấn công mà trong đó Cổng 22 (SSH) bị nhắm vào ít nhất một lần?],
    (
        True([$781$]),
        [$1024$],
        [$243$],
        [$576$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp đếm bằng phần bù. Lấy tổng số kịch bản tấn công trừ đi số kịch bản mà Cổng 22 không bị nhắm vào lần nào.
        - Mỗi gói tin có 4 lựa chọn cổng tấn công. Tổng số kịch bản cho 5 gói tin:
          $ 4^5 = 1024 text(" kịch bản") $
        - Số kịch bản mà cả 5 gói tin chỉ nhắm vào 3 cổng còn lại (tránh Cổng 22):
          $ 3^5 = 243 text(" kịch bản") $
        - Số kịch bản có ít nhất một gói tin nhắm vào Cổng 22:
          $ 1024 - 243 = 781 text(" kịch bản") $
    ]
)

// TN 7 (Xác suất nhị thức trong phân tích rủi ro an ninh)
#tn([Trong một mạng thanh toán điện tử, xác suất để một giao dịch bị tấn công mạng thành công là $p = 0.05$. Một đợt kiểm toán thực hiện kiểm tra ngẫu nhiên $5$ giao dịch độc lập. Xác suất để trong $5$ giao dịch đó có đúng $1$ giao dịch bị tấn công thành công xấp xỉ bằng],
    (
        True([$0.2036$]),
        [$0.0500$],
        [$0.2500$],
        [$0.0407$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức phân bố nhị thức Bernoulli với $n = 5, k = 1, p = 0.05$:
        $ P(X = 1) = C_5^1 (0.05)^1 (1 - 0.05)^(5 - 1) = 5 times 0.05 times (0.95)^4 $
        Ta có $(0.95)^4 approx 0.81450625$.
        $ P(X = 1) approx 0.25 times 0.81450625 approx 0.2036 $
    ]
)

// TN 8 (Chia sẻ bí mật Shamir)
#tn([Một công ty an ninh mạng sử dụng sơ đồ chia sẻ bí mật ngưỡng $(3, 6)$ của Shamir để bảo vệ khóa mã hóa máy chủ. Khóa bí mật được chia thành $6$ mảnh ghép khác nhau được giữ bởi $6$ giám đốc. Khóa chỉ có thể khôi phục lại khi tập hợp được ít nhất $3$ mảnh ghép bất kỳ. Có bao nhiêu bộ gồm đúng $3$ mảnh ghép có thể khôi phục lại khóa?],
    (
        True([$20$]),
        [$120$],
        [$18$],
        [$6$]
    ),
    loigiai: [
        *Phương pháp giải:* Bộ 3 mảnh ghép bất kỳ trong số 6 mảnh ghép đều đủ điều kiện khôi phục khóa gốc theo nguyên lý nội suy đa thức Lagrange bậc hai.
        Số bộ 3 mảnh ghép là:
        $ C_6^3 = (6 times 5 times 4) / 6 = 20 text(" bộ") $
    ]
)

// TN 9 (Xung đột băm Hash Collision)
#tn([Một thuật toán băm (Hash Function) ánh xạ các chuỗi văn bản vào một không gian gồm $10$ giá trị băm phân biệt. Khi băm $4$ thông điệp khác nhau, có bao nhiêu khả năng để không có bất kỳ hai thông điệp nào bị trùng giá trị băm (tức không xảy ra xung đột băm)?],
    (
        True([$5040$]),
        [$10000$],
        [$210$],
        [$2520$]
    ),
    loigiai: [
        *Phương pháp giải:* Việc gán 4 giá trị băm đôi một khác nhau từ tập 10 giá trị cho 4 thông điệp có thứ tự là bài toán tính số chỉnh hợp chập 4 của 10 phần tử.
        Số khả năng là:
        $ A_10^4 = 10 times 9 times 8 times 7 = 5040 text(" khả năng") $
    ]
)

// TN 10 (Chuỗi khối Blockchain có CeTZ)
#tn([Một chuỗi khối (Blockchain) gồm Khối Genesis (Khối 0) cố định ở vị trí đầu tiên, theo sau bởi $5$ khối giao dịch $B_1, B_2, B_3, B_4, B_5$. Để xử lý hợp đồng thông minh, hai khối giao dịch $B_1$ và $B_2$ bắt buộc phải được đóng gói liền kề nhau trong chuỗi (theo thứ tự $B_1$ trước $B_2$ hoặc $B_2$ trước $B_1$). Có bao nhiêu cách liên kết chuỗi $5$ khối này?],
    (
        True([$48$]),
        [$120$],
        [$24$],
        [$96$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp buộc phần tử (Tie-up Method). Buộc hai khối $B_1, B_2$ thành một khối liên kết duy nhất $[B_1 B_2]$ hoặc $[B_2 B_1]$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (1.2, 0.7), fill: rgb("f1f5f9"), stroke: 1pt + black)
          content((0.6, 0.35), [Genesis])
          line((1.2, 0.35), (1.8, 0.35), mark: (end: "stealth"), stroke: 1pt + accent)
          
          rect((1.8, 0), (3.6, 0.7), fill: rgb("ffe4e6"), stroke: 1pt + accent)
          content((2.7, 0.35), [$[B_1 - B_2]$])
          line((3.6, 0.35), (4.2, 0.35), mark: (end: "stealth"), stroke: 1pt + accent)
          
          rect((4.2, 0), (5.0, 0.7), fill: rgb("f1f5f9"), stroke: 1pt + black)
          content((4.6, 0.35), [$B_3$])
          line((5.0, 0.35), (5.4, 0.35), mark: (end: "stealth"), stroke: 1pt + accent)
          
          rect((5.4, 0), (6.2, 0.7), fill: rgb("f1f5f9"), stroke: 1pt + black)
          content((5.8, 0.35), [$B_4$])
          line((6.2, 0.35), (6.6, 0.35), mark: (end: "stealth"), stroke: 1pt + accent)
          
          rect((6.6, 0), (7.4, 0.7), fill: rgb("f1f5f9"), stroke: 1pt + black)
          content((7.0, 0.35), [$B_5$])
        })
        ]
        - Hai khối $B_1, B_2$ có $2! = 2$ cách xếp nội bộ.
        - Khối liên kết này cùng với $3$ khối còn lại $B_3, B_4, B_5$ tạo thành $4$ phần tử:
          Số cách xếp thứ tự 4 phần tử là: $4! = 24$ cách.
        Theo quy tắc nhân:
        $ 2 times 24 = 48 text(" cách") $
    ]
)

// TN 11 (Vị trí ký tự chữ số trong mật khẩu)
#tn([Một mật khẩu bảo mật gồm đúng $6$ ký tự, trong đó có đúng $4$ chữ số và $2$ chữ cái in hoa. Có bao nhiêu cách lựa chọn vị trí cho $2$ chữ cái in hoa trong chuỗi $6$ ký tự của mật khẩu?],
    (
        True([$15$]),
        [$30$],
        [$360$],
        [$12$]
    ),
    loigiai: [
        *Phương pháp giải:* Đây là bài toán chọn không thứ tự $2$ vị trí trong số $6$ vị trí của mật khẩu để đặt các chữ cái.
        Số cách chọn vị trí là:
        $ C_6^2 = (6 times 5) / 2 = 15 text(" cách") $
    ]
)

// TN 12 (Số hạng chứa ẩn x trong nhị thức an ninh)
#tn([Trong khai triển của biểu thức độ tin cậy hệ thống $f(x) = (1 + 3x)^5$, hệ số của số hạng chứa $x^3$ bằng],
    (
        True([$270$]),
        [$90$],
        [$810$],
        [$30$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức số hạng tổng quát của nhị thức Newton: $T_(k + 1) = C_5^k 1^(5 - k) (3x)^k = C_5^k 3^k x^k$.
        Với số hạng chứa $x^3$, ta chọn $k = 3$:
        $ T_4 = C_5^3 3^3 x^3 = 10 times 27 times x^3 = 270 x^3 $
        Vậy hệ số cần tìm là $270$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân tích tấn công mạng)
#ds([Một máy chủ tường lửa ghi nhận chuỗi $5$ gói tin tấn công mạng độc hại liên tiếp vào $4$ cổng dịch vụ: Cổng 80, Cổng 443, Cổng 22, Cổng 8080.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số kịch bản tấn công có thể xảy ra của $5$ gói tin bằng $1024$.]),
    True([Số kịch bản tấn công mà Cổng 22 không bị nhắm vào lần nào bằng $243$.]),
    True([Số kịch bản tấn công mà Cổng 22 bị nhắm vào ít nhất một lần bằng $781$.]),
    [Số kịch bản tấn công mà tất cả các gói tin đều nhắm vào cùng một cổng mạng bằng $16$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Các kịch bản cổng mạng])
    - Tổng: $4^5 = 1024$. Mệnh đề a ĐÚNG.
    - Không qua cổng 22: $3^5 = 243$. Mệnh đề b ĐÚNG.
    - Ít nhất 1 lần qua cổng 22: $1024 - 243 = 781$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Cùng một cổng mạng])
    Có 4 cổng mạng, nên chỉ có đúng $4$ kịch bản (toàn cổng 80, toàn cổng 443, toàn cổng 22, toàn cổng 8080).
    Khẳng định bằng $16$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Mã hóa Caesar và giải mã)
#ds([Xét hệ mật mã dịch chuyển Caesar trên bảng chữ cái tiếng Anh gồm $26$ ký tự.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Có đúng $25$ khóa dịch chuyển hợp lệ $k in {1, 2, ..., 25}$.]),
    True([Nếu từ "CAT" được mã hóa với khóa $k = 3$, từ mã hóa thu được là "FDW".]),
    True([Nếu một kẻ tấn công thực hiện tấn công vét cạn (brute-force) thử tất cả các khóa dịch chuyển, kẻ đó cần thử tối đa $25$ lần để giải mã thành công.]),
    [Mật mã Caesar là hệ mật mã bảo mật an toàn tuyệt đối trước các máy tính hiện đại.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Tính chất mật mã Caesar])
    - Khóa dịch chuyển: $k in {1, ..., 25}$ (25 khóa). Mệnh đề a ĐÚNG.
    - $C -> F$, $A -> D$, $T -> W$, từ mã hóa là "FDW". Mệnh đề b ĐÚNG.
    - Không gian khóa chỉ có 25 khả năng nên tối đa 25 lần thử. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Độ an toàn])
    Mật mã Caesar có không gian khóa cực kỳ nhỏ ($25$ khóa) và dễ dàng bị bẻ khóa bằng phân tích tần suất ký tự, hoàn toàn không an toàn.
    Mệnh đề d SAI.
  ]
)

// DS 3 (Sơ đồ chia sẻ bí mật Shamir)
#ds([Xét sơ đồ chia sẻ bí mật ngưỡng $(3, 6)$ của Shamir gồm $6$ mảnh ghép khóa $S_1, S_2, ..., S_6$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số bộ gồm $3$ mảnh ghép có thể khôi phục lại khóa bí mật bằng $20$.]),
    True([Số bộ gồm $4$ mảnh ghép có thể khôi phục lại khóa bí mật bằng $15$.]),
    True([Bất kỳ bộ $2$ mảnh ghép nào cũng không thể khôi phục được thông tin về khóa bí mật.]),
    [Tổng số các bộ gồm từ $3$ đến $6$ mảnh ghép có khả năng khôi phục khóa bằng $50$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Ngưỡng Shamir (3, 6)])
    - Bộ 3 mảnh: $C_6^3 = 20$. Mệnh đề a ĐÚNG.
    - Bộ 4 mảnh: $C_6^4 = 15$. Mệnh đề b ĐÚNG.
    - Dưới ngưỡng ($k < 3$), hệ mật mã đạt tính an toàn thông tin hoàn hảo (Information-Theoretic Security). Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tổng số bộ khôi phục được khóa])
    $C_6^3 + C_6^4 + C_6^5 + C_6^6 = 20 + 15 + 6 + 1 = 42$ (chứ không phải $50$).
    Khẳng định bằng $50$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Mã PIN và không gian bảo mật)
#ds([Xét hệ thống mã PIN gồm $6$ chữ số lấy từ tập ${0, 1, ..., 9}$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số mã PIN gồm $6$ chữ số tùy ý (cho phép các chữ số lặp lại) bằng $10^6 = 1000000$.]),
    True([Số mã PIN gồm $6$ chữ số đôi một khác nhau bằng $151200$.]),
    True([Số mã PIN có ít nhất một chữ số bị lặp lại bằng $848800$.]),
    [Số mã PIN gồm $6$ chữ số có chữ số đầu tiên khác $0$ bằng $100000$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Đếm mã PIN])
    - Tùy ý: $10^6 = 1000000$. Mệnh đề a ĐÚNG.
    - Không lặp: $A_10^6 = 151200$. Mệnh đề b ĐÚNG.
    - Có ít nhất 1 số lặp lại: $1000000 - 151200 = 848800$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Chữ số đầu khác 0])
    Chữ số đầu có 9 cách, 5 chữ số sau mỗi vị trí có 10 cách: $9 times 10^5 = 900000$ (chứ không phải $100000$).
    Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Có bao nhiêu mã PIN có độ dài từ $4$ đến $6$ chữ số đôi một khác nhau lập từ tập ${0, 1, 2, ..., 9}$?],
    [186480],
    loigiai: [
        #step([Tổng 3 chỉnh hợp])
        $ A_10^4 + A_10^5 + A_10^6 = 5040 + 30240 + 151200 = 186480 text(" mã PIN") $
    ]
)

// TLN 2
#tln([Từ $10$ số nguyên tố phân biệt, có thể tạo ra bao nhiêu mô-đun RSA phân biệt $n = p times q$?],
    [45],
    loigiai: [
        #step([Tổ hợp C_10^2])
        $ C_10^2 = 45 text(" mô-đun") $
    ]
)

// TLN 3
#tln([Có $5$ gói tin tấn công vào $4$ cổng dịch vụ. Có bao nhiêu kịch bản mà cổng 22 bị nhắm vào ít nhất một lần?],
    [781],
    loigiai: [
        #step([Phần bù lũy thừa])
        $ 4^5 - 3^5 = 1024 - 243 = 781 text(" kịch bản") $
    ]
)

// TLN 4
#tln([Trong sơ đồ chia sẻ bí mật ngưỡng $(3, 6)$ của Shamir, có bao nhiêu bộ gồm đúng $3$ mảnh ghép có thể khôi phục khóa?],
    [20],
    loigiai: [
        #step([Tổ hợp C_6^3])
        $ C_6^3 = 20 text(" bộ") $
    ]
)

// TLN 5
#tln([Có bao nhiêu cách sắp xếp chuỗi $5$ khối Blockchain liên tiếp sao cho hai khối $B_1$ và $B_2$ luôn đứng cạnh nhau?],
    [48],
    loigiai: [
        #step([Buộc khối])
        $ 2! times 4! = 2 times 24 = 48 text(" cách") $
    ]
)

// TLN 6
#tln([Tìm hệ số của số hạng chứa $x^3$ trong khai triển nhị thức Newton $(1 + 3x)^5$.],
    [270],
    loigiai: [
        #step([Khai triển nhị thức])
        $ C_5^3 cdot 3^3 = 10 times 27 = 270 $
    ]
)

] // end make-questions

#make-questions()
