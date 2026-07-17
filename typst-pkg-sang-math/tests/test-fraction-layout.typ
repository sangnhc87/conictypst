#import "../lib.typ": sang-setup, dfrac, tfrac, tfrac-tex

#set page(width: 12cm, height: auto, margin: 12mm)
#set text(size: 12pt)
#set par(leading: 0.5em)
#show: sang-setup

= Fraction layout contract

Không có dòng trống giữa các dòng sau:

- Phân số lớn mặc định: $a/b$
- Hai tầng: $(a/b)/(c/d)$
- Lệnh dfrac: $dfrac(x + 1, x - 1)$
- Lệnh tfrac nhỏ có chủ ý: $tfrac(1, 2)$
- Phân số trong số mũ tự thu nhỏ: $x^(a/b)$ (đối chiếu $x^tfrac(a, b)$)
- Dòng chữ bình thường ngay sau phân số.

Đoạn sát dòng một có $a/b$ ở giữa câu.
Đoạn sát dòng hai có $(x + 1)/(x - 1)$ ở giữa câu.
Đoạn sát dòng ba không được chạm dòng trên.

Phân số lồng sát dòng một: $(a/b)/(c/d)$.
Phân số lồng sát dòng hai: $((x + 1)/(x - 1))/((x + 2)/(x - 2))$.
Dòng sau phân số lồng vẫn phải tách rõ ràng.

#box[A] <plain-before> $x^2 + 1$ #box[B] <plain-after>
#box[A] <frac-before> $x/2$ #box[B] <frac-after>

#context {
  let canvas-compat = sys.inputs.at("sang-math-canvas-compat", default: "0") == "1"
  let large = measure(box[$1/2$])
  let explicit-large = measure(box[$dfrac(1, 2)$])
  let small = measure(box[$tfrac(1, 2)$])
  let exponent = measure(box[$x^(a/b)$])
  let explicit-small-exponent = measure(box[$x^tfrac(a, b)$])
  let marker-y(label) = query(label).first().location().position().y
  assert(large.height > small.height, message: "Phân số mặc định phải lớn hơn tfrac")
  assert(explicit-large.height > small.height, message: "dfrac phải lớn hơn tfrac")
  if not canvas-compat {
    assert(exponent.height < large.height, message: "Phân số trong số mũ phải tự chuyển sang script style")
    assert(calc.abs(exponent.height - explicit-small-exponent.height) < 2pt, message: "Số mũ a/b phải gần kích thước tfrac")
  }
  assert(calc.abs(marker-y(<plain-before>) - marker-y(<plain-after>)) < 1pt, message: "Công thức thường phải nằm cùng dòng với văn bản")
  assert(calc.abs(marker-y(<frac-before>) - marker-y(<frac-after>)) < 1pt, message: "Phân số phải nằm cùng dòng với văn bản")
}
