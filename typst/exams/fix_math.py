import re
with open("CD-QuanHeSongSong.typ", "r") as f:
    text = f.read()

# I will replace all instances of // with parallel where it means parallel lines.
# Looking at the file, I have:
# (A D // B C
# (P) // A D
# M K // A D
# (alpha) // A B
# (alpha) // (A B C D)
# N P // B C
# P Q // C D
# Q M // D A

text = text.replace('//', 'parallel')
# but wait, I had `// BC parallel AD, do dai = 1/2 AD` as a real comment!
text = text.replace('parallel Mat phang P (M, N, K, P)', '// Mat phang P (M, N, K, P)')
text = text.replace('parallel Noi dai MN', '// Noi dai MN')
text = text.replace('parallel BC parallel AD, do dai = 1/2 AD', '// BC parallel AD, do dai = 1/2 AD')
text = text.replace('parallel G = (S+A+B)/3', '// G = (S+A+B)/3')
text = text.replace('parallel Mat cat alpha parallel (ABCD), cat SA, SB, SC, SD tai M, N, P, Q', '// Mat cat alpha parallel (ABCD), cat SA, SB, SC, SD tai M, N, P, Q')
text = text.replace('parallel Ty so = 2/3', '// Ty so = 2/3')
text = text.replace('parallel Duong trung tuyen cua SAB', '// Duong trung tuyen cua SAB')
text = text.replace('parallel Hexagon base', '// Hexagon base')
text = text.replace('parallel Draw edges', '// Draw edges')
text = text.replace('parallel Tang 2 (cach day 3m)', '// Tang 2 (cach day 3m)')
text = text.replace('parallel Tang 3 (cach day 9m)', '// Tang 3 (cach day 9m)')
text = text.replace('parallel Draw Tang 2', '// Draw Tang 2')
text = text.replace('parallel Draw Tang 3', '// Draw Tang 3')

with open("CD-QuanHeSongSong.typ", "w") as f:
    f.write(text)
