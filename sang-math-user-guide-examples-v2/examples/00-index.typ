#import "../lib.typ": *
#show: sang-setup

= Mục lục bộ ví dụ `sang-math`

File này dùng như trang chỉ mục để người dùng biết nên mở file nào trước.

== Cách học nhanh

1. Mở `01-quy-uoc-id-import.typ` để nắm import và ID.
2. Mở `02`, `03`, `04` để học từng loại câu hỏi.
3. Mở `05` và `07` để học cách dựng đề thi.
4. Mở `06` để học bảng biến thiên, bảng xét dấu.
5. Mở `08`, `09`, `10` để học phần sách, hộp sư phạm, hình học.

== Quy ước xuyên suốt

Trong các ví dụ, ID được đặt ngay sau tên lệnh:

```typ
#tn([Câu hỏi], ([$A$], True([$B$]), [$C$], [$D$]))
#tln([Câu hỏi], [$Đáp án$])
```

Không dùng `tags:` trong file mẫu để người mới không bị rối. Khi cần phân loại câu hỏi, giáo viên có thể tự thêm về sau.
