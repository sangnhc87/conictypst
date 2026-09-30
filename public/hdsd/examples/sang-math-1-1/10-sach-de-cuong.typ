// Tình huống 10: Sách đề cương 1.0.6 vẫn chạy với package 1.1.
#import "@local/sang-math:1.1.0": *

#show: decuong-book.with(
  title: "ĐỀ CƯƠNG TOÁN 10 HỌC KỲ I",
  author: "Giáo viên bộ môn Toán",
  school: "TRƯỜNG THPT SANG MATH",
  subject: "MÔN TOÁN — LỚP 10",
  year: "NĂM HỌC 2026–2027",
  mode: sys.inputs.at("mode", default: "dethi"),
  show-cover: false,
  show-toc: false,
)

#chuong("MỆNH ĐỀ VÀ TẬP HỢP", mau: C1)
#bai("MỆNH ĐỀ TOÁN HỌC", mau: C1)
#dang("Suy luận bằng bảng", mau: C1)
#phuong-phap(mau: C1)[Dùng bảng để loại trường hợp sai và ghi kết luận.]
#bai-tap-tu-luan(mau: C1)[
  #bt-item(1, [Chứng minh tổng hai số chẵn là số chẵn.], loigiai: [Nếu $a=2m$, $b=2n$ thì $a+b=2(m+n)$.])
]
#bai-tap-trac-nghiem(mau: C1)
#tn(dir: "ngang", [Giá trị của $1+1$ bằng], ([$1$], True([$2$]), [$3$], [$4$]), loigiai: [$1+1=2$.])
