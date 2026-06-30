# Thêm Hình Vẽ (Cetz Diagrams) Cho Bài Toán Derangement

Bạn nhận xét rất đúng! Một hình vẽ trực quan sẽ giúp học sinh dễ hình dung thế nào là "không có phần tử nào nằm đúng vị trí" (Derangement).

## Đề Xuất Bổ Sung

Mình sẽ bổ sung 2 hình vẽ trực quan (dùng package `cetz` của Typst) vào phần **Chủ đề 16 — Bài Toán Hoán Vị Không Điểm Bất Động**:

1. **Hình vẽ minh hoạ khái niệm (Phong bì và Bức thư)**: 
   - Minh hoạ trường hợp $n=3$.
   - Vẽ 3 chiếc phong bì có đánh số (1, 2, 3) và 3 bức thư (1, 2, 3).
   - Vẽ các mũi tên (hoặc đường cong) chỉ ra một cách xếp nhầm hoàn toàn: Thư 1 vào Phong bì 2, Thư 2 vào Phong bì 3, Thư 3 vào Phong bì 1.

2. **Hình vẽ đồ thị chu trình (Cyclic Graph)**:
   - Một derangement không có điểm bất động nghĩa là phân tích chu trình của nó không chứa chu trình độ dài 1 (vòng lặp tại chỗ).
   - Sẽ có một hình nhỏ minh hoạ chu trình $1 \to 2 \to 3 \to 1$ để thể hiện sự "lộn xộn" của hoán vị không điểm bất động.

## Triển Khai
Mình sẽ dùng code `cetz.canvas` để nhúng trực tiếp vào file `CD-DaiSo-ToHop-content.typ` ở mục "Khái Niệm Cơ Bản" của Chủ đề 16.

Bạn thấy ý tưởng hình vẽ này đã đủ trực quan cho học sinh phổ thông chưa?
