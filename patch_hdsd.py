import re

with open('typst/hdsd-exam.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# 1. Add #tn advanced examples
tn_advanced = """
== Ví dụ 5 — Tùy biến hiển thị phương án (Đóng tròn A, B, C, D)

Hệ thống cho phép hiển thị các ký tự phương án dưới dạng đóng tròn bằng tham số `opt-style: "circle"`.

```typst
#tn(
  [Phát biểu nào sau đây là sai?],
  ([Một], True([Hai]), [Ba], [Bốn]),
  opt-style: "circle",
)
```

#demo-out[
  #let em_tn_circle = exam-mode(mode: "dethi", accent: classic.blue)
  #(em_tn_circle.tn)(
    [Phát biểu nào sau đây là sai?],
    ([Một], True([Hai]), [Ba], [Bốn]),
    opt-style: "circle",
  )
]

== Ví dụ 6 — Trắc nghiệm 4 phương án là 4 hình vẽ (`opt-fig`)

Khi phương án trả lời là các hình vẽ lớn, bạn cần sử dụng `opt-fig: true` và `cols: 2` (hoặc 4) để các hình vẽ được tự động dàn trang vào lưới ảnh đẹp mắt mà không bị vỡ bố cục inline thông thường.

```typst
#tn(
  [Đồ thị nào sau đây biểu diễn hàm số $y = x^3 - 3x$?],
  (
    cetz.canvas(length: 0.5cm, { import cetz.draw: *; circle((0,0), radius: 1) }),
    True(cetz.canvas(length: 0.5cm, { import cetz.draw: *; rect((0,0), (1,1)) })),
    cetz.canvas(length: 0.5cm, { import cetz.draw: *; line((0,0), (1,1)) }),
    cetz.canvas(length: 0.5cm, { import cetz.draw: *; circle((0,0), radius: 0.5) })
  ),
  opt-fig: true,
  cols: 2,
  loigiai: [Đây là ví dụ minh hoạ, phương án đúng được khoanh đỏ.]
)
```

#demo-out[
  #let em_tn_fig = exam-mode(mode: "loigiai", accent: classic.blue)
  #(em_tn_fig.tn)(
    [Đồ thị nào sau đây biểu diễn hàm số $y = x^3 - 3x$?],
    (
      cetz.canvas(length: 0.5cm, { import cetz.draw: *; circle((0,0), radius: 1) }),
      True(cetz.canvas(length: 0.5cm, { import cetz.draw: *; rect((0,0), (1,1)) })),
      cetz.canvas(length: 0.5cm, { import cetz.draw: *; line((0,0), (1,1)) }),
      cetz.canvas(length: 0.5cm, { import cetz.draw: *; circle((0,0), radius: 0.5) })
    ),
    opt-fig: true,
    cols: 2,
    loigiai: [Mỗi phương án là một hình vẽ (sử dụng cetz.canvas). `opt-fig: true` giúp dàn trang đều.]
  )
]

== Ví dụ 7 — Câu hỏi đóng khung và chèn dòng tự kẻ (`boxed` & `lines`)

Để làm nổi bật câu hỏi hoặc đóng khung thành các task nhỏ, hãy dùng `boxed: true`. 
Dùng `lines: 5` để tạo ra 5 dòng kẻ chấm chấm cho học sinh tự điền nháp (chỉ xuất hiện ở chế độ `dethi`).

```typst
#tn(
  [Giải phương trình $2x - 4 = 0$.],
  ([$x = 1$], True([$x = 2$]), [$x = 3$], [$x = 4$]),
  boxed: true,
  lines: 4,
)
```

#demo-out[
  #let em_tn_boxed = exam-mode(mode: "dethi", accent: classic.blue)
  #(em_tn_boxed.tn)(
    [Giải phương trình $2x - 4 = 0$.],
    ([$x = 1$], True([$x = 2$]), [$x = 3$], [$x = 4$]),
    boxed: true,
    lines: 4,
  )
]
"""
text = text.replace('// ══════════════════════════════════════════════════════════════════\n= Câu Đúng–Sai — `#ds(...)`', tn_advanced + '\n// ══════════════════════════════════════════════════════════════════\n= Câu Đúng–Sai — `#ds(...)`')


# 2. Add #ds advanced examples
ds_advanced = """
== Ví dụ 3 — Đúng-Sai dạng Danh sách không bảng (`ds-style: "list"`)

Mặc định, câu Đúng-Sai được hiển thị dưới dạng bảng có các cột Đ/S để học sinh đánh dấu tick. 
Nếu bạn muốn hiển thị dạng danh sách trơn (ví dụ trong đề thi tự luận có pha trắc nghiệm, hoặc dùng cho mục đích khác), sử dụng tham số `ds-style: "list"`.

```typst
#ds(
  [Xét tính đúng sai của các mệnh đề sau về phương trình $x^2 - 4 = 0$:],
  (
    [Phương trình vô nghiệm trên $RR$.],
    True([Phương trình có hai nghiệm phân biệt.]),
    True([Tổng hai nghiệm bằng $0$.]),
    [Nghiệm lớn nhất là $x = 4$.],
  ),
  ds-style: "list",
)
```

#demo-out[
  #let em_ds_list = exam-mode(mode: "dethi", accent: classic.emerald)
  #(em_ds_list.ds)(
    [Xét tính đúng sai của các mệnh đề sau về phương trình $x^2 - 4 = 0$:],
    (
      [Phương trình vô nghiệm trên $RR$.],
      True([Phương trình có hai nghiệm phân biệt.]),
      True([Tổng hai nghiệm bằng $0$.]),
      [Nghiệm lớn nhất là $x = 4$.],
    ),
    ds-style: "list",
  )
]

#demo-out[
  #let em_ds_list_ans = exam-mode(mode: "loigiai", accent: classic.emerald)
  #(em_ds_list_ans.ds)(
    [*(Chế độ lời giải sẽ hiện [ĐÚNG]/[SAI])* Xét tính đúng sai của các mệnh đề sau về phương trình $x^2 - 4 = 0$:],
    (
      [Phương trình vô nghiệm trên $RR$.],
      True([Phương trình có hai nghiệm phân biệt.]),
      True([Tổng hai nghiệm bằng $0$.]),
      [Nghiệm lớn nhất là $x = 4$.],
    ),
    ds-style: "list",
  )
]
"""
text = text.replace('// ══════════════════════════════════════════════════════════════════\n= Câu trả lời ngắn — `#tln(...)`', ds_advanced + '\n// ══════════════════════════════════════════════════════════════════\n= Câu trả lời ngắn — `#tln(...)`')

with open('typst/hdsd-exam.typ', 'w', encoding='utf-8') as f:
    f.write(text)

