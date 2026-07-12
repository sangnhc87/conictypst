# Hình học phẳng (2D)

## Conic

![Conic 2D: Parabol, Elip, Hyperbol](/img/conics-demo-1.png)

### Parabol

```typst
#import "@preview/cetz:0.3.2"
#import "@preview/sang-math-graphics:0.1.0": draw-parabola

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-parabola(a: 0.5, x-range: (-3, 3), stroke: blue + 1.2pt)
})
```

### Elip

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-ellipse

draw-ellipse(center: (0, 0), a: 3, b: 2, angle: 0, stroke: red + 1.2pt)
```

### Hyperbol

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-hyperbola

draw-hyperbola(a: 0.8, b: 0.8, x-range: (1, 4), stroke: green + 1.2pt)
```
