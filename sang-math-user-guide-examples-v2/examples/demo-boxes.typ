#import "../lib.typ": ds, sang-setup, True
#show: sang-setup
#set page(width: 800pt, height: auto, margin: 20pt)
#set text(font: "New Computer Modern", size: 14pt)

#align(center)[#text(size: 24pt, fill: rgb("#e11d48"), weight: "bold")[CÁC KIỂU DÁNG HỘP CÂU HỎI ĐÚNG/SAI]]
#v(10pt)

#ds([Đây là mẫu mặc định (List Style), phù hợp với đề thi đại trà.],
  (
    True([Mệnh đề A đúng.]),
    [$2 + 2 = 5$ là mệnh đề sai.],
  )
)

#ds([Kiểu dáng Folder (ds-style: "folder"), mang phong cách hiện đại như các tab tài liệu.],
  (
    True([Đạo hàm của $x^2$ là $2x$.]),
    [$sin(x)$ là hàm số chẵn.],
  ),
  ds-style: "folder"
)

#ds([Kiểu dáng Bookmark (ds-style: "bookmark"), nhãn dải băng đẹp mắt.],
  (
    True([Hàm số mũ $y=e^x$ luôn đồng biến trên $RR$.]),
    [Đồ thị hàm số logarit có tiệm cận ngang.],
  ),
  ds-style: "bookmark"
)

#ds([Kiểu dáng Diamond (ds-style: "diamond"), phong cách khối tinh thể tinh tế.],
  (
    True([Khối chóp tứ giác đều có mặt đáy là hình vuông.]),
    [Khối bát diện đều có 6 đỉnh.],
  ),
  ds-style: "diamond"
)

#ds([Kiểu dáng Pill (ds-style: "pill"), viền bo tròn hoàn toàn tạo sự mềm mại.],
  (
    True([Hình lăng trụ có mặt bên là hình bình hành.]),
    [Hình trụ không có tâm đối xứng.],
  ),
  ds-style: "pill"
)
