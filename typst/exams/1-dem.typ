#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.0"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill:  math-color)
 
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  school: "Sở GD&ĐT Phú Thọ",
  exam-title: "THI THỬ THPT QUỐC GIA 2026",
  subject: "TOÁN",
  duration: "90 phút",
  structure: auto,         // tự đếm số câu mỗi phần
  code: "101",
  footer-left: ["GV Nguyễn Văn Sang"],
  accent: accent,
  show-topbar: false,      // tắt thanh xanh trên đỉnh
  header-border: true,
)
#tln(
  [Trong một kì thi học sinh giỏi Toán cấp tỉnh, hai bạn Minh Châu và Tiến Hân cùng đạt điểm tuyệt đối và chia sẻ vị trí thủ khoa. Tuy nhiên, Ban tổ chức chỉ có một suất học bổng đặc biệt dành cho vị trí xuất sắc nhất. Để quyết định người nhận học bổng, Ban tổ chức cho mỗi bạn cầm hai con xúc xắc cân đối đồng chất và cùng gieo, bạn nào có tổng số chấm lớn hơn thì được nhận học bổng, bằng điểm thì gieo lại. Hãy tính xác suất để bạn Minh Châu nhận được phần thưởng ngay sau lần gieo đầu tiên (_làm tròn kết quả đến hàng phần trăm_).],
  [$0,44$],
  loigiai: [
    #ppgiai[
      - Gọi $X, Y$ lần lượt là tổng số chấm xuất hiện trên hai con xúc xắc của Minh Châu và Tiến Hân. Ta cần tính xác suất $P(X > Y)$.
      - Do tính đối xứng và hai bạn dùng xúc xắc như nhau nên $P(X > Y) = P(X < Y)$.
      - Sử dụng tính chất biến cố đối và biến cố chắc chắn: $P(X > Y) + P(X < Y) + P(X = Y) = 1 => P(X > Y) = (1 - P(X = Y)) / 2$.
      - Tính xác suất hai bạn tung ra tổng số chấm bằng nhau $P(X=Y)$ bằng cách chia các trường hợp tổng số chấm từ 2 đến 12.
    ]
    
    Gọi $X$ là tổng số chấm trên 2 con xúc xắc do Minh Châu gieo ($X in {2, 3, ..., 12}$).
    Gọi $Y$ là tổng số chấm trên 2 con xúc xắc do Tiến Hân gieo ($Y in {2, 3, ..., 12}$).
    Khi gieo 2 con xúc xắc cân đối, không gian mẫu là $36$. Bảng phân phối xác suất của biến ngẫu nhiên $X$ (và cũng là của $Y$) như sau:
    - $P(X=2) = P(X=12) = 1/36$
    - $P(X=3) = P(X=11) = 2/36$
    - $P(X=4) = P(X=10) = 3/36$
    - $P(X=5) = P(X=9) = 4/36$
    - $P(X=6) = P(X=8) = 5/36$
    - $P(X=7) = 6/36$
    
    Do hai người gieo độc lập, xác suất để hai bạn gieo được tổng số chấm bằng nhau là:
    $ P(X=Y) &= sum_(k=2)^12 P(X=k) dot P(Y=k) = sum_(k=2)^12 [P(X=k)]^2 \
             &= (1^2 + 2^2 + 3^2 + 4^2 + 5^2 + 6^2 + 5^2 + 4^2 + 3^2 + 2^2 + 1^2) / 36^2 \
             &= 146 / 1296 = 73 / 648 $
             
    Vì $X$ và $Y$ có cùng phân phối xác suất nên $P(X > Y) = P(X < Y)$.
    Mặt khác, ta luôn có hệ thức: $P(X > Y) + P(X < Y) + P(X = Y) = 1$.
    Suy ra xác suất để Minh Châu thắng ngay lần gieo đầu tiên (tổng số chấm lớn hơn) là:
    $ P(X > Y) = (1 - P(X = Y)) / 2 = (1 - 73/648) / 2 = 575 / 1296 approx 0,44367... $
    
    Làm tròn kết quả đến hàng phần trăm, ta được *$0,44$*.
    
    #meo(title: [Tư duy đối xứng])[
      Khi hai đối tượng tham gia một trò chơi mang tính đối xứng hoàn toàn (luật giống hệt nhau, dụng cụ giống hệt nhau), xác suất thắng của mỗi người là bằng nhau. Do đó ta chỉ cần lấy $1$ trừ đi xác suất hòa rồi chia đôi là ra xác suất thắng của một người. Điều này giúp tránh phải liệt kê và cộng dồn tất cả các cặp điểm $(X,Y)$ thỏa mãn $X > Y$.
    ]
  ]
)


// Câu hỏi 1
#tln(
  [Hiện tại đã có $6000$ em học sinh TDM 2K8 và đang có hơn $20$ giải Nhất tỉnh Toán. Tại tỉnh Phú Thọ ở một lớp 12 của một trường THPT có hai bạn Minh Châu và Vi Tiến Hân cùng đăng kí học Toán thầy Ái TDM và cùng đạt Nhất thủ khoa tỉnh Toán. Thầy Ái chỉ trao giải thưởng textbf{THỦ KHOA TOÁN TỈNH} mỗi tỉnh một em cho nên muốn chọn ra một bạn để trao giải bằng cách cho mỗi bạn cầm hai con xúc xắc cân đối đồng chất và cùng gieo, bạn nào có tổng số chấm lớn hơn thì được chọn, bằng điểm thì gieo lại. Hãy tính xác suất để bạn Minh Châu nhận được phần thưởng textbf{THỦ KHOA TOÁN TỈNH} ngay sau lần gieo đầu tiên (textit{làm tròn kết quả đến hàng phần trăm}).],
  [$0,44$],
  loigiai: [
    #ppgiai[
      - Gọi $X, Y$ lần lượt là tổng số chấm xuất hiện trên hai con xúc xắc của Minh Châu và Vi Tiến Hân. Ta cần tính xác suất $P(X > Y)$.
      - Do tính đối xứng và hai bạn dùng xúc xắc như nhau nên $P(X > Y) = P(X < Y)$.
      - Sử dụng tính chất biến cố đối và biến cố chắc chắn: $P(X > Y) + P(X < Y) + P(X = Y) = 1 => P(X > Y) = (1 - P(X = Y)) / 2$.
      - Tính xác suất hai bạn tung ra tổng số chấm bằng nhau $P(X=Y)$ bằng cách chia các trường hợp tổng số chấm từ 2 đến 12.
    ]
    
    Gọi $X$ là tổng số chấm trên 2 con xúc xắc do Minh Châu gieo ($X in {2, 3, ..., 12}$).
    Gọi $Y$ là tổng số chấm trên 2 con xúc xắc do Vi Tiến Hân gieo ($Y in {2, 3, ..., 12}$).
    Khi gieo 2 con xúc xắc cân đối, không gian mẫu là $36$. Bảng phân phối xác suất của biến ngẫu nhiên $X$ (và cũng là của $Y$) như sau:
    - $P(X=2) = P(X=12) = 1/36$
    - $P(X=3) = P(X=11) = 2/36$
    - $P(X=4) = P(X=10) = 3/36$
    - $P(X=5) = P(X=9) = 4/36$
    - $P(X=6) = P(X=8) = 5/36$
    - $P(X=7) = 6/36$
    
    Do hai người gieo độc lập, xác suất để hai bạn gieo được tổng số chấm bằng nhau là:
    $ P(X=Y) &= sum_(k=2)^12 P(X=k) dot P(Y=k) = sum_(k=2)^12 [P(X=k)]^2 \
             &= (1^2 + 2^2 + 3^2 + 4^2 + 5^2 + 6^2 + 5^2 + 4^2 + 3^2 + 2^2 + 1^2) / 36^2 \
             &= 146 / 1296 = 73 / 648 $
             
    Vì $X$ và $Y$ có cùng phân phối xác suất nên $P(X > Y) = P(X < Y)$.
    Mặt khác, ta luôn có hệ thức: $P(X > Y) + P(X < Y) + P(X = Y) = 1$.
    Suy ra xác suất để Minh Châu thắng ngay lần gieo đầu tiên (tổng số chấm lớn hơn) là:
    $ P(X > Y) = (1 - P(X = Y)) / 2 = (1 - 73/648) / 2 = 575 / 1296 approx 0,44367... $
    
    Làm tròn kết quả đến hàng phần trăm, ta được *$0,44$*.
    
    #meo(title: [Tư duy đối xứng])[
      Khi hai đối tượng tham gia một trò chơi mang tính đối xứng hoàn toàn (luật giống hệt nhau, dụng cụ giống hệt nhau), xác suất thắng của mỗi người là bằng nhau. Do đó ta chỉ cần lấy $100%$ trừ đi xác suất hòa rồi chia đôi là ra xác suất thắng của một người. Điều này giúp tránh phải liệt kê và cộng dồn tất cả các cặp điểm $(X,Y)$ thỏa mãn $X > Y$.
    ]
  ]
)


#tn(
  [Trong một trò chơi thực tế ảo, hai người chơi A và B đấu tay đôi bằng cách đổ xúc xắc. Người chơi A sử dụng một viên xúc xắc $8$ mặt (các mặt được đánh số từ $1$ đến $8$). Người chơi B sử dụng một viên xúc xắc $6$ mặt truyền thống (các mặt đánh số từ $1$ đến $6$). Các viên xúc xắc đều cân đối và đồng chất. Ai đổ ra số chấm cao hơn sẽ giành chiến thắng lượt đó (nếu bằng điểm thì hòa). Tính xác suất để người chơi A giành chiến thắng.
  
  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      // Xúc xắc A (bát diện - minh họa 2D)
      line((0,0), (1, 1.5), (2,0), (1, -1.5), close: true, fill: rgb("ffe6cc"), stroke: 1pt)
      line((0,0), (2,0), stroke: 0.5pt)
      line((1, 1.5), (1, -1.5), stroke: 0.5pt)
      content((0.6, 0.4), text(weight: "bold")[$8$])
      content((1.4, -0.4), text(weight: "bold")[$7$])
      content((1, 2), text(fill: orange, weight: "bold")[Xúc xắc A])
      
      // Xúc xắc B (lập phương)
      rect((4, -0.8), (5.6, 0.8), fill: rgb("e6f2ff"), stroke: 1pt, radius: 2pt)
      circle((4.4, 0.4), radius: 2pt, fill: black)
      circle((5.2, -0.4), radius: 2pt, fill: black)
      circle((4.8, 0), radius: 2pt, fill: black)
      content((4.8, 1.3), text(fill: blue, weight: "bold")[Xúc xắc B])
      
      content((3, 0), text(weight: "bold", size: 1.2em, fill: red)[$V S$])
    })
  ]
  ],
  ([$1/2$], [$5/8$], [$27/64$], True([$9/16$])),
  loigiai: [
    #ppgiai[
      - Bài toán này *không còn tính đối xứng* do không gian mẫu của hai người khác nhau.
      - Gọi $X$ là số chấm của A, $Y$ là số chấm của B. Tính số phần tử của không gian mẫu $n(Omega)$.
      - Liệt kê số kết quả thuận lợi cho biến cố $X > Y$ dựa theo từng giá trị của $X$.
    ]
    
    Gọi $X$ là số chấm người chơi A đổ được ($X in {1, 2, 3, 4, 5, 6, 7, 8}$).
    Gọi $Y$ là số chấm người chơi B đổ được ($Y in {1, 2, 3, 4, 5, 6}$).
    Số phần tử của không gian mẫu là $n(Omega) = 8 times 6 = 48$.
    
    Gọi biến cố $C$: "Người chơi A chiến thắng", tức là $X > Y$.
    Ta xét các trường hợp của $X$:
    - Nếu $X = 1$: Không có giá trị $Y$ nào thỏa mãn $1 > Y$. (0 cách)
    - Nếu $X = 2$: $Y = 1$. (1 cách)
    - Nếu $X = 3$: $Y in {1, 2}$. (2 cách)
    - Nếu $X = 4$: $Y in {1, 2, 3}$. (3 cách)
    - Nếu $X = 5$: $Y in {1, 2, 3, 4}$. (4 cách)
    - Nếu $X = 6$: $Y in {1, 2, 3, 4, 5}$. (5 cách)
    - Nếu $X = 7$: $Y in {1, 2, 3, 4, 5, 6}$. (6 cách)
    - Nếu $X = 8$: $Y in {1, 2, 3, 4, 5, 6}$. (6 cách)
    
    Tổng số kết quả thuận lợi cho biến cố $C$ là:
    $ n(C) = 1 + 2 + 3 + 4 + 5 + 6 + 6 = 27 $
    
    Vậy xác suất để người chơi A giành chiến thắng là:
    $ P(C) = n(C) / n(Omega) = 27/48 = 9/16. $
    Chọn đáp án *D*.
  ]
)


#tn(
  [Trong một trò chơi thực tế ảo, hai người chơi A và B đấu tay đôi bằng cách đổ xúc xắc. Người chơi A sử dụng một viên xúc xắc $8$ mặt (các mặt được đánh số từ $1$ đến $8$). Người chơi B sử dụng một viên xúc xắc $6$ mặt truyền thống (các mặt đánh số từ $1$ đến $6$). Các viên xúc xắc đều cân đối và đồng chất. Ai đổ ra số chấm cao hơn sẽ giành chiến thắng lượt đó (nếu bằng điểm thì hòa). Tính xác suất để người chơi A giành chiến thắng.
  
  #align(center)[
    #cetz.canvas(length: 0.7cm, {
      import cetz.draw: *
      
      // Bóng đổ (Sử dụng circle với radius là một cặp giá trị để tạo elip)
      circle((-1.0, -2.7), radius: (1.4, 0.35), fill: rgb(0,0,0, 40), stroke: none)
      circle((5.6, -0.6), radius: (2.0, 0.6), fill: rgb(0,0,0, 40), stroke: none)

      // ==========================================
      // XÚC XẮC A (8 MẶT - Bát diện đều)
      // ==========================================
      let cxa = -1
      let cya = -0.5
      let topA = (cxa, cya + 2.8)
      let botA = (cxa, cya - 2.2)
      let leftA = (cxa - 1.8, cya + 0.2)
      let rightA = (cxa + 1.8, cya + 0.2)
      let frontA = (cxa, cya - 0.7)

      // Màu sắc 3D (Cam/Vàng)
      let colA1 = rgb("#ffca28") // Sáng nhất (Trái trên)
      let colA2 = rgb("#ffb300") // Sáng vừa (Phải trên)
      let colA3 = rgb("#ff8f00") // Tối vừa (Trái dưới)
      let colA4 = rgb("#e65100") // Tối nhất (Phải dưới)

      // Vẽ các mặt
      line(topA, leftA, frontA, close: true, fill: colA1, stroke: 0.8pt + white, join: "round")
      line(topA, rightA, frontA, close: true, fill: colA2, stroke: 0.8pt + white, join: "round")
      line(botA, leftA, frontA, close: true, fill: colA3, stroke: 0.8pt + white, join: "round")
      line(botA, rightA, frontA, close: true, fill: colA4, stroke: 0.8pt + white, join: "round")

      // Số trên mặt xúc xắc
      content((cxa - 0.6, cya + 0.8), text(fill: rgb("#b33c00"), weight: "black", size: 1.4em)[$8$])
      content((cxa + 0.7, cya + 0.8), text(fill: white, weight: "black", size: 1.4em)[$7$])
      content((cxa - 0.6, cya - 1.0), text(fill: white.darken(20%), weight: "bold", size: 1.1em)[$2$])
      content((cxa + 0.6, cya - 1.1), text(fill: white.darken(30%), weight: "bold", size: 1.1em)[$4$])

      content((cxa, cya + 3.5), text(fill: rgb("#e65100"), weight: "bold", size: 1.1em)[Xúc xắc A])

      // ==========================================
      // XÚC XẮC B (6 MẶT - Lập phương)
      // ==========================================
      let cxb = 5.6
      let cyb = -1.0
      // Tọa độ Isometric
      let p0 = (cxb, cyb - 0.5)           // Trái dưới (trước)
      let p1 = (cxb + 1.8, cyb + 0.5)     // Phải dưới
      let p3 = (cxb - 1.8, cyb + 0.5)     // Trái dưới (sau)
      let p4 = (cxb, cyb + 2.2)           // Đỉnh trước
      let p5 = (cxb + 1.8, cyb + 3.2)     // Đỉnh phải
      let p6 = (cxb, cyb + 4.2)           // Đỉnh cao nhất
      let p7 = (cxb - 1.8, cyb + 3.2)     // Đỉnh trái

      // Màu sắc 3D (Xanh dương)
      let colB_top = rgb("#bbdefb")   // Đỉnh (sáng nhất)
      let colB_left = rgb("#42a5f5")  // Trái (trung bình)
      let colB_right = rgb("#1565c0") // Phải (tối nhất)

      // Vẽ các mặt
      line(p4, p5, p6, p7, close: true, fill: colB_top, stroke: 1pt + white, join: "round") 
      line(p3, p7, p4, p0, close: true, fill: colB_left, stroke: 1pt + white, join: "round")
      line(p1, p5, p4, p0, close: true, fill: colB_right, stroke: 1pt + white, join: "round")

      // Dấu chấm (Pips)
      let p_col_left = white
      let p_col_right = rgb("#bbdefb")
      let p_col_top = rgb("#1565c0")
      
      // Mặt trái (3 chấm)
      circle((cxb - 0.9, cyb + 1.3), radius: 0.15, fill: p_col_left, stroke: none)
      circle((cxb - 1.3, cyb + 2.0), radius: 0.15, fill: p_col_left, stroke: none)
      circle((cxb - 0.5, cyb + 0.6), radius: 0.15, fill: p_col_left, stroke: none)

      // Mặt phải (5 chấm)
      circle((cxb + 0.9, cyb + 1.3), radius: 0.15, fill: p_col_right, stroke: none) // Tâm
      circle((cxb + 0.5, cyb + 1.8), radius: 0.15, fill: p_col_right, stroke: none) // Trái trên
      circle((cxb + 1.3, cyb + 0.8), radius: 0.15, fill: p_col_right, stroke: none) // Phải dưới
      circle((cxb + 0.5, cyb + 0.8), radius: 0.15, fill: p_col_right, stroke: none) // Trái dưới
      circle((cxb + 1.3, cyb + 1.8), radius: 0.15, fill: p_col_right, stroke: none) // Phải trên

      // Mặt trên (6 chấm)
      circle((cxb - 0.8, cyb + 2.8), radius: 0.15, fill: p_col_top, stroke: none)
      circle((cxb, cyb + 2.4), radius: 0.15, fill: p_col_top, stroke: none)
      circle((cxb + 0.8, cyb + 3.0), radius: 0.15, fill: p_col_top, stroke: none)
      circle((cxb - 0.8, cyb + 3.4), radius: 0.15, fill: p_col_top, stroke: none)
      circle((cxb, cyb + 3.0), radius: 0.15, fill: p_col_top, stroke: none)
      circle((cxb + 0.8, cyb + 3.6), radius: 0.15, fill: p_col_top, stroke: none)

      content((cxb, cya + 5.2), text(fill: rgb("#1565c0"), weight: "bold", size: 1.1em)[Xúc xắc B])

      // ==========================================
      // CHỮ VS TRANG TRÍ
      // ==========================================
      content((2.33, 1.17), text(fill: black.lighten(70%), weight: "black", size: 2em)[VS])
      content((2.3, 1.2), text(fill: rgb("#d32f2f"), weight: "black", size: 2em)[VS])
      
      // Tia chớp nhỏ
      line((2.3, 2.2), (2.3, 2.6), stroke: (paint: rgb("#d32f2f"), thickness: 1.5pt, cap: "round"))
      line((2.3, -0.2), (2.3, 0.2), stroke: (paint: rgb("#d32f2f"), thickness: 1.5pt, cap: "round"))
      line((1.3, 1.2), (1.6, 1.2), stroke: (paint: rgb("#d32f2f"), thickness: 1.5pt, cap: "round"))
      line((3.0, 1.2), (3.3, 1.2), stroke: (paint: rgb("#d32f2f"), thickness: 1.5pt, cap: "round"))
    })
  ]
  ],
  (
    [$1/2$], 
    [$5/8$], 
    [$27/64$], 
    True([$9/16$])
    ),
  loigiai: [
    #ppgiai[
      - Bài toán này *không còn tính đối xứng* do không gian mẫu của hai người khác nhau.
      - Gọi $X$ là số chấm của A, $Y$ là số chấm của B. Tính số phần tử của không gian mẫu $n(Omega)$.
      - Liệt kê số kết quả thuận lợi cho biến cố $X > Y$ dựa theo từng giá trị của $X$.
    ]
    
    Gọi $X$ là số chấm người chơi A đổ được ($X in {1, 2, 3, 4, 5, 6, 7, 8}$).
    Gọi $Y$ là số chấm người chơi B đổ được ($Y in {1, 2, 3, 4, 5, 6}$).
    Số phần tử của không gian mẫu là $n(Omega) = 8 times 6 = 48$.
    
    Gọi biến cố $C$: "Người chơi A chiến thắng", tức là $X > Y$.
    Ta xét các trường hợp của $X$:
    - Nếu $X = 1$: Không có giá trị $Y$ nào thỏa mãn $1 > Y$. (0 cách)
    - Nếu $X = 2$: $Y = 1$. (1 cách)
    - Nếu $X = 3$: $Y in {1, 2}$. (2 cách)
    - Nếu $X = 4$: $Y in {1, 2, 3}$. (3 cách)
    - Nếu $X = 5$: $Y in {1, 2, 3, 4}$. (4 cách)
    - Nếu $X = 6$: $Y in {1, 2, 3, 4, 5}$. (5 cách)
    - Nếu $X = 7$: $Y in {1, 2, 3, 4, 5, 6}$. (6 cách)
    - Nếu $X = 8$: $Y in {1, 2, 3, 4, 5, 6}$. (6 cách)
    
    Tổng số kết quả thuận lợi cho biến cố $C$ là:
    $ n(C) = 1 + 2 + 3 + 4 + 5 + 6 + 6 = 27 $
    
    Vậy xác suất để người chơi A giành chiến thắng là:
    $ P(C) = n(C) / n(Omega) = 27/48 = 9/16. $
    Chọn đáp án *D*.
  ]
)

#tn(
  [Một vật trang trí được thiết kế bao gồm một khối nón và một khối cầu (như hình vẽ). Khối nón có bán kính đáy $r=8" cm"$ và độ dài đường sinh $l=17" cm"$. Khối cầu có bán kính $R=5" cm"$. Tính tổng thể tích của khối nón và khối cầu cấu tạo nên vật trang trí đó.],
  (
    True([$(1460pi)/3 " cm"^3$]), 
    [$(820pi)/3 " cm"^3$], 
    [$460pi " cm"^3$], 
    [$(1000pi)/3 " cm"^3$]
  ),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    
    // Khối cầu
    circle((0, 1.6), radius: 1.6, fill: rgb("f5f5f5"), stroke: 0.5pt + gray)
    
    // Các đường sinh nón (minh họa)
    for i in range(0, 11) {
      let t = i * 18deg
      let x = 2.8 * calc.cos(t)
      let y = -0.5 * calc.sin(t)
      line((x, y), (0, 5), stroke: (paint: rgb("ffcc80"), thickness: 0.5pt))
    }
    
    // Viền khối nón
    bezier((-2.8, 0), (2.8, 0), (-2.8, -0.7), (2.8, -0.7), stroke: (paint: rgb("ff9900"), thickness: 1pt))
    bezier((-2.8, 0), (2.8, 0), (-2.8, 0.7), (2.8, 0.7), stroke: (paint: rgb("ff9900"), thickness: 1pt, dash: "dashed"))
    line((-2.8, 0), (0, 5), (2.8, 0), stroke: (paint: rgb("ff9900"), thickness: 1pt))

    // Chú thích l
    line((3.1, 0), (0.3, 5), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((1.8, 2.5), $l=17" cm"$, anchor: "west")

    // Chú thích r
    line((0, -1), (2.8, -1), mark: (start: ">", end: ">"), stroke: 0.5pt)
    line((0, 0), (0, -1.2), stroke: (dash: "dashed", thickness: 0.5pt))
    line((2.8, 0), (2.8, -1.2), stroke: (dash: "dashed", thickness: 0.5pt))
    content((1.4, -1.1), $r=8" cm"$, anchor: "north")

    // Chú thích R
    line((0, 1.6), (1.6, 1.6), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((0.8, 1.7), align(center)[$R=5" cm"$], anchor: "south")
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
      - Chiều cao của khối nón được tính theo định lý Pythagore: $h = sqrt(l^2 - r^2)$.
      - Thể tích khối nón có bán kính đáy $r$ và chiều cao $h$ là: $V_1 = 1/3 pi r^2 h$.
      - Thể tích khối cầu có bán kính $R$ là: $V_2 = 4/3 pi R^3$.
      - Tính tổng thể tích hai khối: $V = V_1 + V_2$.
    ]
    Chiều cao của khối nón là:
    $ h = sqrt(l^2 - r^2) = sqrt(17^2 - 8^2) = sqrt(289 - 64) = sqrt(225) = 15  (c m). $
    Thể tích của khối nón là:
    $ V_1 = 1/3 pi r^2 h = 1/3 pi dot 8^2 dot 15 = 320pi (c m^3). $
    Thể tích của khối cầu là:
    $ V_2 = 4/3 pi R^3 = 4/3 pi dot 5^3 = (500pi)/3 (c m)^3. $
    Tổng thể tích của khối nón và khối cầu là:
    $ V = V_1 + V_2 = 320pi + (500pi)/3 = (1460pi)/3 (c m)^3 $
  ]
)