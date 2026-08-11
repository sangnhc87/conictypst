with open("CD-QuanHeSongSong.typ", "r", encoding="utf-8") as f:
    text = f.read()

text = text.replace('content((3.5, 1.8), [ Mặt nước $(P)$ ], anchor: "north", padding: 0.1, text(fill: rgb("03A9F4")))', 'content((3.5, 1.8), text(fill: rgb("03A9F4"))[ Mặt nước $(P)$ ], anchor: "north", padding: 0.1)')

with open("CD-QuanHeSongSong.typ", "w", encoding="utf-8") as f:
    f.write(text)
