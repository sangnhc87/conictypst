#import "../_config.typ": *

#chapter([Vật thể đáy xác định — Mặt cắt chuẩn], theme-color: c-p4)

#phuongphap(theme-color: c-p4)[
  *Nguyên lý Cavalieri và thiết diện cắt lát:*
  Xét một vật thể nằm giữa hai mặt phẳng vuông góc với trục $O x$ tại $x = a$ và $x = b$. Cắt vật thể bởi một mặt phẳng vuông góc với trục $O x$ tại vị trí $x$ ($a <= x <= b$) thu được thiết diện có diện tích tương ứng là $S(x)$.
  Nếu hàm số $S(x)$ liên tục trên đoạn $[a, b]$, thể tích $V$ của vật thể được tính bởi công thức:
  $
    V = integral_a^b S(x) d x
  
  $
  *Chú ý:* Khác với thể tích khối tròn xoay, công thức này *không* tự động chứa hệ số $pi$. Hệ số $pi$ chỉ xuất hiện nếu hình dạng của thiết diện có chứa hình tròn hoặc hình quạt tròn.

  *Các dạng diện tích thiết diện phổ biến:*
  - Thiết diện là hình vuông cạnh $s(x)$: $S(x) = s^2(x)$.
  - Thiết diện là hình tam giác đều cạnh $s(x)$: $S(x) = frac(sqrt{3}, 4) s^2(x)$.
  - Thiết diện là hình tròn bán kính $r(x)$: $S(x) = pi r^2(x)$.
  - Thiết diện là hình tam giác vuông cân có cạnh góc vuông $s(x)$: $S(x) = frac(1, 2) s^2(x)$.
]

#topic([Lều bạt và Mái vòm — Mặt cắt vuông / bán cầu], prefix: "Bài", theme-color: c-p4)

#dang([Vật thể có đáy hình phẳng, mặt cắt là hình vuông], theme-color: c-p4)

#ghinho(theme-color: c-p4)[
  Đối với vật thể có đáy giới hạn bởi các đường cong và thiết diện vuông góc trục hoành là hình vuông:
  1. Xác định độ dài cạnh hình vuông $s(x)$ tại vị trí $x$ (thông thường bằng khoảng cách từ đường biên trên đến đường biên dưới đáy).
  2. Lập công thức diện tích: $S(x) = s^2(x)$.
  3. Tính tích phân: $V = integral_a^b S(x) d x$.
]

#vd(
  [Một lều bạt dã ngoại có đáy đặt trên mặt đất được mô tả bởi một hình phẳng giới hạn bởi đường cong $y = sqrt{9 - x^2}$ và trục hoành $O x$ (với $x in [-3; 3]$, đơn vị đo tính bằng mét). Mỗi thiết diện cắt bởi mặt phẳng vuông góc với trục $O x$ tại hoành độ $x$ là một hình vuông có cạnh nằm trên đáy. Tính thể tích không gian bên trong chiếc lều bạt đó.],
  loigiai: [
    Thiết diện vuông góc với trục $O x$ tại điểm có hoành độ $x$ (với $x in [-3; 3]$) là một hình vuông.
    - Cạnh của hình vuông này nằm trên hình phẳng đáy và có độ dài bằng tung độ của đường biên:
      $
        s(x) = sqrt{9 - x^2}
      
      $
    - Diện tích của thiết diện hình vuông tương ứng là:
      $
        S(x) = [s(x)]^2 = (sqrt{9 - x^2})^2 = 9 - x^2
      
      $
    - Thể tích của không gian bên trong chiếc lều bạt là:
      $
        V = integral_(-3)^3 S(x) d x = integral_(-3)^3 (9 - x^2) d x
      
      $
    Do hàm số dưới dấu tích phân là hàm chẵn, ta có:
    $
      V = 2 integral_0^3 (9 - x^2) d x = 2 [ 9x - frac(x^3, 3) ]_0^3 \
      V = 2 [ (9 dot 3 - frac(3^3, 3)) - 0 ] = 2 [ 27 - 9 ] = 2 dot 18 = 36 " (m"^3")"
    
    $
    Vậy thể tích không gian chiếc lều bạt là $36$ $"m"^3$.
  ],
  theme-color: c-p4,
)

#dang([Mái vòm hội trường — Mặt cắt là hình tròn hoặc bán cầu], theme-color: c-p4)

#ghinho(theme-color: c-p4)[
  Khi tính thể tích của một mái vòm bán cầu hoặc chóp cầu bằng phương pháp cắt lát ngang:
  - Chọn trục thẳng đứng $O z$ (hoặc $O y$) làm trục tích phân.
  - Sử dụng định lý Pythagore để xác định bán kính của lát cắt tròn tại độ cao $y$.
  - Lập công thức diện tích tròn: $S(y) = pi r^2(y)$.
]

#vd(
  [Một mái hội trường lớn có dạng hình bán cầu với bán kính $R = 20$ m. Sử dụng phương pháp thiết diện (cắt bằng các mặt phẳng nằm ngang song song với mặt sàn), tính thể tích phần không gian phía dưới mái vòm bán cầu này.],
  loigiai: [
    Thiết lập trục thẳng đứng $O y$ vuông góc với mặt sàn, gốc tọa độ $O$ trùng với tâm của sàn hình tròn của hội trường.
    - Chiều cao của mái vòm chạy từ mặt sàn $y = 0$ đến đỉnh mái vòm $y = 20$ m.
    - Cắt mái vòm bởi một mặt phẳng nằm ngang ở độ cao $y$ ($0 <= y <= 20$), ta thu được thiết diện là một hình tròn có bán kính $r(y)$.
    - Theo định lý Pythagore trong tam giác vuông tạo bởi tâm cầu, tâm thiết diện và một điểm trên mặt cầu:
      $
        r^2(y) + y^2 = R^2  wide  =>  wide  r^2(y) = 20^2 - y^2 = 400 - y^2
      
      $
    - Diện tích của thiết diện tròn ở độ cao $y$ là:
      $
        S(y) = pi r^2(y) = pi (400 - y^2)
      
      $
    - Thể tích của phần không gian dưới mái vòm là tích phân diện tích thiết diện theo độ cao $y$:
      $
        V = integral_0^(20) S(y) d y = integral_0^(20) pi (400 - y^2) d y
      
      $
    Tính tích phân:
    $
      V = pi [ 400y - frac(y^3, 3) ]_0^(20) = pi [ (400 dot 20 - frac(20^3, 3)) - 0 ] \
      V = pi [ 8000 - frac(8000, 3) ] = pi dot frac(16000, 3) approx 16755.16 " (m"^3")"
    
    $
    (Đúng bằng công thức tính thể tích bán cầu: $V = frac(2, 3) pi R^3 = frac(2, 3) pi dot 20^3 = frac(16000, 3) pi$).

    Vậy thể tích không gian phía dưới mái vòm bán cầu là $frac(16000, 3)pi approx 16755.16$ $"m"^3$.
  ],
  theme-color: c-p4,
)

#topic([Khối nêm và Hình dạng phi chuẩn], prefix: "Bài", theme-color: c-p4)

#dang([Vật thể có mặt cắt là tam giác vuông hoặc tam giác đều], theme-color: c-p4)

#ghinho(theme-color: c-p4)[
  Khi thiết diện là tam giác vuông cân cạnh góc vuông là $s(x)$:
  $
    S(x) = frac(1, 2) s^2(x)
  
  $
  Thay biểu thức của $s(x)$ vào để lập tích phân và tính thể tích.
]

#vd(
  [Một khối nêm gỗ dùng để chèn bánh xe ô tô khi đỗ trên dốc có chiều dài dọc theo mặt đất là 20 cm. Khi cắt khối nêm gỗ này bởi mặt phẳng vuông góc với mặt đất và cách đầu nhọn một khoảng $x$ cm ($0 <= x <= 20$), thiết diện thu được là một hình tam giác vuông cân có cạnh góc vuông có độ dài biến thiên tuyến tính $s(x) = frac(20-x, 5)$ (cm). Tính thể tích của khối nêm gỗ đó.],
  loigiai: [
    Thiết diện cắt vuông góc với trục nằm dọc cách đầu nhọn một khoảng $x$ là một tam giác vuông cân có cạnh góc vuông là $s(x) = frac(20-x, 5)$ cm.
    - Diện tích của thiết diện tam giác vuông cân là:
      $
        S(x) = frac(1, 2) [s(x)]^2 = frac(1, 2) (frac(20 - x, 5))^2 = frac(1, 50) (20 - x)^2 " (cm"^2")"
      
      $
    - Thể tích của khối nêm gỗ được tính bằng tích phân diện tích thiết diện từ $0$ đến $20$:
      $
        V = integral_0^(20) S(x) d x = integral_0^(20) frac(1, 50) (20 - x)^2 d x
      
      $
    Khai triển đa thức dưới dấu tích phân:
    $
      V = frac(1, 50) integral_0^(20) (400 - 40x + x^2) d x
    
    $
    Tính nguyên hàm và thế cận:
    $
      V = frac(1, 50) [ 400x - 20x^2 + frac(x^3, 3) ]_0^(20) \
      V = frac(1, 50) [ (400 dot 20 - 20 dot 20^2 + frac(20^3, 3)) - 0 ] \
      V = frac(1, 50) [ 8000 - 8000 + frac(8000, 3) ] = frac(1, 50) dot frac(8000, 3) = frac(160, 3) approx 53.33 " (cm"^3")"
    
    $
    Vậy thể tích của khối nêm gỗ chặn bánh xe là $frac(160, 3) approx 53.33$ $"cm"^3$.
  ],
  theme-color: c-p4,
)
