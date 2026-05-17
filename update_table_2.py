with open('typst/exams/CD-Kinh-Te-Tich-Phan.typ', 'r') as f:
    text = f.read()

old_table = """    [11], [Lorenz rời rạc — Bảng], [$G$], [*0,38*],
    [12], [Lorenz qua điểm — Hàm đại số], [$G$], [*0,33*],
    [13], [Lorenz tinh hoa — Gini lớn], [$G$; % giàu], [*0,6 ; 93.75%*],
  )
]"""

new_table = """    [11], [Lorenz rời rạc — Bảng], [$G$], [*0,38*],
    [12], [Lorenz qua điểm — Hàm đại số], [$G$], [*0,33*],
    [13], [Lorenz tinh hoa — Gini lớn], [$G$; % giàu], [*0,6 ; 93.75%*],
    [14], [Lorenz bảng — Tính chất], [Đ/S], [*Đ-Đ-S-S*],
    [15], [So sánh Lorenz hai vùng], [Đ/S], [*Đ-S-S-Đ*],
  )
]"""

if old_table in text:
    text = text.replace(old_table, new_table)
    with open('typst/exams/CD-Kinh-Te-Tich-Phan.typ', 'w') as f:
        f.write(text)
    print('Updated table again')
else:
    print('Could not find table')

