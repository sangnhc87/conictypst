---
name: typst-to-scorm
description: Chuyển đổi mã nguồn Typst Toán THPT sang chuẩn SCORM (với KaTeX). Áp dụng cho các dự án trắc nghiệm môn Toán.
---

# Typst to SCORM Conversion

Skill này mô tả quy trình và quy chuẩn chuyển đổi mã nguồn Typst chứa công thức Toán THPT sang chuẩn SCORM (HTML tĩnh + SCORM API).

## 1. Cấu trúc Codebase
- Dự án: `sach/DECUONG12-HK1/`
- File biên dịch chính: `scorm/build_scorm.py` — quét `.typ`, parse câu hỏi, sinh gói SCORM Zip.
- File parser: `scorm/parse_typ.py` — trích xuất stem/options/solution từ `#tn(...)`, `#ds(...)`, `#tln(...)`.
- Output: `scorm/output/*.zip` — 26 gói SCORM, mỗi gói cho một bộ đề.

## 2. Ánh xạ Ký hiệu Toán học Typst → KaTeX (Toàn diện)

### 2a. Hàm với đối số `(...)` → được xử lý bởi `balance_paren_args()`:

| Typst | KaTeX |
|-------|-------|
| `arrow(AB)`, `vect(AB)`, `vec(AB)` | `\overrightarrow{AB}` |
| `hat(BAC)` (≥2 ký tự) | `\widehat{BAC}` |
| `hat(x)` (1 ký tự) | `\hat{x}` |
| `tilde(x)` | `\widetilde{x}` |
| `bold(a)` | `\boldsymbol{a}` |
| `upright(x)` | `\mathrm{x}` |
| `cal(A)` | `\mathcal{A}` |
| `overline(AB)` | `\overline{AB}` |
| `frac(a, b)`, `dfrac(a, b)` | `\dfrac{a}{b}` |
| `frac(a, b)^2` | `{\dfrac{a}{b}}^2` (bọc lại) |
| `sqrt(x)` | `\sqrt{x}` |
| `root(n, x)` | `\sqrt[n]{x}` |
| `mat(1,2;3,4)` | `\begin{pmatrix}1 & 2 \\ 3 & 4\end{pmatrix}` |
| `floor(x)` | `\lfloor x \rfloor` |
| `ceil(x)` | `\lceil x \rceil` |
| `abs(x)` | `\left|x\right|` |
| `norm(x)` | `\left\|x\right\|` |
| `C(n, k)` | `C_{n}^{k}` |
| `A(n, k)` | `A_{n}^{k}` |
| `P(n)` | `P_{n}` |
| `binom(n, k)` | `\binom{n}{k}` |
| `underbrace(x, "text")` | `\underbrace{x}_{text}` |
| `cases(a,b)`, `heva(a,b)` | `\begin{cases} a \\ b \end{cases}` |
| `hoac(a,b)` | `\left[\begin{array}{l} a \\ b \end{array}\right.` |
| `limits(lim)` | `\lim\limits` |

### 2b. Ký hiệu Word-boundary (được xử lý bởi `replacements_ordered`):

| Typst | KaTeX |
|-------|-------|
| `integral`, `integral_0^1` | `\int` |
| `sum`, `sum_(i=1)^n` | `\sum` |
| `product` | `\prod` |
| `union`, `cup` | `\cup` |
| `sect`, `cap` | `\cap` |
| `in` | `\in` |
| `notin` | `\notin` |
| `subset`, `supset` | `\subset`, `\supset` |
| `RR`, `ZZ`, `NN`, `QQ`, `CC` | `\mathbb{R}`, `\mathbb{Z}`, ... |
| `oo`, `infty`, `infinity` | `\infty` |
| `pm`, `mp` | `\pm`, `\mp` |
| `times`, `div`, `cdot`, `dot` | `\times`, `\div`, `\cdot` |
| `degree` | `^\circ` |
| `perp`, `parallel`, `angle` | `\perp`, `\parallel`, `\angle` |
| `rightarrow`, `leftarrow`, `leftrightarrow` | `\rightarrow`, `\leftarrow`, `\leftrightarrow` |
| `Rightarrow`, `Leftarrow`, `Leftrightarrow` | (hoa) |
| `forall`, `exists`, `nexists` | `\forall`, `\exists`, `\nexists` |
| `land`, `lor`, `neg`, `not` | `\land`, `\lor`, `\neg` |
| `triangle`, `square`, `diamond` | `\triangle`, `\square`, `\diamond` |

### 2c. Literals (được xử lý bởi `str.replace()` trước regex):

| Typst | KaTeX |
|-------|-------|
| `<=>` | `\Leftrightarrow` |
| `=>` | `\Rightarrow` |
| `->` | `\to` |
| `<=` | `\le` |
| `>=` | `\ge` |
| `!=` | `\ne` |
| `+oo` | `+\infty` |
| `-oo` | `-\infty` |

### 2d. Hàm Toán học và Chữ Hy Lạp (thêm `\` tự động):
- Hàm: `sin`, `cos`, `tan`, `cot`, `arcsin/cos/tan/cot`, `sinh/cosh/tanh`, `log`, `ln`, `lim`, `exp`, `max`, `min`, `det`, `gcd`, `lcm`, `rank`, `tr`, `dim`, v.v.
- Hy Lạp: `alpha`, `beta`, `gamma`, `Gamma`, `delta`, `Delta`, `epsilon`, `varepsilon`, `theta`, `lambda`, `mu`, `pi`, `sigma`, `omega`, `Omega`, `phi`, `Phi`, `varphi`, v.v.

## 3. Render SVG cho BBT, Hình học và Bảng

`#my-bxd`, `#my-bbbt`, `#canvas`, `#table` → compile Typst → nhúng SVG inline (không phải `<img>`).
- Lệnh: `typst compile --root /typst tmp.typ tmp.svg`
- Nếu `draw-ellipse` lỗi: đây là function tùy chỉnh chưa có trong preamble — bỏ qua, tiếp tục build.

## 4. Parse Câu Hỏi (parse_typ.py)

### Quy tắc QUAN TRỌNG:
1. **KHÔNG BAO GIỜ** dùng `re.sub` đơn giản cho Typst block `#name[...]` — luôn dùng `_balance()`.
2. `_balance()` phải bỏ qua nội dung trong `$...$` khi đếm ngoặc.
3. `_strip_block_macros()` xử lý tất cả các macro block Typst: `#step`, `#align(...)`, `#text(...)`, `#grid(...)`, `#block(...)`, `#pad(...)`, `#par(...)`, `#box(...)`, `#strong(...)`, `#emph(...)`, v.v.
4. Giữ lại nội dung `[...]` bên trong, bỏ macro wrapper.

### Flow:
```
parse_file(filepath)
  → tìm #tn(...), #ds(...), #tln(...)
  → _extract_stem_and_opts() → stem, options, correct, answer_short
  → _get_loigiai() → solution text
  → _clean(raw) → _strip_block_macros() (Lưu ý: Không convert *bold* ở đây để bảo toàn cú pháp trong #table)
```

## 5. UI Quiz HTML

- Light mode (bắt buộc — SVG có nền trong suốt).
- TLN comparison thông minh: so sánh chuỗi normalize + so sánh số học (hỗ trợ `1/2` == `0.5`).
- Auto-scroll đến feedback sau khi kiểm tra.
- KaTeX re-render đáp án TLN sai.

## 6. Lỗi Hay Gặp & Fix

### `.]` rò rỉ sau `#step`
**Fix:** Dùng `_balance()` thay cho regex đơn giản.

### `integral`, `sum` không được thay
**Nguyên nhân:** `\bintegral\b` không match vì Typst viết `integral_0^1` — không có word boundary trước `_`.
**Fix:** Dùng lookahead: `r'\bintegral(?=\b|_|\^|\s)'`

### Hàm không được parse do trùng tên
**Ví dụ:** `balance_paren_args(inner, 'C')` cũng match `CC`, `Cong`, v.v.
**Fix:** Trong `balance_paren_args`, tìm đúng `func_name + '('` — dấu `(` ngay sau tên function sẽ phân biệt.

### Regex replacement value gây lỗi `bad escape`
**Nguyên nhân:** `re.sub(pattern, r'\leftarrow', ...)` — `\l` không phải escape hợp lệ.
**Fix:** Luôn dùng lambda: `re.sub(pattern, lambda m, v=v: v, inner)`.

### `+oo`, `-oo` gây `nothing to repeat` regex error
**Nguyên nhân:** `+` và `-` là ký tự đặc biệt trong regex.
**Fix:** Dùng `str.replace()` trước, không dùng `re.sub` cho literal operators.

### Double backslash `\\cup` trong output
**Nguyên nhân:** Lồng f-string làm `{{` → `{` nhưng `\\` → `\` không nhất quán.
**Fix:** Khi dùng tuple `(pattern, value)` với lambda, value là Python string bình thường, không cần raw string nếu đã dùng lambda.

### `#table` bị render thành plaintext và `*bold*` lỗi thành `*<strong>`
**Nguyên nhân:** `parse_typ.py` thay thế `*` thành HTML tag `<strong>` trước khi `build_scorm.py` bóc tách macro `#table` ra SVG. Khi đó, mã Typst của `#table` chứa `<strong>` không biên dịch được. `**đúng**` thì tạo thành `*<strong>`.
**Fix:** `parse_typ.py` chỉ làm nhiệm vụ lấy plain-text, không convert bold/italic. Chuyển thao tác biến `*bold*`, `_italic_` sang `build_scorm.py` và chạy SAU khi đã bóc tách toàn bộ macro SVG (bbt, canvas, table). Thêm hỗ trợ xử lý cả `**bold**`.

### Mất dấu ngoặc nhọn `{ }` trong tập hợp (vd: $RR \ {1}$)
**Nguyên nhân:** Trong Typst math, `{` và `}` khi đứng độc lập (không thuộc macro `#...`) được hiểu là dấu ngoặc nhọn hiển thị thực tế (literal braces). Tuy nhiên, khi chuyển sang KaTeX, `{}` lại mang ý nghĩa gom nhóm (grouping) và bị tàng hình.
**Fix:** Phải escape toàn bộ `{` và `}` thành `\{` và `\}` ngay từ đầu quy trình `_typst_math_to_latex`, TRƯỚC khi script tự chèn các macro của KaTeX (như `\dfrac{...}`). Sử dụng lookbehind `(?<!\\)` để không escape lại những dấu ngoặc đã được escape sẵn.

## 7. Lệnh Build

```bash
cd typst/sach/DECUONG12-HK1/scorm
python3 build_scorm.py
# Output: scorm/output/*.zip (26 files)
```
