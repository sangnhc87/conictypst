with open("CD-QuanHeSongSong.typ", "r") as f:
    text = f.read()

text = text.replace('content(M, [ $M$ ], anchor: "east", padding: 0.1, text(fill: blue))', 'content(M, text(fill: blue)[ $M$ ], anchor: "east", padding: 0.1)')
text = text.replace('content(N, [ $N$ ], anchor: "east", padding: 0.1, text(fill: blue))', 'content(N, text(fill: blue)[ $N$ ], anchor: "east", padding: 0.1)')
text = text.replace('content(K, [ $K$ ], anchor: "west", padding: 0.1, text(fill: blue))', 'content(K, text(fill: blue)[ $K$ ], anchor: "west", padding: 0.1)')
text = text.replace('content(G, [ $G$ ], anchor: "north", padding: 0.1, text(fill: red))', 'content(G, text(fill: red)[ $G$ ], anchor: "north", padding: 0.1)')

text = text.replace('=>', '=>') # (already =>)
text = text.replace('\implies', '=>')
text = text.replace('\equiv', 'equiv')
text = text.replace('//', 'slash.double')
# wait, // is comments in typst code, but in text mode it's parsed as text?
# in math mode `A D // B C` parses as A D slash.double B C
# Wait, `//` in math mode works as a fraction or comment?
# In Typst math mode, `//` is a valid symbol for parallel or it can be a comment!
# Let's use `parallel` keyword instead of `//`.
text = text.replace('//', 'parallel')

with open("CD-QuanHeSongSong.typ", "w") as f:
    f.write(text)
