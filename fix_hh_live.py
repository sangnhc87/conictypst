import sys

with open('/Users/admin/conictypst/public/hdsd/hh-live.html', 'r', encoding='utf-8') as f:
    text = f.read()

# 1. dashed-seg
text = text.replace('dashed-seg(from: (0,0), to: (5,0), label: "AB"', 'dashed-seg((0,0), (5,0), label: "AB"')

# 2. draw-cylinder anchors
text = text.replace('"C.top"', '"C.top-center"')
text = text.replace('"C.bottom"', '"C.bottom-center"')

# 3. draw-cone stroke
text = text.replace('stroke: red + 1.5pt)', 'stroke: red)')

# 4. draw-sphere args
text = text.replace('stroke: green + 1.5pt, show-equator: true, show-meridian: true)', 'stroke: green)')
text = text.replace('stroke:green+1.5pt,show-equator:true,show-meridian:true)', 'stroke:green)')

# 6. draw-parabola
text = text.replace('draw-parabola(a: 0.5, h: 0, k: -1, x-range: (-2.8, 2.8), color: rgb("1565C0"), label-vertex: [$P$])', 'draw-parabola(a: 0.5, b: 0, c: -1, x-range: (-2.8, 2.8), stroke: rgb("1565C0"))')
text = text.replace('draw-parabola(a:0.4,h:0,k:-1,x-range:(-3,3),stroke:blue+1.5pt)', 'draw-parabola(a:0.4,b:0,c:-1,x-range:(-3,3),stroke:blue)')

# 7. draw-ellipse
text = text.replace('draw-ellipse(a: 3, b: 2, fill: rgb("F3E5F5"), stroke: purple + 1.5pt, show-axes: true, show-foci: true)', 'draw-ellipse(a: 3, b: 2, stroke: purple)')
text = text.replace('draw-ellipse(a:${a},b:${b},stroke:purple+1.5pt,show-axes:true,show-foci:true)', 'draw-ellipse(a:${a},b:${b},stroke:purple)')

# 8. draw-hyperbola
text = text.replace('draw-hyperbola(a: 1.5, b: 1, y-range: (-2.5, 2.5), stroke: red + 1.5pt, show-asymptotes: true, show-foci: true)', 'draw-hyperbola(a: 1.5, b: 1, x-range: (1.6, 4), stroke: red)')
text = text.replace('draw-hyperbola(a: 1.5, b: 1, y-range: (-2.5, 2.5), stroke: red + 1.5pt, show-asymptotes: true)', 'draw-hyperbola(a: 1.5, b: 1, x-range: (1.6, 4), stroke: red)')
text = text.replace('draw-hyperbola(a:${a},b:${b},y-range:(-2.5,2.5),stroke:red+1.5pt,show-asymptotes:true)', 'draw-hyperbola(a:${a},b:${b},x-range:(1.6,4),stroke:red)')

# 9. tree-2x2
text = text.replace('draw-tree-2x2(scale: 0.7cm)', 'draw-tree-2x2()')

# 10. tree-3x2
text = text.replace('draw-tree-3x2(scale: 0.65cm)', 'draw-tree-3x2()')

# 11. bayes-bar
text = text.replace('draw-bayes-contribution-bar(scale: 0.7cm)', 'draw-bayes-contribution-bar()')

# 12. paraboloid
text = text.replace('draw-paraboloid(x-range: (-2, 2), y-range: (-2, 2), samples: 12, stroke: rgb("2e7d32") + 0.6pt)', 'draw-paraboloid(a: 2, b: 2, z-max: 4, samples: 12, stroke: rgb("2e7d32"))')

with open('/Users/admin/conictypst/public/hdsd/hh-live.html', 'w', encoding='utf-8') as f:
    f.write(text)

print("Replaced!")
