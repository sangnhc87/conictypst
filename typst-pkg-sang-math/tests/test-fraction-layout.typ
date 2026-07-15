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

#context {
  let large = measure(box[$1/2$])
  let explicit-large = measure(box[$dfrac(1, 2)$])
  let small = measure(box[$tfrac(1, 2)$])
  let exponent = measure(box[$x^(a/b)$])
  let explicit-small-exponent = measure(box[$x^tfrac(a, b)$])
  assert(large.height > small.height, message: "Phân số mặc định phải lớn hơn tfrac")
  assert(explicit-large.height > small.height, message: "dfrac phải lớn hơn tfrac")
  assert(exponent.height < large.height, message: "Phân số trong số mũ phải tự chuyển sang script style")
  assert(calc.abs(exponent.height - explicit-small-exponent.height) < 2pt, message: "Số mũ a/b phải gần kích thước tfrac")
}
