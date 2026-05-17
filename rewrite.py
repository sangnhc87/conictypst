import re

with open('typst/exams/CD-Kinh-Te-Tich-Phan.typ', 'r') as f:
    text = f.read()

# Separate header, problems, and footer
header_end = text.find('== Bài ')
footer_start = text.find('= III. TỔNG KẾT')

header = text[:header_end]
problems_section = text[header_end:footer_start]
footer = text[footer_start:]

problems = re.split(r'\n== Bài \d+\.\s+', '\n' + problems_section)[1:]

keep_titles = [
    "Pin", "Gạo", "Lao Động", "Thuế", "Thị Trường Bất Động Sản", 
    "Thị Trường Xuất Khẩu", "Độc Quyền", "Giá Hỗ Trợ"
]

kept_problems = []
for p in problems:
    lines = p.split('\n')
    title = lines[0]
    if any(k in title for k in keep_titles):
        kept_problems.append((title, p))

ds1 = r"""Phân Bổ Đất Đai Nông Nghiệp (Đúng/Sai)
#ds(
  [Đường cong phân phối tập trung $y=L(x)$ được đưa vào ứng dụng trong quy hoạch tài nguyên. Tại một địa phương, người ta thống kê mức độ tập trung đất đai nông nghiệp, trong đó $x$ là phần trăm lũy kế số hộ nông dân (sắp xếp từ hộ có ít đất nhất đến nhiều nhất), và $y$ biểu thị phần trăm lũy kế diện tích đất sở hữu. Dữ liệu khảo sát cụ thể như sau:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto),
      align: center,
      [$x$ (phần trăm số hộ)], [0%], [30%], [70%], [100%],
      [$L(x)$ (phần trăm diện tích)], [0%], [10%], [35%], [100%]
    )
  ]
  Giả định đồ thị liên kết nội suy giữa các mốc là đoạn thẳng. Các nhận định phân tích sau đây đúng hay sai?],
  (
    True([Nhóm $30\%$ hộ nông dân nghèo đất nhất của địa phương chỉ sở hữu đúng một phần mười tổng quỹ đất.]),
    False([Nhóm $30\%$ hộ nông dân giàu đất nhất sở hữu diện tích đất rộng gấp 4 lần nhóm $30\%$ hộ nghèo nhất.]),
    True([Tồn tại một bộ phận $40\%$ số hộ ở mức trung bình đang dùng $25\%$ tổng diện tích đất nông nghiệp.]),
    False([Phân bổ diện tích đất tích phân $integral_0^1 L(x) dif x$ làm tròn theo phần hình phẳng phía dưới đường gấp khúc có giá trị bằng $0.32$.])
  ),
  fig-pos: "right",
  loigiai: [
    #reset-step()
    #step[
      *Lập luận câu A:* Số liệu từ bảng, tại mốc $x=0.3$, lượng đất sở hữu $L(x) = 0.1$. Giá trị $0.1$ tương ứng $1/10$ nên kết luận nhóm $30\%$ nghèo nắm $10\%$ là đúng. => *A ĐÚNG.*
    ]
    #step[
      *Lập luận câu B:* 
      - Nhóm $30\%$ giàu nhất: Tài sản bằng $1.0 - L(0.7) = 1.0 - 0.35 = 0.65$ ($65\%$).
      - Nhóm $30\%$ nghèo nhất: $10\%$.
      Tỷ lệ này là $6.5$ lần. => *B SAI.*
    ]
    #step[
      *Lập luận câu C:* Nhóm trung bình chiếm kích thước là $0.7 - 0.3 = 0.4$ ($40\%$) số hộ. 
      Lượng đất họ nắm là $L(0.7) - L(0.3) = 0.35 - 0.10 = 0.25$ ($25\%$). => *C ĐÚNG.*
    ]
    #step[
      *Lập luận câu D:* Tích phân là tổng diện tích 3 hình thang:
      $ S = \frac{1}{2} \left[ 0.3(0+0.1) + 0.4(0.1+0.35) + 0.3(0.35+1.0) \right] $
      $ S = 0.5 \times (0.03 + 0.18 + 0.405) = 0.3075 \neq 0.32. $ => *D SAI*.
    ]
  ]
)
"""

ds2 = r"""Tiêu Thụ Điện Năng Trong Khu Công Nghiệp (Đúng/Sai)
#ds(
  [Ứng dụng nguyên lý phân phối lũy kế để đánh giá điện năng tiêu thụ tại một cụm công nghiệp. Gọi $x$ là tỷ lệ lũy kế số nhà máy (từ quy mô nhỏ đến lớn), $y = L(x)$ là tỷ lệ điện năng tiêu thụ lũy kế, hàm này tuân theo một số liệu chuẩn hàm mũ có dạng $L(x) = \frac{e^x - 1}{e - 1}$ (với $x \in [0, 1]$). Các nhận định đánh giá phân bổ điện năng sau đây là đúng hay sai?],
  (
    True([Tại hai mốc đầu mút $x=0$ và $x=1$, các giá trị lũy kế thỏa mãn đúng tính chất chuẩn biên $L(0)=0$ và $L(1)=1$.]),
    False([Tính riêng một nửa số lượng công ty quy mô nhỏ nhất nội khu, lượng điện họ tiêu thụ chiếm chính xác $15\%$ giới hạn công suất cả khu.]),
    True([Phân tích theo đạo hàm, tỷ lệ tăng trưởng tiêu thụ $L'(x)$ của các nhà máy lớn cao hơn nhà máy nhỏ, tức tốc độ tiêu thụ tăng dốc khi quy mô tăng.]),
    False([Phần diện tích hình phẳng phía dưới đường cong báo cáo lượng điện $integral_0^1 L(x) dif x$ xấp xỉ bằng $0.46$.])
  ),
  loigiai: [
    #reset-step()
    #step[
      *Lập luận câu A:* Thay mốc $L(0) = \frac{e^0-1}{e-1} = 0$; $L(1) = 1$. ĐÚNG.
    ]
    #step[
      *Lập luận câu B:* Một nửa doanh nghiệp nhỏ nhất ($x=0.5$):
      $ L(0.5) = \frac{\sqrt{e} - 1}{e - 1} \approx \frac{1.6487 - 1}{1.7183} \approx 0.377 (37.7\%) \neq 15\%. $ => B SAI.
    ]
    #step[
      *Lập luận câu C:* $L'(x) = \frac{e^x}{e-1}$ > 0 và đồng biến, nên nhà máy càng lớn thì $L'(x)$ (tốc độ tiêu thụ biên) càng lớn. ĐÚNG.
    ]
    #step[
      *Lập luận câu D:* Tích phân:
      $ S = integral_0^1 \frac{e^x - 1}{e - 1} dif x = \frac{1}{e-1} [e^x - x]_0^1 = \frac{e-2}{e-1} \approx 0.418 \neq 0.46 . $ => D SAI.
    ]
  ]
)
"""

ds3 = r"""Thống Kê Nền Tảng Nghe Nhạc (Đúng/Sai)
#ds(
  [Phân tích lượng người nghe nhạc (stream) của nền tảng X cho thấy hiện tượng tập trung số lượt nghe lớn vào một nhóm nghệ sĩ. Khảo sát theo mô hình tỷ lệ $L(x)$, trong đó $x$ là tỷ lệ nghệ sĩ (từ nghệ sĩ ít view đến nhiều view), $y = L(x)$ là tỷ lệ lũy kế số lượt stream toàn cầu do họ đóng góp. Đồ thị $L(x)$ bị võng sâu và tuân theo hàm $L(x) = x^3$. Các khẳng định sau đây về cấu trúc thu stream này là đúng hay sai?],
  (
    True([Nếu tính $10\%$ nghệ sĩ đỉnh cao, lượng stream của họ chiếm đóng đến $27.1\%$ lượng view toàn hệ thống.]),
    True([Một nửa số lượng nghệ sĩ được xem là "kém thịnh hành" ($50\%$ nghệ sĩ top dưới) gộp lại chỉ thu về được $12.5\%$ tổng view toàn cầu.]),
    False([Tính diện tích phần bất cân xứng thông qua vi phân $\int_0^1 (x - L(x)) dif x$, ta được độ chênh bằng $1/3$.]),
    True([Càng về top đầu, mức độ tăng view biên $L'(x)$ của nghệ sĩ càng khủng khiếp, nghệ sĩ hạng $x=1.0$ (ngôi sao top 1) có tốc độ biên bằng 3.])
  ),
  loigiai: [
    #reset-step()
    #step[
      *Lập luận câu A:* $10\%$ đỉnh cao có $x \in [0.9, 1.0]$. 
      $ 1.0 - L(0.9) = 1.0 - 0.9^3 = 1.0 - 0.729 = 0.271 = 27.1\% $. ĐÚNG.
    ]
    #step[
      *Lập luận câu B:* $50\%$ top dưới ($x = 0.5$): $L(0.5) = 0.5^3 = 0.125 = 12.5\%$. ĐÚNG.
    ]
    #step[
      *Lập luận câu C:* $\int_0^1 (x - x^3) dif x = [\frac{x^2}{2} - \frac{x^4}{4}]_0^1 = 0.5 - 0.25 = 0.25 = 1/4 \neq 1/3$. SAI.
    ]
    #step[
      *Lập luận câu D:* $L'(x) = 3x^2 \implies L'(1) = 3$. ĐÚNG.
    ]
  ]
)
"""

ds_problems = [(ds1.split('\n')[0], ds1), (ds2.split('\n')[0], ds2), (ds3.split('\n')[0], ds3)]
all_problems = kept_problems + ds_problems

new_problems_section = ""
table_rows = []

for i, (old_title, content) in enumerate(all_problems, 1):
    first_line_end = content.find('\n')
    new_title = 'Bài ' + str(i) + '. ' + (old_title.split('. ', 1)[-1] if '. ' in old_title else old_title)
    content = new_title + content[first_line_end:]
    new_problems_section += "\n== " + content + "\n"
    
    row_title = old_title.split('. ', 1)[-1] if '. ' in old_title else old_title
    if "Đất Đai" in old_title:
        table_rows.append('    [' + str(i) + '], [Đất đai — Phân bổ rời rạc], [Đ/S], [*Đ-S-Đ-S*],')
    elif "Điện Năng" in old_title:
        table_rows.append('    [' + str(i) + '], [Điện năng — Hàm mũ], [Đ/S], [*Đ-S-Đ-S*],')
    elif "Nhạc" in old_title:
        table_rows.append('    [' + str(i) + '], [Stream nhạc — Hàm lũy thừa], [Đ/S], [*Đ-Đ-S-Đ*],')
    elif "Pin" in old_title:
        table_rows.append('    [' + str(i) + '], [Pin NLMT], [$C.S$], [*0,4 tỷ*],')
    elif "Gạo" in old_title:
        table_rows.append('    [' + str(i) + '], [Gạo], [$C.S+P.S$], [*125 tr*],')
    elif "Lao Động" in old_title:
         table_rows.append('    [' + str(i) + '], [Lao động], [$C.S; P.S$], [*18; 13.5*],')
    elif "Thuế" in old_title:
         table_rows.append('    [' + str(i) + '], [Thuế], [$DWL$], [*0.75*],')
    elif "Bất Động Sản" in old_title:
         table_rows.append('    [' + str(i) + '], [BĐS], [$C.S$], [*~80.9 tỷ*],')
    elif "Xuất Khẩu" in old_title:
         table_rows.append('    [' + str(i) + '], [Xuất khẩu], [$W$], [*+2,25*],')
    elif "Độc Quyền" in old_title:
         table_rows.append('    [' + str(i) + '], [Độc quyền], [$DWL$], [*2*],')
    elif "Giá" in old_title:
         table_rows.append('    [' + str(i) + '], [Giá sàn], [NS], [*45 k tỷ*],')
    else:
         table_rows.append('    [' + str(i) + '], [' + row_title[:15] + '...], [kq], [*N/A*],')

footer_start_idx = footer.find('#ppgiai[Bảng đáp số nhanh để tô phiếu]')
table_start_idx = footer.find('    [1],', footer_start_idx)
table_end_idx = footer.find('  )\n]', table_start_idx)

new_footer = footer[:table_start_idx] + '\n'.join(table_rows) + '\n' + footer[table_end_idx:]

header = header.replace('    [Hệ Số Gini], [$\n      G = 2 \int_0^1 (x - L(x)) dif x\n    $], [Mức độ bất bình đẳng. $G \in [0, 1]$.\n      \n      $G=0$: Bình đẳng tuyệt đối.\n      \n      $G=1$: Bất bình đẳng tuyệt đối.],\n', '')

final_doc = header + new_problems_section + new_footer

with open('typst/exams/CD-Kinh-Te-Tich-Phan.typ', 'w') as f:
    f.write(final_doc)

print('done rewrite v2')
