with open('/Users/admin/conictypst/public/hdsd/hh-live.html', 'r', encoding='utf-8') as f:
    text = f.read()

# dashed-seg
text = text.replace('dashed-seg((0,0), (5,0), label: "AB"', 'dashed-seg((0,0), (5,0)')

# cylinder stroke
text = text.replace('stroke: blue + 1.5pt', 'stroke: blue')

# bayes-bar
text = text.replace('draw-bayes-contribution-bar()', 'draw-bayes-contribution-bar(terms: (([B1], 0.4, blue), ([B2], 0.6, red)))')

with open('/Users/admin/conictypst/public/hdsd/hh-live.html', 'w', encoding='utf-8') as f:
    f.write(text)

print("Replaced!")
