#import "_config.typ": *

#q-wrap(dir: "doc", tln(
  fig-pos: "center",
  fig-width: 35%,
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let r = 2
    let points = ()
    for i in range(12) {
      let angle = 90deg - i * 30deg
      points.push((r * calc.cos(angle), r * calc.sin(angle)))
    }
    line(..points, close: true, stroke: 1pt + black)
    for i in range(12) {
      let angle = 90deg - i * 30deg
      let x = r * calc.cos(angle)
      let y = r * calc.sin(angle)
      circle((x, y), radius: 0.05, fill: black)
      let label-angle = angle
      let label-x = (r + 0.4) * calc.cos(label-angle)
      let label-y = (r + 0.4) * calc.sin(label-angle)
      content((label-x, label-y), [$A_#(i+1)$])
    }
  }),
  [Một khung hình trang trí có dạng một đa giác đều 12 cạnh $A_1 A_2 ... A_{12}$ (xem hình dưới) được gắn cố định trên một trần nhà. Bạn Dũng có 12 bóng đèn gồm bốn bóng màu đỏ và tám bóng màu xanh, có công suất đôi một khác nhau. Bạn Dũng lắp ngẫu nhiên 12 bóng đèn trên vào 12 đỉnh $A_1, A_2, ..., A_{12}$ sao cho mỗi đỉnh có đúng một bóng đèn. Gọi $P$ là xác suất để mỗi hình vuông (có bốn đỉnh là các đỉnh của đa giác đã cho) đều có ít nhất một bóng đèn màu đỏ. Giá trị của $4565P$ bằng bao nhiêu?],
  [2656],
  loigiai: [
    Đa giác đều $12$ cạnh có $12$ đỉnh. Một hình vuông có các đỉnh là các đỉnh của đa giác khi và chỉ khi $4$ đỉnh đó chia đường tròn ngoại tiếp đa giác thành $4$ cung bằng nhau. Mỗi cung chắn $12/4 = 3$ cạnh. \
    Do đó, có đúng $12 / 4 = 3$ hình vuông được tạo thành từ các đỉnh của đa giác, gọi là $S_1, S_2, S_3$. Cụ thể, các hình vuông đó là:
    $ S_1 = {A_1, A_4, A_7, A_{10}}, quad S_2 = {A_2, A_5, A_8, A_{11}}, quad S_3 = {A_3, A_6, A_9, A_{12}} $
    Mỗi đỉnh của đa giác thuộc đúng một hình vuông.
    
    Không gian mẫu là số cách xếp $12$ bóng đèn (có công suất đôi một khác nhau, nên $12$ bóng đèn là phân biệt) vào $12$ đỉnh. Tuy nhiên, để tính xác suất, ta chỉ cần quan tâm đến vị trí của $4$ bóng đèn màu đỏ. Số cách chọn $4$ đỉnh để lắp $4$ bóng đèn đỏ là:
    $ n(Omega) = C_{12}^4 = 495 $
    
    Gọi $A$ là biến cố: "Mỗi hình vuông đều có ít nhất một bóng đèn màu đỏ". \
    Gọi $x_1, x_2, x_3$ lần lượt là số bóng đèn đỏ được lắp vào các đỉnh của hình vuông $S_1, S_2, S_3$. \
    Ta có: $x_1 + x_2 + x_3 = 4$. \
    Vì mỗi hình vuông có ít nhất một bóng đèn màu đỏ nên $x_1 >= 1, x_2 >= 1, x_3 >= 1$. \
    Do $x_1, x_2, x_3$ là các số nguyên dương có tổng bằng $4$, nên bộ số $(x_1, x_2, x_3)$ phải là một hoán vị của $(2, 1, 1)$. \
    Có $3$ cách chọn hình vuông chứa $2$ bóng đèn đỏ. Giả sử hình vuông $S_1$ chứa $2$ bóng đèn đỏ, hai hình vuông còn lại mỗi hình vuông chứa $1$ bóng đèn đỏ:
    - Số cách chọn $2$ đỉnh trong $S_1$ để lắp bóng đỏ là $C_4^2 = 6$.
    - Số cách chọn $1$ đỉnh trong $S_2$ để lắp bóng đỏ là $C_4^1 = 4$.
    - Số cách chọn $1$ đỉnh trong $S_3$ để lắp bóng đỏ là $C_4^1 = 4$.
    
    Suy ra số cách phân bố $4$ vị trí bóng đèn đỏ thỏa mãn là:
    $ n(A) = 3 times 6 times 4 times 4 = 288 text(" (cách)") $
    
    Xác suất cần tìm là:
    $ P = (n(A))/(n(Omega)) = 288/495 = 32/55 $
    
    Vậy giá trị của $4565P$ là:
    $ 4565 times 32/55 = 83 times 32 = 2656. $
  ]
))
