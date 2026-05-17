with open('typst/exams/CD-Kinh-Te-Tich-Phan.typ', 'r') as f:
    text = f.read()

old_table = """    [14], [Lorenz bảng — Tính chất], [Đ/S], [*Đ-Đ-S-S*],
    [15], [So sánh Lorenz hai vùng], [Đ/S], [*Đ-S-S-Đ*],
  )
]"""

new_table = """    [14], [Lorenz bảng 5 mốc — Tích phân], [Đ/S], [*Đ-Đ-S-S*],
    [15], [So sánh Lorenz hai vùng], [Đ/S], [*Đ-S-S-Đ*],
    [16], [Lorenz bảng 4 mốc — Suy luận], [Đ/S], [*Đ-Đ-S-S*],
    [17], [Đối chiếu mô hình và thực tế], [Đ/S], [*Đ-Đ-S-Đ*],
  )
]"""

if old_table in text:
    text = text.replace(old_table, new_table)
    with open('typst/exams/CD-Kinh-Te-Tich-Phan.typ', 'w') as f:
        f.write(text)
    print('Updated summary table')
else:
    print('Could not find summary table section')
