with open("CD-QuanHeSongSong.typ", "r", encoding="utf-8") as f:
    text = f.read()

text = text.replace('h = 20 upright(m)', 'h = 24 upright(m)')
text = text.replace('H_x = H_1 - h = 120 - 20 = 100 upright(m)', 'H_x = H_1 - h = 120 - 24 = 96 upright(m)')
text = text.replace('((100) / (120))^2 = (5 / 6)^2 = 25 / 36', '((96) / (120))^2 = (4 / 5)^2 = 16 / 25')
text = text.replace('S_x = 800 dot 25 / 36 = (20000) / 36 = 5000 / 9 approx 555,56 upright(m)^2', 'S_x = 800 dot 16 / 25 = 512 upright(m)^2')
text = text.replace('*(Ghi chú: Nếu $S_{A B C D} = 800$, tính ra kết quả phân số. Để ra đúng đáp án nguyên $512$ như đề dự tính, thường $h$ hoặc số liệu được điều chỉnh)*.', '')

with open("CD-QuanHeSongSong.typ", "w", encoding="utf-8") as f:
    f.write(text)
