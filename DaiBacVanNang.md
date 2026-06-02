# Cẩm Nang Đại Bác Vạn Năng: Phương Pháp Quét Cột Từng Bước
*(Giải quyết mọi bài toán tô màu lưới khuyết, lưới dị biệt với số màu k bất kỳ và chiều cao h bất kỳ)*

---

## PHẦN I: TƯ DUY TỔNG QUÁT (ĐẠI BÁC QUÉT CỘT)

Bất kỳ lưới dạng ô vuông nào (dù bị khuyết góc, khuyết giữa, thắt eo, hay lắp ghép kỳ lạ) đều có chung một cách giải hệ thống duy nhất: **Quét từ trái sang phải theo từng cột đứng**.

### Tại sao lại quét theo cột?
Thay vì bối rối chọn màu lộn xộn cho cả lưới, việc quét cột giống như ta đang sơn một bức tường từ trái qua phải. Khi tô một cột mới, ta **chỉ cần nhìn cột ngay bên trái nó để né màu**, những cột xa hơn ở bên trái đã tô xong sẽ không còn ảnh hưởng trực tiếp nữa. Điều này giúp cô lập ràng buộc chéo và chia nhỏ bài toán thành các bước chuyển tiếp đơn giản.

---

## PHẦN II: BỘ 3 QUY TẮC VẠN NĂNG (Tổng quát cho $k$ màu)

Học sinh chỉ cần nắm vững đúng 3 quy tắc sau là có thể tự suy luận hệ số nhân cho từng cột của mọi mô hình:

### Quy tắc 1: Cột khởi đầu (Cột 1)
Số cách tô một cột đứng độc lập gồm $h$ ô liên tiếp là:
$$N_{\text{Cột 1}} = k(k-1)^{h-1}$$
* *Cột 1 cao 1 ô:* có $k$ cách.
* *Cột 1 cao 2 ô:* có $k(k-1)$ cách.
* *Cột 1 cao 3 ô:* có $k(k-1)^2$ cách.

### Quy tắc 2: Chuyển tiếp Cột đầy đủ (Tiêu chuẩn)
Khi cột mới cao $h$ ô kề đầy đủ sang cột trước cũng cao $h$ ô:
* **Nếu $h=1$:** Nhân thêm hệ số $(k-1)$.
* **Nếu $h=2$:** Nhân thêm hệ số chuyển tiếp đầy đủ $H = k^2 - 3k + 3$ (với $k=4 \Rightarrow H=7$).

### Quy tắc 3: Chuyển tiếp Cột Khuyết / Biến dạng (Tô từng ô)
Ta tô lần lượt từng ô của cột mới từ trên xuống dưới (hoặc dưới lên trên). Số cách chọn màu của mỗi ô chỉ phụ thuộc vào số ô kề sát đã tô màu lân cận nó:
* **Ô chỉ kề sát với 1 ô đã tô màu** (dù kề ngang hay kề dọc): Luôn có $(k-1)$ cách chọn. *(Hệ quả: Khuyết giảm)*.
* **Ô kề sát với 2 ô đã tô màu** (mà 2 ô đó kề nhau nên khác màu nhau): Luôn có $(k-2)$ cách chọn.
* **Nếu kề sát 2 ô đã tô màu mà hai ô đó chéo nhau** (chưa biết trùng hay khác màu): Ta chia làm 2 trường hợp để tính (xem phần chứng minh bên dưới).

---

## PHẦN III: CHỨNG MINH & BẢN CHẤT TOÁN HỌC

Để không học vẹt, hãy cùng tự tay tô thử với bộ $k=4$ màu: **{Đỏ, Xanh, Vàng, Tím}** để thấy các con số này cực kỳ tự nhiên:

### 1. Tại sao ô kề sát 1 ô đã tô lại có $k-1 = 3$ cách?
```
[ Đỏ ] ───► [ ? ] (Phải né màu Đỏ)
            Lựa chọn còn lại: {Xanh, Vàng, Tím} => 3 cách.
```

### 2. Tại sao ô kề sát 2 ô đã tô (kề nhau) lại có $k-2 = 2$ cách?
```
[ Đỏ ]
  │
[ Xanh ] ───► [ ? ] (Phải né cả Đỏ và Xanh)
              Lựa chọn còn lại: {Vàng, Tím} => 2 cách.
```

### 3. Tại sao chuyển tiếp cột 2 ô lại nhân thêm $H = k^2 - 3k + 3 = 7$ cách?
Giả sử cột trước đã tô xong có ô trên màu **Đỏ**, ô dưới màu **Xanh**. Khi tô cột mới (gồm ô trên mới và ô dưới mới), ta tô ô trên mới trước (ô này kề ngang ô Đỏ nên phải né Đỏ $\Rightarrow$ có 3 cách chọn: Xanh, Vàng, Tím):

* **Trường hợp 1 (Ô trên mới lấy màu Xanh - 1 cách):**
  ```
  [ Đỏ ]       [ Xanh ] (Trùng màu ô dưới cũ)
    │            │
  [ Xanh ] ───► [ ? ] (Ô này kề ngang Xanh và kề dọc Xanh => Chỉ cần né Xanh)
                Lựa chọn còn lại: {Đỏ, Vàng, Tím} => 3 cách.
  => Số cách TH1 = 1 * 3 = 3 cách.
  ```

* **Trường hợp 2 (Ô trên mới lấy màu Vàng hoặc Tím - 2 cách):**
  ```
  [ Đỏ ]       [ Vàng ] (Khác màu ô dưới cũ)
    │            │
  [ Xanh ] ───► [ ? ] (Ô này kề ngang Xanh và kề dọc Vàng => Phải né cả hai)
                Lựa chọn còn lại: {Đỏ, Tím} => 2 cách.
  => Số cách TH2 = 2 * 2 = 4 cách.
  ```

* **Cộng hai trường hợp:** $3 + 4 = 7$ cách (Với $k$ màu: $1 \cdot (k-1) + (k-2) \cdot (k-2) = k^2 - 3k + 3$).

---

## PHẦN IV: ÁP DỤNG KHI SỐ MÀU KHÁC 4 ($k \neq 4$)

Khi số màu $k$ thay đổi, bộ quy tắc vạn năng vẫn không đổi, ta chỉ cần thế giá trị $k$ vào công thức:

### 1. Nếu chỉ có $k=3$ màu ({Đỏ, Xanh, Vàng})
* **Né 1 ô đã tô:** $k-1 = 2$ cách.
* **Né 2 ô khác màu:** $k-2 = 1$ cách.
* **Hệ số chuyển tiếp cột đầy đủ $H$:** $k^2 - 3k + 3 = 3^2 - 3(3) + 3 = 3$ cách.
* **Ví dụ:** Cho lưới $2 \times 2$ tô bằng 3 màu.
  * Cột 1 (Quy tắc 1): Cao 2 ô $\Rightarrow 3 \times 2 = 6$ cách.
  * Cột 2 (Quy tắc 2): Kề đủ $\Rightarrow$ Nhân $H = 3$.
  * Tổng số cách tô: $6 \times 3 = 18$ cách.

### 2. Nếu có $k=5$ màu ({Đỏ, Xanh, Vàng, Tím, Cam})
* **Né 1 ô đã tô:** $k-1 = 4$ cách.
* **Né 2 ô khác màu:** $k-2 = 3$ cách.
* **Hệ số chuyển tiếp cột đầy đủ $H$:** $k^2 - 3k + 3 = 5^2 - 3(5) + 3 = 13$ cách.
* **Ví dụ:** Cho lưới $2 \times 2$ tô bằng 5 màu.
  * Cột 1: $5 \times 4 = 20$ cách.
  * Cột 2: Nhân $H = 13$.
  * Tổng số cách tô: $20 \times 13 = 260$ cách.

---

## PHẦN V: ÁP DỤNG KHI CHIỀU CAO CỘT LỚN HƠN 2 ($h > 2$)

Hãy cùng giải một bài toán thực tế cực hay với lưới cao 3 ô và số màu khác 4:

### Bài toán: Lưới khuyết bậc thang $3 \times 3$ với $k=3$ màu
Cho lưới gồm 6 ô được xếp thành dạng bậc thang như hình dưới đây. Có 3 màu sơn khác nhau. Yêu cầu hai ô chung cạnh phải khác màu. Hỏi có bao nhiêu cách tô?
```
Cột:     Cột 1       Cột 2       Cột 3
Dòng 3   [   ]
           │
Dòng 2   [   ] ───── [   ]
           │           │
Dòng 1   [   ] ───── [   ] ───── [   ]
```
*(Cột 1 cao 3 ô, Cột 2 cao 2 ô ở dưới, Cột 3 cao 1 ô ở dòng 1)*

#### Lời giải từng bước bằng Đại Bác Vạn Năng:

**Bước 1: Tô Cột 1 (Quy tắc 1 - Cao 3 ô dọc)**
* Số cách tô cột đứng 3 ô là: $k(k-1)^2 = 3 \times (2)^2 = 12$ cách.
*(Giả sử ta tô được: Cột 1 Dòng 3 màu Đỏ, Dòng 2 màu Xanh, Dòng 1 màu Vàng)*.

**Bước 2: Tô Cột 2 (Quy tắc 3 - Cột khuyết cao 2 ô)**
Ta tô từng ô của Cột 2 từ dưới lên trên:
* **Tô ô Cột 2 Dòng 1:** Ô này chỉ kề ngang với ô Cột 1 Dòng 1 (màu Vàng). Phía dưới không có ô nào.
  $\Rightarrow$ Chỉ cần né màu Vàng $\Rightarrow$ có $k-1 = 2$ cách chọn ({Đỏ, Xanh}).
  *(Giả sử ta chọn màu Đỏ cho ô này)*.
* **Tô ô Cột 2 Dòng 2:** Ô này kề ngang ô Cột 1 Dòng 2 (màu Xanh) và kề dọc ô Cột 2 Dòng 1 (màu Đỏ). 
  $\Rightarrow$ Vì hai ô kề lân cận này khác màu nhau (Xanh và Đỏ), nên ô này phải né cả hai $\Rightarrow$ có $k-2 = 3-2 = 1$ cách chọn ({Vàng}).
* **Vậy hệ số chuyển tiếp cho Cột 2 là:** $2 \times 1 = 2$ cách.

**Bước 3: Tô Cột 3 (Quy tắc 3 - Cao 1 ô)**
* Ô duy nhất của Cột 3 nằm ở Dòng 1. Ô này chỉ kề ngang với ô Cột 2 Dòng 1 (màu Đỏ). Phía trên nó khuyết hoàn toàn.
  $\Rightarrow$ Chỉ cần né màu Đỏ $\Rightarrow$ có $k-1 = 2$ cách chọn ({Xanh, Vàng}).
* **Hệ số Cột 3:** $2$ cách.

**Bước 4: Tổng hợp kết quả**
Áp dụng quy tắc nhân, tổng số cách tô màu cho lưới bậc thang này là:
$$N = N_{\text{Cột 1}} \times N_{\text{Cột 2}} \times N_{\text{Cột 3}} = 12 \times 2 \times 2 = 48\text{ cách.}$$

---

## PHẦN VI: TÓM TẮT ĐÁP ÁN NHANH CÁC MÔ HÌNH VẠN NĂNG ($k=4$)

Dưới đây là bảng tra nhanh công thức và kết quả khi áp dụng cho lưới khuyết dùng bộ $k=4$ màu ($H=7$, $k-1=3$, $k-2=2$):

| Mô hình lưới | Chiều cao các cột | Phép tính chi tiết | Đáp án ($k=4$) |
| :--- | :---: | :---: | :---: |
| **Mô hình A (Khuyết góc)** | $2 \rightarrow 2 \rightarrow 1$ | Cột 1 ($12$) $\times$ Cột 2 ($H=7$) $\times$ Cột 3 (né 1 ô $\Rightarrow 3$) | **252 cách** |
| **Mô hình B (Khuyết giữa)** | $2 \rightarrow 1 \rightarrow 2$ | Cột 1 ($12$) $\times$ Cột 2 (né 1 $\Rightarrow 3$) $\times$ Cột 3 (né 1 rồi né dọc $\Rightarrow 3 \times 3 = 9$) | **324 cách** |
| **Mô hình D (Bậc thang)** | $1 \rightarrow 2 \rightarrow 1$ | Cột 1 ($4$) $\times$ Cột 2 (né 1 rồi né dọc $\Rightarrow 3 \times 3 = 9$) $\times$ Cột 3 (né 1 $\Rightarrow 3$) | **108 cách** |
| **Bài 3.3 (Lưới 11 ô)** | $(3 \times 2 \text{ lõi}) + 1 \text{ đuôi} + (2 \times 2 \text{ phải})$ | Khối Trái ($12 \times 7 \times 7 \times 3 = 1764$) $\times$ Khối Phải chuyển tiếp ($7 \times 7 = 49$) | **86.436 cách** |
| **Bài 3.11 (Lưới 8 ô)** | $(3 \times 2 \text{ lõi}) + 1 \text{ đuôi}$ | Lõi $3 \times 2$ ($588$) $\times$ Ô đuôi (né 1 ô $\Rightarrow 3$) | **1764 cách** |
| **Bài 3.12 (Lưới 9 ô thắt eo)** | $2 \times 2 \text{ trái} \rightarrow 1 \text{ cầu} \rightarrow 2 \times 2 \text{ phải}$ | Khối Trái ($84$) $\times$ Cầu ($3$) $\times$ Cột 4 ($3 \times 3 = 9$) $\times$ Cột 5 ($7$) | **15.876 cách** |
