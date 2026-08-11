with open("CD-QuanHeSongSong.typ", "r") as f:
    text = f.read()

text = text.replace('slash.double', '//')
text = text.replace('content(M, [ $M$ ], anchor: "east", padding: 0.1, text(fill: blue))', 'content(M, text(fill: blue)[ $M$ ], anchor: "east", padding: 0.1)')
text = text.replace('content(N, [ $N$ ], anchor: "east", padding: 0.1, text(fill: blue))', 'content(N, text(fill: blue)[ $N$ ], anchor: "east", padding: 0.1)')
text = text.replace('content(K, [ $K$ ], anchor: "west", padding: 0.1, text(fill: blue))', 'content(K, text(fill: blue)[ $K$ ], anchor: "west", padding: 0.1)')
text = text.replace('content(G, [ $G$ ], anchor: "north", padding: 0.1, text(fill: red))', 'content(G, text(fill: red)[ $G$ ], anchor: "north", padding: 0.1)')

with open("CD-QuanHeSongSong.typ", "w") as f:
    f.write(text)
