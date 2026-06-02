#import "../_theme.typ": *

== 9. Chọn Hệ Trục: Quyết Định Một Nửa Bài Giải

#why-box[
  Rất nhiều bài tọa độ phẳng không khó vì đại số nặng. Chúng khó vì hệ trục được đặt dở. Một hệ trục tốt làm đối xứng lộ ra, phương trình gọn lại, và phần tính toán trở nên có nghĩa. Một hệ trục kém khiến người học tự trói mình vào những biểu thức dài mà hình học ban đầu không hề đòi hỏi.
]

#vd-box("8", "Đặt gốc ở trung điểm thì được lợi gì?")[
  Nếu bài toán xoay quanh hai điểm đối xứng $A$ và $B$, đặt gốc tọa độ ở trung điểm của $A B$ thường là một quyết định rất mạnh. Khi đó $A$ và $B$ có thể mang tọa độ dạng $(-a, 0)$ và $(a, 0)$. Nhiều biểu thức khoảng cách, nhiều điều kiện đối xứng, và cả các phương trình conic đều trở nên gọn bất ngờ.

  Một hệ trục thông minh không chỉ giúp tính nhanh hơn. Nó giúp bài toán lộ cấu trúc thật của mình.
]

#vd-box("8b", "So sánh hai cách chọn hệ trục trong tam giác cân")[
  Cho tam giác $A B C$ cân tại $A$. Gọi $M$ là một điểm bất kỳ trên cạnh đáy $B C$. Chứng minh hệ thức:
  $ A B^2 = A M^2 + M B dot M C $
  
  - *Cách chọn 1 (Chưa tối ưu):* Đặt gốc $O$ tại $B$, trục $O x$ đi qua $C$, trục $O y$ đi qua $B$ vuông góc với $B C$. Khi đó $B(0, 0)$, $C(a, 0)$, $A(a/2, h)$, và $M(x, 0)$ với $0 <= x <= a$. Khoảng cách $A M^2 = (x - a/2)^2 + h^2$ sẽ xuất hiện số hạng chéo $-a x$, khiến việc rút gọn đại số trở nên cồng kềnh.
  - *Cách chọn 2 (Tối ưu nhờ đối xứng):* Chọn gốc $O$ là trung điểm của cạnh đáy $B C$. Vì tam giác $A B C$ cân tại $A$, đường trung trực $A O$ vuông góc với $B C$. Ta chọn trục tung $O y$ đi qua $A$.
    Khi đó tọa độ các điểm rất đẹp:
    $ B(-a, 0), quad C(a, 0), quad A(0, h), quad M(x, 0) quad (-a <= x <= a) $
    Ta tính trực tiếp:
    - $A B^2 = (0 - (-a))^2 + (h - 0)^2 = a^2 + h^2$
    - $A M^2 = (0 - x)^2 + (h - 0)^2 = x^2 + h^2$
    - $M B = x - (-a) = a + x$ và $M C = a - x$, suy ra $M B dot M C = (a + x)(a - x) = a^2 - x^2$.
    
    Cộng lại ta được:
    $ A M^2 + M B dot M C = (x^2 + h^2) + (a^2 - x^2) = a^2 + h^2 = A B^2 $ (đpcm).
    
    Phép toán chỉ mất đúng hai dòng nhờ sự triệt tiêu tự nhiên của $x^2$. Đó là sức mạnh của việc đặt hệ quy chiếu thông minh!
]

#tech-box[
  Một vài quy tắc chọn hệ trục thường rất hiệu quả:

  - nếu hình có tâm đối xứng, đặt gốc tại tâm,
  - nếu có một trục đối xứng rõ, chọn nó làm một trục tọa độ,
  - nếu một đoạn hay một đường là nhân vật chính, cho nó nằm trên trục $O x$,
  - nếu bài có đường tròn, cân nhắc đặt tâm tại gốc,
  - nếu bài có conic, cố chọn hệ trục khớp với trục chính của conic.
]

#essay-box("Hệ trục tốt không làm mất hình học")[
  Nhiều người sợ rằng một khi đã đặt tọa độ, bài toán sẽ rơi vào đại số khô. Nỗi sợ ấy chỉ đúng khi hệ trục được chọn một cách mù quáng. Nếu chọn tốt, tọa độ không giết trực giác; nó chỉ ghi trực giác ra bằng ký hiệu. Một hệ trục tốt chính là hình học được nén lại gọn hơn.
]

#bridge-box("Từ chọn hệ trục sang xưởng Descartes")[
  Xưởng Descartes của quyển này sẽ không bắt đầu bằng những công thức rời, mà bắt đầu bằng nghệ thuật đặt hệ quy chiếu. Bởi cùng một bài toán, thay hệ trục là thay luôn độ khó của phần còn lại.
]
