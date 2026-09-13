#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#bai("SỐ GẦN ĐÚNG VÀ SAI SỐ", mau: C5)

#ly-thuyet(tieu-de: "A. LÝ THUYẾT CẦN NHỚ", mau: C5)[
  - *Số gần đúng*: Trong thực tế đo đạc hoặc tính toán, ta thường không thể nhận được giá trị đúng (kí hiệu là $overline(a)$) mà chỉ nhận được số gần đúng (kí hiệu là $a$).
  - *Sai số tuyệt đối*: Giá trị $Delta_a = |overline(a) - a|$ gọi là sai số tuyệt đối của số gần đúng $a$.
  - *Độ chính xác của số gần đúng*: Nếu $Delta_a = |overline(a) - a| <= d$ thì ta nói $a$ là số gần đúng của $overline(a)$ với độ chính xác $d$. Ta viết: $overline(a) = a plus.minus d$ hoặc $a - d <= overline(a) <= a + d$.
  - *Sai số tương đối*: Tỉ số $delta_a = (Delta_a)/|a| <= d/|a|$ gọi là sai số tương đối của số gần đúng $a$.
  - *Quy tắc quy tròn*:
    - Nếu chữ số sau hàng quy tròn nhỏ hơn $5$ thì ta giữ nguyên chữ số ở hàng quy tròn và thay các chữ số sau đó bằng các chữ số $0$ (nếu ở phần nguyên) hoặc bỏ đi (nếu ở phần thập phân).
    - Nếu chữ số sau hàng quy tròn lớn hơn hoặc bằng $5$ thì ta tăng chữ số ở hàng quy tròn thêm $1$ đơn vị và thay các chữ số sau đó bằng các chữ số $0$ hoặc bỏ đi.
  - *Quy tắc làm tròn số gần đúng với độ chính xác $d$*:
    - Xác định hàng của độ chính xác $d$ (hàng lớn nhất có chữ số khác 0 của $d$).
    - Quy tròn số gần đúng $a$ đến hàng lớn hơn hàng của $d$ một bậc.
]

#dang("Số gần đúng và sai số", mau: C5)

#bai-tap-tu-luan(mau: C5)[
  #bt-item(1, [Viết số quy tròn của mỗi số gần đúng sau với độ chính xác $d$:
    + $30,2376$ với $d = 0,009$.
    + $2,3512082$ với $d = 0,0008$.
  ], loigiai: [
    - a) Hàng của độ chính xác $d = 0,009$ là hàng phần nghìn, nên ta quy tròn đến hàng phần trăm: $30,24$.
    - b) Hàng của độ chính xác $d = 0,0008$ là hàng phần chục nghìn, nên ta quy tròn đến hàng phần nghìn: $2,351$.
  ])

  #bt-item(2, [Thực hiện các yêu cầu sau:
    + Quy tròn số $a = 2841275$ với độ chính xác $d = 300$.
    + Quy tròn số $a = 3,1463$ biết $a = 3,1463 plus.minus 0,001$.
  ], loigiai: [
    - a) $d = 300$ ở hàng trăm nên ta quy tròn đến hàng nghìn: $2841000$.
    - b) $d = 0,001$ ở hàng phần nghìn nên quy tròn đến hàng phần trăm: $3,15$.
  ])
]

#bai-tap-trac-nghiem(mau: C5)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 8, reset-counter: true)

#tn(
  dir: "ngang",
  [Cho số gần đúng $a = 23748023$ với độ chính xác $d = 101$. Số quy tròn của $a$ là:],
  (
    [$23749000$.],
    True([$23748000$.]),
    [$23748000$.],
    [$23747000$.],
  ),
  loigiai: [Hàng lớn nhất của $d$ là hàng trăm, do đó quy tròn đến hàng nghìn: $23748000$. Chọn B.]
)

#tn(
  dir: "ngang",
  [Khi quy tròn số $a = 3,14159$ đến hàng phần trăm, ta được số:],
  (
    [$3,141$.],
    [$3,15$.],
    True([$3,14$.]),
    [$3,142$.],
  ),
  loigiai: [Chữ số ở hàng phần nghìn là $1 < 5$ nên làm tròn thành $3,14$. Chọn C.]
)

#tn(
  dir: "ngang",
  [Cho biết $sqrt(3) = 1,7320508 dots$ Số quy tròn của $sqrt(3)$ với độ chính xác $0,005$ là:],
  (
    [$1,732$.],
    [$1,7$.],
    True([$1,73$.]),
    [$1,74$.],
  ),
  loigiai: [Độ chính xác $d = 0,005$ ở hàng phần nghìn, ta quy tròn đến hàng phần trăm: $1,73$. Chọn C.]
)

#tn(
  dir: "ngang",
  [Đo chiều cao một ngọn đồi là $h = 347,13" m" plus.minus 0,2" m"$. Số quy tròn của chiều cao ngọn đồi là:],
  (
    [$347,1" m"$.],
    True([$347" m"$.]),
    [$347,2" m"$.],
    [$350" m"$.],
  ),
  loigiai: [$d = 0,2$ ở hàng phần mười, quy tròn đến hàng đơn vị: $347$. Chọn B.]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 2, reset-counter: true)

#ds(
  [Cho số gần đúng $a = 15,318$ với độ chính xác $d = 0,05$. Xét tính đúng sai:],
  (
    True([Chữ số hàng phần mười là $3$.]),
    True([Hàng lớn nhất của độ chính xác $d$ là hàng phần trăm.]),
    True([Số quy tròn của $a$ đến hàng phần mười là $15,3$.]),
    [Số quy tròn của $a$ là $15,32$.],
  ),
  loigiai: [
    - a) Đúng.
    - b) Đúng: $0,05$ ở hàng phần trăm.
    - c) Quy tròn đến hàng phần mười (hàng liền trước hàng phần trăm) được $15,3$. Đúng.
    - d) Sai vì $15,32$ là làm tròn đến hàng phần trăm.
  ]
)

#ds(
  [Một thửa ruộng có diện tích được đo là $S = 1250 plus.minus 5" m"^2$. Xét tính đúng sai:],
  (
    True([Giá trị đúng của diện tích nằm trong đoạn $[1245; 1255]$.]),
    True([Độ chính xác của phép đo là $d = 5" m"^2$.]),
    [Sai số tương đối không vượt quá $1%$.],
    True([Số quy tròn của diện tích là $1250$.]),
  ),
  loigiai: [
    - a) $1250 - 5 = 1245$ và $1250 + 5 = 1255$. Đúng.
    - b) Đúng.
    - c) $delta <= 5/1250 = 0,004 = 0,4% < 1%$. Đúng.
    - d) Đúng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 3, reset-counter: true)

#tln(
  dir: "ngang",
  [Làm tròn số $2841275$ với độ chính xác $d = 300$. Số làm tròn đến hàng nghìn có chữ số hàng nghìn bằng bao nhiêu?],
  [1],
  loigiai: [Số quy tròn là $2841000$, chữ số hàng nghìn là 1.]
)

#tln(
  dir: "ngang",
  [Quy tròn số $3,1463$ với độ chính xác $d = 0,001$ ta được số thập phân có bao nhiêu chữ số ở phần thập phân?],
  [2],
  loigiai: [Quy tròn đến hàng phần trăm được $3,15$, có 2 chữ số ở phần thập phân.]
)

#tln(
  dir: "ngang",
  [Tính sai số tuyệt đối khi làm tròn số $pi approx 3,14159$ thành $3,14$ (làm tròn đến $5$ chữ số thập phân).],
  [0,00159],
  loigiai: [$Delta = |3,14159 - 3,14| = 0,00159$.]
)
