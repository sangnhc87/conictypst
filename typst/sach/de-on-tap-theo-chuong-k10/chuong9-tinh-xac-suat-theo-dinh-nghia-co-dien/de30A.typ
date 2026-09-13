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
  exam-title: "BÀI 26: BIẾN CỐ VÀ ĐỊNH NGHĨA CỔ ĐIỂN CỦA XÁC SUẤT (ĐỀ SỐ 30A)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "188",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Gieo 2 xúc xắc có CeTZ)
#tn([Gieo đồng thời hai con xúc xắc cân đối và đồng chất. Xác suất để tổng số chấm xuất hiện trên mặt trên của hai con xúc xắc bằng $8$ là],
    (
        True([$5 / 36$]),
        [$1 / 6$],
        [$1 / 9$],
        [$7 / 36$]
    ),
    loigiai: [
        *Phương pháp giải:* Xác định không gian mẫu $|Omega| = 6 times 6 = 36$. Liệt kê các kết quả thuận lợi cho biến cố $A$: "Tổng số chấm của hai con xúc xắc bằng 8", sau đó tính tỉ số $P(A) = (|A|) / (|Omega|)$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for x in range(1, 7) {
            for y in range(1, 7) {
              if x + y == 8 {
                rect((x * 0.5, y * 0.5), (x * 0.5 + 0.45, y * 0.5 + 0.45), fill: rgb("dbeafe"), stroke: 1pt + accent)
                content((x * 0.5 + 0.225, y * 0.5 + 0.225), text(fill: accent, size: 8pt, str(x) + str(y)))
              } else {
                rect((x * 0.5, y * 0.5), (x * 0.5 + 0.45, y * 0.5 + 0.45), stroke: 0.5pt + gray)
              }
            }
          }
          content((2.0, 0.2), [Lưới không gian mẫu 36 ô, 5 ô có tổng bằng 8])
        })
        ]
        - Không gian mẫu gồm $36$ kết quả đồng khả năng:
          $ |Omega| = 6 times 6 = 36 $
        - Các cặp kết quả thuận lợi có tổng bằng 8:
          $ A = {(2, 6), (3, 5), (4, 4), (5, 3), (6, 2)} => |A| = 5 $
        - Xác suất cần tìm:
          $ P(A) = (|A|) / (|Omega|) = 5 / 36 $
    ]
)

// TN 2 (Hộp bi nhiều màu có CeTZ)
#tn([Một hộp chứa $5$ viên bi màu đỏ, $4$ viên bi màu xanh và $3$ viên bi màu vàng (các viên bi có kích thước và khối lượng như nhau). Lấy ngẫu nhiên đồng thời $3$ viên bi từ hộp. Xác suất để trong $3$ viên bi lấy ra có đủ cả ba màu là],
    (
        True([$3 / 11$]),
        [$6 / 11$],
        [$3 / 22$],
        [$1 / 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng quy tắc tổ hợp tính số phần tử của không gian mẫu và biến cố. Lấy 3 viên có đủ 3 màu tương ứng với việc chọn mỗi màu đúng 1 viên bi.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (5.5, 1.2), stroke: 1.2pt + gray, fill: rgb("f8fafc"))
          // 5 bi đỏ
          for i in range(5) {
            circle((0.4 + i * 0.35, 0.6), radius: 0.14, fill: red, stroke: none)
          }
          // 4 bi xanh
          for i in range(4) {
            circle((2.4 + i * 0.35, 0.6), radius: 0.14, fill: blue, stroke: none)
          }
          // 3 bi vàng
          for i in range(3) {
            circle((4.1 + i * 0.35, 0.6), radius: 0.14, fill: orange, stroke: none)
          }
          content((2.75, -0.3), [Hộp 12 viên bi: 5 Đỏ - 4 Xanh - 3 Vàng])
        })
        ]
        - Tổng số viên bi trong hộp: $5 + 4 + 3 = 12$ viên.
        - Số phần tử của không gian mẫu:
          $ |Omega| = C_12^3 = (12 times 11 times 10) / (3 times 2 times 1) = 220 $
        - Số kết quả thuận lợi (chọn 1 đỏ, 1 xanh, 1 vàng):
          $ |A| = C_5^1 times C_4^1 times C_3^1 = 5 times 4 times 3 = 60 $
        - Xác suất cần tìm:
          $ P(A) = 60 / 220 = 3 / 11 $
    ]
)

// TN 3 (Xác suất số chia hết cho 5)
#tn([Từ tập hợp các chữ số $S = {1, 2, 3, 4, 5, 6, 7}$, người ta lập ngẫu nhiên một số tự nhiên gồm $4$ chữ số đôi một khác nhau. Xác suất để số được lập là một số chia hết cho $5$ bằng],
    (
        True([$1 / 7$]),
        [$1 / 5$],
        [$2 / 7$],
        [$4 / 35$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu là số chỉnh hợp chập 4 của 7 chữ số. Số chia hết cho 5 bắt buộc chữ số tận cùng phải bằng 5.
        - Số phần tử của không gian mẫu:
          $ |Omega| = A_7^4 = 7 times 6 times 5 times 4 = 840 $
        - Gọi $A$ là biến cố số lập được chia hết cho 5. Số có dạng $overline(a b c d)$:
          + Chữ số tận cùng $d = 5$: có $1$ cách chọn.
          + Ba chữ số đầu $a, b, c$ được chọn từ $6$ chữ số còn lại: có $A_6^3 = 6 times 5 times 4 = 120$ cách.
          Số kết quả thuận lợi: $|A| = 1 times 120 = 120$.
        - Xác suất:
          $ P(A) = 120 / 840 = 1 / 7 $
    ]
)

// TN 4 (Xếp hàng hai bạn cạnh nhau)
#tn([Một nhóm gồm $6$ bạn học sinh (trong đó có hai bạn An và Bình) được xếp ngẫu nhiên thành một hàng ngang. Xác suất để An và Bình đứng cạnh nhau bằng],
    (
        True([$1 / 3$]),
        [$1 / 6$],
        [$1 / 2$],
        [$2 / 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp buộc phần tử tính số phần tử thuận lợi, không gian mẫu là số hoán vị của 6 học sinh.
        - Không gian mẫu: $|Omega| = 6! = 720$.
        - Gọi biến cố $A$: "An và Bình đứng cạnh nhau":
          + Buộc An và Bình thành một khối: có $2! = 2$ cách đổi chỗ.
          + Xếp khối này cùng $4$ bạn còn lại (gồm 5 phần tử): có $5! = 120$ cách.
          Số kết quả thuận lợi: $|A| = 2 times 120 = 240$.
        - Xác suất:
          $ P(A) = 240 / 720 = 1 / 3 $
    ]
)

// TN 5 (Biến cố đối - Ít nhất 1 phế phẩm)
#tn([Một kiện hàng gồm $10$ linh kiện điện tử, trong đó có $7$ linh kiện tốt và $3$ linh kiện bị khuyết tật. Kỹ thuật viên kiểm tra chất lượng chọn ngẫu nhiên đồng thời $3$ linh kiện. Xác suất để có ít nhất một linh kiện bị khuyết tật trong $3$ linh kiện được lấy ra là],
    (
        True([$17 / 24$]),
        [$7 / 24$],
        [$3 / 10$],
        [$7 / 10$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức biến cố đối: $P(A) = 1 - P(overline(A))$, trong đó $overline(A)$ là biến cố "Cả 3 linh kiện lấy ra đều là linh kiện tốt".
        - Không gian mẫu: $|Omega| = C_10^3 = (10 times 9 times 8) / 6 = 120$.
        - Số cách chọn 3 linh kiện đều tốt:
          $ |overline(A)| = C_7^3 = (7 times 6 times 5) / 6 = 35 $
        - Xác suất biến cố đối:
          $ P(overline(A)) = 35 / 120 = 7 / 24 $
        - Xác suất biến cố $A$:
          $ P(A) = 1 - P(overline(A)) = 1 - 7 / 24 = 17 / 24 $
    ]
)

// TN 6 (Gieo đồng xu 4 lần)
#tn([Gieo một đồng xu cân đối và đồng chất $4$ lần liên tiếp. Xác suất để số lần xuất hiện mặt sấp nhiều hơn số lần xuất hiện mặt ngửa là],
    (
        True([$5 / 16$]),
        [$1 / 2$],
        [$3 / 8$],
        [$1 / 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Xác định không gian mẫu $|Omega| = 2^4 = 16$. Liệt kê các trường hợp số mặt sấp ($S$) lớn hơn số mặt ngửa ($N$).
        - Không gian mẫu: $|Omega| = 2^4 = 16$.
        - Số mặt sấp nhiều hơn mặt ngửa xảy ra khi:
          + Xuất hiện đúng 4 mặt sấp: có $C_4^4 = 1$ cách.
          + Xuất hiện đúng 3 mặt sấp và 1 mặt ngửa: có $C_4^3 = 4$ cách.
        - Số kết quả thuận lợi: $|A| = 1 + 4 = 5$.
        - Xác suất:
          $ P(A) = 5 / 16 $
    ]
)

// TN 7 (Đa giác đều 12 đỉnh - Tam giác vuông)
#tn([Chọn ngẫu nhiên $3$ đỉnh từ $12$ đỉnh của một đa giác đều nội tiếp đường tròn. Xác suất để $3$ đỉnh được chọn tạo thành một tam giác vuông bằng],
    (
        True([$3 / 11$]),
        [$6 / 11$],
        [$1 / 4$],
        [$1 / 11$]
    ),
    loigiai: [
        *Phương pháp giải:* Tam giác nội tiếp là tam giác vuông khi và chỉ khi có một cạnh là đường kính của đường tròn.
        - Không gian mẫu: $|Omega| = C_12^3 = 220$.
        - Đa giác đều có $12 / 2 = 6$ đường kính qua tâm.
        - Mỗi đường kính kết hợp với 1 trong 10 đỉnh còn lại tạo thành đúng 1 tam giác vuông:
          Số tam giác vuông: $|A| = 6 times 10 = 60$.
        - Xác suất:
          $ P(A) = 60 / 220 = 3 / 11 $
    ]
)

// TN 8 (Chọn hai học sinh cùng giới tính)
#tn([Một câu lạc bộ có $18$ bạn nam và $12$ bạn nữ. Ban chủ nhiệm chọn ngẫu nhiên đồng thời $2$ bạn để làm MC cho buổi lễ. Xác suất để hai bạn được chọn có cùng giới tính (cùng là nam hoặc cùng là nữ) bằng],
    (
        True([$73 / 145$]),
        [$72 / 145$],
        [$1 / 2$],
        [$36 / 145$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng quy tắc cộng xác suất cho hai biến cố xung khắc: chọn được 2 nam hoặc chọn được 2 nữ.
        - Tổng số thành viên: $18 + 12 = 30$ người.
        - Không gian mẫu: $|Omega| = C_30^2 = (30 times 29) / 2 = 435$.
        - Số kết quả chọn 2 nam: $C_18^2 = (18 times 17) / 2 = 153$.
        - Số kết quả chọn 2 nữ: $C_12^2 = (12 times 11) / 2 = 66$.
        - Số kết quả thuận lợi: $|A| = 153 + 66 = 219$.
        - Xác suất:
          $ P(A) = 219 / 435 = 73 / 145 $
    ]
)

// TN 9 (Thẻ chia hết cho 3 hoặc 5)
#tn([Một hộp có $30$ tấm thẻ được đánh số thứ tự từ $1$ đến $30$. Rút ngẫu nhiên một tấm thẻ từ hộp. Xác suất để số ghi trên tấm thẻ rút được chia hết cho $3$ hoặc chia hết cho $5$ bằng],
    (
        True([$7 / 15$]),
        [$1 / 2$],
        [$8 / 15$],
        [$2 / 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng nguyên lý bù trừ PIE tính số phần tử của biến cố hợp $A cup B$: $|A cup B| = |A| + |B| - |A inter B|$.
        - Không gian mẫu: $|Omega| = 30$.
        - Gọi $A$ là biến cố số chia hết cho 3: $|A| = floor(30 / 3) = 10$.
        - Gọi $B$ là biến cố số chia hết cho 5: $|B| = floor(30 / 5) = 6$.
        - $A inter B$ là biến cố số chia hết cho cả 3 và 5 (chia hết cho 15): $|A inter B| = floor(30 / 15) = 2$.
        - Số kết quả thuận lợi:
          $ |A cup B| = 10 + 6 - 2 = 14 $
        - Xác suất:
          $ P(A cup B) = 14 / 30 = 7 / 15 $
    ]
)

// TN 10 (Tổng các chữ số là số chẵn)
#tn([Từ tập hợp các chữ số $X = {1, 2, 3, 4, 5, 6}$, chọn ngẫu nhiên một số tự nhiên gồm $3$ chữ số đôi một khác nhau. Xác suất để tổng các chữ số của số được chọn là một số chẵn bằng],
    (
        True([$1 / 2$]),
        [$2 / 5$],
        [$3 / 5$],
        [$7 / 15$]
    ),
    loigiai: [
        *Phương pháp giải:* Tập $X$ có 3 số lẻ ${1, 3, 5}$ và 3 số chẵn ${2, 4, 6}$. Tổng 3 số là số chẵn khi cả 3 số đều chẵn hoặc có đúng 1 số chẵn và 2 số lẻ.
        - Không gian mẫu: $|Omega| = A_6^3 = 6 times 5 times 4 = 120$.
        - Trường hợp 1: Ba chữ số đều chẵn: có $A_3^3 = 6$ số.
        - Trường hợp 2: Có 1 chẵn và 2 lẻ:
          Chọn 1 chẵn từ 3 chẵn: $C_3^1 = 3$ cách.
          Chọn 2 lẻ từ 3 lẻ: $C_3^2 = 3$ cách.
          Hoán vị 3 chữ số: $3! = 6$ cách.
          Số lượng: $3 times 3 times 6 = 54$ số.
        - Số kết quả thuận lợi: $|A| = 6 + 54 = 60$.
        - Xác suất:
          $ P(A) = 60 / 120 = 1 / 2 $
    ]
)

// TN 11 (Bắn súng độc lập 2 người)
#tn([Hai xạ thủ cùng độc lập bắn mỗi người một viên đạn vào một tấm bia. Biết xác suất bắn trúng bia của xạ thủ thứ nhất là $0.8$ và của xạ thủ thứ hai là $0.7$. Xác suất để có đúng một xạ thủ bắn trúng bia bằng],
    (
        True([$0.38$]),
        [$0.56$],
        [$0.24$],
        [$0.14$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng quy tắc nhân cho các biến cố độc lập và quy tắc cộng cho các trường hợp xung khắc.
        Gọi $A_1, A_2$ lần lượt là biến cố xạ thủ 1 và xạ thủ 2 bắn trúng:
        $P(A_1) = 0.8 => P(overline(A)_1) = 0.2$; $P(A_2) = 0.7 => P(overline(A)_2) = 0.3$.
        Biến cố $B$: "Có đúng một xạ thủ bắn trúng bia":
        $ P(B) = P(A_1) P(overline(A)_2) + P(overline(A)_1) P(A_2) $
        $ = (0.8)(0.3) + (0.2)(0.7) = 0.24 + 0.14 = 0.38 $
    ]
)

// TN 12 (Sinh cùng quý)
#tn([Chọn ngẫu nhiên $4$ người độc lập. Giả sử khả năng sinh vào $4$ quý trong năm của mỗi người là như nhau (xác suất mỗi quý là $1 / 4$). Xác suất để có ít nhất hai người sinh cùng một quý trong năm bằng],
    (
        True([$29 / 32$]),
        [$3 / 32$],
        [$1 / 4$],
        [$3 / 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng biến cố đối $overline(A)$: "Cả 4 người sinh vào 4 quý hoàn toàn khác nhau".
        - Mỗi người có 4 khả năng về quý sinh. Số phần tử không gian mẫu:
          $ |Omega| = 4^4 = 256 $
        - Số khả năng 4 người sinh vào 4 quý phân biệt:
          $ |overline(A)| = 4! = 24 $
        - Xác suất biến cố đối:
          $ P(overline(A)) = 24 / 256 = 3 / 32 $
        - Xác suất có ít nhất 2 người cùng quý:
          $ P(A) = 1 - P(overline(A)) = 1 - 3 / 32 = 29 / 32 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Gieo hai con xúc xắc)
#ds([Gieo đồng thời hai con xúc xắc cân đối và đồng chất.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Không gian mẫu của phép thử có tất cả $36$ phần tử.]),
    True([Xác suất để tích số chấm trên hai con xúc xắc là một số lẻ bằng $1 / 4$.]),
    True([Xác suất để tổng số chấm trên hai con xúc xắc lớn hơn hoặc bằng $10$ bằng $1 / 6$.]),
    [Xác suất để có ít nhất một con xúc xắc xuất hiện mặt $6$ chấm bằng $1 / 2$.]
  ),
  loigiai: [
    #step([Xét ý a: Không gian mẫu])
    $|Omega| = 6 times 6 = 36$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Tích là số lẻ])
    Tích lẻ khi cả 2 con đều ra mặt lẻ ($1, 3, 5$): $3 times 3 = 9$ kết quả.
    $P = 9 / 36 = 1 / 4$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Tổng >= 10])
    Các cặp có tổng $>= 10$: $(4,6), (5,5), (5,6), (6,4), (6,5), (6,6)$ (6 kết quả).
    $P = 6 / 36 = 1 / 6$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Ít nhất một mặt 6 chấm])
    Biến cố đối: cả hai đều không ra 6 chấm: $5 times 5 = 25$ kết quả.
    Xác suất ít nhất một mặt 6 chấm: $1 - 25 / 36 = 11 / 36$ (chứ không phải $1 / 2$). Mệnh đề d SAI.
  ]
)

// DS 2 (Hộp bi nhiều màu)
#ds([Một hộp chứa $5$ viên bi đỏ, $4$ viên bi xanh và $3$ viên bi vàng. Lấy ngẫu nhiên đồng thời $3$ viên bi từ hộp.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $220$.]),
    True([Số cách lấy ra $3$ viên bi cùng một màu bằng $15$.]),
    True([Xác suất để trong $3$ viên bi lấy ra có đủ cả ba màu bằng $3 / 11$.]),
    [Xác suất để trong $3$ viên bi lấy ra không có viên bi nào màu đỏ bằng $1 / 2$.]
  ),
  loigiai: [
    #step([Xét ý a: Không gian mẫu])
    $|Omega| = C_12^3 = 220$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Ba viên cùng màu])
    $C_5^3 + C_4^3 + C_3^3 = 10 + 4 + 1 = 15$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Đủ ba màu])
    $C_5^1 C_4^1 C_3^1 = 60 => P = 60 / 220 = 3 / 11$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Không có viên đỏ nào])
    Chọn 3 viên từ 7 viên (xanh + vàng): $C_7^3 = 35$.
    Xác suất: $35 / 220 = 7 / 44$ (chứ không phải $1 / 2$). Mệnh đề d SAI.
  ]
)

// DS 3 (Đa giác đều 12 đỉnh và xác suất tam giác)
#ds([Cho đa giác đều gồm $12$ đỉnh nội tiếp trong đường tròn. Chọn ngẫu nhiên $3$ đỉnh từ $12$ đỉnh của đa giác để tạo thành một tam giác.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $220$.]),
    True([Xác suất để tam giác được tạo thành là tam giác vuông bằng $3 / 11$.]),
    True([Xác suất để tam giác được tạo thành là tam giác nhọn bằng $2 / 11$.]),
    [Xác suất để tam giác được tạo thành là tam giác đều bằng $1 / 10$.]
  ),
  loigiai: [
    #step([Xét ý a: Không gian mẫu])
    $C_12^3 = 220$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Tam giác vuông])
    Số tam giác vuông: $6 times 10 = 60 => P = 60 / 220 = 3 / 11$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Tam giác nhọn])
    Số tam giác nhọn bằng $40 => P = 40 / 220 = 2 / 11$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tam giác đều])
    Số tam giác đều bằng $12 / 3 = 4$.
    Xác suất: $4 / 220 = 1 / 55$ (chứ không phải $1 / 10$). Mệnh đề d SAI.
  ]
)

// DS 4 (Tập hợp thẻ số)
#ds([Một hộp chứa $20$ tấm thẻ cùng loại được đánh số từ $1$ đến $20$. Rút ngẫu nhiên đồng thời $2$ tấm thẻ.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $190$.]),
    True([Xác suất để cả hai thẻ rút được đều ghi số chẵn bằng $9 / 38$.]),
    True([Xác suất để tích hai số ghi trên hai thẻ là một số lẻ bằng $9 / 38$.]),
    [Xác suất để tích hai số ghi trên hai thẻ là một số chẵn bằng $1 / 2$.]
  ),
  loigiai: [
    #step([Xét ý a: Không gian mẫu])
    $|Omega| = C_20^2 = 190$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Cả hai số chẵn])
    Chọn 2 số từ 10 số chẵn: $C_10^2 = 45 => P = 45 / 190 = 9 / 38$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Tích là số lẻ])
    Tích lẻ khi cả 2 số đều lẻ: chọn 2 số từ 10 số lẻ có $C_10^2 = 45 => P = 45 / 190 = 9 / 38$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tích là số chẵn])
    Biến cố đối của tích lẻ: $P = 1 - 9 / 38 = 29 / 38$ (chứ không phải $1 / 2$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Gieo hai con xúc xắc cân đối đồng chất. Tính xác suất để tổng số chấm xuất hiện bằng $8$ (kết quả viết dưới dạng phân số tối giản $a / b$).],
    [5/36],
    loigiai: [
        #step([Tính xác suất])
        $ P = 5 / 36 $
    ]
)

// TLN 2
#tln([Một hộp có $5$ bi đỏ, $4$ bi xanh, $3$ bi vàng. Lấy ngẫu nhiên $3$ bi. Tính xác suất để có đủ $3$ màu (dưới dạng phân số tối giản).],
    [3/11],
    loigiai: [
        #step([Tính xác suất])
        $ 60 / 220 = 3 / 11 $
    ]
)

// TLN 3
#tln([Xếp ngẫu nhiên $6$ bạn học sinh (trong đó có An và Bình) thành hàng ngang. Tính xác suất để An và Bình đứng cạnh nhau (dưới dạng phân số tối giản).],
    [1/3],
    loigiai: [
        #step([Tính xác suất])
        $ 240 / 720 = 1 / 3 $
    ]
)

// TLN 4
#tln([Một kiện hàng có $7$ linh kiện tốt và $3$ linh kiện hỏng. Lấy ngẫu nhiên $3$ linh kiện. Tính xác suất lấy được ít nhất một linh kiện hỏng (dưới dạng phân số tối giản).],
    [17/24],
    loigiai: [
        #step([Biến cố đối])
        $ 1 - 35 / 120 = 17 / 24 $
    ]
)

// TLN 5
#tln([Gieo một đồng xu cân đối $4$ lần liên tiếp. Tính xác suất để số lần xuất hiện mặt sấp nhiều hơn mặt ngửa (dưới dạng phân số tối giản).],
    [5/16],
    loigiai: [
        #step([Tính xác suất])
        $ 5 / 16 $
    ]
)

// TLN 6
#tln([Chọn ngẫu nhiên $3$ đỉnh từ $12$ đỉnh của đa giác đều. Tính xác suất để $3$ đỉnh tạo thành tam giác vuông (dưới dạng phân số tối giản).],
    [3/11],
    loigiai: [
        #step([Tính xác suất])
        $ 60 / 220 = 3 / 11 $
    ]
)

] // end make-questions

#make-questions()
