#import "../lib.typ": exam-template-names, book-template-names, sang-setup, dfrac, tfrac, tfrac-tex, draw-parabola, draw-ellipse, draw-hyperbola, draw-cylinder, draw-cone, draw-sphere, draw-helix, draw-spring

#assert(exam-template-names.len() >= 18, message: "Thiếu danh sách giao diện đề thi")
#assert(book-template-names.len() >= 12, message: "Thiếu danh sách giao diện sách")

// Việc import tường minh ở trên là contract test: compile sẽ lỗi ngay nếu một
// API cao cấp có trong source nhưng chưa được export từ lib.typ.
= sang-math public API

- #exam-template-names.len() giao diện đề thi
- #book-template-names.len() giao diện sách/chuyên đề
- Phân số: $dfrac(1, 2)$ lớn mặc định; $tfrac(1, 2)$ và `tfrac-tex` nhỏ có chủ ý
- Conic: `draw-parabola`, `draw-ellipse`, `draw-hyperbola`
- Khối tròn xoay: `draw-cylinder`, `draw-cone`, `draw-sphere`
- Đường cong 3D: `draw-helix`, `draw-spring`
