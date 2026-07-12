#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body),
)

#show math.equation.where(block: false): math.display
#show math.frac: math.display

#align(center)[
  #text(size: 20pt, weight: "bold", fill: rgb("B03A2E"))[CHUYÊN ĐỀ: THỐNG KÊ MẪU GHÉP NHÓM] \
  #text(size: 14pt, style: "italic")[Đánh giá độ ổn định và quản trị rủi ro]
]

= I. LÝ THUYẾT TRỌNG TÂM

#lythuyet[
  *1. Số trung bình và Trung vị*
  - Số trung bình ($overline(x)$) đại diện cho mức độ hội tụ của dữ liệu.
  - Trung vị ($M_e$) là điểm chia đôi mẫu dữ liệu. Đối với mẫu ghép nhóm, $M_e = Q_2$ được tính theo công thức nội suy tuyến tính.

  *2. Phương sai ($S^2$) và Độ lệch chuẩn ($S$)*
  - Công thức phương sai: 
    $ S^2 = (m_1(x_1 - overline(x))^2 + m_2(x_2 - overline(x))^2 + ... + m_k(x_k - overline(x))^2) / N $
    Trong đó $x_i$ là giá trị đại diện của nhóm $i$, $m_i$ là tần số.
  - Độ lệch chuẩn: $S = sqrt(S^2)$.
  - *Ý nghĩa thực tế:* Phương sai và độ lệch chuẩn đo lường sự phân tán của dữ liệu. Dữ liệu có phương sai càng nhỏ thì càng "ổn định", "đồng đều", ít rủi ro. Phương sai lớn thể hiện sự biến động mạnh.

  *3. Các Tứ phân vị ($Q_1, Q_2, Q_3$) và Giá trị ngoại lệ (Outlier)*
  - Tứ phân vị chia mẫu số liệu thành 4 phần bằng nhau.
  - Công thức nội suy Tứ phân vị thứ $p$ (với $p in {1, 2, 3}$):
    $ Q_p = L_p + ( (p dot N)/4 - C_(p-1) ) / m_p dot h_p $
    Trong đó $L_p$ là cận dưới nhóm chứa $Q_p$, $N$ là cỡ mẫu, $C_(p-1)$ là tần số tích lũy của các nhóm trước, $m_p$ là tần số nhóm chứa $Q_p$, $h_p$ là độ dài nhóm.
  - Khoảng tứ phân vị: $Delta_Q = Q_3 - Q_1$. Đo lường độ phân tán của 50% dữ liệu ở giữa.
  - Giá trị ngoại lệ (bất thường): Các giá trị $x$ thỏa mãn $x < Q_1 - 1.5 Delta_Q$ hoặc $x > Q_3 + 1.5 Delta_Q$.

  *4. Mốt ($M_o$)*
  - Mốt là giá trị xuất hiện nhiều nhất (phổ biến nhất). Trong mẫu ghép nhóm, Mốt thuộc nhóm có tần số lớn nhất (nhóm mốt).
  - Công thức tính Mốt:
    $ M_o = L_m + (m - m_1) / ((m - m_1) + (m - m_2)) dot h $
    Trong đó $L_m$ là cận dưới nhóm mốt; $m$ là tần số nhóm mốt; $m_1, m_2$ lần lượt là tần số của nhóm ngay trước và ngay sau nhóm mốt; $h$ là độ dài nhóm mốt.

  *5. Khoảng biến thiên ($R$)*
  - Là hiệu số giữa giá trị lớn nhất (cận trên của nhóm cuối cùng) và giá trị nhỏ nhất (cận dưới của nhóm đầu tiên) của mẫu số liệu ghép nhóm.
  - $R = a_k - a_1$. $R$ đo lường độ phân tán toàn cục nhưng dễ bị nhiễu bởi các giá trị ngoại lệ.

  *6. Biểu đồ hộp (Boxplot)*
  - Dùng để trực quan hóa sự phân bố dữ liệu dựa trên 5 con số: Giá trị nhỏ nhất (Min), $Q_1$, $Q_2$, $Q_3$, và Giá trị lớn nhất (Max).
  - Hộp chữ nhật giới hạn bởi $Q_1$ và $Q_3$, có đường vạch ngang ở $Q_2$. Hai đoạn "râu" kéo dài đến các giá trị xa nhất nhưng không vượt quá ngưỡng ngoại lệ. Các giá trị ngoại lệ được biểu diễn bằng các điểm rời rạc.
]

= II. CÁC VÍ DỤ MINH HỌA

#tln(
  id: "TK-01",
  [Thống kê số điểm ghi được trong $20$ trận đấu của hai cầu thủ bóng rổ $A$ và $B$ được cho dưới dạng bảng phân bố tần số ghép nhóm như sau:
  
  #align(center)[
    #table(
      columns: 5,
      align: center,
      stroke: 0.5pt,
      [*Số điểm*], [*[10; 15)*], [*[15; 20)*], [*[20; 25)*], [*[25; 30)*],
      [*Cầu thủ A*], [2], [8], [6], [4],
      [*Cầu thủ B*], [4], [4], [5], [7]
    )
  ]
  Hãy tính số điểm trung bình và độ lệch chuẩn của từng cầu thủ. Dựa vào đó, cầu thủ nào thi đấu ổn định hơn?],
  [A ổn định hơn],
  loigiai: [
    #ppgiai[
      Để so sánh tính "ổn định", ta dùng độ lệch chuẩn. Cầu thủ có độ lệch chuẩn nhỏ hơn sẽ thi đấu ổn định hơn (ít bị trận quá thấp hoặc trận quá cao đột biến).
    ]

    *Biểu đồ phân bố phong độ (Histogram):*
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // Trục tọa độ
        line((0, 0), (10, 0), mark: (end: ">"))
        content((10.3, 0), [$x$ (Điểm)])
        line((0, 0), (0, 5), mark: (end: ">"))
        content((0, 5.3), [$m$ (Tần số)])

        // Vẽ cột Cầu thủ A (Xanh lam)
        rect((1, 0), (2.5, 1), fill: rgb("bbdefb"), stroke: rgb("1976d2"))
        content((1.75, 1.3), [2])
        rect((2.5, 0), (4, 4), fill: rgb("bbdefb"), stroke: rgb("1976d2"))
        content((3.25, 4.3), [8])
        rect((4, 0), (5.5, 3), fill: rgb("bbdefb"), stroke: rgb("1976d2"))
        content((4.75, 3.3), [6])
        rect((5.5, 0), (7, 2), fill: rgb("bbdefb"), stroke: rgb("1976d2"))
        content((6.25, 2.3), [4])

        content((4, -0.5), [*Biểu đồ Cầu thủ A*])
        content((1, -0.3), [10])
        content((2.5, -0.3), [15])
        content((4, -0.3), [20])
        content((5.5, -0.3), [25])
        content((7, -0.3), [30])
      })
    ]

    #step([Tính các đại lượng cho Cầu thủ A])
    Giá trị đại diện các nhóm lần lượt là: $x_1 = 12.5; x_2 = 17.5; x_3 = 22.5; x_4 = 27.5$.
    Số trung bình:
    $ overline(x_A) = (2 dot 12.5 + 8 dot 17.5 + 6 dot 22.5 + 4 dot 27.5) / 20 = 410 / 20 = 20.5. $
    Phương sai:
    $ S_A^2 = (2(12.5-20.5)^2 + 8(17.5-20.5)^2 + 6(22.5-20.5)^2 + 4(27.5-20.5)^2) / 20 $
    $ S_A^2 = (2 dot 64 + 8 dot 9 + 6 dot 4 + 4 dot 49) / 20 = (128 + 72 + 24 + 196) / 20 = 420 / 20 = 21. $
    Độ lệch chuẩn: $S_A = sqrt(21) approx 4.58$.

    #step([Tính các đại lượng cho Cầu thủ B])
    Số trung bình:
    $ overline(x_B) = (4 dot 12.5 + 4 dot 17.5 + 5 dot 22.5 + 7 dot 27.5) / 20 = 425 / 20 = 21.25. $
    Phương sai:
    $ S_B^2 = (4(12.5-21.25)^2 + 4(17.5-21.25)^2 + 5(22.5-21.25)^2 + 7(27.5-21.25)^2) / 20 $
    $ S_B^2 = (4(76.5625) + 4(14.0625) + 5(1.5625) + 7(39.0625)) / 20 = 643.75 / 20 = 32.1875. $
    Độ lệch chuẩn: $S_B = sqrt(32.1875) approx 5.67$.

    #step([Kết luận])
    Ta thấy $S_A < S_B$ (4.58 < 5.67), chứng tỏ điểm số của cầu thủ A tập trung sát với giá trị trung bình hơn. Do đó, cầu thủ A thi đấu *ổn định* hơn cầu thủ B.
  ]
)

#tln(
  id: "TK-02",
  [Thống kê lương tháng (triệu VNĐ) của nhân viên một công ty khởi nghiệp:
  
  #align(center)[
    #table(
      columns: 5,
      align: center,
      stroke: 0.5pt,
      [*Mức lương*], [*[10; 15)*], [*[15; 20)*], [*[20; 25)*], [*[25; 100)*],
      [*Số nhân viên*], [12], [20], [6], [2]
    )
  ]
  Biết Giám đốc và Phó Giám đốc thuộc nhóm `[25; 100)` với mức lương thực tế lần lượt là $90$ và $40$ triệu VNĐ. Dựa vào khoảng tứ phân vị, hãy kiểm tra xem mức lương của Giám đốc và Phó GĐ có bị coi là "ngoại lệ" (quá chênh lệch so với mặt bằng chung) hay không?],
  [Cả Giám đốc và Phó GĐ đều là ngoại lệ],
  loigiai: [
    #ppgiai[
      Để tìm giá trị ngoại lệ, ta cần tính $Q_1$, $Q_3$, và khoảng tứ phân vị $Delta_Q = Q_3 - Q_1$. Một giá trị được coi là cao bất thường nếu nó vượt quá ngưỡng $Q_3 + 1.5 Delta_Q$.
    ]
    
    #step([Lập bảng tần số tích lũy])
    Cỡ mẫu $N = 12 + 20 + 6 + 2 = 40$.
    Các nhóm: $[10; 15)$ (tích lũy 12), $[15; 20)$ (tích lũy 32), $[20; 25)$ (tích lũy 38), $[25; 100)$ (tích lũy 40).

    #step([Tính $Q_1$ và $Q_3$])
    - *Tính $Q_1$:* Vị trí $N/4 = 10$. Nằm trong nhóm đầu tiên $[10; 15)$.
      $ Q_1 = 10 + (10 - 0) / 12 dot 5 = 10 + 50/12 approx 14.17 " (triệu)" $
    - *Tính $Q_3$:* Vị trí $(3N)/4 = 30$. Tần số tích lũy nhóm 1 là 12, nhóm 2 là 32. Vậy vị trí 30 nằm trong nhóm $[15; 20)$.
      $ Q_3 = 15 + (30 - 12) / 20 dot 5 = 15 + 18/4 = 15 + 4.5 = 19.5 " (triệu)" $

    #step([Kiểm tra giá trị ngoại lệ])
    - Khoảng tứ phân vị: $Delta_Q = Q_3 - Q_1 = 19.5 - 14.17 = 5.33$.
    - Ngưỡng trên của giá trị bình thường: 
      $ M_"max" = Q_3 + 1.5 Delta_Q = 19.5 + 1.5 dot 5.33 = 19.5 + 7.995 = 27.495 " (triệu)" $
    
    - Lương Phó GĐ là $40$ triệu $> 27.495$. Mức lương này là một giá trị *ngoại lệ* (cao bất thường).
    - Lương Giám đốc là $90$ triệu $> 27.495$. Mức lương này cũng là một giá trị *ngoại lệ*.
    
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Trục số từ 0 đến 100
        line((0, 0), (10, 0), mark: (end: ">"))
        for i in range(0, 11) {
          line((i, -0.1), (i, 0.1))
          content((i, -0.4), [#str(i*10)])
        }
        content((10.5, 0), [$x$ (triệu)])
        
        let q1 = 1.417
        let q2 = 1.7
        let q3 = 1.95
        let min_val = 1.0
        let max_val = 2.75
        let out1 = 4.0
        let out2 = 9.0
        
        // Vẽ râu (whiskers)
        line((min_val, 1), (q1, 1), stroke: 1.5pt)
        line((q3, 1), (max_val, 1), stroke: 1.5pt)
        line((min_val, 0.8), (min_val, 1.2), stroke: 1.5pt)
        line((max_val, 0.8), (max_val, 1.2), stroke: 1.5pt)
        
        // Vẽ hộp (box)
        rect((q1, 0.6), (q3, 1.4), fill: rgb("E8F5E9"), stroke: 1.5pt + rgb("2E7D32"))
        line((q2, 0.6), (q2, 1.4), stroke: 1.5pt + rgb("2E7D32"))
        
        // Vẽ điểm ngoại lệ
        circle((out1, 1), radius: 0.1, fill: red, stroke: none)
        content((out1, 1.4), text(red, size: 9pt)[Phó GĐ (40)])
        circle((out2, 1), radius: 0.1, fill: red, stroke: none)
        content((out2, 1.4), text(red, size: 9pt)[Giám đốc (90)])
        
        // Chú thích các điểm
        content((q1, 0.3), text(size: 9pt)[$Q_1$])
        content((q2, 1.7), text(size: 9pt)[$M_e$])
        content((q3, 0.3), text(size: 9pt)[$Q_3$])
        content((2.75, 0.3), text(size: 9pt)[$M_"max"$])
      })
    ]
    

    *(Lưu ý: Ngay cả Phó GĐ cũng bị tính là ngoại lệ do phân bố lương của 80% nhân viên nằm tập trung ở mức cực thấp 10-20 triệu).*
  ]
)


// ==========================================
// BÀI TK-03: ĐÁNH GIÁ RỦI RO ĐẦU TƯ
// ==========================================
#tln(
  id: "TK-03",
  [Một nhà đầu tư đang cân nhắc giữa hai Quỹ mở (Quỹ A và Quỹ B). Thống kê tỷ suất lợi nhuận hàng tháng (%) của hai quỹ trong vòng 3 năm (36 tháng) được cho bởi bảng sau:
  
  #align(center)[
    #table(
      columns: 6,
      align: center,
      stroke: 0.5pt,
      [*Lợi nhuận (%)*], [*[0; 2)*], [*[2; 4)*], [*[4; 6)*], [*[6; 8)*], [*[8; 10)*],
      [*Quỹ A (Số tháng)*], [3], [6], [18], [6], [3],
      [*Quỹ B (Số tháng)*], [8], [4], [12], [4], [8]
    )
  ]
  a) Quỹ nào mang lại lợi nhuận trung bình cao hơn?
  b) Độ lệch chuẩn của tỷ suất lợi nhuận đo lường mức độ rủi ro (sự biến động). Quỹ nào an toàn hơn (ít rủi ro hơn) cho nhà đầu tư?],
  [Cả 2 bằng nhau; Quỹ A an toàn hơn (S nhỏ hơn)],
  loigiai: [
    #step([Tính lợi nhuận trung bình])
    Các giá trị đại diện của từng nhóm là $x_1 = 1; x_2 = 3; x_3 = 5; x_4 = 7; x_5 = 9$.
    - Quỹ A: $overline(x)_A = (3 dot 1 + 6 dot 3 + 18 dot 5 + 6 dot 7 + 3 dot 9) / 36 = 180 / 36 = 5\%$.
    - Quỹ B: $overline(x)_B = (8 dot 1 + 4 dot 3 + 12 dot 5 + 4 dot 7 + 8 dot 9) / 36 = 180 / 36 = 5\%$.
    Hai quỹ có cùng mức lợi nhuận trung bình là 5%/tháng.

    #step([Đánh giá mức độ rủi ro bằng phương sai và độ lệch chuẩn])
    - *Phương sai Quỹ A:*
      $ S_A^2 = (3(1-5)^2 + 6(3-5)^2 + 18(5-5)^2 + 6(7-5)^2 + 3(9-5)^2) / 36 $
      $ S_A^2 = (3 dot 16 + 6 dot 4 + 0 + 6 dot 4 + 3 dot 16) / 36 = (48 + 24 + 0 + 24 + 48) / 36 = 144 / 36 = 4. $
      Độ lệch chuẩn $S_A = sqrt(4) = 2\%$.
    
    - *Phương sai Quỹ B:*
      $ S_B^2 = (8(1-5)^2 + 4(3-5)^2 + 12(5-5)^2 + 4(7-5)^2 + 8(9-5)^2) / 36 $
      $ S_B^2 = (8 dot 16 + 4 dot 4 + 0 + 4 dot 4 + 8 dot 16) / 36 = (128 + 16 + 0 + 16 + 128) / 36 = 288 / 36 = 8. $
      Độ lệch chuẩn $S_B = sqrt(8) approx 2.83\%$.

    #step([Biểu đồ Đa giác tần số (So sánh mức độ phân tán)])
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Trục tọa độ
        line((0, 0), (10, 0), mark: (end: ">"))
        content((10.3, 0), [$x (\%)$])
        line((0, 0), (0, 4), mark: (end: ">"))
        content((0, 4.3), [$m$])
        
        // Quỹ A (Màu xanh, ít phân tán, nhọn ở giữa)
        line((1, 3*0.15), (3, 6*0.15), (5, 18*0.15), (7, 6*0.15), (9, 3*0.15), stroke: 1.5pt + rgb("2E86C1"), name: "polyA")
        circle((1, 3*0.15), radius: 0.1, fill: rgb("2E86C1"), stroke: none)
        circle((3, 6*0.15), radius: 0.1, fill: rgb("2E86C1"), stroke: none)
        circle((5, 18*0.15), radius: 0.1, fill: rgb("2E86C1"), stroke: none)
        circle((7, 6*0.15), radius: 0.1, fill: rgb("2E86C1"), stroke: none)
        circle((9, 3*0.15), radius: 0.1, fill: rgb("2E86C1"), stroke: none)

        // Quỹ B (Màu cam, phân tán mạnh, bẹt)
        line((1, 8*0.15), (3, 4*0.15), (5, 12*0.15), (7, 4*0.15), (9, 8*0.15), stroke: 1.5pt + rgb("E67E22"), name: "polyB")
        circle((1, 8*0.15), radius: 0.1, fill: rgb("E67E22"), stroke: none)
        circle((3, 4*0.15), radius: 0.1, fill: rgb("E67E22"), stroke: none)
        circle((5, 12*0.15), radius: 0.1, fill: rgb("E67E22"), stroke: none)
        circle((7, 4*0.15), radius: 0.1, fill: rgb("E67E22"), stroke: none)
        circle((9, 8*0.15), radius: 0.1, fill: rgb("E67E22"), stroke: none)

        // Labels
        content((1, -0.3), [1])
        content((3, -0.3), [3])
        content((5, -0.3), [5])
        content((7, -0.3), [7])
        content((9, -0.3), [9])

        content((5.5, 3.2), text(fill: rgb("2E86C1"))[Quỹ A (Ổn định)])
        content((8, 1.8), text(fill: rgb("E67E22"))[Quỹ B (Biến động)])
      })
    ]

    *Kết luận:* Mặc dù cả hai quỹ đều đem lại mức lợi nhuận trung bình như nhau ($5\%$), nhưng độ lệch chuẩn của Quỹ A ($2\%$) nhỏ hơn nhiều so với Quỹ B ($2.83\%$). Điều này (và biểu đồ đa giác) cho thấy lợi nhuận của Quỹ A rất ổn định quanh mức $5\%$, còn Quỹ B có độ biến động rất lớn, rủi ro cao. Nhà đầu tư theo gu an toàn nên chọn Quỹ A.
  ]
)

// ==========================================
// BÀI TK-04: PHÂN TÍCH DỊCH VỤ KHÁCH HÀNG (MỐT VÀ TRUNG VỊ)
// ==========================================
#tln(
  id: "TK-04",
  [Bộ phận chăm sóc khách hàng của một ngân hàng khảo sát thời gian chờ (phút) của $100$ khách hàng trước khi được giao dịch viên phục vụ. Kết quả thu được như sau:
  
  #align(center)[
    #table(
      columns: 6,
      align: center,
      stroke: 0.5pt,
      [*Thời gian chờ*], [*[0; 5)*], [*[5; 10)*], [*[10; 15)*], [*[15; 20)*], [*[20; 25)*],
      [*Số lượng khách*], [15], [35], [30], [12], [8]
    )
  ]
  a) Tính Mốt ($M_o$) của mẫu số liệu để biết khoảng thời gian chờ phổ biến nhất của khách hàng là bao nhiêu phút.
  b) Ngân hàng muốn đưa ra cam kết: "50% khách hàng của chúng tôi chỉ phải chờ dưới $X$ phút". Hãy tìm giá trị $X$ hợp lý nhất (tính Trung vị $M_e$).],
  [$M_o = 9, M_e = 10$],
  loigiai: [
    #step([Tính thời gian chờ phổ biến nhất (Mốt)])
    Nhóm có tần số lớn nhất là nhóm $[5; 10)$ với tần số lớn nhất là $35$. Vậy đây là *nhóm mốt*.
    Các thông số của nhóm mốt:
    - Cận dưới $L_m = 5$, độ dài nhóm $h = 5$.
    - Tần số nhóm mốt $m = 35$.
    - Tần số nhóm trước đó $m_1 = 15$.
    - Tần số nhóm sau đó $m_2 = 30$.
    
    Áp dụng công thức tính Mốt:
    $ M_o = L_m + (m - m_1) / ((m - m_1) + (m - m_2)) dot h $
    $ M_o = 5 + (35 - 15) / ((35 - 15) + (35 - 30)) dot 5 = 5 + 20 / (20 + 5) dot 5 = 5 + 20/25 dot 5 = 5 + 4 = 9 " (phút)". $
    *Ý nghĩa:* Thời gian chờ phổ biến nhất (xảy ra với mật độ cao nhất) tại ngân hàng là $9$ phút.

    #step([Tính Trung vị (thời gian giới hạn cho 50% khách hàng)])
    Cỡ mẫu $N = 100$. Vị trí trung vị là $N/2 = 50$.
    Bảng tần số tích lũy:
    - Nhóm $[0; 5)$: tích lũy 15.
    - Nhóm $[5; 10)$: tích lũy $15 + 35 = 50$.
    
    Đặc biệt, do vị trí 50 rơi đúng vào tần số tích lũy của nhóm thứ hai $[5; 10)$, nên trung vị chính là *cận trên* của nhóm thứ hai, tức là $M_e = 10$.
    
    *(Nếu tính theo công thức nội suy cho nhóm tiếp theo $[10; 15)$ với $C_{p-1} = 50$: $M_e = 10 + (50 - 50)/30 dot 5 = 10$. Cả hai cách đều cho cùng kết quả).*

    *Kết luận:* Thời gian $X$ cần tìm chính là Trung vị $M_e = 10$ phút. Ngân hàng có thể tự tin cam kết "50% khách hàng chỉ phải chờ dưới 10 phút".
  ]
)
