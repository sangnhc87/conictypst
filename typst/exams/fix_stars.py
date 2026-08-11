import re
with open("CD-QuanHeSongSong.typ", "r") as f:
    text = f.read()

text = text.replace('**Bước', '*Bước')
text = text.replace('**', '*')

with open("CD-QuanHeSongSong.typ", "w") as f:
    f.write(text)
