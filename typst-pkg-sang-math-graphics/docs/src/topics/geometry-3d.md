# Hình học không gian (3D)

## Khối tròn xoay

### Hình nón

![Hình nón 3D với anchor](/img/cone-demo-1.png)

```typst
#import "@preview/cetz:0.3.2"
#import "@preview/sang-math-graphics:0.1.0": draw-cone

#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *
  draw-cone(name: "N1", radius: 3, height: 5, center: (0, 0, 0))
  circle("N1.top", radius: 0.08, fill: red)
  content("N1.top", [$S$], anchor: "south")
})
```

**Anchor:** `top`, `center`, `front`, `back`, `left`, `right`

### Hình trụ

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-cylinder

draw-cylinder(name: "C1", radius: 2, height: 4, center: (0, 0, 0))
```

### Hình cầu

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-sphere

draw-sphere(radius: 2, center: (0, 0, 0))
```

## Đa diện

### Khối chóp cụt

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-truncated-pyramid

draw-truncated-pyramid(base-size: 4, top-size: 2, height: 3, center: (0, 0, 0))
```

### Khối chóp

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-pyramid

draw-pyramid(base-size: 4, height: 4, center: (0, 0, 0))
```

## Đường cong không gian

### Đường xoắn ốc trên trụ

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-helix

draw-helix(center: (0, 0, 0), radius: 2, height: 5, loops: 2, stroke: red + 1.5pt)
```

### Đường xoắn ốc trên nón

![Đường xoắn ốc trên nón](/img/conical-helix-demo-1.png)

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-conical-helix

draw-conical-helix(center: (0, 0, 0), base-radius: 3, height: 5, loops: 3, stroke: red + 1.5pt)
```

## Mặt cong

### Mặt yên ngựa

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-saddle

draw-saddle(x-range: (-2, 2), y-range: (-2, 2), samples: 16, stroke: rgb("1A5276") + 0.6pt)
```

### Paraboloid elliptic

```typst
#import "@preview/sang-math-graphics:0.1.0": draw-paraboloid

draw-paraboloid(a: 2, b: 2, z-max: 4, samples: 24)
```
