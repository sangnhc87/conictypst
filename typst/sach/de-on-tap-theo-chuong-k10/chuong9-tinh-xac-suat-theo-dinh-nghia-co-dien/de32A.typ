#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1e40af") // Classic Blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG IX: TÍNH XÁC SUẤT THEO ĐỊNH NGHĨA CỔ ĐIỂN",
  exam-title: "ÔN TẬP CUỐI CHƯƠNG IX: TÍNH XÁC SUẤT CỔ ĐIỂN (ĐỀ SỐ 32A)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "194",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Gieo 2 xúc xắc có tổng >= 10 có CeTZ)
#tn([Gieo đồng thời hai con xúc xắc cân đối và đồng chất. Xác suất để tổng số chấm xuất hiện trên mặt trên của hai con xúc xắc lớn hơn hoặc bằng $10$ bằng],
    (
        True([$1 / 6$]),
        [$5 / 36$],
        [$7 / 36$],
        [$1 / 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Liệt kê tất cả các cặp kết quả $(x, y)$ thỏa mãn $x + y >= 10$ trong không gian mẫu gồm $36$ phần tử.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for x in range(1, 7) {
            for y in range(1, 7) {
              if x + y >= 10 {
                rect((x * 0.5, y * 0.5), (x * 0.5 + 0.45, y * 0.5 + 0.45), fill: rgb("dbeafe"), stroke: 1pt + accent)
                content((x * 0.5 + 0.225, y * 0.5 + 0.225), text(fill: accent, size: 8pt, str(x) + str(y)))
              } else {
                rect((x * 0.5, y * 0.5), (x * 0.5 + 0.45, y * 0.5 + 0.45), stroke: 0.5pt + gray)
              }
            }
          }
          content((2.0, 0.2), [6 ô có tổng lớn hơn hoặc bằng 10])
        })
        ]
        - Không gian mẫu: $|Omega| = 6 times 6 = 36$.
        - Các cặp thỏa mãn $x + y >= 10$:
          + Tổng = 10: $(4, 6), (5, 5), (6, 4)$ ($3$ cặp).
          + Tổng = 11: $(5, 6), (6, 5)$ ($2$ cặp).
          + Tổng = 12: $(6, 6)$ ($1$ cặp).
          Số kết quả thuận lợi: $|A| = 3 + 2 + 1 = 6$.
        - Xác suất:
          $ P(A) = 6 / 36 = 1 / 6 $
    ]
)

// TN 2 (Hộp bi ít nhất 2 bi đỏ có CeTZ)
#tn([Một hộp chứa $6$ viên bi màu đỏ và $4$ viên bi màu xanh (các viên bi có kích thước và khối lượng như nhau). Lấy ngẫu nhiên đồng thời $3$ viên bi từ hộp. Xác suất để trong $3$ viên bi lấy ra có ít nhất hai viên bi màu đỏ bằng],
    (
        True([$2 / 3$]),
        [$1 / 2$],
        [$3 / 5$],
        [$17 / 24$]
    ),
    loigiai: [
        *Phương pháp giải:* Chia hai trường hợp: lấy được đúng 2 viên bi đỏ và 1 viên bi xanh, hoặc lấy được cả 3 viên bi đỏ.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (5.5, 1.2), stroke: 1.2pt + gray, fill: rgb("f8fafc"))
          // 6 bi đỏ
          for i in range(6) {
            circle((0.4 + i * 0.4, 0.6), radius: 0.15, fill: red, stroke: none)
          }
          // 4 bi xanh
          for i in range(4) {
            circle((3.2 + i * 0.4, 0.6), radius: 0.15, fill: blue, stroke: none)
          }
          content((2.75, -0.3), [Hộp 10 viên bi: 6 Đỏ - 4 Xanh])
        })
        ]
        - Không gian mẫu: $|Omega| = C_10^3 = (10 times 9 times 8) / 6 = 120$.
        - Trường hợp 1: Có đúng 2 đỏ và 1 xanh:
          $ C_6^2 times C_4^1 = 15 times 4 = 60 text(" cách") $
        - Trường hợp 2: Có cả 3 đỏ:
          $ C_6^3 = (6 times 5 times 4) / 6 = 20 text(" cách") $
        - Số kết quả thuận lợi: $|A| = 60 + 20 = 80$.
        - Xác suất:
          $ P(A) = 80 / 120 = 2 / 3 $
    ]
)

// TN 3 (Số tự nhiên 3 chữ số chia hết cho 3)
#tn([Từ tập hợp các chữ số $S = {1, 2, 3, 4, 5, 6}$, lập ngẫu nhiên một số tự nhiên gồm $3$ chữ số đôi một khác nhau. Xác suất để số được lập là một số chia hết cho $3$ bằng],
    (
        True([$2 / 5$]),
        [$1 / 3$],
        [$1 / 2$],
        [$3 / 10$]
    ),
    loigiai: [
        *Phương pháp giải:* Một số chia hết cho 3 khi và chỉ khi tổng các chữ số của nó chia hết cho 3. Phân hoạch tập $S$ thành 3 lớp thặng dư theo modulo 3.
        - Không gian mẫu: $|Omega| = A_6^3 = 6 times 5 times 4 = 120$.
        - Chia tập $S$ thành 3 lớp:
          $S_0 = {3, 6}$ ($2$ số); $S_1 = {1, 4}$ ($2$ số); $S_2 = {2, 5}$ ($2$ số).
        - Tổng 3 chữ số chia hết cho 3 khi mỗi lớp đóng góp đúng 1 chữ số:
          Chọn bộ 3 chữ số: $C_2^1 times C_2^1 times C_2^1 = 8$ bộ.
          Mỗi bộ hoán vị tạo thành $3! = 6$ số:
          Số kết quả thuận lợi: $|A| = 8 times 6 = 48$ số.
        - Xác suất:
          $ P(A) = 48 / 120 = 2 / 5 $
    ]
)

// TN 4 (Xếp hàng cách nhau đúng 1 bạn)
#tn([Xếp ngẫu nhiên $5$ bạn học sinh An, Bình, Cường, Dũng, Hoa thành một hàng ngang gồm $5$ vị trí. Xác suất để hai bạn An và Bình đứng cách nhau đúng một bạn học sinh khác bằng],
    (
        True([$3 / 10$]),
        [$2 / 5$],
        [$1 / 5$],
        [$3 / 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Liệt kê các vị trí khả dĩ cho cặp An và Bình sao cho giữa họ có đúng 1 vị trí trống: $(1, 3), (2, 4), (3, 5)$.
        - Không gian mẫu: $|Omega| = 5! = 120$.
        - Có 3 cặp vị trí cách nhau đúng 1 ô: $(1, 3), (2, 4), (3, 5)$.
        - Ở mỗi cặp vị trí, An và Bình có $2! = 2$ cách xếp.
        - Ba bạn còn lại xếp vào 3 vị trí còn lại: có $3! = 6$ cách.
        - Số kết quả thuận lợi: $|A| = 3 times 2 times 6 = 36$.
        - Xác suất:
          $ P(A) = 36 / 120 = 3 / 10 $
    ]
)

// TN 5 (Thẻ chia hết cho 10)
#tn([Một hộp có $50$ tấm thẻ cùng loại được đánh số thứ tự từ $1$ đến $50$. Rút ngẫu nhiên một tấm thẻ. Xác suất để số ghi trên tấm thẻ rút được chia hết cho cả $2$ và $5$ bằng],
    (
        True([$1 / 10$]),
        [$7 / 50$],
        [$1 / 5$],
        [$3 / 25$]
    ),
    loigiai: [
        *Phương pháp giải:* Một số chia hết cho cả 2 và 5 khi và chỉ khi nó chia hết cho bội chung nhỏ nhất là 10.
        - Không gian mẫu: $|Omega| = 50$.
        - Các số chia hết cho 10 trong đoạn từ 1 đến 50 là: ${10, 20, 30, 40, 50}$ (gồm 5 số).
        - Xác suất:
          $ P = 5 / 50 = 1 / 10 $
    ]
)

// TN 6 (Đa giác đều 10 đỉnh - Tam giác vuông)
#tn([Cho đa giác đều có $10$ đỉnh nội tiếp trong đường tròn. Chọn ngẫu nhiên $3$ đỉnh từ $10$ đỉnh của đa giác. Xác suất để $3$ đỉnh được chọn tạo thành một tam giác vuông bằng],
    (
        True([$1 / 3$]),
        [$2 / 3$],
        [$1 / 4$],
        [$5 / 12$]
    ),
    loigiai: [
        *Phương pháp giải:* Tam giác nội tiếp là tam giác vuông khi và chỉ khi có một cạnh là đường kính của đường tròn.
        - Không gian mẫu: $|Omega| = C_10^3 = (10 times 9 times 8) / 6 = 120$.
        - Có $10 / 2 = 5$ đường kính. Mỗi đường kính kết hợp với 1 trong 8 đỉnh còn lại tạo thành 1 tam giác vuông:
          Số tam giác vuông: $|A| = 5 times 8 = 40$.
        - Xác suất:
          $ P(A) = 40 / 120 = 1 / 3 $
    ]
)

// TN 7 (Bắn bia độc lập ít nhất 1 người trúng)
#tn([Hai xạ thủ cùng độc lập bắn mỗi người một phát đạn vào một tấm bia. Biết xác suất bắn trúng bia của xạ thủ thứ nhất là $0.8$ và của xạ thủ thứ hai là $0.7$. Xác suất để có ít nhất một xạ thủ bắn trúng bia bằng],
    (
        True([$0.94$]),
        [$0.56$],
        [$0.86$],
        [$0.90$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng biến cố đối: cả hai xạ thủ đều bắn trượt.
        - Xác suất xạ thủ 1 bắn trượt: $1 - 0.8 = 0.2$.
        - Xác suất xạ thủ 2 bắn trượt: $1 - 0.7 = 0.3$.
        - Xác suất cả hai cùng trượt: $(0.2) times (0.3) = 0.06$.
        - Xác suất có ít nhất một người trúng:
          $ P = 1 - 0.06 = 0.94 $
    ]
)

// TN 8 (Chọn đội tuyển có cả nam và nữ)
#tn([Một nhóm học sinh xuất sắc gồm $6$ bạn nam và $5$ bạn nữ. Thầy giáo chọn ngẫu nhiên $4$ bạn để tham gia cuộc thi học sinh giỏi cấp trường. Xác suất để trong $4$ bạn được chọn có cả bạn nam và bạn nữ bằng],
    (
        True([$31 / 33$]),
        [$2 / 33$],
        [$30 / 33$],
        [$29 / 33$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng biến cố đối: nhóm 4 bạn được chọn chỉ toàn nam hoặc chỉ toàn nữ.
        - Không gian mẫu: $|Omega| = C_11^4 = 330$.
        - Số nhóm chỉ toàn nam: $C_6^4 = 15$.
        - Số nhóm chỉ toàn nữ: $C_5^4 = 5$.
        - Số nhóm có cả nam và nữ: $|A| = 330 - (15 + 5) = 310$.
        - Xác suất:
          $ P(A) = 310 / 330 = 31 / 33 $
    ]
)

// TN 9 (Đồng xu 5 lần - Số mặt sấp là số chẵn)
#tn([Gieo một đồng xu cân đối và đồng chất $5$ lần liên tiếp. Xác suất để số lần xuất hiện mặt sấp là một số chẵn (tính cả $0$ lần) bằng],
    (
        True([$1 / 2$]),
        [$5 / 16$],
        [$7 / 16$],
        [$9 / 16$]
    ),
    loigiai: [
        *Phương pháp giải:* Số mặt sấp là số chẵn khi có 0, 2 hoặc 4 mặt sấp.
        - Không gian mẫu: $|Omega| = 2^5 = 32$.
        - Số kết quả có 0 mặt sấp: $C_5^0 = 1$.
        - Số kết quả có 2 mặt sấp: $C_5^2 = 10$.
        - Số kết quả có 4 mặt sấp: $C_5^4 = 5$.
        - Tổng số kết quả thuận lợi: $1 + 10 + 5 = 16$.
        - Xác suất:
          $ P = 16 / 32 = 1 / 2 $
    ]
)

// TN 10 (Rút 2 thẻ có tổng chẵn)
#tn([Một hộp có $20$ tấm thẻ được đánh số từ $1$ đến $20$. Rút ngẫu nhiên đồng thời $2$ tấm thẻ. Xác suất để tổng các số ghi trên hai thẻ rút được là một số chẵn bằng],
    (
        True([$9 / 19$]),
        [$10 / 19$],
        [$1 / 2$],
        [$8 / 19$]
    ),
    loigiai: [
        *Phương pháp giải:* Có 10 số chẵn và 10 số lẻ. Tổng 2 số là chẵn khi cả 2 số cùng là số chẵn hoặc cả 2 số cùng là số lẻ.
        - Không gian mẫu: $|Omega| = C_20^2 = 190$.
        - Rút 2 số cùng chẵn: $C_10^2 = 45$ cách.
        - Rút 2 số cùng lẻ: $C_10^2 = 45$ cách.
        - Số kết quả thuận lợi: $|A| = 45 + 45 = 90$.
        - Xác suất:
          $ P(A) = 90 / 190 = 9 / 19 $
    ]
)

// TN 11 (Cùng tháng sinh)
#tn([Chọn ngẫu nhiên $2$ người độc lập. Giả sử khả năng sinh vào $12$ tháng trong năm của mỗi người là như nhau. Xác suất để hai người đó sinh vào cùng một tháng trong năm bằng],
    (
        True([$1 / 12$]),
        [$1 / 144$],
        [$11 / 12$],
        [$1 / 6$]
    ),
    loigiai: [
        *Phương pháp giải:* Người thứ nhất sinh vào một tháng bất kỳ (xác suất 1). Người thứ hai có xác suất $1 / 12$ để trùng tháng sinh với người thứ nhất.
        $ P = 1 / 12 $
    ]
)

// TN 12 (Tổng số chấm là số chia hết cho 5)
#tn([Gieo đồng thời hai con xúc xắc cân đối và đồng chất. Xác suất để tổng số chấm xuất hiện trên hai con xúc xắc chia hết cho $5$ bằng],
    (
        True([$7 / 36$]),
        [$1 / 6$],
        [$5 / 36$],
        [$2 / 9$]
    ),
    loigiai: [
        *Phương pháp giải:* Tổng số chấm trên 2 con xúc xắc nhận giá trị từ 2 đến 12. Tổng chia hết cho 5 khi tổng bằng 5 hoặc bằng 10.
        - Tổng bằng 5: $(1, 4), (2, 3), (3, 2), (4, 1)$ ($4$ kết quả).
        - Tổng bằng 10: $(4, 6), (5, 5), (6, 4)$ ($3$ kết quả).
        - Tổng số kết quả thuận lợi: $4 + 3 = 7$.
        - Xác suất:
          $ P = 7 / 36 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân tích hộp bi đỏ xanh)
#ds([Một hộp chứa $6$ viên bi màu đỏ và $4$ viên bi màu xanh. Lấy ngẫu nhiên đồng thời $3$ viên bi từ hộp.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $120$.]),
    True([Số cách lấy được đúng $2$ viên bi đỏ và $1$ viên bi xanh bằng $60$.]),
    True([Xác suất để lấy được ít nhất hai viên bi màu đỏ bằng $2 / 3$.]),
    [Xác suất để trong $3$ viên bi lấy ra có cả hai màu bằng $1 / 6$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Các trường hợp bi])
    - Không gian mẫu: $C_10^3 = 120$. Mệnh đề a ĐÚNG.
    - Đúng 2 đỏ 1 xanh: $C_6^2 times C_4^1 = 15 times 4 = 60$. Mệnh đề b ĐÚNG.
    - Ít nhất 2 đỏ: $(60 + 20) / 120 = 80 / 120 = 2 / 3$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Có cả hai màu])
    Biến cố đối là 3 bi cùng màu: $C_6^3 + C_4^3 = 20 + 4 = 24$.
    Xác suất có cả 2 màu: $1 - 24 / 120 = 96 / 120 = 4 / 5$ (chứ không phải $1 / 6$). Mệnh đề d SAI.
  ]
)

// DS 2 (Bắn súng hai xạ thủ)
#ds([Xét hai xạ thủ độc lập bắn vào bia với xác suất trúng lần lượt là $p_1 = 0.8$ và $p_2 = 0.7$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Xác suất để cả hai xạ thủ cùng bắn trượt bằng $0.06$.]),
    True([Xác suất để cả hai xạ thủ cùng bắn trúng bằng $0.56$.]),
    True([Xác suất để có ít nhất một xạ thủ bắn trúng bằng $0.94$.]),
    [Xác suất để có đúng một xạ thủ bắn trúng lớn hơn $0.50$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Hai xạ thủ độc lập])
    - Cùng trượt: $(0.2)(0.3) = 0.06$. Mệnh đề a ĐÚNG.
    - Cùng trúng: $(0.8)(0.7) = 0.56$. Mệnh đề b ĐÚNG.
    - Ít nhất 1 trúng: $1 - 0.06 = 0.94$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Đúng một người trúng])
    $0.8(0.3) + 0.2(0.7) = 0.24 + 0.14 = 0.38 < 0.50$.
    Khẳng định lớn hơn $0.50$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Đa giác đều 10 đỉnh)
#ds([Cho đa giác đều có $10$ đỉnh nội tiếp trong đường tròn. Chọn ngẫu nhiên $3$ đỉnh của đa giác để tạo thành một tam giác.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $120$.]),
    True([Số tam giác vuông có $3$ đỉnh là đỉnh của đa giác bằng $40$.]),
    True([Xác suất để tam giác được tạo thành là tam giác vuông bằng $1 / 3$.]),
    [Xác suất để tam giác được tạo thành là tam giác tù nhỏ hơn $0.40$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Tam giác vuông])
    - Không gian mẫu: $C_10^3 = 120$. Mệnh đề a ĐÚNG.
    - Tam giác vuông: $5 times 8 = 40$. Mệnh đề b ĐÚNG.
    - Xác suất tam giác vuông: $40 / 120 = 1 / 3$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tam giác tù])
    Mỗi đỉnh làm đỉnh tù có $C_4^2 = 6$ tam giác, với 10 đỉnh có $10 times 6 = 60$ tam giác tù.
    Xác suất: $60 / 120 = 1 / 2 = 0.50 > 0.40$. Mệnh đề d SAI.
  ]
)

// DS 4 (Tập hợp thẻ số từ 1 đến 20)
#ds([Một hộp chứa $20$ tấm thẻ được đánh số từ $1$ đến $20$. Rút ngẫu nhiên đồng thời $2$ tấm thẻ.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $190$.]),
    True([Số cách rút được $2$ thẻ đều ghi số lẻ bằng $45$.]),
    True([Xác suất để tổng các số ghi trên $2$ thẻ là một số chẵn bằng $9 / 19$.]),
    [Xác suất để tổng các số ghi trên $2$ thẻ là một số lẻ bằng $1 / 2$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Tổng chẵn])
    - Không gian mẫu: $C_20^2 = 190$. Mệnh đề a ĐÚNG.
    - 2 số lẻ: $C_10^2 = 45$. Mệnh đề b ĐÚNG.
    - Tổng chẵn: $(45 + 45) / 190 = 9 / 19$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tổng lẻ])
    Biến cố đối của tổng chẵn: $1 - 9 / 19 = 10 / 19 != 1 / 2$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Gieo hai con xúc xắc cân đối. Tính xác suất để tổng số chấm xuất hiện lớn hơn hoặc bằng $10$ (dưới dạng phân số tối giản).],
    [1/6],
    loigiai: [
        #step([Tính xác suất])
        $ 6 / 36 = 1 / 6 $
    ]
)

// TLN 2
#tln([Lấy ngẫu nhiên $3$ viên bi từ hộp có $6$ đỏ và $4$ xanh. Tính xác suất lấy được ít nhất $2$ viên bi đỏ (dưới dạng phân số tối giản).],
    [2/3],
    loigiai: [
        #step([Tính xác suất])
        $ 80 / 120 = 2 / 3 $
    ]
)

// TLN 3
#tln([Từ tập ${1, 2, ..., 6}$, lập số có $3$ chữ số khác nhau. Tính xác suất để số đó chia hết cho $3$ (dưới dạng phân số tối giản).],
    [2/5],
    loigiai: [
        #step([Tính xác suất])
        $ 48 / 120 = 2 / 5 $
    ]
)

// TLN 4
#tln([Xếp $5$ bạn học sinh (trong đó có An và Bình) thành hàng ngang. Tính xác suất để An và Bình đứng cách nhau đúng một bạn (dưới dạng phân số tối giản).],
    [3/10],
    loigiai: [
        #step([Tính xác suất])
        $ 36 / 120 = 3 / 10 $
    ]
)

// TLN 5
#tln([Hai xạ thủ độc lập có xác suất trúng là $0.8$ và $0.7$. Tính xác suất có ít nhất một người bắn trúng bia.],
    [0.94],
    loigiai: [
        #step([Biến cố đối])
        $ 1 - (0.2)(0.3) = 0.94 $
    ]
)

// TLN 6
#tln([Từ $10$ đỉnh của đa giác đều, có bao nhiêu tam giác vuông được tạo thành?],
    [40],
    loigiai: [
        #step([Chọn đường kính])
        $ 5 times 8 = 40 $
    ]
)

] // end make-questions

#make-questions()
