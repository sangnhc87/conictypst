#import "../style.typ": lesson-box, teacher-note, checkpoint
#import "../mien-he.typ": sm-mien-he-bpt
#import "/public/hdsd/typst/sang-math-geom.typ": sm-diem, sm-red

= Tiết 3 · Đỉnh miền nghiệm và tối ưu tuyến tính

== Vì sao cần tìm các đỉnh?

Giả sử một miền nghiệm là đa giác *bị chặn và khác rỗng*, kể cả các bờ. Với hàm tuyến tính $P(x,y)=a x+b y$, giá trị lớn nhất và nhỏ nhất trên miền đều đạt được ở *ít nhất một đỉnh*. Có thể có cả một cạnh cùng đạt cực trị; lúc đó hai đầu cạnh đều là đỉnh đạt cực trị.

#lesson-box([Chú ý phạm vi áp dụng], [
  Không áp dụng máy móc quy tắc “chỉ xét đỉnh” cho miền rỗng, miền không bị chặn hoặc miền có bờ mở. Khi miền không bị chặn, phải xét khả năng hàm tăng vô hạn; khi bờ mở, cực trị có thể chỉ là cận mà không đạt được.
], accent: rgb("#b45309"), fill: rgb("#fffbeb"))

== Ví dụ giải trọn vẹn

Trên miền $S: cases(x >= 0, y >= 0, 2x+y <= 8, x+2y <= 10)$, tìm giá trị lớn nhất của $P=3x+2y$.

*Bước 1.* Các đỉnh của $S$ là $O(0;0)$, $A(4;0)$, $B(2;4)$, $C(0;5)$.

*Bước 2.* Tính giá trị hàm tại từng đỉnh:

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  inset: 7pt,
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#dbeafe") } else { white },
  [Đỉnh], [$O(0;0)$], [$A(4;0)$], [$B(2;4)$], [$C(0;5)$],
  [$P$], [$0$], [$12$], [$14$], [$10$],
)

So sánh $0,12,14,10$ suy ra $P_max=14$, đạt duy nhất ở $B(2;4)$.

#align(center)[
  #sm-mien-he-bpt((
    (a: -1, b: 0, c: 0, strict: false),
    (a: 0, b: -1, c: 0, strict: false),
    (a: 2, b: 1, c: 8, strict: false),
    (a: 1, b: 2, c: 10, strict: false),
  ), xmin: -1, xmax: 6, ymin: -1, ymax: 6, w: 7.4cm,
  them: (ctx, d) => { for p in d.vertices { sm-diem(ctx, p, mau: sm-red) } })
]

== Khi cả một cạnh cùng tối ưu

Trên tam giác $x>=0$, $y>=0$, $x+y<=4$, giá trị lớn nhất của $x+y$ là $4$. *Mọi điểm* trên đoạn nối $(4;0)$ và $(0;4)$ đều đạt, không chỉ hai đầu mút. Hai đỉnh này vẫn giúp phát hiện giá trị cực đại, còn hình học cho biết *toàn bộ tập phương án tối ưu*.

== Hai trường hợp không được suy luận vội

- Miền $x>=0$, $y>=0$, $x+y>=2$ không bị chặn. Hàm $P=x+y$ có giá trị *nhỏ nhất* bằng $2$ trên một đoạn bờ, nhưng *không có giá trị lớn nhất*.
- Miền $x>=0$, $y>=0$, $x+y>2$ có cận dưới của $x+y$ là $2$, song *không có giá trị nhỏ nhất* vì bờ $x+y=2$ bị loại.

#teacher-note([
  Cho nhóm học sinh khá giải thích câu “ít nhất một đỉnh”. Cho nhóm cần hỗ trợ lập bảng giá trị từng đỉnh trước, rồi mới thảo luận về cạnh tối ưu và biên mở.
])

#checkpoint("03")
