#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

== 8. Vectơ: Không Chỉ Là Bộ Ba Số

#why-box[
  Có một cách học 3D khá nguy hiểm: coi vectơ chỉ là một bộ ba số $(x, y, z)$ để cộng trừ nhân chia một cách máy móc. Cách học này làm mất đi hoàn toàn sức mạnh lớn nhất của vectơ. 
  
  Vectơ ra đời như một "thiết bị mang thông tin" tuyệt vời: nó nén hướng, độ lớn, quan hệ song song, vuông góc và sự dịch chuyển vào cùng một đối tượng duy nhất. Nó cho phép ta giải quyết các bài toán không gian mà không cần bận tâm đến hệ tọa độ nằm ở đâu.
]

#vd-box("7", "Quy tắc hình hộp biểu diễn sự dịch chuyển 3D")[
  #grid(
    columns: (1.2fr, 1fr),
    column-gutter: 15pt,
    align: horizon,
    [
      Cho hình hộp $A B C D.A' B' C' D'$. Hãy tìm vectơ tổng của ba vectơ cạnh xuất phát từ đỉnh $A$:
      $ vec(S) = vec(A B) + vec(A D) + vec(A A') $
      
      Theo quy tắc hình bình hành trong mặt đáy $A B C D$, ta có $vec(A B) + vec(A D) = vec(A C)$. 
      
      Khi đó, tổng của ba vectơ cạnh trở thành:
      $ vec(S) = vec(A C) + vec(A A') $
      
      Vì mặt bên $A C C' A'$ là một hình bình hành, ta tiếp tục áp dụng quy tắc hình bình hành để thu được:
      $ vec(S) = vec(A C') $
      
      Đây chính là *Quy tắc hình hộp* nổi tiếng: Tổng của ba vectơ xuất phát từ cùng một đỉnh của hình hộp bằng vectơ đường chéo chính của hình hộp đó. Phép cộng này không chỉ là số học, mà nó đang thực hiện việc dịch chuyển điểm $A$ liên tiếp theo ba phương vuông góc hoặc xiên trong không gian để đi đến điểm đích $C'$.
    ],
    [
      #align(center)[
        #canvas(length: 1.1cm, {
          import draw: *
          let sx = -0.45
          let sy = -0.3
          let proj(x, y, z) = (x + y * sx, z + y * sy)
          
          let A = proj(0.5, 2.2, 0)
          let B = proj(3.5, 2.2, 0)
          let D = proj(0.5, 0.5, 0)
          let C = proj(3.5, 0.5, 0)
          let Ap = proj(0.5, 2.2, 2.2)
          let Bp = proj(3.5, 2.2, 2.2)
          let Dp = proj(0.5, 0.5, 2.2)
          let Cp = proj(3.5, 0.5, 2.2)
          
          // Các cạnh khuất (đường đứt)
          line(D, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          line(D, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          line(D, Dp, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          
          // Các cạnh thấy
          line(A, B, stroke: 0.8pt + black)
          line(B, C, stroke: 0.8pt + black)
          line(A, Ap, stroke: 0.8pt + black)
          line(B, Bp, stroke: 0.8pt + black)
          line(C, Cp, stroke: 0.8pt + black)
          line(Ap, Bp, stroke: 0.8pt + black)
          line(Bp, Cp, stroke: 0.8pt + black)
          line(Cp, Dp, stroke: 0.8pt + black)
          line(Dp, Ap, stroke: 0.8pt + black)
          
          // Vectơ thành phần (dùng mũi tên màu)
          line(A, B, stroke: 1.5pt + rgb("#0F766E"), mark: (end: "stealth", scale: 0.6))
          line(A, Ap, stroke: 1.5pt + rgb("#0891B2"), mark: (end: "stealth", scale: 0.6))
          // AD là cạnh khuất nên vẽ mũi tên nét đứt
          line(A, D, stroke: (paint: rgb("#B45309"), thickness: 1.5pt, dash: "dashed"), mark: (end: "stealth", scale: 0.6))
          
          // Vectơ tổng AC' (đỏ nổi bật)
          line(A, Cp, stroke: 2pt + rgb("#9F1239"), mark: (end: "stealth", scale: 0.8))
          
          // Điểm
          circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.25, A.at(1) + 0.2), $A$, size: 9pt)
          circle(B, radius: 1.8pt, fill: black); content((B.at(0) + 0.25, B.at(1) + 0.1), $B$, size: 9pt)
          circle(D, radius: 1.8pt, fill: black); content((D.at(0) - 0.2, D.at(1) - 0.25), $D$, size: 9pt)
          circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.2, C.at(1) - 0.2), $C$, size: 9pt)
          circle(Ap, radius: 1.8pt, fill: black); content((Ap.at(0) - 0.2, Ap.at(1) + 0.25), $A'$, size: 9pt)
          circle(Bp, radius: 1.8pt, fill: black); content((Bp.at(0) + 0.2, Bp.at(1) + 0.2), $B'$, size: 9pt)
          circle(Dp, radius: 1.8pt, fill: black); content((Dp.at(0) - 0.25, Dp.at(1) - 0.1), $D'$, size: 9pt)
          circle(Cp, radius: 1.8pt, fill: black); content((Cp.at(0) + 0.25, Cp.at(1) + 0.1), $C'$, size: 9pt)
          
          // Nhãn các vectơ
          content(proj(2.0, 2.2, 0.2), text(fill: rgb("#0F766E"), size: 8.5pt)[$vec(a)$])
          content(proj(0.5, 1.3, 0.2), text(fill: rgb("#B45309"), size: 8.5pt)[$vec(b)$])
          content(proj(0.2, 2.2, 1.1), text(fill: rgb("#0891B2"), size: 8.5pt)[$vec(c)$])
          content(proj(1.8, 1.2, 1.6), text(fill: rgb("#9F1239"), size: 9pt)[$vec(S)$])
        })
      ]
    ]
  )
]

#essay-box("Khai mở tư duy: Vectơ là công cụ tối thượng trong các công cụ lập trình Game 3D")[
  Khi chơi một tựa game 3D như *Minecraft*, *Grand Theft Auto* hay các tựa game mô phỏng vật lý phức tạp, thế giới xung quanh được mô hình hóa hoàn toàn bằng toán học. Khi một nhân vật bắn ra một mũi tên, động cơ vật lý (physics engine) của game phải tính toán liên tục: hướng đi của mũi tên, sức cản của gió, trọng lực hút nó xuống, và điểm va chạm với chướng ngại vật.
  
  Mọi phép tính đó được thực hiện thông qua vectơ. Động cơ game không cần biết tọa độ toàn cục của mũi tên trên toàn thế giới là bao nhiêu. Nó chỉ cần thực hiện phép cộng vectơ:
  $ vec(v)_("mới") = vec(v)_("cũ") + vec(a) dot Delta t $
  Trong đó $vec(v)$ là vectơ vận tốc, $vec(a)$ là vectơ gia tốc trọng lực (luôn hướng xuống đáy trái đất).
  
  Vectơ giúp các kỹ sư game viết ra những đoạn mã vật lý áp dụng được cho *mọi* vật thể tại *mọi* vị trí trong không gian mà không bị trói buộc vào một gốc tọa độ cụ thể. Đó chính là bản chất "phi tọa độ" đầy sức mạnh của vectơ.
]

#history-box("Hamilton vs. Gibbs: Cuộc nội chiến toán học kiến thiết thế giới hiện đại")[
  Vào thế kỷ 19, nhà toán học thiên tài người Ireland *William Rowan Hamilton* dành cả đời mình để tìm kiếm một hệ số mở rộng số phức từ 2D lên 3D. Vào một ngày tháng 10 năm 1843, khi đang đi dạo trên cây cầu Brougham ở Dublin, ông bỗng nhiên ngộ ra công thức và dùng dao khắc ngay phương trình lên thành cầu:
  $ i^2 = j^2 = k^2 = i j k = -1 $
  Hệ số này được gọi là *Quaternion* (Số siêu phức 4 chiều), mô tả vị trí và sự quay trong không gian 3D. Hamilton tin rằng Quaternion là đỉnh cao của toán học không gian và sẽ thay đổi toàn bộ vật lý.
  
  Tuy nhiên, Quaternion quá cồng kềnh với 4 chiều và toán học rất phức tạp. Vài thập kỷ sau, nhà vật lý người Mỹ *Josiah Willard Gibbs* và kỹ sư người Anh *Oliver Heaviside* đã độc lập tiến hành một cuộc cải cách triệt để. Họ "cắt bỏ" phần thực của Quaternion, chỉ giữ lại phần ảo 3 chiều và định nghĩa ra hai phép toán hoàn toàn mới: *Tích vô hướng (Dot Product)* và *Tích có hướng (Cross Product)*.
  
  Hamilton và những người ủng hộ ông vô cùng giận dữ, gọi hệ thống mới của Gibbs là một "con quái vật lai căng". Tuy nhiên, hệ thống vectơ mới của Gibbs lại quá đơn giản và thực dụng. Nhờ có nó, nhà vật lý James Clerk Maxwell mới có thể viết lại hệ 20 phương trình điện từ cồng kềnh ban đầu thành 4 phương trình Maxwell ngắn gọn và đẹp đẽ bằng vectơ mà ta dùng ngày nay. Cuộc chiến kết thúc với thắng lợi hoàn toàn của vectơ, đặt nền móng cho toàn bộ ngành kỹ thuật và vật lý hiện đại.
]

#core-box[
  Hãy luôn nhớ ba vai trò cấu trúc của vectơ trong không gian:
  
  - *Bộ nén hướng và khoảng cách:* Vectơ $vec(A B)$ không chỉ chứa khoảng cách giữa $A$ và $B$, mà quan trọng hơn là chứa hướng đi từ $A$ sang $B$.
  - *Bộ phát hiện vuông góc:* Tích vô hướng $vec(a) dot vec(b) = 0$ khi và chỉ khi hai vectơ vuông góc. Đây là công cụ kiểm tra vuông góc nhanh nhất trong 3D.
  - *Hệ quy chiếu di động:* Bằng cách chọn 3 vectơ không đồng phẳng làm cơ sở (base), ta có thể biểu diễn và định vị mọi điểm khác trong không gian một cách độc lập với trục Đề-các.
]
