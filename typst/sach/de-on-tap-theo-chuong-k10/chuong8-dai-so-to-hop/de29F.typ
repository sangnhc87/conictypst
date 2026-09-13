#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("7c3aed") // Violet

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP",
  exam-title: "CHUYÊN ĐỀ THỰC TẾ: DI TRUYỀN MENDEL, TỔ HỢP SINH HỌC & PHÂN TỬ ADN (ĐỀ SỐ 29F)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "187",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Bộ ba mã di truyền Codon có CeTZ)
#tn([Trong sinh học phân tử, mã di truyền được đọc theo từng bộ ba nucleotide (codon) trên phân tử mARN. Có $4$ loại nucleotide cấu tạo nên mARN là A, U, G, X. Trong tổng số các bộ ba có thể tạo thành, có đúng $3$ bộ ba kết thúc (Stop codons: UAA, UAG, UGA) không mã hóa axit amin. Hỏi có bao nhiêu bộ ba thực sự mã hóa các axit amin?],
    (
        True([$61$]),
        [$64$],
        [$24$],
        [$60$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng quy tắc nhân tính tổng số bộ ba nucleotide có thể tạo thành từ 4 loại bazơ nitơ, sau đó trừ đi 3 bộ ba kết thúc không mã hóa.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          let codons = (("A", "U", "G"), ("G", "A", "A"), ("U", "A", "A"))
          let fills = (rgb("ede9fe"), rgb("ede9fe"), rgb("fee2e2"))
          let labels = ([Codon 1 (Met)], [Codon 2 (Glu)], [Codon 3 (Stop)])
          for i in range(3) {
            rect((i * 2.4, 0), (i * 2.4 + 2.0, 0.8), fill: fills.at(i), stroke: 1pt + accent)
            content((i * 2.4 + 1.0, 0.4), codons.at(i).join(" - "))
            content((i * 2.4 + 1.0, -0.3), labels.at(i))
          }
        })
        ]
        - Mỗi vị trí trong bộ ba codon có 4 cách chọn nucleotide (A, U, G, X).
        - Tổng số bộ ba nucleotide có thể tạo thành là:
          $ 4 times 4 times 4 = 4^3 = 64 text(" bộ ba") $
        - Trừ đi 3 bộ ba kết thúc (UAA, UAG, UGA), số bộ ba thực sự tham gia mã hóa axit amin là:
          $ 64 - 3 = 61 text(" bộ ba") $
    ]
)

// TN 2 (Trình tự chuỗi ADN xoắn kép)
#tn([Một đoạn phân tử ADN xoắn kép gồm $10$ cặp nucleotide liên tiếp. Giả sử tại mỗi bậc thang liên kết của chuỗi xoắn kép chỉ có thể là cặp A-T hoặc cặp G-X. Hỏi có bao nhiêu trình tự liên kết phân tử khác nhau có thể có của đoạn ADN $10$ cặp nucleotide này?],
    (
        True([$1024$]),
        [$20$],
        [$100$],
        [$512$]
    ),
    loigiai: [
        *Phương pháp giải:* Mỗi vị trí bậc thang trong 10 cặp nucleotide là một phép thử nhị phân độc lập với 2 khả năng (cặp A-T hoặc cặp G-X). Áp dụng quy tắc nhân.
        Số trình tự liên kết khác nhau là:
        $ 2^10 = 1024 text(" trình tự") $
    ]
)

// TN 3 (Phép lai hai cặp tính trạng độc lập của Mendel)
#tn([Xét phép lai hai cặp gen phân li độc lập ở đậu Hà Lan: $A a B b times A a B b$. Biết tính trạng trội là trội hoàn toàn. Số loại kiểu gen phân biệt xuất hiện ở thế hệ con $F_1$ là],
    (
        True([$9$]),
        [$4$],
        [$16$],
        [$6$]
    ),
    loigiai: [
        *Phương pháp giải:* Do các cặp gen phân li độc lập, số loại kiểu gen của phép lai bằng tích số loại kiểu gen của từng cặp gen thành phần.
        - Phép lai $A a times A a$ tạo ra $3$ loại kiểu gen: $1 A A : 2 A a : 1 a a$.
        - Phép lai $B b times B b$ tạo ra $3$ loại kiểu gen: $1 B B : 2 B b : 1 b b$.
        Theo quy tắc nhân, số loại kiểu gen ở thế hệ $F_1$ là:
        $ 3 times 3 = 9 text(" kiểu gen") $
    ]
)

// TN 4 (Xác suất nhị thức bệnh di truyền)
#tn([Một bệnh di truyền ở người do alen lặn $a$ trên nhiễm sắc thể thường quy định, người có kiểu gen $A A$ và $A a$ đều bình thường. Một cặp vợ chồng đều có kiểu gen dị hợp $A a$. Xác suất để mỗi người con sinh ra bị bệnh ($a a$) là $1 / 4$ và bình thường là $3 / 4$. Nếu cặp vợ chồng sinh đúng $4$ người con, xác suất để có đúng $1$ người con bị bệnh là],
    (
        True([$27 / 64$]),
        [$81 / 256$],
        [$1 / 4$],
        [$27 / 256$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức phân bố nhị thức Bernoulli với $n = 4$ lần sinh con độc lập, xác suất sinh con bị bệnh $p = 1 / 4$ và bình thường $q = 3 / 4$.
        Xác suất để trong 4 người con có đúng 1 người bị bệnh là:
        $ P(X = 1) = C_4^1 (1 / 4)^1 (3 / 4)^(4 - 1) = 4 times (1 / 4) times (27 / 64) = 27 / 64 $
    ]
)

// TN 5 (Đột biến điểm thay thế)
#tn([Một đoạn gen ngắn gồm $8$ cặp nucleotide. Trong quá trình nhân đôi ADN do tác động của hóa chất 5-BU, xảy ra đột biến điểm thay thế nucleotide tại đúng $2$ vị trí cặp nucleotide phân biệt trong đoạn gen. Hỏi có bao nhiêu cách lựa chọn $2$ vị trí xảy ra đột biến trong số $8$ cặp nucleotide?],
    (
        True([$28$]),
        [$56$],
        [$16$],
        [$64$]
    ),
    loigiai: [
        *Phương pháp giải:* Việc chọn 2 vị trí đột biến từ 8 vị trí là bài toán chọn tổ hợp chập 2 của 8 phần tử.
        Số cách chọn là:
        $ C_8^2 = (8 times 7) / 2 = 28 text(" cách") $
    ]
)

// TN 6 (Đa dạng giao tử bộ NST 2n = 8)
#tn([Một loài động vật có bộ nhiễm sắc thể lưỡng bội $2n = 8$ (gồm $4$ cặp nhiễm sắc thể tương đồng). Giả sử quá trình giảm phân diễn ra bình thường, không có trao đổi chéo và không xảy ra đột biến. Số loại giao tử tối đa khác nhau về nguồn gốc nhiễm sắc thể mà cơ thể này có thể tạo ra là],
    (
        True([$16$]),
        [$8$],
        [$64$],
        [$32$]
    ),
    loigiai: [
        *Phương pháp giải:* Ở mỗi cặp nhiễm sắc thể tương đồng, giao tử chỉ nhận 1 trong 2 chiếc (1 từ bố hoặc 1 từ mẹ). Với $n = 4$ cặp nhiễm sắc thể tương đồng, số loại giao tử tối đa là $2^n$.
        $ 2^4 = 16 text(" loại giao tử") $
    ]
)

// TN 7 (Cấu trúc nhóm máu hệ ABO)
#tn([Hệ nhóm máu ABO ở người do $3$ alen quy định: $I^A, I^B, I^O$ trên nhiễm sắc thể thường. Trong quần thể người, một cá thể mang kiểu gen gồm $2$ alen (có thể cùng loại hoặc khác loại). Số kiểu gen tối đa quy định nhóm máu trong quần thể là],
    (
        True([$6$]),
        [$9$],
        [$4$],
        [$8$]
    ),
    loigiai: [
        *Phương pháp giải:* Số kiểu gen gồm các kiểu gen đồng hợp ($I^A I^A, I^B I^B, I^O I^O$) và các kiểu gen dị hợp ($I^A I^B, I^A I^O, I^B I^O$).
        - Số kiểu gen đồng hợp: có $3$ kiểu.
        - Số kiểu gen dị hợp: chọn 2 alen khác nhau từ 3 alen: có $C_3^2 = 3$ kiểu.
        Tổng số kiểu gen tối đa là:
        $ 3 + 3 = 6 text(" kiểu gen") $
    ]
)

// TN 8 (Sắp xếp chuỗi Polypeptit có cố định đầu đuôi)
#tn([Một chuỗi oligopeptit gồm $5$ axit amin khác nhau: Gly, Ala, Val, Leu, Ile. Có bao nhiêu cách sắp xếp trình tự các axit amin trong chuỗi sao cho Gly luôn ở vị trí đầu chuỗi (đầu N) và Ile luôn ở vị trí cuối chuỗi (đầu C)?],
    (
        True([$6$]),
        [$120$],
        [$24$],
        [$12$]
    ),
    loigiai: [
        *Phương pháp giải:* Cố định hai axit amin Gly và Ile ở hai đầu chuỗi, sau đó hoán vị $3$ axit amin còn lại vào $3$ vị trí ở giữa.
        Ba axit amin Ala, Val, Leu được xếp vào 3 vị trí ở giữa:
        $ 3! = 3 times 2 times 1 = 6 text(" cách") $
    ]
)

// TN 9 (Xác suất sinh con trai gái trong gia đình 5 con)
#tn([Giả sử xác suất sinh con trai và con gái ở mỗi lần sinh là bằng nhau ($p = q = 0.5$). Một gia đình dự định sinh $5$ người con. Xác suất để gia đình đó có đúng $3$ người con gái và $2$ người con trai là],
    (
        True([$5 / 16$]),
        [$1 / 2$],
        [$10 / 64$],
        [$5 / 32$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức phân bố nhị thức với $n = 5, k = 3, p = 0.5$:
        $ P(X = 3) = C_5^3 (0.5)^3 (0.5)^2 = 10 times (1 / 2)^5 = 10 / 32 = 5 / 16 $
    ]
)

// TN 10 (Chuỗi mARN nhân tạo)
#tn([Từ môi trường chứa hai loại nucleotide tự do là A và U, các nhà khoa học tổng hợp một chuỗi mARN nhân tạo gồm $5$ nucleotide. Có bao nhiêu chuỗi mARN khác nhau có chứa đúng $3$ nucleotide loại A và $2$ nucleotide loại U?],
    (
        True([$10$]),
        [$32$],
        [$20$],
        [$15$]
    ),
    loigiai: [
        *Phương pháp giải:* Chọn 3 vị trí trong 5 vị trí của chuỗi để đặt nucleotide loại A (2 vị trí còn lại tự động thuộc về nucleotide loại U).
        Số chuỗi khác nhau là:
        $ C_5^3 = (5 times 4) / 2 = 10 text(" chuỗi") $
    ]
)

// TN 11 (Tần số alen Hardy-Weinberg nhị thức bậc 2)
#tn([Trong một quần thể ngẫu phối, một gen có $2$ alen $A$ và $a$ với tần số tương ứng là $p = 0.6$ và $q = 0.4$. Theo định luật Hardy-Weinberg, cấu trúc di truyền của quần thể tuân theo khai triển nhị thức $(p + q)^2 = p^2 A A + 2 p q A a + q^2 a a = 1$. Tỉ lệ cá thể mang kiểu gen dị hợp tử $A a$ trong quần thể bằng],
    (
        True([$0.48$]),
        [$0.36$],
        [$0.16$],
        [$0.24$]
    ),
    loigiai: [
        *Phương pháp giải:* Tỉ lệ kiểu gen dị hợp tử $A a$ bằng số hạng $2 p q$ trong khai triển nhị thức Newton bậc 2.
        $ 2 p q = 2(0.6)(0.4) = 0.48 = 48% $
    ]
)

// TN 12 (Hệ số nhị thức bậc 5)
#tn([Hệ số của số hạng chứa $p^3 q^2$ trong khai triển nhị thức Newton của biểu thức $(p + q)^5$ bằng],
    (
        True([$10$]),
        [$5$],
        [$20$],
        [$1$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức số hạng tổng quát của nhị thức Newton: $T_(k + 1) = C_5^k p^(5 - k) q^k$.
        Với số hạng chứa $p^3 q^2$, ta có $k = 2$:
        $ C_5^2 = (5 times 4) / 2 = 10 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Bộ ba mã di truyền)
#ds([Xét hệ thống mã di truyền được cấu tạo từ $4$ loại nucleotide A, U, G, X trên phân tử mARN.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số bộ ba nucleotide có thể tạo thành từ $4$ loại nucleotide bằng $64$.]),
    True([Số bộ ba nucleotide có chứa ít nhất một nucleotide loại A bằng $37$.]),
    True([Có đúng $61$ bộ ba nucleotide thực sự tham gia mã hóa các axit amin.]),
    [Số bộ ba gồm $3$ nucleotide đôi một khác nhau bằng $48$.]
  ),
  loigiai: [
    #step([Xét ý a: Tổng số bộ ba])
    $4^3 = 64$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Chứa ít nhất một nucleotide A])
    Số bộ ba không chứa A: $3^3 = 27$.
    Số bộ ba chứa ít nhất một A: $64 - 27 = 37$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Mã hóa axit amin])
    $64 - 3 = 61$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Ba nucleotide đôi một khác nhau])
    $A_4^3 = 4 times 3 times 2 = 24$ (chứ không phải $48$). Mệnh đề d SAI.
  ]
)

// DS 2 (Phép lai Mendel hai cặp tính trạng)
#ds([Xét phép lai hai cặp gen phân li độc lập $A a B b times A a B b$ với tính trạng trội hoàn toàn.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Thế hệ con $F_1$ có tất cả $9$ loại kiểu gen khác nhau.]),
    True([Thế hệ con $F_1$ có tất cả $4$ loại kiểu hình khác nhau.]),
    True([Tỉ lệ cá thể có kiểu hình đồng hợp lặn về cả hai tính trạng ($a a b b$) ở $F_1$ bằng $1 / 16$.]),
    [Tỉ lệ cá thể mang cả hai tính trạng trội ($A- B-$) ở $F_1$ bằng $3 / 4$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Phép lai phân li độc lập])
    - Số kiểu gen: $3 times 3 = 9$. Mệnh đề a ĐÚNG.
    - Số kiểu hình: $2 times 2 = 4$. Mệnh đề b ĐÚNG.
    - Tỉ lệ aabb: $(1 / 4) times (1 / 4) = 1 / 16$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Kiểu hình 2 tính trạng trội])
    Tỉ lệ $A- B-$: $(3 / 4) times (3 / 4) = 9 / 16$ (chứ không phải $3 / 4$). Mệnh đề d SAI.
  ]
)

// DS 3 (Xác suất sinh con trong gia đình 4 người con)
#ds([Xét một cặp vợ chồng đều mang gen dị hợp về một bệnh di truyền lặn $A a times A a$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Xác suất để sinh một người con bình thường ở mỗi lần sinh bằng $3 / 4$.]),
    True([Xác suất để cả $4$ người con sinh ra đều bình thường bằng $(3 / 4)^4 = 81 / 256$.]),
    True([Xác suất để có đúng $1$ người con bị bệnh trong $4$ người con bằng $27 / 64$.]),
    [Xác suất để có ít nhất một người con bị bệnh nhỏ hơn $0.50$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Phân bố nhị thức])
    - Bình thường: $3 / 4$. Mệnh đề a ĐÚNG.
    - Cả 4 bình thường: $(3 / 4)^4 = 81 / 256$. Mệnh đề b ĐÚNG.
    - Đúng 1 người bị bệnh: $C_4^1 (1 / 4) (3 / 4)^3 = 27 / 64$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Ít nhất 1 người bị bệnh])
    $1 - 81 / 256 = 175 / 256 approx 0.6836 > 0.50$.
    Khẳng định nhỏ hơn $0.50$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Định luật Hardy-Weinberg)
#ds([Xét quần thể ngẫu phối cân bằng di truyền với hai alen $A$ (tần số $p = 0.6$) và $a$ (tần số $q = 0.4$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tỉ lệ kiểu gen đồng hợp trội $A A$ trong quần thể bằng $p^2 = 0.36$.]),
    True([Tỉ lệ kiểu gen dị hợp tử $A a$ trong quần thể bằng $2 p q = 0.48$.]),
    True([Tỉ lệ kiểu gen đồng hợp lặn $a a$ trong quần thể bằng $q^2 = 0.16$.]),
    [Tổng tỉ lệ các cá thể mang alen trội trong quần thể bằng $0.50$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Tỉ lệ các kiểu gen])
    - $A A = 0.6^2 = 0.36$. Mệnh đề a ĐÚNG.
    - $A a = 2(0.6)(0.4) = 0.48$. Mệnh đề b ĐÚNG.
    - $a a = 0.4^2 = 0.16$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Cá thể mang alen trội])
    Tỉ lệ cá thể mang alen trội ($A A + A a$): $0.36 + 0.48 = 0.84$ (hoặc $1 - 0.16 = 0.84$, chứ không phải $0.50$).
    Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Trong $64$ bộ ba mã di truyền, có bao nhiêu bộ ba thực sự mã hóa các axit amin?],
    [61],
    loigiai: [
        #step([Trừ 3 bộ ba kết thúc])
        $ 64 - 3 = 61 text(" bộ ba") $
    ]
)

// TLN 2
#tln([Một đoạn ADN xoắn kép gồm $10$ cặp nucleotide liên tiếp. Có bao nhiêu trình tự liên kết phân tử khác nhau?],
    [1024],
    loigiai: [
        #step([Lũy thừa 2^10])
        $ 2^10 = 1024 text(" trình tự") $
    ]
)

// TLN 3
#tln([Thế hệ con của phép lai hai cặp gen phân li độc lập $A a B b times A a B b$ có bao nhiêu loại kiểu gen khác nhau?],
    [9],
    loigiai: [
        #step([Tích số kiểu gen])
        $ 3 times 3 = 9 text(" kiểu gen") $
    ]
)

// TLN 4
#tln([Một loài động vật có $2n = 8$. Số loại giao tử tối đa khác nhau về nguồn gốc nhiễm sắc thể là bao nhiêu?],
    [16],
    loigiai: [
        #step([Công thức 2^n])
        $ 2^4 = 16 text(" loại giao tử") $
    ]
)

// TLN 5
#tln([Có bao nhiêu kiểu gen tối đa quy định nhóm máu hệ ABO ở người (do $3$ alen quy định)?],
    [6],
    loigiai: [
        #step([Tổ hợp alen])
        $ 3 + C_3^2 = 3 + 3 = 6 text(" kiểu gen") $
    ]
)

// TLN 6
#tln([Có bao nhiêu cách sắp xếp $5$ axit amin khác nhau thành chuỗi sao cho vị trí đầu và vị trí cuối đã cố định?],
    [6],
    loigiai: [
        #step([Hoán vị 3 phần tử ở giữa])
        $ 3! = 6 text(" cách") $
    ]
)

] // end make-questions

#make-questions()
