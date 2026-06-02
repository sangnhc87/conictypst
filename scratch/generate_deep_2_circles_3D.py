import math

def get_typst_header(f11, f12, f21, f22, f31, f32, f41, f42):
    return f"""#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.3.2"
#import "../math-sym.typ": *

#set page(
  paper: "a4",
  margin: (x: 1cm, y: 1.5cm),
)
#set text(font: "New Computer Modern", size: 10pt, lang: "vi")
#set par(justify: true, leading: 0.75em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 14pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.2em,
  below: 0.6em,
  text(fill: rgb("900C3F"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#let math-color = rgb("#000000") 
#show math.equation: set text(fill: math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
    [
      #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
        CHUYÊN ĐỀ CHUYÊN SÂU: CỰC TRỊ KHOẢNG CÁCH 2 ĐƯỜNG TRÒN TRONG 3D
      ]
      #v(0.3em)
      #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
        Hệ thống toàn diện 12 Cấu hình hình học & Mô hình thực tế phân loại cao
      ]
    ],
  )
]

== A. LÝ THUYẾT NỀN TẢNG & PHƯƠNG PHÁP TƯ DUY

Để giải quyết bài toán cực trị khoảng cách giữa điểm $M$ di động trên đường tròn $(C_1)$ và điểm $N$ di động trên đường tròn $(C_2)$ trong không gian $O x y z$, ta cần nắm vững hai phương pháp tư duy hình học cốt lõi sau:

1. *Phương pháp chiếu song song và phân rã phẳng (Cho trường hợp hai mặt phẳng song song):*
   Khi $(C_1)$ nằm trên mặt phẳng $(P_1)$ và $(C_2)$ nằm trên mặt phẳng $(P_2)$ song song với nhau cách nhau một khoảng bằng $h$:
   - Chiếu vuông góc điểm $M$ của $(C_1)$ lên mặt phẳng $(P_2)$ chứa $(C_2)$, ta được hình chiếu $M'$. Khi đó $M'$ chạy trên một đường tròn hình chiếu $(C_1')$ có cùng bán kính với $(C_1)$.
   - Khoảng cách không gian $M N$ được tính bằng định lý Pytago đứng:
     $ M N = sqrt(M' N^2 + h^2) $
     #align(center)[#{draw_method1_cetz()}]

   - Do chiều cao đứng $h$ là hằng số, $M N$ đạt cực trị khi và chỉ khi khoảng cách phẳng $M' N$ giữa hai đường tròn đồng phẳng $(C_1')$ và $(C_2)$ trên mặt phẳng $(P_2)$ đạt cực trị. Ta xét 3 vị trí tương đối của hai hình chiếu này:
     - *Rời nhau:* Khoảng cách nối hai tâm chiếu $d = J_1' J_2 > R_1 + R_2$. Khi đó:
       $ M N_(min) = sqrt(h^2 + (d - R_1 - R_2)^2) $
     - *Lồng nhau:* Khoảng cách nối hai tâm chiếu $d < |R_1 - R_2|$. Khi đó:
       $ M N_(min) = sqrt(h^2 + (|R_1 - R_2| - d)^2) $
     - *Cắt nhau hoặc tiếp xúc:* Hai đường tròn chiếu $(C_1')$ và $(C_2)$ có giao điểm hoặc điểm tiếp xúc chung (tại đó khoảng cách phẳng bằng $0$). Khi đó cực tiểu không gian chính là chiều cao đứng thẳng:
       $ M N_(min) = h $
       *(Đây là bẫy học sinh rất hay mắc phải khi làm bài thi).*

2. *Phương pháp chiếu vuông góc và phân rã Pytago (Cho trường hợp hai mặt phẳng chéo nhau, vuông góc hoặc nghiêng):*
   Khi mặt phẳng chứa hai đường tròn cắt nhau (góc giữa hai mặt phẳng bằng $alpha$):
   - Ta lấy điểm $M$ thuộc đường tròn $(C_1)$ trên mặt phẳng $(P_1)$, và chiếu vuông góc $M$ xuống mặt phẳng $(P_2)$ chứa $(C_2)$ được hình chiếu $M_p$.
   - Khi đó, tam giác $M M_p N$ vuông tại $M_p$ với mọi $N in (C_2)$ trên mặt phẳng $(P_2)$. Theo định lý Pytago không gian:
     $ M N = sqrt(M M_p^2 + M_p N^2) $
   #align(center)[#{draw_method2_cetz()}]

   - Trong đó, $M M_p = d(M, P_2)$ là khoảng cách từ $M$ đến mặt phẳng $(P_2)$ (chỉ phụ thuộc vào vị trí của $M$).
   - Với điểm $M$ cố định, khoảng cách $M N$ nhỏ nhất khi và chỉ khi khoảng cách phẳng $M_p N$ nhỏ nhất. Mà $N$ chạy trên đường tròn $(C_2)$ có tâm $J_2$, bán kính $R_2$ trong mặt phẳng $(P_2)$, nên khoảng cách phẳng nhỏ nhất là:
     $ M_p N_(min) = |M_p J_2 - R_2| $
   - Do đó, khoảng cách ngắn nhất từ điểm $M$ đến đường tròn $(C_2)$ được xác định bởi công thức Pytago phân rã chính xác:
     $ d(M, (C_2)) = sqrt(d(M, P_2)^2 + (M_p J_2 - R_2)^2) $
   - *Kỹ thuật quy giản thi cử về tâm (Đánh giá chặn dưới):* Trong thực tế làm bài thi trắc nghiệm, do biểu thức Pytago chính xác có dạng vô tỷ kép rất phức tạp để giải bằng tay, ta sử dụng đánh giá xấp xỉ hình học thông qua tâm đường tròn:
     $ M N >= M J_2 - R_2 $
     Độ dài đoạn $M N$ ngắn nhất khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2$ là nhỏ nhất. Điều này đưa bài toán khó về dạng cơ bản hơn là tìm cực trị khoảng cách từ một điểm trên đường tròn $(C_1)$ đến một điểm cố định $J_2$.

    - *Lưu ý sư phạm quan trọng - Lựa chọn hướng chiếu:*
      *Câu hỏi:* Tại sao ta chiếu điểm $M in (C_1)$ lên mặt phẳng $(P_2)$ chứa $(C_2)$ mà không làm ngược lại (chiếu $N in (C_2)$ lên mặt phẳng $(P_1)$)?
      *Trả lời:*
      - *Tính đối xứng:* Về mặt toán học, hai hướng chiếu là hoàn toàn đối xứng và luôn cho cùng một kết quả khoảng cách ngắn nhất $M N$ vì vai trò của $M, N$ trong không gian là tương đương nhau.
      - *Tiêu chí lựa chọn hướng chiếu tối ưu (để tính toán đơn giản nhất):* Ta nên chọn chiếu từ điểm trên mặt phẳng/đường tròn có cấu trúc phức tạp hơn sang mặt phẳng chứa đường tròn có cấu trúc đơn giản hơn theo hai tiêu chí:
        1. *Mặt phẳng đơn giản hơn:* Ưu tiên chiếu về các mặt phẳng tọa độ ($O x y: z=0$, $O y z: x=0$, $O x z: y=0$) hoặc mặt phẳng song song với mặt tọa độ. Phương trình của các mặt phẳng này cực kỳ đơn giản, giúp cho tọa độ hình chiếu $M_p$ có nhiều thành phần bằng $0$, làm giảm số lượng biến số và phép tính căn thức.
        2. *Bán kính và tham số hóa:* Nên chọn chiếu điểm từ đường tròn có bán kính lớn hơn (hoặc dễ tham số hóa hơn) sang mặt phẳng chứa đường tròn nhỏ hơn, giúp việc lấy hiệu hai bán kính $|M_p J_2 - R_2|$ trong Pytago không bị vấp phải dấu trị tuyệt đối phức tạp khi biến đổi đạo hàm.

3. *Phương pháp đạo hàm & Công thức khoảng cách tổng quát (Giải pháp vạn năng bằng Casio/Đạo hàm):*
   Trong phòng thi trắc nghiệm, nếu không muốn dựng hình chiếu phức tạp, ta có thể thiết lập trực tiếp hàm số khoảng cách một biến số bằng cách sử dụng *Công thức khoảng cách vạn năng từ một điểm $M$ bất kỳ đến đường tròn $(C_2)$* có tâm $J_2$, bán kính $R_2$ nằm trên mặt phẳng $(P_2)$:
   - Xét tam giác vuông $M M_p J_2$ tại hình chiếu $M_p$ của $M$ trên $(P_2)$, ta có h�=== 8 Cấu Hình Hình Học Mẫu Khái Quát Đi Kèm Hướng Giải Quyết Trực Quan:
#v(1em)

==== 1. Cấu hình 1.1: Đồng phẳng, đồng tâm
#align(center)[#{f11}]
*Idea giải:* Hai đường tròn cùng nằm trên một mặt phẳng và có chung tâm. Khoảng cách ngắn nhất chính là hiệu số giữa hai bán kính $|R_1 - R_2|$. Khoảng cách lớn nhất là tổng hai bán kính $R_1 + R_2$. Điểm cực trị nằm trên đường thẳng xuyên tâm.
#v(1.5em)

==== 2. Cấu hình 1.2: Đồng phẳng, lệch tâm
#align(center)[#{f12}]
*Idea giải:* Hai đường tròn nằm trên cùng mặt phẳng nhưng khác tâm. Khoảng cách cực trị đạt được khi hai điểm tiếp xúc đi qua trục nối hai tâm $J_1, J_2$. Khoảng cách min có thể tính nhanh bằng $d_("min") = |J_1 J_2 - R_1 - R_2|$ (nếu rời nhau).
#v(1.5em)

==== 3. Cấu hình 2.1: Song song, đồng trục
#align(center)[#{f21}]
*Idea giải:* Hai đường tròn nằm trên hai mặt phẳng song song cách nhau một khoảng $h$, và hình chiếu của tâm $J_1$ trùng với $J_2$. Bài toán quy về việc giải trên mặt phẳng cắt dọc. Dùng định lý Pytago: $d_("min") = sqrt(h^2 + (R_1 - R_2)^2)$.
#v(1.5em)

==== 4. Cấu hình 2.2: Song song, lệch tâm
#align(center)[#{f22}]
*Idea giải:* Hai mặt phẳng song song nhưng tâm bị lệch. Ta chiếu đường tròn $(C_1)$ xuống mặt phẳng chứa $(C_2)$ để được đường tròn hình chiếu $(C_1')$. Tìm khoảng cách min giữa $(C_1')$ và $(C_2)$ trên cùng mặt phẳng (2D), sau đó ráp vào Pytago 3D: $d_("min") = sqrt(h^2 + d_("flat")^2)$.
#v(1.5em)

==== 5. Cấu hình 3.1: Hai mặt phẳng vuông góc (Lệch tâm)
#align(center)[#{f31}]
*Idea giải:* Hai mặt phẳng chứa đường tròn vuông góc nhau (minh hoạ bằng 2 mặt liền kề của hình lập phương). Phương pháp tối ưu là chiếu điểm $M in (C_1)$ xuống mặt phẳng chứa $(C_2)$ lấy hình chiếu $M_p$. Sau đó áp dụng Pytago không gian: $M N = sqrt(M M_p^2 + M_p N^2)$. Dùng kỹ thuật đánh giá $M_p N >= |M_p J_2 - R_2|$ để đưa về khảo sát hàm 1 biến.
#v(1.5em)

==== 6. Cấu hình 3.2: Đoạn vuông góc chung (Trực tâm giao tuyến)
#align(center)[#{f32}]
*Idea giải:* Tương tự cấu hình 3.1 nhưng tâm của hai đường tròn cùng nằm trên một đoạn thẳng tạo thành đoạn vuông góc chung. Tọa độ hình chiếu rơi vào vị trí đặc biệt giúp khử rất nhiều biến số, tính toán cực kỳ tinh gọn và có thể nhẩm nhanh chóng.
#v(1.5em)

==== 7. Cấu hình 4.1: Mặt phẳng nghiêng (Đồng trục cắt nhau)
#align(center)[#{f41}]
*Idea giải:* Hai mặt phẳng tạo với nhau một góc nghiêng $alpha$ (minh hoạ bằng mặt cắt xéo 45 độ trong hình lập phương). Việc dùng hình chiếu $M_p$ sẽ gặp khó khăn về biểu thức dấu căn. Giải pháp tối ưu nhất là tham số hoá $M(t)$ và áp dụng *Công thức vạn năng*: $d = sqrt(M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2))$.
#v(1.5em)

==== 8. Cấu hình 4.2: Mặt phẳng nghiêng (Lệch tâm hoàn toàn)
#align(center)[#{f42}]
*Idea giải:* Cấu hình tổng quát và phức tạp nhất, khi hai mặt phẳng nghiêng nhau và hai tâm lệch nhau hoàn toàn. Không cần dựng hình phụ phức tạp, ta chỉ cần tham số hoá tọa độ 1 biến $t$ và nhập *Công thức vạn năng* vào chức năng Table (Casio) để quét tìm cực trị trong nháy mắt.
#v(2em)

#chapter([Hệ thống bài tập phân loại 12 Cấu hình])$(C_2)$ trên cùng mặt phẳng phẳng (2D), sau đó ráp vào Pytago 3D: $d_{min} = sqrt{h^2 + d_{flat}^2}$.
#v(1.5em)

==== 5. Cấu hình 3.1: Hai mặt phẳng vuông góc (Lệch tâm)
#align(center)[#{f31}]
*Idea giải:* Hai mặt phẳng chứa đường tròn vuông góc nhau (minh hoạ bằng 2 mặt liền kề của hình lập phương). Phương pháp tối ưu là chiếu điểm $M in (C_1)$ xuống mặt phẳng chứa $(C_2)$ lấy hình chiếu $M_p$. Sau đó áp dụng Pytago không gian: $MN = sqrt{MM_p^2 + M_pN^2}$. Dùng kỹ thuật đánh giá $M_p N \ge |M_p J_2 - R_2|$ để đưa về khảo sát hàm 1 biến.
#v(1.5em)

==== 6. Cấu hình 3.2: Đoạn vuông góc chung (Trực tâm giao tuyến)
#align(center)[#{f32}]
*Idea giải:* Tương tự cấu hình 3.1 nhưng tâm của hai đường tròn cùng nằm trên một đoạn thẳng tạo thành đoạn vuông góc chung. Tọa độ hình chiếu rơi vào vị trí đặc biệt giúp khử rất nhiều biến số, tính toán cực kỳ tinh gọn và có thể nhẩm nhanh chóng.
#v(1.5em)

==== 7. Cấu hình 4.1: Mặt phẳng nghiêng (Đồng trục cắt nhau)
#align(center)[#{f41}]
*Idea giải:* Hai mặt phẳng tạo với nhau một góc nghiêng $lpha$ (minh hoạ bằng mặt cắt xéo 45 độ trong hình lập phương). Việc dùng hình chiếu $M_p$ sẽ gặp khó khăn về biểu thức dấu căn. Giải pháp tối ưu nhất là tham số hoá $M(t)$ và áp dụng **Công thức vạn năng**: $d = sqrt{MJ_2^2 + R_2^2 - 2R_2sqrt{MJ_2^2 - d(M, P_2)^2}}$.
#v(1.5em)

==== 8. Cấu hình 4.2: Mặt phẳng nghiêng (Lệch tâm hoàn toàn)
#align(center)[#{f42}]
*Idea giải:* Cấu hình tổng quát và phức tạp nhất, khi hai mặt phẳng nghiêng nhau và hai tâm lệch nhau hoàn toàn. Không cần dựng hình phụ phức tạp, ta chỉ cần tham số hoá tọa độ 1 biến $t$ và nhập **Công thức vạn năng** vào chức năng Table (Casio) để quét tìm cực trị trong nháy mắt.
#v(2em)

#chapter([Hệ thống bài tập phân loại 12 Cấu hình])
"""

def get_uv(A, B, C):
    len_n = math.sqrt(A**2 + B**2 + C**2)
    n = (A/len_n, B/len_n, C/len_n)
    if abs(n[0]) < 1e-6 and abs(n[1]) < 1e-6:
        return (1.0, 0.0, 0.0), (0.0, 1.0, 0.0)
    v = (-n[2]*n[0], -n[2]*n[1], 1.0 - n[2]**2)
    len_v = math.sqrt(v[0]**2 + v[1]**2 + v[2]**2)
    v = (v[0]/len_v, v[1]/len_v, v[2]/len_v)
    u = (v[1]*n[2] - v[2]*n[1], v[2]*n[0] - v[0]*n[2], v[0]*n[1] - v[1]*n[0])
    len_u = math.sqrt(u[0]**2 + u[1]**2 + u[2]**2)
    u = (u[0]/len_u, u[1]/len_u, u[2]/len_u)
    return u, v










def draw_method1_cetz(scale=0.35):
    prj_def = """let prj(x, y, z) = {
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }"""
    
    cube_def = """
    let v000 = prj(0,0,0); let v600 = prj(6,0,0); let v660 = prj(6,6,0); let v060 = prj(0,6,0)
    let v006 = prj(0,0,6); let v606 = prj(6,0,6); let v666 = prj(6,6,6); let v066 = prj(0,6,6)
    // Hidden edges
    line(v000, v600, stroke: (dash: "dashed", paint: gray))
    line(v000, v060, stroke: (dash: "dashed", paint: gray))
    line(v000, v006, stroke: (dash: "dashed", paint: gray))
    // Solid edges
    line(v600, v660, v060, stroke: 0.5pt + gray)
    line(v006, v606, v666, v066, close: true, stroke: 0.5pt + gray)
    line(v600, v606, stroke: 0.5pt + gray)
    line(v660, v666, stroke: 0.5pt + gray)
    line(v060, v066, stroke: 0.5pt + gray)
    """

    return f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    
    // P2: bottom face (z=0)
    content(prj(6,4,0), [$(P_2)$], anchor: "south")
    // P1: top face (z=6)
    content(prj(6,4,6), [$(P_1)$], anchor: "south")
    
    // C2 on P2
    let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 3 + 2.5 * calc.sin(d * 1deg), 0))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    content(prj(3,0.5,0), [$(C_2)$], anchor: "west")
    
    // C1' (projection) on P2
    let pts1_prime = range(0, 365, step: 5).map(d => prj(1.5 + 1.5 * calc.cos(d * 1deg), 2.5 + 1.5 * calc.sin(d * 1deg), 0))
    line(..pts1_prime, stroke: (dash: "dashed", paint: rgb("#16a34a")))
    content(prj(1.5, 1, 0), [$(C_1')$], anchor: "north")
    
    // C1 on P1
    let pts1 = range(0, 365, step: 5).map(d => prj(1.5 + 1.5 * calc.cos(d * 1deg), 2.5 + 1.5 * calc.sin(d * 1deg), 6))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    content(prj(1.5, 1, 6), [$(C_1)$], anchor: "north")
    
    let M = prj(1.5, 4, 6)
    let M_prime = prj(1.5, 4, 0)
    let N = prj(3, 5.5, 0)
    
    circle(M, radius: 1.5pt, fill: rgb("#16a34a"))
    content(M, [$M$], anchor: "south", padding: 3pt)
    
    circle(M_prime, radius: 1.5pt, fill: black)
    content(M_prime, [$M'$], anchor: "north", padding: 3pt)
    
    circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "south-west", padding: 3pt)
    
    line(M, M_prime, stroke: (dash: "dashed", paint: black))
    content(prj(1.5, 4, 3), [$h$], anchor: "east")
    line(M_prime, N, stroke: 0.5pt + rgb("#ea580c"))
    line(M, N, stroke: 1.2pt + rgb("#ea580c"))
  }})"""

def draw_method2_cetz(scale=0.35):
    prj_def = """let prj(x, y, z) = {
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }"""
    
    cube_def = """
    let v000 = prj(0,0,0); let v600 = prj(6,0,0); let v660 = prj(6,6,0); let v060 = prj(0,6,0)
    let v006 = prj(0,0,6); let v606 = prj(6,0,6); let v666 = prj(6,6,6); let v066 = prj(0,6,6)
    // Hidden edges
    line(v000, v600, stroke: (dash: "dashed", paint: gray))
    line(v000, v060, stroke: (dash: "dashed", paint: gray))
    line(v000, v006, stroke: (dash: "dashed", paint: gray))
    // Solid edges
    line(v600, v660, v060, stroke: 0.5pt + gray)
    line(v006, v606, v666, v066, close: true, stroke: 0.5pt + gray)
    line(v600, v606, stroke: 0.5pt + gray)
    line(v660, v666, stroke: 0.5pt + gray)
    line(v060, v066, stroke: 0.5pt + gray)
    """

    return f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    
    // P1: bottom face
    content(prj(6,4,0), [$(P_1)$], anchor: "south")
    // P2: right face (y=6)
    content(prj(4,6,6), [$(P_2)$], anchor: "south")
    
    // C1 on bottom (z=0)
    let pts1 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 3 + 2.5 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    content(prj(3,0.5,0), [$(C_1)$], anchor: "west")
    
    // C2 on right (y=6)
    let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2 * calc.cos(d * 1deg), 6, 3 + 2 * calc.sin(d * 1deg)))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    content(prj(3,6,5.5), [$(C_2)$], anchor: "east")
    
    let M = prj(1, 4.5, 0)
    // Projection of M(1,4.5,0) onto y=6 is (1,6,0)
    let M_p = prj(1, 6, 0)
    let J2 = prj(3, 6, 3)
    
    // Vector M_p -> J2 is (2, 0, 3). Length sqrt(13) = 3.6
    // R2 = 2. Direction = (2/3.6, 0, 3/3.6) = (0.55, 0, 0.83)
    // N on C2 farthest from M_p? Or closest? Let's pick a visible N
    let N = prj(3 - 2 * 2/3.6, 6, 3 - 2 * 3/3.6) // (1.89, 6, 1.33)
    
    circle(M, radius: 1.5pt, fill: rgb("#16a34a"))
    content(M, [$M$], anchor: "north", padding: 3pt)
    
    circle(M_p, radius: 1.5pt, fill: black)
    content(M_p, [$M_p$], anchor: "north-west", padding: 3pt)
    
    circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "south-east", padding: 3pt)
    
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(M, M_p, stroke: (dash: "dashed", paint: black))
    line(M_p, N, stroke: 0.5pt + rgb("#ea580c"))
    line(M, N, stroke: 1.2pt + rgb("#ea580c"))
    line(M_p, J2, stroke: (dash: "dashed", paint: gray))
    line(J2, N, stroke: (dash: "dashed", paint: gray))
  }})"""

def draw_universal_proof_cetz(scale=0.35):
    prj_def = """let prj(x, y, z) = {
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }"""
    
    cube_def = """
    let v000 = prj(0,0,0); let v600 = prj(6,0,0); let v660 = prj(6,6,0); let v060 = prj(0,6,0)
    let v006 = prj(0,0,6); let v606 = prj(6,0,6); let v666 = prj(6,6,6); let v066 = prj(0,6,6)
    // Hidden edges
    line(v000, v600, stroke: (dash: "dashed", paint: gray))
    line(v000, v060, stroke: (dash: "dashed", paint: gray))
    line(v000, v006, stroke: (dash: "dashed", paint: gray))
    // Solid edges
    line(v600, v660, v060, stroke: 0.5pt + gray)
    line(v006, v606, v666, v066, close: true, stroke: 0.5pt + gray)
    line(v600, v606, stroke: 0.5pt + gray)
    line(v660, v666, stroke: 0.5pt + gray)
    line(v060, v066, stroke: 0.5pt + gray)
    """

    return f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    
    // Slanted plane y+z=6
    line(prj(0,6,0), prj(6,6,0), prj(6,0,6), prj(0,0,6), close: true, fill: rgb("ca8a0420"), stroke: 0.5pt + rgb("ca8a04"))
    content(prj(5,3,3), [$(P_2)$], anchor: "south")
    
    // C2 on slanted plane. Center J2(3,3,3), R2=2.5
    // u = (1,0,0), v = (0, -1/sqrt(2), 1/sqrt(2))
    let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 3 - 1.767 * calc.sin(d * 1deg), 3 + 1.767 * calc.sin(d * 1deg)))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    content(prj(3, 3 - 1.767, 3 + 1.767), [$(C_2)$], anchor: "south-east")
    
    // M outside. Let M be on bottom face: (3, 1.5, 0)
    let M = prj(3, 1.5, 0)
    // Projection M' onto y+z=6 is (3, 3.75, 2.25)
    let M_prime = prj(3, 3.75, 2.25)
    let J2 = prj(3, 3, 3)
    
    // M' -> J2 is (0, -0.75, 0.75). Direction is (0, -1/sqrt(2), 1/sqrt(2))
    // N on C2 collinear with M' and J2
    let N = prj(3, 3 - 2.5 * 0.707, 3 + 2.5 * 0.707) // (3, 1.23, 4.76)
    
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "north", padding: 3pt)
    
    circle(M_prime, radius: 1.5pt, fill: black)
    content(M_prime, [$M'$], anchor: "north-west", padding: 3pt)
    
    circle(M, radius: 1.5pt, fill: rgb("#16a34a"))
    content(M, [$M$], anchor: "north", padding: 3pt)
    
    circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "south-east", padding: 3pt)
    
    line(M, M_prime, stroke: (dash: "dashed", paint: rgb("#16a34a")))
    line(M_prime, J2, stroke: (dash: "dashed", paint: gray))
    line(J2, N, stroke: (dash: "dashed", paint: gray))
    line(M_prime, N, stroke: 0.5pt + rgb("#ea580c"))
    line(M, N, stroke: 1.2pt + rgb("#ea580c"))
    line(M, J2, stroke: 0.5pt + gray)
  }})"""

def draw_theory_cetz(config_type, scale=0.33):
    prj_def = """let prj(x, y, z) = {
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }"""
    
    cube_def = """
    let v000 = prj(0,0,0); let v600 = prj(6,0,0); let v660 = prj(6,6,0); let v060 = prj(0,6,0)
    let v006 = prj(0,0,6); let v606 = prj(6,0,6); let v666 = prj(6,6,6); let v066 = prj(0,6,6)
    // Hidden edges
    line(v000, v600, stroke: (dash: "dashed", paint: gray))
    line(v000, v060, stroke: (dash: "dashed", paint: gray))
    line(v000, v006, stroke: (dash: "dashed", paint: gray))
    // Solid edges
    line(v600, v660, v060, stroke: 0.5pt + gray)
    line(v006, v606, v666, v066, close: true, stroke: 0.5pt + gray)
    line(v600, v606, stroke: 0.5pt + gray)
    line(v660, v666, stroke: 0.5pt + gray)
    line(v060, v066, stroke: 0.5pt + gray)
    """

    if config_type == "1.1":
        return f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    let p1 = prj(-5, -5, 0)
    let p2 = prj(5, -5, 0)
    let p3 = prj(5, 5, 0)
    let p4 = prj(-5, 5, 0)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe30"), stroke: 0.5pt + rgb("#0284c7"))
    let pts1 = range(0, 365, step: 5).map(d => prj(4 * calc.cos(d * 1deg), 4 * calc.sin(d * 1deg), 0))
    let pts2 = range(0, 365, step: 5).map(d => prj(2.3 * calc.cos(d * 1deg), 2.3 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    circle(prj(0,0,0), radius: 1pt, fill: black)
  }})"""
  
    elif config_type == "1.2":
        return f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    let p1 = prj(-4, -4, 0)
    let p2 = prj(7, -4, 0)
    let p3 = prj(7, 6, 0)
    let p4 = prj(-4, 6, 0)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe30"), stroke: 0.5pt + rgb("#0284c7"))
    let pts1 = range(0, 365, step: 5).map(d => prj(3 * calc.cos(d * 1deg), 3 * calc.sin(d * 1deg), 0))
    let pts2 = range(0, 365, step: 5).map(d => prj(4 + 2 * calc.cos(d * 1deg), 3 + 2 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    circle(prj(0,0,0), radius: 1pt, fill: black)
    circle(prj(4,3,0), radius: 1pt, fill: black)
    line(prj(0,0,0), prj(4,3,0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
  }})"""
  
    elif config_type == "2.1":
        return f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    line(prj(-5,-5,0), prj(5,-5,0), prj(5,5,0), prj(-5,5,0), close: true, fill: rgb("e0f2fe20"), stroke: 0.5pt + rgb("#0284c7"))
    let pts1 = range(0, 365, step: 5).map(d => prj(4 * calc.cos(d * 1deg), 4 * calc.sin(d * 1deg), 0))
    let pts2 = range(0, 365, step: 5).map(d => prj(2.5 * calc.cos(d * 1deg), 2.5 * calc.sin(d * 1deg), 5))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    line(prj(-5,-5,5), prj(5,-5,5), prj(5,5,5), prj(-5,5,5), close: true, fill: rgb("fef08a20"), stroke: 0.5pt + rgb("#ca8a04"))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    line(prj(0,0,0), prj(0,0,5), stroke: (dash: "dashed", paint: gray))
    circle(prj(0,0,0), radius: 1pt, fill: black)
    circle(prj(0,0,5), radius: 1pt, fill: black)
  }})"""
  
    elif config_type == "2.2":
        return f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    line(prj(-5,-5,0), prj(6,-5,0), prj(6,5,0), prj(-5,5,0), close: true, fill: rgb("e0f2fe20"), stroke: 0.5pt + rgb("#0284c7"))
    let pts1 = range(0, 365, step: 5).map(d => prj(3.5 * calc.cos(d * 1deg), 3.5 * calc.sin(d * 1deg), 0))
    let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 2 + 2.5 * calc.sin(d * 1deg), 5))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    line(prj(-2,-3,5), prj(7,-3,5), prj(7,6,5), prj(-2,6,5), close: true, fill: rgb("fef08a20"), stroke: 0.5pt + rgb("#ca8a04"))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    line(prj(0,0,0), prj(3,2,5), stroke: (dash: "dashed", paint: gray))
    circle(prj(0,0,0), radius: 1pt, fill: black)
    circle(prj(3,2,5), radius: 1pt, fill: black)
  }})"""
  
    elif config_type == "3.1": # Vuông góc lệch trục
        return f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    // C1 on bottom (z=0)
    let pts1 = range(0, 365, step: 5).map(d => prj(2 + 2 * calc.cos(d * 1deg), 3 + 2 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    // C2 on right (y=6)
    let pts2 = range(0, 365, step: 5).map(d => prj(4 + 1.5 * calc.cos(d * 1deg), 6, 3 + 1.5 * calc.sin(d * 1deg)))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    
    circle(prj(2,3,0), radius: 1.5pt, fill: black)
    circle(prj(4,6,3), radius: 1.5pt, fill: black)
    // Projections onto intersection
    line(prj(2,3,0), prj(2,6,0), stroke: (dash: "dashed", paint: gray))
    line(prj(4,6,3), prj(4,6,0), stroke: (dash: "dashed", paint: gray))
  }})"""
  
    elif config_type == "3.2": # Vuông góc đồng trục
        return f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    // C1 on bottom (z=0)
    let pts1 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 3 + 2.5 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    // C2 on right (y=6)
    let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2 * calc.cos(d * 1deg), 6, 3 + 2 * calc.sin(d * 1deg)))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    
    circle(prj(3,3,0), radius: 1.5pt, fill: black)
    circle(prj(3,6,3), radius: 1.5pt, fill: black)
    // Common projection
    line(prj(3,3,0), prj(3,6,0), stroke: (dash: "dashed", paint: gray))
    line(prj(3,6,3), prj(3,6,0), stroke: (dash: "dashed", paint: gray))
    circle(prj(3,6,0), radius: 1.5pt, fill: gray)
  }})"""

    elif config_type == "4.1": # Nghiêng đồng trục (C2 slanted plane)
        return f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    // Slanted plane from (6,0,0) to (0,6,6)
    line(prj(6,0,0), prj(6,6,0), prj(0,6,6), prj(0,0,6), close: true, fill: rgb("ca8a0420"), stroke: 0.5pt + rgb("ca8a04"))
    
    // C1 on bottom (z=0)
    let pts1 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 3 + 2.5 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    
    // C2 on slanted plane
    // Center is (3,3,3)
    let r2 = 2.5
    // Parameterization on plane x+z=6
    // x = 3 - r2/sqrt(2) * sin t
    // y = 3 + r2 * cos t
    // z = 3 + r2/sqrt(2) * sin t
    let pts2 = range(0, 365, step: 5).map(d => prj(3 - 1.767 * calc.sin(d * 1deg), 3 + 2.5 * calc.cos(d * 1deg), 3 + 1.767 * calc.sin(d * 1deg)))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    
    circle(prj(3,3,0), radius: 1.5pt, fill: black)
    circle(prj(3,3,3), radius: 1.5pt, fill: black)
    line(prj(3,3,0), prj(3,3,3), stroke: (dash: "dashed", paint: gray))
  }})"""

    elif config_type == "4.2": # Nghiêng lệch tâm
        return f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    // Slanted plane from (6,0,0) to (0,6,6)
    line(prj(6,0,0), prj(6,6,0), prj(0,6,6), prj(0,0,6), close: true, fill: rgb("ca8a0420"), stroke: 0.5pt + rgb("ca8a04"))
    
    // C1 on bottom (z=0)
    let pts1 = range(0, 365, step: 5).map(d => prj(1.5 + 1.5 * calc.cos(d * 1deg), 3 + 1.5 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    
    // C2 on slanted plane
    // Center is (4.5, 4, 1.5)
    let r2 = 1.5
    let pts2 = range(0, 365, step: 5).map(d => prj(4.5 - 1.06 * calc.sin(d * 1deg), 4 + 1.5 * calc.cos(d * 1deg), 1.5 + 1.06 * calc.sin(d * 1deg)))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    
    circle(prj(1.5,3,0), radius: 1.5pt, fill: black)
    circle(prj(4.5,4,1.5), radius: 1.5pt, fill: black)
    // Project J2 onto z=0
    line(prj(4.5,4,1.5), prj(4.5,4,0), stroke: (dash: "dashed", paint: gray))
  }})"""

    return ""


def project_point_to_plane(pt, plane):
    x, y, z = pt
    A, B, C, D = plane
    len_sq = A**2 + B**2 + C**2
    t = -(A*x + B*y + C*z + D) / len_sq
    return (x + A*t, y + B*t, z + C*t)

def draw_2_circles_cetz(J1, R1, P1, J2, R2, P2, M_pt=None, N_pt=None, project_c2=False, scale=0.33):
    u1, v1 = get_uv(*P1[:3])
    u2, v2 = get_uv(*P2[:3])
    code = f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    let prj(x, y, z) = {{
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }}
    
    let get_pt(J, R, u, v, deg) = {{
      let rad = deg * 1deg
      (J.at(0) + R * calc.cos(rad) * u.at(0) + R * calc.sin(rad) * v.at(0),
       J.at(1) + R * calc.cos(rad) * u.at(1) + R * calc.sin(rad) * v.at(1),
       J.at(2) + R * calc.cos(rad) * u.at(2) + R * calc.sin(rad) * v.at(2))
    }}
    
    let J1 = ({J1[0]}, {J1[1]}, {J1[2]})
    let J2 = ({J2[0]}, {J2[1]}, {J2[2]})
    let u1 = ({u1[0]}, {u1[1]}, {u1[2]})
    let v1 = ({v1[0]}, {v1[1]}, {v1[2]})
    let u2 = ({u2[0]}, {u2[1]}, {u2[2]})
    let v2 = ({v2[0]}, {v2[1]}, {v2[2]})
    let R1 = {R1}
    let R2 = {R2}
    
    // Plane 1
    let pw1 = {max(R1 * 1.6, 6.0)}
    let p1_1 = prj(J1.at(0) - pw1*u1.at(0) - pw1*v1.at(0), J1.at(1) - pw1*u1.at(1) - pw1*v1.at(1), J1.at(2) - pw1*u1.at(2) - pw1*v1.at(2))
    let p1_2 = prj(J1.at(0) + pw1*u1.at(0) - pw1*v1.at(0), J1.at(1) + pw1*u1.at(1) - pw1*v1.at(1), J1.at(2) + pw1*u1.at(2) - pw1*v1.at(2))
    let p1_3 = prj(J1.at(0) + pw1*u1.at(0) + pw1*v1.at(0), J1.at(1) + pw1*u1.at(1) + pw1*v1.at(1), J1.at(2) + pw1*u1.at(2) + pw1*v1.at(2))
    let p1_4 = prj(J1.at(0) - pw1*u1.at(0) + pw1*v1.at(0), J1.at(1) - pw1*u1.at(1) + pw1*v1.at(1), J1.at(2) - pw1*u1.at(2) + pw1*v1.at(2))
    line(p1_1, p1_2, p1_3, p1_4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // C1
    let pts1 = range(0, 365, step: 5).map(d => prj(..get_pt(J1, R1, u1, v1, d)))
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    circle(prj(..J1), radius: 1.5pt, fill: black)
    content(prj(..J1), [$J_1$], anchor: "north", padding: 3pt)
    
    // Plane 2
    if {"true" if P1 != P2 else "false"} {{
      let pw2 = {max(R2 * 1.6, 6.0)}
      let p2_1 = prj(J2.at(0) - pw2*u2.at(0) - pw2*v2.at(0), J2.at(1) - pw2*u2.at(1) - pw2*v2.at(1), J2.at(2) - pw2*u2.at(2) - pw2*v2.at(2))
      let p2_2 = prj(J2.at(0) + pw2*u2.at(0) - pw2*v2.at(0), J2.at(1) + pw2*u2.at(1) - pw2*v2.at(1), J2.at(2) + pw2*u2.at(2) - pw2*v2.at(2))
      let p2_3 = prj(J2.at(0) + pw2*u2.at(0) + pw2*v2.at(0), J2.at(1) + pw2*u2.at(1) + pw2*v2.at(1), J2.at(2) + pw2*u2.at(2) + pw2*v2.at(2))
      let p2_4 = prj(J2.at(0) - pw2*u2.at(0) + pw2*v2.at(0), J2.at(1) - pw2*u2.at(1) + pw2*v2.at(1), J2.at(2) - pw2*u2.at(2) + pw2*v2.at(2))
      line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    }}
    
    // C2
    let pts2 = range(0, 365, step: 5).map(d => prj(..get_pt(J2, R2, u2, v2, d)))
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    circle(prj(..J2), radius: 1.5pt, fill: black)
    content(prj(..J2), [$J_2$], anchor: "south", padding: 3pt)
    
    line(prj(..J1), prj(..J2), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    """

    if M_pt and N_pt:
        code += f"""
    let M = prj({M_pt[0]}, {M_pt[1]}, {M_pt[2]})
    let N = prj({N_pt[0]}, {N_pt[1]}, {N_pt[2]})
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "north", padding: 3pt)
    content(N, [$N$], anchor: "south", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#ea580c"))
    """
    if project_c2:
        code += f"""
    let n1 = ({P1[0]}, {P1[1]}, {P1[2]})
    let d1 = {P1[3]}
    let n1_len = calc.sqrt(n1.at(0)*n1.at(0) + n1.at(1)*n1.at(1) + n1.at(2)*n1.at(2))
    let proj_onto_p1(pt) = {{
      let t = -(n1.at(0)*pt.at(0) + n1.at(1)*pt.at(1) + n1.at(2)*pt.at(2) + d1) / (n1_len * n1_len)
      (pt.at(0) + t*n1.at(0), pt.at(1) + t*n1.at(1), pt.at(2) + t*n1.at(2))
    }}
    let pts2_proj = range(0, 365, step: 5).map(d => prj(..proj_onto_p1(get_pt(J2, R2, u2, v2, d))))
    line(..pts2_proj, stroke: (dash: "dashed", paint: rgb("#ef4444"), thickness: 1pt))
    let J2_proj = proj_onto_p1(J2)
    circle(prj(..J2_proj), radius: 1.5pt, fill: rgb("#ef4444"))
    content(prj(..J2_proj), [$J_2'$], anchor: "north", padding: 3pt)
    line(prj(..J2), prj(..J2_proj), stroke: (dash: "dotted", paint: rgb("#ef4444")))
    line(prj(..J1), prj(..J2_proj), stroke: (dash: "dashed", paint: rgb("#0284c7")))
    """
    code += "\n  })"
    return code

def draw_circle_sphere_cetz(J, R, P, I, R_S, M_pt=None, N_pt=None, scale=0.3):
    A, B, C, D = P
    u, v = get_uv(A, B, C)
    
    code = f"""cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    let prj(x, y, z) = {{
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }}
    let get_pt(J, R, u, v, deg) = {{
      let rad = deg * 1deg
      let x = J.at(0) + R * calc.cos(rad) * u.at(0) + R * calc.sin(rad) * v.at(0)
      let y = J.at(1) + R * calc.cos(rad) * u.at(1) + R * calc.sin(rad) * v.at(1)
      let z = J.at(2) + R * calc.cos(rad) * u.at(2) + R * calc.sin(rad) * v.at(2)
      (x, y, z)
    }}
    
    let u = ({u[0]}, {u[1]}, {u[2]})
    let v = ({v[0]}, {v[1]}, {v[2]})
    let J = ({J[0]}, {J[1]}, {J[2]})
    
    let pts = range(0, 365, step: 5).map(d => prj(..get_pt(J, {R}, u, v, d)))
    
    // Draw the sphere
    circle(prj({I[0]}, {I[1]}, {I[2]}), radius: {R_S} * 0.3cm, fill: rgb("e0f2fe30"), stroke: 0.5pt + rgb("#0284c7"))
    circle(prj({I[0]}, {I[1]}, {I[2]}), radius: 1.5pt, fill: rgb("#0284c7"))
    content(prj({I[0]}, {I[1]}, {I[2]}), [$I$], anchor: "north", padding: 3pt)
    
    // Draw the circle
    line(..pts, stroke: 1pt + rgb("#16a34a"))
    circle(prj(..J), radius: 1.5pt, fill: rgb("#16a34a"))
    content(prj(..J), [$J$], anchor: "south", padding: 3pt)
"""
    
    if M_pt and N_pt:
        code += f"""
    let M = prj({M_pt[0]}, {M_pt[1]}, {M_pt[2]})
    let N = prj({N_pt[0]}, {N_pt[1]}, {N_pt[2]})
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "north", padding: 3pt)
    content(N, [$N$], anchor: "south", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#ea580c"))
"""
    code += "\n  })"
    return code

def generate_mod1_1():
    stmt = """(Cấu hình 1.1 - Đồng phẳng, đồng tâm) Trong thiết kế của một sân vận động điền kinh phẳng ngang $(O x y): z=0$, đường chạy vòng ngoài $(C_1)$ và đường chạy vòng trong $(C_2)$ là hai đường tròn đồng phẳng, có cùng tâm tại gốc tọa độ $O(0;0;0)$. Đường chạy ngoài $(C_1)$ có phương trình $x^2 + y^2 = 100$, đường chạy trong $(C_2)$ có phương trình $x^2 + y^2 = 36$. Tìm khoảng cách ngắn nhất giữa một điểm $M$ chạy trên $(C_1)$ và một điểm $N$ chạy trên $(C_2)$?"""
    sol = """#ppgiai[
  - $(C_1)$ tâm $J_1(0; 0; 0)$, bán kính $R_1 = 10$, mặt phẳng $z=0$.
  - $(C_2)$ tâm $J_2(0; 0; 0)$, bán kính $R_2 = 6$, mặt phẳng $z=0$.
]
#note[
  *Lưu ý sư phạm:* Với hai đường tròn đồng tâm nằm trên cùng một mặt phẳng, khoảng cách từ mọi điểm trên đường chạy này đến điểm gần nhất trên đường chạy kia là không đổi và bằng hiệu hai bán kính.
]
*Bước 1:* Do hai đường tròn hoàn toàn đồng phẳng và đồng tâm tại gốc tọa độ $O$.
Khoảng cách cực tiểu là:
$ M N_(min) = |R_1 - R_2| = |10 - 6| = 4. $"""
    fig = draw_2_circles_cetz((0,0,0), 10, (0,0,1,0), (0,0,0), 6, (0,0,1,0), (10,0,0), (6,0,0), scale=0.33)
    return stmt, "[4]", sol, fig

def generate_mod1_2():
    stmt = """(Cấu hình 1.2 - Đồng phẳng, lệch tâm rời nhau) Hai thiết bị tưới nước tự động xoay tròn tạo ra hai vùng làm ướt $(C_1)$ và $(C_2)$ trên mặt đất phẳng $z=0$. Vùng thứ nhất $(C_1)$ có tâm $J_1(0;0;0)$, bán kính $R_1=4$. Vùng thứ hai $(C_2)$ có tâm $J_2(9;12;0)$, bán kính $R_2=6$. Một sợi cáp thẳng nối một điểm trên viền $(C_1)$ với một điểm trên viền $(C_2)$. Tìm độ dài ngắn nhất của sợi cáp?"""
    sol = """#ppgiai[
  - $(C_1)$ có tâm $J_1(0; 0; 0)$, bán kính $R_1 = 4$, nằm trên $z=0$.
  - $(C_2)$ có tâm $J_2(9; 12; 0)$, bán kính $R_2 = 6$, nằm trên $z=0$.
]
#note[
  *Lưu ý sư phạm:* Khi hai đường tròn đồng phẳng và không lồng nhau, khoảng cách ngắn nhất nằm trên đường nối hai tâm và bằng khoảng cách nối tâm trừ đi tổng hai bán kính.
]
*Bước 1:* Tính khoảng cách giữa hai tâm:
$ J_1 J_2 = sqrt(9^2 + 12^2) = 15. $
*Bước 2:* So sánh khoảng cách tâm với tổng bán kính:
$ J_1 J_2 = 15 > R_1 + R_2 = 10. $
Do đó, hai vùng tròn làm ướt nằm rời ngoài nhau.
*Bước 3:* Độ dài ngắn nhất của sợi cáp đạt được khi $M, N$ nằm trên đoạn thẳng nối tâm $J_1 J_2$:
$ M N_(min) = J_1 J_2 - R_1 - R_2 = 15 - 4 - 6 = 5. $"""
    u = (9/15, 12/15, 0)
    M = (4*u[0], 4*u[1], 0)
    N = (9 - 6*u[0], 12 - 6*u[1], 0)
    fig = draw_2_circles_cetz((0,0,0), 4, (0,0,1,0), (9,12,0), 6, (0,0,1,0), M, N, scale=0.33)
    return stmt, "[5]", sol, fig

def generate_mod1_3():
    stmt = """(Cấu hình 1.3 - Đồng phẳng, lệch tâm cắt nhau) Hai vòng trang trí tròn được đặt trên một bức tường phẳng $z=0$. Vòng tròn thứ nhất $(C_1)$ có tâm $J_1(0;0;0)$, bán kính $R_1=5$. Vòng tròn thứ hai $(C_2)$ có tâm $J_2(6;8;0)$, bán kính $R_2=7$. Tìm khoảng cách lớn nhất giữa một điểm $M$ trên $(C_1)$ và một điểm $N$ trên $(C_2)$?"""
    sol = """#ppgiai[
  - $(C_1)$ tâm $J_1(0;0;0)$, $R_1=5$.
  - $(C_2)$ tâm $J_2(6;8;0)$, $R_2=7$.
]
#note[
  *Lưu ý sư phạm:* Hai đường tròn cắt nhau nên khoảng cách nhỏ nhất $M N_(min) = 0$ tại các giao điểm. Khoảng cách lớn nhất đạt được khi $M, N$ nằm ở hai đầu xa nhất trên đường nối tâm: $M N_(max) = J_1 J_2 + R_1 + R_2$.
]
*Bước 1:* Tính khoảng cách nối hai tâm:
$ J_1 J_2 = sqrt(6^2 + 8^2) = 10. $
*Bước 2:* So sánh điều kiện: $|R_1 - R_2| = 2 < J_1 J_2 = 10 < R_1 + R_2 = 12$. Hai đường tròn cắt nhau tại hai điểm (cực tiểu bằng 0).
*Bước 3:* Khoảng cách cực đại đạt được khi hai điểm nằm thẳng hàng với hai tâm và ở phía đối diện xa nhất:
$ M N_(max) = J_1 J_2 + R_1 + R_2 = 10 + 5 + 7 = 22. $"""
    u = (6/10, 8/10, 0)
    M = (-5*u[0], -5*u[1], 0)
    N = (6 + 7*u[0], 8 + 7*u[1], 0)
    fig = draw_2_circles_cetz((0,0,0), 5, (0,0,1,0), (6,8,0), 7, (0,0,1,0), M, N, scale=0.3)
    return stmt, "[22]", sol, fig

def generate_mod2_1():
    stmt = """(Cấu hình 2.1 - Song song, đồng trục) Một bộ truyền động cơ khí gồm hai đĩa quay tròn $(C_1)$ và $(C_2)$ song song với nhau. Đĩa $(C_1)$ nằm trên mặt đáy $z=0$, có tâm $J_1(0;0;0)$, bán kính $R_1 = 8$. Đĩa $(C_2)$ nằm trên mặt phẳng $z=12$, có tâm $J_2(0;0;12)$, bán kính $R_2 = 3$. Tìm khoảng cách ngắn nhất giữa hai điểm trên viền của hai đĩa quay?"""
    sol = """#ppgiai[
  - $(C_1)$ tâm $J_1(0; 0; 0)$, bán kính $R_1 = 8$, mặt phẳng $z=0$.
  - $(C_2)$ tâm $J_2(0; 0; 12)$, bán kính $R_2 = 3$, mặt phẳng $z=12$.
  - Khoảng cách thẳng đứng giữa hai mặt phẳng là $h = 12$.
]
#note[
  *Lưu ý sư phạm:* Bài toán song song được đưa về hình học phẳng bằng cách chiếu trực giao. Do hai đường tròn đồng trục, hình chiếu của tâm này trùng với tâm kia, khoảng cách ngang nhỏ nhất là $|R_1 - R_2|$.
]
*Bước 1:* Chiếu $(C_2)$ xuống mặt phẳng $z=0$ được đường tròn hình chiếu $(C_2')$ có tâm $J_1(0;0;0)$, bán kính $R_2 = 3$.
Khoảng cách ngang cực tiểu giữa $(C_1)$ và $(C_2')$ là:
$ d_("ngang") = |R_1 - R_2| = |8 - 3| = 5. $
*Bước 2:* Khoảng cách không gian cực tiểu được tính bằng Pytago với khoảng cách đứng $h = 12$:
$ M N_(min) = sqrt(h^2 + d_("ngang")^2) = sqrt(12^2 + 5^2) = 13. $"""
    fig = draw_2_circles_cetz((0,0,0), 8, (0,0,1,0), (0,0,12), 3, (0,0,1,-12), (8,0,0), (3,0,12), scale=0.33)
    return stmt, "[13]", sol, fig

def generate_mod2_2():
    stmt = """(Cấu hình 2.2 - Song song, lệch trục chiếu ngoài) Hai Flycam bay tuần tra theo hai quỹ đạo tròn trên hai mặt phẳng nằm ngang song song. Flycam 1 bay trên mặt phẳng $z=0$ có tâm quỹ đạo $J_1(0;0;0)$, bán kính $R_1=6$. Flycam 2 bay trên mặt phẳng $z=9$ có tâm quỹ đạo $J_2(12;9;9)$, bán kính $R_2=4$. Tìm khoảng cách ngắn nhất giữa hai Flycam trong quá trình bay?"""
    sol = """#ppgiai[
  - $(C_1)$ tâm $J_1(0; 0; 0)$, $R_1=6$, trên $z=0$.
  - $(C_2)$ tâm $J_2(12; 9; 9)$, $R_2=4$, trên $z=9$. Khoảng cách hai mặt phẳng là $h = 9$.
]
#note[
  *Lưu ý sư phạm:* Khi hình chiếu của tâm thứ hai $J_2'$ nằm ngoài đường tròn thứ nhất và hai vùng tròn chiếu không chồng lấn lên nhau, khoảng cách ngang nhỏ nhất là $J_1 J_2' - R_1 - R_2$.
]
*Bước 1:* Hình chiếu vuông góc của tâm $J_2$ xuống mặt phẳng $z=0$ là $J_2'(12; 9; 0)$. Khoảng cách hai tâm trên mặt phẳng chiếu:
$ J_1 J_2' = sqrt(12^2 + 9^2) = 15. $
*Bước 2:* Vì $J_1 J_2' = 15 > R_1 + R_2 = 10$, hình chiếu của $(C_2)$ nằm ngoài hoàn toàn $(C_1)$. Khoảng cách ngang tối thiểu là:
$ d_("ngang") = J_1 J_2' - R_1 - R_2 = 15 - 6 - 4 = 5. $
*Bước 3:* Áp dụng công thức Pytago không gian cho khoảng cách cực tiểu:
$ M N_(min) = sqrt(h^2 + d_("ngang")^2) = sqrt(9^2 + 5^2) = sqrt(106). $"""
    u = (12/15, 9/15, 0)
    M = (6*u[0], 6*u[1], 0)
    N = (12 - 4*u[0], 9 - 4*u[1], 9)
    fig = draw_2_circles_cetz((0,0,0), 6, (0,0,1,0), (12,9,9), 4, (0,0,1,-9), M, N, scale=0.33, project_c2=True)
    return stmt, "[$sqrt(106)$]", sol, fig

def generate_mod2_3():
    stmt = """(Cấu hình 2.3 - Song song, lệch trục chiếu cắt nhau - BẪY) Hai bộ phận cảm biến chuyển động trên hai quỹ đạo tròn song song trong một thiết bị cơ khí. Quỹ đạo $(C_1)$ nằm trên mặt phẳng $z=0$ có tâm $J_1(0;0;0)$, bán kính $R_1=5$. Quỹ đạo $(C_2)$ nằm trên mặt phẳng $z=8$ có tâm $J_2(3;0;8)$, bán kính $R_2=2$. Tính khoảng cách gần nhất giữa hai bộ phận cảm biến trong quá trình hoạt động?"""
    sol = """#ppgiai[
  - $(C_1)$ tâm $J_1(0;0;0)$, $R_1=5$, trên $z=0$.
  - $(C_2)$ tâm $J_2(3;0;8)$, $R_2=2$, trên $z=8$. Khoảng cách hai mặt phẳng là $h=8$.
]
#note[
  *Cảnh báo bẫy:* Học sinh rất dễ áp dụng nhầm công thức $d_("ngang") = |J_1 J_2' - R_1 - R_2| = |3 - 5 - 2| = 4$ dẫn đến $M N = sqrt(8^2 + 4^2) = 4 sqrt(5) approx 8.94$. Thực tế, do hình chiếu $(C_2')$ cắt và tiếp xúc trong với $(C_1)$, tồn tại vị trí mà hình chiếu ngang bằng $0$!
]
*Bước 1:* Chiếu $(C_2)$ xuống mặt phẳng $z=0$ được đường tròn $(C_2')$ tâm $J_2'(3;0;0)$, bán kính $R_2 = 2$.
Khoảng cách giữa hai tâm chiếu là $J_1 J_2' = 3$.
*Bước 2:* Nhận xét vị trí tương đối giữa $(C_1)$ và $(C_2')$:
Ta thấy: $J_1 J_2' = 3 = R_1 - R_2 = 5 - 2$.
Do đó, đường tròn chiếu $(C_2')$ tiếp xúc trong với đường tròn $(C_1)$ tại điểm $I(5;0;0)$.
*Bước 3:* Tại điểm tiếp xúc trong $I(5;0;0)$, khoảng cách hình chiếu ngang giữa hai đường tròn bằng $0$.
Khi đó, khoảng cách cực tiểu giữa hai điểm trong không gian đúng bằng chiều cao đứng thẳng:
$ M N_(min) = h = 8. $
(Đạt được khi $M(5;0;0)$ và $N(5;0;8)$)."""
    fig = draw_2_circles_cetz((0,0,0), 5, (0,0,1,0), (3,0,8), 2, (0,0,1,-8), (5,0,0), (5,0,8), scale=0.33, project_c2=True)
    return stmt, "[8]", sol, fig

def generate_mod3_1():
    stmt = """(Cấu hình 3.1 - Hai mặt phẳng vuông góc, đối xứng) Bệ đỡ nằm ngang là đường tròn $(C_1)$ nằm trên mặt phẳng $(O x y): z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=3$. Vòng quay đứng trang trí là đường tròn $(C_2)$ nằm trên mặt phẳng $(O y z): x=0$, tâm $J_2(0;6;8)$, bán kính $R_2=4$. Tìm khoảng cách ngắn nhất giữa bệ đỡ và vòng quay đứng?"""
    sol = """#ppgiai[
  - $(C_1)$ nằm trên mặt phẳng $z=0$, tâm $J_1(0; 0; 0)$, bán kính $R_1 = 3$.
  - $(C_2)$ nằm trên mặt phẳng $x=0$, tâm $J_2(0; 6; 8)$, bán kính $R_2 = 4$.
]
#note[
  *Phân tích sư phạm chuyên sâu về hướng chiếu (Câu hỏi cốt lõi của bài toán):*
  
  *Câu hỏi:* Tại sau phải lấy điểm $M$ của đường tròn $(C_1)$ chiếu qua mặt phẳng $(P_2): x=0$ chứa $(C_2)$ mà không làm ngược lại (chiếu $N in (C_2)$ về mặt phẳng $(P_1): z=0$ chứa $(C_1)$)?
  
  *Trả lời:*
  Về mặt toán học hình học thuần túy, cả hai hướng chiếu là hoàn toàn tương đương và luôn dẫn đến cùng một kết quả khoảng cách ngắn nhất. Tuy nhiên, về mặt biến đổi đại số và tính toán, hai hướng chiếu này có độ phức tạp chênh lệch rất lớn:
  
  - *Hướng thứ nhất (Chiếu $M in (C_1)$ sang mặt phẳng của $(C_2)$):*
    Ta tham số hóa điểm $M(3 cos t, 3 sin t, 0) in (C_1)$. Hình chiếu vuông góc của $M$ lên mặt phẳng $x=0$ là $M_p(0, 3 sin t, 0)$.
    Tọa độ của $M_p$ chỉ phụ thuộc vào duy nhất một hàm lượng giác là $sin t$. Bằng cách đặt ẩn phụ $y = 3 sin t$ (với $y in [-3; 3]$), ta có $9 cos^2 t = 9 - y^2$. Hàm số bình phương khoảng cách cần khảo sát trở thành một hàm số đa thức một biến cực kỳ sạch sẽ và đơn giản:
    $ g(y) = 125 - 12 y - 8sqrt((y-6)^2 + 64) $
    Đạo hàm và bảng biến thiên của hàm này được thiết lập một cách trơn tru, không gặp vấp váp đại số nào.
    
  - *Hướng thứ hai (Chiếu $N in (C_2)$ ngược lại sang mặt phẳng của $(C_1)$):*
    Ta tham số hóa điểm $N(0, 6 + 4 cos u, 8 + 4 sin u) in (C_2)$. Hình chiếu vuông góc của $N$ lên mặt phẳng $z=0$ là $N_p(0, 6 + 4 cos u, 0)$.
    Khoảng cách đứng là $N N_p = |8 + 4 sin u|$, khoảng cách ngang là $d(N_p, (C_1)) = ||6 + 4 cos u| - 3| = |3 + 4 cos u|$ (vì $6 + 4 cos u >= 2 > 0$).
    Bình phương khoảng cách không gian khi đó là:
    $ f(u) = N N_p^2 + d(N_p, (C_1))^2 = (8 + 4 sin u)^2 + (3 + 4 cos u)^2 $
    $ = 89 + 8(8 sin u + 3 cos u) $
    Mặc dù ta có thể tìm giá trị nhỏ nhất của $f(u)$ bằng bất đẳng thức Cauchy-Schwarz hoặc lượng giác hóa ($8 sin u + 3 cos u >= -sqrt(8^2+3^2) = -sqrt(73) => f(u) >= 89 - 8sqrt(73)$), nhưng việc xuất hiện đồng thời cả $sin u$ và $cos u$, kết hợp với việc phải phân tích dấu trị tuyệt đối kép đối với $||6 + 4 cos u| - 3|$ trong các cấu hình lệch trục tổng quát khác sẽ làm phép toán trở nên rối rắm và khó kiểm soát hơn nhiều.
    
  *Kết luận:* Do đó, ta luôn ưu tiên hướng chiếu nào giúp thu được điểm chiếu có tọa độ đơn giản nhất (chứa ít biến số lượng giác nhất), giúp việc đặt ẩn phụ chuyển hóa từ hàm lượng giác sang hàm đa thức trở nên dễ dàng nhất!
]
*Bước 1 (Tham số hóa điểm $M$):*
Lấy điểm $M(3 cos t, 3 sin t, 0) in (C_1)$ trên mặt phẳng $z=0$ với $t in [0; 2 pi)$.

*Bước 2 (Chiếu vuông góc lên mặt phẳng thứ hai):*
Chiếu vuông góc điểm $M$ lên mặt phẳng $x=0$ (chứa đường tròn $C_2$), ta thu được hình chiếu:
$ M_p(0, 3 sin t, 0) $
Khoảng cách đứng là: $M M_p = |3 cos t|$.

*Bước 3 (Phân rã khoảng cách Pytago):*
Tam giác $M M_p N$ vuông tại $M_p$ nên:
$ M N = sqrt(M M_p^2 + M_p N^2) $
Khoảng cách phẳng từ $M_p$ đến tâm $J_2(0; 6; 8)$ là:
$ M_p J_2 = sqrt((0-0)^2 + (3 sin t - 6)^2 + (0 - 8)^2) = sqrt((3 sin t - 6)^2 + 64) $
Khoảng cách $M_p N$ ngắn nhất khi $N$ nằm trên đoạn thẳng nối $M_p$ và tâm $J_2$:
$ M_p N_(min) = |M_p J_2 - R_2| = sqrt((3 sin t - 6)^2 + 64) - 4 $

*Bước 4 (Thiết lập và khảo sát hàm số một biến):*
Bình phương khoảng cách ngắn nhất từ $M$ đến đường tròn $(C_2)$ là:
$ f(t) = M M_p^2 + (M_p N_(min))^2 = 9 cos^2 t + (sqrt((3 sin t - 6)^2 + 64) - 4)^2 $
Đặt $y = 3 sin t$ với $y in [-3; 3]$, ta có $9 cos^2 t = 9 - y^2$. Hàm số theo biến $y$ là:
$ g(y) = 9 - y^2 + (sqrt((y-6)^2 + 64) - 4)^2 $
$ = 9 - y^2 + (y-6)^2 + 64 - 8sqrt((y-6)^2 + 64) + 16 $
$ = 125 - 12y - 8sqrt((y-6)^2 + 64) $

*Bước 5 (Tìm cực tiểu bằng đạo hàm):*
Khảo sát đạo hàm của $g(y)$ trên đoạn $[-3; 3]$:
$ g'(y) = -12 - 8 dot (y-6)/sqrt((y-6)^2 + 64) = -12 - (8(y-6))/sqrt((y-6)^2 + 64) $
Xét phương trình $g'(y) = 0 => 3sqrt((y-6)^2 + 64) = -2(y-6) => 9((y-6)^2 + 64) = 4(y-6)^2$ (vô nghiệm).
Do đó $g'(y)$ không đổi dấu trên $[-3; 3]$. Thử giá trị tại $y=3$:
$ g'(3) = -12 + 24/sqrt(73) < 0 $
Vì $g'(y) < 0$ với mọi $y in [-3; 3]$, hàm số $g(y)$ nghịch biến trên $[-3; 3]$.
Giá trị nhỏ nhất của $g(y)$ đạt được tại đầu mút lớn nhất $y = 3$:
$ g(3) = 125 - 12(3) - 8sqrt((3-6)^2 + 64) = 89 - 8sqrt(73) = (sqrt(73) - 4)^2 $
Vậy khoảng cách không gian ngắn nhất là:
$ M N_(min) = sqrt(g(3)) = sqrt(73) - 4 $
(Đạt được khi $y = 3 => M(0; 3; 0)$ và $N(0; 32/sqrt(73); 64/sqrt(73))$).

*Cách 2 (Giải nhanh bằng công thức khoảng cách vạn năng & Casio):*
Ta áp dụng trực tiếp công thức khoảng cách vạn năng từ điểm $M in (C_1)$ đến đường tròn $(C_2)$ nằm trên mặt phẳng $(P_2): x=0$, tâm $J_2(0; 6; 8)$, bán kính $R_2 = 4$:
$ d(M, (C_2))^2 = M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2) $
- Điểm $M(3 cos t, 3 sin t, 0) in (C_1)$. Ta có:
  $ M J_2^2 = (3 cos t - 0)^2 + (3 sin t - 6)^2 + (0 - 8)^2 = 9 cos^2 t + 9 sin^2 t - 36 sin t + 36 + 64 = 109 - 36 sin t. $
  $ d(M, P_2)^2 = d(M, x=0)^2 = 9 cos^2 t. $
- Thay vào công thức vạn năng:
  $ F(t) = 109 - 36 sin t + 16 - 8sqrt(109 - 36 sin t - 9 cos^2 t) $
  $ = 125 - 36 sin t - 8sqrt(109 - 36 sin t - 9(1 - sin^2 t)) $
  $ = 125 - 36 sin t - 8sqrt(9 sin^2 t - 36 sin t + 100) $
- Đặt $y = 3 sin t$ với $y in [-3; 3]$, ta thu được hàm số giống hệt Cách 1:
  $ G(y) = 125 - 12 y - 8sqrt((y-6)^2 + 64) $
- Sử dụng Casio quét bảng giá trị (Table) của $G(y)$ trên $[-3; 3]$ (hoặc quét $F(t)$ trên $[0; 2 pi]$), ta dễ dàng tìm được giá trị nhỏ nhất của hàm số tại $y = 3$ (ứng với $t = pi/2$):
  $ G(3) = 89 - 8sqrt(73) $
  $ => M N_(min) = sqrt(89 - 8sqrt(73)) = sqrt(73) - 4. $"""
    # Calculate N coordinate roughly for drawing
    d_MJ2 = math.sqrt(73)
    N_y = 6 - 4 * (6-3) / d_MJ2
    N_z = 8 - 4 * 8 / d_MJ2
    fig = draw_2_circles_cetz((0,0,0), 3, (0,0,1,0), (0,6,8), 4, (1,0,0,0), (0,3,0), (0, N_y, N_z), scale=0.33)
    return stmt, "[$sqrt(73) - 4$]", sol, fig

def generate_mod3_2():
    stmt = """(Cấu hình 3.2 - Hai mặt phẳng vuông góc, lệch trục) Trong hệ tọa độ $O x y z$, đường tròn $(C_1)$ nằm trên mặt phẳng $z=0$, có tâm $J_1(0;0;0)$, bán kính $R_1=5$. Đường tròn $(C_2)$ nằm trên mặt phẳng thẳng đứng $x=4$, có tâm $J_2(4; 8; 6)$, bán kính $R_2=2$. Tìm khoảng cách nhỏ nhất giữa một điểm trên $(C_1)$ và một điểm trên $(C_2)$?"""
    sol = """#ppgiai[
  - $(C_1)$ trên mặt phẳng $z=0$, tâm $J_1(0; 0; 0)$, bán kính $R_1 = 5$.
  - $(C_2)$ trên mặt phẳng $x=4$, tâm $J_2(4; 8; 6)$, bán kính $R_2 = 2$.
]
#note[
  *Lưu ý sư phạm (Kỹ thuật quy giản thi cử):* Đây là cấu hình lệch trục nâng cao. Để giải bài toán khả thi bằng tay trong phòng thi, ta dùng đánh giá khoảng cách chặn dưới quy về tâm đường tròn: $M N >= M J_2 - R_2$. Bài toán quy về tìm giá trị nhỏ nhất của khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2(4; 8; 6)$.
]
*Bước 1:* Lấy điểm $M(x_M, y_M, 0) in (C_1) => x_M^2 + y_M^2 = 25$.
Thiết lập biểu thức khoảng cách bình phương từ $M$ đến tâm $J_2(4; 8; 6)$:
$ M J_2^2 = (x_M - 4)^2 + (y_M - 8)^2 + (0 - 6)^2 $
$ = x_M^2 + y_M^2 + 16 - 8x_M + 64 - 16y_M + 36 $
$ = 25 + 116 - 8(x_M + 2y_M) = 141 - 8(x_M + 2y_M). $

*Bước 2:* Để khoảng cách $M J_2$ nhỏ nhất thì biểu thức bậc nhất $P = x_M + 2y_M$ phải đạt giá trị lớn nhất.
Áp dụng bất đẳng thức Cauchy-Schwarz cho hai bộ số $(1; 2)$ và $(x_M; y_M)$:
$ P = 1 dot x_M + 2 dot y_M <= sqrt((1^2 + 2^2)(x_M^2 + y_M^2)) $
$ P <= sqrt(5 dot 25) = 5 sqrt(5) $
Dấu đẳng thức xảy ra khi và chỉ khi:
$ x_M/1 = y_M/2 > 0 => x_M = sqrt(5), quad y_M = 2 sqrt(5) $

*Bước 3:* Thế giá trị cực đại $P_("max") = 5 sqrt(5)$ vào biểu thức $M J_2^2$, ta được khoảng cách nhỏ nhất từ $M$ đến tâm $J_2$:
$ M J_(2, min) = sqrt(141 - 40 sqrt(5)) $

*Bước 4:* Suy ra khoảng cách cực tiểu giữa hai đường tròn theo phương pháp quy giản là:
$ M N_(min) = M J_(2, min) - R_2 = sqrt(141 - 40 sqrt(5)) - 2 $
(Khoảng cách này xấp xỉ $3.27$ dm)."""
    # Calculate M and N for drawing
    M_x = math.sqrt(5)
    M_y = 2 * math.sqrt(5)
    d_MJ2 = math.sqrt(141 - 40*math.sqrt(5))
    N_x = 4
    N_y = 8 - 2 * (8 - M_y) / d_MJ2
    N_z = 6 - 2 * 6 / d_MJ2
    fig = draw_2_circles_cetz((0,0,0), 5, (0,0,1,0), (4,8,6), 2, (1,0,0,-4), (M_x, M_y, 0), (N_x, N_y, N_z), scale=0.33)
    return stmt, "[$sqrt(141 - 40 sqrt(5)) - 2$]", sol, fig

def generate_mod4_1():
    stmt = """(Cấu hình 4.1 - Hai mặt phẳng nghiêng góc $60°$) Hai vành khuyên kim loại tròn được lắp đặt trên hai mặt phẳng tạo với nhau một góc $60°$. Vành thứ nhất $(C_1)$ nằm trên mặt phẳng $(O x y): z=0$, có tâm $J_1(0;0;0)$, bán kính $R_1=4$. Vành thứ hai $(C_2)$ nằm trên mặt phẳng nghiêng $(P): z = sqrt(3)x$, có tâm $J_2(3;0;3sqrt(3))$, bán kính $R_2=2$. Tìm khoảng cách ngắn nhất giữa hai vành khuyên?"""
    sol = """#ppgiai[
  - $(C_1)$ trên mặt phẳng $z=0$, tâm $J_1(0; 0; 0)$, bán kính $R_1 = 4$.
  - $(C_2)$ trên mặt phẳng nghiêng $(P): z = sqrt(3)x$, tâm $J_2(3; 0; 3sqrt(3))$, bán kính $R_2 = 2$.
]
#note[
  *Lưu ý sư phạm:* Với cấu hình hai mặt phẳng chéo nhau góc $60^o$, ta dùng phương pháp lượng giác hóa để tham số tọa độ điểm $M in (C_1)$ và áp dụng phương pháp quy giản về tâm đường tròn $J_2$ để tính khoảng cách cực tiểu dễ dàng.
]
*Bước 1 (Quy giản hình học về tâm):*
Áp dụng đánh giá khoảng cách chặn dưới: $M N >= M J_2 - R_2$. Khoảng cách giữa hai đường tròn nhỏ nhất khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2$ đạt giá trị nhỏ nhất:
$ M N_(min) = M J_(2, min) - R_2 $

*Bước 2 (Tham số hóa lượng giác):*
Do điểm $M$ nằm trên đường tròn $(C_1)$ có tâm $J_1(0;0;0)$ và bán kính $R_1=4$ trên mặt phẳng $z=0$, ta biểu diễn tọa độ của $M$ theo góc $t in [0; 2 pi)$:
$ M(4 cos t, 4 sin t, 0) $

*Bước 3 (Thiết lập hàm số khoảng cách):*
Tính bình phương khoảng cách từ $M$ đến tâm $J_2(3; 0; 3sqrt(3))$:
$ M J_2^2 = (4 cos t - 3)^2 + (4 sin t - 0)^2 + (0 - 3sqrt(3))^2 $
$ = 16 cos^2 t - 24 cos t + 9 + 16 sin^2 t + 27 $
$ = 16(cos^2 t + sin^2 t) + 36 - 24 cos t = 52 - 24 cos t. $

*Bước 4 (Tìm giá trị cực tiểu):*
Để khoảng cách $M J_2$ nhỏ nhất thì $52 - 24 cos t$ phải nhỏ nhất, tương đương với $cos t$ phải đạt giá trị lớn nhất.
Ta biết giá trị lớn nhất của $cos t$ là $1$ (xảy ra khi $t = 0$, ứng với điểm $M(4; 0; 0)$).
Khi đó:
$ M J_(2, min) = sqrt(52 - 24(1)) = sqrt(28) = 2 sqrt(7) $

*Bước 5 (Kết luận):*
Độ dài ngắn nhất nối hai đường tròn chéo nhau nghiêng $60^o$ là:
$ M N_(min) = M J_(2, min) - R_2 = 2 sqrt(7) - 2 $
(Khoảng cách này xấp xỉ $3.29$ dm)."""
    # J2 lies on plane z = sqrt(3)x. Normal is (sqrt(3), 0, -1, 0)
    d_MJ2 = 2 * math.sqrt(7)
    N_x = 3 - 2 * (3-4) / d_MJ2
    N_y = 0
    N_z = 3*math.sqrt(3) - 2 * (3*math.sqrt(3)) / d_MJ2
    fig = draw_2_circles_cetz((0,0,0), 4, (0,0,1,0), (3,0,3*math.sqrt(3)), 2, (math.sqrt(3),0,-1,0), (4,0,0), (N_x, N_y, N_z), scale=0.33)
    return stmt, "[$2 sqrt(7) - 2$]", sol, fig

def generate_mod5_1():
    stmt = """(Cấu hình 5.1 - Đoạn vuông góc chung) Hai quỹ đạo của thiết bị tự động được đặt trong hai mặt phẳng vuông góc. Quỹ đạo $(C_1)$ nằm trên mặt phẳng $y=0$ có tâm $J_1(0;0;6)$, bán kính $R_1=3$. Quỹ đạo $(C_2)$ nằm trên mặt phẳng $x=0$ có tâm $J_2(0;9;6)$, bán kính $R_2=4$. Tìm khoảng cách ngắn nhất giữa hai quỹ đạo?"""
    sol = """#ppgiai[
  - $(C_1)$ nằm trên mặt phẳng $y=0$, tâm $J_1(0; 0; 6)$, bán kính $R_1 = 3$.
  - $(C_2)$ nằm trên mặt phẳng $x=0$, tâm $J_2(0; 9; 6)$, bán kính $R_2 = 4$.
]
#note[
  *Lưu ý sư phạm:* Trục của đường tròn thứ nhất song song với trục $O y$, trục của đường tròn thứ hai song song với trục $O x$. Đường thẳng nối hai tâm $J_1 J_2$ song song với trục $O y$, vuông góc với cả hai mặt phẳng chéo nhau chứa hai đường tròn. Đây chính là đoạn vuông góc chung của hệ thống.
]
*Bước 1 (Xác định tính chất hình học):*
- Đường tròn $(C_1)$ nằm trên mặt phẳng $y=0$ (mặt phẳng $O x z$).
- Đường tròn $(C_2)$ nằm trên mặt phẳng $x=0$ (mặt phẳng $O y z$).
Tâm của hai đường tròn là $J_1(0; 0; 6)$ và $J_2(0; 9; 6)$ có cùng cao độ $z = 6$.

*Bước 2 (Xác định đoạn vuông góc chung):*
Đường thẳng nối hai tâm $J_1 J_2$ đi qua $J_1(0;0;6)$ và $J_2(0;9;6)$ song song với trục tung $O y$.
- Đường thẳng $J_1 J_2$ vuông góc với mặt phẳng $y=0$ tại $J_1$.
- Đường thẳng $J_1 J_2$ vuông góc với mặt phẳng $x=0$ tại điểm có tọa độ $(0; 9; 6)$.
Do đó, đoạn thẳng $J_1 J_2$ chính là đoạn vuông góc chung giữa hai mặt phẳng chứa hai đường tròn. Khoảng cách giữa hai tâm là:
$ J_1 J_2 = 9 $

*Bước 3 (Tính khoảng cách cực tiểu giữa hai đường tròn):*
Vì đường nối hai tâm là đoạn vuông góc chung của hai mặt phẳng, khoảng cách ngắn nhất giữa hai điểm $M in (C_1)$ và $N in (C_2)$ đạt được khi chúng nằm trên đoạn thẳng nối hai tâm này:
$ M N_(min) = J_1 J_2 - R_1 - R_2 = 9 - 3 - 4 = 2 $
(Đạt được tại điểm $M(3; 0; 6)$ và $N(0; 5; 6)$)."""
    fig = draw_2_circles_cetz((0,0,6), 3, (0,1,0,0), (0,9,6), 4, (1,0,0,0), (3,0,6), (0,5,6), scale=0.33)
    return stmt, "[2]", sol, fig

def generate_mod6_1():
    stmt = """(Ứng dụng thực tế: Thiết kế khoảng cách an toàn) Hai Flycam nông nghiệp quét sóng vô tuyến trên hai quỹ đạo tròn trong không gian. Quỹ đạo của Flycam 1 là đường tròn $(C_1)$ nằm trên mặt phẳng nghiêng $(P_1): x + y + z - 6 = 0$, có tâm $J_1(2;2;2)$, bán kính $R_1 = 3$. Quỹ đạo của Flycam 2 là đường tròn $(C_2)$ nằm trên mặt phẳng song song với $(P_1)$, có phương trình $(P_2): x + y + z - 15 = 0$, có tâm $J_2(5;5;5)$, bán kính $R_2 = 2$. Tính khoảng cách gần nhau nhất giữa hai Flycam trong quá trình hoạt động?"""
    sol = """#ppgiai[
  - $(C_1)$ tâm $J_1(2; 2; 2)$, bán kính $R_1 = 3$, nằm trên mặt phẳng $(P_1): x + y + z - 6 = 0$.
  - $(C_2)$ tâm $J_2(5; 5; 5)$, bán kính $R_2 = 2$, nằm trên mặt phẳng $(P_2): x + y + z - 15 = 0$.
]
#note[
  *Lưu ý sư phạm:* Bài toán thực tế đưa ra hai phương trình mặt phẳng nghiêng nhưng song song. Bằng cách chiếu vuông góc tâm $J_2$ lên mặt phẳng $(P_1)$, ta chứng minh được hình chiếu này trùng với $J_1$, tức là cấu hình *đồng trục* trên hai mặt phẳng song song.
]
*Bước 1:* Tính khoảng cách $h$ giữa hai mặt phẳng song song $(P_1)$ và $(P_2)$:
$ h = d((P_1), (P_2)) = (|6 - 15|)/sqrt(1^2 + 1^2 + 1^2) = 9/sqrt(3) = 3sqrt(3). $
*Bước 2:* Tìm hình chiếu của tâm $J_2(5;5;5)$ lên $(P_1)$.
Đường thẳng qua $J_2$ vuông góc với $(P_1)$ có dạng: $x = 5+t, y = 5+t, z = 5+t$.
Giao điểm với $(P_1)$ là: $(5+t) + (5+t) + (5+t) - 6 = 0 => 3t + 9 = 0 => t = -3$.
Tọa độ hình chiếu là $J_2'(2, 2, 2) equiv J_1$.
Do đó, hai đường tròn đồng trục.
*Bước 3:* Khoảng cách ngang tối thiểu là:
$ d_("ngang") = |R_1 - R_2| = |3 - 2| = 1. $
*Bước 4:* Áp dụng công thức khoảng cách không gian nhỏ nhất:
$ M N_(min) = sqrt(h^2 + d_("ngang")^2) = sqrt((3sqrt(3))^2 + 1^2) = sqrt(27 + 1) = sqrt(28) = 2sqrt(7). $"""
    # Normal is (1, 1, 1, -6)
    # We choose points M and N along a shared vector for visualization
    u, v = get_uv(1, 1, 1)
    M = (2 + 3*u[0], 2 + 3*u[1], 2 + 3*u[2])
    N = (5 + 2*u[0], 5 + 2*u[1], 5 + 2*u[2])
    fig = draw_2_circles_cetz((2,2,2), 3, (1,1,1,-6), (5,5,5), 2, (1,1,1,-15), M, N, scale=0.33, project_c2=True)
    return stmt, "[$2 sqrt(7)$]", sol, fig

def generate_mod6_2():
    stmt = """(Ứng dụng thực tế: Thiết kế cáp kết nối) Một đĩa mặt trời nhân tạo thu năng lượng là đường tròn $(C)$ có tâm $J(2; 2; 2)$, bán kính $R_C = 5$ được lắp đặt nằm trên mặt dốc $(P): 2x + 2y - z - 6 = 0$. Một quả cầu trữ năng lượng $(S): (x-11)^2 + (y-14)^2 + (z-15)^2 = 4$ bay lơ lửng bên trên. Tìm độ dài đoạn cáp ngắn nhất kết nối quả cầu với viền của đĩa mặt trời?"""
    sol = """#ppgiai[
  - $(C)$ có tâm $J(2; 2; 2)$, bán kính $R_C = 5$, nằm trên mặt phẳng $(P): 2x + 2y - z - 6 = 0$.
  - $(S)$ có tâm $I(11; 14; 15)$, bán kính $R_S = 2$.
]
#note[
  *Lưu ý sư phạm (Khắc phục hình vẽ):* Đây là bài toán khoảng cách từ viền đường tròn đến mặt cầu. Ta chiếu tâm mặt cầu $I$ xuống mặt phẳng $(P)$ được điểm $I'$. Bài toán chuyển về tìm điểm gần nhất trên đường tròn đối với hình chiếu $I'$, rồi dùng định lý Pytago không gian để tính khoảng cách từ $I$ đến đường tròn, cuối cùng trừ đi bán kính mặt cầu $R_S$.
]
*Bước 1:* Tính khoảng cách đứng $h$ từ tâm mặt cầu $I(11;14;15)$ đến mặt phẳng $(P)$:
$ h = d(I, (P)) = (|2 times 11 + 2 times 14 - 15 - 6|)/sqrt(2^2 + 2^2 + (-1)^2) = (|22 + 28 - 21|)/3 = 29/3. $
*Bước 2:* Xác định tọa độ hình chiếu vuông góc $I'$ của $I$ lên $(P)$:
Đường thẳng đi qua $I$ vuông góc với $(P)$ có phương trình: $x = 11 + 2t, y = 14 + 2t, z = 15 - t$.
Thế vào phương trình $(P)$: $2(11+2t) + 2(14+2t) - (15-t) - 6 = 0 => 9t + 29 = 0 => t = -29/9$.
Tọa độ điểm $I'$ là:
$ x_(I') = 41/9, quad y_(I') = 68/9, quad z_(I') = 164/9. $
*Bước 3:* Tính khoảng cách từ tâm đĩa $J(2;2;2)$ đến hình chiếu $I'$:
$ J I'^2 = (41/9 - 2)^2 + (68/9 - 2)^2 + (164/9 - 2)^2 = (23/9)^2 + (50/9)^2 + (146/9)^2 = 24345/81. $
$ J I' = sqrt(24345)/9 approx 17.34. $
Vì $J I' > R_C = 5$, nên điểm $I'$ nằm ngoài đường tròn $(C)$.
Khoảng cách ngang ngắn nhất giữa $(C)$ và hình chiếu $I'$ là:
$ d_("ngang") = J I' - R_C = sqrt(24345)/9 - 5 approx 12.34. $
*Bước 4:* Khoảng cách từ tâm quả cầu $I$ đến viền đĩa ngắn nhất:
$ d(I, (C)) = sqrt(h^2 + d_("ngang")^2) = sqrt((29/3)^2 + (sqrt(24345)/9 - 5)^2) approx 15.67. $
*Bước 5:* Độ dài đoạn cáp ngắn nhất bằng khoảng cách cực tiểu từ viền đĩa đến quả cầu:
$ d_(min) = d(I, (C)) - R_S approx 15.67 - 2 = 13.67. $"""
    # Calculate M and N on the drawing
    I_pt = (11, 14, 15)
    J_pt = (2, 2, 2)
    # Projection of I on P:
    I_proj = (41/9, 68/9, 164/9)
    # Unit vector from J to I_proj
    dx, dy, dz = I_proj[0]-J_pt[0], I_proj[1]-J_pt[1], I_proj[2]-J_pt[2]
    d_J_Iproj = math.sqrt(dx**2 + dy**2 + dz**2)
    ux, uy, uz = dx/d_J_Iproj, dy/d_J_Iproj, dz/d_J_Iproj
    # Point M on the circle (C) closest to I_proj
    M_pt = (J_pt[0] + 5*ux, J_pt[1] + 5*uy, J_pt[2] + 5*uz)
    # Point N on the sphere closest to M
    dx_M_I, dy_M_I, dz_M_I = I_pt[0]-M_pt[0], I_pt[1]-M_pt[1], I_pt[2]-M_pt[2]
    d_M_I = math.sqrt(dx_M_I**2 + dy_M_I**2 + dz_M_I**2)
    N_pt = (I_pt[0] - 2*dx_M_I/d_M_I, I_pt[1] - 2*dy_M_I/d_M_I, I_pt[2] - 2*dz_M_I/d_M_I)
    
    fig = draw_circle_sphere_cetz(J_pt, 5, (2,2,-1,-6), I_pt, 2, M_pt, N_pt, scale=0.33)
    return stmt, "[13.67]", sol, fig


def generate_mod6_3():
    stmt = """(Ứng dụng thực tế: Thiết bị cảm biến tuabin gió - BẪY CHIẾU CẮT NHAU) Trong một hệ thống tuabin gió, hai đĩa xoay cảm biến tròn $(C_1)$ và $(C_2)$ được đặt song song với nhau. Đĩa $(C_1)$ nằm trên mặt đáy phẳng $(P_1): z = 0$ có tâm $J_1(0; 0; 0)$ và bán kính $R_1 = 5$ dm. Đĩa cảm biến thứ hai $(C_2)$ nằm trên mặt phẳng song song $(P_2): z = 4$ có tâm lệch trục tại $J_2(3; 0; 4)$ và bán kính $R_2 = 3$ dm. Một kỹ sư cần đo khoảng cách ngắn nhất giữa một điểm $M$ chạy trên viền của đĩa $(C_1)$ và một điểm $N$ chạy trên viền của đĩa $(C_2)$. Hãy giúp kỹ sư xác định khoảng cách ngắn nhất này?"""
    sol = """#ppgiai[
  - $(C_1)$ có tâm $J_1(0; 0; 0)$, bán kính $R_1 = 5$, nằm trên mặt phẳng $z=0$.
  - $(C_2)$ có tâm $J_2(3; 0; 4)$, bán kính $R_2 = 3$, nằm trên mặt phẳng $z=4$.
  - Khoảng cách thẳng đứng giữa hai mặt phẳng chứa hai đường tròn là $h = 4$.
]
#note[
  *Cảnh báo bẫy:* Bài toán song song lệch trục này rất dễ khiến học sinh áp dụng máy móc công thức $d_(\"ngang\") = |J_1 J_2' - R_1 - R_2| = |3 - 5 - 3| = 5$ rồi tính ra $M N = sqrt(4^2 + 5^2) = sqrt(41) approx 6.40$. Thực tế, ta cần khảo sát vị trí tương đối của hai hình chiếu!
]
*Bước 1:* Chiếu đường tròn $(C_2)$ vuông góc xuống mặt phẳng $z=0$, ta được đường tròn hình chiếu $(C_2')$ có tâm $J_2'(3; 0; 0)$ và bán kính $R_2 = 3$.
*Bước 2:* Xét vị trí tương đối giữa đường tròn $(C_1)$ và đường tròn hình chiếu $(C_2')$ trên mặt phẳng $z=0$:
- Khoảng cách giữa hai tâm là $J_1 J_2' = 3$.
- Hiệu hai bán kính là $|R_1 - R_2| = 2$.
- Tổng hai bán kính là $R_1 + R_2 = 8$.
Vì $|R_1 - R_2| = 2 < J_1 J_2' = 3 < R_1 + R_2 = 8$, nên hai đường tròn $(C_1)$ và $(C_2')$ cắt nhau tại hai điểm chung $K_1, K_2$.
*Bước 3:* Tại các điểm giao nhau $K_1, K_2$ trên mặt phẳng chiếu, khoảng cách ngang giữa hai đường tròn bằng $0$.
Khi đó, khoảng cách ngắn nhất giữa hai điểm $M$ và $N$ trong không gian chính bằng khoảng cách đứng giữa hai mặt phẳng:
$ M N_(min) = h = 4. $
(Đạt được khi $M(x_0; y_0; 0)$ trùng với hình chiếu của $N(x_0; y_0; 4)$ tại các giao điểm $K_1, K_2$ của hai đường tròn)."""
    x_i = 25/6
    y_i = 5*math.sqrt(11)/6
    M_pt = (x_i, y_i, 0)
    N_pt = (x_i, y_i, 4)
    fig = draw_2_circles_cetz((0,0,0), 5, (0,0,1,0), (3,0,4), 3, (0,0,1,-4), M_pt, N_pt, scale=0.33, project_c2=True)
    return stmt, "[4]", sol, fig

def generate_mod6_4():
    stmt = """(Ứng dụng thực tế: Cánh tay rô-bốt hàn - HAI MẶT PHẲNG VUÔNG GÓC) Trong một dây chuyền lắp ráp ô tô tự động, hai rô-bốt hàn kỹ thuật số di chuyển đầu hàn theo hai quỹ đạo tròn $(C_1)$ và $(C_2)$ nằm trên hai mặt phẳng vuông góc với nhau. Quỹ đạo $(C_1)$ nằm trên mặt sàn nằm ngang $(P_1): z=0$, có tâm tại gốc tọa độ $J_1(0;0;0)$ và bán kính $R_1=3$ dm. Quỹ đạo $(C_2)$ nằm trên mặt tấm chắn đứng $(P_2): x=0$, có tâm $J_2(0;4;0)$ và bán kính $R_2=2$ dm. Hãy xác định khoảng cách ngắn nhất giữa đầu hàn của rô-bốt 1 (chạy trên $C_1$) và rô-bốt 2 (chạy trên $C_2$) để lập trình chế độ tránh va chạm?"""
    sol = """#ppgiai[
  - $(C_1)$ có tâm $J_1(0; 0; 0)$, bán kính $R_1 = 3$, nằm trên mặt phẳng $z=0$.
  - $(C_2)$ có tâm $J_2(0; 4; 0)$, bán kính $R_2 = 2$, nằm trên mặt phẳng $x=0$.
]
#note[
  *Lưu ý sư phạm:* Đây là bài toán cực trị khoảng cách giữa hai đường tròn nằm trên hai mặt phẳng vuông góc (mặt phẳng nằm ngang và mặt phẳng đứng qua trục tung). Ta sẽ tham số hóa tọa độ các điểm trên hai đường tròn rồi sử dụng tính chất của hàm liên kết bậc nhất để tìm giá trị nhỏ nhất của bình phương khoảng cách.
]
*Bước 1:* Biểu diễn tọa độ các điểm chạy trên hai quỹ đạo tròn:
- Điểm $M in (C_1)$ nằm trên mặt phẳng $z=0$, có tâm $J_1(0;0;0)$ và bán kính $R_1=3$ nên:
  $ M(3 cos t, 3 sin t, 0) $ với $t in [0; 2 pi)$.
- Điểm $N in (C_2)$ nằm trên mặt phẳng $x=0$, có tâm $J_2(0;4;0)$ và bán kính $R_2=2$ nên:
  $ N(0, 4 + 2 cos u, 2 sin u) $ với $u in [0; 2 pi)$.
*Bước 2:* Tính bình phương khoảng cách không gian giữa $M$ và $N$:
  $ M N^2 = (3 cos t - 0)^2 + (3 sin t - 4 - 2 cos u)^2 + (0 - 2 sin u)^2 $
  $ = 9 cos^2 t + (9 sin^2 t - 6 sin t (4 + 2 cos u) + 16 + 16 cos u + 4 cos^2 u) + 4 sin^2 u $
  $ = 9(cos^2 t + sin^2 t) + 4(cos^2 u + sin^2 u) + 16 - 24 sin t + 16 cos u - 12 sin t cos u $
  $ = 9 + 4 + 16 - 24 sin t + 16 cos u - 12 sin t cos u $
  $ = 29 - 24 sin t + 16 cos u - 12 sin t cos u. $
*Bước 3:* Đặt $X = sin t in [-1; 1]$ và $Y = cos u in [-1; 1]$. Biểu thức cần tìm giá trị nhỏ nhất trở thành hàm hai biến:
  $ f(X, Y) = 29 - 24X + 16Y - 12 X Y $ trên miền $[-1; 1] times [-1; 1]$.
*Bước 4:* Do $f(X, Y)$ là một hàm bậc nhất đối với từng biến $X$ và $Y$ (hàm song tuyến tính), nên giá trị cực trị của nó trên miền hình chữ nhật $[-1; 1] times [-1; 1]$ chỉ có thể đạt được tại các đỉnh của miền xác định:
- Tại đỉnh $(1; 1)$: $f(1, 1) = 29 - 24 + 16 - 12 = 9$.
- Tại đỉnh $(1; -1)$: $f(1, -1) = 29 - 24 - 16 + 12 = 1$.
- Tại đỉnh $(-1; 1)$: $f(-1, 1) = 29 + 24 + 16 + 12 = 81$.
- Tại đỉnh $(-1; -1)$: $f(-1, -1) = 29 + 24 - 16 - 12 = 25$.
*Bước 5:* Nhận thấy giá trị nhỏ nhất của $f(X, Y)$ là $1$ đạt được tại $X = 1$ và $Y = -1$.
Khi đó:
$ M N_(min) = sqrt(1) = 1 $ dm.
(Đạt được khi $sin t = 1 => M(0; 3; 0)$ và $cos u = -1 => N(0; 2; 0)$)."""
    fig = draw_2_circles_cetz((0,0,0), 3, (0,0,1,0), (0,4,0), 2, (1,0,0,0), (0,3,0), (0,2,0), scale=0.33)
    return stmt, "[1]", sol, fig


def generate_mod3_3():
    stmt = """(Ví dụ 15: Cấu hình 3.3 - Vuông góc, lệch trục bất đối xứng) Trong hệ trục tọa độ $O x y z$, hai đĩa xoay của thiết bị tự động được lắp đặt trên hai mặt đứng vuông góc là $(P_1): x=2$ và $(P_2): y=3$. Đĩa thứ nhất là đường tròn $(C_1)$ trên mặt phẳng $x=2$ có tâm $J_1(2;0;0)$ và bán kính $R_1=3$. Đĩa thứ hai là đường tròn $(C_2)$ trên mặt phẳng $y=3$ có tâm $J_2(0;3;5)$ và bán kính $R_2=2$. Hãy tìm khoảng cách ngắn nhất giữa một điểm $M$ trên viền đĩa $(C_1)$ và một điểm $N$ trên viền đĩa $(C_2)$ bằng phương pháp quy giản về tâm?"""
    sol = """#ppgiai[
  - Đĩa $(C_1)$ nằm trên mặt phẳng $x=2$, tâm $J_1(2; 0; 0)$, bán kính $R_1 = 3$.
  - Đĩa $(C_2)$ nằm trên mặt phẳng $y=3$, tâm $J_2(0; 3; 5)$, bán kính $R_2 = 2$.
]
#note[
  *Lưu ý sư phạm:* Đây là bài toán cực trị khoảng cách giữa hai đường tròn nằm trên hai mặt đứng vuông góc và chéo nhau trong không gian. Ta áp dụng phương pháp quy giản hình học về tâm $J_2$ để tính toán nhanh gọn và chính xác.
]
*Bước 1 (Quy giản hình học về tâm):*
Theo bất đẳng thức tam giác trong không gian, ta luôn có đánh giá khoảng cách chặn dưới:
$ M N >= M J_2 - R_2 $
Do đó, khoảng cách ngắn nhất nối hai đường tròn đạt được khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2(0; 3; 5)$ đạt giá trị nhỏ nhất:
$ M N_(min) = M J_(2, min) - R_2 $

*Bước 2 (Tham số hóa lượng giác):*
Do điểm $M$ nằm trên đường tròn $(C_1)$ trong mặt phẳng đứng $x=2$, có tâm $J_1(2;0;0)$ và bán kính $R_1 = 3$. Ta tham số hóa tọa độ của $M$ theo góc $t in [0; 2 pi)$:
$ M(2, 3 cos t, 3 sin t) $

*Bước 3 (Thiết lập hàm số khoảng cách):*
Tính bình phương khoảng cách từ $M$ đến tâm $J_2(0;3;5)$:
$ M J_2^2 = (2 - 0)^2 + (3 cos t - 3)^2 + (3 sin t - 5)^2 $
$ = 4 + (9 cos^2 t - 18 cos t + 9) + (9 sin^2 t - 30 sin t + 25) $
$ = 4 + 9(cos^2 t + sin^2 t) - 18 cos t - 30 sin t + 34 $
$ = 47 - 6(3 cos t + 5 sin t). $

*Bước 4 (Áp dụng bất đẳng thức để tìm cực tiểu):*
Để $M J_2^2$ nhỏ nhất thì biểu thức lượng giác $A = 3 cos t + 5 sin t$ phải đạt giá trị lớn nhất.
Theo bất đẳng thức Cauchy-Schwarz:
$ A = 3 cos t + 5 sin t <= sqrt((3^2 + 5^2)(cos^2 t + sin^2 t)) = sqrt(34) $
Giá trị lớn nhất của $A$ là $sqrt(34)$. Thế vào ta được:
$ M J_(2, min) = sqrt(47 - 6 sqrt(34)) $

*Bước 5 (Kết luận):*
Khoảng cách ngắn nhất giữa hai đĩa xoay là:
$ M N_(min) = M J_(2, min) - R_2 = sqrt(47 - 6 sqrt(34)) - 2 $
(Khoảng cách này xấp xỉ $1.47$ dm)."""
    # Calculate M and N for drawing
    M_y = 3 * 3 / math.sqrt(34)
    M_z = 3 * 5 / math.sqrt(34)
    fig = draw_2_circles_cetz((2,0,0), 3, (1,0,0,-2), (0,3,5), 2, (0,1,0,-3), (2, M_y, M_z), (0,3,5-2), scale=0.33)
    return stmt, "[$sqrt(47 - 6 sqrt(34)) - 2$]", sol, fig


def generate_mod3_4():
    stmt = """(Cấu hình 3.4 - Vuông góc, lệch trục tổng quát) Trong hệ tọa độ $O x y z$, đường tròn $(C_1)$ nằm trên mặt phẳng đứng $(P_1): y=1$, có tâm $J_1(0;1;2)$ và bán kính $R_1=4$. Đường tròn $(C_2)$ nằm trên mặt phẳng ngang $(P_2): z=5$, có tâm $J_2(3;4;5)$ và bán kính $R_2=3$. Tìm khoảng cách nhỏ nhất giữa một điểm $M$ trên đường tròn $(C_1)$ và một điểm $N$ trên đường tròn $(C_2)$ bằng phương pháp quy giản về tâm?"""
    sol = """#ppgiai[
  - $(C_1)$ nằm trên mặt phẳng $y=1$, tâm $J_1(0; 1; 2)$, bán kính $R_1 = 4$.
  - $(C_2)$ nằm trên mặt phẳng $z=5$, tâm $J_2(3; 4; 5)$, bán kính $R_2 = 3$.
]
#note[
  *Lưu ý sư phạm:* Đây là cấu hình hai đường tròn nằm trên hai mặt phẳng vuông góc chéo nhau (lệch trục) ở dạng tổng quát. Ta áp dụng phương pháp quy giản khoảng cách về tâm $J_2$ của đường tròn $(C_2)$ để giải quyết nhanh chóng bài toán.
]
*Bước 1 (Quy giản hình học về tâm):*
Theo đánh giá khoảng cách chặn dưới hình học:
$ M N >= M J_2 - R_2 $
Đoạn thẳng $M N$ đạt độ dài nhỏ nhất khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2(3; 4; 5)$ đạt giá trị nhỏ nhất:
$ M N_(min) = M J_(2, min) - R_2 $

*Bước 2 (Tham số hóa điểm $M$):*
Do $M$ thuộc đường tròn $(C_1)$ nằm trên mặt phẳng $y=1$, có tâm $J_1(0;1;2)$ và bán kính $R_1 = 4$. Tọa độ của $M$ được tham số hóa theo góc lượng giác $t in [0; 2 pi)$:
$ M(4 cos t, 1, 2 + 4 sin t) $

*Bước 3 (Thiết lập hàm số khoảng cách):*
Tính bình phương khoảng cách từ $M$ đến tâm $J_2(3; 4; 5)$:
$ M J_2^2 = (4 cos t - 3)^2 + (1 - 4)^2 + (2 + 4 sin t - 5)^2 $
$ = (4 cos t - 3)^2 + (-3)^2 + (4 sin t - 3)^2 $
$ = 16 cos^2 t - 24 cos t + 9 + 9 + 16 sin^2 t - 24 sin t + 9 $
$ = 16(cos^2 t + sin^2 t) + 27 - 24(cos t + sin t) $
$ = 43 - 24(cos t + sin t). $

*Bước 4 (Tìm cực tiểu của hàm số):*
Để khoảng cách $M J_2$ nhỏ nhất thì biểu thức $P = cos t + sin t$ phải đạt giá trị lớn nhất.
Áp dụng bất đẳng thức Cauchy-Schwarz hoặc công thức cộng lượng giác:
$ P = cos t + sin t <= sqrt((1^2 + 1^2)(cos^2 t + sin^2 t)) = sqrt(2) $
Giá trị lớn nhất của $P$ là $sqrt(2)$, đạt được khi $t = pi/4$.
Khi đó:
$ M J_(2, min) = sqrt(43 - 24 sqrt(2)) $

*Bước 5 (Kết luận):*
Khoảng cách nhỏ nhất giữa hai đường tròn là:
$ M N_(min) = M J_(2, min) - R_2 = sqrt(43 - 24 sqrt(2)) - 3 $
(Khoảng cách này xấp xỉ $3.01 - 3 = 0.01$ dm, tức là hai đường tròn gần như tiếp cận sát nhau trong không gian).

*Cách 2 (Giải nhanh bằng công thức khoảng cách vạn năng & Casio):*
Áp dụng công thức khoảng cách vạn năng từ điểm $M in (C_1)$ đến đường tròn $(C_2)$ nằm trên mặt phẳng $(P_2): z=5$, tâm $J_2(3; 4; 5)$, bán kính $R_2 = 3$:
$ d(M, (C_2))^2 = M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2) $
- Với $M(4 cos t, 1, 2 + 4 sin t) in (C_1)$, ta có:
  $ M J_2^2 = (4 cos t - 3)^2 + (1 - 4)^2 + (2 + 4 sin t - 5)^2 = 43 - 24(cos t + sin t). $
  $ d(M, P_2)^2 = d(M, z=5)^2 = (4 sin t - 3)^2. $
- Thay vào công thức vạn năng:
  $ F(t) = 43 - 24(cos t + sin t) + 9 - 6sqrt(43 - 24(cos t + sin t) - (4 sin t - 3)^2) $
  $ = 52 - 24(cos t + sin t) - 6sqrt(16 cos^2 t - 24 cos t + 18) $
  $ = 52 - 24(cos t + sin t) - 6sqrt((4 cos t - 3)^2 + 9) $
- Sử dụng máy tính Casio quét bảng giá trị (Table) của $F(t)$ trên $[0; 2 pi]$, ta tìm được giá trị nhỏ nhất của $F(t)$ tại $t = pi/4$ (khi đó cos(pi/4) = sin(pi/4) = 1/sqrt(2)):
  $ F(pi/4) = 52 - 24 sqrt(2) - 6sqrt((4/sqrt(2) - 3)^2 + 9) = (sqrt(43 - 24 sqrt(2)) - 3)^2 $
  $ => M N_(min) = sqrt(F(pi/4)) = sqrt(43 - 24 sqrt(2)) - 3. $"""
    # Calculate M and N for drawing
    M_x = 4 * math.cos(math.pi/4)
    M_y = 1
    M_z = 2 + 4 * math.sin(math.pi/4)
    d_M_prime_J2 = math.sqrt((M_x - 3)**2 + (M_y - 4)**2)
    N_x = 3 + 3 * (M_x - 3) / d_M_prime_J2
    N_y = 4 + 3 * (M_y - 4) / d_M_prime_J2
    N_z = 5
    fig = draw_2_circles_cetz((0,1,2), 4, (0,1,0,-1), (3,4,5), 3, (0,0,1,-5), (M_x, M_y, M_z), (N_x, N_y, N_z), scale=0.33)
    return stmt, "[$sqrt(43 - 24 sqrt(2)) - 3$]", sol, fig

def generate_mod4_2():
    stmt = """(Ví dụ 16: Cấu hình 4.2 - Hai mặt phẳng nghiêng góc $45°$) Trong một hệ thống dẫn nhiên liệu tự động, hai vành đệm tròn $(C_1)$ và $(C_2)$ được đặt trên hai mặt phẳng nghiêng nhau một góc $45°$. Vành thứ nhất $(C_1)$ nằm trên mặt nằm ngang $z=0$, có tâm $J_1(0;0;0)$ và bán kính $R_1=5$. Vành thứ hai $(C_2)$ nằm trên mặt nghiêng $(P): y-z=0$, có tâm $J_2(0;4;4)$ và bán kính $R_2=2$. Hãy xác định khoảng cách ngắn nhất giữa hai vành đệm bằng phương pháp quy giản về tâm?"""
    sol = """#ppgiai[
  - Vành thứ nhất $(C_1)$ trên mặt phẳng $z=0$, tâm $J_1(0; 0; 0)$, bán kính $R_1 = 5$.
  - Vành thứ hai $(C_2)$ trên mặt phẳng nghiêng $y-z=0$, tâm $J_2(0; 4; 4)$, bán kính $R_2 = 2$.
]
#note[
  *Lưu ý sư phạm:* Hai mặt phẳng $z=0$ (pháp vectơ $arrow(n)_1 = (0;0;1)$) và $y-z=0$ (pháp vectơ $arrow(n)_2 = (0;1;-1)$) có góc giữa hai mặt phẳng được tính bởi $cos alpha = |arrow(n)_1 dot arrow(n)_2| / (1 dot sqrt(2)) = 1/sqrt(2) => alpha = 45^o$. Ta áp dụng phương pháp quy giản khoảng cách về tâm $J_2$ của đường tròn $(C_2)$.
]
*Bước 1 (Quy giản hình học về tâm):*
Ta áp dụng đánh giá khoảng cách chặn dưới: $M N >= M J_2 - R_2$. Khoảng cách giữa hai đường tròn nhỏ nhất khi khoảng cách từ điểm di động $M in (C_1)$ đến tâm cố định $J_2(0; 4; 4)$ đạt giá trị nhỏ nhất:
$ M N_(min) = M J_(2, min) - R_2 $

*Bước 2 (Tham số hóa lượng giác):*
Do điểm $M$ nằm trên đường tròn $(C_1)$ có tâm $J_1(0;0;0)$ và bán kính $R_1=5$ trên mặt phẳng $z=0$, ta tham số hóa tọa độ của $M$ theo góc $t in [0; 2 pi)$:
$ M(5 cos t, 5 sin t, 0) $

*Bước 3 (Thiết lập hàm số khoảng cách):*
Tính bình phương khoảng cách từ $M$ đến tâm $J_2(0;4;4)$:
$ M J_2^2 = (5 cos t - 0)^2 + (5 sin t - 4)^2 + (0 - 4)^2 $
$ = 25 cos^2 t + (25 sin^2 t - 40 sin t + 16) + 16 $
$ = 25(cos^2 t + sin^2 t) - 40 sin t + 32 $
$ = 25 + 32 - 40 sin t = 57 - 40 sin t. $

*Bước 4 (Tìm giá trị cực tiểu):*
Để khoảng cách $M J_2$ nhỏ nhất thì $57 - 40 sin t$ phải nhỏ nhất, tương đương với $sin t$ phải đạt giá trị lớn nhất.
Ta biết giá trị lớn nhất của $sin t$ là $1$ (xảy ra khi $t = pi/2$, ứng với điểm $M(0; 5; 0)$).
Khi đó:
$ M J_(2, min) = sqrt(57 - 40(1)) = sqrt(17) $

*Bước 5 (Kết luận):*
Độ dài ngắn nhất nối hai vành đệm chéo nhau nghiêng $45^o$ là:
$ M N_(min) = M J_(2, min) - R_2 = sqrt(17) - 2 $
(Khoảng cách này xấp xỉ $2.12$ dm)."""
    fig = draw_2_circles_cetz((0,0,0), 5, (0,0,1,0), (0,4,4), 2, (0,1,-1,0), (0,5,0), (0, 4 - math.sqrt(2), 4 - math.sqrt(2)), scale=0.33)
    return stmt, "[$approx 3.434$]", sol, fig


def generate_mod4_3():
    stmt = """(Cấu hình 4.3 - Hai mặt phẳng nghiêng góc $30°$) Trong hệ tọa độ $O x y z$, đường tròn $(C_1)$ nằm trên mặt nằm ngang $z=0$, có tâm $J_1(0;0;0)$ và bán kính $R_1=6$. Đường tròn $(C_2)$ nằm trên mặt phẳng nghiêng $(P): y - sqrt(3)z = 0$, có tâm $J_2(0;3sqrt(3);3)$ và bán kính $R_2=2$. Hãy xác định khoảng cách ngắn nhất giữa hai đường tròn?"""
    sol = """#ppgiai[
  - $(C_1)$ nằm trên mặt phẳng $z=0$, tâm $J_1(0; 0; 0)$, bán kính $R_1 = 6$.
  - $(C_2)$ nằm trên mặt phẳng nghiêng $y - sqrt(3)z = 0$, tâm $J_2(0; 3sqrt(3); 3)$, bán kính $R_2 = 2$.
]
#note[
  *Lưu ý sư phạm:*
  
  Góc giữa hai mặt phẳng có thể tính trực tiếp qua cosin góc giữa hai pháp vectơ $arrow(n)_1 = (0;0;1)$ và $arrow(n)_2 = (0;1;-sqrt(3))$:
  $ cos alpha = (|arrow(n)_1 dot arrow(n)_2|) / (|arrow(n)_1| dot |arrow(n)_2|) = sqrt(3)/2 => alpha = 30^o $.
  
  Cảnh báo: Nếu đánh giá $M N >= M J_2 - R_2$ thì kết quả sẽ *hoàn toàn sai* (đạt $1.11$) do $M$ không nằm trên mặt phẳng nghiêng. Bắt buộc phải sử dụng Công thức Vạn năng và Casio!
]
*Phương pháp Vạn năng (Chính xác)*
Ta áp dụng trực tiếp công thức khoảng cách tổng quát từ điểm $M in (C_1)$ đến mặt phẳng nghiêng $(P_2): y - sqrt(3)z = 0$ chứa $(C_2)$ (tâm $J_2(0; 3sqrt(3); 3)$, $R_2 = 2$):
$ d(M, (C_2))^2 = M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2) $
- Bước 1: $M(6 cos t, 6 sin t, 0) => M J_2^2 = 72 - 36 sqrt(3) sin t.$
- Bước 2: $d(M, P_2)^2 = (|6 sin t - sqrt(3) dot 0| / sqrt(1^2 + (-sqrt(3))^2))^2 = (|6 sin t| / 2)^2 = 9 sin^2 t.$
- Bước 3: Ráp công thức:
  $ F(t) = 72 - 36 sqrt(3) sin t + 4 - 4sqrt(72 - 36 sqrt(3) sin t - 9 sin^2 t) $
  $ = 76 - 36 sqrt(3) sin t - 4sqrt(72 - 36 sqrt(3) sin t - 9 sin^2 t) $
Dùng chức năng TABLE trên Casio quét $F(t)$ với $t in [0; 2 pi]$ (Start: 0, End: 2pi, Step: 2pi/40).
Ta tìm được giá trị cực tiểu của $F(t)$ xấp xỉ $8.028$ tại góc $t approx 1.18$ rad.
$ => M N_(min) = sqrt(F_(min)) = sqrt(8.028) approx 2.833 $ dm."""
    
    # Generate points for C1
    circle_pts1 = []
    for deg in range(0, 361, 5):
        rad = math.radians(deg)
        circle_pts1.append((6 * math.cos(rad), 6 * math.sin(rad), 0.0))
    pts_str1 = ", ".join([f"prj({p[0]:.4f}, {p[1]:.4f}, {p[2]:.4f})" for p in circle_pts1])

    # Generate points for C2
    circle_pts2 = []
    # u2 = (1, 0, 0), v2 = (0, sqrt(3)/2, 1/2)
    for deg in range(0, 361, 5):
        rad = math.radians(deg)
        px = 2 * math.cos(rad)
        py = 3 * math.sqrt(3) + 2 * math.sin(rad) * (math.sqrt(3)/2)
        pz = 3 + 2 * math.sin(rad) * 0.5
        circle_pts2.append((px, py, pz))
    pts_str2 = ", ".join([f"prj({p[0]:.4f}, {p[1]:.4f}, {p[2]:.4f})" for p in circle_pts2])

    # For pedagogical simplicity, we use a custom projection function inside cetz 
    # to show the side-view along the x-axis, making the 30-degree angle obvious.
    # prj(x, y, z) = (y, z) -> side view ignoring x (depth)
    # To retain 3D feel slightly, we add a very small x component
    
    fig = f"""cetz.canvas(length: 0.4cm, {{
    import cetz.draw: *
    
    // Phép chiếu góc nhìn chuẩn: Nghiêng nhẹ để thấy vòng tròn, 
    // nhưng vẫn giữ trực diện để thấy rõ góc 30 độ giữa hai mặt phẳng.
    let prj(x, y, z) = {{
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }}
    
    // Hệ trục
    line(prj(0,-1,0), prj(0,9,0), stroke: 0.4pt + gray) // Trục y
    line(prj(0,0,-1), prj(0,0,6), stroke: 0.4pt + gray) // Trục z
    content(prj(0,9.5,0), [$y$], anchor: "west")
    content(prj(0,0,6.5), [$z$], anchor: "south")
    circle(prj(0,0,0), radius: 1pt, fill: black)
    content(prj(0,0,0), [$O$], anchor: "north-west", padding: 2pt)
    
    // Mặt phẳng (P1): z=0
    line(prj(-7,-2,0), prj(7,-2,0), prj(7,8,0), prj(-7,8,0), close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // Đường tròn (C1)
    let pts1 = ({pts_str1})
    line(..pts1, stroke: 1.2pt + rgb("#16a34a"))
    
    // Mặt phẳng (P2): y - sqrt(3)z = 0 (Nghiêng 30 độ so với mặt z=0)
    let p2_1 = prj(-4, -1.73, -1)
    let p2_2 = prj(4, -1.73, -1)
    let p2_3 = prj(4, 10.39, 6)
    let p2_4 = prj(-4, 10.39, 6)
    line(p2_1, p2_2, p2_3, p2_4, close: true, fill: rgb("fef08a40"), stroke: 0.8pt + rgb("#ca8a04"))
    
    // Đường tròn (C2)
    let pts2 = ({pts_str2})
    line(..pts2, stroke: 1.2pt + rgb("#dc2626"))
    
    // Tâm J2
    let J2 = prj(0, {3*math.sqrt(3):.4f}, 3)
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south-east", padding: 2pt)
    
    // Điểm M và N (Ngắn nhất)
    let M = prj(0, 6, 0)
    
    // Điểm N trên C2 gần J2 nhất
    // Vector chỉ phương nghiêng 30 độ: (0, sqrt(3)/2, 1/2). Ta trừ R2 dọc theo vector này để về N.
    let n_dy = {2 * (math.sqrt(3)/2):.4f}
    let n_dz = {2 * 0.5:.4f}
    let N = prj(0, {3*math.sqrt(3):.4f} - n_dy, 3 - n_dz)
    
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "north", padding: 3pt)
    content(N, [$N$], anchor: "south", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#ea580c"))
    
    // Góc 30 độ minh họa
    arc(prj(0,0,0), radius: 1.5, start: 0deg, stop: 30deg, mode: "PIE", fill: rgb("ea580c40"), stroke: 0.5pt + rgb("#ea580c"))
    content(prj(0, 2.5, 0.6), text(size: 8pt, fill: rgb("#ea580c"))[$30^circ$])
  }})"""
    return stmt, "[$approx 2.833$]", sol, fig

def generate_all():
    # 6 theory illustrations
    f11 = draw_theory_cetz("1.1", scale=0.6)
    f12 = draw_theory_cetz("1.2", scale=0.6)
    f21 = draw_theory_cetz("2.1", scale=0.6)
    f22 = draw_theory_cetz("2.2", scale=0.6)
    f31 = draw_theory_cetz("3.1", scale=0.6)
    f32 = draw_theory_cetz("3.2", scale=0.6)
    f41 = draw_theory_cetz("4.1", scale=0.6)
    f42 = draw_theory_cetz("4.2", scale=0.6)
    
    output = get_typst_header(f11, f12, f21, f22, f31, f32, f41, f42)
    
    models = [
        generate_mod1_1, generate_mod1_2, generate_mod1_3,
        generate_mod2_1, generate_mod2_2, generate_mod2_3,
        generate_mod3_1, generate_mod3_2, generate_mod3_3, generate_mod3_4,
        generate_mod4_1, generate_mod4_2, generate_mod4_3, generate_mod5_1,
        generate_mod6_1, generate_mod6_2, generate_mod6_3,
        generate_mod6_4
    ]
    
    for i, func in enumerate(models):
        stmt, ans, sol, fig = func()
        output += f"""
#tln(
  [{stmt}],
  {ans},
  fig: {fig},
  fig-pos: "center",
  fig-width: 55%,
  loigiai: [
    {sol}
  ]
)
"""
    
    # 8 Practice Problems with detailed solutions
    output += """
#v(1.5em)
== B. BÀI TẬP TỰ LUYỆN PHÂN LOẠI CÓ HƯỚNG DẪN CHI TIẾT

Dưới đây là hệ thống bài tập tự luyện có lời giải chi tiết giúp học sinh tự củng cố tư duy và phương pháp:

#tln(
  [*Bài 1 (Đồng phẳng, lồng nhau):* Cho hai đường tròn $(C_1)$ và $(C_2)$ đồng phẳng trên mặt đất $z=0$. Vòng chạy ngoài $(C_1)$ có tâm $J_1(1;1;0)$, bán kính $R_1=8$. Vòng chạy trong $(C_2)$ có tâm $J_2(2;3;0)$, bán kính $R_2=3$. Tìm khoảng cách lớn nhất và nhỏ nhất giữa hai điểm $M in (C_1)$ và $N in (C_2)$?],
  [$M N_(min) = 5 - sqrt(5), M N_(max) = 11 + sqrt(5)$],
  loigiai: [
    *Bước 1 (Tính khoảng cách nối tâm):*
    Hai đường tròn nằm trên cùng mặt phẳng $z=0$. Tâm $J_1(1;1;0)$ và $J_2(2;3;0)$.
    $ J_1 J_2 = sqrt((2-1)^2 + (3-1)^2) = sqrt(1 + 4) = sqrt(5) $
    *Bước 2 (Xác định vị trí tương đối):*
    Hiệu hai bán kính là: $|R_1 - R_2| = |8 - 3| = 5$.
    Vì $J_1 J_2 = sqrt(5) approx 2.24 < |R_1 - R_2| = 5$, nên đường tròn $(C_2)$ nằm hoàn toàn phía trong đường tròn $(C_1)$ (hai đường tròn lồng nhau).
    *Bước 3 (Tìm cực trị khoảng cách):*
    - Khoảng cách ngắn nhất đạt được khi hai điểm $M, N$ nằm trên đoạn thẳng nối hai tâm và cùng phía:
      $ M N_(min) = R_1 - R_2 - J_1 J_2 = 8 - 3 - sqrt(5) = 5 - sqrt(5). $
    - Khoảng cách lớn nhất đạt được khi $M, N$ nằm ở hai đầu xa nhất đối diện trên đường nối hai tâm:
      $ M N_(max) = R_1 + R_2 + J_1 J_2 = 8 + 3 + sqrt(5) = 11 + sqrt(5). $
  ]
)

#tln(
  [*Bài 2 (Đồng phẳng, tiếp xúc ngoài):* Hai vòng tròn nhựa được đặt tiếp xúc ngoài với nhau trên bàn phẳng $z=0$. Vòng $(C_1)$ tâm $J_1(0;0;0)$, bán kính $R_1=5$. Vòng $(C_2)$ tâm $J_2(x_0; 0; 0)$ với $x_0 > 0$, bán kính $R_2=3$. Do hai vòng tiếp xúc ngoài nên $J_1 J_2 = R_1 + R_2 = 8$. Tìm khoảng cách lớn nhất giữa một điểm $M in (C_1)$ và một điểm $N in (C_2)$?],
  [$16$],
  loigiai: [
    *Bước 1:* Hai đường tròn đồng phẳng trên $z=0$, tiếp xúc ngoài nhau nên khoảng cách nối tâm đúng bằng tổng hai bán kính:
    $ J_1 J_2 = R_1 + R_2 = 5 + 3 = 8. $
    *Bước 2:* Với cấu hình đồng phẳng chéo nhau hoặc rời nhau (tiếp xúc ngoài), khoảng cách cực đại giữa hai điểm đạt được khi hai điểm nằm thẳng hàng với hai tâm và ở phía đối diện xa nhất ngoài cùng:
    $ M N_(max) = J_1 J_2 + R_1 + R_2 = 8 + 5 + 3 = 16. $
  ]
)

#tln(
  [*Bài 3 (Song song, đồng trục):* Hai vành thép chịu lực tròn nằm trên hai mặt phẳng song song $z=2$ và $z=10$. Vành dưới $(C_1)$ có tâm $J_1(1;2;2)$, bán kính $R_1=6$. Vành trên $(C_2)$ có tâm $J_2(1;2;10)$, bán kính $R_2=2$. Một thanh nối thẳng kết nối điểm $M in (C_1)$ và $N in (C_2)$. Tìm độ dài ngắn nhất và dài nhất của thanh nối này?],
  [$M N_(min) = 4 sqrt(5), M N_(max) = 8 sqrt(2)$],
  loigiai: [
    *Bước 1 (Tính chiều cao thẳng đứng):*
    Hai mặt phẳng $z=2$ và $z=10$ song song và cách nhau một khoảng $h = 10 - 2 = 8$.
    *Bước 2 (Chiếu phẳng):*
    Do hai tâm có cùng hoành độ và tung độ $J_1(1;2)$ và $J_2(1;2)$, đây là cấu hình song song đồng trục.
    Hình chiếu của $(C_2)$ xuống mặt phẳng chứa $(C_1)$ là đường tròn chiếu $(C_2')$ đồng tâm với $(C_1)$.
    *Bước 3 (Tìm cực trị khoảng cách):*
    - Khoảng cách ngang nhỏ nhất là:
      $ d_(\"ngang\", min) = |R_1 - R_2| = |6 - 2| = 4. $
    - Khoảng cách ngang lớn nhất là:
      $ d_(\"ngang\", max) = R_1 + R_2 = 6 + 2 = 8. $
    *Bước 4 (Tính khoảng cách không gian):*
    - Độ dài ngắn nhất của thanh nối:
      $ M N_(min) = sqrt(h^2 + d_(\"ngang\", min)^2) = sqrt(8^2 + 4^2) = sqrt(80) = 4 sqrt(5). $
    - Độ dài dài nhất của thanh nối:
      $ M N_(max) = sqrt(h^2 + d_(\"ngang\", max)^2) = sqrt(8^2 + 8^2) = sqrt(128) = 8 sqrt(2). $
  ]
)

#tln(
  [*Bài 4 (Song song, lệch trục chiếu cắt nhau):* Hai đường băng tập bay của flycam nằm trên hai tầng sân thượng song song. Đường băng 1 ở tầng $z=0$ có tâm $J_1(0;0;0)$, bán kính $R_1=4$. Đường băng 2 ở tầng $z=3$ có tâm $J_2(2;0;3)$, bán kính $R_2=3$. Hai hình chiếu vuông góc của hai đường băng này xuống mặt đất cắt nhau. Tìm khoảng cách ngắn nhất giữa hai flycam khi chúng bay trên hai quỹ đạo này?],
  [$3$],
  loigiai: [
    *Bước 1 (Xác định chiều cao đứng):*
    Khoảng cách thẳng đứng giữa hai tầng sân thượng chứa hai đường băng là $h = 3$.
    *Bước 2 (Xét hình chiếu phẳng):*
    Chiếu quỹ đạo $(C_2)$ xuống mặt đáy $z=0$ ta được đường tròn hình chiếu $(C_2')$ có tâm $J_2'(2;0;0)$ và bán kính $R_2=3$.
    *Bước 3 (Xét vị trí tương đối của hình chiếu):*
    Khoảng cách giữa hai tâm chiếu là $d = J_1 J_2' = 2$.
    Hiệu hai bán kính là $|R_1 - R_2| = 1$. Tổng hai bán kính là $R_1 + R_2 = 7$.
    Vì $|R_1 - R_2| = 1 < d = 2 < R_1 + R_2 = 7$, nên hai đường tròn chiếu cắt nhau tại hai điểm.
    *Bước 4 (Kết luận):*
    Tại giao điểm của hai quỹ đạo chiếu, khoảng cách ngang bằng $0$.
    Khi đó, khoảng cách ngắn nhất không gian chính bằng khoảng cách đứng đứng giữa hai mặt phẳng:
    $ M N_(min) = h = 3. $
  ]
)

#tln(
  [*Bài 5 (Song song, lệch trục chiếu rời nhau):* Hai vòng tròn đèn LED trang trí được lắp song song. Vòng dưới $(C_1)$ nằm trên $z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=3$. Vòng trên $(C_2)$ nằm trên $z=5$, tâm $J_2(6;8;5)$, bán kính $R_2=5$. Tính khoảng cách ngắn nhất giữa hai điểm bất kỳ trên hai vòng tròn đèn LED này?],
  [$sqrt(29)$],
  loigiai: [
    *Bước 1 (Xác định chiều cao đứng):*
    Khoảng cách giữa hai mặt phẳng chứa đèn LED song song là $h = 5$.
    *Bước 2 (Chiếu phẳng):*
    Chiếu vòng trên $(C_2)$ xuống mặt phẳng đáy $z=0$ ta được đường tròn hình chiếu $(C_2')$ có tâm $J_2'(6;8;0)$ và bán kính $R_2=5$.
    *Bước 3 (Tìm khoảng cách ngang ngắn nhất):*
    Khoảng cách nối hai tâm trên mặt phẳng chiếu:
    $ J_1 J_2' = sqrt(6^2 + 8^2) = 10. $
    Vì $J_1 J_2' = 10 > R_1 + R_2 = 3 + 5 = 8$, nên hai hình chiếu hoàn toàn rời ngoài nhau.
    Khoảng cách ngang ngắn nhất giữa hai viền tròn chiếu là:
    $ d_(\"ngang\", min) = J_1 J_2' - R_1 - R_2 = 10 - 3 - 5 = 2. $
    *Bước 4 (Tính khoảng cách không gian ngắn nhất):*
    $ M N_(min) = sqrt(h^2 + d_(\"ngang\", min)^2) = sqrt(5^2 + 2^2) = sqrt(29). $
  ]
)

#tln(
  [*Bài 6 (Vuông góc, trục cắt nhau):* Hai đường vành của bộ lọc ly tâm nằm trên hai mặt phẳng vuông góc. Vành 1 nằm trên $z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=5$. Vành 2 nằm trên $y=0$, tâm $J_2(8;0;6)$, bán kính $R_2=4$. Xác định khoảng cách ngắn nhất giữa hai vành tròn này?],
  [$3 sqrt(5) - 4$],
  loigiai: [
    *Bước 1 (Quy giản hình học về tâm):*
    Áp dụng đánh giá khoảng cách dưới về tâm đường tròn $J_2(8;0;6)$ của vành thứ hai:
    $ M N >= M J_2 - R_2 => M N_(min) = M J_(2, min) - R_2 $
    *Bước 2 (Tham số hóa điểm $M$):*
    Điểm $M$ thuộc đường tròn $(C_1)$ trong mặt phẳng $z=0$, tâm $J_1(0;0;0)$ và bán kính $R_1=5$ có dạng lượng giác:
    $ M(5 cos t, 5 sin t, 0) $ với $t in [0; 2 pi)$.
    *Bước 3 (Thiết lập khoảng cách và tìm cực tiểu):*
    Bình phương khoảng cách từ $M$ đến tâm cố định $J_2(8;0;6)$ là:
    $ M J_2^2 = (5 cos t - 8)^2 + (5 sin t - 0)^2 + (0 - 6)^2 $
    $ = 25 cos^2 t - 80 cos t + 64 + 25 sin^2 t + 36 $
    $ = 25(cos^2 t + sin^2 t) + 100 - 80 cos t = 125 - 80 cos t. $
    Để $M J_2$ nhỏ nhất thì $cos t$ phải lớn nhất bằng $1$ (khi $t = 0$, điểm $M(5;0;0)$).
    $ M J_(2, min) = sqrt(125 - 80(1)) = sqrt(45) = 3 sqrt(5). $
    *Bước 4 (Kết luận):*
    Khoảng cách cực tiểu giữa hai đường vành là:
    $ M N_(min) = M J_(2, min) - R_2 = 3 sqrt(5) - 4. $
  ]
)

#tln(
  [*Bài 7 (Vuông góc, lệch trục):* Trong không gian $O x y z$, đường tròn $(C_1)$ nằm trên mặt phẳng $z=0$, tâm $J_1(0;0;0)$, bán kính $R_1=3$. Đường tròn $(C_2)$ nằm trên mặt phẳng $y=3$, tâm $J_2(5;3;12)$, bán kính $R_2=4$. Tìm khoảng cách ngắn nhất giữa hai đường tròn?],
  [$approx 8.364$],
  loigiai: [
    *Phân tích:* Do hai mặt phẳng $z=0$ và $y=3$ vuông góc nhau, ta không thể dùng bất đẳng thức $M N >= M J_2 - R_2$ (dấu bằng không xảy ra). Ta phải dùng Phương pháp Vạn năng.
    
    *Bước 1 (Thiết lập)*
    - Điểm $M in (C_1)$ trên $z=0$, $J_1(0;0;0)$, $R_1=3$: $M(3 cos t, 3 sin t, 0)$.
    - Đường tròn $(C_2)$ trên $y=3$, $J_2(5;3;12)$, $R_2=4$.
    - Khoảng cách đến tâm: $M J_2^2 = (3 cos t - 5)^2 + (3 sin t - 3)^2 + 144 = 187 - 6(5 cos t + 3 sin t)$.
    - Khoảng cách đến mặt phẳng: $d(M, P_2)^2 = (|3 sin t - 3|)^2 = 9 - 18 sin t + 9 sin^2 t$.
    
    *Bước 2 (Hàm Vạn năng & Bấm máy)*
    $ F(t) = M J_2^2 + 16 - 8 sqrt(M J_2^2 - d(M, P_2)^2) $
    Sử dụng chức năng TABLE của máy tính Casio để quét hàm số trên đoạn $t in [0; 2 pi]$.
    Tìm được giá trị cực tiểu của $F(t) approx 69.967$ tại $t approx 0.62$ rad.
    $ => M N_(min) = sqrt(F_(min)) approx 8.364. $
    (Nếu dùng cách quy giản sai lầm ta sẽ ra đáp án $sqrt(187 - 6 sqrt(34)) - 4 approx 7.22$, một cái bẫy điển hình trong đề thi!)
  ]
)

#tln(
  [*Bài 8 (Ứng dụng thực tế - Tránh va chạm vệ tinh):* Hai vệ tinh dự báo thời tiết chuyển động tròn đều trong không gian. Quỹ đạo vệ tinh 1 là đường tròn $(C_1)$ trên mặt phẳng $(P_1): 2x - 2y + z - 4 = 0$ có tâm $J_1(1;0;2)$, bán kính $R_1=2$. Quỹ đạo vệ tinh 2 là đường tròn $(C_2)$ trên mặt phẳng song song $(P_2): 2x - 2y + z - 13 = 0$ có tâm $J_2(3;-1;5)$, bán kính $R_2=1$. Xác định khoảng cách gần nhau nhất giữa hai vệ tinh trong quá trình vận hành?],
  [$3$],
  loigiai: [
    *Bước 1 (Tính chiều cao đứng giữa hai mặt phẳng song song):*
    $ h = d((P_1), (P_2)) = (|4 - 13|)/sqrt(2^2 + (-2)^2 + 1^2) = 9/3 = 3. $
    *Bước 2 (Chiếu vuông góc tìm tâm chiếu):*
    Đường thẳng qua tâm $J_2(3;-1;5)$ vuông góc với $(P_1)$ có dạng: $x = 3+2t, y = -1-2t, z = 5+t$.
    Giao điểm với mặt phẳng $(P_1)$ là:
    $ 2(3+2t) - 2(-1-2t) + (5+t) - 4 = 0 => 9t + 9 = 0 => t = -1. $
    Tọa độ tâm hình chiếu là $J_2'(1; 1; 4)$.
    *Bước 3 (Xét vị trí tương đối trên mặt phẳng chiếu):*
    Khoảng cách nối hai tâm trên mặt phẳng chiếu là:
    $ J_1 J_2' = sqrt((1-1)^2 + (1-0)^2 + (4-2)^2) = sqrt(5) approx 2.24. $
    Xét hai đường tròn chiếu: $(C_1)$ tâm $J_1(1;0;2)$ bán kính $R_1 = 2$, và đường tròn chiếu của $(C_2)$ có tâm $J_2'(1;1;4)$ bán kính $R_2 = 1$.
    Vì $|R_1 - R_2| = 1 < J_1 J_2' = sqrt(5) < R_1 + R_2 = 3$, nên hai quỹ đạo chiếu cắt nhau.
    *Bước 4 (Kết luận):*
    Vì hình chiếu của hai quỹ đạo cắt nhau, tồn tại thời điểm khoảng cách ngang bằng $0$.
    Khi đó, khoảng cách ngắn nhất giữa hai vệ tinh bằng khoảng cách đứng:
    $ M N_(min) = h = 3. $
  ]
)
"""
    return output
if __name__ == "__main__":
    content = generate_all()
    with open("../typst/exams/CD-min-2-DuongTron-ChuyenSau.typ", "w", encoding="utf-8") as f:
        f.write(content)
    print("Generated CD-min-2-DuongTron-ChuyenSau.typ successfully!")
