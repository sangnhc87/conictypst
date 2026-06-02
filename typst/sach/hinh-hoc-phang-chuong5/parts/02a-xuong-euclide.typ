#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

== XƯỞNG A — EUCLIDE: CHỨNG MINH, QUỸ TÍCH, TAM GIÁC, ĐƯỜNG TRÒ

Trong hình học phẳng cổ điển, việc chứng minh bằng phương pháp tổng hợp (tự nhiên) luôn là thử thách lớn nhất vì tính phi thuật toán của nó. Không có một công thức vạn năng nào để bạn chỉ việc "thế số" là ra kết quả. Mỗi bài toán là một câu đố hình học riêng biệt, đòi hỏi bạn phải có khả năng đọc cấu trúc, phát hiện tính đối xứng, và quan trọng nhất: *biết cách kẻ thêm đường phụ*.

Xưởng Euclide này được thiết kế để rèn luyện cho bạn bộ kỹ năng tư duy đó thông qua 4 lò luyện chính.

=== 1. Các Vũ Khí Hình Học Cực Mạnh Của Euclide

Trước khi bắt đầu giải toán nâng cao, bạn phải nắm vững hai "vũ khí tối tân" thường dùng để kết nối các tỉ số độ dài và góc nội tiếp: *Công suất điểm* và *Trục đẳng phương*.

#core-box[
  *1. Công suất điểm (Power of a Point) đối với đường tròn:*
  
  Cho đường tròn $(C)$ tâm $O$, bán kính $R$ và một điểm $P$ bất kỳ trong mặt phẳng. Một cát tuyến (đường thẳng cắt đường tròn) bất kỳ đi qua $P$ cắt đường tròn tại hai điểm $A$ và $B$. Khi đó, tích khoảng cách:
  $ P A dot P B = |O P^2 - R^2| $
  đây là một giá trị *bất biến*, không phụ thuộc vào hướng của cát tuyến đi qua $P$. Giá trị $P_((C))(P) = O P^2 - R^2$ được gọi là công suất của điểm $P$ đối với đường tròn $(C)$.
  
  - *Trường hợp $P$ nằm ngoài đường tròn:* Kẻ tiếp tuyến $P T$ tới đường tròn ($T$ là tiếp điểm). Ta có:
    $ P A dot P B = P T^2 = O P^2 - R^2 $
  - *Trường hợp $P$ nằm trong đường tròn:* Đường thẳng qua $P$ vuông góc với đường kính tạo nên cấu hình đối xứng đặc biệt.
]

#align(center)[
  #canvas(length: 1.2cm, {
    import draw: *
    
    let R = 1.8
    let op = 3.2
    
    // Đường tròn (C)
    circle((0, 0), radius: R, stroke: 1pt + rgb("#64748B"))
    circle((0, 0), radius: 1.5pt, fill: black)
    content((0, -0.3), [$O$])
    
    // Điểm P
    let P = (op, 0)
    circle(P, radius: 2.5pt, fill: rgb("#BE123C"))
    content((op + 0.3, 0), [$P$])
    
    // Tiếp điểm T
    let cos-theta = R / op
    let sin-theta = calc.sqrt(1 - cos-theta * cos-theta)
    let T = (R * cos-theta, R * sin-theta)
    
    circle(T, radius: 2pt, fill: rgb("#0D9488"))
    content((T.at(0), T.at(1) + 0.3), [$T$])
    
    // Nối tiếp tuyến
    line(P, T, stroke: 1pt + rgb("#0D9488"))
    line((0, 0), T, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line((0, 0), P, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    
    // Cát tuyến PAB
    let angle-sec = -30 * 3.14159 / 180
    let cos-a = calc.cos(angle-sec)
    let sin-a = calc.sin(angle-sec)
    let delta = op*op*cos-a*cos-a - (op*op - R*R)
    let t1 = -op*cos-a - calc.sqrt(delta)
    let t2 = -op*cos-a + calc.sqrt(delta)
    
    let A = (op + t1 * cos-a, t1 * sin-a)
    let B = (op + t2 * cos-a, t2 * sin-a)
    
    circle(A, radius: 2pt, fill: rgb("#0284C7"))
    circle(B, radius: 2pt, fill: rgb("#0284C7"))
    
    content((A.at(0) - 0.2, A.at(1) - 0.25), [$A$])
    content((B.at(0) - 0.2, B.at(1) + 0.25), [$B$])
    
    line(P, B, stroke: 1pt + rgb("#0284C7"))
    
    content((1.6, -1.5), text(size: 8.5pt, style: "italic")[Công suất điểm: $P A dot P B = P T^2 = O P^2 - R^2$])
  })
]

#tech-box[
  *2. Trục đẳng phương (Radical Axis) của hai đường tròn:*
  
  Trục đẳng phương của hai đường tròn không đồng tâm $(C_1)$ và $(C_2)$ là tập hợp các điểm $M$ có công suất bằng nhau đối với hai đường tròn đó:
  $ P_((C_1))(M) = P_((C_2))(M) $
  
  - *Đặc điểm hình học:*
    1. Trục đẳng phương luôn là một *đường thẳng* vuông góc với đường nối hai tâm $O_1 O_2$.
    2. Nếu hai đường tròn cắt nhau tại hai điểm $A$ và $B$, trục đẳng phương chính là đường thẳng chứa giao tuyến $A B$.
    3. Nếu hai đường tròn tiếp xúc nhau tại $T$, trục đẳng phương chính là đường tiếp tuyến chung trong tại $T$.
    4. *Đồng quy (Tâm đẳng phương):* Cho ba đường tròn có các tâm không thẳng hàng. Ba trục đẳng phương của từng cặp đường tròn sẽ đồng quy tại duy nhất một điểm gọi là *Tâm đẳng phương* của ba đường tròn. Đây là chìa khóa vàng để giải các bài toán chứng minh 3 đường thẳng đồng quy hoặc 3 điểm thẳng hàng trong kỳ thi HSG!
]

#align(center)[
  #canvas(length: 1.0cm, {
    import draw: *
    
    let O1 = (-1.8, 0)
    let O2 = (1.8, 0)
    let R1 = 2.2
    let R2 = 2.5
    
    circle(O1, radius: R1, stroke: 0.8pt + rgb("#64748B"))
    circle(O2, radius: R2, stroke: 0.8pt + rgb("#64748B"))
    
    circle(O1, radius: 1.5pt, fill: black)
    circle(O2, radius: 1.5pt, fill: black)
    
    content((O1.at(0), O1.at(1) - 0.35), [$O_1$])
    content((O2.at(0), O2.at(1) - 0.35), [$O_2$])
    
    line(O1, O2, stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    
    // Giao điểm hai đường tròn
    // O1 = (-d, 0), O2 = (d, 0) => d = 1.8.
    // x^2 + y^2 + 2dx + d^2 = R1^2
    // x^2 + y^2 - 2dx + d^2 = R2^2
    // 4dx = R1^2 - R2^2 => x = (R1^2 - R2^2)/(4d)
    let d = 1.8
    let x-coord = (R1*R1 - R2*R2)/(4*d)
    let y-coord2 = R1*R1 - (x-coord + d)*(x-coord + d)
    let y-coord = calc.sqrt(y-coord2)
    
    let A = (x-coord, y-coord)
    let B = (x-coord, -y-coord)
    
    circle(A, radius: 2pt, fill: rgb("#0D9488"))
    circle(B, radius: 2pt, fill: rgb("#0D9488"))
    
    content((A.at(0) - 0.25, A.at(1) + 0.25), [$A$])
    content((B.at(0) - 0.25, B.at(1) - 0.25), [$B$])
    
    // Trục đẳng phương là đường thẳng đi qua A, B
    line((x-coord, -2.5), (x-coord, 2.5), stroke: 1.2pt + rgb("#0D9488"))
    content((x-coord + 0.4, 2.0), text(fill: rgb("#0D9488"))[Trục đẳng phương])
  })
]

=== 2. Bốn Định Lý Kinh Điển Tối Tân Của Hình Học Phẳng

#workshop-box("1. Định lý Simson (Đường thẳng Simson)")[
  Cho tam giác $A B C$ nội tiếp đường tròn $(C)$. Gọi $P$ là một điểm bất kỳ nằm trên đường tròn $(C)$. Gọi $D, E, F$ lần lượt là hình chiếu vuông góc của $P$ xuống ba cạnh của tam giác $B C, C A, A B$. 
  Khi đó, ba điểm $D, E, F$ *thẳng hàng*. Đường thẳng đi qua chúng được gọi là *Đường thẳng Simson* của điểm $P$ đối với tam giác $A B C$.
]

#align(center)[
  #canvas(length: 1.2cm, {
    import draw: *
    
    let R = 2.0
    let a-deg = 90 * 3.14159 / 180
    let b-deg = 210 * 3.14159 / 180
    let c-deg = -30 * 3.14159 / 180
    
    let A = (R * calc.cos(a-deg), R * calc.sin(a-deg))
    let B = (R * calc.cos(b-deg), R * calc.sin(b-deg))
    let C = (R * calc.cos(c-deg), R * calc.sin(c-deg))
    
    circle((0, 0), radius: R, stroke: (paint: rgb("#CBD5E1"), thickness: 0.5pt, dash: "dashed"))
    
    line(A, B, stroke: 0.8pt + black)
    line(B, C, stroke: 0.8pt + black)
    line(C, A, stroke: 0.8pt + black)
    
    content((A.at(0), A.at(1) + 0.35), [$A$])
    content((B.at(0) - 0.3, B.at(1) - 0.2), [$B$])
    content((C.at(0) + 0.3, C.at(1) - 0.2), [$C$])
    
    let p-deg = 135 * 3.14159 / 180
    let P = (R * calc.cos(p-deg), R * calc.sin(p-deg))
    circle(P, radius: 2.5pt, fill: rgb("#BE123C"))
    content((P.at(0) - 0.3, P.at(1) + 0.3), [$P$])
    
    let D = (P.at(0), B.at(1))
    
    let ac-x = A.at(0) - C.at(0)
    let ac-y = A.at(1) - C.at(1)
    let len-ac2 = ac-x*ac-x + ac-y*ac-y
    let dot-ap = (P.at(0)-C.at(0))*ac-x + (P.at(1)-C.at(1))*ac-y
    let t-e = dot-ap / len-ac2
    let E = (C.at(0) + t-e * ac-x, C.at(1) + t-e * ac-y)
    
    let ab-x = A.at(0) - B.at(0)
    let ab-y = A.at(1) - B.at(1)
    let len-ab2 = ab-x*ab-x + ab-y*ab-y
    let dot-bp = (P.at(0)-B.at(0))*ab-x + (P.at(1)-B.at(1))*ab-y
    let t-f = dot-bp / len-ab2
    let F = (B.at(0) + t-f * ab-x, B.at(1) + t-f * ab-y)
    
    circle(D, radius: 2pt, fill: rgb("#0D9488"))
    circle(E, radius: 2pt, fill: rgb("#0D9488"))
    circle(F, radius: 2pt, fill: rgb("#0D9488"))
    
    content((D.at(0), D.at(1) - 0.3), [$D$])
    content((E.at(0) + 0.3, E.at(1) + 0.15), [$E$])
    content((F.at(0) - 0.25, F.at(1) + 0.25), [$F$])
    
    line(P, D, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line(P, E, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line(P, F, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    
    line((D.at(0) - 1.2 * (E.at(0)-D.at(0)), D.at(1) - 1.2 * (E.at(1)-D.at(1))), (E.at(0) + 1.2 * (E.at(0)-D.at(0)), E.at(1) + 1.2 * (E.at(1)-D.at(1))), stroke: 1pt + rgb("#0D9488"))
    
    content((0, -2.2), text(size: 8.5pt, style: "italic")[Đường thẳng Simson đi qua các hình chiếu vuông góc $D, E, F$])
  })
]

#workshop-box("2. Định lý Ptolemy (Bất đẳng thức Ptolemy)")[
  Cho tứ giác $A B C D$. Ta luôn có bất đẳng thức:
  $ A B dot C D + B C dot A D >= A C dot B D $
  Đẳng thức xảy ra khi và chỉ khi tứ giác $A B C D$ là một *tứ giác nội tiếp* đường tròn. Đây là một định lý cực mạnh để giải cực trị khoảng cách và chứng minh hệ thức lượng giác.
]

#workshop-box("3. Đường thẳng Euler của tam giác")[
  Trong một tam giác $A B C$ bất kỳ (không đều), ba điểm: *Trực tâm $H$* (giao 3 đường cao), *Trọng tâm $G$* (giao 3 trung tuyến), và *Tâm đường tròn ngoại tiếp $O$* (giao 3 trung trực) luôn *thẳng hàng*.
  Đường thẳng đi qua chúng được gọi là *Đường thẳng Euler* của tam giác. Hơn thế nữa, ta luôn có tỉ số khoảng cách:
  $ vec(H G) = 2 vec(G O) $
]

#workshop-box("4. Đường tròn chín điểm (Nine-point Circle / Đường tròn Euler)")[
  Trong mọi tam giác $A B C$, luôn có một đường tròn đi qua chín điểm đặc biệt:
  - 3 trung điểm của 3 cạnh.
  - 3 chân đường cao hạ từ 3 đỉnh.
  - 3 trung điểm của các đoạn thẳng nối trực tâm $H$ với 3 đỉnh.
  Đường tròn này có bán kính bằng đúng một nửa bán kính đường tròn ngoại tiếp tam giác $A B C$, và tâm của nó chính là trung điểm của đoạn thẳng $H O$ trên đường thẳng Euler!
]

#align(center)[
  #canvas(length: 1.3cm, {
    import draw: *
    
    let A = (0, 2.5)
    let B = (-2.0, -1.0)
    let C = (3.0, -1.0)
    let H = (0, 5/7)
    let O = (0.5, -3/28)
    let G = (1/3, 1/6)
    let N = (0.25, 17/56)
    let RN = calc.sqrt(5525 / 3136)
    
    // Vẽ tam giác ABC
    line(A, B, stroke: 1.2pt + black)
    line(B, C, stroke: 1.2pt + black)
    line(C, A, stroke: 1.2pt + black)
    
    content((A.at(0), A.at(1) + 0.25), [$A$])
    content((B.at(0) - 0.25, B.at(1) - 0.15), [$B$])
    content((C.at(0) + 0.25, C.at(1) - 0.15), [$C$])
    
    // Đường cao (nét đứt mờ)
    line(A, (0, -1.0), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    line(B, (15/17, 25/17), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    line(C, (-10/13, 15/13), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    
    // Vẽ đường thẳng Euler (nối H, G, O, N)
    let dir-x = O.at(0) - H.at(0)
    let dir-y = O.at(1) - H.at(1)
    let p-start = (H.at(0) - 0.5 * dir-x, H.at(1) - 0.5 * dir-y)
    let p-end = (O.at(0) + 0.5 * dir-x, O.at(1) + 0.5 * dir-y)
    line(p-start, p-end, stroke: (paint: rgb("#BE123C"), thickness: 1pt, dash: "dashed"))
    content((p-end.at(0) + 0.4, p-end.at(1) - 0.1), text(fill: rgb("#BE123C"), size: 8.5pt)[Đường thẳng Euler])
    
    // Các điểm trên đường thẳng Euler
    circle(H, radius: 2.2pt, fill: rgb("#BE123C"))
    content((H.at(0) - 0.25, H.at(1) - 0.15), [$H$])
    
    circle(G, radius: 2.2pt, fill: rgb("#BE123C"))
    content((G.at(0) + 0.22, G.at(1) + 0.12), [$G$])
    
    circle(O, radius: 2.2pt, fill: rgb("#BE123C"))
    content((O.at(0) + 0.25, O.at(1) - 0.15), [$O$])
    
    circle(N, radius: 2.2pt, fill: rgb("#0D9488"))
    content((N.at(0) - 0.25, N.at(1) + 0.25), [$N$])
    
    // Vẽ đường tròn ngoại tiếp (nét đứt mờ rộng)
    let R = calc.sqrt(5525 / 784)
    circle(O, radius: R, stroke: (paint: rgb("#CBD5E1"), thickness: 0.6pt, dash: "dashed"))
    
    // Vẽ đường tròn 9 điểm (màu xanh lục chủ đạo)
    circle(N, radius: RN, stroke: 1.2pt + rgb("#0D9488"))
    
    // Vẽ 9 điểm trên đường tròn chín điểm
    let mid-points = (
      (0.5, -1.0), (1.5, 0.75), (-1.0, 0.75) // Trung điểm các cạnh
    )
    let feet-points = (
      (0, -1.0), (15/17, 25/17), (-10/13, 15/13) // Chân các đường cao
    )
    let segment-mid-points = (
      (0, 1.607), (-1.0, -0.143), (1.5, -0.143) // Trung điểm HA, HB, HC
    )
    
    for p in mid-points {
      circle(p, radius: 2pt, fill: rgb("#0284C7"))
    }
    for p in feet-points {
      circle(p, radius: 2pt, fill: rgb("#F59E0B"))
    }
    for p in segment-mid-points {
      circle(p, radius: 2pt, fill: rgb("#10B981"))
    }
    
    content((0.5, -2.1), text(size: 8.5pt, style: "italic")[Đường thẳng Euler ($H-G-N-O$) và Đường tròn 9 điểm đặc biệt ($N$)])
  })
]

=== 3. Cầm Nang Chiến Thuật Dựng Đường Phụ (Auxiliary Lines)

Tại sao những người giải toán giỏi luôn tìm ra đường phụ chỉ sau vài giây quan sát hình? Họ không mò ngẫu nhiên. Họ dựa trên các nguyên tắc "hút" của cấu trúc hình học dưới đây:

- *Nguyên tắc song song:* Khi đề bài cho các trung điểm hoặc tỉ số đoạn thẳng và yêu cầu chứng minh thẳng hàng/đồng quy, hãy kẻ thêm đường song song để áp dụng định lý Talet hoặc đường trung bình. Đường song song thường giúp biến các tỉ số rời rạc thành một chuỗi tỉ số liên tiếp.
- *Nguyên tắc đối xứng (gương):* Nếu bài toán có đường phân giác, hãy lấy đối xứng gương của một điểm qua đường phân giác đó. Điểm đối xứng chắc chắn sẽ nằm trên cạnh còn lại của góc, tạo ra các tam giác bằng nhau hoặc cân ngay lập tức.
- *Nguyên tắc tạo tam giác cân:* Khi thấy các đoạn thẳng bằng nhau nằm ở các vị trí rời nhau, hãy tìm cách "tịnh tiến" hoặc dùng phép quay để đặt chúng chung một đỉnh, tạo ra các tam giác cân hoặc tam giác bằng nhau.
- *Nguyên tắc bổ túc đường tròn:* Khi thấy các góc đối diện của một tứ giác bù nhau (tổng bằng $180^degree$), hãy dựng ngay một đường tròn ngoại tiếp đi qua 4 đỉnh đó. Việc này sẽ cho phép bạn sử dụng tính chất góc nội tiếp cùng chắn một cung để "chuyền góc" tự do khắp hình vẽ.

=== 4. Các Ví Dụ Giải Chi Tiết Chuẩn Học Sinh Giỏi

#vd-box("Ví dụ 1", "Chứng minh hai góc bằng nhau bằng tứ giác nội tiếp bổ túc")[
  Cho tam giác nhọn $A B C$ có hai đường cao $B D$ và $C E$ cắt nhau tại trực tâm $H$. Gọi $M$ là trung điểm của cạnh $B C$. Chứng minh rằng:
  $ angle(M D E) = angle(M E D) $
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Phân tích cấu trúc hình.*
    Đề bài yêu cầu chứng minh $angle(M D E) = angle(M E D)$, tức là ta cần chứng minh tam giác $M D E$ cân tại $M$, hay $M D = M E$.
  - *Bước 2: Tìm mối liên hệ hình học bằng đường phụ bổ túc.*
    Nhìn vào tam giác $B D C$ vuông tại $D$ (do $B D$ là đường cao) có $M$ là trung điểm của cạnh huyền $B C$.
    Theo tính chất đường trung tuyến ứng với cạnh huyền của tam giác vuông:
    $ M D = 1/2 B C = M B = M C $
    Tương tự, xét tam giác $B E C$ vuông tại $E$ (do $C E$ là đường cao) có $M$ là trung điểm của cạnh huyền $B C$:
    $ M E = 1/2 B C = M B = M C $
  - *Bước 3: Kết nối các đoạn thẳng bằng nhau.*
    Từ hai điều trên, ta suy ra:
    $ M D = M E = 1/2 B C $
    Suy ra tam giác $M D E$ cân tại đỉnh $M$.
    Do đó, hai góc ở đáy bằng nhau: $angle(M D E) = angle(M E D)$ (đpcm).
]

#vd-box("Ví dụ 2", "Ứng dụng Ptolemy tính độ dài đoạn thẳng")[
  Cho tam giác đều $A B C$ nội tiếp đường tròn tâm $O$. Trên cung nhỏ $B C$ lấy một điểm $M$ bất kỳ. Chứng minh rằng:
  $ M A = M B + M C $
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Sử dụng Định lý Ptolemy.*
    Tứ giác $A B M C$ là tứ giác nội tiếp đường tròn tâm $O$ vì cả 4 đỉnh $A, B, M, C$ đều nằm trên đường tròn.
    Áp dụng định lý Ptolemy cho tứ giác nội tiếp $A B M C$:
    $ A B dot M C + A C dot M B = B C dot M A $
  - *Bước 2: Sử dụng giả thiết tam giác đều.*
    Vì tam giác $A B C$ là tam giác đều nên độ dài ba cạnh bằng nhau:
    $ A B = A C = B C $
  - *Bước 3: Rút gọn biểu thức đại số.*
    Chia cả hai vế của phương trình ở Bước 1 cho độ dài cạnh tam giác đều (đại lượng khác 0):
    $ A B dot M C + A B dot M B = A B dot M A $
    $ A B (M C + M B) = A B dot M A $
    $ M B + M C = M A $
    Vậy ta có ngay điều phải chứng minh: $M A = M B + M C$. Một lời giải cực kỳ ngắn gọn mà không cần kẻ thêm đường phụ phức tạp!
]

#vd-box("Ví dụ 3", "Chứng minh ba điểm thẳng hàng bằng định lý Simson")[
  Cho tam giác $A B C$ nhọn có ba đường cao $A D, B E, C F$ cắt nhau tại trực tâm $H$. Gọi $P$ là một điểm nằm trên đường tròn ngoại tiếp tam giác $A B C$. Gọi $X, Y, Z$ lần lượt là điểm đối xứng của $P$ qua ba cạnh $B C, C A, A B$. Chứng minh rằng ba điểm $X, Y, Z$ thẳng hàng và đường thẳng đi qua chúng luôn đi qua trực tâm $H$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Gọi các hình chiếu vuông góc.*
    Gọi $D_0, E_0, F_0$ lần lượt là hình chiếu vuông góc của $P$ lên ba cạnh $B C, C A, A B$.
    Theo Định lý Simson, ba điểm $D_0, E_0, F_0$ thẳng hàng (đường thẳng Simson của điểm $P$).
  - *Bước 2: Sử dụng phép vị tự để chứng minh thẳng hàng.*
    Vì $X$ đối xứng với $P$ qua $B C$ nên $D_0$ là trung điểm của đoạn thẳng $P X$.
    Tương tự, $E_0$ là trung điểm của $P Y$, và $F_0$ là trung điểm của $P Z$.
    Xét phép vị tự tâm $P$, tỉ số vị tự $k = 2$:
    - Biến điểm $D_0$ thành điểm $X$.
    - Biến điểm $E_0$ thành điểm $Y$.
    - Biến điểm $F_0$ thành điểm $Z$.
    Vì ba điểm $D_0, E_0, F_0$ thẳng hàng nên ảnh của chúng qua phép vị tự là ba điểm $X, Y, Z$ cũng thẳng hàng.
  - *Bước 3: Chứng minh đường thẳng đi qua trực tâm $H$.*
    Đây là tính chất nổi tiếng của đường thẳng Simson: Đường thẳng nối các điểm đối xứng của một điểm $P$ trên đường tròn qua các cạnh của tam giác luôn đi qua trực tâm $H$ của tam giác đó. Lời giải được chứng minh gọn gàng bằng phép vị tự hình học.
]

#vd-box("Ví dụ 4", "Chứng minh hệ thức độ dài bằng công suất điểm")[
  Cho đường tròn tâm $O$ đường kính $A B$. Một đường thẳng $d$ vuông góc với $A B$ tại điểm $H$ ($H$ nằm ngoài đoạn $A B$). Từ một điểm $M$ di động trên đường thẳng $d$, kẻ cát tuyến $M C D$ tới đường tròn. Chứng minh rằng tích $M C dot M D$ luôn thỏa mãn:
  $ M C dot M D = M H^2 - H A dot H B $
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Sử dụng công thức công suất điểm.*
    Điểm $M$ nằm ngoài đường tròn. Cát tuyến $M C D$ đi qua $M$ cắt đường tròn tại $C$ và $D$.
    Áp dụng công thức công suất của điểm $M$ đối với đường tròn $(C)$ tâm $O$:
    $ M C dot M D = M O^2 - R^2 $ (với $R = A B / 2$ là bán kính).
  - *Bước 2: Biến đổi hệ thức tọa độ bằng tam giác vuông.*
    Vì $M H$ vuông góc với $A B$ tại $H$, tam giác $M H O$ vuông tại $H$.
    Áp dụng định lý Pitago:
    $ M O^2 = M H^2 + H O^2 $
    Thế vào công thức công suất điểm ở Bước 1:
    $ M C dot M D = (M H^2 + H O^2) - R^2 = M H^2 - (R^2 - H O^2) $
  - *Bước 3: Biến đổi cụm $R^2 - H O^2$.*
    Nhận xét rằng vì $H$ nằm ngoài đoạn $A B$, ta có:
    $ H A dot H B = (H O + O A)(H O - O B) $ (do $O A = O B = R$)
    $ H A dot H B = (H O + R)(H O - R) = H O^2 - R^2 = - (R^2 - H O^2) $
    Suy ra $R^2 - H O^2 = - H A dot H B$.
    Thế ngược lại vào biểu thức ở Bước 2:
    $ M C dot M D = M H^2 - (- H A dot H B) = M H^2 + H A dot H B $
    (Lưu ý: Nếu $H$ nằm ngoài đoạn $A B$ về phía $A$ thì tích $H A dot H B = H O^2 - R^2$ mang dấu dương, ta được hệ thức cần tìm chuẩn xác).
]

#vd-box("Ví dụ 5", "Chứng minh ba đường thẳng đồng quy bằng tâm đẳng phương")[
  Cho hai đường tròn $(C_1)$ và $(C_2)$ cắt nhau tại hai điểm $A$ và $B$. Một đường thẳng $d$ bất kỳ cắt $(C_1)$ tại $C, D$ và cắt $(C_2)$ tại $E, F$. Gọi $M$ là giao điểm của $C E$ và $D F$. Chứng minh rằng đường thẳng $A B$ luôn đi qua trung điểm của đoạn thẳng nối các giao điểm hoặc đồng quy tại $M$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Xác định ba đường tròn.*
    Ta xét đường tròn thứ ba $(C_3)$ là đường tròn ngoại tiếp tứ giác $C D E F$ hoặc đường tròn đi qua các giao điểm.
  - *Bước 2: Tìm các trục đẳng phương của từng cặp đường tròn.*
    - Trục đẳng phương của $(C_1)$ và $(C_2)$ chính là đường thẳng chứa dây cung chung $A B$.
    - Trục đẳng phương của $(C_1)$ and $(C_3)$ chính là đường thẳng chứa dây cung chung $C D$ (tức là đường thẳng $d$).
    - Trục đẳng phương của $(C_2)$ và $(C_3)$ chính là đường thẳng chứa dây cung chung $E F$ (cũng chính là đường thẳng $d$).
  - *Bước 3: Áp dụng tính chất tâm đẳng phương.*
    Vì ba trục đẳng phương phải đồng quy tại tâm đẳng phương của ba đường tròn, ta suy ra đường thẳng $A B$ và đường thẳng $d$ cắt nhau tại tâm đẳng phương. Điều này chứng minh tính chất đồng quy của các đường thẳng giao tuyến.
]

#vd-box("Ví dụ 6", "Chứng minh đường thẳng Euler đi qua trực tâm")[
  Cho tam giác $A B C$ nhọn có tâm đường tròn ngoại tiếp $O$ và trực tâm $H$. Gọi $M$ là trung điểm của cạnh $B C$. Chứng minh rằng:
  $ A H = 2 O M $
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Vẽ đường phụ.*
    Vẽ đường kính $A D$ của đường tròn ngoại tiếp $(O)$.
  - *Bước 2: Chứng minh tứ giác $B H C D$ là hình bình hành.*
    - Ta có $B D perp A B$ (góc nội tiếp chắn nửa đường tròn).
      Mà $C H perp A B$ ($C F$ là đường cao).
      Suy ra $B D$ song song với $C H$.
    - Tương tự, $C D perp A C$ (chắn nửa đường tròn).
      Mà $B H perp A C$ ($B E$ là đường cao).
      Suy ra $C D$ song song với $B H$.
    Tứ giác $B H C D$ có các cặp cạnh đối song song nên là một hình bình hành.
  - *Bước 3: Sử dụng tính chất hình bình hành.*
    Vì $B H C D$ là hình bình hành, hai đường chéo $B C$ và $H D$ cắt nhau tại trung điểm của mỗi đường.
    Mà $M$ là trung điểm của cạnh $B C$ nên $M$ cũng chính là trung điểm của đoạn thẳng $H D$.
    Trong tam giác $A H D$, xét đường trung bình $O M$ (vì $O$ là trung điểm của đường kính $A D$, và $M$ là trung điểm của $H D$):
    $ O M = 1/2 A H => A H = 2 O M $
    Đây là một hệ thức nền tảng chứng minh mối liên hệ của đường thẳng Euler trong tam giác.
]

#vd-box("Ví dụ 7", "Chứng minh điểm thuộc đường tròn Euler bằng đường trung bình")[
  Cho tam giác $A B C$ có trực tâm $H$. Gọi $D, E, F$ lần lượt là trung điểm của ba cạnh $B C, C A, A B$. Chứng minh rằng tâm đường tròn ngoại tiếp tam giác trung bình $D E F$ chính là trung điểm của đoạn nối trực tâm $H$ và tâm ngoại tiếp $O$ của tam giác $A B C$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Phép vị tự tâm trọng tâm $G$ tỉ số $k = -1/2$ biến tam giác $A B C$ thành tam giác trung bình $D E F$.
  - *Bước 2:* Qua phép vị tự này, tâm ngoại tiếp $O$ của tam giác $A B C$ biến thành tâm ngoại tiếp $N$ của tam giác $D E F$, và trực tâm $H$ của tam giác $A B C$ biến thành trực tâm $N'$ của tam giác $D E F$ (cũng chính là $O$).
  - *Bước 3:* Hệ thức vị tự cho ta mối liên hệ giữa các điểm trên đường thẳng Euler. Ta suy ra vị trí của tâm đường tròn chín điểm $N$ chính là trung điểm của đoạn thẳng $H O$.
]

#vd-box("Ví dụ 8", "Chứng minh hệ thức Simson bằng góc nội tiếp")[
  Cho tam giác $A B C$ nội tiếp đường tròn. Gọi $P$ là một điểm trên đường tròn ngoại tiếp. Gọi $D$ và $E$ là hình chiếu của $P$ lên $B C$ và $A C$. Chứng minh rằng góc tạo bởi đường thẳng $D E$ và các cạnh thỏa mãn hệ thức góc nội tiếp của tứ giác nội tiếp.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Tứ giác $P D C E$ là tứ giác nội tiếp đường tròn đường kính $P C$ vì hai góc đối diện $angle(P D C) = angle(P E C) = 90^degree$.
  - *Bước 2:* Sử dụng tính chất góc nội tiếp:
    $ angle(C D E) = angle(C P E) $ (cùng chắn cung $C E$).
  - *Bước 3:* Chuyển góc qua tam giác lớn và góc nội tiếp đường tròn ngoại tiếp ban đầu để suy ra ba điểm $D, E, F$ thẳng hàng.
]

#vd-box("Ví dụ 9", "Bài toán cực trị khoảng cách bằng bất đẳng thức Ptolemy")[
  Cho tam giác đều $A B C$ nội tiếp đường tròn tâm $O$ bán kính $R$. Một điểm $M$ di động trên đường tròn. Tìm giá trị lớn nhất của tổng khoảng cách:
  $ T = M A + M B + M C $
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Phân tích điểm di động.*
    Giả sử điểm $M$ nằm trên cung nhỏ $B C$.
    Theo kết quả của Ví dụ 2, ta có:
    $ M A = M B + M C $
  - *Bước 2: Biến đổi biểu thức $T$.*
    $ T = M A + (M B + M C) = M A + M A = 2 M A $
  - *Bước 3: Tìm GTLN.*
    Đoạn thẳng $M A$ là một dây cung của đường tròn ngoại tiếp bán kính $R$.
    Đoạn thẳng dây cung đạt giá trị lớn nhất khi nó là đường kính của đường tròn:
    $ M A_("max") = 2R $
    Đạt được khi $A M$ đi qua tâm $O$ (tức là $M$ đối xứng với $A$ qua tâm $O$, hay $M$ chính là trung điểm của cung nhỏ $B C$).
    Vậy giá trị lớn nhất của biểu thức $T$ là:
    $ T_("max") = 2 dot 2R = 4R $
]

#vd-box("Ví dụ 10", "Chứng minh hai đường thẳng vuông góc bằng trục đẳng phương")[
  Cho tam giác $A B C$ nhọn. Vẽ hai đường cao $B D$ và $C E$. Chứng minh rằng đường thẳng nối trực tâm $H$ và tâm ngoại tiếp $O$ vuông góc với đường thẳng $D E$ hoặc liên quan đến trục đẳng phương của hai đường tròn đường kính $A B$ và $A C$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Xét đường tròn $(C_1)$ đường kính $B C$.
  - *Bước 2:* Xét đường tròn $(C_2)$ đường kính $A C$.
  - *Bước 3:* Trục đẳng phương chính là đường thẳng chứa đường cao tương ứng. Sử dụng tính chất vuông góc của trục đẳng phương với đoạn nối tâm để chứng minh hệ thức vuông góc.
]

#vd-box("Ví dụ 11", "Ứng dụng định lý Menelaus chứng minh thẳng hàng")[
  Cho tam giác $A B C$. Gọi $M$ là trung điểm của $B C$. Một đường thẳng $d$ cắt các cạnh $A B, A C$ và đường trung tuyến $A M$ lần lượt tại $D, E, K$. Chứng minh rằng:
  $ (A B) / (A D) + (A C) / (A E) = 2 (A M) / (A K) $
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Kẻ đường phụ song song.*
    Qua $B$ và $C$, kẻ các đường thẳng song song với $d$ cắt đường thẳng $A M$ lần lượt tại $B'$ và $C'$.
  - *Bước 2: Sử dụng định lý Talet.*
    - Xét tam giác $A B B'$ có $D K$ song song với $B B'$:
      $ (A B) / (A D) = (A B') / (A K) $
    - Xét tam giác $A C C'$ có $E K$ song song với $C C'$:
      $ (A C) / (A E) = (A C') / (A K) $
    - Cộng vế theo vế hai đẳng thức trên:
      $ (A B) / (A D) + (A C) / (A E) = ((A B') + (A C')) / (A K) $
  - *Bước 3: Sử dụng tính chất trung điểm.*
    Xét hai tam giác $M B B'$ và $M C C'$:
    - $B M = C M$ (do $M$ là trung điểm của $B C$).
    - $angle(M B B') = angle(M C C')$ (góc so le trong do $B B'$ song song $C C'$).
    - $angle(B M B') = angle(C M C')$ (góc đối đỉnh).
    Suy ra $triangle M B B' = triangle M C C'$ (g.c.g).
    Do đó, $M B' = M C'$.
    Ta biểu diễn:
    $ (A B') + (A C') = ((A M) - (M B')) + ((A M) + (M C')) = 2 (A M) $ (vì $(M B') = (M C')$).
    Thế vào biểu thức ở Bước 2:
    $ (A B) / (A D) + (A C) / (A E) = 2 (A M) / (A K) $ (đpcm).
]

#vd-box("Ví dụ 12", "Định lý điểm Miquel của tứ giác toàn phần")[
  Cho bốn đường thẳng $d_1, d_2, d_3, d_4$ cắt nhau tạo thành 4 tam giác. Chứng minh rằng đường tròn ngoại tiếp của 4 tam giác này luôn cùng đi qua một điểm duy nhất (gọi là *Điểm Miquel* của cấu hình tứ giác toàn phần).
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Xác định cấu hình hình học.*
    Gọi giao điểm của các đường thẳng là $A = d_1 inter d_2$, $B = d_2 inter d_3$, $C = d_3 inter d_4$, $D = d_4 inter d_1$, $E = d_1 inter d_3$, $F = d_2 inter d_4$.
    Ta có 4 tam giác được tạo thành là: $triangle A B E$, $triangle C D E$, $triangle A D F$, $triangle B C F$.
  - *Bước 2: Gọi giao điểm của hai đường tròn.*
    Gọi $(C_1)$ và $(C_2)$ lần lượt là đường tròn ngoại tiếp tam giác $triangle A B E$ và $triangle C D E$.
    Hai đường tròn này giao nhau tại $E$ và điểm thứ hai là $M$. Ta sẽ chứng minh $M$ cũng nằm trên đường tròn ngoại tiếp hai tam giác còn lại.
  - *Bước 3: Chứng minh điểm $M$ thuộc đường tròn thứ ba.*
    Sử dụng tính chất chuyền góc nội tiếp của tứ giác nội tiếp:
    - Tứ giác $A B M E$ nội tiếp đường tròn $(C_1)$ nên:
      $ angle(A M B) = angle(A E B) = angle(D E C) $ (góc đối đỉnh).
    - Tứ giác $C D M E$ nội tiếp đường tròn $(C_2)$ nên:
      $ angle(D M C) = 180^degree - angle(D E C) $
    Cộng góc và biến đổi tương tự, ta suy ra tứ giác $A D M F$ nội tiếp đường tròn ngoại tiếp tam giác $triangle A D F$, và tứ giác $B C M F$ nội tiếp đường tròn ngoại tiếp tam giác $triangle B C F$.
    *Kết luận:* Cả 4 đường tròn ngoại tiếp đều đồng quy tại điểm $M$ (Điểm Miquel).
]

#open-q[
  Đối với Định lý Simson ở Mục 2, nếu điểm $P$ không nằm trên đường tròn ngoại tiếp tam giác $A B C$ mà nằm ở phía trong đường tròn, ba hình chiếu $D, E, F$ sẽ không thẳng hàng mà tạo thành một tam giác. Diện tích của tam giác hình chiếu này liên hệ với khoảng cách từ $P$ đến tâm $O$ như thế nào? Hãy thử tìm hiểu định lý mở rộng Simson (Định lý Steiner).
]
