filepath = "/Users/admin/conictypst/typst/exams/CD-SoDoCay-XacSuat.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Replace TOC grid
old_toc = """      [👑 *VII. Bài Toán 3: Cờ vua King of the Hill*], [💡 *VIII. Cẩm Nang Tư Duy Tránh Bẫy*]"""
new_toc = """      [👑 *VII. Bài Toán 3: Cờ vua King of the Hill*], [📈 *VIII. Mô hình Sức mạnh Động (Bradley-Terry)*],
      [💡 *IX. Cẩm Nang Tư Duy Tránh Bẫy*], []"""

if old_toc in content:
    content = content.replace(old_toc, new_toc)
    print("TOC updated successfully!")
else:
    print("Could not find the target TOC grid!")

# Replace Section VIII title and header comments
old_section = """// ═══════════════════════════════════════════════
// PHẦN VIII. CẨM NANG TƯ DUY
// ═══════════════════════════════════════════════
= VIII. Cẩm Nang Tư Duy Quyết Định Tránh Bẫy"""

new_section_v8 = """// ═══════════════════════════════════════════════
// PHẦN VIII. MÔ HÌNH SỨC MẠNH ĐỘNG
// ═══════════════════════════════════════════════
= VIII. Chuyên Đề Mới: Mô hình Sức mạnh Động (Bradley-Terry động) trong các Giải đấu

Trong các giải đấu thể thao chuyên nghiệp và trò chơi đối kháng trực tiếp, sức mạnh hay phong độ của một kỳ thủ hoặc một đội tuyển thường không bất biến. Sau khi trải qua một trận thắng, kỳ thủ có thể nhận được sự thăng hoa về mặt tâm lý và đà thi đấu (Momentum), hoặc ngược lại, họ có thể được tăng chỉ số lực nhờ sự chuẩn bị chiến thuật chuyên nghiệp.

Để giải quyết lớp bài toán này, người ta thường kết hợp **Mô hình Bradley-Terry** với phương pháp **Sơ đồ cây xác suất**.

== 1. Mô hình Bradley-Terry và Sự Thăng tiến Sức mạnh Động
- *Mô hình Bradley-Terry:* Xác suất đấu thủ $X$ (có lực $S_X$) thắng đấu thủ $Y$ (có lực $S_Y$) được xác định bởi:
  $ P(X "thắng" Y) = frac(S_X, S_X + S_Y) $
- *Sự thăng tiến sức mạnh động (Dynamic progression):* Sau mỗi vòng đấu (ví dụ vòng Bán kết), đấu thủ chiến thắng sẽ được tăng một lượng sức mạnh cụ thể (ví dụ tăng $k \%$ chỉ số lực hiện có). Khi bước vào vòng đấu tiếp theo (ví dụ vòng Chung kết), xác suất thắng của họ sẽ được tính toán dựa trên chỉ số sức mạnh mới này.

---

== 2. Bài Toán Thực Tế: Giải đấu bốn đội có thăng tiến sức mạnh

#eg-box(title: "🎯 Bài toán 8.1 (Đề thi ĐGNL & Học sinh giỏi)")[
  Bốn đội bóng đá $A$, $B$, $C$, $D$ tham gia một giải đấu loại trực tiếp gồm hai vòng đấu: Bán kết và Chung kết.
  
  *Bảng chỉ số sức mạnh ban đầu và tỉ lệ tăng sức mạnh:*
  - **Đội A:** Lực ban đầu = 80. Nếu thắng bán kết, lực tăng thêm 30%.
  - **Đội B:** Lực ban đầu = 90. Nếu thắng bán kết, lực tăng thêm 10%.
  - **Đội C:** Lực ban đầu = 40. Nếu thắng bán kết, lực tăng thêm 40%.
  - **Đội D:** Lực ban đầu = 50. Nếu thắng bán kết, lực tăng thêm 30%.
  
  *Xác suất xếp lịch thi đấu vòng Bán kết (Tung xúc sắc):*
  Ban tổ chức tung một con xúc sắc cân đối 6 mặt để xếp cặp đấu:
  - Nếu mặt gieo được là 1 hoặc 2: **A gặp C** (xác suất $1/3$), cặp còn lại là **B gặp D**.
  - Nếu mặt gieo được là 4, 5 hoặc 6: **A gặp D** (xác suất $1/2$), cặp còn lại là **B gặp C**.
  - Nếu mặt gieo được là 3: **A gặp B** (xác suất $1/6$), cặp còn lại là **C gặp D**.
  
  Tính xác suất để đội $A$ đoạt chức vô địch giải đấu (làm tròn kết quả đến hàng phần trăm).
]

#step-box[
  *Lời giải chi tiết:*
  
  **Bước 1: Tính chỉ số lực của các đội khi bước vào Chung kết (nếu thắng bán kết):**
  - **Đội A:** Lực chung kết = $80 \\times 1.3 = 104$.
  - **Đội B:** Lực chung kết = $90 \\times 1.1 = 99$.
  - **Đội C:** Lực chung kết = $40 \\times 1.4 = 56$.
  - **Đội D:** Lực chung kết = $50 \\times 1.3 = 65$.

  **Bước 2: Vẽ sơ đồ cây quyết định chia kịch bản:**
  Trò chơi phân tách thành 3 kịch bản chính từ nút gốc (Trận Bán kết):
]

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Gốc
    circle((0, 0), radius: 0.35, fill: rgb("FFE0B2"), stroke: 1.5pt + col-amber, name: "root")
    content("root", text(size: 8pt, weight: "bold")[Gốc])
    
    // 3 Kịch bản vòng bán kết
    rect((3.2, 4), (5.7, 4.8), fill: rgb("E8F5E9"), stroke: 1pt + col-green, radius: 2pt, name: "c1")
    content("c1", text(size: 7.5pt)[*Case 1* \\\\ (A-C, B-D)])
    
    rect((3.2, 0), (5.7, 0.8), fill: rgb("E8F5E9"), stroke: 1pt + col-green, radius: 2pt, name: "c2")
    content("c2", text(size: 7.5pt)[*Case 2* \\\\ (A-D, B-C)])
    
    rect((3.2, -4), (5.7, -3.2), fill: rgb("E8F5E9"), stroke: 1pt + col-green, radius: 2pt, name: "c3")
    content("c3", text(size: 7.5pt)[*Case 3* \\\\ (A-B, C-D)])
    
    line("root", "c1.west", mark: (end: "stealth"))
    content((1.7, 2.3), text(size: 8pt)[1/3])
    line("root", "c2.west", mark: (end: "stealth"))
    content((1.7, 0.6), text(size: 8pt)[1/2])
    line("root", "c3.west", mark: (end: "stealth"))
    content((1.7, -1.8), text(size: 8pt)[1/6])
    
    // Case 1
    rect((8, 5.2), (11.2, 6.0), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c1_b")
    content("c1_b", text(size: 7pt)[A thắng C, B thắng D \\\\ Chung kết: A vs B])
    
    rect((8, 3.6), (11.2, 4.4), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c1_d")
    content("c1_d", text(size: 7pt)[A thắng C, D thắng B \\\\ Chung kết: A vs D])
    
    line("c1.east", "c1_b.west", mark: (end: "stealth"))
    content((6.8, 5.0), text(size: 7pt)[$2/3 dot.c 9/14$])
    line("c1.east", "c1_d.west", mark: (end: "stealth"))
    content((6.8, 3.8), text(size: 7pt)[$2/3 dot.c 5/14$])
    
    // Case 2
    rect((8, 1.2), (11.2, 2.0), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c2_b")
    content("c2_b", text(size: 7pt)[A thắng D, B thắng C \\\\ Chung kết: A vs B])
    
    rect((8, -0.4), (11.2, 0.4), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c2_c")
    content("c2_c", text(size: 7pt)[A thắng D, C thắng B \\\\ Chung kết: A vs C])
    
    line("c2.east", "c2_b.west", mark: (end: "stealth"))
    content((6.8, 1.4), text(size: 7pt)[$8/13 dot.c 9/13$])
    line("c2.east", "c2_c.west", mark: (end: "stealth"))
    content((6.8, 0.2), text(size: 7pt)[$8/13 dot.c 4/13$])
    
    // Case 3
    rect((8, -2.4), (11.2, -1.6), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c3_c")
    content("c3_c", text(size: 7pt)[A thắng B, C thắng D \\\\ Chung kết: A vs C])
    
    rect((8, -4.0), (11.2, -3.2), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c3_d")
    content("c3_d", text(size: 7pt)[A thắng B, D thắng C \\\\ Chung kết: A vs D])
    
    line("c3.east", "c3_c.west", mark: (end: "stealth"))
    content((6.8, -2.2), text(size: 7pt)[$8/17 dot.c 4/9$])
    line("c3.east", "c3_d.west", mark: (end: "stealth"))
    content((6.8, -3.4), text(size: 7pt)[$8/17 dot.c 5/9$])
    
    // Nút lá A vô địch
    circle((14, 5.6), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win1")
    content("win1", text(size: 7pt, fill: col-green, weight: "bold")[A])
    circle((14, 4.0), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win2")
    content("win2", text(size: 7pt, fill: col-green, weight: "bold")[A])
    circle((14, 1.6), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win3")
    content("win3", text(size: 7pt, fill: col-green, weight: "bold")[A])
    circle((14, 0.0), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win4")
    content("win4", text(size: 7pt, fill: col-green, weight: "bold")[A])
    circle((14, -2.0), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win5")
    content("win5", text(size: 7pt, fill: col-green, weight: "bold")[A])
    circle((14, -3.6), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win6")
    content("win6", text(size: 7pt, fill: col-green, weight: "bold")[A])
    
    line("c1_b.east", "win1.west", mark: (end: "stealth"))
    content((12.6, 5.9), text(size: 7pt)[$104/203$])
    line("c1_d.east", "win2.west", mark: (end: "stealth"))
    content((12.6, 4.3), text(size: 7pt)[$8/13$])
    line("c2_b.east", "win3.west", mark: (end: "stealth"))
    content((12.6, 1.9), text(size: 7pt)[$104/203$])
    line("c2_c.east", "win4.west", mark: (end: "stealth"))
    content((12.6, 0.3), text(size: 7pt)[$13/20$])
    line("c3_c.east", "win5.west", mark: (end: "stealth"))
    content((12.6, -1.7), text(size: 7pt)[$13/20$])
    line("c3_d.east", "win6.west", mark: (end: "stealth"))
    content((12.6, -3.3), text(size: 7pt)[$8/13$])
  })
]

#step-box[
  **Bước 3: Tính toán xác suất vô địch của A tại từng kịch bản nhánh lớn:**

  - - *Tại Kịch bản 1 (A-C và B-D):*
      - Xác suất A thắng bán kết C: $P(A_1) = frac(80, 80 + 40) = frac(2, 3)$.
      - Xác suất B thắng bán kết D: $P(B_1) = frac(90, 90 + 50) = frac(9, 14)$.
      - Xác suất D thắng bán kết B: $P(D_1) = frac(5, 14)$.
      - Chung kết (A đã tăng lực thành 104):
        - Gặp B (lực 99): Xác suất A thắng là $frac(104, 104 + 99) = frac(104, 203)$.
        - Gặp D (lực 65): Xác suất A thắng là $frac(104, 104 + 65) = frac(8, 13)$.
      - Xác suất A vô địch ở Nhánh 1:
        $ P_("vô địch 1") = 1/3 dot.c 2/3 dot.c [ 9/14 dot.c 104/203 + 5/14 dot.c 8/13 ] $
        $ P_("vô địch 1") = 2/9 dot.c [ frac(936, 2842) + frac(40, 182) ] = 2/9 dot.c [ frac(468, 1421) + frac(20, 91) ] approx 0.12203. $

  - - *Tại Kịch bản 2 (A-D và B-C):*
      - Xác suất A thắng bán kết D: $P(A_2) = frac(80, 80 + 50) = frac(8, 13)$.
      - Xác suất B thắng bán kết C: $P(B_2) = frac(90, 90 + 40) = frac(9, 13)$.
      - Xác suất C thắng bán kết B: $P(C_2) = frac(4, 13)$.
      - Chung kết (A đã tăng lực thành 104):
        - Gặp B (lực 99): Xác suất A thắng là $frac(104, 203)$.
        - Gặp C (lực 56): Xác suất A thắng là $frac(104, 104 + 56) = frac(13, 20)$.
      - Xác suất A vô địch ở Nhánh 2:
        $ P_("vô địch 2") = 1/2 dot.c 8/13 dot.c [ 9/13 dot.c 104/203 + 4/13 dot.c 13/20 ] $
        $ P_("vô địch 2") = 4/13 dot.c [ frac(936, 2639) + frac(1, 5) ] approx 4/13 dot.c [ 0.35468 + 0.20000 ] approx 0.17067. $

  - - *Tại Kịch bản 3 (A-B và C-D):*
      - Xác suất A thắng bán kết B: $P(A_3) = frac(80, 80 + 90) = frac(8, 17)$.
      - Xác suất C thắng bán kết D: $P(C_3) = frac(40, 40 + 50) = frac(4, 9)$.
      - Xác suất D thắng bán kết C: $P(D_3) = frac(5, 9)$.
      - Chung kết (A đã tăng lực thành 104):
        - Gặp C (lực 56): Xác suất A thắng là $frac(13, 20)$.
        - Gặp D (lực 65): Xác suất A thắng là $frac(8, 13)$.
      - Xác suất A vô địch ở Nhánh 3:
        $ P_("vô địch 3") = 1/6 dot.c 8/17 dot.c [ 4/9 dot.c 13/20 + 5/9 dot.c 8/13 ] $
        $ P_("vô địch 3") = 4/51 dot.c [ frac(13, 45) + frac(40, 117) ] approx 4/51 dot.c [ 0.28889 + 0.34188 ] approx 0.04947. $

  **Bước 4: Kết luận:**
  Xác suất tổng thể để đội A đoạt chức vô địch giải đấu bằng tổng xác suất của cả 3 nhánh trên sơ đồ cây:
  $ P(A "vô địch") = P_("vô địch 1") + P_("vô địch 2") + P_("vô địch 3") $
  $ P(A "vô địch") approx 0.12203 + 0.17067 + 0.04947 = 0.34217. $
  
  Làm tròn đến hàng phần trăm theo yêu cầu đề bài:
  $ P(A "vô địch") approx bold(0.34) " hay " bold(34%). $
]

---

#pagebreak()

== 3. Bài toán leo tháp Tam hùng (Đỉnh Cao Vọng Cảnh)

Để rèn luyện tư duy cho học sinh ở mức độ khó hơn, ta xét một cấu trúc giải đấu động khác: thể thức leo tháp kết hợp sự thăng hoa và kiệt quệ về thể lực.

#eg-box(title: "🎯 Bài toán 8.2 (Mức độ nâng cao)")[
  Ba kỳ thủ cờ vua $A$, $B$, $C$ tham gia giải đấu leo tháp "Đỉnh Cao Vọng Cảnh".
  - **Chỉ số sức mạnh ban đầu:** $S_A = 80$, $S_B = 70$, $S_C = 60$.
  - **Trận 1:** Một cặp đấu được chọn ngẫu nhiên bằng bốc thăm trong 3 kỳ thủ để đấu với nhau. Kỳ thủ còn lại đợi ở lượt sau. Vì trận 1 là trận ra mắt của cả hai, xác suất thắng của mỗi kỳ thủ được tính theo mô hình Bradley-Terry ban đầu.
  - **Luật thay đổi sức mạnh:**
    - Người thắng trận sẽ được **tăng 20%** chỉ số sức mạnh hiện tại (động lực thăng hoa) và đi tiếp vào Trận 2.
    - Người thua trận bị **giảm 10%** sức mạnh hiện tại (kiệt quệ) và ra ghế dự bị.
  - **Trận 2 (Chung kết):** Kỳ thủ thắng trận 1 đấu với kỳ thủ dự bị còn lại. Người thắng trận 2 sẽ vô địch giải đấu.
  
  Xác định xác suất để kỳ thủ $A$ vô địch giải đấu khi việc xếp cặp trận 1 là hoàn toàn ngẫu nhiên.
]

#step-box[
  *Lời giải chi tiết:*
  
  **Bước 1: Phân tích các kịch bản phân cặp Trận 1:**
  Có 3 cách phân cặp Trận 1, mỗi cách có xác suất xuất hiện là $1/3$:
  - - *Case 1:* $A$ đấu với $B$ (Trận 1). $C$ đợi.
  - - *Case 2:* $A$ đấu với $C$ (Trận 1). $B$ đợi.
  - - *Case 3:* $B$ đấu với $C$ (Trận 1). $A$ đợi.

  **Bước 2: Tính toán sức mạnh thăng tiến sau trận 1:**
  - Nếu $A$ thắng: $S_A' = 80 \\times 1.2 = 96$.
  - Nếu $B$ thắng: $S_B' = 70 \\times 1.2 = 84$.
  - Nếu $C$ thắng: $S_C' = 60 \\times 1.2 = 72$.
  - Sức mạnh của người đợi vẫn giữ nguyên: $S_A = 80, S_B = 70, S_C = 60$.

  **Bước 3: Tính xác suất A vô địch trong từng Case:**
  
  - - *Tại Case 1 (A đấu B, C đợi - Xác suất $1/3$):*
      - Trận 1: $A$ vs $B$. Xác suất $A$ thắng là: $P(A_1) = frac(80, 80 + 70) = frac(8, 15)$.
      - Trận 2 (Chung kết): Nếu $A$ thắng ở Trận 1, $A$ gặp $C$ (lực 60). Lực mới của $A$ là $96$.
        Xác suất $A$ thắng chung kết là: $P(A_2) = frac(96, 96 + 60) = frac(96, 156) = frac(8, 13)$.
      - Xác suất $A$ vô địch trong Case 1 là:
        $ P_("vô địch" | "Case 1") = P(A_1) dot.c P(A_2) = frac(8, 15) dot.c frac(8, 13) = frac(64, 195) approx 0.32821. $

  - - *Tại Case 2 (A đấu C, B đợi - Xác suất $1/3$):*
      - Trận 1: $A$ vs $C$. Xác suất $A$ thắng là: $P(A_1) = frac(80, 80 + 60) = frac(8, 14) = frac(4, 7)$.
      - Trận 2 (Chung kết): Nếu $A$ thắng ở Trận 1, $A$ gặp $B$ (lực 70). Lực mới của $A$ là $96$.
        Xác suất $A$ thắng chung kết là: $P(A_2) = frac(96, 96 + 70) = frac(96, 166) = frac(48, 83)$.
      - Xác suất $A$ vô địch trong Case 2 là:
        $ P_("vô địch" | "Case 2") = frac(4, 7) dot.c frac(48, 83) = frac(192, 581) approx 0.33046. $

  - - *Tại Case 3 (B đấu C, A đợi - Xác suất $1/3$):*
      - Trận 1: $B$ vs $C$.
        - $B$ thắng với xác suất: $frac(70, 70 + 60) = frac(7, 13)$.
        - $C$ thắng với xác suất: $frac(60, 70 + 60) = frac(6, 13)$.
      - Trận 2 (Chung kết): $A$ đợi vào đấu với người thắng:
        - Nếu $B$ thắng: Chung kết là $A$ (lực 80) đấu với $B$ (lực mới 84).
          Xác suất $A$ thắng là: $frac(80, 80 + 84) = frac(80, 164) = frac(20, 41)$.
        - Nếu $C$ thắng: Chung kết là $A$ (lực 80) đấu với $C$ (lực mới 72).
          Xác suất $A$ thắng là: $frac(80, 80 + 72) = frac(80, 152) = frac(10, 19)$.
      - Xác suất $A$ vô địch trong Case 3 là:
        $ P_("vô địch" | "Case 3") = frac(7, 13) dot.c frac(20, 41) + frac(6, 13) dot.c frac(10, 19) = frac(140, 533) + frac(60, 247) approx 0.26266 + 0.24291 = 0.50557. $

  **Bước 4: Tính xác suất vô địch chung cuộc của A:**
  $ P(A "vô địch") = 1/3 dot.c [ P_("vô địch" | "Case 1") + P_("vô địch" | "Case 2") + P_("vô địch" | "Case 3") ] $
  $ P(A "vô địch") approx 1/3 dot.c [ 0.32821 + 0.33046 + 0.50557 ] = 1/3 dot.c 1.16424 = 0.38808. $
  
  *Kết luận:* Xác suất để kỳ thủ $A$ vô địch giải đấu leo tháp là khoảng **38.81%**.
]

---

#pagebreak()

== 4. Bài tập tự luyện nâng cao

#eg-box(title: "✏️ Bài C14 — Lưới bán kết thăng tiến song hành")[
  Bốn đấu thủ $A$, $B$, $C$, $D$ có lực ban đầu lần lượt là $90$, $80$, $70$, $60$. Họ thi đấu vòng bán kết loại trực tiếp với cách phân cặp ngẫu nhiên (mỗi cách phân cặp có xác suất $1/3$).
  Sau trận bán kết, kỳ thủ chiến thắng được tăng thêm $20\%$ lực, còn kỳ thủ thua trận bị giảm $20\%$ lực (và rời giải đấu).
  Tính xác suất để kỳ thủ $B$ vô địch giải đấu.
]

#eg-box(title: "✏️ Bài C15 — Leo tháp ba kỳ thủ có đà phục hận")[
  Ba kỳ thủ $A$, $B$, $C$ có lực ban đầu lần lượt là $100$, $80$, $60$. Trận 1 bốc thăm ngẫu nhiên chọn hai người đấu với nhau.
  - Người thắng trận 1 được cộng $10$ điểm lực và đi tiếp vào trận chung kết.
  - Người thua trận 1 được bốc thăm quyền "phục sinh": với xác suất $0.4$, họ được hồi sinh lực lượng để đấu trận chung kết với người thắng trận 1 (lúc này sức mạnh họ giảm đi $10$ điểm do mệt mỏi). Với xác suất $0.6$, họ bị loại hẳn và nhường vị trí chung kết cho người thứ 3 đợi từ đầu.
  Tính xác suất để kỳ thủ $C$ vô địch giải đấu.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN IX. CẨM NANG TƯ DUY
// ═══════════════════════════════════════════════
= IX. Cẩm Nang Tư Duy Quyết Định Tránh Bẫy"""

if old_section in content:
    content = content.replace(old_section, new_section_v8)
    print("Section VIII/IX updated and new content inserted successfully!")
else:
    print("Could not find the target section header for VIII!")

with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)

print("Insertion script finished!")
