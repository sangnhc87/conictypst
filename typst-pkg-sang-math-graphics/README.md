# Sang Math Graphics

Package Typst chuyên vẽ các hình Toán phức tạp: hình không gian, conic, đường xoắn ốc, mặt cong...

## Tính năng

- ✅ Hình 3D: nón, trụ, cầu với phép chiếu isometric
- ✅ Đa diện: khối chóp, khối chóp cụt
- ✅ Anchor (mỏ neo) để dễ dàng thêm nhãn, nét phụ
- ✅ Conic 2D: parabol, elip, hyperbol
- ✅ Đường cong đặc biệt: helix trên trụ, đường xoắn ốc trên nón
- ✅ Mặt cong: mặt yên ngựa, paraboloid
- ✅ Ứng dụng Giải tích: thể tích theo mặt cắt vuông, nửa elip
- ✅ Cấu trúc module theo chuyên đề, dễ mở rộng
- ✅ Tài liệu PDF + Website HTML + Live Preview WASM

## Cài đặt

```typst
#import "@preview/sang-math-graphics:0.1.0": *
```

## Ví dụ nhanh

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

## Cấu trúc thư mục

```
sang-math-graphics/
├── typst.toml              # Khai báo package
├── lib.typ                 # Entry point, export tất cả
├── src/
│   ├── core/
│   │   ├── utils.typ       # Hàm tính toán tọa độ
│   │   └── projections.typ # Phép chiếu 3D
│   ├── 2d/
│   │   └── conics.typ      # Parabol, elip, hyperbol
│   ├── 3d/
│   │   ├── solids.typ      # Nón, trụ, cầu
│   │   ├── polyhedra.typ   # Chóp, chóp cụt
│   │   ├── curves.typ      # Helix, đường xoắn ốc nón
│   │   └── surfaces.typ    # Mặt yên ngựa, paraboloid
│   └── calculus/
│       └── volumes.typ     # Thể tích theo mặt cắt
├── examples/               # Các file ví dụ
│   └── samples/            # Hình mẫu từ tài liệu
├── docs/                   # Tài liệu HDSD
│   ├── src/
│   │   └── topics/         # Chuyên đề: 2D, 3D, Calculus, Samples, Live
│   └── .vitepress/         # Cấu hình website + LivePreview.vue
└── scripts/                # Script build tự động
```

## Build tài liệu

```bash
# Build PDF gallery + manual + examples
npm run build:examples
npm run build:docs

# Build website HTML (có Live Preview WASM)
npm run build:web

# Build tất cả
npm run build:all
```

## Phát triển

1. Thêm hàm vẽ mới vào `src/<chuyên-đề>/`
2. Viết docstring `///` phía trên hàm
3. Thêm ví dụ vào `examples/`
4. Cập nhật trang chuyên đề trong `docs/src/topics/`
5. Chạy `npm run build:all` để cập nhật PDF + web

## Giấy phép

MIT
