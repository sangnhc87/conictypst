#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"


// #show: stexgv-doc.with(
//   doc-type: "book",
//   title: "CHUYÊN ĐỀ: XÁC SUẤT ĐỐI KHÁNG",
//   author: "GV Nguyễn Văn Sang",
//   theme-color: classic.blue
// )

#let math-color = rgb("#000000") 
#show math.equation: set text(fill: math-color)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ VÀ MỤC LỤC
// ═══════════════════════════════════════════════════════════
#v(1em)
#block(
  width: 100%,
  fill: rgb("#f4f8fc"),
  stroke: (left: 6pt + classic.blue, top: 0.5pt + rgb("#dbe4f0"), right: 0.5pt + rgb("#dbe4f0"), bottom: 0.5pt + rgb("#dbe4f0")),
  inset: 16pt,
  radius: (right: 4pt)
)[
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: XÁC SUẤT ĐỐI KHÁNG]
  
  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[CHỦ YẾU TÍNH XÁC SUẤT HOÀ.]
]
#v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "dethi"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill:  math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 

// ═══════════════════════════════════════════════════════════
// THIẾT KẾ CHUYÊN ĐỀ MẪU: BÀI TOÁN THỰC TẾ & VẬN DỤNG CAO
// ═══════════════════════════════════════════════════════════

#tln( [ Trong một cuộc thi Toán, hai học sinh Minh Châu và Tiến Hân cùng đạt điểm cao nhất. Ban tổ chức quyết định chọn ra một bạn để trao thưởng đặc biệt bằng cách cho mỗi bạn cầm hai con xúc xắc cân đối đồng chất và cùng gieo, bạn nào có tổng số chấm lớn hơn thì được chọn, bằng điểm thì gieo lại. Hãy tính xác suất để bạn Minh Châu nhận được phần thưởng ngay sau lần gieo đầu tiên (làm tròn kết quả đến hàng phần trăm). ], 
[0.44],
loigiai: 
[ #ppgiai
[ Tổng số chấm khi gieo hai con xúc xắc có các khả năng từ $2$ đến $12$ với số cách tương ứng là $1,2,3,4,5,6,5,4,3,2,1$. Do hai bạn gieo trong điều kiện như nhau nên xác suất Minh Châu thắng bằng xác suất Tiến Hân thắng. ]
Gọi $A$ là biến cố Minh Châu nhận được phần thưởng ngay sau lần gieo đầu tiên.
Xác suất hai bạn có cùng tổng số chấm là
$
P("hòa")
= frac(1^2 + 2^2 + 3^2 + 4^2 + 5^2 + 6^2 + 5^2 + 4^2 + 3^2 + 2^2 + 1^2, 36^2)
= frac(146, 1296)
= frac(73, 648).
$
Suy ra
$
P(A)
= frac(1 - P("hòa"), 2)
= frac(1 - frac(73, 648), 2)
= frac(575, 1296)
approx 0,4437.
$
Làm tròn đến hàng phần trăm, ta được
$
P(A) approx 0,44.
$
#meo[
Vì hai người có vai trò đối xứng nên chỉ cần tính xác suất hòa, sau đó lấy nửa xác suất không hòa.
]

], )
// Á à, tôi hiểu ý thầy rồi! Giữ nguyên cái "lõi" tư duy (tính đối xứng trong trò chơi đối kháng có cửa hoà) nhưng thay cái "vỏ" đi để học sinh không học vẹt. 
// Đổi từ xúc xắc sang bốc bóng, phân bố xác suất thay đổi một chút nhưng chiến thuật giải thì y hệt. Thầy xem thử câu này nhé:

#tln(
  [Trong một buổi ngoại khoá Toán học, hai học sinh Minh Khôi và Gia Linh tham gia một trò chơi tính điểm. Ban tổ chức chuẩn bị một hộp kín chứa $4$ quả bóng giống hệt nhau được đánh số từ $1$ đến $4$. 
  
  Mỗi bạn đến lượt sẽ bốc ngẫu nhiên đồng thời $2$ quả bóng từ hộp, ghi lại tổng các số trên $2$ quả bóng đó rồi trả lại vào hộp cho người kia bốc. Người nào bốc được tổng điểm lớn hơn sẽ giành chiến thắng, nếu bằng điểm nhau thì trò chơi hoà và cả hai phải bốc lại lượt mới. Hãy tính xác suất để bạn Minh Khôi giành chiến thắng ngay sau lượt bốc đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Hộp đựng bóng
      rect((-1.8, -1.2), (1.8, 1.2), stroke: 1.5pt, fill: rgb("f5f5f5"), radius: 0.2)
      line((-1.8, 0.8), (1.8, 0.8), stroke: 1pt) // Nắp hộp
      
      // Bóng bên trong
      let draw-ball(x, y, num, c) = {
        circle((x, y), radius: 0.45, fill: c, stroke: 0.8pt)
        content((x, y), text(weight: "bold", size: 1.2em)[#num])
      }
      
      draw-ball(-0.8, -0.4, 1, rgb("ff9999"))
      draw-ball(0.3, 0.3, 2, rgb("99ff99"))
      draw-ball(-0.4, 0.4, 3, rgb("9999ff"))
      draw-ball(0.8, -0.3, 4, rgb("ffff99"))
      
      // Tay bốc (minh hoạ đơn giản bằng mũi tên)
      line((0, 2.5), (0, 1), mark: (end: "stealth", fill: black), stroke: (thickness: 1.5pt, dash: "dashed"))
      content((0, 2.8), [*Bốc 2 quả*])
    })
  ]
  ],
  [$0,39$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Xác định không gian mẫu khi bốc $2$ quả bóng từ $4$ quả.
      - *Bước 2:* Gọi $X$ và $Y$ lần lượt là tổng điểm của Minh Khôi và Gia Linh. Lập bảng phân bố xác suất cho $X$.
      - *Bước 3:* Tính xác suất cửa hoà $P(X=Y)$.
      - *Bước 4:* Áp dụng tính chất đối xứng $P(X>Y) = P(X<Y)$ để tính xác suất thắng $P(X>Y) = (1 - P(X=Y))/2$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Trục toạ độ
        line((2, 0), (8, 0), mark: (end: ">")); content((8, -0.5), $k$)
        line((2.5, -0.5), (2.5, 4), mark: (end: ">")); content((2, 4), $P(X=k)$)
        
        // Vẽ biểu đồ phân bố
        let freqs = ((3, 1), (4, 1), (5, 2), (6, 1), (7, 1))
        for f in freqs {
          let x = f.at(0)
          let y = f.at(1) * 1.5
          rect((x - 0.35, 0), (x + 0.35, y), fill: rgb("ffe0b2"), stroke: rgb("f57c00"))
          content((x, -0.5), str(x))
          content((x, y + 0.3), text(size: 8pt)[$#f.at(1)/6$])
        }
        content((5, 4.5), text(size: 9pt, fill: rgb("f57c00"))[Phân bố xác suất tổng điểm])
      })
    ]
    
    Số cách bốc đồng thời $2$ quả bóng từ $4$ quả bóng là $n(Omega) = C_4^2 = 6$.
    Gọi $X, Y$ lần lượt là tổng điểm bốc được của Minh Khôi và Gia Linh. Các giá trị có thể có của $X$ là:
    - Tổng $3$: bốc được $(1;2) => P(X=3) = 1/6$
    - Tổng $4$: bốc được $(1;3) => P(X=4) = 1/6$
    - Tổng $5$: bốc được $(1;4)$ hoặc $(2;3) => P(X=5) = 2/6$
    - Tổng $6$: bốc được $(2;4) => P(X=6) = 1/6$
    - Tổng $7$: bốc được $(3;4) => P(X=7) = 1/6$
    
    Do hai bạn bốc độc lập từ cùng một hộp (có hoàn lại) nên $X$ và $Y$ có cùng quy luật phân bố xác suất.
    Xác suất để hai bạn bốc được tổng điểm bằng nhau (trò chơi hoà) là:
    $ P(X=Y) &= P(X=3)P(Y=3) + P(X=4)P(Y=4) + P(X=5)P(Y=5) \
             &quad + P(X=6)P(Y=6) + P(X=7)P(Y=7) \
             &= (1/6)^2 + (1/6)^2 + (2/6)^2 + (1/6)^2 + (1/6)^2 \
             &= (1 + 1 + 4 + 1 + 1)/36 = 8/36 = 2/9. $
             
    Vì trò chơi hoàn toàn công bằng nên xác suất thắng của hai bạn là như nhau: $P(X>Y) = P(X<Y)$.
    Mặt khác, tổng các xác suất bằng $1$ nên ta có:
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Minh Khôi giành chiến thắng ngay sau lượt bốc đầu tiên là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 2/9)/2 = (7/9)/2 = 7/18 approx 0,3888... $
    
    Làm tròn kết quả đến hàng phần trăm, ta được $0,39$.
    
    #meo[
      Cốt lõi của những bài toán "đọ điểm" kiểu này luôn là công thức vàng: $P("Thắng") = (1 - P("Hoà")) / 2$. Thầy cô nên nhắc học trò chỉ cần tập trung tính xác suất cửa Hoà (tổng bình phương các xác suất thành phần), tránh việc liệt kê thủ công đếm số trường hợp Thắng rất dễ bị sót nghiệm.
    ]
  ]
)
#tln(
  [Trong một trò chơi dân gian dịp hội xuân, hai bạn Hải Đăng và Thảo My cùng tham gia thử thách bốc bi tính điểm. Ban tổ chức chuẩn bị một chiếc hộp kín chứa $5$ viên bi giống hệt nhau về kích thước và khối lượng, được đánh số từ $1$ đến $5$. 
  
  Mỗi bạn đến lượt sẽ bốc ngẫu nhiên đồng thời $2$ viên bi từ hộp, tính tổng các số ghi trên $2$ viên bi đó rồi trả lại vào hộp cho người kia bốc. Người nào có tổng điểm lớn hơn sẽ giành chiến thắng, nếu bằng điểm nhau thì kết quả hoà và cả hai phải bốc lại lượt mới. Hãy tính xác suất để bạn Hải Đăng giành chiến thắng ngay sau lượt bốc đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Hộp đựng bi
      rect((-2.2, -1.2), (2.2, 1.2), stroke: 1.5pt, fill: rgb("f5f5f5"), radius: 0.2)
      line((-2.2, 0.8), (2.2, 0.8), stroke: 1pt) // Nắp hộp
      
      // Bi bên trong
      let draw-ball(x, y, num, c) = {
        circle((x, y), radius: 0.45, fill: c, stroke: 0.8pt)
        content((x, y), text(weight: "bold", size: 1.2em)[#num])
      }
      
      draw-ball(-1.3, -0.4, 1, rgb("ff9999"))
      draw-ball(-0.4, -0.5, 2, rgb("99ff99"))
      draw-ball(0.5, -0.4, 3, rgb("9999ff"))
      draw-ball(-0.8, 0.4, 4, rgb("ffff99"))
      draw-ball(0.2, 0.5, 5, rgb("ffcc99"))
      
      // Mũi tên bốc bi
      line((0, 2.5), (0, 1.2), mark: (end: "stealth", fill: black), stroke: (thickness: 1.5pt, dash: "dashed"))
      content((0, 2.8), [*Bốc 2 viên*])
    })
  ]
  ],
  [$0,42$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Xác định không gian mẫu khi bốc $2$ viên bi từ $5$ viên.
      - *Bước 2:* Gọi $X$ và $Y$ lần lượt là tổng điểm của Hải Đăng và Thảo My. Lập bảng phân bố xác suất cho biến ngẫu nhiên $X$.
      - *Bước 3:* Tính xác suất cửa hoà $P(X=Y)$.
      - *Bước 4:* Áp dụng tính chất đối xứng $P(X>Y) = P(X<Y)$ để tính xác suất thắng $P(X>Y) = (1 - P(X=Y))/2$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        // Trục toạ độ
        line((1.5, 0), (10, 0), mark: (end: ">")); content((10, -0.5), $k$)
        line((2, -0.5), (2, 4), mark: (end: ">")); content((1.5, 4), $P(X=k)$)
        
        // Vẽ biểu đồ phân bố
        let freqs = ((3, 1), (4, 1), (5, 2), (6, 2), (7, 2), (8, 1), (9, 1))
        for f in freqs {
          let x = f.at(0)
          let y = f.at(1) * 1.5
          rect((x - 0.35, 0), (x + 0.35, y), fill: rgb("ffe0b2"), stroke: rgb("f57c00"))
          content((x, -0.5), str(x))
          content((x, y + 0.3), text(size: 8pt)[$#f.at(1)/10$])
        }
        content((6, 4.5), text(size: 9pt, fill: rgb("f57c00"))[Phân bố xác suất tổng điểm])
      })
    ]
    
    Số cách bốc đồng thời $2$ viên bi từ $5$ viên bi là $n(Omega) = C_5^2 = 10$.
    Gọi $X, Y$ lần lượt là tổng điểm bốc được của Hải Đăng và Thảo My. Các giá trị có thể có của $X$ (tổng $2$ số khác nhau từ $1$ đến $5$) là:
    - Tổng $3$: bốc được $(1;2) => P(X=3) = 1/10$
    - Tổng $4$: bốc được $(1;3) => P(X=4) = 1/10$
    - Tổng $5$: bốc được $(1;4)$ hoặc $(2;3) => P(X=5) = 2/10$
    - Tổng $6$: bốc được $(1;5)$ hoặc $(2;4) => P(X=6) = 2/10$
    - Tổng $7$: bốc được $(2;5)$ hoặc $(3;4) => P(X=7) = 2/10$
    - Tổng $8$: bốc được $(3;5) => P(X=8) = 1/10$
    - Tổng $9$: bốc được $(4;5) => P(X=9) = 1/10$
    
    Do hai bạn bốc độc lập từ cùng một hộp (có hoàn lại) nên $X$ và $Y$ độc lập và có cùng quy luật phân bố xác suất.
    Xác suất để hai bạn bốc được tổng điểm bằng nhau (trò chơi hoà) là:
    $ P(X=Y) &= P(X=3)^2 + P(X=4)^2 + P(X=5)^2 + P(X=6)^2 \ 
             &quad + P(X=7)^2 + P(X=8)^2 + P(X=9)^2 \
             &= (1/10)^2 + (1/10)^2 + (2/10)^2 + (2/10)^2 \
             &quad + (2/10)^2 + (1/10)^2 + (1/10)^2 \
             &= (1 + 1 + 4 + 4 + 4 + 1 + 1)/100 = 16/100 = 4/25. $
             
    Vì trò chơi hoàn toàn công bằng nên xác suất thắng của hai bạn là như nhau: $P(X>Y) = P(X<Y)$.
    Mặt khác, tổng các xác suất bằng $1$ nên ta có:
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Hải Đăng giành chiến thắng ngay sau lượt bốc đầu tiên là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 0,16)/2 = 0,84/2 = 0,42. $
    
    Kết quả là $0,42$.
    
    #luuy[
      Điều kiện kiên quyết để có thể áp dụng tính chất $P(X>Y) = P(X<Y)$ là hai biến ngẫu nhiên $X$ và $Y$ phải độc lập và có *cùng phân phối xác suất*. Hành động "trả lại bi vào hộp trước khi người kia bốc" chính là chìa khóa đảm bảo điều kiện này. Nếu không có chi tiết này, xác suất của người bốc sau sẽ bị phụ thuộc vào người bốc trước.
    ]
  ]
)
#tln(
  [Trong một trò chơi board game, hai bạn Tuấn và Tú thi đấu phân định thắng thua bằng xúc xắc. Mỗi bạn được phát $2$ viên xúc xắc cân đối và đồng chất. Khi đến lượt, mỗi người gieo đồng thời cả $2$ viên xúc xắc của mình và tính tổng số chấm xuất hiện trên hai mặt hướng lên trên. Người nào có tổng số chấm lớn hơn sẽ giành chiến thắng. Nếu tổng số chấm bằng nhau, hai bạn hoà và phải gieo lại lượt mới. Hãy tính xác suất để bạn Tuấn giành chiến thắng ngay sau lượt gieo đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      let draw-die(cx, cy, val, cfill) = {
         rect((cx - 0.4, cy - 0.4), (cx + 0.4, cy + 0.4), fill: cfill, stroke: 1pt, radius: 0.1)
         content((cx, cy), text(weight: "bold", size: 1.2em)[#val])
      }
      
      // Tuấn
      draw-die(-1.5, 0, 5, rgb("e0f7fa"))
      draw-die(-0.5, 0, 4, rgb("e0f7fa"))
      content((-1, -0.8), [*Tuấn*])
      
      content((1, 0), text(size: 1.5em)[$>$])
      
      // Tú
      draw-die(2.5, 0, 3, rgb("ffebee"))
      draw-die(3.5, 0, 6, rgb("ffebee"))
      content((3, -0.8), [*Tú*])
    })
  ]
  ],
  [$0,44$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Xác định không gian mẫu và quy luật phân bố xác suất cho tổng số chấm khi gieo $2$ viên xúc xắc.
      - *Bước 2:* Gọi $X, Y$ lần lượt là tổng số chấm của Tuấn và Tú. Tính xác suất xảy ra cửa hoà $P(X=Y)$ bằng tổng bình phương các xác suất thành phần.
      - *Bước 3:* Áp dụng tính chất đối xứng $P(X>Y) = P(X<Y)$ và định lý xác suất toàn phần $P(X>Y) + P(X<Y) + P(X=Y) = 1$ để suy ra xác suất chiến thắng.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        line((1, 0), (13, 0), mark: (end: ">")); content((13, -0.6), $k$)
        line((1.5, -0.5), (1.5, 7), mark: (end: ">")); content((1, 7), $P(X=k)$)
        
        let freqs = (
          (2, 1), (3, 2), (4, 3), (5, 4), (6, 5), (7, 6),
          (8, 5), (9, 4), (10, 3), (11, 2), (12, 1)
        )
        for f in freqs {
          let x = f.at(0)
          let y = f.at(1)
          rect((x - 0.4, 0), (x + 0.4, y), fill: rgb("b39ddb"), stroke: rgb("5e35b1"))
          content((x, -0.6), str(x))
          content((x, y + 0.4), text(size: 7pt)[$#f.at(1)/36$])
        }
        content((7, 7.8), text(size: 9pt, fill: rgb("5e35b1"))[Phân bố xác suất tổng số chấm của 2 xúc xắc])
      })
    ]
    
    Khi gieo $2$ viên xúc xắc cân đối đồng chất, số kết quả có thể xảy ra là $6 times 6 = 36$.
    Gọi $X, Y$ lần lượt là tổng số chấm xuất hiện của Tuấn và Tú ($X, Y in {2; 3; ...; 12}$).
    Phân bố xác suất của $X$ (cũng như của $Y$) là:
    - $P(X=2) = P(X=12) = 1/36$
    - $P(X=3) = P(X=11) = 2/36$
    - $P(X=4) = P(X=10) = 3/36$
    - $P(X=5) = P(X=9) = 4/36$
    - $P(X=6) = P(X=8) = 5/36$
    - $P(X=7) = 6/36$
    
    Xác suất để hai bạn gieo được tổng số chấm bằng nhau (kết quả hoà) là:
    $ P(X=Y) &= P(X=2)^2 + P(X=3)^2 + ... + P(X=12)^2 \
             &= 2 dot ((1/36)^2 + (2/36)^2 + (3/36)^2 + (4/36)^2 + (5/36)^2) + (6/36)^2 \
             &= (2(1 + 4 + 9 + 16 + 25) + 36)/1296 = (2 dot 55 + 36)/1296 = 146/1296 = 73/648. $
             
    Do trò chơi công bằng (hai bạn dùng xúc xắc như nhau) nên xác suất thắng của mỗi người là bằng nhau: $P(X>Y) = P(X<Y)$.
    Lại có tổng các xác suất tạo thành không gian mẫu nên:
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Tuấn giành chiến thắng ngay sau lượt gieo đầu tiên là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 73/648)/2 = (575/648)/2 = 575/1296 approx 0,4436... $
    
    Làm tròn kết quả đến hàng phần trăm, ta được $0,44$.
    
    #nhanxet[
      Đây là mô hình bài toán kinh điển về xác suất trong các trò chơi đối xứng có cửa hoà. Việc tính trực tiếp biến cố "Thắng" (đếm số các cặp trường hợp $X > Y$) sẽ vô cùng phức tạp và dễ sai sót. Chuyển sang tính xác suất "Hoà" $P(X=Y)$ bằng tổng bình phương các xác suất rồi suy ngược lại theo phần bù là tư duy ngắn gọn và chính xác nhất.
    ]
  ]
)
#tln(
  [Tại một gian hàng hội chợ Xuân, hai bạn Minh Tâm và Hải Nam cùng tham gia trò chơi "Vòng quay kỳ diệu" để giành phần thưởng. Ban tổ chức chuẩn bị một vòng quay được chia thành $4$ phần bằng nhau, ghi các số $1, 2, 3, 4$. 
  
  Mỗi bạn đến lượt sẽ quay vòng quay $2$ lần liên tiếp. Điểm số của mỗi người được tính bằng *tích* của hai số quay được trong lượt của mình. Người nào có điểm số lớn hơn sẽ giành chiến thắng, nếu điểm bằng nhau thì kết quả hoà và cả hai phải chơi lại lượt mới. Hãy tính xác suất để bạn Minh Tâm giành chiến thắng ngay sau lượt chơi đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Khung vòng quay
      circle((0,0), radius: 1.5, fill: rgb("fffde7"), stroke: (paint: rgb("fbc02d"), thickness: 2pt))
      circle((0,0), radius: 1.6, stroke: (paint: rgb("f57f17"), thickness: 3pt))
      
      // Các đường chia 4 phần
      line((-1.5,0), (1.5,0), stroke: (paint: rgb("fbc02d"), thickness: 1.5pt))
      line((0,-1.5), (0,1.5), stroke: (paint: rgb("fbc02d"), thickness: 1.5pt))
      
      // Số trên vòng quay
      content((0.6, 0.6), text(weight: "bold", size: 1.4em, fill: rgb("d32f2f"))[$1$])
      content((-0.6, 0.6), text(weight: "bold", size: 1.4em, fill: rgb("1976d2"))[$2$])
      content((-0.6, -0.6), text(weight: "bold", size: 1.4em, fill: rgb("388e3c"))[$3$])
      content((0.6, -0.6), text(weight: "bold", size: 1.4em, fill: rgb("7b1fa2"))[$4$])
      
      // Kim chỉ thị
      line((0,0), (0.7, 0.2), mark: (end: "stealth", fill: red, scale: 1.5), stroke: (paint: red, thickness: 2pt))
      circle((0,0), radius: 4pt, fill: rgb("424242"))
      
      // Chân đế vòng quay
      line((0, -1.6), (-0.8, -2.2), stroke: (paint: rgb("795548"), thickness: 3pt))
      line((0, -1.6), (0.8, -2.2), stroke: (paint: rgb("795548"), thickness: 3pt))
      line((-1, -2.2), (1, -2.2), stroke: (paint: rgb("5d4037"), thickness: 4pt))
    })
  ]
  ],
  [$0,44$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Xác định không gian mẫu khi quay $2$ lần (mỗi lần $4$ khả năng).
      - *Bước 2:* Gọi $X, Y$ lần lượt là điểm số (tích $2$ lần quay) của Minh Tâm và Hải Nam. Lập bảng phân bố xác suất cho biến ngẫu nhiên $X$. Khác với bài toán tính tổng, phép nhân sẽ tạo ra một phân bố xác suất có hình dáng đặc biệt hơn.
      - *Bước 3:* Tính xác suất cửa hoà $P(X=Y)$ bằng tổng bình phương các xác suất thành phần.
      - *Bước 4:* Áp dụng tính chất đối xứng $P(X>Y) = P(X<Y)$ để tính xác suất thắng $P(X>Y) = (1 - P(X=Y))/2$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.7cm, {
        import cetz.draw: *
        // Trục toạ độ
        line((-0.5, 0), (13, 0), mark: (end: ">")); content((13, -0.5), $k$)
        line((0, -0.5), (0, 5), mark: (end: ">")); content((-0.5, 5), $P(X=k)$)
        
        // Mảng chứa các giá trị và tần số: (giá trị thực tế, vị trí x trên trục, tần số tử số)
        let data = (
          (1, 1, 1), (2, 2.2, 2), (3, 3.4, 2), 
          (4, 4.6, 3), (6, 5.8, 2), (8, 7, 2), 
          (9, 8.2, 1), (12, 9.4, 2), (16, 10.6, 1)
        )
        
        for d in data {
          let val = d.at(0)
          let x = d.at(1)
          let y = d.at(2) * 1.2
          rect((x - 0.4, 0), (x + 0.4, y), fill: rgb("a5d6a7"), stroke: rgb("2e7d32"))
          content((x, -0.6), str(val))
          content((x, y + 0.4), text(size: 7pt)[$#d.at(2)/16$])
        }
        content((6, 5.5), text(size: 9pt, fill: rgb("2e7d32"))[Phân bố xác suất của tích 2 lần quay])
      })
    ]
    
    Mỗi bạn quay $2$ lần, mỗi lần có $4$ kết quả nên không gian mẫu của mỗi người là $4 times 4 = 16$.
    Gọi $X, Y$ lần lượt là tích số chấm của Minh Tâm và Hải Nam. 
    Các giá trị có thể có của $X$ và xác suất tương ứng:
    - Điểm $1$: $(1,1) => P(X=1) = 1/16$
    - Điểm $2$: $(1,2), (2,1) => P(X=2) = 2/16$
    - Điểm $3$: $(1,3), (3,1) => P(X=3) = 2/16$
    - Điểm $4$: $(1,4), (4,1), (2,2) => P(X=4) = 3/16$
    - Điểm $6$: $(2,3), (3,2) => P(X=6) = 2/16$
    - Điểm $8$: $(2,4), (4,2) => P(X=8) = 2/16$
    - Điểm $9$: $(3,3) => P(X=9) = 1/16$
    - Điểm $12$: $(3,4), (4,3) => P(X=12) = 2/16$
    - Điểm $16$: $(4,4) => P(X=16) = 1/16$
    
    Do hai bạn chơi hoàn toàn độc lập nên $X$ và $Y$ có cùng phân bố xác suất.
    Xác suất để hai bạn hoà nhau (cùng điểm số) là:
    $ P(X=Y) &= P(X=1)^2 + P(X=2)^2 + ... + P(X=16)^2 \
             &= (1^2 + 2^2 + 2^2 + 3^2 + 2^2 + 2^2 + 1^2 + 2^2 + 1^2)/16^2 \
             &= (1 + 4 + 4 + 9 + 4 + 4 + 1 + 4 + 1)/256 \
             &= 32/256 = 1/8. $
             
    Theo tính chất đối xứng của trò chơi công bằng, xác suất thắng của hai bạn là bằng nhau: $P(X>Y) = P(X<Y)$.
    Mặt khác ta có phương trình không gian mẫu:
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Minh Tâm giành chiến thắng ngay sau lượt đầu tiên là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 1/8)/2 = (7/8)/2 = 7/16 = 0,4375. $
    
    Làm tròn kết quả đến hàng phần trăm, ta được $0,44$.
    
    #nhanxet[
      Bài toán đã thay đổi phép toán từ "Tổng" sang "Tích". Điều này làm cho biểu đồ phân bố xác suất không còn dạng đối xứng hình chuông (đồ thị Gauss) quen thuộc như khi tính tổng xúc xắc, mà bị kéo giãn và đứt quãng ở các số nguyên tố. Tuy nhiên, điều tuyệt vời là tư duy giải bài toán bằng phần bù $P("Thắng") = (1 - P("Hoà")) / 2$ vẫn đúng đắn tuyệt đối, chứng minh sức mạnh của phương pháp sử dụng tính chất đối xứng trong Xác suất.
    ]
  ]
)
#tln(
  [Tại lễ hội toán học của trường THPT Nguyễn Hữu Cảnh, hai học sinh Tuấn Đạt và Diệu Nhi tham gia thử thách "Con số may mắn". Ban tổ chức chuẩn bị một chiếc hộp kín chứa $10$ viên bi giống hệt nhau về kích thước và khối lượng, được đánh số từ $1$ đến $10$. 
  
  Mỗi bạn đến lượt sẽ bốc ngẫu nhiên đồng thời $2$ viên bi từ hộp, tính tổng các số ghi trên $2$ viên bi đó rồi trả lại toàn bộ vào hộp cho người kia bốc. Người nào có tổng điểm lớn hơn sẽ giành phần thưởng, nếu bằng điểm nhau thì kết quả hoà và cả hai phải bốc lại lượt mới. Hãy tính xác suất để bạn Tuấn Đạt giành chiến thắng ngay sau lượt bốc đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Hộp đựng bi
      rect((-2.5, -1.5), (2.5, 1.5), stroke: 1.5pt, fill: rgb("f5f5f5"), radius: 0.2)
      line((-2.5, 1.0), (2.5, 1.0), stroke: 1pt) // Nắp hộp
      
      // Hàm vẽ bi
      let draw-ball(x, y, num, c) = {
        circle((x, y), radius: 0.38, fill: c, stroke: 0.8pt)
        content((x, y), text(weight: "bold", size: 1.1em)[#num])
      }
      
      // Vẽ 10 viên bi phân bố ngẫu nhiên trong hộp
      draw-ball(-1.8, -0.6, 1, rgb("ffadad"))
      draw-ball(-1.0, 0.2, 2, rgb("ffd6a5"))
      draw-ball(-0.2, -0.8, 3, rgb("fdffb6"))
      draw-ball(0.6, 0.4, 4, rgb("caffbf"))
      draw-ball(1.6, -0.5, 5, rgb("9bf6ff"))
      draw-ball(-1.4, 0.6, 6, rgb("a0c4ff"))
      draw-ball(0.0, 0.0, 7, rgb("bdb2ff"))
      draw-ball(1.0, -0.7, 8, rgb("ffc6ff"))
      draw-ball(1.8, 0.5, 9, rgb("fffffc"))
      draw-ball(0.8, 0.6, 10, rgb("f08080"))
      
      // Mũi tên bốc bi
      line((0, 2.5), (0, 1.2), mark: (end: "stealth", fill: black), stroke: (thickness: 1.5pt, dash: "dashed"))
      content((0, 2.8), [*Bốc 2 viên*])
    })
  ]
  ],
  [$0,46$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Tính số phần tử của không gian mẫu khi bốc $2$ viên bi từ $10$ viên.
      - *Bước 2:* Gọi $X$ và $Y$ lần lượt là tổng điểm của Tuấn Đạt và Diệu Nhi. Xác định các giá trị có thể có của $X$ và thống kê tần số (số cách bốc) cho mỗi mức điểm. Bài toán tăng số lượng bi nên việc lập bảng thống kê cần cẩn thận để không sót trường hợp.
      - *Bước 3:* Tính xác suất cửa hoà $P(X=Y) = (sum f_i^2) / n(Omega)^2$.
      - *Bước 4:* Áp dụng tính đối xứng $P(X>Y) = (1 - P(X=Y))/2$ để tìm đáp án.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.45cm, {
        import cetz.draw: *
        // Trục toạ độ
        line((1, 0), (21, 0), mark: (end: ">")); content((21, -1), $k$)
        line((2, -0.5), (2, 7.5), mark: (end: ">")); content((1, 7.5), $P(X=k)$)
        
        // Mảng chứa giá trị tổng (k) và tần số (số cách bốc được tổng đó)
        let freqs = (
          (3, 1), (4, 1), (5, 2), (6, 2), (7, 3), (8, 3), (9, 4), (10, 4),
          (11, 5), (12, 4), (13, 4), (14, 3), (15, 3), (16, 2), (17, 2), (18, 1), (19, 1)
        )
        
        for f in freqs {
          let x = f.at(0)
          let y = f.at(1) * 1.2
          rect((x - 0.35, 0), (x + 0.35, y), fill: rgb("bbdefb"), stroke: rgb("1976d2"))
          content((x, -1), text(size: 8pt)[#str(x)])
          content((x, y + 0.6), text(size: 6pt)[$#f.at(1)/45$])
        }
        content((11, 8.5), text(size: 9pt, fill: rgb("1976d2"))[Phân bố xác suất tổng điểm 2 viên bi])
      })
    ]
    
    Số cách bốc đồng thời $2$ viên bi từ $10$ viên bi là $n(Omega) = C_10^2 = 45$.
    Gọi $X, Y$ lần lượt là tổng điểm bốc được của Tuấn Đạt và Diệu Nhi. 
    Các giá trị có thể có của $X$ chạy từ $1+2=3$ đến $9+10=19$. 
    Thống kê tần số (số cặp bi) cho mỗi tổng $X=k$ như sau:
    - Tổng $3, 4, 18, 19$: mỗi tổng có $1$ cặp.
    - Tổng $5, 6, 16, 17$: mỗi tổng có $2$ cặp.
    - Tổng $7, 8, 14, 15$: mỗi tổng có $3$ cặp.
    - Tổng $9, 10, 12, 13$: mỗi tổng có $4$ cặp.
    - Tổng $11$: có $5$ cặp (gồm $(1;10), (2;9), (3;8), (4;7), (5;6)$).
    
    Do hai bạn bốc độc lập từ cùng một hộp (có hoàn lại) nên $X$ và $Y$ độc lập, cùng phân phối.
    Xác suất để hai bạn bốc được tổng điểm bằng nhau (kết quả hoà) là tổng bình phương các xác suất thành phần:
    $ P(X=Y) &= sum_(k=3)^19 P(X=k)^2 \
             &= (2 dot (1^2 + 1^2 + 2^2 + 2^2 + 3^2 + 3^2 + 4^2 + 4^2) + 5^2) / 45^2 \
             &= (2 dot (1 + 1 + 4 + 4 + 9 + 9 + 16 + 16) + 25) / 2025 \
             &= (2 dot 60 + 25) / 2025 = 145 / 2025 = 29 / 405. $
             
    Vì trò chơi công bằng nên xác suất chiến thắng của hai bạn là như nhau: $P(X>Y) = P(X<Y)$.
    Mặt khác, tổng xác suất các biến cố luôn bằng $1$:
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Tuấn Đạt giành chiến thắng ngay sau lượt bốc đầu tiên là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 29/405)/2 = (376/405)/2 = 188/405 approx 0,4641... $
    
    Làm tròn kết quả đến hàng phần trăm, ta được $0,46$.
    
    #nhanxet[
      Khi quy mô bài toán tăng lên (từ $5$ bi lên $10$ bi), nếu học sinh không nắm vững phương pháp $P("Thắng") = (1 - P("Hoà")) / 2$ mà cắm đầu đi liệt kê các trường hợp $X > Y$ thì chắc chắn sẽ "lạc trôi" giữa phòng thi. 
      Ngoài ra, việc nhận diện tính đối xứng của biểu đồ phân bố (tần số của tổng $k$ bằng tần số của tổng $22-k$) giúp rút ngắn một nửa thời gian tính tổng bình phương $sum f_i^2$. Học trò nên lưu ý "cái bẫy" tính toán này để tối ưu tốc độ làm bài.
    ]
  ]
)
#tln(
  [Trong một buổi sinh hoạt câu lạc bộ Toán học, hai học sinh Gia Huy và Bảo Ngọc lọt vào vòng chung kết. Ban tổ chức quyết định phân định người chiến thắng bằng cách cho mỗi bạn tung $3$ đồng xu cân đối và đồng chất. Bạn nào tung được nhiều mặt sấp (S) hơn sẽ giành chiến thắng, nếu số mặt sấp bằng nhau thì cả hai cùng tung lại. Hãy tính xác suất để bạn Gia Huy giành chiến thắng ngay sau lần tung đầu tiên (_làm tròn kết quả đến hàng phần trăm_).
  
  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      let draw-coin(x, y, text-face, color-fill) = {
        circle((x, y), radius: 0.4, fill: color-fill, stroke: rgb("b8860b") + 1pt)
        circle((x, y), radius: 0.32, stroke: rgb("b8860b") + 0.5pt)
        content((x, y), text(weight: "bold", fill: rgb("8b6508"))[#text-face])
      }
      
      // Gia Huy
      draw-coin(0, 0, "S", rgb("ffd700"))
      draw-coin(1, 0, "S", rgb("ffd700"))
      draw-coin(2, 0, "N", rgb("e0e0e0"))
      content((1, -0.8), [*Gia Huy*])
      
      content((3.5, 0), text(size: 1.5em)[$>$])
      
      // Bảo Ngọc
      draw-coin(5, 0, "S", rgb("ffd700"))
      draw-coin(6, 0, "N", rgb("e0e0e0"))
      draw-coin(7, 0, "N", rgb("e0e0e0"))
      content((6, -0.8), [*Bảo Ngọc*])
    })
  ]
  ],
  [$0,34$],
  loigiai: [
    #ppgiai[
      - *Bước 1:* Gọi $X$ và $Y$ lần lượt là số mặt sấp (S) mà Gia Huy và Bảo Ngọc tung được. Xác định phân bố xác suất của $X$ và $Y$.
      - *Bước 2:* Tính xác suất để hai bạn tung được số mặt sấp bằng nhau $P(X=Y)$.
      - *Bước 3:* Dựa vào tính đối xứng $P(X>Y) = P(X<Y)$ và biến cố tổng quát $P(X>Y) + P(X<Y) + P(X=Y) = 1$, ta tính được xác suất Gia Huy chiến thắng ngay lần đầu là $P(X>Y) = (1 - P(X=Y)) / 2$.
    ]
    
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        line((-0.5,0), (4.5,0), mark: (end: ">")); content((4.5, -0.5), $k$)
        line((0,-0.5), (0,3.5), mark: (end: ">")); content((-0.8, 3.5), $P(X=k)$)
        
        let freqs = (1, 3, 3, 1)
        for i in range(4) {
          let y = freqs.at(i) * 0.8 
          rect((i - 0.25, 0), (i + 0.25, y), fill: rgb("90caf9"), stroke: rgb("1565c0"))
          content((i, -0.5), str(i))
          // Đã fix lỗi truyền 3 tham số vào hàm content và lỗi nối chuỗi
          content((i, y + 0.3), text(size: 8pt)[$#freqs.at(i)/8$])
        }
        // Đã fix cách gộp style text vào tham số body
        content((2, 4), text(size: 9pt, fill: rgb("1565c0"))[Phân bố xác suất số mặt Sấp])
      })
    ]
    
    Gọi $X, Y$ lần lượt là số mặt sấp mà Gia Huy và Bảo Ngọc tung được khi gieo $3$ đồng xu. 
    Ta có $X, Y in {0; 1; 2; 3}$ và tuân theo quy luật phân bố nhị thức với xác suất thành công $p = 1/2$.
    Bảng phân bố xác suất của $X$ (tương tự với $Y$):
    - $P(X=0) = C_3^0 (1/2)^3 = 1/8$
    - $P(X=1) = C_3^1 (1/2)^3 = 3/8$
    - $P(X=2) = C_3^2 (1/2)^3 = 3/8$
    - $P(X=3) = C_3^3 (1/2)^3 = 1/8$
    
    Xác suất để hai bạn tung được số mặt sấp bằng nhau (phải tung lại) là:
    $ P(X=Y) &= P(X=0)P(Y=0) + P(X=1)P(Y=1) + P(X=2)P(Y=2) + P(X=3)P(Y=3) \
             &= (1/8)^2 + (3/8)^2 + (3/8)^2 + (1/8)^2 \
             &= (1 + 9 + 9 + 1)/64 = 20/64 = 5/16. $
    
    Vì hai bạn sử dụng đồng xu giống hệt nhau nên trò chơi công bằng, do đó xác suất thắng của mỗi người là như nhau: $P(X>Y) = P(X<Y)$.
    Mặt khác, tổng các trường hợp tạo thành không gian mẫu nên ta luôn có: 
    $ P(X>Y) + P(X<Y) + P(X=Y) = 1. $
    
    Suy ra xác suất để Gia Huy giành chiến thắng ngay sau lần tung đầu tiên ($X>Y$) là:
    $ P(X>Y) = (1 - P(X=Y))/2 = (1 - 5/16)/2 = 11/32 = 0,34375. $
    
    Làm tròn kết quả đến hàng phần trăm, ta được $0,34$.
    
    #nhanxet[
      Bài toán khai thác tính chất đối xứng của các biến cố độc lập, cùng phân phối. Việc áp dụng tính chất $P(X>Y) = P(X<Y)$ giúp tránh phải liệt kê và tính tổng nhiều trường hợp rời rạc, tiết kiệm tối đa thời gian tính toán trong phòng thi.
    ]
  ]
)
#v(1em)
#block(
  width: 100%,
  fill: rgb("#f4f8fc"),
  stroke: (left: 6pt + classic.blue, top: 0.5pt + rgb("#dbe4f0"), right: 0.5pt + rgb("#dbe4f0"), bottom: 0.5pt + rgb("#dbe4f0")),
  inset: 16pt,
  radius: (right: 4pt)
)[
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: QUẢ CẦU BỊ GIÓ THÔI]
  
  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[LIÊN QUAN GÓC LƯỢN GIÁC.]
]
#v(2em)

#ds(
  mode:"dethi",
  [Để theo dõi thời tiết, trạm khí tượng tại $O$ thả một bóng thám không lên bầu trời. Bóng thám không gồm một quả bóng hình cầu chứa khí Heli và một hộp thiết bị đo đạc (radiosonde) treo bên dưới, nối với tâm quả bóng bằng dây cáp. Khi không có gió, quả bóng bay thẳng đứng phía trên trạm và có phương trình mặt cầu $(S): x^2 + y^2 + (z-12)^2 = 100$ (đơn vị: mét) _(Kết quả tính toán làm tròn đến hàng phần mười)_ đổi ra.
 #align(center)[
      #grid(
        columns: (1fr, 1fr),
        align: (center, center),
        cetz.canvas(length: 0.2cm, {
          import cetz.draw: *
          // Hệ trục Oxyz
          line((0,0), (-4,-2), mark: (end: ">")); content((-4,-2), $x$, anchor: "north-east")
          line((0,0), (6,-1.5), mark: (end: ">")); content((6,-1.5), $y$, anchor: "north-west")
          line((0,0), (0,26), mark: (end: ">")); content((0,26), $z$, anchor: "south")
          
          // Hình cầu (quả bóng) 3D
          circle((0,12), radius: 10, fill: rgb("ffcccc66"), stroke: (paint: red, thickness: 1pt))
          
          // Hệ thống kinh tuyến và vĩ tuyến phụ (nét đứt) để tạo không gian 3D
          circle((0,12), radius: (3.5, 10), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          circle((0,12), radius: (7, 10), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          circle((0, 17), radius: (8.66, 1.75), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          circle((0, 7), radius: (8.66, 1.75), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          
          // Đường xích đạo: Nét đứt nửa sau, nét liền nửa trước
          arc((10,12), start: 0deg, stop: 180deg, radius: (10, 2.5), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
          arc((-10,12), start: 180deg, stop: 360deg, radius: (10, 2.5), stroke: (paint: gray, thickness: 1pt))
          
          // Dây cáp
          line((0,0), (0,12), stroke: (paint: blue, thickness: 1.5pt))
          
          // Các điểm mốc
          circle((0,0), radius: 1pt, fill: black); content((0,0), $O$, anchor: "east", padding: 5pt)
          circle((0,12), radius: 1pt, fill: black); content((0,12), $I(0;0;12)$, anchor: "west", padding: 5pt)
          
          // Bán kính R
          line((0,12), (7.07, 19.07), mark: (end: ">"), stroke: (dash: "dashed"))
          content((3.5, 16.5), $R=10$, anchor: "south-east")
          
          // Điểm cao nhất
          circle((0,22), radius: 2pt, fill: black); content((0,22), $z_max=22$, anchor: "south-west")
          
          content((0, -6), [*Không có gió*])
        }),
        cetz.canvas(length: 0.2cm, {
          import cetz.draw: *
          // Hệ trục Oxyz
          line((0,0), (-4,-2), mark: (end: ">")); content((-4,-2), $x$, anchor: "north-east")
          line((0,0), (6,-1.5), mark: (end: ">")); content((6,-1.5), $y$, anchor: "north-west")
          line((0,0), (0,26), mark: (end: ">")); content((0,26), $z$, anchor: "south")
          
          // Trục z và dây ban đầu
          line((0,0), (0,14), stroke: (dash: "dashed", paint: gray))
          
          // Vị trí lệch
          let ang = 75deg // Góc tạo với phương ngang (phương thẳng đứng là 90, lệch 15 => 75)
          let Ix = 12 * calc.cos(ang)
          let Iz = 12 * calc.sin(ang)
          
          // Hình cầu (quả bóng) 3D bị lệch
          circle((Ix, Iz), radius: 10, fill: rgb("ccffff66"), stroke: (paint: blue, thickness: 1pt))
          
          // Hệ thống kinh tuyến và vĩ tuyến phụ (nét đứt) để tạo không gian 3D
          circle((Ix, Iz), radius: (3.5, 10), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          circle((Ix, Iz), radius: (7, 10), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          circle((Ix, Iz + 5), radius: (8.66, 1.75), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          circle((Ix, Iz - 5), radius: (8.66, 1.75), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          
          // Đường xích đạo: Nét đứt nửa sau, nét liền nửa trước
          arc((Ix+10, Iz), start: 0deg, stop: 180deg, radius: (10, 2.5), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
          arc((Ix - 10, Iz), start: 180deg, stop: 360deg, radius: (10, 2.5), stroke: (paint: gray, thickness: 1pt))
          
          // Dây cáp
          line((0,0), (Ix, Iz), stroke: (paint: blue, thickness: 1.5pt))
          
          // Các điểm mốc
          circle((0,0), radius: 1pt, fill: black); content((0,0), $O$, anchor: "east", padding: 5pt)
          circle((Ix, Iz), radius: 1pt, fill: black); content((Ix, Iz), $I'$, anchor: "west", padding: 5pt)
          
          // Ký hiệu góc
          arc((0,5), start: 90deg, stop: ang, radius: 5, stroke: (paint: blue, thickness: 1pt))
          content((1.5, 6.5), $theta$, fill: blue)
          
          // Điểm M
          circle((Ix, Iz+10), radius: 1pt, fill: black); content((Ix, Iz+10), $M$, anchor: "south-west")
          line((0,0), (Ix, Iz+10), stroke: (dash: "dashed", paint: orange, thickness: 1pt))
          content((Ix/2 - 1, (Iz+10)/2 + 2), $O M$, fill: orange)
          
          content((0, -6), [*Khi gió thổi lệch $theta$*])
        })
      )
    ]
],
  (
    True([Tâm quả bóng cách trạm $O$ là $12,0" m"$.]),
    True([Đường kính lớn nhất của quả bóng là $20,0" m"$.]),
    [Khi có gió thổi nhẹ, quả bóng bị đẩy lệch sao cho dây cáp tạo với phương thẳng đứng một góc $15^degree$. Khi đó, độ cao của tâm quả bóng so với trạm $O$ bằng $11,2" m"$.],
    [Khi gió mạnh hơn, dây cáp lệch $25^degree$ so với phương thẳng đứng. Khi đó, khoảng cách từ trạm $O$ đến điểm cao nhất trên quả bóng bằng $19,9" m"$.]
  ),
  loigiai: [
    #ppgiai[
      - Mặt cầu $(S): (x-a)^2 + (y-b)^2 + (z-c)^2 = R^2$ có tâm $I(a; b; c)$ và bán kính $R$.
      - Dây cáp nối từ trạm $O(0;0;0)$ đến tâm quả bóng $I$ có độ dài không đổi $l = O I$.
      - Khi gió thổi làm dây lệch một góc $theta$ so với phương thẳng đứng (trục $O z$), hình chiếu của tâm bóng lên trục $O z$ (độ cao của tâm) là $h = l cos theta$.
      - Điểm cao nhất của quả bóng luôn cách tâm bóng một khoảng bằng bán kính $R$ theo phương thẳng đứng hướng lên. Do đó, nếu tâm bóng là $I'(x_I; y_I; z_I)$, điểm cao nhất sẽ là $M(x_I; y_I; z_I + R)$. Khoảng cách từ trạm đến điểm cao nhất là $O M = sqrt(x_I^2 + y_I^2 + (z_I+R)^2)$.
    ]

    #align(center)[
      #grid(
        columns: (1fr, 1fr),
        align: (center, center),
        cetz.canvas(length: 0.2cm, {
          import cetz.draw: *
          // Hệ trục Oxyz
          line((0,0), (-4,-2), mark: (end: ">")); content((-4,-2), $x$, anchor: "north-east")
          line((0,0), (6,-1.5), mark: (end: ">")); content((6,-1.5), $y$, anchor: "north-west")
          line((0,0), (0,26), mark: (end: ">")); content((0,26), $z$, anchor: "south")
          
          // Hình cầu (quả bóng) 3D
          circle((0,12), radius: 10, fill: rgb("ffcccc66"), stroke: (paint: red, thickness: 1pt))
          
          // Hệ thống kinh tuyến và vĩ tuyến phụ (nét đứt) để tạo không gian 3D
          circle((0,12), radius: (3.5, 10), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          circle((0,12), radius: (7, 10), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          circle((0, 17), radius: (8.66, 1.75), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          circle((0, 7), radius: (8.66, 1.75), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          
          // Đường xích đạo: Nét đứt nửa sau, nét liền nửa trước
          arc((10,12), start: 0deg, stop: 180deg, radius: (10, 2.5), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
          arc((-10,12), start: 180deg, stop: 360deg, radius: (10, 2.5), stroke: (paint: gray, thickness: 1pt))
          
          // Dây cáp
          line((0,0), (0,12), stroke: (paint: blue, thickness: 1.5pt))
          
          // Các điểm mốc
          circle((0,0), radius: 1pt, fill: black); content((0,0), $O$, anchor: "east", padding: 5pt)
          circle((0,12), radius: 1pt, fill: black); content((0,12), $I(0;0;12)$, anchor: "west", padding: 5pt)
          
          // Bán kính R
          line((0,12), (7.07, 19.07), mark: (end: ">"), stroke: (dash: "dashed"))
          content((3.5, 16.5), $R=10$, anchor: "south-east")
          
          // Điểm cao nhất
          circle((0,22), radius: 2pt, fill: black); content((0,22), $z_max=22$, anchor: "south-west")
          
          content((0, -6), [*Không có gió*])
        }),
        cetz.canvas(length: 0.2cm, {
          import cetz.draw: *
          // Hệ trục Oxyz
          line((0,0), (-4,-2), mark: (end: ">")); content((-4,-2), $x$, anchor: "north-east")
          line((0,0), (6,-1.5), mark: (end: ">")); content((6,-1.5), $y$, anchor: "north-west")
          line((0,0), (0,26), mark: (end: ">")); content((0,26), $z$, anchor: "south")
          
          // Trục z và dây ban đầu
          line((0,0), (0,14), stroke: (dash: "dashed", paint: gray))
          
          // Vị trí lệch
          let ang = 75deg // Góc tạo với phương ngang (phương thẳng đứng là 90, lệch 15 => 75)
          let Ix = 12 * calc.cos(ang)
          let Iz = 12 * calc.sin(ang)
          
          // Hình cầu (quả bóng) 3D bị lệch
          circle((Ix, Iz), radius: 10, fill: rgb("ccffff66"), stroke: (paint: blue, thickness: 1pt))
          
          // Hệ thống kinh tuyến và vĩ tuyến phụ (nét đứt) để tạo không gian 3D
          circle((Ix, Iz), radius: (3.5, 10), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          circle((Ix, Iz), radius: (7, 10), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          circle((Ix, Iz + 5), radius: (8.66, 1.75), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          circle((Ix, Iz - 5), radius: (8.66, 1.75), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
          
          // Đường xích đạo: Nét đứt nửa sau, nét liền nửa trước
          arc((Ix+10, Iz), start: 0deg, stop: 180deg, radius: (10, 2.5), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
          arc((Ix - 10, Iz), start: 180deg, stop: 360deg, radius: (10, 2.5), stroke: (paint: gray, thickness: 1pt))
          
          // Dây cáp
          line((0,0), (Ix, Iz), stroke: (paint: blue, thickness: 1.5pt))
          
          // Các điểm mốc
          circle((0,0), radius: 1pt, fill: black); content((0,0), $O$, anchor: "east", padding: 5pt)
          circle((Ix, Iz), radius: 1pt, fill: black); content((Ix, Iz), $I'$, anchor: "west", padding: 5pt)
          
          // Ký hiệu góc
          arc((0,5), start: 90deg, stop: ang, radius: 5, stroke: (paint: blue, thickness: 1pt))
          content((1.5, 6.5), $theta$, fill: blue)
          
          // Điểm M
          circle((Ix, Iz+10), radius: 1pt, fill: black); content((Ix, Iz+10), $M$, anchor: "south-west")
          line((0,0), (Ix, Iz+10), stroke: (dash: "dashed", paint: orange, thickness: 1pt))
          content((Ix/2 - 1, (Iz+10)/2 + 2), $O M$, fill: orange)
          
          content((0, -6), [*Khi gió thổi lệch $theta$*])
        })
      )
    ]

    - *Kiểm tra mệnh đề a):*
      Từ phương trình mặt cầu $(S): x^2 + y^2 + (z-12)^2 = 100$, ta xác định được tâm quả bóng ban đầu là $I(0; 0; 12)$ và bán kính $R = sqrt(100) = 10" m"$.
      Trạm được đặt tại gốc tọa độ $O(0;0;0)$.
      Khoảng cách từ tâm quả bóng đến trạm $O$ là độ dài đoạn thẳng $O I$:
      $ O I = sqrt(0^2 + 0^2 + 12^2) = 12,0" (m)". $
      $=>$ *Mệnh đề a) đúng.*

    - *Kiểm tra mệnh đề b):*
      Đường kính lớn nhất của quả bóng chính là đường kính của mặt cầu $(S)$.
      $ d = 2R = 2 dot 10 = 20,0" (m)". $
      $=>$ *Mệnh đề b) đúng.*

    - *Kiểm tra mệnh đề c):*
      Khi gió thổi, quả bóng dịch chuyển. Gọi $I'(a; b; c)$ là vị trí mới của tâm quả bóng.
      Dây cáp không co giãn nên khoảng cách từ trạm $O$ đến tâm bóng vẫn bằng $12$, suy ra $O I' = 12$, tức là:
      $ a^2 + b^2 + c^2 = 144 quad (*). $
      Dây cáp tạo với phương thẳng đứng (trục $O z$) một góc $15^degree$. Khi đó, độ cao của tâm quả bóng chính là cao độ $c$:
      $ c = O I' dot cos 15^degree = 12 cos 15^degree approx 11,59" (m)". $
      Làm tròn đến hàng phần mười, độ cao tâm quả bóng là $11,6" m"$, khác với $11,2" m"$ mà mệnh đề đưa ra.
      $=>$ *Mệnh đề c) sai.*

    - *Kiểm tra mệnh đề d):*
      Khi dây lệch $25^degree$, tương tự ta có tọa độ tâm bóng mới $I''(a; b; c)$ với cao độ $c = 12 cos 25^degree$.
      Từ phương trình $(*)$, ta tính được:
      $ a^2 + b^2 = 144 - c^2 = 144 - (12 cos 25^degree)^2 = (12 sin 25^degree)^2. $
      Điểm cao nhất $M$ trên quả bóng luôn nằm thẳng đứng ngay trên tâm $I''$, do đó tọa độ của $M$ là $(a; b; c + R) = (a; b; 12 cos 25^degree + 10)$.
      Bình phương khoảng cách từ trạm $O$ đến điểm cao nhất $M$ là:
      $ O M^2 &= a^2 + b^2 + (c+10)^2 \
              &= (12 sin 25^degree)^2 + (12 cos 25^degree + 10)^2 \
              &= 144 sin^2 25^degree + 144 cos^2 25^degree + 240 cos 25^degree + 100 \
              &= 144(sin^2 25^degree + cos^2 25^degree) + 240 cos 25^degree + 100 \
              &= 244 + 240 cos 25^degree approx 461,5. $
      Suy ra $O M approx sqrt(461.5) approx 21,5" (m)"$.
      Kết quả này khác với $19,9" m"$ của đề bài.
      $=>$ *Mệnh đề d) sai.*

    #luuy[
      Ở mệnh đề d), một sai lầm rất phổ biến là tính khoảng cách bằng cách lấy tổng chiều dài dây cáp và bán kính quả bóng rồi nhân với $cos$: $(O I + R) cos 25^degree = 22 cos 25^degree approx 19,9" m"$. Đây là cách chiếu sai bản chất hình học, vì điểm cao nhất $M$ luôn nằm trên đường thẳng đứng đi qua tâm quả bóng $I'$, chứ không nằm trên phương của sợi dây cáp $O I'$.
    ]
  ]
)


#ds(
  [Một viện hải dương học neo một phao cảm biến hình cầu dưới đáy biển để đo đạc dòng hải lưu. Điểm neo được chọn làm gốc tọa độ $O(0;0;0)$ nằm trên mặt đáy biển bằng phẳng (thuộc mặt phẳng $O x y$). Khi nước đứng yên, phao nổi thẳng đứng và bề mặt của phao có phương trình mặt cầu $(S): x^2 + y^2 + (z-15)^2 = 16$ (đơn vị: mét). Biết rằng cáp neo là một sợi dây thẳng, không co giãn, nối từ điểm neo $O$ đến đúng tâm của phao. _(Kết quả tính toán làm tròn đến hàng phần mười)_.
  
  #align(center)[
    #grid(
      columns: (1fr, 1fr),
      align: (center, center),
      cetz.canvas(length: 0.25cm, {
        import cetz.draw: *
        // Mặt đáy biển
        line((-6,-3), (8,-3), (12, 3), (-2, 3), close: true, fill: rgb("e6d9cc"), stroke: none)
        
        // Hệ trục Oxyz
        line((0,0), (-4,-2), mark: (end: ">")); content((-4,-2), $x$, anchor: "north-east")
        line((0,0), (6,-1.5), mark: (end: ">")); content((6,-1.5), $y$, anchor: "north-west")
        line((0,0), (0,23), mark: (end: ">")); content((0,23), $z$, anchor: "south")
        
        // Hình cầu (quả phao)
        circle((0,15), radius: 4, fill: rgb("00bcd4aa"), stroke: (paint: rgb("00838f"), thickness: 1pt))
        
        // 3D effect cho quả phao
        circle((0,15), radius: (1.5, 4), stroke: (dash: "dashed", paint: rgb("006064"), thickness: 0.5pt))
        arc((4,15), start: 0deg, stop: 180deg, radius: (4, 1.2), stroke: (dash: "dashed", paint: rgb("006064"), thickness: 0.8pt))
        arc((-4,15), start: 180deg, stop: 360deg, radius: (4, 1.2), stroke: (paint: rgb("006064"), thickness: 0.8pt))
        
        // Dây cáp
        line((0,0), (0,15), stroke: (paint: rgb("424242"), thickness: 1.5pt))
        
        // Mốc
        circle((0,0), radius: 1.5pt, fill: red); content((-1,-0.5), $O$, anchor: "north")
        circle((0,15), radius: 1.5pt, fill: red); content((0.5,15), $I$, anchor: "west")
        
        // Điểm cao nhất
        circle((0,19), radius: 1.5pt, fill: black); content((0,19.5), $z_max=19$, anchor: "south")
        
        content((0, -5), [*Nước đứng yên*])
      }),
      cetz.canvas(length: 0.25cm, {
        import cetz.draw: *
        // Mặt đáy biển
        line((-6,-3), (8,-3), (12, 3), (-2, 3), close: true, fill: rgb("e6d9cc"), stroke: none)
        
        // Hệ trục
        line((0,0), (-4,-2), mark: (end: ">")); content((-4,-2), $x$, anchor: "north-east")
        line((0,0), (6,-1.5), mark: (end: ">")); content((6,-1.5), $y$, anchor: "north-west")
        line((0,0), (0,23), mark: (end: ">")); content((0,23), $z$, anchor: "south")
        
        // Dây trục thẳng đứng
        line((0,0), (0,16), stroke: (dash: "dashed", paint: gray))
        
        // Tọa độ lệch (Giả sử cáp nghiêng góc 30 độ so với trục z => 60 độ so với Oxy)
        let ang = 60deg 
        let Ix = 15 * calc.cos(ang)
        let Iz = 15 * calc.sin(ang)
        
        // Quả phao lệch
        circle((Ix, Iz), radius: 4, fill: rgb("00bcd4aa"), stroke: (paint: rgb("00838f"), thickness: 1pt))
        circle((Ix, Iz), radius: (1.5, 4), stroke: (dash: "dashed", paint: rgb("006064"), thickness: 0.5pt))
        arc((Ix+4,Iz), start: 0deg, stop: 180deg, radius: (4, 1.2), stroke: (dash: "dashed", paint: rgb("006064"), thickness: 0.8pt))
        arc((Ix - 4,Iz), start: 180deg, stop: 360deg, radius: (4, 1.2), stroke: (paint: rgb("006064"), thickness: 0.8pt))
        
        // Dây cáp
        line((0,0), (Ix, Iz), stroke: (paint: rgb("424242"), thickness: 1.5pt))
        
        // Mốc
        circle((0,0), radius: 1.5pt, fill: red); content((-1,-0.5), $O$, anchor: "north")
        circle((Ix, Iz), radius: 1.5pt, fill: red); content((Ix+0.5, Iz), $I'$, anchor: "west")
        
        // Điểm thấp nhất N
        circle((Ix, Iz - 4), radius: 1.5pt, fill: black); content((Ix, Iz - 4.5), $N$, anchor: "north")
        line((0,0), (Ix, Iz - 4), stroke: (dash: "dashed", paint: rgb("d32f2f"), thickness: 1pt))
        
        // Góc nghiêng
        arc((0,6), start: 90deg, stop: ang, radius: 6, stroke: (paint: blue, thickness: 1pt))
        content((2.5, 8.5), $theta$, fill: blue)
        
        content((0, -5), [*Dòng chảy làm lệch $theta$*])
      })
    )
  ]
  ],
  (
    True([Bán kính của phao cảm biến là $4,0" m"$.]),
    True([Khi nước đứng yên, khoảng cách từ điểm cao nhất của phao đến mặt đáy biển là $19,0" m"$.]),
    [Khi dòng hải lưu đẩy dây cáp lệch một góc $30^degree$ so với phương thẳng đứng, khoảng cách từ tâm phao đến mặt đáy biển là $12,5" m"$.],
    True([Khi dòng hải lưu mạnh làm dây cáp lệch một góc $45^degree$ so với phương thẳng đứng, khoảng cách từ điểm neo $O$ đến điểm thấp nhất của bề mặt phao xấp xỉ bằng $12,5" m"$.])
  ),
  loigiai: [
    #ppgiai[
      - Từ phương trình mặt cầu $(S): (x-a)^2 + (y-b)^2 + (z-c)^2 = R^2$, ta có tâm $I(a; b; c)$ và bán kính $R$.
      - Chiều dài cáp neo $L$ không đổi và bằng khoảng cách $O I$ khi nước đứng yên.
      - Khi cáp neo lệch góc $theta$ so với phương thẳng đứng (trục $O z$), tọa độ cao độ mới của tâm phao là $z_I' = L cos theta$.
      - Điểm thấp nhất $N$ trên bề mặt phao luôn nằm thẳng đứng bên dưới tâm $I'$ một khoảng $R$, do đó $N$ có tọa độ $(x_I'; y_I'; z_I' - R)$.
      - Sử dụng công thức khoảng cách $O N^2 = (x_I')^2 + (y_I')^2 + (z_I' - R)^2$ kết hợp $(x_I')^2 + (y_I')^2 = L^2 sin^2 theta$.
    ]

    - *Kiểm tra mệnh đề a):*
      Phương trình bề mặt phao khi nước đứng yên là $(S): x^2 + y^2 + (z-15)^2 = 16$.
      Suy ra tâm phao là $I(0; 0; 15)$ và bán kính $R = sqrt(16) = 4" m"$.
      $=>$ *Mệnh đề a) đúng.*

    - *Kiểm tra mệnh đề b):*
      Chiều dài dây cáp là $L = O I = 15" m"$.
      Khi nước đứng yên, phao nằm trên trục $O z$. Điểm cao nhất của phao có cao độ là $z_"max" = z_I + R = 15 + 4 = 19" (m)"$.
      $=>$ *Mệnh đề b) đúng.*

    - *Kiểm tra mệnh đề c):*
      Khi cáp bị lệch góc $theta = 30^degree$ so với phương thẳng đứng, khoảng cách từ tâm phao $I'$ đến mặt đáy biển chính là cao độ $z_I'$:
      $ z_I' = L dot cos 30^degree = 15 dot sqrt(3)/2 approx 12,99" (m)". $
      Kết quả làm tròn là $13,0" m"$, hoàn toàn khác với mốc $12,5" m"$.
      $=>$ *Mệnh đề c) sai.*

    - *Kiểm tra mệnh đề d):*
      Khi cáp lệch góc $theta = 45^degree$, tâm phao $I'$ có tọa độ thỏa mãn:
      $ (x_I')^2 + (y_I')^2 = (L sin 45^degree)^2 $
      $ z_I' = L cos 45^degree $
      Điểm thấp nhất của phao là $N(x_I'; y_I'; z_I' - R)$. Khoảng cách từ $O$ đến $N$ được tính bằng:
      $ O N^2 &= (x_I')^2 + (y_I')^2 + (z_I' - R)^2 \
              &= (L sin 45^degree)^2 + (L cos 45^degree - R)^2 \
              &= L^2 sin^2 45^degree + L^2 cos^2 45^degree - 2 L R cos 45^degree + R^2 \
              &= L^2 + R^2 - 2 L R cos 45^degree $
      Thay $L = 15$, $R = 4$ và $cos 45^degree = sqrt(2)/2$:
      $ O N^2 &= 15^2 + 4^2 - 2 dot 15 dot 4 dot sqrt(2)/2 \
              &= 225 + 16 - 60sqrt(2) = 241 - 60sqrt(2) approx 156,15 $
      Suy ra $O N = sqrt(156.15) approx 12,496" (m)"$.
      Làm tròn đến hàng phần mười, ta được $12,5" m"$.
      $=>$ *Mệnh đề d) đúng.*

    #luuy[
      Điểm thấp nhất $N$ của quả phao luôn hướng thẳng về phía đáy biển (song song trục $O z$) do trọng lực, chứ không nằm dọc theo đường thẳng sợi cáp $O I'$. Do đó, khoảng cách $O N$ không được tính bằng $L - R = 11" m"$. Đây là "bẫy" hình học rất dễ mắc phải.
    ]
  ]
)