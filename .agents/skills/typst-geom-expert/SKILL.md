---
name: typst-geom-expert
description: Chuyên gia sinh mã hình học không gian, hình phẳng, đồ thị và thiết diện bằng Typst phong cách sang-math (sm-*). Hướng dẫn AI tự động vẽ hình từ đề bài toán THPT mà không cần tính toạ độ thủ công.
---

# Typst Geometry Expert — Sư Phạm Sang Math

Skill này cung cấp tri thức cốt lõi và hướng dẫn chuẩn mực để AI tự động tạo hình vẽ Toán THPT bằng Typst mà **không cần tính toạ độ thủ công hay hardcode**. Tất cả mô hình AI khi nhận đề bài hình học đều phải tuân thủ quy chuẩn này.

---

## 1. Import Thư Viện Chuẩn
Mọi khối hình phải import thư viện `sang-math-geom.typ`:
```typst
#import "/conictypst/public/hdsd/typst/sang-math-geom.typ": *
```
*(Trong môi trường độc lập hoặc package có thể dùng `#import "@preview/sang-math:1.0.5": *`)*

---

## 2. Quy Tắc Cốt Lõi: Tận Dụng Hình Khối Cơ Sở & Hook `them`
**TUYỆT ĐỐI KHÔNG** vẽ lại từ đầu bằng lệnh CeTZ thô (`cetz.canvas`, `line`, `arc`...) cho các khối chóp/lăng trụ/nón/trụ thông dụng.
**BẮT BUỘC** chọn một khối cơ sở có sẵn, sau đó dùng hook `them: (ctx, d) => { ... }` để vẽ thêm.

### Danh Sách Khối Cơ Sở Thường Gặp
1. **Chóp tam giác:**
   - `sm-chop-sabc(a: 4, b: 3.5, h: 4, ten-dinh: ("S", "A", "B", "C"), them: ...)`
     - Cung cấp: `d.S`, `d.A`, `d.B`, `d.C` (Đoạn $AC$ nét đứt bên trong).
   - `sm-chop-sabc-deu(..)`: Chóp tam giác đều, cung cấp thêm tâm đáy `d.H`.
2. **Chóp tứ giác:**
   - `sm-chop-sabcd-sa(..)`: Chóp $S.ABCD$ có cạnh bên $SA \bot$ đáy.
     - Cung cấp: `d.S`, `d.A`, `d.B`, `d.C`, `d.D` (Các đoạn $AB, AD, SA$ nét đứt).
   - `sm-chop-sabcd-deu(..)`: Chóp tứ giác đều, cung cấp thêm tâm đáy `d.O`.
   - `sm-chop-day-hinh-thang(..)`: Đáy hình thang.
3. **Lăng trụ & Hình hộp:**
   - `sm-lang-tru-tam-giac(..)`: Cung cấp `d.A`, `d.B`, `d.C`, `d.A1`, `d.B1`, `d.C1`.
   - `sm-lang-tru-tu-giac(..)`, `sm-hop-chu-nhat(..)`, `sm-lap-phuong(..)`.
4. **Khối tròn xoay & Oxyz:**
   - `sm-non(r: 2.2, h: 3.5, ..)`: Cung cấp `d.S`, `d.O`, `d.A`, `d.B`.
   - `sm-tru(r: 2, h: 3.5, ..)`: Cung cấp `d.O1`, `d.O2`.
   - `sm-cau(r: 2.5, ..)`: Cung cấp `d.O`.
   - `sm-oxyz(xlim: (-1, 4), ylim: (-1, 4), zlim: (-1, 4), ..)`.

---

## 3. Hệ Thống Đại Số Dựng Hình `sm-*` (Tính Toạ Độ Không Thủ Công)

Khi vẽ thêm trong hook `them: (ctx, d) => { ... }`, AI dùng các hàm sau để tự động tính toán toạ độ:

| Hàm | Cú pháp | Ý nghĩa sư phạm |
|---|---|---|
| **Trung điểm** | `sm-trung-diem(A, B)` | Lấy toạ độ trung điểm của $AB$ |
| **Chia tỉ lệ** | `sm-ti-le(A, B, k)` | Điểm $M$ thoả $\vec{AM} = k \cdot \vec{AB}$ ($k = 1/3, 2/3\dots$) |
| **Trọng tâm** | `sm-trong-tam(A, B, C)` | Trọng tâm tam giác $ABC$ |
| **Giao điểm** | `sm-giao-diem(A, B, C, D)` | Giao điểm $I = AB \cap CD$ |
| **Hình bình hành / song song** | `sm-song-song(A, B, C)` | Dựng điểm $D$ sao cho $\vec{CD} = \vec{AB}$ |
| **Hình chiếu vuông góc** | `sm-hinh-chieu(P, A, B)` | Chân đường cao kẻ từ $P$ xuống $AB$ ($PH \bot AB$) |
| **Khoảng cách** | `sm-khoang-cach(A, B)` | Tính độ dài đoạn $AB$ |
| **Vector** | `sm-vecto(A, B)` | Vector $\vec{AB} = B - A$ |
| **Phép quay** | `sm-quay(P, tam, goc)` | Quay điểm $P$ quanh $tam$ góc $goc$ |

---

## 4. Các Hàm Vẽ Phần Tử Mở Rộng

1. **Vẽ đoạn thẳng:**
   ```typst
   sm-doan(ctx, A, B, dut: false, mau: blue, day: 1.2pt) // dut: true nếu là nét đứt
   ```
2. **Tô màu thiết diện đa giác:**
   ```typst
   sm-thiet-dien(ctx, (A, M, N, P), mau: rgb("7c3aed40"), day: 1.5pt)
   ```
3. **Ký hiệu góc vuông:**
   ```typst
   sm-ve-goc-vuong(ctx, A, O, B) // Ký hiệu vuông tại đỉnh O
   ```
4. **Vẽ cung góc & số đo:**
   ```typst
   sm-ve-goc(ctx, S, C, A, r: 0.6, ten: [$45 degree$]) // Cung tại C
   ```
5. **Chấm điểm & Gắn nhãn:**
   ```typst
   sm-diem(ctx, M, ten: "M", huong: "tay") // huong: "dong", "tay", "bac", "nam", "tren", "duoi"...
   ```
6. **Vẽ vectơ / mũi tên:**
   ```typst
   sm-mui-ten(ctx, A, B, mau: red)
   ```

---

## 5. Quy Trình 4 Bước AI Giải Đề Bài & Sinh Code Vẽ Hình

Khi nhận đề bài, AI thực hiện tuần tự:

- **Bước 1: Phân loại khối gốc.**
  - Đáy là gì? (tam giác, tứ giác, hình thang...).
  - Đường cao là gì? (cạnh bên $SA \bot$ đáy $\to$ dùng `sm-chop-sabcd-sa`; chóp đều $\to$ dùng `sm-chop-*-deu`...).
- **Bước 2: Xác định các điểm cần dựng thêm.**
  - Trung điểm $\to$ gọi `sm-trung-diem`.
  - Tỉ số đoạn $\to$ gọi `sm-ti-le`.
  - Chân đường vuông góc $\to$ gọi `sm-hinh-chieu`.
  - Giao điểm thiết diện $\to$ gọi `sm-giao-diem`.
- **Bước 3: Phân định nét đứt (`dut: true`) và nét liền (`dut: false`).**
  - Các đoạn nằm bên trong khối, xuyên qua lòng khối chóp hoặc bị các mặt phẳng khác che khuất **BẮT BUỘC** đặt `dut: true`.
  - Các đoạn nằm trên mặt ngoài nhìn thấy được đặt `dut: false`.
- **Bước 4: Hoàn thiện trực quan.**
  - Tô màu thiết diện nếu đề bài yêu cầu tìm thiết diện (`sm-thiet-dien`).
  - Gắn góc vuông hoặc số đo góc nếu có góc giữa đường và mặt hoặc góc giữa 2 mặt phẳng.
  - Chấm và đặt tên tất cả các điểm mới tạo bằng `sm-diem`.

---

## 6. Các Mẫu Bài Toán THPT Chuẩn Mực (Few-Shot Examples)

### Ví dụ 1: Thiết Diện Cắt Chóp Tam Giác $S.ABC$
```typst
#import "/conictypst/public/hdsd/typst/sang-math-geom.typ": *

#sm-chop-sabc(
  ten-dinh: ("S", "A", "B", "C"),
  them: (ctx, d) => {
    let M = sm-trung-diem(d.S, d.B)
    let N = sm-ti-le(d.S, d.C, 2/3)
    
    // Nối thiết diện AMN
    sm-doan(ctx, d.A, M, dut: true, mau: blue)
    sm-doan(ctx, M, N, dut: false, mau: blue)
    sm-doan(ctx, d.A, N, dut: true, mau: blue)
    
    // Tô màu mờ mặt cắt thiết diện
    sm-thiet-dien(ctx, (d.A, M, N), mau: rgb("7c3aed35"))
    
    // Đánh dấu điểm
    sm-diem(ctx, M, ten: "M", huong: "tay")
    sm-diem(ctx, N, ten: "N", huong: "dong")
  }
)
```

### Ví dụ 2: Góc $45^\circ$ Giữa Cạnh Bên $SC$ và Đáy Chóp Đều $S.ABCD$
```typst
#import "/conictypst/public/hdsd/typst/sang-math-geom.typ": *

#sm-chop-sabcd-deu(
  them: (ctx, d) => {
    // Đường cao SO và đường chéo đáy OC
    sm-doan(ctx, d.S, d.O, dut: true, mau: red)
    sm-doan(ctx, d.O, d.C, dut: true, mau: red)
    
    // Ký hiệu góc vuông và số đo góc 45°
    sm-ve-goc-vuong(ctx, d.S, d.O, d.C)
    sm-ve-goc(ctx, d.S, d.C, d.O, r: 0.7, ten: [$45 degree$])
    sm-diem(ctx, d.O, ten: "O", huong: "duoi")
  }
)
```

### Ví dụ 3: Khoảng Cách Từ $A$ Đến Mặt Phẳng $(SBC)$ Qua $AH \bot SB$
```typst
#import "/conictypst/public/hdsd/typst/sang-math-geom.typ": *

#sm-chop-sabcd-sa(
  h: 4.2,
  them: (ctx, d) => {
    // Kẻ AH vuông góc với SB
    let H = sm-hinh-chieu(d.A, d.S, d.B)
    
    sm-doan(ctx, d.A, H, dut: true, mau: red, day: 1.5pt)
    sm-ve-goc-vuong(ctx, d.S, H, d.A)
    sm-diem(ctx, H, ten: "H", huong: "tay")
  }
)
```

### Ví dụ 4: Thiết Diện Song Song Trong Lăng Trụ Tam Giác
```typst
#import "/conictypst/public/hdsd/typst/sang-math-geom.typ": *

#sm-lang-tru-tam-giac(
  them: (ctx, d) => {
    let M = sm-ti-le(d.A, d.B, 1/3)
    let N = sm-ti-le(d.A, d.C, 1/3)
    let M1 = sm-song-song(d.A, d.A1, M)
    let N1 = sm-song-song(d.A, d.A1, N)
    
    // Nối và tô thiết diện (MNN1M1)
    sm-doan(ctx, M, N, dut: true, mau: purple)
    sm-doan(ctx, N, N1, dut: false, mau: purple)
    sm-doan(ctx, N1, M1, dut: false, mau: purple)
    sm-doan(ctx, M1, M, dut: false, mau: purple)
    sm-thiet-dien(ctx, (M, N, N1, M1), mau: rgb("9333ea30"))
    
    sm-diem(ctx, M, ten: "M", huong: "duoi")
    sm-diem(ctx, N, ten: "N", huong: "dong")
    sm-diem(ctx, M1, ten: "M'", huong: "trai")
    sm-diem(ctx, N1, ten: "N'", huong: "dong")
  }
)
```
