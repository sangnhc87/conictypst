with open("CD-QuanHeSongSong.typ", "r", encoding="utf-8") as f:
    text = f.read()

text = text.replace('sqrt(6^2 + 2,5^2)', 'sqrt(6^2 + 2.5^2)')
text = text.replace('sqrt(36 + 6,25)', 'sqrt(36 + 6.25)')
text = text.replace('sqrt(42,25)', 'sqrt(42.25)')

with open("CD-QuanHeSongSong.typ", "w", encoding="utf-8") as f:
    f.write(text)
