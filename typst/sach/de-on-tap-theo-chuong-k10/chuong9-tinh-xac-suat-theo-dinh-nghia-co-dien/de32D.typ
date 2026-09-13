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
  school: "CHƯƠNG IX: TÍNH XÁC SUẤT THEO ĐỊNH NGHĨA CỔ ĐIỂN",
  exam-title: "CHUYÊN ĐỀ THỰC TẾ: TRÒ CHƠI MAY RỦI, XỔ SỐ & LÝ THUYẾT TRÒ CHƠI (ĐỀ SỐ 32D)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "197",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Bánh xe Roulette Châu Âu có CeTZ)
#tn([Bánh xe Roulette kiểu Châu Âu tiêu chuẩn gồm $37$ ô số từ $0$ đến $36$, trong đó có $18$ ô màu Đỏ, $18$ ô màu Đen và đúng $1$ ô số $0$ màu Xanh lá cây. Một người chơi đặt cược vào cửa "Màu Đỏ". Quả bóng được quay ngẫu nhiên và rơi vào một ô với khả năng như nhau. Xác suất để người chơi thắng cược bằng],
    (
        True([$18 / 37$]),
        [$1 / 2$],
        [$19 / 37$],
        [$18 / 36$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu gồm 37 ô số có khả năng xuất hiện như nhau. Biến cố thuận lợi là quả bóng rơi vào một trong 18 ô màu Đỏ.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.5, stroke: 1.2pt + gray)
          // Vẽ các múi màu đỏ và đen xen kẽ
          for i in range(12) {
            let a = i * 30deg
            let fill_c = if i == 0 { rgb("dcfce7") } else if calc.rem(i, 2) == 1 { rgb("ffe4e6") } else { rgb("f1f5f9") }
            arc((0, 0), radius: 1.5, start: a, delta: 30deg, mode: "PIE", fill: fill_c, stroke: 0.5pt + gray)
          }
          circle((0, 0), radius: 0.6, fill: white, stroke: 1pt + accent)
          content((0, 0), text(size: 8pt, [Roulette]))
          content((0, -1.8), [Mô phỏng bánh xe Roulette])
        })
        ]
        - Không gian mẫu có 37 ô: $|Omega| = 37$.
        - Có 18 ô màu Đỏ: $|A| = 18$.
        - Xác suất thắng cược:
          $ P(A) = 18 / 37 approx 0.4865 $
    ]
)

// TN 2 (Xổ số Power 6/55)
#tn([Trong trò chơi xổ số tự chọn Power 6/55, người chơi chọn $6$ số phân biệt từ tập hợp ${1, 2, ..., 55}$. Giải Jackpot 1 được trao cho bộ số trùng khớp hoàn toàn với cả $6$ số của kết quả quay thưởng. Xác suất để một bộ số chọn ngẫu nhiên trúng giải Jackpot 1 bằng],
    (
        True([$1 / 28989675$]),
        [$1 / 8145060$],
        [$6 / 28989675$],
        [$1 / 55$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu là số tổ hợp chập 6 của 55 số. Chỉ có duy nhất một bộ 6 số trùng khớp hoàn toàn với kết quả quay thưởng.
        - Không gian mẫu:
          $ |Omega| = C_55^6 = (55 times 54 times 53 times 52 times 51 times 50) / 720 = 28989675 $
        - Xác suất trúng Jackpot 1:
          $ P = 1 / 28989675 $
    ]
)

// TN 3 (Trò chơi xúc xắc Craps - Natural thắng ngay)
#tn([Trong trò chơi súc sắc Craps, người chơi gieo đồng thời hai con xúc xắc cân đối và đồng chất. Nếu tổng số chấm xuất hiện bằng $7$ hoặc $11$ (gọi là "Natural"), người chơi sẽ thắng cược ngay ở lần gieo đầu tiên. Xác suất để người chơi thắng cược ngay ở lần gieo đầu tiên bằng],
    (
        True([$2 / 9$]),
        [$1 / 6$],
        [$7 / 36$],
        [$1 / 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu có 36 kết quả. Liệt kê các cặp có tổng số chấm bằng 7 hoặc 11.
        - Tổng bằng 7: $(1, 6), (2, 5), (3, 4), (4, 3), (5, 2), (6, 1)$ ($6$ kết quả).
        - Tổng bằng 11: $(5, 6), (6, 5)$ ($2$ kết quả).
        - Tổng số kết quả thuận lợi: $|A| = 6 + 2 = 8$.
        - Xác suất:
          $ P(A) = 8 / 36 = 2 / 9 $
    ]
)

// TN 4 (Bài Poker Cù lũ Full House có CeTZ)
#tn([Trong một ván bài Poker $5$ lá rút ngẫu nhiên từ bộ bài tú lơ khơ $52$ lá, một tay bài được gọi là Cù lũ (Full House) nếu gồm đúng $3$ lá bài có cùng một giá trị số và $2$ lá bài khác có cùng một giá trị số khác (ví dụ: $3$ lá Át và $2$ lá K). Xác suất để rút được tay bài Cù lũ bằng],
    (
        True([$6 / 4165$]),
        [$1 / 4165$],
        [$13 / 4165$],
        [$18 / 4165$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng quy tắc nhân và tổ hợp. Chọn giá trị số cho bộ ba và chọn 3 lá bài, sau đó chọn giá trị số cho bộ đôi và chọn 2 lá bài.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          let cards = (("A", "♠"), ("A", "♥"), ("A", "♦"), ("K", "♣"), ("K", "♠"))
          let cols = (black, red, red, black, black)
          for i in range(5) {
            rect((i * 1.3, 0), (i * 1.3 + 1.0, 1.4), stroke: 1pt + gray, fill: rgb("f8fafc"))
            content((i * 1.3 + 0.3, 1.1), text(fill: cols.at(i), size: 9pt, cards.at(i).at(0)))
            content((i * 1.3 + 0.5, 0.7), text(fill: cols.at(i), size: 14pt, cards.at(i).at(1)))
          }
          content((3.0, -0.3), [Cù lũ: 3 lá Át + 2 lá K])
        })
        ]
        - Không gian mẫu: $|Omega| = C_52^5 = 2598960$.
        - Chọn giá trị cho bộ 3 lá: có $C_13^1 = 13$ cách.
        - Chọn 3 lá từ 4 chất của giá trị đó: có $C_4^3 = 4$ cách.
        - Chọn giá trị cho bộ 2 lá (từ 12 giá trị còn lại): có $C_12^1 = 12$ cách.
        - Chọn 2 lá từ 4 chất của giá trị đó: có $C_4^2 = 6$ cách.
        - Số tay bài Cù lũ:
          $ |A| = 13 times 4 times 12 times 6 = 3744 $
        - Xác suất:
          $ P(A) = 3744 / 2598960 = 6 / 4165 $
    ]
)

// TN 5 (Vé cào trúng thưởng 2 vé)
#tn([Một lô vé cào có $50$ tấm vé, trong đó có $5$ vé trúng thưởng. Khách hàng mua ngẫu nhiên $3$ tấm vé. Xác suất để khách hàng đó trúng thưởng đúng $2$ vé bằng],
    (
        True([$9 / 392$]),
        [$1 / 392$],
        [$45 / 392$],
        [$3 / 50$]
    ),
    loigiai: [
        *Phương pháp giải:* Chọn 2 vé trúng thưởng (từ 5 vé trúng) và 1 vé không trúng (từ 45 vé không trúng).
        - Không gian mẫu: $|Omega| = C_50^3 = 19600$.
        - Số kết quả thuận lợi:
          $ |A| = C_5^2 times C_45^1 = 10 times 45 = 450 $
        - Xác suất:
          $ P(A) = 450 / 19600 = 9 / 392 $
    ]
)

// TN 6 (Chuỗi tung đồng xu hình học)
#tn([Tung một đồng xu cân đối và đồng chất liên tiếp cho đến khi xuất hiện mặt ngửa đầu tiên thì dừng lại. Xác suất để trò chơi dừng lại đúng ở lần tung thứ $4$ bằng],
    (
        True([$1 / 16$]),
        [$1 / 8$],
        [$1 / 32$],
        [$1 / 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Trò chơi dừng ở lần thứ 4 nghĩa là 3 lần đầu xuất hiện mặt sấp và lần thứ 4 xuất hiện mặt ngửa.
        - Xác suất:
          $ P = (1 / 2) times (1 / 2) times (1 / 2) times (1 / 2) = (1 / 2)^4 = 1 / 16 $
    ]
)

// TN 7 (Nghịch lý Monty Hall có CeTZ)
#tn([Trong một gameshow truyền hình (Nghịch lý Monty Hall), có $3$ cánh cửa đóng kín giống hệt nhau: phía sau một cánh cửa có một chiếc ô tô, phía sau hai cánh cửa còn lại là hai con dê. Người chơi chọn cánh cửa số $1$. Sau đó, MC (người biết rõ vị trí ô tô) mở cánh cửa số $3$ để lộ ra một con dê, rồi cho phép người chơi đổi sang cánh cửa số $2$. Xác suất trúng ô tô nếu người chơi quyết định đổi cửa bằng],
    (
        True([$2 / 3$]),
        [$1 / 2$],
        [$1 / 3$],
        [$3 / 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Ở lựa chọn ban đầu, xác suất chọn trúng con dê là $2 / 3$. Khi người chơi chọn trúng con dê, MC buộc phải mở cánh cửa chứa con dê còn lại, do đó cánh cửa còn lại chắc chắn chứa ô tô. Vì vậy, chiến lược đổi cửa cho xác suất trúng xe bằng đúng xác suất chọn trúng dê ban đầu.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for i in range(3) {
            rect((i * 2.0, 0), (i * 2.0 + 1.4, 2.0), fill: rgb("f1f5f9"), stroke: 1.2pt + gray)
            content((i * 2.0 + 0.7, 1.0), text(size: 10pt, [Cửa #str(i + 1)]))
          }
          content((0.7, -0.3), [Chọn ban đầu (1/3)])
          content((4.7, -0.3), [Mở: Dê])
          line((0.7, 2.2), (2.7, 2.2), mark: (end: "stealth"), stroke: 1.2pt + accent)
          content((1.7, 2.5), [Đổi cửa: Xác suất 2/3!], fill: accent)
        })
        ]
        - Xác suất trúng xe nếu giữ nguyên cửa: $1 / 3$.
        - Xác suất trúng xe nếu đổi cửa: $1 - 1 / 3 = 2 / 3$.
    ]
)

// TN 8 (Đấu trường giải đấu loại trực tiếp)
#tn([Giải đấu cờ vua quốc tế gồm $8$ kỳ thủ tham gia thi đấu theo thể thức loại trực tiếp (sau mỗi trận đấu, người thua bị loại ngay, người thắng vào vòng sau). Giả sử không có trận hòa. Tổng số trận đấu cần diễn ra để tìm ra nhà vô địch là],
    (
        True([$7$]),
        [$8$],
        [$14$],
        [$6$]
    ),
    loigiai: [
        *Phương pháp giải:* Để tìm ra 1 nhà vô địch duy nhất từ 8 kỳ thủ, cần loại đúng $8 - 1 = 7$ kỳ thủ. Mỗi trận đấu loại chính xác 1 kỳ thủ.
        Số trận đấu là:
        $ 8 - 1 = 7 text(" trận") $
    ]
)

// TN 9 (Rút thăm không hoàn lại - Người thứ hai)
#tn([Một hộp có $10$ lá thăm may mắn, trong đó có đúng $3$ lá thăm trúng thưởng. Hai người chơi An và Bình lần lượt rút mỗi người một lá thăm không hoàn lại (An rút trước, Bình rút sau). Xác suất để người thứ hai (Bình) rút được lá thăm trúng thưởng bằng],
    (
        True([$3 / 10$]),
        [$1 / 3$],
        [$2 / 9$],
        [$7 / 30$]
    ),
    loigiai: [
        *Phương pháp giải:* Chia hai trường hợp: An rút được thăm trúng hoặc An rút phải thăm không trúng.
        - Trường hợp 1: An rút trúng (xác suất $3 / 10$), còn lại 2 thăm trúng trong 9 thăm:
          $ P_1 = (3 / 10) times (2 / 9) = 6 / 90 $
        - Trường hợp 2: An rút trượt (xác suất $7 / 10$), còn lại 3 thăm trúng trong 9 thăm:
          $ P_2 = (7 / 10) times (3 / 9) = 21 / 90 $
        - Tổng xác suất Bình rút trúng:
          $ P = 6 / 90 + 21 / 90 = 27 / 90 = 3 / 10 $
    ]
)

// TN 10 (Blackjack - Rút lá bài mang giá trị 10)
#tn([Trong trò chơi bài Blackjack, các lá bài mang giá trị $10$ điểm bao gồm các lá bài $10, J, Q, K$ thuộc cả $4$ chất trong bộ bài tú lơ khơ $52$ lá tiêu chuẩn. Rút ngẫu nhiên một lá bài từ bộ bài. Xác suất để rút được một lá bài mang giá trị $10$ điểm bằng],
    (
        True([$4 / 13$]),
        [$1 / 13$],
        [$3 / 13$],
        [$5 / 13$]
    ),
    loigiai: [
        *Phương pháp giải:* Có 4 giá trị bài mang 10 điểm ($10, J, Q, K$), mỗi giá trị có 4 lá bài (4 chất).
        - Tổng số lá bài mang giá trị 10 điểm là:
          $ 4 times 4 = 16 text(" lá") $
        - Xác suất:
          $ P = 16 / 52 = 4 / 13 $
    ]
)

// TN 11 (Tung đồng xu đối xứng 2 người)
#tn([Hai người bạn cùng chơi một trò chơi tung đồng xu độc lập. Mỗi người tung một đồng xu cân đối và đồng chất. Xác suất để cả hai người cùng nhận được kết quả mặt sấp bằng],
    (
        True([$1 / 4$]),
        [$1 / 2$],
        [$3 / 4$],
        [$1 / 8$]
    ),
    loigiai: [
        *Phương pháp giải:* Hai phép thử độc lập, mỗi phép thử có xác suất ra mặt sấp là $1 / 2$.
        $ P = (1 / 2) times (1 / 2) = 1 / 4 $
    ]
)

// TN 12 (Thùng phá sảnh Straight Flush)
#tn([Trong một ván bài Poker $5$ lá, Thùng phá sảnh (Straight Flush) là tay bài gồm $5$ lá bài liên tiếp có cùng một chất (không tính sảnh chúa Royal Flush). Có tất cả bao nhiêu tay bài Thùng phá sảnh (tính cả sảnh chúa) có thể tạo thành?],
    (
        True([$40$]),
        [$10$],
        [$20$],
        [$52$]
    ),
    loigiai: [
        *Phương pháp giải:* Với mỗi chất bài, các bộ 5 lá liên tiếp có thể bắt đầu từ Át (A-2-3-4-5) đến 10 (10-J-Q-K-A), có đúng 10 bộ sảnh đồng chất.
        Bộ bài có 4 chất nên tổng số tay bài là:
        $ 4 times 10 = 40 text(" tay bài") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Roulette Châu Âu)
#ds([Xét bánh xe Roulette Châu Âu gồm $37$ ô ($18$ Đỏ, $18$ Đen, $1$ Xanh lá cây).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Xác suất quả bóng rơi vào ô màu Đỏ bằng $18 / 37$.]),
    True([Xác suất quả bóng rơi vào ô số $0$ màu Xanh lá cây bằng $1 / 37$.]),
    True([Xác suất người chơi thua cược khi đặt cược vào cửa "Màu Đỏ" bằng $19 / 37$.]),
    [Xác suất để quả bóng rơi vào ô màu Đỏ bằng đúng xác suất rơi vào ô màu Đen hoặc Xanh.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Xác suất Roulette])
    - Màu Đỏ: $18 / 37$. Mệnh đề a ĐÚNG.
    - Số 0: $1 / 37$. Mệnh đề b ĐÚNG.
    - Thua cửa Đỏ: $1 - 18 / 37 = 19 / 37$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: So sánh xác suất])
    Xác suất ô Đen hoặc Xanh là $19 / 37$, trong khi ô Đỏ là $18 / 37$. Chúng không bằng nhau.
    Mệnh đề d SAI.
  ]
)

// DS 2 (Nghịch lý Monty Hall)
#ds([Xét trò chơi truyền hình Monty Hall với $3$ cánh cửa (gồm $1$ ô tô và $2$ con dê).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Xác suất để người chơi chọn đúng ô tô ở lần lựa chọn đầu tiên bằng $1 / 3$.]),
    True([Xác suất để ô tô nằm sau một trong hai cánh cửa người chơi chưa chọn bằng $2 / 3$.]),
    True([Nếu người chơi thực hiện chiến lược luôn luôn đổi cửa, xác suất trúng ô tô bằng $2 / 3$.]),
    [Dù người chơi đổi cửa hay giữ nguyên cửa thì xác suất trúng ô tô đều bằng $1 / 2$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Tính chất Monty Hall])
    - Lần đầu trúng ô tô: $1 / 3$. Mệnh đề a ĐÚNG.
    - Ô tô ở 2 cửa còn lại: $2 / 3$. Mệnh đề b ĐÚNG.
    - Đổi cửa cho xác suất $2 / 3$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Nhận định sai lầm phổ biến])
    Việc MC mở một cánh cửa có điều kiện làm thay đổi không gian thông tin. Xác suất đổi cửa là $2 / 3$, giữ cửa là $1 / 3$, không phải $1 / 2$.
    Mệnh đề d SAI.
  ]
)

// DS 3 (Rút thăm không hoàn lại hai người)
#ds([Xét hộp $10$ thăm (gồm $3$ thăm trúng thưởng). An và Bình lần lượt rút mỗi người một thăm không hoàn lại.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Xác suất để An rút được thăm trúng thưởng bằng $3 / 10$.]),
    True([Xác suất để cả hai người cùng rút được thăm trúng thưởng bằng $1 / 15$.]),
    True([Xác suất để người rút sau (Bình) rút được thăm trúng thưởng bằng $3 / 10$.]),
    [Người rút trước (An) luôn có lợi thế và có xác suất trúng thưởng cao hơn hẳn người rút sau (Bình).]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Rút thăm hai người])
    - An rút trúng: $3 / 10$. Mệnh đề a ĐÚNG.
    - Cả hai trúng: $(3 / 10) times (2 / 9) = 6 / 90 = 1 / 15$. Mệnh đề b ĐÚNG.
    - Bình rút trúng: $3 / 10$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tính công bằng của rút thăm])
    Cả người rút trước và người rút sau đều có xác suất trúng thưởng như nhau ($3 / 10$). Rút thăm không hoàn lại là hoàn toàn công bằng.
    Mệnh đề d SAI.
  ]
)

// DS 4 (Tay bài Cù lũ Poker)
#ds([Xét ván bài Poker $5$ lá rút ngẫu nhiên từ bộ bài $52$ lá.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số tay bài $5$ lá khác nhau có thể tạo thành bằng $2598960$.]),
    True([Số tay bài Cù lũ (Full House) bằng $3744$.]),
    True([Xác suất rút được một tay bài Cù lũ bằng $6 / 4165$.]),
    [Xác suất rút được một tay bài Cù lũ lớn hơn $0.01$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Cù lũ Full House])
    - Không gian mẫu: $C_52^5 = 2598960$. Mệnh đề a ĐÚNG.
    - Cù lũ: $13 times 4 times 12 times 6 = 3744$. Mệnh đề b ĐÚNG.
    - Xác suất: $3744 / 2598960 = 6 / 4165$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Độ lớn xác suất])
    $6 / 4165 approx 0.00144 < 0.01$. Khẳng định lớn hơn là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Bánh xe Roulette Châu Âu có $37$ ô (có $18$ ô Đỏ). Tính xác suất quả bóng rơi vào ô Đỏ (dưới dạng phân số tối giản).],
    [18/37],
    loigiai: [
        #step([Tính xác suất])
        $ 18 / 37 $
    ]
)

// TLN 2
#tln([Trong trò Craps, tính xác suất để tổng số chấm ở lần gieo đầu tiên bằng $7$ hoặc $11$ (dưới dạng phân số tối giản).],
    [2/9],
    loigiai: [
        #step([Tính xác suất])
        $ 8 / 36 = 2 / 9 $
    ]
)

// TLN 3
#tln([Trong gameshow Monty Hall, tính xác suất trúng ô tô nếu người chơi đổi cửa (dưới dạng phân số tối giản).],
    [2/3],
    loigiai: [
        #step([Chiến lược đổi cửa])
        $ 2 / 3 $
    ]
)

// TLN 4
#tln([Có bao nhiêu tay bài Thùng phá sảnh (Straight Flush) gồm $5$ lá bài liên tiếp cùng chất trong bộ bài $52$ lá?],
    [40],
    loigiai: [
        #step([Tích số sảnh])
        $ 4 times 10 = 40 $
    ]
)

// TLN 5
#tln([Một giải đấu loại trực tiếp có $8$ người chơi. Cần diễn ra tất cả bao nhiêu trận đấu để tìm ra nhà vô địch?],
    [7],
    loigiai: [
        #step([Số trận đấu])
        $ 8 - 1 = 7 text(" trận") $
    ]
)

// TLN 6
#tln([Một hộp có $10$ thăm (gồm $3$ thăm trúng). An và Bình lần lượt rút mỗi người một thăm. Tính xác suất để người thứ hai (Bình) rút trúng thưởng (dưới dạng phân số tối giản).],
    [3/10],
    loigiai: [
        #step([Xác suất rút sau])
        $ 3 / 10 $
    ]
)

] // end make-questions

#make-questions()
