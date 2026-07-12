# Bộ file mẫu sử dụng `sang-math`

Mục tiêu của thư mục này là giúp người dùng mở từng file `.typ` để học cách dùng package `sang-math` theo đúng cấu trúc lệnh.

## Cách chạy trong repo package

Các file mẫu đặt trong thư mục `examples/`, vì vậy dòng import chuẩn là:

```typ
#import "../lib.typ": *
```

Nếu đã cài package local bằng `install.sh` và muốn copy ví dụ ra nơi khác, đổi dòng import thành:

```typ
#import "@local/sang-math:1.0.0": *
```

## Quy ước ID câu hỏi

Quy ước khuyến nghị trong bộ mẫu này là đặt ID ngay sau tên lệnh:

```typ
#tn([Nội dung câu hỏi], ([$A$], True([$B$]), [$C$], [$D$]))
#ds([Nội dung câu hỏi], (True([Mệnh đề đúng]), [Mệnh đề sai]))
#tln([Nội dung câu hỏi], [$Đáp án$])
#tl([Nội dung câu hỏi], loigiai: [Lời giải])
```

Cú pháp `id:` vẫn là cú pháp có thể đọc được trong macro, nhưng không dùng làm kiểu chính trong bộ mẫu. Nếu cần ghi chú kiểu cũ thì viết đúng dạng:

```typ
// #tln(id: "TLN01",
//   [Tính giá trị $f(2)$ với $f(x)=x^2+1$.],
//   [$5$],
// )
```

Không viết kiểu dễ gây nhầm như đặt `id:` ở cuối ví dụ hướng dẫn.

## Danh sách file

- `00-index.typ`: mục lục ví dụ.
- `01-quy-uoc-id-import.typ`: import, ID, mode đề/lời giải.
- `02-cau-trac-nghiem.typ`: trắc nghiệm nhiều phương án.
- `03-dung-sai-tra-loi-ngan.typ`: đúng-sai và trả lời ngắn.
- `04-tu-luan-loi-giai.typ`: tự luận, lời giải, dòng trống, ô đóng khung.
- `05-de-thi-day-du.typ`: một đề minh họa đủ phần.
- `06-bbt-bxd-bang.typ`: bảng biến thiên, bảng xét dấu, bảng giá trị, bảng phân phối.
- `07-template-theme-profile.typ`: theme, profile, option style, answer key.
- `08-sach-chuyen-de.typ`: mẫu sách/chuyên đề với các hộp sư phạm.
- `09-hop-su-pham.typ`: riêng các hộp sư phạm trong tài liệu dạy học.
- `10-hinh-hoc-ky-hieu.typ`: hình học CeTZ và ký hiệu toán tắt.

## Biên dịch nhanh

```bash
bash tests/compile-examples.sh
```


## Bản sửa 06 và 09

- `06-bbt-bxd-bang.typ`: sửa `bbbt.ranks` sang dạng số, vì `ranks` dùng để xếp cao-thấp khi vẽ mũi tên.
- `09-hop-su-pham.typ`: viết lại các hộp theo dạng hàm rõ ràng như `#lythuyet([...])`, dễ đọc và an toàn hơn cho người mới.
