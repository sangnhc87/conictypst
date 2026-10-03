#import "../style.typ": lesson-box, teacher-note, checkpoint

= Tiết 1 · Từ tình huống đến hệ bất phương trình

#lesson-box([Đích học tập], [
  Sau tiết học, học sinh lập được một hệ từ giới hạn nguồn lực, kiểm tra một cặp số có là nghiệm của hệ hay không, và giải thích được sự khác nhau giữa dấu $<$ với $<=$.
], accent: rgb("#047857"), fill: rgb("#ecfdf5"))

== Khởi động: Xưởng mộc cần chọn phương án nào?

Một xưởng làm *bàn* và *ghế*. Gọi $x$ là số bàn, $y$ là số ghế. Một bàn dùng $2$ m² gỗ và $1$ giờ công; một ghế dùng $1$ m² gỗ và $2$ giờ công. Xưởng có tối đa $8$ m² gỗ và $10$ giờ công.

- Gỗ đã dùng: $2x+y$. Từ “tối đa” cho $2x+y <= 8$.
- Giờ công đã dùng: $x+2y$. Từ “tối đa” cho $x+2y <= 10$.
- Số sản phẩm không âm: $x >= 0$ và $y >= 0$.

Vậy điều kiện khả thi là

$ cases(x >= 0, y >= 0, 2x+y <= 8, x+2y <= 10) $

#teacher-note([
  Cho học sinh đề xuất vài cặp $(x;y)$ trước khi đưa định nghĩa. Hỏi riêng phương án $(4;4)$: thỏa gỗ không? Cách đặt câu hỏi này làm rõ rằng một điều kiện đúng chưa đủ.
])

== Khái niệm và cách thử nghiệm

#lesson-box([Định nghĩa], [
  *Hệ bất phương trình bậc nhất hai ẩn* gồm từ hai bất phương trình bậc nhất theo $x,y$ trở lên. Một cặp số $(x_0;y_0)$ là *nghiệm của hệ* khi thay vào thì *tất cả* các bất phương trình đều đúng. Tập tất cả các nghiệm là *miền nghiệm* của hệ.
])

Với phương án $(2;4)$: $2x+y=2 times 2+4=8$, $x+2y=2+2 times 4=10$. Cả hai giới hạn được dùng hết, và $x,y$ không âm; đây là một nghiệm.

Với $(4;2)$: gỗ $2 times 4+2=10>8$, nên *không* là nghiệm, dù điều kiện giờ công $4+2 times 2=8<=10$ vẫn đúng.

*Quy trình kiểm tra một điểm:* ghi rõ tọa độ, thay vào *từng* vế trái, so sánh với vế phải, sau cùng mới kết luận về *toàn hệ*. Nếu một điều kiện sai, dừng và chỉ ra điều kiện đó.

== Đường bờ và ý nghĩa của dấu bằng

Đường thẳng $a x+b y=c$ là *đường bờ* của nửa mặt phẳng $a x+b y<=c$ hoặc $a x+b y<c$. Ta cần $(a,b) != (0,0)$ để đó thực sự là bất phương trình bậc nhất hai ẩn.

- Dấu $<=$ hoặc $>=$ *lấy cả đường bờ*; khi vẽ dùng nét liền.
- Dấu $<$ hoặc $>$ *loại đường bờ*; khi vẽ dùng nét đứt.
- Điểm nằm trên bờ cho $a x+b y=c$. Vì vậy nó thỏa $a x+b y<=c$ nhưng không thỏa $a x+b y<c$.

Ví dụ, $(1;3)$ nằm trên $x+y=4$: là nghiệm của $x+y<=4$, không là nghiệm của $x+y<4$.

#lesson-box([Lỗi thường gặp], [
  Không bỏ điều kiện $x,y>=0$ khi $x,y$ là số lượng; không suy từ “thỏa một bất phương trình” thành “thỏa hệ”; không đổi “nhiều nhất” thành dấu $>=$.
], accent: rgb("#b45309"), fill: rgb("#fffbeb"))

#checkpoint("01")
