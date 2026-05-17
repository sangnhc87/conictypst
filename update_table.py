with open('typst/exams/CD-Kinh-Te-Tich-Phan.typ', 'r') as f:
    text = f.read()

old_table = """    [8], [Xuất khẩu — giá thế giới], [$Delta W$], [*+2,25*],
    [9], [Độc quyền vs cạnh tranh], [$"DWL"$], [*2*],
    [10], [Giá sàn — chính phủ mua dự trữ], [Chi phí NS], [*45 nghìn tỷ*],
  )
]"""

new_table = """    [8], [Xuất khẩu — giá thế giới], [$Delta W$], [*+2,25*],
    [9], [Độc quyền vs cạnh tranh], [$"DWL"$], [*2*],
    [10], [Giá sàn — chính phủ mua dự trữ], [Chi phí NS], [*45 nghìn tỷ*],
    [11], [Lorenz rời rạc — Bảng], [$G$], [*0,38*],
    [12], [Lorenz qua điểm — Hàm đại số], [$G$], [*0,33*],
    [13], [Lorenz tinh hoa — Gini lớn], [$G$; % giàu], [*0,6 ; 93.75%*],
  )
]"""

if old_table in text:
    text = text.replace(old_table, new_table)
    with open('typst/exams/CD-Kinh-Te-Tich-Phan.typ', 'w') as f:
        f.write(text)
    print('Updated table')
else:
    print('Could not find table')

