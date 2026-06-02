# Bo doi hinh hoc: tach 2D va 3D

## Quyển 2D

- Driver de xay: `typst/sach/hinh-hoc-phang-chuong5/hinh-hoc-phang-khai-mo.typ`
- Truc noi dung: Euclide phang -> quỹ tích, tam giác, đường tròn, biến hình -> Oxy, đường thẳng, đường tròn, conic -> tối ưu hình phẳng.
- Nguon nen hut ve:
  - `typst/exams/CD-Conic-DayDu.typ`: chỉ hút các lớp nội dung conic phẳng, Oxy, quỹ tích, tiếp tuyến, diện tích miền phẳng.
  - `typst/sach/ung-dung-dao-ham/02-toi-uu-hinh-phang-mo-rong.typ`: hút sang phần cực trị hình phẳng và mô hình hóa.
  - `typst/questions/lop12-hinh-hoc.typ`: chỉ hút cụm `ELIP, CONIC (Hình học giải tích phẳng)` làm bài tập ngân hàng.
  - `typst/geometry.typ`, `typst/hinh-mau.typ`: hạ tầng dựng hình cho phần Euclide.
- Khong nen de o quyển 2D:
  - các phần cắt nón, thiết diện không gian, khối quay, Oxyz 3D.
  - các bài động học, cảm biến, radar cần vectơ hoặc Oxyz.

## Quyển 3D

- Driver de xay: `typst/sach/hinh-hoc-khong-gian-chuong6/hinh-hoc-khong-gian-khai-mo.typ`
- Truc noi dung: không gian Euclide -> hình chiếu, thiết diện, song song, vuông góc -> vectơ 3D -> Oxyz -> mô hình hóa không gian.
- Nguon nen hut ve:
  - `typst/sach/vecto-3d-chuong2/`: hút làm lõi vectơ và hệ trục 3D.
  - `typst/sach/oxyz-chien-thuat/`: hút làm xưởng ứng dụng Oxyz và mô hình hóa.
  - `typst/questions/lop12-hinh-hoc.typ`: hút toàn bộ cụm hình học không gian và Oxyz.
  - `typst/exams/CD-DuongThang-Oxyz.typ`, `typst/exams/CD-MatCau.typ`, `typst/exams/CD-Oxyz-ChuyenDong-CamBien.typ`, `typst/exams/Parabol-Oxyz.typ`, `typst/exams/CD-Thiet-Dien-Parabol-Hinh-Non.typ`: hút theo module ứng dụng.
- Khong nen de o quyển 3D:
  - các chương conic phẳng thuần túy không cần bước sang không gian.
  - các bài tối ưu hình phẳng thuần 2D nếu không có ý tưởng không gian.

## Nguyen tac tranh chong cheo

- Quyển 2D giữ các đối tượng sống trọn trong mặt phẳng.
- Quyển 3D giữ các đối tượng cần hình khối, mặt phẳng phụ, vectơ hoặc Oxyz.
- Nếu một file monolithic chứa cả 2D và 3D, hãy tách theo “đối tượng hình học” thay vì theo file gốc.
- Với các file lớn kiểu `CD-Conic-DayDu.typ`, chỉ hút từng lớp nội dung sang đúng quyển; không include nguyên file vào một driver mới.