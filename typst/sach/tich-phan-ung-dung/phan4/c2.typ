#import "../_config.typ": *

#chapter([Chất lỏng trong Bồn chứa], theme-color: c-p4)

#phuongphap(theme-color: c-p4)[
  *Nguyên lý mực nước tích lũy:*
  Đối với một bồn chứa chất lỏng có hình dạng tiết diện ngang thay đổi theo chiều cao $y$ (tính từ đáy bồn $y = 0$):
  - Gọi $A(y)$ là diện tích thiết diện ngang của bồn chứa tại độ cao $y$.
  - Khi đổ chất lỏng vào bồn đạt đến mực nước có độ cao là $H$, thể tích chất lỏng $V(H)$ trong bồn được tính bằng tích phân diện tích thiết diện theo chiều cao:
    $
      V(H) = integral_0^H A(y) d y
    
    $

  *Ứng dụng 1: Bồn hình trụ tròn xoay nằm ngang*
  Bồn có chiều dài $L$ và bán kính đáy $R$. Mặt cắt dọc của bồn là hình chữ nhật, mặt cắt ngang là hình tròn. Khi đổ nước đến mực nước cao $h$ ($0 <= h <= 2R$):
  - Thể tích chất lỏng là $V = L dot S_{"viên phân"}$, với $S_{"viên phân"}$ là diện tích phần hình tròn ngập trong nước.
  - Lập tích phân theo trục đứng: $S_{"viên phân"} = integral_0^h 2 sqrt{R^2 - (y - R)^2} d y = integral_0^h 2 sqrt{2R y - y^2} d y$.
  - *Giải pháp thực tế:* Thay vì tính tích phân lượng giác phức tạp, ta dùng hình học để tính diện tích hình viên phân: hiệu diện tích hình quạt tròn và hình tam giác đối xứng.

  *Ứng dụng 2: Bồn hình nón ngược (đỉnh ở dưới, miệng ở trên)*
  Bồn có chiều cao $H_0$ và bán kính miệng $R_0$.
  - Ở độ cao $y$ tính từ đỉnh nón, bán kính mặt cắt nước là $r(y) = frac(R_0, H_0) y$ (do tam giác đồng dạng).
  - Diện tích thiết diện ngang: $A(y) = pi r^2(y) = pi lr(frac(R_0, H_0))^2 y^2$.
  - Thể tích chất lỏng ở độ cao $h$:
    $
      V(h) = integral_0^h pi lr(frac(R_0, H_0))^2 y^2 d y = frac(pi R_0^2, 3 H_0^2) h^3
    
    $
]

#topic([Bồn trụ nằm ngang và Bồn chứa xăng], prefix: "Bài", theme-color: c-p4)

#dang([Tính thể tích xăng còn lại trong bồn trụ nằm ngang], theme-color: c-p4)

#ghinho(theme-color: c-p4)[
  Khi tính thể tích chất lỏng trong bồn trụ nằm ngang:
  1. Xác định bán kính bồn $R$ và chiều dài $L$.
  2. Xác định vị trí mặt nước so với tâm bồn (khoảng cách $d = |h - R|$).
  3. Sử dụng hình học phẳng tính diện tích hình viên phân ướt $S_{"ướt"}$.
  4. Tính thể tích chất lỏng: $V = L dot S_{"ướt"}$.
]

#vd(
  [Một bồn chứa xăng hình trụ tròn xoay nằm ngang có bán kính đáy $R = 1$ m và chiều dài $L = 4$ m. Thước đo mực xăng chỉ ra rằng chiều cao mực xăng đo từ đáy bồn lên là $0.6$ m. Tính thể tích xăng hiện tại có trong bồn (làm tròn kết quả đến hàng phần trăm mét khối).],
  loigiai: [
    Mặt cắt dọc của bồn chứa là một hình tròn tâm $O$ bán kính $R = 1$ m. Mực xăng cao $h = 0.6$ m từ đáy bồn.
    - Do $h = 0.6 < R = 1$ m nên mặt xăng nằm dưới tâm bồn $O$. Khoảng cách từ tâm $O$ đến mặt xăng là:
      $
        d = R - h = 1 - 0.6 = 0.4 " (m)"
      
      $
    - Kẻ dây cung $A B$ nằm ngang đại diện cho mặt xăng. Gọi $M$ là trung điểm của $A B$. Tam giác $O A M$ vuông tại $M$ có:
      - Cạnh huyền $O A = R = 1$ m.
      - Cạnh góc vuông $O M = d = 0.4$ m.
      - Độ dài nửa dây cung là:
        $
          A M = sqrt{O A^2 - O M^2} = sqrt{1^2 - 0.4^2} = sqrt{0.84} approx 0.917 " (m)"
        
        $
    - Góc ở tâm $hat{A O B} = alpha$:
      $
        cos frac(alpha, 2) = frac(O M, O A) = frac(0.4, 1) = 0.4  wide  =>  wide  frac(alpha, 2) approx 1.159 " rad"  wide  =>  wide  alpha approx 2.319 " rad"
      
      $
    - Diện tích hình quạt tròn $O A B$ là:
      $
        S_{"quạt"} = frac(1, 2) R^2 alpha approx frac(1, 2) dot 1^2 dot 2.319 = 1.1595 " (m"^2")"
      
      $
    - Diện tích tam giác $O A B$ là:
      $
        S_{triangle O A B} = frac(1, 2) A B dot O M = A M dot O M approx 0.9165 dot 0.4 = 0.3666 " (m"^2")"
      
      $
    - Diện tích phần hình tròn trống (không chứa xăng, hình viên phân nhỏ phía trên mặt nước nhưng dưới tâm):
      $
        S_{"trống"} = S_{"quạt"} - S_{triangle O A B} approx 1.1595 - 0.3666 = 0.7929 " (m"^2")"
      
      $
    - Diện tích phần hình tròn ngập xăng (phần dưới dây cung $A B$):
      $
        S_{"ướt"} = S_{"tròn"} - S_{"trống"} = pi R^2 - S_{"trống"} approx 3.1416 dot 1^2 - 0.7929 = 2.3487 " (m"^2")"
      
      $
    - Thể tích xăng còn trong bồn là:
      $
        V = L dot S_{"ướt"} approx 4 dot 2.3487 = 9.39 " (m"^3")"
      
      $
    Vậy thể tích xăng còn lại trong bồn khoảng $9.39$ $"m"^3$ (tức khoảng $9390$ lít).
  ],
  theme-color: c-p4,
)

#dang([Bài toán ngược: Tìm mực chất lỏng khi biết thể tích], theme-color: c-p4)

#ghinho(theme-color: c-p4)[
  Khi biết thể tích xăng $V_0$, để tìm mực xăng $H$, ta giải phương trình $V(H) = V_0$. Đây là bài toán thường giải bằng cách lập phương trình tích phân hoặc công thức hình học rồi sử dụng máy tính cầm tay tìm nghiệm xấp xỉ.
]

#topic([Bồn hình chóp nón và Viên phân cầu], prefix: "Bài", theme-color: c-p4)

#dang([Thể tích chất lỏng trong bồn hình nón ngược], theme-color: c-p4)

#ghinho(theme-color: c-p4)[
  Đối với bồn hình nón ngược đỉnh ở dưới có chiều cao $H$ và bán kính miệng $R$:
  Mặt cắt ngang của bồn tại độ cao $y$ ($0 <= y <= h$) là hình tròn diện tích $A(y) = pi r^2(y) = pi lr(frac(R, H))^2 y^2$.
  Thể tích nước cao $h$ trong bồn là:
  $
    V = integral_0^h pi lr(frac(R, H))^2 y^2 d y = frac(pi R^2 h^3, 3 H^2)
  
  $
]

#vd(
  [Một bể chứa nước có dạng hình nón ngược, đỉnh ở dưới, bán kính miệng bể là $R = 2$ m, chiều cao của bể là $H = 3$ m. Khi đổ nước vào bể đến khi mực nước đạt độ cao $h = 1.5$ m (tính từ đỉnh dưới của bể), hãy tính thể tích nước có trong bể (lấy kết quả chính xác theo $pi$).],
  loigiai: [
    Gọi $y$ (m, $0 <= y <= 1.5$) là độ cao của mặt cắt nước tính từ đỉnh của hình nón ngược.
    - Bán kính thiết diện tròn của mực nước ở độ cao $y$ là $r(y)$. Theo hệ thức tam giác đồng dạng, ta có:
      $
        frac(r(y), y) = frac(R, H) = frac(2, 3)  wide  =>  wide  r(y) = frac(2, 3) y
      
      $
    - Diện tích thiết diện ngang tại cao độ $y$ là:
      $
        A(y) = pi r^2(y) = pi lr( frac(2, 3) y )^2 = frac(4 pi, 9) y^2
      
      $
    - Thể tích nước trong bể khi mực nước cao $h = 1.5$ m là:
      $
        V = integral_0^(1.5) A(y) d y = integral_0^(1.5) frac(4 pi, 9) y^2 d y
      
      $
    Tính nguyên hàm và thế cận:
    $
      V = frac(4 pi, 9) lr[ frac(y^3, 3) ]_0^(1.5) = frac(4 pi, 27) y^3 |_0^{1.5} \
      V = frac(4 pi, 27) dot (1.5)^3 - 0 = frac(4 pi, 27) dot 3.375 = frac(4 pi, 27) dot frac(27, 8) = frac(pi, 2) approx 1.57 " (m"^3")"
    
    $
    Vậy thể tích nước trong bể hình nón ngược khi mực nước cao $1.5$ m là $frac(pi, 2)$ $"m"^3$.
  ],
  theme-color: c-p4,
)
