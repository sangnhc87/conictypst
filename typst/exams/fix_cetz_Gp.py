with open("CD-QuanHeSongSong.typ", "r", encoding="utf-8") as f:
    text = f.read()

text = text.replace('content(Gp, [ $G\'$ ], anchor: "north", padding: 0.1, text(fill: red))', 'content(Gp, text(fill: red)[ $G\'$ ], anchor: "north", padding: 0.1)')

with open("CD-QuanHeSongSong.typ", "w", encoding="utf-8") as f:
    f.write(text)
