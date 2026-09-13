# HƯỚNG DẪN SỬ DỤNG TYPDRAW3D v0.2.0

> **Gói Hình Học Không Gian THPT & Đồ Họa 3D Thuật Toán Tự Động Cho Typst**  
> *Chuẩn SGK GDPT Mới • Thuật toán 3D tự động (Phong cách Luadraw) • Dễ dùng • Dễ vẽ thêm với callback hook `them: d => { ... }`*  
> **Tác giả:** ThS. Nguyễn Sáng (`sangnhc87@gmail.com`)

---

## 📑 Mục Lục
1. [Khởi Động Nhanh (Quickstart)](#1-khởi-động-nhanh-quickstart)
2. [Cơ Chế Hook `them: d => { ... }`](#2-cơ-chế-hook-them-d----)
3. [Thư Viện Hình Học Không Gian THPT](#3-thư-viện-hình-học-không-gian-thpt)
   - [Khối chóp (Tam giác, Tứ giác, Lục giác đều, Chóp cụt)](#a-các-khối-chóp)
   - [Khối lăng trụ & Khối hộp (Hộp chữ nhật, Lập phương)](#b-các-khối-lăng-trụ--khối-hộp)
   - [Khối tròn xoay (Hình nón, Hình trụ, Khối cầu)](#c-các-khối-tròn-xoay)
4. [Hình Học Tọa Độ Oxyz (Toán 12)](#4-hình-học-tọa-độ-oxyz-toán-12)
   - [Hệ trục tọa độ `he-truc-oxyz-fig`](#a-hệ-trục-tọa-độ-oxyz)
   - [Điểm gióng hình hộp tự động `diem-oxyz(giong: true)`](#b-điểm-gióng-tọa-độ-tự-động)
   - [Mặt phẳng đoạn chắn `mat-phang-doan-chan`](#c-mặt-phẳng-đoạn-chắn)
   - [Bộ giải giải tích không gian Oxyz (Solvers)](#d-bộ-giải-giải-tích-oxyz)
5. [Động Cơ 3D Thuật Toán (Luadraw Engine)](#5-động-cơ-3d-thuật-toán-luadraw-engine)
6. [Bảng Tra Cứu Nhanh (Cheat Sheet)](#6-bảng-tra-cứu-nhanh-cheat-sheet)

---

## 1. Khởi Động Nhanh (Quickstart)

Import thư viện vào file `.typ` của bạn:

```typst
#import "@preview/typdraw3d:0.2.0": *
// Hoặc khi sử dụng local trong dự án:
// #import "lib.typ": *
```

Chèn một hình chóp tam giác có sẵn đường cao hạ từ $S$ xuống trọng tâm đáy $H$ chỉ với **1 dòng lệnh**:

```typst
#hinh-chop-tam-giac-fig(duong-cao: "tam")
```

---

## 2. Cơ Chế Hook `them: d => { ... }`

Khi muốn vẽ thêm các điểm, trung điểm, hạ đường vuông góc, hay tô màu thiết diện, bạn chỉ cần truyền hàm `them: d => { ... }`.  
Biến `d` tự động mang toàn bộ toạ độ 2D của các đỉnh tương ứng:

```typst
#hinh-chop-tam-giac-fig(
  duong-cao: "dinh-a",
  them: d => {
    // d chứa: d.S, d.A, d.B, d.C
    // 1. Tính trung điểm cạnh SB và SC:
    let M = trung-diem(d.S, d.B)
    let N = trung-diem(d.S, d.C)
    
    // 2. Chấm điểm và đặt nhãn:
    ve-diem(M, ten: $M$, huong: "east")
    ve-diem(N, ten: $N$, huong: "west")
    
    // 3. Tô màu thiết diện AMN (độ mờ 25%):
    ve-thiet-dien((d.A, M, N), mau: orange, do-mo: 25%)
    
    // 4. Vẽ các cạnh thiết diện:
    ve-doan(d.A, M, mau: rgb("d97706"), day: 1pt)
    ve-doan(M, N, mau: rgb("d97706"), day: 1pt)
    ve-doan(d.A, N, dut: true, mau: rgb("d97706"), day: 1pt)
  }
)
```

---

## 3. Thư Viện Hình Học Không Gian THPT

### A. Các Khối Chóp
- **Chóp tam giác:** `#hinh-chop-tam-giac-fig(duong-cao: "dinh-a" | "tam" | none)`
- **Chóp tứ giác:** `#hinh-chop-tu-giac-fig(duong-cao: "dinh-a" | "tam" | none, duong-cheo: true)`
- **Chóp tứ giác đều:** `#hinh-chop-tu-giac-deu-fig(duong-cao: true, ten-tam: $O$)`
- **Chóp lục giác đều:** `#hinh-chop-luc-giac-deu-fig(duong-cao: true)`
- **Chóp cụt đều:** `#hinh-chop-cut-deu-fig(truc: true, ten-tam: ($O$, $O'$))`
- **Tam diện vuông:** `#hinh-chop-tam-dien-vuong-fig()`

### B. Các Khối Lăng Trụ & Khối Hộp
- **Lăng trụ tam giác:** `#hinh-lang-tru-tam-giac-fig(h: 3.2)`
- **Hình hộp chữ nhật / Lập phương:** `#hinh-hop-fig(duong-cheo: true)` (bí danh: `#hinh-hop-chu-nhat-fig`, `#hinh-lap-phuong-fig`)
- **Lăng trụ lục giác đều:** `#hinh-lang-tru-luc-giac-deu-fig(h: 3.2)`

### C. Các Khối Tròn Xoay
- **Hình nón:** `#hinh-non-thpt-fig(r: 1.8, h: 3.2, b: 0.5)`
- **Hình trụ:** `#hinh-tru-thpt-fig(r: 1.6, h: 3.0, b: 0.45)`
- **Khối cầu:** `#hinh-cau-thpt-fig(r: 2.0, b: 0.55)`

---

## 4. Hình Học Tọa Độ Oxyz (Toán 12)

### A. Hệ trục tọa độ Oxyz
```typst
#he-truc-oxyz-fig(
  x: 3.5, y: 4.5, z: 4.0,   // Phạm vi từng trục
  don-vi: true,              // Vẽ vectơ đơn vị i, j, k
  vach: true, so: true,      // Hiện vạch chia và số
  luoi: ("xy",),             // Lưới mặt phẳng Oxy
  them: d => {
    // d chứa: d.t3 (hàm đổi 3D -> 2D), d.O, d.X, d.Y, d.Z
  }
)
```

### B. Điểm gióng tọa độ tự động
Khi bật `giong: true`, điểm 3D tự động vẽ hình hộp nét đứt gióng xuống mặt đáy $Oxy$, gióng lên 3 trục và tự động đánh số mốc trên trục:

```typst
#he-truc-oxyz-fig(
  them: d => {
    let t3 = d.t3
    diem-oxyz(t3, (2.2, 3.0, 2.5), ten: $M(2.2; 3.0; 2.5)$, giong: true, mau: blue)
  }
)
```

### C. Mặt phẳng đoạn chắn
```typst
#he-truc-oxyz-fig(
  don-vi: false,
  them: d => {
    mat-phang-doan-chan(d.t3, a: 2.5, b: 3.2, c: 2.8, ten: $(alpha)$, do-mo: 20%)
  }
)
```

### D. Bộ giải giải tích Oxyz
- `v3-cong(u, v)`, `v3-tru(u, v)`, `v3-nhan(u, k)`, `v3-vo-huong(u, v)`, `v3-co-huong(u, v)`.
- `tich-hon-tap(u, v, w)`: Tích hỗn tạp $[u, v, w] = (u \times v) \cdot w$.
- `khoang-cach-3d(A, B)`: Khoảng cách giữa 2 điểm.
- `pt-mat-phang(A, B, C)`: Lập phương trình $a x + b y + c z + d = 0$ qua 3 điểm.
- `khoang-cach-diem-mp(M, mp)`: Khoảng cách từ điểm đến mặt phẳng.
- `hinh-chieu-diem-mp(M, mp)`: Tọa độ hình chiếu vuông góc lên mặt phẳng.
- `giao-dt-mp(M0, u, mp)`: Giao điểm đường thẳng và mặt phẳng.

---

## 5. Động Cơ 3D Thuật Toán (Luadraw Engine)

Dành cho các bài toán dựng hình xoay tự do và đồ họa kỹ thuật cao:
- **Camera 3D:** `make-camera(elevation: 20deg, azimuth: 35deg, scale: 1.0)`
- **Chao đèn chùm n đỉnh chuẩn Luadraw (`preset-chum-den-luadraw-fig`):**
  Tái hiện 100% hình ảnh chao đèn chỏm cầu cắt, $n$ dây treo từ đỉnh $S$, và $n$ vector lực $\vec{F}_i$:
  ```typst
  #preset-chum-den-luadraw-fig(n: 3, shading: "orange", S-height: 4.0)
  #preset-chum-den-luadraw-fig(n: 4, shading: "blue", S-height: 4.2)
  #preset-chum-den-luadraw-fig(n: 5, shading: "emerald", S-height: 4.2)
  #preset-chum-den-luadraw-fig(n: 6, shading: "purple", S-height: 4.2)
  ```
- **Mặt cầu bị cắt thuật toán (`dcut-sphere-fig`):**
  ```typst
  #dcut-sphere-fig(
    center: (0, 0, 0), radius: 2.8,
    plane-pt: (0, 0, -1.0), plane-normal: (0, 0, 1.0),
    keep: "below", shading: "orange",
    them: d => {
      // d chứa: d.center, d.radius, d.circle_center, d.circle_radius
      // d.lay-diem(n, phase) -> trả về n đỉnh trên vành chao đèn
    }
  )
  ```
- **Trọn bộ 5 Khối Đa Diện Đều Platon & Khối Archimedes:**
  Tự động khử nét khuất (*Back-face Culling*) và đổ bóng ánh sáng định hướng (*Lambertian Diffuse Lighting*):
  ```typst
  #tetrahedron-fig(radius: 2.2, palette: "orange")   // 1. Tứ diện đều (4 mặt)
  #cube-fig(size: 2.4, palette: "blue")              // 2. Lập phương (6 mặt)
  #octahedron-fig(radius: 2.2, palette: "emerald")   // 3. Bát diện đều (8 mặt)
  #dodecahedron-fig(radius: 2.2, palette: "violet")  // 4. 12 mặt đều (Dodecahedron)
  #icosahedron-fig(radius: 2.2, palette: "gold")     // 5. 20 mặt đều (Icosahedron)
  #cuboctahedron-fig(radius: 2.2, palette: "blue")   // 6. Bán đều Cuboctahedron
  ```

---

## 6. Động Cơ Đại Số Hình Học Không Gian Linh Hoạt (Geometric Algebra)

Mô-đun `algebra3d` biến thư viện từ tập hợp hình vẽ cố định thành **một hệ thống đại số hình học giải tích linh hoạt**, giải quyết các bài toán hình học không gian phức tạp mà không cần người dùng tự bấm máy tính hay tính tay tọa độ 2D.

### a. Khởi tạo đối tượng hình học
```typst
let A = pt(0, 0, 0)
let B = pt(4, 0, 0)
let C = pt(1, 3, 0)
let S = pt(0, 0, 4)

let u = vec-ab(A, B)                      // Vector AB = B - A
let line-SB = dt(S, B)                   // Đường thẳng qua S và B
let mp-ABC = mp(A, B, C)                 // Mặt phẳng qua 3 điểm A, B, C
let mp-P = mp(A, phap-tuyen: (0, 0, 1))  // Mặt phẳng qua A với pháp tuyến n
let S-sph = cau(A, R: 3.0)               // Mặt cầu tâm A bán kính 3
```

### b. Các điểm đặc biệt & Đại số Affine
- `trung-diem(A, B)`: Trung điểm đoạn thẳng $A B$.
- `chia-doan(A, B, k)`: Điểm $M$ thỏa $\vec{A M} = k \vec{A B}$.
- `trong-tam(A, B, C)` hoặc `trong-tam(S, A, B, C)`: Trọng tâm tam giác hoặc tứ diện.
- `tam-ngoai-tiep(A, B, C)`: Tâm đường tròn ngoại tiếp tam giác trong 3D.
- `truc-tam(A, B, C)`: Trực tâm tam giác trong 3D (theo định lý đường thẳng Euler).
- `tam-noi-tiep(A, B, C)`: Tâm đường tròn nội tiếp tam giác trong 3D.

### c. Chiếu vuông góc, Đối xứng & Đoạn vuông góc chung
- `chieu-len-duong(P, line)`: Chân đường vuông góc hạ từ $P$ xuống đường thẳng.
- `chieu-len-mat(P, plane)`: Hình chiếu vuông góc của $P$ lên mặt phẳng.
- `doi-xung-qua-diem(P, I)`: Điểm đối xứng qua tâm $I$.
- `doi-xung-qua-duong(P, line)`, `doi-xung-qua-mat(P, plane)`: Điểm đối xứng qua đường/mặt.
- `doan-vuong-goc-chung(line1, line2)`: **Tự động tìm 2 điểm $M_1 \in d_1, M_2 \in d_2$** sao cho $M_1 M_2 \perp d_1$ và $M_1 M_2 \perp d_2$.
- `khoang-cach-hai-duong(line1, line2)`: Khoảng cách giữa 2 đường thẳng chéo nhau.

### d. Góc không gian & Phép quay Rodrigues
- `goc-hai-vecto(u, v)`, `goc-hai-duong(d1, d2)`
- `goc-duong-mat(line, plane)`, `goc-hai-mat(plane1, plane2)`
- `quay-quanh-truc(point, truc-goc, truc-huong, goc)`: Phép quay 3D quanh trục bất kỳ theo công thức Rodrigues.

### e. Cắt thiết diện đa diện tự động (`cat-thiet-dien`)
```typst
let poly = (vertices: (S, A, B, C), faces: ((1, 2, 3), (0, 1, 2), (0, 2, 3), (0, 3, 1)))
let mp-cat = mat-phang(M, phap-tuyen: (0, 0, 1))

// Tự động tìm giao điểm trên các cạnh và sắp xếp thứ tự chu vi thiết diện lồi:
let td = cat-thiet-dien(poly, mp-cat)
```

### f. Môi trường dựng hình đại số `khong-gian-3d`
```typst
#khong-gian-3d(cam: make-camera(elevation: 20deg, azimuth: 35deg), g => {
  (g.doan)(A, B)
  (g.doan)(S, A, dut: true)
  (g.diem)(A, ten: $A$, huong: "east")
  (g.da-giac)(td, fill: blue.lighten(80%), stroke: 1.2pt + blue)
  (g.goc-vuong)(S, M1, M2)
})
```

---

## 7. Bảng Tra Cứu Nhanh (Cheat Sheet)

| Tên hàm | Mô-đun | Tham số chính |
|---|---|---|
| `preset-chum-den-luadraw-fig` | `luadraw` | `n: 3\|4\|5\|6`, `R`, `z-cut`, `S-height`, `shading`, `hien-luc: true` |
| `dcut-sphere-fig` | `luadraw` | `center`, `radius`, `plane-pt`, `plane-normal`, `shading`, `them` |
| `tetrahedron-fig` | `polyhedra` | `center`, `radius`, `palette`, `shading`, `stroke-visible`, `them` |
| `cube-fig` | `polyhedra` | `center`, `size`, `palette`, `shading`, `stroke-visible`, `them` |
| `octahedron-fig` | `polyhedra` | `center`, `radius`, `palette`, `shading`, `stroke-visible`, `them` |
| `dodecahedron-fig` | `polyhedra` | `center`, `radius`, `palette`, `shading`, `stroke-visible`, `them` |
| `icosahedron-fig` | `polyhedra` | `center`, `radius`, `palette`, `shading`, `stroke-visible`, `them` |
| `cuboctahedron-fig` | `polyhedra` | `center`, `radius`, `palette`, `shading`, `stroke-visible`, `them` |
| `chop-s-abcd-fig` / `hinh-chop-tu-giac-fig` | `thpt` | `duong-cao`, `ten`, `duong-cheo: true`, `them` |
| `chop-s-abc-fig` / `hinh-chop-tam-giac-fig` | `thpt` | `duong-cao` ("dinh-a" / "tam"), `ten`, `them` |
| `chop-deu-tu-giac-fig` | `thpt` | `duong-cao: true`, `ten-tam: $O$`, `them` |
| `lang-tru-tam-giac-fig` | `thpt` | `h: 3.2`, `ten`, `them` |
| `hop-chu-nhat-fig` / `lap-phuong-fig` | `thpt` | `duong-cheo: true`, `ten`, `them` |
| `non-fig` / `hinh-non-thpt-fig` | `thpt` | `r: 2.0`, `h: 3.5`, `b: 0.55`, `them` |
| `tru-fig` / `hinh-tru-thpt-fig` | `thpt` | `r: 1.8`, `h: 3.2`, `b: 0.5`, `them` |
| `cau-fig` / `hinh-cau-thpt-fig` | `thpt` | `r: 2.2`, `b: 0.6`, `them` |
| `oxyz-fig` / `he-truc-oxyz-fig` | `oxyz` | `x`, `y`, `z`, `don-vi`, `vach`, `so`, `luoi`, `them` |
| `diem-oxyz` | `oxyz` | `t3`, `P: (x,y,z)`, `ten`, `giong: true`, `mau` |
| `mat-phang-doan-chan` | `oxyz` | `t3`, `a`, `b`, `c`, `ten: $(alpha)$`, `do-mo` |
| `trung-diem` | `thpt` | `(A, B)` $\to$ toạ độ `(x, y)` |
| `ti-le` | `thpt` | `(A, B, k)` $\to$ `A + k(B - A)` |
| `trong-tam` | `thpt` | `(..pts)` $\to$ toạ độ trọng tâm |
| `ve-diem` | `thpt` | `pt`, `ten`, `huong`, `lech`, `bk`, `mau` |
| `ve-doan` | `thpt` | `A`, `B`, `dut: false`, `mau`, `day` |
| `ve-goc-vuong` | `thpt` | `A`, `O`, `B`, `r`, `mau`, `day` |
| `ve-cung-goc` | `thpt` | `A`, `O`, `B`, `r`, `nhan`, `mau` |
| `ve-thiet-dien` | `thpt` | `pts: (A, B, C...)`, `mau`, `do-mo` |
