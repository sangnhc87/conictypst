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
  exam-title: "BÀI 27: THỰC HÀNH TÍNH XÁC SUẤT CỔ ĐIỂN (ĐỀ SỐ 31A)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "191",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Rút bài tứ quý có CeTZ)
#tn([Rút ngẫu nhiên đồng thời $4$ lá bài từ một bộ bài tú lơ khơ tiêu chuẩn gồm $52$ lá. Xác suất để rút được một bộ tứ quý (gồm $4$ lá bài có cùng một giá trị số) bằng],
    (
        True([$1 / 20825$]),
        [$1 / 270725$],
        [$13 / 270725$],
        [$4 / 20825$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu là số tổ hợp chập 4 của 52 lá bài. Có 13 giá trị bài khác nhau (từ Át đến K), mỗi giá trị có đúng 1 bộ tứ quý.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          let suits = ("♠", "♥", "♦", "♣")
          let colors = (black, red, red, black)
          for i in range(4) {
            rect((i * 1.5, 0), (i * 1.5 + 1.1, 1.5), stroke: 1pt + gray, fill: rgb("f8fafc"))
            content((i * 1.5 + 0.3, 1.2), text(fill: colors.at(i), size: 10pt, [A]))
            content((i * 1.5 + 0.55, 0.75), text(fill: colors.at(i), size: 16pt, suits.at(i)))
          }
          content((2.5, -0.3), [Tứ quý Át (A)])
        })
        ]
        - Số phần tử của không gian mẫu:
          $ |Omega| = C_52^4 = (52 times 51 times 50 times 49) / 24 = 270725 $
        - Bộ bài có 13 giá trị số khác nhau, mỗi giá trị số có đúng $C_4^4 = 1$ cách tạo thành tứ quý:
          Số kết quả thuận lợi: $|A| = 13 times 1 = 13$.
        - Xác suất:
          $ P(A) = 13 / 270725 = 1 / 20825 $
    ]
)

// TN 2 (Tổng 3 số là số chẵn)
#tn([Từ tập hợp các số tự nhiên $S = {1, 2, 3, ..., 30}$, chọn ngẫu nhiên đồng thời $3$ số. Xác suất để tổng của $3$ số được chọn là một số chẵn bằng],
    (
        True([$1 / 2$]),
        [$2 / 5$],
        [$15 / 29$],
        [$7 / 15$]
    ),
    loigiai: [
        *Phương pháp giải:* Tập $S$ gồm $15$ số chẵn và $15$ số lẻ. Tổng 3 số là chẵn khi cả 3 số đều chẵn hoặc có đúng 1 số chẵn và 2 số lẻ.
        - Không gian mẫu: $|Omega| = C_30^3 = (30 times 29 times 28) / 6 = 4060$.
        - Trường hợp 1: Chọn 3 số đều chẵn: $C_15^3 = 455$ cách.
        - Trường hợp 2: Chọn 1 số chẵn và 2 số lẻ: $C_15^1 times C_15^2 = 15 times 105 = 1575$ cách.
        - Số kết quả thuận lợi: $|A| = 455 + 1575 = 2030$.
        - Xác suất:
          $ P(A) = 2030 / 4060 = 1 / 2 $
    ]
)

// TN 3 (Bốc thăm đề thi)
#tn([Một ngân hàng đề thi vấn đáp có $20$ câu hỏi, trong đó gồm $12$ câu lý thuyết và $8$ câu bài tập. Một thí sinh rút ngẫu nhiên $3$ câu hỏi từ ngân hàng đề. Xác suất để thí sinh rút được ít nhất một câu bài tập bằng],
    (
        True([$46 / 57$]),
        [$11 / 57$],
        [$2 / 5$],
        [$3 / 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp biến cố đối $overline(A)$: "Thí sinh rút được cả 3 câu đều là câu hỏi lý thuyết".
        - Không gian mẫu: $|Omega| = C_20^3 = (20 times 19 times 18) / 6 = 1140$.
        - Số cách rút 3 câu toàn lý thuyết:
          $ |overline(A)| = C_12^3 = (12 times 11 times 10) / 6 = 220 $
        - Xác suất biến cố đối:
          $ P(overline(A)) = 220 / 1140 = 11 / 57 $
        - Xác suất rút được ít nhất một câu bài tập:
          $ P(A) = 1 - 11 / 57 = 46 / 57 $
    ]
)

// TN 4 (Gieo 3 con xúc xắc có CeTZ)
#tn([Gieo đồng thời ba con xúc xắc cân đối và đồng chất. Xác suất để có ít nhất hai con xúc xắc xuất hiện cùng số chấm bằng],
    (
        True([$4 / 9$]),
        [$5 / 9$],
        [$1 / 2$],
        [$7 / 18$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng biến cố đối $overline(A)$: "Cả 3 con xúc xắc xuất hiện số chấm đôi một khác nhau".
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for i in range(3) {
            rect((i * 1.6, 0), (i * 1.6 + 1.2, 1.2), stroke: 1pt + accent, fill: rgb("dbeafe"))
            circle((i * 1.6 + 0.6, 0.6), radius: 0.15, fill: accent)
            content((i * 1.6 + 0.6, -0.3), [Xúc xắc #str(i + 1)])
          }
        })
        ]
        - Không gian mẫu: $|Omega| = 6^3 = 216$.
        - Số kết quả để 3 con xúc xắc có số chấm khác nhau:
          $ |overline(A)| = A_6^3 = 6 times 5 times 4 = 120 $
        - Xác suất biến cố đối:
          $ P(overline(A)) = 120 / 216 = 5 / 9 $
        - Xác suất có ít nhất hai con xúc xắc cùng số chấm:
          $ P(A) = 1 - 5 / 9 = 4 / 9 $
    ]
)

// TN 5 (Xếp hàng nam nữ xen kẽ)
#tn([Xếp ngẫu nhiên $4$ bạn nam và $4$ bạn nữ thành một hàng dọc gồm $8$ người. Xác suất để các bạn nam và nữ đứng xen kẽ nhau từng người một bằng],
    (
        True([$1 / 35$]),
        [$1 / 70$],
        [$2 / 35$],
        [$1 / 18$]
    ),
    loigiai: [
        *Phương pháp giải:* Hàng dọc xen kẽ có 2 cấu trúc vị trí: (Nam - Nữ - Nam - Nữ...) hoặc (Nữ - Nam - Nữ - Nam...).
        - Không gian mẫu: $|Omega| = 8! = 40320$.
        - Mỗi cấu trúc có $4!$ cách xếp 4 bạn nam và $4!$ cách xếp 4 bạn nữ:
          Số cách xếp mỗi cấu trúc: $4! times 4! = 24 times 24 = 576$.
        - Tổng số kết quả thuận lợi: $|A| = 2 times 576 = 1152$.
        - Xác suất:
          $ P(A) = 1152 / 40320 = 1 / 35 $
    ]
)

// TN 6 (Lưới hình chữ nhật)
#tn([Trong mặt phẳng cho $5$ đường thẳng song song nằm ngang cắt $4$ đường thẳng song song thẳng đứng tạo thành hệ thống các ô hình chữ nhật. Chọn ngẫu nhiên một hình chữ nhật từ hệ thống này. Có tất cả bao nhiêu hình chữ nhật có thể chọn?],
    (
        True([$60$]),
        [$20$],
        [$120$],
        [$40$]
    ),
    loigiai: [
        *Phương pháp giải:* Một hình chữ nhật được tạo thành duy nhất bởi việc chọn 2 đường thẳng nằm ngang và 2 đường thẳng thẳng đứng.
        - Chọn 2 đường thẳng ngang từ 5 đường: có $C_5^2 = 10$ cách.
        - Chọn 2 đường thẳng đứng từ 4 đường: có $C_4^2 = 6$ cách.
        Theo quy tắc nhân:
        $ 10 times 6 = 60 text(" hình chữ nhật") $
    ]
)

// TN 7 (Lấy bóng từ 2 hộp độc lập)
#tn([Hộp I chứa $4$ viên bi trắng và $6$ viên bi đen. Hộp II chứa $5$ viên bi trắng và $5$ viên bi đen. Lấy ngẫu nhiên từ mỗi hộp ra đúng một viên bi. Xác suất để hai viên bi lấy ra có cùng màu bằng],
    (
        True([$1 / 2$]),
        [$2 / 5$],
        [$3 / 5$],
        [$1 / 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Hai viên bi cùng màu khi cả hai cùng là màu trắng hoặc cả hai cùng là màu đen. Áp dụng quy tắc nhân cho các phép thử độc lập và cộng xác suất.
        - Xác suất cả hai viên bi màu trắng:
          $ P(T T) = (4 / 10) times (5 / 10) = 20 / 100 $
        - Xác suất cả hai viên bi màu đen:
          $ P(Đ Đ) = (6 / 10) times (5 / 10) = 30 / 100 $
        - Xác suất hai viên bi cùng màu:
          $ P = 20 / 100 + 30 / 100 = 50 / 100 = 1 / 2 $
    ]
)

// TN 8 (Đa giác đều 16 đỉnh - Hình chữ nhật)
#tn([Cho đa giác đều có $16$ đỉnh nội tiếp trong đường tròn. Chọn ngẫu nhiên $4$ đỉnh từ $16$ đỉnh của đa giác. Xác suất để $4$ đỉnh được chọn tạo thành một hình chữ nhật bằng],
    (
        True([$1 / 65$]),
        [$2 / 65$],
        [$1 / 130$],
        [$3 / 65$]
    ),
    loigiai: [
        *Phương pháp giải:* Mỗi hình chữ nhật nội tiếp được tạo bởi $2$ đường kính phân biệt đi qua tâm đường tròn.
        - Không gian mẫu:
          $ |Omega| = C_16^4 = (16 times 15 times 14 times 13) / 24 = 1820 $
        - Đa giác đều có $16 / 2 = 8$ đường kính.
        - Chọn 2 đường kính bất kỳ từ 8 đường kính tạo thành đúng 1 hình chữ nhật:
          Số hình chữ nhật: $|A| = C_8^2 = (8 times 7) / 2 = 28$.
        - Xác suất:
          $ P(A) = 28 / 1820 = 1 / 65 $
    ]
)

// TN 9 (Chia 10 học sinh thành 2 nhóm)
#tn([Chia ngẫu nhiên $10$ học sinh (trong đó có An và Bình) thành hai nhóm học tập đều nhau, mỗi nhóm gồm $5$ học sinh. Xác suất để An và Bình được xếp vào cùng một nhóm học tập bằng],
    (
        True([$4 / 9$]),
        [$5 / 9$],
        [$1 / 2$],
        [$2 / 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Cố định bạn An vào một nhóm (nhóm này còn 4 vị trí trống), nhóm thứ hai có 5 vị trí trống.
        - Sau khi An đã vào nhóm, còn lại $9$ vị trí trống chia cho $9$ bạn còn lại.
        - Để Bình ở cùng nhóm với An, Bình phải được xếp vào một trong $4$ vị trí trống còn lại của nhóm An.
        Xác suất cần tìm là:
        $ P = 4 / 9 $
    ]
)

// TN 10 (Số tự nhiên 4 chữ số chẵn)
#tn([Từ tập hợp các chữ số $A = {0, 1, 2, 3, 4, 5}$, lập ngẫu nhiên một số tự nhiên gồm $4$ chữ số đôi một khác nhau. Xác suất để số được lập là một số chẵn bằng],
    (
        True([$13 / 25$]),
        [$12 / 25$],
        [$1 / 2$],
        [$3 / 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Tính số phần tử không gian mẫu các số có dạng $overline(a b c d)$ với $a != 0$. Sau đó chia 2 trường hợp tính số số chẵn tận cùng bằng 0 hoặc khác 0.
        - Chữ số $a in {1, 2, 3, 4, 5}$ có 5 cách chọn; ba chữ số $b, c, d$ có $A_5^3 = 60$ cách chọn.
          $ |Omega| = 5 times 60 = 300 $
        - Số chẵn $overline(a b c d)$:
          + Trường hợp 1: $d = 0$ (1 cách). Ba chữ số $a, b, c$ chọn từ 5 chữ số còn lại: $A_5^3 = 60$ số.
          + Trường hợp 2: $d in {2, 4}$ (2 cách). Chữ số $a != 0, a != d$ có 4 cách; $b, c$ có $A_4^2 = 12$ cách:
            Số lượng: $2 times 4 times 12 = 96$ số.
          Tổng số số chẵn: $|A| = 60 + 96 = 156$.
        - Xác suất:
          $ P(A) = 156 / 300 = 13 / 25 $
    ]
)

// TN 11 (Chọn 3 người cùng thứ trong tuần)
#tn([Chọn ngẫu nhiên $3$ người độc lập. Giả sử khả năng sinh vào $7$ ngày trong tuần của mỗi người là như nhau. Xác suất để có ít nhất hai người sinh vào cùng một thứ trong tuần bằng],
    (
        True([$19 / 49$]),
        [$30 / 49$],
        [$1 / 7$],
        [$2 / 7$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng biến cố đối: cả 3 người sinh vào 3 ngày thứ hoàn toàn khác nhau trong tuần.
        - Không gian mẫu: $|Omega| = 7^3 = 343$.
        - Số trường hợp 3 người sinh vào 3 thứ khác nhau:
          $ |overline(A)| = A_7^3 = 7 times 6 times 5 = 210 $
        - Xác suất biến cố đối:
          $ P(overline(A)) = 210 / 343 = 30 / 49 $
        - Xác suất có ít nhất hai người cùng thứ sinh:
          $ P(A) = 1 - 30 / 49 = 19 / 49 $
    ]
)

// TN 12 (Bắn cung nhị thức)
#tn([Một cung thủ bắn $3$ mũi tên độc lập vào bia với xác suất bắn trúng hồng tâm ở mỗi lần bắn là $0.6$. Xác suất để cung thủ bắn trúng hồng tâm đúng $2$ lần bằng],
    (
        True([$0.432$]),
        [$0.216$],
        [$0.288$],
        [$0.360$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức phân bố nhị thức với $n = 3, k = 2, p = 0.6$:
        $ P(X = 2) = C_3^2 (0.6)^2 (1 - 0.6)^(3 - 2) = 3 times 0.36 times 0.4 = 0.432 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Rút bài tây tú lơ khơ)
#ds([Xét phép thử rút ngẫu nhiên đồng thời $4$ lá bài từ bộ bài tú lơ khơ $52$ lá tiêu chuẩn.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $270725$.]),
    True([Số cách rút được $4$ lá bài cùng chất (cùng chất rô, cơ, bích hoặc tép) bằng $2860$.]),
    True([Số cách rút được một bộ tứ quý bằng $13$.]),
    [Xác suất để rút được $4$ lá bài có ít nhất một lá Át nhỏ hơn $0.20$.]
  ),
  loigiai: [
    #step([Xét ý a: Không gian mẫu])
    $C_52^4 = 270725$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Cùng chất])
    Có 4 chất, mỗi chất có 13 lá: $4 times C_13^4 = 4 times 715 = 2860$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Tứ quý])
    Có 13 bộ tứ quý. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Ít nhất 1 lá Át])
    Biến cố đối không có Át nào: $C_48^4 = 194580$.
    Xác suất ít nhất 1 Át: $1 - 194580 / 270725 = 76145 / 270725 approx 0.2813 > 0.20$.
    Khẳng định nhỏ hơn $0.20$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Gieo ba con xúc xắc)
#ds([Gieo đồng thời ba con xúc xắc cân đối và đồng chất.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $216$.]),
    True([Số kết quả để cả ba con xúc xắc xuất hiện số chấm giống nhau bằng $6$.]),
    True([Xác suất để có ít nhất hai con xúc xắc xuất hiện cùng số chấm bằng $4 / 9$.]),
    [Xác suất để tổng số chấm trên ba con xúc xắc bằng $18$ bằng $1 / 36$.]
  ),
  loigiai: [
    #step([Xét ý a: Không gian mẫu])
    $6^3 = 216$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Ba mặt giống nhau])
    Các bộ $(1,1,1), ..., (6,6,6)$ gồm 6 kết quả. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Ít nhất 2 con cùng chấm])
    $1 - 120 / 216 = 4 / 9$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tổng bằng 18])
    Chỉ có duy nhất bộ $(6, 6, 6)$, xác suất là $1 / 216$ (chứ không phải $1 / 36$). Mệnh đề d SAI.
  ]
)

// DS 3 (Xếp hàng 4 nam 4 nữ)
#ds([Xếp ngẫu nhiên $4$ bạn nam và $4$ bạn nữ thành một hàng dọc gồm $8$ người.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $40320$.]),
    True([Số cách xếp sao cho các bạn nam đứng liền nhau thành một khối bằng $2880$.]),
    True([Xác suất để các bạn nam và nữ đứng xen kẽ nhau bằng $1 / 35$.]),
    [Xác suất để không có hai bạn nữ nào đứng cạnh nhau bằng $1 / 35$.]
  ),
  loigiai: [
    #step([Xét ý a: Không gian mẫu])
    $8! = 40320$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Nam đứng liền nhau])
    Buộc 4 nam có $4! = 24$ cách; xếp cùng 4 nữ (5 phần tử) có $5! = 120$ cách.
    Số cách: $24 times 120 = 2880$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Xen kẽ])
    $2 times (4!)^2 / (8!) = 1152 / 40320 = 1 / 35$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Nữ không cạnh nhau])
    Xếp 4 nam có $4! = 24$ cách, tạo 5 vách ngăn. Xếp 4 nữ vào 5 vị trí: $A_5^4 = 120$ cách.
    Số kết quả thuận lợi: $24 times 120 = 2880$.
    Xác suất: $2880 / 40320 = 1 / 14$ (chứ không phải $1 / 35$). Mệnh đề d SAI.
  ]
)

// DS 4 (Chọn học sinh chia nhóm)
#ds([Chia ngẫu nhiên $10$ học sinh (trong đó có An và Bình) thành hai nhóm đều nhau, mỗi nhóm $5$ học sinh.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số cách chia $10$ học sinh thành hai nhóm không phân biệt tên gọi bằng $126$ cách.]),
    True([Số cách chia sao cho An và Bình ở cùng một nhóm bằng $56$ cách.]),
    True([Xác suất để An và Bình ở cùng một nhóm bằng $4 / 9$.]),
    [Xác suất để An và Bình ở hai nhóm khác nhau bằng $1 / 2$.]
  ),
  loigiai: [
    #step([Xét ý a: Không phân biệt tên nhóm])
    $C_10^5 / 2 = 252 / 2 = 126$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Cùng một nhóm])
    Chọn 3 bạn cùng nhóm với An và Bình: $C_8^3 = 56$ cách. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Xác suất cùng nhóm])
    $56 / 126 = 4 / 9$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Khác nhóm])
    $1 - 4 / 9 = 5 / 9$ (chứ không phải $1 / 2$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Rút ngẫu nhiên $4$ lá bài từ bộ bài $52$ lá. Có bao nhiêu cách rút để được một bộ tứ quý?],
    [13],
    loigiai: [
        #step([Số bộ tứ quý])
        $ 13 times 1 = 13 $
    ]
)

// TLN 2
#tln([Từ tập ${1, 2, ..., 30}$, chọn ngẫu nhiên $3$ số. Tính xác suất để tổng $3$ số là số chẵn (viết dưới dạng phân số tối giản).],
    [1/2],
    loigiai: [
        #step([Tính xác suất])
        $ 2030 / 4060 = 1 / 2 $
    ]
)

// TLN 3
#tln([Rút $3$ câu hỏi từ $20$ câu (gồm $12$ lý thuyết, $8$ bài tập). Tính xác suất rút được ít nhất một câu bài tập (dưới dạng phân số tối giản).],
    [46/57],
    loigiai: [
        #step([Biến cố đối])
        $ 1 - 220 / 1140 = 46 / 57 $
    ]
)

// TLN 4
#tln([Gieo $3$ con xúc xắc cân đối. Tính xác suất để có ít nhất hai con xúc xắc xuất hiện cùng số chấm (dưới dạng phân số tối giản).],
    [4/9],
    loigiai: [
        #step([Tính xác suất])
        $ 1 - 120 / 216 = 4 / 9 $
    ]
)

// TLN 5
#tln([Xếp $4$ nam và $4$ nữ thành hàng dọc. Tính xác suất để nam và nữ đứng xen kẽ nhau (dưới dạng phân số tối giản).],
    [1/35],
    loigiai: [
        #step([Tính xác suất])
        $ 1152 / 40320 = 1 / 35 $
    ]
)

// TLN 6
#tln([Từ $16$ đỉnh của đa giác đều, có bao nhiêu hình chữ nhật được tạo thành từ $4$ đỉnh của đa giác?],
    [28],
    loigiai: [
        #step([Chọn 2 đường kính])
        $ C_8^2 = 28 $
    ]
)

] // end make-questions

#make-questions()
