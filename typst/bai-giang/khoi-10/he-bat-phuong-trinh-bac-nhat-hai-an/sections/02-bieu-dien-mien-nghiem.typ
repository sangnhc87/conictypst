#import "../style.typ": lesson-box, teacher-note, checkpoint
#import "../mien-he.typ": sm-mien-he-bpt
#import "/public/hdsd/typst/sang-math-geom.typ": sm-diem, sm-red

= Tiết 2 · Biểu diễn miền nghiệm trên mặt phẳng

#lesson-box([Ý tưởng hình học], [
  Mỗi bất phương trình bậc nhất hai ẩn cho một nửa mặt phẳng. Miền nghiệm của hệ là *phần giao* của tất cả các nửa mặt phẳng ấy. Phần giao có thể bị chặn, không bị chặn hoặc rỗng.
], accent: rgb("#047857"), fill: rgb("#ecfdf5"))

== Quy trình bốn bước có thể kiểm tra được

1. Với từng bất phương trình, thay dấu bất đẳng thức bằng $=$ để có đường bờ. Dùng hai giao điểm với trục hoặc hai điểm dễ tính để dựng đường.
2. Dùng nét liền cho $<=$, $>=$ và nét đứt cho $<$, $>$.
3. Chọn một điểm *không thuộc đường bờ* để thử dấu. $O(0;0)$ tiện nhất nếu $O$ không nằm trên bờ; nếu $O$ nằm trên bờ thì chọn điểm khác như $(1;0)$ hoặc $(0;1)$.
4. Chỉ tô phần đồng thời thỏa *mọi* điều kiện. Kiểm tra lại một điểm trong phần tô và một điểm ngoài phần tô.

== Ví dụ mẫu: miền khả thi của xưởng mộc

Xét $S: cases(x >= 0, y >= 0, 2x+y <= 8, x+2y <= 10)$.

- Hai điều kiện đầu giữ lại góc phần tư thứ nhất.
- Bờ $2x+y=8$ đi qua $(4;0)$ và $(0;8)$. Thử $O$: $0<=8$, nên lấy phía chứa $O$.
- Bờ $x+2y=10$ đi qua $(10;0)$ và $(0;5)$. Thử $O$: $0<=10$, nên lấy phía chứa $O$.
- Giao hai bờ xiên được từ $cases(2x+y=8, x+2y=10)$, suy ra $(x;y)=(2;4)$.

#align(center)[
  #sm-mien-he-bpt((
    (a: -1, b: 0, c: 0, strict: false),
    (a: 0, b: -1, c: 0, strict: false),
    (a: 2, b: 1, c: 8, strict: false),
    (a: 1, b: 2, c: 10, strict: false),
  ), xmin: -1, xmax: 6, ymin: -1, ymax: 6, w: 10.6cm,
  them: (ctx, d) => { for p in d.vertices { sm-diem(ctx, p, mau: sm-red) } })
]

Miền tô xanh là tứ giác có các đỉnh $(0;0)$, $(4;0)$, $(2;4)$, $(0;5)$. Các bờ được lấy vì mọi dấu đều không nghiêm ngặt. Lưu ý: trên bờ $2x+y=8$, chỉ *đoạn* từ $(4;0)$ đến $(2;4)$ thỏa toàn hệ, không phải cả đường thẳng.

#pagebreak()

== Biên mở, miền rỗng và miền không bị chặn

Với $x>=1$, $y>0$, $x+y<4$, hai bờ $y=0$ và $x+y=4$ được vẽ nét đứt; bờ $x=1$ được vẽ nét liền. Điểm $(1;1)$ thuộc miền; các điểm $(1;0)$, $(1;3)$ đều bị loại.

#align(center)[
  #sm-mien-he-bpt((
    (a: -1, b: 0, c: -1, strict: false),
    (a: 0, b: -1, c: 0, strict: true),
    (a: 1, b: 1, c: 4, strict: true),
  ), xmin: -0.5, xmax: 4.5, ymin: -0.5, ymax: 4.5, w: 8.7cm)
]

Nếu hệ chứa $x+y<=1$ và $x+y>=3$, phần giao rỗng vì không có số nào vừa $<=1$ vừa $>=3$. Ngược lại, hệ $x>=0$, $y>=0$, $x+y>=2$ có miền kéo dài vô hạn.

== Đối chiếu hình vẽ bằng phép thế

Hãy thử ba điểm trên hình vừa vẽ. $(1;1)$ thỏa $x>=1$, $y>0$ và $x+y<4$. Điểm $(1;0)$ không thỏa $y>0$; điểm $(1;3)$ không thỏa $x+y<4$. Vì thế hình tô màu *chỉ là cách nhìn*, còn phép thế vào đủ các điều kiện là cách xác nhận kết quả.

Nếu gốc $O$ nằm ngay trên đường bờ, không dùng $O$ để quyết định tô bên nào. Chẳng hạn với $x+y>=0$, $O$ cho dấu bằng ở cả hai phía; thử $(1;0)$ và $(-1;0)$ mới phân biệt được phía nghiệm.

#lesson-box([Bài tập chuyển giao], [
  Tự vẽ miền $T: cases(x>=0,y>=0,x+y<=4,x+2y<=6)$. Gợi ý: bắt đầu từ góc phần tư thứ nhất, tìm giao của hai bờ xiên và giao với các trục. Hãy liệt kê các đỉnh và giải thích tại sao mọi cạnh của miền đều được lấy.
], accent: rgb("#115e8c"), fill: rgb("#eff6ff"))

#teacher-note([
  Ở hình có bờ mở, phần tô màu chỉ giúp nhìn phía nghiệm; tính “lấy bờ” phải đọc theo nét liền/nét đứt. Học sinh thường tô đúng phía nhưng quên xét bờ hoặc tô cả đường thay cho đoạn thỏa toàn hệ. Bài tập chuyển giao có bốn đỉnh $(0;0)$, $(4;0)$, $(2;2)$, $(0;3)$; mọi bờ đều được lấy vì các dấu đều là $<=$ hoặc $>=$.
])

#checkpoint("02")
