#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm)
)

#show: stexgv-doc.with(
  doc-type: "book",
  title: "CHUYÊN ĐỀ: VẬT CHẮN TẦM NHÌN",
  author: "GV Nguyễn Văn Sang",
  theme-color: classic.blue
)

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
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: VẬT CHẮN TẦM NHÌN]
  
  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[Vấn đề xuay quanh kỹ năng chiếu, giao điểm đường thanwgr và mặt phẳng.]
]
#v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill:  math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 

// Câu 3 (Vật chắn tầm nhìn - Khán đài sân khấu)
#tln(
  [Một sân khấu ngoài trời có mặt sân khấu nằm trên mặt phẳng ngang. Khán giả ngồi trên một khán đài với các hàng ghế được sắp xếp theo các bậc thang. Bậc thấp nhất có độ cao $h_1 = 0,5$ m so với mặt sân khấu. Các bậc tiếp theo có độ cao tăng dần, mỗi bậc cao hơn bậc ngay trước nó $0,3$ m. Khoảng cách theo phương ngang từ mép sân khấu (kí hiệu là $O$) đến hàng ghế đầu tiên là $d_1 = 2$ m, và khoảng cách giữa các hàng ghế liên tiếp là $0,8$ m. \
  Khán giả $A$ ngồi ở hàng ghế thứ $5$. Khán giả $B$ ngồi ở hàng ghế thứ $n$ (ngồi ngay phía sau $A$). Chiều cao từ chỗ ngồi đến mắt của cả hai người đều là $0,7$ m. Để $B$ có thể nhìn thấy toàn bộ mặt sân khấu (bắt đầu từ mép $O$) mà không bị đầu của $A$ che khuất, hỏi $B$ phải ngồi từ hàng ghế thứ mấy trở đi?],
  [Không tồn tại $n > 5$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Gốc tọa độ O (Mép sân khấu)
    let O = (0,0)
    circle(O, radius: 1.5pt, fill: black)
    content((-0.2, 0.3), $O$, weight: "bold")
    
    // Mặt sân khấu
    line((-1.5, 0), O, stroke: 1.5pt)
    
    // Vẽ khán đài (tượng trưng vài bậc)
    line(O, (2,0), stroke: (dash: "dashed", paint: gray))
    line((2,0), (2,0.5), (2.8,0.5), (2.8,0.8), (3.6,0.8), (3.6,1.1), (4.4,1.1), (4.4,1.4), (5.2,1.4), (5.2,1.7), (6.0,1.7), (6.0,2.0), stroke: 1pt)
    
    // Vị trí Mắt Khán giả A (Hàng 5: x=5.2, y=1.7+0.7=2.4)
    let A = (5.2, 2.4)
    circle(A, radius: 2pt, fill: red)
    content((A.at(0)-0.2, A.at(1)+0.3), $A$, fill: red, weight: "bold")
    line((5.2, 1.7), A, stroke: (paint: red, thickness: 1.5pt)) // Người A
    
    // Vị trí Mắt Khán giả B giả định (Hàng 6: x=6.0, y=2.0+0.7=2.7)
    let B = (6.0, 2.7)
    circle(B, radius: 2pt, fill: blue)
    content((B.at(0)+0.2, B.at(1)+0.3), $B$, fill: blue, weight: "bold")
    line((6.0, 2.0), B, stroke: (paint: blue, thickness: 1.5pt)) // Người B
    
    // Tia nhìn từ A đến O
    line(A, O, stroke: (dash: "dashed", paint: red))
    
    // Tia nhìn từ B đến O (Sẽ thấy nó đâm xuyêm qua bụng A)
    line(B, O, stroke: (dash: "dashed", paint: blue))
    
    // Chú thích d1
    line((0, -0.3), (2, -0.3), mark: (start: "<", end: ">"), stroke: 0.8pt)
    content((1, -0.5), $d_1 = 2$)
  }),
  fig-pos: "center",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      *Tư duy Tọa độ hóa (Giải tích) kiểm soát tầm nhìn:*
      - Gắn hệ trục tọa độ $O x y$ với $O(0,0)$ là mép sân khấu. Trục $O x$ dọc theo mặt sàn hướng về khán đài, trục $O y$ hướng thẳng đứng lên trên.
      - Để $B$ nhìn thấy mép $O$ mà không bị $A$ che khuất, tia nhìn từ $B$ đến $O$ phải nằm *phía trên* đầu của $A$.
      - Điều này tương đương với việc: Hệ số góc của đường thẳng $O B$ phải *lớn hơn* hệ số góc của đường thẳng $O A$ ($m_B > m_A$).
    ]

    *Bước 1: Thiết lập tọa độ của khán giả $A$ (hàng 5)*
    - Theo giả thiết, hàng ghế đầu tiên cách $O$ một đoạn $x_1 = 2$ m. Các hàng ghế cách nhau $0,8$ m.
      Tọa độ $x$ của hàng ghế thứ $k$ là cấp số cộng: $ x_k = 2 + 0,8(k-1) $
    - Độ cao bậc đầu tiên là $h_1 = 0,5$ m. Các bậc cao hơn nhau $0,3$ m.
      Độ cao bậc thứ $k$ là: $h_k = 0,5 + 0,3(k-1)$.
    - Mắt khán giả cao hơn mặt ghế $0,7$ m, nên tung độ mắt khán giả ở hàng $k$ là:
      $ y_k = h_k + 0,7 = 1,2 + 0,3(k-1) $
    - Áp dụng cho khán giả $A$ ở hàng thứ $5$ ($k=5$):
      $ x_A = 2 + 0,8(5-1) = 5,2 " (m)" $
      $ y_A = 1,2 + 0,3(5-1) = 2,4 " (m)" $
    - Hệ số góc tia nhìn từ $O$ đến mắt $A$ là:
      $ m_A = (y_A)/(x_A) = 2,4/5,2 = 6/13 approx 0,4615 $

    *Bước 2: Thiết lập tọa độ của khán giả $B$ (hàng $n$, với $n > 5$)*
    - Tọa độ mắt của khán giả $B$ tại hàng $n$ là:
      $ x_n &= 2 + 0,8(n-1) = 1,2 + 0,8n \
        y_n &= 1,2 + 0,3(n-1) = 0,9 + 0,3n $
    - Hệ số góc tia nhìn từ $O$ đến mắt $B$ là:
      $ m_n = (y_n)/(x_n) = (0,9 + 0,3n)/(1,2 + 0,8n) $

    *Bước 3: Giải bất phương trình tầm nhìn*
    - Để $B$ nhìn thấy $O$ vượt qua đầu $A$, tia $O B$ phải dốc hơn tia $O A$, tức là:
      $ m_n > m_A <=> (0,9 + 0,3n)/(1,2 + 0,8n) > 6/13 $
    - Nhân chéo (do mẫu số luôn dương):
      $ 13(0,9 + 0,3n) &> 6(1,2 + 0,8n) \
        11,7 + 3,9n &> 7,2 + 4,8n \
        4,5 &> 0,9n \
        => n &< 5 $
        
    *Bước 4: Kết luận*
    Theo tính toán, để nhìn qua đầu $A$, khán giả $B$ bắt buộc phải ngồi ở hàng ghế có $n < 5$ (tức là ngồi *phía trước* $A$).
    Tuy nhiên, giả thiết lại yêu cầu $B$ ngồi *ngay phía sau* $A$ (tức $n > 5$). Do đó, *không tồn tại* hàng ghế nào phía sau $A$ thỏa mãn yêu cầu bài toán.

    #nhanxet[*Nghịch lý Toán thực tế:* Bất phương trình vô nghiệm đã chỉ ra một hạt sạn lớn trong khâu ra đề. Trong thiết kế khán đài (Stadium Seating), độ dốc của bậc thang $((Delta y) / (Delta x) = 0.3/0.8 = 0.375)$ bắt buộc phải *lớn hơn* độ dốc của tia nhìn ($m_A = 0,46$) thì người sau mới không bị người trước che khuất. Ở bài toán này, bậc thang được xây quá "thoải" (dốc ít), dẫn đến việc từ hàng ghế thứ 2 trở đi, tầm nhìn xuống mép sân khấu $O$ của mọi khán giả đều bị chặn đứng bởi cái đầu của người ngồi ngay phía trước mặt mình!]
  ]
)


// Câu (Vật chắn tầm nhìn - Khán đài sân khấu)
#tln(
  [Một nhà hát có mặt sân khấu nằm trên mặt phẳng nằm ngang. Khán giả ngồi trên một khán đài xếp thành các bậc thang. Bậc thứ nhất có độ cao $h_1 = 0,5$m so với mặt sân khấu. Các bậc tiếp theo có độ cao tăng dần, bậc sau cao hơn bậc trước $0,3$m. Khoảng cách theo phương ngang từ mép sân khấu (O) đến bậc thứ nhất là $d_1 = 2$m, khoảng cách giữa hai bậc liên tiếp là $d = 0,8$m. Khán giả A ngồi ở bậc thứ $5$. Khán giả B ngồi ở bậc thứ $n$ (ngồi ngay phía sau A). Chiều cao từ chỗ ngồi đến mắt của khán giả A và B đều là $0,7$m. Để B có thể nhìn thấy toàn bộ mặt sân khấu mà không bị khuất tầm nhìn bởi A thì B phải ngồi từ bậc thứ mấy trở đi?],
  [Không tồn tại $n > 5$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Gốc tọa độ O (Mép sân khấu)
    let O = (0,0)
    circle(O, radius: 1.5pt, fill: black)
    content((-0.2, 0.3), $O$ ,weight: "bold")
    
    // Mặt sân khấu
    line((-1.5, 0), O, stroke: 1.5pt)
    
    // Vẽ khán đài (tượng trưng vài bậc)
    line(O, (2,0), stroke: (dash: "dashed", paint: gray))
    line((2,0), (2,0.5), (2.8,0.5), (2.8,0.8), (3.6,0.8), (3.6,1.1), (4.4,1.1), (4.4,1.4), (5.2,1.4), (5.2,1.7), (6.0,1.7), (6.0,2.0), stroke: 1pt)
    
    // Vị trí Mắt Khán giả A (Hàng 5: x=5.2, y=1.7+0.7=2.4)
    let A = (5.2, 2.4)
    circle(A, radius: 2pt, fill: red)
    content((A.at(0)-0.2, A.at(1)+0.3), $A$, fill: red, weight: "bold")
    line((5.2, 1.7), A, stroke: (paint: red, thickness: 1.5pt)) // Người A
    
    // Vị trí Mắt Khán giả B giả định (Hàng 6: x=6.0, y=2.0+0.7=2.7)
    let B = (6.0, 2.7)
    circle(B, radius: 2pt, fill: blue)
    content((B.at(0)+0.2, B.at(1)+0.3), $B$, fill: blue, weight: "bold")
    line((6.0, 2.0), B, stroke: (paint: blue, thickness: 1.5pt)) // Người B
    
    // Tia nhìn từ A đến O
    line(A, O, stroke: (dash: "dashed", paint: red))
    
    // Tia nhìn từ B đến O (Sẽ thấy nó đâm xuyên qua người A)
    line(B, O, stroke: (dash: "dashed", paint: blue))
    
    // Chú thích d1
    line((0, -0.3), (2, -0.3), mark: (start: "<", end: ">"), stroke: 0.8pt)
    content((1, -0.5), $d_1 = 2$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      *Tư duy Tọa độ hóa (Giải tích) kiểm soát tầm nhìn:*
      - Gắn hệ trục tọa độ $O x y$ với $O(0,0)$ là mép sân khấu. Trục $O x$ dọc theo mặt sàn hướng về khán đài, trục $O y$ hướng thẳng đứng lên trên.
      - Để $B$ nhìn thấy mép $O$ (từ đó thấy toàn bộ mặt sân khấu) mà không bị $A$ che khuất, tia nhìn từ $B$ đến $O$ phải nằm *phía trên* tầm mắt của $A$.
      - Điều này tương đương với việc: Hệ số góc của đường thẳng $O B$ phải *lớn hơn* hệ số góc của đường thẳng $O A$ ($m_B > m_A$).
    ]

    *Bước 1: Thiết lập tọa độ của khán giả $A$ (bậc thứ 5)*
    - Theo giả thiết, khoảng cách ngang từ $O$ đến bậc $k$ tạo thành cấp số cộng: 
      $ x_k = d_1 + (k-1)d = 2 + 0,8(k-1) $
    - Độ cao của bậc thứ $k$ là: 
      $ h_k = h_1 + (k-1) dot 0,3 = 0,5 + 0,3(k-1) $
    - Mắt khán giả cao hơn mặt ghế $0,7$m, nên tung độ mắt khán giả ở bậc $k$ là:
      $ y_k = h_k + 0,7 = 1,2 + 0,3(k-1) $
    - Áp dụng cho khán giả $A$ ở bậc $5$ ($k=5$):
      $ x_A = 2 + 0,8(5-1) = 5,2 " (m)" $
      $ y_A = 1,2 + 0,3(5-1) = 2,4 " (m)" $
    - Hệ số góc tia nhìn từ $O$ đến mắt $A$ là:
      $ m_A = (y_A)/(x_A) = 2,4/5,2 = 6/13 approx 0,4615 $

    *Bước 2: Thiết lập tọa độ của khán giả $B$ (bậc $n$, với $n > 5$)*
    - Tọa độ mắt của khán giả $B$ tại bậc $n$ là:
      $ heva(
        x_n &= 2 + 0.8(n-1) = 1.2 + 0.8n,
        y_n &= 1.2 + 0.3(n-1) = 0.9 + 0.3n) $
    - Hệ số góc tia nhìn từ $O$ đến mắt $B$ là:
      $ m_B = (y_n)/(x_n) = (0,9 + 0,3n)/(1,2 + 0,8n) $

    *Bước 3: Giải bất phương trình tầm nhìn*
    - Để $B$ nhìn thấy $O$ vượt qua đầu $A$, tia $O B$ phải dốc hơn tia $O A$, tức là:
      $ m_B > m_A <=> (0,9 + 0,3n)/(1,2 + 0,8n) > 6/13 $
    - Do $n > 0$ nên mẫu số luôn dương, ta thực hiện nhân chéo:
      $ 13(0,9 + 0,3n) &> 6(1,2 + 0,8n) \
        11,7 + 3,9n &> 7,2 + 4,8n \
        4,5 &> 0,9n \
        => n &< 5 $
        
    *Bước 4: Kết luận*
    Theo phân tích giải tích, để nhìn vượt qua đầu $A$, khán giả $B$ bắt buộc phải ngồi ở hàng ghế có $n < 5$ (tức là ngồi *phía trước* $A$).
    Tuy nhiên, giả thiết lại yêu cầu $B$ ngồi *ngay phía sau* $A$ (tức $n > 5$). Do đó, *không tồn tại* hàng ghế nào phía sau $A$ thỏa mãn yêu cầu bài toán.

    #nhanxet[
      *Lưu ý Sư phạm - Nghịch lý Toán thực tế:* Bất phương trình vô nghiệm chỉ ra một "hạt sạn" trong khâu thiết lập số liệu của tác giả đề bài. Trong kiến trúc khán đài (Stadium Seating), độ dốc của các bậc thang $((Delta y) / (Delta x) = 0.3/0.8 = 0.375)$ bắt buộc phải *lớn hơn* độ dốc của tia nhìn ($m_A approx 0,46$) thì người ngồi sau mới không bị người trước che khuất. Ở bài toán này, bậc thang được xây quá "thoải" (nông), dẫn đến việc từ bậc thứ 2 trở đi, tầm nhìn xuống mép sân khấu của mọi khán giả đều bị chặn đứng bởi lưng của người ngồi ngay phía trước!
    ]
  ]
)