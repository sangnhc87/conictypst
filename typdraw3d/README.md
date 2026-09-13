# `typdraw3d` — Thư Viện Hình Học 3D Thuật Toán & Đồ Họa 3D Studio Cho Typst

> **Động cơ hình học giải tích không gian 3D tương đương Luadraw (LuaLaTeX) — Tính toán giao cắt, cắt gọt khối cầu, khử nét khuất tự động (Back-face Culling) và đổ bóng 3D Radial Gradients chân thực.**

`typdraw3d` mang đến cho hệ sinh thái **Typst** (dựa trên nền tảng **CeTZ**) sức mạnh của một động cơ toán học 3D hoàn chỉnh:
* **Không vẽ hình tĩnh "đóng hộp":** Mọi thực thể (Mặt cầu, Mặt phẳng, Đường tròn 3D, Đường thẳng) đều là đối tượng toán học có thể tính toán, giao cắt, chiếu điểm, đo góc và mở rộng tùy biến.
* **Đổ bóng 3D chân thực:** Ứng dụng dải màu *Radial & Directional 3D Gradients* đa tầng (highlight trên-trái, lan tỏa chuyển màu mượt mà xuống vùng tối cản sáng) tạo cảm giác khối cầu bóng bẩy, chuẩn xác y hệt bài đăng Facebook tham chiếu.
* **Biên dịch siêu tốc:** Hàng chục khối 3D phức tạp biên dịch sang PDF chỉ trong vài trăm mili-giây.

---

## 🌟 Tính Năng Trọng Tâm (Core Capabilities)

### 1. Động cơ Giải tích & Đối tượng Hình học 3D (`objects3d.typ` & `solvers3d.typ`)
* **Khởi tạo đối tượng thuần túy:**
  * `sphere(center, radius)`: Mặt cầu 3D.
  * `plane(point, normal)` / `plane-3p(A, B, C)`: Mặt phẳng 3D.
  * `circle3d(center, radius, normal)`: Đường tròn trong không gian 3D.
  * `line3d(origin, dir)` / `line3d-2p(A, B)`: Đường thẳng 3D.
* **Bộ giải thuật toán giao cắt (Solvers như Luadraw):**
  * `inter-plane-sphere(P, S)`: Tìm đường tròn giao tuyến của Mặt phẳng và Mặt cầu.
  * `inter-sphere-sphere(S1, S2)`: Tự động tìm đường tròn giao tuyến của 2 mặt cầu cắt nhau.
  * `inter-line-sphere(L, S)`: Tìm 0, 1 hoặc 2 giao điểm của đường thẳng và mặt cầu.
  * `inter-plane-plane(P1, P2)`: Tìm đường thẳng giao tuyến của 2 mặt phẳng.
  * `inter-line-plane(L, P)`: Tìm giao điểm của đường thẳng và mặt phẳng.
  * `sphere-geodesic(S, A, B, n: 36)`: Dựng cung tròn lớn trắc địa nối 2 điểm trên mặt cầu (Spherical SLERP).
  * `sphere-tangent-plane(S, pt)`: Lập mặt phẳng tiếp diện tại điểm thuộc mặt cầu.

### 2. Cắt Chỏm Cầu Thuật Toán & Mở Rộng (`cut-sphere` tương đương `g:Dcut_sphere`)
* Cắt mặt cầu ở bất kỳ cao độ nào:
  ```typst
  let S = sphere((0, 0, 0), 2.8)
  let P = plane((0, 0, 1.4), (0, 0, 1))
  let cut = cut-sphere(S, P, keep: "below")
  
  // Vẽ chỏm cầu đổ bóng 3D
  draw-cut-sphere(cut: cut, cam: cam, shading: "orange")
  
  // Truy vấn tọa độ 3D trên vành miệng cắt để vẽ thêm bất kỳ chi tiết nào:
  let A = cut-rim-point(cut, 30deg)
  let pts = cut-rim-points(cut, 5) // 5 đỉnh đa giác đều nội tiếp vành miệng
  ```

### 3. Tái Hiện Chuẩn Xác Mô Hình Chùm Đèn $n$ Đỉnh (Facebook Reference)
* Preset `preset-chum-den(n: 3|4|5|6|8...)`:
  * Tự động tính toán vị trí $n$ đỉnh trên vành chao tròn.
  * Dựng $n$ dây treo từ đỉnh $S$.
  * Tự động vẽ $n$ vector lực căng dây $arrow(F)_1, dots, arrow(F)_n$ đặt ở khoảng giữa dây, không bị chèn lấn, nhãn toán học Typst sắc nét.
* Preset `preset-sphere-cut-alpha`:
  * Mặt cầu cắt góc $alpha$ tại tâm $O$, bán kính nét đứt $O A, O B$, cung đo góc $alpha$ tại $O$.

### 4. Thuật toán Khử Nét Khuất Tự Động (Back-face Culling)
* Khai báo đỉnh và mặt của khối đa diện lồi $\to$ hệ thống tự phân tích vector pháp tuyến:
  * Cạnh khuất tự động vẽ nét đứt (`dashed`).
  * Cạnh thấy tự động vẽ nét liền (`solid`).
  * Xoay camera (`azimuth`, `elevation`), nét đứt tự động nhảy mượt mà.

---

## 📦 Cài Đặt & Sử Dụng

```typst
#import "@preview/cetz:0.3.4"
#import "typdraw3d/lib.typ": *
```

Hoặc sử dụng qua package tích hợp `sang-math`:
```typst
#import "@preview/cetz:0.3.4"
#import "@preview/sang-math:1.0.5": *
```

---

## 🚀 Ví Dụ Nhanh (Quick Examples)

### Ví dụ 1: Mô hình Chùm Đèn Treo 4 Dây
```typst
#cetz.canvas({
  preset-chum-den(
    n: 4,
    R: 2.8,
    z-cut: -1.2,
    S-height: 4.0,
    cam: make-camera(elevation: 20deg, azimuth: 35deg),
    shading: "orange",
  )
})
```

### Ví dụ 2: Mặt Phẳng Cắt Cầu & Vẽ Tam Giác Thiết Diện Tùy Biến
```typst
#cetz.canvas({
  let cam = make-camera(elevation: 22deg, azimuth: 35deg)
  let S = sphere((0.0, 0.0, 0.0), 2.6)
  let P = plane((0.0, 0.0, 1.2), (0.0, 0.0, 1.0))
  let cut = cut-sphere(S, P, keep: "below")

  // Vẽ khối chỏm cầu cắt
  draw-cut-sphere(cut: cut, cam: cam, shading: "blue")

  // Lấy 3 điểm trên vành miệng cắt theo thuật toán
  let A = cut-rim-point(cut, 20deg)
  let B = cut-rim-point(cut, 140deg)
  let C = cut-rim-point(cut, 250deg)

  // Nối tam giác thiết diện ABC
  draw-segment3d(A, B, cam: cam, stroke: 1.1pt + red)
  draw-segment3d(B, C, cam: cam, stroke: 1.1pt + red)
  draw-segment3d(C, A, cam: cam, stroke: 1.1pt + red)

  // Nối từ đỉnh chóp S bên ngoài
  let apex = (0.0, 0.0, 3.8)
  draw-segment3d(apex, A, cam: cam)
  draw-segment3d(apex, B, cam: cam)
  draw-segment3d(apex, C, cam: cam)
})
```

### Ví dụ 3: Giao Tuyến Hai Mặt Cầu Cắt Nhau
```typst
#cetz.canvas({
  let cam = make-camera(elevation: 20deg, azimuth: 35deg)
  let S1 = sphere((-1.3, 0.0, 0.0), 2.2)
  let S2 = sphere((1.2, 0.0, 0.0), 1.8)

  draw-sphere(center: S1.center, radius: S1.radius, cam: cam, shading: "orange")
  draw-sphere(center: S2.center, radius: S2.radius, cam: cam, shading: "emerald")

  // Tự động tìm đường tròn giao tuyến
  let inter = inter-sphere-sphere(S1, S2)
  if inter.type == "circle3d" {
    draw-circle3d(inter.center, inter.radius, inter.normal, cam: cam, stroke-visible: 1.4pt + red)
  }
})
```

---

## 🎨 Bảng Màu 3D Studio Sẵn Có
* `shading: "orange"`: Dải màu Cam Hổ Phách ấm áp (chuẩn hình bài đăng Facebook).
* `shading: "blue"`: Dải màu Lam Ngọc thanh lịch.
* `shading: "emerald"`: Dải màu Ngọc Lục Bảo 3D.
* `shading: "gold"`: Dải màu Vàng Hoàng Kim 3D.
* `shading: "amethyst"`: Dải màu Thạch Anh Tím 3D.
* Hoặc truyền bất kỳ đối tượng `gradient.radial(...)` tùy chỉnh nào của Typst!

---

## 📄 Bản Quyền & Tác Giả
* Phát triển bởi: **Sang Nguyen** (`sangnhc87@gmail.com`).
* Giấy phép: MIT License.
